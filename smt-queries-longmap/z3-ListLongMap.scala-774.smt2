; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18276 () Bool)

(assert start!18276)

(declare-fun b!181426 () Bool)

(declare-fun b_free!4483 () Bool)

(declare-fun b_next!4483 () Bool)

(assert (=> b!181426 (= b_free!4483 (not b_next!4483))))

(declare-fun tp!16200 () Bool)

(declare-fun b_and!11007 () Bool)

(assert (=> b!181426 (= tp!16200 b_and!11007)))

(declare-fun b!181421 () Bool)

(declare-fun e!119486 () Bool)

(declare-fun tp_is_empty!4255 () Bool)

(assert (=> b!181421 (= e!119486 tp_is_empty!4255)))

(declare-fun b!181422 () Bool)

(declare-fun e!119485 () Bool)

(declare-fun e!119487 () Bool)

(assert (=> b!181422 (= e!119485 e!119487)))

(declare-fun res!85861 () Bool)

(assert (=> b!181422 (=> (not res!85861) (not e!119487))))

(declare-datatypes ((SeekEntryResult!610 0))(
  ( (MissingZero!610 (index!4610 (_ BitVec 32))) (Found!610 (index!4611 (_ BitVec 32))) (Intermediate!610 (undefined!1422 Bool) (index!4612 (_ BitVec 32)) (x!19831 (_ BitVec 32))) (Undefined!610) (MissingVacant!610 (index!4613 (_ BitVec 32))) )
))
(declare-fun lt!89597 () SeekEntryResult!610)

(get-info :version)

