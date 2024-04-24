; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34616 () Bool)

(assert start!34616)

(declare-fun b_free!7477 () Bool)

(declare-fun b_next!7477 () Bool)

(assert (=> start!34616 (= b_free!7477 (not b_next!7477))))

(declare-fun tp!25989 () Bool)

(declare-fun b_and!14707 () Bool)

(assert (=> start!34616 (= tp!25989 b_and!14707)))

(declare-fun b!345985 () Bool)

(declare-fun e!212052 () Bool)

(declare-fun e!212057 () Bool)

(assert (=> b!345985 (= e!212052 e!212057)))

(declare-fun res!191405 () Bool)

(assert (=> b!345985 (=> (not res!191405) (not e!212057))))

(declare-datatypes ((SeekEntryResult!3320 0))(
  ( (MissingZero!3320 (index!15459 (_ BitVec 32))) (Found!3320 (index!15460 (_ BitVec 32))) (Intermediate!3320 (undefined!4132 Bool) (index!15461 (_ BitVec 32)) (x!34423 (_ BitVec 32))) (Undefined!3320) (MissingVacant!3320 (index!15462 (_ BitVec 32))) )
))
(declare-fun lt!163192 () SeekEntryResult!3320)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18442 0))(
  ( (array!18443 (arr!8733 (Array (_ BitVec 32) (_ BitVec 64))) (size!9085 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18442)

(get-info :version)

(assert (=> b!345985 (= res!191405 (and ((_ is Found!3320) lt!163192) (= (select (arr!8733 _keys!1895) (index!15460 lt!163192)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18442 (_ BitVec 32)) SeekEntryResult!3320)

(assert (=> b!345985 (= lt!163192 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12594 () Bool)

(declare-fun mapRes!12594 () Bool)

(assert (=> mapIsEmpty!12594 mapRes!12594))

(declare-fun b!345986 () Bool)

(declare-fun res!191407 () Bool)

(assert (=> b!345986 (=> (not res!191407) (not e!212052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18442 (_ BitVec 32)) Bool)

(assert (=> b!345986 (= res!191407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!191404 () Bool)

(assert (=> start!34616 (=> (not res!191404) (not e!212052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34616 (= res!191404 (validMask!0 mask!2385))))

(assert (=> start!34616 e!212052))

(assert (=> start!34616 true))

(declare-fun tp_is_empty!7429 () Bool)

(assert (=> start!34616 tp_is_empty!7429))

(assert (=> start!34616 tp!25989))

(declare-datatypes ((V!10883 0))(
  ( (V!10884 (val!3759 Int)) )
))
(declare-datatypes ((ValueCell!3371 0))(
  ( (ValueCellFull!3371 (v!5940 V!10883)) (EmptyCell!3371) )
))
(declare-datatypes ((array!18444 0))(
  ( (array!18445 (arr!8734 (Array (_ BitVec 32) ValueCell!3371)) (size!9086 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18444)

(declare-fun e!212053 () Bool)

(declare-fun array_inv!6454 (array!18444) Bool)

(assert (=> start!34616 (and (array_inv!6454 _values!1525) e!212053)))

(declare-fun array_inv!6455 (array!18442) Bool)

(assert (=> start!34616 (array_inv!6455 _keys!1895)))

(declare-fun b!345987 () Bool)

(declare-fun e!212054 () Bool)

(assert (=> b!345987 (= e!212054 tp_is_empty!7429)))

(declare-fun mapNonEmpty!12594 () Bool)

(declare-fun tp!25988 () Bool)

(declare-fun e!212055 () Bool)

(assert (=> mapNonEmpty!12594 (= mapRes!12594 (and tp!25988 e!212055))))

(declare-fun mapValue!12594 () ValueCell!3371)

(declare-fun mapRest!12594 () (Array (_ BitVec 32) ValueCell!3371))

(declare-fun mapKey!12594 () (_ BitVec 32))

(assert (=> mapNonEmpty!12594 (= (arr!8734 _values!1525) (store mapRest!12594 mapKey!12594 mapValue!12594))))

(declare-fun b!345988 () Bool)

(declare-fun res!191406 () Bool)

(assert (=> b!345988 (=> (not res!191406) (not e!212057))))

(declare-fun arrayContainsKey!0 (array!18442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345988 (= res!191406 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15460 lt!163192)))))

(declare-fun b!345989 () Bool)

(assert (=> b!345989 (= e!212055 tp_is_empty!7429)))

(declare-fun b!345990 () Bool)

(declare-fun res!191410 () Bool)

(assert (=> b!345990 (=> (not res!191410) (not e!212052))))

(declare-fun zeroValue!1467 () V!10883)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10883)

(declare-datatypes ((tuple2!5356 0))(
  ( (tuple2!5357 (_1!2689 (_ BitVec 64)) (_2!2689 V!10883)) )
))
(declare-datatypes ((List!4961 0))(
  ( (Nil!4958) (Cons!4957 (h!5813 tuple2!5356) (t!10077 List!4961)) )
))
(declare-datatypes ((ListLongMap!4271 0))(
  ( (ListLongMap!4272 (toList!2151 List!4961)) )
))
(declare-fun contains!2232 (ListLongMap!4271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1680 (array!18442 array!18444 (_ BitVec 32) (_ BitVec 32) V!10883 V!10883 (_ BitVec 32) Int) ListLongMap!4271)

(assert (=> b!345990 (= res!191410 (not (contains!2232 (getCurrentListMap!1680 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!345991 () Bool)

(declare-fun res!191409 () Bool)

(assert (=> b!345991 (=> (not res!191409) (not e!212052))))

(assert (=> b!345991 (= res!191409 (and (= (size!9086 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9085 _keys!1895) (size!9086 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345992 () Bool)

(assert (=> b!345992 (= e!212057 (and (bvsge (index!15460 lt!163192) #b00000000000000000000000000000000) (bvsge (index!15460 lt!163192) (size!9085 _keys!1895))))))

(declare-fun b!345993 () Bool)

(declare-fun res!191408 () Bool)

(assert (=> b!345993 (=> (not res!191408) (not e!212052))))

(declare-datatypes ((List!4962 0))(
  ( (Nil!4959) (Cons!4958 (h!5814 (_ BitVec 64)) (t!10078 List!4962)) )
))
(declare-fun arrayNoDuplicates!0 (array!18442 (_ BitVec 32) List!4962) Bool)

(assert (=> b!345993 (= res!191408 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4959))))

(declare-fun b!345994 () Bool)

(declare-fun res!191411 () Bool)

(assert (=> b!345994 (=> (not res!191411) (not e!212052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345994 (= res!191411 (validKeyInArray!0 k0!1348))))

(declare-fun b!345995 () Bool)

(assert (=> b!345995 (= e!212053 (and e!212054 mapRes!12594))))

(declare-fun condMapEmpty!12594 () Bool)

(declare-fun mapDefault!12594 () ValueCell!3371)

(assert (=> b!345995 (= condMapEmpty!12594 (= (arr!8734 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3371)) mapDefault!12594)))))

(assert (= (and start!34616 res!191404) b!345991))

(assert (= (and b!345991 res!191409) b!345986))

(assert (= (and b!345986 res!191407) b!345993))

(assert (= (and b!345993 res!191408) b!345994))

(assert (= (and b!345994 res!191411) b!345990))

(assert (= (and b!345990 res!191410) b!345985))

(assert (= (and b!345985 res!191405) b!345988))

(assert (= (and b!345988 res!191406) b!345992))

(assert (= (and b!345995 condMapEmpty!12594) mapIsEmpty!12594))

(assert (= (and b!345995 (not condMapEmpty!12594)) mapNonEmpty!12594))

(assert (= (and mapNonEmpty!12594 ((_ is ValueCellFull!3371) mapValue!12594)) b!345989))

(assert (= (and b!345995 ((_ is ValueCellFull!3371) mapDefault!12594)) b!345987))

(assert (= start!34616 b!345995))

(declare-fun m!347471 () Bool)

(assert (=> b!345988 m!347471))

(declare-fun m!347473 () Bool)

(assert (=> b!345993 m!347473))

(declare-fun m!347475 () Bool)

(assert (=> b!345990 m!347475))

(assert (=> b!345990 m!347475))

(declare-fun m!347477 () Bool)

(assert (=> b!345990 m!347477))

(declare-fun m!347479 () Bool)

(assert (=> b!345985 m!347479))

(declare-fun m!347481 () Bool)

(assert (=> b!345985 m!347481))

(declare-fun m!347483 () Bool)

(assert (=> start!34616 m!347483))

(declare-fun m!347485 () Bool)

(assert (=> start!34616 m!347485))

(declare-fun m!347487 () Bool)

(assert (=> start!34616 m!347487))

(declare-fun m!347489 () Bool)

(assert (=> b!345994 m!347489))

(declare-fun m!347491 () Bool)

(assert (=> mapNonEmpty!12594 m!347491))

(declare-fun m!347493 () Bool)

(assert (=> b!345986 m!347493))

(check-sat b_and!14707 (not b!345994) (not mapNonEmpty!12594) (not b!345985) (not b!345986) (not b!345993) (not b!345988) (not start!34616) tp_is_empty!7429 (not b_next!7477) (not b!345990))
(check-sat b_and!14707 (not b_next!7477))
(get-model)

(declare-fun b!346074 () Bool)

(declare-fun e!212100 () SeekEntryResult!3320)

(declare-fun lt!163206 () SeekEntryResult!3320)

(assert (=> b!346074 (= e!212100 (Found!3320 (index!15461 lt!163206)))))

(declare-fun e!212102 () SeekEntryResult!3320)

(declare-fun b!346075 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18442 (_ BitVec 32)) SeekEntryResult!3320)

(assert (=> b!346075 (= e!212102 (seekKeyOrZeroReturnVacant!0 (x!34423 lt!163206) (index!15461 lt!163206) (index!15461 lt!163206) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346076 () Bool)

(declare-fun e!212101 () SeekEntryResult!3320)

(assert (=> b!346076 (= e!212101 e!212100)))

(declare-fun lt!163207 () (_ BitVec 64))

(assert (=> b!346076 (= lt!163207 (select (arr!8733 _keys!1895) (index!15461 lt!163206)))))

(declare-fun c!53083 () Bool)

(assert (=> b!346076 (= c!53083 (= lt!163207 k0!1348))))

(declare-fun b!346077 () Bool)

(assert (=> b!346077 (= e!212102 (MissingZero!3320 (index!15461 lt!163206)))))

(declare-fun d!71231 () Bool)

(declare-fun lt!163205 () SeekEntryResult!3320)

(assert (=> d!71231 (and (or ((_ is Undefined!3320) lt!163205) (not ((_ is Found!3320) lt!163205)) (and (bvsge (index!15460 lt!163205) #b00000000000000000000000000000000) (bvslt (index!15460 lt!163205) (size!9085 _keys!1895)))) (or ((_ is Undefined!3320) lt!163205) ((_ is Found!3320) lt!163205) (not ((_ is MissingZero!3320) lt!163205)) (and (bvsge (index!15459 lt!163205) #b00000000000000000000000000000000) (bvslt (index!15459 lt!163205) (size!9085 _keys!1895)))) (or ((_ is Undefined!3320) lt!163205) ((_ is Found!3320) lt!163205) ((_ is MissingZero!3320) lt!163205) (not ((_ is MissingVacant!3320) lt!163205)) (and (bvsge (index!15462 lt!163205) #b00000000000000000000000000000000) (bvslt (index!15462 lt!163205) (size!9085 _keys!1895)))) (or ((_ is Undefined!3320) lt!163205) (ite ((_ is Found!3320) lt!163205) (= (select (arr!8733 _keys!1895) (index!15460 lt!163205)) k0!1348) (ite ((_ is MissingZero!3320) lt!163205) (= (select (arr!8733 _keys!1895) (index!15459 lt!163205)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3320) lt!163205) (= (select (arr!8733 _keys!1895) (index!15462 lt!163205)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71231 (= lt!163205 e!212101)))

(declare-fun c!53084 () Bool)

(assert (=> d!71231 (= c!53084 (and ((_ is Intermediate!3320) lt!163206) (undefined!4132 lt!163206)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18442 (_ BitVec 32)) SeekEntryResult!3320)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71231 (= lt!163206 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71231 (validMask!0 mask!2385)))

(assert (=> d!71231 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!163205)))

(declare-fun b!346078 () Bool)

(assert (=> b!346078 (= e!212101 Undefined!3320)))

(declare-fun b!346079 () Bool)

(declare-fun c!53082 () Bool)

(assert (=> b!346079 (= c!53082 (= lt!163207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!346079 (= e!212100 e!212102)))

(assert (= (and d!71231 c!53084) b!346078))

(assert (= (and d!71231 (not c!53084)) b!346076))

(assert (= (and b!346076 c!53083) b!346074))

(assert (= (and b!346076 (not c!53083)) b!346079))

(assert (= (and b!346079 c!53082) b!346077))

(assert (= (and b!346079 (not c!53082)) b!346075))

(declare-fun m!347543 () Bool)

(assert (=> b!346075 m!347543))

(declare-fun m!347545 () Bool)

(assert (=> b!346076 m!347545))

(assert (=> d!71231 m!347483))

(declare-fun m!347547 () Bool)

(assert (=> d!71231 m!347547))

(declare-fun m!347549 () Bool)

(assert (=> d!71231 m!347549))

(declare-fun m!347551 () Bool)

(assert (=> d!71231 m!347551))

(assert (=> d!71231 m!347547))

(declare-fun m!347553 () Bool)

(assert (=> d!71231 m!347553))

(declare-fun m!347555 () Bool)

(assert (=> d!71231 m!347555))

(assert (=> b!345985 d!71231))

(declare-fun d!71233 () Bool)

(declare-fun res!191464 () Bool)

(declare-fun e!212107 () Bool)

(assert (=> d!71233 (=> res!191464 e!212107)))

(assert (=> d!71233 (= res!191464 (= (select (arr!8733 _keys!1895) (index!15460 lt!163192)) k0!1348))))

(assert (=> d!71233 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15460 lt!163192)) e!212107)))

(declare-fun b!346084 () Bool)

(declare-fun e!212108 () Bool)

(assert (=> b!346084 (= e!212107 e!212108)))

(declare-fun res!191465 () Bool)

(assert (=> b!346084 (=> (not res!191465) (not e!212108))))

(assert (=> b!346084 (= res!191465 (bvslt (bvadd (index!15460 lt!163192) #b00000000000000000000000000000001) (size!9085 _keys!1895)))))

(declare-fun b!346085 () Bool)

(assert (=> b!346085 (= e!212108 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15460 lt!163192) #b00000000000000000000000000000001)))))

(assert (= (and d!71233 (not res!191464)) b!346084))

(assert (= (and b!346084 res!191465) b!346085))

(assert (=> d!71233 m!347479))

(declare-fun m!347557 () Bool)

(assert (=> b!346085 m!347557))

(assert (=> b!345988 d!71233))

(declare-fun b!346096 () Bool)

(declare-fun e!212118 () Bool)

(declare-fun call!26771 () Bool)

(assert (=> b!346096 (= e!212118 call!26771)))

(declare-fun bm!26768 () Bool)

(declare-fun c!53087 () Bool)

(assert (=> bm!26768 (= call!26771 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53087 (Cons!4958 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000) Nil!4959) Nil!4959)))))

(declare-fun b!346097 () Bool)

(declare-fun e!212117 () Bool)

(declare-fun contains!2234 (List!4962 (_ BitVec 64)) Bool)

(assert (=> b!346097 (= e!212117 (contains!2234 Nil!4959 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346098 () Bool)

(declare-fun e!212120 () Bool)

(assert (=> b!346098 (= e!212120 e!212118)))

(assert (=> b!346098 (= c!53087 (validKeyInArray!0 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71235 () Bool)

(declare-fun res!191472 () Bool)

(declare-fun e!212119 () Bool)

(assert (=> d!71235 (=> res!191472 e!212119)))

(assert (=> d!71235 (= res!191472 (bvsge #b00000000000000000000000000000000 (size!9085 _keys!1895)))))

(assert (=> d!71235 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4959) e!212119)))

(declare-fun b!346099 () Bool)

(assert (=> b!346099 (= e!212118 call!26771)))

(declare-fun b!346100 () Bool)

(assert (=> b!346100 (= e!212119 e!212120)))

(declare-fun res!191474 () Bool)

(assert (=> b!346100 (=> (not res!191474) (not e!212120))))

(assert (=> b!346100 (= res!191474 (not e!212117))))

(declare-fun res!191473 () Bool)

(assert (=> b!346100 (=> (not res!191473) (not e!212117))))

(assert (=> b!346100 (= res!191473 (validKeyInArray!0 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71235 (not res!191472)) b!346100))

(assert (= (and b!346100 res!191473) b!346097))

(assert (= (and b!346100 res!191474) b!346098))

(assert (= (and b!346098 c!53087) b!346099))

(assert (= (and b!346098 (not c!53087)) b!346096))

(assert (= (or b!346099 b!346096) bm!26768))

(declare-fun m!347559 () Bool)

(assert (=> bm!26768 m!347559))

(declare-fun m!347561 () Bool)

(assert (=> bm!26768 m!347561))

(assert (=> b!346097 m!347559))

(assert (=> b!346097 m!347559))

(declare-fun m!347563 () Bool)

(assert (=> b!346097 m!347563))

(assert (=> b!346098 m!347559))

(assert (=> b!346098 m!347559))

(declare-fun m!347565 () Bool)

(assert (=> b!346098 m!347565))

(assert (=> b!346100 m!347559))

(assert (=> b!346100 m!347559))

(assert (=> b!346100 m!347565))

(assert (=> b!345993 d!71235))

(declare-fun d!71237 () Bool)

(assert (=> d!71237 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34616 d!71237))

(declare-fun d!71239 () Bool)

(assert (=> d!71239 (= (array_inv!6454 _values!1525) (bvsge (size!9086 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34616 d!71239))

(declare-fun d!71241 () Bool)

(assert (=> d!71241 (= (array_inv!6455 _keys!1895) (bvsge (size!9085 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34616 d!71241))

(declare-fun d!71243 () Bool)

(declare-fun res!191479 () Bool)

(declare-fun e!212129 () Bool)

(assert (=> d!71243 (=> res!191479 e!212129)))

(assert (=> d!71243 (= res!191479 (bvsge #b00000000000000000000000000000000 (size!9085 _keys!1895)))))

(assert (=> d!71243 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!212129)))

(declare-fun bm!26771 () Bool)

(declare-fun call!26774 () Bool)

(assert (=> bm!26771 (= call!26774 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!346109 () Bool)

(declare-fun e!212127 () Bool)

(assert (=> b!346109 (= e!212127 call!26774)))

(declare-fun b!346110 () Bool)

(assert (=> b!346110 (= e!212129 e!212127)))

(declare-fun c!53090 () Bool)

(assert (=> b!346110 (= c!53090 (validKeyInArray!0 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346111 () Bool)

(declare-fun e!212128 () Bool)

(assert (=> b!346111 (= e!212128 call!26774)))

(declare-fun b!346112 () Bool)

(assert (=> b!346112 (= e!212127 e!212128)))

(declare-fun lt!163216 () (_ BitVec 64))

(assert (=> b!346112 (= lt!163216 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10713 0))(
  ( (Unit!10714) )
))
(declare-fun lt!163215 () Unit!10713)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18442 (_ BitVec 64) (_ BitVec 32)) Unit!10713)

(assert (=> b!346112 (= lt!163215 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163216 #b00000000000000000000000000000000))))

(assert (=> b!346112 (arrayContainsKey!0 _keys!1895 lt!163216 #b00000000000000000000000000000000)))

(declare-fun lt!163214 () Unit!10713)

(assert (=> b!346112 (= lt!163214 lt!163215)))

(declare-fun res!191480 () Bool)

(assert (=> b!346112 (= res!191480 (= (seekEntryOrOpen!0 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3320 #b00000000000000000000000000000000)))))

(assert (=> b!346112 (=> (not res!191480) (not e!212128))))

(assert (= (and d!71243 (not res!191479)) b!346110))

(assert (= (and b!346110 c!53090) b!346112))

(assert (= (and b!346110 (not c!53090)) b!346109))

(assert (= (and b!346112 res!191480) b!346111))

(assert (= (or b!346111 b!346109) bm!26771))

(declare-fun m!347567 () Bool)

(assert (=> bm!26771 m!347567))

(assert (=> b!346110 m!347559))

(assert (=> b!346110 m!347559))

(assert (=> b!346110 m!347565))

(assert (=> b!346112 m!347559))

(declare-fun m!347569 () Bool)

(assert (=> b!346112 m!347569))

(declare-fun m!347571 () Bool)

(assert (=> b!346112 m!347571))

(assert (=> b!346112 m!347559))

(declare-fun m!347573 () Bool)

(assert (=> b!346112 m!347573))

(assert (=> b!345986 d!71243))

(declare-fun d!71245 () Bool)

(declare-fun e!212135 () Bool)

(assert (=> d!71245 e!212135))

(declare-fun res!191483 () Bool)

(assert (=> d!71245 (=> res!191483 e!212135)))

(declare-fun lt!163225 () Bool)

(assert (=> d!71245 (= res!191483 (not lt!163225))))

(declare-fun lt!163226 () Bool)

(assert (=> d!71245 (= lt!163225 lt!163226)))

(declare-fun lt!163228 () Unit!10713)

(declare-fun e!212134 () Unit!10713)

(assert (=> d!71245 (= lt!163228 e!212134)))

(declare-fun c!53093 () Bool)

(assert (=> d!71245 (= c!53093 lt!163226)))

(declare-fun containsKey!334 (List!4961 (_ BitVec 64)) Bool)

(assert (=> d!71245 (= lt!163226 (containsKey!334 (toList!2151 (getCurrentListMap!1680 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71245 (= (contains!2232 (getCurrentListMap!1680 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!163225)))

(declare-fun b!346119 () Bool)

(declare-fun lt!163227 () Unit!10713)

(assert (=> b!346119 (= e!212134 lt!163227)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!282 (List!4961 (_ BitVec 64)) Unit!10713)

(assert (=> b!346119 (= lt!163227 (lemmaContainsKeyImpliesGetValueByKeyDefined!282 (toList!2151 (getCurrentListMap!1680 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!349 0))(
  ( (Some!348 (v!5943 V!10883)) (None!347) )
))
(declare-fun isDefined!283 (Option!349) Bool)

(declare-fun getValueByKey!343 (List!4961 (_ BitVec 64)) Option!349)

(assert (=> b!346119 (isDefined!283 (getValueByKey!343 (toList!2151 (getCurrentListMap!1680 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!346120 () Bool)

(declare-fun Unit!10715 () Unit!10713)

(assert (=> b!346120 (= e!212134 Unit!10715)))

(declare-fun b!346121 () Bool)

(assert (=> b!346121 (= e!212135 (isDefined!283 (getValueByKey!343 (toList!2151 (getCurrentListMap!1680 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71245 c!53093) b!346119))

(assert (= (and d!71245 (not c!53093)) b!346120))

(assert (= (and d!71245 (not res!191483)) b!346121))

(declare-fun m!347575 () Bool)

(assert (=> d!71245 m!347575))

(declare-fun m!347577 () Bool)

(assert (=> b!346119 m!347577))

(declare-fun m!347579 () Bool)

(assert (=> b!346119 m!347579))

(assert (=> b!346119 m!347579))

(declare-fun m!347581 () Bool)

(assert (=> b!346119 m!347581))

(assert (=> b!346121 m!347579))

(assert (=> b!346121 m!347579))

(assert (=> b!346121 m!347581))

(assert (=> b!345990 d!71245))

(declare-fun b!346164 () Bool)

(declare-fun e!212170 () Unit!10713)

(declare-fun lt!163294 () Unit!10713)

(assert (=> b!346164 (= e!212170 lt!163294)))

(declare-fun lt!163275 () ListLongMap!4271)

(declare-fun getCurrentListMapNoExtraKeys!600 (array!18442 array!18444 (_ BitVec 32) (_ BitVec 32) V!10883 V!10883 (_ BitVec 32) Int) ListLongMap!4271)

(assert (=> b!346164 (= lt!163275 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163279 () (_ BitVec 64))

(assert (=> b!346164 (= lt!163279 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163290 () (_ BitVec 64))

(assert (=> b!346164 (= lt!163290 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163293 () Unit!10713)

(declare-fun addStillContains!260 (ListLongMap!4271 (_ BitVec 64) V!10883 (_ BitVec 64)) Unit!10713)

(assert (=> b!346164 (= lt!163293 (addStillContains!260 lt!163275 lt!163279 zeroValue!1467 lt!163290))))

(declare-fun +!735 (ListLongMap!4271 tuple2!5356) ListLongMap!4271)

(assert (=> b!346164 (contains!2232 (+!735 lt!163275 (tuple2!5357 lt!163279 zeroValue!1467)) lt!163290)))

(declare-fun lt!163292 () Unit!10713)

(assert (=> b!346164 (= lt!163292 lt!163293)))

(declare-fun lt!163288 () ListLongMap!4271)

(assert (=> b!346164 (= lt!163288 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163277 () (_ BitVec 64))

(assert (=> b!346164 (= lt!163277 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163287 () (_ BitVec 64))

(assert (=> b!346164 (= lt!163287 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163274 () Unit!10713)

(declare-fun addApplyDifferent!260 (ListLongMap!4271 (_ BitVec 64) V!10883 (_ BitVec 64)) Unit!10713)

(assert (=> b!346164 (= lt!163274 (addApplyDifferent!260 lt!163288 lt!163277 minValue!1467 lt!163287))))

(declare-fun apply!284 (ListLongMap!4271 (_ BitVec 64)) V!10883)

(assert (=> b!346164 (= (apply!284 (+!735 lt!163288 (tuple2!5357 lt!163277 minValue!1467)) lt!163287) (apply!284 lt!163288 lt!163287))))

(declare-fun lt!163289 () Unit!10713)

(assert (=> b!346164 (= lt!163289 lt!163274)))

(declare-fun lt!163285 () ListLongMap!4271)

(assert (=> b!346164 (= lt!163285 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163284 () (_ BitVec 64))

(assert (=> b!346164 (= lt!163284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163278 () (_ BitVec 64))

(assert (=> b!346164 (= lt!163278 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163281 () Unit!10713)

(assert (=> b!346164 (= lt!163281 (addApplyDifferent!260 lt!163285 lt!163284 zeroValue!1467 lt!163278))))

(assert (=> b!346164 (= (apply!284 (+!735 lt!163285 (tuple2!5357 lt!163284 zeroValue!1467)) lt!163278) (apply!284 lt!163285 lt!163278))))

(declare-fun lt!163283 () Unit!10713)

(assert (=> b!346164 (= lt!163283 lt!163281)))

(declare-fun lt!163286 () ListLongMap!4271)

(assert (=> b!346164 (= lt!163286 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163273 () (_ BitVec 64))

(assert (=> b!346164 (= lt!163273 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163291 () (_ BitVec 64))

(assert (=> b!346164 (= lt!163291 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!346164 (= lt!163294 (addApplyDifferent!260 lt!163286 lt!163273 minValue!1467 lt!163291))))

(assert (=> b!346164 (= (apply!284 (+!735 lt!163286 (tuple2!5357 lt!163273 minValue!1467)) lt!163291) (apply!284 lt!163286 lt!163291))))

(declare-fun bm!26786 () Bool)

(declare-fun call!26795 () Bool)

(declare-fun lt!163276 () ListLongMap!4271)

(assert (=> bm!26786 (= call!26795 (contains!2232 lt!163276 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!346165 () Bool)

(declare-fun e!212164 () Bool)

(assert (=> b!346165 (= e!212164 (= (apply!284 lt!163276 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun d!71247 () Bool)

(declare-fun e!212173 () Bool)

(assert (=> d!71247 e!212173))

(declare-fun res!191506 () Bool)

(assert (=> d!71247 (=> (not res!191506) (not e!212173))))

(assert (=> d!71247 (= res!191506 (or (bvsge #b00000000000000000000000000000000 (size!9085 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9085 _keys!1895)))))))

(declare-fun lt!163280 () ListLongMap!4271)

(assert (=> d!71247 (= lt!163276 lt!163280)))

(declare-fun lt!163282 () Unit!10713)

(assert (=> d!71247 (= lt!163282 e!212170)))

(declare-fun c!53111 () Bool)

(declare-fun e!212166 () Bool)

(assert (=> d!71247 (= c!53111 e!212166)))

(declare-fun res!191510 () Bool)

(assert (=> d!71247 (=> (not res!191510) (not e!212166))))

(assert (=> d!71247 (= res!191510 (bvslt #b00000000000000000000000000000000 (size!9085 _keys!1895)))))

(declare-fun e!212168 () ListLongMap!4271)

(assert (=> d!71247 (= lt!163280 e!212168)))

(declare-fun c!53108 () Bool)

(assert (=> d!71247 (= c!53108 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71247 (validMask!0 mask!2385)))

(assert (=> d!71247 (= (getCurrentListMap!1680 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163276)))

(declare-fun b!346166 () Bool)

(declare-fun call!26790 () ListLongMap!4271)

(assert (=> b!346166 (= e!212168 (+!735 call!26790 (tuple2!5357 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26787 () Bool)

(declare-fun call!26793 () Bool)

(assert (=> bm!26787 (= call!26793 (contains!2232 lt!163276 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!346167 () Bool)

(declare-fun e!212172 () Bool)

(assert (=> b!346167 (= e!212173 e!212172)))

(declare-fun c!53106 () Bool)

(assert (=> b!346167 (= c!53106 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!346168 () Bool)

(declare-fun res!191504 () Bool)

(assert (=> b!346168 (=> (not res!191504) (not e!212173))))

(declare-fun e!212163 () Bool)

(assert (=> b!346168 (= res!191504 e!212163)))

(declare-fun res!191505 () Bool)

(assert (=> b!346168 (=> res!191505 e!212163)))

(declare-fun e!212165 () Bool)

(assert (=> b!346168 (= res!191505 (not e!212165))))

(declare-fun res!191508 () Bool)

(assert (=> b!346168 (=> (not res!191508) (not e!212165))))

(assert (=> b!346168 (= res!191508 (bvslt #b00000000000000000000000000000000 (size!9085 _keys!1895)))))

(declare-fun b!346169 () Bool)

(declare-fun Unit!10716 () Unit!10713)

(assert (=> b!346169 (= e!212170 Unit!10716)))

(declare-fun b!346170 () Bool)

(assert (=> b!346170 (= e!212165 (validKeyInArray!0 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346171 () Bool)

(declare-fun e!212171 () ListLongMap!4271)

(declare-fun call!26792 () ListLongMap!4271)

(assert (=> b!346171 (= e!212171 call!26792)))

(declare-fun b!346172 () Bool)

(declare-fun e!212167 () Bool)

(assert (=> b!346172 (= e!212167 (not call!26793))))

(declare-fun b!346173 () Bool)

(declare-fun e!212174 () Bool)

(assert (=> b!346173 (= e!212167 e!212174)))

(declare-fun res!191507 () Bool)

(assert (=> b!346173 (= res!191507 call!26793)))

(assert (=> b!346173 (=> (not res!191507) (not e!212174))))

(declare-fun b!346174 () Bool)

(assert (=> b!346174 (= e!212166 (validKeyInArray!0 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346175 () Bool)

(declare-fun e!212169 () Bool)

(assert (=> b!346175 (= e!212163 e!212169)))

(declare-fun res!191502 () Bool)

(assert (=> b!346175 (=> (not res!191502) (not e!212169))))

(assert (=> b!346175 (= res!191502 (contains!2232 lt!163276 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!346175 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9085 _keys!1895)))))

(declare-fun b!346176 () Bool)

(declare-fun res!191503 () Bool)

(assert (=> b!346176 (=> (not res!191503) (not e!212173))))

(assert (=> b!346176 (= res!191503 e!212167)))

(declare-fun c!53107 () Bool)

(assert (=> b!346176 (= c!53107 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!26788 () Bool)

(declare-fun call!26794 () ListLongMap!4271)

(declare-fun call!26791 () ListLongMap!4271)

(assert (=> bm!26788 (= call!26794 call!26791)))

(declare-fun b!346177 () Bool)

(assert (=> b!346177 (= e!212174 (= (apply!284 lt!163276 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun c!53109 () Bool)

(declare-fun bm!26789 () Bool)

(declare-fun call!26789 () ListLongMap!4271)

(assert (=> bm!26789 (= call!26790 (+!735 (ite c!53108 call!26789 (ite c!53109 call!26791 call!26794)) (ite (or c!53108 c!53109) (tuple2!5357 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5357 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!346178 () Bool)

(declare-fun e!212162 () ListLongMap!4271)

(assert (=> b!346178 (= e!212168 e!212162)))

(assert (=> b!346178 (= c!53109 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!346179 () Bool)

(declare-fun get!4712 (ValueCell!3371 V!10883) V!10883)

(declare-fun dynLambda!627 (Int (_ BitVec 64)) V!10883)

(assert (=> b!346179 (= e!212169 (= (apply!284 lt!163276 (select (arr!8733 _keys!1895) #b00000000000000000000000000000000)) (get!4712 (select (arr!8734 _values!1525) #b00000000000000000000000000000000) (dynLambda!627 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!346179 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9086 _values!1525)))))

(assert (=> b!346179 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9085 _keys!1895)))))

(declare-fun bm!26790 () Bool)

(assert (=> bm!26790 (= call!26792 call!26790)))

(declare-fun b!346180 () Bool)

(assert (=> b!346180 (= e!212172 (not call!26795))))

(declare-fun b!346181 () Bool)

(assert (=> b!346181 (= e!212172 e!212164)))

(declare-fun res!191509 () Bool)

(assert (=> b!346181 (= res!191509 call!26795)))

(assert (=> b!346181 (=> (not res!191509) (not e!212164))))

(declare-fun b!346182 () Bool)

(declare-fun c!53110 () Bool)

(assert (=> b!346182 (= c!53110 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!346182 (= e!212162 e!212171)))

(declare-fun b!346183 () Bool)

(assert (=> b!346183 (= e!212162 call!26792)))

(declare-fun bm!26791 () Bool)

(assert (=> bm!26791 (= call!26789 (getCurrentListMapNoExtraKeys!600 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26792 () Bool)

(assert (=> bm!26792 (= call!26791 call!26789)))

(declare-fun b!346184 () Bool)

(assert (=> b!346184 (= e!212171 call!26794)))

(assert (= (and d!71247 c!53108) b!346166))

(assert (= (and d!71247 (not c!53108)) b!346178))

(assert (= (and b!346178 c!53109) b!346183))

(assert (= (and b!346178 (not c!53109)) b!346182))

(assert (= (and b!346182 c!53110) b!346171))

(assert (= (and b!346182 (not c!53110)) b!346184))

(assert (= (or b!346171 b!346184) bm!26788))

(assert (= (or b!346183 bm!26788) bm!26792))

(assert (= (or b!346183 b!346171) bm!26790))

(assert (= (or b!346166 bm!26792) bm!26791))

(assert (= (or b!346166 bm!26790) bm!26789))

(assert (= (and d!71247 res!191510) b!346174))

(assert (= (and d!71247 c!53111) b!346164))

(assert (= (and d!71247 (not c!53111)) b!346169))

(assert (= (and d!71247 res!191506) b!346168))

(assert (= (and b!346168 res!191508) b!346170))

(assert (= (and b!346168 (not res!191505)) b!346175))

(assert (= (and b!346175 res!191502) b!346179))

(assert (= (and b!346168 res!191504) b!346176))

(assert (= (and b!346176 c!53107) b!346173))

(assert (= (and b!346176 (not c!53107)) b!346172))

(assert (= (and b!346173 res!191507) b!346177))

(assert (= (or b!346173 b!346172) bm!26787))

(assert (= (and b!346176 res!191503) b!346167))

(assert (= (and b!346167 c!53106) b!346181))

(assert (= (and b!346167 (not c!53106)) b!346180))

(assert (= (and b!346181 res!191509) b!346165))

(assert (= (or b!346181 b!346180) bm!26786))

(declare-fun b_lambda!8497 () Bool)

(assert (=> (not b_lambda!8497) (not b!346179)))

(declare-fun t!10083 () Bool)

(declare-fun tb!3075 () Bool)

(assert (=> (and start!34616 (= defaultEntry!1528 defaultEntry!1528) t!10083) tb!3075))

(declare-fun result!5571 () Bool)

(assert (=> tb!3075 (= result!5571 tp_is_empty!7429)))

(assert (=> b!346179 t!10083))

(declare-fun b_and!14713 () Bool)

(assert (= b_and!14707 (and (=> t!10083 result!5571) b_and!14713)))

(assert (=> b!346174 m!347559))

(assert (=> b!346174 m!347559))

(assert (=> b!346174 m!347565))

(declare-fun m!347583 () Bool)

(assert (=> b!346166 m!347583))

(declare-fun m!347585 () Bool)

(assert (=> b!346164 m!347585))

(declare-fun m!347587 () Bool)

(assert (=> b!346164 m!347587))

(declare-fun m!347589 () Bool)

(assert (=> b!346164 m!347589))

(declare-fun m!347591 () Bool)

(assert (=> b!346164 m!347591))

(declare-fun m!347593 () Bool)

(assert (=> b!346164 m!347593))

(declare-fun m!347595 () Bool)

(assert (=> b!346164 m!347595))

(declare-fun m!347597 () Bool)

(assert (=> b!346164 m!347597))

(declare-fun m!347599 () Bool)

(assert (=> b!346164 m!347599))

(assert (=> b!346164 m!347595))

(declare-fun m!347601 () Bool)

(assert (=> b!346164 m!347601))

(declare-fun m!347603 () Bool)

(assert (=> b!346164 m!347603))

(declare-fun m!347605 () Bool)

(assert (=> b!346164 m!347605))

(assert (=> b!346164 m!347601))

(declare-fun m!347607 () Bool)

(assert (=> b!346164 m!347607))

(assert (=> b!346164 m!347587))

(declare-fun m!347609 () Bool)

(assert (=> b!346164 m!347609))

(assert (=> b!346164 m!347599))

(declare-fun m!347611 () Bool)

(assert (=> b!346164 m!347611))

(declare-fun m!347613 () Bool)

(assert (=> b!346164 m!347613))

(declare-fun m!347615 () Bool)

(assert (=> b!346164 m!347615))

(assert (=> b!346164 m!347559))

(declare-fun m!347617 () Bool)

(assert (=> bm!26787 m!347617))

(assert (=> b!346170 m!347559))

(assert (=> b!346170 m!347559))

(assert (=> b!346170 m!347565))

(declare-fun m!347619 () Bool)

(assert (=> b!346165 m!347619))

(declare-fun m!347621 () Bool)

(assert (=> b!346177 m!347621))

(declare-fun m!347623 () Bool)

(assert (=> bm!26786 m!347623))

(assert (=> bm!26791 m!347593))

(declare-fun m!347625 () Bool)

(assert (=> bm!26789 m!347625))

(declare-fun m!347627 () Bool)

(assert (=> b!346179 m!347627))

(declare-fun m!347629 () Bool)

(assert (=> b!346179 m!347629))

(declare-fun m!347631 () Bool)

(assert (=> b!346179 m!347631))

(assert (=> b!346179 m!347559))

(declare-fun m!347633 () Bool)

(assert (=> b!346179 m!347633))

(assert (=> b!346179 m!347627))

(assert (=> b!346179 m!347629))

(assert (=> b!346179 m!347559))

(assert (=> b!346175 m!347559))

(assert (=> b!346175 m!347559))

(declare-fun m!347635 () Bool)

(assert (=> b!346175 m!347635))

(assert (=> d!71247 m!347483))

(assert (=> b!345990 d!71247))

(declare-fun d!71249 () Bool)

(assert (=> d!71249 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345994 d!71249))

(declare-fun mapIsEmpty!12603 () Bool)

(declare-fun mapRes!12603 () Bool)

(assert (=> mapIsEmpty!12603 mapRes!12603))

(declare-fun condMapEmpty!12603 () Bool)

(declare-fun mapDefault!12603 () ValueCell!3371)

(assert (=> mapNonEmpty!12594 (= condMapEmpty!12603 (= mapRest!12594 ((as const (Array (_ BitVec 32) ValueCell!3371)) mapDefault!12603)))))

(declare-fun e!212180 () Bool)

(assert (=> mapNonEmpty!12594 (= tp!25988 (and e!212180 mapRes!12603))))

(declare-fun b!346193 () Bool)

(declare-fun e!212179 () Bool)

(assert (=> b!346193 (= e!212179 tp_is_empty!7429)))

(declare-fun mapNonEmpty!12603 () Bool)

(declare-fun tp!26004 () Bool)

(assert (=> mapNonEmpty!12603 (= mapRes!12603 (and tp!26004 e!212179))))

(declare-fun mapRest!12603 () (Array (_ BitVec 32) ValueCell!3371))

(declare-fun mapKey!12603 () (_ BitVec 32))

(declare-fun mapValue!12603 () ValueCell!3371)

(assert (=> mapNonEmpty!12603 (= mapRest!12594 (store mapRest!12603 mapKey!12603 mapValue!12603))))

(declare-fun b!346194 () Bool)

(assert (=> b!346194 (= e!212180 tp_is_empty!7429)))

(assert (= (and mapNonEmpty!12594 condMapEmpty!12603) mapIsEmpty!12603))

(assert (= (and mapNonEmpty!12594 (not condMapEmpty!12603)) mapNonEmpty!12603))

(assert (= (and mapNonEmpty!12603 ((_ is ValueCellFull!3371) mapValue!12603)) b!346193))

(assert (= (and mapNonEmpty!12594 ((_ is ValueCellFull!3371) mapDefault!12603)) b!346194))

(declare-fun m!347637 () Bool)

(assert (=> mapNonEmpty!12603 m!347637))

(declare-fun b_lambda!8499 () Bool)

(assert (= b_lambda!8497 (or (and start!34616 b_free!7477) b_lambda!8499)))

(check-sat (not b!346165) (not b!346121) (not b!346174) (not b!346175) (not b!346098) (not b!346170) (not bm!26787) (not b!346119) (not b!346100) (not bm!26786) (not b!346085) (not bm!26771) (not mapNonEmpty!12603) (not d!71245) (not b!346075) b_and!14713 (not b!346112) (not b!346177) (not d!71247) (not b!346097) (not b!346166) (not bm!26768) (not bm!26789) (not b!346110) tp_is_empty!7429 (not b!346179) (not b_next!7477) (not d!71231) (not b_lambda!8499) (not bm!26791) (not b!346164))
(check-sat b_and!14713 (not b_next!7477))
