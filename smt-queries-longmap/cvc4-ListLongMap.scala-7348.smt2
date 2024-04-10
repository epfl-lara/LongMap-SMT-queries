; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93796 () Bool)

(assert start!93796)

(declare-fun b_free!21269 () Bool)

(declare-fun b_next!21269 () Bool)

(assert (=> start!93796 (= b_free!21269 (not b_next!21269))))

(declare-fun tp!75230 () Bool)

(declare-fun b_and!33983 () Bool)

(assert (=> start!93796 (= tp!75230 b_and!33983)))

(declare-fun b!1060886 () Bool)

(declare-fun e!604050 () Bool)

(assert (=> b!1060886 (= e!604050 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38573 0))(
  ( (V!38574 (val!12590 Int)) )
))
(declare-datatypes ((ValueCell!11836 0))(
  ( (ValueCellFull!11836 (v!15200 V!38573)) (EmptyCell!11836) )
))
(declare-datatypes ((array!67169 0))(
  ( (array!67170 (arr!32292 (Array (_ BitVec 32) ValueCell!11836)) (size!32828 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67169)

(declare-fun minValue!907 () V!38573)

(declare-datatypes ((array!67171 0))(
  ( (array!67172 (arr!32293 (Array (_ BitVec 32) (_ BitVec 64))) (size!32829 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67171)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-datatypes ((tuple2!15908 0))(
  ( (tuple2!15909 (_1!7965 (_ BitVec 64)) (_2!7965 V!38573)) )
))
(declare-datatypes ((List!22495 0))(
  ( (Nil!22492) (Cons!22491 (h!23700 tuple2!15908) (t!31804 List!22495)) )
))
(declare-datatypes ((ListLongMap!13877 0))(
  ( (ListLongMap!13878 (toList!6954 List!22495)) )
))
(declare-fun lt!467407 () ListLongMap!13877)

(declare-fun zeroValueAfter!47 () V!38573)

(declare-fun getCurrentListMapNoExtraKeys!3556 (array!67171 array!67169 (_ BitVec 32) (_ BitVec 32) V!38573 V!38573 (_ BitVec 32) Int) ListLongMap!13877)

(assert (=> b!1060886 (= lt!467407 (getCurrentListMapNoExtraKeys!3556 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38573)

(declare-fun lt!467406 () ListLongMap!13877)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060886 (= lt!467406 (getCurrentListMapNoExtraKeys!3556 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!708506 () Bool)

(assert (=> start!93796 (=> (not res!708506) (not e!604050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93796 (= res!708506 (validMask!0 mask!1515))))

(assert (=> start!93796 e!604050))

(assert (=> start!93796 true))

(declare-fun tp_is_empty!25079 () Bool)

(assert (=> start!93796 tp_is_empty!25079))

(declare-fun e!604052 () Bool)

(declare-fun array_inv!25024 (array!67169) Bool)

(assert (=> start!93796 (and (array_inv!25024 _values!955) e!604052)))

(assert (=> start!93796 tp!75230))

(declare-fun array_inv!25025 (array!67171) Bool)

(assert (=> start!93796 (array_inv!25025 _keys!1163)))

(declare-fun b!1060887 () Bool)

(declare-fun res!708505 () Bool)

(assert (=> b!1060887 (=> (not res!708505) (not e!604050))))

(declare-datatypes ((List!22496 0))(
  ( (Nil!22493) (Cons!22492 (h!23701 (_ BitVec 64)) (t!31805 List!22496)) )
))
(declare-fun arrayNoDuplicates!0 (array!67171 (_ BitVec 32) List!22496) Bool)

(assert (=> b!1060887 (= res!708505 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22493))))

(declare-fun b!1060888 () Bool)

(declare-fun e!604051 () Bool)

(assert (=> b!1060888 (= e!604051 tp_is_empty!25079)))

(declare-fun b!1060889 () Bool)

(declare-fun e!604053 () Bool)

(assert (=> b!1060889 (= e!604053 tp_is_empty!25079)))

(declare-fun mapIsEmpty!39289 () Bool)

(declare-fun mapRes!39289 () Bool)

(assert (=> mapIsEmpty!39289 mapRes!39289))

(declare-fun b!1060890 () Bool)

(declare-fun res!708507 () Bool)

(assert (=> b!1060890 (=> (not res!708507) (not e!604050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67171 (_ BitVec 32)) Bool)

(assert (=> b!1060890 (= res!708507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060891 () Bool)

(declare-fun res!708508 () Bool)

(assert (=> b!1060891 (=> (not res!708508) (not e!604050))))

(assert (=> b!1060891 (= res!708508 (and (= (size!32828 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32829 _keys!1163) (size!32828 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39289 () Bool)

(declare-fun tp!75229 () Bool)

(assert (=> mapNonEmpty!39289 (= mapRes!39289 (and tp!75229 e!604053))))

(declare-fun mapKey!39289 () (_ BitVec 32))

(declare-fun mapRest!39289 () (Array (_ BitVec 32) ValueCell!11836))

(declare-fun mapValue!39289 () ValueCell!11836)

(assert (=> mapNonEmpty!39289 (= (arr!32292 _values!955) (store mapRest!39289 mapKey!39289 mapValue!39289))))

(declare-fun b!1060892 () Bool)

(assert (=> b!1060892 (= e!604052 (and e!604051 mapRes!39289))))

(declare-fun condMapEmpty!39289 () Bool)

(declare-fun mapDefault!39289 () ValueCell!11836)

