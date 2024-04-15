; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21610 () Bool)

(assert start!21610)

(declare-fun b!216322 () Bool)

(declare-fun b_free!5755 () Bool)

(declare-fun b_next!5755 () Bool)

(assert (=> b!216322 (= b_free!5755 (not b_next!5755))))

(declare-fun tp!20400 () Bool)

(declare-fun b_and!12619 () Bool)

(assert (=> b!216322 (= tp!20400 b_and!12619)))

(declare-fun mapNonEmpty!9588 () Bool)

(declare-fun mapRes!9588 () Bool)

(declare-fun tp!20399 () Bool)

(declare-fun e!140738 () Bool)

(assert (=> mapNonEmpty!9588 (= mapRes!9588 (and tp!20399 e!140738))))

(declare-datatypes ((V!7137 0))(
  ( (V!7138 (val!2853 Int)) )
))
(declare-datatypes ((ValueCell!2465 0))(
  ( (ValueCellFull!2465 (v!4865 V!7137)) (EmptyCell!2465) )
))
(declare-datatypes ((array!10465 0))(
  ( (array!10466 (arr!4953 (Array (_ BitVec 32) ValueCell!2465)) (size!5286 (_ BitVec 32))) )
))
(declare-datatypes ((array!10467 0))(
  ( (array!10468 (arr!4954 (Array (_ BitVec 32) (_ BitVec 64))) (size!5287 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2830 0))(
  ( (LongMapFixedSize!2831 (defaultEntry!4065 Int) (mask!9801 (_ BitVec 32)) (extraKeys!3802 (_ BitVec 32)) (zeroValue!3906 V!7137) (minValue!3906 V!7137) (_size!1464 (_ BitVec 32)) (_keys!6113 array!10467) (_values!4048 array!10465) (_vacant!1464 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2830)

(declare-fun mapValue!9588 () ValueCell!2465)

(declare-fun mapKey!9588 () (_ BitVec 32))

(declare-fun mapRest!9588 () (Array (_ BitVec 32) ValueCell!2465))

(assert (=> mapNonEmpty!9588 (= (arr!4953 (_values!4048 thiss!1504)) (store mapRest!9588 mapKey!9588 mapValue!9588))))

(declare-fun mapIsEmpty!9588 () Bool)

(assert (=> mapIsEmpty!9588 mapRes!9588))

(declare-fun e!140741 () Bool)

(declare-fun tp_is_empty!5617 () Bool)

(declare-fun e!140737 () Bool)

(declare-fun array_inv!3257 (array!10467) Bool)

(declare-fun array_inv!3258 (array!10465) Bool)

(assert (=> b!216322 (= e!140737 (and tp!20400 tp_is_empty!5617 (array_inv!3257 (_keys!6113 thiss!1504)) (array_inv!3258 (_values!4048 thiss!1504)) e!140741))))

(declare-fun b!216323 () Bool)

(declare-fun e!140739 () Bool)

(assert (=> b!216323 (= e!140739 tp_is_empty!5617)))

(declare-fun b!216324 () Bool)

(assert (=> b!216324 (= e!140738 tp_is_empty!5617)))

(declare-fun b!216325 () Bool)

(declare-fun res!105758 () Bool)

(declare-fun e!140735 () Bool)

(assert (=> b!216325 (=> (not res!105758) (not e!140735))))

(assert (=> b!216325 (= res!105758 (and (= (size!5286 (_values!4048 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9801 thiss!1504))) (= (size!5287 (_keys!6113 thiss!1504)) (size!5286 (_values!4048 thiss!1504))) (bvsge (mask!9801 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3802 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3802 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216327 () Bool)

(declare-fun res!105759 () Bool)

(declare-fun e!140740 () Bool)

(assert (=> b!216327 (=> (not res!105759) (not e!140740))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216327 (= res!105759 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216328 () Bool)

(assert (=> b!216328 (= e!140735 false)))

(declare-fun lt!110990 () Bool)

(declare-datatypes ((List!3130 0))(
  ( (Nil!3127) (Cons!3126 (h!3773 (_ BitVec 64)) (t!8076 List!3130)) )
))
(declare-fun arrayNoDuplicates!0 (array!10467 (_ BitVec 32) List!3130) Bool)

(assert (=> b!216328 (= lt!110990 (arrayNoDuplicates!0 (_keys!6113 thiss!1504) #b00000000000000000000000000000000 Nil!3127))))

(declare-fun b!216329 () Bool)

(declare-fun res!105763 () Bool)

(assert (=> b!216329 (=> (not res!105763) (not e!140735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10467 (_ BitVec 32)) Bool)

(assert (=> b!216329 (= res!105763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6113 thiss!1504) (mask!9801 thiss!1504)))))

(declare-fun b!216330 () Bool)

(assert (=> b!216330 (= e!140740 e!140735)))

(declare-fun res!105762 () Bool)

(assert (=> b!216330 (=> (not res!105762) (not e!140735))))

(declare-datatypes ((SeekEntryResult!739 0))(
  ( (MissingZero!739 (index!5126 (_ BitVec 32))) (Found!739 (index!5127 (_ BitVec 32))) (Intermediate!739 (undefined!1551 Bool) (index!5128 (_ BitVec 32)) (x!22634 (_ BitVec 32))) (Undefined!739) (MissingVacant!739 (index!5129 (_ BitVec 32))) )
))
(declare-fun lt!110989 () SeekEntryResult!739)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216330 (= res!105762 (or (= lt!110989 (MissingZero!739 index!297)) (= lt!110989 (MissingVacant!739 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10467 (_ BitVec 32)) SeekEntryResult!739)

(assert (=> b!216330 (= lt!110989 (seekEntryOrOpen!0 key!932 (_keys!6113 thiss!1504) (mask!9801 thiss!1504)))))

(declare-fun b!216331 () Bool)

(assert (=> b!216331 (= e!140741 (and e!140739 mapRes!9588))))

(declare-fun condMapEmpty!9588 () Bool)

(declare-fun mapDefault!9588 () ValueCell!2465)

(assert (=> b!216331 (= condMapEmpty!9588 (= (arr!4953 (_values!4048 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2465)) mapDefault!9588)))))

(declare-fun b!216332 () Bool)

(declare-fun res!105757 () Bool)

(assert (=> b!216332 (=> (not res!105757) (not e!140735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216332 (= res!105757 (validMask!0 (mask!9801 thiss!1504)))))

(declare-fun b!216326 () Bool)

(declare-fun res!105761 () Bool)

(assert (=> b!216326 (=> (not res!105761) (not e!140735))))

(declare-datatypes ((tuple2!4208 0))(
  ( (tuple2!4209 (_1!2115 (_ BitVec 64)) (_2!2115 V!7137)) )
))
(declare-datatypes ((List!3131 0))(
  ( (Nil!3128) (Cons!3127 (h!3774 tuple2!4208) (t!8077 List!3131)) )
))
(declare-datatypes ((ListLongMap!3111 0))(
  ( (ListLongMap!3112 (toList!1571 List!3131)) )
))
(declare-fun contains!1412 (ListLongMap!3111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1080 (array!10467 array!10465 (_ BitVec 32) (_ BitVec 32) V!7137 V!7137 (_ BitVec 32) Int) ListLongMap!3111)

(assert (=> b!216326 (= res!105761 (contains!1412 (getCurrentListMap!1080 (_keys!6113 thiss!1504) (_values!4048 thiss!1504) (mask!9801 thiss!1504) (extraKeys!3802 thiss!1504) (zeroValue!3906 thiss!1504) (minValue!3906 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4065 thiss!1504)) key!932))))

(declare-fun res!105760 () Bool)

(assert (=> start!21610 (=> (not res!105760) (not e!140740))))

(declare-fun valid!1167 (LongMapFixedSize!2830) Bool)

(assert (=> start!21610 (= res!105760 (valid!1167 thiss!1504))))

(assert (=> start!21610 e!140740))

(assert (=> start!21610 e!140737))

(assert (=> start!21610 true))

(assert (= (and start!21610 res!105760) b!216327))

(assert (= (and b!216327 res!105759) b!216330))

(assert (= (and b!216330 res!105762) b!216326))

(assert (= (and b!216326 res!105761) b!216332))

(assert (= (and b!216332 res!105757) b!216325))

(assert (= (and b!216325 res!105758) b!216329))

(assert (= (and b!216329 res!105763) b!216328))

(assert (= (and b!216331 condMapEmpty!9588) mapIsEmpty!9588))

(assert (= (and b!216331 (not condMapEmpty!9588)) mapNonEmpty!9588))

(get-info :version)

(assert (= (and mapNonEmpty!9588 ((_ is ValueCellFull!2465) mapValue!9588)) b!216324))

(assert (= (and b!216331 ((_ is ValueCellFull!2465) mapDefault!9588)) b!216323))

(assert (= b!216322 b!216331))

(assert (= start!21610 b!216322))

(declare-fun m!242553 () Bool)

(assert (=> b!216326 m!242553))

(assert (=> b!216326 m!242553))

(declare-fun m!242555 () Bool)

(assert (=> b!216326 m!242555))

(declare-fun m!242557 () Bool)

(assert (=> start!21610 m!242557))

(declare-fun m!242559 () Bool)

(assert (=> b!216332 m!242559))

(declare-fun m!242561 () Bool)

(assert (=> b!216328 m!242561))

(declare-fun m!242563 () Bool)

(assert (=> b!216322 m!242563))

(declare-fun m!242565 () Bool)

(assert (=> b!216322 m!242565))

(declare-fun m!242567 () Bool)

(assert (=> mapNonEmpty!9588 m!242567))

(declare-fun m!242569 () Bool)

(assert (=> b!216329 m!242569))

(declare-fun m!242571 () Bool)

(assert (=> b!216330 m!242571))

(check-sat (not b!216322) (not mapNonEmpty!9588) (not b!216332) (not b!216330) (not b!216326) (not b!216329) b_and!12619 tp_is_empty!5617 (not start!21610) (not b_next!5755) (not b!216328))
(check-sat b_and!12619 (not b_next!5755))
