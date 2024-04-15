; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16774 () Bool)

(assert start!16774)

(declare-fun b!168597 () Bool)

(declare-fun b_free!4075 () Bool)

(declare-fun b_next!4075 () Bool)

(assert (=> b!168597 (= b_free!4075 (not b_next!4075))))

(declare-fun tp!14825 () Bool)

(declare-fun b_and!10463 () Bool)

(assert (=> b!168597 (= tp!14825 b_and!10463)))

(declare-fun b!168596 () Bool)

(declare-datatypes ((Unit!5185 0))(
  ( (Unit!5186) )
))
(declare-fun e!110884 () Unit!5185)

(declare-fun Unit!5187 () Unit!5185)

(assert (=> b!168596 (= e!110884 Unit!5187)))

(declare-fun lt!84276 () Unit!5185)

(declare-datatypes ((V!4817 0))(
  ( (V!4818 (val!1983 Int)) )
))
(declare-datatypes ((ValueCell!1595 0))(
  ( (ValueCellFull!1595 (v!3842 V!4817)) (EmptyCell!1595) )
))
(declare-datatypes ((array!6831 0))(
  ( (array!6832 (arr!3250 (Array (_ BitVec 32) (_ BitVec 64))) (size!3539 (_ BitVec 32))) )
))
(declare-datatypes ((array!6833 0))(
  ( (array!6834 (arr!3251 (Array (_ BitVec 32) ValueCell!1595)) (size!3540 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2098 0))(
  ( (LongMapFixedSize!2099 (defaultEntry!3491 Int) (mask!8261 (_ BitVec 32)) (extraKeys!3232 (_ BitVec 32)) (zeroValue!3334 V!4817) (minValue!3334 V!4817) (_size!1098 (_ BitVec 32)) (_keys!5315 array!6831) (_values!3474 array!6833) (_vacant!1098 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2098)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!127 (array!6831 array!6833 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 64) Int) Unit!5185)

(assert (=> b!168596 (= lt!84276 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!127 (_keys!5315 thiss!1248) (_values!3474 thiss!1248) (mask!8261 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) key!828 (defaultEntry!3491 thiss!1248)))))

(assert (=> b!168596 false))

(declare-fun tp_is_empty!3877 () Bool)

(declare-fun e!110887 () Bool)

(declare-fun e!110886 () Bool)

(declare-fun array_inv!2087 (array!6831) Bool)

(declare-fun array_inv!2088 (array!6833) Bool)

(assert (=> b!168597 (= e!110886 (and tp!14825 tp_is_empty!3877 (array_inv!2087 (_keys!5315 thiss!1248)) (array_inv!2088 (_values!3474 thiss!1248)) e!110887))))

(declare-fun b!168598 () Bool)

(declare-fun e!110881 () Bool)

(assert (=> b!168598 (= e!110881 tp_is_empty!3877)))

(declare-fun b!168599 () Bool)

(declare-fun e!110880 () Bool)

(declare-fun e!110888 () Bool)

(assert (=> b!168599 (= e!110880 e!110888)))

(declare-fun res!80232 () Bool)

(assert (=> b!168599 (=> (not res!80232) (not e!110888))))

(declare-datatypes ((SeekEntryResult!521 0))(
  ( (MissingZero!521 (index!4252 (_ BitVec 32))) (Found!521 (index!4253 (_ BitVec 32))) (Intermediate!521 (undefined!1333 Bool) (index!4254 (_ BitVec 32)) (x!18660 (_ BitVec 32))) (Undefined!521) (MissingVacant!521 (index!4255 (_ BitVec 32))) )
))
(declare-fun lt!84281 () SeekEntryResult!521)

(get-info :version)

(assert (=> b!168599 (= res!80232 (and (not ((_ is Undefined!521) lt!84281)) (not ((_ is MissingVacant!521) lt!84281)) (not ((_ is MissingZero!521) lt!84281)) ((_ is Found!521) lt!84281)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6831 (_ BitVec 32)) SeekEntryResult!521)

(assert (=> b!168599 (= lt!84281 (seekEntryOrOpen!0 key!828 (_keys!5315 thiss!1248) (mask!8261 thiss!1248)))))

(declare-fun res!80236 () Bool)

(assert (=> start!16774 (=> (not res!80236) (not e!110880))))

(declare-fun valid!922 (LongMapFixedSize!2098) Bool)

(assert (=> start!16774 (= res!80236 (valid!922 thiss!1248))))

(assert (=> start!16774 e!110880))

(assert (=> start!16774 e!110886))

(assert (=> start!16774 true))

(assert (=> start!16774 tp_is_empty!3877))

(declare-fun b!168600 () Bool)

(declare-fun lt!84273 () Unit!5185)

(assert (=> b!168600 (= e!110884 lt!84273)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!128 (array!6831 array!6833 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 64) Int) Unit!5185)

(assert (=> b!168600 (= lt!84273 (lemmaInListMapThenSeekEntryOrOpenFindsIt!128 (_keys!5315 thiss!1248) (_values!3474 thiss!1248) (mask!8261 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) key!828 (defaultEntry!3491 thiss!1248)))))

(declare-fun res!80233 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168600 (= res!80233 (inRange!0 (index!4253 lt!84281) (mask!8261 thiss!1248)))))

(declare-fun e!110889 () Bool)

(assert (=> b!168600 (=> (not res!80233) (not e!110889))))

(assert (=> b!168600 e!110889))

(declare-fun b!168601 () Bool)

(assert (=> b!168601 (= e!110889 (= (select (arr!3250 (_keys!5315 thiss!1248)) (index!4253 lt!84281)) key!828))))

(declare-fun mapNonEmpty!6534 () Bool)

(declare-fun mapRes!6534 () Bool)

(declare-fun tp!14826 () Bool)

(assert (=> mapNonEmpty!6534 (= mapRes!6534 (and tp!14826 e!110881))))

(declare-fun mapValue!6534 () ValueCell!1595)

(declare-fun mapKey!6534 () (_ BitVec 32))

(declare-fun mapRest!6534 () (Array (_ BitVec 32) ValueCell!1595))

(assert (=> mapNonEmpty!6534 (= (arr!3251 (_values!3474 thiss!1248)) (store mapRest!6534 mapKey!6534 mapValue!6534))))

(declare-fun b!168602 () Bool)

(declare-fun e!110883 () Bool)

(assert (=> b!168602 (= e!110883 tp_is_empty!3877)))

(declare-fun b!168603 () Bool)

(assert (=> b!168603 (= e!110887 (and e!110883 mapRes!6534))))

(declare-fun condMapEmpty!6534 () Bool)

(declare-fun mapDefault!6534 () ValueCell!1595)

(assert (=> b!168603 (= condMapEmpty!6534 (= (arr!3251 (_values!3474 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1595)) mapDefault!6534)))))

(declare-fun b!168604 () Bool)

(declare-fun e!110882 () Bool)

(assert (=> b!168604 (= e!110888 (not e!110882))))

(declare-fun res!80234 () Bool)

(assert (=> b!168604 (=> res!80234 e!110882)))

(declare-fun lt!84280 () LongMapFixedSize!2098)

(assert (=> b!168604 (= res!80234 (not (valid!922 lt!84280)))))

(declare-datatypes ((tuple2!3182 0))(
  ( (tuple2!3183 (_1!1602 (_ BitVec 64)) (_2!1602 V!4817)) )
))
(declare-datatypes ((List!2181 0))(
  ( (Nil!2178) (Cons!2177 (h!2794 tuple2!3182) (t!6974 List!2181)) )
))
(declare-datatypes ((ListLongMap!2125 0))(
  ( (ListLongMap!2126 (toList!1078 List!2181)) )
))
(declare-fun lt!84278 () ListLongMap!2125)

(declare-fun contains!1123 (ListLongMap!2125 (_ BitVec 64)) Bool)

(assert (=> b!168604 (contains!1123 lt!84278 (select (arr!3250 (_keys!5315 thiss!1248)) (index!4253 lt!84281)))))

(declare-fun lt!84282 () Unit!5185)

(declare-fun lt!84271 () array!6833)

(declare-fun lemmaValidKeyInArrayIsInListMap!132 (array!6831 array!6833 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 32) Int) Unit!5185)

(assert (=> b!168604 (= lt!84282 (lemmaValidKeyInArrayIsInListMap!132 (_keys!5315 thiss!1248) lt!84271 (mask!8261 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) (index!4253 lt!84281) (defaultEntry!3491 thiss!1248)))))

(assert (=> b!168604 (= lt!84280 (LongMapFixedSize!2099 (defaultEntry!3491 thiss!1248) (mask!8261 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) (_size!1098 thiss!1248) (_keys!5315 thiss!1248) lt!84271 (_vacant!1098 thiss!1248)))))

(declare-fun lt!84279 () ListLongMap!2125)

(assert (=> b!168604 (= lt!84279 lt!84278)))

(declare-fun getCurrentListMap!720 (array!6831 array!6833 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 32) Int) ListLongMap!2125)

(assert (=> b!168604 (= lt!84278 (getCurrentListMap!720 (_keys!5315 thiss!1248) lt!84271 (mask!8261 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3491 thiss!1248)))))

(declare-fun v!309 () V!4817)

(declare-fun lt!84272 () ListLongMap!2125)

(declare-fun +!229 (ListLongMap!2125 tuple2!3182) ListLongMap!2125)

(assert (=> b!168604 (= lt!84279 (+!229 lt!84272 (tuple2!3183 key!828 v!309)))))

(assert (=> b!168604 (= lt!84271 (array!6834 (store (arr!3251 (_values!3474 thiss!1248)) (index!4253 lt!84281) (ValueCellFull!1595 v!309)) (size!3540 (_values!3474 thiss!1248))))))

(declare-fun lt!84274 () Unit!5185)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!101 (array!6831 array!6833 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 32) (_ BitVec 64) V!4817 Int) Unit!5185)

