; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77958 () Bool)

(assert start!77958)

(declare-fun b_free!16519 () Bool)

(declare-fun b_next!16519 () Bool)

(assert (=> start!77958 (= b_free!16519 (not b_next!16519))))

(declare-fun tp!57826 () Bool)

(declare-fun b_and!27063 () Bool)

(assert (=> start!77958 (= tp!57826 b_and!27063)))

(declare-fun res!614212 () Bool)

(declare-fun e!510260 () Bool)

(assert (=> start!77958 (=> (not res!614212) (not e!510260))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77958 (= res!614212 (validMask!0 mask!1756))))

(assert (=> start!77958 e!510260))

(declare-datatypes ((V!30215 0))(
  ( (V!30216 (val!9519 Int)) )
))
(declare-datatypes ((ValueCell!8987 0))(
  ( (ValueCellFull!8987 (v!12026 V!30215)) (EmptyCell!8987) )
))
(declare-datatypes ((array!53877 0))(
  ( (array!53878 (arr!25896 (Array (_ BitVec 32) ValueCell!8987)) (size!26357 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53877)

(declare-fun e!510259 () Bool)

(declare-fun array_inv!20306 (array!53877) Bool)

(assert (=> start!77958 (and (array_inv!20306 _values!1152) e!510259)))

(assert (=> start!77958 tp!57826))

(assert (=> start!77958 true))

(declare-fun tp_is_empty!18937 () Bool)

(assert (=> start!77958 tp_is_empty!18937))

(declare-datatypes ((array!53879 0))(
  ( (array!53880 (arr!25897 (Array (_ BitVec 32) (_ BitVec 64))) (size!26358 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53879)

(declare-fun array_inv!20307 (array!53879) Bool)

(assert (=> start!77958 (array_inv!20307 _keys!1386)))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun b!910102 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!910102 (= e!510260 (and (= (select (arr!25897 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsgt #b00000000000000000000000000000000 (size!26358 _keys!1386))))))

(declare-fun b!910103 () Bool)

(declare-fun res!614210 () Bool)

(assert (=> b!910103 (=> (not res!614210) (not e!510260))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!910103 (= res!614210 (inRange!0 i!717 mask!1756))))

(declare-fun b!910104 () Bool)

(declare-fun res!614211 () Bool)

(assert (=> b!910104 (=> (not res!614211) (not e!510260))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30215)

(declare-fun minValue!1094 () V!30215)

(declare-datatypes ((tuple2!12438 0))(
  ( (tuple2!12439 (_1!6230 (_ BitVec 64)) (_2!6230 V!30215)) )
))
(declare-datatypes ((List!18223 0))(
  ( (Nil!18220) (Cons!18219 (h!19365 tuple2!12438) (t!25797 List!18223)) )
))
(declare-datatypes ((ListLongMap!11125 0))(
  ( (ListLongMap!11126 (toList!5578 List!18223)) )
))
(declare-fun contains!4578 (ListLongMap!11125 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2780 (array!53879 array!53877 (_ BitVec 32) (_ BitVec 32) V!30215 V!30215 (_ BitVec 32) Int) ListLongMap!11125)

(assert (=> b!910104 (= res!614211 (contains!4578 (getCurrentListMap!2780 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30124 () Bool)

(declare-fun mapRes!30124 () Bool)

(declare-fun tp!57825 () Bool)

(declare-fun e!510257 () Bool)

(assert (=> mapNonEmpty!30124 (= mapRes!30124 (and tp!57825 e!510257))))

(declare-fun mapKey!30124 () (_ BitVec 32))

(declare-fun mapValue!30124 () ValueCell!8987)

(declare-fun mapRest!30124 () (Array (_ BitVec 32) ValueCell!8987))

(assert (=> mapNonEmpty!30124 (= (arr!25896 _values!1152) (store mapRest!30124 mapKey!30124 mapValue!30124))))

(declare-fun b!910105 () Bool)

(declare-fun res!614208 () Bool)

(assert (=> b!910105 (=> (not res!614208) (not e!510260))))

(assert (=> b!910105 (= res!614208 (and (= (size!26357 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26358 _keys!1386) (size!26357 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910106 () Bool)

(assert (=> b!910106 (= e!510257 tp_is_empty!18937)))

(declare-fun mapIsEmpty!30124 () Bool)

(assert (=> mapIsEmpty!30124 mapRes!30124))

(declare-fun b!910107 () Bool)

(declare-fun e!510258 () Bool)

(assert (=> b!910107 (= e!510258 tp_is_empty!18937)))

(declare-fun b!910108 () Bool)

(declare-fun res!614207 () Bool)

(assert (=> b!910108 (=> (not res!614207) (not e!510260))))

(declare-datatypes ((List!18224 0))(
  ( (Nil!18221) (Cons!18220 (h!19366 (_ BitVec 64)) (t!25798 List!18224)) )
))
(declare-fun arrayNoDuplicates!0 (array!53879 (_ BitVec 32) List!18224) Bool)

(assert (=> b!910108 (= res!614207 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18221))))

(declare-fun b!910109 () Bool)

(assert (=> b!910109 (= e!510259 (and e!510258 mapRes!30124))))

(declare-fun condMapEmpty!30124 () Bool)

(declare-fun mapDefault!30124 () ValueCell!8987)

(assert (=> b!910109 (= condMapEmpty!30124 (= (arr!25896 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8987)) mapDefault!30124)))))

(declare-fun b!910110 () Bool)

(declare-fun res!614209 () Bool)

(assert (=> b!910110 (=> (not res!614209) (not e!510260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53879 (_ BitVec 32)) Bool)

(assert (=> b!910110 (= res!614209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77958 res!614212) b!910105))

(assert (= (and b!910105 res!614208) b!910110))

(assert (= (and b!910110 res!614209) b!910108))

(assert (= (and b!910108 res!614207) b!910104))

(assert (= (and b!910104 res!614211) b!910103))

(assert (= (and b!910103 res!614210) b!910102))

(assert (= (and b!910109 condMapEmpty!30124) mapIsEmpty!30124))

(assert (= (and b!910109 (not condMapEmpty!30124)) mapNonEmpty!30124))

(get-info :version)

(assert (= (and mapNonEmpty!30124 ((_ is ValueCellFull!8987) mapValue!30124)) b!910106))

(assert (= (and b!910109 ((_ is ValueCellFull!8987) mapDefault!30124)) b!910107))

(assert (= start!77958 b!910109))

(declare-fun m!844607 () Bool)

(assert (=> b!910110 m!844607))

(declare-fun m!844609 () Bool)

(assert (=> start!77958 m!844609))

(declare-fun m!844611 () Bool)

(assert (=> start!77958 m!844611))

(declare-fun m!844613 () Bool)

(assert (=> start!77958 m!844613))

(declare-fun m!844615 () Bool)

(assert (=> b!910103 m!844615))

(declare-fun m!844617 () Bool)

(assert (=> mapNonEmpty!30124 m!844617))

(declare-fun m!844619 () Bool)

(assert (=> b!910108 m!844619))

(declare-fun m!844621 () Bool)

(assert (=> b!910102 m!844621))

(declare-fun m!844623 () Bool)

(assert (=> b!910104 m!844623))

(assert (=> b!910104 m!844623))

(declare-fun m!844625 () Bool)

(assert (=> b!910104 m!844625))

(check-sat b_and!27063 (not start!77958) tp_is_empty!18937 (not b!910103) (not b_next!16519) (not mapNonEmpty!30124) (not b!910110) (not b!910108) (not b!910104))
(check-sat b_and!27063 (not b_next!16519))
(get-model)

(declare-fun b!910175 () Bool)

(declare-fun e!510302 () Bool)

(declare-fun contains!4580 (List!18224 (_ BitVec 64)) Bool)

(assert (=> b!910175 (= e!510302 (contains!4580 Nil!18221 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40287 () Bool)

(declare-fun call!40290 () Bool)

(declare-fun c!95653 () Bool)

(assert (=> bm!40287 (= call!40290 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95653 (Cons!18220 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000) Nil!18221) Nil!18221)))))

(declare-fun b!910177 () Bool)

(declare-fun e!510301 () Bool)

(assert (=> b!910177 (= e!510301 call!40290)))

(declare-fun b!910178 () Bool)

(declare-fun e!510300 () Bool)

(assert (=> b!910178 (= e!510300 e!510301)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!910178 (= c!95653 (validKeyInArray!0 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!910179 () Bool)

(assert (=> b!910179 (= e!510301 call!40290)))

(declare-fun d!111997 () Bool)

(declare-fun res!614255 () Bool)

(declare-fun e!510299 () Bool)

(assert (=> d!111997 (=> res!614255 e!510299)))

(assert (=> d!111997 (= res!614255 (bvsge #b00000000000000000000000000000000 (size!26358 _keys!1386)))))

(assert (=> d!111997 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18221) e!510299)))

(declare-fun b!910176 () Bool)

(assert (=> b!910176 (= e!510299 e!510300)))

(declare-fun res!614256 () Bool)

(assert (=> b!910176 (=> (not res!614256) (not e!510300))))

(assert (=> b!910176 (= res!614256 (not e!510302))))

(declare-fun res!614257 () Bool)

(assert (=> b!910176 (=> (not res!614257) (not e!510302))))

(assert (=> b!910176 (= res!614257 (validKeyInArray!0 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!111997 (not res!614255)) b!910176))

(assert (= (and b!910176 res!614257) b!910175))

(assert (= (and b!910176 res!614256) b!910178))

(assert (= (and b!910178 c!95653) b!910177))

(assert (= (and b!910178 (not c!95653)) b!910179))

(assert (= (or b!910177 b!910179) bm!40287))

(declare-fun m!844667 () Bool)

(assert (=> b!910175 m!844667))

(assert (=> b!910175 m!844667))

(declare-fun m!844669 () Bool)

(assert (=> b!910175 m!844669))

(assert (=> bm!40287 m!844667))

(declare-fun m!844671 () Bool)

(assert (=> bm!40287 m!844671))

(assert (=> b!910178 m!844667))

(assert (=> b!910178 m!844667))

(declare-fun m!844673 () Bool)

(assert (=> b!910178 m!844673))

(assert (=> b!910176 m!844667))

(assert (=> b!910176 m!844667))

(assert (=> b!910176 m!844673))

(assert (=> b!910108 d!111997))

(declare-fun d!111999 () Bool)

(assert (=> d!111999 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77958 d!111999))

(declare-fun d!112001 () Bool)

(assert (=> d!112001 (= (array_inv!20306 _values!1152) (bvsge (size!26357 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77958 d!112001))

(declare-fun d!112003 () Bool)

(assert (=> d!112003 (= (array_inv!20307 _keys!1386) (bvsge (size!26358 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77958 d!112003))

(declare-fun d!112005 () Bool)

(declare-fun e!510307 () Bool)

(assert (=> d!112005 e!510307))

(declare-fun res!614260 () Bool)

(assert (=> d!112005 (=> res!614260 e!510307)))

(declare-fun lt!409953 () Bool)

(assert (=> d!112005 (= res!614260 (not lt!409953))))

(declare-fun lt!409954 () Bool)

(assert (=> d!112005 (= lt!409953 lt!409954)))

(declare-datatypes ((Unit!30788 0))(
  ( (Unit!30789) )
))
(declare-fun lt!409955 () Unit!30788)

(declare-fun e!510308 () Unit!30788)

(assert (=> d!112005 (= lt!409955 e!510308)))

(declare-fun c!95656 () Bool)

(assert (=> d!112005 (= c!95656 lt!409954)))

(declare-fun containsKey!438 (List!18223 (_ BitVec 64)) Bool)

(assert (=> d!112005 (= lt!409954 (containsKey!438 (toList!5578 (getCurrentListMap!2780 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112005 (= (contains!4578 (getCurrentListMap!2780 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!409953)))

(declare-fun b!910186 () Bool)

(declare-fun lt!409956 () Unit!30788)

(assert (=> b!910186 (= e!510308 lt!409956)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!333 (List!18223 (_ BitVec 64)) Unit!30788)

(assert (=> b!910186 (= lt!409956 (lemmaContainsKeyImpliesGetValueByKeyDefined!333 (toList!5578 (getCurrentListMap!2780 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!480 0))(
  ( (Some!479 (v!12029 V!30215)) (None!478) )
))
(declare-fun isDefined!346 (Option!480) Bool)

(declare-fun getValueByKey!474 (List!18223 (_ BitVec 64)) Option!480)

(assert (=> b!910186 (isDefined!346 (getValueByKey!474 (toList!5578 (getCurrentListMap!2780 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!910187 () Bool)

(declare-fun Unit!30790 () Unit!30788)

(assert (=> b!910187 (= e!510308 Unit!30790)))

(declare-fun b!910188 () Bool)

(assert (=> b!910188 (= e!510307 (isDefined!346 (getValueByKey!474 (toList!5578 (getCurrentListMap!2780 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112005 c!95656) b!910186))

(assert (= (and d!112005 (not c!95656)) b!910187))

(assert (= (and d!112005 (not res!614260)) b!910188))

(declare-fun m!844675 () Bool)

(assert (=> d!112005 m!844675))

(declare-fun m!844677 () Bool)

(assert (=> b!910186 m!844677))

(declare-fun m!844679 () Bool)

(assert (=> b!910186 m!844679))

(assert (=> b!910186 m!844679))

(declare-fun m!844681 () Bool)

(assert (=> b!910186 m!844681))

(assert (=> b!910188 m!844679))

(assert (=> b!910188 m!844679))

(assert (=> b!910188 m!844681))

(assert (=> b!910104 d!112005))

(declare-fun b!910231 () Bool)

(declare-fun e!510342 () Bool)

(declare-fun call!40311 () Bool)

(assert (=> b!910231 (= e!510342 (not call!40311))))

(declare-fun call!40306 () ListLongMap!11125)

(declare-fun bm!40302 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3327 (array!53879 array!53877 (_ BitVec 32) (_ BitVec 32) V!30215 V!30215 (_ BitVec 32) Int) ListLongMap!11125)

(assert (=> bm!40302 (= call!40306 (getCurrentListMapNoExtraKeys!3327 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!910232 () Bool)

(declare-fun e!510341 () ListLongMap!11125)

(declare-fun call!40307 () ListLongMap!11125)

(assert (=> b!910232 (= e!510341 call!40307)))

(declare-fun bm!40303 () Bool)

(declare-fun call!40305 () ListLongMap!11125)

(declare-fun call!40309 () ListLongMap!11125)

(assert (=> bm!40303 (= call!40305 call!40309)))

(declare-fun b!910233 () Bool)

(declare-fun e!510345 () Bool)

(assert (=> b!910233 (= e!510345 (validKeyInArray!0 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!910234 () Bool)

(declare-fun e!510336 () Bool)

(declare-fun e!510346 () Bool)

(assert (=> b!910234 (= e!510336 e!510346)))

(declare-fun res!614279 () Bool)

(assert (=> b!910234 (=> (not res!614279) (not e!510346))))

(declare-fun lt!410006 () ListLongMap!11125)

(assert (=> b!910234 (= res!614279 (contains!4578 lt!410006 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!910234 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26358 _keys!1386)))))

(declare-fun call!40308 () ListLongMap!11125)

(declare-fun c!95669 () Bool)

(declare-fun bm!40304 () Bool)

(declare-fun c!95671 () Bool)

(declare-fun +!2630 (ListLongMap!11125 tuple2!12438) ListLongMap!11125)

(assert (=> bm!40304 (= call!40308 (+!2630 (ite c!95669 call!40306 (ite c!95671 call!40309 call!40305)) (ite (or c!95669 c!95671) (tuple2!12439 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12439 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun b!910235 () Bool)

(declare-fun e!510343 () Bool)

(declare-fun apply!516 (ListLongMap!11125 (_ BitVec 64)) V!30215)

(assert (=> b!910235 (= e!510343 (= (apply!516 lt!410006 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!910236 () Bool)

(declare-fun e!510337 () ListLongMap!11125)

(assert (=> b!910236 (= e!510337 call!40307)))

(declare-fun bm!40305 () Bool)

(assert (=> bm!40305 (= call!40307 call!40308)))

(declare-fun b!910237 () Bool)

(declare-fun res!614284 () Bool)

(declare-fun e!510335 () Bool)

(assert (=> b!910237 (=> (not res!614284) (not e!510335))))

(assert (=> b!910237 (= res!614284 e!510342)))

(declare-fun c!95674 () Bool)

(assert (=> b!910237 (= c!95674 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!910238 () Bool)

(declare-fun e!510347 () Bool)

(assert (=> b!910238 (= e!510335 e!510347)))

(declare-fun c!95672 () Bool)

(assert (=> b!910238 (= c!95672 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!910239 () Bool)

(declare-fun e!510344 () ListLongMap!11125)

(assert (=> b!910239 (= e!510344 e!510341)))

(assert (=> b!910239 (= c!95671 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40306 () Bool)

(declare-fun call!40310 () Bool)

(assert (=> bm!40306 (= call!40310 (contains!4578 lt!410006 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40307 () Bool)

(assert (=> bm!40307 (= call!40309 call!40306)))

(declare-fun b!910240 () Bool)

(assert (=> b!910240 (= e!510337 call!40305)))

(declare-fun b!910241 () Bool)

(assert (=> b!910241 (= e!510342 e!510343)))

(declare-fun res!614285 () Bool)

(assert (=> b!910241 (= res!614285 call!40311)))

(assert (=> b!910241 (=> (not res!614285) (not e!510343))))

(declare-fun b!910242 () Bool)

(assert (=> b!910242 (= e!510347 (not call!40310))))

(declare-fun b!910243 () Bool)

(declare-fun e!510339 () Bool)

(assert (=> b!910243 (= e!510347 e!510339)))

(declare-fun res!614287 () Bool)

(assert (=> b!910243 (= res!614287 call!40310)))

(assert (=> b!910243 (=> (not res!614287) (not e!510339))))

(declare-fun b!910244 () Bool)

(declare-fun e!510340 () Unit!30788)

(declare-fun Unit!30791 () Unit!30788)

(assert (=> b!910244 (= e!510340 Unit!30791)))

(declare-fun bm!40308 () Bool)

(assert (=> bm!40308 (= call!40311 (contains!4578 lt!410006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!910245 () Bool)

(declare-fun res!614281 () Bool)

(assert (=> b!910245 (=> (not res!614281) (not e!510335))))

(assert (=> b!910245 (= res!614281 e!510336)))

(declare-fun res!614286 () Bool)

(assert (=> b!910245 (=> res!614286 e!510336)))

(assert (=> b!910245 (= res!614286 (not e!510345))))

(declare-fun res!614283 () Bool)

(assert (=> b!910245 (=> (not res!614283) (not e!510345))))

(assert (=> b!910245 (= res!614283 (bvslt #b00000000000000000000000000000000 (size!26358 _keys!1386)))))

(declare-fun b!910246 () Bool)

(declare-fun get!13623 (ValueCell!8987 V!30215) V!30215)

(declare-fun dynLambda!1381 (Int (_ BitVec 64)) V!30215)

(assert (=> b!910246 (= e!510346 (= (apply!516 lt!410006 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000)) (get!13623 (select (arr!25896 _values!1152) #b00000000000000000000000000000000) (dynLambda!1381 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!910246 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26357 _values!1152)))))

(assert (=> b!910246 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26358 _keys!1386)))))

(declare-fun b!910247 () Bool)

(declare-fun lt!410005 () Unit!30788)

(assert (=> b!910247 (= e!510340 lt!410005)))

(declare-fun lt!410011 () ListLongMap!11125)

(assert (=> b!910247 (= lt!410011 (getCurrentListMapNoExtraKeys!3327 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410001 () (_ BitVec 64))

(assert (=> b!910247 (= lt!410001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410012 () (_ BitVec 64))

(assert (=> b!910247 (= lt!410012 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410021 () Unit!30788)

(declare-fun addStillContains!345 (ListLongMap!11125 (_ BitVec 64) V!30215 (_ BitVec 64)) Unit!30788)

(assert (=> b!910247 (= lt!410021 (addStillContains!345 lt!410011 lt!410001 zeroValue!1094 lt!410012))))

(assert (=> b!910247 (contains!4578 (+!2630 lt!410011 (tuple2!12439 lt!410001 zeroValue!1094)) lt!410012)))

(declare-fun lt!410020 () Unit!30788)

(assert (=> b!910247 (= lt!410020 lt!410021)))

(declare-fun lt!410008 () ListLongMap!11125)

(assert (=> b!910247 (= lt!410008 (getCurrentListMapNoExtraKeys!3327 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410010 () (_ BitVec 64))

(assert (=> b!910247 (= lt!410010 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410003 () (_ BitVec 64))

(assert (=> b!910247 (= lt!410003 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410017 () Unit!30788)

(declare-fun addApplyDifferent!345 (ListLongMap!11125 (_ BitVec 64) V!30215 (_ BitVec 64)) Unit!30788)

(assert (=> b!910247 (= lt!410017 (addApplyDifferent!345 lt!410008 lt!410010 minValue!1094 lt!410003))))

(assert (=> b!910247 (= (apply!516 (+!2630 lt!410008 (tuple2!12439 lt!410010 minValue!1094)) lt!410003) (apply!516 lt!410008 lt!410003))))

(declare-fun lt!410014 () Unit!30788)

(assert (=> b!910247 (= lt!410014 lt!410017)))

(declare-fun lt!410002 () ListLongMap!11125)

(assert (=> b!910247 (= lt!410002 (getCurrentListMapNoExtraKeys!3327 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410018 () (_ BitVec 64))

(assert (=> b!910247 (= lt!410018 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410004 () (_ BitVec 64))

(assert (=> b!910247 (= lt!410004 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410007 () Unit!30788)

(assert (=> b!910247 (= lt!410007 (addApplyDifferent!345 lt!410002 lt!410018 zeroValue!1094 lt!410004))))

(assert (=> b!910247 (= (apply!516 (+!2630 lt!410002 (tuple2!12439 lt!410018 zeroValue!1094)) lt!410004) (apply!516 lt!410002 lt!410004))))

(declare-fun lt!410016 () Unit!30788)

(assert (=> b!910247 (= lt!410016 lt!410007)))

(declare-fun lt!410019 () ListLongMap!11125)

(assert (=> b!910247 (= lt!410019 (getCurrentListMapNoExtraKeys!3327 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410013 () (_ BitVec 64))

(assert (=> b!910247 (= lt!410013 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410009 () (_ BitVec 64))

(assert (=> b!910247 (= lt!410009 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!910247 (= lt!410005 (addApplyDifferent!345 lt!410019 lt!410013 minValue!1094 lt!410009))))

(assert (=> b!910247 (= (apply!516 (+!2630 lt!410019 (tuple2!12439 lt!410013 minValue!1094)) lt!410009) (apply!516 lt!410019 lt!410009))))

(declare-fun b!910248 () Bool)

(declare-fun e!510338 () Bool)

(assert (=> b!910248 (= e!510338 (validKeyInArray!0 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112007 () Bool)

(assert (=> d!112007 e!510335))

(declare-fun res!614282 () Bool)

(assert (=> d!112007 (=> (not res!614282) (not e!510335))))

(assert (=> d!112007 (= res!614282 (or (bvsge #b00000000000000000000000000000000 (size!26358 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26358 _keys!1386)))))))

(declare-fun lt!410015 () ListLongMap!11125)

(assert (=> d!112007 (= lt!410006 lt!410015)))

(declare-fun lt!410022 () Unit!30788)

(assert (=> d!112007 (= lt!410022 e!510340)))

(declare-fun c!95670 () Bool)

(assert (=> d!112007 (= c!95670 e!510338)))

(declare-fun res!614280 () Bool)

(assert (=> d!112007 (=> (not res!614280) (not e!510338))))

(assert (=> d!112007 (= res!614280 (bvslt #b00000000000000000000000000000000 (size!26358 _keys!1386)))))

(assert (=> d!112007 (= lt!410015 e!510344)))

(assert (=> d!112007 (= c!95669 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112007 (validMask!0 mask!1756)))

(assert (=> d!112007 (= (getCurrentListMap!2780 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410006)))

(declare-fun b!910249 () Bool)

(assert (=> b!910249 (= e!510344 (+!2630 call!40308 (tuple2!12439 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!910250 () Bool)

(declare-fun c!95673 () Bool)

(assert (=> b!910250 (= c!95673 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!910250 (= e!510341 e!510337)))

(declare-fun b!910251 () Bool)

(assert (=> b!910251 (= e!510339 (= (apply!516 lt!410006 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(assert (= (and d!112007 c!95669) b!910249))

(assert (= (and d!112007 (not c!95669)) b!910239))

(assert (= (and b!910239 c!95671) b!910232))

(assert (= (and b!910239 (not c!95671)) b!910250))

(assert (= (and b!910250 c!95673) b!910236))

(assert (= (and b!910250 (not c!95673)) b!910240))

(assert (= (or b!910236 b!910240) bm!40303))

(assert (= (or b!910232 bm!40303) bm!40307))

(assert (= (or b!910232 b!910236) bm!40305))

(assert (= (or b!910249 bm!40307) bm!40302))

(assert (= (or b!910249 bm!40305) bm!40304))

(assert (= (and d!112007 res!614280) b!910248))

(assert (= (and d!112007 c!95670) b!910247))

(assert (= (and d!112007 (not c!95670)) b!910244))

(assert (= (and d!112007 res!614282) b!910245))

(assert (= (and b!910245 res!614283) b!910233))

(assert (= (and b!910245 (not res!614286)) b!910234))

(assert (= (and b!910234 res!614279) b!910246))

(assert (= (and b!910245 res!614281) b!910237))

(assert (= (and b!910237 c!95674) b!910241))

(assert (= (and b!910237 (not c!95674)) b!910231))

(assert (= (and b!910241 res!614285) b!910235))

(assert (= (or b!910241 b!910231) bm!40308))

(assert (= (and b!910237 res!614284) b!910238))

(assert (= (and b!910238 c!95672) b!910243))

(assert (= (and b!910238 (not c!95672)) b!910242))

(assert (= (and b!910243 res!614287) b!910251))

(assert (= (or b!910243 b!910242) bm!40306))

(declare-fun b_lambda!13281 () Bool)

(assert (=> (not b_lambda!13281) (not b!910246)))

(declare-fun t!25802 () Bool)

(declare-fun tb!5427 () Bool)

(assert (=> (and start!77958 (= defaultEntry!1160 defaultEntry!1160) t!25802) tb!5427))

(declare-fun result!10661 () Bool)

(assert (=> tb!5427 (= result!10661 tp_is_empty!18937)))

(assert (=> b!910246 t!25802))

(declare-fun b_and!27069 () Bool)

(assert (= b_and!27063 (and (=> t!25802 result!10661) b_and!27069)))

(declare-fun m!844683 () Bool)

(assert (=> b!910251 m!844683))

(declare-fun m!844685 () Bool)

(assert (=> bm!40306 m!844685))

(declare-fun m!844687 () Bool)

(assert (=> b!910235 m!844687))

(assert (=> b!910233 m!844667))

(assert (=> b!910233 m!844667))

(assert (=> b!910233 m!844673))

(assert (=> b!910246 m!844667))

(assert (=> b!910246 m!844667))

(declare-fun m!844689 () Bool)

(assert (=> b!910246 m!844689))

(declare-fun m!844691 () Bool)

(assert (=> b!910246 m!844691))

(declare-fun m!844693 () Bool)

(assert (=> b!910246 m!844693))

(assert (=> b!910246 m!844691))

(assert (=> b!910246 m!844693))

(declare-fun m!844695 () Bool)

(assert (=> b!910246 m!844695))

(assert (=> d!112007 m!844609))

(assert (=> b!910234 m!844667))

(assert (=> b!910234 m!844667))

(declare-fun m!844697 () Bool)

(assert (=> b!910234 m!844697))

(declare-fun m!844699 () Bool)

(assert (=> b!910247 m!844699))

(declare-fun m!844701 () Bool)

(assert (=> b!910247 m!844701))

(declare-fun m!844703 () Bool)

(assert (=> b!910247 m!844703))

(declare-fun m!844705 () Bool)

(assert (=> b!910247 m!844705))

(declare-fun m!844707 () Bool)

(assert (=> b!910247 m!844707))

(assert (=> b!910247 m!844667))

(declare-fun m!844709 () Bool)

(assert (=> b!910247 m!844709))

(declare-fun m!844711 () Bool)

(assert (=> b!910247 m!844711))

(declare-fun m!844713 () Bool)

(assert (=> b!910247 m!844713))

(assert (=> b!910247 m!844713))

(declare-fun m!844715 () Bool)

(assert (=> b!910247 m!844715))

(declare-fun m!844717 () Bool)

(assert (=> b!910247 m!844717))

(assert (=> b!910247 m!844705))

(declare-fun m!844719 () Bool)

(assert (=> b!910247 m!844719))

(declare-fun m!844721 () Bool)

(assert (=> b!910247 m!844721))

(declare-fun m!844723 () Bool)

(assert (=> b!910247 m!844723))

(declare-fun m!844725 () Bool)

(assert (=> b!910247 m!844725))

(assert (=> b!910247 m!844699))

(declare-fun m!844727 () Bool)

(assert (=> b!910247 m!844727))

(assert (=> b!910247 m!844709))

(declare-fun m!844729 () Bool)

(assert (=> b!910247 m!844729))

(assert (=> b!910248 m!844667))

(assert (=> b!910248 m!844667))

(assert (=> b!910248 m!844673))

(declare-fun m!844731 () Bool)

(assert (=> b!910249 m!844731))

(assert (=> bm!40302 m!844721))

(declare-fun m!844733 () Bool)

(assert (=> bm!40308 m!844733))

(declare-fun m!844735 () Bool)

(assert (=> bm!40304 m!844735))

(assert (=> b!910104 d!112007))

(declare-fun d!112009 () Bool)

(assert (=> d!112009 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!910103 d!112009))

(declare-fun b!910262 () Bool)

(declare-fun e!510356 () Bool)

(declare-fun e!510354 () Bool)

(assert (=> b!910262 (= e!510356 e!510354)))

(declare-fun c!95677 () Bool)

(assert (=> b!910262 (= c!95677 (validKeyInArray!0 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40311 () Bool)

(declare-fun call!40314 () Bool)

(assert (=> bm!40311 (= call!40314 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!910263 () Bool)

(assert (=> b!910263 (= e!510354 call!40314)))

(declare-fun b!910264 () Bool)

(declare-fun e!510355 () Bool)

(assert (=> b!910264 (= e!510355 call!40314)))

(declare-fun d!112011 () Bool)

(declare-fun res!614293 () Bool)

(assert (=> d!112011 (=> res!614293 e!510356)))

(assert (=> d!112011 (= res!614293 (bvsge #b00000000000000000000000000000000 (size!26358 _keys!1386)))))

(assert (=> d!112011 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!510356)))

(declare-fun b!910265 () Bool)

(assert (=> b!910265 (= e!510354 e!510355)))

(declare-fun lt!410030 () (_ BitVec 64))

(assert (=> b!910265 (= lt!410030 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410031 () Unit!30788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!53879 (_ BitVec 64) (_ BitVec 32)) Unit!30788)

(assert (=> b!910265 (= lt!410031 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410030 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!53879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!910265 (arrayContainsKey!0 _keys!1386 lt!410030 #b00000000000000000000000000000000)))

(declare-fun lt!410029 () Unit!30788)

(assert (=> b!910265 (= lt!410029 lt!410031)))

(declare-fun res!614292 () Bool)

(declare-datatypes ((SeekEntryResult!8965 0))(
  ( (MissingZero!8965 (index!38231 (_ BitVec 32))) (Found!8965 (index!38232 (_ BitVec 32))) (Intermediate!8965 (undefined!9777 Bool) (index!38233 (_ BitVec 32)) (x!77809 (_ BitVec 32))) (Undefined!8965) (MissingVacant!8965 (index!38234 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!53879 (_ BitVec 32)) SeekEntryResult!8965)

(assert (=> b!910265 (= res!614292 (= (seekEntryOrOpen!0 (select (arr!25897 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8965 #b00000000000000000000000000000000)))))

(assert (=> b!910265 (=> (not res!614292) (not e!510355))))

(assert (= (and d!112011 (not res!614293)) b!910262))

(assert (= (and b!910262 c!95677) b!910265))

(assert (= (and b!910262 (not c!95677)) b!910263))

(assert (= (and b!910265 res!614292) b!910264))

(assert (= (or b!910264 b!910263) bm!40311))

(assert (=> b!910262 m!844667))

(assert (=> b!910262 m!844667))

(assert (=> b!910262 m!844673))

(declare-fun m!844737 () Bool)

(assert (=> bm!40311 m!844737))

(assert (=> b!910265 m!844667))

(declare-fun m!844739 () Bool)

(assert (=> b!910265 m!844739))

(declare-fun m!844741 () Bool)

(assert (=> b!910265 m!844741))

(assert (=> b!910265 m!844667))

(declare-fun m!844743 () Bool)

(assert (=> b!910265 m!844743))

(assert (=> b!910110 d!112011))

(declare-fun condMapEmpty!30133 () Bool)

(declare-fun mapDefault!30133 () ValueCell!8987)

(assert (=> mapNonEmpty!30124 (= condMapEmpty!30133 (= mapRest!30124 ((as const (Array (_ BitVec 32) ValueCell!8987)) mapDefault!30133)))))

(declare-fun e!510362 () Bool)

(declare-fun mapRes!30133 () Bool)

(assert (=> mapNonEmpty!30124 (= tp!57825 (and e!510362 mapRes!30133))))

(declare-fun b!910272 () Bool)

(declare-fun e!510361 () Bool)

(assert (=> b!910272 (= e!510361 tp_is_empty!18937)))

(declare-fun mapIsEmpty!30133 () Bool)

(assert (=> mapIsEmpty!30133 mapRes!30133))

(declare-fun mapNonEmpty!30133 () Bool)

(declare-fun tp!57841 () Bool)

(assert (=> mapNonEmpty!30133 (= mapRes!30133 (and tp!57841 e!510361))))

(declare-fun mapRest!30133 () (Array (_ BitVec 32) ValueCell!8987))

(declare-fun mapKey!30133 () (_ BitVec 32))

(declare-fun mapValue!30133 () ValueCell!8987)

(assert (=> mapNonEmpty!30133 (= mapRest!30124 (store mapRest!30133 mapKey!30133 mapValue!30133))))

(declare-fun b!910273 () Bool)

(assert (=> b!910273 (= e!510362 tp_is_empty!18937)))

(assert (= (and mapNonEmpty!30124 condMapEmpty!30133) mapIsEmpty!30133))

(assert (= (and mapNonEmpty!30124 (not condMapEmpty!30133)) mapNonEmpty!30133))

(assert (= (and mapNonEmpty!30133 ((_ is ValueCellFull!8987) mapValue!30133)) b!910272))

(assert (= (and mapNonEmpty!30124 ((_ is ValueCellFull!8987) mapDefault!30133)) b!910273))

(declare-fun m!844745 () Bool)

(assert (=> mapNonEmpty!30133 m!844745))

(declare-fun b_lambda!13283 () Bool)

(assert (= b_lambda!13281 (or (and start!77958 b_free!16519) b_lambda!13283)))

(check-sat (not b_lambda!13283) tp_is_empty!18937 (not b!910251) (not mapNonEmpty!30133) (not b!910246) (not b!910265) (not b!910234) (not d!112007) (not bm!40311) (not b!910235) (not b!910247) (not bm!40302) (not bm!40287) (not b!910262) (not b!910176) (not b!910188) (not b!910248) (not d!112005) (not b!910186) (not b!910249) (not b_next!16519) (not bm!40308) (not bm!40304) (not b!910178) b_and!27069 (not bm!40306) (not b!910175) (not b!910233))
(check-sat b_and!27069 (not b_next!16519))
