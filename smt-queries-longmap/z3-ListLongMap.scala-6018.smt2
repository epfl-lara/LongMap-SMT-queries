; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78144 () Bool)

(assert start!78144)

(declare-fun b_free!16519 () Bool)

(declare-fun b_next!16519 () Bool)

(assert (=> start!78144 (= b_free!16519 (not b_next!16519))))

(declare-fun tp!57826 () Bool)

(declare-fun b_and!27099 () Bool)

(assert (=> start!78144 (= tp!57826 b_and!27099)))

(declare-fun b!911244 () Bool)

(declare-fun e!510990 () Bool)

(declare-fun tp_is_empty!18937 () Bool)

(assert (=> b!911244 (= e!510990 tp_is_empty!18937)))

(declare-fun b!911245 () Bool)

(declare-fun e!510989 () Bool)

(assert (=> b!911245 (= e!510989 tp_is_empty!18937)))

(declare-fun res!614662 () Bool)

(declare-fun e!510986 () Bool)

(assert (=> start!78144 (=> (not res!614662) (not e!510986))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78144 (= res!614662 (validMask!0 mask!1756))))

(assert (=> start!78144 e!510986))

(declare-datatypes ((V!30215 0))(
  ( (V!30216 (val!9519 Int)) )
))
(declare-datatypes ((ValueCell!8987 0))(
  ( (ValueCellFull!8987 (v!12024 V!30215)) (EmptyCell!8987) )
))
(declare-datatypes ((array!53943 0))(
  ( (array!53944 (arr!25924 (Array (_ BitVec 32) ValueCell!8987)) (size!26384 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53943)

(declare-fun e!510988 () Bool)

(declare-fun array_inv!20342 (array!53943) Bool)

(assert (=> start!78144 (and (array_inv!20342 _values!1152) e!510988)))

(assert (=> start!78144 tp!57826))

(assert (=> start!78144 true))

(assert (=> start!78144 tp_is_empty!18937))

(declare-datatypes ((array!53945 0))(
  ( (array!53946 (arr!25925 (Array (_ BitVec 32) (_ BitVec 64))) (size!26385 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53945)

(declare-fun array_inv!20343 (array!53945) Bool)

(assert (=> start!78144 (array_inv!20343 _keys!1386)))

(declare-fun mapIsEmpty!30124 () Bool)

(declare-fun mapRes!30124 () Bool)

(assert (=> mapIsEmpty!30124 mapRes!30124))

(declare-fun b!911246 () Bool)

(declare-fun res!614665 () Bool)

(assert (=> b!911246 (=> (not res!614665) (not e!510986))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911246 (= res!614665 (and (= (size!26384 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26385 _keys!1386) (size!26384 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun b!911247 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!911247 (= e!510986 (and (= (select (arr!25925 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsgt #b00000000000000000000000000000000 (size!26385 _keys!1386))))))

(declare-fun b!911248 () Bool)

(declare-fun res!614663 () Bool)

(assert (=> b!911248 (=> (not res!614663) (not e!510986))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!911248 (= res!614663 (inRange!0 i!717 mask!1756))))

(declare-fun b!911249 () Bool)

(assert (=> b!911249 (= e!510988 (and e!510989 mapRes!30124))))

(declare-fun condMapEmpty!30124 () Bool)

(declare-fun mapDefault!30124 () ValueCell!8987)

(assert (=> b!911249 (= condMapEmpty!30124 (= (arr!25924 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8987)) mapDefault!30124)))))

(declare-fun mapNonEmpty!30124 () Bool)

(declare-fun tp!57825 () Bool)

(assert (=> mapNonEmpty!30124 (= mapRes!30124 (and tp!57825 e!510990))))

(declare-fun mapKey!30124 () (_ BitVec 32))

(declare-fun mapValue!30124 () ValueCell!8987)

(declare-fun mapRest!30124 () (Array (_ BitVec 32) ValueCell!8987))

(assert (=> mapNonEmpty!30124 (= (arr!25924 _values!1152) (store mapRest!30124 mapKey!30124 mapValue!30124))))

(declare-fun b!911250 () Bool)

(declare-fun res!614661 () Bool)

(assert (=> b!911250 (=> (not res!614661) (not e!510986))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30215)

(declare-fun minValue!1094 () V!30215)

(declare-datatypes ((tuple2!12360 0))(
  ( (tuple2!12361 (_1!6191 (_ BitVec 64)) (_2!6191 V!30215)) )
))
(declare-datatypes ((List!18180 0))(
  ( (Nil!18177) (Cons!18176 (h!19328 tuple2!12360) (t!25755 List!18180)) )
))
(declare-datatypes ((ListLongMap!11059 0))(
  ( (ListLongMap!11060 (toList!5545 List!18180)) )
))
(declare-fun contains!4597 (ListLongMap!11059 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2806 (array!53945 array!53943 (_ BitVec 32) (_ BitVec 32) V!30215 V!30215 (_ BitVec 32) Int) ListLongMap!11059)

(assert (=> b!911250 (= res!614661 (contains!4597 (getCurrentListMap!2806 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911251 () Bool)

(declare-fun res!614664 () Bool)

(assert (=> b!911251 (=> (not res!614664) (not e!510986))))

(declare-datatypes ((List!18181 0))(
  ( (Nil!18178) (Cons!18177 (h!19329 (_ BitVec 64)) (t!25756 List!18181)) )
))
(declare-fun arrayNoDuplicates!0 (array!53945 (_ BitVec 32) List!18181) Bool)

(assert (=> b!911251 (= res!614664 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18178))))

(declare-fun b!911252 () Bool)

(declare-fun res!614666 () Bool)

(assert (=> b!911252 (=> (not res!614666) (not e!510986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53945 (_ BitVec 32)) Bool)

(assert (=> b!911252 (= res!614666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78144 res!614662) b!911246))

(assert (= (and b!911246 res!614665) b!911252))

(assert (= (and b!911252 res!614666) b!911251))

(assert (= (and b!911251 res!614664) b!911250))

(assert (= (and b!911250 res!614661) b!911248))

(assert (= (and b!911248 res!614663) b!911247))

(assert (= (and b!911249 condMapEmpty!30124) mapIsEmpty!30124))

(assert (= (and b!911249 (not condMapEmpty!30124)) mapNonEmpty!30124))

(get-info :version)

(assert (= (and mapNonEmpty!30124 ((_ is ValueCellFull!8987) mapValue!30124)) b!911244))

(assert (= (and b!911249 ((_ is ValueCellFull!8987) mapDefault!30124)) b!911245))

(assert (= start!78144 b!911249))

(declare-fun m!846659 () Bool)

(assert (=> b!911248 m!846659))

(declare-fun m!846661 () Bool)

(assert (=> mapNonEmpty!30124 m!846661))

(declare-fun m!846663 () Bool)

(assert (=> b!911247 m!846663))

(declare-fun m!846665 () Bool)

(assert (=> start!78144 m!846665))

(declare-fun m!846667 () Bool)

(assert (=> start!78144 m!846667))

(declare-fun m!846669 () Bool)

(assert (=> start!78144 m!846669))

(declare-fun m!846671 () Bool)

(assert (=> b!911252 m!846671))

(declare-fun m!846673 () Bool)

(assert (=> b!911250 m!846673))

(assert (=> b!911250 m!846673))

(declare-fun m!846675 () Bool)

(assert (=> b!911250 m!846675))

(declare-fun m!846677 () Bool)

(assert (=> b!911251 m!846677))

(check-sat (not b_next!16519) tp_is_empty!18937 (not b!911251) (not b!911248) b_and!27099 (not b!911252) (not start!78144) (not b!911250) (not mapNonEmpty!30124))
(check-sat b_and!27099 (not b_next!16519))
(get-model)

(declare-fun d!112517 () Bool)

(assert (=> d!112517 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!911248 d!112517))

(declare-fun d!112519 () Bool)

(declare-fun res!614707 () Bool)

(declare-fun e!511029 () Bool)

(assert (=> d!112519 (=> res!614707 e!511029)))

(assert (=> d!112519 (= res!614707 (bvsge #b00000000000000000000000000000000 (size!26385 _keys!1386)))))

(assert (=> d!112519 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!511029)))

(declare-fun b!911315 () Bool)

(declare-fun e!511027 () Bool)

(declare-fun call!40361 () Bool)

(assert (=> b!911315 (= e!511027 call!40361)))

(declare-fun bm!40358 () Bool)

(assert (=> bm!40358 (= call!40361 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!911316 () Bool)

(declare-fun e!511028 () Bool)

(assert (=> b!911316 (= e!511028 call!40361)))

(declare-fun b!911317 () Bool)

(assert (=> b!911317 (= e!511029 e!511028)))

(declare-fun c!96000 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!911317 (= c!96000 (validKeyInArray!0 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!911318 () Bool)

(assert (=> b!911318 (= e!511028 e!511027)))

(declare-fun lt!410550 () (_ BitVec 64))

(assert (=> b!911318 (= lt!410550 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30852 0))(
  ( (Unit!30853) )
))
(declare-fun lt!410549 () Unit!30852)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!53945 (_ BitVec 64) (_ BitVec 32)) Unit!30852)

(assert (=> b!911318 (= lt!410549 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410550 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!53945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!911318 (arrayContainsKey!0 _keys!1386 lt!410550 #b00000000000000000000000000000000)))

(declare-fun lt!410548 () Unit!30852)

(assert (=> b!911318 (= lt!410548 lt!410549)))

(declare-fun res!614708 () Bool)

(declare-datatypes ((SeekEntryResult!8919 0))(
  ( (MissingZero!8919 (index!38047 (_ BitVec 32))) (Found!8919 (index!38048 (_ BitVec 32))) (Intermediate!8919 (undefined!9731 Bool) (index!38049 (_ BitVec 32)) (x!77782 (_ BitVec 32))) (Undefined!8919) (MissingVacant!8919 (index!38050 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!53945 (_ BitVec 32)) SeekEntryResult!8919)

(assert (=> b!911318 (= res!614708 (= (seekEntryOrOpen!0 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8919 #b00000000000000000000000000000000)))))

(assert (=> b!911318 (=> (not res!614708) (not e!511027))))

(assert (= (and d!112519 (not res!614707)) b!911317))

(assert (= (and b!911317 c!96000) b!911318))

(assert (= (and b!911317 (not c!96000)) b!911316))

(assert (= (and b!911318 res!614708) b!911315))

(assert (= (or b!911315 b!911316) bm!40358))

(declare-fun m!846719 () Bool)

(assert (=> bm!40358 m!846719))

(declare-fun m!846721 () Bool)

(assert (=> b!911317 m!846721))

(assert (=> b!911317 m!846721))

(declare-fun m!846723 () Bool)

(assert (=> b!911317 m!846723))

(assert (=> b!911318 m!846721))

(declare-fun m!846725 () Bool)

(assert (=> b!911318 m!846725))

(declare-fun m!846727 () Bool)

(assert (=> b!911318 m!846727))

(assert (=> b!911318 m!846721))

(declare-fun m!846729 () Bool)

(assert (=> b!911318 m!846729))

(assert (=> b!911252 d!112519))

(declare-fun b!911329 () Bool)

(declare-fun e!511040 () Bool)

(declare-fun e!511041 () Bool)

(assert (=> b!911329 (= e!511040 e!511041)))

(declare-fun c!96003 () Bool)

(assert (=> b!911329 (= c!96003 (validKeyInArray!0 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!911330 () Bool)

(declare-fun call!40364 () Bool)

(assert (=> b!911330 (= e!511041 call!40364)))

(declare-fun bm!40361 () Bool)

(assert (=> bm!40361 (= call!40364 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!96003 (Cons!18177 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000) Nil!18178) Nil!18178)))))

(declare-fun b!911331 () Bool)

(assert (=> b!911331 (= e!511041 call!40364)))

(declare-fun b!911332 () Bool)

(declare-fun e!511038 () Bool)

(declare-fun contains!4599 (List!18181 (_ BitVec 64)) Bool)

(assert (=> b!911332 (= e!511038 (contains!4599 Nil!18178 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!911333 () Bool)

(declare-fun e!511039 () Bool)

(assert (=> b!911333 (= e!511039 e!511040)))

(declare-fun res!614716 () Bool)

(assert (=> b!911333 (=> (not res!614716) (not e!511040))))

(assert (=> b!911333 (= res!614716 (not e!511038))))

(declare-fun res!614717 () Bool)

(assert (=> b!911333 (=> (not res!614717) (not e!511038))))

(assert (=> b!911333 (= res!614717 (validKeyInArray!0 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun d!112521 () Bool)

(declare-fun res!614715 () Bool)

(assert (=> d!112521 (=> res!614715 e!511039)))

(assert (=> d!112521 (= res!614715 (bvsge #b00000000000000000000000000000000 (size!26385 _keys!1386)))))

(assert (=> d!112521 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18178) e!511039)))

(assert (= (and d!112521 (not res!614715)) b!911333))

(assert (= (and b!911333 res!614717) b!911332))

(assert (= (and b!911333 res!614716) b!911329))

(assert (= (and b!911329 c!96003) b!911331))

(assert (= (and b!911329 (not c!96003)) b!911330))

(assert (= (or b!911331 b!911330) bm!40361))

(assert (=> b!911329 m!846721))

(assert (=> b!911329 m!846721))

(assert (=> b!911329 m!846723))

(assert (=> bm!40361 m!846721))

(declare-fun m!846731 () Bool)

(assert (=> bm!40361 m!846731))

(assert (=> b!911332 m!846721))

(assert (=> b!911332 m!846721))

(declare-fun m!846733 () Bool)

(assert (=> b!911332 m!846733))

(assert (=> b!911333 m!846721))

(assert (=> b!911333 m!846721))

(assert (=> b!911333 m!846723))

(assert (=> b!911251 d!112521))

(declare-fun d!112523 () Bool)

(assert (=> d!112523 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!78144 d!112523))

(declare-fun d!112525 () Bool)

(assert (=> d!112525 (= (array_inv!20342 _values!1152) (bvsge (size!26384 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!78144 d!112525))

(declare-fun d!112527 () Bool)

(assert (=> d!112527 (= (array_inv!20343 _keys!1386) (bvsge (size!26385 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!78144 d!112527))

(declare-fun d!112529 () Bool)

(declare-fun e!511047 () Bool)

(assert (=> d!112529 e!511047))

(declare-fun res!614720 () Bool)

(assert (=> d!112529 (=> res!614720 e!511047)))

(declare-fun lt!410560 () Bool)

(assert (=> d!112529 (= res!614720 (not lt!410560))))

(declare-fun lt!410559 () Bool)

(assert (=> d!112529 (= lt!410560 lt!410559)))

(declare-fun lt!410562 () Unit!30852)

(declare-fun e!511046 () Unit!30852)

(assert (=> d!112529 (= lt!410562 e!511046)))

(declare-fun c!96006 () Bool)

(assert (=> d!112529 (= c!96006 lt!410559)))

(declare-fun containsKey!440 (List!18180 (_ BitVec 64)) Bool)

(assert (=> d!112529 (= lt!410559 (containsKey!440 (toList!5545 (getCurrentListMap!2806 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112529 (= (contains!4597 (getCurrentListMap!2806 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410560)))

(declare-fun b!911340 () Bool)

(declare-fun lt!410561 () Unit!30852)

(assert (=> b!911340 (= e!511046 lt!410561)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!334 (List!18180 (_ BitVec 64)) Unit!30852)

(assert (=> b!911340 (= lt!410561 (lemmaContainsKeyImpliesGetValueByKeyDefined!334 (toList!5545 (getCurrentListMap!2806 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!475 0))(
  ( (Some!474 (v!12027 V!30215)) (None!473) )
))
(declare-fun isDefined!342 (Option!475) Bool)

(declare-fun getValueByKey!469 (List!18180 (_ BitVec 64)) Option!475)

(assert (=> b!911340 (isDefined!342 (getValueByKey!469 (toList!5545 (getCurrentListMap!2806 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!911341 () Bool)

(declare-fun Unit!30854 () Unit!30852)

(assert (=> b!911341 (= e!511046 Unit!30854)))

(declare-fun b!911342 () Bool)

(assert (=> b!911342 (= e!511047 (isDefined!342 (getValueByKey!469 (toList!5545 (getCurrentListMap!2806 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112529 c!96006) b!911340))

(assert (= (and d!112529 (not c!96006)) b!911341))

(assert (= (and d!112529 (not res!614720)) b!911342))

(declare-fun m!846735 () Bool)

(assert (=> d!112529 m!846735))

(declare-fun m!846737 () Bool)

(assert (=> b!911340 m!846737))

(declare-fun m!846739 () Bool)

(assert (=> b!911340 m!846739))

(assert (=> b!911340 m!846739))

(declare-fun m!846741 () Bool)

(assert (=> b!911340 m!846741))

(assert (=> b!911342 m!846739))

(assert (=> b!911342 m!846739))

(assert (=> b!911342 m!846741))

(assert (=> b!911250 d!112529))

(declare-fun b!911385 () Bool)

(declare-fun e!511077 () Bool)

(assert (=> b!911385 (= e!511077 (validKeyInArray!0 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!911386 () Bool)

(declare-fun e!511074 () Bool)

(declare-fun call!40385 () Bool)

(assert (=> b!911386 (= e!511074 (not call!40385))))

(declare-fun b!911387 () Bool)

(declare-fun c!96023 () Bool)

(assert (=> b!911387 (= c!96023 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!511076 () ListLongMap!11059)

(declare-fun e!511083 () ListLongMap!11059)

(assert (=> b!911387 (= e!511076 e!511083)))

(declare-fun b!911388 () Bool)

(declare-fun call!40381 () ListLongMap!11059)

(assert (=> b!911388 (= e!511083 call!40381)))

(declare-fun bm!40376 () Bool)

(declare-fun call!40383 () Bool)

(declare-fun lt!410612 () ListLongMap!11059)

(assert (=> bm!40376 (= call!40383 (contains!4597 lt!410612 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!911389 () Bool)

(declare-fun e!511079 () Bool)

(declare-fun apply!523 (ListLongMap!11059 (_ BitVec 64)) V!30215)

(assert (=> b!911389 (= e!511079 (= (apply!523 lt!410612 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun bm!40377 () Bool)

(declare-fun call!40379 () ListLongMap!11059)

(declare-fun call!40380 () ListLongMap!11059)

(assert (=> bm!40377 (= call!40379 call!40380)))

(declare-fun bm!40378 () Bool)

(declare-fun call!40384 () ListLongMap!11059)

(assert (=> bm!40378 (= call!40381 call!40384)))

(declare-fun b!911390 () Bool)

(declare-fun e!511082 () ListLongMap!11059)

(assert (=> b!911390 (= e!511082 e!511076)))

(declare-fun c!96024 () Bool)

(assert (=> b!911390 (= c!96024 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!911391 () Bool)

(declare-fun e!511086 () Bool)

(assert (=> b!911391 (= e!511086 e!511074)))

(declare-fun c!96021 () Bool)

(assert (=> b!911391 (= c!96021 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!911392 () Bool)

(declare-fun call!40382 () ListLongMap!11059)

(assert (=> b!911392 (= e!511083 call!40382)))

(declare-fun b!911393 () Bool)

(declare-fun +!2614 (ListLongMap!11059 tuple2!12360) ListLongMap!11059)

(assert (=> b!911393 (= e!511082 (+!2614 call!40384 (tuple2!12361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!911394 () Bool)

(declare-fun e!511078 () Bool)

(assert (=> b!911394 (= e!511078 (not call!40383))))

(declare-fun b!911395 () Bool)

(declare-fun e!511085 () Bool)

(assert (=> b!911395 (= e!511085 (validKeyInArray!0 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!911396 () Bool)

(assert (=> b!911396 (= e!511076 call!40381)))

(declare-fun bm!40379 () Bool)

(declare-fun c!96020 () Bool)

(assert (=> bm!40379 (= call!40384 (+!2614 (ite c!96020 call!40380 (ite c!96024 call!40379 call!40382)) (ite (or c!96020 c!96024) (tuple2!12361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun bm!40380 () Bool)

(assert (=> bm!40380 (= call!40382 call!40379)))

(declare-fun b!911397 () Bool)

(declare-fun e!511084 () Bool)

(assert (=> b!911397 (= e!511078 e!511084)))

(declare-fun res!614745 () Bool)

(assert (=> b!911397 (= res!614745 call!40383)))

(assert (=> b!911397 (=> (not res!614745) (not e!511084))))

(declare-fun bm!40381 () Bool)

(assert (=> bm!40381 (= call!40385 (contains!4597 lt!410612 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40382 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3335 (array!53945 array!53943 (_ BitVec 32) (_ BitVec 32) V!30215 V!30215 (_ BitVec 32) Int) ListLongMap!11059)

(assert (=> bm!40382 (= call!40380 (getCurrentListMapNoExtraKeys!3335 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!911398 () Bool)

(declare-fun e!511080 () Bool)

(declare-fun get!13645 (ValueCell!8987 V!30215) V!30215)

(declare-fun dynLambda!1404 (Int (_ BitVec 64)) V!30215)

(assert (=> b!911398 (= e!511080 (= (apply!523 lt!410612 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000)) (get!13645 (select (arr!25924 _values!1152) #b00000000000000000000000000000000) (dynLambda!1404 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!911398 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26384 _values!1152)))))

(assert (=> b!911398 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26385 _keys!1386)))))

(declare-fun b!911399 () Bool)

(assert (=> b!911399 (= e!511084 (= (apply!523 lt!410612 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!911400 () Bool)

(declare-fun e!511081 () Bool)

(assert (=> b!911400 (= e!511081 e!511080)))

(declare-fun res!614744 () Bool)

(assert (=> b!911400 (=> (not res!614744) (not e!511080))))

(assert (=> b!911400 (= res!614744 (contains!4597 lt!410612 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!911400 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26385 _keys!1386)))))

(declare-fun b!911401 () Bool)

(declare-fun e!511075 () Unit!30852)

(declare-fun Unit!30855 () Unit!30852)

(assert (=> b!911401 (= e!511075 Unit!30855)))

(declare-fun b!911402 () Bool)

(declare-fun res!614740 () Bool)

(assert (=> b!911402 (=> (not res!614740) (not e!511086))))

(assert (=> b!911402 (= res!614740 e!511081)))

(declare-fun res!614747 () Bool)

(assert (=> b!911402 (=> res!614747 e!511081)))

(assert (=> b!911402 (= res!614747 (not e!511077))))

(declare-fun res!614746 () Bool)

(assert (=> b!911402 (=> (not res!614746) (not e!511077))))

(assert (=> b!911402 (= res!614746 (bvslt #b00000000000000000000000000000000 (size!26385 _keys!1386)))))

(declare-fun d!112531 () Bool)

(assert (=> d!112531 e!511086))

(declare-fun res!614743 () Bool)

(assert (=> d!112531 (=> (not res!614743) (not e!511086))))

(assert (=> d!112531 (= res!614743 (or (bvsge #b00000000000000000000000000000000 (size!26385 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26385 _keys!1386)))))))

(declare-fun lt!410609 () ListLongMap!11059)

(assert (=> d!112531 (= lt!410612 lt!410609)))

(declare-fun lt!410611 () Unit!30852)

(assert (=> d!112531 (= lt!410611 e!511075)))

(declare-fun c!96022 () Bool)

(assert (=> d!112531 (= c!96022 e!511085)))

(declare-fun res!614741 () Bool)

(assert (=> d!112531 (=> (not res!614741) (not e!511085))))

(assert (=> d!112531 (= res!614741 (bvslt #b00000000000000000000000000000000 (size!26385 _keys!1386)))))

(assert (=> d!112531 (= lt!410609 e!511082)))

(assert (=> d!112531 (= c!96020 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112531 (validMask!0 mask!1756)))

(assert (=> d!112531 (= (getCurrentListMap!2806 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410612)))

(declare-fun b!911403 () Bool)

(assert (=> b!911403 (= e!511074 e!511079)))

(declare-fun res!614739 () Bool)

(assert (=> b!911403 (= res!614739 call!40385)))

(assert (=> b!911403 (=> (not res!614739) (not e!511079))))

(declare-fun b!911404 () Bool)

(declare-fun res!614742 () Bool)

(assert (=> b!911404 (=> (not res!614742) (not e!511086))))

(assert (=> b!911404 (= res!614742 e!511078)))

(declare-fun c!96019 () Bool)

(assert (=> b!911404 (= c!96019 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!911405 () Bool)

(declare-fun lt!410618 () Unit!30852)

(assert (=> b!911405 (= e!511075 lt!410618)))

(declare-fun lt!410608 () ListLongMap!11059)

(assert (=> b!911405 (= lt!410608 (getCurrentListMapNoExtraKeys!3335 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410621 () (_ BitVec 64))

(assert (=> b!911405 (= lt!410621 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410624 () (_ BitVec 64))

(assert (=> b!911405 (= lt!410624 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410616 () Unit!30852)

(declare-fun addStillContains!345 (ListLongMap!11059 (_ BitVec 64) V!30215 (_ BitVec 64)) Unit!30852)

(assert (=> b!911405 (= lt!410616 (addStillContains!345 lt!410608 lt!410621 zeroValue!1094 lt!410624))))

(assert (=> b!911405 (contains!4597 (+!2614 lt!410608 (tuple2!12361 lt!410621 zeroValue!1094)) lt!410624)))

(declare-fun lt!410625 () Unit!30852)

(assert (=> b!911405 (= lt!410625 lt!410616)))

(declare-fun lt!410607 () ListLongMap!11059)

(assert (=> b!911405 (= lt!410607 (getCurrentListMapNoExtraKeys!3335 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410615 () (_ BitVec 64))

(assert (=> b!911405 (= lt!410615 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410626 () (_ BitVec 64))

(assert (=> b!911405 (= lt!410626 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410620 () Unit!30852)

(declare-fun addApplyDifferent!345 (ListLongMap!11059 (_ BitVec 64) V!30215 (_ BitVec 64)) Unit!30852)

(assert (=> b!911405 (= lt!410620 (addApplyDifferent!345 lt!410607 lt!410615 minValue!1094 lt!410626))))

(assert (=> b!911405 (= (apply!523 (+!2614 lt!410607 (tuple2!12361 lt!410615 minValue!1094)) lt!410626) (apply!523 lt!410607 lt!410626))))

(declare-fun lt!410627 () Unit!30852)

(assert (=> b!911405 (= lt!410627 lt!410620)))

(declare-fun lt!410610 () ListLongMap!11059)

(assert (=> b!911405 (= lt!410610 (getCurrentListMapNoExtraKeys!3335 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410617 () (_ BitVec 64))

(assert (=> b!911405 (= lt!410617 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410613 () (_ BitVec 64))

(assert (=> b!911405 (= lt!410613 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410628 () Unit!30852)

(assert (=> b!911405 (= lt!410628 (addApplyDifferent!345 lt!410610 lt!410617 zeroValue!1094 lt!410613))))

(assert (=> b!911405 (= (apply!523 (+!2614 lt!410610 (tuple2!12361 lt!410617 zeroValue!1094)) lt!410613) (apply!523 lt!410610 lt!410613))))

(declare-fun lt!410622 () Unit!30852)

(assert (=> b!911405 (= lt!410622 lt!410628)))

(declare-fun lt!410614 () ListLongMap!11059)

(assert (=> b!911405 (= lt!410614 (getCurrentListMapNoExtraKeys!3335 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410619 () (_ BitVec 64))

(assert (=> b!911405 (= lt!410619 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410623 () (_ BitVec 64))

(assert (=> b!911405 (= lt!410623 (select (arr!25925 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!911405 (= lt!410618 (addApplyDifferent!345 lt!410614 lt!410619 minValue!1094 lt!410623))))

(assert (=> b!911405 (= (apply!523 (+!2614 lt!410614 (tuple2!12361 lt!410619 minValue!1094)) lt!410623) (apply!523 lt!410614 lt!410623))))

(assert (= (and d!112531 c!96020) b!911393))

(assert (= (and d!112531 (not c!96020)) b!911390))

(assert (= (and b!911390 c!96024) b!911396))

(assert (= (and b!911390 (not c!96024)) b!911387))

(assert (= (and b!911387 c!96023) b!911388))

(assert (= (and b!911387 (not c!96023)) b!911392))

(assert (= (or b!911388 b!911392) bm!40380))

(assert (= (or b!911396 bm!40380) bm!40377))

(assert (= (or b!911396 b!911388) bm!40378))

(assert (= (or b!911393 bm!40377) bm!40382))

(assert (= (or b!911393 bm!40378) bm!40379))

(assert (= (and d!112531 res!614741) b!911395))

(assert (= (and d!112531 c!96022) b!911405))

(assert (= (and d!112531 (not c!96022)) b!911401))

(assert (= (and d!112531 res!614743) b!911402))

(assert (= (and b!911402 res!614746) b!911385))

(assert (= (and b!911402 (not res!614747)) b!911400))

(assert (= (and b!911400 res!614744) b!911398))

(assert (= (and b!911402 res!614740) b!911404))

(assert (= (and b!911404 c!96019) b!911397))

(assert (= (and b!911404 (not c!96019)) b!911394))

(assert (= (and b!911397 res!614745) b!911399))

(assert (= (or b!911397 b!911394) bm!40376))

(assert (= (and b!911404 res!614742) b!911391))

(assert (= (and b!911391 c!96021) b!911403))

(assert (= (and b!911391 (not c!96021)) b!911386))

(assert (= (and b!911403 res!614739) b!911389))

(assert (= (or b!911403 b!911386) bm!40381))

(declare-fun b_lambda!13313 () Bool)

(assert (=> (not b_lambda!13313) (not b!911398)))

(declare-fun t!25760 () Bool)

(declare-fun tb!5427 () Bool)

(assert (=> (and start!78144 (= defaultEntry!1160 defaultEntry!1160) t!25760) tb!5427))

(declare-fun result!10661 () Bool)

(assert (=> tb!5427 (= result!10661 tp_is_empty!18937)))

(assert (=> b!911398 t!25760))

(declare-fun b_and!27105 () Bool)

(assert (= b_and!27099 (and (=> t!25760 result!10661) b_and!27105)))

(declare-fun m!846743 () Bool)

(assert (=> bm!40382 m!846743))

(declare-fun m!846745 () Bool)

(assert (=> b!911399 m!846745))

(declare-fun m!846747 () Bool)

(assert (=> b!911389 m!846747))

(assert (=> b!911385 m!846721))

(assert (=> b!911385 m!846721))

(assert (=> b!911385 m!846723))

(assert (=> b!911400 m!846721))

(assert (=> b!911400 m!846721))

(declare-fun m!846749 () Bool)

(assert (=> b!911400 m!846749))

(declare-fun m!846751 () Bool)

(assert (=> b!911393 m!846751))

(declare-fun m!846753 () Bool)

(assert (=> bm!40381 m!846753))

(assert (=> d!112531 m!846665))

(assert (=> b!911395 m!846721))

(assert (=> b!911395 m!846721))

(assert (=> b!911395 m!846723))

(declare-fun m!846755 () Bool)

(assert (=> bm!40379 m!846755))

(declare-fun m!846757 () Bool)

(assert (=> b!911398 m!846757))

(assert (=> b!911398 m!846721))

(declare-fun m!846759 () Bool)

(assert (=> b!911398 m!846759))

(assert (=> b!911398 m!846757))

(declare-fun m!846761 () Bool)

(assert (=> b!911398 m!846761))

(assert (=> b!911398 m!846759))

(assert (=> b!911398 m!846721))

(declare-fun m!846763 () Bool)

(assert (=> b!911398 m!846763))

(declare-fun m!846765 () Bool)

(assert (=> b!911405 m!846765))

(declare-fun m!846767 () Bool)

(assert (=> b!911405 m!846767))

(declare-fun m!846769 () Bool)

(assert (=> b!911405 m!846769))

(declare-fun m!846771 () Bool)

(assert (=> b!911405 m!846771))

(declare-fun m!846773 () Bool)

(assert (=> b!911405 m!846773))

(declare-fun m!846775 () Bool)

(assert (=> b!911405 m!846775))

(declare-fun m!846777 () Bool)

(assert (=> b!911405 m!846777))

(declare-fun m!846779 () Bool)

(assert (=> b!911405 m!846779))

(declare-fun m!846781 () Bool)

(assert (=> b!911405 m!846781))

(assert (=> b!911405 m!846769))

(declare-fun m!846783 () Bool)

(assert (=> b!911405 m!846783))

(declare-fun m!846785 () Bool)

(assert (=> b!911405 m!846785))

(assert (=> b!911405 m!846781))

(declare-fun m!846787 () Bool)

(assert (=> b!911405 m!846787))

(assert (=> b!911405 m!846777))

(declare-fun m!846789 () Bool)

(assert (=> b!911405 m!846789))

(assert (=> b!911405 m!846721))

(assert (=> b!911405 m!846743))

(declare-fun m!846791 () Bool)

(assert (=> b!911405 m!846791))

(assert (=> b!911405 m!846765))

(declare-fun m!846793 () Bool)

(assert (=> b!911405 m!846793))

(declare-fun m!846795 () Bool)

(assert (=> bm!40376 m!846795))

(assert (=> b!911250 d!112531))

(declare-fun b!911415 () Bool)

(declare-fun e!511092 () Bool)

(assert (=> b!911415 (= e!511092 tp_is_empty!18937)))

(declare-fun condMapEmpty!30133 () Bool)

(declare-fun mapDefault!30133 () ValueCell!8987)

(assert (=> mapNonEmpty!30124 (= condMapEmpty!30133 (= mapRest!30124 ((as const (Array (_ BitVec 32) ValueCell!8987)) mapDefault!30133)))))

(declare-fun mapRes!30133 () Bool)

(assert (=> mapNonEmpty!30124 (= tp!57825 (and e!511092 mapRes!30133))))

(declare-fun mapIsEmpty!30133 () Bool)

(assert (=> mapIsEmpty!30133 mapRes!30133))

(declare-fun mapNonEmpty!30133 () Bool)

(declare-fun tp!57841 () Bool)

(declare-fun e!511091 () Bool)

(assert (=> mapNonEmpty!30133 (= mapRes!30133 (and tp!57841 e!511091))))

(declare-fun mapValue!30133 () ValueCell!8987)

(declare-fun mapRest!30133 () (Array (_ BitVec 32) ValueCell!8987))

(declare-fun mapKey!30133 () (_ BitVec 32))

(assert (=> mapNonEmpty!30133 (= mapRest!30124 (store mapRest!30133 mapKey!30133 mapValue!30133))))

(declare-fun b!911414 () Bool)

(assert (=> b!911414 (= e!511091 tp_is_empty!18937)))

(assert (= (and mapNonEmpty!30124 condMapEmpty!30133) mapIsEmpty!30133))

(assert (= (and mapNonEmpty!30124 (not condMapEmpty!30133)) mapNonEmpty!30133))

(assert (= (and mapNonEmpty!30133 ((_ is ValueCellFull!8987) mapValue!30133)) b!911414))

(assert (= (and mapNonEmpty!30124 ((_ is ValueCellFull!8987) mapDefault!30133)) b!911415))

(declare-fun m!846797 () Bool)

(assert (=> mapNonEmpty!30133 m!846797))

(declare-fun b_lambda!13315 () Bool)

(assert (= b_lambda!13313 (or (and start!78144 b_free!16519) b_lambda!13315)))

(check-sat (not b!911317) (not bm!40361) (not b!911405) (not b_next!16519) (not d!112529) (not mapNonEmpty!30133) (not bm!40379) (not b!911333) (not bm!40358) tp_is_empty!18937 (not b!911395) (not b!911329) (not b!911340) (not b!911385) (not b!911342) (not b!911332) (not b!911399) (not bm!40381) (not d!112531) (not b!911393) (not b!911400) b_and!27105 (not bm!40376) (not b!911318) (not bm!40382) (not b!911398) (not b!911389) (not b_lambda!13315))
(check-sat b_and!27105 (not b_next!16519))
