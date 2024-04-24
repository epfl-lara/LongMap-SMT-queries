; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78068 () Bool)

(assert start!78068)

(declare-fun b_free!16459 () Bool)

(declare-fun b_next!16459 () Bool)

(assert (=> start!78068 (= b_free!16459 (not b_next!16459))))

(declare-fun tp!57642 () Bool)

(declare-fun b_and!27037 () Bool)

(assert (=> start!78068 (= tp!57642 b_and!27037)))

(declare-fun mapIsEmpty!30031 () Bool)

(declare-fun mapRes!30031 () Bool)

(assert (=> mapIsEmpty!30031 mapRes!30031))

(declare-fun b!910487 () Bool)

(declare-fun e!510467 () Bool)

(declare-fun e!510466 () Bool)

(assert (=> b!910487 (= e!510467 (and e!510466 mapRes!30031))))

(declare-fun condMapEmpty!30031 () Bool)

(declare-datatypes ((V!30135 0))(
  ( (V!30136 (val!9489 Int)) )
))
(declare-datatypes ((ValueCell!8957 0))(
  ( (ValueCellFull!8957 (v!11993 V!30135)) (EmptyCell!8957) )
))
(declare-datatypes ((array!53827 0))(
  ( (array!53828 (arr!25867 (Array (_ BitVec 32) ValueCell!8957)) (size!26327 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53827)

(declare-fun mapDefault!30031 () ValueCell!8957)

(assert (=> b!910487 (= condMapEmpty!30031 (= (arr!25867 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8957)) mapDefault!30031)))))

(declare-fun b!910488 () Bool)

(declare-fun e!510464 () Bool)

(declare-fun tp_is_empty!18877 () Bool)

(assert (=> b!910488 (= e!510464 tp_is_empty!18877)))

(declare-fun b!910489 () Bool)

(declare-fun res!614238 () Bool)

(declare-fun e!510468 () Bool)

(assert (=> b!910489 (=> (not res!614238) (not e!510468))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53829 0))(
  ( (array!53830 (arr!25868 (Array (_ BitVec 32) (_ BitVec 64))) (size!26328 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53829)

(assert (=> b!910489 (= res!614238 (and (= (size!26327 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26328 _keys!1386) (size!26327 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910490 () Bool)

(declare-fun res!614241 () Bool)

(assert (=> b!910490 (=> (not res!614241) (not e!510468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53829 (_ BitVec 32)) Bool)

(assert (=> b!910490 (= res!614241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!614243 () Bool)

(assert (=> start!78068 (=> (not res!614243) (not e!510468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78068 (= res!614243 (validMask!0 mask!1756))))

(assert (=> start!78068 e!510468))

(declare-fun array_inv!20302 (array!53827) Bool)

(assert (=> start!78068 (and (array_inv!20302 _values!1152) e!510467)))

(assert (=> start!78068 tp!57642))

(assert (=> start!78068 true))

(assert (=> start!78068 tp_is_empty!18877))

(declare-fun array_inv!20303 (array!53829) Bool)

(assert (=> start!78068 (array_inv!20303 _keys!1386)))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun b!910491 () Bool)

(assert (=> b!910491 (= e!510468 (and (= (select (arr!25868 _keys!1386) i!717) k0!1033) (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsgt #b00000000000000000000000000000000 (size!26328 _keys!1386))))))

(declare-fun mapNonEmpty!30031 () Bool)

(declare-fun tp!57643 () Bool)

(assert (=> mapNonEmpty!30031 (= mapRes!30031 (and tp!57643 e!510464))))

(declare-fun mapRest!30031 () (Array (_ BitVec 32) ValueCell!8957))

(declare-fun mapKey!30031 () (_ BitVec 32))

(declare-fun mapValue!30031 () ValueCell!8957)

(assert (=> mapNonEmpty!30031 (= (arr!25867 _values!1152) (store mapRest!30031 mapKey!30031 mapValue!30031))))

(declare-fun b!910492 () Bool)

(declare-fun res!614240 () Bool)

(assert (=> b!910492 (=> (not res!614240) (not e!510468))))

(declare-datatypes ((List!18142 0))(
  ( (Nil!18139) (Cons!18138 (h!19290 (_ BitVec 64)) (t!25715 List!18142)) )
))
(declare-fun arrayNoDuplicates!0 (array!53829 (_ BitVec 32) List!18142) Bool)

(assert (=> b!910492 (= res!614240 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18139))))

(declare-fun b!910493 () Bool)

(assert (=> b!910493 (= e!510466 tp_is_empty!18877)))

(declare-fun b!910494 () Bool)

(declare-fun res!614239 () Bool)

(assert (=> b!910494 (=> (not res!614239) (not e!510468))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30135)

(declare-fun minValue!1094 () V!30135)

(declare-datatypes ((tuple2!12322 0))(
  ( (tuple2!12323 (_1!6172 (_ BitVec 64)) (_2!6172 V!30135)) )
))
(declare-datatypes ((List!18143 0))(
  ( (Nil!18140) (Cons!18139 (h!19291 tuple2!12322) (t!25716 List!18143)) )
))
(declare-datatypes ((ListLongMap!11021 0))(
  ( (ListLongMap!11022 (toList!5526 List!18143)) )
))
(declare-fun contains!4577 (ListLongMap!11021 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2787 (array!53829 array!53827 (_ BitVec 32) (_ BitVec 32) V!30135 V!30135 (_ BitVec 32) Int) ListLongMap!11021)

(assert (=> b!910494 (= res!614239 (contains!4577 (getCurrentListMap!2787 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910495 () Bool)

(declare-fun res!614242 () Bool)

(assert (=> b!910495 (=> (not res!614242) (not e!510468))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!910495 (= res!614242 (inRange!0 i!717 mask!1756))))

(assert (= (and start!78068 res!614243) b!910489))

(assert (= (and b!910489 res!614238) b!910490))

(assert (= (and b!910490 res!614241) b!910492))

(assert (= (and b!910492 res!614240) b!910494))

(assert (= (and b!910494 res!614239) b!910495))

(assert (= (and b!910495 res!614242) b!910491))

(assert (= (and b!910487 condMapEmpty!30031) mapIsEmpty!30031))

(assert (= (and b!910487 (not condMapEmpty!30031)) mapNonEmpty!30031))

(get-info :version)

(assert (= (and mapNonEmpty!30031 ((_ is ValueCellFull!8957) mapValue!30031)) b!910488))

(assert (= (and b!910487 ((_ is ValueCellFull!8957) mapDefault!30031)) b!910493))

(assert (= start!78068 b!910487))

(declare-fun m!846087 () Bool)

(assert (=> b!910495 m!846087))

(declare-fun m!846089 () Bool)

(assert (=> mapNonEmpty!30031 m!846089))

(declare-fun m!846091 () Bool)

(assert (=> b!910490 m!846091))

(declare-fun m!846093 () Bool)

(assert (=> start!78068 m!846093))

(declare-fun m!846095 () Bool)

(assert (=> start!78068 m!846095))

(declare-fun m!846097 () Bool)

(assert (=> start!78068 m!846097))

(declare-fun m!846099 () Bool)

(assert (=> b!910491 m!846099))

(declare-fun m!846101 () Bool)

(assert (=> b!910492 m!846101))

(declare-fun m!846103 () Bool)

(assert (=> b!910494 m!846103))

(assert (=> b!910494 m!846103))

(declare-fun m!846105 () Bool)

(assert (=> b!910494 m!846105))

(check-sat (not b_next!16459) (not b!910494) (not b!910495) (not b!910490) (not mapNonEmpty!30031) tp_is_empty!18877 (not b!910492) (not start!78068) b_and!27037)
(check-sat b_and!27037 (not b_next!16459))
(get-model)

(declare-fun d!112481 () Bool)

(assert (=> d!112481 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78068 d!112481))

(declare-fun d!112483 () Bool)

(assert (=> d!112483 (= (array_inv!20302 _values!1152) (bvsge (size!26327 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78068 d!112483))

(declare-fun d!112485 () Bool)

(assert (=> d!112485 (= (array_inv!20303 _keys!1386) (bvsge (size!26328 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78068 d!112485))

(declare-fun b!910560 () Bool)

(declare-fun e!510508 () Bool)

(declare-fun e!510510 () Bool)

(assert (=> b!910560 (= e!510508 e!510510)))

(declare-fun c!95973 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!910560 (= c!95973 (validKeyInArray!0 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!910561 () Bool)

(declare-fun e!510509 () Bool)

(declare-fun contains!4579 (List!18142 (_ BitVec 64)) Bool)

(assert (=> b!910561 (= e!510509 (contains!4579 Nil!18139 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40331 () Bool)

(declare-fun call!40334 () Bool)

(assert (=> bm!40331 (= call!40334 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95973 (Cons!18138 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000) Nil!18139) Nil!18139)))))

(declare-fun b!910562 () Bool)

(assert (=> b!910562 (= e!510510 call!40334)))

(declare-fun b!910563 () Bool)

(assert (=> b!910563 (= e!510510 call!40334)))

(declare-fun d!112487 () Bool)

(declare-fun res!614287 () Bool)

(declare-fun e!510507 () Bool)

(assert (=> d!112487 (=> res!614287 e!510507)))

(assert (=> d!112487 (= res!614287 (bvsge #b00000000000000000000000000000000 (size!26328 _keys!1386)))))

(assert (=> d!112487 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18139) e!510507)))

(declare-fun b!910564 () Bool)

(assert (=> b!910564 (= e!510507 e!510508)))

(declare-fun res!614286 () Bool)

(assert (=> b!910564 (=> (not res!614286) (not e!510508))))

(assert (=> b!910564 (= res!614286 (not e!510509))))

(declare-fun res!614288 () Bool)

(assert (=> b!910564 (=> (not res!614288) (not e!510509))))

(assert (=> b!910564 (= res!614288 (validKeyInArray!0 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112487 (not res!614287)) b!910564))

(assert (= (and b!910564 res!614288) b!910561))

(assert (= (and b!910564 res!614286) b!910560))

(assert (= (and b!910560 c!95973) b!910563))

(assert (= (and b!910560 (not c!95973)) b!910562))

(assert (= (or b!910563 b!910562) bm!40331))

(declare-fun m!846147 () Bool)

(assert (=> b!910560 m!846147))

(assert (=> b!910560 m!846147))

(declare-fun m!846149 () Bool)

(assert (=> b!910560 m!846149))

(assert (=> b!910561 m!846147))

(assert (=> b!910561 m!846147))

(declare-fun m!846151 () Bool)

(assert (=> b!910561 m!846151))

(assert (=> bm!40331 m!846147))

(declare-fun m!846153 () Bool)

(assert (=> bm!40331 m!846153))

(assert (=> b!910564 m!846147))

(assert (=> b!910564 m!846147))

(assert (=> b!910564 m!846149))

(assert (=> b!910492 d!112487))

(declare-fun b!910573 () Bool)

(declare-fun e!510519 () Bool)

(declare-fun e!510517 () Bool)

(assert (=> b!910573 (= e!510519 e!510517)))

(declare-fun lt!410380 () (_ BitVec 64))

(assert (=> b!910573 (= lt!410380 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30848 0))(
  ( (Unit!30849) )
))
(declare-fun lt!410382 () Unit!30848)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!53829 (_ BitVec 64) (_ BitVec 32)) Unit!30848)

(assert (=> b!910573 (= lt!410382 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410380 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!53829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!910573 (arrayContainsKey!0 _keys!1386 lt!410380 #b00000000000000000000000000000000)))

(declare-fun lt!410381 () Unit!30848)

(assert (=> b!910573 (= lt!410381 lt!410382)))

(declare-fun res!614294 () Bool)

(declare-datatypes ((SeekEntryResult!8918 0))(
  ( (MissingZero!8918 (index!38043 (_ BitVec 32))) (Found!8918 (index!38044 (_ BitVec 32))) (Intermediate!8918 (undefined!9730 Bool) (index!38045 (_ BitVec 32)) (x!77691 (_ BitVec 32))) (Undefined!8918) (MissingVacant!8918 (index!38046 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!53829 (_ BitVec 32)) SeekEntryResult!8918)

(assert (=> b!910573 (= res!614294 (= (seekEntryOrOpen!0 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8918 #b00000000000000000000000000000000)))))

(assert (=> b!910573 (=> (not res!614294) (not e!510517))))

(declare-fun b!910574 () Bool)

(declare-fun call!40337 () Bool)

(assert (=> b!910574 (= e!510519 call!40337)))

(declare-fun bm!40334 () Bool)

(assert (=> bm!40334 (= call!40337 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun d!112489 () Bool)

(declare-fun res!614293 () Bool)

(declare-fun e!510518 () Bool)

(assert (=> d!112489 (=> res!614293 e!510518)))

(assert (=> d!112489 (= res!614293 (bvsge #b00000000000000000000000000000000 (size!26328 _keys!1386)))))

(assert (=> d!112489 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!510518)))

(declare-fun b!910575 () Bool)

(assert (=> b!910575 (= e!510517 call!40337)))

(declare-fun b!910576 () Bool)

(assert (=> b!910576 (= e!510518 e!510519)))

(declare-fun c!95976 () Bool)

(assert (=> b!910576 (= c!95976 (validKeyInArray!0 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112489 (not res!614293)) b!910576))

(assert (= (and b!910576 c!95976) b!910573))

(assert (= (and b!910576 (not c!95976)) b!910574))

(assert (= (and b!910573 res!614294) b!910575))

(assert (= (or b!910575 b!910574) bm!40334))

(assert (=> b!910573 m!846147))

(declare-fun m!846155 () Bool)

(assert (=> b!910573 m!846155))

(declare-fun m!846157 () Bool)

(assert (=> b!910573 m!846157))

(assert (=> b!910573 m!846147))

(declare-fun m!846159 () Bool)

(assert (=> b!910573 m!846159))

(declare-fun m!846161 () Bool)

(assert (=> bm!40334 m!846161))

(assert (=> b!910576 m!846147))

(assert (=> b!910576 m!846147))

(assert (=> b!910576 m!846149))

(assert (=> b!910490 d!112489))

(declare-fun d!112491 () Bool)

(declare-fun e!510524 () Bool)

(assert (=> d!112491 e!510524))

(declare-fun res!614297 () Bool)

(assert (=> d!112491 (=> res!614297 e!510524)))

(declare-fun lt!410393 () Bool)

(assert (=> d!112491 (= res!614297 (not lt!410393))))

(declare-fun lt!410391 () Bool)

(assert (=> d!112491 (= lt!410393 lt!410391)))

(declare-fun lt!410394 () Unit!30848)

(declare-fun e!510525 () Unit!30848)

(assert (=> d!112491 (= lt!410394 e!510525)))

(declare-fun c!95979 () Bool)

(assert (=> d!112491 (= c!95979 lt!410391)))

(declare-fun containsKey!439 (List!18143 (_ BitVec 64)) Bool)

(assert (=> d!112491 (= lt!410391 (containsKey!439 (toList!5526 (getCurrentListMap!2787 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112491 (= (contains!4577 (getCurrentListMap!2787 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410393)))

(declare-fun b!910583 () Bool)

(declare-fun lt!410392 () Unit!30848)

(assert (=> b!910583 (= e!510525 lt!410392)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!333 (List!18143 (_ BitVec 64)) Unit!30848)

(assert (=> b!910583 (= lt!410392 (lemmaContainsKeyImpliesGetValueByKeyDefined!333 (toList!5526 (getCurrentListMap!2787 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!474 0))(
  ( (Some!473 (v!11996 V!30135)) (None!472) )
))
(declare-fun isDefined!341 (Option!474) Bool)

(declare-fun getValueByKey!468 (List!18143 (_ BitVec 64)) Option!474)

(assert (=> b!910583 (isDefined!341 (getValueByKey!468 (toList!5526 (getCurrentListMap!2787 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!910584 () Bool)

(declare-fun Unit!30850 () Unit!30848)

(assert (=> b!910584 (= e!510525 Unit!30850)))

(declare-fun b!910585 () Bool)

(assert (=> b!910585 (= e!510524 (isDefined!341 (getValueByKey!468 (toList!5526 (getCurrentListMap!2787 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112491 c!95979) b!910583))

(assert (= (and d!112491 (not c!95979)) b!910584))

(assert (= (and d!112491 (not res!614297)) b!910585))

(declare-fun m!846163 () Bool)

(assert (=> d!112491 m!846163))

(declare-fun m!846165 () Bool)

(assert (=> b!910583 m!846165))

(declare-fun m!846167 () Bool)

(assert (=> b!910583 m!846167))

(assert (=> b!910583 m!846167))

(declare-fun m!846169 () Bool)

(assert (=> b!910583 m!846169))

(assert (=> b!910585 m!846167))

(assert (=> b!910585 m!846167))

(assert (=> b!910585 m!846169))

(assert (=> b!910494 d!112491))

(declare-fun b!910628 () Bool)

(declare-fun e!510562 () Bool)

(assert (=> b!910628 (= e!510562 (validKeyInArray!0 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!910629 () Bool)

(declare-fun e!510553 () Bool)

(declare-fun lt!410453 () ListLongMap!11021)

(declare-fun apply!522 (ListLongMap!11021 (_ BitVec 64)) V!30135)

(assert (=> b!910629 (= e!510553 (= (apply!522 lt!410453 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!910630 () Bool)

(declare-fun e!510561 () Bool)

(assert (=> b!910630 (= e!510561 (= (apply!522 lt!410453 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!910631 () Bool)

(declare-fun e!510554 () ListLongMap!11021)

(declare-fun e!510556 () ListLongMap!11021)

(assert (=> b!910631 (= e!510554 e!510556)))

(declare-fun c!95997 () Bool)

(assert (=> b!910631 (= c!95997 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!910632 () Bool)

(declare-fun e!510564 () Bool)

(declare-fun e!510555 () Bool)

(assert (=> b!910632 (= e!510564 e!510555)))

(declare-fun res!614317 () Bool)

(assert (=> b!910632 (=> (not res!614317) (not e!510555))))

(assert (=> b!910632 (= res!614317 (contains!4577 lt!410453 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!910632 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26328 _keys!1386)))))

(declare-fun b!910633 () Bool)

(declare-fun e!510563 () Bool)

(assert (=> b!910633 (= e!510563 (validKeyInArray!0 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!910634 () Bool)

(declare-fun call!40356 () ListLongMap!11021)

(declare-fun +!2613 (ListLongMap!11021 tuple2!12322) ListLongMap!11021)

(assert (=> b!910634 (= e!510554 (+!2613 call!40356 (tuple2!12323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun bm!40349 () Bool)

(declare-fun call!40355 () ListLongMap!11021)

(declare-fun call!40352 () ListLongMap!11021)

(assert (=> bm!40349 (= call!40355 call!40352)))

(declare-fun b!910635 () Bool)

(declare-fun call!40358 () ListLongMap!11021)

(assert (=> b!910635 (= e!510556 call!40358)))

(declare-fun bm!40350 () Bool)

(declare-fun call!40353 () ListLongMap!11021)

(assert (=> bm!40350 (= call!40352 call!40353)))

(declare-fun b!910636 () Bool)

(declare-fun e!510552 () Unit!30848)

(declare-fun Unit!30851 () Unit!30848)

(assert (=> b!910636 (= e!510552 Unit!30851)))

(declare-fun b!910637 () Bool)

(declare-fun e!510559 () ListLongMap!11021)

(assert (=> b!910637 (= e!510559 call!40358)))

(declare-fun b!910638 () Bool)

(declare-fun res!614316 () Bool)

(declare-fun e!510557 () Bool)

(assert (=> b!910638 (=> (not res!614316) (not e!510557))))

(declare-fun e!510560 () Bool)

(assert (=> b!910638 (= res!614316 e!510560)))

(declare-fun c!95994 () Bool)

(assert (=> b!910638 (= c!95994 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40351 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3334 (array!53829 array!53827 (_ BitVec 32) (_ BitVec 32) V!30135 V!30135 (_ BitVec 32) Int) ListLongMap!11021)

(assert (=> bm!40351 (= call!40353 (getCurrentListMapNoExtraKeys!3334 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun bm!40352 () Bool)

(assert (=> bm!40352 (= call!40358 call!40356)))

(declare-fun b!910640 () Bool)

(assert (=> b!910640 (= e!510560 e!510553)))

(declare-fun res!614324 () Bool)

(declare-fun call!40354 () Bool)

(assert (=> b!910640 (= res!614324 call!40354)))

(assert (=> b!910640 (=> (not res!614324) (not e!510553))))

(declare-fun b!910641 () Bool)

(declare-fun res!614323 () Bool)

(assert (=> b!910641 (=> (not res!614323) (not e!510557))))

(assert (=> b!910641 (= res!614323 e!510564)))

(declare-fun res!614322 () Bool)

(assert (=> b!910641 (=> res!614322 e!510564)))

(assert (=> b!910641 (= res!614322 (not e!510563))))

(declare-fun res!614318 () Bool)

(assert (=> b!910641 (=> (not res!614318) (not e!510563))))

(assert (=> b!910641 (= res!614318 (bvslt #b00000000000000000000000000000000 (size!26328 _keys!1386)))))

(declare-fun b!910642 () Bool)

(declare-fun e!510558 () Bool)

(assert (=> b!910642 (= e!510558 e!510561)))

(declare-fun res!614319 () Bool)

(declare-fun call!40357 () Bool)

(assert (=> b!910642 (= res!614319 call!40357)))

(assert (=> b!910642 (=> (not res!614319) (not e!510561))))

(declare-fun b!910643 () Bool)

(assert (=> b!910643 (= e!510558 (not call!40357))))

(declare-fun b!910644 () Bool)

(declare-fun c!95992 () Bool)

(assert (=> b!910644 (= c!95992 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!910644 (= e!510556 e!510559)))

(declare-fun b!910645 () Bool)

(assert (=> b!910645 (= e!510557 e!510558)))

(declare-fun c!95993 () Bool)

(assert (=> b!910645 (= c!95993 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40353 () Bool)

(assert (=> bm!40353 (= call!40357 (contains!4577 lt!410453 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!910646 () Bool)

(declare-fun get!13624 (ValueCell!8957 V!30135) V!30135)

(declare-fun dynLambda!1403 (Int (_ BitVec 64)) V!30135)

(assert (=> b!910646 (= e!510555 (= (apply!522 lt!410453 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000)) (get!13624 (select (arr!25867 _values!1152) #b00000000000000000000000000000000) (dynLambda!1403 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!910646 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26327 _values!1152)))))

(assert (=> b!910646 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26328 _keys!1386)))))

(declare-fun b!910647 () Bool)

(declare-fun lt!410460 () Unit!30848)

(assert (=> b!910647 (= e!510552 lt!410460)))

(declare-fun lt!410448 () ListLongMap!11021)

(assert (=> b!910647 (= lt!410448 (getCurrentListMapNoExtraKeys!3334 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410446 () (_ BitVec 64))

(assert (=> b!910647 (= lt!410446 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410439 () (_ BitVec 64))

(assert (=> b!910647 (= lt!410439 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410451 () Unit!30848)

(declare-fun addStillContains!344 (ListLongMap!11021 (_ BitVec 64) V!30135 (_ BitVec 64)) Unit!30848)

(assert (=> b!910647 (= lt!410451 (addStillContains!344 lt!410448 lt!410446 zeroValue!1094 lt!410439))))

(assert (=> b!910647 (contains!4577 (+!2613 lt!410448 (tuple2!12323 lt!410446 zeroValue!1094)) lt!410439)))

(declare-fun lt!410441 () Unit!30848)

(assert (=> b!910647 (= lt!410441 lt!410451)))

(declare-fun lt!410450 () ListLongMap!11021)

(assert (=> b!910647 (= lt!410450 (getCurrentListMapNoExtraKeys!3334 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410449 () (_ BitVec 64))

(assert (=> b!910647 (= lt!410449 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410456 () (_ BitVec 64))

(assert (=> b!910647 (= lt!410456 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410445 () Unit!30848)

(declare-fun addApplyDifferent!344 (ListLongMap!11021 (_ BitVec 64) V!30135 (_ BitVec 64)) Unit!30848)

(assert (=> b!910647 (= lt!410445 (addApplyDifferent!344 lt!410450 lt!410449 minValue!1094 lt!410456))))

(assert (=> b!910647 (= (apply!522 (+!2613 lt!410450 (tuple2!12323 lt!410449 minValue!1094)) lt!410456) (apply!522 lt!410450 lt!410456))))

(declare-fun lt!410455 () Unit!30848)

(assert (=> b!910647 (= lt!410455 lt!410445)))

(declare-fun lt!410447 () ListLongMap!11021)

(assert (=> b!910647 (= lt!410447 (getCurrentListMapNoExtraKeys!3334 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410440 () (_ BitVec 64))

(assert (=> b!910647 (= lt!410440 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410457 () (_ BitVec 64))

(assert (=> b!910647 (= lt!410457 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410443 () Unit!30848)

(assert (=> b!910647 (= lt!410443 (addApplyDifferent!344 lt!410447 lt!410440 zeroValue!1094 lt!410457))))

(assert (=> b!910647 (= (apply!522 (+!2613 lt!410447 (tuple2!12323 lt!410440 zeroValue!1094)) lt!410457) (apply!522 lt!410447 lt!410457))))

(declare-fun lt!410459 () Unit!30848)

(assert (=> b!910647 (= lt!410459 lt!410443)))

(declare-fun lt!410458 () ListLongMap!11021)

(assert (=> b!910647 (= lt!410458 (getCurrentListMapNoExtraKeys!3334 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410452 () (_ BitVec 64))

(assert (=> b!910647 (= lt!410452 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410454 () (_ BitVec 64))

(assert (=> b!910647 (= lt!410454 (select (arr!25868 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!910647 (= lt!410460 (addApplyDifferent!344 lt!410458 lt!410452 minValue!1094 lt!410454))))

(assert (=> b!910647 (= (apply!522 (+!2613 lt!410458 (tuple2!12323 lt!410452 minValue!1094)) lt!410454) (apply!522 lt!410458 lt!410454))))

(declare-fun d!112493 () Bool)

(assert (=> d!112493 e!510557))

(declare-fun res!614321 () Bool)

(assert (=> d!112493 (=> (not res!614321) (not e!510557))))

(assert (=> d!112493 (= res!614321 (or (bvsge #b00000000000000000000000000000000 (size!26328 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26328 _keys!1386)))))))

(declare-fun lt!410442 () ListLongMap!11021)

(assert (=> d!112493 (= lt!410453 lt!410442)))

(declare-fun lt!410444 () Unit!30848)

(assert (=> d!112493 (= lt!410444 e!510552)))

(declare-fun c!95996 () Bool)

(assert (=> d!112493 (= c!95996 e!510562)))

(declare-fun res!614320 () Bool)

(assert (=> d!112493 (=> (not res!614320) (not e!510562))))

(assert (=> d!112493 (= res!614320 (bvslt #b00000000000000000000000000000000 (size!26328 _keys!1386)))))

(assert (=> d!112493 (= lt!410442 e!510554)))

(declare-fun c!95995 () Bool)

(assert (=> d!112493 (= c!95995 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112493 (validMask!0 mask!1756)))

(assert (=> d!112493 (= (getCurrentListMap!2787 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410453)))

(declare-fun b!910639 () Bool)

(assert (=> b!910639 (= e!510560 (not call!40354))))

(declare-fun bm!40354 () Bool)

(assert (=> bm!40354 (= call!40354 (contains!4577 lt!410453 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!910648 () Bool)

(assert (=> b!910648 (= e!510559 call!40355)))

(declare-fun bm!40355 () Bool)

(assert (=> bm!40355 (= call!40356 (+!2613 (ite c!95995 call!40353 (ite c!95997 call!40352 call!40355)) (ite (or c!95995 c!95997) (tuple2!12323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(assert (= (and d!112493 c!95995) b!910634))

(assert (= (and d!112493 (not c!95995)) b!910631))

(assert (= (and b!910631 c!95997) b!910635))

(assert (= (and b!910631 (not c!95997)) b!910644))

(assert (= (and b!910644 c!95992) b!910637))

(assert (= (and b!910644 (not c!95992)) b!910648))

(assert (= (or b!910637 b!910648) bm!40349))

(assert (= (or b!910635 bm!40349) bm!40350))

(assert (= (or b!910635 b!910637) bm!40352))

(assert (= (or b!910634 bm!40350) bm!40351))

(assert (= (or b!910634 bm!40352) bm!40355))

(assert (= (and d!112493 res!614320) b!910628))

(assert (= (and d!112493 c!95996) b!910647))

(assert (= (and d!112493 (not c!95996)) b!910636))

(assert (= (and d!112493 res!614321) b!910641))

(assert (= (and b!910641 res!614318) b!910633))

(assert (= (and b!910641 (not res!614322)) b!910632))

(assert (= (and b!910632 res!614317) b!910646))

(assert (= (and b!910641 res!614323) b!910638))

(assert (= (and b!910638 c!95994) b!910640))

(assert (= (and b!910638 (not c!95994)) b!910639))

(assert (= (and b!910640 res!614324) b!910629))

(assert (= (or b!910640 b!910639) bm!40354))

(assert (= (and b!910638 res!614316) b!910645))

(assert (= (and b!910645 c!95993) b!910642))

(assert (= (and b!910645 (not c!95993)) b!910643))

(assert (= (and b!910642 res!614319) b!910630))

(assert (= (or b!910642 b!910643) bm!40353))

(declare-fun b_lambda!13309 () Bool)

(assert (=> (not b_lambda!13309) (not b!910646)))

(declare-fun t!25719 () Bool)

(declare-fun tb!5425 () Bool)

(assert (=> (and start!78068 (= defaultEntry!1160 defaultEntry!1160) t!25719) tb!5425))

(declare-fun result!10655 () Bool)

(assert (=> tb!5425 (= result!10655 tp_is_empty!18877)))

(assert (=> b!910646 t!25719))

(declare-fun b_and!27043 () Bool)

(assert (= b_and!27037 (and (=> t!25719 result!10655) b_and!27043)))

(declare-fun m!846171 () Bool)

(assert (=> bm!40351 m!846171))

(assert (=> b!910632 m!846147))

(assert (=> b!910632 m!846147))

(declare-fun m!846173 () Bool)

(assert (=> b!910632 m!846173))

(declare-fun m!846175 () Bool)

(assert (=> bm!40354 m!846175))

(declare-fun m!846177 () Bool)

(assert (=> b!910629 m!846177))

(assert (=> d!112493 m!846093))

(assert (=> b!910646 m!846147))

(declare-fun m!846179 () Bool)

(assert (=> b!910646 m!846179))

(declare-fun m!846181 () Bool)

(assert (=> b!910646 m!846181))

(declare-fun m!846183 () Bool)

(assert (=> b!910646 m!846183))

(assert (=> b!910646 m!846183))

(assert (=> b!910646 m!846181))

(declare-fun m!846185 () Bool)

(assert (=> b!910646 m!846185))

(assert (=> b!910646 m!846147))

(assert (=> b!910633 m!846147))

(assert (=> b!910633 m!846147))

(assert (=> b!910633 m!846149))

(declare-fun m!846187 () Bool)

(assert (=> b!910630 m!846187))

(declare-fun m!846189 () Bool)

(assert (=> b!910634 m!846189))

(assert (=> b!910628 m!846147))

(assert (=> b!910628 m!846147))

(assert (=> b!910628 m!846149))

(declare-fun m!846191 () Bool)

(assert (=> bm!40355 m!846191))

(declare-fun m!846193 () Bool)

(assert (=> b!910647 m!846193))

(declare-fun m!846195 () Bool)

(assert (=> b!910647 m!846195))

(declare-fun m!846197 () Bool)

(assert (=> b!910647 m!846197))

(declare-fun m!846199 () Bool)

(assert (=> b!910647 m!846199))

(declare-fun m!846201 () Bool)

(assert (=> b!910647 m!846201))

(assert (=> b!910647 m!846171))

(declare-fun m!846203 () Bool)

(assert (=> b!910647 m!846203))

(declare-fun m!846205 () Bool)

(assert (=> b!910647 m!846205))

(declare-fun m!846207 () Bool)

(assert (=> b!910647 m!846207))

(assert (=> b!910647 m!846205))

(declare-fun m!846209 () Bool)

(assert (=> b!910647 m!846209))

(declare-fun m!846211 () Bool)

(assert (=> b!910647 m!846211))

(declare-fun m!846213 () Bool)

(assert (=> b!910647 m!846213))

(declare-fun m!846215 () Bool)

(assert (=> b!910647 m!846215))

(assert (=> b!910647 m!846193))

(declare-fun m!846217 () Bool)

(assert (=> b!910647 m!846217))

(assert (=> b!910647 m!846213))

(assert (=> b!910647 m!846203))

(declare-fun m!846219 () Bool)

(assert (=> b!910647 m!846219))

(declare-fun m!846221 () Bool)

(assert (=> b!910647 m!846221))

(assert (=> b!910647 m!846147))

(declare-fun m!846223 () Bool)

(assert (=> bm!40353 m!846223))

(assert (=> b!910494 d!112493))

(declare-fun d!112495 () Bool)

(assert (=> d!112495 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!910495 d!112495))

(declare-fun b!910657 () Bool)

(declare-fun e!510569 () Bool)

(assert (=> b!910657 (= e!510569 tp_is_empty!18877)))

(declare-fun mapIsEmpty!30040 () Bool)

(declare-fun mapRes!30040 () Bool)

(assert (=> mapIsEmpty!30040 mapRes!30040))

(declare-fun b!910658 () Bool)

(declare-fun e!510570 () Bool)

(assert (=> b!910658 (= e!510570 tp_is_empty!18877)))

(declare-fun mapNonEmpty!30040 () Bool)

(declare-fun tp!57658 () Bool)

(assert (=> mapNonEmpty!30040 (= mapRes!30040 (and tp!57658 e!510569))))

(declare-fun mapValue!30040 () ValueCell!8957)

(declare-fun mapKey!30040 () (_ BitVec 32))

(declare-fun mapRest!30040 () (Array (_ BitVec 32) ValueCell!8957))

(assert (=> mapNonEmpty!30040 (= mapRest!30031 (store mapRest!30040 mapKey!30040 mapValue!30040))))

(declare-fun condMapEmpty!30040 () Bool)

(declare-fun mapDefault!30040 () ValueCell!8957)

(assert (=> mapNonEmpty!30031 (= condMapEmpty!30040 (= mapRest!30031 ((as const (Array (_ BitVec 32) ValueCell!8957)) mapDefault!30040)))))

(assert (=> mapNonEmpty!30031 (= tp!57643 (and e!510570 mapRes!30040))))

(assert (= (and mapNonEmpty!30031 condMapEmpty!30040) mapIsEmpty!30040))

(assert (= (and mapNonEmpty!30031 (not condMapEmpty!30040)) mapNonEmpty!30040))

(assert (= (and mapNonEmpty!30040 ((_ is ValueCellFull!8957) mapValue!30040)) b!910657))

(assert (= (and mapNonEmpty!30031 ((_ is ValueCellFull!8957) mapDefault!30040)) b!910658))

(declare-fun m!846225 () Bool)

(assert (=> mapNonEmpty!30040 m!846225))

(declare-fun b_lambda!13311 () Bool)

(assert (= b_lambda!13309 (or (and start!78068 b_free!16459) b_lambda!13311)))

(check-sat (not b_next!16459) (not bm!40353) b_and!27043 (not b!910632) (not b!910629) (not b!910634) (not b!910564) (not b!910646) (not b!910560) tp_is_empty!18877 (not b!910630) (not b!910576) (not b!910628) (not b!910561) (not b!910647) (not bm!40331) (not bm!40355) (not b!910573) (not d!112493) (not b_lambda!13311) (not bm!40354) (not b!910585) (not mapNonEmpty!30040) (not bm!40351) (not bm!40334) (not d!112491) (not b!910583) (not b!910633))
(check-sat b_and!27043 (not b_next!16459))
