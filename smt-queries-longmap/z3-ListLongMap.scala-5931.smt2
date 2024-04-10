; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77340 () Bool)

(assert start!77340)

(declare-fun b!902019 () Bool)

(declare-fun b_free!16089 () Bool)

(declare-fun b_next!16089 () Bool)

(assert (=> b!902019 (= b_free!16089 (not b_next!16089))))

(declare-fun tp!56373 () Bool)

(declare-fun b_and!26451 () Bool)

(assert (=> b!902019 (= tp!56373 b_and!26451)))

(declare-fun b!902014 () Bool)

(declare-fun e!505065 () Bool)

(declare-datatypes ((array!52894 0))(
  ( (array!52895 (arr!25413 (Array (_ BitVec 32) (_ BitVec 64))) (size!25872 (_ BitVec 32))) )
))
(declare-datatypes ((V!29521 0))(
  ( (V!29522 (val!9259 Int)) )
))
(declare-datatypes ((ValueCell!8727 0))(
  ( (ValueCellFull!8727 (v!11761 V!29521)) (EmptyCell!8727) )
))
(declare-datatypes ((array!52896 0))(
  ( (array!52897 (arr!25414 (Array (_ BitVec 32) ValueCell!8727)) (size!25873 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4470 0))(
  ( (LongMapFixedSize!4471 (defaultEntry!5481 Int) (mask!26301 (_ BitVec 32)) (extraKeys!5212 (_ BitVec 32)) (zeroValue!5316 V!29521) (minValue!5316 V!29521) (_size!2290 (_ BitVec 32)) (_keys!10298 array!52894) (_values!5503 array!52896) (_vacant!2290 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4470)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun dynLambda!1317 (Int (_ BitVec 64)) V!29521)

(declare-datatypes ((Option!473 0))(
  ( (Some!472 (v!11762 V!29521)) (None!471) )
))
(declare-fun get!13377 (Option!473) V!29521)

(declare-datatypes ((tuple2!12080 0))(
  ( (tuple2!12081 (_1!6051 (_ BitVec 64)) (_2!6051 V!29521)) )
))
(declare-datatypes ((List!17880 0))(
  ( (Nil!17877) (Cons!17876 (h!19022 tuple2!12080) (t!25261 List!17880)) )
))
(declare-fun getValueByKey!467 (List!17880 (_ BitVec 64)) Option!473)

(declare-datatypes ((ListLongMap!10777 0))(
  ( (ListLongMap!10778 (toList!5404 List!17880)) )
))
(declare-fun map!12301 (LongMapFixedSize!4470) ListLongMap!10777)

(assert (=> b!902014 (= e!505065 (= (dynLambda!1317 (defaultEntry!5481 thiss!1181) key!785) (get!13377 (getValueByKey!467 (toList!5404 (map!12301 thiss!1181)) key!785))))))

(declare-fun res!608844 () Bool)

(declare-fun e!505068 () Bool)

(assert (=> start!77340 (=> (not res!608844) (not e!505068))))

(declare-fun valid!1717 (LongMapFixedSize!4470) Bool)

(assert (=> start!77340 (= res!608844 (valid!1717 thiss!1181))))

(assert (=> start!77340 e!505068))

(declare-fun e!505069 () Bool)

(assert (=> start!77340 e!505069))

(assert (=> start!77340 true))

(declare-fun b!902015 () Bool)

(declare-fun res!608841 () Bool)

(assert (=> b!902015 (=> res!608841 e!505065)))

(declare-fun contains!4447 (LongMapFixedSize!4470 (_ BitVec 64)) Bool)

(assert (=> b!902015 (= res!608841 (not (contains!4447 thiss!1181 key!785)))))

(declare-fun b!902016 () Bool)

(declare-fun e!505072 () Bool)

(declare-fun tp_is_empty!18417 () Bool)

(assert (=> b!902016 (= e!505072 tp_is_empty!18417)))

(declare-fun b!902017 () Bool)

(declare-fun e!505070 () Bool)

(assert (=> b!902017 (= e!505070 tp_is_empty!18417)))

(declare-fun mapNonEmpty!29317 () Bool)

(declare-fun mapRes!29317 () Bool)

(declare-fun tp!56372 () Bool)

(assert (=> mapNonEmpty!29317 (= mapRes!29317 (and tp!56372 e!505070))))

(declare-fun mapKey!29317 () (_ BitVec 32))

(declare-fun mapRest!29317 () (Array (_ BitVec 32) ValueCell!8727))

(declare-fun mapValue!29317 () ValueCell!8727)

(assert (=> mapNonEmpty!29317 (= (arr!25414 (_values!5503 thiss!1181)) (store mapRest!29317 mapKey!29317 mapValue!29317))))

(declare-fun b!902018 () Bool)

(declare-fun res!608843 () Bool)

(assert (=> b!902018 (=> (not res!608843) (not e!505068))))

(assert (=> b!902018 (= res!608843 (not (= key!785 (bvneg key!785))))))

(declare-fun e!505066 () Bool)

(declare-fun array_inv!19930 (array!52894) Bool)

(declare-fun array_inv!19931 (array!52896) Bool)

(assert (=> b!902019 (= e!505069 (and tp!56373 tp_is_empty!18417 (array_inv!19930 (_keys!10298 thiss!1181)) (array_inv!19931 (_values!5503 thiss!1181)) e!505066))))

(declare-fun b!902020 () Bool)

(assert (=> b!902020 (= e!505066 (and e!505072 mapRes!29317))))

(declare-fun condMapEmpty!29317 () Bool)

(declare-fun mapDefault!29317 () ValueCell!8727)

(assert (=> b!902020 (= condMapEmpty!29317 (= (arr!25414 (_values!5503 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8727)) mapDefault!29317)))))

(declare-fun b!902021 () Bool)

(assert (=> b!902021 (= e!505068 (not e!505065))))

(declare-fun res!608842 () Bool)

(assert (=> b!902021 (=> res!608842 e!505065)))

(declare-datatypes ((SeekEntryResult!8956 0))(
  ( (MissingZero!8956 (index!38195 (_ BitVec 32))) (Found!8956 (index!38196 (_ BitVec 32))) (Intermediate!8956 (undefined!9768 Bool) (index!38197 (_ BitVec 32)) (x!76857 (_ BitVec 32))) (Undefined!8956) (MissingVacant!8956 (index!38198 (_ BitVec 32))) )
))
(declare-fun lt!407767 () SeekEntryResult!8956)

(get-info :version)

(assert (=> b!902021 (= res!608842 ((_ is Found!8956) lt!407767))))

(declare-fun e!505071 () Bool)

(assert (=> b!902021 e!505071))

(declare-fun res!608840 () Bool)

(assert (=> b!902021 (=> res!608840 e!505071)))

(assert (=> b!902021 (= res!608840 (not ((_ is Found!8956) lt!407767)))))

(declare-datatypes ((Unit!30632 0))(
  ( (Unit!30633) )
))
(declare-fun lt!407768 () Unit!30632)

(declare-fun lemmaSeekEntryGivesInRangeIndex!115 (array!52894 array!52896 (_ BitVec 32) (_ BitVec 32) V!29521 V!29521 (_ BitVec 64)) Unit!30632)

(assert (=> b!902021 (= lt!407768 (lemmaSeekEntryGivesInRangeIndex!115 (_keys!10298 thiss!1181) (_values!5503 thiss!1181) (mask!26301 thiss!1181) (extraKeys!5212 thiss!1181) (zeroValue!5316 thiss!1181) (minValue!5316 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52894 (_ BitVec 32)) SeekEntryResult!8956)

(assert (=> b!902021 (= lt!407767 (seekEntry!0 key!785 (_keys!10298 thiss!1181) (mask!26301 thiss!1181)))))

(declare-fun mapIsEmpty!29317 () Bool)

(assert (=> mapIsEmpty!29317 mapRes!29317))

(declare-fun b!902022 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!902022 (= e!505071 (inRange!0 (index!38196 lt!407767) (mask!26301 thiss!1181)))))

(assert (= (and start!77340 res!608844) b!902018))

(assert (= (and b!902018 res!608843) b!902021))

(assert (= (and b!902021 (not res!608840)) b!902022))

(assert (= (and b!902021 (not res!608842)) b!902015))

(assert (= (and b!902015 (not res!608841)) b!902014))

(assert (= (and b!902020 condMapEmpty!29317) mapIsEmpty!29317))

(assert (= (and b!902020 (not condMapEmpty!29317)) mapNonEmpty!29317))

(assert (= (and mapNonEmpty!29317 ((_ is ValueCellFull!8727) mapValue!29317)) b!902017))

(assert (= (and b!902020 ((_ is ValueCellFull!8727) mapDefault!29317)) b!902016))

(assert (= b!902019 b!902020))

(assert (= start!77340 b!902019))

(declare-fun b_lambda!13081 () Bool)

(assert (=> (not b_lambda!13081) (not b!902014)))

(declare-fun t!25260 () Bool)

(declare-fun tb!5231 () Bool)

(assert (=> (and b!902019 (= (defaultEntry!5481 thiss!1181) (defaultEntry!5481 thiss!1181)) t!25260) tb!5231))

(declare-fun result!10243 () Bool)

(assert (=> tb!5231 (= result!10243 tp_is_empty!18417)))

(assert (=> b!902014 t!25260))

(declare-fun b_and!26453 () Bool)

(assert (= b_and!26451 (and (=> t!25260 result!10243) b_and!26453)))

(declare-fun m!838163 () Bool)

(assert (=> start!77340 m!838163))

(declare-fun m!838165 () Bool)

(assert (=> b!902014 m!838165))

(declare-fun m!838167 () Bool)

(assert (=> b!902014 m!838167))

(declare-fun m!838169 () Bool)

(assert (=> b!902014 m!838169))

(assert (=> b!902014 m!838169))

(declare-fun m!838171 () Bool)

(assert (=> b!902014 m!838171))

(declare-fun m!838173 () Bool)

(assert (=> b!902015 m!838173))

(declare-fun m!838175 () Bool)

(assert (=> b!902022 m!838175))

(declare-fun m!838177 () Bool)

(assert (=> mapNonEmpty!29317 m!838177))

(declare-fun m!838179 () Bool)

(assert (=> b!902021 m!838179))

(declare-fun m!838181 () Bool)

(assert (=> b!902021 m!838181))

(declare-fun m!838183 () Bool)

(assert (=> b!902019 m!838183))

(declare-fun m!838185 () Bool)

(assert (=> b!902019 m!838185))

(check-sat (not mapNonEmpty!29317) (not start!77340) (not b_lambda!13081) (not b!902015) (not b!902021) (not b!902014) (not b!902019) (not b_next!16089) b_and!26453 tp_is_empty!18417 (not b!902022))
(check-sat b_and!26453 (not b_next!16089))
(get-model)

(declare-fun b_lambda!13085 () Bool)

(assert (= b_lambda!13081 (or (and b!902019 b_free!16089) b_lambda!13085)))

(check-sat (not mapNonEmpty!29317) (not start!77340) (not b!902015) (not b_lambda!13085) (not b!902021) (not b!902014) (not b!902019) (not b_next!16089) b_and!26453 tp_is_empty!18417 (not b!902022))
(check-sat b_and!26453 (not b_next!16089))
(get-model)

(declare-fun d!111897 () Bool)

(declare-fun res!608866 () Bool)

(declare-fun e!505099 () Bool)

(assert (=> d!111897 (=> (not res!608866) (not e!505099))))

(declare-fun simpleValid!335 (LongMapFixedSize!4470) Bool)

(assert (=> d!111897 (= res!608866 (simpleValid!335 thiss!1181))))

(assert (=> d!111897 (= (valid!1717 thiss!1181) e!505099)))

(declare-fun b!902060 () Bool)

(declare-fun res!608867 () Bool)

(assert (=> b!902060 (=> (not res!608867) (not e!505099))))

(declare-fun arrayCountValidKeys!0 (array!52894 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!902060 (= res!608867 (= (arrayCountValidKeys!0 (_keys!10298 thiss!1181) #b00000000000000000000000000000000 (size!25872 (_keys!10298 thiss!1181))) (_size!2290 thiss!1181)))))

(declare-fun b!902061 () Bool)

(declare-fun res!608868 () Bool)

(assert (=> b!902061 (=> (not res!608868) (not e!505099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52894 (_ BitVec 32)) Bool)

(assert (=> b!902061 (= res!608868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10298 thiss!1181) (mask!26301 thiss!1181)))))

(declare-fun b!902062 () Bool)

(declare-datatypes ((List!17882 0))(
  ( (Nil!17879) (Cons!17878 (h!19024 (_ BitVec 64)) (t!25265 List!17882)) )
))
(declare-fun arrayNoDuplicates!0 (array!52894 (_ BitVec 32) List!17882) Bool)

(assert (=> b!902062 (= e!505099 (arrayNoDuplicates!0 (_keys!10298 thiss!1181) #b00000000000000000000000000000000 Nil!17879))))

(assert (= (and d!111897 res!608866) b!902060))

(assert (= (and b!902060 res!608867) b!902061))

(assert (= (and b!902061 res!608868) b!902062))

(declare-fun m!838211 () Bool)

(assert (=> d!111897 m!838211))

(declare-fun m!838213 () Bool)

(assert (=> b!902060 m!838213))

(declare-fun m!838215 () Bool)

(assert (=> b!902061 m!838215))

(declare-fun m!838217 () Bool)

(assert (=> b!902062 m!838217))

(assert (=> start!77340 d!111897))

(declare-fun d!111899 () Bool)

(declare-fun e!505102 () Bool)

(assert (=> d!111899 e!505102))

(declare-fun res!608871 () Bool)

(assert (=> d!111899 (=> res!608871 e!505102)))

(declare-fun lt!407780 () SeekEntryResult!8956)

(assert (=> d!111899 (= res!608871 (not ((_ is Found!8956) lt!407780)))))

(assert (=> d!111899 (= lt!407780 (seekEntry!0 key!785 (_keys!10298 thiss!1181) (mask!26301 thiss!1181)))))

(declare-fun lt!407779 () Unit!30632)

(declare-fun choose!1526 (array!52894 array!52896 (_ BitVec 32) (_ BitVec 32) V!29521 V!29521 (_ BitVec 64)) Unit!30632)

(assert (=> d!111899 (= lt!407779 (choose!1526 (_keys!10298 thiss!1181) (_values!5503 thiss!1181) (mask!26301 thiss!1181) (extraKeys!5212 thiss!1181) (zeroValue!5316 thiss!1181) (minValue!5316 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!111899 (validMask!0 (mask!26301 thiss!1181))))

(assert (=> d!111899 (= (lemmaSeekEntryGivesInRangeIndex!115 (_keys!10298 thiss!1181) (_values!5503 thiss!1181) (mask!26301 thiss!1181) (extraKeys!5212 thiss!1181) (zeroValue!5316 thiss!1181) (minValue!5316 thiss!1181) key!785) lt!407779)))

(declare-fun b!902065 () Bool)

(assert (=> b!902065 (= e!505102 (inRange!0 (index!38196 lt!407780) (mask!26301 thiss!1181)))))

(assert (= (and d!111899 (not res!608871)) b!902065))

(assert (=> d!111899 m!838181))

(declare-fun m!838219 () Bool)

(assert (=> d!111899 m!838219))

(declare-fun m!838221 () Bool)

(assert (=> d!111899 m!838221))

(declare-fun m!838223 () Bool)

(assert (=> b!902065 m!838223))

(assert (=> b!902021 d!111899))

(declare-fun b!902079 () Bool)

(declare-fun e!505110 () SeekEntryResult!8956)

(declare-fun e!505109 () SeekEntryResult!8956)

(assert (=> b!902079 (= e!505110 e!505109)))

(declare-fun lt!407790 () (_ BitVec 64))

(declare-fun lt!407791 () SeekEntryResult!8956)

(assert (=> b!902079 (= lt!407790 (select (arr!25413 (_keys!10298 thiss!1181)) (index!38197 lt!407791)))))

(declare-fun c!95608 () Bool)

(assert (=> b!902079 (= c!95608 (= lt!407790 key!785))))

(declare-fun b!902080 () Bool)

(assert (=> b!902080 (= e!505110 Undefined!8956)))

(declare-fun b!902081 () Bool)

(declare-fun e!505111 () SeekEntryResult!8956)

(declare-fun lt!407789 () SeekEntryResult!8956)

(assert (=> b!902081 (= e!505111 (ite ((_ is MissingVacant!8956) lt!407789) (MissingZero!8956 (index!38198 lt!407789)) lt!407789))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52894 (_ BitVec 32)) SeekEntryResult!8956)

(assert (=> b!902081 (= lt!407789 (seekKeyOrZeroReturnVacant!0 (x!76857 lt!407791) (index!38197 lt!407791) (index!38197 lt!407791) key!785 (_keys!10298 thiss!1181) (mask!26301 thiss!1181)))))

(declare-fun b!902082 () Bool)

(assert (=> b!902082 (= e!505111 (MissingZero!8956 (index!38197 lt!407791)))))

(declare-fun b!902083 () Bool)

(assert (=> b!902083 (= e!505109 (Found!8956 (index!38197 lt!407791)))))

(declare-fun d!111901 () Bool)

(declare-fun lt!407792 () SeekEntryResult!8956)

(assert (=> d!111901 (and (or ((_ is MissingVacant!8956) lt!407792) (not ((_ is Found!8956) lt!407792)) (and (bvsge (index!38196 lt!407792) #b00000000000000000000000000000000) (bvslt (index!38196 lt!407792) (size!25872 (_keys!10298 thiss!1181))))) (not ((_ is MissingVacant!8956) lt!407792)) (or (not ((_ is Found!8956) lt!407792)) (= (select (arr!25413 (_keys!10298 thiss!1181)) (index!38196 lt!407792)) key!785)))))

(assert (=> d!111901 (= lt!407792 e!505110)))

(declare-fun c!95607 () Bool)

(assert (=> d!111901 (= c!95607 (and ((_ is Intermediate!8956) lt!407791) (undefined!9768 lt!407791)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52894 (_ BitVec 32)) SeekEntryResult!8956)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111901 (= lt!407791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26301 thiss!1181)) key!785 (_keys!10298 thiss!1181) (mask!26301 thiss!1181)))))

(assert (=> d!111901 (validMask!0 (mask!26301 thiss!1181))))

(assert (=> d!111901 (= (seekEntry!0 key!785 (_keys!10298 thiss!1181) (mask!26301 thiss!1181)) lt!407792)))

(declare-fun b!902078 () Bool)

(declare-fun c!95609 () Bool)

(assert (=> b!902078 (= c!95609 (= lt!407790 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!902078 (= e!505109 e!505111)))

(assert (= (and d!111901 c!95607) b!902080))

(assert (= (and d!111901 (not c!95607)) b!902079))

(assert (= (and b!902079 c!95608) b!902083))

(assert (= (and b!902079 (not c!95608)) b!902078))

(assert (= (and b!902078 c!95609) b!902082))

(assert (= (and b!902078 (not c!95609)) b!902081))

(declare-fun m!838225 () Bool)

(assert (=> b!902079 m!838225))

(declare-fun m!838227 () Bool)

(assert (=> b!902081 m!838227))

(declare-fun m!838229 () Bool)

(assert (=> d!111901 m!838229))

(declare-fun m!838231 () Bool)

(assert (=> d!111901 m!838231))

(assert (=> d!111901 m!838231))

(declare-fun m!838233 () Bool)

(assert (=> d!111901 m!838233))

(assert (=> d!111901 m!838221))

(assert (=> b!902021 d!111901))

(declare-fun d!111903 () Bool)

(assert (=> d!111903 (= (array_inv!19930 (_keys!10298 thiss!1181)) (bvsge (size!25872 (_keys!10298 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!902019 d!111903))

(declare-fun d!111905 () Bool)

(assert (=> d!111905 (= (array_inv!19931 (_values!5503 thiss!1181)) (bvsge (size!25873 (_values!5503 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!902019 d!111905))

(declare-fun b!902104 () Bool)

(declare-fun c!95621 () Bool)

(declare-fun lt!407826 () SeekEntryResult!8956)

(assert (=> b!902104 (= c!95621 ((_ is Found!8956) lt!407826))))

(assert (=> b!902104 (= lt!407826 (seekEntry!0 key!785 (_keys!10298 thiss!1181) (mask!26301 thiss!1181)))))

(declare-fun e!505122 () Bool)

(declare-fun e!505125 () Bool)

(assert (=> b!902104 (= e!505122 e!505125)))

(declare-fun b!902105 () Bool)

(assert (=> b!902105 (= e!505125 true)))

(declare-fun lt!407836 () Unit!30632)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52894 (_ BitVec 64) (_ BitVec 32)) Unit!30632)

(assert (=> b!902105 (= lt!407836 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10298 thiss!1181) key!785 (index!38196 lt!407826)))))

(declare-fun call!40233 () Bool)

(assert (=> b!902105 call!40233))

(declare-fun lt!407829 () Unit!30632)

(assert (=> b!902105 (= lt!407829 lt!407836)))

(declare-fun lt!407831 () Unit!30632)

(declare-fun lemmaValidKeyInArrayIsInListMap!263 (array!52894 array!52896 (_ BitVec 32) (_ BitVec 32) V!29521 V!29521 (_ BitVec 32) Int) Unit!30632)

(assert (=> b!902105 (= lt!407831 (lemmaValidKeyInArrayIsInListMap!263 (_keys!10298 thiss!1181) (_values!5503 thiss!1181) (mask!26301 thiss!1181) (extraKeys!5212 thiss!1181) (zeroValue!5316 thiss!1181) (minValue!5316 thiss!1181) (index!38196 lt!407826) (defaultEntry!5481 thiss!1181)))))

(declare-fun call!40232 () Bool)

(assert (=> b!902105 call!40232))

(declare-fun lt!407833 () Unit!30632)

(assert (=> b!902105 (= lt!407833 lt!407831)))

(declare-fun b!902106 () Bool)

(assert (=> b!902106 (= e!505122 (not (= (bvand (extraKeys!5212 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!902107 () Bool)

(declare-fun e!505123 () Bool)

(assert (=> b!902107 (= e!505123 call!40233)))

(declare-fun bm!40229 () Bool)

(declare-fun arrayContainsKey!0 (array!52894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!40229 (= call!40233 (arrayContainsKey!0 (_keys!10298 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!902108 () Bool)

(assert (=> b!902108 (= e!505125 false)))

(declare-fun c!95624 () Bool)

(assert (=> b!902108 (= c!95624 call!40232)))

(declare-fun lt!407827 () Unit!30632)

(declare-fun e!505126 () Unit!30632)

(assert (=> b!902108 (= lt!407827 e!505126)))

(declare-fun b!902109 () Bool)

(declare-fun e!505124 () Bool)

(assert (=> b!902109 (= e!505124 (not (= (bvand (extraKeys!5212 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!111907 () Bool)

(declare-fun lt!407835 () Bool)

(declare-fun contains!4449 (ListLongMap!10777 (_ BitVec 64)) Bool)

(assert (=> d!111907 (= lt!407835 (contains!4449 (map!12301 thiss!1181) key!785))))

(assert (=> d!111907 (= lt!407835 e!505124)))

(declare-fun c!95623 () Bool)

(assert (=> d!111907 (= c!95623 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111907 (valid!1717 thiss!1181)))

(assert (=> d!111907 (= (contains!4447 thiss!1181 key!785) lt!407835)))

(declare-fun bm!40230 () Bool)

(declare-fun call!40234 () ListLongMap!10777)

(declare-fun getCurrentListMap!2674 (array!52894 array!52896 (_ BitVec 32) (_ BitVec 32) V!29521 V!29521 (_ BitVec 32) Int) ListLongMap!10777)

(assert (=> bm!40230 (= call!40234 (getCurrentListMap!2674 (_keys!10298 thiss!1181) (_values!5503 thiss!1181) (mask!26301 thiss!1181) (extraKeys!5212 thiss!1181) (zeroValue!5316 thiss!1181) (minValue!5316 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5481 thiss!1181)))))

(declare-fun b!902110 () Bool)

(declare-fun Unit!30636 () Unit!30632)

(assert (=> b!902110 (= e!505126 Unit!30636)))

(declare-fun b!902111 () Bool)

(assert (=> b!902111 (= e!505123 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5212 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5212 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!40231 () Bool)

(assert (=> bm!40231 (= call!40232 (contains!4449 call!40234 (ite c!95621 (select (arr!25413 (_keys!10298 thiss!1181)) (index!38196 lt!407826)) key!785)))))

(declare-fun b!902112 () Bool)

(assert (=> b!902112 false))

(declare-fun lt!407823 () Unit!30632)

(declare-fun lt!407832 () Unit!30632)

(assert (=> b!902112 (= lt!407823 lt!407832)))

(declare-fun lt!407834 () SeekEntryResult!8956)

(declare-fun lt!407825 () (_ BitVec 32))

(assert (=> b!902112 (and ((_ is Found!8956) lt!407834) (= (index!38196 lt!407834) lt!407825))))

(assert (=> b!902112 (= lt!407834 (seekEntry!0 key!785 (_keys!10298 thiss!1181) (mask!26301 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52894 (_ BitVec 32)) Unit!30632)

(assert (=> b!902112 (= lt!407832 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!407825 (_keys!10298 thiss!1181) (mask!26301 thiss!1181)))))

(declare-fun lt!407824 () Unit!30632)

(declare-fun lt!407828 () Unit!30632)

(assert (=> b!902112 (= lt!407824 lt!407828)))

(assert (=> b!902112 (arrayForallSeekEntryOrOpenFound!0 lt!407825 (_keys!10298 thiss!1181) (mask!26301 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30632)

(assert (=> b!902112 (= lt!407828 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10298 thiss!1181) (mask!26301 thiss!1181) #b00000000000000000000000000000000 lt!407825))))

(declare-fun arrayScanForKey!0 (array!52894 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!902112 (= lt!407825 (arrayScanForKey!0 (_keys!10298 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!407830 () Unit!30632)

(declare-fun lt!407837 () Unit!30632)

(assert (=> b!902112 (= lt!407830 lt!407837)))

(assert (=> b!902112 e!505123))

(declare-fun c!95620 () Bool)

(assert (=> b!902112 (= c!95620 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!166 (array!52894 array!52896 (_ BitVec 32) (_ BitVec 32) V!29521 V!29521 (_ BitVec 64) Int) Unit!30632)

(assert (=> b!902112 (= lt!407837 (lemmaKeyInListMapIsInArray!166 (_keys!10298 thiss!1181) (_values!5503 thiss!1181) (mask!26301 thiss!1181) (extraKeys!5212 thiss!1181) (zeroValue!5316 thiss!1181) (minValue!5316 thiss!1181) key!785 (defaultEntry!5481 thiss!1181)))))

(declare-fun Unit!30637 () Unit!30632)

(assert (=> b!902112 (= e!505126 Unit!30637)))

(declare-fun b!902113 () Bool)

(assert (=> b!902113 (= e!505124 e!505122)))

(declare-fun c!95622 () Bool)

(assert (=> b!902113 (= c!95622 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!111907 c!95623) b!902109))

(assert (= (and d!111907 (not c!95623)) b!902113))

(assert (= (and b!902113 c!95622) b!902106))

(assert (= (and b!902113 (not c!95622)) b!902104))

(assert (= (and b!902104 c!95621) b!902105))

(assert (= (and b!902104 (not c!95621)) b!902108))

(assert (= (and b!902108 c!95624) b!902112))

(assert (= (and b!902108 (not c!95624)) b!902110))

(assert (= (and b!902112 c!95620) b!902107))

(assert (= (and b!902112 (not c!95620)) b!902111))

(assert (= (or b!902105 b!902107) bm!40229))

(assert (= (or b!902105 b!902108) bm!40230))

(assert (= (or b!902105 b!902108) bm!40231))

(assert (=> d!111907 m!838167))

(assert (=> d!111907 m!838167))

(declare-fun m!838235 () Bool)

(assert (=> d!111907 m!838235))

(assert (=> d!111907 m!838163))

(declare-fun m!838237 () Bool)

(assert (=> bm!40229 m!838237))

(assert (=> b!902104 m!838181))

(declare-fun m!838239 () Bool)

(assert (=> b!902112 m!838239))

(declare-fun m!838241 () Bool)

(assert (=> b!902112 m!838241))

(declare-fun m!838243 () Bool)

(assert (=> b!902112 m!838243))

(declare-fun m!838245 () Bool)

(assert (=> b!902112 m!838245))

(declare-fun m!838247 () Bool)

(assert (=> b!902112 m!838247))

(assert (=> b!902112 m!838181))

(declare-fun m!838249 () Bool)

(assert (=> bm!40230 m!838249))

(declare-fun m!838251 () Bool)

(assert (=> b!902105 m!838251))

(declare-fun m!838253 () Bool)

(assert (=> b!902105 m!838253))

(declare-fun m!838255 () Bool)

(assert (=> bm!40231 m!838255))

(declare-fun m!838257 () Bool)

(assert (=> bm!40231 m!838257))

(assert (=> b!902015 d!111907))

(declare-fun d!111909 () Bool)

(assert (=> d!111909 (= (inRange!0 (index!38196 lt!407767) (mask!26301 thiss!1181)) (and (bvsge (index!38196 lt!407767) #b00000000000000000000000000000000) (bvslt (index!38196 lt!407767) (bvadd (mask!26301 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!902022 d!111909))

(declare-fun d!111911 () Bool)

(assert (=> d!111911 (= (get!13377 (getValueByKey!467 (toList!5404 (map!12301 thiss!1181)) key!785)) (v!11762 (getValueByKey!467 (toList!5404 (map!12301 thiss!1181)) key!785)))))

(assert (=> b!902014 d!111911))

(declare-fun d!111913 () Bool)

(declare-fun c!95629 () Bool)

(assert (=> d!111913 (= c!95629 (and ((_ is Cons!17876) (toList!5404 (map!12301 thiss!1181))) (= (_1!6051 (h!19022 (toList!5404 (map!12301 thiss!1181)))) key!785)))))

(declare-fun e!505131 () Option!473)

(assert (=> d!111913 (= (getValueByKey!467 (toList!5404 (map!12301 thiss!1181)) key!785) e!505131)))

(declare-fun b!902122 () Bool)

(assert (=> b!902122 (= e!505131 (Some!472 (_2!6051 (h!19022 (toList!5404 (map!12301 thiss!1181))))))))

(declare-fun b!902123 () Bool)

(declare-fun e!505132 () Option!473)

(assert (=> b!902123 (= e!505131 e!505132)))

(declare-fun c!95630 () Bool)

(assert (=> b!902123 (= c!95630 (and ((_ is Cons!17876) (toList!5404 (map!12301 thiss!1181))) (not (= (_1!6051 (h!19022 (toList!5404 (map!12301 thiss!1181)))) key!785))))))

(declare-fun b!902125 () Bool)

(assert (=> b!902125 (= e!505132 None!471)))

(declare-fun b!902124 () Bool)

(assert (=> b!902124 (= e!505132 (getValueByKey!467 (t!25261 (toList!5404 (map!12301 thiss!1181))) key!785))))

(assert (= (and d!111913 c!95629) b!902122))

(assert (= (and d!111913 (not c!95629)) b!902123))

(assert (= (and b!902123 c!95630) b!902124))

(assert (= (and b!902123 (not c!95630)) b!902125))

(declare-fun m!838259 () Bool)

(assert (=> b!902124 m!838259))

(assert (=> b!902014 d!111913))

(declare-fun d!111915 () Bool)

(assert (=> d!111915 (= (map!12301 thiss!1181) (getCurrentListMap!2674 (_keys!10298 thiss!1181) (_values!5503 thiss!1181) (mask!26301 thiss!1181) (extraKeys!5212 thiss!1181) (zeroValue!5316 thiss!1181) (minValue!5316 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5481 thiss!1181)))))

(declare-fun bs!25316 () Bool)

(assert (= bs!25316 d!111915))

(assert (=> bs!25316 m!838249))

(assert (=> b!902014 d!111915))

(declare-fun mapNonEmpty!29323 () Bool)

(declare-fun mapRes!29323 () Bool)

(declare-fun tp!56382 () Bool)

(declare-fun e!505138 () Bool)

(assert (=> mapNonEmpty!29323 (= mapRes!29323 (and tp!56382 e!505138))))

(declare-fun mapRest!29323 () (Array (_ BitVec 32) ValueCell!8727))

(declare-fun mapKey!29323 () (_ BitVec 32))

(declare-fun mapValue!29323 () ValueCell!8727)

(assert (=> mapNonEmpty!29323 (= mapRest!29317 (store mapRest!29323 mapKey!29323 mapValue!29323))))

(declare-fun mapIsEmpty!29323 () Bool)

(assert (=> mapIsEmpty!29323 mapRes!29323))

(declare-fun condMapEmpty!29323 () Bool)

(declare-fun mapDefault!29323 () ValueCell!8727)

(assert (=> mapNonEmpty!29317 (= condMapEmpty!29323 (= mapRest!29317 ((as const (Array (_ BitVec 32) ValueCell!8727)) mapDefault!29323)))))

(declare-fun e!505137 () Bool)

(assert (=> mapNonEmpty!29317 (= tp!56372 (and e!505137 mapRes!29323))))

(declare-fun b!902133 () Bool)

(assert (=> b!902133 (= e!505137 tp_is_empty!18417)))

(declare-fun b!902132 () Bool)

(assert (=> b!902132 (= e!505138 tp_is_empty!18417)))

(assert (= (and mapNonEmpty!29317 condMapEmpty!29323) mapIsEmpty!29323))

(assert (= (and mapNonEmpty!29317 (not condMapEmpty!29323)) mapNonEmpty!29323))

(assert (= (and mapNonEmpty!29323 ((_ is ValueCellFull!8727) mapValue!29323)) b!902132))

(assert (= (and mapNonEmpty!29317 ((_ is ValueCellFull!8727) mapDefault!29323)) b!902133))

(declare-fun m!838261 () Bool)

(assert (=> mapNonEmpty!29323 m!838261))

(check-sat (not b!902104) (not d!111901) (not bm!40229) (not mapNonEmpty!29323) (not bm!40231) (not b!902124) (not b!902105) (not b!902060) (not b_lambda!13085) (not b!902065) (not b!902112) (not b!902062) (not bm!40230) tp_is_empty!18417 (not d!111915) b_and!26453 (not d!111907) (not b!902061) (not d!111897) (not d!111899) (not b!902081) (not b_next!16089))
(check-sat b_and!26453 (not b_next!16089))
