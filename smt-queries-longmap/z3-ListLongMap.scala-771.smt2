; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18144 () Bool)

(assert start!18144)

(declare-fun b!180463 () Bool)

(declare-fun b_free!4465 () Bool)

(declare-fun b_next!4465 () Bool)

(assert (=> b!180463 (= b_free!4465 (not b_next!4465))))

(declare-fun tp!16134 () Bool)

(declare-fun b_and!10975 () Bool)

(assert (=> b!180463 (= tp!16134 b_and!10975)))

(declare-fun b!180459 () Bool)

(declare-fun res!85443 () Bool)

(declare-fun e!118874 () Bool)

(assert (=> b!180459 (=> (not res!85443) (not e!118874))))

(declare-datatypes ((V!5297 0))(
  ( (V!5298 (val!2163 Int)) )
))
(declare-datatypes ((ValueCell!1775 0))(
  ( (ValueCellFull!1775 (v!4051 V!5297)) (EmptyCell!1775) )
))
(declare-datatypes ((array!7629 0))(
  ( (array!7630 (arr!3610 (Array (_ BitVec 32) (_ BitVec 64))) (size!3919 (_ BitVec 32))) )
))
(declare-datatypes ((array!7631 0))(
  ( (array!7632 (arr!3611 (Array (_ BitVec 32) ValueCell!1775)) (size!3920 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2458 0))(
  ( (LongMapFixedSize!2459 (defaultEntry!3706 Int) (mask!8710 (_ BitVec 32)) (extraKeys!3443 (_ BitVec 32)) (zeroValue!3547 V!5297) (minValue!3547 V!5297) (_size!1278 (_ BitVec 32)) (_keys!5599 array!7629) (_values!3689 array!7631) (_vacant!1278 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2458)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!180459 (= res!85443 (validMask!0 (mask!8710 thiss!1248)))))

(declare-fun b!180460 () Bool)

(assert (=> b!180460 (= e!118874 (not (= (size!3920 (_values!3689 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8710 thiss!1248)))))))

(declare-fun b!180461 () Bool)

(declare-fun e!118879 () Bool)

(assert (=> b!180461 (= e!118879 e!118874)))

(declare-fun res!85445 () Bool)

(assert (=> b!180461 (=> (not res!85445) (not e!118874))))

(declare-datatypes ((SeekEntryResult!603 0))(
  ( (MissingZero!603 (index!4582 (_ BitVec 32))) (Found!603 (index!4583 (_ BitVec 32))) (Intermediate!603 (undefined!1415 Bool) (index!4584 (_ BitVec 32)) (x!19754 (_ BitVec 32))) (Undefined!603) (MissingVacant!603 (index!4585 (_ BitVec 32))) )
))
(declare-fun lt!89089 () SeekEntryResult!603)

(get-info :version)

(assert (=> b!180461 (= res!85445 (and (not ((_ is Undefined!603) lt!89089)) (not ((_ is MissingVacant!603) lt!89089)) (not ((_ is MissingZero!603) lt!89089)) ((_ is Found!603) lt!89089)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7629 (_ BitVec 32)) SeekEntryResult!603)

(assert (=> b!180461 (= lt!89089 (seekEntryOrOpen!0 key!828 (_keys!5599 thiss!1248) (mask!8710 thiss!1248)))))

(declare-fun b!180462 () Bool)

(declare-fun res!85441 () Bool)

(assert (=> b!180462 (=> (not res!85441) (not e!118879))))

(assert (=> b!180462 (= res!85441 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7258 () Bool)

(declare-fun mapRes!7258 () Bool)

(assert (=> mapIsEmpty!7258 mapRes!7258))

(declare-fun e!118878 () Bool)

(declare-fun e!118873 () Bool)

(declare-fun tp_is_empty!4237 () Bool)

(declare-fun array_inv!2335 (array!7629) Bool)

(declare-fun array_inv!2336 (array!7631) Bool)

(assert (=> b!180463 (= e!118873 (and tp!16134 tp_is_empty!4237 (array_inv!2335 (_keys!5599 thiss!1248)) (array_inv!2336 (_values!3689 thiss!1248)) e!118878))))

(declare-fun b!180464 () Bool)

(declare-fun e!118877 () Bool)

(assert (=> b!180464 (= e!118877 tp_is_empty!4237)))

(declare-fun b!180465 () Bool)

(declare-fun e!118876 () Bool)

(assert (=> b!180465 (= e!118876 tp_is_empty!4237)))

(declare-fun b!180466 () Bool)

(assert (=> b!180466 (= e!118878 (and e!118876 mapRes!7258))))

(declare-fun condMapEmpty!7258 () Bool)

(declare-fun mapDefault!7258 () ValueCell!1775)

(assert (=> b!180466 (= condMapEmpty!7258 (= (arr!3611 (_values!3689 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1775)) mapDefault!7258)))))

(declare-fun res!85442 () Bool)

(assert (=> start!18144 (=> (not res!85442) (not e!118879))))

(declare-fun valid!1040 (LongMapFixedSize!2458) Bool)

(assert (=> start!18144 (= res!85442 (valid!1040 thiss!1248))))

(assert (=> start!18144 e!118879))

(assert (=> start!18144 e!118873))

(assert (=> start!18144 true))

(declare-fun mapNonEmpty!7258 () Bool)

(declare-fun tp!16135 () Bool)

(assert (=> mapNonEmpty!7258 (= mapRes!7258 (and tp!16135 e!118877))))

(declare-fun mapKey!7258 () (_ BitVec 32))

(declare-fun mapValue!7258 () ValueCell!1775)

(declare-fun mapRest!7258 () (Array (_ BitVec 32) ValueCell!1775))

(assert (=> mapNonEmpty!7258 (= (arr!3611 (_values!3689 thiss!1248)) (store mapRest!7258 mapKey!7258 mapValue!7258))))

(declare-fun b!180467 () Bool)

(declare-fun res!85444 () Bool)

(assert (=> b!180467 (=> (not res!85444) (not e!118874))))

(declare-datatypes ((tuple2!3348 0))(
  ( (tuple2!3349 (_1!1685 (_ BitVec 64)) (_2!1685 V!5297)) )
))
(declare-datatypes ((List!2296 0))(
  ( (Nil!2293) (Cons!2292 (h!2917 tuple2!3348) (t!7137 List!2296)) )
))
(declare-datatypes ((ListLongMap!2257 0))(
  ( (ListLongMap!2258 (toList!1144 List!2296)) )
))
(declare-fun contains!1226 (ListLongMap!2257 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!777 (array!7629 array!7631 (_ BitVec 32) (_ BitVec 32) V!5297 V!5297 (_ BitVec 32) Int) ListLongMap!2257)

(assert (=> b!180467 (= res!85444 (contains!1226 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)) key!828))))

(assert (= (and start!18144 res!85442) b!180462))

(assert (= (and b!180462 res!85441) b!180461))

(assert (= (and b!180461 res!85445) b!180467))

(assert (= (and b!180467 res!85444) b!180459))

(assert (= (and b!180459 res!85443) b!180460))

(assert (= (and b!180466 condMapEmpty!7258) mapIsEmpty!7258))

(assert (= (and b!180466 (not condMapEmpty!7258)) mapNonEmpty!7258))

(assert (= (and mapNonEmpty!7258 ((_ is ValueCellFull!1775) mapValue!7258)) b!180464))

(assert (= (and b!180466 ((_ is ValueCellFull!1775) mapDefault!7258)) b!180465))

(assert (= b!180463 b!180466))

(assert (= start!18144 b!180463))

(declare-fun m!207983 () Bool)

(assert (=> b!180461 m!207983))

(declare-fun m!207985 () Bool)

(assert (=> b!180467 m!207985))

(assert (=> b!180467 m!207985))

(declare-fun m!207987 () Bool)

(assert (=> b!180467 m!207987))

(declare-fun m!207989 () Bool)

(assert (=> b!180463 m!207989))

(declare-fun m!207991 () Bool)

(assert (=> b!180463 m!207991))

(declare-fun m!207993 () Bool)

(assert (=> b!180459 m!207993))

(declare-fun m!207995 () Bool)

(assert (=> mapNonEmpty!7258 m!207995))

(declare-fun m!207997 () Bool)

(assert (=> start!18144 m!207997))

(check-sat (not b!180461) b_and!10975 (not b!180459) (not b_next!4465) tp_is_empty!4237 (not b!180467) (not mapNonEmpty!7258) (not b!180463) (not start!18144))
(check-sat b_and!10975 (not b_next!4465))
(get-model)

(declare-fun b!180534 () Bool)

(declare-fun e!118930 () SeekEntryResult!603)

(declare-fun lt!89104 () SeekEntryResult!603)

(assert (=> b!180534 (= e!118930 (Found!603 (index!4584 lt!89104)))))

(declare-fun b!180535 () Bool)

(declare-fun e!118928 () SeekEntryResult!603)

(assert (=> b!180535 (= e!118928 (MissingZero!603 (index!4584 lt!89104)))))

(declare-fun b!180536 () Bool)

(declare-fun c!32325 () Bool)

(declare-fun lt!89103 () (_ BitVec 64))

(assert (=> b!180536 (= c!32325 (= lt!89103 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180536 (= e!118930 e!118928)))

(declare-fun d!54101 () Bool)

(declare-fun lt!89102 () SeekEntryResult!603)

(assert (=> d!54101 (and (or ((_ is Undefined!603) lt!89102) (not ((_ is Found!603) lt!89102)) (and (bvsge (index!4583 lt!89102) #b00000000000000000000000000000000) (bvslt (index!4583 lt!89102) (size!3919 (_keys!5599 thiss!1248))))) (or ((_ is Undefined!603) lt!89102) ((_ is Found!603) lt!89102) (not ((_ is MissingZero!603) lt!89102)) (and (bvsge (index!4582 lt!89102) #b00000000000000000000000000000000) (bvslt (index!4582 lt!89102) (size!3919 (_keys!5599 thiss!1248))))) (or ((_ is Undefined!603) lt!89102) ((_ is Found!603) lt!89102) ((_ is MissingZero!603) lt!89102) (not ((_ is MissingVacant!603) lt!89102)) (and (bvsge (index!4585 lt!89102) #b00000000000000000000000000000000) (bvslt (index!4585 lt!89102) (size!3919 (_keys!5599 thiss!1248))))) (or ((_ is Undefined!603) lt!89102) (ite ((_ is Found!603) lt!89102) (= (select (arr!3610 (_keys!5599 thiss!1248)) (index!4583 lt!89102)) key!828) (ite ((_ is MissingZero!603) lt!89102) (= (select (arr!3610 (_keys!5599 thiss!1248)) (index!4582 lt!89102)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!603) lt!89102) (= (select (arr!3610 (_keys!5599 thiss!1248)) (index!4585 lt!89102)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!118929 () SeekEntryResult!603)

(assert (=> d!54101 (= lt!89102 e!118929)))

(declare-fun c!32324 () Bool)

(assert (=> d!54101 (= c!32324 (and ((_ is Intermediate!603) lt!89104) (undefined!1415 lt!89104)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7629 (_ BitVec 32)) SeekEntryResult!603)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54101 (= lt!89104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8710 thiss!1248)) key!828 (_keys!5599 thiss!1248) (mask!8710 thiss!1248)))))

(assert (=> d!54101 (validMask!0 (mask!8710 thiss!1248))))

(assert (=> d!54101 (= (seekEntryOrOpen!0 key!828 (_keys!5599 thiss!1248) (mask!8710 thiss!1248)) lt!89102)))

(declare-fun b!180537 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7629 (_ BitVec 32)) SeekEntryResult!603)

(assert (=> b!180537 (= e!118928 (seekKeyOrZeroReturnVacant!0 (x!19754 lt!89104) (index!4584 lt!89104) (index!4584 lt!89104) key!828 (_keys!5599 thiss!1248) (mask!8710 thiss!1248)))))

(declare-fun b!180538 () Bool)

(assert (=> b!180538 (= e!118929 Undefined!603)))

(declare-fun b!180539 () Bool)

(assert (=> b!180539 (= e!118929 e!118930)))

(assert (=> b!180539 (= lt!89103 (select (arr!3610 (_keys!5599 thiss!1248)) (index!4584 lt!89104)))))

(declare-fun c!32323 () Bool)

(assert (=> b!180539 (= c!32323 (= lt!89103 key!828))))

(assert (= (and d!54101 c!32324) b!180538))

(assert (= (and d!54101 (not c!32324)) b!180539))

(assert (= (and b!180539 c!32323) b!180534))

(assert (= (and b!180539 (not c!32323)) b!180536))

(assert (= (and b!180536 c!32325) b!180535))

(assert (= (and b!180536 (not c!32325)) b!180537))

(declare-fun m!208031 () Bool)

(assert (=> d!54101 m!208031))

(declare-fun m!208033 () Bool)

(assert (=> d!54101 m!208033))

(assert (=> d!54101 m!207993))

(declare-fun m!208035 () Bool)

(assert (=> d!54101 m!208035))

(declare-fun m!208037 () Bool)

(assert (=> d!54101 m!208037))

(assert (=> d!54101 m!208033))

(declare-fun m!208039 () Bool)

(assert (=> d!54101 m!208039))

(declare-fun m!208041 () Bool)

(assert (=> b!180537 m!208041))

(declare-fun m!208043 () Bool)

(assert (=> b!180539 m!208043))

(assert (=> b!180461 d!54101))

(declare-fun d!54103 () Bool)

(declare-fun res!85482 () Bool)

(declare-fun e!118933 () Bool)

(assert (=> d!54103 (=> (not res!85482) (not e!118933))))

(declare-fun simpleValid!166 (LongMapFixedSize!2458) Bool)

(assert (=> d!54103 (= res!85482 (simpleValid!166 thiss!1248))))

(assert (=> d!54103 (= (valid!1040 thiss!1248) e!118933)))

(declare-fun b!180546 () Bool)

(declare-fun res!85483 () Bool)

(assert (=> b!180546 (=> (not res!85483) (not e!118933))))

(declare-fun arrayCountValidKeys!0 (array!7629 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180546 (= res!85483 (= (arrayCountValidKeys!0 (_keys!5599 thiss!1248) #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))) (_size!1278 thiss!1248)))))

(declare-fun b!180547 () Bool)

(declare-fun res!85484 () Bool)

(assert (=> b!180547 (=> (not res!85484) (not e!118933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7629 (_ BitVec 32)) Bool)

(assert (=> b!180547 (= res!85484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5599 thiss!1248) (mask!8710 thiss!1248)))))

(declare-fun b!180548 () Bool)

(declare-datatypes ((List!2299 0))(
  ( (Nil!2296) (Cons!2295 (h!2920 (_ BitVec 64)) (t!7142 List!2299)) )
))
(declare-fun arrayNoDuplicates!0 (array!7629 (_ BitVec 32) List!2299) Bool)

(assert (=> b!180548 (= e!118933 (arrayNoDuplicates!0 (_keys!5599 thiss!1248) #b00000000000000000000000000000000 Nil!2296))))

(assert (= (and d!54103 res!85482) b!180546))

(assert (= (and b!180546 res!85483) b!180547))

(assert (= (and b!180547 res!85484) b!180548))

(declare-fun m!208045 () Bool)

(assert (=> d!54103 m!208045))

(declare-fun m!208047 () Bool)

(assert (=> b!180546 m!208047))

(declare-fun m!208049 () Bool)

(assert (=> b!180547 m!208049))

(declare-fun m!208051 () Bool)

(assert (=> b!180548 m!208051))

(assert (=> start!18144 d!54103))

(declare-fun d!54105 () Bool)

(assert (=> d!54105 (= (array_inv!2335 (_keys!5599 thiss!1248)) (bvsge (size!3919 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180463 d!54105))

(declare-fun d!54107 () Bool)

(assert (=> d!54107 (= (array_inv!2336 (_values!3689 thiss!1248)) (bvsge (size!3920 (_values!3689 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180463 d!54107))

(declare-fun d!54109 () Bool)

(declare-fun e!118939 () Bool)

(assert (=> d!54109 e!118939))

(declare-fun res!85487 () Bool)

(assert (=> d!54109 (=> res!85487 e!118939)))

(declare-fun lt!89114 () Bool)

(assert (=> d!54109 (= res!85487 (not lt!89114))))

(declare-fun lt!89116 () Bool)

(assert (=> d!54109 (= lt!89114 lt!89116)))

(declare-datatypes ((Unit!5467 0))(
  ( (Unit!5468) )
))
(declare-fun lt!89115 () Unit!5467)

(declare-fun e!118938 () Unit!5467)

(assert (=> d!54109 (= lt!89115 e!118938)))

(declare-fun c!32328 () Bool)

(assert (=> d!54109 (= c!32328 lt!89116)))

(declare-fun containsKey!209 (List!2296 (_ BitVec 64)) Bool)

(assert (=> d!54109 (= lt!89116 (containsKey!209 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))

(assert (=> d!54109 (= (contains!1226 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)) key!828) lt!89114)))

(declare-fun b!180555 () Bool)

(declare-fun lt!89113 () Unit!5467)

(assert (=> b!180555 (= e!118938 lt!89113)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!158 (List!2296 (_ BitVec 64)) Unit!5467)

(assert (=> b!180555 (= lt!89113 (lemmaContainsKeyImpliesGetValueByKeyDefined!158 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))

(declare-datatypes ((Option!211 0))(
  ( (Some!210 (v!4054 V!5297)) (None!209) )
))
(declare-fun isDefined!159 (Option!211) Bool)

(declare-fun getValueByKey!205 (List!2296 (_ BitVec 64)) Option!211)

(assert (=> b!180555 (isDefined!159 (getValueByKey!205 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))

(declare-fun b!180556 () Bool)

(declare-fun Unit!5469 () Unit!5467)

(assert (=> b!180556 (= e!118938 Unit!5469)))

(declare-fun b!180557 () Bool)

(assert (=> b!180557 (= e!118939 (isDefined!159 (getValueByKey!205 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828)))))

(assert (= (and d!54109 c!32328) b!180555))

(assert (= (and d!54109 (not c!32328)) b!180556))

(assert (= (and d!54109 (not res!85487)) b!180557))

(declare-fun m!208053 () Bool)

(assert (=> d!54109 m!208053))

(declare-fun m!208055 () Bool)

(assert (=> b!180555 m!208055))

(declare-fun m!208057 () Bool)

(assert (=> b!180555 m!208057))

(assert (=> b!180555 m!208057))

(declare-fun m!208059 () Bool)

(assert (=> b!180555 m!208059))

(assert (=> b!180557 m!208057))

(assert (=> b!180557 m!208057))

(assert (=> b!180557 m!208059))

(assert (=> b!180467 d!54109))

(declare-fun b!180601 () Bool)

(declare-fun e!118973 () Bool)

(declare-fun lt!89175 () ListLongMap!2257)

(declare-fun apply!150 (ListLongMap!2257 (_ BitVec 64)) V!5297)

(assert (=> b!180601 (= e!118973 (= (apply!150 lt!89175 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3547 thiss!1248)))))

(declare-fun b!180602 () Bool)

(declare-fun e!118969 () ListLongMap!2257)

(declare-fun call!18248 () ListLongMap!2257)

(assert (=> b!180602 (= e!118969 call!18248)))

(declare-fun b!180603 () Bool)

(declare-fun e!118972 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!180603 (= e!118972 (validKeyInArray!0 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180604 () Bool)

(declare-fun e!118975 () Bool)

(declare-fun get!2061 (ValueCell!1775 V!5297) V!5297)

(declare-fun dynLambda!484 (Int (_ BitVec 64)) V!5297)

(assert (=> b!180604 (= e!118975 (= (apply!150 lt!89175 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)) (get!2061 (select (arr!3611 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!180604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3920 (_values!3689 thiss!1248))))))

(assert (=> b!180604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))))))

(declare-fun bm!18244 () Bool)

(declare-fun call!18252 () Bool)

(assert (=> bm!18244 (= call!18252 (contains!1226 lt!89175 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180605 () Bool)

(declare-fun e!118971 () Unit!5467)

(declare-fun lt!89164 () Unit!5467)

(assert (=> b!180605 (= e!118971 lt!89164)))

(declare-fun lt!89178 () ListLongMap!2257)

(declare-fun getCurrentListMapNoExtraKeys!171 (array!7629 array!7631 (_ BitVec 32) (_ BitVec 32) V!5297 V!5297 (_ BitVec 32) Int) ListLongMap!2257)

(assert (=> b!180605 (= lt!89178 (getCurrentListMapNoExtraKeys!171 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))

(declare-fun lt!89163 () (_ BitVec 64))

(assert (=> b!180605 (= lt!89163 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89177 () (_ BitVec 64))

(assert (=> b!180605 (= lt!89177 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89172 () Unit!5467)

(declare-fun addStillContains!126 (ListLongMap!2257 (_ BitVec 64) V!5297 (_ BitVec 64)) Unit!5467)

(assert (=> b!180605 (= lt!89172 (addStillContains!126 lt!89178 lt!89163 (zeroValue!3547 thiss!1248) lt!89177))))

(declare-fun +!267 (ListLongMap!2257 tuple2!3348) ListLongMap!2257)

(assert (=> b!180605 (contains!1226 (+!267 lt!89178 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248))) lt!89177)))

(declare-fun lt!89162 () Unit!5467)

(assert (=> b!180605 (= lt!89162 lt!89172)))

(declare-fun lt!89165 () ListLongMap!2257)

(assert (=> b!180605 (= lt!89165 (getCurrentListMapNoExtraKeys!171 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))

(declare-fun lt!89182 () (_ BitVec 64))

(assert (=> b!180605 (= lt!89182 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89166 () (_ BitVec 64))

(assert (=> b!180605 (= lt!89166 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89171 () Unit!5467)

(declare-fun addApplyDifferent!126 (ListLongMap!2257 (_ BitVec 64) V!5297 (_ BitVec 64)) Unit!5467)

(assert (=> b!180605 (= lt!89171 (addApplyDifferent!126 lt!89165 lt!89182 (minValue!3547 thiss!1248) lt!89166))))

(assert (=> b!180605 (= (apply!150 (+!267 lt!89165 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248))) lt!89166) (apply!150 lt!89165 lt!89166))))

(declare-fun lt!89180 () Unit!5467)

(assert (=> b!180605 (= lt!89180 lt!89171)))

(declare-fun lt!89179 () ListLongMap!2257)

(assert (=> b!180605 (= lt!89179 (getCurrentListMapNoExtraKeys!171 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))

(declare-fun lt!89176 () (_ BitVec 64))

(assert (=> b!180605 (= lt!89176 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89174 () (_ BitVec 64))

(assert (=> b!180605 (= lt!89174 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89173 () Unit!5467)

(assert (=> b!180605 (= lt!89173 (addApplyDifferent!126 lt!89179 lt!89176 (zeroValue!3547 thiss!1248) lt!89174))))

(assert (=> b!180605 (= (apply!150 (+!267 lt!89179 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248))) lt!89174) (apply!150 lt!89179 lt!89174))))

(declare-fun lt!89168 () Unit!5467)

(assert (=> b!180605 (= lt!89168 lt!89173)))

(declare-fun lt!89167 () ListLongMap!2257)

(assert (=> b!180605 (= lt!89167 (getCurrentListMapNoExtraKeys!171 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))

(declare-fun lt!89181 () (_ BitVec 64))

(assert (=> b!180605 (= lt!89181 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89169 () (_ BitVec 64))

(assert (=> b!180605 (= lt!89169 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180605 (= lt!89164 (addApplyDifferent!126 lt!89167 lt!89181 (minValue!3547 thiss!1248) lt!89169))))

(assert (=> b!180605 (= (apply!150 (+!267 lt!89167 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248))) lt!89169) (apply!150 lt!89167 lt!89169))))

(declare-fun bm!18245 () Bool)

(declare-fun call!18251 () ListLongMap!2257)

(assert (=> bm!18245 (= call!18248 call!18251)))

(declare-fun b!180606 () Bool)

(declare-fun e!118974 () Bool)

(assert (=> b!180606 (= e!118974 (not call!18252))))

(declare-fun b!180607 () Bool)

(declare-fun e!118978 () Bool)

(assert (=> b!180607 (= e!118978 (validKeyInArray!0 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180600 () Bool)

(declare-fun res!85506 () Bool)

(declare-fun e!118966 () Bool)

(assert (=> b!180600 (=> (not res!85506) (not e!118966))))

(declare-fun e!118970 () Bool)

(assert (=> b!180600 (= res!85506 e!118970)))

(declare-fun res!85507 () Bool)

(assert (=> b!180600 (=> res!85507 e!118970)))

(assert (=> b!180600 (= res!85507 (not e!118978))))

(declare-fun res!85509 () Bool)

(assert (=> b!180600 (=> (not res!85509) (not e!118978))))

(assert (=> b!180600 (= res!85509 (bvslt #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))))))

(declare-fun d!54111 () Bool)

(assert (=> d!54111 e!118966))

(declare-fun res!85508 () Bool)

(assert (=> d!54111 (=> (not res!85508) (not e!118966))))

(assert (=> d!54111 (= res!85508 (or (bvsge #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))))))))

(declare-fun lt!89170 () ListLongMap!2257)

(assert (=> d!54111 (= lt!89175 lt!89170)))

(declare-fun lt!89161 () Unit!5467)

(assert (=> d!54111 (= lt!89161 e!118971)))

(declare-fun c!32346 () Bool)

(assert (=> d!54111 (= c!32346 e!118972)))

(declare-fun res!85513 () Bool)

(assert (=> d!54111 (=> (not res!85513) (not e!118972))))

(assert (=> d!54111 (= res!85513 (bvslt #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))))))

(declare-fun e!118967 () ListLongMap!2257)

(assert (=> d!54111 (= lt!89170 e!118967)))

(declare-fun c!32341 () Bool)

(assert (=> d!54111 (= c!32341 (and (not (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54111 (validMask!0 (mask!8710 thiss!1248))))

(assert (=> d!54111 (= (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)) lt!89175)))

(declare-fun b!180608 () Bool)

(declare-fun e!118976 () ListLongMap!2257)

(declare-fun call!18247 () ListLongMap!2257)

(assert (=> b!180608 (= e!118976 call!18247)))

(declare-fun b!180609 () Bool)

(declare-fun e!118977 () Bool)

(declare-fun e!118968 () Bool)

(assert (=> b!180609 (= e!118977 e!118968)))

(declare-fun res!85510 () Bool)

(declare-fun call!18253 () Bool)

(assert (=> b!180609 (= res!85510 call!18253)))

(assert (=> b!180609 (=> (not res!85510) (not e!118968))))

(declare-fun b!180610 () Bool)

(assert (=> b!180610 (= e!118967 e!118976)))

(declare-fun c!32344 () Bool)

(assert (=> b!180610 (= c!32344 (and (not (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18246 () Bool)

(assert (=> bm!18246 (= call!18253 (contains!1226 lt!89175 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180611 () Bool)

(declare-fun res!85512 () Bool)

(assert (=> b!180611 (=> (not res!85512) (not e!118966))))

(assert (=> b!180611 (= res!85512 e!118977)))

(declare-fun c!32343 () Bool)

(assert (=> b!180611 (= c!32343 (not (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!180612 () Bool)

(assert (=> b!180612 (= e!118974 e!118973)))

(declare-fun res!85511 () Bool)

(assert (=> b!180612 (= res!85511 call!18252)))

(assert (=> b!180612 (=> (not res!85511) (not e!118973))))

(declare-fun call!18249 () ListLongMap!2257)

(declare-fun bm!18247 () Bool)

(declare-fun call!18250 () ListLongMap!2257)

(assert (=> bm!18247 (= call!18250 (+!267 (ite c!32341 call!18249 (ite c!32344 call!18251 call!18248)) (ite (or c!32341 c!32344) (tuple2!3349 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))

(declare-fun b!180613 () Bool)

(assert (=> b!180613 (= e!118977 (not call!18253))))

(declare-fun b!180614 () Bool)

(assert (=> b!180614 (= e!118970 e!118975)))

(declare-fun res!85514 () Bool)

(assert (=> b!180614 (=> (not res!85514) (not e!118975))))

(assert (=> b!180614 (= res!85514 (contains!1226 lt!89175 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180614 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))))))

(declare-fun b!180615 () Bool)

(assert (=> b!180615 (= e!118966 e!118974)))

(declare-fun c!32342 () Bool)

(assert (=> b!180615 (= c!32342 (not (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!180616 () Bool)

(declare-fun c!32345 () Bool)

(assert (=> b!180616 (= c!32345 (and (not (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3443 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!180616 (= e!118976 e!118969)))

(declare-fun b!180617 () Bool)

(declare-fun Unit!5470 () Unit!5467)

(assert (=> b!180617 (= e!118971 Unit!5470)))

(declare-fun bm!18248 () Bool)

(assert (=> bm!18248 (= call!18247 call!18250)))

(declare-fun b!180618 () Bool)

(assert (=> b!180618 (= e!118968 (= (apply!150 lt!89175 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3547 thiss!1248)))))

(declare-fun b!180619 () Bool)

(assert (=> b!180619 (= e!118969 call!18247)))

(declare-fun bm!18249 () Bool)

(assert (=> bm!18249 (= call!18249 (getCurrentListMapNoExtraKeys!171 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))

(declare-fun b!180620 () Bool)

(assert (=> b!180620 (= e!118967 (+!267 call!18250 (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))

(declare-fun bm!18250 () Bool)

(assert (=> bm!18250 (= call!18251 call!18249)))

(assert (= (and d!54111 c!32341) b!180620))

(assert (= (and d!54111 (not c!32341)) b!180610))

(assert (= (and b!180610 c!32344) b!180608))

(assert (= (and b!180610 (not c!32344)) b!180616))

(assert (= (and b!180616 c!32345) b!180619))

(assert (= (and b!180616 (not c!32345)) b!180602))

(assert (= (or b!180619 b!180602) bm!18245))

(assert (= (or b!180608 bm!18245) bm!18250))

(assert (= (or b!180608 b!180619) bm!18248))

(assert (= (or b!180620 bm!18250) bm!18249))

(assert (= (or b!180620 bm!18248) bm!18247))

(assert (= (and d!54111 res!85513) b!180603))

(assert (= (and d!54111 c!32346) b!180605))

(assert (= (and d!54111 (not c!32346)) b!180617))

(assert (= (and d!54111 res!85508) b!180600))

(assert (= (and b!180600 res!85509) b!180607))

(assert (= (and b!180600 (not res!85507)) b!180614))

(assert (= (and b!180614 res!85514) b!180604))

(assert (= (and b!180600 res!85506) b!180611))

(assert (= (and b!180611 c!32343) b!180609))

(assert (= (and b!180611 (not c!32343)) b!180613))

(assert (= (and b!180609 res!85510) b!180618))

(assert (= (or b!180609 b!180613) bm!18246))

(assert (= (and b!180611 res!85512) b!180615))

(assert (= (and b!180615 c!32342) b!180612))

(assert (= (and b!180615 (not c!32342)) b!180606))

(assert (= (and b!180612 res!85511) b!180601))

(assert (= (or b!180612 b!180606) bm!18244))

(declare-fun b_lambda!7105 () Bool)

(assert (=> (not b_lambda!7105) (not b!180604)))

(declare-fun t!7141 () Bool)

(declare-fun tb!2803 () Bool)

(assert (=> (and b!180463 (= (defaultEntry!3706 thiss!1248) (defaultEntry!3706 thiss!1248)) t!7141) tb!2803))

(declare-fun result!4703 () Bool)

(assert (=> tb!2803 (= result!4703 tp_is_empty!4237)))

(assert (=> b!180604 t!7141))

(declare-fun b_and!10981 () Bool)

(assert (= b_and!10975 (and (=> t!7141 result!4703) b_and!10981)))

(declare-fun m!208061 () Bool)

(assert (=> b!180614 m!208061))

(assert (=> b!180614 m!208061))

(declare-fun m!208063 () Bool)

(assert (=> b!180614 m!208063))

(declare-fun m!208065 () Bool)

(assert (=> bm!18247 m!208065))

(assert (=> b!180603 m!208061))

(assert (=> b!180603 m!208061))

(declare-fun m!208067 () Bool)

(assert (=> b!180603 m!208067))

(assert (=> b!180604 m!208061))

(declare-fun m!208069 () Bool)

(assert (=> b!180604 m!208069))

(assert (=> b!180604 m!208061))

(declare-fun m!208071 () Bool)

(assert (=> b!180604 m!208071))

(declare-fun m!208073 () Bool)

(assert (=> b!180604 m!208073))

(assert (=> b!180604 m!208071))

(assert (=> b!180604 m!208073))

(declare-fun m!208075 () Bool)

(assert (=> b!180604 m!208075))

(declare-fun m!208077 () Bool)

(assert (=> b!180620 m!208077))

(declare-fun m!208079 () Bool)

(assert (=> bm!18246 m!208079))

(assert (=> d!54111 m!207993))

(declare-fun m!208081 () Bool)

(assert (=> bm!18244 m!208081))

(declare-fun m!208083 () Bool)

(assert (=> b!180618 m!208083))

(declare-fun m!208085 () Bool)

(assert (=> b!180601 m!208085))

(declare-fun m!208087 () Bool)

(assert (=> bm!18249 m!208087))

(declare-fun m!208089 () Bool)

(assert (=> b!180605 m!208089))

(declare-fun m!208091 () Bool)

(assert (=> b!180605 m!208091))

(declare-fun m!208093 () Bool)

(assert (=> b!180605 m!208093))

(declare-fun m!208095 () Bool)

(assert (=> b!180605 m!208095))

(declare-fun m!208097 () Bool)

(assert (=> b!180605 m!208097))

(declare-fun m!208099 () Bool)

(assert (=> b!180605 m!208099))

(declare-fun m!208101 () Bool)

(assert (=> b!180605 m!208101))

(declare-fun m!208103 () Bool)

(assert (=> b!180605 m!208103))

(declare-fun m!208105 () Bool)

(assert (=> b!180605 m!208105))

(assert (=> b!180605 m!208091))

(declare-fun m!208107 () Bool)

(assert (=> b!180605 m!208107))

(assert (=> b!180605 m!208103))

(declare-fun m!208109 () Bool)

(assert (=> b!180605 m!208109))

(assert (=> b!180605 m!208099))

(declare-fun m!208111 () Bool)

(assert (=> b!180605 m!208111))

(declare-fun m!208113 () Bool)

(assert (=> b!180605 m!208113))

(assert (=> b!180605 m!208061))

(declare-fun m!208115 () Bool)

(assert (=> b!180605 m!208115))

(assert (=> b!180605 m!208095))

(declare-fun m!208117 () Bool)

(assert (=> b!180605 m!208117))

(assert (=> b!180605 m!208087))

(assert (=> b!180607 m!208061))

(assert (=> b!180607 m!208061))

(assert (=> b!180607 m!208067))

(assert (=> b!180467 d!54111))

(declare-fun d!54113 () Bool)

(assert (=> d!54113 (= (validMask!0 (mask!8710 thiss!1248)) (and (or (= (mask!8710 thiss!1248) #b00000000000000000000000000000111) (= (mask!8710 thiss!1248) #b00000000000000000000000000001111) (= (mask!8710 thiss!1248) #b00000000000000000000000000011111) (= (mask!8710 thiss!1248) #b00000000000000000000000000111111) (= (mask!8710 thiss!1248) #b00000000000000000000000001111111) (= (mask!8710 thiss!1248) #b00000000000000000000000011111111) (= (mask!8710 thiss!1248) #b00000000000000000000000111111111) (= (mask!8710 thiss!1248) #b00000000000000000000001111111111) (= (mask!8710 thiss!1248) #b00000000000000000000011111111111) (= (mask!8710 thiss!1248) #b00000000000000000000111111111111) (= (mask!8710 thiss!1248) #b00000000000000000001111111111111) (= (mask!8710 thiss!1248) #b00000000000000000011111111111111) (= (mask!8710 thiss!1248) #b00000000000000000111111111111111) (= (mask!8710 thiss!1248) #b00000000000000001111111111111111) (= (mask!8710 thiss!1248) #b00000000000000011111111111111111) (= (mask!8710 thiss!1248) #b00000000000000111111111111111111) (= (mask!8710 thiss!1248) #b00000000000001111111111111111111) (= (mask!8710 thiss!1248) #b00000000000011111111111111111111) (= (mask!8710 thiss!1248) #b00000000000111111111111111111111) (= (mask!8710 thiss!1248) #b00000000001111111111111111111111) (= (mask!8710 thiss!1248) #b00000000011111111111111111111111) (= (mask!8710 thiss!1248) #b00000000111111111111111111111111) (= (mask!8710 thiss!1248) #b00000001111111111111111111111111) (= (mask!8710 thiss!1248) #b00000011111111111111111111111111) (= (mask!8710 thiss!1248) #b00000111111111111111111111111111) (= (mask!8710 thiss!1248) #b00001111111111111111111111111111) (= (mask!8710 thiss!1248) #b00011111111111111111111111111111) (= (mask!8710 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8710 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!180459 d!54113))

(declare-fun mapNonEmpty!7267 () Bool)

(declare-fun mapRes!7267 () Bool)

(declare-fun tp!16150 () Bool)

(declare-fun e!118983 () Bool)

(assert (=> mapNonEmpty!7267 (= mapRes!7267 (and tp!16150 e!118983))))

(declare-fun mapValue!7267 () ValueCell!1775)

(declare-fun mapKey!7267 () (_ BitVec 32))

(declare-fun mapRest!7267 () (Array (_ BitVec 32) ValueCell!1775))

(assert (=> mapNonEmpty!7267 (= mapRest!7258 (store mapRest!7267 mapKey!7267 mapValue!7267))))

(declare-fun condMapEmpty!7267 () Bool)

(declare-fun mapDefault!7267 () ValueCell!1775)

(assert (=> mapNonEmpty!7258 (= condMapEmpty!7267 (= mapRest!7258 ((as const (Array (_ BitVec 32) ValueCell!1775)) mapDefault!7267)))))

(declare-fun e!118984 () Bool)

(assert (=> mapNonEmpty!7258 (= tp!16135 (and e!118984 mapRes!7267))))

(declare-fun b!180629 () Bool)

(assert (=> b!180629 (= e!118983 tp_is_empty!4237)))

(declare-fun b!180630 () Bool)

(assert (=> b!180630 (= e!118984 tp_is_empty!4237)))

(declare-fun mapIsEmpty!7267 () Bool)

(assert (=> mapIsEmpty!7267 mapRes!7267))

(assert (= (and mapNonEmpty!7258 condMapEmpty!7267) mapIsEmpty!7267))

(assert (= (and mapNonEmpty!7258 (not condMapEmpty!7267)) mapNonEmpty!7267))

(assert (= (and mapNonEmpty!7267 ((_ is ValueCellFull!1775) mapValue!7267)) b!180629))

(assert (= (and mapNonEmpty!7258 ((_ is ValueCellFull!1775) mapDefault!7267)) b!180630))

(declare-fun m!208119 () Bool)

(assert (=> mapNonEmpty!7267 m!208119))

(declare-fun b_lambda!7107 () Bool)

(assert (= b_lambda!7105 (or (and b!180463 b_free!4465) b_lambda!7107)))

(check-sat (not b!180546) (not b!180548) (not b!180618) (not bm!18244) (not b!180557) (not bm!18249) (not d!54101) (not b!180607) (not b!180604) (not b!180605) (not d!54111) (not b!180555) (not mapNonEmpty!7267) (not b!180547) (not d!54103) (not b!180614) b_and!10981 (not bm!18247) (not b!180601) (not b_next!4465) (not bm!18246) (not b_lambda!7107) tp_is_empty!4237 (not b!180620) (not b!180537) (not d!54109) (not b!180603))
(check-sat b_and!10981 (not b_next!4465))
(get-model)

(declare-fun bm!18253 () Bool)

(declare-fun call!18256 () ListLongMap!2257)

(assert (=> bm!18253 (= call!18256 (getCurrentListMapNoExtraKeys!171 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3706 thiss!1248)))))

(declare-fun b!180655 () Bool)

(declare-fun e!119002 () Bool)

(declare-fun lt!89201 () ListLongMap!2257)

(assert (=> b!180655 (= e!119002 (= lt!89201 (getCurrentListMapNoExtraKeys!171 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3706 thiss!1248))))))

(declare-fun b!180657 () Bool)

(declare-fun res!85526 () Bool)

(declare-fun e!118999 () Bool)

(assert (=> b!180657 (=> (not res!85526) (not e!118999))))

(assert (=> b!180657 (= res!85526 (not (contains!1226 lt!89201 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180658 () Bool)

(declare-fun e!119005 () Bool)

(declare-fun e!119004 () Bool)

(assert (=> b!180658 (= e!119005 e!119004)))

(assert (=> b!180658 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))))))

(declare-fun res!85524 () Bool)

(assert (=> b!180658 (= res!85524 (contains!1226 lt!89201 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180658 (=> (not res!85524) (not e!119004))))

(declare-fun b!180659 () Bool)

(declare-fun lt!89203 () Unit!5467)

(declare-fun lt!89200 () Unit!5467)

(assert (=> b!180659 (= lt!89203 lt!89200)))

(declare-fun lt!89202 () (_ BitVec 64))

(declare-fun lt!89199 () ListLongMap!2257)

(declare-fun lt!89198 () (_ BitVec 64))

(declare-fun lt!89197 () V!5297)

(assert (=> b!180659 (not (contains!1226 (+!267 lt!89199 (tuple2!3349 lt!89198 lt!89197)) lt!89202))))

(declare-fun addStillNotContains!82 (ListLongMap!2257 (_ BitVec 64) V!5297 (_ BitVec 64)) Unit!5467)

(assert (=> b!180659 (= lt!89200 (addStillNotContains!82 lt!89199 lt!89198 lt!89197 lt!89202))))

(assert (=> b!180659 (= lt!89202 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!180659 (= lt!89197 (get!2061 (select (arr!3611 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!180659 (= lt!89198 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180659 (= lt!89199 call!18256)))

(declare-fun e!119003 () ListLongMap!2257)

(assert (=> b!180659 (= e!119003 (+!267 call!18256 (tuple2!3349 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000) (get!2061 (select (arr!3611 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!180660 () Bool)

(assert (=> b!180660 (= e!119005 e!119002)))

(declare-fun c!32358 () Bool)

(assert (=> b!180660 (= c!32358 (bvslt #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))))))

(declare-fun b!180661 () Bool)

(assert (=> b!180661 (= e!118999 e!119005)))

(declare-fun c!32355 () Bool)

(declare-fun e!119000 () Bool)

(assert (=> b!180661 (= c!32355 e!119000)))

(declare-fun res!85525 () Bool)

(assert (=> b!180661 (=> (not res!85525) (not e!119000))))

(assert (=> b!180661 (= res!85525 (bvslt #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))))))

(declare-fun b!180662 () Bool)

(assert (=> b!180662 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))))))

(assert (=> b!180662 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3920 (_values!3689 thiss!1248))))))

(assert (=> b!180662 (= e!119004 (= (apply!150 lt!89201 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)) (get!2061 (select (arr!3611 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!54115 () Bool)

(assert (=> d!54115 e!118999))

(declare-fun res!85523 () Bool)

(assert (=> d!54115 (=> (not res!85523) (not e!118999))))

(assert (=> d!54115 (= res!85523 (not (contains!1226 lt!89201 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!119001 () ListLongMap!2257)

(assert (=> d!54115 (= lt!89201 e!119001)))

(declare-fun c!32357 () Bool)

(assert (=> d!54115 (= c!32357 (bvsge #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))))))

(assert (=> d!54115 (validMask!0 (mask!8710 thiss!1248))))

(assert (=> d!54115 (= (getCurrentListMapNoExtraKeys!171 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)) lt!89201)))

(declare-fun b!180656 () Bool)

(assert (=> b!180656 (= e!119001 e!119003)))

(declare-fun c!32356 () Bool)

(assert (=> b!180656 (= c!32356 (validKeyInArray!0 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180663 () Bool)

(assert (=> b!180663 (= e!119003 call!18256)))

(declare-fun b!180664 () Bool)

(assert (=> b!180664 (= e!119001 (ListLongMap!2258 Nil!2293))))

(declare-fun b!180665 () Bool)

(declare-fun isEmpty!459 (ListLongMap!2257) Bool)

(assert (=> b!180665 (= e!119002 (isEmpty!459 lt!89201))))

(declare-fun b!180666 () Bool)

(assert (=> b!180666 (= e!119000 (validKeyInArray!0 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180666 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!54115 c!32357) b!180664))

(assert (= (and d!54115 (not c!32357)) b!180656))

(assert (= (and b!180656 c!32356) b!180659))

(assert (= (and b!180656 (not c!32356)) b!180663))

(assert (= (or b!180659 b!180663) bm!18253))

(assert (= (and d!54115 res!85523) b!180657))

(assert (= (and b!180657 res!85526) b!180661))

(assert (= (and b!180661 res!85525) b!180666))

(assert (= (and b!180661 c!32355) b!180658))

(assert (= (and b!180661 (not c!32355)) b!180660))

(assert (= (and b!180658 res!85524) b!180662))

(assert (= (and b!180660 c!32358) b!180655))

(assert (= (and b!180660 (not c!32358)) b!180665))

(declare-fun b_lambda!7109 () Bool)

(assert (=> (not b_lambda!7109) (not b!180659)))

(assert (=> b!180659 t!7141))

(declare-fun b_and!10983 () Bool)

(assert (= b_and!10981 (and (=> t!7141 result!4703) b_and!10983)))

(declare-fun b_lambda!7111 () Bool)

(assert (=> (not b_lambda!7111) (not b!180662)))

(assert (=> b!180662 t!7141))

(declare-fun b_and!10985 () Bool)

(assert (= b_and!10983 (and (=> t!7141 result!4703) b_and!10985)))

(declare-fun m!208121 () Bool)

(assert (=> b!180657 m!208121))

(assert (=> b!180666 m!208061))

(assert (=> b!180666 m!208061))

(assert (=> b!180666 m!208067))

(assert (=> b!180662 m!208071))

(assert (=> b!180662 m!208061))

(declare-fun m!208123 () Bool)

(assert (=> b!180662 m!208123))

(assert (=> b!180662 m!208061))

(assert (=> b!180662 m!208071))

(assert (=> b!180662 m!208073))

(assert (=> b!180662 m!208075))

(assert (=> b!180662 m!208073))

(assert (=> b!180656 m!208061))

(assert (=> b!180656 m!208061))

(assert (=> b!180656 m!208067))

(declare-fun m!208125 () Bool)

(assert (=> d!54115 m!208125))

(assert (=> d!54115 m!207993))

(declare-fun m!208127 () Bool)

(assert (=> b!180665 m!208127))

(declare-fun m!208129 () Bool)

(assert (=> b!180659 m!208129))

(assert (=> b!180659 m!208071))

(declare-fun m!208131 () Bool)

(assert (=> b!180659 m!208131))

(declare-fun m!208133 () Bool)

(assert (=> b!180659 m!208133))

(assert (=> b!180659 m!208061))

(assert (=> b!180659 m!208071))

(assert (=> b!180659 m!208073))

(assert (=> b!180659 m!208075))

(assert (=> b!180659 m!208073))

(assert (=> b!180659 m!208129))

(declare-fun m!208135 () Bool)

(assert (=> b!180659 m!208135))

(declare-fun m!208137 () Bool)

(assert (=> bm!18253 m!208137))

(assert (=> b!180655 m!208137))

(assert (=> b!180658 m!208061))

(assert (=> b!180658 m!208061))

(declare-fun m!208139 () Bool)

(assert (=> b!180658 m!208139))

(assert (=> bm!18249 d!54115))

(declare-fun d!54117 () Bool)

(declare-fun get!2062 (Option!211) V!5297)

(assert (=> d!54117 (= (apply!150 lt!89175 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)) (get!2062 (getValueByKey!205 (toList!1144 lt!89175) (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7355 () Bool)

(assert (= bs!7355 d!54117))

(assert (=> bs!7355 m!208061))

(declare-fun m!208141 () Bool)

(assert (=> bs!7355 m!208141))

(assert (=> bs!7355 m!208141))

(declare-fun m!208143 () Bool)

(assert (=> bs!7355 m!208143))

(assert (=> b!180604 d!54117))

(declare-fun d!54119 () Bool)

(declare-fun c!32361 () Bool)

(assert (=> d!54119 (= c!32361 ((_ is ValueCellFull!1775) (select (arr!3611 (_values!3689 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119008 () V!5297)

(assert (=> d!54119 (= (get!2061 (select (arr!3611 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!119008)))

(declare-fun b!180671 () Bool)

(declare-fun get!2063 (ValueCell!1775 V!5297) V!5297)

(assert (=> b!180671 (= e!119008 (get!2063 (select (arr!3611 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180672 () Bool)

(declare-fun get!2064 (ValueCell!1775 V!5297) V!5297)

(assert (=> b!180672 (= e!119008 (get!2064 (select (arr!3611 (_values!3689 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3706 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54119 c!32361) b!180671))

(assert (= (and d!54119 (not c!32361)) b!180672))

(assert (=> b!180671 m!208071))

(assert (=> b!180671 m!208073))

(declare-fun m!208145 () Bool)

(assert (=> b!180671 m!208145))

(assert (=> b!180672 m!208071))

(assert (=> b!180672 m!208073))

(declare-fun m!208147 () Bool)

(assert (=> b!180672 m!208147))

(assert (=> b!180604 d!54119))

(declare-fun b!180683 () Bool)

(declare-fun e!119018 () Bool)

(declare-fun call!18259 () Bool)

(assert (=> b!180683 (= e!119018 call!18259)))

(declare-fun d!54121 () Bool)

(declare-fun res!85535 () Bool)

(declare-fun e!119017 () Bool)

(assert (=> d!54121 (=> res!85535 e!119017)))

(assert (=> d!54121 (= res!85535 (bvsge #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))))))

(assert (=> d!54121 (= (arrayNoDuplicates!0 (_keys!5599 thiss!1248) #b00000000000000000000000000000000 Nil!2296) e!119017)))

(declare-fun bm!18256 () Bool)

(declare-fun c!32364 () Bool)

(assert (=> bm!18256 (= call!18259 (arrayNoDuplicates!0 (_keys!5599 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32364 (Cons!2295 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000) Nil!2296) Nil!2296)))))

(declare-fun b!180684 () Bool)

(declare-fun e!119019 () Bool)

(declare-fun contains!1229 (List!2299 (_ BitVec 64)) Bool)

(assert (=> b!180684 (= e!119019 (contains!1229 Nil!2296 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180685 () Bool)

(declare-fun e!119020 () Bool)

(assert (=> b!180685 (= e!119017 e!119020)))

(declare-fun res!85534 () Bool)

(assert (=> b!180685 (=> (not res!85534) (not e!119020))))

(assert (=> b!180685 (= res!85534 (not e!119019))))

(declare-fun res!85533 () Bool)

(assert (=> b!180685 (=> (not res!85533) (not e!119019))))

(assert (=> b!180685 (= res!85533 (validKeyInArray!0 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180686 () Bool)

(assert (=> b!180686 (= e!119018 call!18259)))

(declare-fun b!180687 () Bool)

(assert (=> b!180687 (= e!119020 e!119018)))

(assert (=> b!180687 (= c!32364 (validKeyInArray!0 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54121 (not res!85535)) b!180685))

(assert (= (and b!180685 res!85533) b!180684))

(assert (= (and b!180685 res!85534) b!180687))

(assert (= (and b!180687 c!32364) b!180686))

(assert (= (and b!180687 (not c!32364)) b!180683))

(assert (= (or b!180686 b!180683) bm!18256))

(assert (=> bm!18256 m!208061))

(declare-fun m!208149 () Bool)

(assert (=> bm!18256 m!208149))

(assert (=> b!180684 m!208061))

(assert (=> b!180684 m!208061))

(declare-fun m!208151 () Bool)

(assert (=> b!180684 m!208151))

(assert (=> b!180685 m!208061))

(assert (=> b!180685 m!208061))

(assert (=> b!180685 m!208067))

(assert (=> b!180687 m!208061))

(assert (=> b!180687 m!208061))

(assert (=> b!180687 m!208067))

(assert (=> b!180548 d!54121))

(declare-fun d!54123 () Bool)

(declare-fun e!119023 () Bool)

(assert (=> d!54123 e!119023))

(declare-fun res!85541 () Bool)

(assert (=> d!54123 (=> (not res!85541) (not e!119023))))

(declare-fun lt!89213 () ListLongMap!2257)

(assert (=> d!54123 (= res!85541 (contains!1226 lt!89213 (_1!1685 (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))

(declare-fun lt!89214 () List!2296)

(assert (=> d!54123 (= lt!89213 (ListLongMap!2258 lt!89214))))

(declare-fun lt!89212 () Unit!5467)

(declare-fun lt!89215 () Unit!5467)

(assert (=> d!54123 (= lt!89212 lt!89215)))

(assert (=> d!54123 (= (getValueByKey!205 lt!89214 (_1!1685 (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))) (Some!210 (_2!1685 (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!110 (List!2296 (_ BitVec 64) V!5297) Unit!5467)

(assert (=> d!54123 (= lt!89215 (lemmaContainsTupThenGetReturnValue!110 lt!89214 (_1!1685 (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))) (_2!1685 (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))

(declare-fun insertStrictlySorted!113 (List!2296 (_ BitVec 64) V!5297) List!2296)

(assert (=> d!54123 (= lt!89214 (insertStrictlySorted!113 (toList!1144 call!18250) (_1!1685 (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))) (_2!1685 (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))

(assert (=> d!54123 (= (+!267 call!18250 (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))) lt!89213)))

(declare-fun b!180692 () Bool)

(declare-fun res!85540 () Bool)

(assert (=> b!180692 (=> (not res!85540) (not e!119023))))

(assert (=> b!180692 (= res!85540 (= (getValueByKey!205 (toList!1144 lt!89213) (_1!1685 (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))) (Some!210 (_2!1685 (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))))

(declare-fun b!180693 () Bool)

(declare-fun contains!1230 (List!2296 tuple2!3348) Bool)

(assert (=> b!180693 (= e!119023 (contains!1230 (toList!1144 lt!89213) (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))

(assert (= (and d!54123 res!85541) b!180692))

(assert (= (and b!180692 res!85540) b!180693))

(declare-fun m!208153 () Bool)

(assert (=> d!54123 m!208153))

(declare-fun m!208155 () Bool)

(assert (=> d!54123 m!208155))

(declare-fun m!208157 () Bool)

(assert (=> d!54123 m!208157))

(declare-fun m!208159 () Bool)

(assert (=> d!54123 m!208159))

(declare-fun m!208161 () Bool)

(assert (=> b!180692 m!208161))

(declare-fun m!208163 () Bool)

(assert (=> b!180693 m!208163))

(assert (=> b!180620 d!54123))

(declare-fun d!54125 () Bool)

(declare-fun e!119025 () Bool)

(assert (=> d!54125 e!119025))

(declare-fun res!85542 () Bool)

(assert (=> d!54125 (=> res!85542 e!119025)))

(declare-fun lt!89217 () Bool)

(assert (=> d!54125 (= res!85542 (not lt!89217))))

(declare-fun lt!89219 () Bool)

(assert (=> d!54125 (= lt!89217 lt!89219)))

(declare-fun lt!89218 () Unit!5467)

(declare-fun e!119024 () Unit!5467)

(assert (=> d!54125 (= lt!89218 e!119024)))

(declare-fun c!32365 () Bool)

(assert (=> d!54125 (= c!32365 lt!89219)))

(assert (=> d!54125 (= lt!89219 (containsKey!209 (toList!1144 lt!89175) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54125 (= (contains!1226 lt!89175 #b1000000000000000000000000000000000000000000000000000000000000000) lt!89217)))

(declare-fun b!180694 () Bool)

(declare-fun lt!89216 () Unit!5467)

(assert (=> b!180694 (= e!119024 lt!89216)))

(assert (=> b!180694 (= lt!89216 (lemmaContainsKeyImpliesGetValueByKeyDefined!158 (toList!1144 lt!89175) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180694 (isDefined!159 (getValueByKey!205 (toList!1144 lt!89175) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180695 () Bool)

(declare-fun Unit!5471 () Unit!5467)

(assert (=> b!180695 (= e!119024 Unit!5471)))

(declare-fun b!180696 () Bool)

(assert (=> b!180696 (= e!119025 (isDefined!159 (getValueByKey!205 (toList!1144 lt!89175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54125 c!32365) b!180694))

(assert (= (and d!54125 (not c!32365)) b!180695))

(assert (= (and d!54125 (not res!85542)) b!180696))

(declare-fun m!208165 () Bool)

(assert (=> d!54125 m!208165))

(declare-fun m!208167 () Bool)

(assert (=> b!180694 m!208167))

(declare-fun m!208169 () Bool)

(assert (=> b!180694 m!208169))

(assert (=> b!180694 m!208169))

(declare-fun m!208171 () Bool)

(assert (=> b!180694 m!208171))

(assert (=> b!180696 m!208169))

(assert (=> b!180696 m!208169))

(assert (=> b!180696 m!208171))

(assert (=> bm!18244 d!54125))

(declare-fun b!180709 () Bool)

(declare-fun e!119033 () SeekEntryResult!603)

(assert (=> b!180709 (= e!119033 (Found!603 (index!4584 lt!89104)))))

(declare-fun b!180710 () Bool)

(declare-fun e!119034 () SeekEntryResult!603)

(assert (=> b!180710 (= e!119034 (MissingVacant!603 (index!4584 lt!89104)))))

(declare-fun b!180711 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180711 (= e!119034 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19754 lt!89104) #b00000000000000000000000000000001) (nextIndex!0 (index!4584 lt!89104) (x!19754 lt!89104) (mask!8710 thiss!1248)) (index!4584 lt!89104) key!828 (_keys!5599 thiss!1248) (mask!8710 thiss!1248)))))

(declare-fun b!180712 () Bool)

(declare-fun e!119032 () SeekEntryResult!603)

(assert (=> b!180712 (= e!119032 e!119033)))

(declare-fun c!32372 () Bool)

(declare-fun lt!89225 () (_ BitVec 64))

(assert (=> b!180712 (= c!32372 (= lt!89225 key!828))))

(declare-fun b!180713 () Bool)

(declare-fun c!32374 () Bool)

(assert (=> b!180713 (= c!32374 (= lt!89225 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180713 (= e!119033 e!119034)))

(declare-fun b!180714 () Bool)

(assert (=> b!180714 (= e!119032 Undefined!603)))

(declare-fun d!54127 () Bool)

(declare-fun lt!89224 () SeekEntryResult!603)

(assert (=> d!54127 (and (or ((_ is Undefined!603) lt!89224) (not ((_ is Found!603) lt!89224)) (and (bvsge (index!4583 lt!89224) #b00000000000000000000000000000000) (bvslt (index!4583 lt!89224) (size!3919 (_keys!5599 thiss!1248))))) (or ((_ is Undefined!603) lt!89224) ((_ is Found!603) lt!89224) (not ((_ is MissingVacant!603) lt!89224)) (not (= (index!4585 lt!89224) (index!4584 lt!89104))) (and (bvsge (index!4585 lt!89224) #b00000000000000000000000000000000) (bvslt (index!4585 lt!89224) (size!3919 (_keys!5599 thiss!1248))))) (or ((_ is Undefined!603) lt!89224) (ite ((_ is Found!603) lt!89224) (= (select (arr!3610 (_keys!5599 thiss!1248)) (index!4583 lt!89224)) key!828) (and ((_ is MissingVacant!603) lt!89224) (= (index!4585 lt!89224) (index!4584 lt!89104)) (= (select (arr!3610 (_keys!5599 thiss!1248)) (index!4585 lt!89224)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54127 (= lt!89224 e!119032)))

(declare-fun c!32373 () Bool)

(assert (=> d!54127 (= c!32373 (bvsge (x!19754 lt!89104) #b01111111111111111111111111111110))))

(assert (=> d!54127 (= lt!89225 (select (arr!3610 (_keys!5599 thiss!1248)) (index!4584 lt!89104)))))

(assert (=> d!54127 (validMask!0 (mask!8710 thiss!1248))))

(assert (=> d!54127 (= (seekKeyOrZeroReturnVacant!0 (x!19754 lt!89104) (index!4584 lt!89104) (index!4584 lt!89104) key!828 (_keys!5599 thiss!1248) (mask!8710 thiss!1248)) lt!89224)))

(assert (= (and d!54127 c!32373) b!180714))

(assert (= (and d!54127 (not c!32373)) b!180712))

(assert (= (and b!180712 c!32372) b!180709))

(assert (= (and b!180712 (not c!32372)) b!180713))

(assert (= (and b!180713 c!32374) b!180710))

(assert (= (and b!180713 (not c!32374)) b!180711))

(declare-fun m!208173 () Bool)

(assert (=> b!180711 m!208173))

(assert (=> b!180711 m!208173))

(declare-fun m!208175 () Bool)

(assert (=> b!180711 m!208175))

(declare-fun m!208177 () Bool)

(assert (=> d!54127 m!208177))

(declare-fun m!208179 () Bool)

(assert (=> d!54127 m!208179))

(assert (=> d!54127 m!208043))

(assert (=> d!54127 m!207993))

(assert (=> b!180537 d!54127))

(declare-fun d!54129 () Bool)

(declare-fun e!119035 () Bool)

(assert (=> d!54129 e!119035))

(declare-fun res!85544 () Bool)

(assert (=> d!54129 (=> (not res!85544) (not e!119035))))

(declare-fun lt!89227 () ListLongMap!2257)

(assert (=> d!54129 (= res!85544 (contains!1226 lt!89227 (_1!1685 (ite (or c!32341 c!32344) (tuple2!3349 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))))

(declare-fun lt!89228 () List!2296)

(assert (=> d!54129 (= lt!89227 (ListLongMap!2258 lt!89228))))

(declare-fun lt!89226 () Unit!5467)

(declare-fun lt!89229 () Unit!5467)

(assert (=> d!54129 (= lt!89226 lt!89229)))

(assert (=> d!54129 (= (getValueByKey!205 lt!89228 (_1!1685 (ite (or c!32341 c!32344) (tuple2!3349 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))) (Some!210 (_2!1685 (ite (or c!32341 c!32344) (tuple2!3349 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))))

(assert (=> d!54129 (= lt!89229 (lemmaContainsTupThenGetReturnValue!110 lt!89228 (_1!1685 (ite (or c!32341 c!32344) (tuple2!3349 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))) (_2!1685 (ite (or c!32341 c!32344) (tuple2!3349 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))))

(assert (=> d!54129 (= lt!89228 (insertStrictlySorted!113 (toList!1144 (ite c!32341 call!18249 (ite c!32344 call!18251 call!18248))) (_1!1685 (ite (or c!32341 c!32344) (tuple2!3349 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))) (_2!1685 (ite (or c!32341 c!32344) (tuple2!3349 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))))))

(assert (=> d!54129 (= (+!267 (ite c!32341 call!18249 (ite c!32344 call!18251 call!18248)) (ite (or c!32341 c!32344) (tuple2!3349 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))) lt!89227)))

(declare-fun b!180715 () Bool)

(declare-fun res!85543 () Bool)

(assert (=> b!180715 (=> (not res!85543) (not e!119035))))

(assert (=> b!180715 (= res!85543 (= (getValueByKey!205 (toList!1144 lt!89227) (_1!1685 (ite (or c!32341 c!32344) (tuple2!3349 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248))))) (Some!210 (_2!1685 (ite (or c!32341 c!32344) (tuple2!3349 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))))

(declare-fun b!180716 () Bool)

(assert (=> b!180716 (= e!119035 (contains!1230 (toList!1144 lt!89227) (ite (or c!32341 c!32344) (tuple2!3349 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3547 thiss!1248)) (tuple2!3349 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3547 thiss!1248)))))))

(assert (= (and d!54129 res!85544) b!180715))

(assert (= (and b!180715 res!85543) b!180716))

(declare-fun m!208181 () Bool)

(assert (=> d!54129 m!208181))

(declare-fun m!208183 () Bool)

(assert (=> d!54129 m!208183))

(declare-fun m!208185 () Bool)

(assert (=> d!54129 m!208185))

(declare-fun m!208187 () Bool)

(assert (=> d!54129 m!208187))

(declare-fun m!208189 () Bool)

(assert (=> b!180715 m!208189))

(declare-fun m!208191 () Bool)

(assert (=> b!180716 m!208191))

(assert (=> bm!18247 d!54129))

(declare-fun d!54131 () Bool)

(assert (=> d!54131 (= (apply!150 (+!267 lt!89165 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248))) lt!89166) (get!2062 (getValueByKey!205 (toList!1144 (+!267 lt!89165 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248)))) lt!89166)))))

(declare-fun bs!7356 () Bool)

(assert (= bs!7356 d!54131))

(declare-fun m!208193 () Bool)

(assert (=> bs!7356 m!208193))

(assert (=> bs!7356 m!208193))

(declare-fun m!208195 () Bool)

(assert (=> bs!7356 m!208195))

(assert (=> b!180605 d!54131))

(declare-fun d!54133 () Bool)

(assert (=> d!54133 (= (apply!150 (+!267 lt!89179 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248))) lt!89174) (get!2062 (getValueByKey!205 (toList!1144 (+!267 lt!89179 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248)))) lt!89174)))))

(declare-fun bs!7357 () Bool)

(assert (= bs!7357 d!54133))

(declare-fun m!208197 () Bool)

(assert (=> bs!7357 m!208197))

(assert (=> bs!7357 m!208197))

(declare-fun m!208199 () Bool)

(assert (=> bs!7357 m!208199))

(assert (=> b!180605 d!54133))

(declare-fun d!54135 () Bool)

(declare-fun e!119036 () Bool)

(assert (=> d!54135 e!119036))

(declare-fun res!85546 () Bool)

(assert (=> d!54135 (=> (not res!85546) (not e!119036))))

(declare-fun lt!89231 () ListLongMap!2257)

(assert (=> d!54135 (= res!85546 (contains!1226 lt!89231 (_1!1685 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248)))))))

(declare-fun lt!89232 () List!2296)

(assert (=> d!54135 (= lt!89231 (ListLongMap!2258 lt!89232))))

(declare-fun lt!89230 () Unit!5467)

(declare-fun lt!89233 () Unit!5467)

(assert (=> d!54135 (= lt!89230 lt!89233)))

(assert (=> d!54135 (= (getValueByKey!205 lt!89232 (_1!1685 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248)))) (Some!210 (_2!1685 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248)))))))

(assert (=> d!54135 (= lt!89233 (lemmaContainsTupThenGetReturnValue!110 lt!89232 (_1!1685 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248))) (_2!1685 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248)))))))

(assert (=> d!54135 (= lt!89232 (insertStrictlySorted!113 (toList!1144 lt!89178) (_1!1685 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248))) (_2!1685 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248)))))))

(assert (=> d!54135 (= (+!267 lt!89178 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248))) lt!89231)))

(declare-fun b!180717 () Bool)

(declare-fun res!85545 () Bool)

(assert (=> b!180717 (=> (not res!85545) (not e!119036))))

(assert (=> b!180717 (= res!85545 (= (getValueByKey!205 (toList!1144 lt!89231) (_1!1685 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248)))) (Some!210 (_2!1685 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248))))))))

(declare-fun b!180718 () Bool)

(assert (=> b!180718 (= e!119036 (contains!1230 (toList!1144 lt!89231) (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248))))))

(assert (= (and d!54135 res!85546) b!180717))

(assert (= (and b!180717 res!85545) b!180718))

(declare-fun m!208201 () Bool)

(assert (=> d!54135 m!208201))

(declare-fun m!208203 () Bool)

(assert (=> d!54135 m!208203))

(declare-fun m!208205 () Bool)

(assert (=> d!54135 m!208205))

(declare-fun m!208207 () Bool)

(assert (=> d!54135 m!208207))

(declare-fun m!208209 () Bool)

(assert (=> b!180717 m!208209))

(declare-fun m!208211 () Bool)

(assert (=> b!180718 m!208211))

(assert (=> b!180605 d!54135))

(assert (=> b!180605 d!54115))

(declare-fun d!54137 () Bool)

(assert (=> d!54137 (= (apply!150 lt!89167 lt!89169) (get!2062 (getValueByKey!205 (toList!1144 lt!89167) lt!89169)))))

(declare-fun bs!7358 () Bool)

(assert (= bs!7358 d!54137))

(declare-fun m!208213 () Bool)

(assert (=> bs!7358 m!208213))

(assert (=> bs!7358 m!208213))

(declare-fun m!208215 () Bool)

(assert (=> bs!7358 m!208215))

(assert (=> b!180605 d!54137))

(declare-fun d!54139 () Bool)

(assert (=> d!54139 (= (apply!150 lt!89165 lt!89166) (get!2062 (getValueByKey!205 (toList!1144 lt!89165) lt!89166)))))

(declare-fun bs!7359 () Bool)

(assert (= bs!7359 d!54139))

(declare-fun m!208217 () Bool)

(assert (=> bs!7359 m!208217))

(assert (=> bs!7359 m!208217))

(declare-fun m!208219 () Bool)

(assert (=> bs!7359 m!208219))

(assert (=> b!180605 d!54139))

(declare-fun d!54141 () Bool)

(assert (=> d!54141 (= (apply!150 (+!267 lt!89165 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248))) lt!89166) (apply!150 lt!89165 lt!89166))))

(declare-fun lt!89236 () Unit!5467)

(declare-fun choose!965 (ListLongMap!2257 (_ BitVec 64) V!5297 (_ BitVec 64)) Unit!5467)

(assert (=> d!54141 (= lt!89236 (choose!965 lt!89165 lt!89182 (minValue!3547 thiss!1248) lt!89166))))

(declare-fun e!119039 () Bool)

(assert (=> d!54141 e!119039))

(declare-fun res!85549 () Bool)

(assert (=> d!54141 (=> (not res!85549) (not e!119039))))

(assert (=> d!54141 (= res!85549 (contains!1226 lt!89165 lt!89166))))

(assert (=> d!54141 (= (addApplyDifferent!126 lt!89165 lt!89182 (minValue!3547 thiss!1248) lt!89166) lt!89236)))

(declare-fun b!180722 () Bool)

(assert (=> b!180722 (= e!119039 (not (= lt!89166 lt!89182)))))

(assert (= (and d!54141 res!85549) b!180722))

(declare-fun m!208221 () Bool)

(assert (=> d!54141 m!208221))

(assert (=> d!54141 m!208095))

(assert (=> d!54141 m!208097))

(declare-fun m!208223 () Bool)

(assert (=> d!54141 m!208223))

(assert (=> d!54141 m!208095))

(assert (=> d!54141 m!208113))

(assert (=> b!180605 d!54141))

(declare-fun d!54143 () Bool)

(assert (=> d!54143 (= (apply!150 (+!267 lt!89167 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248))) lt!89169) (get!2062 (getValueByKey!205 (toList!1144 (+!267 lt!89167 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248)))) lt!89169)))))

(declare-fun bs!7360 () Bool)

(assert (= bs!7360 d!54143))

(declare-fun m!208225 () Bool)

(assert (=> bs!7360 m!208225))

(assert (=> bs!7360 m!208225))

(declare-fun m!208227 () Bool)

(assert (=> bs!7360 m!208227))

(assert (=> b!180605 d!54143))

(declare-fun d!54145 () Bool)

(declare-fun e!119040 () Bool)

(assert (=> d!54145 e!119040))

(declare-fun res!85551 () Bool)

(assert (=> d!54145 (=> (not res!85551) (not e!119040))))

(declare-fun lt!89238 () ListLongMap!2257)

(assert (=> d!54145 (= res!85551 (contains!1226 lt!89238 (_1!1685 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248)))))))

(declare-fun lt!89239 () List!2296)

(assert (=> d!54145 (= lt!89238 (ListLongMap!2258 lt!89239))))

(declare-fun lt!89237 () Unit!5467)

(declare-fun lt!89240 () Unit!5467)

(assert (=> d!54145 (= lt!89237 lt!89240)))

(assert (=> d!54145 (= (getValueByKey!205 lt!89239 (_1!1685 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248)))) (Some!210 (_2!1685 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248)))))))

(assert (=> d!54145 (= lt!89240 (lemmaContainsTupThenGetReturnValue!110 lt!89239 (_1!1685 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248))) (_2!1685 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248)))))))

(assert (=> d!54145 (= lt!89239 (insertStrictlySorted!113 (toList!1144 lt!89179) (_1!1685 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248))) (_2!1685 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248)))))))

(assert (=> d!54145 (= (+!267 lt!89179 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248))) lt!89238)))

(declare-fun b!180723 () Bool)

(declare-fun res!85550 () Bool)

(assert (=> b!180723 (=> (not res!85550) (not e!119040))))

(assert (=> b!180723 (= res!85550 (= (getValueByKey!205 (toList!1144 lt!89238) (_1!1685 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248)))) (Some!210 (_2!1685 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248))))))))

(declare-fun b!180724 () Bool)

(assert (=> b!180724 (= e!119040 (contains!1230 (toList!1144 lt!89238) (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248))))))

(assert (= (and d!54145 res!85551) b!180723))

(assert (= (and b!180723 res!85550) b!180724))

(declare-fun m!208229 () Bool)

(assert (=> d!54145 m!208229))

(declare-fun m!208231 () Bool)

(assert (=> d!54145 m!208231))

(declare-fun m!208233 () Bool)

(assert (=> d!54145 m!208233))

(declare-fun m!208235 () Bool)

(assert (=> d!54145 m!208235))

(declare-fun m!208237 () Bool)

(assert (=> b!180723 m!208237))

(declare-fun m!208239 () Bool)

(assert (=> b!180724 m!208239))

(assert (=> b!180605 d!54145))

(declare-fun d!54147 () Bool)

(declare-fun e!119042 () Bool)

(assert (=> d!54147 e!119042))

(declare-fun res!85552 () Bool)

(assert (=> d!54147 (=> res!85552 e!119042)))

(declare-fun lt!89242 () Bool)

(assert (=> d!54147 (= res!85552 (not lt!89242))))

(declare-fun lt!89244 () Bool)

(assert (=> d!54147 (= lt!89242 lt!89244)))

(declare-fun lt!89243 () Unit!5467)

(declare-fun e!119041 () Unit!5467)

(assert (=> d!54147 (= lt!89243 e!119041)))

(declare-fun c!32375 () Bool)

(assert (=> d!54147 (= c!32375 lt!89244)))

(assert (=> d!54147 (= lt!89244 (containsKey!209 (toList!1144 (+!267 lt!89178 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248)))) lt!89177))))

(assert (=> d!54147 (= (contains!1226 (+!267 lt!89178 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248))) lt!89177) lt!89242)))

(declare-fun b!180725 () Bool)

(declare-fun lt!89241 () Unit!5467)

(assert (=> b!180725 (= e!119041 lt!89241)))

(assert (=> b!180725 (= lt!89241 (lemmaContainsKeyImpliesGetValueByKeyDefined!158 (toList!1144 (+!267 lt!89178 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248)))) lt!89177))))

(assert (=> b!180725 (isDefined!159 (getValueByKey!205 (toList!1144 (+!267 lt!89178 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248)))) lt!89177))))

(declare-fun b!180726 () Bool)

(declare-fun Unit!5472 () Unit!5467)

(assert (=> b!180726 (= e!119041 Unit!5472)))

(declare-fun b!180727 () Bool)

(assert (=> b!180727 (= e!119042 (isDefined!159 (getValueByKey!205 (toList!1144 (+!267 lt!89178 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248)))) lt!89177)))))

(assert (= (and d!54147 c!32375) b!180725))

(assert (= (and d!54147 (not c!32375)) b!180726))

(assert (= (and d!54147 (not res!85552)) b!180727))

(declare-fun m!208241 () Bool)

(assert (=> d!54147 m!208241))

(declare-fun m!208243 () Bool)

(assert (=> b!180725 m!208243))

(declare-fun m!208245 () Bool)

(assert (=> b!180725 m!208245))

(assert (=> b!180725 m!208245))

(declare-fun m!208247 () Bool)

(assert (=> b!180725 m!208247))

(assert (=> b!180727 m!208245))

(assert (=> b!180727 m!208245))

(assert (=> b!180727 m!208247))

(assert (=> b!180605 d!54147))

(declare-fun d!54149 () Bool)

(assert (=> d!54149 (contains!1226 (+!267 lt!89178 (tuple2!3349 lt!89163 (zeroValue!3547 thiss!1248))) lt!89177)))

(declare-fun lt!89247 () Unit!5467)

(declare-fun choose!966 (ListLongMap!2257 (_ BitVec 64) V!5297 (_ BitVec 64)) Unit!5467)

(assert (=> d!54149 (= lt!89247 (choose!966 lt!89178 lt!89163 (zeroValue!3547 thiss!1248) lt!89177))))

(assert (=> d!54149 (contains!1226 lt!89178 lt!89177)))

(assert (=> d!54149 (= (addStillContains!126 lt!89178 lt!89163 (zeroValue!3547 thiss!1248) lt!89177) lt!89247)))

(declare-fun bs!7361 () Bool)

(assert (= bs!7361 d!54149))

(assert (=> bs!7361 m!208103))

(assert (=> bs!7361 m!208103))

(assert (=> bs!7361 m!208105))

(declare-fun m!208249 () Bool)

(assert (=> bs!7361 m!208249))

(declare-fun m!208251 () Bool)

(assert (=> bs!7361 m!208251))

(assert (=> b!180605 d!54149))

(declare-fun d!54151 () Bool)

(assert (=> d!54151 (= (apply!150 (+!267 lt!89179 (tuple2!3349 lt!89176 (zeroValue!3547 thiss!1248))) lt!89174) (apply!150 lt!89179 lt!89174))))

(declare-fun lt!89248 () Unit!5467)

(assert (=> d!54151 (= lt!89248 (choose!965 lt!89179 lt!89176 (zeroValue!3547 thiss!1248) lt!89174))))

(declare-fun e!119043 () Bool)

(assert (=> d!54151 e!119043))

(declare-fun res!85553 () Bool)

(assert (=> d!54151 (=> (not res!85553) (not e!119043))))

(assert (=> d!54151 (= res!85553 (contains!1226 lt!89179 lt!89174))))

(assert (=> d!54151 (= (addApplyDifferent!126 lt!89179 lt!89176 (zeroValue!3547 thiss!1248) lt!89174) lt!89248)))

(declare-fun b!180729 () Bool)

(assert (=> b!180729 (= e!119043 (not (= lt!89174 lt!89176)))))

(assert (= (and d!54151 res!85553) b!180729))

(declare-fun m!208253 () Bool)

(assert (=> d!54151 m!208253))

(assert (=> d!54151 m!208099))

(assert (=> d!54151 m!208111))

(declare-fun m!208255 () Bool)

(assert (=> d!54151 m!208255))

(assert (=> d!54151 m!208099))

(assert (=> d!54151 m!208101))

(assert (=> b!180605 d!54151))

(declare-fun d!54153 () Bool)

(declare-fun e!119044 () Bool)

(assert (=> d!54153 e!119044))

(declare-fun res!85555 () Bool)

(assert (=> d!54153 (=> (not res!85555) (not e!119044))))

(declare-fun lt!89250 () ListLongMap!2257)

(assert (=> d!54153 (= res!85555 (contains!1226 lt!89250 (_1!1685 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248)))))))

(declare-fun lt!89251 () List!2296)

(assert (=> d!54153 (= lt!89250 (ListLongMap!2258 lt!89251))))

(declare-fun lt!89249 () Unit!5467)

(declare-fun lt!89252 () Unit!5467)

(assert (=> d!54153 (= lt!89249 lt!89252)))

(assert (=> d!54153 (= (getValueByKey!205 lt!89251 (_1!1685 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248)))) (Some!210 (_2!1685 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248)))))))

(assert (=> d!54153 (= lt!89252 (lemmaContainsTupThenGetReturnValue!110 lt!89251 (_1!1685 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248))) (_2!1685 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248)))))))

(assert (=> d!54153 (= lt!89251 (insertStrictlySorted!113 (toList!1144 lt!89167) (_1!1685 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248))) (_2!1685 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248)))))))

(assert (=> d!54153 (= (+!267 lt!89167 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248))) lt!89250)))

(declare-fun b!180730 () Bool)

(declare-fun res!85554 () Bool)

(assert (=> b!180730 (=> (not res!85554) (not e!119044))))

(assert (=> b!180730 (= res!85554 (= (getValueByKey!205 (toList!1144 lt!89250) (_1!1685 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248)))) (Some!210 (_2!1685 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248))))))))

(declare-fun b!180731 () Bool)

(assert (=> b!180731 (= e!119044 (contains!1230 (toList!1144 lt!89250) (tuple2!3349 lt!89181 (minValue!3547 thiss!1248))))))

(assert (= (and d!54153 res!85555) b!180730))

(assert (= (and b!180730 res!85554) b!180731))

(declare-fun m!208257 () Bool)

(assert (=> d!54153 m!208257))

(declare-fun m!208259 () Bool)

(assert (=> d!54153 m!208259))

(declare-fun m!208261 () Bool)

(assert (=> d!54153 m!208261))

(declare-fun m!208263 () Bool)

(assert (=> d!54153 m!208263))

(declare-fun m!208265 () Bool)

(assert (=> b!180730 m!208265))

(declare-fun m!208267 () Bool)

(assert (=> b!180731 m!208267))

(assert (=> b!180605 d!54153))

(declare-fun d!54155 () Bool)

(assert (=> d!54155 (= (apply!150 (+!267 lt!89167 (tuple2!3349 lt!89181 (minValue!3547 thiss!1248))) lt!89169) (apply!150 lt!89167 lt!89169))))

(declare-fun lt!89253 () Unit!5467)

(assert (=> d!54155 (= lt!89253 (choose!965 lt!89167 lt!89181 (minValue!3547 thiss!1248) lt!89169))))

(declare-fun e!119045 () Bool)

(assert (=> d!54155 e!119045))

(declare-fun res!85556 () Bool)

(assert (=> d!54155 (=> (not res!85556) (not e!119045))))

(assert (=> d!54155 (= res!85556 (contains!1226 lt!89167 lt!89169))))

(assert (=> d!54155 (= (addApplyDifferent!126 lt!89167 lt!89181 (minValue!3547 thiss!1248) lt!89169) lt!89253)))

(declare-fun b!180732 () Bool)

(assert (=> b!180732 (= e!119045 (not (= lt!89169 lt!89181)))))

(assert (= (and d!54155 res!85556) b!180732))

(declare-fun m!208269 () Bool)

(assert (=> d!54155 m!208269))

(assert (=> d!54155 m!208091))

(assert (=> d!54155 m!208093))

(declare-fun m!208271 () Bool)

(assert (=> d!54155 m!208271))

(assert (=> d!54155 m!208091))

(assert (=> d!54155 m!208109))

(assert (=> b!180605 d!54155))

(declare-fun d!54157 () Bool)

(assert (=> d!54157 (= (apply!150 lt!89179 lt!89174) (get!2062 (getValueByKey!205 (toList!1144 lt!89179) lt!89174)))))

(declare-fun bs!7362 () Bool)

(assert (= bs!7362 d!54157))

(declare-fun m!208273 () Bool)

(assert (=> bs!7362 m!208273))

(assert (=> bs!7362 m!208273))

(declare-fun m!208275 () Bool)

(assert (=> bs!7362 m!208275))

(assert (=> b!180605 d!54157))

(declare-fun d!54159 () Bool)

(declare-fun e!119046 () Bool)

(assert (=> d!54159 e!119046))

(declare-fun res!85558 () Bool)

(assert (=> d!54159 (=> (not res!85558) (not e!119046))))

(declare-fun lt!89255 () ListLongMap!2257)

(assert (=> d!54159 (= res!85558 (contains!1226 lt!89255 (_1!1685 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248)))))))

(declare-fun lt!89256 () List!2296)

(assert (=> d!54159 (= lt!89255 (ListLongMap!2258 lt!89256))))

(declare-fun lt!89254 () Unit!5467)

(declare-fun lt!89257 () Unit!5467)

(assert (=> d!54159 (= lt!89254 lt!89257)))

(assert (=> d!54159 (= (getValueByKey!205 lt!89256 (_1!1685 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248)))) (Some!210 (_2!1685 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248)))))))

(assert (=> d!54159 (= lt!89257 (lemmaContainsTupThenGetReturnValue!110 lt!89256 (_1!1685 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248))) (_2!1685 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248)))))))

(assert (=> d!54159 (= lt!89256 (insertStrictlySorted!113 (toList!1144 lt!89165) (_1!1685 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248))) (_2!1685 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248)))))))

(assert (=> d!54159 (= (+!267 lt!89165 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248))) lt!89255)))

(declare-fun b!180733 () Bool)

(declare-fun res!85557 () Bool)

(assert (=> b!180733 (=> (not res!85557) (not e!119046))))

(assert (=> b!180733 (= res!85557 (= (getValueByKey!205 (toList!1144 lt!89255) (_1!1685 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248)))) (Some!210 (_2!1685 (tuple2!3349 lt!89182 (minValue!3547 thiss!1248))))))))

(declare-fun b!180734 () Bool)

(assert (=> b!180734 (= e!119046 (contains!1230 (toList!1144 lt!89255) (tuple2!3349 lt!89182 (minValue!3547 thiss!1248))))))

(assert (= (and d!54159 res!85558) b!180733))

(assert (= (and b!180733 res!85557) b!180734))

(declare-fun m!208277 () Bool)

(assert (=> d!54159 m!208277))

(declare-fun m!208279 () Bool)

(assert (=> d!54159 m!208279))

(declare-fun m!208281 () Bool)

(assert (=> d!54159 m!208281))

(declare-fun m!208283 () Bool)

(assert (=> d!54159 m!208283))

(declare-fun m!208285 () Bool)

(assert (=> b!180733 m!208285))

(declare-fun m!208287 () Bool)

(assert (=> b!180734 m!208287))

(assert (=> b!180605 d!54159))

(declare-fun d!54161 () Bool)

(assert (=> d!54161 (isDefined!159 (getValueByKey!205 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))

(declare-fun lt!89260 () Unit!5467)

(declare-fun choose!967 (List!2296 (_ BitVec 64)) Unit!5467)

(assert (=> d!54161 (= lt!89260 (choose!967 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))

(declare-fun e!119049 () Bool)

(assert (=> d!54161 e!119049))

(declare-fun res!85561 () Bool)

(assert (=> d!54161 (=> (not res!85561) (not e!119049))))

(declare-fun isStrictlySorted!336 (List!2296) Bool)

(assert (=> d!54161 (= res!85561 (isStrictlySorted!336 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))))

(assert (=> d!54161 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!158 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828) lt!89260)))

(declare-fun b!180737 () Bool)

(assert (=> b!180737 (= e!119049 (containsKey!209 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))

(assert (= (and d!54161 res!85561) b!180737))

(assert (=> d!54161 m!208057))

(assert (=> d!54161 m!208057))

(assert (=> d!54161 m!208059))

(declare-fun m!208289 () Bool)

(assert (=> d!54161 m!208289))

(declare-fun m!208291 () Bool)

(assert (=> d!54161 m!208291))

(assert (=> b!180737 m!208053))

(assert (=> b!180555 d!54161))

(declare-fun d!54163 () Bool)

(declare-fun isEmpty!460 (Option!211) Bool)

(assert (=> d!54163 (= (isDefined!159 (getValueByKey!205 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828)) (not (isEmpty!460 (getValueByKey!205 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828))))))

(declare-fun bs!7363 () Bool)

(assert (= bs!7363 d!54163))

(assert (=> bs!7363 m!208057))

(declare-fun m!208293 () Bool)

(assert (=> bs!7363 m!208293))

(assert (=> b!180555 d!54163))

(declare-fun d!54165 () Bool)

(declare-fun c!32380 () Bool)

(assert (=> d!54165 (= c!32380 (and ((_ is Cons!2292) (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))) (= (_1!1685 (h!2917 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))))) key!828)))))

(declare-fun e!119054 () Option!211)

(assert (=> d!54165 (= (getValueByKey!205 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828) e!119054)))

(declare-fun b!180748 () Bool)

(declare-fun e!119055 () Option!211)

(assert (=> b!180748 (= e!119055 (getValueByKey!205 (t!7137 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))) key!828))))

(declare-fun b!180749 () Bool)

(assert (=> b!180749 (= e!119055 None!209)))

(declare-fun b!180747 () Bool)

(assert (=> b!180747 (= e!119054 e!119055)))

(declare-fun c!32381 () Bool)

(assert (=> b!180747 (= c!32381 (and ((_ is Cons!2292) (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))) (not (= (_1!1685 (h!2917 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))))) key!828))))))

(declare-fun b!180746 () Bool)

(assert (=> b!180746 (= e!119054 (Some!210 (_2!1685 (h!2917 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))))))))

(assert (= (and d!54165 c!32380) b!180746))

(assert (= (and d!54165 (not c!32380)) b!180747))

(assert (= (and b!180747 c!32381) b!180748))

(assert (= (and b!180747 (not c!32381)) b!180749))

(declare-fun m!208295 () Bool)

(assert (=> b!180748 m!208295))

(assert (=> b!180555 d!54165))

(declare-fun d!54167 () Bool)

(declare-fun e!119057 () Bool)

(assert (=> d!54167 e!119057))

(declare-fun res!85562 () Bool)

(assert (=> d!54167 (=> res!85562 e!119057)))

(declare-fun lt!89262 () Bool)

(assert (=> d!54167 (= res!85562 (not lt!89262))))

(declare-fun lt!89264 () Bool)

(assert (=> d!54167 (= lt!89262 lt!89264)))

(declare-fun lt!89263 () Unit!5467)

(declare-fun e!119056 () Unit!5467)

(assert (=> d!54167 (= lt!89263 e!119056)))

(declare-fun c!32382 () Bool)

(assert (=> d!54167 (= c!32382 lt!89264)))

(assert (=> d!54167 (= lt!89264 (containsKey!209 (toList!1144 lt!89175) (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54167 (= (contains!1226 lt!89175 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)) lt!89262)))

(declare-fun b!180750 () Bool)

(declare-fun lt!89261 () Unit!5467)

(assert (=> b!180750 (= e!119056 lt!89261)))

(assert (=> b!180750 (= lt!89261 (lemmaContainsKeyImpliesGetValueByKeyDefined!158 (toList!1144 lt!89175) (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180750 (isDefined!159 (getValueByKey!205 (toList!1144 lt!89175) (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180751 () Bool)

(declare-fun Unit!5473 () Unit!5467)

(assert (=> b!180751 (= e!119056 Unit!5473)))

(declare-fun b!180752 () Bool)

(assert (=> b!180752 (= e!119057 (isDefined!159 (getValueByKey!205 (toList!1144 lt!89175) (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54167 c!32382) b!180750))

(assert (= (and d!54167 (not c!32382)) b!180751))

(assert (= (and d!54167 (not res!85562)) b!180752))

(assert (=> d!54167 m!208061))

(declare-fun m!208297 () Bool)

(assert (=> d!54167 m!208297))

(assert (=> b!180750 m!208061))

(declare-fun m!208299 () Bool)

(assert (=> b!180750 m!208299))

(assert (=> b!180750 m!208061))

(assert (=> b!180750 m!208141))

(assert (=> b!180750 m!208141))

(declare-fun m!208301 () Bool)

(assert (=> b!180750 m!208301))

(assert (=> b!180752 m!208061))

(assert (=> b!180752 m!208141))

(assert (=> b!180752 m!208141))

(assert (=> b!180752 m!208301))

(assert (=> b!180614 d!54167))

(assert (=> d!54111 d!54113))

(declare-fun b!180771 () Bool)

(declare-fun lt!89270 () SeekEntryResult!603)

(assert (=> b!180771 (and (bvsge (index!4584 lt!89270) #b00000000000000000000000000000000) (bvslt (index!4584 lt!89270) (size!3919 (_keys!5599 thiss!1248))))))

(declare-fun res!85569 () Bool)

(assert (=> b!180771 (= res!85569 (= (select (arr!3610 (_keys!5599 thiss!1248)) (index!4584 lt!89270)) key!828))))

(declare-fun e!119072 () Bool)

(assert (=> b!180771 (=> res!85569 e!119072)))

(declare-fun e!119070 () Bool)

(assert (=> b!180771 (= e!119070 e!119072)))

(declare-fun b!180772 () Bool)

(declare-fun e!119071 () Bool)

(assert (=> b!180772 (= e!119071 e!119070)))

(declare-fun res!85571 () Bool)

(assert (=> b!180772 (= res!85571 (and ((_ is Intermediate!603) lt!89270) (not (undefined!1415 lt!89270)) (bvslt (x!19754 lt!89270) #b01111111111111111111111111111110) (bvsge (x!19754 lt!89270) #b00000000000000000000000000000000) (bvsge (x!19754 lt!89270) #b00000000000000000000000000000000)))))

(assert (=> b!180772 (=> (not res!85571) (not e!119070))))

(declare-fun d!54169 () Bool)

(assert (=> d!54169 e!119071))

(declare-fun c!32391 () Bool)

(assert (=> d!54169 (= c!32391 (and ((_ is Intermediate!603) lt!89270) (undefined!1415 lt!89270)))))

(declare-fun e!119069 () SeekEntryResult!603)

(assert (=> d!54169 (= lt!89270 e!119069)))

(declare-fun c!32390 () Bool)

(assert (=> d!54169 (= c!32390 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!89269 () (_ BitVec 64))

(assert (=> d!54169 (= lt!89269 (select (arr!3610 (_keys!5599 thiss!1248)) (toIndex!0 key!828 (mask!8710 thiss!1248))))))

(assert (=> d!54169 (validMask!0 (mask!8710 thiss!1248))))

(assert (=> d!54169 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8710 thiss!1248)) key!828 (_keys!5599 thiss!1248) (mask!8710 thiss!1248)) lt!89270)))

(declare-fun b!180773 () Bool)

(assert (=> b!180773 (and (bvsge (index!4584 lt!89270) #b00000000000000000000000000000000) (bvslt (index!4584 lt!89270) (size!3919 (_keys!5599 thiss!1248))))))

(assert (=> b!180773 (= e!119072 (= (select (arr!3610 (_keys!5599 thiss!1248)) (index!4584 lt!89270)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180774 () Bool)

(assert (=> b!180774 (= e!119071 (bvsge (x!19754 lt!89270) #b01111111111111111111111111111110))))

(declare-fun b!180775 () Bool)

(assert (=> b!180775 (= e!119069 (Intermediate!603 true (toIndex!0 key!828 (mask!8710 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!180776 () Bool)

(declare-fun e!119068 () SeekEntryResult!603)

(assert (=> b!180776 (= e!119068 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8710 thiss!1248)) #b00000000000000000000000000000000 (mask!8710 thiss!1248)) key!828 (_keys!5599 thiss!1248) (mask!8710 thiss!1248)))))

(declare-fun b!180777 () Bool)

(assert (=> b!180777 (and (bvsge (index!4584 lt!89270) #b00000000000000000000000000000000) (bvslt (index!4584 lt!89270) (size!3919 (_keys!5599 thiss!1248))))))

(declare-fun res!85570 () Bool)

(assert (=> b!180777 (= res!85570 (= (select (arr!3610 (_keys!5599 thiss!1248)) (index!4584 lt!89270)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180777 (=> res!85570 e!119072)))

(declare-fun b!180778 () Bool)

(assert (=> b!180778 (= e!119069 e!119068)))

(declare-fun c!32389 () Bool)

(assert (=> b!180778 (= c!32389 (or (= lt!89269 key!828) (= (bvadd lt!89269 lt!89269) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180779 () Bool)

(assert (=> b!180779 (= e!119068 (Intermediate!603 false (toIndex!0 key!828 (mask!8710 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!54169 c!32390) b!180775))

(assert (= (and d!54169 (not c!32390)) b!180778))

(assert (= (and b!180778 c!32389) b!180779))

(assert (= (and b!180778 (not c!32389)) b!180776))

(assert (= (and d!54169 c!32391) b!180774))

(assert (= (and d!54169 (not c!32391)) b!180772))

(assert (= (and b!180772 res!85571) b!180771))

(assert (= (and b!180771 (not res!85569)) b!180777))

(assert (= (and b!180777 (not res!85570)) b!180773))

(declare-fun m!208303 () Bool)

(assert (=> b!180773 m!208303))

(assert (=> b!180777 m!208303))

(assert (=> b!180771 m!208303))

(assert (=> d!54169 m!208033))

(declare-fun m!208305 () Bool)

(assert (=> d!54169 m!208305))

(assert (=> d!54169 m!207993))

(assert (=> b!180776 m!208033))

(declare-fun m!208307 () Bool)

(assert (=> b!180776 m!208307))

(assert (=> b!180776 m!208307))

(declare-fun m!208309 () Bool)

(assert (=> b!180776 m!208309))

(assert (=> d!54101 d!54169))

(declare-fun d!54171 () Bool)

(declare-fun lt!89276 () (_ BitVec 32))

(declare-fun lt!89275 () (_ BitVec 32))

(assert (=> d!54171 (= lt!89276 (bvmul (bvxor lt!89275 (bvlshr lt!89275 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54171 (= lt!89275 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54171 (and (bvsge (mask!8710 thiss!1248) #b00000000000000000000000000000000) (let ((res!85572 (let ((h!2921 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19773 (bvmul (bvxor h!2921 (bvlshr h!2921 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19773 (bvlshr x!19773 #b00000000000000000000000000001101)) (mask!8710 thiss!1248)))))) (and (bvslt res!85572 (bvadd (mask!8710 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!85572 #b00000000000000000000000000000000))))))

(assert (=> d!54171 (= (toIndex!0 key!828 (mask!8710 thiss!1248)) (bvand (bvxor lt!89276 (bvlshr lt!89276 #b00000000000000000000000000001101)) (mask!8710 thiss!1248)))))

(assert (=> d!54101 d!54171))

(assert (=> d!54101 d!54113))

(assert (=> b!180557 d!54163))

(assert (=> b!180557 d!54165))

(declare-fun d!54173 () Bool)

(assert (=> d!54173 (= (validKeyInArray!0 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!180607 d!54173))

(declare-fun d!54175 () Bool)

(assert (=> d!54175 (= (apply!150 lt!89175 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2062 (getValueByKey!205 (toList!1144 lt!89175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7364 () Bool)

(assert (= bs!7364 d!54175))

(assert (=> bs!7364 m!208169))

(assert (=> bs!7364 m!208169))

(declare-fun m!208311 () Bool)

(assert (=> bs!7364 m!208311))

(assert (=> b!180601 d!54175))

(declare-fun d!54177 () Bool)

(assert (=> d!54177 (= (apply!150 lt!89175 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2062 (getValueByKey!205 (toList!1144 lt!89175) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7365 () Bool)

(assert (= bs!7365 d!54177))

(declare-fun m!208313 () Bool)

(assert (=> bs!7365 m!208313))

(assert (=> bs!7365 m!208313))

(declare-fun m!208315 () Bool)

(assert (=> bs!7365 m!208315))

(assert (=> b!180618 d!54177))

(declare-fun b!180791 () Bool)

(declare-fun e!119075 () Bool)

(assert (=> b!180791 (= e!119075 (and (bvsge (extraKeys!3443 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3443 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1278 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!180790 () Bool)

(declare-fun res!85582 () Bool)

(assert (=> b!180790 (=> (not res!85582) (not e!119075))))

(declare-fun size!3925 (LongMapFixedSize!2458) (_ BitVec 32))

(assert (=> b!180790 (= res!85582 (= (size!3925 thiss!1248) (bvadd (_size!1278 thiss!1248) (bvsdiv (bvadd (extraKeys!3443 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!54179 () Bool)

(declare-fun res!85581 () Bool)

(assert (=> d!54179 (=> (not res!85581) (not e!119075))))

(assert (=> d!54179 (= res!85581 (validMask!0 (mask!8710 thiss!1248)))))

(assert (=> d!54179 (= (simpleValid!166 thiss!1248) e!119075)))

(declare-fun b!180789 () Bool)

(declare-fun res!85584 () Bool)

(assert (=> b!180789 (=> (not res!85584) (not e!119075))))

(assert (=> b!180789 (= res!85584 (bvsge (size!3925 thiss!1248) (_size!1278 thiss!1248)))))

(declare-fun b!180788 () Bool)

(declare-fun res!85583 () Bool)

(assert (=> b!180788 (=> (not res!85583) (not e!119075))))

(assert (=> b!180788 (= res!85583 (and (= (size!3920 (_values!3689 thiss!1248)) (bvadd (mask!8710 thiss!1248) #b00000000000000000000000000000001)) (= (size!3919 (_keys!5599 thiss!1248)) (size!3920 (_values!3689 thiss!1248))) (bvsge (_size!1278 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1278 thiss!1248) (bvadd (mask!8710 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!54179 res!85581) b!180788))

(assert (= (and b!180788 res!85583) b!180789))

(assert (= (and b!180789 res!85584) b!180790))

(assert (= (and b!180790 res!85582) b!180791))

(declare-fun m!208317 () Bool)

(assert (=> b!180790 m!208317))

(assert (=> d!54179 m!207993))

(assert (=> b!180789 m!208317))

(assert (=> d!54103 d!54179))

(declare-fun d!54181 () Bool)

(declare-fun e!119077 () Bool)

(assert (=> d!54181 e!119077))

(declare-fun res!85585 () Bool)

(assert (=> d!54181 (=> res!85585 e!119077)))

(declare-fun lt!89278 () Bool)

(assert (=> d!54181 (= res!85585 (not lt!89278))))

(declare-fun lt!89280 () Bool)

(assert (=> d!54181 (= lt!89278 lt!89280)))

(declare-fun lt!89279 () Unit!5467)

(declare-fun e!119076 () Unit!5467)

(assert (=> d!54181 (= lt!89279 e!119076)))

(declare-fun c!32392 () Bool)

(assert (=> d!54181 (= c!32392 lt!89280)))

(assert (=> d!54181 (= lt!89280 (containsKey!209 (toList!1144 lt!89175) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54181 (= (contains!1226 lt!89175 #b0000000000000000000000000000000000000000000000000000000000000000) lt!89278)))

(declare-fun b!180792 () Bool)

(declare-fun lt!89277 () Unit!5467)

(assert (=> b!180792 (= e!119076 lt!89277)))

(assert (=> b!180792 (= lt!89277 (lemmaContainsKeyImpliesGetValueByKeyDefined!158 (toList!1144 lt!89175) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180792 (isDefined!159 (getValueByKey!205 (toList!1144 lt!89175) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180793 () Bool)

(declare-fun Unit!5474 () Unit!5467)

(assert (=> b!180793 (= e!119076 Unit!5474)))

(declare-fun b!180794 () Bool)

(assert (=> b!180794 (= e!119077 (isDefined!159 (getValueByKey!205 (toList!1144 lt!89175) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54181 c!32392) b!180792))

(assert (= (and d!54181 (not c!32392)) b!180793))

(assert (= (and d!54181 (not res!85585)) b!180794))

(declare-fun m!208319 () Bool)

(assert (=> d!54181 m!208319))

(declare-fun m!208321 () Bool)

(assert (=> b!180792 m!208321))

(assert (=> b!180792 m!208313))

(assert (=> b!180792 m!208313))

(declare-fun m!208323 () Bool)

(assert (=> b!180792 m!208323))

(assert (=> b!180794 m!208313))

(assert (=> b!180794 m!208313))

(assert (=> b!180794 m!208323))

(assert (=> bm!18246 d!54181))

(declare-fun b!180803 () Bool)

(declare-fun e!119083 () (_ BitVec 32))

(declare-fun call!18262 () (_ BitVec 32))

(assert (=> b!180803 (= e!119083 (bvadd #b00000000000000000000000000000001 call!18262))))

(declare-fun d!54183 () Bool)

(declare-fun lt!89283 () (_ BitVec 32))

(assert (=> d!54183 (and (bvsge lt!89283 #b00000000000000000000000000000000) (bvsle lt!89283 (bvsub (size!3919 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119082 () (_ BitVec 32))

(assert (=> d!54183 (= lt!89283 e!119082)))

(declare-fun c!32397 () Bool)

(assert (=> d!54183 (= c!32397 (bvsge #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))))))

(assert (=> d!54183 (and (bvsle #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3919 (_keys!5599 thiss!1248)) (size!3919 (_keys!5599 thiss!1248))))))

(assert (=> d!54183 (= (arrayCountValidKeys!0 (_keys!5599 thiss!1248) #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))) lt!89283)))

(declare-fun bm!18259 () Bool)

(assert (=> bm!18259 (= call!18262 (arrayCountValidKeys!0 (_keys!5599 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3919 (_keys!5599 thiss!1248))))))

(declare-fun b!180804 () Bool)

(assert (=> b!180804 (= e!119082 #b00000000000000000000000000000000)))

(declare-fun b!180805 () Bool)

(assert (=> b!180805 (= e!119082 e!119083)))

(declare-fun c!32398 () Bool)

(assert (=> b!180805 (= c!32398 (validKeyInArray!0 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180806 () Bool)

(assert (=> b!180806 (= e!119083 call!18262)))

(assert (= (and d!54183 c!32397) b!180804))

(assert (= (and d!54183 (not c!32397)) b!180805))

(assert (= (and b!180805 c!32398) b!180803))

(assert (= (and b!180805 (not c!32398)) b!180806))

(assert (= (or b!180803 b!180806) bm!18259))

(declare-fun m!208325 () Bool)

(assert (=> bm!18259 m!208325))

(assert (=> b!180805 m!208061))

(assert (=> b!180805 m!208061))

(assert (=> b!180805 m!208067))

(assert (=> b!180546 d!54183))

(assert (=> b!180603 d!54173))

(declare-fun d!54185 () Bool)

(declare-fun res!85590 () Bool)

(declare-fun e!119088 () Bool)

(assert (=> d!54185 (=> res!85590 e!119088)))

(assert (=> d!54185 (= res!85590 (and ((_ is Cons!2292) (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))) (= (_1!1685 (h!2917 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))))) key!828)))))

(assert (=> d!54185 (= (containsKey!209 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))) key!828) e!119088)))

(declare-fun b!180811 () Bool)

(declare-fun e!119089 () Bool)

(assert (=> b!180811 (= e!119088 e!119089)))

(declare-fun res!85591 () Bool)

(assert (=> b!180811 (=> (not res!85591) (not e!119089))))

(assert (=> b!180811 (= res!85591 (and (or (not ((_ is Cons!2292) (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))))) (bvsle (_1!1685 (h!2917 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))))) key!828)) ((_ is Cons!2292) (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))) (bvslt (_1!1685 (h!2917 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248))))) key!828)))))

(declare-fun b!180812 () Bool)

(assert (=> b!180812 (= e!119089 (containsKey!209 (t!7137 (toList!1144 (getCurrentListMap!777 (_keys!5599 thiss!1248) (_values!3689 thiss!1248) (mask!8710 thiss!1248) (extraKeys!3443 thiss!1248) (zeroValue!3547 thiss!1248) (minValue!3547 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3706 thiss!1248)))) key!828))))

(assert (= (and d!54185 (not res!85590)) b!180811))

(assert (= (and b!180811 res!85591) b!180812))

(declare-fun m!208327 () Bool)

(assert (=> b!180812 m!208327))

(assert (=> d!54109 d!54185))

(declare-fun d!54187 () Bool)

(declare-fun res!85596 () Bool)

(declare-fun e!119098 () Bool)

(assert (=> d!54187 (=> res!85596 e!119098)))

(assert (=> d!54187 (= res!85596 (bvsge #b00000000000000000000000000000000 (size!3919 (_keys!5599 thiss!1248))))))

(assert (=> d!54187 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5599 thiss!1248) (mask!8710 thiss!1248)) e!119098)))

(declare-fun b!180821 () Bool)

(declare-fun e!119096 () Bool)

(assert (=> b!180821 (= e!119098 e!119096)))

(declare-fun c!32401 () Bool)

(assert (=> b!180821 (= c!32401 (validKeyInArray!0 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18262 () Bool)

(declare-fun call!18265 () Bool)

(assert (=> bm!18262 (= call!18265 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5599 thiss!1248) (mask!8710 thiss!1248)))))

(declare-fun b!180822 () Bool)

(assert (=> b!180822 (= e!119096 call!18265)))

(declare-fun b!180823 () Bool)

(declare-fun e!119097 () Bool)

(assert (=> b!180823 (= e!119096 e!119097)))

(declare-fun lt!89290 () (_ BitVec 64))

(assert (=> b!180823 (= lt!89290 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89292 () Unit!5467)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7629 (_ BitVec 64) (_ BitVec 32)) Unit!5467)

(assert (=> b!180823 (= lt!89292 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5599 thiss!1248) lt!89290 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!180823 (arrayContainsKey!0 (_keys!5599 thiss!1248) lt!89290 #b00000000000000000000000000000000)))

(declare-fun lt!89291 () Unit!5467)

(assert (=> b!180823 (= lt!89291 lt!89292)))

(declare-fun res!85597 () Bool)

(assert (=> b!180823 (= res!85597 (= (seekEntryOrOpen!0 (select (arr!3610 (_keys!5599 thiss!1248)) #b00000000000000000000000000000000) (_keys!5599 thiss!1248) (mask!8710 thiss!1248)) (Found!603 #b00000000000000000000000000000000)))))

(assert (=> b!180823 (=> (not res!85597) (not e!119097))))

(declare-fun b!180824 () Bool)

(assert (=> b!180824 (= e!119097 call!18265)))

(assert (= (and d!54187 (not res!85596)) b!180821))

(assert (= (and b!180821 c!32401) b!180823))

(assert (= (and b!180821 (not c!32401)) b!180822))

(assert (= (and b!180823 res!85597) b!180824))

(assert (= (or b!180824 b!180822) bm!18262))

(assert (=> b!180821 m!208061))

(assert (=> b!180821 m!208061))

(assert (=> b!180821 m!208067))

(declare-fun m!208329 () Bool)

(assert (=> bm!18262 m!208329))

(assert (=> b!180823 m!208061))

(declare-fun m!208331 () Bool)

(assert (=> b!180823 m!208331))

(declare-fun m!208333 () Bool)

(assert (=> b!180823 m!208333))

(assert (=> b!180823 m!208061))

(declare-fun m!208335 () Bool)

(assert (=> b!180823 m!208335))

(assert (=> b!180547 d!54187))

(declare-fun mapNonEmpty!7268 () Bool)

(declare-fun mapRes!7268 () Bool)

(declare-fun tp!16151 () Bool)

(declare-fun e!119099 () Bool)

(assert (=> mapNonEmpty!7268 (= mapRes!7268 (and tp!16151 e!119099))))

(declare-fun mapValue!7268 () ValueCell!1775)

(declare-fun mapRest!7268 () (Array (_ BitVec 32) ValueCell!1775))

(declare-fun mapKey!7268 () (_ BitVec 32))

(assert (=> mapNonEmpty!7268 (= mapRest!7267 (store mapRest!7268 mapKey!7268 mapValue!7268))))

(declare-fun condMapEmpty!7268 () Bool)

(declare-fun mapDefault!7268 () ValueCell!1775)

(assert (=> mapNonEmpty!7267 (= condMapEmpty!7268 (= mapRest!7267 ((as const (Array (_ BitVec 32) ValueCell!1775)) mapDefault!7268)))))

(declare-fun e!119100 () Bool)

(assert (=> mapNonEmpty!7267 (= tp!16150 (and e!119100 mapRes!7268))))

(declare-fun b!180825 () Bool)

(assert (=> b!180825 (= e!119099 tp_is_empty!4237)))

(declare-fun b!180826 () Bool)

(assert (=> b!180826 (= e!119100 tp_is_empty!4237)))

(declare-fun mapIsEmpty!7268 () Bool)

(assert (=> mapIsEmpty!7268 mapRes!7268))

(assert (= (and mapNonEmpty!7267 condMapEmpty!7268) mapIsEmpty!7268))

(assert (= (and mapNonEmpty!7267 (not condMapEmpty!7268)) mapNonEmpty!7268))

(assert (= (and mapNonEmpty!7268 ((_ is ValueCellFull!1775) mapValue!7268)) b!180825))

(assert (= (and mapNonEmpty!7267 ((_ is ValueCellFull!1775) mapDefault!7268)) b!180826))

(declare-fun m!208337 () Bool)

(assert (=> mapNonEmpty!7268 m!208337))

(declare-fun b_lambda!7113 () Bool)

(assert (= b_lambda!7111 (or (and b!180463 b_free!4465) b_lambda!7113)))

(declare-fun b_lambda!7115 () Bool)

(assert (= b_lambda!7109 (or (and b!180463 b_free!4465) b_lambda!7115)))

(check-sat (not b!180687) (not b!180685) (not b!180715) (not d!54161) (not b!180790) (not d!54123) (not b!180655) (not b!180718) (not mapNonEmpty!7268) (not b!180656) (not b!180776) (not b!180734) (not d!54133) (not d!54117) (not b!180805) (not b!180823) (not b!180696) (not d!54155) (not d!54181) (not b!180659) (not b!180748) (not b!180789) (not b!180750) (not b!180694) (not d!54131) (not d!54167) (not b!180724) (not d!54141) (not b!180821) (not b!180672) (not d!54125) (not b_lambda!7113) (not bm!18256) (not d!54145) (not d!54139) (not b!180684) (not d!54175) (not d!54177) (not bm!18259) (not b!180752) (not b!180792) (not b!180692) (not d!54157) (not d!54115) (not b!180657) (not b!180671) (not d!54137) (not b!180733) (not b!180727) (not b!180731) b_and!10985 (not b!180711) (not b!180658) (not d!54143) (not b!180665) (not d!54149) (not b!180737) (not b_lambda!7107) (not d!54147) (not b!180666) (not b_next!4465) (not bm!18253) tp_is_empty!4237 (not d!54169) (not b!180716) (not d!54159) (not b!180725) (not d!54151) (not b!180717) (not d!54127) (not b!180723) (not d!54163) (not bm!18262) (not d!54179) (not b!180730) (not b!180794) (not b!180812) (not b_lambda!7115) (not d!54129) (not d!54135) (not b!180662) (not d!54153) (not b!180693))
(check-sat b_and!10985 (not b_next!4465))
