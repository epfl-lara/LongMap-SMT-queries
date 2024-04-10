; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38412 () Bool)

(assert start!38412)

(declare-fun mapNonEmpty!16392 () Bool)

(declare-fun mapRes!16392 () Bool)

(declare-fun tp!32187 () Bool)

(declare-fun e!239775 () Bool)

(assert (=> mapNonEmpty!16392 (= mapRes!16392 (and tp!32187 e!239775))))

(declare-datatypes ((V!14237 0))(
  ( (V!14238 (val!4969 Int)) )
))
(declare-datatypes ((ValueCell!4581 0))(
  ( (ValueCellFull!4581 (v!7215 V!14237)) (EmptyCell!4581) )
))
(declare-fun mapValue!16392 () ValueCell!4581)

(declare-datatypes ((array!23609 0))(
  ( (array!23610 (arr!11255 (Array (_ BitVec 32) ValueCell!4581)) (size!11607 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23609)

(declare-fun mapRest!16392 () (Array (_ BitVec 32) ValueCell!4581))

(declare-fun mapKey!16392 () (_ BitVec 32))

(assert (=> mapNonEmpty!16392 (= (arr!11255 _values!549) (store mapRest!16392 mapKey!16392 mapValue!16392))))

(declare-fun b!396210 () Bool)

(declare-fun res!227261 () Bool)

(declare-fun e!239771 () Bool)

(assert (=> b!396210 (=> (not res!227261) (not e!239771))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23611 0))(
  ( (array!23612 (arr!11256 (Array (_ BitVec 32) (_ BitVec 64))) (size!11608 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23611)

(assert (=> b!396210 (= res!227261 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11608 _keys!709))))))

(declare-fun b!396211 () Bool)

(declare-fun res!227270 () Bool)

(assert (=> b!396211 (=> (not res!227270) (not e!239771))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23611 (_ BitVec 32)) Bool)

(assert (=> b!396211 (= res!227270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23612 (store (arr!11256 _keys!709) i!563 k0!794) (size!11608 _keys!709)) mask!1025))))

(declare-fun b!396212 () Bool)

(declare-fun res!227271 () Bool)

(assert (=> b!396212 (=> (not res!227271) (not e!239771))))

(declare-fun arrayContainsKey!0 (array!23611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396212 (= res!227271 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396213 () Bool)

(declare-fun e!239774 () Bool)

(declare-fun tp_is_empty!9849 () Bool)

(assert (=> b!396213 (= e!239774 tp_is_empty!9849)))

(declare-fun b!396214 () Bool)

(declare-fun e!239776 () Bool)

(assert (=> b!396214 (= e!239776 (and e!239774 mapRes!16392))))

(declare-fun condMapEmpty!16392 () Bool)

(declare-fun mapDefault!16392 () ValueCell!4581)

(assert (=> b!396214 (= condMapEmpty!16392 (= (arr!11255 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4581)) mapDefault!16392)))))

(declare-fun b!396215 () Bool)

(declare-fun res!227273 () Bool)

(assert (=> b!396215 (=> (not res!227273) (not e!239771))))

(assert (=> b!396215 (= res!227273 (and (bvsle #b00000000000000000000000000000000 (size!11608 _keys!709)) (bvslt (size!11608 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!396216 () Bool)

(declare-fun res!227264 () Bool)

(assert (=> b!396216 (=> (not res!227264) (not e!239771))))

(declare-datatypes ((List!6523 0))(
  ( (Nil!6520) (Cons!6519 (h!7375 (_ BitVec 64)) (t!11697 List!6523)) )
))
(declare-fun arrayNoDuplicates!0 (array!23611 (_ BitVec 32) List!6523) Bool)

(assert (=> b!396216 (= res!227264 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6520))))

(declare-fun res!227265 () Bool)

(assert (=> start!38412 (=> (not res!227265) (not e!239771))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38412 (= res!227265 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11608 _keys!709))))))

(assert (=> start!38412 e!239771))

(assert (=> start!38412 true))

(declare-fun array_inv!8260 (array!23609) Bool)

(assert (=> start!38412 (and (array_inv!8260 _values!549) e!239776)))

(declare-fun array_inv!8261 (array!23611) Bool)

(assert (=> start!38412 (array_inv!8261 _keys!709)))

(declare-fun b!396217 () Bool)

(declare-fun res!227267 () Bool)

(assert (=> b!396217 (=> (not res!227267) (not e!239771))))

(declare-fun noDuplicate!200 (List!6523) Bool)

(assert (=> b!396217 (= res!227267 (noDuplicate!200 Nil!6520))))

(declare-fun b!396218 () Bool)

(declare-fun res!227266 () Bool)

(assert (=> b!396218 (=> (not res!227266) (not e!239771))))

(assert (=> b!396218 (= res!227266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396219 () Bool)

(declare-fun e!239772 () Bool)

(declare-fun contains!2484 (List!6523 (_ BitVec 64)) Bool)

(assert (=> b!396219 (= e!239772 (contains!2484 Nil!6520 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!396220 () Bool)

(declare-fun res!227272 () Bool)

(assert (=> b!396220 (=> (not res!227272) (not e!239771))))

(assert (=> b!396220 (= res!227272 (or (= (select (arr!11256 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11256 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396221 () Bool)

(assert (=> b!396221 (= e!239771 e!239772)))

(declare-fun res!227263 () Bool)

(assert (=> b!396221 (=> res!227263 e!239772)))

(assert (=> b!396221 (= res!227263 (contains!2484 Nil!6520 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!396222 () Bool)

(declare-fun res!227262 () Bool)

(assert (=> b!396222 (=> (not res!227262) (not e!239771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396222 (= res!227262 (validKeyInArray!0 k0!794))))

(declare-fun b!396223 () Bool)

(assert (=> b!396223 (= e!239775 tp_is_empty!9849)))

(declare-fun b!396224 () Bool)

(declare-fun res!227268 () Bool)

(assert (=> b!396224 (=> (not res!227268) (not e!239771))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396224 (= res!227268 (and (= (size!11607 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11608 _keys!709) (size!11607 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396225 () Bool)

(declare-fun res!227269 () Bool)

(assert (=> b!396225 (=> (not res!227269) (not e!239771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396225 (= res!227269 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16392 () Bool)

(assert (=> mapIsEmpty!16392 mapRes!16392))

(assert (= (and start!38412 res!227265) b!396225))

(assert (= (and b!396225 res!227269) b!396224))

(assert (= (and b!396224 res!227268) b!396218))

(assert (= (and b!396218 res!227266) b!396216))

(assert (= (and b!396216 res!227264) b!396210))

(assert (= (and b!396210 res!227261) b!396222))

(assert (= (and b!396222 res!227262) b!396220))

(assert (= (and b!396220 res!227272) b!396212))

(assert (= (and b!396212 res!227271) b!396211))

(assert (= (and b!396211 res!227270) b!396215))

(assert (= (and b!396215 res!227273) b!396217))

(assert (= (and b!396217 res!227267) b!396221))

(assert (= (and b!396221 (not res!227263)) b!396219))

(assert (= (and b!396214 condMapEmpty!16392) mapIsEmpty!16392))

(assert (= (and b!396214 (not condMapEmpty!16392)) mapNonEmpty!16392))

(get-info :version)

(assert (= (and mapNonEmpty!16392 ((_ is ValueCellFull!4581) mapValue!16392)) b!396223))

(assert (= (and b!396214 ((_ is ValueCellFull!4581) mapDefault!16392)) b!396213))

(assert (= start!38412 b!396214))

(declare-fun m!391921 () Bool)

(assert (=> b!396225 m!391921))

(declare-fun m!391923 () Bool)

(assert (=> start!38412 m!391923))

(declare-fun m!391925 () Bool)

(assert (=> start!38412 m!391925))

(declare-fun m!391927 () Bool)

(assert (=> b!396217 m!391927))

(declare-fun m!391929 () Bool)

(assert (=> b!396221 m!391929))

(declare-fun m!391931 () Bool)

(assert (=> b!396219 m!391931))

(declare-fun m!391933 () Bool)

(assert (=> b!396211 m!391933))

(declare-fun m!391935 () Bool)

(assert (=> b!396211 m!391935))

(declare-fun m!391937 () Bool)

(assert (=> mapNonEmpty!16392 m!391937))

(declare-fun m!391939 () Bool)

(assert (=> b!396220 m!391939))

(declare-fun m!391941 () Bool)

(assert (=> b!396216 m!391941))

(declare-fun m!391943 () Bool)

(assert (=> b!396222 m!391943))

(declare-fun m!391945 () Bool)

(assert (=> b!396212 m!391945))

(declare-fun m!391947 () Bool)

(assert (=> b!396218 m!391947))

(check-sat tp_is_empty!9849 (not b!396218) (not b!396217) (not b!396225) (not b!396221) (not b!396216) (not b!396212) (not mapNonEmpty!16392) (not b!396222) (not b!396211) (not b!396219) (not start!38412))
(check-sat)
(get-model)

(declare-fun d!73395 () Bool)

(declare-fun lt!187120 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!202 (List!6523) (InoxSet (_ BitVec 64)))

(assert (=> d!73395 (= lt!187120 (select (content!202 Nil!6520) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!239799 () Bool)

(assert (=> d!73395 (= lt!187120 e!239799)))

(declare-fun res!227317 () Bool)

(assert (=> d!73395 (=> (not res!227317) (not e!239799))))

(assert (=> d!73395 (= res!227317 ((_ is Cons!6519) Nil!6520))))

(assert (=> d!73395 (= (contains!2484 Nil!6520 #b0000000000000000000000000000000000000000000000000000000000000000) lt!187120)))

(declare-fun b!396278 () Bool)

(declare-fun e!239800 () Bool)

(assert (=> b!396278 (= e!239799 e!239800)))

(declare-fun res!227318 () Bool)

(assert (=> b!396278 (=> res!227318 e!239800)))

(assert (=> b!396278 (= res!227318 (= (h!7375 Nil!6520) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!396279 () Bool)

(assert (=> b!396279 (= e!239800 (contains!2484 (t!11697 Nil!6520) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!73395 res!227317) b!396278))

(assert (= (and b!396278 (not res!227318)) b!396279))

(declare-fun m!391977 () Bool)

(assert (=> d!73395 m!391977))

(declare-fun m!391979 () Bool)

(assert (=> d!73395 m!391979))

(declare-fun m!391981 () Bool)

(assert (=> b!396279 m!391981))

(assert (=> b!396221 d!73395))

(declare-fun b!396290 () Bool)

(declare-fun e!239810 () Bool)

(declare-fun e!239811 () Bool)

(assert (=> b!396290 (= e!239810 e!239811)))

(declare-fun res!227327 () Bool)

(assert (=> b!396290 (=> (not res!227327) (not e!239811))))

(declare-fun e!239809 () Bool)

(assert (=> b!396290 (= res!227327 (not e!239809))))

(declare-fun res!227326 () Bool)

(assert (=> b!396290 (=> (not res!227326) (not e!239809))))

(assert (=> b!396290 (= res!227326 (validKeyInArray!0 (select (arr!11256 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!73397 () Bool)

(declare-fun res!227325 () Bool)

(assert (=> d!73397 (=> res!227325 e!239810)))

(assert (=> d!73397 (= res!227325 (bvsge #b00000000000000000000000000000000 (size!11608 _keys!709)))))

(assert (=> d!73397 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6520) e!239810)))

(declare-fun b!396291 () Bool)

(declare-fun e!239812 () Bool)

(declare-fun call!27892 () Bool)

(assert (=> b!396291 (= e!239812 call!27892)))

(declare-fun b!396292 () Bool)

(assert (=> b!396292 (= e!239812 call!27892)))

(declare-fun bm!27889 () Bool)

(declare-fun c!54568 () Bool)

(assert (=> bm!27889 (= call!27892 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54568 (Cons!6519 (select (arr!11256 _keys!709) #b00000000000000000000000000000000) Nil!6520) Nil!6520)))))

(declare-fun b!396293 () Bool)

(assert (=> b!396293 (= e!239811 e!239812)))

(assert (=> b!396293 (= c!54568 (validKeyInArray!0 (select (arr!11256 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!396294 () Bool)

(assert (=> b!396294 (= e!239809 (contains!2484 Nil!6520 (select (arr!11256 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!73397 (not res!227325)) b!396290))

(assert (= (and b!396290 res!227326) b!396294))

(assert (= (and b!396290 res!227327) b!396293))

(assert (= (and b!396293 c!54568) b!396291))

(assert (= (and b!396293 (not c!54568)) b!396292))

(assert (= (or b!396291 b!396292) bm!27889))

(declare-fun m!391983 () Bool)

(assert (=> b!396290 m!391983))

(assert (=> b!396290 m!391983))

(declare-fun m!391985 () Bool)

(assert (=> b!396290 m!391985))

(assert (=> bm!27889 m!391983))

(declare-fun m!391987 () Bool)

(assert (=> bm!27889 m!391987))

(assert (=> b!396293 m!391983))

(assert (=> b!396293 m!391983))

(assert (=> b!396293 m!391985))

(assert (=> b!396294 m!391983))

(assert (=> b!396294 m!391983))

(declare-fun m!391989 () Bool)

(assert (=> b!396294 m!391989))

(assert (=> b!396216 d!73397))

(declare-fun b!396303 () Bool)

(declare-fun e!239821 () Bool)

(declare-fun e!239820 () Bool)

(assert (=> b!396303 (= e!239821 e!239820)))

(declare-fun lt!187128 () (_ BitVec 64))

(assert (=> b!396303 (= lt!187128 (select (arr!11256 (array!23612 (store (arr!11256 _keys!709) i!563 k0!794) (size!11608 _keys!709))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12076 0))(
  ( (Unit!12077) )
))
(declare-fun lt!187129 () Unit!12076)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23611 (_ BitVec 64) (_ BitVec 32)) Unit!12076)

(assert (=> b!396303 (= lt!187129 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23612 (store (arr!11256 _keys!709) i!563 k0!794) (size!11608 _keys!709)) lt!187128 #b00000000000000000000000000000000))))

(assert (=> b!396303 (arrayContainsKey!0 (array!23612 (store (arr!11256 _keys!709) i!563 k0!794) (size!11608 _keys!709)) lt!187128 #b00000000000000000000000000000000)))

(declare-fun lt!187127 () Unit!12076)

(assert (=> b!396303 (= lt!187127 lt!187129)))

(declare-fun res!227332 () Bool)

(declare-datatypes ((SeekEntryResult!3526 0))(
  ( (MissingZero!3526 (index!16283 (_ BitVec 32))) (Found!3526 (index!16284 (_ BitVec 32))) (Intermediate!3526 (undefined!4338 Bool) (index!16285 (_ BitVec 32)) (x!38694 (_ BitVec 32))) (Undefined!3526) (MissingVacant!3526 (index!16286 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23611 (_ BitVec 32)) SeekEntryResult!3526)

(assert (=> b!396303 (= res!227332 (= (seekEntryOrOpen!0 (select (arr!11256 (array!23612 (store (arr!11256 _keys!709) i!563 k0!794) (size!11608 _keys!709))) #b00000000000000000000000000000000) (array!23612 (store (arr!11256 _keys!709) i!563 k0!794) (size!11608 _keys!709)) mask!1025) (Found!3526 #b00000000000000000000000000000000)))))

(assert (=> b!396303 (=> (not res!227332) (not e!239820))))

(declare-fun call!27895 () Bool)

(declare-fun bm!27892 () Bool)

(assert (=> bm!27892 (= call!27895 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!23612 (store (arr!11256 _keys!709) i!563 k0!794) (size!11608 _keys!709)) mask!1025))))

(declare-fun b!396305 () Bool)

(assert (=> b!396305 (= e!239820 call!27895)))

(declare-fun b!396306 () Bool)

(assert (=> b!396306 (= e!239821 call!27895)))

(declare-fun d!73399 () Bool)

(declare-fun res!227333 () Bool)

(declare-fun e!239819 () Bool)

(assert (=> d!73399 (=> res!227333 e!239819)))

(assert (=> d!73399 (= res!227333 (bvsge #b00000000000000000000000000000000 (size!11608 (array!23612 (store (arr!11256 _keys!709) i!563 k0!794) (size!11608 _keys!709)))))))

(assert (=> d!73399 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23612 (store (arr!11256 _keys!709) i!563 k0!794) (size!11608 _keys!709)) mask!1025) e!239819)))

(declare-fun b!396304 () Bool)

(assert (=> b!396304 (= e!239819 e!239821)))

(declare-fun c!54571 () Bool)

(assert (=> b!396304 (= c!54571 (validKeyInArray!0 (select (arr!11256 (array!23612 (store (arr!11256 _keys!709) i!563 k0!794) (size!11608 _keys!709))) #b00000000000000000000000000000000)))))

(assert (= (and d!73399 (not res!227333)) b!396304))

(assert (= (and b!396304 c!54571) b!396303))

(assert (= (and b!396304 (not c!54571)) b!396306))

(assert (= (and b!396303 res!227332) b!396305))

(assert (= (or b!396305 b!396306) bm!27892))

(declare-fun m!391991 () Bool)

(assert (=> b!396303 m!391991))

(declare-fun m!391993 () Bool)

(assert (=> b!396303 m!391993))

(declare-fun m!391995 () Bool)

(assert (=> b!396303 m!391995))

(assert (=> b!396303 m!391991))

(declare-fun m!391997 () Bool)

(assert (=> b!396303 m!391997))

(declare-fun m!391999 () Bool)

(assert (=> bm!27892 m!391999))

(assert (=> b!396304 m!391991))

(assert (=> b!396304 m!391991))

(declare-fun m!392001 () Bool)

(assert (=> b!396304 m!392001))

(assert (=> b!396211 d!73399))

(declare-fun d!73401 () Bool)

(assert (=> d!73401 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!396222 d!73401))

(declare-fun d!73403 () Bool)

(declare-fun res!227338 () Bool)

(declare-fun e!239826 () Bool)

(assert (=> d!73403 (=> res!227338 e!239826)))

(assert (=> d!73403 (= res!227338 ((_ is Nil!6520) Nil!6520))))

(assert (=> d!73403 (= (noDuplicate!200 Nil!6520) e!239826)))

(declare-fun b!396311 () Bool)

(declare-fun e!239827 () Bool)

(assert (=> b!396311 (= e!239826 e!239827)))

(declare-fun res!227339 () Bool)

(assert (=> b!396311 (=> (not res!227339) (not e!239827))))

(assert (=> b!396311 (= res!227339 (not (contains!2484 (t!11697 Nil!6520) (h!7375 Nil!6520))))))

(declare-fun b!396312 () Bool)

(assert (=> b!396312 (= e!239827 (noDuplicate!200 (t!11697 Nil!6520)))))

(assert (= (and d!73403 (not res!227338)) b!396311))

(assert (= (and b!396311 res!227339) b!396312))

(declare-fun m!392003 () Bool)

(assert (=> b!396311 m!392003))

(declare-fun m!392005 () Bool)

(assert (=> b!396312 m!392005))

(assert (=> b!396217 d!73403))

(declare-fun d!73405 () Bool)

(declare-fun res!227344 () Bool)

(declare-fun e!239832 () Bool)

(assert (=> d!73405 (=> res!227344 e!239832)))

(assert (=> d!73405 (= res!227344 (= (select (arr!11256 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!73405 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!239832)))

(declare-fun b!396317 () Bool)

(declare-fun e!239833 () Bool)

(assert (=> b!396317 (= e!239832 e!239833)))

(declare-fun res!227345 () Bool)

(assert (=> b!396317 (=> (not res!227345) (not e!239833))))

(assert (=> b!396317 (= res!227345 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11608 _keys!709)))))

(declare-fun b!396318 () Bool)

(assert (=> b!396318 (= e!239833 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73405 (not res!227344)) b!396317))

(assert (= (and b!396317 res!227345) b!396318))

(assert (=> d!73405 m!391983))

(declare-fun m!392007 () Bool)

(assert (=> b!396318 m!392007))

(assert (=> b!396212 d!73405))

(declare-fun b!396319 () Bool)

(declare-fun e!239836 () Bool)

(declare-fun e!239835 () Bool)

(assert (=> b!396319 (= e!239836 e!239835)))

(declare-fun lt!187131 () (_ BitVec 64))

(assert (=> b!396319 (= lt!187131 (select (arr!11256 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!187132 () Unit!12076)

(assert (=> b!396319 (= lt!187132 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187131 #b00000000000000000000000000000000))))

(assert (=> b!396319 (arrayContainsKey!0 _keys!709 lt!187131 #b00000000000000000000000000000000)))

(declare-fun lt!187130 () Unit!12076)

(assert (=> b!396319 (= lt!187130 lt!187132)))

(declare-fun res!227346 () Bool)

(assert (=> b!396319 (= res!227346 (= (seekEntryOrOpen!0 (select (arr!11256 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3526 #b00000000000000000000000000000000)))))

(assert (=> b!396319 (=> (not res!227346) (not e!239835))))

(declare-fun bm!27893 () Bool)

(declare-fun call!27896 () Bool)

(assert (=> bm!27893 (= call!27896 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!396321 () Bool)

(assert (=> b!396321 (= e!239835 call!27896)))

(declare-fun b!396322 () Bool)

(assert (=> b!396322 (= e!239836 call!27896)))

(declare-fun d!73407 () Bool)

(declare-fun res!227347 () Bool)

(declare-fun e!239834 () Bool)

(assert (=> d!73407 (=> res!227347 e!239834)))

(assert (=> d!73407 (= res!227347 (bvsge #b00000000000000000000000000000000 (size!11608 _keys!709)))))

(assert (=> d!73407 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239834)))

(declare-fun b!396320 () Bool)

(assert (=> b!396320 (= e!239834 e!239836)))

(declare-fun c!54572 () Bool)

(assert (=> b!396320 (= c!54572 (validKeyInArray!0 (select (arr!11256 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!73407 (not res!227347)) b!396320))

(assert (= (and b!396320 c!54572) b!396319))

(assert (= (and b!396320 (not c!54572)) b!396322))

(assert (= (and b!396319 res!227346) b!396321))

(assert (= (or b!396321 b!396322) bm!27893))

(assert (=> b!396319 m!391983))

(declare-fun m!392009 () Bool)

(assert (=> b!396319 m!392009))

(declare-fun m!392011 () Bool)

(assert (=> b!396319 m!392011))

(assert (=> b!396319 m!391983))

(declare-fun m!392013 () Bool)

(assert (=> b!396319 m!392013))

(declare-fun m!392015 () Bool)

(assert (=> bm!27893 m!392015))

(assert (=> b!396320 m!391983))

(assert (=> b!396320 m!391983))

(assert (=> b!396320 m!391985))

(assert (=> b!396218 d!73407))

(declare-fun d!73409 () Bool)

(declare-fun lt!187133 () Bool)

(assert (=> d!73409 (= lt!187133 (select (content!202 Nil!6520) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!239837 () Bool)

(assert (=> d!73409 (= lt!187133 e!239837)))

(declare-fun res!227348 () Bool)

(assert (=> d!73409 (=> (not res!227348) (not e!239837))))

(assert (=> d!73409 (= res!227348 ((_ is Cons!6519) Nil!6520))))

(assert (=> d!73409 (= (contains!2484 Nil!6520 #b1000000000000000000000000000000000000000000000000000000000000000) lt!187133)))

(declare-fun b!396323 () Bool)

(declare-fun e!239838 () Bool)

(assert (=> b!396323 (= e!239837 e!239838)))

(declare-fun res!227349 () Bool)

(assert (=> b!396323 (=> res!227349 e!239838)))

(assert (=> b!396323 (= res!227349 (= (h!7375 Nil!6520) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!396324 () Bool)

(assert (=> b!396324 (= e!239838 (contains!2484 (t!11697 Nil!6520) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!73409 res!227348) b!396323))

(assert (= (and b!396323 (not res!227349)) b!396324))

(assert (=> d!73409 m!391977))

(declare-fun m!392017 () Bool)

(assert (=> d!73409 m!392017))

(declare-fun m!392019 () Bool)

(assert (=> b!396324 m!392019))

(assert (=> b!396219 d!73409))

(declare-fun d!73411 () Bool)

(assert (=> d!73411 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!396225 d!73411))

(declare-fun d!73413 () Bool)

(assert (=> d!73413 (= (array_inv!8260 _values!549) (bvsge (size!11607 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38412 d!73413))

(declare-fun d!73415 () Bool)

(assert (=> d!73415 (= (array_inv!8261 _keys!709) (bvsge (size!11608 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38412 d!73415))

(declare-fun mapNonEmpty!16398 () Bool)

(declare-fun mapRes!16398 () Bool)

(declare-fun tp!32193 () Bool)

(declare-fun e!239843 () Bool)

(assert (=> mapNonEmpty!16398 (= mapRes!16398 (and tp!32193 e!239843))))

(declare-fun mapKey!16398 () (_ BitVec 32))

(declare-fun mapValue!16398 () ValueCell!4581)

(declare-fun mapRest!16398 () (Array (_ BitVec 32) ValueCell!4581))

(assert (=> mapNonEmpty!16398 (= mapRest!16392 (store mapRest!16398 mapKey!16398 mapValue!16398))))

(declare-fun b!396331 () Bool)

(assert (=> b!396331 (= e!239843 tp_is_empty!9849)))

(declare-fun mapIsEmpty!16398 () Bool)

(assert (=> mapIsEmpty!16398 mapRes!16398))

(declare-fun b!396332 () Bool)

(declare-fun e!239844 () Bool)

(assert (=> b!396332 (= e!239844 tp_is_empty!9849)))

(declare-fun condMapEmpty!16398 () Bool)

(declare-fun mapDefault!16398 () ValueCell!4581)

(assert (=> mapNonEmpty!16392 (= condMapEmpty!16398 (= mapRest!16392 ((as const (Array (_ BitVec 32) ValueCell!4581)) mapDefault!16398)))))

(assert (=> mapNonEmpty!16392 (= tp!32187 (and e!239844 mapRes!16398))))

(assert (= (and mapNonEmpty!16392 condMapEmpty!16398) mapIsEmpty!16398))

(assert (= (and mapNonEmpty!16392 (not condMapEmpty!16398)) mapNonEmpty!16398))

(assert (= (and mapNonEmpty!16398 ((_ is ValueCellFull!4581) mapValue!16398)) b!396331))

(assert (= (and mapNonEmpty!16392 ((_ is ValueCellFull!4581) mapDefault!16398)) b!396332))

(declare-fun m!392021 () Bool)

(assert (=> mapNonEmpty!16398 m!392021))

(check-sat tp_is_empty!9849 (not b!396293) (not b!396294) (not b!396311) (not b!396324) (not bm!27889) (not d!73395) (not bm!27893) (not mapNonEmpty!16398) (not b!396318) (not b!396320) (not b!396312) (not d!73409) (not b!396304) (not b!396290) (not bm!27892) (not b!396303) (not b!396279) (not b!396319))
(check-sat)
