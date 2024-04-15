; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23182 () Bool)

(assert start!23182)

(declare-fun b!242954 () Bool)

(declare-fun b_free!6517 () Bool)

(declare-fun b_next!6517 () Bool)

(assert (=> b!242954 (= b_free!6517 (not b_next!6517))))

(declare-fun tp!22770 () Bool)

(declare-fun b_and!13471 () Bool)

(assert (=> b!242954 (= tp!22770 b_and!13471)))

(declare-fun b!242936 () Bool)

(declare-fun e!157667 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((List!3627 0))(
  ( (Nil!3624) (Cons!3623 (h!4280 (_ BitVec 64)) (t!8623 List!3627)) )
))
(declare-fun contains!1729 (List!3627 (_ BitVec 64)) Bool)

(assert (=> b!242936 (= e!157667 (contains!1729 Nil!3624 key!932))))

(declare-fun b!242937 () Bool)

(declare-fun e!157665 () Bool)

(declare-fun e!157659 () Bool)

(assert (=> b!242937 (= e!157665 e!157659)))

(declare-fun res!119042 () Bool)

(assert (=> b!242937 (=> (not res!119042) (not e!157659))))

(declare-datatypes ((SeekEntryResult!1068 0))(
  ( (MissingZero!1068 (index!6442 (_ BitVec 32))) (Found!1068 (index!6443 (_ BitVec 32))) (Intermediate!1068 (undefined!1880 Bool) (index!6444 (_ BitVec 32)) (x!24309 (_ BitVec 32))) (Undefined!1068) (MissingVacant!1068 (index!6445 (_ BitVec 32))) )
))
(declare-fun lt!121873 () SeekEntryResult!1068)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!242937 (= res!119042 (or (= lt!121873 (MissingZero!1068 index!297)) (= lt!121873 (MissingVacant!1068 index!297))))))

