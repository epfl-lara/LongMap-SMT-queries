; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94174 () Bool)

(assert start!94174)

(declare-fun b_free!21575 () Bool)

(declare-fun b_next!21575 () Bool)

(assert (=> start!94174 (= b_free!21575 (not b_next!21575))))

(declare-fun tp!76160 () Bool)

(declare-fun b_and!34325 () Bool)

(assert (=> start!94174 (= tp!76160 b_and!34325)))

(declare-fun b!1064996 () Bool)

(declare-fun res!710939 () Bool)

(declare-fun e!607069 () Bool)

(assert (=> b!1064996 (=> (not res!710939) (not e!607069))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38981 0))(
  ( (V!38982 (val!12743 Int)) )
))
(declare-datatypes ((ValueCell!11989 0))(
  ( (ValueCellFull!11989 (v!15355 V!38981)) (EmptyCell!11989) )
))
(declare-datatypes ((array!67755 0))(
  ( (array!67756 (arr!32581 (Array (_ BitVec 32) ValueCell!11989)) (size!33117 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67755)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67757 0))(
  ( (array!67758 (arr!32582 (Array (_ BitVec 32) (_ BitVec 64))) (size!33118 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67757)

(assert (=> b!1064996 (= res!710939 (and (= (size!33117 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33118 _keys!1163) (size!33117 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39760 () Bool)

(declare-fun mapRes!39760 () Bool)

(declare-fun tp!76159 () Bool)

(declare-fun e!607067 () Bool)

(assert (=> mapNonEmpty!39760 (= mapRes!39760 (and tp!76159 e!607067))))

(declare-fun mapValue!39760 () ValueCell!11989)

(declare-fun mapKey!39760 () (_ BitVec 32))

(declare-fun mapRest!39760 () (Array (_ BitVec 32) ValueCell!11989))

(assert (=> mapNonEmpty!39760 (= (arr!32581 _values!955) (store mapRest!39760 mapKey!39760 mapValue!39760))))

(declare-fun b!1064997 () Bool)

(declare-fun e!607072 () Bool)

(assert (=> b!1064997 (= e!607069 (not e!607072))))

(declare-fun res!710938 () Bool)

(assert (=> b!1064997 (=> res!710938 e!607072)))

(assert (=> b!1064997 (= res!710938 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16146 0))(
  ( (tuple2!16147 (_1!8084 (_ BitVec 64)) (_2!8084 V!38981)) )
))
(declare-datatypes ((List!22714 0))(
  ( (Nil!22711) (Cons!22710 (h!23919 tuple2!16146) (t!32031 List!22714)) )
))
(declare-datatypes ((ListLongMap!14115 0))(
  ( (ListLongMap!14116 (toList!7073 List!22714)) )
))
(declare-fun lt!469478 () ListLongMap!14115)

(declare-fun lt!469481 () ListLongMap!14115)

(assert (=> b!1064997 (= lt!469478 lt!469481)))

(declare-fun zeroValueBefore!47 () V!38981)

(declare-datatypes ((Unit!34940 0))(
  ( (Unit!34941) )
))
(declare-fun lt!469480 () Unit!34940)

(declare-fun minValue!907 () V!38981)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38981)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!699 (array!67757 array!67755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38981 V!38981 V!38981 V!38981 (_ BitVec 32) Int) Unit!34940)

(assert (=> b!1064997 (= lt!469480 (lemmaNoChangeToArrayThenSameMapNoExtras!699 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3662 (array!67757 array!67755 (_ BitVec 32) (_ BitVec 32) V!38981 V!38981 (_ BitVec 32) Int) ListLongMap!14115)

(assert (=> b!1064997 (= lt!469481 (getCurrentListMapNoExtraKeys!3662 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064997 (= lt!469478 (getCurrentListMapNoExtraKeys!3662 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064998 () Bool)

(declare-fun res!710940 () Bool)

(assert (=> b!1064998 (=> (not res!710940) (not e!607069))))

(declare-datatypes ((List!22715 0))(
  ( (Nil!22712) (Cons!22711 (h!23920 (_ BitVec 64)) (t!32032 List!22715)) )
))
(declare-fun arrayNoDuplicates!0 (array!67757 (_ BitVec 32) List!22715) Bool)

(assert (=> b!1064998 (= res!710940 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22712))))

(declare-fun b!1064999 () Bool)

(declare-fun e!607071 () Bool)

(declare-fun tp_is_empty!25385 () Bool)

(assert (=> b!1064999 (= e!607071 tp_is_empty!25385)))

(declare-fun b!1065000 () Bool)

(assert (=> b!1065000 (= e!607072 (bvsle #b00000000000000000000000000000000 (size!33118 _keys!1163)))))

(declare-fun lt!469479 () ListLongMap!14115)

(declare-fun getCurrentListMap!4033 (array!67757 array!67755 (_ BitVec 32) (_ BitVec 32) V!38981 V!38981 (_ BitVec 32) Int) ListLongMap!14115)

(assert (=> b!1065000 (= lt!469479 (getCurrentListMap!4033 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065001 () Bool)

(declare-fun e!607070 () Bool)

(assert (=> b!1065001 (= e!607070 (and e!607071 mapRes!39760))))

(declare-fun condMapEmpty!39760 () Bool)

(declare-fun mapDefault!39760 () ValueCell!11989)

