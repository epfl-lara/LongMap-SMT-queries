; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34332 () Bool)

(assert start!34332)

(declare-fun b_free!7321 () Bool)

(declare-fun b_next!7321 () Bool)

(assert (=> start!34332 (= b_free!7321 (not b_next!7321))))

(declare-fun tp!25503 () Bool)

(declare-fun b_and!14499 () Bool)

(assert (=> start!34332 (= tp!25503 b_and!14499)))

(declare-fun b!342748 () Bool)

(declare-fun res!189509 () Bool)

(declare-fun e!210157 () Bool)

(assert (=> b!342748 (=> (not res!189509) (not e!210157))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342748 (= res!189509 (validKeyInArray!0 k0!1348))))

(declare-fun b!342749 () Bool)

(declare-fun e!210156 () Bool)

(declare-fun e!210162 () Bool)

(assert (=> b!342749 (= e!210156 e!210162)))

(declare-fun res!189502 () Bool)

(assert (=> b!342749 (=> (not res!189502) (not e!210162))))

(declare-fun lt!162069 () Bool)

(assert (=> b!342749 (= res!189502 (not lt!162069))))

(declare-datatypes ((Unit!10683 0))(
  ( (Unit!10684) )
))
(declare-fun lt!162071 () Unit!10683)

(declare-fun e!210158 () Unit!10683)

(assert (=> b!342749 (= lt!162071 e!210158)))

(declare-fun c!52790 () Bool)

(assert (=> b!342749 (= c!52790 lt!162069)))

