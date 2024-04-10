; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77412 () Bool)

(assert start!77412)

(declare-fun b!902397 () Bool)

(declare-fun e!505380 () Bool)

(declare-fun e!505384 () Bool)

(declare-fun mapRes!29374 () Bool)

(assert (=> b!902397 (= e!505380 (and e!505384 mapRes!29374))))

(declare-fun condMapEmpty!29374 () Bool)

(declare-datatypes ((V!29561 0))(
  ( (V!29562 (val!9274 Int)) )
))
(declare-datatypes ((ValueCell!8742 0))(
  ( (ValueCellFull!8742 (v!11778 V!29561)) (EmptyCell!8742) )
))
(declare-datatypes ((array!52956 0))(
  ( (array!52957 (arr!25440 (Array (_ BitVec 32) ValueCell!8742)) (size!25899 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52956)

(declare-fun mapDefault!29374 () ValueCell!8742)

(assert (=> b!902397 (= condMapEmpty!29374 (= (arr!25440 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8742)) mapDefault!29374)))))

(declare-fun b!902398 () Bool)

(declare-fun e!505383 () Bool)

(declare-fun tp_is_empty!18447 () Bool)

(assert (=> b!902398 (= e!505383 tp_is_empty!18447)))

(declare-fun mapIsEmpty!29374 () Bool)

(assert (=> mapIsEmpty!29374 mapRes!29374))

(declare-fun b!902399 () Bool)

(assert (=> b!902399 (= e!505384 tp_is_empty!18447)))

(declare-fun b!902400 () Bool)

(declare-fun res!608977 () Bool)

(declare-fun e!505382 () Bool)

(assert (=> b!902400 (=> (not res!608977) (not e!505382))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52958 0))(
  ( (array!52959 (arr!25441 (Array (_ BitVec 32) (_ BitVec 64))) (size!25900 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52958)

(assert (=> b!902400 (= res!608977 (and (= (size!25899 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25900 _keys!1386) (size!25899 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902401 () Bool)

(declare-fun res!608976 () Bool)

(assert (=> b!902401 (=> (not res!608976) (not e!505382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52958 (_ BitVec 32)) Bool)

(assert (=> b!902401 (= res!608976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29374 () Bool)

(declare-fun tp!56433 () Bool)

(assert (=> mapNonEmpty!29374 (= mapRes!29374 (and tp!56433 e!505383))))

(declare-fun mapRest!29374 () (Array (_ BitVec 32) ValueCell!8742))

(declare-fun mapValue!29374 () ValueCell!8742)

(declare-fun mapKey!29374 () (_ BitVec 32))

(assert (=> mapNonEmpty!29374 (= (arr!25440 _values!1152) (store mapRest!29374 mapKey!29374 mapValue!29374))))

(declare-fun b!902402 () Bool)

(declare-datatypes ((List!17883 0))(
  ( (Nil!17880) (Cons!17879 (h!19025 (_ BitVec 64)) (t!25266 List!17883)) )
))
(declare-fun noDuplicate!1327 (List!17883) Bool)

(assert (=> b!902402 (= e!505382 (not (noDuplicate!1327 Nil!17880)))))

(declare-fun res!608978 () Bool)

(assert (=> start!77412 (=> (not res!608978) (not e!505382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77412 (= res!608978 (validMask!0 mask!1756))))

(assert (=> start!77412 e!505382))

(assert (=> start!77412 true))

(declare-fun array_inv!19946 (array!52956) Bool)

(assert (=> start!77412 (and (array_inv!19946 _values!1152) e!505380)))

(declare-fun array_inv!19947 (array!52958) Bool)

(assert (=> start!77412 (array_inv!19947 _keys!1386)))

(declare-fun b!902403 () Bool)

(declare-fun res!608979 () Bool)

(assert (=> b!902403 (=> (not res!608979) (not e!505382))))

(assert (=> b!902403 (= res!608979 (and (bvsle #b00000000000000000000000000000000 (size!25900 _keys!1386)) (bvslt (size!25900 _keys!1386) #b01111111111111111111111111111111)))))

(assert (= (and start!77412 res!608978) b!902400))

(assert (= (and b!902400 res!608977) b!902401))

(assert (= (and b!902401 res!608976) b!902403))

(assert (= (and b!902403 res!608979) b!902402))

(assert (= (and b!902397 condMapEmpty!29374) mapIsEmpty!29374))

(assert (= (and b!902397 (not condMapEmpty!29374)) mapNonEmpty!29374))

(get-info :version)

(assert (= (and mapNonEmpty!29374 ((_ is ValueCellFull!8742) mapValue!29374)) b!902398))

(assert (= (and b!902397 ((_ is ValueCellFull!8742) mapDefault!29374)) b!902399))

(assert (= start!77412 b!902397))

(declare-fun m!838413 () Bool)

(assert (=> b!902401 m!838413))

(declare-fun m!838415 () Bool)

(assert (=> mapNonEmpty!29374 m!838415))

(declare-fun m!838417 () Bool)

(assert (=> b!902402 m!838417))

(declare-fun m!838419 () Bool)

(assert (=> start!77412 m!838419))

(declare-fun m!838421 () Bool)

(assert (=> start!77412 m!838421))

(declare-fun m!838423 () Bool)

(assert (=> start!77412 m!838423))

(check-sat (not b!902402) (not start!77412) (not b!902401) tp_is_empty!18447 (not mapNonEmpty!29374))
(check-sat)
(get-model)

(declare-fun d!111949 () Bool)

(declare-fun res!608996 () Bool)

(declare-fun e!505407 () Bool)

(assert (=> d!111949 (=> res!608996 e!505407)))

(assert (=> d!111949 (= res!608996 (bvsge #b00000000000000000000000000000000 (size!25900 _keys!1386)))))

(assert (=> d!111949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!505407)))

(declare-fun bm!40240 () Bool)

(declare-fun call!40243 () Bool)

(assert (=> bm!40240 (= call!40243 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!902433 () Bool)

(declare-fun e!505408 () Bool)

(assert (=> b!902433 (= e!505408 call!40243)))

(declare-fun b!902434 () Bool)

(declare-fun e!505406 () Bool)

(assert (=> b!902434 (= e!505408 e!505406)))

(declare-fun lt!407864 () (_ BitVec 64))

(assert (=> b!902434 (= lt!407864 (select (arr!25441 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30642 0))(
  ( (Unit!30643) )
))
(declare-fun lt!407863 () Unit!30642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52958 (_ BitVec 64) (_ BitVec 32)) Unit!30642)

(assert (=> b!902434 (= lt!407863 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!407864 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!902434 (arrayContainsKey!0 _keys!1386 lt!407864 #b00000000000000000000000000000000)))

(declare-fun lt!407862 () Unit!30642)

(assert (=> b!902434 (= lt!407862 lt!407863)))

(declare-fun res!608997 () Bool)

(declare-datatypes ((SeekEntryResult!8960 0))(
  ( (MissingZero!8960 (index!38211 (_ BitVec 32))) (Found!8960 (index!38212 (_ BitVec 32))) (Intermediate!8960 (undefined!9772 Bool) (index!38213 (_ BitVec 32)) (x!76921 (_ BitVec 32))) (Undefined!8960) (MissingVacant!8960 (index!38214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52958 (_ BitVec 32)) SeekEntryResult!8960)

(assert (=> b!902434 (= res!608997 (= (seekEntryOrOpen!0 (select (arr!25441 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8960 #b00000000000000000000000000000000)))))

(assert (=> b!902434 (=> (not res!608997) (not e!505406))))

(declare-fun b!902435 () Bool)

(assert (=> b!902435 (= e!505406 call!40243)))

(declare-fun b!902436 () Bool)

(assert (=> b!902436 (= e!505407 e!505408)))

(declare-fun c!95639 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!902436 (= c!95639 (validKeyInArray!0 (select (arr!25441 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!111949 (not res!608996)) b!902436))

(assert (= (and b!902436 c!95639) b!902434))

(assert (= (and b!902436 (not c!95639)) b!902433))

(assert (= (and b!902434 res!608997) b!902435))

(assert (= (or b!902435 b!902433) bm!40240))

(declare-fun m!838437 () Bool)

(assert (=> bm!40240 m!838437))

(declare-fun m!838439 () Bool)

(assert (=> b!902434 m!838439))

(declare-fun m!838441 () Bool)

(assert (=> b!902434 m!838441))

(declare-fun m!838443 () Bool)

(assert (=> b!902434 m!838443))

(assert (=> b!902434 m!838439))

(declare-fun m!838445 () Bool)

(assert (=> b!902434 m!838445))

(assert (=> b!902436 m!838439))

(assert (=> b!902436 m!838439))

(declare-fun m!838447 () Bool)

(assert (=> b!902436 m!838447))

(assert (=> b!902401 d!111949))

(declare-fun d!111951 () Bool)

(assert (=> d!111951 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77412 d!111951))

(declare-fun d!111953 () Bool)

(assert (=> d!111953 (= (array_inv!19946 _values!1152) (bvsge (size!25899 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77412 d!111953))

(declare-fun d!111955 () Bool)

(assert (=> d!111955 (= (array_inv!19947 _keys!1386) (bvsge (size!25900 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77412 d!111955))

(declare-fun d!111957 () Bool)

(declare-fun res!609002 () Bool)

(declare-fun e!505413 () Bool)

(assert (=> d!111957 (=> res!609002 e!505413)))

(assert (=> d!111957 (= res!609002 ((_ is Nil!17880) Nil!17880))))

(assert (=> d!111957 (= (noDuplicate!1327 Nil!17880) e!505413)))

(declare-fun b!902441 () Bool)

(declare-fun e!505414 () Bool)

(assert (=> b!902441 (= e!505413 e!505414)))

(declare-fun res!609003 () Bool)

(assert (=> b!902441 (=> (not res!609003) (not e!505414))))

(declare-fun contains!4450 (List!17883 (_ BitVec 64)) Bool)

(assert (=> b!902441 (= res!609003 (not (contains!4450 (t!25266 Nil!17880) (h!19025 Nil!17880))))))

(declare-fun b!902442 () Bool)

(assert (=> b!902442 (= e!505414 (noDuplicate!1327 (t!25266 Nil!17880)))))

(assert (= (and d!111957 (not res!609002)) b!902441))

(assert (= (and b!902441 res!609003) b!902442))

(declare-fun m!838449 () Bool)

(assert (=> b!902441 m!838449))

(declare-fun m!838451 () Bool)

(assert (=> b!902442 m!838451))

(assert (=> b!902402 d!111957))

(declare-fun mapIsEmpty!29380 () Bool)

(declare-fun mapRes!29380 () Bool)

(assert (=> mapIsEmpty!29380 mapRes!29380))

(declare-fun b!902450 () Bool)

(declare-fun e!505419 () Bool)

(assert (=> b!902450 (= e!505419 tp_is_empty!18447)))

(declare-fun condMapEmpty!29380 () Bool)

(declare-fun mapDefault!29380 () ValueCell!8742)

(assert (=> mapNonEmpty!29374 (= condMapEmpty!29380 (= mapRest!29374 ((as const (Array (_ BitVec 32) ValueCell!8742)) mapDefault!29380)))))

(assert (=> mapNonEmpty!29374 (= tp!56433 (and e!505419 mapRes!29380))))

(declare-fun mapNonEmpty!29380 () Bool)

(declare-fun tp!56439 () Bool)

(declare-fun e!505420 () Bool)

(assert (=> mapNonEmpty!29380 (= mapRes!29380 (and tp!56439 e!505420))))

(declare-fun mapValue!29380 () ValueCell!8742)

(declare-fun mapKey!29380 () (_ BitVec 32))

(declare-fun mapRest!29380 () (Array (_ BitVec 32) ValueCell!8742))

(assert (=> mapNonEmpty!29380 (= mapRest!29374 (store mapRest!29380 mapKey!29380 mapValue!29380))))

(declare-fun b!902449 () Bool)

(assert (=> b!902449 (= e!505420 tp_is_empty!18447)))

(assert (= (and mapNonEmpty!29374 condMapEmpty!29380) mapIsEmpty!29380))

(assert (= (and mapNonEmpty!29374 (not condMapEmpty!29380)) mapNonEmpty!29380))

(assert (= (and mapNonEmpty!29380 ((_ is ValueCellFull!8742) mapValue!29380)) b!902449))

(assert (= (and mapNonEmpty!29374 ((_ is ValueCellFull!8742) mapDefault!29380)) b!902450))

(declare-fun m!838453 () Bool)

(assert (=> mapNonEmpty!29380 m!838453))

(check-sat (not b!902434) (not b!902442) (not mapNonEmpty!29380) (not b!902436) (not b!902441) tp_is_empty!18447 (not bm!40240))
(check-sat)
