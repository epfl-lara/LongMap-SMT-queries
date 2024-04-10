; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72258 () Bool)

(assert start!72258)

(declare-fun b!837310 () Bool)

(declare-fun res!569469 () Bool)

(declare-fun e!467286 () Bool)

(assert (=> b!837310 (=> (not res!569469) (not e!467286))))

(declare-datatypes ((List!16024 0))(
  ( (Nil!16021) (Cons!16020 (h!17151 (_ BitVec 64)) (t!22395 List!16024)) )
))
(declare-fun noDuplicate!1298 (List!16024) Bool)

(assert (=> b!837310 (= res!569469 (noDuplicate!1298 Nil!16021))))

(declare-fun res!569467 () Bool)

(assert (=> start!72258 (=> (not res!569467) (not e!467286))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!46942 0))(
  ( (array!46943 (arr!22503 (Array (_ BitVec 32) (_ BitVec 64))) (size!22943 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46942)

(assert (=> start!72258 (= res!569467 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22943 _keys!868))))))

(assert (=> start!72258 e!467286))

(assert (=> start!72258 true))

(declare-fun array_inv!17940 (array!46942) Bool)

(assert (=> start!72258 (array_inv!17940 _keys!868)))

(declare-datatypes ((V!25475 0))(
  ( (V!25476 (val!7708 Int)) )
))
(declare-datatypes ((ValueCell!7221 0))(
  ( (ValueCellFull!7221 (v!10132 V!25475)) (EmptyCell!7221) )
))
(declare-datatypes ((array!46944 0))(
  ( (array!46945 (arr!22504 (Array (_ BitVec 32) ValueCell!7221)) (size!22944 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46944)

(declare-fun e!467291 () Bool)

(declare-fun array_inv!17941 (array!46944) Bool)

(assert (=> start!72258 (and (array_inv!17941 _values!688) e!467291)))

(declare-fun b!837311 () Bool)

(declare-fun e!467287 () Bool)

(assert (=> b!837311 (= e!467286 e!467287)))

(declare-fun res!569466 () Bool)

(assert (=> b!837311 (=> res!569466 e!467287)))

(declare-fun contains!4215 (List!16024 (_ BitVec 64)) Bool)

(assert (=> b!837311 (= res!569466 (contains!4215 Nil!16021 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!837312 () Bool)

(assert (=> b!837312 (= e!467287 (contains!4215 Nil!16021 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!24578 () Bool)

(declare-fun mapRes!24578 () Bool)

(assert (=> mapIsEmpty!24578 mapRes!24578))

(declare-fun b!837313 () Bool)

(declare-fun res!569471 () Bool)

(assert (=> b!837313 (=> (not res!569471) (not e!467286))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46942 (_ BitVec 32)) Bool)

(assert (=> b!837313 (= res!569471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837314 () Bool)

(declare-fun res!569470 () Bool)

(assert (=> b!837314 (=> (not res!569470) (not e!467286))))

(assert (=> b!837314 (= res!569470 (and (bvsle #b00000000000000000000000000000000 (size!22943 _keys!868)) (bvslt (size!22943 _keys!868) #b01111111111111111111111111111111)))))

(declare-fun b!837315 () Bool)

(declare-fun e!467289 () Bool)

(declare-fun tp_is_empty!15321 () Bool)

(assert (=> b!837315 (= e!467289 tp_is_empty!15321)))

(declare-fun b!837316 () Bool)

(assert (=> b!837316 (= e!467291 (and e!467289 mapRes!24578))))

(declare-fun condMapEmpty!24578 () Bool)

(declare-fun mapDefault!24578 () ValueCell!7221)

(assert (=> b!837316 (= condMapEmpty!24578 (= (arr!22504 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7221)) mapDefault!24578)))))

(declare-fun mapNonEmpty!24578 () Bool)

(declare-fun tp!47572 () Bool)

(declare-fun e!467290 () Bool)

(assert (=> mapNonEmpty!24578 (= mapRes!24578 (and tp!47572 e!467290))))

(declare-fun mapValue!24578 () ValueCell!7221)

(declare-fun mapKey!24578 () (_ BitVec 32))

(declare-fun mapRest!24578 () (Array (_ BitVec 32) ValueCell!7221))

(assert (=> mapNonEmpty!24578 (= (arr!22504 _values!688) (store mapRest!24578 mapKey!24578 mapValue!24578))))

(declare-fun b!837317 () Bool)

(assert (=> b!837317 (= e!467290 tp_is_empty!15321)))

(declare-fun b!837318 () Bool)

(declare-fun res!569468 () Bool)

(assert (=> b!837318 (=> (not res!569468) (not e!467286))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837318 (= res!569468 (and (= (size!22944 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22943 _keys!868) (size!22944 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837319 () Bool)

(declare-fun res!569472 () Bool)

(assert (=> b!837319 (=> (not res!569472) (not e!467286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837319 (= res!569472 (validMask!0 mask!1196))))

(assert (= (and start!72258 res!569467) b!837319))

(assert (= (and b!837319 res!569472) b!837318))

(assert (= (and b!837318 res!569468) b!837313))

(assert (= (and b!837313 res!569471) b!837314))

(assert (= (and b!837314 res!569470) b!837310))

(assert (= (and b!837310 res!569469) b!837311))

(assert (= (and b!837311 (not res!569466)) b!837312))

(assert (= (and b!837316 condMapEmpty!24578) mapIsEmpty!24578))

(assert (= (and b!837316 (not condMapEmpty!24578)) mapNonEmpty!24578))

(get-info :version)

(assert (= (and mapNonEmpty!24578 ((_ is ValueCellFull!7221) mapValue!24578)) b!837317))

(assert (= (and b!837316 ((_ is ValueCellFull!7221) mapDefault!24578)) b!837315))

(assert (= start!72258 b!837316))

(declare-fun m!782205 () Bool)

(assert (=> b!837319 m!782205))

(declare-fun m!782207 () Bool)

(assert (=> b!837311 m!782207))

(declare-fun m!782209 () Bool)

(assert (=> b!837312 m!782209))

(declare-fun m!782211 () Bool)

(assert (=> b!837310 m!782211))

(declare-fun m!782213 () Bool)

(assert (=> mapNonEmpty!24578 m!782213))

(declare-fun m!782215 () Bool)

(assert (=> start!72258 m!782215))

(declare-fun m!782217 () Bool)

(assert (=> start!72258 m!782217))

(declare-fun m!782219 () Bool)

(assert (=> b!837313 m!782219))

(check-sat (not start!72258) (not b!837313) tp_is_empty!15321 (not b!837312) (not b!837319) (not b!837310) (not b!837311) (not mapNonEmpty!24578))
(check-sat)
(get-model)

(declare-fun d!107823 () Bool)

(declare-fun lt!380541 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!390 (List!16024) (InoxSet (_ BitVec 64)))

(assert (=> d!107823 (= lt!380541 (select (content!390 Nil!16021) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!467314 () Bool)

(assert (=> d!107823 (= lt!380541 e!467314)))

(declare-fun res!569499 () Bool)

(assert (=> d!107823 (=> (not res!569499) (not e!467314))))

(assert (=> d!107823 (= res!569499 ((_ is Cons!16020) Nil!16021))))

(assert (=> d!107823 (= (contains!4215 Nil!16021 #b1000000000000000000000000000000000000000000000000000000000000000) lt!380541)))

(declare-fun b!837354 () Bool)

(declare-fun e!467315 () Bool)

(assert (=> b!837354 (= e!467314 e!467315)))

(declare-fun res!569498 () Bool)

(assert (=> b!837354 (=> res!569498 e!467315)))

(assert (=> b!837354 (= res!569498 (= (h!17151 Nil!16021) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!837355 () Bool)

(assert (=> b!837355 (= e!467315 (contains!4215 (t!22395 Nil!16021) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107823 res!569499) b!837354))

(assert (= (and b!837354 (not res!569498)) b!837355))

(declare-fun m!782237 () Bool)

(assert (=> d!107823 m!782237))

(declare-fun m!782239 () Bool)

(assert (=> d!107823 m!782239))

(declare-fun m!782241 () Bool)

(assert (=> b!837355 m!782241))

(assert (=> b!837312 d!107823))

(declare-fun d!107825 () Bool)

(declare-fun lt!380542 () Bool)

(assert (=> d!107825 (= lt!380542 (select (content!390 Nil!16021) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!467316 () Bool)

(assert (=> d!107825 (= lt!380542 e!467316)))

(declare-fun res!569501 () Bool)

(assert (=> d!107825 (=> (not res!569501) (not e!467316))))

(assert (=> d!107825 (= res!569501 ((_ is Cons!16020) Nil!16021))))

(assert (=> d!107825 (= (contains!4215 Nil!16021 #b0000000000000000000000000000000000000000000000000000000000000000) lt!380542)))

(declare-fun b!837356 () Bool)

(declare-fun e!467317 () Bool)

(assert (=> b!837356 (= e!467316 e!467317)))

(declare-fun res!569500 () Bool)

(assert (=> b!837356 (=> res!569500 e!467317)))

(assert (=> b!837356 (= res!569500 (= (h!17151 Nil!16021) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!837357 () Bool)

(assert (=> b!837357 (= e!467317 (contains!4215 (t!22395 Nil!16021) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!107825 res!569501) b!837356))

(assert (= (and b!837356 (not res!569500)) b!837357))

(assert (=> d!107825 m!782237))

(declare-fun m!782243 () Bool)

(assert (=> d!107825 m!782243))

(declare-fun m!782245 () Bool)

(assert (=> b!837357 m!782245))

(assert (=> b!837311 d!107825))

(declare-fun d!107827 () Bool)

(declare-fun res!569506 () Bool)

(declare-fun e!467322 () Bool)

(assert (=> d!107827 (=> res!569506 e!467322)))

(assert (=> d!107827 (= res!569506 ((_ is Nil!16021) Nil!16021))))

(assert (=> d!107827 (= (noDuplicate!1298 Nil!16021) e!467322)))

(declare-fun b!837362 () Bool)

(declare-fun e!467323 () Bool)

(assert (=> b!837362 (= e!467322 e!467323)))

(declare-fun res!569507 () Bool)

(assert (=> b!837362 (=> (not res!569507) (not e!467323))))

(assert (=> b!837362 (= res!569507 (not (contains!4215 (t!22395 Nil!16021) (h!17151 Nil!16021))))))

(declare-fun b!837363 () Bool)

(assert (=> b!837363 (= e!467323 (noDuplicate!1298 (t!22395 Nil!16021)))))

(assert (= (and d!107827 (not res!569506)) b!837362))

(assert (= (and b!837362 res!569507) b!837363))

(declare-fun m!782247 () Bool)

(assert (=> b!837362 m!782247))

(declare-fun m!782249 () Bool)

(assert (=> b!837363 m!782249))

(assert (=> b!837310 d!107827))

(declare-fun d!107829 () Bool)

(assert (=> d!107829 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!837319 d!107829))

(declare-fun b!837372 () Bool)

(declare-fun e!467332 () Bool)

(declare-fun e!467330 () Bool)

(assert (=> b!837372 (= e!467332 e!467330)))

(declare-fun c!91153 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!837372 (= c!91153 (validKeyInArray!0 (select (arr!22503 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!107831 () Bool)

(declare-fun res!569513 () Bool)

(assert (=> d!107831 (=> res!569513 e!467332)))

(assert (=> d!107831 (= res!569513 (bvsge #b00000000000000000000000000000000 (size!22943 _keys!868)))))

(assert (=> d!107831 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!467332)))

(declare-fun b!837373 () Bool)

(declare-fun e!467331 () Bool)

(assert (=> b!837373 (= e!467330 e!467331)))

(declare-fun lt!380549 () (_ BitVec 64))

(assert (=> b!837373 (= lt!380549 (select (arr!22503 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!28783 0))(
  ( (Unit!28784) )
))
(declare-fun lt!380551 () Unit!28783)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46942 (_ BitVec 64) (_ BitVec 32)) Unit!28783)

(assert (=> b!837373 (= lt!380551 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!380549 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!837373 (arrayContainsKey!0 _keys!868 lt!380549 #b00000000000000000000000000000000)))

(declare-fun lt!380550 () Unit!28783)

(assert (=> b!837373 (= lt!380550 lt!380551)))

(declare-fun res!569512 () Bool)

(declare-datatypes ((SeekEntryResult!8748 0))(
  ( (MissingZero!8748 (index!37363 (_ BitVec 32))) (Found!8748 (index!37364 (_ BitVec 32))) (Intermediate!8748 (undefined!9560 Bool) (index!37365 (_ BitVec 32)) (x!70733 (_ BitVec 32))) (Undefined!8748) (MissingVacant!8748 (index!37366 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46942 (_ BitVec 32)) SeekEntryResult!8748)

(assert (=> b!837373 (= res!569512 (= (seekEntryOrOpen!0 (select (arr!22503 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8748 #b00000000000000000000000000000000)))))

(assert (=> b!837373 (=> (not res!569512) (not e!467331))))

(declare-fun b!837374 () Bool)

(declare-fun call!36821 () Bool)

(assert (=> b!837374 (= e!467331 call!36821)))

(declare-fun b!837375 () Bool)

(assert (=> b!837375 (= e!467330 call!36821)))

(declare-fun bm!36818 () Bool)

(assert (=> bm!36818 (= call!36821 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(assert (= (and d!107831 (not res!569513)) b!837372))

(assert (= (and b!837372 c!91153) b!837373))

(assert (= (and b!837372 (not c!91153)) b!837375))

(assert (= (and b!837373 res!569512) b!837374))

(assert (= (or b!837374 b!837375) bm!36818))

(declare-fun m!782251 () Bool)

(assert (=> b!837372 m!782251))

(assert (=> b!837372 m!782251))

(declare-fun m!782253 () Bool)

(assert (=> b!837372 m!782253))

(assert (=> b!837373 m!782251))

(declare-fun m!782255 () Bool)

(assert (=> b!837373 m!782255))

(declare-fun m!782257 () Bool)

(assert (=> b!837373 m!782257))

(assert (=> b!837373 m!782251))

(declare-fun m!782259 () Bool)

(assert (=> b!837373 m!782259))

(declare-fun m!782261 () Bool)

(assert (=> bm!36818 m!782261))

(assert (=> b!837313 d!107831))

(declare-fun d!107833 () Bool)

(assert (=> d!107833 (= (array_inv!17940 _keys!868) (bvsge (size!22943 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!72258 d!107833))

(declare-fun d!107835 () Bool)

(assert (=> d!107835 (= (array_inv!17941 _values!688) (bvsge (size!22944 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!72258 d!107835))

(declare-fun b!837383 () Bool)

(declare-fun e!467337 () Bool)

(assert (=> b!837383 (= e!467337 tp_is_empty!15321)))

(declare-fun mapIsEmpty!24584 () Bool)

(declare-fun mapRes!24584 () Bool)

(assert (=> mapIsEmpty!24584 mapRes!24584))

(declare-fun condMapEmpty!24584 () Bool)

(declare-fun mapDefault!24584 () ValueCell!7221)

(assert (=> mapNonEmpty!24578 (= condMapEmpty!24584 (= mapRest!24578 ((as const (Array (_ BitVec 32) ValueCell!7221)) mapDefault!24584)))))

(assert (=> mapNonEmpty!24578 (= tp!47572 (and e!467337 mapRes!24584))))

(declare-fun mapNonEmpty!24584 () Bool)

(declare-fun tp!47578 () Bool)

(declare-fun e!467338 () Bool)

(assert (=> mapNonEmpty!24584 (= mapRes!24584 (and tp!47578 e!467338))))

(declare-fun mapRest!24584 () (Array (_ BitVec 32) ValueCell!7221))

(declare-fun mapValue!24584 () ValueCell!7221)

(declare-fun mapKey!24584 () (_ BitVec 32))

(assert (=> mapNonEmpty!24584 (= mapRest!24578 (store mapRest!24584 mapKey!24584 mapValue!24584))))

(declare-fun b!837382 () Bool)

(assert (=> b!837382 (= e!467338 tp_is_empty!15321)))

(assert (= (and mapNonEmpty!24578 condMapEmpty!24584) mapIsEmpty!24584))

(assert (= (and mapNonEmpty!24578 (not condMapEmpty!24584)) mapNonEmpty!24584))

(assert (= (and mapNonEmpty!24584 ((_ is ValueCellFull!7221) mapValue!24584)) b!837382))

(assert (= (and mapNonEmpty!24578 ((_ is ValueCellFull!7221) mapDefault!24584)) b!837383))

(declare-fun m!782263 () Bool)

(assert (=> mapNonEmpty!24584 m!782263))

(check-sat (not d!107825) (not bm!36818) (not b!837362) (not b!837372) tp_is_empty!15321 (not b!837357) (not d!107823) (not b!837355) (not b!837363) (not b!837373) (not mapNonEmpty!24584))
(check-sat)
