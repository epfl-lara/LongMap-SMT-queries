; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11648 () Bool)

(assert start!11648)

(declare-fun b!97144 () Bool)

(declare-fun b_free!2413 () Bool)

(declare-fun b_next!2413 () Bool)

(assert (=> b!97144 (= b_free!2413 (not b_next!2413))))

(declare-fun tp!9523 () Bool)

(declare-fun b_and!5941 () Bool)

(assert (=> b!97144 (= tp!9523 b_and!5941)))

(declare-fun b!97157 () Bool)

(declare-fun b_free!2415 () Bool)

(declare-fun b_next!2415 () Bool)

(assert (=> b!97157 (= b_free!2415 (not b_next!2415))))

(declare-fun tp!9524 () Bool)

(declare-fun b_and!5943 () Bool)

(assert (=> b!97157 (= tp!9524 b_and!5943)))

(declare-fun b!97140 () Bool)

(declare-fun res!48970 () Bool)

(declare-fun e!63319 () Bool)

(assert (=> b!97140 (=> (not res!48970) (not e!63319))))

(declare-datatypes ((V!3145 0))(
  ( (V!3146 (val!1356 Int)) )
))
(declare-datatypes ((array!4211 0))(
  ( (array!4212 (arr!2000 (Array (_ BitVec 32) (_ BitVec 64))) (size!2250 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!968 0))(
  ( (ValueCellFull!968 (v!2795 V!3145)) (EmptyCell!968) )
))
(declare-datatypes ((array!4213 0))(
  ( (array!4214 (arr!2001 (Array (_ BitVec 32) ValueCell!968)) (size!2251 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!844 0))(
  ( (LongMapFixedSize!845 (defaultEntry!2477 Int) (mask!6572 (_ BitVec 32)) (extraKeys!2298 (_ BitVec 32)) (zeroValue!2360 V!3145) (minValue!2360 V!3145) (_size!471 (_ BitVec 32)) (_keys!4167 array!4211) (_values!2460 array!4213) (_vacant!471 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!650 0))(
  ( (Cell!651 (v!2796 LongMapFixedSize!844)) )
))
(declare-datatypes ((LongMap!650 0))(
  ( (LongMap!651 (underlying!336 Cell!650)) )
))
(declare-fun thiss!992 () LongMap!650)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!97140 (= res!48970 (validMask!0 (mask!6572 (v!2796 (underlying!336 thiss!992)))))))

(declare-fun b!97141 () Bool)

(declare-fun e!63323 () Bool)

(declare-fun tp_is_empty!2623 () Bool)

(assert (=> b!97141 (= e!63323 tp_is_empty!2623)))

(declare-fun b!97142 () Bool)

(declare-fun e!63324 () Bool)

(assert (=> b!97142 (= e!63324 tp_is_empty!2623)))

(declare-fun b!97143 () Bool)

(declare-datatypes ((Unit!2911 0))(
  ( (Unit!2912) )
))
(declare-fun e!63325 () Unit!2911)

(declare-fun Unit!2913 () Unit!2911)

(assert (=> b!97143 (= e!63325 Unit!2913)))

(declare-fun lt!48620 () Unit!2911)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!85 (array!4211 array!4213 (_ BitVec 32) (_ BitVec 32) V!3145 V!3145 (_ BitVec 64) (_ BitVec 32) Int) Unit!2911)

(assert (=> b!97143 (= lt!48620 (lemmaListMapContainsThenArrayContainsFrom!85 (_keys!4167 (v!2796 (underlying!336 thiss!992))) (_values!2460 (v!2796 (underlying!336 thiss!992))) (mask!6572 (v!2796 (underlying!336 thiss!992))) (extraKeys!2298 (v!2796 (underlying!336 thiss!992))) (zeroValue!2360 (v!2796 (underlying!336 thiss!992))) (minValue!2360 (v!2796 (underlying!336 thiss!992))) (select (arr!2000 (_keys!4167 (v!2796 (underlying!336 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2477 (v!2796 (underlying!336 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!97143 (arrayContainsKey!0 (_keys!4167 (v!2796 (underlying!336 thiss!992))) (select (arr!2000 (_keys!4167 (v!2796 (underlying!336 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!48622 () Unit!2911)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4211 (_ BitVec 32) (_ BitVec 32)) Unit!2911)

(assert (=> b!97143 (= lt!48622 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4167 (v!2796 (underlying!336 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1561 0))(
  ( (Nil!1558) (Cons!1557 (h!2151 (_ BitVec 64)) (t!5495 List!1561)) )
))
(declare-fun arrayNoDuplicates!0 (array!4211 (_ BitVec 32) List!1561) Bool)

(assert (=> b!97143 (arrayNoDuplicates!0 (_keys!4167 (v!2796 (underlying!336 thiss!992))) from!355 Nil!1558)))

(declare-fun lt!48625 () Unit!2911)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4211 (_ BitVec 32) (_ BitVec 64) List!1561) Unit!2911)

(assert (=> b!97143 (= lt!48625 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4167 (v!2796 (underlying!336 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2000 (_keys!4167 (v!2796 (underlying!336 thiss!992)))) from!355) (Cons!1557 (select (arr!2000 (_keys!4167 (v!2796 (underlying!336 thiss!992)))) from!355) Nil!1558)))))

(assert (=> b!97143 false))

(declare-fun e!63318 () Bool)

(declare-fun e!63322 () Bool)

(declare-fun array_inv!1231 (array!4211) Bool)

(declare-fun array_inv!1232 (array!4213) Bool)

(assert (=> b!97144 (= e!63322 (and tp!9523 tp_is_empty!2623 (array_inv!1231 (_keys!4167 (v!2796 (underlying!336 thiss!992)))) (array_inv!1232 (_values!2460 (v!2796 (underlying!336 thiss!992)))) e!63318))))

(declare-fun res!48972 () Bool)

(declare-fun e!63328 () Bool)

(assert (=> start!11648 (=> (not res!48972) (not e!63328))))

(declare-fun valid!389 (LongMap!650) Bool)

(assert (=> start!11648 (= res!48972 (valid!389 thiss!992))))

(assert (=> start!11648 e!63328))

(declare-fun e!63327 () Bool)

(assert (=> start!11648 e!63327))

(assert (=> start!11648 true))

(declare-fun e!63320 () Bool)

(assert (=> start!11648 e!63320))

(declare-fun mapIsEmpty!3721 () Bool)

(declare-fun mapRes!3722 () Bool)

(assert (=> mapIsEmpty!3721 mapRes!3722))

(declare-fun mapIsEmpty!3722 () Bool)

(declare-fun mapRes!3721 () Bool)

(assert (=> mapIsEmpty!3722 mapRes!3721))

(declare-fun b!97145 () Bool)

(declare-fun e!63326 () Bool)

(assert (=> b!97145 (= e!63318 (and e!63326 mapRes!3722))))

(declare-fun condMapEmpty!3722 () Bool)

(declare-fun mapDefault!3722 () ValueCell!968)

(assert (=> b!97145 (= condMapEmpty!3722 (= (arr!2001 (_values!2460 (v!2796 (underlying!336 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!968)) mapDefault!3722)))))

(declare-fun b!97146 () Bool)

(assert (=> b!97146 (= e!63326 tp_is_empty!2623)))

(declare-fun b!97147 () Bool)

(declare-fun e!63317 () Bool)

(assert (=> b!97147 (= e!63317 e!63322)))

(declare-fun b!97148 () Bool)

(declare-fun e!63329 () Bool)

(assert (=> b!97148 (= e!63329 (and e!63324 mapRes!3721))))

(declare-fun condMapEmpty!3721 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!844)

(declare-fun mapDefault!3721 () ValueCell!968)

(assert (=> b!97148 (= condMapEmpty!3721 (= (arr!2001 (_values!2460 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!968)) mapDefault!3721)))))

(declare-fun b!97149 () Bool)

(declare-fun Unit!2914 () Unit!2911)

(assert (=> b!97149 (= e!63325 Unit!2914)))

(declare-fun b!97150 () Bool)

(declare-fun e!63330 () Bool)

(assert (=> b!97150 (= e!63328 e!63330)))

(declare-fun res!48974 () Bool)

(assert (=> b!97150 (=> (not res!48974) (not e!63330))))

(declare-datatypes ((tuple2!2290 0))(
  ( (tuple2!2291 (_1!1156 (_ BitVec 64)) (_2!1156 V!3145)) )
))
(declare-datatypes ((List!1562 0))(
  ( (Nil!1559) (Cons!1558 (h!2152 tuple2!2290) (t!5496 List!1562)) )
))
(declare-datatypes ((ListLongMap!1495 0))(
  ( (ListLongMap!1496 (toList!763 List!1562)) )
))
(declare-fun lt!48621 () ListLongMap!1495)

(declare-fun lt!48623 () ListLongMap!1495)

(assert (=> b!97150 (= res!48974 (and (= lt!48623 lt!48621) (not (= (select (arr!2000 (_keys!4167 (v!2796 (underlying!336 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2000 (_keys!4167 (v!2796 (underlying!336 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1249 (LongMapFixedSize!844) ListLongMap!1495)

(assert (=> b!97150 (= lt!48621 (map!1249 newMap!16))))

(declare-fun getCurrentListMap!453 (array!4211 array!4213 (_ BitVec 32) (_ BitVec 32) V!3145 V!3145 (_ BitVec 32) Int) ListLongMap!1495)

(assert (=> b!97150 (= lt!48623 (getCurrentListMap!453 (_keys!4167 (v!2796 (underlying!336 thiss!992))) (_values!2460 (v!2796 (underlying!336 thiss!992))) (mask!6572 (v!2796 (underlying!336 thiss!992))) (extraKeys!2298 (v!2796 (underlying!336 thiss!992))) (zeroValue!2360 (v!2796 (underlying!336 thiss!992))) (minValue!2360 (v!2796 (underlying!336 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2477 (v!2796 (underlying!336 thiss!992)))))))

(declare-fun b!97151 () Bool)

(assert (=> b!97151 (= e!63319 (and (= (size!2251 (_values!2460 (v!2796 (underlying!336 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6572 (v!2796 (underlying!336 thiss!992))))) (= (size!2250 (_keys!4167 (v!2796 (underlying!336 thiss!992)))) (size!2251 (_values!2460 (v!2796 (underlying!336 thiss!992))))) (bvslt (mask!6572 (v!2796 (underlying!336 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!3721 () Bool)

(declare-fun tp!9521 () Bool)

(assert (=> mapNonEmpty!3721 (= mapRes!3722 (and tp!9521 e!63323))))

(declare-fun mapKey!3721 () (_ BitVec 32))

(declare-fun mapValue!3721 () ValueCell!968)

(declare-fun mapRest!3722 () (Array (_ BitVec 32) ValueCell!968))

(assert (=> mapNonEmpty!3721 (= (arr!2001 (_values!2460 (v!2796 (underlying!336 thiss!992)))) (store mapRest!3722 mapKey!3721 mapValue!3721))))

(declare-fun mapNonEmpty!3722 () Bool)

(declare-fun tp!9522 () Bool)

(declare-fun e!63331 () Bool)

(assert (=> mapNonEmpty!3722 (= mapRes!3721 (and tp!9522 e!63331))))

(declare-fun mapRest!3721 () (Array (_ BitVec 32) ValueCell!968))

(declare-fun mapValue!3722 () ValueCell!968)

(declare-fun mapKey!3722 () (_ BitVec 32))

(assert (=> mapNonEmpty!3722 (= (arr!2001 (_values!2460 newMap!16)) (store mapRest!3721 mapKey!3722 mapValue!3722))))

(declare-fun b!97152 () Bool)

(assert (=> b!97152 (= e!63330 e!63319)))

(declare-fun res!48975 () Bool)

(assert (=> b!97152 (=> (not res!48975) (not e!63319))))

(declare-datatypes ((tuple2!2292 0))(
  ( (tuple2!2293 (_1!1157 Bool) (_2!1157 LongMapFixedSize!844)) )
))
(declare-fun lt!48619 () tuple2!2292)

(assert (=> b!97152 (= res!48975 (and (_1!1157 lt!48619) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!48624 () Unit!2911)

(assert (=> b!97152 (= lt!48624 e!63325)))

(declare-fun c!16456 () Bool)

(declare-fun contains!786 (ListLongMap!1495 (_ BitVec 64)) Bool)

(assert (=> b!97152 (= c!16456 (contains!786 lt!48621 (select (arr!2000 (_keys!4167 (v!2796 (underlying!336 thiss!992)))) from!355)))))

(declare-fun update!143 (LongMapFixedSize!844 (_ BitVec 64) V!3145) tuple2!2292)

(declare-fun get!1284 (ValueCell!968 V!3145) V!3145)

(declare-fun dynLambda!368 (Int (_ BitVec 64)) V!3145)

(assert (=> b!97152 (= lt!48619 (update!143 newMap!16 (select (arr!2000 (_keys!4167 (v!2796 (underlying!336 thiss!992)))) from!355) (get!1284 (select (arr!2001 (_values!2460 (v!2796 (underlying!336 thiss!992)))) from!355) (dynLambda!368 (defaultEntry!2477 (v!2796 (underlying!336 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!97153 () Bool)

(declare-fun res!48973 () Bool)

(assert (=> b!97153 (=> (not res!48973) (not e!63328))))

(assert (=> b!97153 (= res!48973 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6572 newMap!16)) (_size!471 (v!2796 (underlying!336 thiss!992)))))))

(declare-fun b!97154 () Bool)

(assert (=> b!97154 (= e!63331 tp_is_empty!2623)))

(declare-fun b!97155 () Bool)

(assert (=> b!97155 (= e!63327 e!63317)))

(declare-fun b!97156 () Bool)

(declare-fun res!48971 () Bool)

(assert (=> b!97156 (=> (not res!48971) (not e!63328))))

(assert (=> b!97156 (= res!48971 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2250 (_keys!4167 (v!2796 (underlying!336 thiss!992)))))))))

(assert (=> b!97157 (= e!63320 (and tp!9524 tp_is_empty!2623 (array_inv!1231 (_keys!4167 newMap!16)) (array_inv!1232 (_values!2460 newMap!16)) e!63329))))

(declare-fun b!97158 () Bool)

(declare-fun res!48976 () Bool)

(assert (=> b!97158 (=> (not res!48976) (not e!63328))))

(declare-fun valid!390 (LongMapFixedSize!844) Bool)

(assert (=> b!97158 (= res!48976 (valid!390 newMap!16))))

(assert (= (and start!11648 res!48972) b!97156))

(assert (= (and b!97156 res!48971) b!97158))

(assert (= (and b!97158 res!48976) b!97153))

(assert (= (and b!97153 res!48973) b!97150))

(assert (= (and b!97150 res!48974) b!97152))

(assert (= (and b!97152 c!16456) b!97143))

(assert (= (and b!97152 (not c!16456)) b!97149))

(assert (= (and b!97152 res!48975) b!97140))

(assert (= (and b!97140 res!48970) b!97151))

(assert (= (and b!97145 condMapEmpty!3722) mapIsEmpty!3721))

(assert (= (and b!97145 (not condMapEmpty!3722)) mapNonEmpty!3721))

(get-info :version)

(assert (= (and mapNonEmpty!3721 ((_ is ValueCellFull!968) mapValue!3721)) b!97141))

(assert (= (and b!97145 ((_ is ValueCellFull!968) mapDefault!3722)) b!97146))

(assert (= b!97144 b!97145))

(assert (= b!97147 b!97144))

(assert (= b!97155 b!97147))

(assert (= start!11648 b!97155))

(assert (= (and b!97148 condMapEmpty!3721) mapIsEmpty!3722))

(assert (= (and b!97148 (not condMapEmpty!3721)) mapNonEmpty!3722))

(assert (= (and mapNonEmpty!3722 ((_ is ValueCellFull!968) mapValue!3722)) b!97154))

(assert (= (and b!97148 ((_ is ValueCellFull!968) mapDefault!3721)) b!97142))

(assert (= b!97157 b!97148))

(assert (= start!11648 b!97157))

(declare-fun b_lambda!4319 () Bool)

(assert (=> (not b_lambda!4319) (not b!97152)))

(declare-fun t!5492 () Bool)

(declare-fun tb!1901 () Bool)

(assert (=> (and b!97144 (= (defaultEntry!2477 (v!2796 (underlying!336 thiss!992))) (defaultEntry!2477 (v!2796 (underlying!336 thiss!992)))) t!5492) tb!1901))

(declare-fun result!3233 () Bool)

(assert (=> tb!1901 (= result!3233 tp_is_empty!2623)))

(assert (=> b!97152 t!5492))

(declare-fun b_and!5945 () Bool)

(assert (= b_and!5941 (and (=> t!5492 result!3233) b_and!5945)))

(declare-fun tb!1903 () Bool)

(declare-fun t!5494 () Bool)

(assert (=> (and b!97157 (= (defaultEntry!2477 newMap!16) (defaultEntry!2477 (v!2796 (underlying!336 thiss!992)))) t!5494) tb!1903))

(declare-fun result!3237 () Bool)

(assert (= result!3237 result!3233))

(assert (=> b!97152 t!5494))

(declare-fun b_and!5947 () Bool)

(assert (= b_and!5943 (and (=> t!5494 result!3237) b_and!5947)))

(declare-fun m!106113 () Bool)

(assert (=> b!97150 m!106113))

(declare-fun m!106115 () Bool)

(assert (=> b!97150 m!106115))

(declare-fun m!106117 () Bool)

(assert (=> b!97150 m!106117))

(declare-fun m!106119 () Bool)

(assert (=> mapNonEmpty!3722 m!106119))

(declare-fun m!106121 () Bool)

(assert (=> b!97144 m!106121))

(declare-fun m!106123 () Bool)

(assert (=> b!97144 m!106123))

(declare-fun m!106125 () Bool)

(assert (=> mapNonEmpty!3721 m!106125))

(declare-fun m!106127 () Bool)

(assert (=> b!97143 m!106127))

(declare-fun m!106129 () Bool)

(assert (=> b!97143 m!106129))

(assert (=> b!97143 m!106113))

(declare-fun m!106131 () Bool)

(assert (=> b!97143 m!106131))

(assert (=> b!97143 m!106113))

(assert (=> b!97143 m!106113))

(declare-fun m!106133 () Bool)

(assert (=> b!97143 m!106133))

(assert (=> b!97143 m!106113))

(declare-fun m!106135 () Bool)

(assert (=> b!97143 m!106135))

(declare-fun m!106137 () Bool)

(assert (=> start!11648 m!106137))

(declare-fun m!106139 () Bool)

(assert (=> b!97140 m!106139))

(declare-fun m!106141 () Bool)

(assert (=> b!97158 m!106141))

(declare-fun m!106143 () Bool)

(assert (=> b!97152 m!106143))

(declare-fun m!106145 () Bool)

(assert (=> b!97152 m!106145))

(declare-fun m!106147 () Bool)

(assert (=> b!97152 m!106147))

(assert (=> b!97152 m!106113))

(assert (=> b!97152 m!106145))

(assert (=> b!97152 m!106113))

(declare-fun m!106149 () Bool)

(assert (=> b!97152 m!106149))

(assert (=> b!97152 m!106113))

(assert (=> b!97152 m!106147))

(declare-fun m!106151 () Bool)

(assert (=> b!97152 m!106151))

(assert (=> b!97152 m!106143))

(declare-fun m!106153 () Bool)

(assert (=> b!97157 m!106153))

(declare-fun m!106155 () Bool)

(assert (=> b!97157 m!106155))

(check-sat b_and!5947 (not mapNonEmpty!3721) (not b!97140) (not b!97143) (not mapNonEmpty!3722) b_and!5945 (not b!97144) tp_is_empty!2623 (not b!97150) (not b_lambda!4319) (not start!11648) (not b_next!2413) (not b!97152) (not b!97157) (not b_next!2415) (not b!97158))
(check-sat b_and!5945 b_and!5947 (not b_next!2413) (not b_next!2415))
