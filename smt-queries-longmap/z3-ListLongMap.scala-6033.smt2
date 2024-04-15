; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78064 () Bool)

(assert start!78064)

(declare-fun b_free!16609 () Bool)

(declare-fun b_next!16609 () Bool)

(assert (=> start!78064 (= b_free!16609 (not b_next!16609))))

(declare-fun tp!58098 () Bool)

(declare-fun b_and!27155 () Bool)

(assert (=> start!78064 (= tp!58098 b_and!27155)))

(declare-fun b!911174 () Bool)

(declare-fun e!511006 () Bool)

(declare-fun tp_is_empty!19027 () Bool)

(assert (=> b!911174 (= e!511006 tp_is_empty!19027)))

(declare-fun b!911175 () Bool)

(declare-fun e!511005 () Bool)

(declare-fun e!511003 () Bool)

(declare-fun mapRes!30262 () Bool)

(assert (=> b!911175 (= e!511005 (and e!511003 mapRes!30262))))

(declare-fun condMapEmpty!30262 () Bool)

(declare-datatypes ((V!30335 0))(
  ( (V!30336 (val!9564 Int)) )
))
(declare-datatypes ((ValueCell!9032 0))(
  ( (ValueCellFull!9032 (v!12072 V!30335)) (EmptyCell!9032) )
))
(declare-datatypes ((array!54055 0))(
  ( (array!54056 (arr!25984 (Array (_ BitVec 32) ValueCell!9032)) (size!26445 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54055)

(declare-fun mapDefault!30262 () ValueCell!9032)

(assert (=> b!911175 (= condMapEmpty!30262 (= (arr!25984 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9032)) mapDefault!30262)))))

(declare-fun b!911176 () Bool)

(declare-fun res!614813 () Bool)

(declare-fun e!511007 () Bool)

(assert (=> b!911176 (=> (not res!614813) (not e!511007))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54057 0))(
  ( (array!54058 (arr!25985 (Array (_ BitVec 32) (_ BitVec 64))) (size!26446 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54057)

(assert (=> b!911176 (= res!614813 (and (= (size!26445 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26446 _keys!1386) (size!26445 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911178 () Bool)

(declare-fun res!614811 () Bool)

(assert (=> b!911178 (=> (not res!614811) (not e!511007))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!911178 (= res!614811 (inRange!0 i!717 mask!1756))))

(declare-fun b!911179 () Bool)

(declare-fun res!614812 () Bool)

(assert (=> b!911179 (=> (not res!614812) (not e!511007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54057 (_ BitVec 32)) Bool)

(assert (=> b!911179 (= res!614812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911180 () Bool)

(assert (=> b!911180 (= e!511003 tp_is_empty!19027)))

(declare-fun mapNonEmpty!30262 () Bool)

(declare-fun tp!58099 () Bool)

(assert (=> mapNonEmpty!30262 (= mapRes!30262 (and tp!58099 e!511006))))

(declare-fun mapRest!30262 () (Array (_ BitVec 32) ValueCell!9032))

(declare-fun mapKey!30262 () (_ BitVec 32))

(declare-fun mapValue!30262 () ValueCell!9032)

(assert (=> mapNonEmpty!30262 (= (arr!25984 _values!1152) (store mapRest!30262 mapKey!30262 mapValue!30262))))

(declare-fun b!911181 () Bool)

(assert (=> b!911181 (= e!511007 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26446 _keys!1386))))))

(declare-fun b!911177 () Bool)

(declare-fun res!614815 () Bool)

(assert (=> b!911177 (=> (not res!614815) (not e!511007))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30335)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30335)

(declare-datatypes ((tuple2!12500 0))(
  ( (tuple2!12501 (_1!6261 (_ BitVec 64)) (_2!6261 V!30335)) )
))
(declare-datatypes ((List!18282 0))(
  ( (Nil!18279) (Cons!18278 (h!19424 tuple2!12500) (t!25858 List!18282)) )
))
(declare-datatypes ((ListLongMap!11187 0))(
  ( (ListLongMap!11188 (toList!5609 List!18282)) )
))
(declare-fun contains!4610 (ListLongMap!11187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2811 (array!54057 array!54055 (_ BitVec 32) (_ BitVec 32) V!30335 V!30335 (_ BitVec 32) Int) ListLongMap!11187)

(assert (=> b!911177 (= res!614815 (contains!4610 (getCurrentListMap!2811 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!614810 () Bool)

(assert (=> start!78064 (=> (not res!614810) (not e!511007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78064 (= res!614810 (validMask!0 mask!1756))))

(assert (=> start!78064 e!511007))

(declare-fun array_inv!20374 (array!54055) Bool)

(assert (=> start!78064 (and (array_inv!20374 _values!1152) e!511005)))

(assert (=> start!78064 tp!58098))

(assert (=> start!78064 true))

(assert (=> start!78064 tp_is_empty!19027))

(declare-fun array_inv!20375 (array!54057) Bool)

(assert (=> start!78064 (array_inv!20375 _keys!1386)))

(declare-fun b!911182 () Bool)

(declare-fun res!614814 () Bool)

(assert (=> b!911182 (=> (not res!614814) (not e!511007))))

(declare-datatypes ((List!18283 0))(
  ( (Nil!18280) (Cons!18279 (h!19425 (_ BitVec 64)) (t!25859 List!18283)) )
))
(declare-fun arrayNoDuplicates!0 (array!54057 (_ BitVec 32) List!18283) Bool)

(assert (=> b!911182 (= res!614814 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18280))))

(declare-fun mapIsEmpty!30262 () Bool)

(assert (=> mapIsEmpty!30262 mapRes!30262))

(assert (= (and start!78064 res!614810) b!911176))

(assert (= (and b!911176 res!614813) b!911179))

(assert (= (and b!911179 res!614812) b!911182))

(assert (= (and b!911182 res!614814) b!911177))

(assert (= (and b!911177 res!614815) b!911178))

(assert (= (and b!911178 res!614811) b!911181))

(assert (= (and b!911175 condMapEmpty!30262) mapIsEmpty!30262))

(assert (= (and b!911175 (not condMapEmpty!30262)) mapNonEmpty!30262))

(get-info :version)

(assert (= (and mapNonEmpty!30262 ((_ is ValueCellFull!9032) mapValue!30262)) b!911174))

(assert (= (and b!911175 ((_ is ValueCellFull!9032) mapDefault!30262)) b!911180))

(assert (= start!78064 b!911175))

(declare-fun m!845419 () Bool)

(assert (=> start!78064 m!845419))

(declare-fun m!845421 () Bool)

(assert (=> start!78064 m!845421))

(declare-fun m!845423 () Bool)

(assert (=> start!78064 m!845423))

(declare-fun m!845425 () Bool)

(assert (=> b!911177 m!845425))

(assert (=> b!911177 m!845425))

(declare-fun m!845427 () Bool)

(assert (=> b!911177 m!845427))

(declare-fun m!845429 () Bool)

(assert (=> mapNonEmpty!30262 m!845429))

(declare-fun m!845431 () Bool)

(assert (=> b!911179 m!845431))

(declare-fun m!845433 () Bool)

(assert (=> b!911178 m!845433))

(declare-fun m!845435 () Bool)

(assert (=> b!911182 m!845435))

(check-sat (not mapNonEmpty!30262) (not b!911179) (not start!78064) (not b!911182) (not b_next!16609) tp_is_empty!19027 b_and!27155 (not b!911177) (not b!911178))
(check-sat b_and!27155 (not b_next!16609))
(get-model)

(declare-fun d!112043 () Bool)

(assert (=> d!112043 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78064 d!112043))

(declare-fun d!112045 () Bool)

(assert (=> d!112045 (= (array_inv!20374 _values!1152) (bvsge (size!26445 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78064 d!112045))

(declare-fun d!112047 () Bool)

(assert (=> d!112047 (= (array_inv!20375 _keys!1386) (bvsge (size!26446 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78064 d!112047))

(declare-fun d!112049 () Bool)

(declare-fun e!511043 () Bool)

(assert (=> d!112049 e!511043))

(declare-fun res!614854 () Bool)

(assert (=> d!112049 (=> res!614854 e!511043)))

(declare-fun lt!410169 () Bool)

(assert (=> d!112049 (= res!614854 (not lt!410169))))

(declare-fun lt!410166 () Bool)

(assert (=> d!112049 (= lt!410169 lt!410166)))

(declare-datatypes ((Unit!30792 0))(
  ( (Unit!30793) )
))
(declare-fun lt!410168 () Unit!30792)

(declare-fun e!511042 () Unit!30792)

(assert (=> d!112049 (= lt!410168 e!511042)))

(declare-fun c!95680 () Bool)

(assert (=> d!112049 (= c!95680 lt!410166)))

(declare-fun containsKey!439 (List!18282 (_ BitVec 64)) Bool)

(assert (=> d!112049 (= lt!410166 (containsKey!439 (toList!5609 (getCurrentListMap!2811 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112049 (= (contains!4610 (getCurrentListMap!2811 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410169)))

(declare-fun b!911243 () Bool)

(declare-fun lt!410167 () Unit!30792)

(assert (=> b!911243 (= e!511042 lt!410167)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!334 (List!18282 (_ BitVec 64)) Unit!30792)

(assert (=> b!911243 (= lt!410167 (lemmaContainsKeyImpliesGetValueByKeyDefined!334 (toList!5609 (getCurrentListMap!2811 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!481 0))(
  ( (Some!480 (v!12075 V!30335)) (None!479) )
))
(declare-fun isDefined!347 (Option!481) Bool)

(declare-fun getValueByKey!475 (List!18282 (_ BitVec 64)) Option!481)

(assert (=> b!911243 (isDefined!347 (getValueByKey!475 (toList!5609 (getCurrentListMap!2811 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!911244 () Bool)

(declare-fun Unit!30794 () Unit!30792)

(assert (=> b!911244 (= e!511042 Unit!30794)))

(declare-fun b!911245 () Bool)

(assert (=> b!911245 (= e!511043 (isDefined!347 (getValueByKey!475 (toList!5609 (getCurrentListMap!2811 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112049 c!95680) b!911243))

(assert (= (and d!112049 (not c!95680)) b!911244))

(assert (= (and d!112049 (not res!614854)) b!911245))

(declare-fun m!845473 () Bool)

(assert (=> d!112049 m!845473))

(declare-fun m!845475 () Bool)

(assert (=> b!911243 m!845475))

(declare-fun m!845477 () Bool)

(assert (=> b!911243 m!845477))

(assert (=> b!911243 m!845477))

(declare-fun m!845479 () Bool)

(assert (=> b!911243 m!845479))

(assert (=> b!911245 m!845477))

(assert (=> b!911245 m!845477))

(assert (=> b!911245 m!845479))

(assert (=> b!911177 d!112049))

(declare-fun b!911288 () Bool)

(declare-fun e!511080 () Bool)

(declare-fun e!511077 () Bool)

(assert (=> b!911288 (= e!511080 e!511077)))

(declare-fun res!614879 () Bool)

(assert (=> b!911288 (=> (not res!614879) (not e!511077))))

(declare-fun lt!410217 () ListLongMap!11187)

(assert (=> b!911288 (= res!614879 (contains!4610 lt!410217 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!911288 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26446 _keys!1386)))))

(declare-fun b!911289 () Bool)

(declare-fun e!511075 () ListLongMap!11187)

(declare-fun call!40331 () ListLongMap!11187)

(declare-fun +!2631 (ListLongMap!11187 tuple2!12500) ListLongMap!11187)

(assert (=> b!911289 (= e!511075 (+!2631 call!40331 (tuple2!12501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!911290 () Bool)

(declare-fun e!511073 () ListLongMap!11187)

(assert (=> b!911290 (= e!511075 e!511073)))

(declare-fun c!95696 () Bool)

(assert (=> b!911290 (= c!95696 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!911291 () Bool)

(declare-fun e!511070 () Bool)

(declare-fun call!40333 () Bool)

(assert (=> b!911291 (= e!511070 (not call!40333))))

(declare-fun b!911292 () Bool)

(declare-fun apply!517 (ListLongMap!11187 (_ BitVec 64)) V!30335)

(declare-fun get!13654 (ValueCell!9032 V!30335) V!30335)

(declare-fun dynLambda!1382 (Int (_ BitVec 64)) V!30335)

(assert (=> b!911292 (= e!511077 (= (apply!517 lt!410217 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)) (get!13654 (select (arr!25984 _values!1152) #b00000000000000000000000000000000) (dynLambda!1382 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!911292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26445 _values!1152)))))

(assert (=> b!911292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26446 _keys!1386)))))

(declare-fun bm!40326 () Bool)

(declare-fun call!40334 () ListLongMap!11187)

(declare-fun getCurrentListMapNoExtraKeys!3328 (array!54057 array!54055 (_ BitVec 32) (_ BitVec 32) V!30335 V!30335 (_ BitVec 32) Int) ListLongMap!11187)

(assert (=> bm!40326 (= call!40334 (getCurrentListMapNoExtraKeys!3328 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!911293 () Bool)

(declare-fun e!511079 () Bool)

(assert (=> b!911293 (= e!511079 (= (apply!517 lt!410217 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!911294 () Bool)

(declare-fun e!511076 () Bool)

(declare-fun e!511082 () Bool)

(assert (=> b!911294 (= e!511076 e!511082)))

(declare-fun res!614876 () Bool)

(declare-fun call!40335 () Bool)

(assert (=> b!911294 (= res!614876 call!40335)))

(assert (=> b!911294 (=> (not res!614876) (not e!511082))))

(declare-fun bm!40327 () Bool)

(declare-fun call!40330 () ListLongMap!11187)

(declare-fun call!40329 () ListLongMap!11187)

(assert (=> bm!40327 (= call!40330 call!40329)))

(declare-fun bm!40328 () Bool)

(declare-fun call!40332 () ListLongMap!11187)

(assert (=> bm!40328 (= call!40332 call!40331)))

(declare-fun b!911295 () Bool)

(assert (=> b!911295 (= e!511082 (= (apply!517 lt!410217 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!911296 () Bool)

(declare-fun res!614880 () Bool)

(declare-fun e!511074 () Bool)

(assert (=> b!911296 (=> (not res!614880) (not e!511074))))

(assert (=> b!911296 (= res!614880 e!511070)))

(declare-fun c!95694 () Bool)

(assert (=> b!911296 (= c!95694 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40329 () Bool)

(assert (=> bm!40329 (= call!40335 (contains!4610 lt!410217 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!911297 () Bool)

(assert (=> b!911297 (= e!511073 call!40332)))

(declare-fun bm!40330 () Bool)

(assert (=> bm!40330 (= call!40333 (contains!4610 lt!410217 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!911299 () Bool)

(declare-fun c!95695 () Bool)

(assert (=> b!911299 (= c!95695 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!511078 () ListLongMap!11187)

(assert (=> b!911299 (= e!511073 e!511078)))

(declare-fun b!911300 () Bool)

(declare-fun e!511081 () Unit!30792)

(declare-fun Unit!30795 () Unit!30792)

(assert (=> b!911300 (= e!511081 Unit!30795)))

(declare-fun b!911301 () Bool)

(declare-fun e!511071 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!911301 (= e!511071 (validKeyInArray!0 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!911302 () Bool)

(declare-fun lt!410235 () Unit!30792)

(assert (=> b!911302 (= e!511081 lt!410235)))

(declare-fun lt!410218 () ListLongMap!11187)

(assert (=> b!911302 (= lt!410218 (getCurrentListMapNoExtraKeys!3328 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410219 () (_ BitVec 64))

(assert (=> b!911302 (= lt!410219 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410215 () (_ BitVec 64))

(assert (=> b!911302 (= lt!410215 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410227 () Unit!30792)

(declare-fun addStillContains!346 (ListLongMap!11187 (_ BitVec 64) V!30335 (_ BitVec 64)) Unit!30792)

(assert (=> b!911302 (= lt!410227 (addStillContains!346 lt!410218 lt!410219 zeroValue!1094 lt!410215))))

(assert (=> b!911302 (contains!4610 (+!2631 lt!410218 (tuple2!12501 lt!410219 zeroValue!1094)) lt!410215)))

(declare-fun lt!410232 () Unit!30792)

(assert (=> b!911302 (= lt!410232 lt!410227)))

(declare-fun lt!410223 () ListLongMap!11187)

(assert (=> b!911302 (= lt!410223 (getCurrentListMapNoExtraKeys!3328 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410220 () (_ BitVec 64))

(assert (=> b!911302 (= lt!410220 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410230 () (_ BitVec 64))

(assert (=> b!911302 (= lt!410230 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410234 () Unit!30792)

(declare-fun addApplyDifferent!346 (ListLongMap!11187 (_ BitVec 64) V!30335 (_ BitVec 64)) Unit!30792)

(assert (=> b!911302 (= lt!410234 (addApplyDifferent!346 lt!410223 lt!410220 minValue!1094 lt!410230))))

(assert (=> b!911302 (= (apply!517 (+!2631 lt!410223 (tuple2!12501 lt!410220 minValue!1094)) lt!410230) (apply!517 lt!410223 lt!410230))))

(declare-fun lt!410224 () Unit!30792)

(assert (=> b!911302 (= lt!410224 lt!410234)))

(declare-fun lt!410221 () ListLongMap!11187)

(assert (=> b!911302 (= lt!410221 (getCurrentListMapNoExtraKeys!3328 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410216 () (_ BitVec 64))

(assert (=> b!911302 (= lt!410216 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410214 () (_ BitVec 64))

(assert (=> b!911302 (= lt!410214 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410228 () Unit!30792)

(assert (=> b!911302 (= lt!410228 (addApplyDifferent!346 lt!410221 lt!410216 zeroValue!1094 lt!410214))))

(assert (=> b!911302 (= (apply!517 (+!2631 lt!410221 (tuple2!12501 lt!410216 zeroValue!1094)) lt!410214) (apply!517 lt!410221 lt!410214))))

(declare-fun lt!410229 () Unit!30792)

(assert (=> b!911302 (= lt!410229 lt!410228)))

(declare-fun lt!410225 () ListLongMap!11187)

(assert (=> b!911302 (= lt!410225 (getCurrentListMapNoExtraKeys!3328 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410226 () (_ BitVec 64))

(assert (=> b!911302 (= lt!410226 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410222 () (_ BitVec 64))

(assert (=> b!911302 (= lt!410222 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!911302 (= lt!410235 (addApplyDifferent!346 lt!410225 lt!410226 minValue!1094 lt!410222))))

(assert (=> b!911302 (= (apply!517 (+!2631 lt!410225 (tuple2!12501 lt!410226 minValue!1094)) lt!410222) (apply!517 lt!410225 lt!410222))))

(declare-fun bm!40331 () Bool)

(declare-fun c!95693 () Bool)

(assert (=> bm!40331 (= call!40331 (+!2631 (ite c!95693 call!40334 (ite c!95696 call!40329 call!40330)) (ite (or c!95693 c!95696) (tuple2!12501 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!911303 () Bool)

(assert (=> b!911303 (= e!511078 call!40332)))

(declare-fun bm!40332 () Bool)

(assert (=> bm!40332 (= call!40329 call!40334)))

(declare-fun b!911304 () Bool)

(assert (=> b!911304 (= e!511078 call!40330)))

(declare-fun b!911305 () Bool)

(assert (=> b!911305 (= e!511070 e!511079)))

(declare-fun res!614877 () Bool)

(assert (=> b!911305 (= res!614877 call!40333)))

(assert (=> b!911305 (=> (not res!614877) (not e!511079))))

(declare-fun b!911306 () Bool)

(declare-fun res!614873 () Bool)

(assert (=> b!911306 (=> (not res!614873) (not e!511074))))

(assert (=> b!911306 (= res!614873 e!511080)))

(declare-fun res!614878 () Bool)

(assert (=> b!911306 (=> res!614878 e!511080)))

(assert (=> b!911306 (= res!614878 (not e!511071))))

(declare-fun res!614875 () Bool)

(assert (=> b!911306 (=> (not res!614875) (not e!511071))))

(assert (=> b!911306 (= res!614875 (bvslt #b00000000000000000000000000000000 (size!26446 _keys!1386)))))

(declare-fun b!911307 () Bool)

(assert (=> b!911307 (= e!511076 (not call!40335))))

(declare-fun b!911308 () Bool)

(assert (=> b!911308 (= e!511074 e!511076)))

(declare-fun c!95698 () Bool)

(assert (=> b!911308 (= c!95698 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!112051 () Bool)

(assert (=> d!112051 e!511074))

(declare-fun res!614881 () Bool)

(assert (=> d!112051 (=> (not res!614881) (not e!511074))))

(assert (=> d!112051 (= res!614881 (or (bvsge #b00000000000000000000000000000000 (size!26446 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26446 _keys!1386)))))))

(declare-fun lt!410231 () ListLongMap!11187)

(assert (=> d!112051 (= lt!410217 lt!410231)))

(declare-fun lt!410233 () Unit!30792)

(assert (=> d!112051 (= lt!410233 e!511081)))

(declare-fun c!95697 () Bool)

(declare-fun e!511072 () Bool)

(assert (=> d!112051 (= c!95697 e!511072)))

(declare-fun res!614874 () Bool)

(assert (=> d!112051 (=> (not res!614874) (not e!511072))))

(assert (=> d!112051 (= res!614874 (bvslt #b00000000000000000000000000000000 (size!26446 _keys!1386)))))

(assert (=> d!112051 (= lt!410231 e!511075)))

(assert (=> d!112051 (= c!95693 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112051 (validMask!0 mask!1756)))

(assert (=> d!112051 (= (getCurrentListMap!2811 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410217)))

(declare-fun b!911298 () Bool)

(assert (=> b!911298 (= e!511072 (validKeyInArray!0 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112051 c!95693) b!911289))

(assert (= (and d!112051 (not c!95693)) b!911290))

(assert (= (and b!911290 c!95696) b!911297))

(assert (= (and b!911290 (not c!95696)) b!911299))

(assert (= (and b!911299 c!95695) b!911303))

(assert (= (and b!911299 (not c!95695)) b!911304))

(assert (= (or b!911303 b!911304) bm!40327))

(assert (= (or b!911297 bm!40327) bm!40332))

(assert (= (or b!911297 b!911303) bm!40328))

(assert (= (or b!911289 bm!40332) bm!40326))

(assert (= (or b!911289 bm!40328) bm!40331))

(assert (= (and d!112051 res!614874) b!911298))

(assert (= (and d!112051 c!95697) b!911302))

(assert (= (and d!112051 (not c!95697)) b!911300))

(assert (= (and d!112051 res!614881) b!911306))

(assert (= (and b!911306 res!614875) b!911301))

(assert (= (and b!911306 (not res!614878)) b!911288))

(assert (= (and b!911288 res!614879) b!911292))

(assert (= (and b!911306 res!614873) b!911296))

(assert (= (and b!911296 c!95694) b!911305))

(assert (= (and b!911296 (not c!95694)) b!911291))

(assert (= (and b!911305 res!614877) b!911293))

(assert (= (or b!911305 b!911291) bm!40330))

(assert (= (and b!911296 res!614880) b!911308))

(assert (= (and b!911308 c!95698) b!911294))

(assert (= (and b!911308 (not c!95698)) b!911307))

(assert (= (and b!911294 res!614876) b!911295))

(assert (= (or b!911294 b!911307) bm!40329))

(declare-fun b_lambda!13285 () Bool)

(assert (=> (not b_lambda!13285) (not b!911292)))

(declare-fun t!25865 () Bool)

(declare-fun tb!5429 () Bool)

(assert (=> (and start!78064 (= defaultEntry!1160 defaultEntry!1160) t!25865) tb!5429))

(declare-fun result!10667 () Bool)

(assert (=> tb!5429 (= result!10667 tp_is_empty!19027)))

(assert (=> b!911292 t!25865))

(declare-fun b_and!27161 () Bool)

(assert (= b_and!27155 (and (=> t!25865 result!10667) b_and!27161)))

(declare-fun m!845481 () Bool)

(assert (=> b!911293 m!845481))

(declare-fun m!845483 () Bool)

(assert (=> b!911289 m!845483))

(assert (=> d!112051 m!845419))

(declare-fun m!845485 () Bool)

(assert (=> b!911295 m!845485))

(declare-fun m!845487 () Bool)

(assert (=> b!911302 m!845487))

(declare-fun m!845489 () Bool)

(assert (=> b!911302 m!845489))

(declare-fun m!845491 () Bool)

(assert (=> b!911302 m!845491))

(declare-fun m!845493 () Bool)

(assert (=> b!911302 m!845493))

(declare-fun m!845495 () Bool)

(assert (=> b!911302 m!845495))

(declare-fun m!845497 () Bool)

(assert (=> b!911302 m!845497))

(declare-fun m!845499 () Bool)

(assert (=> b!911302 m!845499))

(declare-fun m!845501 () Bool)

(assert (=> b!911302 m!845501))

(declare-fun m!845503 () Bool)

(assert (=> b!911302 m!845503))

(assert (=> b!911302 m!845501))

(declare-fun m!845505 () Bool)

(assert (=> b!911302 m!845505))

(assert (=> b!911302 m!845497))

(declare-fun m!845507 () Bool)

(assert (=> b!911302 m!845507))

(declare-fun m!845509 () Bool)

(assert (=> b!911302 m!845509))

(declare-fun m!845511 () Bool)

(assert (=> b!911302 m!845511))

(assert (=> b!911302 m!845507))

(declare-fun m!845513 () Bool)

(assert (=> b!911302 m!845513))

(declare-fun m!845515 () Bool)

(assert (=> b!911302 m!845515))

(declare-fun m!845517 () Bool)

(assert (=> b!911302 m!845517))

(assert (=> b!911302 m!845515))

(declare-fun m!845519 () Bool)

(assert (=> b!911302 m!845519))

(assert (=> bm!40326 m!845513))

(assert (=> b!911288 m!845495))

(assert (=> b!911288 m!845495))

(declare-fun m!845521 () Bool)

(assert (=> b!911288 m!845521))

(declare-fun m!845523 () Bool)

(assert (=> bm!40329 m!845523))

(declare-fun m!845525 () Bool)

(assert (=> bm!40330 m!845525))

(assert (=> b!911301 m!845495))

(assert (=> b!911301 m!845495))

(declare-fun m!845527 () Bool)

(assert (=> b!911301 m!845527))

(assert (=> b!911298 m!845495))

(assert (=> b!911298 m!845495))

(assert (=> b!911298 m!845527))

(declare-fun m!845529 () Bool)

(assert (=> bm!40331 m!845529))

(declare-fun m!845531 () Bool)

(assert (=> b!911292 m!845531))

(declare-fun m!845533 () Bool)

(assert (=> b!911292 m!845533))

(declare-fun m!845535 () Bool)

(assert (=> b!911292 m!845535))

(assert (=> b!911292 m!845495))

(declare-fun m!845537 () Bool)

(assert (=> b!911292 m!845537))

(assert (=> b!911292 m!845531))

(assert (=> b!911292 m!845533))

(assert (=> b!911292 m!845495))

(assert (=> b!911177 d!112051))

(declare-fun d!112053 () Bool)

(assert (=> d!112053 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!911178 d!112053))

(declare-fun b!911321 () Bool)

(declare-fun e!511093 () Bool)

(declare-fun e!511092 () Bool)

(assert (=> b!911321 (= e!511093 e!511092)))

(declare-fun res!614889 () Bool)

(assert (=> b!911321 (=> (not res!614889) (not e!511092))))

(declare-fun e!511091 () Bool)

(assert (=> b!911321 (= res!614889 (not e!511091))))

(declare-fun res!614888 () Bool)

(assert (=> b!911321 (=> (not res!614888) (not e!511091))))

(assert (=> b!911321 (= res!614888 (validKeyInArray!0 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!911322 () Bool)

(declare-fun contains!4613 (List!18283 (_ BitVec 64)) Bool)

(assert (=> b!911322 (= e!511091 (contains!4613 Nil!18280 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112055 () Bool)

(declare-fun res!614890 () Bool)

(assert (=> d!112055 (=> res!614890 e!511093)))

(assert (=> d!112055 (= res!614890 (bvsge #b00000000000000000000000000000000 (size!26446 _keys!1386)))))

(assert (=> d!112055 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18280) e!511093)))

(declare-fun b!911323 () Bool)

(declare-fun e!511094 () Bool)

(declare-fun call!40338 () Bool)

(assert (=> b!911323 (= e!511094 call!40338)))

(declare-fun bm!40335 () Bool)

(declare-fun c!95701 () Bool)

(assert (=> bm!40335 (= call!40338 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95701 (Cons!18279 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000) Nil!18280) Nil!18280)))))

(declare-fun b!911324 () Bool)

(assert (=> b!911324 (= e!511094 call!40338)))

(declare-fun b!911325 () Bool)

(assert (=> b!911325 (= e!511092 e!511094)))

(assert (=> b!911325 (= c!95701 (validKeyInArray!0 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112055 (not res!614890)) b!911321))

(assert (= (and b!911321 res!614888) b!911322))

(assert (= (and b!911321 res!614889) b!911325))

(assert (= (and b!911325 c!95701) b!911323))

(assert (= (and b!911325 (not c!95701)) b!911324))

(assert (= (or b!911323 b!911324) bm!40335))

(assert (=> b!911321 m!845495))

(assert (=> b!911321 m!845495))

(assert (=> b!911321 m!845527))

(assert (=> b!911322 m!845495))

(assert (=> b!911322 m!845495))

(declare-fun m!845539 () Bool)

(assert (=> b!911322 m!845539))

(assert (=> bm!40335 m!845495))

(declare-fun m!845541 () Bool)

(assert (=> bm!40335 m!845541))

(assert (=> b!911325 m!845495))

(assert (=> b!911325 m!845495))

(assert (=> b!911325 m!845527))

(assert (=> b!911182 d!112055))

(declare-fun b!911334 () Bool)

(declare-fun e!511102 () Bool)

(declare-fun call!40341 () Bool)

(assert (=> b!911334 (= e!511102 call!40341)))

(declare-fun b!911335 () Bool)

(declare-fun e!511101 () Bool)

(assert (=> b!911335 (= e!511101 e!511102)))

(declare-fun lt!410243 () (_ BitVec 64))

(assert (=> b!911335 (= lt!410243 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410242 () Unit!30792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54057 (_ BitVec 64) (_ BitVec 32)) Unit!30792)

(assert (=> b!911335 (= lt!410242 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410243 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!911335 (arrayContainsKey!0 _keys!1386 lt!410243 #b00000000000000000000000000000000)))

(declare-fun lt!410244 () Unit!30792)

(assert (=> b!911335 (= lt!410244 lt!410242)))

(declare-fun res!614896 () Bool)

(declare-datatypes ((SeekEntryResult!8966 0))(
  ( (MissingZero!8966 (index!38235 (_ BitVec 32))) (Found!8966 (index!38236 (_ BitVec 32))) (Intermediate!8966 (undefined!9778 Bool) (index!38237 (_ BitVec 32)) (x!77940 (_ BitVec 32))) (Undefined!8966) (MissingVacant!8966 (index!38238 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54057 (_ BitVec 32)) SeekEntryResult!8966)

(assert (=> b!911335 (= res!614896 (= (seekEntryOrOpen!0 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8966 #b00000000000000000000000000000000)))))

(assert (=> b!911335 (=> (not res!614896) (not e!511102))))

(declare-fun b!911336 () Bool)

(declare-fun e!511103 () Bool)

(assert (=> b!911336 (= e!511103 e!511101)))

(declare-fun c!95704 () Bool)

(assert (=> b!911336 (= c!95704 (validKeyInArray!0 (select (arr!25985 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112057 () Bool)

(declare-fun res!614895 () Bool)

(assert (=> d!112057 (=> res!614895 e!511103)))

(assert (=> d!112057 (= res!614895 (bvsge #b00000000000000000000000000000000 (size!26446 _keys!1386)))))

(assert (=> d!112057 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!511103)))

(declare-fun bm!40338 () Bool)

(assert (=> bm!40338 (= call!40341 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!911337 () Bool)

(assert (=> b!911337 (= e!511101 call!40341)))

(assert (= (and d!112057 (not res!614895)) b!911336))

(assert (= (and b!911336 c!95704) b!911335))

(assert (= (and b!911336 (not c!95704)) b!911337))

(assert (= (and b!911335 res!614896) b!911334))

(assert (= (or b!911334 b!911337) bm!40338))

(assert (=> b!911335 m!845495))

(declare-fun m!845543 () Bool)

(assert (=> b!911335 m!845543))

(declare-fun m!845545 () Bool)

(assert (=> b!911335 m!845545))

(assert (=> b!911335 m!845495))

(declare-fun m!845547 () Bool)

(assert (=> b!911335 m!845547))

(assert (=> b!911336 m!845495))

(assert (=> b!911336 m!845495))

(assert (=> b!911336 m!845527))

(declare-fun m!845549 () Bool)

(assert (=> bm!40338 m!845549))

(assert (=> b!911179 d!112057))

(declare-fun mapNonEmpty!30271 () Bool)

(declare-fun mapRes!30271 () Bool)

(declare-fun tp!58114 () Bool)

(declare-fun e!511108 () Bool)

(assert (=> mapNonEmpty!30271 (= mapRes!30271 (and tp!58114 e!511108))))

(declare-fun mapValue!30271 () ValueCell!9032)

(declare-fun mapKey!30271 () (_ BitVec 32))

(declare-fun mapRest!30271 () (Array (_ BitVec 32) ValueCell!9032))

(assert (=> mapNonEmpty!30271 (= mapRest!30262 (store mapRest!30271 mapKey!30271 mapValue!30271))))

(declare-fun mapIsEmpty!30271 () Bool)

(assert (=> mapIsEmpty!30271 mapRes!30271))

(declare-fun b!911345 () Bool)

(declare-fun e!511109 () Bool)

(assert (=> b!911345 (= e!511109 tp_is_empty!19027)))

(declare-fun b!911344 () Bool)

(assert (=> b!911344 (= e!511108 tp_is_empty!19027)))

(declare-fun condMapEmpty!30271 () Bool)

(declare-fun mapDefault!30271 () ValueCell!9032)

(assert (=> mapNonEmpty!30262 (= condMapEmpty!30271 (= mapRest!30262 ((as const (Array (_ BitVec 32) ValueCell!9032)) mapDefault!30271)))))

(assert (=> mapNonEmpty!30262 (= tp!58099 (and e!511109 mapRes!30271))))

(assert (= (and mapNonEmpty!30262 condMapEmpty!30271) mapIsEmpty!30271))

(assert (= (and mapNonEmpty!30262 (not condMapEmpty!30271)) mapNonEmpty!30271))

(assert (= (and mapNonEmpty!30271 ((_ is ValueCellFull!9032) mapValue!30271)) b!911344))

(assert (= (and mapNonEmpty!30262 ((_ is ValueCellFull!9032) mapDefault!30271)) b!911345))

(declare-fun m!845551 () Bool)

(assert (=> mapNonEmpty!30271 m!845551))

(declare-fun b_lambda!13287 () Bool)

(assert (= b_lambda!13285 (or (and start!78064 b_free!16609) b_lambda!13287)))

(check-sat (not b!911301) b_and!27161 (not b!911293) (not b!911292) (not b!911289) (not b!911336) (not bm!40330) (not b!911245) (not b!911295) (not bm!40326) (not mapNonEmpty!30271) (not b!911322) (not b_next!16609) tp_is_empty!19027 (not bm!40329) (not bm!40338) (not d!112051) (not b!911321) (not b!911302) (not b!911325) (not b!911298) (not b!911335) (not bm!40335) (not bm!40331) (not b!911288) (not b!911243) (not d!112049) (not b_lambda!13287))
(check-sat b_and!27161 (not b_next!16609))
