; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33940 () Bool)

(assert start!33940)

(declare-fun b_free!7095 () Bool)

(declare-fun b_next!7095 () Bool)

(assert (=> start!33940 (= b_free!7095 (not b_next!7095))))

(declare-fun tp!24801 () Bool)

(declare-fun b_and!14283 () Bool)

(assert (=> start!33940 (= tp!24801 b_and!14283)))

(declare-fun b!338049 () Bool)

(declare-fun e!207424 () Bool)

(declare-fun tp_is_empty!7047 () Bool)

(assert (=> b!338049 (= e!207424 tp_is_empty!7047)))

(declare-fun b!338050 () Bool)

(declare-datatypes ((Unit!10487 0))(
  ( (Unit!10488) )
))
(declare-fun e!207422 () Unit!10487)

(declare-fun Unit!10489 () Unit!10487)

(assert (=> b!338050 (= e!207422 Unit!10489)))

(declare-fun b!338051 () Bool)

(declare-fun res!186754 () Bool)

(declare-fun e!207423 () Bool)

(assert (=> b!338051 (=> (not res!186754) (not e!207423))))

(declare-datatypes ((array!17687 0))(
  ( (array!17688 (arr!8370 (Array (_ BitVec 32) (_ BitVec 64))) (size!8722 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17687)

(declare-datatypes ((List!4796 0))(
  ( (Nil!4793) (Cons!4792 (h!5648 (_ BitVec 64)) (t!9892 List!4796)) )
))
(declare-fun arrayNoDuplicates!0 (array!17687 (_ BitVec 32) List!4796) Bool)

(assert (=> b!338051 (= res!186754 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4793))))

(declare-fun b!338052 () Bool)

(declare-fun res!186751 () Bool)

(assert (=> b!338052 (=> (not res!186751) (not e!207423))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((V!10373 0))(
  ( (V!10374 (val!3568 Int)) )
))
(declare-datatypes ((ValueCell!3180 0))(
  ( (ValueCellFull!3180 (v!5734 V!10373)) (EmptyCell!3180) )
))
(declare-datatypes ((array!17689 0))(
  ( (array!17690 (arr!8371 (Array (_ BitVec 32) ValueCell!3180)) (size!8723 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17689)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10373)

(declare-fun zeroValue!1467 () V!10373)

(declare-datatypes ((tuple2!5180 0))(
  ( (tuple2!5181 (_1!2601 (_ BitVec 64)) (_2!2601 V!10373)) )
))
(declare-datatypes ((List!4797 0))(
  ( (Nil!4794) (Cons!4793 (h!5649 tuple2!5180) (t!9893 List!4797)) )
))
(declare-datatypes ((ListLongMap!4093 0))(
  ( (ListLongMap!4094 (toList!2062 List!4797)) )
))
(declare-fun contains!2110 (ListLongMap!4093 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1583 (array!17687 array!17689 (_ BitVec 32) (_ BitVec 32) V!10373 V!10373 (_ BitVec 32) Int) ListLongMap!4093)

(assert (=> b!338052 (= res!186751 (not (contains!2110 (getCurrentListMap!1583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338053 () Bool)

(declare-fun res!186755 () Bool)

(assert (=> b!338053 (=> (not res!186755) (not e!207423))))

(assert (=> b!338053 (= res!186755 (and (= (size!8723 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8722 _keys!1895) (size!8723 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11979 () Bool)

(declare-fun mapRes!11979 () Bool)

(declare-fun tp!24800 () Bool)

(assert (=> mapNonEmpty!11979 (= mapRes!11979 (and tp!24800 e!207424))))

(declare-fun mapValue!11979 () ValueCell!3180)

(declare-fun mapRest!11979 () (Array (_ BitVec 32) ValueCell!3180))

(declare-fun mapKey!11979 () (_ BitVec 32))

(assert (=> mapNonEmpty!11979 (= (arr!8371 _values!1525) (store mapRest!11979 mapKey!11979 mapValue!11979))))

(declare-fun res!186749 () Bool)

(assert (=> start!33940 (=> (not res!186749) (not e!207423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33940 (= res!186749 (validMask!0 mask!2385))))

(assert (=> start!33940 e!207423))

(assert (=> start!33940 true))

(assert (=> start!33940 tp_is_empty!7047))

(assert (=> start!33940 tp!24801))

(declare-fun e!207420 () Bool)

(declare-fun array_inv!6212 (array!17689) Bool)

(assert (=> start!33940 (and (array_inv!6212 _values!1525) e!207420)))

(declare-fun array_inv!6213 (array!17687) Bool)

(assert (=> start!33940 (array_inv!6213 _keys!1895)))

(declare-fun b!338054 () Bool)

(declare-fun Unit!10490 () Unit!10487)

(assert (=> b!338054 (= e!207422 Unit!10490)))

(declare-fun lt!160640 () Unit!10487)

(declare-fun lemmaArrayContainsKeyThenInListMap!268 (array!17687 array!17689 (_ BitVec 32) (_ BitVec 32) V!10373 V!10373 (_ BitVec 64) (_ BitVec 32) Int) Unit!10487)

(declare-fun arrayScanForKey!0 (array!17687 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338054 (= lt!160640 (lemmaArrayContainsKeyThenInListMap!268 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338054 false))

(declare-fun b!338055 () Bool)

(declare-fun e!207426 () Bool)

(assert (=> b!338055 (= e!207420 (and e!207426 mapRes!11979))))

(declare-fun condMapEmpty!11979 () Bool)

(declare-fun mapDefault!11979 () ValueCell!3180)

(assert (=> b!338055 (= condMapEmpty!11979 (= (arr!8371 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3180)) mapDefault!11979)))))

(declare-fun b!338056 () Bool)

(declare-fun e!207425 () Bool)

(assert (=> b!338056 (= e!207423 e!207425)))

(declare-fun res!186750 () Bool)

(assert (=> b!338056 (=> (not res!186750) (not e!207425))))

(declare-datatypes ((SeekEntryResult!3232 0))(
  ( (MissingZero!3232 (index!15107 (_ BitVec 32))) (Found!3232 (index!15108 (_ BitVec 32))) (Intermediate!3232 (undefined!4044 Bool) (index!15109 (_ BitVec 32)) (x!33686 (_ BitVec 32))) (Undefined!3232) (MissingVacant!3232 (index!15110 (_ BitVec 32))) )
))
(declare-fun lt!160641 () SeekEntryResult!3232)

(get-info :version)

(assert (=> b!338056 (= res!186750 (and (not ((_ is Found!3232) lt!160641)) ((_ is MissingZero!3232) lt!160641)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17687 (_ BitVec 32)) SeekEntryResult!3232)

(assert (=> b!338056 (= lt!160641 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338057 () Bool)

(assert (=> b!338057 (= e!207425 (and (bvslt #b00000000000000000000000000000000 (size!8722 _keys!1895)) (bvsge (size!8722 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun lt!160642 () Unit!10487)

(assert (=> b!338057 (= lt!160642 e!207422)))

(declare-fun c!52365 () Bool)

(declare-fun arrayContainsKey!0 (array!17687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338057 (= c!52365 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!11979 () Bool)

(assert (=> mapIsEmpty!11979 mapRes!11979))

(declare-fun b!338058 () Bool)

(declare-fun res!186752 () Bool)

(assert (=> b!338058 (=> (not res!186752) (not e!207423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338058 (= res!186752 (validKeyInArray!0 k0!1348))))

(declare-fun b!338059 () Bool)

(assert (=> b!338059 (= e!207426 tp_is_empty!7047)))

(declare-fun b!338060 () Bool)

(declare-fun res!186753 () Bool)

(assert (=> b!338060 (=> (not res!186753) (not e!207423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17687 (_ BitVec 32)) Bool)

(assert (=> b!338060 (= res!186753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33940 res!186749) b!338053))

(assert (= (and b!338053 res!186755) b!338060))

(assert (= (and b!338060 res!186753) b!338051))

(assert (= (and b!338051 res!186754) b!338058))

(assert (= (and b!338058 res!186752) b!338052))

(assert (= (and b!338052 res!186751) b!338056))

(assert (= (and b!338056 res!186750) b!338057))

(assert (= (and b!338057 c!52365) b!338054))

(assert (= (and b!338057 (not c!52365)) b!338050))

(assert (= (and b!338055 condMapEmpty!11979) mapIsEmpty!11979))

(assert (= (and b!338055 (not condMapEmpty!11979)) mapNonEmpty!11979))

(assert (= (and mapNonEmpty!11979 ((_ is ValueCellFull!3180) mapValue!11979)) b!338049))

(assert (= (and b!338055 ((_ is ValueCellFull!3180) mapDefault!11979)) b!338059))

(assert (= start!33940 b!338055))

(declare-fun m!341407 () Bool)

(assert (=> b!338057 m!341407))

(declare-fun m!341409 () Bool)

(assert (=> b!338054 m!341409))

(assert (=> b!338054 m!341409))

(declare-fun m!341411 () Bool)

(assert (=> b!338054 m!341411))

(declare-fun m!341413 () Bool)

(assert (=> b!338056 m!341413))

(declare-fun m!341415 () Bool)

(assert (=> b!338060 m!341415))

(declare-fun m!341417 () Bool)

(assert (=> start!33940 m!341417))

(declare-fun m!341419 () Bool)

(assert (=> start!33940 m!341419))

(declare-fun m!341421 () Bool)

(assert (=> start!33940 m!341421))

(declare-fun m!341423 () Bool)

(assert (=> mapNonEmpty!11979 m!341423))

(declare-fun m!341425 () Bool)

(assert (=> b!338058 m!341425))

(declare-fun m!341427 () Bool)

(assert (=> b!338051 m!341427))

(declare-fun m!341429 () Bool)

(assert (=> b!338052 m!341429))

(assert (=> b!338052 m!341429))

(declare-fun m!341431 () Bool)

(assert (=> b!338052 m!341431))

(check-sat (not b_next!7095) (not b!338057) tp_is_empty!7047 b_and!14283 (not b!338054) (not b!338051) (not b!338052) (not mapNonEmpty!11979) (not b!338060) (not b!338056) (not b!338058) (not start!33940))
(check-sat b_and!14283 (not b_next!7095))
(get-model)

(declare-fun d!70767 () Bool)

(assert (=> d!70767 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!338058 d!70767))

(declare-fun d!70769 () Bool)

(assert (=> d!70769 (contains!2110 (getCurrentListMap!1583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!160654 () Unit!10487)

(declare-fun choose!1299 (array!17687 array!17689 (_ BitVec 32) (_ BitVec 32) V!10373 V!10373 (_ BitVec 64) (_ BitVec 32) Int) Unit!10487)

(assert (=> d!70769 (= lt!160654 (choose!1299 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70769 (validMask!0 mask!2385)))

(assert (=> d!70769 (= (lemmaArrayContainsKeyThenInListMap!268 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!160654)))

(declare-fun bs!11643 () Bool)

(assert (= bs!11643 d!70769))

(assert (=> bs!11643 m!341429))

(assert (=> bs!11643 m!341429))

(assert (=> bs!11643 m!341431))

(assert (=> bs!11643 m!341409))

(declare-fun m!341459 () Bool)

(assert (=> bs!11643 m!341459))

(assert (=> bs!11643 m!341417))

(assert (=> b!338054 d!70769))

(declare-fun d!70771 () Bool)

(declare-fun lt!160657 () (_ BitVec 32))

(assert (=> d!70771 (and (or (bvslt lt!160657 #b00000000000000000000000000000000) (bvsge lt!160657 (size!8722 _keys!1895)) (and (bvsge lt!160657 #b00000000000000000000000000000000) (bvslt lt!160657 (size!8722 _keys!1895)))) (bvsge lt!160657 #b00000000000000000000000000000000) (bvslt lt!160657 (size!8722 _keys!1895)) (= (select (arr!8370 _keys!1895) lt!160657) k0!1348))))

(declare-fun e!207450 () (_ BitVec 32))

(assert (=> d!70771 (= lt!160657 e!207450)))

(declare-fun c!52371 () Bool)

(assert (=> d!70771 (= c!52371 (= (select (arr!8370 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8722 _keys!1895)) (bvslt (size!8722 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70771 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!160657)))

(declare-fun b!338101 () Bool)

(assert (=> b!338101 (= e!207450 #b00000000000000000000000000000000)))

(declare-fun b!338102 () Bool)

(assert (=> b!338102 (= e!207450 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70771 c!52371) b!338101))

(assert (= (and d!70771 (not c!52371)) b!338102))

(declare-fun m!341461 () Bool)

(assert (=> d!70771 m!341461))

(declare-fun m!341463 () Bool)

(assert (=> d!70771 m!341463))

(declare-fun m!341465 () Bool)

(assert (=> b!338102 m!341465))

(assert (=> b!338054 d!70771))

(declare-fun b!338113 () Bool)

(declare-fun e!207462 () Bool)

(declare-fun call!26407 () Bool)

(assert (=> b!338113 (= e!207462 call!26407)))

(declare-fun d!70773 () Bool)

(declare-fun res!186783 () Bool)

(declare-fun e!207459 () Bool)

(assert (=> d!70773 (=> res!186783 e!207459)))

(assert (=> d!70773 (= res!186783 (bvsge #b00000000000000000000000000000000 (size!8722 _keys!1895)))))

(assert (=> d!70773 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4793) e!207459)))

(declare-fun b!338114 () Bool)

(declare-fun e!207461 () Bool)

(assert (=> b!338114 (= e!207461 e!207462)))

(declare-fun c!52374 () Bool)

(assert (=> b!338114 (= c!52374 (validKeyInArray!0 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338115 () Bool)

(assert (=> b!338115 (= e!207459 e!207461)))

(declare-fun res!186784 () Bool)

(assert (=> b!338115 (=> (not res!186784) (not e!207461))))

(declare-fun e!207460 () Bool)

(assert (=> b!338115 (= res!186784 (not e!207460))))

(declare-fun res!186785 () Bool)

(assert (=> b!338115 (=> (not res!186785) (not e!207460))))

(assert (=> b!338115 (= res!186785 (validKeyInArray!0 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26404 () Bool)

(assert (=> bm!26404 (= call!26407 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52374 (Cons!4792 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000) Nil!4793) Nil!4793)))))

(declare-fun b!338116 () Bool)

(assert (=> b!338116 (= e!207462 call!26407)))

(declare-fun b!338117 () Bool)

(declare-fun contains!2112 (List!4796 (_ BitVec 64)) Bool)

(assert (=> b!338117 (= e!207460 (contains!2112 Nil!4793 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70773 (not res!186783)) b!338115))

(assert (= (and b!338115 res!186785) b!338117))

(assert (= (and b!338115 res!186784) b!338114))

(assert (= (and b!338114 c!52374) b!338116))

(assert (= (and b!338114 (not c!52374)) b!338113))

(assert (= (or b!338116 b!338113) bm!26404))

(assert (=> b!338114 m!341463))

(assert (=> b!338114 m!341463))

(declare-fun m!341467 () Bool)

(assert (=> b!338114 m!341467))

(assert (=> b!338115 m!341463))

(assert (=> b!338115 m!341463))

(assert (=> b!338115 m!341467))

(assert (=> bm!26404 m!341463))

(declare-fun m!341469 () Bool)

(assert (=> bm!26404 m!341469))

(assert (=> b!338117 m!341463))

(assert (=> b!338117 m!341463))

(declare-fun m!341471 () Bool)

(assert (=> b!338117 m!341471))

(assert (=> b!338051 d!70773))

(declare-fun b!338127 () Bool)

(declare-fun e!207469 () Bool)

(declare-fun e!207471 () Bool)

(assert (=> b!338127 (= e!207469 e!207471)))

(declare-fun lt!160664 () (_ BitVec 64))

(assert (=> b!338127 (= lt!160664 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160666 () Unit!10487)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17687 (_ BitVec 64) (_ BitVec 32)) Unit!10487)

(assert (=> b!338127 (= lt!160666 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160664 #b00000000000000000000000000000000))))

(assert (=> b!338127 (arrayContainsKey!0 _keys!1895 lt!160664 #b00000000000000000000000000000000)))

(declare-fun lt!160665 () Unit!10487)

(assert (=> b!338127 (= lt!160665 lt!160666)))

(declare-fun res!186791 () Bool)

(assert (=> b!338127 (= res!186791 (= (seekEntryOrOpen!0 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3232 #b00000000000000000000000000000000)))))

(assert (=> b!338127 (=> (not res!186791) (not e!207471))))

(declare-fun b!338128 () Bool)

(declare-fun e!207470 () Bool)

(assert (=> b!338128 (= e!207470 e!207469)))

(declare-fun c!52377 () Bool)

(assert (=> b!338128 (= c!52377 (validKeyInArray!0 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70775 () Bool)

(declare-fun res!186790 () Bool)

(assert (=> d!70775 (=> res!186790 e!207470)))

(assert (=> d!70775 (= res!186790 (bvsge #b00000000000000000000000000000000 (size!8722 _keys!1895)))))

(assert (=> d!70775 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!207470)))

(declare-fun b!338126 () Bool)

(declare-fun call!26410 () Bool)

(assert (=> b!338126 (= e!207469 call!26410)))

(declare-fun b!338129 () Bool)

(assert (=> b!338129 (= e!207471 call!26410)))

(declare-fun bm!26407 () Bool)

(assert (=> bm!26407 (= call!26410 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!70775 (not res!186790)) b!338128))

(assert (= (and b!338128 c!52377) b!338127))

(assert (= (and b!338128 (not c!52377)) b!338126))

(assert (= (and b!338127 res!186791) b!338129))

(assert (= (or b!338129 b!338126) bm!26407))

(assert (=> b!338127 m!341463))

(declare-fun m!341473 () Bool)

(assert (=> b!338127 m!341473))

(declare-fun m!341475 () Bool)

(assert (=> b!338127 m!341475))

(assert (=> b!338127 m!341463))

(declare-fun m!341477 () Bool)

(assert (=> b!338127 m!341477))

(assert (=> b!338128 m!341463))

(assert (=> b!338128 m!341463))

(assert (=> b!338128 m!341467))

(declare-fun m!341479 () Bool)

(assert (=> bm!26407 m!341479))

(assert (=> b!338060 d!70775))

(declare-fun b!338142 () Bool)

(declare-fun e!207479 () SeekEntryResult!3232)

(declare-fun lt!160674 () SeekEntryResult!3232)

(assert (=> b!338142 (= e!207479 (MissingZero!3232 (index!15109 lt!160674)))))

(declare-fun b!338143 () Bool)

(declare-fun e!207480 () SeekEntryResult!3232)

(assert (=> b!338143 (= e!207480 Undefined!3232)))

(declare-fun b!338144 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17687 (_ BitVec 32)) SeekEntryResult!3232)

(assert (=> b!338144 (= e!207479 (seekKeyOrZeroReturnVacant!0 (x!33686 lt!160674) (index!15109 lt!160674) (index!15109 lt!160674) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338145 () Bool)

(declare-fun e!207478 () SeekEntryResult!3232)

(assert (=> b!338145 (= e!207480 e!207478)))

(declare-fun lt!160673 () (_ BitVec 64))

(assert (=> b!338145 (= lt!160673 (select (arr!8370 _keys!1895) (index!15109 lt!160674)))))

(declare-fun c!52385 () Bool)

(assert (=> b!338145 (= c!52385 (= lt!160673 k0!1348))))

(declare-fun b!338146 () Bool)

(assert (=> b!338146 (= e!207478 (Found!3232 (index!15109 lt!160674)))))

(declare-fun b!338147 () Bool)

(declare-fun c!52384 () Bool)

(assert (=> b!338147 (= c!52384 (= lt!160673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!338147 (= e!207478 e!207479)))

(declare-fun d!70777 () Bool)

(declare-fun lt!160675 () SeekEntryResult!3232)

(assert (=> d!70777 (and (or ((_ is Undefined!3232) lt!160675) (not ((_ is Found!3232) lt!160675)) (and (bvsge (index!15108 lt!160675) #b00000000000000000000000000000000) (bvslt (index!15108 lt!160675) (size!8722 _keys!1895)))) (or ((_ is Undefined!3232) lt!160675) ((_ is Found!3232) lt!160675) (not ((_ is MissingZero!3232) lt!160675)) (and (bvsge (index!15107 lt!160675) #b00000000000000000000000000000000) (bvslt (index!15107 lt!160675) (size!8722 _keys!1895)))) (or ((_ is Undefined!3232) lt!160675) ((_ is Found!3232) lt!160675) ((_ is MissingZero!3232) lt!160675) (not ((_ is MissingVacant!3232) lt!160675)) (and (bvsge (index!15110 lt!160675) #b00000000000000000000000000000000) (bvslt (index!15110 lt!160675) (size!8722 _keys!1895)))) (or ((_ is Undefined!3232) lt!160675) (ite ((_ is Found!3232) lt!160675) (= (select (arr!8370 _keys!1895) (index!15108 lt!160675)) k0!1348) (ite ((_ is MissingZero!3232) lt!160675) (= (select (arr!8370 _keys!1895) (index!15107 lt!160675)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3232) lt!160675) (= (select (arr!8370 _keys!1895) (index!15110 lt!160675)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70777 (= lt!160675 e!207480)))

(declare-fun c!52386 () Bool)

(assert (=> d!70777 (= c!52386 (and ((_ is Intermediate!3232) lt!160674) (undefined!4044 lt!160674)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17687 (_ BitVec 32)) SeekEntryResult!3232)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70777 (= lt!160674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70777 (validMask!0 mask!2385)))

(assert (=> d!70777 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160675)))

(assert (= (and d!70777 c!52386) b!338143))

(assert (= (and d!70777 (not c!52386)) b!338145))

(assert (= (and b!338145 c!52385) b!338146))

(assert (= (and b!338145 (not c!52385)) b!338147))

(assert (= (and b!338147 c!52384) b!338142))

(assert (= (and b!338147 (not c!52384)) b!338144))

(declare-fun m!341481 () Bool)

(assert (=> b!338144 m!341481))

(declare-fun m!341483 () Bool)

(assert (=> b!338145 m!341483))

(declare-fun m!341485 () Bool)

(assert (=> d!70777 m!341485))

(declare-fun m!341487 () Bool)

(assert (=> d!70777 m!341487))

(declare-fun m!341489 () Bool)

(assert (=> d!70777 m!341489))

(declare-fun m!341491 () Bool)

(assert (=> d!70777 m!341491))

(assert (=> d!70777 m!341487))

(declare-fun m!341493 () Bool)

(assert (=> d!70777 m!341493))

(assert (=> d!70777 m!341417))

(assert (=> b!338056 d!70777))

(declare-fun d!70779 () Bool)

(declare-fun e!207486 () Bool)

(assert (=> d!70779 e!207486))

(declare-fun res!186794 () Bool)

(assert (=> d!70779 (=> res!186794 e!207486)))

(declare-fun lt!160687 () Bool)

(assert (=> d!70779 (= res!186794 (not lt!160687))))

(declare-fun lt!160685 () Bool)

(assert (=> d!70779 (= lt!160687 lt!160685)))

(declare-fun lt!160686 () Unit!10487)

(declare-fun e!207485 () Unit!10487)

(assert (=> d!70779 (= lt!160686 e!207485)))

(declare-fun c!52389 () Bool)

(assert (=> d!70779 (= c!52389 lt!160685)))

(declare-fun containsKey!320 (List!4797 (_ BitVec 64)) Bool)

(assert (=> d!70779 (= lt!160685 (containsKey!320 (toList!2062 (getCurrentListMap!1583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70779 (= (contains!2110 (getCurrentListMap!1583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160687)))

(declare-fun b!338154 () Bool)

(declare-fun lt!160684 () Unit!10487)

(assert (=> b!338154 (= e!207485 lt!160684)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!268 (List!4797 (_ BitVec 64)) Unit!10487)

(assert (=> b!338154 (= lt!160684 (lemmaContainsKeyImpliesGetValueByKeyDefined!268 (toList!2062 (getCurrentListMap!1583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!334 0))(
  ( (Some!333 (v!5736 V!10373)) (None!332) )
))
(declare-fun isDefined!269 (Option!334) Bool)

(declare-fun getValueByKey!328 (List!4797 (_ BitVec 64)) Option!334)

(assert (=> b!338154 (isDefined!269 (getValueByKey!328 (toList!2062 (getCurrentListMap!1583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!338155 () Bool)

(declare-fun Unit!10495 () Unit!10487)

(assert (=> b!338155 (= e!207485 Unit!10495)))

(declare-fun b!338156 () Bool)

(assert (=> b!338156 (= e!207486 (isDefined!269 (getValueByKey!328 (toList!2062 (getCurrentListMap!1583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70779 c!52389) b!338154))

(assert (= (and d!70779 (not c!52389)) b!338155))

(assert (= (and d!70779 (not res!186794)) b!338156))

(declare-fun m!341495 () Bool)

(assert (=> d!70779 m!341495))

(declare-fun m!341497 () Bool)

(assert (=> b!338154 m!341497))

(declare-fun m!341499 () Bool)

(assert (=> b!338154 m!341499))

(assert (=> b!338154 m!341499))

(declare-fun m!341501 () Bool)

(assert (=> b!338154 m!341501))

(assert (=> b!338156 m!341499))

(assert (=> b!338156 m!341499))

(assert (=> b!338156 m!341501))

(assert (=> b!338052 d!70779))

(declare-fun b!338199 () Bool)

(declare-fun e!207523 () Bool)

(declare-fun call!26427 () Bool)

(assert (=> b!338199 (= e!207523 (not call!26427))))

(declare-fun d!70781 () Bool)

(declare-fun e!207516 () Bool)

(assert (=> d!70781 e!207516))

(declare-fun res!186820 () Bool)

(assert (=> d!70781 (=> (not res!186820) (not e!207516))))

(assert (=> d!70781 (= res!186820 (or (bvsge #b00000000000000000000000000000000 (size!8722 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8722 _keys!1895)))))))

(declare-fun lt!160751 () ListLongMap!4093)

(declare-fun lt!160740 () ListLongMap!4093)

(assert (=> d!70781 (= lt!160751 lt!160740)))

(declare-fun lt!160733 () Unit!10487)

(declare-fun e!207514 () Unit!10487)

(assert (=> d!70781 (= lt!160733 e!207514)))

(declare-fun c!52404 () Bool)

(declare-fun e!207521 () Bool)

(assert (=> d!70781 (= c!52404 e!207521)))

(declare-fun res!186817 () Bool)

(assert (=> d!70781 (=> (not res!186817) (not e!207521))))

(assert (=> d!70781 (= res!186817 (bvslt #b00000000000000000000000000000000 (size!8722 _keys!1895)))))

(declare-fun e!207525 () ListLongMap!4093)

(assert (=> d!70781 (= lt!160740 e!207525)))

(declare-fun c!52407 () Bool)

(assert (=> d!70781 (= c!52407 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70781 (validMask!0 mask!2385)))

(assert (=> d!70781 (= (getCurrentListMap!1583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160751)))

(declare-fun b!338200 () Bool)

(assert (=> b!338200 (= e!207516 e!207523)))

(declare-fun c!52402 () Bool)

(assert (=> b!338200 (= c!52402 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!26426 () ListLongMap!4093)

(declare-fun bm!26422 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!592 (array!17687 array!17689 (_ BitVec 32) (_ BitVec 32) V!10373 V!10373 (_ BitVec 32) Int) ListLongMap!4093)

(assert (=> bm!26422 (= call!26426 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!338201 () Bool)

(assert (=> b!338201 (= e!207521 (validKeyInArray!0 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26423 () Bool)

(declare-fun call!26428 () ListLongMap!4093)

(declare-fun call!26431 () ListLongMap!4093)

(assert (=> bm!26423 (= call!26428 call!26431)))

(declare-fun b!338202 () Bool)

(declare-fun e!207518 () ListLongMap!4093)

(assert (=> b!338202 (= e!207525 e!207518)))

(declare-fun c!52403 () Bool)

(assert (=> b!338202 (= c!52403 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!338203 () Bool)

(declare-fun e!207524 () Bool)

(declare-fun e!207522 () Bool)

(assert (=> b!338203 (= e!207524 e!207522)))

(declare-fun res!186814 () Bool)

(assert (=> b!338203 (=> (not res!186814) (not e!207522))))

(assert (=> b!338203 (= res!186814 (contains!2110 lt!160751 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!338203 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8722 _keys!1895)))))

(declare-fun b!338204 () Bool)

(assert (=> b!338204 (= e!207518 call!26428)))

(declare-fun b!338205 () Bool)

(declare-fun e!207520 () ListLongMap!4093)

(declare-fun call!26429 () ListLongMap!4093)

(assert (=> b!338205 (= e!207520 call!26429)))

(declare-fun b!338206 () Bool)

(declare-fun +!719 (ListLongMap!4093 tuple2!5180) ListLongMap!4093)

(assert (=> b!338206 (= e!207525 (+!719 call!26431 (tuple2!5181 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!338207 () Bool)

(assert (=> b!338207 (= e!207520 call!26428)))

(declare-fun b!338208 () Bool)

(declare-fun c!52405 () Bool)

(assert (=> b!338208 (= c!52405 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!338208 (= e!207518 e!207520)))

(declare-fun b!338209 () Bool)

(declare-fun apply!270 (ListLongMap!4093 (_ BitVec 64)) V!10373)

(declare-fun get!4564 (ValueCell!3180 V!10373) V!10373)

(declare-fun dynLambda!613 (Int (_ BitVec 64)) V!10373)

(assert (=> b!338209 (= e!207522 (= (apply!270 lt!160751 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000)) (get!4564 (select (arr!8371 _values!1525) #b00000000000000000000000000000000) (dynLambda!613 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!338209 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8723 _values!1525)))))

(assert (=> b!338209 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8722 _keys!1895)))))

(declare-fun b!338210 () Bool)

(declare-fun Unit!10496 () Unit!10487)

(assert (=> b!338210 (= e!207514 Unit!10496)))

(declare-fun b!338211 () Bool)

(declare-fun e!207513 () Bool)

(assert (=> b!338211 (= e!207513 (= (apply!270 lt!160751 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26424 () Bool)

(declare-fun call!26430 () ListLongMap!4093)

(assert (=> bm!26424 (= call!26429 call!26430)))

(declare-fun b!338212 () Bool)

(declare-fun e!207515 () Bool)

(declare-fun call!26425 () Bool)

(assert (=> b!338212 (= e!207515 (not call!26425))))

(declare-fun bm!26425 () Bool)

(assert (=> bm!26425 (= call!26430 call!26426)))

(declare-fun bm!26426 () Bool)

(assert (=> bm!26426 (= call!26427 (contains!2110 lt!160751 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!338213 () Bool)

(declare-fun res!186815 () Bool)

(assert (=> b!338213 (=> (not res!186815) (not e!207516))))

(assert (=> b!338213 (= res!186815 e!207524)))

(declare-fun res!186819 () Bool)

(assert (=> b!338213 (=> res!186819 e!207524)))

(declare-fun e!207519 () Bool)

(assert (=> b!338213 (= res!186819 (not e!207519))))

(declare-fun res!186818 () Bool)

(assert (=> b!338213 (=> (not res!186818) (not e!207519))))

(assert (=> b!338213 (= res!186818 (bvslt #b00000000000000000000000000000000 (size!8722 _keys!1895)))))

(declare-fun b!338214 () Bool)

(declare-fun res!186816 () Bool)

(assert (=> b!338214 (=> (not res!186816) (not e!207516))))

(assert (=> b!338214 (= res!186816 e!207515)))

(declare-fun c!52406 () Bool)

(assert (=> b!338214 (= c!52406 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!338215 () Bool)

(declare-fun lt!160743 () Unit!10487)

(assert (=> b!338215 (= e!207514 lt!160743)))

(declare-fun lt!160734 () ListLongMap!4093)

(assert (=> b!338215 (= lt!160734 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160742 () (_ BitVec 64))

(assert (=> b!338215 (= lt!160742 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160748 () (_ BitVec 64))

(assert (=> b!338215 (= lt!160748 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160752 () Unit!10487)

(declare-fun addStillContains!246 (ListLongMap!4093 (_ BitVec 64) V!10373 (_ BitVec 64)) Unit!10487)

(assert (=> b!338215 (= lt!160752 (addStillContains!246 lt!160734 lt!160742 zeroValue!1467 lt!160748))))

(assert (=> b!338215 (contains!2110 (+!719 lt!160734 (tuple2!5181 lt!160742 zeroValue!1467)) lt!160748)))

(declare-fun lt!160741 () Unit!10487)

(assert (=> b!338215 (= lt!160741 lt!160752)))

(declare-fun lt!160738 () ListLongMap!4093)

(assert (=> b!338215 (= lt!160738 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160735 () (_ BitVec 64))

(assert (=> b!338215 (= lt!160735 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160749 () (_ BitVec 64))

(assert (=> b!338215 (= lt!160749 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160732 () Unit!10487)

(declare-fun addApplyDifferent!246 (ListLongMap!4093 (_ BitVec 64) V!10373 (_ BitVec 64)) Unit!10487)

(assert (=> b!338215 (= lt!160732 (addApplyDifferent!246 lt!160738 lt!160735 minValue!1467 lt!160749))))

(assert (=> b!338215 (= (apply!270 (+!719 lt!160738 (tuple2!5181 lt!160735 minValue!1467)) lt!160749) (apply!270 lt!160738 lt!160749))))

(declare-fun lt!160737 () Unit!10487)

(assert (=> b!338215 (= lt!160737 lt!160732)))

(declare-fun lt!160745 () ListLongMap!4093)

(assert (=> b!338215 (= lt!160745 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160746 () (_ BitVec 64))

(assert (=> b!338215 (= lt!160746 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160736 () (_ BitVec 64))

(assert (=> b!338215 (= lt!160736 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160750 () Unit!10487)

(assert (=> b!338215 (= lt!160750 (addApplyDifferent!246 lt!160745 lt!160746 zeroValue!1467 lt!160736))))

(assert (=> b!338215 (= (apply!270 (+!719 lt!160745 (tuple2!5181 lt!160746 zeroValue!1467)) lt!160736) (apply!270 lt!160745 lt!160736))))

(declare-fun lt!160739 () Unit!10487)

(assert (=> b!338215 (= lt!160739 lt!160750)))

(declare-fun lt!160747 () ListLongMap!4093)

(assert (=> b!338215 (= lt!160747 (getCurrentListMapNoExtraKeys!592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160744 () (_ BitVec 64))

(assert (=> b!338215 (= lt!160744 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160753 () (_ BitVec 64))

(assert (=> b!338215 (= lt!160753 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!338215 (= lt!160743 (addApplyDifferent!246 lt!160747 lt!160744 minValue!1467 lt!160753))))

(assert (=> b!338215 (= (apply!270 (+!719 lt!160747 (tuple2!5181 lt!160744 minValue!1467)) lt!160753) (apply!270 lt!160747 lt!160753))))

(declare-fun b!338216 () Bool)

(declare-fun e!207517 () Bool)

(assert (=> b!338216 (= e!207523 e!207517)))

(declare-fun res!186821 () Bool)

(assert (=> b!338216 (= res!186821 call!26427)))

(assert (=> b!338216 (=> (not res!186821) (not e!207517))))

(declare-fun b!338217 () Bool)

(assert (=> b!338217 (= e!207519 (validKeyInArray!0 (select (arr!8370 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338218 () Bool)

(assert (=> b!338218 (= e!207515 e!207513)))

(declare-fun res!186813 () Bool)

(assert (=> b!338218 (= res!186813 call!26425)))

(assert (=> b!338218 (=> (not res!186813) (not e!207513))))

(declare-fun bm!26427 () Bool)

(assert (=> bm!26427 (= call!26425 (contains!2110 lt!160751 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!338219 () Bool)

(assert (=> b!338219 (= e!207517 (= (apply!270 lt!160751 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26428 () Bool)

(assert (=> bm!26428 (= call!26431 (+!719 (ite c!52407 call!26426 (ite c!52403 call!26430 call!26429)) (ite (or c!52407 c!52403) (tuple2!5181 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5181 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(assert (= (and d!70781 c!52407) b!338206))

(assert (= (and d!70781 (not c!52407)) b!338202))

(assert (= (and b!338202 c!52403) b!338204))

(assert (= (and b!338202 (not c!52403)) b!338208))

(assert (= (and b!338208 c!52405) b!338207))

(assert (= (and b!338208 (not c!52405)) b!338205))

(assert (= (or b!338207 b!338205) bm!26424))

(assert (= (or b!338204 bm!26424) bm!26425))

(assert (= (or b!338204 b!338207) bm!26423))

(assert (= (or b!338206 bm!26425) bm!26422))

(assert (= (or b!338206 bm!26423) bm!26428))

(assert (= (and d!70781 res!186817) b!338201))

(assert (= (and d!70781 c!52404) b!338215))

(assert (= (and d!70781 (not c!52404)) b!338210))

(assert (= (and d!70781 res!186820) b!338213))

(assert (= (and b!338213 res!186818) b!338217))

(assert (= (and b!338213 (not res!186819)) b!338203))

(assert (= (and b!338203 res!186814) b!338209))

(assert (= (and b!338213 res!186815) b!338214))

(assert (= (and b!338214 c!52406) b!338218))

(assert (= (and b!338214 (not c!52406)) b!338212))

(assert (= (and b!338218 res!186813) b!338211))

(assert (= (or b!338218 b!338212) bm!26427))

(assert (= (and b!338214 res!186816) b!338200))

(assert (= (and b!338200 c!52402) b!338216))

(assert (= (and b!338200 (not c!52402)) b!338199))

(assert (= (and b!338216 res!186821) b!338219))

(assert (= (or b!338216 b!338199) bm!26426))

(declare-fun b_lambda!8419 () Bool)

(assert (=> (not b_lambda!8419) (not b!338209)))

(declare-fun t!9897 () Bool)

(declare-fun tb!3055 () Bool)

(assert (=> (and start!33940 (= defaultEntry!1528 defaultEntry!1528) t!9897) tb!3055))

(declare-fun result!5495 () Bool)

(assert (=> tb!3055 (= result!5495 tp_is_empty!7047)))

(assert (=> b!338209 t!9897))

(declare-fun b_and!14287 () Bool)

(assert (= b_and!14283 (and (=> t!9897 result!5495) b_and!14287)))

(assert (=> b!338217 m!341463))

(assert (=> b!338217 m!341463))

(assert (=> b!338217 m!341467))

(declare-fun m!341503 () Bool)

(assert (=> bm!26427 m!341503))

(declare-fun m!341505 () Bool)

(assert (=> bm!26422 m!341505))

(declare-fun m!341507 () Bool)

(assert (=> b!338215 m!341507))

(declare-fun m!341509 () Bool)

(assert (=> b!338215 m!341509))

(declare-fun m!341511 () Bool)

(assert (=> b!338215 m!341511))

(declare-fun m!341513 () Bool)

(assert (=> b!338215 m!341513))

(declare-fun m!341515 () Bool)

(assert (=> b!338215 m!341515))

(declare-fun m!341517 () Bool)

(assert (=> b!338215 m!341517))

(assert (=> b!338215 m!341463))

(declare-fun m!341519 () Bool)

(assert (=> b!338215 m!341519))

(declare-fun m!341521 () Bool)

(assert (=> b!338215 m!341521))

(assert (=> b!338215 m!341507))

(declare-fun m!341523 () Bool)

(assert (=> b!338215 m!341523))

(assert (=> b!338215 m!341505))

(assert (=> b!338215 m!341509))

(declare-fun m!341525 () Bool)

(assert (=> b!338215 m!341525))

(declare-fun m!341527 () Bool)

(assert (=> b!338215 m!341527))

(declare-fun m!341529 () Bool)

(assert (=> b!338215 m!341529))

(assert (=> b!338215 m!341529))

(declare-fun m!341531 () Bool)

(assert (=> b!338215 m!341531))

(assert (=> b!338215 m!341511))

(declare-fun m!341533 () Bool)

(assert (=> b!338215 m!341533))

(declare-fun m!341535 () Bool)

(assert (=> b!338215 m!341535))

(declare-fun m!341537 () Bool)

(assert (=> bm!26426 m!341537))

(declare-fun m!341539 () Bool)

(assert (=> b!338219 m!341539))

(declare-fun m!341541 () Bool)

(assert (=> b!338211 m!341541))

(assert (=> d!70781 m!341417))

(assert (=> b!338209 m!341463))

(declare-fun m!341543 () Bool)

(assert (=> b!338209 m!341543))

(assert (=> b!338209 m!341463))

(declare-fun m!341545 () Bool)

(assert (=> b!338209 m!341545))

(declare-fun m!341547 () Bool)

(assert (=> b!338209 m!341547))

(declare-fun m!341549 () Bool)

(assert (=> b!338209 m!341549))

(assert (=> b!338209 m!341545))

(assert (=> b!338209 m!341547))

(declare-fun m!341551 () Bool)

(assert (=> bm!26428 m!341551))

(assert (=> b!338203 m!341463))

(assert (=> b!338203 m!341463))

(declare-fun m!341553 () Bool)

(assert (=> b!338203 m!341553))

(declare-fun m!341555 () Bool)

(assert (=> b!338206 m!341555))

(assert (=> b!338201 m!341463))

(assert (=> b!338201 m!341463))

(assert (=> b!338201 m!341467))

(assert (=> b!338052 d!70781))

(declare-fun d!70783 () Bool)

(assert (=> d!70783 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33940 d!70783))

(declare-fun d!70785 () Bool)

(assert (=> d!70785 (= (array_inv!6212 _values!1525) (bvsge (size!8723 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33940 d!70785))

(declare-fun d!70787 () Bool)

(assert (=> d!70787 (= (array_inv!6213 _keys!1895) (bvsge (size!8722 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33940 d!70787))

(declare-fun d!70789 () Bool)

(declare-fun res!186826 () Bool)

(declare-fun e!207530 () Bool)

(assert (=> d!70789 (=> res!186826 e!207530)))

(assert (=> d!70789 (= res!186826 (= (select (arr!8370 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70789 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!207530)))

(declare-fun b!338226 () Bool)

(declare-fun e!207531 () Bool)

(assert (=> b!338226 (= e!207530 e!207531)))

(declare-fun res!186827 () Bool)

(assert (=> b!338226 (=> (not res!186827) (not e!207531))))

(assert (=> b!338226 (= res!186827 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8722 _keys!1895)))))

(declare-fun b!338227 () Bool)

(assert (=> b!338227 (= e!207531 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70789 (not res!186826)) b!338226))

(assert (= (and b!338226 res!186827) b!338227))

(assert (=> d!70789 m!341463))

(declare-fun m!341557 () Bool)

(assert (=> b!338227 m!341557))

(assert (=> b!338057 d!70789))

(declare-fun b!338234 () Bool)

(declare-fun e!207536 () Bool)

(assert (=> b!338234 (= e!207536 tp_is_empty!7047)))

(declare-fun mapIsEmpty!11985 () Bool)

(declare-fun mapRes!11985 () Bool)

(assert (=> mapIsEmpty!11985 mapRes!11985))

(declare-fun condMapEmpty!11985 () Bool)

(declare-fun mapDefault!11985 () ValueCell!3180)

(assert (=> mapNonEmpty!11979 (= condMapEmpty!11985 (= mapRest!11979 ((as const (Array (_ BitVec 32) ValueCell!3180)) mapDefault!11985)))))

(declare-fun e!207537 () Bool)

(assert (=> mapNonEmpty!11979 (= tp!24800 (and e!207537 mapRes!11985))))

(declare-fun mapNonEmpty!11985 () Bool)

(declare-fun tp!24810 () Bool)

(assert (=> mapNonEmpty!11985 (= mapRes!11985 (and tp!24810 e!207536))))

(declare-fun mapKey!11985 () (_ BitVec 32))

(declare-fun mapRest!11985 () (Array (_ BitVec 32) ValueCell!3180))

(declare-fun mapValue!11985 () ValueCell!3180)

(assert (=> mapNonEmpty!11985 (= mapRest!11979 (store mapRest!11985 mapKey!11985 mapValue!11985))))

(declare-fun b!338235 () Bool)

(assert (=> b!338235 (= e!207537 tp_is_empty!7047)))

(assert (= (and mapNonEmpty!11979 condMapEmpty!11985) mapIsEmpty!11985))

(assert (= (and mapNonEmpty!11979 (not condMapEmpty!11985)) mapNonEmpty!11985))

(assert (= (and mapNonEmpty!11985 ((_ is ValueCellFull!3180) mapValue!11985)) b!338234))

(assert (= (and mapNonEmpty!11979 ((_ is ValueCellFull!3180) mapDefault!11985)) b!338235))

(declare-fun m!341559 () Bool)

(assert (=> mapNonEmpty!11985 m!341559))

(declare-fun b_lambda!8421 () Bool)

(assert (= b_lambda!8419 (or (and start!33940 b_free!7095) b_lambda!8421)))

(check-sat (not b_next!7095) (not b!338201) (not b!338154) (not b!338128) tp_is_empty!7047 (not bm!26426) (not b!338115) (not bm!26427) (not bm!26422) (not b!338217) (not d!70779) (not b!338203) (not b!338206) (not b!338211) (not b!338127) (not b!338209) (not b_lambda!8421) (not d!70781) (not b!338144) (not b!338117) (not d!70769) (not b!338156) (not b!338215) (not b!338114) (not b!338227) (not bm!26404) (not mapNonEmpty!11985) b_and!14287 (not b!338219) (not bm!26428) (not d!70777) (not b!338102) (not bm!26407))
(check-sat b_and!14287 (not b_next!7095))
