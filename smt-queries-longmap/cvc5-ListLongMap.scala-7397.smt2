; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94158 () Bool)

(assert start!94158)

(declare-fun b_free!21559 () Bool)

(declare-fun b_next!21559 () Bool)

(assert (=> start!94158 (= b_free!21559 (not b_next!21559))))

(declare-fun tp!76112 () Bool)

(declare-fun b_and!34309 () Bool)

(assert (=> start!94158 (= tp!76112 b_and!34309)))

(declare-fun b!1064804 () Bool)

(declare-fun e!606923 () Bool)

(declare-fun tp_is_empty!25369 () Bool)

(assert (=> b!1064804 (= e!606923 tp_is_empty!25369)))

(declare-fun mapIsEmpty!39736 () Bool)

(declare-fun mapRes!39736 () Bool)

(assert (=> mapIsEmpty!39736 mapRes!39736))

(declare-fun b!1064805 () Bool)

(declare-fun e!606924 () Bool)

(declare-fun e!606927 () Bool)

(assert (=> b!1064805 (= e!606924 (not e!606927))))

(declare-fun res!710820 () Bool)

(assert (=> b!1064805 (=> res!710820 e!606927)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064805 (= res!710820 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!38961 0))(
  ( (V!38962 (val!12735 Int)) )
))
(declare-datatypes ((tuple2!16132 0))(
  ( (tuple2!16133 (_1!8077 (_ BitVec 64)) (_2!8077 V!38961)) )
))
(declare-datatypes ((List!22701 0))(
  ( (Nil!22698) (Cons!22697 (h!23906 tuple2!16132) (t!32018 List!22701)) )
))
(declare-datatypes ((ListLongMap!14101 0))(
  ( (ListLongMap!14102 (toList!7066 List!22701)) )
))
(declare-fun lt!469384 () ListLongMap!14101)

(declare-fun lt!469385 () ListLongMap!14101)

(assert (=> b!1064805 (= lt!469384 lt!469385)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38961)

(declare-datatypes ((Unit!34926 0))(
  ( (Unit!34927) )
))
(declare-fun lt!469382 () Unit!34926)

(declare-datatypes ((ValueCell!11981 0))(
  ( (ValueCellFull!11981 (v!15347 V!38961)) (EmptyCell!11981) )
))
(declare-datatypes ((array!67723 0))(
  ( (array!67724 (arr!32565 (Array (_ BitVec 32) ValueCell!11981)) (size!33101 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67723)

(declare-fun minValue!907 () V!38961)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38961)

(declare-datatypes ((array!67725 0))(
  ( (array!67726 (arr!32566 (Array (_ BitVec 32) (_ BitVec 64))) (size!33102 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67725)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!692 (array!67725 array!67723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38961 V!38961 V!38961 V!38961 (_ BitVec 32) Int) Unit!34926)

(assert (=> b!1064805 (= lt!469382 (lemmaNoChangeToArrayThenSameMapNoExtras!692 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3655 (array!67725 array!67723 (_ BitVec 32) (_ BitVec 32) V!38961 V!38961 (_ BitVec 32) Int) ListLongMap!14101)

(assert (=> b!1064805 (= lt!469385 (getCurrentListMapNoExtraKeys!3655 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064805 (= lt!469384 (getCurrentListMapNoExtraKeys!3655 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064806 () Bool)

(declare-fun res!710819 () Bool)

(assert (=> b!1064806 (=> (not res!710819) (not e!606924))))

(assert (=> b!1064806 (= res!710819 (and (= (size!33101 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33102 _keys!1163) (size!33101 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064807 () Bool)

(declare-fun e!606925 () Bool)

(assert (=> b!1064807 (= e!606925 tp_is_empty!25369)))

(declare-fun b!1064808 () Bool)

(declare-fun res!710818 () Bool)

(assert (=> b!1064808 (=> (not res!710818) (not e!606924))))

(declare-datatypes ((List!22702 0))(
  ( (Nil!22699) (Cons!22698 (h!23907 (_ BitVec 64)) (t!32019 List!22702)) )
))
(declare-fun arrayNoDuplicates!0 (array!67725 (_ BitVec 32) List!22702) Bool)

(assert (=> b!1064808 (= res!710818 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22699))))

(declare-fun b!1064809 () Bool)

(assert (=> b!1064809 (= e!606927 true)))

(declare-fun lt!469383 () ListLongMap!14101)

(declare-fun getCurrentListMap!4026 (array!67725 array!67723 (_ BitVec 32) (_ BitVec 32) V!38961 V!38961 (_ BitVec 32) Int) ListLongMap!14101)

(assert (=> b!1064809 (= lt!469383 (getCurrentListMap!4026 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39736 () Bool)

(declare-fun tp!76111 () Bool)

(assert (=> mapNonEmpty!39736 (= mapRes!39736 (and tp!76111 e!606925))))

(declare-fun mapKey!39736 () (_ BitVec 32))

(declare-fun mapRest!39736 () (Array (_ BitVec 32) ValueCell!11981))

(declare-fun mapValue!39736 () ValueCell!11981)

(assert (=> mapNonEmpty!39736 (= (arr!32565 _values!955) (store mapRest!39736 mapKey!39736 mapValue!39736))))

(declare-fun res!710821 () Bool)

(assert (=> start!94158 (=> (not res!710821) (not e!606924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94158 (= res!710821 (validMask!0 mask!1515))))

(assert (=> start!94158 e!606924))

(assert (=> start!94158 true))

(assert (=> start!94158 tp_is_empty!25369))

(declare-fun e!606928 () Bool)

(declare-fun array_inv!25218 (array!67723) Bool)

(assert (=> start!94158 (and (array_inv!25218 _values!955) e!606928)))

(assert (=> start!94158 tp!76112))

(declare-fun array_inv!25219 (array!67725) Bool)

(assert (=> start!94158 (array_inv!25219 _keys!1163)))

(declare-fun b!1064810 () Bool)

(declare-fun res!710822 () Bool)

(assert (=> b!1064810 (=> (not res!710822) (not e!606924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67725 (_ BitVec 32)) Bool)

(assert (=> b!1064810 (= res!710822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064811 () Bool)

(assert (=> b!1064811 (= e!606928 (and e!606923 mapRes!39736))))

(declare-fun condMapEmpty!39736 () Bool)

(declare-fun mapDefault!39736 () ValueCell!11981)

