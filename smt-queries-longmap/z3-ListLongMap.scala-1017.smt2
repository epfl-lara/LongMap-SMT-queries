; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21706 () Bool)

(assert start!21706)

(declare-fun b!218102 () Bool)

(declare-fun b_free!5851 () Bool)

(declare-fun b_next!5851 () Bool)

(assert (=> b!218102 (= b_free!5851 (not b_next!5851))))

(declare-fun tp!20688 () Bool)

(declare-fun b_and!12755 () Bool)

(assert (=> b!218102 (= tp!20688 b_and!12755)))

(declare-fun b!218100 () Bool)

(declare-fun e!141868 () Bool)

(declare-fun tp_is_empty!5713 () Bool)

(assert (=> b!218100 (= e!141868 tp_is_empty!5713)))

(declare-fun b!218101 () Bool)

(declare-fun e!141870 () Bool)

(declare-fun mapRes!9732 () Bool)

(assert (=> b!218101 (= e!141870 (and e!141868 mapRes!9732))))

(declare-fun condMapEmpty!9732 () Bool)

(declare-datatypes ((V!7265 0))(
  ( (V!7266 (val!2901 Int)) )
))
(declare-datatypes ((ValueCell!2513 0))(
  ( (ValueCellFull!2513 (v!4920 V!7265)) (EmptyCell!2513) )
))
(declare-datatypes ((array!10663 0))(
  ( (array!10664 (arr!5053 (Array (_ BitVec 32) ValueCell!2513)) (size!5385 (_ BitVec 32))) )
))
(declare-datatypes ((array!10665 0))(
  ( (array!10666 (arr!5054 (Array (_ BitVec 32) (_ BitVec 64))) (size!5386 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2926 0))(
  ( (LongMapFixedSize!2927 (defaultEntry!4113 Int) (mask!9882 (_ BitVec 32)) (extraKeys!3850 (_ BitVec 32)) (zeroValue!3954 V!7265) (minValue!3954 V!7265) (_size!1512 (_ BitVec 32)) (_keys!6162 array!10665) (_values!4096 array!10663) (_vacant!1512 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2926)

(declare-fun mapDefault!9732 () ValueCell!2513)

(assert (=> b!218101 (= condMapEmpty!9732 (= (arr!5053 (_values!4096 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2513)) mapDefault!9732)))))

(declare-fun e!141873 () Bool)

(declare-fun array_inv!3321 (array!10665) Bool)

(declare-fun array_inv!3322 (array!10663) Bool)

(assert (=> b!218102 (= e!141873 (and tp!20688 tp_is_empty!5713 (array_inv!3321 (_keys!6162 thiss!1504)) (array_inv!3322 (_values!4096 thiss!1504)) e!141870))))

(declare-fun b!218103 () Bool)

(declare-fun res!106886 () Bool)

(declare-fun e!141871 () Bool)

(assert (=> b!218103 (=> (not res!106886) (not e!141871))))

(assert (=> b!218103 (= res!106886 (and (= (size!5385 (_values!4096 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9882 thiss!1504))) (= (size!5386 (_keys!6162 thiss!1504)) (size!5385 (_values!4096 thiss!1504))) (bvsge (mask!9882 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3850 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3850 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!218104 () Bool)

(declare-fun res!106881 () Bool)

(assert (=> b!218104 (=> (not res!106881) (not e!141871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10665 (_ BitVec 32)) Bool)

(assert (=> b!218104 (= res!106881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6162 thiss!1504) (mask!9882 thiss!1504)))))

(declare-fun b!218105 () Bool)

(declare-fun res!106882 () Bool)

(declare-fun e!141872 () Bool)

(assert (=> b!218105 (=> (not res!106882) (not e!141872))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!218105 (= res!106882 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!9732 () Bool)

(assert (=> mapIsEmpty!9732 mapRes!9732))

(declare-fun b!218106 () Bool)

(assert (=> b!218106 (= e!141872 e!141871)))

(declare-fun res!106887 () Bool)

(assert (=> b!218106 (=> (not res!106887) (not e!141871))))

(declare-datatypes ((SeekEntryResult!759 0))(
  ( (MissingZero!759 (index!5206 (_ BitVec 32))) (Found!759 (index!5207 (_ BitVec 32))) (Intermediate!759 (undefined!1571 Bool) (index!5208 (_ BitVec 32)) (x!22783 (_ BitVec 32))) (Undefined!759) (MissingVacant!759 (index!5209 (_ BitVec 32))) )
))
(declare-fun lt!111517 () SeekEntryResult!759)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218106 (= res!106887 (or (= lt!111517 (MissingZero!759 index!297)) (= lt!111517 (MissingVacant!759 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10665 (_ BitVec 32)) SeekEntryResult!759)

(assert (=> b!218106 (= lt!111517 (seekEntryOrOpen!0 key!932 (_keys!6162 thiss!1504) (mask!9882 thiss!1504)))))

(declare-fun res!106885 () Bool)

(assert (=> start!21706 (=> (not res!106885) (not e!141872))))

(declare-fun valid!1200 (LongMapFixedSize!2926) Bool)

(assert (=> start!21706 (= res!106885 (valid!1200 thiss!1504))))

(assert (=> start!21706 e!141872))

(assert (=> start!21706 e!141873))

(assert (=> start!21706 true))

(declare-fun b!218107 () Bool)

(declare-fun res!106884 () Bool)

(assert (=> b!218107 (=> (not res!106884) (not e!141871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218107 (= res!106884 (validMask!0 (mask!9882 thiss!1504)))))

(declare-fun b!218108 () Bool)

(declare-fun e!141869 () Bool)

(assert (=> b!218108 (= e!141869 tp_is_empty!5713)))

(declare-fun b!218109 () Bool)

(declare-fun res!106883 () Bool)

(assert (=> b!218109 (=> (not res!106883) (not e!141871))))

(declare-datatypes ((tuple2!4232 0))(
  ( (tuple2!4233 (_1!2127 (_ BitVec 64)) (_2!2127 V!7265)) )
))
(declare-datatypes ((List!3133 0))(
  ( (Nil!3130) (Cons!3129 (h!3776 tuple2!4232) (t!8080 List!3133)) )
))
(declare-datatypes ((ListLongMap!3147 0))(
  ( (ListLongMap!3148 (toList!1589 List!3133)) )
))
(declare-fun contains!1444 (ListLongMap!3147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1121 (array!10665 array!10663 (_ BitVec 32) (_ BitVec 32) V!7265 V!7265 (_ BitVec 32) Int) ListLongMap!3147)

(assert (=> b!218109 (= res!106883 (not (contains!1444 (getCurrentListMap!1121 (_keys!6162 thiss!1504) (_values!4096 thiss!1504) (mask!9882 thiss!1504) (extraKeys!3850 thiss!1504) (zeroValue!3954 thiss!1504) (minValue!3954 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4113 thiss!1504)) key!932)))))

(declare-fun b!218110 () Bool)

(assert (=> b!218110 (= e!141871 false)))

(declare-fun lt!111518 () Bool)

(declare-datatypes ((List!3134 0))(
  ( (Nil!3131) (Cons!3130 (h!3777 (_ BitVec 64)) (t!8081 List!3134)) )
))
(declare-fun arrayNoDuplicates!0 (array!10665 (_ BitVec 32) List!3134) Bool)

(assert (=> b!218110 (= lt!111518 (arrayNoDuplicates!0 (_keys!6162 thiss!1504) #b00000000000000000000000000000000 Nil!3131))))

(declare-fun mapNonEmpty!9732 () Bool)

(declare-fun tp!20687 () Bool)

(assert (=> mapNonEmpty!9732 (= mapRes!9732 (and tp!20687 e!141869))))

(declare-fun mapValue!9732 () ValueCell!2513)

(declare-fun mapKey!9732 () (_ BitVec 32))

(declare-fun mapRest!9732 () (Array (_ BitVec 32) ValueCell!2513))

(assert (=> mapNonEmpty!9732 (= (arr!5053 (_values!4096 thiss!1504)) (store mapRest!9732 mapKey!9732 mapValue!9732))))

(assert (= (and start!21706 res!106885) b!218105))

(assert (= (and b!218105 res!106882) b!218106))

(assert (= (and b!218106 res!106887) b!218109))

(assert (= (and b!218109 res!106883) b!218107))

(assert (= (and b!218107 res!106884) b!218103))

(assert (= (and b!218103 res!106886) b!218104))

(assert (= (and b!218104 res!106881) b!218110))

(assert (= (and b!218101 condMapEmpty!9732) mapIsEmpty!9732))

(assert (= (and b!218101 (not condMapEmpty!9732)) mapNonEmpty!9732))

(get-info :version)

(assert (= (and mapNonEmpty!9732 ((_ is ValueCellFull!2513) mapValue!9732)) b!218108))

(assert (= (and b!218101 ((_ is ValueCellFull!2513) mapDefault!9732)) b!218100))

(assert (= b!218102 b!218101))

(assert (= start!21706 b!218102))

(declare-fun m!244311 () Bool)

(assert (=> mapNonEmpty!9732 m!244311))

(declare-fun m!244313 () Bool)

(assert (=> b!218107 m!244313))

(declare-fun m!244315 () Bool)

(assert (=> b!218110 m!244315))

(declare-fun m!244317 () Bool)

(assert (=> b!218104 m!244317))

(declare-fun m!244319 () Bool)

(assert (=> b!218106 m!244319))

(declare-fun m!244321 () Bool)

(assert (=> b!218102 m!244321))

(declare-fun m!244323 () Bool)

(assert (=> b!218102 m!244323))

(declare-fun m!244325 () Bool)

(assert (=> b!218109 m!244325))

(assert (=> b!218109 m!244325))

(declare-fun m!244327 () Bool)

(assert (=> b!218109 m!244327))

(declare-fun m!244329 () Bool)

(assert (=> start!21706 m!244329))

(check-sat (not b!218109) tp_is_empty!5713 b_and!12755 (not b_next!5851) (not b!218110) (not mapNonEmpty!9732) (not b!218106) (not b!218104) (not b!218107) (not start!21706) (not b!218102))
(check-sat b_and!12755 (not b_next!5851))
