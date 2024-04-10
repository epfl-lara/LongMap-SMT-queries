; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21734 () Bool)

(assert start!21734)

(declare-fun b!218682 () Bool)

(declare-fun b_free!5883 () Bool)

(declare-fun b_next!5883 () Bool)

(assert (=> b!218682 (= b_free!5883 (not b_next!5883))))

(declare-fun tp!20783 () Bool)

(declare-fun b_and!12773 () Bool)

(assert (=> b!218682 (= tp!20783 b_and!12773)))

(declare-fun b!218670 () Bool)

(declare-fun e!142267 () Bool)

(declare-fun e!142255 () Bool)

(declare-fun mapRes!9780 () Bool)

(assert (=> b!218670 (= e!142267 (and e!142255 mapRes!9780))))

(declare-fun condMapEmpty!9780 () Bool)

(declare-datatypes ((V!7307 0))(
  ( (V!7308 (val!2917 Int)) )
))
(declare-datatypes ((ValueCell!2529 0))(
  ( (ValueCellFull!2529 (v!4935 V!7307)) (EmptyCell!2529) )
))
(declare-datatypes ((array!10729 0))(
  ( (array!10730 (arr!5086 (Array (_ BitVec 32) ValueCell!2529)) (size!5418 (_ BitVec 32))) )
))
(declare-datatypes ((array!10731 0))(
  ( (array!10732 (arr!5087 (Array (_ BitVec 32) (_ BitVec 64))) (size!5419 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2958 0))(
  ( (LongMapFixedSize!2959 (defaultEntry!4129 Int) (mask!9908 (_ BitVec 32)) (extraKeys!3866 (_ BitVec 32)) (zeroValue!3970 V!7307) (minValue!3970 V!7307) (_size!1528 (_ BitVec 32)) (_keys!6178 array!10731) (_values!4112 array!10729) (_vacant!1528 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2958)

(declare-fun mapDefault!9780 () ValueCell!2529)

(assert (=> b!218670 (= condMapEmpty!9780 (= (arr!5086 (_values!4112 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2529)) mapDefault!9780)))))

(declare-fun b!218672 () Bool)

(declare-fun e!142258 () Bool)

(declare-fun e!142266 () Bool)

(assert (=> b!218672 (= e!142258 e!142266)))

(declare-fun res!107201 () Bool)

(assert (=> b!218672 (=> (not res!107201) (not e!142266))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!218672 (= res!107201 (inRange!0 index!297 (mask!9908 thiss!1504)))))

(declare-datatypes ((Unit!6518 0))(
  ( (Unit!6519) )
))
(declare-fun lt!111583 () Unit!6518)

(declare-fun e!142259 () Unit!6518)

(assert (=> b!218672 (= lt!111583 e!142259)))

(declare-fun c!36372 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4332 0))(
  ( (tuple2!4333 (_1!2177 (_ BitVec 64)) (_2!2177 V!7307)) )
))
(declare-datatypes ((List!3235 0))(
  ( (Nil!3232) (Cons!3231 (h!3878 tuple2!4332) (t!8190 List!3235)) )
))
(declare-datatypes ((ListLongMap!3245 0))(
  ( (ListLongMap!3246 (toList!1638 List!3235)) )
))
(declare-fun contains!1479 (ListLongMap!3245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1166 (array!10731 array!10729 (_ BitVec 32) (_ BitVec 32) V!7307 V!7307 (_ BitVec 32) Int) ListLongMap!3245)

(assert (=> b!218672 (= c!36372 (contains!1479 (getCurrentListMap!1166 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4129 thiss!1504)) key!932))))

(declare-fun b!218673 () Bool)

(declare-fun e!142262 () Bool)

(declare-datatypes ((SeekEntryResult!792 0))(
  ( (MissingZero!792 (index!5338 (_ BitVec 32))) (Found!792 (index!5339 (_ BitVec 32))) (Intermediate!792 (undefined!1604 Bool) (index!5340 (_ BitVec 32)) (x!22856 (_ BitVec 32))) (Undefined!792) (MissingVacant!792 (index!5341 (_ BitVec 32))) )
))
(declare-fun lt!111584 () SeekEntryResult!792)

(get-info :version)

(assert (=> b!218673 (= e!142262 ((_ is Undefined!792) lt!111584))))

(declare-fun c!36373 () Bool)

(declare-fun call!20412 () Bool)

(declare-fun bm!20408 () Bool)

(assert (=> bm!20408 (= call!20412 (inRange!0 (ite c!36373 (index!5338 lt!111584) (index!5341 lt!111584)) (mask!9908 thiss!1504)))))

(declare-fun b!218674 () Bool)

(declare-fun res!107204 () Bool)

(declare-fun e!142260 () Bool)

(assert (=> b!218674 (=> (not res!107204) (not e!142260))))

(assert (=> b!218674 (= res!107204 (= (select (arr!5087 (_keys!6178 thiss!1504)) (index!5338 lt!111584)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!218675 () Bool)

(declare-fun e!142264 () Bool)

(declare-fun call!20411 () Bool)

(assert (=> b!218675 (= e!142264 (not call!20411))))

(declare-fun b!218676 () Bool)

(declare-fun res!107206 () Bool)

(assert (=> b!218676 (=> (not res!107206) (not e!142260))))

(assert (=> b!218676 (= res!107206 call!20412)))

(declare-fun e!142265 () Bool)

(assert (=> b!218676 (= e!142265 e!142260)))

(declare-fun b!218677 () Bool)

(assert (=> b!218677 (= e!142266 (bvsge #b00000000000000000000000000000000 (size!5419 (_keys!6178 thiss!1504))))))

(declare-fun bm!20409 () Bool)

(declare-fun arrayContainsKey!0 (array!10731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20409 (= call!20411 (arrayContainsKey!0 (_keys!6178 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!218678 () Bool)

(declare-fun Unit!6520 () Unit!6518)

(assert (=> b!218678 (= e!142259 Unit!6520)))

(declare-fun lt!111585 () Unit!6518)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!189 (array!10731 array!10729 (_ BitVec 32) (_ BitVec 32) V!7307 V!7307 (_ BitVec 64) Int) Unit!6518)

(assert (=> b!218678 (= lt!111585 (lemmaInListMapThenSeekEntryOrOpenFindsIt!189 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) key!932 (defaultEntry!4129 thiss!1504)))))

(assert (=> b!218678 false))

(declare-fun b!218679 () Bool)

(declare-fun c!36374 () Bool)

(assert (=> b!218679 (= c!36374 ((_ is MissingVacant!792) lt!111584))))

(assert (=> b!218679 (= e!142265 e!142262)))

(declare-fun mapIsEmpty!9780 () Bool)

(assert (=> mapIsEmpty!9780 mapRes!9780))

(declare-fun b!218680 () Bool)

(declare-fun e!142263 () Bool)

(assert (=> b!218680 (= e!142263 e!142258)))

(declare-fun res!107205 () Bool)

(assert (=> b!218680 (=> (not res!107205) (not e!142258))))

(assert (=> b!218680 (= res!107205 (or (= lt!111584 (MissingZero!792 index!297)) (= lt!111584 (MissingVacant!792 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10731 (_ BitVec 32)) SeekEntryResult!792)

(assert (=> b!218680 (= lt!111584 (seekEntryOrOpen!0 key!932 (_keys!6178 thiss!1504) (mask!9908 thiss!1504)))))

(declare-fun b!218681 () Bool)

(declare-fun e!142261 () Bool)

(declare-fun tp_is_empty!5745 () Bool)

(assert (=> b!218681 (= e!142261 tp_is_empty!5745)))

(declare-fun e!142256 () Bool)

(declare-fun array_inv!3367 (array!10731) Bool)

(declare-fun array_inv!3368 (array!10729) Bool)

(assert (=> b!218682 (= e!142256 (and tp!20783 tp_is_empty!5745 (array_inv!3367 (_keys!6178 thiss!1504)) (array_inv!3368 (_values!4112 thiss!1504)) e!142267))))

(declare-fun res!107207 () Bool)

(assert (=> start!21734 (=> (not res!107207) (not e!142263))))

(declare-fun valid!1197 (LongMapFixedSize!2958) Bool)

(assert (=> start!21734 (= res!107207 (valid!1197 thiss!1504))))

(assert (=> start!21734 e!142263))

(assert (=> start!21734 e!142256))

(assert (=> start!21734 true))

(declare-fun b!218671 () Bool)

(assert (=> b!218671 (= e!142255 tp_is_empty!5745)))

(declare-fun mapNonEmpty!9780 () Bool)

(declare-fun tp!20784 () Bool)

(assert (=> mapNonEmpty!9780 (= mapRes!9780 (and tp!20784 e!142261))))

(declare-fun mapValue!9780 () ValueCell!2529)

(declare-fun mapRest!9780 () (Array (_ BitVec 32) ValueCell!2529))

(declare-fun mapKey!9780 () (_ BitVec 32))

(assert (=> mapNonEmpty!9780 (= (arr!5086 (_values!4112 thiss!1504)) (store mapRest!9780 mapKey!9780 mapValue!9780))))

(declare-fun b!218683 () Bool)

(declare-fun lt!111582 () Unit!6518)

(assert (=> b!218683 (= e!142259 lt!111582)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!202 (array!10731 array!10729 (_ BitVec 32) (_ BitVec 32) V!7307 V!7307 (_ BitVec 64) Int) Unit!6518)

(assert (=> b!218683 (= lt!111582 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!202 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) key!932 (defaultEntry!4129 thiss!1504)))))

(assert (=> b!218683 (= c!36373 ((_ is MissingZero!792) lt!111584))))

(assert (=> b!218683 e!142265))

(declare-fun b!218684 () Bool)

(declare-fun res!107203 () Bool)

(assert (=> b!218684 (= res!107203 (= (select (arr!5087 (_keys!6178 thiss!1504)) (index!5341 lt!111584)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218684 (=> (not res!107203) (not e!142264))))

(declare-fun b!218685 () Bool)

(declare-fun res!107208 () Bool)

(assert (=> b!218685 (=> (not res!107208) (not e!142263))))

(assert (=> b!218685 (= res!107208 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218686 () Bool)

(assert (=> b!218686 (= e!142260 (not call!20411))))

(declare-fun b!218687 () Bool)

(assert (=> b!218687 (= e!142262 e!142264)))

(declare-fun res!107202 () Bool)

(assert (=> b!218687 (= res!107202 call!20412)))

(assert (=> b!218687 (=> (not res!107202) (not e!142264))))

(assert (= (and start!21734 res!107207) b!218685))

(assert (= (and b!218685 res!107208) b!218680))

(assert (= (and b!218680 res!107205) b!218672))

(assert (= (and b!218672 c!36372) b!218678))

(assert (= (and b!218672 (not c!36372)) b!218683))

(assert (= (and b!218683 c!36373) b!218676))

(assert (= (and b!218683 (not c!36373)) b!218679))

(assert (= (and b!218676 res!107206) b!218674))

(assert (= (and b!218674 res!107204) b!218686))

(assert (= (and b!218679 c!36374) b!218687))

(assert (= (and b!218679 (not c!36374)) b!218673))

(assert (= (and b!218687 res!107202) b!218684))

(assert (= (and b!218684 res!107203) b!218675))

(assert (= (or b!218676 b!218687) bm!20408))

(assert (= (or b!218686 b!218675) bm!20409))

(assert (= (and b!218672 res!107201) b!218677))

(assert (= (and b!218670 condMapEmpty!9780) mapIsEmpty!9780))

(assert (= (and b!218670 (not condMapEmpty!9780)) mapNonEmpty!9780))

(assert (= (and mapNonEmpty!9780 ((_ is ValueCellFull!2529) mapValue!9780)) b!218681))

(assert (= (and b!218670 ((_ is ValueCellFull!2529) mapDefault!9780)) b!218671))

(assert (= b!218682 b!218670))

(assert (= start!21734 b!218682))

(declare-fun m!244475 () Bool)

(assert (=> b!218672 m!244475))

(declare-fun m!244477 () Bool)

(assert (=> b!218672 m!244477))

(assert (=> b!218672 m!244477))

(declare-fun m!244479 () Bool)

(assert (=> b!218672 m!244479))

(declare-fun m!244481 () Bool)

(assert (=> b!218684 m!244481))

(declare-fun m!244483 () Bool)

(assert (=> bm!20409 m!244483))

(declare-fun m!244485 () Bool)

(assert (=> b!218683 m!244485))

(declare-fun m!244487 () Bool)

(assert (=> b!218674 m!244487))

(declare-fun m!244489 () Bool)

(assert (=> b!218680 m!244489))

(declare-fun m!244491 () Bool)

(assert (=> start!21734 m!244491))

(declare-fun m!244493 () Bool)

(assert (=> mapNonEmpty!9780 m!244493))

(declare-fun m!244495 () Bool)

(assert (=> bm!20408 m!244495))

(declare-fun m!244497 () Bool)

(assert (=> b!218678 m!244497))

(declare-fun m!244499 () Bool)

(assert (=> b!218682 m!244499))

(declare-fun m!244501 () Bool)

(assert (=> b!218682 m!244501))

(check-sat (not b!218678) (not start!21734) (not b_next!5883) (not b!218680) (not b!218672) tp_is_empty!5745 (not bm!20408) (not b!218683) (not b!218682) b_and!12773 (not mapNonEmpty!9780) (not bm!20409))
(check-sat b_and!12773 (not b_next!5883))
(get-model)

(declare-fun lt!111604 () SeekEntryResult!792)

(declare-fun b!218754 () Bool)

(declare-fun e!142314 () SeekEntryResult!792)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10731 (_ BitVec 32)) SeekEntryResult!792)

(assert (=> b!218754 (= e!142314 (seekKeyOrZeroReturnVacant!0 (x!22856 lt!111604) (index!5340 lt!111604) (index!5340 lt!111604) key!932 (_keys!6178 thiss!1504) (mask!9908 thiss!1504)))))

(declare-fun b!218755 () Bool)

(assert (=> b!218755 (= e!142314 (MissingZero!792 (index!5340 lt!111604)))))

(declare-fun d!58599 () Bool)

(declare-fun lt!111605 () SeekEntryResult!792)

(assert (=> d!58599 (and (or ((_ is Undefined!792) lt!111605) (not ((_ is Found!792) lt!111605)) (and (bvsge (index!5339 lt!111605) #b00000000000000000000000000000000) (bvslt (index!5339 lt!111605) (size!5419 (_keys!6178 thiss!1504))))) (or ((_ is Undefined!792) lt!111605) ((_ is Found!792) lt!111605) (not ((_ is MissingZero!792) lt!111605)) (and (bvsge (index!5338 lt!111605) #b00000000000000000000000000000000) (bvslt (index!5338 lt!111605) (size!5419 (_keys!6178 thiss!1504))))) (or ((_ is Undefined!792) lt!111605) ((_ is Found!792) lt!111605) ((_ is MissingZero!792) lt!111605) (not ((_ is MissingVacant!792) lt!111605)) (and (bvsge (index!5341 lt!111605) #b00000000000000000000000000000000) (bvslt (index!5341 lt!111605) (size!5419 (_keys!6178 thiss!1504))))) (or ((_ is Undefined!792) lt!111605) (ite ((_ is Found!792) lt!111605) (= (select (arr!5087 (_keys!6178 thiss!1504)) (index!5339 lt!111605)) key!932) (ite ((_ is MissingZero!792) lt!111605) (= (select (arr!5087 (_keys!6178 thiss!1504)) (index!5338 lt!111605)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!792) lt!111605) (= (select (arr!5087 (_keys!6178 thiss!1504)) (index!5341 lt!111605)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!142315 () SeekEntryResult!792)

(assert (=> d!58599 (= lt!111605 e!142315)))

(declare-fun c!36390 () Bool)

(assert (=> d!58599 (= c!36390 (and ((_ is Intermediate!792) lt!111604) (undefined!1604 lt!111604)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10731 (_ BitVec 32)) SeekEntryResult!792)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58599 (= lt!111604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9908 thiss!1504)) key!932 (_keys!6178 thiss!1504) (mask!9908 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!58599 (validMask!0 (mask!9908 thiss!1504))))

(assert (=> d!58599 (= (seekEntryOrOpen!0 key!932 (_keys!6178 thiss!1504) (mask!9908 thiss!1504)) lt!111605)))

(declare-fun b!218756 () Bool)

(assert (=> b!218756 (= e!142315 Undefined!792)))

(declare-fun b!218757 () Bool)

(declare-fun e!142313 () SeekEntryResult!792)

(assert (=> b!218757 (= e!142313 (Found!792 (index!5340 lt!111604)))))

(declare-fun b!218758 () Bool)

(assert (=> b!218758 (= e!142315 e!142313)))

(declare-fun lt!111606 () (_ BitVec 64))

(assert (=> b!218758 (= lt!111606 (select (arr!5087 (_keys!6178 thiss!1504)) (index!5340 lt!111604)))))

(declare-fun c!36392 () Bool)

(assert (=> b!218758 (= c!36392 (= lt!111606 key!932))))

(declare-fun b!218759 () Bool)

(declare-fun c!36391 () Bool)

(assert (=> b!218759 (= c!36391 (= lt!111606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218759 (= e!142313 e!142314)))

(assert (= (and d!58599 c!36390) b!218756))

(assert (= (and d!58599 (not c!36390)) b!218758))

(assert (= (and b!218758 c!36392) b!218757))

(assert (= (and b!218758 (not c!36392)) b!218759))

(assert (= (and b!218759 c!36391) b!218755))

(assert (= (and b!218759 (not c!36391)) b!218754))

(declare-fun m!244531 () Bool)

(assert (=> b!218754 m!244531))

(declare-fun m!244533 () Bool)

(assert (=> d!58599 m!244533))

(declare-fun m!244535 () Bool)

(assert (=> d!58599 m!244535))

(declare-fun m!244537 () Bool)

(assert (=> d!58599 m!244537))

(declare-fun m!244539 () Bool)

(assert (=> d!58599 m!244539))

(assert (=> d!58599 m!244539))

(declare-fun m!244541 () Bool)

(assert (=> d!58599 m!244541))

(declare-fun m!244543 () Bool)

(assert (=> d!58599 m!244543))

(declare-fun m!244545 () Bool)

(assert (=> b!218758 m!244545))

(assert (=> b!218680 d!58599))

(declare-fun d!58601 () Bool)

(assert (=> d!58601 (= (inRange!0 index!297 (mask!9908 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!9908 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!218672 d!58601))

(declare-fun d!58603 () Bool)

(declare-fun e!142321 () Bool)

(assert (=> d!58603 e!142321))

(declare-fun res!107235 () Bool)

(assert (=> d!58603 (=> res!107235 e!142321)))

(declare-fun lt!111615 () Bool)

(assert (=> d!58603 (= res!107235 (not lt!111615))))

(declare-fun lt!111616 () Bool)

(assert (=> d!58603 (= lt!111615 lt!111616)))

(declare-fun lt!111617 () Unit!6518)

(declare-fun e!142320 () Unit!6518)

(assert (=> d!58603 (= lt!111617 e!142320)))

(declare-fun c!36395 () Bool)

(assert (=> d!58603 (= c!36395 lt!111616)))

(declare-fun containsKey!251 (List!3235 (_ BitVec 64)) Bool)

(assert (=> d!58603 (= lt!111616 (containsKey!251 (toList!1638 (getCurrentListMap!1166 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4129 thiss!1504))) key!932))))

(assert (=> d!58603 (= (contains!1479 (getCurrentListMap!1166 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4129 thiss!1504)) key!932) lt!111615)))

(declare-fun b!218766 () Bool)

(declare-fun lt!111618 () Unit!6518)

(assert (=> b!218766 (= e!142320 lt!111618)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!199 (List!3235 (_ BitVec 64)) Unit!6518)

(assert (=> b!218766 (= lt!111618 (lemmaContainsKeyImpliesGetValueByKeyDefined!199 (toList!1638 (getCurrentListMap!1166 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4129 thiss!1504))) key!932))))

(declare-datatypes ((Option!265 0))(
  ( (Some!264 (v!4937 V!7307)) (None!263) )
))
(declare-fun isDefined!200 (Option!265) Bool)

(declare-fun getValueByKey!259 (List!3235 (_ BitVec 64)) Option!265)

(assert (=> b!218766 (isDefined!200 (getValueByKey!259 (toList!1638 (getCurrentListMap!1166 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4129 thiss!1504))) key!932))))

(declare-fun b!218767 () Bool)

(declare-fun Unit!6524 () Unit!6518)

(assert (=> b!218767 (= e!142320 Unit!6524)))

(declare-fun b!218768 () Bool)

(assert (=> b!218768 (= e!142321 (isDefined!200 (getValueByKey!259 (toList!1638 (getCurrentListMap!1166 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4129 thiss!1504))) key!932)))))

(assert (= (and d!58603 c!36395) b!218766))

(assert (= (and d!58603 (not c!36395)) b!218767))

(assert (= (and d!58603 (not res!107235)) b!218768))

(declare-fun m!244547 () Bool)

(assert (=> d!58603 m!244547))

(declare-fun m!244549 () Bool)

(assert (=> b!218766 m!244549))

(declare-fun m!244551 () Bool)

(assert (=> b!218766 m!244551))

(assert (=> b!218766 m!244551))

(declare-fun m!244553 () Bool)

(assert (=> b!218766 m!244553))

(assert (=> b!218768 m!244551))

(assert (=> b!218768 m!244551))

(assert (=> b!218768 m!244553))

(assert (=> b!218672 d!58603))

(declare-fun b!218811 () Bool)

(declare-fun e!142356 () ListLongMap!3245)

(declare-fun call!20438 () ListLongMap!3245)

(declare-fun +!596 (ListLongMap!3245 tuple2!4332) ListLongMap!3245)

(assert (=> b!218811 (= e!142356 (+!596 call!20438 (tuple2!4333 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3970 thiss!1504))))))

(declare-fun bm!20431 () Bool)

(declare-fun call!20435 () Bool)

(declare-fun lt!111677 () ListLongMap!3245)

(assert (=> bm!20431 (= call!20435 (contains!1479 lt!111677 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!218812 () Bool)

(declare-fun res!107258 () Bool)

(declare-fun e!142348 () Bool)

(assert (=> b!218812 (=> (not res!107258) (not e!142348))))

(declare-fun e!142352 () Bool)

(assert (=> b!218812 (= res!107258 e!142352)))

(declare-fun c!36413 () Bool)

(assert (=> b!218812 (= c!36413 (not (= (bvand (extraKeys!3866 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!218813 () Bool)

(declare-fun e!142354 () Bool)

(declare-fun apply!201 (ListLongMap!3245 (_ BitVec 64)) V!7307)

(assert (=> b!218813 (= e!142354 (= (apply!201 lt!111677 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3970 thiss!1504)))))

(declare-fun b!218814 () Bool)

(declare-fun e!142358 () ListLongMap!3245)

(declare-fun call!20433 () ListLongMap!3245)

(assert (=> b!218814 (= e!142358 call!20433)))

(declare-fun bm!20432 () Bool)

(declare-fun call!20436 () Bool)

(assert (=> bm!20432 (= call!20436 (contains!1479 lt!111677 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!218815 () Bool)

(declare-fun e!142353 () Bool)

(declare-fun e!142350 () Bool)

(assert (=> b!218815 (= e!142353 e!142350)))

(declare-fun res!107256 () Bool)

(assert (=> b!218815 (= res!107256 call!20436)))

(assert (=> b!218815 (=> (not res!107256) (not e!142350))))

(declare-fun b!218816 () Bool)

(declare-fun e!142355 () Bool)

(declare-fun get!2671 (ValueCell!2529 V!7307) V!7307)

(declare-fun dynLambda!544 (Int (_ BitVec 64)) V!7307)

(assert (=> b!218816 (= e!142355 (= (apply!201 lt!111677 (select (arr!5087 (_keys!6178 thiss!1504)) #b00000000000000000000000000000000)) (get!2671 (select (arr!5086 (_values!4112 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!544 (defaultEntry!4129 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!218816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5418 (_values!4112 thiss!1504))))))

(assert (=> b!218816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6178 thiss!1504))))))

(declare-fun b!218817 () Bool)

(assert (=> b!218817 (= e!142352 (not call!20435))))

(declare-fun bm!20430 () Bool)

(declare-fun call!20434 () ListLongMap!3245)

(assert (=> bm!20430 (= call!20434 call!20438)))

(declare-fun d!58605 () Bool)

(assert (=> d!58605 e!142348))

(declare-fun res!107254 () Bool)

(assert (=> d!58605 (=> (not res!107254) (not e!142348))))

(assert (=> d!58605 (= res!107254 (or (bvsge #b00000000000000000000000000000000 (size!5419 (_keys!6178 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6178 thiss!1504))))))))

(declare-fun lt!111667 () ListLongMap!3245)

(assert (=> d!58605 (= lt!111677 lt!111667)))

(declare-fun lt!111663 () Unit!6518)

(declare-fun e!142359 () Unit!6518)

(assert (=> d!58605 (= lt!111663 e!142359)))

(declare-fun c!36411 () Bool)

(declare-fun e!142357 () Bool)

(assert (=> d!58605 (= c!36411 e!142357)))

(declare-fun res!107260 () Bool)

(assert (=> d!58605 (=> (not res!107260) (not e!142357))))

(assert (=> d!58605 (= res!107260 (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6178 thiss!1504))))))

(assert (=> d!58605 (= lt!111667 e!142356)))

(declare-fun c!36410 () Bool)

(assert (=> d!58605 (= c!36410 (and (not (= (bvand (extraKeys!3866 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3866 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58605 (validMask!0 (mask!9908 thiss!1504))))

(assert (=> d!58605 (= (getCurrentListMap!1166 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4129 thiss!1504)) lt!111677)))

(declare-fun b!218818 () Bool)

(assert (=> b!218818 (= e!142348 e!142353)))

(declare-fun c!36408 () Bool)

(assert (=> b!218818 (= c!36408 (not (= (bvand (extraKeys!3866 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!218819 () Bool)

(declare-fun e!142360 () ListLongMap!3245)

(assert (=> b!218819 (= e!142360 call!20434)))

(declare-fun b!218820 () Bool)

(assert (=> b!218820 (= e!142353 (not call!20436))))

(declare-fun b!218821 () Bool)

(assert (=> b!218821 (= e!142356 e!142360)))

(declare-fun c!36412 () Bool)

(assert (=> b!218821 (= c!36412 (and (not (= (bvand (extraKeys!3866 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3866 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!20439 () ListLongMap!3245)

(declare-fun bm!20433 () Bool)

(declare-fun call!20437 () ListLongMap!3245)

(assert (=> bm!20433 (= call!20438 (+!596 (ite c!36410 call!20439 (ite c!36412 call!20437 call!20433)) (ite (or c!36410 c!36412) (tuple2!4333 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3970 thiss!1504)) (tuple2!4333 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3970 thiss!1504)))))))

(declare-fun b!218822 () Bool)

(declare-fun Unit!6525 () Unit!6518)

(assert (=> b!218822 (= e!142359 Unit!6525)))

(declare-fun bm!20434 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!523 (array!10731 array!10729 (_ BitVec 32) (_ BitVec 32) V!7307 V!7307 (_ BitVec 32) Int) ListLongMap!3245)

(assert (=> bm!20434 (= call!20439 (getCurrentListMapNoExtraKeys!523 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4129 thiss!1504)))))

(declare-fun bm!20435 () Bool)

(assert (=> bm!20435 (= call!20437 call!20439)))

(declare-fun b!218823 () Bool)

(assert (=> b!218823 (= e!142350 (= (apply!201 lt!111677 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3970 thiss!1504)))))

(declare-fun b!218824 () Bool)

(assert (=> b!218824 (= e!142358 call!20434)))

(declare-fun b!218825 () Bool)

(assert (=> b!218825 (= e!142352 e!142354)))

(declare-fun res!107257 () Bool)

(assert (=> b!218825 (= res!107257 call!20435)))

(assert (=> b!218825 (=> (not res!107257) (not e!142354))))

(declare-fun b!218826 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!218826 (= e!142357 (validKeyInArray!0 (select (arr!5087 (_keys!6178 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!218827 () Bool)

(declare-fun res!107261 () Bool)

(assert (=> b!218827 (=> (not res!107261) (not e!142348))))

(declare-fun e!142351 () Bool)

(assert (=> b!218827 (= res!107261 e!142351)))

(declare-fun res!107255 () Bool)

(assert (=> b!218827 (=> res!107255 e!142351)))

(declare-fun e!142349 () Bool)

(assert (=> b!218827 (= res!107255 (not e!142349))))

(declare-fun res!107262 () Bool)

(assert (=> b!218827 (=> (not res!107262) (not e!142349))))

(assert (=> b!218827 (= res!107262 (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6178 thiss!1504))))))

(declare-fun bm!20436 () Bool)

(assert (=> bm!20436 (= call!20433 call!20437)))

(declare-fun b!218828 () Bool)

(declare-fun lt!111683 () Unit!6518)

(assert (=> b!218828 (= e!142359 lt!111683)))

(declare-fun lt!111680 () ListLongMap!3245)

(assert (=> b!218828 (= lt!111680 (getCurrentListMapNoExtraKeys!523 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4129 thiss!1504)))))

(declare-fun lt!111681 () (_ BitVec 64))

(assert (=> b!218828 (= lt!111681 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111678 () (_ BitVec 64))

(assert (=> b!218828 (= lt!111678 (select (arr!5087 (_keys!6178 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111682 () Unit!6518)

(declare-fun addStillContains!177 (ListLongMap!3245 (_ BitVec 64) V!7307 (_ BitVec 64)) Unit!6518)

(assert (=> b!218828 (= lt!111682 (addStillContains!177 lt!111680 lt!111681 (zeroValue!3970 thiss!1504) lt!111678))))

(assert (=> b!218828 (contains!1479 (+!596 lt!111680 (tuple2!4333 lt!111681 (zeroValue!3970 thiss!1504))) lt!111678)))

(declare-fun lt!111668 () Unit!6518)

(assert (=> b!218828 (= lt!111668 lt!111682)))

(declare-fun lt!111665 () ListLongMap!3245)

(assert (=> b!218828 (= lt!111665 (getCurrentListMapNoExtraKeys!523 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4129 thiss!1504)))))

(declare-fun lt!111673 () (_ BitVec 64))

(assert (=> b!218828 (= lt!111673 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111669 () (_ BitVec 64))

(assert (=> b!218828 (= lt!111669 (select (arr!5087 (_keys!6178 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111671 () Unit!6518)

(declare-fun addApplyDifferent!177 (ListLongMap!3245 (_ BitVec 64) V!7307 (_ BitVec 64)) Unit!6518)

(assert (=> b!218828 (= lt!111671 (addApplyDifferent!177 lt!111665 lt!111673 (minValue!3970 thiss!1504) lt!111669))))

(assert (=> b!218828 (= (apply!201 (+!596 lt!111665 (tuple2!4333 lt!111673 (minValue!3970 thiss!1504))) lt!111669) (apply!201 lt!111665 lt!111669))))

(declare-fun lt!111670 () Unit!6518)

(assert (=> b!218828 (= lt!111670 lt!111671)))

(declare-fun lt!111679 () ListLongMap!3245)

(assert (=> b!218828 (= lt!111679 (getCurrentListMapNoExtraKeys!523 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4129 thiss!1504)))))

(declare-fun lt!111664 () (_ BitVec 64))

(assert (=> b!218828 (= lt!111664 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111675 () (_ BitVec 64))

(assert (=> b!218828 (= lt!111675 (select (arr!5087 (_keys!6178 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111674 () Unit!6518)

(assert (=> b!218828 (= lt!111674 (addApplyDifferent!177 lt!111679 lt!111664 (zeroValue!3970 thiss!1504) lt!111675))))

(assert (=> b!218828 (= (apply!201 (+!596 lt!111679 (tuple2!4333 lt!111664 (zeroValue!3970 thiss!1504))) lt!111675) (apply!201 lt!111679 lt!111675))))

(declare-fun lt!111676 () Unit!6518)

(assert (=> b!218828 (= lt!111676 lt!111674)))

(declare-fun lt!111672 () ListLongMap!3245)

(assert (=> b!218828 (= lt!111672 (getCurrentListMapNoExtraKeys!523 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4129 thiss!1504)))))

(declare-fun lt!111684 () (_ BitVec 64))

(assert (=> b!218828 (= lt!111684 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111666 () (_ BitVec 64))

(assert (=> b!218828 (= lt!111666 (select (arr!5087 (_keys!6178 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218828 (= lt!111683 (addApplyDifferent!177 lt!111672 lt!111684 (minValue!3970 thiss!1504) lt!111666))))

(assert (=> b!218828 (= (apply!201 (+!596 lt!111672 (tuple2!4333 lt!111684 (minValue!3970 thiss!1504))) lt!111666) (apply!201 lt!111672 lt!111666))))

(declare-fun b!218829 () Bool)

(assert (=> b!218829 (= e!142351 e!142355)))

(declare-fun res!107259 () Bool)

(assert (=> b!218829 (=> (not res!107259) (not e!142355))))

(assert (=> b!218829 (= res!107259 (contains!1479 lt!111677 (select (arr!5087 (_keys!6178 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!218829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6178 thiss!1504))))))

(declare-fun b!218830 () Bool)

(assert (=> b!218830 (= e!142349 (validKeyInArray!0 (select (arr!5087 (_keys!6178 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!218831 () Bool)

(declare-fun c!36409 () Bool)

(assert (=> b!218831 (= c!36409 (and (not (= (bvand (extraKeys!3866 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3866 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!218831 (= e!142360 e!142358)))

(assert (= (and d!58605 c!36410) b!218811))

(assert (= (and d!58605 (not c!36410)) b!218821))

(assert (= (and b!218821 c!36412) b!218819))

(assert (= (and b!218821 (not c!36412)) b!218831))

(assert (= (and b!218831 c!36409) b!218824))

(assert (= (and b!218831 (not c!36409)) b!218814))

(assert (= (or b!218824 b!218814) bm!20436))

(assert (= (or b!218819 bm!20436) bm!20435))

(assert (= (or b!218819 b!218824) bm!20430))

(assert (= (or b!218811 bm!20435) bm!20434))

(assert (= (or b!218811 bm!20430) bm!20433))

(assert (= (and d!58605 res!107260) b!218826))

(assert (= (and d!58605 c!36411) b!218828))

(assert (= (and d!58605 (not c!36411)) b!218822))

(assert (= (and d!58605 res!107254) b!218827))

(assert (= (and b!218827 res!107262) b!218830))

(assert (= (and b!218827 (not res!107255)) b!218829))

(assert (= (and b!218829 res!107259) b!218816))

(assert (= (and b!218827 res!107261) b!218812))

(assert (= (and b!218812 c!36413) b!218825))

(assert (= (and b!218812 (not c!36413)) b!218817))

(assert (= (and b!218825 res!107257) b!218813))

(assert (= (or b!218825 b!218817) bm!20431))

(assert (= (and b!218812 res!107258) b!218818))

(assert (= (and b!218818 c!36408) b!218815))

(assert (= (and b!218818 (not c!36408)) b!218820))

(assert (= (and b!218815 res!107256) b!218823))

(assert (= (or b!218815 b!218820) bm!20432))

(declare-fun b_lambda!7827 () Bool)

(assert (=> (not b_lambda!7827) (not b!218816)))

(declare-fun t!8192 () Bool)

(declare-fun tb!2915 () Bool)

(assert (=> (and b!218682 (= (defaultEntry!4129 thiss!1504) (defaultEntry!4129 thiss!1504)) t!8192) tb!2915))

(declare-fun result!5067 () Bool)

(assert (=> tb!2915 (= result!5067 tp_is_empty!5745)))

(assert (=> b!218816 t!8192))

(declare-fun b_and!12777 () Bool)

(assert (= b_and!12773 (and (=> t!8192 result!5067) b_and!12777)))

(declare-fun m!244555 () Bool)

(assert (=> b!218830 m!244555))

(assert (=> b!218830 m!244555))

(declare-fun m!244557 () Bool)

(assert (=> b!218830 m!244557))

(declare-fun m!244559 () Bool)

(assert (=> b!218828 m!244559))

(declare-fun m!244561 () Bool)

(assert (=> b!218828 m!244561))

(declare-fun m!244563 () Bool)

(assert (=> b!218828 m!244563))

(declare-fun m!244565 () Bool)

(assert (=> b!218828 m!244565))

(declare-fun m!244567 () Bool)

(assert (=> b!218828 m!244567))

(declare-fun m!244569 () Bool)

(assert (=> b!218828 m!244569))

(declare-fun m!244571 () Bool)

(assert (=> b!218828 m!244571))

(declare-fun m!244573 () Bool)

(assert (=> b!218828 m!244573))

(declare-fun m!244575 () Bool)

(assert (=> b!218828 m!244575))

(assert (=> b!218828 m!244569))

(declare-fun m!244577 () Bool)

(assert (=> b!218828 m!244577))

(assert (=> b!218828 m!244559))

(declare-fun m!244579 () Bool)

(assert (=> b!218828 m!244579))

(assert (=> b!218828 m!244555))

(declare-fun m!244581 () Bool)

(assert (=> b!218828 m!244581))

(assert (=> b!218828 m!244565))

(declare-fun m!244583 () Bool)

(assert (=> b!218828 m!244583))

(declare-fun m!244585 () Bool)

(assert (=> b!218828 m!244585))

(assert (=> b!218828 m!244561))

(declare-fun m!244587 () Bool)

(assert (=> b!218828 m!244587))

(declare-fun m!244589 () Bool)

(assert (=> b!218828 m!244589))

(declare-fun m!244591 () Bool)

(assert (=> b!218811 m!244591))

(declare-fun m!244593 () Bool)

(assert (=> b!218823 m!244593))

(declare-fun m!244595 () Bool)

(assert (=> b!218813 m!244595))

(declare-fun m!244597 () Bool)

(assert (=> bm!20432 m!244597))

(assert (=> d!58605 m!244537))

(assert (=> bm!20434 m!244563))

(assert (=> b!218826 m!244555))

(assert (=> b!218826 m!244555))

(assert (=> b!218826 m!244557))

(assert (=> b!218829 m!244555))

(assert (=> b!218829 m!244555))

(declare-fun m!244599 () Bool)

(assert (=> b!218829 m!244599))

(declare-fun m!244601 () Bool)

(assert (=> bm!20431 m!244601))

(declare-fun m!244603 () Bool)

(assert (=> bm!20433 m!244603))

(declare-fun m!244605 () Bool)

(assert (=> b!218816 m!244605))

(declare-fun m!244607 () Bool)

(assert (=> b!218816 m!244607))

(assert (=> b!218816 m!244605))

(declare-fun m!244609 () Bool)

(assert (=> b!218816 m!244609))

(assert (=> b!218816 m!244555))

(assert (=> b!218816 m!244555))

(declare-fun m!244611 () Bool)

(assert (=> b!218816 m!244611))

(assert (=> b!218816 m!244607))

(assert (=> b!218672 d!58605))

(declare-fun b!218850 () Bool)

(declare-fun e!142369 () Bool)

(declare-fun lt!111690 () SeekEntryResult!792)

(assert (=> b!218850 (= e!142369 ((_ is Undefined!792) lt!111690))))

(declare-fun b!218851 () Bool)

(declare-fun e!142372 () Bool)

(declare-fun e!142370 () Bool)

(assert (=> b!218851 (= e!142372 e!142370)))

(declare-fun res!107273 () Bool)

(declare-fun call!20444 () Bool)

(assert (=> b!218851 (= res!107273 call!20444)))

(assert (=> b!218851 (=> (not res!107273) (not e!142370))))

(declare-fun b!218852 () Bool)

(declare-fun e!142371 () Bool)

(declare-fun call!20445 () Bool)

(assert (=> b!218852 (= e!142371 (not call!20445))))

(declare-fun b!218853 () Bool)

(assert (=> b!218853 (and (bvsge (index!5338 lt!111690) #b00000000000000000000000000000000) (bvslt (index!5338 lt!111690) (size!5419 (_keys!6178 thiss!1504))))))

(declare-fun res!107272 () Bool)

(assert (=> b!218853 (= res!107272 (= (select (arr!5087 (_keys!6178 thiss!1504)) (index!5338 lt!111690)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218853 (=> (not res!107272) (not e!142370))))

(declare-fun b!218854 () Bool)

(assert (=> b!218854 (= e!142370 (not call!20445))))

(declare-fun bm!20441 () Bool)

(assert (=> bm!20441 (= call!20445 (arrayContainsKey!0 (_keys!6178 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!218855 () Bool)

(declare-fun res!107271 () Bool)

(assert (=> b!218855 (=> (not res!107271) (not e!142371))))

(assert (=> b!218855 (= res!107271 call!20444)))

(assert (=> b!218855 (= e!142369 e!142371)))

(declare-fun b!218856 () Bool)

(assert (=> b!218856 (= e!142372 e!142369)))

(declare-fun c!36419 () Bool)

(assert (=> b!218856 (= c!36419 ((_ is MissingVacant!792) lt!111690))))

(declare-fun d!58607 () Bool)

(assert (=> d!58607 e!142372))

(declare-fun c!36418 () Bool)

(assert (=> d!58607 (= c!36418 ((_ is MissingZero!792) lt!111690))))

(assert (=> d!58607 (= lt!111690 (seekEntryOrOpen!0 key!932 (_keys!6178 thiss!1504) (mask!9908 thiss!1504)))))

(declare-fun lt!111689 () Unit!6518)

(declare-fun choose!1085 (array!10731 array!10729 (_ BitVec 32) (_ BitVec 32) V!7307 V!7307 (_ BitVec 64) Int) Unit!6518)

(assert (=> d!58607 (= lt!111689 (choose!1085 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) key!932 (defaultEntry!4129 thiss!1504)))))

(assert (=> d!58607 (validMask!0 (mask!9908 thiss!1504))))

(assert (=> d!58607 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!202 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) key!932 (defaultEntry!4129 thiss!1504)) lt!111689)))

(declare-fun b!218857 () Bool)

(declare-fun res!107274 () Bool)

(assert (=> b!218857 (=> (not res!107274) (not e!142371))))

(assert (=> b!218857 (= res!107274 (= (select (arr!5087 (_keys!6178 thiss!1504)) (index!5341 lt!111690)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218857 (and (bvsge (index!5341 lt!111690) #b00000000000000000000000000000000) (bvslt (index!5341 lt!111690) (size!5419 (_keys!6178 thiss!1504))))))

(declare-fun bm!20442 () Bool)

(assert (=> bm!20442 (= call!20444 (inRange!0 (ite c!36418 (index!5338 lt!111690) (index!5341 lt!111690)) (mask!9908 thiss!1504)))))

(assert (= (and d!58607 c!36418) b!218851))

(assert (= (and d!58607 (not c!36418)) b!218856))

(assert (= (and b!218851 res!107273) b!218853))

(assert (= (and b!218853 res!107272) b!218854))

(assert (= (and b!218856 c!36419) b!218855))

(assert (= (and b!218856 (not c!36419)) b!218850))

(assert (= (and b!218855 res!107271) b!218857))

(assert (= (and b!218857 res!107274) b!218852))

(assert (= (or b!218851 b!218855) bm!20442))

(assert (= (or b!218854 b!218852) bm!20441))

(assert (=> d!58607 m!244489))

(declare-fun m!244613 () Bool)

(assert (=> d!58607 m!244613))

(assert (=> d!58607 m!244537))

(assert (=> bm!20441 m!244483))

(declare-fun m!244615 () Bool)

(assert (=> b!218853 m!244615))

(declare-fun m!244617 () Bool)

(assert (=> b!218857 m!244617))

(declare-fun m!244619 () Bool)

(assert (=> bm!20442 m!244619))

(assert (=> b!218683 d!58607))

(declare-fun d!58609 () Bool)

(assert (=> d!58609 (= (array_inv!3367 (_keys!6178 thiss!1504)) (bvsge (size!5419 (_keys!6178 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218682 d!58609))

(declare-fun d!58611 () Bool)

(assert (=> d!58611 (= (array_inv!3368 (_values!4112 thiss!1504)) (bvsge (size!5418 (_values!4112 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218682 d!58611))

(declare-fun d!58613 () Bool)

(assert (=> d!58613 (= (inRange!0 (ite c!36373 (index!5338 lt!111584) (index!5341 lt!111584)) (mask!9908 thiss!1504)) (and (bvsge (ite c!36373 (index!5338 lt!111584) (index!5341 lt!111584)) #b00000000000000000000000000000000) (bvslt (ite c!36373 (index!5338 lt!111584) (index!5341 lt!111584)) (bvadd (mask!9908 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!20408 d!58613))

(declare-fun d!58615 () Bool)

(declare-fun res!107281 () Bool)

(declare-fun e!142375 () Bool)

(assert (=> d!58615 (=> (not res!107281) (not e!142375))))

(declare-fun simpleValid!224 (LongMapFixedSize!2958) Bool)

(assert (=> d!58615 (= res!107281 (simpleValid!224 thiss!1504))))

(assert (=> d!58615 (= (valid!1197 thiss!1504) e!142375)))

(declare-fun b!218864 () Bool)

(declare-fun res!107282 () Bool)

(assert (=> b!218864 (=> (not res!107282) (not e!142375))))

(declare-fun arrayCountValidKeys!0 (array!10731 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!218864 (= res!107282 (= (arrayCountValidKeys!0 (_keys!6178 thiss!1504) #b00000000000000000000000000000000 (size!5419 (_keys!6178 thiss!1504))) (_size!1528 thiss!1504)))))

(declare-fun b!218865 () Bool)

(declare-fun res!107283 () Bool)

(assert (=> b!218865 (=> (not res!107283) (not e!142375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10731 (_ BitVec 32)) Bool)

(assert (=> b!218865 (= res!107283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6178 thiss!1504) (mask!9908 thiss!1504)))))

(declare-fun b!218866 () Bool)

(declare-datatypes ((List!3236 0))(
  ( (Nil!3233) (Cons!3232 (h!3879 (_ BitVec 64)) (t!8193 List!3236)) )
))
(declare-fun arrayNoDuplicates!0 (array!10731 (_ BitVec 32) List!3236) Bool)

(assert (=> b!218866 (= e!142375 (arrayNoDuplicates!0 (_keys!6178 thiss!1504) #b00000000000000000000000000000000 Nil!3233))))

(assert (= (and d!58615 res!107281) b!218864))

(assert (= (and b!218864 res!107282) b!218865))

(assert (= (and b!218865 res!107283) b!218866))

(declare-fun m!244621 () Bool)

(assert (=> d!58615 m!244621))

(declare-fun m!244623 () Bool)

(assert (=> b!218864 m!244623))

(declare-fun m!244625 () Bool)

(assert (=> b!218865 m!244625))

(declare-fun m!244627 () Bool)

(assert (=> b!218866 m!244627))

(assert (=> start!21734 d!58615))

(declare-fun d!58617 () Bool)

(declare-fun e!142378 () Bool)

(assert (=> d!58617 e!142378))

(declare-fun res!107289 () Bool)

(assert (=> d!58617 (=> (not res!107289) (not e!142378))))

(declare-fun lt!111696 () SeekEntryResult!792)

(assert (=> d!58617 (= res!107289 ((_ is Found!792) lt!111696))))

(assert (=> d!58617 (= lt!111696 (seekEntryOrOpen!0 key!932 (_keys!6178 thiss!1504) (mask!9908 thiss!1504)))))

(declare-fun lt!111695 () Unit!6518)

(declare-fun choose!1086 (array!10731 array!10729 (_ BitVec 32) (_ BitVec 32) V!7307 V!7307 (_ BitVec 64) Int) Unit!6518)

(assert (=> d!58617 (= lt!111695 (choose!1086 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) key!932 (defaultEntry!4129 thiss!1504)))))

(assert (=> d!58617 (validMask!0 (mask!9908 thiss!1504))))

(assert (=> d!58617 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!189 (_keys!6178 thiss!1504) (_values!4112 thiss!1504) (mask!9908 thiss!1504) (extraKeys!3866 thiss!1504) (zeroValue!3970 thiss!1504) (minValue!3970 thiss!1504) key!932 (defaultEntry!4129 thiss!1504)) lt!111695)))

(declare-fun b!218871 () Bool)

(declare-fun res!107288 () Bool)

(assert (=> b!218871 (=> (not res!107288) (not e!142378))))

(assert (=> b!218871 (= res!107288 (inRange!0 (index!5339 lt!111696) (mask!9908 thiss!1504)))))

(declare-fun b!218872 () Bool)

(assert (=> b!218872 (= e!142378 (= (select (arr!5087 (_keys!6178 thiss!1504)) (index!5339 lt!111696)) key!932))))

(assert (=> b!218872 (and (bvsge (index!5339 lt!111696) #b00000000000000000000000000000000) (bvslt (index!5339 lt!111696) (size!5419 (_keys!6178 thiss!1504))))))

(assert (= (and d!58617 res!107289) b!218871))

(assert (= (and b!218871 res!107288) b!218872))

(assert (=> d!58617 m!244489))

(declare-fun m!244629 () Bool)

(assert (=> d!58617 m!244629))

(assert (=> d!58617 m!244537))

(declare-fun m!244631 () Bool)

(assert (=> b!218871 m!244631))

(declare-fun m!244633 () Bool)

(assert (=> b!218872 m!244633))

(assert (=> b!218678 d!58617))

(declare-fun d!58619 () Bool)

(declare-fun res!107294 () Bool)

(declare-fun e!142383 () Bool)

(assert (=> d!58619 (=> res!107294 e!142383)))

(assert (=> d!58619 (= res!107294 (= (select (arr!5087 (_keys!6178 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!58619 (= (arrayContainsKey!0 (_keys!6178 thiss!1504) key!932 #b00000000000000000000000000000000) e!142383)))

(declare-fun b!218877 () Bool)

(declare-fun e!142384 () Bool)

(assert (=> b!218877 (= e!142383 e!142384)))

(declare-fun res!107295 () Bool)

(assert (=> b!218877 (=> (not res!107295) (not e!142384))))

(assert (=> b!218877 (= res!107295 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5419 (_keys!6178 thiss!1504))))))

(declare-fun b!218878 () Bool)

(assert (=> b!218878 (= e!142384 (arrayContainsKey!0 (_keys!6178 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!58619 (not res!107294)) b!218877))

(assert (= (and b!218877 res!107295) b!218878))

(assert (=> d!58619 m!244555))

(declare-fun m!244635 () Bool)

(assert (=> b!218878 m!244635))

(assert (=> bm!20409 d!58619))

(declare-fun mapIsEmpty!9786 () Bool)

(declare-fun mapRes!9786 () Bool)

(assert (=> mapIsEmpty!9786 mapRes!9786))

(declare-fun b!218886 () Bool)

(declare-fun e!142389 () Bool)

(assert (=> b!218886 (= e!142389 tp_is_empty!5745)))

(declare-fun b!218885 () Bool)

(declare-fun e!142390 () Bool)

(assert (=> b!218885 (= e!142390 tp_is_empty!5745)))

(declare-fun mapNonEmpty!9786 () Bool)

(declare-fun tp!20793 () Bool)

(assert (=> mapNonEmpty!9786 (= mapRes!9786 (and tp!20793 e!142390))))

(declare-fun mapValue!9786 () ValueCell!2529)

(declare-fun mapKey!9786 () (_ BitVec 32))

(declare-fun mapRest!9786 () (Array (_ BitVec 32) ValueCell!2529))

(assert (=> mapNonEmpty!9786 (= mapRest!9780 (store mapRest!9786 mapKey!9786 mapValue!9786))))

(declare-fun condMapEmpty!9786 () Bool)

(declare-fun mapDefault!9786 () ValueCell!2529)

(assert (=> mapNonEmpty!9780 (= condMapEmpty!9786 (= mapRest!9780 ((as const (Array (_ BitVec 32) ValueCell!2529)) mapDefault!9786)))))

(assert (=> mapNonEmpty!9780 (= tp!20784 (and e!142389 mapRes!9786))))

(assert (= (and mapNonEmpty!9780 condMapEmpty!9786) mapIsEmpty!9786))

(assert (= (and mapNonEmpty!9780 (not condMapEmpty!9786)) mapNonEmpty!9786))

(assert (= (and mapNonEmpty!9786 ((_ is ValueCellFull!2529) mapValue!9786)) b!218885))

(assert (= (and mapNonEmpty!9780 ((_ is ValueCellFull!2529) mapDefault!9786)) b!218886))

(declare-fun m!244637 () Bool)

(assert (=> mapNonEmpty!9786 m!244637))

(declare-fun b_lambda!7829 () Bool)

(assert (= b_lambda!7827 (or (and b!218682 b_free!5883) b_lambda!7829)))

(check-sat (not b!218768) (not b!218865) (not b!218823) (not b_next!5883) (not b!218878) (not d!58603) (not b!218829) (not d!58615) (not b!218830) (not b!218864) (not mapNonEmpty!9786) (not bm!20441) b_and!12777 (not bm!20433) (not b!218754) (not b_lambda!7829) (not b!218866) (not b!218871) (not b!218816) (not b!218766) (not b!218828) (not d!58605) (not b!218826) (not bm!20434) (not b!218811) (not d!58607) tp_is_empty!5745 (not d!58617) (not bm!20432) (not d!58599) (not bm!20442) (not bm!20431) (not b!218813))
(check-sat b_and!12777 (not b_next!5883))
