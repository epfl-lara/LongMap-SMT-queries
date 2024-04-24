; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33544 () Bool)

(assert start!33544)

(declare-fun b_free!6829 () Bool)

(declare-fun b_next!6829 () Bool)

(assert (=> start!33544 (= b_free!6829 (not b_next!6829))))

(declare-fun tp!23984 () Bool)

(declare-fun b_and!14019 () Bool)

(assert (=> start!33544 (= tp!23984 b_and!14019)))

(declare-fun b!332980 () Bool)

(declare-fun e!204470 () Bool)

(declare-fun e!204467 () Bool)

(declare-fun mapRes!11562 () Bool)

(assert (=> b!332980 (= e!204470 (and e!204467 mapRes!11562))))

(declare-fun condMapEmpty!11562 () Bool)

(declare-datatypes ((V!10019 0))(
  ( (V!10020 (val!3435 Int)) )
))
(declare-datatypes ((ValueCell!3047 0))(
  ( (ValueCellFull!3047 (v!5596 V!10019)) (EmptyCell!3047) )
))
(declare-datatypes ((array!17156 0))(
  ( (array!17157 (arr!8110 (Array (_ BitVec 32) ValueCell!3047)) (size!8462 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17156)

(declare-fun mapDefault!11562 () ValueCell!3047)

(assert (=> b!332980 (= condMapEmpty!11562 (= (arr!8110 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3047)) mapDefault!11562)))))

(declare-fun b!332981 () Bool)

(declare-fun res!183472 () Bool)

(declare-fun e!204466 () Bool)

(assert (=> b!332981 (=> (not res!183472) (not e!204466))))

(declare-datatypes ((array!17158 0))(
  ( (array!17159 (arr!8111 (Array (_ BitVec 32) (_ BitVec 64))) (size!8463 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17158)

(declare-datatypes ((List!4529 0))(
  ( (Nil!4526) (Cons!4525 (h!5381 (_ BitVec 64)) (t!9605 List!4529)) )
))
(declare-fun arrayNoDuplicates!0 (array!17158 (_ BitVec 32) List!4529) Bool)

(assert (=> b!332981 (= res!183472 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4526))))

(declare-fun b!332982 () Bool)

(declare-fun res!183476 () Bool)

(assert (=> b!332982 (=> (not res!183476) (not e!204466))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17158 (_ BitVec 32)) Bool)

(assert (=> b!332982 (= res!183476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332983 () Bool)

(declare-fun tp_is_empty!6781 () Bool)

(assert (=> b!332983 (= e!204467 tp_is_empty!6781)))

(declare-fun b!332984 () Bool)

(declare-fun e!204468 () Bool)

(assert (=> b!332984 (= e!204468 tp_is_empty!6781)))

(declare-fun b!332985 () Bool)

(declare-fun res!183473 () Bool)

(assert (=> b!332985 (=> (not res!183473) (not e!204466))))

(declare-fun zeroValue!1467 () V!10019)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10019)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((tuple2!4914 0))(
  ( (tuple2!4915 (_1!2468 (_ BitVec 64)) (_2!2468 V!10019)) )
))
(declare-datatypes ((List!4530 0))(
  ( (Nil!4527) (Cons!4526 (h!5382 tuple2!4914) (t!9606 List!4530)) )
))
(declare-datatypes ((ListLongMap!3829 0))(
  ( (ListLongMap!3830 (toList!1930 List!4530)) )
))
(declare-fun contains!1991 (ListLongMap!3829 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1462 (array!17158 array!17156 (_ BitVec 32) (_ BitVec 32) V!10019 V!10019 (_ BitVec 32) Int) ListLongMap!3829)

(assert (=> b!332985 (= res!183473 (not (contains!1991 (getCurrentListMap!1462 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!183474 () Bool)

(assert (=> start!33544 (=> (not res!183474) (not e!204466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33544 (= res!183474 (validMask!0 mask!2385))))

(assert (=> start!33544 e!204466))

(assert (=> start!33544 true))

(assert (=> start!33544 tp_is_empty!6781))

(assert (=> start!33544 tp!23984))

(declare-fun array_inv!6036 (array!17156) Bool)

(assert (=> start!33544 (and (array_inv!6036 _values!1525) e!204470)))

(declare-fun array_inv!6037 (array!17158) Bool)

(assert (=> start!33544 (array_inv!6037 _keys!1895)))

(declare-fun b!332986 () Bool)

(declare-datatypes ((SeekEntryResult!3100 0))(
  ( (MissingZero!3100 (index!14579 (_ BitVec 32))) (Found!3100 (index!14580 (_ BitVec 32))) (Intermediate!3100 (undefined!3912 Bool) (index!14581 (_ BitVec 32)) (x!33139 (_ BitVec 32))) (Undefined!3100) (MissingVacant!3100 (index!14582 (_ BitVec 32))) )
))
(declare-fun lt!159172 () SeekEntryResult!3100)

(get-info :version)

(assert (=> b!332986 (= e!204466 (and ((_ is Found!3100) lt!159172) (= (select (arr!8111 _keys!1895) (index!14580 lt!159172)) k0!1348) (bvsge (index!14580 lt!159172) #b00000000000000000000000000000000) (bvsge (index!14580 lt!159172) (size!8463 _keys!1895))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17158 (_ BitVec 32)) SeekEntryResult!3100)

(assert (=> b!332986 (= lt!159172 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!332987 () Bool)

(declare-fun res!183471 () Bool)

(assert (=> b!332987 (=> (not res!183471) (not e!204466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332987 (= res!183471 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!11562 () Bool)

(declare-fun tp!23985 () Bool)

(assert (=> mapNonEmpty!11562 (= mapRes!11562 (and tp!23985 e!204468))))

(declare-fun mapKey!11562 () (_ BitVec 32))

(declare-fun mapValue!11562 () ValueCell!3047)

(declare-fun mapRest!11562 () (Array (_ BitVec 32) ValueCell!3047))

(assert (=> mapNonEmpty!11562 (= (arr!8110 _values!1525) (store mapRest!11562 mapKey!11562 mapValue!11562))))

(declare-fun mapIsEmpty!11562 () Bool)

(assert (=> mapIsEmpty!11562 mapRes!11562))

(declare-fun b!332988 () Bool)

(declare-fun res!183475 () Bool)

(assert (=> b!332988 (=> (not res!183475) (not e!204466))))

(assert (=> b!332988 (= res!183475 (and (= (size!8462 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8463 _keys!1895) (size!8462 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!33544 res!183474) b!332988))

(assert (= (and b!332988 res!183475) b!332982))

(assert (= (and b!332982 res!183476) b!332981))

(assert (= (and b!332981 res!183472) b!332987))

(assert (= (and b!332987 res!183471) b!332985))

(assert (= (and b!332985 res!183473) b!332986))

(assert (= (and b!332980 condMapEmpty!11562) mapIsEmpty!11562))

(assert (= (and b!332980 (not condMapEmpty!11562)) mapNonEmpty!11562))

(assert (= (and mapNonEmpty!11562 ((_ is ValueCellFull!3047) mapValue!11562)) b!332984))

(assert (= (and b!332980 ((_ is ValueCellFull!3047) mapDefault!11562)) b!332983))

(assert (= start!33544 b!332980))

(declare-fun m!337605 () Bool)

(assert (=> b!332985 m!337605))

(assert (=> b!332985 m!337605))

(declare-fun m!337607 () Bool)

(assert (=> b!332985 m!337607))

(declare-fun m!337609 () Bool)

(assert (=> b!332986 m!337609))

(declare-fun m!337611 () Bool)

(assert (=> b!332986 m!337611))

(declare-fun m!337613 () Bool)

(assert (=> b!332981 m!337613))

(declare-fun m!337615 () Bool)

(assert (=> mapNonEmpty!11562 m!337615))

(declare-fun m!337617 () Bool)

(assert (=> start!33544 m!337617))

(declare-fun m!337619 () Bool)

(assert (=> start!33544 m!337619))

(declare-fun m!337621 () Bool)

(assert (=> start!33544 m!337621))

(declare-fun m!337623 () Bool)

(assert (=> b!332987 m!337623))

(declare-fun m!337625 () Bool)

(assert (=> b!332982 m!337625))

(check-sat (not b_next!6829) (not mapNonEmpty!11562) (not b!332986) (not b!332982) (not b!332985) (not start!33544) (not b!332981) (not b!332987) tp_is_empty!6781 b_and!14019)
(check-sat b_and!14019 (not b_next!6829))
(get-model)

(declare-fun d!70591 () Bool)

(declare-fun e!204506 () Bool)

(assert (=> d!70591 e!204506))

(declare-fun res!183515 () Bool)

(assert (=> d!70591 (=> res!183515 e!204506)))

(declare-fun lt!159190 () Bool)

(assert (=> d!70591 (= res!183515 (not lt!159190))))

(declare-fun lt!159187 () Bool)

(assert (=> d!70591 (= lt!159190 lt!159187)))

(declare-datatypes ((Unit!10341 0))(
  ( (Unit!10342) )
))
(declare-fun lt!159188 () Unit!10341)

(declare-fun e!204505 () Unit!10341)

(assert (=> d!70591 (= lt!159188 e!204505)))

(declare-fun c!52100 () Bool)

(assert (=> d!70591 (= c!52100 lt!159187)))

(declare-fun containsKey!314 (List!4530 (_ BitVec 64)) Bool)

(assert (=> d!70591 (= lt!159187 (containsKey!314 (toList!1930 (getCurrentListMap!1462 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70591 (= (contains!1991 (getCurrentListMap!1462 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!159190)))

(declare-fun b!333049 () Bool)

(declare-fun lt!159189 () Unit!10341)

(assert (=> b!333049 (= e!204505 lt!159189)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!262 (List!4530 (_ BitVec 64)) Unit!10341)

(assert (=> b!333049 (= lt!159189 (lemmaContainsKeyImpliesGetValueByKeyDefined!262 (toList!1930 (getCurrentListMap!1462 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!329 0))(
  ( (Some!328 (v!5599 V!10019)) (None!327) )
))
(declare-fun isDefined!263 (Option!329) Bool)

(declare-fun getValueByKey!323 (List!4530 (_ BitVec 64)) Option!329)

(assert (=> b!333049 (isDefined!263 (getValueByKey!323 (toList!1930 (getCurrentListMap!1462 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!333050 () Bool)

(declare-fun Unit!10343 () Unit!10341)

(assert (=> b!333050 (= e!204505 Unit!10343)))

(declare-fun b!333051 () Bool)

(assert (=> b!333051 (= e!204506 (isDefined!263 (getValueByKey!323 (toList!1930 (getCurrentListMap!1462 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70591 c!52100) b!333049))

(assert (= (and d!70591 (not c!52100)) b!333050))

(assert (= (and d!70591 (not res!183515)) b!333051))

(declare-fun m!337671 () Bool)

(assert (=> d!70591 m!337671))

(declare-fun m!337673 () Bool)

(assert (=> b!333049 m!337673))

(declare-fun m!337675 () Bool)

(assert (=> b!333049 m!337675))

(assert (=> b!333049 m!337675))

(declare-fun m!337677 () Bool)

(assert (=> b!333049 m!337677))

(assert (=> b!333051 m!337675))

(assert (=> b!333051 m!337675))

(assert (=> b!333051 m!337677))

(assert (=> b!332985 d!70591))

(declare-fun b!333094 () Bool)

(declare-fun res!183536 () Bool)

(declare-fun e!204540 () Bool)

(assert (=> b!333094 (=> (not res!183536) (not e!204540))))

(declare-fun e!204543 () Bool)

(assert (=> b!333094 (= res!183536 e!204543)))

(declare-fun c!52113 () Bool)

(assert (=> b!333094 (= c!52113 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!333095 () Bool)

(declare-fun e!204534 () ListLongMap!3829)

(declare-fun call!26245 () ListLongMap!3829)

(assert (=> b!333095 (= e!204534 call!26245)))

(declare-fun b!333096 () Bool)

(declare-fun e!204535 () Bool)

(assert (=> b!333096 (= e!204535 (validKeyInArray!0 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26240 () Bool)

(declare-fun call!26248 () ListLongMap!3829)

(declare-fun call!26247 () ListLongMap!3829)

(assert (=> bm!26240 (= call!26248 call!26247)))

(declare-fun b!333097 () Bool)

(declare-fun e!204542 () Bool)

(declare-fun e!204545 () Bool)

(assert (=> b!333097 (= e!204542 e!204545)))

(declare-fun res!183539 () Bool)

(declare-fun call!26243 () Bool)

(assert (=> b!333097 (= res!183539 call!26243)))

(assert (=> b!333097 (=> (not res!183539) (not e!204545))))

(declare-fun b!333098 () Bool)

(assert (=> b!333098 (= e!204540 e!204542)))

(declare-fun c!52117 () Bool)

(assert (=> b!333098 (= c!52117 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!333099 () Bool)

(declare-fun e!204539 () ListLongMap!3829)

(assert (=> b!333099 (= e!204539 call!26245)))

(declare-fun bm!26241 () Bool)

(declare-fun call!26244 () Bool)

(declare-fun lt!159255 () ListLongMap!3829)

(assert (=> bm!26241 (= call!26244 (contains!1991 lt!159255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!70593 () Bool)

(assert (=> d!70593 e!204540))

(declare-fun res!183537 () Bool)

(assert (=> d!70593 (=> (not res!183537) (not e!204540))))

(assert (=> d!70593 (= res!183537 (or (bvsge #b00000000000000000000000000000000 (size!8463 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8463 _keys!1895)))))))

(declare-fun lt!159246 () ListLongMap!3829)

(assert (=> d!70593 (= lt!159255 lt!159246)))

(declare-fun lt!159235 () Unit!10341)

(declare-fun e!204533 () Unit!10341)

(assert (=> d!70593 (= lt!159235 e!204533)))

(declare-fun c!52118 () Bool)

(declare-fun e!204544 () Bool)

(assert (=> d!70593 (= c!52118 e!204544)))

(declare-fun res!183538 () Bool)

(assert (=> d!70593 (=> (not res!183538) (not e!204544))))

(assert (=> d!70593 (= res!183538 (bvslt #b00000000000000000000000000000000 (size!8463 _keys!1895)))))

(declare-fun e!204541 () ListLongMap!3829)

(assert (=> d!70593 (= lt!159246 e!204541)))

(declare-fun c!52116 () Bool)

(assert (=> d!70593 (= c!52116 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70593 (validMask!0 mask!2385)))

(assert (=> d!70593 (= (getCurrentListMap!1462 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!159255)))

(declare-fun call!26246 () ListLongMap!3829)

(declare-fun bm!26242 () Bool)

(declare-fun call!26249 () ListLongMap!3829)

(declare-fun c!52114 () Bool)

(declare-fun +!715 (ListLongMap!3829 tuple2!4914) ListLongMap!3829)

(assert (=> bm!26242 (= call!26246 (+!715 (ite c!52116 call!26247 (ite c!52114 call!26248 call!26249)) (ite (or c!52116 c!52114) (tuple2!4915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!4915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26243 () Bool)

(assert (=> bm!26243 (= call!26249 call!26248)))

(declare-fun bm!26244 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!580 (array!17158 array!17156 (_ BitVec 32) (_ BitVec 32) V!10019 V!10019 (_ BitVec 32) Int) ListLongMap!3829)

(assert (=> bm!26244 (= call!26247 (getCurrentListMapNoExtraKeys!580 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26245 () Bool)

(assert (=> bm!26245 (= call!26245 call!26246)))

(declare-fun b!333100 () Bool)

(assert (=> b!333100 (= e!204541 (+!715 call!26246 (tuple2!4915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!333101 () Bool)

(declare-fun apply!264 (ListLongMap!3829 (_ BitVec 64)) V!10019)

(assert (=> b!333101 (= e!204545 (= (apply!264 lt!159255 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26246 () Bool)

(assert (=> bm!26246 (= call!26243 (contains!1991 lt!159255 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!333102 () Bool)

(declare-fun e!204538 () Bool)

(declare-fun get!4476 (ValueCell!3047 V!10019) V!10019)

(declare-fun dynLambda!607 (Int (_ BitVec 64)) V!10019)

(assert (=> b!333102 (= e!204538 (= (apply!264 lt!159255 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000)) (get!4476 (select (arr!8110 _values!1525) #b00000000000000000000000000000000) (dynLambda!607 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!333102 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8462 _values!1525)))))

(assert (=> b!333102 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8463 _keys!1895)))))

(declare-fun b!333103 () Bool)

(declare-fun Unit!10344 () Unit!10341)

(assert (=> b!333103 (= e!204533 Unit!10344)))

(declare-fun b!333104 () Bool)

(declare-fun e!204537 () Bool)

(assert (=> b!333104 (= e!204543 e!204537)))

(declare-fun res!183541 () Bool)

(assert (=> b!333104 (= res!183541 call!26244)))

(assert (=> b!333104 (=> (not res!183541) (not e!204537))))

(declare-fun b!333105 () Bool)

(assert (=> b!333105 (= e!204543 (not call!26244))))

(declare-fun b!333106 () Bool)

(assert (=> b!333106 (= e!204537 (= (apply!264 lt!159255 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!333107 () Bool)

(assert (=> b!333107 (= e!204542 (not call!26243))))

(declare-fun b!333108 () Bool)

(declare-fun res!183535 () Bool)

(assert (=> b!333108 (=> (not res!183535) (not e!204540))))

(declare-fun e!204536 () Bool)

(assert (=> b!333108 (= res!183535 e!204536)))

(declare-fun res!183540 () Bool)

(assert (=> b!333108 (=> res!183540 e!204536)))

(assert (=> b!333108 (= res!183540 (not e!204535))))

(declare-fun res!183542 () Bool)

(assert (=> b!333108 (=> (not res!183542) (not e!204535))))

(assert (=> b!333108 (= res!183542 (bvslt #b00000000000000000000000000000000 (size!8463 _keys!1895)))))

(declare-fun b!333109 () Bool)

(assert (=> b!333109 (= e!204544 (validKeyInArray!0 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333110 () Bool)

(assert (=> b!333110 (= e!204541 e!204534)))

(assert (=> b!333110 (= c!52114 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!333111 () Bool)

(assert (=> b!333111 (= e!204536 e!204538)))

(declare-fun res!183534 () Bool)

(assert (=> b!333111 (=> (not res!183534) (not e!204538))))

(assert (=> b!333111 (= res!183534 (contains!1991 lt!159255 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!333111 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8463 _keys!1895)))))

(declare-fun b!333112 () Bool)

(declare-fun c!52115 () Bool)

(assert (=> b!333112 (= c!52115 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!333112 (= e!204534 e!204539)))

(declare-fun b!333113 () Bool)

(declare-fun lt!159252 () Unit!10341)

(assert (=> b!333113 (= e!204533 lt!159252)))

(declare-fun lt!159241 () ListLongMap!3829)

(assert (=> b!333113 (= lt!159241 (getCurrentListMapNoExtraKeys!580 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159247 () (_ BitVec 64))

(assert (=> b!333113 (= lt!159247 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159251 () (_ BitVec 64))

(assert (=> b!333113 (= lt!159251 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159240 () Unit!10341)

(declare-fun addStillContains!240 (ListLongMap!3829 (_ BitVec 64) V!10019 (_ BitVec 64)) Unit!10341)

(assert (=> b!333113 (= lt!159240 (addStillContains!240 lt!159241 lt!159247 zeroValue!1467 lt!159251))))

(assert (=> b!333113 (contains!1991 (+!715 lt!159241 (tuple2!4915 lt!159247 zeroValue!1467)) lt!159251)))

(declare-fun lt!159245 () Unit!10341)

(assert (=> b!333113 (= lt!159245 lt!159240)))

(declare-fun lt!159237 () ListLongMap!3829)

(assert (=> b!333113 (= lt!159237 (getCurrentListMapNoExtraKeys!580 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159236 () (_ BitVec 64))

(assert (=> b!333113 (= lt!159236 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159254 () (_ BitVec 64))

(assert (=> b!333113 (= lt!159254 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159239 () Unit!10341)

(declare-fun addApplyDifferent!240 (ListLongMap!3829 (_ BitVec 64) V!10019 (_ BitVec 64)) Unit!10341)

(assert (=> b!333113 (= lt!159239 (addApplyDifferent!240 lt!159237 lt!159236 minValue!1467 lt!159254))))

(assert (=> b!333113 (= (apply!264 (+!715 lt!159237 (tuple2!4915 lt!159236 minValue!1467)) lt!159254) (apply!264 lt!159237 lt!159254))))

(declare-fun lt!159253 () Unit!10341)

(assert (=> b!333113 (= lt!159253 lt!159239)))

(declare-fun lt!159238 () ListLongMap!3829)

(assert (=> b!333113 (= lt!159238 (getCurrentListMapNoExtraKeys!580 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159248 () (_ BitVec 64))

(assert (=> b!333113 (= lt!159248 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159249 () (_ BitVec 64))

(assert (=> b!333113 (= lt!159249 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159242 () Unit!10341)

(assert (=> b!333113 (= lt!159242 (addApplyDifferent!240 lt!159238 lt!159248 zeroValue!1467 lt!159249))))

(assert (=> b!333113 (= (apply!264 (+!715 lt!159238 (tuple2!4915 lt!159248 zeroValue!1467)) lt!159249) (apply!264 lt!159238 lt!159249))))

(declare-fun lt!159244 () Unit!10341)

(assert (=> b!333113 (= lt!159244 lt!159242)))

(declare-fun lt!159243 () ListLongMap!3829)

(assert (=> b!333113 (= lt!159243 (getCurrentListMapNoExtraKeys!580 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159250 () (_ BitVec 64))

(assert (=> b!333113 (= lt!159250 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159256 () (_ BitVec 64))

(assert (=> b!333113 (= lt!159256 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!333113 (= lt!159252 (addApplyDifferent!240 lt!159243 lt!159250 minValue!1467 lt!159256))))

(assert (=> b!333113 (= (apply!264 (+!715 lt!159243 (tuple2!4915 lt!159250 minValue!1467)) lt!159256) (apply!264 lt!159243 lt!159256))))

(declare-fun b!333114 () Bool)

(assert (=> b!333114 (= e!204539 call!26249)))

(assert (= (and d!70593 c!52116) b!333100))

(assert (= (and d!70593 (not c!52116)) b!333110))

(assert (= (and b!333110 c!52114) b!333095))

(assert (= (and b!333110 (not c!52114)) b!333112))

(assert (= (and b!333112 c!52115) b!333099))

(assert (= (and b!333112 (not c!52115)) b!333114))

(assert (= (or b!333099 b!333114) bm!26243))

(assert (= (or b!333095 bm!26243) bm!26240))

(assert (= (or b!333095 b!333099) bm!26245))

(assert (= (or b!333100 bm!26240) bm!26244))

(assert (= (or b!333100 bm!26245) bm!26242))

(assert (= (and d!70593 res!183538) b!333109))

(assert (= (and d!70593 c!52118) b!333113))

(assert (= (and d!70593 (not c!52118)) b!333103))

(assert (= (and d!70593 res!183537) b!333108))

(assert (= (and b!333108 res!183542) b!333096))

(assert (= (and b!333108 (not res!183540)) b!333111))

(assert (= (and b!333111 res!183534) b!333102))

(assert (= (and b!333108 res!183535) b!333094))

(assert (= (and b!333094 c!52113) b!333104))

(assert (= (and b!333094 (not c!52113)) b!333105))

(assert (= (and b!333104 res!183541) b!333106))

(assert (= (or b!333104 b!333105) bm!26241))

(assert (= (and b!333094 res!183536) b!333098))

(assert (= (and b!333098 c!52117) b!333097))

(assert (= (and b!333098 (not c!52117)) b!333107))

(assert (= (and b!333097 res!183539) b!333101))

(assert (= (or b!333097 b!333107) bm!26246))

(declare-fun b_lambda!8417 () Bool)

(assert (=> (not b_lambda!8417) (not b!333102)))

(declare-fun t!9610 () Bool)

(declare-fun tb!3035 () Bool)

(assert (=> (and start!33544 (= defaultEntry!1528 defaultEntry!1528) t!9610) tb!3035))

(declare-fun result!5451 () Bool)

(assert (=> tb!3035 (= result!5451 tp_is_empty!6781)))

(assert (=> b!333102 t!9610))

(declare-fun b_and!14025 () Bool)

(assert (= b_and!14019 (and (=> t!9610 result!5451) b_and!14025)))

(declare-fun m!337679 () Bool)

(assert (=> bm!26244 m!337679))

(declare-fun m!337681 () Bool)

(assert (=> b!333111 m!337681))

(assert (=> b!333111 m!337681))

(declare-fun m!337683 () Bool)

(assert (=> b!333111 m!337683))

(declare-fun m!337685 () Bool)

(assert (=> b!333101 m!337685))

(declare-fun m!337687 () Bool)

(assert (=> bm!26241 m!337687))

(declare-fun m!337689 () Bool)

(assert (=> b!333113 m!337689))

(declare-fun m!337691 () Bool)

(assert (=> b!333113 m!337691))

(declare-fun m!337693 () Bool)

(assert (=> b!333113 m!337693))

(declare-fun m!337695 () Bool)

(assert (=> b!333113 m!337695))

(assert (=> b!333113 m!337689))

(declare-fun m!337697 () Bool)

(assert (=> b!333113 m!337697))

(declare-fun m!337699 () Bool)

(assert (=> b!333113 m!337699))

(declare-fun m!337701 () Bool)

(assert (=> b!333113 m!337701))

(assert (=> b!333113 m!337693))

(assert (=> b!333113 m!337679))

(assert (=> b!333113 m!337681))

(declare-fun m!337703 () Bool)

(assert (=> b!333113 m!337703))

(declare-fun m!337705 () Bool)

(assert (=> b!333113 m!337705))

(assert (=> b!333113 m!337703))

(declare-fun m!337707 () Bool)

(assert (=> b!333113 m!337707))

(declare-fun m!337709 () Bool)

(assert (=> b!333113 m!337709))

(assert (=> b!333113 m!337709))

(declare-fun m!337711 () Bool)

(assert (=> b!333113 m!337711))

(declare-fun m!337713 () Bool)

(assert (=> b!333113 m!337713))

(declare-fun m!337715 () Bool)

(assert (=> b!333113 m!337715))

(declare-fun m!337717 () Bool)

(assert (=> b!333113 m!337717))

(declare-fun m!337719 () Bool)

(assert (=> b!333100 m!337719))

(declare-fun m!337721 () Bool)

(assert (=> bm!26242 m!337721))

(declare-fun m!337723 () Bool)

(assert (=> b!333106 m!337723))

(assert (=> d!70593 m!337617))

(declare-fun m!337725 () Bool)

(assert (=> bm!26246 m!337725))

(assert (=> b!333109 m!337681))

(assert (=> b!333109 m!337681))

(declare-fun m!337727 () Bool)

(assert (=> b!333109 m!337727))

(declare-fun m!337729 () Bool)

(assert (=> b!333102 m!337729))

(declare-fun m!337731 () Bool)

(assert (=> b!333102 m!337731))

(declare-fun m!337733 () Bool)

(assert (=> b!333102 m!337733))

(assert (=> b!333102 m!337729))

(assert (=> b!333102 m!337681))

(declare-fun m!337735 () Bool)

(assert (=> b!333102 m!337735))

(assert (=> b!333102 m!337681))

(assert (=> b!333102 m!337731))

(assert (=> b!333096 m!337681))

(assert (=> b!333096 m!337681))

(assert (=> b!333096 m!337727))

(assert (=> b!332985 d!70593))

(declare-fun b!333129 () Bool)

(declare-fun c!52127 () Bool)

(declare-fun lt!159263 () (_ BitVec 64))

(assert (=> b!333129 (= c!52127 (= lt!159263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!204554 () SeekEntryResult!3100)

(declare-fun e!204552 () SeekEntryResult!3100)

(assert (=> b!333129 (= e!204554 e!204552)))

(declare-fun b!333130 () Bool)

(declare-fun lt!159265 () SeekEntryResult!3100)

(assert (=> b!333130 (= e!204552 (MissingZero!3100 (index!14581 lt!159265)))))

(declare-fun b!333131 () Bool)

(declare-fun e!204553 () SeekEntryResult!3100)

(assert (=> b!333131 (= e!204553 e!204554)))

(assert (=> b!333131 (= lt!159263 (select (arr!8111 _keys!1895) (index!14581 lt!159265)))))

(declare-fun c!52125 () Bool)

(assert (=> b!333131 (= c!52125 (= lt!159263 k0!1348))))

(declare-fun d!70595 () Bool)

(declare-fun lt!159264 () SeekEntryResult!3100)

(assert (=> d!70595 (and (or ((_ is Undefined!3100) lt!159264) (not ((_ is Found!3100) lt!159264)) (and (bvsge (index!14580 lt!159264) #b00000000000000000000000000000000) (bvslt (index!14580 lt!159264) (size!8463 _keys!1895)))) (or ((_ is Undefined!3100) lt!159264) ((_ is Found!3100) lt!159264) (not ((_ is MissingZero!3100) lt!159264)) (and (bvsge (index!14579 lt!159264) #b00000000000000000000000000000000) (bvslt (index!14579 lt!159264) (size!8463 _keys!1895)))) (or ((_ is Undefined!3100) lt!159264) ((_ is Found!3100) lt!159264) ((_ is MissingZero!3100) lt!159264) (not ((_ is MissingVacant!3100) lt!159264)) (and (bvsge (index!14582 lt!159264) #b00000000000000000000000000000000) (bvslt (index!14582 lt!159264) (size!8463 _keys!1895)))) (or ((_ is Undefined!3100) lt!159264) (ite ((_ is Found!3100) lt!159264) (= (select (arr!8111 _keys!1895) (index!14580 lt!159264)) k0!1348) (ite ((_ is MissingZero!3100) lt!159264) (= (select (arr!8111 _keys!1895) (index!14579 lt!159264)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3100) lt!159264) (= (select (arr!8111 _keys!1895) (index!14582 lt!159264)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70595 (= lt!159264 e!204553)))

(declare-fun c!52126 () Bool)

(assert (=> d!70595 (= c!52126 (and ((_ is Intermediate!3100) lt!159265) (undefined!3912 lt!159265)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17158 (_ BitVec 32)) SeekEntryResult!3100)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70595 (= lt!159265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70595 (validMask!0 mask!2385)))

(assert (=> d!70595 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!159264)))

(declare-fun b!333132 () Bool)

(assert (=> b!333132 (= e!204554 (Found!3100 (index!14581 lt!159265)))))

(declare-fun b!333133 () Bool)

(assert (=> b!333133 (= e!204553 Undefined!3100)))

(declare-fun b!333134 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17158 (_ BitVec 32)) SeekEntryResult!3100)

(assert (=> b!333134 (= e!204552 (seekKeyOrZeroReturnVacant!0 (x!33139 lt!159265) (index!14581 lt!159265) (index!14581 lt!159265) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!70595 c!52126) b!333133))

(assert (= (and d!70595 (not c!52126)) b!333131))

(assert (= (and b!333131 c!52125) b!333132))

(assert (= (and b!333131 (not c!52125)) b!333129))

(assert (= (and b!333129 c!52127) b!333130))

(assert (= (and b!333129 (not c!52127)) b!333134))

(declare-fun m!337737 () Bool)

(assert (=> b!333131 m!337737))

(declare-fun m!337739 () Bool)

(assert (=> d!70595 m!337739))

(declare-fun m!337741 () Bool)

(assert (=> d!70595 m!337741))

(assert (=> d!70595 m!337617))

(assert (=> d!70595 m!337739))

(declare-fun m!337743 () Bool)

(assert (=> d!70595 m!337743))

(declare-fun m!337745 () Bool)

(assert (=> d!70595 m!337745))

(declare-fun m!337747 () Bool)

(assert (=> d!70595 m!337747))

(declare-fun m!337749 () Bool)

(assert (=> b!333134 m!337749))

(assert (=> b!332986 d!70595))

(declare-fun d!70597 () Bool)

(assert (=> d!70597 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33544 d!70597))

(declare-fun d!70599 () Bool)

(assert (=> d!70599 (= (array_inv!6036 _values!1525) (bvsge (size!8462 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33544 d!70599))

(declare-fun d!70601 () Bool)

(assert (=> d!70601 (= (array_inv!6037 _keys!1895) (bvsge (size!8463 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33544 d!70601))

(declare-fun b!333145 () Bool)

(declare-fun e!204565 () Bool)

(declare-fun e!204566 () Bool)

(assert (=> b!333145 (= e!204565 e!204566)))

(declare-fun res!183550 () Bool)

(assert (=> b!333145 (=> (not res!183550) (not e!204566))))

(declare-fun e!204563 () Bool)

(assert (=> b!333145 (= res!183550 (not e!204563))))

(declare-fun res!183551 () Bool)

(assert (=> b!333145 (=> (not res!183551) (not e!204563))))

(assert (=> b!333145 (= res!183551 (validKeyInArray!0 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333146 () Bool)

(declare-fun e!204564 () Bool)

(declare-fun call!26252 () Bool)

(assert (=> b!333146 (= e!204564 call!26252)))

(declare-fun b!333147 () Bool)

(declare-fun contains!1993 (List!4529 (_ BitVec 64)) Bool)

(assert (=> b!333147 (= e!204563 (contains!1993 Nil!4526 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70603 () Bool)

(declare-fun res!183549 () Bool)

(assert (=> d!70603 (=> res!183549 e!204565)))

(assert (=> d!70603 (= res!183549 (bvsge #b00000000000000000000000000000000 (size!8463 _keys!1895)))))

(assert (=> d!70603 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4526) e!204565)))

(declare-fun b!333148 () Bool)

(assert (=> b!333148 (= e!204564 call!26252)))

(declare-fun bm!26249 () Bool)

(declare-fun c!52130 () Bool)

(assert (=> bm!26249 (= call!26252 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52130 (Cons!4525 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000) Nil!4526) Nil!4526)))))

(declare-fun b!333149 () Bool)

(assert (=> b!333149 (= e!204566 e!204564)))

(assert (=> b!333149 (= c!52130 (validKeyInArray!0 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70603 (not res!183549)) b!333145))

(assert (= (and b!333145 res!183551) b!333147))

(assert (= (and b!333145 res!183550) b!333149))

(assert (= (and b!333149 c!52130) b!333146))

(assert (= (and b!333149 (not c!52130)) b!333148))

(assert (= (or b!333146 b!333148) bm!26249))

(assert (=> b!333145 m!337681))

(assert (=> b!333145 m!337681))

(assert (=> b!333145 m!337727))

(assert (=> b!333147 m!337681))

(assert (=> b!333147 m!337681))

(declare-fun m!337751 () Bool)

(assert (=> b!333147 m!337751))

(assert (=> bm!26249 m!337681))

(declare-fun m!337753 () Bool)

(assert (=> bm!26249 m!337753))

(assert (=> b!333149 m!337681))

(assert (=> b!333149 m!337681))

(assert (=> b!333149 m!337727))

(assert (=> b!332981 d!70603))

(declare-fun bm!26252 () Bool)

(declare-fun call!26255 () Bool)

(assert (=> bm!26252 (= call!26255 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70605 () Bool)

(declare-fun res!183557 () Bool)

(declare-fun e!204573 () Bool)

(assert (=> d!70605 (=> res!183557 e!204573)))

(assert (=> d!70605 (= res!183557 (bvsge #b00000000000000000000000000000000 (size!8463 _keys!1895)))))

(assert (=> d!70605 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!204573)))

(declare-fun b!333158 () Bool)

(declare-fun e!204575 () Bool)

(declare-fun e!204574 () Bool)

(assert (=> b!333158 (= e!204575 e!204574)))

(declare-fun lt!159274 () (_ BitVec 64))

(assert (=> b!333158 (= lt!159274 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159273 () Unit!10341)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17158 (_ BitVec 64) (_ BitVec 32)) Unit!10341)

(assert (=> b!333158 (= lt!159273 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159274 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333158 (arrayContainsKey!0 _keys!1895 lt!159274 #b00000000000000000000000000000000)))

(declare-fun lt!159272 () Unit!10341)

(assert (=> b!333158 (= lt!159272 lt!159273)))

(declare-fun res!183556 () Bool)

(assert (=> b!333158 (= res!183556 (= (seekEntryOrOpen!0 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3100 #b00000000000000000000000000000000)))))

(assert (=> b!333158 (=> (not res!183556) (not e!204574))))

(declare-fun b!333159 () Bool)

(assert (=> b!333159 (= e!204575 call!26255)))

(declare-fun b!333160 () Bool)

(assert (=> b!333160 (= e!204573 e!204575)))

(declare-fun c!52133 () Bool)

(assert (=> b!333160 (= c!52133 (validKeyInArray!0 (select (arr!8111 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333161 () Bool)

(assert (=> b!333161 (= e!204574 call!26255)))

(assert (= (and d!70605 (not res!183557)) b!333160))

(assert (= (and b!333160 c!52133) b!333158))

(assert (= (and b!333160 (not c!52133)) b!333159))

(assert (= (and b!333158 res!183556) b!333161))

(assert (= (or b!333161 b!333159) bm!26252))

(declare-fun m!337755 () Bool)

(assert (=> bm!26252 m!337755))

(assert (=> b!333158 m!337681))

(declare-fun m!337757 () Bool)

(assert (=> b!333158 m!337757))

(declare-fun m!337759 () Bool)

(assert (=> b!333158 m!337759))

(assert (=> b!333158 m!337681))

(declare-fun m!337761 () Bool)

(assert (=> b!333158 m!337761))

(assert (=> b!333160 m!337681))

(assert (=> b!333160 m!337681))

(assert (=> b!333160 m!337727))

(assert (=> b!332982 d!70605))

(declare-fun d!70607 () Bool)

(assert (=> d!70607 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!332987 d!70607))

(declare-fun b!333169 () Bool)

(declare-fun e!204581 () Bool)

(assert (=> b!333169 (= e!204581 tp_is_empty!6781)))

(declare-fun mapIsEmpty!11571 () Bool)

(declare-fun mapRes!11571 () Bool)

(assert (=> mapIsEmpty!11571 mapRes!11571))

(declare-fun b!333168 () Bool)

(declare-fun e!204580 () Bool)

(assert (=> b!333168 (= e!204580 tp_is_empty!6781)))

(declare-fun mapNonEmpty!11571 () Bool)

(declare-fun tp!24000 () Bool)

(assert (=> mapNonEmpty!11571 (= mapRes!11571 (and tp!24000 e!204580))))

(declare-fun mapRest!11571 () (Array (_ BitVec 32) ValueCell!3047))

(declare-fun mapKey!11571 () (_ BitVec 32))

(declare-fun mapValue!11571 () ValueCell!3047)

(assert (=> mapNonEmpty!11571 (= mapRest!11562 (store mapRest!11571 mapKey!11571 mapValue!11571))))

(declare-fun condMapEmpty!11571 () Bool)

(declare-fun mapDefault!11571 () ValueCell!3047)

(assert (=> mapNonEmpty!11562 (= condMapEmpty!11571 (= mapRest!11562 ((as const (Array (_ BitVec 32) ValueCell!3047)) mapDefault!11571)))))

(assert (=> mapNonEmpty!11562 (= tp!23985 (and e!204581 mapRes!11571))))

(assert (= (and mapNonEmpty!11562 condMapEmpty!11571) mapIsEmpty!11571))

(assert (= (and mapNonEmpty!11562 (not condMapEmpty!11571)) mapNonEmpty!11571))

(assert (= (and mapNonEmpty!11571 ((_ is ValueCellFull!3047) mapValue!11571)) b!333168))

(assert (= (and mapNonEmpty!11562 ((_ is ValueCellFull!3047) mapDefault!11571)) b!333169))

(declare-fun m!337763 () Bool)

(assert (=> mapNonEmpty!11571 m!337763))

(declare-fun b_lambda!8419 () Bool)

(assert (= b_lambda!8417 (or (and start!33544 b_free!6829) b_lambda!8419)))

(check-sat (not bm!26244) (not d!70595) (not b_next!6829) (not b!333149) (not b!333101) (not d!70593) (not bm!26252) tp_is_empty!6781 (not b!333134) (not b!333111) (not b!333051) (not b!333106) (not d!70591) (not bm!26246) (not b!333096) (not b_lambda!8419) (not b!333049) (not bm!26249) (not b!333145) (not bm!26241) (not b!333100) (not b!333113) b_and!14025 (not b!333147) (not mapNonEmpty!11571) (not b!333160) (not b!333102) (not b!333109) (not b!333158) (not bm!26242))
(check-sat b_and!14025 (not b_next!6829))
