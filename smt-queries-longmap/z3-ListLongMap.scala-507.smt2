; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12138 () Bool)

(assert start!12138)

(declare-fun b!102215 () Bool)

(declare-fun b_free!2473 () Bool)

(declare-fun b_next!2473 () Bool)

(assert (=> b!102215 (= b_free!2473 (not b_next!2473))))

(declare-fun tp!9732 () Bool)

(declare-fun b_and!6289 () Bool)

(assert (=> b!102215 (= tp!9732 b_and!6289)))

(declare-fun b!102231 () Bool)

(declare-fun b_free!2475 () Bool)

(declare-fun b_next!2475 () Bool)

(assert (=> b!102231 (= b_free!2475 (not b_next!2475))))

(declare-fun tp!9729 () Bool)

(declare-fun b_and!6291 () Bool)

(assert (=> b!102231 (= tp!9729 b_and!6291)))

(declare-fun mapIsEmpty!3839 () Bool)

(declare-fun mapRes!3840 () Bool)

(assert (=> mapIsEmpty!3839 mapRes!3840))

(declare-fun b!102216 () Bool)

(declare-datatypes ((Unit!3101 0))(
  ( (Unit!3102) )
))
(declare-fun e!66519 () Unit!3101)

(declare-fun Unit!3103 () Unit!3101)

(assert (=> b!102216 (= e!66519 Unit!3103)))

(declare-fun lt!51973 () Unit!3101)

