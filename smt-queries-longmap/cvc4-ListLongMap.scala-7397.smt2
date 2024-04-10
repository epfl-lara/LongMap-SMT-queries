; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94162 () Bool)

(assert start!94162)

(declare-fun b_free!21563 () Bool)

(declare-fun b_next!21563 () Bool)

(assert (=> start!94162 (= b_free!21563 (not b_next!21563))))

(declare-fun tp!76123 () Bool)

(declare-fun b_and!34313 () Bool)

(assert (=> start!94162 (= tp!76123 b_and!34313)))

(declare-fun b!1064852 () Bool)

(declare-fun e!606962 () Bool)

(assert (=> b!1064852 (= e!606962 true)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38965 0))(
  ( (V!38966 (val!12737 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38965)

(declare-datatypes ((ValueCell!11983 0))(
  ( (ValueCellFull!11983 (v!15349 V!38965)) (EmptyCell!11983) )
))
(declare-datatypes ((array!67731 0))(
  ( (array!67732 (arr!32569 (Array (_ BitVec 32) ValueCell!11983)) (size!33105 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67731)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38965)

(declare-datatypes ((tuple2!16136 0))(
  ( (tuple2!16137 (_1!8079 (_ BitVec 64)) (_2!8079 V!38965)) )
))
(declare-datatypes ((List!22705 0))(
  ( (Nil!22702) (Cons!22701 (h!23910 tuple2!16136) (t!32022 List!22705)) )
))
(declare-datatypes ((ListLongMap!14105 0))(
  ( (ListLongMap!14106 (toList!7068 List!22705)) )
))
(declare-fun lt!469406 () ListLongMap!14105)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67733 0))(
  ( (array!67734 (arr!32570 (Array (_ BitVec 32) (_ BitVec 64))) (size!33106 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67733)

(declare-fun getCurrentListMap!4028 (array!67733 array!67731 (_ BitVec 32) (_ BitVec 32) V!38965 V!38965 (_ BitVec 32) Int) ListLongMap!14105)

(assert (=> b!1064852 (= lt!469406 (getCurrentListMap!4028 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064853 () Bool)

(declare-fun res!710850 () Bool)

(declare-fun e!606959 () Bool)

(assert (=> b!1064853 (=> (not res!710850) (not e!606959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67733 (_ BitVec 32)) Bool)

(assert (=> b!1064853 (= res!710850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064854 () Bool)

(declare-fun res!710852 () Bool)

(assert (=> b!1064854 (=> (not res!710852) (not e!606959))))

(declare-datatypes ((List!22706 0))(
  ( (Nil!22703) (Cons!22702 (h!23911 (_ BitVec 64)) (t!32023 List!22706)) )
))
(declare-fun arrayNoDuplicates!0 (array!67733 (_ BitVec 32) List!22706) Bool)

(assert (=> b!1064854 (= res!710852 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22703))))

(declare-fun b!1064855 () Bool)

(declare-fun e!606960 () Bool)

(declare-fun tp_is_empty!25373 () Bool)

(assert (=> b!1064855 (= e!606960 tp_is_empty!25373)))

(declare-fun b!1064857 () Bool)

(assert (=> b!1064857 (= e!606959 (not e!606962))))

(declare-fun res!710848 () Bool)

(assert (=> b!1064857 (=> res!710848 e!606962)))

(assert (=> b!1064857 (= res!710848 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469408 () ListLongMap!14105)

(declare-fun lt!469407 () ListLongMap!14105)

(assert (=> b!1064857 (= lt!469408 lt!469407)))

(declare-datatypes ((Unit!34930 0))(
  ( (Unit!34931) )
))
(declare-fun lt!469409 () Unit!34930)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38965)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!694 (array!67733 array!67731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38965 V!38965 V!38965 V!38965 (_ BitVec 32) Int) Unit!34930)

(assert (=> b!1064857 (= lt!469409 (lemmaNoChangeToArrayThenSameMapNoExtras!694 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3657 (array!67733 array!67731 (_ BitVec 32) (_ BitVec 32) V!38965 V!38965 (_ BitVec 32) Int) ListLongMap!14105)

(assert (=> b!1064857 (= lt!469407 (getCurrentListMapNoExtraKeys!3657 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064857 (= lt!469408 (getCurrentListMapNoExtraKeys!3657 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064858 () Bool)

(declare-fun e!606963 () Bool)

(assert (=> b!1064858 (= e!606963 tp_is_empty!25373)))

(declare-fun mapNonEmpty!39742 () Bool)

(declare-fun mapRes!39742 () Bool)

(declare-fun tp!76124 () Bool)

(assert (=> mapNonEmpty!39742 (= mapRes!39742 (and tp!76124 e!606960))))

(declare-fun mapKey!39742 () (_ BitVec 32))

(declare-fun mapRest!39742 () (Array (_ BitVec 32) ValueCell!11983))

(declare-fun mapValue!39742 () ValueCell!11983)

(assert (=> mapNonEmpty!39742 (= (arr!32569 _values!955) (store mapRest!39742 mapKey!39742 mapValue!39742))))

(declare-fun b!1064859 () Bool)

(declare-fun e!606964 () Bool)

(assert (=> b!1064859 (= e!606964 (and e!606963 mapRes!39742))))

(declare-fun condMapEmpty!39742 () Bool)

(declare-fun mapDefault!39742 () ValueCell!11983)