(declare-datatypes ((array!18125 0))(
  ( (array!18126 (arr!8581 (Array (_ BitVec 32) (_ BitVec 64))) (size!8934 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18125)

(declare-fun arrayContainsKey!0 (array!18125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342749 (= lt!162069 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!342750 () Bool)

(declare-fun res!189506 () Bool)

(assert (=> b!342750 (=> (not res!189506) (not e!210157))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18125 (_ BitVec 32)) Bool)

(assert (=> b!342750 (= res!189506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12342 () Bool)

(declare-fun mapRes!12342 () Bool)

(assert (=> mapIsEmpty!12342 mapRes!12342))

(declare-fun b!342751 () Bool)

(declare-fun res!189507 () Bool)

(assert (=> b!342751 (=> (not res!189507) (not e!210162))))

(declare-datatypes ((SeekEntryResult!3306 0))(
  ( (MissingZero!3306 (index!15403 (_ BitVec 32))) (Found!3306 (index!15404 (_ BitVec 32))) (Intermediate!3306 (undefined!4118 Bool) (index!15405 (_ BitVec 32)) (x!34139 (_ BitVec 32))) (Undefined!3306) (MissingVacant!3306 (index!15406 (_ BitVec 32))) )
))
(declare-fun lt!162072 () SeekEntryResult!3306)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!342751 (= res!189507 (inRange!0 (index!15406 lt!162072) mask!2385))))

(declare-fun res!189503 () Bool)

(assert (=> start!34332 (=> (not res!189503) (not e!210157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34332 (= res!189503 (validMask!0 mask!2385))))

(assert (=> start!34332 e!210157))

(assert (=> start!34332 true))

(declare-fun tp_is_empty!7273 () Bool)

(assert (=> start!34332 tp_is_empty!7273))

(assert (=> start!34332 tp!25503))

(declare-datatypes ((V!10675 0))(
  ( (V!10676 (val!3681 Int)) )
))
(declare-datatypes ((ValueCell!3293 0))(
  ( (ValueCellFull!3293 (v!5849 V!10675)) (EmptyCell!3293) )
))
(declare-datatypes ((array!18127 0))(
  ( (array!18128 (arr!8582 (Array (_ BitVec 32) ValueCell!3293)) (size!8935 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18127)

(declare-fun e!210160 () Bool)

(declare-fun array_inv!6380 (array!18127) Bool)

(assert (=> start!34332 (and (array_inv!6380 _values!1525) e!210160)))

(declare-fun array_inv!6381 (array!18125) Bool)

(assert (=> start!34332 (array_inv!6381 _keys!1895)))

(declare-fun b!342752 () Bool)

(declare-fun e!210159 () Bool)

(assert (=> b!342752 (= e!210160 (and e!210159 mapRes!12342))))

(declare-fun condMapEmpty!12342 () Bool)

(declare-fun mapDefault!12342 () ValueCell!3293)

(assert (=> b!342752 (= condMapEmpty!12342 (= (arr!8582 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3293)) mapDefault!12342)))))

(declare-fun b!342753 () Bool)

(declare-fun e!210161 () Bool)

(assert (=> b!342753 (= e!210161 tp_is_empty!7273)))

(declare-fun b!342754 () Bool)

(assert (=> b!342754 (= e!210157 e!210156)))

(declare-fun res!189501 () Bool)

(assert (=> b!342754 (=> (not res!189501) (not e!210156))))

(get-info :version)

(assert (=> b!342754 (= res!189501 (and (not ((_ is Found!3306) lt!162072)) (not ((_ is MissingZero!3306) lt!162072)) ((_ is MissingVacant!3306) lt!162072)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18125 (_ BitVec 32)) SeekEntryResult!3306)

(assert (=> b!342754 (= lt!162072 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342755 () Bool)

(assert (=> b!342755 (= e!210162 (and (= (select (arr!8581 _keys!1895) (index!15406 lt!162072)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!8934 _keys!1895))))))

(declare-fun mapNonEmpty!12342 () Bool)

(declare-fun tp!25502 () Bool)

(assert (=> mapNonEmpty!12342 (= mapRes!12342 (and tp!25502 e!210161))))

(declare-fun mapRest!12342 () (Array (_ BitVec 32) ValueCell!3293))

(declare-fun mapKey!12342 () (_ BitVec 32))

(declare-fun mapValue!12342 () ValueCell!3293)

(assert (=> mapNonEmpty!12342 (= (arr!8582 _values!1525) (store mapRest!12342 mapKey!12342 mapValue!12342))))

(declare-fun b!342756 () Bool)

(declare-fun Unit!10685 () Unit!10683)

(assert (=> b!342756 (= e!210158 Unit!10685)))

(declare-fun b!342757 () Bool)

(declare-fun res!189508 () Bool)

(assert (=> b!342757 (=> (not res!189508) (not e!210157))))

(declare-datatypes ((List!4904 0))(
  ( (Nil!4901) (Cons!4900 (h!5756 (_ BitVec 64)) (t!10007 List!4904)) )
))
(declare-fun arrayNoDuplicates!0 (array!18125 (_ BitVec 32) List!4904) Bool)

(assert (=> b!342757 (= res!189508 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4901))))

(declare-fun b!342758 () Bool)

(declare-fun Unit!10686 () Unit!10683)

(assert (=> b!342758 (= e!210158 Unit!10686)))

(declare-fun zeroValue!1467 () V!10675)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!162070 () Unit!10683)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10675)

(declare-fun lemmaArrayContainsKeyThenInListMap!312 (array!18125 array!18127 (_ BitVec 32) (_ BitVec 32) V!10675 V!10675 (_ BitVec 64) (_ BitVec 32) Int) Unit!10683)

(declare-fun arrayScanForKey!0 (array!18125 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342758 (= lt!162070 (lemmaArrayContainsKeyThenInListMap!312 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342758 false))

(declare-fun b!342759 () Bool)

(declare-fun res!189504 () Bool)

(assert (=> b!342759 (=> (not res!189504) (not e!210157))))

(declare-datatypes ((tuple2!5284 0))(
  ( (tuple2!5285 (_1!2653 (_ BitVec 64)) (_2!2653 V!10675)) )
))
(declare-datatypes ((List!4905 0))(
  ( (Nil!4902) (Cons!4901 (h!5757 tuple2!5284) (t!10008 List!4905)) )
))
(declare-datatypes ((ListLongMap!4187 0))(
  ( (ListLongMap!4188 (toList!2109 List!4905)) )
))
(declare-fun contains!2176 (ListLongMap!4187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1615 (array!18125 array!18127 (_ BitVec 32) (_ BitVec 32) V!10675 V!10675 (_ BitVec 32) Int) ListLongMap!4187)

(assert (=> b!342759 (= res!189504 (not (contains!2176 (getCurrentListMap!1615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342760 () Bool)

(declare-fun res!189505 () Bool)

(assert (=> b!342760 (=> (not res!189505) (not e!210157))))

(assert (=> b!342760 (= res!189505 (and (= (size!8935 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8934 _keys!1895) (size!8935 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342761 () Bool)

(assert (=> b!342761 (= e!210159 tp_is_empty!7273)))

(assert (= (and start!34332 res!189503) b!342760))

(assert (= (and b!342760 res!189505) b!342750))

(assert (= (and b!342750 res!189506) b!342757))

(assert (= (and b!342757 res!189508) b!342748))

(assert (= (and b!342748 res!189509) b!342759))

(assert (= (and b!342759 res!189504) b!342754))

(assert (= (and b!342754 res!189501) b!342749))

(assert (= (and b!342749 c!52790) b!342758))

(assert (= (and b!342749 (not c!52790)) b!342756))

(assert (= (and b!342749 res!189502) b!342751))

(assert (= (and b!342751 res!189507) b!342755))

(assert (= (and b!342752 condMapEmpty!12342) mapIsEmpty!12342))

(assert (= (and b!342752 (not condMapEmpty!12342)) mapNonEmpty!12342))

(assert (= (and mapNonEmpty!12342 ((_ is ValueCellFull!3293) mapValue!12342)) b!342753))

(assert (= (and b!342752 ((_ is ValueCellFull!3293) mapDefault!12342)) b!342761))

(assert (= start!34332 b!342752))

(declare-fun m!344283 () Bool)

(assert (=> b!342748 m!344283))

(declare-fun m!344285 () Bool)

(assert (=> start!34332 m!344285))

(declare-fun m!344287 () Bool)

(assert (=> start!34332 m!344287))

(declare-fun m!344289 () Bool)

(assert (=> start!34332 m!344289))

(declare-fun m!344291 () Bool)

(assert (=> b!342749 m!344291))

(declare-fun m!344293 () Bool)

(assert (=> b!342751 m!344293))

(declare-fun m!344295 () Bool)

(assert (=> b!342757 m!344295))

(declare-fun m!344297 () Bool)

(assert (=> b!342758 m!344297))

(assert (=> b!342758 m!344297))

(declare-fun m!344299 () Bool)

(assert (=> b!342758 m!344299))

(declare-fun m!344301 () Bool)

(assert (=> b!342759 m!344301))

(assert (=> b!342759 m!344301))

(declare-fun m!344303 () Bool)

(assert (=> b!342759 m!344303))

(declare-fun m!344305 () Bool)

(assert (=> b!342750 m!344305))

(declare-fun m!344307 () Bool)

(assert (=> mapNonEmpty!12342 m!344307))

(declare-fun m!344309 () Bool)

(assert (=> b!342754 m!344309))

(declare-fun m!344311 () Bool)

(assert (=> b!342755 m!344311))

(check-sat (not b_next!7321) (not b!342749) b_and!14499 (not b!342757) (not b!342748) tp_is_empty!7273 (not start!34332) (not b!342750) (not b!342759) (not b!342758) (not b!342751) (not mapNonEmpty!12342) (not b!342754))
(check-sat b_and!14499 (not b_next!7321))
(get-model)

(declare-fun d!70817 () Bool)

(assert (=> d!70817 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!342748 d!70817))

(declare-fun b!342856 () Bool)

(declare-fun e!210220 () Bool)

(declare-fun call!26597 () Bool)

(assert (=> b!342856 (= e!210220 call!26597)))

(declare-fun d!70819 () Bool)

(declare-fun res!189571 () Bool)

(declare-fun e!210221 () Bool)

(assert (=> d!70819 (=> res!189571 e!210221)))

(assert (=> d!70819 (= res!189571 (bvsge #b00000000000000000000000000000000 (size!8934 _keys!1895)))))

(assert (=> d!70819 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4901) e!210221)))

(declare-fun b!342857 () Bool)

(assert (=> b!342857 (= e!210220 call!26597)))

(declare-fun b!342858 () Bool)

(declare-fun e!210223 () Bool)

(declare-fun contains!2179 (List!4904 (_ BitVec 64)) Bool)

(assert (=> b!342858 (= e!210223 (contains!2179 Nil!4901 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!342859 () Bool)

(declare-fun e!210222 () Bool)

(assert (=> b!342859 (= e!210222 e!210220)))

(declare-fun c!52799 () Bool)

(assert (=> b!342859 (= c!52799 (validKeyInArray!0 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!342860 () Bool)

(assert (=> b!342860 (= e!210221 e!210222)))

(declare-fun res!189572 () Bool)

(assert (=> b!342860 (=> (not res!189572) (not e!210222))))

(assert (=> b!342860 (= res!189572 (not e!210223))))

(declare-fun res!189570 () Bool)

(assert (=> b!342860 (=> (not res!189570) (not e!210223))))

(assert (=> b!342860 (= res!189570 (validKeyInArray!0 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26594 () Bool)

(assert (=> bm!26594 (= call!26597 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52799 (Cons!4900 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000) Nil!4901) Nil!4901)))))

(assert (= (and d!70819 (not res!189571)) b!342860))

(assert (= (and b!342860 res!189570) b!342858))

(assert (= (and b!342860 res!189572) b!342859))

(assert (= (and b!342859 c!52799) b!342857))

(assert (= (and b!342859 (not c!52799)) b!342856))

(assert (= (or b!342857 b!342856) bm!26594))

(declare-fun m!344373 () Bool)

(assert (=> b!342858 m!344373))

(assert (=> b!342858 m!344373))

(declare-fun m!344375 () Bool)

(assert (=> b!342858 m!344375))

(assert (=> b!342859 m!344373))

(assert (=> b!342859 m!344373))

(declare-fun m!344377 () Bool)

(assert (=> b!342859 m!344377))

(assert (=> b!342860 m!344373))

(assert (=> b!342860 m!344373))

(assert (=> b!342860 m!344377))

(assert (=> bm!26594 m!344373))

(declare-fun m!344379 () Bool)

(assert (=> bm!26594 m!344379))

(assert (=> b!342757 d!70819))

(declare-fun d!70821 () Bool)

(assert (=> d!70821 (= (inRange!0 (index!15406 lt!162072) mask!2385) (and (bvsge (index!15406 lt!162072) #b00000000000000000000000000000000) (bvslt (index!15406 lt!162072) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!342751 d!70821))

(declare-fun b!342869 () Bool)

(declare-fun e!210232 () Bool)

(declare-fun call!26600 () Bool)

(assert (=> b!342869 (= e!210232 call!26600)))

(declare-fun b!342870 () Bool)

(declare-fun e!210230 () Bool)

(assert (=> b!342870 (= e!210230 e!210232)))

(declare-fun lt!162104 () (_ BitVec 64))

(assert (=> b!342870 (= lt!162104 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162103 () Unit!10683)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18125 (_ BitVec 64) (_ BitVec 32)) Unit!10683)

(assert (=> b!342870 (= lt!162103 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162104 #b00000000000000000000000000000000))))

(assert (=> b!342870 (arrayContainsKey!0 _keys!1895 lt!162104 #b00000000000000000000000000000000)))

(declare-fun lt!162105 () Unit!10683)

(assert (=> b!342870 (= lt!162105 lt!162103)))

(declare-fun res!189578 () Bool)

(assert (=> b!342870 (= res!189578 (= (seekEntryOrOpen!0 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3306 #b00000000000000000000000000000000)))))

(assert (=> b!342870 (=> (not res!189578) (not e!210232))))

(declare-fun b!342871 () Bool)

(declare-fun e!210231 () Bool)

(assert (=> b!342871 (= e!210231 e!210230)))

(declare-fun c!52802 () Bool)

(assert (=> b!342871 (= c!52802 (validKeyInArray!0 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!342872 () Bool)

(assert (=> b!342872 (= e!210230 call!26600)))

(declare-fun bm!26597 () Bool)

(assert (=> bm!26597 (= call!26600 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70823 () Bool)

(declare-fun res!189577 () Bool)

(assert (=> d!70823 (=> res!189577 e!210231)))

(assert (=> d!70823 (= res!189577 (bvsge #b00000000000000000000000000000000 (size!8934 _keys!1895)))))

(assert (=> d!70823 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!210231)))

(assert (= (and d!70823 (not res!189577)) b!342871))

(assert (= (and b!342871 c!52802) b!342870))

(assert (= (and b!342871 (not c!52802)) b!342872))

(assert (= (and b!342870 res!189578) b!342869))

(assert (= (or b!342869 b!342872) bm!26597))

(assert (=> b!342870 m!344373))

(declare-fun m!344381 () Bool)

(assert (=> b!342870 m!344381))

(declare-fun m!344383 () Bool)

(assert (=> b!342870 m!344383))

(assert (=> b!342870 m!344373))

(declare-fun m!344385 () Bool)

(assert (=> b!342870 m!344385))

(assert (=> b!342871 m!344373))

(assert (=> b!342871 m!344373))

(assert (=> b!342871 m!344377))

(declare-fun m!344387 () Bool)

(assert (=> bm!26597 m!344387))

(assert (=> b!342750 d!70823))

(declare-fun d!70825 () Bool)

(declare-fun e!210237 () Bool)

(assert (=> d!70825 e!210237))

(declare-fun res!189581 () Bool)

(assert (=> d!70825 (=> res!189581 e!210237)))

(declare-fun lt!162116 () Bool)

(assert (=> d!70825 (= res!189581 (not lt!162116))))

(declare-fun lt!162115 () Bool)

(assert (=> d!70825 (= lt!162116 lt!162115)))

(declare-fun lt!162114 () Unit!10683)

(declare-fun e!210238 () Unit!10683)

(assert (=> d!70825 (= lt!162114 e!210238)))

(declare-fun c!52805 () Bool)

(assert (=> d!70825 (= c!52805 lt!162115)))

(declare-fun containsKey!326 (List!4905 (_ BitVec 64)) Bool)

(assert (=> d!70825 (= lt!162115 (containsKey!326 (toList!2109 (getCurrentListMap!1615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70825 (= (contains!2176 (getCurrentListMap!1615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162116)))

(declare-fun b!342879 () Bool)

(declare-fun lt!162117 () Unit!10683)

(assert (=> b!342879 (= e!210238 lt!162117)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!275 (List!4905 (_ BitVec 64)) Unit!10683)

(assert (=> b!342879 (= lt!162117 (lemmaContainsKeyImpliesGetValueByKeyDefined!275 (toList!2109 (getCurrentListMap!1615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!340 0))(
  ( (Some!339 (v!5852 V!10675)) (None!338) )
))
(declare-fun isDefined!276 (Option!340) Bool)

(declare-fun getValueByKey!334 (List!4905 (_ BitVec 64)) Option!340)

(assert (=> b!342879 (isDefined!276 (getValueByKey!334 (toList!2109 (getCurrentListMap!1615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!342880 () Bool)

(declare-fun Unit!10695 () Unit!10683)

(assert (=> b!342880 (= e!210238 Unit!10695)))

(declare-fun b!342881 () Bool)

(assert (=> b!342881 (= e!210237 (isDefined!276 (getValueByKey!334 (toList!2109 (getCurrentListMap!1615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70825 c!52805) b!342879))

(assert (= (and d!70825 (not c!52805)) b!342880))

(assert (= (and d!70825 (not res!189581)) b!342881))

(declare-fun m!344389 () Bool)

(assert (=> d!70825 m!344389))

(declare-fun m!344391 () Bool)

(assert (=> b!342879 m!344391))

(declare-fun m!344393 () Bool)

(assert (=> b!342879 m!344393))

(assert (=> b!342879 m!344393))

(declare-fun m!344395 () Bool)

(assert (=> b!342879 m!344395))

(assert (=> b!342881 m!344393))

(assert (=> b!342881 m!344393))

(assert (=> b!342881 m!344395))

(assert (=> b!342759 d!70825))

(declare-fun b!342924 () Bool)

(declare-fun e!210269 () Bool)

(declare-fun e!210271 () Bool)

(assert (=> b!342924 (= e!210269 e!210271)))

(declare-fun res!189601 () Bool)

(assert (=> b!342924 (=> (not res!189601) (not e!210271))))

(declare-fun lt!162178 () ListLongMap!4187)

(assert (=> b!342924 (= res!189601 (contains!2176 lt!162178 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!342924 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8934 _keys!1895)))))

(declare-fun bm!26612 () Bool)

(declare-fun call!26615 () ListLongMap!4187)

(declare-fun call!26621 () ListLongMap!4187)

(assert (=> bm!26612 (= call!26615 call!26621)))

(declare-fun b!342925 () Bool)

(declare-fun e!210270 () Bool)

(declare-fun e!210272 () Bool)

(assert (=> b!342925 (= e!210270 e!210272)))

(declare-fun res!189600 () Bool)

(declare-fun call!26616 () Bool)

(assert (=> b!342925 (= res!189600 call!26616)))

(assert (=> b!342925 (=> (not res!189600) (not e!210272))))

(declare-fun b!342926 () Bool)

(declare-fun apply!278 (ListLongMap!4187 (_ BitVec 64)) V!10675)

(declare-fun get!4642 (ValueCell!3293 V!10675) V!10675)

(declare-fun dynLambda!612 (Int (_ BitVec 64)) V!10675)

(assert (=> b!342926 (= e!210271 (= (apply!278 lt!162178 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000)) (get!4642 (select (arr!8582 _values!1525) #b00000000000000000000000000000000) (dynLambda!612 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!342926 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8935 _values!1525)))))

(assert (=> b!342926 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8934 _keys!1895)))))

(declare-fun b!342927 () Bool)

(declare-fun e!210273 () Bool)

(declare-fun e!210265 () Bool)

(assert (=> b!342927 (= e!210273 e!210265)))

(declare-fun res!189607 () Bool)

(declare-fun call!26617 () Bool)

(assert (=> b!342927 (= res!189607 call!26617)))

(assert (=> b!342927 (=> (not res!189607) (not e!210265))))

(declare-fun b!342928 () Bool)

(declare-fun c!52818 () Bool)

(assert (=> b!342928 (= c!52818 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!210268 () ListLongMap!4187)

(declare-fun e!210274 () ListLongMap!4187)

(assert (=> b!342928 (= e!210268 e!210274)))

(declare-fun b!342929 () Bool)

(assert (=> b!342929 (= e!210274 call!26615)))

(declare-fun b!342930 () Bool)

(declare-fun e!210266 () ListLongMap!4187)

(assert (=> b!342930 (= e!210266 e!210268)))

(declare-fun c!52823 () Bool)

(assert (=> b!342930 (= c!52823 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26613 () Bool)

(assert (=> bm!26613 (= call!26616 (contains!2176 lt!162178 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!342931 () Bool)

(declare-fun e!210267 () Bool)

(assert (=> b!342931 (= e!210267 (validKeyInArray!0 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!342932 () Bool)

(declare-fun e!210277 () Bool)

(assert (=> b!342932 (= e!210277 (validKeyInArray!0 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26614 () Bool)

(declare-fun call!26620 () ListLongMap!4187)

(declare-fun getCurrentListMapNoExtraKeys!594 (array!18125 array!18127 (_ BitVec 32) (_ BitVec 32) V!10675 V!10675 (_ BitVec 32) Int) ListLongMap!4187)

(assert (=> bm!26614 (= call!26620 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun d!70827 () Bool)

(declare-fun e!210275 () Bool)

(assert (=> d!70827 e!210275))

(declare-fun res!189605 () Bool)

(assert (=> d!70827 (=> (not res!189605) (not e!210275))))

(assert (=> d!70827 (= res!189605 (or (bvsge #b00000000000000000000000000000000 (size!8934 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8934 _keys!1895)))))))

(declare-fun lt!162173 () ListLongMap!4187)

(assert (=> d!70827 (= lt!162178 lt!162173)))

(declare-fun lt!162168 () Unit!10683)

(declare-fun e!210276 () Unit!10683)

(assert (=> d!70827 (= lt!162168 e!210276)))

(declare-fun c!52820 () Bool)

(assert (=> d!70827 (= c!52820 e!210267)))

(declare-fun res!189604 () Bool)

(assert (=> d!70827 (=> (not res!189604) (not e!210267))))

(assert (=> d!70827 (= res!189604 (bvslt #b00000000000000000000000000000000 (size!8934 _keys!1895)))))

(assert (=> d!70827 (= lt!162173 e!210266)))

(declare-fun c!52819 () Bool)

(assert (=> d!70827 (= c!52819 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70827 (validMask!0 mask!2385)))

(assert (=> d!70827 (= (getCurrentListMap!1615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162178)))

(declare-fun b!342933 () Bool)

(declare-fun call!26618 () ListLongMap!4187)

(assert (=> b!342933 (= e!210274 call!26618)))

(declare-fun b!342934 () Bool)

(declare-fun lt!162163 () Unit!10683)

(assert (=> b!342934 (= e!210276 lt!162163)))

(declare-fun lt!162164 () ListLongMap!4187)

(assert (=> b!342934 (= lt!162164 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162182 () (_ BitVec 64))

(assert (=> b!342934 (= lt!162182 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162170 () (_ BitVec 64))

(assert (=> b!342934 (= lt!162170 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162180 () Unit!10683)

(declare-fun addStillContains!254 (ListLongMap!4187 (_ BitVec 64) V!10675 (_ BitVec 64)) Unit!10683)

(assert (=> b!342934 (= lt!162180 (addStillContains!254 lt!162164 lt!162182 zeroValue!1467 lt!162170))))

(declare-fun +!731 (ListLongMap!4187 tuple2!5284) ListLongMap!4187)

(assert (=> b!342934 (contains!2176 (+!731 lt!162164 (tuple2!5285 lt!162182 zeroValue!1467)) lt!162170)))

(declare-fun lt!162177 () Unit!10683)

(assert (=> b!342934 (= lt!162177 lt!162180)))

(declare-fun lt!162165 () ListLongMap!4187)

(assert (=> b!342934 (= lt!162165 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162162 () (_ BitVec 64))

(assert (=> b!342934 (= lt!162162 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162166 () (_ BitVec 64))

(assert (=> b!342934 (= lt!162166 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162175 () Unit!10683)

(declare-fun addApplyDifferent!254 (ListLongMap!4187 (_ BitVec 64) V!10675 (_ BitVec 64)) Unit!10683)

(assert (=> b!342934 (= lt!162175 (addApplyDifferent!254 lt!162165 lt!162162 minValue!1467 lt!162166))))

(assert (=> b!342934 (= (apply!278 (+!731 lt!162165 (tuple2!5285 lt!162162 minValue!1467)) lt!162166) (apply!278 lt!162165 lt!162166))))

(declare-fun lt!162183 () Unit!10683)

(assert (=> b!342934 (= lt!162183 lt!162175)))

(declare-fun lt!162167 () ListLongMap!4187)

(assert (=> b!342934 (= lt!162167 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162172 () (_ BitVec 64))

(assert (=> b!342934 (= lt!162172 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162171 () (_ BitVec 64))

(assert (=> b!342934 (= lt!162171 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162174 () Unit!10683)

(assert (=> b!342934 (= lt!162174 (addApplyDifferent!254 lt!162167 lt!162172 zeroValue!1467 lt!162171))))

(assert (=> b!342934 (= (apply!278 (+!731 lt!162167 (tuple2!5285 lt!162172 zeroValue!1467)) lt!162171) (apply!278 lt!162167 lt!162171))))

(declare-fun lt!162169 () Unit!10683)

(assert (=> b!342934 (= lt!162169 lt!162174)))

(declare-fun lt!162179 () ListLongMap!4187)

(assert (=> b!342934 (= lt!162179 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162181 () (_ BitVec 64))

(assert (=> b!342934 (= lt!162181 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162176 () (_ BitVec 64))

(assert (=> b!342934 (= lt!162176 (select (arr!8581 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!342934 (= lt!162163 (addApplyDifferent!254 lt!162179 lt!162181 minValue!1467 lt!162176))))

(assert (=> b!342934 (= (apply!278 (+!731 lt!162179 (tuple2!5285 lt!162181 minValue!1467)) lt!162176) (apply!278 lt!162179 lt!162176))))

(declare-fun b!342935 () Bool)

(declare-fun res!189603 () Bool)

(assert (=> b!342935 (=> (not res!189603) (not e!210275))))

(assert (=> b!342935 (= res!189603 e!210269)))

(declare-fun res!189608 () Bool)

(assert (=> b!342935 (=> res!189608 e!210269)))

(assert (=> b!342935 (= res!189608 (not e!210277))))

(declare-fun res!189602 () Bool)

(assert (=> b!342935 (=> (not res!189602) (not e!210277))))

(assert (=> b!342935 (= res!189602 (bvslt #b00000000000000000000000000000000 (size!8934 _keys!1895)))))

(declare-fun b!342936 () Bool)

(assert (=> b!342936 (= e!210275 e!210270)))

(declare-fun c!52821 () Bool)

(assert (=> b!342936 (= c!52821 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26615 () Bool)

(declare-fun call!26619 () ListLongMap!4187)

(assert (=> bm!26615 (= call!26619 (+!731 (ite c!52819 call!26620 (ite c!52823 call!26621 call!26615)) (ite (or c!52819 c!52823) (tuple2!5285 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5285 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!342937 () Bool)

(assert (=> b!342937 (= e!210272 (= (apply!278 lt!162178 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26616 () Bool)

(assert (=> bm!26616 (= call!26621 call!26620)))

(declare-fun b!342938 () Bool)

(declare-fun Unit!10696 () Unit!10683)

(assert (=> b!342938 (= e!210276 Unit!10696)))

(declare-fun b!342939 () Bool)

(declare-fun res!189606 () Bool)

(assert (=> b!342939 (=> (not res!189606) (not e!210275))))

(assert (=> b!342939 (= res!189606 e!210273)))

(declare-fun c!52822 () Bool)

(assert (=> b!342939 (= c!52822 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!342940 () Bool)

(assert (=> b!342940 (= e!210266 (+!731 call!26619 (tuple2!5285 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26617 () Bool)

(assert (=> bm!26617 (= call!26617 (contains!2176 lt!162178 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26618 () Bool)

(assert (=> bm!26618 (= call!26618 call!26619)))

(declare-fun b!342941 () Bool)

(assert (=> b!342941 (= e!210268 call!26618)))

(declare-fun b!342942 () Bool)

(assert (=> b!342942 (= e!210265 (= (apply!278 lt!162178 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!342943 () Bool)

(assert (=> b!342943 (= e!210273 (not call!26617))))

(declare-fun b!342944 () Bool)

(assert (=> b!342944 (= e!210270 (not call!26616))))

(assert (= (and d!70827 c!52819) b!342940))

(assert (= (and d!70827 (not c!52819)) b!342930))

(assert (= (and b!342930 c!52823) b!342941))

(assert (= (and b!342930 (not c!52823)) b!342928))

(assert (= (and b!342928 c!52818) b!342933))

(assert (= (and b!342928 (not c!52818)) b!342929))

(assert (= (or b!342933 b!342929) bm!26612))

(assert (= (or b!342941 bm!26612) bm!26616))

(assert (= (or b!342941 b!342933) bm!26618))

(assert (= (or b!342940 bm!26616) bm!26614))

(assert (= (or b!342940 bm!26618) bm!26615))

(assert (= (and d!70827 res!189604) b!342931))

(assert (= (and d!70827 c!52820) b!342934))

(assert (= (and d!70827 (not c!52820)) b!342938))

(assert (= (and d!70827 res!189605) b!342935))

(assert (= (and b!342935 res!189602) b!342932))

(assert (= (and b!342935 (not res!189608)) b!342924))

(assert (= (and b!342924 res!189601) b!342926))

(assert (= (and b!342935 res!189603) b!342939))

(assert (= (and b!342939 c!52822) b!342927))

(assert (= (and b!342939 (not c!52822)) b!342943))

(assert (= (and b!342927 res!189607) b!342942))

(assert (= (or b!342927 b!342943) bm!26617))

(assert (= (and b!342939 res!189606) b!342936))

(assert (= (and b!342936 c!52821) b!342925))

(assert (= (and b!342936 (not c!52821)) b!342944))

(assert (= (and b!342925 res!189600) b!342937))

(assert (= (or b!342925 b!342944) bm!26613))

(declare-fun b_lambda!8433 () Bool)

(assert (=> (not b_lambda!8433) (not b!342926)))

(declare-fun t!10014 () Bool)

(declare-fun tb!3063 () Bool)

(assert (=> (and start!34332 (= defaultEntry!1528 defaultEntry!1528) t!10014) tb!3063))

(declare-fun result!5535 () Bool)

(assert (=> tb!3063 (= result!5535 tp_is_empty!7273)))

(assert (=> b!342926 t!10014))

(declare-fun b_and!14505 () Bool)

(assert (= b_and!14499 (and (=> t!10014 result!5535) b_and!14505)))

(assert (=> b!342926 m!344373))

(declare-fun m!344397 () Bool)

(assert (=> b!342926 m!344397))

(declare-fun m!344399 () Bool)

(assert (=> b!342926 m!344399))

(declare-fun m!344401 () Bool)

(assert (=> b!342926 m!344401))

(assert (=> b!342926 m!344373))

(declare-fun m!344403 () Bool)

(assert (=> b!342926 m!344403))

(assert (=> b!342926 m!344399))

(assert (=> b!342926 m!344397))

(assert (=> b!342931 m!344373))

(assert (=> b!342931 m!344373))

(assert (=> b!342931 m!344377))

(declare-fun m!344405 () Bool)

(assert (=> bm!26617 m!344405))

(assert (=> b!342932 m!344373))

(assert (=> b!342932 m!344373))

(assert (=> b!342932 m!344377))

(assert (=> b!342924 m!344373))

(assert (=> b!342924 m!344373))

(declare-fun m!344407 () Bool)

(assert (=> b!342924 m!344407))

(declare-fun m!344409 () Bool)

(assert (=> b!342934 m!344409))

(declare-fun m!344411 () Bool)

(assert (=> b!342934 m!344411))

(declare-fun m!344413 () Bool)

(assert (=> b!342934 m!344413))

(declare-fun m!344415 () Bool)

(assert (=> b!342934 m!344415))

(declare-fun m!344417 () Bool)

(assert (=> b!342934 m!344417))

(assert (=> b!342934 m!344373))

(declare-fun m!344419 () Bool)

(assert (=> b!342934 m!344419))

(declare-fun m!344421 () Bool)

(assert (=> b!342934 m!344421))

(declare-fun m!344423 () Bool)

(assert (=> b!342934 m!344423))

(assert (=> b!342934 m!344417))

(declare-fun m!344425 () Bool)

(assert (=> b!342934 m!344425))

(assert (=> b!342934 m!344415))

(declare-fun m!344427 () Bool)

(assert (=> b!342934 m!344427))

(assert (=> b!342934 m!344409))

(declare-fun m!344429 () Bool)

(assert (=> b!342934 m!344429))

(declare-fun m!344431 () Bool)

(assert (=> b!342934 m!344431))

(declare-fun m!344433 () Bool)

(assert (=> b!342934 m!344433))

(declare-fun m!344435 () Bool)

(assert (=> b!342934 m!344435))

(declare-fun m!344437 () Bool)

(assert (=> b!342934 m!344437))

(assert (=> b!342934 m!344431))

(declare-fun m!344439 () Bool)

(assert (=> b!342934 m!344439))

(assert (=> d!70827 m!344285))

(declare-fun m!344441 () Bool)

(assert (=> bm!26615 m!344441))

(declare-fun m!344443 () Bool)

(assert (=> b!342940 m!344443))

(declare-fun m!344445 () Bool)

(assert (=> b!342942 m!344445))

(declare-fun m!344447 () Bool)

(assert (=> bm!26613 m!344447))

(assert (=> bm!26614 m!344419))

(declare-fun m!344449 () Bool)

(assert (=> b!342937 m!344449))

(assert (=> b!342759 d!70827))

(declare-fun d!70829 () Bool)

(assert (=> d!70829 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34332 d!70829))

(declare-fun d!70831 () Bool)

(assert (=> d!70831 (= (array_inv!6380 _values!1525) (bvsge (size!8935 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34332 d!70831))

(declare-fun d!70833 () Bool)

(assert (=> d!70833 (= (array_inv!6381 _keys!1895) (bvsge (size!8934 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34332 d!70833))

(declare-fun d!70835 () Bool)

(declare-fun res!189613 () Bool)

(declare-fun e!210282 () Bool)

(assert (=> d!70835 (=> res!189613 e!210282)))

(assert (=> d!70835 (= res!189613 (= (select (arr!8581 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70835 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!210282)))

(declare-fun b!342951 () Bool)

(declare-fun e!210283 () Bool)

(assert (=> b!342951 (= e!210282 e!210283)))

(declare-fun res!189614 () Bool)

(assert (=> b!342951 (=> (not res!189614) (not e!210283))))

(assert (=> b!342951 (= res!189614 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8934 _keys!1895)))))

(declare-fun b!342952 () Bool)

(assert (=> b!342952 (= e!210283 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70835 (not res!189613)) b!342951))

(assert (= (and b!342951 res!189614) b!342952))

(assert (=> d!70835 m!344373))

(declare-fun m!344451 () Bool)

(assert (=> b!342952 m!344451))

(assert (=> b!342749 d!70835))

(declare-fun d!70837 () Bool)

(assert (=> d!70837 (contains!2176 (getCurrentListMap!1615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!162186 () Unit!10683)

(declare-fun choose!1311 (array!18125 array!18127 (_ BitVec 32) (_ BitVec 32) V!10675 V!10675 (_ BitVec 64) (_ BitVec 32) Int) Unit!10683)

(assert (=> d!70837 (= lt!162186 (choose!1311 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70837 (validMask!0 mask!2385)))

(assert (=> d!70837 (= (lemmaArrayContainsKeyThenInListMap!312 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!162186)))

(declare-fun bs!11732 () Bool)

(assert (= bs!11732 d!70837))

(assert (=> bs!11732 m!344301))

(assert (=> bs!11732 m!344301))

(assert (=> bs!11732 m!344303))

(assert (=> bs!11732 m!344297))

(declare-fun m!344453 () Bool)

(assert (=> bs!11732 m!344453))

(assert (=> bs!11732 m!344285))

(assert (=> b!342758 d!70837))

(declare-fun d!70839 () Bool)

(declare-fun lt!162189 () (_ BitVec 32))

(assert (=> d!70839 (and (or (bvslt lt!162189 #b00000000000000000000000000000000) (bvsge lt!162189 (size!8934 _keys!1895)) (and (bvsge lt!162189 #b00000000000000000000000000000000) (bvslt lt!162189 (size!8934 _keys!1895)))) (bvsge lt!162189 #b00000000000000000000000000000000) (bvslt lt!162189 (size!8934 _keys!1895)) (= (select (arr!8581 _keys!1895) lt!162189) k0!1348))))

(declare-fun e!210286 () (_ BitVec 32))

(assert (=> d!70839 (= lt!162189 e!210286)))

(declare-fun c!52826 () Bool)

(assert (=> d!70839 (= c!52826 (= (select (arr!8581 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70839 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8934 _keys!1895)) (bvslt (size!8934 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70839 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!162189)))

(declare-fun b!342957 () Bool)

(assert (=> b!342957 (= e!210286 #b00000000000000000000000000000000)))

(declare-fun b!342958 () Bool)

(assert (=> b!342958 (= e!210286 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70839 c!52826) b!342957))

(assert (= (and d!70839 (not c!52826)) b!342958))

(declare-fun m!344455 () Bool)

(assert (=> d!70839 m!344455))

(assert (=> d!70839 m!344373))

(declare-fun m!344457 () Bool)

(assert (=> b!342958 m!344457))

(assert (=> b!342758 d!70839))

(declare-fun b!342971 () Bool)

(declare-fun e!210293 () SeekEntryResult!3306)

(declare-fun e!210294 () SeekEntryResult!3306)

(assert (=> b!342971 (= e!210293 e!210294)))

(declare-fun lt!162197 () (_ BitVec 64))

(declare-fun lt!162198 () SeekEntryResult!3306)

(assert (=> b!342971 (= lt!162197 (select (arr!8581 _keys!1895) (index!15405 lt!162198)))))

(declare-fun c!52833 () Bool)

(assert (=> b!342971 (= c!52833 (= lt!162197 k0!1348))))

(declare-fun b!342972 () Bool)

(assert (=> b!342972 (= e!210294 (Found!3306 (index!15405 lt!162198)))))

(declare-fun d!70841 () Bool)

(declare-fun lt!162196 () SeekEntryResult!3306)

(assert (=> d!70841 (and (or ((_ is Undefined!3306) lt!162196) (not ((_ is Found!3306) lt!162196)) (and (bvsge (index!15404 lt!162196) #b00000000000000000000000000000000) (bvslt (index!15404 lt!162196) (size!8934 _keys!1895)))) (or ((_ is Undefined!3306) lt!162196) ((_ is Found!3306) lt!162196) (not ((_ is MissingZero!3306) lt!162196)) (and (bvsge (index!15403 lt!162196) #b00000000000000000000000000000000) (bvslt (index!15403 lt!162196) (size!8934 _keys!1895)))) (or ((_ is Undefined!3306) lt!162196) ((_ is Found!3306) lt!162196) ((_ is MissingZero!3306) lt!162196) (not ((_ is MissingVacant!3306) lt!162196)) (and (bvsge (index!15406 lt!162196) #b00000000000000000000000000000000) (bvslt (index!15406 lt!162196) (size!8934 _keys!1895)))) (or ((_ is Undefined!3306) lt!162196) (ite ((_ is Found!3306) lt!162196) (= (select (arr!8581 _keys!1895) (index!15404 lt!162196)) k0!1348) (ite ((_ is MissingZero!3306) lt!162196) (= (select (arr!8581 _keys!1895) (index!15403 lt!162196)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3306) lt!162196) (= (select (arr!8581 _keys!1895) (index!15406 lt!162196)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70841 (= lt!162196 e!210293)))

(declare-fun c!52834 () Bool)

(assert (=> d!70841 (= c!52834 (and ((_ is Intermediate!3306) lt!162198) (undefined!4118 lt!162198)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18125 (_ BitVec 32)) SeekEntryResult!3306)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70841 (= lt!162198 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70841 (validMask!0 mask!2385)))

(assert (=> d!70841 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162196)))

(declare-fun b!342973 () Bool)

(declare-fun e!210295 () SeekEntryResult!3306)

(assert (=> b!342973 (= e!210295 (MissingZero!3306 (index!15405 lt!162198)))))

(declare-fun b!342974 () Bool)

(assert (=> b!342974 (= e!210293 Undefined!3306)))

(declare-fun b!342975 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18125 (_ BitVec 32)) SeekEntryResult!3306)

(assert (=> b!342975 (= e!210295 (seekKeyOrZeroReturnVacant!0 (x!34139 lt!162198) (index!15405 lt!162198) (index!15405 lt!162198) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342976 () Bool)

(declare-fun c!52835 () Bool)

(assert (=> b!342976 (= c!52835 (= lt!162197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!342976 (= e!210294 e!210295)))

(assert (= (and d!70841 c!52834) b!342974))

(assert (= (and d!70841 (not c!52834)) b!342971))

(assert (= (and b!342971 c!52833) b!342972))

(assert (= (and b!342971 (not c!52833)) b!342976))

(assert (= (and b!342976 c!52835) b!342973))

(assert (= (and b!342976 (not c!52835)) b!342975))

(declare-fun m!344459 () Bool)

(assert (=> b!342971 m!344459))

(declare-fun m!344461 () Bool)

(assert (=> d!70841 m!344461))

(declare-fun m!344463 () Bool)

(assert (=> d!70841 m!344463))

(declare-fun m!344465 () Bool)

(assert (=> d!70841 m!344465))

(assert (=> d!70841 m!344285))

(declare-fun m!344467 () Bool)

(assert (=> d!70841 m!344467))

(declare-fun m!344469 () Bool)

(assert (=> d!70841 m!344469))

(assert (=> d!70841 m!344461))

(declare-fun m!344471 () Bool)

(assert (=> b!342975 m!344471))

(assert (=> b!342754 d!70841))

(declare-fun mapNonEmpty!12351 () Bool)

(declare-fun mapRes!12351 () Bool)

(declare-fun tp!25518 () Bool)

(declare-fun e!210301 () Bool)

(assert (=> mapNonEmpty!12351 (= mapRes!12351 (and tp!25518 e!210301))))

(declare-fun mapValue!12351 () ValueCell!3293)

(declare-fun mapRest!12351 () (Array (_ BitVec 32) ValueCell!3293))

(declare-fun mapKey!12351 () (_ BitVec 32))

(assert (=> mapNonEmpty!12351 (= mapRest!12342 (store mapRest!12351 mapKey!12351 mapValue!12351))))

(declare-fun b!342983 () Bool)

(assert (=> b!342983 (= e!210301 tp_is_empty!7273)))

(declare-fun condMapEmpty!12351 () Bool)

(declare-fun mapDefault!12351 () ValueCell!3293)

(assert (=> mapNonEmpty!12342 (= condMapEmpty!12351 (= mapRest!12342 ((as const (Array (_ BitVec 32) ValueCell!3293)) mapDefault!12351)))))

(declare-fun e!210300 () Bool)

(assert (=> mapNonEmpty!12342 (= tp!25502 (and e!210300 mapRes!12351))))

(declare-fun b!342984 () Bool)

(assert (=> b!342984 (= e!210300 tp_is_empty!7273)))

(declare-fun mapIsEmpty!12351 () Bool)

(assert (=> mapIsEmpty!12351 mapRes!12351))

(assert (= (and mapNonEmpty!12342 condMapEmpty!12351) mapIsEmpty!12351))

(assert (= (and mapNonEmpty!12342 (not condMapEmpty!12351)) mapNonEmpty!12351))

(assert (= (and mapNonEmpty!12351 ((_ is ValueCellFull!3293) mapValue!12351)) b!342983))

(assert (= (and mapNonEmpty!12342 ((_ is ValueCellFull!3293) mapDefault!12351)) b!342984))

(declare-fun m!344473 () Bool)

(assert (=> mapNonEmpty!12351 m!344473))

(declare-fun b_lambda!8435 () Bool)

(assert (= b_lambda!8433 (or (and start!34332 b_free!7321) b_lambda!8435)))

(check-sat (not b_next!7321) (not bm!26597) (not b!342934) (not bm!26594) (not b!342940) (not b!342860) (not b!342975) (not d!70825) (not b_lambda!8435) (not b!342924) (not bm!26614) (not b!342858) (not bm!26613) (not b!342958) (not mapNonEmpty!12351) (not b!342952) (not b!342871) (not b!342942) (not bm!26617) (not b!342870) (not d!70837) b_and!14505 (not b!342881) (not d!70827) (not bm!26615) (not b!342932) tp_is_empty!7273 (not b!342937) (not b!342926) (not d!70841) (not b!342931) (not b!342859) (not b!342879))
(check-sat b_and!14505 (not b_next!7321))
