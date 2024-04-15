; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19730 () Bool)

(assert start!19730)

(declare-fun b!193160 () Bool)

(declare-fun b_free!4705 () Bool)

(declare-fun b_next!4705 () Bool)

(assert (=> b!193160 (= b_free!4705 (not b_next!4705))))

(declare-fun tp!16979 () Bool)

(declare-fun b_and!11385 () Bool)

(assert (=> b!193160 (= tp!16979 b_and!11385)))

(declare-fun b!193150 () Bool)

(declare-fun res!91247 () Bool)

(declare-fun e!127089 () Bool)

(assert (=> b!193150 (=> res!91247 e!127089)))

(declare-datatypes ((V!5617 0))(
  ( (V!5618 (val!2283 Int)) )
))
(declare-datatypes ((ValueCell!1895 0))(
  ( (ValueCellFull!1895 (v!4233 V!5617)) (EmptyCell!1895) )
))
(declare-datatypes ((array!8181 0))(
  ( (array!8182 (arr!3850 (Array (_ BitVec 32) (_ BitVec 64))) (size!4175 (_ BitVec 32))) )
))
(declare-datatypes ((array!8183 0))(
  ( (array!8184 (arr!3851 (Array (_ BitVec 32) ValueCell!1895)) (size!4176 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2698 0))(
  ( (LongMapFixedSize!2699 (defaultEntry!3945 Int) (mask!9195 (_ BitVec 32)) (extraKeys!3682 (_ BitVec 32)) (zeroValue!3786 V!5617) (minValue!3786 V!5617) (_size!1398 (_ BitVec 32)) (_keys!5934 array!8181) (_values!3928 array!8183) (_vacant!1398 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2698)

(assert (=> b!193150 (= res!91247 (or (not (= (size!4176 (_values!3928 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9195 thiss!1248)))) (not (= (size!4175 (_keys!5934 thiss!1248)) (size!4176 (_values!3928 thiss!1248)))) (bvslt (mask!9195 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3682 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3682 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!193151 () Bool)

(declare-fun e!127086 () Bool)

(declare-fun e!127088 () Bool)

(assert (=> b!193151 (= e!127086 e!127088)))

(declare-fun res!91246 () Bool)

(assert (=> b!193151 (=> (not res!91246) (not e!127088))))

(declare-datatypes ((SeekEntryResult!691 0))(
  ( (MissingZero!691 (index!4934 (_ BitVec 32))) (Found!691 (index!4935 (_ BitVec 32))) (Intermediate!691 (undefined!1503 Bool) (index!4936 (_ BitVec 32)) (x!20650 (_ BitVec 32))) (Undefined!691) (MissingVacant!691 (index!4937 (_ BitVec 32))) )
))
(declare-fun lt!96040 () SeekEntryResult!691)

(get-info :version)

(assert (=> b!193151 (= res!91246 (and (not ((_ is Undefined!691) lt!96040)) (not ((_ is MissingVacant!691) lt!96040)) (not ((_ is MissingZero!691) lt!96040)) ((_ is Found!691) lt!96040)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8181 (_ BitVec 32)) SeekEntryResult!691)

(assert (=> b!193151 (= lt!96040 (seekEntryOrOpen!0 key!828 (_keys!5934 thiss!1248) (mask!9195 thiss!1248)))))

(declare-fun b!193152 () Bool)

(declare-fun res!91241 () Bool)

(assert (=> b!193152 (=> (not res!91241) (not e!127086))))

(assert (=> b!193152 (= res!91241 (not (= key!828 (bvneg key!828))))))

(declare-fun b!193153 () Bool)

(declare-fun res!91244 () Bool)

(assert (=> b!193153 (=> res!91244 e!127089)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8181 (_ BitVec 32)) Bool)

(assert (=> b!193153 (= res!91244 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5934 thiss!1248) (mask!9195 thiss!1248))))))

(declare-fun res!91240 () Bool)

(assert (=> start!19730 (=> (not res!91240) (not e!127086))))

(declare-fun valid!1125 (LongMapFixedSize!2698) Bool)

(assert (=> start!19730 (= res!91240 (valid!1125 thiss!1248))))

(assert (=> start!19730 e!127086))

(declare-fun e!127081 () Bool)

(assert (=> start!19730 e!127081))

(assert (=> start!19730 true))

(declare-fun tp_is_empty!4477 () Bool)

(assert (=> start!19730 tp_is_empty!4477))

(declare-fun b!193154 () Bool)

(declare-fun e!127084 () Bool)

(assert (=> b!193154 (= e!127084 (= (select (arr!3850 (_keys!5934 thiss!1248)) (index!4935 lt!96040)) key!828))))

(declare-fun b!193155 () Bool)

(assert (=> b!193155 (= e!127089 (and (bvsge (index!4935 lt!96040) #b00000000000000000000000000000000) (bvslt (index!4935 lt!96040) (size!4175 (_keys!5934 thiss!1248)))))))

(declare-fun b!193156 () Bool)

(declare-datatypes ((Unit!5801 0))(
  ( (Unit!5802) )
))
(declare-fun e!127085 () Unit!5801)

(declare-fun Unit!5803 () Unit!5801)

(assert (=> b!193156 (= e!127085 Unit!5803)))

(declare-fun lt!96041 () Unit!5801)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!178 (array!8181 array!8183 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 64) Int) Unit!5801)

(assert (=> b!193156 (= lt!96041 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!178 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)))))

(assert (=> b!193156 false))

(declare-fun mapIsEmpty!7742 () Bool)

(declare-fun mapRes!7742 () Bool)

(assert (=> mapIsEmpty!7742 mapRes!7742))

(declare-fun b!193157 () Bool)

(declare-fun res!91243 () Bool)

(assert (=> b!193157 (=> res!91243 e!127089)))

(declare-datatypes ((List!2420 0))(
  ( (Nil!2417) (Cons!2416 (h!3057 (_ BitVec 64)) (t!7333 List!2420)) )
))
(declare-fun arrayNoDuplicates!0 (array!8181 (_ BitVec 32) List!2420) Bool)

(assert (=> b!193157 (= res!91243 (not (arrayNoDuplicates!0 (_keys!5934 thiss!1248) #b00000000000000000000000000000000 Nil!2417)))))

(declare-fun mapNonEmpty!7742 () Bool)

(declare-fun tp!16978 () Bool)

(declare-fun e!127087 () Bool)

(assert (=> mapNonEmpty!7742 (= mapRes!7742 (and tp!16978 e!127087))))

(declare-fun mapRest!7742 () (Array (_ BitVec 32) ValueCell!1895))

(declare-fun mapValue!7742 () ValueCell!1895)

(declare-fun mapKey!7742 () (_ BitVec 32))

(assert (=> mapNonEmpty!7742 (= (arr!3851 (_values!3928 thiss!1248)) (store mapRest!7742 mapKey!7742 mapValue!7742))))

(declare-fun b!193158 () Bool)

(assert (=> b!193158 (= e!127087 tp_is_empty!4477)))

(declare-fun b!193159 () Bool)

(assert (=> b!193159 (= e!127088 (not e!127089))))

(declare-fun res!91242 () Bool)

(assert (=> b!193159 (=> res!91242 e!127089)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!193159 (= res!91242 (not (validMask!0 (mask!9195 thiss!1248))))))

(declare-datatypes ((tuple2!3504 0))(
  ( (tuple2!3505 (_1!1763 (_ BitVec 64)) (_2!1763 V!5617)) )
))
(declare-datatypes ((List!2421 0))(
  ( (Nil!2418) (Cons!2417 (h!3058 tuple2!3504) (t!7334 List!2421)) )
))
(declare-datatypes ((ListLongMap!2413 0))(
  ( (ListLongMap!2414 (toList!1222 List!2421)) )
))
(declare-fun lt!96037 () ListLongMap!2413)

(declare-fun v!309 () V!5617)

(declare-fun +!314 (ListLongMap!2413 tuple2!3504) ListLongMap!2413)

(declare-fun getCurrentListMap!855 (array!8181 array!8183 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 32) Int) ListLongMap!2413)

(assert (=> b!193159 (= (+!314 lt!96037 (tuple2!3505 key!828 v!309)) (getCurrentListMap!855 (_keys!5934 thiss!1248) (array!8184 (store (arr!3851 (_values!3928 thiss!1248)) (index!4935 lt!96040) (ValueCellFull!1895 v!309)) (size!4176 (_values!3928 thiss!1248))) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96042 () Unit!5801)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!130 (array!8181 array!8183 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 32) (_ BitVec 64) V!5617 Int) Unit!5801)

(assert (=> b!193159 (= lt!96042 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!130 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) (index!4935 lt!96040) key!828 v!309 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96038 () Unit!5801)

(assert (=> b!193159 (= lt!96038 e!127085)))

(declare-fun c!34839 () Bool)

(declare-fun contains!1349 (ListLongMap!2413 (_ BitVec 64)) Bool)

(assert (=> b!193159 (= c!34839 (contains!1349 lt!96037 key!828))))

(assert (=> b!193159 (= lt!96037 (getCurrentListMap!855 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun e!127083 () Bool)

(declare-fun array_inv!2501 (array!8181) Bool)

(declare-fun array_inv!2502 (array!8183) Bool)

(assert (=> b!193160 (= e!127081 (and tp!16979 tp_is_empty!4477 (array_inv!2501 (_keys!5934 thiss!1248)) (array_inv!2502 (_values!3928 thiss!1248)) e!127083))))

(declare-fun b!193161 () Bool)

(declare-fun e!127080 () Bool)

(assert (=> b!193161 (= e!127080 tp_is_empty!4477)))

(declare-fun b!193162 () Bool)

(assert (=> b!193162 (= e!127083 (and e!127080 mapRes!7742))))

(declare-fun condMapEmpty!7742 () Bool)

(declare-fun mapDefault!7742 () ValueCell!1895)

(assert (=> b!193162 (= condMapEmpty!7742 (= (arr!3851 (_values!3928 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1895)) mapDefault!7742)))))

(declare-fun b!193163 () Bool)

(declare-fun lt!96039 () Unit!5801)

(assert (=> b!193163 (= e!127085 lt!96039)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!178 (array!8181 array!8183 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 64) Int) Unit!5801)

(assert (=> b!193163 (= lt!96039 (lemmaInListMapThenSeekEntryOrOpenFindsIt!178 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)))))

(declare-fun res!91245 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193163 (= res!91245 (inRange!0 (index!4935 lt!96040) (mask!9195 thiss!1248)))))

(assert (=> b!193163 (=> (not res!91245) (not e!127084))))

(assert (=> b!193163 e!127084))

(assert (= (and start!19730 res!91240) b!193152))

(assert (= (and b!193152 res!91241) b!193151))

(assert (= (and b!193151 res!91246) b!193159))

(assert (= (and b!193159 c!34839) b!193163))

(assert (= (and b!193159 (not c!34839)) b!193156))

(assert (= (and b!193163 res!91245) b!193154))

(assert (= (and b!193159 (not res!91242)) b!193150))

(assert (= (and b!193150 (not res!91247)) b!193153))

(assert (= (and b!193153 (not res!91244)) b!193157))

(assert (= (and b!193157 (not res!91243)) b!193155))

(assert (= (and b!193162 condMapEmpty!7742) mapIsEmpty!7742))

(assert (= (and b!193162 (not condMapEmpty!7742)) mapNonEmpty!7742))

(assert (= (and mapNonEmpty!7742 ((_ is ValueCellFull!1895) mapValue!7742)) b!193158))

(assert (= (and b!193162 ((_ is ValueCellFull!1895) mapDefault!7742)) b!193161))

(assert (= b!193160 b!193162))

(assert (= start!19730 b!193160))

(declare-fun m!219483 () Bool)

(assert (=> b!193156 m!219483))

(declare-fun m!219485 () Bool)

(assert (=> b!193157 m!219485))

(declare-fun m!219487 () Bool)

(assert (=> b!193160 m!219487))

(declare-fun m!219489 () Bool)

(assert (=> b!193160 m!219489))

(declare-fun m!219491 () Bool)

(assert (=> b!193154 m!219491))

(declare-fun m!219493 () Bool)

(assert (=> b!193159 m!219493))

(declare-fun m!219495 () Bool)

(assert (=> b!193159 m!219495))

(declare-fun m!219497 () Bool)

(assert (=> b!193159 m!219497))

(declare-fun m!219499 () Bool)

(assert (=> b!193159 m!219499))

(declare-fun m!219501 () Bool)

(assert (=> b!193159 m!219501))

(declare-fun m!219503 () Bool)

(assert (=> b!193159 m!219503))

(declare-fun m!219505 () Bool)

(assert (=> b!193159 m!219505))

(declare-fun m!219507 () Bool)

(assert (=> mapNonEmpty!7742 m!219507))

(declare-fun m!219509 () Bool)

(assert (=> b!193151 m!219509))

(declare-fun m!219511 () Bool)

(assert (=> b!193163 m!219511))

(declare-fun m!219513 () Bool)

(assert (=> b!193163 m!219513))

(declare-fun m!219515 () Bool)

(assert (=> b!193153 m!219515))

(declare-fun m!219517 () Bool)

(assert (=> start!19730 m!219517))

(check-sat (not b_next!4705) (not b!193163) (not b!193156) b_and!11385 (not b!193157) (not mapNonEmpty!7742) (not b!193151) tp_is_empty!4477 (not start!19730) (not b!193153) (not b!193159) (not b!193160))
(check-sat b_and!11385 (not b_next!4705))
(get-model)

(declare-fun b!193256 () Bool)

(declare-fun e!127156 () Bool)

(declare-fun e!127158 () Bool)

(assert (=> b!193256 (= e!127156 e!127158)))

(declare-fun lt!96087 () (_ BitVec 64))

(assert (=> b!193256 (= lt!96087 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96085 () Unit!5801)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8181 (_ BitVec 64) (_ BitVec 32)) Unit!5801)

(assert (=> b!193256 (= lt!96085 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5934 thiss!1248) lt!96087 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!193256 (arrayContainsKey!0 (_keys!5934 thiss!1248) lt!96087 #b00000000000000000000000000000000)))

(declare-fun lt!96086 () Unit!5801)

(assert (=> b!193256 (= lt!96086 lt!96085)))

(declare-fun res!91301 () Bool)

(assert (=> b!193256 (= res!91301 (= (seekEntryOrOpen!0 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000) (_keys!5934 thiss!1248) (mask!9195 thiss!1248)) (Found!691 #b00000000000000000000000000000000)))))

(assert (=> b!193256 (=> (not res!91301) (not e!127158))))

(declare-fun bm!19505 () Bool)

(declare-fun call!19508 () Bool)

(assert (=> bm!19505 (= call!19508 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5934 thiss!1248) (mask!9195 thiss!1248)))))

(declare-fun b!193257 () Bool)

(assert (=> b!193257 (= e!127158 call!19508)))

(declare-fun d!56425 () Bool)

(declare-fun res!91300 () Bool)

(declare-fun e!127157 () Bool)

(assert (=> d!56425 (=> res!91300 e!127157)))

(assert (=> d!56425 (= res!91300 (bvsge #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))))))

(assert (=> d!56425 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5934 thiss!1248) (mask!9195 thiss!1248)) e!127157)))

(declare-fun b!193258 () Bool)

(assert (=> b!193258 (= e!127157 e!127156)))

(declare-fun c!34848 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!193258 (= c!34848 (validKeyInArray!0 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193259 () Bool)

(assert (=> b!193259 (= e!127156 call!19508)))

(assert (= (and d!56425 (not res!91300)) b!193258))

(assert (= (and b!193258 c!34848) b!193256))

(assert (= (and b!193258 (not c!34848)) b!193259))

(assert (= (and b!193256 res!91301) b!193257))

(assert (= (or b!193257 b!193259) bm!19505))

(declare-fun m!219591 () Bool)

(assert (=> b!193256 m!219591))

(declare-fun m!219593 () Bool)

(assert (=> b!193256 m!219593))

(declare-fun m!219595 () Bool)

(assert (=> b!193256 m!219595))

(assert (=> b!193256 m!219591))

(declare-fun m!219597 () Bool)

(assert (=> b!193256 m!219597))

(declare-fun m!219599 () Bool)

(assert (=> bm!19505 m!219599))

(assert (=> b!193258 m!219591))

(assert (=> b!193258 m!219591))

(declare-fun m!219601 () Bool)

(assert (=> b!193258 m!219601))

(assert (=> b!193153 d!56425))

(declare-fun d!56427 () Bool)

(declare-fun e!127161 () Bool)

(assert (=> d!56427 e!127161))

(declare-fun res!91307 () Bool)

(assert (=> d!56427 (=> (not res!91307) (not e!127161))))

(declare-fun lt!96093 () SeekEntryResult!691)

(assert (=> d!56427 (= res!91307 ((_ is Found!691) lt!96093))))

(assert (=> d!56427 (= lt!96093 (seekEntryOrOpen!0 key!828 (_keys!5934 thiss!1248) (mask!9195 thiss!1248)))))

(declare-fun lt!96092 () Unit!5801)

(declare-fun choose!1064 (array!8181 array!8183 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 64) Int) Unit!5801)

(assert (=> d!56427 (= lt!96092 (choose!1064 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)))))

(assert (=> d!56427 (validMask!0 (mask!9195 thiss!1248))))

(assert (=> d!56427 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!178 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)) lt!96092)))

(declare-fun b!193264 () Bool)

(declare-fun res!91306 () Bool)

(assert (=> b!193264 (=> (not res!91306) (not e!127161))))

(assert (=> b!193264 (= res!91306 (inRange!0 (index!4935 lt!96093) (mask!9195 thiss!1248)))))

(declare-fun b!193265 () Bool)

(assert (=> b!193265 (= e!127161 (= (select (arr!3850 (_keys!5934 thiss!1248)) (index!4935 lt!96093)) key!828))))

(assert (=> b!193265 (and (bvsge (index!4935 lt!96093) #b00000000000000000000000000000000) (bvslt (index!4935 lt!96093) (size!4175 (_keys!5934 thiss!1248))))))

(assert (= (and d!56427 res!91307) b!193264))

(assert (= (and b!193264 res!91306) b!193265))

(assert (=> d!56427 m!219509))

(declare-fun m!219603 () Bool)

(assert (=> d!56427 m!219603))

(assert (=> d!56427 m!219505))

(declare-fun m!219605 () Bool)

(assert (=> b!193264 m!219605))

(declare-fun m!219607 () Bool)

(assert (=> b!193265 m!219607))

(assert (=> b!193163 d!56427))

(declare-fun d!56429 () Bool)

(assert (=> d!56429 (= (inRange!0 (index!4935 lt!96040) (mask!9195 thiss!1248)) (and (bvsge (index!4935 lt!96040) #b00000000000000000000000000000000) (bvslt (index!4935 lt!96040) (bvadd (mask!9195 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!193163 d!56429))

(declare-fun d!56431 () Bool)

(declare-fun res!91314 () Bool)

(declare-fun e!127164 () Bool)

(assert (=> d!56431 (=> (not res!91314) (not e!127164))))

(declare-fun simpleValid!202 (LongMapFixedSize!2698) Bool)

(assert (=> d!56431 (= res!91314 (simpleValid!202 thiss!1248))))

(assert (=> d!56431 (= (valid!1125 thiss!1248) e!127164)))

(declare-fun b!193272 () Bool)

(declare-fun res!91315 () Bool)

(assert (=> b!193272 (=> (not res!91315) (not e!127164))))

(declare-fun arrayCountValidKeys!0 (array!8181 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!193272 (= res!91315 (= (arrayCountValidKeys!0 (_keys!5934 thiss!1248) #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))) (_size!1398 thiss!1248)))))

(declare-fun b!193273 () Bool)

(declare-fun res!91316 () Bool)

(assert (=> b!193273 (=> (not res!91316) (not e!127164))))

(assert (=> b!193273 (= res!91316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5934 thiss!1248) (mask!9195 thiss!1248)))))

(declare-fun b!193274 () Bool)

(assert (=> b!193274 (= e!127164 (arrayNoDuplicates!0 (_keys!5934 thiss!1248) #b00000000000000000000000000000000 Nil!2417))))

(assert (= (and d!56431 res!91314) b!193272))

(assert (= (and b!193272 res!91315) b!193273))

(assert (= (and b!193273 res!91316) b!193274))

(declare-fun m!219609 () Bool)

(assert (=> d!56431 m!219609))

(declare-fun m!219611 () Bool)

(assert (=> b!193272 m!219611))

(assert (=> b!193273 m!219515))

(assert (=> b!193274 m!219485))

(assert (=> start!19730 d!56431))

(declare-fun b!193291 () Bool)

(declare-fun e!127174 () Bool)

(declare-fun lt!96099 () SeekEntryResult!691)

(assert (=> b!193291 (= e!127174 ((_ is Undefined!691) lt!96099))))

(declare-fun b!193292 () Bool)

(declare-fun res!91325 () Bool)

(declare-fun e!127173 () Bool)

(assert (=> b!193292 (=> (not res!91325) (not e!127173))))

(declare-fun call!19514 () Bool)

(assert (=> b!193292 (= res!91325 call!19514)))

(assert (=> b!193292 (= e!127174 e!127173)))

(declare-fun b!193293 () Bool)

(declare-fun e!127176 () Bool)

(assert (=> b!193293 (= e!127176 e!127174)))

(declare-fun c!34854 () Bool)

(assert (=> b!193293 (= c!34854 ((_ is MissingVacant!691) lt!96099))))

(declare-fun b!193294 () Bool)

(declare-fun call!19513 () Bool)

(assert (=> b!193294 (= e!127173 (not call!19513))))

(declare-fun b!193295 () Bool)

(declare-fun e!127175 () Bool)

(assert (=> b!193295 (= e!127175 (not call!19513))))

(declare-fun b!193296 () Bool)

(assert (=> b!193296 (= e!127176 e!127175)))

(declare-fun res!91327 () Bool)

(assert (=> b!193296 (= res!91327 call!19514)))

(assert (=> b!193296 (=> (not res!91327) (not e!127175))))

(declare-fun c!34853 () Bool)

(declare-fun bm!19510 () Bool)

(assert (=> bm!19510 (= call!19514 (inRange!0 (ite c!34853 (index!4934 lt!96099) (index!4937 lt!96099)) (mask!9195 thiss!1248)))))

(declare-fun d!56433 () Bool)

(assert (=> d!56433 e!127176))

(assert (=> d!56433 (= c!34853 ((_ is MissingZero!691) lt!96099))))

(assert (=> d!56433 (= lt!96099 (seekEntryOrOpen!0 key!828 (_keys!5934 thiss!1248) (mask!9195 thiss!1248)))))

(declare-fun lt!96098 () Unit!5801)

(declare-fun choose!1065 (array!8181 array!8183 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 64) Int) Unit!5801)

(assert (=> d!56433 (= lt!96098 (choose!1065 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)))))

(assert (=> d!56433 (validMask!0 (mask!9195 thiss!1248))))

(assert (=> d!56433 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!178 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)) lt!96098)))

(declare-fun b!193297 () Bool)

(declare-fun res!91328 () Bool)

(assert (=> b!193297 (=> (not res!91328) (not e!127173))))

(assert (=> b!193297 (= res!91328 (= (select (arr!3850 (_keys!5934 thiss!1248)) (index!4937 lt!96099)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193297 (and (bvsge (index!4937 lt!96099) #b00000000000000000000000000000000) (bvslt (index!4937 lt!96099) (size!4175 (_keys!5934 thiss!1248))))))

(declare-fun bm!19511 () Bool)

(assert (=> bm!19511 (= call!19513 (arrayContainsKey!0 (_keys!5934 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!193298 () Bool)

(assert (=> b!193298 (and (bvsge (index!4934 lt!96099) #b00000000000000000000000000000000) (bvslt (index!4934 lt!96099) (size!4175 (_keys!5934 thiss!1248))))))

(declare-fun res!91326 () Bool)

(assert (=> b!193298 (= res!91326 (= (select (arr!3850 (_keys!5934 thiss!1248)) (index!4934 lt!96099)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193298 (=> (not res!91326) (not e!127175))))

(assert (= (and d!56433 c!34853) b!193296))

(assert (= (and d!56433 (not c!34853)) b!193293))

(assert (= (and b!193296 res!91327) b!193298))

(assert (= (and b!193298 res!91326) b!193295))

(assert (= (and b!193293 c!34854) b!193292))

(assert (= (and b!193293 (not c!34854)) b!193291))

(assert (= (and b!193292 res!91325) b!193297))

(assert (= (and b!193297 res!91328) b!193294))

(assert (= (or b!193296 b!193292) bm!19510))

(assert (= (or b!193295 b!193294) bm!19511))

(declare-fun m!219613 () Bool)

(assert (=> bm!19511 m!219613))

(declare-fun m!219615 () Bool)

(assert (=> bm!19510 m!219615))

(assert (=> d!56433 m!219509))

(declare-fun m!219617 () Bool)

(assert (=> d!56433 m!219617))

(assert (=> d!56433 m!219505))

(declare-fun m!219619 () Bool)

(assert (=> b!193297 m!219619))

(declare-fun m!219621 () Bool)

(assert (=> b!193298 m!219621))

(assert (=> b!193156 d!56433))

(declare-fun bm!19526 () Bool)

(declare-fun call!19531 () ListLongMap!2413)

(declare-fun call!19532 () ListLongMap!2413)

(assert (=> bm!19526 (= call!19531 call!19532)))

(declare-fun b!193341 () Bool)

(declare-fun e!127212 () ListLongMap!2413)

(declare-fun call!19535 () ListLongMap!2413)

(assert (=> b!193341 (= e!127212 call!19535)))

(declare-fun b!193342 () Bool)

(declare-fun e!127204 () Bool)

(declare-fun e!127215 () Bool)

(assert (=> b!193342 (= e!127204 e!127215)))

(declare-fun res!91349 () Bool)

(declare-fun call!19530 () Bool)

(assert (=> b!193342 (= res!91349 call!19530)))

(assert (=> b!193342 (=> (not res!91349) (not e!127215))))

(declare-fun b!193343 () Bool)

(declare-fun e!127211 () Unit!5801)

(declare-fun lt!96145 () Unit!5801)

(assert (=> b!193343 (= e!127211 lt!96145)))

(declare-fun lt!96144 () ListLongMap!2413)

(declare-fun getCurrentListMapNoExtraKeys!207 (array!8181 array!8183 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 32) Int) ListLongMap!2413)

(assert (=> b!193343 (= lt!96144 (getCurrentListMapNoExtraKeys!207 (_keys!5934 thiss!1248) (array!8184 (store (arr!3851 (_values!3928 thiss!1248)) (index!4935 lt!96040) (ValueCellFull!1895 v!309)) (size!4176 (_values!3928 thiss!1248))) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96147 () (_ BitVec 64))

(assert (=> b!193343 (= lt!96147 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96155 () (_ BitVec 64))

(assert (=> b!193343 (= lt!96155 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96159 () Unit!5801)

(declare-fun addStillContains!162 (ListLongMap!2413 (_ BitVec 64) V!5617 (_ BitVec 64)) Unit!5801)

(assert (=> b!193343 (= lt!96159 (addStillContains!162 lt!96144 lt!96147 (zeroValue!3786 thiss!1248) lt!96155))))

(assert (=> b!193343 (contains!1349 (+!314 lt!96144 (tuple2!3505 lt!96147 (zeroValue!3786 thiss!1248))) lt!96155)))

(declare-fun lt!96152 () Unit!5801)

(assert (=> b!193343 (= lt!96152 lt!96159)))

(declare-fun lt!96151 () ListLongMap!2413)

(assert (=> b!193343 (= lt!96151 (getCurrentListMapNoExtraKeys!207 (_keys!5934 thiss!1248) (array!8184 (store (arr!3851 (_values!3928 thiss!1248)) (index!4935 lt!96040) (ValueCellFull!1895 v!309)) (size!4176 (_values!3928 thiss!1248))) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96163 () (_ BitVec 64))

(assert (=> b!193343 (= lt!96163 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96148 () (_ BitVec 64))

(assert (=> b!193343 (= lt!96148 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96154 () Unit!5801)

(declare-fun addApplyDifferent!162 (ListLongMap!2413 (_ BitVec 64) V!5617 (_ BitVec 64)) Unit!5801)

(assert (=> b!193343 (= lt!96154 (addApplyDifferent!162 lt!96151 lt!96163 (minValue!3786 thiss!1248) lt!96148))))

(declare-fun apply!186 (ListLongMap!2413 (_ BitVec 64)) V!5617)

(assert (=> b!193343 (= (apply!186 (+!314 lt!96151 (tuple2!3505 lt!96163 (minValue!3786 thiss!1248))) lt!96148) (apply!186 lt!96151 lt!96148))))

(declare-fun lt!96146 () Unit!5801)

(assert (=> b!193343 (= lt!96146 lt!96154)))

(declare-fun lt!96153 () ListLongMap!2413)

(assert (=> b!193343 (= lt!96153 (getCurrentListMapNoExtraKeys!207 (_keys!5934 thiss!1248) (array!8184 (store (arr!3851 (_values!3928 thiss!1248)) (index!4935 lt!96040) (ValueCellFull!1895 v!309)) (size!4176 (_values!3928 thiss!1248))) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96156 () (_ BitVec 64))

(assert (=> b!193343 (= lt!96156 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96162 () (_ BitVec 64))

(assert (=> b!193343 (= lt!96162 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96160 () Unit!5801)

(assert (=> b!193343 (= lt!96160 (addApplyDifferent!162 lt!96153 lt!96156 (zeroValue!3786 thiss!1248) lt!96162))))

(assert (=> b!193343 (= (apply!186 (+!314 lt!96153 (tuple2!3505 lt!96156 (zeroValue!3786 thiss!1248))) lt!96162) (apply!186 lt!96153 lt!96162))))

(declare-fun lt!96161 () Unit!5801)

(assert (=> b!193343 (= lt!96161 lt!96160)))

(declare-fun lt!96149 () ListLongMap!2413)

(assert (=> b!193343 (= lt!96149 (getCurrentListMapNoExtraKeys!207 (_keys!5934 thiss!1248) (array!8184 (store (arr!3851 (_values!3928 thiss!1248)) (index!4935 lt!96040) (ValueCellFull!1895 v!309)) (size!4176 (_values!3928 thiss!1248))) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96158 () (_ BitVec 64))

(assert (=> b!193343 (= lt!96158 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96150 () (_ BitVec 64))

(assert (=> b!193343 (= lt!96150 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193343 (= lt!96145 (addApplyDifferent!162 lt!96149 lt!96158 (minValue!3786 thiss!1248) lt!96150))))

(assert (=> b!193343 (= (apply!186 (+!314 lt!96149 (tuple2!3505 lt!96158 (minValue!3786 thiss!1248))) lt!96150) (apply!186 lt!96149 lt!96150))))

(declare-fun d!56435 () Bool)

(declare-fun e!127210 () Bool)

(assert (=> d!56435 e!127210))

(declare-fun res!91350 () Bool)

(assert (=> d!56435 (=> (not res!91350) (not e!127210))))

(assert (=> d!56435 (= res!91350 (or (bvsge #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))))))))

(declare-fun lt!96164 () ListLongMap!2413)

(declare-fun lt!96165 () ListLongMap!2413)

(assert (=> d!56435 (= lt!96164 lt!96165)))

(declare-fun lt!96157 () Unit!5801)

(assert (=> d!56435 (= lt!96157 e!127211)))

(declare-fun c!34868 () Bool)

(declare-fun e!127214 () Bool)

(assert (=> d!56435 (= c!34868 e!127214)))

(declare-fun res!91347 () Bool)

(assert (=> d!56435 (=> (not res!91347) (not e!127214))))

(assert (=> d!56435 (= res!91347 (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))))))

(declare-fun e!127203 () ListLongMap!2413)

(assert (=> d!56435 (= lt!96165 e!127203)))

(declare-fun c!34872 () Bool)

(assert (=> d!56435 (= c!34872 (and (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56435 (validMask!0 (mask!9195 thiss!1248))))

(assert (=> d!56435 (= (getCurrentListMap!855 (_keys!5934 thiss!1248) (array!8184 (store (arr!3851 (_values!3928 thiss!1248)) (index!4935 lt!96040) (ValueCellFull!1895 v!309)) (size!4176 (_values!3928 thiss!1248))) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)) lt!96164)))

(declare-fun b!193344 () Bool)

(assert (=> b!193344 (= e!127215 (= (apply!186 lt!96164 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3786 thiss!1248)))))

(declare-fun b!193345 () Bool)

(declare-fun e!127209 () Bool)

(declare-fun call!19533 () Bool)

(assert (=> b!193345 (= e!127209 (not call!19533))))

(declare-fun b!193346 () Bool)

(declare-fun call!19529 () ListLongMap!2413)

(assert (=> b!193346 (= e!127203 (+!314 call!19529 (tuple2!3505 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3786 thiss!1248))))))

(declare-fun e!127205 () Bool)

(declare-fun b!193347 () Bool)

(declare-fun get!2225 (ValueCell!1895 V!5617) V!5617)

(declare-fun dynLambda!520 (Int (_ BitVec 64)) V!5617)

(assert (=> b!193347 (= e!127205 (= (apply!186 lt!96164 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000)) (get!2225 (select (arr!3851 (array!8184 (store (arr!3851 (_values!3928 thiss!1248)) (index!4935 lt!96040) (ValueCellFull!1895 v!309)) (size!4176 (_values!3928 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!520 (defaultEntry!3945 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193347 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4176 (array!8184 (store (arr!3851 (_values!3928 thiss!1248)) (index!4935 lt!96040) (ValueCellFull!1895 v!309)) (size!4176 (_values!3928 thiss!1248))))))))

(assert (=> b!193347 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))))))

(declare-fun b!193348 () Bool)

(assert (=> b!193348 (= e!127214 (validKeyInArray!0 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193349 () Bool)

(declare-fun e!127208 () Bool)

(assert (=> b!193349 (= e!127208 (validKeyInArray!0 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193350 () Bool)

(assert (=> b!193350 (= e!127204 (not call!19530))))

(declare-fun c!34870 () Bool)

(declare-fun bm!19527 () Bool)

(declare-fun call!19534 () ListLongMap!2413)

(assert (=> bm!19527 (= call!19529 (+!314 (ite c!34872 call!19532 (ite c!34870 call!19531 call!19534)) (ite (or c!34872 c!34870) (tuple2!3505 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3786 thiss!1248)) (tuple2!3505 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3786 thiss!1248)))))))

(declare-fun bm!19528 () Bool)

(assert (=> bm!19528 (= call!19534 call!19531)))

(declare-fun b!193351 () Bool)

(declare-fun c!34869 () Bool)

(assert (=> b!193351 (= c!34869 (and (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127213 () ListLongMap!2413)

(assert (=> b!193351 (= e!127212 e!127213)))

(declare-fun b!193352 () Bool)

(assert (=> b!193352 (= e!127213 call!19534)))

(declare-fun bm!19529 () Bool)

(assert (=> bm!19529 (= call!19533 (contains!1349 lt!96164 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193353 () Bool)

(declare-fun e!127206 () Bool)

(assert (=> b!193353 (= e!127206 (= (apply!186 lt!96164 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3786 thiss!1248)))))

(declare-fun b!193354 () Bool)

(declare-fun Unit!5807 () Unit!5801)

(assert (=> b!193354 (= e!127211 Unit!5807)))

(declare-fun b!193355 () Bool)

(declare-fun e!127207 () Bool)

(assert (=> b!193355 (= e!127207 e!127205)))

(declare-fun res!91354 () Bool)

(assert (=> b!193355 (=> (not res!91354) (not e!127205))))

(assert (=> b!193355 (= res!91354 (contains!1349 lt!96164 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193355 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))))))

(declare-fun b!193356 () Bool)

(assert (=> b!193356 (= e!127209 e!127206)))

(declare-fun res!91355 () Bool)

(assert (=> b!193356 (= res!91355 call!19533)))

(assert (=> b!193356 (=> (not res!91355) (not e!127206))))

(declare-fun b!193357 () Bool)

(assert (=> b!193357 (= e!127213 call!19535)))

(declare-fun bm!19530 () Bool)

(assert (=> bm!19530 (= call!19535 call!19529)))

(declare-fun bm!19531 () Bool)

(assert (=> bm!19531 (= call!19532 (getCurrentListMapNoExtraKeys!207 (_keys!5934 thiss!1248) (array!8184 (store (arr!3851 (_values!3928 thiss!1248)) (index!4935 lt!96040) (ValueCellFull!1895 v!309)) (size!4176 (_values!3928 thiss!1248))) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun bm!19532 () Bool)

(assert (=> bm!19532 (= call!19530 (contains!1349 lt!96164 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193358 () Bool)

(assert (=> b!193358 (= e!127203 e!127212)))

(assert (=> b!193358 (= c!34870 (and (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193359 () Bool)

(declare-fun res!91348 () Bool)

(assert (=> b!193359 (=> (not res!91348) (not e!127210))))

(assert (=> b!193359 (= res!91348 e!127204)))

(declare-fun c!34867 () Bool)

(assert (=> b!193359 (= c!34867 (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193360 () Bool)

(assert (=> b!193360 (= e!127210 e!127209)))

(declare-fun c!34871 () Bool)

(assert (=> b!193360 (= c!34871 (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193361 () Bool)

(declare-fun res!91353 () Bool)

(assert (=> b!193361 (=> (not res!91353) (not e!127210))))

(assert (=> b!193361 (= res!91353 e!127207)))

(declare-fun res!91352 () Bool)

(assert (=> b!193361 (=> res!91352 e!127207)))

(assert (=> b!193361 (= res!91352 (not e!127208))))

(declare-fun res!91351 () Bool)

(assert (=> b!193361 (=> (not res!91351) (not e!127208))))

(assert (=> b!193361 (= res!91351 (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))))))

(assert (= (and d!56435 c!34872) b!193346))

(assert (= (and d!56435 (not c!34872)) b!193358))

(assert (= (and b!193358 c!34870) b!193341))

(assert (= (and b!193358 (not c!34870)) b!193351))

(assert (= (and b!193351 c!34869) b!193357))

(assert (= (and b!193351 (not c!34869)) b!193352))

(assert (= (or b!193357 b!193352) bm!19528))

(assert (= (or b!193341 bm!19528) bm!19526))

(assert (= (or b!193341 b!193357) bm!19530))

(assert (= (or b!193346 bm!19526) bm!19531))

(assert (= (or b!193346 bm!19530) bm!19527))

(assert (= (and d!56435 res!91347) b!193348))

(assert (= (and d!56435 c!34868) b!193343))

(assert (= (and d!56435 (not c!34868)) b!193354))

(assert (= (and d!56435 res!91350) b!193361))

(assert (= (and b!193361 res!91351) b!193349))

(assert (= (and b!193361 (not res!91352)) b!193355))

(assert (= (and b!193355 res!91354) b!193347))

(assert (= (and b!193361 res!91353) b!193359))

(assert (= (and b!193359 c!34867) b!193342))

(assert (= (and b!193359 (not c!34867)) b!193350))

(assert (= (and b!193342 res!91349) b!193344))

(assert (= (or b!193342 b!193350) bm!19532))

(assert (= (and b!193359 res!91348) b!193360))

(assert (= (and b!193360 c!34871) b!193356))

(assert (= (and b!193360 (not c!34871)) b!193345))

(assert (= (and b!193356 res!91355) b!193353))

(assert (= (or b!193356 b!193345) bm!19529))

(declare-fun b_lambda!7445 () Bool)

(assert (=> (not b_lambda!7445) (not b!193347)))

(declare-fun t!7337 () Bool)

(declare-fun tb!2875 () Bool)

(assert (=> (and b!193160 (= (defaultEntry!3945 thiss!1248) (defaultEntry!3945 thiss!1248)) t!7337) tb!2875))

(declare-fun result!4919 () Bool)

(assert (=> tb!2875 (= result!4919 tp_is_empty!4477)))

(assert (=> b!193347 t!7337))

(declare-fun b_and!11391 () Bool)

(assert (= b_and!11385 (and (=> t!7337 result!4919) b_and!11391)))

(declare-fun m!219623 () Bool)

(assert (=> b!193346 m!219623))

(declare-fun m!219625 () Bool)

(assert (=> b!193344 m!219625))

(assert (=> b!193349 m!219591))

(assert (=> b!193349 m!219591))

(assert (=> b!193349 m!219601))

(assert (=> b!193355 m!219591))

(assert (=> b!193355 m!219591))

(declare-fun m!219627 () Bool)

(assert (=> b!193355 m!219627))

(declare-fun m!219629 () Bool)

(assert (=> b!193353 m!219629))

(declare-fun m!219631 () Bool)

(assert (=> bm!19531 m!219631))

(declare-fun m!219633 () Bool)

(assert (=> bm!19529 m!219633))

(declare-fun m!219635 () Bool)

(assert (=> b!193343 m!219635))

(declare-fun m!219637 () Bool)

(assert (=> b!193343 m!219637))

(assert (=> b!193343 m!219635))

(declare-fun m!219639 () Bool)

(assert (=> b!193343 m!219639))

(assert (=> b!193343 m!219639))

(declare-fun m!219641 () Bool)

(assert (=> b!193343 m!219641))

(declare-fun m!219643 () Bool)

(assert (=> b!193343 m!219643))

(declare-fun m!219645 () Bool)

(assert (=> b!193343 m!219645))

(assert (=> b!193343 m!219591))

(assert (=> b!193343 m!219631))

(declare-fun m!219647 () Bool)

(assert (=> b!193343 m!219647))

(declare-fun m!219649 () Bool)

(assert (=> b!193343 m!219649))

(declare-fun m!219651 () Bool)

(assert (=> b!193343 m!219651))

(declare-fun m!219653 () Bool)

(assert (=> b!193343 m!219653))

(declare-fun m!219655 () Bool)

(assert (=> b!193343 m!219655))

(declare-fun m!219657 () Bool)

(assert (=> b!193343 m!219657))

(declare-fun m!219659 () Bool)

(assert (=> b!193343 m!219659))

(assert (=> b!193343 m!219647))

(declare-fun m!219661 () Bool)

(assert (=> b!193343 m!219661))

(assert (=> b!193343 m!219643))

(declare-fun m!219663 () Bool)

(assert (=> b!193343 m!219663))

(declare-fun m!219665 () Bool)

(assert (=> bm!19527 m!219665))

(declare-fun m!219667 () Bool)

(assert (=> bm!19532 m!219667))

(assert (=> d!56435 m!219505))

(assert (=> b!193348 m!219591))

(assert (=> b!193348 m!219591))

(assert (=> b!193348 m!219601))

(assert (=> b!193347 m!219591))

(declare-fun m!219669 () Bool)

(assert (=> b!193347 m!219669))

(assert (=> b!193347 m!219591))

(declare-fun m!219671 () Bool)

(assert (=> b!193347 m!219671))

(declare-fun m!219673 () Bool)

(assert (=> b!193347 m!219673))

(assert (=> b!193347 m!219671))

(declare-fun m!219675 () Bool)

(assert (=> b!193347 m!219675))

(assert (=> b!193347 m!219673))

(assert (=> b!193159 d!56435))

(declare-fun d!56437 () Bool)

(declare-fun e!127220 () Bool)

(assert (=> d!56437 e!127220))

(declare-fun res!91358 () Bool)

(assert (=> d!56437 (=> res!91358 e!127220)))

(declare-fun lt!96176 () Bool)

(assert (=> d!56437 (= res!91358 (not lt!96176))))

(declare-fun lt!96174 () Bool)

(assert (=> d!56437 (= lt!96176 lt!96174)))

(declare-fun lt!96177 () Unit!5801)

(declare-fun e!127221 () Unit!5801)

(assert (=> d!56437 (= lt!96177 e!127221)))

(declare-fun c!34875 () Bool)

(assert (=> d!56437 (= c!34875 lt!96174)))

(declare-fun containsKey!245 (List!2421 (_ BitVec 64)) Bool)

(assert (=> d!56437 (= lt!96174 (containsKey!245 (toList!1222 lt!96037) key!828))))

(assert (=> d!56437 (= (contains!1349 lt!96037 key!828) lt!96176)))

(declare-fun b!193370 () Bool)

(declare-fun lt!96175 () Unit!5801)

(assert (=> b!193370 (= e!127221 lt!96175)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!194 (List!2421 (_ BitVec 64)) Unit!5801)

(assert (=> b!193370 (= lt!96175 (lemmaContainsKeyImpliesGetValueByKeyDefined!194 (toList!1222 lt!96037) key!828))))

(declare-datatypes ((Option!247 0))(
  ( (Some!246 (v!4238 V!5617)) (None!245) )
))
(declare-fun isDefined!195 (Option!247) Bool)

(declare-fun getValueByKey!241 (List!2421 (_ BitVec 64)) Option!247)

(assert (=> b!193370 (isDefined!195 (getValueByKey!241 (toList!1222 lt!96037) key!828))))

(declare-fun b!193371 () Bool)

(declare-fun Unit!5808 () Unit!5801)

(assert (=> b!193371 (= e!127221 Unit!5808)))

(declare-fun b!193372 () Bool)

(assert (=> b!193372 (= e!127220 (isDefined!195 (getValueByKey!241 (toList!1222 lt!96037) key!828)))))

(assert (= (and d!56437 c!34875) b!193370))

(assert (= (and d!56437 (not c!34875)) b!193371))

(assert (= (and d!56437 (not res!91358)) b!193372))

(declare-fun m!219677 () Bool)

(assert (=> d!56437 m!219677))

(declare-fun m!219679 () Bool)

(assert (=> b!193370 m!219679))

(declare-fun m!219681 () Bool)

(assert (=> b!193370 m!219681))

(assert (=> b!193370 m!219681))

(declare-fun m!219683 () Bool)

(assert (=> b!193370 m!219683))

(assert (=> b!193372 m!219681))

(assert (=> b!193372 m!219681))

(assert (=> b!193372 m!219683))

(assert (=> b!193159 d!56437))

(declare-fun d!56439 () Bool)

(assert (=> d!56439 (= (validMask!0 (mask!9195 thiss!1248)) (and (or (= (mask!9195 thiss!1248) #b00000000000000000000000000000111) (= (mask!9195 thiss!1248) #b00000000000000000000000000001111) (= (mask!9195 thiss!1248) #b00000000000000000000000000011111) (= (mask!9195 thiss!1248) #b00000000000000000000000000111111) (= (mask!9195 thiss!1248) #b00000000000000000000000001111111) (= (mask!9195 thiss!1248) #b00000000000000000000000011111111) (= (mask!9195 thiss!1248) #b00000000000000000000000111111111) (= (mask!9195 thiss!1248) #b00000000000000000000001111111111) (= (mask!9195 thiss!1248) #b00000000000000000000011111111111) (= (mask!9195 thiss!1248) #b00000000000000000000111111111111) (= (mask!9195 thiss!1248) #b00000000000000000001111111111111) (= (mask!9195 thiss!1248) #b00000000000000000011111111111111) (= (mask!9195 thiss!1248) #b00000000000000000111111111111111) (= (mask!9195 thiss!1248) #b00000000000000001111111111111111) (= (mask!9195 thiss!1248) #b00000000000000011111111111111111) (= (mask!9195 thiss!1248) #b00000000000000111111111111111111) (= (mask!9195 thiss!1248) #b00000000000001111111111111111111) (= (mask!9195 thiss!1248) #b00000000000011111111111111111111) (= (mask!9195 thiss!1248) #b00000000000111111111111111111111) (= (mask!9195 thiss!1248) #b00000000001111111111111111111111) (= (mask!9195 thiss!1248) #b00000000011111111111111111111111) (= (mask!9195 thiss!1248) #b00000000111111111111111111111111) (= (mask!9195 thiss!1248) #b00000001111111111111111111111111) (= (mask!9195 thiss!1248) #b00000011111111111111111111111111) (= (mask!9195 thiss!1248) #b00000111111111111111111111111111) (= (mask!9195 thiss!1248) #b00001111111111111111111111111111) (= (mask!9195 thiss!1248) #b00011111111111111111111111111111) (= (mask!9195 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9195 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!193159 d!56439))

(declare-fun d!56441 () Bool)

(declare-fun e!127224 () Bool)

(assert (=> d!56441 e!127224))

(declare-fun res!91364 () Bool)

(assert (=> d!56441 (=> (not res!91364) (not e!127224))))

(declare-fun lt!96189 () ListLongMap!2413)

(assert (=> d!56441 (= res!91364 (contains!1349 lt!96189 (_1!1763 (tuple2!3505 key!828 v!309))))))

(declare-fun lt!96186 () List!2421)

(assert (=> d!56441 (= lt!96189 (ListLongMap!2414 lt!96186))))

(declare-fun lt!96188 () Unit!5801)

(declare-fun lt!96187 () Unit!5801)

(assert (=> d!56441 (= lt!96188 lt!96187)))

(assert (=> d!56441 (= (getValueByKey!241 lt!96186 (_1!1763 (tuple2!3505 key!828 v!309))) (Some!246 (_2!1763 (tuple2!3505 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!131 (List!2421 (_ BitVec 64) V!5617) Unit!5801)

(assert (=> d!56441 (= lt!96187 (lemmaContainsTupThenGetReturnValue!131 lt!96186 (_1!1763 (tuple2!3505 key!828 v!309)) (_2!1763 (tuple2!3505 key!828 v!309))))))

(declare-fun insertStrictlySorted!134 (List!2421 (_ BitVec 64) V!5617) List!2421)

(assert (=> d!56441 (= lt!96186 (insertStrictlySorted!134 (toList!1222 lt!96037) (_1!1763 (tuple2!3505 key!828 v!309)) (_2!1763 (tuple2!3505 key!828 v!309))))))

(assert (=> d!56441 (= (+!314 lt!96037 (tuple2!3505 key!828 v!309)) lt!96189)))

(declare-fun b!193377 () Bool)

(declare-fun res!91363 () Bool)

(assert (=> b!193377 (=> (not res!91363) (not e!127224))))

(assert (=> b!193377 (= res!91363 (= (getValueByKey!241 (toList!1222 lt!96189) (_1!1763 (tuple2!3505 key!828 v!309))) (Some!246 (_2!1763 (tuple2!3505 key!828 v!309)))))))

(declare-fun b!193378 () Bool)

(declare-fun contains!1351 (List!2421 tuple2!3504) Bool)

(assert (=> b!193378 (= e!127224 (contains!1351 (toList!1222 lt!96189) (tuple2!3505 key!828 v!309)))))

(assert (= (and d!56441 res!91364) b!193377))

(assert (= (and b!193377 res!91363) b!193378))

(declare-fun m!219685 () Bool)

(assert (=> d!56441 m!219685))

(declare-fun m!219687 () Bool)

(assert (=> d!56441 m!219687))

(declare-fun m!219689 () Bool)

(assert (=> d!56441 m!219689))

(declare-fun m!219691 () Bool)

(assert (=> d!56441 m!219691))

(declare-fun m!219693 () Bool)

(assert (=> b!193377 m!219693))

(declare-fun m!219695 () Bool)

(assert (=> b!193378 m!219695))

(assert (=> b!193159 d!56441))

(declare-fun bm!19533 () Bool)

(declare-fun call!19538 () ListLongMap!2413)

(declare-fun call!19539 () ListLongMap!2413)

(assert (=> bm!19533 (= call!19538 call!19539)))

(declare-fun b!193379 () Bool)

(declare-fun e!127234 () ListLongMap!2413)

(declare-fun call!19542 () ListLongMap!2413)

(assert (=> b!193379 (= e!127234 call!19542)))

(declare-fun b!193380 () Bool)

(declare-fun e!127226 () Bool)

(declare-fun e!127237 () Bool)

(assert (=> b!193380 (= e!127226 e!127237)))

(declare-fun res!91367 () Bool)

(declare-fun call!19537 () Bool)

(assert (=> b!193380 (= res!91367 call!19537)))

(assert (=> b!193380 (=> (not res!91367) (not e!127237))))

(declare-fun b!193381 () Bool)

(declare-fun e!127233 () Unit!5801)

(declare-fun lt!96191 () Unit!5801)

(assert (=> b!193381 (= e!127233 lt!96191)))

(declare-fun lt!96190 () ListLongMap!2413)

(assert (=> b!193381 (= lt!96190 (getCurrentListMapNoExtraKeys!207 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96193 () (_ BitVec 64))

(assert (=> b!193381 (= lt!96193 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96201 () (_ BitVec 64))

(assert (=> b!193381 (= lt!96201 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96205 () Unit!5801)

(assert (=> b!193381 (= lt!96205 (addStillContains!162 lt!96190 lt!96193 (zeroValue!3786 thiss!1248) lt!96201))))

(assert (=> b!193381 (contains!1349 (+!314 lt!96190 (tuple2!3505 lt!96193 (zeroValue!3786 thiss!1248))) lt!96201)))

(declare-fun lt!96198 () Unit!5801)

(assert (=> b!193381 (= lt!96198 lt!96205)))

(declare-fun lt!96197 () ListLongMap!2413)

(assert (=> b!193381 (= lt!96197 (getCurrentListMapNoExtraKeys!207 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96209 () (_ BitVec 64))

(assert (=> b!193381 (= lt!96209 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96194 () (_ BitVec 64))

(assert (=> b!193381 (= lt!96194 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96200 () Unit!5801)

(assert (=> b!193381 (= lt!96200 (addApplyDifferent!162 lt!96197 lt!96209 (minValue!3786 thiss!1248) lt!96194))))

(assert (=> b!193381 (= (apply!186 (+!314 lt!96197 (tuple2!3505 lt!96209 (minValue!3786 thiss!1248))) lt!96194) (apply!186 lt!96197 lt!96194))))

(declare-fun lt!96192 () Unit!5801)

(assert (=> b!193381 (= lt!96192 lt!96200)))

(declare-fun lt!96199 () ListLongMap!2413)

(assert (=> b!193381 (= lt!96199 (getCurrentListMapNoExtraKeys!207 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96202 () (_ BitVec 64))

(assert (=> b!193381 (= lt!96202 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96208 () (_ BitVec 64))

(assert (=> b!193381 (= lt!96208 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96206 () Unit!5801)

(assert (=> b!193381 (= lt!96206 (addApplyDifferent!162 lt!96199 lt!96202 (zeroValue!3786 thiss!1248) lt!96208))))

(assert (=> b!193381 (= (apply!186 (+!314 lt!96199 (tuple2!3505 lt!96202 (zeroValue!3786 thiss!1248))) lt!96208) (apply!186 lt!96199 lt!96208))))

(declare-fun lt!96207 () Unit!5801)

(assert (=> b!193381 (= lt!96207 lt!96206)))

(declare-fun lt!96195 () ListLongMap!2413)

(assert (=> b!193381 (= lt!96195 (getCurrentListMapNoExtraKeys!207 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96204 () (_ BitVec 64))

(assert (=> b!193381 (= lt!96204 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96196 () (_ BitVec 64))

(assert (=> b!193381 (= lt!96196 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193381 (= lt!96191 (addApplyDifferent!162 lt!96195 lt!96204 (minValue!3786 thiss!1248) lt!96196))))

(assert (=> b!193381 (= (apply!186 (+!314 lt!96195 (tuple2!3505 lt!96204 (minValue!3786 thiss!1248))) lt!96196) (apply!186 lt!96195 lt!96196))))

(declare-fun d!56443 () Bool)

(declare-fun e!127232 () Bool)

(assert (=> d!56443 e!127232))

(declare-fun res!91368 () Bool)

(assert (=> d!56443 (=> (not res!91368) (not e!127232))))

(assert (=> d!56443 (= res!91368 (or (bvsge #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))))))))

(declare-fun lt!96210 () ListLongMap!2413)

(declare-fun lt!96211 () ListLongMap!2413)

(assert (=> d!56443 (= lt!96210 lt!96211)))

(declare-fun lt!96203 () Unit!5801)

(assert (=> d!56443 (= lt!96203 e!127233)))

(declare-fun c!34877 () Bool)

(declare-fun e!127236 () Bool)

(assert (=> d!56443 (= c!34877 e!127236)))

(declare-fun res!91365 () Bool)

(assert (=> d!56443 (=> (not res!91365) (not e!127236))))

(assert (=> d!56443 (= res!91365 (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))))))

(declare-fun e!127225 () ListLongMap!2413)

(assert (=> d!56443 (= lt!96211 e!127225)))

(declare-fun c!34881 () Bool)

(assert (=> d!56443 (= c!34881 (and (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56443 (validMask!0 (mask!9195 thiss!1248))))

(assert (=> d!56443 (= (getCurrentListMap!855 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)) lt!96210)))

(declare-fun b!193382 () Bool)

(assert (=> b!193382 (= e!127237 (= (apply!186 lt!96210 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3786 thiss!1248)))))

(declare-fun b!193383 () Bool)

(declare-fun e!127231 () Bool)

(declare-fun call!19540 () Bool)

(assert (=> b!193383 (= e!127231 (not call!19540))))

(declare-fun b!193384 () Bool)

(declare-fun call!19536 () ListLongMap!2413)

(assert (=> b!193384 (= e!127225 (+!314 call!19536 (tuple2!3505 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3786 thiss!1248))))))

(declare-fun b!193385 () Bool)

(declare-fun e!127227 () Bool)

(assert (=> b!193385 (= e!127227 (= (apply!186 lt!96210 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000)) (get!2225 (select (arr!3851 (_values!3928 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!520 (defaultEntry!3945 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4176 (_values!3928 thiss!1248))))))

(assert (=> b!193385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))))))

(declare-fun b!193386 () Bool)

(assert (=> b!193386 (= e!127236 (validKeyInArray!0 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193387 () Bool)

(declare-fun e!127230 () Bool)

(assert (=> b!193387 (= e!127230 (validKeyInArray!0 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193388 () Bool)

(assert (=> b!193388 (= e!127226 (not call!19537))))

(declare-fun call!19541 () ListLongMap!2413)

(declare-fun c!34879 () Bool)

(declare-fun bm!19534 () Bool)

(assert (=> bm!19534 (= call!19536 (+!314 (ite c!34881 call!19539 (ite c!34879 call!19538 call!19541)) (ite (or c!34881 c!34879) (tuple2!3505 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3786 thiss!1248)) (tuple2!3505 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3786 thiss!1248)))))))

(declare-fun bm!19535 () Bool)

(assert (=> bm!19535 (= call!19541 call!19538)))

(declare-fun b!193389 () Bool)

(declare-fun c!34878 () Bool)

(assert (=> b!193389 (= c!34878 (and (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127235 () ListLongMap!2413)

(assert (=> b!193389 (= e!127234 e!127235)))

(declare-fun b!193390 () Bool)

(assert (=> b!193390 (= e!127235 call!19541)))

(declare-fun bm!19536 () Bool)

(assert (=> bm!19536 (= call!19540 (contains!1349 lt!96210 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193391 () Bool)

(declare-fun e!127228 () Bool)

(assert (=> b!193391 (= e!127228 (= (apply!186 lt!96210 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3786 thiss!1248)))))

(declare-fun b!193392 () Bool)

(declare-fun Unit!5809 () Unit!5801)

(assert (=> b!193392 (= e!127233 Unit!5809)))

(declare-fun b!193393 () Bool)

(declare-fun e!127229 () Bool)

(assert (=> b!193393 (= e!127229 e!127227)))

(declare-fun res!91372 () Bool)

(assert (=> b!193393 (=> (not res!91372) (not e!127227))))

(assert (=> b!193393 (= res!91372 (contains!1349 lt!96210 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193393 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))))))

(declare-fun b!193394 () Bool)

(assert (=> b!193394 (= e!127231 e!127228)))

(declare-fun res!91373 () Bool)

(assert (=> b!193394 (= res!91373 call!19540)))

(assert (=> b!193394 (=> (not res!91373) (not e!127228))))

(declare-fun b!193395 () Bool)

(assert (=> b!193395 (= e!127235 call!19542)))

(declare-fun bm!19537 () Bool)

(assert (=> bm!19537 (= call!19542 call!19536)))

(declare-fun bm!19538 () Bool)

(assert (=> bm!19538 (= call!19539 (getCurrentListMapNoExtraKeys!207 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun bm!19539 () Bool)

(assert (=> bm!19539 (= call!19537 (contains!1349 lt!96210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193396 () Bool)

(assert (=> b!193396 (= e!127225 e!127234)))

(assert (=> b!193396 (= c!34879 (and (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193397 () Bool)

(declare-fun res!91366 () Bool)

(assert (=> b!193397 (=> (not res!91366) (not e!127232))))

(assert (=> b!193397 (= res!91366 e!127226)))

(declare-fun c!34876 () Bool)

(assert (=> b!193397 (= c!34876 (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193398 () Bool)

(assert (=> b!193398 (= e!127232 e!127231)))

(declare-fun c!34880 () Bool)

(assert (=> b!193398 (= c!34880 (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193399 () Bool)

(declare-fun res!91371 () Bool)

(assert (=> b!193399 (=> (not res!91371) (not e!127232))))

(assert (=> b!193399 (= res!91371 e!127229)))

(declare-fun res!91370 () Bool)

(assert (=> b!193399 (=> res!91370 e!127229)))

(assert (=> b!193399 (= res!91370 (not e!127230))))

(declare-fun res!91369 () Bool)

(assert (=> b!193399 (=> (not res!91369) (not e!127230))))

(assert (=> b!193399 (= res!91369 (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))))))

(assert (= (and d!56443 c!34881) b!193384))

(assert (= (and d!56443 (not c!34881)) b!193396))

(assert (= (and b!193396 c!34879) b!193379))

(assert (= (and b!193396 (not c!34879)) b!193389))

(assert (= (and b!193389 c!34878) b!193395))

(assert (= (and b!193389 (not c!34878)) b!193390))

(assert (= (or b!193395 b!193390) bm!19535))

(assert (= (or b!193379 bm!19535) bm!19533))

(assert (= (or b!193379 b!193395) bm!19537))

(assert (= (or b!193384 bm!19533) bm!19538))

(assert (= (or b!193384 bm!19537) bm!19534))

(assert (= (and d!56443 res!91365) b!193386))

(assert (= (and d!56443 c!34877) b!193381))

(assert (= (and d!56443 (not c!34877)) b!193392))

(assert (= (and d!56443 res!91368) b!193399))

(assert (= (and b!193399 res!91369) b!193387))

(assert (= (and b!193399 (not res!91370)) b!193393))

(assert (= (and b!193393 res!91372) b!193385))

(assert (= (and b!193399 res!91371) b!193397))

(assert (= (and b!193397 c!34876) b!193380))

(assert (= (and b!193397 (not c!34876)) b!193388))

(assert (= (and b!193380 res!91367) b!193382))

(assert (= (or b!193380 b!193388) bm!19539))

(assert (= (and b!193397 res!91366) b!193398))

(assert (= (and b!193398 c!34880) b!193394))

(assert (= (and b!193398 (not c!34880)) b!193383))

(assert (= (and b!193394 res!91373) b!193391))

(assert (= (or b!193394 b!193383) bm!19536))

(declare-fun b_lambda!7447 () Bool)

(assert (=> (not b_lambda!7447) (not b!193385)))

(assert (=> b!193385 t!7337))

(declare-fun b_and!11393 () Bool)

(assert (= b_and!11391 (and (=> t!7337 result!4919) b_and!11393)))

(declare-fun m!219697 () Bool)

(assert (=> b!193384 m!219697))

(declare-fun m!219699 () Bool)

(assert (=> b!193382 m!219699))

(assert (=> b!193387 m!219591))

(assert (=> b!193387 m!219591))

(assert (=> b!193387 m!219601))

(assert (=> b!193393 m!219591))

(assert (=> b!193393 m!219591))

(declare-fun m!219701 () Bool)

(assert (=> b!193393 m!219701))

(declare-fun m!219703 () Bool)

(assert (=> b!193391 m!219703))

(declare-fun m!219705 () Bool)

(assert (=> bm!19538 m!219705))

(declare-fun m!219707 () Bool)

(assert (=> bm!19536 m!219707))

(declare-fun m!219709 () Bool)

(assert (=> b!193381 m!219709))

(declare-fun m!219711 () Bool)

(assert (=> b!193381 m!219711))

(assert (=> b!193381 m!219709))

(declare-fun m!219713 () Bool)

(assert (=> b!193381 m!219713))

(assert (=> b!193381 m!219713))

(declare-fun m!219715 () Bool)

(assert (=> b!193381 m!219715))

(declare-fun m!219717 () Bool)

(assert (=> b!193381 m!219717))

(declare-fun m!219719 () Bool)

(assert (=> b!193381 m!219719))

(assert (=> b!193381 m!219591))

(assert (=> b!193381 m!219705))

(declare-fun m!219721 () Bool)

(assert (=> b!193381 m!219721))

(declare-fun m!219723 () Bool)

(assert (=> b!193381 m!219723))

(declare-fun m!219725 () Bool)

(assert (=> b!193381 m!219725))

(declare-fun m!219727 () Bool)

(assert (=> b!193381 m!219727))

(declare-fun m!219729 () Bool)

(assert (=> b!193381 m!219729))

(declare-fun m!219731 () Bool)

(assert (=> b!193381 m!219731))

(declare-fun m!219733 () Bool)

(assert (=> b!193381 m!219733))

(assert (=> b!193381 m!219721))

(declare-fun m!219735 () Bool)

(assert (=> b!193381 m!219735))

(assert (=> b!193381 m!219717))

(declare-fun m!219737 () Bool)

(assert (=> b!193381 m!219737))

(declare-fun m!219739 () Bool)

(assert (=> bm!19534 m!219739))

(declare-fun m!219741 () Bool)

(assert (=> bm!19539 m!219741))

(assert (=> d!56443 m!219505))

(assert (=> b!193386 m!219591))

(assert (=> b!193386 m!219591))

(assert (=> b!193386 m!219601))

(assert (=> b!193385 m!219591))

(declare-fun m!219743 () Bool)

(assert (=> b!193385 m!219743))

(assert (=> b!193385 m!219591))

(assert (=> b!193385 m!219671))

(declare-fun m!219745 () Bool)

(assert (=> b!193385 m!219745))

(assert (=> b!193385 m!219671))

(declare-fun m!219747 () Bool)

(assert (=> b!193385 m!219747))

(assert (=> b!193385 m!219745))

(assert (=> b!193159 d!56443))

(declare-fun d!56445 () Bool)

(declare-fun e!127240 () Bool)

(assert (=> d!56445 e!127240))

(declare-fun res!91376 () Bool)

(assert (=> d!56445 (=> (not res!91376) (not e!127240))))

(assert (=> d!56445 (= res!91376 (and (bvsge (index!4935 lt!96040) #b00000000000000000000000000000000) (bvslt (index!4935 lt!96040) (size!4176 (_values!3928 thiss!1248)))))))

(declare-fun lt!96214 () Unit!5801)

(declare-fun choose!1066 (array!8181 array!8183 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 32) (_ BitVec 64) V!5617 Int) Unit!5801)

(assert (=> d!56445 (= lt!96214 (choose!1066 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) (index!4935 lt!96040) key!828 v!309 (defaultEntry!3945 thiss!1248)))))

(assert (=> d!56445 (validMask!0 (mask!9195 thiss!1248))))

(assert (=> d!56445 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!130 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) (index!4935 lt!96040) key!828 v!309 (defaultEntry!3945 thiss!1248)) lt!96214)))

(declare-fun b!193402 () Bool)

(assert (=> b!193402 (= e!127240 (= (+!314 (getCurrentListMap!855 (_keys!5934 thiss!1248) (_values!3928 thiss!1248) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)) (tuple2!3505 key!828 v!309)) (getCurrentListMap!855 (_keys!5934 thiss!1248) (array!8184 (store (arr!3851 (_values!3928 thiss!1248)) (index!4935 lt!96040) (ValueCellFull!1895 v!309)) (size!4176 (_values!3928 thiss!1248))) (mask!9195 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248))))))

(assert (= (and d!56445 res!91376) b!193402))

(declare-fun m!219749 () Bool)

(assert (=> d!56445 m!219749))

(assert (=> d!56445 m!219505))

(assert (=> b!193402 m!219495))

(assert (=> b!193402 m!219495))

(declare-fun m!219751 () Bool)

(assert (=> b!193402 m!219751))

(assert (=> b!193402 m!219497))

(assert (=> b!193402 m!219503))

(assert (=> b!193159 d!56445))

(declare-fun d!56447 () Bool)

(assert (=> d!56447 (= (array_inv!2501 (_keys!5934 thiss!1248)) (bvsge (size!4175 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193160 d!56447))

(declare-fun d!56449 () Bool)

(assert (=> d!56449 (= (array_inv!2502 (_values!3928 thiss!1248)) (bvsge (size!4176 (_values!3928 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193160 d!56449))

(declare-fun e!127249 () SeekEntryResult!691)

(declare-fun lt!96221 () SeekEntryResult!691)

(declare-fun b!193415 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8181 (_ BitVec 32)) SeekEntryResult!691)

(assert (=> b!193415 (= e!127249 (seekKeyOrZeroReturnVacant!0 (x!20650 lt!96221) (index!4936 lt!96221) (index!4936 lt!96221) key!828 (_keys!5934 thiss!1248) (mask!9195 thiss!1248)))))

(declare-fun b!193416 () Bool)

(declare-fun e!127247 () SeekEntryResult!691)

(assert (=> b!193416 (= e!127247 Undefined!691)))

(declare-fun b!193418 () Bool)

(assert (=> b!193418 (= e!127249 (MissingZero!691 (index!4936 lt!96221)))))

(declare-fun b!193419 () Bool)

(declare-fun c!34888 () Bool)

(declare-fun lt!96222 () (_ BitVec 64))

(assert (=> b!193419 (= c!34888 (= lt!96222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127248 () SeekEntryResult!691)

(assert (=> b!193419 (= e!127248 e!127249)))

(declare-fun b!193420 () Bool)

(assert (=> b!193420 (= e!127248 (Found!691 (index!4936 lt!96221)))))

(declare-fun b!193417 () Bool)

(assert (=> b!193417 (= e!127247 e!127248)))

(assert (=> b!193417 (= lt!96222 (select (arr!3850 (_keys!5934 thiss!1248)) (index!4936 lt!96221)))))

(declare-fun c!34890 () Bool)

(assert (=> b!193417 (= c!34890 (= lt!96222 key!828))))

(declare-fun d!56451 () Bool)

(declare-fun lt!96223 () SeekEntryResult!691)

(assert (=> d!56451 (and (or ((_ is Undefined!691) lt!96223) (not ((_ is Found!691) lt!96223)) (and (bvsge (index!4935 lt!96223) #b00000000000000000000000000000000) (bvslt (index!4935 lt!96223) (size!4175 (_keys!5934 thiss!1248))))) (or ((_ is Undefined!691) lt!96223) ((_ is Found!691) lt!96223) (not ((_ is MissingZero!691) lt!96223)) (and (bvsge (index!4934 lt!96223) #b00000000000000000000000000000000) (bvslt (index!4934 lt!96223) (size!4175 (_keys!5934 thiss!1248))))) (or ((_ is Undefined!691) lt!96223) ((_ is Found!691) lt!96223) ((_ is MissingZero!691) lt!96223) (not ((_ is MissingVacant!691) lt!96223)) (and (bvsge (index!4937 lt!96223) #b00000000000000000000000000000000) (bvslt (index!4937 lt!96223) (size!4175 (_keys!5934 thiss!1248))))) (or ((_ is Undefined!691) lt!96223) (ite ((_ is Found!691) lt!96223) (= (select (arr!3850 (_keys!5934 thiss!1248)) (index!4935 lt!96223)) key!828) (ite ((_ is MissingZero!691) lt!96223) (= (select (arr!3850 (_keys!5934 thiss!1248)) (index!4934 lt!96223)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!691) lt!96223) (= (select (arr!3850 (_keys!5934 thiss!1248)) (index!4937 lt!96223)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56451 (= lt!96223 e!127247)))

(declare-fun c!34889 () Bool)

(assert (=> d!56451 (= c!34889 (and ((_ is Intermediate!691) lt!96221) (undefined!1503 lt!96221)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8181 (_ BitVec 32)) SeekEntryResult!691)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56451 (= lt!96221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9195 thiss!1248)) key!828 (_keys!5934 thiss!1248) (mask!9195 thiss!1248)))))

(assert (=> d!56451 (validMask!0 (mask!9195 thiss!1248))))

(assert (=> d!56451 (= (seekEntryOrOpen!0 key!828 (_keys!5934 thiss!1248) (mask!9195 thiss!1248)) lt!96223)))

(assert (= (and d!56451 c!34889) b!193416))

(assert (= (and d!56451 (not c!34889)) b!193417))

(assert (= (and b!193417 c!34890) b!193420))

(assert (= (and b!193417 (not c!34890)) b!193419))

(assert (= (and b!193419 c!34888) b!193418))

(assert (= (and b!193419 (not c!34888)) b!193415))

(declare-fun m!219753 () Bool)

(assert (=> b!193415 m!219753))

(declare-fun m!219755 () Bool)

(assert (=> b!193417 m!219755))

(assert (=> d!56451 m!219505))

(declare-fun m!219757 () Bool)

(assert (=> d!56451 m!219757))

(declare-fun m!219759 () Bool)

(assert (=> d!56451 m!219759))

(declare-fun m!219761 () Bool)

(assert (=> d!56451 m!219761))

(declare-fun m!219763 () Bool)

(assert (=> d!56451 m!219763))

(assert (=> d!56451 m!219761))

(declare-fun m!219765 () Bool)

(assert (=> d!56451 m!219765))

(assert (=> b!193151 d!56451))

(declare-fun bm!19542 () Bool)

(declare-fun call!19545 () Bool)

(declare-fun c!34893 () Bool)

(assert (=> bm!19542 (= call!19545 (arrayNoDuplicates!0 (_keys!5934 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34893 (Cons!2416 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000) Nil!2417) Nil!2417)))))

(declare-fun b!193432 () Bool)

(declare-fun e!127260 () Bool)

(assert (=> b!193432 (= e!127260 call!19545)))

(declare-fun b!193433 () Bool)

(assert (=> b!193433 (= e!127260 call!19545)))

(declare-fun b!193434 () Bool)

(declare-fun e!127258 () Bool)

(assert (=> b!193434 (= e!127258 e!127260)))

(assert (=> b!193434 (= c!34893 (validKeyInArray!0 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193435 () Bool)

(declare-fun e!127259 () Bool)

(assert (=> b!193435 (= e!127259 e!127258)))

(declare-fun res!91384 () Bool)

(assert (=> b!193435 (=> (not res!91384) (not e!127258))))

(declare-fun e!127261 () Bool)

(assert (=> b!193435 (= res!91384 (not e!127261))))

(declare-fun res!91383 () Bool)

(assert (=> b!193435 (=> (not res!91383) (not e!127261))))

(assert (=> b!193435 (= res!91383 (validKeyInArray!0 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56453 () Bool)

(declare-fun res!91385 () Bool)

(assert (=> d!56453 (=> res!91385 e!127259)))

(assert (=> d!56453 (= res!91385 (bvsge #b00000000000000000000000000000000 (size!4175 (_keys!5934 thiss!1248))))))

(assert (=> d!56453 (= (arrayNoDuplicates!0 (_keys!5934 thiss!1248) #b00000000000000000000000000000000 Nil!2417) e!127259)))

(declare-fun b!193431 () Bool)

(declare-fun contains!1352 (List!2420 (_ BitVec 64)) Bool)

(assert (=> b!193431 (= e!127261 (contains!1352 Nil!2417 (select (arr!3850 (_keys!5934 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!56453 (not res!91385)) b!193435))

(assert (= (and b!193435 res!91383) b!193431))

(assert (= (and b!193435 res!91384) b!193434))

(assert (= (and b!193434 c!34893) b!193433))

(assert (= (and b!193434 (not c!34893)) b!193432))

(assert (= (or b!193433 b!193432) bm!19542))

(assert (=> bm!19542 m!219591))

(declare-fun m!219767 () Bool)

(assert (=> bm!19542 m!219767))

(assert (=> b!193434 m!219591))

(assert (=> b!193434 m!219591))

(assert (=> b!193434 m!219601))

(assert (=> b!193435 m!219591))

(assert (=> b!193435 m!219591))

(assert (=> b!193435 m!219601))

(assert (=> b!193431 m!219591))

(assert (=> b!193431 m!219591))

(declare-fun m!219769 () Bool)

(assert (=> b!193431 m!219769))

(assert (=> b!193157 d!56453))

(declare-fun b!193443 () Bool)

(declare-fun e!127266 () Bool)

(assert (=> b!193443 (= e!127266 tp_is_empty!4477)))

(declare-fun b!193442 () Bool)

(declare-fun e!127267 () Bool)

(assert (=> b!193442 (= e!127267 tp_is_empty!4477)))

(declare-fun condMapEmpty!7751 () Bool)

(declare-fun mapDefault!7751 () ValueCell!1895)

(assert (=> mapNonEmpty!7742 (= condMapEmpty!7751 (= mapRest!7742 ((as const (Array (_ BitVec 32) ValueCell!1895)) mapDefault!7751)))))

(declare-fun mapRes!7751 () Bool)

(assert (=> mapNonEmpty!7742 (= tp!16978 (and e!127266 mapRes!7751))))

(declare-fun mapNonEmpty!7751 () Bool)

(declare-fun tp!16994 () Bool)

(assert (=> mapNonEmpty!7751 (= mapRes!7751 (and tp!16994 e!127267))))

(declare-fun mapRest!7751 () (Array (_ BitVec 32) ValueCell!1895))

(declare-fun mapKey!7751 () (_ BitVec 32))

(declare-fun mapValue!7751 () ValueCell!1895)

(assert (=> mapNonEmpty!7751 (= mapRest!7742 (store mapRest!7751 mapKey!7751 mapValue!7751))))

(declare-fun mapIsEmpty!7751 () Bool)

(assert (=> mapIsEmpty!7751 mapRes!7751))

(assert (= (and mapNonEmpty!7742 condMapEmpty!7751) mapIsEmpty!7751))

(assert (= (and mapNonEmpty!7742 (not condMapEmpty!7751)) mapNonEmpty!7751))

(assert (= (and mapNonEmpty!7751 ((_ is ValueCellFull!1895) mapValue!7751)) b!193442))

(assert (= (and mapNonEmpty!7742 ((_ is ValueCellFull!1895) mapDefault!7751)) b!193443))

(declare-fun m!219771 () Bool)

(assert (=> mapNonEmpty!7751 m!219771))

(declare-fun b_lambda!7449 () Bool)

(assert (= b_lambda!7445 (or (and b!193160 b_free!4705) b_lambda!7449)))

(declare-fun b_lambda!7451 () Bool)

(assert (= b_lambda!7447 (or (and b!193160 b_free!4705) b_lambda!7451)))

(check-sat (not bm!19534) (not bm!19527) (not bm!19510) (not b!193264) (not b!193434) (not b!193382) (not b!193435) (not b!193387) (not bm!19505) (not b!193355) (not b_next!4705) (not d!56443) (not d!56433) (not b!193391) (not b!193272) (not d!56451) (not b!193370) (not b!193415) (not b!193377) (not b!193381) (not b!193344) (not d!56441) (not d!56445) (not bm!19532) (not b!193378) (not bm!19531) (not bm!19542) (not b_lambda!7449) (not b_lambda!7451) (not b!193258) (not bm!19511) (not bm!19539) (not bm!19529) (not b!193348) (not b!193349) (not b!193347) (not b!193386) tp_is_empty!4477 b_and!11393 (not d!56431) (not b!193343) (not b!193384) (not bm!19536) (not b!193273) (not b!193402) (not b!193256) (not b!193393) (not b!193353) (not d!56437) (not d!56427) (not mapNonEmpty!7751) (not b!193431) (not d!56435) (not bm!19538) (not b!193346) (not b!193274) (not b!193385) (not b!193372))
(check-sat b_and!11393 (not b_next!4705))
