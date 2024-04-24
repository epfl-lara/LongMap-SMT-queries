; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16162 () Bool)

(assert start!16162)

(declare-fun b!161060 () Bool)

(declare-fun b_free!3619 () Bool)

(declare-fun b_next!3619 () Bool)

(assert (=> b!161060 (= b_free!3619 (not b_next!3619))))

(declare-fun tp!13427 () Bool)

(declare-fun b_and!10047 () Bool)

(assert (=> b!161060 (= tp!13427 b_and!10047)))

(declare-fun tp_is_empty!3421 () Bool)

(declare-datatypes ((V!4209 0))(
  ( (V!4210 (val!1755 Int)) )
))
(declare-datatypes ((ValueCell!1367 0))(
  ( (ValueCellFull!1367 (v!3621 V!4209)) (EmptyCell!1367) )
))
(declare-datatypes ((array!5907 0))(
  ( (array!5908 (arr!2798 (Array (_ BitVec 32) (_ BitVec 64))) (size!3082 (_ BitVec 32))) )
))
(declare-datatypes ((array!5909 0))(
  ( (array!5910 (arr!2799 (Array (_ BitVec 32) ValueCell!1367)) (size!3083 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1642 0))(
  ( (LongMapFixedSize!1643 (defaultEntry!3263 Int) (mask!7845 (_ BitVec 32)) (extraKeys!3004 (_ BitVec 32)) (zeroValue!3106 V!4209) (minValue!3106 V!4209) (_size!870 (_ BitVec 32)) (_keys!5064 array!5907) (_values!3246 array!5909) (_vacant!870 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1642)

(declare-fun e!105243 () Bool)

(declare-fun e!105246 () Bool)

(declare-fun array_inv!1787 (array!5907) Bool)

(declare-fun array_inv!1788 (array!5909) Bool)

(assert (=> b!161060 (= e!105246 (and tp!13427 tp_is_empty!3421 (array_inv!1787 (_keys!5064 thiss!1248)) (array_inv!1788 (_values!3246 thiss!1248)) e!105243))))

(declare-fun b!161062 () Bool)

(declare-fun e!105241 () Bool)

(assert (=> b!161062 (= e!105241 false)))

(declare-fun lt!82200 () Bool)

(declare-datatypes ((List!1957 0))(
  ( (Nil!1954) (Cons!1953 (h!2566 (_ BitVec 64)) (t!6751 List!1957)) )
))
(declare-fun arrayNoDuplicates!0 (array!5907 (_ BitVec 32) List!1957) Bool)

(assert (=> b!161062 (= lt!82200 (arrayNoDuplicates!0 (_keys!5064 thiss!1248) #b00000000000000000000000000000000 Nil!1954))))

(declare-fun b!161063 () Bool)

(declare-fun e!105244 () Bool)

(declare-fun mapRes!5819 () Bool)

(assert (=> b!161063 (= e!105243 (and e!105244 mapRes!5819))))

(declare-fun condMapEmpty!5819 () Bool)

(declare-fun mapDefault!5819 () ValueCell!1367)

(assert (=> b!161063 (= condMapEmpty!5819 (= (arr!2799 (_values!3246 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1367)) mapDefault!5819)))))

(declare-fun b!161064 () Bool)

(declare-fun res!76354 () Bool)

(assert (=> b!161064 (=> (not res!76354) (not e!105241))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161064 (= res!76354 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161065 () Bool)

(declare-fun res!76357 () Bool)

(assert (=> b!161065 (=> (not res!76357) (not e!105241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!161065 (= res!76357 (validMask!0 (mask!7845 thiss!1248)))))

(declare-fun b!161066 () Bool)

(declare-fun res!76355 () Bool)

(assert (=> b!161066 (=> (not res!76355) (not e!105241))))

(declare-datatypes ((tuple2!2892 0))(
  ( (tuple2!2893 (_1!1457 (_ BitVec 64)) (_2!1457 V!4209)) )
))
(declare-datatypes ((List!1958 0))(
  ( (Nil!1955) (Cons!1954 (h!2567 tuple2!2892) (t!6752 List!1958)) )
))
(declare-datatypes ((ListLongMap!1891 0))(
  ( (ListLongMap!1892 (toList!961 List!1958)) )
))
(declare-fun contains!1007 (ListLongMap!1891 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!628 (array!5907 array!5909 (_ BitVec 32) (_ BitVec 32) V!4209 V!4209 (_ BitVec 32) Int) ListLongMap!1891)

(assert (=> b!161066 (= res!76355 (not (contains!1007 (getCurrentListMap!628 (_keys!5064 thiss!1248) (_values!3246 thiss!1248) (mask!7845 thiss!1248) (extraKeys!3004 thiss!1248) (zeroValue!3106 thiss!1248) (minValue!3106 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3263 thiss!1248)) key!828)))))

(declare-fun b!161067 () Bool)

(declare-fun res!76356 () Bool)

(assert (=> b!161067 (=> (not res!76356) (not e!105241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5907 (_ BitVec 32)) Bool)

(assert (=> b!161067 (= res!76356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5064 thiss!1248) (mask!7845 thiss!1248)))))

(declare-fun mapNonEmpty!5819 () Bool)

(declare-fun tp!13426 () Bool)

(declare-fun e!105242 () Bool)

(assert (=> mapNonEmpty!5819 (= mapRes!5819 (and tp!13426 e!105242))))

(declare-fun mapKey!5819 () (_ BitVec 32))

(declare-fun mapValue!5819 () ValueCell!1367)

(declare-fun mapRest!5819 () (Array (_ BitVec 32) ValueCell!1367))

(assert (=> mapNonEmpty!5819 (= (arr!2799 (_values!3246 thiss!1248)) (store mapRest!5819 mapKey!5819 mapValue!5819))))

(declare-fun mapIsEmpty!5819 () Bool)

(assert (=> mapIsEmpty!5819 mapRes!5819))

(declare-fun b!161068 () Bool)

(declare-fun res!76352 () Bool)

(assert (=> b!161068 (=> (not res!76352) (not e!105241))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!337 0))(
  ( (MissingZero!337 (index!3516 (_ BitVec 32))) (Found!337 (index!3517 (_ BitVec 32))) (Intermediate!337 (undefined!1149 Bool) (index!3518 (_ BitVec 32)) (x!17761 (_ BitVec 32))) (Undefined!337) (MissingVacant!337 (index!3519 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5907 (_ BitVec 32)) SeekEntryResult!337)

(assert (=> b!161068 (= res!76352 ((_ is Undefined!337) (seekEntryOrOpen!0 key!828 (_keys!5064 thiss!1248) (mask!7845 thiss!1248))))))

(declare-fun res!76358 () Bool)

(assert (=> start!16162 (=> (not res!76358) (not e!105241))))

(declare-fun valid!776 (LongMapFixedSize!1642) Bool)

(assert (=> start!16162 (= res!76358 (valid!776 thiss!1248))))

(assert (=> start!16162 e!105241))

(assert (=> start!16162 e!105246))

(assert (=> start!16162 true))

(declare-fun b!161061 () Bool)

(assert (=> b!161061 (= e!105242 tp_is_empty!3421)))

(declare-fun b!161069 () Bool)

(assert (=> b!161069 (= e!105244 tp_is_empty!3421)))

(declare-fun b!161070 () Bool)

(declare-fun res!76353 () Bool)

(assert (=> b!161070 (=> (not res!76353) (not e!105241))))

(assert (=> b!161070 (= res!76353 (and (= (size!3083 (_values!3246 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7845 thiss!1248))) (= (size!3082 (_keys!5064 thiss!1248)) (size!3083 (_values!3246 thiss!1248))) (bvsge (mask!7845 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3004 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3004 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!16162 res!76358) b!161064))

(assert (= (and b!161064 res!76354) b!161068))

(assert (= (and b!161068 res!76352) b!161066))

(assert (= (and b!161066 res!76355) b!161065))

(assert (= (and b!161065 res!76357) b!161070))

(assert (= (and b!161070 res!76353) b!161067))

(assert (= (and b!161067 res!76356) b!161062))

(assert (= (and b!161063 condMapEmpty!5819) mapIsEmpty!5819))

(assert (= (and b!161063 (not condMapEmpty!5819)) mapNonEmpty!5819))

(assert (= (and mapNonEmpty!5819 ((_ is ValueCellFull!1367) mapValue!5819)) b!161061))

(assert (= (and b!161063 ((_ is ValueCellFull!1367) mapDefault!5819)) b!161069))

(assert (= b!161060 b!161063))

(assert (= start!16162 b!161060))

(declare-fun m!192839 () Bool)

(assert (=> mapNonEmpty!5819 m!192839))

(declare-fun m!192841 () Bool)

(assert (=> b!161060 m!192841))

(declare-fun m!192843 () Bool)

(assert (=> b!161060 m!192843))

(declare-fun m!192845 () Bool)

(assert (=> b!161067 m!192845))

(declare-fun m!192847 () Bool)

(assert (=> b!161068 m!192847))

(declare-fun m!192849 () Bool)

(assert (=> b!161065 m!192849))

(declare-fun m!192851 () Bool)

(assert (=> b!161062 m!192851))

(declare-fun m!192853 () Bool)

(assert (=> b!161066 m!192853))

(assert (=> b!161066 m!192853))

(declare-fun m!192855 () Bool)

(assert (=> b!161066 m!192855))

(declare-fun m!192857 () Bool)

(assert (=> start!16162 m!192857))

(check-sat (not mapNonEmpty!5819) (not b!161068) (not b!161066) (not b!161062) (not b!161060) (not b!161065) b_and!10047 (not b_next!3619) (not b!161067) tp_is_empty!3421 (not start!16162))
(check-sat b_and!10047 (not b_next!3619))
