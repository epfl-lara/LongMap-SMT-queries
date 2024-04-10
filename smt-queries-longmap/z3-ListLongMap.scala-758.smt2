; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17750 () Bool)

(assert start!17750)

(declare-fun b!177443 () Bool)

(declare-fun b_free!4389 () Bool)

(declare-fun b_next!4389 () Bool)

(assert (=> b!177443 (= b_free!4389 (not b_next!4389))))

(declare-fun tp!15869 () Bool)

(declare-fun b_and!10891 () Bool)

(assert (=> b!177443 (= tp!15869 b_and!10891)))

(declare-fun mapNonEmpty!7107 () Bool)

(declare-fun mapRes!7107 () Bool)

(declare-fun tp!15870 () Bool)

(declare-fun e!117016 () Bool)

(assert (=> mapNonEmpty!7107 (= mapRes!7107 (and tp!15870 e!117016))))

(declare-fun mapKey!7107 () (_ BitVec 32))

(declare-datatypes ((V!5195 0))(
  ( (V!5196 (val!2125 Int)) )
))
(declare-datatypes ((ValueCell!1737 0))(
  ( (ValueCellFull!1737 (v!4006 V!5195)) (EmptyCell!1737) )
))
(declare-fun mapRest!7107 () (Array (_ BitVec 32) ValueCell!1737))

(declare-fun mapValue!7107 () ValueCell!1737)

(declare-datatypes ((array!7475 0))(
  ( (array!7476 (arr!3545 (Array (_ BitVec 32) (_ BitVec 64))) (size!3849 (_ BitVec 32))) )
))
(declare-datatypes ((array!7477 0))(
  ( (array!7478 (arr!3546 (Array (_ BitVec 32) ValueCell!1737)) (size!3850 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2382 0))(
  ( (LongMapFixedSize!2383 (defaultEntry!3655 Int) (mask!8595 (_ BitVec 32)) (extraKeys!3392 (_ BitVec 32)) (zeroValue!3496 V!5195) (minValue!3496 V!5195) (_size!1240 (_ BitVec 32)) (_keys!5523 array!7475) (_values!3638 array!7477) (_vacant!1240 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2382)

(assert (=> mapNonEmpty!7107 (= (arr!3546 (_values!3638 thiss!1248)) (store mapRest!7107 mapKey!7107 mapValue!7107))))

(declare-fun b!177442 () Bool)

(declare-fun res!84107 () Bool)

(declare-fun e!117015 () Bool)

(assert (=> b!177442 (=> (not res!84107) (not e!117015))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3308 0))(
  ( (tuple2!3309 (_1!1665 (_ BitVec 64)) (_2!1665 V!5195)) )
))
(declare-datatypes ((List!2256 0))(
  ( (Nil!2253) (Cons!2252 (h!2873 tuple2!3308) (t!7088 List!2256)) )
))
(declare-datatypes ((ListLongMap!2235 0))(
  ( (ListLongMap!2236 (toList!1133 List!2256)) )
))
(declare-fun contains!1199 (ListLongMap!2235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!785 (array!7475 array!7477 (_ BitVec 32) (_ BitVec 32) V!5195 V!5195 (_ BitVec 32) Int) ListLongMap!2235)

(assert (=> b!177442 (= res!84107 (not (contains!1199 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)) key!828)))))

(declare-fun e!117013 () Bool)

(declare-fun e!117017 () Bool)

(declare-fun tp_is_empty!4161 () Bool)

(declare-fun array_inv!2275 (array!7475) Bool)

(declare-fun array_inv!2276 (array!7477) Bool)

(assert (=> b!177443 (= e!117017 (and tp!15869 tp_is_empty!4161 (array_inv!2275 (_keys!5523 thiss!1248)) (array_inv!2276 (_values!3638 thiss!1248)) e!117013))))

(declare-fun b!177444 () Bool)

(assert (=> b!177444 (= e!117015 (not (= (size!3850 (_values!3638 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8595 thiss!1248)))))))

(declare-fun b!177445 () Bool)

(declare-fun res!84106 () Bool)

(assert (=> b!177445 (=> (not res!84106) (not e!117015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!177445 (= res!84106 (validMask!0 (mask!8595 thiss!1248)))))

(declare-fun b!177446 () Bool)

(declare-fun res!84108 () Bool)

(assert (=> b!177446 (=> (not res!84108) (not e!117015))))

(assert (=> b!177446 (= res!84108 (not (= key!828 (bvneg key!828))))))

(declare-fun b!177447 () Bool)

(declare-fun res!84109 () Bool)

(assert (=> b!177447 (=> (not res!84109) (not e!117015))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!568 0))(
  ( (MissingZero!568 (index!4440 (_ BitVec 32))) (Found!568 (index!4441 (_ BitVec 32))) (Intermediate!568 (undefined!1380 Bool) (index!4442 (_ BitVec 32)) (x!19466 (_ BitVec 32))) (Undefined!568) (MissingVacant!568 (index!4443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7475 (_ BitVec 32)) SeekEntryResult!568)

(assert (=> b!177447 (= res!84109 ((_ is Undefined!568) (seekEntryOrOpen!0 key!828 (_keys!5523 thiss!1248) (mask!8595 thiss!1248))))))

(declare-fun mapIsEmpty!7107 () Bool)

(assert (=> mapIsEmpty!7107 mapRes!7107))

(declare-fun b!177448 () Bool)

(assert (=> b!177448 (= e!117016 tp_is_empty!4161)))

(declare-fun b!177449 () Bool)

(declare-fun e!117014 () Bool)

(assert (=> b!177449 (= e!117013 (and e!117014 mapRes!7107))))

(declare-fun condMapEmpty!7107 () Bool)

(declare-fun mapDefault!7107 () ValueCell!1737)

(assert (=> b!177449 (= condMapEmpty!7107 (= (arr!3546 (_values!3638 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1737)) mapDefault!7107)))))

(declare-fun res!84110 () Bool)

(assert (=> start!17750 (=> (not res!84110) (not e!117015))))

(declare-fun valid!998 (LongMapFixedSize!2382) Bool)

(assert (=> start!17750 (= res!84110 (valid!998 thiss!1248))))

(assert (=> start!17750 e!117015))

(assert (=> start!17750 e!117017))

(assert (=> start!17750 true))

(declare-fun b!177450 () Bool)

(assert (=> b!177450 (= e!117014 tp_is_empty!4161)))

(assert (= (and start!17750 res!84110) b!177446))

(assert (= (and b!177446 res!84108) b!177447))

(assert (= (and b!177447 res!84109) b!177442))

(assert (= (and b!177442 res!84107) b!177445))

(assert (= (and b!177445 res!84106) b!177444))

(assert (= (and b!177449 condMapEmpty!7107) mapIsEmpty!7107))

(assert (= (and b!177449 (not condMapEmpty!7107)) mapNonEmpty!7107))

(assert (= (and mapNonEmpty!7107 ((_ is ValueCellFull!1737) mapValue!7107)) b!177448))

(assert (= (and b!177449 ((_ is ValueCellFull!1737) mapDefault!7107)) b!177450))

(assert (= b!177443 b!177449))

(assert (= start!17750 b!177443))

(declare-fun m!205947 () Bool)

(assert (=> b!177447 m!205947))

(declare-fun m!205949 () Bool)

(assert (=> b!177442 m!205949))

(assert (=> b!177442 m!205949))

(declare-fun m!205951 () Bool)

(assert (=> b!177442 m!205951))

(declare-fun m!205953 () Bool)

(assert (=> start!17750 m!205953))

(declare-fun m!205955 () Bool)

(assert (=> b!177445 m!205955))

(declare-fun m!205957 () Bool)

(assert (=> b!177443 m!205957))

(declare-fun m!205959 () Bool)

(assert (=> b!177443 m!205959))

(declare-fun m!205961 () Bool)

(assert (=> mapNonEmpty!7107 m!205961))

(check-sat (not b!177445) (not start!17750) (not b!177442) b_and!10891 tp_is_empty!4161 (not mapNonEmpty!7107) (not b!177447) (not b_next!4389) (not b!177443))
(check-sat b_and!10891 (not b_next!4389))
(get-model)

(declare-fun d!53749 () Bool)

(declare-fun e!117041 () Bool)

(assert (=> d!53749 e!117041))

(declare-fun res!84128 () Bool)

(assert (=> d!53749 (=> res!84128 e!117041)))

(declare-fun lt!87681 () Bool)

(assert (=> d!53749 (= res!84128 (not lt!87681))))

(declare-fun lt!87682 () Bool)

(assert (=> d!53749 (= lt!87681 lt!87682)))

(declare-datatypes ((Unit!5424 0))(
  ( (Unit!5425) )
))
(declare-fun lt!87683 () Unit!5424)

(declare-fun e!117040 () Unit!5424)

(assert (=> d!53749 (= lt!87683 e!117040)))

(declare-fun c!31765 () Bool)

(assert (=> d!53749 (= c!31765 lt!87682)))

(declare-fun containsKey!200 (List!2256 (_ BitVec 64)) Bool)

(assert (=> d!53749 (= lt!87682 (containsKey!200 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))) key!828))))

(assert (=> d!53749 (= (contains!1199 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)) key!828) lt!87681)))

(declare-fun b!177484 () Bool)

(declare-fun lt!87684 () Unit!5424)

(assert (=> b!177484 (= e!117040 lt!87684)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!148 (List!2256 (_ BitVec 64)) Unit!5424)

(assert (=> b!177484 (= lt!87684 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))) key!828))))

(declare-datatypes ((Option!202 0))(
  ( (Some!201 (v!4008 V!5195)) (None!200) )
))
(declare-fun isDefined!149 (Option!202) Bool)

(declare-fun getValueByKey!196 (List!2256 (_ BitVec 64)) Option!202)

(assert (=> b!177484 (isDefined!149 (getValueByKey!196 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))) key!828))))

(declare-fun b!177485 () Bool)

(declare-fun Unit!5426 () Unit!5424)

(assert (=> b!177485 (= e!117040 Unit!5426)))

(declare-fun b!177486 () Bool)

(assert (=> b!177486 (= e!117041 (isDefined!149 (getValueByKey!196 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))) key!828)))))

(assert (= (and d!53749 c!31765) b!177484))

(assert (= (and d!53749 (not c!31765)) b!177485))

(assert (= (and d!53749 (not res!84128)) b!177486))

(declare-fun m!205979 () Bool)

(assert (=> d!53749 m!205979))

(declare-fun m!205981 () Bool)

(assert (=> b!177484 m!205981))

(declare-fun m!205983 () Bool)

(assert (=> b!177484 m!205983))

(assert (=> b!177484 m!205983))

(declare-fun m!205985 () Bool)

(assert (=> b!177484 m!205985))

(assert (=> b!177486 m!205983))

(assert (=> b!177486 m!205983))

(assert (=> b!177486 m!205985))

(assert (=> b!177442 d!53749))

(declare-fun call!17959 () ListLongMap!2235)

(declare-fun call!17960 () ListLongMap!2235)

(declare-fun c!31781 () Bool)

(declare-fun call!17964 () ListLongMap!2235)

(declare-fun c!31778 () Bool)

(declare-fun bm!17956 () Bool)

(declare-fun call!17962 () ListLongMap!2235)

(declare-fun +!258 (ListLongMap!2235 tuple2!3308) ListLongMap!2235)

(assert (=> bm!17956 (= call!17959 (+!258 (ite c!31781 call!17962 (ite c!31778 call!17960 call!17964)) (ite (or c!31781 c!31778) (tuple2!3309 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3496 thiss!1248)) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248)))))))

(declare-fun b!177529 () Bool)

(declare-fun e!117076 () Bool)

(declare-fun lt!87730 () ListLongMap!2235)

(declare-fun apply!141 (ListLongMap!2235 (_ BitVec 64)) V!5195)

(declare-fun get!2020 (ValueCell!1737 V!5195) V!5195)

(declare-fun dynLambda!484 (Int (_ BitVec 64)) V!5195)

(assert (=> b!177529 (= e!117076 (= (apply!141 lt!87730 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)) (get!2020 (select (arr!3546 (_values!3638 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3655 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3850 (_values!3638 thiss!1248))))))

(assert (=> b!177529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))))))

(declare-fun bm!17957 () Bool)

(declare-fun call!17965 () Bool)