(assert (=> b!168604 (= lt!84274 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!101 (_keys!5315 thiss!1248) (_values!3474 thiss!1248) (mask!8261 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) (index!4253 lt!84281) key!828 v!309 (defaultEntry!3491 thiss!1248)))))

(declare-fun lt!84277 () Unit!5185)

(assert (=> b!168604 (= lt!84277 e!110884)))

(declare-fun c!30368 () Bool)

(assert (=> b!168604 (= c!30368 (contains!1123 lt!84272 key!828))))

(assert (=> b!168604 (= lt!84272 (getCurrentListMap!720 (_keys!5315 thiss!1248) (_values!3474 thiss!1248) (mask!8261 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3491 thiss!1248)))))

(declare-fun mapIsEmpty!6534 () Bool)

(assert (=> mapIsEmpty!6534 mapRes!6534))

(declare-fun b!168605 () Bool)

(declare-fun res!80235 () Bool)

(assert (=> b!168605 (=> (not res!80235) (not e!110880))))

(assert (=> b!168605 (= res!80235 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168606 () Bool)

(assert (=> b!168606 (= e!110882 true)))

(declare-fun lt!84275 () Bool)

(declare-fun map!1786 (LongMapFixedSize!2098) ListLongMap!2125)

(assert (=> b!168606 (= lt!84275 (contains!1123 (map!1786 lt!84280) key!828))))

(assert (= (and start!16774 res!80236) b!168605))

(assert (= (and b!168605 res!80235) b!168599))

(assert (= (and b!168599 res!80232) b!168604))

(assert (= (and b!168604 c!30368) b!168600))

(assert (= (and b!168604 (not c!30368)) b!168596))

(assert (= (and b!168600 res!80233) b!168601))

(assert (= (and b!168604 (not res!80234)) b!168606))

(assert (= (and b!168603 condMapEmpty!6534) mapIsEmpty!6534))

(assert (= (and b!168603 (not condMapEmpty!6534)) mapNonEmpty!6534))

(assert (= (and mapNonEmpty!6534 ((_ is ValueCellFull!1595) mapValue!6534)) b!168598))

(assert (= (and b!168603 ((_ is ValueCellFull!1595) mapDefault!6534)) b!168602))

(assert (= b!168597 b!168603))

(assert (= start!16774 b!168597))

(declare-fun m!197203 () Bool)

(assert (=> mapNonEmpty!6534 m!197203))

(declare-fun m!197205 () Bool)

(assert (=> b!168600 m!197205))

(declare-fun m!197207 () Bool)

(assert (=> b!168600 m!197207))

(declare-fun m!197209 () Bool)

(assert (=> b!168604 m!197209))

(declare-fun m!197211 () Bool)

(assert (=> b!168604 m!197211))

(declare-fun m!197213 () Bool)

(assert (=> b!168604 m!197213))

(declare-fun m!197215 () Bool)

(assert (=> b!168604 m!197215))

(declare-fun m!197217 () Bool)

(assert (=> b!168604 m!197217))

(declare-fun m!197219 () Bool)

(assert (=> b!168604 m!197219))

(declare-fun m!197221 () Bool)

(assert (=> b!168604 m!197221))

(declare-fun m!197223 () Bool)

(assert (=> b!168604 m!197223))

(assert (=> b!168604 m!197213))

(declare-fun m!197225 () Bool)

(assert (=> b!168604 m!197225))

(declare-fun m!197227 () Bool)

(assert (=> b!168604 m!197227))

(declare-fun m!197229 () Bool)

(assert (=> b!168599 m!197229))

(declare-fun m!197231 () Bool)

(assert (=> b!168606 m!197231))

(assert (=> b!168606 m!197231))

(declare-fun m!197233 () Bool)

(assert (=> b!168606 m!197233))

(assert (=> b!168601 m!197213))

(declare-fun m!197235 () Bool)

(assert (=> b!168597 m!197235))

(declare-fun m!197237 () Bool)

(assert (=> b!168597 m!197237))

(declare-fun m!197239 () Bool)

(assert (=> b!168596 m!197239))

(declare-fun m!197241 () Bool)

(assert (=> start!16774 m!197241))

(check-sat (not b!168596) tp_is_empty!3877 (not b!168597) (not b!168604) (not start!16774) (not b!168600) b_and!10463 (not b!168599) (not mapNonEmpty!6534) (not b!168606) (not b_next!4075))
(check-sat b_and!10463 (not b_next!4075))
