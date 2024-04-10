; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21620 () Bool)

(assert start!21620)

(declare-fun b!216703 () Bool)

(declare-fun b_free!5769 () Bool)

(declare-fun b_next!5769 () Bool)

(assert (=> b!216703 (= b_free!5769 (not b_next!5769))))

(declare-fun tp!20442 () Bool)

(declare-fun b_and!12659 () Bool)

(assert (=> b!216703 (= tp!20442 b_and!12659)))

(declare-fun b!216700 () Bool)

(declare-fun e!140989 () Bool)

(declare-fun tp_is_empty!5631 () Bool)

(assert (=> b!216700 (= e!140989 tp_is_empty!5631)))

(declare-fun b!216701 () Bool)

(declare-fun e!140983 () Bool)

(assert (=> b!216701 (= e!140983 false)))

(declare-fun lt!111213 () Bool)

(declare-datatypes ((V!7155 0))(
  ( (V!7156 (val!2860 Int)) )
))
(declare-datatypes ((ValueCell!2472 0))(
  ( (ValueCellFull!2472 (v!4878 V!7155)) (EmptyCell!2472) )
))
(declare-datatypes ((array!10501 0))(
  ( (array!10502 (arr!4972 (Array (_ BitVec 32) ValueCell!2472)) (size!5304 (_ BitVec 32))) )
))
(declare-datatypes ((array!10503 0))(
  ( (array!10504 (arr!4973 (Array (_ BitVec 32) (_ BitVec 64))) (size!5305 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2844 0))(
  ( (LongMapFixedSize!2845 (defaultEntry!4072 Int) (mask!9813 (_ BitVec 32)) (extraKeys!3809 (_ BitVec 32)) (zeroValue!3913 V!7155) (minValue!3913 V!7155) (_size!1471 (_ BitVec 32)) (_keys!6121 array!10503) (_values!4055 array!10501) (_vacant!1471 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2844)

(declare-datatypes ((List!3159 0))(
  ( (Nil!3156) (Cons!3155 (h!3802 (_ BitVec 64)) (t!8114 List!3159)) )
))
(declare-fun arrayNoDuplicates!0 (array!10503 (_ BitVec 32) List!3159) Bool)

(assert (=> b!216701 (= lt!111213 (arrayNoDuplicates!0 (_keys!6121 thiss!1504) #b00000000000000000000000000000000 Nil!3156))))

(declare-fun b!216702 () Bool)

(declare-fun res!106005 () Bool)

(assert (=> b!216702 (=> (not res!106005) (not e!140983))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4254 0))(
  ( (tuple2!4255 (_1!2138 (_ BitVec 64)) (_2!2138 V!7155)) )
))
(declare-datatypes ((List!3160 0))(
  ( (Nil!3157) (Cons!3156 (h!3803 tuple2!4254) (t!8115 List!3160)) )
))
(declare-datatypes ((ListLongMap!3167 0))(
  ( (ListLongMap!3168 (toList!1599 List!3160)) )
))
(declare-fun contains!1440 (ListLongMap!3167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1127 (array!10503 array!10501 (_ BitVec 32) (_ BitVec 32) V!7155 V!7155 (_ BitVec 32) Int) ListLongMap!3167)

(assert (=> b!216702 (= res!106005 (contains!1440 (getCurrentListMap!1127 (_keys!6121 thiss!1504) (_values!4055 thiss!1504) (mask!9813 thiss!1504) (extraKeys!3809 thiss!1504) (zeroValue!3913 thiss!1504) (minValue!3913 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4072 thiss!1504)) key!932))))

(declare-fun e!140984 () Bool)

(declare-fun e!140986 () Bool)

(declare-fun array_inv!3289 (array!10503) Bool)

(declare-fun array_inv!3290 (array!10501) Bool)

(assert (=> b!216703 (= e!140984 (and tp!20442 tp_is_empty!5631 (array_inv!3289 (_keys!6121 thiss!1504)) (array_inv!3290 (_values!4055 thiss!1504)) e!140986))))

(declare-fun b!216704 () Bool)

(declare-fun e!140985 () Bool)

(assert (=> b!216704 (= e!140985 tp_is_empty!5631)))

(declare-fun b!216705 () Bool)

(declare-fun e!140988 () Bool)

(assert (=> b!216705 (= e!140988 e!140983)))

(declare-fun res!106004 () Bool)

(assert (=> b!216705 (=> (not res!106004) (not e!140983))))

(declare-datatypes ((SeekEntryResult!749 0))(
  ( (MissingZero!749 (index!5166 (_ BitVec 32))) (Found!749 (index!5167 (_ BitVec 32))) (Intermediate!749 (undefined!1561 Bool) (index!5168 (_ BitVec 32)) (x!22661 (_ BitVec 32))) (Undefined!749) (MissingVacant!749 (index!5169 (_ BitVec 32))) )
))
(declare-fun lt!111212 () SeekEntryResult!749)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216705 (= res!106004 (or (= lt!111212 (MissingZero!749 index!297)) (= lt!111212 (MissingVacant!749 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10503 (_ BitVec 32)) SeekEntryResult!749)

(assert (=> b!216705 (= lt!111212 (seekEntryOrOpen!0 key!932 (_keys!6121 thiss!1504) (mask!9813 thiss!1504)))))

(declare-fun b!216706 () Bool)

(declare-fun res!105999 () Bool)

(assert (=> b!216706 (=> (not res!105999) (not e!140983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10503 (_ BitVec 32)) Bool)

(assert (=> b!216706 (= res!105999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6121 thiss!1504) (mask!9813 thiss!1504)))))

(declare-fun mapIsEmpty!9609 () Bool)

(declare-fun mapRes!9609 () Bool)

(assert (=> mapIsEmpty!9609 mapRes!9609))

(declare-fun b!216707 () Bool)

(declare-fun res!106003 () Bool)

(assert (=> b!216707 (=> (not res!106003) (not e!140983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216707 (= res!106003 (validMask!0 (mask!9813 thiss!1504)))))

(declare-fun mapNonEmpty!9609 () Bool)

(declare-fun tp!20441 () Bool)

(assert (=> mapNonEmpty!9609 (= mapRes!9609 (and tp!20441 e!140985))))

(declare-fun mapValue!9609 () ValueCell!2472)

(declare-fun mapKey!9609 () (_ BitVec 32))

(declare-fun mapRest!9609 () (Array (_ BitVec 32) ValueCell!2472))

(assert (=> mapNonEmpty!9609 (= (arr!4972 (_values!4055 thiss!1504)) (store mapRest!9609 mapKey!9609 mapValue!9609))))

(declare-fun b!216709 () Bool)

(declare-fun res!106000 () Bool)

(assert (=> b!216709 (=> (not res!106000) (not e!140988))))

(assert (=> b!216709 (= res!106000 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216710 () Bool)

(assert (=> b!216710 (= e!140986 (and e!140989 mapRes!9609))))

(declare-fun condMapEmpty!9609 () Bool)

(declare-fun mapDefault!9609 () ValueCell!2472)

(assert (=> b!216710 (= condMapEmpty!9609 (= (arr!4972 (_values!4055 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2472)) mapDefault!9609)))))

(declare-fun b!216708 () Bool)

(declare-fun res!106001 () Bool)

(assert (=> b!216708 (=> (not res!106001) (not e!140983))))

(assert (=> b!216708 (= res!106001 (and (= (size!5304 (_values!4055 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9813 thiss!1504))) (= (size!5305 (_keys!6121 thiss!1504)) (size!5304 (_values!4055 thiss!1504))) (bvsge (mask!9813 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3809 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3809 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!106002 () Bool)

(assert (=> start!21620 (=> (not res!106002) (not e!140988))))

(declare-fun valid!1156 (LongMapFixedSize!2844) Bool)

(assert (=> start!21620 (= res!106002 (valid!1156 thiss!1504))))

(assert (=> start!21620 e!140988))

(assert (=> start!21620 e!140984))

(assert (=> start!21620 true))

(assert (= (and start!21620 res!106002) b!216709))

(assert (= (and b!216709 res!106000) b!216705))

(assert (= (and b!216705 res!106004) b!216702))

(assert (= (and b!216702 res!106005) b!216707))

(assert (= (and b!216707 res!106003) b!216708))

(assert (= (and b!216708 res!106001) b!216706))

(assert (= (and b!216706 res!105999) b!216701))

(assert (= (and b!216710 condMapEmpty!9609) mapIsEmpty!9609))

(assert (= (and b!216710 (not condMapEmpty!9609)) mapNonEmpty!9609))

(get-info :version)

(assert (= (and mapNonEmpty!9609 ((_ is ValueCellFull!2472) mapValue!9609)) b!216704))

(assert (= (and b!216710 ((_ is ValueCellFull!2472) mapDefault!9609)) b!216700))

(assert (= b!216703 b!216710))

(assert (= start!21620 b!216703))

(declare-fun m!243309 () Bool)

(assert (=> b!216701 m!243309))

(declare-fun m!243311 () Bool)

(assert (=> b!216703 m!243311))

(declare-fun m!243313 () Bool)

(assert (=> b!216703 m!243313))

(declare-fun m!243315 () Bool)

(assert (=> b!216707 m!243315))

(declare-fun m!243317 () Bool)

(assert (=> b!216705 m!243317))

(declare-fun m!243319 () Bool)

(assert (=> start!21620 m!243319))

(declare-fun m!243321 () Bool)

(assert (=> mapNonEmpty!9609 m!243321))

(declare-fun m!243323 () Bool)

(assert (=> b!216702 m!243323))

(assert (=> b!216702 m!243323))

(declare-fun m!243325 () Bool)

(assert (=> b!216702 m!243325))

(declare-fun m!243327 () Bool)

(assert (=> b!216706 m!243327))

(check-sat (not b_next!5769) (not b!216702) (not b!216703) tp_is_empty!5631 (not b!216706) (not start!21620) (not mapNonEmpty!9609) (not b!216701) (not b!216707) b_and!12659 (not b!216705))
(check-sat b_and!12659 (not b_next!5769))