(assert (=> b!181422 (= res!85861 (and (not ((_ is Undefined!610) lt!89597)) (not ((_ is MissingVacant!610) lt!89597)) (not ((_ is MissingZero!610) lt!89597)) ((_ is Found!610) lt!89597)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5321 0))(
  ( (V!5322 (val!2172 Int)) )
))
(declare-datatypes ((ValueCell!1784 0))(
  ( (ValueCellFull!1784 (v!4063 V!5321)) (EmptyCell!1784) )
))
(declare-datatypes ((array!7671 0))(
  ( (array!7672 (arr!3628 (Array (_ BitVec 32) (_ BitVec 64))) (size!3939 (_ BitVec 32))) )
))
(declare-datatypes ((array!7673 0))(
  ( (array!7674 (arr!3629 (Array (_ BitVec 32) ValueCell!1784)) (size!3940 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2476 0))(
  ( (LongMapFixedSize!2477 (defaultEntry!3720 Int) (mask!8744 (_ BitVec 32)) (extraKeys!3457 (_ BitVec 32)) (zeroValue!3561 V!5321) (minValue!3561 V!5321) (_size!1287 (_ BitVec 32)) (_keys!5622 array!7671) (_values!3703 array!7673) (_vacant!1287 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2476)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7671 (_ BitVec 32)) SeekEntryResult!610)

(assert (=> b!181422 (= lt!89597 (seekEntryOrOpen!0 key!828 (_keys!5622 thiss!1248) (mask!8744 thiss!1248)))))

(declare-fun b!181423 () Bool)

(declare-fun res!85863 () Bool)

(assert (=> b!181423 (=> (not res!85863) (not e!119487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181423 (= res!85863 (validMask!0 (mask!8744 thiss!1248)))))

(declare-fun res!85860 () Bool)

(assert (=> start!18276 (=> (not res!85860) (not e!119485))))

(declare-fun valid!1047 (LongMapFixedSize!2476) Bool)

(assert (=> start!18276 (= res!85860 (valid!1047 thiss!1248))))

(assert (=> start!18276 e!119485))

(declare-fun e!119488 () Bool)

(assert (=> start!18276 e!119488))

(assert (=> start!18276 true))

(declare-fun b!181424 () Bool)

(declare-fun res!85862 () Bool)

(assert (=> b!181424 (=> (not res!85862) (not e!119485))))

(assert (=> b!181424 (= res!85862 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7296 () Bool)

(declare-fun mapRes!7296 () Bool)

(declare-fun tp!16199 () Bool)

(assert (=> mapNonEmpty!7296 (= mapRes!7296 (and tp!16199 e!119486))))

(declare-fun mapValue!7296 () ValueCell!1784)

(declare-fun mapKey!7296 () (_ BitVec 32))

(declare-fun mapRest!7296 () (Array (_ BitVec 32) ValueCell!1784))

(assert (=> mapNonEmpty!7296 (= (arr!3629 (_values!3703 thiss!1248)) (store mapRest!7296 mapKey!7296 mapValue!7296))))

(declare-fun mapIsEmpty!7296 () Bool)

(assert (=> mapIsEmpty!7296 mapRes!7296))

(declare-fun b!181425 () Bool)

(declare-fun e!119489 () Bool)

(declare-fun e!119483 () Bool)

(assert (=> b!181425 (= e!119489 (and e!119483 mapRes!7296))))

(declare-fun condMapEmpty!7296 () Bool)

(declare-fun mapDefault!7296 () ValueCell!1784)

(assert (=> b!181425 (= condMapEmpty!7296 (= (arr!3629 (_values!3703 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1784)) mapDefault!7296)))))

(declare-fun array_inv!2347 (array!7671) Bool)

(declare-fun array_inv!2348 (array!7673) Bool)

(assert (=> b!181426 (= e!119488 (and tp!16200 tp_is_empty!4255 (array_inv!2347 (_keys!5622 thiss!1248)) (array_inv!2348 (_values!3703 thiss!1248)) e!119489))))

(declare-fun b!181427 () Bool)

(assert (=> b!181427 (= e!119483 tp_is_empty!4255)))

(declare-fun b!181428 () Bool)

(assert (=> b!181428 (= e!119487 (and (= (size!3940 (_values!3703 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8744 thiss!1248))) (= (size!3939 (_keys!5622 thiss!1248)) (size!3940 (_values!3703 thiss!1248))) (bvsge (mask!8744 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3457 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!181429 () Bool)

(declare-fun res!85859 () Bool)

(assert (=> b!181429 (=> (not res!85859) (not e!119487))))

(declare-datatypes ((tuple2!3362 0))(
  ( (tuple2!3363 (_1!1692 (_ BitVec 64)) (_2!1692 V!5321)) )
))
(declare-datatypes ((List!2306 0))(
  ( (Nil!2303) (Cons!2302 (h!2929 tuple2!3362) (t!7153 List!2306)) )
))
(declare-datatypes ((ListLongMap!2271 0))(
  ( (ListLongMap!2272 (toList!1151 List!2306)) )
))
(declare-fun contains!1237 (ListLongMap!2271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!784 (array!7671 array!7673 (_ BitVec 32) (_ BitVec 32) V!5321 V!5321 (_ BitVec 32) Int) ListLongMap!2271)

(assert (=> b!181429 (= res!85859 (contains!1237 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)) key!828))))

(assert (= (and start!18276 res!85860) b!181424))

(assert (= (and b!181424 res!85862) b!181422))

(assert (= (and b!181422 res!85861) b!181429))

(assert (= (and b!181429 res!85859) b!181423))

(assert (= (and b!181423 res!85863) b!181428))

(assert (= (and b!181425 condMapEmpty!7296) mapIsEmpty!7296))

(assert (= (and b!181425 (not condMapEmpty!7296)) mapNonEmpty!7296))

(assert (= (and mapNonEmpty!7296 ((_ is ValueCellFull!1784) mapValue!7296)) b!181421))

(assert (= (and b!181425 ((_ is ValueCellFull!1784) mapDefault!7296)) b!181427))

(assert (= b!181426 b!181425))

(assert (= start!18276 b!181426))

(declare-fun m!208833 () Bool)

(assert (=> b!181426 m!208833))

(declare-fun m!208835 () Bool)

(assert (=> b!181426 m!208835))

(declare-fun m!208837 () Bool)

(assert (=> mapNonEmpty!7296 m!208837))

(declare-fun m!208839 () Bool)

(assert (=> b!181422 m!208839))

(declare-fun m!208841 () Bool)

(assert (=> b!181429 m!208841))

(assert (=> b!181429 m!208841))

(declare-fun m!208843 () Bool)

(assert (=> b!181429 m!208843))

(declare-fun m!208845 () Bool)

(assert (=> start!18276 m!208845))

(declare-fun m!208847 () Bool)

(assert (=> b!181423 m!208847))

(check-sat (not b_next!4483) (not b!181422) (not start!18276) tp_is_empty!4255 b_and!11007 (not mapNonEmpty!7296) (not b!181423) (not b!181429) (not b!181426))
(check-sat b_and!11007 (not b_next!4483))
(get-model)

(declare-fun d!54297 () Bool)

(declare-fun e!119536 () Bool)

(assert (=> d!54297 e!119536))

(declare-fun res!85896 () Bool)

(assert (=> d!54297 (=> res!85896 e!119536)))

(declare-fun lt!89613 () Bool)

(assert (=> d!54297 (= res!85896 (not lt!89613))))

(declare-fun lt!89614 () Bool)

(assert (=> d!54297 (= lt!89613 lt!89614)))

(declare-datatypes ((Unit!5487 0))(
  ( (Unit!5488) )
))
(declare-fun lt!89612 () Unit!5487)

(declare-fun e!119537 () Unit!5487)

(assert (=> d!54297 (= lt!89612 e!119537)))

(declare-fun c!32519 () Bool)

(assert (=> d!54297 (= c!32519 lt!89614)))

(declare-fun containsKey!212 (List!2306 (_ BitVec 64)) Bool)

(assert (=> d!54297 (= lt!89614 (containsKey!212 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))

(assert (=> d!54297 (= (contains!1237 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)) key!828) lt!89613)))

(declare-fun b!181490 () Bool)

(declare-fun lt!89615 () Unit!5487)

(assert (=> b!181490 (= e!119537 lt!89615)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!161 (List!2306 (_ BitVec 64)) Unit!5487)

(assert (=> b!181490 (= lt!89615 (lemmaContainsKeyImpliesGetValueByKeyDefined!161 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))

(declare-datatypes ((Option!214 0))(
  ( (Some!213 (v!4066 V!5321)) (None!212) )
))
(declare-fun isDefined!162 (Option!214) Bool)

(declare-fun getValueByKey!208 (List!2306 (_ BitVec 64)) Option!214)

(assert (=> b!181490 (isDefined!162 (getValueByKey!208 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))

(declare-fun b!181491 () Bool)

(declare-fun Unit!5489 () Unit!5487)

(assert (=> b!181491 (= e!119537 Unit!5489)))

(declare-fun b!181492 () Bool)

(assert (=> b!181492 (= e!119536 (isDefined!162 (getValueByKey!208 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828)))))

(assert (= (and d!54297 c!32519) b!181490))

(assert (= (and d!54297 (not c!32519)) b!181491))

(assert (= (and d!54297 (not res!85896)) b!181492))

(declare-fun m!208881 () Bool)

(assert (=> d!54297 m!208881))

(declare-fun m!208883 () Bool)

(assert (=> b!181490 m!208883))

(declare-fun m!208885 () Bool)

(assert (=> b!181490 m!208885))

(assert (=> b!181490 m!208885))

(declare-fun m!208887 () Bool)

(assert (=> b!181490 m!208887))

(assert (=> b!181492 m!208885))

(assert (=> b!181492 m!208885))

(assert (=> b!181492 m!208887))

(assert (=> b!181429 d!54297))

(declare-fun bm!18331 () Bool)

(declare-fun call!18338 () ListLongMap!2271)

(declare-fun call!18335 () ListLongMap!2271)

(assert (=> bm!18331 (= call!18338 call!18335)))

(declare-fun b!181535 () Bool)

(declare-fun e!119576 () Bool)

(declare-fun e!119573 () Bool)

(assert (=> b!181535 (= e!119576 e!119573)))

(declare-fun res!85919 () Bool)

(declare-fun call!18337 () Bool)

(assert (=> b!181535 (= res!85919 call!18337)))

(assert (=> b!181535 (=> (not res!85919) (not e!119573))))

(declare-fun b!181536 () Bool)

(declare-fun lt!89678 () ListLongMap!2271)

(declare-fun apply!153 (ListLongMap!2271 (_ BitVec 64)) V!5321)

(assert (=> b!181536 (= e!119573 (= (apply!153 lt!89678 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3561 thiss!1248)))))

(declare-fun b!181537 () Bool)

(declare-fun e!119564 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!181537 (= e!119564 (validKeyInArray!0 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18332 () Bool)

(declare-fun call!18339 () ListLongMap!2271)

(assert (=> bm!18332 (= call!18339 call!18338)))

(declare-fun b!181538 () Bool)

(assert (=> b!181538 (= e!119576 (not call!18337))))

(declare-fun bm!18333 () Bool)

(declare-fun c!32533 () Bool)

(declare-fun c!32535 () Bool)

(declare-fun call!18340 () ListLongMap!2271)

(declare-fun +!270 (ListLongMap!2271 tuple2!3362) ListLongMap!2271)

(assert (=> bm!18333 (= call!18340 (+!270 (ite c!32535 call!18335 (ite c!32533 call!18338 call!18339)) (ite (or c!32535 c!32533) (tuple2!3363 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))

(declare-fun d!54299 () Bool)

(declare-fun e!119569 () Bool)

(assert (=> d!54299 e!119569))

(declare-fun res!85921 () Bool)

(assert (=> d!54299 (=> (not res!85921) (not e!119569))))

(assert (=> d!54299 (= res!85921 (or (bvsge #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))))))))

(declare-fun lt!89675 () ListLongMap!2271)

(assert (=> d!54299 (= lt!89678 lt!89675)))

(declare-fun lt!89663 () Unit!5487)

(declare-fun e!119570 () Unit!5487)

(assert (=> d!54299 (= lt!89663 e!119570)))

(declare-fun c!32537 () Bool)

(assert (=> d!54299 (= c!32537 e!119564)))

(declare-fun res!85922 () Bool)

(assert (=> d!54299 (=> (not res!85922) (not e!119564))))

(assert (=> d!54299 (= res!85922 (bvslt #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))))))

(declare-fun e!119565 () ListLongMap!2271)

(assert (=> d!54299 (= lt!89675 e!119565)))

(assert (=> d!54299 (= c!32535 (and (not (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54299 (validMask!0 (mask!8744 thiss!1248))))

(assert (=> d!54299 (= (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)) lt!89678)))

(declare-fun b!181539 () Bool)

(declare-fun e!119575 () ListLongMap!2271)

(assert (=> b!181539 (= e!119575 call!18339)))

(declare-fun b!181540 () Bool)

(declare-fun e!119568 () ListLongMap!2271)

(declare-fun call!18336 () ListLongMap!2271)

(assert (=> b!181540 (= e!119568 call!18336)))

(declare-fun b!181541 () Bool)

(declare-fun Unit!5490 () Unit!5487)

(assert (=> b!181541 (= e!119570 Unit!5490)))

(declare-fun bm!18334 () Bool)

(assert (=> bm!18334 (= call!18337 (contains!1237 lt!89678 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181542 () Bool)

(assert (=> b!181542 (= e!119565 (+!270 call!18340 (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))

(declare-fun b!181543 () Bool)

(declare-fun e!119566 () Bool)

(declare-fun e!119574 () Bool)

(assert (=> b!181543 (= e!119566 e!119574)))

(declare-fun res!85916 () Bool)

(assert (=> b!181543 (=> (not res!85916) (not e!119574))))

(assert (=> b!181543 (= res!85916 (contains!1237 lt!89678 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))))))

(declare-fun b!181544 () Bool)

(declare-fun e!119571 () Bool)

(declare-fun e!119567 () Bool)

(assert (=> b!181544 (= e!119571 e!119567)))

(declare-fun res!85920 () Bool)

(declare-fun call!18334 () Bool)

(assert (=> b!181544 (= res!85920 call!18334)))

(assert (=> b!181544 (=> (not res!85920) (not e!119567))))

(declare-fun b!181545 () Bool)

(assert (=> b!181545 (= e!119569 e!119571)))

(declare-fun c!32536 () Bool)

(assert (=> b!181545 (= c!32536 (not (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!181546 () Bool)

(declare-fun get!2076 (ValueCell!1784 V!5321) V!5321)

(declare-fun dynLambda!487 (Int (_ BitVec 64)) V!5321)

(assert (=> b!181546 (= e!119574 (= (apply!153 lt!89678 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)) (get!2076 (select (arr!3629 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181546 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3940 (_values!3703 thiss!1248))))))

(assert (=> b!181546 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))))))

(declare-fun b!181547 () Bool)

(assert (=> b!181547 (= e!119575 call!18336)))

(declare-fun b!181548 () Bool)

(assert (=> b!181548 (= e!119567 (= (apply!153 lt!89678 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3561 thiss!1248)))))

(declare-fun bm!18335 () Bool)

(assert (=> bm!18335 (= call!18336 call!18340)))

(declare-fun b!181549 () Bool)

(declare-fun res!85917 () Bool)

(assert (=> b!181549 (=> (not res!85917) (not e!119569))))

(assert (=> b!181549 (= res!85917 e!119566)))

(declare-fun res!85915 () Bool)

(assert (=> b!181549 (=> res!85915 e!119566)))

(declare-fun e!119572 () Bool)

(assert (=> b!181549 (= res!85915 (not e!119572))))

(declare-fun res!85923 () Bool)

(assert (=> b!181549 (=> (not res!85923) (not e!119572))))

(assert (=> b!181549 (= res!85923 (bvslt #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))))))

(declare-fun b!181550 () Bool)

(declare-fun c!32534 () Bool)

(assert (=> b!181550 (= c!32534 (and (not (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!181550 (= e!119568 e!119575)))

(declare-fun bm!18336 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!174 (array!7671 array!7673 (_ BitVec 32) (_ BitVec 32) V!5321 V!5321 (_ BitVec 32) Int) ListLongMap!2271)

(assert (=> bm!18336 (= call!18335 (getCurrentListMapNoExtraKeys!174 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))

(declare-fun b!181551 () Bool)

(declare-fun lt!89671 () Unit!5487)

(assert (=> b!181551 (= e!119570 lt!89671)))

(declare-fun lt!89679 () ListLongMap!2271)

(assert (=> b!181551 (= lt!89679 (getCurrentListMapNoExtraKeys!174 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))

(declare-fun lt!89672 () (_ BitVec 64))

(assert (=> b!181551 (= lt!89672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89674 () (_ BitVec 64))

(assert (=> b!181551 (= lt!89674 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89668 () Unit!5487)

(declare-fun addStillContains!129 (ListLongMap!2271 (_ BitVec 64) V!5321 (_ BitVec 64)) Unit!5487)

(assert (=> b!181551 (= lt!89668 (addStillContains!129 lt!89679 lt!89672 (zeroValue!3561 thiss!1248) lt!89674))))

(assert (=> b!181551 (contains!1237 (+!270 lt!89679 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248))) lt!89674)))

(declare-fun lt!89676 () Unit!5487)

(assert (=> b!181551 (= lt!89676 lt!89668)))

(declare-fun lt!89669 () ListLongMap!2271)

(assert (=> b!181551 (= lt!89669 (getCurrentListMapNoExtraKeys!174 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))

(declare-fun lt!89661 () (_ BitVec 64))

(assert (=> b!181551 (= lt!89661 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89670 () (_ BitVec 64))

(assert (=> b!181551 (= lt!89670 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89680 () Unit!5487)

(declare-fun addApplyDifferent!129 (ListLongMap!2271 (_ BitVec 64) V!5321 (_ BitVec 64)) Unit!5487)

(assert (=> b!181551 (= lt!89680 (addApplyDifferent!129 lt!89669 lt!89661 (minValue!3561 thiss!1248) lt!89670))))

(assert (=> b!181551 (= (apply!153 (+!270 lt!89669 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248))) lt!89670) (apply!153 lt!89669 lt!89670))))

(declare-fun lt!89673 () Unit!5487)

(assert (=> b!181551 (= lt!89673 lt!89680)))

(declare-fun lt!89681 () ListLongMap!2271)

(assert (=> b!181551 (= lt!89681 (getCurrentListMapNoExtraKeys!174 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))

(declare-fun lt!89665 () (_ BitVec 64))

(assert (=> b!181551 (= lt!89665 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89677 () (_ BitVec 64))

(assert (=> b!181551 (= lt!89677 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89666 () Unit!5487)

(assert (=> b!181551 (= lt!89666 (addApplyDifferent!129 lt!89681 lt!89665 (zeroValue!3561 thiss!1248) lt!89677))))

(assert (=> b!181551 (= (apply!153 (+!270 lt!89681 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248))) lt!89677) (apply!153 lt!89681 lt!89677))))

(declare-fun lt!89660 () Unit!5487)

(assert (=> b!181551 (= lt!89660 lt!89666)))

(declare-fun lt!89662 () ListLongMap!2271)

(assert (=> b!181551 (= lt!89662 (getCurrentListMapNoExtraKeys!174 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))

(declare-fun lt!89664 () (_ BitVec 64))

(assert (=> b!181551 (= lt!89664 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89667 () (_ BitVec 64))

(assert (=> b!181551 (= lt!89667 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181551 (= lt!89671 (addApplyDifferent!129 lt!89662 lt!89664 (minValue!3561 thiss!1248) lt!89667))))

(assert (=> b!181551 (= (apply!153 (+!270 lt!89662 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248))) lt!89667) (apply!153 lt!89662 lt!89667))))

(declare-fun bm!18337 () Bool)

(assert (=> bm!18337 (= call!18334 (contains!1237 lt!89678 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181552 () Bool)

(assert (=> b!181552 (= e!119565 e!119568)))

(assert (=> b!181552 (= c!32533 (and (not (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!181553 () Bool)

(assert (=> b!181553 (= e!119572 (validKeyInArray!0 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181554 () Bool)

(assert (=> b!181554 (= e!119571 (not call!18334))))

(declare-fun b!181555 () Bool)

(declare-fun res!85918 () Bool)

(assert (=> b!181555 (=> (not res!85918) (not e!119569))))

(assert (=> b!181555 (= res!85918 e!119576)))

(declare-fun c!32532 () Bool)

(assert (=> b!181555 (= c!32532 (not (= (bvand (extraKeys!3457 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!54299 c!32535) b!181542))

(assert (= (and d!54299 (not c!32535)) b!181552))

(assert (= (and b!181552 c!32533) b!181540))

(assert (= (and b!181552 (not c!32533)) b!181550))

(assert (= (and b!181550 c!32534) b!181547))

(assert (= (and b!181550 (not c!32534)) b!181539))

(assert (= (or b!181547 b!181539) bm!18332))

(assert (= (or b!181540 bm!18332) bm!18331))

(assert (= (or b!181540 b!181547) bm!18335))

(assert (= (or b!181542 bm!18331) bm!18336))

(assert (= (or b!181542 bm!18335) bm!18333))

(assert (= (and d!54299 res!85922) b!181537))

(assert (= (and d!54299 c!32537) b!181551))

(assert (= (and d!54299 (not c!32537)) b!181541))

(assert (= (and d!54299 res!85921) b!181549))

(assert (= (and b!181549 res!85923) b!181553))

(assert (= (and b!181549 (not res!85915)) b!181543))

(assert (= (and b!181543 res!85916) b!181546))

(assert (= (and b!181549 res!85917) b!181555))

(assert (= (and b!181555 c!32532) b!181535))

(assert (= (and b!181555 (not c!32532)) b!181538))

(assert (= (and b!181535 res!85919) b!181536))

(assert (= (or b!181535 b!181538) bm!18334))

(assert (= (and b!181555 res!85918) b!181545))

(assert (= (and b!181545 c!32536) b!181544))

(assert (= (and b!181545 (not c!32536)) b!181554))

(assert (= (and b!181544 res!85920) b!181548))

(assert (= (or b!181544 b!181554) bm!18337))

(declare-fun b_lambda!7133 () Bool)

(assert (=> (not b_lambda!7133) (not b!181546)))

(declare-fun t!7155 () Bool)

(declare-fun tb!2809 () Bool)

(assert (=> (and b!181426 (= (defaultEntry!3720 thiss!1248) (defaultEntry!3720 thiss!1248)) t!7155) tb!2809))

(declare-fun result!4721 () Bool)

(assert (=> tb!2809 (= result!4721 tp_is_empty!4255)))

(assert (=> b!181546 t!7155))

(declare-fun b_and!11013 () Bool)

(assert (= b_and!11007 (and (=> t!7155 result!4721) b_and!11013)))

(declare-fun m!208889 () Bool)

(assert (=> b!181546 m!208889))

(declare-fun m!208891 () Bool)

(assert (=> b!181546 m!208891))

(declare-fun m!208893 () Bool)

(assert (=> b!181546 m!208893))

(declare-fun m!208895 () Bool)

(assert (=> b!181546 m!208895))

(assert (=> b!181546 m!208895))

(declare-fun m!208897 () Bool)

(assert (=> b!181546 m!208897))

(assert (=> b!181546 m!208889))

(assert (=> b!181546 m!208891))

(declare-fun m!208899 () Bool)

(assert (=> bm!18336 m!208899))

(declare-fun m!208901 () Bool)

(assert (=> b!181542 m!208901))

(declare-fun m!208903 () Bool)

(assert (=> bm!18333 m!208903))

(declare-fun m!208905 () Bool)

(assert (=> bm!18334 m!208905))

(declare-fun m!208907 () Bool)

(assert (=> bm!18337 m!208907))

(assert (=> b!181553 m!208895))

(assert (=> b!181553 m!208895))

(declare-fun m!208909 () Bool)

(assert (=> b!181553 m!208909))

(declare-fun m!208911 () Bool)

(assert (=> b!181536 m!208911))

(assert (=> b!181537 m!208895))

(assert (=> b!181537 m!208895))

(assert (=> b!181537 m!208909))

(declare-fun m!208913 () Bool)

(assert (=> b!181551 m!208913))

(declare-fun m!208915 () Bool)

(assert (=> b!181551 m!208915))

(declare-fun m!208917 () Bool)

(assert (=> b!181551 m!208917))

(declare-fun m!208919 () Bool)

(assert (=> b!181551 m!208919))

(declare-fun m!208921 () Bool)

(assert (=> b!181551 m!208921))

(declare-fun m!208923 () Bool)

(assert (=> b!181551 m!208923))

(declare-fun m!208925 () Bool)

(assert (=> b!181551 m!208925))

(declare-fun m!208927 () Bool)

(assert (=> b!181551 m!208927))

(declare-fun m!208929 () Bool)

(assert (=> b!181551 m!208929))

(assert (=> b!181551 m!208927))

(declare-fun m!208931 () Bool)

(assert (=> b!181551 m!208931))

(declare-fun m!208933 () Bool)

(assert (=> b!181551 m!208933))

(assert (=> b!181551 m!208931))

(declare-fun m!208935 () Bool)

(assert (=> b!181551 m!208935))

(assert (=> b!181551 m!208923))

(declare-fun m!208937 () Bool)

(assert (=> b!181551 m!208937))

(assert (=> b!181551 m!208895))

(assert (=> b!181551 m!208917))

(declare-fun m!208939 () Bool)

(assert (=> b!181551 m!208939))

(assert (=> b!181551 m!208899))

(declare-fun m!208941 () Bool)

(assert (=> b!181551 m!208941))

(assert (=> d!54299 m!208847))

(declare-fun m!208943 () Bool)

(assert (=> b!181548 m!208943))

(assert (=> b!181543 m!208895))

(assert (=> b!181543 m!208895))

(declare-fun m!208945 () Bool)

(assert (=> b!181543 m!208945))

(assert (=> b!181429 d!54299))

(declare-fun d!54301 () Bool)

(assert (=> d!54301 (= (array_inv!2347 (_keys!5622 thiss!1248)) (bvsge (size!3939 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181426 d!54301))

(declare-fun d!54303 () Bool)

(assert (=> d!54303 (= (array_inv!2348 (_values!3703 thiss!1248)) (bvsge (size!3940 (_values!3703 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181426 d!54303))

(declare-fun b!181570 () Bool)

(declare-fun e!119585 () SeekEntryResult!610)

(declare-fun lt!89690 () SeekEntryResult!610)

(assert (=> b!181570 (= e!119585 (MissingZero!610 (index!4612 lt!89690)))))

(declare-fun b!181571 () Bool)

(declare-fun c!32546 () Bool)

(declare-fun lt!89689 () (_ BitVec 64))

(assert (=> b!181571 (= c!32546 (= lt!89689 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119583 () SeekEntryResult!610)

(assert (=> b!181571 (= e!119583 e!119585)))

(declare-fun d!54305 () Bool)

(declare-fun lt!89688 () SeekEntryResult!610)

(assert (=> d!54305 (and (or ((_ is Undefined!610) lt!89688) (not ((_ is Found!610) lt!89688)) (and (bvsge (index!4611 lt!89688) #b00000000000000000000000000000000) (bvslt (index!4611 lt!89688) (size!3939 (_keys!5622 thiss!1248))))) (or ((_ is Undefined!610) lt!89688) ((_ is Found!610) lt!89688) (not ((_ is MissingZero!610) lt!89688)) (and (bvsge (index!4610 lt!89688) #b00000000000000000000000000000000) (bvslt (index!4610 lt!89688) (size!3939 (_keys!5622 thiss!1248))))) (or ((_ is Undefined!610) lt!89688) ((_ is Found!610) lt!89688) ((_ is MissingZero!610) lt!89688) (not ((_ is MissingVacant!610) lt!89688)) (and (bvsge (index!4613 lt!89688) #b00000000000000000000000000000000) (bvslt (index!4613 lt!89688) (size!3939 (_keys!5622 thiss!1248))))) (or ((_ is Undefined!610) lt!89688) (ite ((_ is Found!610) lt!89688) (= (select (arr!3628 (_keys!5622 thiss!1248)) (index!4611 lt!89688)) key!828) (ite ((_ is MissingZero!610) lt!89688) (= (select (arr!3628 (_keys!5622 thiss!1248)) (index!4610 lt!89688)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!610) lt!89688) (= (select (arr!3628 (_keys!5622 thiss!1248)) (index!4613 lt!89688)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!119584 () SeekEntryResult!610)

(assert (=> d!54305 (= lt!89688 e!119584)))

(declare-fun c!32544 () Bool)

(assert (=> d!54305 (= c!32544 (and ((_ is Intermediate!610) lt!89690) (undefined!1422 lt!89690)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7671 (_ BitVec 32)) SeekEntryResult!610)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54305 (= lt!89690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8744 thiss!1248)) key!828 (_keys!5622 thiss!1248) (mask!8744 thiss!1248)))))

(assert (=> d!54305 (validMask!0 (mask!8744 thiss!1248))))

(assert (=> d!54305 (= (seekEntryOrOpen!0 key!828 (_keys!5622 thiss!1248) (mask!8744 thiss!1248)) lt!89688)))

(declare-fun b!181572 () Bool)

(assert (=> b!181572 (= e!119584 Undefined!610)))

(declare-fun b!181573 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7671 (_ BitVec 32)) SeekEntryResult!610)

(assert (=> b!181573 (= e!119585 (seekKeyOrZeroReturnVacant!0 (x!19831 lt!89690) (index!4612 lt!89690) (index!4612 lt!89690) key!828 (_keys!5622 thiss!1248) (mask!8744 thiss!1248)))))

(declare-fun b!181574 () Bool)

(assert (=> b!181574 (= e!119584 e!119583)))

(assert (=> b!181574 (= lt!89689 (select (arr!3628 (_keys!5622 thiss!1248)) (index!4612 lt!89690)))))

(declare-fun c!32545 () Bool)

(assert (=> b!181574 (= c!32545 (= lt!89689 key!828))))

(declare-fun b!181575 () Bool)

(assert (=> b!181575 (= e!119583 (Found!610 (index!4612 lt!89690)))))

(assert (= (and d!54305 c!32544) b!181572))

(assert (= (and d!54305 (not c!32544)) b!181574))

(assert (= (and b!181574 c!32545) b!181575))

(assert (= (and b!181574 (not c!32545)) b!181571))

(assert (= (and b!181571 c!32546) b!181570))

(assert (= (and b!181571 (not c!32546)) b!181573))

(assert (=> d!54305 m!208847))

(declare-fun m!208947 () Bool)

(assert (=> d!54305 m!208947))

(declare-fun m!208949 () Bool)

(assert (=> d!54305 m!208949))

(declare-fun m!208951 () Bool)

(assert (=> d!54305 m!208951))

(declare-fun m!208953 () Bool)

(assert (=> d!54305 m!208953))

(assert (=> d!54305 m!208951))

(declare-fun m!208955 () Bool)

(assert (=> d!54305 m!208955))

(declare-fun m!208957 () Bool)

(assert (=> b!181573 m!208957))

(declare-fun m!208959 () Bool)

(assert (=> b!181574 m!208959))

(assert (=> b!181422 d!54305))

(declare-fun d!54307 () Bool)

(declare-fun res!85930 () Bool)

(declare-fun e!119588 () Bool)

(assert (=> d!54307 (=> (not res!85930) (not e!119588))))

(declare-fun simpleValid!169 (LongMapFixedSize!2476) Bool)

(assert (=> d!54307 (= res!85930 (simpleValid!169 thiss!1248))))

(assert (=> d!54307 (= (valid!1047 thiss!1248) e!119588)))

(declare-fun b!181582 () Bool)

(declare-fun res!85931 () Bool)

(assert (=> b!181582 (=> (not res!85931) (not e!119588))))

(declare-fun arrayCountValidKeys!0 (array!7671 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181582 (= res!85931 (= (arrayCountValidKeys!0 (_keys!5622 thiss!1248) #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))) (_size!1287 thiss!1248)))))

(declare-fun b!181583 () Bool)

(declare-fun res!85932 () Bool)

(assert (=> b!181583 (=> (not res!85932) (not e!119588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7671 (_ BitVec 32)) Bool)

(assert (=> b!181583 (= res!85932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5622 thiss!1248) (mask!8744 thiss!1248)))))

(declare-fun b!181584 () Bool)

(declare-datatypes ((List!2307 0))(
  ( (Nil!2304) (Cons!2303 (h!2930 (_ BitVec 64)) (t!7156 List!2307)) )
))
(declare-fun arrayNoDuplicates!0 (array!7671 (_ BitVec 32) List!2307) Bool)

(assert (=> b!181584 (= e!119588 (arrayNoDuplicates!0 (_keys!5622 thiss!1248) #b00000000000000000000000000000000 Nil!2304))))

(assert (= (and d!54307 res!85930) b!181582))

(assert (= (and b!181582 res!85931) b!181583))

(assert (= (and b!181583 res!85932) b!181584))

(declare-fun m!208961 () Bool)

(assert (=> d!54307 m!208961))

(declare-fun m!208963 () Bool)

(assert (=> b!181582 m!208963))

(declare-fun m!208965 () Bool)

(assert (=> b!181583 m!208965))

(declare-fun m!208967 () Bool)

(assert (=> b!181584 m!208967))

(assert (=> start!18276 d!54307))

(declare-fun d!54309 () Bool)

(assert (=> d!54309 (= (validMask!0 (mask!8744 thiss!1248)) (and (or (= (mask!8744 thiss!1248) #b00000000000000000000000000000111) (= (mask!8744 thiss!1248) #b00000000000000000000000000001111) (= (mask!8744 thiss!1248) #b00000000000000000000000000011111) (= (mask!8744 thiss!1248) #b00000000000000000000000000111111) (= (mask!8744 thiss!1248) #b00000000000000000000000001111111) (= (mask!8744 thiss!1248) #b00000000000000000000000011111111) (= (mask!8744 thiss!1248) #b00000000000000000000000111111111) (= (mask!8744 thiss!1248) #b00000000000000000000001111111111) (= (mask!8744 thiss!1248) #b00000000000000000000011111111111) (= (mask!8744 thiss!1248) #b00000000000000000000111111111111) (= (mask!8744 thiss!1248) #b00000000000000000001111111111111) (= (mask!8744 thiss!1248) #b00000000000000000011111111111111) (= (mask!8744 thiss!1248) #b00000000000000000111111111111111) (= (mask!8744 thiss!1248) #b00000000000000001111111111111111) (= (mask!8744 thiss!1248) #b00000000000000011111111111111111) (= (mask!8744 thiss!1248) #b00000000000000111111111111111111) (= (mask!8744 thiss!1248) #b00000000000001111111111111111111) (= (mask!8744 thiss!1248) #b00000000000011111111111111111111) (= (mask!8744 thiss!1248) #b00000000000111111111111111111111) (= (mask!8744 thiss!1248) #b00000000001111111111111111111111) (= (mask!8744 thiss!1248) #b00000000011111111111111111111111) (= (mask!8744 thiss!1248) #b00000000111111111111111111111111) (= (mask!8744 thiss!1248) #b00000001111111111111111111111111) (= (mask!8744 thiss!1248) #b00000011111111111111111111111111) (= (mask!8744 thiss!1248) #b00000111111111111111111111111111) (= (mask!8744 thiss!1248) #b00001111111111111111111111111111) (= (mask!8744 thiss!1248) #b00011111111111111111111111111111) (= (mask!8744 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8744 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!181423 d!54309))

(declare-fun mapNonEmpty!7305 () Bool)

(declare-fun mapRes!7305 () Bool)

(declare-fun tp!16215 () Bool)

(declare-fun e!119594 () Bool)

(assert (=> mapNonEmpty!7305 (= mapRes!7305 (and tp!16215 e!119594))))

(declare-fun mapValue!7305 () ValueCell!1784)

(declare-fun mapKey!7305 () (_ BitVec 32))

(declare-fun mapRest!7305 () (Array (_ BitVec 32) ValueCell!1784))

(assert (=> mapNonEmpty!7305 (= mapRest!7296 (store mapRest!7305 mapKey!7305 mapValue!7305))))

(declare-fun mapIsEmpty!7305 () Bool)

(assert (=> mapIsEmpty!7305 mapRes!7305))

(declare-fun b!181591 () Bool)

(assert (=> b!181591 (= e!119594 tp_is_empty!4255)))

(declare-fun b!181592 () Bool)

(declare-fun e!119593 () Bool)

(assert (=> b!181592 (= e!119593 tp_is_empty!4255)))

(declare-fun condMapEmpty!7305 () Bool)

(declare-fun mapDefault!7305 () ValueCell!1784)

(assert (=> mapNonEmpty!7296 (= condMapEmpty!7305 (= mapRest!7296 ((as const (Array (_ BitVec 32) ValueCell!1784)) mapDefault!7305)))))

(assert (=> mapNonEmpty!7296 (= tp!16199 (and e!119593 mapRes!7305))))

(assert (= (and mapNonEmpty!7296 condMapEmpty!7305) mapIsEmpty!7305))

(assert (= (and mapNonEmpty!7296 (not condMapEmpty!7305)) mapNonEmpty!7305))

(assert (= (and mapNonEmpty!7305 ((_ is ValueCellFull!1784) mapValue!7305)) b!181591))

(assert (= (and mapNonEmpty!7296 ((_ is ValueCellFull!1784) mapDefault!7305)) b!181592))

(declare-fun m!208969 () Bool)

(assert (=> mapNonEmpty!7305 m!208969))

(declare-fun b_lambda!7135 () Bool)

(assert (= b_lambda!7133 (or (and b!181426 b_free!4483) b_lambda!7135)))

(check-sat (not b_next!4483) (not b!181582) (not b!181542) (not b!181546) (not b!181548) (not mapNonEmpty!7305) (not b!181573) (not bm!18333) (not b!181583) (not b_lambda!7135) (not b!181551) (not bm!18337) (not b!181537) (not b!181553) (not b!181490) (not b!181492) (not b!181536) (not d!54299) (not bm!18334) (not bm!18336) (not d!54305) tp_is_empty!4255 b_and!11013 (not b!181543) (not d!54307) (not b!181584) (not d!54297))
(check-sat b_and!11013 (not b_next!4483))
(get-model)

(declare-fun d!54311 () Bool)

(declare-fun e!119597 () Bool)

(assert (=> d!54311 e!119597))

(declare-fun res!85938 () Bool)

(assert (=> d!54311 (=> (not res!85938) (not e!119597))))

(declare-fun lt!89702 () ListLongMap!2271)

(assert (=> d!54311 (= res!85938 (contains!1237 lt!89702 (_1!1692 (ite (or c!32535 c!32533) (tuple2!3363 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))))

(declare-fun lt!89701 () List!2306)

(assert (=> d!54311 (= lt!89702 (ListLongMap!2272 lt!89701))))

(declare-fun lt!89699 () Unit!5487)

(declare-fun lt!89700 () Unit!5487)

(assert (=> d!54311 (= lt!89699 lt!89700)))

(assert (=> d!54311 (= (getValueByKey!208 lt!89701 (_1!1692 (ite (or c!32535 c!32533) (tuple2!3363 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))) (Some!213 (_2!1692 (ite (or c!32535 c!32533) (tuple2!3363 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!112 (List!2306 (_ BitVec 64) V!5321) Unit!5487)

(assert (=> d!54311 (= lt!89700 (lemmaContainsTupThenGetReturnValue!112 lt!89701 (_1!1692 (ite (or c!32535 c!32533) (tuple2!3363 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))) (_2!1692 (ite (or c!32535 c!32533) (tuple2!3363 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))))

(declare-fun insertStrictlySorted!115 (List!2306 (_ BitVec 64) V!5321) List!2306)

(assert (=> d!54311 (= lt!89701 (insertStrictlySorted!115 (toList!1151 (ite c!32535 call!18335 (ite c!32533 call!18338 call!18339))) (_1!1692 (ite (or c!32535 c!32533) (tuple2!3363 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))) (_2!1692 (ite (or c!32535 c!32533) (tuple2!3363 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))))

(assert (=> d!54311 (= (+!270 (ite c!32535 call!18335 (ite c!32533 call!18338 call!18339)) (ite (or c!32535 c!32533) (tuple2!3363 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))) lt!89702)))

(declare-fun b!181597 () Bool)

(declare-fun res!85937 () Bool)

(assert (=> b!181597 (=> (not res!85937) (not e!119597))))

(assert (=> b!181597 (= res!85937 (= (getValueByKey!208 (toList!1151 lt!89702) (_1!1692 (ite (or c!32535 c!32533) (tuple2!3363 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))) (Some!213 (_2!1692 (ite (or c!32535 c!32533) (tuple2!3363 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))))

(declare-fun b!181598 () Bool)

(declare-fun contains!1238 (List!2306 tuple2!3362) Bool)

(assert (=> b!181598 (= e!119597 (contains!1238 (toList!1151 lt!89702) (ite (or c!32535 c!32533) (tuple2!3363 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3561 thiss!1248)) (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))

(assert (= (and d!54311 res!85938) b!181597))

(assert (= (and b!181597 res!85937) b!181598))

(declare-fun m!208971 () Bool)

(assert (=> d!54311 m!208971))

(declare-fun m!208973 () Bool)

(assert (=> d!54311 m!208973))

(declare-fun m!208975 () Bool)

(assert (=> d!54311 m!208975))

(declare-fun m!208977 () Bool)

(assert (=> d!54311 m!208977))

(declare-fun m!208979 () Bool)

(assert (=> b!181597 m!208979))

(declare-fun m!208981 () Bool)

(assert (=> b!181598 m!208981))

(assert (=> bm!18333 d!54311))

(declare-fun d!54313 () Bool)

(assert (=> d!54313 (isDefined!162 (getValueByKey!208 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))

(declare-fun lt!89705 () Unit!5487)

(declare-fun choose!971 (List!2306 (_ BitVec 64)) Unit!5487)

(assert (=> d!54313 (= lt!89705 (choose!971 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))

(declare-fun e!119600 () Bool)

(assert (=> d!54313 e!119600))

(declare-fun res!85941 () Bool)

(assert (=> d!54313 (=> (not res!85941) (not e!119600))))

(declare-fun isStrictlySorted!338 (List!2306) Bool)

(assert (=> d!54313 (= res!85941 (isStrictlySorted!338 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))))

(assert (=> d!54313 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!161 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828) lt!89705)))

(declare-fun b!181601 () Bool)

(assert (=> b!181601 (= e!119600 (containsKey!212 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))

(assert (= (and d!54313 res!85941) b!181601))

(assert (=> d!54313 m!208885))

(assert (=> d!54313 m!208885))

(assert (=> d!54313 m!208887))

(declare-fun m!208983 () Bool)

(assert (=> d!54313 m!208983))

(declare-fun m!208985 () Bool)

(assert (=> d!54313 m!208985))

(assert (=> b!181601 m!208881))

(assert (=> b!181490 d!54313))

(declare-fun d!54315 () Bool)

(declare-fun isEmpty!463 (Option!214) Bool)

(assert (=> d!54315 (= (isDefined!162 (getValueByKey!208 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828)) (not (isEmpty!463 (getValueByKey!208 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828))))))

(declare-fun bs!7386 () Bool)

(assert (= bs!7386 d!54315))

(assert (=> bs!7386 m!208885))

(declare-fun m!208987 () Bool)

(assert (=> bs!7386 m!208987))

(assert (=> b!181490 d!54315))

(declare-fun b!181610 () Bool)

(declare-fun e!119605 () Option!214)

(assert (=> b!181610 (= e!119605 (Some!213 (_2!1692 (h!2929 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))))))))

(declare-fun b!181613 () Bool)

(declare-fun e!119606 () Option!214)

(assert (=> b!181613 (= e!119606 None!212)))

(declare-fun d!54317 () Bool)

(declare-fun c!32551 () Bool)

(assert (=> d!54317 (= c!32551 (and ((_ is Cons!2302) (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))) (= (_1!1692 (h!2929 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))))) key!828)))))

(assert (=> d!54317 (= (getValueByKey!208 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828) e!119605)))

(declare-fun b!181611 () Bool)

(assert (=> b!181611 (= e!119605 e!119606)))

(declare-fun c!32552 () Bool)

(assert (=> b!181611 (= c!32552 (and ((_ is Cons!2302) (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))) (not (= (_1!1692 (h!2929 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))))) key!828))))))

(declare-fun b!181612 () Bool)

(assert (=> b!181612 (= e!119606 (getValueByKey!208 (t!7153 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))) key!828))))

(assert (= (and d!54317 c!32551) b!181610))

(assert (= (and d!54317 (not c!32551)) b!181611))

(assert (= (and b!181611 c!32552) b!181612))

(assert (= (and b!181611 (not c!32552)) b!181613))

(declare-fun m!208989 () Bool)

(assert (=> b!181612 m!208989))

(assert (=> b!181490 d!54317))

(assert (=> d!54299 d!54309))

(declare-fun b!181632 () Bool)

(declare-fun e!119617 () Bool)

(declare-fun e!119620 () Bool)

(assert (=> b!181632 (= e!119617 e!119620)))

(declare-fun res!85950 () Bool)

(declare-fun lt!89711 () SeekEntryResult!610)

(assert (=> b!181632 (= res!85950 (and ((_ is Intermediate!610) lt!89711) (not (undefined!1422 lt!89711)) (bvslt (x!19831 lt!89711) #b01111111111111111111111111111110) (bvsge (x!19831 lt!89711) #b00000000000000000000000000000000) (bvsge (x!19831 lt!89711) #b00000000000000000000000000000000)))))

(assert (=> b!181632 (=> (not res!85950) (not e!119620))))

(declare-fun d!54319 () Bool)

(assert (=> d!54319 e!119617))

(declare-fun c!32559 () Bool)

(assert (=> d!54319 (= c!32559 (and ((_ is Intermediate!610) lt!89711) (undefined!1422 lt!89711)))))

(declare-fun e!119618 () SeekEntryResult!610)

(assert (=> d!54319 (= lt!89711 e!119618)))

(declare-fun c!32560 () Bool)

(assert (=> d!54319 (= c!32560 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!89710 () (_ BitVec 64))

(assert (=> d!54319 (= lt!89710 (select (arr!3628 (_keys!5622 thiss!1248)) (toIndex!0 key!828 (mask!8744 thiss!1248))))))

(assert (=> d!54319 (validMask!0 (mask!8744 thiss!1248))))

(assert (=> d!54319 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8744 thiss!1248)) key!828 (_keys!5622 thiss!1248) (mask!8744 thiss!1248)) lt!89711)))

(declare-fun b!181633 () Bool)

(declare-fun e!119619 () SeekEntryResult!610)

(assert (=> b!181633 (= e!119619 (Intermediate!610 false (toIndex!0 key!828 (mask!8744 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!181634 () Bool)

(assert (=> b!181634 (= e!119618 (Intermediate!610 true (toIndex!0 key!828 (mask!8744 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!181635 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181635 (= e!119619 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8744 thiss!1248)) #b00000000000000000000000000000000 (mask!8744 thiss!1248)) key!828 (_keys!5622 thiss!1248) (mask!8744 thiss!1248)))))

(declare-fun b!181636 () Bool)

(assert (=> b!181636 (and (bvsge (index!4612 lt!89711) #b00000000000000000000000000000000) (bvslt (index!4612 lt!89711) (size!3939 (_keys!5622 thiss!1248))))))

(declare-fun e!119621 () Bool)

(assert (=> b!181636 (= e!119621 (= (select (arr!3628 (_keys!5622 thiss!1248)) (index!4612 lt!89711)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181637 () Bool)

(assert (=> b!181637 (= e!119617 (bvsge (x!19831 lt!89711) #b01111111111111111111111111111110))))

(declare-fun b!181638 () Bool)

(assert (=> b!181638 (and (bvsge (index!4612 lt!89711) #b00000000000000000000000000000000) (bvslt (index!4612 lt!89711) (size!3939 (_keys!5622 thiss!1248))))))

(declare-fun res!85949 () Bool)

(assert (=> b!181638 (= res!85949 (= (select (arr!3628 (_keys!5622 thiss!1248)) (index!4612 lt!89711)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181638 (=> res!85949 e!119621)))

(declare-fun b!181639 () Bool)

(assert (=> b!181639 (= e!119618 e!119619)))

(declare-fun c!32561 () Bool)

(assert (=> b!181639 (= c!32561 (or (= lt!89710 key!828) (= (bvadd lt!89710 lt!89710) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181640 () Bool)

(assert (=> b!181640 (and (bvsge (index!4612 lt!89711) #b00000000000000000000000000000000) (bvslt (index!4612 lt!89711) (size!3939 (_keys!5622 thiss!1248))))))

(declare-fun res!85948 () Bool)

(assert (=> b!181640 (= res!85948 (= (select (arr!3628 (_keys!5622 thiss!1248)) (index!4612 lt!89711)) key!828))))

(assert (=> b!181640 (=> res!85948 e!119621)))

(assert (=> b!181640 (= e!119620 e!119621)))

(assert (= (and d!54319 c!32560) b!181634))

(assert (= (and d!54319 (not c!32560)) b!181639))

(assert (= (and b!181639 c!32561) b!181633))

(assert (= (and b!181639 (not c!32561)) b!181635))

(assert (= (and d!54319 c!32559) b!181637))

(assert (= (and d!54319 (not c!32559)) b!181632))

(assert (= (and b!181632 res!85950) b!181640))

(assert (= (and b!181640 (not res!85948)) b!181638))

(assert (= (and b!181638 (not res!85949)) b!181636))

(assert (=> b!181635 m!208951))

(declare-fun m!208991 () Bool)

(assert (=> b!181635 m!208991))

(assert (=> b!181635 m!208991))

(declare-fun m!208993 () Bool)

(assert (=> b!181635 m!208993))

(declare-fun m!208995 () Bool)

(assert (=> b!181640 m!208995))

(assert (=> d!54319 m!208951))

(declare-fun m!208997 () Bool)

(assert (=> d!54319 m!208997))

(assert (=> d!54319 m!208847))

(assert (=> b!181638 m!208995))

(assert (=> b!181636 m!208995))

(assert (=> d!54305 d!54319))

(declare-fun d!54321 () Bool)

(declare-fun lt!89717 () (_ BitVec 32))

(declare-fun lt!89716 () (_ BitVec 32))

(assert (=> d!54321 (= lt!89717 (bvmul (bvxor lt!89716 (bvlshr lt!89716 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54321 (= lt!89716 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54321 (and (bvsge (mask!8744 thiss!1248) #b00000000000000000000000000000000) (let ((res!85951 (let ((h!2931 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19848 (bvmul (bvxor h!2931 (bvlshr h!2931 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19848 (bvlshr x!19848 #b00000000000000000000000000001101)) (mask!8744 thiss!1248)))))) (and (bvslt res!85951 (bvadd (mask!8744 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!85951 #b00000000000000000000000000000000))))))

(assert (=> d!54321 (= (toIndex!0 key!828 (mask!8744 thiss!1248)) (bvand (bvxor lt!89717 (bvlshr lt!89717 #b00000000000000000000000000001101)) (mask!8744 thiss!1248)))))

(assert (=> d!54305 d!54321))

(assert (=> d!54305 d!54309))

(declare-fun d!54323 () Bool)

(declare-fun get!2077 (Option!214) V!5321)

(assert (=> d!54323 (= (apply!153 lt!89678 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2077 (getValueByKey!208 (toList!1151 lt!89678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7387 () Bool)

(assert (= bs!7387 d!54323))

(declare-fun m!208999 () Bool)

(assert (=> bs!7387 m!208999))

(assert (=> bs!7387 m!208999))

(declare-fun m!209001 () Bool)

(assert (=> bs!7387 m!209001))

(assert (=> b!181548 d!54323))

(declare-fun b!181651 () Bool)

(declare-fun e!119632 () Bool)

(declare-fun e!119631 () Bool)

(assert (=> b!181651 (= e!119632 e!119631)))

(declare-fun res!85960 () Bool)

(assert (=> b!181651 (=> (not res!85960) (not e!119631))))

(declare-fun e!119633 () Bool)

(assert (=> b!181651 (= res!85960 (not e!119633))))

(declare-fun res!85959 () Bool)

(assert (=> b!181651 (=> (not res!85959) (not e!119633))))

(assert (=> b!181651 (= res!85959 (validKeyInArray!0 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181652 () Bool)

(declare-fun e!119630 () Bool)

(assert (=> b!181652 (= e!119631 e!119630)))

(declare-fun c!32564 () Bool)

(assert (=> b!181652 (= c!32564 (validKeyInArray!0 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181653 () Bool)

(declare-fun contains!1239 (List!2307 (_ BitVec 64)) Bool)

(assert (=> b!181653 (= e!119633 (contains!1239 Nil!2304 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181654 () Bool)

(declare-fun call!18343 () Bool)

(assert (=> b!181654 (= e!119630 call!18343)))

(declare-fun b!181655 () Bool)

(assert (=> b!181655 (= e!119630 call!18343)))

(declare-fun bm!18340 () Bool)

(assert (=> bm!18340 (= call!18343 (arrayNoDuplicates!0 (_keys!5622 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32564 (Cons!2303 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000) Nil!2304) Nil!2304)))))

(declare-fun d!54325 () Bool)

(declare-fun res!85958 () Bool)

(assert (=> d!54325 (=> res!85958 e!119632)))

(assert (=> d!54325 (= res!85958 (bvsge #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))))))

(assert (=> d!54325 (= (arrayNoDuplicates!0 (_keys!5622 thiss!1248) #b00000000000000000000000000000000 Nil!2304) e!119632)))

(assert (= (and d!54325 (not res!85958)) b!181651))

(assert (= (and b!181651 res!85959) b!181653))

(assert (= (and b!181651 res!85960) b!181652))

(assert (= (and b!181652 c!32564) b!181654))

(assert (= (and b!181652 (not c!32564)) b!181655))

(assert (= (or b!181654 b!181655) bm!18340))

(assert (=> b!181651 m!208895))

(assert (=> b!181651 m!208895))

(assert (=> b!181651 m!208909))

(assert (=> b!181652 m!208895))

(assert (=> b!181652 m!208895))

(assert (=> b!181652 m!208909))

(assert (=> b!181653 m!208895))

(assert (=> b!181653 m!208895))

(declare-fun m!209003 () Bool)

(assert (=> b!181653 m!209003))

(assert (=> bm!18340 m!208895))

(declare-fun m!209005 () Bool)

(assert (=> bm!18340 m!209005))

(assert (=> b!181584 d!54325))

(declare-fun d!54327 () Bool)

(assert (=> d!54327 (= (validKeyInArray!0 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181537 d!54327))

(declare-fun d!54329 () Bool)

(declare-fun res!85965 () Bool)

(declare-fun e!119638 () Bool)

(assert (=> d!54329 (=> res!85965 e!119638)))

(assert (=> d!54329 (= res!85965 (and ((_ is Cons!2302) (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))) (= (_1!1692 (h!2929 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))))) key!828)))))

(assert (=> d!54329 (= (containsKey!212 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))) key!828) e!119638)))

(declare-fun b!181660 () Bool)

(declare-fun e!119639 () Bool)

(assert (=> b!181660 (= e!119638 e!119639)))

(declare-fun res!85966 () Bool)

(assert (=> b!181660 (=> (not res!85966) (not e!119639))))

(assert (=> b!181660 (= res!85966 (and (or (not ((_ is Cons!2302) (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))))) (bvsle (_1!1692 (h!2929 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))))) key!828)) ((_ is Cons!2302) (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))) (bvslt (_1!1692 (h!2929 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248))))) key!828)))))

(declare-fun b!181661 () Bool)

(assert (=> b!181661 (= e!119639 (containsKey!212 (t!7153 (toList!1151 (getCurrentListMap!784 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)))) key!828))))

(assert (= (and d!54329 (not res!85965)) b!181660))

(assert (= (and b!181660 res!85966) b!181661))

(declare-fun m!209007 () Bool)

(assert (=> b!181661 m!209007))

(assert (=> d!54297 d!54329))

(declare-fun b!181670 () Bool)

(declare-fun e!119647 () Bool)

(declare-fun call!18346 () Bool)

(assert (=> b!181670 (= e!119647 call!18346)))

(declare-fun d!54331 () Bool)

(declare-fun res!85972 () Bool)

(declare-fun e!119648 () Bool)

(assert (=> d!54331 (=> res!85972 e!119648)))

(assert (=> d!54331 (= res!85972 (bvsge #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))))))

(assert (=> d!54331 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5622 thiss!1248) (mask!8744 thiss!1248)) e!119648)))

(declare-fun bm!18343 () Bool)

(assert (=> bm!18343 (= call!18346 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5622 thiss!1248) (mask!8744 thiss!1248)))))

(declare-fun b!181671 () Bool)

(assert (=> b!181671 (= e!119648 e!119647)))

(declare-fun c!32567 () Bool)

(assert (=> b!181671 (= c!32567 (validKeyInArray!0 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181672 () Bool)

(declare-fun e!119646 () Bool)

(assert (=> b!181672 (= e!119646 call!18346)))

(declare-fun b!181673 () Bool)

(assert (=> b!181673 (= e!119647 e!119646)))

(declare-fun lt!89725 () (_ BitVec 64))

(assert (=> b!181673 (= lt!89725 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89726 () Unit!5487)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7671 (_ BitVec 64) (_ BitVec 32)) Unit!5487)

(assert (=> b!181673 (= lt!89726 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5622 thiss!1248) lt!89725 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!181673 (arrayContainsKey!0 (_keys!5622 thiss!1248) lt!89725 #b00000000000000000000000000000000)))

(declare-fun lt!89724 () Unit!5487)

(assert (=> b!181673 (= lt!89724 lt!89726)))

(declare-fun res!85971 () Bool)

(assert (=> b!181673 (= res!85971 (= (seekEntryOrOpen!0 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000) (_keys!5622 thiss!1248) (mask!8744 thiss!1248)) (Found!610 #b00000000000000000000000000000000)))))

(assert (=> b!181673 (=> (not res!85971) (not e!119646))))

(assert (= (and d!54331 (not res!85972)) b!181671))

(assert (= (and b!181671 c!32567) b!181673))

(assert (= (and b!181671 (not c!32567)) b!181670))

(assert (= (and b!181673 res!85971) b!181672))

(assert (= (or b!181672 b!181670) bm!18343))

(declare-fun m!209009 () Bool)

(assert (=> bm!18343 m!209009))

(assert (=> b!181671 m!208895))

(assert (=> b!181671 m!208895))

(assert (=> b!181671 m!208909))

(assert (=> b!181673 m!208895))

(declare-fun m!209011 () Bool)

(assert (=> b!181673 m!209011))

(declare-fun m!209013 () Bool)

(assert (=> b!181673 m!209013))

(assert (=> b!181673 m!208895))

(declare-fun m!209015 () Bool)

(assert (=> b!181673 m!209015))

(assert (=> b!181583 d!54331))

(declare-fun d!54333 () Bool)

(assert (=> d!54333 (= (apply!153 lt!89678 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)) (get!2077 (getValueByKey!208 (toList!1151 lt!89678) (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7388 () Bool)

(assert (= bs!7388 d!54333))

(assert (=> bs!7388 m!208895))

(declare-fun m!209017 () Bool)

(assert (=> bs!7388 m!209017))

(assert (=> bs!7388 m!209017))

(declare-fun m!209019 () Bool)

(assert (=> bs!7388 m!209019))

(assert (=> b!181546 d!54333))

(declare-fun d!54335 () Bool)

(declare-fun c!32570 () Bool)

(assert (=> d!54335 (= c!32570 ((_ is ValueCellFull!1784) (select (arr!3629 (_values!3703 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119651 () V!5321)

(assert (=> d!54335 (= (get!2076 (select (arr!3629 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!119651)))

(declare-fun b!181678 () Bool)

(declare-fun get!2078 (ValueCell!1784 V!5321) V!5321)

(assert (=> b!181678 (= e!119651 (get!2078 (select (arr!3629 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181679 () Bool)

(declare-fun get!2079 (ValueCell!1784 V!5321) V!5321)

(assert (=> b!181679 (= e!119651 (get!2079 (select (arr!3629 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54335 c!32570) b!181678))

(assert (= (and d!54335 (not c!32570)) b!181679))

(assert (=> b!181678 m!208889))

(assert (=> b!181678 m!208891))

(declare-fun m!209021 () Bool)

(assert (=> b!181678 m!209021))

(assert (=> b!181679 m!208889))

(assert (=> b!181679 m!208891))

(declare-fun m!209023 () Bool)

(assert (=> b!181679 m!209023))

(assert (=> b!181546 d!54335))

(declare-fun lt!89732 () SeekEntryResult!610)

(declare-fun d!54337 () Bool)

(assert (=> d!54337 (and (or ((_ is Undefined!610) lt!89732) (not ((_ is Found!610) lt!89732)) (and (bvsge (index!4611 lt!89732) #b00000000000000000000000000000000) (bvslt (index!4611 lt!89732) (size!3939 (_keys!5622 thiss!1248))))) (or ((_ is Undefined!610) lt!89732) ((_ is Found!610) lt!89732) (not ((_ is MissingVacant!610) lt!89732)) (not (= (index!4613 lt!89732) (index!4612 lt!89690))) (and (bvsge (index!4613 lt!89732) #b00000000000000000000000000000000) (bvslt (index!4613 lt!89732) (size!3939 (_keys!5622 thiss!1248))))) (or ((_ is Undefined!610) lt!89732) (ite ((_ is Found!610) lt!89732) (= (select (arr!3628 (_keys!5622 thiss!1248)) (index!4611 lt!89732)) key!828) (and ((_ is MissingVacant!610) lt!89732) (= (index!4613 lt!89732) (index!4612 lt!89690)) (= (select (arr!3628 (_keys!5622 thiss!1248)) (index!4613 lt!89732)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!119658 () SeekEntryResult!610)

(assert (=> d!54337 (= lt!89732 e!119658)))

(declare-fun c!32578 () Bool)

(assert (=> d!54337 (= c!32578 (bvsge (x!19831 lt!89690) #b01111111111111111111111111111110))))

(declare-fun lt!89731 () (_ BitVec 64))

(assert (=> d!54337 (= lt!89731 (select (arr!3628 (_keys!5622 thiss!1248)) (index!4612 lt!89690)))))

(assert (=> d!54337 (validMask!0 (mask!8744 thiss!1248))))

(assert (=> d!54337 (= (seekKeyOrZeroReturnVacant!0 (x!19831 lt!89690) (index!4612 lt!89690) (index!4612 lt!89690) key!828 (_keys!5622 thiss!1248) (mask!8744 thiss!1248)) lt!89732)))

(declare-fun b!181692 () Bool)

(declare-fun e!119660 () SeekEntryResult!610)

(assert (=> b!181692 (= e!119660 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19831 lt!89690) #b00000000000000000000000000000001) (nextIndex!0 (index!4612 lt!89690) (x!19831 lt!89690) (mask!8744 thiss!1248)) (index!4612 lt!89690) key!828 (_keys!5622 thiss!1248) (mask!8744 thiss!1248)))))

(declare-fun b!181693 () Bool)

(assert (=> b!181693 (= e!119660 (MissingVacant!610 (index!4612 lt!89690)))))

(declare-fun b!181694 () Bool)

(assert (=> b!181694 (= e!119658 Undefined!610)))

(declare-fun b!181695 () Bool)

(declare-fun c!32577 () Bool)

(assert (=> b!181695 (= c!32577 (= lt!89731 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119659 () SeekEntryResult!610)

(assert (=> b!181695 (= e!119659 e!119660)))

(declare-fun b!181696 () Bool)

(assert (=> b!181696 (= e!119659 (Found!610 (index!4612 lt!89690)))))

(declare-fun b!181697 () Bool)

(assert (=> b!181697 (= e!119658 e!119659)))

(declare-fun c!32579 () Bool)

(assert (=> b!181697 (= c!32579 (= lt!89731 key!828))))

(assert (= (and d!54337 c!32578) b!181694))

(assert (= (and d!54337 (not c!32578)) b!181697))

(assert (= (and b!181697 c!32579) b!181696))

(assert (= (and b!181697 (not c!32579)) b!181695))

(assert (= (and b!181695 c!32577) b!181693))

(assert (= (and b!181695 (not c!32577)) b!181692))

(declare-fun m!209025 () Bool)

(assert (=> d!54337 m!209025))

(declare-fun m!209027 () Bool)

(assert (=> d!54337 m!209027))

(assert (=> d!54337 m!208959))

(assert (=> d!54337 m!208847))

(declare-fun m!209029 () Bool)

(assert (=> b!181692 m!209029))

(assert (=> b!181692 m!209029))

(declare-fun m!209031 () Bool)

(assert (=> b!181692 m!209031))

(assert (=> b!181573 d!54337))

(assert (=> b!181553 d!54327))

(declare-fun d!54339 () Bool)

(declare-fun res!85983 () Bool)

(declare-fun e!119663 () Bool)

(assert (=> d!54339 (=> (not res!85983) (not e!119663))))

(assert (=> d!54339 (= res!85983 (validMask!0 (mask!8744 thiss!1248)))))

(assert (=> d!54339 (= (simpleValid!169 thiss!1248) e!119663)))

(declare-fun b!181707 () Bool)

(declare-fun res!85984 () Bool)

(assert (=> b!181707 (=> (not res!85984) (not e!119663))))

(declare-fun size!3945 (LongMapFixedSize!2476) (_ BitVec 32))

(assert (=> b!181707 (= res!85984 (bvsge (size!3945 thiss!1248) (_size!1287 thiss!1248)))))

(declare-fun b!181709 () Bool)

(assert (=> b!181709 (= e!119663 (and (bvsge (extraKeys!3457 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3457 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1287 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!181706 () Bool)

(declare-fun res!85982 () Bool)

(assert (=> b!181706 (=> (not res!85982) (not e!119663))))

(assert (=> b!181706 (= res!85982 (and (= (size!3940 (_values!3703 thiss!1248)) (bvadd (mask!8744 thiss!1248) #b00000000000000000000000000000001)) (= (size!3939 (_keys!5622 thiss!1248)) (size!3940 (_values!3703 thiss!1248))) (bvsge (_size!1287 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1287 thiss!1248) (bvadd (mask!8744 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!181708 () Bool)

(declare-fun res!85981 () Bool)

(assert (=> b!181708 (=> (not res!85981) (not e!119663))))

(assert (=> b!181708 (= res!85981 (= (size!3945 thiss!1248) (bvadd (_size!1287 thiss!1248) (bvsdiv (bvadd (extraKeys!3457 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!54339 res!85983) b!181706))

(assert (= (and b!181706 res!85982) b!181707))

(assert (= (and b!181707 res!85984) b!181708))

(assert (= (and b!181708 res!85981) b!181709))

(assert (=> d!54339 m!208847))

(declare-fun m!209033 () Bool)

(assert (=> b!181707 m!209033))

(assert (=> b!181708 m!209033))

(assert (=> d!54307 d!54339))

(declare-fun d!54341 () Bool)

(assert (=> d!54341 (= (apply!153 (+!270 lt!89681 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248))) lt!89677) (get!2077 (getValueByKey!208 (toList!1151 (+!270 lt!89681 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248)))) lt!89677)))))

(declare-fun bs!7389 () Bool)

(assert (= bs!7389 d!54341))

(declare-fun m!209035 () Bool)

(assert (=> bs!7389 m!209035))

(assert (=> bs!7389 m!209035))

(declare-fun m!209037 () Bool)

(assert (=> bs!7389 m!209037))

(assert (=> b!181551 d!54341))

(declare-fun d!54343 () Bool)

(assert (=> d!54343 (= (apply!153 (+!270 lt!89669 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248))) lt!89670) (get!2077 (getValueByKey!208 (toList!1151 (+!270 lt!89669 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248)))) lt!89670)))))

(declare-fun bs!7390 () Bool)

(assert (= bs!7390 d!54343))

(declare-fun m!209039 () Bool)

(assert (=> bs!7390 m!209039))

(assert (=> bs!7390 m!209039))

(declare-fun m!209041 () Bool)

(assert (=> bs!7390 m!209041))

(assert (=> b!181551 d!54343))

(declare-fun d!54345 () Bool)

(assert (=> d!54345 (= (apply!153 (+!270 lt!89669 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248))) lt!89670) (apply!153 lt!89669 lt!89670))))

(declare-fun lt!89735 () Unit!5487)

(declare-fun choose!972 (ListLongMap!2271 (_ BitVec 64) V!5321 (_ BitVec 64)) Unit!5487)

(assert (=> d!54345 (= lt!89735 (choose!972 lt!89669 lt!89661 (minValue!3561 thiss!1248) lt!89670))))

(declare-fun e!119666 () Bool)

(assert (=> d!54345 e!119666))

(declare-fun res!85987 () Bool)

(assert (=> d!54345 (=> (not res!85987) (not e!119666))))

(assert (=> d!54345 (= res!85987 (contains!1237 lt!89669 lt!89670))))

(assert (=> d!54345 (= (addApplyDifferent!129 lt!89669 lt!89661 (minValue!3561 thiss!1248) lt!89670) lt!89735)))

(declare-fun b!181713 () Bool)

(assert (=> b!181713 (= e!119666 (not (= lt!89670 lt!89661)))))

(assert (= (and d!54345 res!85987) b!181713))

(declare-fun m!209043 () Bool)

(assert (=> d!54345 m!209043))

(assert (=> d!54345 m!208937))

(assert (=> d!54345 m!208917))

(assert (=> d!54345 m!208939))

(assert (=> d!54345 m!208917))

(declare-fun m!209045 () Bool)

(assert (=> d!54345 m!209045))

(assert (=> b!181551 d!54345))

(declare-fun d!54347 () Bool)

(declare-fun e!119667 () Bool)

(assert (=> d!54347 e!119667))

(declare-fun res!85988 () Bool)

(assert (=> d!54347 (=> res!85988 e!119667)))

(declare-fun lt!89737 () Bool)

(assert (=> d!54347 (= res!85988 (not lt!89737))))

(declare-fun lt!89738 () Bool)

(assert (=> d!54347 (= lt!89737 lt!89738)))

(declare-fun lt!89736 () Unit!5487)

(declare-fun e!119668 () Unit!5487)

(assert (=> d!54347 (= lt!89736 e!119668)))

(declare-fun c!32580 () Bool)

(assert (=> d!54347 (= c!32580 lt!89738)))

(assert (=> d!54347 (= lt!89738 (containsKey!212 (toList!1151 (+!270 lt!89679 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248)))) lt!89674))))

(assert (=> d!54347 (= (contains!1237 (+!270 lt!89679 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248))) lt!89674) lt!89737)))

(declare-fun b!181714 () Bool)

(declare-fun lt!89739 () Unit!5487)

(assert (=> b!181714 (= e!119668 lt!89739)))

(assert (=> b!181714 (= lt!89739 (lemmaContainsKeyImpliesGetValueByKeyDefined!161 (toList!1151 (+!270 lt!89679 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248)))) lt!89674))))

(assert (=> b!181714 (isDefined!162 (getValueByKey!208 (toList!1151 (+!270 lt!89679 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248)))) lt!89674))))

(declare-fun b!181715 () Bool)

(declare-fun Unit!5491 () Unit!5487)

(assert (=> b!181715 (= e!119668 Unit!5491)))

(declare-fun b!181716 () Bool)

(assert (=> b!181716 (= e!119667 (isDefined!162 (getValueByKey!208 (toList!1151 (+!270 lt!89679 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248)))) lt!89674)))))

(assert (= (and d!54347 c!32580) b!181714))

(assert (= (and d!54347 (not c!32580)) b!181715))

(assert (= (and d!54347 (not res!85988)) b!181716))

(declare-fun m!209047 () Bool)

(assert (=> d!54347 m!209047))

(declare-fun m!209049 () Bool)

(assert (=> b!181714 m!209049))

(declare-fun m!209051 () Bool)

(assert (=> b!181714 m!209051))

(assert (=> b!181714 m!209051))

(declare-fun m!209053 () Bool)

(assert (=> b!181714 m!209053))

(assert (=> b!181716 m!209051))

(assert (=> b!181716 m!209051))

(assert (=> b!181716 m!209053))

(assert (=> b!181551 d!54347))

(declare-fun d!54349 () Bool)

(assert (=> d!54349 (= (apply!153 (+!270 lt!89662 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248))) lt!89667) (apply!153 lt!89662 lt!89667))))

(declare-fun lt!89740 () Unit!5487)

(assert (=> d!54349 (= lt!89740 (choose!972 lt!89662 lt!89664 (minValue!3561 thiss!1248) lt!89667))))

(declare-fun e!119669 () Bool)

(assert (=> d!54349 e!119669))

(declare-fun res!85989 () Bool)

(assert (=> d!54349 (=> (not res!85989) (not e!119669))))

(assert (=> d!54349 (= res!85989 (contains!1237 lt!89662 lt!89667))))

(assert (=> d!54349 (= (addApplyDifferent!129 lt!89662 lt!89664 (minValue!3561 thiss!1248) lt!89667) lt!89740)))

(declare-fun b!181717 () Bool)

(assert (=> b!181717 (= e!119669 (not (= lt!89667 lt!89664)))))

(assert (= (and d!54349 res!85989) b!181717))

(declare-fun m!209055 () Bool)

(assert (=> d!54349 m!209055))

(assert (=> d!54349 m!208919))

(assert (=> d!54349 m!208923))

(assert (=> d!54349 m!208925))

(assert (=> d!54349 m!208923))

(declare-fun m!209057 () Bool)

(assert (=> d!54349 m!209057))

(assert (=> b!181551 d!54349))

(declare-fun d!54351 () Bool)

(assert (=> d!54351 (= (apply!153 lt!89669 lt!89670) (get!2077 (getValueByKey!208 (toList!1151 lt!89669) lt!89670)))))

(declare-fun bs!7391 () Bool)

(assert (= bs!7391 d!54351))

(declare-fun m!209059 () Bool)

(assert (=> bs!7391 m!209059))

(assert (=> bs!7391 m!209059))

(declare-fun m!209061 () Bool)

(assert (=> bs!7391 m!209061))

(assert (=> b!181551 d!54351))

(declare-fun d!54353 () Bool)

(assert (=> d!54353 (= (apply!153 lt!89681 lt!89677) (get!2077 (getValueByKey!208 (toList!1151 lt!89681) lt!89677)))))

(declare-fun bs!7392 () Bool)

(assert (= bs!7392 d!54353))

(declare-fun m!209063 () Bool)

(assert (=> bs!7392 m!209063))

(assert (=> bs!7392 m!209063))

(declare-fun m!209065 () Bool)

(assert (=> bs!7392 m!209065))

(assert (=> b!181551 d!54353))

(declare-fun d!54355 () Bool)

(assert (=> d!54355 (contains!1237 (+!270 lt!89679 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248))) lt!89674)))

(declare-fun lt!89743 () Unit!5487)

(declare-fun choose!973 (ListLongMap!2271 (_ BitVec 64) V!5321 (_ BitVec 64)) Unit!5487)

(assert (=> d!54355 (= lt!89743 (choose!973 lt!89679 lt!89672 (zeroValue!3561 thiss!1248) lt!89674))))

(assert (=> d!54355 (contains!1237 lt!89679 lt!89674)))

(assert (=> d!54355 (= (addStillContains!129 lt!89679 lt!89672 (zeroValue!3561 thiss!1248) lt!89674) lt!89743)))

(declare-fun bs!7393 () Bool)

(assert (= bs!7393 d!54355))

(assert (=> bs!7393 m!208927))

(assert (=> bs!7393 m!208927))

(assert (=> bs!7393 m!208929))

(declare-fun m!209067 () Bool)

(assert (=> bs!7393 m!209067))

(declare-fun m!209069 () Bool)

(assert (=> bs!7393 m!209069))

(assert (=> b!181551 d!54355))

(declare-fun d!54357 () Bool)

(declare-fun e!119670 () Bool)

(assert (=> d!54357 e!119670))

(declare-fun res!85991 () Bool)

(assert (=> d!54357 (=> (not res!85991) (not e!119670))))

(declare-fun lt!89747 () ListLongMap!2271)

(assert (=> d!54357 (= res!85991 (contains!1237 lt!89747 (_1!1692 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248)))))))

(declare-fun lt!89746 () List!2306)

(assert (=> d!54357 (= lt!89747 (ListLongMap!2272 lt!89746))))

(declare-fun lt!89744 () Unit!5487)

(declare-fun lt!89745 () Unit!5487)

(assert (=> d!54357 (= lt!89744 lt!89745)))

(assert (=> d!54357 (= (getValueByKey!208 lt!89746 (_1!1692 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248)))) (Some!213 (_2!1692 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248)))))))

(assert (=> d!54357 (= lt!89745 (lemmaContainsTupThenGetReturnValue!112 lt!89746 (_1!1692 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248))) (_2!1692 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248)))))))

(assert (=> d!54357 (= lt!89746 (insertStrictlySorted!115 (toList!1151 lt!89669) (_1!1692 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248))) (_2!1692 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248)))))))

(assert (=> d!54357 (= (+!270 lt!89669 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248))) lt!89747)))

(declare-fun b!181719 () Bool)

(declare-fun res!85990 () Bool)

(assert (=> b!181719 (=> (not res!85990) (not e!119670))))

(assert (=> b!181719 (= res!85990 (= (getValueByKey!208 (toList!1151 lt!89747) (_1!1692 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248)))) (Some!213 (_2!1692 (tuple2!3363 lt!89661 (minValue!3561 thiss!1248))))))))

(declare-fun b!181720 () Bool)

(assert (=> b!181720 (= e!119670 (contains!1238 (toList!1151 lt!89747) (tuple2!3363 lt!89661 (minValue!3561 thiss!1248))))))

(assert (= (and d!54357 res!85991) b!181719))

(assert (= (and b!181719 res!85990) b!181720))

(declare-fun m!209071 () Bool)

(assert (=> d!54357 m!209071))

(declare-fun m!209073 () Bool)

(assert (=> d!54357 m!209073))

(declare-fun m!209075 () Bool)

(assert (=> d!54357 m!209075))

(declare-fun m!209077 () Bool)

(assert (=> d!54357 m!209077))

(declare-fun m!209079 () Bool)

(assert (=> b!181719 m!209079))

(declare-fun m!209081 () Bool)

(assert (=> b!181720 m!209081))

(assert (=> b!181551 d!54357))

(declare-fun d!54359 () Bool)

(assert (=> d!54359 (= (apply!153 (+!270 lt!89681 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248))) lt!89677) (apply!153 lt!89681 lt!89677))))

(declare-fun lt!89748 () Unit!5487)

(assert (=> d!54359 (= lt!89748 (choose!972 lt!89681 lt!89665 (zeroValue!3561 thiss!1248) lt!89677))))

(declare-fun e!119671 () Bool)

(assert (=> d!54359 e!119671))

(declare-fun res!85992 () Bool)

(assert (=> d!54359 (=> (not res!85992) (not e!119671))))

(assert (=> d!54359 (= res!85992 (contains!1237 lt!89681 lt!89677))))

(assert (=> d!54359 (= (addApplyDifferent!129 lt!89681 lt!89665 (zeroValue!3561 thiss!1248) lt!89677) lt!89748)))

(declare-fun b!181721 () Bool)

(assert (=> b!181721 (= e!119671 (not (= lt!89677 lt!89665)))))

(assert (= (and d!54359 res!85992) b!181721))

(declare-fun m!209083 () Bool)

(assert (=> d!54359 m!209083))

(assert (=> d!54359 m!208921))

(assert (=> d!54359 m!208931))

(assert (=> d!54359 m!208935))

(assert (=> d!54359 m!208931))

(declare-fun m!209085 () Bool)

(assert (=> d!54359 m!209085))

(assert (=> b!181551 d!54359))

(declare-fun d!54361 () Bool)

(assert (=> d!54361 (= (apply!153 (+!270 lt!89662 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248))) lt!89667) (get!2077 (getValueByKey!208 (toList!1151 (+!270 lt!89662 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248)))) lt!89667)))))

(declare-fun bs!7394 () Bool)

(assert (= bs!7394 d!54361))

(declare-fun m!209087 () Bool)

(assert (=> bs!7394 m!209087))

(assert (=> bs!7394 m!209087))

(declare-fun m!209089 () Bool)

(assert (=> bs!7394 m!209089))

(assert (=> b!181551 d!54361))

(declare-fun d!54363 () Bool)

(assert (=> d!54363 (= (apply!153 lt!89662 lt!89667) (get!2077 (getValueByKey!208 (toList!1151 lt!89662) lt!89667)))))

(declare-fun bs!7395 () Bool)

(assert (= bs!7395 d!54363))

(declare-fun m!209091 () Bool)

(assert (=> bs!7395 m!209091))

(assert (=> bs!7395 m!209091))

(declare-fun m!209093 () Bool)

(assert (=> bs!7395 m!209093))

(assert (=> b!181551 d!54363))

(declare-fun d!54365 () Bool)

(declare-fun e!119672 () Bool)

(assert (=> d!54365 e!119672))

(declare-fun res!85994 () Bool)

(assert (=> d!54365 (=> (not res!85994) (not e!119672))))

(declare-fun lt!89752 () ListLongMap!2271)

(assert (=> d!54365 (= res!85994 (contains!1237 lt!89752 (_1!1692 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248)))))))

(declare-fun lt!89751 () List!2306)

(assert (=> d!54365 (= lt!89752 (ListLongMap!2272 lt!89751))))

(declare-fun lt!89749 () Unit!5487)

(declare-fun lt!89750 () Unit!5487)

(assert (=> d!54365 (= lt!89749 lt!89750)))

(assert (=> d!54365 (= (getValueByKey!208 lt!89751 (_1!1692 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248)))) (Some!213 (_2!1692 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248)))))))

(assert (=> d!54365 (= lt!89750 (lemmaContainsTupThenGetReturnValue!112 lt!89751 (_1!1692 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248))) (_2!1692 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248)))))))

(assert (=> d!54365 (= lt!89751 (insertStrictlySorted!115 (toList!1151 lt!89662) (_1!1692 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248))) (_2!1692 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248)))))))

(assert (=> d!54365 (= (+!270 lt!89662 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248))) lt!89752)))

(declare-fun b!181722 () Bool)

(declare-fun res!85993 () Bool)

(assert (=> b!181722 (=> (not res!85993) (not e!119672))))

(assert (=> b!181722 (= res!85993 (= (getValueByKey!208 (toList!1151 lt!89752) (_1!1692 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248)))) (Some!213 (_2!1692 (tuple2!3363 lt!89664 (minValue!3561 thiss!1248))))))))

(declare-fun b!181723 () Bool)

(assert (=> b!181723 (= e!119672 (contains!1238 (toList!1151 lt!89752) (tuple2!3363 lt!89664 (minValue!3561 thiss!1248))))))

(assert (= (and d!54365 res!85994) b!181722))

(assert (= (and b!181722 res!85993) b!181723))

(declare-fun m!209095 () Bool)

(assert (=> d!54365 m!209095))

(declare-fun m!209097 () Bool)

(assert (=> d!54365 m!209097))

(declare-fun m!209099 () Bool)

(assert (=> d!54365 m!209099))

(declare-fun m!209101 () Bool)

(assert (=> d!54365 m!209101))

(declare-fun m!209103 () Bool)

(assert (=> b!181722 m!209103))

(declare-fun m!209105 () Bool)

(assert (=> b!181723 m!209105))

(assert (=> b!181551 d!54365))

(declare-fun b!181748 () Bool)

(declare-fun e!119688 () Bool)

(declare-fun lt!89772 () ListLongMap!2271)

(declare-fun isEmpty!464 (ListLongMap!2271) Bool)

(assert (=> b!181748 (= e!119688 (isEmpty!464 lt!89772))))

(declare-fun b!181749 () Bool)

(declare-fun e!119691 () ListLongMap!2271)

(declare-fun call!18349 () ListLongMap!2271)

(assert (=> b!181749 (= e!119691 call!18349)))

(declare-fun b!181750 () Bool)

(declare-fun e!119693 () Bool)

(assert (=> b!181750 (= e!119693 e!119688)))

(declare-fun c!32591 () Bool)

(assert (=> b!181750 (= c!32591 (bvslt #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))))))

(declare-fun b!181751 () Bool)

(declare-fun e!119692 () Bool)

(assert (=> b!181751 (= e!119692 e!119693)))

(declare-fun c!32589 () Bool)

(declare-fun e!119689 () Bool)

(assert (=> b!181751 (= c!32589 e!119689)))

(declare-fun res!86003 () Bool)

(assert (=> b!181751 (=> (not res!86003) (not e!119689))))

(assert (=> b!181751 (= res!86003 (bvslt #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))))))

(declare-fun b!181752 () Bool)

(declare-fun e!119687 () ListLongMap!2271)

(assert (=> b!181752 (= e!119687 e!119691)))

(declare-fun c!32592 () Bool)

(assert (=> b!181752 (= c!32592 (validKeyInArray!0 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181753 () Bool)

(assert (=> b!181753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))))))

(assert (=> b!181753 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3940 (_values!3703 thiss!1248))))))

(declare-fun e!119690 () Bool)

(assert (=> b!181753 (= e!119690 (= (apply!153 lt!89772 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)) (get!2076 (select (arr!3629 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!18346 () Bool)

(assert (=> bm!18346 (= call!18349 (getCurrentListMapNoExtraKeys!174 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3720 thiss!1248)))))

(declare-fun b!181754 () Bool)

(assert (=> b!181754 (= e!119689 (validKeyInArray!0 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181754 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!54367 () Bool)

(assert (=> d!54367 e!119692))

(declare-fun res!86005 () Bool)

(assert (=> d!54367 (=> (not res!86005) (not e!119692))))

(assert (=> d!54367 (= res!86005 (not (contains!1237 lt!89772 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54367 (= lt!89772 e!119687)))

(declare-fun c!32590 () Bool)

(assert (=> d!54367 (= c!32590 (bvsge #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))))))

(assert (=> d!54367 (validMask!0 (mask!8744 thiss!1248))))

(assert (=> d!54367 (= (getCurrentListMapNoExtraKeys!174 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3720 thiss!1248)) lt!89772)))

(declare-fun b!181755 () Bool)

(declare-fun res!86006 () Bool)

(assert (=> b!181755 (=> (not res!86006) (not e!119692))))

(assert (=> b!181755 (= res!86006 (not (contains!1237 lt!89772 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181756 () Bool)

(assert (=> b!181756 (= e!119693 e!119690)))

(assert (=> b!181756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))))))

(declare-fun res!86004 () Bool)

(assert (=> b!181756 (= res!86004 (contains!1237 lt!89772 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181756 (=> (not res!86004) (not e!119690))))

(declare-fun b!181757 () Bool)

(declare-fun lt!89768 () Unit!5487)

(declare-fun lt!89771 () Unit!5487)

(assert (=> b!181757 (= lt!89768 lt!89771)))

(declare-fun lt!89773 () ListLongMap!2271)

(declare-fun lt!89769 () (_ BitVec 64))

(declare-fun lt!89770 () V!5321)

(declare-fun lt!89767 () (_ BitVec 64))

(assert (=> b!181757 (not (contains!1237 (+!270 lt!89773 (tuple2!3363 lt!89769 lt!89770)) lt!89767))))

(declare-fun addStillNotContains!84 (ListLongMap!2271 (_ BitVec 64) V!5321 (_ BitVec 64)) Unit!5487)

(assert (=> b!181757 (= lt!89771 (addStillNotContains!84 lt!89773 lt!89769 lt!89770 lt!89767))))

(assert (=> b!181757 (= lt!89767 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!181757 (= lt!89770 (get!2076 (select (arr!3629 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181757 (= lt!89769 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181757 (= lt!89773 call!18349)))

(assert (=> b!181757 (= e!119691 (+!270 call!18349 (tuple2!3363 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000) (get!2076 (select (arr!3629 (_values!3703 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3720 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!181758 () Bool)

(assert (=> b!181758 (= e!119687 (ListLongMap!2272 Nil!2303))))

(declare-fun b!181759 () Bool)

(assert (=> b!181759 (= e!119688 (= lt!89772 (getCurrentListMapNoExtraKeys!174 (_keys!5622 thiss!1248) (_values!3703 thiss!1248) (mask!8744 thiss!1248) (extraKeys!3457 thiss!1248) (zeroValue!3561 thiss!1248) (minValue!3561 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3720 thiss!1248))))))

(assert (= (and d!54367 c!32590) b!181758))

(assert (= (and d!54367 (not c!32590)) b!181752))

(assert (= (and b!181752 c!32592) b!181757))

(assert (= (and b!181752 (not c!32592)) b!181749))

(assert (= (or b!181757 b!181749) bm!18346))

(assert (= (and d!54367 res!86005) b!181755))

(assert (= (and b!181755 res!86006) b!181751))

(assert (= (and b!181751 res!86003) b!181754))

(assert (= (and b!181751 c!32589) b!181756))

(assert (= (and b!181751 (not c!32589)) b!181750))

(assert (= (and b!181756 res!86004) b!181753))

(assert (= (and b!181750 c!32591) b!181759))

(assert (= (and b!181750 (not c!32591)) b!181748))

(declare-fun b_lambda!7137 () Bool)

(assert (=> (not b_lambda!7137) (not b!181753)))

(assert (=> b!181753 t!7155))

(declare-fun b_and!11015 () Bool)

(assert (= b_and!11013 (and (=> t!7155 result!4721) b_and!11015)))

(declare-fun b_lambda!7139 () Bool)

(assert (=> (not b_lambda!7139) (not b!181757)))

(assert (=> b!181757 t!7155))

(declare-fun b_and!11017 () Bool)

(assert (= b_and!11015 (and (=> t!7155 result!4721) b_and!11017)))

(assert (=> b!181757 m!208889))

(declare-fun m!209107 () Bool)

(assert (=> b!181757 m!209107))

(declare-fun m!209109 () Bool)

(assert (=> b!181757 m!209109))

(assert (=> b!181757 m!208891))

(declare-fun m!209111 () Bool)

(assert (=> b!181757 m!209111))

(declare-fun m!209113 () Bool)

(assert (=> b!181757 m!209113))

(assert (=> b!181757 m!209107))

(assert (=> b!181757 m!208889))

(assert (=> b!181757 m!208891))

(assert (=> b!181757 m!208893))

(assert (=> b!181757 m!208895))

(assert (=> b!181753 m!208889))

(assert (=> b!181753 m!208891))

(assert (=> b!181753 m!208895))

(declare-fun m!209115 () Bool)

(assert (=> b!181753 m!209115))

(assert (=> b!181753 m!208889))

(assert (=> b!181753 m!208891))

(assert (=> b!181753 m!208893))

(assert (=> b!181753 m!208895))

(declare-fun m!209117 () Bool)

(assert (=> b!181755 m!209117))

(declare-fun m!209119 () Bool)

(assert (=> bm!18346 m!209119))

(assert (=> b!181752 m!208895))

(assert (=> b!181752 m!208895))

(assert (=> b!181752 m!208909))

(declare-fun m!209121 () Bool)

(assert (=> b!181748 m!209121))

(assert (=> b!181759 m!209119))

(declare-fun m!209123 () Bool)

(assert (=> d!54367 m!209123))

(assert (=> d!54367 m!208847))

(assert (=> b!181756 m!208895))

(assert (=> b!181756 m!208895))

(declare-fun m!209125 () Bool)

(assert (=> b!181756 m!209125))

(assert (=> b!181754 m!208895))

(assert (=> b!181754 m!208895))

(assert (=> b!181754 m!208909))

(assert (=> b!181551 d!54367))

(declare-fun d!54369 () Bool)

(declare-fun e!119694 () Bool)

(assert (=> d!54369 e!119694))

(declare-fun res!86008 () Bool)

(assert (=> d!54369 (=> (not res!86008) (not e!119694))))

(declare-fun lt!89777 () ListLongMap!2271)

(assert (=> d!54369 (= res!86008 (contains!1237 lt!89777 (_1!1692 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248)))))))

(declare-fun lt!89776 () List!2306)

(assert (=> d!54369 (= lt!89777 (ListLongMap!2272 lt!89776))))

(declare-fun lt!89774 () Unit!5487)

(declare-fun lt!89775 () Unit!5487)

(assert (=> d!54369 (= lt!89774 lt!89775)))

(assert (=> d!54369 (= (getValueByKey!208 lt!89776 (_1!1692 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248)))) (Some!213 (_2!1692 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248)))))))

(assert (=> d!54369 (= lt!89775 (lemmaContainsTupThenGetReturnValue!112 lt!89776 (_1!1692 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248))) (_2!1692 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248)))))))

(assert (=> d!54369 (= lt!89776 (insertStrictlySorted!115 (toList!1151 lt!89681) (_1!1692 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248))) (_2!1692 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248)))))))

(assert (=> d!54369 (= (+!270 lt!89681 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248))) lt!89777)))

(declare-fun b!181760 () Bool)

(declare-fun res!86007 () Bool)

(assert (=> b!181760 (=> (not res!86007) (not e!119694))))

(assert (=> b!181760 (= res!86007 (= (getValueByKey!208 (toList!1151 lt!89777) (_1!1692 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248)))) (Some!213 (_2!1692 (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248))))))))

(declare-fun b!181761 () Bool)

(assert (=> b!181761 (= e!119694 (contains!1238 (toList!1151 lt!89777) (tuple2!3363 lt!89665 (zeroValue!3561 thiss!1248))))))

(assert (= (and d!54369 res!86008) b!181760))

(assert (= (and b!181760 res!86007) b!181761))

(declare-fun m!209127 () Bool)

(assert (=> d!54369 m!209127))

(declare-fun m!209129 () Bool)

(assert (=> d!54369 m!209129))

(declare-fun m!209131 () Bool)

(assert (=> d!54369 m!209131))

(declare-fun m!209133 () Bool)

(assert (=> d!54369 m!209133))

(declare-fun m!209135 () Bool)

(assert (=> b!181760 m!209135))

(declare-fun m!209137 () Bool)

(assert (=> b!181761 m!209137))

(assert (=> b!181551 d!54369))

(declare-fun d!54371 () Bool)

(declare-fun e!119695 () Bool)

(assert (=> d!54371 e!119695))

(declare-fun res!86010 () Bool)

(assert (=> d!54371 (=> (not res!86010) (not e!119695))))

(declare-fun lt!89781 () ListLongMap!2271)

(assert (=> d!54371 (= res!86010 (contains!1237 lt!89781 (_1!1692 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248)))))))

(declare-fun lt!89780 () List!2306)

(assert (=> d!54371 (= lt!89781 (ListLongMap!2272 lt!89780))))

(declare-fun lt!89778 () Unit!5487)

(declare-fun lt!89779 () Unit!5487)

(assert (=> d!54371 (= lt!89778 lt!89779)))

(assert (=> d!54371 (= (getValueByKey!208 lt!89780 (_1!1692 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248)))) (Some!213 (_2!1692 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248)))))))

(assert (=> d!54371 (= lt!89779 (lemmaContainsTupThenGetReturnValue!112 lt!89780 (_1!1692 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248))) (_2!1692 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248)))))))

(assert (=> d!54371 (= lt!89780 (insertStrictlySorted!115 (toList!1151 lt!89679) (_1!1692 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248))) (_2!1692 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248)))))))

(assert (=> d!54371 (= (+!270 lt!89679 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248))) lt!89781)))

(declare-fun b!181762 () Bool)

(declare-fun res!86009 () Bool)

(assert (=> b!181762 (=> (not res!86009) (not e!119695))))

(assert (=> b!181762 (= res!86009 (= (getValueByKey!208 (toList!1151 lt!89781) (_1!1692 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248)))) (Some!213 (_2!1692 (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248))))))))

(declare-fun b!181763 () Bool)

(assert (=> b!181763 (= e!119695 (contains!1238 (toList!1151 lt!89781) (tuple2!3363 lt!89672 (zeroValue!3561 thiss!1248))))))

(assert (= (and d!54371 res!86010) b!181762))

(assert (= (and b!181762 res!86009) b!181763))

(declare-fun m!209139 () Bool)

(assert (=> d!54371 m!209139))

(declare-fun m!209141 () Bool)

(assert (=> d!54371 m!209141))

(declare-fun m!209143 () Bool)

(assert (=> d!54371 m!209143))

(declare-fun m!209145 () Bool)

(assert (=> d!54371 m!209145))

(declare-fun m!209147 () Bool)

(assert (=> b!181762 m!209147))

(declare-fun m!209149 () Bool)

(assert (=> b!181763 m!209149))

(assert (=> b!181551 d!54371))

(declare-fun d!54373 () Bool)

(declare-fun e!119696 () Bool)

(assert (=> d!54373 e!119696))

(declare-fun res!86012 () Bool)

(assert (=> d!54373 (=> (not res!86012) (not e!119696))))

(declare-fun lt!89785 () ListLongMap!2271)

(assert (=> d!54373 (= res!86012 (contains!1237 lt!89785 (_1!1692 (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))

(declare-fun lt!89784 () List!2306)

(assert (=> d!54373 (= lt!89785 (ListLongMap!2272 lt!89784))))

(declare-fun lt!89782 () Unit!5487)

(declare-fun lt!89783 () Unit!5487)

(assert (=> d!54373 (= lt!89782 lt!89783)))

(assert (=> d!54373 (= (getValueByKey!208 lt!89784 (_1!1692 (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))) (Some!213 (_2!1692 (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))

(assert (=> d!54373 (= lt!89783 (lemmaContainsTupThenGetReturnValue!112 lt!89784 (_1!1692 (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))) (_2!1692 (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))

(assert (=> d!54373 (= lt!89784 (insertStrictlySorted!115 (toList!1151 call!18340) (_1!1692 (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))) (_2!1692 (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))))))

(assert (=> d!54373 (= (+!270 call!18340 (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))) lt!89785)))

(declare-fun b!181764 () Bool)

(declare-fun res!86011 () Bool)

(assert (=> b!181764 (=> (not res!86011) (not e!119696))))

(assert (=> b!181764 (= res!86011 (= (getValueByKey!208 (toList!1151 lt!89785) (_1!1692 (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248)))) (Some!213 (_2!1692 (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))))

(declare-fun b!181765 () Bool)

(assert (=> b!181765 (= e!119696 (contains!1238 (toList!1151 lt!89785) (tuple2!3363 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3561 thiss!1248))))))

(assert (= (and d!54373 res!86012) b!181764))

(assert (= (and b!181764 res!86011) b!181765))

(declare-fun m!209151 () Bool)

(assert (=> d!54373 m!209151))

(declare-fun m!209153 () Bool)

(assert (=> d!54373 m!209153))

(declare-fun m!209155 () Bool)

(assert (=> d!54373 m!209155))

(declare-fun m!209157 () Bool)

(assert (=> d!54373 m!209157))

(declare-fun m!209159 () Bool)

(assert (=> b!181764 m!209159))

(declare-fun m!209161 () Bool)

(assert (=> b!181765 m!209161))

(assert (=> b!181542 d!54373))

(assert (=> bm!18336 d!54367))

(declare-fun d!54375 () Bool)

(assert (=> d!54375 (= (apply!153 lt!89678 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2077 (getValueByKey!208 (toList!1151 lt!89678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7396 () Bool)

(assert (= bs!7396 d!54375))

(declare-fun m!209163 () Bool)

(assert (=> bs!7396 m!209163))

(assert (=> bs!7396 m!209163))

(declare-fun m!209165 () Bool)

(assert (=> bs!7396 m!209165))

(assert (=> b!181536 d!54375))

(declare-fun d!54377 () Bool)

(declare-fun e!119697 () Bool)

(assert (=> d!54377 e!119697))

(declare-fun res!86013 () Bool)

(assert (=> d!54377 (=> res!86013 e!119697)))

(declare-fun lt!89787 () Bool)

(assert (=> d!54377 (= res!86013 (not lt!89787))))

(declare-fun lt!89788 () Bool)

(assert (=> d!54377 (= lt!89787 lt!89788)))

(declare-fun lt!89786 () Unit!5487)

(declare-fun e!119698 () Unit!5487)

(assert (=> d!54377 (= lt!89786 e!119698)))

(declare-fun c!32593 () Bool)

(assert (=> d!54377 (= c!32593 lt!89788)))

(assert (=> d!54377 (= lt!89788 (containsKey!212 (toList!1151 lt!89678) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54377 (= (contains!1237 lt!89678 #b1000000000000000000000000000000000000000000000000000000000000000) lt!89787)))

(declare-fun b!181766 () Bool)

(declare-fun lt!89789 () Unit!5487)

(assert (=> b!181766 (= e!119698 lt!89789)))

(assert (=> b!181766 (= lt!89789 (lemmaContainsKeyImpliesGetValueByKeyDefined!161 (toList!1151 lt!89678) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181766 (isDefined!162 (getValueByKey!208 (toList!1151 lt!89678) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181767 () Bool)

(declare-fun Unit!5492 () Unit!5487)

(assert (=> b!181767 (= e!119698 Unit!5492)))

(declare-fun b!181768 () Bool)

(assert (=> b!181768 (= e!119697 (isDefined!162 (getValueByKey!208 (toList!1151 lt!89678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54377 c!32593) b!181766))

(assert (= (and d!54377 (not c!32593)) b!181767))

(assert (= (and d!54377 (not res!86013)) b!181768))

(declare-fun m!209167 () Bool)

(assert (=> d!54377 m!209167))

(declare-fun m!209169 () Bool)

(assert (=> b!181766 m!209169))

(assert (=> b!181766 m!208999))

(assert (=> b!181766 m!208999))

(declare-fun m!209171 () Bool)

(assert (=> b!181766 m!209171))

(assert (=> b!181768 m!208999))

(assert (=> b!181768 m!208999))

(assert (=> b!181768 m!209171))

(assert (=> bm!18337 d!54377))

(declare-fun b!181777 () Bool)

(declare-fun e!119704 () (_ BitVec 32))

(assert (=> b!181777 (= e!119704 #b00000000000000000000000000000000)))

(declare-fun bm!18349 () Bool)

(declare-fun call!18352 () (_ BitVec 32))

(assert (=> bm!18349 (= call!18352 (arrayCountValidKeys!0 (_keys!5622 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3939 (_keys!5622 thiss!1248))))))

(declare-fun b!181778 () Bool)

(declare-fun e!119703 () (_ BitVec 32))

(assert (=> b!181778 (= e!119703 (bvadd #b00000000000000000000000000000001 call!18352))))

(declare-fun d!54379 () Bool)

(declare-fun lt!89792 () (_ BitVec 32))

(assert (=> d!54379 (and (bvsge lt!89792 #b00000000000000000000000000000000) (bvsle lt!89792 (bvsub (size!3939 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54379 (= lt!89792 e!119704)))

(declare-fun c!32598 () Bool)

(assert (=> d!54379 (= c!32598 (bvsge #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))))))

(assert (=> d!54379 (and (bvsle #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3939 (_keys!5622 thiss!1248)) (size!3939 (_keys!5622 thiss!1248))))))

(assert (=> d!54379 (= (arrayCountValidKeys!0 (_keys!5622 thiss!1248) #b00000000000000000000000000000000 (size!3939 (_keys!5622 thiss!1248))) lt!89792)))

(declare-fun b!181779 () Bool)

(assert (=> b!181779 (= e!119703 call!18352)))

(declare-fun b!181780 () Bool)

(assert (=> b!181780 (= e!119704 e!119703)))

(declare-fun c!32599 () Bool)

(assert (=> b!181780 (= c!32599 (validKeyInArray!0 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54379 c!32598) b!181777))

(assert (= (and d!54379 (not c!32598)) b!181780))

(assert (= (and b!181780 c!32599) b!181778))

(assert (= (and b!181780 (not c!32599)) b!181779))

(assert (= (or b!181778 b!181779) bm!18349))

(declare-fun m!209173 () Bool)

(assert (=> bm!18349 m!209173))

(assert (=> b!181780 m!208895))

(assert (=> b!181780 m!208895))

(assert (=> b!181780 m!208909))

(assert (=> b!181582 d!54379))

(declare-fun d!54381 () Bool)

(declare-fun e!119705 () Bool)

(assert (=> d!54381 e!119705))

(declare-fun res!86014 () Bool)

(assert (=> d!54381 (=> res!86014 e!119705)))

(declare-fun lt!89794 () Bool)

(assert (=> d!54381 (= res!86014 (not lt!89794))))

(declare-fun lt!89795 () Bool)

(assert (=> d!54381 (= lt!89794 lt!89795)))

(declare-fun lt!89793 () Unit!5487)

(declare-fun e!119706 () Unit!5487)

(assert (=> d!54381 (= lt!89793 e!119706)))

(declare-fun c!32600 () Bool)

(assert (=> d!54381 (= c!32600 lt!89795)))

(assert (=> d!54381 (= lt!89795 (containsKey!212 (toList!1151 lt!89678) (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54381 (= (contains!1237 lt!89678 (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)) lt!89794)))

(declare-fun b!181781 () Bool)

(declare-fun lt!89796 () Unit!5487)

(assert (=> b!181781 (= e!119706 lt!89796)))

(assert (=> b!181781 (= lt!89796 (lemmaContainsKeyImpliesGetValueByKeyDefined!161 (toList!1151 lt!89678) (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181781 (isDefined!162 (getValueByKey!208 (toList!1151 lt!89678) (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181782 () Bool)

(declare-fun Unit!5493 () Unit!5487)

(assert (=> b!181782 (= e!119706 Unit!5493)))

(declare-fun b!181783 () Bool)

(assert (=> b!181783 (= e!119705 (isDefined!162 (getValueByKey!208 (toList!1151 lt!89678) (select (arr!3628 (_keys!5622 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54381 c!32600) b!181781))

(assert (= (and d!54381 (not c!32600)) b!181782))

(assert (= (and d!54381 (not res!86014)) b!181783))

(assert (=> d!54381 m!208895))

(declare-fun m!209175 () Bool)

(assert (=> d!54381 m!209175))

(assert (=> b!181781 m!208895))

(declare-fun m!209177 () Bool)

(assert (=> b!181781 m!209177))

(assert (=> b!181781 m!208895))

(assert (=> b!181781 m!209017))

(assert (=> b!181781 m!209017))

(declare-fun m!209179 () Bool)

(assert (=> b!181781 m!209179))

(assert (=> b!181783 m!208895))

(assert (=> b!181783 m!209017))

(assert (=> b!181783 m!209017))

(assert (=> b!181783 m!209179))

(assert (=> b!181543 d!54381))

(assert (=> b!181492 d!54315))

(assert (=> b!181492 d!54317))

(declare-fun d!54383 () Bool)

(declare-fun e!119707 () Bool)

(assert (=> d!54383 e!119707))

(declare-fun res!86015 () Bool)

(assert (=> d!54383 (=> res!86015 e!119707)))

(declare-fun lt!89798 () Bool)

(assert (=> d!54383 (= res!86015 (not lt!89798))))

(declare-fun lt!89799 () Bool)

(assert (=> d!54383 (= lt!89798 lt!89799)))

(declare-fun lt!89797 () Unit!5487)

(declare-fun e!119708 () Unit!5487)

(assert (=> d!54383 (= lt!89797 e!119708)))

(declare-fun c!32601 () Bool)

(assert (=> d!54383 (= c!32601 lt!89799)))

(assert (=> d!54383 (= lt!89799 (containsKey!212 (toList!1151 lt!89678) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54383 (= (contains!1237 lt!89678 #b0000000000000000000000000000000000000000000000000000000000000000) lt!89798)))

(declare-fun b!181784 () Bool)

(declare-fun lt!89800 () Unit!5487)

(assert (=> b!181784 (= e!119708 lt!89800)))

(assert (=> b!181784 (= lt!89800 (lemmaContainsKeyImpliesGetValueByKeyDefined!161 (toList!1151 lt!89678) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181784 (isDefined!162 (getValueByKey!208 (toList!1151 lt!89678) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181785 () Bool)

(declare-fun Unit!5494 () Unit!5487)

(assert (=> b!181785 (= e!119708 Unit!5494)))

(declare-fun b!181786 () Bool)

(assert (=> b!181786 (= e!119707 (isDefined!162 (getValueByKey!208 (toList!1151 lt!89678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54383 c!32601) b!181784))

(assert (= (and d!54383 (not c!32601)) b!181785))

(assert (= (and d!54383 (not res!86015)) b!181786))

(declare-fun m!209181 () Bool)

(assert (=> d!54383 m!209181))

(declare-fun m!209183 () Bool)

(assert (=> b!181784 m!209183))

(assert (=> b!181784 m!209163))

(assert (=> b!181784 m!209163))

(declare-fun m!209185 () Bool)

(assert (=> b!181784 m!209185))

(assert (=> b!181786 m!209163))

(assert (=> b!181786 m!209163))

(assert (=> b!181786 m!209185))

(assert (=> bm!18334 d!54383))

(declare-fun mapNonEmpty!7306 () Bool)

(declare-fun mapRes!7306 () Bool)

(declare-fun tp!16216 () Bool)

(declare-fun e!119710 () Bool)

(assert (=> mapNonEmpty!7306 (= mapRes!7306 (and tp!16216 e!119710))))

(declare-fun mapRest!7306 () (Array (_ BitVec 32) ValueCell!1784))

(declare-fun mapValue!7306 () ValueCell!1784)

(declare-fun mapKey!7306 () (_ BitVec 32))

(assert (=> mapNonEmpty!7306 (= mapRest!7305 (store mapRest!7306 mapKey!7306 mapValue!7306))))

(declare-fun mapIsEmpty!7306 () Bool)

(assert (=> mapIsEmpty!7306 mapRes!7306))

(declare-fun b!181787 () Bool)

(assert (=> b!181787 (= e!119710 tp_is_empty!4255)))

(declare-fun b!181788 () Bool)

(declare-fun e!119709 () Bool)

(assert (=> b!181788 (= e!119709 tp_is_empty!4255)))

(declare-fun condMapEmpty!7306 () Bool)

(declare-fun mapDefault!7306 () ValueCell!1784)

(assert (=> mapNonEmpty!7305 (= condMapEmpty!7306 (= mapRest!7305 ((as const (Array (_ BitVec 32) ValueCell!1784)) mapDefault!7306)))))

(assert (=> mapNonEmpty!7305 (= tp!16215 (and e!119709 mapRes!7306))))

(assert (= (and mapNonEmpty!7305 condMapEmpty!7306) mapIsEmpty!7306))

(assert (= (and mapNonEmpty!7305 (not condMapEmpty!7306)) mapNonEmpty!7306))

(assert (= (and mapNonEmpty!7306 ((_ is ValueCellFull!1784) mapValue!7306)) b!181787))

(assert (= (and mapNonEmpty!7305 ((_ is ValueCellFull!1784) mapDefault!7306)) b!181788))

(declare-fun m!209187 () Bool)

(assert (=> mapNonEmpty!7306 m!209187))

(declare-fun b_lambda!7141 () Bool)

(assert (= b_lambda!7137 (or (and b!181426 b_free!4483) b_lambda!7141)))

(declare-fun b_lambda!7143 () Bool)

(assert (= b_lambda!7139 (or (and b!181426 b_free!4483) b_lambda!7143)))

(check-sat (not d!54381) (not d!54319) (not b!181598) (not d!54339) (not b!181652) (not b_next!4483) (not d!54377) (not b!181719) (not b!181678) (not b!181679) (not d!54355) (not d!54349) (not d!54365) (not b!181708) (not b!181723) (not d!54353) (not b!181635) (not d!54383) (not b!181766) (not d!54359) (not b!181780) (not b!181597) (not d!54375) (not b!181752) (not d!54341) (not b!181786) (not b!181707) (not b!181756) (not d!54343) (not d!54357) (not b!181759) (not b!181714) (not b!181760) (not b!181748) (not b!181784) (not b!181763) (not d!54369) b_and!11017 (not d!54347) (not d!54337) (not b!181720) (not b_lambda!7143) (not d!54333) (not b!181781) (not b!181653) (not b!181673) (not d!54373) (not d!54315) (not b_lambda!7135) (not b!181768) (not b!181762) (not b!181764) (not bm!18349) (not bm!18346) (not b!181755) (not b!181757) (not d!54345) (not b!181722) (not bm!18340) (not b!181612) tp_is_empty!4255 (not b!181692) (not d!54367) (not d!54313) (not bm!18343) (not d!54371) (not b!181651) (not b!181783) (not d!54361) (not b!181661) (not b!181753) (not b!181716) (not b!181765) (not b!181601) (not b!181761) (not b!181671) (not mapNonEmpty!7306) (not b_lambda!7141) (not d!54311) (not d!54323) (not d!54351) (not d!54363) (not b!181754))
(check-sat b_and!11017 (not b_next!4483))
