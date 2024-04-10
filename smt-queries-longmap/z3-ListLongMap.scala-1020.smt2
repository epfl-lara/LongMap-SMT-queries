; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21722 () Bool)

(assert start!21722)

(declare-fun b!218383 () Bool)

(declare-fun b_free!5871 () Bool)

(declare-fun b_next!5871 () Bool)

(assert (=> b!218383 (= b_free!5871 (not b_next!5871))))

(declare-fun tp!20747 () Bool)

(declare-fun b_and!12761 () Bool)

(assert (=> b!218383 (= tp!20747 b_and!12761)))

(declare-fun e!142057 () Bool)

(declare-datatypes ((V!7291 0))(
  ( (V!7292 (val!2911 Int)) )
))
(declare-datatypes ((ValueCell!2523 0))(
  ( (ValueCellFull!2523 (v!4929 V!7291)) (EmptyCell!2523) )
))
(declare-datatypes ((array!10705 0))(
  ( (array!10706 (arr!5074 (Array (_ BitVec 32) ValueCell!2523)) (size!5406 (_ BitVec 32))) )
))
(declare-datatypes ((array!10707 0))(
  ( (array!10708 (arr!5075 (Array (_ BitVec 32) (_ BitVec 64))) (size!5407 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2946 0))(
  ( (LongMapFixedSize!2947 (defaultEntry!4123 Int) (mask!9898 (_ BitVec 32)) (extraKeys!3860 (_ BitVec 32)) (zeroValue!3964 V!7291) (minValue!3964 V!7291) (_size!1522 (_ BitVec 32)) (_keys!6172 array!10707) (_values!4106 array!10705) (_vacant!1522 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2946)

(declare-fun tp_is_empty!5733 () Bool)

(declare-fun e!142058 () Bool)

(declare-fun array_inv!3361 (array!10707) Bool)

(declare-fun array_inv!3362 (array!10705) Bool)

(assert (=> b!218383 (= e!142058 (and tp!20747 tp_is_empty!5733 (array_inv!3361 (_keys!6172 thiss!1504)) (array_inv!3362 (_values!4106 thiss!1504)) e!142057))))

(declare-fun b!218384 () Bool)

(declare-fun e!142056 () Bool)

(declare-fun e!142060 () Bool)

(assert (=> b!218384 (= e!142056 e!142060)))

(declare-fun res!107074 () Bool)

(assert (=> b!218384 (=> (not res!107074) (not e!142060))))

(declare-datatypes ((SeekEntryResult!787 0))(
  ( (MissingZero!787 (index!5318 (_ BitVec 32))) (Found!787 (index!5319 (_ BitVec 32))) (Intermediate!787 (undefined!1599 Bool) (index!5320 (_ BitVec 32)) (x!22835 (_ BitVec 32))) (Undefined!787) (MissingVacant!787 (index!5321 (_ BitVec 32))) )
))
(declare-fun lt!111519 () SeekEntryResult!787)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218384 (= res!107074 (or (= lt!111519 (MissingZero!787 index!297)) (= lt!111519 (MissingVacant!787 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10707 (_ BitVec 32)) SeekEntryResult!787)

(assert (=> b!218384 (= lt!111519 (seekEntryOrOpen!0 key!932 (_keys!6172 thiss!1504) (mask!9898 thiss!1504)))))

(declare-fun b!218385 () Bool)

(declare-fun e!142054 () Bool)

(assert (=> b!218385 (= e!142054 tp_is_empty!5733)))

(declare-fun mapIsEmpty!9762 () Bool)

(declare-fun mapRes!9762 () Bool)

(assert (=> mapIsEmpty!9762 mapRes!9762))

(declare-fun b!218386 () Bool)

(declare-fun res!107073 () Bool)

(assert (=> b!218386 (=> (not res!107073) (not e!142060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218386 (= res!107073 (validMask!0 (mask!9898 thiss!1504)))))

(declare-fun b!218387 () Bool)

(declare-fun res!107075 () Bool)

(assert (=> b!218387 (=> (not res!107075) (not e!142060))))

(declare-datatypes ((tuple2!4326 0))(
  ( (tuple2!4327 (_1!2174 (_ BitVec 64)) (_2!2174 V!7291)) )
))
(declare-datatypes ((List!3231 0))(
  ( (Nil!3228) (Cons!3227 (h!3874 tuple2!4326) (t!8186 List!3231)) )
))
(declare-datatypes ((ListLongMap!3239 0))(
  ( (ListLongMap!3240 (toList!1635 List!3231)) )
))
(declare-fun contains!1476 (ListLongMap!3239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1163 (array!10707 array!10705 (_ BitVec 32) (_ BitVec 32) V!7291 V!7291 (_ BitVec 32) Int) ListLongMap!3239)

(assert (=> b!218387 (= res!107075 (not (contains!1476 (getCurrentListMap!1163 (_keys!6172 thiss!1504) (_values!4106 thiss!1504) (mask!9898 thiss!1504) (extraKeys!3860 thiss!1504) (zeroValue!3964 thiss!1504) (minValue!3964 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4123 thiss!1504)) key!932)))))

(declare-fun b!218388 () Bool)

(declare-fun res!107071 () Bool)

(assert (=> b!218388 (=> (not res!107071) (not e!142056))))

(assert (=> b!218388 (= res!107071 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218389 () Bool)

(declare-fun res!107076 () Bool)

(assert (=> b!218389 (=> (not res!107076) (not e!142060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10707 (_ BitVec 32)) Bool)

(assert (=> b!218389 (= res!107076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6172 thiss!1504) (mask!9898 thiss!1504)))))

(declare-fun b!218390 () Bool)

(assert (=> b!218390 (= e!142060 false)))

(declare-fun lt!111518 () Bool)

(declare-datatypes ((List!3232 0))(
  ( (Nil!3229) (Cons!3228 (h!3875 (_ BitVec 64)) (t!8187 List!3232)) )
))
(declare-fun arrayNoDuplicates!0 (array!10707 (_ BitVec 32) List!3232) Bool)

(assert (=> b!218390 (= lt!111518 (arrayNoDuplicates!0 (_keys!6172 thiss!1504) #b00000000000000000000000000000000 Nil!3229))))

(declare-fun b!218391 () Bool)

(declare-fun e!142059 () Bool)

(assert (=> b!218391 (= e!142059 tp_is_empty!5733)))

(declare-fun b!218392 () Bool)

(assert (=> b!218392 (= e!142057 (and e!142054 mapRes!9762))))

(declare-fun condMapEmpty!9762 () Bool)

(declare-fun mapDefault!9762 () ValueCell!2523)

(assert (=> b!218392 (= condMapEmpty!9762 (= (arr!5074 (_values!4106 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2523)) mapDefault!9762)))))

(declare-fun b!218393 () Bool)

(declare-fun res!107072 () Bool)

(assert (=> b!218393 (=> (not res!107072) (not e!142060))))

(assert (=> b!218393 (= res!107072 (and (= (size!5406 (_values!4106 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9898 thiss!1504))) (= (size!5407 (_keys!6172 thiss!1504)) (size!5406 (_values!4106 thiss!1504))) (bvsge (mask!9898 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3860 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3860 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9762 () Bool)

(declare-fun tp!20748 () Bool)

(assert (=> mapNonEmpty!9762 (= mapRes!9762 (and tp!20748 e!142059))))

(declare-fun mapRest!9762 () (Array (_ BitVec 32) ValueCell!2523))

(declare-fun mapKey!9762 () (_ BitVec 32))

(declare-fun mapValue!9762 () ValueCell!2523)

(assert (=> mapNonEmpty!9762 (= (arr!5074 (_values!4106 thiss!1504)) (store mapRest!9762 mapKey!9762 mapValue!9762))))

(declare-fun res!107070 () Bool)

(assert (=> start!21722 (=> (not res!107070) (not e!142056))))

(declare-fun valid!1194 (LongMapFixedSize!2946) Bool)

(assert (=> start!21722 (= res!107070 (valid!1194 thiss!1504))))

(assert (=> start!21722 e!142056))

(assert (=> start!21722 e!142058))

(assert (=> start!21722 true))

(assert (= (and start!21722 res!107070) b!218388))

(assert (= (and b!218388 res!107071) b!218384))

(assert (= (and b!218384 res!107074) b!218387))

(assert (= (and b!218387 res!107075) b!218386))

(assert (= (and b!218386 res!107073) b!218393))

(assert (= (and b!218393 res!107072) b!218389))

(assert (= (and b!218389 res!107076) b!218390))

(assert (= (and b!218392 condMapEmpty!9762) mapIsEmpty!9762))

(assert (= (and b!218392 (not condMapEmpty!9762)) mapNonEmpty!9762))

(get-info :version)

(assert (= (and mapNonEmpty!9762 ((_ is ValueCellFull!2523) mapValue!9762)) b!218391))

(assert (= (and b!218392 ((_ is ValueCellFull!2523) mapDefault!9762)) b!218385))

(assert (= b!218383 b!218392))

(assert (= start!21722 b!218383))

(declare-fun m!244329 () Bool)

(assert (=> mapNonEmpty!9762 m!244329))

(declare-fun m!244331 () Bool)

(assert (=> b!218390 m!244331))

(declare-fun m!244333 () Bool)

(assert (=> start!21722 m!244333))

(declare-fun m!244335 () Bool)

(assert (=> b!218386 m!244335))

(declare-fun m!244337 () Bool)

(assert (=> b!218387 m!244337))

(assert (=> b!218387 m!244337))

(declare-fun m!244339 () Bool)

(assert (=> b!218387 m!244339))

(declare-fun m!244341 () Bool)

(assert (=> b!218389 m!244341))

(declare-fun m!244343 () Bool)

(assert (=> b!218384 m!244343))

(declare-fun m!244345 () Bool)

(assert (=> b!218383 m!244345))

(declare-fun m!244347 () Bool)

(assert (=> b!218383 m!244347))

(check-sat (not b!218384) (not b!218383) (not mapNonEmpty!9762) (not b!218390) b_and!12761 tp_is_empty!5733 (not b!218387) (not start!21722) (not b!218386) (not b!218389) (not b_next!5871))
(check-sat b_and!12761 (not b_next!5871))
