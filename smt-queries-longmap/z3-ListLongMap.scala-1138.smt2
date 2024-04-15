; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23528 () Bool)

(assert start!23528)

(declare-fun b!246882 () Bool)

(declare-fun b_free!6577 () Bool)

(declare-fun b_next!6577 () Bool)

(assert (=> b!246882 (= b_free!6577 (not b_next!6577))))

(declare-fun tp!22975 () Bool)

(declare-fun b_and!13551 () Bool)

(assert (=> b!246882 (= tp!22975 b_and!13551)))

(declare-fun b!246881 () Bool)

(declare-fun e!160160 () Bool)

(declare-fun e!160151 () Bool)

(assert (=> b!246881 (= e!160160 (not e!160151))))

(declare-fun res!121006 () Bool)

(assert (=> b!246881 (=> res!121006 e!160151)))

(declare-datatypes ((V!8233 0))(
  ( (V!8234 (val!3264 Int)) )
))
(declare-datatypes ((ValueCell!2876 0))(
  ( (ValueCellFull!2876 (v!5315 V!8233)) (EmptyCell!2876) )
))
(declare-datatypes ((array!12175 0))(
  ( (array!12176 (arr!5775 (Array (_ BitVec 32) ValueCell!2876)) (size!6119 (_ BitVec 32))) )
))
(declare-datatypes ((array!12177 0))(
  ( (array!12178 (arr!5776 (Array (_ BitVec 32) (_ BitVec 64))) (size!6120 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3652 0))(
  ( (LongMapFixedSize!3653 (defaultEntry!4571 Int) (mask!10703 (_ BitVec 32)) (extraKeys!4308 (_ BitVec 32)) (zeroValue!4412 V!8233) (minValue!4412 V!8233) (_size!1875 (_ BitVec 32)) (_keys!6691 array!12177) (_values!4554 array!12175) (_vacant!1875 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3652)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!246881 (= res!121006 (not (validMask!0 (mask!10703 thiss!1504))))))

(declare-fun lt!123547 () array!12177)

(declare-fun arrayCountValidKeys!0 (array!12177 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!246881 (= (arrayCountValidKeys!0 lt!123547 #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6691 thiss!1504) #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((Unit!7620 0))(
  ( (Unit!7621) )
))
(declare-fun lt!123548 () Unit!7620)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12177 (_ BitVec 32) (_ BitVec 64)) Unit!7620)

(assert (=> b!246881 (= lt!123548 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6691 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3674 0))(
  ( (Nil!3671) (Cons!3670 (h!4328 (_ BitVec 64)) (t!8686 List!3674)) )
))
(declare-fun arrayNoDuplicates!0 (array!12177 (_ BitVec 32) List!3674) Bool)

(assert (=> b!246881 (arrayNoDuplicates!0 lt!123547 #b00000000000000000000000000000000 Nil!3671)))

(assert (=> b!246881 (= lt!123547 (array!12178 (store (arr!5776 (_keys!6691 thiss!1504)) index!297 key!932) (size!6120 (_keys!6691 thiss!1504))))))

(declare-fun lt!123552 () Unit!7620)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12177 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3674) Unit!7620)

(assert (=> b!246881 (= lt!123552 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6691 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3671))))

(declare-fun lt!123549 () Unit!7620)

(declare-fun e!160153 () Unit!7620)

(assert (=> b!246881 (= lt!123549 e!160153)))

(declare-fun c!41317 () Bool)

(declare-fun arrayContainsKey!0 (array!12177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!246881 (= c!41317 (arrayContainsKey!0 (_keys!6691 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun e!160159 () Bool)

(declare-fun tp_is_empty!6439 () Bool)

(declare-fun e!160156 () Bool)

(declare-fun array_inv!3809 (array!12177) Bool)

(declare-fun array_inv!3810 (array!12175) Bool)

(assert (=> b!246882 (= e!160159 (and tp!22975 tp_is_empty!6439 (array_inv!3809 (_keys!6691 thiss!1504)) (array_inv!3810 (_values!4554 thiss!1504)) e!160156))))

(declare-fun b!246883 () Bool)

(declare-fun e!160152 () Bool)

(declare-fun e!160150 () Bool)

(assert (=> b!246883 (= e!160152 e!160150)))

(declare-fun res!121008 () Bool)

(assert (=> b!246883 (=> (not res!121008) (not e!160150))))

(declare-datatypes ((SeekEntryResult!1096 0))(
  ( (MissingZero!1096 (index!6554 (_ BitVec 32))) (Found!1096 (index!6555 (_ BitVec 32))) (Intermediate!1096 (undefined!1908 Bool) (index!6556 (_ BitVec 32)) (x!24505 (_ BitVec 32))) (Undefined!1096) (MissingVacant!1096 (index!6557 (_ BitVec 32))) )
))
(declare-fun lt!123545 () SeekEntryResult!1096)

(assert (=> b!246883 (= res!121008 (or (= lt!123545 (MissingZero!1096 index!297)) (= lt!123545 (MissingVacant!1096 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12177 (_ BitVec 32)) SeekEntryResult!1096)

(assert (=> b!246883 (= lt!123545 (seekEntryOrOpen!0 key!932 (_keys!6691 thiss!1504) (mask!10703 thiss!1504)))))

(declare-fun b!246884 () Bool)

(declare-fun e!160163 () Unit!7620)

(declare-fun Unit!7622 () Unit!7620)

(assert (=> b!246884 (= e!160163 Unit!7622)))

(declare-fun lt!123551 () Unit!7620)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!383 (array!12177 array!12175 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) Int) Unit!7620)

(assert (=> b!246884 (= lt!123551 (lemmaInListMapThenSeekEntryOrOpenFindsIt!383 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)))))

(assert (=> b!246884 false))

(declare-fun b!246885 () Bool)

(declare-fun e!160157 () Bool)

(declare-fun call!23094 () Bool)

(assert (=> b!246885 (= e!160157 (not call!23094))))

(declare-fun b!246886 () Bool)

(assert (=> b!246886 (= e!160150 e!160160)))

(declare-fun res!121005 () Bool)

(assert (=> b!246886 (=> (not res!121005) (not e!160160))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246886 (= res!121005 (inRange!0 index!297 (mask!10703 thiss!1504)))))

(declare-fun lt!123553 () Unit!7620)

(assert (=> b!246886 (= lt!123553 e!160163)))

(declare-fun c!41315 () Bool)

(declare-datatypes ((tuple2!4772 0))(
  ( (tuple2!4773 (_1!2397 (_ BitVec 64)) (_2!2397 V!8233)) )
))
(declare-datatypes ((List!3675 0))(
  ( (Nil!3672) (Cons!3671 (h!4329 tuple2!4772) (t!8687 List!3675)) )
))
(declare-datatypes ((ListLongMap!3675 0))(
  ( (ListLongMap!3676 (toList!1853 List!3675)) )
))
(declare-fun contains!1771 (ListLongMap!3675 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1362 (array!12177 array!12175 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 32) Int) ListLongMap!3675)

(assert (=> b!246886 (= c!41315 (contains!1771 (getCurrentListMap!1362 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)) key!932))))

(declare-fun bm!23091 () Bool)

(assert (=> bm!23091 (= call!23094 (arrayContainsKey!0 (_keys!6691 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246887 () Bool)

(declare-fun res!121004 () Bool)

(assert (=> b!246887 (=> (not res!121004) (not e!160157))))

(declare-fun call!23095 () Bool)

(assert (=> b!246887 (= res!121004 call!23095)))

(declare-fun e!160149 () Bool)

(assert (=> b!246887 (= e!160149 e!160157)))

(declare-fun b!246888 () Bool)

(declare-fun res!121010 () Bool)

(assert (=> b!246888 (= res!121010 (= (select (arr!5776 (_keys!6691 thiss!1504)) (index!6557 lt!123545)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160154 () Bool)

(assert (=> b!246888 (=> (not res!121010) (not e!160154))))

(declare-fun res!121007 () Bool)

(assert (=> start!23528 (=> (not res!121007) (not e!160152))))

(declare-fun valid!1437 (LongMapFixedSize!3652) Bool)

(assert (=> start!23528 (= res!121007 (valid!1437 thiss!1504))))

(assert (=> start!23528 e!160152))

(assert (=> start!23528 e!160159))

(assert (=> start!23528 true))

(declare-fun b!246889 () Bool)

(declare-fun e!160158 () Bool)

(get-info :version)

(assert (=> b!246889 (= e!160158 ((_ is Undefined!1096) lt!123545))))

(declare-fun b!246890 () Bool)

(declare-fun e!160162 () Bool)

(assert (=> b!246890 (= e!160162 tp_is_empty!6439)))

(declare-fun b!246891 () Bool)

(declare-fun res!121003 () Bool)

(assert (=> b!246891 (=> (not res!121003) (not e!160157))))

(assert (=> b!246891 (= res!121003 (= (select (arr!5776 (_keys!6691 thiss!1504)) (index!6554 lt!123545)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246892 () Bool)

(declare-fun c!41316 () Bool)

(assert (=> b!246892 (= c!41316 ((_ is MissingVacant!1096) lt!123545))))

(assert (=> b!246892 (= e!160149 e!160158)))

(declare-fun b!246893 () Bool)

(declare-fun res!121009 () Bool)

(assert (=> b!246893 (=> (not res!121009) (not e!160152))))

(assert (=> b!246893 (= res!121009 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!246894 () Bool)

(declare-fun Unit!7623 () Unit!7620)

(assert (=> b!246894 (= e!160153 Unit!7623)))

(declare-fun lt!123546 () Unit!7620)

(declare-fun lemmaArrayContainsKeyThenInListMap!193 (array!12177 array!12175 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) (_ BitVec 32) Int) Unit!7620)

(assert (=> b!246894 (= lt!123546 (lemmaArrayContainsKeyThenInListMap!193 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(assert (=> b!246894 false))

(declare-fun b!246895 () Bool)

(declare-fun e!160161 () Bool)

(declare-fun mapRes!10931 () Bool)

(assert (=> b!246895 (= e!160156 (and e!160161 mapRes!10931))))

(declare-fun condMapEmpty!10931 () Bool)

(declare-fun mapDefault!10931 () ValueCell!2876)

(assert (=> b!246895 (= condMapEmpty!10931 (= (arr!5775 (_values!4554 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2876)) mapDefault!10931)))))

(declare-fun b!246896 () Bool)

(declare-fun res!121001 () Bool)

(assert (=> b!246896 (=> res!121001 e!160151)))

(assert (=> b!246896 (= res!121001 (or (not (= (size!6120 (_keys!6691 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10703 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6120 (_keys!6691 thiss!1504)))))))

(declare-fun b!246897 () Bool)

(declare-fun lt!123550 () Unit!7620)

(assert (=> b!246897 (= e!160163 lt!123550)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!381 (array!12177 array!12175 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) Int) Unit!7620)

(assert (=> b!246897 (= lt!123550 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!381 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)))))

(declare-fun c!41314 () Bool)

(assert (=> b!246897 (= c!41314 ((_ is MissingZero!1096) lt!123545))))

(assert (=> b!246897 e!160149))

(declare-fun bm!23092 () Bool)

(assert (=> bm!23092 (= call!23095 (inRange!0 (ite c!41314 (index!6554 lt!123545) (index!6557 lt!123545)) (mask!10703 thiss!1504)))))

(declare-fun mapIsEmpty!10931 () Bool)

(assert (=> mapIsEmpty!10931 mapRes!10931))

(declare-fun b!246898 () Bool)

(assert (=> b!246898 (= e!160154 (not call!23094))))

(declare-fun b!246899 () Bool)

(assert (=> b!246899 (= e!160158 e!160154)))

(declare-fun res!121002 () Bool)

(assert (=> b!246899 (= res!121002 call!23095)))

(assert (=> b!246899 (=> (not res!121002) (not e!160154))))

(declare-fun b!246900 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!246900 (= e!160151 (validKeyInArray!0 key!932))))

(declare-fun b!246901 () Bool)

(assert (=> b!246901 (= e!160161 tp_is_empty!6439)))

(declare-fun mapNonEmpty!10931 () Bool)

(declare-fun tp!22976 () Bool)

(assert (=> mapNonEmpty!10931 (= mapRes!10931 (and tp!22976 e!160162))))

(declare-fun mapRest!10931 () (Array (_ BitVec 32) ValueCell!2876))

(declare-fun mapValue!10931 () ValueCell!2876)

(declare-fun mapKey!10931 () (_ BitVec 32))

(assert (=> mapNonEmpty!10931 (= (arr!5775 (_values!4554 thiss!1504)) (store mapRest!10931 mapKey!10931 mapValue!10931))))

(declare-fun b!246902 () Bool)

(declare-fun Unit!7624 () Unit!7620)

(assert (=> b!246902 (= e!160153 Unit!7624)))

(assert (= (and start!23528 res!121007) b!246893))

(assert (= (and b!246893 res!121009) b!246883))

(assert (= (and b!246883 res!121008) b!246886))

(assert (= (and b!246886 c!41315) b!246884))

(assert (= (and b!246886 (not c!41315)) b!246897))

(assert (= (and b!246897 c!41314) b!246887))

(assert (= (and b!246897 (not c!41314)) b!246892))

(assert (= (and b!246887 res!121004) b!246891))

(assert (= (and b!246891 res!121003) b!246885))

(assert (= (and b!246892 c!41316) b!246899))

(assert (= (and b!246892 (not c!41316)) b!246889))

(assert (= (and b!246899 res!121002) b!246888))

(assert (= (and b!246888 res!121010) b!246898))

(assert (= (or b!246887 b!246899) bm!23092))

(assert (= (or b!246885 b!246898) bm!23091))

(assert (= (and b!246886 res!121005) b!246881))

(assert (= (and b!246881 c!41317) b!246894))

(assert (= (and b!246881 (not c!41317)) b!246902))

(assert (= (and b!246881 (not res!121006)) b!246896))

(assert (= (and b!246896 (not res!121001)) b!246900))

(assert (= (and b!246895 condMapEmpty!10931) mapIsEmpty!10931))

(assert (= (and b!246895 (not condMapEmpty!10931)) mapNonEmpty!10931))

(assert (= (and mapNonEmpty!10931 ((_ is ValueCellFull!2876) mapValue!10931)) b!246890))

(assert (= (and b!246895 ((_ is ValueCellFull!2876) mapDefault!10931)) b!246901))

(assert (= b!246882 b!246895))

(assert (= start!23528 b!246882))

(declare-fun m!263609 () Bool)

(assert (=> b!246897 m!263609))

(declare-fun m!263611 () Bool)

(assert (=> bm!23091 m!263611))

(declare-fun m!263613 () Bool)

(assert (=> b!246882 m!263613))

(declare-fun m!263615 () Bool)

(assert (=> b!246882 m!263615))

(declare-fun m!263617 () Bool)

(assert (=> b!246900 m!263617))

(declare-fun m!263619 () Bool)

(assert (=> b!246894 m!263619))

(declare-fun m!263621 () Bool)

(assert (=> b!246883 m!263621))

(declare-fun m!263623 () Bool)

(assert (=> b!246891 m!263623))

(declare-fun m!263625 () Bool)

(assert (=> b!246884 m!263625))

(declare-fun m!263627 () Bool)

(assert (=> b!246888 m!263627))

(declare-fun m!263629 () Bool)

(assert (=> b!246881 m!263629))

(assert (=> b!246881 m!263611))

(declare-fun m!263631 () Bool)

(assert (=> b!246881 m!263631))

(declare-fun m!263633 () Bool)

(assert (=> b!246881 m!263633))

(declare-fun m!263635 () Bool)

(assert (=> b!246881 m!263635))

(declare-fun m!263637 () Bool)

(assert (=> b!246881 m!263637))

(declare-fun m!263639 () Bool)

(assert (=> b!246881 m!263639))

(declare-fun m!263641 () Bool)

(assert (=> b!246881 m!263641))

(declare-fun m!263643 () Bool)

(assert (=> start!23528 m!263643))

(declare-fun m!263645 () Bool)

(assert (=> mapNonEmpty!10931 m!263645))

(declare-fun m!263647 () Bool)

(assert (=> b!246886 m!263647))

(declare-fun m!263649 () Bool)

(assert (=> b!246886 m!263649))

(assert (=> b!246886 m!263649))

(declare-fun m!263651 () Bool)

(assert (=> b!246886 m!263651))

(declare-fun m!263653 () Bool)

(assert (=> bm!23092 m!263653))

(check-sat (not b!246882) (not b!246886) (not b!246884) (not mapNonEmpty!10931) (not bm!23092) (not b!246900) (not bm!23091) b_and!13551 tp_is_empty!6439 (not b!246881) (not b!246897) (not start!23528) (not b!246894) (not b!246883) (not b_next!6577))
(check-sat b_and!13551 (not b_next!6577))
(get-model)

(declare-fun b!247043 () Bool)

(declare-fun e!160258 () (_ BitVec 32))

(assert (=> b!247043 (= e!160258 #b00000000000000000000000000000000)))

(declare-fun d!60291 () Bool)

(declare-fun lt!123610 () (_ BitVec 32))

(assert (=> d!60291 (and (bvsge lt!123610 #b00000000000000000000000000000000) (bvsle lt!123610 (bvsub (size!6120 lt!123547) #b00000000000000000000000000000000)))))

(assert (=> d!60291 (= lt!123610 e!160258)))

(declare-fun c!41347 () Bool)

(assert (=> d!60291 (= c!41347 (bvsge #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))))))

(assert (=> d!60291 (and (bvsle #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6120 (_keys!6691 thiss!1504)) (size!6120 lt!123547)))))

(assert (=> d!60291 (= (arrayCountValidKeys!0 lt!123547 #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))) lt!123610)))

(declare-fun b!247044 () Bool)

(declare-fun e!160259 () (_ BitVec 32))

(assert (=> b!247044 (= e!160258 e!160259)))

(declare-fun c!41346 () Bool)

(assert (=> b!247044 (= c!41346 (validKeyInArray!0 (select (arr!5776 lt!123547) #b00000000000000000000000000000000)))))

(declare-fun b!247045 () Bool)

(declare-fun call!23110 () (_ BitVec 32))

(assert (=> b!247045 (= e!160259 (bvadd #b00000000000000000000000000000001 call!23110))))

(declare-fun b!247046 () Bool)

(assert (=> b!247046 (= e!160259 call!23110)))

(declare-fun bm!23107 () Bool)

(assert (=> bm!23107 (= call!23110 (arrayCountValidKeys!0 lt!123547 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6120 (_keys!6691 thiss!1504))))))

(assert (= (and d!60291 c!41347) b!247043))

(assert (= (and d!60291 (not c!41347)) b!247044))

(assert (= (and b!247044 c!41346) b!247045))

(assert (= (and b!247044 (not c!41346)) b!247046))

(assert (= (or b!247045 b!247046) bm!23107))

(declare-fun m!263747 () Bool)

(assert (=> b!247044 m!263747))

(assert (=> b!247044 m!263747))

(declare-fun m!263749 () Bool)

(assert (=> b!247044 m!263749))

(declare-fun m!263751 () Bool)

(assert (=> bm!23107 m!263751))

(assert (=> b!246881 d!60291))

(declare-fun b!247057 () Bool)

(declare-fun e!160265 () Bool)

(assert (=> b!247057 (= e!160265 (bvslt (size!6120 (_keys!6691 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!247058 () Bool)

(declare-fun e!160264 () Bool)

(assert (=> b!247058 (= e!160264 (= (arrayCountValidKeys!0 (array!12178 (store (arr!5776 (_keys!6691 thiss!1504)) index!297 key!932) (size!6120 (_keys!6691 thiss!1504))) #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6691 thiss!1504) #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!247055 () Bool)

(declare-fun res!121081 () Bool)

(assert (=> b!247055 (=> (not res!121081) (not e!160265))))

(assert (=> b!247055 (= res!121081 (not (validKeyInArray!0 (select (arr!5776 (_keys!6691 thiss!1504)) index!297))))))

(declare-fun b!247056 () Bool)

(declare-fun res!121082 () Bool)

(assert (=> b!247056 (=> (not res!121082) (not e!160265))))

(assert (=> b!247056 (= res!121082 (validKeyInArray!0 key!932))))

(declare-fun d!60293 () Bool)

(assert (=> d!60293 e!160264))

(declare-fun res!121080 () Bool)

(assert (=> d!60293 (=> (not res!121080) (not e!160264))))

(assert (=> d!60293 (= res!121080 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6120 (_keys!6691 thiss!1504)))))))

(declare-fun lt!123613 () Unit!7620)

(declare-fun choose!1 (array!12177 (_ BitVec 32) (_ BitVec 64)) Unit!7620)

(assert (=> d!60293 (= lt!123613 (choose!1 (_keys!6691 thiss!1504) index!297 key!932))))

(assert (=> d!60293 e!160265))

(declare-fun res!121079 () Bool)

(assert (=> d!60293 (=> (not res!121079) (not e!160265))))

(assert (=> d!60293 (= res!121079 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6120 (_keys!6691 thiss!1504)))))))

(assert (=> d!60293 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6691 thiss!1504) index!297 key!932) lt!123613)))

(assert (= (and d!60293 res!121079) b!247055))

(assert (= (and b!247055 res!121081) b!247056))

(assert (= (and b!247056 res!121082) b!247057))

(assert (= (and d!60293 res!121080) b!247058))

(assert (=> b!247058 m!263635))

(declare-fun m!263753 () Bool)

(assert (=> b!247058 m!263753))

(assert (=> b!247058 m!263637))

(declare-fun m!263755 () Bool)

(assert (=> b!247055 m!263755))

(assert (=> b!247055 m!263755))

(declare-fun m!263757 () Bool)

(assert (=> b!247055 m!263757))

(assert (=> b!247056 m!263617))

(declare-fun m!263759 () Bool)

(assert (=> d!60293 m!263759))

(assert (=> b!246881 d!60293))

(declare-fun d!60295 () Bool)

(declare-fun res!121087 () Bool)

(declare-fun e!160270 () Bool)

(assert (=> d!60295 (=> res!121087 e!160270)))

(assert (=> d!60295 (= res!121087 (= (select (arr!5776 (_keys!6691 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60295 (= (arrayContainsKey!0 (_keys!6691 thiss!1504) key!932 #b00000000000000000000000000000000) e!160270)))

(declare-fun b!247063 () Bool)

(declare-fun e!160271 () Bool)

(assert (=> b!247063 (= e!160270 e!160271)))

(declare-fun res!121088 () Bool)

(assert (=> b!247063 (=> (not res!121088) (not e!160271))))

(assert (=> b!247063 (= res!121088 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6120 (_keys!6691 thiss!1504))))))

(declare-fun b!247064 () Bool)

(assert (=> b!247064 (= e!160271 (arrayContainsKey!0 (_keys!6691 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60295 (not res!121087)) b!247063))

(assert (= (and b!247063 res!121088) b!247064))

(declare-fun m!263761 () Bool)

(assert (=> d!60295 m!263761))

(declare-fun m!263763 () Bool)

(assert (=> b!247064 m!263763))

(assert (=> b!246881 d!60295))

(declare-fun b!247065 () Bool)

(declare-fun e!160272 () (_ BitVec 32))

(assert (=> b!247065 (= e!160272 #b00000000000000000000000000000000)))

(declare-fun d!60297 () Bool)

(declare-fun lt!123614 () (_ BitVec 32))

(assert (=> d!60297 (and (bvsge lt!123614 #b00000000000000000000000000000000) (bvsle lt!123614 (bvsub (size!6120 (_keys!6691 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60297 (= lt!123614 e!160272)))

(declare-fun c!41349 () Bool)

(assert (=> d!60297 (= c!41349 (bvsge #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))))))

(assert (=> d!60297 (and (bvsle #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6120 (_keys!6691 thiss!1504)) (size!6120 (_keys!6691 thiss!1504))))))

(assert (=> d!60297 (= (arrayCountValidKeys!0 (_keys!6691 thiss!1504) #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))) lt!123614)))

(declare-fun b!247066 () Bool)

(declare-fun e!160273 () (_ BitVec 32))

(assert (=> b!247066 (= e!160272 e!160273)))

(declare-fun c!41348 () Bool)

(assert (=> b!247066 (= c!41348 (validKeyInArray!0 (select (arr!5776 (_keys!6691 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!247067 () Bool)

(declare-fun call!23111 () (_ BitVec 32))

(assert (=> b!247067 (= e!160273 (bvadd #b00000000000000000000000000000001 call!23111))))

(declare-fun b!247068 () Bool)

(assert (=> b!247068 (= e!160273 call!23111)))

(declare-fun bm!23108 () Bool)

(assert (=> bm!23108 (= call!23111 (arrayCountValidKeys!0 (_keys!6691 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6120 (_keys!6691 thiss!1504))))))

(assert (= (and d!60297 c!41349) b!247065))

(assert (= (and d!60297 (not c!41349)) b!247066))

(assert (= (and b!247066 c!41348) b!247067))

(assert (= (and b!247066 (not c!41348)) b!247068))

(assert (= (or b!247067 b!247068) bm!23108))

(assert (=> b!247066 m!263761))

(assert (=> b!247066 m!263761))

(declare-fun m!263765 () Bool)

(assert (=> b!247066 m!263765))

(declare-fun m!263767 () Bool)

(assert (=> bm!23108 m!263767))

(assert (=> b!246881 d!60297))

(declare-fun d!60299 () Bool)

(assert (=> d!60299 (= (validMask!0 (mask!10703 thiss!1504)) (and (or (= (mask!10703 thiss!1504) #b00000000000000000000000000000111) (= (mask!10703 thiss!1504) #b00000000000000000000000000001111) (= (mask!10703 thiss!1504) #b00000000000000000000000000011111) (= (mask!10703 thiss!1504) #b00000000000000000000000000111111) (= (mask!10703 thiss!1504) #b00000000000000000000000001111111) (= (mask!10703 thiss!1504) #b00000000000000000000000011111111) (= (mask!10703 thiss!1504) #b00000000000000000000000111111111) (= (mask!10703 thiss!1504) #b00000000000000000000001111111111) (= (mask!10703 thiss!1504) #b00000000000000000000011111111111) (= (mask!10703 thiss!1504) #b00000000000000000000111111111111) (= (mask!10703 thiss!1504) #b00000000000000000001111111111111) (= (mask!10703 thiss!1504) #b00000000000000000011111111111111) (= (mask!10703 thiss!1504) #b00000000000000000111111111111111) (= (mask!10703 thiss!1504) #b00000000000000001111111111111111) (= (mask!10703 thiss!1504) #b00000000000000011111111111111111) (= (mask!10703 thiss!1504) #b00000000000000111111111111111111) (= (mask!10703 thiss!1504) #b00000000000001111111111111111111) (= (mask!10703 thiss!1504) #b00000000000011111111111111111111) (= (mask!10703 thiss!1504) #b00000000000111111111111111111111) (= (mask!10703 thiss!1504) #b00000000001111111111111111111111) (= (mask!10703 thiss!1504) #b00000000011111111111111111111111) (= (mask!10703 thiss!1504) #b00000000111111111111111111111111) (= (mask!10703 thiss!1504) #b00000001111111111111111111111111) (= (mask!10703 thiss!1504) #b00000011111111111111111111111111) (= (mask!10703 thiss!1504) #b00000111111111111111111111111111) (= (mask!10703 thiss!1504) #b00001111111111111111111111111111) (= (mask!10703 thiss!1504) #b00011111111111111111111111111111) (= (mask!10703 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10703 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!246881 d!60299))

(declare-fun bm!23111 () Bool)

(declare-fun call!23114 () Bool)

(declare-fun c!41352 () Bool)

(assert (=> bm!23111 (= call!23114 (arrayNoDuplicates!0 lt!123547 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41352 (Cons!3670 (select (arr!5776 lt!123547) #b00000000000000000000000000000000) Nil!3671) Nil!3671)))))

(declare-fun b!247080 () Bool)

(declare-fun e!160284 () Bool)

(declare-fun e!160285 () Bool)

(assert (=> b!247080 (= e!160284 e!160285)))

(assert (=> b!247080 (= c!41352 (validKeyInArray!0 (select (arr!5776 lt!123547) #b00000000000000000000000000000000)))))

(declare-fun b!247081 () Bool)

(assert (=> b!247081 (= e!160285 call!23114)))

(declare-fun b!247082 () Bool)

(assert (=> b!247082 (= e!160285 call!23114)))

(declare-fun b!247083 () Bool)

(declare-fun e!160282 () Bool)

(assert (=> b!247083 (= e!160282 e!160284)))

(declare-fun res!121096 () Bool)

(assert (=> b!247083 (=> (not res!121096) (not e!160284))))

(declare-fun e!160283 () Bool)

(assert (=> b!247083 (= res!121096 (not e!160283))))

(declare-fun res!121095 () Bool)

(assert (=> b!247083 (=> (not res!121095) (not e!160283))))

(assert (=> b!247083 (= res!121095 (validKeyInArray!0 (select (arr!5776 lt!123547) #b00000000000000000000000000000000)))))

(declare-fun b!247079 () Bool)

(declare-fun contains!1774 (List!3674 (_ BitVec 64)) Bool)

(assert (=> b!247079 (= e!160283 (contains!1774 Nil!3671 (select (arr!5776 lt!123547) #b00000000000000000000000000000000)))))

(declare-fun d!60301 () Bool)

(declare-fun res!121097 () Bool)

(assert (=> d!60301 (=> res!121097 e!160282)))

(assert (=> d!60301 (= res!121097 (bvsge #b00000000000000000000000000000000 (size!6120 lt!123547)))))

(assert (=> d!60301 (= (arrayNoDuplicates!0 lt!123547 #b00000000000000000000000000000000 Nil!3671) e!160282)))

(assert (= (and d!60301 (not res!121097)) b!247083))

(assert (= (and b!247083 res!121095) b!247079))

(assert (= (and b!247083 res!121096) b!247080))

(assert (= (and b!247080 c!41352) b!247082))

(assert (= (and b!247080 (not c!41352)) b!247081))

(assert (= (or b!247082 b!247081) bm!23111))

(assert (=> bm!23111 m!263747))

(declare-fun m!263769 () Bool)

(assert (=> bm!23111 m!263769))

(assert (=> b!247080 m!263747))

(assert (=> b!247080 m!263747))

(assert (=> b!247080 m!263749))

(assert (=> b!247083 m!263747))

(assert (=> b!247083 m!263747))

(assert (=> b!247083 m!263749))

(assert (=> b!247079 m!263747))

(assert (=> b!247079 m!263747))

(declare-fun m!263771 () Bool)

(assert (=> b!247079 m!263771))

(assert (=> b!246881 d!60301))

(declare-fun d!60303 () Bool)

(declare-fun e!160288 () Bool)

(assert (=> d!60303 e!160288))

(declare-fun res!121100 () Bool)

(assert (=> d!60303 (=> (not res!121100) (not e!160288))))

(assert (=> d!60303 (= res!121100 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6120 (_keys!6691 thiss!1504)))))))

(declare-fun lt!123617 () Unit!7620)

(declare-fun choose!41 (array!12177 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3674) Unit!7620)

(assert (=> d!60303 (= lt!123617 (choose!41 (_keys!6691 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3671))))

(assert (=> d!60303 (bvslt (size!6120 (_keys!6691 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60303 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6691 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3671) lt!123617)))

(declare-fun b!247086 () Bool)

(assert (=> b!247086 (= e!160288 (arrayNoDuplicates!0 (array!12178 (store (arr!5776 (_keys!6691 thiss!1504)) index!297 key!932) (size!6120 (_keys!6691 thiss!1504))) #b00000000000000000000000000000000 Nil!3671))))

(assert (= (and d!60303 res!121100) b!247086))

(declare-fun m!263773 () Bool)

(assert (=> d!60303 m!263773))

(assert (=> b!247086 m!263635))

(declare-fun m!263775 () Bool)

(assert (=> b!247086 m!263775))

(assert (=> b!246881 d!60303))

(declare-fun b!247103 () Bool)

(declare-fun res!121112 () Bool)

(declare-fun e!160299 () Bool)

(assert (=> b!247103 (=> (not res!121112) (not e!160299))))

(declare-fun lt!123623 () SeekEntryResult!1096)

(assert (=> b!247103 (= res!121112 (= (select (arr!5776 (_keys!6691 thiss!1504)) (index!6557 lt!123623)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247103 (and (bvsge (index!6557 lt!123623) #b00000000000000000000000000000000) (bvslt (index!6557 lt!123623) (size!6120 (_keys!6691 thiss!1504))))))

(declare-fun b!247104 () Bool)

(declare-fun e!160297 () Bool)

(declare-fun e!160298 () Bool)

(assert (=> b!247104 (= e!160297 e!160298)))

(declare-fun res!121110 () Bool)

(declare-fun call!23120 () Bool)

(assert (=> b!247104 (= res!121110 call!23120)))

(assert (=> b!247104 (=> (not res!121110) (not e!160298))))

(declare-fun b!247105 () Bool)

(declare-fun res!121111 () Bool)

(assert (=> b!247105 (=> (not res!121111) (not e!160299))))

(assert (=> b!247105 (= res!121111 call!23120)))

(declare-fun e!160300 () Bool)

(assert (=> b!247105 (= e!160300 e!160299)))

(declare-fun b!247106 () Bool)

(assert (=> b!247106 (= e!160297 e!160300)))

(declare-fun c!41358 () Bool)

(assert (=> b!247106 (= c!41358 ((_ is MissingVacant!1096) lt!123623))))

(declare-fun bm!23116 () Bool)

(declare-fun call!23119 () Bool)

(assert (=> bm!23116 (= call!23119 (arrayContainsKey!0 (_keys!6691 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247108 () Bool)

(assert (=> b!247108 (= e!160299 (not call!23119))))

(declare-fun b!247109 () Bool)

(assert (=> b!247109 (= e!160298 (not call!23119))))

(declare-fun c!41357 () Bool)

(declare-fun bm!23117 () Bool)

(assert (=> bm!23117 (= call!23120 (inRange!0 (ite c!41357 (index!6554 lt!123623) (index!6557 lt!123623)) (mask!10703 thiss!1504)))))

(declare-fun b!247110 () Bool)

(assert (=> b!247110 (and (bvsge (index!6554 lt!123623) #b00000000000000000000000000000000) (bvslt (index!6554 lt!123623) (size!6120 (_keys!6691 thiss!1504))))))

(declare-fun res!121109 () Bool)

(assert (=> b!247110 (= res!121109 (= (select (arr!5776 (_keys!6691 thiss!1504)) (index!6554 lt!123623)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247110 (=> (not res!121109) (not e!160298))))

(declare-fun b!247107 () Bool)

(assert (=> b!247107 (= e!160300 ((_ is Undefined!1096) lt!123623))))

(declare-fun d!60305 () Bool)

(assert (=> d!60305 e!160297))

(assert (=> d!60305 (= c!41357 ((_ is MissingZero!1096) lt!123623))))

(assert (=> d!60305 (= lt!123623 (seekEntryOrOpen!0 key!932 (_keys!6691 thiss!1504) (mask!10703 thiss!1504)))))

(declare-fun lt!123622 () Unit!7620)

(declare-fun choose!1168 (array!12177 array!12175 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) Int) Unit!7620)

(assert (=> d!60305 (= lt!123622 (choose!1168 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)))))

(assert (=> d!60305 (validMask!0 (mask!10703 thiss!1504))))

(assert (=> d!60305 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!381 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)) lt!123622)))

(assert (= (and d!60305 c!41357) b!247104))

(assert (= (and d!60305 (not c!41357)) b!247106))

(assert (= (and b!247104 res!121110) b!247110))

(assert (= (and b!247110 res!121109) b!247109))

(assert (= (and b!247106 c!41358) b!247105))

(assert (= (and b!247106 (not c!41358)) b!247107))

(assert (= (and b!247105 res!121111) b!247103))

(assert (= (and b!247103 res!121112) b!247108))

(assert (= (or b!247104 b!247105) bm!23117))

(assert (= (or b!247109 b!247108) bm!23116))

(assert (=> bm!23116 m!263611))

(declare-fun m!263777 () Bool)

(assert (=> b!247110 m!263777))

(declare-fun m!263779 () Bool)

(assert (=> b!247103 m!263779))

(assert (=> d!60305 m!263621))

(declare-fun m!263781 () Bool)

(assert (=> d!60305 m!263781))

(assert (=> d!60305 m!263629))

(declare-fun m!263783 () Bool)

(assert (=> bm!23117 m!263783))

(assert (=> b!246897 d!60305))

(declare-fun d!60307 () Bool)

(assert (=> d!60307 (= (array_inv!3809 (_keys!6691 thiss!1504)) (bvsge (size!6120 (_keys!6691 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246882 d!60307))

(declare-fun d!60309 () Bool)

(assert (=> d!60309 (= (array_inv!3810 (_values!4554 thiss!1504)) (bvsge (size!6119 (_values!4554 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246882 d!60309))

(declare-fun d!60311 () Bool)

(assert (=> d!60311 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!246900 d!60311))

(assert (=> bm!23091 d!60295))

(declare-fun d!60313 () Bool)

(assert (=> d!60313 (= (inRange!0 (ite c!41314 (index!6554 lt!123545) (index!6557 lt!123545)) (mask!10703 thiss!1504)) (and (bvsge (ite c!41314 (index!6554 lt!123545) (index!6557 lt!123545)) #b00000000000000000000000000000000) (bvslt (ite c!41314 (index!6554 lt!123545) (index!6557 lt!123545)) (bvadd (mask!10703 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23092 d!60313))

(declare-fun b!247124 () Bool)

(declare-fun e!160309 () SeekEntryResult!1096)

(declare-fun e!160308 () SeekEntryResult!1096)

(assert (=> b!247124 (= e!160309 e!160308)))

(declare-fun lt!123631 () (_ BitVec 64))

(declare-fun lt!123630 () SeekEntryResult!1096)

(assert (=> b!247124 (= lt!123631 (select (arr!5776 (_keys!6691 thiss!1504)) (index!6556 lt!123630)))))

(declare-fun c!41367 () Bool)

(assert (=> b!247124 (= c!41367 (= lt!123631 key!932))))

(declare-fun b!247125 () Bool)

(declare-fun e!160307 () SeekEntryResult!1096)

(assert (=> b!247125 (= e!160307 (MissingZero!1096 (index!6556 lt!123630)))))

(declare-fun b!247126 () Bool)

(assert (=> b!247126 (= e!160308 (Found!1096 (index!6556 lt!123630)))))

(declare-fun b!247127 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12177 (_ BitVec 32)) SeekEntryResult!1096)

(assert (=> b!247127 (= e!160307 (seekKeyOrZeroReturnVacant!0 (x!24505 lt!123630) (index!6556 lt!123630) (index!6556 lt!123630) key!932 (_keys!6691 thiss!1504) (mask!10703 thiss!1504)))))

(declare-fun b!247128 () Bool)

(declare-fun c!41365 () Bool)

(assert (=> b!247128 (= c!41365 (= lt!123631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247128 (= e!160308 e!160307)))

(declare-fun d!60315 () Bool)

(declare-fun lt!123632 () SeekEntryResult!1096)

(assert (=> d!60315 (and (or ((_ is Undefined!1096) lt!123632) (not ((_ is Found!1096) lt!123632)) (and (bvsge (index!6555 lt!123632) #b00000000000000000000000000000000) (bvslt (index!6555 lt!123632) (size!6120 (_keys!6691 thiss!1504))))) (or ((_ is Undefined!1096) lt!123632) ((_ is Found!1096) lt!123632) (not ((_ is MissingZero!1096) lt!123632)) (and (bvsge (index!6554 lt!123632) #b00000000000000000000000000000000) (bvslt (index!6554 lt!123632) (size!6120 (_keys!6691 thiss!1504))))) (or ((_ is Undefined!1096) lt!123632) ((_ is Found!1096) lt!123632) ((_ is MissingZero!1096) lt!123632) (not ((_ is MissingVacant!1096) lt!123632)) (and (bvsge (index!6557 lt!123632) #b00000000000000000000000000000000) (bvslt (index!6557 lt!123632) (size!6120 (_keys!6691 thiss!1504))))) (or ((_ is Undefined!1096) lt!123632) (ite ((_ is Found!1096) lt!123632) (= (select (arr!5776 (_keys!6691 thiss!1504)) (index!6555 lt!123632)) key!932) (ite ((_ is MissingZero!1096) lt!123632) (= (select (arr!5776 (_keys!6691 thiss!1504)) (index!6554 lt!123632)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1096) lt!123632) (= (select (arr!5776 (_keys!6691 thiss!1504)) (index!6557 lt!123632)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60315 (= lt!123632 e!160309)))

(declare-fun c!41366 () Bool)

(assert (=> d!60315 (= c!41366 (and ((_ is Intermediate!1096) lt!123630) (undefined!1908 lt!123630)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12177 (_ BitVec 32)) SeekEntryResult!1096)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60315 (= lt!123630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10703 thiss!1504)) key!932 (_keys!6691 thiss!1504) (mask!10703 thiss!1504)))))

(assert (=> d!60315 (validMask!0 (mask!10703 thiss!1504))))

(assert (=> d!60315 (= (seekEntryOrOpen!0 key!932 (_keys!6691 thiss!1504) (mask!10703 thiss!1504)) lt!123632)))

(declare-fun b!247123 () Bool)

(assert (=> b!247123 (= e!160309 Undefined!1096)))

(assert (= (and d!60315 c!41366) b!247123))

(assert (= (and d!60315 (not c!41366)) b!247124))

(assert (= (and b!247124 c!41367) b!247126))

(assert (= (and b!247124 (not c!41367)) b!247128))

(assert (= (and b!247128 c!41365) b!247125))

(assert (= (and b!247128 (not c!41365)) b!247127))

(declare-fun m!263785 () Bool)

(assert (=> b!247124 m!263785))

(declare-fun m!263787 () Bool)

(assert (=> b!247127 m!263787))

(assert (=> d!60315 m!263629))

(declare-fun m!263789 () Bool)

(assert (=> d!60315 m!263789))

(declare-fun m!263791 () Bool)

(assert (=> d!60315 m!263791))

(assert (=> d!60315 m!263789))

(declare-fun m!263793 () Bool)

(assert (=> d!60315 m!263793))

(declare-fun m!263795 () Bool)

(assert (=> d!60315 m!263795))

(declare-fun m!263797 () Bool)

(assert (=> d!60315 m!263797))

(assert (=> b!246883 d!60315))

(declare-fun d!60317 () Bool)

(declare-fun e!160312 () Bool)

(assert (=> d!60317 e!160312))

(declare-fun res!121118 () Bool)

(assert (=> d!60317 (=> (not res!121118) (not e!160312))))

(declare-fun lt!123637 () SeekEntryResult!1096)

(assert (=> d!60317 (= res!121118 ((_ is Found!1096) lt!123637))))

(assert (=> d!60317 (= lt!123637 (seekEntryOrOpen!0 key!932 (_keys!6691 thiss!1504) (mask!10703 thiss!1504)))))

(declare-fun lt!123638 () Unit!7620)

(declare-fun choose!1169 (array!12177 array!12175 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) Int) Unit!7620)

(assert (=> d!60317 (= lt!123638 (choose!1169 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)))))

(assert (=> d!60317 (validMask!0 (mask!10703 thiss!1504))))

(assert (=> d!60317 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!383 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)) lt!123638)))

(declare-fun b!247133 () Bool)

(declare-fun res!121117 () Bool)

(assert (=> b!247133 (=> (not res!121117) (not e!160312))))

(assert (=> b!247133 (= res!121117 (inRange!0 (index!6555 lt!123637) (mask!10703 thiss!1504)))))

(declare-fun b!247134 () Bool)

(assert (=> b!247134 (= e!160312 (= (select (arr!5776 (_keys!6691 thiss!1504)) (index!6555 lt!123637)) key!932))))

(assert (=> b!247134 (and (bvsge (index!6555 lt!123637) #b00000000000000000000000000000000) (bvslt (index!6555 lt!123637) (size!6120 (_keys!6691 thiss!1504))))))

(assert (= (and d!60317 res!121118) b!247133))

(assert (= (and b!247133 res!121117) b!247134))

(assert (=> d!60317 m!263621))

(declare-fun m!263799 () Bool)

(assert (=> d!60317 m!263799))

(assert (=> d!60317 m!263629))

(declare-fun m!263801 () Bool)

(assert (=> b!247133 m!263801))

(declare-fun m!263803 () Bool)

(assert (=> b!247134 m!263803))

(assert (=> b!246884 d!60317))

(declare-fun d!60319 () Bool)

(declare-fun res!121125 () Bool)

(declare-fun e!160315 () Bool)

(assert (=> d!60319 (=> (not res!121125) (not e!160315))))

(declare-fun simpleValid!257 (LongMapFixedSize!3652) Bool)

(assert (=> d!60319 (= res!121125 (simpleValid!257 thiss!1504))))

(assert (=> d!60319 (= (valid!1437 thiss!1504) e!160315)))

(declare-fun b!247141 () Bool)

(declare-fun res!121126 () Bool)

(assert (=> b!247141 (=> (not res!121126) (not e!160315))))

(assert (=> b!247141 (= res!121126 (= (arrayCountValidKeys!0 (_keys!6691 thiss!1504) #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))) (_size!1875 thiss!1504)))))

(declare-fun b!247142 () Bool)

(declare-fun res!121127 () Bool)

(assert (=> b!247142 (=> (not res!121127) (not e!160315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12177 (_ BitVec 32)) Bool)

(assert (=> b!247142 (= res!121127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6691 thiss!1504) (mask!10703 thiss!1504)))))

(declare-fun b!247143 () Bool)

(assert (=> b!247143 (= e!160315 (arrayNoDuplicates!0 (_keys!6691 thiss!1504) #b00000000000000000000000000000000 Nil!3671))))

(assert (= (and d!60319 res!121125) b!247141))

(assert (= (and b!247141 res!121126) b!247142))

(assert (= (and b!247142 res!121127) b!247143))

(declare-fun m!263805 () Bool)

(assert (=> d!60319 m!263805))

(assert (=> b!247141 m!263637))

(declare-fun m!263807 () Bool)

(assert (=> b!247142 m!263807))

(declare-fun m!263809 () Bool)

(assert (=> b!247143 m!263809))

(assert (=> start!23528 d!60319))

(declare-fun d!60321 () Bool)

(assert (=> d!60321 (contains!1771 (getCurrentListMap!1362 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)) key!932)))

(declare-fun lt!123641 () Unit!7620)

(declare-fun choose!1170 (array!12177 array!12175 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) (_ BitVec 32) Int) Unit!7620)

(assert (=> d!60321 (= lt!123641 (choose!1170 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(assert (=> d!60321 (validMask!0 (mask!10703 thiss!1504))))

(assert (=> d!60321 (= (lemmaArrayContainsKeyThenInListMap!193 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)) lt!123641)))

(declare-fun bs!8896 () Bool)

(assert (= bs!8896 d!60321))

(assert (=> bs!8896 m!263649))

(assert (=> bs!8896 m!263649))

(assert (=> bs!8896 m!263651))

(declare-fun m!263811 () Bool)

(assert (=> bs!8896 m!263811))

(assert (=> bs!8896 m!263629))

(assert (=> b!246894 d!60321))

(declare-fun d!60323 () Bool)

(assert (=> d!60323 (= (inRange!0 index!297 (mask!10703 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10703 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!246886 d!60323))

(declare-fun d!60325 () Bool)

(declare-fun e!160321 () Bool)

(assert (=> d!60325 e!160321))

(declare-fun res!121130 () Bool)

(assert (=> d!60325 (=> res!121130 e!160321)))

(declare-fun lt!123650 () Bool)

(assert (=> d!60325 (= res!121130 (not lt!123650))))

(declare-fun lt!123653 () Bool)

(assert (=> d!60325 (= lt!123650 lt!123653)))

(declare-fun lt!123651 () Unit!7620)

(declare-fun e!160320 () Unit!7620)

(assert (=> d!60325 (= lt!123651 e!160320)))

(declare-fun c!41370 () Bool)

(assert (=> d!60325 (= c!41370 lt!123653)))

(declare-fun containsKey!282 (List!3675 (_ BitVec 64)) Bool)

(assert (=> d!60325 (= lt!123653 (containsKey!282 (toList!1853 (getCurrentListMap!1362 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504))) key!932))))

(assert (=> d!60325 (= (contains!1771 (getCurrentListMap!1362 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)) key!932) lt!123650)))

(declare-fun b!247150 () Bool)

(declare-fun lt!123652 () Unit!7620)

(assert (=> b!247150 (= e!160320 lt!123652)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!231 (List!3675 (_ BitVec 64)) Unit!7620)

(assert (=> b!247150 (= lt!123652 (lemmaContainsKeyImpliesGetValueByKeyDefined!231 (toList!1853 (getCurrentListMap!1362 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504))) key!932))))

(declare-datatypes ((Option!296 0))(
  ( (Some!295 (v!5318 V!8233)) (None!294) )
))
(declare-fun isDefined!232 (Option!296) Bool)

(declare-fun getValueByKey!290 (List!3675 (_ BitVec 64)) Option!296)

(assert (=> b!247150 (isDefined!232 (getValueByKey!290 (toList!1853 (getCurrentListMap!1362 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504))) key!932))))

(declare-fun b!247151 () Bool)

(declare-fun Unit!7633 () Unit!7620)

(assert (=> b!247151 (= e!160320 Unit!7633)))

(declare-fun b!247152 () Bool)

(assert (=> b!247152 (= e!160321 (isDefined!232 (getValueByKey!290 (toList!1853 (getCurrentListMap!1362 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504))) key!932)))))

(assert (= (and d!60325 c!41370) b!247150))

(assert (= (and d!60325 (not c!41370)) b!247151))

(assert (= (and d!60325 (not res!121130)) b!247152))

(declare-fun m!263813 () Bool)

(assert (=> d!60325 m!263813))

(declare-fun m!263815 () Bool)

(assert (=> b!247150 m!263815))

(declare-fun m!263817 () Bool)

(assert (=> b!247150 m!263817))

(assert (=> b!247150 m!263817))

(declare-fun m!263819 () Bool)

(assert (=> b!247150 m!263819))

(assert (=> b!247152 m!263817))

(assert (=> b!247152 m!263817))

(assert (=> b!247152 m!263819))

(assert (=> b!246886 d!60325))

(declare-fun b!247195 () Bool)

(declare-fun e!160360 () Bool)

(declare-fun lt!123704 () ListLongMap!3675)

(declare-fun apply!234 (ListLongMap!3675 (_ BitVec 64)) V!8233)

(assert (=> b!247195 (= e!160360 (= (apply!234 lt!123704 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4412 thiss!1504)))))

(declare-fun bm!23132 () Bool)

(declare-fun call!23138 () Bool)

(assert (=> bm!23132 (= call!23138 (contains!1771 lt!123704 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23133 () Bool)

(declare-fun call!23136 () ListLongMap!3675)

(declare-fun call!23135 () ListLongMap!3675)

(assert (=> bm!23133 (= call!23136 call!23135)))

(declare-fun bm!23134 () Bool)

(declare-fun call!23140 () Bool)

(assert (=> bm!23134 (= call!23140 (contains!1771 lt!123704 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23135 () Bool)

(declare-fun call!23137 () ListLongMap!3675)

(declare-fun call!23141 () ListLongMap!3675)

(assert (=> bm!23135 (= call!23137 call!23141)))

(declare-fun b!247196 () Bool)

(declare-fun e!160356 () Bool)

(assert (=> b!247196 (= e!160356 e!160360)))

(declare-fun res!121157 () Bool)

(assert (=> b!247196 (= res!121157 call!23138)))

(assert (=> b!247196 (=> (not res!121157) (not e!160360))))

(declare-fun b!247197 () Bool)

(declare-fun e!160353 () ListLongMap!3675)

(declare-fun +!667 (ListLongMap!3675 tuple2!4772) ListLongMap!3675)

(assert (=> b!247197 (= e!160353 (+!667 call!23135 (tuple2!4773 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4412 thiss!1504))))))

(declare-fun b!247198 () Bool)

(declare-fun e!160349 () Bool)

(declare-fun e!160359 () Bool)

(assert (=> b!247198 (= e!160349 e!160359)))

(declare-fun res!121155 () Bool)

(assert (=> b!247198 (=> (not res!121155) (not e!160359))))

(assert (=> b!247198 (= res!121155 (contains!1771 lt!123704 (select (arr!5776 (_keys!6691 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!247198 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))))))

(declare-fun b!247199 () Bool)

(declare-fun e!160355 () Bool)

(declare-fun e!160351 () Bool)

(assert (=> b!247199 (= e!160355 e!160351)))

(declare-fun res!121151 () Bool)

(assert (=> b!247199 (= res!121151 call!23140)))

(assert (=> b!247199 (=> (not res!121151) (not e!160351))))

(declare-fun b!247200 () Bool)

(declare-fun e!160350 () Bool)

(assert (=> b!247200 (= e!160350 e!160355)))

(declare-fun c!41388 () Bool)

(assert (=> b!247200 (= c!41388 (not (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!247201 () Bool)

(assert (=> b!247201 (= e!160356 (not call!23138))))

(declare-fun b!247202 () Bool)

(declare-fun e!160354 () Bool)

(assert (=> b!247202 (= e!160354 (validKeyInArray!0 (select (arr!5776 (_keys!6691 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!247203 () Bool)

(declare-fun res!121152 () Bool)

(assert (=> b!247203 (=> (not res!121152) (not e!160350))))

(assert (=> b!247203 (= res!121152 e!160349)))

(declare-fun res!121149 () Bool)

(assert (=> b!247203 (=> res!121149 e!160349)))

(assert (=> b!247203 (= res!121149 (not e!160354))))

(declare-fun res!121153 () Bool)

(assert (=> b!247203 (=> (not res!121153) (not e!160354))))

(assert (=> b!247203 (= res!121153 (bvslt #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))))))

(declare-fun b!247205 () Bool)

(declare-fun e!160352 () Bool)

(assert (=> b!247205 (= e!160352 (validKeyInArray!0 (select (arr!5776 (_keys!6691 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!247206 () Bool)

(declare-fun c!41386 () Bool)

(assert (=> b!247206 (= c!41386 (and (not (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!160348 () ListLongMap!3675)

(declare-fun e!160358 () ListLongMap!3675)

(assert (=> b!247206 (= e!160348 e!160358)))

(declare-fun b!247207 () Bool)

(assert (=> b!247207 (= e!160355 (not call!23140))))

(declare-fun b!247208 () Bool)

(assert (=> b!247208 (= e!160353 e!160348)))

(declare-fun c!41384 () Bool)

(assert (=> b!247208 (= c!41384 (and (not (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!247209 () Bool)

(declare-fun res!121156 () Bool)

(assert (=> b!247209 (=> (not res!121156) (not e!160350))))

(assert (=> b!247209 (= res!121156 e!160356)))

(declare-fun c!41383 () Bool)

(assert (=> b!247209 (= c!41383 (not (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!247210 () Bool)

(declare-fun e!160357 () Unit!7620)

(declare-fun lt!123708 () Unit!7620)

(assert (=> b!247210 (= e!160357 lt!123708)))

(declare-fun lt!123699 () ListLongMap!3675)

(declare-fun getCurrentListMapNoExtraKeys!550 (array!12177 array!12175 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 32) Int) ListLongMap!3675)

(assert (=> b!247210 (= lt!123699 (getCurrentListMapNoExtraKeys!550 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(declare-fun lt!123710 () (_ BitVec 64))

(assert (=> b!247210 (= lt!123710 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123711 () (_ BitVec 64))

(assert (=> b!247210 (= lt!123711 (select (arr!5776 (_keys!6691 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123700 () Unit!7620)

(declare-fun addStillContains!210 (ListLongMap!3675 (_ BitVec 64) V!8233 (_ BitVec 64)) Unit!7620)

(assert (=> b!247210 (= lt!123700 (addStillContains!210 lt!123699 lt!123710 (zeroValue!4412 thiss!1504) lt!123711))))

(assert (=> b!247210 (contains!1771 (+!667 lt!123699 (tuple2!4773 lt!123710 (zeroValue!4412 thiss!1504))) lt!123711)))

(declare-fun lt!123712 () Unit!7620)

(assert (=> b!247210 (= lt!123712 lt!123700)))

(declare-fun lt!123702 () ListLongMap!3675)

(assert (=> b!247210 (= lt!123702 (getCurrentListMapNoExtraKeys!550 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(declare-fun lt!123718 () (_ BitVec 64))

(assert (=> b!247210 (= lt!123718 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123707 () (_ BitVec 64))

(assert (=> b!247210 (= lt!123707 (select (arr!5776 (_keys!6691 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123703 () Unit!7620)

(declare-fun addApplyDifferent!210 (ListLongMap!3675 (_ BitVec 64) V!8233 (_ BitVec 64)) Unit!7620)

(assert (=> b!247210 (= lt!123703 (addApplyDifferent!210 lt!123702 lt!123718 (minValue!4412 thiss!1504) lt!123707))))

(assert (=> b!247210 (= (apply!234 (+!667 lt!123702 (tuple2!4773 lt!123718 (minValue!4412 thiss!1504))) lt!123707) (apply!234 lt!123702 lt!123707))))

(declare-fun lt!123719 () Unit!7620)

(assert (=> b!247210 (= lt!123719 lt!123703)))

(declare-fun lt!123701 () ListLongMap!3675)

(assert (=> b!247210 (= lt!123701 (getCurrentListMapNoExtraKeys!550 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(declare-fun lt!123705 () (_ BitVec 64))

(assert (=> b!247210 (= lt!123705 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123706 () (_ BitVec 64))

(assert (=> b!247210 (= lt!123706 (select (arr!5776 (_keys!6691 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123715 () Unit!7620)

(assert (=> b!247210 (= lt!123715 (addApplyDifferent!210 lt!123701 lt!123705 (zeroValue!4412 thiss!1504) lt!123706))))

(assert (=> b!247210 (= (apply!234 (+!667 lt!123701 (tuple2!4773 lt!123705 (zeroValue!4412 thiss!1504))) lt!123706) (apply!234 lt!123701 lt!123706))))

(declare-fun lt!123716 () Unit!7620)

(assert (=> b!247210 (= lt!123716 lt!123715)))

(declare-fun lt!123714 () ListLongMap!3675)

(assert (=> b!247210 (= lt!123714 (getCurrentListMapNoExtraKeys!550 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(declare-fun lt!123713 () (_ BitVec 64))

(assert (=> b!247210 (= lt!123713 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123698 () (_ BitVec 64))

(assert (=> b!247210 (= lt!123698 (select (arr!5776 (_keys!6691 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247210 (= lt!123708 (addApplyDifferent!210 lt!123714 lt!123713 (minValue!4412 thiss!1504) lt!123698))))

(assert (=> b!247210 (= (apply!234 (+!667 lt!123714 (tuple2!4773 lt!123713 (minValue!4412 thiss!1504))) lt!123698) (apply!234 lt!123714 lt!123698))))

(declare-fun b!247211 () Bool)

(declare-fun Unit!7634 () Unit!7620)

(assert (=> b!247211 (= e!160357 Unit!7634)))

(declare-fun bm!23136 () Bool)

(declare-fun call!23139 () ListLongMap!3675)

(assert (=> bm!23136 (= call!23139 (getCurrentListMapNoExtraKeys!550 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(declare-fun bm!23137 () Bool)

(assert (=> bm!23137 (= call!23141 call!23139)))

(declare-fun b!247212 () Bool)

(declare-fun get!2963 (ValueCell!2876 V!8233) V!8233)

(declare-fun dynLambda!568 (Int (_ BitVec 64)) V!8233)

(assert (=> b!247212 (= e!160359 (= (apply!234 lt!123704 (select (arr!5776 (_keys!6691 thiss!1504)) #b00000000000000000000000000000000)) (get!2963 (select (arr!5775 (_values!4554 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!568 (defaultEntry!4571 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!247212 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6119 (_values!4554 thiss!1504))))))

(assert (=> b!247212 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))))))

(declare-fun b!247213 () Bool)

(assert (=> b!247213 (= e!160348 call!23136)))

(declare-fun b!247214 () Bool)

(assert (=> b!247214 (= e!160351 (= (apply!234 lt!123704 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4412 thiss!1504)))))

(declare-fun d!60327 () Bool)

(assert (=> d!60327 e!160350))

(declare-fun res!121150 () Bool)

(assert (=> d!60327 (=> (not res!121150) (not e!160350))))

(assert (=> d!60327 (= res!121150 (or (bvsge #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))))))))

(declare-fun lt!123709 () ListLongMap!3675)

(assert (=> d!60327 (= lt!123704 lt!123709)))

(declare-fun lt!123717 () Unit!7620)

(assert (=> d!60327 (= lt!123717 e!160357)))

(declare-fun c!41387 () Bool)

(assert (=> d!60327 (= c!41387 e!160352)))

(declare-fun res!121154 () Bool)

(assert (=> d!60327 (=> (not res!121154) (not e!160352))))

(assert (=> d!60327 (= res!121154 (bvslt #b00000000000000000000000000000000 (size!6120 (_keys!6691 thiss!1504))))))

(assert (=> d!60327 (= lt!123709 e!160353)))

(declare-fun c!41385 () Bool)

(assert (=> d!60327 (= c!41385 (and (not (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4308 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60327 (validMask!0 (mask!10703 thiss!1504))))

(assert (=> d!60327 (= (getCurrentListMap!1362 (_keys!6691 thiss!1504) (_values!4554 thiss!1504) (mask!10703 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)) lt!123704)))

(declare-fun b!247204 () Bool)

(assert (=> b!247204 (= e!160358 call!23136)))

(declare-fun bm!23138 () Bool)

(assert (=> bm!23138 (= call!23135 (+!667 (ite c!41385 call!23139 (ite c!41384 call!23141 call!23137)) (ite (or c!41385 c!41384) (tuple2!4773 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4412 thiss!1504)) (tuple2!4773 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4412 thiss!1504)))))))

(declare-fun b!247215 () Bool)

(assert (=> b!247215 (= e!160358 call!23137)))

(assert (= (and d!60327 c!41385) b!247197))

(assert (= (and d!60327 (not c!41385)) b!247208))

(assert (= (and b!247208 c!41384) b!247213))

(assert (= (and b!247208 (not c!41384)) b!247206))

(assert (= (and b!247206 c!41386) b!247204))

(assert (= (and b!247206 (not c!41386)) b!247215))

(assert (= (or b!247204 b!247215) bm!23135))

(assert (= (or b!247213 bm!23135) bm!23137))

(assert (= (or b!247213 b!247204) bm!23133))

(assert (= (or b!247197 bm!23137) bm!23136))

(assert (= (or b!247197 bm!23133) bm!23138))

(assert (= (and d!60327 res!121154) b!247205))

(assert (= (and d!60327 c!41387) b!247210))

(assert (= (and d!60327 (not c!41387)) b!247211))

(assert (= (and d!60327 res!121150) b!247203))

(assert (= (and b!247203 res!121153) b!247202))

(assert (= (and b!247203 (not res!121149)) b!247198))

(assert (= (and b!247198 res!121155) b!247212))

(assert (= (and b!247203 res!121152) b!247209))

(assert (= (and b!247209 c!41383) b!247196))

(assert (= (and b!247209 (not c!41383)) b!247201))

(assert (= (and b!247196 res!121157) b!247195))

(assert (= (or b!247196 b!247201) bm!23132))

(assert (= (and b!247209 res!121156) b!247200))

(assert (= (and b!247200 c!41388) b!247199))

(assert (= (and b!247200 (not c!41388)) b!247207))

(assert (= (and b!247199 res!121151) b!247214))

(assert (= (or b!247199 b!247207) bm!23134))

(declare-fun b_lambda!8029 () Bool)

(assert (=> (not b_lambda!8029) (not b!247212)))

(declare-fun t!8692 () Bool)

(declare-fun tb!2973 () Bool)

(assert (=> (and b!246882 (= (defaultEntry!4571 thiss!1504) (defaultEntry!4571 thiss!1504)) t!8692) tb!2973))

(declare-fun result!5257 () Bool)

(assert (=> tb!2973 (= result!5257 tp_is_empty!6439)))

(assert (=> b!247212 t!8692))

(declare-fun b_and!13557 () Bool)

(assert (= b_and!13551 (and (=> t!8692 result!5257) b_and!13557)))

(assert (=> b!247212 m!263761))

(assert (=> b!247212 m!263761))

(declare-fun m!263821 () Bool)

(assert (=> b!247212 m!263821))

(declare-fun m!263823 () Bool)

(assert (=> b!247212 m!263823))

(declare-fun m!263825 () Bool)

(assert (=> b!247212 m!263825))

(assert (=> b!247212 m!263823))

(assert (=> b!247212 m!263825))

(declare-fun m!263827 () Bool)

(assert (=> b!247212 m!263827))

(assert (=> d!60327 m!263629))

(assert (=> b!247202 m!263761))

(assert (=> b!247202 m!263761))

(assert (=> b!247202 m!263765))

(declare-fun m!263829 () Bool)

(assert (=> bm!23134 m!263829))

(assert (=> b!247198 m!263761))

(assert (=> b!247198 m!263761))

(declare-fun m!263831 () Bool)

(assert (=> b!247198 m!263831))

(assert (=> b!247205 m!263761))

(assert (=> b!247205 m!263761))

(assert (=> b!247205 m!263765))

(declare-fun m!263833 () Bool)

(assert (=> b!247214 m!263833))

(declare-fun m!263835 () Bool)

(assert (=> b!247210 m!263835))

(declare-fun m!263837 () Bool)

(assert (=> b!247210 m!263837))

(declare-fun m!263839 () Bool)

(assert (=> b!247210 m!263839))

(declare-fun m!263841 () Bool)

(assert (=> b!247210 m!263841))

(declare-fun m!263843 () Bool)

(assert (=> b!247210 m!263843))

(declare-fun m!263845 () Bool)

(assert (=> b!247210 m!263845))

(declare-fun m!263847 () Bool)

(assert (=> b!247210 m!263847))

(assert (=> b!247210 m!263839))

(declare-fun m!263849 () Bool)

(assert (=> b!247210 m!263849))

(assert (=> b!247210 m!263835))

(assert (=> b!247210 m!263841))

(declare-fun m!263851 () Bool)

(assert (=> b!247210 m!263851))

(declare-fun m!263853 () Bool)

(assert (=> b!247210 m!263853))

(declare-fun m!263855 () Bool)

(assert (=> b!247210 m!263855))

(declare-fun m!263857 () Bool)

(assert (=> b!247210 m!263857))

(declare-fun m!263859 () Bool)

(assert (=> b!247210 m!263859))

(declare-fun m!263861 () Bool)

(assert (=> b!247210 m!263861))

(assert (=> b!247210 m!263761))

(declare-fun m!263863 () Bool)

(assert (=> b!247210 m!263863))

(assert (=> b!247210 m!263859))

(declare-fun m!263865 () Bool)

(assert (=> b!247210 m!263865))

(declare-fun m!263867 () Bool)

(assert (=> bm!23132 m!263867))

(declare-fun m!263869 () Bool)

(assert (=> bm!23138 m!263869))

(declare-fun m!263871 () Bool)

(assert (=> b!247195 m!263871))

(assert (=> bm!23136 m!263845))

(declare-fun m!263873 () Bool)

(assert (=> b!247197 m!263873))

(assert (=> b!246886 d!60327))

(declare-fun condMapEmpty!10940 () Bool)

(declare-fun mapDefault!10940 () ValueCell!2876)

(assert (=> mapNonEmpty!10931 (= condMapEmpty!10940 (= mapRest!10931 ((as const (Array (_ BitVec 32) ValueCell!2876)) mapDefault!10940)))))

(declare-fun e!160365 () Bool)

(declare-fun mapRes!10940 () Bool)

(assert (=> mapNonEmpty!10931 (= tp!22976 (and e!160365 mapRes!10940))))

(declare-fun b!247224 () Bool)

(declare-fun e!160366 () Bool)

(assert (=> b!247224 (= e!160366 tp_is_empty!6439)))

(declare-fun mapIsEmpty!10940 () Bool)

(assert (=> mapIsEmpty!10940 mapRes!10940))

(declare-fun b!247225 () Bool)

(assert (=> b!247225 (= e!160365 tp_is_empty!6439)))

(declare-fun mapNonEmpty!10940 () Bool)

(declare-fun tp!22991 () Bool)

(assert (=> mapNonEmpty!10940 (= mapRes!10940 (and tp!22991 e!160366))))

(declare-fun mapRest!10940 () (Array (_ BitVec 32) ValueCell!2876))

(declare-fun mapValue!10940 () ValueCell!2876)

(declare-fun mapKey!10940 () (_ BitVec 32))

(assert (=> mapNonEmpty!10940 (= mapRest!10931 (store mapRest!10940 mapKey!10940 mapValue!10940))))

(assert (= (and mapNonEmpty!10931 condMapEmpty!10940) mapIsEmpty!10940))

(assert (= (and mapNonEmpty!10931 (not condMapEmpty!10940)) mapNonEmpty!10940))

(assert (= (and mapNonEmpty!10940 ((_ is ValueCellFull!2876) mapValue!10940)) b!247224))

(assert (= (and mapNonEmpty!10931 ((_ is ValueCellFull!2876) mapDefault!10940)) b!247225))

(declare-fun m!263875 () Bool)

(assert (=> mapNonEmpty!10940 m!263875))

(declare-fun b_lambda!8031 () Bool)

(assert (= b_lambda!8029 (or (and b!246882 b_free!6577) b_lambda!8031)))

(check-sat (not d!60321) (not b!247198) (not b_lambda!8031) (not b!247212) (not b!247086) (not b!247210) (not b!247202) (not d!60315) (not bm!23116) (not d!60305) (not b!247080) b_and!13557 (not b!247127) (not bm!23132) (not b!247197) (not bm!23136) (not b!247142) (not b!247055) (not b!247079) (not b!247150) (not b!247195) (not d!60317) (not b!247133) (not bm!23138) (not b!247205) (not d!60325) (not d!60319) (not b!247083) (not b!247152) (not bm!23134) (not b!247056) (not b!247066) (not d!60293) (not b!247058) (not b!247141) (not d!60327) (not mapNonEmpty!10940) (not b!247143) (not bm!23107) (not bm!23108) (not b!247064) (not bm!23111) tp_is_empty!6439 (not d!60303) (not bm!23117) (not b!247214) (not b!247044) (not b_next!6577))
(check-sat b_and!13557 (not b_next!6577))
