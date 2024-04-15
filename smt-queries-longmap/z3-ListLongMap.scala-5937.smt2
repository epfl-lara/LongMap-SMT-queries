; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77408 () Bool)

(assert start!77408)

(declare-fun b!902230 () Bool)

(declare-fun e!505290 () Bool)

(declare-fun e!505286 () Bool)

(declare-fun mapRes!29383 () Bool)

(assert (=> b!902230 (= e!505290 (and e!505286 mapRes!29383))))

(declare-fun condMapEmpty!29383 () Bool)

(declare-datatypes ((V!29567 0))(
  ( (V!29568 (val!9276 Int)) )
))
(declare-datatypes ((ValueCell!8744 0))(
  ( (ValueCellFull!8744 (v!11779 V!29567)) (EmptyCell!8744) )
))
(declare-datatypes ((array!52947 0))(
  ( (array!52948 (arr!25435 (Array (_ BitVec 32) ValueCell!8744)) (size!25896 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52947)

(declare-fun mapDefault!29383 () ValueCell!8744)

(assert (=> b!902230 (= condMapEmpty!29383 (= (arr!25435 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8744)) mapDefault!29383)))))

(declare-fun b!902231 () Bool)

(declare-fun res!608909 () Bool)

(declare-fun e!505287 () Bool)

(assert (=> b!902231 (=> (not res!608909) (not e!505287))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52949 0))(
  ( (array!52950 (arr!25436 (Array (_ BitVec 32) (_ BitVec 64))) (size!25897 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52949)

(assert (=> b!902231 (= res!608909 (and (= (size!25896 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25897 _keys!1386) (size!25896 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!608911 () Bool)

(assert (=> start!77408 (=> (not res!608911) (not e!505287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77408 (= res!608911 (validMask!0 mask!1756))))

(assert (=> start!77408 e!505287))

(assert (=> start!77408 true))

(declare-fun array_inv!20002 (array!52947) Bool)

(assert (=> start!77408 (and (array_inv!20002 _values!1152) e!505290)))

(declare-fun array_inv!20003 (array!52949) Bool)

(assert (=> start!77408 (array_inv!20003 _keys!1386)))

(declare-fun b!902232 () Bool)

(declare-fun res!608910 () Bool)

(assert (=> b!902232 (=> (not res!608910) (not e!505287))))

(assert (=> b!902232 (= res!608910 (and (bvsle #b00000000000000000000000000000000 (size!25897 _keys!1386)) (bvslt (size!25897 _keys!1386) #b01111111111111111111111111111111)))))

(declare-fun b!902233 () Bool)

(declare-fun res!608907 () Bool)

(assert (=> b!902233 (=> (not res!608907) (not e!505287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52949 (_ BitVec 32)) Bool)

(assert (=> b!902233 (= res!608907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902234 () Bool)

(declare-fun res!608906 () Bool)

(assert (=> b!902234 (=> (not res!608906) (not e!505287))))

(declare-datatypes ((List!17896 0))(
  ( (Nil!17893) (Cons!17892 (h!19038 (_ BitVec 64)) (t!25270 List!17896)) )
))
(declare-fun noDuplicate!1330 (List!17896) Bool)

(assert (=> b!902234 (= res!608906 (noDuplicate!1330 Nil!17893))))

(declare-fun mapNonEmpty!29383 () Bool)

(declare-fun tp!56443 () Bool)

(declare-fun e!505285 () Bool)

(assert (=> mapNonEmpty!29383 (= mapRes!29383 (and tp!56443 e!505285))))

(declare-fun mapRest!29383 () (Array (_ BitVec 32) ValueCell!8744))

(declare-fun mapKey!29383 () (_ BitVec 32))

(declare-fun mapValue!29383 () ValueCell!8744)

(assert (=> mapNonEmpty!29383 (= (arr!25435 _values!1152) (store mapRest!29383 mapKey!29383 mapValue!29383))))

(declare-fun b!902235 () Bool)

(declare-fun tp_is_empty!18451 () Bool)

(assert (=> b!902235 (= e!505285 tp_is_empty!18451)))

(declare-fun b!902236 () Bool)

(assert (=> b!902236 (= e!505286 tp_is_empty!18451)))

(declare-fun mapIsEmpty!29383 () Bool)

(assert (=> mapIsEmpty!29383 mapRes!29383))

(declare-fun b!902237 () Bool)

(declare-fun e!505289 () Bool)

(assert (=> b!902237 (= e!505287 e!505289)))

(declare-fun res!608908 () Bool)

(assert (=> b!902237 (=> res!608908 e!505289)))

(declare-fun contains!4422 (List!17896 (_ BitVec 64)) Bool)

(assert (=> b!902237 (= res!608908 (contains!4422 Nil!17893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902238 () Bool)

(assert (=> b!902238 (= e!505289 (contains!4422 Nil!17893 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!77408 res!608911) b!902231))

(assert (= (and b!902231 res!608909) b!902233))

(assert (= (and b!902233 res!608907) b!902232))

(assert (= (and b!902232 res!608910) b!902234))

(assert (= (and b!902234 res!608906) b!902237))

(assert (= (and b!902237 (not res!608908)) b!902238))

(assert (= (and b!902230 condMapEmpty!29383) mapIsEmpty!29383))

(assert (= (and b!902230 (not condMapEmpty!29383)) mapNonEmpty!29383))

(get-info :version)

(assert (= (and mapNonEmpty!29383 ((_ is ValueCellFull!8744) mapValue!29383)) b!902235))

(assert (= (and b!902230 ((_ is ValueCellFull!8744) mapDefault!29383)) b!902236))

(assert (= start!77408 b!902230))

(declare-fun m!837697 () Bool)

(assert (=> b!902238 m!837697))

(declare-fun m!837699 () Bool)

(assert (=> mapNonEmpty!29383 m!837699))

(declare-fun m!837701 () Bool)

(assert (=> start!77408 m!837701))

(declare-fun m!837703 () Bool)

(assert (=> start!77408 m!837703))

(declare-fun m!837705 () Bool)

(assert (=> start!77408 m!837705))

(declare-fun m!837707 () Bool)

(assert (=> b!902234 m!837707))

(declare-fun m!837709 () Bool)

(assert (=> b!902237 m!837709))

(declare-fun m!837711 () Bool)

(assert (=> b!902233 m!837711))

(check-sat (not mapNonEmpty!29383) (not b!902233) (not b!902237) (not start!77408) tp_is_empty!18451 (not b!902234) (not b!902238))
(check-sat)
(get-model)

(declare-fun d!111763 () Bool)

(declare-fun res!608952 () Bool)

(declare-fun e!505331 () Bool)

(assert (=> d!111763 (=> res!608952 e!505331)))

(assert (=> d!111763 (= res!608952 ((_ is Nil!17893) Nil!17893))))

(assert (=> d!111763 (= (noDuplicate!1330 Nil!17893) e!505331)))

(declare-fun b!902297 () Bool)

(declare-fun e!505332 () Bool)

(assert (=> b!902297 (= e!505331 e!505332)))

(declare-fun res!608953 () Bool)

(assert (=> b!902297 (=> (not res!608953) (not e!505332))))

(assert (=> b!902297 (= res!608953 (not (contains!4422 (t!25270 Nil!17893) (h!19038 Nil!17893))))))

(declare-fun b!902298 () Bool)

(assert (=> b!902298 (= e!505332 (noDuplicate!1330 (t!25270 Nil!17893)))))

(assert (= (and d!111763 (not res!608952)) b!902297))

(assert (= (and b!902297 res!608953) b!902298))

(declare-fun m!837745 () Bool)

(assert (=> b!902297 m!837745))

(declare-fun m!837747 () Bool)

(assert (=> b!902298 m!837747))

(assert (=> b!902234 d!111763))

(declare-fun d!111765 () Bool)

(declare-fun lt!407631 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!400 (List!17896) (InoxSet (_ BitVec 64)))

(assert (=> d!111765 (= lt!407631 (select (content!400 Nil!17893) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!505337 () Bool)

(assert (=> d!111765 (= lt!407631 e!505337)))

(declare-fun res!608959 () Bool)

(assert (=> d!111765 (=> (not res!608959) (not e!505337))))

(assert (=> d!111765 (= res!608959 ((_ is Cons!17892) Nil!17893))))

(assert (=> d!111765 (= (contains!4422 Nil!17893 #b0000000000000000000000000000000000000000000000000000000000000000) lt!407631)))

(declare-fun b!902303 () Bool)

(declare-fun e!505338 () Bool)

(assert (=> b!902303 (= e!505337 e!505338)))

(declare-fun res!608958 () Bool)

(assert (=> b!902303 (=> res!608958 e!505338)))

(assert (=> b!902303 (= res!608958 (= (h!19038 Nil!17893) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902304 () Bool)

(assert (=> b!902304 (= e!505338 (contains!4422 (t!25270 Nil!17893) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!111765 res!608959) b!902303))

(assert (= (and b!902303 (not res!608958)) b!902304))

(declare-fun m!837749 () Bool)

(assert (=> d!111765 m!837749))

(declare-fun m!837751 () Bool)

(assert (=> d!111765 m!837751))

(declare-fun m!837753 () Bool)

(assert (=> b!902304 m!837753))

(assert (=> b!902237 d!111765))

(declare-fun d!111767 () Bool)

(assert (=> d!111767 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77408 d!111767))

(declare-fun d!111769 () Bool)

(assert (=> d!111769 (= (array_inv!20002 _values!1152) (bvsge (size!25896 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77408 d!111769))

(declare-fun d!111771 () Bool)

(assert (=> d!111771 (= (array_inv!20003 _keys!1386) (bvsge (size!25897 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77408 d!111771))

(declare-fun b!902313 () Bool)

(declare-fun e!505347 () Bool)

(declare-fun e!505345 () Bool)

(assert (=> b!902313 (= e!505347 e!505345)))

(declare-fun lt!407638 () (_ BitVec 64))

(assert (=> b!902313 (= lt!407638 (select (arr!25436 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30580 0))(
  ( (Unit!30581) )
))
(declare-fun lt!407639 () Unit!30580)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52949 (_ BitVec 64) (_ BitVec 32)) Unit!30580)

(assert (=> b!902313 (= lt!407639 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!407638 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!902313 (arrayContainsKey!0 _keys!1386 lt!407638 #b00000000000000000000000000000000)))

(declare-fun lt!407640 () Unit!30580)

(assert (=> b!902313 (= lt!407640 lt!407639)))

(declare-fun res!608964 () Bool)

(declare-datatypes ((SeekEntryResult!8961 0))(
  ( (MissingZero!8961 (index!38215 (_ BitVec 32))) (Found!8961 (index!38216 (_ BitVec 32))) (Intermediate!8961 (undefined!9773 Bool) (index!38217 (_ BitVec 32)) (x!76927 (_ BitVec 32))) (Undefined!8961) (MissingVacant!8961 (index!38218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52949 (_ BitVec 32)) SeekEntryResult!8961)

(assert (=> b!902313 (= res!608964 (= (seekEntryOrOpen!0 (select (arr!25436 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8961 #b00000000000000000000000000000000)))))

(assert (=> b!902313 (=> (not res!608964) (not e!505345))))

(declare-fun b!902314 () Bool)

(declare-fun call!40220 () Bool)

(assert (=> b!902314 (= e!505345 call!40220)))

(declare-fun d!111773 () Bool)

(declare-fun res!608965 () Bool)

(declare-fun e!505346 () Bool)

(assert (=> d!111773 (=> res!608965 e!505346)))

(assert (=> d!111773 (= res!608965 (bvsge #b00000000000000000000000000000000 (size!25897 _keys!1386)))))

(assert (=> d!111773 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!505346)))

(declare-fun bm!40217 () Bool)

(assert (=> bm!40217 (= call!40220 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!902315 () Bool)

(assert (=> b!902315 (= e!505346 e!505347)))

(declare-fun c!95577 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!902315 (= c!95577 (validKeyInArray!0 (select (arr!25436 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!902316 () Bool)

(assert (=> b!902316 (= e!505347 call!40220)))

(assert (= (and d!111773 (not res!608965)) b!902315))

(assert (= (and b!902315 c!95577) b!902313))

(assert (= (and b!902315 (not c!95577)) b!902316))

(assert (= (and b!902313 res!608964) b!902314))

(assert (= (or b!902314 b!902316) bm!40217))

(declare-fun m!837755 () Bool)

(assert (=> b!902313 m!837755))

(declare-fun m!837757 () Bool)

(assert (=> b!902313 m!837757))

(declare-fun m!837759 () Bool)

(assert (=> b!902313 m!837759))

(assert (=> b!902313 m!837755))

(declare-fun m!837761 () Bool)

(assert (=> b!902313 m!837761))

(declare-fun m!837763 () Bool)

(assert (=> bm!40217 m!837763))

(assert (=> b!902315 m!837755))

(assert (=> b!902315 m!837755))

(declare-fun m!837765 () Bool)

(assert (=> b!902315 m!837765))

(assert (=> b!902233 d!111773))

(declare-fun d!111775 () Bool)

(declare-fun lt!407641 () Bool)

(assert (=> d!111775 (= lt!407641 (select (content!400 Nil!17893) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!505348 () Bool)

(assert (=> d!111775 (= lt!407641 e!505348)))

(declare-fun res!608967 () Bool)

(assert (=> d!111775 (=> (not res!608967) (not e!505348))))

(assert (=> d!111775 (= res!608967 ((_ is Cons!17892) Nil!17893))))

(assert (=> d!111775 (= (contains!4422 Nil!17893 #b1000000000000000000000000000000000000000000000000000000000000000) lt!407641)))

(declare-fun b!902317 () Bool)

(declare-fun e!505349 () Bool)

(assert (=> b!902317 (= e!505348 e!505349)))

(declare-fun res!608966 () Bool)

(assert (=> b!902317 (=> res!608966 e!505349)))

(assert (=> b!902317 (= res!608966 (= (h!19038 Nil!17893) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902318 () Bool)

(assert (=> b!902318 (= e!505349 (contains!4422 (t!25270 Nil!17893) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!111775 res!608967) b!902317))

(assert (= (and b!902317 (not res!608966)) b!902318))

(assert (=> d!111775 m!837749))

(declare-fun m!837767 () Bool)

(assert (=> d!111775 m!837767))

(declare-fun m!837769 () Bool)

(assert (=> b!902318 m!837769))

(assert (=> b!902238 d!111775))

(declare-fun b!902326 () Bool)

(declare-fun e!505354 () Bool)

(assert (=> b!902326 (= e!505354 tp_is_empty!18451)))

(declare-fun condMapEmpty!29392 () Bool)

(declare-fun mapDefault!29392 () ValueCell!8744)

(assert (=> mapNonEmpty!29383 (= condMapEmpty!29392 (= mapRest!29383 ((as const (Array (_ BitVec 32) ValueCell!8744)) mapDefault!29392)))))

(declare-fun mapRes!29392 () Bool)

(assert (=> mapNonEmpty!29383 (= tp!56443 (and e!505354 mapRes!29392))))

(declare-fun b!902325 () Bool)

(declare-fun e!505355 () Bool)

(assert (=> b!902325 (= e!505355 tp_is_empty!18451)))

(declare-fun mapIsEmpty!29392 () Bool)

(assert (=> mapIsEmpty!29392 mapRes!29392))

(declare-fun mapNonEmpty!29392 () Bool)

(declare-fun tp!56452 () Bool)

(assert (=> mapNonEmpty!29392 (= mapRes!29392 (and tp!56452 e!505355))))

(declare-fun mapRest!29392 () (Array (_ BitVec 32) ValueCell!8744))

(declare-fun mapKey!29392 () (_ BitVec 32))

(declare-fun mapValue!29392 () ValueCell!8744)

(assert (=> mapNonEmpty!29392 (= mapRest!29383 (store mapRest!29392 mapKey!29392 mapValue!29392))))

(assert (= (and mapNonEmpty!29383 condMapEmpty!29392) mapIsEmpty!29392))

(assert (= (and mapNonEmpty!29383 (not condMapEmpty!29392)) mapNonEmpty!29392))

(assert (= (and mapNonEmpty!29392 ((_ is ValueCellFull!8744) mapValue!29392)) b!902325))

(assert (= (and mapNonEmpty!29383 ((_ is ValueCellFull!8744) mapDefault!29392)) b!902326))

(declare-fun m!837771 () Bool)

(assert (=> mapNonEmpty!29392 m!837771))

(check-sat (not b!902315) (not mapNonEmpty!29392) (not b!902318) (not b!902298) (not b!902313) tp_is_empty!18451 (not bm!40217) (not b!902304) (not d!111775) (not d!111765) (not b!902297))
(check-sat)
