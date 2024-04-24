; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18332 () Bool)

(assert start!18332)

(declare-fun b!182003 () Bool)

(declare-fun b_free!4489 () Bool)

(declare-fun b_next!4489 () Bool)

(assert (=> b!182003 (= b_free!4489 (not b_next!4489))))

(declare-fun tp!16221 () Bool)

(declare-fun b_and!11059 () Bool)

(assert (=> b!182003 (= tp!16221 b_and!11059)))

(declare-fun mapNonEmpty!7309 () Bool)

(declare-fun mapRes!7309 () Bool)

(declare-fun tp!16222 () Bool)

(declare-fun e!119855 () Bool)

(assert (=> mapNonEmpty!7309 (= mapRes!7309 (and tp!16222 e!119855))))

(declare-fun mapKey!7309 () (_ BitVec 32))

(declare-datatypes ((V!5329 0))(
  ( (V!5330 (val!2175 Int)) )
))
(declare-datatypes ((ValueCell!1787 0))(
  ( (ValueCellFull!1787 (v!4074 V!5329)) (EmptyCell!1787) )
))
(declare-fun mapRest!7309 () (Array (_ BitVec 32) ValueCell!1787))

(declare-datatypes ((array!7691 0))(
  ( (array!7692 (arr!3638 (Array (_ BitVec 32) (_ BitVec 64))) (size!3949 (_ BitVec 32))) )
))
(declare-datatypes ((array!7693 0))(
  ( (array!7694 (arr!3639 (Array (_ BitVec 32) ValueCell!1787)) (size!3950 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2482 0))(
  ( (LongMapFixedSize!2483 (defaultEntry!3725 Int) (mask!8758 (_ BitVec 32)) (extraKeys!3462 (_ BitVec 32)) (zeroValue!3566 V!5329) (minValue!3566 V!5329) (_size!1290 (_ BitVec 32)) (_keys!5632 array!7691) (_values!3708 array!7693) (_vacant!1290 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2482)

(declare-fun mapValue!7309 () ValueCell!1787)

(assert (=> mapNonEmpty!7309 (= (arr!3639 (_values!3708 thiss!1248)) (store mapRest!7309 mapKey!7309 mapValue!7309))))

(declare-fun b!182001 () Bool)

(declare-fun e!119853 () Bool)

(declare-fun e!119854 () Bool)

(assert (=> b!182001 (= e!119853 e!119854)))

(declare-fun res!86143 () Bool)

(assert (=> b!182001 (=> (not res!86143) (not e!119854))))

(declare-datatypes ((SeekEntryResult!595 0))(
  ( (MissingZero!595 (index!4550 (_ BitVec 32))) (Found!595 (index!4551 (_ BitVec 32))) (Intermediate!595 (undefined!1407 Bool) (index!4552 (_ BitVec 32)) (x!19843 (_ BitVec 32))) (Undefined!595) (MissingVacant!595 (index!4553 (_ BitVec 32))) )
))
(declare-fun lt!90043 () SeekEntryResult!595)

(get-info :version)

(assert (=> b!182001 (= res!86143 (and (not ((_ is Undefined!595) lt!90043)) (not ((_ is MissingVacant!595) lt!90043)) (not ((_ is MissingZero!595) lt!90043)) ((_ is Found!595) lt!90043)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7691 (_ BitVec 32)) SeekEntryResult!595)

(assert (=> b!182001 (= lt!90043 (seekEntryOrOpen!0 key!828 (_keys!5632 thiss!1248) (mask!8758 thiss!1248)))))

(declare-fun b!182002 () Bool)

(declare-fun res!86142 () Bool)

(assert (=> b!182002 (=> (not res!86142) (not e!119853))))

(assert (=> b!182002 (= res!86142 (not (= key!828 (bvneg key!828))))))

(declare-fun tp_is_empty!4261 () Bool)

(declare-fun e!119856 () Bool)

(declare-fun e!119851 () Bool)

(declare-fun array_inv!2347 (array!7691) Bool)

(declare-fun array_inv!2348 (array!7693) Bool)

(assert (=> b!182003 (= e!119856 (and tp!16221 tp_is_empty!4261 (array_inv!2347 (_keys!5632 thiss!1248)) (array_inv!2348 (_values!3708 thiss!1248)) e!119851))))

(declare-fun b!182004 () Bool)

(declare-fun e!119852 () Bool)

(assert (=> b!182004 (= e!119851 (and e!119852 mapRes!7309))))

(declare-fun condMapEmpty!7309 () Bool)

(declare-fun mapDefault!7309 () ValueCell!1787)

(assert (=> b!182004 (= condMapEmpty!7309 (= (arr!3639 (_values!3708 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1787)) mapDefault!7309)))))

(declare-fun mapIsEmpty!7309 () Bool)

(assert (=> mapIsEmpty!7309 mapRes!7309))

(declare-fun res!86146 () Bool)

(assert (=> start!18332 (=> (not res!86146) (not e!119853))))

(declare-fun valid!1051 (LongMapFixedSize!2482) Bool)

(assert (=> start!18332 (= res!86146 (valid!1051 thiss!1248))))

(assert (=> start!18332 e!119853))

(assert (=> start!18332 e!119856))

(assert (=> start!18332 true))

(declare-fun b!182005 () Bool)

(assert (=> b!182005 (= e!119852 tp_is_empty!4261)))

(declare-fun b!182006 () Bool)

(declare-fun res!86145 () Bool)

(assert (=> b!182006 (=> (not res!86145) (not e!119854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182006 (= res!86145 (validMask!0 (mask!8758 thiss!1248)))))

(declare-fun b!182007 () Bool)

(assert (=> b!182007 (= e!119855 tp_is_empty!4261)))

(declare-fun b!182008 () Bool)

(assert (=> b!182008 (= e!119854 (and (= (size!3950 (_values!3708 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8758 thiss!1248))) (= (size!3949 (_keys!5632 thiss!1248)) (size!3950 (_values!3708 thiss!1248))) (bvsge (mask!8758 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3462 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3462 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!182009 () Bool)

(declare-fun res!86144 () Bool)

(assert (=> b!182009 (=> (not res!86144) (not e!119854))))

(declare-datatypes ((tuple2!3340 0))(
  ( (tuple2!3341 (_1!1681 (_ BitVec 64)) (_2!1681 V!5329)) )
))
(declare-datatypes ((List!2281 0))(
  ( (Nil!2278) (Cons!2277 (h!2905 tuple2!3340) (t!7131 List!2281)) )
))
(declare-datatypes ((ListLongMap!2261 0))(
  ( (ListLongMap!2262 (toList!1146 List!2281)) )
))
(declare-fun contains!1240 (ListLongMap!2261 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!798 (array!7691 array!7693 (_ BitVec 32) (_ BitVec 32) V!5329 V!5329 (_ BitVec 32) Int) ListLongMap!2261)

(assert (=> b!182009 (= res!86144 (contains!1240 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)) key!828))))

(assert (= (and start!18332 res!86146) b!182002))

(assert (= (and b!182002 res!86142) b!182001))

(assert (= (and b!182001 res!86143) b!182009))

(assert (= (and b!182009 res!86144) b!182006))

(assert (= (and b!182006 res!86145) b!182008))

(assert (= (and b!182004 condMapEmpty!7309) mapIsEmpty!7309))

(assert (= (and b!182004 (not condMapEmpty!7309)) mapNonEmpty!7309))

(assert (= (and mapNonEmpty!7309 ((_ is ValueCellFull!1787) mapValue!7309)) b!182007))

(assert (= (and b!182004 ((_ is ValueCellFull!1787) mapDefault!7309)) b!182005))

(assert (= b!182003 b!182004))

(assert (= start!18332 b!182003))

(declare-fun m!209987 () Bool)

(assert (=> mapNonEmpty!7309 m!209987))

(declare-fun m!209989 () Bool)

(assert (=> b!182003 m!209989))

(declare-fun m!209991 () Bool)

(assert (=> b!182003 m!209991))

(declare-fun m!209993 () Bool)

(assert (=> b!182006 m!209993))

(declare-fun m!209995 () Bool)

(assert (=> b!182001 m!209995))

(declare-fun m!209997 () Bool)

(assert (=> start!18332 m!209997))

(declare-fun m!209999 () Bool)

(assert (=> b!182009 m!209999))

(assert (=> b!182009 m!209999))

(declare-fun m!210001 () Bool)

(assert (=> b!182009 m!210001))

(check-sat (not b!182001) (not b!182003) (not start!18332) (not mapNonEmpty!7309) (not b_next!4489) (not b!182006) (not b!182009) b_and!11059 tp_is_empty!4261)
(check-sat b_and!11059 (not b_next!4489))
(get-model)

(declare-fun d!54609 () Bool)

(declare-fun res!86183 () Bool)

(declare-fun e!119901 () Bool)

(assert (=> d!54609 (=> (not res!86183) (not e!119901))))

(declare-fun simpleValid!170 (LongMapFixedSize!2482) Bool)

(assert (=> d!54609 (= res!86183 (simpleValid!170 thiss!1248))))

(assert (=> d!54609 (= (valid!1051 thiss!1248) e!119901)))

(declare-fun b!182070 () Bool)

(declare-fun res!86184 () Bool)

(assert (=> b!182070 (=> (not res!86184) (not e!119901))))

(declare-fun arrayCountValidKeys!0 (array!7691 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!182070 (= res!86184 (= (arrayCountValidKeys!0 (_keys!5632 thiss!1248) #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))) (_size!1290 thiss!1248)))))

(declare-fun b!182071 () Bool)

(declare-fun res!86185 () Bool)

(assert (=> b!182071 (=> (not res!86185) (not e!119901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7691 (_ BitVec 32)) Bool)

(assert (=> b!182071 (= res!86185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5632 thiss!1248) (mask!8758 thiss!1248)))))

(declare-fun b!182072 () Bool)

(declare-datatypes ((List!2282 0))(
  ( (Nil!2279) (Cons!2278 (h!2906 (_ BitVec 64)) (t!7134 List!2282)) )
))
(declare-fun arrayNoDuplicates!0 (array!7691 (_ BitVec 32) List!2282) Bool)

(assert (=> b!182072 (= e!119901 (arrayNoDuplicates!0 (_keys!5632 thiss!1248) #b00000000000000000000000000000000 Nil!2279))))

(assert (= (and d!54609 res!86183) b!182070))

(assert (= (and b!182070 res!86184) b!182071))

(assert (= (and b!182071 res!86185) b!182072))

(declare-fun m!210035 () Bool)

(assert (=> d!54609 m!210035))

(declare-fun m!210037 () Bool)

(assert (=> b!182070 m!210037))

(declare-fun m!210039 () Bool)

(assert (=> b!182071 m!210039))

(declare-fun m!210041 () Bool)

(assert (=> b!182072 m!210041))

(assert (=> start!18332 d!54609))

(declare-fun d!54611 () Bool)

(assert (=> d!54611 (= (array_inv!2347 (_keys!5632 thiss!1248)) (bvsge (size!3949 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182003 d!54611))

(declare-fun d!54613 () Bool)

(assert (=> d!54613 (= (array_inv!2348 (_values!3708 thiss!1248)) (bvsge (size!3950 (_values!3708 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182003 d!54613))

(declare-fun d!54615 () Bool)

(declare-fun e!119907 () Bool)

(assert (=> d!54615 e!119907))

(declare-fun res!86188 () Bool)

(assert (=> d!54615 (=> res!86188 e!119907)))

(declare-fun lt!90059 () Bool)

(assert (=> d!54615 (= res!86188 (not lt!90059))))

(declare-fun lt!90058 () Bool)

(assert (=> d!54615 (= lt!90059 lt!90058)))

(declare-datatypes ((Unit!5524 0))(
  ( (Unit!5525) )
))
(declare-fun lt!90061 () Unit!5524)

(declare-fun e!119906 () Unit!5524)

(assert (=> d!54615 (= lt!90061 e!119906)))

(declare-fun c!32643 () Bool)

(assert (=> d!54615 (= c!32643 lt!90058)))

(declare-fun containsKey!215 (List!2281 (_ BitVec 64)) Bool)

(assert (=> d!54615 (= lt!90058 (containsKey!215 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))

(assert (=> d!54615 (= (contains!1240 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)) key!828) lt!90059)))

(declare-fun b!182079 () Bool)

(declare-fun lt!90060 () Unit!5524)

(assert (=> b!182079 (= e!119906 lt!90060)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!163 (List!2281 (_ BitVec 64)) Unit!5524)

(assert (=> b!182079 (= lt!90060 (lemmaContainsKeyImpliesGetValueByKeyDefined!163 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))

(declare-datatypes ((Option!218 0))(
  ( (Some!217 (v!4077 V!5329)) (None!216) )
))
(declare-fun isDefined!164 (Option!218) Bool)

(declare-fun getValueByKey!212 (List!2281 (_ BitVec 64)) Option!218)

(assert (=> b!182079 (isDefined!164 (getValueByKey!212 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))

(declare-fun b!182080 () Bool)

(declare-fun Unit!5526 () Unit!5524)

(assert (=> b!182080 (= e!119906 Unit!5526)))

(declare-fun b!182081 () Bool)

(assert (=> b!182081 (= e!119907 (isDefined!164 (getValueByKey!212 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828)))))

(assert (= (and d!54615 c!32643) b!182079))

(assert (= (and d!54615 (not c!32643)) b!182080))

(assert (= (and d!54615 (not res!86188)) b!182081))

(declare-fun m!210043 () Bool)

(assert (=> d!54615 m!210043))

(declare-fun m!210045 () Bool)

(assert (=> b!182079 m!210045))

(declare-fun m!210047 () Bool)

(assert (=> b!182079 m!210047))

(assert (=> b!182079 m!210047))

(declare-fun m!210049 () Bool)

(assert (=> b!182079 m!210049))

(assert (=> b!182081 m!210047))

(assert (=> b!182081 m!210047))

(assert (=> b!182081 m!210049))

(assert (=> b!182009 d!54615))

(declare-fun b!182124 () Bool)

(declare-fun c!32656 () Bool)

(assert (=> b!182124 (= c!32656 (and (not (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!119941 () ListLongMap!2261)

(declare-fun e!119934 () ListLongMap!2261)

(assert (=> b!182124 (= e!119941 e!119934)))

(declare-fun b!182125 () Bool)

(declare-fun call!18379 () ListLongMap!2261)

(assert (=> b!182125 (= e!119934 call!18379)))

(declare-fun b!182126 () Bool)

(declare-fun e!119935 () Bool)

(declare-fun e!119945 () Bool)

(assert (=> b!182126 (= e!119935 e!119945)))

(declare-fun res!86213 () Bool)

(declare-fun call!18383 () Bool)

(assert (=> b!182126 (= res!86213 call!18383)))

(assert (=> b!182126 (=> (not res!86213) (not e!119945))))

(declare-fun b!182127 () Bool)

(declare-fun e!119939 () Unit!5524)

(declare-fun lt!90112 () Unit!5524)

(assert (=> b!182127 (= e!119939 lt!90112)))

(declare-fun lt!90123 () ListLongMap!2261)

(declare-fun getCurrentListMapNoExtraKeys!185 (array!7691 array!7693 (_ BitVec 32) (_ BitVec 32) V!5329 V!5329 (_ BitVec 32) Int) ListLongMap!2261)

(assert (=> b!182127 (= lt!90123 (getCurrentListMapNoExtraKeys!185 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))

(declare-fun lt!90127 () (_ BitVec 64))

(assert (=> b!182127 (= lt!90127 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90117 () (_ BitVec 64))

(assert (=> b!182127 (= lt!90117 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90121 () Unit!5524)

(declare-fun addStillContains!130 (ListLongMap!2261 (_ BitVec 64) V!5329 (_ BitVec 64)) Unit!5524)

(assert (=> b!182127 (= lt!90121 (addStillContains!130 lt!90123 lt!90127 (zeroValue!3566 thiss!1248) lt!90117))))

(declare-fun +!274 (ListLongMap!2261 tuple2!3340) ListLongMap!2261)

(assert (=> b!182127 (contains!1240 (+!274 lt!90123 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248))) lt!90117)))

(declare-fun lt!90125 () Unit!5524)

(assert (=> b!182127 (= lt!90125 lt!90121)))

(declare-fun lt!90109 () ListLongMap!2261)

(assert (=> b!182127 (= lt!90109 (getCurrentListMapNoExtraKeys!185 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))

(declare-fun lt!90118 () (_ BitVec 64))

(assert (=> b!182127 (= lt!90118 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90111 () (_ BitVec 64))

(assert (=> b!182127 (= lt!90111 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90107 () Unit!5524)

(declare-fun addApplyDifferent!130 (ListLongMap!2261 (_ BitVec 64) V!5329 (_ BitVec 64)) Unit!5524)

(assert (=> b!182127 (= lt!90107 (addApplyDifferent!130 lt!90109 lt!90118 (minValue!3566 thiss!1248) lt!90111))))

(declare-fun apply!154 (ListLongMap!2261 (_ BitVec 64)) V!5329)

(assert (=> b!182127 (= (apply!154 (+!274 lt!90109 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248))) lt!90111) (apply!154 lt!90109 lt!90111))))

(declare-fun lt!90116 () Unit!5524)

(assert (=> b!182127 (= lt!90116 lt!90107)))

(declare-fun lt!90122 () ListLongMap!2261)

(assert (=> b!182127 (= lt!90122 (getCurrentListMapNoExtraKeys!185 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))

(declare-fun lt!90120 () (_ BitVec 64))

(assert (=> b!182127 (= lt!90120 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90108 () (_ BitVec 64))

(assert (=> b!182127 (= lt!90108 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90110 () Unit!5524)

(assert (=> b!182127 (= lt!90110 (addApplyDifferent!130 lt!90122 lt!90120 (zeroValue!3566 thiss!1248) lt!90108))))

(assert (=> b!182127 (= (apply!154 (+!274 lt!90122 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248))) lt!90108) (apply!154 lt!90122 lt!90108))))

(declare-fun lt!90106 () Unit!5524)

(assert (=> b!182127 (= lt!90106 lt!90110)))

(declare-fun lt!90119 () ListLongMap!2261)

(assert (=> b!182127 (= lt!90119 (getCurrentListMapNoExtraKeys!185 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))

(declare-fun lt!90113 () (_ BitVec 64))

(assert (=> b!182127 (= lt!90113 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90114 () (_ BitVec 64))

(assert (=> b!182127 (= lt!90114 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182127 (= lt!90112 (addApplyDifferent!130 lt!90119 lt!90113 (minValue!3566 thiss!1248) lt!90114))))

(assert (=> b!182127 (= (apply!154 (+!274 lt!90119 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248))) lt!90114) (apply!154 lt!90119 lt!90114))))

(declare-fun bm!18376 () Bool)

(declare-fun call!18380 () ListLongMap!2261)

(assert (=> bm!18376 (= call!18380 (getCurrentListMapNoExtraKeys!185 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))

(declare-fun bm!18377 () Bool)

(declare-fun call!18381 () ListLongMap!2261)

(assert (=> bm!18377 (= call!18381 call!18380)))

(declare-fun b!182128 () Bool)

(declare-fun e!119944 () Bool)

(assert (=> b!182128 (= e!119944 e!119935)))

(declare-fun c!32661 () Bool)

(assert (=> b!182128 (= c!32661 (not (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18378 () Bool)

(declare-fun lt!90115 () ListLongMap!2261)

(assert (=> bm!18378 (= call!18383 (contains!1240 lt!90115 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182129 () Bool)

(declare-fun e!119936 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!182129 (= e!119936 (validKeyInArray!0 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18379 () Bool)

(declare-fun c!32660 () Bool)

(declare-fun call!18384 () ListLongMap!2261)

(declare-fun c!32658 () Bool)

(assert (=> bm!18379 (= call!18384 (+!274 (ite c!32660 call!18380 (ite c!32658 call!18381 call!18379)) (ite (or c!32660 c!32658) (tuple2!3341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))

(declare-fun b!182130 () Bool)

(declare-fun e!119946 () ListLongMap!2261)

(assert (=> b!182130 (= e!119946 e!119941)))

(assert (=> b!182130 (= c!32658 (and (not (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!182131 () Bool)

(assert (=> b!182131 (= e!119945 (= (apply!154 lt!90115 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3566 thiss!1248)))))

(declare-fun b!182132 () Bool)

(declare-fun Unit!5527 () Unit!5524)

(assert (=> b!182132 (= e!119939 Unit!5527)))

(declare-fun b!182134 () Bool)

(declare-fun e!119943 () Bool)

(declare-fun e!119940 () Bool)

(assert (=> b!182134 (= e!119943 e!119940)))

(declare-fun res!86207 () Bool)

(assert (=> b!182134 (=> (not res!86207) (not e!119940))))

(assert (=> b!182134 (= res!86207 (contains!1240 lt!90115 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))))))

(declare-fun b!182135 () Bool)

(assert (=> b!182135 (= e!119946 (+!274 call!18384 (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))

(declare-fun b!182136 () Bool)

(assert (=> b!182136 (= e!119935 (not call!18383))))

(declare-fun b!182137 () Bool)

(declare-fun e!119937 () Bool)

(assert (=> b!182137 (= e!119937 (= (apply!154 lt!90115 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3566 thiss!1248)))))

(declare-fun b!182138 () Bool)

(declare-fun res!86215 () Bool)

(assert (=> b!182138 (=> (not res!86215) (not e!119944))))

(assert (=> b!182138 (= res!86215 e!119943)))

(declare-fun res!86208 () Bool)

(assert (=> b!182138 (=> res!86208 e!119943)))

(assert (=> b!182138 (= res!86208 (not e!119936))))

(declare-fun res!86210 () Bool)

(assert (=> b!182138 (=> (not res!86210) (not e!119936))))

(assert (=> b!182138 (= res!86210 (bvslt #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))))))

(declare-fun b!182139 () Bool)

(declare-fun call!18385 () ListLongMap!2261)

(assert (=> b!182139 (= e!119934 call!18385)))

(declare-fun b!182140 () Bool)

(declare-fun e!119938 () Bool)

(declare-fun call!18382 () Bool)

(assert (=> b!182140 (= e!119938 (not call!18382))))

(declare-fun bm!18380 () Bool)

(assert (=> bm!18380 (= call!18382 (contains!1240 lt!90115 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182141 () Bool)

(declare-fun e!119942 () Bool)

(assert (=> b!182141 (= e!119942 (validKeyInArray!0 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18381 () Bool)

(assert (=> bm!18381 (= call!18379 call!18381)))

(declare-fun bm!18382 () Bool)

(assert (=> bm!18382 (= call!18385 call!18384)))

(declare-fun b!182142 () Bool)

(declare-fun get!2094 (ValueCell!1787 V!5329) V!5329)

(declare-fun dynLambda!497 (Int (_ BitVec 64)) V!5329)

(assert (=> b!182142 (= e!119940 (= (apply!154 lt!90115 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)) (get!2094 (select (arr!3639 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3950 (_values!3708 thiss!1248))))))

(assert (=> b!182142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))))))

(declare-fun d!54617 () Bool)

(assert (=> d!54617 e!119944))

(declare-fun res!86211 () Bool)

(assert (=> d!54617 (=> (not res!86211) (not e!119944))))

(assert (=> d!54617 (= res!86211 (or (bvsge #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))))))))

(declare-fun lt!90126 () ListLongMap!2261)

(assert (=> d!54617 (= lt!90115 lt!90126)))

(declare-fun lt!90124 () Unit!5524)

(assert (=> d!54617 (= lt!90124 e!119939)))

(declare-fun c!32659 () Bool)

(assert (=> d!54617 (= c!32659 e!119942)))

(declare-fun res!86209 () Bool)

(assert (=> d!54617 (=> (not res!86209) (not e!119942))))

(assert (=> d!54617 (= res!86209 (bvslt #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))))))

(assert (=> d!54617 (= lt!90126 e!119946)))

(assert (=> d!54617 (= c!32660 (and (not (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54617 (validMask!0 (mask!8758 thiss!1248))))

(assert (=> d!54617 (= (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)) lt!90115)))

(declare-fun b!182133 () Bool)

(declare-fun res!86212 () Bool)

(assert (=> b!182133 (=> (not res!86212) (not e!119944))))

(assert (=> b!182133 (= res!86212 e!119938)))

(declare-fun c!32657 () Bool)

(assert (=> b!182133 (= c!32657 (not (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!182143 () Bool)

(assert (=> b!182143 (= e!119941 call!18385)))

(declare-fun b!182144 () Bool)

(assert (=> b!182144 (= e!119938 e!119937)))

(declare-fun res!86214 () Bool)

(assert (=> b!182144 (= res!86214 call!18382)))

(assert (=> b!182144 (=> (not res!86214) (not e!119937))))

(assert (= (and d!54617 c!32660) b!182135))

(assert (= (and d!54617 (not c!32660)) b!182130))

(assert (= (and b!182130 c!32658) b!182143))

(assert (= (and b!182130 (not c!32658)) b!182124))

(assert (= (and b!182124 c!32656) b!182139))

(assert (= (and b!182124 (not c!32656)) b!182125))

(assert (= (or b!182139 b!182125) bm!18381))

(assert (= (or b!182143 bm!18381) bm!18377))

(assert (= (or b!182143 b!182139) bm!18382))

(assert (= (or b!182135 bm!18377) bm!18376))

(assert (= (or b!182135 bm!18382) bm!18379))

(assert (= (and d!54617 res!86209) b!182141))

(assert (= (and d!54617 c!32659) b!182127))

(assert (= (and d!54617 (not c!32659)) b!182132))

(assert (= (and d!54617 res!86211) b!182138))

(assert (= (and b!182138 res!86210) b!182129))

(assert (= (and b!182138 (not res!86208)) b!182134))

(assert (= (and b!182134 res!86207) b!182142))

(assert (= (and b!182138 res!86215) b!182133))

(assert (= (and b!182133 c!32657) b!182144))

(assert (= (and b!182133 (not c!32657)) b!182140))

(assert (= (and b!182144 res!86214) b!182137))

(assert (= (or b!182144 b!182140) bm!18380))

(assert (= (and b!182133 res!86212) b!182128))

(assert (= (and b!182128 c!32661) b!182126))

(assert (= (and b!182128 (not c!32661)) b!182136))

(assert (= (and b!182126 res!86213) b!182131))

(assert (= (or b!182126 b!182136) bm!18378))

(declare-fun b_lambda!7185 () Bool)

(assert (=> (not b_lambda!7185) (not b!182142)))

(declare-fun t!7133 () Bool)

(declare-fun tb!2811 () Bool)

(assert (=> (and b!182003 (= (defaultEntry!3725 thiss!1248) (defaultEntry!3725 thiss!1248)) t!7133) tb!2811))

(declare-fun result!4727 () Bool)

(assert (=> tb!2811 (= result!4727 tp_is_empty!4261)))

(assert (=> b!182142 t!7133))

(declare-fun b_and!11065 () Bool)

(assert (= b_and!11059 (and (=> t!7133 result!4727) b_and!11065)))

(declare-fun m!210051 () Bool)

(assert (=> b!182131 m!210051))

(declare-fun m!210053 () Bool)

(assert (=> bm!18379 m!210053))

(declare-fun m!210055 () Bool)

(assert (=> b!182137 m!210055))

(declare-fun m!210057 () Bool)

(assert (=> bm!18378 m!210057))

(declare-fun m!210059 () Bool)

(assert (=> bm!18380 m!210059))

(declare-fun m!210061 () Bool)

(assert (=> b!182134 m!210061))

(assert (=> b!182134 m!210061))

(declare-fun m!210063 () Bool)

(assert (=> b!182134 m!210063))

(assert (=> b!182142 m!210061))

(declare-fun m!210065 () Bool)

(assert (=> b!182142 m!210065))

(declare-fun m!210067 () Bool)

(assert (=> b!182142 m!210067))

(declare-fun m!210069 () Bool)

(assert (=> b!182142 m!210069))

(assert (=> b!182142 m!210067))

(declare-fun m!210071 () Bool)

(assert (=> b!182142 m!210071))

(assert (=> b!182142 m!210061))

(assert (=> b!182142 m!210069))

(assert (=> d!54617 m!209993))

(declare-fun m!210073 () Bool)

(assert (=> b!182135 m!210073))

(declare-fun m!210075 () Bool)

(assert (=> b!182127 m!210075))

(declare-fun m!210077 () Bool)

(assert (=> b!182127 m!210077))

(declare-fun m!210079 () Bool)

(assert (=> b!182127 m!210079))

(declare-fun m!210081 () Bool)

(assert (=> b!182127 m!210081))

(declare-fun m!210083 () Bool)

(assert (=> b!182127 m!210083))

(declare-fun m!210085 () Bool)

(assert (=> b!182127 m!210085))

(declare-fun m!210087 () Bool)

(assert (=> b!182127 m!210087))

(declare-fun m!210089 () Bool)

(assert (=> b!182127 m!210089))

(declare-fun m!210091 () Bool)

(assert (=> b!182127 m!210091))

(declare-fun m!210093 () Bool)

(assert (=> b!182127 m!210093))

(declare-fun m!210095 () Bool)

(assert (=> b!182127 m!210095))

(assert (=> b!182127 m!210061))

(declare-fun m!210097 () Bool)

(assert (=> b!182127 m!210097))

(assert (=> b!182127 m!210085))

(declare-fun m!210099 () Bool)

(assert (=> b!182127 m!210099))

(assert (=> b!182127 m!210087))

(declare-fun m!210101 () Bool)

(assert (=> b!182127 m!210101))

(assert (=> b!182127 m!210079))

(declare-fun m!210103 () Bool)

(assert (=> b!182127 m!210103))

(assert (=> b!182127 m!210075))

(declare-fun m!210105 () Bool)

(assert (=> b!182127 m!210105))

(assert (=> b!182129 m!210061))

(assert (=> b!182129 m!210061))

(declare-fun m!210107 () Bool)

(assert (=> b!182129 m!210107))

(assert (=> b!182141 m!210061))

(assert (=> b!182141 m!210061))

(assert (=> b!182141 m!210107))

(assert (=> bm!18376 m!210091))

(assert (=> b!182009 d!54617))

(declare-fun b!182159 () Bool)

(declare-fun e!119954 () SeekEntryResult!595)

(declare-fun e!119953 () SeekEntryResult!595)

(assert (=> b!182159 (= e!119954 e!119953)))

(declare-fun lt!90134 () (_ BitVec 64))

(declare-fun lt!90135 () SeekEntryResult!595)

(assert (=> b!182159 (= lt!90134 (select (arr!3638 (_keys!5632 thiss!1248)) (index!4552 lt!90135)))))

(declare-fun c!32668 () Bool)

(assert (=> b!182159 (= c!32668 (= lt!90134 key!828))))

(declare-fun e!119955 () SeekEntryResult!595)

(declare-fun b!182160 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7691 (_ BitVec 32)) SeekEntryResult!595)

(assert (=> b!182160 (= e!119955 (seekKeyOrZeroReturnVacant!0 (x!19843 lt!90135) (index!4552 lt!90135) (index!4552 lt!90135) key!828 (_keys!5632 thiss!1248) (mask!8758 thiss!1248)))))

(declare-fun d!54619 () Bool)

(declare-fun lt!90136 () SeekEntryResult!595)

(assert (=> d!54619 (and (or ((_ is Undefined!595) lt!90136) (not ((_ is Found!595) lt!90136)) (and (bvsge (index!4551 lt!90136) #b00000000000000000000000000000000) (bvslt (index!4551 lt!90136) (size!3949 (_keys!5632 thiss!1248))))) (or ((_ is Undefined!595) lt!90136) ((_ is Found!595) lt!90136) (not ((_ is MissingZero!595) lt!90136)) (and (bvsge (index!4550 lt!90136) #b00000000000000000000000000000000) (bvslt (index!4550 lt!90136) (size!3949 (_keys!5632 thiss!1248))))) (or ((_ is Undefined!595) lt!90136) ((_ is Found!595) lt!90136) ((_ is MissingZero!595) lt!90136) (not ((_ is MissingVacant!595) lt!90136)) (and (bvsge (index!4553 lt!90136) #b00000000000000000000000000000000) (bvslt (index!4553 lt!90136) (size!3949 (_keys!5632 thiss!1248))))) (or ((_ is Undefined!595) lt!90136) (ite ((_ is Found!595) lt!90136) (= (select (arr!3638 (_keys!5632 thiss!1248)) (index!4551 lt!90136)) key!828) (ite ((_ is MissingZero!595) lt!90136) (= (select (arr!3638 (_keys!5632 thiss!1248)) (index!4550 lt!90136)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!595) lt!90136) (= (select (arr!3638 (_keys!5632 thiss!1248)) (index!4553 lt!90136)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54619 (= lt!90136 e!119954)))

(declare-fun c!32669 () Bool)

(assert (=> d!54619 (= c!32669 (and ((_ is Intermediate!595) lt!90135) (undefined!1407 lt!90135)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7691 (_ BitVec 32)) SeekEntryResult!595)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54619 (= lt!90135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8758 thiss!1248)) key!828 (_keys!5632 thiss!1248) (mask!8758 thiss!1248)))))

(assert (=> d!54619 (validMask!0 (mask!8758 thiss!1248))))

(assert (=> d!54619 (= (seekEntryOrOpen!0 key!828 (_keys!5632 thiss!1248) (mask!8758 thiss!1248)) lt!90136)))

(declare-fun b!182161 () Bool)

(assert (=> b!182161 (= e!119953 (Found!595 (index!4552 lt!90135)))))

(declare-fun b!182162 () Bool)

(assert (=> b!182162 (= e!119955 (MissingZero!595 (index!4552 lt!90135)))))

(declare-fun b!182163 () Bool)

(assert (=> b!182163 (= e!119954 Undefined!595)))

(declare-fun b!182164 () Bool)

(declare-fun c!32670 () Bool)

(assert (=> b!182164 (= c!32670 (= lt!90134 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182164 (= e!119953 e!119955)))

(assert (= (and d!54619 c!32669) b!182163))

(assert (= (and d!54619 (not c!32669)) b!182159))

(assert (= (and b!182159 c!32668) b!182161))

(assert (= (and b!182159 (not c!32668)) b!182164))

(assert (= (and b!182164 c!32670) b!182162))

(assert (= (and b!182164 (not c!32670)) b!182160))

(declare-fun m!210109 () Bool)

(assert (=> b!182159 m!210109))

(declare-fun m!210111 () Bool)

(assert (=> b!182160 m!210111))

(declare-fun m!210113 () Bool)

(assert (=> d!54619 m!210113))

(declare-fun m!210115 () Bool)

(assert (=> d!54619 m!210115))

(assert (=> d!54619 m!209993))

(assert (=> d!54619 m!210113))

(declare-fun m!210117 () Bool)

(assert (=> d!54619 m!210117))

(declare-fun m!210119 () Bool)

(assert (=> d!54619 m!210119))

(declare-fun m!210121 () Bool)

(assert (=> d!54619 m!210121))

(assert (=> b!182001 d!54619))

(declare-fun d!54621 () Bool)

(assert (=> d!54621 (= (validMask!0 (mask!8758 thiss!1248)) (and (or (= (mask!8758 thiss!1248) #b00000000000000000000000000000111) (= (mask!8758 thiss!1248) #b00000000000000000000000000001111) (= (mask!8758 thiss!1248) #b00000000000000000000000000011111) (= (mask!8758 thiss!1248) #b00000000000000000000000000111111) (= (mask!8758 thiss!1248) #b00000000000000000000000001111111) (= (mask!8758 thiss!1248) #b00000000000000000000000011111111) (= (mask!8758 thiss!1248) #b00000000000000000000000111111111) (= (mask!8758 thiss!1248) #b00000000000000000000001111111111) (= (mask!8758 thiss!1248) #b00000000000000000000011111111111) (= (mask!8758 thiss!1248) #b00000000000000000000111111111111) (= (mask!8758 thiss!1248) #b00000000000000000001111111111111) (= (mask!8758 thiss!1248) #b00000000000000000011111111111111) (= (mask!8758 thiss!1248) #b00000000000000000111111111111111) (= (mask!8758 thiss!1248) #b00000000000000001111111111111111) (= (mask!8758 thiss!1248) #b00000000000000011111111111111111) (= (mask!8758 thiss!1248) #b00000000000000111111111111111111) (= (mask!8758 thiss!1248) #b00000000000001111111111111111111) (= (mask!8758 thiss!1248) #b00000000000011111111111111111111) (= (mask!8758 thiss!1248) #b00000000000111111111111111111111) (= (mask!8758 thiss!1248) #b00000000001111111111111111111111) (= (mask!8758 thiss!1248) #b00000000011111111111111111111111) (= (mask!8758 thiss!1248) #b00000000111111111111111111111111) (= (mask!8758 thiss!1248) #b00000001111111111111111111111111) (= (mask!8758 thiss!1248) #b00000011111111111111111111111111) (= (mask!8758 thiss!1248) #b00000111111111111111111111111111) (= (mask!8758 thiss!1248) #b00001111111111111111111111111111) (= (mask!8758 thiss!1248) #b00011111111111111111111111111111) (= (mask!8758 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8758 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!182006 d!54621))

(declare-fun mapNonEmpty!7318 () Bool)

(declare-fun mapRes!7318 () Bool)

(declare-fun tp!16237 () Bool)

(declare-fun e!119960 () Bool)

(assert (=> mapNonEmpty!7318 (= mapRes!7318 (and tp!16237 e!119960))))

(declare-fun mapKey!7318 () (_ BitVec 32))

(declare-fun mapValue!7318 () ValueCell!1787)

(declare-fun mapRest!7318 () (Array (_ BitVec 32) ValueCell!1787))

(assert (=> mapNonEmpty!7318 (= mapRest!7309 (store mapRest!7318 mapKey!7318 mapValue!7318))))

(declare-fun condMapEmpty!7318 () Bool)

(declare-fun mapDefault!7318 () ValueCell!1787)

(assert (=> mapNonEmpty!7309 (= condMapEmpty!7318 (= mapRest!7309 ((as const (Array (_ BitVec 32) ValueCell!1787)) mapDefault!7318)))))

(declare-fun e!119961 () Bool)

(assert (=> mapNonEmpty!7309 (= tp!16222 (and e!119961 mapRes!7318))))

(declare-fun mapIsEmpty!7318 () Bool)

(assert (=> mapIsEmpty!7318 mapRes!7318))

(declare-fun b!182171 () Bool)

(assert (=> b!182171 (= e!119960 tp_is_empty!4261)))

(declare-fun b!182172 () Bool)

(assert (=> b!182172 (= e!119961 tp_is_empty!4261)))

(assert (= (and mapNonEmpty!7309 condMapEmpty!7318) mapIsEmpty!7318))

(assert (= (and mapNonEmpty!7309 (not condMapEmpty!7318)) mapNonEmpty!7318))

(assert (= (and mapNonEmpty!7318 ((_ is ValueCellFull!1787) mapValue!7318)) b!182171))

(assert (= (and mapNonEmpty!7309 ((_ is ValueCellFull!1787) mapDefault!7318)) b!182172))

(declare-fun m!210123 () Bool)

(assert (=> mapNonEmpty!7318 m!210123))

(declare-fun b_lambda!7187 () Bool)

(assert (= b_lambda!7185 (or (and b!182003 b_free!4489) b_lambda!7187)))

(check-sat (not bm!18380) (not d!54609) (not mapNonEmpty!7318) (not b!182137) (not b!182131) (not b!182135) (not bm!18378) (not b!182160) (not b_lambda!7187) (not b!182129) (not b!182127) (not b!182081) b_and!11065 (not b!182070) (not bm!18379) (not d!54617) (not b!182072) (not d!54615) (not d!54619) (not b!182079) tp_is_empty!4261 (not b!182071) (not b!182141) (not b!182142) (not bm!18376) (not b!182134) (not b_next!4489))
(check-sat b_and!11065 (not b_next!4489))
(get-model)

(declare-fun d!54623 () Bool)

(assert (=> d!54623 (= (validKeyInArray!0 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182141 d!54623))

(declare-fun d!54625 () Bool)

(declare-fun get!2095 (Option!218) V!5329)

(assert (=> d!54625 (= (apply!154 lt!90115 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2095 (getValueByKey!212 (toList!1146 lt!90115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7444 () Bool)

(assert (= bs!7444 d!54625))

(declare-fun m!210125 () Bool)

(assert (=> bs!7444 m!210125))

(assert (=> bs!7444 m!210125))

(declare-fun m!210127 () Bool)

(assert (=> bs!7444 m!210127))

(assert (=> b!182131 d!54625))

(declare-fun d!54627 () Bool)

(declare-fun e!119963 () Bool)

(assert (=> d!54627 e!119963))

(declare-fun res!86216 () Bool)

(assert (=> d!54627 (=> res!86216 e!119963)))

(declare-fun lt!90138 () Bool)

(assert (=> d!54627 (= res!86216 (not lt!90138))))

(declare-fun lt!90137 () Bool)

(assert (=> d!54627 (= lt!90138 lt!90137)))

(declare-fun lt!90140 () Unit!5524)

(declare-fun e!119962 () Unit!5524)

(assert (=> d!54627 (= lt!90140 e!119962)))

(declare-fun c!32671 () Bool)

(assert (=> d!54627 (= c!32671 lt!90137)))

(assert (=> d!54627 (= lt!90137 (containsKey!215 (toList!1146 lt!90115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54627 (= (contains!1240 lt!90115 #b0000000000000000000000000000000000000000000000000000000000000000) lt!90138)))

(declare-fun b!182173 () Bool)

(declare-fun lt!90139 () Unit!5524)

(assert (=> b!182173 (= e!119962 lt!90139)))

(assert (=> b!182173 (= lt!90139 (lemmaContainsKeyImpliesGetValueByKeyDefined!163 (toList!1146 lt!90115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182173 (isDefined!164 (getValueByKey!212 (toList!1146 lt!90115) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182174 () Bool)

(declare-fun Unit!5528 () Unit!5524)

(assert (=> b!182174 (= e!119962 Unit!5528)))

(declare-fun b!182175 () Bool)

(assert (=> b!182175 (= e!119963 (isDefined!164 (getValueByKey!212 (toList!1146 lt!90115) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54627 c!32671) b!182173))

(assert (= (and d!54627 (not c!32671)) b!182174))

(assert (= (and d!54627 (not res!86216)) b!182175))

(declare-fun m!210129 () Bool)

(assert (=> d!54627 m!210129))

(declare-fun m!210131 () Bool)

(assert (=> b!182173 m!210131))

(declare-fun m!210133 () Bool)

(assert (=> b!182173 m!210133))

(assert (=> b!182173 m!210133))

(declare-fun m!210135 () Bool)

(assert (=> b!182173 m!210135))

(assert (=> b!182175 m!210133))

(assert (=> b!182175 m!210133))

(assert (=> b!182175 m!210135))

(assert (=> bm!18380 d!54627))

(declare-fun d!54629 () Bool)

(declare-fun e!119966 () Bool)

(assert (=> d!54629 e!119966))

(declare-fun res!86221 () Bool)

(assert (=> d!54629 (=> (not res!86221) (not e!119966))))

(declare-fun lt!90150 () ListLongMap!2261)

(assert (=> d!54629 (= res!86221 (contains!1240 lt!90150 (_1!1681 (ite (or c!32660 c!32658) (tuple2!3341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))))

(declare-fun lt!90151 () List!2281)

(assert (=> d!54629 (= lt!90150 (ListLongMap!2262 lt!90151))))

(declare-fun lt!90152 () Unit!5524)

(declare-fun lt!90149 () Unit!5524)

(assert (=> d!54629 (= lt!90152 lt!90149)))

(assert (=> d!54629 (= (getValueByKey!212 lt!90151 (_1!1681 (ite (or c!32660 c!32658) (tuple2!3341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))) (Some!217 (_2!1681 (ite (or c!32660 c!32658) (tuple2!3341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!113 (List!2281 (_ BitVec 64) V!5329) Unit!5524)

(assert (=> d!54629 (= lt!90149 (lemmaContainsTupThenGetReturnValue!113 lt!90151 (_1!1681 (ite (or c!32660 c!32658) (tuple2!3341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))) (_2!1681 (ite (or c!32660 c!32658) (tuple2!3341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))))

(declare-fun insertStrictlySorted!116 (List!2281 (_ BitVec 64) V!5329) List!2281)

(assert (=> d!54629 (= lt!90151 (insertStrictlySorted!116 (toList!1146 (ite c!32660 call!18380 (ite c!32658 call!18381 call!18379))) (_1!1681 (ite (or c!32660 c!32658) (tuple2!3341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))) (_2!1681 (ite (or c!32660 c!32658) (tuple2!3341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))))

(assert (=> d!54629 (= (+!274 (ite c!32660 call!18380 (ite c!32658 call!18381 call!18379)) (ite (or c!32660 c!32658) (tuple2!3341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))) lt!90150)))

(declare-fun b!182180 () Bool)

(declare-fun res!86222 () Bool)

(assert (=> b!182180 (=> (not res!86222) (not e!119966))))

(assert (=> b!182180 (= res!86222 (= (getValueByKey!212 (toList!1146 lt!90150) (_1!1681 (ite (or c!32660 c!32658) (tuple2!3341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))) (Some!217 (_2!1681 (ite (or c!32660 c!32658) (tuple2!3341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))))

(declare-fun b!182181 () Bool)

(declare-fun contains!1241 (List!2281 tuple2!3340) Bool)

(assert (=> b!182181 (= e!119966 (contains!1241 (toList!1146 lt!90150) (ite (or c!32660 c!32658) (tuple2!3341 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))

(assert (= (and d!54629 res!86221) b!182180))

(assert (= (and b!182180 res!86222) b!182181))

(declare-fun m!210137 () Bool)

(assert (=> d!54629 m!210137))

(declare-fun m!210139 () Bool)

(assert (=> d!54629 m!210139))

(declare-fun m!210141 () Bool)

(assert (=> d!54629 m!210141))

(declare-fun m!210143 () Bool)

(assert (=> d!54629 m!210143))

(declare-fun m!210145 () Bool)

(assert (=> b!182180 m!210145))

(declare-fun m!210147 () Bool)

(assert (=> b!182181 m!210147))

(assert (=> bm!18379 d!54629))

(declare-fun d!54631 () Bool)

(declare-fun e!119968 () Bool)

(assert (=> d!54631 e!119968))

(declare-fun res!86223 () Bool)

(assert (=> d!54631 (=> res!86223 e!119968)))

(declare-fun lt!90154 () Bool)

(assert (=> d!54631 (= res!86223 (not lt!90154))))

(declare-fun lt!90153 () Bool)

(assert (=> d!54631 (= lt!90154 lt!90153)))

(declare-fun lt!90156 () Unit!5524)

(declare-fun e!119967 () Unit!5524)

(assert (=> d!54631 (= lt!90156 e!119967)))

(declare-fun c!32672 () Bool)

(assert (=> d!54631 (= c!32672 lt!90153)))

(assert (=> d!54631 (= lt!90153 (containsKey!215 (toList!1146 lt!90115) (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54631 (= (contains!1240 lt!90115 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)) lt!90154)))

(declare-fun b!182182 () Bool)

(declare-fun lt!90155 () Unit!5524)

(assert (=> b!182182 (= e!119967 lt!90155)))

(assert (=> b!182182 (= lt!90155 (lemmaContainsKeyImpliesGetValueByKeyDefined!163 (toList!1146 lt!90115) (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182182 (isDefined!164 (getValueByKey!212 (toList!1146 lt!90115) (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182183 () Bool)

(declare-fun Unit!5529 () Unit!5524)

(assert (=> b!182183 (= e!119967 Unit!5529)))

(declare-fun b!182184 () Bool)

(assert (=> b!182184 (= e!119968 (isDefined!164 (getValueByKey!212 (toList!1146 lt!90115) (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54631 c!32672) b!182182))

(assert (= (and d!54631 (not c!32672)) b!182183))

(assert (= (and d!54631 (not res!86223)) b!182184))

(assert (=> d!54631 m!210061))

(declare-fun m!210149 () Bool)

(assert (=> d!54631 m!210149))

(assert (=> b!182182 m!210061))

(declare-fun m!210151 () Bool)

(assert (=> b!182182 m!210151))

(assert (=> b!182182 m!210061))

(declare-fun m!210153 () Bool)

(assert (=> b!182182 m!210153))

(assert (=> b!182182 m!210153))

(declare-fun m!210155 () Bool)

(assert (=> b!182182 m!210155))

(assert (=> b!182184 m!210061))

(assert (=> b!182184 m!210153))

(assert (=> b!182184 m!210153))

(assert (=> b!182184 m!210155))

(assert (=> b!182134 d!54631))

(declare-fun b!182193 () Bool)

(declare-fun e!119976 () Bool)

(declare-fun call!18388 () Bool)

(assert (=> b!182193 (= e!119976 call!18388)))

(declare-fun d!54633 () Bool)

(declare-fun res!86229 () Bool)

(declare-fun e!119975 () Bool)

(assert (=> d!54633 (=> res!86229 e!119975)))

(assert (=> d!54633 (= res!86229 (bvsge #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))))))

(assert (=> d!54633 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5632 thiss!1248) (mask!8758 thiss!1248)) e!119975)))

(declare-fun b!182194 () Bool)

(declare-fun e!119977 () Bool)

(assert (=> b!182194 (= e!119976 e!119977)))

(declare-fun lt!90163 () (_ BitVec 64))

(assert (=> b!182194 (= lt!90163 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90164 () Unit!5524)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7691 (_ BitVec 64) (_ BitVec 32)) Unit!5524)

(assert (=> b!182194 (= lt!90164 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5632 thiss!1248) lt!90163 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!182194 (arrayContainsKey!0 (_keys!5632 thiss!1248) lt!90163 #b00000000000000000000000000000000)))

(declare-fun lt!90165 () Unit!5524)

(assert (=> b!182194 (= lt!90165 lt!90164)))

(declare-fun res!86228 () Bool)

(assert (=> b!182194 (= res!86228 (= (seekEntryOrOpen!0 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000) (_keys!5632 thiss!1248) (mask!8758 thiss!1248)) (Found!595 #b00000000000000000000000000000000)))))

(assert (=> b!182194 (=> (not res!86228) (not e!119977))))

(declare-fun b!182195 () Bool)

(assert (=> b!182195 (= e!119977 call!18388)))

(declare-fun bm!18385 () Bool)

(assert (=> bm!18385 (= call!18388 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5632 thiss!1248) (mask!8758 thiss!1248)))))

(declare-fun b!182196 () Bool)

(assert (=> b!182196 (= e!119975 e!119976)))

(declare-fun c!32675 () Bool)

(assert (=> b!182196 (= c!32675 (validKeyInArray!0 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54633 (not res!86229)) b!182196))

(assert (= (and b!182196 c!32675) b!182194))

(assert (= (and b!182196 (not c!32675)) b!182193))

(assert (= (and b!182194 res!86228) b!182195))

(assert (= (or b!182195 b!182193) bm!18385))

(assert (=> b!182194 m!210061))

(declare-fun m!210157 () Bool)

(assert (=> b!182194 m!210157))

(declare-fun m!210159 () Bool)

(assert (=> b!182194 m!210159))

(assert (=> b!182194 m!210061))

(declare-fun m!210161 () Bool)

(assert (=> b!182194 m!210161))

(declare-fun m!210163 () Bool)

(assert (=> bm!18385 m!210163))

(assert (=> b!182196 m!210061))

(assert (=> b!182196 m!210061))

(assert (=> b!182196 m!210107))

(assert (=> b!182071 d!54633))

(declare-fun bm!18388 () Bool)

(declare-fun call!18391 () ListLongMap!2261)

(assert (=> bm!18388 (= call!18391 (getCurrentListMapNoExtraKeys!185 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3725 thiss!1248)))))

(declare-fun b!182221 () Bool)

(declare-fun e!119994 () Bool)

(declare-fun e!119997 () Bool)

(assert (=> b!182221 (= e!119994 e!119997)))

(declare-fun c!32685 () Bool)

(assert (=> b!182221 (= c!32685 (bvslt #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))))))

(declare-fun b!182222 () Bool)

(declare-fun lt!90182 () ListLongMap!2261)

(assert (=> b!182222 (= e!119997 (= lt!90182 (getCurrentListMapNoExtraKeys!185 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3725 thiss!1248))))))

(declare-fun b!182223 () Bool)

(declare-fun isEmpty!467 (ListLongMap!2261) Bool)

(assert (=> b!182223 (= e!119997 (isEmpty!467 lt!90182))))

(declare-fun b!182224 () Bool)

(declare-fun e!119993 () Bool)

(assert (=> b!182224 (= e!119993 (validKeyInArray!0 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182224 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!182225 () Bool)

(declare-fun e!119992 () ListLongMap!2261)

(assert (=> b!182225 (= e!119992 call!18391)))

(declare-fun b!182226 () Bool)

(assert (=> b!182226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))))))

(assert (=> b!182226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3950 (_values!3708 thiss!1248))))))

(declare-fun e!119998 () Bool)

(assert (=> b!182226 (= e!119998 (= (apply!154 lt!90182 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)) (get!2094 (select (arr!3639 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!54635 () Bool)

(declare-fun e!119995 () Bool)

(assert (=> d!54635 e!119995))

(declare-fun res!86240 () Bool)

(assert (=> d!54635 (=> (not res!86240) (not e!119995))))

(assert (=> d!54635 (= res!86240 (not (contains!1240 lt!90182 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!119996 () ListLongMap!2261)

(assert (=> d!54635 (= lt!90182 e!119996)))

(declare-fun c!32684 () Bool)

(assert (=> d!54635 (= c!32684 (bvsge #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))))))

(assert (=> d!54635 (validMask!0 (mask!8758 thiss!1248))))

(assert (=> d!54635 (= (getCurrentListMapNoExtraKeys!185 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)) lt!90182)))

(declare-fun b!182227 () Bool)

(assert (=> b!182227 (= e!119994 e!119998)))

(assert (=> b!182227 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))))))

(declare-fun res!86239 () Bool)

(assert (=> b!182227 (= res!86239 (contains!1240 lt!90182 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182227 (=> (not res!86239) (not e!119998))))

(declare-fun b!182228 () Bool)

(declare-fun res!86241 () Bool)

(assert (=> b!182228 (=> (not res!86241) (not e!119995))))

(assert (=> b!182228 (= res!86241 (not (contains!1240 lt!90182 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182229 () Bool)

(declare-fun lt!90186 () Unit!5524)

(declare-fun lt!90185 () Unit!5524)

(assert (=> b!182229 (= lt!90186 lt!90185)))

(declare-fun lt!90184 () (_ BitVec 64))

(declare-fun lt!90181 () (_ BitVec 64))

(declare-fun lt!90180 () V!5329)

(declare-fun lt!90183 () ListLongMap!2261)

(assert (=> b!182229 (not (contains!1240 (+!274 lt!90183 (tuple2!3341 lt!90181 lt!90180)) lt!90184))))

(declare-fun addStillNotContains!86 (ListLongMap!2261 (_ BitVec 64) V!5329 (_ BitVec 64)) Unit!5524)

(assert (=> b!182229 (= lt!90185 (addStillNotContains!86 lt!90183 lt!90181 lt!90180 lt!90184))))

(assert (=> b!182229 (= lt!90184 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!182229 (= lt!90180 (get!2094 (select (arr!3639 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182229 (= lt!90181 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182229 (= lt!90183 call!18391)))

(assert (=> b!182229 (= e!119992 (+!274 call!18391 (tuple2!3341 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000) (get!2094 (select (arr!3639 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!182230 () Bool)

(assert (=> b!182230 (= e!119996 e!119992)))

(declare-fun c!32686 () Bool)

(assert (=> b!182230 (= c!32686 (validKeyInArray!0 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182231 () Bool)

(assert (=> b!182231 (= e!119995 e!119994)))

(declare-fun c!32687 () Bool)

(assert (=> b!182231 (= c!32687 e!119993)))

(declare-fun res!86238 () Bool)

(assert (=> b!182231 (=> (not res!86238) (not e!119993))))

(assert (=> b!182231 (= res!86238 (bvslt #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))))))

(declare-fun b!182232 () Bool)

(assert (=> b!182232 (= e!119996 (ListLongMap!2262 Nil!2278))))

(assert (= (and d!54635 c!32684) b!182232))

(assert (= (and d!54635 (not c!32684)) b!182230))

(assert (= (and b!182230 c!32686) b!182229))

(assert (= (and b!182230 (not c!32686)) b!182225))

(assert (= (or b!182229 b!182225) bm!18388))

(assert (= (and d!54635 res!86240) b!182228))

(assert (= (and b!182228 res!86241) b!182231))

(assert (= (and b!182231 res!86238) b!182224))

(assert (= (and b!182231 c!32687) b!182227))

(assert (= (and b!182231 (not c!32687)) b!182221))

(assert (= (and b!182227 res!86239) b!182226))

(assert (= (and b!182221 c!32685) b!182222))

(assert (= (and b!182221 (not c!32685)) b!182223))

(declare-fun b_lambda!7189 () Bool)

(assert (=> (not b_lambda!7189) (not b!182226)))

(assert (=> b!182226 t!7133))

(declare-fun b_and!11067 () Bool)

(assert (= b_and!11065 (and (=> t!7133 result!4727) b_and!11067)))

(declare-fun b_lambda!7191 () Bool)

(assert (=> (not b_lambda!7191) (not b!182229)))

(assert (=> b!182229 t!7133))

(declare-fun b_and!11069 () Bool)

(assert (= b_and!11067 (and (=> t!7133 result!4727) b_and!11069)))

(assert (=> b!182229 m!210061))

(declare-fun m!210165 () Bool)

(assert (=> b!182229 m!210165))

(declare-fun m!210167 () Bool)

(assert (=> b!182229 m!210167))

(declare-fun m!210169 () Bool)

(assert (=> b!182229 m!210169))

(declare-fun m!210171 () Bool)

(assert (=> b!182229 m!210171))

(assert (=> b!182229 m!210165))

(assert (=> b!182229 m!210069))

(assert (=> b!182229 m!210067))

(assert (=> b!182229 m!210071))

(assert (=> b!182229 m!210069))

(assert (=> b!182229 m!210067))

(declare-fun m!210173 () Bool)

(assert (=> d!54635 m!210173))

(assert (=> d!54635 m!209993))

(declare-fun m!210175 () Bool)

(assert (=> bm!18388 m!210175))

(assert (=> b!182227 m!210061))

(assert (=> b!182227 m!210061))

(declare-fun m!210177 () Bool)

(assert (=> b!182227 m!210177))

(declare-fun m!210179 () Bool)

(assert (=> b!182223 m!210179))

(assert (=> b!182230 m!210061))

(assert (=> b!182230 m!210061))

(assert (=> b!182230 m!210107))

(assert (=> b!182222 m!210175))

(assert (=> b!182224 m!210061))

(assert (=> b!182224 m!210061))

(assert (=> b!182224 m!210107))

(assert (=> b!182226 m!210061))

(assert (=> b!182226 m!210061))

(declare-fun m!210181 () Bool)

(assert (=> b!182226 m!210181))

(assert (=> b!182226 m!210069))

(assert (=> b!182226 m!210067))

(assert (=> b!182226 m!210071))

(assert (=> b!182226 m!210069))

(assert (=> b!182226 m!210067))

(declare-fun m!210183 () Bool)

(assert (=> b!182228 m!210183))

(assert (=> b!182127 d!54635))

(declare-fun d!54637 () Bool)

(assert (=> d!54637 (= (apply!154 (+!274 lt!90119 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248))) lt!90114) (apply!154 lt!90119 lt!90114))))

(declare-fun lt!90189 () Unit!5524)

(declare-fun choose!974 (ListLongMap!2261 (_ BitVec 64) V!5329 (_ BitVec 64)) Unit!5524)

(assert (=> d!54637 (= lt!90189 (choose!974 lt!90119 lt!90113 (minValue!3566 thiss!1248) lt!90114))))

(declare-fun e!120001 () Bool)

(assert (=> d!54637 e!120001))

(declare-fun res!86244 () Bool)

(assert (=> d!54637 (=> (not res!86244) (not e!120001))))

(assert (=> d!54637 (= res!86244 (contains!1240 lt!90119 lt!90114))))

(assert (=> d!54637 (= (addApplyDifferent!130 lt!90119 lt!90113 (minValue!3566 thiss!1248) lt!90114) lt!90189)))

(declare-fun b!182236 () Bool)

(assert (=> b!182236 (= e!120001 (not (= lt!90114 lt!90113)))))

(assert (= (and d!54637 res!86244) b!182236))

(assert (=> d!54637 m!210087))

(assert (=> d!54637 m!210087))

(assert (=> d!54637 m!210089))

(assert (=> d!54637 m!210093))

(declare-fun m!210185 () Bool)

(assert (=> d!54637 m!210185))

(declare-fun m!210187 () Bool)

(assert (=> d!54637 m!210187))

(assert (=> b!182127 d!54637))

(declare-fun d!54639 () Bool)

(declare-fun e!120002 () Bool)

(assert (=> d!54639 e!120002))

(declare-fun res!86245 () Bool)

(assert (=> d!54639 (=> (not res!86245) (not e!120002))))

(declare-fun lt!90191 () ListLongMap!2261)

(assert (=> d!54639 (= res!86245 (contains!1240 lt!90191 (_1!1681 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248)))))))

(declare-fun lt!90192 () List!2281)

(assert (=> d!54639 (= lt!90191 (ListLongMap!2262 lt!90192))))

(declare-fun lt!90193 () Unit!5524)

(declare-fun lt!90190 () Unit!5524)

(assert (=> d!54639 (= lt!90193 lt!90190)))

(assert (=> d!54639 (= (getValueByKey!212 lt!90192 (_1!1681 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248)))) (Some!217 (_2!1681 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248)))))))

(assert (=> d!54639 (= lt!90190 (lemmaContainsTupThenGetReturnValue!113 lt!90192 (_1!1681 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248))) (_2!1681 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248)))))))

(assert (=> d!54639 (= lt!90192 (insertStrictlySorted!116 (toList!1146 lt!90119) (_1!1681 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248))) (_2!1681 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248)))))))

(assert (=> d!54639 (= (+!274 lt!90119 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248))) lt!90191)))

(declare-fun b!182237 () Bool)

(declare-fun res!86246 () Bool)

(assert (=> b!182237 (=> (not res!86246) (not e!120002))))

(assert (=> b!182237 (= res!86246 (= (getValueByKey!212 (toList!1146 lt!90191) (_1!1681 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248)))) (Some!217 (_2!1681 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248))))))))

(declare-fun b!182238 () Bool)

(assert (=> b!182238 (= e!120002 (contains!1241 (toList!1146 lt!90191) (tuple2!3341 lt!90113 (minValue!3566 thiss!1248))))))

(assert (= (and d!54639 res!86245) b!182237))

(assert (= (and b!182237 res!86246) b!182238))

(declare-fun m!210189 () Bool)

(assert (=> d!54639 m!210189))

(declare-fun m!210191 () Bool)

(assert (=> d!54639 m!210191))

(declare-fun m!210193 () Bool)

(assert (=> d!54639 m!210193))

(declare-fun m!210195 () Bool)

(assert (=> d!54639 m!210195))

(declare-fun m!210197 () Bool)

(assert (=> b!182237 m!210197))

(declare-fun m!210199 () Bool)

(assert (=> b!182238 m!210199))

(assert (=> b!182127 d!54639))

(declare-fun d!54641 () Bool)

(declare-fun e!120004 () Bool)

(assert (=> d!54641 e!120004))

(declare-fun res!86247 () Bool)

(assert (=> d!54641 (=> res!86247 e!120004)))

(declare-fun lt!90195 () Bool)

(assert (=> d!54641 (= res!86247 (not lt!90195))))

(declare-fun lt!90194 () Bool)

(assert (=> d!54641 (= lt!90195 lt!90194)))

(declare-fun lt!90197 () Unit!5524)

(declare-fun e!120003 () Unit!5524)

(assert (=> d!54641 (= lt!90197 e!120003)))

(declare-fun c!32688 () Bool)

(assert (=> d!54641 (= c!32688 lt!90194)))

(assert (=> d!54641 (= lt!90194 (containsKey!215 (toList!1146 (+!274 lt!90123 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248)))) lt!90117))))

(assert (=> d!54641 (= (contains!1240 (+!274 lt!90123 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248))) lt!90117) lt!90195)))

(declare-fun b!182239 () Bool)

(declare-fun lt!90196 () Unit!5524)

(assert (=> b!182239 (= e!120003 lt!90196)))

(assert (=> b!182239 (= lt!90196 (lemmaContainsKeyImpliesGetValueByKeyDefined!163 (toList!1146 (+!274 lt!90123 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248)))) lt!90117))))

(assert (=> b!182239 (isDefined!164 (getValueByKey!212 (toList!1146 (+!274 lt!90123 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248)))) lt!90117))))

(declare-fun b!182240 () Bool)

(declare-fun Unit!5530 () Unit!5524)

(assert (=> b!182240 (= e!120003 Unit!5530)))

(declare-fun b!182241 () Bool)

(assert (=> b!182241 (= e!120004 (isDefined!164 (getValueByKey!212 (toList!1146 (+!274 lt!90123 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248)))) lt!90117)))))

(assert (= (and d!54641 c!32688) b!182239))

(assert (= (and d!54641 (not c!32688)) b!182240))

(assert (= (and d!54641 (not res!86247)) b!182241))

(declare-fun m!210201 () Bool)

(assert (=> d!54641 m!210201))

(declare-fun m!210203 () Bool)

(assert (=> b!182239 m!210203))

(declare-fun m!210205 () Bool)

(assert (=> b!182239 m!210205))

(assert (=> b!182239 m!210205))

(declare-fun m!210207 () Bool)

(assert (=> b!182239 m!210207))

(assert (=> b!182241 m!210205))

(assert (=> b!182241 m!210205))

(assert (=> b!182241 m!210207))

(assert (=> b!182127 d!54641))

(declare-fun d!54643 () Bool)

(assert (=> d!54643 (= (apply!154 lt!90119 lt!90114) (get!2095 (getValueByKey!212 (toList!1146 lt!90119) lt!90114)))))

(declare-fun bs!7445 () Bool)

(assert (= bs!7445 d!54643))

(declare-fun m!210209 () Bool)

(assert (=> bs!7445 m!210209))

(assert (=> bs!7445 m!210209))

(declare-fun m!210211 () Bool)

(assert (=> bs!7445 m!210211))

(assert (=> b!182127 d!54643))

(declare-fun d!54645 () Bool)

(assert (=> d!54645 (= (apply!154 lt!90122 lt!90108) (get!2095 (getValueByKey!212 (toList!1146 lt!90122) lt!90108)))))

(declare-fun bs!7446 () Bool)

(assert (= bs!7446 d!54645))

(declare-fun m!210213 () Bool)

(assert (=> bs!7446 m!210213))

(assert (=> bs!7446 m!210213))

(declare-fun m!210215 () Bool)

(assert (=> bs!7446 m!210215))

(assert (=> b!182127 d!54645))

(declare-fun d!54647 () Bool)

(assert (=> d!54647 (= (apply!154 (+!274 lt!90109 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248))) lt!90111) (get!2095 (getValueByKey!212 (toList!1146 (+!274 lt!90109 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248)))) lt!90111)))))

(declare-fun bs!7447 () Bool)

(assert (= bs!7447 d!54647))

(declare-fun m!210217 () Bool)

(assert (=> bs!7447 m!210217))

(assert (=> bs!7447 m!210217))

(declare-fun m!210219 () Bool)

(assert (=> bs!7447 m!210219))

(assert (=> b!182127 d!54647))

(declare-fun d!54649 () Bool)

(declare-fun e!120005 () Bool)

(assert (=> d!54649 e!120005))

(declare-fun res!86248 () Bool)

(assert (=> d!54649 (=> (not res!86248) (not e!120005))))

(declare-fun lt!90199 () ListLongMap!2261)

(assert (=> d!54649 (= res!86248 (contains!1240 lt!90199 (_1!1681 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248)))))))

(declare-fun lt!90200 () List!2281)

(assert (=> d!54649 (= lt!90199 (ListLongMap!2262 lt!90200))))

(declare-fun lt!90201 () Unit!5524)

(declare-fun lt!90198 () Unit!5524)

(assert (=> d!54649 (= lt!90201 lt!90198)))

(assert (=> d!54649 (= (getValueByKey!212 lt!90200 (_1!1681 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248)))) (Some!217 (_2!1681 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248)))))))

(assert (=> d!54649 (= lt!90198 (lemmaContainsTupThenGetReturnValue!113 lt!90200 (_1!1681 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248))) (_2!1681 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248)))))))

(assert (=> d!54649 (= lt!90200 (insertStrictlySorted!116 (toList!1146 lt!90123) (_1!1681 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248))) (_2!1681 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248)))))))

(assert (=> d!54649 (= (+!274 lt!90123 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248))) lt!90199)))

(declare-fun b!182242 () Bool)

(declare-fun res!86249 () Bool)

(assert (=> b!182242 (=> (not res!86249) (not e!120005))))

(assert (=> b!182242 (= res!86249 (= (getValueByKey!212 (toList!1146 lt!90199) (_1!1681 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248)))) (Some!217 (_2!1681 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248))))))))

(declare-fun b!182243 () Bool)

(assert (=> b!182243 (= e!120005 (contains!1241 (toList!1146 lt!90199) (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248))))))

(assert (= (and d!54649 res!86248) b!182242))

(assert (= (and b!182242 res!86249) b!182243))

(declare-fun m!210221 () Bool)

(assert (=> d!54649 m!210221))

(declare-fun m!210223 () Bool)

(assert (=> d!54649 m!210223))

(declare-fun m!210225 () Bool)

(assert (=> d!54649 m!210225))

(declare-fun m!210227 () Bool)

(assert (=> d!54649 m!210227))

(declare-fun m!210229 () Bool)

(assert (=> b!182242 m!210229))

(declare-fun m!210231 () Bool)

(assert (=> b!182243 m!210231))

(assert (=> b!182127 d!54649))

(declare-fun d!54651 () Bool)

(assert (=> d!54651 (= (apply!154 (+!274 lt!90119 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248))) lt!90114) (get!2095 (getValueByKey!212 (toList!1146 (+!274 lt!90119 (tuple2!3341 lt!90113 (minValue!3566 thiss!1248)))) lt!90114)))))

(declare-fun bs!7448 () Bool)

(assert (= bs!7448 d!54651))

(declare-fun m!210233 () Bool)

(assert (=> bs!7448 m!210233))

(assert (=> bs!7448 m!210233))

(declare-fun m!210235 () Bool)

(assert (=> bs!7448 m!210235))

(assert (=> b!182127 d!54651))

(declare-fun d!54653 () Bool)

(assert (=> d!54653 (contains!1240 (+!274 lt!90123 (tuple2!3341 lt!90127 (zeroValue!3566 thiss!1248))) lt!90117)))

(declare-fun lt!90204 () Unit!5524)

(declare-fun choose!975 (ListLongMap!2261 (_ BitVec 64) V!5329 (_ BitVec 64)) Unit!5524)

(assert (=> d!54653 (= lt!90204 (choose!975 lt!90123 lt!90127 (zeroValue!3566 thiss!1248) lt!90117))))

(assert (=> d!54653 (contains!1240 lt!90123 lt!90117)))

(assert (=> d!54653 (= (addStillContains!130 lt!90123 lt!90127 (zeroValue!3566 thiss!1248) lt!90117) lt!90204)))

(declare-fun bs!7449 () Bool)

(assert (= bs!7449 d!54653))

(assert (=> bs!7449 m!210079))

(assert (=> bs!7449 m!210079))

(assert (=> bs!7449 m!210103))

(declare-fun m!210237 () Bool)

(assert (=> bs!7449 m!210237))

(declare-fun m!210239 () Bool)

(assert (=> bs!7449 m!210239))

(assert (=> b!182127 d!54653))

(declare-fun d!54655 () Bool)

(assert (=> d!54655 (= (apply!154 lt!90109 lt!90111) (get!2095 (getValueByKey!212 (toList!1146 lt!90109) lt!90111)))))

(declare-fun bs!7450 () Bool)

(assert (= bs!7450 d!54655))

(declare-fun m!210241 () Bool)

(assert (=> bs!7450 m!210241))

(assert (=> bs!7450 m!210241))

(declare-fun m!210243 () Bool)

(assert (=> bs!7450 m!210243))

(assert (=> b!182127 d!54655))

(declare-fun d!54657 () Bool)

(assert (=> d!54657 (= (apply!154 (+!274 lt!90122 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248))) lt!90108) (get!2095 (getValueByKey!212 (toList!1146 (+!274 lt!90122 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248)))) lt!90108)))))

(declare-fun bs!7451 () Bool)

(assert (= bs!7451 d!54657))

(declare-fun m!210245 () Bool)

(assert (=> bs!7451 m!210245))

(assert (=> bs!7451 m!210245))

(declare-fun m!210247 () Bool)

(assert (=> bs!7451 m!210247))

(assert (=> b!182127 d!54657))

(declare-fun d!54659 () Bool)

(declare-fun e!120006 () Bool)

(assert (=> d!54659 e!120006))

(declare-fun res!86250 () Bool)

(assert (=> d!54659 (=> (not res!86250) (not e!120006))))

(declare-fun lt!90206 () ListLongMap!2261)

(assert (=> d!54659 (= res!86250 (contains!1240 lt!90206 (_1!1681 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248)))))))

(declare-fun lt!90207 () List!2281)

(assert (=> d!54659 (= lt!90206 (ListLongMap!2262 lt!90207))))

(declare-fun lt!90208 () Unit!5524)

(declare-fun lt!90205 () Unit!5524)

(assert (=> d!54659 (= lt!90208 lt!90205)))

(assert (=> d!54659 (= (getValueByKey!212 lt!90207 (_1!1681 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248)))) (Some!217 (_2!1681 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248)))))))

(assert (=> d!54659 (= lt!90205 (lemmaContainsTupThenGetReturnValue!113 lt!90207 (_1!1681 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248))) (_2!1681 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248)))))))

(assert (=> d!54659 (= lt!90207 (insertStrictlySorted!116 (toList!1146 lt!90122) (_1!1681 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248))) (_2!1681 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248)))))))

(assert (=> d!54659 (= (+!274 lt!90122 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248))) lt!90206)))

(declare-fun b!182245 () Bool)

(declare-fun res!86251 () Bool)

(assert (=> b!182245 (=> (not res!86251) (not e!120006))))

(assert (=> b!182245 (= res!86251 (= (getValueByKey!212 (toList!1146 lt!90206) (_1!1681 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248)))) (Some!217 (_2!1681 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248))))))))

(declare-fun b!182246 () Bool)

(assert (=> b!182246 (= e!120006 (contains!1241 (toList!1146 lt!90206) (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248))))))

(assert (= (and d!54659 res!86250) b!182245))

(assert (= (and b!182245 res!86251) b!182246))

(declare-fun m!210249 () Bool)

(assert (=> d!54659 m!210249))

(declare-fun m!210251 () Bool)

(assert (=> d!54659 m!210251))

(declare-fun m!210253 () Bool)

(assert (=> d!54659 m!210253))

(declare-fun m!210255 () Bool)

(assert (=> d!54659 m!210255))

(declare-fun m!210257 () Bool)

(assert (=> b!182245 m!210257))

(declare-fun m!210259 () Bool)

(assert (=> b!182246 m!210259))

(assert (=> b!182127 d!54659))

(declare-fun d!54661 () Bool)

(assert (=> d!54661 (= (apply!154 (+!274 lt!90109 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248))) lt!90111) (apply!154 lt!90109 lt!90111))))

(declare-fun lt!90209 () Unit!5524)

(assert (=> d!54661 (= lt!90209 (choose!974 lt!90109 lt!90118 (minValue!3566 thiss!1248) lt!90111))))

(declare-fun e!120007 () Bool)

(assert (=> d!54661 e!120007))

(declare-fun res!86252 () Bool)

(assert (=> d!54661 (=> (not res!86252) (not e!120007))))

(assert (=> d!54661 (= res!86252 (contains!1240 lt!90109 lt!90111))))

(assert (=> d!54661 (= (addApplyDifferent!130 lt!90109 lt!90118 (minValue!3566 thiss!1248) lt!90111) lt!90209)))

(declare-fun b!182247 () Bool)

(assert (=> b!182247 (= e!120007 (not (= lt!90111 lt!90118)))))

(assert (= (and d!54661 res!86252) b!182247))

(assert (=> d!54661 m!210085))

(assert (=> d!54661 m!210085))

(assert (=> d!54661 m!210099))

(assert (=> d!54661 m!210097))

(declare-fun m!210261 () Bool)

(assert (=> d!54661 m!210261))

(declare-fun m!210263 () Bool)

(assert (=> d!54661 m!210263))

(assert (=> b!182127 d!54661))

(declare-fun d!54663 () Bool)

(assert (=> d!54663 (= (apply!154 (+!274 lt!90122 (tuple2!3341 lt!90120 (zeroValue!3566 thiss!1248))) lt!90108) (apply!154 lt!90122 lt!90108))))

(declare-fun lt!90210 () Unit!5524)

(assert (=> d!54663 (= lt!90210 (choose!974 lt!90122 lt!90120 (zeroValue!3566 thiss!1248) lt!90108))))

(declare-fun e!120008 () Bool)

(assert (=> d!54663 e!120008))

(declare-fun res!86253 () Bool)

(assert (=> d!54663 (=> (not res!86253) (not e!120008))))

(assert (=> d!54663 (= res!86253 (contains!1240 lt!90122 lt!90108))))

(assert (=> d!54663 (= (addApplyDifferent!130 lt!90122 lt!90120 (zeroValue!3566 thiss!1248) lt!90108) lt!90210)))

(declare-fun b!182248 () Bool)

(assert (=> b!182248 (= e!120008 (not (= lt!90108 lt!90120)))))

(assert (= (and d!54663 res!86253) b!182248))

(assert (=> d!54663 m!210075))

(assert (=> d!54663 m!210075))

(assert (=> d!54663 m!210105))

(assert (=> d!54663 m!210081))

(declare-fun m!210265 () Bool)

(assert (=> d!54663 m!210265))

(declare-fun m!210267 () Bool)

(assert (=> d!54663 m!210267))

(assert (=> b!182127 d!54663))

(declare-fun d!54665 () Bool)

(declare-fun e!120009 () Bool)

(assert (=> d!54665 e!120009))

(declare-fun res!86254 () Bool)

(assert (=> d!54665 (=> (not res!86254) (not e!120009))))

(declare-fun lt!90212 () ListLongMap!2261)

(assert (=> d!54665 (= res!86254 (contains!1240 lt!90212 (_1!1681 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248)))))))

(declare-fun lt!90213 () List!2281)

(assert (=> d!54665 (= lt!90212 (ListLongMap!2262 lt!90213))))

(declare-fun lt!90214 () Unit!5524)

(declare-fun lt!90211 () Unit!5524)

(assert (=> d!54665 (= lt!90214 lt!90211)))

(assert (=> d!54665 (= (getValueByKey!212 lt!90213 (_1!1681 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248)))) (Some!217 (_2!1681 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248)))))))

(assert (=> d!54665 (= lt!90211 (lemmaContainsTupThenGetReturnValue!113 lt!90213 (_1!1681 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248))) (_2!1681 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248)))))))

(assert (=> d!54665 (= lt!90213 (insertStrictlySorted!116 (toList!1146 lt!90109) (_1!1681 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248))) (_2!1681 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248)))))))

(assert (=> d!54665 (= (+!274 lt!90109 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248))) lt!90212)))

(declare-fun b!182249 () Bool)

(declare-fun res!86255 () Bool)

(assert (=> b!182249 (=> (not res!86255) (not e!120009))))

(assert (=> b!182249 (= res!86255 (= (getValueByKey!212 (toList!1146 lt!90212) (_1!1681 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248)))) (Some!217 (_2!1681 (tuple2!3341 lt!90118 (minValue!3566 thiss!1248))))))))

(declare-fun b!182250 () Bool)

(assert (=> b!182250 (= e!120009 (contains!1241 (toList!1146 lt!90212) (tuple2!3341 lt!90118 (minValue!3566 thiss!1248))))))

(assert (= (and d!54665 res!86254) b!182249))

(assert (= (and b!182249 res!86255) b!182250))

(declare-fun m!210269 () Bool)

(assert (=> d!54665 m!210269))

(declare-fun m!210271 () Bool)

(assert (=> d!54665 m!210271))

(declare-fun m!210273 () Bool)

(assert (=> d!54665 m!210273))

(declare-fun m!210275 () Bool)

(assert (=> d!54665 m!210275))

(declare-fun m!210277 () Bool)

(assert (=> b!182249 m!210277))

(declare-fun m!210279 () Bool)

(assert (=> b!182250 m!210279))

(assert (=> b!182127 d!54665))

(declare-fun d!54667 () Bool)

(declare-fun res!86260 () Bool)

(declare-fun e!120014 () Bool)

(assert (=> d!54667 (=> res!86260 e!120014)))

(assert (=> d!54667 (= res!86260 (and ((_ is Cons!2277) (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))) (= (_1!1681 (h!2905 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))))) key!828)))))

(assert (=> d!54667 (= (containsKey!215 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828) e!120014)))

(declare-fun b!182255 () Bool)

(declare-fun e!120015 () Bool)

(assert (=> b!182255 (= e!120014 e!120015)))

(declare-fun res!86261 () Bool)

(assert (=> b!182255 (=> (not res!86261) (not e!120015))))

(assert (=> b!182255 (= res!86261 (and (or (not ((_ is Cons!2277) (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))))) (bvsle (_1!1681 (h!2905 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))))) key!828)) ((_ is Cons!2277) (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))) (bvslt (_1!1681 (h!2905 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))))) key!828)))))

(declare-fun b!182256 () Bool)

(assert (=> b!182256 (= e!120015 (containsKey!215 (t!7131 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))) key!828))))

(assert (= (and d!54667 (not res!86260)) b!182255))

(assert (= (and b!182255 res!86261) b!182256))

(declare-fun m!210281 () Bool)

(assert (=> b!182256 m!210281))

(assert (=> d!54615 d!54667))

(declare-fun b!182269 () Bool)

(declare-fun e!120023 () SeekEntryResult!595)

(assert (=> b!182269 (= e!120023 Undefined!595)))

(declare-fun b!182271 () Bool)

(declare-fun e!120022 () SeekEntryResult!595)

(assert (=> b!182271 (= e!120023 e!120022)))

(declare-fun c!32696 () Bool)

(declare-fun lt!90220 () (_ BitVec 64))

(assert (=> b!182271 (= c!32696 (= lt!90220 key!828))))

(declare-fun e!120024 () SeekEntryResult!595)

(declare-fun b!182272 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!182272 (= e!120024 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19843 lt!90135) #b00000000000000000000000000000001) (nextIndex!0 (index!4552 lt!90135) (bvadd (x!19843 lt!90135) #b00000000000000000000000000000001) (mask!8758 thiss!1248)) (index!4552 lt!90135) key!828 (_keys!5632 thiss!1248) (mask!8758 thiss!1248)))))

(declare-fun b!182273 () Bool)

(declare-fun c!32697 () Bool)

(assert (=> b!182273 (= c!32697 (= lt!90220 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182273 (= e!120022 e!120024)))

(declare-fun b!182274 () Bool)

(assert (=> b!182274 (= e!120024 (MissingVacant!595 (index!4552 lt!90135)))))

(declare-fun b!182270 () Bool)

(assert (=> b!182270 (= e!120022 (Found!595 (index!4552 lt!90135)))))

(declare-fun lt!90219 () SeekEntryResult!595)

(declare-fun d!54669 () Bool)

(assert (=> d!54669 (and (or ((_ is Undefined!595) lt!90219) (not ((_ is Found!595) lt!90219)) (and (bvsge (index!4551 lt!90219) #b00000000000000000000000000000000) (bvslt (index!4551 lt!90219) (size!3949 (_keys!5632 thiss!1248))))) (or ((_ is Undefined!595) lt!90219) ((_ is Found!595) lt!90219) (not ((_ is MissingVacant!595) lt!90219)) (not (= (index!4553 lt!90219) (index!4552 lt!90135))) (and (bvsge (index!4553 lt!90219) #b00000000000000000000000000000000) (bvslt (index!4553 lt!90219) (size!3949 (_keys!5632 thiss!1248))))) (or ((_ is Undefined!595) lt!90219) (ite ((_ is Found!595) lt!90219) (= (select (arr!3638 (_keys!5632 thiss!1248)) (index!4551 lt!90219)) key!828) (and ((_ is MissingVacant!595) lt!90219) (= (index!4553 lt!90219) (index!4552 lt!90135)) (= (select (arr!3638 (_keys!5632 thiss!1248)) (index!4553 lt!90219)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54669 (= lt!90219 e!120023)))

(declare-fun c!32695 () Bool)

(assert (=> d!54669 (= c!32695 (bvsge (x!19843 lt!90135) #b01111111111111111111111111111110))))

(assert (=> d!54669 (= lt!90220 (select (arr!3638 (_keys!5632 thiss!1248)) (index!4552 lt!90135)))))

(assert (=> d!54669 (validMask!0 (mask!8758 thiss!1248))))

(assert (=> d!54669 (= (seekKeyOrZeroReturnVacant!0 (x!19843 lt!90135) (index!4552 lt!90135) (index!4552 lt!90135) key!828 (_keys!5632 thiss!1248) (mask!8758 thiss!1248)) lt!90219)))

(assert (= (and d!54669 c!32695) b!182269))

(assert (= (and d!54669 (not c!32695)) b!182271))

(assert (= (and b!182271 c!32696) b!182270))

(assert (= (and b!182271 (not c!32696)) b!182273))

(assert (= (and b!182273 c!32697) b!182274))

(assert (= (and b!182273 (not c!32697)) b!182272))

(declare-fun m!210283 () Bool)

(assert (=> b!182272 m!210283))

(assert (=> b!182272 m!210283))

(declare-fun m!210285 () Bool)

(assert (=> b!182272 m!210285))

(declare-fun m!210287 () Bool)

(assert (=> d!54669 m!210287))

(declare-fun m!210289 () Bool)

(assert (=> d!54669 m!210289))

(assert (=> d!54669 m!210109))

(assert (=> d!54669 m!209993))

(assert (=> b!182160 d!54669))

(declare-fun d!54671 () Bool)

(declare-fun lt!90223 () (_ BitVec 32))

(assert (=> d!54671 (and (bvsge lt!90223 #b00000000000000000000000000000000) (bvsle lt!90223 (bvsub (size!3949 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!120030 () (_ BitVec 32))

(assert (=> d!54671 (= lt!90223 e!120030)))

(declare-fun c!32703 () Bool)

(assert (=> d!54671 (= c!32703 (bvsge #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))))))

(assert (=> d!54671 (and (bvsle #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3949 (_keys!5632 thiss!1248)) (size!3949 (_keys!5632 thiss!1248))))))

(assert (=> d!54671 (= (arrayCountValidKeys!0 (_keys!5632 thiss!1248) #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))) lt!90223)))

(declare-fun b!182283 () Bool)

(declare-fun e!120029 () (_ BitVec 32))

(declare-fun call!18394 () (_ BitVec 32))

(assert (=> b!182283 (= e!120029 (bvadd #b00000000000000000000000000000001 call!18394))))

(declare-fun bm!18391 () Bool)

(assert (=> bm!18391 (= call!18394 (arrayCountValidKeys!0 (_keys!5632 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3949 (_keys!5632 thiss!1248))))))

(declare-fun b!182284 () Bool)

(assert (=> b!182284 (= e!120029 call!18394)))

(declare-fun b!182285 () Bool)

(assert (=> b!182285 (= e!120030 #b00000000000000000000000000000000)))

(declare-fun b!182286 () Bool)

(assert (=> b!182286 (= e!120030 e!120029)))

(declare-fun c!32702 () Bool)

(assert (=> b!182286 (= c!32702 (validKeyInArray!0 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54671 c!32703) b!182285))

(assert (= (and d!54671 (not c!32703)) b!182286))

(assert (= (and b!182286 c!32702) b!182283))

(assert (= (and b!182286 (not c!32702)) b!182284))

(assert (= (or b!182283 b!182284) bm!18391))

(declare-fun m!210291 () Bool)

(assert (=> bm!18391 m!210291))

(assert (=> b!182286 m!210061))

(assert (=> b!182286 m!210061))

(assert (=> b!182286 m!210107))

(assert (=> b!182070 d!54671))

(declare-fun b!182298 () Bool)

(declare-fun e!120033 () Bool)

(assert (=> b!182298 (= e!120033 (and (bvsge (extraKeys!3462 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3462 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1290 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!182296 () Bool)

(declare-fun res!86273 () Bool)

(assert (=> b!182296 (=> (not res!86273) (not e!120033))))

(declare-fun size!3955 (LongMapFixedSize!2482) (_ BitVec 32))

(assert (=> b!182296 (= res!86273 (bvsge (size!3955 thiss!1248) (_size!1290 thiss!1248)))))

(declare-fun b!182297 () Bool)

(declare-fun res!86272 () Bool)

(assert (=> b!182297 (=> (not res!86272) (not e!120033))))

(assert (=> b!182297 (= res!86272 (= (size!3955 thiss!1248) (bvadd (_size!1290 thiss!1248) (bvsdiv (bvadd (extraKeys!3462 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!54673 () Bool)

(declare-fun res!86270 () Bool)

(assert (=> d!54673 (=> (not res!86270) (not e!120033))))

(assert (=> d!54673 (= res!86270 (validMask!0 (mask!8758 thiss!1248)))))

(assert (=> d!54673 (= (simpleValid!170 thiss!1248) e!120033)))

(declare-fun b!182295 () Bool)

(declare-fun res!86271 () Bool)

(assert (=> b!182295 (=> (not res!86271) (not e!120033))))

(assert (=> b!182295 (= res!86271 (and (= (size!3950 (_values!3708 thiss!1248)) (bvadd (mask!8758 thiss!1248) #b00000000000000000000000000000001)) (= (size!3949 (_keys!5632 thiss!1248)) (size!3950 (_values!3708 thiss!1248))) (bvsge (_size!1290 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1290 thiss!1248) (bvadd (mask!8758 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!54673 res!86270) b!182295))

(assert (= (and b!182295 res!86271) b!182296))

(assert (= (and b!182296 res!86273) b!182297))

(assert (= (and b!182297 res!86272) b!182298))

(declare-fun m!210293 () Bool)

(assert (=> b!182296 m!210293))

(assert (=> b!182297 m!210293))

(assert (=> d!54673 m!209993))

(assert (=> d!54609 d!54673))

(declare-fun d!54675 () Bool)

(assert (=> d!54675 (isDefined!164 (getValueByKey!212 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))

(declare-fun lt!90226 () Unit!5524)

(declare-fun choose!976 (List!2281 (_ BitVec 64)) Unit!5524)

(assert (=> d!54675 (= lt!90226 (choose!976 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))

(declare-fun e!120036 () Bool)

(assert (=> d!54675 e!120036))

(declare-fun res!86276 () Bool)

(assert (=> d!54675 (=> (not res!86276) (not e!120036))))

(declare-fun isStrictlySorted!331 (List!2281) Bool)

(assert (=> d!54675 (= res!86276 (isStrictlySorted!331 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))))

(assert (=> d!54675 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!163 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828) lt!90226)))

(declare-fun b!182301 () Bool)

(assert (=> b!182301 (= e!120036 (containsKey!215 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))

(assert (= (and d!54675 res!86276) b!182301))

(assert (=> d!54675 m!210047))

(assert (=> d!54675 m!210047))

(assert (=> d!54675 m!210049))

(declare-fun m!210295 () Bool)

(assert (=> d!54675 m!210295))

(declare-fun m!210297 () Bool)

(assert (=> d!54675 m!210297))

(assert (=> b!182301 m!210043))

(assert (=> b!182079 d!54675))

(declare-fun d!54677 () Bool)

(declare-fun isEmpty!468 (Option!218) Bool)

(assert (=> d!54677 (= (isDefined!164 (getValueByKey!212 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828)) (not (isEmpty!468 (getValueByKey!212 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))))

(declare-fun bs!7452 () Bool)

(assert (= bs!7452 d!54677))

(assert (=> bs!7452 m!210047))

(declare-fun m!210299 () Bool)

(assert (=> bs!7452 m!210299))

(assert (=> b!182079 d!54677))

(declare-fun b!182311 () Bool)

(declare-fun e!120041 () Option!218)

(declare-fun e!120042 () Option!218)

(assert (=> b!182311 (= e!120041 e!120042)))

(declare-fun c!32709 () Bool)

(assert (=> b!182311 (= c!32709 (and ((_ is Cons!2277) (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))) (not (= (_1!1681 (h!2905 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))))) key!828))))))

(declare-fun b!182310 () Bool)

(assert (=> b!182310 (= e!120041 (Some!217 (_2!1681 (h!2905 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))))))

(declare-fun b!182312 () Bool)

(assert (=> b!182312 (= e!120042 (getValueByKey!212 (t!7131 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))) key!828))))

(declare-fun d!54679 () Bool)

(declare-fun c!32708 () Bool)

(assert (=> d!54679 (= c!32708 (and ((_ is Cons!2277) (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))) (= (_1!1681 (h!2905 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))))) key!828)))))

(assert (=> d!54679 (= (getValueByKey!212 (toList!1146 (getCurrentListMap!798 (_keys!5632 thiss!1248) (_values!3708 thiss!1248) (mask!8758 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828) e!120041)))

(declare-fun b!182313 () Bool)

(assert (=> b!182313 (= e!120042 None!216)))

(assert (= (and d!54679 c!32708) b!182310))

(assert (= (and d!54679 (not c!32708)) b!182311))

(assert (= (and b!182311 c!32709) b!182312))

(assert (= (and b!182311 (not c!32709)) b!182313))

(declare-fun m!210301 () Bool)

(assert (=> b!182312 m!210301))

(assert (=> b!182079 d!54679))

(declare-fun d!54681 () Bool)

(declare-fun e!120043 () Bool)

(assert (=> d!54681 e!120043))

(declare-fun res!86277 () Bool)

(assert (=> d!54681 (=> (not res!86277) (not e!120043))))

(declare-fun lt!90228 () ListLongMap!2261)

(assert (=> d!54681 (= res!86277 (contains!1240 lt!90228 (_1!1681 (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))

(declare-fun lt!90229 () List!2281)

(assert (=> d!54681 (= lt!90228 (ListLongMap!2262 lt!90229))))

(declare-fun lt!90230 () Unit!5524)

(declare-fun lt!90227 () Unit!5524)

(assert (=> d!54681 (= lt!90230 lt!90227)))

(assert (=> d!54681 (= (getValueByKey!212 lt!90229 (_1!1681 (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))) (Some!217 (_2!1681 (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))

(assert (=> d!54681 (= lt!90227 (lemmaContainsTupThenGetReturnValue!113 lt!90229 (_1!1681 (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))) (_2!1681 (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))

(assert (=> d!54681 (= lt!90229 (insertStrictlySorted!116 (toList!1146 call!18384) (_1!1681 (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))) (_2!1681 (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))

(assert (=> d!54681 (= (+!274 call!18384 (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))) lt!90228)))

(declare-fun b!182314 () Bool)

(declare-fun res!86278 () Bool)

(assert (=> b!182314 (=> (not res!86278) (not e!120043))))

(assert (=> b!182314 (= res!86278 (= (getValueByKey!212 (toList!1146 lt!90228) (_1!1681 (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))) (Some!217 (_2!1681 (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))))

(declare-fun b!182315 () Bool)

(assert (=> b!182315 (= e!120043 (contains!1241 (toList!1146 lt!90228) (tuple2!3341 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))

(assert (= (and d!54681 res!86277) b!182314))

(assert (= (and b!182314 res!86278) b!182315))

(declare-fun m!210303 () Bool)

(assert (=> d!54681 m!210303))

(declare-fun m!210305 () Bool)

(assert (=> d!54681 m!210305))

(declare-fun m!210307 () Bool)

(assert (=> d!54681 m!210307))

(declare-fun m!210309 () Bool)

(assert (=> d!54681 m!210309))

(declare-fun m!210311 () Bool)

(assert (=> b!182314 m!210311))

(declare-fun m!210313 () Bool)

(assert (=> b!182315 m!210313))

(assert (=> b!182135 d!54681))

(declare-fun d!54683 () Bool)

(declare-fun res!86285 () Bool)

(declare-fun e!120054 () Bool)

(assert (=> d!54683 (=> res!86285 e!120054)))

(assert (=> d!54683 (= res!86285 (bvsge #b00000000000000000000000000000000 (size!3949 (_keys!5632 thiss!1248))))))

(assert (=> d!54683 (= (arrayNoDuplicates!0 (_keys!5632 thiss!1248) #b00000000000000000000000000000000 Nil!2279) e!120054)))

(declare-fun b!182326 () Bool)

(declare-fun e!120055 () Bool)

(declare-fun call!18397 () Bool)

(assert (=> b!182326 (= e!120055 call!18397)))

(declare-fun b!182327 () Bool)

(declare-fun e!120053 () Bool)

(declare-fun contains!1242 (List!2282 (_ BitVec 64)) Bool)

(assert (=> b!182327 (= e!120053 (contains!1242 Nil!2279 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182328 () Bool)

(declare-fun e!120052 () Bool)

(assert (=> b!182328 (= e!120054 e!120052)))

(declare-fun res!86286 () Bool)

(assert (=> b!182328 (=> (not res!86286) (not e!120052))))

(assert (=> b!182328 (= res!86286 (not e!120053))))

(declare-fun res!86287 () Bool)

(assert (=> b!182328 (=> (not res!86287) (not e!120053))))

(assert (=> b!182328 (= res!86287 (validKeyInArray!0 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182329 () Bool)

(assert (=> b!182329 (= e!120052 e!120055)))

(declare-fun c!32712 () Bool)

(assert (=> b!182329 (= c!32712 (validKeyInArray!0 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182330 () Bool)

(assert (=> b!182330 (= e!120055 call!18397)))

(declare-fun bm!18394 () Bool)

(assert (=> bm!18394 (= call!18397 (arrayNoDuplicates!0 (_keys!5632 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32712 (Cons!2278 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000) Nil!2279) Nil!2279)))))

(assert (= (and d!54683 (not res!86285)) b!182328))

(assert (= (and b!182328 res!86287) b!182327))

(assert (= (and b!182328 res!86286) b!182329))

(assert (= (and b!182329 c!32712) b!182330))

(assert (= (and b!182329 (not c!32712)) b!182326))

(assert (= (or b!182330 b!182326) bm!18394))

(assert (=> b!182327 m!210061))

(assert (=> b!182327 m!210061))

(declare-fun m!210315 () Bool)

(assert (=> b!182327 m!210315))

(assert (=> b!182328 m!210061))

(assert (=> b!182328 m!210061))

(assert (=> b!182328 m!210107))

(assert (=> b!182329 m!210061))

(assert (=> b!182329 m!210061))

(assert (=> b!182329 m!210107))

(assert (=> bm!18394 m!210061))

(declare-fun m!210317 () Bool)

(assert (=> bm!18394 m!210317))

(assert (=> b!182072 d!54683))

(assert (=> bm!18376 d!54635))

(declare-fun d!54685 () Bool)

(assert (=> d!54685 (= (apply!154 lt!90115 (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000)) (get!2095 (getValueByKey!212 (toList!1146 lt!90115) (select (arr!3638 (_keys!5632 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7453 () Bool)

(assert (= bs!7453 d!54685))

(assert (=> bs!7453 m!210061))

(assert (=> bs!7453 m!210153))

(assert (=> bs!7453 m!210153))

(declare-fun m!210319 () Bool)

(assert (=> bs!7453 m!210319))

(assert (=> b!182142 d!54685))

(declare-fun d!54687 () Bool)

(declare-fun c!32715 () Bool)

(assert (=> d!54687 (= c!32715 ((_ is ValueCellFull!1787) (select (arr!3639 (_values!3708 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!120058 () V!5329)

(assert (=> d!54687 (= (get!2094 (select (arr!3639 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!120058)))

(declare-fun b!182335 () Bool)

(declare-fun get!2096 (ValueCell!1787 V!5329) V!5329)

(assert (=> b!182335 (= e!120058 (get!2096 (select (arr!3639 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182336 () Bool)

(declare-fun get!2097 (ValueCell!1787 V!5329) V!5329)

(assert (=> b!182336 (= e!120058 (get!2097 (select (arr!3639 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54687 c!32715) b!182335))

(assert (= (and d!54687 (not c!32715)) b!182336))

(assert (=> b!182335 m!210069))

(assert (=> b!182335 m!210067))

(declare-fun m!210321 () Bool)

(assert (=> b!182335 m!210321))

(assert (=> b!182336 m!210069))

(assert (=> b!182336 m!210067))

(declare-fun m!210323 () Bool)

(assert (=> b!182336 m!210323))

(assert (=> b!182142 d!54687))

(assert (=> b!182129 d!54623))

(assert (=> b!182081 d!54677))

(assert (=> b!182081 d!54679))

(assert (=> d!54617 d!54621))

(declare-fun d!54689 () Bool)

(declare-fun e!120060 () Bool)

(assert (=> d!54689 e!120060))

(declare-fun res!86288 () Bool)

(assert (=> d!54689 (=> res!86288 e!120060)))

(declare-fun lt!90232 () Bool)

(assert (=> d!54689 (= res!86288 (not lt!90232))))

(declare-fun lt!90231 () Bool)

(assert (=> d!54689 (= lt!90232 lt!90231)))

(declare-fun lt!90234 () Unit!5524)

(declare-fun e!120059 () Unit!5524)

(assert (=> d!54689 (= lt!90234 e!120059)))

(declare-fun c!32716 () Bool)

(assert (=> d!54689 (= c!32716 lt!90231)))

(assert (=> d!54689 (= lt!90231 (containsKey!215 (toList!1146 lt!90115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54689 (= (contains!1240 lt!90115 #b1000000000000000000000000000000000000000000000000000000000000000) lt!90232)))

(declare-fun b!182337 () Bool)

(declare-fun lt!90233 () Unit!5524)

(assert (=> b!182337 (= e!120059 lt!90233)))

(assert (=> b!182337 (= lt!90233 (lemmaContainsKeyImpliesGetValueByKeyDefined!163 (toList!1146 lt!90115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182337 (isDefined!164 (getValueByKey!212 (toList!1146 lt!90115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182338 () Bool)

(declare-fun Unit!5531 () Unit!5524)

(assert (=> b!182338 (= e!120059 Unit!5531)))

(declare-fun b!182339 () Bool)

(assert (=> b!182339 (= e!120060 (isDefined!164 (getValueByKey!212 (toList!1146 lt!90115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54689 c!32716) b!182337))

(assert (= (and d!54689 (not c!32716)) b!182338))

(assert (= (and d!54689 (not res!86288)) b!182339))

(declare-fun m!210325 () Bool)

(assert (=> d!54689 m!210325))

(declare-fun m!210327 () Bool)

(assert (=> b!182337 m!210327))

(assert (=> b!182337 m!210125))

(assert (=> b!182337 m!210125))

(declare-fun m!210329 () Bool)

(assert (=> b!182337 m!210329))

(assert (=> b!182339 m!210125))

(assert (=> b!182339 m!210125))

(assert (=> b!182339 m!210329))

(assert (=> bm!18378 d!54689))

(declare-fun b!182358 () Bool)

(declare-fun lt!90239 () SeekEntryResult!595)

(assert (=> b!182358 (and (bvsge (index!4552 lt!90239) #b00000000000000000000000000000000) (bvslt (index!4552 lt!90239) (size!3949 (_keys!5632 thiss!1248))))))

(declare-fun res!86296 () Bool)

(assert (=> b!182358 (= res!86296 (= (select (arr!3638 (_keys!5632 thiss!1248)) (index!4552 lt!90239)) key!828))))

(declare-fun e!120073 () Bool)

(assert (=> b!182358 (=> res!86296 e!120073)))

(declare-fun e!120075 () Bool)

(assert (=> b!182358 (= e!120075 e!120073)))

(declare-fun b!182359 () Bool)

(declare-fun e!120071 () SeekEntryResult!595)

(assert (=> b!182359 (= e!120071 (Intermediate!595 false (toIndex!0 key!828 (mask!8758 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!182360 () Bool)

(declare-fun e!120074 () SeekEntryResult!595)

(assert (=> b!182360 (= e!120074 e!120071)))

(declare-fun c!32724 () Bool)

(declare-fun lt!90240 () (_ BitVec 64))

(assert (=> b!182360 (= c!32724 (or (= lt!90240 key!828) (= (bvadd lt!90240 lt!90240) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182361 () Bool)

(assert (=> b!182361 (and (bvsge (index!4552 lt!90239) #b00000000000000000000000000000000) (bvslt (index!4552 lt!90239) (size!3949 (_keys!5632 thiss!1248))))))

(declare-fun res!86295 () Bool)

(assert (=> b!182361 (= res!86295 (= (select (arr!3638 (_keys!5632 thiss!1248)) (index!4552 lt!90239)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182361 (=> res!86295 e!120073)))

(declare-fun b!182362 () Bool)

(assert (=> b!182362 (= e!120071 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8758 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8758 thiss!1248)) key!828 (_keys!5632 thiss!1248) (mask!8758 thiss!1248)))))

(declare-fun b!182363 () Bool)

(assert (=> b!182363 (and (bvsge (index!4552 lt!90239) #b00000000000000000000000000000000) (bvslt (index!4552 lt!90239) (size!3949 (_keys!5632 thiss!1248))))))

(assert (=> b!182363 (= e!120073 (= (select (arr!3638 (_keys!5632 thiss!1248)) (index!4552 lt!90239)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182364 () Bool)

(assert (=> b!182364 (= e!120074 (Intermediate!595 true (toIndex!0 key!828 (mask!8758 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!54691 () Bool)

(declare-fun e!120072 () Bool)

(assert (=> d!54691 e!120072))

(declare-fun c!32725 () Bool)

(assert (=> d!54691 (= c!32725 (and ((_ is Intermediate!595) lt!90239) (undefined!1407 lt!90239)))))

(assert (=> d!54691 (= lt!90239 e!120074)))

(declare-fun c!32723 () Bool)

(assert (=> d!54691 (= c!32723 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!54691 (= lt!90240 (select (arr!3638 (_keys!5632 thiss!1248)) (toIndex!0 key!828 (mask!8758 thiss!1248))))))

(assert (=> d!54691 (validMask!0 (mask!8758 thiss!1248))))

(assert (=> d!54691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8758 thiss!1248)) key!828 (_keys!5632 thiss!1248) (mask!8758 thiss!1248)) lt!90239)))

(declare-fun b!182365 () Bool)

(assert (=> b!182365 (= e!120072 (bvsge (x!19843 lt!90239) #b01111111111111111111111111111110))))

(declare-fun b!182366 () Bool)

(assert (=> b!182366 (= e!120072 e!120075)))

(declare-fun res!86297 () Bool)

(assert (=> b!182366 (= res!86297 (and ((_ is Intermediate!595) lt!90239) (not (undefined!1407 lt!90239)) (bvslt (x!19843 lt!90239) #b01111111111111111111111111111110) (bvsge (x!19843 lt!90239) #b00000000000000000000000000000000) (bvsge (x!19843 lt!90239) #b00000000000000000000000000000000)))))

(assert (=> b!182366 (=> (not res!86297) (not e!120075))))

(assert (= (and d!54691 c!32723) b!182364))

(assert (= (and d!54691 (not c!32723)) b!182360))

(assert (= (and b!182360 c!32724) b!182359))

(assert (= (and b!182360 (not c!32724)) b!182362))

(assert (= (and d!54691 c!32725) b!182365))

(assert (= (and d!54691 (not c!32725)) b!182366))

(assert (= (and b!182366 res!86297) b!182358))

(assert (= (and b!182358 (not res!86296)) b!182361))

(assert (= (and b!182361 (not res!86295)) b!182363))

(declare-fun m!210331 () Bool)

(assert (=> b!182361 m!210331))

(assert (=> b!182358 m!210331))

(assert (=> b!182363 m!210331))

(assert (=> d!54691 m!210113))

(declare-fun m!210333 () Bool)

(assert (=> d!54691 m!210333))

(assert (=> d!54691 m!209993))

(assert (=> b!182362 m!210113))

(declare-fun m!210335 () Bool)

(assert (=> b!182362 m!210335))

(assert (=> b!182362 m!210335))

(declare-fun m!210337 () Bool)

(assert (=> b!182362 m!210337))

(assert (=> d!54619 d!54691))

(declare-fun d!54693 () Bool)

(declare-fun lt!90246 () (_ BitVec 32))

(declare-fun lt!90245 () (_ BitVec 32))

(assert (=> d!54693 (= lt!90246 (bvmul (bvxor lt!90245 (bvlshr lt!90245 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54693 (= lt!90245 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54693 (and (bvsge (mask!8758 thiss!1248) #b00000000000000000000000000000000) (let ((res!86298 (let ((h!2907 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19862 (bvmul (bvxor h!2907 (bvlshr h!2907 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19862 (bvlshr x!19862 #b00000000000000000000000000001101)) (mask!8758 thiss!1248)))))) (and (bvslt res!86298 (bvadd (mask!8758 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!86298 #b00000000000000000000000000000000))))))

(assert (=> d!54693 (= (toIndex!0 key!828 (mask!8758 thiss!1248)) (bvand (bvxor lt!90246 (bvlshr lt!90246 #b00000000000000000000000000001101)) (mask!8758 thiss!1248)))))

(assert (=> d!54619 d!54693))

(assert (=> d!54619 d!54621))

(declare-fun d!54695 () Bool)

(assert (=> d!54695 (= (apply!154 lt!90115 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2095 (getValueByKey!212 (toList!1146 lt!90115) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7454 () Bool)

(assert (= bs!7454 d!54695))

(assert (=> bs!7454 m!210133))

(assert (=> bs!7454 m!210133))

(declare-fun m!210339 () Bool)

(assert (=> bs!7454 m!210339))

(assert (=> b!182137 d!54695))

(declare-fun mapNonEmpty!7319 () Bool)

(declare-fun mapRes!7319 () Bool)

(declare-fun tp!16238 () Bool)

(declare-fun e!120076 () Bool)

(assert (=> mapNonEmpty!7319 (= mapRes!7319 (and tp!16238 e!120076))))

(declare-fun mapValue!7319 () ValueCell!1787)

(declare-fun mapRest!7319 () (Array (_ BitVec 32) ValueCell!1787))

(declare-fun mapKey!7319 () (_ BitVec 32))

(assert (=> mapNonEmpty!7319 (= mapRest!7318 (store mapRest!7319 mapKey!7319 mapValue!7319))))

(declare-fun condMapEmpty!7319 () Bool)

(declare-fun mapDefault!7319 () ValueCell!1787)

(assert (=> mapNonEmpty!7318 (= condMapEmpty!7319 (= mapRest!7318 ((as const (Array (_ BitVec 32) ValueCell!1787)) mapDefault!7319)))))

(declare-fun e!120077 () Bool)

(assert (=> mapNonEmpty!7318 (= tp!16237 (and e!120077 mapRes!7319))))

(declare-fun mapIsEmpty!7319 () Bool)

(assert (=> mapIsEmpty!7319 mapRes!7319))

(declare-fun b!182367 () Bool)

(assert (=> b!182367 (= e!120076 tp_is_empty!4261)))

(declare-fun b!182368 () Bool)

(assert (=> b!182368 (= e!120077 tp_is_empty!4261)))

(assert (= (and mapNonEmpty!7318 condMapEmpty!7319) mapIsEmpty!7319))

(assert (= (and mapNonEmpty!7318 (not condMapEmpty!7319)) mapNonEmpty!7319))

(assert (= (and mapNonEmpty!7319 ((_ is ValueCellFull!1787) mapValue!7319)) b!182367))

(assert (= (and mapNonEmpty!7318 ((_ is ValueCellFull!1787) mapDefault!7319)) b!182368))

(declare-fun m!210341 () Bool)

(assert (=> mapNonEmpty!7319 m!210341))

(declare-fun b_lambda!7193 () Bool)

(assert (= b_lambda!7191 (or (and b!182003 b_free!4489) b_lambda!7193)))

(declare-fun b_lambda!7195 () Bool)

(assert (= b_lambda!7189 (or (and b!182003 b_free!4489) b_lambda!7195)))

(check-sat (not d!54643) (not b!182241) (not b!182175) (not b!182296) (not d!54653) (not b!182315) (not b!182246) (not b!182245) (not d!54677) (not b!182180) (not d!54629) (not b!182182) (not b!182230) (not b!182328) (not d!54637) (not d!54635) (not d!54665) (not b!182237) (not b!182222) (not d!54639) (not b!182336) (not d!54645) (not bm!18391) (not b!182286) (not b!182327) (not b!182196) (not b!182337) (not b!182238) (not d!54681) (not d!54627) (not d!54663) (not d!54691) (not b_lambda!7187) (not d!54661) (not d!54647) (not b!182301) (not d!54651) (not b!182329) (not b!182242) (not bm!18394) (not b!182312) (not b!182226) (not d!54655) (not b!182314) (not b!182223) (not b!182249) b_and!11069 (not b!182297) (not d!54625) (not b!182272) tp_is_empty!4261 (not bm!18388) (not d!54675) (not d!54695) (not b!182194) (not b!182181) (not d!54631) (not d!54685) (not b!182339) (not d!54669) (not b!182335) (not d!54657) (not b!182229) (not b_lambda!7193) (not b!182228) (not bm!18385) (not b!182239) (not mapNonEmpty!7319) (not b!182224) (not d!54649) (not d!54689) (not b!182227) (not b!182173) (not b_lambda!7195) (not b_next!4489) (not b!182243) (not d!54659) (not b!182250) (not b!182256) (not d!54673) (not b!182362) (not d!54641) (not b!182184))
(check-sat b_and!11069 (not b_next!4489))
