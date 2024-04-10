; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16100 () Bool)

(assert start!16100)

(declare-fun b!160056 () Bool)

(declare-fun b_free!3561 () Bool)

(declare-fun b_next!3561 () Bool)

(assert (=> b!160056 (= b_free!3561 (not b_next!3561))))

(declare-fun tp!13252 () Bool)

(declare-fun b_and!9975 () Bool)

(assert (=> b!160056 (= tp!13252 b_and!9975)))

(declare-fun e!104696 () Bool)

(declare-fun tp_is_empty!3363 () Bool)

(declare-datatypes ((V!4131 0))(
  ( (V!4132 (val!1726 Int)) )
))
(declare-datatypes ((ValueCell!1338 0))(
  ( (ValueCellFull!1338 (v!3591 V!4131)) (EmptyCell!1338) )
))
(declare-datatypes ((array!5805 0))(
  ( (array!5806 (arr!2747 (Array (_ BitVec 32) (_ BitVec 64))) (size!3031 (_ BitVec 32))) )
))
(declare-datatypes ((array!5807 0))(
  ( (array!5808 (arr!2748 (Array (_ BitVec 32) ValueCell!1338)) (size!3032 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1584 0))(
  ( (LongMapFixedSize!1585 (defaultEntry!3234 Int) (mask!7796 (_ BitVec 32)) (extraKeys!2975 (_ BitVec 32)) (zeroValue!3077 V!4131) (minValue!3077 V!4131) (_size!841 (_ BitVec 32)) (_keys!5035 array!5805) (_values!3217 array!5807) (_vacant!841 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1584)

(declare-fun e!104700 () Bool)

(declare-fun array_inv!1749 (array!5805) Bool)

(declare-fun array_inv!1750 (array!5807) Bool)

(assert (=> b!160056 (= e!104696 (and tp!13252 tp_is_empty!3363 (array_inv!1749 (_keys!5035 thiss!1248)) (array_inv!1750 (_values!3217 thiss!1248)) e!104700))))

(declare-fun b!160057 () Bool)

(declare-fun res!75724 () Bool)

(declare-fun e!104699 () Bool)

(assert (=> b!160057 (=> (not res!75724) (not e!104699))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160057 (= res!75724 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160058 () Bool)

(declare-fun res!75726 () Bool)

(assert (=> b!160058 (=> (not res!75726) (not e!104699))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!323 0))(
  ( (MissingZero!323 (index!3460 (_ BitVec 32))) (Found!323 (index!3461 (_ BitVec 32))) (Intermediate!323 (undefined!1135 Bool) (index!3462 (_ BitVec 32)) (x!17667 (_ BitVec 32))) (Undefined!323) (MissingVacant!323 (index!3463 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5805 (_ BitVec 32)) SeekEntryResult!323)

(assert (=> b!160058 (= res!75726 ((_ is Undefined!323) (seekEntryOrOpen!0 key!828 (_keys!5035 thiss!1248) (mask!7796 thiss!1248))))))

(declare-fun mapIsEmpty!5732 () Bool)

(declare-fun mapRes!5732 () Bool)

(assert (=> mapIsEmpty!5732 mapRes!5732))

(declare-fun b!160060 () Bool)

(declare-fun e!104695 () Bool)

(assert (=> b!160060 (= e!104695 tp_is_empty!3363)))

(declare-fun b!160061 () Bool)

(declare-fun e!104698 () Bool)

(assert (=> b!160061 (= e!104698 tp_is_empty!3363)))

(declare-fun b!160062 () Bool)

(declare-fun res!75725 () Bool)

(assert (=> b!160062 (=> (not res!75725) (not e!104699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160062 (= res!75725 (validMask!0 (mask!7796 thiss!1248)))))

(declare-fun b!160063 () Bool)

(assert (=> b!160063 (= e!104700 (and e!104698 mapRes!5732))))

(declare-fun condMapEmpty!5732 () Bool)

(declare-fun mapDefault!5732 () ValueCell!1338)

(assert (=> b!160063 (= condMapEmpty!5732 (= (arr!2748 (_values!3217 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1338)) mapDefault!5732)))))

(declare-fun b!160064 () Bool)

(declare-fun res!75727 () Bool)

(assert (=> b!160064 (=> (not res!75727) (not e!104699))))

(assert (=> b!160064 (= res!75727 (and (= (size!3032 (_values!3217 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7796 thiss!1248))) (= (size!3031 (_keys!5035 thiss!1248)) (size!3032 (_values!3217 thiss!1248))) (bvsge (mask!7796 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2975 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2975 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!5732 () Bool)

(declare-fun tp!13253 () Bool)

(assert (=> mapNonEmpty!5732 (= mapRes!5732 (and tp!13253 e!104695))))

(declare-fun mapRest!5732 () (Array (_ BitVec 32) ValueCell!1338))

(declare-fun mapValue!5732 () ValueCell!1338)

(declare-fun mapKey!5732 () (_ BitVec 32))

(assert (=> mapNonEmpty!5732 (= (arr!2748 (_values!3217 thiss!1248)) (store mapRest!5732 mapKey!5732 mapValue!5732))))

(declare-fun b!160059 () Bool)

(assert (=> b!160059 (= e!104699 false)))

(declare-fun lt!82054 () Bool)

(declare-datatypes ((List!1928 0))(
  ( (Nil!1925) (Cons!1924 (h!2537 (_ BitVec 64)) (t!6730 List!1928)) )
))
(declare-fun arrayNoDuplicates!0 (array!5805 (_ BitVec 32) List!1928) Bool)

(assert (=> b!160059 (= lt!82054 (arrayNoDuplicates!0 (_keys!5035 thiss!1248) #b00000000000000000000000000000000 Nil!1925))))

(declare-fun res!75722 () Bool)

(assert (=> start!16100 (=> (not res!75722) (not e!104699))))

(declare-fun valid!737 (LongMapFixedSize!1584) Bool)

(assert (=> start!16100 (= res!75722 (valid!737 thiss!1248))))

(assert (=> start!16100 e!104699))

(assert (=> start!16100 e!104696))

(assert (=> start!16100 true))

(declare-fun b!160065 () Bool)

(declare-fun res!75723 () Bool)

(assert (=> b!160065 (=> (not res!75723) (not e!104699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5805 (_ BitVec 32)) Bool)

(assert (=> b!160065 (= res!75723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5035 thiss!1248) (mask!7796 thiss!1248)))))

(declare-fun b!160066 () Bool)

(declare-fun res!75728 () Bool)

(assert (=> b!160066 (=> (not res!75728) (not e!104699))))

(declare-datatypes ((tuple2!2906 0))(
  ( (tuple2!2907 (_1!1464 (_ BitVec 64)) (_2!1464 V!4131)) )
))
(declare-datatypes ((List!1929 0))(
  ( (Nil!1926) (Cons!1925 (h!2538 tuple2!2906) (t!6731 List!1929)) )
))
(declare-datatypes ((ListLongMap!1893 0))(
  ( (ListLongMap!1894 (toList!962 List!1929)) )
))
(declare-fun contains!998 (ListLongMap!1893 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!626 (array!5805 array!5807 (_ BitVec 32) (_ BitVec 32) V!4131 V!4131 (_ BitVec 32) Int) ListLongMap!1893)

(assert (=> b!160066 (= res!75728 (contains!998 (getCurrentListMap!626 (_keys!5035 thiss!1248) (_values!3217 thiss!1248) (mask!7796 thiss!1248) (extraKeys!2975 thiss!1248) (zeroValue!3077 thiss!1248) (minValue!3077 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3234 thiss!1248)) key!828))))

(assert (= (and start!16100 res!75722) b!160057))

(assert (= (and b!160057 res!75724) b!160058))

(assert (= (and b!160058 res!75726) b!160066))

(assert (= (and b!160066 res!75728) b!160062))

(assert (= (and b!160062 res!75725) b!160064))

(assert (= (and b!160064 res!75727) b!160065))

(assert (= (and b!160065 res!75723) b!160059))

(assert (= (and b!160063 condMapEmpty!5732) mapIsEmpty!5732))

(assert (= (and b!160063 (not condMapEmpty!5732)) mapNonEmpty!5732))

(assert (= (and mapNonEmpty!5732 ((_ is ValueCellFull!1338) mapValue!5732)) b!160060))

(assert (= (and b!160063 ((_ is ValueCellFull!1338) mapDefault!5732)) b!160061))

(assert (= b!160056 b!160063))

(assert (= start!16100 b!160056))

(declare-fun m!192077 () Bool)

(assert (=> b!160059 m!192077))

(declare-fun m!192079 () Bool)

(assert (=> b!160056 m!192079))

(declare-fun m!192081 () Bool)

(assert (=> b!160056 m!192081))

(declare-fun m!192083 () Bool)

(assert (=> b!160058 m!192083))

(declare-fun m!192085 () Bool)

(assert (=> b!160065 m!192085))

(declare-fun m!192087 () Bool)

(assert (=> mapNonEmpty!5732 m!192087))

(declare-fun m!192089 () Bool)

(assert (=> start!16100 m!192089))

(declare-fun m!192091 () Bool)

(assert (=> b!160066 m!192091))

(assert (=> b!160066 m!192091))

(declare-fun m!192093 () Bool)

(assert (=> b!160066 m!192093))

(declare-fun m!192095 () Bool)

(assert (=> b!160062 m!192095))

(check-sat (not b!160056) (not b_next!3561) (not start!16100) (not b!160066) b_and!9975 (not b!160058) (not b!160059) (not b!160065) (not mapNonEmpty!5732) tp_is_empty!3363 (not b!160062))
(check-sat b_and!9975 (not b_next!3561))
