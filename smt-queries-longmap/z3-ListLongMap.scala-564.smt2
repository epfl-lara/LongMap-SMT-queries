; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15264 () Bool)

(assert start!15264)

(declare-fun b!147336 () Bool)

(declare-fun b_free!3161 () Bool)

(declare-fun b_next!3161 () Bool)

(assert (=> b!147336 (= b_free!3161 (not b_next!3161))))

(declare-fun tp!11990 () Bool)

(declare-fun b_and!9259 () Bool)

(assert (=> b!147336 (= tp!11990 b_and!9259)))

(declare-fun b!147338 () Bool)

(declare-fun b_free!3163 () Bool)

(declare-fun b_next!3163 () Bool)

(assert (=> b!147338 (= b_free!3163 (not b_next!3163))))

(declare-fun tp!11989 () Bool)

(declare-fun b_and!9261 () Bool)

(assert (=> b!147338 (= tp!11989 b_and!9261)))

(declare-fun b!147331 () Bool)

(declare-fun e!96236 () Bool)

(declare-fun tp_is_empty!2997 () Bool)

(assert (=> b!147331 (= e!96236 tp_is_empty!2997)))

(declare-fun b!147332 () Bool)

(declare-datatypes ((Unit!4657 0))(
  ( (Unit!4658) )
))
(declare-fun e!96238 () Unit!4657)

(declare-fun Unit!4659 () Unit!4657)

(assert (=> b!147332 (= e!96238 Unit!4659)))

(declare-fun lt!77747 () Unit!4657)