(assert (=> bm!17957 (= call!17965 (contains!1199 lt!87730 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177530 () Bool)

(declare-fun e!117074 () Bool)

(declare-fun e!117069 () Bool)

(assert (=> b!177530 (= e!117074 e!117069)))

(declare-fun c!31780 () Bool)

(assert (=> b!177530 (= c!31780 (not (= (bvand (extraKeys!3392 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177531 () Bool)

(declare-fun e!117068 () Bool)

(declare-fun e!117073 () Bool)

(assert (=> b!177531 (= e!117068 e!117073)))

(declare-fun res!84155 () Bool)

(declare-fun call!17961 () Bool)

(assert (=> b!177531 (= res!84155 call!17961)))

(assert (=> b!177531 (=> (not res!84155) (not e!117073))))

(declare-fun b!177532 () Bool)

(declare-fun res!84153 () Bool)

(assert (=> b!177532 (=> (not res!84153) (not e!117074))))

(assert (=> b!177532 (= res!84153 e!117068)))

(declare-fun c!31782 () Bool)

(assert (=> b!177532 (= c!31782 (not (= (bvand (extraKeys!3392 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!177533 () Bool)

(declare-fun e!117077 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!177533 (= e!117077 (validKeyInArray!0 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17958 () Bool)

(declare-fun call!17963 () ListLongMap!2235)

(assert (=> bm!17958 (= call!17963 call!17959)))

(declare-fun b!177534 () Bool)

(declare-fun res!84151 () Bool)

(assert (=> b!177534 (=> (not res!84151) (not e!117074))))

(declare-fun e!117070 () Bool)

(assert (=> b!177534 (= res!84151 e!117070)))

(declare-fun res!84150 () Bool)

(assert (=> b!177534 (=> res!84150 e!117070)))

(assert (=> b!177534 (= res!84150 (not e!117077))))

(declare-fun res!84149 () Bool)

(assert (=> b!177534 (=> (not res!84149) (not e!117077))))

(assert (=> b!177534 (= res!84149 (bvslt #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))))))

(declare-fun b!177535 () Bool)

(declare-fun e!117075 () Bool)

(assert (=> b!177535 (= e!117069 e!117075)))

(declare-fun res!84147 () Bool)

(assert (=> b!177535 (= res!84147 call!17965)))

(assert (=> b!177535 (=> (not res!84147) (not e!117075))))

(declare-fun b!177536 () Bool)

(assert (=> b!177536 (= e!117068 (not call!17961))))

(declare-fun b!177537 () Bool)

(declare-fun e!117079 () Unit!5424)

(declare-fun Unit!5427 () Unit!5424)

(assert (=> b!177537 (= e!117079 Unit!5427)))

(declare-fun b!177538 () Bool)

(declare-fun c!31783 () Bool)

(assert (=> b!177538 (= c!31783 (and (not (= (bvand (extraKeys!3392 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3392 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!117080 () ListLongMap!2235)

(declare-fun e!117071 () ListLongMap!2235)

(assert (=> b!177538 (= e!117080 e!117071)))

(declare-fun b!177539 () Bool)

(assert (=> b!177539 (= e!117069 (not call!17965))))

(declare-fun b!177541 () Bool)

(declare-fun e!117078 () Bool)

(assert (=> b!177541 (= e!117078 (validKeyInArray!0 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177542 () Bool)

(assert (=> b!177542 (= e!117080 call!17963)))

(declare-fun b!177543 () Bool)

(declare-fun e!117072 () ListLongMap!2235)

(assert (=> b!177543 (= e!117072 (+!258 call!17959 (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248))))))

(declare-fun b!177544 () Bool)

(assert (=> b!177544 (= e!117075 (= (apply!141 lt!87730 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3496 thiss!1248)))))

(declare-fun b!177545 () Bool)

(assert (=> b!177545 (= e!117071 call!17963)))

(declare-fun bm!17959 () Bool)

(assert (=> bm!17959 (= call!17961 (contains!1199 lt!87730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177546 () Bool)

(declare-fun lt!87744 () Unit!5424)

(assert (=> b!177546 (= e!117079 lt!87744)))

(declare-fun lt!87736 () ListLongMap!2235)

(declare-fun getCurrentListMapNoExtraKeys!174 (array!7475 array!7477 (_ BitVec 32) (_ BitVec 32) V!5195 V!5195 (_ BitVec 32) Int) ListLongMap!2235)

(assert (=> b!177546 (= lt!87736 (getCurrentListMapNoExtraKeys!174 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)))))

(declare-fun lt!87734 () (_ BitVec 64))

(assert (=> b!177546 (= lt!87734 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87732 () (_ BitVec 64))

(assert (=> b!177546 (= lt!87732 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87747 () Unit!5424)

(declare-fun addStillContains!117 (ListLongMap!2235 (_ BitVec 64) V!5195 (_ BitVec 64)) Unit!5424)

(assert (=> b!177546 (= lt!87747 (addStillContains!117 lt!87736 lt!87734 (zeroValue!3496 thiss!1248) lt!87732))))

(assert (=> b!177546 (contains!1199 (+!258 lt!87736 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248))) lt!87732)))

(declare-fun lt!87731 () Unit!5424)

(assert (=> b!177546 (= lt!87731 lt!87747)))

(declare-fun lt!87733 () ListLongMap!2235)

(assert (=> b!177546 (= lt!87733 (getCurrentListMapNoExtraKeys!174 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)))))

(declare-fun lt!87737 () (_ BitVec 64))

(assert (=> b!177546 (= lt!87737 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87739 () (_ BitVec 64))

(assert (=> b!177546 (= lt!87739 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87745 () Unit!5424)

(declare-fun addApplyDifferent!117 (ListLongMap!2235 (_ BitVec 64) V!5195 (_ BitVec 64)) Unit!5424)

(assert (=> b!177546 (= lt!87745 (addApplyDifferent!117 lt!87733 lt!87737 (minValue!3496 thiss!1248) lt!87739))))

(assert (=> b!177546 (= (apply!141 (+!258 lt!87733 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248))) lt!87739) (apply!141 lt!87733 lt!87739))))

(declare-fun lt!87746 () Unit!5424)

(assert (=> b!177546 (= lt!87746 lt!87745)))

(declare-fun lt!87729 () ListLongMap!2235)

(assert (=> b!177546 (= lt!87729 (getCurrentListMapNoExtraKeys!174 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)))))

(declare-fun lt!87738 () (_ BitVec 64))

(assert (=> b!177546 (= lt!87738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87749 () (_ BitVec 64))

(assert (=> b!177546 (= lt!87749 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87743 () Unit!5424)

(assert (=> b!177546 (= lt!87743 (addApplyDifferent!117 lt!87729 lt!87738 (zeroValue!3496 thiss!1248) lt!87749))))

(assert (=> b!177546 (= (apply!141 (+!258 lt!87729 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248))) lt!87749) (apply!141 lt!87729 lt!87749))))

(declare-fun lt!87740 () Unit!5424)

(assert (=> b!177546 (= lt!87740 lt!87743)))

(declare-fun lt!87748 () ListLongMap!2235)

(assert (=> b!177546 (= lt!87748 (getCurrentListMapNoExtraKeys!174 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)))))

(declare-fun lt!87741 () (_ BitVec 64))

(assert (=> b!177546 (= lt!87741 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87742 () (_ BitVec 64))

(assert (=> b!177546 (= lt!87742 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177546 (= lt!87744 (addApplyDifferent!117 lt!87748 lt!87741 (minValue!3496 thiss!1248) lt!87742))))

(assert (=> b!177546 (= (apply!141 (+!258 lt!87748 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248))) lt!87742) (apply!141 lt!87748 lt!87742))))

(declare-fun bm!17960 () Bool)

(assert (=> bm!17960 (= call!17960 call!17962)))

(declare-fun b!177547 () Bool)

(assert (=> b!177547 (= e!117072 e!117080)))

(assert (=> b!177547 (= c!31778 (and (not (= (bvand (extraKeys!3392 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3392 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177548 () Bool)

(assert (=> b!177548 (= e!117070 e!117076)))

(declare-fun res!84154 () Bool)

(assert (=> b!177548 (=> (not res!84154) (not e!117076))))

(assert (=> b!177548 (= res!84154 (contains!1199 lt!87730 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177548 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))))))

(declare-fun bm!17961 () Bool)

(assert (=> bm!17961 (= call!17962 (getCurrentListMapNoExtraKeys!174 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)))))

(declare-fun b!177540 () Bool)

(assert (=> b!177540 (= e!117071 call!17964)))

(declare-fun d!53751 () Bool)

(assert (=> d!53751 e!117074))

(declare-fun res!84152 () Bool)

(assert (=> d!53751 (=> (not res!84152) (not e!117074))))

(assert (=> d!53751 (= res!84152 (or (bvsge #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))))))))

(declare-fun lt!87750 () ListLongMap!2235)

(assert (=> d!53751 (= lt!87730 lt!87750)))

(declare-fun lt!87735 () Unit!5424)

(assert (=> d!53751 (= lt!87735 e!117079)))

(declare-fun c!31779 () Bool)

(assert (=> d!53751 (= c!31779 e!117078)))

(declare-fun res!84148 () Bool)

(assert (=> d!53751 (=> (not res!84148) (not e!117078))))

(assert (=> d!53751 (= res!84148 (bvslt #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))))))

(assert (=> d!53751 (= lt!87750 e!117072)))

(assert (=> d!53751 (= c!31781 (and (not (= (bvand (extraKeys!3392 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3392 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53751 (validMask!0 (mask!8595 thiss!1248))))

(assert (=> d!53751 (= (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)) lt!87730)))

(declare-fun bm!17962 () Bool)

(assert (=> bm!17962 (= call!17964 call!17960)))

(declare-fun b!177549 () Bool)

(assert (=> b!177549 (= e!117073 (= (apply!141 lt!87730 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3496 thiss!1248)))))

(assert (= (and d!53751 c!31781) b!177543))

(assert (= (and d!53751 (not c!31781)) b!177547))

(assert (= (and b!177547 c!31778) b!177542))

(assert (= (and b!177547 (not c!31778)) b!177538))

(assert (= (and b!177538 c!31783) b!177545))

(assert (= (and b!177538 (not c!31783)) b!177540))

(assert (= (or b!177545 b!177540) bm!17962))

(assert (= (or b!177542 bm!17962) bm!17960))

(assert (= (or b!177542 b!177545) bm!17958))

(assert (= (or b!177543 bm!17960) bm!17961))

(assert (= (or b!177543 bm!17958) bm!17956))

(assert (= (and d!53751 res!84148) b!177541))

(assert (= (and d!53751 c!31779) b!177546))

(assert (= (and d!53751 (not c!31779)) b!177537))

(assert (= (and d!53751 res!84152) b!177534))

(assert (= (and b!177534 res!84149) b!177533))

(assert (= (and b!177534 (not res!84150)) b!177548))

(assert (= (and b!177548 res!84154) b!177529))

(assert (= (and b!177534 res!84151) b!177532))

(assert (= (and b!177532 c!31782) b!177531))

(assert (= (and b!177532 (not c!31782)) b!177536))

(assert (= (and b!177531 res!84155) b!177549))

(assert (= (or b!177531 b!177536) bm!17959))

(assert (= (and b!177532 res!84153) b!177530))

(assert (= (and b!177530 c!31780) b!177535))

(assert (= (and b!177530 (not c!31780)) b!177539))

(assert (= (and b!177535 res!84147) b!177544))

(assert (= (or b!177535 b!177539) bm!17957))

(declare-fun b_lambda!7055 () Bool)

(assert (=> (not b_lambda!7055) (not b!177529)))

(declare-fun t!7090 () Bool)

(declare-fun tb!2793 () Bool)

(assert (=> (and b!177443 (= (defaultEntry!3655 thiss!1248) (defaultEntry!3655 thiss!1248)) t!7090) tb!2793))

(declare-fun result!4653 () Bool)

(assert (=> tb!2793 (= result!4653 tp_is_empty!4161)))

(assert (=> b!177529 t!7090))

(declare-fun b_and!10895 () Bool)

(assert (= b_and!10891 (and (=> t!7090 result!4653) b_and!10895)))

(declare-fun m!205987 () Bool)

(assert (=> bm!17957 m!205987))

(assert (=> d!53751 m!205955))

(declare-fun m!205989 () Bool)

(assert (=> b!177544 m!205989))

(declare-fun m!205991 () Bool)

(assert (=> b!177546 m!205991))

(declare-fun m!205993 () Bool)

(assert (=> b!177546 m!205993))

(declare-fun m!205995 () Bool)

(assert (=> b!177546 m!205995))

(declare-fun m!205997 () Bool)

(assert (=> b!177546 m!205997))

(declare-fun m!205999 () Bool)

(assert (=> b!177546 m!205999))

(declare-fun m!206001 () Bool)

(assert (=> b!177546 m!206001))

(declare-fun m!206003 () Bool)

(assert (=> b!177546 m!206003))

(declare-fun m!206005 () Bool)

(assert (=> b!177546 m!206005))

(assert (=> b!177546 m!206001))

(assert (=> b!177546 m!205995))

(declare-fun m!206007 () Bool)

(assert (=> b!177546 m!206007))

(declare-fun m!206009 () Bool)

(assert (=> b!177546 m!206009))

(declare-fun m!206011 () Bool)

(assert (=> b!177546 m!206011))

(assert (=> b!177546 m!206011))

(declare-fun m!206013 () Bool)

(assert (=> b!177546 m!206013))

(declare-fun m!206015 () Bool)

(assert (=> b!177546 m!206015))

(assert (=> b!177546 m!205993))

(declare-fun m!206017 () Bool)

(assert (=> b!177546 m!206017))

(declare-fun m!206019 () Bool)

(assert (=> b!177546 m!206019))

(declare-fun m!206021 () Bool)

(assert (=> b!177546 m!206021))

(declare-fun m!206023 () Bool)

(assert (=> b!177546 m!206023))

(declare-fun m!206025 () Bool)

(assert (=> b!177549 m!206025))

(assert (=> b!177529 m!205997))

(declare-fun m!206027 () Bool)

(assert (=> b!177529 m!206027))

(assert (=> b!177529 m!205997))

(declare-fun m!206029 () Bool)

(assert (=> b!177529 m!206029))

(declare-fun m!206031 () Bool)

(assert (=> b!177529 m!206031))

(assert (=> b!177529 m!206029))

(assert (=> b!177529 m!206031))

(declare-fun m!206033 () Bool)

(assert (=> b!177529 m!206033))

(declare-fun m!206035 () Bool)

(assert (=> bm!17959 m!206035))

(assert (=> bm!17961 m!206015))

(declare-fun m!206037 () Bool)

(assert (=> b!177543 m!206037))

(assert (=> b!177548 m!205997))

(assert (=> b!177548 m!205997))

(declare-fun m!206039 () Bool)

(assert (=> b!177548 m!206039))

(assert (=> b!177541 m!205997))

(assert (=> b!177541 m!205997))

(declare-fun m!206041 () Bool)

(assert (=> b!177541 m!206041))

(assert (=> b!177533 m!205997))

(assert (=> b!177533 m!205997))

(assert (=> b!177533 m!206041))

(declare-fun m!206043 () Bool)

(assert (=> bm!17956 m!206043))

(assert (=> b!177442 d!53751))

(declare-fun lt!87758 () SeekEntryResult!568)

(declare-fun b!177564 () Bool)

(declare-fun e!117089 () SeekEntryResult!568)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7475 (_ BitVec 32)) SeekEntryResult!568)

(assert (=> b!177564 (= e!117089 (seekKeyOrZeroReturnVacant!0 (x!19466 lt!87758) (index!4442 lt!87758) (index!4442 lt!87758) key!828 (_keys!5523 thiss!1248) (mask!8595 thiss!1248)))))

(declare-fun b!177565 () Bool)

(declare-fun c!31792 () Bool)

(declare-fun lt!87757 () (_ BitVec 64))

(assert (=> b!177565 (= c!31792 (= lt!87757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117087 () SeekEntryResult!568)

(assert (=> b!177565 (= e!117087 e!117089)))

(declare-fun b!177566 () Bool)

(declare-fun e!117088 () SeekEntryResult!568)

(assert (=> b!177566 (= e!117088 Undefined!568)))

(declare-fun b!177567 () Bool)

(assert (=> b!177567 (= e!117088 e!117087)))

(assert (=> b!177567 (= lt!87757 (select (arr!3545 (_keys!5523 thiss!1248)) (index!4442 lt!87758)))))

(declare-fun c!31791 () Bool)

(assert (=> b!177567 (= c!31791 (= lt!87757 key!828))))

(declare-fun b!177568 () Bool)

(assert (=> b!177568 (= e!117087 (Found!568 (index!4442 lt!87758)))))

(declare-fun d!53753 () Bool)

(declare-fun lt!87759 () SeekEntryResult!568)

(assert (=> d!53753 (and (or ((_ is Undefined!568) lt!87759) (not ((_ is Found!568) lt!87759)) (and (bvsge (index!4441 lt!87759) #b00000000000000000000000000000000) (bvslt (index!4441 lt!87759) (size!3849 (_keys!5523 thiss!1248))))) (or ((_ is Undefined!568) lt!87759) ((_ is Found!568) lt!87759) (not ((_ is MissingZero!568) lt!87759)) (and (bvsge (index!4440 lt!87759) #b00000000000000000000000000000000) (bvslt (index!4440 lt!87759) (size!3849 (_keys!5523 thiss!1248))))) (or ((_ is Undefined!568) lt!87759) ((_ is Found!568) lt!87759) ((_ is MissingZero!568) lt!87759) (not ((_ is MissingVacant!568) lt!87759)) (and (bvsge (index!4443 lt!87759) #b00000000000000000000000000000000) (bvslt (index!4443 lt!87759) (size!3849 (_keys!5523 thiss!1248))))) (or ((_ is Undefined!568) lt!87759) (ite ((_ is Found!568) lt!87759) (= (select (arr!3545 (_keys!5523 thiss!1248)) (index!4441 lt!87759)) key!828) (ite ((_ is MissingZero!568) lt!87759) (= (select (arr!3545 (_keys!5523 thiss!1248)) (index!4440 lt!87759)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!568) lt!87759) (= (select (arr!3545 (_keys!5523 thiss!1248)) (index!4443 lt!87759)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53753 (= lt!87759 e!117088)))

(declare-fun c!31790 () Bool)

(assert (=> d!53753 (= c!31790 (and ((_ is Intermediate!568) lt!87758) (undefined!1380 lt!87758)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7475 (_ BitVec 32)) SeekEntryResult!568)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53753 (= lt!87758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8595 thiss!1248)) key!828 (_keys!5523 thiss!1248) (mask!8595 thiss!1248)))))

(assert (=> d!53753 (validMask!0 (mask!8595 thiss!1248))))

(assert (=> d!53753 (= (seekEntryOrOpen!0 key!828 (_keys!5523 thiss!1248) (mask!8595 thiss!1248)) lt!87759)))

(declare-fun b!177569 () Bool)

(assert (=> b!177569 (= e!117089 (MissingZero!568 (index!4442 lt!87758)))))

(assert (= (and d!53753 c!31790) b!177566))

(assert (= (and d!53753 (not c!31790)) b!177567))

(assert (= (and b!177567 c!31791) b!177568))

(assert (= (and b!177567 (not c!31791)) b!177565))

(assert (= (and b!177565 c!31792) b!177569))

(assert (= (and b!177565 (not c!31792)) b!177564))

(declare-fun m!206045 () Bool)

(assert (=> b!177564 m!206045))

(declare-fun m!206047 () Bool)

(assert (=> b!177567 m!206047))

(declare-fun m!206049 () Bool)

(assert (=> d!53753 m!206049))

(declare-fun m!206051 () Bool)

(assert (=> d!53753 m!206051))

(declare-fun m!206053 () Bool)

(assert (=> d!53753 m!206053))

(assert (=> d!53753 m!206051))

(declare-fun m!206055 () Bool)

(assert (=> d!53753 m!206055))

(declare-fun m!206057 () Bool)

(assert (=> d!53753 m!206057))

(assert (=> d!53753 m!205955))

(assert (=> b!177447 d!53753))

(declare-fun d!53755 () Bool)

(assert (=> d!53755 (= (array_inv!2275 (_keys!5523 thiss!1248)) (bvsge (size!3849 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177443 d!53755))

(declare-fun d!53757 () Bool)

(assert (=> d!53757 (= (array_inv!2276 (_values!3638 thiss!1248)) (bvsge (size!3850 (_values!3638 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177443 d!53757))

(declare-fun d!53759 () Bool)

(declare-fun res!84162 () Bool)

(declare-fun e!117092 () Bool)

(assert (=> d!53759 (=> (not res!84162) (not e!117092))))

(declare-fun simpleValid!155 (LongMapFixedSize!2382) Bool)

(assert (=> d!53759 (= res!84162 (simpleValid!155 thiss!1248))))

(assert (=> d!53759 (= (valid!998 thiss!1248) e!117092)))

(declare-fun b!177576 () Bool)

(declare-fun res!84163 () Bool)

(assert (=> b!177576 (=> (not res!84163) (not e!117092))))

(declare-fun arrayCountValidKeys!0 (array!7475 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177576 (= res!84163 (= (arrayCountValidKeys!0 (_keys!5523 thiss!1248) #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))) (_size!1240 thiss!1248)))))

(declare-fun b!177577 () Bool)

(declare-fun res!84164 () Bool)

(assert (=> b!177577 (=> (not res!84164) (not e!117092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7475 (_ BitVec 32)) Bool)

(assert (=> b!177577 (= res!84164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5523 thiss!1248) (mask!8595 thiss!1248)))))

(declare-fun b!177578 () Bool)

(declare-datatypes ((List!2257 0))(
  ( (Nil!2254) (Cons!2253 (h!2874 (_ BitVec 64)) (t!7091 List!2257)) )
))
(declare-fun arrayNoDuplicates!0 (array!7475 (_ BitVec 32) List!2257) Bool)

(assert (=> b!177578 (= e!117092 (arrayNoDuplicates!0 (_keys!5523 thiss!1248) #b00000000000000000000000000000000 Nil!2254))))

(assert (= (and d!53759 res!84162) b!177576))

(assert (= (and b!177576 res!84163) b!177577))

(assert (= (and b!177577 res!84164) b!177578))

(declare-fun m!206059 () Bool)

(assert (=> d!53759 m!206059))

(declare-fun m!206061 () Bool)

(assert (=> b!177576 m!206061))

(declare-fun m!206063 () Bool)

(assert (=> b!177577 m!206063))

(declare-fun m!206065 () Bool)

(assert (=> b!177578 m!206065))

(assert (=> start!17750 d!53759))

(declare-fun d!53761 () Bool)

(assert (=> d!53761 (= (validMask!0 (mask!8595 thiss!1248)) (and (or (= (mask!8595 thiss!1248) #b00000000000000000000000000000111) (= (mask!8595 thiss!1248) #b00000000000000000000000000001111) (= (mask!8595 thiss!1248) #b00000000000000000000000000011111) (= (mask!8595 thiss!1248) #b00000000000000000000000000111111) (= (mask!8595 thiss!1248) #b00000000000000000000000001111111) (= (mask!8595 thiss!1248) #b00000000000000000000000011111111) (= (mask!8595 thiss!1248) #b00000000000000000000000111111111) (= (mask!8595 thiss!1248) #b00000000000000000000001111111111) (= (mask!8595 thiss!1248) #b00000000000000000000011111111111) (= (mask!8595 thiss!1248) #b00000000000000000000111111111111) (= (mask!8595 thiss!1248) #b00000000000000000001111111111111) (= (mask!8595 thiss!1248) #b00000000000000000011111111111111) (= (mask!8595 thiss!1248) #b00000000000000000111111111111111) (= (mask!8595 thiss!1248) #b00000000000000001111111111111111) (= (mask!8595 thiss!1248) #b00000000000000011111111111111111) (= (mask!8595 thiss!1248) #b00000000000000111111111111111111) (= (mask!8595 thiss!1248) #b00000000000001111111111111111111) (= (mask!8595 thiss!1248) #b00000000000011111111111111111111) (= (mask!8595 thiss!1248) #b00000000000111111111111111111111) (= (mask!8595 thiss!1248) #b00000000001111111111111111111111) (= (mask!8595 thiss!1248) #b00000000011111111111111111111111) (= (mask!8595 thiss!1248) #b00000000111111111111111111111111) (= (mask!8595 thiss!1248) #b00000001111111111111111111111111) (= (mask!8595 thiss!1248) #b00000011111111111111111111111111) (= (mask!8595 thiss!1248) #b00000111111111111111111111111111) (= (mask!8595 thiss!1248) #b00001111111111111111111111111111) (= (mask!8595 thiss!1248) #b00011111111111111111111111111111) (= (mask!8595 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8595 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!177445 d!53761))

(declare-fun b!177585 () Bool)

(declare-fun e!117097 () Bool)

(assert (=> b!177585 (= e!117097 tp_is_empty!4161)))

(declare-fun b!177586 () Bool)

(declare-fun e!117098 () Bool)

(assert (=> b!177586 (= e!117098 tp_is_empty!4161)))

(declare-fun mapNonEmpty!7113 () Bool)

(declare-fun mapRes!7113 () Bool)

(declare-fun tp!15879 () Bool)

(assert (=> mapNonEmpty!7113 (= mapRes!7113 (and tp!15879 e!117097))))

(declare-fun mapRest!7113 () (Array (_ BitVec 32) ValueCell!1737))

(declare-fun mapValue!7113 () ValueCell!1737)

(declare-fun mapKey!7113 () (_ BitVec 32))

(assert (=> mapNonEmpty!7113 (= mapRest!7107 (store mapRest!7113 mapKey!7113 mapValue!7113))))

(declare-fun mapIsEmpty!7113 () Bool)

(assert (=> mapIsEmpty!7113 mapRes!7113))

(declare-fun condMapEmpty!7113 () Bool)

(declare-fun mapDefault!7113 () ValueCell!1737)

(assert (=> mapNonEmpty!7107 (= condMapEmpty!7113 (= mapRest!7107 ((as const (Array (_ BitVec 32) ValueCell!1737)) mapDefault!7113)))))

(assert (=> mapNonEmpty!7107 (= tp!15870 (and e!117098 mapRes!7113))))

(assert (= (and mapNonEmpty!7107 condMapEmpty!7113) mapIsEmpty!7113))

(assert (= (and mapNonEmpty!7107 (not condMapEmpty!7113)) mapNonEmpty!7113))

(assert (= (and mapNonEmpty!7113 ((_ is ValueCellFull!1737) mapValue!7113)) b!177585))

(assert (= (and mapNonEmpty!7107 ((_ is ValueCellFull!1737) mapDefault!7113)) b!177586))

(declare-fun m!206067 () Bool)

(assert (=> mapNonEmpty!7113 m!206067))

(declare-fun b_lambda!7057 () Bool)

(assert (= b_lambda!7055 (or (and b!177443 b_free!4389) b_lambda!7057)))

(check-sat (not b!177564) (not b!177533) (not b!177549) (not b!177577) (not b_lambda!7057) (not b!177576) (not b_next!4389) (not mapNonEmpty!7113) tp_is_empty!4161 (not b!177486) (not b!177484) (not b!177548) (not bm!17959) (not d!53759) (not bm!17957) (not b!177543) (not b!177578) b_and!10895 (not d!53749) (not b!177529) (not b!177541) (not d!53753) (not d!53751) (not bm!17961) (not b!177546) (not bm!17956) (not b!177544))
(check-sat b_and!10895 (not b_next!4389))
(get-model)

(declare-fun d!53763 () Bool)

(declare-fun e!117101 () Bool)

(assert (=> d!53763 e!117101))

(declare-fun res!84170 () Bool)

(assert (=> d!53763 (=> (not res!84170) (not e!117101))))

(declare-fun lt!87771 () ListLongMap!2235)

(assert (=> d!53763 (= res!84170 (contains!1199 lt!87771 (_1!1665 (ite (or c!31781 c!31778) (tuple2!3309 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3496 thiss!1248)) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248))))))))

(declare-fun lt!87769 () List!2256)

(assert (=> d!53763 (= lt!87771 (ListLongMap!2236 lt!87769))))

(declare-fun lt!87768 () Unit!5424)

(declare-fun lt!87770 () Unit!5424)

(assert (=> d!53763 (= lt!87768 lt!87770)))

(assert (=> d!53763 (= (getValueByKey!196 lt!87769 (_1!1665 (ite (or c!31781 c!31778) (tuple2!3309 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3496 thiss!1248)) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248))))) (Some!201 (_2!1665 (ite (or c!31781 c!31778) (tuple2!3309 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3496 thiss!1248)) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!103 (List!2256 (_ BitVec 64) V!5195) Unit!5424)

(assert (=> d!53763 (= lt!87770 (lemmaContainsTupThenGetReturnValue!103 lt!87769 (_1!1665 (ite (or c!31781 c!31778) (tuple2!3309 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3496 thiss!1248)) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248)))) (_2!1665 (ite (or c!31781 c!31778) (tuple2!3309 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3496 thiss!1248)) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248))))))))

(declare-fun insertStrictlySorted!106 (List!2256 (_ BitVec 64) V!5195) List!2256)

(assert (=> d!53763 (= lt!87769 (insertStrictlySorted!106 (toList!1133 (ite c!31781 call!17962 (ite c!31778 call!17960 call!17964))) (_1!1665 (ite (or c!31781 c!31778) (tuple2!3309 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3496 thiss!1248)) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248)))) (_2!1665 (ite (or c!31781 c!31778) (tuple2!3309 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3496 thiss!1248)) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248))))))))

(assert (=> d!53763 (= (+!258 (ite c!31781 call!17962 (ite c!31778 call!17960 call!17964)) (ite (or c!31781 c!31778) (tuple2!3309 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3496 thiss!1248)) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248)))) lt!87771)))

(declare-fun b!177591 () Bool)

(declare-fun res!84169 () Bool)

(assert (=> b!177591 (=> (not res!84169) (not e!117101))))

(assert (=> b!177591 (= res!84169 (= (getValueByKey!196 (toList!1133 lt!87771) (_1!1665 (ite (or c!31781 c!31778) (tuple2!3309 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3496 thiss!1248)) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248))))) (Some!201 (_2!1665 (ite (or c!31781 c!31778) (tuple2!3309 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3496 thiss!1248)) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248)))))))))

(declare-fun b!177592 () Bool)

(declare-fun contains!1200 (List!2256 tuple2!3308) Bool)

(assert (=> b!177592 (= e!117101 (contains!1200 (toList!1133 lt!87771) (ite (or c!31781 c!31778) (tuple2!3309 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3496 thiss!1248)) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248)))))))

(assert (= (and d!53763 res!84170) b!177591))

(assert (= (and b!177591 res!84169) b!177592))

(declare-fun m!206069 () Bool)

(assert (=> d!53763 m!206069))

(declare-fun m!206071 () Bool)

(assert (=> d!53763 m!206071))

(declare-fun m!206073 () Bool)

(assert (=> d!53763 m!206073))

(declare-fun m!206075 () Bool)

(assert (=> d!53763 m!206075))

(declare-fun m!206077 () Bool)

(assert (=> b!177591 m!206077))

(declare-fun m!206079 () Bool)

(assert (=> b!177592 m!206079))

(assert (=> bm!17956 d!53763))

(declare-fun b!177618 () Bool)

(assert (=> b!177618 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))))))

(assert (=> b!177618 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3850 (_values!3638 thiss!1248))))))

(declare-fun e!117116 () Bool)

(declare-fun lt!87789 () ListLongMap!2235)

(assert (=> b!177618 (= e!117116 (= (apply!141 lt!87789 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)) (get!2020 (select (arr!3546 (_values!3638 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3655 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!177619 () Bool)

(declare-fun e!117117 () ListLongMap!2235)

(declare-fun e!117119 () ListLongMap!2235)

(assert (=> b!177619 (= e!117117 e!117119)))

(declare-fun c!31804 () Bool)

(assert (=> b!177619 (= c!31804 (validKeyInArray!0 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177620 () Bool)

(declare-fun e!117118 () Bool)

(assert (=> b!177620 (= e!117118 e!117116)))

(assert (=> b!177620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))))))

(declare-fun res!84180 () Bool)

(assert (=> b!177620 (= res!84180 (contains!1199 lt!87789 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177620 (=> (not res!84180) (not e!117116))))

(declare-fun b!177621 () Bool)

(declare-fun res!84179 () Bool)

(declare-fun e!117120 () Bool)

(assert (=> b!177621 (=> (not res!84179) (not e!117120))))

(assert (=> b!177621 (= res!84179 (not (contains!1199 lt!87789 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177622 () Bool)

(declare-fun e!117121 () Bool)

(declare-fun isEmpty!447 (ListLongMap!2235) Bool)

(assert (=> b!177622 (= e!117121 (isEmpty!447 lt!87789))))

(declare-fun b!177623 () Bool)

(assert (=> b!177623 (= e!117121 (= lt!87789 (getCurrentListMapNoExtraKeys!174 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3655 thiss!1248))))))

(declare-fun b!177624 () Bool)

(declare-fun e!117122 () Bool)

(assert (=> b!177624 (= e!117122 (validKeyInArray!0 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177624 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!177625 () Bool)

(declare-fun call!17968 () ListLongMap!2235)

(assert (=> b!177625 (= e!117119 call!17968)))

(declare-fun b!177626 () Bool)

(assert (=> b!177626 (= e!117118 e!117121)))

(declare-fun c!31801 () Bool)

(assert (=> b!177626 (= c!31801 (bvslt #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))))))

(declare-fun bm!17965 () Bool)

(assert (=> bm!17965 (= call!17968 (getCurrentListMapNoExtraKeys!174 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3655 thiss!1248)))))

(declare-fun b!177627 () Bool)

(declare-fun lt!87790 () Unit!5424)

(declare-fun lt!87787 () Unit!5424)

(assert (=> b!177627 (= lt!87790 lt!87787)))

(declare-fun lt!87788 () (_ BitVec 64))

(declare-fun lt!87791 () ListLongMap!2235)

(declare-fun lt!87792 () V!5195)

(declare-fun lt!87786 () (_ BitVec 64))

(assert (=> b!177627 (not (contains!1199 (+!258 lt!87791 (tuple2!3309 lt!87786 lt!87792)) lt!87788))))

(declare-fun addStillNotContains!77 (ListLongMap!2235 (_ BitVec 64) V!5195 (_ BitVec 64)) Unit!5424)

(assert (=> b!177627 (= lt!87787 (addStillNotContains!77 lt!87791 lt!87786 lt!87792 lt!87788))))

(assert (=> b!177627 (= lt!87788 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!177627 (= lt!87792 (get!2020 (select (arr!3546 (_values!3638 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3655 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177627 (= lt!87786 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177627 (= lt!87791 call!17968)))

(assert (=> b!177627 (= e!117119 (+!258 call!17968 (tuple2!3309 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000) (get!2020 (select (arr!3546 (_values!3638 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3655 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!177628 () Bool)

(assert (=> b!177628 (= e!117120 e!117118)))

(declare-fun c!31803 () Bool)

(assert (=> b!177628 (= c!31803 e!117122)))

(declare-fun res!84182 () Bool)

(assert (=> b!177628 (=> (not res!84182) (not e!117122))))

(assert (=> b!177628 (= res!84182 (bvslt #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))))))

(declare-fun b!177617 () Bool)

(assert (=> b!177617 (= e!117117 (ListLongMap!2236 Nil!2253))))

(declare-fun d!53765 () Bool)

(assert (=> d!53765 e!117120))

(declare-fun res!84181 () Bool)

(assert (=> d!53765 (=> (not res!84181) (not e!117120))))

(assert (=> d!53765 (= res!84181 (not (contains!1199 lt!87789 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53765 (= lt!87789 e!117117)))

(declare-fun c!31802 () Bool)

(assert (=> d!53765 (= c!31802 (bvsge #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))))))

(assert (=> d!53765 (validMask!0 (mask!8595 thiss!1248))))

(assert (=> d!53765 (= (getCurrentListMapNoExtraKeys!174 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)) lt!87789)))

(assert (= (and d!53765 c!31802) b!177617))

(assert (= (and d!53765 (not c!31802)) b!177619))

(assert (= (and b!177619 c!31804) b!177627))

(assert (= (and b!177619 (not c!31804)) b!177625))

(assert (= (or b!177627 b!177625) bm!17965))

(assert (= (and d!53765 res!84181) b!177621))

(assert (= (and b!177621 res!84179) b!177628))

(assert (= (and b!177628 res!84182) b!177624))

(assert (= (and b!177628 c!31803) b!177620))

(assert (= (and b!177628 (not c!31803)) b!177626))

(assert (= (and b!177620 res!84180) b!177618))

(assert (= (and b!177626 c!31801) b!177623))

(assert (= (and b!177626 (not c!31801)) b!177622))

(declare-fun b_lambda!7059 () Bool)

(assert (=> (not b_lambda!7059) (not b!177618)))

(assert (=> b!177618 t!7090))

(declare-fun b_and!10897 () Bool)

(assert (= b_and!10895 (and (=> t!7090 result!4653) b_and!10897)))

(declare-fun b_lambda!7061 () Bool)

(assert (=> (not b_lambda!7061) (not b!177627)))

(assert (=> b!177627 t!7090))

(declare-fun b_and!10899 () Bool)

(assert (= b_and!10897 (and (=> t!7090 result!4653) b_and!10899)))

(declare-fun m!206081 () Bool)

(assert (=> bm!17965 m!206081))

(assert (=> b!177624 m!205997))

(assert (=> b!177624 m!205997))

(assert (=> b!177624 m!206041))

(declare-fun m!206083 () Bool)

(assert (=> b!177621 m!206083))

(assert (=> b!177619 m!205997))

(assert (=> b!177619 m!205997))

(assert (=> b!177619 m!206041))

(declare-fun m!206085 () Bool)

(assert (=> d!53765 m!206085))

(assert (=> d!53765 m!205955))

(assert (=> b!177620 m!205997))

(assert (=> b!177620 m!205997))

(declare-fun m!206087 () Bool)

(assert (=> b!177620 m!206087))

(declare-fun m!206089 () Bool)

(assert (=> b!177622 m!206089))

(assert (=> b!177623 m!206081))

(assert (=> b!177618 m!205997))

(assert (=> b!177618 m!205997))

(declare-fun m!206091 () Bool)

(assert (=> b!177618 m!206091))

(assert (=> b!177618 m!206029))

(assert (=> b!177618 m!206029))

(assert (=> b!177618 m!206031))

(assert (=> b!177618 m!206033))

(assert (=> b!177618 m!206031))

(declare-fun m!206093 () Bool)

(assert (=> b!177627 m!206093))

(assert (=> b!177627 m!205997))

(declare-fun m!206095 () Bool)

(assert (=> b!177627 m!206095))

(declare-fun m!206097 () Bool)

(assert (=> b!177627 m!206097))

(assert (=> b!177627 m!206029))

(assert (=> b!177627 m!206029))

(assert (=> b!177627 m!206031))

(assert (=> b!177627 m!206033))

(assert (=> b!177627 m!206095))

(assert (=> b!177627 m!206031))

(declare-fun m!206099 () Bool)

(assert (=> b!177627 m!206099))

(assert (=> b!177546 d!53765))

(declare-fun d!53767 () Bool)

(declare-fun get!2021 (Option!202) V!5195)

(assert (=> d!53767 (= (apply!141 lt!87733 lt!87739) (get!2021 (getValueByKey!196 (toList!1133 lt!87733) lt!87739)))))

(declare-fun bs!7293 () Bool)

(assert (= bs!7293 d!53767))

(declare-fun m!206101 () Bool)

(assert (=> bs!7293 m!206101))

(assert (=> bs!7293 m!206101))

(declare-fun m!206103 () Bool)

(assert (=> bs!7293 m!206103))

(assert (=> b!177546 d!53767))

(declare-fun d!53769 () Bool)

(assert (=> d!53769 (= (apply!141 (+!258 lt!87733 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248))) lt!87739) (apply!141 lt!87733 lt!87739))))

(declare-fun lt!87795 () Unit!5424)

(declare-fun choose!946 (ListLongMap!2235 (_ BitVec 64) V!5195 (_ BitVec 64)) Unit!5424)

(assert (=> d!53769 (= lt!87795 (choose!946 lt!87733 lt!87737 (minValue!3496 thiss!1248) lt!87739))))

(declare-fun e!117125 () Bool)

(assert (=> d!53769 e!117125))

(declare-fun res!84185 () Bool)

(assert (=> d!53769 (=> (not res!84185) (not e!117125))))

(assert (=> d!53769 (= res!84185 (contains!1199 lt!87733 lt!87739))))

(assert (=> d!53769 (= (addApplyDifferent!117 lt!87733 lt!87737 (minValue!3496 thiss!1248) lt!87739) lt!87795)))

(declare-fun b!177632 () Bool)

(assert (=> b!177632 (= e!117125 (not (= lt!87739 lt!87737)))))

(assert (= (and d!53769 res!84185) b!177632))

(assert (=> d!53769 m!205999))

(declare-fun m!206105 () Bool)

(assert (=> d!53769 m!206105))

(assert (=> d!53769 m!206001))

(assert (=> d!53769 m!206003))

(declare-fun m!206107 () Bool)

(assert (=> d!53769 m!206107))

(assert (=> d!53769 m!206001))

(assert (=> b!177546 d!53769))

(declare-fun d!53771 () Bool)

(assert (=> d!53771 (= (apply!141 (+!258 lt!87729 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248))) lt!87749) (get!2021 (getValueByKey!196 (toList!1133 (+!258 lt!87729 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248)))) lt!87749)))))

(declare-fun bs!7294 () Bool)

(assert (= bs!7294 d!53771))

(declare-fun m!206109 () Bool)

(assert (=> bs!7294 m!206109))

(assert (=> bs!7294 m!206109))

(declare-fun m!206111 () Bool)

(assert (=> bs!7294 m!206111))

(assert (=> b!177546 d!53771))

(declare-fun d!53773 () Bool)

(declare-fun e!117126 () Bool)

(assert (=> d!53773 e!117126))

(declare-fun res!84187 () Bool)

(assert (=> d!53773 (=> (not res!84187) (not e!117126))))

(declare-fun lt!87799 () ListLongMap!2235)

(assert (=> d!53773 (= res!84187 (contains!1199 lt!87799 (_1!1665 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248)))))))

(declare-fun lt!87797 () List!2256)

(assert (=> d!53773 (= lt!87799 (ListLongMap!2236 lt!87797))))

(declare-fun lt!87796 () Unit!5424)

(declare-fun lt!87798 () Unit!5424)

(assert (=> d!53773 (= lt!87796 lt!87798)))

(assert (=> d!53773 (= (getValueByKey!196 lt!87797 (_1!1665 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248)))) (Some!201 (_2!1665 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248)))))))

(assert (=> d!53773 (= lt!87798 (lemmaContainsTupThenGetReturnValue!103 lt!87797 (_1!1665 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248))) (_2!1665 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248)))))))

(assert (=> d!53773 (= lt!87797 (insertStrictlySorted!106 (toList!1133 lt!87733) (_1!1665 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248))) (_2!1665 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248)))))))

(assert (=> d!53773 (= (+!258 lt!87733 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248))) lt!87799)))

(declare-fun b!177633 () Bool)

(declare-fun res!84186 () Bool)

(assert (=> b!177633 (=> (not res!84186) (not e!117126))))

(assert (=> b!177633 (= res!84186 (= (getValueByKey!196 (toList!1133 lt!87799) (_1!1665 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248)))) (Some!201 (_2!1665 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248))))))))

(declare-fun b!177634 () Bool)

(assert (=> b!177634 (= e!117126 (contains!1200 (toList!1133 lt!87799) (tuple2!3309 lt!87737 (minValue!3496 thiss!1248))))))

(assert (= (and d!53773 res!84187) b!177633))

(assert (= (and b!177633 res!84186) b!177634))

(declare-fun m!206113 () Bool)

(assert (=> d!53773 m!206113))

(declare-fun m!206115 () Bool)

(assert (=> d!53773 m!206115))

(declare-fun m!206117 () Bool)

(assert (=> d!53773 m!206117))

(declare-fun m!206119 () Bool)

(assert (=> d!53773 m!206119))

(declare-fun m!206121 () Bool)

(assert (=> b!177633 m!206121))

(declare-fun m!206123 () Bool)

(assert (=> b!177634 m!206123))

(assert (=> b!177546 d!53773))

(declare-fun d!53775 () Bool)

(assert (=> d!53775 (= (apply!141 (+!258 lt!87729 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248))) lt!87749) (apply!141 lt!87729 lt!87749))))

(declare-fun lt!87800 () Unit!5424)

(assert (=> d!53775 (= lt!87800 (choose!946 lt!87729 lt!87738 (zeroValue!3496 thiss!1248) lt!87749))))

(declare-fun e!117127 () Bool)

(assert (=> d!53775 e!117127))

(declare-fun res!84188 () Bool)

(assert (=> d!53775 (=> (not res!84188) (not e!117127))))

(assert (=> d!53775 (= res!84188 (contains!1199 lt!87729 lt!87749))))

(assert (=> d!53775 (= (addApplyDifferent!117 lt!87729 lt!87738 (zeroValue!3496 thiss!1248) lt!87749) lt!87800)))

(declare-fun b!177635 () Bool)

(assert (=> b!177635 (= e!117127 (not (= lt!87749 lt!87738)))))

(assert (= (and d!53775 res!84188) b!177635))

(assert (=> d!53775 m!206023))

(declare-fun m!206125 () Bool)

(assert (=> d!53775 m!206125))

(assert (=> d!53775 m!205993))

(assert (=> d!53775 m!206017))

(declare-fun m!206127 () Bool)

(assert (=> d!53775 m!206127))

(assert (=> d!53775 m!205993))

(assert (=> b!177546 d!53775))

(declare-fun d!53777 () Bool)

(assert (=> d!53777 (contains!1199 (+!258 lt!87736 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248))) lt!87732)))

(declare-fun lt!87803 () Unit!5424)

(declare-fun choose!947 (ListLongMap!2235 (_ BitVec 64) V!5195 (_ BitVec 64)) Unit!5424)

(assert (=> d!53777 (= lt!87803 (choose!947 lt!87736 lt!87734 (zeroValue!3496 thiss!1248) lt!87732))))

(assert (=> d!53777 (contains!1199 lt!87736 lt!87732)))

(assert (=> d!53777 (= (addStillContains!117 lt!87736 lt!87734 (zeroValue!3496 thiss!1248) lt!87732) lt!87803)))

(declare-fun bs!7295 () Bool)

(assert (= bs!7295 d!53777))

(assert (=> bs!7295 m!205995))

(assert (=> bs!7295 m!205995))

(assert (=> bs!7295 m!206007))

(declare-fun m!206129 () Bool)

(assert (=> bs!7295 m!206129))

(declare-fun m!206131 () Bool)

(assert (=> bs!7295 m!206131))

(assert (=> b!177546 d!53777))

(declare-fun d!53779 () Bool)

(assert (=> d!53779 (= (apply!141 (+!258 lt!87748 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248))) lt!87742) (apply!141 lt!87748 lt!87742))))

(declare-fun lt!87804 () Unit!5424)

(assert (=> d!53779 (= lt!87804 (choose!946 lt!87748 lt!87741 (minValue!3496 thiss!1248) lt!87742))))

(declare-fun e!117128 () Bool)

(assert (=> d!53779 e!117128))

(declare-fun res!84189 () Bool)

(assert (=> d!53779 (=> (not res!84189) (not e!117128))))

(assert (=> d!53779 (= res!84189 (contains!1199 lt!87748 lt!87742))))

(assert (=> d!53779 (= (addApplyDifferent!117 lt!87748 lt!87741 (minValue!3496 thiss!1248) lt!87742) lt!87804)))

(declare-fun b!177637 () Bool)

(assert (=> b!177637 (= e!117128 (not (= lt!87742 lt!87741)))))

(assert (= (and d!53779 res!84189) b!177637))

(assert (=> d!53779 m!206019))

(declare-fun m!206133 () Bool)

(assert (=> d!53779 m!206133))

(assert (=> d!53779 m!206011))

(assert (=> d!53779 m!206013))

(declare-fun m!206135 () Bool)

(assert (=> d!53779 m!206135))

(assert (=> d!53779 m!206011))

(assert (=> b!177546 d!53779))

(declare-fun d!53781 () Bool)

(declare-fun e!117129 () Bool)

(assert (=> d!53781 e!117129))

(declare-fun res!84191 () Bool)

(assert (=> d!53781 (=> (not res!84191) (not e!117129))))

(declare-fun lt!87808 () ListLongMap!2235)

(assert (=> d!53781 (= res!84191 (contains!1199 lt!87808 (_1!1665 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248)))))))

(declare-fun lt!87806 () List!2256)

(assert (=> d!53781 (= lt!87808 (ListLongMap!2236 lt!87806))))

(declare-fun lt!87805 () Unit!5424)

(declare-fun lt!87807 () Unit!5424)

(assert (=> d!53781 (= lt!87805 lt!87807)))

(assert (=> d!53781 (= (getValueByKey!196 lt!87806 (_1!1665 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248)))) (Some!201 (_2!1665 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248)))))))

(assert (=> d!53781 (= lt!87807 (lemmaContainsTupThenGetReturnValue!103 lt!87806 (_1!1665 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248))) (_2!1665 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248)))))))

(assert (=> d!53781 (= lt!87806 (insertStrictlySorted!106 (toList!1133 lt!87748) (_1!1665 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248))) (_2!1665 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248)))))))

(assert (=> d!53781 (= (+!258 lt!87748 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248))) lt!87808)))

(declare-fun b!177638 () Bool)

(declare-fun res!84190 () Bool)

(assert (=> b!177638 (=> (not res!84190) (not e!117129))))

(assert (=> b!177638 (= res!84190 (= (getValueByKey!196 (toList!1133 lt!87808) (_1!1665 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248)))) (Some!201 (_2!1665 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248))))))))

(declare-fun b!177639 () Bool)

(assert (=> b!177639 (= e!117129 (contains!1200 (toList!1133 lt!87808) (tuple2!3309 lt!87741 (minValue!3496 thiss!1248))))))

(assert (= (and d!53781 res!84191) b!177638))

(assert (= (and b!177638 res!84190) b!177639))

(declare-fun m!206137 () Bool)

(assert (=> d!53781 m!206137))

(declare-fun m!206139 () Bool)

(assert (=> d!53781 m!206139))

(declare-fun m!206141 () Bool)

(assert (=> d!53781 m!206141))

(declare-fun m!206143 () Bool)

(assert (=> d!53781 m!206143))

(declare-fun m!206145 () Bool)

(assert (=> b!177638 m!206145))

(declare-fun m!206147 () Bool)

(assert (=> b!177639 m!206147))

(assert (=> b!177546 d!53781))

(declare-fun d!53783 () Bool)

(declare-fun e!117130 () Bool)

(assert (=> d!53783 e!117130))

(declare-fun res!84193 () Bool)

(assert (=> d!53783 (=> (not res!84193) (not e!117130))))

(declare-fun lt!87812 () ListLongMap!2235)

(assert (=> d!53783 (= res!84193 (contains!1199 lt!87812 (_1!1665 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248)))))))

(declare-fun lt!87810 () List!2256)

(assert (=> d!53783 (= lt!87812 (ListLongMap!2236 lt!87810))))

(declare-fun lt!87809 () Unit!5424)

(declare-fun lt!87811 () Unit!5424)

(assert (=> d!53783 (= lt!87809 lt!87811)))

(assert (=> d!53783 (= (getValueByKey!196 lt!87810 (_1!1665 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248)))) (Some!201 (_2!1665 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248)))))))

(assert (=> d!53783 (= lt!87811 (lemmaContainsTupThenGetReturnValue!103 lt!87810 (_1!1665 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248))) (_2!1665 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248)))))))

(assert (=> d!53783 (= lt!87810 (insertStrictlySorted!106 (toList!1133 lt!87729) (_1!1665 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248))) (_2!1665 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248)))))))

(assert (=> d!53783 (= (+!258 lt!87729 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248))) lt!87812)))

(declare-fun b!177640 () Bool)

(declare-fun res!84192 () Bool)

(assert (=> b!177640 (=> (not res!84192) (not e!117130))))

(assert (=> b!177640 (= res!84192 (= (getValueByKey!196 (toList!1133 lt!87812) (_1!1665 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248)))) (Some!201 (_2!1665 (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248))))))))

(declare-fun b!177641 () Bool)

(assert (=> b!177641 (= e!117130 (contains!1200 (toList!1133 lt!87812) (tuple2!3309 lt!87738 (zeroValue!3496 thiss!1248))))))

(assert (= (and d!53783 res!84193) b!177640))

(assert (= (and b!177640 res!84192) b!177641))

(declare-fun m!206149 () Bool)

(assert (=> d!53783 m!206149))

(declare-fun m!206151 () Bool)

(assert (=> d!53783 m!206151))

(declare-fun m!206153 () Bool)

(assert (=> d!53783 m!206153))

(declare-fun m!206155 () Bool)

(assert (=> d!53783 m!206155))

(declare-fun m!206157 () Bool)

(assert (=> b!177640 m!206157))

(declare-fun m!206159 () Bool)

(assert (=> b!177641 m!206159))

(assert (=> b!177546 d!53783))

(declare-fun d!53785 () Bool)

(assert (=> d!53785 (= (apply!141 lt!87729 lt!87749) (get!2021 (getValueByKey!196 (toList!1133 lt!87729) lt!87749)))))

(declare-fun bs!7296 () Bool)

(assert (= bs!7296 d!53785))

(declare-fun m!206161 () Bool)

(assert (=> bs!7296 m!206161))

(assert (=> bs!7296 m!206161))

(declare-fun m!206163 () Bool)

(assert (=> bs!7296 m!206163))

(assert (=> b!177546 d!53785))

(declare-fun d!53787 () Bool)

(assert (=> d!53787 (= (apply!141 (+!258 lt!87748 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248))) lt!87742) (get!2021 (getValueByKey!196 (toList!1133 (+!258 lt!87748 (tuple2!3309 lt!87741 (minValue!3496 thiss!1248)))) lt!87742)))))

(declare-fun bs!7297 () Bool)

(assert (= bs!7297 d!53787))

(declare-fun m!206165 () Bool)

(assert (=> bs!7297 m!206165))

(assert (=> bs!7297 m!206165))

(declare-fun m!206167 () Bool)

(assert (=> bs!7297 m!206167))

(assert (=> b!177546 d!53787))

(declare-fun d!53789 () Bool)

(assert (=> d!53789 (= (apply!141 (+!258 lt!87733 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248))) lt!87739) (get!2021 (getValueByKey!196 (toList!1133 (+!258 lt!87733 (tuple2!3309 lt!87737 (minValue!3496 thiss!1248)))) lt!87739)))))

(declare-fun bs!7298 () Bool)

(assert (= bs!7298 d!53789))

(declare-fun m!206169 () Bool)

(assert (=> bs!7298 m!206169))

(assert (=> bs!7298 m!206169))

(declare-fun m!206171 () Bool)

(assert (=> bs!7298 m!206171))

(assert (=> b!177546 d!53789))

(declare-fun d!53791 () Bool)

(assert (=> d!53791 (= (apply!141 lt!87748 lt!87742) (get!2021 (getValueByKey!196 (toList!1133 lt!87748) lt!87742)))))

(declare-fun bs!7299 () Bool)

(assert (= bs!7299 d!53791))

(declare-fun m!206173 () Bool)

(assert (=> bs!7299 m!206173))

(assert (=> bs!7299 m!206173))

(declare-fun m!206175 () Bool)

(assert (=> bs!7299 m!206175))

(assert (=> b!177546 d!53791))

(declare-fun d!53793 () Bool)

(declare-fun e!117131 () Bool)

(assert (=> d!53793 e!117131))

(declare-fun res!84195 () Bool)

(assert (=> d!53793 (=> (not res!84195) (not e!117131))))

(declare-fun lt!87816 () ListLongMap!2235)

(assert (=> d!53793 (= res!84195 (contains!1199 lt!87816 (_1!1665 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248)))))))

(declare-fun lt!87814 () List!2256)

(assert (=> d!53793 (= lt!87816 (ListLongMap!2236 lt!87814))))

(declare-fun lt!87813 () Unit!5424)

(declare-fun lt!87815 () Unit!5424)

(assert (=> d!53793 (= lt!87813 lt!87815)))

(assert (=> d!53793 (= (getValueByKey!196 lt!87814 (_1!1665 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248)))) (Some!201 (_2!1665 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248)))))))

(assert (=> d!53793 (= lt!87815 (lemmaContainsTupThenGetReturnValue!103 lt!87814 (_1!1665 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248))) (_2!1665 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248)))))))

(assert (=> d!53793 (= lt!87814 (insertStrictlySorted!106 (toList!1133 lt!87736) (_1!1665 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248))) (_2!1665 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248)))))))

