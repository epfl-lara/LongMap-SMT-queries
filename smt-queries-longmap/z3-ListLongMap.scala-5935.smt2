; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77398 () Bool)

(assert start!77398)

(declare-fun b!902318 () Bool)

(declare-fun res!608940 () Bool)

(declare-fun e!505323 () Bool)

(assert (=> b!902318 (=> (not res!608940) (not e!505323))))

(declare-datatypes ((V!29553 0))(
  ( (V!29554 (val!9271 Int)) )
))
(declare-datatypes ((ValueCell!8739 0))(
  ( (ValueCellFull!8739 (v!11775 V!29553)) (EmptyCell!8739) )
))
(declare-datatypes ((array!52946 0))(
  ( (array!52947 (arr!25436 (Array (_ BitVec 32) ValueCell!8739)) (size!25895 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52946)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52948 0))(
  ( (array!52949 (arr!25437 (Array (_ BitVec 32) (_ BitVec 64))) (size!25896 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52948)

(assert (=> b!902318 (= res!608940 (and (= (size!25895 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25896 _keys!1386) (size!25895 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29362 () Bool)

(declare-fun mapRes!29362 () Bool)

(declare-fun tp!56421 () Bool)

(declare-fun e!505321 () Bool)

(assert (=> mapNonEmpty!29362 (= mapRes!29362 (and tp!56421 e!505321))))

(declare-fun mapRest!29362 () (Array (_ BitVec 32) ValueCell!8739))

(declare-fun mapValue!29362 () ValueCell!8739)

(declare-fun mapKey!29362 () (_ BitVec 32))

(assert (=> mapNonEmpty!29362 (= (arr!25436 _values!1152) (store mapRest!29362 mapKey!29362 mapValue!29362))))

(declare-fun b!902319 () Bool)

(declare-fun e!505322 () Bool)

(declare-fun tp_is_empty!18441 () Bool)

(assert (=> b!902319 (= e!505322 tp_is_empty!18441)))

(declare-fun b!902320 () Bool)

(declare-fun e!505320 () Bool)

(assert (=> b!902320 (= e!505320 (and e!505322 mapRes!29362))))

(declare-fun condMapEmpty!29362 () Bool)

(declare-fun mapDefault!29362 () ValueCell!8739)

(assert (=> b!902320 (= condMapEmpty!29362 (= (arr!25436 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8739)) mapDefault!29362)))))

(declare-fun res!608939 () Bool)

(assert (=> start!77398 (=> (not res!608939) (not e!505323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77398 (= res!608939 (validMask!0 mask!1756))))

(assert (=> start!77398 e!505323))

(assert (=> start!77398 true))

(declare-fun array_inv!19944 (array!52946) Bool)

(assert (=> start!77398 (and (array_inv!19944 _values!1152) e!505320)))

(declare-fun array_inv!19945 (array!52948) Bool)

(assert (=> start!77398 (array_inv!19945 _keys!1386)))

(declare-fun b!902321 () Bool)

(declare-fun res!608938 () Bool)

(assert (=> b!902321 (=> (not res!608938) (not e!505323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52948 (_ BitVec 32)) Bool)

(assert (=> b!902321 (= res!608938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902322 () Bool)

(assert (=> b!902322 (= e!505321 tp_is_empty!18441)))

(declare-fun mapIsEmpty!29362 () Bool)

(assert (=> mapIsEmpty!29362 mapRes!29362))

(declare-fun b!902323 () Bool)

(assert (=> b!902323 (= e!505323 (and (bvsle #b00000000000000000000000000000000 (size!25896 _keys!1386)) (bvsge (size!25896 _keys!1386) #b01111111111111111111111111111111)))))

(assert (= (and start!77398 res!608939) b!902318))

(assert (= (and b!902318 res!608940) b!902321))

(assert (= (and b!902321 res!608938) b!902323))

(assert (= (and b!902320 condMapEmpty!29362) mapIsEmpty!29362))

(assert (= (and b!902320 (not condMapEmpty!29362)) mapNonEmpty!29362))

(get-info :version)

(assert (= (and mapNonEmpty!29362 ((_ is ValueCellFull!8739) mapValue!29362)) b!902322))

(assert (= (and b!902320 ((_ is ValueCellFull!8739) mapDefault!29362)) b!902319))

(assert (= start!77398 b!902320))

(declare-fun m!838367 () Bool)

(assert (=> mapNonEmpty!29362 m!838367))

(declare-fun m!838369 () Bool)

(assert (=> start!77398 m!838369))

(declare-fun m!838371 () Bool)

(assert (=> start!77398 m!838371))

(declare-fun m!838373 () Bool)

(assert (=> start!77398 m!838373))

(declare-fun m!838375 () Bool)

(assert (=> b!902321 m!838375))

(check-sat (not b!902321) (not start!77398) (not mapNonEmpty!29362) tp_is_empty!18441)
(check-sat)
(get-model)

(declare-fun b!902350 () Bool)

(declare-fun e!505347 () Bool)

(declare-fun e!505346 () Bool)

(assert (=> b!902350 (= e!505347 e!505346)))

(declare-fun lt!407853 () (_ BitVec 64))

(assert (=> b!902350 (= lt!407853 (select (arr!25437 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30640 0))(
  ( (Unit!30641) )
))
(declare-fun lt!407854 () Unit!30640)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52948 (_ BitVec 64) (_ BitVec 32)) Unit!30640)

(assert (=> b!902350 (= lt!407854 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!407853 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!902350 (arrayContainsKey!0 _keys!1386 lt!407853 #b00000000000000000000000000000000)))

(declare-fun lt!407855 () Unit!30640)

(assert (=> b!902350 (= lt!407855 lt!407854)))

(declare-fun res!608955 () Bool)

(declare-datatypes ((SeekEntryResult!8959 0))(
  ( (MissingZero!8959 (index!38207 (_ BitVec 32))) (Found!8959 (index!38208 (_ BitVec 32))) (Intermediate!8959 (undefined!9771 Bool) (index!38209 (_ BitVec 32)) (x!76910 (_ BitVec 32))) (Undefined!8959) (MissingVacant!8959 (index!38210 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52948 (_ BitVec 32)) SeekEntryResult!8959)

(assert (=> b!902350 (= res!608955 (= (seekEntryOrOpen!0 (select (arr!25437 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8959 #b00000000000000000000000000000000)))))

(assert (=> b!902350 (=> (not res!608955) (not e!505346))))

(declare-fun b!902351 () Bool)

(declare-fun e!505348 () Bool)

(assert (=> b!902351 (= e!505348 e!505347)))

(declare-fun c!95636 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!902351 (= c!95636 (validKeyInArray!0 (select (arr!25437 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!902352 () Bool)

(declare-fun call!40240 () Bool)

(assert (=> b!902352 (= e!505347 call!40240)))

(declare-fun bm!40237 () Bool)

(assert (=> bm!40237 (= call!40240 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun d!111939 () Bool)

(declare-fun res!608954 () Bool)

(assert (=> d!111939 (=> res!608954 e!505348)))

(assert (=> d!111939 (= res!608954 (bvsge #b00000000000000000000000000000000 (size!25896 _keys!1386)))))

(assert (=> d!111939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!505348)))

(declare-fun b!902353 () Bool)

(assert (=> b!902353 (= e!505346 call!40240)))

(assert (= (and d!111939 (not res!608954)) b!902351))

(assert (= (and b!902351 c!95636) b!902350))

(assert (= (and b!902351 (not c!95636)) b!902352))

(assert (= (and b!902350 res!608955) b!902353))

(assert (= (or b!902353 b!902352) bm!40237))

(declare-fun m!838387 () Bool)

(assert (=> b!902350 m!838387))

(declare-fun m!838389 () Bool)

(assert (=> b!902350 m!838389))

(declare-fun m!838391 () Bool)

(assert (=> b!902350 m!838391))

(assert (=> b!902350 m!838387))

(declare-fun m!838393 () Bool)

(assert (=> b!902350 m!838393))

(assert (=> b!902351 m!838387))

(assert (=> b!902351 m!838387))

(declare-fun m!838395 () Bool)

(assert (=> b!902351 m!838395))

(declare-fun m!838397 () Bool)

(assert (=> bm!40237 m!838397))

(assert (=> b!902321 d!111939))

(declare-fun d!111941 () Bool)

(assert (=> d!111941 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77398 d!111941))

(declare-fun d!111943 () Bool)

(assert (=> d!111943 (= (array_inv!19944 _values!1152) (bvsge (size!25895 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77398 d!111943))

(declare-fun d!111945 () Bool)

(assert (=> d!111945 (= (array_inv!19945 _keys!1386) (bvsge (size!25896 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77398 d!111945))

(declare-fun b!902361 () Bool)

(declare-fun e!505353 () Bool)

(assert (=> b!902361 (= e!505353 tp_is_empty!18441)))

(declare-fun condMapEmpty!29368 () Bool)

(declare-fun mapDefault!29368 () ValueCell!8739)

(assert (=> mapNonEmpty!29362 (= condMapEmpty!29368 (= mapRest!29362 ((as const (Array (_ BitVec 32) ValueCell!8739)) mapDefault!29368)))))

(declare-fun mapRes!29368 () Bool)

(assert (=> mapNonEmpty!29362 (= tp!56421 (and e!505353 mapRes!29368))))

(declare-fun mapIsEmpty!29368 () Bool)

(assert (=> mapIsEmpty!29368 mapRes!29368))

(declare-fun b!902360 () Bool)

(declare-fun e!505354 () Bool)

(assert (=> b!902360 (= e!505354 tp_is_empty!18441)))

(declare-fun mapNonEmpty!29368 () Bool)

(declare-fun tp!56427 () Bool)

(assert (=> mapNonEmpty!29368 (= mapRes!29368 (and tp!56427 e!505354))))

(declare-fun mapKey!29368 () (_ BitVec 32))

(declare-fun mapValue!29368 () ValueCell!8739)

(declare-fun mapRest!29368 () (Array (_ BitVec 32) ValueCell!8739))

(assert (=> mapNonEmpty!29368 (= mapRest!29362 (store mapRest!29368 mapKey!29368 mapValue!29368))))

(assert (= (and mapNonEmpty!29362 condMapEmpty!29368) mapIsEmpty!29368))

(assert (= (and mapNonEmpty!29362 (not condMapEmpty!29368)) mapNonEmpty!29368))

(assert (= (and mapNonEmpty!29368 ((_ is ValueCellFull!8739) mapValue!29368)) b!902360))

(assert (= (and mapNonEmpty!29362 ((_ is ValueCellFull!8739) mapDefault!29368)) b!902361))

(declare-fun m!838399 () Bool)

(assert (=> mapNonEmpty!29368 m!838399))

(check-sat (not b!902351) tp_is_empty!18441 (not mapNonEmpty!29368) (not b!902350) (not bm!40237))
(check-sat)
