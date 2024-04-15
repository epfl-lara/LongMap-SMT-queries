; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16726 () Bool)

(assert start!16726)

(declare-fun b!167702 () Bool)

(declare-fun b_free!4027 () Bool)

(declare-fun b_next!4027 () Bool)

(assert (=> b!167702 (= b_free!4027 (not b_next!4027))))

(declare-fun tp!14682 () Bool)

(declare-fun b_and!10415 () Bool)

(assert (=> b!167702 (= tp!14682 b_and!10415)))

(declare-fun b!167691 () Bool)

(declare-fun e!110170 () Bool)

(declare-fun e!110172 () Bool)

(declare-fun mapRes!6462 () Bool)

(assert (=> b!167691 (= e!110170 (and e!110172 mapRes!6462))))

(declare-fun condMapEmpty!6462 () Bool)

(declare-datatypes ((V!4753 0))(
  ( (V!4754 (val!1959 Int)) )
))
(declare-datatypes ((ValueCell!1571 0))(
  ( (ValueCellFull!1571 (v!3818 V!4753)) (EmptyCell!1571) )
))
(declare-datatypes ((array!6735 0))(
  ( (array!6736 (arr!3202 (Array (_ BitVec 32) (_ BitVec 64))) (size!3491 (_ BitVec 32))) )
))
(declare-datatypes ((array!6737 0))(
  ( (array!6738 (arr!3203 (Array (_ BitVec 32) ValueCell!1571)) (size!3492 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2050 0))(
  ( (LongMapFixedSize!2051 (defaultEntry!3467 Int) (mask!8221 (_ BitVec 32)) (extraKeys!3208 (_ BitVec 32)) (zeroValue!3310 V!4753) (minValue!3310 V!4753) (_size!1074 (_ BitVec 32)) (_keys!5291 array!6735) (_values!3450 array!6737) (_vacant!1074 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2050)

(declare-fun mapDefault!6462 () ValueCell!1571)

(assert (=> b!167691 (= condMapEmpty!6462 (= (arr!3203 (_values!3450 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1571)) mapDefault!6462)))))

(declare-fun b!167693 () Bool)

(declare-fun res!79763 () Bool)

(declare-fun e!110171 () Bool)

(assert (=> b!167693 (=> (not res!79763) (not e!110171))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!167693 (= res!79763 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167694 () Bool)

(declare-fun e!110178 () Bool)

(declare-fun tp_is_empty!3829 () Bool)

(assert (=> b!167694 (= e!110178 tp_is_empty!3829)))

(declare-fun b!167695 () Bool)

(declare-fun e!110175 () Bool)

(assert (=> b!167695 (= e!110171 e!110175)))

(declare-fun res!79759 () Bool)

(assert (=> b!167695 (=> (not res!79759) (not e!110175))))

(declare-datatypes ((SeekEntryResult!497 0))(
  ( (MissingZero!497 (index!4156 (_ BitVec 32))) (Found!497 (index!4157 (_ BitVec 32))) (Intermediate!497 (undefined!1309 Bool) (index!4158 (_ BitVec 32)) (x!18572 (_ BitVec 32))) (Undefined!497) (MissingVacant!497 (index!4159 (_ BitVec 32))) )
))
(declare-fun lt!83723 () SeekEntryResult!497)

(get-info :version)

(assert (=> b!167695 (= res!79759 (and (not ((_ is Undefined!497) lt!83723)) (not ((_ is MissingVacant!497) lt!83723)) (not ((_ is MissingZero!497) lt!83723)) ((_ is Found!497) lt!83723)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6735 (_ BitVec 32)) SeekEntryResult!497)

(assert (=> b!167695 (= lt!83723 (seekEntryOrOpen!0 key!828 (_keys!5291 thiss!1248) (mask!8221 thiss!1248)))))

(declare-fun b!167696 () Bool)

(declare-fun res!79764 () Bool)

(declare-fun e!110177 () Bool)

(assert (=> b!167696 (=> res!79764 e!110177)))

(assert (=> b!167696 (= res!79764 (or (not (= (size!3492 (_values!3450 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8221 thiss!1248)))) (not (= (size!3491 (_keys!5291 thiss!1248)) (size!3492 (_values!3450 thiss!1248)))) (bvslt (mask!8221 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3208 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3208 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167697 () Bool)

(declare-datatypes ((Unit!5122 0))(
  ( (Unit!5123) )
))
(declare-fun e!110169 () Unit!5122)

(declare-fun Unit!5124 () Unit!5122)

(assert (=> b!167697 (= e!110169 Unit!5124)))

(declare-fun lt!83724 () Unit!5122)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!110 (array!6735 array!6737 (_ BitVec 32) (_ BitVec 32) V!4753 V!4753 (_ BitVec 64) Int) Unit!5122)

(assert (=> b!167697 (= lt!83724 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!110 (_keys!5291 thiss!1248) (_values!3450 thiss!1248) (mask!8221 thiss!1248) (extraKeys!3208 thiss!1248) (zeroValue!3310 thiss!1248) (minValue!3310 thiss!1248) key!828 (defaultEntry!3467 thiss!1248)))))

(assert (=> b!167697 false))

(declare-fun e!110173 () Bool)

(declare-fun b!167698 () Bool)

(assert (=> b!167698 (= e!110173 (= (select (arr!3202 (_keys!5291 thiss!1248)) (index!4157 lt!83723)) key!828))))

(declare-fun mapIsEmpty!6462 () Bool)

(assert (=> mapIsEmpty!6462 mapRes!6462))

(declare-fun mapNonEmpty!6462 () Bool)

(declare-fun tp!14681 () Bool)

(assert (=> mapNonEmpty!6462 (= mapRes!6462 (and tp!14681 e!110178))))

(declare-fun mapValue!6462 () ValueCell!1571)

(declare-fun mapKey!6462 () (_ BitVec 32))

(declare-fun mapRest!6462 () (Array (_ BitVec 32) ValueCell!1571))

(assert (=> mapNonEmpty!6462 (= (arr!3203 (_values!3450 thiss!1248)) (store mapRest!6462 mapKey!6462 mapValue!6462))))

(declare-fun b!167699 () Bool)

(assert (=> b!167699 (= e!110177 true)))

(declare-fun lt!83726 () Bool)

(declare-datatypes ((List!2144 0))(
  ( (Nil!2141) (Cons!2140 (h!2757 (_ BitVec 64)) (t!6937 List!2144)) )
))
(declare-fun arrayNoDuplicates!0 (array!6735 (_ BitVec 32) List!2144) Bool)

(assert (=> b!167699 (= lt!83726 (arrayNoDuplicates!0 (_keys!5291 thiss!1248) #b00000000000000000000000000000000 Nil!2141))))

(declare-fun res!79761 () Bool)

(assert (=> start!16726 (=> (not res!79761) (not e!110171))))

(declare-fun valid!904 (LongMapFixedSize!2050) Bool)

(assert (=> start!16726 (= res!79761 (valid!904 thiss!1248))))

(assert (=> start!16726 e!110171))

(declare-fun e!110176 () Bool)

(assert (=> start!16726 e!110176))

(assert (=> start!16726 true))

(assert (=> start!16726 tp_is_empty!3829))

(declare-fun b!167692 () Bool)

(assert (=> b!167692 (= e!110175 (not e!110177))))

(declare-fun res!79762 () Bool)

(assert (=> b!167692 (=> res!79762 e!110177)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167692 (= res!79762 (not (validMask!0 (mask!8221 thiss!1248))))))

(declare-fun v!309 () V!4753)

(declare-datatypes ((tuple2!3142 0))(
  ( (tuple2!3143 (_1!1582 (_ BitVec 64)) (_2!1582 V!4753)) )
))
(declare-datatypes ((List!2145 0))(
  ( (Nil!2142) (Cons!2141 (h!2758 tuple2!3142) (t!6938 List!2145)) )
))
(declare-datatypes ((ListLongMap!2085 0))(
  ( (ListLongMap!2086 (toList!1058 List!2145)) )
))
(declare-fun lt!83721 () ListLongMap!2085)

(declare-fun +!209 (ListLongMap!2085 tuple2!3142) ListLongMap!2085)

(declare-fun getCurrentListMap!700 (array!6735 array!6737 (_ BitVec 32) (_ BitVec 32) V!4753 V!4753 (_ BitVec 32) Int) ListLongMap!2085)

(assert (=> b!167692 (= (+!209 lt!83721 (tuple2!3143 key!828 v!309)) (getCurrentListMap!700 (_keys!5291 thiss!1248) (array!6738 (store (arr!3203 (_values!3450 thiss!1248)) (index!4157 lt!83723) (ValueCellFull!1571 v!309)) (size!3492 (_values!3450 thiss!1248))) (mask!8221 thiss!1248) (extraKeys!3208 thiss!1248) (zeroValue!3310 thiss!1248) (minValue!3310 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3467 thiss!1248)))))

(declare-fun lt!83727 () Unit!5122)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!81 (array!6735 array!6737 (_ BitVec 32) (_ BitVec 32) V!4753 V!4753 (_ BitVec 32) (_ BitVec 64) V!4753 Int) Unit!5122)

(assert (=> b!167692 (= lt!83727 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!81 (_keys!5291 thiss!1248) (_values!3450 thiss!1248) (mask!8221 thiss!1248) (extraKeys!3208 thiss!1248) (zeroValue!3310 thiss!1248) (minValue!3310 thiss!1248) (index!4157 lt!83723) key!828 v!309 (defaultEntry!3467 thiss!1248)))))

(declare-fun lt!83725 () Unit!5122)

(assert (=> b!167692 (= lt!83725 e!110169)))

(declare-fun c!30296 () Bool)

(declare-fun contains!1103 (ListLongMap!2085 (_ BitVec 64)) Bool)

(assert (=> b!167692 (= c!30296 (contains!1103 lt!83721 key!828))))

(assert (=> b!167692 (= lt!83721 (getCurrentListMap!700 (_keys!5291 thiss!1248) (_values!3450 thiss!1248) (mask!8221 thiss!1248) (extraKeys!3208 thiss!1248) (zeroValue!3310 thiss!1248) (minValue!3310 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3467 thiss!1248)))))

(declare-fun b!167700 () Bool)

(assert (=> b!167700 (= e!110172 tp_is_empty!3829)))

(declare-fun b!167701 () Bool)

(declare-fun res!79765 () Bool)

(assert (=> b!167701 (=> res!79765 e!110177)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6735 (_ BitVec 32)) Bool)

(assert (=> b!167701 (= res!79765 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5291 thiss!1248) (mask!8221 thiss!1248))))))

(declare-fun array_inv!2063 (array!6735) Bool)

(declare-fun array_inv!2064 (array!6737) Bool)

(assert (=> b!167702 (= e!110176 (and tp!14682 tp_is_empty!3829 (array_inv!2063 (_keys!5291 thiss!1248)) (array_inv!2064 (_values!3450 thiss!1248)) e!110170))))

(declare-fun b!167703 () Bool)

(declare-fun lt!83722 () Unit!5122)

(assert (=> b!167703 (= e!110169 lt!83722)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!108 (array!6735 array!6737 (_ BitVec 32) (_ BitVec 32) V!4753 V!4753 (_ BitVec 64) Int) Unit!5122)

(assert (=> b!167703 (= lt!83722 (lemmaInListMapThenSeekEntryOrOpenFindsIt!108 (_keys!5291 thiss!1248) (_values!3450 thiss!1248) (mask!8221 thiss!1248) (extraKeys!3208 thiss!1248) (zeroValue!3310 thiss!1248) (minValue!3310 thiss!1248) key!828 (defaultEntry!3467 thiss!1248)))))

(declare-fun res!79760 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167703 (= res!79760 (inRange!0 (index!4157 lt!83723) (mask!8221 thiss!1248)))))

(assert (=> b!167703 (=> (not res!79760) (not e!110173))))

(assert (=> b!167703 e!110173))

(assert (= (and start!16726 res!79761) b!167693))

(assert (= (and b!167693 res!79763) b!167695))

(assert (= (and b!167695 res!79759) b!167692))

(assert (= (and b!167692 c!30296) b!167703))

(assert (= (and b!167692 (not c!30296)) b!167697))

(assert (= (and b!167703 res!79760) b!167698))

(assert (= (and b!167692 (not res!79762)) b!167696))

(assert (= (and b!167696 (not res!79764)) b!167701))

(assert (= (and b!167701 (not res!79765)) b!167699))

(assert (= (and b!167691 condMapEmpty!6462) mapIsEmpty!6462))

(assert (= (and b!167691 (not condMapEmpty!6462)) mapNonEmpty!6462))

(assert (= (and mapNonEmpty!6462 ((_ is ValueCellFull!1571) mapValue!6462)) b!167694))

(assert (= (and b!167691 ((_ is ValueCellFull!1571) mapDefault!6462)) b!167700))

(assert (= b!167702 b!167691))

(assert (= start!16726 b!167702))

(declare-fun m!196339 () Bool)

(assert (=> mapNonEmpty!6462 m!196339))

(declare-fun m!196341 () Bool)

(assert (=> b!167698 m!196341))

(declare-fun m!196343 () Bool)

(assert (=> b!167702 m!196343))

(declare-fun m!196345 () Bool)

(assert (=> b!167702 m!196345))

(declare-fun m!196347 () Bool)

(assert (=> b!167692 m!196347))

(declare-fun m!196349 () Bool)

(assert (=> b!167692 m!196349))

(declare-fun m!196351 () Bool)

(assert (=> b!167692 m!196351))

(declare-fun m!196353 () Bool)

(assert (=> b!167692 m!196353))

(declare-fun m!196355 () Bool)

(assert (=> b!167692 m!196355))

(declare-fun m!196357 () Bool)

(assert (=> b!167692 m!196357))

(declare-fun m!196359 () Bool)

(assert (=> b!167692 m!196359))

(declare-fun m!196361 () Bool)

(assert (=> b!167699 m!196361))

(declare-fun m!196363 () Bool)

(assert (=> start!16726 m!196363))

(declare-fun m!196365 () Bool)

(assert (=> b!167703 m!196365))

(declare-fun m!196367 () Bool)

(assert (=> b!167703 m!196367))

(declare-fun m!196369 () Bool)

(assert (=> b!167701 m!196369))

(declare-fun m!196371 () Bool)

(assert (=> b!167695 m!196371))

(declare-fun m!196373 () Bool)

(assert (=> b!167697 m!196373))

(check-sat (not b!167702) (not b!167701) tp_is_empty!3829 (not b_next!4027) (not b!167699) (not b!167703) (not b!167692) (not b!167695) b_and!10415 (not b!167697) (not mapNonEmpty!6462) (not start!16726))
(check-sat b_and!10415 (not b_next!4027))
