; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76786 () Bool)

(assert start!76786)

(declare-fun b!898198 () Bool)

(declare-fun b_free!16015 () Bool)

(declare-fun b_next!16015 () Bool)

(assert (=> b!898198 (= b_free!16015 (not b_next!16015))))

(declare-fun tp!56114 () Bool)

(declare-fun b_and!26283 () Bool)

(assert (=> b!898198 (= tp!56114 b_and!26283)))

(declare-fun b!898193 () Bool)

(declare-fun e!502422 () Bool)

(declare-fun tp_is_empty!18343 () Bool)

(assert (=> b!898193 (= e!502422 tp_is_empty!18343)))

(declare-fun b!898194 () Bool)

(declare-fun e!502425 () Bool)

(declare-datatypes ((SeekEntryResult!8927 0))(
  ( (MissingZero!8927 (index!38079 (_ BitVec 32))) (Found!8927 (index!38080 (_ BitVec 32))) (Intermediate!8927 (undefined!9739 Bool) (index!38081 (_ BitVec 32)) (x!76569 (_ BitVec 32))) (Undefined!8927) (MissingVacant!8927 (index!38082 (_ BitVec 32))) )
))
(declare-fun lt!405358 () SeekEntryResult!8927)

(declare-datatypes ((array!52707 0))(
  ( (array!52708 (arr!25331 (Array (_ BitVec 32) (_ BitVec 64))) (size!25788 (_ BitVec 32))) )
))
(declare-datatypes ((V!29423 0))(
  ( (V!29424 (val!9222 Int)) )
))
(declare-datatypes ((ValueCell!8690 0))(
  ( (ValueCellFull!8690 (v!11710 V!29423)) (EmptyCell!8690) )
))
(declare-datatypes ((array!52709 0))(
  ( (array!52710 (arr!25332 (Array (_ BitVec 32) ValueCell!8690)) (size!25789 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4396 0))(
  ( (LongMapFixedSize!4397 (defaultEntry!5412 Int) (mask!26135 (_ BitVec 32)) (extraKeys!5128 (_ BitVec 32)) (zeroValue!5232 V!29423) (minValue!5232 V!29423) (_size!2253 (_ BitVec 32)) (_keys!10182 array!52707) (_values!5419 array!52709) (_vacant!2253 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4396)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898194 (= e!502425 (inRange!0 (index!38080 lt!405358) (mask!26135 thiss!1181)))))

(declare-fun b!898195 () Bool)

(declare-fun e!502421 () Bool)

(assert (=> b!898195 (= e!502421 (= (size!25789 (_values!5419 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26135 thiss!1181))))))

(declare-fun b!898196 () Bool)

(declare-fun e!502419 () Bool)

(declare-fun mapRes!29169 () Bool)

(assert (=> b!898196 (= e!502419 (and e!502422 mapRes!29169))))

(declare-fun condMapEmpty!29169 () Bool)

(declare-fun mapDefault!29169 () ValueCell!8690)

(assert (=> b!898196 (= condMapEmpty!29169 (= (arr!25332 (_values!5419 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8690)) mapDefault!29169)))))

(declare-fun b!898197 () Bool)

(declare-fun e!502426 () Bool)

(assert (=> b!898197 (= e!502426 e!502421)))

(declare-fun res!607040 () Bool)

(assert (=> b!898197 (=> res!607040 e!502421)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898197 (= res!607040 (not (validMask!0 (mask!26135 thiss!1181))))))

(declare-datatypes ((tuple2!12054 0))(
  ( (tuple2!12055 (_1!6038 (_ BitVec 64)) (_2!6038 V!29423)) )
))
(declare-datatypes ((List!17848 0))(
  ( (Nil!17845) (Cons!17844 (h!18986 tuple2!12054) (t!25180 List!17848)) )
))
(declare-datatypes ((ListLongMap!10741 0))(
  ( (ListLongMap!10742 (toList!5386 List!17848)) )
))
(declare-fun contains!4381 (ListLongMap!10741 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2605 (array!52707 array!52709 (_ BitVec 32) (_ BitVec 32) V!29423 V!29423 (_ BitVec 32) Int) ListLongMap!10741)

(assert (=> b!898197 (contains!4381 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358)))))

(declare-datatypes ((Unit!30476 0))(
  ( (Unit!30477) )
))
(declare-fun lt!405359 () Unit!30476)

(declare-fun lemmaValidKeyInArrayIsInListMap!241 (array!52707 array!52709 (_ BitVec 32) (_ BitVec 32) V!29423 V!29423 (_ BitVec 32) Int) Unit!30476)

(assert (=> b!898197 (= lt!405359 (lemmaValidKeyInArrayIsInListMap!241 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) (index!38080 lt!405358) (defaultEntry!5412 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898197 (arrayContainsKey!0 (_keys!10182 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405356 () Unit!30476)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52707 (_ BitVec 64) (_ BitVec 32)) Unit!30476)

(assert (=> b!898197 (= lt!405356 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10182 thiss!1181) key!785 (index!38080 lt!405358)))))

(declare-fun res!607039 () Bool)

(declare-fun e!502424 () Bool)

(assert (=> start!76786 (=> (not res!607039) (not e!502424))))

(declare-fun valid!1698 (LongMapFixedSize!4396) Bool)

(assert (=> start!76786 (= res!607039 (valid!1698 thiss!1181))))

(assert (=> start!76786 e!502424))

(declare-fun e!502423 () Bool)

(assert (=> start!76786 e!502423))

(assert (=> start!76786 true))

(declare-fun array_inv!19932 (array!52707) Bool)

(declare-fun array_inv!19933 (array!52709) Bool)

(assert (=> b!898198 (= e!502423 (and tp!56114 tp_is_empty!18343 (array_inv!19932 (_keys!10182 thiss!1181)) (array_inv!19933 (_values!5419 thiss!1181)) e!502419))))

(declare-fun mapNonEmpty!29169 () Bool)

(declare-fun tp!56115 () Bool)

(declare-fun e!502418 () Bool)

(assert (=> mapNonEmpty!29169 (= mapRes!29169 (and tp!56115 e!502418))))

(declare-fun mapRest!29169 () (Array (_ BitVec 32) ValueCell!8690))

(declare-fun mapValue!29169 () ValueCell!8690)

(declare-fun mapKey!29169 () (_ BitVec 32))

(assert (=> mapNonEmpty!29169 (= (arr!25332 (_values!5419 thiss!1181)) (store mapRest!29169 mapKey!29169 mapValue!29169))))

(declare-fun mapIsEmpty!29169 () Bool)

(assert (=> mapIsEmpty!29169 mapRes!29169))

(declare-fun b!898199 () Bool)

(declare-fun res!607038 () Bool)

(assert (=> b!898199 (=> (not res!607038) (not e!502424))))

(assert (=> b!898199 (= res!607038 (not (= key!785 (bvneg key!785))))))

(declare-fun b!898200 () Bool)

(assert (=> b!898200 (= e!502418 tp_is_empty!18343)))

(declare-fun b!898201 () Bool)

(assert (=> b!898201 (= e!502424 (not e!502426))))

(declare-fun res!607042 () Bool)

(assert (=> b!898201 (=> res!607042 e!502426)))

(get-info :version)

(assert (=> b!898201 (= res!607042 (not ((_ is Found!8927) lt!405358)))))

(assert (=> b!898201 e!502425))

(declare-fun res!607041 () Bool)

(assert (=> b!898201 (=> res!607041 e!502425)))

(assert (=> b!898201 (= res!607041 (not ((_ is Found!8927) lt!405358)))))

(declare-fun lt!405357 () Unit!30476)

(declare-fun lemmaSeekEntryGivesInRangeIndex!93 (array!52707 array!52709 (_ BitVec 32) (_ BitVec 32) V!29423 V!29423 (_ BitVec 64)) Unit!30476)

(assert (=> b!898201 (= lt!405357 (lemmaSeekEntryGivesInRangeIndex!93 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52707 (_ BitVec 32)) SeekEntryResult!8927)

(assert (=> b!898201 (= lt!405358 (seekEntry!0 key!785 (_keys!10182 thiss!1181) (mask!26135 thiss!1181)))))

(assert (= (and start!76786 res!607039) b!898199))

(assert (= (and b!898199 res!607038) b!898201))

(assert (= (and b!898201 (not res!607041)) b!898194))

(assert (= (and b!898201 (not res!607042)) b!898197))

(assert (= (and b!898197 (not res!607040)) b!898195))

(assert (= (and b!898196 condMapEmpty!29169) mapIsEmpty!29169))

(assert (= (and b!898196 (not condMapEmpty!29169)) mapNonEmpty!29169))

(assert (= (and mapNonEmpty!29169 ((_ is ValueCellFull!8690) mapValue!29169)) b!898200))

(assert (= (and b!898196 ((_ is ValueCellFull!8690) mapDefault!29169)) b!898193))

(assert (= b!898198 b!898196))

(assert (= start!76786 b!898198))

(declare-fun m!834171 () Bool)

(assert (=> b!898197 m!834171))

(declare-fun m!834173 () Bool)

(assert (=> b!898197 m!834173))

(declare-fun m!834175 () Bool)

(assert (=> b!898197 m!834175))

(declare-fun m!834177 () Bool)

(assert (=> b!898197 m!834177))

(declare-fun m!834179 () Bool)

(assert (=> b!898197 m!834179))

(assert (=> b!898197 m!834177))

(declare-fun m!834181 () Bool)

(assert (=> b!898197 m!834181))

(declare-fun m!834183 () Bool)

(assert (=> b!898197 m!834183))

(assert (=> b!898197 m!834181))

(declare-fun m!834185 () Bool)

(assert (=> start!76786 m!834185))

(declare-fun m!834187 () Bool)

(assert (=> b!898198 m!834187))

(declare-fun m!834189 () Bool)

(assert (=> b!898198 m!834189))

(declare-fun m!834191 () Bool)

(assert (=> b!898194 m!834191))

(declare-fun m!834193 () Bool)

(assert (=> b!898201 m!834193))

(declare-fun m!834195 () Bool)

(assert (=> b!898201 m!834195))

(declare-fun m!834197 () Bool)

(assert (=> mapNonEmpty!29169 m!834197))

(check-sat (not mapNonEmpty!29169) (not b!898198) b_and!26283 (not start!76786) (not b!898194) (not b!898197) (not b_next!16015) (not b!898201) tp_is_empty!18343)
(check-sat b_and!26283 (not b_next!16015))
(get-model)

(declare-fun d!111041 () Bool)

(assert (=> d!111041 (= (inRange!0 (index!38080 lt!405358) (mask!26135 thiss!1181)) (and (bvsge (index!38080 lt!405358) #b00000000000000000000000000000000) (bvslt (index!38080 lt!405358) (bvadd (mask!26135 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898194 d!111041))

(declare-fun d!111043 () Bool)

(declare-fun e!502483 () Bool)

(assert (=> d!111043 e!502483))

(declare-fun res!607075 () Bool)

(assert (=> d!111043 (=> res!607075 e!502483)))

(declare-fun lt!405389 () SeekEntryResult!8927)

(assert (=> d!111043 (= res!607075 (not ((_ is Found!8927) lt!405389)))))

(assert (=> d!111043 (= lt!405389 (seekEntry!0 key!785 (_keys!10182 thiss!1181) (mask!26135 thiss!1181)))))

(declare-fun lt!405388 () Unit!30476)

(declare-fun choose!1499 (array!52707 array!52709 (_ BitVec 32) (_ BitVec 32) V!29423 V!29423 (_ BitVec 64)) Unit!30476)

(assert (=> d!111043 (= lt!405388 (choose!1499 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) key!785))))

(assert (=> d!111043 (validMask!0 (mask!26135 thiss!1181))))

(assert (=> d!111043 (= (lemmaSeekEntryGivesInRangeIndex!93 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) key!785) lt!405388)))

(declare-fun b!898258 () Bool)

(assert (=> b!898258 (= e!502483 (inRange!0 (index!38080 lt!405389) (mask!26135 thiss!1181)))))

(assert (= (and d!111043 (not res!607075)) b!898258))

(assert (=> d!111043 m!834195))

(declare-fun m!834255 () Bool)

(assert (=> d!111043 m!834255))

(assert (=> d!111043 m!834175))

(declare-fun m!834257 () Bool)

(assert (=> b!898258 m!834257))

(assert (=> b!898201 d!111043))

(declare-fun b!898271 () Bool)

(declare-fun c!94885 () Bool)

(declare-fun lt!405399 () (_ BitVec 64))

(assert (=> b!898271 (= c!94885 (= lt!405399 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502491 () SeekEntryResult!8927)

(declare-fun e!502490 () SeekEntryResult!8927)

(assert (=> b!898271 (= e!502491 e!502490)))

(declare-fun b!898272 () Bool)

(declare-fun e!502492 () SeekEntryResult!8927)

(assert (=> b!898272 (= e!502492 e!502491)))

(declare-fun lt!405401 () SeekEntryResult!8927)

(assert (=> b!898272 (= lt!405399 (select (arr!25331 (_keys!10182 thiss!1181)) (index!38081 lt!405401)))))

(declare-fun c!94887 () Bool)

(assert (=> b!898272 (= c!94887 (= lt!405399 key!785))))

(declare-fun b!898273 () Bool)

(declare-fun lt!405400 () SeekEntryResult!8927)

(assert (=> b!898273 (= e!502490 (ite ((_ is MissingVacant!8927) lt!405400) (MissingZero!8927 (index!38082 lt!405400)) lt!405400))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52707 (_ BitVec 32)) SeekEntryResult!8927)

(assert (=> b!898273 (= lt!405400 (seekKeyOrZeroReturnVacant!0 (x!76569 lt!405401) (index!38081 lt!405401) (index!38081 lt!405401) key!785 (_keys!10182 thiss!1181) (mask!26135 thiss!1181)))))

(declare-fun b!898274 () Bool)

(assert (=> b!898274 (= e!502492 Undefined!8927)))

(declare-fun d!111045 () Bool)

(declare-fun lt!405398 () SeekEntryResult!8927)

(assert (=> d!111045 (and (or ((_ is MissingVacant!8927) lt!405398) (not ((_ is Found!8927) lt!405398)) (and (bvsge (index!38080 lt!405398) #b00000000000000000000000000000000) (bvslt (index!38080 lt!405398) (size!25788 (_keys!10182 thiss!1181))))) (not ((_ is MissingVacant!8927) lt!405398)) (or (not ((_ is Found!8927) lt!405398)) (= (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405398)) key!785)))))

(assert (=> d!111045 (= lt!405398 e!502492)))

(declare-fun c!94886 () Bool)

(assert (=> d!111045 (= c!94886 (and ((_ is Intermediate!8927) lt!405401) (undefined!9739 lt!405401)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52707 (_ BitVec 32)) SeekEntryResult!8927)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111045 (= lt!405401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26135 thiss!1181)) key!785 (_keys!10182 thiss!1181) (mask!26135 thiss!1181)))))

(assert (=> d!111045 (validMask!0 (mask!26135 thiss!1181))))

(assert (=> d!111045 (= (seekEntry!0 key!785 (_keys!10182 thiss!1181) (mask!26135 thiss!1181)) lt!405398)))

(declare-fun b!898275 () Bool)

(assert (=> b!898275 (= e!502491 (Found!8927 (index!38081 lt!405401)))))

(declare-fun b!898276 () Bool)

(assert (=> b!898276 (= e!502490 (MissingZero!8927 (index!38081 lt!405401)))))

(assert (= (and d!111045 c!94886) b!898274))

(assert (= (and d!111045 (not c!94886)) b!898272))

(assert (= (and b!898272 c!94887) b!898275))

(assert (= (and b!898272 (not c!94887)) b!898271))

(assert (= (and b!898271 c!94885) b!898276))

(assert (= (and b!898271 (not c!94885)) b!898273))

(declare-fun m!834259 () Bool)

(assert (=> b!898272 m!834259))

(declare-fun m!834261 () Bool)

(assert (=> b!898273 m!834261))

(declare-fun m!834263 () Bool)

(assert (=> d!111045 m!834263))

(declare-fun m!834265 () Bool)

(assert (=> d!111045 m!834265))

(assert (=> d!111045 m!834265))

(declare-fun m!834267 () Bool)

(assert (=> d!111045 m!834267))

(assert (=> d!111045 m!834175))

(assert (=> b!898201 d!111045))

(declare-fun d!111047 () Bool)

(declare-fun e!502495 () Bool)

(assert (=> d!111047 e!502495))

(declare-fun res!607078 () Bool)

(assert (=> d!111047 (=> (not res!607078) (not e!502495))))

(assert (=> d!111047 (= res!607078 (and (bvsge (index!38080 lt!405358) #b00000000000000000000000000000000) (bvslt (index!38080 lt!405358) (size!25788 (_keys!10182 thiss!1181)))))))

(declare-fun lt!405404 () Unit!30476)

(declare-fun choose!1500 (array!52707 array!52709 (_ BitVec 32) (_ BitVec 32) V!29423 V!29423 (_ BitVec 32) Int) Unit!30476)

(assert (=> d!111047 (= lt!405404 (choose!1500 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) (index!38080 lt!405358) (defaultEntry!5412 thiss!1181)))))

(assert (=> d!111047 (validMask!0 (mask!26135 thiss!1181))))

(assert (=> d!111047 (= (lemmaValidKeyInArrayIsInListMap!241 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) (index!38080 lt!405358) (defaultEntry!5412 thiss!1181)) lt!405404)))

(declare-fun b!898279 () Bool)

(assert (=> b!898279 (= e!502495 (contains!4381 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))))))

(assert (= (and d!111047 res!607078) b!898279))

(declare-fun m!834269 () Bool)

(assert (=> d!111047 m!834269))

(assert (=> d!111047 m!834175))

(assert (=> b!898279 m!834177))

(assert (=> b!898279 m!834181))

(assert (=> b!898279 m!834177))

(assert (=> b!898279 m!834181))

(assert (=> b!898279 m!834183))

(assert (=> b!898197 d!111047))

(declare-fun d!111049 () Bool)

(assert (=> d!111049 (arrayContainsKey!0 (_keys!10182 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405407 () Unit!30476)

(declare-fun choose!13 (array!52707 (_ BitVec 64) (_ BitVec 32)) Unit!30476)

(assert (=> d!111049 (= lt!405407 (choose!13 (_keys!10182 thiss!1181) key!785 (index!38080 lt!405358)))))

(assert (=> d!111049 (bvsge (index!38080 lt!405358) #b00000000000000000000000000000000)))

(assert (=> d!111049 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10182 thiss!1181) key!785 (index!38080 lt!405358)) lt!405407)))

(declare-fun bs!25181 () Bool)

(assert (= bs!25181 d!111049))

(assert (=> bs!25181 m!834171))

(declare-fun m!834271 () Bool)

(assert (=> bs!25181 m!834271))

(assert (=> b!898197 d!111049))

(declare-fun d!111051 () Bool)

(assert (=> d!111051 (= (validMask!0 (mask!26135 thiss!1181)) (and (or (= (mask!26135 thiss!1181) #b00000000000000000000000000000111) (= (mask!26135 thiss!1181) #b00000000000000000000000000001111) (= (mask!26135 thiss!1181) #b00000000000000000000000000011111) (= (mask!26135 thiss!1181) #b00000000000000000000000000111111) (= (mask!26135 thiss!1181) #b00000000000000000000000001111111) (= (mask!26135 thiss!1181) #b00000000000000000000000011111111) (= (mask!26135 thiss!1181) #b00000000000000000000000111111111) (= (mask!26135 thiss!1181) #b00000000000000000000001111111111) (= (mask!26135 thiss!1181) #b00000000000000000000011111111111) (= (mask!26135 thiss!1181) #b00000000000000000000111111111111) (= (mask!26135 thiss!1181) #b00000000000000000001111111111111) (= (mask!26135 thiss!1181) #b00000000000000000011111111111111) (= (mask!26135 thiss!1181) #b00000000000000000111111111111111) (= (mask!26135 thiss!1181) #b00000000000000001111111111111111) (= (mask!26135 thiss!1181) #b00000000000000011111111111111111) (= (mask!26135 thiss!1181) #b00000000000000111111111111111111) (= (mask!26135 thiss!1181) #b00000000000001111111111111111111) (= (mask!26135 thiss!1181) #b00000000000011111111111111111111) (= (mask!26135 thiss!1181) #b00000000000111111111111111111111) (= (mask!26135 thiss!1181) #b00000000001111111111111111111111) (= (mask!26135 thiss!1181) #b00000000011111111111111111111111) (= (mask!26135 thiss!1181) #b00000000111111111111111111111111) (= (mask!26135 thiss!1181) #b00000001111111111111111111111111) (= (mask!26135 thiss!1181) #b00000011111111111111111111111111) (= (mask!26135 thiss!1181) #b00000111111111111111111111111111) (= (mask!26135 thiss!1181) #b00001111111111111111111111111111) (= (mask!26135 thiss!1181) #b00011111111111111111111111111111) (= (mask!26135 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26135 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!898197 d!111051))

(declare-fun d!111053 () Bool)

(declare-fun res!607083 () Bool)

(declare-fun e!502500 () Bool)

(assert (=> d!111053 (=> res!607083 e!502500)))

(assert (=> d!111053 (= res!607083 (= (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111053 (= (arrayContainsKey!0 (_keys!10182 thiss!1181) key!785 #b00000000000000000000000000000000) e!502500)))

(declare-fun b!898284 () Bool)

(declare-fun e!502501 () Bool)

(assert (=> b!898284 (= e!502500 e!502501)))

(declare-fun res!607084 () Bool)

(assert (=> b!898284 (=> (not res!607084) (not e!502501))))

(assert (=> b!898284 (= res!607084 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25788 (_keys!10182 thiss!1181))))))

(declare-fun b!898285 () Bool)

(assert (=> b!898285 (= e!502501 (arrayContainsKey!0 (_keys!10182 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111053 (not res!607083)) b!898284))

(assert (= (and b!898284 res!607084) b!898285))

(declare-fun m!834273 () Bool)

(assert (=> d!111053 m!834273))

(declare-fun m!834275 () Bool)

(assert (=> b!898285 m!834275))

(assert (=> b!898197 d!111053))

(declare-fun bm!39842 () Bool)

(declare-fun call!39848 () ListLongMap!10741)

(declare-fun call!39850 () ListLongMap!10741)

(assert (=> bm!39842 (= call!39848 call!39850)))

(declare-fun b!898328 () Bool)

(declare-fun c!94900 () Bool)

(assert (=> b!898328 (= c!94900 (and (not (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!502536 () ListLongMap!10741)

(declare-fun e!502532 () ListLongMap!10741)

(assert (=> b!898328 (= e!502536 e!502532)))

(declare-fun b!898329 () Bool)

(declare-fun e!502528 () Bool)

(declare-fun call!39845 () Bool)

(assert (=> b!898329 (= e!502528 (not call!39845))))

(declare-fun b!898330 () Bool)

(assert (=> b!898330 (= e!502532 call!39848)))

(declare-fun b!898331 () Bool)

(declare-fun e!502531 () Bool)

(declare-fun lt!405459 () ListLongMap!10741)

(declare-fun apply!406 (ListLongMap!10741 (_ BitVec 64)) V!29423)

(assert (=> b!898331 (= e!502531 (= (apply!406 lt!405459 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5232 thiss!1181)))))

(declare-fun b!898332 () Bool)

(declare-fun res!607106 () Bool)

(declare-fun e!502537 () Bool)

(assert (=> b!898332 (=> (not res!607106) (not e!502537))))

(declare-fun e!502539 () Bool)

(assert (=> b!898332 (= res!607106 e!502539)))

(declare-fun res!607109 () Bool)

(assert (=> b!898332 (=> res!607109 e!502539)))

(declare-fun e!502540 () Bool)

(assert (=> b!898332 (= res!607109 (not e!502540))))

(declare-fun res!607108 () Bool)

(assert (=> b!898332 (=> (not res!607108) (not e!502540))))

(assert (=> b!898332 (= res!607108 (bvslt #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))))))

(declare-fun bm!39843 () Bool)

(declare-fun call!39851 () ListLongMap!10741)

(declare-fun call!39846 () ListLongMap!10741)

(assert (=> bm!39843 (= call!39851 call!39846)))

(declare-fun b!898333 () Bool)

(declare-fun e!502529 () Bool)

(declare-fun get!13321 (ValueCell!8690 V!29423) V!29423)

(declare-fun dynLambda!1300 (Int (_ BitVec 64)) V!29423)

(assert (=> b!898333 (= e!502529 (= (apply!406 lt!405459 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)) (get!13321 (select (arr!25332 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1300 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!898333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25789 (_values!5419 thiss!1181))))))

(assert (=> b!898333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))))))

(declare-fun bm!39844 () Bool)

(declare-fun call!39849 () Bool)

(assert (=> bm!39844 (= call!39849 (contains!4381 lt!405459 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!111055 () Bool)

(assert (=> d!111055 e!502537))

(declare-fun res!607107 () Bool)

(assert (=> d!111055 (=> (not res!607107) (not e!502537))))

(assert (=> d!111055 (= res!607107 (or (bvsge #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))))))))

(declare-fun lt!405470 () ListLongMap!10741)

(assert (=> d!111055 (= lt!405459 lt!405470)))

(declare-fun lt!405453 () Unit!30476)

(declare-fun e!502533 () Unit!30476)

(assert (=> d!111055 (= lt!405453 e!502533)))

(declare-fun c!94903 () Bool)

(declare-fun e!502530 () Bool)

(assert (=> d!111055 (= c!94903 e!502530)))

(declare-fun res!607103 () Bool)

(assert (=> d!111055 (=> (not res!607103) (not e!502530))))

(assert (=> d!111055 (= res!607103 (bvslt #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))))))

(declare-fun e!502538 () ListLongMap!10741)

(assert (=> d!111055 (= lt!405470 e!502538)))

(declare-fun c!94904 () Bool)

(assert (=> d!111055 (= c!94904 (and (not (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111055 (validMask!0 (mask!26135 thiss!1181))))

(assert (=> d!111055 (= (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)) lt!405459)))

(declare-fun b!898334 () Bool)

(declare-fun e!502534 () Bool)

(assert (=> b!898334 (= e!502537 e!502534)))

(declare-fun c!94902 () Bool)

(assert (=> b!898334 (= c!94902 (not (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!898335 () Bool)

(declare-fun e!502535 () Bool)

(assert (=> b!898335 (= e!502535 (= (apply!406 lt!405459 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5232 thiss!1181)))))

(declare-fun b!898336 () Bool)

(assert (=> b!898336 (= e!502536 call!39851)))

(declare-fun b!898337 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898337 (= e!502530 (validKeyInArray!0 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898338 () Bool)

(assert (=> b!898338 (= e!502540 (validKeyInArray!0 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898339 () Bool)

(assert (=> b!898339 (= e!502528 e!502535)))

(declare-fun res!607110 () Bool)

(assert (=> b!898339 (= res!607110 call!39845)))

(assert (=> b!898339 (=> (not res!607110) (not e!502535))))

(declare-fun bm!39845 () Bool)

(assert (=> bm!39845 (= call!39845 (contains!4381 lt!405459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!39847 () ListLongMap!10741)

(declare-fun c!94905 () Bool)

(declare-fun bm!39846 () Bool)

(declare-fun +!2617 (ListLongMap!10741 tuple2!12054) ListLongMap!10741)

(assert (=> bm!39846 (= call!39846 (+!2617 (ite c!94904 call!39847 (ite c!94905 call!39850 call!39848)) (ite (or c!94904 c!94905) (tuple2!12055 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))

(declare-fun b!898340 () Bool)

(assert (=> b!898340 (= e!502539 e!502529)))

(declare-fun res!607104 () Bool)

(assert (=> b!898340 (=> (not res!607104) (not e!502529))))

(assert (=> b!898340 (= res!607104 (contains!4381 lt!405459 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898340 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))))))

(declare-fun b!898341 () Bool)

(declare-fun res!607105 () Bool)

(assert (=> b!898341 (=> (not res!607105) (not e!502537))))

(assert (=> b!898341 (= res!607105 e!502528)))

(declare-fun c!94901 () Bool)

(assert (=> b!898341 (= c!94901 (not (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!898342 () Bool)

(assert (=> b!898342 (= e!502534 e!502531)))

(declare-fun res!607111 () Bool)

(assert (=> b!898342 (= res!607111 call!39849)))

(assert (=> b!898342 (=> (not res!607111) (not e!502531))))

(declare-fun b!898343 () Bool)

(assert (=> b!898343 (= e!502532 call!39851)))

(declare-fun b!898344 () Bool)

(declare-fun lt!405461 () Unit!30476)

(assert (=> b!898344 (= e!502533 lt!405461)))

(declare-fun lt!405465 () ListLongMap!10741)

(declare-fun getCurrentListMapNoExtraKeys!3314 (array!52707 array!52709 (_ BitVec 32) (_ BitVec 32) V!29423 V!29423 (_ BitVec 32) Int) ListLongMap!10741)

(assert (=> b!898344 (= lt!405465 (getCurrentListMapNoExtraKeys!3314 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))

(declare-fun lt!405464 () (_ BitVec 64))

(assert (=> b!898344 (= lt!405464 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405458 () (_ BitVec 64))

(assert (=> b!898344 (= lt!405458 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405466 () Unit!30476)

(declare-fun addStillContains!332 (ListLongMap!10741 (_ BitVec 64) V!29423 (_ BitVec 64)) Unit!30476)

(assert (=> b!898344 (= lt!405466 (addStillContains!332 lt!405465 lt!405464 (zeroValue!5232 thiss!1181) lt!405458))))

(assert (=> b!898344 (contains!4381 (+!2617 lt!405465 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181))) lt!405458)))

(declare-fun lt!405468 () Unit!30476)

(assert (=> b!898344 (= lt!405468 lt!405466)))

(declare-fun lt!405463 () ListLongMap!10741)

(assert (=> b!898344 (= lt!405463 (getCurrentListMapNoExtraKeys!3314 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))

(declare-fun lt!405462 () (_ BitVec 64))

(assert (=> b!898344 (= lt!405462 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405454 () (_ BitVec 64))

(assert (=> b!898344 (= lt!405454 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405460 () Unit!30476)

(declare-fun addApplyDifferent!332 (ListLongMap!10741 (_ BitVec 64) V!29423 (_ BitVec 64)) Unit!30476)

(assert (=> b!898344 (= lt!405460 (addApplyDifferent!332 lt!405463 lt!405462 (minValue!5232 thiss!1181) lt!405454))))

(assert (=> b!898344 (= (apply!406 (+!2617 lt!405463 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181))) lt!405454) (apply!406 lt!405463 lt!405454))))

(declare-fun lt!405472 () Unit!30476)

(assert (=> b!898344 (= lt!405472 lt!405460)))

(declare-fun lt!405456 () ListLongMap!10741)

(assert (=> b!898344 (= lt!405456 (getCurrentListMapNoExtraKeys!3314 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))

(declare-fun lt!405457 () (_ BitVec 64))

(assert (=> b!898344 (= lt!405457 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405452 () (_ BitVec 64))

(assert (=> b!898344 (= lt!405452 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405473 () Unit!30476)

(assert (=> b!898344 (= lt!405473 (addApplyDifferent!332 lt!405456 lt!405457 (zeroValue!5232 thiss!1181) lt!405452))))

(assert (=> b!898344 (= (apply!406 (+!2617 lt!405456 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181))) lt!405452) (apply!406 lt!405456 lt!405452))))

(declare-fun lt!405467 () Unit!30476)

(assert (=> b!898344 (= lt!405467 lt!405473)))

(declare-fun lt!405469 () ListLongMap!10741)

(assert (=> b!898344 (= lt!405469 (getCurrentListMapNoExtraKeys!3314 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))

(declare-fun lt!405471 () (_ BitVec 64))

(assert (=> b!898344 (= lt!405471 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405455 () (_ BitVec 64))

(assert (=> b!898344 (= lt!405455 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898344 (= lt!405461 (addApplyDifferent!332 lt!405469 lt!405471 (minValue!5232 thiss!1181) lt!405455))))

(assert (=> b!898344 (= (apply!406 (+!2617 lt!405469 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181))) lt!405455) (apply!406 lt!405469 lt!405455))))

(declare-fun b!898345 () Bool)

(assert (=> b!898345 (= e!502538 (+!2617 call!39846 (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))

(declare-fun bm!39847 () Bool)

(assert (=> bm!39847 (= call!39850 call!39847)))

(declare-fun b!898346 () Bool)

(declare-fun Unit!30482 () Unit!30476)

(assert (=> b!898346 (= e!502533 Unit!30482)))

(declare-fun b!898347 () Bool)

(assert (=> b!898347 (= e!502534 (not call!39849))))

(declare-fun bm!39848 () Bool)

(assert (=> bm!39848 (= call!39847 (getCurrentListMapNoExtraKeys!3314 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))

(declare-fun b!898348 () Bool)

(assert (=> b!898348 (= e!502538 e!502536)))

(assert (=> b!898348 (= c!94905 (and (not (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5128 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!111055 c!94904) b!898345))

(assert (= (and d!111055 (not c!94904)) b!898348))

(assert (= (and b!898348 c!94905) b!898336))

(assert (= (and b!898348 (not c!94905)) b!898328))

(assert (= (and b!898328 c!94900) b!898343))

(assert (= (and b!898328 (not c!94900)) b!898330))

(assert (= (or b!898343 b!898330) bm!39842))

(assert (= (or b!898336 bm!39842) bm!39847))

(assert (= (or b!898336 b!898343) bm!39843))

(assert (= (or b!898345 bm!39847) bm!39848))

(assert (= (or b!898345 bm!39843) bm!39846))

(assert (= (and d!111055 res!607103) b!898337))

(assert (= (and d!111055 c!94903) b!898344))

(assert (= (and d!111055 (not c!94903)) b!898346))

(assert (= (and d!111055 res!607107) b!898332))

(assert (= (and b!898332 res!607108) b!898338))

(assert (= (and b!898332 (not res!607109)) b!898340))

(assert (= (and b!898340 res!607104) b!898333))

(assert (= (and b!898332 res!607106) b!898341))

(assert (= (and b!898341 c!94901) b!898339))

(assert (= (and b!898341 (not c!94901)) b!898329))

(assert (= (and b!898339 res!607110) b!898335))

(assert (= (or b!898339 b!898329) bm!39845))

(assert (= (and b!898341 res!607105) b!898334))

(assert (= (and b!898334 c!94902) b!898342))

(assert (= (and b!898334 (not c!94902)) b!898347))

(assert (= (and b!898342 res!607111) b!898331))

(assert (= (or b!898342 b!898347) bm!39844))

(declare-fun b_lambda!12945 () Bool)

(assert (=> (not b_lambda!12945) (not b!898333)))

(declare-fun t!25184 () Bool)

(declare-fun tb!5185 () Bool)

(assert (=> (and b!898198 (= (defaultEntry!5412 thiss!1181) (defaultEntry!5412 thiss!1181)) t!25184) tb!5185))

(declare-fun result!10143 () Bool)

(assert (=> tb!5185 (= result!10143 tp_is_empty!18343)))

(assert (=> b!898333 t!25184))

(declare-fun b_and!26289 () Bool)

(assert (= b_and!26283 (and (=> t!25184 result!10143) b_and!26289)))

(assert (=> b!898333 m!834273))

(declare-fun m!834277 () Bool)

(assert (=> b!898333 m!834277))

(declare-fun m!834279 () Bool)

(assert (=> b!898333 m!834279))

(declare-fun m!834281 () Bool)

(assert (=> b!898333 m!834281))

(declare-fun m!834283 () Bool)

(assert (=> b!898333 m!834283))

(assert (=> b!898333 m!834273))

(assert (=> b!898333 m!834279))

(assert (=> b!898333 m!834281))

(assert (=> b!898337 m!834273))

(assert (=> b!898337 m!834273))

(declare-fun m!834285 () Bool)

(assert (=> b!898337 m!834285))

(declare-fun m!834287 () Bool)

(assert (=> bm!39845 m!834287))

(declare-fun m!834289 () Bool)

(assert (=> b!898331 m!834289))

(declare-fun m!834291 () Bool)

(assert (=> bm!39848 m!834291))

(declare-fun m!834293 () Bool)

(assert (=> b!898335 m!834293))

(declare-fun m!834295 () Bool)

(assert (=> bm!39846 m!834295))

(declare-fun m!834297 () Bool)

(assert (=> b!898344 m!834297))

(declare-fun m!834299 () Bool)

(assert (=> b!898344 m!834299))

(declare-fun m!834301 () Bool)

(assert (=> b!898344 m!834301))

(declare-fun m!834303 () Bool)

(assert (=> b!898344 m!834303))

(declare-fun m!834305 () Bool)

(assert (=> b!898344 m!834305))

(declare-fun m!834307 () Bool)

(assert (=> b!898344 m!834307))

(declare-fun m!834309 () Bool)

(assert (=> b!898344 m!834309))

(declare-fun m!834311 () Bool)

(assert (=> b!898344 m!834311))

(declare-fun m!834313 () Bool)

(assert (=> b!898344 m!834313))

(assert (=> b!898344 m!834311))

(assert (=> b!898344 m!834307))

(declare-fun m!834315 () Bool)

(assert (=> b!898344 m!834315))

(assert (=> b!898344 m!834273))

(declare-fun m!834317 () Bool)

(assert (=> b!898344 m!834317))

(declare-fun m!834319 () Bool)

(assert (=> b!898344 m!834319))

(declare-fun m!834321 () Bool)

(assert (=> b!898344 m!834321))

(assert (=> b!898344 m!834291))

(assert (=> b!898344 m!834297))

(declare-fun m!834323 () Bool)

(assert (=> b!898344 m!834323))

(assert (=> b!898344 m!834301))

(declare-fun m!834325 () Bool)

(assert (=> b!898344 m!834325))

(assert (=> b!898338 m!834273))

(assert (=> b!898338 m!834273))

(assert (=> b!898338 m!834285))

(declare-fun m!834327 () Bool)

(assert (=> b!898345 m!834327))

(assert (=> d!111055 m!834175))

(assert (=> b!898340 m!834273))

(assert (=> b!898340 m!834273))

(declare-fun m!834329 () Bool)

(assert (=> b!898340 m!834329))

(declare-fun m!834331 () Bool)

(assert (=> bm!39844 m!834331))

(assert (=> b!898197 d!111055))

(declare-fun d!111057 () Bool)

(declare-fun e!502546 () Bool)

(assert (=> d!111057 e!502546))

(declare-fun res!607114 () Bool)

(assert (=> d!111057 (=> res!607114 e!502546)))

(declare-fun lt!405484 () Bool)

(assert (=> d!111057 (= res!607114 (not lt!405484))))

(declare-fun lt!405485 () Bool)

(assert (=> d!111057 (= lt!405484 lt!405485)))

(declare-fun lt!405483 () Unit!30476)

(declare-fun e!502545 () Unit!30476)

(assert (=> d!111057 (= lt!405483 e!502545)))

(declare-fun c!94908 () Bool)

(assert (=> d!111057 (= c!94908 lt!405485)))

(declare-fun containsKey!425 (List!17848 (_ BitVec 64)) Bool)

(assert (=> d!111057 (= lt!405485 (containsKey!425 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))))))

(assert (=> d!111057 (= (contains!4381 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))) lt!405484)))

(declare-fun b!898357 () Bool)

(declare-fun lt!405482 () Unit!30476)

(assert (=> b!898357 (= e!502545 lt!405482)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!320 (List!17848 (_ BitVec 64)) Unit!30476)

(assert (=> b!898357 (= lt!405482 (lemmaContainsKeyImpliesGetValueByKeyDefined!320 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))))))

(declare-datatypes ((Option!463 0))(
  ( (Some!462 (v!11713 V!29423)) (None!461) )
))
(declare-fun isDefined!333 (Option!463) Bool)

(declare-fun getValueByKey!457 (List!17848 (_ BitVec 64)) Option!463)

(assert (=> b!898357 (isDefined!333 (getValueByKey!457 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))))))

(declare-fun b!898358 () Bool)

(declare-fun Unit!30483 () Unit!30476)

(assert (=> b!898358 (= e!502545 Unit!30483)))

(declare-fun b!898359 () Bool)

(assert (=> b!898359 (= e!502546 (isDefined!333 (getValueByKey!457 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358)))))))

(assert (= (and d!111057 c!94908) b!898357))

(assert (= (and d!111057 (not c!94908)) b!898358))

(assert (= (and d!111057 (not res!607114)) b!898359))

(assert (=> d!111057 m!834181))

(declare-fun m!834333 () Bool)

(assert (=> d!111057 m!834333))

(assert (=> b!898357 m!834181))

(declare-fun m!834335 () Bool)

(assert (=> b!898357 m!834335))

(assert (=> b!898357 m!834181))

(declare-fun m!834337 () Bool)

(assert (=> b!898357 m!834337))

(assert (=> b!898357 m!834337))

(declare-fun m!834339 () Bool)

(assert (=> b!898357 m!834339))

(assert (=> b!898359 m!834181))

(assert (=> b!898359 m!834337))

(assert (=> b!898359 m!834337))

(assert (=> b!898359 m!834339))

(assert (=> b!898197 d!111057))

(declare-fun d!111059 () Bool)

(declare-fun res!607121 () Bool)

(declare-fun e!502549 () Bool)

(assert (=> d!111059 (=> (not res!607121) (not e!502549))))

(declare-fun simpleValid!324 (LongMapFixedSize!4396) Bool)

(assert (=> d!111059 (= res!607121 (simpleValid!324 thiss!1181))))

(assert (=> d!111059 (= (valid!1698 thiss!1181) e!502549)))

(declare-fun b!898366 () Bool)

(declare-fun res!607122 () Bool)

(assert (=> b!898366 (=> (not res!607122) (not e!502549))))

(declare-fun arrayCountValidKeys!0 (array!52707 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898366 (= res!607122 (= (arrayCountValidKeys!0 (_keys!10182 thiss!1181) #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))) (_size!2253 thiss!1181)))))

(declare-fun b!898367 () Bool)

(declare-fun res!607123 () Bool)

(assert (=> b!898367 (=> (not res!607123) (not e!502549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52707 (_ BitVec 32)) Bool)

(assert (=> b!898367 (= res!607123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10182 thiss!1181) (mask!26135 thiss!1181)))))

(declare-fun b!898368 () Bool)

(declare-datatypes ((List!17851 0))(
  ( (Nil!17848) (Cons!17847 (h!18989 (_ BitVec 64)) (t!25185 List!17851)) )
))
(declare-fun arrayNoDuplicates!0 (array!52707 (_ BitVec 32) List!17851) Bool)

(assert (=> b!898368 (= e!502549 (arrayNoDuplicates!0 (_keys!10182 thiss!1181) #b00000000000000000000000000000000 Nil!17848))))

(assert (= (and d!111059 res!607121) b!898366))

(assert (= (and b!898366 res!607122) b!898367))

(assert (= (and b!898367 res!607123) b!898368))

(declare-fun m!834341 () Bool)

(assert (=> d!111059 m!834341))

(declare-fun m!834343 () Bool)

(assert (=> b!898366 m!834343))

(declare-fun m!834345 () Bool)

(assert (=> b!898367 m!834345))

(declare-fun m!834347 () Bool)

(assert (=> b!898368 m!834347))

(assert (=> start!76786 d!111059))

(declare-fun d!111061 () Bool)

(assert (=> d!111061 (= (array_inv!19932 (_keys!10182 thiss!1181)) (bvsge (size!25788 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898198 d!111061))

(declare-fun d!111063 () Bool)

(assert (=> d!111063 (= (array_inv!19933 (_values!5419 thiss!1181)) (bvsge (size!25789 (_values!5419 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898198 d!111063))

(declare-fun mapNonEmpty!29178 () Bool)

(declare-fun mapRes!29178 () Bool)

(declare-fun tp!56130 () Bool)

(declare-fun e!502555 () Bool)

(assert (=> mapNonEmpty!29178 (= mapRes!29178 (and tp!56130 e!502555))))

(declare-fun mapRest!29178 () (Array (_ BitVec 32) ValueCell!8690))

(declare-fun mapKey!29178 () (_ BitVec 32))

(declare-fun mapValue!29178 () ValueCell!8690)

(assert (=> mapNonEmpty!29178 (= mapRest!29169 (store mapRest!29178 mapKey!29178 mapValue!29178))))

(declare-fun condMapEmpty!29178 () Bool)

(declare-fun mapDefault!29178 () ValueCell!8690)

(assert (=> mapNonEmpty!29169 (= condMapEmpty!29178 (= mapRest!29169 ((as const (Array (_ BitVec 32) ValueCell!8690)) mapDefault!29178)))))

(declare-fun e!502554 () Bool)

(assert (=> mapNonEmpty!29169 (= tp!56115 (and e!502554 mapRes!29178))))

(declare-fun b!898376 () Bool)

(assert (=> b!898376 (= e!502554 tp_is_empty!18343)))

(declare-fun b!898375 () Bool)

(assert (=> b!898375 (= e!502555 tp_is_empty!18343)))

(declare-fun mapIsEmpty!29178 () Bool)

(assert (=> mapIsEmpty!29178 mapRes!29178))

(assert (= (and mapNonEmpty!29169 condMapEmpty!29178) mapIsEmpty!29178))

(assert (= (and mapNonEmpty!29169 (not condMapEmpty!29178)) mapNonEmpty!29178))

(assert (= (and mapNonEmpty!29178 ((_ is ValueCellFull!8690) mapValue!29178)) b!898375))

(assert (= (and mapNonEmpty!29169 ((_ is ValueCellFull!8690) mapDefault!29178)) b!898376))

(declare-fun m!834349 () Bool)

(assert (=> mapNonEmpty!29178 m!834349))

(declare-fun b_lambda!12947 () Bool)

(assert (= b_lambda!12945 (or (and b!898198 b_free!16015) b_lambda!12947)))

(check-sat (not b!898368) (not b!898333) (not b!898345) (not bm!39844) (not b!898367) (not b!898344) (not d!111045) (not b_next!16015) (not b!898340) (not b!898273) (not bm!39848) (not d!111049) (not b!898338) (not b_lambda!12947) (not b!898335) (not b!898359) (not b!898279) (not b!898331) (not d!111047) (not b!898357) (not bm!39846) (not b!898337) (not b!898366) (not d!111057) tp_is_empty!18343 (not d!111043) (not d!111055) (not bm!39845) (not b!898285) (not mapNonEmpty!29178) (not d!111059) (not b!898258) b_and!26289)
(check-sat b_and!26289 (not b_next!16015))
(get-model)

(assert (=> d!111043 d!111045))

(declare-fun d!111065 () Bool)

(declare-fun e!502558 () Bool)

(assert (=> d!111065 e!502558))

(declare-fun res!607126 () Bool)

(assert (=> d!111065 (=> res!607126 e!502558)))

(declare-fun lt!405488 () SeekEntryResult!8927)

(assert (=> d!111065 (= res!607126 (not ((_ is Found!8927) lt!405488)))))

(assert (=> d!111065 (= lt!405488 (seekEntry!0 key!785 (_keys!10182 thiss!1181) (mask!26135 thiss!1181)))))

(assert (=> d!111065 true))

(declare-fun _$36!366 () Unit!30476)

(assert (=> d!111065 (= (choose!1499 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) key!785) _$36!366)))

(declare-fun b!898379 () Bool)

(assert (=> b!898379 (= e!502558 (inRange!0 (index!38080 lt!405488) (mask!26135 thiss!1181)))))

(assert (= (and d!111065 (not res!607126)) b!898379))

(assert (=> d!111065 m!834195))

(declare-fun m!834351 () Bool)

(assert (=> b!898379 m!834351))

(assert (=> d!111043 d!111065))

(assert (=> d!111043 d!111051))

(declare-fun b!898391 () Bool)

(declare-fun e!502561 () Bool)

(assert (=> b!898391 (= e!502561 (and (bvsge (extraKeys!5128 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5128 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2253 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!111067 () Bool)

(declare-fun res!607137 () Bool)

(assert (=> d!111067 (=> (not res!607137) (not e!502561))))

(assert (=> d!111067 (= res!607137 (validMask!0 (mask!26135 thiss!1181)))))

(assert (=> d!111067 (= (simpleValid!324 thiss!1181) e!502561)))

(declare-fun b!898388 () Bool)

(declare-fun res!607136 () Bool)

(assert (=> b!898388 (=> (not res!607136) (not e!502561))))

(assert (=> b!898388 (= res!607136 (and (= (size!25789 (_values!5419 thiss!1181)) (bvadd (mask!26135 thiss!1181) #b00000000000000000000000000000001)) (= (size!25788 (_keys!10182 thiss!1181)) (size!25789 (_values!5419 thiss!1181))) (bvsge (_size!2253 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2253 thiss!1181) (bvadd (mask!26135 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!898390 () Bool)

(declare-fun res!607135 () Bool)

(assert (=> b!898390 (=> (not res!607135) (not e!502561))))

(declare-fun size!25794 (LongMapFixedSize!4396) (_ BitVec 32))

(assert (=> b!898390 (= res!607135 (= (size!25794 thiss!1181) (bvadd (_size!2253 thiss!1181) (bvsdiv (bvadd (extraKeys!5128 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!898389 () Bool)

(declare-fun res!607138 () Bool)

(assert (=> b!898389 (=> (not res!607138) (not e!502561))))

(assert (=> b!898389 (= res!607138 (bvsge (size!25794 thiss!1181) (_size!2253 thiss!1181)))))

(assert (= (and d!111067 res!607137) b!898388))

(assert (= (and b!898388 res!607136) b!898389))

(assert (= (and b!898389 res!607138) b!898390))

(assert (= (and b!898390 res!607135) b!898391))

(assert (=> d!111067 m!834175))

(declare-fun m!834353 () Bool)

(assert (=> b!898390 m!834353))

(assert (=> b!898389 m!834353))

(assert (=> d!111059 d!111067))

(declare-fun d!111069 () Bool)

(declare-fun e!502564 () Bool)

(assert (=> d!111069 e!502564))

(declare-fun res!607143 () Bool)

(assert (=> d!111069 (=> (not res!607143) (not e!502564))))

(declare-fun lt!405500 () ListLongMap!10741)

(assert (=> d!111069 (= res!607143 (contains!4381 lt!405500 (_1!6038 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181)))))))

(declare-fun lt!405498 () List!17848)

(assert (=> d!111069 (= lt!405500 (ListLongMap!10742 lt!405498))))

(declare-fun lt!405499 () Unit!30476)

(declare-fun lt!405497 () Unit!30476)

(assert (=> d!111069 (= lt!405499 lt!405497)))

(assert (=> d!111069 (= (getValueByKey!457 lt!405498 (_1!6038 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181)))) (Some!462 (_2!6038 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!249 (List!17848 (_ BitVec 64) V!29423) Unit!30476)

(assert (=> d!111069 (= lt!405497 (lemmaContainsTupThenGetReturnValue!249 lt!405498 (_1!6038 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181))) (_2!6038 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181)))))))

(declare-fun insertStrictlySorted!306 (List!17848 (_ BitVec 64) V!29423) List!17848)

(assert (=> d!111069 (= lt!405498 (insertStrictlySorted!306 (toList!5386 lt!405463) (_1!6038 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181))) (_2!6038 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181)))))))

(assert (=> d!111069 (= (+!2617 lt!405463 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181))) lt!405500)))

(declare-fun b!898396 () Bool)

(declare-fun res!607144 () Bool)

(assert (=> b!898396 (=> (not res!607144) (not e!502564))))

(assert (=> b!898396 (= res!607144 (= (getValueByKey!457 (toList!5386 lt!405500) (_1!6038 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181)))) (Some!462 (_2!6038 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181))))))))

(declare-fun b!898397 () Bool)

(declare-fun contains!4384 (List!17848 tuple2!12054) Bool)

(assert (=> b!898397 (= e!502564 (contains!4384 (toList!5386 lt!405500) (tuple2!12055 lt!405462 (minValue!5232 thiss!1181))))))

(assert (= (and d!111069 res!607143) b!898396))

(assert (= (and b!898396 res!607144) b!898397))

(declare-fun m!834355 () Bool)

(assert (=> d!111069 m!834355))

(declare-fun m!834357 () Bool)

(assert (=> d!111069 m!834357))

(declare-fun m!834359 () Bool)

(assert (=> d!111069 m!834359))

(declare-fun m!834361 () Bool)

(assert (=> d!111069 m!834361))

(declare-fun m!834363 () Bool)

(assert (=> b!898396 m!834363))

(declare-fun m!834365 () Bool)

(assert (=> b!898397 m!834365))

(assert (=> b!898344 d!111069))

(declare-fun d!111071 () Bool)

(assert (=> d!111071 (= (apply!406 (+!2617 lt!405456 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181))) lt!405452) (apply!406 lt!405456 lt!405452))))

(declare-fun lt!405503 () Unit!30476)

(declare-fun choose!1501 (ListLongMap!10741 (_ BitVec 64) V!29423 (_ BitVec 64)) Unit!30476)

(assert (=> d!111071 (= lt!405503 (choose!1501 lt!405456 lt!405457 (zeroValue!5232 thiss!1181) lt!405452))))

(declare-fun e!502567 () Bool)

(assert (=> d!111071 e!502567))

(declare-fun res!607147 () Bool)

(assert (=> d!111071 (=> (not res!607147) (not e!502567))))

(assert (=> d!111071 (= res!607147 (contains!4381 lt!405456 lt!405452))))

(assert (=> d!111071 (= (addApplyDifferent!332 lt!405456 lt!405457 (zeroValue!5232 thiss!1181) lt!405452) lt!405503)))

(declare-fun b!898401 () Bool)

(assert (=> b!898401 (= e!502567 (not (= lt!405452 lt!405457)))))

(assert (= (and d!111071 res!607147) b!898401))

(assert (=> d!111071 m!834311))

(assert (=> d!111071 m!834303))

(declare-fun m!834367 () Bool)

(assert (=> d!111071 m!834367))

(assert (=> d!111071 m!834311))

(assert (=> d!111071 m!834313))

(declare-fun m!834369 () Bool)

(assert (=> d!111071 m!834369))

(assert (=> b!898344 d!111071))

(declare-fun d!111073 () Bool)

(declare-fun get!13322 (Option!463) V!29423)

(assert (=> d!111073 (= (apply!406 lt!405456 lt!405452) (get!13322 (getValueByKey!457 (toList!5386 lt!405456) lt!405452)))))

(declare-fun bs!25182 () Bool)

(assert (= bs!25182 d!111073))

(declare-fun m!834371 () Bool)

(assert (=> bs!25182 m!834371))

(assert (=> bs!25182 m!834371))

(declare-fun m!834373 () Bool)

(assert (=> bs!25182 m!834373))

(assert (=> b!898344 d!111073))

(declare-fun d!111075 () Bool)

(assert (=> d!111075 (= (apply!406 (+!2617 lt!405463 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181))) lt!405454) (apply!406 lt!405463 lt!405454))))

(declare-fun lt!405504 () Unit!30476)

(assert (=> d!111075 (= lt!405504 (choose!1501 lt!405463 lt!405462 (minValue!5232 thiss!1181) lt!405454))))

(declare-fun e!502568 () Bool)

(assert (=> d!111075 e!502568))

(declare-fun res!607148 () Bool)

(assert (=> d!111075 (=> (not res!607148) (not e!502568))))

(assert (=> d!111075 (= res!607148 (contains!4381 lt!405463 lt!405454))))

(assert (=> d!111075 (= (addApplyDifferent!332 lt!405463 lt!405462 (minValue!5232 thiss!1181) lt!405454) lt!405504)))

(declare-fun b!898402 () Bool)

(assert (=> b!898402 (= e!502568 (not (= lt!405454 lt!405462)))))

(assert (= (and d!111075 res!607148) b!898402))

(assert (=> d!111075 m!834307))

(assert (=> d!111075 m!834317))

(declare-fun m!834375 () Bool)

(assert (=> d!111075 m!834375))

(assert (=> d!111075 m!834307))

(assert (=> d!111075 m!834315))

(declare-fun m!834377 () Bool)

(assert (=> d!111075 m!834377))

(assert (=> b!898344 d!111075))

(declare-fun d!111077 () Bool)

(assert (=> d!111077 (= (apply!406 (+!2617 lt!405469 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181))) lt!405455) (get!13322 (getValueByKey!457 (toList!5386 (+!2617 lt!405469 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181)))) lt!405455)))))

(declare-fun bs!25183 () Bool)

(assert (= bs!25183 d!111077))

(declare-fun m!834379 () Bool)

(assert (=> bs!25183 m!834379))

(assert (=> bs!25183 m!834379))

(declare-fun m!834381 () Bool)

(assert (=> bs!25183 m!834381))

(assert (=> b!898344 d!111077))

(declare-fun d!111079 () Bool)

(assert (=> d!111079 (= (apply!406 (+!2617 lt!405469 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181))) lt!405455) (apply!406 lt!405469 lt!405455))))

(declare-fun lt!405505 () Unit!30476)

(assert (=> d!111079 (= lt!405505 (choose!1501 lt!405469 lt!405471 (minValue!5232 thiss!1181) lt!405455))))

(declare-fun e!502569 () Bool)

(assert (=> d!111079 e!502569))

(declare-fun res!607149 () Bool)

(assert (=> d!111079 (=> (not res!607149) (not e!502569))))

(assert (=> d!111079 (= res!607149 (contains!4381 lt!405469 lt!405455))))

(assert (=> d!111079 (= (addApplyDifferent!332 lt!405469 lt!405471 (minValue!5232 thiss!1181) lt!405455) lt!405505)))

(declare-fun b!898403 () Bool)

(assert (=> b!898403 (= e!502569 (not (= lt!405455 lt!405471)))))

(assert (= (and d!111079 res!607149) b!898403))

(assert (=> d!111079 m!834297))

(assert (=> d!111079 m!834321))

(declare-fun m!834383 () Bool)

(assert (=> d!111079 m!834383))

(assert (=> d!111079 m!834297))

(assert (=> d!111079 m!834323))

(declare-fun m!834385 () Bool)

(assert (=> d!111079 m!834385))

(assert (=> b!898344 d!111079))

(declare-fun d!111081 () Bool)

(declare-fun e!502570 () Bool)

(assert (=> d!111081 e!502570))

(declare-fun res!607150 () Bool)

(assert (=> d!111081 (=> (not res!607150) (not e!502570))))

(declare-fun lt!405509 () ListLongMap!10741)

(assert (=> d!111081 (= res!607150 (contains!4381 lt!405509 (_1!6038 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181)))))))

(declare-fun lt!405507 () List!17848)

(assert (=> d!111081 (= lt!405509 (ListLongMap!10742 lt!405507))))

(declare-fun lt!405508 () Unit!30476)

(declare-fun lt!405506 () Unit!30476)

(assert (=> d!111081 (= lt!405508 lt!405506)))

(assert (=> d!111081 (= (getValueByKey!457 lt!405507 (_1!6038 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181)))) (Some!462 (_2!6038 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181)))))))

(assert (=> d!111081 (= lt!405506 (lemmaContainsTupThenGetReturnValue!249 lt!405507 (_1!6038 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181))) (_2!6038 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181)))))))

(assert (=> d!111081 (= lt!405507 (insertStrictlySorted!306 (toList!5386 lt!405465) (_1!6038 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181))) (_2!6038 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181)))))))

(assert (=> d!111081 (= (+!2617 lt!405465 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181))) lt!405509)))

(declare-fun b!898404 () Bool)

(declare-fun res!607151 () Bool)

(assert (=> b!898404 (=> (not res!607151) (not e!502570))))

(assert (=> b!898404 (= res!607151 (= (getValueByKey!457 (toList!5386 lt!405509) (_1!6038 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181)))) (Some!462 (_2!6038 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181))))))))

(declare-fun b!898405 () Bool)

(assert (=> b!898405 (= e!502570 (contains!4384 (toList!5386 lt!405509) (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181))))))

(assert (= (and d!111081 res!607150) b!898404))

(assert (= (and b!898404 res!607151) b!898405))

(declare-fun m!834387 () Bool)

(assert (=> d!111081 m!834387))

(declare-fun m!834389 () Bool)

(assert (=> d!111081 m!834389))

(declare-fun m!834391 () Bool)

(assert (=> d!111081 m!834391))

(declare-fun m!834393 () Bool)

(assert (=> d!111081 m!834393))

(declare-fun m!834395 () Bool)

(assert (=> b!898404 m!834395))

(declare-fun m!834397 () Bool)

(assert (=> b!898405 m!834397))

(assert (=> b!898344 d!111081))

(declare-fun d!111083 () Bool)

(declare-fun e!502572 () Bool)

(assert (=> d!111083 e!502572))

(declare-fun res!607152 () Bool)

(assert (=> d!111083 (=> res!607152 e!502572)))

(declare-fun lt!405512 () Bool)

(assert (=> d!111083 (= res!607152 (not lt!405512))))

(declare-fun lt!405513 () Bool)

(assert (=> d!111083 (= lt!405512 lt!405513)))

(declare-fun lt!405511 () Unit!30476)

(declare-fun e!502571 () Unit!30476)

(assert (=> d!111083 (= lt!405511 e!502571)))

(declare-fun c!94909 () Bool)

(assert (=> d!111083 (= c!94909 lt!405513)))

(assert (=> d!111083 (= lt!405513 (containsKey!425 (toList!5386 (+!2617 lt!405465 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181)))) lt!405458))))

(assert (=> d!111083 (= (contains!4381 (+!2617 lt!405465 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181))) lt!405458) lt!405512)))

(declare-fun b!898406 () Bool)

(declare-fun lt!405510 () Unit!30476)

(assert (=> b!898406 (= e!502571 lt!405510)))

(assert (=> b!898406 (= lt!405510 (lemmaContainsKeyImpliesGetValueByKeyDefined!320 (toList!5386 (+!2617 lt!405465 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181)))) lt!405458))))

(assert (=> b!898406 (isDefined!333 (getValueByKey!457 (toList!5386 (+!2617 lt!405465 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181)))) lt!405458))))

(declare-fun b!898407 () Bool)

(declare-fun Unit!30484 () Unit!30476)

(assert (=> b!898407 (= e!502571 Unit!30484)))

(declare-fun b!898408 () Bool)

(assert (=> b!898408 (= e!502572 (isDefined!333 (getValueByKey!457 (toList!5386 (+!2617 lt!405465 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181)))) lt!405458)))))

(assert (= (and d!111083 c!94909) b!898406))

(assert (= (and d!111083 (not c!94909)) b!898407))

(assert (= (and d!111083 (not res!607152)) b!898408))

(declare-fun m!834399 () Bool)

(assert (=> d!111083 m!834399))

(declare-fun m!834401 () Bool)

(assert (=> b!898406 m!834401))

(declare-fun m!834403 () Bool)

(assert (=> b!898406 m!834403))

(assert (=> b!898406 m!834403))

(declare-fun m!834405 () Bool)

(assert (=> b!898406 m!834405))

(assert (=> b!898408 m!834403))

(assert (=> b!898408 m!834403))

(assert (=> b!898408 m!834405))

(assert (=> b!898344 d!111083))

(declare-fun d!111085 () Bool)

(assert (=> d!111085 (= (apply!406 lt!405463 lt!405454) (get!13322 (getValueByKey!457 (toList!5386 lt!405463) lt!405454)))))

(declare-fun bs!25184 () Bool)

(assert (= bs!25184 d!111085))

(declare-fun m!834407 () Bool)

(assert (=> bs!25184 m!834407))

(assert (=> bs!25184 m!834407))

(declare-fun m!834409 () Bool)

(assert (=> bs!25184 m!834409))

(assert (=> b!898344 d!111085))

(declare-fun d!111087 () Bool)

(declare-fun e!502573 () Bool)

(assert (=> d!111087 e!502573))

(declare-fun res!607153 () Bool)

(assert (=> d!111087 (=> (not res!607153) (not e!502573))))

(declare-fun lt!405517 () ListLongMap!10741)

(assert (=> d!111087 (= res!607153 (contains!4381 lt!405517 (_1!6038 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181)))))))

(declare-fun lt!405515 () List!17848)

(assert (=> d!111087 (= lt!405517 (ListLongMap!10742 lt!405515))))

(declare-fun lt!405516 () Unit!30476)

(declare-fun lt!405514 () Unit!30476)

(assert (=> d!111087 (= lt!405516 lt!405514)))

(assert (=> d!111087 (= (getValueByKey!457 lt!405515 (_1!6038 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181)))) (Some!462 (_2!6038 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181)))))))

(assert (=> d!111087 (= lt!405514 (lemmaContainsTupThenGetReturnValue!249 lt!405515 (_1!6038 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181))) (_2!6038 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181)))))))

(assert (=> d!111087 (= lt!405515 (insertStrictlySorted!306 (toList!5386 lt!405469) (_1!6038 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181))) (_2!6038 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181)))))))

(assert (=> d!111087 (= (+!2617 lt!405469 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181))) lt!405517)))

(declare-fun b!898409 () Bool)

(declare-fun res!607154 () Bool)

(assert (=> b!898409 (=> (not res!607154) (not e!502573))))

(assert (=> b!898409 (= res!607154 (= (getValueByKey!457 (toList!5386 lt!405517) (_1!6038 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181)))) (Some!462 (_2!6038 (tuple2!12055 lt!405471 (minValue!5232 thiss!1181))))))))

(declare-fun b!898410 () Bool)

(assert (=> b!898410 (= e!502573 (contains!4384 (toList!5386 lt!405517) (tuple2!12055 lt!405471 (minValue!5232 thiss!1181))))))

(assert (= (and d!111087 res!607153) b!898409))

(assert (= (and b!898409 res!607154) b!898410))

(declare-fun m!834411 () Bool)

(assert (=> d!111087 m!834411))

(declare-fun m!834413 () Bool)

(assert (=> d!111087 m!834413))

(declare-fun m!834415 () Bool)

(assert (=> d!111087 m!834415))

(declare-fun m!834417 () Bool)

(assert (=> d!111087 m!834417))

(declare-fun m!834419 () Bool)

(assert (=> b!898409 m!834419))

(declare-fun m!834421 () Bool)

(assert (=> b!898410 m!834421))

(assert (=> b!898344 d!111087))

(declare-fun b!898435 () Bool)

(declare-fun e!502593 () Bool)

(declare-fun e!502590 () Bool)

(assert (=> b!898435 (= e!502593 e!502590)))

(assert (=> b!898435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))))))

(declare-fun res!607166 () Bool)

(declare-fun lt!405538 () ListLongMap!10741)

(assert (=> b!898435 (= res!607166 (contains!4381 lt!405538 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898435 (=> (not res!607166) (not e!502590))))

(declare-fun b!898436 () Bool)

(declare-fun e!502588 () ListLongMap!10741)

(declare-fun e!502594 () ListLongMap!10741)

(assert (=> b!898436 (= e!502588 e!502594)))

(declare-fun c!94919 () Bool)

(assert (=> b!898436 (= c!94919 (validKeyInArray!0 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898437 () Bool)

(declare-fun e!502591 () Bool)

(assert (=> b!898437 (= e!502591 (= lt!405538 (getCurrentListMapNoExtraKeys!3314 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5412 thiss!1181))))))

(declare-fun b!898438 () Bool)

(declare-fun isEmpty!689 (ListLongMap!10741) Bool)

(assert (=> b!898438 (= e!502591 (isEmpty!689 lt!405538))))

(declare-fun b!898439 () Bool)

(declare-fun e!502592 () Bool)

(assert (=> b!898439 (= e!502592 e!502593)))

(declare-fun c!94918 () Bool)

(declare-fun e!502589 () Bool)

(assert (=> b!898439 (= c!94918 e!502589)))

(declare-fun res!607165 () Bool)

(assert (=> b!898439 (=> (not res!607165) (not e!502589))))

(assert (=> b!898439 (= res!607165 (bvslt #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))))))

(declare-fun b!898440 () Bool)

(assert (=> b!898440 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))))))

(assert (=> b!898440 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25789 (_values!5419 thiss!1181))))))

(assert (=> b!898440 (= e!502590 (= (apply!406 lt!405538 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)) (get!13321 (select (arr!25332 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1300 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!898441 () Bool)

(declare-fun res!607164 () Bool)

(assert (=> b!898441 (=> (not res!607164) (not e!502592))))

(assert (=> b!898441 (= res!607164 (not (contains!4381 lt!405538 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!111089 () Bool)

(assert (=> d!111089 e!502592))

(declare-fun res!607163 () Bool)

(assert (=> d!111089 (=> (not res!607163) (not e!502592))))

(assert (=> d!111089 (= res!607163 (not (contains!4381 lt!405538 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!111089 (= lt!405538 e!502588)))

(declare-fun c!94921 () Bool)

(assert (=> d!111089 (= c!94921 (bvsge #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))))))

(assert (=> d!111089 (validMask!0 (mask!26135 thiss!1181))))

(assert (=> d!111089 (= (getCurrentListMapNoExtraKeys!3314 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)) lt!405538)))

(declare-fun b!898442 () Bool)

(declare-fun call!39854 () ListLongMap!10741)

(assert (=> b!898442 (= e!502594 call!39854)))

(declare-fun b!898443 () Bool)

(declare-fun lt!405536 () Unit!30476)

(declare-fun lt!405533 () Unit!30476)

(assert (=> b!898443 (= lt!405536 lt!405533)))

(declare-fun lt!405532 () ListLongMap!10741)

(declare-fun lt!405535 () (_ BitVec 64))

(declare-fun lt!405534 () (_ BitVec 64))

(declare-fun lt!405537 () V!29423)

(assert (=> b!898443 (not (contains!4381 (+!2617 lt!405532 (tuple2!12055 lt!405534 lt!405537)) lt!405535))))

(declare-fun addStillNotContains!215 (ListLongMap!10741 (_ BitVec 64) V!29423 (_ BitVec 64)) Unit!30476)

(assert (=> b!898443 (= lt!405533 (addStillNotContains!215 lt!405532 lt!405534 lt!405537 lt!405535))))

(assert (=> b!898443 (= lt!405535 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!898443 (= lt!405537 (get!13321 (select (arr!25332 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1300 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!898443 (= lt!405534 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898443 (= lt!405532 call!39854)))

(assert (=> b!898443 (= e!502594 (+!2617 call!39854 (tuple2!12055 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000) (get!13321 (select (arr!25332 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1300 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!898444 () Bool)

(assert (=> b!898444 (= e!502589 (validKeyInArray!0 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898444 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!898445 () Bool)

(assert (=> b!898445 (= e!502593 e!502591)))

(declare-fun c!94920 () Bool)

(assert (=> b!898445 (= c!94920 (bvslt #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))))))

(declare-fun b!898446 () Bool)

(assert (=> b!898446 (= e!502588 (ListLongMap!10742 Nil!17845))))

(declare-fun bm!39851 () Bool)

(assert (=> bm!39851 (= call!39854 (getCurrentListMapNoExtraKeys!3314 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5412 thiss!1181)))))

(assert (= (and d!111089 c!94921) b!898446))

(assert (= (and d!111089 (not c!94921)) b!898436))

(assert (= (and b!898436 c!94919) b!898443))

(assert (= (and b!898436 (not c!94919)) b!898442))

(assert (= (or b!898443 b!898442) bm!39851))

(assert (= (and d!111089 res!607163) b!898441))

(assert (= (and b!898441 res!607164) b!898439))

(assert (= (and b!898439 res!607165) b!898444))

(assert (= (and b!898439 c!94918) b!898435))

(assert (= (and b!898439 (not c!94918)) b!898445))

(assert (= (and b!898435 res!607166) b!898440))

(assert (= (and b!898445 c!94920) b!898437))

(assert (= (and b!898445 (not c!94920)) b!898438))

(declare-fun b_lambda!12949 () Bool)

(assert (=> (not b_lambda!12949) (not b!898440)))

(assert (=> b!898440 t!25184))

(declare-fun b_and!26291 () Bool)

(assert (= b_and!26289 (and (=> t!25184 result!10143) b_and!26291)))

(declare-fun b_lambda!12951 () Bool)

(assert (=> (not b_lambda!12951) (not b!898443)))

(assert (=> b!898443 t!25184))

(declare-fun b_and!26293 () Bool)

(assert (= b_and!26291 (and (=> t!25184 result!10143) b_and!26293)))

(declare-fun m!834423 () Bool)

(assert (=> b!898443 m!834423))

(declare-fun m!834425 () Bool)

(assert (=> b!898443 m!834425))

(assert (=> b!898443 m!834273))

(assert (=> b!898443 m!834279))

(assert (=> b!898443 m!834281))

(assert (=> b!898443 m!834283))

(declare-fun m!834427 () Bool)

(assert (=> b!898443 m!834427))

(assert (=> b!898443 m!834281))

(assert (=> b!898443 m!834279))

(assert (=> b!898443 m!834423))

(declare-fun m!834429 () Bool)

(assert (=> b!898443 m!834429))

(declare-fun m!834431 () Bool)

(assert (=> b!898437 m!834431))

(declare-fun m!834433 () Bool)

(assert (=> b!898441 m!834433))

(declare-fun m!834435 () Bool)

(assert (=> b!898438 m!834435))

(assert (=> b!898440 m!834273))

(assert (=> b!898440 m!834279))

(assert (=> b!898440 m!834281))

(assert (=> b!898440 m!834283))

(assert (=> b!898440 m!834281))

(assert (=> b!898440 m!834279))

(assert (=> b!898440 m!834273))

(declare-fun m!834437 () Bool)

(assert (=> b!898440 m!834437))

(assert (=> b!898436 m!834273))

(assert (=> b!898436 m!834273))

(assert (=> b!898436 m!834285))

(declare-fun m!834439 () Bool)

(assert (=> d!111089 m!834439))

(assert (=> d!111089 m!834175))

(assert (=> b!898435 m!834273))

(assert (=> b!898435 m!834273))

(declare-fun m!834441 () Bool)

(assert (=> b!898435 m!834441))

(assert (=> bm!39851 m!834431))

(assert (=> b!898444 m!834273))

(assert (=> b!898444 m!834273))

(assert (=> b!898444 m!834285))

(assert (=> b!898344 d!111089))

(declare-fun d!111091 () Bool)

(assert (=> d!111091 (= (apply!406 lt!405469 lt!405455) (get!13322 (getValueByKey!457 (toList!5386 lt!405469) lt!405455)))))

(declare-fun bs!25185 () Bool)

(assert (= bs!25185 d!111091))

(declare-fun m!834443 () Bool)

(assert (=> bs!25185 m!834443))

(assert (=> bs!25185 m!834443))

(declare-fun m!834445 () Bool)

(assert (=> bs!25185 m!834445))

(assert (=> b!898344 d!111091))

(declare-fun d!111093 () Bool)

(assert (=> d!111093 (= (apply!406 (+!2617 lt!405456 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181))) lt!405452) (get!13322 (getValueByKey!457 (toList!5386 (+!2617 lt!405456 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181)))) lt!405452)))))

(declare-fun bs!25186 () Bool)

(assert (= bs!25186 d!111093))

(declare-fun m!834447 () Bool)

(assert (=> bs!25186 m!834447))

(assert (=> bs!25186 m!834447))

(declare-fun m!834449 () Bool)

(assert (=> bs!25186 m!834449))

(assert (=> b!898344 d!111093))

(declare-fun d!111095 () Bool)

(assert (=> d!111095 (contains!4381 (+!2617 lt!405465 (tuple2!12055 lt!405464 (zeroValue!5232 thiss!1181))) lt!405458)))

(declare-fun lt!405541 () Unit!30476)

(declare-fun choose!1502 (ListLongMap!10741 (_ BitVec 64) V!29423 (_ BitVec 64)) Unit!30476)

(assert (=> d!111095 (= lt!405541 (choose!1502 lt!405465 lt!405464 (zeroValue!5232 thiss!1181) lt!405458))))

(assert (=> d!111095 (contains!4381 lt!405465 lt!405458)))

(assert (=> d!111095 (= (addStillContains!332 lt!405465 lt!405464 (zeroValue!5232 thiss!1181) lt!405458) lt!405541)))

(declare-fun bs!25187 () Bool)

(assert (= bs!25187 d!111095))

(assert (=> bs!25187 m!834301))

(assert (=> bs!25187 m!834301))

(assert (=> bs!25187 m!834325))

(declare-fun m!834451 () Bool)

(assert (=> bs!25187 m!834451))

(declare-fun m!834453 () Bool)

(assert (=> bs!25187 m!834453))

(assert (=> b!898344 d!111095))

(declare-fun d!111097 () Bool)

(declare-fun e!502595 () Bool)

(assert (=> d!111097 e!502595))

(declare-fun res!607167 () Bool)

(assert (=> d!111097 (=> (not res!607167) (not e!502595))))

(declare-fun lt!405545 () ListLongMap!10741)

(assert (=> d!111097 (= res!607167 (contains!4381 lt!405545 (_1!6038 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181)))))))

(declare-fun lt!405543 () List!17848)

(assert (=> d!111097 (= lt!405545 (ListLongMap!10742 lt!405543))))

(declare-fun lt!405544 () Unit!30476)

(declare-fun lt!405542 () Unit!30476)

(assert (=> d!111097 (= lt!405544 lt!405542)))

(assert (=> d!111097 (= (getValueByKey!457 lt!405543 (_1!6038 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181)))) (Some!462 (_2!6038 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181)))))))

(assert (=> d!111097 (= lt!405542 (lemmaContainsTupThenGetReturnValue!249 lt!405543 (_1!6038 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181))) (_2!6038 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181)))))))

(assert (=> d!111097 (= lt!405543 (insertStrictlySorted!306 (toList!5386 lt!405456) (_1!6038 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181))) (_2!6038 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181)))))))

(assert (=> d!111097 (= (+!2617 lt!405456 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181))) lt!405545)))

(declare-fun b!898448 () Bool)

(declare-fun res!607168 () Bool)

(assert (=> b!898448 (=> (not res!607168) (not e!502595))))

(assert (=> b!898448 (= res!607168 (= (getValueByKey!457 (toList!5386 lt!405545) (_1!6038 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181)))) (Some!462 (_2!6038 (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181))))))))

(declare-fun b!898449 () Bool)

(assert (=> b!898449 (= e!502595 (contains!4384 (toList!5386 lt!405545) (tuple2!12055 lt!405457 (zeroValue!5232 thiss!1181))))))

(assert (= (and d!111097 res!607167) b!898448))

(assert (= (and b!898448 res!607168) b!898449))

(declare-fun m!834455 () Bool)

(assert (=> d!111097 m!834455))

(declare-fun m!834457 () Bool)

(assert (=> d!111097 m!834457))

(declare-fun m!834459 () Bool)

(assert (=> d!111097 m!834459))

(declare-fun m!834461 () Bool)

(assert (=> d!111097 m!834461))

(declare-fun m!834463 () Bool)

(assert (=> b!898448 m!834463))

(declare-fun m!834465 () Bool)

(assert (=> b!898449 m!834465))

(assert (=> b!898344 d!111097))

(declare-fun d!111099 () Bool)

(assert (=> d!111099 (= (apply!406 (+!2617 lt!405463 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181))) lt!405454) (get!13322 (getValueByKey!457 (toList!5386 (+!2617 lt!405463 (tuple2!12055 lt!405462 (minValue!5232 thiss!1181)))) lt!405454)))))

(declare-fun bs!25188 () Bool)

(assert (= bs!25188 d!111099))

(declare-fun m!834467 () Bool)

(assert (=> bs!25188 m!834467))

(assert (=> bs!25188 m!834467))

(declare-fun m!834469 () Bool)

(assert (=> bs!25188 m!834469))

(assert (=> b!898344 d!111099))

(declare-fun b!898458 () Bool)

(declare-fun e!502601 () (_ BitVec 32))

(declare-fun e!502600 () (_ BitVec 32))

(assert (=> b!898458 (= e!502601 e!502600)))

(declare-fun c!94926 () Bool)

(assert (=> b!898458 (= c!94926 (validKeyInArray!0 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898459 () Bool)

(assert (=> b!898459 (= e!502601 #b00000000000000000000000000000000)))

(declare-fun b!898460 () Bool)

(declare-fun call!39857 () (_ BitVec 32))

(assert (=> b!898460 (= e!502600 (bvadd #b00000000000000000000000000000001 call!39857))))

(declare-fun d!111101 () Bool)

(declare-fun lt!405548 () (_ BitVec 32))

(assert (=> d!111101 (and (bvsge lt!405548 #b00000000000000000000000000000000) (bvsle lt!405548 (bvsub (size!25788 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111101 (= lt!405548 e!502601)))

(declare-fun c!94927 () Bool)

(assert (=> d!111101 (= c!94927 (bvsge #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))))))

(assert (=> d!111101 (and (bvsle #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25788 (_keys!10182 thiss!1181)) (size!25788 (_keys!10182 thiss!1181))))))

(assert (=> d!111101 (= (arrayCountValidKeys!0 (_keys!10182 thiss!1181) #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))) lt!405548)))

(declare-fun bm!39854 () Bool)

(assert (=> bm!39854 (= call!39857 (arrayCountValidKeys!0 (_keys!10182 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25788 (_keys!10182 thiss!1181))))))

(declare-fun b!898461 () Bool)

(assert (=> b!898461 (= e!502600 call!39857)))

(assert (= (and d!111101 c!94927) b!898459))

(assert (= (and d!111101 (not c!94927)) b!898458))

(assert (= (and b!898458 c!94926) b!898460))

(assert (= (and b!898458 (not c!94926)) b!898461))

(assert (= (or b!898460 b!898461) bm!39854))

(assert (=> b!898458 m!834273))

(assert (=> b!898458 m!834273))

(assert (=> b!898458 m!834285))

(declare-fun m!834471 () Bool)

(assert (=> bm!39854 m!834471))

(assert (=> b!898366 d!111101))

(declare-fun d!111103 () Bool)

(assert (=> d!111103 (= (inRange!0 (index!38080 lt!405389) (mask!26135 thiss!1181)) (and (bvsge (index!38080 lt!405389) #b00000000000000000000000000000000) (bvslt (index!38080 lt!405389) (bvadd (mask!26135 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898258 d!111103))

(declare-fun b!898472 () Bool)

(declare-fun e!502613 () Bool)

(declare-fun call!39860 () Bool)

(assert (=> b!898472 (= e!502613 call!39860)))

(declare-fun b!898474 () Bool)

(assert (=> b!898474 (= e!502613 call!39860)))

(declare-fun b!898475 () Bool)

(declare-fun e!502610 () Bool)

(assert (=> b!898475 (= e!502610 e!502613)))

(declare-fun c!94930 () Bool)

(assert (=> b!898475 (= c!94930 (validKeyInArray!0 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898476 () Bool)

(declare-fun e!502612 () Bool)

(assert (=> b!898476 (= e!502612 e!502610)))

(declare-fun res!607177 () Bool)

(assert (=> b!898476 (=> (not res!607177) (not e!502610))))

(declare-fun e!502611 () Bool)

(assert (=> b!898476 (= res!607177 (not e!502611))))

(declare-fun res!607176 () Bool)

(assert (=> b!898476 (=> (not res!607176) (not e!502611))))

(assert (=> b!898476 (= res!607176 (validKeyInArray!0 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39857 () Bool)

(assert (=> bm!39857 (= call!39860 (arrayNoDuplicates!0 (_keys!10182 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94930 (Cons!17847 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000) Nil!17848) Nil!17848)))))

(declare-fun b!898473 () Bool)

(declare-fun contains!4385 (List!17851 (_ BitVec 64)) Bool)

(assert (=> b!898473 (= e!502611 (contains!4385 Nil!17848 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111105 () Bool)

(declare-fun res!607175 () Bool)

(assert (=> d!111105 (=> res!607175 e!502612)))

(assert (=> d!111105 (= res!607175 (bvsge #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))))))

(assert (=> d!111105 (= (arrayNoDuplicates!0 (_keys!10182 thiss!1181) #b00000000000000000000000000000000 Nil!17848) e!502612)))

(assert (= (and d!111105 (not res!607175)) b!898476))

(assert (= (and b!898476 res!607176) b!898473))

(assert (= (and b!898476 res!607177) b!898475))

(assert (= (and b!898475 c!94930) b!898472))

(assert (= (and b!898475 (not c!94930)) b!898474))

(assert (= (or b!898472 b!898474) bm!39857))

(assert (=> b!898475 m!834273))

(assert (=> b!898475 m!834273))

(assert (=> b!898475 m!834285))

(assert (=> b!898476 m!834273))

(assert (=> b!898476 m!834273))

(assert (=> b!898476 m!834285))

(assert (=> bm!39857 m!834273))

(declare-fun m!834473 () Bool)

(assert (=> bm!39857 m!834473))

(assert (=> b!898473 m!834273))

(assert (=> b!898473 m!834273))

(declare-fun m!834475 () Bool)

(assert (=> b!898473 m!834475))

(assert (=> b!898368 d!111105))

(declare-fun b!898485 () Bool)

(declare-fun e!502620 () Bool)

(declare-fun e!502621 () Bool)

(assert (=> b!898485 (= e!502620 e!502621)))

(declare-fun c!94933 () Bool)

(assert (=> b!898485 (= c!94933 (validKeyInArray!0 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39860 () Bool)

(declare-fun call!39863 () Bool)

(assert (=> bm!39860 (= call!39863 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10182 thiss!1181) (mask!26135 thiss!1181)))))

(declare-fun b!898486 () Bool)

(declare-fun e!502622 () Bool)

(assert (=> b!898486 (= e!502621 e!502622)))

(declare-fun lt!405556 () (_ BitVec 64))

(assert (=> b!898486 (= lt!405556 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405555 () Unit!30476)

(assert (=> b!898486 (= lt!405555 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10182 thiss!1181) lt!405556 #b00000000000000000000000000000000))))

(assert (=> b!898486 (arrayContainsKey!0 (_keys!10182 thiss!1181) lt!405556 #b00000000000000000000000000000000)))

(declare-fun lt!405557 () Unit!30476)

(assert (=> b!898486 (= lt!405557 lt!405555)))

(declare-fun res!607182 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52707 (_ BitVec 32)) SeekEntryResult!8927)

(assert (=> b!898486 (= res!607182 (= (seekEntryOrOpen!0 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000) (_keys!10182 thiss!1181) (mask!26135 thiss!1181)) (Found!8927 #b00000000000000000000000000000000)))))

(assert (=> b!898486 (=> (not res!607182) (not e!502622))))

(declare-fun d!111107 () Bool)

(declare-fun res!607183 () Bool)

(assert (=> d!111107 (=> res!607183 e!502620)))

(assert (=> d!111107 (= res!607183 (bvsge #b00000000000000000000000000000000 (size!25788 (_keys!10182 thiss!1181))))))

(assert (=> d!111107 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10182 thiss!1181) (mask!26135 thiss!1181)) e!502620)))

(declare-fun b!898487 () Bool)

(assert (=> b!898487 (= e!502622 call!39863)))

(declare-fun b!898488 () Bool)

(assert (=> b!898488 (= e!502621 call!39863)))

(assert (= (and d!111107 (not res!607183)) b!898485))

(assert (= (and b!898485 c!94933) b!898486))

(assert (= (and b!898485 (not c!94933)) b!898488))

(assert (= (and b!898486 res!607182) b!898487))

(assert (= (or b!898487 b!898488) bm!39860))

(assert (=> b!898485 m!834273))

(assert (=> b!898485 m!834273))

(assert (=> b!898485 m!834285))

(declare-fun m!834477 () Bool)

(assert (=> bm!39860 m!834477))

(assert (=> b!898486 m!834273))

(declare-fun m!834479 () Bool)

(assert (=> b!898486 m!834479))

(declare-fun m!834481 () Bool)

(assert (=> b!898486 m!834481))

(assert (=> b!898486 m!834273))

(declare-fun m!834483 () Bool)

(assert (=> b!898486 m!834483))

(assert (=> b!898367 d!111107))

(declare-fun d!111109 () Bool)

(declare-fun e!502623 () Bool)

(assert (=> d!111109 e!502623))

(declare-fun res!607184 () Bool)

(assert (=> d!111109 (=> (not res!607184) (not e!502623))))

(declare-fun lt!405561 () ListLongMap!10741)

(assert (=> d!111109 (= res!607184 (contains!4381 lt!405561 (_1!6038 (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))

(declare-fun lt!405559 () List!17848)

(assert (=> d!111109 (= lt!405561 (ListLongMap!10742 lt!405559))))

(declare-fun lt!405560 () Unit!30476)

(declare-fun lt!405558 () Unit!30476)

(assert (=> d!111109 (= lt!405560 lt!405558)))

(assert (=> d!111109 (= (getValueByKey!457 lt!405559 (_1!6038 (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))) (Some!462 (_2!6038 (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))

(assert (=> d!111109 (= lt!405558 (lemmaContainsTupThenGetReturnValue!249 lt!405559 (_1!6038 (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))) (_2!6038 (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))

(assert (=> d!111109 (= lt!405559 (insertStrictlySorted!306 (toList!5386 call!39846) (_1!6038 (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))) (_2!6038 (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))

(assert (=> d!111109 (= (+!2617 call!39846 (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))) lt!405561)))

(declare-fun b!898489 () Bool)

(declare-fun res!607185 () Bool)

(assert (=> b!898489 (=> (not res!607185) (not e!502623))))

(assert (=> b!898489 (= res!607185 (= (getValueByKey!457 (toList!5386 lt!405561) (_1!6038 (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))) (Some!462 (_2!6038 (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))))

(declare-fun b!898490 () Bool)

(assert (=> b!898490 (= e!502623 (contains!4384 (toList!5386 lt!405561) (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))

(assert (= (and d!111109 res!607184) b!898489))

(assert (= (and b!898489 res!607185) b!898490))

(declare-fun m!834485 () Bool)

(assert (=> d!111109 m!834485))

(declare-fun m!834487 () Bool)

(assert (=> d!111109 m!834487))

(declare-fun m!834489 () Bool)

(assert (=> d!111109 m!834489))

(declare-fun m!834491 () Bool)

(assert (=> d!111109 m!834491))

(declare-fun m!834493 () Bool)

(assert (=> b!898489 m!834493))

(declare-fun m!834495 () Bool)

(assert (=> b!898490 m!834495))

(assert (=> b!898345 d!111109))

(declare-fun d!111111 () Bool)

(assert (=> d!111111 (= (apply!406 lt!405459 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13322 (getValueByKey!457 (toList!5386 lt!405459) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25189 () Bool)

(assert (= bs!25189 d!111111))

(declare-fun m!834497 () Bool)

(assert (=> bs!25189 m!834497))

(assert (=> bs!25189 m!834497))

(declare-fun m!834499 () Bool)

(assert (=> bs!25189 m!834499))

(assert (=> b!898331 d!111111))

(assert (=> bm!39848 d!111089))

(declare-fun d!111113 () Bool)

(assert (=> d!111113 (isDefined!333 (getValueByKey!457 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))))))

(declare-fun lt!405564 () Unit!30476)

(declare-fun choose!1503 (List!17848 (_ BitVec 64)) Unit!30476)

(assert (=> d!111113 (= lt!405564 (choose!1503 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))))))

(declare-fun e!502626 () Bool)

(assert (=> d!111113 e!502626))

(declare-fun res!607188 () Bool)

(assert (=> d!111113 (=> (not res!607188) (not e!502626))))

(declare-fun isStrictlySorted!493 (List!17848) Bool)

(assert (=> d!111113 (= res!607188 (isStrictlySorted!493 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))))

(assert (=> d!111113 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!320 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))) lt!405564)))

(declare-fun b!898493 () Bool)

(assert (=> b!898493 (= e!502626 (containsKey!425 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))))))

(assert (= (and d!111113 res!607188) b!898493))

(assert (=> d!111113 m!834181))

(assert (=> d!111113 m!834337))

(assert (=> d!111113 m!834337))

(assert (=> d!111113 m!834339))

(assert (=> d!111113 m!834181))

(declare-fun m!834501 () Bool)

(assert (=> d!111113 m!834501))

(declare-fun m!834503 () Bool)

(assert (=> d!111113 m!834503))

(assert (=> b!898493 m!834181))

(assert (=> b!898493 m!834333))

(assert (=> b!898357 d!111113))

(declare-fun d!111115 () Bool)

(declare-fun isEmpty!690 (Option!463) Bool)

(assert (=> d!111115 (= (isDefined!333 (getValueByKey!457 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358)))) (not (isEmpty!690 (getValueByKey!457 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))))))))

(declare-fun bs!25190 () Bool)

(assert (= bs!25190 d!111115))

(assert (=> bs!25190 m!834337))

(declare-fun m!834505 () Bool)

(assert (=> bs!25190 m!834505))

(assert (=> b!898357 d!111115))

(declare-fun d!111117 () Bool)

(declare-fun c!94938 () Bool)

(assert (=> d!111117 (= c!94938 (and ((_ is Cons!17844) (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))) (= (_1!6038 (h!18986 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358)))))))

(declare-fun e!502631 () Option!463)

(assert (=> d!111117 (= (getValueByKey!457 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))) e!502631)))

(declare-fun b!898504 () Bool)

(declare-fun e!502632 () Option!463)

(assert (=> b!898504 (= e!502632 (getValueByKey!457 (t!25180 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))))))

(declare-fun b!898503 () Bool)

(assert (=> b!898503 (= e!502631 e!502632)))

(declare-fun c!94939 () Bool)

(assert (=> b!898503 (= c!94939 (and ((_ is Cons!17844) (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))) (not (= (_1!6038 (h!18986 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))))))))

(declare-fun b!898505 () Bool)

(assert (=> b!898505 (= e!502632 None!461)))

(declare-fun b!898502 () Bool)

(assert (=> b!898502 (= e!502631 (Some!462 (_2!6038 (h!18986 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))))))))

(assert (= (and d!111117 c!94938) b!898502))

(assert (= (and d!111117 (not c!94938)) b!898503))

(assert (= (and b!898503 c!94939) b!898504))

(assert (= (and b!898503 (not c!94939)) b!898505))

(assert (=> b!898504 m!834181))

(declare-fun m!834507 () Bool)

(assert (=> b!898504 m!834507))

(assert (=> b!898357 d!111117))

(declare-fun d!111119 () Bool)

(declare-fun e!502634 () Bool)

(assert (=> d!111119 e!502634))

(declare-fun res!607189 () Bool)

(assert (=> d!111119 (=> res!607189 e!502634)))

(declare-fun lt!405567 () Bool)

(assert (=> d!111119 (= res!607189 (not lt!405567))))

(declare-fun lt!405568 () Bool)

(assert (=> d!111119 (= lt!405567 lt!405568)))

(declare-fun lt!405566 () Unit!30476)

(declare-fun e!502633 () Unit!30476)

(assert (=> d!111119 (= lt!405566 e!502633)))

(declare-fun c!94940 () Bool)

(assert (=> d!111119 (= c!94940 lt!405568)))

(assert (=> d!111119 (= lt!405568 (containsKey!425 (toList!5386 lt!405459) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111119 (= (contains!4381 lt!405459 #b1000000000000000000000000000000000000000000000000000000000000000) lt!405567)))

(declare-fun b!898506 () Bool)

(declare-fun lt!405565 () Unit!30476)

(assert (=> b!898506 (= e!502633 lt!405565)))

(assert (=> b!898506 (= lt!405565 (lemmaContainsKeyImpliesGetValueByKeyDefined!320 (toList!5386 lt!405459) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898506 (isDefined!333 (getValueByKey!457 (toList!5386 lt!405459) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898507 () Bool)

(declare-fun Unit!30485 () Unit!30476)

(assert (=> b!898507 (= e!502633 Unit!30485)))

(declare-fun b!898508 () Bool)

(assert (=> b!898508 (= e!502634 (isDefined!333 (getValueByKey!457 (toList!5386 lt!405459) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111119 c!94940) b!898506))

(assert (= (and d!111119 (not c!94940)) b!898507))

(assert (= (and d!111119 (not res!607189)) b!898508))

(declare-fun m!834509 () Bool)

(assert (=> d!111119 m!834509))

(declare-fun m!834511 () Bool)

(assert (=> b!898506 m!834511))

(assert (=> b!898506 m!834497))

(assert (=> b!898506 m!834497))

(declare-fun m!834513 () Bool)

(assert (=> b!898506 m!834513))

(assert (=> b!898508 m!834497))

(assert (=> b!898508 m!834497))

(assert (=> b!898508 m!834513))

(assert (=> bm!39844 d!111119))

(declare-fun d!111121 () Bool)

(assert (=> d!111121 (= (apply!406 lt!405459 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)) (get!13322 (getValueByKey!457 (toList!5386 lt!405459) (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25191 () Bool)

(assert (= bs!25191 d!111121))

(assert (=> bs!25191 m!834273))

(declare-fun m!834515 () Bool)

(assert (=> bs!25191 m!834515))

(assert (=> bs!25191 m!834515))

(declare-fun m!834517 () Bool)

(assert (=> bs!25191 m!834517))

(assert (=> b!898333 d!111121))

(declare-fun d!111123 () Bool)

(declare-fun c!94943 () Bool)

(assert (=> d!111123 (= c!94943 ((_ is ValueCellFull!8690) (select (arr!25332 (_values!5419 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!502637 () V!29423)

(assert (=> d!111123 (= (get!13321 (select (arr!25332 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1300 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!502637)))

(declare-fun b!898513 () Bool)

(declare-fun get!13323 (ValueCell!8690 V!29423) V!29423)

(assert (=> b!898513 (= e!502637 (get!13323 (select (arr!25332 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1300 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!898514 () Bool)

(declare-fun get!13324 (ValueCell!8690 V!29423) V!29423)

(assert (=> b!898514 (= e!502637 (get!13324 (select (arr!25332 (_values!5419 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1300 (defaultEntry!5412 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111123 c!94943) b!898513))

(assert (= (and d!111123 (not c!94943)) b!898514))

(assert (=> b!898513 m!834279))

(assert (=> b!898513 m!834281))

(declare-fun m!834519 () Bool)

(assert (=> b!898513 m!834519))

(assert (=> b!898514 m!834279))

(assert (=> b!898514 m!834281))

(declare-fun m!834521 () Bool)

(assert (=> b!898514 m!834521))

(assert (=> b!898333 d!111123))

(declare-fun b!898533 () Bool)

(declare-fun lt!405573 () SeekEntryResult!8927)

(assert (=> b!898533 (and (bvsge (index!38081 lt!405573) #b00000000000000000000000000000000) (bvslt (index!38081 lt!405573) (size!25788 (_keys!10182 thiss!1181))))))

(declare-fun res!607196 () Bool)

(assert (=> b!898533 (= res!607196 (= (select (arr!25331 (_keys!10182 thiss!1181)) (index!38081 lt!405573)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502648 () Bool)

(assert (=> b!898533 (=> res!607196 e!502648)))

(declare-fun b!898534 () Bool)

(assert (=> b!898534 (and (bvsge (index!38081 lt!405573) #b00000000000000000000000000000000) (bvslt (index!38081 lt!405573) (size!25788 (_keys!10182 thiss!1181))))))

(declare-fun res!607197 () Bool)

(assert (=> b!898534 (= res!607197 (= (select (arr!25331 (_keys!10182 thiss!1181)) (index!38081 lt!405573)) key!785))))

(assert (=> b!898534 (=> res!607197 e!502648)))

(declare-fun e!502650 () Bool)

(assert (=> b!898534 (= e!502650 e!502648)))

(declare-fun b!898535 () Bool)

(declare-fun e!502652 () SeekEntryResult!8927)

(declare-fun e!502651 () SeekEntryResult!8927)

(assert (=> b!898535 (= e!502652 e!502651)))

(declare-fun c!94951 () Bool)

(declare-fun lt!405574 () (_ BitVec 64))

(assert (=> b!898535 (= c!94951 (or (= lt!405574 key!785) (= (bvadd lt!405574 lt!405574) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!898536 () Bool)

(declare-fun e!502649 () Bool)

(assert (=> b!898536 (= e!502649 (bvsge (x!76569 lt!405573) #b01111111111111111111111111111110))))

(declare-fun b!898537 () Bool)

(assert (=> b!898537 (= e!502652 (Intermediate!8927 true (toIndex!0 key!785 (mask!26135 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!898538 () Bool)

(assert (=> b!898538 (= e!502649 e!502650)))

(declare-fun res!607198 () Bool)

(assert (=> b!898538 (= res!607198 (and ((_ is Intermediate!8927) lt!405573) (not (undefined!9739 lt!405573)) (bvslt (x!76569 lt!405573) #b01111111111111111111111111111110) (bvsge (x!76569 lt!405573) #b00000000000000000000000000000000) (bvsge (x!76569 lt!405573) #b00000000000000000000000000000000)))))

(assert (=> b!898538 (=> (not res!607198) (not e!502650))))

(declare-fun b!898539 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898539 (= e!502651 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26135 thiss!1181)) #b00000000000000000000000000000000 (mask!26135 thiss!1181)) key!785 (_keys!10182 thiss!1181) (mask!26135 thiss!1181)))))

(declare-fun b!898540 () Bool)

(assert (=> b!898540 (= e!502651 (Intermediate!8927 false (toIndex!0 key!785 (mask!26135 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun d!111125 () Bool)

(assert (=> d!111125 e!502649))

(declare-fun c!94950 () Bool)

(assert (=> d!111125 (= c!94950 (and ((_ is Intermediate!8927) lt!405573) (undefined!9739 lt!405573)))))

(assert (=> d!111125 (= lt!405573 e!502652)))

(declare-fun c!94952 () Bool)

(assert (=> d!111125 (= c!94952 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!111125 (= lt!405574 (select (arr!25331 (_keys!10182 thiss!1181)) (toIndex!0 key!785 (mask!26135 thiss!1181))))))

(assert (=> d!111125 (validMask!0 (mask!26135 thiss!1181))))

(assert (=> d!111125 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26135 thiss!1181)) key!785 (_keys!10182 thiss!1181) (mask!26135 thiss!1181)) lt!405573)))

(declare-fun b!898541 () Bool)

(assert (=> b!898541 (and (bvsge (index!38081 lt!405573) #b00000000000000000000000000000000) (bvslt (index!38081 lt!405573) (size!25788 (_keys!10182 thiss!1181))))))

(assert (=> b!898541 (= e!502648 (= (select (arr!25331 (_keys!10182 thiss!1181)) (index!38081 lt!405573)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!111125 c!94952) b!898537))

(assert (= (and d!111125 (not c!94952)) b!898535))

(assert (= (and b!898535 c!94951) b!898540))

(assert (= (and b!898535 (not c!94951)) b!898539))

(assert (= (and d!111125 c!94950) b!898536))

(assert (= (and d!111125 (not c!94950)) b!898538))

(assert (= (and b!898538 res!607198) b!898534))

(assert (= (and b!898534 (not res!607197)) b!898533))

(assert (= (and b!898533 (not res!607196)) b!898541))

(declare-fun m!834523 () Bool)

(assert (=> b!898533 m!834523))

(assert (=> b!898534 m!834523))

(assert (=> d!111125 m!834265))

(declare-fun m!834525 () Bool)

(assert (=> d!111125 m!834525))

(assert (=> d!111125 m!834175))

(assert (=> b!898541 m!834523))

(assert (=> b!898539 m!834265))

(declare-fun m!834527 () Bool)

(assert (=> b!898539 m!834527))

(assert (=> b!898539 m!834527))

(declare-fun m!834529 () Bool)

(assert (=> b!898539 m!834529))

(assert (=> d!111045 d!111125))

(declare-fun d!111127 () Bool)

(declare-fun lt!405580 () (_ BitVec 32))

(declare-fun lt!405579 () (_ BitVec 32))

(assert (=> d!111127 (= lt!405580 (bvmul (bvxor lt!405579 (bvlshr lt!405579 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111127 (= lt!405579 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111127 (and (bvsge (mask!26135 thiss!1181) #b00000000000000000000000000000000) (let ((res!607199 (let ((h!18990 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76588 (bvmul (bvxor h!18990 (bvlshr h!18990 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76588 (bvlshr x!76588 #b00000000000000000000000000001101)) (mask!26135 thiss!1181)))))) (and (bvslt res!607199 (bvadd (mask!26135 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!607199 #b00000000000000000000000000000000))))))

(assert (=> d!111127 (= (toIndex!0 key!785 (mask!26135 thiss!1181)) (bvand (bvxor lt!405580 (bvlshr lt!405580 #b00000000000000000000000000001101)) (mask!26135 thiss!1181)))))

(assert (=> d!111045 d!111127))

(assert (=> d!111045 d!111051))

(declare-fun d!111129 () Bool)

(assert (=> d!111129 (contains!4381 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358)))))

(assert (=> d!111129 true))

(declare-fun _$16!178 () Unit!30476)

(assert (=> d!111129 (= (choose!1500 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) (index!38080 lt!405358) (defaultEntry!5412 thiss!1181)) _$16!178)))

(declare-fun bs!25192 () Bool)

(assert (= bs!25192 d!111129))

(assert (=> bs!25192 m!834177))

(assert (=> bs!25192 m!834181))

(assert (=> bs!25192 m!834177))

(assert (=> bs!25192 m!834181))

(assert (=> bs!25192 m!834183))

(assert (=> d!111047 d!111129))

(assert (=> d!111047 d!111051))

(assert (=> b!898279 d!111057))

(assert (=> b!898279 d!111055))

(assert (=> b!898359 d!111115))

(assert (=> b!898359 d!111117))

(declare-fun d!111131 () Bool)

(assert (=> d!111131 (= (apply!406 lt!405459 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13322 (getValueByKey!457 (toList!5386 lt!405459) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25193 () Bool)

(assert (= bs!25193 d!111131))

(declare-fun m!834531 () Bool)

(assert (=> bs!25193 m!834531))

(assert (=> bs!25193 m!834531))

(declare-fun m!834533 () Bool)

(assert (=> bs!25193 m!834533))

(assert (=> b!898335 d!111131))

(declare-fun d!111133 () Bool)

(declare-fun res!607200 () Bool)

(declare-fun e!502653 () Bool)

(assert (=> d!111133 (=> res!607200 e!502653)))

(assert (=> d!111133 (= res!607200 (= (select (arr!25331 (_keys!10182 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111133 (= (arrayContainsKey!0 (_keys!10182 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!502653)))

(declare-fun b!898542 () Bool)

(declare-fun e!502654 () Bool)

(assert (=> b!898542 (= e!502653 e!502654)))

(declare-fun res!607201 () Bool)

(assert (=> b!898542 (=> (not res!607201) (not e!502654))))

(assert (=> b!898542 (= res!607201 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25788 (_keys!10182 thiss!1181))))))

(declare-fun b!898543 () Bool)

(assert (=> b!898543 (= e!502654 (arrayContainsKey!0 (_keys!10182 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111133 (not res!607200)) b!898542))

(assert (= (and b!898542 res!607201) b!898543))

(declare-fun m!834535 () Bool)

(assert (=> d!111133 m!834535))

(declare-fun m!834537 () Bool)

(assert (=> b!898543 m!834537))

(assert (=> b!898285 d!111133))

(declare-fun d!111135 () Bool)

(assert (=> d!111135 (= (validKeyInArray!0 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!898337 d!111135))

(assert (=> b!898338 d!111135))

(assert (=> d!111049 d!111053))

(declare-fun d!111137 () Bool)

(assert (=> d!111137 (arrayContainsKey!0 (_keys!10182 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111137 true))

(declare-fun _$60!415 () Unit!30476)

(assert (=> d!111137 (= (choose!13 (_keys!10182 thiss!1181) key!785 (index!38080 lt!405358)) _$60!415)))

(declare-fun bs!25194 () Bool)

(assert (= bs!25194 d!111137))

(assert (=> bs!25194 m!834171))

(assert (=> d!111049 d!111137))

(declare-fun d!111139 () Bool)

(declare-fun res!607206 () Bool)

(declare-fun e!502659 () Bool)

(assert (=> d!111139 (=> res!607206 e!502659)))

(assert (=> d!111139 (= res!607206 (and ((_ is Cons!17844) (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))) (= (_1!6038 (h!18986 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358)))))))

(assert (=> d!111139 (= (containsKey!425 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))) e!502659)))

(declare-fun b!898548 () Bool)

(declare-fun e!502660 () Bool)

(assert (=> b!898548 (= e!502659 e!502660)))

(declare-fun res!607207 () Bool)

(assert (=> b!898548 (=> (not res!607207) (not e!502660))))

(assert (=> b!898548 (= res!607207 (and (or (not ((_ is Cons!17844) (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))))) (bvsle (_1!6038 (h!18986 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358)))) ((_ is Cons!17844) (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))) (bvslt (_1!6038 (h!18986 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181))))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358)))))))

(declare-fun b!898549 () Bool)

(assert (=> b!898549 (= e!502660 (containsKey!425 (t!25180 (toList!5386 (getCurrentListMap!2605 (_keys!10182 thiss!1181) (_values!5419 thiss!1181) (mask!26135 thiss!1181) (extraKeys!5128 thiss!1181) (zeroValue!5232 thiss!1181) (minValue!5232 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5412 thiss!1181)))) (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405358))))))

(assert (= (and d!111139 (not res!607206)) b!898548))

(assert (= (and b!898548 res!607207) b!898549))

(assert (=> b!898549 m!834181))

(declare-fun m!834539 () Bool)

(assert (=> b!898549 m!834539))

(assert (=> d!111057 d!111139))

(declare-fun d!111141 () Bool)

(declare-fun e!502661 () Bool)

(assert (=> d!111141 e!502661))

(declare-fun res!607208 () Bool)

(assert (=> d!111141 (=> (not res!607208) (not e!502661))))

(declare-fun lt!405584 () ListLongMap!10741)

(assert (=> d!111141 (= res!607208 (contains!4381 lt!405584 (_1!6038 (ite (or c!94904 c!94905) (tuple2!12055 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))))

(declare-fun lt!405582 () List!17848)

(assert (=> d!111141 (= lt!405584 (ListLongMap!10742 lt!405582))))

(declare-fun lt!405583 () Unit!30476)

(declare-fun lt!405581 () Unit!30476)

(assert (=> d!111141 (= lt!405583 lt!405581)))

(assert (=> d!111141 (= (getValueByKey!457 lt!405582 (_1!6038 (ite (or c!94904 c!94905) (tuple2!12055 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))) (Some!462 (_2!6038 (ite (or c!94904 c!94905) (tuple2!12055 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))))

(assert (=> d!111141 (= lt!405581 (lemmaContainsTupThenGetReturnValue!249 lt!405582 (_1!6038 (ite (or c!94904 c!94905) (tuple2!12055 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))) (_2!6038 (ite (or c!94904 c!94905) (tuple2!12055 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))))

(assert (=> d!111141 (= lt!405582 (insertStrictlySorted!306 (toList!5386 (ite c!94904 call!39847 (ite c!94905 call!39850 call!39848))) (_1!6038 (ite (or c!94904 c!94905) (tuple2!12055 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))) (_2!6038 (ite (or c!94904 c!94905) (tuple2!12055 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))))))

(assert (=> d!111141 (= (+!2617 (ite c!94904 call!39847 (ite c!94905 call!39850 call!39848)) (ite (or c!94904 c!94905) (tuple2!12055 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))) lt!405584)))

(declare-fun b!898550 () Bool)

(declare-fun res!607209 () Bool)

(assert (=> b!898550 (=> (not res!607209) (not e!502661))))

(assert (=> b!898550 (= res!607209 (= (getValueByKey!457 (toList!5386 lt!405584) (_1!6038 (ite (or c!94904 c!94905) (tuple2!12055 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181))))) (Some!462 (_2!6038 (ite (or c!94904 c!94905) (tuple2!12055 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))))

(declare-fun b!898551 () Bool)

(assert (=> b!898551 (= e!502661 (contains!4384 (toList!5386 lt!405584) (ite (or c!94904 c!94905) (tuple2!12055 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5232 thiss!1181)) (tuple2!12055 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5232 thiss!1181)))))))

(assert (= (and d!111141 res!607208) b!898550))

(assert (= (and b!898550 res!607209) b!898551))

(declare-fun m!834541 () Bool)

(assert (=> d!111141 m!834541))

(declare-fun m!834543 () Bool)

(assert (=> d!111141 m!834543))

(declare-fun m!834545 () Bool)

(assert (=> d!111141 m!834545))

(declare-fun m!834547 () Bool)

(assert (=> d!111141 m!834547))

(declare-fun m!834549 () Bool)

(assert (=> b!898550 m!834549))

(declare-fun m!834551 () Bool)

(assert (=> b!898551 m!834551))

(assert (=> bm!39846 d!111141))

(declare-fun b!898564 () Bool)

(declare-fun e!502670 () SeekEntryResult!8927)

(assert (=> b!898564 (= e!502670 (Found!8927 (index!38081 lt!405401)))))

(declare-fun b!898565 () Bool)

(declare-fun e!502668 () SeekEntryResult!8927)

(assert (=> b!898565 (= e!502668 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76569 lt!405401) #b00000000000000000000000000000001) (nextIndex!0 (index!38081 lt!405401) (x!76569 lt!405401) (mask!26135 thiss!1181)) (index!38081 lt!405401) key!785 (_keys!10182 thiss!1181) (mask!26135 thiss!1181)))))

(declare-fun b!898567 () Bool)

(declare-fun e!502669 () SeekEntryResult!8927)

(assert (=> b!898567 (= e!502669 Undefined!8927)))

(declare-fun b!898568 () Bool)

(assert (=> b!898568 (= e!502668 (MissingVacant!8927 (index!38081 lt!405401)))))

(declare-fun b!898569 () Bool)

(assert (=> b!898569 (= e!502669 e!502670)))

(declare-fun c!94961 () Bool)

(declare-fun lt!405590 () (_ BitVec 64))

(assert (=> b!898569 (= c!94961 (= lt!405590 key!785))))

(declare-fun d!111143 () Bool)

(declare-fun lt!405589 () SeekEntryResult!8927)

(assert (=> d!111143 (and (or ((_ is Undefined!8927) lt!405589) (not ((_ is Found!8927) lt!405589)) (and (bvsge (index!38080 lt!405589) #b00000000000000000000000000000000) (bvslt (index!38080 lt!405589) (size!25788 (_keys!10182 thiss!1181))))) (or ((_ is Undefined!8927) lt!405589) ((_ is Found!8927) lt!405589) (not ((_ is MissingVacant!8927) lt!405589)) (not (= (index!38082 lt!405589) (index!38081 lt!405401))) (and (bvsge (index!38082 lt!405589) #b00000000000000000000000000000000) (bvslt (index!38082 lt!405589) (size!25788 (_keys!10182 thiss!1181))))) (or ((_ is Undefined!8927) lt!405589) (ite ((_ is Found!8927) lt!405589) (= (select (arr!25331 (_keys!10182 thiss!1181)) (index!38080 lt!405589)) key!785) (and ((_ is MissingVacant!8927) lt!405589) (= (index!38082 lt!405589) (index!38081 lt!405401)) (= (select (arr!25331 (_keys!10182 thiss!1181)) (index!38082 lt!405589)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111143 (= lt!405589 e!502669)))

(declare-fun c!94959 () Bool)

(assert (=> d!111143 (= c!94959 (bvsge (x!76569 lt!405401) #b01111111111111111111111111111110))))

(assert (=> d!111143 (= lt!405590 (select (arr!25331 (_keys!10182 thiss!1181)) (index!38081 lt!405401)))))

(assert (=> d!111143 (validMask!0 (mask!26135 thiss!1181))))

(assert (=> d!111143 (= (seekKeyOrZeroReturnVacant!0 (x!76569 lt!405401) (index!38081 lt!405401) (index!38081 lt!405401) key!785 (_keys!10182 thiss!1181) (mask!26135 thiss!1181)) lt!405589)))

(declare-fun b!898566 () Bool)

(declare-fun c!94960 () Bool)

(assert (=> b!898566 (= c!94960 (= lt!405590 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898566 (= e!502670 e!502668)))

(assert (= (and d!111143 c!94959) b!898567))

(assert (= (and d!111143 (not c!94959)) b!898569))

(assert (= (and b!898569 c!94961) b!898564))

(assert (= (and b!898569 (not c!94961)) b!898566))

(assert (= (and b!898566 c!94960) b!898568))

(assert (= (and b!898566 (not c!94960)) b!898565))

(declare-fun m!834553 () Bool)

(assert (=> b!898565 m!834553))

(assert (=> b!898565 m!834553))

(declare-fun m!834555 () Bool)

(assert (=> b!898565 m!834555))

(declare-fun m!834557 () Bool)

(assert (=> d!111143 m!834557))

(declare-fun m!834559 () Bool)

(assert (=> d!111143 m!834559))

(assert (=> d!111143 m!834259))

(assert (=> d!111143 m!834175))

(assert (=> b!898273 d!111143))

(declare-fun d!111145 () Bool)

(declare-fun e!502672 () Bool)

(assert (=> d!111145 e!502672))

(declare-fun res!607210 () Bool)

(assert (=> d!111145 (=> res!607210 e!502672)))

(declare-fun lt!405593 () Bool)

(assert (=> d!111145 (= res!607210 (not lt!405593))))

(declare-fun lt!405594 () Bool)

(assert (=> d!111145 (= lt!405593 lt!405594)))

(declare-fun lt!405592 () Unit!30476)

(declare-fun e!502671 () Unit!30476)

(assert (=> d!111145 (= lt!405592 e!502671)))

(declare-fun c!94962 () Bool)

(assert (=> d!111145 (= c!94962 lt!405594)))

(assert (=> d!111145 (= lt!405594 (containsKey!425 (toList!5386 lt!405459) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111145 (= (contains!4381 lt!405459 #b0000000000000000000000000000000000000000000000000000000000000000) lt!405593)))

(declare-fun b!898570 () Bool)

(declare-fun lt!405591 () Unit!30476)

(assert (=> b!898570 (= e!502671 lt!405591)))

(assert (=> b!898570 (= lt!405591 (lemmaContainsKeyImpliesGetValueByKeyDefined!320 (toList!5386 lt!405459) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898570 (isDefined!333 (getValueByKey!457 (toList!5386 lt!405459) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!898571 () Bool)

(declare-fun Unit!30486 () Unit!30476)

(assert (=> b!898571 (= e!502671 Unit!30486)))

(declare-fun b!898572 () Bool)

(assert (=> b!898572 (= e!502672 (isDefined!333 (getValueByKey!457 (toList!5386 lt!405459) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111145 c!94962) b!898570))

(assert (= (and d!111145 (not c!94962)) b!898571))

(assert (= (and d!111145 (not res!607210)) b!898572))

(declare-fun m!834561 () Bool)

(assert (=> d!111145 m!834561))

(declare-fun m!834563 () Bool)

(assert (=> b!898570 m!834563))

(assert (=> b!898570 m!834531))

(assert (=> b!898570 m!834531))

(declare-fun m!834565 () Bool)

(assert (=> b!898570 m!834565))

(assert (=> b!898572 m!834531))

(assert (=> b!898572 m!834531))

(assert (=> b!898572 m!834565))

(assert (=> bm!39845 d!111145))

(declare-fun d!111147 () Bool)

(declare-fun e!502674 () Bool)

(assert (=> d!111147 e!502674))

(declare-fun res!607211 () Bool)

(assert (=> d!111147 (=> res!607211 e!502674)))

(declare-fun lt!405597 () Bool)

(assert (=> d!111147 (= res!607211 (not lt!405597))))

(declare-fun lt!405598 () Bool)

(assert (=> d!111147 (= lt!405597 lt!405598)))

(declare-fun lt!405596 () Unit!30476)

(declare-fun e!502673 () Unit!30476)

(assert (=> d!111147 (= lt!405596 e!502673)))

(declare-fun c!94963 () Bool)

(assert (=> d!111147 (= c!94963 lt!405598)))

(assert (=> d!111147 (= lt!405598 (containsKey!425 (toList!5386 lt!405459) (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111147 (= (contains!4381 lt!405459 (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)) lt!405597)))

(declare-fun b!898573 () Bool)

(declare-fun lt!405595 () Unit!30476)

(assert (=> b!898573 (= e!502673 lt!405595)))

(assert (=> b!898573 (= lt!405595 (lemmaContainsKeyImpliesGetValueByKeyDefined!320 (toList!5386 lt!405459) (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!898573 (isDefined!333 (getValueByKey!457 (toList!5386 lt!405459) (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898574 () Bool)

(declare-fun Unit!30487 () Unit!30476)

(assert (=> b!898574 (= e!502673 Unit!30487)))

(declare-fun b!898575 () Bool)

(assert (=> b!898575 (= e!502674 (isDefined!333 (getValueByKey!457 (toList!5386 lt!405459) (select (arr!25331 (_keys!10182 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!111147 c!94963) b!898573))

(assert (= (and d!111147 (not c!94963)) b!898574))

(assert (= (and d!111147 (not res!607211)) b!898575))

(assert (=> d!111147 m!834273))

(declare-fun m!834567 () Bool)

(assert (=> d!111147 m!834567))

(assert (=> b!898573 m!834273))

(declare-fun m!834569 () Bool)

(assert (=> b!898573 m!834569))

(assert (=> b!898573 m!834273))

(assert (=> b!898573 m!834515))

(assert (=> b!898573 m!834515))

(declare-fun m!834571 () Bool)

(assert (=> b!898573 m!834571))

(assert (=> b!898575 m!834273))

(assert (=> b!898575 m!834515))

(assert (=> b!898575 m!834515))

(assert (=> b!898575 m!834571))

(assert (=> b!898340 d!111147))

(assert (=> d!111055 d!111051))

(declare-fun mapNonEmpty!29179 () Bool)

(declare-fun mapRes!29179 () Bool)

(declare-fun tp!56131 () Bool)

(declare-fun e!502676 () Bool)

(assert (=> mapNonEmpty!29179 (= mapRes!29179 (and tp!56131 e!502676))))

(declare-fun mapValue!29179 () ValueCell!8690)

(declare-fun mapKey!29179 () (_ BitVec 32))

(declare-fun mapRest!29179 () (Array (_ BitVec 32) ValueCell!8690))

(assert (=> mapNonEmpty!29179 (= mapRest!29178 (store mapRest!29179 mapKey!29179 mapValue!29179))))

(declare-fun condMapEmpty!29179 () Bool)

(declare-fun mapDefault!29179 () ValueCell!8690)

(assert (=> mapNonEmpty!29178 (= condMapEmpty!29179 (= mapRest!29178 ((as const (Array (_ BitVec 32) ValueCell!8690)) mapDefault!29179)))))

(declare-fun e!502675 () Bool)

(assert (=> mapNonEmpty!29178 (= tp!56130 (and e!502675 mapRes!29179))))

(declare-fun b!898577 () Bool)

(assert (=> b!898577 (= e!502675 tp_is_empty!18343)))

(declare-fun b!898576 () Bool)

(assert (=> b!898576 (= e!502676 tp_is_empty!18343)))

(declare-fun mapIsEmpty!29179 () Bool)

(assert (=> mapIsEmpty!29179 mapRes!29179))

(assert (= (and mapNonEmpty!29178 condMapEmpty!29179) mapIsEmpty!29179))

(assert (= (and mapNonEmpty!29178 (not condMapEmpty!29179)) mapNonEmpty!29179))

(assert (= (and mapNonEmpty!29179 ((_ is ValueCellFull!8690) mapValue!29179)) b!898576))

(assert (= (and mapNonEmpty!29178 ((_ is ValueCellFull!8690) mapDefault!29179)) b!898577))

(declare-fun m!834573 () Bool)

(assert (=> mapNonEmpty!29179 m!834573))

(declare-fun b_lambda!12953 () Bool)

(assert (= b_lambda!12951 (or (and b!898198 b_free!16015) b_lambda!12953)))

(declare-fun b_lambda!12955 () Bool)

(assert (= b_lambda!12949 (or (and b!898198 b_free!16015) b_lambda!12955)))

(check-sat (not b_lambda!12953) (not b!898437) (not d!111121) (not b!898575) (not d!111079) (not d!111073) (not b!898441) (not b!898513) (not b!898486) (not d!111119) (not b!898440) (not d!111113) (not b!898565) (not b!898506) (not b!898389) (not b!898504) (not d!111093) (not d!111147) (not d!111145) (not d!111141) (not b!898458) (not d!111069) (not b!898551) (not d!111087) (not d!111099) (not bm!39860) (not b!898489) (not d!111077) (not b!898397) (not b!898475) (not b!898436) (not d!111067) (not d!111095) (not b!898435) (not b!898449) (not d!111129) (not mapNonEmpty!29179) (not b!898490) (not b!898406) (not b!898549) (not b!898408) (not d!111125) (not b!898476) (not d!111137) (not b!898573) (not b!898404) (not b!898550) (not bm!39857) (not b_lambda!12947) (not b!898390) (not b!898443) (not d!111089) (not b!898409) (not d!111111) (not bm!39851) (not b!898543) (not b!898473) (not d!111085) (not b!898493) (not bm!39854) (not d!111091) (not b!898379) (not d!111097) (not b!898539) (not b!898448) (not b!898514) (not d!111081) (not b!898508) (not b!898570) (not d!111109) (not d!111143) (not b!898444) tp_is_empty!18343 (not d!111071) (not b!898410) (not d!111131) (not b_lambda!12955) (not b_next!16015) (not b!898572) (not d!111065) (not b!898396) b_and!26293 (not b!898485) (not b!898438) (not d!111083) (not d!111115) (not b!898405) (not d!111075))
(check-sat b_and!26293 (not b_next!16015))
