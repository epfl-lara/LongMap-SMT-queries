; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19694 () Bool)

(assert start!19694)

(declare-fun b!193027 () Bool)

(declare-fun b_free!4701 () Bool)

(declare-fun b_next!4701 () Bool)

(assert (=> b!193027 (= b_free!4701 (not b_next!4701))))

(declare-fun tp!16964 () Bool)

(declare-fun b_and!11403 () Bool)

(assert (=> b!193027 (= tp!16964 b_and!11403)))

(declare-fun mapIsEmpty!7733 () Bool)

(declare-fun mapRes!7733 () Bool)

(assert (=> mapIsEmpty!7733 mapRes!7733))

(declare-fun b!193021 () Bool)

(declare-fun res!91207 () Bool)

(declare-fun e!127010 () Bool)

(assert (=> b!193021 (=> res!91207 e!127010)))

(declare-datatypes ((V!5611 0))(
  ( (V!5612 (val!2281 Int)) )
))
(declare-datatypes ((ValueCell!1893 0))(
  ( (ValueCellFull!1893 (v!4234 V!5611)) (EmptyCell!1893) )
))
(declare-datatypes ((array!8191 0))(
  ( (array!8192 (arr!3857 (Array (_ BitVec 32) (_ BitVec 64))) (size!4181 (_ BitVec 32))) )
))
(declare-datatypes ((array!8193 0))(
  ( (array!8194 (arr!3858 (Array (_ BitVec 32) ValueCell!1893)) (size!4182 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2694 0))(
  ( (LongMapFixedSize!2695 (defaultEntry!3939 Int) (mask!9184 (_ BitVec 32)) (extraKeys!3676 (_ BitVec 32)) (zeroValue!3780 V!5611) (minValue!3780 V!5611) (_size!1396 (_ BitVec 32)) (_keys!5927 array!8191) (_values!3922 array!8193) (_vacant!1396 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2694)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8191 (_ BitVec 32)) Bool)

(assert (=> b!193021 (= res!91207 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5927 thiss!1248) (mask!9184 thiss!1248))))))

(declare-fun e!127005 () Bool)

(declare-datatypes ((SeekEntryResult!685 0))(
  ( (MissingZero!685 (index!4910 (_ BitVec 32))) (Found!685 (index!4911 (_ BitVec 32))) (Intermediate!685 (undefined!1497 Bool) (index!4912 (_ BitVec 32)) (x!20627 (_ BitVec 32))) (Undefined!685) (MissingVacant!685 (index!4913 (_ BitVec 32))) )
))
(declare-fun lt!96041 () SeekEntryResult!685)

(declare-fun b!193022 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!193022 (= e!127005 (= (select (arr!3857 (_keys!5927 thiss!1248)) (index!4911 lt!96041)) key!828))))

(declare-fun b!193023 () Bool)

(declare-fun res!91204 () Bool)

(declare-fun e!127007 () Bool)

(assert (=> b!193023 (=> (not res!91204) (not e!127007))))

(assert (=> b!193023 (= res!91204 (not (= key!828 (bvneg key!828))))))

(declare-fun res!91202 () Bool)

(assert (=> start!19694 (=> (not res!91202) (not e!127007))))

(declare-fun valid!1105 (LongMapFixedSize!2694) Bool)

(assert (=> start!19694 (= res!91202 (valid!1105 thiss!1248))))

(assert (=> start!19694 e!127007))

(declare-fun e!127004 () Bool)

(assert (=> start!19694 e!127004))

(assert (=> start!19694 true))

(declare-fun tp_is_empty!4473 () Bool)

(assert (=> start!19694 tp_is_empty!4473))

(declare-fun b!193024 () Bool)

(declare-fun e!127006 () Bool)

(assert (=> b!193024 (= e!127007 e!127006)))

(declare-fun res!91203 () Bool)

(assert (=> b!193024 (=> (not res!91203) (not e!127006))))

(get-info :version)

(assert (=> b!193024 (= res!91203 (and (not ((_ is Undefined!685) lt!96041)) (not ((_ is MissingVacant!685) lt!96041)) (not ((_ is MissingZero!685) lt!96041)) ((_ is Found!685) lt!96041)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8191 (_ BitVec 32)) SeekEntryResult!685)

(assert (=> b!193024 (= lt!96041 (seekEntryOrOpen!0 key!828 (_keys!5927 thiss!1248) (mask!9184 thiss!1248)))))

(declare-fun b!193025 () Bool)

(declare-fun e!127009 () Bool)

(assert (=> b!193025 (= e!127009 tp_is_empty!4473)))

(declare-fun b!193026 () Bool)

(declare-datatypes ((Unit!5844 0))(
  ( (Unit!5845) )
))
(declare-fun e!127012 () Unit!5844)

(declare-fun lt!96040 () Unit!5844)

(assert (=> b!193026 (= e!127012 lt!96040)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!179 (array!8191 array!8193 (_ BitVec 32) (_ BitVec 32) V!5611 V!5611 (_ BitVec 64) Int) Unit!5844)

(assert (=> b!193026 (= lt!96040 (lemmaInListMapThenSeekEntryOrOpenFindsIt!179 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) key!828 (defaultEntry!3939 thiss!1248)))))

(declare-fun res!91206 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193026 (= res!91206 (inRange!0 (index!4911 lt!96041) (mask!9184 thiss!1248)))))

(assert (=> b!193026 (=> (not res!91206) (not e!127005))))

(assert (=> b!193026 e!127005))

(declare-fun e!127011 () Bool)

(declare-fun array_inv!2501 (array!8191) Bool)

(declare-fun array_inv!2502 (array!8193) Bool)

(assert (=> b!193027 (= e!127004 (and tp!16964 tp_is_empty!4473 (array_inv!2501 (_keys!5927 thiss!1248)) (array_inv!2502 (_values!3922 thiss!1248)) e!127011))))

(declare-fun b!193028 () Bool)

(assert (=> b!193028 (= e!127006 (not e!127010))))

(declare-fun res!91201 () Bool)

(assert (=> b!193028 (=> res!91201 e!127010)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!193028 (= res!91201 (not (validMask!0 (mask!9184 thiss!1248))))))

(declare-fun v!309 () V!5611)

(declare-datatypes ((tuple2!3542 0))(
  ( (tuple2!3543 (_1!1782 (_ BitVec 64)) (_2!1782 V!5611)) )
))
(declare-datatypes ((List!2433 0))(
  ( (Nil!2430) (Cons!2429 (h!3070 tuple2!3542) (t!7353 List!2433)) )
))
(declare-datatypes ((ListLongMap!2459 0))(
  ( (ListLongMap!2460 (toList!1245 List!2433)) )
))
(declare-fun lt!96037 () ListLongMap!2459)

(declare-fun +!313 (ListLongMap!2459 tuple2!3542) ListLongMap!2459)

(declare-fun getCurrentListMap!893 (array!8191 array!8193 (_ BitVec 32) (_ BitVec 32) V!5611 V!5611 (_ BitVec 32) Int) ListLongMap!2459)

(assert (=> b!193028 (= (+!313 lt!96037 (tuple2!3543 key!828 v!309)) (getCurrentListMap!893 (_keys!5927 thiss!1248) (array!8194 (store (arr!3858 (_values!3922 thiss!1248)) (index!4911 lt!96041) (ValueCellFull!1893 v!309)) (size!4182 (_values!3922 thiss!1248))) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)))))

(declare-fun lt!96042 () Unit!5844)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!114 (array!8191 array!8193 (_ BitVec 32) (_ BitVec 32) V!5611 V!5611 (_ BitVec 32) (_ BitVec 64) V!5611 Int) Unit!5844)

(assert (=> b!193028 (= lt!96042 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!114 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) (index!4911 lt!96041) key!828 v!309 (defaultEntry!3939 thiss!1248)))))

(declare-fun lt!96039 () Unit!5844)

(assert (=> b!193028 (= lt!96039 e!127012)))

(declare-fun c!34811 () Bool)

(declare-fun contains!1364 (ListLongMap!2459 (_ BitVec 64)) Bool)

(assert (=> b!193028 (= c!34811 (contains!1364 lt!96037 key!828))))

(assert (=> b!193028 (= lt!96037 (getCurrentListMap!893 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)))))

(declare-fun mapNonEmpty!7733 () Bool)

(declare-fun tp!16963 () Bool)

(assert (=> mapNonEmpty!7733 (= mapRes!7733 (and tp!16963 e!127009))))

(declare-fun mapRest!7733 () (Array (_ BitVec 32) ValueCell!1893))

(declare-fun mapValue!7733 () ValueCell!1893)

(declare-fun mapKey!7733 () (_ BitVec 32))

(assert (=> mapNonEmpty!7733 (= (arr!3858 (_values!3922 thiss!1248)) (store mapRest!7733 mapKey!7733 mapValue!7733))))

(declare-fun b!193029 () Bool)

(declare-fun res!91205 () Bool)

(assert (=> b!193029 (=> res!91205 e!127010)))