(declare-datatypes ((V!3185 0))(
  ( (V!3186 (val!1371 Int)) )
))
(declare-datatypes ((array!4279 0))(
  ( (array!4280 (arr!2030 (Array (_ BitVec 32) (_ BitVec 64))) (size!2284 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!983 0))(
  ( (ValueCellFull!983 (v!2856 V!3185)) (EmptyCell!983) )
))
(declare-datatypes ((array!4281 0))(
  ( (array!4282 (arr!2031 (Array (_ BitVec 32) ValueCell!983)) (size!2285 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!874 0))(
  ( (LongMapFixedSize!875 (defaultEntry!2548 Int) (mask!6677 (_ BitVec 32)) (extraKeys!2357 (_ BitVec 32)) (zeroValue!2425 V!3185) (minValue!2425 V!3185) (_size!486 (_ BitVec 32)) (_keys!4250 array!4279) (_values!2531 array!4281) (_vacant!486 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!678 0))(
  ( (Cell!679 (v!2857 LongMapFixedSize!874)) )
))
(declare-datatypes ((LongMap!678 0))(
  ( (LongMap!679 (underlying!350 Cell!678)) )
))
(declare-fun thiss!992 () LongMap!678)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!92 (array!4279 array!4281 (_ BitVec 32) (_ BitVec 32) V!3185 V!3185 (_ BitVec 64) (_ BitVec 32) Int) Unit!3101)

(assert (=> b!102216 (= lt!51973 (lemmaListMapContainsThenArrayContainsFrom!92 (_keys!4250 (v!2857 (underlying!350 thiss!992))) (_values!2531 (v!2857 (underlying!350 thiss!992))) (mask!6677 (v!2857 (underlying!350 thiss!992))) (extraKeys!2357 (v!2857 (underlying!350 thiss!992))) (zeroValue!2425 (v!2857 (underlying!350 thiss!992))) (minValue!2425 (v!2857 (underlying!350 thiss!992))) (select (arr!2030 (_keys!4250 (v!2857 (underlying!350 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2548 (v!2857 (underlying!350 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!102216 (arrayContainsKey!0 (_keys!4250 (v!2857 (underlying!350 thiss!992))) (select (arr!2030 (_keys!4250 (v!2857 (underlying!350 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!51971 () Unit!3101)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4279 (_ BitVec 32) (_ BitVec 32)) Unit!3101)

(assert (=> b!102216 (= lt!51971 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4250 (v!2857 (underlying!350 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1578 0))(
  ( (Nil!1575) (Cons!1574 (h!2170 (_ BitVec 64)) (t!5596 List!1578)) )
))
(declare-fun arrayNoDuplicates!0 (array!4279 (_ BitVec 32) List!1578) Bool)

(assert (=> b!102216 (arrayNoDuplicates!0 (_keys!4250 (v!2857 (underlying!350 thiss!992))) from!355 Nil!1575)))

(declare-fun lt!51975 () Unit!3101)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4279 (_ BitVec 32) (_ BitVec 64) List!1578) Unit!3101)

(assert (=> b!102216 (= lt!51975 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4250 (v!2857 (underlying!350 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2030 (_keys!4250 (v!2857 (underlying!350 thiss!992)))) from!355) (Cons!1574 (select (arr!2030 (_keys!4250 (v!2857 (underlying!350 thiss!992)))) from!355) Nil!1575)))))

(assert (=> b!102216 false))

(declare-fun b!102217 () Bool)

(declare-fun e!66517 () Bool)

(declare-fun tp_is_empty!2653 () Bool)

(assert (=> b!102217 (= e!66517 tp_is_empty!2653)))

(declare-fun b!102218 () Bool)

(declare-fun res!51166 () Bool)

(declare-fun e!66527 () Bool)

(assert (=> b!102218 (=> (not res!51166) (not e!66527))))

(declare-fun newMap!16 () LongMapFixedSize!874)

(assert (=> b!102218 (= res!51166 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6677 newMap!16)) (_size!486 (v!2857 (underlying!350 thiss!992)))))))

(declare-fun b!102219 () Bool)

(declare-fun res!51165 () Bool)

(assert (=> b!102219 (=> (not res!51165) (not e!66527))))

(assert (=> b!102219 (= res!51165 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2284 (_keys!4250 (v!2857 (underlying!350 thiss!992)))))))))

(declare-fun b!102220 () Bool)

(declare-fun e!66531 () Bool)

(declare-fun e!66522 () Bool)

(assert (=> b!102220 (= e!66531 e!66522)))

(declare-fun res!51169 () Bool)

(assert (=> b!102220 (=> (not res!51169) (not e!66522))))

(declare-datatypes ((tuple2!2326 0))(
  ( (tuple2!2327 (_1!1174 Bool) (_2!1174 LongMapFixedSize!874)) )
))
(declare-fun lt!51974 () tuple2!2326)

(assert (=> b!102220 (= res!51169 (and (_1!1174 lt!51974) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!51970 () Unit!3101)

(assert (=> b!102220 (= lt!51970 e!66519)))

(declare-fun c!17620 () Bool)

(declare-datatypes ((tuple2!2328 0))(
  ( (tuple2!2329 (_1!1175 (_ BitVec 64)) (_2!1175 V!3185)) )
))
(declare-datatypes ((List!1579 0))(
  ( (Nil!1576) (Cons!1575 (h!2171 tuple2!2328) (t!5597 List!1579)) )
))
(declare-datatypes ((ListLongMap!1513 0))(
  ( (ListLongMap!1514 (toList!772 List!1579)) )
))
(declare-fun lt!51976 () ListLongMap!1513)

(declare-fun contains!803 (ListLongMap!1513 (_ BitVec 64)) Bool)

(assert (=> b!102220 (= c!17620 (contains!803 lt!51976 (select (arr!2030 (_keys!4250 (v!2857 (underlying!350 thiss!992)))) from!355)))))

(declare-fun update!152 (LongMapFixedSize!874 (_ BitVec 64) V!3185) tuple2!2326)

(declare-fun get!1315 (ValueCell!983 V!3185) V!3185)

(declare-fun dynLambda!377 (Int (_ BitVec 64)) V!3185)

(assert (=> b!102220 (= lt!51974 (update!152 newMap!16 (select (arr!2030 (_keys!4250 (v!2857 (underlying!350 thiss!992)))) from!355) (get!1315 (select (arr!2031 (_values!2531 (v!2857 (underlying!350 thiss!992)))) from!355) (dynLambda!377 (defaultEntry!2548 (v!2857 (underlying!350 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!102221 () Bool)

(declare-fun e!66526 () Bool)

(assert (=> b!102221 (= e!66526 tp_is_empty!2653)))

(declare-fun mapNonEmpty!3839 () Bool)

(declare-fun mapRes!3839 () Bool)

(declare-fun tp!9730 () Bool)

(declare-fun e!66532 () Bool)

(assert (=> mapNonEmpty!3839 (= mapRes!3839 (and tp!9730 e!66532))))

(declare-fun mapKey!3839 () (_ BitVec 32))

(declare-fun mapRest!3839 () (Array (_ BitVec 32) ValueCell!983))

(declare-fun mapValue!3839 () ValueCell!983)

(assert (=> mapNonEmpty!3839 (= (arr!2031 (_values!2531 newMap!16)) (store mapRest!3839 mapKey!3839 mapValue!3839))))

(declare-fun b!102222 () Bool)

(declare-fun e!66529 () Bool)

(declare-fun e!66523 () Bool)

(assert (=> b!102222 (= e!66529 e!66523)))

(declare-fun b!102223 () Bool)

(declare-fun e!66530 () Bool)

(assert (=> b!102223 (= e!66530 tp_is_empty!2653)))

(declare-fun b!102224 () Bool)

(declare-fun res!51167 () Bool)

(assert (=> b!102224 (=> (not res!51167) (not e!66522))))

(assert (=> b!102224 (= res!51167 (and (= (size!2285 (_values!2531 (v!2857 (underlying!350 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6677 (v!2857 (underlying!350 thiss!992))))) (= (size!2284 (_keys!4250 (v!2857 (underlying!350 thiss!992)))) (size!2285 (_values!2531 (v!2857 (underlying!350 thiss!992))))) (bvsge (mask!6677 (v!2857 (underlying!350 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2357 (v!2857 (underlying!350 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2357 (v!2857 (underlying!350 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!102225 () Bool)

(declare-fun e!66528 () Bool)

(assert (=> b!102225 (= e!66528 (and e!66530 mapRes!3840))))

(declare-fun condMapEmpty!3840 () Bool)

(declare-fun mapDefault!3840 () ValueCell!983)

(assert (=> b!102225 (= condMapEmpty!3840 (= (arr!2031 (_values!2531 (v!2857 (underlying!350 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!983)) mapDefault!3840)))))

(declare-fun mapNonEmpty!3840 () Bool)

(declare-fun tp!9731 () Bool)

(assert (=> mapNonEmpty!3840 (= mapRes!3840 (and tp!9731 e!66517))))

(declare-fun mapRest!3840 () (Array (_ BitVec 32) ValueCell!983))

(declare-fun mapKey!3840 () (_ BitVec 32))

(declare-fun mapValue!3840 () ValueCell!983)

(assert (=> mapNonEmpty!3840 (= (arr!2031 (_values!2531 (v!2857 (underlying!350 thiss!992)))) (store mapRest!3840 mapKey!3840 mapValue!3840))))

(declare-fun b!102226 () Bool)

(assert (=> b!102226 (= e!66532 tp_is_empty!2653)))

(declare-fun res!51170 () Bool)

(assert (=> start!12138 (=> (not res!51170) (not e!66527))))

(declare-fun valid!405 (LongMap!678) Bool)

(assert (=> start!12138 (= res!51170 (valid!405 thiss!992))))

(assert (=> start!12138 e!66527))

(assert (=> start!12138 e!66529))

(assert (=> start!12138 true))

(declare-fun e!66520 () Bool)

(assert (=> start!12138 e!66520))

(declare-fun e!66524 () Bool)

(declare-fun array_inv!1249 (array!4279) Bool)

(declare-fun array_inv!1250 (array!4281) Bool)

(assert (=> b!102215 (= e!66524 (and tp!9732 tp_is_empty!2653 (array_inv!1249 (_keys!4250 (v!2857 (underlying!350 thiss!992)))) (array_inv!1250 (_values!2531 (v!2857 (underlying!350 thiss!992)))) e!66528))))

(declare-fun b!102227 () Bool)

(declare-fun res!51168 () Bool)

(assert (=> b!102227 (=> (not res!51168) (not e!66527))))

(declare-fun valid!406 (LongMapFixedSize!874) Bool)

(assert (=> b!102227 (= res!51168 (valid!406 newMap!16))))

(declare-fun b!102228 () Bool)

(declare-fun res!51164 () Bool)

(assert (=> b!102228 (=> (not res!51164) (not e!66522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!102228 (= res!51164 (validMask!0 (mask!6677 (v!2857 (underlying!350 thiss!992)))))))

(declare-fun b!102229 () Bool)

(declare-fun res!51162 () Bool)

(assert (=> b!102229 (=> (not res!51162) (not e!66522))))

(assert (=> b!102229 (= res!51162 (arrayNoDuplicates!0 (_keys!4250 (v!2857 (underlying!350 thiss!992))) #b00000000000000000000000000000000 Nil!1575))))

(declare-fun b!102230 () Bool)

(assert (=> b!102230 (= e!66523 e!66524)))

(declare-fun e!66521 () Bool)

(assert (=> b!102231 (= e!66520 (and tp!9729 tp_is_empty!2653 (array_inv!1249 (_keys!4250 newMap!16)) (array_inv!1250 (_values!2531 newMap!16)) e!66521))))

(declare-fun b!102232 () Bool)

(assert (=> b!102232 (= e!66521 (and e!66526 mapRes!3839))))

(declare-fun condMapEmpty!3839 () Bool)

(declare-fun mapDefault!3839 () ValueCell!983)

(assert (=> b!102232 (= condMapEmpty!3839 (= (arr!2031 (_values!2531 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!983)) mapDefault!3839)))))

(declare-fun b!102233 () Bool)

(assert (=> b!102233 (= e!66522 (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!3840 () Bool)

(assert (=> mapIsEmpty!3840 mapRes!3839))

(declare-fun b!102234 () Bool)

(declare-fun Unit!3104 () Unit!3101)

(assert (=> b!102234 (= e!66519 Unit!3104)))

(declare-fun b!102235 () Bool)

(assert (=> b!102235 (= e!66527 e!66531)))

(declare-fun res!51161 () Bool)

(assert (=> b!102235 (=> (not res!51161) (not e!66531))))

(declare-fun lt!51972 () ListLongMap!1513)

(assert (=> b!102235 (= res!51161 (and (= lt!51972 lt!51976) (not (= (select (arr!2030 (_keys!4250 (v!2857 (underlying!350 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2030 (_keys!4250 (v!2857 (underlying!350 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1266 (LongMapFixedSize!874) ListLongMap!1513)

(assert (=> b!102235 (= lt!51976 (map!1266 newMap!16))))

(declare-fun getCurrentListMap!460 (array!4279 array!4281 (_ BitVec 32) (_ BitVec 32) V!3185 V!3185 (_ BitVec 32) Int) ListLongMap!1513)

(assert (=> b!102235 (= lt!51972 (getCurrentListMap!460 (_keys!4250 (v!2857 (underlying!350 thiss!992))) (_values!2531 (v!2857 (underlying!350 thiss!992))) (mask!6677 (v!2857 (underlying!350 thiss!992))) (extraKeys!2357 (v!2857 (underlying!350 thiss!992))) (zeroValue!2425 (v!2857 (underlying!350 thiss!992))) (minValue!2425 (v!2857 (underlying!350 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2548 (v!2857 (underlying!350 thiss!992)))))))

(declare-fun b!102236 () Bool)

(declare-fun res!51163 () Bool)

(assert (=> b!102236 (=> (not res!51163) (not e!66522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4279 (_ BitVec 32)) Bool)

(assert (=> b!102236 (= res!51163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4250 (v!2857 (underlying!350 thiss!992))) (mask!6677 (v!2857 (underlying!350 thiss!992)))))))

(assert (= (and start!12138 res!51170) b!102219))

(assert (= (and b!102219 res!51165) b!102227))

(assert (= (and b!102227 res!51168) b!102218))

(assert (= (and b!102218 res!51166) b!102235))

(assert (= (and b!102235 res!51161) b!102220))

(assert (= (and b!102220 c!17620) b!102216))

(assert (= (and b!102220 (not c!17620)) b!102234))

(assert (= (and b!102220 res!51169) b!102228))

(assert (= (and b!102228 res!51164) b!102224))

(assert (= (and b!102224 res!51167) b!102236))

(assert (= (and b!102236 res!51163) b!102229))

(assert (= (and b!102229 res!51162) b!102233))

(assert (= (and b!102225 condMapEmpty!3840) mapIsEmpty!3839))

(assert (= (and b!102225 (not condMapEmpty!3840)) mapNonEmpty!3840))

(get-info :version)

(assert (= (and mapNonEmpty!3840 ((_ is ValueCellFull!983) mapValue!3840)) b!102217))

(assert (= (and b!102225 ((_ is ValueCellFull!983) mapDefault!3840)) b!102223))

(assert (= b!102215 b!102225))

(assert (= b!102230 b!102215))

(assert (= b!102222 b!102230))

(assert (= start!12138 b!102222))

(assert (= (and b!102232 condMapEmpty!3839) mapIsEmpty!3840))

(assert (= (and b!102232 (not condMapEmpty!3839)) mapNonEmpty!3839))

(assert (= (and mapNonEmpty!3839 ((_ is ValueCellFull!983) mapValue!3839)) b!102226))

(assert (= (and b!102232 ((_ is ValueCellFull!983) mapDefault!3839)) b!102221))

(assert (= b!102231 b!102232))

(assert (= start!12138 b!102231))

(declare-fun b_lambda!4581 () Bool)

(assert (=> (not b_lambda!4581) (not b!102220)))

(declare-fun t!5593 () Bool)

(declare-fun tb!1985 () Bool)

(assert (=> (and b!102215 (= (defaultEntry!2548 (v!2857 (underlying!350 thiss!992))) (defaultEntry!2548 (v!2857 (underlying!350 thiss!992)))) t!5593) tb!1985))

(declare-fun result!3355 () Bool)

(assert (=> tb!1985 (= result!3355 tp_is_empty!2653)))

(assert (=> b!102220 t!5593))

(declare-fun b_and!6293 () Bool)

(assert (= b_and!6289 (and (=> t!5593 result!3355) b_and!6293)))

(declare-fun t!5595 () Bool)

(declare-fun tb!1987 () Bool)

(assert (=> (and b!102231 (= (defaultEntry!2548 newMap!16) (defaultEntry!2548 (v!2857 (underlying!350 thiss!992)))) t!5595) tb!1987))

(declare-fun result!3359 () Bool)

(assert (= result!3359 result!3355))

(assert (=> b!102220 t!5595))

(declare-fun b_and!6295 () Bool)

(assert (= b_and!6291 (and (=> t!5595 result!3359) b_and!6295)))

(declare-fun m!113243 () Bool)

(assert (=> b!102220 m!113243))

(declare-fun m!113245 () Bool)

(assert (=> b!102220 m!113245))

(declare-fun m!113247 () Bool)

(assert (=> b!102220 m!113247))

(declare-fun m!113249 () Bool)

(assert (=> b!102220 m!113249))

(declare-fun m!113251 () Bool)

(assert (=> b!102220 m!113251))

(assert (=> b!102220 m!113243))

(assert (=> b!102220 m!113249))

(assert (=> b!102220 m!113243))

(assert (=> b!102220 m!113251))

(declare-fun m!113253 () Bool)

(assert (=> b!102220 m!113253))

(assert (=> b!102220 m!113247))

(declare-fun m!113255 () Bool)

(assert (=> b!102229 m!113255))

(declare-fun m!113257 () Bool)

(assert (=> start!12138 m!113257))

(declare-fun m!113259 () Bool)

(assert (=> b!102236 m!113259))

(declare-fun m!113261 () Bool)

(assert (=> b!102231 m!113261))

(declare-fun m!113263 () Bool)

(assert (=> b!102231 m!113263))

(declare-fun m!113265 () Bool)

(assert (=> b!102227 m!113265))

(assert (=> b!102235 m!113243))

(declare-fun m!113267 () Bool)

(assert (=> b!102235 m!113267))

(declare-fun m!113269 () Bool)

(assert (=> b!102235 m!113269))

(declare-fun m!113271 () Bool)

(assert (=> b!102215 m!113271))

(declare-fun m!113273 () Bool)

(assert (=> b!102215 m!113273))

(declare-fun m!113275 () Bool)

(assert (=> mapNonEmpty!3840 m!113275))

(declare-fun m!113277 () Bool)

(assert (=> mapNonEmpty!3839 m!113277))

(declare-fun m!113279 () Bool)

(assert (=> b!102216 m!113279))

(declare-fun m!113281 () Bool)

(assert (=> b!102216 m!113281))

(assert (=> b!102216 m!113243))

(declare-fun m!113283 () Bool)

(assert (=> b!102216 m!113283))

(assert (=> b!102216 m!113243))

(assert (=> b!102216 m!113243))

(declare-fun m!113285 () Bool)

(assert (=> b!102216 m!113285))

(assert (=> b!102216 m!113243))

(declare-fun m!113287 () Bool)

(assert (=> b!102216 m!113287))

(declare-fun m!113289 () Bool)

(assert (=> b!102228 m!113289))

(check-sat (not b!102227) b_and!6293 (not b!102215) (not b_next!2475) (not b!102220) b_and!6295 (not b_next!2473) (not b!102228) (not b!102231) (not b!102229) (not b!102216) (not start!12138) (not b!102236) tp_is_empty!2653 (not mapNonEmpty!3840) (not b_lambda!4581) (not b!102235) (not mapNonEmpty!3839))
(check-sat b_and!6293 b_and!6295 (not b_next!2473) (not b_next!2475))
