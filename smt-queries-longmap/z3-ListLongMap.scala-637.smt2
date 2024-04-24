; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16174 () Bool)

(assert start!16174)

(declare-fun b!161255 () Bool)

(declare-fun b_free!3631 () Bool)

(declare-fun b_next!3631 () Bool)

(assert (=> b!161255 (= b_free!3631 (not b_next!3631))))

(declare-fun tp!13462 () Bool)

(declare-fun b_and!10059 () Bool)

(assert (=> b!161255 (= tp!13462 b_and!10059)))

(declare-fun b!161254 () Bool)

(declare-fun res!76472 () Bool)

(declare-fun e!105351 () Bool)

(assert (=> b!161254 (=> (not res!76472) (not e!105351))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4225 0))(
  ( (V!4226 (val!1761 Int)) )
))
(declare-datatypes ((ValueCell!1373 0))(
  ( (ValueCellFull!1373 (v!3627 V!4225)) (EmptyCell!1373) )
))
(declare-datatypes ((array!5931 0))(
  ( (array!5932 (arr!2810 (Array (_ BitVec 32) (_ BitVec 64))) (size!3094 (_ BitVec 32))) )
))
(declare-datatypes ((array!5933 0))(
  ( (array!5934 (arr!2811 (Array (_ BitVec 32) ValueCell!1373)) (size!3095 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1654 0))(
  ( (LongMapFixedSize!1655 (defaultEntry!3269 Int) (mask!7855 (_ BitVec 32)) (extraKeys!3010 (_ BitVec 32)) (zeroValue!3112 V!4225) (minValue!3112 V!4225) (_size!876 (_ BitVec 32)) (_keys!5070 array!5931) (_values!3252 array!5933) (_vacant!876 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1654)

(get-info :version)

(declare-datatypes ((SeekEntryResult!341 0))(
  ( (MissingZero!341 (index!3532 (_ BitVec 32))) (Found!341 (index!3533 (_ BitVec 32))) (Intermediate!341 (undefined!1153 Bool) (index!3534 (_ BitVec 32)) (x!17781 (_ BitVec 32))) (Undefined!341) (MissingVacant!341 (index!3535 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5931 (_ BitVec 32)) SeekEntryResult!341)

(assert (=> b!161254 (= res!76472 ((_ is Undefined!341) (seekEntryOrOpen!0 key!828 (_keys!5070 thiss!1248) (mask!7855 thiss!1248))))))

(declare-fun mapNonEmpty!5837 () Bool)

(declare-fun mapRes!5837 () Bool)

(declare-fun tp!13463 () Bool)

(declare-fun e!105352 () Bool)

(assert (=> mapNonEmpty!5837 (= mapRes!5837 (and tp!13463 e!105352))))

(declare-fun mapValue!5837 () ValueCell!1373)

(declare-fun mapKey!5837 () (_ BitVec 32))

(declare-fun mapRest!5837 () (Array (_ BitVec 32) ValueCell!1373))

(assert (=> mapNonEmpty!5837 (= (arr!2811 (_values!3252 thiss!1248)) (store mapRest!5837 mapKey!5837 mapValue!5837))))

(declare-fun e!105357 () Bool)

(declare-fun e!105353 () Bool)

(declare-fun tp_is_empty!3433 () Bool)

(declare-fun array_inv!1797 (array!5931) Bool)

(declare-fun array_inv!1798 (array!5933) Bool)

(assert (=> b!161255 (= e!105353 (and tp!13462 tp_is_empty!3433 (array_inv!1797 (_keys!5070 thiss!1248)) (array_inv!1798 (_values!3252 thiss!1248)) e!105357))))

(declare-fun res!76470 () Bool)

(assert (=> start!16174 (=> (not res!76470) (not e!105351))))

(declare-fun valid!779 (LongMapFixedSize!1654) Bool)

(assert (=> start!16174 (= res!76470 (valid!779 thiss!1248))))

(assert (=> start!16174 e!105351))

(assert (=> start!16174 e!105353))

(assert (=> start!16174 true))

(declare-fun b!161256 () Bool)

(assert (=> b!161256 (= e!105352 tp_is_empty!3433)))

(declare-fun b!161257 () Bool)

(assert (=> b!161257 (= e!105351 false)))

(declare-datatypes ((Unit!5001 0))(
  ( (Unit!5002) )
))
(declare-fun lt!82220 () Unit!5001)

(declare-fun e!105356 () Unit!5001)

(assert (=> b!161257 (= lt!82220 e!105356)))

(declare-fun c!29948 () Bool)

(declare-datatypes ((tuple2!2902 0))(
  ( (tuple2!2903 (_1!1462 (_ BitVec 64)) (_2!1462 V!4225)) )
))
(declare-datatypes ((List!1967 0))(
  ( (Nil!1964) (Cons!1963 (h!2576 tuple2!2902) (t!6761 List!1967)) )
))
(declare-datatypes ((ListLongMap!1901 0))(
  ( (ListLongMap!1902 (toList!966 List!1967)) )
))
(declare-fun contains!1012 (ListLongMap!1901 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!633 (array!5931 array!5933 (_ BitVec 32) (_ BitVec 32) V!4225 V!4225 (_ BitVec 32) Int) ListLongMap!1901)

(assert (=> b!161257 (= c!29948 (contains!1012 (getCurrentListMap!633 (_keys!5070 thiss!1248) (_values!3252 thiss!1248) (mask!7855 thiss!1248) (extraKeys!3010 thiss!1248) (zeroValue!3112 thiss!1248) (minValue!3112 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3269 thiss!1248)) key!828))))

(declare-fun b!161258 () Bool)

(declare-fun res!76471 () Bool)

(assert (=> b!161258 (=> (not res!76471) (not e!105351))))

(assert (=> b!161258 (= res!76471 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161259 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!72 (array!5931 array!5933 (_ BitVec 32) (_ BitVec 32) V!4225 V!4225 (_ BitVec 64) Int) Unit!5001)

(assert (=> b!161259 (= e!105356 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!72 (_keys!5070 thiss!1248) (_values!3252 thiss!1248) (mask!7855 thiss!1248) (extraKeys!3010 thiss!1248) (zeroValue!3112 thiss!1248) (minValue!3112 thiss!1248) key!828 (defaultEntry!3269 thiss!1248)))))

(declare-fun b!161260 () Bool)

(declare-fun Unit!5003 () Unit!5001)

(assert (=> b!161260 (= e!105356 Unit!5003)))

(declare-fun lt!82221 () Unit!5001)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!72 (array!5931 array!5933 (_ BitVec 32) (_ BitVec 32) V!4225 V!4225 (_ BitVec 64) Int) Unit!5001)

(assert (=> b!161260 (= lt!82221 (lemmaInListMapThenSeekEntryOrOpenFindsIt!72 (_keys!5070 thiss!1248) (_values!3252 thiss!1248) (mask!7855 thiss!1248) (extraKeys!3010 thiss!1248) (zeroValue!3112 thiss!1248) (minValue!3112 thiss!1248) key!828 (defaultEntry!3269 thiss!1248)))))

(assert (=> b!161260 false))

(declare-fun b!161261 () Bool)

(declare-fun e!105354 () Bool)

(assert (=> b!161261 (= e!105354 tp_is_empty!3433)))

(declare-fun b!161262 () Bool)

(assert (=> b!161262 (= e!105357 (and e!105354 mapRes!5837))))

(declare-fun condMapEmpty!5837 () Bool)

(declare-fun mapDefault!5837 () ValueCell!1373)

(assert (=> b!161262 (= condMapEmpty!5837 (= (arr!2811 (_values!3252 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1373)) mapDefault!5837)))))

(declare-fun mapIsEmpty!5837 () Bool)

(assert (=> mapIsEmpty!5837 mapRes!5837))

(assert (= (and start!16174 res!76470) b!161258))

(assert (= (and b!161258 res!76471) b!161254))

(assert (= (and b!161254 res!76472) b!161257))

(assert (= (and b!161257 c!29948) b!161260))

(assert (= (and b!161257 (not c!29948)) b!161259))

(assert (= (and b!161262 condMapEmpty!5837) mapIsEmpty!5837))

(assert (= (and b!161262 (not condMapEmpty!5837)) mapNonEmpty!5837))

(assert (= (and mapNonEmpty!5837 ((_ is ValueCellFull!1373) mapValue!5837)) b!161256))

(assert (= (and b!161262 ((_ is ValueCellFull!1373) mapDefault!5837)) b!161261))

(assert (= b!161255 b!161262))

(assert (= start!16174 b!161255))

(declare-fun m!192959 () Bool)

(assert (=> b!161254 m!192959))

(declare-fun m!192961 () Bool)

(assert (=> b!161259 m!192961))

(declare-fun m!192963 () Bool)

(assert (=> b!161257 m!192963))

(assert (=> b!161257 m!192963))

(declare-fun m!192965 () Bool)

(assert (=> b!161257 m!192965))

(declare-fun m!192967 () Bool)

(assert (=> b!161255 m!192967))

(declare-fun m!192969 () Bool)

(assert (=> b!161255 m!192969))

(declare-fun m!192971 () Bool)

(assert (=> start!16174 m!192971))

(declare-fun m!192973 () Bool)

(assert (=> b!161260 m!192973))

(declare-fun m!192975 () Bool)

(assert (=> mapNonEmpty!5837 m!192975))

(check-sat (not b!161260) (not mapNonEmpty!5837) (not b!161254) (not b!161255) (not b!161259) (not b!161257) (not b_next!3631) b_and!10059 tp_is_empty!3433 (not start!16174))
(check-sat b_and!10059 (not b_next!3631))