(assert (=> d!53793 (= (+!258 lt!87736 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248))) lt!87816)))

(declare-fun b!177642 () Bool)

(declare-fun res!84194 () Bool)

(assert (=> b!177642 (=> (not res!84194) (not e!117131))))

(assert (=> b!177642 (= res!84194 (= (getValueByKey!196 (toList!1133 lt!87816) (_1!1665 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248)))) (Some!201 (_2!1665 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248))))))))

(declare-fun b!177643 () Bool)

(assert (=> b!177643 (= e!117131 (contains!1200 (toList!1133 lt!87816) (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248))))))

(assert (= (and d!53793 res!84195) b!177642))

(assert (= (and b!177642 res!84194) b!177643))

(declare-fun m!206177 () Bool)

(assert (=> d!53793 m!206177))

(declare-fun m!206179 () Bool)

(assert (=> d!53793 m!206179))

(declare-fun m!206181 () Bool)

(assert (=> d!53793 m!206181))

(declare-fun m!206183 () Bool)

(assert (=> d!53793 m!206183))

(declare-fun m!206185 () Bool)

(assert (=> b!177642 m!206185))

(declare-fun m!206187 () Bool)

(assert (=> b!177643 m!206187))

(assert (=> b!177546 d!53793))

(declare-fun d!53795 () Bool)

