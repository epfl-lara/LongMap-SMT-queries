; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21864 () Bool)

(assert start!21864)

(declare-fun b!220728 () Bool)

(declare-fun b_free!5931 () Bool)

(declare-fun b_next!5931 () Bool)

(assert (=> b!220728 (= b_free!5931 (not b_next!5931))))

(declare-fun tp!20935 () Bool)

(declare-fun b_and!12829 () Bool)

(assert (=> b!220728 (= tp!20935 b_and!12829)))

(declare-fun res!108253 () Bool)

(declare-fun e!143492 () Bool)

(assert (=> start!21864 (=> (not res!108253) (not e!143492))))

(declare-datatypes ((V!7371 0))(
  ( (V!7372 (val!2941 Int)) )
))
(declare-datatypes ((ValueCell!2553 0))(
  ( (ValueCellFull!2553 (v!4961 V!7371)) (EmptyCell!2553) )
))
(declare-datatypes ((array!10829 0))(
  ( (array!10830 (arr!5134 (Array (_ BitVec 32) ValueCell!2553)) (size!5467 (_ BitVec 32))) )
))
(declare-datatypes ((array!10831 0))(
  ( (array!10832 (arr!5135 (Array (_ BitVec 32) (_ BitVec 64))) (size!5468 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3006 0))(
  ( (LongMapFixedSize!3007 (defaultEntry!4162 Int) (mask!9966 (_ BitVec 32)) (extraKeys!3899 (_ BitVec 32)) (zeroValue!4003 V!7371) (minValue!4003 V!7371) (_size!1552 (_ BitVec 32)) (_keys!6216 array!10831) (_values!4145 array!10829) (_vacant!1552 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3006)

(declare-fun valid!1212 (LongMapFixedSize!3006) Bool)

(assert (=> start!21864 (= res!108253 (valid!1212 thiss!1504))))

(assert (=> start!21864 e!143492))

(declare-fun e!143504 () Bool)

(assert (=> start!21864 e!143504))

(assert (=> start!21864 true))

(declare-fun b!220720 () Bool)

(declare-fun e!143499 () Bool)

(declare-fun tp_is_empty!5793 () Bool)

(assert (=> b!220720 (= e!143499 tp_is_empty!5793)))

(declare-fun b!220721 () Bool)

(declare-fun res!108246 () Bool)

(assert (=> b!220721 (=> (not res!108246) (not e!143492))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!220721 (= res!108246 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220722 () Bool)

(declare-fun res!108252 () Bool)

(declare-fun e!143496 () Bool)

(assert (=> b!220722 (=> (not res!108252) (not e!143496))))

(declare-fun call!20627 () Bool)

(assert (=> b!220722 (= res!108252 call!20627)))

(declare-fun e!143493 () Bool)

(assert (=> b!220722 (= e!143493 e!143496)))

(declare-fun b!220723 () Bool)

(declare-datatypes ((Unit!6585 0))(
  ( (Unit!6586) )
))
(declare-fun e!143502 () Unit!6585)

(declare-fun Unit!6587 () Unit!6585)

(assert (=> b!220723 (= e!143502 Unit!6587)))

(declare-fun lt!112244 () Unit!6585)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!206 (array!10831 array!10829 (_ BitVec 32) (_ BitVec 32) V!7371 V!7371 (_ BitVec 64) Int) Unit!6585)

(assert (=> b!220723 (= lt!112244 (lemmaInListMapThenSeekEntryOrOpenFindsIt!206 (_keys!6216 thiss!1504) (_values!4145 thiss!1504) (mask!9966 thiss!1504) (extraKeys!3899 thiss!1504) (zeroValue!4003 thiss!1504) (minValue!4003 thiss!1504) key!932 (defaultEntry!4162 thiss!1504)))))

(assert (=> b!220723 false))

(declare-fun b!220724 () Bool)

(declare-fun res!108250 () Bool)

(declare-fun e!143501 () Bool)

(assert (=> b!220724 (=> (not res!108250) (not e!143501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220724 (= res!108250 (validMask!0 (mask!9966 thiss!1504)))))

(declare-fun b!220725 () Bool)

(declare-fun c!36722 () Bool)

(declare-datatypes ((SeekEntryResult!815 0))(
  ( (MissingZero!815 (index!5430 (_ BitVec 32))) (Found!815 (index!5431 (_ BitVec 32))) (Intermediate!815 (undefined!1627 Bool) (index!5432 (_ BitVec 32)) (x!22971 (_ BitVec 32))) (Undefined!815) (MissingVacant!815 (index!5433 (_ BitVec 32))) )
))
(declare-fun lt!112245 () SeekEntryResult!815)

(get-info :version)

(assert (=> b!220725 (= c!36722 ((_ is MissingVacant!815) lt!112245))))

(declare-fun e!143494 () Bool)

(assert (=> b!220725 (= e!143493 e!143494)))

(declare-fun b!220726 () Bool)

(declare-fun res!108247 () Bool)

(assert (=> b!220726 (= res!108247 (= (select (arr!5135 (_keys!6216 thiss!1504)) (index!5433 lt!112245)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143500 () Bool)

(assert (=> b!220726 (=> (not res!108247) (not e!143500))))

(declare-fun b!220727 () Bool)

(declare-fun lt!112246 () Unit!6585)

(assert (=> b!220727 (= e!143502 lt!112246)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!218 (array!10831 array!10829 (_ BitVec 32) (_ BitVec 32) V!7371 V!7371 (_ BitVec 64) Int) Unit!6585)

(assert (=> b!220727 (= lt!112246 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!218 (_keys!6216 thiss!1504) (_values!4145 thiss!1504) (mask!9966 thiss!1504) (extraKeys!3899 thiss!1504) (zeroValue!4003 thiss!1504) (minValue!4003 thiss!1504) key!932 (defaultEntry!4162 thiss!1504)))))

(declare-fun c!36721 () Bool)

(assert (=> b!220727 (= c!36721 ((_ is MissingZero!815) lt!112245))))

(assert (=> b!220727 e!143493))

(declare-fun e!143495 () Bool)

(declare-fun array_inv!3397 (array!10831) Bool)

(declare-fun array_inv!3398 (array!10829) Bool)

(assert (=> b!220728 (= e!143504 (and tp!20935 tp_is_empty!5793 (array_inv!3397 (_keys!6216 thiss!1504)) (array_inv!3398 (_values!4145 thiss!1504)) e!143495))))

(declare-fun b!220729 () Bool)

(assert (=> b!220729 (= e!143494 e!143500)))

(declare-fun res!108249 () Bool)

(assert (=> b!220729 (= res!108249 call!20627)))

(assert (=> b!220729 (=> (not res!108249) (not e!143500))))

(declare-fun bm!20624 () Bool)

(declare-fun call!20628 () Bool)

(declare-fun arrayContainsKey!0 (array!10831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20624 (= call!20628 (arrayContainsKey!0 (_keys!6216 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220730 () Bool)

(assert (=> b!220730 (= e!143496 (not call!20628))))

(declare-fun b!220731 () Bool)

(declare-fun res!108251 () Bool)

(assert (=> b!220731 (=> (not res!108251) (not e!143501))))

(assert (=> b!220731 (= res!108251 (arrayContainsKey!0 (_keys!6216 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220732 () Bool)

(declare-fun e!143497 () Bool)

(assert (=> b!220732 (= e!143492 e!143497)))

(declare-fun res!108245 () Bool)

(assert (=> b!220732 (=> (not res!108245) (not e!143497))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220732 (= res!108245 (or (= lt!112245 (MissingZero!815 index!297)) (= lt!112245 (MissingVacant!815 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10831 (_ BitVec 32)) SeekEntryResult!815)

(assert (=> b!220732 (= lt!112245 (seekEntryOrOpen!0 key!932 (_keys!6216 thiss!1504) (mask!9966 thiss!1504)))))

(declare-fun bm!20625 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20625 (= call!20627 (inRange!0 (ite c!36721 (index!5430 lt!112245) (index!5433 lt!112245)) (mask!9966 thiss!1504)))))

(declare-fun mapNonEmpty!9859 () Bool)

(declare-fun mapRes!9859 () Bool)

(declare-fun tp!20934 () Bool)

(declare-fun e!143503 () Bool)

(assert (=> mapNonEmpty!9859 (= mapRes!9859 (and tp!20934 e!143503))))

(declare-fun mapKey!9859 () (_ BitVec 32))

(declare-fun mapRest!9859 () (Array (_ BitVec 32) ValueCell!2553))

(declare-fun mapValue!9859 () ValueCell!2553)

(assert (=> mapNonEmpty!9859 (= (arr!5134 (_values!4145 thiss!1504)) (store mapRest!9859 mapKey!9859 mapValue!9859))))

(declare-fun b!220733 () Bool)

(assert (=> b!220733 (= e!143495 (and e!143499 mapRes!9859))))

(declare-fun condMapEmpty!9859 () Bool)

(declare-fun mapDefault!9859 () ValueCell!2553)

(assert (=> b!220733 (= condMapEmpty!9859 (= (arr!5134 (_values!4145 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2553)) mapDefault!9859)))))

(declare-fun b!220734 () Bool)

(assert (=> b!220734 (= e!143501 false)))

(declare-fun lt!112243 () Bool)

(declare-datatypes ((List!3265 0))(
  ( (Nil!3262) (Cons!3261 (h!3909 (_ BitVec 64)) (t!8224 List!3265)) )
))
(declare-fun arrayNoDuplicates!0 (array!10831 (_ BitVec 32) List!3265) Bool)

(assert (=> b!220734 (= lt!112243 (arrayNoDuplicates!0 (_keys!6216 thiss!1504) #b00000000000000000000000000000000 Nil!3262))))

(declare-fun b!220735 () Bool)

(assert (=> b!220735 (= e!143503 tp_is_empty!5793)))

(declare-fun b!220736 () Bool)

(assert (=> b!220736 (= e!143500 (not call!20628))))

(declare-fun b!220737 () Bool)

(declare-fun res!108244 () Bool)

(assert (=> b!220737 (=> (not res!108244) (not e!143501))))

(assert (=> b!220737 (= res!108244 (and (= (size!5467 (_values!4145 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9966 thiss!1504))) (= (size!5468 (_keys!6216 thiss!1504)) (size!5467 (_values!4145 thiss!1504))) (bvsge (mask!9966 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3899 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3899 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220738 () Bool)

(declare-fun res!108248 () Bool)

(assert (=> b!220738 (=> (not res!108248) (not e!143501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10831 (_ BitVec 32)) Bool)

(assert (=> b!220738 (= res!108248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6216 thiss!1504) (mask!9966 thiss!1504)))))

(declare-fun b!220739 () Bool)

(assert (=> b!220739 (= e!143494 ((_ is Undefined!815) lt!112245))))

(declare-fun b!220740 () Bool)

(declare-fun res!108243 () Bool)

(assert (=> b!220740 (=> (not res!108243) (not e!143496))))

(assert (=> b!220740 (= res!108243 (= (select (arr!5135 (_keys!6216 thiss!1504)) (index!5430 lt!112245)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220741 () Bool)

(assert (=> b!220741 (= e!143497 e!143501)))

(declare-fun res!108242 () Bool)

(assert (=> b!220741 (=> (not res!108242) (not e!143501))))

(assert (=> b!220741 (= res!108242 (inRange!0 index!297 (mask!9966 thiss!1504)))))

(declare-fun lt!112247 () Unit!6585)

(assert (=> b!220741 (= lt!112247 e!143502)))

(declare-fun c!36723 () Bool)

(declare-datatypes ((tuple2!4362 0))(
  ( (tuple2!4363 (_1!2192 (_ BitVec 64)) (_2!2192 V!7371)) )
))
(declare-datatypes ((List!3266 0))(
  ( (Nil!3263) (Cons!3262 (h!3910 tuple2!4362) (t!8225 List!3266)) )
))
(declare-datatypes ((ListLongMap!3275 0))(
  ( (ListLongMap!3276 (toList!1653 List!3266)) )
))
(declare-fun contains!1496 (ListLongMap!3275 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1181 (array!10831 array!10829 (_ BitVec 32) (_ BitVec 32) V!7371 V!7371 (_ BitVec 32) Int) ListLongMap!3275)

(assert (=> b!220741 (= c!36723 (contains!1496 (getCurrentListMap!1181 (_keys!6216 thiss!1504) (_values!4145 thiss!1504) (mask!9966 thiss!1504) (extraKeys!3899 thiss!1504) (zeroValue!4003 thiss!1504) (minValue!4003 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4162 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!9859 () Bool)

(assert (=> mapIsEmpty!9859 mapRes!9859))

(assert (= (and start!21864 res!108253) b!220721))

(assert (= (and b!220721 res!108246) b!220732))

(assert (= (and b!220732 res!108245) b!220741))

(assert (= (and b!220741 c!36723) b!220723))

(assert (= (and b!220741 (not c!36723)) b!220727))

(assert (= (and b!220727 c!36721) b!220722))

(assert (= (and b!220727 (not c!36721)) b!220725))

(assert (= (and b!220722 res!108252) b!220740))

(assert (= (and b!220740 res!108243) b!220730))

(assert (= (and b!220725 c!36722) b!220729))

(assert (= (and b!220725 (not c!36722)) b!220739))

(assert (= (and b!220729 res!108249) b!220726))

(assert (= (and b!220726 res!108247) b!220736))

(assert (= (or b!220722 b!220729) bm!20625))

(assert (= (or b!220730 b!220736) bm!20624))

(assert (= (and b!220741 res!108242) b!220731))

(assert (= (and b!220731 res!108251) b!220724))

(assert (= (and b!220724 res!108250) b!220737))

(assert (= (and b!220737 res!108244) b!220738))

(assert (= (and b!220738 res!108248) b!220734))

(assert (= (and b!220733 condMapEmpty!9859) mapIsEmpty!9859))

(assert (= (and b!220733 (not condMapEmpty!9859)) mapNonEmpty!9859))

(assert (= (and mapNonEmpty!9859 ((_ is ValueCellFull!2553) mapValue!9859)) b!220735))

(assert (= (and b!220733 ((_ is ValueCellFull!2553) mapDefault!9859)) b!220720))

(assert (= b!220728 b!220733))

(assert (= start!21864 b!220728))

(declare-fun m!245709 () Bool)

(assert (=> start!21864 m!245709))

(declare-fun m!245711 () Bool)

(assert (=> b!220727 m!245711))

(declare-fun m!245713 () Bool)

(assert (=> b!220726 m!245713))

(declare-fun m!245715 () Bool)

(assert (=> b!220734 m!245715))

(declare-fun m!245717 () Bool)

(assert (=> mapNonEmpty!9859 m!245717))

(declare-fun m!245719 () Bool)

(assert (=> b!220723 m!245719))

(declare-fun m!245721 () Bool)

(assert (=> bm!20625 m!245721))

(declare-fun m!245723 () Bool)

(assert (=> b!220724 m!245723))

(declare-fun m!245725 () Bool)

(assert (=> b!220740 m!245725))

(declare-fun m!245727 () Bool)

(assert (=> b!220732 m!245727))

(declare-fun m!245729 () Bool)

(assert (=> b!220741 m!245729))

(declare-fun m!245731 () Bool)

(assert (=> b!220741 m!245731))

(assert (=> b!220741 m!245731))

(declare-fun m!245733 () Bool)

(assert (=> b!220741 m!245733))

(declare-fun m!245735 () Bool)

(assert (=> b!220728 m!245735))

(declare-fun m!245737 () Bool)

(assert (=> b!220728 m!245737))

(declare-fun m!245739 () Bool)

(assert (=> bm!20624 m!245739))

(declare-fun m!245741 () Bool)

(assert (=> b!220738 m!245741))

(assert (=> b!220731 m!245739))

(check-sat (not b_next!5931) (not b!220723) b_and!12829 (not b!220738) (not start!21864) (not b!220741) (not b!220731) (not b!220728) (not b!220734) (not b!220732) (not b!220724) tp_is_empty!5793 (not bm!20624) (not bm!20625) (not b!220727) (not mapNonEmpty!9859))
(check-sat b_and!12829 (not b_next!5931))
