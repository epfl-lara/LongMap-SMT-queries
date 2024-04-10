; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75914 () Bool)

(assert start!75914)

(declare-fun b!893203 () Bool)

(declare-fun b_free!15849 () Bool)

(declare-fun b_next!15849 () Bool)

(assert (=> b!893203 (= b_free!15849 (not b_next!15849))))

(declare-fun tp!55518 () Bool)

(declare-fun b_and!26111 () Bool)

(assert (=> b!893203 (= tp!55518 b_and!26111)))

(declare-fun b!893196 () Bool)

(declare-fun e!498792 () Bool)

(declare-fun e!498798 () Bool)

(assert (=> b!893196 (= e!498792 (not e!498798))))

(declare-fun res!604939 () Bool)

(assert (=> b!893196 (=> res!604939 e!498798)))

(declare-datatypes ((SeekEntryResult!8862 0))(
  ( (MissingZero!8862 (index!37819 (_ BitVec 32))) (Found!8862 (index!37820 (_ BitVec 32))) (Intermediate!8862 (undefined!9674 Bool) (index!37821 (_ BitVec 32)) (x!75930 (_ BitVec 32))) (Undefined!8862) (MissingVacant!8862 (index!37822 (_ BitVec 32))) )
))
(declare-fun lt!403558 () SeekEntryResult!8862)

(get-info :version)

(assert (=> b!893196 (= res!604939 ((_ is Found!8862) lt!403558))))

(declare-fun e!498791 () Bool)

(assert (=> b!893196 e!498791))

(declare-fun res!604943 () Bool)

(assert (=> b!893196 (=> res!604943 e!498791)))

(assert (=> b!893196 (= res!604943 (not ((_ is Found!8862) lt!403558)))))

(declare-datatypes ((Unit!30422 0))(
  ( (Unit!30423) )
))
(declare-fun lt!403557 () Unit!30422)

