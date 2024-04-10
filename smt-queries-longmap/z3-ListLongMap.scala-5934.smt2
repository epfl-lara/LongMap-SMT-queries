; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77384 () Bool)

(assert start!77384)

(declare-fun b!902244 () Bool)

(declare-fun res!608905 () Bool)

(declare-fun e!505260 () Bool)

(assert (=> b!902244 (=> (not res!608905) (not e!505260))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52932 0))(
  ( (array!52933 (arr!25430 (Array (_ BitVec 32) (_ BitVec 64))) (size!25889 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52932)

(declare-datatypes ((V!29545 0))(
  ( (V!29546 (val!9268 Int)) )
))
(declare-datatypes ((ValueCell!8736 0))(
  ( (ValueCellFull!8736 (v!11772 V!29545)) (EmptyCell!8736) )
))
(declare-datatypes ((array!52934 0))(
  ( (array!52935 (arr!25431 (Array (_ BitVec 32) ValueCell!8736)) (size!25890 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52934)

(assert (=> b!902244 (= res!608905 (and (= (size!25890 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25889 _keys!1386) (size!25890 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902245 () Bool)

(declare-fun e!505263 () Bool)

(declare-fun tp_is_empty!18435 () Bool)

(assert (=> b!902245 (= e!505263 tp_is_empty!18435)))

(declare-fun mapIsEmpty!29350 () Bool)

(declare-fun mapRes!29350 () Bool)

(assert (=> mapIsEmpty!29350 mapRes!29350))

(declare-fun b!902246 () Bool)

(declare-fun e!505264 () Bool)

(declare-fun e!505261 () Bool)

(assert (=> b!902246 (= e!505264 (and e!505261 mapRes!29350))))

(declare-fun condMapEmpty!29350 () Bool)

(declare-fun mapDefault!29350 () ValueCell!8736)

(assert (=> b!902246 (= condMapEmpty!29350 (= (arr!25431 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8736)) mapDefault!29350)))))

(declare-fun mapNonEmpty!29350 () Bool)

(declare-fun tp!56409 () Bool)

(assert (=> mapNonEmpty!29350 (= mapRes!29350 (and tp!56409 e!505263))))

(declare-fun mapValue!29350 () ValueCell!8736)

(declare-fun mapRest!29350 () (Array (_ BitVec 32) ValueCell!8736))

(declare-fun mapKey!29350 () (_ BitVec 32))

(assert (=> mapNonEmpty!29350 (= (arr!25431 _values!1152) (store mapRest!29350 mapKey!29350 mapValue!29350))))

(declare-fun b!902247 () Bool)

(assert (=> b!902247 (= e!505261 tp_is_empty!18435)))

(declare-fun b!902248 () Bool)

(assert (=> b!902248 (= e!505260 (bvsgt #b00000000000000000000000000000000 (size!25889 _keys!1386)))))

(declare-fun res!608906 () Bool)

(assert (=> start!77384 (=> (not res!608906) (not e!505260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77384 (= res!608906 (validMask!0 mask!1756))))

(assert (=> start!77384 e!505260))

(assert (=> start!77384 true))

(declare-fun array_inv!19940 (array!52934) Bool)

(assert (=> start!77384 (and (array_inv!19940 _values!1152) e!505264)))

(declare-fun array_inv!19941 (array!52932) Bool)

(assert (=> start!77384 (array_inv!19941 _keys!1386)))

(declare-fun b!902249 () Bool)

(declare-fun res!608907 () Bool)

(assert (=> b!902249 (=> (not res!608907) (not e!505260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52932 (_ BitVec 32)) Bool)

(assert (=> b!902249 (= res!608907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77384 res!608906) b!902244))

(assert (= (and b!902244 res!608905) b!902249))

(assert (= (and b!902249 res!608907) b!902248))

(assert (= (and b!902246 condMapEmpty!29350) mapIsEmpty!29350))

(assert (= (and b!902246 (not condMapEmpty!29350)) mapNonEmpty!29350))

(get-info :version)

(assert (= (and mapNonEmpty!29350 ((_ is ValueCellFull!8736) mapValue!29350)) b!902245))

(assert (= (and b!902246 ((_ is ValueCellFull!8736) mapDefault!29350)) b!902247))

(assert (= start!77384 b!902246))

(declare-fun m!838323 () Bool)

(assert (=> mapNonEmpty!29350 m!838323))

(declare-fun m!838325 () Bool)

(assert (=> start!77384 m!838325))

(declare-fun m!838327 () Bool)

(assert (=> start!77384 m!838327))

(declare-fun m!838329 () Bool)

(assert (=> start!77384 m!838329))

(declare-fun m!838331 () Bool)

(assert (=> b!902249 m!838331))

(check-sat (not b!902249) (not start!77384) (not mapNonEmpty!29350) tp_is_empty!18435)
(check-sat)
(get-model)

(declare-fun b!902276 () Bool)

(declare-fun e!505288 () Bool)

(declare-fun e!505287 () Bool)

(assert (=> b!902276 (= e!505288 e!505287)))

(declare-fun lt!407846 () (_ BitVec 64))

(assert (=> b!902276 (= lt!407846 (select (arr!25430 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30638 0))(
  ( (Unit!30639) )
))
(declare-fun lt!407845 () Unit!30638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52932 (_ BitVec 64) (_ BitVec 32)) Unit!30638)

(assert (=> b!902276 (= lt!407845 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!407846 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!902276 (arrayContainsKey!0 _keys!1386 lt!407846 #b00000000000000000000000000000000)))

(declare-fun lt!407844 () Unit!30638)

(assert (=> b!902276 (= lt!407844 lt!407845)))

(declare-fun res!608922 () Bool)

(declare-datatypes ((SeekEntryResult!8958 0))(
  ( (MissingZero!8958 (index!38203 (_ BitVec 32))) (Found!8958 (index!38204 (_ BitVec 32))) (Intermediate!8958 (undefined!9770 Bool) (index!38205 (_ BitVec 32)) (x!76899 (_ BitVec 32))) (Undefined!8958) (MissingVacant!8958 (index!38206 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52932 (_ BitVec 32)) SeekEntryResult!8958)

(assert (=> b!902276 (= res!608922 (= (seekEntryOrOpen!0 (select (arr!25430 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8958 #b00000000000000000000000000000000)))))

(assert (=> b!902276 (=> (not res!608922) (not e!505287))))

(declare-fun b!902277 () Bool)

(declare-fun e!505286 () Bool)

(assert (=> b!902277 (= e!505286 e!505288)))

(declare-fun c!95633 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!902277 (= c!95633 (validKeyInArray!0 (select (arr!25430 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!902278 () Bool)

(declare-fun call!40237 () Bool)

(assert (=> b!902278 (= e!505287 call!40237)))

(declare-fun b!902279 () Bool)

(assert (=> b!902279 (= e!505288 call!40237)))

(declare-fun bm!40234 () Bool)

(assert (=> bm!40234 (= call!40237 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun d!111929 () Bool)

(declare-fun res!608921 () Bool)

(assert (=> d!111929 (=> res!608921 e!505286)))

(assert (=> d!111929 (= res!608921 (bvsge #b00000000000000000000000000000000 (size!25889 _keys!1386)))))

(assert (=> d!111929 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!505286)))

(assert (= (and d!111929 (not res!608921)) b!902277))

(assert (= (and b!902277 c!95633) b!902276))

(assert (= (and b!902277 (not c!95633)) b!902279))

(assert (= (and b!902276 res!608922) b!902278))

(assert (= (or b!902278 b!902279) bm!40234))

(declare-fun m!838343 () Bool)

(assert (=> b!902276 m!838343))

(declare-fun m!838345 () Bool)

(assert (=> b!902276 m!838345))

(declare-fun m!838347 () Bool)

(assert (=> b!902276 m!838347))

(assert (=> b!902276 m!838343))

(declare-fun m!838349 () Bool)

(assert (=> b!902276 m!838349))

(assert (=> b!902277 m!838343))

(assert (=> b!902277 m!838343))

(declare-fun m!838351 () Bool)

(assert (=> b!902277 m!838351))

(declare-fun m!838353 () Bool)

(assert (=> bm!40234 m!838353))

(assert (=> b!902249 d!111929))

(declare-fun d!111931 () Bool)

(assert (=> d!111931 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77384 d!111931))

(declare-fun d!111933 () Bool)

(assert (=> d!111933 (= (array_inv!19940 _values!1152) (bvsge (size!25890 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77384 d!111933))

(declare-fun d!111935 () Bool)

(assert (=> d!111935 (= (array_inv!19941 _keys!1386) (bvsge (size!25889 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77384 d!111935))

(declare-fun mapIsEmpty!29356 () Bool)

(declare-fun mapRes!29356 () Bool)

(assert (=> mapIsEmpty!29356 mapRes!29356))

(declare-fun b!902287 () Bool)

(declare-fun e!505293 () Bool)

(assert (=> b!902287 (= e!505293 tp_is_empty!18435)))

(declare-fun condMapEmpty!29356 () Bool)

(declare-fun mapDefault!29356 () ValueCell!8736)

(assert (=> mapNonEmpty!29350 (= condMapEmpty!29356 (= mapRest!29350 ((as const (Array (_ BitVec 32) ValueCell!8736)) mapDefault!29356)))))

(assert (=> mapNonEmpty!29350 (= tp!56409 (and e!505293 mapRes!29356))))

(declare-fun b!902286 () Bool)

(declare-fun e!505294 () Bool)

(assert (=> b!902286 (= e!505294 tp_is_empty!18435)))

(declare-fun mapNonEmpty!29356 () Bool)

(declare-fun tp!56415 () Bool)

(assert (=> mapNonEmpty!29356 (= mapRes!29356 (and tp!56415 e!505294))))

(declare-fun mapKey!29356 () (_ BitVec 32))

(declare-fun mapValue!29356 () ValueCell!8736)

(declare-fun mapRest!29356 () (Array (_ BitVec 32) ValueCell!8736))

(assert (=> mapNonEmpty!29356 (= mapRest!29350 (store mapRest!29356 mapKey!29356 mapValue!29356))))

(assert (= (and mapNonEmpty!29350 condMapEmpty!29356) mapIsEmpty!29356))

(assert (= (and mapNonEmpty!29350 (not condMapEmpty!29356)) mapNonEmpty!29356))

(assert (= (and mapNonEmpty!29356 ((_ is ValueCellFull!8736) mapValue!29356)) b!902286))

(assert (= (and mapNonEmpty!29350 ((_ is ValueCellFull!8736) mapDefault!29356)) b!902287))

(declare-fun m!838355 () Bool)

(assert (=> mapNonEmpty!29356 m!838355))

(check-sat (not b!902276) (not b!902277) tp_is_empty!18435 (not mapNonEmpty!29356) (not bm!40234))
(check-sat)
