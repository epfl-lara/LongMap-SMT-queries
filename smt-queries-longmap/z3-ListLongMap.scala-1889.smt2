; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33790 () Bool)

(assert start!33790)

(declare-fun b_free!7003 () Bool)

(declare-fun b_next!7003 () Bool)

(assert (=> start!33790 (= b_free!7003 (not b_next!7003))))

(declare-fun tp!24519 () Bool)

(declare-fun b_and!14161 () Bool)

(assert (=> start!33790 (= tp!24519 b_and!14161)))

(declare-fun b!335979 () Bool)

(declare-fun e!206225 () Bool)

(declare-fun tp_is_empty!6955 () Bool)

(assert (=> b!335979 (= e!206225 tp_is_empty!6955)))

(declare-fun res!185460 () Bool)

(declare-fun e!206230 () Bool)

(assert (=> start!33790 (=> (not res!185460) (not e!206230))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33790 (= res!185460 (validMask!0 mask!2385))))

(assert (=> start!33790 e!206230))

(assert (=> start!33790 true))

(assert (=> start!33790 tp_is_empty!6955))

(assert (=> start!33790 tp!24519))

(declare-datatypes ((V!10251 0))(
  ( (V!10252 (val!3522 Int)) )
))
(declare-datatypes ((ValueCell!3134 0))(
  ( (ValueCellFull!3134 (v!5680 V!10251)) (EmptyCell!3134) )
))
(declare-datatypes ((array!17487 0))(
  ( (array!17488 (arr!8272 (Array (_ BitVec 32) ValueCell!3134)) (size!8625 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17487)

(declare-fun e!206227 () Bool)

(declare-fun array_inv!6176 (array!17487) Bool)

(assert (=> start!33790 (and (array_inv!6176 _values!1525) e!206227)))

(declare-datatypes ((array!17489 0))(
  ( (array!17490 (arr!8273 (Array (_ BitVec 32) (_ BitVec 64))) (size!8626 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17489)

(declare-fun array_inv!6177 (array!17489) Bool)

(assert (=> start!33790 (array_inv!6177 _keys!1895)))

(declare-fun b!335980 () Bool)

(declare-fun res!185456 () Bool)

(assert (=> b!335980 (=> (not res!185456) (not e!206230))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335980 (= res!185456 (validKeyInArray!0 k0!1348))))

(declare-fun b!335981 () Bool)

(declare-fun e!206229 () Bool)

(assert (=> b!335981 (= e!206229 (or (bvsge #b00000000000000000000000000000000 (size!8626 _keys!1895)) (bvsge (size!8626 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!335982 () Bool)

(declare-fun res!185462 () Bool)

(assert (=> b!335982 (=> (not res!185462) (not e!206229))))

(declare-fun arrayContainsKey!0 (array!17489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335982 (= res!185462 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!335983 () Bool)

(assert (=> b!335983 (= e!206230 e!206229)))

(declare-fun res!185461 () Bool)

(assert (=> b!335983 (=> (not res!185461) (not e!206229))))

(declare-datatypes ((SeekEntryResult!3200 0))(
  ( (MissingZero!3200 (index!14979 (_ BitVec 32))) (Found!3200 (index!14980 (_ BitVec 32))) (Intermediate!3200 (undefined!4012 Bool) (index!14981 (_ BitVec 32)) (x!33509 (_ BitVec 32))) (Undefined!3200) (MissingVacant!3200 (index!14982 (_ BitVec 32))) )
))
(declare-fun lt!159924 () SeekEntryResult!3200)

(get-info :version)

(assert (=> b!335983 (= res!185461 (and (not ((_ is Found!3200) lt!159924)) ((_ is MissingZero!3200) lt!159924)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17489 (_ BitVec 32)) SeekEntryResult!3200)

(assert (=> b!335983 (= lt!159924 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335984 () Bool)

(declare-fun res!185455 () Bool)

(assert (=> b!335984 (=> (not res!185455) (not e!206230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17489 (_ BitVec 32)) Bool)

(assert (=> b!335984 (= res!185455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11835 () Bool)

(declare-fun mapRes!11835 () Bool)

(declare-fun tp!24518 () Bool)

(assert (=> mapNonEmpty!11835 (= mapRes!11835 (and tp!24518 e!206225))))

(declare-fun mapRest!11835 () (Array (_ BitVec 32) ValueCell!3134))

(declare-fun mapKey!11835 () (_ BitVec 32))

(declare-fun mapValue!11835 () ValueCell!3134)

(assert (=> mapNonEmpty!11835 (= (arr!8272 _values!1525) (store mapRest!11835 mapKey!11835 mapValue!11835))))

(declare-fun b!335985 () Bool)

(declare-fun res!185457 () Bool)

(assert (=> b!335985 (=> (not res!185457) (not e!206230))))

(declare-datatypes ((List!4698 0))(
  ( (Nil!4695) (Cons!4694 (h!5550 (_ BitVec 64)) (t!9781 List!4698)) )
))
(declare-fun arrayNoDuplicates!0 (array!17489 (_ BitVec 32) List!4698) Bool)

(assert (=> b!335985 (= res!185457 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4695))))

(declare-fun b!335986 () Bool)

(declare-fun res!185458 () Bool)

(assert (=> b!335986 (=> (not res!185458) (not e!206230))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335986 (= res!185458 (and (= (size!8625 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8626 _keys!1895) (size!8625 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335987 () Bool)

(declare-fun res!185459 () Bool)

(assert (=> b!335987 (=> (not res!185459) (not e!206230))))

(declare-fun zeroValue!1467 () V!10251)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10251)

(declare-datatypes ((tuple2!5064 0))(
  ( (tuple2!5065 (_1!2543 (_ BitVec 64)) (_2!2543 V!10251)) )
))
(declare-datatypes ((List!4699 0))(
  ( (Nil!4696) (Cons!4695 (h!5551 tuple2!5064) (t!9782 List!4699)) )
))
(declare-datatypes ((ListLongMap!3967 0))(
  ( (ListLongMap!3968 (toList!1999 List!4699)) )
))
(declare-fun contains!2056 (ListLongMap!3967 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1505 (array!17489 array!17487 (_ BitVec 32) (_ BitVec 32) V!10251 V!10251 (_ BitVec 32) Int) ListLongMap!3967)

(assert (=> b!335987 (= res!185459 (not (contains!2056 (getCurrentListMap!1505 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!335988 () Bool)

(declare-fun e!206228 () Bool)

(assert (=> b!335988 (= e!206227 (and e!206228 mapRes!11835))))

(declare-fun condMapEmpty!11835 () Bool)

(declare-fun mapDefault!11835 () ValueCell!3134)

(assert (=> b!335988 (= condMapEmpty!11835 (= (arr!8272 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3134)) mapDefault!11835)))))

(declare-fun mapIsEmpty!11835 () Bool)

(assert (=> mapIsEmpty!11835 mapRes!11835))

(declare-fun b!335989 () Bool)

(assert (=> b!335989 (= e!206228 tp_is_empty!6955)))

(assert (= (and start!33790 res!185460) b!335986))

(assert (= (and b!335986 res!185458) b!335984))

(assert (= (and b!335984 res!185455) b!335985))

(assert (= (and b!335985 res!185457) b!335980))

(assert (= (and b!335980 res!185456) b!335987))

(assert (= (and b!335987 res!185459) b!335983))

(assert (= (and b!335983 res!185461) b!335982))

(assert (= (and b!335982 res!185462) b!335981))

(assert (= (and b!335988 condMapEmpty!11835) mapIsEmpty!11835))

(assert (= (and b!335988 (not condMapEmpty!11835)) mapNonEmpty!11835))

(assert (= (and mapNonEmpty!11835 ((_ is ValueCellFull!3134) mapValue!11835)) b!335979))

(assert (= (and b!335988 ((_ is ValueCellFull!3134) mapDefault!11835)) b!335989))

(assert (= start!33790 b!335988))

(declare-fun m!339379 () Bool)

(assert (=> b!335980 m!339379))

(declare-fun m!339381 () Bool)

(assert (=> b!335987 m!339381))

(assert (=> b!335987 m!339381))

(declare-fun m!339383 () Bool)

(assert (=> b!335987 m!339383))

(declare-fun m!339385 () Bool)

(assert (=> mapNonEmpty!11835 m!339385))

(declare-fun m!339387 () Bool)

(assert (=> b!335983 m!339387))

(declare-fun m!339389 () Bool)

(assert (=> b!335985 m!339389))

(declare-fun m!339391 () Bool)

(assert (=> b!335984 m!339391))

(declare-fun m!339393 () Bool)

(assert (=> b!335982 m!339393))

(declare-fun m!339395 () Bool)

(assert (=> start!33790 m!339395))

(declare-fun m!339397 () Bool)

(assert (=> start!33790 m!339397))

(declare-fun m!339399 () Bool)

(assert (=> start!33790 m!339399))

(check-sat (not b!335982) (not b!335987) (not b!335985) (not mapNonEmpty!11835) (not b!335983) (not b!335980) tp_is_empty!6955 (not b_next!7003) (not b!335984) b_and!14161 (not start!33790))
(check-sat b_and!14161 (not b_next!7003))
(get-model)

(declare-fun b!336066 () Bool)

(declare-fun e!206276 () Bool)

(declare-fun e!206275 () Bool)

(assert (=> b!336066 (= e!206276 e!206275)))

(declare-fun res!185518 () Bool)

(assert (=> b!336066 (=> (not res!185518) (not e!206275))))

(declare-fun e!206277 () Bool)

(assert (=> b!336066 (= res!185518 (not e!206277))))

(declare-fun res!185517 () Bool)

(assert (=> b!336066 (=> (not res!185517) (not e!206277))))

(assert (=> b!336066 (= res!185517 (validKeyInArray!0 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26324 () Bool)

(declare-fun call!26327 () Bool)

(declare-fun c!52196 () Bool)

(assert (=> bm!26324 (= call!26327 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52196 (Cons!4694 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000) Nil!4695) Nil!4695)))))

(declare-fun b!336067 () Bool)

(declare-fun e!206278 () Bool)

(assert (=> b!336067 (= e!206275 e!206278)))

(assert (=> b!336067 (= c!52196 (validKeyInArray!0 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336069 () Bool)

(assert (=> b!336069 (= e!206278 call!26327)))

(declare-fun b!336070 () Bool)

(assert (=> b!336070 (= e!206278 call!26327)))

(declare-fun b!336068 () Bool)

(declare-fun contains!2059 (List!4698 (_ BitVec 64)) Bool)

(assert (=> b!336068 (= e!206277 (contains!2059 Nil!4695 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70487 () Bool)

(declare-fun res!185519 () Bool)

(assert (=> d!70487 (=> res!185519 e!206276)))

(assert (=> d!70487 (= res!185519 (bvsge #b00000000000000000000000000000000 (size!8626 _keys!1895)))))

(assert (=> d!70487 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4695) e!206276)))

(assert (= (and d!70487 (not res!185519)) b!336066))

(assert (= (and b!336066 res!185517) b!336068))

(assert (= (and b!336066 res!185518) b!336067))

(assert (= (and b!336067 c!52196) b!336069))

(assert (= (and b!336067 (not c!52196)) b!336070))

(assert (= (or b!336069 b!336070) bm!26324))

(declare-fun m!339445 () Bool)

(assert (=> b!336066 m!339445))

(assert (=> b!336066 m!339445))

(declare-fun m!339447 () Bool)

(assert (=> b!336066 m!339447))

(assert (=> bm!26324 m!339445))

(declare-fun m!339449 () Bool)

(assert (=> bm!26324 m!339449))

(assert (=> b!336067 m!339445))

(assert (=> b!336067 m!339445))

(assert (=> b!336067 m!339447))

(assert (=> b!336068 m!339445))

(assert (=> b!336068 m!339445))

(declare-fun m!339451 () Bool)

(assert (=> b!336068 m!339451))

(assert (=> b!335985 d!70487))

(declare-fun d!70489 () Bool)

(assert (=> d!70489 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!335980 d!70489))

(declare-fun b!336079 () Bool)

(declare-fun e!206285 () Bool)

(declare-fun e!206286 () Bool)

(assert (=> b!336079 (= e!206285 e!206286)))

(declare-fun c!52199 () Bool)

(assert (=> b!336079 (= c!52199 (validKeyInArray!0 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26327 () Bool)

(declare-fun call!26330 () Bool)

(assert (=> bm!26327 (= call!26330 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70491 () Bool)

(declare-fun res!185525 () Bool)

(assert (=> d!70491 (=> res!185525 e!206285)))

(assert (=> d!70491 (= res!185525 (bvsge #b00000000000000000000000000000000 (size!8626 _keys!1895)))))

(assert (=> d!70491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!206285)))

(declare-fun b!336080 () Bool)

(declare-fun e!206287 () Bool)

(assert (=> b!336080 (= e!206286 e!206287)))

(declare-fun lt!159938 () (_ BitVec 64))

(assert (=> b!336080 (= lt!159938 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10442 0))(
  ( (Unit!10443) )
))
(declare-fun lt!159939 () Unit!10442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17489 (_ BitVec 64) (_ BitVec 32)) Unit!10442)

(assert (=> b!336080 (= lt!159939 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159938 #b00000000000000000000000000000000))))

(assert (=> b!336080 (arrayContainsKey!0 _keys!1895 lt!159938 #b00000000000000000000000000000000)))

(declare-fun lt!159937 () Unit!10442)

(assert (=> b!336080 (= lt!159937 lt!159939)))

(declare-fun res!185524 () Bool)

(assert (=> b!336080 (= res!185524 (= (seekEntryOrOpen!0 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3200 #b00000000000000000000000000000000)))))

(assert (=> b!336080 (=> (not res!185524) (not e!206287))))

(declare-fun b!336081 () Bool)

(assert (=> b!336081 (= e!206286 call!26330)))

(declare-fun b!336082 () Bool)

(assert (=> b!336082 (= e!206287 call!26330)))

(assert (= (and d!70491 (not res!185525)) b!336079))

(assert (= (and b!336079 c!52199) b!336080))

(assert (= (and b!336079 (not c!52199)) b!336081))

(assert (= (and b!336080 res!185524) b!336082))

(assert (= (or b!336082 b!336081) bm!26327))

(assert (=> b!336079 m!339445))

(assert (=> b!336079 m!339445))

(assert (=> b!336079 m!339447))

(declare-fun m!339453 () Bool)

(assert (=> bm!26327 m!339453))

(assert (=> b!336080 m!339445))

(declare-fun m!339455 () Bool)

(assert (=> b!336080 m!339455))

(declare-fun m!339457 () Bool)

(assert (=> b!336080 m!339457))

(assert (=> b!336080 m!339445))

(declare-fun m!339459 () Bool)

(assert (=> b!336080 m!339459))

(assert (=> b!335984 d!70491))

(declare-fun d!70493 () Bool)

(assert (=> d!70493 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33790 d!70493))

(declare-fun d!70495 () Bool)

(assert (=> d!70495 (= (array_inv!6176 _values!1525) (bvsge (size!8625 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33790 d!70495))

(declare-fun d!70497 () Bool)

(assert (=> d!70497 (= (array_inv!6177 _keys!1895) (bvsge (size!8626 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33790 d!70497))

(declare-fun d!70499 () Bool)

(declare-fun res!185530 () Bool)

(declare-fun e!206292 () Bool)

(assert (=> d!70499 (=> res!185530 e!206292)))

(assert (=> d!70499 (= res!185530 (= (select (arr!8273 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70499 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!206292)))

(declare-fun b!336087 () Bool)

(declare-fun e!206293 () Bool)

(assert (=> b!336087 (= e!206292 e!206293)))

(declare-fun res!185531 () Bool)

(assert (=> b!336087 (=> (not res!185531) (not e!206293))))

(assert (=> b!336087 (= res!185531 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8626 _keys!1895)))))

(declare-fun b!336088 () Bool)

(assert (=> b!336088 (= e!206293 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70499 (not res!185530)) b!336087))

(assert (= (and b!336087 res!185531) b!336088))

(assert (=> d!70499 m!339445))

(declare-fun m!339461 () Bool)

(assert (=> b!336088 m!339461))

(assert (=> b!335982 d!70499))

(declare-fun e!206302 () SeekEntryResult!3200)

(declare-fun b!336102 () Bool)

(declare-fun lt!159946 () SeekEntryResult!3200)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17489 (_ BitVec 32)) SeekEntryResult!3200)

(assert (=> b!336102 (= e!206302 (seekKeyOrZeroReturnVacant!0 (x!33509 lt!159946) (index!14981 lt!159946) (index!14981 lt!159946) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336103 () Bool)

(declare-fun e!206301 () SeekEntryResult!3200)

(assert (=> b!336103 (= e!206301 (Found!3200 (index!14981 lt!159946)))))

(declare-fun b!336104 () Bool)

(assert (=> b!336104 (= e!206302 (MissingZero!3200 (index!14981 lt!159946)))))

(declare-fun b!336105 () Bool)

(declare-fun e!206300 () SeekEntryResult!3200)

(assert (=> b!336105 (= e!206300 Undefined!3200)))

(declare-fun b!336106 () Bool)

(assert (=> b!336106 (= e!206300 e!206301)))

(declare-fun lt!159948 () (_ BitVec 64))

(assert (=> b!336106 (= lt!159948 (select (arr!8273 _keys!1895) (index!14981 lt!159946)))))

(declare-fun c!52208 () Bool)

(assert (=> b!336106 (= c!52208 (= lt!159948 k0!1348))))

(declare-fun d!70501 () Bool)

(declare-fun lt!159947 () SeekEntryResult!3200)

(assert (=> d!70501 (and (or ((_ is Undefined!3200) lt!159947) (not ((_ is Found!3200) lt!159947)) (and (bvsge (index!14980 lt!159947) #b00000000000000000000000000000000) (bvslt (index!14980 lt!159947) (size!8626 _keys!1895)))) (or ((_ is Undefined!3200) lt!159947) ((_ is Found!3200) lt!159947) (not ((_ is MissingZero!3200) lt!159947)) (and (bvsge (index!14979 lt!159947) #b00000000000000000000000000000000) (bvslt (index!14979 lt!159947) (size!8626 _keys!1895)))) (or ((_ is Undefined!3200) lt!159947) ((_ is Found!3200) lt!159947) ((_ is MissingZero!3200) lt!159947) (not ((_ is MissingVacant!3200) lt!159947)) (and (bvsge (index!14982 lt!159947) #b00000000000000000000000000000000) (bvslt (index!14982 lt!159947) (size!8626 _keys!1895)))) (or ((_ is Undefined!3200) lt!159947) (ite ((_ is Found!3200) lt!159947) (= (select (arr!8273 _keys!1895) (index!14980 lt!159947)) k0!1348) (ite ((_ is MissingZero!3200) lt!159947) (= (select (arr!8273 _keys!1895) (index!14979 lt!159947)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3200) lt!159947) (= (select (arr!8273 _keys!1895) (index!14982 lt!159947)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70501 (= lt!159947 e!206300)))

(declare-fun c!52206 () Bool)

(assert (=> d!70501 (= c!52206 (and ((_ is Intermediate!3200) lt!159946) (undefined!4012 lt!159946)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17489 (_ BitVec 32)) SeekEntryResult!3200)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70501 (= lt!159946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70501 (validMask!0 mask!2385)))

(assert (=> d!70501 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!159947)))

(declare-fun b!336101 () Bool)

(declare-fun c!52207 () Bool)

(assert (=> b!336101 (= c!52207 (= lt!159948 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!336101 (= e!206301 e!206302)))

(assert (= (and d!70501 c!52206) b!336105))

(assert (= (and d!70501 (not c!52206)) b!336106))

(assert (= (and b!336106 c!52208) b!336103))

(assert (= (and b!336106 (not c!52208)) b!336101))

(assert (= (and b!336101 c!52207) b!336104))

(assert (= (and b!336101 (not c!52207)) b!336102))

(declare-fun m!339463 () Bool)

(assert (=> b!336102 m!339463))

(declare-fun m!339465 () Bool)

(assert (=> b!336106 m!339465))

(assert (=> d!70501 m!339395))

(declare-fun m!339467 () Bool)

(assert (=> d!70501 m!339467))

(declare-fun m!339469 () Bool)

(assert (=> d!70501 m!339469))

(declare-fun m!339471 () Bool)

(assert (=> d!70501 m!339471))

(declare-fun m!339473 () Bool)

(assert (=> d!70501 m!339473))

(declare-fun m!339475 () Bool)

(assert (=> d!70501 m!339475))

(assert (=> d!70501 m!339473))

(assert (=> b!335983 d!70501))

(declare-fun d!70503 () Bool)

(declare-fun e!206307 () Bool)

(assert (=> d!70503 e!206307))

(declare-fun res!185534 () Bool)

(assert (=> d!70503 (=> res!185534 e!206307)))

(declare-fun lt!159960 () Bool)

(assert (=> d!70503 (= res!185534 (not lt!159960))))

(declare-fun lt!159957 () Bool)

(assert (=> d!70503 (= lt!159960 lt!159957)))

(declare-fun lt!159958 () Unit!10442)

(declare-fun e!206308 () Unit!10442)

(assert (=> d!70503 (= lt!159958 e!206308)))

(declare-fun c!52211 () Bool)

(assert (=> d!70503 (= c!52211 lt!159957)))

(declare-fun containsKey!316 (List!4699 (_ BitVec 64)) Bool)

(assert (=> d!70503 (= lt!159957 (containsKey!316 (toList!1999 (getCurrentListMap!1505 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70503 (= (contains!2056 (getCurrentListMap!1505 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!159960)))

(declare-fun b!336113 () Bool)

(declare-fun lt!159959 () Unit!10442)

(assert (=> b!336113 (= e!206308 lt!159959)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!265 (List!4699 (_ BitVec 64)) Unit!10442)

(assert (=> b!336113 (= lt!159959 (lemmaContainsKeyImpliesGetValueByKeyDefined!265 (toList!1999 (getCurrentListMap!1505 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!330 0))(
  ( (Some!329 (v!5683 V!10251)) (None!328) )
))
(declare-fun isDefined!266 (Option!330) Bool)

(declare-fun getValueByKey!324 (List!4699 (_ BitVec 64)) Option!330)

(assert (=> b!336113 (isDefined!266 (getValueByKey!324 (toList!1999 (getCurrentListMap!1505 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!336114 () Bool)

(declare-fun Unit!10444 () Unit!10442)

(assert (=> b!336114 (= e!206308 Unit!10444)))

(declare-fun b!336115 () Bool)

(assert (=> b!336115 (= e!206307 (isDefined!266 (getValueByKey!324 (toList!1999 (getCurrentListMap!1505 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70503 c!52211) b!336113))

(assert (= (and d!70503 (not c!52211)) b!336114))

(assert (= (and d!70503 (not res!185534)) b!336115))

(declare-fun m!339477 () Bool)

(assert (=> d!70503 m!339477))

(declare-fun m!339479 () Bool)

(assert (=> b!336113 m!339479))

(declare-fun m!339481 () Bool)

(assert (=> b!336113 m!339481))

(assert (=> b!336113 m!339481))

(declare-fun m!339483 () Bool)

(assert (=> b!336113 m!339483))

(assert (=> b!336115 m!339481))

(assert (=> b!336115 m!339481))

(assert (=> b!336115 m!339483))

(assert (=> b!335987 d!70503))

(declare-fun b!336158 () Bool)

(declare-fun e!206342 () Bool)

(declare-fun call!26351 () Bool)

(assert (=> b!336158 (= e!206342 (not call!26351))))

(declare-fun b!336159 () Bool)

(declare-fun e!206345 () Bool)

(declare-fun e!206338 () Bool)

(assert (=> b!336159 (= e!206345 e!206338)))

(declare-fun res!185556 () Bool)

(declare-fun call!26346 () Bool)

(assert (=> b!336159 (= res!185556 call!26346)))

(assert (=> b!336159 (=> (not res!185556) (not e!206338))))

(declare-fun b!336160 () Bool)

(declare-fun res!185555 () Bool)

(declare-fun e!206347 () Bool)

(assert (=> b!336160 (=> (not res!185555) (not e!206347))))

(declare-fun e!206343 () Bool)

(assert (=> b!336160 (= res!185555 e!206343)))

(declare-fun res!185561 () Bool)

(assert (=> b!336160 (=> res!185561 e!206343)))

(declare-fun e!206336 () Bool)

(assert (=> b!336160 (= res!185561 (not e!206336))))

(declare-fun res!185557 () Bool)

(assert (=> b!336160 (=> (not res!185557) (not e!206336))))

(assert (=> b!336160 (= res!185557 (bvslt #b00000000000000000000000000000000 (size!8626 _keys!1895)))))

(declare-fun b!336161 () Bool)

(declare-fun e!206337 () ListLongMap!3967)

(declare-fun call!26347 () ListLongMap!3967)

(declare-fun +!721 (ListLongMap!3967 tuple2!5064) ListLongMap!3967)

(assert (=> b!336161 (= e!206337 (+!721 call!26347 (tuple2!5065 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26342 () Bool)

(declare-fun call!26345 () ListLongMap!3967)

(declare-fun call!26350 () ListLongMap!3967)

(assert (=> bm!26342 (= call!26345 call!26350)))

(declare-fun b!336162 () Bool)

(declare-fun c!52227 () Bool)

(assert (=> b!336162 (= c!52227 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!206341 () ListLongMap!3967)

(declare-fun e!206335 () ListLongMap!3967)

(assert (=> b!336162 (= e!206341 e!206335)))

(declare-fun b!336163 () Bool)

(declare-fun call!26349 () ListLongMap!3967)

(assert (=> b!336163 (= e!206341 call!26349)))

(declare-fun b!336164 () Bool)

(assert (=> b!336164 (= e!206345 (not call!26346))))

(declare-fun bm!26344 () Bool)

(declare-fun lt!160015 () ListLongMap!3967)

(assert (=> bm!26344 (= call!26351 (contains!2056 lt!160015 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!336165 () Bool)

(assert (=> b!336165 (= e!206335 call!26345)))

(declare-fun b!336166 () Bool)

(assert (=> b!336166 (= e!206347 e!206342)))

(declare-fun c!52226 () Bool)

(assert (=> b!336166 (= c!52226 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!336167 () Bool)

(declare-fun e!206346 () Unit!10442)

(declare-fun lt!160019 () Unit!10442)

(assert (=> b!336167 (= e!206346 lt!160019)))

(declare-fun lt!160013 () ListLongMap!3967)

(declare-fun getCurrentListMapNoExtraKeys!584 (array!17489 array!17487 (_ BitVec 32) (_ BitVec 32) V!10251 V!10251 (_ BitVec 32) Int) ListLongMap!3967)

(assert (=> b!336167 (= lt!160013 (getCurrentListMapNoExtraKeys!584 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160021 () (_ BitVec 64))

(assert (=> b!336167 (= lt!160021 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160022 () (_ BitVec 64))

(assert (=> b!336167 (= lt!160022 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160009 () Unit!10442)

(declare-fun addStillContains!244 (ListLongMap!3967 (_ BitVec 64) V!10251 (_ BitVec 64)) Unit!10442)

(assert (=> b!336167 (= lt!160009 (addStillContains!244 lt!160013 lt!160021 zeroValue!1467 lt!160022))))

(assert (=> b!336167 (contains!2056 (+!721 lt!160013 (tuple2!5065 lt!160021 zeroValue!1467)) lt!160022)))

(declare-fun lt!160025 () Unit!10442)

(assert (=> b!336167 (= lt!160025 lt!160009)))

(declare-fun lt!160017 () ListLongMap!3967)

(assert (=> b!336167 (= lt!160017 (getCurrentListMapNoExtraKeys!584 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160014 () (_ BitVec 64))

(assert (=> b!336167 (= lt!160014 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160006 () (_ BitVec 64))

(assert (=> b!336167 (= lt!160006 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160007 () Unit!10442)

(declare-fun addApplyDifferent!244 (ListLongMap!3967 (_ BitVec 64) V!10251 (_ BitVec 64)) Unit!10442)

(assert (=> b!336167 (= lt!160007 (addApplyDifferent!244 lt!160017 lt!160014 minValue!1467 lt!160006))))

(declare-fun apply!268 (ListLongMap!3967 (_ BitVec 64)) V!10251)

(assert (=> b!336167 (= (apply!268 (+!721 lt!160017 (tuple2!5065 lt!160014 minValue!1467)) lt!160006) (apply!268 lt!160017 lt!160006))))

(declare-fun lt!160005 () Unit!10442)

(assert (=> b!336167 (= lt!160005 lt!160007)))

(declare-fun lt!160010 () ListLongMap!3967)

(assert (=> b!336167 (= lt!160010 (getCurrentListMapNoExtraKeys!584 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160024 () (_ BitVec 64))

(assert (=> b!336167 (= lt!160024 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160018 () (_ BitVec 64))

(assert (=> b!336167 (= lt!160018 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160008 () Unit!10442)

(assert (=> b!336167 (= lt!160008 (addApplyDifferent!244 lt!160010 lt!160024 zeroValue!1467 lt!160018))))

(assert (=> b!336167 (= (apply!268 (+!721 lt!160010 (tuple2!5065 lt!160024 zeroValue!1467)) lt!160018) (apply!268 lt!160010 lt!160018))))

(declare-fun lt!160023 () Unit!10442)

(assert (=> b!336167 (= lt!160023 lt!160008)))

(declare-fun lt!160011 () ListLongMap!3967)

(assert (=> b!336167 (= lt!160011 (getCurrentListMapNoExtraKeys!584 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160016 () (_ BitVec 64))

(assert (=> b!336167 (= lt!160016 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160020 () (_ BitVec 64))

(assert (=> b!336167 (= lt!160020 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!336167 (= lt!160019 (addApplyDifferent!244 lt!160011 lt!160016 minValue!1467 lt!160020))))

(assert (=> b!336167 (= (apply!268 (+!721 lt!160011 (tuple2!5065 lt!160016 minValue!1467)) lt!160020) (apply!268 lt!160011 lt!160020))))

(declare-fun b!336168 () Bool)

(declare-fun e!206340 () Bool)

(assert (=> b!336168 (= e!206340 (validKeyInArray!0 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336169 () Bool)

(assert (=> b!336169 (= e!206338 (= (apply!268 lt!160015 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26345 () Bool)

(assert (=> bm!26345 (= call!26346 (contains!2056 lt!160015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!336170 () Bool)

(declare-fun e!206339 () Bool)

(assert (=> b!336170 (= e!206339 (= (apply!268 lt!160015 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!336171 () Bool)

(assert (=> b!336171 (= e!206342 e!206339)))

(declare-fun res!185554 () Bool)

(assert (=> b!336171 (= res!185554 call!26351)))

(assert (=> b!336171 (=> (not res!185554) (not e!206339))))

(declare-fun b!336172 () Bool)

(declare-fun res!185559 () Bool)

(assert (=> b!336172 (=> (not res!185559) (not e!206347))))

(assert (=> b!336172 (= res!185559 e!206345)))

(declare-fun c!52224 () Bool)

(assert (=> b!336172 (= c!52224 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!206344 () Bool)

(declare-fun b!336173 () Bool)

(declare-fun get!4526 (ValueCell!3134 V!10251) V!10251)

(declare-fun dynLambda!602 (Int (_ BitVec 64)) V!10251)

(assert (=> b!336173 (= e!206344 (= (apply!268 lt!160015 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)) (get!4526 (select (arr!8272 _values!1525) #b00000000000000000000000000000000) (dynLambda!602 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!336173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8625 _values!1525)))))

(assert (=> b!336173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8626 _keys!1895)))))

(declare-fun bm!26346 () Bool)

(declare-fun call!26348 () ListLongMap!3967)

(assert (=> bm!26346 (= call!26350 call!26348)))

(declare-fun b!336174 () Bool)

(assert (=> b!336174 (= e!206337 e!206341)))

(declare-fun c!52229 () Bool)

(assert (=> b!336174 (= c!52229 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!336175 () Bool)

(assert (=> b!336175 (= e!206336 (validKeyInArray!0 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26347 () Bool)

(assert (=> bm!26347 (= call!26348 (getCurrentListMapNoExtraKeys!584 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun c!52225 () Bool)

(declare-fun bm!26348 () Bool)

(assert (=> bm!26348 (= call!26347 (+!721 (ite c!52225 call!26348 (ite c!52229 call!26350 call!26345)) (ite (or c!52225 c!52229) (tuple2!5065 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5065 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!336176 () Bool)

(declare-fun Unit!10445 () Unit!10442)

(assert (=> b!336176 (= e!206346 Unit!10445)))

(declare-fun d!70505 () Bool)

(assert (=> d!70505 e!206347))

(declare-fun res!185560 () Bool)

(assert (=> d!70505 (=> (not res!185560) (not e!206347))))

(assert (=> d!70505 (= res!185560 (or (bvsge #b00000000000000000000000000000000 (size!8626 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8626 _keys!1895)))))))

(declare-fun lt!160012 () ListLongMap!3967)

(assert (=> d!70505 (= lt!160015 lt!160012)))

(declare-fun lt!160026 () Unit!10442)

(assert (=> d!70505 (= lt!160026 e!206346)))

(declare-fun c!52228 () Bool)

(assert (=> d!70505 (= c!52228 e!206340)))

(declare-fun res!185553 () Bool)

(assert (=> d!70505 (=> (not res!185553) (not e!206340))))

(assert (=> d!70505 (= res!185553 (bvslt #b00000000000000000000000000000000 (size!8626 _keys!1895)))))

(assert (=> d!70505 (= lt!160012 e!206337)))

(assert (=> d!70505 (= c!52225 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70505 (validMask!0 mask!2385)))

(assert (=> d!70505 (= (getCurrentListMap!1505 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160015)))

(declare-fun bm!26343 () Bool)

(assert (=> bm!26343 (= call!26349 call!26347)))

(declare-fun b!336177 () Bool)

(assert (=> b!336177 (= e!206335 call!26349)))

(declare-fun b!336178 () Bool)

(assert (=> b!336178 (= e!206343 e!206344)))

(declare-fun res!185558 () Bool)

(assert (=> b!336178 (=> (not res!185558) (not e!206344))))

(assert (=> b!336178 (= res!185558 (contains!2056 lt!160015 (select (arr!8273 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!336178 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8626 _keys!1895)))))

(assert (= (and d!70505 c!52225) b!336161))

(assert (= (and d!70505 (not c!52225)) b!336174))

(assert (= (and b!336174 c!52229) b!336163))

(assert (= (and b!336174 (not c!52229)) b!336162))

(assert (= (and b!336162 c!52227) b!336177))

(assert (= (and b!336162 (not c!52227)) b!336165))

(assert (= (or b!336177 b!336165) bm!26342))

(assert (= (or b!336163 bm!26342) bm!26346))

(assert (= (or b!336163 b!336177) bm!26343))

(assert (= (or b!336161 bm!26346) bm!26347))

(assert (= (or b!336161 bm!26343) bm!26348))

(assert (= (and d!70505 res!185553) b!336168))

(assert (= (and d!70505 c!52228) b!336167))

(assert (= (and d!70505 (not c!52228)) b!336176))

(assert (= (and d!70505 res!185560) b!336160))

(assert (= (and b!336160 res!185557) b!336175))

(assert (= (and b!336160 (not res!185561)) b!336178))

(assert (= (and b!336178 res!185558) b!336173))

(assert (= (and b!336160 res!185555) b!336172))

(assert (= (and b!336172 c!52224) b!336159))

(assert (= (and b!336172 (not c!52224)) b!336164))

(assert (= (and b!336159 res!185556) b!336169))

(assert (= (or b!336159 b!336164) bm!26345))

(assert (= (and b!336172 res!185559) b!336166))

(assert (= (and b!336166 c!52226) b!336171))

(assert (= (and b!336166 (not c!52226)) b!336158))

(assert (= (and b!336171 res!185554) b!336170))

(assert (= (or b!336171 b!336158) bm!26344))

(declare-fun b_lambda!8393 () Bool)

(assert (=> (not b_lambda!8393) (not b!336173)))

(declare-fun t!9787 () Bool)

(declare-fun tb!3043 () Bool)

(assert (=> (and start!33790 (= defaultEntry!1528 defaultEntry!1528) t!9787) tb!3043))

(declare-fun result!5475 () Bool)

(assert (=> tb!3043 (= result!5475 tp_is_empty!6955)))

(assert (=> b!336173 t!9787))

(declare-fun b_and!14167 () Bool)

(assert (= b_and!14161 (and (=> t!9787 result!5475) b_and!14167)))

(declare-fun m!339485 () Bool)

(assert (=> b!336161 m!339485))

(declare-fun m!339487 () Bool)

(assert (=> bm!26348 m!339487))

(declare-fun m!339489 () Bool)

(assert (=> b!336173 m!339489))

(assert (=> b!336173 m!339445))

(declare-fun m!339491 () Bool)

(assert (=> b!336173 m!339491))

(assert (=> b!336173 m!339489))

(declare-fun m!339493 () Bool)

(assert (=> b!336173 m!339493))

(declare-fun m!339495 () Bool)

(assert (=> b!336173 m!339495))

(assert (=> b!336173 m!339493))

(assert (=> b!336173 m!339445))

(declare-fun m!339497 () Bool)

(assert (=> bm!26345 m!339497))

(assert (=> b!336168 m!339445))

(assert (=> b!336168 m!339445))

(assert (=> b!336168 m!339447))

(declare-fun m!339499 () Bool)

(assert (=> bm!26344 m!339499))

(declare-fun m!339501 () Bool)

(assert (=> b!336170 m!339501))

(assert (=> b!336175 m!339445))

(assert (=> b!336175 m!339445))

(assert (=> b!336175 m!339447))

(declare-fun m!339503 () Bool)

(assert (=> bm!26347 m!339503))

(declare-fun m!339505 () Bool)

(assert (=> b!336167 m!339505))

(declare-fun m!339507 () Bool)

(assert (=> b!336167 m!339507))

(declare-fun m!339509 () Bool)

(assert (=> b!336167 m!339509))

(declare-fun m!339511 () Bool)

(assert (=> b!336167 m!339511))

(declare-fun m!339513 () Bool)

(assert (=> b!336167 m!339513))

(declare-fun m!339515 () Bool)

(assert (=> b!336167 m!339515))

(assert (=> b!336167 m!339445))

(declare-fun m!339517 () Bool)

(assert (=> b!336167 m!339517))

(declare-fun m!339519 () Bool)

(assert (=> b!336167 m!339519))

(declare-fun m!339521 () Bool)

(assert (=> b!336167 m!339521))

(declare-fun m!339523 () Bool)

(assert (=> b!336167 m!339523))

(declare-fun m!339525 () Bool)

(assert (=> b!336167 m!339525))

(assert (=> b!336167 m!339523))

(declare-fun m!339527 () Bool)

(assert (=> b!336167 m!339527))

(declare-fun m!339529 () Bool)

(assert (=> b!336167 m!339529))

(assert (=> b!336167 m!339517))

(assert (=> b!336167 m!339503))

(declare-fun m!339531 () Bool)

(assert (=> b!336167 m!339531))

(declare-fun m!339533 () Bool)

(assert (=> b!336167 m!339533))

(assert (=> b!336167 m!339527))

(assert (=> b!336167 m!339505))

(assert (=> b!336178 m!339445))

(assert (=> b!336178 m!339445))

(declare-fun m!339535 () Bool)

(assert (=> b!336178 m!339535))

(assert (=> d!70505 m!339395))

(declare-fun m!339537 () Bool)

(assert (=> b!336169 m!339537))

(assert (=> b!335987 d!70505))

(declare-fun condMapEmpty!11844 () Bool)

(declare-fun mapDefault!11844 () ValueCell!3134)

(assert (=> mapNonEmpty!11835 (= condMapEmpty!11844 (= mapRest!11835 ((as const (Array (_ BitVec 32) ValueCell!3134)) mapDefault!11844)))))

(declare-fun e!206352 () Bool)

(declare-fun mapRes!11844 () Bool)

(assert (=> mapNonEmpty!11835 (= tp!24518 (and e!206352 mapRes!11844))))

(declare-fun mapIsEmpty!11844 () Bool)

(assert (=> mapIsEmpty!11844 mapRes!11844))

(declare-fun b!336188 () Bool)

(assert (=> b!336188 (= e!206352 tp_is_empty!6955)))

(declare-fun b!336187 () Bool)

(declare-fun e!206353 () Bool)

(assert (=> b!336187 (= e!206353 tp_is_empty!6955)))

(declare-fun mapNonEmpty!11844 () Bool)

(declare-fun tp!24534 () Bool)

(assert (=> mapNonEmpty!11844 (= mapRes!11844 (and tp!24534 e!206353))))

(declare-fun mapValue!11844 () ValueCell!3134)

(declare-fun mapRest!11844 () (Array (_ BitVec 32) ValueCell!3134))

(declare-fun mapKey!11844 () (_ BitVec 32))

(assert (=> mapNonEmpty!11844 (= mapRest!11835 (store mapRest!11844 mapKey!11844 mapValue!11844))))

(assert (= (and mapNonEmpty!11835 condMapEmpty!11844) mapIsEmpty!11844))

(assert (= (and mapNonEmpty!11835 (not condMapEmpty!11844)) mapNonEmpty!11844))

(assert (= (and mapNonEmpty!11844 ((_ is ValueCellFull!3134) mapValue!11844)) b!336187))

(assert (= (and mapNonEmpty!11835 ((_ is ValueCellFull!3134) mapDefault!11844)) b!336188))

(declare-fun m!339539 () Bool)

(assert (=> mapNonEmpty!11844 m!339539))

(declare-fun b_lambda!8395 () Bool)

(assert (= b_lambda!8393 (or (and start!33790 b_free!7003) b_lambda!8395)))

(check-sat (not b!336113) (not b!336168) (not bm!26324) (not b!336170) (not b!336080) (not b!336175) (not bm!26347) (not b!336079) (not b!336067) (not mapNonEmpty!11844) (not b!336169) (not b!336173) (not b!336102) (not bm!26327) (not b!336115) (not d!70503) b_and!14167 (not b_next!7003) (not bm!26345) (not b!336178) (not d!70501) (not bm!26348) (not b!336066) (not b!336167) (not b_lambda!8395) (not b!336068) (not b!336088) (not b!336161) tp_is_empty!6955 (not bm!26344) (not d!70505))
(check-sat b_and!14167 (not b_next!7003))
