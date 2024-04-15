; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76756 () Bool)

(assert start!76756)

(declare-fun b!898002 () Bool)

(declare-fun b_free!16009 () Bool)

(declare-fun b_next!16009 () Bool)

(assert (=> b!898002 (= b_free!16009 (not b_next!16009))))

(declare-fun tp!56094 () Bool)

(declare-fun b_and!26275 () Bool)

(assert (=> b!898002 (= tp!56094 b_and!26275)))

(declare-fun b!897998 () Bool)

(declare-fun res!606952 () Bool)

(declare-fun e!502269 () Bool)

(assert (=> b!897998 (=> (not res!606952) (not e!502269))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!897998 (= res!606952 (not (= key!785 (bvneg key!785))))))

(declare-fun b!897999 () Bool)

(declare-fun e!502273 () Bool)

(declare-fun tp_is_empty!18337 () Bool)

(assert (=> b!897999 (= e!502273 tp_is_empty!18337)))

(declare-fun res!606951 () Bool)

(assert (=> start!76756 (=> (not res!606951) (not e!502269))))

(declare-datatypes ((array!52693 0))(
  ( (array!52694 (arr!25325 (Array (_ BitVec 32) (_ BitVec 64))) (size!25782 (_ BitVec 32))) )
))
(declare-datatypes ((V!29415 0))(
  ( (V!29416 (val!9219 Int)) )
))
(declare-datatypes ((ValueCell!8687 0))(
  ( (ValueCellFull!8687 (v!11706 V!29415)) (EmptyCell!8687) )
))
(declare-datatypes ((array!52695 0))(
  ( (array!52696 (arr!25326 (Array (_ BitVec 32) ValueCell!8687)) (size!25783 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4390 0))(
  ( (LongMapFixedSize!4391 (defaultEntry!5407 Int) (mask!26124 (_ BitVec 32)) (extraKeys!5122 (_ BitVec 32)) (zeroValue!5226 V!29415) (minValue!5226 V!29415) (_size!2250 (_ BitVec 32)) (_keys!10175 array!52693) (_values!5413 array!52695) (_vacant!2250 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4390)

(declare-fun valid!1697 (LongMapFixedSize!4390) Bool)

(assert (=> start!76756 (= res!606951 (valid!1697 thiss!1181))))

(assert (=> start!76756 e!502269))

(declare-fun e!502274 () Bool)

(assert (=> start!76756 e!502274))

(assert (=> start!76756 true))

(declare-fun b!898000 () Bool)

(declare-fun e!502275 () Bool)

(declare-fun e!502276 () Bool)

(declare-fun mapRes!29157 () Bool)

(assert (=> b!898000 (= e!502275 (and e!502276 mapRes!29157))))

(declare-fun condMapEmpty!29157 () Bool)

(declare-fun mapDefault!29157 () ValueCell!8687)

(assert (=> b!898000 (= condMapEmpty!29157 (= (arr!25326 (_values!5413 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8687)) mapDefault!29157)))))

(declare-fun b!898001 () Bool)

(assert (=> b!898001 (= e!502276 tp_is_empty!18337)))

(declare-fun mapIsEmpty!29157 () Bool)

(assert (=> mapIsEmpty!29157 mapRes!29157))

(declare-fun array_inv!19928 (array!52693) Bool)

(declare-fun array_inv!19929 (array!52695) Bool)

(assert (=> b!898002 (= e!502274 (and tp!56094 tp_is_empty!18337 (array_inv!19928 (_keys!10175 thiss!1181)) (array_inv!19929 (_values!5413 thiss!1181)) e!502275))))

(declare-fun b!898003 () Bool)

(declare-fun e!502271 () Bool)

(declare-datatypes ((SeekEntryResult!8924 0))(
  ( (MissingZero!8924 (index!38067 (_ BitVec 32))) (Found!8924 (index!38068 (_ BitVec 32))) (Intermediate!8924 (undefined!9736 Bool) (index!38069 (_ BitVec 32)) (x!76548 (_ BitVec 32))) (Undefined!8924) (MissingVacant!8924 (index!38070 (_ BitVec 32))) )
))
(declare-fun lt!405221 () SeekEntryResult!8924)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898003 (= e!502271 (inRange!0 (index!38068 lt!405221) (mask!26124 thiss!1181)))))

(declare-fun b!898004 () Bool)

(declare-fun e!502272 () Bool)

(assert (=> b!898004 (= e!502269 (not e!502272))))

(declare-fun res!606949 () Bool)

(assert (=> b!898004 (=> res!606949 e!502272)))

(get-info :version)

(assert (=> b!898004 (= res!606949 (not ((_ is Found!8924) lt!405221)))))

(assert (=> b!898004 e!502271))

(declare-fun res!606950 () Bool)

(assert (=> b!898004 (=> res!606950 e!502271)))

(assert (=> b!898004 (= res!606950 (not ((_ is Found!8924) lt!405221)))))

(declare-datatypes ((Unit!30468 0))(
  ( (Unit!30469) )
))
(declare-fun lt!405219 () Unit!30468)

(declare-fun lemmaSeekEntryGivesInRangeIndex!90 (array!52693 array!52695 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 64)) Unit!30468)

(assert (=> b!898004 (= lt!405219 (lemmaSeekEntryGivesInRangeIndex!90 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52693 (_ BitVec 32)) SeekEntryResult!8924)

(assert (=> b!898004 (= lt!405221 (seekEntry!0 key!785 (_keys!10175 thiss!1181) (mask!26124 thiss!1181)))))

(declare-fun mapNonEmpty!29157 () Bool)

(declare-fun tp!56093 () Bool)

(assert (=> mapNonEmpty!29157 (= mapRes!29157 (and tp!56093 e!502273))))

(declare-fun mapKey!29157 () (_ BitVec 32))

(declare-fun mapValue!29157 () ValueCell!8687)

(declare-fun mapRest!29157 () (Array (_ BitVec 32) ValueCell!8687))

(assert (=> mapNonEmpty!29157 (= (arr!25326 (_values!5413 thiss!1181)) (store mapRest!29157 mapKey!29157 mapValue!29157))))

(declare-fun b!898005 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898005 (= e!502272 (validMask!0 (mask!26124 thiss!1181)))))

(declare-datatypes ((tuple2!12048 0))(
  ( (tuple2!12049 (_1!6035 (_ BitVec 64)) (_2!6035 V!29415)) )
))
(declare-datatypes ((List!17844 0))(
  ( (Nil!17841) (Cons!17840 (h!18982 tuple2!12048) (t!25174 List!17844)) )
))
(declare-datatypes ((ListLongMap!10735 0))(
  ( (ListLongMap!10736 (toList!5383 List!17844)) )
))
(declare-fun contains!4378 (ListLongMap!10735 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2602 (array!52693 array!52695 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 32) Int) ListLongMap!10735)

(assert (=> b!898005 (contains!4378 (getCurrentListMap!2602 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)) (select (arr!25325 (_keys!10175 thiss!1181)) (index!38068 lt!405221)))))

(declare-fun lt!405220 () Unit!30468)

(declare-fun lemmaValidKeyInArrayIsInListMap!238 (array!52693 array!52695 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 32) Int) Unit!30468)

(assert (=> b!898005 (= lt!405220 (lemmaValidKeyInArrayIsInListMap!238 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) (index!38068 lt!405221) (defaultEntry!5407 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898005 (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405218 () Unit!30468)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52693 (_ BitVec 64) (_ BitVec 32)) Unit!30468)

(assert (=> b!898005 (= lt!405218 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10175 thiss!1181) key!785 (index!38068 lt!405221)))))

(assert (= (and start!76756 res!606951) b!897998))

(assert (= (and b!897998 res!606952) b!898004))

(assert (= (and b!898004 (not res!606950)) b!898003))

(assert (= (and b!898004 (not res!606949)) b!898005))

(assert (= (and b!898000 condMapEmpty!29157) mapIsEmpty!29157))

(assert (= (and b!898000 (not condMapEmpty!29157)) mapNonEmpty!29157))

(assert (= (and mapNonEmpty!29157 ((_ is ValueCellFull!8687) mapValue!29157)) b!897999))

(assert (= (and b!898000 ((_ is ValueCellFull!8687) mapDefault!29157)) b!898001))

(assert (= b!898002 b!898000))

(assert (= start!76756 b!898002))

(declare-fun m!833991 () Bool)

(assert (=> start!76756 m!833991))

(declare-fun m!833993 () Bool)

(assert (=> b!898005 m!833993))

(declare-fun m!833995 () Bool)

(assert (=> b!898005 m!833995))

(declare-fun m!833997 () Bool)

(assert (=> b!898005 m!833997))

(declare-fun m!833999 () Bool)

(assert (=> b!898005 m!833999))

(assert (=> b!898005 m!833999))

(assert (=> b!898005 m!833993))

(declare-fun m!834001 () Bool)

(assert (=> b!898005 m!834001))

(declare-fun m!834003 () Bool)

(assert (=> b!898005 m!834003))

(declare-fun m!834005 () Bool)

(assert (=> b!898005 m!834005))

(declare-fun m!834007 () Bool)

(assert (=> b!898003 m!834007))

(declare-fun m!834009 () Bool)

(assert (=> mapNonEmpty!29157 m!834009))

(declare-fun m!834011 () Bool)

(assert (=> b!898004 m!834011))

(declare-fun m!834013 () Bool)

(assert (=> b!898004 m!834013))

(declare-fun m!834015 () Bool)

(assert (=> b!898002 m!834015))

(declare-fun m!834017 () Bool)

(assert (=> b!898002 m!834017))

(check-sat (not b!898003) (not b_next!16009) (not mapNonEmpty!29157) (not b!898005) (not b!898004) tp_is_empty!18337 b_and!26275 (not b!898002) (not start!76756))
(check-sat b_and!26275 (not b_next!16009))
(get-model)

(declare-fun d!111015 () Bool)

(declare-fun e!502327 () Bool)

(assert (=> d!111015 e!502327))

(declare-fun res!606979 () Bool)

(assert (=> d!111015 (=> res!606979 e!502327)))

(declare-fun lt!405251 () SeekEntryResult!8924)

(assert (=> d!111015 (= res!606979 (not ((_ is Found!8924) lt!405251)))))

(assert (=> d!111015 (= lt!405251 (seekEntry!0 key!785 (_keys!10175 thiss!1181) (mask!26124 thiss!1181)))))

(declare-fun lt!405250 () Unit!30468)

(declare-fun choose!1497 (array!52693 array!52695 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 64)) Unit!30468)

