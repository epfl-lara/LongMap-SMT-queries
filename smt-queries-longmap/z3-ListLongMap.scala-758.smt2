; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17752 () Bool)

(assert start!17752)

(declare-fun b!177470 () Bool)

(declare-fun b_free!4387 () Bool)

(declare-fun b_next!4387 () Bool)

(assert (=> b!177470 (= b_free!4387 (not b_next!4387))))

(declare-fun tp!15864 () Bool)

(declare-fun b_and!10903 () Bool)

(assert (=> b!177470 (= tp!15864 b_and!10903)))

(declare-fun mapNonEmpty!7104 () Bool)

(declare-fun mapRes!7104 () Bool)

(declare-fun tp!15863 () Bool)

(declare-fun e!117022 () Bool)

(assert (=> mapNonEmpty!7104 (= mapRes!7104 (and tp!15863 e!117022))))

(declare-fun mapKey!7104 () (_ BitVec 32))

(declare-datatypes ((V!5193 0))(
  ( (V!5194 (val!2124 Int)) )
))
(declare-datatypes ((ValueCell!1736 0))(
  ( (ValueCellFull!1736 (v!4006 V!5193)) (EmptyCell!1736) )
))
(declare-fun mapRest!7104 () (Array (_ BitVec 32) ValueCell!1736))

