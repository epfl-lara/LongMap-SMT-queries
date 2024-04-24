; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21688 () Bool)

(assert start!21688)

(declare-fun b!217804 () Bool)

(declare-fun b_free!5833 () Bool)

(declare-fun b_next!5833 () Bool)

(assert (=> b!217804 (= b_free!5833 (not b_next!5833))))

(declare-fun tp!20633 () Bool)

(declare-fun b_and!12737 () Bool)

(assert (=> b!217804 (= tp!20633 b_and!12737)))

(declare-fun b!217803 () Bool)

(declare-fun e!141682 () Bool)

(declare-fun tp_is_empty!5695 () Bool)

(assert (=> b!217803 (= e!141682 tp_is_empty!5695)))

(declare-fun e!141683 () Bool)

(declare-datatypes ((V!7241 0))(
  ( (V!7242 (val!2892 Int)) )
))
(declare-datatypes ((ValueCell!2504 0))(
  ( (ValueCellFull!2504 (v!4911 V!7241)) (EmptyCell!2504) )
))
(declare-datatypes ((array!10627 0))(
  ( (array!10628 (arr!5035 (Array (_ BitVec 32) ValueCell!2504)) (size!5367 (_ BitVec 32))) )
))
(declare-datatypes ((array!10629 0))(
  ( (array!10630 (arr!5036 (Array (_ BitVec 32) (_ BitVec 64))) (size!5368 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2908 0))(
  ( (LongMapFixedSize!2909 (defaultEntry!4104 Int) (mask!9867 (_ BitVec 32)) (extraKeys!3841 (_ BitVec 32)) (zeroValue!3945 V!7241) (minValue!3945 V!7241) (_size!1503 (_ BitVec 32)) (_keys!6153 array!10629) (_values!4087 array!10627) (_vacant!1503 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2908)

(declare-fun e!141681 () Bool)

(declare-fun array_inv!3313 (array!10629) Bool)

(declare-fun array_inv!3314 (array!10627) Bool)

(assert (=> b!217804 (= e!141681 (and tp!20633 tp_is_empty!5695 (array_inv!3313 (_keys!6153 thiss!1504)) (array_inv!3314 (_values!4087 thiss!1504)) e!141683))))

(declare-fun b!217806 () Bool)

(declare-fun res!106692 () Bool)

(declare-fun e!141680 () Bool)

(assert (=> b!217806 (=> (not res!106692) (not e!141680))))

(assert (=> b!217806 (= res!106692 (and (= (size!5367 (_values!4087 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9867 thiss!1504))) (= (size!5368 (_keys!6153 thiss!1504)) (size!5367 (_values!4087 thiss!1504))) (bvsge (mask!9867 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3841 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3841 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217807 () Bool)

(declare-fun res!106698 () Bool)

(assert (=> b!217807 (=> (not res!106698) (not e!141680))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4224 0))(
  ( (tuple2!4225 (_1!2123 (_ BitVec 64)) (_2!2123 V!7241)) )
))
(declare-datatypes ((List!3125 0))(
  ( (Nil!3122) (Cons!3121 (h!3768 tuple2!4224) (t!8072 List!3125)) )
))
(declare-datatypes ((ListLongMap!3139 0))(
  ( (ListLongMap!3140 (toList!1585 List!3125)) )
))
(declare-fun contains!1440 (ListLongMap!3139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1117 (array!10629 array!10627 (_ BitVec 32) (_ BitVec 32) V!7241 V!7241 (_ BitVec 32) Int) ListLongMap!3139)

(assert (=> b!217807 (= res!106698 (not (contains!1440 (getCurrentListMap!1117 (_keys!6153 thiss!1504) (_values!4087 thiss!1504) (mask!9867 thiss!1504) (extraKeys!3841 thiss!1504) (zeroValue!3945 thiss!1504) (minValue!3945 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4104 thiss!1504)) key!932)))))

(declare-fun b!217808 () Bool)

(declare-fun e!141684 () Bool)

(declare-fun mapRes!9705 () Bool)

(assert (=> b!217808 (= e!141683 (and e!141684 mapRes!9705))))

(declare-fun condMapEmpty!9705 () Bool)

(declare-fun mapDefault!9705 () ValueCell!2504)

(assert (=> b!217808 (= condMapEmpty!9705 (= (arr!5035 (_values!4087 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2504)) mapDefault!9705)))))

(declare-fun b!217809 () Bool)

(assert (=> b!217809 (= e!141680 false)))

(declare-fun lt!111463 () Bool)

(declare-datatypes ((List!3126 0))(
  ( (Nil!3123) (Cons!3122 (h!3769 (_ BitVec 64)) (t!8073 List!3126)) )
))
(declare-fun arrayNoDuplicates!0 (array!10629 (_ BitVec 32) List!3126) Bool)

(assert (=> b!217809 (= lt!111463 (arrayNoDuplicates!0 (_keys!6153 thiss!1504) #b00000000000000000000000000000000 Nil!3123))))

(declare-fun b!217810 () Bool)

(declare-fun e!141679 () Bool)

(assert (=> b!217810 (= e!141679 e!141680)))

(declare-fun res!106695 () Bool)

(assert (=> b!217810 (=> (not res!106695) (not e!141680))))

(declare-datatypes ((SeekEntryResult!754 0))(
  ( (MissingZero!754 (index!5186 (_ BitVec 32))) (Found!754 (index!5187 (_ BitVec 32))) (Intermediate!754 (undefined!1566 Bool) (index!5188 (_ BitVec 32)) (x!22754 (_ BitVec 32))) (Undefined!754) (MissingVacant!754 (index!5189 (_ BitVec 32))) )
))
(declare-fun lt!111464 () SeekEntryResult!754)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217810 (= res!106695 (or (= lt!111464 (MissingZero!754 index!297)) (= lt!111464 (MissingVacant!754 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10629 (_ BitVec 32)) SeekEntryResult!754)

(assert (=> b!217810 (= lt!111464 (seekEntryOrOpen!0 key!932 (_keys!6153 thiss!1504) (mask!9867 thiss!1504)))))

(declare-fun res!106693 () Bool)

(assert (=> start!21688 (=> (not res!106693) (not e!141679))))

(declare-fun valid!1196 (LongMapFixedSize!2908) Bool)

(assert (=> start!21688 (= res!106693 (valid!1196 thiss!1504))))

(assert (=> start!21688 e!141679))

(assert (=> start!21688 e!141681))

(assert (=> start!21688 true))

(declare-fun b!217805 () Bool)

(declare-fun res!106696 () Bool)

(assert (=> b!217805 (=> (not res!106696) (not e!141679))))

(assert (=> b!217805 (= res!106696 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217811 () Bool)

(assert (=> b!217811 (= e!141684 tp_is_empty!5695)))

(declare-fun b!217812 () Bool)

(declare-fun res!106694 () Bool)

(assert (=> b!217812 (=> (not res!106694) (not e!141680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10629 (_ BitVec 32)) Bool)

(assert (=> b!217812 (= res!106694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6153 thiss!1504) (mask!9867 thiss!1504)))))

(declare-fun mapNonEmpty!9705 () Bool)

(declare-fun tp!20634 () Bool)

(assert (=> mapNonEmpty!9705 (= mapRes!9705 (and tp!20634 e!141682))))

(declare-fun mapValue!9705 () ValueCell!2504)

(declare-fun mapRest!9705 () (Array (_ BitVec 32) ValueCell!2504))

(declare-fun mapKey!9705 () (_ BitVec 32))

(assert (=> mapNonEmpty!9705 (= (arr!5035 (_values!4087 thiss!1504)) (store mapRest!9705 mapKey!9705 mapValue!9705))))

(declare-fun mapIsEmpty!9705 () Bool)

(assert (=> mapIsEmpty!9705 mapRes!9705))

(declare-fun b!217813 () Bool)

(declare-fun res!106697 () Bool)

(assert (=> b!217813 (=> (not res!106697) (not e!141680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217813 (= res!106697 (validMask!0 (mask!9867 thiss!1504)))))

(assert (= (and start!21688 res!106693) b!217805))

(assert (= (and b!217805 res!106696) b!217810))

(assert (= (and b!217810 res!106695) b!217807))

(assert (= (and b!217807 res!106698) b!217813))

(assert (= (and b!217813 res!106697) b!217806))

(assert (= (and b!217806 res!106692) b!217812))

(assert (= (and b!217812 res!106694) b!217809))

(assert (= (and b!217808 condMapEmpty!9705) mapIsEmpty!9705))

(assert (= (and b!217808 (not condMapEmpty!9705)) mapNonEmpty!9705))

(get-info :version)

(assert (= (and mapNonEmpty!9705 ((_ is ValueCellFull!2504) mapValue!9705)) b!217803))

(assert (= (and b!217808 ((_ is ValueCellFull!2504) mapDefault!9705)) b!217811))

(assert (= b!217804 b!217808))

(assert (= start!21688 b!217804))

(declare-fun m!244131 () Bool)

(assert (=> b!217813 m!244131))

(declare-fun m!244133 () Bool)

(assert (=> b!217809 m!244133))

(declare-fun m!244135 () Bool)

(assert (=> b!217804 m!244135))

(declare-fun m!244137 () Bool)

(assert (=> b!217804 m!244137))

(declare-fun m!244139 () Bool)

(assert (=> start!21688 m!244139))

(declare-fun m!244141 () Bool)

(assert (=> mapNonEmpty!9705 m!244141))

(declare-fun m!244143 () Bool)

(assert (=> b!217810 m!244143))

(declare-fun m!244145 () Bool)

(assert (=> b!217812 m!244145))

(declare-fun m!244147 () Bool)

(assert (=> b!217807 m!244147))

(assert (=> b!217807 m!244147))

(declare-fun m!244149 () Bool)

(assert (=> b!217807 m!244149))

(check-sat tp_is_empty!5695 (not mapNonEmpty!9705) (not b!217807) (not b!217809) (not b!217812) (not start!21688) b_and!12737 (not b!217804) (not b!217810) (not b!217813) (not b_next!5833))
(check-sat b_and!12737 (not b_next!5833))
