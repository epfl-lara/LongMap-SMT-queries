; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21638 () Bool)

(assert start!21638)

(declare-fun b!217004 () Bool)

(declare-fun b_free!5787 () Bool)

(declare-fun b_next!5787 () Bool)

(assert (=> b!217004 (= b_free!5787 (not b_next!5787))))

(declare-fun tp!20496 () Bool)

(declare-fun b_and!12677 () Bool)

(assert (=> b!217004 (= tp!20496 b_and!12677)))

(declare-fun b!216997 () Bool)

(declare-fun res!106193 () Bool)

(declare-fun e!141172 () Bool)

(assert (=> b!216997 (=> (not res!106193) (not e!141172))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216997 (= res!106193 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216999 () Bool)

(declare-fun res!106190 () Bool)

(declare-fun e!141177 () Bool)

(assert (=> b!216999 (=> (not res!106190) (not e!141177))))

(declare-datatypes ((V!7179 0))(
  ( (V!7180 (val!2869 Int)) )
))
(declare-datatypes ((ValueCell!2481 0))(
  ( (ValueCellFull!2481 (v!4887 V!7179)) (EmptyCell!2481) )
))
(declare-datatypes ((array!10537 0))(
  ( (array!10538 (arr!4990 (Array (_ BitVec 32) ValueCell!2481)) (size!5322 (_ BitVec 32))) )
))
(declare-datatypes ((array!10539 0))(
  ( (array!10540 (arr!4991 (Array (_ BitVec 32) (_ BitVec 64))) (size!5323 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2862 0))(
  ( (LongMapFixedSize!2863 (defaultEntry!4081 Int) (mask!9828 (_ BitVec 32)) (extraKeys!3818 (_ BitVec 32)) (zeroValue!3922 V!7179) (minValue!3922 V!7179) (_size!1480 (_ BitVec 32)) (_keys!6130 array!10539) (_values!4064 array!10537) (_vacant!1480 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2862)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216999 (= res!106190 (validMask!0 (mask!9828 thiss!1504)))))

(declare-fun b!217000 () Bool)

(declare-fun res!106194 () Bool)

(assert (=> b!217000 (=> (not res!106194) (not e!141177))))

(declare-datatypes ((tuple2!4268 0))(
  ( (tuple2!4269 (_1!2145 (_ BitVec 64)) (_2!2145 V!7179)) )
))
(declare-datatypes ((List!3171 0))(
  ( (Nil!3168) (Cons!3167 (h!3814 tuple2!4268) (t!8126 List!3171)) )
))
(declare-datatypes ((ListLongMap!3181 0))(
  ( (ListLongMap!3182 (toList!1606 List!3171)) )
))
(declare-fun contains!1447 (ListLongMap!3181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1134 (array!10539 array!10537 (_ BitVec 32) (_ BitVec 32) V!7179 V!7179 (_ BitVec 32) Int) ListLongMap!3181)

(assert (=> b!217000 (= res!106194 (contains!1447 (getCurrentListMap!1134 (_keys!6130 thiss!1504) (_values!4064 thiss!1504) (mask!9828 thiss!1504) (extraKeys!3818 thiss!1504) (zeroValue!3922 thiss!1504) (minValue!3922 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4081 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!9636 () Bool)

(declare-fun mapRes!9636 () Bool)

(assert (=> mapIsEmpty!9636 mapRes!9636))

(declare-fun b!217001 () Bool)

(declare-fun e!141174 () Bool)

(declare-fun tp_is_empty!5649 () Bool)

(assert (=> b!217001 (= e!141174 tp_is_empty!5649)))

(declare-fun mapNonEmpty!9636 () Bool)

(declare-fun tp!20495 () Bool)

(assert (=> mapNonEmpty!9636 (= mapRes!9636 (and tp!20495 e!141174))))

(declare-fun mapKey!9636 () (_ BitVec 32))

(declare-fun mapValue!9636 () ValueCell!2481)

(declare-fun mapRest!9636 () (Array (_ BitVec 32) ValueCell!2481))

(assert (=> mapNonEmpty!9636 (= (arr!4990 (_values!4064 thiss!1504)) (store mapRest!9636 mapKey!9636 mapValue!9636))))

(declare-fun b!217002 () Bool)

(assert (=> b!217002 (= e!141177 false)))

(declare-fun lt!111266 () Bool)

(declare-datatypes ((List!3172 0))(
  ( (Nil!3169) (Cons!3168 (h!3815 (_ BitVec 64)) (t!8127 List!3172)) )
))
(declare-fun arrayNoDuplicates!0 (array!10539 (_ BitVec 32) List!3172) Bool)

(assert (=> b!217002 (= lt!111266 (arrayNoDuplicates!0 (_keys!6130 thiss!1504) #b00000000000000000000000000000000 Nil!3169))))

(declare-fun b!217003 () Bool)

(declare-fun e!141175 () Bool)

(assert (=> b!217003 (= e!141175 tp_is_empty!5649)))

(declare-fun e!141173 () Bool)

(declare-fun e!141176 () Bool)

(declare-fun array_inv!3301 (array!10539) Bool)

(declare-fun array_inv!3302 (array!10537) Bool)

(assert (=> b!217004 (= e!141176 (and tp!20496 tp_is_empty!5649 (array_inv!3301 (_keys!6130 thiss!1504)) (array_inv!3302 (_values!4064 thiss!1504)) e!141173))))

(declare-fun b!217005 () Bool)

(assert (=> b!217005 (= e!141173 (and e!141175 mapRes!9636))))

(declare-fun condMapEmpty!9636 () Bool)

(declare-fun mapDefault!9636 () ValueCell!2481)

(assert (=> b!217005 (= condMapEmpty!9636 (= (arr!4990 (_values!4064 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2481)) mapDefault!9636)))))

(declare-fun b!217006 () Bool)

(declare-fun res!106188 () Bool)

(assert (=> b!217006 (=> (not res!106188) (not e!141177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10539 (_ BitVec 32)) Bool)

(assert (=> b!217006 (= res!106188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6130 thiss!1504) (mask!9828 thiss!1504)))))

(declare-fun b!217007 () Bool)

(assert (=> b!217007 (= e!141172 e!141177)))

(declare-fun res!106189 () Bool)

(assert (=> b!217007 (=> (not res!106189) (not e!141177))))

(declare-datatypes ((SeekEntryResult!757 0))(
  ( (MissingZero!757 (index!5198 (_ BitVec 32))) (Found!757 (index!5199 (_ BitVec 32))) (Intermediate!757 (undefined!1569 Bool) (index!5200 (_ BitVec 32)) (x!22693 (_ BitVec 32))) (Undefined!757) (MissingVacant!757 (index!5201 (_ BitVec 32))) )
))
(declare-fun lt!111267 () SeekEntryResult!757)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217007 (= res!106189 (or (= lt!111267 (MissingZero!757 index!297)) (= lt!111267 (MissingVacant!757 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10539 (_ BitVec 32)) SeekEntryResult!757)

(assert (=> b!217007 (= lt!111267 (seekEntryOrOpen!0 key!932 (_keys!6130 thiss!1504) (mask!9828 thiss!1504)))))

(declare-fun res!106191 () Bool)

(assert (=> start!21638 (=> (not res!106191) (not e!141172))))

(declare-fun valid!1163 (LongMapFixedSize!2862) Bool)

(assert (=> start!21638 (= res!106191 (valid!1163 thiss!1504))))

(assert (=> start!21638 e!141172))

(assert (=> start!21638 e!141176))

(assert (=> start!21638 true))

(declare-fun b!216998 () Bool)

(declare-fun res!106192 () Bool)

(assert (=> b!216998 (=> (not res!106192) (not e!141177))))

(assert (=> b!216998 (= res!106192 (and (= (size!5322 (_values!4064 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9828 thiss!1504))) (= (size!5323 (_keys!6130 thiss!1504)) (size!5322 (_values!4064 thiss!1504))) (bvsge (mask!9828 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3818 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3818 thiss!1504) #b00000000000000000000000000000011)))))

(assert (= (and start!21638 res!106191) b!216997))

(assert (= (and b!216997 res!106193) b!217007))

(assert (= (and b!217007 res!106189) b!217000))

(assert (= (and b!217000 res!106194) b!216999))

(assert (= (and b!216999 res!106190) b!216998))

(assert (= (and b!216998 res!106192) b!217006))

(assert (= (and b!217006 res!106188) b!217002))

(assert (= (and b!217005 condMapEmpty!9636) mapIsEmpty!9636))

(assert (= (and b!217005 (not condMapEmpty!9636)) mapNonEmpty!9636))

(get-info :version)

(assert (= (and mapNonEmpty!9636 ((_ is ValueCellFull!2481) mapValue!9636)) b!217001))

(assert (= (and b!217005 ((_ is ValueCellFull!2481) mapDefault!9636)) b!217003))

(assert (= b!217004 b!217005))

(assert (= start!21638 b!217004))

(declare-fun m!243489 () Bool)

(assert (=> b!216999 m!243489))

(declare-fun m!243491 () Bool)

(assert (=> b!217002 m!243491))

(declare-fun m!243493 () Bool)

(assert (=> b!217006 m!243493))

(declare-fun m!243495 () Bool)

(assert (=> b!217004 m!243495))

(declare-fun m!243497 () Bool)

(assert (=> b!217004 m!243497))

(declare-fun m!243499 () Bool)

(assert (=> b!217007 m!243499))

(declare-fun m!243501 () Bool)

(assert (=> mapNonEmpty!9636 m!243501))

(declare-fun m!243503 () Bool)

(assert (=> b!217000 m!243503))

(assert (=> b!217000 m!243503))

(declare-fun m!243505 () Bool)

(assert (=> b!217000 m!243505))

(declare-fun m!243507 () Bool)

(assert (=> start!21638 m!243507))

(check-sat (not mapNonEmpty!9636) (not b!217007) (not b!217000) b_and!12677 (not b!217006) (not b_next!5787) tp_is_empty!5649 (not b!217004) (not start!21638) (not b!216999) (not b!217002))
(check-sat b_and!12677 (not b_next!5787))
