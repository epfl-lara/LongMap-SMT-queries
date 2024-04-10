; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22080 () Bool)

(assert start!22080)

(declare-fun b!228991 () Bool)

(declare-fun b_free!6147 () Bool)

(declare-fun b_next!6147 () Bool)

(assert (=> b!228991 (= b_free!6147 (not b_next!6147))))

(declare-fun tp!21583 () Bool)

(declare-fun b_and!13045 () Bool)

(assert (=> b!228991 (= tp!21583 b_and!13045)))

(declare-fun b!228987 () Bool)

(declare-datatypes ((Unit!6973 0))(
  ( (Unit!6974) )
))
(declare-fun e!148563 () Unit!6973)

(declare-fun Unit!6975 () Unit!6973)

(assert (=> b!228987 (= e!148563 Unit!6975)))

(declare-fun lt!115198 () Unit!6973)

(declare-datatypes ((V!7659 0))(
  ( (V!7660 (val!3049 Int)) )
))
(declare-datatypes ((ValueCell!2661 0))(
  ( (ValueCellFull!2661 (v!5069 V!7659)) (EmptyCell!2661) )
))
(declare-datatypes ((array!11261 0))(
  ( (array!11262 (arr!5350 (Array (_ BitVec 32) ValueCell!2661)) (size!5683 (_ BitVec 32))) )
))
(declare-datatypes ((array!11263 0))(
  ( (array!11264 (arr!5351 (Array (_ BitVec 32) (_ BitVec 64))) (size!5684 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3222 0))(
  ( (LongMapFixedSize!3223 (defaultEntry!4270 Int) (mask!10146 (_ BitVec 32)) (extraKeys!4007 (_ BitVec 32)) (zeroValue!4111 V!7659) (minValue!4111 V!7659) (_size!1660 (_ BitVec 32)) (_keys!6324 array!11263) (_values!4253 array!11261) (_vacant!1660 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3222)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!277 (array!11263 array!11261 (_ BitVec 32) (_ BitVec 32) V!7659 V!7659 (_ BitVec 64) Int) Unit!6973)

(assert (=> b!228987 (= lt!115198 (lemmaInListMapThenSeekEntryOrOpenFindsIt!277 (_keys!6324 thiss!1504) (_values!4253 thiss!1504) (mask!10146 thiss!1504) (extraKeys!4007 thiss!1504) (zeroValue!4111 thiss!1504) (minValue!4111 thiss!1504) key!932 (defaultEntry!4270 thiss!1504)))))

(assert (=> b!228987 false))

(declare-datatypes ((SeekEntryResult!915 0))(
  ( (MissingZero!915 (index!5830 (_ BitVec 32))) (Found!915 (index!5831 (_ BitVec 32))) (Intermediate!915 (undefined!1727 Bool) (index!5832 (_ BitVec 32)) (x!23359 (_ BitVec 32))) (Undefined!915) (MissingVacant!915 (index!5833 (_ BitVec 32))) )
))
(declare-fun lt!115194 () SeekEntryResult!915)

(declare-fun c!37977 () Bool)

(declare-fun bm!21272 () Bool)

(declare-fun call!21275 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21272 (= call!21275 (inRange!0 (ite c!37977 (index!5830 lt!115194) (index!5833 lt!115194)) (mask!10146 thiss!1504)))))

(declare-fun bm!21273 () Bool)

(declare-fun call!21276 () Bool)

(declare-fun arrayContainsKey!0 (array!11263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21273 (= call!21276 (arrayContainsKey!0 (_keys!6324 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228988 () Bool)

(declare-fun e!148560 () Bool)

(assert (=> b!228988 (= e!148560 (not call!21276))))

(declare-fun b!228989 () Bool)

(declare-fun e!148567 () Bool)

(declare-fun tp_is_empty!6009 () Bool)

(assert (=> b!228989 (= e!148567 tp_is_empty!6009)))

(declare-fun b!228990 () Bool)

(declare-fun e!148561 () Bool)

(declare-fun e!148564 () Bool)

(assert (=> b!228990 (= e!148561 e!148564)))

(declare-fun res!112709 () Bool)

(assert (=> b!228990 (=> (not res!112709) (not e!148564))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!228990 (= res!112709 (or (= lt!115194 (MissingZero!915 index!297)) (= lt!115194 (MissingVacant!915 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11263 (_ BitVec 32)) SeekEntryResult!915)

(assert (=> b!228990 (= lt!115194 (seekEntryOrOpen!0 key!932 (_keys!6324 thiss!1504) (mask!10146 thiss!1504)))))

(declare-fun e!148568 () Bool)

(declare-fun e!148562 () Bool)

(declare-fun array_inv!3533 (array!11263) Bool)

(declare-fun array_inv!3534 (array!11261) Bool)

(assert (=> b!228991 (= e!148562 (and tp!21583 tp_is_empty!6009 (array_inv!3533 (_keys!6324 thiss!1504)) (array_inv!3534 (_values!4253 thiss!1504)) e!148568))))

(declare-fun b!228992 () Bool)

(declare-fun e!148569 () Unit!6973)

(declare-fun Unit!6976 () Unit!6973)

(assert (=> b!228992 (= e!148569 Unit!6976)))

(declare-fun b!228993 () Bool)

(declare-fun res!112703 () Bool)

(assert (=> b!228993 (=> (not res!112703) (not e!148561))))

(assert (=> b!228993 (= res!112703 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!228994 () Bool)

(declare-fun mapRes!10183 () Bool)

(assert (=> b!228994 (= e!148568 (and e!148567 mapRes!10183))))

(declare-fun condMapEmpty!10183 () Bool)

(declare-fun mapDefault!10183 () ValueCell!2661)

(assert (=> b!228994 (= condMapEmpty!10183 (= (arr!5350 (_values!4253 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2661)) mapDefault!10183)))))

(declare-fun b!228995 () Bool)

(declare-fun res!112704 () Bool)

(assert (=> b!228995 (= res!112704 (= (select (arr!5351 (_keys!6324 thiss!1504)) (index!5833 lt!115194)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148574 () Bool)

(assert (=> b!228995 (=> (not res!112704) (not e!148574))))

(declare-fun b!228996 () Bool)

(declare-fun res!112710 () Bool)

(declare-fun e!148571 () Bool)

(assert (=> b!228996 (=> res!112710 e!148571)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11263 (_ BitVec 32)) Bool)

(assert (=> b!228996 (= res!112710 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6324 thiss!1504) (mask!10146 thiss!1504))))))

(declare-fun b!228997 () Bool)

(declare-fun e!148565 () Bool)

(assert (=> b!228997 (= e!148564 e!148565)))

(declare-fun res!112706 () Bool)

(assert (=> b!228997 (=> (not res!112706) (not e!148565))))

(assert (=> b!228997 (= res!112706 (inRange!0 index!297 (mask!10146 thiss!1504)))))

(declare-fun lt!115197 () Unit!6973)

(assert (=> b!228997 (= lt!115197 e!148563)))

(declare-fun c!37979 () Bool)

(declare-datatypes ((tuple2!4498 0))(
  ( (tuple2!4499 (_1!2260 (_ BitVec 64)) (_2!2260 V!7659)) )
))
(declare-datatypes ((List!3421 0))(
  ( (Nil!3418) (Cons!3417 (h!4065 tuple2!4498) (t!8380 List!3421)) )
))
(declare-datatypes ((ListLongMap!3411 0))(
  ( (ListLongMap!3412 (toList!1721 List!3421)) )
))
(declare-fun contains!1595 (ListLongMap!3411 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1249 (array!11263 array!11261 (_ BitVec 32) (_ BitVec 32) V!7659 V!7659 (_ BitVec 32) Int) ListLongMap!3411)

(assert (=> b!228997 (= c!37979 (contains!1595 (getCurrentListMap!1249 (_keys!6324 thiss!1504) (_values!4253 thiss!1504) (mask!10146 thiss!1504) (extraKeys!4007 thiss!1504) (zeroValue!4111 thiss!1504) (minValue!4111 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4270 thiss!1504)) key!932))))

(declare-fun b!228998 () Bool)

(declare-fun e!148573 () Bool)

(assert (=> b!228998 (= e!148573 e!148574)))

(declare-fun res!112701 () Bool)

(assert (=> b!228998 (= res!112701 call!21275)))

(assert (=> b!228998 (=> (not res!112701) (not e!148574))))

(declare-fun b!228999 () Bool)

(assert (=> b!228999 (= e!148565 (not e!148571))))

(declare-fun res!112702 () Bool)

(assert (=> b!228999 (=> res!112702 e!148571)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228999 (= res!112702 (not (validMask!0 (mask!10146 thiss!1504))))))

(declare-fun lt!115195 () array!11263)

(assert (=> b!228999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115195 (mask!10146 thiss!1504))))

(declare-fun lt!115191 () Unit!6973)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11263 (_ BitVec 32) (_ BitVec 32)) Unit!6973)

(assert (=> b!228999 (= lt!115191 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6324 thiss!1504) index!297 (mask!10146 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11263 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228999 (= (arrayCountValidKeys!0 lt!115195 #b00000000000000000000000000000000 (size!5684 (_keys!6324 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6324 thiss!1504) #b00000000000000000000000000000000 (size!5684 (_keys!6324 thiss!1504)))))))

(declare-fun lt!115196 () Unit!6973)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11263 (_ BitVec 32) (_ BitVec 64)) Unit!6973)

(assert (=> b!228999 (= lt!115196 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6324 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3422 0))(
  ( (Nil!3419) (Cons!3418 (h!4066 (_ BitVec 64)) (t!8381 List!3422)) )
))
(declare-fun arrayNoDuplicates!0 (array!11263 (_ BitVec 32) List!3422) Bool)

(assert (=> b!228999 (arrayNoDuplicates!0 lt!115195 #b00000000000000000000000000000000 Nil!3419)))

(assert (=> b!228999 (= lt!115195 (array!11264 (store (arr!5351 (_keys!6324 thiss!1504)) index!297 key!932) (size!5684 (_keys!6324 thiss!1504))))))

(declare-fun lt!115193 () Unit!6973)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11263 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3422) Unit!6973)

(assert (=> b!228999 (= lt!115193 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6324 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3419))))

(declare-fun lt!115192 () Unit!6973)

(assert (=> b!228999 (= lt!115192 e!148569)))

(declare-fun c!37980 () Bool)

(assert (=> b!228999 (= c!37980 (arrayContainsKey!0 (_keys!6324 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229000 () Bool)

(declare-fun res!112705 () Bool)

(assert (=> b!229000 (=> (not res!112705) (not e!148560))))

(assert (=> b!229000 (= res!112705 call!21275)))

(declare-fun e!148566 () Bool)

(assert (=> b!229000 (= e!148566 e!148560)))

(declare-fun b!229001 () Bool)

(assert (=> b!229001 (= e!148571 true)))

(declare-fun lt!115190 () Bool)

(assert (=> b!229001 (= lt!115190 (arrayNoDuplicates!0 (_keys!6324 thiss!1504) #b00000000000000000000000000000000 Nil!3419))))

(declare-fun b!229002 () Bool)

(declare-fun lt!115189 () Unit!6973)

(assert (=> b!229002 (= e!148563 lt!115189)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!293 (array!11263 array!11261 (_ BitVec 32) (_ BitVec 32) V!7659 V!7659 (_ BitVec 64) Int) Unit!6973)

(assert (=> b!229002 (= lt!115189 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!293 (_keys!6324 thiss!1504) (_values!4253 thiss!1504) (mask!10146 thiss!1504) (extraKeys!4007 thiss!1504) (zeroValue!4111 thiss!1504) (minValue!4111 thiss!1504) key!932 (defaultEntry!4270 thiss!1504)))))

(get-info :version)

(assert (=> b!229002 (= c!37977 ((_ is MissingZero!915) lt!115194))))

(assert (=> b!229002 e!148566))

(declare-fun mapNonEmpty!10183 () Bool)

(declare-fun tp!21582 () Bool)

(declare-fun e!148572 () Bool)

(assert (=> mapNonEmpty!10183 (= mapRes!10183 (and tp!21582 e!148572))))

(declare-fun mapValue!10183 () ValueCell!2661)

(declare-fun mapRest!10183 () (Array (_ BitVec 32) ValueCell!2661))

(declare-fun mapKey!10183 () (_ BitVec 32))

(assert (=> mapNonEmpty!10183 (= (arr!5350 (_values!4253 thiss!1504)) (store mapRest!10183 mapKey!10183 mapValue!10183))))

(declare-fun b!229003 () Bool)

(declare-fun res!112707 () Bool)

(assert (=> b!229003 (=> (not res!112707) (not e!148560))))

(assert (=> b!229003 (= res!112707 (= (select (arr!5351 (_keys!6324 thiss!1504)) (index!5830 lt!115194)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!229004 () Bool)

(assert (=> b!229004 (= e!148573 ((_ is Undefined!915) lt!115194))))

(declare-fun mapIsEmpty!10183 () Bool)

(assert (=> mapIsEmpty!10183 mapRes!10183))

(declare-fun b!229005 () Bool)

(assert (=> b!229005 (= e!148572 tp_is_empty!6009)))

(declare-fun b!229006 () Bool)

(declare-fun c!37978 () Bool)

(assert (=> b!229006 (= c!37978 ((_ is MissingVacant!915) lt!115194))))

(assert (=> b!229006 (= e!148566 e!148573)))

(declare-fun b!229007 () Bool)

(declare-fun res!112711 () Bool)

(assert (=> b!229007 (=> res!112711 e!148571)))

(assert (=> b!229007 (= res!112711 (or (not (= (size!5683 (_values!4253 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10146 thiss!1504)))) (not (= (size!5684 (_keys!6324 thiss!1504)) (size!5683 (_values!4253 thiss!1504)))) (bvslt (mask!10146 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4007 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4007 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!112708 () Bool)

(assert (=> start!22080 (=> (not res!112708) (not e!148561))))

(declare-fun valid!1285 (LongMapFixedSize!3222) Bool)

(assert (=> start!22080 (= res!112708 (valid!1285 thiss!1504))))

(assert (=> start!22080 e!148561))

(assert (=> start!22080 e!148562))

(assert (=> start!22080 true))

(declare-fun b!229008 () Bool)

(assert (=> b!229008 (= e!148574 (not call!21276))))

(declare-fun b!229009 () Bool)

(declare-fun Unit!6977 () Unit!6973)

(assert (=> b!229009 (= e!148569 Unit!6977)))

(declare-fun lt!115199 () Unit!6973)

(declare-fun lemmaArrayContainsKeyThenInListMap!112 (array!11263 array!11261 (_ BitVec 32) (_ BitVec 32) V!7659 V!7659 (_ BitVec 64) (_ BitVec 32) Int) Unit!6973)

(assert (=> b!229009 (= lt!115199 (lemmaArrayContainsKeyThenInListMap!112 (_keys!6324 thiss!1504) (_values!4253 thiss!1504) (mask!10146 thiss!1504) (extraKeys!4007 thiss!1504) (zeroValue!4111 thiss!1504) (minValue!4111 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4270 thiss!1504)))))

(assert (=> b!229009 false))

(assert (= (and start!22080 res!112708) b!228993))

(assert (= (and b!228993 res!112703) b!228990))

(assert (= (and b!228990 res!112709) b!228997))

(assert (= (and b!228997 c!37979) b!228987))

(assert (= (and b!228997 (not c!37979)) b!229002))

(assert (= (and b!229002 c!37977) b!229000))

(assert (= (and b!229002 (not c!37977)) b!229006))

(assert (= (and b!229000 res!112705) b!229003))

(assert (= (and b!229003 res!112707) b!228988))

(assert (= (and b!229006 c!37978) b!228998))

(assert (= (and b!229006 (not c!37978)) b!229004))

(assert (= (and b!228998 res!112701) b!228995))

(assert (= (and b!228995 res!112704) b!229008))

(assert (= (or b!229000 b!228998) bm!21272))

(assert (= (or b!228988 b!229008) bm!21273))

(assert (= (and b!228997 res!112706) b!228999))

(assert (= (and b!228999 c!37980) b!229009))

(assert (= (and b!228999 (not c!37980)) b!228992))

(assert (= (and b!228999 (not res!112702)) b!229007))

(assert (= (and b!229007 (not res!112711)) b!228996))

(assert (= (and b!228996 (not res!112710)) b!229001))

(assert (= (and b!228994 condMapEmpty!10183) mapIsEmpty!10183))

(assert (= (and b!228994 (not condMapEmpty!10183)) mapNonEmpty!10183))

(assert (= (and mapNonEmpty!10183 ((_ is ValueCellFull!2661) mapValue!10183)) b!229005))

(assert (= (and b!228994 ((_ is ValueCellFull!2661) mapDefault!10183)) b!228989))

(assert (= b!228991 b!228994))

(assert (= start!22080 b!228991))

(declare-fun m!250611 () Bool)

(assert (=> b!229002 m!250611))

(declare-fun m!250613 () Bool)

(assert (=> mapNonEmpty!10183 m!250613))

(declare-fun m!250615 () Bool)

(assert (=> b!228995 m!250615))

(declare-fun m!250617 () Bool)

(assert (=> bm!21272 m!250617))

(declare-fun m!250619 () Bool)

(assert (=> b!228999 m!250619))

(declare-fun m!250621 () Bool)

(assert (=> b!228999 m!250621))

(declare-fun m!250623 () Bool)

(assert (=> b!228999 m!250623))

(declare-fun m!250625 () Bool)

(assert (=> b!228999 m!250625))

(declare-fun m!250627 () Bool)

(assert (=> b!228999 m!250627))

(declare-fun m!250629 () Bool)

(assert (=> b!228999 m!250629))

(declare-fun m!250631 () Bool)

(assert (=> b!228999 m!250631))

(declare-fun m!250633 () Bool)

(assert (=> b!228999 m!250633))

(declare-fun m!250635 () Bool)

(assert (=> b!228999 m!250635))

(declare-fun m!250637 () Bool)

(assert (=> b!228999 m!250637))

(declare-fun m!250639 () Bool)

(assert (=> b!229009 m!250639))

(declare-fun m!250641 () Bool)

(assert (=> b!229001 m!250641))

(declare-fun m!250643 () Bool)

(assert (=> b!228996 m!250643))

(assert (=> bm!21273 m!250621))

(declare-fun m!250645 () Bool)

(assert (=> b!228987 m!250645))

(declare-fun m!250647 () Bool)

(assert (=> start!22080 m!250647))

(declare-fun m!250649 () Bool)

(assert (=> b!228997 m!250649))

(declare-fun m!250651 () Bool)

(assert (=> b!228997 m!250651))

(assert (=> b!228997 m!250651))

(declare-fun m!250653 () Bool)

(assert (=> b!228997 m!250653))

(declare-fun m!250655 () Bool)

(assert (=> b!228990 m!250655))

(declare-fun m!250657 () Bool)

(assert (=> b!228991 m!250657))

(declare-fun m!250659 () Bool)

(assert (=> b!228991 m!250659))

(declare-fun m!250661 () Bool)

(assert (=> b!229003 m!250661))

(check-sat (not b!228997) (not b!228987) b_and!13045 (not b!228991) (not bm!21273) (not mapNonEmpty!10183) tp_is_empty!6009 (not b!228999) (not b_next!6147) (not b!228990) (not start!22080) (not b!229009) (not bm!21272) (not b!228996) (not b!229001) (not b!229002))
(check-sat b_and!13045 (not b_next!6147))