(declare-fun e!117133 () Bool)

(assert (=> d!53795 e!117133))

(declare-fun res!84196 () Bool)

(assert (=> d!53795 (=> res!84196 e!117133)))

(declare-fun lt!87817 () Bool)

(assert (=> d!53795 (= res!84196 (not lt!87817))))

(declare-fun lt!87818 () Bool)

(assert (=> d!53795 (= lt!87817 lt!87818)))

(declare-fun lt!87819 () Unit!5424)

(declare-fun e!117132 () Unit!5424)

(assert (=> d!53795 (= lt!87819 e!117132)))

(declare-fun c!31805 () Bool)

(assert (=> d!53795 (= c!31805 lt!87818)))

(assert (=> d!53795 (= lt!87818 (containsKey!200 (toList!1133 (+!258 lt!87736 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248)))) lt!87732))))

(assert (=> d!53795 (= (contains!1199 (+!258 lt!87736 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248))) lt!87732) lt!87817)))

(declare-fun b!177644 () Bool)

(declare-fun lt!87820 () Unit!5424)

(assert (=> b!177644 (= e!117132 lt!87820)))

(assert (=> b!177644 (= lt!87820 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1133 (+!258 lt!87736 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248)))) lt!87732))))

(assert (=> b!177644 (isDefined!149 (getValueByKey!196 (toList!1133 (+!258 lt!87736 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248)))) lt!87732))))

