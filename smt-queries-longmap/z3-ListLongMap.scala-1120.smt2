; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22968 () Bool)

(assert start!22968)

(declare-fun b!240602 () Bool)

(declare-fun b_free!6471 () Bool)

(declare-fun b_next!6471 () Bool)

(assert (=> b!240602 (= b_free!6471 (not b_next!6471))))

(declare-fun tp!22616 () Bool)

(declare-fun b_and!13437 () Bool)

(assert (=> b!240602 (= tp!22616 b_and!13437)))

(declare-fun b!240600 () Bool)

(declare-fun e!156160 () Bool)

(declare-fun call!22373 () Bool)

(assert (=> b!240600 (= e!156160 (not call!22373))))

(declare-fun b!240601 () Bool)

(declare-fun e!156151 () Bool)

(assert (=> b!240601 (= e!156151 e!156160)))

(declare-fun res!117989 () Bool)

(declare-fun call!22374 () Bool)

(assert (=> b!240601 (= res!117989 call!22374)))

(assert (=> b!240601 (=> (not res!117989) (not e!156160))))

(declare-fun bm!22370 () Bool)

(declare-datatypes ((V!8091 0))(
  ( (V!8092 (val!3211 Int)) )
))
(declare-datatypes ((ValueCell!2823 0))(
  ( (ValueCellFull!2823 (v!5249 V!8091)) (EmptyCell!2823) )
))
(declare-datatypes ((array!11945 0))(
  ( (array!11946 (arr!5674 (Array (_ BitVec 32) ValueCell!2823)) (size!6015 (_ BitVec 32))) )
))
(declare-datatypes ((array!11947 0))(
  ( (array!11948 (arr!5675 (Array (_ BitVec 32) (_ BitVec 64))) (size!6016 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3546 0))(
  ( (LongMapFixedSize!3547 (defaultEntry!4458 Int) (mask!10516 (_ BitVec 32)) (extraKeys!4195 (_ BitVec 32)) (zeroValue!4299 V!8091) (minValue!4299 V!8091) (_size!1822 (_ BitVec 32)) (_keys!6560 array!11947) (_values!4441 array!11945) (_vacant!1822 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3546)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22370 (= call!22373 (arrayContainsKey!0 (_keys!6560 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun e!156157 () Bool)

(declare-fun tp_is_empty!6333 () Bool)

(declare-fun e!156156 () Bool)

(declare-fun array_inv!3753 (array!11947) Bool)

(declare-fun array_inv!3754 (array!11945) Bool)

(assert (=> b!240602 (= e!156157 (and tp!22616 tp_is_empty!6333 (array_inv!3753 (_keys!6560 thiss!1504)) (array_inv!3754 (_values!4441 thiss!1504)) e!156156))))

(declare-fun b!240603 () Bool)

(declare-fun c!40071 () Bool)

(declare-datatypes ((SeekEntryResult!1048 0))(
  ( (MissingZero!1048 (index!6362 (_ BitVec 32))) (Found!1048 (index!6363 (_ BitVec 32))) (Intermediate!1048 (undefined!1860 Bool) (index!6364 (_ BitVec 32)) (x!24168 (_ BitVec 32))) (Undefined!1048) (MissingVacant!1048 (index!6365 (_ BitVec 32))) )
))
(declare-fun lt!121010 () SeekEntryResult!1048)

(get-info :version)

(assert (=> b!240603 (= c!40071 ((_ is MissingVacant!1048) lt!121010))))

(declare-fun e!156152 () Bool)

(assert (=> b!240603 (= e!156152 e!156151)))

(declare-fun b!240604 () Bool)

(declare-fun res!117981 () Bool)

(declare-fun e!156161 () Bool)

(assert (=> b!240604 (=> (not res!117981) (not e!156161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11947 (_ BitVec 32)) Bool)

(assert (=> b!240604 (= res!117981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6560 thiss!1504) (mask!10516 thiss!1504)))))

(declare-fun b!240605 () Bool)

(assert (=> b!240605 (= e!156161 false)))

(declare-fun lt!121008 () Bool)

(declare-datatypes ((List!3614 0))(
  ( (Nil!3611) (Cons!3610 (h!4266 (_ BitVec 64)) (t!8609 List!3614)) )
))
(declare-fun arrayNoDuplicates!0 (array!11947 (_ BitVec 32) List!3614) Bool)

(assert (=> b!240605 (= lt!121008 (arrayNoDuplicates!0 (_keys!6560 thiss!1504) #b00000000000000000000000000000000 Nil!3611))))

(declare-fun mapIsEmpty!10731 () Bool)

(declare-fun mapRes!10731 () Bool)

(assert (=> mapIsEmpty!10731 mapRes!10731))

(declare-fun b!240606 () Bool)

(declare-datatypes ((Unit!7402 0))(
  ( (Unit!7403) )
))
(declare-fun e!156162 () Unit!7402)

(declare-fun Unit!7404 () Unit!7402)

(assert (=> b!240606 (= e!156162 Unit!7404)))

(declare-fun lt!121011 () Unit!7402)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!342 (array!11947 array!11945 (_ BitVec 32) (_ BitVec 32) V!8091 V!8091 (_ BitVec 64) Int) Unit!7402)

(assert (=> b!240606 (= lt!121011 (lemmaInListMapThenSeekEntryOrOpenFindsIt!342 (_keys!6560 thiss!1504) (_values!4441 thiss!1504) (mask!10516 thiss!1504) (extraKeys!4195 thiss!1504) (zeroValue!4299 thiss!1504) (minValue!4299 thiss!1504) key!932 (defaultEntry!4458 thiss!1504)))))

(assert (=> b!240606 false))

(declare-fun b!240607 () Bool)

(declare-fun e!156154 () Bool)

(assert (=> b!240607 (= e!156156 (and e!156154 mapRes!10731))))

(declare-fun condMapEmpty!10731 () Bool)

(declare-fun mapDefault!10731 () ValueCell!2823)

(assert (=> b!240607 (= condMapEmpty!10731 (= (arr!5674 (_values!4441 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2823)) mapDefault!10731)))))

(declare-fun res!117982 () Bool)

(declare-fun e!156159 () Bool)

(assert (=> start!22968 (=> (not res!117982) (not e!156159))))

(declare-fun valid!1395 (LongMapFixedSize!3546) Bool)

(assert (=> start!22968 (= res!117982 (valid!1395 thiss!1504))))

(assert (=> start!22968 e!156159))

(assert (=> start!22968 e!156157))

(assert (=> start!22968 true))

(declare-fun mapNonEmpty!10731 () Bool)

(declare-fun tp!22617 () Bool)

(declare-fun e!156155 () Bool)

(assert (=> mapNonEmpty!10731 (= mapRes!10731 (and tp!22617 e!156155))))

(declare-fun mapValue!10731 () ValueCell!2823)

(declare-fun mapRest!10731 () (Array (_ BitVec 32) ValueCell!2823))

(declare-fun mapKey!10731 () (_ BitVec 32))

(assert (=> mapNonEmpty!10731 (= (arr!5674 (_values!4441 thiss!1504)) (store mapRest!10731 mapKey!10731 mapValue!10731))))

(declare-fun b!240608 () Bool)

(declare-fun lt!121007 () Unit!7402)

(assert (=> b!240608 (= e!156162 lt!121007)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!354 (array!11947 array!11945 (_ BitVec 32) (_ BitVec 32) V!8091 V!8091 (_ BitVec 64) Int) Unit!7402)

(assert (=> b!240608 (= lt!121007 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!354 (_keys!6560 thiss!1504) (_values!4441 thiss!1504) (mask!10516 thiss!1504) (extraKeys!4195 thiss!1504) (zeroValue!4299 thiss!1504) (minValue!4299 thiss!1504) key!932 (defaultEntry!4458 thiss!1504)))))

(declare-fun c!40072 () Bool)

(assert (=> b!240608 (= c!40072 ((_ is MissingZero!1048) lt!121010))))

(assert (=> b!240608 e!156152))

(declare-fun b!240609 () Bool)

(declare-fun res!117978 () Bool)

(declare-fun e!156150 () Bool)

(assert (=> b!240609 (=> (not res!117978) (not e!156150))))

(assert (=> b!240609 (= res!117978 (= (select (arr!5675 (_keys!6560 thiss!1504)) (index!6362 lt!121010)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240610 () Bool)

(declare-fun res!117979 () Bool)

(assert (=> b!240610 (= res!117979 (= (select (arr!5675 (_keys!6560 thiss!1504)) (index!6365 lt!121010)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240610 (=> (not res!117979) (not e!156160))))

(declare-fun b!240611 () Bool)

(assert (=> b!240611 (= e!156154 tp_is_empty!6333)))

(declare-fun b!240612 () Bool)

(assert (=> b!240612 (= e!156150 (not call!22373))))

(declare-fun b!240613 () Bool)

(declare-fun res!117984 () Bool)

(assert (=> b!240613 (=> (not res!117984) (not e!156161))))

(assert (=> b!240613 (= res!117984 (arrayContainsKey!0 (_keys!6560 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240614 () Bool)

(declare-fun res!117987 () Bool)

(assert (=> b!240614 (=> (not res!117987) (not e!156161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!240614 (= res!117987 (validMask!0 (mask!10516 thiss!1504)))))

(declare-fun b!240615 () Bool)

(declare-fun e!156153 () Bool)

(assert (=> b!240615 (= e!156159 e!156153)))

(declare-fun res!117985 () Bool)

(assert (=> b!240615 (=> (not res!117985) (not e!156153))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!240615 (= res!117985 (or (= lt!121010 (MissingZero!1048 index!297)) (= lt!121010 (MissingVacant!1048 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11947 (_ BitVec 32)) SeekEntryResult!1048)

(assert (=> b!240615 (= lt!121010 (seekEntryOrOpen!0 key!932 (_keys!6560 thiss!1504) (mask!10516 thiss!1504)))))

(declare-fun b!240616 () Bool)

(declare-fun res!117983 () Bool)

(assert (=> b!240616 (=> (not res!117983) (not e!156150))))

(assert (=> b!240616 (= res!117983 call!22374)))

(assert (=> b!240616 (= e!156152 e!156150)))

(declare-fun bm!22371 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22371 (= call!22374 (inRange!0 (ite c!40072 (index!6362 lt!121010) (index!6365 lt!121010)) (mask!10516 thiss!1504)))))

(declare-fun b!240617 () Bool)

(assert (=> b!240617 (= e!156151 ((_ is Undefined!1048) lt!121010))))

(declare-fun b!240618 () Bool)

(declare-fun res!117980 () Bool)

(assert (=> b!240618 (=> (not res!117980) (not e!156159))))

(assert (=> b!240618 (= res!117980 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!240619 () Bool)

(assert (=> b!240619 (= e!156155 tp_is_empty!6333)))

(declare-fun b!240620 () Bool)

(declare-fun res!117988 () Bool)

(assert (=> b!240620 (=> (not res!117988) (not e!156161))))

(assert (=> b!240620 (= res!117988 (and (= (size!6015 (_values!4441 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10516 thiss!1504))) (= (size!6016 (_keys!6560 thiss!1504)) (size!6015 (_values!4441 thiss!1504))) (bvsge (mask!10516 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4195 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4195 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!240621 () Bool)

(assert (=> b!240621 (= e!156153 e!156161)))

(declare-fun res!117986 () Bool)

(assert (=> b!240621 (=> (not res!117986) (not e!156161))))

(assert (=> b!240621 (= res!117986 (inRange!0 index!297 (mask!10516 thiss!1504)))))

(declare-fun lt!121009 () Unit!7402)

(assert (=> b!240621 (= lt!121009 e!156162)))

(declare-fun c!40073 () Bool)

(declare-datatypes ((tuple2!4730 0))(
  ( (tuple2!4731 (_1!2376 (_ BitVec 64)) (_2!2376 V!8091)) )
))
(declare-datatypes ((List!3615 0))(
  ( (Nil!3612) (Cons!3611 (h!4267 tuple2!4730) (t!8610 List!3615)) )
))
(declare-datatypes ((ListLongMap!3643 0))(
  ( (ListLongMap!3644 (toList!1837 List!3615)) )
))
(declare-fun contains!1725 (ListLongMap!3643 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1365 (array!11947 array!11945 (_ BitVec 32) (_ BitVec 32) V!8091 V!8091 (_ BitVec 32) Int) ListLongMap!3643)

(assert (=> b!240621 (= c!40073 (contains!1725 (getCurrentListMap!1365 (_keys!6560 thiss!1504) (_values!4441 thiss!1504) (mask!10516 thiss!1504) (extraKeys!4195 thiss!1504) (zeroValue!4299 thiss!1504) (minValue!4299 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4458 thiss!1504)) key!932))))

(assert (= (and start!22968 res!117982) b!240618))

(assert (= (and b!240618 res!117980) b!240615))

(assert (= (and b!240615 res!117985) b!240621))

(assert (= (and b!240621 c!40073) b!240606))

(assert (= (and b!240621 (not c!40073)) b!240608))

(assert (= (and b!240608 c!40072) b!240616))

(assert (= (and b!240608 (not c!40072)) b!240603))

(assert (= (and b!240616 res!117983) b!240609))

(assert (= (and b!240609 res!117978) b!240612))

(assert (= (and b!240603 c!40071) b!240601))

(assert (= (and b!240603 (not c!40071)) b!240617))

(assert (= (and b!240601 res!117989) b!240610))

(assert (= (and b!240610 res!117979) b!240600))

(assert (= (or b!240616 b!240601) bm!22371))

(assert (= (or b!240612 b!240600) bm!22370))

(assert (= (and b!240621 res!117986) b!240613))

(assert (= (and b!240613 res!117984) b!240614))

(assert (= (and b!240614 res!117987) b!240620))

(assert (= (and b!240620 res!117988) b!240604))

(assert (= (and b!240604 res!117981) b!240605))

(assert (= (and b!240607 condMapEmpty!10731) mapIsEmpty!10731))

(assert (= (and b!240607 (not condMapEmpty!10731)) mapNonEmpty!10731))

(assert (= (and mapNonEmpty!10731 ((_ is ValueCellFull!2823) mapValue!10731)) b!240619))

(assert (= (and b!240607 ((_ is ValueCellFull!2823) mapDefault!10731)) b!240611))

(assert (= b!240602 b!240607))

(assert (= start!22968 b!240602))

(declare-fun m!260097 () Bool)

(assert (=> b!240608 m!260097))

(declare-fun m!260099 () Bool)

(assert (=> b!240605 m!260099))

(declare-fun m!260101 () Bool)

(assert (=> b!240610 m!260101))

(declare-fun m!260103 () Bool)

(assert (=> b!240609 m!260103))

(declare-fun m!260105 () Bool)

(assert (=> start!22968 m!260105))

(declare-fun m!260107 () Bool)

(assert (=> b!240615 m!260107))

(declare-fun m!260109 () Bool)

(assert (=> b!240621 m!260109))

(declare-fun m!260111 () Bool)

(assert (=> b!240621 m!260111))

(assert (=> b!240621 m!260111))

(declare-fun m!260113 () Bool)

(assert (=> b!240621 m!260113))

(declare-fun m!260115 () Bool)

(assert (=> b!240613 m!260115))

(declare-fun m!260117 () Bool)

(assert (=> b!240614 m!260117))

(assert (=> bm!22370 m!260115))

(declare-fun m!260119 () Bool)

(assert (=> b!240606 m!260119))

(declare-fun m!260121 () Bool)

(assert (=> b!240604 m!260121))

(declare-fun m!260123 () Bool)

(assert (=> b!240602 m!260123))

(declare-fun m!260125 () Bool)

(assert (=> b!240602 m!260125))

(declare-fun m!260127 () Bool)

(assert (=> bm!22371 m!260127))

(declare-fun m!260129 () Bool)

(assert (=> mapNonEmpty!10731 m!260129))

(check-sat (not b!240608) (not b!240606) (not bm!22371) (not b!240613) (not b!240602) (not b!240615) (not bm!22370) (not b!240621) (not start!22968) (not mapNonEmpty!10731) (not b!240614) (not b!240604) (not b!240605) (not b_next!6471) b_and!13437 tp_is_empty!6333)
(check-sat b_and!13437 (not b_next!6471))
