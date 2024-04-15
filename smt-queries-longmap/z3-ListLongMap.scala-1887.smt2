; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33742 () Bool)

(assert start!33742)

(declare-fun b_free!6991 () Bool)

(declare-fun b_next!6991 () Bool)

(assert (=> start!33742 (= b_free!6991 (not b_next!6991))))

(declare-fun tp!24476 () Bool)

(declare-fun b_and!14145 () Bool)

(assert (=> start!33742 (= tp!24476 b_and!14145)))

(declare-fun b!335559 () Bool)

(declare-fun e!205975 () Bool)

(declare-datatypes ((SeekEntryResult!3197 0))(
  ( (MissingZero!3197 (index!14967 (_ BitVec 32))) (Found!3197 (index!14968 (_ BitVec 32))) (Intermediate!3197 (undefined!4009 Bool) (index!14969 (_ BitVec 32)) (x!33470 (_ BitVec 32))) (Undefined!3197) (MissingVacant!3197 (index!14970 (_ BitVec 32))) )
))
(declare-fun lt!159714 () SeekEntryResult!3197)

(declare-datatypes ((array!17459 0))(
  ( (array!17460 (arr!8260 (Array (_ BitVec 32) (_ BitVec 64))) (size!8613 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17459)

(get-info :version)

(assert (=> b!335559 (= e!205975 (and (not ((_ is Found!3197) lt!159714)) ((_ is MissingZero!3197) lt!159714) (bvsge #b00000000000000000000000000000000 (size!8613 _keys!1895))))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17459 (_ BitVec 32)) SeekEntryResult!3197)

(assert (=> b!335559 (= lt!159714 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!185255 () Bool)

(assert (=> start!33742 (=> (not res!185255) (not e!205975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33742 (= res!185255 (validMask!0 mask!2385))))

(assert (=> start!33742 e!205975))

(assert (=> start!33742 true))

(declare-fun tp_is_empty!6943 () Bool)

(assert (=> start!33742 tp_is_empty!6943))

(assert (=> start!33742 tp!24476))

(declare-datatypes ((V!10235 0))(
  ( (V!10236 (val!3516 Int)) )
))
(declare-datatypes ((ValueCell!3128 0))(
  ( (ValueCellFull!3128 (v!5672 V!10235)) (EmptyCell!3128) )
))
(declare-datatypes ((array!17461 0))(
  ( (array!17462 (arr!8261 (Array (_ BitVec 32) ValueCell!3128)) (size!8614 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17461)

(declare-fun e!205971 () Bool)

(declare-fun array_inv!6164 (array!17461) Bool)

(assert (=> start!33742 (and (array_inv!6164 _values!1525) e!205971)))

(declare-fun array_inv!6165 (array!17459) Bool)

(assert (=> start!33742 (array_inv!6165 _keys!1895)))

(declare-fun mapIsEmpty!11811 () Bool)

(declare-fun mapRes!11811 () Bool)

(assert (=> mapIsEmpty!11811 mapRes!11811))

(declare-fun b!335560 () Bool)

(declare-fun e!205974 () Bool)

(assert (=> b!335560 (= e!205974 tp_is_empty!6943)))

(declare-fun b!335561 () Bool)

(declare-fun res!185256 () Bool)

(assert (=> b!335561 (=> (not res!185256) (not e!205975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17459 (_ BitVec 32)) Bool)

(assert (=> b!335561 (= res!185256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11811 () Bool)

(declare-fun tp!24477 () Bool)

(declare-fun e!205972 () Bool)

(assert (=> mapNonEmpty!11811 (= mapRes!11811 (and tp!24477 e!205972))))

(declare-fun mapValue!11811 () ValueCell!3128)

(declare-fun mapKey!11811 () (_ BitVec 32))

(declare-fun mapRest!11811 () (Array (_ BitVec 32) ValueCell!3128))

(assert (=> mapNonEmpty!11811 (= (arr!8261 _values!1525) (store mapRest!11811 mapKey!11811 mapValue!11811))))

(declare-fun b!335562 () Bool)

(assert (=> b!335562 (= e!205972 tp_is_empty!6943)))

(declare-fun b!335563 () Bool)

(declare-fun res!185258 () Bool)

(assert (=> b!335563 (=> (not res!185258) (not e!205975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335563 (= res!185258 (validKeyInArray!0 k0!1348))))

(declare-fun b!335564 () Bool)

(assert (=> b!335564 (= e!205971 (and e!205974 mapRes!11811))))

(declare-fun condMapEmpty!11811 () Bool)

(declare-fun mapDefault!11811 () ValueCell!3128)

(assert (=> b!335564 (= condMapEmpty!11811 (= (arr!8261 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3128)) mapDefault!11811)))))

(declare-fun b!335565 () Bool)

(declare-fun res!185254 () Bool)

(assert (=> b!335565 (=> (not res!185254) (not e!205975))))

(declare-datatypes ((List!4690 0))(
  ( (Nil!4687) (Cons!4686 (h!5542 (_ BitVec 64)) (t!9769 List!4690)) )
))
(declare-fun arrayNoDuplicates!0 (array!17459 (_ BitVec 32) List!4690) Bool)

(assert (=> b!335565 (= res!185254 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4687))))

(declare-fun b!335566 () Bool)

(declare-fun res!185253 () Bool)

(assert (=> b!335566 (=> (not res!185253) (not e!205975))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335566 (= res!185253 (and (= (size!8614 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8613 _keys!1895) (size!8614 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335567 () Bool)

(declare-fun res!185257 () Bool)

(assert (=> b!335567 (=> (not res!185257) (not e!205975))))

(declare-fun zeroValue!1467 () V!10235)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10235)

(declare-datatypes ((tuple2!5056 0))(
  ( (tuple2!5057 (_1!2539 (_ BitVec 64)) (_2!2539 V!10235)) )
))
(declare-datatypes ((List!4691 0))(
  ( (Nil!4688) (Cons!4687 (h!5543 tuple2!5056) (t!9770 List!4691)) )
))
(declare-datatypes ((ListLongMap!3959 0))(
  ( (ListLongMap!3960 (toList!1995 List!4691)) )
))
(declare-fun contains!2050 (ListLongMap!3959 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1501 (array!17459 array!17461 (_ BitVec 32) (_ BitVec 32) V!10235 V!10235 (_ BitVec 32) Int) ListLongMap!3959)

(assert (=> b!335567 (= res!185257 (not (contains!2050 (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!33742 res!185255) b!335566))

(assert (= (and b!335566 res!185253) b!335561))

(assert (= (and b!335561 res!185256) b!335565))

(assert (= (and b!335565 res!185254) b!335563))

(assert (= (and b!335563 res!185258) b!335567))

(assert (= (and b!335567 res!185257) b!335559))

(assert (= (and b!335564 condMapEmpty!11811) mapIsEmpty!11811))

(assert (= (and b!335564 (not condMapEmpty!11811)) mapNonEmpty!11811))

(assert (= (and mapNonEmpty!11811 ((_ is ValueCellFull!3128) mapValue!11811)) b!335562))

(assert (= (and b!335564 ((_ is ValueCellFull!3128) mapDefault!11811)) b!335560))

(assert (= start!33742 b!335564))

(declare-fun m!339071 () Bool)

(assert (=> b!335567 m!339071))

(assert (=> b!335567 m!339071))

(declare-fun m!339073 () Bool)

(assert (=> b!335567 m!339073))

(declare-fun m!339075 () Bool)

(assert (=> b!335561 m!339075))

(declare-fun m!339077 () Bool)

(assert (=> b!335559 m!339077))

(declare-fun m!339079 () Bool)

(assert (=> start!33742 m!339079))

(declare-fun m!339081 () Bool)

(assert (=> start!33742 m!339081))

(declare-fun m!339083 () Bool)

(assert (=> start!33742 m!339083))

(declare-fun m!339085 () Bool)

(assert (=> b!335565 m!339085))

(declare-fun m!339087 () Bool)

(assert (=> mapNonEmpty!11811 m!339087))

(declare-fun m!339089 () Bool)

(assert (=> b!335563 m!339089))

(check-sat (not b!335567) (not b!335559) tp_is_empty!6943 (not mapNonEmpty!11811) (not b!335565) (not start!33742) (not b_next!6991) (not b!335563) b_and!14145 (not b!335561))
(check-sat b_and!14145 (not b_next!6991))
(get-model)

(declare-fun d!70447 () Bool)

(assert (=> d!70447 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33742 d!70447))

(declare-fun d!70449 () Bool)

(assert (=> d!70449 (= (array_inv!6164 _values!1525) (bvsge (size!8614 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33742 d!70449))

(declare-fun d!70451 () Bool)

(assert (=> d!70451 (= (array_inv!6165 _keys!1895) (bvsge (size!8613 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33742 d!70451))

(declare-fun b!335630 () Bool)

(declare-fun e!206013 () Bool)

(declare-fun e!206014 () Bool)

(assert (=> b!335630 (= e!206013 e!206014)))

(declare-fun c!52124 () Bool)

(assert (=> b!335630 (= c!52124 (validKeyInArray!0 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335631 () Bool)

(declare-fun call!26273 () Bool)

(assert (=> b!335631 (= e!206014 call!26273)))

(declare-fun bm!26270 () Bool)

(assert (=> bm!26270 (= call!26273 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70453 () Bool)

(declare-fun res!185300 () Bool)

(assert (=> d!70453 (=> res!185300 e!206013)))

(assert (=> d!70453 (= res!185300 (bvsge #b00000000000000000000000000000000 (size!8613 _keys!1895)))))

(assert (=> d!70453 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!206013)))

(declare-fun b!335632 () Bool)

(declare-fun e!206012 () Bool)

(assert (=> b!335632 (= e!206012 call!26273)))

(declare-fun b!335633 () Bool)

(assert (=> b!335633 (= e!206014 e!206012)))

(declare-fun lt!159727 () (_ BitVec 64))

(assert (=> b!335633 (= lt!159727 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10434 0))(
  ( (Unit!10435) )
))
(declare-fun lt!159729 () Unit!10434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17459 (_ BitVec 64) (_ BitVec 32)) Unit!10434)

(assert (=> b!335633 (= lt!159729 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159727 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335633 (arrayContainsKey!0 _keys!1895 lt!159727 #b00000000000000000000000000000000)))

(declare-fun lt!159728 () Unit!10434)

(assert (=> b!335633 (= lt!159728 lt!159729)))

(declare-fun res!185299 () Bool)

(assert (=> b!335633 (= res!185299 (= (seekEntryOrOpen!0 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3197 #b00000000000000000000000000000000)))))

(assert (=> b!335633 (=> (not res!185299) (not e!206012))))

(assert (= (and d!70453 (not res!185300)) b!335630))

(assert (= (and b!335630 c!52124) b!335633))

(assert (= (and b!335630 (not c!52124)) b!335631))

(assert (= (and b!335633 res!185299) b!335632))

(assert (= (or b!335632 b!335631) bm!26270))

(declare-fun m!339131 () Bool)

(assert (=> b!335630 m!339131))

(assert (=> b!335630 m!339131))

(declare-fun m!339133 () Bool)

(assert (=> b!335630 m!339133))

(declare-fun m!339135 () Bool)

(assert (=> bm!26270 m!339135))

(assert (=> b!335633 m!339131))

(declare-fun m!339137 () Bool)

(assert (=> b!335633 m!339137))

(declare-fun m!339139 () Bool)

(assert (=> b!335633 m!339139))

(assert (=> b!335633 m!339131))

(declare-fun m!339141 () Bool)

(assert (=> b!335633 m!339141))

(assert (=> b!335561 d!70453))

(declare-fun b!335644 () Bool)

(declare-fun e!206025 () Bool)

(declare-fun contains!2052 (List!4690 (_ BitVec 64)) Bool)

(assert (=> b!335644 (= e!206025 (contains!2052 Nil!4687 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26273 () Bool)

(declare-fun call!26276 () Bool)

(declare-fun c!52127 () Bool)

(assert (=> bm!26273 (= call!26276 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52127 (Cons!4686 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000) Nil!4687) Nil!4687)))))

(declare-fun b!335645 () Bool)

(declare-fun e!206023 () Bool)

(assert (=> b!335645 (= e!206023 call!26276)))

(declare-fun b!335646 () Bool)

(assert (=> b!335646 (= e!206023 call!26276)))

(declare-fun b!335647 () Bool)

(declare-fun e!206026 () Bool)

(assert (=> b!335647 (= e!206026 e!206023)))

(assert (=> b!335647 (= c!52127 (validKeyInArray!0 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335648 () Bool)

(declare-fun e!206024 () Bool)

(assert (=> b!335648 (= e!206024 e!206026)))

(declare-fun res!185307 () Bool)

(assert (=> b!335648 (=> (not res!185307) (not e!206026))))

(assert (=> b!335648 (= res!185307 (not e!206025))))

(declare-fun res!185309 () Bool)

(assert (=> b!335648 (=> (not res!185309) (not e!206025))))

(assert (=> b!335648 (= res!185309 (validKeyInArray!0 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70455 () Bool)

(declare-fun res!185308 () Bool)

(assert (=> d!70455 (=> res!185308 e!206024)))

(assert (=> d!70455 (= res!185308 (bvsge #b00000000000000000000000000000000 (size!8613 _keys!1895)))))

(assert (=> d!70455 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4687) e!206024)))

(assert (= (and d!70455 (not res!185308)) b!335648))

(assert (= (and b!335648 res!185309) b!335644))

(assert (= (and b!335648 res!185307) b!335647))

(assert (= (and b!335647 c!52127) b!335646))

(assert (= (and b!335647 (not c!52127)) b!335645))

(assert (= (or b!335646 b!335645) bm!26273))

(assert (=> b!335644 m!339131))

(assert (=> b!335644 m!339131))

(declare-fun m!339143 () Bool)

(assert (=> b!335644 m!339143))

(assert (=> bm!26273 m!339131))

(declare-fun m!339145 () Bool)

(assert (=> bm!26273 m!339145))

(assert (=> b!335647 m!339131))

(assert (=> b!335647 m!339131))

(assert (=> b!335647 m!339133))

(assert (=> b!335648 m!339131))

(assert (=> b!335648 m!339131))

(assert (=> b!335648 m!339133))

(assert (=> b!335565 d!70455))

(declare-fun d!70457 () Bool)

(assert (=> d!70457 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!335563 d!70457))

(declare-fun b!335661 () Bool)

(declare-fun e!206034 () SeekEntryResult!3197)

(declare-fun lt!159737 () SeekEntryResult!3197)

(assert (=> b!335661 (= e!206034 (MissingZero!3197 (index!14969 lt!159737)))))

(declare-fun b!335662 () Bool)

(declare-fun c!52134 () Bool)

(declare-fun lt!159738 () (_ BitVec 64))

(assert (=> b!335662 (= c!52134 (= lt!159738 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!206035 () SeekEntryResult!3197)

(assert (=> b!335662 (= e!206035 e!206034)))

(declare-fun b!335663 () Bool)

(declare-fun e!206033 () SeekEntryResult!3197)

(assert (=> b!335663 (= e!206033 Undefined!3197)))

(declare-fun d!70459 () Bool)

(declare-fun lt!159736 () SeekEntryResult!3197)

(assert (=> d!70459 (and (or ((_ is Undefined!3197) lt!159736) (not ((_ is Found!3197) lt!159736)) (and (bvsge (index!14968 lt!159736) #b00000000000000000000000000000000) (bvslt (index!14968 lt!159736) (size!8613 _keys!1895)))) (or ((_ is Undefined!3197) lt!159736) ((_ is Found!3197) lt!159736) (not ((_ is MissingZero!3197) lt!159736)) (and (bvsge (index!14967 lt!159736) #b00000000000000000000000000000000) (bvslt (index!14967 lt!159736) (size!8613 _keys!1895)))) (or ((_ is Undefined!3197) lt!159736) ((_ is Found!3197) lt!159736) ((_ is MissingZero!3197) lt!159736) (not ((_ is MissingVacant!3197) lt!159736)) (and (bvsge (index!14970 lt!159736) #b00000000000000000000000000000000) (bvslt (index!14970 lt!159736) (size!8613 _keys!1895)))) (or ((_ is Undefined!3197) lt!159736) (ite ((_ is Found!3197) lt!159736) (= (select (arr!8260 _keys!1895) (index!14968 lt!159736)) k0!1348) (ite ((_ is MissingZero!3197) lt!159736) (= (select (arr!8260 _keys!1895) (index!14967 lt!159736)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3197) lt!159736) (= (select (arr!8260 _keys!1895) (index!14970 lt!159736)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70459 (= lt!159736 e!206033)))

(declare-fun c!52135 () Bool)

(assert (=> d!70459 (= c!52135 (and ((_ is Intermediate!3197) lt!159737) (undefined!4009 lt!159737)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17459 (_ BitVec 32)) SeekEntryResult!3197)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70459 (= lt!159737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70459 (validMask!0 mask!2385)))

(assert (=> d!70459 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!159736)))

(declare-fun b!335664 () Bool)

(assert (=> b!335664 (= e!206033 e!206035)))

(assert (=> b!335664 (= lt!159738 (select (arr!8260 _keys!1895) (index!14969 lt!159737)))))

(declare-fun c!52136 () Bool)

(assert (=> b!335664 (= c!52136 (= lt!159738 k0!1348))))

(declare-fun b!335665 () Bool)

(assert (=> b!335665 (= e!206035 (Found!3197 (index!14969 lt!159737)))))

(declare-fun b!335666 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17459 (_ BitVec 32)) SeekEntryResult!3197)

(assert (=> b!335666 (= e!206034 (seekKeyOrZeroReturnVacant!0 (x!33470 lt!159737) (index!14969 lt!159737) (index!14969 lt!159737) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!70459 c!52135) b!335663))

(assert (= (and d!70459 (not c!52135)) b!335664))

(assert (= (and b!335664 c!52136) b!335665))

(assert (= (and b!335664 (not c!52136)) b!335662))

(assert (= (and b!335662 c!52134) b!335661))

(assert (= (and b!335662 (not c!52134)) b!335666))

(declare-fun m!339147 () Bool)

(assert (=> d!70459 m!339147))

(declare-fun m!339149 () Bool)

(assert (=> d!70459 m!339149))

(declare-fun m!339151 () Bool)

(assert (=> d!70459 m!339151))

(declare-fun m!339153 () Bool)

(assert (=> d!70459 m!339153))

(assert (=> d!70459 m!339151))

(declare-fun m!339155 () Bool)

(assert (=> d!70459 m!339155))

(assert (=> d!70459 m!339079))

(declare-fun m!339157 () Bool)

(assert (=> b!335664 m!339157))

(declare-fun m!339159 () Bool)

(assert (=> b!335666 m!339159))

(assert (=> b!335559 d!70459))

(declare-fun d!70461 () Bool)

(declare-fun e!206040 () Bool)

(assert (=> d!70461 e!206040))

(declare-fun res!185312 () Bool)

(assert (=> d!70461 (=> res!185312 e!206040)))

(declare-fun lt!159747 () Bool)

(assert (=> d!70461 (= res!185312 (not lt!159747))))

(declare-fun lt!159749 () Bool)

(assert (=> d!70461 (= lt!159747 lt!159749)))

(declare-fun lt!159748 () Unit!10434)

(declare-fun e!206041 () Unit!10434)

(assert (=> d!70461 (= lt!159748 e!206041)))

(declare-fun c!52139 () Bool)

(assert (=> d!70461 (= c!52139 lt!159749)))

(declare-fun containsKey!314 (List!4691 (_ BitVec 64)) Bool)

(assert (=> d!70461 (= lt!159749 (containsKey!314 (toList!1995 (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70461 (= (contains!2050 (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!159747)))

(declare-fun b!335673 () Bool)

(declare-fun lt!159750 () Unit!10434)

(assert (=> b!335673 (= e!206041 lt!159750)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!263 (List!4691 (_ BitVec 64)) Unit!10434)

(assert (=> b!335673 (= lt!159750 (lemmaContainsKeyImpliesGetValueByKeyDefined!263 (toList!1995 (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!328 0))(
  ( (Some!327 (v!5675 V!10235)) (None!326) )
))
(declare-fun isDefined!264 (Option!328) Bool)

(declare-fun getValueByKey!322 (List!4691 (_ BitVec 64)) Option!328)

(assert (=> b!335673 (isDefined!264 (getValueByKey!322 (toList!1995 (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!335674 () Bool)

(declare-fun Unit!10436 () Unit!10434)

(assert (=> b!335674 (= e!206041 Unit!10436)))

(declare-fun b!335675 () Bool)

(assert (=> b!335675 (= e!206040 (isDefined!264 (getValueByKey!322 (toList!1995 (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70461 c!52139) b!335673))

(assert (= (and d!70461 (not c!52139)) b!335674))

(assert (= (and d!70461 (not res!185312)) b!335675))

(declare-fun m!339161 () Bool)

(assert (=> d!70461 m!339161))

(declare-fun m!339163 () Bool)

(assert (=> b!335673 m!339163))

(declare-fun m!339165 () Bool)

(assert (=> b!335673 m!339165))

(assert (=> b!335673 m!339165))

(declare-fun m!339167 () Bool)

(assert (=> b!335673 m!339167))

(assert (=> b!335675 m!339165))

(assert (=> b!335675 m!339165))

(assert (=> b!335675 m!339167))

(assert (=> b!335567 d!70461))

(declare-fun b!335718 () Bool)

(declare-fun e!206073 () ListLongMap!3959)

(declare-fun call!26294 () ListLongMap!3959)

(assert (=> b!335718 (= e!206073 call!26294)))

(declare-fun b!335719 () Bool)

(declare-fun e!206079 () Bool)

(declare-fun lt!159804 () ListLongMap!3959)

(declare-fun apply!266 (ListLongMap!3959 (_ BitVec 64)) V!10235)

(assert (=> b!335719 (= e!206079 (= (apply!266 lt!159804 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!335720 () Bool)

(declare-fun e!206072 () Bool)

(declare-fun e!206068 () Bool)

(assert (=> b!335720 (= e!206072 e!206068)))

(declare-fun res!185336 () Bool)

(declare-fun call!26297 () Bool)

(assert (=> b!335720 (= res!185336 call!26297)))

(assert (=> b!335720 (=> (not res!185336) (not e!206068))))

(declare-fun b!335721 () Bool)

(declare-fun e!206070 () Bool)

(assert (=> b!335721 (= e!206070 (validKeyInArray!0 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335722 () Bool)

(declare-fun res!185338 () Bool)

(declare-fun e!206077 () Bool)

(assert (=> b!335722 (=> (not res!185338) (not e!206077))))

(assert (=> b!335722 (= res!185338 e!206072)))

(declare-fun c!52152 () Bool)

(assert (=> b!335722 (= c!52152 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!335723 () Bool)

(declare-fun e!206076 () Bool)

(declare-fun call!26293 () Bool)

(assert (=> b!335723 (= e!206076 (not call!26293))))

(declare-fun bm!26288 () Bool)

(assert (=> bm!26288 (= call!26293 (contains!2050 lt!159804 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!335724 () Bool)

(declare-fun c!52153 () Bool)

(assert (=> b!335724 (= c!52153 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!206069 () ListLongMap!3959)

(assert (=> b!335724 (= e!206069 e!206073)))

(declare-fun b!335725 () Bool)

(declare-fun res!185332 () Bool)

(assert (=> b!335725 (=> (not res!185332) (not e!206077))))

(declare-fun e!206074 () Bool)

(assert (=> b!335725 (= res!185332 e!206074)))

(declare-fun res!185335 () Bool)

(assert (=> b!335725 (=> res!185335 e!206074)))

(declare-fun e!206080 () Bool)

(assert (=> b!335725 (= res!185335 (not e!206080))))

(declare-fun res!185333 () Bool)

(assert (=> b!335725 (=> (not res!185333) (not e!206080))))

(assert (=> b!335725 (= res!185333 (bvslt #b00000000000000000000000000000000 (size!8613 _keys!1895)))))

(declare-fun b!335727 () Bool)

(declare-fun e!206075 () Unit!10434)

(declare-fun Unit!10437 () Unit!10434)

(assert (=> b!335727 (= e!206075 Unit!10437)))

(declare-fun bm!26289 () Bool)

(declare-fun call!26296 () ListLongMap!3959)

(assert (=> bm!26289 (= call!26294 call!26296)))

(declare-fun b!335728 () Bool)

(declare-fun lt!159808 () Unit!10434)

(assert (=> b!335728 (= e!206075 lt!159808)))

(declare-fun lt!159809 () ListLongMap!3959)

(declare-fun getCurrentListMapNoExtraKeys!582 (array!17459 array!17461 (_ BitVec 32) (_ BitVec 32) V!10235 V!10235 (_ BitVec 32) Int) ListLongMap!3959)

(assert (=> b!335728 (= lt!159809 (getCurrentListMapNoExtraKeys!582 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159802 () (_ BitVec 64))

(assert (=> b!335728 (= lt!159802 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159811 () (_ BitVec 64))

(assert (=> b!335728 (= lt!159811 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159798 () Unit!10434)

(declare-fun addStillContains!242 (ListLongMap!3959 (_ BitVec 64) V!10235 (_ BitVec 64)) Unit!10434)

(assert (=> b!335728 (= lt!159798 (addStillContains!242 lt!159809 lt!159802 zeroValue!1467 lt!159811))))

(declare-fun +!719 (ListLongMap!3959 tuple2!5056) ListLongMap!3959)

(assert (=> b!335728 (contains!2050 (+!719 lt!159809 (tuple2!5057 lt!159802 zeroValue!1467)) lt!159811)))

(declare-fun lt!159812 () Unit!10434)

(assert (=> b!335728 (= lt!159812 lt!159798)))

(declare-fun lt!159800 () ListLongMap!3959)

(assert (=> b!335728 (= lt!159800 (getCurrentListMapNoExtraKeys!582 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159810 () (_ BitVec 64))

(assert (=> b!335728 (= lt!159810 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159797 () (_ BitVec 64))

(assert (=> b!335728 (= lt!159797 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159796 () Unit!10434)

(declare-fun addApplyDifferent!242 (ListLongMap!3959 (_ BitVec 64) V!10235 (_ BitVec 64)) Unit!10434)

(assert (=> b!335728 (= lt!159796 (addApplyDifferent!242 lt!159800 lt!159810 minValue!1467 lt!159797))))

(assert (=> b!335728 (= (apply!266 (+!719 lt!159800 (tuple2!5057 lt!159810 minValue!1467)) lt!159797) (apply!266 lt!159800 lt!159797))))

(declare-fun lt!159803 () Unit!10434)

(assert (=> b!335728 (= lt!159803 lt!159796)))

(declare-fun lt!159805 () ListLongMap!3959)

(assert (=> b!335728 (= lt!159805 (getCurrentListMapNoExtraKeys!582 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159813 () (_ BitVec 64))

(assert (=> b!335728 (= lt!159813 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159795 () (_ BitVec 64))

(assert (=> b!335728 (= lt!159795 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159814 () Unit!10434)

(assert (=> b!335728 (= lt!159814 (addApplyDifferent!242 lt!159805 lt!159813 zeroValue!1467 lt!159795))))

(assert (=> b!335728 (= (apply!266 (+!719 lt!159805 (tuple2!5057 lt!159813 zeroValue!1467)) lt!159795) (apply!266 lt!159805 lt!159795))))

(declare-fun lt!159815 () Unit!10434)

(assert (=> b!335728 (= lt!159815 lt!159814)))

(declare-fun lt!159816 () ListLongMap!3959)

(assert (=> b!335728 (= lt!159816 (getCurrentListMapNoExtraKeys!582 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159806 () (_ BitVec 64))

(assert (=> b!335728 (= lt!159806 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159807 () (_ BitVec 64))

(assert (=> b!335728 (= lt!159807 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!335728 (= lt!159808 (addApplyDifferent!242 lt!159816 lt!159806 minValue!1467 lt!159807))))

(assert (=> b!335728 (= (apply!266 (+!719 lt!159816 (tuple2!5057 lt!159806 minValue!1467)) lt!159807) (apply!266 lt!159816 lt!159807))))

(declare-fun b!335729 () Bool)

(declare-fun e!206071 () Bool)

(assert (=> b!335729 (= e!206074 e!206071)))

(declare-fun res!185339 () Bool)

(assert (=> b!335729 (=> (not res!185339) (not e!206071))))

(assert (=> b!335729 (= res!185339 (contains!2050 lt!159804 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!335729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8613 _keys!1895)))))

(declare-fun b!335730 () Bool)

(declare-fun get!4520 (ValueCell!3128 V!10235) V!10235)

(declare-fun dynLambda!600 (Int (_ BitVec 64)) V!10235)

(assert (=> b!335730 (= e!206071 (= (apply!266 lt!159804 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000)) (get!4520 (select (arr!8261 _values!1525) #b00000000000000000000000000000000) (dynLambda!600 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!335730 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8614 _values!1525)))))

(assert (=> b!335730 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8613 _keys!1895)))))

(declare-fun bm!26290 () Bool)

(declare-fun call!26295 () ListLongMap!3959)

(declare-fun c!52157 () Bool)

(declare-fun call!26292 () ListLongMap!3959)

(declare-fun c!52155 () Bool)

(assert (=> bm!26290 (= call!26292 (+!719 (ite c!52155 call!26295 (ite c!52157 call!26296 call!26294)) (ite (or c!52155 c!52157) (tuple2!5057 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5057 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26291 () Bool)

(assert (=> bm!26291 (= call!26296 call!26295)))

(declare-fun b!335731 () Bool)

(assert (=> b!335731 (= e!206077 e!206076)))

(declare-fun c!52154 () Bool)

(assert (=> b!335731 (= c!52154 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!335732 () Bool)

(declare-fun call!26291 () ListLongMap!3959)

(assert (=> b!335732 (= e!206073 call!26291)))

(declare-fun b!335733 () Bool)

(assert (=> b!335733 (= e!206069 call!26291)))

(declare-fun b!335734 () Bool)

(assert (=> b!335734 (= e!206072 (not call!26297))))

(declare-fun b!335735 () Bool)

(assert (=> b!335735 (= e!206080 (validKeyInArray!0 (select (arr!8260 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!335736 () Bool)

(assert (=> b!335736 (= e!206076 e!206079)))

(declare-fun res!185331 () Bool)

(assert (=> b!335736 (= res!185331 call!26293)))

(assert (=> b!335736 (=> (not res!185331) (not e!206079))))

(declare-fun bm!26292 () Bool)

(assert (=> bm!26292 (= call!26291 call!26292)))

(declare-fun b!335726 () Bool)

(declare-fun e!206078 () ListLongMap!3959)

(assert (=> b!335726 (= e!206078 e!206069)))

(assert (=> b!335726 (= c!52157 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!70463 () Bool)

(assert (=> d!70463 e!206077))

(declare-fun res!185334 () Bool)

(assert (=> d!70463 (=> (not res!185334) (not e!206077))))

(assert (=> d!70463 (= res!185334 (or (bvsge #b00000000000000000000000000000000 (size!8613 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8613 _keys!1895)))))))

(declare-fun lt!159799 () ListLongMap!3959)

(assert (=> d!70463 (= lt!159804 lt!159799)))

(declare-fun lt!159801 () Unit!10434)

(assert (=> d!70463 (= lt!159801 e!206075)))

(declare-fun c!52156 () Bool)

(assert (=> d!70463 (= c!52156 e!206070)))

(declare-fun res!185337 () Bool)

(assert (=> d!70463 (=> (not res!185337) (not e!206070))))

(assert (=> d!70463 (= res!185337 (bvslt #b00000000000000000000000000000000 (size!8613 _keys!1895)))))

(assert (=> d!70463 (= lt!159799 e!206078)))

(assert (=> d!70463 (= c!52155 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70463 (validMask!0 mask!2385)))

(assert (=> d!70463 (= (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!159804)))

(declare-fun bm!26293 () Bool)

(assert (=> bm!26293 (= call!26295 (getCurrentListMapNoExtraKeys!582 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26294 () Bool)

(assert (=> bm!26294 (= call!26297 (contains!2050 lt!159804 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!335737 () Bool)

(assert (=> b!335737 (= e!206078 (+!719 call!26292 (tuple2!5057 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!335738 () Bool)

(assert (=> b!335738 (= e!206068 (= (apply!266 lt!159804 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(assert (= (and d!70463 c!52155) b!335737))

(assert (= (and d!70463 (not c!52155)) b!335726))

(assert (= (and b!335726 c!52157) b!335733))

(assert (= (and b!335726 (not c!52157)) b!335724))

(assert (= (and b!335724 c!52153) b!335732))

(assert (= (and b!335724 (not c!52153)) b!335718))

(assert (= (or b!335732 b!335718) bm!26289))

(assert (= (or b!335733 bm!26289) bm!26291))

(assert (= (or b!335733 b!335732) bm!26292))

(assert (= (or b!335737 bm!26291) bm!26293))

(assert (= (or b!335737 bm!26292) bm!26290))

(assert (= (and d!70463 res!185337) b!335721))

(assert (= (and d!70463 c!52156) b!335728))

(assert (= (and d!70463 (not c!52156)) b!335727))

(assert (= (and d!70463 res!185334) b!335725))

(assert (= (and b!335725 res!185333) b!335735))

(assert (= (and b!335725 (not res!185335)) b!335729))

(assert (= (and b!335729 res!185339) b!335730))

(assert (= (and b!335725 res!185332) b!335722))

(assert (= (and b!335722 c!52152) b!335720))

(assert (= (and b!335722 (not c!52152)) b!335734))

(assert (= (and b!335720 res!185336) b!335738))

(assert (= (or b!335720 b!335734) bm!26294))

(assert (= (and b!335722 res!185338) b!335731))

(assert (= (and b!335731 c!52154) b!335736))

(assert (= (and b!335731 (not c!52154)) b!335723))

(assert (= (and b!335736 res!185331) b!335719))

(assert (= (or b!335736 b!335723) bm!26288))

(declare-fun b_lambda!8385 () Bool)

(assert (=> (not b_lambda!8385) (not b!335730)))

(declare-fun t!9773 () Bool)

(declare-fun tb!3039 () Bool)

(assert (=> (and start!33742 (= defaultEntry!1528 defaultEntry!1528) t!9773) tb!3039))

(declare-fun result!5463 () Bool)

(assert (=> tb!3039 (= result!5463 tp_is_empty!6943)))

(assert (=> b!335730 t!9773))

(declare-fun b_and!14151 () Bool)

(assert (= b_and!14145 (and (=> t!9773 result!5463) b_and!14151)))

(declare-fun m!339169 () Bool)

(assert (=> bm!26288 m!339169))

(assert (=> b!335729 m!339131))

(assert (=> b!335729 m!339131))

(declare-fun m!339171 () Bool)

(assert (=> b!335729 m!339171))

(declare-fun m!339173 () Bool)

(assert (=> bm!26294 m!339173))

(declare-fun m!339175 () Bool)

(assert (=> bm!26293 m!339175))

(declare-fun m!339177 () Bool)

(assert (=> b!335728 m!339177))

(declare-fun m!339179 () Bool)

(assert (=> b!335728 m!339179))

(declare-fun m!339181 () Bool)

(assert (=> b!335728 m!339181))

(declare-fun m!339183 () Bool)

(assert (=> b!335728 m!339183))

(declare-fun m!339185 () Bool)

(assert (=> b!335728 m!339185))

(assert (=> b!335728 m!339131))

(assert (=> b!335728 m!339175))

(declare-fun m!339187 () Bool)

(assert (=> b!335728 m!339187))

(declare-fun m!339189 () Bool)

(assert (=> b!335728 m!339189))

(declare-fun m!339191 () Bool)

(assert (=> b!335728 m!339191))

(declare-fun m!339193 () Bool)

(assert (=> b!335728 m!339193))

(declare-fun m!339195 () Bool)

(assert (=> b!335728 m!339195))

(assert (=> b!335728 m!339181))

(declare-fun m!339197 () Bool)

(assert (=> b!335728 m!339197))

(declare-fun m!339199 () Bool)

(assert (=> b!335728 m!339199))

(assert (=> b!335728 m!339183))

(assert (=> b!335728 m!339189))

(declare-fun m!339201 () Bool)

(assert (=> b!335728 m!339201))

(declare-fun m!339203 () Bool)

(assert (=> b!335728 m!339203))

(declare-fun m!339205 () Bool)

(assert (=> b!335728 m!339205))

(assert (=> b!335728 m!339193))

(declare-fun m!339207 () Bool)

(assert (=> b!335737 m!339207))

(declare-fun m!339209 () Bool)

(assert (=> b!335730 m!339209))

(assert (=> b!335730 m!339131))

(declare-fun m!339211 () Bool)

(assert (=> b!335730 m!339211))

(assert (=> b!335730 m!339131))

(declare-fun m!339213 () Bool)

(assert (=> b!335730 m!339213))

(assert (=> b!335730 m!339209))

(assert (=> b!335730 m!339213))

(declare-fun m!339215 () Bool)

(assert (=> b!335730 m!339215))

(assert (=> b!335721 m!339131))

(assert (=> b!335721 m!339131))

(assert (=> b!335721 m!339133))

(assert (=> b!335735 m!339131))

(assert (=> b!335735 m!339131))

(assert (=> b!335735 m!339133))

(declare-fun m!339217 () Bool)

(assert (=> b!335738 m!339217))

(assert (=> d!70463 m!339079))

(declare-fun m!339219 () Bool)

(assert (=> bm!26290 m!339219))

(declare-fun m!339221 () Bool)

(assert (=> b!335719 m!339221))

(assert (=> b!335567 d!70463))

(declare-fun mapNonEmpty!11820 () Bool)

(declare-fun mapRes!11820 () Bool)

(declare-fun tp!24492 () Bool)

(declare-fun e!206086 () Bool)

(assert (=> mapNonEmpty!11820 (= mapRes!11820 (and tp!24492 e!206086))))

(declare-fun mapKey!11820 () (_ BitVec 32))

(declare-fun mapRest!11820 () (Array (_ BitVec 32) ValueCell!3128))

(declare-fun mapValue!11820 () ValueCell!3128)

(assert (=> mapNonEmpty!11820 (= mapRest!11811 (store mapRest!11820 mapKey!11820 mapValue!11820))))

(declare-fun b!335747 () Bool)

(assert (=> b!335747 (= e!206086 tp_is_empty!6943)))

(declare-fun b!335748 () Bool)

(declare-fun e!206085 () Bool)

(assert (=> b!335748 (= e!206085 tp_is_empty!6943)))

(declare-fun condMapEmpty!11820 () Bool)

(declare-fun mapDefault!11820 () ValueCell!3128)

(assert (=> mapNonEmpty!11811 (= condMapEmpty!11820 (= mapRest!11811 ((as const (Array (_ BitVec 32) ValueCell!3128)) mapDefault!11820)))))

(assert (=> mapNonEmpty!11811 (= tp!24477 (and e!206085 mapRes!11820))))

(declare-fun mapIsEmpty!11820 () Bool)

(assert (=> mapIsEmpty!11820 mapRes!11820))

(assert (= (and mapNonEmpty!11811 condMapEmpty!11820) mapIsEmpty!11820))

(assert (= (and mapNonEmpty!11811 (not condMapEmpty!11820)) mapNonEmpty!11820))

(assert (= (and mapNonEmpty!11820 ((_ is ValueCellFull!3128) mapValue!11820)) b!335747))

(assert (= (and mapNonEmpty!11811 ((_ is ValueCellFull!3128) mapDefault!11820)) b!335748))

(declare-fun m!339223 () Bool)

(assert (=> mapNonEmpty!11820 m!339223))

(declare-fun b_lambda!8387 () Bool)

(assert (= b_lambda!8385 (or (and start!33742 b_free!6991) b_lambda!8387)))

(check-sat (not b!335735) (not d!70459) (not d!70461) (not b!335728) (not bm!26273) (not mapNonEmpty!11820) tp_is_empty!6943 (not b!335666) (not b!335737) (not b!335644) (not b!335730) (not b!335647) (not d!70463) (not b!335648) (not b!335719) (not b!335729) (not bm!26293) (not bm!26294) (not bm!26288) (not b!335675) b_and!14151 (not b_lambda!8387) (not bm!26270) (not b!335633) (not bm!26290) (not b!335630) (not b!335673) (not b_next!6991) (not b!335738) (not b!335721))
(check-sat b_and!14151 (not b_next!6991))
