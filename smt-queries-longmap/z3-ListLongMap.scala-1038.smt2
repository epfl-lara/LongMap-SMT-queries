; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21912 () Bool)

(assert start!21912)

(declare-fun b!222512 () Bool)

(declare-fun b_free!5979 () Bool)

(declare-fun b_next!5979 () Bool)

(assert (=> b!222512 (= b_free!5979 (not b_next!5979))))

(declare-fun tp!21078 () Bool)

(declare-fun b_and!12877 () Bool)

(assert (=> b!222512 (= tp!21078 b_and!12877)))

(declare-fun b!222496 () Bool)

(declare-fun res!109246 () Bool)

(declare-fun e!144601 () Bool)

(assert (=> b!222496 (=> (not res!109246) (not e!144601))))

(declare-datatypes ((List!3305 0))(
  ( (Nil!3302) (Cons!3301 (h!3949 (_ BitVec 64)) (t!8264 List!3305)) )
))
(declare-fun noDuplicate!70 (List!3305) Bool)

(assert (=> b!222496 (= res!109246 (noDuplicate!70 Nil!3302))))

(declare-fun b!222497 () Bool)

(declare-fun e!144591 () Bool)

(declare-fun call!20771 () Bool)

(assert (=> b!222497 (= e!144591 (not call!20771))))

(declare-fun b!222498 () Bool)

(declare-fun e!144600 () Bool)

(declare-fun e!144588 () Bool)

(declare-fun mapRes!9931 () Bool)

(assert (=> b!222498 (= e!144600 (and e!144588 mapRes!9931))))

(declare-fun condMapEmpty!9931 () Bool)

