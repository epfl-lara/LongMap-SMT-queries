; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16186 () Bool)

(assert start!16186)

(declare-fun b!161418 () Bool)

(declare-fun b_free!3643 () Bool)

(declare-fun b_next!3643 () Bool)

(assert (=> b!161418 (= b_free!3643 (not b_next!3643))))

(declare-fun tp!13499 () Bool)

(declare-fun b_and!10071 () Bool)

(assert (=> b!161418 (= tp!13499 b_and!10071)))

(declare-fun b!161416 () Bool)

(declare-datatypes ((Unit!5018 0))(
  ( (Unit!5019) )
))
(declare-fun e!105480 () Unit!5018)

(declare-datatypes ((V!4241 0))(
  ( (V!4242 (val!1767 Int)) )
))
(declare-datatypes ((ValueCell!1379 0))(
  ( (ValueCellFull!1379 (v!3633 V!4241)) (EmptyCell!1379) )
))
(declare-datatypes ((array!5955 0))(
  ( (array!5956 (arr!2822 (Array (_ BitVec 32) (_ BitVec 64))) (size!3106 (_ BitVec 32))) )
))
(declare-datatypes ((array!5957 0))(
  ( (array!5958 (arr!2823 (Array (_ BitVec 32) ValueCell!1379)) (size!3107 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1666 0))(
  ( (LongMapFixedSize!1667 (defaultEntry!3275 Int) (mask!7865 (_ BitVec 32)) (extraKeys!3016 (_ BitVec 32)) (zeroValue!3118 V!4241) (minValue!3118 V!4241) (_size!882 (_ BitVec 32)) (_keys!5076 array!5955) (_values!3258 array!5957) (_vacant!882 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1666)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!76 (array!5955 array!5957 (_ BitVec 32) (_ BitVec 32) V!4241 V!4241 (_ BitVec 64) Int) Unit!5018)

(assert (=> b!161416 (= e!105480 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!76 (_keys!5076 thiss!1248) (_values!3258 thiss!1248) (mask!7865 thiss!1248) (extraKeys!3016 thiss!1248) (zeroValue!3118 thiss!1248) (minValue!3118 thiss!1248) key!828 (defaultEntry!3275 thiss!1248)))))

(declare-fun mapIsEmpty!5855 () Bool)

(declare-fun mapRes!5855 () Bool)

(assert (=> mapIsEmpty!5855 mapRes!5855))

(declare-fun b!161417 () Bool)

(declare-fun res!76524 () Bool)

(declare-fun e!105483 () Bool)

(assert (=> b!161417 (=> (not res!76524) (not e!105483))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!347 0))(
  ( (MissingZero!347 (index!3556 (_ BitVec 32))) (Found!347 (index!3557 (_ BitVec 32))) (Intermediate!347 (undefined!1159 Bool) (index!3558 (_ BitVec 32)) (x!17803 (_ BitVec 32))) (Undefined!347) (MissingVacant!347 (index!3559 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5955 (_ BitVec 32)) SeekEntryResult!347)

(assert (=> b!161417 (= res!76524 ((_ is Undefined!347) (seekEntryOrOpen!0 key!828 (_keys!5076 thiss!1248) (mask!7865 thiss!1248))))))

(declare-fun tp_is_empty!3445 () Bool)

(declare-fun e!105478 () Bool)

(declare-fun e!105477 () Bool)

(declare-fun array_inv!1807 (array!5955) Bool)

(declare-fun array_inv!1808 (array!5957) Bool)

(assert (=> b!161418 (= e!105478 (and tp!13499 tp_is_empty!3445 (array_inv!1807 (_keys!5076 thiss!1248)) (array_inv!1808 (_values!3258 thiss!1248)) e!105477))))

(declare-fun b!161419 () Bool)

(assert (=> b!161419 (= e!105483 false)))

(declare-fun lt!82257 () Unit!5018)

(assert (=> b!161419 (= lt!82257 e!105480)))

(declare-fun c!29966 () Bool)

(declare-datatypes ((tuple2!2914 0))(
  ( (tuple2!2915 (_1!1468 (_ BitVec 64)) (_2!1468 V!4241)) )
))
(declare-datatypes ((List!1973 0))(
  ( (Nil!1970) (Cons!1969 (h!2582 tuple2!2914) (t!6767 List!1973)) )
))
(declare-datatypes ((ListLongMap!1913 0))(
  ( (ListLongMap!1914 (toList!972 List!1973)) )
))
(declare-fun contains!1018 (ListLongMap!1913 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!639 (array!5955 array!5957 (_ BitVec 32) (_ BitVec 32) V!4241 V!4241 (_ BitVec 32) Int) ListLongMap!1913)

(assert (=> b!161419 (= c!29966 (contains!1018 (getCurrentListMap!639 (_keys!5076 thiss!1248) (_values!3258 thiss!1248) (mask!7865 thiss!1248) (extraKeys!3016 thiss!1248) (zeroValue!3118 thiss!1248) (minValue!3118 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3275 thiss!1248)) key!828))))

(declare-fun res!76526 () Bool)

(assert (=> start!16186 (=> (not res!76526) (not e!105483))))

(declare-fun valid!784 (LongMapFixedSize!1666) Bool)

(assert (=> start!16186 (= res!76526 (valid!784 thiss!1248))))

(assert (=> start!16186 e!105483))

(assert (=> start!16186 e!105478))

(assert (=> start!16186 true))

(declare-fun b!161420 () Bool)

(declare-fun e!105481 () Bool)

(assert (=> b!161420 (= e!105477 (and e!105481 mapRes!5855))))

(declare-fun condMapEmpty!5855 () Bool)

(declare-fun mapDefault!5855 () ValueCell!1379)

(assert (=> b!161420 (= condMapEmpty!5855 (= (arr!2823 (_values!3258 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1379)) mapDefault!5855)))))

(declare-fun b!161421 () Bool)

(declare-fun Unit!5020 () Unit!5018)

(assert (=> b!161421 (= e!105480 Unit!5020)))

(declare-fun lt!82256 () Unit!5018)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!77 (array!5955 array!5957 (_ BitVec 32) (_ BitVec 32) V!4241 V!4241 (_ BitVec 64) Int) Unit!5018)

(assert (=> b!161421 (= lt!82256 (lemmaInListMapThenSeekEntryOrOpenFindsIt!77 (_keys!5076 thiss!1248) (_values!3258 thiss!1248) (mask!7865 thiss!1248) (extraKeys!3016 thiss!1248) (zeroValue!3118 thiss!1248) (minValue!3118 thiss!1248) key!828 (defaultEntry!3275 thiss!1248)))))

(assert (=> b!161421 false))

(declare-fun mapNonEmpty!5855 () Bool)

(declare-fun tp!13498 () Bool)

(declare-fun e!105482 () Bool)

(assert (=> mapNonEmpty!5855 (= mapRes!5855 (and tp!13498 e!105482))))

(declare-fun mapValue!5855 () ValueCell!1379)

(declare-fun mapRest!5855 () (Array (_ BitVec 32) ValueCell!1379))

(declare-fun mapKey!5855 () (_ BitVec 32))

(assert (=> mapNonEmpty!5855 (= (arr!2823 (_values!3258 thiss!1248)) (store mapRest!5855 mapKey!5855 mapValue!5855))))

(declare-fun b!161422 () Bool)

(assert (=> b!161422 (= e!105481 tp_is_empty!3445)))

(declare-fun b!161423 () Bool)

(declare-fun res!76525 () Bool)

(assert (=> b!161423 (=> (not res!76525) (not e!105483))))

(assert (=> b!161423 (= res!76525 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161424 () Bool)

(assert (=> b!161424 (= e!105482 tp_is_empty!3445)))

(assert (= (and start!16186 res!76526) b!161423))

(assert (= (and b!161423 res!76525) b!161417))

(assert (= (and b!161417 res!76524) b!161419))

(assert (= (and b!161419 c!29966) b!161421))

(assert (= (and b!161419 (not c!29966)) b!161416))

(assert (= (and b!161420 condMapEmpty!5855) mapIsEmpty!5855))

(assert (= (and b!161420 (not condMapEmpty!5855)) mapNonEmpty!5855))

(assert (= (and mapNonEmpty!5855 ((_ is ValueCellFull!1379) mapValue!5855)) b!161424))

(assert (= (and b!161420 ((_ is ValueCellFull!1379) mapDefault!5855)) b!161422))

(assert (= b!161418 b!161420))

(assert (= start!16186 b!161418))

(declare-fun m!193067 () Bool)

(assert (=> b!161419 m!193067))

(assert (=> b!161419 m!193067))

(declare-fun m!193069 () Bool)

(assert (=> b!161419 m!193069))

(declare-fun m!193071 () Bool)

(assert (=> b!161418 m!193071))

(declare-fun m!193073 () Bool)

(assert (=> b!161418 m!193073))

(declare-fun m!193075 () Bool)

(assert (=> b!161417 m!193075))

(declare-fun m!193077 () Bool)

(assert (=> b!161416 m!193077))

(declare-fun m!193079 () Bool)

(assert (=> start!16186 m!193079))

(declare-fun m!193081 () Bool)

(assert (=> mapNonEmpty!5855 m!193081))

(declare-fun m!193083 () Bool)

(assert (=> b!161421 m!193083))

(check-sat (not b!161421) tp_is_empty!3445 (not b!161418) (not b!161417) (not start!16186) (not b!161419) (not b!161416) (not b_next!3643) b_and!10071 (not mapNonEmpty!5855))
(check-sat b_and!10071 (not b_next!3643))
