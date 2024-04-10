; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94170 () Bool)

(assert start!94170)

(declare-fun b_free!21571 () Bool)

(declare-fun b_next!21571 () Bool)

(assert (=> start!94170 (= b_free!21571 (not b_next!21571))))

(declare-fun tp!76148 () Bool)

(declare-fun b_and!34321 () Bool)

(assert (=> start!94170 (= tp!76148 b_and!34321)))

(declare-fun mapNonEmpty!39754 () Bool)

(declare-fun mapRes!39754 () Bool)

(declare-fun tp!76147 () Bool)

(declare-fun e!607034 () Bool)

(assert (=> mapNonEmpty!39754 (= mapRes!39754 (and tp!76147 e!607034))))

(declare-datatypes ((V!38977 0))(
  ( (V!38978 (val!12741 Int)) )
))
(declare-datatypes ((ValueCell!11987 0))(
  ( (ValueCellFull!11987 (v!15353 V!38977)) (EmptyCell!11987) )
))
(declare-fun mapRest!39754 () (Array (_ BitVec 32) ValueCell!11987))

(declare-datatypes ((array!67747 0))(
  ( (array!67748 (arr!32577 (Array (_ BitVec 32) ValueCell!11987)) (size!33113 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67747)

(declare-fun mapKey!39754 () (_ BitVec 32))

(declare-fun mapValue!39754 () ValueCell!11987)

(assert (=> mapNonEmpty!39754 (= (arr!32577 _values!955) (store mapRest!39754 mapKey!39754 mapValue!39754))))

(declare-fun b!1064948 () Bool)

(declare-fun tp_is_empty!25381 () Bool)

(assert (=> b!1064948 (= e!607034 tp_is_empty!25381)))

(declare-fun b!1064949 () Bool)

(declare-fun e!607031 () Bool)

(declare-fun e!607036 () Bool)

(assert (=> b!1064949 (= e!607031 (not e!607036))))

(declare-fun res!710911 () Bool)

(assert (=> b!1064949 (=> res!710911 e!607036)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064949 (= res!710911 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16142 0))(
  ( (tuple2!16143 (_1!8082 (_ BitVec 64)) (_2!8082 V!38977)) )
))
(declare-datatypes ((List!22710 0))(
  ( (Nil!22707) (Cons!22706 (h!23915 tuple2!16142) (t!32027 List!22710)) )
))
(declare-datatypes ((ListLongMap!14111 0))(
  ( (ListLongMap!14112 (toList!7071 List!22710)) )
))
(declare-fun lt!469456 () ListLongMap!14111)

(declare-fun lt!469454 () ListLongMap!14111)

(assert (=> b!1064949 (= lt!469456 lt!469454)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38977)

(declare-fun minValue!907 () V!38977)

(declare-datatypes ((Unit!34936 0))(
  ( (Unit!34937) )
))
(declare-fun lt!469457 () Unit!34936)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38977)

(declare-datatypes ((array!67749 0))(
  ( (array!67750 (arr!32578 (Array (_ BitVec 32) (_ BitVec 64))) (size!33114 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67749)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!697 (array!67749 array!67747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38977 V!38977 V!38977 V!38977 (_ BitVec 32) Int) Unit!34936)

(assert (=> b!1064949 (= lt!469457 (lemmaNoChangeToArrayThenSameMapNoExtras!697 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3660 (array!67749 array!67747 (_ BitVec 32) (_ BitVec 32) V!38977 V!38977 (_ BitVec 32) Int) ListLongMap!14111)

(assert (=> b!1064949 (= lt!469454 (getCurrentListMapNoExtraKeys!3660 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064949 (= lt!469456 (getCurrentListMapNoExtraKeys!3660 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!710910 () Bool)

(assert (=> start!94170 (=> (not res!710910) (not e!607031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94170 (= res!710910 (validMask!0 mask!1515))))

(assert (=> start!94170 e!607031))

(assert (=> start!94170 true))

(assert (=> start!94170 tp_is_empty!25381))

(declare-fun e!607033 () Bool)

(declare-fun array_inv!25226 (array!67747) Bool)

(assert (=> start!94170 (and (array_inv!25226 _values!955) e!607033)))

(assert (=> start!94170 tp!76148))

(declare-fun array_inv!25227 (array!67749) Bool)

(assert (=> start!94170 (array_inv!25227 _keys!1163)))

(declare-fun b!1064950 () Bool)

(assert (=> b!1064950 (= e!607036 (bvsle #b00000000000000000000000000000000 (size!33114 _keys!1163)))))

(declare-fun lt!469455 () ListLongMap!14111)

(declare-fun getCurrentListMap!4031 (array!67749 array!67747 (_ BitVec 32) (_ BitVec 32) V!38977 V!38977 (_ BitVec 32) Int) ListLongMap!14111)

(assert (=> b!1064950 (= lt!469455 (getCurrentListMap!4031 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064951 () Bool)

(declare-fun res!710909 () Bool)

(assert (=> b!1064951 (=> (not res!710909) (not e!607031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67749 (_ BitVec 32)) Bool)

(assert (=> b!1064951 (= res!710909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064952 () Bool)

(declare-fun res!710912 () Bool)

(assert (=> b!1064952 (=> (not res!710912) (not e!607031))))

(declare-datatypes ((List!22711 0))(
  ( (Nil!22708) (Cons!22707 (h!23916 (_ BitVec 64)) (t!32028 List!22711)) )
))
(declare-fun arrayNoDuplicates!0 (array!67749 (_ BitVec 32) List!22711) Bool)

(assert (=> b!1064952 (= res!710912 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22708))))

(declare-fun mapIsEmpty!39754 () Bool)

(assert (=> mapIsEmpty!39754 mapRes!39754))

(declare-fun b!1064953 () Bool)

(declare-fun e!607032 () Bool)

(assert (=> b!1064953 (= e!607032 tp_is_empty!25381)))

(declare-fun b!1064954 () Bool)

(declare-fun res!710908 () Bool)

(assert (=> b!1064954 (=> (not res!710908) (not e!607031))))

(assert (=> b!1064954 (= res!710908 (and (= (size!33113 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33114 _keys!1163) (size!33113 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064955 () Bool)

(assert (=> b!1064955 (= e!607033 (and e!607032 mapRes!39754))))

(declare-fun condMapEmpty!39754 () Bool)

(declare-fun mapDefault!39754 () ValueCell!11987)