(declare-datatypes ((V!3643 0))(
  ( (V!3644 (val!1543 Int)) )
))
(declare-datatypes ((array!5041 0))(
  ( (array!5042 (arr!2381 (Array (_ BitVec 32) (_ BitVec 64))) (size!2657 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1155 0))(
  ( (ValueCellFull!1155 (v!3377 V!3643)) (EmptyCell!1155) )
))
(declare-datatypes ((array!5043 0))(
  ( (array!5044 (arr!2382 (Array (_ BitVec 32) ValueCell!1155)) (size!2658 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1218 0))(
  ( (LongMapFixedSize!1219 (defaultEntry!3028 Int) (mask!7412 (_ BitVec 32)) (extraKeys!2773 (_ BitVec 32)) (zeroValue!2873 V!3643) (minValue!2873 V!3643) (_size!658 (_ BitVec 32)) (_keys!4797 array!5041) (_values!3011 array!5043) (_vacant!658 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1000 0))(
  ( (Cell!1001 (v!3378 LongMapFixedSize!1218)) )
))
(declare-datatypes ((LongMap!1000 0))(
  ( (LongMap!1001 (underlying!511 Cell!1000)) )
))
(declare-fun thiss!992 () LongMap!1000)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!158 (array!5041 array!5043 (_ BitVec 32) (_ BitVec 32) V!3643 V!3643 (_ BitVec 64) (_ BitVec 32) Int) Unit!4657)

(assert (=> b!147332 (= lt!77747 (lemmaListMapContainsThenArrayContainsFrom!158 (_keys!4797 (v!3378 (underlying!511 thiss!992))) (_values!3011 (v!3378 (underlying!511 thiss!992))) (mask!7412 (v!3378 (underlying!511 thiss!992))) (extraKeys!2773 (v!3378 (underlying!511 thiss!992))) (zeroValue!2873 (v!3378 (underlying!511 thiss!992))) (minValue!2873 (v!3378 (underlying!511 thiss!992))) (select (arr!2381 (_keys!4797 (v!3378 (underlying!511 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3028 (v!3378 (underlying!511 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!5041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147332 (arrayContainsKey!0 (_keys!4797 (v!3378 (underlying!511 thiss!992))) (select (arr!2381 (_keys!4797 (v!3378 (underlying!511 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!77753 () Unit!4657)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5041 (_ BitVec 32) (_ BitVec 32)) Unit!4657)

(assert (=> b!147332 (= lt!77753 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4797 (v!3378 (underlying!511 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1790 0))(
  ( (Nil!1787) (Cons!1786 (h!2394 (_ BitVec 64)) (t!6535 List!1790)) )
))
(declare-fun arrayNoDuplicates!0 (array!5041 (_ BitVec 32) List!1790) Bool)

(assert (=> b!147332 (arrayNoDuplicates!0 (_keys!4797 (v!3378 (underlying!511 thiss!992))) from!355 Nil!1787)))

(declare-fun lt!77746 () Unit!4657)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5041 (_ BitVec 32) (_ BitVec 64) List!1790) Unit!4657)

(assert (=> b!147332 (= lt!77746 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4797 (v!3378 (underlying!511 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2381 (_keys!4797 (v!3378 (underlying!511 thiss!992)))) from!355) (Cons!1786 (select (arr!2381 (_keys!4797 (v!3378 (underlying!511 thiss!992)))) from!355) Nil!1787)))))

(assert (=> b!147332 false))

(declare-fun b!147333 () Bool)

(declare-fun e!96233 () Bool)

(assert (=> b!147333 (= e!96233 tp_is_empty!2997)))

(declare-fun b!147334 () Bool)

(declare-fun res!70012 () Bool)

(declare-fun e!96231 () Bool)

(assert (=> b!147334 (=> (not res!70012) (not e!96231))))

(declare-fun newMap!16 () LongMapFixedSize!1218)

(declare-fun valid!596 (LongMapFixedSize!1218) Bool)

(assert (=> b!147334 (= res!70012 (valid!596 newMap!16))))

(declare-fun b!147335 () Bool)

(declare-fun e!96235 () Bool)

(assert (=> b!147335 (= e!96235 tp_is_empty!2997)))

(declare-fun e!96245 () Bool)

(declare-fun e!96241 () Bool)

(declare-fun array_inv!1497 (array!5041) Bool)

(declare-fun array_inv!1498 (array!5043) Bool)

(assert (=> b!147336 (= e!96241 (and tp!11990 tp_is_empty!2997 (array_inv!1497 (_keys!4797 (v!3378 (underlying!511 thiss!992)))) (array_inv!1498 (_values!3011 (v!3378 (underlying!511 thiss!992)))) e!96245))))

(declare-fun mapNonEmpty!5067 () Bool)

(declare-fun mapRes!5067 () Bool)

(declare-fun tp!11992 () Bool)

(assert (=> mapNonEmpty!5067 (= mapRes!5067 (and tp!11992 e!96233))))

(declare-fun mapRest!5067 () (Array (_ BitVec 32) ValueCell!1155))

(declare-fun mapKey!5067 () (_ BitVec 32))

(declare-fun mapValue!5068 () ValueCell!1155)

(assert (=> mapNonEmpty!5067 (= (arr!2382 (_values!3011 (v!3378 (underlying!511 thiss!992)))) (store mapRest!5067 mapKey!5067 mapValue!5068))))

(declare-fun b!147337 () Bool)

(declare-fun e!96240 () Bool)

(declare-fun e!96230 () Bool)

(assert (=> b!147337 (= e!96240 e!96230)))

(declare-fun e!96239 () Bool)

(declare-fun e!96237 () Bool)

(assert (=> b!147338 (= e!96237 (and tp!11989 tp_is_empty!2997 (array_inv!1497 (_keys!4797 newMap!16)) (array_inv!1498 (_values!3011 newMap!16)) e!96239))))

(declare-fun b!147339 () Bool)

(declare-fun res!70016 () Bool)

(assert (=> b!147339 (=> (not res!70016) (not e!96231))))

(assert (=> b!147339 (= res!70016 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2657 (_keys!4797 (v!3378 (underlying!511 thiss!992)))))))))

(declare-fun b!147340 () Bool)

(declare-fun Unit!4660 () Unit!4657)

(assert (=> b!147340 (= e!96238 Unit!4660)))

(declare-fun b!147341 () Bool)

(declare-fun res!70014 () Bool)

(assert (=> b!147341 (=> (not res!70014) (not e!96231))))

(assert (=> b!147341 (= res!70014 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7412 newMap!16)) (_size!658 (v!3378 (underlying!511 thiss!992)))))))

(declare-fun b!147342 () Bool)

(declare-fun e!96242 () Bool)

(assert (=> b!147342 (= e!96231 e!96242)))

(declare-fun res!70013 () Bool)

(assert (=> b!147342 (=> (not res!70013) (not e!96242))))

(declare-datatypes ((tuple2!2788 0))(
  ( (tuple2!2789 (_1!1405 (_ BitVec 64)) (_2!1405 V!3643)) )
))
(declare-datatypes ((List!1791 0))(
  ( (Nil!1788) (Cons!1787 (h!2395 tuple2!2788) (t!6536 List!1791)) )
))
(declare-datatypes ((ListLongMap!1793 0))(
  ( (ListLongMap!1794 (toList!912 List!1791)) )
))
(declare-fun lt!77751 () ListLongMap!1793)

(declare-fun lt!77745 () ListLongMap!1793)

(assert (=> b!147342 (= res!70013 (= lt!77751 lt!77745))))

(declare-fun map!1484 (LongMapFixedSize!1218) ListLongMap!1793)

(assert (=> b!147342 (= lt!77745 (map!1484 newMap!16))))

(declare-fun getCurrentListMap!580 (array!5041 array!5043 (_ BitVec 32) (_ BitVec 32) V!3643 V!3643 (_ BitVec 32) Int) ListLongMap!1793)

(assert (=> b!147342 (= lt!77751 (getCurrentListMap!580 (_keys!4797 (v!3378 (underlying!511 thiss!992))) (_values!3011 (v!3378 (underlying!511 thiss!992))) (mask!7412 (v!3378 (underlying!511 thiss!992))) (extraKeys!2773 (v!3378 (underlying!511 thiss!992))) (zeroValue!2873 (v!3378 (underlying!511 thiss!992))) (minValue!2873 (v!3378 (underlying!511 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3028 (v!3378 (underlying!511 thiss!992)))))))

(declare-fun b!147343 () Bool)

(declare-fun mapRes!5068 () Bool)

(assert (=> b!147343 (= e!96239 (and e!96235 mapRes!5068))))

(declare-fun condMapEmpty!5067 () Bool)

(declare-fun mapDefault!5068 () ValueCell!1155)

(assert (=> b!147343 (= condMapEmpty!5067 (= (arr!2382 (_values!3011 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1155)) mapDefault!5068)))))

(declare-fun mapNonEmpty!5068 () Bool)

(declare-fun tp!11991 () Bool)

(declare-fun e!96229 () Bool)

(assert (=> mapNonEmpty!5068 (= mapRes!5068 (and tp!11991 e!96229))))

(declare-fun mapRest!5068 () (Array (_ BitVec 32) ValueCell!1155))

(declare-fun mapValue!5067 () ValueCell!1155)

(declare-fun mapKey!5068 () (_ BitVec 32))

(assert (=> mapNonEmpty!5068 (= (arr!2382 (_values!3011 newMap!16)) (store mapRest!5068 mapKey!5068 mapValue!5067))))

(declare-fun b!147344 () Bool)

(declare-fun e!96244 () Bool)

(assert (=> b!147344 (= e!96244 (not true))))

(declare-fun lt!77749 () ListLongMap!1793)

(declare-fun lt!77752 () tuple2!2788)

(declare-fun lt!77755 () tuple2!2788)

(declare-fun +!188 (ListLongMap!1793 tuple2!2788) ListLongMap!1793)

(assert (=> b!147344 (= (+!188 (+!188 lt!77749 lt!77752) lt!77755) (+!188 (+!188 lt!77749 lt!77755) lt!77752))))

(assert (=> b!147344 (= lt!77755 (tuple2!2789 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2873 (v!3378 (underlying!511 thiss!992)))))))

(declare-fun lt!77750 () V!3643)

(assert (=> b!147344 (= lt!77752 (tuple2!2789 (select (arr!2381 (_keys!4797 (v!3378 (underlying!511 thiss!992)))) from!355) lt!77750))))

(declare-fun lt!77748 () Unit!4657)

(declare-fun addCommutativeForDiffKeys!81 (ListLongMap!1793 (_ BitVec 64) V!3643 (_ BitVec 64) V!3643) Unit!4657)

(assert (=> b!147344 (= lt!77748 (addCommutativeForDiffKeys!81 lt!77749 (select (arr!2381 (_keys!4797 (v!3378 (underlying!511 thiss!992)))) from!355) lt!77750 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2873 (v!3378 (underlying!511 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!157 (array!5041 array!5043 (_ BitVec 32) (_ BitVec 32) V!3643 V!3643 (_ BitVec 32) Int) ListLongMap!1793)

(assert (=> b!147344 (= lt!77749 (getCurrentListMapNoExtraKeys!157 (_keys!4797 (v!3378 (underlying!511 thiss!992))) (_values!3011 (v!3378 (underlying!511 thiss!992))) (mask!7412 (v!3378 (underlying!511 thiss!992))) (extraKeys!2773 (v!3378 (underlying!511 thiss!992))) (zeroValue!2873 (v!3378 (underlying!511 thiss!992))) (minValue!2873 (v!3378 (underlying!511 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3028 (v!3378 (underlying!511 thiss!992)))))))

(declare-fun mapIsEmpty!5067 () Bool)

(assert (=> mapIsEmpty!5067 mapRes!5067))

(declare-fun res!70011 () Bool)

(assert (=> start!15264 (=> (not res!70011) (not e!96231))))

(declare-fun valid!597 (LongMap!1000) Bool)

(assert (=> start!15264 (= res!70011 (valid!597 thiss!992))))

(assert (=> start!15264 e!96231))

(assert (=> start!15264 e!96240))

(assert (=> start!15264 true))

(assert (=> start!15264 e!96237))

(declare-fun mapIsEmpty!5068 () Bool)

(assert (=> mapIsEmpty!5068 mapRes!5068))

(declare-fun b!147345 () Bool)

(declare-fun e!96232 () Bool)

(assert (=> b!147345 (= e!96232 e!96244)))

(declare-fun res!70015 () Bool)

(assert (=> b!147345 (=> (not res!70015) (not e!96244))))

(declare-datatypes ((tuple2!2790 0))(
  ( (tuple2!2791 (_1!1406 Bool) (_2!1406 LongMapFixedSize!1218)) )
))
(declare-fun lt!77754 () tuple2!2790)

(assert (=> b!147345 (= res!70015 (and (_1!1406 lt!77754) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!77744 () Unit!4657)

(assert (=> b!147345 (= lt!77744 e!96238)))

(declare-fun c!27767 () Bool)

(declare-fun contains!958 (ListLongMap!1793 (_ BitVec 64)) Bool)

(assert (=> b!147345 (= c!27767 (contains!958 lt!77745 (select (arr!2381 (_keys!4797 (v!3378 (underlying!511 thiss!992)))) from!355)))))

(declare-fun update!231 (LongMapFixedSize!1218 (_ BitVec 64) V!3643) tuple2!2790)

(assert (=> b!147345 (= lt!77754 (update!231 newMap!16 (select (arr!2381 (_keys!4797 (v!3378 (underlying!511 thiss!992)))) from!355) lt!77750))))

(declare-fun b!147346 () Bool)

(assert (=> b!147346 (= e!96230 e!96241)))

(declare-fun b!147347 () Bool)

(assert (=> b!147347 (= e!96229 tp_is_empty!2997)))

(declare-fun b!147348 () Bool)

(assert (=> b!147348 (= e!96245 (and e!96236 mapRes!5067))))

(declare-fun condMapEmpty!5068 () Bool)

(declare-fun mapDefault!5067 () ValueCell!1155)

(assert (=> b!147348 (= condMapEmpty!5068 (= (arr!2382 (_values!3011 (v!3378 (underlying!511 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1155)) mapDefault!5067)))))

(declare-fun b!147349 () Bool)

(assert (=> b!147349 (= e!96242 e!96232)))

(declare-fun res!70017 () Bool)

(assert (=> b!147349 (=> (not res!70017) (not e!96232))))

(assert (=> b!147349 (= res!70017 (and (not (= (select (arr!2381 (_keys!4797 (v!3378 (underlying!511 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2381 (_keys!4797 (v!3378 (underlying!511 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1588 (ValueCell!1155 V!3643) V!3643)

(declare-fun dynLambda!464 (Int (_ BitVec 64)) V!3643)

(assert (=> b!147349 (= lt!77750 (get!1588 (select (arr!2382 (_values!3011 (v!3378 (underlying!511 thiss!992)))) from!355) (dynLambda!464 (defaultEntry!3028 (v!3378 (underlying!511 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!15264 res!70011) b!147339))

(assert (= (and b!147339 res!70016) b!147334))

(assert (= (and b!147334 res!70012) b!147341))

(assert (= (and b!147341 res!70014) b!147342))

(assert (= (and b!147342 res!70013) b!147349))

(assert (= (and b!147349 res!70017) b!147345))

(assert (= (and b!147345 c!27767) b!147332))

(assert (= (and b!147345 (not c!27767)) b!147340))

(assert (= (and b!147345 res!70015) b!147344))

(assert (= (and b!147348 condMapEmpty!5068) mapIsEmpty!5067))

(assert (= (and b!147348 (not condMapEmpty!5068)) mapNonEmpty!5067))

(get-info :version)

(assert (= (and mapNonEmpty!5067 ((_ is ValueCellFull!1155) mapValue!5068)) b!147333))

(assert (= (and b!147348 ((_ is ValueCellFull!1155) mapDefault!5067)) b!147331))

(assert (= b!147336 b!147348))

(assert (= b!147346 b!147336))

(assert (= b!147337 b!147346))

(assert (= start!15264 b!147337))

(assert (= (and b!147343 condMapEmpty!5067) mapIsEmpty!5068))

(assert (= (and b!147343 (not condMapEmpty!5067)) mapNonEmpty!5068))

(assert (= (and mapNonEmpty!5068 ((_ is ValueCellFull!1155) mapValue!5067)) b!147347))

(assert (= (and b!147343 ((_ is ValueCellFull!1155) mapDefault!5068)) b!147335))

(assert (= b!147338 b!147343))

(assert (= start!15264 b!147338))

(declare-fun b_lambda!6595 () Bool)

(assert (=> (not b_lambda!6595) (not b!147349)))

(declare-fun t!6532 () Bool)

(declare-fun tb!2705 () Bool)

(assert (=> (and b!147336 (= (defaultEntry!3028 (v!3378 (underlying!511 thiss!992))) (defaultEntry!3028 (v!3378 (underlying!511 thiss!992)))) t!6532) tb!2705))

(declare-fun result!4415 () Bool)

(assert (=> tb!2705 (= result!4415 tp_is_empty!2997)))

(assert (=> b!147349 t!6532))

(declare-fun b_and!9263 () Bool)

(assert (= b_and!9259 (and (=> t!6532 result!4415) b_and!9263)))

(declare-fun tb!2707 () Bool)

(declare-fun t!6534 () Bool)

(assert (=> (and b!147338 (= (defaultEntry!3028 newMap!16) (defaultEntry!3028 (v!3378 (underlying!511 thiss!992)))) t!6534) tb!2707))

(declare-fun result!4419 () Bool)

(assert (= result!4419 result!4415))

(assert (=> b!147349 t!6534))

(declare-fun b_and!9265 () Bool)

(assert (= b_and!9261 (and (=> t!6534 result!4419) b_and!9265)))

(declare-fun m!177115 () Bool)

(assert (=> b!147338 m!177115))

(declare-fun m!177117 () Bool)

(assert (=> b!147338 m!177117))

(declare-fun m!177119 () Bool)

(assert (=> b!147334 m!177119))

(declare-fun m!177121 () Bool)

(assert (=> b!147349 m!177121))

(declare-fun m!177123 () Bool)

(assert (=> b!147349 m!177123))

(declare-fun m!177125 () Bool)

(assert (=> b!147349 m!177125))

(assert (=> b!147349 m!177123))

(assert (=> b!147349 m!177125))

(declare-fun m!177127 () Bool)

(assert (=> b!147349 m!177127))

(declare-fun m!177129 () Bool)

(assert (=> mapNonEmpty!5067 m!177129))

(declare-fun m!177131 () Bool)

(assert (=> b!147336 m!177131))

(declare-fun m!177133 () Bool)

(assert (=> b!147336 m!177133))

(declare-fun m!177135 () Bool)

(assert (=> mapNonEmpty!5068 m!177135))

(declare-fun m!177137 () Bool)

(assert (=> start!15264 m!177137))

(assert (=> b!147345 m!177121))

(assert (=> b!147345 m!177121))

(declare-fun m!177139 () Bool)

(assert (=> b!147345 m!177139))

(assert (=> b!147345 m!177121))

(declare-fun m!177141 () Bool)

(assert (=> b!147345 m!177141))

(declare-fun m!177143 () Bool)

(assert (=> b!147332 m!177143))

(declare-fun m!177145 () Bool)

(assert (=> b!147332 m!177145))

(assert (=> b!147332 m!177121))

(declare-fun m!177147 () Bool)

(assert (=> b!147332 m!177147))

(assert (=> b!147332 m!177121))

(assert (=> b!147332 m!177121))

(declare-fun m!177149 () Bool)

(assert (=> b!147332 m!177149))

(assert (=> b!147332 m!177121))

(declare-fun m!177151 () Bool)

(assert (=> b!147332 m!177151))

(declare-fun m!177153 () Bool)

(assert (=> b!147344 m!177153))

(declare-fun m!177155 () Bool)

(assert (=> b!147344 m!177155))

(declare-fun m!177157 () Bool)

(assert (=> b!147344 m!177157))

(declare-fun m!177159 () Bool)

(assert (=> b!147344 m!177159))

(assert (=> b!147344 m!177157))

(assert (=> b!147344 m!177153))

(declare-fun m!177161 () Bool)

(assert (=> b!147344 m!177161))

(assert (=> b!147344 m!177121))

(assert (=> b!147344 m!177121))

(declare-fun m!177163 () Bool)

(assert (=> b!147344 m!177163))

(declare-fun m!177165 () Bool)

(assert (=> b!147342 m!177165))

(declare-fun m!177167 () Bool)

(assert (=> b!147342 m!177167))

(check-sat (not b!147334) (not mapNonEmpty!5068) (not b!147332) b_and!9263 (not mapNonEmpty!5067) (not b_lambda!6595) (not b!147338) (not b!147336) tp_is_empty!2997 b_and!9265 (not b!147344) (not start!15264) (not b_next!3163) (not b_next!3161) (not b!147345) (not b!147349) (not b!147342))
(check-sat b_and!9263 b_and!9265 (not b_next!3161) (not b_next!3163))
