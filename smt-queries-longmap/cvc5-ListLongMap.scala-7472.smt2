; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94756 () Bool)

(assert start!94756)

(declare-fun b_free!22009 () Bool)

(declare-fun b_next!22009 () Bool)

(assert (=> start!94756 (= b_free!22009 (not b_next!22009))))

(declare-fun tp!77485 () Bool)

(declare-fun b_and!34839 () Bool)

(assert (=> start!94756 (= tp!77485 b_and!34839)))

(declare-fun b!1071426 () Bool)

(declare-fun res!714732 () Bool)

(declare-fun e!611786 () Bool)

(assert (=> b!1071426 (=> (not res!714732) (not e!611786))))

(declare-datatypes ((array!68611 0))(
  ( (array!68612 (arr!33001 (Array (_ BitVec 32) (_ BitVec 64))) (size!33537 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68611)

(declare-datatypes ((List!23036 0))(
  ( (Nil!23033) (Cons!23032 (h!24241 (_ BitVec 64)) (t!32369 List!23036)) )
))
(declare-fun arrayNoDuplicates!0 (array!68611 (_ BitVec 32) List!23036) Bool)

(assert (=> b!1071426 (= res!714732 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23033))))

(declare-fun b!1071427 () Bool)

(declare-fun res!714731 () Bool)

(assert (=> b!1071427 (=> (not res!714731) (not e!611786))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68611 (_ BitVec 32)) Bool)

(assert (=> b!1071427 (= res!714731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071428 () Bool)

(declare-fun e!611784 () Bool)

(assert (=> b!1071428 (= e!611786 (not e!611784))))

(declare-fun res!714734 () Bool)

(assert (=> b!1071428 (=> res!714734 e!611784)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071428 (= res!714734 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39561 0))(
  ( (V!39562 (val!12960 Int)) )
))
(declare-datatypes ((tuple2!16496 0))(
  ( (tuple2!16497 (_1!8259 (_ BitVec 64)) (_2!8259 V!39561)) )
))
(declare-datatypes ((List!23037 0))(
  ( (Nil!23034) (Cons!23033 (h!24242 tuple2!16496) (t!32370 List!23037)) )
))
(declare-datatypes ((ListLongMap!14465 0))(
  ( (ListLongMap!14466 (toList!7248 List!23037)) )
))
(declare-fun lt!474063 () ListLongMap!14465)

(declare-fun lt!474065 () ListLongMap!14465)

(assert (=> b!1071428 (= lt!474063 lt!474065)))

(declare-datatypes ((Unit!35292 0))(
  ( (Unit!35293) )
))
(declare-fun lt!474060 () Unit!35292)

(declare-fun zeroValueBefore!47 () V!39561)

(declare-datatypes ((ValueCell!12206 0))(
  ( (ValueCellFull!12206 (v!15576 V!39561)) (EmptyCell!12206) )
))
(declare-datatypes ((array!68613 0))(
  ( (array!68614 (arr!33002 (Array (_ BitVec 32) ValueCell!12206)) (size!33538 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68613)

(declare-fun minValue!907 () V!39561)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39561)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!855 (array!68611 array!68613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39561 V!39561 V!39561 V!39561 (_ BitVec 32) Int) Unit!35292)

(assert (=> b!1071428 (= lt!474060 (lemmaNoChangeToArrayThenSameMapNoExtras!855 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3818 (array!68611 array!68613 (_ BitVec 32) (_ BitVec 32) V!39561 V!39561 (_ BitVec 32) Int) ListLongMap!14465)

(assert (=> b!1071428 (= lt!474065 (getCurrentListMapNoExtraKeys!3818 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071428 (= lt!474063 (getCurrentListMapNoExtraKeys!3818 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071429 () Bool)

(declare-fun e!611785 () Bool)

(declare-fun lt!474059 () ListLongMap!14465)

(declare-fun lt!474071 () tuple2!16496)

(declare-fun +!3183 (ListLongMap!14465 tuple2!16496) ListLongMap!14465)

(assert (=> b!1071429 (= e!611785 (= lt!474059 (+!3183 lt!474065 lt!474071)))))

(declare-fun mapNonEmpty!40435 () Bool)

(declare-fun mapRes!40435 () Bool)

(declare-fun tp!77486 () Bool)

(declare-fun e!611783 () Bool)

(assert (=> mapNonEmpty!40435 (= mapRes!40435 (and tp!77486 e!611783))))

(declare-fun mapValue!40435 () ValueCell!12206)

(declare-fun mapKey!40435 () (_ BitVec 32))

(declare-fun mapRest!40435 () (Array (_ BitVec 32) ValueCell!12206))

(assert (=> mapNonEmpty!40435 (= (arr!33002 _values!955) (store mapRest!40435 mapKey!40435 mapValue!40435))))

(declare-fun b!1071430 () Bool)

(declare-fun e!611787 () Bool)

(declare-fun tp_is_empty!25819 () Bool)

(assert (=> b!1071430 (= e!611787 tp_is_empty!25819)))

(declare-fun mapIsEmpty!40435 () Bool)

(assert (=> mapIsEmpty!40435 mapRes!40435))

(declare-fun res!714733 () Bool)

(assert (=> start!94756 (=> (not res!714733) (not e!611786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94756 (= res!714733 (validMask!0 mask!1515))))

(assert (=> start!94756 e!611786))

(assert (=> start!94756 true))

(assert (=> start!94756 tp_is_empty!25819))

(declare-fun e!611788 () Bool)

(declare-fun array_inv!25518 (array!68613) Bool)

(assert (=> start!94756 (and (array_inv!25518 _values!955) e!611788)))

(assert (=> start!94756 tp!77485))

(declare-fun array_inv!25519 (array!68611) Bool)

(assert (=> start!94756 (array_inv!25519 _keys!1163)))

(declare-fun b!1071431 () Bool)

(assert (=> b!1071431 (= e!611783 tp_is_empty!25819)))

(declare-fun b!1071432 () Bool)

(assert (=> b!1071432 (= e!611784 true)))

(declare-fun lt!474070 () ListLongMap!14465)

(declare-fun lt!474068 () ListLongMap!14465)

(declare-fun -!681 (ListLongMap!14465 (_ BitVec 64)) ListLongMap!14465)

(assert (=> b!1071432 (= lt!474070 (-!681 lt!474068 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474062 () ListLongMap!14465)

(declare-fun lt!474067 () ListLongMap!14465)

(assert (=> b!1071432 (= lt!474062 lt!474067)))

(declare-fun lt!474066 () Unit!35292)

(declare-fun addCommutativeForDiffKeys!726 (ListLongMap!14465 (_ BitVec 64) V!39561 (_ BitVec 64) V!39561) Unit!35292)

(assert (=> b!1071432 (= lt!474066 (addCommutativeForDiffKeys!726 lt!474063 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474069 () ListLongMap!14465)

(assert (=> b!1071432 (= (-!681 lt!474067 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474069)))

(declare-fun lt!474061 () tuple2!16496)

(assert (=> b!1071432 (= lt!474067 (+!3183 lt!474069 lt!474061))))

(declare-fun lt!474064 () Unit!35292)

(declare-fun addThenRemoveForNewKeyIsSame!51 (ListLongMap!14465 (_ BitVec 64) V!39561) Unit!35292)

(assert (=> b!1071432 (= lt!474064 (addThenRemoveForNewKeyIsSame!51 lt!474069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1071432 (= lt!474069 (+!3183 lt!474063 lt!474071))))

(assert (=> b!1071432 e!611785))

(declare-fun res!714735 () Bool)

(assert (=> b!1071432 (=> (not res!714735) (not e!611785))))

(assert (=> b!1071432 (= res!714735 (= lt!474068 lt!474062))))

(assert (=> b!1071432 (= lt!474062 (+!3183 (+!3183 lt!474063 lt!474061) lt!474071))))

(assert (=> b!1071432 (= lt!474071 (tuple2!16497 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071432 (= lt!474061 (tuple2!16497 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4147 (array!68611 array!68613 (_ BitVec 32) (_ BitVec 32) V!39561 V!39561 (_ BitVec 32) Int) ListLongMap!14465)

(assert (=> b!1071432 (= lt!474059 (getCurrentListMap!4147 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071432 (= lt!474068 (getCurrentListMap!4147 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071433 () Bool)

(assert (=> b!1071433 (= e!611788 (and e!611787 mapRes!40435))))

(declare-fun condMapEmpty!40435 () Bool)

(declare-fun mapDefault!40435 () ValueCell!12206)