(declare-datatypes ((array!7457 0))(
  ( (array!7458 (arr!3536 (Array (_ BitVec 32) (_ BitVec 64))) (size!3840 (_ BitVec 32))) )
))
(declare-datatypes ((array!7459 0))(
  ( (array!7460 (arr!3537 (Array (_ BitVec 32) ValueCell!1736)) (size!3841 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2380 0))(
  ( (LongMapFixedSize!2381 (defaultEntry!3654 Int) (mask!8594 (_ BitVec 32)) (extraKeys!3391 (_ BitVec 32)) (zeroValue!3495 V!5193) (minValue!3495 V!5193) (_size!1239 (_ BitVec 32)) (_keys!5522 array!7457) (_values!3637 array!7459) (_vacant!1239 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2380)

(declare-fun mapValue!7104 () ValueCell!1736)

(assert (=> mapNonEmpty!7104 (= (arr!3537 (_values!3637 thiss!1248)) (store mapRest!7104 mapKey!7104 mapValue!7104))))

(declare-fun b!177462 () Bool)

(declare-fun res!84113 () Bool)

(declare-fun e!117023 () Bool)

(assert (=> b!177462 (=> (not res!84113) (not e!117023))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!565 0))(
  ( (MissingZero!565 (index!4428 (_ BitVec 32))) (Found!565 (index!4429 (_ BitVec 32))) (Intermediate!565 (undefined!1377 Bool) (index!4430 (_ BitVec 32)) (x!19463 (_ BitVec 32))) (Undefined!565) (MissingVacant!565 (index!4431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7457 (_ BitVec 32)) SeekEntryResult!565)

(assert (=> b!177462 (= res!84113 ((_ is Undefined!565) (seekEntryOrOpen!0 key!828 (_keys!5522 thiss!1248) (mask!8594 thiss!1248))))))

(declare-fun b!177463 () Bool)

(declare-fun res!84114 () Bool)

(assert (=> b!177463 (=> (not res!84114) (not e!117023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!177463 (= res!84114 (validMask!0 (mask!8594 thiss!1248)))))

(declare-fun b!177464 () Bool)

(assert (=> b!177464 (= e!117023 (not (= (size!3841 (_values!3637 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8594 thiss!1248)))))))

(declare-fun res!84115 () Bool)

(assert (=> start!17752 (=> (not res!84115) (not e!117023))))

(declare-fun valid!1018 (LongMapFixedSize!2380) Bool)

(assert (=> start!17752 (= res!84115 (valid!1018 thiss!1248))))

(assert (=> start!17752 e!117023))

(declare-fun e!117018 () Bool)

(assert (=> start!17752 e!117018))

(assert (=> start!17752 true))

(declare-fun b!177465 () Bool)

(declare-fun res!84116 () Bool)

(assert (=> b!177465 (=> (not res!84116) (not e!117023))))

(assert (=> b!177465 (= res!84116 (not (= key!828 (bvneg key!828))))))

(declare-fun b!177466 () Bool)

(declare-fun e!117019 () Bool)

(declare-fun e!117020 () Bool)

(assert (=> b!177466 (= e!117019 (and e!117020 mapRes!7104))))

(declare-fun condMapEmpty!7104 () Bool)

(declare-fun mapDefault!7104 () ValueCell!1736)

(assert (=> b!177466 (= condMapEmpty!7104 (= (arr!3537 (_values!3637 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1736)) mapDefault!7104)))))

(declare-fun mapIsEmpty!7104 () Bool)

(assert (=> mapIsEmpty!7104 mapRes!7104))

(declare-fun b!177467 () Bool)

(declare-fun tp_is_empty!4159 () Bool)

(assert (=> b!177467 (= e!117020 tp_is_empty!4159)))

(declare-fun b!177468 () Bool)

(assert (=> b!177468 (= e!117022 tp_is_empty!4159)))

(declare-fun b!177469 () Bool)

(declare-fun res!84112 () Bool)

(assert (=> b!177469 (=> (not res!84112) (not e!117023))))

(declare-datatypes ((tuple2!3258 0))(
  ( (tuple2!3259 (_1!1640 (_ BitVec 64)) (_2!1640 V!5193)) )
))
(declare-datatypes ((List!2229 0))(
  ( (Nil!2226) (Cons!2225 (h!2846 tuple2!3258) (t!7053 List!2229)) )
))
(declare-datatypes ((ListLongMap!2191 0))(
  ( (ListLongMap!2192 (toList!1111 List!2229)) )
))
(declare-fun contains!1188 (ListLongMap!2191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!766 (array!7457 array!7459 (_ BitVec 32) (_ BitVec 32) V!5193 V!5193 (_ BitVec 32) Int) ListLongMap!2191)

(assert (=> b!177469 (= res!84112 (not (contains!1188 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)) key!828)))))

(declare-fun array_inv!2285 (array!7457) Bool)

(declare-fun array_inv!2286 (array!7459) Bool)

(assert (=> b!177470 (= e!117018 (and tp!15864 tp_is_empty!4159 (array_inv!2285 (_keys!5522 thiss!1248)) (array_inv!2286 (_values!3637 thiss!1248)) e!117019))))

(assert (= (and start!17752 res!84115) b!177465))

(assert (= (and b!177465 res!84116) b!177462))

(assert (= (and b!177462 res!84113) b!177469))

(assert (= (and b!177469 res!84112) b!177463))

(assert (= (and b!177463 res!84114) b!177464))

(assert (= (and b!177466 condMapEmpty!7104) mapIsEmpty!7104))

(assert (= (and b!177466 (not condMapEmpty!7104)) mapNonEmpty!7104))

(assert (= (and mapNonEmpty!7104 ((_ is ValueCellFull!1736) mapValue!7104)) b!177468))

(assert (= (and b!177466 ((_ is ValueCellFull!1736) mapDefault!7104)) b!177467))

(assert (= b!177470 b!177466))

(assert (= start!17752 b!177470))

(declare-fun m!206113 () Bool)

(assert (=> b!177469 m!206113))

(assert (=> b!177469 m!206113))

(declare-fun m!206115 () Bool)

(assert (=> b!177469 m!206115))

(declare-fun m!206117 () Bool)

(assert (=> b!177463 m!206117))

(declare-fun m!206119 () Bool)

(assert (=> start!17752 m!206119))

(declare-fun m!206121 () Bool)

(assert (=> b!177470 m!206121))

(declare-fun m!206123 () Bool)

(assert (=> b!177470 m!206123))

(declare-fun m!206125 () Bool)

(assert (=> b!177462 m!206125))

(declare-fun m!206127 () Bool)

(assert (=> mapNonEmpty!7104 m!206127))

(check-sat (not b!177462) (not b!177470) b_and!10903 tp_is_empty!4159 (not b_next!4387) (not mapNonEmpty!7104) (not start!17752) (not b!177463) (not b!177469))
(check-sat b_and!10903 (not b_next!4387))
(get-model)

(declare-fun d!53823 () Bool)

(declare-fun e!117064 () Bool)

(assert (=> d!53823 e!117064))

(declare-fun res!84149 () Bool)

(assert (=> d!53823 (=> res!84149 e!117064)))

(declare-fun lt!87743 () Bool)

(assert (=> d!53823 (= res!84149 (not lt!87743))))

(declare-fun lt!87742 () Bool)

(assert (=> d!53823 (= lt!87743 lt!87742)))

(declare-datatypes ((Unit!5423 0))(
  ( (Unit!5424) )
))
(declare-fun lt!87741 () Unit!5423)

(declare-fun e!117065 () Unit!5423)

(assert (=> d!53823 (= lt!87741 e!117065)))

(declare-fun c!31778 () Bool)

(assert (=> d!53823 (= c!31778 lt!87742)))

(declare-fun containsKey!200 (List!2229 (_ BitVec 64)) Bool)

(assert (=> d!53823 (= lt!87742 (containsKey!200 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))

(assert (=> d!53823 (= (contains!1188 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)) key!828) lt!87743)))

(declare-fun b!177531 () Bool)

(declare-fun lt!87740 () Unit!5423)

(assert (=> b!177531 (= e!117065 lt!87740)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!148 (List!2229 (_ BitVec 64)) Unit!5423)

(assert (=> b!177531 (= lt!87740 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))

(declare-datatypes ((Option!203 0))(
  ( (Some!202 (v!4009 V!5193)) (None!201) )
))
(declare-fun isDefined!149 (Option!203) Bool)

(declare-fun getValueByKey!197 (List!2229 (_ BitVec 64)) Option!203)

(assert (=> b!177531 (isDefined!149 (getValueByKey!197 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))

(declare-fun b!177532 () Bool)

(declare-fun Unit!5425 () Unit!5423)

(assert (=> b!177532 (= e!117065 Unit!5425)))

(declare-fun b!177533 () Bool)

(assert (=> b!177533 (= e!117064 (isDefined!149 (getValueByKey!197 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828)))))

(assert (= (and d!53823 c!31778) b!177531))

(assert (= (and d!53823 (not c!31778)) b!177532))

(assert (= (and d!53823 (not res!84149)) b!177533))

(declare-fun m!206161 () Bool)

(assert (=> d!53823 m!206161))

(declare-fun m!206163 () Bool)

(assert (=> b!177531 m!206163))

(declare-fun m!206165 () Bool)

(assert (=> b!177531 m!206165))

(assert (=> b!177531 m!206165))

(declare-fun m!206167 () Bool)

(assert (=> b!177531 m!206167))

(assert (=> b!177533 m!206165))

(assert (=> b!177533 m!206165))

(assert (=> b!177533 m!206167))

(assert (=> b!177469 d!53823))

(declare-fun b!177576 () Bool)

(declare-fun e!117092 () ListLongMap!2191)

(declare-fun call!17951 () ListLongMap!2191)

(declare-fun +!258 (ListLongMap!2191 tuple2!3258) ListLongMap!2191)

(assert (=> b!177576 (= e!117092 (+!258 call!17951 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))

(declare-fun c!31792 () Bool)

(declare-fun call!17952 () ListLongMap!2191)

(declare-fun call!17947 () ListLongMap!2191)

(declare-fun c!31795 () Bool)

(declare-fun call!17953 () ListLongMap!2191)

(declare-fun bm!17944 () Bool)

(assert (=> bm!17944 (= call!17951 (+!258 (ite c!31795 call!17952 (ite c!31792 call!17947 call!17953)) (ite (or c!31795 c!31792) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))

(declare-fun b!177578 () Bool)

(declare-fun e!117103 () Unit!5423)

(declare-fun Unit!5426 () Unit!5423)

(assert (=> b!177578 (= e!117103 Unit!5426)))

(declare-fun b!177579 () Bool)

(declare-fun e!117096 () Bool)

(declare-fun call!17949 () Bool)

(assert (=> b!177579 (= e!117096 (not call!17949))))

(declare-fun bm!17945 () Bool)

(declare-fun call!17950 () Bool)

(declare-fun lt!87801 () ListLongMap!2191)

(assert (=> bm!17945 (= call!17950 (contains!1188 lt!87801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17946 () Bool)

(assert (=> bm!17946 (= call!17947 call!17952)))

(declare-fun bm!17947 () Bool)

(assert (=> bm!17947 (= call!17953 call!17947)))

(declare-fun b!177580 () Bool)

(declare-fun e!117104 () Bool)

(assert (=> b!177580 (= e!117096 e!117104)))

(declare-fun res!84171 () Bool)

(assert (=> b!177580 (= res!84171 call!17949)))

(assert (=> b!177580 (=> (not res!84171) (not e!117104))))

(declare-fun b!177581 () Bool)

(declare-fun e!117099 () Bool)

(declare-fun apply!141 (ListLongMap!2191 (_ BitVec 64)) V!5193)

(assert (=> b!177581 (= e!117099 (= (apply!141 lt!87801 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3495 thiss!1248)))))

(declare-fun b!177582 () Bool)

(declare-fun e!117095 () Bool)

(assert (=> b!177582 (= e!117095 e!117096)))

(declare-fun c!31791 () Bool)

(assert (=> b!177582 (= c!31791 (not (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177583 () Bool)

(declare-fun e!117102 () Bool)

(declare-fun e!117097 () Bool)

(assert (=> b!177583 (= e!117102 e!117097)))

(declare-fun res!84170 () Bool)

(assert (=> b!177583 (=> (not res!84170) (not e!117097))))

(assert (=> b!177583 (= res!84170 (contains!1188 lt!87801 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177583 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))))))

(declare-fun b!177584 () Bool)

(declare-fun res!84174 () Bool)

(assert (=> b!177584 (=> (not res!84174) (not e!117095))))

(assert (=> b!177584 (= res!84174 e!117102)))

(declare-fun res!84168 () Bool)

(assert (=> b!177584 (=> res!84168 e!117102)))

(declare-fun e!117098 () Bool)

(assert (=> b!177584 (= res!84168 (not e!117098))))

(declare-fun res!84169 () Bool)

(assert (=> b!177584 (=> (not res!84169) (not e!117098))))

(assert (=> b!177584 (= res!84169 (bvslt #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))))))

(declare-fun b!177585 () Bool)

(declare-fun get!2026 (ValueCell!1736 V!5193) V!5193)

(declare-fun dynLambda!484 (Int (_ BitVec 64)) V!5193)

(assert (=> b!177585 (= e!117097 (= (apply!141 lt!87801 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)) (get!2026 (select (arr!3537 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177585 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3841 (_values!3637 thiss!1248))))))

(assert (=> b!177585 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))))))

(declare-fun b!177577 () Bool)

(declare-fun res!84172 () Bool)

(assert (=> b!177577 (=> (not res!84172) (not e!117095))))

(declare-fun e!117094 () Bool)

(assert (=> b!177577 (= res!84172 e!117094)))

(declare-fun c!31793 () Bool)

(assert (=> b!177577 (= c!31793 (not (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!53825 () Bool)

(assert (=> d!53825 e!117095))

(declare-fun res!84173 () Bool)

(assert (=> d!53825 (=> (not res!84173) (not e!117095))))

(assert (=> d!53825 (= res!84173 (or (bvsge #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))))))))

(declare-fun lt!87804 () ListLongMap!2191)

(assert (=> d!53825 (= lt!87801 lt!87804)))

(declare-fun lt!87805 () Unit!5423)

(assert (=> d!53825 (= lt!87805 e!117103)))

(declare-fun c!31794 () Bool)

(declare-fun e!117100 () Bool)

(assert (=> d!53825 (= c!31794 e!117100)))

(declare-fun res!84176 () Bool)

(assert (=> d!53825 (=> (not res!84176) (not e!117100))))

(assert (=> d!53825 (= res!84176 (bvslt #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))))))

(assert (=> d!53825 (= lt!87804 e!117092)))

(assert (=> d!53825 (= c!31795 (and (not (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53825 (validMask!0 (mask!8594 thiss!1248))))

(assert (=> d!53825 (= (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)) lt!87801)))

(declare-fun b!177586 () Bool)

(declare-fun c!31796 () Bool)

(assert (=> b!177586 (= c!31796 (and (not (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!117101 () ListLongMap!2191)

(declare-fun e!117093 () ListLongMap!2191)

(assert (=> b!177586 (= e!117101 e!117093)))

(declare-fun bm!17948 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!172 (array!7457 array!7459 (_ BitVec 32) (_ BitVec 32) V!5193 V!5193 (_ BitVec 32) Int) ListLongMap!2191)

(assert (=> bm!17948 (= call!17952 (getCurrentListMapNoExtraKeys!172 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))

(declare-fun bm!17949 () Bool)

(declare-fun call!17948 () ListLongMap!2191)

(assert (=> bm!17949 (= call!17948 call!17951)))

(declare-fun b!177587 () Bool)

(assert (=> b!177587 (= e!117094 e!117099)))

(declare-fun res!84175 () Bool)

(assert (=> b!177587 (= res!84175 call!17950)))

(assert (=> b!177587 (=> (not res!84175) (not e!117099))))

(declare-fun b!177588 () Bool)

(assert (=> b!177588 (= e!117093 call!17953)))

(declare-fun b!177589 () Bool)

(assert (=> b!177589 (= e!117104 (= (apply!141 lt!87801 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3495 thiss!1248)))))

(declare-fun bm!17950 () Bool)

(assert (=> bm!17950 (= call!17949 (contains!1188 lt!87801 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177590 () Bool)

(assert (=> b!177590 (= e!117093 call!17948)))

(declare-fun b!177591 () Bool)

(assert (=> b!177591 (= e!117101 call!17948)))

(declare-fun b!177592 () Bool)

(declare-fun lt!87802 () Unit!5423)

(assert (=> b!177592 (= e!117103 lt!87802)))

(declare-fun lt!87796 () ListLongMap!2191)

(assert (=> b!177592 (= lt!87796 (getCurrentListMapNoExtraKeys!172 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))

(declare-fun lt!87791 () (_ BitVec 64))

(assert (=> b!177592 (= lt!87791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87799 () (_ BitVec 64))

(assert (=> b!177592 (= lt!87799 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87806 () Unit!5423)

(declare-fun addStillContains!117 (ListLongMap!2191 (_ BitVec 64) V!5193 (_ BitVec 64)) Unit!5423)

(assert (=> b!177592 (= lt!87806 (addStillContains!117 lt!87796 lt!87791 (zeroValue!3495 thiss!1248) lt!87799))))

(assert (=> b!177592 (contains!1188 (+!258 lt!87796 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248))) lt!87799)))

(declare-fun lt!87795 () Unit!5423)

(assert (=> b!177592 (= lt!87795 lt!87806)))

(declare-fun lt!87793 () ListLongMap!2191)

(assert (=> b!177592 (= lt!87793 (getCurrentListMapNoExtraKeys!172 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))

(declare-fun lt!87797 () (_ BitVec 64))

(assert (=> b!177592 (= lt!87797 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87809 () (_ BitVec 64))

(assert (=> b!177592 (= lt!87809 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87788 () Unit!5423)

(declare-fun addApplyDifferent!117 (ListLongMap!2191 (_ BitVec 64) V!5193 (_ BitVec 64)) Unit!5423)

(assert (=> b!177592 (= lt!87788 (addApplyDifferent!117 lt!87793 lt!87797 (minValue!3495 thiss!1248) lt!87809))))

(assert (=> b!177592 (= (apply!141 (+!258 lt!87793 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248))) lt!87809) (apply!141 lt!87793 lt!87809))))

(declare-fun lt!87803 () Unit!5423)

(assert (=> b!177592 (= lt!87803 lt!87788)))

(declare-fun lt!87792 () ListLongMap!2191)

(assert (=> b!177592 (= lt!87792 (getCurrentListMapNoExtraKeys!172 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))

(declare-fun lt!87790 () (_ BitVec 64))

(assert (=> b!177592 (= lt!87790 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87789 () (_ BitVec 64))

(assert (=> b!177592 (= lt!87789 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87794 () Unit!5423)

(assert (=> b!177592 (= lt!87794 (addApplyDifferent!117 lt!87792 lt!87790 (zeroValue!3495 thiss!1248) lt!87789))))

(assert (=> b!177592 (= (apply!141 (+!258 lt!87792 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248))) lt!87789) (apply!141 lt!87792 lt!87789))))

(declare-fun lt!87808 () Unit!5423)

(assert (=> b!177592 (= lt!87808 lt!87794)))

(declare-fun lt!87807 () ListLongMap!2191)

(assert (=> b!177592 (= lt!87807 (getCurrentListMapNoExtraKeys!172 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))

(declare-fun lt!87798 () (_ BitVec 64))

(assert (=> b!177592 (= lt!87798 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87800 () (_ BitVec 64))

(assert (=> b!177592 (= lt!87800 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177592 (= lt!87802 (addApplyDifferent!117 lt!87807 lt!87798 (minValue!3495 thiss!1248) lt!87800))))

(assert (=> b!177592 (= (apply!141 (+!258 lt!87807 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248))) lt!87800) (apply!141 lt!87807 lt!87800))))

(declare-fun b!177593 () Bool)

(assert (=> b!177593 (= e!117094 (not call!17950))))

(declare-fun b!177594 () Bool)

(assert (=> b!177594 (= e!117092 e!117101)))

(assert (=> b!177594 (= c!31792 (and (not (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177595 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!177595 (= e!117098 (validKeyInArray!0 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177596 () Bool)

(assert (=> b!177596 (= e!117100 (validKeyInArray!0 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53825 c!31795) b!177576))

(assert (= (and d!53825 (not c!31795)) b!177594))

(assert (= (and b!177594 c!31792) b!177591))

(assert (= (and b!177594 (not c!31792)) b!177586))

(assert (= (and b!177586 c!31796) b!177590))

(assert (= (and b!177586 (not c!31796)) b!177588))

(assert (= (or b!177590 b!177588) bm!17947))

(assert (= (or b!177591 bm!17947) bm!17946))

(assert (= (or b!177591 b!177590) bm!17949))

(assert (= (or b!177576 bm!17946) bm!17948))

(assert (= (or b!177576 bm!17949) bm!17944))

(assert (= (and d!53825 res!84176) b!177596))

(assert (= (and d!53825 c!31794) b!177592))

(assert (= (and d!53825 (not c!31794)) b!177578))

(assert (= (and d!53825 res!84173) b!177584))

(assert (= (and b!177584 res!84169) b!177595))

(assert (= (and b!177584 (not res!84168)) b!177583))

(assert (= (and b!177583 res!84170) b!177585))

(assert (= (and b!177584 res!84174) b!177577))

(assert (= (and b!177577 c!31793) b!177587))

(assert (= (and b!177577 (not c!31793)) b!177593))

(assert (= (and b!177587 res!84175) b!177581))

(assert (= (or b!177587 b!177593) bm!17945))

(assert (= (and b!177577 res!84172) b!177582))

(assert (= (and b!177582 c!31791) b!177580))

(assert (= (and b!177582 (not c!31791)) b!177579))

(assert (= (and b!177580 res!84171) b!177589))

(assert (= (or b!177580 b!177579) bm!17950))

(declare-fun b_lambda!7077 () Bool)

(assert (=> (not b_lambda!7077) (not b!177585)))

(declare-fun t!7057 () Bool)

(declare-fun tb!2785 () Bool)

(assert (=> (and b!177470 (= (defaultEntry!3654 thiss!1248) (defaultEntry!3654 thiss!1248)) t!7057) tb!2785))

(declare-fun result!4645 () Bool)

(assert (=> tb!2785 (= result!4645 tp_is_empty!4159)))

(assert (=> b!177585 t!7057))

(declare-fun b_and!10909 () Bool)

(assert (= b_and!10903 (and (=> t!7057 result!4645) b_and!10909)))

(declare-fun m!206169 () Bool)

(assert (=> b!177595 m!206169))

(assert (=> b!177595 m!206169))

(declare-fun m!206171 () Bool)

(assert (=> b!177595 m!206171))

(declare-fun m!206173 () Bool)

(assert (=> b!177581 m!206173))

(declare-fun m!206175 () Bool)

(assert (=> bm!17948 m!206175))

(declare-fun m!206177 () Bool)

(assert (=> bm!17944 m!206177))

(declare-fun m!206179 () Bool)

(assert (=> b!177589 m!206179))

(assert (=> d!53825 m!206117))

(declare-fun m!206181 () Bool)

(assert (=> bm!17945 m!206181))

(declare-fun m!206183 () Bool)

(assert (=> b!177592 m!206183))

(declare-fun m!206185 () Bool)

(assert (=> b!177592 m!206185))

(assert (=> b!177592 m!206169))

(declare-fun m!206187 () Bool)

(assert (=> b!177592 m!206187))

(declare-fun m!206189 () Bool)

(assert (=> b!177592 m!206189))

(declare-fun m!206191 () Bool)

(assert (=> b!177592 m!206191))

(declare-fun m!206193 () Bool)

(assert (=> b!177592 m!206193))

(declare-fun m!206195 () Bool)

(assert (=> b!177592 m!206195))

(assert (=> b!177592 m!206195))

(declare-fun m!206197 () Bool)

(assert (=> b!177592 m!206197))

(assert (=> b!177592 m!206175))

(declare-fun m!206199 () Bool)

(assert (=> b!177592 m!206199))

(declare-fun m!206201 () Bool)

(assert (=> b!177592 m!206201))

(declare-fun m!206203 () Bool)

(assert (=> b!177592 m!206203))

(declare-fun m!206205 () Bool)

(assert (=> b!177592 m!206205))

(assert (=> b!177592 m!206203))

(declare-fun m!206207 () Bool)

(assert (=> b!177592 m!206207))

(declare-fun m!206209 () Bool)

(assert (=> b!177592 m!206209))

(assert (=> b!177592 m!206191))

(declare-fun m!206211 () Bool)

(assert (=> b!177592 m!206211))

(assert (=> b!177592 m!206183))

(assert (=> b!177596 m!206169))

(assert (=> b!177596 m!206169))

(assert (=> b!177596 m!206171))

(declare-fun m!206213 () Bool)

(assert (=> bm!17950 m!206213))

(assert (=> b!177583 m!206169))

(assert (=> b!177583 m!206169))

(declare-fun m!206215 () Bool)

(assert (=> b!177583 m!206215))

(assert (=> b!177585 m!206169))

(declare-fun m!206217 () Bool)

(assert (=> b!177585 m!206217))

(assert (=> b!177585 m!206217))

(declare-fun m!206219 () Bool)

(assert (=> b!177585 m!206219))

(declare-fun m!206221 () Bool)

(assert (=> b!177585 m!206221))

(assert (=> b!177585 m!206169))

(declare-fun m!206223 () Bool)

(assert (=> b!177585 m!206223))

(assert (=> b!177585 m!206219))

(declare-fun m!206225 () Bool)

(assert (=> b!177576 m!206225))

(assert (=> b!177469 d!53825))

(declare-fun d!53827 () Bool)

(assert (=> d!53827 (= (array_inv!2285 (_keys!5522 thiss!1248)) (bvsge (size!3840 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177470 d!53827))

(declare-fun d!53829 () Bool)

(assert (=> d!53829 (= (array_inv!2286 (_values!3637 thiss!1248)) (bvsge (size!3841 (_values!3637 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177470 d!53829))

(declare-fun d!53831 () Bool)

(declare-fun lt!87817 () SeekEntryResult!565)

(assert (=> d!53831 (and (or ((_ is Undefined!565) lt!87817) (not ((_ is Found!565) lt!87817)) (and (bvsge (index!4429 lt!87817) #b00000000000000000000000000000000) (bvslt (index!4429 lt!87817) (size!3840 (_keys!5522 thiss!1248))))) (or ((_ is Undefined!565) lt!87817) ((_ is Found!565) lt!87817) (not ((_ is MissingZero!565) lt!87817)) (and (bvsge (index!4428 lt!87817) #b00000000000000000000000000000000) (bvslt (index!4428 lt!87817) (size!3840 (_keys!5522 thiss!1248))))) (or ((_ is Undefined!565) lt!87817) ((_ is Found!565) lt!87817) ((_ is MissingZero!565) lt!87817) (not ((_ is MissingVacant!565) lt!87817)) (and (bvsge (index!4431 lt!87817) #b00000000000000000000000000000000) (bvslt (index!4431 lt!87817) (size!3840 (_keys!5522 thiss!1248))))) (or ((_ is Undefined!565) lt!87817) (ite ((_ is Found!565) lt!87817) (= (select (arr!3536 (_keys!5522 thiss!1248)) (index!4429 lt!87817)) key!828) (ite ((_ is MissingZero!565) lt!87817) (= (select (arr!3536 (_keys!5522 thiss!1248)) (index!4428 lt!87817)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!565) lt!87817) (= (select (arr!3536 (_keys!5522 thiss!1248)) (index!4431 lt!87817)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!117111 () SeekEntryResult!565)

(assert (=> d!53831 (= lt!87817 e!117111)))

(declare-fun c!31805 () Bool)

(declare-fun lt!87818 () SeekEntryResult!565)

(assert (=> d!53831 (= c!31805 (and ((_ is Intermediate!565) lt!87818) (undefined!1377 lt!87818)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7457 (_ BitVec 32)) SeekEntryResult!565)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53831 (= lt!87818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8594 thiss!1248)) key!828 (_keys!5522 thiss!1248) (mask!8594 thiss!1248)))))

(assert (=> d!53831 (validMask!0 (mask!8594 thiss!1248))))

(assert (=> d!53831 (= (seekEntryOrOpen!0 key!828 (_keys!5522 thiss!1248) (mask!8594 thiss!1248)) lt!87817)))

(declare-fun b!177611 () Bool)

(declare-fun c!31803 () Bool)

(declare-fun lt!87816 () (_ BitVec 64))

(assert (=> b!177611 (= c!31803 (= lt!87816 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117113 () SeekEntryResult!565)

(declare-fun e!117112 () SeekEntryResult!565)

(assert (=> b!177611 (= e!117113 e!117112)))

(declare-fun b!177612 () Bool)

(assert (=> b!177612 (= e!117112 (MissingZero!565 (index!4430 lt!87818)))))

(declare-fun b!177613 () Bool)

(assert (=> b!177613 (= e!117113 (Found!565 (index!4430 lt!87818)))))

(declare-fun b!177614 () Bool)

(assert (=> b!177614 (= e!117111 e!117113)))

(assert (=> b!177614 (= lt!87816 (select (arr!3536 (_keys!5522 thiss!1248)) (index!4430 lt!87818)))))

(declare-fun c!31804 () Bool)

(assert (=> b!177614 (= c!31804 (= lt!87816 key!828))))

(declare-fun b!177615 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7457 (_ BitVec 32)) SeekEntryResult!565)

(assert (=> b!177615 (= e!117112 (seekKeyOrZeroReturnVacant!0 (x!19463 lt!87818) (index!4430 lt!87818) (index!4430 lt!87818) key!828 (_keys!5522 thiss!1248) (mask!8594 thiss!1248)))))

(declare-fun b!177616 () Bool)

(assert (=> b!177616 (= e!117111 Undefined!565)))

(assert (= (and d!53831 c!31805) b!177616))

(assert (= (and d!53831 (not c!31805)) b!177614))

(assert (= (and b!177614 c!31804) b!177613))

(assert (= (and b!177614 (not c!31804)) b!177611))

(assert (= (and b!177611 c!31803) b!177612))

(assert (= (and b!177611 (not c!31803)) b!177615))

(declare-fun m!206227 () Bool)

(assert (=> d!53831 m!206227))

(declare-fun m!206229 () Bool)

(assert (=> d!53831 m!206229))

(assert (=> d!53831 m!206117))

(declare-fun m!206231 () Bool)

(assert (=> d!53831 m!206231))

(declare-fun m!206233 () Bool)

(assert (=> d!53831 m!206233))

(declare-fun m!206235 () Bool)

(assert (=> d!53831 m!206235))

(assert (=> d!53831 m!206233))

(declare-fun m!206237 () Bool)

(assert (=> b!177614 m!206237))

(declare-fun m!206239 () Bool)

(assert (=> b!177615 m!206239))

(assert (=> b!177462 d!53831))

(declare-fun d!53833 () Bool)

(assert (=> d!53833 (= (validMask!0 (mask!8594 thiss!1248)) (and (or (= (mask!8594 thiss!1248) #b00000000000000000000000000000111) (= (mask!8594 thiss!1248) #b00000000000000000000000000001111) (= (mask!8594 thiss!1248) #b00000000000000000000000000011111) (= (mask!8594 thiss!1248) #b00000000000000000000000000111111) (= (mask!8594 thiss!1248) #b00000000000000000000000001111111) (= (mask!8594 thiss!1248) #b00000000000000000000000011111111) (= (mask!8594 thiss!1248) #b00000000000000000000000111111111) (= (mask!8594 thiss!1248) #b00000000000000000000001111111111) (= (mask!8594 thiss!1248) #b00000000000000000000011111111111) (= (mask!8594 thiss!1248) #b00000000000000000000111111111111) (= (mask!8594 thiss!1248) #b00000000000000000001111111111111) (= (mask!8594 thiss!1248) #b00000000000000000011111111111111) (= (mask!8594 thiss!1248) #b00000000000000000111111111111111) (= (mask!8594 thiss!1248) #b00000000000000001111111111111111) (= (mask!8594 thiss!1248) #b00000000000000011111111111111111) (= (mask!8594 thiss!1248) #b00000000000000111111111111111111) (= (mask!8594 thiss!1248) #b00000000000001111111111111111111) (= (mask!8594 thiss!1248) #b00000000000011111111111111111111) (= (mask!8594 thiss!1248) #b00000000000111111111111111111111) (= (mask!8594 thiss!1248) #b00000000001111111111111111111111) (= (mask!8594 thiss!1248) #b00000000011111111111111111111111) (= (mask!8594 thiss!1248) #b00000000111111111111111111111111) (= (mask!8594 thiss!1248) #b00000001111111111111111111111111) (= (mask!8594 thiss!1248) #b00000011111111111111111111111111) (= (mask!8594 thiss!1248) #b00000111111111111111111111111111) (= (mask!8594 thiss!1248) #b00001111111111111111111111111111) (= (mask!8594 thiss!1248) #b00011111111111111111111111111111) (= (mask!8594 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8594 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!177463 d!53833))

(declare-fun d!53835 () Bool)

(declare-fun res!84183 () Bool)

(declare-fun e!117116 () Bool)

(assert (=> d!53835 (=> (not res!84183) (not e!117116))))

(declare-fun simpleValid!155 (LongMapFixedSize!2380) Bool)

(assert (=> d!53835 (= res!84183 (simpleValid!155 thiss!1248))))

(assert (=> d!53835 (= (valid!1018 thiss!1248) e!117116)))

(declare-fun b!177623 () Bool)

(declare-fun res!84184 () Bool)

(assert (=> b!177623 (=> (not res!84184) (not e!117116))))

(declare-fun arrayCountValidKeys!0 (array!7457 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177623 (= res!84184 (= (arrayCountValidKeys!0 (_keys!5522 thiss!1248) #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))) (_size!1239 thiss!1248)))))

(declare-fun b!177624 () Bool)

(declare-fun res!84185 () Bool)

(assert (=> b!177624 (=> (not res!84185) (not e!117116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7457 (_ BitVec 32)) Bool)

(assert (=> b!177624 (= res!84185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5522 thiss!1248) (mask!8594 thiss!1248)))))

(declare-fun b!177625 () Bool)

(declare-datatypes ((List!2232 0))(
  ( (Nil!2229) (Cons!2228 (h!2849 (_ BitVec 64)) (t!7058 List!2232)) )
))
(declare-fun arrayNoDuplicates!0 (array!7457 (_ BitVec 32) List!2232) Bool)

(assert (=> b!177625 (= e!117116 (arrayNoDuplicates!0 (_keys!5522 thiss!1248) #b00000000000000000000000000000000 Nil!2229))))

(assert (= (and d!53835 res!84183) b!177623))

(assert (= (and b!177623 res!84184) b!177624))

(assert (= (and b!177624 res!84185) b!177625))

(declare-fun m!206241 () Bool)

(assert (=> d!53835 m!206241))

(declare-fun m!206243 () Bool)

(assert (=> b!177623 m!206243))

(declare-fun m!206245 () Bool)

(assert (=> b!177624 m!206245))

(declare-fun m!206247 () Bool)

(assert (=> b!177625 m!206247))

(assert (=> start!17752 d!53835))

(declare-fun mapNonEmpty!7113 () Bool)

(declare-fun mapRes!7113 () Bool)

(declare-fun tp!15879 () Bool)

(declare-fun e!117122 () Bool)

(assert (=> mapNonEmpty!7113 (= mapRes!7113 (and tp!15879 e!117122))))

(declare-fun mapValue!7113 () ValueCell!1736)

(declare-fun mapRest!7113 () (Array (_ BitVec 32) ValueCell!1736))

(declare-fun mapKey!7113 () (_ BitVec 32))

(assert (=> mapNonEmpty!7113 (= mapRest!7104 (store mapRest!7113 mapKey!7113 mapValue!7113))))

(declare-fun mapIsEmpty!7113 () Bool)

(assert (=> mapIsEmpty!7113 mapRes!7113))

(declare-fun b!177632 () Bool)

(assert (=> b!177632 (= e!117122 tp_is_empty!4159)))

(declare-fun b!177633 () Bool)

(declare-fun e!117121 () Bool)

(assert (=> b!177633 (= e!117121 tp_is_empty!4159)))

(declare-fun condMapEmpty!7113 () Bool)

(declare-fun mapDefault!7113 () ValueCell!1736)

(assert (=> mapNonEmpty!7104 (= condMapEmpty!7113 (= mapRest!7104 ((as const (Array (_ BitVec 32) ValueCell!1736)) mapDefault!7113)))))

(assert (=> mapNonEmpty!7104 (= tp!15863 (and e!117121 mapRes!7113))))

(assert (= (and mapNonEmpty!7104 condMapEmpty!7113) mapIsEmpty!7113))

(assert (= (and mapNonEmpty!7104 (not condMapEmpty!7113)) mapNonEmpty!7113))

(assert (= (and mapNonEmpty!7113 ((_ is ValueCellFull!1736) mapValue!7113)) b!177632))

(assert (= (and mapNonEmpty!7104 ((_ is ValueCellFull!1736) mapDefault!7113)) b!177633))

(declare-fun m!206249 () Bool)

(assert (=> mapNonEmpty!7113 m!206249))

(declare-fun b_lambda!7079 () Bool)

(assert (= b_lambda!7077 (or (and b!177470 b_free!4387) b_lambda!7079)))

(check-sat (not bm!17950) (not b!177533) (not b!177625) (not d!53831) (not b!177624) (not d!53823) (not b!177596) (not b_next!4387) (not d!53825) (not b!177595) (not d!53835) (not b_lambda!7079) (not bm!17944) (not bm!17948) (not bm!17945) (not mapNonEmpty!7113) (not b!177576) (not b!177592) (not b!177581) (not b!177583) (not b!177531) tp_is_empty!4159 (not b!177623) (not b!177585) b_and!10909 (not b!177589) (not b!177615))
(check-sat b_and!10909 (not b_next!4387))
(get-model)

(declare-fun b!177646 () Bool)

(declare-fun e!117129 () SeekEntryResult!565)

(assert (=> b!177646 (= e!117129 Undefined!565)))

(declare-fun b!177647 () Bool)

(declare-fun c!31814 () Bool)

(declare-fun lt!87824 () (_ BitVec 64))

(assert (=> b!177647 (= c!31814 (= lt!87824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117130 () SeekEntryResult!565)

(declare-fun e!117131 () SeekEntryResult!565)

(assert (=> b!177647 (= e!117130 e!117131)))

(declare-fun b!177648 () Bool)

(assert (=> b!177648 (= e!117130 (Found!565 (index!4430 lt!87818)))))

(declare-fun b!177649 () Bool)

(assert (=> b!177649 (= e!117131 (MissingVacant!565 (index!4430 lt!87818)))))

(declare-fun d!53837 () Bool)

(declare-fun lt!87823 () SeekEntryResult!565)

(assert (=> d!53837 (and (or ((_ is Undefined!565) lt!87823) (not ((_ is Found!565) lt!87823)) (and (bvsge (index!4429 lt!87823) #b00000000000000000000000000000000) (bvslt (index!4429 lt!87823) (size!3840 (_keys!5522 thiss!1248))))) (or ((_ is Undefined!565) lt!87823) ((_ is Found!565) lt!87823) (not ((_ is MissingVacant!565) lt!87823)) (not (= (index!4431 lt!87823) (index!4430 lt!87818))) (and (bvsge (index!4431 lt!87823) #b00000000000000000000000000000000) (bvslt (index!4431 lt!87823) (size!3840 (_keys!5522 thiss!1248))))) (or ((_ is Undefined!565) lt!87823) (ite ((_ is Found!565) lt!87823) (= (select (arr!3536 (_keys!5522 thiss!1248)) (index!4429 lt!87823)) key!828) (and ((_ is MissingVacant!565) lt!87823) (= (index!4431 lt!87823) (index!4430 lt!87818)) (= (select (arr!3536 (_keys!5522 thiss!1248)) (index!4431 lt!87823)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53837 (= lt!87823 e!117129)))

(declare-fun c!31813 () Bool)

(assert (=> d!53837 (= c!31813 (bvsge (x!19463 lt!87818) #b01111111111111111111111111111110))))

(assert (=> d!53837 (= lt!87824 (select (arr!3536 (_keys!5522 thiss!1248)) (index!4430 lt!87818)))))

(assert (=> d!53837 (validMask!0 (mask!8594 thiss!1248))))

(assert (=> d!53837 (= (seekKeyOrZeroReturnVacant!0 (x!19463 lt!87818) (index!4430 lt!87818) (index!4430 lt!87818) key!828 (_keys!5522 thiss!1248) (mask!8594 thiss!1248)) lt!87823)))

(declare-fun b!177650 () Bool)

(assert (=> b!177650 (= e!117129 e!117130)))

(declare-fun c!31812 () Bool)

(assert (=> b!177650 (= c!31812 (= lt!87824 key!828))))

(declare-fun b!177651 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177651 (= e!117131 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19463 lt!87818) #b00000000000000000000000000000001) (nextIndex!0 (index!4430 lt!87818) (bvadd (x!19463 lt!87818) #b00000000000000000000000000000001) (mask!8594 thiss!1248)) (index!4430 lt!87818) key!828 (_keys!5522 thiss!1248) (mask!8594 thiss!1248)))))

(assert (= (and d!53837 c!31813) b!177646))

(assert (= (and d!53837 (not c!31813)) b!177650))

(assert (= (and b!177650 c!31812) b!177648))

(assert (= (and b!177650 (not c!31812)) b!177647))

(assert (= (and b!177647 c!31814) b!177649))

(assert (= (and b!177647 (not c!31814)) b!177651))

(declare-fun m!206251 () Bool)

(assert (=> d!53837 m!206251))

(declare-fun m!206253 () Bool)

(assert (=> d!53837 m!206253))

(assert (=> d!53837 m!206237))

(assert (=> d!53837 m!206117))

(declare-fun m!206255 () Bool)

(assert (=> b!177651 m!206255))

(assert (=> b!177651 m!206255))

(declare-fun m!206257 () Bool)

(assert (=> b!177651 m!206257))

(assert (=> b!177615 d!53837))

(declare-fun d!53839 () Bool)

(declare-fun e!117132 () Bool)

(assert (=> d!53839 e!117132))

(declare-fun res!84186 () Bool)

(assert (=> d!53839 (=> res!84186 e!117132)))

(declare-fun lt!87828 () Bool)

(assert (=> d!53839 (= res!84186 (not lt!87828))))

(declare-fun lt!87827 () Bool)

(assert (=> d!53839 (= lt!87828 lt!87827)))

(declare-fun lt!87826 () Unit!5423)

(declare-fun e!117133 () Unit!5423)

(assert (=> d!53839 (= lt!87826 e!117133)))

(declare-fun c!31815 () Bool)

(assert (=> d!53839 (= c!31815 lt!87827)))

(assert (=> d!53839 (= lt!87827 (containsKey!200 (toList!1111 lt!87801) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53839 (= (contains!1188 lt!87801 #b0000000000000000000000000000000000000000000000000000000000000000) lt!87828)))

(declare-fun b!177652 () Bool)

(declare-fun lt!87825 () Unit!5423)

(assert (=> b!177652 (= e!117133 lt!87825)))

(assert (=> b!177652 (= lt!87825 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1111 lt!87801) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177652 (isDefined!149 (getValueByKey!197 (toList!1111 lt!87801) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177653 () Bool)

(declare-fun Unit!5427 () Unit!5423)

(assert (=> b!177653 (= e!117133 Unit!5427)))

(declare-fun b!177654 () Bool)

(assert (=> b!177654 (= e!117132 (isDefined!149 (getValueByKey!197 (toList!1111 lt!87801) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53839 c!31815) b!177652))

(assert (= (and d!53839 (not c!31815)) b!177653))

(assert (= (and d!53839 (not res!84186)) b!177654))

(declare-fun m!206259 () Bool)

(assert (=> d!53839 m!206259))

(declare-fun m!206261 () Bool)

(assert (=> b!177652 m!206261))

(declare-fun m!206263 () Bool)

(assert (=> b!177652 m!206263))

(assert (=> b!177652 m!206263))

(declare-fun m!206265 () Bool)

(assert (=> b!177652 m!206265))

(assert (=> b!177654 m!206263))

(assert (=> b!177654 m!206263))

(assert (=> b!177654 m!206265))

(assert (=> bm!17945 d!53839))

(declare-fun d!53841 () Bool)

(assert (=> d!53841 (isDefined!149 (getValueByKey!197 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))

(declare-fun lt!87831 () Unit!5423)

(declare-fun choose!953 (List!2229 (_ BitVec 64)) Unit!5423)

(assert (=> d!53841 (= lt!87831 (choose!953 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))

(declare-fun e!117136 () Bool)

(assert (=> d!53841 e!117136))

(declare-fun res!84189 () Bool)

(assert (=> d!53841 (=> (not res!84189) (not e!117136))))

(declare-fun isStrictlySorted!324 (List!2229) Bool)

(assert (=> d!53841 (= res!84189 (isStrictlySorted!324 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))))

(assert (=> d!53841 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828) lt!87831)))

(declare-fun b!177657 () Bool)

(assert (=> b!177657 (= e!117136 (containsKey!200 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))

(assert (= (and d!53841 res!84189) b!177657))

(assert (=> d!53841 m!206165))

(assert (=> d!53841 m!206165))

(assert (=> d!53841 m!206167))

(declare-fun m!206267 () Bool)

(assert (=> d!53841 m!206267))

(declare-fun m!206269 () Bool)

(assert (=> d!53841 m!206269))

(assert (=> b!177657 m!206161))

(assert (=> b!177531 d!53841))

(declare-fun d!53843 () Bool)

(declare-fun isEmpty!453 (Option!203) Bool)

(assert (=> d!53843 (= (isDefined!149 (getValueByKey!197 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828)) (not (isEmpty!453 (getValueByKey!197 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))))

(declare-fun bs!7312 () Bool)

(assert (= bs!7312 d!53843))

(assert (=> bs!7312 m!206165))

(declare-fun m!206271 () Bool)

(assert (=> bs!7312 m!206271))

(assert (=> b!177531 d!53843))

(declare-fun b!177666 () Bool)

(declare-fun e!117141 () Option!203)

(assert (=> b!177666 (= e!117141 (Some!202 (_2!1640 (h!2846 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))))))

(declare-fun b!177667 () Bool)

(declare-fun e!117142 () Option!203)

(assert (=> b!177667 (= e!117141 e!117142)))

(declare-fun c!31821 () Bool)

(assert (=> b!177667 (= c!31821 (and ((_ is Cons!2225) (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))) (not (= (_1!1640 (h!2846 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))))) key!828))))))

(declare-fun d!53845 () Bool)

(declare-fun c!31820 () Bool)

(assert (=> d!53845 (= c!31820 (and ((_ is Cons!2225) (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))) (= (_1!1640 (h!2846 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))))) key!828)))))

(assert (=> d!53845 (= (getValueByKey!197 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828) e!117141)))

(declare-fun b!177668 () Bool)

(assert (=> b!177668 (= e!117142 (getValueByKey!197 (t!7053 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))) key!828))))

(declare-fun b!177669 () Bool)

(assert (=> b!177669 (= e!117142 None!201)))

(assert (= (and d!53845 c!31820) b!177666))

(assert (= (and d!53845 (not c!31820)) b!177667))

(assert (= (and b!177667 c!31821) b!177668))

(assert (= (and b!177667 (not c!31821)) b!177669))

(declare-fun m!206273 () Bool)

(assert (=> b!177668 m!206273))

(assert (=> b!177531 d!53845))

(declare-fun b!177681 () Bool)

(declare-fun e!117145 () Bool)

(assert (=> b!177681 (= e!117145 (and (bvsge (extraKeys!3391 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3391 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1239 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!53847 () Bool)

(declare-fun res!84199 () Bool)

(assert (=> d!53847 (=> (not res!84199) (not e!117145))))

(assert (=> d!53847 (= res!84199 (validMask!0 (mask!8594 thiss!1248)))))

(assert (=> d!53847 (= (simpleValid!155 thiss!1248) e!117145)))

(declare-fun b!177680 () Bool)

(declare-fun res!84201 () Bool)

(assert (=> b!177680 (=> (not res!84201) (not e!117145))))

(declare-fun size!3846 (LongMapFixedSize!2380) (_ BitVec 32))

(assert (=> b!177680 (= res!84201 (= (size!3846 thiss!1248) (bvadd (_size!1239 thiss!1248) (bvsdiv (bvadd (extraKeys!3391 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!177679 () Bool)

(declare-fun res!84198 () Bool)

(assert (=> b!177679 (=> (not res!84198) (not e!117145))))

(assert (=> b!177679 (= res!84198 (bvsge (size!3846 thiss!1248) (_size!1239 thiss!1248)))))

(declare-fun b!177678 () Bool)

(declare-fun res!84200 () Bool)

(assert (=> b!177678 (=> (not res!84200) (not e!117145))))

(assert (=> b!177678 (= res!84200 (and (= (size!3841 (_values!3637 thiss!1248)) (bvadd (mask!8594 thiss!1248) #b00000000000000000000000000000001)) (= (size!3840 (_keys!5522 thiss!1248)) (size!3841 (_values!3637 thiss!1248))) (bvsge (_size!1239 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1239 thiss!1248) (bvadd (mask!8594 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!53847 res!84199) b!177678))

(assert (= (and b!177678 res!84200) b!177679))

(assert (= (and b!177679 res!84198) b!177680))

(assert (= (and b!177680 res!84201) b!177681))

(assert (=> d!53847 m!206117))

(declare-fun m!206275 () Bool)

(assert (=> b!177680 m!206275))

(assert (=> b!177679 m!206275))

(assert (=> d!53835 d!53847))

(declare-fun d!53849 () Bool)

(assert (=> d!53849 (= (validKeyInArray!0 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177596 d!53849))

(declare-fun d!53851 () Bool)

(declare-fun lt!87834 () (_ BitVec 32))

(assert (=> d!53851 (and (bvsge lt!87834 #b00000000000000000000000000000000) (bvsle lt!87834 (bvsub (size!3840 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117151 () (_ BitVec 32))

(assert (=> d!53851 (= lt!87834 e!117151)))

(declare-fun c!31827 () Bool)

(assert (=> d!53851 (= c!31827 (bvsge #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))))))

(assert (=> d!53851 (and (bvsle #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3840 (_keys!5522 thiss!1248)) (size!3840 (_keys!5522 thiss!1248))))))

(assert (=> d!53851 (= (arrayCountValidKeys!0 (_keys!5522 thiss!1248) #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))) lt!87834)))

(declare-fun bm!17953 () Bool)

(declare-fun call!17956 () (_ BitVec 32))

(assert (=> bm!17953 (= call!17956 (arrayCountValidKeys!0 (_keys!5522 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3840 (_keys!5522 thiss!1248))))))

(declare-fun b!177690 () Bool)

(assert (=> b!177690 (= e!117151 #b00000000000000000000000000000000)))

(declare-fun b!177691 () Bool)

(declare-fun e!117150 () (_ BitVec 32))

(assert (=> b!177691 (= e!117150 call!17956)))

(declare-fun b!177692 () Bool)

(assert (=> b!177692 (= e!117150 (bvadd #b00000000000000000000000000000001 call!17956))))

(declare-fun b!177693 () Bool)

(assert (=> b!177693 (= e!117151 e!117150)))

(declare-fun c!31826 () Bool)

(assert (=> b!177693 (= c!31826 (validKeyInArray!0 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53851 c!31827) b!177690))

(assert (= (and d!53851 (not c!31827)) b!177693))

(assert (= (and b!177693 c!31826) b!177692))

(assert (= (and b!177693 (not c!31826)) b!177691))

(assert (= (or b!177692 b!177691) bm!17953))

(declare-fun m!206277 () Bool)

(assert (=> bm!17953 m!206277))

(assert (=> b!177693 m!206169))

(assert (=> b!177693 m!206169))

(assert (=> b!177693 m!206171))

(assert (=> b!177623 d!53851))

(declare-fun b!177712 () Bool)

(declare-fun e!117165 () SeekEntryResult!565)

(assert (=> b!177712 (= e!117165 (Intermediate!565 false (toIndex!0 key!828 (mask!8594 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!177713 () Bool)

(declare-fun lt!87839 () SeekEntryResult!565)

(assert (=> b!177713 (and (bvsge (index!4430 lt!87839) #b00000000000000000000000000000000) (bvslt (index!4430 lt!87839) (size!3840 (_keys!5522 thiss!1248))))))

(declare-fun e!117164 () Bool)

(assert (=> b!177713 (= e!117164 (= (select (arr!3536 (_keys!5522 thiss!1248)) (index!4430 lt!87839)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177714 () Bool)

(declare-fun e!117163 () SeekEntryResult!565)

(assert (=> b!177714 (= e!117163 e!117165)))

(declare-fun c!31835 () Bool)

(declare-fun lt!87840 () (_ BitVec 64))

(assert (=> b!177714 (= c!31835 (or (= lt!87840 key!828) (= (bvadd lt!87840 lt!87840) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!53853 () Bool)

(declare-fun e!117162 () Bool)

(assert (=> d!53853 e!117162))

(declare-fun c!31836 () Bool)

(assert (=> d!53853 (= c!31836 (and ((_ is Intermediate!565) lt!87839) (undefined!1377 lt!87839)))))

(assert (=> d!53853 (= lt!87839 e!117163)))

(declare-fun c!31834 () Bool)

(assert (=> d!53853 (= c!31834 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!53853 (= lt!87840 (select (arr!3536 (_keys!5522 thiss!1248)) (toIndex!0 key!828 (mask!8594 thiss!1248))))))

(assert (=> d!53853 (validMask!0 (mask!8594 thiss!1248))))

(assert (=> d!53853 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8594 thiss!1248)) key!828 (_keys!5522 thiss!1248) (mask!8594 thiss!1248)) lt!87839)))

(declare-fun b!177715 () Bool)

(assert (=> b!177715 (and (bvsge (index!4430 lt!87839) #b00000000000000000000000000000000) (bvslt (index!4430 lt!87839) (size!3840 (_keys!5522 thiss!1248))))))

(declare-fun res!84210 () Bool)

(assert (=> b!177715 (= res!84210 (= (select (arr!3536 (_keys!5522 thiss!1248)) (index!4430 lt!87839)) key!828))))

(assert (=> b!177715 (=> res!84210 e!117164)))

(declare-fun e!117166 () Bool)

(assert (=> b!177715 (= e!117166 e!117164)))

(declare-fun b!177716 () Bool)

(assert (=> b!177716 (= e!117165 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8594 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8594 thiss!1248)) key!828 (_keys!5522 thiss!1248) (mask!8594 thiss!1248)))))

(declare-fun b!177717 () Bool)

(assert (=> b!177717 (and (bvsge (index!4430 lt!87839) #b00000000000000000000000000000000) (bvslt (index!4430 lt!87839) (size!3840 (_keys!5522 thiss!1248))))))

(declare-fun res!84208 () Bool)

(assert (=> b!177717 (= res!84208 (= (select (arr!3536 (_keys!5522 thiss!1248)) (index!4430 lt!87839)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177717 (=> res!84208 e!117164)))

(declare-fun b!177718 () Bool)

(assert (=> b!177718 (= e!117162 e!117166)))

(declare-fun res!84209 () Bool)

(assert (=> b!177718 (= res!84209 (and ((_ is Intermediate!565) lt!87839) (not (undefined!1377 lt!87839)) (bvslt (x!19463 lt!87839) #b01111111111111111111111111111110) (bvsge (x!19463 lt!87839) #b00000000000000000000000000000000) (bvsge (x!19463 lt!87839) #b00000000000000000000000000000000)))))

(assert (=> b!177718 (=> (not res!84209) (not e!117166))))

(declare-fun b!177719 () Bool)

(assert (=> b!177719 (= e!117163 (Intermediate!565 true (toIndex!0 key!828 (mask!8594 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!177720 () Bool)

(assert (=> b!177720 (= e!117162 (bvsge (x!19463 lt!87839) #b01111111111111111111111111111110))))

(assert (= (and d!53853 c!31834) b!177719))

(assert (= (and d!53853 (not c!31834)) b!177714))

(assert (= (and b!177714 c!31835) b!177712))

(assert (= (and b!177714 (not c!31835)) b!177716))

(assert (= (and d!53853 c!31836) b!177720))

(assert (= (and d!53853 (not c!31836)) b!177718))

(assert (= (and b!177718 res!84209) b!177715))

(assert (= (and b!177715 (not res!84210)) b!177717))

(assert (= (and b!177717 (not res!84208)) b!177713))

(declare-fun m!206279 () Bool)

(assert (=> b!177713 m!206279))

(assert (=> b!177716 m!206233))

(declare-fun m!206281 () Bool)

(assert (=> b!177716 m!206281))

(assert (=> b!177716 m!206281))

(declare-fun m!206283 () Bool)

(assert (=> b!177716 m!206283))

(assert (=> b!177717 m!206279))

(assert (=> d!53853 m!206233))

(declare-fun m!206285 () Bool)

(assert (=> d!53853 m!206285))

(assert (=> d!53853 m!206117))

(assert (=> b!177715 m!206279))

(assert (=> d!53831 d!53853))

(declare-fun d!53855 () Bool)

(declare-fun lt!87846 () (_ BitVec 32))

(declare-fun lt!87845 () (_ BitVec 32))

(assert (=> d!53855 (= lt!87846 (bvmul (bvxor lt!87845 (bvlshr lt!87845 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53855 (= lt!87845 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53855 (and (bvsge (mask!8594 thiss!1248) #b00000000000000000000000000000000) (let ((res!84211 (let ((h!2850 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19482 (bvmul (bvxor h!2850 (bvlshr h!2850 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19482 (bvlshr x!19482 #b00000000000000000000000000001101)) (mask!8594 thiss!1248)))))) (and (bvslt res!84211 (bvadd (mask!8594 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!84211 #b00000000000000000000000000000000))))))

(assert (=> d!53855 (= (toIndex!0 key!828 (mask!8594 thiss!1248)) (bvand (bvxor lt!87846 (bvlshr lt!87846 #b00000000000000000000000000001101)) (mask!8594 thiss!1248)))))

(assert (=> d!53831 d!53855))

(assert (=> d!53831 d!53833))

(declare-fun b!177729 () Bool)

(declare-fun e!117173 () Bool)

(declare-fun call!17959 () Bool)

(assert (=> b!177729 (= e!117173 call!17959)))

(declare-fun d!53857 () Bool)

(declare-fun res!84217 () Bool)

(declare-fun e!117175 () Bool)

(assert (=> d!53857 (=> res!84217 e!117175)))

(assert (=> d!53857 (= res!84217 (bvsge #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))))))

(assert (=> d!53857 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5522 thiss!1248) (mask!8594 thiss!1248)) e!117175)))

(declare-fun b!177730 () Bool)

(declare-fun e!117174 () Bool)

(assert (=> b!177730 (= e!117174 call!17959)))

(declare-fun bm!17956 () Bool)

(assert (=> bm!17956 (= call!17959 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5522 thiss!1248) (mask!8594 thiss!1248)))))

(declare-fun b!177731 () Bool)

(assert (=> b!177731 (= e!117174 e!117173)))

(declare-fun lt!87853 () (_ BitVec 64))

(assert (=> b!177731 (= lt!87853 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87854 () Unit!5423)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7457 (_ BitVec 64) (_ BitVec 32)) Unit!5423)

(assert (=> b!177731 (= lt!87854 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5522 thiss!1248) lt!87853 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!177731 (arrayContainsKey!0 (_keys!5522 thiss!1248) lt!87853 #b00000000000000000000000000000000)))

(declare-fun lt!87855 () Unit!5423)

(assert (=> b!177731 (= lt!87855 lt!87854)))

(declare-fun res!84216 () Bool)

(assert (=> b!177731 (= res!84216 (= (seekEntryOrOpen!0 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000) (_keys!5522 thiss!1248) (mask!8594 thiss!1248)) (Found!565 #b00000000000000000000000000000000)))))

(assert (=> b!177731 (=> (not res!84216) (not e!117173))))

(declare-fun b!177732 () Bool)

(assert (=> b!177732 (= e!117175 e!117174)))

(declare-fun c!31839 () Bool)

(assert (=> b!177732 (= c!31839 (validKeyInArray!0 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53857 (not res!84217)) b!177732))

(assert (= (and b!177732 c!31839) b!177731))

(assert (= (and b!177732 (not c!31839)) b!177730))

(assert (= (and b!177731 res!84216) b!177729))

(assert (= (or b!177729 b!177730) bm!17956))

(declare-fun m!206287 () Bool)

(assert (=> bm!17956 m!206287))

(assert (=> b!177731 m!206169))

(declare-fun m!206289 () Bool)

(assert (=> b!177731 m!206289))

(declare-fun m!206291 () Bool)

(assert (=> b!177731 m!206291))

(assert (=> b!177731 m!206169))

(declare-fun m!206293 () Bool)

(assert (=> b!177731 m!206293))

(assert (=> b!177732 m!206169))

(assert (=> b!177732 m!206169))

(assert (=> b!177732 m!206171))

(assert (=> b!177624 d!53857))

(assert (=> d!53825 d!53833))

(assert (=> b!177533 d!53843))

(assert (=> b!177533 d!53845))

(declare-fun b!177743 () Bool)

(declare-fun e!117184 () Bool)

(declare-fun call!17962 () Bool)

(assert (=> b!177743 (= e!117184 call!17962)))

(declare-fun b!177744 () Bool)

(declare-fun e!117187 () Bool)

(declare-fun e!117186 () Bool)

(assert (=> b!177744 (= e!117187 e!117186)))

(declare-fun res!84225 () Bool)

(assert (=> b!177744 (=> (not res!84225) (not e!117186))))

(declare-fun e!117185 () Bool)

(assert (=> b!177744 (= res!84225 (not e!117185))))

(declare-fun res!84224 () Bool)

(assert (=> b!177744 (=> (not res!84224) (not e!117185))))

(assert (=> b!177744 (= res!84224 (validKeyInArray!0 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17959 () Bool)

(declare-fun c!31842 () Bool)

(assert (=> bm!17959 (= call!17962 (arrayNoDuplicates!0 (_keys!5522 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31842 (Cons!2228 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000) Nil!2229) Nil!2229)))))

(declare-fun b!177745 () Bool)

(declare-fun contains!1191 (List!2232 (_ BitVec 64)) Bool)

(assert (=> b!177745 (= e!117185 (contains!1191 Nil!2229 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177746 () Bool)

(assert (=> b!177746 (= e!117184 call!17962)))

(declare-fun b!177747 () Bool)

(assert (=> b!177747 (= e!117186 e!117184)))

(assert (=> b!177747 (= c!31842 (validKeyInArray!0 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53859 () Bool)

(declare-fun res!84226 () Bool)

(assert (=> d!53859 (=> res!84226 e!117187)))

(assert (=> d!53859 (= res!84226 (bvsge #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))))))

(assert (=> d!53859 (= (arrayNoDuplicates!0 (_keys!5522 thiss!1248) #b00000000000000000000000000000000 Nil!2229) e!117187)))

(assert (= (and d!53859 (not res!84226)) b!177744))

(assert (= (and b!177744 res!84224) b!177745))

(assert (= (and b!177744 res!84225) b!177747))

(assert (= (and b!177747 c!31842) b!177743))

(assert (= (and b!177747 (not c!31842)) b!177746))

(assert (= (or b!177743 b!177746) bm!17959))

(assert (=> b!177744 m!206169))

(assert (=> b!177744 m!206169))

(assert (=> b!177744 m!206171))

(assert (=> bm!17959 m!206169))

(declare-fun m!206295 () Bool)

(assert (=> bm!17959 m!206295))

(assert (=> b!177745 m!206169))

(assert (=> b!177745 m!206169))

(declare-fun m!206297 () Bool)

(assert (=> b!177745 m!206297))

(assert (=> b!177747 m!206169))

(assert (=> b!177747 m!206169))

(assert (=> b!177747 m!206171))

(assert (=> b!177625 d!53859))

(declare-fun d!53861 () Bool)

(declare-fun get!2027 (Option!203) V!5193)

(assert (=> d!53861 (= (apply!141 lt!87801 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2027 (getValueByKey!197 (toList!1111 lt!87801) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7313 () Bool)

(assert (= bs!7313 d!53861))

(declare-fun m!206299 () Bool)

(assert (=> bs!7313 m!206299))

(assert (=> bs!7313 m!206299))

(declare-fun m!206301 () Bool)

(assert (=> bs!7313 m!206301))

(assert (=> b!177589 d!53861))

(declare-fun d!53863 () Bool)

(declare-fun e!117188 () Bool)

(assert (=> d!53863 e!117188))

(declare-fun res!84227 () Bool)

(assert (=> d!53863 (=> res!84227 e!117188)))

(declare-fun lt!87859 () Bool)

(assert (=> d!53863 (= res!84227 (not lt!87859))))

(declare-fun lt!87858 () Bool)

(assert (=> d!53863 (= lt!87859 lt!87858)))

(declare-fun lt!87857 () Unit!5423)

(declare-fun e!117189 () Unit!5423)

(assert (=> d!53863 (= lt!87857 e!117189)))

(declare-fun c!31843 () Bool)

(assert (=> d!53863 (= c!31843 lt!87858)))

(assert (=> d!53863 (= lt!87858 (containsKey!200 (toList!1111 lt!87801) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53863 (= (contains!1188 lt!87801 #b1000000000000000000000000000000000000000000000000000000000000000) lt!87859)))

(declare-fun b!177748 () Bool)

(declare-fun lt!87856 () Unit!5423)

(assert (=> b!177748 (= e!117189 lt!87856)))

(assert (=> b!177748 (= lt!87856 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1111 lt!87801) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177748 (isDefined!149 (getValueByKey!197 (toList!1111 lt!87801) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177749 () Bool)

(declare-fun Unit!5428 () Unit!5423)

(assert (=> b!177749 (= e!117189 Unit!5428)))

(declare-fun b!177750 () Bool)

(assert (=> b!177750 (= e!117188 (isDefined!149 (getValueByKey!197 (toList!1111 lt!87801) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53863 c!31843) b!177748))

(assert (= (and d!53863 (not c!31843)) b!177749))

(assert (= (and d!53863 (not res!84227)) b!177750))

(declare-fun m!206303 () Bool)

(assert (=> d!53863 m!206303))

(declare-fun m!206305 () Bool)

(assert (=> b!177748 m!206305))

(assert (=> b!177748 m!206299))

(assert (=> b!177748 m!206299))

(declare-fun m!206307 () Bool)

(assert (=> b!177748 m!206307))

(assert (=> b!177750 m!206299))

(assert (=> b!177750 m!206299))

(assert (=> b!177750 m!206307))

(assert (=> bm!17950 d!53863))

(declare-fun d!53865 () Bool)

(assert (=> d!53865 (= (apply!141 lt!87801 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2027 (getValueByKey!197 (toList!1111 lt!87801) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7314 () Bool)

(assert (= bs!7314 d!53865))

(assert (=> bs!7314 m!206263))

(assert (=> bs!7314 m!206263))

(declare-fun m!206309 () Bool)

(assert (=> bs!7314 m!206309))

(assert (=> b!177581 d!53865))

(declare-fun d!53867 () Bool)

(declare-fun e!117192 () Bool)

(assert (=> d!53867 e!117192))

(declare-fun res!84233 () Bool)

(assert (=> d!53867 (=> (not res!84233) (not e!117192))))

(declare-fun lt!87869 () ListLongMap!2191)

(assert (=> d!53867 (= res!84233 (contains!1188 lt!87869 (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))

(declare-fun lt!87871 () List!2229)

(assert (=> d!53867 (= lt!87869 (ListLongMap!2192 lt!87871))))

(declare-fun lt!87870 () Unit!5423)

(declare-fun lt!87868 () Unit!5423)

(assert (=> d!53867 (= lt!87870 lt!87868)))

(assert (=> d!53867 (= (getValueByKey!197 lt!87871 (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))) (Some!202 (_2!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!104 (List!2229 (_ BitVec 64) V!5193) Unit!5423)

(assert (=> d!53867 (= lt!87868 (lemmaContainsTupThenGetReturnValue!104 lt!87871 (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))) (_2!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))

(declare-fun insertStrictlySorted!107 (List!2229 (_ BitVec 64) V!5193) List!2229)

(assert (=> d!53867 (= lt!87871 (insertStrictlySorted!107 (toList!1111 call!17951) (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))) (_2!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))

(assert (=> d!53867 (= (+!258 call!17951 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))) lt!87869)))

(declare-fun b!177755 () Bool)

(declare-fun res!84232 () Bool)

(assert (=> b!177755 (=> (not res!84232) (not e!117192))))

(assert (=> b!177755 (= res!84232 (= (getValueByKey!197 (toList!1111 lt!87869) (_1!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))) (Some!202 (_2!1640 (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))))

(declare-fun b!177756 () Bool)

(declare-fun contains!1192 (List!2229 tuple2!3258) Bool)

(assert (=> b!177756 (= e!117192 (contains!1192 (toList!1111 lt!87869) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))

(assert (= (and d!53867 res!84233) b!177755))

(assert (= (and b!177755 res!84232) b!177756))

(declare-fun m!206311 () Bool)

(assert (=> d!53867 m!206311))

(declare-fun m!206313 () Bool)

(assert (=> d!53867 m!206313))

(declare-fun m!206315 () Bool)

(assert (=> d!53867 m!206315))

(declare-fun m!206317 () Bool)

(assert (=> d!53867 m!206317))

(declare-fun m!206319 () Bool)

(assert (=> b!177755 m!206319))

(declare-fun m!206321 () Bool)

(assert (=> b!177756 m!206321))

(assert (=> b!177576 d!53867))

(declare-fun d!53869 () Bool)

(declare-fun e!117193 () Bool)

(assert (=> d!53869 e!117193))

(declare-fun res!84234 () Bool)

(assert (=> d!53869 (=> res!84234 e!117193)))

(declare-fun lt!87875 () Bool)

(assert (=> d!53869 (= res!84234 (not lt!87875))))

(declare-fun lt!87874 () Bool)

(assert (=> d!53869 (= lt!87875 lt!87874)))

(declare-fun lt!87873 () Unit!5423)

(declare-fun e!117194 () Unit!5423)

(assert (=> d!53869 (= lt!87873 e!117194)))

(declare-fun c!31844 () Bool)

(assert (=> d!53869 (= c!31844 lt!87874)))

(assert (=> d!53869 (= lt!87874 (containsKey!200 (toList!1111 lt!87801) (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53869 (= (contains!1188 lt!87801 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)) lt!87875)))

(declare-fun b!177757 () Bool)

(declare-fun lt!87872 () Unit!5423)

(assert (=> b!177757 (= e!117194 lt!87872)))

(assert (=> b!177757 (= lt!87872 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1111 lt!87801) (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177757 (isDefined!149 (getValueByKey!197 (toList!1111 lt!87801) (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177758 () Bool)

(declare-fun Unit!5429 () Unit!5423)

(assert (=> b!177758 (= e!117194 Unit!5429)))

(declare-fun b!177759 () Bool)

(assert (=> b!177759 (= e!117193 (isDefined!149 (getValueByKey!197 (toList!1111 lt!87801) (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53869 c!31844) b!177757))

(assert (= (and d!53869 (not c!31844)) b!177758))

(assert (= (and d!53869 (not res!84234)) b!177759))

(assert (=> d!53869 m!206169))

(declare-fun m!206323 () Bool)

(assert (=> d!53869 m!206323))

(assert (=> b!177757 m!206169))

(declare-fun m!206325 () Bool)

(assert (=> b!177757 m!206325))

(assert (=> b!177757 m!206169))

(declare-fun m!206327 () Bool)

(assert (=> b!177757 m!206327))

(assert (=> b!177757 m!206327))

(declare-fun m!206329 () Bool)

(assert (=> b!177757 m!206329))

(assert (=> b!177759 m!206169))

(assert (=> b!177759 m!206327))

(assert (=> b!177759 m!206327))

(assert (=> b!177759 m!206329))

(assert (=> b!177583 d!53869))

(declare-fun d!53871 () Bool)

(declare-fun e!117195 () Bool)

(assert (=> d!53871 e!117195))

(declare-fun res!84236 () Bool)

(assert (=> d!53871 (=> (not res!84236) (not e!117195))))

(declare-fun lt!87877 () ListLongMap!2191)

(assert (=> d!53871 (= res!84236 (contains!1188 lt!87877 (_1!1640 (ite (or c!31795 c!31792) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))))

(declare-fun lt!87879 () List!2229)

(assert (=> d!53871 (= lt!87877 (ListLongMap!2192 lt!87879))))

(declare-fun lt!87878 () Unit!5423)

(declare-fun lt!87876 () Unit!5423)

(assert (=> d!53871 (= lt!87878 lt!87876)))

(assert (=> d!53871 (= (getValueByKey!197 lt!87879 (_1!1640 (ite (or c!31795 c!31792) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))) (Some!202 (_2!1640 (ite (or c!31795 c!31792) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))))

(assert (=> d!53871 (= lt!87876 (lemmaContainsTupThenGetReturnValue!104 lt!87879 (_1!1640 (ite (or c!31795 c!31792) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))) (_2!1640 (ite (or c!31795 c!31792) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))))

(assert (=> d!53871 (= lt!87879 (insertStrictlySorted!107 (toList!1111 (ite c!31795 call!17952 (ite c!31792 call!17947 call!17953))) (_1!1640 (ite (or c!31795 c!31792) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))) (_2!1640 (ite (or c!31795 c!31792) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))))

(assert (=> d!53871 (= (+!258 (ite c!31795 call!17952 (ite c!31792 call!17947 call!17953)) (ite (or c!31795 c!31792) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))) lt!87877)))

(declare-fun b!177760 () Bool)

(declare-fun res!84235 () Bool)

(assert (=> b!177760 (=> (not res!84235) (not e!117195))))

(assert (=> b!177760 (= res!84235 (= (getValueByKey!197 (toList!1111 lt!87877) (_1!1640 (ite (or c!31795 c!31792) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))) (Some!202 (_2!1640 (ite (or c!31795 c!31792) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))))

(declare-fun b!177761 () Bool)

(assert (=> b!177761 (= e!117195 (contains!1192 (toList!1111 lt!87877) (ite (or c!31795 c!31792) (tuple2!3259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))

(assert (= (and d!53871 res!84236) b!177760))

(assert (= (and b!177760 res!84235) b!177761))

(declare-fun m!206331 () Bool)

(assert (=> d!53871 m!206331))

(declare-fun m!206333 () Bool)

(assert (=> d!53871 m!206333))

(declare-fun m!206335 () Bool)

(assert (=> d!53871 m!206335))

(declare-fun m!206337 () Bool)

(assert (=> d!53871 m!206337))

(declare-fun m!206339 () Bool)

(assert (=> b!177760 m!206339))

(declare-fun m!206341 () Bool)

(assert (=> b!177761 m!206341))

(assert (=> bm!17944 d!53871))

(declare-fun d!53873 () Bool)

(assert (=> d!53873 (= (apply!141 lt!87807 lt!87800) (get!2027 (getValueByKey!197 (toList!1111 lt!87807) lt!87800)))))

(declare-fun bs!7315 () Bool)

(assert (= bs!7315 d!53873))

(declare-fun m!206343 () Bool)

(assert (=> bs!7315 m!206343))

(assert (=> bs!7315 m!206343))

(declare-fun m!206345 () Bool)

(assert (=> bs!7315 m!206345))

(assert (=> b!177592 d!53873))

(declare-fun d!53875 () Bool)

(declare-fun e!117196 () Bool)

(assert (=> d!53875 e!117196))

(declare-fun res!84238 () Bool)

(assert (=> d!53875 (=> (not res!84238) (not e!117196))))

(declare-fun lt!87881 () ListLongMap!2191)

(assert (=> d!53875 (= res!84238 (contains!1188 lt!87881 (_1!1640 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248)))))))

(declare-fun lt!87883 () List!2229)

(assert (=> d!53875 (= lt!87881 (ListLongMap!2192 lt!87883))))

(declare-fun lt!87882 () Unit!5423)

(declare-fun lt!87880 () Unit!5423)

(assert (=> d!53875 (= lt!87882 lt!87880)))

(assert (=> d!53875 (= (getValueByKey!197 lt!87883 (_1!1640 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248)))) (Some!202 (_2!1640 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248)))))))

(assert (=> d!53875 (= lt!87880 (lemmaContainsTupThenGetReturnValue!104 lt!87883 (_1!1640 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248))) (_2!1640 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248)))))))

(assert (=> d!53875 (= lt!87883 (insertStrictlySorted!107 (toList!1111 lt!87793) (_1!1640 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248))) (_2!1640 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248)))))))

(assert (=> d!53875 (= (+!258 lt!87793 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248))) lt!87881)))

(declare-fun b!177762 () Bool)

(declare-fun res!84237 () Bool)

(assert (=> b!177762 (=> (not res!84237) (not e!117196))))

(assert (=> b!177762 (= res!84237 (= (getValueByKey!197 (toList!1111 lt!87881) (_1!1640 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248)))) (Some!202 (_2!1640 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248))))))))

(declare-fun b!177763 () Bool)

(assert (=> b!177763 (= e!117196 (contains!1192 (toList!1111 lt!87881) (tuple2!3259 lt!87797 (minValue!3495 thiss!1248))))))

(assert (= (and d!53875 res!84238) b!177762))

(assert (= (and b!177762 res!84237) b!177763))

(declare-fun m!206347 () Bool)

(assert (=> d!53875 m!206347))

(declare-fun m!206349 () Bool)

(assert (=> d!53875 m!206349))

(declare-fun m!206351 () Bool)

(assert (=> d!53875 m!206351))

(declare-fun m!206353 () Bool)

(assert (=> d!53875 m!206353))

(declare-fun m!206355 () Bool)

(assert (=> b!177762 m!206355))

(declare-fun m!206357 () Bool)

(assert (=> b!177763 m!206357))

(assert (=> b!177592 d!53875))

(declare-fun d!53877 () Bool)

(declare-fun e!117197 () Bool)

(assert (=> d!53877 e!117197))

(declare-fun res!84239 () Bool)

(assert (=> d!53877 (=> res!84239 e!117197)))

(declare-fun lt!87887 () Bool)

(assert (=> d!53877 (= res!84239 (not lt!87887))))

(declare-fun lt!87886 () Bool)

(assert (=> d!53877 (= lt!87887 lt!87886)))

(declare-fun lt!87885 () Unit!5423)

(declare-fun e!117198 () Unit!5423)

(assert (=> d!53877 (= lt!87885 e!117198)))

(declare-fun c!31845 () Bool)

(assert (=> d!53877 (= c!31845 lt!87886)))

(assert (=> d!53877 (= lt!87886 (containsKey!200 (toList!1111 (+!258 lt!87796 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248)))) lt!87799))))

(assert (=> d!53877 (= (contains!1188 (+!258 lt!87796 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248))) lt!87799) lt!87887)))

(declare-fun b!177764 () Bool)

(declare-fun lt!87884 () Unit!5423)

(assert (=> b!177764 (= e!117198 lt!87884)))

(assert (=> b!177764 (= lt!87884 (lemmaContainsKeyImpliesGetValueByKeyDefined!148 (toList!1111 (+!258 lt!87796 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248)))) lt!87799))))

(assert (=> b!177764 (isDefined!149 (getValueByKey!197 (toList!1111 (+!258 lt!87796 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248)))) lt!87799))))

(declare-fun b!177765 () Bool)

(declare-fun Unit!5430 () Unit!5423)

(assert (=> b!177765 (= e!117198 Unit!5430)))

(declare-fun b!177766 () Bool)

(assert (=> b!177766 (= e!117197 (isDefined!149 (getValueByKey!197 (toList!1111 (+!258 lt!87796 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248)))) lt!87799)))))

(assert (= (and d!53877 c!31845) b!177764))

(assert (= (and d!53877 (not c!31845)) b!177765))

(assert (= (and d!53877 (not res!84239)) b!177766))

(declare-fun m!206359 () Bool)

(assert (=> d!53877 m!206359))

(declare-fun m!206361 () Bool)

(assert (=> b!177764 m!206361))

(declare-fun m!206363 () Bool)

(assert (=> b!177764 m!206363))

(assert (=> b!177764 m!206363))

(declare-fun m!206365 () Bool)

(assert (=> b!177764 m!206365))

(assert (=> b!177766 m!206363))

(assert (=> b!177766 m!206363))

(assert (=> b!177766 m!206365))

(assert (=> b!177592 d!53877))

(declare-fun b!177791 () Bool)

(declare-fun e!117218 () Bool)

(declare-fun lt!87903 () ListLongMap!2191)

(declare-fun isEmpty!454 (ListLongMap!2191) Bool)

(assert (=> b!177791 (= e!117218 (isEmpty!454 lt!87903))))

(declare-fun b!177792 () Bool)

(declare-fun res!84251 () Bool)

(declare-fun e!117213 () Bool)

(assert (=> b!177792 (=> (not res!84251) (not e!117213))))

(assert (=> b!177792 (= res!84251 (not (contains!1188 lt!87903 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177793 () Bool)

(declare-fun e!117215 () ListLongMap!2191)

(declare-fun call!17965 () ListLongMap!2191)

(assert (=> b!177793 (= e!117215 call!17965)))

(declare-fun b!177795 () Bool)

(assert (=> b!177795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))))))

(assert (=> b!177795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3841 (_values!3637 thiss!1248))))))

(declare-fun e!117219 () Bool)

(assert (=> b!177795 (= e!117219 (= (apply!141 lt!87903 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)) (get!2026 (select (arr!3537 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!177796 () Bool)

(declare-fun e!117216 () Bool)

(assert (=> b!177796 (= e!117216 (validKeyInArray!0 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177796 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!177797 () Bool)

(declare-fun e!117214 () Bool)

(assert (=> b!177797 (= e!117214 e!117219)))

(assert (=> b!177797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))))))

(declare-fun res!84249 () Bool)

(assert (=> b!177797 (= res!84249 (contains!1188 lt!87903 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177797 (=> (not res!84249) (not e!117219))))

(declare-fun b!177798 () Bool)

(assert (=> b!177798 (= e!117213 e!117214)))

(declare-fun c!31854 () Bool)

(assert (=> b!177798 (= c!31854 e!117216)))

(declare-fun res!84250 () Bool)

(assert (=> b!177798 (=> (not res!84250) (not e!117216))))

(assert (=> b!177798 (= res!84250 (bvslt #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))))))

(declare-fun b!177799 () Bool)

(assert (=> b!177799 (= e!117218 (= lt!87903 (getCurrentListMapNoExtraKeys!172 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3654 thiss!1248))))))

(declare-fun bm!17962 () Bool)

(assert (=> bm!17962 (= call!17965 (getCurrentListMapNoExtraKeys!172 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3654 thiss!1248)))))

(declare-fun b!177800 () Bool)

(declare-fun e!117217 () ListLongMap!2191)

(assert (=> b!177800 (= e!117217 e!117215)))

(declare-fun c!31856 () Bool)

(assert (=> b!177800 (= c!31856 (validKeyInArray!0 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53879 () Bool)

(assert (=> d!53879 e!117213))

(declare-fun res!84248 () Bool)

(assert (=> d!53879 (=> (not res!84248) (not e!117213))))

(assert (=> d!53879 (= res!84248 (not (contains!1188 lt!87903 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53879 (= lt!87903 e!117217)))

(declare-fun c!31857 () Bool)

(assert (=> d!53879 (= c!31857 (bvsge #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))))))

(assert (=> d!53879 (validMask!0 (mask!8594 thiss!1248))))

(assert (=> d!53879 (= (getCurrentListMapNoExtraKeys!172 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)) lt!87903)))

(declare-fun b!177794 () Bool)

(assert (=> b!177794 (= e!117217 (ListLongMap!2192 Nil!2226))))

(declare-fun b!177801 () Bool)

(declare-fun lt!87906 () Unit!5423)

(declare-fun lt!87905 () Unit!5423)

(assert (=> b!177801 (= lt!87906 lt!87905)))

(declare-fun lt!87908 () ListLongMap!2191)

(declare-fun lt!87907 () (_ BitVec 64))

(declare-fun lt!87902 () V!5193)

(declare-fun lt!87904 () (_ BitVec 64))

(assert (=> b!177801 (not (contains!1188 (+!258 lt!87908 (tuple2!3259 lt!87907 lt!87902)) lt!87904))))

(declare-fun addStillNotContains!79 (ListLongMap!2191 (_ BitVec 64) V!5193 (_ BitVec 64)) Unit!5423)

(assert (=> b!177801 (= lt!87905 (addStillNotContains!79 lt!87908 lt!87907 lt!87902 lt!87904))))

(assert (=> b!177801 (= lt!87904 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!177801 (= lt!87902 (get!2026 (select (arr!3537 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177801 (= lt!87907 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177801 (= lt!87908 call!17965)))

(assert (=> b!177801 (= e!117215 (+!258 call!17965 (tuple2!3259 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000) (get!2026 (select (arr!3537 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!177802 () Bool)

(assert (=> b!177802 (= e!117214 e!117218)))

(declare-fun c!31855 () Bool)

(assert (=> b!177802 (= c!31855 (bvslt #b00000000000000000000000000000000 (size!3840 (_keys!5522 thiss!1248))))))

(assert (= (and d!53879 c!31857) b!177794))

(assert (= (and d!53879 (not c!31857)) b!177800))

(assert (= (and b!177800 c!31856) b!177801))

(assert (= (and b!177800 (not c!31856)) b!177793))

(assert (= (or b!177801 b!177793) bm!17962))

(assert (= (and d!53879 res!84248) b!177792))

(assert (= (and b!177792 res!84251) b!177798))

(assert (= (and b!177798 res!84250) b!177796))

(assert (= (and b!177798 c!31854) b!177797))

(assert (= (and b!177798 (not c!31854)) b!177802))

(assert (= (and b!177797 res!84249) b!177795))

(assert (= (and b!177802 c!31855) b!177799))

(assert (= (and b!177802 (not c!31855)) b!177791))

(declare-fun b_lambda!7081 () Bool)

(assert (=> (not b_lambda!7081) (not b!177795)))

(assert (=> b!177795 t!7057))

(declare-fun b_and!10911 () Bool)

(assert (= b_and!10909 (and (=> t!7057 result!4645) b_and!10911)))

(declare-fun b_lambda!7083 () Bool)

(assert (=> (not b_lambda!7083) (not b!177801)))

(assert (=> b!177801 t!7057))

(declare-fun b_and!10913 () Bool)

(assert (= b_and!10911 (and (=> t!7057 result!4645) b_and!10913)))

(assert (=> b!177795 m!206217))

(assert (=> b!177795 m!206219))

(assert (=> b!177795 m!206221))

(assert (=> b!177795 m!206169))

(assert (=> b!177795 m!206169))

(declare-fun m!206367 () Bool)

(assert (=> b!177795 m!206367))

(assert (=> b!177795 m!206219))

(assert (=> b!177795 m!206217))

(assert (=> b!177800 m!206169))

(assert (=> b!177800 m!206169))

(assert (=> b!177800 m!206171))

(declare-fun m!206369 () Bool)

(assert (=> bm!17962 m!206369))

(assert (=> b!177801 m!206217))

(assert (=> b!177801 m!206219))

(assert (=> b!177801 m!206221))

(declare-fun m!206371 () Bool)

(assert (=> b!177801 m!206371))

(declare-fun m!206373 () Bool)

(assert (=> b!177801 m!206373))

(assert (=> b!177801 m!206169))

(declare-fun m!206375 () Bool)

(assert (=> b!177801 m!206375))

(assert (=> b!177801 m!206217))

(assert (=> b!177801 m!206371))

(declare-fun m!206377 () Bool)

(assert (=> b!177801 m!206377))

(assert (=> b!177801 m!206219))

(assert (=> b!177796 m!206169))

(assert (=> b!177796 m!206169))

(assert (=> b!177796 m!206171))

(declare-fun m!206379 () Bool)

(assert (=> b!177791 m!206379))

(assert (=> b!177797 m!206169))

(assert (=> b!177797 m!206169))

(declare-fun m!206381 () Bool)

(assert (=> b!177797 m!206381))

(declare-fun m!206383 () Bool)

(assert (=> b!177792 m!206383))

(declare-fun m!206385 () Bool)

(assert (=> d!53879 m!206385))

(assert (=> d!53879 m!206117))

(assert (=> b!177799 m!206369))

(assert (=> b!177592 d!53879))

(declare-fun d!53881 () Bool)

(assert (=> d!53881 (= (apply!141 (+!258 lt!87793 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248))) lt!87809) (apply!141 lt!87793 lt!87809))))

(declare-fun lt!87911 () Unit!5423)

(declare-fun choose!954 (ListLongMap!2191 (_ BitVec 64) V!5193 (_ BitVec 64)) Unit!5423)

(assert (=> d!53881 (= lt!87911 (choose!954 lt!87793 lt!87797 (minValue!3495 thiss!1248) lt!87809))))

(declare-fun e!117222 () Bool)

(assert (=> d!53881 e!117222))

(declare-fun res!84254 () Bool)

(assert (=> d!53881 (=> (not res!84254) (not e!117222))))

(assert (=> d!53881 (= res!84254 (contains!1188 lt!87793 lt!87809))))

(assert (=> d!53881 (= (addApplyDifferent!117 lt!87793 lt!87797 (minValue!3495 thiss!1248) lt!87809) lt!87911)))

(declare-fun b!177806 () Bool)

(assert (=> b!177806 (= e!117222 (not (= lt!87809 lt!87797)))))

(assert (= (and d!53881 res!84254) b!177806))

(assert (=> d!53881 m!206209))

(declare-fun m!206387 () Bool)

(assert (=> d!53881 m!206387))

(assert (=> d!53881 m!206203))

(assert (=> d!53881 m!206203))

(assert (=> d!53881 m!206207))

(declare-fun m!206389 () Bool)

(assert (=> d!53881 m!206389))

(assert (=> b!177592 d!53881))

(declare-fun d!53883 () Bool)

(assert (=> d!53883 (= (apply!141 lt!87793 lt!87809) (get!2027 (getValueByKey!197 (toList!1111 lt!87793) lt!87809)))))

(declare-fun bs!7316 () Bool)

(assert (= bs!7316 d!53883))

(declare-fun m!206391 () Bool)

(assert (=> bs!7316 m!206391))

(assert (=> bs!7316 m!206391))

(declare-fun m!206393 () Bool)

(assert (=> bs!7316 m!206393))

(assert (=> b!177592 d!53883))

(declare-fun d!53885 () Bool)

(assert (=> d!53885 (contains!1188 (+!258 lt!87796 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248))) lt!87799)))

(declare-fun lt!87914 () Unit!5423)

(declare-fun choose!955 (ListLongMap!2191 (_ BitVec 64) V!5193 (_ BitVec 64)) Unit!5423)

(assert (=> d!53885 (= lt!87914 (choose!955 lt!87796 lt!87791 (zeroValue!3495 thiss!1248) lt!87799))))

(assert (=> d!53885 (contains!1188 lt!87796 lt!87799)))

(assert (=> d!53885 (= (addStillContains!117 lt!87796 lt!87791 (zeroValue!3495 thiss!1248) lt!87799) lt!87914)))

(declare-fun bs!7317 () Bool)

(assert (= bs!7317 d!53885))

(assert (=> bs!7317 m!206191))

(assert (=> bs!7317 m!206191))

(assert (=> bs!7317 m!206193))

(declare-fun m!206395 () Bool)

(assert (=> bs!7317 m!206395))

(declare-fun m!206397 () Bool)

(assert (=> bs!7317 m!206397))

(assert (=> b!177592 d!53885))

(declare-fun d!53887 () Bool)

(declare-fun e!117223 () Bool)

(assert (=> d!53887 e!117223))

(declare-fun res!84256 () Bool)

(assert (=> d!53887 (=> (not res!84256) (not e!117223))))

(declare-fun lt!87916 () ListLongMap!2191)

(assert (=> d!53887 (= res!84256 (contains!1188 lt!87916 (_1!1640 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248)))))))

(declare-fun lt!87918 () List!2229)

(assert (=> d!53887 (= lt!87916 (ListLongMap!2192 lt!87918))))

(declare-fun lt!87917 () Unit!5423)

(declare-fun lt!87915 () Unit!5423)

(assert (=> d!53887 (= lt!87917 lt!87915)))

(assert (=> d!53887 (= (getValueByKey!197 lt!87918 (_1!1640 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248)))) (Some!202 (_2!1640 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248)))))))

(assert (=> d!53887 (= lt!87915 (lemmaContainsTupThenGetReturnValue!104 lt!87918 (_1!1640 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248))) (_2!1640 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248)))))))

(assert (=> d!53887 (= lt!87918 (insertStrictlySorted!107 (toList!1111 lt!87792) (_1!1640 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248))) (_2!1640 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248)))))))

(assert (=> d!53887 (= (+!258 lt!87792 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248))) lt!87916)))

(declare-fun b!177808 () Bool)

(declare-fun res!84255 () Bool)

(assert (=> b!177808 (=> (not res!84255) (not e!117223))))

(assert (=> b!177808 (= res!84255 (= (getValueByKey!197 (toList!1111 lt!87916) (_1!1640 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248)))) (Some!202 (_2!1640 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248))))))))

(declare-fun b!177809 () Bool)

(assert (=> b!177809 (= e!117223 (contains!1192 (toList!1111 lt!87916) (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248))))))

(assert (= (and d!53887 res!84256) b!177808))

(assert (= (and b!177808 res!84255) b!177809))

(declare-fun m!206399 () Bool)

(assert (=> d!53887 m!206399))

(declare-fun m!206401 () Bool)

(assert (=> d!53887 m!206401))

(declare-fun m!206403 () Bool)

(assert (=> d!53887 m!206403))

(declare-fun m!206405 () Bool)

(assert (=> d!53887 m!206405))

(declare-fun m!206407 () Bool)

(assert (=> b!177808 m!206407))

(declare-fun m!206409 () Bool)

(assert (=> b!177809 m!206409))

(assert (=> b!177592 d!53887))

(declare-fun d!53889 () Bool)

(assert (=> d!53889 (= (apply!141 (+!258 lt!87792 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248))) lt!87789) (apply!141 lt!87792 lt!87789))))

(declare-fun lt!87919 () Unit!5423)

(assert (=> d!53889 (= lt!87919 (choose!954 lt!87792 lt!87790 (zeroValue!3495 thiss!1248) lt!87789))))

(declare-fun e!117224 () Bool)

(assert (=> d!53889 e!117224))

(declare-fun res!84257 () Bool)

(assert (=> d!53889 (=> (not res!84257) (not e!117224))))

(assert (=> d!53889 (= res!84257 (contains!1188 lt!87792 lt!87789))))

(assert (=> d!53889 (= (addApplyDifferent!117 lt!87792 lt!87790 (zeroValue!3495 thiss!1248) lt!87789) lt!87919)))

(declare-fun b!177810 () Bool)

(assert (=> b!177810 (= e!117224 (not (= lt!87789 lt!87790)))))

(assert (= (and d!53889 res!84257) b!177810))

(assert (=> d!53889 m!206205))

(declare-fun m!206411 () Bool)

(assert (=> d!53889 m!206411))

(assert (=> d!53889 m!206183))

(assert (=> d!53889 m!206183))

(assert (=> d!53889 m!206185))

(declare-fun m!206413 () Bool)

(assert (=> d!53889 m!206413))

(assert (=> b!177592 d!53889))

(declare-fun d!53891 () Bool)

(assert (=> d!53891 (= (apply!141 (+!258 lt!87793 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248))) lt!87809) (get!2027 (getValueByKey!197 (toList!1111 (+!258 lt!87793 (tuple2!3259 lt!87797 (minValue!3495 thiss!1248)))) lt!87809)))))

(declare-fun bs!7318 () Bool)

(assert (= bs!7318 d!53891))

(declare-fun m!206415 () Bool)

(assert (=> bs!7318 m!206415))

(assert (=> bs!7318 m!206415))

(declare-fun m!206417 () Bool)

(assert (=> bs!7318 m!206417))

(assert (=> b!177592 d!53891))

(declare-fun d!53893 () Bool)

(assert (=> d!53893 (= (apply!141 (+!258 lt!87792 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248))) lt!87789) (get!2027 (getValueByKey!197 (toList!1111 (+!258 lt!87792 (tuple2!3259 lt!87790 (zeroValue!3495 thiss!1248)))) lt!87789)))))

(declare-fun bs!7319 () Bool)

(assert (= bs!7319 d!53893))

(declare-fun m!206419 () Bool)

(assert (=> bs!7319 m!206419))

(assert (=> bs!7319 m!206419))

(declare-fun m!206421 () Bool)

(assert (=> bs!7319 m!206421))

(assert (=> b!177592 d!53893))

(declare-fun d!53895 () Bool)

(declare-fun e!117225 () Bool)

(assert (=> d!53895 e!117225))

(declare-fun res!84259 () Bool)

(assert (=> d!53895 (=> (not res!84259) (not e!117225))))

(declare-fun lt!87921 () ListLongMap!2191)

(assert (=> d!53895 (= res!84259 (contains!1188 lt!87921 (_1!1640 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248)))))))

(declare-fun lt!87923 () List!2229)

(assert (=> d!53895 (= lt!87921 (ListLongMap!2192 lt!87923))))

(declare-fun lt!87922 () Unit!5423)

(declare-fun lt!87920 () Unit!5423)

(assert (=> d!53895 (= lt!87922 lt!87920)))

(assert (=> d!53895 (= (getValueByKey!197 lt!87923 (_1!1640 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248)))) (Some!202 (_2!1640 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248)))))))

(assert (=> d!53895 (= lt!87920 (lemmaContainsTupThenGetReturnValue!104 lt!87923 (_1!1640 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248))) (_2!1640 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248)))))))

(assert (=> d!53895 (= lt!87923 (insertStrictlySorted!107 (toList!1111 lt!87807) (_1!1640 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248))) (_2!1640 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248)))))))

(assert (=> d!53895 (= (+!258 lt!87807 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248))) lt!87921)))

(declare-fun b!177811 () Bool)

(declare-fun res!84258 () Bool)

(assert (=> b!177811 (=> (not res!84258) (not e!117225))))

(assert (=> b!177811 (= res!84258 (= (getValueByKey!197 (toList!1111 lt!87921) (_1!1640 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248)))) (Some!202 (_2!1640 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248))))))))

(declare-fun b!177812 () Bool)

(assert (=> b!177812 (= e!117225 (contains!1192 (toList!1111 lt!87921) (tuple2!3259 lt!87798 (minValue!3495 thiss!1248))))))

(assert (= (and d!53895 res!84259) b!177811))

(assert (= (and b!177811 res!84258) b!177812))

(declare-fun m!206423 () Bool)

(assert (=> d!53895 m!206423))

(declare-fun m!206425 () Bool)

(assert (=> d!53895 m!206425))

(declare-fun m!206427 () Bool)

(assert (=> d!53895 m!206427))

(declare-fun m!206429 () Bool)

(assert (=> d!53895 m!206429))

(declare-fun m!206431 () Bool)

(assert (=> b!177811 m!206431))

(declare-fun m!206433 () Bool)

(assert (=> b!177812 m!206433))

(assert (=> b!177592 d!53895))

(declare-fun d!53897 () Bool)

(assert (=> d!53897 (= (apply!141 (+!258 lt!87807 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248))) lt!87800) (get!2027 (getValueByKey!197 (toList!1111 (+!258 lt!87807 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248)))) lt!87800)))))

(declare-fun bs!7320 () Bool)

(assert (= bs!7320 d!53897))

(declare-fun m!206435 () Bool)

(assert (=> bs!7320 m!206435))

(assert (=> bs!7320 m!206435))

(declare-fun m!206437 () Bool)

(assert (=> bs!7320 m!206437))

(assert (=> b!177592 d!53897))

(declare-fun d!53899 () Bool)

(assert (=> d!53899 (= (apply!141 lt!87792 lt!87789) (get!2027 (getValueByKey!197 (toList!1111 lt!87792) lt!87789)))))

(declare-fun bs!7321 () Bool)

(assert (= bs!7321 d!53899))

(declare-fun m!206439 () Bool)

(assert (=> bs!7321 m!206439))

(assert (=> bs!7321 m!206439))

(declare-fun m!206441 () Bool)

(assert (=> bs!7321 m!206441))

(assert (=> b!177592 d!53899))

(declare-fun d!53901 () Bool)

(declare-fun e!117226 () Bool)

(assert (=> d!53901 e!117226))

(declare-fun res!84261 () Bool)

(assert (=> d!53901 (=> (not res!84261) (not e!117226))))

(declare-fun lt!87925 () ListLongMap!2191)

(assert (=> d!53901 (= res!84261 (contains!1188 lt!87925 (_1!1640 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248)))))))

(declare-fun lt!87927 () List!2229)

(assert (=> d!53901 (= lt!87925 (ListLongMap!2192 lt!87927))))

(declare-fun lt!87926 () Unit!5423)

(declare-fun lt!87924 () Unit!5423)

(assert (=> d!53901 (= lt!87926 lt!87924)))

(assert (=> d!53901 (= (getValueByKey!197 lt!87927 (_1!1640 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248)))) (Some!202 (_2!1640 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248)))))))

(assert (=> d!53901 (= lt!87924 (lemmaContainsTupThenGetReturnValue!104 lt!87927 (_1!1640 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248))) (_2!1640 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248)))))))

(assert (=> d!53901 (= lt!87927 (insertStrictlySorted!107 (toList!1111 lt!87796) (_1!1640 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248))) (_2!1640 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248)))))))

(assert (=> d!53901 (= (+!258 lt!87796 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248))) lt!87925)))

(declare-fun b!177813 () Bool)

(declare-fun res!84260 () Bool)

(assert (=> b!177813 (=> (not res!84260) (not e!117226))))

(assert (=> b!177813 (= res!84260 (= (getValueByKey!197 (toList!1111 lt!87925) (_1!1640 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248)))) (Some!202 (_2!1640 (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248))))))))

(declare-fun b!177814 () Bool)

(assert (=> b!177814 (= e!117226 (contains!1192 (toList!1111 lt!87925) (tuple2!3259 lt!87791 (zeroValue!3495 thiss!1248))))))

(assert (= (and d!53901 res!84261) b!177813))

(assert (= (and b!177813 res!84260) b!177814))

(declare-fun m!206443 () Bool)

(assert (=> d!53901 m!206443))

(declare-fun m!206445 () Bool)

(assert (=> d!53901 m!206445))

(declare-fun m!206447 () Bool)

(assert (=> d!53901 m!206447))

(declare-fun m!206449 () Bool)

(assert (=> d!53901 m!206449))

(declare-fun m!206451 () Bool)

(assert (=> b!177813 m!206451))

(declare-fun m!206453 () Bool)

(assert (=> b!177814 m!206453))

(assert (=> b!177592 d!53901))

(declare-fun d!53903 () Bool)

(assert (=> d!53903 (= (apply!141 (+!258 lt!87807 (tuple2!3259 lt!87798 (minValue!3495 thiss!1248))) lt!87800) (apply!141 lt!87807 lt!87800))))

(declare-fun lt!87928 () Unit!5423)

(assert (=> d!53903 (= lt!87928 (choose!954 lt!87807 lt!87798 (minValue!3495 thiss!1248) lt!87800))))

(declare-fun e!117227 () Bool)

(assert (=> d!53903 e!117227))

(declare-fun res!84262 () Bool)

(assert (=> d!53903 (=> (not res!84262) (not e!117227))))

(assert (=> d!53903 (= res!84262 (contains!1188 lt!87807 lt!87800))))

(assert (=> d!53903 (= (addApplyDifferent!117 lt!87807 lt!87798 (minValue!3495 thiss!1248) lt!87800) lt!87928)))

(declare-fun b!177815 () Bool)

(assert (=> b!177815 (= e!117227 (not (= lt!87800 lt!87798)))))

(assert (= (and d!53903 res!84262) b!177815))

(assert (=> d!53903 m!206201))

(declare-fun m!206455 () Bool)

(assert (=> d!53903 m!206455))

(assert (=> d!53903 m!206195))

(assert (=> d!53903 m!206195))

(assert (=> d!53903 m!206197))

(declare-fun m!206457 () Bool)

(assert (=> d!53903 m!206457))

(assert (=> b!177592 d!53903))

(declare-fun d!53905 () Bool)

(assert (=> d!53905 (= (apply!141 lt!87801 (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000)) (get!2027 (getValueByKey!197 (toList!1111 lt!87801) (select (arr!3536 (_keys!5522 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7322 () Bool)

(assert (= bs!7322 d!53905))

(assert (=> bs!7322 m!206169))

(assert (=> bs!7322 m!206327))

(assert (=> bs!7322 m!206327))

(declare-fun m!206459 () Bool)

(assert (=> bs!7322 m!206459))

(assert (=> b!177585 d!53905))

(declare-fun d!53907 () Bool)

(declare-fun c!31860 () Bool)

(assert (=> d!53907 (= c!31860 ((_ is ValueCellFull!1736) (select (arr!3537 (_values!3637 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117230 () V!5193)

(assert (=> d!53907 (= (get!2026 (select (arr!3537 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!117230)))

(declare-fun b!177820 () Bool)

(declare-fun get!2028 (ValueCell!1736 V!5193) V!5193)

(assert (=> b!177820 (= e!117230 (get!2028 (select (arr!3537 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177821 () Bool)

(declare-fun get!2029 (ValueCell!1736 V!5193) V!5193)

(assert (=> b!177821 (= e!117230 (get!2029 (select (arr!3537 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!484 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53907 c!31860) b!177820))

(assert (= (and d!53907 (not c!31860)) b!177821))

(assert (=> b!177820 m!206217))

(assert (=> b!177820 m!206219))

(declare-fun m!206461 () Bool)

(assert (=> b!177820 m!206461))

(assert (=> b!177821 m!206217))

(assert (=> b!177821 m!206219))

(declare-fun m!206463 () Bool)

(assert (=> b!177821 m!206463))

(assert (=> b!177585 d!53907))

(declare-fun d!53909 () Bool)

(declare-fun res!84267 () Bool)

(declare-fun e!117235 () Bool)

(assert (=> d!53909 (=> res!84267 e!117235)))

(assert (=> d!53909 (= res!84267 (and ((_ is Cons!2225) (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))) (= (_1!1640 (h!2846 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))))) key!828)))))

(assert (=> d!53909 (= (containsKey!200 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828) e!117235)))

(declare-fun b!177826 () Bool)

(declare-fun e!117236 () Bool)

(assert (=> b!177826 (= e!117235 e!117236)))

(declare-fun res!84268 () Bool)

(assert (=> b!177826 (=> (not res!84268) (not e!117236))))

(assert (=> b!177826 (= res!84268 (and (or (not ((_ is Cons!2225) (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))))) (bvsle (_1!1640 (h!2846 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))))) key!828)) ((_ is Cons!2225) (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))) (bvslt (_1!1640 (h!2846 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))))) key!828)))))

(declare-fun b!177827 () Bool)

(assert (=> b!177827 (= e!117236 (containsKey!200 (t!7053 (toList!1111 (getCurrentListMap!766 (_keys!5522 thiss!1248) (_values!3637 thiss!1248) (mask!8594 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))) key!828))))

(assert (= (and d!53909 (not res!84267)) b!177826))

(assert (= (and b!177826 res!84268) b!177827))

(declare-fun m!206465 () Bool)

(assert (=> b!177827 m!206465))

(assert (=> d!53823 d!53909))

(assert (=> b!177595 d!53849))

(assert (=> bm!17948 d!53879))

(declare-fun mapNonEmpty!7114 () Bool)

(declare-fun mapRes!7114 () Bool)

(declare-fun tp!15880 () Bool)

(declare-fun e!117238 () Bool)

(assert (=> mapNonEmpty!7114 (= mapRes!7114 (and tp!15880 e!117238))))

(declare-fun mapKey!7114 () (_ BitVec 32))

(declare-fun mapRest!7114 () (Array (_ BitVec 32) ValueCell!1736))

(declare-fun mapValue!7114 () ValueCell!1736)

(assert (=> mapNonEmpty!7114 (= mapRest!7113 (store mapRest!7114 mapKey!7114 mapValue!7114))))

(declare-fun mapIsEmpty!7114 () Bool)

(assert (=> mapIsEmpty!7114 mapRes!7114))

(declare-fun b!177828 () Bool)

(assert (=> b!177828 (= e!117238 tp_is_empty!4159)))

(declare-fun b!177829 () Bool)

(declare-fun e!117237 () Bool)

(assert (=> b!177829 (= e!117237 tp_is_empty!4159)))

(declare-fun condMapEmpty!7114 () Bool)

(declare-fun mapDefault!7114 () ValueCell!1736)

(assert (=> mapNonEmpty!7113 (= condMapEmpty!7114 (= mapRest!7113 ((as const (Array (_ BitVec 32) ValueCell!1736)) mapDefault!7114)))))

(assert (=> mapNonEmpty!7113 (= tp!15879 (and e!117237 mapRes!7114))))

(assert (= (and mapNonEmpty!7113 condMapEmpty!7114) mapIsEmpty!7114))

(assert (= (and mapNonEmpty!7113 (not condMapEmpty!7114)) mapNonEmpty!7114))

(assert (= (and mapNonEmpty!7114 ((_ is ValueCellFull!1736) mapValue!7114)) b!177828))

(assert (= (and mapNonEmpty!7113 ((_ is ValueCellFull!1736) mapDefault!7114)) b!177829))

(declare-fun m!206467 () Bool)

(assert (=> mapNonEmpty!7114 m!206467))

(declare-fun b_lambda!7085 () Bool)

(assert (= b_lambda!7083 (or (and b!177470 b_free!4387) b_lambda!7085)))

(declare-fun b_lambda!7087 () Bool)

(assert (= b_lambda!7081 (or (and b!177470 b_free!4387) b_lambda!7087)))

(check-sat (not b!177814) (not b_lambda!7079) (not d!53895) (not d!53871) (not b!177680) (not b!177762) (not d!53893) (not b!177654) (not b!177651) (not b!177759) (not d!53887) (not d!53891) (not b!177766) (not b!177801) (not b!177731) (not b!177813) (not d!53885) (not b!177799) (not d!53881) (not b!177750) (not b!177668) (not mapNonEmpty!7114) (not b!177811) (not d!53905) (not d!53897) (not b!177808) (not bm!17962) (not b!177820) (not b!177732) (not b!177791) (not d!53873) (not b!177821) (not d!53863) (not bm!17959) tp_is_empty!4159 (not d!53903) (not b!177809) (not b!177795) (not d!53853) (not d!53865) (not d!53901) (not d!53867) (not d!53889) (not d!53883) (not d!53879) (not b!177763) (not b!177761) (not b!177760) (not b!177745) (not b!177744) (not b!177693) (not b_lambda!7085) b_and!10913 (not d!53837) (not d!53877) (not d!53839) (not b!177748) (not d!53847) (not b!177756) (not b!177797) (not d!53861) (not bm!17956) (not d!53869) (not b_next!4387) (not d!53843) (not d!53841) (not b!177755) (not b_lambda!7087) (not b!177796) (not b!177800) (not b!177792) (not b!177657) (not bm!17953) (not d!53875) (not b!177747) (not b!177716) (not b!177679) (not b!177652) (not b!177812) (not b!177764) (not b!177757) (not d!53899) (not b!177827))
(check-sat b_and!10913 (not b_next!4387))
