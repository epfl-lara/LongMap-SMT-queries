; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34254 () Bool)

(assert start!34254)

(declare-fun b_free!7267 () Bool)

(declare-fun b_next!7267 () Bool)

(assert (=> start!34254 (= b_free!7267 (not b_next!7267))))

(declare-fun tp!25338 () Bool)

(declare-fun b_and!14483 () Bool)

(assert (=> start!34254 (= tp!25338 b_and!14483)))

(declare-fun b!341855 () Bool)

(declare-fun res!189006 () Bool)

(declare-fun e!209639 () Bool)

(assert (=> b!341855 (=> (not res!189006) (not e!209639))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10603 0))(
  ( (V!10604 (val!3654 Int)) )
))
(declare-fun zeroValue!1467 () V!10603)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3266 0))(
  ( (ValueCellFull!3266 (v!5828 V!10603)) (EmptyCell!3266) )
))
(declare-datatypes ((array!18024 0))(
  ( (array!18025 (arr!8531 (Array (_ BitVec 32) ValueCell!3266)) (size!8883 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18024)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10603)

(declare-datatypes ((array!18026 0))(
  ( (array!18027 (arr!8532 (Array (_ BitVec 32) (_ BitVec 64))) (size!8884 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18026)

(declare-datatypes ((tuple2!5212 0))(
  ( (tuple2!5213 (_1!2617 (_ BitVec 64)) (_2!2617 V!10603)) )
))
(declare-datatypes ((List!4815 0))(
  ( (Nil!4812) (Cons!4811 (h!5667 tuple2!5212) (t!9917 List!4815)) )
))
(declare-datatypes ((ListLongMap!4127 0))(
  ( (ListLongMap!4128 (toList!2079 List!4815)) )
))
(declare-fun contains!2153 (ListLongMap!4127 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1608 (array!18026 array!18024 (_ BitVec 32) (_ BitVec 32) V!10603 V!10603 (_ BitVec 32) Int) ListLongMap!4127)

(assert (=> b!341855 (= res!189006 (not (contains!2153 (getCurrentListMap!1608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!189005 () Bool)

(assert (=> start!34254 (=> (not res!189005) (not e!209639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34254 (= res!189005 (validMask!0 mask!2385))))

(assert (=> start!34254 e!209639))

(assert (=> start!34254 true))

(declare-fun tp_is_empty!7219 () Bool)

(assert (=> start!34254 tp_is_empty!7219))

(assert (=> start!34254 tp!25338))

(declare-fun e!209644 () Bool)

(declare-fun array_inv!6314 (array!18024) Bool)

(assert (=> start!34254 (and (array_inv!6314 _values!1525) e!209644)))

(declare-fun array_inv!6315 (array!18026) Bool)

(assert (=> start!34254 (array_inv!6315 _keys!1895)))

(declare-fun b!341856 () Bool)

(declare-fun e!209641 () Bool)

(assert (=> b!341856 (= e!209641 tp_is_empty!7219)))

(declare-fun b!341857 () Bool)

(declare-datatypes ((Unit!10594 0))(
  ( (Unit!10595) )
))
(declare-fun e!209645 () Unit!10594)

(declare-fun Unit!10596 () Unit!10594)

(assert (=> b!341857 (= e!209645 Unit!10596)))

(declare-fun b!341858 () Bool)

(declare-fun mapRes!12258 () Bool)

(assert (=> b!341858 (= e!209644 (and e!209641 mapRes!12258))))

(declare-fun condMapEmpty!12258 () Bool)

(declare-fun mapDefault!12258 () ValueCell!3266)

(assert (=> b!341858 (= condMapEmpty!12258 (= (arr!8531 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3266)) mapDefault!12258)))))

(declare-fun b!341859 () Bool)

(declare-fun res!189010 () Bool)

(assert (=> b!341859 (=> (not res!189010) (not e!209639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341859 (= res!189010 (validKeyInArray!0 k0!1348))))

(declare-fun b!341860 () Bool)

(declare-fun res!189011 () Bool)

(assert (=> b!341860 (=> (not res!189011) (not e!209639))))

(assert (=> b!341860 (= res!189011 (and (= (size!8883 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8884 _keys!1895) (size!8883 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341861 () Bool)

(declare-fun res!189007 () Bool)

(assert (=> b!341861 (=> (not res!189007) (not e!209639))))

(declare-datatypes ((List!4816 0))(
  ( (Nil!4813) (Cons!4812 (h!5668 (_ BitVec 64)) (t!9918 List!4816)) )
))
(declare-fun arrayNoDuplicates!0 (array!18026 (_ BitVec 32) List!4816) Bool)

(assert (=> b!341861 (= res!189007 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4813))))

(declare-fun b!341862 () Bool)

(declare-fun e!209643 () Bool)

(assert (=> b!341862 (= e!209639 e!209643)))

(declare-fun res!189009 () Bool)

(assert (=> b!341862 (=> (not res!189009) (not e!209643))))

(declare-datatypes ((SeekEntryResult!3248 0))(
  ( (MissingZero!3248 (index!15171 (_ BitVec 32))) (Found!3248 (index!15172 (_ BitVec 32))) (Intermediate!3248 (undefined!4060 Bool) (index!15173 (_ BitVec 32)) (x!34001 (_ BitVec 32))) (Undefined!3248) (MissingVacant!3248 (index!15174 (_ BitVec 32))) )
))
(declare-fun lt!161967 () SeekEntryResult!3248)

(get-info :version)

(assert (=> b!341862 (= res!189009 (and (not ((_ is Found!3248) lt!161967)) (not ((_ is MissingZero!3248) lt!161967)) ((_ is MissingVacant!3248) lt!161967)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18026 (_ BitVec 32)) SeekEntryResult!3248)

(assert (=> b!341862 (= lt!161967 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341863 () Bool)

(assert (=> b!341863 (= e!209643 (and (bvslt #b00000000000000000000000000000000 (size!8884 _keys!1895)) (bvsge (size!8884 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun lt!161966 () Unit!10594)

(assert (=> b!341863 (= lt!161966 e!209645)))

(declare-fun c!52718 () Bool)

(declare-fun arrayContainsKey!0 (array!18026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341863 (= c!52718 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12258 () Bool)

(assert (=> mapIsEmpty!12258 mapRes!12258))

(declare-fun mapNonEmpty!12258 () Bool)

(declare-fun tp!25337 () Bool)

(declare-fun e!209642 () Bool)

(assert (=> mapNonEmpty!12258 (= mapRes!12258 (and tp!25337 e!209642))))

(declare-fun mapRest!12258 () (Array (_ BitVec 32) ValueCell!3266))

(declare-fun mapKey!12258 () (_ BitVec 32))

(declare-fun mapValue!12258 () ValueCell!3266)

(assert (=> mapNonEmpty!12258 (= (arr!8531 _values!1525) (store mapRest!12258 mapKey!12258 mapValue!12258))))

(declare-fun b!341864 () Bool)

(declare-fun Unit!10597 () Unit!10594)

(assert (=> b!341864 (= e!209645 Unit!10597)))

(declare-fun lt!161968 () Unit!10594)

(declare-fun lemmaArrayContainsKeyThenInListMap!301 (array!18026 array!18024 (_ BitVec 32) (_ BitVec 32) V!10603 V!10603 (_ BitVec 64) (_ BitVec 32) Int) Unit!10594)

(declare-fun arrayScanForKey!0 (array!18026 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341864 (= lt!161968 (lemmaArrayContainsKeyThenInListMap!301 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!341864 false))

(declare-fun b!341865 () Bool)

(declare-fun res!189008 () Bool)

(assert (=> b!341865 (=> (not res!189008) (not e!209639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18026 (_ BitVec 32)) Bool)

(assert (=> b!341865 (= res!189008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341866 () Bool)

(assert (=> b!341866 (= e!209642 tp_is_empty!7219)))

(assert (= (and start!34254 res!189005) b!341860))

(assert (= (and b!341860 res!189011) b!341865))

(assert (= (and b!341865 res!189008) b!341861))

(assert (= (and b!341861 res!189007) b!341859))

(assert (= (and b!341859 res!189010) b!341855))

(assert (= (and b!341855 res!189006) b!341862))

(assert (= (and b!341862 res!189009) b!341863))

(assert (= (and b!341863 c!52718) b!341864))

(assert (= (and b!341863 (not c!52718)) b!341857))

(assert (= (and b!341858 condMapEmpty!12258) mapIsEmpty!12258))

(assert (= (and b!341858 (not condMapEmpty!12258)) mapNonEmpty!12258))

(assert (= (and mapNonEmpty!12258 ((_ is ValueCellFull!3266) mapValue!12258)) b!341866))

(assert (= (and b!341858 ((_ is ValueCellFull!3266) mapDefault!12258)) b!341856))

(assert (= start!34254 b!341858))

(declare-fun m!344433 () Bool)

(assert (=> b!341861 m!344433))

(declare-fun m!344435 () Bool)

(assert (=> start!34254 m!344435))

(declare-fun m!344437 () Bool)

(assert (=> start!34254 m!344437))

(declare-fun m!344439 () Bool)

(assert (=> start!34254 m!344439))

(declare-fun m!344441 () Bool)

(assert (=> mapNonEmpty!12258 m!344441))

(declare-fun m!344443 () Bool)

(assert (=> b!341864 m!344443))

(assert (=> b!341864 m!344443))

(declare-fun m!344445 () Bool)

(assert (=> b!341864 m!344445))

(declare-fun m!344447 () Bool)

(assert (=> b!341855 m!344447))

(assert (=> b!341855 m!344447))

(declare-fun m!344449 () Bool)

(assert (=> b!341855 m!344449))

(declare-fun m!344451 () Bool)

(assert (=> b!341862 m!344451))

(declare-fun m!344453 () Bool)

(assert (=> b!341859 m!344453))

(declare-fun m!344455 () Bool)

(assert (=> b!341863 m!344455))

(declare-fun m!344457 () Bool)

(assert (=> b!341865 m!344457))

(check-sat (not b_next!7267) (not b!341865) (not start!34254) (not b!341863) (not b!341864) (not mapNonEmpty!12258) (not b!341861) (not b!341859) tp_is_empty!7219 (not b!341855) b_and!14483 (not b!341862))
(check-sat b_and!14483 (not b_next!7267))
(get-model)

(declare-fun b!341951 () Bool)

(declare-fun e!209695 () SeekEntryResult!3248)

(declare-fun lt!161995 () SeekEntryResult!3248)

(assert (=> b!341951 (= e!209695 (MissingZero!3248 (index!15173 lt!161995)))))

(declare-fun d!71009 () Bool)

(declare-fun lt!161993 () SeekEntryResult!3248)

(assert (=> d!71009 (and (or ((_ is Undefined!3248) lt!161993) (not ((_ is Found!3248) lt!161993)) (and (bvsge (index!15172 lt!161993) #b00000000000000000000000000000000) (bvslt (index!15172 lt!161993) (size!8884 _keys!1895)))) (or ((_ is Undefined!3248) lt!161993) ((_ is Found!3248) lt!161993) (not ((_ is MissingZero!3248) lt!161993)) (and (bvsge (index!15171 lt!161993) #b00000000000000000000000000000000) (bvslt (index!15171 lt!161993) (size!8884 _keys!1895)))) (or ((_ is Undefined!3248) lt!161993) ((_ is Found!3248) lt!161993) ((_ is MissingZero!3248) lt!161993) (not ((_ is MissingVacant!3248) lt!161993)) (and (bvsge (index!15174 lt!161993) #b00000000000000000000000000000000) (bvslt (index!15174 lt!161993) (size!8884 _keys!1895)))) (or ((_ is Undefined!3248) lt!161993) (ite ((_ is Found!3248) lt!161993) (= (select (arr!8532 _keys!1895) (index!15172 lt!161993)) k0!1348) (ite ((_ is MissingZero!3248) lt!161993) (= (select (arr!8532 _keys!1895) (index!15171 lt!161993)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3248) lt!161993) (= (select (arr!8532 _keys!1895) (index!15174 lt!161993)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!209694 () SeekEntryResult!3248)

(assert (=> d!71009 (= lt!161993 e!209694)))

(declare-fun c!52731 () Bool)

(assert (=> d!71009 (= c!52731 (and ((_ is Intermediate!3248) lt!161995) (undefined!4060 lt!161995)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18026 (_ BitVec 32)) SeekEntryResult!3248)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71009 (= lt!161995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71009 (validMask!0 mask!2385)))

(assert (=> d!71009 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161993)))

(declare-fun b!341952 () Bool)

(assert (=> b!341952 (= e!209694 Undefined!3248)))

(declare-fun b!341953 () Bool)

(declare-fun e!209696 () SeekEntryResult!3248)

(assert (=> b!341953 (= e!209696 (Found!3248 (index!15173 lt!161995)))))

(declare-fun b!341954 () Bool)

(assert (=> b!341954 (= e!209694 e!209696)))

(declare-fun lt!161994 () (_ BitVec 64))

(assert (=> b!341954 (= lt!161994 (select (arr!8532 _keys!1895) (index!15173 lt!161995)))))

(declare-fun c!52733 () Bool)

(assert (=> b!341954 (= c!52733 (= lt!161994 k0!1348))))

(declare-fun b!341955 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18026 (_ BitVec 32)) SeekEntryResult!3248)

(assert (=> b!341955 (= e!209695 (seekKeyOrZeroReturnVacant!0 (x!34001 lt!161995) (index!15173 lt!161995) (index!15173 lt!161995) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!341956 () Bool)

(declare-fun c!52732 () Bool)

(assert (=> b!341956 (= c!52732 (= lt!161994 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!341956 (= e!209696 e!209695)))

(assert (= (and d!71009 c!52731) b!341952))

(assert (= (and d!71009 (not c!52731)) b!341954))

(assert (= (and b!341954 c!52733) b!341953))

(assert (= (and b!341954 (not c!52733)) b!341956))

(assert (= (and b!341956 c!52732) b!341951))

(assert (= (and b!341956 (not c!52732)) b!341955))

(declare-fun m!344511 () Bool)

(assert (=> d!71009 m!344511))

(declare-fun m!344513 () Bool)

(assert (=> d!71009 m!344513))

(assert (=> d!71009 m!344435))

(declare-fun m!344515 () Bool)

(assert (=> d!71009 m!344515))

(declare-fun m!344517 () Bool)

(assert (=> d!71009 m!344517))

(declare-fun m!344519 () Bool)

(assert (=> d!71009 m!344519))

(assert (=> d!71009 m!344517))

(declare-fun m!344521 () Bool)

(assert (=> b!341954 m!344521))

(declare-fun m!344523 () Bool)

(assert (=> b!341955 m!344523))

(assert (=> b!341862 d!71009))

(declare-fun b!341965 () Bool)

(declare-fun e!209704 () Bool)

(declare-fun e!209705 () Bool)

(assert (=> b!341965 (= e!209704 e!209705)))

(declare-fun c!52736 () Bool)

(assert (=> b!341965 (= c!52736 (validKeyInArray!0 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!341966 () Bool)

(declare-fun e!209703 () Bool)

(declare-fun call!26582 () Bool)

(assert (=> b!341966 (= e!209703 call!26582)))

(declare-fun b!341967 () Bool)

(assert (=> b!341967 (= e!209705 call!26582)))

(declare-fun d!71011 () Bool)

(declare-fun res!189058 () Bool)

(assert (=> d!71011 (=> res!189058 e!209704)))

(assert (=> d!71011 (= res!189058 (bvsge #b00000000000000000000000000000000 (size!8884 _keys!1895)))))

(assert (=> d!71011 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!209704)))

(declare-fun bm!26579 () Bool)

(assert (=> bm!26579 (= call!26582 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!341968 () Bool)

(assert (=> b!341968 (= e!209705 e!209703)))

(declare-fun lt!162003 () (_ BitVec 64))

(assert (=> b!341968 (= lt!162003 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162004 () Unit!10594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18026 (_ BitVec 64) (_ BitVec 32)) Unit!10594)

(assert (=> b!341968 (= lt!162004 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162003 #b00000000000000000000000000000000))))

(assert (=> b!341968 (arrayContainsKey!0 _keys!1895 lt!162003 #b00000000000000000000000000000000)))

(declare-fun lt!162002 () Unit!10594)

(assert (=> b!341968 (= lt!162002 lt!162004)))

(declare-fun res!189059 () Bool)

(assert (=> b!341968 (= res!189059 (= (seekEntryOrOpen!0 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3248 #b00000000000000000000000000000000)))))

(assert (=> b!341968 (=> (not res!189059) (not e!209703))))

(assert (= (and d!71011 (not res!189058)) b!341965))

(assert (= (and b!341965 c!52736) b!341968))

(assert (= (and b!341965 (not c!52736)) b!341967))

(assert (= (and b!341968 res!189059) b!341966))

(assert (= (or b!341966 b!341967) bm!26579))

(declare-fun m!344525 () Bool)

(assert (=> b!341965 m!344525))

(assert (=> b!341965 m!344525))

(declare-fun m!344527 () Bool)

(assert (=> b!341965 m!344527))

(declare-fun m!344529 () Bool)

(assert (=> bm!26579 m!344529))

(assert (=> b!341968 m!344525))

(declare-fun m!344531 () Bool)

(assert (=> b!341968 m!344531))

(declare-fun m!344533 () Bool)

(assert (=> b!341968 m!344533))

(assert (=> b!341968 m!344525))

(declare-fun m!344535 () Bool)

(assert (=> b!341968 m!344535))

(assert (=> b!341865 d!71011))

(declare-fun d!71013 () Bool)

(assert (=> d!71013 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34254 d!71013))

(declare-fun d!71015 () Bool)

(assert (=> d!71015 (= (array_inv!6314 _values!1525) (bvsge (size!8883 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34254 d!71015))

(declare-fun d!71017 () Bool)

(assert (=> d!71017 (= (array_inv!6315 _keys!1895) (bvsge (size!8884 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34254 d!71017))

(declare-fun d!71019 () Bool)

(declare-fun res!189064 () Bool)

(declare-fun e!209710 () Bool)

(assert (=> d!71019 (=> res!189064 e!209710)))

(assert (=> d!71019 (= res!189064 (= (select (arr!8532 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71019 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!209710)))

(declare-fun b!341973 () Bool)

(declare-fun e!209711 () Bool)

(assert (=> b!341973 (= e!209710 e!209711)))

(declare-fun res!189065 () Bool)

(assert (=> b!341973 (=> (not res!189065) (not e!209711))))

(assert (=> b!341973 (= res!189065 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8884 _keys!1895)))))

(declare-fun b!341974 () Bool)

(assert (=> b!341974 (= e!209711 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71019 (not res!189064)) b!341973))

(assert (= (and b!341973 res!189065) b!341974))

(assert (=> d!71019 m!344525))

(declare-fun m!344537 () Bool)

(assert (=> b!341974 m!344537))

(assert (=> b!341863 d!71019))

(declare-fun d!71021 () Bool)

(assert (=> d!71021 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!341859 d!71021))

(declare-fun d!71023 () Bool)

(assert (=> d!71023 (contains!2153 (getCurrentListMap!1608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!162007 () Unit!10594)

(declare-fun choose!1310 (array!18026 array!18024 (_ BitVec 32) (_ BitVec 32) V!10603 V!10603 (_ BitVec 64) (_ BitVec 32) Int) Unit!10594)

(assert (=> d!71023 (= lt!162007 (choose!1310 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71023 (validMask!0 mask!2385)))

(assert (=> d!71023 (= (lemmaArrayContainsKeyThenInListMap!301 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!162007)))

(declare-fun bs!11750 () Bool)

(assert (= bs!11750 d!71023))

(assert (=> bs!11750 m!344447))

(assert (=> bs!11750 m!344447))

(assert (=> bs!11750 m!344449))

(assert (=> bs!11750 m!344443))

(declare-fun m!344539 () Bool)

(assert (=> bs!11750 m!344539))

(assert (=> bs!11750 m!344435))

(assert (=> b!341864 d!71023))

(declare-fun d!71025 () Bool)

(declare-fun lt!162010 () (_ BitVec 32))

(assert (=> d!71025 (and (or (bvslt lt!162010 #b00000000000000000000000000000000) (bvsge lt!162010 (size!8884 _keys!1895)) (and (bvsge lt!162010 #b00000000000000000000000000000000) (bvslt lt!162010 (size!8884 _keys!1895)))) (bvsge lt!162010 #b00000000000000000000000000000000) (bvslt lt!162010 (size!8884 _keys!1895)) (= (select (arr!8532 _keys!1895) lt!162010) k0!1348))))

(declare-fun e!209714 () (_ BitVec 32))

(assert (=> d!71025 (= lt!162010 e!209714)))

(declare-fun c!52739 () Bool)

(assert (=> d!71025 (= c!52739 (= (select (arr!8532 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8884 _keys!1895)) (bvslt (size!8884 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71025 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!162010)))

(declare-fun b!341979 () Bool)

(assert (=> b!341979 (= e!209714 #b00000000000000000000000000000000)))

(declare-fun b!341980 () Bool)

(assert (=> b!341980 (= e!209714 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71025 c!52739) b!341979))

(assert (= (and d!71025 (not c!52739)) b!341980))

(declare-fun m!344541 () Bool)

(assert (=> d!71025 m!344541))

(assert (=> d!71025 m!344525))

(declare-fun m!344543 () Bool)

(assert (=> b!341980 m!344543))

(assert (=> b!341864 d!71025))

(declare-fun d!71027 () Bool)

(declare-fun e!209720 () Bool)

(assert (=> d!71027 e!209720))

(declare-fun res!189068 () Bool)

(assert (=> d!71027 (=> res!189068 e!209720)))

(declare-fun lt!162019 () Bool)

(assert (=> d!71027 (= res!189068 (not lt!162019))))

(declare-fun lt!162022 () Bool)

(assert (=> d!71027 (= lt!162019 lt!162022)))

(declare-fun lt!162021 () Unit!10594)

(declare-fun e!209719 () Unit!10594)

(assert (=> d!71027 (= lt!162021 e!209719)))

(declare-fun c!52742 () Bool)

(assert (=> d!71027 (= c!52742 lt!162022)))

(declare-fun containsKey!327 (List!4815 (_ BitVec 64)) Bool)

(assert (=> d!71027 (= lt!162022 (containsKey!327 (toList!2079 (getCurrentListMap!1608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71027 (= (contains!2153 (getCurrentListMap!1608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162019)))

(declare-fun b!341987 () Bool)

(declare-fun lt!162020 () Unit!10594)

(assert (=> b!341987 (= e!209719 lt!162020)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!275 (List!4815 (_ BitVec 64)) Unit!10594)

(assert (=> b!341987 (= lt!162020 (lemmaContainsKeyImpliesGetValueByKeyDefined!275 (toList!2079 (getCurrentListMap!1608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!342 0))(
  ( (Some!341 (v!5831 V!10603)) (None!340) )
))
(declare-fun isDefined!276 (Option!342) Bool)

(declare-fun getValueByKey!336 (List!4815 (_ BitVec 64)) Option!342)

(assert (=> b!341987 (isDefined!276 (getValueByKey!336 (toList!2079 (getCurrentListMap!1608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!341988 () Bool)

(declare-fun Unit!10605 () Unit!10594)

(assert (=> b!341988 (= e!209719 Unit!10605)))

(declare-fun b!341989 () Bool)

(assert (=> b!341989 (= e!209720 (isDefined!276 (getValueByKey!336 (toList!2079 (getCurrentListMap!1608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71027 c!52742) b!341987))

(assert (= (and d!71027 (not c!52742)) b!341988))

(assert (= (and d!71027 (not res!189068)) b!341989))

(declare-fun m!344545 () Bool)

(assert (=> d!71027 m!344545))

(declare-fun m!344547 () Bool)

(assert (=> b!341987 m!344547))

(declare-fun m!344549 () Bool)

(assert (=> b!341987 m!344549))

(assert (=> b!341987 m!344549))

(declare-fun m!344551 () Bool)

(assert (=> b!341987 m!344551))

(assert (=> b!341989 m!344549))

(assert (=> b!341989 m!344549))

(assert (=> b!341989 m!344551))

(assert (=> b!341855 d!71027))

(declare-fun bm!26594 () Bool)

(declare-fun call!26598 () ListLongMap!4127)

(declare-fun call!26603 () ListLongMap!4127)

(assert (=> bm!26594 (= call!26598 call!26603)))

(declare-fun b!342032 () Bool)

(declare-fun e!209759 () Bool)

(declare-fun e!209752 () Bool)

(assert (=> b!342032 (= e!209759 e!209752)))

(declare-fun c!52760 () Bool)

(assert (=> b!342032 (= c!52760 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!71029 () Bool)

(assert (=> d!71029 e!209759))

(declare-fun res!189095 () Bool)

(assert (=> d!71029 (=> (not res!189095) (not e!209759))))

(assert (=> d!71029 (= res!189095 (or (bvsge #b00000000000000000000000000000000 (size!8884 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8884 _keys!1895)))))))

(declare-fun lt!162070 () ListLongMap!4127)

(declare-fun lt!162068 () ListLongMap!4127)

(assert (=> d!71029 (= lt!162070 lt!162068)))

(declare-fun lt!162079 () Unit!10594)

(declare-fun e!209757 () Unit!10594)

(assert (=> d!71029 (= lt!162079 e!209757)))

(declare-fun c!52757 () Bool)

(declare-fun e!209754 () Bool)

(assert (=> d!71029 (= c!52757 e!209754)))

(declare-fun res!189090 () Bool)

(assert (=> d!71029 (=> (not res!189090) (not e!209754))))

(assert (=> d!71029 (= res!189090 (bvslt #b00000000000000000000000000000000 (size!8884 _keys!1895)))))

(declare-fun e!209749 () ListLongMap!4127)

(assert (=> d!71029 (= lt!162068 e!209749)))

(declare-fun c!52756 () Bool)

(assert (=> d!71029 (= c!52756 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71029 (validMask!0 mask!2385)))

(assert (=> d!71029 (= (getCurrentListMap!1608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162070)))

(declare-fun b!342033 () Bool)

(declare-fun e!209755 () Bool)

(assert (=> b!342033 (= e!209752 e!209755)))

(declare-fun res!189091 () Bool)

(declare-fun call!26601 () Bool)

(assert (=> b!342033 (= res!189091 call!26601)))

(assert (=> b!342033 (=> (not res!189091) (not e!209755))))

(declare-fun b!342034 () Bool)

(declare-fun e!209751 () Bool)

(declare-fun call!26602 () Bool)

(assert (=> b!342034 (= e!209751 (not call!26602))))

(declare-fun b!342035 () Bool)

(declare-fun res!189094 () Bool)

(assert (=> b!342035 (=> (not res!189094) (not e!209759))))

(assert (=> b!342035 (= res!189094 e!209751)))

(declare-fun c!52758 () Bool)

(assert (=> b!342035 (= c!52758 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!342036 () Bool)

(declare-fun e!209758 () ListLongMap!4127)

(assert (=> b!342036 (= e!209749 e!209758)))

(declare-fun c!52755 () Bool)

(assert (=> b!342036 (= c!52755 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26595 () Bool)

(assert (=> bm!26595 (= call!26602 (contains!2153 lt!162070 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26596 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!593 (array!18026 array!18024 (_ BitVec 32) (_ BitVec 32) V!10603 V!10603 (_ BitVec 32) Int) ListLongMap!4127)

(assert (=> bm!26596 (= call!26603 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26597 () Bool)

(declare-fun call!26597 () ListLongMap!4127)

(declare-fun call!26600 () ListLongMap!4127)

(assert (=> bm!26597 (= call!26597 call!26600)))

(declare-fun b!342037 () Bool)

(declare-fun e!209747 () Bool)

(assert (=> b!342037 (= e!209751 e!209747)))

(declare-fun res!189093 () Bool)

(assert (=> b!342037 (= res!189093 call!26602)))

(assert (=> b!342037 (=> (not res!189093) (not e!209747))))

(declare-fun b!342038 () Bool)

(declare-fun c!52759 () Bool)

(assert (=> b!342038 (= c!52759 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!209748 () ListLongMap!4127)

(assert (=> b!342038 (= e!209758 e!209748)))

(declare-fun b!342039 () Bool)

(declare-fun apply!277 (ListLongMap!4127 (_ BitVec 64)) V!10603)

(assert (=> b!342039 (= e!209755 (= (apply!277 lt!162070 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun call!26599 () ListLongMap!4127)

(declare-fun bm!26598 () Bool)

(declare-fun +!728 (ListLongMap!4127 tuple2!5212) ListLongMap!4127)

(assert (=> bm!26598 (= call!26600 (+!728 (ite c!52756 call!26603 (ite c!52755 call!26598 call!26599)) (ite (or c!52756 c!52755) (tuple2!5213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26599 () Bool)

(assert (=> bm!26599 (= call!26601 (contains!2153 lt!162070 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!342040 () Bool)

(assert (=> b!342040 (= e!209747 (= (apply!277 lt!162070 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!342041 () Bool)

(assert (=> b!342041 (= e!209748 call!26597)))

(declare-fun b!342042 () Bool)

(assert (=> b!342042 (= e!209752 (not call!26601))))

(declare-fun b!342043 () Bool)

(assert (=> b!342043 (= e!209748 call!26599)))

(declare-fun b!342044 () Bool)

(declare-fun lt!162080 () Unit!10594)

(assert (=> b!342044 (= e!209757 lt!162080)))

(declare-fun lt!162075 () ListLongMap!4127)

(assert (=> b!342044 (= lt!162075 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162081 () (_ BitVec 64))

(assert (=> b!342044 (= lt!162081 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162074 () (_ BitVec 64))

(assert (=> b!342044 (= lt!162074 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162069 () Unit!10594)

(declare-fun addStillContains!253 (ListLongMap!4127 (_ BitVec 64) V!10603 (_ BitVec 64)) Unit!10594)

(assert (=> b!342044 (= lt!162069 (addStillContains!253 lt!162075 lt!162081 zeroValue!1467 lt!162074))))

(assert (=> b!342044 (contains!2153 (+!728 lt!162075 (tuple2!5213 lt!162081 zeroValue!1467)) lt!162074)))

(declare-fun lt!162083 () Unit!10594)

(assert (=> b!342044 (= lt!162083 lt!162069)))

(declare-fun lt!162071 () ListLongMap!4127)

(assert (=> b!342044 (= lt!162071 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162077 () (_ BitVec 64))

(assert (=> b!342044 (= lt!162077 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162084 () (_ BitVec 64))

(assert (=> b!342044 (= lt!162084 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162082 () Unit!10594)

(declare-fun addApplyDifferent!253 (ListLongMap!4127 (_ BitVec 64) V!10603 (_ BitVec 64)) Unit!10594)

(assert (=> b!342044 (= lt!162082 (addApplyDifferent!253 lt!162071 lt!162077 minValue!1467 lt!162084))))

(assert (=> b!342044 (= (apply!277 (+!728 lt!162071 (tuple2!5213 lt!162077 minValue!1467)) lt!162084) (apply!277 lt!162071 lt!162084))))

(declare-fun lt!162076 () Unit!10594)

(assert (=> b!342044 (= lt!162076 lt!162082)))

(declare-fun lt!162087 () ListLongMap!4127)

(assert (=> b!342044 (= lt!162087 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162072 () (_ BitVec 64))

(assert (=> b!342044 (= lt!162072 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162088 () (_ BitVec 64))

(assert (=> b!342044 (= lt!162088 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162078 () Unit!10594)

(assert (=> b!342044 (= lt!162078 (addApplyDifferent!253 lt!162087 lt!162072 zeroValue!1467 lt!162088))))

(assert (=> b!342044 (= (apply!277 (+!728 lt!162087 (tuple2!5213 lt!162072 zeroValue!1467)) lt!162088) (apply!277 lt!162087 lt!162088))))

(declare-fun lt!162086 () Unit!10594)

(assert (=> b!342044 (= lt!162086 lt!162078)))

(declare-fun lt!162073 () ListLongMap!4127)

(assert (=> b!342044 (= lt!162073 (getCurrentListMapNoExtraKeys!593 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162085 () (_ BitVec 64))

(assert (=> b!342044 (= lt!162085 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162067 () (_ BitVec 64))

(assert (=> b!342044 (= lt!162067 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!342044 (= lt!162080 (addApplyDifferent!253 lt!162073 lt!162085 minValue!1467 lt!162067))))

(assert (=> b!342044 (= (apply!277 (+!728 lt!162073 (tuple2!5213 lt!162085 minValue!1467)) lt!162067) (apply!277 lt!162073 lt!162067))))

(declare-fun b!342045 () Bool)

(declare-fun e!209756 () Bool)

(declare-fun e!209753 () Bool)

(assert (=> b!342045 (= e!209756 e!209753)))

(declare-fun res!189089 () Bool)

(assert (=> b!342045 (=> (not res!189089) (not e!209753))))

(assert (=> b!342045 (= res!189089 (contains!2153 lt!162070 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!342045 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8884 _keys!1895)))))

(declare-fun b!342046 () Bool)

(declare-fun Unit!10606 () Unit!10594)

(assert (=> b!342046 (= e!209757 Unit!10606)))

(declare-fun b!342047 () Bool)

(assert (=> b!342047 (= e!209749 (+!728 call!26600 (tuple2!5213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!342048 () Bool)

(assert (=> b!342048 (= e!209754 (validKeyInArray!0 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26600 () Bool)

(assert (=> bm!26600 (= call!26599 call!26598)))

(declare-fun b!342049 () Bool)

(declare-fun e!209750 () Bool)

(assert (=> b!342049 (= e!209750 (validKeyInArray!0 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!342050 () Bool)

(declare-fun get!4635 (ValueCell!3266 V!10603) V!10603)

(declare-fun dynLambda!620 (Int (_ BitVec 64)) V!10603)

(assert (=> b!342050 (= e!209753 (= (apply!277 lt!162070 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)) (get!4635 (select (arr!8531 _values!1525) #b00000000000000000000000000000000) (dynLambda!620 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!342050 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8883 _values!1525)))))

(assert (=> b!342050 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8884 _keys!1895)))))

(declare-fun b!342051 () Bool)

(declare-fun res!189088 () Bool)

(assert (=> b!342051 (=> (not res!189088) (not e!209759))))

(assert (=> b!342051 (= res!189088 e!209756)))

(declare-fun res!189087 () Bool)

(assert (=> b!342051 (=> res!189087 e!209756)))

(assert (=> b!342051 (= res!189087 (not e!209750))))

(declare-fun res!189092 () Bool)

(assert (=> b!342051 (=> (not res!189092) (not e!209750))))

(assert (=> b!342051 (= res!189092 (bvslt #b00000000000000000000000000000000 (size!8884 _keys!1895)))))

(declare-fun b!342052 () Bool)

(assert (=> b!342052 (= e!209758 call!26597)))

(assert (= (and d!71029 c!52756) b!342047))

(assert (= (and d!71029 (not c!52756)) b!342036))

(assert (= (and b!342036 c!52755) b!342052))

(assert (= (and b!342036 (not c!52755)) b!342038))

(assert (= (and b!342038 c!52759) b!342041))

(assert (= (and b!342038 (not c!52759)) b!342043))

(assert (= (or b!342041 b!342043) bm!26600))

(assert (= (or b!342052 bm!26600) bm!26594))

(assert (= (or b!342052 b!342041) bm!26597))

(assert (= (or b!342047 bm!26594) bm!26596))

(assert (= (or b!342047 bm!26597) bm!26598))

(assert (= (and d!71029 res!189090) b!342048))

(assert (= (and d!71029 c!52757) b!342044))

(assert (= (and d!71029 (not c!52757)) b!342046))

(assert (= (and d!71029 res!189095) b!342051))

(assert (= (and b!342051 res!189092) b!342049))

(assert (= (and b!342051 (not res!189087)) b!342045))

(assert (= (and b!342045 res!189089) b!342050))

(assert (= (and b!342051 res!189088) b!342035))

(assert (= (and b!342035 c!52758) b!342037))

(assert (= (and b!342035 (not c!52758)) b!342034))

(assert (= (and b!342037 res!189093) b!342040))

(assert (= (or b!342037 b!342034) bm!26595))

(assert (= (and b!342035 res!189094) b!342032))

(assert (= (and b!342032 c!52760) b!342033))

(assert (= (and b!342032 (not c!52760)) b!342042))

(assert (= (and b!342033 res!189091) b!342039))

(assert (= (or b!342033 b!342042) bm!26599))

(declare-fun b_lambda!8469 () Bool)

(assert (=> (not b_lambda!8469) (not b!342050)))

(declare-fun t!9922 () Bool)

(declare-fun tb!3061 () Bool)

(assert (=> (and start!34254 (= defaultEntry!1528 defaultEntry!1528) t!9922) tb!3061))

(declare-fun result!5529 () Bool)

(assert (=> tb!3061 (= result!5529 tp_is_empty!7219)))

(assert (=> b!342050 t!9922))

(declare-fun b_and!14489 () Bool)

(assert (= b_and!14483 (and (=> t!9922 result!5529) b_and!14489)))

(declare-fun m!344553 () Bool)

(assert (=> b!342047 m!344553))

(assert (=> b!342048 m!344525))

(assert (=> b!342048 m!344525))

(assert (=> b!342048 m!344527))

(assert (=> d!71029 m!344435))

(declare-fun m!344555 () Bool)

(assert (=> b!342044 m!344555))

(declare-fun m!344557 () Bool)

(assert (=> b!342044 m!344557))

(declare-fun m!344559 () Bool)

(assert (=> b!342044 m!344559))

(assert (=> b!342044 m!344559))

(declare-fun m!344561 () Bool)

(assert (=> b!342044 m!344561))

(assert (=> b!342044 m!344525))

(declare-fun m!344563 () Bool)

(assert (=> b!342044 m!344563))

(declare-fun m!344565 () Bool)

(assert (=> b!342044 m!344565))

(declare-fun m!344567 () Bool)

(assert (=> b!342044 m!344567))

(declare-fun m!344569 () Bool)

(assert (=> b!342044 m!344569))

(declare-fun m!344571 () Bool)

(assert (=> b!342044 m!344571))

(assert (=> b!342044 m!344567))

(declare-fun m!344573 () Bool)

(assert (=> b!342044 m!344573))

(declare-fun m!344575 () Bool)

(assert (=> b!342044 m!344575))

(declare-fun m!344577 () Bool)

(assert (=> b!342044 m!344577))

(declare-fun m!344579 () Bool)

(assert (=> b!342044 m!344579))

(declare-fun m!344581 () Bool)

(assert (=> b!342044 m!344581))

(assert (=> b!342044 m!344555))

(declare-fun m!344583 () Bool)

(assert (=> b!342044 m!344583))

(assert (=> b!342044 m!344573))

(declare-fun m!344585 () Bool)

(assert (=> b!342044 m!344585))

(declare-fun m!344587 () Bool)

(assert (=> b!342039 m!344587))

(declare-fun m!344589 () Bool)

(assert (=> bm!26598 m!344589))

(assert (=> bm!26596 m!344581))

(assert (=> b!342045 m!344525))

(assert (=> b!342045 m!344525))

(declare-fun m!344591 () Bool)

(assert (=> b!342045 m!344591))

(declare-fun m!344593 () Bool)

(assert (=> b!342050 m!344593))

(declare-fun m!344595 () Bool)

(assert (=> b!342050 m!344595))

(assert (=> b!342050 m!344525))

(declare-fun m!344597 () Bool)

(assert (=> b!342050 m!344597))

(assert (=> b!342050 m!344525))

(assert (=> b!342050 m!344593))

(assert (=> b!342050 m!344595))

(declare-fun m!344599 () Bool)

(assert (=> b!342050 m!344599))

(declare-fun m!344601 () Bool)

(assert (=> bm!26599 m!344601))

(assert (=> b!342049 m!344525))

(assert (=> b!342049 m!344525))

(assert (=> b!342049 m!344527))

(declare-fun m!344603 () Bool)

(assert (=> bm!26595 m!344603))

(declare-fun m!344605 () Bool)

(assert (=> b!342040 m!344605))

(assert (=> b!341855 d!71029))

(declare-fun b!342065 () Bool)

(declare-fun e!209770 () Bool)

(declare-fun call!26606 () Bool)

(assert (=> b!342065 (= e!209770 call!26606)))

(declare-fun b!342066 () Bool)

(assert (=> b!342066 (= e!209770 call!26606)))

(declare-fun d!71031 () Bool)

(declare-fun res!189104 () Bool)

(declare-fun e!209768 () Bool)

(assert (=> d!71031 (=> res!189104 e!209768)))

(assert (=> d!71031 (= res!189104 (bvsge #b00000000000000000000000000000000 (size!8884 _keys!1895)))))

(assert (=> d!71031 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4813) e!209768)))

(declare-fun b!342067 () Bool)

(declare-fun e!209769 () Bool)

(assert (=> b!342067 (= e!209769 e!209770)))

(declare-fun c!52763 () Bool)

(assert (=> b!342067 (= c!52763 (validKeyInArray!0 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!342068 () Bool)

(assert (=> b!342068 (= e!209768 e!209769)))

(declare-fun res!189103 () Bool)

(assert (=> b!342068 (=> (not res!189103) (not e!209769))))

(declare-fun e!209771 () Bool)

(assert (=> b!342068 (= res!189103 (not e!209771))))

(declare-fun res!189102 () Bool)

(assert (=> b!342068 (=> (not res!189102) (not e!209771))))

(assert (=> b!342068 (= res!189102 (validKeyInArray!0 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26603 () Bool)

(assert (=> bm!26603 (= call!26606 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52763 (Cons!4812 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000) Nil!4813) Nil!4813)))))

(declare-fun b!342069 () Bool)

(declare-fun contains!2155 (List!4816 (_ BitVec 64)) Bool)

(assert (=> b!342069 (= e!209771 (contains!2155 Nil!4813 (select (arr!8532 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71031 (not res!189104)) b!342068))

(assert (= (and b!342068 res!189102) b!342069))

(assert (= (and b!342068 res!189103) b!342067))

(assert (= (and b!342067 c!52763) b!342065))

(assert (= (and b!342067 (not c!52763)) b!342066))

(assert (= (or b!342065 b!342066) bm!26603))

(assert (=> b!342067 m!344525))

(assert (=> b!342067 m!344525))

(assert (=> b!342067 m!344527))

(assert (=> b!342068 m!344525))

(assert (=> b!342068 m!344525))

(assert (=> b!342068 m!344527))

(assert (=> bm!26603 m!344525))

(declare-fun m!344607 () Bool)

(assert (=> bm!26603 m!344607))

(assert (=> b!342069 m!344525))

(assert (=> b!342069 m!344525))

(declare-fun m!344609 () Bool)

(assert (=> b!342069 m!344609))

(assert (=> b!341861 d!71031))

(declare-fun b!342077 () Bool)

(declare-fun e!209777 () Bool)

(assert (=> b!342077 (= e!209777 tp_is_empty!7219)))

(declare-fun condMapEmpty!12267 () Bool)

(declare-fun mapDefault!12267 () ValueCell!3266)

(assert (=> mapNonEmpty!12258 (= condMapEmpty!12267 (= mapRest!12258 ((as const (Array (_ BitVec 32) ValueCell!3266)) mapDefault!12267)))))

(declare-fun mapRes!12267 () Bool)

(assert (=> mapNonEmpty!12258 (= tp!25337 (and e!209777 mapRes!12267))))

(declare-fun mapIsEmpty!12267 () Bool)

(assert (=> mapIsEmpty!12267 mapRes!12267))

(declare-fun b!342076 () Bool)

(declare-fun e!209776 () Bool)

(assert (=> b!342076 (= e!209776 tp_is_empty!7219)))

(declare-fun mapNonEmpty!12267 () Bool)

(declare-fun tp!25353 () Bool)

(assert (=> mapNonEmpty!12267 (= mapRes!12267 (and tp!25353 e!209776))))

(declare-fun mapValue!12267 () ValueCell!3266)

(declare-fun mapKey!12267 () (_ BitVec 32))

(declare-fun mapRest!12267 () (Array (_ BitVec 32) ValueCell!3266))

(assert (=> mapNonEmpty!12267 (= mapRest!12258 (store mapRest!12267 mapKey!12267 mapValue!12267))))

(assert (= (and mapNonEmpty!12258 condMapEmpty!12267) mapIsEmpty!12267))

(assert (= (and mapNonEmpty!12258 (not condMapEmpty!12267)) mapNonEmpty!12267))

(assert (= (and mapNonEmpty!12267 ((_ is ValueCellFull!3266) mapValue!12267)) b!342076))

(assert (= (and mapNonEmpty!12258 ((_ is ValueCellFull!3266) mapDefault!12267)) b!342077))

(declare-fun m!344611 () Bool)

(assert (=> mapNonEmpty!12267 m!344611))

(declare-fun b_lambda!8471 () Bool)

(assert (= b_lambda!8469 (or (and start!34254 b_free!7267) b_lambda!8471)))

(check-sat (not b!341974) (not b!342069) (not b_lambda!8471) (not b!342047) (not b!342067) (not d!71023) (not bm!26598) (not b!342045) (not b!342048) (not bm!26595) (not b!341987) (not b!341968) tp_is_empty!7219 (not b!341980) (not b!342068) (not bm!26603) (not d!71027) (not mapNonEmpty!12267) (not b_next!7267) (not b!342040) (not b!341955) (not b!342039) b_and!14489 (not d!71029) (not d!71009) (not bm!26599) (not b!341965) (not b!342044) (not b!342049) (not bm!26579) (not bm!26596) (not b!342050) (not b!341989))
(check-sat b_and!14489 (not b_next!7267))
