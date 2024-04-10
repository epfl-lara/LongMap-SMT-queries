; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21872 () Bool)

(assert start!21872)

(declare-fun b!220997 () Bool)

(declare-fun b_free!5939 () Bool)

(declare-fun b_next!5939 () Bool)

(assert (=> b!220997 (= b_free!5939 (not b_next!5939))))

(declare-fun tp!20959 () Bool)

(declare-fun b_and!12837 () Bool)

(assert (=> b!220997 (= tp!20959 b_and!12837)))

(declare-fun b!220984 () Bool)

(declare-fun res!108392 () Bool)

(declare-fun e!143656 () Bool)

(assert (=> b!220984 (=> (not res!108392) (not e!143656))))

(declare-fun call!20652 () Bool)

(assert (=> b!220984 (= res!108392 call!20652)))

(declare-fun e!143659 () Bool)

(assert (=> b!220984 (= e!143659 e!143656)))

(declare-fun b!220985 () Bool)

(declare-fun e!143652 () Bool)

(assert (=> b!220985 (= e!143652 false)))

(declare-fun lt!112305 () Bool)

(declare-datatypes ((V!7381 0))(
  ( (V!7382 (val!2945 Int)) )
))
(declare-datatypes ((ValueCell!2557 0))(
  ( (ValueCellFull!2557 (v!4965 V!7381)) (EmptyCell!2557) )
))
(declare-datatypes ((array!10845 0))(
  ( (array!10846 (arr!5142 (Array (_ BitVec 32) ValueCell!2557)) (size!5475 (_ BitVec 32))) )
))
(declare-datatypes ((array!10847 0))(
  ( (array!10848 (arr!5143 (Array (_ BitVec 32) (_ BitVec 64))) (size!5476 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3014 0))(
  ( (LongMapFixedSize!3015 (defaultEntry!4166 Int) (mask!9972 (_ BitVec 32)) (extraKeys!3903 (_ BitVec 32)) (zeroValue!4007 V!7381) (minValue!4007 V!7381) (_size!1556 (_ BitVec 32)) (_keys!6220 array!10847) (_values!4149 array!10845) (_vacant!1556 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3014)

(declare-datatypes ((List!3273 0))(
  ( (Nil!3270) (Cons!3269 (h!3917 (_ BitVec 64)) (t!8232 List!3273)) )
))
(declare-fun arrayNoDuplicates!0 (array!10847 (_ BitVec 32) List!3273) Bool)

(assert (=> b!220985 (= lt!112305 (arrayNoDuplicates!0 (_keys!6220 thiss!1504) #b00000000000000000000000000000000 Nil!3270))))

(declare-fun b!220986 () Bool)

(declare-fun e!143660 () Bool)

(declare-fun call!20651 () Bool)

(assert (=> b!220986 (= e!143660 (not call!20651))))

(declare-fun b!220987 () Bool)

(declare-fun res!108397 () Bool)

(assert (=> b!220987 (=> (not res!108397) (not e!143652))))

(assert (=> b!220987 (= res!108397 (and (= (size!5475 (_values!4149 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9972 thiss!1504))) (= (size!5476 (_keys!6220 thiss!1504)) (size!5475 (_values!4149 thiss!1504))) (bvsge (mask!9972 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3903 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3903 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220988 () Bool)

(declare-fun res!108396 () Bool)

(declare-datatypes ((SeekEntryResult!819 0))(
  ( (MissingZero!819 (index!5446 (_ BitVec 32))) (Found!819 (index!5447 (_ BitVec 32))) (Intermediate!819 (undefined!1631 Bool) (index!5448 (_ BitVec 32)) (x!22983 (_ BitVec 32))) (Undefined!819) (MissingVacant!819 (index!5449 (_ BitVec 32))) )
))
(declare-fun lt!112303 () SeekEntryResult!819)

(assert (=> b!220988 (= res!108396 (= (select (arr!5143 (_keys!6220 thiss!1504)) (index!5449 lt!112303)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!220988 (=> (not res!108396) (not e!143660))))

(declare-fun b!220989 () Bool)

(declare-fun e!143658 () Bool)

(assert (=> b!220989 (= e!143658 e!143660)))

(declare-fun res!108386 () Bool)

(assert (=> b!220989 (= res!108386 call!20652)))

(assert (=> b!220989 (=> (not res!108386) (not e!143660))))

(declare-fun b!220990 () Bool)

(declare-fun res!108393 () Bool)

(assert (=> b!220990 (=> (not res!108393) (not e!143652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10847 (_ BitVec 32)) Bool)

(assert (=> b!220990 (= res!108393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6220 thiss!1504) (mask!9972 thiss!1504)))))

(declare-fun res!108389 () Bool)

(declare-fun e!143649 () Bool)

(assert (=> start!21872 (=> (not res!108389) (not e!143649))))

(declare-fun valid!1216 (LongMapFixedSize!3014) Bool)

(assert (=> start!21872 (= res!108389 (valid!1216 thiss!1504))))

(assert (=> start!21872 e!143649))

(declare-fun e!143657 () Bool)

(assert (=> start!21872 e!143657))

(assert (=> start!21872 true))

(declare-fun b!220991 () Bool)

(declare-datatypes ((Unit!6597 0))(
  ( (Unit!6598) )
))
(declare-fun e!143650 () Unit!6597)

(declare-fun lt!112304 () Unit!6597)

(assert (=> b!220991 (= e!143650 lt!112304)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!221 (array!10847 array!10845 (_ BitVec 32) (_ BitVec 32) V!7381 V!7381 (_ BitVec 64) Int) Unit!6597)

(assert (=> b!220991 (= lt!112304 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!221 (_keys!6220 thiss!1504) (_values!4149 thiss!1504) (mask!9972 thiss!1504) (extraKeys!3903 thiss!1504) (zeroValue!4007 thiss!1504) (minValue!4007 thiss!1504) key!932 (defaultEntry!4166 thiss!1504)))))

(declare-fun c!36759 () Bool)

(assert (=> b!220991 (= c!36759 (is-MissingZero!819 lt!112303))))

(assert (=> b!220991 e!143659))

(declare-fun b!220992 () Bool)

(declare-fun e!143654 () Bool)

(assert (=> b!220992 (= e!143649 e!143654)))

(declare-fun res!108395 () Bool)

(assert (=> b!220992 (=> (not res!108395) (not e!143654))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220992 (= res!108395 (or (= lt!112303 (MissingZero!819 index!297)) (= lt!112303 (MissingVacant!819 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10847 (_ BitVec 32)) SeekEntryResult!819)

(assert (=> b!220992 (= lt!112303 (seekEntryOrOpen!0 key!932 (_keys!6220 thiss!1504) (mask!9972 thiss!1504)))))

(declare-fun b!220993 () Bool)

(declare-fun e!143653 () Bool)

(declare-fun tp_is_empty!5801 () Bool)

(assert (=> b!220993 (= e!143653 tp_is_empty!5801)))

(declare-fun mapIsEmpty!9871 () Bool)

(declare-fun mapRes!9871 () Bool)

(assert (=> mapIsEmpty!9871 mapRes!9871))

(declare-fun bm!20648 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20648 (= call!20652 (inRange!0 (ite c!36759 (index!5446 lt!112303) (index!5449 lt!112303)) (mask!9972 thiss!1504)))))

(declare-fun b!220994 () Bool)

(declare-fun e!143655 () Bool)

(assert (=> b!220994 (= e!143655 tp_is_empty!5801)))

(declare-fun b!220995 () Bool)

(declare-fun c!36757 () Bool)

(assert (=> b!220995 (= c!36757 (is-MissingVacant!819 lt!112303))))

(assert (=> b!220995 (= e!143659 e!143658)))

(declare-fun b!220996 () Bool)

(assert (=> b!220996 (= e!143654 e!143652)))

(declare-fun res!108394 () Bool)

(assert (=> b!220996 (=> (not res!108394) (not e!143652))))

(assert (=> b!220996 (= res!108394 (inRange!0 index!297 (mask!9972 thiss!1504)))))

(declare-fun lt!112307 () Unit!6597)

(assert (=> b!220996 (= lt!112307 e!143650)))

(declare-fun c!36758 () Bool)

(declare-datatypes ((tuple2!4370 0))(
  ( (tuple2!4371 (_1!2196 (_ BitVec 64)) (_2!2196 V!7381)) )
))
(declare-datatypes ((List!3274 0))(
  ( (Nil!3271) (Cons!3270 (h!3918 tuple2!4370) (t!8233 List!3274)) )
))
(declare-datatypes ((ListLongMap!3283 0))(
  ( (ListLongMap!3284 (toList!1657 List!3274)) )
))
(declare-fun contains!1500 (ListLongMap!3283 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1185 (array!10847 array!10845 (_ BitVec 32) (_ BitVec 32) V!7381 V!7381 (_ BitVec 32) Int) ListLongMap!3283)

(assert (=> b!220996 (= c!36758 (contains!1500 (getCurrentListMap!1185 (_keys!6220 thiss!1504) (_values!4149 thiss!1504) (mask!9972 thiss!1504) (extraKeys!3903 thiss!1504) (zeroValue!4007 thiss!1504) (minValue!4007 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4166 thiss!1504)) key!932))))

(declare-fun e!143651 () Bool)

(declare-fun array_inv!3403 (array!10847) Bool)

(declare-fun array_inv!3404 (array!10845) Bool)

(assert (=> b!220997 (= e!143657 (and tp!20959 tp_is_empty!5801 (array_inv!3403 (_keys!6220 thiss!1504)) (array_inv!3404 (_values!4149 thiss!1504)) e!143651))))

(declare-fun b!220998 () Bool)

(assert (=> b!220998 (= e!143658 (is-Undefined!819 lt!112303))))

(declare-fun bm!20649 () Bool)

(declare-fun arrayContainsKey!0 (array!10847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20649 (= call!20651 (arrayContainsKey!0 (_keys!6220 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220999 () Bool)

(declare-fun res!108390 () Bool)

(assert (=> b!220999 (=> (not res!108390) (not e!143652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220999 (= res!108390 (validMask!0 (mask!9972 thiss!1504)))))

(declare-fun b!221000 () Bool)

(assert (=> b!221000 (= e!143651 (and e!143653 mapRes!9871))))

(declare-fun condMapEmpty!9871 () Bool)

(declare-fun mapDefault!9871 () ValueCell!2557)

