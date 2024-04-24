; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36692 () Bool)

(assert start!36692)

(declare-fun b!366341 () Bool)

(declare-fun res!204936 () Bool)

(declare-fun e!224296 () Bool)

(assert (=> b!366341 (=> (not res!204936) (not e!224296))))

(declare-datatypes ((array!20976 0))(
  ( (array!20977 (arr!9958 (Array (_ BitVec 32) (_ BitVec 64))) (size!10310 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20976)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366341 (= res!204936 (or (= (select (arr!9958 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9958 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366342 () Bool)

(declare-fun res!204939 () Bool)

(assert (=> b!366342 (=> (not res!204939) (not e!224296))))

(assert (=> b!366342 (= res!204939 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10310 _keys!658))))))

(declare-fun b!366343 () Bool)

(declare-fun e!224295 () Bool)

(declare-fun tp_is_empty!8515 () Bool)

(assert (=> b!366343 (= e!224295 tp_is_empty!8515)))

(declare-fun b!366344 () Bool)

(declare-fun res!204940 () Bool)

(assert (=> b!366344 (=> (not res!204940) (not e!224296))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12459 0))(
  ( (V!12460 (val!4302 Int)) )
))
(declare-datatypes ((ValueCell!3914 0))(
  ( (ValueCellFull!3914 (v!6499 V!12459)) (EmptyCell!3914) )
))
(declare-datatypes ((array!20978 0))(
  ( (array!20979 (arr!9959 (Array (_ BitVec 32) ValueCell!3914)) (size!10311 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20978)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!366344 (= res!204940 (and (= (size!10311 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10310 _keys!658) (size!10311 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366345 () Bool)

(declare-fun e!224297 () Bool)

(assert (=> b!366345 (= e!224297 tp_is_empty!8515)))

(declare-fun mapIsEmpty!14331 () Bool)

(declare-fun mapRes!14331 () Bool)

(assert (=> mapIsEmpty!14331 mapRes!14331))

(declare-fun b!366346 () Bool)

(declare-fun res!204943 () Bool)

(assert (=> b!366346 (=> (not res!204943) (not e!224296))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20976 (_ BitVec 32)) Bool)

(assert (=> b!366346 (= res!204943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20977 (store (arr!9958 _keys!658) i!548 k0!778) (size!10310 _keys!658)) mask!970))))

(declare-fun b!366347 () Bool)

(declare-fun res!204935 () Bool)

(assert (=> b!366347 (=> (not res!204935) (not e!224296))))

(declare-fun arrayContainsKey!0 (array!20976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366347 (= res!204935 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!204942 () Bool)

(assert (=> start!36692 (=> (not res!204942) (not e!224296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36692 (= res!204942 (validMask!0 mask!970))))

(assert (=> start!36692 e!224296))

(assert (=> start!36692 true))

(declare-fun e!224298 () Bool)

(declare-fun array_inv!7406 (array!20978) Bool)

(assert (=> start!36692 (and (array_inv!7406 _values!506) e!224298)))

(declare-fun array_inv!7407 (array!20976) Bool)

(assert (=> start!36692 (array_inv!7407 _keys!658)))

(declare-fun b!366348 () Bool)

(assert (=> b!366348 (= e!224298 (and e!224295 mapRes!14331))))

(declare-fun condMapEmpty!14331 () Bool)

(declare-fun mapDefault!14331 () ValueCell!3914)

(assert (=> b!366348 (= condMapEmpty!14331 (= (arr!9959 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3914)) mapDefault!14331)))))

(declare-fun b!366349 () Bool)

(declare-fun res!204944 () Bool)

(assert (=> b!366349 (=> (not res!204944) (not e!224296))))

(assert (=> b!366349 (= res!204944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366350 () Bool)

(declare-fun res!204938 () Bool)

(assert (=> b!366350 (=> (not res!204938) (not e!224296))))

(assert (=> b!366350 (= res!204938 (and (bvsle #b00000000000000000000000000000000 (size!10310 _keys!658)) (bvslt (size!10310 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!14331 () Bool)

(declare-fun tp!28407 () Bool)

(assert (=> mapNonEmpty!14331 (= mapRes!14331 (and tp!28407 e!224297))))

(declare-fun mapValue!14331 () ValueCell!3914)

(declare-fun mapRest!14331 () (Array (_ BitVec 32) ValueCell!3914))

(declare-fun mapKey!14331 () (_ BitVec 32))

(assert (=> mapNonEmpty!14331 (= (arr!9959 _values!506) (store mapRest!14331 mapKey!14331 mapValue!14331))))

(declare-fun b!366351 () Bool)

(declare-fun res!204941 () Bool)

(assert (=> b!366351 (=> (not res!204941) (not e!224296))))

(declare-datatypes ((List!5456 0))(
  ( (Nil!5453) (Cons!5452 (h!6308 (_ BitVec 64)) (t!10598 List!5456)) )
))
(declare-fun arrayNoDuplicates!0 (array!20976 (_ BitVec 32) List!5456) Bool)

(assert (=> b!366351 (= res!204941 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5453))))

(declare-fun b!366352 () Bool)

(declare-fun noDuplicate!191 (List!5456) Bool)

(assert (=> b!366352 (= e!224296 (not (noDuplicate!191 Nil!5453)))))

(declare-fun b!366353 () Bool)

(declare-fun res!204937 () Bool)

(assert (=> b!366353 (=> (not res!204937) (not e!224296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366353 (= res!204937 (validKeyInArray!0 k0!778))))

(assert (= (and start!36692 res!204942) b!366344))

(assert (= (and b!366344 res!204940) b!366349))

(assert (= (and b!366349 res!204944) b!366351))

(assert (= (and b!366351 res!204941) b!366342))

(assert (= (and b!366342 res!204939) b!366353))

(assert (= (and b!366353 res!204937) b!366341))

(assert (= (and b!366341 res!204936) b!366347))

(assert (= (and b!366347 res!204935) b!366346))

(assert (= (and b!366346 res!204943) b!366350))

(assert (= (and b!366350 res!204938) b!366352))

(assert (= (and b!366348 condMapEmpty!14331) mapIsEmpty!14331))

(assert (= (and b!366348 (not condMapEmpty!14331)) mapNonEmpty!14331))

(get-info :version)

(assert (= (and mapNonEmpty!14331 ((_ is ValueCellFull!3914) mapValue!14331)) b!366345))

(assert (= (and b!366348 ((_ is ValueCellFull!3914) mapDefault!14331)) b!366343))

(assert (= start!36692 b!366348))

(declare-fun m!363955 () Bool)

(assert (=> b!366351 m!363955))

(declare-fun m!363957 () Bool)

(assert (=> b!366347 m!363957))

(declare-fun m!363959 () Bool)

(assert (=> b!366349 m!363959))

(declare-fun m!363961 () Bool)

(assert (=> mapNonEmpty!14331 m!363961))

(declare-fun m!363963 () Bool)

(assert (=> b!366352 m!363963))

(declare-fun m!363965 () Bool)

(assert (=> b!366353 m!363965))

(declare-fun m!363967 () Bool)

(assert (=> b!366341 m!363967))

(declare-fun m!363969 () Bool)

(assert (=> start!36692 m!363969))

(declare-fun m!363971 () Bool)

(assert (=> start!36692 m!363971))

(declare-fun m!363973 () Bool)

(assert (=> start!36692 m!363973))

(declare-fun m!363975 () Bool)

(assert (=> b!366346 m!363975))

(declare-fun m!363977 () Bool)

(assert (=> b!366346 m!363977))

(check-sat (not mapNonEmpty!14331) (not b!366353) (not b!366352) tp_is_empty!8515 (not b!366347) (not b!366346) (not b!366351) (not start!36692) (not b!366349))
(check-sat)
(get-model)

(declare-fun d!72435 () Bool)

(declare-fun res!205009 () Bool)

(declare-fun e!224334 () Bool)

(assert (=> d!72435 (=> res!205009 e!224334)))

(assert (=> d!72435 (= res!205009 (= (select (arr!9958 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72435 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!224334)))

(declare-fun b!366436 () Bool)

(declare-fun e!224335 () Bool)

(assert (=> b!366436 (= e!224334 e!224335)))

(declare-fun res!205010 () Bool)

(assert (=> b!366436 (=> (not res!205010) (not e!224335))))

(assert (=> b!366436 (= res!205010 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!10310 _keys!658)))))

(declare-fun b!366437 () Bool)

(assert (=> b!366437 (= e!224335 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72435 (not res!205009)) b!366436))

(assert (= (and b!366436 res!205010) b!366437))

(declare-fun m!364027 () Bool)

(assert (=> d!72435 m!364027))

(declare-fun m!364029 () Bool)

(assert (=> b!366437 m!364029))

(assert (=> b!366347 d!72435))

(declare-fun d!72437 () Bool)

(declare-fun res!205015 () Bool)

(declare-fun e!224340 () Bool)

(assert (=> d!72437 (=> res!205015 e!224340)))

(assert (=> d!72437 (= res!205015 ((_ is Nil!5453) Nil!5453))))

(assert (=> d!72437 (= (noDuplicate!191 Nil!5453) e!224340)))

(declare-fun b!366442 () Bool)

(declare-fun e!224341 () Bool)

(assert (=> b!366442 (= e!224340 e!224341)))

(declare-fun res!205016 () Bool)

(assert (=> b!366442 (=> (not res!205016) (not e!224341))))

(declare-fun contains!2417 (List!5456 (_ BitVec 64)) Bool)

(assert (=> b!366442 (= res!205016 (not (contains!2417 (t!10598 Nil!5453) (h!6308 Nil!5453))))))

(declare-fun b!366443 () Bool)

(assert (=> b!366443 (= e!224341 (noDuplicate!191 (t!10598 Nil!5453)))))

(assert (= (and d!72437 (not res!205015)) b!366442))

(assert (= (and b!366442 res!205016) b!366443))

(declare-fun m!364031 () Bool)

(assert (=> b!366442 m!364031))

(declare-fun m!364033 () Bool)

(assert (=> b!366443 m!364033))

(assert (=> b!366352 d!72437))

(declare-fun d!72439 () Bool)

(assert (=> d!72439 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36692 d!72439))

(declare-fun d!72441 () Bool)

(assert (=> d!72441 (= (array_inv!7406 _values!506) (bvsge (size!10311 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36692 d!72441))

(declare-fun d!72443 () Bool)

(assert (=> d!72443 (= (array_inv!7407 _keys!658) (bvsge (size!10310 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36692 d!72443))

(declare-fun d!72445 () Bool)

(assert (=> d!72445 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!366353 d!72445))

(declare-fun b!366452 () Bool)

(declare-fun e!224349 () Bool)

(declare-fun e!224348 () Bool)

(assert (=> b!366452 (= e!224349 e!224348)))

(declare-fun c!53890 () Bool)

(assert (=> b!366452 (= c!53890 (validKeyInArray!0 (select (arr!9958 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72447 () Bool)

(declare-fun res!205022 () Bool)

(assert (=> d!72447 (=> res!205022 e!224349)))

(assert (=> d!72447 (= res!205022 (bvsge #b00000000000000000000000000000000 (size!10310 _keys!658)))))

(assert (=> d!72447 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!224349)))

(declare-fun b!366453 () Bool)

(declare-fun e!224350 () Bool)

(assert (=> b!366453 (= e!224348 e!224350)))

(declare-fun lt!169263 () (_ BitVec 64))

(assert (=> b!366453 (= lt!169263 (select (arr!9958 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11383 0))(
  ( (Unit!11384) )
))
(declare-fun lt!169261 () Unit!11383)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20976 (_ BitVec 64) (_ BitVec 32)) Unit!11383)

(assert (=> b!366453 (= lt!169261 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169263 #b00000000000000000000000000000000))))

(assert (=> b!366453 (arrayContainsKey!0 _keys!658 lt!169263 #b00000000000000000000000000000000)))

(declare-fun lt!169262 () Unit!11383)

(assert (=> b!366453 (= lt!169262 lt!169261)))

(declare-fun res!205021 () Bool)

(declare-datatypes ((SeekEntryResult!3455 0))(
  ( (MissingZero!3455 (index!15999 (_ BitVec 32))) (Found!3455 (index!16000 (_ BitVec 32))) (Intermediate!3455 (undefined!4267 Bool) (index!16001 (_ BitVec 32)) (x!36696 (_ BitVec 32))) (Undefined!3455) (MissingVacant!3455 (index!16002 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20976 (_ BitVec 32)) SeekEntryResult!3455)

(assert (=> b!366453 (= res!205021 (= (seekEntryOrOpen!0 (select (arr!9958 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3455 #b00000000000000000000000000000000)))))

(assert (=> b!366453 (=> (not res!205021) (not e!224350))))

(declare-fun b!366454 () Bool)

(declare-fun call!27284 () Bool)

(assert (=> b!366454 (= e!224348 call!27284)))

(declare-fun b!366455 () Bool)

(assert (=> b!366455 (= e!224350 call!27284)))

(declare-fun bm!27281 () Bool)

(assert (=> bm!27281 (= call!27284 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(assert (= (and d!72447 (not res!205022)) b!366452))

(assert (= (and b!366452 c!53890) b!366453))

(assert (= (and b!366452 (not c!53890)) b!366454))

(assert (= (and b!366453 res!205021) b!366455))

(assert (= (or b!366455 b!366454) bm!27281))

(assert (=> b!366452 m!364027))

(assert (=> b!366452 m!364027))

(declare-fun m!364035 () Bool)

(assert (=> b!366452 m!364035))

(assert (=> b!366453 m!364027))

(declare-fun m!364037 () Bool)

(assert (=> b!366453 m!364037))

(declare-fun m!364039 () Bool)

(assert (=> b!366453 m!364039))

(assert (=> b!366453 m!364027))

(declare-fun m!364041 () Bool)

(assert (=> b!366453 m!364041))

(declare-fun m!364043 () Bool)

(assert (=> bm!27281 m!364043))

(assert (=> b!366349 d!72447))

(declare-fun b!366456 () Bool)

(declare-fun e!224352 () Bool)

(declare-fun e!224351 () Bool)

(assert (=> b!366456 (= e!224352 e!224351)))

(declare-fun c!53891 () Bool)

(assert (=> b!366456 (= c!53891 (validKeyInArray!0 (select (arr!9958 (array!20977 (store (arr!9958 _keys!658) i!548 k0!778) (size!10310 _keys!658))) #b00000000000000000000000000000000)))))

(declare-fun d!72449 () Bool)

(declare-fun res!205024 () Bool)

(assert (=> d!72449 (=> res!205024 e!224352)))

(assert (=> d!72449 (= res!205024 (bvsge #b00000000000000000000000000000000 (size!10310 (array!20977 (store (arr!9958 _keys!658) i!548 k0!778) (size!10310 _keys!658)))))))

(assert (=> d!72449 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20977 (store (arr!9958 _keys!658) i!548 k0!778) (size!10310 _keys!658)) mask!970) e!224352)))

(declare-fun b!366457 () Bool)

(declare-fun e!224353 () Bool)

(assert (=> b!366457 (= e!224351 e!224353)))

(declare-fun lt!169266 () (_ BitVec 64))

(assert (=> b!366457 (= lt!169266 (select (arr!9958 (array!20977 (store (arr!9958 _keys!658) i!548 k0!778) (size!10310 _keys!658))) #b00000000000000000000000000000000))))

(declare-fun lt!169264 () Unit!11383)

(assert (=> b!366457 (= lt!169264 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20977 (store (arr!9958 _keys!658) i!548 k0!778) (size!10310 _keys!658)) lt!169266 #b00000000000000000000000000000000))))

(assert (=> b!366457 (arrayContainsKey!0 (array!20977 (store (arr!9958 _keys!658) i!548 k0!778) (size!10310 _keys!658)) lt!169266 #b00000000000000000000000000000000)))

(declare-fun lt!169265 () Unit!11383)

(assert (=> b!366457 (= lt!169265 lt!169264)))

(declare-fun res!205023 () Bool)

(assert (=> b!366457 (= res!205023 (= (seekEntryOrOpen!0 (select (arr!9958 (array!20977 (store (arr!9958 _keys!658) i!548 k0!778) (size!10310 _keys!658))) #b00000000000000000000000000000000) (array!20977 (store (arr!9958 _keys!658) i!548 k0!778) (size!10310 _keys!658)) mask!970) (Found!3455 #b00000000000000000000000000000000)))))

(assert (=> b!366457 (=> (not res!205023) (not e!224353))))

(declare-fun b!366458 () Bool)

(declare-fun call!27285 () Bool)

(assert (=> b!366458 (= e!224351 call!27285)))

(declare-fun b!366459 () Bool)

(assert (=> b!366459 (= e!224353 call!27285)))

(declare-fun bm!27282 () Bool)

(assert (=> bm!27282 (= call!27285 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!20977 (store (arr!9958 _keys!658) i!548 k0!778) (size!10310 _keys!658)) mask!970))))

(assert (= (and d!72449 (not res!205024)) b!366456))

(assert (= (and b!366456 c!53891) b!366457))

(assert (= (and b!366456 (not c!53891)) b!366458))

(assert (= (and b!366457 res!205023) b!366459))

(assert (= (or b!366459 b!366458) bm!27282))

(declare-fun m!364045 () Bool)

(assert (=> b!366456 m!364045))

(assert (=> b!366456 m!364045))

(declare-fun m!364047 () Bool)

(assert (=> b!366456 m!364047))

(assert (=> b!366457 m!364045))

(declare-fun m!364049 () Bool)

(assert (=> b!366457 m!364049))

(declare-fun m!364051 () Bool)

(assert (=> b!366457 m!364051))

(assert (=> b!366457 m!364045))

(declare-fun m!364053 () Bool)

(assert (=> b!366457 m!364053))

(declare-fun m!364055 () Bool)

(assert (=> bm!27282 m!364055))

(assert (=> b!366346 d!72449))

(declare-fun bm!27285 () Bool)

(declare-fun call!27288 () Bool)

(declare-fun c!53894 () Bool)

(assert (=> bm!27285 (= call!27288 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53894 (Cons!5452 (select (arr!9958 _keys!658) #b00000000000000000000000000000000) Nil!5453) Nil!5453)))))

(declare-fun b!366470 () Bool)

(declare-fun e!224364 () Bool)

(assert (=> b!366470 (= e!224364 (contains!2417 Nil!5453 (select (arr!9958 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72451 () Bool)

(declare-fun res!205031 () Bool)

(declare-fun e!224365 () Bool)

(assert (=> d!72451 (=> res!205031 e!224365)))

(assert (=> d!72451 (= res!205031 (bvsge #b00000000000000000000000000000000 (size!10310 _keys!658)))))

(assert (=> d!72451 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5453) e!224365)))

(declare-fun b!366471 () Bool)

(declare-fun e!224362 () Bool)

(assert (=> b!366471 (= e!224362 call!27288)))

(declare-fun b!366472 () Bool)

(assert (=> b!366472 (= e!224362 call!27288)))

(declare-fun b!366473 () Bool)

(declare-fun e!224363 () Bool)

(assert (=> b!366473 (= e!224363 e!224362)))

(assert (=> b!366473 (= c!53894 (validKeyInArray!0 (select (arr!9958 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366474 () Bool)

(assert (=> b!366474 (= e!224365 e!224363)))

(declare-fun res!205032 () Bool)

(assert (=> b!366474 (=> (not res!205032) (not e!224363))))

(assert (=> b!366474 (= res!205032 (not e!224364))))

(declare-fun res!205033 () Bool)

(assert (=> b!366474 (=> (not res!205033) (not e!224364))))

(assert (=> b!366474 (= res!205033 (validKeyInArray!0 (select (arr!9958 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72451 (not res!205031)) b!366474))

(assert (= (and b!366474 res!205033) b!366470))

(assert (= (and b!366474 res!205032) b!366473))

(assert (= (and b!366473 c!53894) b!366472))

(assert (= (and b!366473 (not c!53894)) b!366471))

(assert (= (or b!366472 b!366471) bm!27285))

(assert (=> bm!27285 m!364027))

(declare-fun m!364057 () Bool)

(assert (=> bm!27285 m!364057))

(assert (=> b!366470 m!364027))

(assert (=> b!366470 m!364027))

(declare-fun m!364059 () Bool)

(assert (=> b!366470 m!364059))

(assert (=> b!366473 m!364027))

(assert (=> b!366473 m!364027))

(assert (=> b!366473 m!364035))

(assert (=> b!366474 m!364027))

(assert (=> b!366474 m!364027))

(assert (=> b!366474 m!364035))

(assert (=> b!366351 d!72451))

(declare-fun condMapEmpty!14340 () Bool)

(declare-fun mapDefault!14340 () ValueCell!3914)

(assert (=> mapNonEmpty!14331 (= condMapEmpty!14340 (= mapRest!14331 ((as const (Array (_ BitVec 32) ValueCell!3914)) mapDefault!14340)))))

(declare-fun e!224371 () Bool)

(declare-fun mapRes!14340 () Bool)

(assert (=> mapNonEmpty!14331 (= tp!28407 (and e!224371 mapRes!14340))))

(declare-fun b!366482 () Bool)

(assert (=> b!366482 (= e!224371 tp_is_empty!8515)))

(declare-fun b!366481 () Bool)

(declare-fun e!224370 () Bool)

(assert (=> b!366481 (= e!224370 tp_is_empty!8515)))

(declare-fun mapNonEmpty!14340 () Bool)

(declare-fun tp!28416 () Bool)

(assert (=> mapNonEmpty!14340 (= mapRes!14340 (and tp!28416 e!224370))))

(declare-fun mapRest!14340 () (Array (_ BitVec 32) ValueCell!3914))

(declare-fun mapValue!14340 () ValueCell!3914)

(declare-fun mapKey!14340 () (_ BitVec 32))

(assert (=> mapNonEmpty!14340 (= mapRest!14331 (store mapRest!14340 mapKey!14340 mapValue!14340))))

(declare-fun mapIsEmpty!14340 () Bool)

(assert (=> mapIsEmpty!14340 mapRes!14340))

(assert (= (and mapNonEmpty!14331 condMapEmpty!14340) mapIsEmpty!14340))

(assert (= (and mapNonEmpty!14331 (not condMapEmpty!14340)) mapNonEmpty!14340))

(assert (= (and mapNonEmpty!14340 ((_ is ValueCellFull!3914) mapValue!14340)) b!366481))

(assert (= (and mapNonEmpty!14331 ((_ is ValueCellFull!3914) mapDefault!14340)) b!366482))

(declare-fun m!364061 () Bool)

(assert (=> mapNonEmpty!14340 m!364061))

(check-sat (not b!366437) (not b!366443) (not b!366473) tp_is_empty!8515 (not b!366457) (not b!366474) (not b!366452) (not bm!27285) (not b!366456) (not b!366470) (not mapNonEmpty!14340) (not b!366442) (not bm!27281) (not bm!27282) (not b!366453))
(check-sat)
