; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94848 () Bool)

(assert start!94848)

(declare-fun b_free!22077 () Bool)

(declare-fun b_next!22077 () Bool)

(assert (=> start!94848 (= b_free!22077 (not b_next!22077))))

(declare-fun tp!77692 () Bool)

(declare-fun b_and!34919 () Bool)

(assert (=> start!94848 (= tp!77692 b_and!34919)))

(declare-fun b!1072536 () Bool)

(declare-fun res!715435 () Bool)

(declare-fun e!612624 () Bool)

(assert (=> b!1072536 (=> (not res!715435) (not e!612624))))

(declare-datatypes ((array!68741 0))(
  ( (array!68742 (arr!33065 (Array (_ BitVec 32) (_ BitVec 64))) (size!33601 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68741)

(declare-datatypes ((List!23084 0))(
  ( (Nil!23081) (Cons!23080 (h!24289 (_ BitVec 64)) (t!32419 List!23084)) )
))
(declare-fun arrayNoDuplicates!0 (array!68741 (_ BitVec 32) List!23084) Bool)

(assert (=> b!1072536 (= res!715435 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23081))))

(declare-fun b!1072537 () Bool)

(declare-fun res!715433 () Bool)

(assert (=> b!1072537 (=> (not res!715433) (not e!612624))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68741 (_ BitVec 32)) Bool)

(assert (=> b!1072537 (= res!715433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072538 () Bool)

(declare-fun e!612626 () Bool)

(assert (=> b!1072538 (= e!612626 true)))

(declare-datatypes ((V!39651 0))(
  ( (V!39652 (val!12994 Int)) )
))
(declare-datatypes ((tuple2!16550 0))(
  ( (tuple2!16551 (_1!8286 (_ BitVec 64)) (_2!8286 V!39651)) )
))
(declare-datatypes ((List!23085 0))(
  ( (Nil!23082) (Cons!23081 (h!24290 tuple2!16550) (t!32420 List!23085)) )
))
(declare-datatypes ((ListLongMap!14519 0))(
  ( (ListLongMap!14520 (toList!7275 List!23085)) )
))
(declare-fun lt!475554 () ListLongMap!14519)

(declare-fun lt!475545 () ListLongMap!14519)

(declare-fun -!703 (ListLongMap!14519 (_ BitVec 64)) ListLongMap!14519)

(assert (=> b!1072538 (= lt!475554 (-!703 lt!475545 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475550 () ListLongMap!14519)

(declare-fun lt!475549 () ListLongMap!14519)

(assert (=> b!1072538 (= lt!475550 lt!475549)))

(declare-fun zeroValueBefore!47 () V!39651)

(declare-datatypes ((Unit!35344 0))(
  ( (Unit!35345) )
))
(declare-fun lt!475547 () Unit!35344)

(declare-fun minValue!907 () V!39651)

(declare-fun lt!475544 () ListLongMap!14519)

(declare-fun addCommutativeForDiffKeys!748 (ListLongMap!14519 (_ BitVec 64) V!39651 (_ BitVec 64) V!39651) Unit!35344)

(assert (=> b!1072538 (= lt!475547 (addCommutativeForDiffKeys!748 lt!475544 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475552 () ListLongMap!14519)

(assert (=> b!1072538 (= (-!703 lt!475549 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475552)))

(declare-fun lt!475551 () tuple2!16550)

(declare-fun +!3209 (ListLongMap!14519 tuple2!16550) ListLongMap!14519)

(assert (=> b!1072538 (= lt!475549 (+!3209 lt!475552 lt!475551))))

(declare-fun lt!475542 () Unit!35344)

(declare-fun addThenRemoveForNewKeyIsSame!73 (ListLongMap!14519 (_ BitVec 64) V!39651) Unit!35344)

(assert (=> b!1072538 (= lt!475542 (addThenRemoveForNewKeyIsSame!73 lt!475552 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!475546 () tuple2!16550)

(assert (=> b!1072538 (= lt!475552 (+!3209 lt!475544 lt!475546))))

(declare-fun e!612623 () Bool)

(assert (=> b!1072538 e!612623))

(declare-fun res!715434 () Bool)

(assert (=> b!1072538 (=> (not res!715434) (not e!612623))))

(assert (=> b!1072538 (= res!715434 (= lt!475545 lt!475550))))

(assert (=> b!1072538 (= lt!475550 (+!3209 (+!3209 lt!475544 lt!475551) lt!475546))))

(assert (=> b!1072538 (= lt!475546 (tuple2!16551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072538 (= lt!475551 (tuple2!16551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!475543 () ListLongMap!14519)

(declare-datatypes ((ValueCell!12240 0))(
  ( (ValueCellFull!12240 (v!15611 V!39651)) (EmptyCell!12240) )
))
(declare-datatypes ((array!68743 0))(
  ( (array!68744 (arr!33066 (Array (_ BitVec 32) ValueCell!12240)) (size!33602 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68743)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39651)

(declare-fun getCurrentListMap!4169 (array!68741 array!68743 (_ BitVec 32) (_ BitVec 32) V!39651 V!39651 (_ BitVec 32) Int) ListLongMap!14519)

(assert (=> b!1072538 (= lt!475543 (getCurrentListMap!4169 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072538 (= lt!475545 (getCurrentListMap!4169 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072539 () Bool)

(assert (=> b!1072539 (= e!612624 (not e!612626))))

(declare-fun res!715437 () Bool)

(assert (=> b!1072539 (=> res!715437 e!612626)))

(assert (=> b!1072539 (= res!715437 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!475548 () ListLongMap!14519)

(assert (=> b!1072539 (= lt!475544 lt!475548)))

(declare-fun lt!475553 () Unit!35344)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!876 (array!68741 array!68743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39651 V!39651 V!39651 V!39651 (_ BitVec 32) Int) Unit!35344)

(assert (=> b!1072539 (= lt!475553 (lemmaNoChangeToArrayThenSameMapNoExtras!876 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3839 (array!68741 array!68743 (_ BitVec 32) (_ BitVec 32) V!39651 V!39651 (_ BitVec 32) Int) ListLongMap!14519)

(assert (=> b!1072539 (= lt!475548 (getCurrentListMapNoExtraKeys!3839 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072539 (= lt!475544 (getCurrentListMapNoExtraKeys!3839 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072540 () Bool)

(assert (=> b!1072540 (= e!612623 (= lt!475543 (+!3209 lt!475548 lt!475546)))))

(declare-fun b!1072541 () Bool)

(declare-fun res!715438 () Bool)

(assert (=> b!1072541 (=> (not res!715438) (not e!612624))))

(assert (=> b!1072541 (= res!715438 (and (= (size!33602 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33601 _keys!1163) (size!33602 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072542 () Bool)

(declare-fun e!612625 () Bool)

(declare-fun tp_is_empty!25887 () Bool)

(assert (=> b!1072542 (= e!612625 tp_is_empty!25887)))

(declare-fun b!1072543 () Bool)

(declare-fun e!612620 () Bool)

(declare-fun mapRes!40540 () Bool)

(assert (=> b!1072543 (= e!612620 (and e!612625 mapRes!40540))))

(declare-fun condMapEmpty!40540 () Bool)

(declare-fun mapDefault!40540 () ValueCell!12240)

(assert (=> b!1072543 (= condMapEmpty!40540 (= (arr!33066 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12240)) mapDefault!40540)))))

(declare-fun mapNonEmpty!40540 () Bool)

(declare-fun tp!77693 () Bool)

(declare-fun e!612622 () Bool)

(assert (=> mapNonEmpty!40540 (= mapRes!40540 (and tp!77693 e!612622))))

(declare-fun mapValue!40540 () ValueCell!12240)

(declare-fun mapKey!40540 () (_ BitVec 32))

(declare-fun mapRest!40540 () (Array (_ BitVec 32) ValueCell!12240))

(assert (=> mapNonEmpty!40540 (= (arr!33066 _values!955) (store mapRest!40540 mapKey!40540 mapValue!40540))))

(declare-fun res!715436 () Bool)

(assert (=> start!94848 (=> (not res!715436) (not e!612624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94848 (= res!715436 (validMask!0 mask!1515))))

(assert (=> start!94848 e!612624))

(assert (=> start!94848 true))

(assert (=> start!94848 tp_is_empty!25887))

(declare-fun array_inv!25560 (array!68743) Bool)

(assert (=> start!94848 (and (array_inv!25560 _values!955) e!612620)))

(assert (=> start!94848 tp!77692))

(declare-fun array_inv!25561 (array!68741) Bool)

(assert (=> start!94848 (array_inv!25561 _keys!1163)))

(declare-fun mapIsEmpty!40540 () Bool)

(assert (=> mapIsEmpty!40540 mapRes!40540))

(declare-fun b!1072544 () Bool)

(assert (=> b!1072544 (= e!612622 tp_is_empty!25887)))

(assert (= (and start!94848 res!715436) b!1072541))

(assert (= (and b!1072541 res!715438) b!1072537))

(assert (= (and b!1072537 res!715433) b!1072536))

(assert (= (and b!1072536 res!715435) b!1072539))

(assert (= (and b!1072539 (not res!715437)) b!1072538))

(assert (= (and b!1072538 res!715434) b!1072540))

(assert (= (and b!1072543 condMapEmpty!40540) mapIsEmpty!40540))

(assert (= (and b!1072543 (not condMapEmpty!40540)) mapNonEmpty!40540))

(get-info :version)

(assert (= (and mapNonEmpty!40540 ((_ is ValueCellFull!12240) mapValue!40540)) b!1072544))

(assert (= (and b!1072543 ((_ is ValueCellFull!12240) mapDefault!40540)) b!1072542))

(assert (= start!94848 b!1072543))

(declare-fun m!991533 () Bool)

(assert (=> start!94848 m!991533))

(declare-fun m!991535 () Bool)

(assert (=> start!94848 m!991535))

(declare-fun m!991537 () Bool)

(assert (=> start!94848 m!991537))

(declare-fun m!991539 () Bool)

(assert (=> b!1072536 m!991539))

(declare-fun m!991541 () Bool)

(assert (=> b!1072538 m!991541))

(declare-fun m!991543 () Bool)

(assert (=> b!1072538 m!991543))

(assert (=> b!1072538 m!991541))

(declare-fun m!991545 () Bool)

(assert (=> b!1072538 m!991545))

(declare-fun m!991547 () Bool)

(assert (=> b!1072538 m!991547))

(declare-fun m!991549 () Bool)

(assert (=> b!1072538 m!991549))

(declare-fun m!991551 () Bool)

(assert (=> b!1072538 m!991551))

(declare-fun m!991553 () Bool)

(assert (=> b!1072538 m!991553))

(declare-fun m!991555 () Bool)

(assert (=> b!1072538 m!991555))

(declare-fun m!991557 () Bool)

(assert (=> b!1072538 m!991557))

(declare-fun m!991559 () Bool)

(assert (=> b!1072538 m!991559))

(declare-fun m!991561 () Bool)

(assert (=> b!1072540 m!991561))

(declare-fun m!991563 () Bool)

(assert (=> b!1072537 m!991563))

(declare-fun m!991565 () Bool)

(assert (=> mapNonEmpty!40540 m!991565))

(declare-fun m!991567 () Bool)

(assert (=> b!1072539 m!991567))

(declare-fun m!991569 () Bool)

(assert (=> b!1072539 m!991569))

(declare-fun m!991571 () Bool)

(assert (=> b!1072539 m!991571))

(check-sat (not start!94848) (not b!1072536) (not b!1072540) (not b_next!22077) (not b!1072538) b_and!34919 (not b!1072537) tp_is_empty!25887 (not mapNonEmpty!40540) (not b!1072539))
(check-sat b_and!34919 (not b_next!22077))
