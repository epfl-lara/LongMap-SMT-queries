; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21614 () Bool)

(assert start!21614)

(declare-fun b!216611 () Bool)

(declare-fun b_free!5763 () Bool)

(declare-fun b_next!5763 () Bool)

(assert (=> b!216611 (= b_free!5763 (not b_next!5763))))

(declare-fun tp!20424 () Bool)

(declare-fun b_and!12653 () Bool)

(assert (=> b!216611 (= tp!20424 b_and!12653)))

(declare-fun res!105937 () Bool)

(declare-fun e!140923 () Bool)

(assert (=> start!21614 (=> (not res!105937) (not e!140923))))

(declare-datatypes ((V!7147 0))(
  ( (V!7148 (val!2857 Int)) )
))
(declare-datatypes ((ValueCell!2469 0))(
  ( (ValueCellFull!2469 (v!4875 V!7147)) (EmptyCell!2469) )
))
(declare-datatypes ((array!10489 0))(
  ( (array!10490 (arr!4966 (Array (_ BitVec 32) ValueCell!2469)) (size!5298 (_ BitVec 32))) )
))
(declare-datatypes ((array!10491 0))(
  ( (array!10492 (arr!4967 (Array (_ BitVec 32) (_ BitVec 64))) (size!5299 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2838 0))(
  ( (LongMapFixedSize!2839 (defaultEntry!4069 Int) (mask!9808 (_ BitVec 32)) (extraKeys!3806 (_ BitVec 32)) (zeroValue!3910 V!7147) (minValue!3910 V!7147) (_size!1468 (_ BitVec 32)) (_keys!6118 array!10491) (_values!4052 array!10489) (_vacant!1468 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2838)

(declare-fun valid!1154 (LongMapFixedSize!2838) Bool)

(assert (=> start!21614 (= res!105937 (valid!1154 thiss!1504))))

(assert (=> start!21614 e!140923))

(declare-fun e!140921 () Bool)

(assert (=> start!21614 e!140921))

(assert (=> start!21614 true))

(declare-fun b!216601 () Bool)

(declare-fun res!105942 () Bool)

(declare-fun e!140924 () Bool)

(assert (=> b!216601 (=> (not res!105942) (not e!140924))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4250 0))(
  ( (tuple2!4251 (_1!2136 (_ BitVec 64)) (_2!2136 V!7147)) )
))
(declare-datatypes ((List!3155 0))(
  ( (Nil!3152) (Cons!3151 (h!3798 tuple2!4250) (t!8110 List!3155)) )
))
(declare-datatypes ((ListLongMap!3163 0))(
  ( (ListLongMap!3164 (toList!1597 List!3155)) )
))
(declare-fun contains!1438 (ListLongMap!3163 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1125 (array!10491 array!10489 (_ BitVec 32) (_ BitVec 32) V!7147 V!7147 (_ BitVec 32) Int) ListLongMap!3163)

(assert (=> b!216601 (= res!105942 (contains!1438 (getCurrentListMap!1125 (_keys!6118 thiss!1504) (_values!4052 thiss!1504) (mask!9808 thiss!1504) (extraKeys!3806 thiss!1504) (zeroValue!3910 thiss!1504) (minValue!3910 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4069 thiss!1504)) key!932))))

(declare-fun b!216602 () Bool)

(declare-fun res!105936 () Bool)

(assert (=> b!216602 (=> (not res!105936) (not e!140923))))

(assert (=> b!216602 (= res!105936 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216603 () Bool)

(assert (=> b!216603 (= e!140923 e!140924)))

(declare-fun res!105941 () Bool)

(assert (=> b!216603 (=> (not res!105941) (not e!140924))))

(declare-datatypes ((SeekEntryResult!748 0))(
  ( (MissingZero!748 (index!5162 (_ BitVec 32))) (Found!748 (index!5163 (_ BitVec 32))) (Intermediate!748 (undefined!1560 Bool) (index!5164 (_ BitVec 32)) (x!22652 (_ BitVec 32))) (Undefined!748) (MissingVacant!748 (index!5165 (_ BitVec 32))) )
))
(declare-fun lt!111195 () SeekEntryResult!748)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216603 (= res!105941 (or (= lt!111195 (MissingZero!748 index!297)) (= lt!111195 (MissingVacant!748 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10491 (_ BitVec 32)) SeekEntryResult!748)

(assert (=> b!216603 (= lt!111195 (seekEntryOrOpen!0 key!932 (_keys!6118 thiss!1504) (mask!9808 thiss!1504)))))

(declare-fun b!216604 () Bool)

(declare-fun e!140926 () Bool)

(declare-fun tp_is_empty!5625 () Bool)

(assert (=> b!216604 (= e!140926 tp_is_empty!5625)))

(declare-fun b!216605 () Bool)

(declare-fun e!140925 () Bool)

(declare-fun e!140922 () Bool)

(declare-fun mapRes!9600 () Bool)

(assert (=> b!216605 (= e!140925 (and e!140922 mapRes!9600))))

(declare-fun condMapEmpty!9600 () Bool)

(declare-fun mapDefault!9600 () ValueCell!2469)

(assert (=> b!216605 (= condMapEmpty!9600 (= (arr!4966 (_values!4052 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2469)) mapDefault!9600)))))

(declare-fun mapIsEmpty!9600 () Bool)

(assert (=> mapIsEmpty!9600 mapRes!9600))

(declare-fun b!216606 () Bool)

(declare-fun res!105939 () Bool)

(assert (=> b!216606 (=> (not res!105939) (not e!140924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10491 (_ BitVec 32)) Bool)

(assert (=> b!216606 (= res!105939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6118 thiss!1504) (mask!9808 thiss!1504)))))

(declare-fun b!216607 () Bool)

(declare-fun res!105938 () Bool)

(assert (=> b!216607 (=> (not res!105938) (not e!140924))))

(assert (=> b!216607 (= res!105938 (and (= (size!5298 (_values!4052 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9808 thiss!1504))) (= (size!5299 (_keys!6118 thiss!1504)) (size!5298 (_values!4052 thiss!1504))) (bvsge (mask!9808 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3806 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3806 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216608 () Bool)

(declare-fun res!105940 () Bool)

(assert (=> b!216608 (=> (not res!105940) (not e!140924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216608 (= res!105940 (validMask!0 (mask!9808 thiss!1504)))))

(declare-fun b!216609 () Bool)

(assert (=> b!216609 (= e!140922 tp_is_empty!5625)))

(declare-fun b!216610 () Bool)

(assert (=> b!216610 (= e!140924 false)))

(declare-fun lt!111194 () Bool)

(declare-datatypes ((List!3156 0))(
  ( (Nil!3153) (Cons!3152 (h!3799 (_ BitVec 64)) (t!8111 List!3156)) )
))
(declare-fun arrayNoDuplicates!0 (array!10491 (_ BitVec 32) List!3156) Bool)

(assert (=> b!216610 (= lt!111194 (arrayNoDuplicates!0 (_keys!6118 thiss!1504) #b00000000000000000000000000000000 Nil!3153))))

(declare-fun mapNonEmpty!9600 () Bool)

(declare-fun tp!20423 () Bool)

(assert (=> mapNonEmpty!9600 (= mapRes!9600 (and tp!20423 e!140926))))

(declare-fun mapRest!9600 () (Array (_ BitVec 32) ValueCell!2469))

(declare-fun mapKey!9600 () (_ BitVec 32))

(declare-fun mapValue!9600 () ValueCell!2469)

(assert (=> mapNonEmpty!9600 (= (arr!4966 (_values!4052 thiss!1504)) (store mapRest!9600 mapKey!9600 mapValue!9600))))

(declare-fun array_inv!3287 (array!10491) Bool)

(declare-fun array_inv!3288 (array!10489) Bool)

(assert (=> b!216611 (= e!140921 (and tp!20424 tp_is_empty!5625 (array_inv!3287 (_keys!6118 thiss!1504)) (array_inv!3288 (_values!4052 thiss!1504)) e!140925))))

(assert (= (and start!21614 res!105937) b!216602))

(assert (= (and b!216602 res!105936) b!216603))

(assert (= (and b!216603 res!105941) b!216601))

(assert (= (and b!216601 res!105942) b!216608))

(assert (= (and b!216608 res!105940) b!216607))

(assert (= (and b!216607 res!105938) b!216606))

(assert (= (and b!216606 res!105939) b!216610))

(assert (= (and b!216605 condMapEmpty!9600) mapIsEmpty!9600))

(assert (= (and b!216605 (not condMapEmpty!9600)) mapNonEmpty!9600))

(get-info :version)

(assert (= (and mapNonEmpty!9600 ((_ is ValueCellFull!2469) mapValue!9600)) b!216604))

(assert (= (and b!216605 ((_ is ValueCellFull!2469) mapDefault!9600)) b!216609))

(assert (= b!216611 b!216605))

(assert (= start!21614 b!216611))

(declare-fun m!243249 () Bool)

(assert (=> b!216606 m!243249))

(declare-fun m!243251 () Bool)

(assert (=> b!216601 m!243251))

(assert (=> b!216601 m!243251))

(declare-fun m!243253 () Bool)

(assert (=> b!216601 m!243253))

(declare-fun m!243255 () Bool)

(assert (=> b!216610 m!243255))

(declare-fun m!243257 () Bool)

(assert (=> b!216611 m!243257))

(declare-fun m!243259 () Bool)

(assert (=> b!216611 m!243259))

(declare-fun m!243261 () Bool)

(assert (=> b!216608 m!243261))

(declare-fun m!243263 () Bool)

(assert (=> b!216603 m!243263))

(declare-fun m!243265 () Bool)

(assert (=> mapNonEmpty!9600 m!243265))

(declare-fun m!243267 () Bool)

(assert (=> start!21614 m!243267))

(check-sat b_and!12653 (not b!216608) (not b_next!5763) (not start!21614) (not b!216611) (not b!216610) (not b!216603) tp_is_empty!5625 (not mapNonEmpty!9600) (not b!216606) (not b!216601))
(check-sat b_and!12653 (not b_next!5763))
