; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21634 () Bool)

(assert start!21634)

(declare-fun b!216722 () Bool)

(declare-fun b_free!5779 () Bool)

(declare-fun b_next!5779 () Bool)

(assert (=> b!216722 (= b_free!5779 (not b_next!5779))))

(declare-fun tp!20471 () Bool)

(declare-fun b_and!12643 () Bool)

(assert (=> b!216722 (= tp!20471 b_and!12643)))

(declare-fun b!216718 () Bool)

(declare-fun res!106010 () Bool)

(declare-fun e!140988 () Bool)

(assert (=> b!216718 (=> (not res!106010) (not e!140988))))

(declare-datatypes ((V!7169 0))(
  ( (V!7170 (val!2865 Int)) )
))
(declare-datatypes ((ValueCell!2477 0))(
  ( (ValueCellFull!2477 (v!4877 V!7169)) (EmptyCell!2477) )
))
(declare-datatypes ((array!10513 0))(
  ( (array!10514 (arr!4977 (Array (_ BitVec 32) ValueCell!2477)) (size!5310 (_ BitVec 32))) )
))
(declare-datatypes ((array!10515 0))(
  ( (array!10516 (arr!4978 (Array (_ BitVec 32) (_ BitVec 64))) (size!5311 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2854 0))(
  ( (LongMapFixedSize!2855 (defaultEntry!4077 Int) (mask!9821 (_ BitVec 32)) (extraKeys!3814 (_ BitVec 32)) (zeroValue!3918 V!7169) (minValue!3918 V!7169) (_size!1476 (_ BitVec 32)) (_keys!6125 array!10515) (_values!4060 array!10513) (_vacant!1476 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2854)

(assert (=> b!216718 (= res!106010 (and (= (size!5310 (_values!4060 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9821 thiss!1504))) (= (size!5311 (_keys!6125 thiss!1504)) (size!5310 (_values!4060 thiss!1504))) (bvsge (mask!9821 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3814 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3814 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216719 () Bool)

(declare-fun res!106015 () Bool)

(assert (=> b!216719 (=> (not res!106015) (not e!140988))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4224 0))(
  ( (tuple2!4225 (_1!2123 (_ BitVec 64)) (_2!2123 V!7169)) )
))
(declare-datatypes ((List!3149 0))(
  ( (Nil!3146) (Cons!3145 (h!3792 tuple2!4224) (t!8095 List!3149)) )
))
(declare-datatypes ((ListLongMap!3127 0))(
  ( (ListLongMap!3128 (toList!1579 List!3149)) )
))
(declare-fun contains!1420 (ListLongMap!3127 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1088 (array!10515 array!10513 (_ BitVec 32) (_ BitVec 32) V!7169 V!7169 (_ BitVec 32) Int) ListLongMap!3127)

(assert (=> b!216719 (= res!106015 (contains!1420 (getCurrentListMap!1088 (_keys!6125 thiss!1504) (_values!4060 thiss!1504) (mask!9821 thiss!1504) (extraKeys!3814 thiss!1504) (zeroValue!3918 thiss!1504) (minValue!3918 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4077 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!9624 () Bool)

(declare-fun mapRes!9624 () Bool)

(assert (=> mapIsEmpty!9624 mapRes!9624))

(declare-fun b!216720 () Bool)

(assert (=> b!216720 (= e!140988 false)))

(declare-fun lt!111062 () Bool)

(declare-datatypes ((List!3150 0))(
  ( (Nil!3147) (Cons!3146 (h!3793 (_ BitVec 64)) (t!8096 List!3150)) )
))
(declare-fun arrayNoDuplicates!0 (array!10515 (_ BitVec 32) List!3150) Bool)

(assert (=> b!216720 (= lt!111062 (arrayNoDuplicates!0 (_keys!6125 thiss!1504) #b00000000000000000000000000000000 Nil!3147))))

(declare-fun b!216721 () Bool)

(declare-fun res!106014 () Bool)

(declare-fun e!140989 () Bool)

(assert (=> b!216721 (=> (not res!106014) (not e!140989))))

(assert (=> b!216721 (= res!106014 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!5641 () Bool)

(declare-fun e!140993 () Bool)

(declare-fun e!140990 () Bool)

(declare-fun array_inv!3277 (array!10515) Bool)

(declare-fun array_inv!3278 (array!10513) Bool)

(assert (=> b!216722 (= e!140990 (and tp!20471 tp_is_empty!5641 (array_inv!3277 (_keys!6125 thiss!1504)) (array_inv!3278 (_values!4060 thiss!1504)) e!140993))))

(declare-fun res!106011 () Bool)

(assert (=> start!21634 (=> (not res!106011) (not e!140989))))

(declare-fun valid!1176 (LongMapFixedSize!2854) Bool)

(assert (=> start!21634 (= res!106011 (valid!1176 thiss!1504))))

(assert (=> start!21634 e!140989))

(assert (=> start!21634 e!140990))

(assert (=> start!21634 true))

(declare-fun b!216723 () Bool)

(declare-fun res!106009 () Bool)

(assert (=> b!216723 (=> (not res!106009) (not e!140988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216723 (= res!106009 (validMask!0 (mask!9821 thiss!1504)))))

(declare-fun mapNonEmpty!9624 () Bool)

(declare-fun tp!20472 () Bool)

(declare-fun e!140991 () Bool)

(assert (=> mapNonEmpty!9624 (= mapRes!9624 (and tp!20472 e!140991))))

(declare-fun mapValue!9624 () ValueCell!2477)

(declare-fun mapRest!9624 () (Array (_ BitVec 32) ValueCell!2477))

(declare-fun mapKey!9624 () (_ BitVec 32))

(assert (=> mapNonEmpty!9624 (= (arr!4977 (_values!4060 thiss!1504)) (store mapRest!9624 mapKey!9624 mapValue!9624))))

(declare-fun b!216724 () Bool)

(assert (=> b!216724 (= e!140991 tp_is_empty!5641)))

(declare-fun b!216725 () Bool)

(declare-fun e!140992 () Bool)

(assert (=> b!216725 (= e!140993 (and e!140992 mapRes!9624))))

(declare-fun condMapEmpty!9624 () Bool)

(declare-fun mapDefault!9624 () ValueCell!2477)

(assert (=> b!216725 (= condMapEmpty!9624 (= (arr!4977 (_values!4060 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2477)) mapDefault!9624)))))

(declare-fun b!216726 () Bool)

(declare-fun res!106013 () Bool)

(assert (=> b!216726 (=> (not res!106013) (not e!140988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10515 (_ BitVec 32)) Bool)

(assert (=> b!216726 (= res!106013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6125 thiss!1504) (mask!9821 thiss!1504)))))

(declare-fun b!216727 () Bool)

(assert (=> b!216727 (= e!140989 e!140988)))

(declare-fun res!106012 () Bool)

(assert (=> b!216727 (=> (not res!106012) (not e!140988))))

(declare-datatypes ((SeekEntryResult!748 0))(
  ( (MissingZero!748 (index!5162 (_ BitVec 32))) (Found!748 (index!5163 (_ BitVec 32))) (Intermediate!748 (undefined!1560 Bool) (index!5164 (_ BitVec 32)) (x!22675 (_ BitVec 32))) (Undefined!748) (MissingVacant!748 (index!5165 (_ BitVec 32))) )
))
(declare-fun lt!111061 () SeekEntryResult!748)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216727 (= res!106012 (or (= lt!111061 (MissingZero!748 index!297)) (= lt!111061 (MissingVacant!748 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10515 (_ BitVec 32)) SeekEntryResult!748)

(assert (=> b!216727 (= lt!111061 (seekEntryOrOpen!0 key!932 (_keys!6125 thiss!1504) (mask!9821 thiss!1504)))))

(declare-fun b!216728 () Bool)

(assert (=> b!216728 (= e!140992 tp_is_empty!5641)))

(assert (= (and start!21634 res!106011) b!216721))

(assert (= (and b!216721 res!106014) b!216727))

(assert (= (and b!216727 res!106012) b!216719))

(assert (= (and b!216719 res!106015) b!216723))

(assert (= (and b!216723 res!106009) b!216718))

(assert (= (and b!216718 res!106010) b!216726))

(assert (= (and b!216726 res!106013) b!216720))

(assert (= (and b!216725 condMapEmpty!9624) mapIsEmpty!9624))

(assert (= (and b!216725 (not condMapEmpty!9624)) mapNonEmpty!9624))

(get-info :version)

(assert (= (and mapNonEmpty!9624 ((_ is ValueCellFull!2477) mapValue!9624)) b!216724))

(assert (= (and b!216725 ((_ is ValueCellFull!2477) mapDefault!9624)) b!216728))

(assert (= b!216722 b!216725))

(assert (= start!21634 b!216722))

(declare-fun m!242793 () Bool)

(assert (=> b!216722 m!242793))

(declare-fun m!242795 () Bool)

(assert (=> b!216722 m!242795))

(declare-fun m!242797 () Bool)

(assert (=> b!216727 m!242797))

(declare-fun m!242799 () Bool)

(assert (=> mapNonEmpty!9624 m!242799))

(declare-fun m!242801 () Bool)

(assert (=> start!21634 m!242801))

(declare-fun m!242803 () Bool)

(assert (=> b!216726 m!242803))

(declare-fun m!242805 () Bool)

(assert (=> b!216723 m!242805))

(declare-fun m!242807 () Bool)

(assert (=> b!216720 m!242807))

(declare-fun m!242809 () Bool)

(assert (=> b!216719 m!242809))

(assert (=> b!216719 m!242809))

(declare-fun m!242811 () Bool)

(assert (=> b!216719 m!242811))

(check-sat b_and!12643 tp_is_empty!5641 (not b!216726) (not b!216723) (not b!216720) (not b!216727) (not start!21634) (not mapNonEmpty!9624) (not b!216722) (not b!216719) (not b_next!5779))
(check-sat b_and!12643 (not b_next!5779))