(assert (=> d!111015 (= lt!405250 (choose!1497 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) key!785))))

(assert (=> d!111015 (validMask!0 (mask!26124 thiss!1181))))

(assert (=> d!111015 (= (lemmaSeekEntryGivesInRangeIndex!90 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) key!785) lt!405250)))

(declare-fun b!898056 () Bool)

(assert (=> b!898056 (= e!502327 (inRange!0 (index!38068 lt!405251) (mask!26124 thiss!1181)))))

(assert (= (and d!111015 (not res!606979)) b!898056))

(assert (=> d!111015 m!834013))

(declare-fun m!834075 () Bool)

(assert (=> d!111015 m!834075))

(assert (=> d!111015 m!833997))

(declare-fun m!834077 () Bool)

(assert (=> b!898056 m!834077))

(assert (=> b!898004 d!111015))

(declare-fun b!898069 () Bool)

(declare-fun e!502335 () SeekEntryResult!8924)

(declare-fun lt!405262 () SeekEntryResult!8924)

(assert (=> b!898069 (= e!502335 (ite ((_ is MissingVacant!8924) lt!405262) (MissingZero!8924 (index!38070 lt!405262)) lt!405262))))

(declare-fun lt!405260 () SeekEntryResult!8924)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52693 (_ BitVec 32)) SeekEntryResult!8924)

(assert (=> b!898069 (= lt!405262 (seekKeyOrZeroReturnVacant!0 (x!76548 lt!405260) (index!38069 lt!405260) (index!38069 lt!405260) key!785 (_keys!10175 thiss!1181) (mask!26124 thiss!1181)))))

(declare-fun b!898070 () Bool)

