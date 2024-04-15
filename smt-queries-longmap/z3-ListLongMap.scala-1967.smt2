; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34590 () Bool)

(assert start!34590)

(declare-fun b_free!7471 () Bool)

(declare-fun b_next!7471 () Bool)

(assert (=> start!34590 (= b_free!7471 (not b_next!7471))))

(declare-fun tp!25967 () Bool)

(declare-fun b_and!14659 () Bool)

(assert (=> start!34590 (= tp!25967 b_and!14659)))

(declare-fun res!191159 () Bool)

(declare-fun e!211774 () Bool)

(assert (=> start!34590 (=> (not res!191159) (not e!211774))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34590 (= res!191159 (validMask!0 mask!2385))))

(assert (=> start!34590 e!211774))

(assert (=> start!34590 true))

(declare-fun tp_is_empty!7423 () Bool)

(assert (=> start!34590 tp_is_empty!7423))

(assert (=> start!34590 tp!25967))

(declare-datatypes ((V!10875 0))(
  ( (V!10876 (val!3756 Int)) )
))
(declare-datatypes ((ValueCell!3368 0))(
  ( (ValueCellFull!3368 (v!5929 V!10875)) (EmptyCell!3368) )
))
(declare-datatypes ((array!18421 0))(
  ( (array!18422 (arr!8724 (Array (_ BitVec 32) ValueCell!3368)) (size!9077 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18421)

(declare-fun e!211772 () Bool)

(declare-fun array_inv!6486 (array!18421) Bool)

(assert (=> start!34590 (and (array_inv!6486 _values!1525) e!211772)))

(declare-datatypes ((array!18423 0))(
  ( (array!18424 (arr!8725 (Array (_ BitVec 32) (_ BitVec 64))) (size!9078 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18423)

(declare-fun array_inv!6487 (array!18423) Bool)

(assert (=> start!34590 (array_inv!6487 _keys!1895)))

(declare-fun b!345531 () Bool)

(declare-fun res!191160 () Bool)

(assert (=> b!345531 (=> (not res!191160) (not e!211774))))

(declare-datatypes ((List!5011 0))(
  ( (Nil!5008) (Cons!5007 (h!5863 (_ BitVec 64)) (t!10124 List!5011)) )
))
(declare-fun arrayNoDuplicates!0 (array!18423 (_ BitVec 32) List!5011) Bool)

(assert (=> b!345531 (= res!191160 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5008))))

(declare-fun b!345532 () Bool)

(declare-fun res!191155 () Bool)

(assert (=> b!345532 (=> (not res!191155) (not e!211774))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!345532 (= res!191155 (and (= (size!9077 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9078 _keys!1895) (size!9077 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345533 () Bool)

(declare-fun res!191156 () Bool)

(declare-fun e!211771 () Bool)

(assert (=> b!345533 (=> (not res!191156) (not e!211771))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3360 0))(
  ( (MissingZero!3360 (index!15619 (_ BitVec 32))) (Found!3360 (index!15620 (_ BitVec 32))) (Intermediate!3360 (undefined!4172 Bool) (index!15621 (_ BitVec 32)) (x!34443 (_ BitVec 32))) (Undefined!3360) (MissingVacant!3360 (index!15622 (_ BitVec 32))) )
))
(declare-fun lt!162834 () SeekEntryResult!3360)

(declare-fun arrayContainsKey!0 (array!18423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345533 (= res!191156 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15620 lt!162834)))))

(declare-fun mapIsEmpty!12582 () Bool)

(declare-fun mapRes!12582 () Bool)

(assert (=> mapIsEmpty!12582 mapRes!12582))

(declare-fun b!345534 () Bool)

(declare-fun e!211769 () Bool)

(assert (=> b!345534 (= e!211772 (and e!211769 mapRes!12582))))

(declare-fun condMapEmpty!12582 () Bool)

(declare-fun mapDefault!12582 () ValueCell!3368)

(assert (=> b!345534 (= condMapEmpty!12582 (= (arr!8724 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3368)) mapDefault!12582)))))

(declare-fun b!345535 () Bool)

(declare-fun res!191157 () Bool)

(assert (=> b!345535 (=> (not res!191157) (not e!211774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18423 (_ BitVec 32)) Bool)

(assert (=> b!345535 (= res!191157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345536 () Bool)

(assert (=> b!345536 (= e!211774 e!211771)))

(declare-fun res!191158 () Bool)

(assert (=> b!345536 (=> (not res!191158) (not e!211771))))

(get-info :version)

(assert (=> b!345536 (= res!191158 (and ((_ is Found!3360) lt!162834) (= (select (arr!8725 _keys!1895) (index!15620 lt!162834)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18423 (_ BitVec 32)) SeekEntryResult!3360)

(assert (=> b!345536 (= lt!162834 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12582 () Bool)

(declare-fun tp!25968 () Bool)

(declare-fun e!211773 () Bool)

(assert (=> mapNonEmpty!12582 (= mapRes!12582 (and tp!25968 e!211773))))

(declare-fun mapRest!12582 () (Array (_ BitVec 32) ValueCell!3368))

(declare-fun mapValue!12582 () ValueCell!3368)

(declare-fun mapKey!12582 () (_ BitVec 32))

(assert (=> mapNonEmpty!12582 (= (arr!8724 _values!1525) (store mapRest!12582 mapKey!12582 mapValue!12582))))

(declare-fun b!345537 () Bool)

(assert (=> b!345537 (= e!211771 (bvslt (index!15620 lt!162834) #b00000000000000000000000000000000))))

(declare-fun b!345538 () Bool)

(assert (=> b!345538 (= e!211773 tp_is_empty!7423)))

(declare-fun b!345539 () Bool)

(declare-fun res!191162 () Bool)

(assert (=> b!345539 (=> (not res!191162) (not e!211774))))

(declare-fun zeroValue!1467 () V!10875)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10875)

(declare-datatypes ((tuple2!5394 0))(
  ( (tuple2!5395 (_1!2708 (_ BitVec 64)) (_2!2708 V!10875)) )
))
(declare-datatypes ((List!5012 0))(
  ( (Nil!5009) (Cons!5008 (h!5864 tuple2!5394) (t!10125 List!5012)) )
))
(declare-datatypes ((ListLongMap!4297 0))(
  ( (ListLongMap!4298 (toList!2164 List!5012)) )
))
(declare-fun contains!2236 (ListLongMap!4297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1670 (array!18423 array!18421 (_ BitVec 32) (_ BitVec 32) V!10875 V!10875 (_ BitVec 32) Int) ListLongMap!4297)

(assert (=> b!345539 (= res!191162 (not (contains!2236 (getCurrentListMap!1670 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!345540 () Bool)

(declare-fun res!191161 () Bool)

(assert (=> b!345540 (=> (not res!191161) (not e!211774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345540 (= res!191161 (validKeyInArray!0 k0!1348))))

(declare-fun b!345541 () Bool)

(assert (=> b!345541 (= e!211769 tp_is_empty!7423)))

(assert (= (and start!34590 res!191159) b!345532))

(assert (= (and b!345532 res!191155) b!345535))

(assert (= (and b!345535 res!191157) b!345531))

(assert (= (and b!345531 res!191160) b!345540))

(assert (= (and b!345540 res!191161) b!345539))

(assert (= (and b!345539 res!191162) b!345536))

(assert (= (and b!345536 res!191158) b!345533))

(assert (= (and b!345533 res!191156) b!345537))

(assert (= (and b!345534 condMapEmpty!12582) mapIsEmpty!12582))

(assert (= (and b!345534 (not condMapEmpty!12582)) mapNonEmpty!12582))

(assert (= (and mapNonEmpty!12582 ((_ is ValueCellFull!3368) mapValue!12582)) b!345538))

(assert (= (and b!345534 ((_ is ValueCellFull!3368) mapDefault!12582)) b!345541))

(assert (= start!34590 b!345534))

(declare-fun m!346349 () Bool)

(assert (=> start!34590 m!346349))

(declare-fun m!346351 () Bool)

(assert (=> start!34590 m!346351))

(declare-fun m!346353 () Bool)

(assert (=> start!34590 m!346353))

(declare-fun m!346355 () Bool)

(assert (=> b!345540 m!346355))

(declare-fun m!346357 () Bool)

(assert (=> b!345531 m!346357))

(declare-fun m!346359 () Bool)

(assert (=> b!345533 m!346359))

(declare-fun m!346361 () Bool)

(assert (=> b!345539 m!346361))

(assert (=> b!345539 m!346361))

(declare-fun m!346363 () Bool)

(assert (=> b!345539 m!346363))

(declare-fun m!346365 () Bool)

(assert (=> mapNonEmpty!12582 m!346365))

(declare-fun m!346367 () Bool)

(assert (=> b!345536 m!346367))

(declare-fun m!346369 () Bool)

(assert (=> b!345536 m!346369))

(declare-fun m!346371 () Bool)

(assert (=> b!345535 m!346371))

(check-sat (not b!345531) tp_is_empty!7423 (not b!345536) (not start!34590) (not b!345535) (not b_next!7471) (not b!345539) (not b!345540) b_and!14659 (not b!345533) (not mapNonEmpty!12582))
(check-sat b_and!14659 (not b_next!7471))
(get-model)

(declare-fun d!70975 () Bool)

(declare-fun lt!162848 () SeekEntryResult!3360)

(assert (=> d!70975 (and (or ((_ is Undefined!3360) lt!162848) (not ((_ is Found!3360) lt!162848)) (and (bvsge (index!15620 lt!162848) #b00000000000000000000000000000000) (bvslt (index!15620 lt!162848) (size!9078 _keys!1895)))) (or ((_ is Undefined!3360) lt!162848) ((_ is Found!3360) lt!162848) (not ((_ is MissingZero!3360) lt!162848)) (and (bvsge (index!15619 lt!162848) #b00000000000000000000000000000000) (bvslt (index!15619 lt!162848) (size!9078 _keys!1895)))) (or ((_ is Undefined!3360) lt!162848) ((_ is Found!3360) lt!162848) ((_ is MissingZero!3360) lt!162848) (not ((_ is MissingVacant!3360) lt!162848)) (and (bvsge (index!15622 lt!162848) #b00000000000000000000000000000000) (bvslt (index!15622 lt!162848) (size!9078 _keys!1895)))) (or ((_ is Undefined!3360) lt!162848) (ite ((_ is Found!3360) lt!162848) (= (select (arr!8725 _keys!1895) (index!15620 lt!162848)) k0!1348) (ite ((_ is MissingZero!3360) lt!162848) (= (select (arr!8725 _keys!1895) (index!15619 lt!162848)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3360) lt!162848) (= (select (arr!8725 _keys!1895) (index!15622 lt!162848)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!211819 () SeekEntryResult!3360)

(assert (=> d!70975 (= lt!162848 e!211819)))

(declare-fun c!52998 () Bool)

(declare-fun lt!162847 () SeekEntryResult!3360)

(assert (=> d!70975 (= c!52998 (and ((_ is Intermediate!3360) lt!162847) (undefined!4172 lt!162847)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18423 (_ BitVec 32)) SeekEntryResult!3360)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70975 (= lt!162847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70975 (validMask!0 mask!2385)))

(assert (=> d!70975 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162848)))

(declare-fun e!211817 () SeekEntryResult!3360)

(declare-fun b!345620 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18423 (_ BitVec 32)) SeekEntryResult!3360)

(assert (=> b!345620 (= e!211817 (seekKeyOrZeroReturnVacant!0 (x!34443 lt!162847) (index!15621 lt!162847) (index!15621 lt!162847) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345621 () Bool)

(assert (=> b!345621 (= e!211817 (MissingZero!3360 (index!15621 lt!162847)))))

(declare-fun b!345622 () Bool)

(declare-fun c!53000 () Bool)

(declare-fun lt!162849 () (_ BitVec 64))

(assert (=> b!345622 (= c!53000 (= lt!162849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!211818 () SeekEntryResult!3360)

(assert (=> b!345622 (= e!211818 e!211817)))

(declare-fun b!345623 () Bool)

(assert (=> b!345623 (= e!211819 e!211818)))

(assert (=> b!345623 (= lt!162849 (select (arr!8725 _keys!1895) (index!15621 lt!162847)))))

(declare-fun c!52999 () Bool)

(assert (=> b!345623 (= c!52999 (= lt!162849 k0!1348))))

(declare-fun b!345624 () Bool)

(assert (=> b!345624 (= e!211818 (Found!3360 (index!15621 lt!162847)))))

(declare-fun b!345625 () Bool)

(assert (=> b!345625 (= e!211819 Undefined!3360)))

(assert (= (and d!70975 c!52998) b!345625))

(assert (= (and d!70975 (not c!52998)) b!345623))

(assert (= (and b!345623 c!52999) b!345624))

(assert (= (and b!345623 (not c!52999)) b!345622))

(assert (= (and b!345622 c!53000) b!345621))

(assert (= (and b!345622 (not c!53000)) b!345620))

(declare-fun m!346421 () Bool)

(assert (=> d!70975 m!346421))

(assert (=> d!70975 m!346349))

(declare-fun m!346423 () Bool)

(assert (=> d!70975 m!346423))

(declare-fun m!346425 () Bool)

(assert (=> d!70975 m!346425))

(assert (=> d!70975 m!346425))

(declare-fun m!346427 () Bool)

(assert (=> d!70975 m!346427))

(declare-fun m!346429 () Bool)

(assert (=> d!70975 m!346429))

(declare-fun m!346431 () Bool)

(assert (=> b!345620 m!346431))

(declare-fun m!346433 () Bool)

(assert (=> b!345623 m!346433))

(assert (=> b!345536 d!70975))

(declare-fun b!345636 () Bool)

(declare-fun e!211828 () Bool)

(declare-fun e!211829 () Bool)

(assert (=> b!345636 (= e!211828 e!211829)))

(declare-fun c!53003 () Bool)

(assert (=> b!345636 (= c!53003 (validKeyInArray!0 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345637 () Bool)

(declare-fun e!211831 () Bool)

(assert (=> b!345637 (= e!211831 e!211828)))

(declare-fun res!191217 () Bool)

(assert (=> b!345637 (=> (not res!191217) (not e!211828))))

(declare-fun e!211830 () Bool)

(assert (=> b!345637 (= res!191217 (not e!211830))))

(declare-fun res!191219 () Bool)

(assert (=> b!345637 (=> (not res!191219) (not e!211830))))

(assert (=> b!345637 (= res!191219 (validKeyInArray!0 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345638 () Bool)

(declare-fun call!26732 () Bool)

(assert (=> b!345638 (= e!211829 call!26732)))

(declare-fun b!345639 () Bool)

(declare-fun contains!2238 (List!5011 (_ BitVec 64)) Bool)

(assert (=> b!345639 (= e!211830 (contains!2238 Nil!5008 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345640 () Bool)

(assert (=> b!345640 (= e!211829 call!26732)))

(declare-fun d!70977 () Bool)

(declare-fun res!191218 () Bool)

(assert (=> d!70977 (=> res!191218 e!211831)))

(assert (=> d!70977 (= res!191218 (bvsge #b00000000000000000000000000000000 (size!9078 _keys!1895)))))

(assert (=> d!70977 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5008) e!211831)))

(declare-fun bm!26729 () Bool)

(assert (=> bm!26729 (= call!26732 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53003 (Cons!5007 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000) Nil!5008) Nil!5008)))))

(assert (= (and d!70977 (not res!191218)) b!345637))

(assert (= (and b!345637 res!191219) b!345639))

(assert (= (and b!345637 res!191217) b!345636))

(assert (= (and b!345636 c!53003) b!345640))

(assert (= (and b!345636 (not c!53003)) b!345638))

(assert (= (or b!345640 b!345638) bm!26729))

(declare-fun m!346435 () Bool)

(assert (=> b!345636 m!346435))

(assert (=> b!345636 m!346435))

(declare-fun m!346437 () Bool)

(assert (=> b!345636 m!346437))

(assert (=> b!345637 m!346435))

(assert (=> b!345637 m!346435))

(assert (=> b!345637 m!346437))

(assert (=> b!345639 m!346435))

(assert (=> b!345639 m!346435))

(declare-fun m!346439 () Bool)

(assert (=> b!345639 m!346439))

(assert (=> bm!26729 m!346435))

(declare-fun m!346441 () Bool)

(assert (=> bm!26729 m!346441))

(assert (=> b!345531 d!70977))

(declare-fun d!70979 () Bool)

(assert (=> d!70979 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345540 d!70979))

(declare-fun d!70981 () Bool)

(declare-fun res!191224 () Bool)

(declare-fun e!211836 () Bool)

(assert (=> d!70981 (=> res!191224 e!211836)))

(assert (=> d!70981 (= res!191224 (= (select (arr!8725 _keys!1895) (index!15620 lt!162834)) k0!1348))))

(assert (=> d!70981 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15620 lt!162834)) e!211836)))

(declare-fun b!345645 () Bool)

(declare-fun e!211837 () Bool)

(assert (=> b!345645 (= e!211836 e!211837)))

(declare-fun res!191225 () Bool)

(assert (=> b!345645 (=> (not res!191225) (not e!211837))))

(assert (=> b!345645 (= res!191225 (bvslt (bvadd (index!15620 lt!162834) #b00000000000000000000000000000001) (size!9078 _keys!1895)))))

(declare-fun b!345646 () Bool)

(assert (=> b!345646 (= e!211837 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15620 lt!162834) #b00000000000000000000000000000001)))))

(assert (= (and d!70981 (not res!191224)) b!345645))

(assert (= (and b!345645 res!191225) b!345646))

(assert (=> d!70981 m!346367))

(declare-fun m!346443 () Bool)

(assert (=> b!345646 m!346443))

(assert (=> b!345533 d!70981))

(declare-fun d!70983 () Bool)

(assert (=> d!70983 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34590 d!70983))

(declare-fun d!70985 () Bool)

(assert (=> d!70985 (= (array_inv!6486 _values!1525) (bvsge (size!9077 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34590 d!70985))

(declare-fun d!70987 () Bool)

(assert (=> d!70987 (= (array_inv!6487 _keys!1895) (bvsge (size!9078 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34590 d!70987))

(declare-fun d!70989 () Bool)

(declare-fun e!211842 () Bool)

(assert (=> d!70989 e!211842))

(declare-fun res!191228 () Bool)

(assert (=> d!70989 (=> res!191228 e!211842)))

(declare-fun lt!162859 () Bool)

(assert (=> d!70989 (= res!191228 (not lt!162859))))

(declare-fun lt!162861 () Bool)

(assert (=> d!70989 (= lt!162859 lt!162861)))

(declare-datatypes ((Unit!10718 0))(
  ( (Unit!10719) )
))
(declare-fun lt!162860 () Unit!10718)

(declare-fun e!211843 () Unit!10718)

(assert (=> d!70989 (= lt!162860 e!211843)))

(declare-fun c!53006 () Bool)

(assert (=> d!70989 (= c!53006 lt!162861)))

(declare-fun containsKey!331 (List!5012 (_ BitVec 64)) Bool)

(assert (=> d!70989 (= lt!162861 (containsKey!331 (toList!2164 (getCurrentListMap!1670 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70989 (= (contains!2236 (getCurrentListMap!1670 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162859)))

(declare-fun b!345653 () Bool)

(declare-fun lt!162858 () Unit!10718)

(assert (=> b!345653 (= e!211843 lt!162858)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!280 (List!5012 (_ BitVec 64)) Unit!10718)

(assert (=> b!345653 (= lt!162858 (lemmaContainsKeyImpliesGetValueByKeyDefined!280 (toList!2164 (getCurrentListMap!1670 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!345 0))(
  ( (Some!344 (v!5932 V!10875)) (None!343) )
))
(declare-fun isDefined!281 (Option!345) Bool)

(declare-fun getValueByKey!339 (List!5012 (_ BitVec 64)) Option!345)

(assert (=> b!345653 (isDefined!281 (getValueByKey!339 (toList!2164 (getCurrentListMap!1670 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!345654 () Bool)

(declare-fun Unit!10720 () Unit!10718)

(assert (=> b!345654 (= e!211843 Unit!10720)))

(declare-fun b!345655 () Bool)

(assert (=> b!345655 (= e!211842 (isDefined!281 (getValueByKey!339 (toList!2164 (getCurrentListMap!1670 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70989 c!53006) b!345653))

(assert (= (and d!70989 (not c!53006)) b!345654))

(assert (= (and d!70989 (not res!191228)) b!345655))

(declare-fun m!346445 () Bool)

(assert (=> d!70989 m!346445))

(declare-fun m!346447 () Bool)

(assert (=> b!345653 m!346447))

(declare-fun m!346449 () Bool)

(assert (=> b!345653 m!346449))

(assert (=> b!345653 m!346449))

(declare-fun m!346451 () Bool)

(assert (=> b!345653 m!346451))

(assert (=> b!345655 m!346449))

(assert (=> b!345655 m!346449))

(assert (=> b!345655 m!346451))

(assert (=> b!345539 d!70989))

(declare-fun b!345698 () Bool)

(declare-fun e!211872 () Bool)

(declare-fun lt!162918 () ListLongMap!4297)

(declare-fun apply!283 (ListLongMap!4297 (_ BitVec 64)) V!10875)

(assert (=> b!345698 (= e!211872 (= (apply!283 lt!162918 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!345699 () Bool)

(declare-fun e!211871 () Bool)

(assert (=> b!345699 (= e!211871 (validKeyInArray!0 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26744 () Bool)

(declare-fun call!26753 () ListLongMap!4297)

(declare-fun call!26749 () ListLongMap!4297)

(assert (=> bm!26744 (= call!26753 call!26749)))

(declare-fun bm!26745 () Bool)

(declare-fun call!26747 () ListLongMap!4297)

(declare-fun call!26748 () ListLongMap!4297)

(assert (=> bm!26745 (= call!26747 call!26748)))

(declare-fun b!345700 () Bool)

(declare-fun e!211880 () Bool)

(declare-fun e!211877 () Bool)

(assert (=> b!345700 (= e!211880 e!211877)))

(declare-fun c!53021 () Bool)

(assert (=> b!345700 (= c!53021 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345701 () Bool)

(declare-fun e!211878 () Bool)

(assert (=> b!345701 (= e!211878 (= (apply!283 lt!162918 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!345702 () Bool)

(declare-fun e!211875 () Bool)

(assert (=> b!345702 (= e!211875 e!211878)))

(declare-fun res!191251 () Bool)

(declare-fun call!26752 () Bool)

(assert (=> b!345702 (= res!191251 call!26752)))

(assert (=> b!345702 (=> (not res!191251) (not e!211878))))

(declare-fun b!345703 () Bool)

(declare-fun e!211870 () Bool)

(declare-fun e!211876 () Bool)

(assert (=> b!345703 (= e!211870 e!211876)))

(declare-fun res!191255 () Bool)

(assert (=> b!345703 (=> (not res!191255) (not e!211876))))

(assert (=> b!345703 (= res!191255 (contains!2236 lt!162918 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!345703 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9078 _keys!1895)))))

(declare-fun b!345704 () Bool)

(declare-fun res!191249 () Bool)

(assert (=> b!345704 (=> (not res!191249) (not e!211880))))

(assert (=> b!345704 (= res!191249 e!211875)))

(declare-fun c!53024 () Bool)

(assert (=> b!345704 (= c!53024 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!345705 () Bool)

(declare-fun e!211881 () ListLongMap!4297)

(declare-fun e!211874 () ListLongMap!4297)

(assert (=> b!345705 (= e!211881 e!211874)))

(declare-fun c!53023 () Bool)

(assert (=> b!345705 (= c!53023 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345706 () Bool)

(assert (=> b!345706 (= e!211875 (not call!26752))))

(declare-fun bm!26746 () Bool)

(assert (=> bm!26746 (= call!26752 (contains!2236 lt!162918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345707 () Bool)

(assert (=> b!345707 (= e!211877 e!211872)))

(declare-fun res!191253 () Bool)

(declare-fun call!26751 () Bool)

(assert (=> b!345707 (= res!191253 call!26751)))

(assert (=> b!345707 (=> (not res!191253) (not e!211872))))

(declare-fun b!345708 () Bool)

(declare-fun c!53020 () Bool)

(assert (=> b!345708 (= c!53020 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!211873 () ListLongMap!4297)

(assert (=> b!345708 (= e!211874 e!211873)))

(declare-fun d!70991 () Bool)

(assert (=> d!70991 e!211880))

(declare-fun res!191254 () Bool)

(assert (=> d!70991 (=> (not res!191254) (not e!211880))))

(assert (=> d!70991 (= res!191254 (or (bvsge #b00000000000000000000000000000000 (size!9078 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9078 _keys!1895)))))))

(declare-fun lt!162921 () ListLongMap!4297)

(assert (=> d!70991 (= lt!162918 lt!162921)))

(declare-fun lt!162914 () Unit!10718)

(declare-fun e!211879 () Unit!10718)

(assert (=> d!70991 (= lt!162914 e!211879)))

(declare-fun c!53019 () Bool)

(assert (=> d!70991 (= c!53019 e!211871)))

(declare-fun res!191252 () Bool)

(assert (=> d!70991 (=> (not res!191252) (not e!211871))))

(assert (=> d!70991 (= res!191252 (bvslt #b00000000000000000000000000000000 (size!9078 _keys!1895)))))

(assert (=> d!70991 (= lt!162921 e!211881)))

(declare-fun c!53022 () Bool)

(assert (=> d!70991 (= c!53022 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70991 (validMask!0 mask!2385)))

(assert (=> d!70991 (= (getCurrentListMap!1670 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162918)))

(declare-fun bm!26747 () Bool)

(assert (=> bm!26747 (= call!26751 (contains!2236 lt!162918 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345709 () Bool)

(declare-fun get!4697 (ValueCell!3368 V!10875) V!10875)

(declare-fun dynLambda!617 (Int (_ BitVec 64)) V!10875)

(assert (=> b!345709 (= e!211876 (= (apply!283 lt!162918 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000)) (get!4697 (select (arr!8724 _values!1525) #b00000000000000000000000000000000) (dynLambda!617 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345709 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9077 _values!1525)))))

(assert (=> b!345709 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9078 _keys!1895)))))

(declare-fun b!345710 () Bool)

(declare-fun +!736 (ListLongMap!4297 tuple2!5394) ListLongMap!4297)

(assert (=> b!345710 (= e!211881 (+!736 call!26749 (tuple2!5395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26748 () Bool)

(declare-fun call!26750 () ListLongMap!4297)

(assert (=> bm!26748 (= call!26749 (+!736 (ite c!53022 call!26748 (ite c!53023 call!26747 call!26750)) (ite (or c!53022 c!53023) (tuple2!5395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!345711 () Bool)

(declare-fun lt!162913 () Unit!10718)

(assert (=> b!345711 (= e!211879 lt!162913)))

(declare-fun lt!162919 () ListLongMap!4297)

(declare-fun getCurrentListMapNoExtraKeys!599 (array!18423 array!18421 (_ BitVec 32) (_ BitVec 32) V!10875 V!10875 (_ BitVec 32) Int) ListLongMap!4297)

(assert (=> b!345711 (= lt!162919 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162922 () (_ BitVec 64))

(assert (=> b!345711 (= lt!162922 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162924 () (_ BitVec 64))

(assert (=> b!345711 (= lt!162924 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162907 () Unit!10718)

(declare-fun addStillContains!259 (ListLongMap!4297 (_ BitVec 64) V!10875 (_ BitVec 64)) Unit!10718)

(assert (=> b!345711 (= lt!162907 (addStillContains!259 lt!162919 lt!162922 zeroValue!1467 lt!162924))))

(assert (=> b!345711 (contains!2236 (+!736 lt!162919 (tuple2!5395 lt!162922 zeroValue!1467)) lt!162924)))

(declare-fun lt!162910 () Unit!10718)

(assert (=> b!345711 (= lt!162910 lt!162907)))

(declare-fun lt!162923 () ListLongMap!4297)

(assert (=> b!345711 (= lt!162923 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162906 () (_ BitVec 64))

(assert (=> b!345711 (= lt!162906 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162916 () (_ BitVec 64))

(assert (=> b!345711 (= lt!162916 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162917 () Unit!10718)

(declare-fun addApplyDifferent!259 (ListLongMap!4297 (_ BitVec 64) V!10875 (_ BitVec 64)) Unit!10718)

(assert (=> b!345711 (= lt!162917 (addApplyDifferent!259 lt!162923 lt!162906 minValue!1467 lt!162916))))

(assert (=> b!345711 (= (apply!283 (+!736 lt!162923 (tuple2!5395 lt!162906 minValue!1467)) lt!162916) (apply!283 lt!162923 lt!162916))))

(declare-fun lt!162926 () Unit!10718)

(assert (=> b!345711 (= lt!162926 lt!162917)))

(declare-fun lt!162911 () ListLongMap!4297)

(assert (=> b!345711 (= lt!162911 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162909 () (_ BitVec 64))

(assert (=> b!345711 (= lt!162909 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162912 () (_ BitVec 64))

(assert (=> b!345711 (= lt!162912 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162908 () Unit!10718)

(assert (=> b!345711 (= lt!162908 (addApplyDifferent!259 lt!162911 lt!162909 zeroValue!1467 lt!162912))))

(assert (=> b!345711 (= (apply!283 (+!736 lt!162911 (tuple2!5395 lt!162909 zeroValue!1467)) lt!162912) (apply!283 lt!162911 lt!162912))))

(declare-fun lt!162915 () Unit!10718)

(assert (=> b!345711 (= lt!162915 lt!162908)))

(declare-fun lt!162927 () ListLongMap!4297)

(assert (=> b!345711 (= lt!162927 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162925 () (_ BitVec 64))

(assert (=> b!345711 (= lt!162925 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162920 () (_ BitVec 64))

(assert (=> b!345711 (= lt!162920 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!345711 (= lt!162913 (addApplyDifferent!259 lt!162927 lt!162925 minValue!1467 lt!162920))))

(assert (=> b!345711 (= (apply!283 (+!736 lt!162927 (tuple2!5395 lt!162925 minValue!1467)) lt!162920) (apply!283 lt!162927 lt!162920))))

(declare-fun bm!26749 () Bool)

(assert (=> bm!26749 (= call!26750 call!26747)))

(declare-fun b!345712 () Bool)

(assert (=> b!345712 (= e!211873 call!26750)))

(declare-fun b!345713 () Bool)

(assert (=> b!345713 (= e!211874 call!26753)))

(declare-fun b!345714 () Bool)

(assert (=> b!345714 (= e!211877 (not call!26751))))

(declare-fun b!345715 () Bool)

(declare-fun res!191250 () Bool)

(assert (=> b!345715 (=> (not res!191250) (not e!211880))))

(assert (=> b!345715 (= res!191250 e!211870)))

(declare-fun res!191247 () Bool)

(assert (=> b!345715 (=> res!191247 e!211870)))

(declare-fun e!211882 () Bool)

(assert (=> b!345715 (= res!191247 (not e!211882))))

(declare-fun res!191248 () Bool)

(assert (=> b!345715 (=> (not res!191248) (not e!211882))))

(assert (=> b!345715 (= res!191248 (bvslt #b00000000000000000000000000000000 (size!9078 _keys!1895)))))

(declare-fun b!345716 () Bool)

(assert (=> b!345716 (= e!211873 call!26753)))

(declare-fun bm!26750 () Bool)

(assert (=> bm!26750 (= call!26748 (getCurrentListMapNoExtraKeys!599 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!345717 () Bool)

(declare-fun Unit!10721 () Unit!10718)

(assert (=> b!345717 (= e!211879 Unit!10721)))

(declare-fun b!345718 () Bool)

(assert (=> b!345718 (= e!211882 (validKeyInArray!0 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70991 c!53022) b!345710))

(assert (= (and d!70991 (not c!53022)) b!345705))

(assert (= (and b!345705 c!53023) b!345713))

(assert (= (and b!345705 (not c!53023)) b!345708))

(assert (= (and b!345708 c!53020) b!345716))

(assert (= (and b!345708 (not c!53020)) b!345712))

(assert (= (or b!345716 b!345712) bm!26749))

(assert (= (or b!345713 bm!26749) bm!26745))

(assert (= (or b!345713 b!345716) bm!26744))

(assert (= (or b!345710 bm!26745) bm!26750))

(assert (= (or b!345710 bm!26744) bm!26748))

(assert (= (and d!70991 res!191252) b!345699))

(assert (= (and d!70991 c!53019) b!345711))

(assert (= (and d!70991 (not c!53019)) b!345717))

(assert (= (and d!70991 res!191254) b!345715))

(assert (= (and b!345715 res!191248) b!345718))

(assert (= (and b!345715 (not res!191247)) b!345703))

(assert (= (and b!345703 res!191255) b!345709))

(assert (= (and b!345715 res!191250) b!345704))

(assert (= (and b!345704 c!53024) b!345702))

(assert (= (and b!345704 (not c!53024)) b!345706))

(assert (= (and b!345702 res!191251) b!345701))

(assert (= (or b!345702 b!345706) bm!26746))

(assert (= (and b!345704 res!191249) b!345700))

(assert (= (and b!345700 c!53021) b!345707))

(assert (= (and b!345700 (not c!53021)) b!345714))

(assert (= (and b!345707 res!191253) b!345698))

(assert (= (or b!345707 b!345714) bm!26747))

(declare-fun b_lambda!8453 () Bool)

(assert (=> (not b_lambda!8453) (not b!345709)))

(declare-fun t!10129 () Bool)

(declare-fun tb!3073 () Bool)

(assert (=> (and start!34590 (= defaultEntry!1528 defaultEntry!1528) t!10129) tb!3073))

(declare-fun result!5565 () Bool)

(assert (=> tb!3073 (= result!5565 tp_is_empty!7423)))

(assert (=> b!345709 t!10129))

(declare-fun b_and!14665 () Bool)

(assert (= b_and!14659 (and (=> t!10129 result!5565) b_and!14665)))

(assert (=> d!70991 m!346349))

(assert (=> b!345718 m!346435))

(assert (=> b!345718 m!346435))

(assert (=> b!345718 m!346437))

(assert (=> b!345699 m!346435))

(assert (=> b!345699 m!346435))

(assert (=> b!345699 m!346437))

(declare-fun m!346453 () Bool)

(assert (=> b!345711 m!346453))

(declare-fun m!346455 () Bool)

(assert (=> b!345711 m!346455))

(declare-fun m!346457 () Bool)

(assert (=> b!345711 m!346457))

(declare-fun m!346459 () Bool)

(assert (=> b!345711 m!346459))

(declare-fun m!346461 () Bool)

(assert (=> b!345711 m!346461))

(declare-fun m!346463 () Bool)

(assert (=> b!345711 m!346463))

(assert (=> b!345711 m!346435))

(declare-fun m!346465 () Bool)

(assert (=> b!345711 m!346465))

(declare-fun m!346467 () Bool)

(assert (=> b!345711 m!346467))

(declare-fun m!346469 () Bool)

(assert (=> b!345711 m!346469))

(assert (=> b!345711 m!346453))

(assert (=> b!345711 m!346459))

(declare-fun m!346471 () Bool)

(assert (=> b!345711 m!346471))

(assert (=> b!345711 m!346461))

(declare-fun m!346473 () Bool)

(assert (=> b!345711 m!346473))

(declare-fun m!346475 () Bool)

(assert (=> b!345711 m!346475))

(declare-fun m!346477 () Bool)

(assert (=> b!345711 m!346477))

(assert (=> b!345711 m!346457))

(declare-fun m!346479 () Bool)

(assert (=> b!345711 m!346479))

(declare-fun m!346481 () Bool)

(assert (=> b!345711 m!346481))

(declare-fun m!346483 () Bool)

(assert (=> b!345711 m!346483))

(declare-fun m!346485 () Bool)

(assert (=> bm!26746 m!346485))

(declare-fun m!346487 () Bool)

(assert (=> b!345710 m!346487))

(declare-fun m!346489 () Bool)

(assert (=> b!345698 m!346489))

(declare-fun m!346491 () Bool)

(assert (=> b!345709 m!346491))

(declare-fun m!346493 () Bool)

(assert (=> b!345709 m!346493))

(assert (=> b!345709 m!346435))

(assert (=> b!345709 m!346435))

(declare-fun m!346495 () Bool)

(assert (=> b!345709 m!346495))

(assert (=> b!345709 m!346493))

(assert (=> b!345709 m!346491))

(declare-fun m!346497 () Bool)

(assert (=> b!345709 m!346497))

(declare-fun m!346499 () Bool)

(assert (=> b!345701 m!346499))

(assert (=> bm!26750 m!346477))

(declare-fun m!346501 () Bool)

(assert (=> bm!26747 m!346501))

(assert (=> b!345703 m!346435))

(assert (=> b!345703 m!346435))

(declare-fun m!346503 () Bool)

(assert (=> b!345703 m!346503))

(declare-fun m!346505 () Bool)

(assert (=> bm!26748 m!346505))

(assert (=> b!345539 d!70991))

(declare-fun b!345729 () Bool)

(declare-fun e!211890 () Bool)

(declare-fun e!211891 () Bool)

(assert (=> b!345729 (= e!211890 e!211891)))

(declare-fun lt!162935 () (_ BitVec 64))

(assert (=> b!345729 (= lt!162935 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162934 () Unit!10718)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18423 (_ BitVec 64) (_ BitVec 32)) Unit!10718)

(assert (=> b!345729 (= lt!162934 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162935 #b00000000000000000000000000000000))))

(assert (=> b!345729 (arrayContainsKey!0 _keys!1895 lt!162935 #b00000000000000000000000000000000)))

(declare-fun lt!162936 () Unit!10718)

(assert (=> b!345729 (= lt!162936 lt!162934)))

(declare-fun res!191260 () Bool)

(assert (=> b!345729 (= res!191260 (= (seekEntryOrOpen!0 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3360 #b00000000000000000000000000000000)))))

(assert (=> b!345729 (=> (not res!191260) (not e!211891))))

(declare-fun bm!26753 () Bool)

(declare-fun call!26756 () Bool)

(assert (=> bm!26753 (= call!26756 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!345730 () Bool)

(assert (=> b!345730 (= e!211890 call!26756)))

(declare-fun b!345731 () Bool)

(assert (=> b!345731 (= e!211891 call!26756)))

(declare-fun d!70993 () Bool)

(declare-fun res!191261 () Bool)

(declare-fun e!211889 () Bool)

(assert (=> d!70993 (=> res!191261 e!211889)))

(assert (=> d!70993 (= res!191261 (bvsge #b00000000000000000000000000000000 (size!9078 _keys!1895)))))

(assert (=> d!70993 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!211889)))

(declare-fun b!345732 () Bool)

(assert (=> b!345732 (= e!211889 e!211890)))

(declare-fun c!53027 () Bool)

(assert (=> b!345732 (= c!53027 (validKeyInArray!0 (select (arr!8725 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70993 (not res!191261)) b!345732))

(assert (= (and b!345732 c!53027) b!345729))

(assert (= (and b!345732 (not c!53027)) b!345730))

(assert (= (and b!345729 res!191260) b!345731))

(assert (= (or b!345731 b!345730) bm!26753))

(assert (=> b!345729 m!346435))

(declare-fun m!346507 () Bool)

(assert (=> b!345729 m!346507))

(declare-fun m!346509 () Bool)

(assert (=> b!345729 m!346509))

(assert (=> b!345729 m!346435))

(declare-fun m!346511 () Bool)

(assert (=> b!345729 m!346511))

(declare-fun m!346513 () Bool)

(assert (=> bm!26753 m!346513))

(assert (=> b!345732 m!346435))

(assert (=> b!345732 m!346435))

(assert (=> b!345732 m!346437))

(assert (=> b!345535 d!70993))

(declare-fun condMapEmpty!12591 () Bool)

(declare-fun mapDefault!12591 () ValueCell!3368)

(assert (=> mapNonEmpty!12582 (= condMapEmpty!12591 (= mapRest!12582 ((as const (Array (_ BitVec 32) ValueCell!3368)) mapDefault!12591)))))

(declare-fun e!211896 () Bool)

(declare-fun mapRes!12591 () Bool)

(assert (=> mapNonEmpty!12582 (= tp!25968 (and e!211896 mapRes!12591))))

(declare-fun b!345740 () Bool)

(assert (=> b!345740 (= e!211896 tp_is_empty!7423)))

(declare-fun b!345739 () Bool)

(declare-fun e!211897 () Bool)

(assert (=> b!345739 (= e!211897 tp_is_empty!7423)))

(declare-fun mapIsEmpty!12591 () Bool)

(assert (=> mapIsEmpty!12591 mapRes!12591))

(declare-fun mapNonEmpty!12591 () Bool)

(declare-fun tp!25983 () Bool)

(assert (=> mapNonEmpty!12591 (= mapRes!12591 (and tp!25983 e!211897))))

(declare-fun mapValue!12591 () ValueCell!3368)

(declare-fun mapRest!12591 () (Array (_ BitVec 32) ValueCell!3368))

(declare-fun mapKey!12591 () (_ BitVec 32))

(assert (=> mapNonEmpty!12591 (= mapRest!12582 (store mapRest!12591 mapKey!12591 mapValue!12591))))

(assert (= (and mapNonEmpty!12582 condMapEmpty!12591) mapIsEmpty!12591))

(assert (= (and mapNonEmpty!12582 (not condMapEmpty!12591)) mapNonEmpty!12591))

(assert (= (and mapNonEmpty!12591 ((_ is ValueCellFull!3368) mapValue!12591)) b!345739))

(assert (= (and mapNonEmpty!12582 ((_ is ValueCellFull!3368) mapDefault!12591)) b!345740))

(declare-fun m!346515 () Bool)

(assert (=> mapNonEmpty!12591 m!346515))

(declare-fun b_lambda!8455 () Bool)

(assert (= b_lambda!8453 (or (and start!34590 b_free!7471) b_lambda!8455)))

(check-sat (not b!345699) (not b!345655) (not b!345698) (not b!345637) (not bm!26748) (not bm!26750) (not bm!26747) (not b!345639) (not d!70975) (not bm!26729) (not b!345711) (not b!345653) b_and!14665 (not b_lambda!8455) (not b!345709) (not bm!26746) (not d!70991) tp_is_empty!7423 (not b!345710) (not d!70989) (not b!345718) (not mapNonEmpty!12591) (not b!345703) (not b!345636) (not b!345620) (not b!345729) (not b_next!7471) (not b!345701) (not b!345646) (not b!345732) (not bm!26753))
(check-sat b_and!14665 (not b_next!7471))