(declare-fun b!177645 () Bool)

(declare-fun Unit!5428 () Unit!5424)

(assert (=> b!177645 (= e!117132 Unit!5428)))

(declare-fun b!177646 () Bool)

(assert (=> b!177646 (= e!117133 (isDefined!149 (getValueByKey!196 (toList!1133 (+!258 lt!87736 (tuple2!3309 lt!87734 (zeroValue!3496 thiss!1248)))) lt!87732)))))

(assert (= (and d!53795 c!31805) b!177644))

(assert (= (and d!53795 (not c!31805)) b!177645))

(assert (= (and d!53795 (not res!84196)) b!177646))

(declare-fun m!206189 () Bool)

(assert (=> d!53795 m!206189))

(declare-fun m!206191 () Bool)

(assert (=> b!177644 m!206191))

(declare-fun m!206193 () Bool)

(assert (=> b!177644 m!206193))

(assert (=> b!177644 m!206193))

(declare-fun m!206195 () Bool)

(assert (=> b!177644 m!206195))

(assert (=> b!177646 m!206193))

(assert (=> b!177646 m!206193))

(assert (=> b!177646 m!206195))

(assert (=> b!177546 d!53795))

(declare-fun b!177658 () Bool)

(declare-fun e!117136 () Bool)

(assert (=> b!177658 (= e!117136 (and (bvsge (extraKeys!3392 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3392 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1240 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!177655 () Bool)

(declare-fun res!84205 () Bool)

(assert (=> b!177655 (=> (not res!84205) (not e!117136))))

(assert (=> b!177655 (= res!84205 (and (= (size!3850 (_values!3638 thiss!1248)) (bvadd (mask!8595 thiss!1248) #b00000000000000000000000000000001)) (= (size!3849 (_keys!5523 thiss!1248)) (size!3850 (_values!3638 thiss!1248))) (bvsge (_size!1240 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1240 thiss!1248) (bvadd (mask!8595 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!177657 () Bool)

(declare-fun res!84206 () Bool)

(assert (=> b!177657 (=> (not res!84206) (not e!117136))))

(declare-fun size!3853 (LongMapFixedSize!2382) (_ BitVec 32))

(assert (=> b!177657 (= res!84206 (= (size!3853 thiss!1248) (bvadd (_size!1240 thiss!1248) (bvsdiv (bvadd (extraKeys!3392 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!53797 () Bool)

(declare-fun res!84207 () Bool)

(assert (=> d!53797 (=> (not res!84207) (not e!117136))))

(assert (=> d!53797 (= res!84207 (validMask!0 (mask!8595 thiss!1248)))))

(assert (=> d!53797 (= (simpleValid!155 thiss!1248) e!117136)))

(declare-fun b!177656 () Bool)

(declare-fun res!84208 () Bool)

(assert (=> b!177656 (=> (not res!84208) (not e!117136))))

(assert (=> b!177656 (= res!84208 (bvsge (size!3853 thiss!1248) (_size!1240 thiss!1248)))))

(assert (= (and d!53797 res!84207) b!177655))

(assert (= (and b!177655 res!84205) b!177656))

(assert (= (and b!177656 res!84208) b!177657))

(assert (= (and b!177657 res!84206) b!177658))

(declare-fun m!206197 () Bool)

(assert (=> b!177657 m!206197))

(assert (=> d!53797 m!205955))

(assert (=> b!177656 m!206197))

(assert (=> d!53759 d!53797))

(declare-fun b!177667 () Bool)

(declare-fun e!117142 () (_ BitVec 32))

(declare-fun e!117141 () (_ BitVec 32))

(assert (=> b!177667 (= e!117142 e!117141)))

(declare-fun c!31810 () Bool)

(assert (=> b!177667 (= c!31810 (validKeyInArray!0 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17968 () Bool)

(declare-fun call!17971 () (_ BitVec 32))

(assert (=> bm!17968 (= call!17971 (arrayCountValidKeys!0 (_keys!5523 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3849 (_keys!5523 thiss!1248))))))

(declare-fun b!177668 () Bool)

(assert (=> b!177668 (= e!117141 (bvadd #b00000000000000000000000000000001 call!17971))))

(declare-fun b!177669 () Bool)

(assert (=> b!177669 (= e!117142 #b00000000000000000000000000000000)))

(declare-fun d!53799 () Bool)

(declare-fun lt!87823 () (_ BitVec 32))

(assert (=> d!53799 (and (bvsge lt!87823 #b00000000000000000000000000000000) (bvsle lt!87823 (bvsub (size!3849 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53799 (= lt!87823 e!117142)))

(declare-fun c!31811 () Bool)

(assert (=> d!53799 (= c!31811 (bvsge #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))))))

(assert (=> d!53799 (and (bvsle #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3849 (_keys!5523 thiss!1248)) (size!3849 (_keys!5523 thiss!1248))))))

(assert (=> d!53799 (= (arrayCountValidKeys!0 (_keys!5523 thiss!1248) #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))) lt!87823)))

(declare-fun b!177670 () Bool)

(assert (=> b!177670 (= e!117141 call!17971)))

(assert (= (and d!53799 c!31811) b!177669))

(assert (= (and d!53799 (not c!31811)) b!177667))

(assert (= (and b!177667 c!31810) b!177668))

(assert (= (and b!177667 (not c!31810)) b!177670))

(assert (= (or b!177668 b!177670) bm!17968))

(assert (=> b!177667 m!205997))

(assert (=> b!177667 m!205997))

(assert (=> b!177667 m!206041))

(declare-fun m!206199 () Bool)

(assert (=> bm!17968 m!206199))

(assert (=> b!177576 d!53799))

(declare-fun d!53801 () Bool)

(assert (=> d!53801 (= (apply!141 lt!87730 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)) (get!2021 (getValueByKey!196 (toList!1133 lt!87730) (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7300 () Bool)

(assert (= bs!7300 d!53801))

(assert (=> bs!7300 m!205997))

(declare-fun m!206201 () Bool)

(assert (=> bs!7300 m!206201))

(assert (=> bs!7300 m!206201))

(declare-fun m!206203 () Bool)

(assert (=> bs!7300 m!206203))

(assert (=> b!177529 d!53801))

(declare-fun d!53803 () Bool)

(declare-fun c!31814 () Bool)

(assert (=> d!53803 (= c!31814 ((_ is ValueCellFull!1737) (select (arr!3546 (_values!3638 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117145 () V!5195)

(assert (=> d!53803 (= (get!2020 (select (arr!3546 (_values!3638 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3655 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!117145)))

(declare-fun b!177675 () Bool)

(declare-fun get!2022 (ValueCell!1737 V!5195) V!5195)

(assert (=> b!177675 (= e!117145 (get!2022 (select (arr!3546 (_values!3638 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3655 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177676 () Bool)

(declare-fun get!2023 (ValueCell!1737 V!5195) V!5195)

(assert (=> b!177676 (= e!117145 (get!2023 (select (arr!3546 (_values!3638 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3655 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53803 c!31814) b!177675))

(assert (= (and d!53803 (not c!31814)) b!177676))

(assert (=> b!177675 m!206029))

(assert (=> b!177675 m!206031))

(declare-fun m!206205 () Bool)

(assert (=> b!177675 m!206205))

(assert (=> b!177676 m!206029))

(assert (=> b!177676 m!206031))

(declare-fun m!206207 () Bool)

(assert (=> b!177676 m!206207))

(assert (=> b!177529 d!53803))

(declare-fun d!53805 () Bool)

(declare-fun e!117147 () Bool)

(assert (=> d!53805 e!117147))

(declare-fun res!84209 () Bool)

(assert (=> d!53805 (=> res!84209 e!117147)))

(declare-fun lt!87824 () Bool)

(assert (=> d!53805 (= res!84209 (not lt!87824))))

(declare-fun lt!87825 () Bool)

(assert (=> d!53805 (= lt!87824 lt!87825)))

(declare-fun lt!87826 () Unit!5424)

(declare-fun e!117146 () Unit!5424)

(assert (=> d!53805 (= lt!87826 e!117146)))

(declare-fun c!31815 () Bool)

(assert (=> d!53805 (= c!31815 lt!87825)))

(assert (=> d!53805 (= lt!87825 (containsKey!200 (toList!1133 lt!87730) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53805 (= (contains!1199 lt!87730 #b1000000000000000000000000000000000000000000000000000000000000000) lt!87824)))

(declare-fun b!177677 () Bool)

(declare-fun lt!87827 () Unit!5424)

(assert (=> b!177677 (= e!117146 lt!87827)))

(assert (=> b!177677 (= lt!87827 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1133 lt!87730) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177677 (isDefined!149 (getValueByKey!196 (toList!1133 lt!87730) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177678 () Bool)

(declare-fun Unit!5429 () Unit!5424)

(assert (=> b!177678 (= e!117146 Unit!5429)))

(declare-fun b!177679 () Bool)

(assert (=> b!177679 (= e!117147 (isDefined!149 (getValueByKey!196 (toList!1133 lt!87730) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53805 c!31815) b!177677))

(assert (= (and d!53805 (not c!31815)) b!177678))

(assert (= (and d!53805 (not res!84209)) b!177679))

(declare-fun m!206209 () Bool)

(assert (=> d!53805 m!206209))

(declare-fun m!206211 () Bool)

(assert (=> b!177677 m!206211))

(declare-fun m!206213 () Bool)

(assert (=> b!177677 m!206213))

(assert (=> b!177677 m!206213))

(declare-fun m!206215 () Bool)

(assert (=> b!177677 m!206215))

(assert (=> b!177679 m!206213))

(assert (=> b!177679 m!206213))

(assert (=> b!177679 m!206215))

(assert (=> bm!17957 d!53805))

(declare-fun b!177692 () Bool)

(declare-fun e!117154 () SeekEntryResult!568)

(assert (=> b!177692 (= e!117154 (Found!568 (index!4442 lt!87758)))))

(declare-fun b!177693 () Bool)

(declare-fun e!117155 () SeekEntryResult!568)

(assert (=> b!177693 (= e!117155 e!117154)))

(declare-fun c!31823 () Bool)

(declare-fun lt!87832 () (_ BitVec 64))

(assert (=> b!177693 (= c!31823 (= lt!87832 key!828))))

(declare-fun e!117156 () SeekEntryResult!568)

(declare-fun b!177694 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177694 (= e!117156 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19466 lt!87758) #b00000000000000000000000000000001) (nextIndex!0 (index!4442 lt!87758) (x!19466 lt!87758) (mask!8595 thiss!1248)) (index!4442 lt!87758) key!828 (_keys!5523 thiss!1248) (mask!8595 thiss!1248)))))

(declare-fun d!53807 () Bool)

(declare-fun lt!87833 () SeekEntryResult!568)

(assert (=> d!53807 (and (or ((_ is Undefined!568) lt!87833) (not ((_ is Found!568) lt!87833)) (and (bvsge (index!4441 lt!87833) #b00000000000000000000000000000000) (bvslt (index!4441 lt!87833) (size!3849 (_keys!5523 thiss!1248))))) (or ((_ is Undefined!568) lt!87833) ((_ is Found!568) lt!87833) (not ((_ is MissingVacant!568) lt!87833)) (not (= (index!4443 lt!87833) (index!4442 lt!87758))) (and (bvsge (index!4443 lt!87833) #b00000000000000000000000000000000) (bvslt (index!4443 lt!87833) (size!3849 (_keys!5523 thiss!1248))))) (or ((_ is Undefined!568) lt!87833) (ite ((_ is Found!568) lt!87833) (= (select (arr!3545 (_keys!5523 thiss!1248)) (index!4441 lt!87833)) key!828) (and ((_ is MissingVacant!568) lt!87833) (= (index!4443 lt!87833) (index!4442 lt!87758)) (= (select (arr!3545 (_keys!5523 thiss!1248)) (index!4443 lt!87833)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53807 (= lt!87833 e!117155)))

(declare-fun c!31824 () Bool)

(assert (=> d!53807 (= c!31824 (bvsge (x!19466 lt!87758) #b01111111111111111111111111111110))))

(assert (=> d!53807 (= lt!87832 (select (arr!3545 (_keys!5523 thiss!1248)) (index!4442 lt!87758)))))

(assert (=> d!53807 (validMask!0 (mask!8595 thiss!1248))))

(assert (=> d!53807 (= (seekKeyOrZeroReturnVacant!0 (x!19466 lt!87758) (index!4442 lt!87758) (index!4442 lt!87758) key!828 (_keys!5523 thiss!1248) (mask!8595 thiss!1248)) lt!87833)))

(declare-fun b!177695 () Bool)

(assert (=> b!177695 (= e!117156 (MissingVacant!568 (index!4442 lt!87758)))))

(declare-fun b!177696 () Bool)

(declare-fun c!31822 () Bool)

(assert (=> b!177696 (= c!31822 (= lt!87832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177696 (= e!117154 e!117156)))

(declare-fun b!177697 () Bool)

(assert (=> b!177697 (= e!117155 Undefined!568)))

(assert (= (and d!53807 c!31824) b!177697))

(assert (= (and d!53807 (not c!31824)) b!177693))

(assert (= (and b!177693 c!31823) b!177692))

(assert (= (and b!177693 (not c!31823)) b!177696))

(assert (= (and b!177696 c!31822) b!177695))

(assert (= (and b!177696 (not c!31822)) b!177694))

(declare-fun m!206217 () Bool)

(assert (=> b!177694 m!206217))

(assert (=> b!177694 m!206217))

(declare-fun m!206219 () Bool)

(assert (=> b!177694 m!206219))

(declare-fun m!206221 () Bool)

(assert (=> d!53807 m!206221))

(declare-fun m!206223 () Bool)

(assert (=> d!53807 m!206223))

(assert (=> d!53807 m!206047))

(assert (=> d!53807 m!205955))

(assert (=> b!177564 d!53807))

(declare-fun d!53809 () Bool)

(declare-fun e!117158 () Bool)

(assert (=> d!53809 e!117158))

(declare-fun res!84210 () Bool)

(assert (=> d!53809 (=> res!84210 e!117158)))

(declare-fun lt!87834 () Bool)

(assert (=> d!53809 (= res!84210 (not lt!87834))))

(declare-fun lt!87835 () Bool)

(assert (=> d!53809 (= lt!87834 lt!87835)))

(declare-fun lt!87836 () Unit!5424)

(declare-fun e!117157 () Unit!5424)

(assert (=> d!53809 (= lt!87836 e!117157)))

(declare-fun c!31825 () Bool)

(assert (=> d!53809 (= c!31825 lt!87835)))

(assert (=> d!53809 (= lt!87835 (containsKey!200 (toList!1133 lt!87730) (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53809 (= (contains!1199 lt!87730 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)) lt!87834)))

(declare-fun b!177698 () Bool)

(declare-fun lt!87837 () Unit!5424)

(assert (=> b!177698 (= e!117157 lt!87837)))

(assert (=> b!177698 (= lt!87837 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1133 lt!87730) (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177698 (isDefined!149 (getValueByKey!196 (toList!1133 lt!87730) (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177699 () Bool)

(declare-fun Unit!5430 () Unit!5424)

(assert (=> b!177699 (= e!117157 Unit!5430)))

(declare-fun b!177700 () Bool)

(assert (=> b!177700 (= e!117158 (isDefined!149 (getValueByKey!196 (toList!1133 lt!87730) (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53809 c!31825) b!177698))

(assert (= (and d!53809 (not c!31825)) b!177699))

(assert (= (and d!53809 (not res!84210)) b!177700))

(assert (=> d!53809 m!205997))

(declare-fun m!206225 () Bool)

(assert (=> d!53809 m!206225))

(assert (=> b!177698 m!205997))

(declare-fun m!206227 () Bool)

(assert (=> b!177698 m!206227))

(assert (=> b!177698 m!205997))

(assert (=> b!177698 m!206201))

(assert (=> b!177698 m!206201))

(declare-fun m!206229 () Bool)

(assert (=> b!177698 m!206229))

(assert (=> b!177700 m!205997))

(assert (=> b!177700 m!206201))

(assert (=> b!177700 m!206201))

(assert (=> b!177700 m!206229))

(assert (=> b!177548 d!53809))

(declare-fun b!177709 () Bool)

(declare-fun e!117166 () Bool)

(declare-fun e!117167 () Bool)

(assert (=> b!177709 (= e!117166 e!117167)))

(declare-fun c!31828 () Bool)

(assert (=> b!177709 (= c!31828 (validKeyInArray!0 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17971 () Bool)

(declare-fun call!17974 () Bool)

(assert (=> bm!17971 (= call!17974 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5523 thiss!1248) (mask!8595 thiss!1248)))))

(declare-fun b!177710 () Bool)

(declare-fun e!117165 () Bool)

(assert (=> b!177710 (= e!117167 e!117165)))

(declare-fun lt!87846 () (_ BitVec 64))

(assert (=> b!177710 (= lt!87846 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87845 () Unit!5424)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7475 (_ BitVec 64) (_ BitVec 32)) Unit!5424)

(assert (=> b!177710 (= lt!87845 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5523 thiss!1248) lt!87846 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!177710 (arrayContainsKey!0 (_keys!5523 thiss!1248) lt!87846 #b00000000000000000000000000000000)))

(declare-fun lt!87844 () Unit!5424)

(assert (=> b!177710 (= lt!87844 lt!87845)))

(declare-fun res!84216 () Bool)

(assert (=> b!177710 (= res!84216 (= (seekEntryOrOpen!0 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000) (_keys!5523 thiss!1248) (mask!8595 thiss!1248)) (Found!568 #b00000000000000000000000000000000)))))

(assert (=> b!177710 (=> (not res!84216) (not e!117165))))

(declare-fun b!177711 () Bool)

(assert (=> b!177711 (= e!117165 call!17974)))

(declare-fun d!53811 () Bool)

(declare-fun res!84215 () Bool)

(assert (=> d!53811 (=> res!84215 e!117166)))

(assert (=> d!53811 (= res!84215 (bvsge #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))))))

(assert (=> d!53811 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5523 thiss!1248) (mask!8595 thiss!1248)) e!117166)))

(declare-fun b!177712 () Bool)

(assert (=> b!177712 (= e!117167 call!17974)))

(assert (= (and d!53811 (not res!84215)) b!177709))

(assert (= (and b!177709 c!31828) b!177710))

(assert (= (and b!177709 (not c!31828)) b!177712))

(assert (= (and b!177710 res!84216) b!177711))

(assert (= (or b!177711 b!177712) bm!17971))

(assert (=> b!177709 m!205997))

(assert (=> b!177709 m!205997))

(assert (=> b!177709 m!206041))

(declare-fun m!206231 () Bool)

(assert (=> bm!17971 m!206231))

(assert (=> b!177710 m!205997))

(declare-fun m!206233 () Bool)

(assert (=> b!177710 m!206233))

(declare-fun m!206235 () Bool)

(assert (=> b!177710 m!206235))

(assert (=> b!177710 m!205997))

(declare-fun m!206237 () Bool)

(assert (=> b!177710 m!206237))

(assert (=> b!177577 d!53811))

(declare-fun b!177723 () Bool)

(declare-fun e!117176 () Bool)

(declare-fun e!117179 () Bool)

(assert (=> b!177723 (= e!117176 e!117179)))

(declare-fun res!84223 () Bool)

(assert (=> b!177723 (=> (not res!84223) (not e!117179))))

(declare-fun e!117177 () Bool)

(assert (=> b!177723 (= res!84223 (not e!117177))))

(declare-fun res!84224 () Bool)

(assert (=> b!177723 (=> (not res!84224) (not e!117177))))

(assert (=> b!177723 (= res!84224 (validKeyInArray!0 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53813 () Bool)

(declare-fun res!84225 () Bool)

(assert (=> d!53813 (=> res!84225 e!117176)))

(assert (=> d!53813 (= res!84225 (bvsge #b00000000000000000000000000000000 (size!3849 (_keys!5523 thiss!1248))))))

(assert (=> d!53813 (= (arrayNoDuplicates!0 (_keys!5523 thiss!1248) #b00000000000000000000000000000000 Nil!2254) e!117176)))

(declare-fun b!177724 () Bool)

(declare-fun e!117178 () Bool)

(assert (=> b!177724 (= e!117179 e!117178)))

(declare-fun c!31831 () Bool)

(assert (=> b!177724 (= c!31831 (validKeyInArray!0 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17974 () Bool)

(declare-fun call!17977 () Bool)

(assert (=> bm!17974 (= call!17977 (arrayNoDuplicates!0 (_keys!5523 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31831 (Cons!2253 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000) Nil!2254) Nil!2254)))))

(declare-fun b!177725 () Bool)

(assert (=> b!177725 (= e!117178 call!17977)))

(declare-fun b!177726 () Bool)

(assert (=> b!177726 (= e!117178 call!17977)))

(declare-fun b!177727 () Bool)

(declare-fun contains!1201 (List!2257 (_ BitVec 64)) Bool)

(assert (=> b!177727 (= e!117177 (contains!1201 Nil!2254 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53813 (not res!84225)) b!177723))

(assert (= (and b!177723 res!84224) b!177727))

(assert (= (and b!177723 res!84223) b!177724))

(assert (= (and b!177724 c!31831) b!177725))

(assert (= (and b!177724 (not c!31831)) b!177726))

(assert (= (or b!177725 b!177726) bm!17974))

(assert (=> b!177723 m!205997))

(assert (=> b!177723 m!205997))

(assert (=> b!177723 m!206041))

(assert (=> b!177724 m!205997))

(assert (=> b!177724 m!205997))

(assert (=> b!177724 m!206041))

(assert (=> bm!17974 m!205997))

(declare-fun m!206239 () Bool)

(assert (=> bm!17974 m!206239))

(assert (=> b!177727 m!205997))

(assert (=> b!177727 m!205997))

(declare-fun m!206241 () Bool)

(assert (=> b!177727 m!206241))

(assert (=> b!177578 d!53813))

(declare-fun d!53815 () Bool)

(declare-fun res!84230 () Bool)

(declare-fun e!117184 () Bool)

(assert (=> d!53815 (=> res!84230 e!117184)))

(assert (=> d!53815 (= res!84230 (and ((_ is Cons!2252) (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)))) (= (_1!1665 (h!2873 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))))) key!828)))))

(assert (=> d!53815 (= (containsKey!200 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))) key!828) e!117184)))

(declare-fun b!177732 () Bool)

(declare-fun e!117185 () Bool)

(assert (=> b!177732 (= e!117184 e!117185)))

(declare-fun res!84231 () Bool)

(assert (=> b!177732 (=> (not res!84231) (not e!117185))))

(assert (=> b!177732 (= res!84231 (and (or (not ((_ is Cons!2252) (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))))) (bvsle (_1!1665 (h!2873 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))))) key!828)) ((_ is Cons!2252) (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)))) (bvslt (_1!1665 (h!2873 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))))) key!828)))))

(declare-fun b!177733 () Bool)

(assert (=> b!177733 (= e!117185 (containsKey!200 (t!7088 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)))) key!828))))

(assert (= (and d!53815 (not res!84230)) b!177732))

(assert (= (and b!177732 res!84231) b!177733))

(declare-fun m!206243 () Bool)

(assert (=> b!177733 m!206243))

(assert (=> d!53749 d!53815))

(assert (=> bm!17961 d!53765))

(declare-fun d!53817 () Bool)

(assert (=> d!53817 (= (validKeyInArray!0 (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3545 (_keys!5523 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177541 d!53817))

(assert (=> b!177533 d!53817))

(declare-fun d!53819 () Bool)

(assert (=> d!53819 (isDefined!149 (getValueByKey!196 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))) key!828))))

(declare-fun lt!87849 () Unit!5424)

(declare-fun choose!948 (List!2256 (_ BitVec 64)) Unit!5424)

(assert (=> d!53819 (= lt!87849 (choose!948 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))) key!828))))

(declare-fun e!117188 () Bool)

(assert (=> d!53819 e!117188))

(declare-fun res!84234 () Bool)

(assert (=> d!53819 (=> (not res!84234) (not e!117188))))

(declare-fun isStrictlySorted!337 (List!2256) Bool)

(assert (=> d!53819 (= res!84234 (isStrictlySorted!337 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)))))))

(assert (=> d!53819 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))) key!828) lt!87849)))

(declare-fun b!177736 () Bool)

(assert (=> b!177736 (= e!117188 (containsKey!200 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))) key!828))))

(assert (= (and d!53819 res!84234) b!177736))

(assert (=> d!53819 m!205983))

(assert (=> d!53819 m!205983))

(assert (=> d!53819 m!205985))

(declare-fun m!206245 () Bool)

(assert (=> d!53819 m!206245))

(declare-fun m!206247 () Bool)

(assert (=> d!53819 m!206247))

(assert (=> b!177736 m!205979))

(assert (=> b!177484 d!53819))

(declare-fun d!53821 () Bool)

(declare-fun isEmpty!448 (Option!202) Bool)

(assert (=> d!53821 (= (isDefined!149 (getValueByKey!196 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))) key!828)) (not (isEmpty!448 (getValueByKey!196 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))) key!828))))))

(declare-fun bs!7301 () Bool)

(assert (= bs!7301 d!53821))

(assert (=> bs!7301 m!205983))

(declare-fun m!206249 () Bool)

(assert (=> bs!7301 m!206249))

(assert (=> b!177484 d!53821))

(declare-fun b!177747 () Bool)

(declare-fun e!117194 () Option!202)

(assert (=> b!177747 (= e!117194 (getValueByKey!196 (t!7088 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)))) key!828))))

(declare-fun b!177745 () Bool)

(declare-fun e!117193 () Option!202)

(assert (=> b!177745 (= e!117193 (Some!201 (_2!1665 (h!2873 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)))))))))

(declare-fun b!177746 () Bool)

(assert (=> b!177746 (= e!117193 e!117194)))

(declare-fun c!31837 () Bool)

(assert (=> b!177746 (= c!31837 (and ((_ is Cons!2252) (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)))) (not (= (_1!1665 (h!2873 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))))) key!828))))))

(declare-fun d!53823 () Bool)

(declare-fun c!31836 () Bool)

(assert (=> d!53823 (= c!31836 (and ((_ is Cons!2252) (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248)))) (= (_1!1665 (h!2873 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))))) key!828)))))

(assert (=> d!53823 (= (getValueByKey!196 (toList!1133 (getCurrentListMap!785 (_keys!5523 thiss!1248) (_values!3638 thiss!1248) (mask!8595 thiss!1248) (extraKeys!3392 thiss!1248) (zeroValue!3496 thiss!1248) (minValue!3496 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3655 thiss!1248))) key!828) e!117193)))

(declare-fun b!177748 () Bool)

(assert (=> b!177748 (= e!117194 None!200)))

(assert (= (and d!53823 c!31836) b!177745))

(assert (= (and d!53823 (not c!31836)) b!177746))

(assert (= (and b!177746 c!31837) b!177747))

(assert (= (and b!177746 (not c!31837)) b!177748))

(declare-fun m!206251 () Bool)

(assert (=> b!177747 m!206251))

(assert (=> b!177484 d!53823))

(declare-fun d!53825 () Bool)

(assert (=> d!53825 (= (apply!141 lt!87730 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2021 (getValueByKey!196 (toList!1133 lt!87730) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7302 () Bool)

(assert (= bs!7302 d!53825))

(declare-fun m!206253 () Bool)

(assert (=> bs!7302 m!206253))

(assert (=> bs!7302 m!206253))

(declare-fun m!206255 () Bool)

(assert (=> bs!7302 m!206255))

(assert (=> b!177549 d!53825))

(declare-fun d!53827 () Bool)

(declare-fun e!117195 () Bool)

(assert (=> d!53827 e!117195))

(declare-fun res!84236 () Bool)

(assert (=> d!53827 (=> (not res!84236) (not e!117195))))

(declare-fun lt!87853 () ListLongMap!2235)

(assert (=> d!53827 (= res!84236 (contains!1199 lt!87853 (_1!1665 (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248)))))))

(declare-fun lt!87851 () List!2256)

(assert (=> d!53827 (= lt!87853 (ListLongMap!2236 lt!87851))))

(declare-fun lt!87850 () Unit!5424)

(declare-fun lt!87852 () Unit!5424)

(assert (=> d!53827 (= lt!87850 lt!87852)))

(assert (=> d!53827 (= (getValueByKey!196 lt!87851 (_1!1665 (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248)))) (Some!201 (_2!1665 (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248)))))))

(assert (=> d!53827 (= lt!87852 (lemmaContainsTupThenGetReturnValue!103 lt!87851 (_1!1665 (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248))) (_2!1665 (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248)))))))

(assert (=> d!53827 (= lt!87851 (insertStrictlySorted!106 (toList!1133 call!17959) (_1!1665 (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248))) (_2!1665 (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248)))))))

(assert (=> d!53827 (= (+!258 call!17959 (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248))) lt!87853)))

(declare-fun b!177749 () Bool)

(declare-fun res!84235 () Bool)

(assert (=> b!177749 (=> (not res!84235) (not e!117195))))

(assert (=> b!177749 (= res!84235 (= (getValueByKey!196 (toList!1133 lt!87853) (_1!1665 (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248)))) (Some!201 (_2!1665 (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248))))))))

(declare-fun b!177750 () Bool)

(assert (=> b!177750 (= e!117195 (contains!1200 (toList!1133 lt!87853) (tuple2!3309 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3496 thiss!1248))))))

(assert (= (and d!53827 res!84236) b!177749))

(assert (= (and b!177749 res!84235) b!177750))

(declare-fun m!206257 () Bool)

(assert (=> d!53827 m!206257))

(declare-fun m!206259 () Bool)

(assert (=> d!53827 m!206259))

(declare-fun m!206261 () Bool)

(assert (=> d!53827 m!206261))

(declare-fun m!206263 () Bool)

(assert (=> d!53827 m!206263))

(declare-fun m!206265 () Bool)

(assert (=> b!177749 m!206265))

(declare-fun m!206267 () Bool)

(assert (=> b!177750 m!206267))

(assert (=> b!177543 d!53827))

(declare-fun d!53829 () Bool)

(assert (=> d!53829 (= (apply!141 lt!87730 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2021 (getValueByKey!196 (toList!1133 lt!87730) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7303 () Bool)

(assert (= bs!7303 d!53829))

(assert (=> bs!7303 m!206213))

(assert (=> bs!7303 m!206213))

(declare-fun m!206269 () Bool)

(assert (=> bs!7303 m!206269))

(assert (=> b!177544 d!53829))

(assert (=> d!53751 d!53761))

(declare-fun d!53831 () Bool)

(declare-fun e!117206 () Bool)

(assert (=> d!53831 e!117206))

(declare-fun c!31845 () Bool)

(declare-fun lt!87859 () SeekEntryResult!568)

(assert (=> d!53831 (= c!31845 (and ((_ is Intermediate!568) lt!87859) (undefined!1380 lt!87859)))))

(declare-fun e!117210 () SeekEntryResult!568)

(assert (=> d!53831 (= lt!87859 e!117210)))

(declare-fun c!31844 () Bool)

(assert (=> d!53831 (= c!31844 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!87858 () (_ BitVec 64))

(assert (=> d!53831 (= lt!87858 (select (arr!3545 (_keys!5523 thiss!1248)) (toIndex!0 key!828 (mask!8595 thiss!1248))))))

(assert (=> d!53831 (validMask!0 (mask!8595 thiss!1248))))

(assert (=> d!53831 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8595 thiss!1248)) key!828 (_keys!5523 thiss!1248) (mask!8595 thiss!1248)) lt!87859)))

(declare-fun b!177769 () Bool)

(assert (=> b!177769 (and (bvsge (index!4442 lt!87859) #b00000000000000000000000000000000) (bvslt (index!4442 lt!87859) (size!3849 (_keys!5523 thiss!1248))))))

(declare-fun res!84245 () Bool)

(assert (=> b!177769 (= res!84245 (= (select (arr!3545 (_keys!5523 thiss!1248)) (index!4442 lt!87859)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117207 () Bool)

(assert (=> b!177769 (=> res!84245 e!117207)))

(declare-fun b!177770 () Bool)

(assert (=> b!177770 (= e!117206 (bvsge (x!19466 lt!87859) #b01111111111111111111111111111110))))

(declare-fun b!177771 () Bool)

(declare-fun e!117209 () SeekEntryResult!568)

(assert (=> b!177771 (= e!117210 e!117209)))

(declare-fun c!31846 () Bool)

(assert (=> b!177771 (= c!31846 (or (= lt!87858 key!828) (= (bvadd lt!87858 lt!87858) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177772 () Bool)

(assert (=> b!177772 (and (bvsge (index!4442 lt!87859) #b00000000000000000000000000000000) (bvslt (index!4442 lt!87859) (size!3849 (_keys!5523 thiss!1248))))))

(assert (=> b!177772 (= e!117207 (= (select (arr!3545 (_keys!5523 thiss!1248)) (index!4442 lt!87859)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177773 () Bool)

(declare-fun e!117208 () Bool)

(assert (=> b!177773 (= e!117206 e!117208)))

(declare-fun res!84244 () Bool)

(assert (=> b!177773 (= res!84244 (and ((_ is Intermediate!568) lt!87859) (not (undefined!1380 lt!87859)) (bvslt (x!19466 lt!87859) #b01111111111111111111111111111110) (bvsge (x!19466 lt!87859) #b00000000000000000000000000000000) (bvsge (x!19466 lt!87859) #b00000000000000000000000000000000)))))

(assert (=> b!177773 (=> (not res!84244) (not e!117208))))

(declare-fun b!177774 () Bool)

(assert (=> b!177774 (and (bvsge (index!4442 lt!87859) #b00000000000000000000000000000000) (bvslt (index!4442 lt!87859) (size!3849 (_keys!5523 thiss!1248))))))

(declare-fun res!84243 () Bool)

(assert (=> b!177774 (= res!84243 (= (select (arr!3545 (_keys!5523 thiss!1248)) (index!4442 lt!87859)) key!828))))

(assert (=> b!177774 (=> res!84243 e!117207)))

(assert (=> b!177774 (= e!117208 e!117207)))

(declare-fun b!177775 () Bool)

(assert (=> b!177775 (= e!117209 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8595 thiss!1248)) #b00000000000000000000000000000000 (mask!8595 thiss!1248)) key!828 (_keys!5523 thiss!1248) (mask!8595 thiss!1248)))))

(declare-fun b!177776 () Bool)

(assert (=> b!177776 (= e!117209 (Intermediate!568 false (toIndex!0 key!828 (mask!8595 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!177777 () Bool)

(assert (=> b!177777 (= e!117210 (Intermediate!568 true (toIndex!0 key!828 (mask!8595 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!53831 c!31844) b!177777))

(assert (= (and d!53831 (not c!31844)) b!177771))

(assert (= (and b!177771 c!31846) b!177776))

(assert (= (and b!177771 (not c!31846)) b!177775))

(assert (= (and d!53831 c!31845) b!177770))

(assert (= (and d!53831 (not c!31845)) b!177773))

(assert (= (and b!177773 res!84244) b!177774))

(assert (= (and b!177774 (not res!84243)) b!177769))

(assert (= (and b!177769 (not res!84245)) b!177772))

(assert (=> b!177775 m!206051))

(declare-fun m!206271 () Bool)

(assert (=> b!177775 m!206271))

(assert (=> b!177775 m!206271))

(declare-fun m!206273 () Bool)

(assert (=> b!177775 m!206273))

(declare-fun m!206275 () Bool)

(assert (=> b!177769 m!206275))

(assert (=> b!177774 m!206275))

(assert (=> b!177772 m!206275))

(assert (=> d!53831 m!206051))

(declare-fun m!206277 () Bool)

(assert (=> d!53831 m!206277))

(assert (=> d!53831 m!205955))

(assert (=> d!53753 d!53831))

(declare-fun d!53833 () Bool)

(declare-fun lt!87865 () (_ BitVec 32))

(declare-fun lt!87864 () (_ BitVec 32))

(assert (=> d!53833 (= lt!87865 (bvmul (bvxor lt!87864 (bvlshr lt!87864 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53833 (= lt!87864 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53833 (and (bvsge (mask!8595 thiss!1248) #b00000000000000000000000000000000) (let ((res!84246 (let ((h!2875 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19485 (bvmul (bvxor h!2875 (bvlshr h!2875 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19485 (bvlshr x!19485 #b00000000000000000000000000001101)) (mask!8595 thiss!1248)))))) (and (bvslt res!84246 (bvadd (mask!8595 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!84246 #b00000000000000000000000000000000))))))

(assert (=> d!53833 (= (toIndex!0 key!828 (mask!8595 thiss!1248)) (bvand (bvxor lt!87865 (bvlshr lt!87865 #b00000000000000000000000000001101)) (mask!8595 thiss!1248)))))

(assert (=> d!53753 d!53833))

(assert (=> d!53753 d!53761))

(assert (=> b!177486 d!53821))

(assert (=> b!177486 d!53823))

(declare-fun d!53835 () Bool)

(declare-fun e!117212 () Bool)

(assert (=> d!53835 e!117212))

(declare-fun res!84247 () Bool)

(assert (=> d!53835 (=> res!84247 e!117212)))

(declare-fun lt!87866 () Bool)

(assert (=> d!53835 (= res!84247 (not lt!87866))))

(declare-fun lt!87867 () Bool)

(assert (=> d!53835 (= lt!87866 lt!87867)))

(declare-fun lt!87868 () Unit!5424)

(declare-fun e!117211 () Unit!5424)

(assert (=> d!53835 (= lt!87868 e!117211)))

(declare-fun c!31847 () Bool)

(assert (=> d!53835 (= c!31847 lt!87867)))

(assert (=> d!53835 (= lt!87867 (containsKey!200 (toList!1133 lt!87730) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53835 (= (contains!1199 lt!87730 #b0000000000000000000000000000000000000000000000000000000000000000) lt!87866)))

(declare-fun b!177778 () Bool)

(declare-fun lt!87869 () Unit!5424)

(assert (=> b!177778 (= e!117211 lt!87869)))

(assert (=> b!177778 (= lt!87869 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1133 lt!87730) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177778 (isDefined!149 (getValueByKey!196 (toList!1133 lt!87730) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177779 () Bool)

(declare-fun Unit!5431 () Unit!5424)

(assert (=> b!177779 (= e!117211 Unit!5431)))

(declare-fun b!177780 () Bool)

(assert (=> b!177780 (= e!117212 (isDefined!149 (getValueByKey!196 (toList!1133 lt!87730) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53835 c!31847) b!177778))

(assert (= (and d!53835 (not c!31847)) b!177779))

(assert (= (and d!53835 (not res!84247)) b!177780))

(declare-fun m!206279 () Bool)

(assert (=> d!53835 m!206279))

(declare-fun m!206281 () Bool)

(assert (=> b!177778 m!206281))

(assert (=> b!177778 m!206253))

(assert (=> b!177778 m!206253))

(declare-fun m!206283 () Bool)

(assert (=> b!177778 m!206283))

(assert (=> b!177780 m!206253))

(assert (=> b!177780 m!206253))

(assert (=> b!177780 m!206283))

(assert (=> bm!17959 d!53835))

(declare-fun b!177781 () Bool)

(declare-fun e!117213 () Bool)

(assert (=> b!177781 (= e!117213 tp_is_empty!4161)))

(declare-fun b!177782 () Bool)

(declare-fun e!117214 () Bool)

(assert (=> b!177782 (= e!117214 tp_is_empty!4161)))

(declare-fun mapNonEmpty!7114 () Bool)

(declare-fun mapRes!7114 () Bool)

(declare-fun tp!15880 () Bool)

(assert (=> mapNonEmpty!7114 (= mapRes!7114 (and tp!15880 e!117213))))

(declare-fun mapValue!7114 () ValueCell!1737)

(declare-fun mapKey!7114 () (_ BitVec 32))

(declare-fun mapRest!7114 () (Array (_ BitVec 32) ValueCell!1737))

(assert (=> mapNonEmpty!7114 (= mapRest!7113 (store mapRest!7114 mapKey!7114 mapValue!7114))))

(declare-fun mapIsEmpty!7114 () Bool)

(assert (=> mapIsEmpty!7114 mapRes!7114))

(declare-fun condMapEmpty!7114 () Bool)

(declare-fun mapDefault!7114 () ValueCell!1737)

(assert (=> mapNonEmpty!7113 (= condMapEmpty!7114 (= mapRest!7113 ((as const (Array (_ BitVec 32) ValueCell!1737)) mapDefault!7114)))))

(assert (=> mapNonEmpty!7113 (= tp!15879 (and e!117214 mapRes!7114))))

(assert (= (and mapNonEmpty!7113 condMapEmpty!7114) mapIsEmpty!7114))

(assert (= (and mapNonEmpty!7113 (not condMapEmpty!7114)) mapNonEmpty!7114))

(assert (= (and mapNonEmpty!7114 ((_ is ValueCellFull!1737) mapValue!7114)) b!177781))

(assert (= (and mapNonEmpty!7113 ((_ is ValueCellFull!1737) mapDefault!7114)) b!177782))

(declare-fun m!206285 () Bool)

(assert (=> mapNonEmpty!7114 m!206285))

(declare-fun b_lambda!7063 () Bool)

(assert (= b_lambda!7059 (or (and b!177443 b_free!4389) b_lambda!7063)))

(declare-fun b_lambda!7065 () Bool)

(assert (= b_lambda!7061 (or (and b!177443 b_free!4389) b_lambda!7065)))

(check-sat (not b!177750) (not b!177638) (not b!177724) (not d!53797) (not b!177624) (not d!53807) (not b!177618) (not mapNonEmpty!7114) (not b!177775) (not b!177700) (not b!177736) (not d!53779) (not b!177679) (not b!177723) (not b!177633) (not d!53801) (not d!53793) (not b!177749) (not b!177656) (not d!53829) (not d!53787) (not bm!17965) (not d!53835) (not b!177592) (not b!177698) (not d!53825) (not b!177727) (not b_lambda!7057) (not b!177640) (not d!53777) (not bm!17971) (not b!177620) (not d!53763) (not d!53805) (not b!177675) (not b_next!4389) (not b!177634) (not b!177622) (not b_lambda!7065) (not d!53783) (not d!53773) (not d!53775) (not b!177733) (not bm!17974) (not b!177643) (not d!53831) (not b!177619) (not d!53769) b_and!10899 (not b!177639) (not b!177747) (not b!177694) (not b!177676) (not b!177623) tp_is_empty!4161 (not d!53765) (not d!53781) (not b!177710) (not b!177641) (not b!177657) (not b!177780) (not d!53827) (not bm!17968) (not d!53795) (not b!177627) (not d!53767) (not b!177677) (not d!53809) (not b!177778) (not b!177591) (not d!53785) (not d!53789) (not b!177621) (not b!177667) (not d!53791) (not b_lambda!7063) (not b!177642) (not b!177709) (not b!177646) (not b!177644) (not d!53821) (not d!53819) (not d!53771))
(check-sat b_and!10899 (not b_next!4389))