(assert (=> b!193029 (= res!91205 (or (not (= (size!4182 (_values!3922 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9184 thiss!1248)))) (not (= (size!4181 (_keys!5927 thiss!1248)) (size!4182 (_values!3922 thiss!1248)))) (bvslt (mask!9184 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3676 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3676 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!193030 () Bool)

(declare-fun Unit!5846 () Unit!5844)

(assert (=> b!193030 (= e!127012 Unit!5846)))

(declare-fun lt!96038 () Unit!5844)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!189 (array!8191 array!8193 (_ BitVec 32) (_ BitVec 32) V!5611 V!5611 (_ BitVec 64) Int) Unit!5844)

(assert (=> b!193030 (= lt!96038 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!189 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) key!828 (defaultEntry!3939 thiss!1248)))))

(assert (=> b!193030 false))

(declare-fun b!193031 () Bool)

(declare-fun e!127008 () Bool)

(assert (=> b!193031 (= e!127011 (and e!127008 mapRes!7733))))

(declare-fun condMapEmpty!7733 () Bool)

(declare-fun mapDefault!7733 () ValueCell!1893)

(assert (=> b!193031 (= condMapEmpty!7733 (= (arr!3858 (_values!3922 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1893)) mapDefault!7733)))))

(declare-fun b!193032 () Bool)

(assert (=> b!193032 (= e!127008 tp_is_empty!4473)))

(declare-fun b!193033 () Bool)

(declare-datatypes ((List!2434 0))(
  ( (Nil!2431) (Cons!2430 (h!3071 (_ BitVec 64)) (t!7354 List!2434)) )
))
(declare-fun arrayNoDuplicates!0 (array!8191 (_ BitVec 32) List!2434) Bool)

(assert (=> b!193033 (= e!127010 (arrayNoDuplicates!0 (_keys!5927 thiss!1248) #b00000000000000000000000000000000 Nil!2431))))

(assert (= (and start!19694 res!91202) b!193023))

(assert (= (and b!193023 res!91204) b!193024))

(assert (= (and b!193024 res!91203) b!193028))

(assert (= (and b!193028 c!34811) b!193026))

(assert (= (and b!193028 (not c!34811)) b!193030))

(assert (= (and b!193026 res!91206) b!193022))

(assert (= (and b!193028 (not res!91201)) b!193029))

(assert (= (and b!193029 (not res!91205)) b!193021))

(assert (= (and b!193021 (not res!91207)) b!193033))

(assert (= (and b!193031 condMapEmpty!7733) mapIsEmpty!7733))

(assert (= (and b!193031 (not condMapEmpty!7733)) mapNonEmpty!7733))

(assert (= (and mapNonEmpty!7733 ((_ is ValueCellFull!1893) mapValue!7733)) b!193025))

(assert (= (and b!193031 ((_ is ValueCellFull!1893) mapDefault!7733)) b!193032))

(assert (= b!193027 b!193031))

(assert (= start!19694 b!193027))

(declare-fun m!219845 () Bool)

(assert (=> b!193033 m!219845))

(declare-fun m!219847 () Bool)

(assert (=> b!193021 m!219847))

(declare-fun m!219849 () Bool)

(assert (=> mapNonEmpty!7733 m!219849))

(declare-fun m!219851 () Bool)

(assert (=> start!19694 m!219851))

(declare-fun m!219853 () Bool)

(assert (=> b!193022 m!219853))

(declare-fun m!219855 () Bool)

(assert (=> b!193030 m!219855))

(declare-fun m!219857 () Bool)

(assert (=> b!193026 m!219857))

(declare-fun m!219859 () Bool)

(assert (=> b!193026 m!219859))

(declare-fun m!219861 () Bool)

(assert (=> b!193024 m!219861))

(declare-fun m!219863 () Bool)

(assert (=> b!193027 m!219863))

(declare-fun m!219865 () Bool)

(assert (=> b!193027 m!219865))

(declare-fun m!219867 () Bool)

(assert (=> b!193028 m!219867))

(declare-fun m!219869 () Bool)

(assert (=> b!193028 m!219869))

(declare-fun m!219871 () Bool)

(assert (=> b!193028 m!219871))

(declare-fun m!219873 () Bool)

(assert (=> b!193028 m!219873))

(declare-fun m!219875 () Bool)

(assert (=> b!193028 m!219875))

(declare-fun m!219877 () Bool)

(assert (=> b!193028 m!219877))

(declare-fun m!219879 () Bool)

(assert (=> b!193028 m!219879))

(check-sat tp_is_empty!4473 (not b!193028) (not b!193026) (not b!193027) (not b!193030) (not start!19694) (not b!193021) (not mapNonEmpty!7733) (not b!193024) b_and!11403 (not b!193033) (not b_next!4701))
(check-sat b_and!11403 (not b_next!4701))
(get-model)

(declare-fun b!193083 () Bool)

(declare-fun e!127053 () Bool)

(declare-fun e!127054 () Bool)

(assert (=> b!193083 (= e!127053 e!127054)))

(declare-fun c!34817 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!193083 (= c!34817 (validKeyInArray!0 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193084 () Bool)

(declare-fun call!19492 () Bool)

(assert (=> b!193084 (= e!127054 call!19492)))

(declare-fun bm!19489 () Bool)

(assert (=> bm!19489 (= call!19492 (arrayNoDuplicates!0 (_keys!5927 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34817 (Cons!2430 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000) Nil!2431) Nil!2431)))))

(declare-fun b!193086 () Bool)

(assert (=> b!193086 (= e!127054 call!19492)))

(declare-fun b!193087 () Bool)

(declare-fun e!127051 () Bool)

(assert (=> b!193087 (= e!127051 e!127053)))

(declare-fun res!91236 () Bool)

(assert (=> b!193087 (=> (not res!91236) (not e!127053))))

(declare-fun e!127052 () Bool)

(assert (=> b!193087 (= res!91236 (not e!127052))))

(declare-fun res!91235 () Bool)

(assert (=> b!193087 (=> (not res!91235) (not e!127052))))

(assert (=> b!193087 (= res!91235 (validKeyInArray!0 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56541 () Bool)

(declare-fun res!91237 () Bool)

(assert (=> d!56541 (=> res!91237 e!127051)))

(assert (=> d!56541 (= res!91237 (bvsge #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))))))

(assert (=> d!56541 (= (arrayNoDuplicates!0 (_keys!5927 thiss!1248) #b00000000000000000000000000000000 Nil!2431) e!127051)))

(declare-fun b!193085 () Bool)

(declare-fun contains!1366 (List!2434 (_ BitVec 64)) Bool)

(assert (=> b!193085 (= e!127052 (contains!1366 Nil!2431 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!56541 (not res!91237)) b!193087))

(assert (= (and b!193087 res!91235) b!193085))

(assert (= (and b!193087 res!91236) b!193083))

(assert (= (and b!193083 c!34817) b!193086))

(assert (= (and b!193083 (not c!34817)) b!193084))

(assert (= (or b!193086 b!193084) bm!19489))

(declare-fun m!219917 () Bool)

(assert (=> b!193083 m!219917))

(assert (=> b!193083 m!219917))

(declare-fun m!219919 () Bool)

(assert (=> b!193083 m!219919))

(assert (=> bm!19489 m!219917))

(declare-fun m!219921 () Bool)

(assert (=> bm!19489 m!219921))

(assert (=> b!193087 m!219917))

(assert (=> b!193087 m!219917))

(assert (=> b!193087 m!219919))

(assert (=> b!193085 m!219917))

(assert (=> b!193085 m!219917))

(declare-fun m!219923 () Bool)

(assert (=> b!193085 m!219923))

(assert (=> b!193033 d!56541))

(declare-fun b!193100 () Bool)

(declare-fun e!127061 () SeekEntryResult!685)

(declare-fun lt!96068 () SeekEntryResult!685)

(assert (=> b!193100 (= e!127061 (Found!685 (index!4912 lt!96068)))))

(declare-fun b!193101 () Bool)

(declare-fun e!127062 () SeekEntryResult!685)

(assert (=> b!193101 (= e!127062 e!127061)))

(declare-fun lt!96067 () (_ BitVec 64))

(assert (=> b!193101 (= lt!96067 (select (arr!3857 (_keys!5927 thiss!1248)) (index!4912 lt!96068)))))

(declare-fun c!34826 () Bool)

(assert (=> b!193101 (= c!34826 (= lt!96067 key!828))))

(declare-fun b!193102 () Bool)

(declare-fun e!127063 () SeekEntryResult!685)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8191 (_ BitVec 32)) SeekEntryResult!685)

(assert (=> b!193102 (= e!127063 (seekKeyOrZeroReturnVacant!0 (x!20627 lt!96068) (index!4912 lt!96068) (index!4912 lt!96068) key!828 (_keys!5927 thiss!1248) (mask!9184 thiss!1248)))))

(declare-fun d!56543 () Bool)

(declare-fun lt!96069 () SeekEntryResult!685)

(assert (=> d!56543 (and (or ((_ is Undefined!685) lt!96069) (not ((_ is Found!685) lt!96069)) (and (bvsge (index!4911 lt!96069) #b00000000000000000000000000000000) (bvslt (index!4911 lt!96069) (size!4181 (_keys!5927 thiss!1248))))) (or ((_ is Undefined!685) lt!96069) ((_ is Found!685) lt!96069) (not ((_ is MissingZero!685) lt!96069)) (and (bvsge (index!4910 lt!96069) #b00000000000000000000000000000000) (bvslt (index!4910 lt!96069) (size!4181 (_keys!5927 thiss!1248))))) (or ((_ is Undefined!685) lt!96069) ((_ is Found!685) lt!96069) ((_ is MissingZero!685) lt!96069) (not ((_ is MissingVacant!685) lt!96069)) (and (bvsge (index!4913 lt!96069) #b00000000000000000000000000000000) (bvslt (index!4913 lt!96069) (size!4181 (_keys!5927 thiss!1248))))) (or ((_ is Undefined!685) lt!96069) (ite ((_ is Found!685) lt!96069) (= (select (arr!3857 (_keys!5927 thiss!1248)) (index!4911 lt!96069)) key!828) (ite ((_ is MissingZero!685) lt!96069) (= (select (arr!3857 (_keys!5927 thiss!1248)) (index!4910 lt!96069)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!685) lt!96069) (= (select (arr!3857 (_keys!5927 thiss!1248)) (index!4913 lt!96069)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56543 (= lt!96069 e!127062)))

(declare-fun c!34825 () Bool)

(assert (=> d!56543 (= c!34825 (and ((_ is Intermediate!685) lt!96068) (undefined!1497 lt!96068)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8191 (_ BitVec 32)) SeekEntryResult!685)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56543 (= lt!96068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9184 thiss!1248)) key!828 (_keys!5927 thiss!1248) (mask!9184 thiss!1248)))))

(assert (=> d!56543 (validMask!0 (mask!9184 thiss!1248))))

(assert (=> d!56543 (= (seekEntryOrOpen!0 key!828 (_keys!5927 thiss!1248) (mask!9184 thiss!1248)) lt!96069)))

(declare-fun b!193103 () Bool)

(declare-fun c!34824 () Bool)

(assert (=> b!193103 (= c!34824 (= lt!96067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193103 (= e!127061 e!127063)))

(declare-fun b!193104 () Bool)

(assert (=> b!193104 (= e!127062 Undefined!685)))

(declare-fun b!193105 () Bool)

(assert (=> b!193105 (= e!127063 (MissingZero!685 (index!4912 lt!96068)))))

(assert (= (and d!56543 c!34825) b!193104))

(assert (= (and d!56543 (not c!34825)) b!193101))

(assert (= (and b!193101 c!34826) b!193100))

(assert (= (and b!193101 (not c!34826)) b!193103))

(assert (= (and b!193103 c!34824) b!193105))

(assert (= (and b!193103 (not c!34824)) b!193102))

(declare-fun m!219925 () Bool)

(assert (=> b!193101 m!219925))

(declare-fun m!219927 () Bool)

(assert (=> b!193102 m!219927))

(declare-fun m!219929 () Bool)

(assert (=> d!56543 m!219929))

(declare-fun m!219931 () Bool)

(assert (=> d!56543 m!219931))

(declare-fun m!219933 () Bool)

(assert (=> d!56543 m!219933))

(declare-fun m!219935 () Bool)

(assert (=> d!56543 m!219935))

(declare-fun m!219937 () Bool)

(assert (=> d!56543 m!219937))

(assert (=> d!56543 m!219873))

(assert (=> d!56543 m!219933))

(assert (=> b!193024 d!56543))

(declare-fun d!56545 () Bool)

(declare-fun res!91244 () Bool)

(declare-fun e!127066 () Bool)

(assert (=> d!56545 (=> (not res!91244) (not e!127066))))

(declare-fun simpleValid!201 (LongMapFixedSize!2694) Bool)

(assert (=> d!56545 (= res!91244 (simpleValid!201 thiss!1248))))

(assert (=> d!56545 (= (valid!1105 thiss!1248) e!127066)))

(declare-fun b!193112 () Bool)

(declare-fun res!91245 () Bool)

(assert (=> b!193112 (=> (not res!91245) (not e!127066))))

(declare-fun arrayCountValidKeys!0 (array!8191 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!193112 (= res!91245 (= (arrayCountValidKeys!0 (_keys!5927 thiss!1248) #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))) (_size!1396 thiss!1248)))))

(declare-fun b!193113 () Bool)

(declare-fun res!91246 () Bool)

(assert (=> b!193113 (=> (not res!91246) (not e!127066))))

(assert (=> b!193113 (= res!91246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5927 thiss!1248) (mask!9184 thiss!1248)))))

(declare-fun b!193114 () Bool)

(assert (=> b!193114 (= e!127066 (arrayNoDuplicates!0 (_keys!5927 thiss!1248) #b00000000000000000000000000000000 Nil!2431))))

(assert (= (and d!56545 res!91244) b!193112))

(assert (= (and b!193112 res!91245) b!193113))

(assert (= (and b!193113 res!91246) b!193114))

(declare-fun m!219939 () Bool)

(assert (=> d!56545 m!219939))

(declare-fun m!219941 () Bool)

(assert (=> b!193112 m!219941))

(assert (=> b!193113 m!219847))

(assert (=> b!193114 m!219845))

(assert (=> start!19694 d!56545))

(declare-fun d!56547 () Bool)

(declare-fun e!127069 () Bool)

(assert (=> d!56547 e!127069))

(declare-fun res!91252 () Bool)

(assert (=> d!56547 (=> (not res!91252) (not e!127069))))

(declare-fun lt!96074 () SeekEntryResult!685)

(assert (=> d!56547 (= res!91252 ((_ is Found!685) lt!96074))))

(assert (=> d!56547 (= lt!96074 (seekEntryOrOpen!0 key!828 (_keys!5927 thiss!1248) (mask!9184 thiss!1248)))))

(declare-fun lt!96075 () Unit!5844)

(declare-fun choose!1054 (array!8191 array!8193 (_ BitVec 32) (_ BitVec 32) V!5611 V!5611 (_ BitVec 64) Int) Unit!5844)

(assert (=> d!56547 (= lt!96075 (choose!1054 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) key!828 (defaultEntry!3939 thiss!1248)))))

(assert (=> d!56547 (validMask!0 (mask!9184 thiss!1248))))

(assert (=> d!56547 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!179 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) key!828 (defaultEntry!3939 thiss!1248)) lt!96075)))

(declare-fun b!193119 () Bool)

(declare-fun res!91251 () Bool)

(assert (=> b!193119 (=> (not res!91251) (not e!127069))))

(assert (=> b!193119 (= res!91251 (inRange!0 (index!4911 lt!96074) (mask!9184 thiss!1248)))))

(declare-fun b!193120 () Bool)

(assert (=> b!193120 (= e!127069 (= (select (arr!3857 (_keys!5927 thiss!1248)) (index!4911 lt!96074)) key!828))))

(assert (=> b!193120 (and (bvsge (index!4911 lt!96074) #b00000000000000000000000000000000) (bvslt (index!4911 lt!96074) (size!4181 (_keys!5927 thiss!1248))))))

(assert (= (and d!56547 res!91252) b!193119))

(assert (= (and b!193119 res!91251) b!193120))

(assert (=> d!56547 m!219861))

(declare-fun m!219943 () Bool)

(assert (=> d!56547 m!219943))

(assert (=> d!56547 m!219873))

(declare-fun m!219945 () Bool)

(assert (=> b!193119 m!219945))

(declare-fun m!219947 () Bool)

(assert (=> b!193120 m!219947))

(assert (=> b!193026 d!56547))

(declare-fun d!56549 () Bool)

(assert (=> d!56549 (= (inRange!0 (index!4911 lt!96041) (mask!9184 thiss!1248)) (and (bvsge (index!4911 lt!96041) #b00000000000000000000000000000000) (bvslt (index!4911 lt!96041) (bvadd (mask!9184 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!193026 d!56549))

(declare-fun b!193137 () Bool)

(declare-fun lt!96081 () SeekEntryResult!685)

(assert (=> b!193137 (and (bvsge (index!4910 lt!96081) #b00000000000000000000000000000000) (bvslt (index!4910 lt!96081) (size!4181 (_keys!5927 thiss!1248))))))

(declare-fun res!91263 () Bool)

(assert (=> b!193137 (= res!91263 (= (select (arr!3857 (_keys!5927 thiss!1248)) (index!4910 lt!96081)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127079 () Bool)

(assert (=> b!193137 (=> (not res!91263) (not e!127079))))

(declare-fun b!193138 () Bool)

(declare-fun call!19498 () Bool)

(assert (=> b!193138 (= e!127079 (not call!19498))))

(declare-fun b!193139 () Bool)

(declare-fun res!91262 () Bool)

(declare-fun e!127081 () Bool)

(assert (=> b!193139 (=> (not res!91262) (not e!127081))))

(assert (=> b!193139 (= res!91262 (= (select (arr!3857 (_keys!5927 thiss!1248)) (index!4913 lt!96081)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193139 (and (bvsge (index!4913 lt!96081) #b00000000000000000000000000000000) (bvslt (index!4913 lt!96081) (size!4181 (_keys!5927 thiss!1248))))))

(declare-fun call!19497 () Bool)

(declare-fun bm!19494 () Bool)

(declare-fun c!34832 () Bool)

(assert (=> bm!19494 (= call!19497 (inRange!0 (ite c!34832 (index!4910 lt!96081) (index!4913 lt!96081)) (mask!9184 thiss!1248)))))

(declare-fun d!56551 () Bool)

(declare-fun e!127078 () Bool)

(assert (=> d!56551 e!127078))

(assert (=> d!56551 (= c!34832 ((_ is MissingZero!685) lt!96081))))

(assert (=> d!56551 (= lt!96081 (seekEntryOrOpen!0 key!828 (_keys!5927 thiss!1248) (mask!9184 thiss!1248)))))

(declare-fun lt!96080 () Unit!5844)

(declare-fun choose!1055 (array!8191 array!8193 (_ BitVec 32) (_ BitVec 32) V!5611 V!5611 (_ BitVec 64) Int) Unit!5844)

(assert (=> d!56551 (= lt!96080 (choose!1055 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) key!828 (defaultEntry!3939 thiss!1248)))))

(assert (=> d!56551 (validMask!0 (mask!9184 thiss!1248))))

(assert (=> d!56551 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!189 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) key!828 (defaultEntry!3939 thiss!1248)) lt!96080)))

(declare-fun b!193140 () Bool)

(declare-fun e!127080 () Bool)

(assert (=> b!193140 (= e!127080 ((_ is Undefined!685) lt!96081))))

(declare-fun bm!19495 () Bool)

(declare-fun arrayContainsKey!0 (array!8191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19495 (= call!19498 (arrayContainsKey!0 (_keys!5927 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!193141 () Bool)

(assert (=> b!193141 (= e!127081 (not call!19498))))

(declare-fun b!193142 () Bool)

(declare-fun res!91261 () Bool)

(assert (=> b!193142 (=> (not res!91261) (not e!127081))))

(assert (=> b!193142 (= res!91261 call!19497)))

(assert (=> b!193142 (= e!127080 e!127081)))

(declare-fun b!193143 () Bool)

(assert (=> b!193143 (= e!127078 e!127080)))

(declare-fun c!34831 () Bool)

(assert (=> b!193143 (= c!34831 ((_ is MissingVacant!685) lt!96081))))

(declare-fun b!193144 () Bool)

(assert (=> b!193144 (= e!127078 e!127079)))

(declare-fun res!91264 () Bool)

(assert (=> b!193144 (= res!91264 call!19497)))

(assert (=> b!193144 (=> (not res!91264) (not e!127079))))

(assert (= (and d!56551 c!34832) b!193144))

(assert (= (and d!56551 (not c!34832)) b!193143))

(assert (= (and b!193144 res!91264) b!193137))

(assert (= (and b!193137 res!91263) b!193138))

(assert (= (and b!193143 c!34831) b!193142))

(assert (= (and b!193143 (not c!34831)) b!193140))

(assert (= (and b!193142 res!91261) b!193139))

(assert (= (and b!193139 res!91262) b!193141))

(assert (= (or b!193144 b!193142) bm!19494))

(assert (= (or b!193138 b!193141) bm!19495))

(assert (=> d!56551 m!219861))

(declare-fun m!219949 () Bool)

(assert (=> d!56551 m!219949))

(assert (=> d!56551 m!219873))

(declare-fun m!219951 () Bool)

(assert (=> bm!19495 m!219951))

(declare-fun m!219953 () Bool)

(assert (=> b!193139 m!219953))

(declare-fun m!219955 () Bool)

(assert (=> b!193137 m!219955))

(declare-fun m!219957 () Bool)

(assert (=> bm!19494 m!219957))

(assert (=> b!193030 d!56551))

(declare-fun b!193153 () Bool)

(declare-fun e!127088 () Bool)

(declare-fun call!19501 () Bool)

(assert (=> b!193153 (= e!127088 call!19501)))

(declare-fun bm!19498 () Bool)

(assert (=> bm!19498 (= call!19501 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5927 thiss!1248) (mask!9184 thiss!1248)))))

(declare-fun b!193154 () Bool)

(declare-fun e!127090 () Bool)

(declare-fun e!127089 () Bool)

(assert (=> b!193154 (= e!127090 e!127089)))

(declare-fun c!34835 () Bool)

(assert (=> b!193154 (= c!34835 (validKeyInArray!0 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193155 () Bool)

(assert (=> b!193155 (= e!127089 call!19501)))

(declare-fun b!193156 () Bool)

(assert (=> b!193156 (= e!127089 e!127088)))

(declare-fun lt!96089 () (_ BitVec 64))

(assert (=> b!193156 (= lt!96089 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96090 () Unit!5844)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8191 (_ BitVec 64) (_ BitVec 32)) Unit!5844)

(assert (=> b!193156 (= lt!96090 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5927 thiss!1248) lt!96089 #b00000000000000000000000000000000))))

(assert (=> b!193156 (arrayContainsKey!0 (_keys!5927 thiss!1248) lt!96089 #b00000000000000000000000000000000)))

(declare-fun lt!96088 () Unit!5844)

(assert (=> b!193156 (= lt!96088 lt!96090)))

(declare-fun res!91269 () Bool)

(assert (=> b!193156 (= res!91269 (= (seekEntryOrOpen!0 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000) (_keys!5927 thiss!1248) (mask!9184 thiss!1248)) (Found!685 #b00000000000000000000000000000000)))))

(assert (=> b!193156 (=> (not res!91269) (not e!127088))))

(declare-fun d!56553 () Bool)

(declare-fun res!91270 () Bool)

(assert (=> d!56553 (=> res!91270 e!127090)))

(assert (=> d!56553 (= res!91270 (bvsge #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))))))

(assert (=> d!56553 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5927 thiss!1248) (mask!9184 thiss!1248)) e!127090)))

(assert (= (and d!56553 (not res!91270)) b!193154))

(assert (= (and b!193154 c!34835) b!193156))

(assert (= (and b!193154 (not c!34835)) b!193155))

(assert (= (and b!193156 res!91269) b!193153))

(assert (= (or b!193153 b!193155) bm!19498))

(declare-fun m!219959 () Bool)

(assert (=> bm!19498 m!219959))

(assert (=> b!193154 m!219917))

(assert (=> b!193154 m!219917))

(assert (=> b!193154 m!219919))

(assert (=> b!193156 m!219917))

(declare-fun m!219961 () Bool)

(assert (=> b!193156 m!219961))

(declare-fun m!219963 () Bool)

(assert (=> b!193156 m!219963))

(assert (=> b!193156 m!219917))

(declare-fun m!219965 () Bool)

(assert (=> b!193156 m!219965))

(assert (=> b!193021 d!56553))

(declare-fun d!56555 () Bool)

(assert (=> d!56555 (= (array_inv!2501 (_keys!5927 thiss!1248)) (bvsge (size!4181 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193027 d!56555))

(declare-fun d!56557 () Bool)

(assert (=> d!56557 (= (array_inv!2502 (_values!3922 thiss!1248)) (bvsge (size!4182 (_values!3922 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193027 d!56557))

(declare-fun b!193199 () Bool)

(declare-fun e!127125 () ListLongMap!2459)

(declare-fun call!19520 () ListLongMap!2459)

(assert (=> b!193199 (= e!127125 (+!313 call!19520 (tuple2!3543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3780 thiss!1248))))))

(declare-fun b!193200 () Bool)

(declare-fun e!127119 () ListLongMap!2459)

(assert (=> b!193200 (= e!127125 e!127119)))

(declare-fun c!34850 () Bool)

(assert (=> b!193200 (= c!34850 (and (not (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19513 () Bool)

(declare-fun call!19516 () ListLongMap!2459)

(declare-fun getCurrentListMapNoExtraKeys!218 (array!8191 array!8193 (_ BitVec 32) (_ BitVec 32) V!5611 V!5611 (_ BitVec 32) Int) ListLongMap!2459)

(assert (=> bm!19513 (= call!19516 (getCurrentListMapNoExtraKeys!218 (_keys!5927 thiss!1248) (array!8194 (store (arr!3858 (_values!3922 thiss!1248)) (index!4911 lt!96041) (ValueCellFull!1893 v!309)) (size!4182 (_values!3922 thiss!1248))) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)))))

(declare-fun bm!19514 () Bool)

(declare-fun call!19519 () Bool)

(declare-fun lt!96147 () ListLongMap!2459)

(assert (=> bm!19514 (= call!19519 (contains!1364 lt!96147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193201 () Bool)

(declare-fun e!127129 () Bool)

(assert (=> b!193201 (= e!127129 (not call!19519))))

(declare-fun b!193202 () Bool)

(declare-fun e!127126 () Bool)

(declare-fun apply!185 (ListLongMap!2459 (_ BitVec 64)) V!5611)

(assert (=> b!193202 (= e!127126 (= (apply!185 lt!96147 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3780 thiss!1248)))))

(declare-fun bm!19515 () Bool)

(declare-fun call!19517 () ListLongMap!2459)

(assert (=> bm!19515 (= call!19517 call!19516)))

(declare-fun bm!19516 () Bool)

(declare-fun call!19518 () ListLongMap!2459)

(assert (=> bm!19516 (= call!19518 call!19517)))

(declare-fun b!193203 () Bool)

(declare-fun e!127124 () Bool)

(assert (=> b!193203 (= e!127124 (= (apply!185 lt!96147 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3780 thiss!1248)))))

(declare-fun b!193204 () Bool)

(declare-fun e!127128 () Unit!5844)

(declare-fun Unit!5850 () Unit!5844)

(assert (=> b!193204 (= e!127128 Unit!5850)))

(declare-fun b!193205 () Bool)

(declare-fun e!127122 () Bool)

(assert (=> b!193205 (= e!127122 (validKeyInArray!0 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19517 () Bool)

(declare-fun call!19521 () Bool)

(assert (=> bm!19517 (= call!19521 (contains!1364 lt!96147 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193206 () Bool)

(declare-fun lt!96139 () Unit!5844)

(assert (=> b!193206 (= e!127128 lt!96139)))

(declare-fun lt!96138 () ListLongMap!2459)

(assert (=> b!193206 (= lt!96138 (getCurrentListMapNoExtraKeys!218 (_keys!5927 thiss!1248) (array!8194 (store (arr!3858 (_values!3922 thiss!1248)) (index!4911 lt!96041) (ValueCellFull!1893 v!309)) (size!4182 (_values!3922 thiss!1248))) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)))))

(declare-fun lt!96137 () (_ BitVec 64))

(assert (=> b!193206 (= lt!96137 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96152 () (_ BitVec 64))

(assert (=> b!193206 (= lt!96152 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96154 () Unit!5844)

(declare-fun addStillContains!161 (ListLongMap!2459 (_ BitVec 64) V!5611 (_ BitVec 64)) Unit!5844)

(assert (=> b!193206 (= lt!96154 (addStillContains!161 lt!96138 lt!96137 (zeroValue!3780 thiss!1248) lt!96152))))

(assert (=> b!193206 (contains!1364 (+!313 lt!96138 (tuple2!3543 lt!96137 (zeroValue!3780 thiss!1248))) lt!96152)))

(declare-fun lt!96143 () Unit!5844)

(assert (=> b!193206 (= lt!96143 lt!96154)))

(declare-fun lt!96142 () ListLongMap!2459)

(assert (=> b!193206 (= lt!96142 (getCurrentListMapNoExtraKeys!218 (_keys!5927 thiss!1248) (array!8194 (store (arr!3858 (_values!3922 thiss!1248)) (index!4911 lt!96041) (ValueCellFull!1893 v!309)) (size!4182 (_values!3922 thiss!1248))) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)))))

(declare-fun lt!96153 () (_ BitVec 64))

(assert (=> b!193206 (= lt!96153 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96135 () (_ BitVec 64))

(assert (=> b!193206 (= lt!96135 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96145 () Unit!5844)

(declare-fun addApplyDifferent!161 (ListLongMap!2459 (_ BitVec 64) V!5611 (_ BitVec 64)) Unit!5844)

(assert (=> b!193206 (= lt!96145 (addApplyDifferent!161 lt!96142 lt!96153 (minValue!3780 thiss!1248) lt!96135))))

(assert (=> b!193206 (= (apply!185 (+!313 lt!96142 (tuple2!3543 lt!96153 (minValue!3780 thiss!1248))) lt!96135) (apply!185 lt!96142 lt!96135))))

(declare-fun lt!96146 () Unit!5844)

(assert (=> b!193206 (= lt!96146 lt!96145)))

(declare-fun lt!96136 () ListLongMap!2459)

(assert (=> b!193206 (= lt!96136 (getCurrentListMapNoExtraKeys!218 (_keys!5927 thiss!1248) (array!8194 (store (arr!3858 (_values!3922 thiss!1248)) (index!4911 lt!96041) (ValueCellFull!1893 v!309)) (size!4182 (_values!3922 thiss!1248))) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)))))

(declare-fun lt!96155 () (_ BitVec 64))

(assert (=> b!193206 (= lt!96155 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96144 () (_ BitVec 64))

(assert (=> b!193206 (= lt!96144 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96148 () Unit!5844)

(assert (=> b!193206 (= lt!96148 (addApplyDifferent!161 lt!96136 lt!96155 (zeroValue!3780 thiss!1248) lt!96144))))

(assert (=> b!193206 (= (apply!185 (+!313 lt!96136 (tuple2!3543 lt!96155 (zeroValue!3780 thiss!1248))) lt!96144) (apply!185 lt!96136 lt!96144))))

(declare-fun lt!96151 () Unit!5844)

(assert (=> b!193206 (= lt!96151 lt!96148)))

(declare-fun lt!96141 () ListLongMap!2459)

(assert (=> b!193206 (= lt!96141 (getCurrentListMapNoExtraKeys!218 (_keys!5927 thiss!1248) (array!8194 (store (arr!3858 (_values!3922 thiss!1248)) (index!4911 lt!96041) (ValueCellFull!1893 v!309)) (size!4182 (_values!3922 thiss!1248))) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)))))

(declare-fun lt!96156 () (_ BitVec 64))

(assert (=> b!193206 (= lt!96156 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96140 () (_ BitVec 64))

(assert (=> b!193206 (= lt!96140 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193206 (= lt!96139 (addApplyDifferent!161 lt!96141 lt!96156 (minValue!3780 thiss!1248) lt!96140))))

(assert (=> b!193206 (= (apply!185 (+!313 lt!96141 (tuple2!3543 lt!96156 (minValue!3780 thiss!1248))) lt!96140) (apply!185 lt!96141 lt!96140))))

(declare-fun b!193207 () Bool)

(declare-fun e!127117 () Bool)

(declare-fun get!2228 (ValueCell!1893 V!5611) V!5611)

(declare-fun dynLambda!528 (Int (_ BitVec 64)) V!5611)

(assert (=> b!193207 (= e!127117 (= (apply!185 lt!96147 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000)) (get!2228 (select (arr!3858 (array!8194 (store (arr!3858 (_values!3922 thiss!1248)) (index!4911 lt!96041) (ValueCellFull!1893 v!309)) (size!4182 (_values!3922 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!528 (defaultEntry!3939 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193207 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4182 (array!8194 (store (arr!3858 (_values!3922 thiss!1248)) (index!4911 lt!96041) (ValueCellFull!1893 v!309)) (size!4182 (_values!3922 thiss!1248))))))))

(assert (=> b!193207 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))))))

(declare-fun b!193208 () Bool)

(declare-fun e!127121 () Bool)

(assert (=> b!193208 (= e!127121 (validKeyInArray!0 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193209 () Bool)

(declare-fun e!127118 () Bool)

(assert (=> b!193209 (= e!127118 e!127124)))

(declare-fun res!91297 () Bool)

(assert (=> b!193209 (= res!91297 call!19521)))

(assert (=> b!193209 (=> (not res!91297) (not e!127124))))

(declare-fun b!193210 () Bool)

(declare-fun c!34851 () Bool)

(assert (=> b!193210 (= c!34851 (and (not (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127120 () ListLongMap!2459)

(assert (=> b!193210 (= e!127119 e!127120)))

(declare-fun b!193211 () Bool)

(declare-fun res!91295 () Bool)

(declare-fun e!127127 () Bool)

(assert (=> b!193211 (=> (not res!91295) (not e!127127))))

(declare-fun e!127123 () Bool)

(assert (=> b!193211 (= res!91295 e!127123)))

(declare-fun res!91294 () Bool)

(assert (=> b!193211 (=> res!91294 e!127123)))

(assert (=> b!193211 (= res!91294 (not e!127121))))

(declare-fun res!91292 () Bool)

(assert (=> b!193211 (=> (not res!91292) (not e!127121))))

(assert (=> b!193211 (= res!91292 (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))))))

(declare-fun b!193212 () Bool)

(assert (=> b!193212 (= e!127127 e!127118)))

(declare-fun c!34852 () Bool)

(assert (=> b!193212 (= c!34852 (not (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19518 () Bool)

(declare-fun call!19522 () ListLongMap!2459)

(assert (=> bm!19518 (= call!19522 call!19520)))

(declare-fun b!193213 () Bool)

(assert (=> b!193213 (= e!127129 e!127126)))

(declare-fun res!91289 () Bool)

(assert (=> b!193213 (= res!91289 call!19519)))

(assert (=> b!193213 (=> (not res!91289) (not e!127126))))

(declare-fun b!193214 () Bool)

(declare-fun res!91291 () Bool)

(assert (=> b!193214 (=> (not res!91291) (not e!127127))))

(assert (=> b!193214 (= res!91291 e!127129)))

(declare-fun c!34849 () Bool)

(assert (=> b!193214 (= c!34849 (not (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193215 () Bool)

(assert (=> b!193215 (= e!127119 call!19522)))

(declare-fun b!193216 () Bool)

(assert (=> b!193216 (= e!127123 e!127117)))

(declare-fun res!91293 () Bool)

(assert (=> b!193216 (=> (not res!91293) (not e!127117))))

(assert (=> b!193216 (= res!91293 (contains!1364 lt!96147 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193216 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))))))

(declare-fun c!34848 () Bool)

(declare-fun bm!19519 () Bool)

(assert (=> bm!19519 (= call!19520 (+!313 (ite c!34848 call!19516 (ite c!34850 call!19517 call!19518)) (ite (or c!34848 c!34850) (tuple2!3543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3780 thiss!1248)) (tuple2!3543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3780 thiss!1248)))))))

(declare-fun b!193217 () Bool)

(assert (=> b!193217 (= e!127120 call!19522)))

(declare-fun d!56559 () Bool)

(assert (=> d!56559 e!127127))

(declare-fun res!91296 () Bool)

(assert (=> d!56559 (=> (not res!91296) (not e!127127))))

(assert (=> d!56559 (= res!91296 (or (bvsge #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))))))))

(declare-fun lt!96150 () ListLongMap!2459)

(assert (=> d!56559 (= lt!96147 lt!96150)))

(declare-fun lt!96149 () Unit!5844)

(assert (=> d!56559 (= lt!96149 e!127128)))

(declare-fun c!34853 () Bool)

(assert (=> d!56559 (= c!34853 e!127122)))

(declare-fun res!91290 () Bool)

(assert (=> d!56559 (=> (not res!91290) (not e!127122))))

(assert (=> d!56559 (= res!91290 (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))))))

(assert (=> d!56559 (= lt!96150 e!127125)))

(assert (=> d!56559 (= c!34848 (and (not (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56559 (validMask!0 (mask!9184 thiss!1248))))

(assert (=> d!56559 (= (getCurrentListMap!893 (_keys!5927 thiss!1248) (array!8194 (store (arr!3858 (_values!3922 thiss!1248)) (index!4911 lt!96041) (ValueCellFull!1893 v!309)) (size!4182 (_values!3922 thiss!1248))) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)) lt!96147)))

(declare-fun b!193218 () Bool)

(assert (=> b!193218 (= e!127120 call!19518)))

(declare-fun b!193219 () Bool)

(assert (=> b!193219 (= e!127118 (not call!19521))))

(assert (= (and d!56559 c!34848) b!193199))

(assert (= (and d!56559 (not c!34848)) b!193200))

(assert (= (and b!193200 c!34850) b!193215))

(assert (= (and b!193200 (not c!34850)) b!193210))

(assert (= (and b!193210 c!34851) b!193217))

(assert (= (and b!193210 (not c!34851)) b!193218))

(assert (= (or b!193217 b!193218) bm!19516))

(assert (= (or b!193215 bm!19516) bm!19515))

(assert (= (or b!193215 b!193217) bm!19518))

(assert (= (or b!193199 bm!19515) bm!19513))

(assert (= (or b!193199 bm!19518) bm!19519))

(assert (= (and d!56559 res!91290) b!193205))

(assert (= (and d!56559 c!34853) b!193206))

(assert (= (and d!56559 (not c!34853)) b!193204))

(assert (= (and d!56559 res!91296) b!193211))

(assert (= (and b!193211 res!91292) b!193208))

(assert (= (and b!193211 (not res!91294)) b!193216))

(assert (= (and b!193216 res!91293) b!193207))

(assert (= (and b!193211 res!91295) b!193214))

(assert (= (and b!193214 c!34849) b!193213))

(assert (= (and b!193214 (not c!34849)) b!193201))

(assert (= (and b!193213 res!91289) b!193202))

(assert (= (or b!193213 b!193201) bm!19514))

(assert (= (and b!193214 res!91291) b!193212))

(assert (= (and b!193212 c!34852) b!193209))

(assert (= (and b!193212 (not c!34852)) b!193219))

(assert (= (and b!193209 res!91297) b!193203))

(assert (= (or b!193209 b!193219) bm!19517))

(declare-fun b_lambda!7455 () Bool)

(assert (=> (not b_lambda!7455) (not b!193207)))

(declare-fun t!7358 () Bool)

(declare-fun tb!2881 () Bool)

(assert (=> (and b!193027 (= (defaultEntry!3939 thiss!1248) (defaultEntry!3939 thiss!1248)) t!7358) tb!2881))

(declare-fun result!4921 () Bool)

(assert (=> tb!2881 (= result!4921 tp_is_empty!4473)))

(assert (=> b!193207 t!7358))

(declare-fun b_and!11407 () Bool)

(assert (= b_and!11403 (and (=> t!7358 result!4921) b_and!11407)))

(declare-fun m!219967 () Bool)

(assert (=> bm!19514 m!219967))

(declare-fun m!219969 () Bool)

(assert (=> b!193199 m!219969))

(assert (=> d!56559 m!219873))

(assert (=> b!193216 m!219917))

(assert (=> b!193216 m!219917))

(declare-fun m!219971 () Bool)

(assert (=> b!193216 m!219971))

(declare-fun m!219973 () Bool)

(assert (=> bm!19519 m!219973))

(declare-fun m!219975 () Bool)

(assert (=> bm!19513 m!219975))

(declare-fun m!219977 () Bool)

(assert (=> bm!19517 m!219977))

(declare-fun m!219979 () Bool)

(assert (=> b!193206 m!219979))

(declare-fun m!219981 () Bool)

(assert (=> b!193206 m!219981))

(assert (=> b!193206 m!219917))

(declare-fun m!219983 () Bool)

(assert (=> b!193206 m!219983))

(assert (=> b!193206 m!219983))

(declare-fun m!219985 () Bool)

(assert (=> b!193206 m!219985))

(declare-fun m!219987 () Bool)

(assert (=> b!193206 m!219987))

(declare-fun m!219989 () Bool)

(assert (=> b!193206 m!219989))

(declare-fun m!219991 () Bool)

(assert (=> b!193206 m!219991))

(assert (=> b!193206 m!219979))

(declare-fun m!219993 () Bool)

(assert (=> b!193206 m!219993))

(assert (=> b!193206 m!219981))

(declare-fun m!219995 () Bool)

(assert (=> b!193206 m!219995))

(declare-fun m!219997 () Bool)

(assert (=> b!193206 m!219997))

(declare-fun m!219999 () Bool)

(assert (=> b!193206 m!219999))

(declare-fun m!220001 () Bool)

(assert (=> b!193206 m!220001))

(assert (=> b!193206 m!219975))

(assert (=> b!193206 m!219999))

(declare-fun m!220003 () Bool)

(assert (=> b!193206 m!220003))

(declare-fun m!220005 () Bool)

(assert (=> b!193206 m!220005))

(declare-fun m!220007 () Bool)

(assert (=> b!193206 m!220007))

(declare-fun m!220009 () Bool)

(assert (=> b!193203 m!220009))

(declare-fun m!220011 () Bool)

(assert (=> b!193207 m!220011))

(declare-fun m!220013 () Bool)

(assert (=> b!193207 m!220013))

(declare-fun m!220015 () Bool)

(assert (=> b!193207 m!220015))

(assert (=> b!193207 m!220013))

(assert (=> b!193207 m!219917))

(declare-fun m!220017 () Bool)

(assert (=> b!193207 m!220017))

(assert (=> b!193207 m!219917))

(assert (=> b!193207 m!220011))

(declare-fun m!220019 () Bool)

(assert (=> b!193202 m!220019))

(assert (=> b!193205 m!219917))

(assert (=> b!193205 m!219917))

(assert (=> b!193205 m!219919))

(assert (=> b!193208 m!219917))

(assert (=> b!193208 m!219917))

(assert (=> b!193208 m!219919))

(assert (=> b!193028 d!56559))

(declare-fun d!56561 () Bool)

(declare-fun e!127132 () Bool)

(assert (=> d!56561 e!127132))

(declare-fun res!91300 () Bool)

(assert (=> d!56561 (=> (not res!91300) (not e!127132))))

(assert (=> d!56561 (= res!91300 (and (bvsge (index!4911 lt!96041) #b00000000000000000000000000000000) (bvslt (index!4911 lt!96041) (size!4182 (_values!3922 thiss!1248)))))))

(declare-fun lt!96159 () Unit!5844)

(declare-fun choose!1056 (array!8191 array!8193 (_ BitVec 32) (_ BitVec 32) V!5611 V!5611 (_ BitVec 32) (_ BitVec 64) V!5611 Int) Unit!5844)

(assert (=> d!56561 (= lt!96159 (choose!1056 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) (index!4911 lt!96041) key!828 v!309 (defaultEntry!3939 thiss!1248)))))

(assert (=> d!56561 (validMask!0 (mask!9184 thiss!1248))))

(assert (=> d!56561 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!114 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) (index!4911 lt!96041) key!828 v!309 (defaultEntry!3939 thiss!1248)) lt!96159)))

(declare-fun b!193224 () Bool)

(assert (=> b!193224 (= e!127132 (= (+!313 (getCurrentListMap!893 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)) (tuple2!3543 key!828 v!309)) (getCurrentListMap!893 (_keys!5927 thiss!1248) (array!8194 (store (arr!3858 (_values!3922 thiss!1248)) (index!4911 lt!96041) (ValueCellFull!1893 v!309)) (size!4182 (_values!3922 thiss!1248))) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248))))))

(assert (= (and d!56561 res!91300) b!193224))

(declare-fun m!220021 () Bool)

(assert (=> d!56561 m!220021))

(assert (=> d!56561 m!219873))

(assert (=> b!193224 m!219867))

(assert (=> b!193224 m!219867))

(declare-fun m!220023 () Bool)

(assert (=> b!193224 m!220023))

(assert (=> b!193224 m!219877))

(assert (=> b!193224 m!219875))

(assert (=> b!193028 d!56561))

(declare-fun d!56563 () Bool)

(assert (=> d!56563 (= (validMask!0 (mask!9184 thiss!1248)) (and (or (= (mask!9184 thiss!1248) #b00000000000000000000000000000111) (= (mask!9184 thiss!1248) #b00000000000000000000000000001111) (= (mask!9184 thiss!1248) #b00000000000000000000000000011111) (= (mask!9184 thiss!1248) #b00000000000000000000000000111111) (= (mask!9184 thiss!1248) #b00000000000000000000000001111111) (= (mask!9184 thiss!1248) #b00000000000000000000000011111111) (= (mask!9184 thiss!1248) #b00000000000000000000000111111111) (= (mask!9184 thiss!1248) #b00000000000000000000001111111111) (= (mask!9184 thiss!1248) #b00000000000000000000011111111111) (= (mask!9184 thiss!1248) #b00000000000000000000111111111111) (= (mask!9184 thiss!1248) #b00000000000000000001111111111111) (= (mask!9184 thiss!1248) #b00000000000000000011111111111111) (= (mask!9184 thiss!1248) #b00000000000000000111111111111111) (= (mask!9184 thiss!1248) #b00000000000000001111111111111111) (= (mask!9184 thiss!1248) #b00000000000000011111111111111111) (= (mask!9184 thiss!1248) #b00000000000000111111111111111111) (= (mask!9184 thiss!1248) #b00000000000001111111111111111111) (= (mask!9184 thiss!1248) #b00000000000011111111111111111111) (= (mask!9184 thiss!1248) #b00000000000111111111111111111111) (= (mask!9184 thiss!1248) #b00000000001111111111111111111111) (= (mask!9184 thiss!1248) #b00000000011111111111111111111111) (= (mask!9184 thiss!1248) #b00000000111111111111111111111111) (= (mask!9184 thiss!1248) #b00000001111111111111111111111111) (= (mask!9184 thiss!1248) #b00000011111111111111111111111111) (= (mask!9184 thiss!1248) #b00000111111111111111111111111111) (= (mask!9184 thiss!1248) #b00001111111111111111111111111111) (= (mask!9184 thiss!1248) #b00011111111111111111111111111111) (= (mask!9184 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9184 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!193028 d!56563))

(declare-fun d!56565 () Bool)

(declare-fun e!127135 () Bool)

(assert (=> d!56565 e!127135))

(declare-fun res!91306 () Bool)

(assert (=> d!56565 (=> (not res!91306) (not e!127135))))

(declare-fun lt!96170 () ListLongMap!2459)

(assert (=> d!56565 (= res!91306 (contains!1364 lt!96170 (_1!1782 (tuple2!3543 key!828 v!309))))))

(declare-fun lt!96171 () List!2433)

(assert (=> d!56565 (= lt!96170 (ListLongMap!2460 lt!96171))))

(declare-fun lt!96169 () Unit!5844)

(declare-fun lt!96168 () Unit!5844)

(assert (=> d!56565 (= lt!96169 lt!96168)))

(declare-datatypes ((Option!248 0))(
  ( (Some!247 (v!4238 V!5611)) (None!246) )
))
(declare-fun getValueByKey!242 (List!2433 (_ BitVec 64)) Option!248)

(assert (=> d!56565 (= (getValueByKey!242 lt!96171 (_1!1782 (tuple2!3543 key!828 v!309))) (Some!247 (_2!1782 (tuple2!3543 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!129 (List!2433 (_ BitVec 64) V!5611) Unit!5844)

(assert (=> d!56565 (= lt!96168 (lemmaContainsTupThenGetReturnValue!129 lt!96171 (_1!1782 (tuple2!3543 key!828 v!309)) (_2!1782 (tuple2!3543 key!828 v!309))))))

(declare-fun insertStrictlySorted!132 (List!2433 (_ BitVec 64) V!5611) List!2433)

(assert (=> d!56565 (= lt!96171 (insertStrictlySorted!132 (toList!1245 lt!96037) (_1!1782 (tuple2!3543 key!828 v!309)) (_2!1782 (tuple2!3543 key!828 v!309))))))

(assert (=> d!56565 (= (+!313 lt!96037 (tuple2!3543 key!828 v!309)) lt!96170)))

(declare-fun b!193229 () Bool)

(declare-fun res!91305 () Bool)

(assert (=> b!193229 (=> (not res!91305) (not e!127135))))

(assert (=> b!193229 (= res!91305 (= (getValueByKey!242 (toList!1245 lt!96170) (_1!1782 (tuple2!3543 key!828 v!309))) (Some!247 (_2!1782 (tuple2!3543 key!828 v!309)))))))

(declare-fun b!193230 () Bool)

(declare-fun contains!1367 (List!2433 tuple2!3542) Bool)

(assert (=> b!193230 (= e!127135 (contains!1367 (toList!1245 lt!96170) (tuple2!3543 key!828 v!309)))))

(assert (= (and d!56565 res!91306) b!193229))

(assert (= (and b!193229 res!91305) b!193230))

(declare-fun m!220025 () Bool)

(assert (=> d!56565 m!220025))

(declare-fun m!220027 () Bool)

(assert (=> d!56565 m!220027))

(declare-fun m!220029 () Bool)

(assert (=> d!56565 m!220029))

(declare-fun m!220031 () Bool)

(assert (=> d!56565 m!220031))

(declare-fun m!220033 () Bool)

(assert (=> b!193229 m!220033))

(declare-fun m!220035 () Bool)

(assert (=> b!193230 m!220035))

(assert (=> b!193028 d!56565))

(declare-fun d!56567 () Bool)

(declare-fun e!127141 () Bool)

(assert (=> d!56567 e!127141))

(declare-fun res!91309 () Bool)

(assert (=> d!56567 (=> res!91309 e!127141)))

(declare-fun lt!96183 () Bool)

(assert (=> d!56567 (= res!91309 (not lt!96183))))

(declare-fun lt!96182 () Bool)

(assert (=> d!56567 (= lt!96183 lt!96182)))

(declare-fun lt!96180 () Unit!5844)

(declare-fun e!127140 () Unit!5844)

(assert (=> d!56567 (= lt!96180 e!127140)))

(declare-fun c!34856 () Bool)

(assert (=> d!56567 (= c!34856 lt!96182)))

(declare-fun containsKey!246 (List!2433 (_ BitVec 64)) Bool)

(assert (=> d!56567 (= lt!96182 (containsKey!246 (toList!1245 lt!96037) key!828))))

(assert (=> d!56567 (= (contains!1364 lt!96037 key!828) lt!96183)))

(declare-fun b!193237 () Bool)

(declare-fun lt!96181 () Unit!5844)

(assert (=> b!193237 (= e!127140 lt!96181)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!194 (List!2433 (_ BitVec 64)) Unit!5844)

(assert (=> b!193237 (= lt!96181 (lemmaContainsKeyImpliesGetValueByKeyDefined!194 (toList!1245 lt!96037) key!828))))

(declare-fun isDefined!195 (Option!248) Bool)

(assert (=> b!193237 (isDefined!195 (getValueByKey!242 (toList!1245 lt!96037) key!828))))

(declare-fun b!193238 () Bool)

(declare-fun Unit!5851 () Unit!5844)

(assert (=> b!193238 (= e!127140 Unit!5851)))

(declare-fun b!193239 () Bool)

(assert (=> b!193239 (= e!127141 (isDefined!195 (getValueByKey!242 (toList!1245 lt!96037) key!828)))))

(assert (= (and d!56567 c!34856) b!193237))

(assert (= (and d!56567 (not c!34856)) b!193238))

(assert (= (and d!56567 (not res!91309)) b!193239))

(declare-fun m!220037 () Bool)

(assert (=> d!56567 m!220037))

(declare-fun m!220039 () Bool)

(assert (=> b!193237 m!220039))

(declare-fun m!220041 () Bool)

(assert (=> b!193237 m!220041))

(assert (=> b!193237 m!220041))

(declare-fun m!220043 () Bool)

(assert (=> b!193237 m!220043))

(assert (=> b!193239 m!220041))

(assert (=> b!193239 m!220041))

(assert (=> b!193239 m!220043))

(assert (=> b!193028 d!56567))

(declare-fun b!193240 () Bool)

(declare-fun e!127150 () ListLongMap!2459)

(declare-fun call!19527 () ListLongMap!2459)

(assert (=> b!193240 (= e!127150 (+!313 call!19527 (tuple2!3543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3780 thiss!1248))))))

(declare-fun b!193241 () Bool)

(declare-fun e!127144 () ListLongMap!2459)

(assert (=> b!193241 (= e!127150 e!127144)))

(declare-fun c!34859 () Bool)

(assert (=> b!193241 (= c!34859 (and (not (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19520 () Bool)

(declare-fun call!19523 () ListLongMap!2459)

(assert (=> bm!19520 (= call!19523 (getCurrentListMapNoExtraKeys!218 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)))))

(declare-fun bm!19521 () Bool)

(declare-fun call!19526 () Bool)

(declare-fun lt!96196 () ListLongMap!2459)

(assert (=> bm!19521 (= call!19526 (contains!1364 lt!96196 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193242 () Bool)

(declare-fun e!127154 () Bool)

(assert (=> b!193242 (= e!127154 (not call!19526))))

(declare-fun b!193243 () Bool)

(declare-fun e!127151 () Bool)

(assert (=> b!193243 (= e!127151 (= (apply!185 lt!96196 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3780 thiss!1248)))))

(declare-fun bm!19522 () Bool)

(declare-fun call!19524 () ListLongMap!2459)

(assert (=> bm!19522 (= call!19524 call!19523)))

(declare-fun bm!19523 () Bool)

(declare-fun call!19525 () ListLongMap!2459)

(assert (=> bm!19523 (= call!19525 call!19524)))

(declare-fun b!193244 () Bool)

(declare-fun e!127149 () Bool)

(assert (=> b!193244 (= e!127149 (= (apply!185 lt!96196 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3780 thiss!1248)))))

(declare-fun b!193245 () Bool)

(declare-fun e!127153 () Unit!5844)

(declare-fun Unit!5852 () Unit!5844)

(assert (=> b!193245 (= e!127153 Unit!5852)))

(declare-fun b!193246 () Bool)

(declare-fun e!127147 () Bool)

(assert (=> b!193246 (= e!127147 (validKeyInArray!0 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19524 () Bool)

(declare-fun call!19528 () Bool)

(assert (=> bm!19524 (= call!19528 (contains!1364 lt!96196 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193247 () Bool)

(declare-fun lt!96188 () Unit!5844)

(assert (=> b!193247 (= e!127153 lt!96188)))

(declare-fun lt!96187 () ListLongMap!2459)

(assert (=> b!193247 (= lt!96187 (getCurrentListMapNoExtraKeys!218 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)))))

(declare-fun lt!96186 () (_ BitVec 64))

(assert (=> b!193247 (= lt!96186 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96201 () (_ BitVec 64))

(assert (=> b!193247 (= lt!96201 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96203 () Unit!5844)

(assert (=> b!193247 (= lt!96203 (addStillContains!161 lt!96187 lt!96186 (zeroValue!3780 thiss!1248) lt!96201))))

(assert (=> b!193247 (contains!1364 (+!313 lt!96187 (tuple2!3543 lt!96186 (zeroValue!3780 thiss!1248))) lt!96201)))

(declare-fun lt!96192 () Unit!5844)

(assert (=> b!193247 (= lt!96192 lt!96203)))

(declare-fun lt!96191 () ListLongMap!2459)

(assert (=> b!193247 (= lt!96191 (getCurrentListMapNoExtraKeys!218 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)))))

(declare-fun lt!96202 () (_ BitVec 64))

(assert (=> b!193247 (= lt!96202 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96184 () (_ BitVec 64))

(assert (=> b!193247 (= lt!96184 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96194 () Unit!5844)

(assert (=> b!193247 (= lt!96194 (addApplyDifferent!161 lt!96191 lt!96202 (minValue!3780 thiss!1248) lt!96184))))

(assert (=> b!193247 (= (apply!185 (+!313 lt!96191 (tuple2!3543 lt!96202 (minValue!3780 thiss!1248))) lt!96184) (apply!185 lt!96191 lt!96184))))

(declare-fun lt!96195 () Unit!5844)

(assert (=> b!193247 (= lt!96195 lt!96194)))

(declare-fun lt!96185 () ListLongMap!2459)

(assert (=> b!193247 (= lt!96185 (getCurrentListMapNoExtraKeys!218 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)))))

(declare-fun lt!96204 () (_ BitVec 64))

(assert (=> b!193247 (= lt!96204 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96193 () (_ BitVec 64))

(assert (=> b!193247 (= lt!96193 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96197 () Unit!5844)

(assert (=> b!193247 (= lt!96197 (addApplyDifferent!161 lt!96185 lt!96204 (zeroValue!3780 thiss!1248) lt!96193))))

(assert (=> b!193247 (= (apply!185 (+!313 lt!96185 (tuple2!3543 lt!96204 (zeroValue!3780 thiss!1248))) lt!96193) (apply!185 lt!96185 lt!96193))))

(declare-fun lt!96200 () Unit!5844)

(assert (=> b!193247 (= lt!96200 lt!96197)))

(declare-fun lt!96190 () ListLongMap!2459)

(assert (=> b!193247 (= lt!96190 (getCurrentListMapNoExtraKeys!218 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)))))

(declare-fun lt!96205 () (_ BitVec 64))

(assert (=> b!193247 (= lt!96205 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96189 () (_ BitVec 64))

(assert (=> b!193247 (= lt!96189 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193247 (= lt!96188 (addApplyDifferent!161 lt!96190 lt!96205 (minValue!3780 thiss!1248) lt!96189))))

(assert (=> b!193247 (= (apply!185 (+!313 lt!96190 (tuple2!3543 lt!96205 (minValue!3780 thiss!1248))) lt!96189) (apply!185 lt!96190 lt!96189))))

(declare-fun b!193248 () Bool)

(declare-fun e!127142 () Bool)

(assert (=> b!193248 (= e!127142 (= (apply!185 lt!96196 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000)) (get!2228 (select (arr!3858 (_values!3922 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!528 (defaultEntry!3939 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193248 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4182 (_values!3922 thiss!1248))))))

(assert (=> b!193248 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))))))

(declare-fun b!193249 () Bool)

(declare-fun e!127146 () Bool)

(assert (=> b!193249 (= e!127146 (validKeyInArray!0 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193250 () Bool)

(declare-fun e!127143 () Bool)

(assert (=> b!193250 (= e!127143 e!127149)))

(declare-fun res!91318 () Bool)

(assert (=> b!193250 (= res!91318 call!19528)))

(assert (=> b!193250 (=> (not res!91318) (not e!127149))))

(declare-fun b!193251 () Bool)

(declare-fun c!34860 () Bool)

(assert (=> b!193251 (= c!34860 (and (not (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127145 () ListLongMap!2459)

(assert (=> b!193251 (= e!127144 e!127145)))

(declare-fun b!193252 () Bool)

(declare-fun res!91316 () Bool)

(declare-fun e!127152 () Bool)

(assert (=> b!193252 (=> (not res!91316) (not e!127152))))

(declare-fun e!127148 () Bool)

(assert (=> b!193252 (= res!91316 e!127148)))

(declare-fun res!91315 () Bool)

(assert (=> b!193252 (=> res!91315 e!127148)))

(assert (=> b!193252 (= res!91315 (not e!127146))))

(declare-fun res!91313 () Bool)

(assert (=> b!193252 (=> (not res!91313) (not e!127146))))

(assert (=> b!193252 (= res!91313 (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))))))

(declare-fun b!193253 () Bool)

(assert (=> b!193253 (= e!127152 e!127143)))

(declare-fun c!34861 () Bool)

(assert (=> b!193253 (= c!34861 (not (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19525 () Bool)

(declare-fun call!19529 () ListLongMap!2459)

(assert (=> bm!19525 (= call!19529 call!19527)))

(declare-fun b!193254 () Bool)

(assert (=> b!193254 (= e!127154 e!127151)))

(declare-fun res!91310 () Bool)

(assert (=> b!193254 (= res!91310 call!19526)))

(assert (=> b!193254 (=> (not res!91310) (not e!127151))))

(declare-fun b!193255 () Bool)

(declare-fun res!91312 () Bool)

(assert (=> b!193255 (=> (not res!91312) (not e!127152))))

(assert (=> b!193255 (= res!91312 e!127154)))

(declare-fun c!34858 () Bool)

(assert (=> b!193255 (= c!34858 (not (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193256 () Bool)

(assert (=> b!193256 (= e!127144 call!19529)))

(declare-fun b!193257 () Bool)

(assert (=> b!193257 (= e!127148 e!127142)))

(declare-fun res!91314 () Bool)

(assert (=> b!193257 (=> (not res!91314) (not e!127142))))

(assert (=> b!193257 (= res!91314 (contains!1364 lt!96196 (select (arr!3857 (_keys!5927 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))))))

(declare-fun bm!19526 () Bool)

(declare-fun c!34857 () Bool)

(assert (=> bm!19526 (= call!19527 (+!313 (ite c!34857 call!19523 (ite c!34859 call!19524 call!19525)) (ite (or c!34857 c!34859) (tuple2!3543 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3780 thiss!1248)) (tuple2!3543 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3780 thiss!1248)))))))

(declare-fun b!193258 () Bool)

(assert (=> b!193258 (= e!127145 call!19529)))

(declare-fun d!56569 () Bool)

(assert (=> d!56569 e!127152))

(declare-fun res!91317 () Bool)

(assert (=> d!56569 (=> (not res!91317) (not e!127152))))

(assert (=> d!56569 (= res!91317 (or (bvsge #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))))))))

(declare-fun lt!96199 () ListLongMap!2459)

(assert (=> d!56569 (= lt!96196 lt!96199)))

(declare-fun lt!96198 () Unit!5844)

(assert (=> d!56569 (= lt!96198 e!127153)))

(declare-fun c!34862 () Bool)

(assert (=> d!56569 (= c!34862 e!127147)))

(declare-fun res!91311 () Bool)

(assert (=> d!56569 (=> (not res!91311) (not e!127147))))

(assert (=> d!56569 (= res!91311 (bvslt #b00000000000000000000000000000000 (size!4181 (_keys!5927 thiss!1248))))))

(assert (=> d!56569 (= lt!96199 e!127150)))

(assert (=> d!56569 (= c!34857 (and (not (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3676 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56569 (validMask!0 (mask!9184 thiss!1248))))

(assert (=> d!56569 (= (getCurrentListMap!893 (_keys!5927 thiss!1248) (_values!3922 thiss!1248) (mask!9184 thiss!1248) (extraKeys!3676 thiss!1248) (zeroValue!3780 thiss!1248) (minValue!3780 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3939 thiss!1248)) lt!96196)))

(declare-fun b!193259 () Bool)

(assert (=> b!193259 (= e!127145 call!19525)))

(declare-fun b!193260 () Bool)

(assert (=> b!193260 (= e!127143 (not call!19528))))

(assert (= (and d!56569 c!34857) b!193240))

(assert (= (and d!56569 (not c!34857)) b!193241))

(assert (= (and b!193241 c!34859) b!193256))

(assert (= (and b!193241 (not c!34859)) b!193251))

(assert (= (and b!193251 c!34860) b!193258))

(assert (= (and b!193251 (not c!34860)) b!193259))

(assert (= (or b!193258 b!193259) bm!19523))

(assert (= (or b!193256 bm!19523) bm!19522))

(assert (= (or b!193256 b!193258) bm!19525))

(assert (= (or b!193240 bm!19522) bm!19520))

(assert (= (or b!193240 bm!19525) bm!19526))

(assert (= (and d!56569 res!91311) b!193246))

(assert (= (and d!56569 c!34862) b!193247))

(assert (= (and d!56569 (not c!34862)) b!193245))

(assert (= (and d!56569 res!91317) b!193252))

(assert (= (and b!193252 res!91313) b!193249))

(assert (= (and b!193252 (not res!91315)) b!193257))

(assert (= (and b!193257 res!91314) b!193248))

(assert (= (and b!193252 res!91316) b!193255))

(assert (= (and b!193255 c!34858) b!193254))

(assert (= (and b!193255 (not c!34858)) b!193242))

(assert (= (and b!193254 res!91310) b!193243))

(assert (= (or b!193254 b!193242) bm!19521))

(assert (= (and b!193255 res!91312) b!193253))

(assert (= (and b!193253 c!34861) b!193250))

(assert (= (and b!193253 (not c!34861)) b!193260))

(assert (= (and b!193250 res!91318) b!193244))

(assert (= (or b!193250 b!193260) bm!19524))

(declare-fun b_lambda!7457 () Bool)

(assert (=> (not b_lambda!7457) (not b!193248)))

(assert (=> b!193248 t!7358))

(declare-fun b_and!11409 () Bool)

(assert (= b_and!11407 (and (=> t!7358 result!4921) b_and!11409)))

(declare-fun m!220045 () Bool)

(assert (=> bm!19521 m!220045))

(declare-fun m!220047 () Bool)

(assert (=> b!193240 m!220047))

(assert (=> d!56569 m!219873))

(assert (=> b!193257 m!219917))

(assert (=> b!193257 m!219917))

(declare-fun m!220049 () Bool)

(assert (=> b!193257 m!220049))

(declare-fun m!220051 () Bool)

(assert (=> bm!19526 m!220051))

(declare-fun m!220053 () Bool)

(assert (=> bm!19520 m!220053))

(declare-fun m!220055 () Bool)

(assert (=> bm!19524 m!220055))

(declare-fun m!220057 () Bool)

(assert (=> b!193247 m!220057))

(declare-fun m!220059 () Bool)

(assert (=> b!193247 m!220059))

(assert (=> b!193247 m!219917))

(declare-fun m!220061 () Bool)

(assert (=> b!193247 m!220061))

(assert (=> b!193247 m!220061))

(declare-fun m!220063 () Bool)

(assert (=> b!193247 m!220063))

(declare-fun m!220065 () Bool)

(assert (=> b!193247 m!220065))

(declare-fun m!220067 () Bool)

(assert (=> b!193247 m!220067))

(declare-fun m!220069 () Bool)

(assert (=> b!193247 m!220069))

(assert (=> b!193247 m!220057))

(declare-fun m!220071 () Bool)

(assert (=> b!193247 m!220071))

(assert (=> b!193247 m!220059))

(declare-fun m!220073 () Bool)

(assert (=> b!193247 m!220073))

(declare-fun m!220075 () Bool)

(assert (=> b!193247 m!220075))

(declare-fun m!220077 () Bool)

(assert (=> b!193247 m!220077))

(declare-fun m!220079 () Bool)

(assert (=> b!193247 m!220079))

(assert (=> b!193247 m!220053))

(assert (=> b!193247 m!220077))

(declare-fun m!220081 () Bool)

(assert (=> b!193247 m!220081))

(declare-fun m!220083 () Bool)

(assert (=> b!193247 m!220083))

(declare-fun m!220085 () Bool)

(assert (=> b!193247 m!220085))

(declare-fun m!220087 () Bool)

(assert (=> b!193244 m!220087))

(declare-fun m!220089 () Bool)

(assert (=> b!193248 m!220089))

(assert (=> b!193248 m!220013))

(declare-fun m!220091 () Bool)

(assert (=> b!193248 m!220091))

(assert (=> b!193248 m!220013))

(assert (=> b!193248 m!219917))

(declare-fun m!220093 () Bool)

(assert (=> b!193248 m!220093))

(assert (=> b!193248 m!219917))

(assert (=> b!193248 m!220089))

(declare-fun m!220095 () Bool)

(assert (=> b!193243 m!220095))

(assert (=> b!193246 m!219917))

(assert (=> b!193246 m!219917))

(assert (=> b!193246 m!219919))

(assert (=> b!193249 m!219917))

(assert (=> b!193249 m!219917))

(assert (=> b!193249 m!219919))

(assert (=> b!193028 d!56569))

(declare-fun b!193268 () Bool)

(declare-fun e!127159 () Bool)

(assert (=> b!193268 (= e!127159 tp_is_empty!4473)))

(declare-fun mapIsEmpty!7739 () Bool)

(declare-fun mapRes!7739 () Bool)

(assert (=> mapIsEmpty!7739 mapRes!7739))

(declare-fun mapNonEmpty!7739 () Bool)

(declare-fun tp!16973 () Bool)

(declare-fun e!127160 () Bool)

(assert (=> mapNonEmpty!7739 (= mapRes!7739 (and tp!16973 e!127160))))

(declare-fun mapKey!7739 () (_ BitVec 32))

(declare-fun mapValue!7739 () ValueCell!1893)

(declare-fun mapRest!7739 () (Array (_ BitVec 32) ValueCell!1893))

(assert (=> mapNonEmpty!7739 (= mapRest!7733 (store mapRest!7739 mapKey!7739 mapValue!7739))))

(declare-fun b!193267 () Bool)

(assert (=> b!193267 (= e!127160 tp_is_empty!4473)))

(declare-fun condMapEmpty!7739 () Bool)

(declare-fun mapDefault!7739 () ValueCell!1893)

(assert (=> mapNonEmpty!7733 (= condMapEmpty!7739 (= mapRest!7733 ((as const (Array (_ BitVec 32) ValueCell!1893)) mapDefault!7739)))))

(assert (=> mapNonEmpty!7733 (= tp!16963 (and e!127159 mapRes!7739))))

(assert (= (and mapNonEmpty!7733 condMapEmpty!7739) mapIsEmpty!7739))

(assert (= (and mapNonEmpty!7733 (not condMapEmpty!7739)) mapNonEmpty!7739))

(assert (= (and mapNonEmpty!7739 ((_ is ValueCellFull!1893) mapValue!7739)) b!193267))

(assert (= (and mapNonEmpty!7733 ((_ is ValueCellFull!1893) mapDefault!7739)) b!193268))

(declare-fun m!220097 () Bool)

(assert (=> mapNonEmpty!7739 m!220097))

(declare-fun b_lambda!7459 () Bool)

(assert (= b_lambda!7455 (or (and b!193027 b_free!4701) b_lambda!7459)))

(declare-fun b_lambda!7461 () Bool)

(assert (= b_lambda!7457 (or (and b!193027 b_free!4701) b_lambda!7461)))

(check-sat tp_is_empty!4473 b_and!11409 (not b!193113) (not b!193156) (not b!193239) (not mapNonEmpty!7739) (not b_next!4701) (not b!193216) (not bm!19514) (not bm!19495) (not b!193154) (not bm!19513) (not b!193119) (not bm!19489) (not bm!19526) (not bm!19519) (not d!56567) (not b!193230) (not b!193112) (not bm!19494) (not b!193224) (not b!193244) (not b_lambda!7459) (not b!193087) (not b!193246) (not b!193203) (not b!193102) (not d!56545) (not d!56569) (not d!56559) (not d!56551) (not b_lambda!7461) (not b!193202) (not b!193248) (not d!56561) (not b!193199) (not b!193083) (not d!56565) (not bm!19517) (not b!193205) (not b!193249) (not b!193114) (not b!193206) (not d!56543) (not b!193229) (not bm!19520) (not d!56547) (not bm!19524) (not b!193208) (not bm!19498) (not b!193207) (not b!193243) (not bm!19521) (not b!193240) (not b!193237) (not b!193085) (not b!193257) (not b!193247))
(check-sat b_and!11409 (not b_next!4701))