(declare-datatypes ((array!52336 0))(
  ( (array!52337 (arr!25173 (Array (_ BitVec 32) (_ BitVec 64))) (size!25617 (_ BitVec 32))) )
))
(declare-datatypes ((V!29201 0))(
  ( (V!29202 (val!9139 Int)) )
))
(declare-datatypes ((ValueCell!8607 0))(
  ( (ValueCellFull!8607 (v!11619 V!29201)) (EmptyCell!8607) )
))
(declare-datatypes ((array!52338 0))(
  ( (array!52339 (arr!25174 (Array (_ BitVec 32) ValueCell!8607)) (size!25618 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4230 0))(
  ( (LongMapFixedSize!4231 (defaultEntry!5315 Int) (mask!25841 (_ BitVec 32)) (extraKeys!5010 (_ BitVec 32)) (zeroValue!5114 V!29201) (minValue!5114 V!29201) (_size!2170 (_ BitVec 32)) (_keys!10000 array!52336) (_values!5301 array!52338) (_vacant!2170 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4230)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!61 (array!52336 array!52338 (_ BitVec 32) (_ BitVec 32) V!29201 V!29201 (_ BitVec 64)) Unit!30422)

(assert (=> b!893196 (= lt!403557 (lemmaSeekEntryGivesInRangeIndex!61 (_keys!10000 thiss!1181) (_values!5301 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5010 thiss!1181) (zeroValue!5114 thiss!1181) (minValue!5114 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52336 (_ BitVec 32)) SeekEntryResult!8862)

(assert (=> b!893196 (= lt!403558 (seekEntry!0 key!785 (_keys!10000 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun b!893197 () Bool)

(declare-fun e!498794 () Bool)

(declare-fun tp_is_empty!18177 () Bool)

(assert (=> b!893197 (= e!498794 tp_is_empty!18177)))

(declare-fun b!893198 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!893198 (= e!498791 (inRange!0 (index!37820 lt!403558) (mask!25841 thiss!1181)))))

(declare-fun res!604940 () Bool)

(assert (=> start!75914 (=> (not res!604940) (not e!498792))))

(declare-fun valid!1635 (LongMapFixedSize!4230) Bool)

(assert (=> start!75914 (= res!604940 (valid!1635 thiss!1181))))

(assert (=> start!75914 e!498792))

(declare-fun e!498795 () Bool)

(assert (=> start!75914 e!498795))

(assert (=> start!75914 true))

(declare-fun mapIsEmpty!28823 () Bool)

(declare-fun mapRes!28823 () Bool)

(assert (=> mapIsEmpty!28823 mapRes!28823))

(declare-fun b!893199 () Bool)

(declare-fun e!498796 () Bool)

(declare-fun e!498793 () Bool)

(assert (=> b!893199 (= e!498796 (and e!498793 mapRes!28823))))

(declare-fun condMapEmpty!28823 () Bool)

(declare-fun mapDefault!28823 () ValueCell!8607)

(assert (=> b!893199 (= condMapEmpty!28823 (= (arr!25174 (_values!5301 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8607)) mapDefault!28823)))))

(declare-fun b!893200 () Bool)

(assert (=> b!893200 (= e!498793 tp_is_empty!18177)))

(declare-fun b!893201 () Bool)

(declare-datatypes ((Option!453 0))(
  ( (Some!452 (v!11620 V!29201)) (None!451) )
))
(declare-fun isDefined!326 (Option!453) Bool)

(declare-datatypes ((tuple2!12014 0))(
  ( (tuple2!12015 (_1!6018 (_ BitVec 64)) (_2!6018 V!29201)) )
))
(declare-datatypes ((List!17795 0))(
  ( (Nil!17792) (Cons!17791 (h!18922 tuple2!12014) (t!25112 List!17795)) )
))
(declare-fun getValueByKey!447 (List!17795 (_ BitVec 64)) Option!453)

(declare-datatypes ((ListLongMap!10711 0))(
  ( (ListLongMap!10712 (toList!5371 List!17795)) )
))
(declare-fun map!12212 (LongMapFixedSize!4230) ListLongMap!10711)

(assert (=> b!893201 (= e!498798 (isDefined!326 (getValueByKey!447 (toList!5371 (map!12212 thiss!1181)) key!785)))))

(declare-fun b!893202 () Bool)

(declare-fun res!604941 () Bool)

(assert (=> b!893202 (=> res!604941 e!498798)))

(declare-fun contains!4379 (LongMapFixedSize!4230 (_ BitVec 64)) Bool)

(assert (=> b!893202 (= res!604941 (not (contains!4379 thiss!1181 key!785)))))

(declare-fun mapNonEmpty!28823 () Bool)

(declare-fun tp!55519 () Bool)

(assert (=> mapNonEmpty!28823 (= mapRes!28823 (and tp!55519 e!498794))))

(declare-fun mapValue!28823 () ValueCell!8607)

(declare-fun mapRest!28823 () (Array (_ BitVec 32) ValueCell!8607))

(declare-fun mapKey!28823 () (_ BitVec 32))

(assert (=> mapNonEmpty!28823 (= (arr!25174 (_values!5301 thiss!1181)) (store mapRest!28823 mapKey!28823 mapValue!28823))))

(declare-fun array_inv!19770 (array!52336) Bool)

(declare-fun array_inv!19771 (array!52338) Bool)

(assert (=> b!893203 (= e!498795 (and tp!55518 tp_is_empty!18177 (array_inv!19770 (_keys!10000 thiss!1181)) (array_inv!19771 (_values!5301 thiss!1181)) e!498796))))

(declare-fun b!893204 () Bool)

(declare-fun res!604942 () Bool)

(assert (=> b!893204 (=> (not res!604942) (not e!498792))))

(assert (=> b!893204 (= res!604942 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!75914 res!604940) b!893204))

(assert (= (and b!893204 res!604942) b!893196))

(assert (= (and b!893196 (not res!604943)) b!893198))

(assert (= (and b!893196 (not res!604939)) b!893202))

(assert (= (and b!893202 (not res!604941)) b!893201))

(assert (= (and b!893199 condMapEmpty!28823) mapIsEmpty!28823))

(assert (= (and b!893199 (not condMapEmpty!28823)) mapNonEmpty!28823))

(assert (= (and mapNonEmpty!28823 ((_ is ValueCellFull!8607) mapValue!28823)) b!893197))

(assert (= (and b!893199 ((_ is ValueCellFull!8607) mapDefault!28823)) b!893200))

(assert (= b!893203 b!893199))

(assert (= start!75914 b!893203))

(declare-fun m!831303 () Bool)

(assert (=> b!893201 m!831303))

(declare-fun m!831305 () Bool)

(assert (=> b!893201 m!831305))

(assert (=> b!893201 m!831305))

(declare-fun m!831307 () Bool)

(assert (=> b!893201 m!831307))

(declare-fun m!831309 () Bool)

(assert (=> b!893196 m!831309))

(declare-fun m!831311 () Bool)

(assert (=> b!893196 m!831311))

(declare-fun m!831313 () Bool)

(assert (=> b!893198 m!831313))

(declare-fun m!831315 () Bool)

(assert (=> b!893203 m!831315))

(declare-fun m!831317 () Bool)

(assert (=> b!893203 m!831317))

(declare-fun m!831319 () Bool)

(assert (=> start!75914 m!831319))

(declare-fun m!831321 () Bool)

(assert (=> b!893202 m!831321))

(declare-fun m!831323 () Bool)

(assert (=> mapNonEmpty!28823 m!831323))

(check-sat b_and!26111 (not b!893202) (not mapNonEmpty!28823) (not b!893196) (not b!893201) (not b!893203) (not start!75914) (not b!893198) tp_is_empty!18177 (not b_next!15849))
(check-sat b_and!26111 (not b_next!15849))
(get-model)

(declare-fun d!110281 () Bool)

(assert (=> d!110281 (= (array_inv!19770 (_keys!10000 thiss!1181)) (bvsge (size!25617 (_keys!10000 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893203 d!110281))

(declare-fun d!110283 () Bool)

(assert (=> d!110283 (= (array_inv!19771 (_values!5301 thiss!1181)) (bvsge (size!25618 (_values!5301 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893203 d!110283))

(declare-fun d!110285 () Bool)

(declare-fun e!498825 () Bool)

(assert (=> d!110285 e!498825))

(declare-fun res!604961 () Bool)

(assert (=> d!110285 (=> res!604961 e!498825)))

(declare-fun lt!403570 () SeekEntryResult!8862)

(assert (=> d!110285 (= res!604961 (not ((_ is Found!8862) lt!403570)))))

(assert (=> d!110285 (= lt!403570 (seekEntry!0 key!785 (_keys!10000 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun lt!403569 () Unit!30422)

(declare-fun choose!1463 (array!52336 array!52338 (_ BitVec 32) (_ BitVec 32) V!29201 V!29201 (_ BitVec 64)) Unit!30422)

(assert (=> d!110285 (= lt!403569 (choose!1463 (_keys!10000 thiss!1181) (_values!5301 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5010 thiss!1181) (zeroValue!5114 thiss!1181) (minValue!5114 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110285 (validMask!0 (mask!25841 thiss!1181))))

(assert (=> d!110285 (= (lemmaSeekEntryGivesInRangeIndex!61 (_keys!10000 thiss!1181) (_values!5301 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5010 thiss!1181) (zeroValue!5114 thiss!1181) (minValue!5114 thiss!1181) key!785) lt!403569)))

(declare-fun b!893234 () Bool)

(assert (=> b!893234 (= e!498825 (inRange!0 (index!37820 lt!403570) (mask!25841 thiss!1181)))))

(assert (= (and d!110285 (not res!604961)) b!893234))

(assert (=> d!110285 m!831311))

(declare-fun m!831347 () Bool)

(assert (=> d!110285 m!831347))

(declare-fun m!831349 () Bool)

(assert (=> d!110285 m!831349))

(declare-fun m!831351 () Bool)

(assert (=> b!893234 m!831351))

(assert (=> b!893196 d!110285))

(declare-fun b!893247 () Bool)

(declare-fun e!498834 () SeekEntryResult!8862)

(declare-fun lt!403581 () SeekEntryResult!8862)

(assert (=> b!893247 (= e!498834 (ite ((_ is MissingVacant!8862) lt!403581) (MissingZero!8862 (index!37822 lt!403581)) lt!403581))))

(declare-fun lt!403579 () SeekEntryResult!8862)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52336 (_ BitVec 32)) SeekEntryResult!8862)

(assert (=> b!893247 (= lt!403581 (seekKeyOrZeroReturnVacant!0 (x!75930 lt!403579) (index!37821 lt!403579) (index!37821 lt!403579) key!785 (_keys!10000 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun b!893248 () Bool)

(assert (=> b!893248 (= e!498834 (MissingZero!8862 (index!37821 lt!403579)))))

(declare-fun b!893249 () Bool)

(declare-fun e!498832 () SeekEntryResult!8862)

(assert (=> b!893249 (= e!498832 (Found!8862 (index!37821 lt!403579)))))

(declare-fun b!893250 () Bool)

(declare-fun e!498833 () SeekEntryResult!8862)

(assert (=> b!893250 (= e!498833 e!498832)))

(declare-fun lt!403582 () (_ BitVec 64))

(assert (=> b!893250 (= lt!403582 (select (arr!25173 (_keys!10000 thiss!1181)) (index!37821 lt!403579)))))

(declare-fun c!94066 () Bool)

(assert (=> b!893250 (= c!94066 (= lt!403582 key!785))))

(declare-fun b!893251 () Bool)

(assert (=> b!893251 (= e!498833 Undefined!8862)))

(declare-fun b!893252 () Bool)

(declare-fun c!94068 () Bool)

(assert (=> b!893252 (= c!94068 (= lt!403582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!893252 (= e!498832 e!498834)))

(declare-fun d!110287 () Bool)

(declare-fun lt!403580 () SeekEntryResult!8862)

(assert (=> d!110287 (and (or ((_ is MissingVacant!8862) lt!403580) (not ((_ is Found!8862) lt!403580)) (and (bvsge (index!37820 lt!403580) #b00000000000000000000000000000000) (bvslt (index!37820 lt!403580) (size!25617 (_keys!10000 thiss!1181))))) (not ((_ is MissingVacant!8862) lt!403580)) (or (not ((_ is Found!8862) lt!403580)) (= (select (arr!25173 (_keys!10000 thiss!1181)) (index!37820 lt!403580)) key!785)))))

(assert (=> d!110287 (= lt!403580 e!498833)))

(declare-fun c!94067 () Bool)

(assert (=> d!110287 (= c!94067 (and ((_ is Intermediate!8862) lt!403579) (undefined!9674 lt!403579)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52336 (_ BitVec 32)) SeekEntryResult!8862)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110287 (= lt!403579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25841 thiss!1181)) key!785 (_keys!10000 thiss!1181) (mask!25841 thiss!1181)))))

(assert (=> d!110287 (validMask!0 (mask!25841 thiss!1181))))

(assert (=> d!110287 (= (seekEntry!0 key!785 (_keys!10000 thiss!1181) (mask!25841 thiss!1181)) lt!403580)))

(assert (= (and d!110287 c!94067) b!893251))

(assert (= (and d!110287 (not c!94067)) b!893250))

(assert (= (and b!893250 c!94066) b!893249))

(assert (= (and b!893250 (not c!94066)) b!893252))

(assert (= (and b!893252 c!94068) b!893248))

(assert (= (and b!893252 (not c!94068)) b!893247))

(declare-fun m!831353 () Bool)

(assert (=> b!893247 m!831353))

(declare-fun m!831355 () Bool)

(assert (=> b!893250 m!831355))

(declare-fun m!831357 () Bool)

(assert (=> d!110287 m!831357))

(declare-fun m!831359 () Bool)

(assert (=> d!110287 m!831359))

(assert (=> d!110287 m!831359))

(declare-fun m!831361 () Bool)

(assert (=> d!110287 m!831361))

(assert (=> d!110287 m!831349))

(assert (=> b!893196 d!110287))

(declare-fun d!110289 () Bool)

(declare-fun isEmpty!679 (Option!453) Bool)

(assert (=> d!110289 (= (isDefined!326 (getValueByKey!447 (toList!5371 (map!12212 thiss!1181)) key!785)) (not (isEmpty!679 (getValueByKey!447 (toList!5371 (map!12212 thiss!1181)) key!785))))))

(declare-fun bs!25068 () Bool)

(assert (= bs!25068 d!110289))

(assert (=> bs!25068 m!831305))

(declare-fun m!831363 () Bool)

(assert (=> bs!25068 m!831363))

(assert (=> b!893201 d!110289))

(declare-fun d!110291 () Bool)

(declare-fun c!94073 () Bool)

(assert (=> d!110291 (= c!94073 (and ((_ is Cons!17791) (toList!5371 (map!12212 thiss!1181))) (= (_1!6018 (h!18922 (toList!5371 (map!12212 thiss!1181)))) key!785)))))

(declare-fun e!498839 () Option!453)

(assert (=> d!110291 (= (getValueByKey!447 (toList!5371 (map!12212 thiss!1181)) key!785) e!498839)))

(declare-fun b!893263 () Bool)

(declare-fun e!498840 () Option!453)

(assert (=> b!893263 (= e!498840 (getValueByKey!447 (t!25112 (toList!5371 (map!12212 thiss!1181))) key!785))))

(declare-fun b!893262 () Bool)

(assert (=> b!893262 (= e!498839 e!498840)))

(declare-fun c!94074 () Bool)

(assert (=> b!893262 (= c!94074 (and ((_ is Cons!17791) (toList!5371 (map!12212 thiss!1181))) (not (= (_1!6018 (h!18922 (toList!5371 (map!12212 thiss!1181)))) key!785))))))

(declare-fun b!893264 () Bool)

(assert (=> b!893264 (= e!498840 None!451)))

(declare-fun b!893261 () Bool)

(assert (=> b!893261 (= e!498839 (Some!452 (_2!6018 (h!18922 (toList!5371 (map!12212 thiss!1181))))))))

(assert (= (and d!110291 c!94073) b!893261))

(assert (= (and d!110291 (not c!94073)) b!893262))

(assert (= (and b!893262 c!94074) b!893263))

(assert (= (and b!893262 (not c!94074)) b!893264))

(declare-fun m!831365 () Bool)

(assert (=> b!893263 m!831365))

(assert (=> b!893201 d!110291))

(declare-fun d!110293 () Bool)

(declare-fun getCurrentListMap!2649 (array!52336 array!52338 (_ BitVec 32) (_ BitVec 32) V!29201 V!29201 (_ BitVec 32) Int) ListLongMap!10711)

(assert (=> d!110293 (= (map!12212 thiss!1181) (getCurrentListMap!2649 (_keys!10000 thiss!1181) (_values!5301 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5010 thiss!1181) (zeroValue!5114 thiss!1181) (minValue!5114 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5315 thiss!1181)))))

(declare-fun bs!25069 () Bool)

(assert (= bs!25069 d!110293))

(declare-fun m!831367 () Bool)

(assert (=> bs!25069 m!831367))

(assert (=> b!893201 d!110293))

(declare-fun d!110295 () Bool)

(assert (=> d!110295 (= (inRange!0 (index!37820 lt!403558) (mask!25841 thiss!1181)) (and (bvsge (index!37820 lt!403558) #b00000000000000000000000000000000) (bvslt (index!37820 lt!403558) (bvadd (mask!25841 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!893198 d!110295))

(declare-fun d!110297 () Bool)

(declare-fun res!604968 () Bool)

(declare-fun e!498843 () Bool)

(assert (=> d!110297 (=> (not res!604968) (not e!498843))))

(declare-fun simpleValid!296 (LongMapFixedSize!4230) Bool)

(assert (=> d!110297 (= res!604968 (simpleValid!296 thiss!1181))))

(assert (=> d!110297 (= (valid!1635 thiss!1181) e!498843)))

(declare-fun b!893271 () Bool)

(declare-fun res!604969 () Bool)

(assert (=> b!893271 (=> (not res!604969) (not e!498843))))

(declare-fun arrayCountValidKeys!0 (array!52336 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893271 (= res!604969 (= (arrayCountValidKeys!0 (_keys!10000 thiss!1181) #b00000000000000000000000000000000 (size!25617 (_keys!10000 thiss!1181))) (_size!2170 thiss!1181)))))

(declare-fun b!893272 () Bool)

(declare-fun res!604970 () Bool)

(assert (=> b!893272 (=> (not res!604970) (not e!498843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52336 (_ BitVec 32)) Bool)

(assert (=> b!893272 (= res!604970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10000 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun b!893273 () Bool)

(declare-datatypes ((List!17796 0))(
  ( (Nil!17793) (Cons!17792 (h!18923 (_ BitVec 64)) (t!25113 List!17796)) )
))
(declare-fun arrayNoDuplicates!0 (array!52336 (_ BitVec 32) List!17796) Bool)

(assert (=> b!893273 (= e!498843 (arrayNoDuplicates!0 (_keys!10000 thiss!1181) #b00000000000000000000000000000000 Nil!17793))))

(assert (= (and d!110297 res!604968) b!893271))

(assert (= (and b!893271 res!604969) b!893272))

(assert (= (and b!893272 res!604970) b!893273))

(declare-fun m!831369 () Bool)

(assert (=> d!110297 m!831369))

(declare-fun m!831371 () Bool)

(assert (=> b!893271 m!831371))

(declare-fun m!831373 () Bool)

(assert (=> b!893272 m!831373))

(declare-fun m!831375 () Bool)

(assert (=> b!893273 m!831375))

(assert (=> start!75914 d!110297))

(declare-fun b!893294 () Bool)

(declare-fun e!498857 () Bool)

(assert (=> b!893294 (= e!498857 (not (= (bvand (extraKeys!5010 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!893295 () Bool)

(declare-fun e!498854 () Unit!30422)

(declare-fun Unit!30424 () Unit!30422)

(assert (=> b!893295 (= e!498854 Unit!30424)))

(declare-fun b!893296 () Bool)

(declare-fun e!498856 () Bool)

(assert (=> b!893296 (= e!498856 true)))

(declare-fun lt!403627 () SeekEntryResult!8862)

(declare-fun lt!403624 () Unit!30422)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52336 (_ BitVec 64) (_ BitVec 32)) Unit!30422)

(assert (=> b!893296 (= lt!403624 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10000 thiss!1181) key!785 (index!37820 lt!403627)))))

(declare-fun call!39614 () Bool)

(assert (=> b!893296 call!39614))

(declare-fun lt!403618 () Unit!30422)

(assert (=> b!893296 (= lt!403618 lt!403624)))

(declare-fun lt!403625 () Unit!30422)

(declare-fun lemmaValidKeyInArrayIsInListMap!238 (array!52336 array!52338 (_ BitVec 32) (_ BitVec 32) V!29201 V!29201 (_ BitVec 32) Int) Unit!30422)

(assert (=> b!893296 (= lt!403625 (lemmaValidKeyInArrayIsInListMap!238 (_keys!10000 thiss!1181) (_values!5301 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5010 thiss!1181) (zeroValue!5114 thiss!1181) (minValue!5114 thiss!1181) (index!37820 lt!403627) (defaultEntry!5315 thiss!1181)))))

(declare-fun call!39615 () Bool)

(assert (=> b!893296 call!39615))

(declare-fun lt!403616 () Unit!30422)

(assert (=> b!893296 (= lt!403616 lt!403625)))

(declare-fun b!893297 () Bool)

(declare-fun c!94086 () Bool)

(assert (=> b!893297 (= c!94086 ((_ is Found!8862) lt!403627))))

(assert (=> b!893297 (= lt!403627 (seekEntry!0 key!785 (_keys!10000 thiss!1181) (mask!25841 thiss!1181)))))

(assert (=> b!893297 (= e!498857 e!498856)))

(declare-fun b!893298 () Bool)

(declare-fun e!498858 () Bool)

(assert (=> b!893298 (= e!498858 call!39614)))

(declare-fun b!893299 () Bool)

(assert (=> b!893299 (= e!498856 false)))

(declare-fun c!94085 () Bool)

(assert (=> b!893299 (= c!94085 call!39615)))

(declare-fun lt!403619 () Unit!30422)

(assert (=> b!893299 (= lt!403619 e!498854)))

(declare-fun b!893300 () Bool)

(declare-fun e!498855 () Bool)

(assert (=> b!893300 (= e!498855 e!498857)))

(declare-fun c!94087 () Bool)

(assert (=> b!893300 (= c!94087 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893301 () Bool)

(assert (=> b!893301 (= e!498858 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5010 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5010 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!110299 () Bool)

(declare-fun lt!403621 () Bool)

(declare-fun contains!4380 (ListLongMap!10711 (_ BitVec 64)) Bool)

(assert (=> d!110299 (= lt!403621 (contains!4380 (map!12212 thiss!1181) key!785))))

(assert (=> d!110299 (= lt!403621 e!498855)))

(declare-fun c!94088 () Bool)

(assert (=> d!110299 (= c!94088 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110299 (valid!1635 thiss!1181)))

(assert (=> d!110299 (= (contains!4379 thiss!1181 key!785) lt!403621)))

(declare-fun b!893302 () Bool)

(assert (=> b!893302 (= e!498855 (not (= (bvand (extraKeys!5010 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39610 () Bool)

(declare-fun arrayContainsKey!0 (array!52336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39610 (= call!39614 (arrayContainsKey!0 (_keys!10000 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun call!39613 () ListLongMap!10711)

(declare-fun bm!39611 () Bool)

(assert (=> bm!39611 (= call!39615 (contains!4380 call!39613 (ite c!94086 (select (arr!25173 (_keys!10000 thiss!1181)) (index!37820 lt!403627)) key!785)))))

(declare-fun bm!39612 () Bool)

(assert (=> bm!39612 (= call!39613 (getCurrentListMap!2649 (_keys!10000 thiss!1181) (_values!5301 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5010 thiss!1181) (zeroValue!5114 thiss!1181) (minValue!5114 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5315 thiss!1181)))))

(declare-fun b!893303 () Bool)

(assert (=> b!893303 false))

(declare-fun lt!403617 () Unit!30422)

(declare-fun lt!403620 () Unit!30422)

(assert (=> b!893303 (= lt!403617 lt!403620)))

(declare-fun lt!403623 () SeekEntryResult!8862)

(declare-fun lt!403615 () (_ BitVec 32))

(assert (=> b!893303 (and ((_ is Found!8862) lt!403623) (= (index!37820 lt!403623) lt!403615))))

(assert (=> b!893303 (= lt!403623 (seekEntry!0 key!785 (_keys!10000 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52336 (_ BitVec 32)) Unit!30422)

(assert (=> b!893303 (= lt!403620 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403615 (_keys!10000 thiss!1181) (mask!25841 thiss!1181)))))

(declare-fun lt!403613 () Unit!30422)

(declare-fun lt!403614 () Unit!30422)

(assert (=> b!893303 (= lt!403613 lt!403614)))

(assert (=> b!893303 (arrayForallSeekEntryOrOpenFound!0 lt!403615 (_keys!10000 thiss!1181) (mask!25841 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52336 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30422)

(assert (=> b!893303 (= lt!403614 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10000 thiss!1181) (mask!25841 thiss!1181) #b00000000000000000000000000000000 lt!403615))))

(declare-fun arrayScanForKey!0 (array!52336 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893303 (= lt!403615 (arrayScanForKey!0 (_keys!10000 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!403622 () Unit!30422)

(declare-fun lt!403626 () Unit!30422)

(assert (=> b!893303 (= lt!403622 lt!403626)))

(assert (=> b!893303 e!498858))

(declare-fun c!94089 () Bool)

(assert (=> b!893303 (= c!94089 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!161 (array!52336 array!52338 (_ BitVec 32) (_ BitVec 32) V!29201 V!29201 (_ BitVec 64) Int) Unit!30422)

(assert (=> b!893303 (= lt!403626 (lemmaKeyInListMapIsInArray!161 (_keys!10000 thiss!1181) (_values!5301 thiss!1181) (mask!25841 thiss!1181) (extraKeys!5010 thiss!1181) (zeroValue!5114 thiss!1181) (minValue!5114 thiss!1181) key!785 (defaultEntry!5315 thiss!1181)))))

(declare-fun Unit!30425 () Unit!30422)

(assert (=> b!893303 (= e!498854 Unit!30425)))

(assert (= (and d!110299 c!94088) b!893302))

(assert (= (and d!110299 (not c!94088)) b!893300))

(assert (= (and b!893300 c!94087) b!893294))

(assert (= (and b!893300 (not c!94087)) b!893297))

(assert (= (and b!893297 c!94086) b!893296))

(assert (= (and b!893297 (not c!94086)) b!893299))

(assert (= (and b!893299 c!94085) b!893303))

(assert (= (and b!893299 (not c!94085)) b!893295))

(assert (= (and b!893303 c!94089) b!893298))

(assert (= (and b!893303 (not c!94089)) b!893301))

(assert (= (or b!893296 b!893298) bm!39610))

(assert (= (or b!893296 b!893299) bm!39612))

(assert (= (or b!893296 b!893299) bm!39611))

(declare-fun m!831377 () Bool)

(assert (=> b!893296 m!831377))

(declare-fun m!831379 () Bool)

(assert (=> b!893296 m!831379))

(assert (=> bm!39612 m!831367))

(declare-fun m!831381 () Bool)

(assert (=> bm!39610 m!831381))

(declare-fun m!831383 () Bool)

(assert (=> bm!39611 m!831383))

(declare-fun m!831385 () Bool)

(assert (=> bm!39611 m!831385))

(declare-fun m!831387 () Bool)

(assert (=> b!893303 m!831387))

(assert (=> b!893303 m!831311))

(declare-fun m!831389 () Bool)

(assert (=> b!893303 m!831389))

(declare-fun m!831391 () Bool)

(assert (=> b!893303 m!831391))

(declare-fun m!831393 () Bool)

(assert (=> b!893303 m!831393))

(declare-fun m!831395 () Bool)

(assert (=> b!893303 m!831395))

(assert (=> b!893297 m!831311))

(assert (=> d!110299 m!831303))

(assert (=> d!110299 m!831303))

(declare-fun m!831397 () Bool)

(assert (=> d!110299 m!831397))

(assert (=> d!110299 m!831319))

(assert (=> b!893202 d!110299))

(declare-fun b!893310 () Bool)

(declare-fun e!498863 () Bool)

(assert (=> b!893310 (= e!498863 tp_is_empty!18177)))

(declare-fun b!893311 () Bool)

(declare-fun e!498864 () Bool)

(assert (=> b!893311 (= e!498864 tp_is_empty!18177)))

(declare-fun condMapEmpty!28829 () Bool)

(declare-fun mapDefault!28829 () ValueCell!8607)

(assert (=> mapNonEmpty!28823 (= condMapEmpty!28829 (= mapRest!28823 ((as const (Array (_ BitVec 32) ValueCell!8607)) mapDefault!28829)))))

(declare-fun mapRes!28829 () Bool)

(assert (=> mapNonEmpty!28823 (= tp!55519 (and e!498864 mapRes!28829))))

(declare-fun mapIsEmpty!28829 () Bool)

(assert (=> mapIsEmpty!28829 mapRes!28829))

(declare-fun mapNonEmpty!28829 () Bool)

(declare-fun tp!55528 () Bool)

(assert (=> mapNonEmpty!28829 (= mapRes!28829 (and tp!55528 e!498863))))

(declare-fun mapKey!28829 () (_ BitVec 32))

(declare-fun mapValue!28829 () ValueCell!8607)

(declare-fun mapRest!28829 () (Array (_ BitVec 32) ValueCell!8607))

(assert (=> mapNonEmpty!28829 (= mapRest!28823 (store mapRest!28829 mapKey!28829 mapValue!28829))))

(assert (= (and mapNonEmpty!28823 condMapEmpty!28829) mapIsEmpty!28829))

(assert (= (and mapNonEmpty!28823 (not condMapEmpty!28829)) mapNonEmpty!28829))

(assert (= (and mapNonEmpty!28829 ((_ is ValueCellFull!8607) mapValue!28829)) b!893310))

(assert (= (and mapNonEmpty!28823 ((_ is ValueCellFull!8607) mapDefault!28829)) b!893311))

(declare-fun m!831399 () Bool)

(assert (=> mapNonEmpty!28829 m!831399))

(check-sat (not d!110293) (not b!893273) (not b!893272) (not b!893271) (not bm!39610) (not d!110297) (not b!893296) (not b!893297) (not mapNonEmpty!28829) (not d!110285) tp_is_empty!18177 (not b_next!15849) (not b!893303) (not b!893247) (not d!110299) b_and!26111 (not d!110289) (not bm!39611) (not b!893263) (not bm!39612) (not b!893234) (not d!110287))
(check-sat b_and!26111 (not b_next!15849))
