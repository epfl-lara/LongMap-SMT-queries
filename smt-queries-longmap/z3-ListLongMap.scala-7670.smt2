; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96588 () Bool)

(assert start!96588)

(declare-fun b!1096328 () Bool)

(declare-fun res!731265 () Bool)

(declare-fun e!626013 () Bool)

(assert (=> b!1096328 (=> (not res!731265) (not e!626013))))

(declare-datatypes ((array!70937 0))(
  ( (array!70938 (arr!34135 (Array (_ BitVec 32) (_ BitVec 64))) (size!34672 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70937)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70937 (_ BitVec 32)) Bool)

(assert (=> b!1096328 (= res!731265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!731267 () Bool)

(assert (=> start!96588 (=> (not res!731267) (not e!626013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96588 (= res!731267 (validMask!0 mask!1414))))

(assert (=> start!96588 e!626013))

(assert (=> start!96588 true))

(declare-fun array_inv!26340 (array!70937) Bool)

(assert (=> start!96588 (array_inv!26340 _keys!1070)))

(declare-datatypes ((V!41121 0))(
  ( (V!41122 (val!13554 Int)) )
))
(declare-datatypes ((ValueCell!12788 0))(
  ( (ValueCellFull!12788 (v!16171 V!41121)) (EmptyCell!12788) )
))
(declare-datatypes ((array!70939 0))(
  ( (array!70940 (arr!34136 (Array (_ BitVec 32) ValueCell!12788)) (size!34673 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70939)

(declare-fun e!626011 () Bool)

(declare-fun array_inv!26341 (array!70939) Bool)

(assert (=> start!96588 (and (array_inv!26341 _values!874) e!626011)))

(declare-fun b!1096329 () Bool)

(declare-fun res!731272 () Bool)

(assert (=> b!1096329 (=> (not res!731272) (not e!626013))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096329 (= res!731272 (= (select (arr!34135 _keys!1070) i!650) k0!904))))

(declare-fun b!1096330 () Bool)

(declare-fun res!731264 () Bool)

(declare-fun e!626016 () Bool)

(assert (=> b!1096330 (=> (not res!731264) (not e!626016))))

(assert (=> b!1096330 (= res!731264 (bvslt (size!34672 _keys!1070) #b01111111111111111111111111111111))))

(declare-fun b!1096331 () Bool)

(declare-fun res!731273 () Bool)

(assert (=> b!1096331 (=> (not res!731273) (not e!626013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096331 (= res!731273 (validKeyInArray!0 k0!904))))

(declare-fun b!1096332 () Bool)

(declare-fun res!731271 () Bool)

(assert (=> b!1096332 (=> (not res!731271) (not e!626013))))

(assert (=> b!1096332 (= res!731271 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34672 _keys!1070))))))

(declare-fun b!1096333 () Bool)

(declare-fun res!731266 () Bool)

(assert (=> b!1096333 (=> (not res!731266) (not e!626013))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1096333 (= res!731266 (and (= (size!34673 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34672 _keys!1070) (size!34673 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096334 () Bool)

(declare-fun e!626015 () Bool)

(declare-fun tp_is_empty!26995 () Bool)

(assert (=> b!1096334 (= e!626015 tp_is_empty!26995)))

(declare-fun b!1096335 () Bool)

(assert (=> b!1096335 (= e!626013 e!626016)))

(declare-fun res!731268 () Bool)

(assert (=> b!1096335 (=> (not res!731268) (not e!626016))))

(declare-fun lt!490248 () array!70937)

(assert (=> b!1096335 (= res!731268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490248 mask!1414))))

(assert (=> b!1096335 (= lt!490248 (array!70938 (store (arr!34135 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34672 _keys!1070)))))

(declare-fun b!1096336 () Bool)

(declare-fun e!626012 () Bool)

(assert (=> b!1096336 (= e!626012 tp_is_empty!26995)))

(declare-fun b!1096337 () Bool)

(declare-fun res!731269 () Bool)

(assert (=> b!1096337 (=> (not res!731269) (not e!626013))))

(declare-datatypes ((List!23843 0))(
  ( (Nil!23840) (Cons!23839 (h!25057 (_ BitVec 64)) (t!33842 List!23843)) )
))
(declare-fun arrayNoDuplicates!0 (array!70937 (_ BitVec 32) List!23843) Bool)

(assert (=> b!1096337 (= res!731269 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23840))))

(declare-fun b!1096338 () Bool)

(declare-fun mapRes!42250 () Bool)

(assert (=> b!1096338 (= e!626011 (and e!626015 mapRes!42250))))

(declare-fun condMapEmpty!42250 () Bool)

(declare-fun mapDefault!42250 () ValueCell!12788)

(assert (=> b!1096338 (= condMapEmpty!42250 (= (arr!34136 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12788)) mapDefault!42250)))))

(declare-fun b!1096339 () Bool)

(declare-fun arrayContainsKey!0 (array!70937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096339 (= e!626016 (not (arrayContainsKey!0 _keys!1070 k0!904 i!650)))))

(declare-fun mapIsEmpty!42250 () Bool)

(assert (=> mapIsEmpty!42250 mapRes!42250))

(declare-fun b!1096340 () Bool)

(declare-fun res!731270 () Bool)

(assert (=> b!1096340 (=> (not res!731270) (not e!626016))))

(assert (=> b!1096340 (= res!731270 (arrayNoDuplicates!0 lt!490248 #b00000000000000000000000000000000 Nil!23840))))

(declare-fun mapNonEmpty!42250 () Bool)

(declare-fun tp!80765 () Bool)

(assert (=> mapNonEmpty!42250 (= mapRes!42250 (and tp!80765 e!626012))))

(declare-fun mapRest!42250 () (Array (_ BitVec 32) ValueCell!12788))

(declare-fun mapKey!42250 () (_ BitVec 32))

(declare-fun mapValue!42250 () ValueCell!12788)

(assert (=> mapNonEmpty!42250 (= (arr!34136 _values!874) (store mapRest!42250 mapKey!42250 mapValue!42250))))

(assert (= (and start!96588 res!731267) b!1096333))

(assert (= (and b!1096333 res!731266) b!1096328))

(assert (= (and b!1096328 res!731265) b!1096337))

(assert (= (and b!1096337 res!731269) b!1096332))

(assert (= (and b!1096332 res!731271) b!1096331))

(assert (= (and b!1096331 res!731273) b!1096329))

(assert (= (and b!1096329 res!731272) b!1096335))

(assert (= (and b!1096335 res!731268) b!1096340))

(assert (= (and b!1096340 res!731270) b!1096330))

(assert (= (and b!1096330 res!731264) b!1096339))

(assert (= (and b!1096338 condMapEmpty!42250) mapIsEmpty!42250))

(assert (= (and b!1096338 (not condMapEmpty!42250)) mapNonEmpty!42250))

(get-info :version)

(assert (= (and mapNonEmpty!42250 ((_ is ValueCellFull!12788) mapValue!42250)) b!1096336))

(assert (= (and b!1096338 ((_ is ValueCellFull!12788) mapDefault!42250)) b!1096334))

(assert (= start!96588 b!1096338))

(declare-fun m!1016421 () Bool)

(assert (=> b!1096337 m!1016421))

(declare-fun m!1016423 () Bool)

(assert (=> mapNonEmpty!42250 m!1016423))

(declare-fun m!1016425 () Bool)

(assert (=> b!1096328 m!1016425))

(declare-fun m!1016427 () Bool)

(assert (=> start!96588 m!1016427))

(declare-fun m!1016429 () Bool)

(assert (=> start!96588 m!1016429))

(declare-fun m!1016431 () Bool)

(assert (=> start!96588 m!1016431))

(declare-fun m!1016433 () Bool)

(assert (=> b!1096335 m!1016433))

(declare-fun m!1016435 () Bool)

(assert (=> b!1096335 m!1016435))

(declare-fun m!1016437 () Bool)

(assert (=> b!1096331 m!1016437))

(declare-fun m!1016439 () Bool)

(assert (=> b!1096340 m!1016439))

(declare-fun m!1016441 () Bool)

(assert (=> b!1096329 m!1016441))

(declare-fun m!1016443 () Bool)

(assert (=> b!1096339 m!1016443))

(check-sat (not b!1096331) (not b!1096328) (not b!1096339) (not mapNonEmpty!42250) tp_is_empty!26995 (not b!1096335) (not start!96588) (not b!1096337) (not b!1096340))
(check-sat)
(get-model)

(declare-fun b!1096429 () Bool)

(declare-fun e!626064 () Bool)

(declare-fun e!626063 () Bool)

(assert (=> b!1096429 (= e!626064 e!626063)))

(declare-fun c!108763 () Bool)

(assert (=> b!1096429 (= c!108763 (validKeyInArray!0 (select (arr!34135 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1096430 () Bool)

(declare-fun call!45826 () Bool)

(assert (=> b!1096430 (= e!626063 call!45826)))

(declare-fun b!1096431 () Bool)

(assert (=> b!1096431 (= e!626063 call!45826)))

(declare-fun b!1096432 () Bool)

(declare-fun e!626061 () Bool)

(assert (=> b!1096432 (= e!626061 e!626064)))

(declare-fun res!731341 () Bool)

(assert (=> b!1096432 (=> (not res!731341) (not e!626064))))

(declare-fun e!626062 () Bool)

(assert (=> b!1096432 (= res!731341 (not e!626062))))

(declare-fun res!731342 () Bool)

(assert (=> b!1096432 (=> (not res!731342) (not e!626062))))

(assert (=> b!1096432 (= res!731342 (validKeyInArray!0 (select (arr!34135 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130699 () Bool)

(declare-fun res!731340 () Bool)

(assert (=> d!130699 (=> res!731340 e!626061)))

(assert (=> d!130699 (= res!731340 (bvsge #b00000000000000000000000000000000 (size!34672 _keys!1070)))))

(assert (=> d!130699 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23840) e!626061)))

(declare-fun bm!45823 () Bool)

(assert (=> bm!45823 (= call!45826 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108763 (Cons!23839 (select (arr!34135 _keys!1070) #b00000000000000000000000000000000) Nil!23840) Nil!23840)))))

(declare-fun b!1096433 () Bool)

(declare-fun contains!6400 (List!23843 (_ BitVec 64)) Bool)

(assert (=> b!1096433 (= e!626062 (contains!6400 Nil!23840 (select (arr!34135 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130699 (not res!731340)) b!1096432))

(assert (= (and b!1096432 res!731342) b!1096433))

(assert (= (and b!1096432 res!731341) b!1096429))

(assert (= (and b!1096429 c!108763) b!1096431))

(assert (= (and b!1096429 (not c!108763)) b!1096430))

(assert (= (or b!1096431 b!1096430) bm!45823))

(declare-fun m!1016493 () Bool)

(assert (=> b!1096429 m!1016493))

(assert (=> b!1096429 m!1016493))

(declare-fun m!1016495 () Bool)

(assert (=> b!1096429 m!1016495))

(assert (=> b!1096432 m!1016493))

(assert (=> b!1096432 m!1016493))

(assert (=> b!1096432 m!1016495))

(assert (=> bm!45823 m!1016493))

(declare-fun m!1016497 () Bool)

(assert (=> bm!45823 m!1016497))

(assert (=> b!1096433 m!1016493))

(assert (=> b!1096433 m!1016493))

(declare-fun m!1016499 () Bool)

(assert (=> b!1096433 m!1016499))

(assert (=> b!1096337 d!130699))

(declare-fun d!130701 () Bool)

(assert (=> d!130701 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1096331 d!130701))

(declare-fun b!1096442 () Bool)

(declare-fun e!626073 () Bool)

(declare-fun e!626072 () Bool)

(assert (=> b!1096442 (= e!626073 e!626072)))

(declare-fun c!108766 () Bool)

(assert (=> b!1096442 (= c!108766 (validKeyInArray!0 (select (arr!34135 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1096443 () Bool)

(declare-fun call!45829 () Bool)

(assert (=> b!1096443 (= e!626072 call!45829)))

(declare-fun d!130703 () Bool)

(declare-fun res!731347 () Bool)

(assert (=> d!130703 (=> res!731347 e!626073)))

(assert (=> d!130703 (= res!731347 (bvsge #b00000000000000000000000000000000 (size!34672 _keys!1070)))))

(assert (=> d!130703 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!626073)))

(declare-fun b!1096444 () Bool)

(declare-fun e!626071 () Bool)

(assert (=> b!1096444 (= e!626071 call!45829)))

(declare-fun bm!45826 () Bool)

(assert (=> bm!45826 (= call!45829 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1096445 () Bool)

(assert (=> b!1096445 (= e!626072 e!626071)))

(declare-fun lt!490261 () (_ BitVec 64))

(assert (=> b!1096445 (= lt!490261 (select (arr!34135 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36021 0))(
  ( (Unit!36022) )
))
(declare-fun lt!490262 () Unit!36021)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70937 (_ BitVec 64) (_ BitVec 32)) Unit!36021)

(assert (=> b!1096445 (= lt!490262 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!490261 #b00000000000000000000000000000000))))

(assert (=> b!1096445 (arrayContainsKey!0 _keys!1070 lt!490261 #b00000000000000000000000000000000)))

(declare-fun lt!490263 () Unit!36021)

(assert (=> b!1096445 (= lt!490263 lt!490262)))

(declare-fun res!731348 () Bool)

(declare-datatypes ((SeekEntryResult!9861 0))(
  ( (MissingZero!9861 (index!41815 (_ BitVec 32))) (Found!9861 (index!41816 (_ BitVec 32))) (Intermediate!9861 (undefined!10673 Bool) (index!41817 (_ BitVec 32)) (x!98408 (_ BitVec 32))) (Undefined!9861) (MissingVacant!9861 (index!41818 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!70937 (_ BitVec 32)) SeekEntryResult!9861)

(assert (=> b!1096445 (= res!731348 (= (seekEntryOrOpen!0 (select (arr!34135 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9861 #b00000000000000000000000000000000)))))

(assert (=> b!1096445 (=> (not res!731348) (not e!626071))))

(assert (= (and d!130703 (not res!731347)) b!1096442))

(assert (= (and b!1096442 c!108766) b!1096445))

(assert (= (and b!1096442 (not c!108766)) b!1096443))

(assert (= (and b!1096445 res!731348) b!1096444))

(assert (= (or b!1096444 b!1096443) bm!45826))

(assert (=> b!1096442 m!1016493))

(assert (=> b!1096442 m!1016493))

(assert (=> b!1096442 m!1016495))

(declare-fun m!1016501 () Bool)

(assert (=> bm!45826 m!1016501))

(assert (=> b!1096445 m!1016493))

(declare-fun m!1016503 () Bool)

(assert (=> b!1096445 m!1016503))

(declare-fun m!1016505 () Bool)

(assert (=> b!1096445 m!1016505))

(assert (=> b!1096445 m!1016493))

(declare-fun m!1016507 () Bool)

(assert (=> b!1096445 m!1016507))

(assert (=> b!1096328 d!130703))

(declare-fun d!130705 () Bool)

(declare-fun res!731353 () Bool)

(declare-fun e!626078 () Bool)

(assert (=> d!130705 (=> res!731353 e!626078)))

(assert (=> d!130705 (= res!731353 (= (select (arr!34135 _keys!1070) i!650) k0!904))))

(assert (=> d!130705 (= (arrayContainsKey!0 _keys!1070 k0!904 i!650) e!626078)))

(declare-fun b!1096450 () Bool)

(declare-fun e!626079 () Bool)

(assert (=> b!1096450 (= e!626078 e!626079)))

(declare-fun res!731354 () Bool)

(assert (=> b!1096450 (=> (not res!731354) (not e!626079))))

(assert (=> b!1096450 (= res!731354 (bvslt (bvadd i!650 #b00000000000000000000000000000001) (size!34672 _keys!1070)))))

(declare-fun b!1096451 () Bool)

(assert (=> b!1096451 (= e!626079 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd i!650 #b00000000000000000000000000000001)))))

(assert (= (and d!130705 (not res!731353)) b!1096450))

(assert (= (and b!1096450 res!731354) b!1096451))

(assert (=> d!130705 m!1016441))

(declare-fun m!1016509 () Bool)

(assert (=> b!1096451 m!1016509))

(assert (=> b!1096339 d!130705))

(declare-fun b!1096452 () Bool)

(declare-fun e!626083 () Bool)

(declare-fun e!626082 () Bool)

(assert (=> b!1096452 (= e!626083 e!626082)))

(declare-fun c!108767 () Bool)

(assert (=> b!1096452 (= c!108767 (validKeyInArray!0 (select (arr!34135 lt!490248) #b00000000000000000000000000000000)))))

(declare-fun b!1096453 () Bool)

(declare-fun call!45830 () Bool)

(assert (=> b!1096453 (= e!626082 call!45830)))

(declare-fun b!1096454 () Bool)

(assert (=> b!1096454 (= e!626082 call!45830)))

(declare-fun b!1096455 () Bool)

(declare-fun e!626080 () Bool)

(assert (=> b!1096455 (= e!626080 e!626083)))

(declare-fun res!731356 () Bool)

(assert (=> b!1096455 (=> (not res!731356) (not e!626083))))

(declare-fun e!626081 () Bool)

(assert (=> b!1096455 (= res!731356 (not e!626081))))

(declare-fun res!731357 () Bool)

(assert (=> b!1096455 (=> (not res!731357) (not e!626081))))

(assert (=> b!1096455 (= res!731357 (validKeyInArray!0 (select (arr!34135 lt!490248) #b00000000000000000000000000000000)))))

(declare-fun d!130707 () Bool)

(declare-fun res!731355 () Bool)

(assert (=> d!130707 (=> res!731355 e!626080)))

(assert (=> d!130707 (= res!731355 (bvsge #b00000000000000000000000000000000 (size!34672 lt!490248)))))

(assert (=> d!130707 (= (arrayNoDuplicates!0 lt!490248 #b00000000000000000000000000000000 Nil!23840) e!626080)))

(declare-fun bm!45827 () Bool)

(assert (=> bm!45827 (= call!45830 (arrayNoDuplicates!0 lt!490248 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108767 (Cons!23839 (select (arr!34135 lt!490248) #b00000000000000000000000000000000) Nil!23840) Nil!23840)))))

(declare-fun b!1096456 () Bool)

(assert (=> b!1096456 (= e!626081 (contains!6400 Nil!23840 (select (arr!34135 lt!490248) #b00000000000000000000000000000000)))))

(assert (= (and d!130707 (not res!731355)) b!1096455))

(assert (= (and b!1096455 res!731357) b!1096456))

(assert (= (and b!1096455 res!731356) b!1096452))

(assert (= (and b!1096452 c!108767) b!1096454))

(assert (= (and b!1096452 (not c!108767)) b!1096453))

(assert (= (or b!1096454 b!1096453) bm!45827))

(declare-fun m!1016511 () Bool)

(assert (=> b!1096452 m!1016511))

(assert (=> b!1096452 m!1016511))

(declare-fun m!1016513 () Bool)

(assert (=> b!1096452 m!1016513))

(assert (=> b!1096455 m!1016511))

(assert (=> b!1096455 m!1016511))

(assert (=> b!1096455 m!1016513))

(assert (=> bm!45827 m!1016511))

(declare-fun m!1016515 () Bool)

(assert (=> bm!45827 m!1016515))

(assert (=> b!1096456 m!1016511))

(assert (=> b!1096456 m!1016511))

(declare-fun m!1016517 () Bool)

(assert (=> b!1096456 m!1016517))

(assert (=> b!1096340 d!130707))

(declare-fun d!130709 () Bool)

(assert (=> d!130709 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96588 d!130709))

(declare-fun d!130711 () Bool)

(assert (=> d!130711 (= (array_inv!26340 _keys!1070) (bvsge (size!34672 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96588 d!130711))

(declare-fun d!130713 () Bool)

(assert (=> d!130713 (= (array_inv!26341 _values!874) (bvsge (size!34673 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96588 d!130713))

(declare-fun b!1096457 () Bool)

(declare-fun e!626086 () Bool)

(declare-fun e!626085 () Bool)

(assert (=> b!1096457 (= e!626086 e!626085)))

(declare-fun c!108768 () Bool)

(assert (=> b!1096457 (= c!108768 (validKeyInArray!0 (select (arr!34135 lt!490248) #b00000000000000000000000000000000)))))

(declare-fun b!1096458 () Bool)

(declare-fun call!45831 () Bool)

(assert (=> b!1096458 (= e!626085 call!45831)))

(declare-fun d!130715 () Bool)

(declare-fun res!731358 () Bool)

(assert (=> d!130715 (=> res!731358 e!626086)))

(assert (=> d!130715 (= res!731358 (bvsge #b00000000000000000000000000000000 (size!34672 lt!490248)))))

(assert (=> d!130715 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490248 mask!1414) e!626086)))

(declare-fun b!1096459 () Bool)

(declare-fun e!626084 () Bool)

(assert (=> b!1096459 (= e!626084 call!45831)))

(declare-fun bm!45828 () Bool)

(assert (=> bm!45828 (= call!45831 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!490248 mask!1414))))

(declare-fun b!1096460 () Bool)

(assert (=> b!1096460 (= e!626085 e!626084)))

(declare-fun lt!490264 () (_ BitVec 64))

(assert (=> b!1096460 (= lt!490264 (select (arr!34135 lt!490248) #b00000000000000000000000000000000))))

(declare-fun lt!490265 () Unit!36021)

(assert (=> b!1096460 (= lt!490265 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!490248 lt!490264 #b00000000000000000000000000000000))))

(assert (=> b!1096460 (arrayContainsKey!0 lt!490248 lt!490264 #b00000000000000000000000000000000)))

(declare-fun lt!490266 () Unit!36021)

(assert (=> b!1096460 (= lt!490266 lt!490265)))

(declare-fun res!731359 () Bool)

(assert (=> b!1096460 (= res!731359 (= (seekEntryOrOpen!0 (select (arr!34135 lt!490248) #b00000000000000000000000000000000) lt!490248 mask!1414) (Found!9861 #b00000000000000000000000000000000)))))

(assert (=> b!1096460 (=> (not res!731359) (not e!626084))))

(assert (= (and d!130715 (not res!731358)) b!1096457))

(assert (= (and b!1096457 c!108768) b!1096460))

(assert (= (and b!1096457 (not c!108768)) b!1096458))

(assert (= (and b!1096460 res!731359) b!1096459))

(assert (= (or b!1096459 b!1096458) bm!45828))

(assert (=> b!1096457 m!1016511))

(assert (=> b!1096457 m!1016511))

(assert (=> b!1096457 m!1016513))

(declare-fun m!1016519 () Bool)

(assert (=> bm!45828 m!1016519))

(assert (=> b!1096460 m!1016511))

(declare-fun m!1016521 () Bool)

(assert (=> b!1096460 m!1016521))

(declare-fun m!1016523 () Bool)

(assert (=> b!1096460 m!1016523))

(assert (=> b!1096460 m!1016511))

(declare-fun m!1016525 () Bool)

(assert (=> b!1096460 m!1016525))

(assert (=> b!1096335 d!130715))

(declare-fun b!1096467 () Bool)

(declare-fun e!626091 () Bool)

(assert (=> b!1096467 (= e!626091 tp_is_empty!26995)))

(declare-fun mapNonEmpty!42259 () Bool)

(declare-fun mapRes!42259 () Bool)

(declare-fun tp!80774 () Bool)

(assert (=> mapNonEmpty!42259 (= mapRes!42259 (and tp!80774 e!626091))))

(declare-fun mapValue!42259 () ValueCell!12788)

(declare-fun mapKey!42259 () (_ BitVec 32))

(declare-fun mapRest!42259 () (Array (_ BitVec 32) ValueCell!12788))

(assert (=> mapNonEmpty!42259 (= mapRest!42250 (store mapRest!42259 mapKey!42259 mapValue!42259))))

(declare-fun mapIsEmpty!42259 () Bool)

(assert (=> mapIsEmpty!42259 mapRes!42259))

(declare-fun condMapEmpty!42259 () Bool)

(declare-fun mapDefault!42259 () ValueCell!12788)

(assert (=> mapNonEmpty!42250 (= condMapEmpty!42259 (= mapRest!42250 ((as const (Array (_ BitVec 32) ValueCell!12788)) mapDefault!42259)))))

(declare-fun e!626092 () Bool)

(assert (=> mapNonEmpty!42250 (= tp!80765 (and e!626092 mapRes!42259))))

(declare-fun b!1096468 () Bool)

(assert (=> b!1096468 (= e!626092 tp_is_empty!26995)))

(assert (= (and mapNonEmpty!42250 condMapEmpty!42259) mapIsEmpty!42259))

(assert (= (and mapNonEmpty!42250 (not condMapEmpty!42259)) mapNonEmpty!42259))

(assert (= (and mapNonEmpty!42259 ((_ is ValueCellFull!12788) mapValue!42259)) b!1096467))

(assert (= (and mapNonEmpty!42250 ((_ is ValueCellFull!12788) mapDefault!42259)) b!1096468))

(declare-fun m!1016527 () Bool)

(assert (=> mapNonEmpty!42259 m!1016527))

(check-sat (not b!1096429) (not b!1096456) (not bm!45823) (not b!1096460) (not bm!45827) (not b!1096432) (not b!1096445) (not b!1096452) (not b!1096442) (not b!1096457) (not b!1096451) (not b!1096433) (not bm!45828) (not mapNonEmpty!42259) (not bm!45826) (not b!1096455) tp_is_empty!26995)
(check-sat)
