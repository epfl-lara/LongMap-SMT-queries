; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16114 () Bool)

(assert start!16114)

(declare-fun b!160277 () Bool)

(declare-fun b_free!3571 () Bool)

(declare-fun b_next!3571 () Bool)

(assert (=> b!160277 (= b_free!3571 (not b_next!3571))))

(declare-fun tp!13282 () Bool)

(declare-fun b_and!9999 () Bool)

(assert (=> b!160277 (= tp!13282 b_and!9999)))

(declare-fun b!160268 () Bool)

(declare-fun e!104809 () Bool)

(declare-fun tp_is_empty!3373 () Bool)

(assert (=> b!160268 (= e!104809 tp_is_empty!3373)))

(declare-fun b!160269 () Bool)

(declare-fun res!75849 () Bool)

(declare-fun e!104811 () Bool)

(assert (=> b!160269 (=> (not res!75849) (not e!104811))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4145 0))(
  ( (V!4146 (val!1731 Int)) )
))
(declare-datatypes ((ValueCell!1343 0))(
  ( (ValueCellFull!1343 (v!3597 V!4145)) (EmptyCell!1343) )
))
(declare-datatypes ((array!5811 0))(
  ( (array!5812 (arr!2750 (Array (_ BitVec 32) (_ BitVec 64))) (size!3034 (_ BitVec 32))) )
))
(declare-datatypes ((array!5813 0))(
  ( (array!5814 (arr!2751 (Array (_ BitVec 32) ValueCell!1343)) (size!3035 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1594 0))(
  ( (LongMapFixedSize!1595 (defaultEntry!3239 Int) (mask!7805 (_ BitVec 32)) (extraKeys!2980 (_ BitVec 32)) (zeroValue!3082 V!4145) (minValue!3082 V!4145) (_size!846 (_ BitVec 32)) (_keys!5040 array!5811) (_values!3222 array!5813) (_vacant!846 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1594)

(get-info :version)

(declare-datatypes ((SeekEntryResult!321 0))(
  ( (MissingZero!321 (index!3452 (_ BitVec 32))) (Found!321 (index!3453 (_ BitVec 32))) (Intermediate!321 (undefined!1133 Bool) (index!3454 (_ BitVec 32)) (x!17681 (_ BitVec 32))) (Undefined!321) (MissingVacant!321 (index!3455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5811 (_ BitVec 32)) SeekEntryResult!321)

(assert (=> b!160269 (= res!75849 ((_ is Undefined!321) (seekEntryOrOpen!0 key!828 (_keys!5040 thiss!1248) (mask!7805 thiss!1248))))))

(declare-fun b!160270 () Bool)

(declare-fun res!75850 () Bool)

(assert (=> b!160270 (=> (not res!75850) (not e!104811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5811 (_ BitVec 32)) Bool)

(assert (=> b!160270 (= res!75850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5040 thiss!1248) (mask!7805 thiss!1248)))))

(declare-fun b!160271 () Bool)

(declare-fun e!104812 () Bool)

(assert (=> b!160271 (= e!104812 tp_is_empty!3373)))

(declare-fun b!160272 () Bool)

(declare-fun e!104810 () Bool)

(declare-fun mapRes!5747 () Bool)

(assert (=> b!160272 (= e!104810 (and e!104812 mapRes!5747))))

(declare-fun condMapEmpty!5747 () Bool)

(declare-fun mapDefault!5747 () ValueCell!1343)

(assert (=> b!160272 (= condMapEmpty!5747 (= (arr!2751 (_values!3222 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1343)) mapDefault!5747)))))

(declare-fun b!160273 () Bool)

(declare-fun res!75851 () Bool)

(assert (=> b!160273 (=> (not res!75851) (not e!104811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160273 (= res!75851 (validMask!0 (mask!7805 thiss!1248)))))

(declare-fun b!160274 () Bool)

(declare-fun res!75848 () Bool)

(assert (=> b!160274 (=> (not res!75848) (not e!104811))))

(assert (=> b!160274 (= res!75848 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160275 () Bool)

(declare-fun res!75853 () Bool)

(assert (=> b!160275 (=> (not res!75853) (not e!104811))))

(declare-datatypes ((tuple2!2856 0))(
  ( (tuple2!2857 (_1!1439 (_ BitVec 64)) (_2!1439 V!4145)) )
))
(declare-datatypes ((List!1922 0))(
  ( (Nil!1919) (Cons!1918 (h!2531 tuple2!2856) (t!6716 List!1922)) )
))
(declare-datatypes ((ListLongMap!1855 0))(
  ( (ListLongMap!1856 (toList!943 List!1922)) )
))
(declare-fun contains!989 (ListLongMap!1855 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!610 (array!5811 array!5813 (_ BitVec 32) (_ BitVec 32) V!4145 V!4145 (_ BitVec 32) Int) ListLongMap!1855)

(assert (=> b!160275 (= res!75853 (not (contains!989 (getCurrentListMap!610 (_keys!5040 thiss!1248) (_values!3222 thiss!1248) (mask!7805 thiss!1248) (extraKeys!2980 thiss!1248) (zeroValue!3082 thiss!1248) (minValue!3082 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3239 thiss!1248)) key!828)))))

(declare-fun res!75854 () Bool)

(assert (=> start!16114 (=> (not res!75854) (not e!104811))))

(declare-fun valid!759 (LongMapFixedSize!1594) Bool)

(assert (=> start!16114 (= res!75854 (valid!759 thiss!1248))))

(assert (=> start!16114 e!104811))

(declare-fun e!104813 () Bool)

(assert (=> start!16114 e!104813))

(assert (=> start!16114 true))

(declare-fun mapIsEmpty!5747 () Bool)

(assert (=> mapIsEmpty!5747 mapRes!5747))

(declare-fun b!160276 () Bool)

(assert (=> b!160276 (= e!104811 false)))

(declare-fun lt!82128 () Bool)

(declare-datatypes ((List!1923 0))(
  ( (Nil!1920) (Cons!1919 (h!2532 (_ BitVec 64)) (t!6717 List!1923)) )
))
(declare-fun arrayNoDuplicates!0 (array!5811 (_ BitVec 32) List!1923) Bool)

(assert (=> b!160276 (= lt!82128 (arrayNoDuplicates!0 (_keys!5040 thiss!1248) #b00000000000000000000000000000000 Nil!1920))))

(declare-fun array_inv!1757 (array!5811) Bool)

(declare-fun array_inv!1758 (array!5813) Bool)

(assert (=> b!160277 (= e!104813 (and tp!13282 tp_is_empty!3373 (array_inv!1757 (_keys!5040 thiss!1248)) (array_inv!1758 (_values!3222 thiss!1248)) e!104810))))

(declare-fun mapNonEmpty!5747 () Bool)

(declare-fun tp!13283 () Bool)

(assert (=> mapNonEmpty!5747 (= mapRes!5747 (and tp!13283 e!104809))))

(declare-fun mapRest!5747 () (Array (_ BitVec 32) ValueCell!1343))

(declare-fun mapKey!5747 () (_ BitVec 32))

(declare-fun mapValue!5747 () ValueCell!1343)

(assert (=> mapNonEmpty!5747 (= (arr!2751 (_values!3222 thiss!1248)) (store mapRest!5747 mapKey!5747 mapValue!5747))))

(declare-fun b!160278 () Bool)

(declare-fun res!75852 () Bool)

(assert (=> b!160278 (=> (not res!75852) (not e!104811))))

(assert (=> b!160278 (= res!75852 (and (= (size!3035 (_values!3222 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7805 thiss!1248))) (= (size!3034 (_keys!5040 thiss!1248)) (size!3035 (_values!3222 thiss!1248))) (bvsge (mask!7805 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2980 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2980 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!16114 res!75854) b!160274))

(assert (= (and b!160274 res!75848) b!160269))

(assert (= (and b!160269 res!75849) b!160275))

(assert (= (and b!160275 res!75853) b!160273))

(assert (= (and b!160273 res!75851) b!160278))

(assert (= (and b!160278 res!75852) b!160270))

(assert (= (and b!160270 res!75850) b!160276))

(assert (= (and b!160272 condMapEmpty!5747) mapIsEmpty!5747))

(assert (= (and b!160272 (not condMapEmpty!5747)) mapNonEmpty!5747))

(assert (= (and mapNonEmpty!5747 ((_ is ValueCellFull!1343) mapValue!5747)) b!160268))

(assert (= (and b!160272 ((_ is ValueCellFull!1343) mapDefault!5747)) b!160271))

(assert (= b!160277 b!160272))

(assert (= start!16114 b!160277))

(declare-fun m!192359 () Bool)

(assert (=> b!160270 m!192359))

(declare-fun m!192361 () Bool)

(assert (=> start!16114 m!192361))

(declare-fun m!192363 () Bool)

(assert (=> b!160273 m!192363))

(declare-fun m!192365 () Bool)

(assert (=> b!160276 m!192365))

(declare-fun m!192367 () Bool)

(assert (=> b!160275 m!192367))

(assert (=> b!160275 m!192367))

(declare-fun m!192369 () Bool)

(assert (=> b!160275 m!192369))

(declare-fun m!192371 () Bool)

(assert (=> mapNonEmpty!5747 m!192371))

(declare-fun m!192373 () Bool)

(assert (=> b!160277 m!192373))

(declare-fun m!192375 () Bool)

(assert (=> b!160277 m!192375))

(declare-fun m!192377 () Bool)

(assert (=> b!160269 m!192377))

(check-sat (not b_next!3571) (not b!160270) (not b!160276) b_and!9999 (not start!16114) (not b!160273) (not b!160269) (not mapNonEmpty!5747) (not b!160277) (not b!160275) tp_is_empty!3373)
(check-sat b_and!9999 (not b_next!3571))
