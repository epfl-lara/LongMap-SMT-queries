; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95058 () Bool)

(assert start!95058)

(declare-fun b_free!22051 () Bool)

(declare-fun b_next!22051 () Bool)

(assert (=> start!95058 (= b_free!22051 (not b_next!22051))))

(declare-fun tp!77615 () Bool)

(declare-fun b_and!34903 () Bool)

(assert (=> start!95058 (= tp!77615 b_and!34903)))

(declare-fun b!1073512 () Bool)

(declare-fun e!613208 () Bool)

(declare-fun e!613205 () Bool)

(declare-fun mapRes!40501 () Bool)

(assert (=> b!1073512 (= e!613208 (and e!613205 mapRes!40501))))

(declare-fun condMapEmpty!40501 () Bool)

(declare-datatypes ((V!39617 0))(
  ( (V!39618 (val!12981 Int)) )
))
(declare-datatypes ((ValueCell!12227 0))(
  ( (ValueCellFull!12227 (v!15594 V!39617)) (EmptyCell!12227) )
))
(declare-datatypes ((array!68733 0))(
  ( (array!68734 (arr!33055 (Array (_ BitVec 32) ValueCell!12227)) (size!33592 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68733)

(declare-fun mapDefault!40501 () ValueCell!12227)

(assert (=> b!1073512 (= condMapEmpty!40501 (= (arr!33055 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12227)) mapDefault!40501)))))

(declare-fun b!1073513 () Bool)

(declare-fun e!613204 () Bool)

(declare-fun tp_is_empty!25861 () Bool)

(assert (=> b!1073513 (= e!613204 tp_is_empty!25861)))

(declare-fun mapIsEmpty!40501 () Bool)

(assert (=> mapIsEmpty!40501 mapRes!40501))

(declare-fun b!1073514 () Bool)

(declare-fun res!715722 () Bool)

(declare-fun e!613206 () Bool)

(assert (=> b!1073514 (=> (not res!715722) (not e!613206))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68735 0))(
  ( (array!68736 (arr!33056 (Array (_ BitVec 32) (_ BitVec 64))) (size!33593 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68735)

(assert (=> b!1073514 (= res!715722 (and (= (size!33592 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33593 _keys!1163) (size!33592 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!715723 () Bool)

(assert (=> start!95058 (=> (not res!715723) (not e!613206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95058 (= res!715723 (validMask!0 mask!1515))))

(assert (=> start!95058 e!613206))

(assert (=> start!95058 true))

(assert (=> start!95058 tp_is_empty!25861))

(declare-fun array_inv!25588 (array!68733) Bool)

(assert (=> start!95058 (and (array_inv!25588 _values!955) e!613208)))

(assert (=> start!95058 tp!77615))

(declare-fun array_inv!25589 (array!68735) Bool)

(assert (=> start!95058 (array_inv!25589 _keys!1163)))

(declare-fun b!1073515 () Bool)

(declare-fun res!715726 () Bool)

(assert (=> b!1073515 (=> (not res!715726) (not e!613206))))

(declare-datatypes ((List!23059 0))(
  ( (Nil!23056) (Cons!23055 (h!24273 (_ BitVec 64)) (t!32386 List!23059)) )
))
(declare-fun arrayNoDuplicates!0 (array!68735 (_ BitVec 32) List!23059) Bool)

(assert (=> b!1073515 (= res!715726 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23056))))

(declare-fun b!1073516 () Bool)

(assert (=> b!1073516 (= e!613205 tp_is_empty!25861)))

(declare-datatypes ((tuple2!16500 0))(
  ( (tuple2!16501 (_1!8261 (_ BitVec 64)) (_2!8261 V!39617)) )
))
(declare-datatypes ((List!23060 0))(
  ( (Nil!23057) (Cons!23056 (h!24274 tuple2!16500) (t!32387 List!23060)) )
))
(declare-datatypes ((ListLongMap!14477 0))(
  ( (ListLongMap!14478 (toList!7254 List!23060)) )
))
(declare-fun lt!475555 () ListLongMap!14477)

(declare-fun lt!475553 () ListLongMap!14477)

(declare-fun lt!475550 () tuple2!16500)

(declare-fun e!613203 () Bool)

(declare-fun b!1073517 () Bool)

(declare-fun +!3217 (ListLongMap!14477 tuple2!16500) ListLongMap!14477)

(assert (=> b!1073517 (= e!613203 (= lt!475553 (+!3217 lt!475555 lt!475550)))))

(declare-fun mapNonEmpty!40501 () Bool)

(declare-fun tp!77614 () Bool)

(assert (=> mapNonEmpty!40501 (= mapRes!40501 (and tp!77614 e!613204))))

(declare-fun mapRest!40501 () (Array (_ BitVec 32) ValueCell!12227))

(declare-fun mapKey!40501 () (_ BitVec 32))

(declare-fun mapValue!40501 () ValueCell!12227)

(assert (=> mapNonEmpty!40501 (= (arr!33055 _values!955) (store mapRest!40501 mapKey!40501 mapValue!40501))))

(declare-fun b!1073518 () Bool)

(declare-fun res!715725 () Bool)

(assert (=> b!1073518 (=> (not res!715725) (not e!613206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68735 (_ BitVec 32)) Bool)

(assert (=> b!1073518 (= res!715725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073519 () Bool)

(declare-fun e!613202 () Bool)

(assert (=> b!1073519 (= e!613206 (not e!613202))))

(declare-fun res!715724 () Bool)

(assert (=> b!1073519 (=> res!715724 e!613202)))

(assert (=> b!1073519 (= res!715724 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!475560 () ListLongMap!14477)

(assert (=> b!1073519 (= lt!475560 lt!475555)))

(declare-fun zeroValueBefore!47 () V!39617)

(declare-fun minValue!907 () V!39617)

(declare-datatypes ((Unit!35291 0))(
  ( (Unit!35292) )
))
(declare-fun lt!475551 () Unit!35291)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39617)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!860 (array!68735 array!68733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39617 V!39617 V!39617 V!39617 (_ BitVec 32) Int) Unit!35291)

(assert (=> b!1073519 (= lt!475551 (lemmaNoChangeToArrayThenSameMapNoExtras!860 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3857 (array!68735 array!68733 (_ BitVec 32) (_ BitVec 32) V!39617 V!39617 (_ BitVec 32) Int) ListLongMap!14477)

(assert (=> b!1073519 (= lt!475555 (getCurrentListMapNoExtraKeys!3857 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073519 (= lt!475560 (getCurrentListMapNoExtraKeys!3857 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073520 () Bool)

(assert (=> b!1073520 (= e!613202 true)))

(declare-fun lt!475554 () ListLongMap!14477)

(declare-fun lt!475562 () ListLongMap!14477)

(declare-fun -!685 (ListLongMap!14477 (_ BitVec 64)) ListLongMap!14477)

(assert (=> b!1073520 (= lt!475554 (-!685 lt!475562 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475552 () ListLongMap!14477)

(declare-fun lt!475561 () ListLongMap!14477)

(assert (=> b!1073520 (= lt!475552 lt!475561)))

(declare-fun lt!475559 () Unit!35291)

(declare-fun addCommutativeForDiffKeys!742 (ListLongMap!14477 (_ BitVec 64) V!39617 (_ BitVec 64) V!39617) Unit!35291)

(assert (=> b!1073520 (= lt!475559 (addCommutativeForDiffKeys!742 lt!475560 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475557 () ListLongMap!14477)

(assert (=> b!1073520 (= (-!685 lt!475561 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475557)))

(declare-fun lt!475558 () tuple2!16500)

(assert (=> b!1073520 (= lt!475561 (+!3217 lt!475557 lt!475558))))

(declare-fun lt!475556 () Unit!35291)

(declare-fun addThenRemoveForNewKeyIsSame!60 (ListLongMap!14477 (_ BitVec 64) V!39617) Unit!35291)

(assert (=> b!1073520 (= lt!475556 (addThenRemoveForNewKeyIsSame!60 lt!475557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1073520 (= lt!475557 (+!3217 lt!475560 lt!475550))))

(assert (=> b!1073520 e!613203))

(declare-fun res!715721 () Bool)

(assert (=> b!1073520 (=> (not res!715721) (not e!613203))))

(assert (=> b!1073520 (= res!715721 (= lt!475562 lt!475552))))

(assert (=> b!1073520 (= lt!475552 (+!3217 (+!3217 lt!475560 lt!475558) lt!475550))))

(assert (=> b!1073520 (= lt!475550 (tuple2!16501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1073520 (= lt!475558 (tuple2!16501 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4146 (array!68735 array!68733 (_ BitVec 32) (_ BitVec 32) V!39617 V!39617 (_ BitVec 32) Int) ListLongMap!14477)

(assert (=> b!1073520 (= lt!475553 (getCurrentListMap!4146 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073520 (= lt!475562 (getCurrentListMap!4146 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!95058 res!715723) b!1073514))

(assert (= (and b!1073514 res!715722) b!1073518))

(assert (= (and b!1073518 res!715725) b!1073515))

(assert (= (and b!1073515 res!715726) b!1073519))

(assert (= (and b!1073519 (not res!715724)) b!1073520))

(assert (= (and b!1073520 res!715721) b!1073517))

(assert (= (and b!1073512 condMapEmpty!40501) mapIsEmpty!40501))

(assert (= (and b!1073512 (not condMapEmpty!40501)) mapNonEmpty!40501))

(get-info :version)

(assert (= (and mapNonEmpty!40501 ((_ is ValueCellFull!12227) mapValue!40501)) b!1073513))

(assert (= (and b!1073512 ((_ is ValueCellFull!12227) mapDefault!40501)) b!1073516))

(assert (= start!95058 b!1073512))

(declare-fun m!992685 () Bool)

(assert (=> b!1073515 m!992685))

(declare-fun m!992687 () Bool)

(assert (=> b!1073519 m!992687))

(declare-fun m!992689 () Bool)

(assert (=> b!1073519 m!992689))

(declare-fun m!992691 () Bool)

(assert (=> b!1073519 m!992691))

(declare-fun m!992693 () Bool)

(assert (=> b!1073518 m!992693))

(declare-fun m!992695 () Bool)

(assert (=> start!95058 m!992695))

(declare-fun m!992697 () Bool)

(assert (=> start!95058 m!992697))

(declare-fun m!992699 () Bool)

(assert (=> start!95058 m!992699))

(declare-fun m!992701 () Bool)

(assert (=> b!1073520 m!992701))

(declare-fun m!992703 () Bool)

(assert (=> b!1073520 m!992703))

(declare-fun m!992705 () Bool)

(assert (=> b!1073520 m!992705))

(declare-fun m!992707 () Bool)

(assert (=> b!1073520 m!992707))

(declare-fun m!992709 () Bool)

(assert (=> b!1073520 m!992709))

(assert (=> b!1073520 m!992709))

(declare-fun m!992711 () Bool)

(assert (=> b!1073520 m!992711))

(declare-fun m!992713 () Bool)

(assert (=> b!1073520 m!992713))

(declare-fun m!992715 () Bool)

(assert (=> b!1073520 m!992715))

(declare-fun m!992717 () Bool)

(assert (=> b!1073520 m!992717))

(declare-fun m!992719 () Bool)

(assert (=> b!1073520 m!992719))

(declare-fun m!992721 () Bool)

(assert (=> mapNonEmpty!40501 m!992721))

(declare-fun m!992723 () Bool)

(assert (=> b!1073517 m!992723))

(check-sat (not start!95058) (not b!1073519) (not b_next!22051) tp_is_empty!25861 (not b!1073520) b_and!34903 (not b!1073515) (not b!1073517) (not mapNonEmpty!40501) (not b!1073518))
(check-sat b_and!34903 (not b_next!22051))