(declare-datatypes ((V!7435 0))(
  ( (V!7436 (val!2965 Int)) )
))
(declare-datatypes ((ValueCell!2577 0))(
  ( (ValueCellFull!2577 (v!4985 V!7435)) (EmptyCell!2577) )
))
(declare-datatypes ((array!10925 0))(
  ( (array!10926 (arr!5182 (Array (_ BitVec 32) ValueCell!2577)) (size!5515 (_ BitVec 32))) )
))
(declare-datatypes ((array!10927 0))(
  ( (array!10928 (arr!5183 (Array (_ BitVec 32) (_ BitVec 64))) (size!5516 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3054 0))(
  ( (LongMapFixedSize!3055 (defaultEntry!4186 Int) (mask!10006 (_ BitVec 32)) (extraKeys!3923 (_ BitVec 32)) (zeroValue!4027 V!7435) (minValue!4027 V!7435) (_size!1576 (_ BitVec 32)) (_keys!6240 array!10927) (_values!4169 array!10925) (_vacant!1576 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3054)

(declare-fun mapDefault!9931 () ValueCell!2577)

(assert (=> b!222498 (= condMapEmpty!9931 (= (arr!5182 (_values!4169 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2577)) mapDefault!9931)))))

(declare-fun b!222499 () Bool)

(declare-fun e!144602 () Bool)

(assert (=> b!222499 (= e!144602 (not call!20771))))

(declare-fun b!222500 () Bool)

(declare-fun res!109248 () Bool)

(assert (=> b!222500 (=> (not res!109248) (not e!144602))))

(declare-fun call!20772 () Bool)

(assert (=> b!222500 (= res!109248 call!20772)))

(declare-fun e!144594 () Bool)

(assert (=> b!222500 (= e!144594 e!144602)))

(declare-fun b!222501 () Bool)

(declare-datatypes ((Unit!6670 0))(
  ( (Unit!6671) )
))
(declare-fun e!144592 () Unit!6670)

(declare-fun Unit!6672 () Unit!6670)

(assert (=> b!222501 (= e!144592 Unit!6672)))

(declare-fun lt!112671 () Unit!6670)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!226 (array!10927 array!10925 (_ BitVec 32) (_ BitVec 32) V!7435 V!7435 (_ BitVec 64) Int) Unit!6670)

(assert (=> b!222501 (= lt!112671 (lemmaInListMapThenSeekEntryOrOpenFindsIt!226 (_keys!6240 thiss!1504) (_values!4169 thiss!1504) (mask!10006 thiss!1504) (extraKeys!3923 thiss!1504) (zeroValue!4027 thiss!1504) (minValue!4027 thiss!1504) key!932 (defaultEntry!4186 thiss!1504)))))

(assert (=> b!222501 false))

(declare-fun b!222502 () Bool)

(assert (=> b!222502 (= e!144601 false)))

(declare-fun lt!112667 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10927 (_ BitVec 32) List!3305) Bool)

(assert (=> b!222502 (= lt!112667 (arrayNoDuplicates!0 (_keys!6240 thiss!1504) #b00000000000000000000000000000000 Nil!3302))))

(declare-fun res!109234 () Bool)

(declare-fun e!144596 () Bool)

(assert (=> start!21912 (=> (not res!109234) (not e!144596))))

(declare-fun valid!1232 (LongMapFixedSize!3054) Bool)

(assert (=> start!21912 (= res!109234 (valid!1232 thiss!1504))))

(assert (=> start!21912 e!144596))

(declare-fun e!144597 () Bool)

(assert (=> start!21912 e!144597))

(assert (=> start!21912 true))

(declare-fun b!222503 () Bool)

(declare-fun tp_is_empty!5841 () Bool)

(assert (=> b!222503 (= e!144588 tp_is_empty!5841)))

(declare-fun b!222504 () Bool)

(declare-fun e!144604 () Bool)

(declare-fun contains!1525 (List!3305 (_ BitVec 64)) Bool)

(assert (=> b!222504 (= e!144604 (contains!1525 Nil!3302 key!932))))

(declare-fun b!222505 () Bool)

(declare-fun res!109244 () Bool)

(assert (=> b!222505 (=> (not res!109244) (not e!144601))))

(declare-fun e!144605 () Bool)

(assert (=> b!222505 (= res!109244 e!144605)))

(declare-fun res!109238 () Bool)

(assert (=> b!222505 (=> res!109238 e!144605)))

(assert (=> b!222505 (= res!109238 e!144604)))

(declare-fun res!109239 () Bool)

(assert (=> b!222505 (=> (not res!109239) (not e!144604))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222505 (= res!109239 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!222506 () Bool)

(declare-fun e!144593 () Bool)

(assert (=> b!222506 (= e!144605 e!144593)))

(declare-fun res!109241 () Bool)

(assert (=> b!222506 (=> (not res!109241) (not e!144593))))

(assert (=> b!222506 (= res!109241 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222507 () Bool)

(declare-fun e!144598 () Bool)

(assert (=> b!222507 (= e!144598 tp_is_empty!5841)))

(declare-fun b!222508 () Bool)

(declare-fun e!144590 () Bool)

(declare-datatypes ((SeekEntryResult!838 0))(
  ( (MissingZero!838 (index!5522 (_ BitVec 32))) (Found!838 (index!5523 (_ BitVec 32))) (Intermediate!838 (undefined!1650 Bool) (index!5524 (_ BitVec 32)) (x!23058 (_ BitVec 32))) (Undefined!838) (MissingVacant!838 (index!5525 (_ BitVec 32))) )
))
(declare-fun lt!112668 () SeekEntryResult!838)

(get-info :version)

(assert (=> b!222508 (= e!144590 ((_ is Undefined!838) lt!112668))))

(declare-fun b!222509 () Bool)

(declare-fun c!36970 () Bool)

(assert (=> b!222509 (= c!36970 ((_ is MissingVacant!838) lt!112668))))

(assert (=> b!222509 (= e!144594 e!144590)))

(declare-fun b!222510 () Bool)

(declare-fun e!144603 () Bool)

(declare-fun e!144589 () Bool)

(assert (=> b!222510 (= e!144603 e!144589)))

(declare-fun res!109247 () Bool)

(assert (=> b!222510 (=> (not res!109247) (not e!144589))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222510 (= res!109247 (inRange!0 index!297 (mask!10006 thiss!1504)))))

(declare-fun lt!112669 () Unit!6670)

(assert (=> b!222510 (= lt!112669 e!144592)))

(declare-fun c!36971 () Bool)

(declare-datatypes ((tuple2!4400 0))(
  ( (tuple2!4401 (_1!2211 (_ BitVec 64)) (_2!2211 V!7435)) )
))
(declare-datatypes ((List!3306 0))(
  ( (Nil!3303) (Cons!3302 (h!3950 tuple2!4400) (t!8265 List!3306)) )
))
(declare-datatypes ((ListLongMap!3313 0))(
  ( (ListLongMap!3314 (toList!1672 List!3306)) )
))
(declare-fun contains!1526 (ListLongMap!3313 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1200 (array!10927 array!10925 (_ BitVec 32) (_ BitVec 32) V!7435 V!7435 (_ BitVec 32) Int) ListLongMap!3313)

(assert (=> b!222510 (= c!36971 (contains!1526 (getCurrentListMap!1200 (_keys!6240 thiss!1504) (_values!4169 thiss!1504) (mask!10006 thiss!1504) (extraKeys!3923 thiss!1504) (zeroValue!4027 thiss!1504) (minValue!4027 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4186 thiss!1504)) key!932))))

(declare-fun b!222511 () Bool)

(declare-fun res!109242 () Bool)

(assert (=> b!222511 (=> (not res!109242) (not e!144601))))

(assert (=> b!222511 (= res!109242 (not (contains!1525 Nil!3302 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun array_inv!3431 (array!10927) Bool)

(declare-fun array_inv!3432 (array!10925) Bool)

(assert (=> b!222512 (= e!144597 (and tp!21078 tp_is_empty!5841 (array_inv!3431 (_keys!6240 thiss!1504)) (array_inv!3432 (_values!4169 thiss!1504)) e!144600))))

(declare-fun mapNonEmpty!9931 () Bool)

(declare-fun tp!21079 () Bool)

(assert (=> mapNonEmpty!9931 (= mapRes!9931 (and tp!21079 e!144598))))

(declare-fun mapRest!9931 () (Array (_ BitVec 32) ValueCell!2577))

(declare-fun mapKey!9931 () (_ BitVec 32))

(declare-fun mapValue!9931 () ValueCell!2577)

(assert (=> mapNonEmpty!9931 (= (arr!5182 (_values!4169 thiss!1504)) (store mapRest!9931 mapKey!9931 mapValue!9931))))

(declare-fun b!222513 () Bool)

(declare-fun res!109240 () Bool)

(assert (=> b!222513 (=> (not res!109240) (not e!144601))))

(assert (=> b!222513 (= res!109240 (not (contains!1525 Nil!3302 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222514 () Bool)

(declare-fun res!109235 () Bool)

(assert (=> b!222514 (=> (not res!109235) (not e!144602))))

(assert (=> b!222514 (= res!109235 (= (select (arr!5183 (_keys!6240 thiss!1504)) (index!5522 lt!112668)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222515 () Bool)

(assert (=> b!222515 (= e!144593 (not (contains!1525 Nil!3302 key!932)))))

(declare-fun b!222516 () Bool)

(assert (=> b!222516 (= e!144596 e!144603)))

(declare-fun res!109237 () Bool)

(assert (=> b!222516 (=> (not res!109237) (not e!144603))))

(assert (=> b!222516 (= res!109237 (or (= lt!112668 (MissingZero!838 index!297)) (= lt!112668 (MissingVacant!838 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10927 (_ BitVec 32)) SeekEntryResult!838)

(assert (=> b!222516 (= lt!112668 (seekEntryOrOpen!0 key!932 (_keys!6240 thiss!1504) (mask!10006 thiss!1504)))))

(declare-fun b!222517 () Bool)

(declare-fun lt!112672 () Unit!6670)

(assert (=> b!222517 (= e!144592 lt!112672)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!236 (array!10927 array!10925 (_ BitVec 32) (_ BitVec 32) V!7435 V!7435 (_ BitVec 64) Int) Unit!6670)

(assert (=> b!222517 (= lt!112672 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!236 (_keys!6240 thiss!1504) (_values!4169 thiss!1504) (mask!10006 thiss!1504) (extraKeys!3923 thiss!1504) (zeroValue!4027 thiss!1504) (minValue!4027 thiss!1504) key!932 (defaultEntry!4186 thiss!1504)))))

(declare-fun c!36969 () Bool)

(assert (=> b!222517 (= c!36969 ((_ is MissingZero!838) lt!112668))))

(assert (=> b!222517 e!144594))

(declare-fun b!222518 () Bool)

(declare-fun res!109245 () Bool)

(assert (=> b!222518 (=> (not res!109245) (not e!144596))))

(assert (=> b!222518 (= res!109245 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222519 () Bool)

(assert (=> b!222519 (= e!144590 e!144591)))

(declare-fun res!109243 () Bool)

(assert (=> b!222519 (= res!109243 call!20772)))

(assert (=> b!222519 (=> (not res!109243) (not e!144591))))

(declare-fun bm!20768 () Bool)

(declare-fun arrayContainsKey!0 (array!10927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20768 (= call!20771 (arrayContainsKey!0 (_keys!6240 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!20769 () Bool)

(assert (=> bm!20769 (= call!20772 (inRange!0 (ite c!36969 (index!5522 lt!112668) (index!5525 lt!112668)) (mask!10006 thiss!1504)))))

(declare-fun b!222520 () Bool)

(declare-fun e!144595 () Unit!6670)

(declare-fun Unit!6673 () Unit!6670)

(assert (=> b!222520 (= e!144595 Unit!6673)))

(declare-fun lt!112673 () Unit!6670)

(declare-fun lemmaArrayContainsKeyThenInListMap!62 (array!10927 array!10925 (_ BitVec 32) (_ BitVec 32) V!7435 V!7435 (_ BitVec 64) (_ BitVec 32) Int) Unit!6670)

(assert (=> b!222520 (= lt!112673 (lemmaArrayContainsKeyThenInListMap!62 (_keys!6240 thiss!1504) (_values!4169 thiss!1504) (mask!10006 thiss!1504) (extraKeys!3923 thiss!1504) (zeroValue!4027 thiss!1504) (minValue!4027 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4186 thiss!1504)))))

(assert (=> b!222520 false))

(declare-fun b!222521 () Bool)

(assert (=> b!222521 (= e!144589 e!144601)))

(declare-fun res!109249 () Bool)

(assert (=> b!222521 (=> (not res!109249) (not e!144601))))

(assert (=> b!222521 (= res!109249 (and (bvslt (size!5516 (_keys!6240 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5516 (_keys!6240 thiss!1504)))))))

(declare-fun lt!112670 () Unit!6670)

(assert (=> b!222521 (= lt!112670 e!144595)))

(declare-fun c!36972 () Bool)

(assert (=> b!222521 (= c!36972 (arrayContainsKey!0 (_keys!6240 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222522 () Bool)

(declare-fun Unit!6674 () Unit!6670)

(assert (=> b!222522 (= e!144595 Unit!6674)))

(declare-fun mapIsEmpty!9931 () Bool)

(assert (=> mapIsEmpty!9931 mapRes!9931))

(declare-fun b!222523 () Bool)

(declare-fun res!109236 () Bool)

(assert (=> b!222523 (= res!109236 (= (select (arr!5183 (_keys!6240 thiss!1504)) (index!5525 lt!112668)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!222523 (=> (not res!109236) (not e!144591))))

(assert (= (and start!21912 res!109234) b!222518))

(assert (= (and b!222518 res!109245) b!222516))

(assert (= (and b!222516 res!109237) b!222510))

(assert (= (and b!222510 c!36971) b!222501))

(assert (= (and b!222510 (not c!36971)) b!222517))

(assert (= (and b!222517 c!36969) b!222500))

(assert (= (and b!222517 (not c!36969)) b!222509))

(assert (= (and b!222500 res!109248) b!222514))

(assert (= (and b!222514 res!109235) b!222499))

(assert (= (and b!222509 c!36970) b!222519))

(assert (= (and b!222509 (not c!36970)) b!222508))

(assert (= (and b!222519 res!109243) b!222523))

(assert (= (and b!222523 res!109236) b!222497))

(assert (= (or b!222500 b!222519) bm!20769))

(assert (= (or b!222499 b!222497) bm!20768))

(assert (= (and b!222510 res!109247) b!222521))

(assert (= (and b!222521 c!36972) b!222520))

(assert (= (and b!222521 (not c!36972)) b!222522))

(assert (= (and b!222521 res!109249) b!222496))

(assert (= (and b!222496 res!109246) b!222511))

(assert (= (and b!222511 res!109242) b!222513))

(assert (= (and b!222513 res!109240) b!222505))

(assert (= (and b!222505 res!109239) b!222504))

(assert (= (and b!222505 (not res!109238)) b!222506))

(assert (= (and b!222506 res!109241) b!222515))

(assert (= (and b!222505 res!109244) b!222502))

(assert (= (and b!222498 condMapEmpty!9931) mapIsEmpty!9931))

(assert (= (and b!222498 (not condMapEmpty!9931)) mapNonEmpty!9931))

(assert (= (and mapNonEmpty!9931 ((_ is ValueCellFull!2577) mapValue!9931)) b!222507))

(assert (= (and b!222498 ((_ is ValueCellFull!2577) mapDefault!9931)) b!222503))

(assert (= b!222512 b!222498))

(assert (= start!21912 b!222512))

(declare-fun m!246585 () Bool)

(assert (=> b!222512 m!246585))

(declare-fun m!246587 () Bool)

(assert (=> b!222512 m!246587))

(declare-fun m!246589 () Bool)

(assert (=> b!222502 m!246589))

(declare-fun m!246591 () Bool)

(assert (=> b!222516 m!246591))

(declare-fun m!246593 () Bool)

(assert (=> b!222496 m!246593))

(declare-fun m!246595 () Bool)

(assert (=> b!222514 m!246595))

(declare-fun m!246597 () Bool)

(assert (=> b!222504 m!246597))

(declare-fun m!246599 () Bool)

(assert (=> bm!20769 m!246599))

(declare-fun m!246601 () Bool)

(assert (=> b!222510 m!246601))

(declare-fun m!246603 () Bool)

(assert (=> b!222510 m!246603))

(assert (=> b!222510 m!246603))

(declare-fun m!246605 () Bool)

(assert (=> b!222510 m!246605))

(declare-fun m!246607 () Bool)

(assert (=> b!222521 m!246607))

(assert (=> b!222515 m!246597))

(declare-fun m!246609 () Bool)

(assert (=> b!222513 m!246609))

(declare-fun m!246611 () Bool)

(assert (=> start!21912 m!246611))

(declare-fun m!246613 () Bool)

(assert (=> b!222501 m!246613))

(declare-fun m!246615 () Bool)

(assert (=> b!222523 m!246615))

(assert (=> bm!20768 m!246607))

(declare-fun m!246617 () Bool)

(assert (=> mapNonEmpty!9931 m!246617))

(declare-fun m!246619 () Bool)

(assert (=> b!222520 m!246619))

(declare-fun m!246621 () Bool)

(assert (=> b!222517 m!246621))

(declare-fun m!246623 () Bool)

(assert (=> b!222511 m!246623))

(check-sat (not bm!20769) (not b!222504) (not b_next!5979) (not b!222517) (not mapNonEmpty!9931) (not b!222510) (not b!222496) (not b!222511) (not b!222513) b_and!12877 tp_is_empty!5841 (not bm!20768) (not b!222512) (not b!222516) (not start!21912) (not b!222501) (not b!222521) (not b!222520) (not b!222515) (not b!222502))
(check-sat b_and!12877 (not b_next!5979))
