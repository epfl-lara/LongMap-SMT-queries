; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16568 () Bool)

(assert start!16568)

(declare-fun b!165045 () Bool)

(declare-fun b_free!3873 () Bool)

(declare-fun b_next!3873 () Bool)

(assert (=> b!165045 (= b_free!3873 (not b_next!3873))))

(declare-fun tp!14220 () Bool)

(declare-fun b_and!10287 () Bool)

(assert (=> b!165045 (= tp!14220 b_and!10287)))

(declare-fun b!165041 () Bool)

(declare-fun res!78243 () Bool)

(declare-fun e!108269 () Bool)

(assert (=> b!165041 (=> (not res!78243) (not e!108269))))

(declare-datatypes ((V!4547 0))(
  ( (V!4548 (val!1882 Int)) )
))
(declare-datatypes ((ValueCell!1494 0))(
  ( (ValueCellFull!1494 (v!3747 V!4547)) (EmptyCell!1494) )
))
(declare-datatypes ((array!6447 0))(
  ( (array!6448 (arr!3059 (Array (_ BitVec 32) (_ BitVec 64))) (size!3347 (_ BitVec 32))) )
))
(declare-datatypes ((array!6449 0))(
  ( (array!6450 (arr!3060 (Array (_ BitVec 32) ValueCell!1494)) (size!3348 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1896 0))(
  ( (LongMapFixedSize!1897 (defaultEntry!3390 Int) (mask!8093 (_ BitVec 32)) (extraKeys!3131 (_ BitVec 32)) (zeroValue!3233 V!4547) (minValue!3233 V!4547) (_size!997 (_ BitVec 32)) (_keys!5215 array!6447) (_values!3373 array!6449) (_vacant!997 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1896)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3052 0))(
  ( (tuple2!3053 (_1!1537 (_ BitVec 64)) (_2!1537 V!4547)) )
))
(declare-datatypes ((List!2034 0))(
  ( (Nil!2031) (Cons!2030 (h!2647 tuple2!3052) (t!6836 List!2034)) )
))
(declare-datatypes ((ListLongMap!2007 0))(
  ( (ListLongMap!2008 (toList!1019 List!2034)) )
))
(declare-fun contains!1061 (ListLongMap!2007 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!677 (array!6447 array!6449 (_ BitVec 32) (_ BitVec 32) V!4547 V!4547 (_ BitVec 32) Int) ListLongMap!2007)

(assert (=> b!165041 (= res!78243 (contains!1061 (getCurrentListMap!677 (_keys!5215 thiss!1248) (_values!3373 thiss!1248) (mask!8093 thiss!1248) (extraKeys!3131 thiss!1248) (zeroValue!3233 thiss!1248) (minValue!3233 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3390 thiss!1248)) key!828))))

(declare-fun b!165042 () Bool)

(declare-fun e!108270 () Bool)

(assert (=> b!165042 (= e!108270 e!108269)))

(declare-fun res!78237 () Bool)

(assert (=> b!165042 (=> (not res!78237) (not e!108269))))

(declare-datatypes ((SeekEntryResult!427 0))(
  ( (MissingZero!427 (index!3876 (_ BitVec 32))) (Found!427 (index!3877 (_ BitVec 32))) (Intermediate!427 (undefined!1239 Bool) (index!3878 (_ BitVec 32)) (x!18295 (_ BitVec 32))) (Undefined!427) (MissingVacant!427 (index!3879 (_ BitVec 32))) )
))
(declare-fun lt!82998 () SeekEntryResult!427)

(get-info :version)

(assert (=> b!165042 (= res!78237 (and (not ((_ is Undefined!427) lt!82998)) (not ((_ is MissingVacant!427) lt!82998)) (not ((_ is MissingZero!427) lt!82998)) ((_ is Found!427) lt!82998)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6447 (_ BitVec 32)) SeekEntryResult!427)

(assert (=> b!165042 (= lt!82998 (seekEntryOrOpen!0 key!828 (_keys!5215 thiss!1248) (mask!8093 thiss!1248)))))

(declare-fun b!165043 () Bool)

(declare-fun e!108272 () Bool)

(declare-fun tp_is_empty!3675 () Bool)

(assert (=> b!165043 (= e!108272 tp_is_empty!3675)))

(declare-fun b!165044 () Bool)

(assert (=> b!165044 (= e!108269 false)))

(declare-fun lt!82999 () Bool)

(declare-datatypes ((List!2035 0))(
  ( (Nil!2032) (Cons!2031 (h!2648 (_ BitVec 64)) (t!6837 List!2035)) )
))
(declare-fun arrayNoDuplicates!0 (array!6447 (_ BitVec 32) List!2035) Bool)

(assert (=> b!165044 (= lt!82999 (arrayNoDuplicates!0 (_keys!5215 thiss!1248) #b00000000000000000000000000000000 Nil!2032))))

(declare-fun e!108271 () Bool)

(declare-fun e!108273 () Bool)

(declare-fun array_inv!1963 (array!6447) Bool)

(declare-fun array_inv!1964 (array!6449) Bool)

(assert (=> b!165045 (= e!108273 (and tp!14220 tp_is_empty!3675 (array_inv!1963 (_keys!5215 thiss!1248)) (array_inv!1964 (_values!3373 thiss!1248)) e!108271))))

(declare-fun b!165046 () Bool)

(declare-fun res!78240 () Bool)

(assert (=> b!165046 (=> (not res!78240) (not e!108270))))

(assert (=> b!165046 (= res!78240 (not (= key!828 (bvneg key!828))))))

(declare-fun res!78241 () Bool)

(assert (=> start!16568 (=> (not res!78241) (not e!108270))))

(declare-fun valid!841 (LongMapFixedSize!1896) Bool)

(assert (=> start!16568 (= res!78241 (valid!841 thiss!1248))))

(assert (=> start!16568 e!108270))

(assert (=> start!16568 e!108273))

(assert (=> start!16568 true))

(declare-fun b!165047 () Bool)

(declare-fun res!78242 () Bool)

(assert (=> b!165047 (=> (not res!78242) (not e!108269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6447 (_ BitVec 32)) Bool)

(assert (=> b!165047 (= res!78242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5215 thiss!1248) (mask!8093 thiss!1248)))))

(declare-fun b!165048 () Bool)

(declare-fun e!108275 () Bool)

(assert (=> b!165048 (= e!108275 tp_is_empty!3675)))

(declare-fun b!165049 () Bool)

(declare-fun res!78238 () Bool)

(assert (=> b!165049 (=> (not res!78238) (not e!108269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165049 (= res!78238 (validMask!0 (mask!8093 thiss!1248)))))

(declare-fun mapNonEmpty!6231 () Bool)

(declare-fun mapRes!6231 () Bool)

(declare-fun tp!14219 () Bool)

(assert (=> mapNonEmpty!6231 (= mapRes!6231 (and tp!14219 e!108272))))

(declare-fun mapRest!6231 () (Array (_ BitVec 32) ValueCell!1494))

(declare-fun mapKey!6231 () (_ BitVec 32))

(declare-fun mapValue!6231 () ValueCell!1494)

(assert (=> mapNonEmpty!6231 (= (arr!3060 (_values!3373 thiss!1248)) (store mapRest!6231 mapKey!6231 mapValue!6231))))

(declare-fun b!165050 () Bool)

(assert (=> b!165050 (= e!108271 (and e!108275 mapRes!6231))))

(declare-fun condMapEmpty!6231 () Bool)

(declare-fun mapDefault!6231 () ValueCell!1494)

(assert (=> b!165050 (= condMapEmpty!6231 (= (arr!3060 (_values!3373 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1494)) mapDefault!6231)))))

(declare-fun b!165051 () Bool)

(declare-fun res!78239 () Bool)

(assert (=> b!165051 (=> (not res!78239) (not e!108269))))

(assert (=> b!165051 (= res!78239 (and (= (size!3348 (_values!3373 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8093 thiss!1248))) (= (size!3347 (_keys!5215 thiss!1248)) (size!3348 (_values!3373 thiss!1248))) (bvsge (mask!8093 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3131 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3131 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!6231 () Bool)

(assert (=> mapIsEmpty!6231 mapRes!6231))

(assert (= (and start!16568 res!78241) b!165046))

(assert (= (and b!165046 res!78240) b!165042))

(assert (= (and b!165042 res!78237) b!165041))

(assert (= (and b!165041 res!78243) b!165049))

(assert (= (and b!165049 res!78238) b!165051))

(assert (= (and b!165051 res!78239) b!165047))

(assert (= (and b!165047 res!78242) b!165044))

(assert (= (and b!165050 condMapEmpty!6231) mapIsEmpty!6231))

(assert (= (and b!165050 (not condMapEmpty!6231)) mapNonEmpty!6231))

(assert (= (and mapNonEmpty!6231 ((_ is ValueCellFull!1494) mapValue!6231)) b!165043))

(assert (= (and b!165050 ((_ is ValueCellFull!1494) mapDefault!6231)) b!165048))

(assert (= b!165045 b!165050))

(assert (= start!16568 b!165045))

(declare-fun m!195011 () Bool)

(assert (=> b!165044 m!195011))

(declare-fun m!195013 () Bool)

(assert (=> b!165041 m!195013))

(assert (=> b!165041 m!195013))

(declare-fun m!195015 () Bool)

(assert (=> b!165041 m!195015))

(declare-fun m!195017 () Bool)

(assert (=> b!165047 m!195017))

(declare-fun m!195019 () Bool)

(assert (=> b!165042 m!195019))

(declare-fun m!195021 () Bool)

(assert (=> mapNonEmpty!6231 m!195021))

(declare-fun m!195023 () Bool)

(assert (=> b!165049 m!195023))

(declare-fun m!195025 () Bool)

(assert (=> b!165045 m!195025))

(declare-fun m!195027 () Bool)

(assert (=> b!165045 m!195027))

(declare-fun m!195029 () Bool)

(assert (=> start!16568 m!195029))

(check-sat b_and!10287 (not mapNonEmpty!6231) (not b!165044) (not b!165042) (not start!16568) (not b!165049) (not b!165045) (not b!165047) (not b_next!3873) (not b!165041) tp_is_empty!3675)
(check-sat b_and!10287 (not b_next!3873))