(declare-fun e!502336 () SeekEntryResult!8924)

(declare-fun e!502334 () SeekEntryResult!8924)

(assert (=> b!898070 (= e!502336 e!502334)))

(declare-fun lt!405263 () (_ BitVec 64))

(assert (=> b!898070 (= lt!405263 (select (arr!25325 (_keys!10175 thiss!1181)) (index!38069 lt!405260)))))

(declare-fun c!94855 () Bool)

(assert (=> b!898070 (= c!94855 (= lt!405263 key!785))))

(declare-fun b!898071 () Bool)

(assert (=> b!898071 (= e!502334 (Found!8924 (index!38069 lt!405260)))))

(declare-fun d!111017 () Bool)

(declare-fun lt!405261 () SeekEntryResult!8924)

(assert (=> d!111017 (and (or ((_ is MissingVacant!8924) lt!405261) (not ((_ is Found!8924) lt!405261)) (and (bvsge (index!38068 lt!405261) #b00000000000000000000000000000000) (bvslt (index!38068 lt!405261) (size!25782 (_keys!10175 thiss!1181))))) (not ((_ is MissingVacant!8924) lt!405261)) (or (not ((_ is Found!8924) lt!405261)) (= (select (arr!25325 (_keys!10175 thiss!1181)) (index!38068 lt!405261)) key!785)))))

(assert (=> d!111017 (= lt!405261 e!502336)))

(declare-fun c!94857 () Bool)

(assert (=> d!111017 (= c!94857 (and ((_ is Intermediate!8924) lt!405260) (undefined!9736 lt!405260)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52693 (_ BitVec 32)) SeekEntryResult!8924)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111017 (= lt!405260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26124 thiss!1181)) key!785 (_keys!10175 thiss!1181) (mask!26124 thiss!1181)))))

(assert (=> d!111017 (validMask!0 (mask!26124 thiss!1181))))

(assert (=> d!111017 (= (seekEntry!0 key!785 (_keys!10175 thiss!1181) (mask!26124 thiss!1181)) lt!405261)))

(declare-fun b!898072 () Bool)

(assert (=> b!898072 (= e!502336 Undefined!8924)))

(declare-fun b!898073 () Bool)

(assert (=> b!898073 (= e!502335 (MissingZero!8924 (index!38069 lt!405260)))))

(declare-fun b!898074 () Bool)

(declare-fun c!94856 () Bool)

(assert (=> b!898074 (= c!94856 (= lt!405263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898074 (= e!502334 e!502335)))

(assert (= (and d!111017 c!94857) b!898072))

(assert (= (and d!111017 (not c!94857)) b!898070))

(assert (= (and b!898070 c!94855) b!898071))

(assert (= (and b!898070 (not c!94855)) b!898074))

(assert (= (and b!898074 c!94856) b!898073))

(assert (= (and b!898074 (not c!94856)) b!898069))

(declare-fun m!834079 () Bool)

(assert (=> b!898069 m!834079))

(declare-fun m!834081 () Bool)

(assert (=> b!898070 m!834081))

(declare-fun m!834083 () Bool)

(assert (=> d!111017 m!834083))

(declare-fun m!834085 () Bool)

(assert (=> d!111017 m!834085))

(assert (=> d!111017 m!834085))

(declare-fun m!834087 () Bool)

(assert (=> d!111017 m!834087))

(assert (=> d!111017 m!833997))

(assert (=> b!898004 d!111017))

(declare-fun d!111019 () Bool)

(assert (=> d!111019 (= (inRange!0 (index!38068 lt!405221) (mask!26124 thiss!1181)) (and (bvsge (index!38068 lt!405221) #b00000000000000000000000000000000) (bvslt (index!38068 lt!405221) (bvadd (mask!26124 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898003 d!111019))

(declare-fun d!111021 () Bool)

(declare-fun res!606986 () Bool)

(declare-fun e!502339 () Bool)

(assert (=> d!111021 (=> (not res!606986) (not e!502339))))

(declare-fun simpleValid!323 (LongMapFixedSize!4390) Bool)

(assert (=> d!111021 (= res!606986 (simpleValid!323 thiss!1181))))

(assert (=> d!111021 (= (valid!1697 thiss!1181) e!502339)))

(declare-fun b!898081 () Bool)

(declare-fun res!606987 () Bool)

(assert (=> b!898081 (=> (not res!606987) (not e!502339))))

(declare-fun arrayCountValidKeys!0 (array!52693 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898081 (= res!606987 (= (arrayCountValidKeys!0 (_keys!10175 thiss!1181) #b00000000000000000000000000000000 (size!25782 (_keys!10175 thiss!1181))) (_size!2250 thiss!1181)))))

(declare-fun b!898082 () Bool)

(declare-fun res!606988 () Bool)

(assert (=> b!898082 (=> (not res!606988) (not e!502339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52693 (_ BitVec 32)) Bool)

(assert (=> b!898082 (= res!606988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10175 thiss!1181) (mask!26124 thiss!1181)))))

(declare-fun b!898083 () Bool)

(declare-datatypes ((List!17847 0))(
  ( (Nil!17844) (Cons!17843 (h!18985 (_ BitVec 64)) (t!25179 List!17847)) )
))
(declare-fun arrayNoDuplicates!0 (array!52693 (_ BitVec 32) List!17847) Bool)

(assert (=> b!898083 (= e!502339 (arrayNoDuplicates!0 (_keys!10175 thiss!1181) #b00000000000000000000000000000000 Nil!17844))))

(assert (= (and d!111021 res!606986) b!898081))

(assert (= (and b!898081 res!606987) b!898082))

(assert (= (and b!898082 res!606988) b!898083))

(declare-fun m!834089 () Bool)

(assert (=> d!111021 m!834089))

(declare-fun m!834091 () Bool)

(assert (=> b!898081 m!834091))

(declare-fun m!834093 () Bool)

(assert (=> b!898082 m!834093))

(declare-fun m!834095 () Bool)

(assert (=> b!898083 m!834095))

(assert (=> start!76756 d!111021))

(declare-fun d!111023 () Bool)

(assert (=> d!111023 (= (array_inv!19928 (_keys!10175 thiss!1181)) (bvsge (size!25782 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898002 d!111023))

(declare-fun d!111025 () Bool)

(assert (=> d!111025 (= (array_inv!19929 (_values!5413 thiss!1181)) (bvsge (size!25783 (_values!5413 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898002 d!111025))

(declare-fun d!111027 () Bool)

(assert (=> d!111027 (= (validMask!0 (mask!26124 thiss!1181)) (and (or (= (mask!26124 thiss!1181) #b00000000000000000000000000000111) (= (mask!26124 thiss!1181) #b00000000000000000000000000001111) (= (mask!26124 thiss!1181) #b00000000000000000000000000011111) (= (mask!26124 thiss!1181) #b00000000000000000000000000111111) (= (mask!26124 thiss!1181) #b00000000000000000000000001111111) (= (mask!26124 thiss!1181) #b00000000000000000000000011111111) (= (mask!26124 thiss!1181) #b00000000000000000000000111111111) (= (mask!26124 thiss!1181) #b00000000000000000000001111111111) (= (mask!26124 thiss!1181) #b00000000000000000000011111111111) (= (mask!26124 thiss!1181) #b00000000000000000000111111111111) (= (mask!26124 thiss!1181) #b00000000000000000001111111111111) (= (mask!26124 thiss!1181) #b00000000000000000011111111111111) (= (mask!26124 thiss!1181) #b00000000000000000111111111111111) (= (mask!26124 thiss!1181) #b00000000000000001111111111111111) (= (mask!26124 thiss!1181) #b00000000000000011111111111111111) (= (mask!26124 thiss!1181) #b00000000000000111111111111111111) (= (mask!26124 thiss!1181) #b00000000000001111111111111111111) (= (mask!26124 thiss!1181) #b00000000000011111111111111111111) (= (mask!26124 thiss!1181) #b00000000000111111111111111111111) (= (mask!26124 thiss!1181) #b00000000001111111111111111111111) (= (mask!26124 thiss!1181) #b00000000011111111111111111111111) (= (mask!26124 thiss!1181) #b00000000111111111111111111111111) (= (mask!26124 thiss!1181) #b00000001111111111111111111111111) (= (mask!26124 thiss!1181) #b00000011111111111111111111111111) (= (mask!26124 thiss!1181) #b00000111111111111111111111111111) (= (mask!26124 thiss!1181) #b00001111111111111111111111111111) (= (mask!26124 thiss!1181) #b00011111111111111111111111111111) (= (mask!26124 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26124 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!898005 d!111027))

(declare-fun d!111029 () Bool)

(declare-fun e!502345 () Bool)

(assert (=> d!111029 e!502345))

(declare-fun res!606991 () Bool)

(assert (=> d!111029 (=> res!606991 e!502345)))

(declare-fun lt!405272 () Bool)

(assert (=> d!111029 (= res!606991 (not lt!405272))))

(declare-fun lt!405274 () Bool)

(assert (=> d!111029 (= lt!405272 lt!405274)))

(declare-fun lt!405275 () Unit!30468)

(declare-fun e!502344 () Unit!30468)

(assert (=> d!111029 (= lt!405275 e!502344)))

(declare-fun c!94860 () Bool)

(assert (=> d!111029 (= c!94860 lt!405274)))

(declare-fun containsKey!424 (List!17844 (_ BitVec 64)) Bool)

(assert (=> d!111029 (= lt!405274 (containsKey!424 (toList!5383 (getCurrentListMap!2602 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181))) (select (arr!25325 (_keys!10175 thiss!1181)) (index!38068 lt!405221))))))

(assert (=> d!111029 (= (contains!4378 (getCurrentListMap!2602 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)) (select (arr!25325 (_keys!10175 thiss!1181)) (index!38068 lt!405221))) lt!405272)))

(declare-fun b!898090 () Bool)

(declare-fun lt!405273 () Unit!30468)

(assert (=> b!898090 (= e!502344 lt!405273)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!319 (List!17844 (_ BitVec 64)) Unit!30468)

(assert (=> b!898090 (= lt!405273 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5383 (getCurrentListMap!2602 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181))) (select (arr!25325 (_keys!10175 thiss!1181)) (index!38068 lt!405221))))))

(declare-datatypes ((Option!462 0))(
  ( (Some!461 (v!11709 V!29415)) (None!460) )
))
(declare-fun isDefined!332 (Option!462) Bool)

(declare-fun getValueByKey!456 (List!17844 (_ BitVec 64)) Option!462)

(assert (=> b!898090 (isDefined!332 (getValueByKey!456 (toList!5383 (getCurrentListMap!2602 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181))) (select (arr!25325 (_keys!10175 thiss!1181)) (index!38068 lt!405221))))))

(declare-fun b!898091 () Bool)

(declare-fun Unit!30474 () Unit!30468)

(assert (=> b!898091 (= e!502344 Unit!30474)))

(declare-fun b!898092 () Bool)

(assert (=> b!898092 (= e!502345 (isDefined!332 (getValueByKey!456 (toList!5383 (getCurrentListMap!2602 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181))) (select (arr!25325 (_keys!10175 thiss!1181)) (index!38068 lt!405221)))))))

(assert (= (and d!111029 c!94860) b!898090))

(assert (= (and d!111029 (not c!94860)) b!898091))

(assert (= (and d!111029 (not res!606991)) b!898092))

(assert (=> d!111029 m!833993))

(declare-fun m!834097 () Bool)

(assert (=> d!111029 m!834097))

(assert (=> b!898090 m!833993))

(declare-fun m!834099 () Bool)

(assert (=> b!898090 m!834099))

(assert (=> b!898090 m!833993))

(declare-fun m!834101 () Bool)

(assert (=> b!898090 m!834101))

(assert (=> b!898090 m!834101))

(declare-fun m!834103 () Bool)

(assert (=> b!898090 m!834103))

(assert (=> b!898092 m!833993))

(assert (=> b!898092 m!834101))

(assert (=> b!898092 m!834101))

(assert (=> b!898092 m!834103))

(assert (=> b!898005 d!111029))

(declare-fun d!111031 () Bool)

(declare-fun res!606996 () Bool)

(declare-fun e!502350 () Bool)

(assert (=> d!111031 (=> res!606996 e!502350)))

(assert (=> d!111031 (= res!606996 (= (select (arr!25325 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111031 (= (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 #b00000000000000000000000000000000) e!502350)))

(declare-fun b!898097 () Bool)

(declare-fun e!502351 () Bool)

(assert (=> b!898097 (= e!502350 e!502351)))

(declare-fun res!606997 () Bool)

(assert (=> b!898097 (=> (not res!606997) (not e!502351))))

(assert (=> b!898097 (= res!606997 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25782 (_keys!10175 thiss!1181))))))

(declare-fun b!898098 () Bool)

(assert (=> b!898098 (= e!502351 (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111031 (not res!606996)) b!898097))

(assert (= (and b!898097 res!606997) b!898098))

(declare-fun m!834105 () Bool)

(assert (=> d!111031 m!834105))

(declare-fun m!834107 () Bool)

(assert (=> b!898098 m!834107))

(assert (=> b!898005 d!111031))

(declare-fun d!111033 () Bool)

(assert (=> d!111033 (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405278 () Unit!30468)

(declare-fun choose!13 (array!52693 (_ BitVec 64) (_ BitVec 32)) Unit!30468)

(assert (=> d!111033 (= lt!405278 (choose!13 (_keys!10175 thiss!1181) key!785 (index!38068 lt!405221)))))

(assert (=> d!111033 (bvsge (index!38068 lt!405221) #b00000000000000000000000000000000)))

(assert (=> d!111033 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10175 thiss!1181) key!785 (index!38068 lt!405221)) lt!405278)))

(declare-fun bs!25177 () Bool)

(assert (= bs!25177 d!111033))

(assert (=> bs!25177 m!834003))

(declare-fun m!834109 () Bool)

(assert (=> bs!25177 m!834109))

(assert (=> b!898005 d!111033))

(declare-fun b!898141 () Bool)

(declare-fun res!607017 () Bool)

(declare-fun e!502387 () Bool)

(assert (=> b!898141 (=> (not res!607017) (not e!502387))))

(declare-fun e!502384 () Bool)

(assert (=> b!898141 (= res!607017 e!502384)))

(declare-fun c!94873 () Bool)

(assert (=> b!898141 (= c!94873 (not (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!39826 () ListLongMap!10735)

(declare-fun call!39824 () ListLongMap!10735)

(declare-fun call!39825 () ListLongMap!10735)

(declare-fun c!94877 () Bool)

(declare-fun call!39827 () ListLongMap!10735)

(declare-fun c!94875 () Bool)

(declare-fun bm!39821 () Bool)

(declare-fun +!2616 (ListLongMap!10735 tuple2!12048) ListLongMap!10735)

(assert (=> bm!39821 (= call!39825 (+!2616 (ite c!94877 call!39826 (ite c!94875 call!39827 call!39824)) (ite (or c!94877 c!94875) (tuple2!12049 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5226 thiss!1181)) (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5226 thiss!1181)))))))

(declare-fun b!898142 () Bool)

(declare-fun c!94874 () Bool)

(assert (=> b!898142 (= c!94874 (and (not (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!502379 () ListLongMap!10735)

(declare-fun e!502388 () ListLongMap!10735)

(assert (=> b!898142 (= e!502379 e!502388)))

(declare-fun b!898143 () Bool)

(declare-fun e!502380 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898143 (= e!502380 (validKeyInArray!0 (select (arr!25325 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39822 () Bool)

(declare-fun call!39829 () Bool)

(declare-fun lt!405333 () ListLongMap!10735)

(assert (=> bm!39822 (= call!39829 (contains!4378 lt!405333 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898144 () Bool)

(declare-fun res!607024 () Bool)

(assert (=> b!898144 (=> (not res!607024) (not e!502387))))

(declare-fun e!502389 () Bool)

(assert (=> b!898144 (= res!607024 e!502389)))

(declare-fun res!607019 () Bool)

(assert (=> b!898144 (=> res!607019 e!502389)))

(declare-fun e!502386 () Bool)

(assert (=> b!898144 (= res!607019 (not e!502386))))

(declare-fun res!607016 () Bool)

(assert (=> b!898144 (=> (not res!607016) (not e!502386))))

(assert (=> b!898144 (= res!607016 (bvslt #b00000000000000000000000000000000 (size!25782 (_keys!10175 thiss!1181))))))

(declare-fun d!111035 () Bool)

(assert (=> d!111035 e!502387))

(declare-fun res!607023 () Bool)

(assert (=> d!111035 (=> (not res!607023) (not e!502387))))

(assert (=> d!111035 (= res!607023 (or (bvsge #b00000000000000000000000000000000 (size!25782 (_keys!10175 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25782 (_keys!10175 thiss!1181))))))))

(declare-fun lt!405344 () ListLongMap!10735)

(assert (=> d!111035 (= lt!405333 lt!405344)))

(declare-fun lt!405338 () Unit!30468)

(declare-fun e!502378 () Unit!30468)

(assert (=> d!111035 (= lt!405338 e!502378)))

(declare-fun c!94876 () Bool)

(assert (=> d!111035 (= c!94876 e!502380)))

(declare-fun res!607022 () Bool)

(assert (=> d!111035 (=> (not res!607022) (not e!502380))))

(assert (=> d!111035 (= res!607022 (bvslt #b00000000000000000000000000000000 (size!25782 (_keys!10175 thiss!1181))))))

(declare-fun e!502381 () ListLongMap!10735)

(assert (=> d!111035 (= lt!405344 e!502381)))

(assert (=> d!111035 (= c!94877 (and (not (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111035 (validMask!0 (mask!26124 thiss!1181))))

(assert (=> d!111035 (= (getCurrentListMap!2602 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)) lt!405333)))

(declare-fun b!898145 () Bool)

(declare-fun call!39828 () Bool)

(assert (=> b!898145 (= e!502384 (not call!39828))))

(declare-fun b!898146 () Bool)

(declare-fun call!39830 () ListLongMap!10735)

(assert (=> b!898146 (= e!502379 call!39830)))

(declare-fun b!898147 () Bool)

(declare-fun lt!405324 () Unit!30468)

(assert (=> b!898147 (= e!502378 lt!405324)))

(declare-fun lt!405325 () ListLongMap!10735)

(declare-fun getCurrentListMapNoExtraKeys!3313 (array!52693 array!52695 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 32) Int) ListLongMap!10735)

(assert (=> b!898147 (= lt!405325 (getCurrentListMapNoExtraKeys!3313 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)))))

(declare-fun lt!405337 () (_ BitVec 64))

(assert (=> b!898147 (= lt!405337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405343 () (_ BitVec 64))

(assert (=> b!898147 (= lt!405343 (select (arr!25325 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405335 () Unit!30468)

(declare-fun addStillContains!331 (ListLongMap!10735 (_ BitVec 64) V!29415 (_ BitVec 64)) Unit!30468)

(assert (=> b!898147 (= lt!405335 (addStillContains!331 lt!405325 lt!405337 (zeroValue!5226 thiss!1181) lt!405343))))

(assert (=> b!898147 (contains!4378 (+!2616 lt!405325 (tuple2!12049 lt!405337 (zeroValue!5226 thiss!1181))) lt!405343)))

(declare-fun lt!405332 () Unit!30468)

(assert (=> b!898147 (= lt!405332 lt!405335)))

(declare-fun lt!405341 () ListLongMap!10735)

(assert (=> b!898147 (= lt!405341 (getCurrentListMapNoExtraKeys!3313 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)))))

(declare-fun lt!405330 () (_ BitVec 64))

(assert (=> b!898147 (= lt!405330 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405327 () (_ BitVec 64))

(assert (=> b!898147 (= lt!405327 (select (arr!25325 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405340 () Unit!30468)

(declare-fun addApplyDifferent!331 (ListLongMap!10735 (_ BitVec 64) V!29415 (_ BitVec 64)) Unit!30468)

(assert (=> b!898147 (= lt!405340 (addApplyDifferent!331 lt!405341 lt!405330 (minValue!5226 thiss!1181) lt!405327))))

(declare-fun apply!405 (ListLongMap!10735 (_ BitVec 64)) V!29415)

(assert (=> b!898147 (= (apply!405 (+!2616 lt!405341 (tuple2!12049 lt!405330 (minValue!5226 thiss!1181))) lt!405327) (apply!405 lt!405341 lt!405327))))

(declare-fun lt!405329 () Unit!30468)

(assert (=> b!898147 (= lt!405329 lt!405340)))

(declare-fun lt!405334 () ListLongMap!10735)

(assert (=> b!898147 (= lt!405334 (getCurrentListMapNoExtraKeys!3313 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)))))

(declare-fun lt!405326 () (_ BitVec 64))

(assert (=> b!898147 (= lt!405326 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405328 () (_ BitVec 64))

(assert (=> b!898147 (= lt!405328 (select (arr!25325 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405331 () Unit!30468)

(assert (=> b!898147 (= lt!405331 (addApplyDifferent!331 lt!405334 lt!405326 (zeroValue!5226 thiss!1181) lt!405328))))

(assert (=> b!898147 (= (apply!405 (+!2616 lt!405334 (tuple2!12049 lt!405326 (zeroValue!5226 thiss!1181))) lt!405328) (apply!405 lt!405334 lt!405328))))

(declare-fun lt!405342 () Unit!30468)

(assert (=> b!898147 (= lt!405342 lt!405331)))

(declare-fun lt!405323 () ListLongMap!10735)

(assert (=> b!898147 (= lt!405323 (getCurrentListMapNoExtraKeys!3313 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)))))

(declare-fun lt!405339 () (_ BitVec 64))

(assert (=> b!898147 (= lt!405339 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405336 () (_ BitVec 64))

(assert (=> b!898147 (= lt!405336 (select (arr!25325 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898147 (= lt!405324 (addApplyDifferent!331 lt!405323 lt!405339 (minValue!5226 thiss!1181) lt!405336))))

(assert (=> b!898147 (= (apply!405 (+!2616 lt!405323 (tuple2!12049 lt!405339 (minValue!5226 thiss!1181))) lt!405336) (apply!405 lt!405323 lt!405336))))

(declare-fun b!898148 () Bool)

(declare-fun e!502385 () Bool)

(declare-fun get!13318 (ValueCell!8687 V!29415) V!29415)

(declare-fun dynLambda!1299 (Int (_ BitVec 64)) V!29415)

(assert (=> b!898148 (= e!502385 (= (apply!405 lt!405333 (select (arr!25325 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)) (get!13318 (select (arr!25326 (_values!5413 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1299 (defaultEntry!5407 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!898148 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25783 (_values!5413 thiss!1181))))))

(assert (=> b!898148 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25782 (_keys!10175 thiss!1181))))))

(declare-fun b!898149 () Bool)

(declare-fun e!502383 () Bool)

(assert (=> b!898149 (= e!502387 e!502383)))

(declare-fun c!94878 () Bool)

(assert (=> b!898149 (= c!94878 (not (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!898150 () Bool)

(assert (=> b!898150 (= e!502388 call!39824)))

(declare-fun b!898151 () Bool)

(assert (=> b!898151 (= e!502383 (not call!39829))))

(declare-fun b!898152 () Bool)

(declare-fun Unit!30475 () Unit!30468)

(assert (=> b!898152 (= e!502378 Unit!30475)))

(declare-fun b!898153 () Bool)

(declare-fun e!502382 () Bool)

(assert (=> b!898153 (= e!502382 (= (apply!405 lt!405333 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5226 thiss!1181)))))

(declare-fun bm!39823 () Bool)

(assert (=> bm!39823 (= call!39826 (getCurrentListMapNoExtraKeys!3313 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)))))

(declare-fun b!898154 () Bool)

(assert (=> b!898154 (= e!502386 (validKeyInArray!0 (select (arr!25325 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898155 () Bool)

(declare-fun e!502390 () Bool)

(assert (=> b!898155 (= e!502383 e!502390)))

(declare-fun res!607021 () Bool)

(assert (=> b!898155 (= res!607021 call!39829)))

(assert (=> b!898155 (=> (not res!607021) (not e!502390))))

(declare-fun b!898156 () Bool)

(assert (=> b!898156 (= e!502388 call!39830)))

(declare-fun b!898157 () Bool)

(assert (=> b!898157 (= e!502381 e!502379)))

(assert (=> b!898157 (= c!94875 (and (not (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5122 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!898158 () Bool)

(assert (=> b!898158 (= e!502389 e!502385)))

(declare-fun res!607020 () Bool)

(assert (=> b!898158 (=> (not res!607020) (not e!502385))))

(assert (=> b!898158 (= res!607020 (contains!4378 lt!405333 (select (arr!25325 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898158 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25782 (_keys!10175 thiss!1181))))))

(declare-fun bm!39824 () Bool)

(assert (=> bm!39824 (= call!39824 call!39827)))

(declare-fun bm!39825 () Bool)

(assert (=> bm!39825 (= call!39830 call!39825)))

(declare-fun b!898159 () Bool)

(assert (=> b!898159 (= e!502390 (= (apply!405 lt!405333 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5226 thiss!1181)))))

(declare-fun b!898160 () Bool)

(assert (=> b!898160 (= e!502381 (+!2616 call!39825 (tuple2!12049 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5226 thiss!1181))))))

(declare-fun b!898161 () Bool)

(assert (=> b!898161 (= e!502384 e!502382)))

(declare-fun res!607018 () Bool)

(assert (=> b!898161 (= res!607018 call!39828)))

(assert (=> b!898161 (=> (not res!607018) (not e!502382))))

(declare-fun bm!39826 () Bool)

(assert (=> bm!39826 (= call!39828 (contains!4378 lt!405333 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!39827 () Bool)

(assert (=> bm!39827 (= call!39827 call!39826)))

(assert (= (and d!111035 c!94877) b!898160))

(assert (= (and d!111035 (not c!94877)) b!898157))

(assert (= (and b!898157 c!94875) b!898146))

(assert (= (and b!898157 (not c!94875)) b!898142))

(assert (= (and b!898142 c!94874) b!898156))

(assert (= (and b!898142 (not c!94874)) b!898150))

(assert (= (or b!898156 b!898150) bm!39824))

(assert (= (or b!898146 bm!39824) bm!39827))

(assert (= (or b!898146 b!898156) bm!39825))

(assert (= (or b!898160 bm!39827) bm!39823))

(assert (= (or b!898160 bm!39825) bm!39821))

(assert (= (and d!111035 res!607022) b!898143))

(assert (= (and d!111035 c!94876) b!898147))

(assert (= (and d!111035 (not c!94876)) b!898152))

(assert (= (and d!111035 res!607023) b!898144))

(assert (= (and b!898144 res!607016) b!898154))

(assert (= (and b!898144 (not res!607019)) b!898158))

(assert (= (and b!898158 res!607020) b!898148))

(assert (= (and b!898144 res!607024) b!898141))

(assert (= (and b!898141 c!94873) b!898161))

(assert (= (and b!898141 (not c!94873)) b!898145))

(assert (= (and b!898161 res!607018) b!898153))

(assert (= (or b!898161 b!898145) bm!39826))

(assert (= (and b!898141 res!607017) b!898149))

(assert (= (and b!898149 c!94878) b!898155))

(assert (= (and b!898149 (not c!94878)) b!898151))

(assert (= (and b!898155 res!607021) b!898159))

(assert (= (or b!898155 b!898151) bm!39822))

(declare-fun b_lambda!12941 () Bool)

(assert (=> (not b_lambda!12941) (not b!898148)))

(declare-fun t!25178 () Bool)

(declare-fun tb!5183 () Bool)

(assert (=> (and b!898002 (= (defaultEntry!5407 thiss!1181) (defaultEntry!5407 thiss!1181)) t!25178) tb!5183))

(declare-fun result!10137 () Bool)

(assert (=> tb!5183 (= result!10137 tp_is_empty!18337)))

(assert (=> b!898148 t!25178))

(declare-fun b_and!26281 () Bool)

(assert (= b_and!26275 (and (=> t!25178 result!10137) b_and!26281)))

(declare-fun m!834111 () Bool)

(assert (=> bm!39823 m!834111))

(assert (=> b!898154 m!834105))

(assert (=> b!898154 m!834105))

(declare-fun m!834113 () Bool)

(assert (=> b!898154 m!834113))

(declare-fun m!834115 () Bool)

(assert (=> b!898153 m!834115))

(declare-fun m!834117 () Bool)

(assert (=> b!898147 m!834117))

(declare-fun m!834119 () Bool)

(assert (=> b!898147 m!834119))

(declare-fun m!834121 () Bool)

(assert (=> b!898147 m!834121))

(declare-fun m!834123 () Bool)

(assert (=> b!898147 m!834123))

(declare-fun m!834125 () Bool)

(assert (=> b!898147 m!834125))

(declare-fun m!834127 () Bool)

(assert (=> b!898147 m!834127))

(declare-fun m!834129 () Bool)

(assert (=> b!898147 m!834129))

(declare-fun m!834131 () Bool)

(assert (=> b!898147 m!834131))

(assert (=> b!898147 m!834111))

(declare-fun m!834133 () Bool)

(assert (=> b!898147 m!834133))

(assert (=> b!898147 m!834105))

(assert (=> b!898147 m!834119))

(assert (=> b!898147 m!834131))

(declare-fun m!834135 () Bool)

(assert (=> b!898147 m!834135))

(declare-fun m!834137 () Bool)

(assert (=> b!898147 m!834137))

(declare-fun m!834139 () Bool)

(assert (=> b!898147 m!834139))

(assert (=> b!898147 m!834125))

(declare-fun m!834141 () Bool)

(assert (=> b!898147 m!834141))

(declare-fun m!834143 () Bool)

(assert (=> b!898147 m!834143))

(assert (=> b!898147 m!834127))

(declare-fun m!834145 () Bool)

(assert (=> b!898147 m!834145))

(declare-fun m!834147 () Bool)

(assert (=> b!898159 m!834147))

(assert (=> d!111035 m!833997))

(declare-fun m!834149 () Bool)

(assert (=> b!898160 m!834149))

(declare-fun m!834151 () Bool)

(assert (=> bm!39822 m!834151))

(declare-fun m!834153 () Bool)

(assert (=> bm!39821 m!834153))

(declare-fun m!834155 () Bool)

(assert (=> bm!39826 m!834155))

(declare-fun m!834157 () Bool)

(assert (=> b!898148 m!834157))

(declare-fun m!834159 () Bool)

(assert (=> b!898148 m!834159))

(declare-fun m!834161 () Bool)

(assert (=> b!898148 m!834161))

(assert (=> b!898148 m!834105))

(assert (=> b!898148 m!834157))

(assert (=> b!898148 m!834105))

(declare-fun m!834163 () Bool)

(assert (=> b!898148 m!834163))

(assert (=> b!898148 m!834159))

(assert (=> b!898143 m!834105))

(assert (=> b!898143 m!834105))

(assert (=> b!898143 m!834113))

(assert (=> b!898158 m!834105))

(assert (=> b!898158 m!834105))

(declare-fun m!834165 () Bool)

(assert (=> b!898158 m!834165))

(assert (=> b!898005 d!111035))

(declare-fun d!111037 () Bool)

(declare-fun e!502393 () Bool)

(assert (=> d!111037 e!502393))

(declare-fun res!607027 () Bool)

(assert (=> d!111037 (=> (not res!607027) (not e!502393))))

(assert (=> d!111037 (= res!607027 (and (bvsge (index!38068 lt!405221) #b00000000000000000000000000000000) (bvslt (index!38068 lt!405221) (size!25782 (_keys!10175 thiss!1181)))))))

(declare-fun lt!405347 () Unit!30468)

(declare-fun choose!1498 (array!52693 array!52695 (_ BitVec 32) (_ BitVec 32) V!29415 V!29415 (_ BitVec 32) Int) Unit!30468)

(assert (=> d!111037 (= lt!405347 (choose!1498 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) (index!38068 lt!405221) (defaultEntry!5407 thiss!1181)))))

(assert (=> d!111037 (validMask!0 (mask!26124 thiss!1181))))

(assert (=> d!111037 (= (lemmaValidKeyInArrayIsInListMap!238 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) (index!38068 lt!405221) (defaultEntry!5407 thiss!1181)) lt!405347)))

(declare-fun b!898166 () Bool)

(assert (=> b!898166 (= e!502393 (contains!4378 (getCurrentListMap!2602 (_keys!10175 thiss!1181) (_values!5413 thiss!1181) (mask!26124 thiss!1181) (extraKeys!5122 thiss!1181) (zeroValue!5226 thiss!1181) (minValue!5226 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5407 thiss!1181)) (select (arr!25325 (_keys!10175 thiss!1181)) (index!38068 lt!405221))))))

(assert (= (and d!111037 res!607027) b!898166))

(declare-fun m!834167 () Bool)

(assert (=> d!111037 m!834167))

(assert (=> d!111037 m!833997))

(assert (=> b!898166 m!833999))

(assert (=> b!898166 m!833993))

(assert (=> b!898166 m!833999))

(assert (=> b!898166 m!833993))

(assert (=> b!898166 m!834001))

(assert (=> b!898005 d!111037))

(declare-fun mapNonEmpty!29166 () Bool)

(declare-fun mapRes!29166 () Bool)

(declare-fun tp!56109 () Bool)

(declare-fun e!502398 () Bool)

(assert (=> mapNonEmpty!29166 (= mapRes!29166 (and tp!56109 e!502398))))

(declare-fun mapRest!29166 () (Array (_ BitVec 32) ValueCell!8687))

(declare-fun mapValue!29166 () ValueCell!8687)

(declare-fun mapKey!29166 () (_ BitVec 32))

(assert (=> mapNonEmpty!29166 (= mapRest!29157 (store mapRest!29166 mapKey!29166 mapValue!29166))))

(declare-fun b!898174 () Bool)

(declare-fun e!502399 () Bool)

(assert (=> b!898174 (= e!502399 tp_is_empty!18337)))

(declare-fun mapIsEmpty!29166 () Bool)

(assert (=> mapIsEmpty!29166 mapRes!29166))

(declare-fun condMapEmpty!29166 () Bool)

(declare-fun mapDefault!29166 () ValueCell!8687)

(assert (=> mapNonEmpty!29157 (= condMapEmpty!29166 (= mapRest!29157 ((as const (Array (_ BitVec 32) ValueCell!8687)) mapDefault!29166)))))

(assert (=> mapNonEmpty!29157 (= tp!56093 (and e!502399 mapRes!29166))))

(declare-fun b!898173 () Bool)

(assert (=> b!898173 (= e!502398 tp_is_empty!18337)))

(assert (= (and mapNonEmpty!29157 condMapEmpty!29166) mapIsEmpty!29166))

(assert (= (and mapNonEmpty!29157 (not condMapEmpty!29166)) mapNonEmpty!29166))

(assert (= (and mapNonEmpty!29166 ((_ is ValueCellFull!8687) mapValue!29166)) b!898173))

(assert (= (and mapNonEmpty!29157 ((_ is ValueCellFull!8687) mapDefault!29166)) b!898174))

(declare-fun m!834169 () Bool)

(assert (=> mapNonEmpty!29166 m!834169))

(declare-fun b_lambda!12943 () Bool)

(assert (= b_lambda!12941 (or (and b!898002 b_free!16009) b_lambda!12943)))

(check-sat (not d!111017) (not mapNonEmpty!29166) (not b_next!16009) (not b!898154) (not b!898148) (not d!111037) (not d!111033) b_and!26281 tp_is_empty!18337 (not b!898081) (not b!898159) (not b!898158) (not b!898147) (not b!898083) (not b!898090) (not bm!39822) (not bm!39821) (not d!111015) (not b!898160) (not b!898166) (not d!111029) (not d!111021) (not b_lambda!12943) (not bm!39826) (not b!898056) (not d!111035) (not b!898092) (not b!898098) (not bm!39823) (not b!898153) (not b!898143) (not b!898082) (not b!898069))
(check-sat b_and!26281 (not b_next!16009))
