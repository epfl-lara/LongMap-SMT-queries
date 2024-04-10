; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33398 () Bool)

(assert start!33398)

(declare-fun b!331723 () Bool)

(declare-fun e!203569 () Bool)

(declare-fun tp_is_empty!6681 () Bool)

(assert (=> b!331723 (= e!203569 tp_is_empty!6681)))

(declare-fun b!331724 () Bool)

(declare-fun res!182760 () Bool)

(declare-fun e!203568 () Bool)

(assert (=> b!331724 (=> (not res!182760) (not e!203568))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9885 0))(
  ( (V!9886 (val!3385 Int)) )
))
(declare-datatypes ((ValueCell!2997 0))(
  ( (ValueCellFull!2997 (v!5543 V!9885)) (EmptyCell!2997) )
))
(declare-datatypes ((array!16957 0))(
  ( (array!16958 (arr!8016 (Array (_ BitVec 32) ValueCell!2997)) (size!8368 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16957)

(declare-datatypes ((array!16959 0))(
  ( (array!16960 (arr!8017 (Array (_ BitVec 32) (_ BitVec 64))) (size!8369 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16959)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331724 (= res!182760 (and (= (size!8368 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8369 _keys!1895) (size!8368 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11397 () Bool)

(declare-fun mapRes!11397 () Bool)

(declare-fun tp!23772 () Bool)

(assert (=> mapNonEmpty!11397 (= mapRes!11397 (and tp!23772 e!203569))))

(declare-fun mapKey!11397 () (_ BitVec 32))

(declare-fun mapRest!11397 () (Array (_ BitVec 32) ValueCell!2997))

(declare-fun mapValue!11397 () ValueCell!2997)

(assert (=> mapNonEmpty!11397 (= (arr!8016 _values!1525) (store mapRest!11397 mapKey!11397 mapValue!11397))))

(declare-fun mapIsEmpty!11397 () Bool)

(assert (=> mapIsEmpty!11397 mapRes!11397))

(declare-fun b!331725 () Bool)

(assert (=> b!331725 (= e!203568 (and (bvsle #b00000000000000000000000000000000 (size!8369 _keys!1895)) (bvsge (size!8369 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!331726 () Bool)

(declare-fun res!182758 () Bool)

(assert (=> b!331726 (=> (not res!182758) (not e!203568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16959 (_ BitVec 32)) Bool)

(assert (=> b!331726 (= res!182758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331727 () Bool)

(declare-fun e!203571 () Bool)

(declare-fun e!203572 () Bool)

(assert (=> b!331727 (= e!203571 (and e!203572 mapRes!11397))))

(declare-fun condMapEmpty!11397 () Bool)

(declare-fun mapDefault!11397 () ValueCell!2997)

(assert (=> b!331727 (= condMapEmpty!11397 (= (arr!8016 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!2997)) mapDefault!11397)))))

(declare-fun b!331728 () Bool)

(assert (=> b!331728 (= e!203572 tp_is_empty!6681)))

(declare-fun res!182759 () Bool)

(assert (=> start!33398 (=> (not res!182759) (not e!203568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33398 (= res!182759 (validMask!0 mask!2385))))

(assert (=> start!33398 e!203568))

(assert (=> start!33398 true))

(declare-fun array_inv!5974 (array!16957) Bool)

(assert (=> start!33398 (and (array_inv!5974 _values!1525) e!203571)))

(declare-fun array_inv!5975 (array!16959) Bool)

(assert (=> start!33398 (array_inv!5975 _keys!1895)))

(assert (= (and start!33398 res!182759) b!331724))

(assert (= (and b!331724 res!182760) b!331726))

(assert (= (and b!331726 res!182758) b!331725))

(assert (= (and b!331727 condMapEmpty!11397) mapIsEmpty!11397))

(assert (= (and b!331727 (not condMapEmpty!11397)) mapNonEmpty!11397))

(get-info :version)

(assert (= (and mapNonEmpty!11397 ((_ is ValueCellFull!2997) mapValue!11397)) b!331723))

(assert (= (and b!331727 ((_ is ValueCellFull!2997) mapDefault!11397)) b!331728))

(assert (= start!33398 b!331727))

(declare-fun m!336493 () Bool)

(assert (=> mapNonEmpty!11397 m!336493))

(declare-fun m!336495 () Bool)

(assert (=> b!331726 m!336495))

(declare-fun m!336497 () Bool)

(assert (=> start!33398 m!336497))

(declare-fun m!336499 () Bool)

(assert (=> start!33398 m!336499))

(declare-fun m!336501 () Bool)

(assert (=> start!33398 m!336501))

(check-sat (not start!33398) (not b!331726) (not mapNonEmpty!11397) tp_is_empty!6681)
(check-sat)
(get-model)

(declare-fun d!70467 () Bool)

(assert (=> d!70467 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33398 d!70467))

(declare-fun d!70469 () Bool)

(assert (=> d!70469 (= (array_inv!5974 _values!1525) (bvsge (size!8368 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33398 d!70469))

(declare-fun d!70471 () Bool)

(assert (=> d!70471 (= (array_inv!5975 _keys!1895) (bvsge (size!8369 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33398 d!70471))

(declare-fun b!331755 () Bool)

(declare-fun e!203596 () Bool)

(declare-fun call!26203 () Bool)

(assert (=> b!331755 (= e!203596 call!26203)))

(declare-fun bm!26200 () Bool)

(assert (=> bm!26200 (= call!26203 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70473 () Bool)

(declare-fun res!182774 () Bool)

(declare-fun e!203595 () Bool)

(assert (=> d!70473 (=> res!182774 e!203595)))

(assert (=> d!70473 (= res!182774 (bvsge #b00000000000000000000000000000000 (size!8369 _keys!1895)))))

(assert (=> d!70473 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!203595)))

(declare-fun b!331756 () Bool)

(declare-fun e!203594 () Bool)

(assert (=> b!331756 (= e!203595 e!203594)))

(declare-fun c!52074 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331756 (= c!52074 (validKeyInArray!0 (select (arr!8017 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!331757 () Bool)

(assert (=> b!331757 (= e!203594 call!26203)))

(declare-fun b!331758 () Bool)

(assert (=> b!331758 (= e!203594 e!203596)))

(declare-fun lt!158916 () (_ BitVec 64))

(assert (=> b!331758 (= lt!158916 (select (arr!8017 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10353 0))(
  ( (Unit!10354) )
))
(declare-fun lt!158914 () Unit!10353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16959 (_ BitVec 64) (_ BitVec 32)) Unit!10353)

(assert (=> b!331758 (= lt!158914 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158916 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!16959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331758 (arrayContainsKey!0 _keys!1895 lt!158916 #b00000000000000000000000000000000)))

(declare-fun lt!158915 () Unit!10353)

(assert (=> b!331758 (= lt!158915 lt!158914)))

(declare-fun res!182775 () Bool)

(declare-datatypes ((SeekEntryResult!3129 0))(
  ( (MissingZero!3129 (index!14695 (_ BitVec 32))) (Found!3129 (index!14696 (_ BitVec 32))) (Intermediate!3129 (undefined!3941 Bool) (index!14697 (_ BitVec 32)) (x!33019 (_ BitVec 32))) (Undefined!3129) (MissingVacant!3129 (index!14698 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16959 (_ BitVec 32)) SeekEntryResult!3129)

(assert (=> b!331758 (= res!182775 (= (seekEntryOrOpen!0 (select (arr!8017 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3129 #b00000000000000000000000000000000)))))

(assert (=> b!331758 (=> (not res!182775) (not e!203596))))

(assert (= (and d!70473 (not res!182774)) b!331756))

(assert (= (and b!331756 c!52074) b!331758))

(assert (= (and b!331756 (not c!52074)) b!331757))

(assert (= (and b!331758 res!182775) b!331755))

(assert (= (or b!331755 b!331757) bm!26200))

(declare-fun m!336513 () Bool)

(assert (=> bm!26200 m!336513))

(declare-fun m!336515 () Bool)

(assert (=> b!331756 m!336515))

(assert (=> b!331756 m!336515))

(declare-fun m!336517 () Bool)

(assert (=> b!331756 m!336517))

(assert (=> b!331758 m!336515))

(declare-fun m!336519 () Bool)

(assert (=> b!331758 m!336519))

(declare-fun m!336521 () Bool)

(assert (=> b!331758 m!336521))

(assert (=> b!331758 m!336515))

(declare-fun m!336523 () Bool)

(assert (=> b!331758 m!336523))

(assert (=> b!331726 d!70473))

(declare-fun mapIsEmpty!11403 () Bool)

(declare-fun mapRes!11403 () Bool)

(assert (=> mapIsEmpty!11403 mapRes!11403))

(declare-fun b!331765 () Bool)

(declare-fun e!203602 () Bool)

(assert (=> b!331765 (= e!203602 tp_is_empty!6681)))

(declare-fun condMapEmpty!11403 () Bool)

(declare-fun mapDefault!11403 () ValueCell!2997)

(assert (=> mapNonEmpty!11397 (= condMapEmpty!11403 (= mapRest!11397 ((as const (Array (_ BitVec 32) ValueCell!2997)) mapDefault!11403)))))

(declare-fun e!203601 () Bool)

(assert (=> mapNonEmpty!11397 (= tp!23772 (and e!203601 mapRes!11403))))

(declare-fun b!331766 () Bool)

(assert (=> b!331766 (= e!203601 tp_is_empty!6681)))

(declare-fun mapNonEmpty!11403 () Bool)

(declare-fun tp!23778 () Bool)

(assert (=> mapNonEmpty!11403 (= mapRes!11403 (and tp!23778 e!203602))))

(declare-fun mapValue!11403 () ValueCell!2997)

(declare-fun mapRest!11403 () (Array (_ BitVec 32) ValueCell!2997))

(declare-fun mapKey!11403 () (_ BitVec 32))

(assert (=> mapNonEmpty!11403 (= mapRest!11397 (store mapRest!11403 mapKey!11403 mapValue!11403))))

(assert (= (and mapNonEmpty!11397 condMapEmpty!11403) mapIsEmpty!11403))

(assert (= (and mapNonEmpty!11397 (not condMapEmpty!11403)) mapNonEmpty!11403))

(assert (= (and mapNonEmpty!11403 ((_ is ValueCellFull!2997) mapValue!11403)) b!331765))

(assert (= (and mapNonEmpty!11397 ((_ is ValueCellFull!2997) mapDefault!11403)) b!331766))

(declare-fun m!336525 () Bool)

(assert (=> mapNonEmpty!11403 m!336525))

(check-sat (not b!331758) (not mapNonEmpty!11403) (not bm!26200) (not b!331756) tp_is_empty!6681)
(check-sat)
