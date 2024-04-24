; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21634 () Bool)

(assert start!21634)

(declare-fun b!216922 () Bool)

(declare-fun b_free!5779 () Bool)

(declare-fun b_next!5779 () Bool)

(assert (=> b!216922 (= b_free!5779 (not b_next!5779))))

(declare-fun tp!20471 () Bool)

(declare-fun b_and!12683 () Bool)

(assert (=> b!216922 (= tp!20471 b_and!12683)))

(declare-fun b!216912 () Bool)

(declare-fun e!141114 () Bool)

(declare-fun e!141112 () Bool)

(assert (=> b!216912 (= e!141114 e!141112)))

(declare-fun res!106129 () Bool)

(assert (=> b!216912 (=> (not res!106129) (not e!141112))))

(declare-datatypes ((SeekEntryResult!737 0))(
  ( (MissingZero!737 (index!5118 (_ BitVec 32))) (Found!737 (index!5119 (_ BitVec 32))) (Intermediate!737 (undefined!1549 Bool) (index!5120 (_ BitVec 32)) (x!22665 (_ BitVec 32))) (Undefined!737) (MissingVacant!737 (index!5121 (_ BitVec 32))) )
))
(declare-fun lt!111301 () SeekEntryResult!737)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216912 (= res!106129 (or (= lt!111301 (MissingZero!737 index!297)) (= lt!111301 (MissingVacant!737 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7169 0))(
  ( (V!7170 (val!2865 Int)) )
))
(declare-datatypes ((ValueCell!2477 0))(
  ( (ValueCellFull!2477 (v!4884 V!7169)) (EmptyCell!2477) )
))
(declare-datatypes ((array!10519 0))(
  ( (array!10520 (arr!4981 (Array (_ BitVec 32) ValueCell!2477)) (size!5313 (_ BitVec 32))) )
))
(declare-datatypes ((array!10521 0))(
  ( (array!10522 (arr!4982 (Array (_ BitVec 32) (_ BitVec 64))) (size!5314 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2854 0))(
  ( (LongMapFixedSize!2855 (defaultEntry!4077 Int) (mask!9822 (_ BitVec 32)) (extraKeys!3814 (_ BitVec 32)) (zeroValue!3918 V!7169) (minValue!3918 V!7169) (_size!1476 (_ BitVec 32)) (_keys!6126 array!10521) (_values!4060 array!10519) (_vacant!1476 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2854)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10521 (_ BitVec 32)) SeekEntryResult!737)

(assert (=> b!216912 (= lt!111301 (seekEntryOrOpen!0 key!932 (_keys!6126 thiss!1504) (mask!9822 thiss!1504)))))

(declare-fun b!216913 () Bool)

(declare-fun e!141117 () Bool)

(declare-fun e!141113 () Bool)

(declare-fun mapRes!9624 () Bool)

(assert (=> b!216913 (= e!141117 (and e!141113 mapRes!9624))))

(declare-fun condMapEmpty!9624 () Bool)

(declare-fun mapDefault!9624 () ValueCell!2477)

(assert (=> b!216913 (= condMapEmpty!9624 (= (arr!4981 (_values!4060 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2477)) mapDefault!9624)))))

(declare-fun b!216914 () Bool)

(declare-fun e!141118 () Bool)

(declare-fun tp_is_empty!5641 () Bool)

(assert (=> b!216914 (= e!141118 tp_is_empty!5641)))

(declare-fun b!216915 () Bool)

(assert (=> b!216915 (= e!141113 tp_is_empty!5641)))

(declare-fun mapIsEmpty!9624 () Bool)

(assert (=> mapIsEmpty!9624 mapRes!9624))

(declare-fun res!106127 () Bool)

(assert (=> start!21634 (=> (not res!106127) (not e!141114))))

(declare-fun valid!1178 (LongMapFixedSize!2854) Bool)

(assert (=> start!21634 (= res!106127 (valid!1178 thiss!1504))))

(assert (=> start!21634 e!141114))

(declare-fun e!141116 () Bool)

(assert (=> start!21634 e!141116))

(assert (=> start!21634 true))

(declare-fun b!216916 () Bool)

(assert (=> b!216916 (= e!141112 false)))

(declare-fun lt!111302 () Bool)

(declare-datatypes ((List!3088 0))(
  ( (Nil!3085) (Cons!3084 (h!3731 (_ BitVec 64)) (t!8035 List!3088)) )
))
(declare-fun arrayNoDuplicates!0 (array!10521 (_ BitVec 32) List!3088) Bool)

(assert (=> b!216916 (= lt!111302 (arrayNoDuplicates!0 (_keys!6126 thiss!1504) #b00000000000000000000000000000000 Nil!3085))))

(declare-fun b!216917 () Bool)

(declare-fun res!106131 () Bool)

(assert (=> b!216917 (=> (not res!106131) (not e!141112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216917 (= res!106131 (validMask!0 (mask!9822 thiss!1504)))))

(declare-fun b!216918 () Bool)

(declare-fun res!106126 () Bool)

(assert (=> b!216918 (=> (not res!106126) (not e!141112))))

(declare-datatypes ((tuple2!4186 0))(
  ( (tuple2!4187 (_1!2104 (_ BitVec 64)) (_2!2104 V!7169)) )
))
(declare-datatypes ((List!3089 0))(
  ( (Nil!3086) (Cons!3085 (h!3732 tuple2!4186) (t!8036 List!3089)) )
))
(declare-datatypes ((ListLongMap!3101 0))(
  ( (ListLongMap!3102 (toList!1566 List!3089)) )
))
(declare-fun contains!1421 (ListLongMap!3101 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1098 (array!10521 array!10519 (_ BitVec 32) (_ BitVec 32) V!7169 V!7169 (_ BitVec 32) Int) ListLongMap!3101)

(assert (=> b!216918 (= res!106126 (contains!1421 (getCurrentListMap!1098 (_keys!6126 thiss!1504) (_values!4060 thiss!1504) (mask!9822 thiss!1504) (extraKeys!3814 thiss!1504) (zeroValue!3918 thiss!1504) (minValue!3918 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4077 thiss!1504)) key!932))))

(declare-fun b!216919 () Bool)

(declare-fun res!106130 () Bool)

(assert (=> b!216919 (=> (not res!106130) (not e!141114))))

(assert (=> b!216919 (= res!106130 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216920 () Bool)

(declare-fun res!106125 () Bool)

(assert (=> b!216920 (=> (not res!106125) (not e!141112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10521 (_ BitVec 32)) Bool)

(assert (=> b!216920 (= res!106125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6126 thiss!1504) (mask!9822 thiss!1504)))))

(declare-fun b!216921 () Bool)

(declare-fun res!106128 () Bool)

(assert (=> b!216921 (=> (not res!106128) (not e!141112))))

(assert (=> b!216921 (= res!106128 (and (= (size!5313 (_values!4060 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9822 thiss!1504))) (= (size!5314 (_keys!6126 thiss!1504)) (size!5313 (_values!4060 thiss!1504))) (bvsge (mask!9822 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3814 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3814 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9624 () Bool)

(declare-fun tp!20472 () Bool)

(assert (=> mapNonEmpty!9624 (= mapRes!9624 (and tp!20472 e!141118))))

(declare-fun mapKey!9624 () (_ BitVec 32))

(declare-fun mapRest!9624 () (Array (_ BitVec 32) ValueCell!2477))

(declare-fun mapValue!9624 () ValueCell!2477)

(assert (=> mapNonEmpty!9624 (= (arr!4981 (_values!4060 thiss!1504)) (store mapRest!9624 mapKey!9624 mapValue!9624))))

(declare-fun array_inv!3271 (array!10521) Bool)

(declare-fun array_inv!3272 (array!10519) Bool)

(assert (=> b!216922 (= e!141116 (and tp!20471 tp_is_empty!5641 (array_inv!3271 (_keys!6126 thiss!1504)) (array_inv!3272 (_values!4060 thiss!1504)) e!141117))))

(assert (= (and start!21634 res!106127) b!216919))

(assert (= (and b!216919 res!106130) b!216912))

(assert (= (and b!216912 res!106129) b!216918))

(assert (= (and b!216918 res!106126) b!216917))

(assert (= (and b!216917 res!106131) b!216921))

(assert (= (and b!216921 res!106128) b!216920))

(assert (= (and b!216920 res!106125) b!216916))

(assert (= (and b!216913 condMapEmpty!9624) mapIsEmpty!9624))

(assert (= (and b!216913 (not condMapEmpty!9624)) mapNonEmpty!9624))

(get-info :version)

(assert (= (and mapNonEmpty!9624 ((_ is ValueCellFull!2477) mapValue!9624)) b!216914))

(assert (= (and b!216913 ((_ is ValueCellFull!2477) mapDefault!9624)) b!216915))

(assert (= b!216922 b!216913))

(assert (= start!21634 b!216922))

(declare-fun m!243591 () Bool)

(assert (=> b!216912 m!243591))

(declare-fun m!243593 () Bool)

(assert (=> b!216917 m!243593))

(declare-fun m!243595 () Bool)

(assert (=> b!216920 m!243595))

(declare-fun m!243597 () Bool)

(assert (=> start!21634 m!243597))

(declare-fun m!243599 () Bool)

(assert (=> mapNonEmpty!9624 m!243599))

(declare-fun m!243601 () Bool)

(assert (=> b!216916 m!243601))

(declare-fun m!243603 () Bool)

(assert (=> b!216922 m!243603))

(declare-fun m!243605 () Bool)

(assert (=> b!216922 m!243605))

(declare-fun m!243607 () Bool)

(assert (=> b!216918 m!243607))

(assert (=> b!216918 m!243607))

(declare-fun m!243609 () Bool)

(assert (=> b!216918 m!243609))

(check-sat (not b!216916) (not b!216917) (not start!21634) tp_is_empty!5641 (not b!216912) (not b!216920) (not b!216918) (not b!216922) b_and!12683 (not mapNonEmpty!9624) (not b_next!5779))
(check-sat b_and!12683 (not b_next!5779))
