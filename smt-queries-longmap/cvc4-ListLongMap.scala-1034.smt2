; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21890 () Bool)

(assert start!21890)

(declare-fun b!221587 () Bool)

(declare-fun b_free!5957 () Bool)

(declare-fun b_next!5957 () Bool)

(assert (=> b!221587 (= b_free!5957 (not b_next!5957))))

(declare-fun tp!21013 () Bool)

(declare-fun b_and!12855 () Bool)

(assert (=> b!221587 (= tp!21013 b_and!12855)))

(declare-fun b!221578 () Bool)

(declare-datatypes ((Unit!6623 0))(
  ( (Unit!6624) )
))
(declare-fun e!144001 () Unit!6623)

(declare-fun lt!112438 () Unit!6623)

(assert (=> b!221578 (= e!144001 lt!112438)))

(declare-datatypes ((V!7405 0))(
  ( (V!7406 (val!2954 Int)) )
))
(declare-datatypes ((ValueCell!2566 0))(
  ( (ValueCellFull!2566 (v!4974 V!7405)) (EmptyCell!2566) )
))
(declare-datatypes ((array!10881 0))(
  ( (array!10882 (arr!5160 (Array (_ BitVec 32) ValueCell!2566)) (size!5493 (_ BitVec 32))) )
))
(declare-datatypes ((array!10883 0))(
  ( (array!10884 (arr!5161 (Array (_ BitVec 32) (_ BitVec 64))) (size!5494 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3032 0))(
  ( (LongMapFixedSize!3033 (defaultEntry!4175 Int) (mask!9987 (_ BitVec 32)) (extraKeys!3912 (_ BitVec 32)) (zeroValue!4016 V!7405) (minValue!4016 V!7405) (_size!1565 (_ BitVec 32)) (_keys!6229 array!10883) (_values!4158 array!10881) (_vacant!1565 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3032)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!229 (array!10883 array!10881 (_ BitVec 32) (_ BitVec 32) V!7405 V!7405 (_ BitVec 64) Int) Unit!6623)

(assert (=> b!221578 (= lt!112438 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!229 (_keys!6229 thiss!1504) (_values!4158 thiss!1504) (mask!9987 thiss!1504) (extraKeys!3912 thiss!1504) (zeroValue!4016 thiss!1504) (minValue!4016 thiss!1504) key!932 (defaultEntry!4175 thiss!1504)))))

(declare-fun c!36840 () Bool)

(declare-datatypes ((SeekEntryResult!827 0))(
  ( (MissingZero!827 (index!5478 (_ BitVec 32))) (Found!827 (index!5479 (_ BitVec 32))) (Intermediate!827 (undefined!1639 Bool) (index!5480 (_ BitVec 32)) (x!23015 (_ BitVec 32))) (Undefined!827) (MissingVacant!827 (index!5481 (_ BitVec 32))) )
))
(declare-fun lt!112441 () SeekEntryResult!827)

(assert (=> b!221578 (= c!36840 (is-MissingZero!827 lt!112441))))

(declare-fun e!143999 () Bool)

(assert (=> b!221578 e!143999))

(declare-fun b!221579 () Bool)

(declare-fun res!108710 () Bool)

(declare-fun e!144008 () Bool)

(assert (=> b!221579 (=> (not res!108710) (not e!144008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10883 (_ BitVec 32)) Bool)

(assert (=> b!221579 (= res!108710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6229 thiss!1504) (mask!9987 thiss!1504)))))

(declare-fun b!221580 () Bool)

(declare-fun res!108720 () Bool)

(declare-fun e!144004 () Bool)

(assert (=> b!221580 (=> (not res!108720) (not e!144004))))

(assert (=> b!221580 (= res!108720 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221581 () Bool)

(declare-fun e!144010 () Bool)

(assert (=> b!221581 (= e!144004 e!144010)))

(declare-fun res!108718 () Bool)

(assert (=> b!221581 (=> (not res!108718) (not e!144010))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221581 (= res!108718 (or (= lt!112441 (MissingZero!827 index!297)) (= lt!112441 (MissingVacant!827 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10883 (_ BitVec 32)) SeekEntryResult!827)

(assert (=> b!221581 (= lt!112441 (seekEntryOrOpen!0 key!932 (_keys!6229 thiss!1504) (mask!9987 thiss!1504)))))

(declare-fun res!108712 () Bool)

(assert (=> start!21890 (=> (not res!108712) (not e!144004))))

(declare-fun valid!1224 (LongMapFixedSize!3032) Bool)

(assert (=> start!21890 (= res!108712 (valid!1224 thiss!1504))))

(assert (=> start!21890 e!144004))

(declare-fun e!144007 () Bool)

(assert (=> start!21890 e!144007))

(assert (=> start!21890 true))

(declare-fun b!221582 () Bool)

(declare-fun res!108713 () Bool)

(assert (=> b!221582 (=> (not res!108713) (not e!144008))))

(assert (=> b!221582 (= res!108713 (and (= (size!5493 (_values!4158 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9987 thiss!1504))) (= (size!5494 (_keys!6229 thiss!1504)) (size!5493 (_values!4158 thiss!1504))) (bvsge (mask!9987 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3912 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3912 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!221583 () Bool)

(assert (=> b!221583 (= e!144008 false)))

(declare-fun lt!112439 () Bool)

(declare-datatypes ((List!3286 0))(
  ( (Nil!3283) (Cons!3282 (h!3930 (_ BitVec 64)) (t!8245 List!3286)) )
))
(declare-fun arrayNoDuplicates!0 (array!10883 (_ BitVec 32) List!3286) Bool)

(assert (=> b!221583 (= lt!112439 (arrayNoDuplicates!0 (_keys!6229 thiss!1504) #b00000000000000000000000000000000 Nil!3283))))

(declare-fun mapIsEmpty!9898 () Bool)

(declare-fun mapRes!9898 () Bool)

(assert (=> mapIsEmpty!9898 mapRes!9898))

(declare-fun b!221584 () Bool)

(assert (=> b!221584 (= e!144010 e!144008)))

(declare-fun res!108716 () Bool)

(assert (=> b!221584 (=> (not res!108716) (not e!144008))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!221584 (= res!108716 (inRange!0 index!297 (mask!9987 thiss!1504)))))

(declare-fun lt!112440 () Unit!6623)

(assert (=> b!221584 (= lt!112440 e!144001)))

(declare-fun c!36838 () Bool)

(declare-datatypes ((tuple2!4384 0))(
  ( (tuple2!4385 (_1!2203 (_ BitVec 64)) (_2!2203 V!7405)) )
))
(declare-datatypes ((List!3287 0))(
  ( (Nil!3284) (Cons!3283 (h!3931 tuple2!4384) (t!8246 List!3287)) )
))
(declare-datatypes ((ListLongMap!3297 0))(
  ( (ListLongMap!3298 (toList!1664 List!3287)) )
))
(declare-fun contains!1507 (ListLongMap!3297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1192 (array!10883 array!10881 (_ BitVec 32) (_ BitVec 32) V!7405 V!7405 (_ BitVec 32) Int) ListLongMap!3297)

(assert (=> b!221584 (= c!36838 (contains!1507 (getCurrentListMap!1192 (_keys!6229 thiss!1504) (_values!4158 thiss!1504) (mask!9987 thiss!1504) (extraKeys!3912 thiss!1504) (zeroValue!4016 thiss!1504) (minValue!4016 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4175 thiss!1504)) key!932))))

(declare-fun b!221585 () Bool)

(declare-fun c!36839 () Bool)

(assert (=> b!221585 (= c!36839 (is-MissingVacant!827 lt!112441))))

(declare-fun e!144002 () Bool)

(assert (=> b!221585 (= e!143999 e!144002)))

(declare-fun b!221586 () Bool)

(declare-fun e!144011 () Bool)

(declare-fun tp_is_empty!5819 () Bool)

(assert (=> b!221586 (= e!144011 tp_is_empty!5819)))

(declare-fun e!144006 () Bool)

(declare-fun array_inv!3417 (array!10883) Bool)

(declare-fun array_inv!3418 (array!10881) Bool)

(assert (=> b!221587 (= e!144007 (and tp!21013 tp_is_empty!5819 (array_inv!3417 (_keys!6229 thiss!1504)) (array_inv!3418 (_values!4158 thiss!1504)) e!144006))))

(declare-fun b!221588 () Bool)

(assert (=> b!221588 (= e!144002 (is-Undefined!827 lt!112441))))

(declare-fun b!221589 () Bool)

(declare-fun res!108717 () Bool)

(declare-fun e!144003 () Bool)

(assert (=> b!221589 (=> (not res!108717) (not e!144003))))

(declare-fun call!20705 () Bool)

(assert (=> b!221589 (= res!108717 call!20705)))

(assert (=> b!221589 (= e!143999 e!144003)))

(declare-fun mapNonEmpty!9898 () Bool)

(declare-fun tp!21012 () Bool)

(assert (=> mapNonEmpty!9898 (= mapRes!9898 (and tp!21012 e!144011))))

(declare-fun mapValue!9898 () ValueCell!2566)

(declare-fun mapRest!9898 () (Array (_ BitVec 32) ValueCell!2566))

(declare-fun mapKey!9898 () (_ BitVec 32))

(assert (=> mapNonEmpty!9898 (= (arr!5160 (_values!4158 thiss!1504)) (store mapRest!9898 mapKey!9898 mapValue!9898))))

(declare-fun bm!20702 () Bool)

(assert (=> bm!20702 (= call!20705 (inRange!0 (ite c!36840 (index!5478 lt!112441) (index!5481 lt!112441)) (mask!9987 thiss!1504)))))

(declare-fun b!221590 () Bool)

(declare-fun res!108719 () Bool)

(assert (=> b!221590 (= res!108719 (= (select (arr!5161 (_keys!6229 thiss!1504)) (index!5481 lt!112441)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!144005 () Bool)

(assert (=> b!221590 (=> (not res!108719) (not e!144005))))

(declare-fun b!221591 () Bool)

(assert (=> b!221591 (= e!144002 e!144005)))

(declare-fun res!108721 () Bool)

(assert (=> b!221591 (= res!108721 call!20705)))

(assert (=> b!221591 (=> (not res!108721) (not e!144005))))

(declare-fun b!221592 () Bool)

(declare-fun res!108711 () Bool)

(assert (=> b!221592 (=> (not res!108711) (not e!144008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!221592 (= res!108711 (validMask!0 (mask!9987 thiss!1504)))))

(declare-fun b!221593 () Bool)

(declare-fun res!108714 () Bool)

(assert (=> b!221593 (=> (not res!108714) (not e!144008))))

(declare-fun arrayContainsKey!0 (array!10883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!221593 (= res!108714 (arrayContainsKey!0 (_keys!6229 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221594 () Bool)

(declare-fun e!144000 () Bool)

(assert (=> b!221594 (= e!144000 tp_is_empty!5819)))

(declare-fun bm!20703 () Bool)

(declare-fun call!20706 () Bool)

(assert (=> bm!20703 (= call!20706 (arrayContainsKey!0 (_keys!6229 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221595 () Bool)

(declare-fun res!108715 () Bool)

(assert (=> b!221595 (=> (not res!108715) (not e!144003))))

(assert (=> b!221595 (= res!108715 (= (select (arr!5161 (_keys!6229 thiss!1504)) (index!5478 lt!112441)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!221596 () Bool)

(assert (=> b!221596 (= e!144003 (not call!20706))))

(declare-fun b!221597 () Bool)

(assert (=> b!221597 (= e!144006 (and e!144000 mapRes!9898))))

(declare-fun condMapEmpty!9898 () Bool)

(declare-fun mapDefault!9898 () ValueCell!2566)