(declare-datatypes ((V!8153 0))(
  ( (V!8154 (val!3234 Int)) )
))
(declare-datatypes ((ValueCell!2846 0))(
  ( (ValueCellFull!2846 (v!5273 V!8153)) (EmptyCell!2846) )
))
(declare-datatypes ((array!12039 0))(
  ( (array!12040 (arr!5715 (Array (_ BitVec 32) ValueCell!2846)) (size!6058 (_ BitVec 32))) )
))
(declare-datatypes ((array!12041 0))(
  ( (array!12042 (arr!5716 (Array (_ BitVec 32) (_ BitVec 64))) (size!6059 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3592 0))(
  ( (LongMapFixedSize!3593 (defaultEntry!4505 Int) (mask!10593 (_ BitVec 32)) (extraKeys!4242 (_ BitVec 32)) (zeroValue!4346 V!8153) (minValue!4346 V!8153) (_size!1845 (_ BitVec 32)) (_keys!6614 array!12041) (_values!4488 array!12039) (_vacant!1845 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3592)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12041 (_ BitVec 32)) SeekEntryResult!1068)

(assert (=> b!242937 (= lt!121873 (seekEntryOrOpen!0 key!932 (_keys!6614 thiss!1504) (mask!10593 thiss!1504)))))

(declare-fun b!242938 () Bool)

(declare-fun e!157657 () Bool)

(assert (=> b!242938 (= e!157657 (not (contains!1729 Nil!3624 key!932)))))

(declare-fun b!242939 () Bool)

(declare-datatypes ((Unit!7487 0))(
  ( (Unit!7488) )
))
(declare-fun e!157670 () Unit!7487)

(declare-fun Unit!7489 () Unit!7487)

(assert (=> b!242939 (= e!157670 Unit!7489)))

(declare-fun lt!121874 () Unit!7487)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!364 (array!12041 array!12039 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) Int) Unit!7487)

(assert (=> b!242939 (= lt!121874 (lemmaInListMapThenSeekEntryOrOpenFindsIt!364 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 (defaultEntry!4505 thiss!1504)))))

(assert (=> b!242939 false))

(declare-fun b!242940 () Bool)

(declare-fun e!157654 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12041 (_ BitVec 32) List!3627) Bool)

(assert (=> b!242940 (= e!157654 (not (arrayNoDuplicates!0 (_keys!6614 thiss!1504) #b00000000000000000000000000000000 Nil!3624)))))

(declare-fun b!242941 () Bool)

(declare-fun e!157656 () Bool)

(declare-fun tp_is_empty!6379 () Bool)

(assert (=> b!242941 (= e!157656 tp_is_empty!6379)))

(declare-fun b!242942 () Bool)

(declare-fun e!157658 () Bool)

(assert (=> b!242942 (= e!157658 e!157657)))

(declare-fun res!119035 () Bool)

(assert (=> b!242942 (=> (not res!119035) (not e!157657))))

(assert (=> b!242942 (= res!119035 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!242943 () Bool)

(declare-fun res!119043 () Bool)

(declare-fun e!157669 () Bool)

(assert (=> b!242943 (=> (not res!119043) (not e!157669))))

(assert (=> b!242943 (= res!119043 (= (select (arr!5716 (_keys!6614 thiss!1504)) (index!6442 lt!121873)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242944 () Bool)

(declare-fun res!119031 () Bool)

(assert (=> b!242944 (=> (not res!119031) (not e!157654))))

(assert (=> b!242944 (= res!119031 e!157658)))

(declare-fun res!119037 () Bool)

(assert (=> b!242944 (=> res!119037 e!157658)))

(assert (=> b!242944 (= res!119037 e!157667)))

(declare-fun res!119032 () Bool)

(assert (=> b!242944 (=> (not res!119032) (not e!157667))))

(assert (=> b!242944 (= res!119032 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!242945 () Bool)

(declare-fun e!157655 () Bool)

(declare-fun call!22640 () Bool)

(assert (=> b!242945 (= e!157655 (not call!22640))))

(declare-fun b!242946 () Bool)

(declare-fun res!119038 () Bool)

(assert (=> b!242946 (=> (not res!119038) (not e!157654))))

(assert (=> b!242946 (= res!119038 (not (contains!1729 Nil!3624 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!242947 () Bool)

(declare-fun e!157668 () Unit!7487)

(declare-fun Unit!7490 () Unit!7487)

(assert (=> b!242947 (= e!157668 Unit!7490)))

(declare-fun b!242948 () Bool)

(declare-fun e!157661 () Bool)

(assert (=> b!242948 (= e!157659 e!157661)))

(declare-fun res!119033 () Bool)

(assert (=> b!242948 (=> (not res!119033) (not e!157661))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242948 (= res!119033 (inRange!0 index!297 (mask!10593 thiss!1504)))))

(declare-fun lt!121876 () Unit!7487)

(assert (=> b!242948 (= lt!121876 e!157670)))

(declare-fun c!40552 () Bool)

(declare-datatypes ((tuple2!4728 0))(
  ( (tuple2!4729 (_1!2375 (_ BitVec 64)) (_2!2375 V!8153)) )
))
(declare-datatypes ((List!3628 0))(
  ( (Nil!3625) (Cons!3624 (h!4281 tuple2!4728) (t!8624 List!3628)) )
))
(declare-datatypes ((ListLongMap!3631 0))(
  ( (ListLongMap!3632 (toList!1831 List!3628)) )
))
(declare-fun contains!1730 (ListLongMap!3631 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1340 (array!12041 array!12039 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 32) Int) ListLongMap!3631)

(assert (=> b!242948 (= c!40552 (contains!1730 (getCurrentListMap!1340 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)) key!932))))

(declare-fun res!119039 () Bool)

(assert (=> start!23182 (=> (not res!119039) (not e!157665))))

(declare-fun valid!1417 (LongMapFixedSize!3592) Bool)

(assert (=> start!23182 (= res!119039 (valid!1417 thiss!1504))))

(assert (=> start!23182 e!157665))

(declare-fun e!157660 () Bool)

(assert (=> start!23182 e!157660))

(assert (=> start!23182 true))

(declare-fun b!242949 () Bool)

(declare-fun e!157662 () Bool)

(assert (=> b!242949 (= e!157662 e!157655)))

(declare-fun res!119040 () Bool)

(declare-fun call!22641 () Bool)

(assert (=> b!242949 (= res!119040 call!22641)))

(assert (=> b!242949 (=> (not res!119040) (not e!157655))))

(declare-fun b!242950 () Bool)

(declare-fun res!119044 () Bool)

(assert (=> b!242950 (=> (not res!119044) (not e!157654))))

(declare-fun noDuplicate!94 (List!3627) Bool)

(assert (=> b!242950 (= res!119044 (noDuplicate!94 Nil!3624))))

(declare-fun b!242951 () Bool)

(declare-fun e!157666 () Bool)

(declare-fun mapRes!10816 () Bool)

(assert (=> b!242951 (= e!157666 (and e!157656 mapRes!10816))))

(declare-fun condMapEmpty!10816 () Bool)

(declare-fun mapDefault!10816 () ValueCell!2846)

(assert (=> b!242951 (= condMapEmpty!10816 (= (arr!5715 (_values!4488 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2846)) mapDefault!10816)))))

(declare-fun b!242952 () Bool)

(declare-fun res!119034 () Bool)

(assert (=> b!242952 (=> (not res!119034) (not e!157654))))

(assert (=> b!242952 (= res!119034 (not (contains!1729 Nil!3624 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!242953 () Bool)

(declare-fun res!119030 () Bool)

(assert (=> b!242953 (=> (not res!119030) (not e!157669))))

(assert (=> b!242953 (= res!119030 call!22641)))

(declare-fun e!157664 () Bool)

(assert (=> b!242953 (= e!157664 e!157669)))

(declare-fun array_inv!3773 (array!12041) Bool)

(declare-fun array_inv!3774 (array!12039) Bool)

(assert (=> b!242954 (= e!157660 (and tp!22770 tp_is_empty!6379 (array_inv!3773 (_keys!6614 thiss!1504)) (array_inv!3774 (_values!4488 thiss!1504)) e!157666))))

(declare-fun b!242955 () Bool)

(declare-fun Unit!7491 () Unit!7487)

(assert (=> b!242955 (= e!157668 Unit!7491)))

(declare-fun lt!121875 () Unit!7487)

(declare-fun lemmaArrayContainsKeyThenInListMap!175 (array!12041 array!12039 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) (_ BitVec 32) Int) Unit!7487)

(assert (=> b!242955 (= lt!121875 (lemmaArrayContainsKeyThenInListMap!175 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(assert (=> b!242955 false))

(declare-fun b!242956 () Bool)

(assert (=> b!242956 (= e!157669 (not call!22640))))

(declare-fun mapIsEmpty!10816 () Bool)

(assert (=> mapIsEmpty!10816 mapRes!10816))

(declare-fun b!242957 () Bool)

(declare-fun e!157653 () Bool)

(assert (=> b!242957 (= e!157653 tp_is_empty!6379)))

(declare-fun b!242958 () Bool)

(assert (=> b!242958 (= e!157661 e!157654)))

(declare-fun res!119029 () Bool)

(assert (=> b!242958 (=> (not res!119029) (not e!157654))))

(assert (=> b!242958 (= res!119029 (and (bvslt (size!6059 (_keys!6614 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6059 (_keys!6614 thiss!1504)))))))

(declare-fun lt!121872 () Unit!7487)

(assert (=> b!242958 (= lt!121872 e!157668)))

(declare-fun c!40550 () Bool)

(declare-fun arrayContainsKey!0 (array!12041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!242958 (= c!40550 (arrayContainsKey!0 (_keys!6614 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242959 () Bool)

(get-info :version)

(assert (=> b!242959 (= e!157662 ((_ is Undefined!1068) lt!121873))))

(declare-fun b!242960 () Bool)

(declare-fun res!119036 () Bool)

(assert (=> b!242960 (= res!119036 (= (select (arr!5716 (_keys!6614 thiss!1504)) (index!6445 lt!121873)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242960 (=> (not res!119036) (not e!157655))))

(declare-fun bm!22637 () Bool)

(assert (=> bm!22637 (= call!22640 (arrayContainsKey!0 (_keys!6614 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!22638 () Bool)

(declare-fun c!40549 () Bool)

(assert (=> bm!22638 (= call!22641 (inRange!0 (ite c!40549 (index!6442 lt!121873) (index!6445 lt!121873)) (mask!10593 thiss!1504)))))

(declare-fun mapNonEmpty!10816 () Bool)

(declare-fun tp!22771 () Bool)

(assert (=> mapNonEmpty!10816 (= mapRes!10816 (and tp!22771 e!157653))))

(declare-fun mapValue!10816 () ValueCell!2846)

(declare-fun mapKey!10816 () (_ BitVec 32))

(declare-fun mapRest!10816 () (Array (_ BitVec 32) ValueCell!2846))

(assert (=> mapNonEmpty!10816 (= (arr!5715 (_values!4488 thiss!1504)) (store mapRest!10816 mapKey!10816 mapValue!10816))))

(declare-fun b!242961 () Bool)

(declare-fun lt!121871 () Unit!7487)

(assert (=> b!242961 (= e!157670 lt!121871)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!361 (array!12041 array!12039 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) Int) Unit!7487)

(assert (=> b!242961 (= lt!121871 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!361 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 (defaultEntry!4505 thiss!1504)))))

(assert (=> b!242961 (= c!40549 ((_ is MissingZero!1068) lt!121873))))

(assert (=> b!242961 e!157664))

(declare-fun b!242962 () Bool)

(declare-fun c!40551 () Bool)

(assert (=> b!242962 (= c!40551 ((_ is MissingVacant!1068) lt!121873))))

(assert (=> b!242962 (= e!157664 e!157662)))

(declare-fun b!242963 () Bool)

(declare-fun res!119041 () Bool)

(assert (=> b!242963 (=> (not res!119041) (not e!157665))))

(assert (=> b!242963 (= res!119041 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!23182 res!119039) b!242963))

(assert (= (and b!242963 res!119041) b!242937))

(assert (= (and b!242937 res!119042) b!242948))

(assert (= (and b!242948 c!40552) b!242939))

(assert (= (and b!242948 (not c!40552)) b!242961))

(assert (= (and b!242961 c!40549) b!242953))

(assert (= (and b!242961 (not c!40549)) b!242962))

(assert (= (and b!242953 res!119030) b!242943))

(assert (= (and b!242943 res!119043) b!242956))

(assert (= (and b!242962 c!40551) b!242949))

(assert (= (and b!242962 (not c!40551)) b!242959))

(assert (= (and b!242949 res!119040) b!242960))

(assert (= (and b!242960 res!119036) b!242945))

(assert (= (or b!242953 b!242949) bm!22638))

(assert (= (or b!242956 b!242945) bm!22637))

(assert (= (and b!242948 res!119033) b!242958))

(assert (= (and b!242958 c!40550) b!242955))

(assert (= (and b!242958 (not c!40550)) b!242947))

(assert (= (and b!242958 res!119029) b!242950))

(assert (= (and b!242950 res!119044) b!242946))

(assert (= (and b!242946 res!119038) b!242952))

(assert (= (and b!242952 res!119034) b!242944))

(assert (= (and b!242944 res!119032) b!242936))

(assert (= (and b!242944 (not res!119037)) b!242942))

(assert (= (and b!242942 res!119035) b!242938))

(assert (= (and b!242944 res!119031) b!242940))

(assert (= (and b!242951 condMapEmpty!10816) mapIsEmpty!10816))

(assert (= (and b!242951 (not condMapEmpty!10816)) mapNonEmpty!10816))

(assert (= (and mapNonEmpty!10816 ((_ is ValueCellFull!2846) mapValue!10816)) b!242957))

(assert (= (and b!242951 ((_ is ValueCellFull!2846) mapDefault!10816)) b!242941))

(assert (= b!242954 b!242951))

(assert (= start!23182 b!242954))

(declare-fun m!261045 () Bool)

(assert (=> b!242939 m!261045))

(declare-fun m!261047 () Bool)

(assert (=> b!242950 m!261047))

(declare-fun m!261049 () Bool)

(assert (=> b!242955 m!261049))

(declare-fun m!261051 () Bool)

(assert (=> b!242946 m!261051))

(declare-fun m!261053 () Bool)

(assert (=> b!242954 m!261053))

(declare-fun m!261055 () Bool)

(assert (=> b!242954 m!261055))

(declare-fun m!261057 () Bool)

(assert (=> b!242937 m!261057))

(declare-fun m!261059 () Bool)

(assert (=> b!242938 m!261059))

(declare-fun m!261061 () Bool)

(assert (=> b!242960 m!261061))

(declare-fun m!261063 () Bool)

(assert (=> b!242958 m!261063))

(declare-fun m!261065 () Bool)

(assert (=> bm!22638 m!261065))

(declare-fun m!261067 () Bool)

(assert (=> b!242961 m!261067))

(declare-fun m!261069 () Bool)

(assert (=> b!242943 m!261069))

(declare-fun m!261071 () Bool)

(assert (=> b!242940 m!261071))

(declare-fun m!261073 () Bool)

(assert (=> start!23182 m!261073))

(declare-fun m!261075 () Bool)

(assert (=> mapNonEmpty!10816 m!261075))

(assert (=> bm!22637 m!261063))

(assert (=> b!242936 m!261059))

(declare-fun m!261077 () Bool)

(assert (=> b!242952 m!261077))

(declare-fun m!261079 () Bool)

(assert (=> b!242948 m!261079))

(declare-fun m!261081 () Bool)

(assert (=> b!242948 m!261081))

(assert (=> b!242948 m!261081))

(declare-fun m!261083 () Bool)

(assert (=> b!242948 m!261083))

(check-sat (not b!242952) (not b!242938) (not start!23182) (not b!242948) (not b!242950) tp_is_empty!6379 (not b_next!6517) (not b!242958) (not bm!22638) (not b!242940) (not b!242939) b_and!13471 (not mapNonEmpty!10816) (not b!242961) (not b!242936) (not b!242946) (not bm!22637) (not b!242937) (not b!242954) (not b!242955))
(check-sat b_and!13471 (not b_next!6517))
(get-model)

(declare-fun d!59885 () Bool)

(assert (=> d!59885 (= (array_inv!3773 (_keys!6614 thiss!1504)) (bvsge (size!6059 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242954 d!59885))

(declare-fun d!59887 () Bool)

(assert (=> d!59887 (= (array_inv!3774 (_values!4488 thiss!1504)) (bvsge (size!6058 (_values!4488 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242954 d!59887))

(declare-fun b!243148 () Bool)

(declare-fun e!157790 () Bool)

(declare-fun e!157789 () Bool)

(assert (=> b!243148 (= e!157790 e!157789)))

(declare-fun c!40582 () Bool)

(declare-fun lt!121918 () SeekEntryResult!1068)

(assert (=> b!243148 (= c!40582 ((_ is MissingVacant!1068) lt!121918))))

(declare-fun b!243149 () Bool)

(declare-fun res!119149 () Bool)

(declare-fun e!157788 () Bool)

(assert (=> b!243149 (=> (not res!119149) (not e!157788))))

(assert (=> b!243149 (= res!119149 (= (select (arr!5716 (_keys!6614 thiss!1504)) (index!6445 lt!121918)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243149 (and (bvsge (index!6445 lt!121918) #b00000000000000000000000000000000) (bvslt (index!6445 lt!121918) (size!6059 (_keys!6614 thiss!1504))))))

(declare-fun b!243150 () Bool)

(declare-fun e!157787 () Bool)

(declare-fun call!22658 () Bool)

(assert (=> b!243150 (= e!157787 (not call!22658))))

(declare-fun bm!22655 () Bool)

(assert (=> bm!22655 (= call!22658 (arrayContainsKey!0 (_keys!6614 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243151 () Bool)

(assert (=> b!243151 (= e!157788 (not call!22658))))

(declare-fun b!243152 () Bool)

(assert (=> b!243152 (and (bvsge (index!6442 lt!121918) #b00000000000000000000000000000000) (bvslt (index!6442 lt!121918) (size!6059 (_keys!6614 thiss!1504))))))

(declare-fun res!119152 () Bool)

(assert (=> b!243152 (= res!119152 (= (select (arr!5716 (_keys!6614 thiss!1504)) (index!6442 lt!121918)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243152 (=> (not res!119152) (not e!157787))))

(declare-fun b!243153 () Bool)

(assert (=> b!243153 (= e!157790 e!157787)))

(declare-fun res!119150 () Bool)

(declare-fun call!22659 () Bool)

(assert (=> b!243153 (= res!119150 call!22659)))

(assert (=> b!243153 (=> (not res!119150) (not e!157787))))

(declare-fun d!59889 () Bool)

(assert (=> d!59889 e!157790))

(declare-fun c!40581 () Bool)

(assert (=> d!59889 (= c!40581 ((_ is MissingZero!1068) lt!121918))))

(assert (=> d!59889 (= lt!121918 (seekEntryOrOpen!0 key!932 (_keys!6614 thiss!1504) (mask!10593 thiss!1504)))))

(declare-fun lt!121917 () Unit!7487)

(declare-fun choose!1141 (array!12041 array!12039 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) Int) Unit!7487)

(assert (=> d!59889 (= lt!121917 (choose!1141 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 (defaultEntry!4505 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59889 (validMask!0 (mask!10593 thiss!1504))))

(assert (=> d!59889 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!361 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 (defaultEntry!4505 thiss!1504)) lt!121917)))

(declare-fun bm!22656 () Bool)

(assert (=> bm!22656 (= call!22659 (inRange!0 (ite c!40581 (index!6442 lt!121918) (index!6445 lt!121918)) (mask!10593 thiss!1504)))))

(declare-fun b!243154 () Bool)

(assert (=> b!243154 (= e!157789 ((_ is Undefined!1068) lt!121918))))

(declare-fun b!243155 () Bool)

(declare-fun res!119151 () Bool)

(assert (=> b!243155 (=> (not res!119151) (not e!157788))))

(assert (=> b!243155 (= res!119151 call!22659)))

(assert (=> b!243155 (= e!157789 e!157788)))

(assert (= (and d!59889 c!40581) b!243153))

(assert (= (and d!59889 (not c!40581)) b!243148))

(assert (= (and b!243153 res!119150) b!243152))

(assert (= (and b!243152 res!119152) b!243150))

(assert (= (and b!243148 c!40582) b!243155))

(assert (= (and b!243148 (not c!40582)) b!243154))

(assert (= (and b!243155 res!119151) b!243149))

(assert (= (and b!243149 res!119149) b!243151))

(assert (= (or b!243153 b!243155) bm!22656))

(assert (= (or b!243150 b!243151) bm!22655))

(declare-fun m!261165 () Bool)

(assert (=> bm!22656 m!261165))

(assert (=> d!59889 m!261057))

(declare-fun m!261167 () Bool)

(assert (=> d!59889 m!261167))

(declare-fun m!261169 () Bool)

(assert (=> d!59889 m!261169))

(declare-fun m!261171 () Bool)

(assert (=> b!243152 m!261171))

(declare-fun m!261173 () Bool)

(assert (=> b!243149 m!261173))

(assert (=> bm!22655 m!261063))

(assert (=> b!242961 d!59889))

(declare-fun d!59891 () Bool)

(declare-fun lt!121921 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!160 (List!3627) (InoxSet (_ BitVec 64)))

(assert (=> d!59891 (= lt!121921 (select (content!160 Nil!3624) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157795 () Bool)

(assert (=> d!59891 (= lt!121921 e!157795)))

(declare-fun res!119157 () Bool)

(assert (=> d!59891 (=> (not res!119157) (not e!157795))))

(assert (=> d!59891 (= res!119157 ((_ is Cons!3623) Nil!3624))))

(assert (=> d!59891 (= (contains!1729 Nil!3624 #b1000000000000000000000000000000000000000000000000000000000000000) lt!121921)))

(declare-fun b!243160 () Bool)

(declare-fun e!157796 () Bool)

(assert (=> b!243160 (= e!157795 e!157796)))

(declare-fun res!119158 () Bool)

(assert (=> b!243160 (=> res!119158 e!157796)))

(assert (=> b!243160 (= res!119158 (= (h!4280 Nil!3624) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243161 () Bool)

(assert (=> b!243161 (= e!157796 (contains!1729 (t!8623 Nil!3624) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59891 res!119157) b!243160))

(assert (= (and b!243160 (not res!119158)) b!243161))

(declare-fun m!261175 () Bool)

(assert (=> d!59891 m!261175))

(declare-fun m!261177 () Bool)

(assert (=> d!59891 m!261177))

(declare-fun m!261179 () Bool)

(assert (=> b!243161 m!261179))

(assert (=> b!242952 d!59891))

(declare-fun d!59893 () Bool)

(assert (=> d!59893 (= (inRange!0 (ite c!40549 (index!6442 lt!121873) (index!6445 lt!121873)) (mask!10593 thiss!1504)) (and (bvsge (ite c!40549 (index!6442 lt!121873) (index!6445 lt!121873)) #b00000000000000000000000000000000) (bvslt (ite c!40549 (index!6442 lt!121873) (index!6445 lt!121873)) (bvadd (mask!10593 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22638 d!59893))

(declare-fun d!59895 () Bool)

(declare-fun res!119165 () Bool)

(declare-fun e!157799 () Bool)

(assert (=> d!59895 (=> (not res!119165) (not e!157799))))

(declare-fun simpleValid!249 (LongMapFixedSize!3592) Bool)

(assert (=> d!59895 (= res!119165 (simpleValid!249 thiss!1504))))

(assert (=> d!59895 (= (valid!1417 thiss!1504) e!157799)))

(declare-fun b!243168 () Bool)

(declare-fun res!119166 () Bool)

(assert (=> b!243168 (=> (not res!119166) (not e!157799))))

(declare-fun arrayCountValidKeys!0 (array!12041 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!243168 (= res!119166 (= (arrayCountValidKeys!0 (_keys!6614 thiss!1504) #b00000000000000000000000000000000 (size!6059 (_keys!6614 thiss!1504))) (_size!1845 thiss!1504)))))

(declare-fun b!243169 () Bool)

(declare-fun res!119167 () Bool)

(assert (=> b!243169 (=> (not res!119167) (not e!157799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12041 (_ BitVec 32)) Bool)

(assert (=> b!243169 (= res!119167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6614 thiss!1504) (mask!10593 thiss!1504)))))

(declare-fun b!243170 () Bool)

(assert (=> b!243170 (= e!157799 (arrayNoDuplicates!0 (_keys!6614 thiss!1504) #b00000000000000000000000000000000 Nil!3624))))

(assert (= (and d!59895 res!119165) b!243168))

(assert (= (and b!243168 res!119166) b!243169))

(assert (= (and b!243169 res!119167) b!243170))

(declare-fun m!261181 () Bool)

(assert (=> d!59895 m!261181))

(declare-fun m!261183 () Bool)

(assert (=> b!243168 m!261183))

(declare-fun m!261185 () Bool)

(assert (=> b!243169 m!261185))

(assert (=> b!243170 m!261071))

(assert (=> start!23182 d!59895))

(declare-fun b!243181 () Bool)

(declare-fun e!157811 () Bool)

(assert (=> b!243181 (= e!157811 (contains!1729 Nil!3624 (select (arr!5716 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59897 () Bool)

(declare-fun res!119174 () Bool)

(declare-fun e!157809 () Bool)

(assert (=> d!59897 (=> res!119174 e!157809)))

(assert (=> d!59897 (= res!119174 (bvsge #b00000000000000000000000000000000 (size!6059 (_keys!6614 thiss!1504))))))

(assert (=> d!59897 (= (arrayNoDuplicates!0 (_keys!6614 thiss!1504) #b00000000000000000000000000000000 Nil!3624) e!157809)))

(declare-fun b!243182 () Bool)

(declare-fun e!157808 () Bool)

(declare-fun call!22662 () Bool)

(assert (=> b!243182 (= e!157808 call!22662)))

(declare-fun b!243183 () Bool)

(declare-fun e!157810 () Bool)

(assert (=> b!243183 (= e!157809 e!157810)))

(declare-fun res!119175 () Bool)

(assert (=> b!243183 (=> (not res!119175) (not e!157810))))

(assert (=> b!243183 (= res!119175 (not e!157811))))

(declare-fun res!119176 () Bool)

(assert (=> b!243183 (=> (not res!119176) (not e!157811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!243183 (= res!119176 (validKeyInArray!0 (select (arr!5716 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243184 () Bool)

(assert (=> b!243184 (= e!157808 call!22662)))

(declare-fun bm!22659 () Bool)

(declare-fun c!40585 () Bool)

(assert (=> bm!22659 (= call!22662 (arrayNoDuplicates!0 (_keys!6614 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40585 (Cons!3623 (select (arr!5716 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000) Nil!3624) Nil!3624)))))

(declare-fun b!243185 () Bool)

(assert (=> b!243185 (= e!157810 e!157808)))

(assert (=> b!243185 (= c!40585 (validKeyInArray!0 (select (arr!5716 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59897 (not res!119174)) b!243183))

(assert (= (and b!243183 res!119176) b!243181))

(assert (= (and b!243183 res!119175) b!243185))

(assert (= (and b!243185 c!40585) b!243182))

(assert (= (and b!243185 (not c!40585)) b!243184))

(assert (= (or b!243182 b!243184) bm!22659))

(declare-fun m!261187 () Bool)

(assert (=> b!243181 m!261187))

(assert (=> b!243181 m!261187))

(declare-fun m!261189 () Bool)

(assert (=> b!243181 m!261189))

(assert (=> b!243183 m!261187))

(assert (=> b!243183 m!261187))

(declare-fun m!261191 () Bool)

(assert (=> b!243183 m!261191))

(assert (=> bm!22659 m!261187))

(declare-fun m!261193 () Bool)

(assert (=> bm!22659 m!261193))

(assert (=> b!243185 m!261187))

(assert (=> b!243185 m!261187))

(assert (=> b!243185 m!261191))

(assert (=> b!242940 d!59897))

(declare-fun d!59899 () Bool)

(declare-fun res!119181 () Bool)

(declare-fun e!157816 () Bool)

(assert (=> d!59899 (=> res!119181 e!157816)))

(assert (=> d!59899 (= res!119181 (= (select (arr!5716 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59899 (= (arrayContainsKey!0 (_keys!6614 thiss!1504) key!932 #b00000000000000000000000000000000) e!157816)))

(declare-fun b!243190 () Bool)

(declare-fun e!157817 () Bool)

(assert (=> b!243190 (= e!157816 e!157817)))

(declare-fun res!119182 () Bool)

(assert (=> b!243190 (=> (not res!119182) (not e!157817))))

(assert (=> b!243190 (= res!119182 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6059 (_keys!6614 thiss!1504))))))

(declare-fun b!243191 () Bool)

(assert (=> b!243191 (= e!157817 (arrayContainsKey!0 (_keys!6614 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59899 (not res!119181)) b!243190))

(assert (= (and b!243190 res!119182) b!243191))

(assert (=> d!59899 m!261187))

(declare-fun m!261195 () Bool)

(assert (=> b!243191 m!261195))

(assert (=> bm!22637 d!59899))

(declare-fun d!59901 () Bool)

(declare-fun e!157820 () Bool)

(assert (=> d!59901 e!157820))

(declare-fun res!119188 () Bool)

(assert (=> d!59901 (=> (not res!119188) (not e!157820))))

(declare-fun lt!121926 () SeekEntryResult!1068)

(assert (=> d!59901 (= res!119188 ((_ is Found!1068) lt!121926))))

(assert (=> d!59901 (= lt!121926 (seekEntryOrOpen!0 key!932 (_keys!6614 thiss!1504) (mask!10593 thiss!1504)))))

(declare-fun lt!121927 () Unit!7487)

(declare-fun choose!1142 (array!12041 array!12039 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) Int) Unit!7487)

(assert (=> d!59901 (= lt!121927 (choose!1142 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 (defaultEntry!4505 thiss!1504)))))

(assert (=> d!59901 (validMask!0 (mask!10593 thiss!1504))))

(assert (=> d!59901 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!364 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 (defaultEntry!4505 thiss!1504)) lt!121927)))

(declare-fun b!243196 () Bool)

(declare-fun res!119187 () Bool)

(assert (=> b!243196 (=> (not res!119187) (not e!157820))))

(assert (=> b!243196 (= res!119187 (inRange!0 (index!6443 lt!121926) (mask!10593 thiss!1504)))))

(declare-fun b!243197 () Bool)

(assert (=> b!243197 (= e!157820 (= (select (arr!5716 (_keys!6614 thiss!1504)) (index!6443 lt!121926)) key!932))))

(assert (=> b!243197 (and (bvsge (index!6443 lt!121926) #b00000000000000000000000000000000) (bvslt (index!6443 lt!121926) (size!6059 (_keys!6614 thiss!1504))))))

(assert (= (and d!59901 res!119188) b!243196))

(assert (= (and b!243196 res!119187) b!243197))

(assert (=> d!59901 m!261057))

(declare-fun m!261197 () Bool)

(assert (=> d!59901 m!261197))

(assert (=> d!59901 m!261169))

(declare-fun m!261199 () Bool)

(assert (=> b!243196 m!261199))

(declare-fun m!261201 () Bool)

(assert (=> b!243197 m!261201))

(assert (=> b!242939 d!59901))

(declare-fun d!59903 () Bool)

(declare-fun res!119193 () Bool)

(declare-fun e!157825 () Bool)

(assert (=> d!59903 (=> res!119193 e!157825)))

(assert (=> d!59903 (= res!119193 ((_ is Nil!3624) Nil!3624))))

(assert (=> d!59903 (= (noDuplicate!94 Nil!3624) e!157825)))

(declare-fun b!243202 () Bool)

(declare-fun e!157826 () Bool)

(assert (=> b!243202 (= e!157825 e!157826)))

(declare-fun res!119194 () Bool)

(assert (=> b!243202 (=> (not res!119194) (not e!157826))))

(assert (=> b!243202 (= res!119194 (not (contains!1729 (t!8623 Nil!3624) (h!4280 Nil!3624))))))

(declare-fun b!243203 () Bool)

(assert (=> b!243203 (= e!157826 (noDuplicate!94 (t!8623 Nil!3624)))))

(assert (= (and d!59903 (not res!119193)) b!243202))

(assert (= (and b!243202 res!119194) b!243203))

(declare-fun m!261203 () Bool)

(assert (=> b!243202 m!261203))

(declare-fun m!261205 () Bool)

(assert (=> b!243203 m!261205))

(assert (=> b!242950 d!59903))

(declare-fun d!59905 () Bool)

(assert (=> d!59905 (= (inRange!0 index!297 (mask!10593 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10593 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!242948 d!59905))

(declare-fun d!59907 () Bool)

(declare-fun e!157831 () Bool)

(assert (=> d!59907 e!157831))

(declare-fun res!119197 () Bool)

(assert (=> d!59907 (=> res!119197 e!157831)))

(declare-fun lt!121939 () Bool)

(assert (=> d!59907 (= res!119197 (not lt!121939))))

(declare-fun lt!121938 () Bool)

(assert (=> d!59907 (= lt!121939 lt!121938)))

(declare-fun lt!121936 () Unit!7487)

(declare-fun e!157832 () Unit!7487)

(assert (=> d!59907 (= lt!121936 e!157832)))

(declare-fun c!40588 () Bool)

(assert (=> d!59907 (= c!40588 lt!121938)))

(declare-fun containsKey!274 (List!3628 (_ BitVec 64)) Bool)

(assert (=> d!59907 (= lt!121938 (containsKey!274 (toList!1831 (getCurrentListMap!1340 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504))) key!932))))

(assert (=> d!59907 (= (contains!1730 (getCurrentListMap!1340 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)) key!932) lt!121939)))

(declare-fun b!243210 () Bool)

(declare-fun lt!121937 () Unit!7487)

(assert (=> b!243210 (= e!157832 lt!121937)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!223 (List!3628 (_ BitVec 64)) Unit!7487)

(assert (=> b!243210 (= lt!121937 (lemmaContainsKeyImpliesGetValueByKeyDefined!223 (toList!1831 (getCurrentListMap!1340 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504))) key!932))))

(declare-datatypes ((Option!288 0))(
  ( (Some!287 (v!5277 V!8153)) (None!286) )
))
(declare-fun isDefined!224 (Option!288) Bool)

(declare-fun getValueByKey!282 (List!3628 (_ BitVec 64)) Option!288)

(assert (=> b!243210 (isDefined!224 (getValueByKey!282 (toList!1831 (getCurrentListMap!1340 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504))) key!932))))

(declare-fun b!243211 () Bool)

(declare-fun Unit!7499 () Unit!7487)

(assert (=> b!243211 (= e!157832 Unit!7499)))

(declare-fun b!243212 () Bool)

(assert (=> b!243212 (= e!157831 (isDefined!224 (getValueByKey!282 (toList!1831 (getCurrentListMap!1340 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504))) key!932)))))

(assert (= (and d!59907 c!40588) b!243210))

(assert (= (and d!59907 (not c!40588)) b!243211))

(assert (= (and d!59907 (not res!119197)) b!243212))

(declare-fun m!261207 () Bool)

(assert (=> d!59907 m!261207))

(declare-fun m!261209 () Bool)

(assert (=> b!243210 m!261209))

(declare-fun m!261211 () Bool)

(assert (=> b!243210 m!261211))

(assert (=> b!243210 m!261211))

(declare-fun m!261213 () Bool)

(assert (=> b!243210 m!261213))

(assert (=> b!243212 m!261211))

(assert (=> b!243212 m!261211))

(assert (=> b!243212 m!261213))

(assert (=> b!242948 d!59907))

(declare-fun bm!22674 () Bool)

(declare-fun call!22677 () Bool)

(declare-fun lt!122002 () ListLongMap!3631)

(assert (=> bm!22674 (= call!22677 (contains!1730 lt!122002 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!22683 () ListLongMap!3631)

(declare-fun c!40606 () Bool)

(declare-fun call!22682 () ListLongMap!3631)

(declare-fun call!22680 () ListLongMap!3631)

(declare-fun bm!22675 () Bool)

(declare-fun c!40605 () Bool)

(declare-fun call!22679 () ListLongMap!3631)

(declare-fun +!659 (ListLongMap!3631 tuple2!4728) ListLongMap!3631)

(assert (=> bm!22675 (= call!22680 (+!659 (ite c!40606 call!22682 (ite c!40605 call!22683 call!22679)) (ite (or c!40606 c!40605) (tuple2!4729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4346 thiss!1504)) (tuple2!4729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4346 thiss!1504)))))))

(declare-fun b!243255 () Bool)

(declare-fun e!157867 () Bool)

(assert (=> b!243255 (= e!157867 (not call!22677))))

(declare-fun bm!22676 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!542 (array!12041 array!12039 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 32) Int) ListLongMap!3631)

(assert (=> bm!22676 (= call!22682 (getCurrentListMapNoExtraKeys!542 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(declare-fun b!243256 () Bool)

(declare-fun e!157870 () Unit!7487)

(declare-fun lt!121996 () Unit!7487)

(assert (=> b!243256 (= e!157870 lt!121996)))

(declare-fun lt!121989 () ListLongMap!3631)

(assert (=> b!243256 (= lt!121989 (getCurrentListMapNoExtraKeys!542 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(declare-fun lt!121995 () (_ BitVec 64))

(assert (=> b!243256 (= lt!121995 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121990 () (_ BitVec 64))

(assert (=> b!243256 (= lt!121990 (select (arr!5716 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121999 () Unit!7487)

(declare-fun addStillContains!202 (ListLongMap!3631 (_ BitVec 64) V!8153 (_ BitVec 64)) Unit!7487)

(assert (=> b!243256 (= lt!121999 (addStillContains!202 lt!121989 lt!121995 (zeroValue!4346 thiss!1504) lt!121990))))

(assert (=> b!243256 (contains!1730 (+!659 lt!121989 (tuple2!4729 lt!121995 (zeroValue!4346 thiss!1504))) lt!121990)))

(declare-fun lt!122004 () Unit!7487)

(assert (=> b!243256 (= lt!122004 lt!121999)))

(declare-fun lt!121994 () ListLongMap!3631)

(assert (=> b!243256 (= lt!121994 (getCurrentListMapNoExtraKeys!542 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(declare-fun lt!121991 () (_ BitVec 64))

(assert (=> b!243256 (= lt!121991 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121985 () (_ BitVec 64))

(assert (=> b!243256 (= lt!121985 (select (arr!5716 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121992 () Unit!7487)

(declare-fun addApplyDifferent!202 (ListLongMap!3631 (_ BitVec 64) V!8153 (_ BitVec 64)) Unit!7487)

(assert (=> b!243256 (= lt!121992 (addApplyDifferent!202 lt!121994 lt!121991 (minValue!4346 thiss!1504) lt!121985))))

(declare-fun apply!226 (ListLongMap!3631 (_ BitVec 64)) V!8153)

(assert (=> b!243256 (= (apply!226 (+!659 lt!121994 (tuple2!4729 lt!121991 (minValue!4346 thiss!1504))) lt!121985) (apply!226 lt!121994 lt!121985))))

(declare-fun lt!121988 () Unit!7487)

(assert (=> b!243256 (= lt!121988 lt!121992)))

(declare-fun lt!121993 () ListLongMap!3631)

(assert (=> b!243256 (= lt!121993 (getCurrentListMapNoExtraKeys!542 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(declare-fun lt!122001 () (_ BitVec 64))

(assert (=> b!243256 (= lt!122001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121997 () (_ BitVec 64))

(assert (=> b!243256 (= lt!121997 (select (arr!5716 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121984 () Unit!7487)

(assert (=> b!243256 (= lt!121984 (addApplyDifferent!202 lt!121993 lt!122001 (zeroValue!4346 thiss!1504) lt!121997))))

(assert (=> b!243256 (= (apply!226 (+!659 lt!121993 (tuple2!4729 lt!122001 (zeroValue!4346 thiss!1504))) lt!121997) (apply!226 lt!121993 lt!121997))))

(declare-fun lt!122003 () Unit!7487)

(assert (=> b!243256 (= lt!122003 lt!121984)))

(declare-fun lt!122000 () ListLongMap!3631)

(assert (=> b!243256 (= lt!122000 (getCurrentListMapNoExtraKeys!542 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(declare-fun lt!121986 () (_ BitVec 64))

(assert (=> b!243256 (= lt!121986 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122005 () (_ BitVec 64))

(assert (=> b!243256 (= lt!122005 (select (arr!5716 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243256 (= lt!121996 (addApplyDifferent!202 lt!122000 lt!121986 (minValue!4346 thiss!1504) lt!122005))))

(assert (=> b!243256 (= (apply!226 (+!659 lt!122000 (tuple2!4729 lt!121986 (minValue!4346 thiss!1504))) lt!122005) (apply!226 lt!122000 lt!122005))))

(declare-fun b!243257 () Bool)

(declare-fun e!157864 () ListLongMap!3631)

(declare-fun call!22678 () ListLongMap!3631)

(assert (=> b!243257 (= e!157864 call!22678)))

(declare-fun b!243258 () Bool)

(declare-fun Unit!7500 () Unit!7487)

(assert (=> b!243258 (= e!157870 Unit!7500)))

(declare-fun b!243259 () Bool)

(declare-fun e!157866 () Bool)

(declare-fun e!157860 () Bool)

(assert (=> b!243259 (= e!157866 e!157860)))

(declare-fun res!119223 () Bool)

(declare-fun call!22681 () Bool)

(assert (=> b!243259 (= res!119223 call!22681)))

(assert (=> b!243259 (=> (not res!119223) (not e!157860))))

(declare-fun b!243260 () Bool)

(declare-fun e!157862 () Bool)

(declare-fun e!157871 () Bool)

(assert (=> b!243260 (= e!157862 e!157871)))

(declare-fun res!119218 () Bool)

(assert (=> b!243260 (=> (not res!119218) (not e!157871))))

(assert (=> b!243260 (= res!119218 (contains!1730 lt!122002 (select (arr!5716 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!243260 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6059 (_keys!6614 thiss!1504))))))

(declare-fun b!243261 () Bool)

(declare-fun e!157861 () ListLongMap!3631)

(assert (=> b!243261 (= e!157861 call!22678)))

(declare-fun b!243262 () Bool)

(declare-fun e!157859 () Bool)

(assert (=> b!243262 (= e!157859 e!157866)))

(declare-fun c!40604 () Bool)

(assert (=> b!243262 (= c!40604 (not (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!243263 () Bool)

(assert (=> b!243263 (= e!157866 (not call!22681))))

(declare-fun b!243264 () Bool)

(declare-fun c!40602 () Bool)

(assert (=> b!243264 (= c!40602 (and (not (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!243264 (= e!157864 e!157861)))

(declare-fun b!243265 () Bool)

(declare-fun e!157869 () Bool)

(assert (=> b!243265 (= e!157867 e!157869)))

(declare-fun res!119222 () Bool)

(assert (=> b!243265 (= res!119222 call!22677)))

(assert (=> b!243265 (=> (not res!119222) (not e!157869))))

(declare-fun b!243266 () Bool)

(assert (=> b!243266 (= e!157869 (= (apply!226 lt!122002 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4346 thiss!1504)))))

(declare-fun b!243267 () Bool)

(assert (=> b!243267 (= e!157861 call!22679)))

(declare-fun bm!22677 () Bool)

(assert (=> bm!22677 (= call!22681 (contains!1730 lt!122002 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!59909 () Bool)

(assert (=> d!59909 e!157859))

(declare-fun res!119221 () Bool)

(assert (=> d!59909 (=> (not res!119221) (not e!157859))))

(assert (=> d!59909 (= res!119221 (or (bvsge #b00000000000000000000000000000000 (size!6059 (_keys!6614 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6059 (_keys!6614 thiss!1504))))))))

(declare-fun lt!121987 () ListLongMap!3631)

(assert (=> d!59909 (= lt!122002 lt!121987)))

(declare-fun lt!121998 () Unit!7487)

(assert (=> d!59909 (= lt!121998 e!157870)))

(declare-fun c!40603 () Bool)

(declare-fun e!157868 () Bool)

(assert (=> d!59909 (= c!40603 e!157868)))

(declare-fun res!119216 () Bool)

(assert (=> d!59909 (=> (not res!119216) (not e!157868))))

(assert (=> d!59909 (= res!119216 (bvslt #b00000000000000000000000000000000 (size!6059 (_keys!6614 thiss!1504))))))

(declare-fun e!157863 () ListLongMap!3631)

(assert (=> d!59909 (= lt!121987 e!157863)))

(assert (=> d!59909 (= c!40606 (and (not (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59909 (validMask!0 (mask!10593 thiss!1504))))

(assert (=> d!59909 (= (getCurrentListMap!1340 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)) lt!122002)))

(declare-fun b!243268 () Bool)

(declare-fun get!2932 (ValueCell!2846 V!8153) V!8153)

(declare-fun dynLambda!560 (Int (_ BitVec 64)) V!8153)

(assert (=> b!243268 (= e!157871 (= (apply!226 lt!122002 (select (arr!5716 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000)) (get!2932 (select (arr!5715 (_values!4488 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4505 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!243268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6058 (_values!4488 thiss!1504))))))

(assert (=> b!243268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6059 (_keys!6614 thiss!1504))))))

(declare-fun b!243269 () Bool)

(assert (=> b!243269 (= e!157860 (= (apply!226 lt!122002 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4346 thiss!1504)))))

(declare-fun bm!22678 () Bool)

(assert (=> bm!22678 (= call!22683 call!22682)))

(declare-fun b!243270 () Bool)

(assert (=> b!243270 (= e!157863 e!157864)))

(assert (=> b!243270 (= c!40605 (and (not (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22679 () Bool)

(assert (=> bm!22679 (= call!22678 call!22680)))

(declare-fun b!243271 () Bool)

(declare-fun res!119219 () Bool)

(assert (=> b!243271 (=> (not res!119219) (not e!157859))))

(assert (=> b!243271 (= res!119219 e!157867)))

(declare-fun c!40601 () Bool)

(assert (=> b!243271 (= c!40601 (not (= (bvand (extraKeys!4242 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!243272 () Bool)

(declare-fun e!157865 () Bool)

(assert (=> b!243272 (= e!157865 (validKeyInArray!0 (select (arr!5716 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243273 () Bool)

(assert (=> b!243273 (= e!157868 (validKeyInArray!0 (select (arr!5716 (_keys!6614 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22680 () Bool)

(assert (=> bm!22680 (= call!22679 call!22683)))

(declare-fun b!243274 () Bool)

(declare-fun res!119224 () Bool)

(assert (=> b!243274 (=> (not res!119224) (not e!157859))))

(assert (=> b!243274 (= res!119224 e!157862)))

(declare-fun res!119217 () Bool)

(assert (=> b!243274 (=> res!119217 e!157862)))

(assert (=> b!243274 (= res!119217 (not e!157865))))

(declare-fun res!119220 () Bool)

(assert (=> b!243274 (=> (not res!119220) (not e!157865))))

(assert (=> b!243274 (= res!119220 (bvslt #b00000000000000000000000000000000 (size!6059 (_keys!6614 thiss!1504))))))

(declare-fun b!243275 () Bool)

(assert (=> b!243275 (= e!157863 (+!659 call!22680 (tuple2!4729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4346 thiss!1504))))))

(assert (= (and d!59909 c!40606) b!243275))

(assert (= (and d!59909 (not c!40606)) b!243270))

(assert (= (and b!243270 c!40605) b!243257))

(assert (= (and b!243270 (not c!40605)) b!243264))

(assert (= (and b!243264 c!40602) b!243261))

(assert (= (and b!243264 (not c!40602)) b!243267))

(assert (= (or b!243261 b!243267) bm!22680))

(assert (= (or b!243257 bm!22680) bm!22678))

(assert (= (or b!243257 b!243261) bm!22679))

(assert (= (or b!243275 bm!22678) bm!22676))

(assert (= (or b!243275 bm!22679) bm!22675))

(assert (= (and d!59909 res!119216) b!243273))

(assert (= (and d!59909 c!40603) b!243256))

(assert (= (and d!59909 (not c!40603)) b!243258))

(assert (= (and d!59909 res!119221) b!243274))

(assert (= (and b!243274 res!119220) b!243272))

(assert (= (and b!243274 (not res!119217)) b!243260))

(assert (= (and b!243260 res!119218) b!243268))

(assert (= (and b!243274 res!119224) b!243271))

(assert (= (and b!243271 c!40601) b!243265))

(assert (= (and b!243271 (not c!40601)) b!243255))

(assert (= (and b!243265 res!119222) b!243266))

(assert (= (or b!243265 b!243255) bm!22674))

(assert (= (and b!243271 res!119219) b!243262))

(assert (= (and b!243262 c!40604) b!243259))

(assert (= (and b!243262 (not c!40604)) b!243263))

(assert (= (and b!243259 res!119223) b!243269))

(assert (= (or b!243259 b!243263) bm!22677))

(declare-fun b_lambda!7989 () Bool)

(assert (=> (not b_lambda!7989) (not b!243268)))

(declare-fun t!8628 () Bool)

(declare-fun tb!2957 () Bool)

(assert (=> (and b!242954 (= (defaultEntry!4505 thiss!1504) (defaultEntry!4505 thiss!1504)) t!8628) tb!2957))

(declare-fun result!5209 () Bool)

(assert (=> tb!2957 (= result!5209 tp_is_empty!6379)))

(assert (=> b!243268 t!8628))

(declare-fun b_and!13477 () Bool)

(assert (= b_and!13471 (and (=> t!8628 result!5209) b_and!13477)))

(declare-fun m!261215 () Bool)

(assert (=> bm!22676 m!261215))

(declare-fun m!261217 () Bool)

(assert (=> b!243275 m!261217))

(declare-fun m!261219 () Bool)

(assert (=> b!243269 m!261219))

(declare-fun m!261221 () Bool)

(assert (=> bm!22677 m!261221))

(assert (=> b!243268 m!261187))

(declare-fun m!261223 () Bool)

(assert (=> b!243268 m!261223))

(assert (=> b!243268 m!261187))

(declare-fun m!261225 () Bool)

(assert (=> b!243268 m!261225))

(declare-fun m!261227 () Bool)

(assert (=> b!243268 m!261227))

(assert (=> b!243268 m!261225))

(declare-fun m!261229 () Bool)

(assert (=> b!243268 m!261229))

(assert (=> b!243268 m!261227))

(declare-fun m!261231 () Bool)

(assert (=> b!243266 m!261231))

(assert (=> b!243260 m!261187))

(assert (=> b!243260 m!261187))

(declare-fun m!261233 () Bool)

(assert (=> b!243260 m!261233))

(assert (=> b!243272 m!261187))

(assert (=> b!243272 m!261187))

(assert (=> b!243272 m!261191))

(declare-fun m!261235 () Bool)

(assert (=> bm!22674 m!261235))

(assert (=> b!243273 m!261187))

(assert (=> b!243273 m!261187))

(assert (=> b!243273 m!261191))

(declare-fun m!261237 () Bool)

(assert (=> b!243256 m!261237))

(declare-fun m!261239 () Bool)

(assert (=> b!243256 m!261239))

(declare-fun m!261241 () Bool)

(assert (=> b!243256 m!261241))

(declare-fun m!261243 () Bool)

(assert (=> b!243256 m!261243))

(declare-fun m!261245 () Bool)

(assert (=> b!243256 m!261245))

(declare-fun m!261247 () Bool)

(assert (=> b!243256 m!261247))

(assert (=> b!243256 m!261243))

(declare-fun m!261249 () Bool)

(assert (=> b!243256 m!261249))

(declare-fun m!261251 () Bool)

(assert (=> b!243256 m!261251))

(declare-fun m!261253 () Bool)

(assert (=> b!243256 m!261253))

(declare-fun m!261255 () Bool)

(assert (=> b!243256 m!261255))

(declare-fun m!261257 () Bool)

(assert (=> b!243256 m!261257))

(assert (=> b!243256 m!261237))

(assert (=> b!243256 m!261241))

(declare-fun m!261259 () Bool)

(assert (=> b!243256 m!261259))

(assert (=> b!243256 m!261187))

(declare-fun m!261261 () Bool)

(assert (=> b!243256 m!261261))

(assert (=> b!243256 m!261255))

(declare-fun m!261263 () Bool)

(assert (=> b!243256 m!261263))

(assert (=> b!243256 m!261215))

(declare-fun m!261265 () Bool)

(assert (=> b!243256 m!261265))

(assert (=> d!59909 m!261169))

(declare-fun m!261267 () Bool)

(assert (=> bm!22675 m!261267))

(assert (=> b!242948 d!59909))

(assert (=> b!242958 d!59899))

(declare-fun d!59911 () Bool)

(declare-fun lt!122006 () Bool)

(assert (=> d!59911 (= lt!122006 (select (content!160 Nil!3624) key!932))))

(declare-fun e!157872 () Bool)

(assert (=> d!59911 (= lt!122006 e!157872)))

(declare-fun res!119225 () Bool)

(assert (=> d!59911 (=> (not res!119225) (not e!157872))))

(assert (=> d!59911 (= res!119225 ((_ is Cons!3623) Nil!3624))))

(assert (=> d!59911 (= (contains!1729 Nil!3624 key!932) lt!122006)))

(declare-fun b!243278 () Bool)

(declare-fun e!157873 () Bool)

(assert (=> b!243278 (= e!157872 e!157873)))

(declare-fun res!119226 () Bool)

(assert (=> b!243278 (=> res!119226 e!157873)))

(assert (=> b!243278 (= res!119226 (= (h!4280 Nil!3624) key!932))))

(declare-fun b!243279 () Bool)

(assert (=> b!243279 (= e!157873 (contains!1729 (t!8623 Nil!3624) key!932))))

(assert (= (and d!59911 res!119225) b!243278))

(assert (= (and b!243278 (not res!119226)) b!243279))

(assert (=> d!59911 m!261175))

(declare-fun m!261269 () Bool)

(assert (=> d!59911 m!261269))

(declare-fun m!261271 () Bool)

(assert (=> b!243279 m!261271))

(assert (=> b!242938 d!59911))

(assert (=> b!242936 d!59911))

(declare-fun e!157880 () SeekEntryResult!1068)

(declare-fun b!243292 () Bool)

(declare-fun lt!122013 () SeekEntryResult!1068)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12041 (_ BitVec 32)) SeekEntryResult!1068)

(assert (=> b!243292 (= e!157880 (seekKeyOrZeroReturnVacant!0 (x!24309 lt!122013) (index!6444 lt!122013) (index!6444 lt!122013) key!932 (_keys!6614 thiss!1504) (mask!10593 thiss!1504)))))

(declare-fun d!59913 () Bool)

(declare-fun lt!122015 () SeekEntryResult!1068)

(assert (=> d!59913 (and (or ((_ is Undefined!1068) lt!122015) (not ((_ is Found!1068) lt!122015)) (and (bvsge (index!6443 lt!122015) #b00000000000000000000000000000000) (bvslt (index!6443 lt!122015) (size!6059 (_keys!6614 thiss!1504))))) (or ((_ is Undefined!1068) lt!122015) ((_ is Found!1068) lt!122015) (not ((_ is MissingZero!1068) lt!122015)) (and (bvsge (index!6442 lt!122015) #b00000000000000000000000000000000) (bvslt (index!6442 lt!122015) (size!6059 (_keys!6614 thiss!1504))))) (or ((_ is Undefined!1068) lt!122015) ((_ is Found!1068) lt!122015) ((_ is MissingZero!1068) lt!122015) (not ((_ is MissingVacant!1068) lt!122015)) (and (bvsge (index!6445 lt!122015) #b00000000000000000000000000000000) (bvslt (index!6445 lt!122015) (size!6059 (_keys!6614 thiss!1504))))) (or ((_ is Undefined!1068) lt!122015) (ite ((_ is Found!1068) lt!122015) (= (select (arr!5716 (_keys!6614 thiss!1504)) (index!6443 lt!122015)) key!932) (ite ((_ is MissingZero!1068) lt!122015) (= (select (arr!5716 (_keys!6614 thiss!1504)) (index!6442 lt!122015)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1068) lt!122015) (= (select (arr!5716 (_keys!6614 thiss!1504)) (index!6445 lt!122015)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!157882 () SeekEntryResult!1068)

(assert (=> d!59913 (= lt!122015 e!157882)))

(declare-fun c!40615 () Bool)

(assert (=> d!59913 (= c!40615 (and ((_ is Intermediate!1068) lt!122013) (undefined!1880 lt!122013)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12041 (_ BitVec 32)) SeekEntryResult!1068)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59913 (= lt!122013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10593 thiss!1504)) key!932 (_keys!6614 thiss!1504) (mask!10593 thiss!1504)))))

(assert (=> d!59913 (validMask!0 (mask!10593 thiss!1504))))

(assert (=> d!59913 (= (seekEntryOrOpen!0 key!932 (_keys!6614 thiss!1504) (mask!10593 thiss!1504)) lt!122015)))

(declare-fun b!243293 () Bool)

(declare-fun e!157881 () SeekEntryResult!1068)

(assert (=> b!243293 (= e!157882 e!157881)))

(declare-fun lt!122014 () (_ BitVec 64))

(assert (=> b!243293 (= lt!122014 (select (arr!5716 (_keys!6614 thiss!1504)) (index!6444 lt!122013)))))

(declare-fun c!40614 () Bool)

(assert (=> b!243293 (= c!40614 (= lt!122014 key!932))))

(declare-fun b!243294 () Bool)

(assert (=> b!243294 (= e!157880 (MissingZero!1068 (index!6444 lt!122013)))))

(declare-fun b!243295 () Bool)

(assert (=> b!243295 (= e!157881 (Found!1068 (index!6444 lt!122013)))))

(declare-fun b!243296 () Bool)

(declare-fun c!40613 () Bool)

(assert (=> b!243296 (= c!40613 (= lt!122014 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243296 (= e!157881 e!157880)))

(declare-fun b!243297 () Bool)

(assert (=> b!243297 (= e!157882 Undefined!1068)))

(assert (= (and d!59913 c!40615) b!243297))

(assert (= (and d!59913 (not c!40615)) b!243293))

(assert (= (and b!243293 c!40614) b!243295))

(assert (= (and b!243293 (not c!40614)) b!243296))

(assert (= (and b!243296 c!40613) b!243294))

(assert (= (and b!243296 (not c!40613)) b!243292))

(declare-fun m!261273 () Bool)

(assert (=> b!243292 m!261273))

(declare-fun m!261275 () Bool)

(assert (=> d!59913 m!261275))

(declare-fun m!261277 () Bool)

(assert (=> d!59913 m!261277))

(declare-fun m!261279 () Bool)

(assert (=> d!59913 m!261279))

(assert (=> d!59913 m!261277))

(declare-fun m!261281 () Bool)

(assert (=> d!59913 m!261281))

(assert (=> d!59913 m!261169))

(declare-fun m!261283 () Bool)

(assert (=> d!59913 m!261283))

(declare-fun m!261285 () Bool)

(assert (=> b!243293 m!261285))

(assert (=> b!242937 d!59913))

(declare-fun d!59915 () Bool)

(declare-fun lt!122016 () Bool)

(assert (=> d!59915 (= lt!122016 (select (content!160 Nil!3624) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157883 () Bool)

(assert (=> d!59915 (= lt!122016 e!157883)))

(declare-fun res!119227 () Bool)

(assert (=> d!59915 (=> (not res!119227) (not e!157883))))

(assert (=> d!59915 (= res!119227 ((_ is Cons!3623) Nil!3624))))

(assert (=> d!59915 (= (contains!1729 Nil!3624 #b0000000000000000000000000000000000000000000000000000000000000000) lt!122016)))

(declare-fun b!243298 () Bool)

(declare-fun e!157884 () Bool)

(assert (=> b!243298 (= e!157883 e!157884)))

(declare-fun res!119228 () Bool)

(assert (=> b!243298 (=> res!119228 e!157884)))

(assert (=> b!243298 (= res!119228 (= (h!4280 Nil!3624) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243299 () Bool)

(assert (=> b!243299 (= e!157884 (contains!1729 (t!8623 Nil!3624) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59915 res!119227) b!243298))

(assert (= (and b!243298 (not res!119228)) b!243299))

(assert (=> d!59915 m!261175))

(declare-fun m!261287 () Bool)

(assert (=> d!59915 m!261287))

(declare-fun m!261289 () Bool)

(assert (=> b!243299 m!261289))

(assert (=> b!242946 d!59915))

(declare-fun d!59917 () Bool)

(assert (=> d!59917 (contains!1730 (getCurrentListMap!1340 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)) key!932)))

(declare-fun lt!122019 () Unit!7487)

(declare-fun choose!1143 (array!12041 array!12039 (_ BitVec 32) (_ BitVec 32) V!8153 V!8153 (_ BitVec 64) (_ BitVec 32) Int) Unit!7487)

(assert (=> d!59917 (= lt!122019 (choose!1143 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)))))

(assert (=> d!59917 (validMask!0 (mask!10593 thiss!1504))))

(assert (=> d!59917 (= (lemmaArrayContainsKeyThenInListMap!175 (_keys!6614 thiss!1504) (_values!4488 thiss!1504) (mask!10593 thiss!1504) (extraKeys!4242 thiss!1504) (zeroValue!4346 thiss!1504) (minValue!4346 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4505 thiss!1504)) lt!122019)))

(declare-fun bs!8844 () Bool)

(assert (= bs!8844 d!59917))

(assert (=> bs!8844 m!261081))

(assert (=> bs!8844 m!261081))

(assert (=> bs!8844 m!261083))

(declare-fun m!261291 () Bool)

(assert (=> bs!8844 m!261291))

(assert (=> bs!8844 m!261169))

(assert (=> b!242955 d!59917))

(declare-fun b!243307 () Bool)

(declare-fun e!157889 () Bool)

(assert (=> b!243307 (= e!157889 tp_is_empty!6379)))

(declare-fun condMapEmpty!10825 () Bool)

(declare-fun mapDefault!10825 () ValueCell!2846)

(assert (=> mapNonEmpty!10816 (= condMapEmpty!10825 (= mapRest!10816 ((as const (Array (_ BitVec 32) ValueCell!2846)) mapDefault!10825)))))

(declare-fun mapRes!10825 () Bool)

(assert (=> mapNonEmpty!10816 (= tp!22771 (and e!157889 mapRes!10825))))

(declare-fun b!243306 () Bool)

(declare-fun e!157890 () Bool)

(assert (=> b!243306 (= e!157890 tp_is_empty!6379)))

(declare-fun mapNonEmpty!10825 () Bool)

(declare-fun tp!22786 () Bool)

(assert (=> mapNonEmpty!10825 (= mapRes!10825 (and tp!22786 e!157890))))

(declare-fun mapRest!10825 () (Array (_ BitVec 32) ValueCell!2846))

(declare-fun mapKey!10825 () (_ BitVec 32))

(declare-fun mapValue!10825 () ValueCell!2846)

(assert (=> mapNonEmpty!10825 (= mapRest!10816 (store mapRest!10825 mapKey!10825 mapValue!10825))))

(declare-fun mapIsEmpty!10825 () Bool)

(assert (=> mapIsEmpty!10825 mapRes!10825))

(assert (= (and mapNonEmpty!10816 condMapEmpty!10825) mapIsEmpty!10825))

(assert (= (and mapNonEmpty!10816 (not condMapEmpty!10825)) mapNonEmpty!10825))

(assert (= (and mapNonEmpty!10825 ((_ is ValueCellFull!2846) mapValue!10825)) b!243306))

(assert (= (and mapNonEmpty!10816 ((_ is ValueCellFull!2846) mapDefault!10825)) b!243307))

(declare-fun m!261293 () Bool)

(assert (=> mapNonEmpty!10825 m!261293))

(declare-fun b_lambda!7991 () Bool)

(assert (= b_lambda!7989 (or (and b!242954 b_free!6517) b_lambda!7991)))

(check-sat (not d!59911) (not b!243268) (not b!243256) (not b!243272) (not d!59907) (not d!59909) (not b_next!6517) (not b!243185) b_and!13477 (not d!59913) (not b!243299) (not b!243191) (not b!243273) (not b!243279) (not bm!22674) (not bm!22677) (not b!243169) (not bm!22675) (not b!243260) (not d!59917) (not b!243269) (not b!243202) (not b!243170) (not bm!22655) (not mapNonEmpty!10825) (not bm!22659) tp_is_empty!6379 (not b!243203) (not d!59895) (not b!243181) (not b!243266) (not bm!22656) (not b!243292) (not b!243210) (not bm!22676) (not d!59915) (not b!243161) (not b_lambda!7991) (not d!59901) (not d!59891) (not b!243212) (not b!243196) (not b!243275) (not b!243183) (not b!243168) (not d!59889))
(check-sat b_and!13477 (not b_next!6517))
