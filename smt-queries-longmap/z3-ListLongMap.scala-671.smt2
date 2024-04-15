; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16534 () Bool)

(assert start!16534)

(declare-fun b!164275 () Bool)

(declare-fun b_free!3835 () Bool)

(declare-fun b_next!3835 () Bool)

(assert (=> b!164275 (= b_free!3835 (not b_next!3835))))

(declare-fun tp!14106 () Bool)

(declare-fun b_and!10223 () Bool)

(assert (=> b!164275 (= tp!14106 b_and!10223)))

(declare-fun res!77743 () Bool)

(declare-fun e!107769 () Bool)

(assert (=> start!16534 (=> (not res!77743) (not e!107769))))

(declare-datatypes ((V!4497 0))(
  ( (V!4498 (val!1863 Int)) )
))
(declare-datatypes ((ValueCell!1475 0))(
  ( (ValueCellFull!1475 (v!3722 V!4497)) (EmptyCell!1475) )
))
(declare-datatypes ((array!6351 0))(
  ( (array!6352 (arr!3010 (Array (_ BitVec 32) (_ BitVec 64))) (size!3299 (_ BitVec 32))) )
))
(declare-datatypes ((array!6353 0))(
  ( (array!6354 (arr!3011 (Array (_ BitVec 32) ValueCell!1475)) (size!3300 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1858 0))(
  ( (LongMapFixedSize!1859 (defaultEntry!3371 Int) (mask!8061 (_ BitVec 32)) (extraKeys!3112 (_ BitVec 32)) (zeroValue!3214 V!4497) (minValue!3214 V!4497) (_size!978 (_ BitVec 32)) (_keys!5195 array!6351) (_values!3354 array!6353) (_vacant!978 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1858)

(declare-fun valid!834 (LongMapFixedSize!1858) Bool)

(assert (=> start!16534 (= res!77743 (valid!834 thiss!1248))))

(assert (=> start!16534 e!107769))

(declare-fun e!107773 () Bool)

(assert (=> start!16534 e!107773))

(assert (=> start!16534 true))

(declare-fun mapNonEmpty!6174 () Bool)

(declare-fun mapRes!6174 () Bool)

(declare-fun tp!14105 () Bool)

(declare-fun e!107770 () Bool)

(assert (=> mapNonEmpty!6174 (= mapRes!6174 (and tp!14105 e!107770))))

(declare-fun mapKey!6174 () (_ BitVec 32))

(declare-fun mapRest!6174 () (Array (_ BitVec 32) ValueCell!1475))

(declare-fun mapValue!6174 () ValueCell!1475)

(assert (=> mapNonEmpty!6174 (= (arr!3011 (_values!3354 thiss!1248)) (store mapRest!6174 mapKey!6174 mapValue!6174))))

(declare-fun b!164267 () Bool)

(declare-fun e!107775 () Bool)

(assert (=> b!164267 (= e!107775 false)))

(declare-fun lt!82704 () Bool)

(declare-datatypes ((List!2014 0))(
  ( (Nil!2011) (Cons!2010 (h!2627 (_ BitVec 64)) (t!6807 List!2014)) )
))
(declare-fun arrayNoDuplicates!0 (array!6351 (_ BitVec 32) List!2014) Bool)

(assert (=> b!164267 (= lt!82704 (arrayNoDuplicates!0 (_keys!5195 thiss!1248) #b00000000000000000000000000000000 Nil!2011))))

(declare-fun b!164268 () Bool)

(declare-fun res!77749 () Bool)

(assert (=> b!164268 (=> (not res!77749) (not e!107775))))

(assert (=> b!164268 (= res!77749 (and (= (size!3300 (_values!3354 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8061 thiss!1248))) (= (size!3299 (_keys!5195 thiss!1248)) (size!3300 (_values!3354 thiss!1248))) (bvsge (mask!8061 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3112 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3112 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164269 () Bool)

(assert (=> b!164269 (= e!107769 e!107775)))

(declare-fun res!77746 () Bool)

(assert (=> b!164269 (=> (not res!77746) (not e!107775))))

(declare-datatypes ((SeekEntryResult!424 0))(
  ( (MissingZero!424 (index!3864 (_ BitVec 32))) (Found!424 (index!3865 (_ BitVec 32))) (Intermediate!424 (undefined!1236 Bool) (index!3866 (_ BitVec 32)) (x!18243 (_ BitVec 32))) (Undefined!424) (MissingVacant!424 (index!3867 (_ BitVec 32))) )
))
(declare-fun lt!82703 () SeekEntryResult!424)

(get-info :version)

(assert (=> b!164269 (= res!77746 (and (not ((_ is Undefined!424) lt!82703)) (not ((_ is MissingVacant!424) lt!82703)) (not ((_ is MissingZero!424) lt!82703)) ((_ is Found!424) lt!82703)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6351 (_ BitVec 32)) SeekEntryResult!424)

(assert (=> b!164269 (= lt!82703 (seekEntryOrOpen!0 key!828 (_keys!5195 thiss!1248) (mask!8061 thiss!1248)))))

(declare-fun b!164270 () Bool)

(declare-fun res!77747 () Bool)

(assert (=> b!164270 (=> (not res!77747) (not e!107769))))

(assert (=> b!164270 (= res!77747 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164271 () Bool)

(declare-fun e!107772 () Bool)

(declare-fun tp_is_empty!3637 () Bool)

(assert (=> b!164271 (= e!107772 tp_is_empty!3637)))

(declare-fun mapIsEmpty!6174 () Bool)

(assert (=> mapIsEmpty!6174 mapRes!6174))

(declare-fun b!164272 () Bool)

(declare-fun res!77745 () Bool)

(assert (=> b!164272 (=> (not res!77745) (not e!107775))))

(declare-datatypes ((tuple2!3014 0))(
  ( (tuple2!3015 (_1!1518 (_ BitVec 64)) (_2!1518 V!4497)) )
))
(declare-datatypes ((List!2015 0))(
  ( (Nil!2012) (Cons!2011 (h!2628 tuple2!3014) (t!6808 List!2015)) )
))
(declare-datatypes ((ListLongMap!1957 0))(
  ( (ListLongMap!1958 (toList!994 List!2015)) )
))
(declare-fun contains!1039 (ListLongMap!1957 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!636 (array!6351 array!6353 (_ BitVec 32) (_ BitVec 32) V!4497 V!4497 (_ BitVec 32) Int) ListLongMap!1957)

(assert (=> b!164272 (= res!77745 (contains!1039 (getCurrentListMap!636 (_keys!5195 thiss!1248) (_values!3354 thiss!1248) (mask!8061 thiss!1248) (extraKeys!3112 thiss!1248) (zeroValue!3214 thiss!1248) (minValue!3214 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3371 thiss!1248)) key!828))))

(declare-fun b!164273 () Bool)

(declare-fun res!77748 () Bool)

(assert (=> b!164273 (=> (not res!77748) (not e!107775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6351 (_ BitVec 32)) Bool)

(assert (=> b!164273 (= res!77748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5195 thiss!1248) (mask!8061 thiss!1248)))))

(declare-fun b!164274 () Bool)

(assert (=> b!164274 (= e!107770 tp_is_empty!3637)))

(declare-fun e!107774 () Bool)

(declare-fun array_inv!1937 (array!6351) Bool)

(declare-fun array_inv!1938 (array!6353) Bool)

(assert (=> b!164275 (= e!107773 (and tp!14106 tp_is_empty!3637 (array_inv!1937 (_keys!5195 thiss!1248)) (array_inv!1938 (_values!3354 thiss!1248)) e!107774))))

(declare-fun b!164276 () Bool)

(assert (=> b!164276 (= e!107774 (and e!107772 mapRes!6174))))

(declare-fun condMapEmpty!6174 () Bool)

(declare-fun mapDefault!6174 () ValueCell!1475)

(assert (=> b!164276 (= condMapEmpty!6174 (= (arr!3011 (_values!3354 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1475)) mapDefault!6174)))))

(declare-fun b!164277 () Bool)

(declare-fun res!77744 () Bool)

(assert (=> b!164277 (=> (not res!77744) (not e!107775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164277 (= res!77744 (validMask!0 (mask!8061 thiss!1248)))))

(assert (= (and start!16534 res!77743) b!164270))

(assert (= (and b!164270 res!77747) b!164269))

(assert (= (and b!164269 res!77746) b!164272))

(assert (= (and b!164272 res!77745) b!164277))

(assert (= (and b!164277 res!77744) b!164268))

(assert (= (and b!164268 res!77749) b!164273))

(assert (= (and b!164273 res!77748) b!164267))

(assert (= (and b!164276 condMapEmpty!6174) mapIsEmpty!6174))

(assert (= (and b!164276 (not condMapEmpty!6174)) mapNonEmpty!6174))

(assert (= (and mapNonEmpty!6174 ((_ is ValueCellFull!1475) mapValue!6174)) b!164274))

(assert (= (and b!164276 ((_ is ValueCellFull!1475) mapDefault!6174)) b!164271))

(assert (= b!164275 b!164276))

(assert (= start!16534 b!164275))

(declare-fun m!194011 () Bool)

(assert (=> b!164267 m!194011))

(declare-fun m!194013 () Bool)

(assert (=> mapNonEmpty!6174 m!194013))

(declare-fun m!194015 () Bool)

(assert (=> b!164273 m!194015))

(declare-fun m!194017 () Bool)

(assert (=> b!164275 m!194017))

(declare-fun m!194019 () Bool)

(assert (=> b!164275 m!194019))

(declare-fun m!194021 () Bool)

(assert (=> b!164269 m!194021))

(declare-fun m!194023 () Bool)

(assert (=> start!16534 m!194023))

(declare-fun m!194025 () Bool)

(assert (=> b!164272 m!194025))

(assert (=> b!164272 m!194025))

(declare-fun m!194027 () Bool)

(assert (=> b!164272 m!194027))

(declare-fun m!194029 () Bool)

(assert (=> b!164277 m!194029))

(check-sat (not b!164267) (not start!16534) (not b!164272) tp_is_empty!3637 (not b!164273) b_and!10223 (not mapNonEmpty!6174) (not b_next!3835) (not b!164269) (not b!164275) (not b!164277))
(check-sat b_and!10223 (not b_next!3835))
