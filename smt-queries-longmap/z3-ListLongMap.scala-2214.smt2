; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36714 () Bool)

(assert start!36714)

(declare-fun mapNonEmpty!14343 () Bool)

(declare-fun mapRes!14343 () Bool)

(declare-fun tp!28419 () Bool)

(declare-fun e!224246 () Bool)

(assert (=> mapNonEmpty!14343 (= mapRes!14343 (and tp!28419 e!224246))))

(declare-datatypes ((V!12467 0))(
  ( (V!12468 (val!4305 Int)) )
))
(declare-datatypes ((ValueCell!3917 0))(
  ( (ValueCellFull!3917 (v!6495 V!12467)) (EmptyCell!3917) )
))
(declare-datatypes ((array!20985 0))(
  ( (array!20986 (arr!9962 (Array (_ BitVec 32) ValueCell!3917)) (size!10315 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20985)

(declare-fun mapRest!14343 () (Array (_ BitVec 32) ValueCell!3917))

(declare-fun mapValue!14343 () ValueCell!3917)

(declare-fun mapKey!14343 () (_ BitVec 32))

(assert (=> mapNonEmpty!14343 (= (arr!9962 _values!506) (store mapRest!14343 mapKey!14343 mapValue!14343))))

(declare-fun b!366291 () Bool)

(declare-fun res!204933 () Bool)

(declare-fun e!224243 () Bool)

(assert (=> b!366291 (=> (not res!204933) (not e!224243))))

(declare-datatypes ((array!20987 0))(
  ( (array!20988 (arr!9963 (Array (_ BitVec 32) (_ BitVec 64))) (size!10316 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20987)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366291 (= res!204933 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366292 () Bool)

(declare-fun res!204940 () Bool)

(assert (=> b!366292 (=> (not res!204940) (not e!224243))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20987 (_ BitVec 32)) Bool)

(assert (=> b!366292 (= res!204940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20988 (store (arr!9963 _keys!658) i!548 k0!778) (size!10316 _keys!658)) mask!970))))

(declare-fun b!366293 () Bool)

(declare-fun e!224244 () Bool)

(declare-fun e!224242 () Bool)

(assert (=> b!366293 (= e!224244 (and e!224242 mapRes!14343))))

(declare-fun condMapEmpty!14343 () Bool)

(declare-fun mapDefault!14343 () ValueCell!3917)

(assert (=> b!366293 (= condMapEmpty!14343 (= (arr!9962 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3917)) mapDefault!14343)))))

(declare-fun b!366294 () Bool)

(declare-fun tp_is_empty!8521 () Bool)

(assert (=> b!366294 (= e!224246 tp_is_empty!8521)))

(declare-fun b!366295 () Bool)

(declare-fun res!204936 () Bool)

(assert (=> b!366295 (=> (not res!204936) (not e!224243))))

(declare-datatypes ((List!5514 0))(
  ( (Nil!5511) (Cons!5510 (h!6366 (_ BitVec 64)) (t!10655 List!5514)) )
))
(declare-fun arrayNoDuplicates!0 (array!20987 (_ BitVec 32) List!5514) Bool)

(assert (=> b!366295 (= res!204936 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5511))))

(declare-fun res!204938 () Bool)

(assert (=> start!36714 (=> (not res!204938) (not e!224243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36714 (= res!204938 (validMask!0 mask!970))))

(assert (=> start!36714 e!224243))

(assert (=> start!36714 true))

(declare-fun array_inv!7384 (array!20985) Bool)

(assert (=> start!36714 (and (array_inv!7384 _values!506) e!224244)))

(declare-fun array_inv!7385 (array!20987) Bool)

(assert (=> start!36714 (array_inv!7385 _keys!658)))

(declare-fun b!366296 () Bool)

(declare-fun res!204935 () Bool)

(assert (=> b!366296 (=> (not res!204935) (not e!224243))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366296 (= res!204935 (and (= (size!10315 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10316 _keys!658) (size!10315 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366297 () Bool)

(declare-fun res!204939 () Bool)

(assert (=> b!366297 (=> (not res!204939) (not e!224243))))

(assert (=> b!366297 (= res!204939 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10316 _keys!658))))))

(declare-fun b!366298 () Bool)

(declare-fun res!204942 () Bool)

(assert (=> b!366298 (=> (not res!204942) (not e!224243))))

(assert (=> b!366298 (= res!204942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14343 () Bool)

(assert (=> mapIsEmpty!14343 mapRes!14343))

(declare-fun b!366299 () Bool)

(declare-fun e!224247 () Bool)

(declare-fun contains!2427 (List!5514 (_ BitVec 64)) Bool)

(assert (=> b!366299 (= e!224247 (contains!2427 Nil!5511 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366300 () Bool)

(declare-fun res!204932 () Bool)

(assert (=> b!366300 (=> (not res!204932) (not e!224243))))

(assert (=> b!366300 (= res!204932 (or (= (select (arr!9963 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9963 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366301 () Bool)

(declare-fun res!204943 () Bool)

(assert (=> b!366301 (=> (not res!204943) (not e!224243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366301 (= res!204943 (validKeyInArray!0 k0!778))))

(declare-fun b!366302 () Bool)

(assert (=> b!366302 (= e!224243 e!224247)))

(declare-fun res!204934 () Bool)

(assert (=> b!366302 (=> res!204934 e!224247)))

(assert (=> b!366302 (= res!204934 (contains!2427 Nil!5511 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366303 () Bool)

(declare-fun res!204941 () Bool)

(assert (=> b!366303 (=> (not res!204941) (not e!224243))))

(declare-fun noDuplicate!191 (List!5514) Bool)

(assert (=> b!366303 (= res!204941 (noDuplicate!191 Nil!5511))))

(declare-fun b!366304 () Bool)

(assert (=> b!366304 (= e!224242 tp_is_empty!8521)))

(declare-fun b!366305 () Bool)

(declare-fun res!204937 () Bool)

(assert (=> b!366305 (=> (not res!204937) (not e!224243))))

(assert (=> b!366305 (= res!204937 (and (bvsle #b00000000000000000000000000000000 (size!10316 _keys!658)) (bvslt (size!10316 _keys!658) #b01111111111111111111111111111111)))))

(assert (= (and start!36714 res!204938) b!366296))

(assert (= (and b!366296 res!204935) b!366298))

(assert (= (and b!366298 res!204942) b!366295))

(assert (= (and b!366295 res!204936) b!366297))

(assert (= (and b!366297 res!204939) b!366301))

(assert (= (and b!366301 res!204943) b!366300))

(assert (= (and b!366300 res!204932) b!366291))

(assert (= (and b!366291 res!204933) b!366292))

(assert (= (and b!366292 res!204940) b!366305))

(assert (= (and b!366305 res!204937) b!366303))

(assert (= (and b!366303 res!204941) b!366302))

(assert (= (and b!366302 (not res!204934)) b!366299))

(assert (= (and b!366293 condMapEmpty!14343) mapIsEmpty!14343))

(assert (= (and b!366293 (not condMapEmpty!14343)) mapNonEmpty!14343))

(get-info :version)

(assert (= (and mapNonEmpty!14343 ((_ is ValueCellFull!3917) mapValue!14343)) b!366294))

(assert (= (and b!366293 ((_ is ValueCellFull!3917) mapDefault!14343)) b!366304))

(assert (= start!36714 b!366293))

(declare-fun m!363109 () Bool)

(assert (=> b!366295 m!363109))

(declare-fun m!363111 () Bool)

(assert (=> b!366301 m!363111))

(declare-fun m!363113 () Bool)

(assert (=> b!366300 m!363113))

(declare-fun m!363115 () Bool)

(assert (=> b!366302 m!363115))

(declare-fun m!363117 () Bool)

(assert (=> b!366299 m!363117))

(declare-fun m!363119 () Bool)

(assert (=> start!36714 m!363119))

(declare-fun m!363121 () Bool)

(assert (=> start!36714 m!363121))

(declare-fun m!363123 () Bool)

(assert (=> start!36714 m!363123))

(declare-fun m!363125 () Bool)

(assert (=> mapNonEmpty!14343 m!363125))

(declare-fun m!363127 () Bool)

(assert (=> b!366291 m!363127))

(declare-fun m!363129 () Bool)

(assert (=> b!366292 m!363129))

(declare-fun m!363131 () Bool)

(assert (=> b!366292 m!363131))

(declare-fun m!363133 () Bool)

(assert (=> b!366303 m!363133))

(declare-fun m!363135 () Bool)

(assert (=> b!366298 m!363135))

(check-sat (not b!366295) tp_is_empty!8521 (not b!366301) (not b!366291) (not b!366298) (not b!366303) (not b!366292) (not mapNonEmpty!14343) (not start!36714) (not b!366299) (not b!366302))
(check-sat)
(get-model)

(declare-fun d!72221 () Bool)

(declare-fun res!205020 () Bool)

(declare-fun e!224288 () Bool)

(assert (=> d!72221 (=> res!205020 e!224288)))

(assert (=> d!72221 (= res!205020 ((_ is Nil!5511) Nil!5511))))

(assert (=> d!72221 (= (noDuplicate!191 Nil!5511) e!224288)))

(declare-fun b!366400 () Bool)

(declare-fun e!224289 () Bool)

(assert (=> b!366400 (= e!224288 e!224289)))

(declare-fun res!205021 () Bool)

(assert (=> b!366400 (=> (not res!205021) (not e!224289))))

(assert (=> b!366400 (= res!205021 (not (contains!2427 (t!10655 Nil!5511) (h!6366 Nil!5511))))))

(declare-fun b!366401 () Bool)

(assert (=> b!366401 (= e!224289 (noDuplicate!191 (t!10655 Nil!5511)))))

(assert (= (and d!72221 (not res!205020)) b!366400))

(assert (= (and b!366400 res!205021) b!366401))

(declare-fun m!363193 () Bool)

(assert (=> b!366400 m!363193))

(declare-fun m!363195 () Bool)

(assert (=> b!366401 m!363195))

(assert (=> b!366303 d!72221))

(declare-fun b!366412 () Bool)

(declare-fun e!224301 () Bool)

(declare-fun call!27279 () Bool)

(assert (=> b!366412 (= e!224301 call!27279)))

(declare-fun b!366413 () Bool)

(declare-fun e!224300 () Bool)

(assert (=> b!366413 (= e!224300 (contains!2427 Nil!5511 (select (arr!9963 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27276 () Bool)

(declare-fun c!53849 () Bool)

(assert (=> bm!27276 (= call!27279 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53849 (Cons!5510 (select (arr!9963 _keys!658) #b00000000000000000000000000000000) Nil!5511) Nil!5511)))))

(declare-fun b!366414 () Bool)

(assert (=> b!366414 (= e!224301 call!27279)))

(declare-fun d!72223 () Bool)

(declare-fun res!205029 () Bool)

(declare-fun e!224299 () Bool)

(assert (=> d!72223 (=> res!205029 e!224299)))

(assert (=> d!72223 (= res!205029 (bvsge #b00000000000000000000000000000000 (size!10316 _keys!658)))))

(assert (=> d!72223 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5511) e!224299)))

(declare-fun b!366415 () Bool)

(declare-fun e!224298 () Bool)

(assert (=> b!366415 (= e!224298 e!224301)))

(assert (=> b!366415 (= c!53849 (validKeyInArray!0 (select (arr!9963 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366416 () Bool)

(assert (=> b!366416 (= e!224299 e!224298)))

(declare-fun res!205030 () Bool)

(assert (=> b!366416 (=> (not res!205030) (not e!224298))))

(assert (=> b!366416 (= res!205030 (not e!224300))))

(declare-fun res!205028 () Bool)

(assert (=> b!366416 (=> (not res!205028) (not e!224300))))

(assert (=> b!366416 (= res!205028 (validKeyInArray!0 (select (arr!9963 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72223 (not res!205029)) b!366416))

(assert (= (and b!366416 res!205028) b!366413))

(assert (= (and b!366416 res!205030) b!366415))

(assert (= (and b!366415 c!53849) b!366414))

(assert (= (and b!366415 (not c!53849)) b!366412))

(assert (= (or b!366414 b!366412) bm!27276))

(declare-fun m!363197 () Bool)

(assert (=> b!366413 m!363197))

(assert (=> b!366413 m!363197))

(declare-fun m!363199 () Bool)

(assert (=> b!366413 m!363199))

(assert (=> bm!27276 m!363197))

(declare-fun m!363201 () Bool)

(assert (=> bm!27276 m!363201))

(assert (=> b!366415 m!363197))

(assert (=> b!366415 m!363197))

(declare-fun m!363203 () Bool)

(assert (=> b!366415 m!363203))

(assert (=> b!366416 m!363197))

(assert (=> b!366416 m!363197))

(assert (=> b!366416 m!363203))

(assert (=> b!366295 d!72223))

(declare-fun d!72225 () Bool)

(assert (=> d!72225 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36714 d!72225))

(declare-fun d!72227 () Bool)

(assert (=> d!72227 (= (array_inv!7384 _values!506) (bvsge (size!10315 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36714 d!72227))

(declare-fun d!72229 () Bool)

(assert (=> d!72229 (= (array_inv!7385 _keys!658) (bvsge (size!10316 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36714 d!72229))

(declare-fun d!72231 () Bool)

(declare-fun lt!169016 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!201 (List!5514) (InoxSet (_ BitVec 64)))

(assert (=> d!72231 (= lt!169016 (select (content!201 Nil!5511) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!224307 () Bool)

(assert (=> d!72231 (= lt!169016 e!224307)))

(declare-fun res!205035 () Bool)

(assert (=> d!72231 (=> (not res!205035) (not e!224307))))

(assert (=> d!72231 (= res!205035 ((_ is Cons!5510) Nil!5511))))

(assert (=> d!72231 (= (contains!2427 Nil!5511 #b1000000000000000000000000000000000000000000000000000000000000000) lt!169016)))

(declare-fun b!366421 () Bool)

(declare-fun e!224306 () Bool)

(assert (=> b!366421 (= e!224307 e!224306)))

(declare-fun res!205036 () Bool)

(assert (=> b!366421 (=> res!205036 e!224306)))

(assert (=> b!366421 (= res!205036 (= (h!6366 Nil!5511) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366422 () Bool)

(assert (=> b!366422 (= e!224306 (contains!2427 (t!10655 Nil!5511) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72231 res!205035) b!366421))

(assert (= (and b!366421 (not res!205036)) b!366422))

(declare-fun m!363205 () Bool)

(assert (=> d!72231 m!363205))

(declare-fun m!363207 () Bool)

(assert (=> d!72231 m!363207))

(declare-fun m!363209 () Bool)

(assert (=> b!366422 m!363209))

(assert (=> b!366299 d!72231))

(declare-fun d!72233 () Bool)

(declare-fun res!205041 () Bool)

(declare-fun e!224312 () Bool)

(assert (=> d!72233 (=> res!205041 e!224312)))

(assert (=> d!72233 (= res!205041 (= (select (arr!9963 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72233 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!224312)))

(declare-fun b!366427 () Bool)

(declare-fun e!224313 () Bool)

(assert (=> b!366427 (= e!224312 e!224313)))

(declare-fun res!205042 () Bool)

(assert (=> b!366427 (=> (not res!205042) (not e!224313))))

(assert (=> b!366427 (= res!205042 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!10316 _keys!658)))))

(declare-fun b!366428 () Bool)

(assert (=> b!366428 (= e!224313 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72233 (not res!205041)) b!366427))

(assert (= (and b!366427 res!205042) b!366428))

(assert (=> d!72233 m!363197))

(declare-fun m!363211 () Bool)

(assert (=> b!366428 m!363211))

(assert (=> b!366291 d!72233))

(declare-fun d!72235 () Bool)

(assert (=> d!72235 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!366301 d!72235))

(declare-fun d!72237 () Bool)

(declare-fun lt!169017 () Bool)

(assert (=> d!72237 (= lt!169017 (select (content!201 Nil!5511) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!224315 () Bool)

(assert (=> d!72237 (= lt!169017 e!224315)))

(declare-fun res!205043 () Bool)

(assert (=> d!72237 (=> (not res!205043) (not e!224315))))

(assert (=> d!72237 (= res!205043 ((_ is Cons!5510) Nil!5511))))

(assert (=> d!72237 (= (contains!2427 Nil!5511 #b0000000000000000000000000000000000000000000000000000000000000000) lt!169017)))

(declare-fun b!366429 () Bool)

(declare-fun e!224314 () Bool)

(assert (=> b!366429 (= e!224315 e!224314)))

(declare-fun res!205044 () Bool)

(assert (=> b!366429 (=> res!205044 e!224314)))

(assert (=> b!366429 (= res!205044 (= (h!6366 Nil!5511) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!366430 () Bool)

(assert (=> b!366430 (= e!224314 (contains!2427 (t!10655 Nil!5511) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72237 res!205043) b!366429))

(assert (= (and b!366429 (not res!205044)) b!366430))

(assert (=> d!72237 m!363205))

(declare-fun m!363213 () Bool)

(assert (=> d!72237 m!363213))

(declare-fun m!363215 () Bool)

(assert (=> b!366430 m!363215))

(assert (=> b!366302 d!72237))

(declare-fun b!366439 () Bool)

(declare-fun e!224322 () Bool)

(declare-fun e!224324 () Bool)

(assert (=> b!366439 (= e!224322 e!224324)))

(declare-fun lt!169026 () (_ BitVec 64))

(assert (=> b!366439 (= lt!169026 (select (arr!9963 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11374 0))(
  ( (Unit!11375) )
))
(declare-fun lt!169024 () Unit!11374)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20987 (_ BitVec 64) (_ BitVec 32)) Unit!11374)

(assert (=> b!366439 (= lt!169024 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169026 #b00000000000000000000000000000000))))

(assert (=> b!366439 (arrayContainsKey!0 _keys!658 lt!169026 #b00000000000000000000000000000000)))

(declare-fun lt!169025 () Unit!11374)

(assert (=> b!366439 (= lt!169025 lt!169024)))

(declare-fun res!205049 () Bool)

(declare-datatypes ((SeekEntryResult!3502 0))(
  ( (MissingZero!3502 (index!16187 (_ BitVec 32))) (Found!3502 (index!16188 (_ BitVec 32))) (Intermediate!3502 (undefined!4314 Bool) (index!16189 (_ BitVec 32)) (x!36751 (_ BitVec 32))) (Undefined!3502) (MissingVacant!3502 (index!16190 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20987 (_ BitVec 32)) SeekEntryResult!3502)

(assert (=> b!366439 (= res!205049 (= (seekEntryOrOpen!0 (select (arr!9963 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3502 #b00000000000000000000000000000000)))))

(assert (=> b!366439 (=> (not res!205049) (not e!224324))))

(declare-fun bm!27279 () Bool)

(declare-fun call!27282 () Bool)

(assert (=> bm!27279 (= call!27282 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun d!72239 () Bool)

(declare-fun res!205050 () Bool)

(declare-fun e!224323 () Bool)

(assert (=> d!72239 (=> res!205050 e!224323)))

(assert (=> d!72239 (= res!205050 (bvsge #b00000000000000000000000000000000 (size!10316 _keys!658)))))

(assert (=> d!72239 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!224323)))

(declare-fun b!366440 () Bool)

(assert (=> b!366440 (= e!224324 call!27282)))

(declare-fun b!366441 () Bool)

(assert (=> b!366441 (= e!224323 e!224322)))

(declare-fun c!53852 () Bool)

(assert (=> b!366441 (= c!53852 (validKeyInArray!0 (select (arr!9963 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366442 () Bool)

(assert (=> b!366442 (= e!224322 call!27282)))

(assert (= (and d!72239 (not res!205050)) b!366441))

(assert (= (and b!366441 c!53852) b!366439))

(assert (= (and b!366441 (not c!53852)) b!366442))

(assert (= (and b!366439 res!205049) b!366440))

(assert (= (or b!366440 b!366442) bm!27279))

(assert (=> b!366439 m!363197))

(declare-fun m!363217 () Bool)

(assert (=> b!366439 m!363217))

(declare-fun m!363219 () Bool)

(assert (=> b!366439 m!363219))

(assert (=> b!366439 m!363197))

(declare-fun m!363221 () Bool)

(assert (=> b!366439 m!363221))

(declare-fun m!363223 () Bool)

(assert (=> bm!27279 m!363223))

(assert (=> b!366441 m!363197))

(assert (=> b!366441 m!363197))

(assert (=> b!366441 m!363203))

(assert (=> b!366298 d!72239))

(declare-fun b!366443 () Bool)

(declare-fun e!224325 () Bool)

(declare-fun e!224327 () Bool)

(assert (=> b!366443 (= e!224325 e!224327)))

(declare-fun lt!169029 () (_ BitVec 64))

(assert (=> b!366443 (= lt!169029 (select (arr!9963 (array!20988 (store (arr!9963 _keys!658) i!548 k0!778) (size!10316 _keys!658))) #b00000000000000000000000000000000))))

(declare-fun lt!169027 () Unit!11374)

(assert (=> b!366443 (= lt!169027 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20988 (store (arr!9963 _keys!658) i!548 k0!778) (size!10316 _keys!658)) lt!169029 #b00000000000000000000000000000000))))

(assert (=> b!366443 (arrayContainsKey!0 (array!20988 (store (arr!9963 _keys!658) i!548 k0!778) (size!10316 _keys!658)) lt!169029 #b00000000000000000000000000000000)))

(declare-fun lt!169028 () Unit!11374)

(assert (=> b!366443 (= lt!169028 lt!169027)))

(declare-fun res!205051 () Bool)

(assert (=> b!366443 (= res!205051 (= (seekEntryOrOpen!0 (select (arr!9963 (array!20988 (store (arr!9963 _keys!658) i!548 k0!778) (size!10316 _keys!658))) #b00000000000000000000000000000000) (array!20988 (store (arr!9963 _keys!658) i!548 k0!778) (size!10316 _keys!658)) mask!970) (Found!3502 #b00000000000000000000000000000000)))))

(assert (=> b!366443 (=> (not res!205051) (not e!224327))))

(declare-fun bm!27280 () Bool)

(declare-fun call!27283 () Bool)

(assert (=> bm!27280 (= call!27283 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!20988 (store (arr!9963 _keys!658) i!548 k0!778) (size!10316 _keys!658)) mask!970))))

(declare-fun d!72241 () Bool)

(declare-fun res!205052 () Bool)

(declare-fun e!224326 () Bool)

(assert (=> d!72241 (=> res!205052 e!224326)))

(assert (=> d!72241 (= res!205052 (bvsge #b00000000000000000000000000000000 (size!10316 (array!20988 (store (arr!9963 _keys!658) i!548 k0!778) (size!10316 _keys!658)))))))

(assert (=> d!72241 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20988 (store (arr!9963 _keys!658) i!548 k0!778) (size!10316 _keys!658)) mask!970) e!224326)))

(declare-fun b!366444 () Bool)

(assert (=> b!366444 (= e!224327 call!27283)))

(declare-fun b!366445 () Bool)

(assert (=> b!366445 (= e!224326 e!224325)))

(declare-fun c!53853 () Bool)

(assert (=> b!366445 (= c!53853 (validKeyInArray!0 (select (arr!9963 (array!20988 (store (arr!9963 _keys!658) i!548 k0!778) (size!10316 _keys!658))) #b00000000000000000000000000000000)))))

(declare-fun b!366446 () Bool)

(assert (=> b!366446 (= e!224325 call!27283)))

(assert (= (and d!72241 (not res!205052)) b!366445))

(assert (= (and b!366445 c!53853) b!366443))

(assert (= (and b!366445 (not c!53853)) b!366446))

(assert (= (and b!366443 res!205051) b!366444))

(assert (= (or b!366444 b!366446) bm!27280))

(declare-fun m!363225 () Bool)

(assert (=> b!366443 m!363225))

(declare-fun m!363227 () Bool)

(assert (=> b!366443 m!363227))

(declare-fun m!363229 () Bool)

(assert (=> b!366443 m!363229))

(assert (=> b!366443 m!363225))

(declare-fun m!363231 () Bool)

(assert (=> b!366443 m!363231))

(declare-fun m!363233 () Bool)

(assert (=> bm!27280 m!363233))

(assert (=> b!366445 m!363225))

(assert (=> b!366445 m!363225))

(declare-fun m!363235 () Bool)

(assert (=> b!366445 m!363235))

(assert (=> b!366292 d!72241))

(declare-fun b!366454 () Bool)

(declare-fun e!224333 () Bool)

(assert (=> b!366454 (= e!224333 tp_is_empty!8521)))

(declare-fun mapIsEmpty!14352 () Bool)

(declare-fun mapRes!14352 () Bool)

(assert (=> mapIsEmpty!14352 mapRes!14352))

(declare-fun b!366453 () Bool)

(declare-fun e!224332 () Bool)

(assert (=> b!366453 (= e!224332 tp_is_empty!8521)))

(declare-fun condMapEmpty!14352 () Bool)

(declare-fun mapDefault!14352 () ValueCell!3917)

(assert (=> mapNonEmpty!14343 (= condMapEmpty!14352 (= mapRest!14343 ((as const (Array (_ BitVec 32) ValueCell!3917)) mapDefault!14352)))))

(assert (=> mapNonEmpty!14343 (= tp!28419 (and e!224333 mapRes!14352))))

(declare-fun mapNonEmpty!14352 () Bool)

(declare-fun tp!28428 () Bool)

(assert (=> mapNonEmpty!14352 (= mapRes!14352 (and tp!28428 e!224332))))

(declare-fun mapRest!14352 () (Array (_ BitVec 32) ValueCell!3917))

(declare-fun mapValue!14352 () ValueCell!3917)

(declare-fun mapKey!14352 () (_ BitVec 32))

(assert (=> mapNonEmpty!14352 (= mapRest!14343 (store mapRest!14352 mapKey!14352 mapValue!14352))))

(assert (= (and mapNonEmpty!14343 condMapEmpty!14352) mapIsEmpty!14352))

(assert (= (and mapNonEmpty!14343 (not condMapEmpty!14352)) mapNonEmpty!14352))

(assert (= (and mapNonEmpty!14352 ((_ is ValueCellFull!3917) mapValue!14352)) b!366453))

(assert (= (and mapNonEmpty!14343 ((_ is ValueCellFull!3917) mapDefault!14352)) b!366454))

(declare-fun m!363237 () Bool)

(assert (=> mapNonEmpty!14352 m!363237))

(check-sat (not bm!27276) (not b!366428) (not b!366441) (not b!366416) (not d!72237) (not bm!27280) (not b!366401) (not b!366413) (not b!366443) (not b!366415) (not b!366422) (not b!366400) tp_is_empty!8521 (not b!366445) (not b!366430) (not d!72231) (not mapNonEmpty!14352) (not bm!27279) (not b!366439))
(check-sat)
