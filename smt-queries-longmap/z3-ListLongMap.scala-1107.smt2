; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22854 () Bool)

(assert start!22854)

(declare-fun b!237907 () Bool)

(declare-fun b_free!6391 () Bool)

(declare-fun b_next!6391 () Bool)

(assert (=> b!237907 (= b_free!6391 (not b_next!6391))))

(declare-fun tp!22371 () Bool)

(declare-fun b_and!13327 () Bool)

(assert (=> b!237907 (= tp!22371 b_and!13327)))

(declare-fun mapIsEmpty!10605 () Bool)

(declare-fun mapRes!10605 () Bool)

(assert (=> mapIsEmpty!10605 mapRes!10605))

(declare-fun b!237906 () Bool)

(declare-fun e!154474 () Bool)

(declare-fun e!154475 () Bool)

(assert (=> b!237906 (= e!154474 e!154475)))

(declare-fun res!116553 () Bool)

(assert (=> b!237906 (=> (not res!116553) (not e!154475))))

(declare-datatypes ((SeekEntryResult!1010 0))(
  ( (MissingZero!1010 (index!6210 (_ BitVec 32))) (Found!1010 (index!6211 (_ BitVec 32))) (Intermediate!1010 (undefined!1822 Bool) (index!6212 (_ BitVec 32)) (x!24005 (_ BitVec 32))) (Undefined!1010) (MissingVacant!1010 (index!6213 (_ BitVec 32))) )
))
(declare-fun lt!120215 () SeekEntryResult!1010)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!237906 (= res!116553 (or (= lt!120215 (MissingZero!1010 index!297)) (= lt!120215 (MissingVacant!1010 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7985 0))(
  ( (V!7986 (val!3171 Int)) )
))
(declare-datatypes ((ValueCell!2783 0))(
  ( (ValueCellFull!2783 (v!5201 V!7985)) (EmptyCell!2783) )
))
(declare-datatypes ((array!11773 0))(
  ( (array!11774 (arr!5589 (Array (_ BitVec 32) ValueCell!2783)) (size!5931 (_ BitVec 32))) )
))
(declare-datatypes ((array!11775 0))(
  ( (array!11776 (arr!5590 (Array (_ BitVec 32) (_ BitVec 64))) (size!5932 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3466 0))(
  ( (LongMapFixedSize!3467 (defaultEntry!4416 Int) (mask!10441 (_ BitVec 32)) (extraKeys!4153 (_ BitVec 32)) (zeroValue!4257 V!7985) (minValue!4257 V!7985) (_size!1782 (_ BitVec 32)) (_keys!6513 array!11775) (_values!4399 array!11773) (_vacant!1782 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3466)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11775 (_ BitVec 32)) SeekEntryResult!1010)

(assert (=> b!237906 (= lt!120215 (seekEntryOrOpen!0 key!932 (_keys!6513 thiss!1504) (mask!10441 thiss!1504)))))

(declare-fun tp_is_empty!6253 () Bool)

(declare-fun e!154476 () Bool)

(declare-fun e!154472 () Bool)

(declare-fun array_inv!3691 (array!11775) Bool)

(declare-fun array_inv!3692 (array!11773) Bool)

(assert (=> b!237907 (= e!154476 (and tp!22371 tp_is_empty!6253 (array_inv!3691 (_keys!6513 thiss!1504)) (array_inv!3692 (_values!4399 thiss!1504)) e!154472))))

(declare-fun b!237908 () Bool)

(declare-fun res!116555 () Bool)

(assert (=> b!237908 (=> (not res!116555) (not e!154474))))

(assert (=> b!237908 (= res!116555 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237909 () Bool)

(declare-fun res!116554 () Bool)

(assert (=> b!237909 (=> (not res!116554) (not e!154475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11775 (_ BitVec 32)) Bool)

(assert (=> b!237909 (= res!116554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6513 thiss!1504) (mask!10441 thiss!1504)))))

(declare-fun b!237911 () Bool)

(declare-fun e!154477 () Bool)

(assert (=> b!237911 (= e!154477 tp_is_empty!6253)))

(declare-fun b!237912 () Bool)

(assert (=> b!237912 (= e!154472 (and e!154477 mapRes!10605))))

(declare-fun condMapEmpty!10605 () Bool)

(declare-fun mapDefault!10605 () ValueCell!2783)

(assert (=> b!237912 (= condMapEmpty!10605 (= (arr!5589 (_values!4399 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2783)) mapDefault!10605)))))

(declare-fun b!237913 () Bool)

(declare-fun res!116550 () Bool)

(assert (=> b!237913 (=> (not res!116550) (not e!154475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!237913 (= res!116550 (validMask!0 (mask!10441 thiss!1504)))))

(declare-fun mapNonEmpty!10605 () Bool)

(declare-fun tp!22370 () Bool)

(declare-fun e!154473 () Bool)

(assert (=> mapNonEmpty!10605 (= mapRes!10605 (and tp!22370 e!154473))))

(declare-fun mapValue!10605 () ValueCell!2783)

(declare-fun mapRest!10605 () (Array (_ BitVec 32) ValueCell!2783))

(declare-fun mapKey!10605 () (_ BitVec 32))

(assert (=> mapNonEmpty!10605 (= (arr!5589 (_values!4399 thiss!1504)) (store mapRest!10605 mapKey!10605 mapValue!10605))))

(declare-fun b!237914 () Bool)

(declare-datatypes ((List!3565 0))(
  ( (Nil!3562) (Cons!3561 (h!4217 (_ BitVec 64)) (t!8547 List!3565)) )
))
(declare-fun arrayNoDuplicates!0 (array!11775 (_ BitVec 32) List!3565) Bool)

(assert (=> b!237914 (= e!154475 (not (arrayNoDuplicates!0 (_keys!6513 thiss!1504) #b00000000000000000000000000000000 Nil!3562)))))

(declare-fun b!237915 () Bool)

(declare-fun res!116551 () Bool)

(assert (=> b!237915 (=> (not res!116551) (not e!154475))))

(assert (=> b!237915 (= res!116551 (and (= (size!5931 (_values!4399 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10441 thiss!1504))) (= (size!5932 (_keys!6513 thiss!1504)) (size!5931 (_values!4399 thiss!1504))) (bvsge (mask!10441 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4153 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4153 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!237916 () Bool)

(assert (=> b!237916 (= e!154473 tp_is_empty!6253)))

(declare-fun res!116556 () Bool)

(assert (=> start!22854 (=> (not res!116556) (not e!154474))))

(declare-fun valid!1373 (LongMapFixedSize!3466) Bool)

(assert (=> start!22854 (= res!116556 (valid!1373 thiss!1504))))

(assert (=> start!22854 e!154474))

(assert (=> start!22854 e!154476))

(assert (=> start!22854 true))

(declare-fun b!237910 () Bool)

(declare-fun res!116552 () Bool)

(assert (=> b!237910 (=> (not res!116552) (not e!154475))))

(declare-datatypes ((tuple2!4652 0))(
  ( (tuple2!4653 (_1!2337 (_ BitVec 64)) (_2!2337 V!7985)) )
))
(declare-datatypes ((List!3566 0))(
  ( (Nil!3563) (Cons!3562 (h!4218 tuple2!4652) (t!8548 List!3566)) )
))
(declare-datatypes ((ListLongMap!3555 0))(
  ( (ListLongMap!3556 (toList!1793 List!3566)) )
))
(declare-fun contains!1682 (ListLongMap!3555 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1302 (array!11775 array!11773 (_ BitVec 32) (_ BitVec 32) V!7985 V!7985 (_ BitVec 32) Int) ListLongMap!3555)

(assert (=> b!237910 (= res!116552 (not (contains!1682 (getCurrentListMap!1302 (_keys!6513 thiss!1504) (_values!4399 thiss!1504) (mask!10441 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)) key!932)))))

(assert (= (and start!22854 res!116556) b!237908))

(assert (= (and b!237908 res!116555) b!237906))

(assert (= (and b!237906 res!116553) b!237910))

(assert (= (and b!237910 res!116552) b!237913))

(assert (= (and b!237913 res!116550) b!237915))

(assert (= (and b!237915 res!116551) b!237909))

(assert (= (and b!237909 res!116554) b!237914))

(assert (= (and b!237912 condMapEmpty!10605) mapIsEmpty!10605))

(assert (= (and b!237912 (not condMapEmpty!10605)) mapNonEmpty!10605))

(get-info :version)

(assert (= (and mapNonEmpty!10605 ((_ is ValueCellFull!2783) mapValue!10605)) b!237916))

(assert (= (and b!237912 ((_ is ValueCellFull!2783) mapDefault!10605)) b!237911))

(assert (= b!237907 b!237912))

(assert (= start!22854 b!237907))

(declare-fun m!258111 () Bool)

(assert (=> mapNonEmpty!10605 m!258111))

(declare-fun m!258113 () Bool)

(assert (=> b!237910 m!258113))

(assert (=> b!237910 m!258113))

(declare-fun m!258115 () Bool)

(assert (=> b!237910 m!258115))

(declare-fun m!258117 () Bool)

(assert (=> b!237907 m!258117))

(declare-fun m!258119 () Bool)

(assert (=> b!237907 m!258119))

(declare-fun m!258121 () Bool)

(assert (=> b!237906 m!258121))

(declare-fun m!258123 () Bool)

(assert (=> b!237909 m!258123))

(declare-fun m!258125 () Bool)

(assert (=> start!22854 m!258125))

(declare-fun m!258127 () Bool)

(assert (=> b!237914 m!258127))

(declare-fun m!258129 () Bool)

(assert (=> b!237913 m!258129))

(check-sat b_and!13327 (not b!237906) (not b!237907) (not b!237909) tp_is_empty!6253 (not b!237910) (not mapNonEmpty!10605) (not b_next!6391) (not b!237913) (not start!22854) (not b!237914))
(check-sat b_and!13327 (not b_next!6391))
(get-model)

(declare-fun b!237995 () Bool)

(declare-fun c!39696 () Bool)

(declare-fun lt!120230 () (_ BitVec 64))

(assert (=> b!237995 (= c!39696 (= lt!120230 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!154528 () SeekEntryResult!1010)

(declare-fun e!154526 () SeekEntryResult!1010)

(assert (=> b!237995 (= e!154528 e!154526)))

(declare-fun b!237996 () Bool)

(declare-fun lt!120229 () SeekEntryResult!1010)

(assert (=> b!237996 (= e!154526 (MissingZero!1010 (index!6212 lt!120229)))))

(declare-fun b!237997 () Bool)

(declare-fun e!154527 () SeekEntryResult!1010)

(assert (=> b!237997 (= e!154527 e!154528)))

(assert (=> b!237997 (= lt!120230 (select (arr!5590 (_keys!6513 thiss!1504)) (index!6212 lt!120229)))))

(declare-fun c!39694 () Bool)

(assert (=> b!237997 (= c!39694 (= lt!120230 key!932))))

(declare-fun b!237998 () Bool)

(assert (=> b!237998 (= e!154527 Undefined!1010)))

(declare-fun b!237999 () Bool)

(assert (=> b!237999 (= e!154528 (Found!1010 (index!6212 lt!120229)))))

(declare-fun d!59581 () Bool)

(declare-fun lt!120228 () SeekEntryResult!1010)

(assert (=> d!59581 (and (or ((_ is Undefined!1010) lt!120228) (not ((_ is Found!1010) lt!120228)) (and (bvsge (index!6211 lt!120228) #b00000000000000000000000000000000) (bvslt (index!6211 lt!120228) (size!5932 (_keys!6513 thiss!1504))))) (or ((_ is Undefined!1010) lt!120228) ((_ is Found!1010) lt!120228) (not ((_ is MissingZero!1010) lt!120228)) (and (bvsge (index!6210 lt!120228) #b00000000000000000000000000000000) (bvslt (index!6210 lt!120228) (size!5932 (_keys!6513 thiss!1504))))) (or ((_ is Undefined!1010) lt!120228) ((_ is Found!1010) lt!120228) ((_ is MissingZero!1010) lt!120228) (not ((_ is MissingVacant!1010) lt!120228)) (and (bvsge (index!6213 lt!120228) #b00000000000000000000000000000000) (bvslt (index!6213 lt!120228) (size!5932 (_keys!6513 thiss!1504))))) (or ((_ is Undefined!1010) lt!120228) (ite ((_ is Found!1010) lt!120228) (= (select (arr!5590 (_keys!6513 thiss!1504)) (index!6211 lt!120228)) key!932) (ite ((_ is MissingZero!1010) lt!120228) (= (select (arr!5590 (_keys!6513 thiss!1504)) (index!6210 lt!120228)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1010) lt!120228) (= (select (arr!5590 (_keys!6513 thiss!1504)) (index!6213 lt!120228)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59581 (= lt!120228 e!154527)))

(declare-fun c!39695 () Bool)

(assert (=> d!59581 (= c!39695 (and ((_ is Intermediate!1010) lt!120229) (undefined!1822 lt!120229)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11775 (_ BitVec 32)) SeekEntryResult!1010)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59581 (= lt!120229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10441 thiss!1504)) key!932 (_keys!6513 thiss!1504) (mask!10441 thiss!1504)))))

(assert (=> d!59581 (validMask!0 (mask!10441 thiss!1504))))

(assert (=> d!59581 (= (seekEntryOrOpen!0 key!932 (_keys!6513 thiss!1504) (mask!10441 thiss!1504)) lt!120228)))

(declare-fun b!238000 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11775 (_ BitVec 32)) SeekEntryResult!1010)

(assert (=> b!238000 (= e!154526 (seekKeyOrZeroReturnVacant!0 (x!24005 lt!120229) (index!6212 lt!120229) (index!6212 lt!120229) key!932 (_keys!6513 thiss!1504) (mask!10441 thiss!1504)))))

(assert (= (and d!59581 c!39695) b!237998))

(assert (= (and d!59581 (not c!39695)) b!237997))

(assert (= (and b!237997 c!39694) b!237999))

(assert (= (and b!237997 (not c!39694)) b!237995))

(assert (= (and b!237995 c!39696) b!237996))

(assert (= (and b!237995 (not c!39696)) b!238000))

(declare-fun m!258171 () Bool)

(assert (=> b!237997 m!258171))

(assert (=> d!59581 m!258129))

(declare-fun m!258173 () Bool)

(assert (=> d!59581 m!258173))

(declare-fun m!258175 () Bool)

(assert (=> d!59581 m!258175))

(declare-fun m!258177 () Bool)

(assert (=> d!59581 m!258177))

(declare-fun m!258179 () Bool)

(assert (=> d!59581 m!258179))

(assert (=> d!59581 m!258173))

(declare-fun m!258181 () Bool)

(assert (=> d!59581 m!258181))

(declare-fun m!258183 () Bool)

(assert (=> b!238000 m!258183))

(assert (=> b!237906 d!59581))

(declare-fun d!59583 () Bool)

(declare-fun e!154533 () Bool)

(assert (=> d!59583 e!154533))

(declare-fun res!116601 () Bool)

(assert (=> d!59583 (=> res!116601 e!154533)))

(declare-fun lt!120242 () Bool)

(assert (=> d!59583 (= res!116601 (not lt!120242))))

(declare-fun lt!120240 () Bool)

(assert (=> d!59583 (= lt!120242 lt!120240)))

(declare-datatypes ((Unit!7304 0))(
  ( (Unit!7305) )
))
(declare-fun lt!120239 () Unit!7304)

(declare-fun e!154534 () Unit!7304)

(assert (=> d!59583 (= lt!120239 e!154534)))

(declare-fun c!39699 () Bool)

(assert (=> d!59583 (= c!39699 lt!120240)))

(declare-fun containsKey!267 (List!3566 (_ BitVec 64)) Bool)

(assert (=> d!59583 (= lt!120240 (containsKey!267 (toList!1793 (getCurrentListMap!1302 (_keys!6513 thiss!1504) (_values!4399 thiss!1504) (mask!10441 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504))) key!932))))

(assert (=> d!59583 (= (contains!1682 (getCurrentListMap!1302 (_keys!6513 thiss!1504) (_values!4399 thiss!1504) (mask!10441 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)) key!932) lt!120242)))

(declare-fun b!238007 () Bool)

(declare-fun lt!120241 () Unit!7304)

(assert (=> b!238007 (= e!154534 lt!120241)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!216 (List!3566 (_ BitVec 64)) Unit!7304)

(assert (=> b!238007 (= lt!120241 (lemmaContainsKeyImpliesGetValueByKeyDefined!216 (toList!1793 (getCurrentListMap!1302 (_keys!6513 thiss!1504) (_values!4399 thiss!1504) (mask!10441 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504))) key!932))))

(declare-datatypes ((Option!281 0))(
  ( (Some!280 (v!5204 V!7985)) (None!279) )
))
(declare-fun isDefined!217 (Option!281) Bool)

(declare-fun getValueByKey!275 (List!3566 (_ BitVec 64)) Option!281)

(assert (=> b!238007 (isDefined!217 (getValueByKey!275 (toList!1793 (getCurrentListMap!1302 (_keys!6513 thiss!1504) (_values!4399 thiss!1504) (mask!10441 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504))) key!932))))

(declare-fun b!238008 () Bool)

(declare-fun Unit!7306 () Unit!7304)

(assert (=> b!238008 (= e!154534 Unit!7306)))

(declare-fun b!238009 () Bool)

(assert (=> b!238009 (= e!154533 (isDefined!217 (getValueByKey!275 (toList!1793 (getCurrentListMap!1302 (_keys!6513 thiss!1504) (_values!4399 thiss!1504) (mask!10441 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504))) key!932)))))

(assert (= (and d!59583 c!39699) b!238007))

(assert (= (and d!59583 (not c!39699)) b!238008))

(assert (= (and d!59583 (not res!116601)) b!238009))

(declare-fun m!258185 () Bool)

(assert (=> d!59583 m!258185))

(declare-fun m!258187 () Bool)

(assert (=> b!238007 m!258187))

(declare-fun m!258189 () Bool)

(assert (=> b!238007 m!258189))

(assert (=> b!238007 m!258189))

(declare-fun m!258191 () Bool)

(assert (=> b!238007 m!258191))

(assert (=> b!238009 m!258189))

(assert (=> b!238009 m!258189))

(assert (=> b!238009 m!258191))

(assert (=> b!237910 d!59583))

(declare-fun b!238052 () Bool)

(declare-fun c!39717 () Bool)

(assert (=> b!238052 (= c!39717 (and (not (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!154563 () ListLongMap!3555)

(declare-fun e!154565 () ListLongMap!3555)

(assert (=> b!238052 (= e!154563 e!154565)))

(declare-fun bm!22116 () Bool)

(declare-fun call!22119 () Bool)

(declare-fun lt!120301 () ListLongMap!3555)

(assert (=> bm!22116 (= call!22119 (contains!1682 lt!120301 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238053 () Bool)

(declare-fun call!22123 () ListLongMap!3555)

(assert (=> b!238053 (= e!154565 call!22123)))

(declare-fun b!238054 () Bool)

(declare-fun e!154570 () Bool)

(declare-fun apply!219 (ListLongMap!3555 (_ BitVec 64)) V!7985)

(assert (=> b!238054 (= e!154570 (= (apply!219 lt!120301 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4257 thiss!1504)))))

(declare-fun b!238055 () Bool)

(declare-fun e!154564 () Bool)

(declare-fun get!2880 (ValueCell!2783 V!7985) V!7985)

(declare-fun dynLambda!553 (Int (_ BitVec 64)) V!7985)

(assert (=> b!238055 (= e!154564 (= (apply!219 lt!120301 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000)) (get!2880 (select (arr!5589 (_values!4399 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!553 (defaultEntry!4416 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!238055 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5931 (_values!4399 thiss!1504))))))

(assert (=> b!238055 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5932 (_keys!6513 thiss!1504))))))

(declare-fun b!238056 () Bool)

(declare-fun e!154567 () Bool)

(assert (=> b!238056 (= e!154567 e!154570)))

(declare-fun res!116620 () Bool)

(assert (=> b!238056 (= res!116620 call!22119)))

(assert (=> b!238056 (=> (not res!116620) (not e!154570))))

(declare-fun b!238057 () Bool)

(declare-fun e!154562 () Bool)

(assert (=> b!238057 (= e!154562 (= (apply!219 lt!120301 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4257 thiss!1504)))))

(declare-fun b!238058 () Bool)

(declare-fun e!154572 () ListLongMap!3555)

(assert (=> b!238058 (= e!154572 e!154563)))

(declare-fun c!39715 () Bool)

(assert (=> b!238058 (= c!39715 (and (not (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!238059 () Bool)

(declare-fun e!154561 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!238059 (= e!154561 (validKeyInArray!0 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22117 () Bool)

(declare-fun call!22121 () ListLongMap!3555)

(declare-fun call!22122 () ListLongMap!3555)

(assert (=> bm!22117 (= call!22121 call!22122)))

(declare-fun b!238060 () Bool)

(declare-fun e!154568 () Bool)

(declare-fun call!22124 () Bool)

(assert (=> b!238060 (= e!154568 (not call!22124))))

(declare-fun bm!22118 () Bool)

(declare-fun call!22120 () ListLongMap!3555)

(declare-fun getCurrentListMapNoExtraKeys!535 (array!11775 array!11773 (_ BitVec 32) (_ BitVec 32) V!7985 V!7985 (_ BitVec 32) Int) ListLongMap!3555)

(assert (=> bm!22118 (= call!22120 (getCurrentListMapNoExtraKeys!535 (_keys!6513 thiss!1504) (_values!4399 thiss!1504) (mask!10441 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)))))

(declare-fun b!238061 () Bool)

(declare-fun e!154569 () Unit!7304)

(declare-fun lt!120308 () Unit!7304)

(assert (=> b!238061 (= e!154569 lt!120308)))

(declare-fun lt!120293 () ListLongMap!3555)

(assert (=> b!238061 (= lt!120293 (getCurrentListMapNoExtraKeys!535 (_keys!6513 thiss!1504) (_values!4399 thiss!1504) (mask!10441 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)))))

(declare-fun lt!120303 () (_ BitVec 64))

(assert (=> b!238061 (= lt!120303 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120305 () (_ BitVec 64))

(assert (=> b!238061 (= lt!120305 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120292 () Unit!7304)

(declare-fun addStillContains!195 (ListLongMap!3555 (_ BitVec 64) V!7985 (_ BitVec 64)) Unit!7304)

(assert (=> b!238061 (= lt!120292 (addStillContains!195 lt!120293 lt!120303 (zeroValue!4257 thiss!1504) lt!120305))))

(declare-fun +!652 (ListLongMap!3555 tuple2!4652) ListLongMap!3555)

(assert (=> b!238061 (contains!1682 (+!652 lt!120293 (tuple2!4653 lt!120303 (zeroValue!4257 thiss!1504))) lt!120305)))

(declare-fun lt!120290 () Unit!7304)

(assert (=> b!238061 (= lt!120290 lt!120292)))

(declare-fun lt!120298 () ListLongMap!3555)

(assert (=> b!238061 (= lt!120298 (getCurrentListMapNoExtraKeys!535 (_keys!6513 thiss!1504) (_values!4399 thiss!1504) (mask!10441 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)))))

(declare-fun lt!120289 () (_ BitVec 64))

(assert (=> b!238061 (= lt!120289 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120307 () (_ BitVec 64))

(assert (=> b!238061 (= lt!120307 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120294 () Unit!7304)

(declare-fun addApplyDifferent!195 (ListLongMap!3555 (_ BitVec 64) V!7985 (_ BitVec 64)) Unit!7304)

(assert (=> b!238061 (= lt!120294 (addApplyDifferent!195 lt!120298 lt!120289 (minValue!4257 thiss!1504) lt!120307))))

(assert (=> b!238061 (= (apply!219 (+!652 lt!120298 (tuple2!4653 lt!120289 (minValue!4257 thiss!1504))) lt!120307) (apply!219 lt!120298 lt!120307))))

(declare-fun lt!120304 () Unit!7304)

(assert (=> b!238061 (= lt!120304 lt!120294)))

(declare-fun lt!120306 () ListLongMap!3555)

(assert (=> b!238061 (= lt!120306 (getCurrentListMapNoExtraKeys!535 (_keys!6513 thiss!1504) (_values!4399 thiss!1504) (mask!10441 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)))))

(declare-fun lt!120295 () (_ BitVec 64))

(assert (=> b!238061 (= lt!120295 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120300 () (_ BitVec 64))

(assert (=> b!238061 (= lt!120300 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120297 () Unit!7304)

(assert (=> b!238061 (= lt!120297 (addApplyDifferent!195 lt!120306 lt!120295 (zeroValue!4257 thiss!1504) lt!120300))))

(assert (=> b!238061 (= (apply!219 (+!652 lt!120306 (tuple2!4653 lt!120295 (zeroValue!4257 thiss!1504))) lt!120300) (apply!219 lt!120306 lt!120300))))

(declare-fun lt!120288 () Unit!7304)

(assert (=> b!238061 (= lt!120288 lt!120297)))

(declare-fun lt!120296 () ListLongMap!3555)

(assert (=> b!238061 (= lt!120296 (getCurrentListMapNoExtraKeys!535 (_keys!6513 thiss!1504) (_values!4399 thiss!1504) (mask!10441 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)))))

(declare-fun lt!120287 () (_ BitVec 64))

(assert (=> b!238061 (= lt!120287 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120302 () (_ BitVec 64))

(assert (=> b!238061 (= lt!120302 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238061 (= lt!120308 (addApplyDifferent!195 lt!120296 lt!120287 (minValue!4257 thiss!1504) lt!120302))))

(assert (=> b!238061 (= (apply!219 (+!652 lt!120296 (tuple2!4653 lt!120287 (minValue!4257 thiss!1504))) lt!120302) (apply!219 lt!120296 lt!120302))))

(declare-fun b!238062 () Bool)

(declare-fun res!116628 () Bool)

(declare-fun e!154571 () Bool)

(assert (=> b!238062 (=> (not res!116628) (not e!154571))))

(declare-fun e!154573 () Bool)

(assert (=> b!238062 (= res!116628 e!154573)))

(declare-fun res!116624 () Bool)

(assert (=> b!238062 (=> res!116624 e!154573)))

(declare-fun e!154566 () Bool)

(assert (=> b!238062 (= res!116624 (not e!154566))))

(declare-fun res!116622 () Bool)

(assert (=> b!238062 (=> (not res!116622) (not e!154566))))

(assert (=> b!238062 (= res!116622 (bvslt #b00000000000000000000000000000000 (size!5932 (_keys!6513 thiss!1504))))))

(declare-fun bm!22119 () Bool)

(declare-fun call!22125 () ListLongMap!3555)

(assert (=> bm!22119 (= call!22125 call!22120)))

(declare-fun b!238063 () Bool)

(assert (=> b!238063 (= e!154572 (+!652 call!22122 (tuple2!4653 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4257 thiss!1504))))))

(declare-fun d!59585 () Bool)

(assert (=> d!59585 e!154571))

(declare-fun res!116626 () Bool)

(assert (=> d!59585 (=> (not res!116626) (not e!154571))))

(assert (=> d!59585 (= res!116626 (or (bvsge #b00000000000000000000000000000000 (size!5932 (_keys!6513 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5932 (_keys!6513 thiss!1504))))))))

(declare-fun lt!120291 () ListLongMap!3555)

(assert (=> d!59585 (= lt!120301 lt!120291)))

(declare-fun lt!120299 () Unit!7304)

(assert (=> d!59585 (= lt!120299 e!154569)))

(declare-fun c!39714 () Bool)

(assert (=> d!59585 (= c!39714 e!154561)))

(declare-fun res!116623 () Bool)

(assert (=> d!59585 (=> (not res!116623) (not e!154561))))

(assert (=> d!59585 (= res!116623 (bvslt #b00000000000000000000000000000000 (size!5932 (_keys!6513 thiss!1504))))))

(assert (=> d!59585 (= lt!120291 e!154572)))

(declare-fun c!39716 () Bool)

(assert (=> d!59585 (= c!39716 (and (not (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59585 (validMask!0 (mask!10441 thiss!1504))))

(assert (=> d!59585 (= (getCurrentListMap!1302 (_keys!6513 thiss!1504) (_values!4399 thiss!1504) (mask!10441 thiss!1504) (extraKeys!4153 thiss!1504) (zeroValue!4257 thiss!1504) (minValue!4257 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4416 thiss!1504)) lt!120301)))

(declare-fun b!238064 () Bool)

(declare-fun res!116627 () Bool)

(assert (=> b!238064 (=> (not res!116627) (not e!154571))))

(assert (=> b!238064 (= res!116627 e!154567)))

(declare-fun c!39713 () Bool)

(assert (=> b!238064 (= c!39713 (not (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!238065 () Bool)

(assert (=> b!238065 (= e!154571 e!154568)))

(declare-fun c!39712 () Bool)

(assert (=> b!238065 (= c!39712 (not (= (bvand (extraKeys!4153 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!238066 () Bool)

(assert (=> b!238066 (= e!154563 call!22121)))

(declare-fun b!238067 () Bool)

(declare-fun Unit!7307 () Unit!7304)

(assert (=> b!238067 (= e!154569 Unit!7307)))

(declare-fun b!238068 () Bool)

(assert (=> b!238068 (= e!154573 e!154564)))

(declare-fun res!116625 () Bool)

(assert (=> b!238068 (=> (not res!116625) (not e!154564))))

(assert (=> b!238068 (= res!116625 (contains!1682 lt!120301 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!238068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5932 (_keys!6513 thiss!1504))))))

(declare-fun bm!22120 () Bool)

(assert (=> bm!22120 (= call!22122 (+!652 (ite c!39716 call!22120 (ite c!39715 call!22125 call!22123)) (ite (or c!39716 c!39715) (tuple2!4653 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4257 thiss!1504)) (tuple2!4653 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4257 thiss!1504)))))))

(declare-fun b!238069 () Bool)

(assert (=> b!238069 (= e!154565 call!22121)))

(declare-fun bm!22121 () Bool)

(assert (=> bm!22121 (= call!22123 call!22125)))

(declare-fun bm!22122 () Bool)

(assert (=> bm!22122 (= call!22124 (contains!1682 lt!120301 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238070 () Bool)

(assert (=> b!238070 (= e!154568 e!154562)))

(declare-fun res!116621 () Bool)

(assert (=> b!238070 (= res!116621 call!22124)))

(assert (=> b!238070 (=> (not res!116621) (not e!154562))))

(declare-fun b!238071 () Bool)

(assert (=> b!238071 (= e!154567 (not call!22119))))

(declare-fun b!238072 () Bool)

(assert (=> b!238072 (= e!154566 (validKeyInArray!0 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59585 c!39716) b!238063))

(assert (= (and d!59585 (not c!39716)) b!238058))

(assert (= (and b!238058 c!39715) b!238066))

(assert (= (and b!238058 (not c!39715)) b!238052))

(assert (= (and b!238052 c!39717) b!238069))

(assert (= (and b!238052 (not c!39717)) b!238053))

(assert (= (or b!238069 b!238053) bm!22121))

(assert (= (or b!238066 bm!22121) bm!22119))

(assert (= (or b!238066 b!238069) bm!22117))

(assert (= (or b!238063 bm!22119) bm!22118))

(assert (= (or b!238063 bm!22117) bm!22120))

(assert (= (and d!59585 res!116623) b!238059))

(assert (= (and d!59585 c!39714) b!238061))

(assert (= (and d!59585 (not c!39714)) b!238067))

(assert (= (and d!59585 res!116626) b!238062))

(assert (= (and b!238062 res!116622) b!238072))

(assert (= (and b!238062 (not res!116624)) b!238068))

(assert (= (and b!238068 res!116625) b!238055))

(assert (= (and b!238062 res!116628) b!238064))

(assert (= (and b!238064 c!39713) b!238056))

(assert (= (and b!238064 (not c!39713)) b!238071))

(assert (= (and b!238056 res!116620) b!238054))

(assert (= (or b!238056 b!238071) bm!22116))

(assert (= (and b!238064 res!116627) b!238065))

(assert (= (and b!238065 c!39712) b!238070))

(assert (= (and b!238065 (not c!39712)) b!238060))

(assert (= (and b!238070 res!116621) b!238057))

(assert (= (or b!238070 b!238060) bm!22122))

(declare-fun b_lambda!7953 () Bool)

(assert (=> (not b_lambda!7953) (not b!238055)))

(declare-fun t!8552 () Bool)

(declare-fun tb!2943 () Bool)

(assert (=> (and b!237907 (= (defaultEntry!4416 thiss!1504) (defaultEntry!4416 thiss!1504)) t!8552) tb!2943))

(declare-fun result!5167 () Bool)

(assert (=> tb!2943 (= result!5167 tp_is_empty!6253)))

(assert (=> b!238055 t!8552))

(declare-fun b_and!13333 () Bool)

(assert (= b_and!13327 (and (=> t!8552 result!5167) b_and!13333)))

(assert (=> d!59585 m!258129))

(declare-fun m!258193 () Bool)

(assert (=> b!238061 m!258193))

(declare-fun m!258195 () Bool)

(assert (=> b!238061 m!258195))

(declare-fun m!258197 () Bool)

(assert (=> b!238061 m!258197))

(declare-fun m!258199 () Bool)

(assert (=> b!238061 m!258199))

(declare-fun m!258201 () Bool)

(assert (=> b!238061 m!258201))

(declare-fun m!258203 () Bool)

(assert (=> b!238061 m!258203))

(declare-fun m!258205 () Bool)

(assert (=> b!238061 m!258205))

(declare-fun m!258207 () Bool)

(assert (=> b!238061 m!258207))

(declare-fun m!258209 () Bool)

(assert (=> b!238061 m!258209))

(declare-fun m!258211 () Bool)

(assert (=> b!238061 m!258211))

(assert (=> b!238061 m!258193))

(declare-fun m!258213 () Bool)

(assert (=> b!238061 m!258213))

(assert (=> b!238061 m!258209))

(declare-fun m!258215 () Bool)

(assert (=> b!238061 m!258215))

(declare-fun m!258217 () Bool)

(assert (=> b!238061 m!258217))

(assert (=> b!238061 m!258197))

(declare-fun m!258219 () Bool)

(assert (=> b!238061 m!258219))

(assert (=> b!238061 m!258217))

(declare-fun m!258221 () Bool)

(assert (=> b!238061 m!258221))

(declare-fun m!258223 () Bool)

(assert (=> b!238061 m!258223))

(declare-fun m!258225 () Bool)

(assert (=> b!238061 m!258225))

(declare-fun m!258227 () Bool)

(assert (=> bm!22122 m!258227))

(assert (=> b!238068 m!258199))

(assert (=> b!238068 m!258199))

(declare-fun m!258229 () Bool)

(assert (=> b!238068 m!258229))

(assert (=> bm!22118 m!258195))

(declare-fun m!258231 () Bool)

(assert (=> bm!22120 m!258231))

(assert (=> b!238059 m!258199))

(assert (=> b!238059 m!258199))

(declare-fun m!258233 () Bool)

(assert (=> b!238059 m!258233))

(declare-fun m!258235 () Bool)

(assert (=> b!238063 m!258235))

(declare-fun m!258237 () Bool)

(assert (=> bm!22116 m!258237))

(declare-fun m!258239 () Bool)

(assert (=> b!238057 m!258239))

(assert (=> b!238055 m!258199))

(declare-fun m!258241 () Bool)

(assert (=> b!238055 m!258241))

(declare-fun m!258243 () Bool)

(assert (=> b!238055 m!258243))

(assert (=> b!238055 m!258199))

(declare-fun m!258245 () Bool)

(assert (=> b!238055 m!258245))

(assert (=> b!238055 m!258243))

(assert (=> b!238055 m!258241))

(declare-fun m!258247 () Bool)

(assert (=> b!238055 m!258247))

(assert (=> b!238072 m!258199))

(assert (=> b!238072 m!258199))

(assert (=> b!238072 m!258233))

(declare-fun m!258249 () Bool)

(assert (=> b!238054 m!258249))

(assert (=> b!237910 d!59585))

(declare-fun bm!22125 () Bool)

(declare-fun call!22128 () Bool)

(declare-fun c!39720 () Bool)

(assert (=> bm!22125 (= call!22128 (arrayNoDuplicates!0 (_keys!6513 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39720 (Cons!3561 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000) Nil!3562) Nil!3562)))))

(declare-fun b!238085 () Bool)

(declare-fun e!154583 () Bool)

(declare-fun contains!1685 (List!3565 (_ BitVec 64)) Bool)

(assert (=> b!238085 (= e!154583 (contains!1685 Nil!3562 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238086 () Bool)

(declare-fun e!154584 () Bool)

(declare-fun e!154585 () Bool)

(assert (=> b!238086 (= e!154584 e!154585)))

(assert (=> b!238086 (= c!39720 (validKeyInArray!0 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238087 () Bool)

(declare-fun e!154582 () Bool)

(assert (=> b!238087 (= e!154582 e!154584)))

(declare-fun res!116637 () Bool)

(assert (=> b!238087 (=> (not res!116637) (not e!154584))))

(assert (=> b!238087 (= res!116637 (not e!154583))))

(declare-fun res!116635 () Bool)

(assert (=> b!238087 (=> (not res!116635) (not e!154583))))

(assert (=> b!238087 (= res!116635 (validKeyInArray!0 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238088 () Bool)

(assert (=> b!238088 (= e!154585 call!22128)))

(declare-fun b!238089 () Bool)

(assert (=> b!238089 (= e!154585 call!22128)))

(declare-fun d!59587 () Bool)

(declare-fun res!116636 () Bool)

(assert (=> d!59587 (=> res!116636 e!154582)))

(assert (=> d!59587 (= res!116636 (bvsge #b00000000000000000000000000000000 (size!5932 (_keys!6513 thiss!1504))))))

(assert (=> d!59587 (= (arrayNoDuplicates!0 (_keys!6513 thiss!1504) #b00000000000000000000000000000000 Nil!3562) e!154582)))

(assert (= (and d!59587 (not res!116636)) b!238087))

(assert (= (and b!238087 res!116635) b!238085))

(assert (= (and b!238087 res!116637) b!238086))

(assert (= (and b!238086 c!39720) b!238089))

(assert (= (and b!238086 (not c!39720)) b!238088))

(assert (= (or b!238089 b!238088) bm!22125))

(assert (=> bm!22125 m!258199))

(declare-fun m!258251 () Bool)

(assert (=> bm!22125 m!258251))

(assert (=> b!238085 m!258199))

(assert (=> b!238085 m!258199))

(declare-fun m!258253 () Bool)

(assert (=> b!238085 m!258253))

(assert (=> b!238086 m!258199))

(assert (=> b!238086 m!258199))

(assert (=> b!238086 m!258233))

(assert (=> b!238087 m!258199))

(assert (=> b!238087 m!258199))

(assert (=> b!238087 m!258233))

(assert (=> b!237914 d!59587))

(declare-fun d!59589 () Bool)

(declare-fun res!116643 () Bool)

(declare-fun e!154593 () Bool)

(assert (=> d!59589 (=> res!116643 e!154593)))

(assert (=> d!59589 (= res!116643 (bvsge #b00000000000000000000000000000000 (size!5932 (_keys!6513 thiss!1504))))))

(assert (=> d!59589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6513 thiss!1504) (mask!10441 thiss!1504)) e!154593)))

(declare-fun b!238098 () Bool)

(declare-fun e!154594 () Bool)

(assert (=> b!238098 (= e!154593 e!154594)))

(declare-fun c!39723 () Bool)

(assert (=> b!238098 (= c!39723 (validKeyInArray!0 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238099 () Bool)

(declare-fun e!154592 () Bool)

(assert (=> b!238099 (= e!154594 e!154592)))

(declare-fun lt!120317 () (_ BitVec 64))

(assert (=> b!238099 (= lt!120317 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120316 () Unit!7304)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11775 (_ BitVec 64) (_ BitVec 32)) Unit!7304)

(assert (=> b!238099 (= lt!120316 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6513 thiss!1504) lt!120317 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!238099 (arrayContainsKey!0 (_keys!6513 thiss!1504) lt!120317 #b00000000000000000000000000000000)))

(declare-fun lt!120315 () Unit!7304)

(assert (=> b!238099 (= lt!120315 lt!120316)))

(declare-fun res!116642 () Bool)

(assert (=> b!238099 (= res!116642 (= (seekEntryOrOpen!0 (select (arr!5590 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000) (_keys!6513 thiss!1504) (mask!10441 thiss!1504)) (Found!1010 #b00000000000000000000000000000000)))))

(assert (=> b!238099 (=> (not res!116642) (not e!154592))))

(declare-fun b!238100 () Bool)

(declare-fun call!22131 () Bool)

(assert (=> b!238100 (= e!154594 call!22131)))

(declare-fun bm!22128 () Bool)

(assert (=> bm!22128 (= call!22131 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6513 thiss!1504) (mask!10441 thiss!1504)))))

(declare-fun b!238101 () Bool)

(assert (=> b!238101 (= e!154592 call!22131)))

(assert (= (and d!59589 (not res!116643)) b!238098))

(assert (= (and b!238098 c!39723) b!238099))

(assert (= (and b!238098 (not c!39723)) b!238100))

(assert (= (and b!238099 res!116642) b!238101))

(assert (= (or b!238101 b!238100) bm!22128))

(assert (=> b!238098 m!258199))

(assert (=> b!238098 m!258199))

(assert (=> b!238098 m!258233))

(assert (=> b!238099 m!258199))

(declare-fun m!258255 () Bool)

(assert (=> b!238099 m!258255))

(declare-fun m!258257 () Bool)

(assert (=> b!238099 m!258257))

(assert (=> b!238099 m!258199))

(declare-fun m!258259 () Bool)

(assert (=> b!238099 m!258259))

(declare-fun m!258261 () Bool)

(assert (=> bm!22128 m!258261))

(assert (=> b!237909 d!59589))

(declare-fun d!59591 () Bool)

(declare-fun res!116650 () Bool)

(declare-fun e!154597 () Bool)

(assert (=> d!59591 (=> (not res!116650) (not e!154597))))

(declare-fun simpleValid!242 (LongMapFixedSize!3466) Bool)

(assert (=> d!59591 (= res!116650 (simpleValid!242 thiss!1504))))

(assert (=> d!59591 (= (valid!1373 thiss!1504) e!154597)))

(declare-fun b!238108 () Bool)

(declare-fun res!116651 () Bool)

(assert (=> b!238108 (=> (not res!116651) (not e!154597))))

(declare-fun arrayCountValidKeys!0 (array!11775 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!238108 (= res!116651 (= (arrayCountValidKeys!0 (_keys!6513 thiss!1504) #b00000000000000000000000000000000 (size!5932 (_keys!6513 thiss!1504))) (_size!1782 thiss!1504)))))

(declare-fun b!238109 () Bool)

(declare-fun res!116652 () Bool)

(assert (=> b!238109 (=> (not res!116652) (not e!154597))))

(assert (=> b!238109 (= res!116652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6513 thiss!1504) (mask!10441 thiss!1504)))))

(declare-fun b!238110 () Bool)

(assert (=> b!238110 (= e!154597 (arrayNoDuplicates!0 (_keys!6513 thiss!1504) #b00000000000000000000000000000000 Nil!3562))))

(assert (= (and d!59591 res!116650) b!238108))

(assert (= (and b!238108 res!116651) b!238109))

(assert (= (and b!238109 res!116652) b!238110))

(declare-fun m!258263 () Bool)

(assert (=> d!59591 m!258263))

(declare-fun m!258265 () Bool)

(assert (=> b!238108 m!258265))

(assert (=> b!238109 m!258123))

(assert (=> b!238110 m!258127))

(assert (=> start!22854 d!59591))

(declare-fun d!59593 () Bool)

(assert (=> d!59593 (= (validMask!0 (mask!10441 thiss!1504)) (and (or (= (mask!10441 thiss!1504) #b00000000000000000000000000000111) (= (mask!10441 thiss!1504) #b00000000000000000000000000001111) (= (mask!10441 thiss!1504) #b00000000000000000000000000011111) (= (mask!10441 thiss!1504) #b00000000000000000000000000111111) (= (mask!10441 thiss!1504) #b00000000000000000000000001111111) (= (mask!10441 thiss!1504) #b00000000000000000000000011111111) (= (mask!10441 thiss!1504) #b00000000000000000000000111111111) (= (mask!10441 thiss!1504) #b00000000000000000000001111111111) (= (mask!10441 thiss!1504) #b00000000000000000000011111111111) (= (mask!10441 thiss!1504) #b00000000000000000000111111111111) (= (mask!10441 thiss!1504) #b00000000000000000001111111111111) (= (mask!10441 thiss!1504) #b00000000000000000011111111111111) (= (mask!10441 thiss!1504) #b00000000000000000111111111111111) (= (mask!10441 thiss!1504) #b00000000000000001111111111111111) (= (mask!10441 thiss!1504) #b00000000000000011111111111111111) (= (mask!10441 thiss!1504) #b00000000000000111111111111111111) (= (mask!10441 thiss!1504) #b00000000000001111111111111111111) (= (mask!10441 thiss!1504) #b00000000000011111111111111111111) (= (mask!10441 thiss!1504) #b00000000000111111111111111111111) (= (mask!10441 thiss!1504) #b00000000001111111111111111111111) (= (mask!10441 thiss!1504) #b00000000011111111111111111111111) (= (mask!10441 thiss!1504) #b00000000111111111111111111111111) (= (mask!10441 thiss!1504) #b00000001111111111111111111111111) (= (mask!10441 thiss!1504) #b00000011111111111111111111111111) (= (mask!10441 thiss!1504) #b00000111111111111111111111111111) (= (mask!10441 thiss!1504) #b00001111111111111111111111111111) (= (mask!10441 thiss!1504) #b00011111111111111111111111111111) (= (mask!10441 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10441 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!237913 d!59593))

(declare-fun d!59595 () Bool)

(assert (=> d!59595 (= (array_inv!3691 (_keys!6513 thiss!1504)) (bvsge (size!5932 (_keys!6513 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237907 d!59595))

(declare-fun d!59597 () Bool)

(assert (=> d!59597 (= (array_inv!3692 (_values!4399 thiss!1504)) (bvsge (size!5931 (_values!4399 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237907 d!59597))

(declare-fun b!238118 () Bool)

(declare-fun e!154602 () Bool)

(assert (=> b!238118 (= e!154602 tp_is_empty!6253)))

(declare-fun condMapEmpty!10614 () Bool)

(declare-fun mapDefault!10614 () ValueCell!2783)

(assert (=> mapNonEmpty!10605 (= condMapEmpty!10614 (= mapRest!10605 ((as const (Array (_ BitVec 32) ValueCell!2783)) mapDefault!10614)))))

(declare-fun mapRes!10614 () Bool)

(assert (=> mapNonEmpty!10605 (= tp!22370 (and e!154602 mapRes!10614))))

(declare-fun b!238117 () Bool)

(declare-fun e!154603 () Bool)

(assert (=> b!238117 (= e!154603 tp_is_empty!6253)))

(declare-fun mapNonEmpty!10614 () Bool)

(declare-fun tp!22386 () Bool)

(assert (=> mapNonEmpty!10614 (= mapRes!10614 (and tp!22386 e!154603))))

(declare-fun mapKey!10614 () (_ BitVec 32))

(declare-fun mapValue!10614 () ValueCell!2783)

(declare-fun mapRest!10614 () (Array (_ BitVec 32) ValueCell!2783))

(assert (=> mapNonEmpty!10614 (= mapRest!10605 (store mapRest!10614 mapKey!10614 mapValue!10614))))

(declare-fun mapIsEmpty!10614 () Bool)

(assert (=> mapIsEmpty!10614 mapRes!10614))

(assert (= (and mapNonEmpty!10605 condMapEmpty!10614) mapIsEmpty!10614))

(assert (= (and mapNonEmpty!10605 (not condMapEmpty!10614)) mapNonEmpty!10614))

(assert (= (and mapNonEmpty!10614 ((_ is ValueCellFull!2783) mapValue!10614)) b!238117))

(assert (= (and mapNonEmpty!10605 ((_ is ValueCellFull!2783) mapDefault!10614)) b!238118))

(declare-fun m!258267 () Bool)

(assert (=> mapNonEmpty!10614 m!258267))

(declare-fun b_lambda!7955 () Bool)

(assert (= b_lambda!7953 (or (and b!237907 b_free!6391) b_lambda!7955)))

(check-sat (not b!238009) (not b!238063) (not b!238072) (not d!59581) (not b!238007) (not b!238110) (not b!238099) (not b!238098) (not d!59583) (not b!238000) (not bm!22125) (not d!59591) (not bm!22122) (not b!238057) b_and!13333 tp_is_empty!6253 (not b!238087) (not bm!22120) (not d!59585) (not b!238109) (not b!238108) (not mapNonEmpty!10614) (not bm!22118) (not b!238085) (not b!238054) (not b_next!6391) (not bm!22116) (not b!238068) (not b!238061) (not b_lambda!7955) (not bm!22128) (not b!238059) (not b!238086) (not b!238055))
(check-sat b_and!13333 (not b_next!6391))
