; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111802 () Bool)

(assert start!111802)

(declare-fun b_free!30459 () Bool)

(declare-fun b_next!30459 () Bool)

(assert (=> start!111802 (= b_free!30459 (not b_next!30459))))

(declare-fun tp!106852 () Bool)

(declare-fun b_and!48999 () Bool)

(assert (=> start!111802 (= tp!106852 b_and!48999)))

(declare-datatypes ((array!89466 0))(
  ( (array!89467 (arr!43207 (Array (_ BitVec 32) (_ BitVec 64))) (size!43757 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89466)

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53475 0))(
  ( (V!53476 (val!18214 Int)) )
))
(declare-datatypes ((ValueCell!17241 0))(
  ( (ValueCellFull!17241 (v!20844 V!53475)) (EmptyCell!17241) )
))
(declare-datatypes ((array!89468 0))(
  ( (array!89469 (arr!43208 (Array (_ BitVec 32) ValueCell!17241)) (size!43758 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89468)

(declare-fun minValue!1279 () V!53475)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun e!755284 () Bool)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun b!1324902 () Bool)

(declare-fun zeroValue!1279 () V!53475)

(declare-datatypes ((tuple2!23488 0))(
  ( (tuple2!23489 (_1!11755 (_ BitVec 64)) (_2!11755 V!53475)) )
))
(declare-datatypes ((List!30628 0))(
  ( (Nil!30625) (Cons!30624 (h!31833 tuple2!23488) (t!44558 List!30628)) )
))
(declare-datatypes ((ListLongMap!21145 0))(
  ( (ListLongMap!21146 (toList!10588 List!30628)) )
))
(declare-fun contains!8743 (ListLongMap!21145 (_ BitVec 64)) Bool)

(declare-fun +!4611 (ListLongMap!21145 tuple2!23488) ListLongMap!21145)

(declare-fun getCurrentListMapNoExtraKeys!6249 (array!89466 array!89468 (_ BitVec 32) (_ BitVec 32) V!53475 V!53475 (_ BitVec 32) Int) ListLongMap!21145)

(declare-fun get!21755 (ValueCell!17241 V!53475) V!53475)

(declare-fun dynLambda!3550 (Int (_ BitVec 64)) V!53475)

(assert (=> b!1324902 (= e!755284 (not (contains!8743 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))))

(declare-fun b!1324903 () Bool)

(declare-fun e!755280 () Bool)

(declare-fun e!755282 () Bool)

(declare-fun mapRes!56066 () Bool)

(assert (=> b!1324903 (= e!755280 (and e!755282 mapRes!56066))))

(declare-fun condMapEmpty!56066 () Bool)

(declare-fun mapDefault!56066 () ValueCell!17241)

(assert (=> b!1324903 (= condMapEmpty!56066 (= (arr!43208 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17241)) mapDefault!56066)))))

(declare-fun b!1324904 () Bool)

(declare-fun res!879419 () Bool)

(assert (=> b!1324904 (=> (not res!879419) (not e!755284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89466 (_ BitVec 32)) Bool)

(assert (=> b!1324904 (= res!879419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324905 () Bool)

(declare-fun res!879418 () Bool)

(assert (=> b!1324905 (=> (not res!879418) (not e!755284))))

(declare-fun getCurrentListMap!5584 (array!89466 array!89468 (_ BitVec 32) (_ BitVec 32) V!53475 V!53475 (_ BitVec 32) Int) ListLongMap!21145)

(assert (=> b!1324905 (= res!879418 (contains!8743 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324906 () Bool)

(declare-fun res!879422 () Bool)

(assert (=> b!1324906 (=> (not res!879422) (not e!755284))))

(assert (=> b!1324906 (= res!879422 (and (= (size!43758 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43757 _keys!1609) (size!43758 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324907 () Bool)

(declare-fun tp_is_empty!36279 () Bool)

(assert (=> b!1324907 (= e!755282 tp_is_empty!36279)))

(declare-fun b!1324908 () Bool)

(declare-fun res!879417 () Bool)

(assert (=> b!1324908 (=> (not res!879417) (not e!755284))))

(assert (=> b!1324908 (= res!879417 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43757 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!879415 () Bool)

(assert (=> start!111802 (=> (not res!879415) (not e!755284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111802 (= res!879415 (validMask!0 mask!2019))))

(assert (=> start!111802 e!755284))

(declare-fun array_inv!32613 (array!89466) Bool)

(assert (=> start!111802 (array_inv!32613 _keys!1609)))

(assert (=> start!111802 true))

(assert (=> start!111802 tp_is_empty!36279))

(declare-fun array_inv!32614 (array!89468) Bool)

(assert (=> start!111802 (and (array_inv!32614 _values!1337) e!755280)))

(assert (=> start!111802 tp!106852))

(declare-fun mapIsEmpty!56066 () Bool)

(assert (=> mapIsEmpty!56066 mapRes!56066))

(declare-fun b!1324909 () Bool)

(declare-fun res!879420 () Bool)

(assert (=> b!1324909 (=> (not res!879420) (not e!755284))))

(declare-datatypes ((List!30629 0))(
  ( (Nil!30626) (Cons!30625 (h!31834 (_ BitVec 64)) (t!44559 List!30629)) )
))
(declare-fun arrayNoDuplicates!0 (array!89466 (_ BitVec 32) List!30629) Bool)

(assert (=> b!1324909 (= res!879420 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30626))))

(declare-fun b!1324910 () Bool)

(declare-fun res!879416 () Bool)

(assert (=> b!1324910 (=> (not res!879416) (not e!755284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324910 (= res!879416 (validKeyInArray!0 (select (arr!43207 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!56066 () Bool)

(declare-fun tp!106853 () Bool)

(declare-fun e!755281 () Bool)

(assert (=> mapNonEmpty!56066 (= mapRes!56066 (and tp!106853 e!755281))))

(declare-fun mapRest!56066 () (Array (_ BitVec 32) ValueCell!17241))

(declare-fun mapKey!56066 () (_ BitVec 32))

(declare-fun mapValue!56066 () ValueCell!17241)

(assert (=> mapNonEmpty!56066 (= (arr!43208 _values!1337) (store mapRest!56066 mapKey!56066 mapValue!56066))))

(declare-fun b!1324911 () Bool)

(declare-fun res!879421 () Bool)

(assert (=> b!1324911 (=> (not res!879421) (not e!755284))))

(assert (=> b!1324911 (= res!879421 (not (= (select (arr!43207 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324912 () Bool)

(assert (=> b!1324912 (= e!755281 tp_is_empty!36279)))

(assert (= (and start!111802 res!879415) b!1324906))

(assert (= (and b!1324906 res!879422) b!1324904))

(assert (= (and b!1324904 res!879419) b!1324909))

(assert (= (and b!1324909 res!879420) b!1324908))

(assert (= (and b!1324908 res!879417) b!1324905))

(assert (= (and b!1324905 res!879418) b!1324911))

(assert (= (and b!1324911 res!879421) b!1324910))

(assert (= (and b!1324910 res!879416) b!1324902))

(assert (= (and b!1324903 condMapEmpty!56066) mapIsEmpty!56066))

(assert (= (and b!1324903 (not condMapEmpty!56066)) mapNonEmpty!56066))

(get-info :version)

(assert (= (and mapNonEmpty!56066 ((_ is ValueCellFull!17241) mapValue!56066)) b!1324912))

(assert (= (and b!1324903 ((_ is ValueCellFull!17241) mapDefault!56066)) b!1324907))

(assert (= start!111802 b!1324903))

(declare-fun b_lambda!23707 () Bool)

(assert (=> (not b_lambda!23707) (not b!1324902)))

(declare-fun t!44557 () Bool)

(declare-fun tb!11733 () Bool)

(assert (=> (and start!111802 (= defaultEntry!1340 defaultEntry!1340) t!44557) tb!11733))

(declare-fun result!24521 () Bool)

(assert (=> tb!11733 (= result!24521 tp_is_empty!36279)))

(assert (=> b!1324902 t!44557))

(declare-fun b_and!49001 () Bool)

(assert (= b_and!48999 (and (=> t!44557 result!24521) b_and!49001)))

(declare-fun m!1213611 () Bool)

(assert (=> b!1324902 m!1213611))

(declare-fun m!1213613 () Bool)

(assert (=> b!1324902 m!1213613))

(assert (=> b!1324902 m!1213611))

(declare-fun m!1213615 () Bool)

(assert (=> b!1324902 m!1213615))

(declare-fun m!1213617 () Bool)

(assert (=> b!1324902 m!1213617))

(declare-fun m!1213619 () Bool)

(assert (=> b!1324902 m!1213619))

(declare-fun m!1213621 () Bool)

(assert (=> b!1324902 m!1213621))

(assert (=> b!1324902 m!1213615))

(declare-fun m!1213623 () Bool)

(assert (=> b!1324902 m!1213623))

(declare-fun m!1213625 () Bool)

(assert (=> b!1324902 m!1213625))

(assert (=> b!1324902 m!1213623))

(assert (=> b!1324902 m!1213617))

(assert (=> b!1324902 m!1213621))

(assert (=> b!1324902 m!1213613))

(declare-fun m!1213627 () Bool)

(assert (=> b!1324902 m!1213627))

(declare-fun m!1213629 () Bool)

(assert (=> b!1324904 m!1213629))

(declare-fun m!1213631 () Bool)

(assert (=> start!111802 m!1213631))

(declare-fun m!1213633 () Bool)

(assert (=> start!111802 m!1213633))

(declare-fun m!1213635 () Bool)

(assert (=> start!111802 m!1213635))

(declare-fun m!1213637 () Bool)

(assert (=> b!1324909 m!1213637))

(declare-fun m!1213639 () Bool)

(assert (=> mapNonEmpty!56066 m!1213639))

(declare-fun m!1213641 () Bool)

(assert (=> b!1324905 m!1213641))

(assert (=> b!1324905 m!1213641))

(declare-fun m!1213643 () Bool)

(assert (=> b!1324905 m!1213643))

(assert (=> b!1324910 m!1213625))

(assert (=> b!1324910 m!1213625))

(declare-fun m!1213645 () Bool)

(assert (=> b!1324910 m!1213645))

(assert (=> b!1324911 m!1213625))

(check-sat (not b_next!30459) (not start!111802) tp_is_empty!36279 (not b!1324909) (not mapNonEmpty!56066) (not b!1324902) (not b_lambda!23707) (not b!1324904) (not b!1324905) b_and!49001 (not b!1324910))
(check-sat b_and!49001 (not b_next!30459))
(get-model)

(declare-fun b_lambda!23711 () Bool)

(assert (= b_lambda!23707 (or (and start!111802 b_free!30459) b_lambda!23711)))

(check-sat (not b_next!30459) (not start!111802) tp_is_empty!36279 (not b!1324902) (not b_lambda!23711) (not b!1324909) (not mapNonEmpty!56066) (not b!1324904) (not b!1324905) b_and!49001 (not b!1324910))
(check-sat b_and!49001 (not b_next!30459))
(get-model)

(declare-fun d!142895 () Bool)

(declare-fun e!755304 () Bool)

(assert (=> d!142895 e!755304))

(declare-fun res!879449 () Bool)

(assert (=> d!142895 (=> res!879449 e!755304)))

(declare-fun lt!589518 () Bool)

(assert (=> d!142895 (= res!879449 (not lt!589518))))

(declare-fun lt!589516 () Bool)

(assert (=> d!142895 (= lt!589518 lt!589516)))

(declare-datatypes ((Unit!43642 0))(
  ( (Unit!43643) )
))
(declare-fun lt!589517 () Unit!43642)

(declare-fun e!755305 () Unit!43642)

(assert (=> d!142895 (= lt!589517 e!755305)))

(declare-fun c!125643 () Bool)

(assert (=> d!142895 (= c!125643 lt!589516)))

(declare-fun containsKey!734 (List!30628 (_ BitVec 64)) Bool)

(assert (=> d!142895 (= lt!589516 (containsKey!734 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(assert (=> d!142895 (= (contains!8743 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164) lt!589518)))

(declare-fun b!1324956 () Bool)

(declare-fun lt!589515 () Unit!43642)

(assert (=> b!1324956 (= e!755305 lt!589515)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!480 (List!30628 (_ BitVec 64)) Unit!43642)

(assert (=> b!1324956 (= lt!589515 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-datatypes ((Option!764 0))(
  ( (Some!763 (v!20846 V!53475)) (None!762) )
))
(declare-fun isDefined!519 (Option!764) Bool)

(declare-fun getValueByKey!712 (List!30628 (_ BitVec 64)) Option!764)

(assert (=> b!1324956 (isDefined!519 (getValueByKey!712 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-fun b!1324957 () Bool)

(declare-fun Unit!43644 () Unit!43642)

(assert (=> b!1324957 (= e!755305 Unit!43644)))

(declare-fun b!1324958 () Bool)

(assert (=> b!1324958 (= e!755304 (isDefined!519 (getValueByKey!712 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164)))))

(assert (= (and d!142895 c!125643) b!1324956))

(assert (= (and d!142895 (not c!125643)) b!1324957))

(assert (= (and d!142895 (not res!879449)) b!1324958))

(declare-fun m!1213683 () Bool)

(assert (=> d!142895 m!1213683))

(declare-fun m!1213685 () Bool)

(assert (=> b!1324956 m!1213685))

(declare-fun m!1213687 () Bool)

(assert (=> b!1324956 m!1213687))

(assert (=> b!1324956 m!1213687))

(declare-fun m!1213689 () Bool)

(assert (=> b!1324956 m!1213689))

(assert (=> b!1324958 m!1213687))

(assert (=> b!1324958 m!1213687))

(assert (=> b!1324958 m!1213689))

(assert (=> b!1324902 d!142895))

(declare-fun d!142897 () Bool)

(declare-fun e!755308 () Bool)

(assert (=> d!142897 e!755308))

(declare-fun res!879455 () Bool)

(assert (=> d!142897 (=> (not res!879455) (not e!755308))))

(declare-fun lt!589527 () ListLongMap!21145)

(assert (=> d!142897 (= res!879455 (contains!8743 lt!589527 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!589529 () List!30628)

(assert (=> d!142897 (= lt!589527 (ListLongMap!21146 lt!589529))))

(declare-fun lt!589530 () Unit!43642)

(declare-fun lt!589528 () Unit!43642)

(assert (=> d!142897 (= lt!589530 lt!589528)))

(assert (=> d!142897 (= (getValueByKey!712 lt!589529 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!763 (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!357 (List!30628 (_ BitVec 64) V!53475) Unit!43642)

(assert (=> d!142897 (= lt!589528 (lemmaContainsTupThenGetReturnValue!357 lt!589529 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!486 (List!30628 (_ BitVec 64) V!53475) List!30628)

(assert (=> d!142897 (= lt!589529 (insertStrictlySorted!486 (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142897 (= (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!589527)))

(declare-fun b!1324963 () Bool)

(declare-fun res!879454 () Bool)

(assert (=> b!1324963 (=> (not res!879454) (not e!755308))))

(assert (=> b!1324963 (= res!879454 (= (getValueByKey!712 (toList!10588 lt!589527) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!763 (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1324964 () Bool)

(declare-fun contains!8744 (List!30628 tuple2!23488) Bool)

(assert (=> b!1324964 (= e!755308 (contains!8744 (toList!10588 lt!589527) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142897 res!879455) b!1324963))

(assert (= (and b!1324963 res!879454) b!1324964))

(declare-fun m!1213691 () Bool)

(assert (=> d!142897 m!1213691))

(declare-fun m!1213693 () Bool)

(assert (=> d!142897 m!1213693))

(declare-fun m!1213695 () Bool)

(assert (=> d!142897 m!1213695))

(declare-fun m!1213697 () Bool)

(assert (=> d!142897 m!1213697))

(declare-fun m!1213699 () Bool)

(assert (=> b!1324963 m!1213699))

(declare-fun m!1213701 () Bool)

(assert (=> b!1324964 m!1213701))

(assert (=> b!1324902 d!142897))

(declare-fun d!142899 () Bool)

(declare-fun c!125646 () Bool)

(assert (=> d!142899 (= c!125646 ((_ is ValueCellFull!17241) (select (arr!43208 _values!1337) from!2000)))))

(declare-fun e!755311 () V!53475)

(assert (=> d!142899 (= (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!755311)))

(declare-fun b!1324969 () Bool)

(declare-fun get!21756 (ValueCell!17241 V!53475) V!53475)

(assert (=> b!1324969 (= e!755311 (get!21756 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1324970 () Bool)

(declare-fun get!21757 (ValueCell!17241 V!53475) V!53475)

(assert (=> b!1324970 (= e!755311 (get!21757 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142899 c!125646) b!1324969))

(assert (= (and d!142899 (not c!125646)) b!1324970))

(assert (=> b!1324969 m!1213621))

(assert (=> b!1324969 m!1213613))

(declare-fun m!1213703 () Bool)

(assert (=> b!1324969 m!1213703))

(assert (=> b!1324970 m!1213621))

(assert (=> b!1324970 m!1213613))

(declare-fun m!1213705 () Bool)

(assert (=> b!1324970 m!1213705))

(assert (=> b!1324902 d!142899))

(declare-fun b!1324996 () Bool)

(declare-fun e!755328 () Bool)

(declare-fun e!755327 () Bool)

(assert (=> b!1324996 (= e!755328 e!755327)))

(assert (=> b!1324996 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43757 _keys!1609)))))

(declare-fun lt!589550 () ListLongMap!21145)

(declare-fun res!879467 () Bool)

(assert (=> b!1324996 (= res!879467 (contains!8743 lt!589550 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1324996 (=> (not res!879467) (not e!755327))))

(declare-fun b!1324997 () Bool)

(assert (=> b!1324997 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43757 _keys!1609)))))

(assert (=> b!1324997 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43758 _values!1337)))))

(declare-fun apply!1029 (ListLongMap!21145 (_ BitVec 64)) V!53475)

(assert (=> b!1324997 (= e!755327 (= (apply!1029 lt!589550 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!64684 () Bool)

(declare-fun call!64687 () ListLongMap!21145)

(assert (=> bm!64684 (= call!64687 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1324998 () Bool)

(declare-fun e!755329 () ListLongMap!21145)

(assert (=> b!1324998 (= e!755329 call!64687)))

(declare-fun b!1324999 () Bool)

(declare-fun e!755330 () ListLongMap!21145)

(assert (=> b!1324999 (= e!755330 (ListLongMap!21146 Nil!30625))))

(declare-fun b!1325000 () Bool)

(declare-fun lt!589547 () Unit!43642)

(declare-fun lt!589551 () Unit!43642)

(assert (=> b!1325000 (= lt!589547 lt!589551)))

(declare-fun lt!589545 () (_ BitVec 64))

(declare-fun lt!589549 () (_ BitVec 64))

(declare-fun lt!589546 () ListLongMap!21145)

(declare-fun lt!589548 () V!53475)

(assert (=> b!1325000 (not (contains!8743 (+!4611 lt!589546 (tuple2!23489 lt!589545 lt!589548)) lt!589549))))

(declare-fun addStillNotContains!493 (ListLongMap!21145 (_ BitVec 64) V!53475 (_ BitVec 64)) Unit!43642)

(assert (=> b!1325000 (= lt!589551 (addStillNotContains!493 lt!589546 lt!589545 lt!589548 lt!589549))))

(assert (=> b!1325000 (= lt!589549 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1325000 (= lt!589548 (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1325000 (= lt!589545 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(assert (=> b!1325000 (= lt!589546 call!64687)))

(assert (=> b!1325000 (= e!755329 (+!4611 call!64687 (tuple2!23489 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1325001 () Bool)

(declare-fun res!879464 () Bool)

(declare-fun e!755331 () Bool)

(assert (=> b!1325001 (=> (not res!879464) (not e!755331))))

(assert (=> b!1325001 (= res!879464 (not (contains!8743 lt!589550 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1325002 () Bool)

(assert (=> b!1325002 (= e!755330 e!755329)))

(declare-fun c!125657 () Bool)

(assert (=> b!1325002 (= c!125657 (validKeyInArray!0 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun d!142901 () Bool)

(assert (=> d!142901 e!755331))

(declare-fun res!879466 () Bool)

(assert (=> d!142901 (=> (not res!879466) (not e!755331))))

(assert (=> d!142901 (= res!879466 (not (contains!8743 lt!589550 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142901 (= lt!589550 e!755330)))

(declare-fun c!125658 () Bool)

(assert (=> d!142901 (= c!125658 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43757 _keys!1609)))))

(assert (=> d!142901 (validMask!0 mask!2019)))

(assert (=> d!142901 (= (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!589550)))

(declare-fun b!1324995 () Bool)

(declare-fun e!755332 () Bool)

(assert (=> b!1324995 (= e!755328 e!755332)))

(declare-fun c!125656 () Bool)

(assert (=> b!1324995 (= c!125656 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43757 _keys!1609)))))

(declare-fun b!1325003 () Bool)

(assert (=> b!1325003 (= e!755331 e!755328)))

(declare-fun c!125655 () Bool)

(declare-fun e!755326 () Bool)

(assert (=> b!1325003 (= c!125655 e!755326)))

(declare-fun res!879465 () Bool)

(assert (=> b!1325003 (=> (not res!879465) (not e!755326))))

(assert (=> b!1325003 (= res!879465 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43757 _keys!1609)))))

(declare-fun b!1325004 () Bool)

(assert (=> b!1325004 (= e!755332 (= lt!589550 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun b!1325005 () Bool)

(declare-fun isEmpty!1075 (ListLongMap!21145) Bool)

(assert (=> b!1325005 (= e!755332 (isEmpty!1075 lt!589550))))

(declare-fun b!1325006 () Bool)

(assert (=> b!1325006 (= e!755326 (validKeyInArray!0 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1325006 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))

(assert (= (and d!142901 c!125658) b!1324999))

(assert (= (and d!142901 (not c!125658)) b!1325002))

(assert (= (and b!1325002 c!125657) b!1325000))

(assert (= (and b!1325002 (not c!125657)) b!1324998))

(assert (= (or b!1325000 b!1324998) bm!64684))

(assert (= (and d!142901 res!879466) b!1325001))

(assert (= (and b!1325001 res!879464) b!1325003))

(assert (= (and b!1325003 res!879465) b!1325006))

(assert (= (and b!1325003 c!125655) b!1324996))

(assert (= (and b!1325003 (not c!125655)) b!1324995))

(assert (= (and b!1324996 res!879467) b!1324997))

(assert (= (and b!1324995 c!125656) b!1325004))

(assert (= (and b!1324995 (not c!125656)) b!1325005))

(declare-fun b_lambda!23713 () Bool)

(assert (=> (not b_lambda!23713) (not b!1324997)))

(assert (=> b!1324997 t!44557))

(declare-fun b_and!49007 () Bool)

(assert (= b_and!49001 (and (=> t!44557 result!24521) b_and!49007)))

(declare-fun b_lambda!23715 () Bool)

(assert (=> (not b_lambda!23715) (not b!1325000)))

(assert (=> b!1325000 t!44557))

(declare-fun b_and!49009 () Bool)

(assert (= b_and!49007 (and (=> t!44557 result!24521) b_and!49009)))

(declare-fun m!1213707 () Bool)

(assert (=> b!1325001 m!1213707))

(declare-fun m!1213709 () Bool)

(assert (=> d!142901 m!1213709))

(assert (=> d!142901 m!1213631))

(declare-fun m!1213711 () Bool)

(assert (=> b!1325004 m!1213711))

(declare-fun m!1213713 () Bool)

(assert (=> b!1324996 m!1213713))

(assert (=> b!1324996 m!1213713))

(declare-fun m!1213715 () Bool)

(assert (=> b!1324996 m!1213715))

(declare-fun m!1213717 () Bool)

(assert (=> b!1325005 m!1213717))

(assert (=> b!1325002 m!1213713))

(assert (=> b!1325002 m!1213713))

(declare-fun m!1213719 () Bool)

(assert (=> b!1325002 m!1213719))

(declare-fun m!1213721 () Bool)

(assert (=> b!1325000 m!1213721))

(assert (=> b!1325000 m!1213613))

(declare-fun m!1213723 () Bool)

(assert (=> b!1325000 m!1213723))

(declare-fun m!1213725 () Bool)

(assert (=> b!1325000 m!1213725))

(declare-fun m!1213727 () Bool)

(assert (=> b!1325000 m!1213727))

(declare-fun m!1213729 () Bool)

(assert (=> b!1325000 m!1213729))

(assert (=> b!1325000 m!1213713))

(declare-fun m!1213731 () Bool)

(assert (=> b!1325000 m!1213731))

(assert (=> b!1325000 m!1213721))

(assert (=> b!1325000 m!1213727))

(assert (=> b!1325000 m!1213613))

(assert (=> b!1325006 m!1213713))

(assert (=> b!1325006 m!1213713))

(assert (=> b!1325006 m!1213719))

(assert (=> bm!64684 m!1213711))

(assert (=> b!1324997 m!1213721))

(assert (=> b!1324997 m!1213613))

(assert (=> b!1324997 m!1213723))

(assert (=> b!1324997 m!1213713))

(declare-fun m!1213733 () Bool)

(assert (=> b!1324997 m!1213733))

(assert (=> b!1324997 m!1213713))

(assert (=> b!1324997 m!1213613))

(assert (=> b!1324997 m!1213721))

(assert (=> b!1324902 d!142901))

(declare-fun d!142903 () Bool)

(declare-fun e!755333 () Bool)

(assert (=> d!142903 e!755333))

(declare-fun res!879469 () Bool)

(assert (=> d!142903 (=> (not res!879469) (not e!755333))))

(declare-fun lt!589552 () ListLongMap!21145)

(assert (=> d!142903 (= res!879469 (contains!8743 lt!589552 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!589554 () List!30628)

(assert (=> d!142903 (= lt!589552 (ListLongMap!21146 lt!589554))))

(declare-fun lt!589555 () Unit!43642)

(declare-fun lt!589553 () Unit!43642)

(assert (=> d!142903 (= lt!589555 lt!589553)))

(assert (=> d!142903 (= (getValueByKey!712 lt!589554 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!763 (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142903 (= lt!589553 (lemmaContainsTupThenGetReturnValue!357 lt!589554 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142903 (= lt!589554 (insertStrictlySorted!486 (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142903 (= (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!589552)))

(declare-fun b!1325007 () Bool)

(declare-fun res!879468 () Bool)

(assert (=> b!1325007 (=> (not res!879468) (not e!755333))))

(assert (=> b!1325007 (= res!879468 (= (getValueByKey!712 (toList!10588 lt!589552) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!763 (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1325008 () Bool)

(assert (=> b!1325008 (= e!755333 (contains!8744 (toList!10588 lt!589552) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!142903 res!879469) b!1325007))

(assert (= (and b!1325007 res!879468) b!1325008))

(declare-fun m!1213735 () Bool)

(assert (=> d!142903 m!1213735))

(declare-fun m!1213737 () Bool)

(assert (=> d!142903 m!1213737))

(declare-fun m!1213739 () Bool)

(assert (=> d!142903 m!1213739))

(declare-fun m!1213741 () Bool)

(assert (=> d!142903 m!1213741))

(declare-fun m!1213743 () Bool)

(assert (=> b!1325007 m!1213743))

(declare-fun m!1213745 () Bool)

(assert (=> b!1325008 m!1213745))

(assert (=> b!1324902 d!142903))

(declare-fun d!142905 () Bool)

(declare-fun e!755334 () Bool)

(assert (=> d!142905 e!755334))

(declare-fun res!879471 () Bool)

(assert (=> d!142905 (=> (not res!879471) (not e!755334))))

(declare-fun lt!589556 () ListLongMap!21145)

(assert (=> d!142905 (= res!879471 (contains!8743 lt!589556 (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun lt!589558 () List!30628)

(assert (=> d!142905 (= lt!589556 (ListLongMap!21146 lt!589558))))

(declare-fun lt!589559 () Unit!43642)

(declare-fun lt!589557 () Unit!43642)

(assert (=> d!142905 (= lt!589559 lt!589557)))

(assert (=> d!142905 (= (getValueByKey!712 lt!589558 (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (Some!763 (_2!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!142905 (= lt!589557 (lemmaContainsTupThenGetReturnValue!357 lt!589558 (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!142905 (= lt!589558 (insertStrictlySorted!486 (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!142905 (= (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) lt!589556)))

(declare-fun b!1325009 () Bool)

(declare-fun res!879470 () Bool)

(assert (=> b!1325009 (=> (not res!879470) (not e!755334))))

(assert (=> b!1325009 (= res!879470 (= (getValueByKey!712 (toList!10588 lt!589556) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (Some!763 (_2!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(declare-fun b!1325010 () Bool)

(assert (=> b!1325010 (= e!755334 (contains!8744 (toList!10588 lt!589556) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (= (and d!142905 res!879471) b!1325009))

(assert (= (and b!1325009 res!879470) b!1325010))

(declare-fun m!1213747 () Bool)

(assert (=> d!142905 m!1213747))

(declare-fun m!1213749 () Bool)

(assert (=> d!142905 m!1213749))

(declare-fun m!1213751 () Bool)

(assert (=> d!142905 m!1213751))

(declare-fun m!1213753 () Bool)

(assert (=> d!142905 m!1213753))

(declare-fun m!1213755 () Bool)

(assert (=> b!1325009 m!1213755))

(declare-fun m!1213757 () Bool)

(assert (=> b!1325010 m!1213757))

(assert (=> b!1324902 d!142905))

(declare-fun d!142907 () Bool)

(declare-fun e!755335 () Bool)

(assert (=> d!142907 e!755335))

(declare-fun res!879472 () Bool)

(assert (=> d!142907 (=> res!879472 e!755335)))

(declare-fun lt!589563 () Bool)

(assert (=> d!142907 (= res!879472 (not lt!589563))))

(declare-fun lt!589561 () Bool)

(assert (=> d!142907 (= lt!589563 lt!589561)))

(declare-fun lt!589562 () Unit!43642)

(declare-fun e!755336 () Unit!43642)

(assert (=> d!142907 (= lt!589562 e!755336)))

(declare-fun c!125659 () Bool)

(assert (=> d!142907 (= c!125659 lt!589561)))

(assert (=> d!142907 (= lt!589561 (containsKey!734 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> d!142907 (= (contains!8743 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164) lt!589563)))

(declare-fun b!1325011 () Bool)

(declare-fun lt!589560 () Unit!43642)

(assert (=> b!1325011 (= e!755336 lt!589560)))

(assert (=> b!1325011 (= lt!589560 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> b!1325011 (isDefined!519 (getValueByKey!712 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun b!1325012 () Bool)

(declare-fun Unit!43645 () Unit!43642)

(assert (=> b!1325012 (= e!755336 Unit!43645)))

(declare-fun b!1325013 () Bool)

(assert (=> b!1325013 (= e!755335 (isDefined!519 (getValueByKey!712 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)))))

(assert (= (and d!142907 c!125659) b!1325011))

(assert (= (and d!142907 (not c!125659)) b!1325012))

(assert (= (and d!142907 (not res!879472)) b!1325013))

(declare-fun m!1213759 () Bool)

(assert (=> d!142907 m!1213759))

(declare-fun m!1213761 () Bool)

(assert (=> b!1325011 m!1213761))

(declare-fun m!1213763 () Bool)

(assert (=> b!1325011 m!1213763))

(assert (=> b!1325011 m!1213763))

(declare-fun m!1213765 () Bool)

(assert (=> b!1325011 m!1213765))

(assert (=> b!1325013 m!1213763))

(assert (=> b!1325013 m!1213763))

(assert (=> b!1325013 m!1213765))

(assert (=> b!1324905 d!142907))

(declare-fun b!1325056 () Bool)

(declare-fun e!755368 () Bool)

(declare-fun e!755374 () Bool)

(assert (=> b!1325056 (= e!755368 e!755374)))

(declare-fun res!879496 () Bool)

(assert (=> b!1325056 (=> (not res!879496) (not e!755374))))

(declare-fun lt!589616 () ListLongMap!21145)

(assert (=> b!1325056 (= res!879496 (contains!8743 lt!589616 (select (arr!43207 _keys!1609) from!2000)))))

(assert (=> b!1325056 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43757 _keys!1609)))))

(declare-fun d!142909 () Bool)

(declare-fun e!755371 () Bool)

(assert (=> d!142909 e!755371))

(declare-fun res!879493 () Bool)

(assert (=> d!142909 (=> (not res!879493) (not e!755371))))

(assert (=> d!142909 (= res!879493 (or (bvsge from!2000 (size!43757 _keys!1609)) (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43757 _keys!1609)))))))

(declare-fun lt!589610 () ListLongMap!21145)

(assert (=> d!142909 (= lt!589616 lt!589610)))

(declare-fun lt!589612 () Unit!43642)

(declare-fun e!755372 () Unit!43642)

(assert (=> d!142909 (= lt!589612 e!755372)))

(declare-fun c!125675 () Bool)

(declare-fun e!755364 () Bool)

(assert (=> d!142909 (= c!125675 e!755364)))

(declare-fun res!879499 () Bool)

(assert (=> d!142909 (=> (not res!879499) (not e!755364))))

(assert (=> d!142909 (= res!879499 (bvslt from!2000 (size!43757 _keys!1609)))))

(declare-fun e!755375 () ListLongMap!21145)

(assert (=> d!142909 (= lt!589610 e!755375)))

(declare-fun c!125673 () Bool)

(assert (=> d!142909 (= c!125673 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142909 (validMask!0 mask!2019)))

(assert (=> d!142909 (= (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!589616)))

(declare-fun bm!64699 () Bool)

(declare-fun call!64704 () Bool)

(assert (=> bm!64699 (= call!64704 (contains!8743 lt!589616 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64700 () Bool)

(declare-fun call!64708 () ListLongMap!21145)

(declare-fun call!64702 () ListLongMap!21145)

(assert (=> bm!64700 (= call!64708 call!64702)))

(declare-fun bm!64701 () Bool)

(declare-fun call!64703 () ListLongMap!21145)

(assert (=> bm!64701 (= call!64702 call!64703)))

(declare-fun b!1325057 () Bool)

(declare-fun e!755363 () Bool)

(declare-fun call!64706 () Bool)

(assert (=> b!1325057 (= e!755363 (not call!64706))))

(declare-fun b!1325058 () Bool)

(declare-fun e!755367 () Bool)

(assert (=> b!1325058 (= e!755371 e!755367)))

(declare-fun c!125676 () Bool)

(assert (=> b!1325058 (= c!125676 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1325059 () Bool)

(declare-fun c!125677 () Bool)

(assert (=> b!1325059 (= c!125677 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!755366 () ListLongMap!21145)

(declare-fun e!755365 () ListLongMap!21145)

(assert (=> b!1325059 (= e!755366 e!755365)))

(declare-fun b!1325060 () Bool)

(declare-fun lt!589626 () Unit!43642)

(assert (=> b!1325060 (= e!755372 lt!589626)))

(declare-fun lt!589619 () ListLongMap!21145)

(assert (=> b!1325060 (= lt!589619 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!589627 () (_ BitVec 64))

(assert (=> b!1325060 (= lt!589627 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!589611 () (_ BitVec 64))

(assert (=> b!1325060 (= lt!589611 (select (arr!43207 _keys!1609) from!2000))))

(declare-fun lt!589613 () Unit!43642)

(declare-fun addStillContains!1160 (ListLongMap!21145 (_ BitVec 64) V!53475 (_ BitVec 64)) Unit!43642)

(assert (=> b!1325060 (= lt!589613 (addStillContains!1160 lt!589619 lt!589627 zeroValue!1279 lt!589611))))

(assert (=> b!1325060 (contains!8743 (+!4611 lt!589619 (tuple2!23489 lt!589627 zeroValue!1279)) lt!589611)))

(declare-fun lt!589615 () Unit!43642)

(assert (=> b!1325060 (= lt!589615 lt!589613)))

(declare-fun lt!589629 () ListLongMap!21145)

(assert (=> b!1325060 (= lt!589629 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!589625 () (_ BitVec 64))

(assert (=> b!1325060 (= lt!589625 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!589609 () (_ BitVec 64))

(assert (=> b!1325060 (= lt!589609 (select (arr!43207 _keys!1609) from!2000))))

(declare-fun lt!589618 () Unit!43642)

(declare-fun addApplyDifferent!571 (ListLongMap!21145 (_ BitVec 64) V!53475 (_ BitVec 64)) Unit!43642)

(assert (=> b!1325060 (= lt!589618 (addApplyDifferent!571 lt!589629 lt!589625 minValue!1279 lt!589609))))

(assert (=> b!1325060 (= (apply!1029 (+!4611 lt!589629 (tuple2!23489 lt!589625 minValue!1279)) lt!589609) (apply!1029 lt!589629 lt!589609))))

(declare-fun lt!589623 () Unit!43642)

(assert (=> b!1325060 (= lt!589623 lt!589618)))

(declare-fun lt!589620 () ListLongMap!21145)

(assert (=> b!1325060 (= lt!589620 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!589621 () (_ BitVec 64))

(assert (=> b!1325060 (= lt!589621 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!589622 () (_ BitVec 64))

(assert (=> b!1325060 (= lt!589622 (select (arr!43207 _keys!1609) from!2000))))

(declare-fun lt!589624 () Unit!43642)

(assert (=> b!1325060 (= lt!589624 (addApplyDifferent!571 lt!589620 lt!589621 zeroValue!1279 lt!589622))))

(assert (=> b!1325060 (= (apply!1029 (+!4611 lt!589620 (tuple2!23489 lt!589621 zeroValue!1279)) lt!589622) (apply!1029 lt!589620 lt!589622))))

(declare-fun lt!589608 () Unit!43642)

(assert (=> b!1325060 (= lt!589608 lt!589624)))

(declare-fun lt!589614 () ListLongMap!21145)

(assert (=> b!1325060 (= lt!589614 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!589628 () (_ BitVec 64))

(assert (=> b!1325060 (= lt!589628 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!589617 () (_ BitVec 64))

(assert (=> b!1325060 (= lt!589617 (select (arr!43207 _keys!1609) from!2000))))

(assert (=> b!1325060 (= lt!589626 (addApplyDifferent!571 lt!589614 lt!589628 minValue!1279 lt!589617))))

(assert (=> b!1325060 (= (apply!1029 (+!4611 lt!589614 (tuple2!23489 lt!589628 minValue!1279)) lt!589617) (apply!1029 lt!589614 lt!589617))))

(declare-fun b!1325061 () Bool)

(assert (=> b!1325061 (= e!755367 (not call!64704))))

(declare-fun b!1325062 () Bool)

(assert (=> b!1325062 (= e!755375 e!755366)))

(declare-fun c!125672 () Bool)

(assert (=> b!1325062 (= c!125672 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1325063 () Bool)

(declare-fun e!755373 () Bool)

(assert (=> b!1325063 (= e!755373 (= (apply!1029 lt!589616 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun b!1325064 () Bool)

(declare-fun res!879491 () Bool)

(assert (=> b!1325064 (=> (not res!879491) (not e!755371))))

(assert (=> b!1325064 (= res!879491 e!755363)))

(declare-fun c!125674 () Bool)

(assert (=> b!1325064 (= c!125674 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1325065 () Bool)

(declare-fun Unit!43646 () Unit!43642)

(assert (=> b!1325065 (= e!755372 Unit!43646)))

(declare-fun b!1325066 () Bool)

(declare-fun e!755369 () Bool)

(assert (=> b!1325066 (= e!755363 e!755369)))

(declare-fun res!879494 () Bool)

(assert (=> b!1325066 (= res!879494 call!64706)))

(assert (=> b!1325066 (=> (not res!879494) (not e!755369))))

(declare-fun call!64707 () ListLongMap!21145)

(declare-fun bm!64702 () Bool)

(assert (=> bm!64702 (= call!64707 (+!4611 (ite c!125673 call!64703 (ite c!125672 call!64702 call!64708)) (ite (or c!125673 c!125672) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1325067 () Bool)

(declare-fun e!755370 () Bool)

(assert (=> b!1325067 (= e!755370 (validKeyInArray!0 (select (arr!43207 _keys!1609) from!2000)))))

(declare-fun b!1325068 () Bool)

(assert (=> b!1325068 (= e!755374 (= (apply!1029 lt!589616 (select (arr!43207 _keys!1609) from!2000)) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1325068 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43758 _values!1337)))))

(assert (=> b!1325068 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43757 _keys!1609)))))

(declare-fun b!1325069 () Bool)

(assert (=> b!1325069 (= e!755364 (validKeyInArray!0 (select (arr!43207 _keys!1609) from!2000)))))

(declare-fun b!1325070 () Bool)

(assert (=> b!1325070 (= e!755375 (+!4611 call!64707 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun bm!64703 () Bool)

(assert (=> bm!64703 (= call!64703 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun b!1325071 () Bool)

(assert (=> b!1325071 (= e!755367 e!755373)))

(declare-fun res!879492 () Bool)

(assert (=> b!1325071 (= res!879492 call!64704)))

(assert (=> b!1325071 (=> (not res!879492) (not e!755373))))

(declare-fun b!1325072 () Bool)

(declare-fun call!64705 () ListLongMap!21145)

(assert (=> b!1325072 (= e!755365 call!64705)))

(declare-fun b!1325073 () Bool)

(declare-fun res!879495 () Bool)

(assert (=> b!1325073 (=> (not res!879495) (not e!755371))))

(assert (=> b!1325073 (= res!879495 e!755368)))

(declare-fun res!879498 () Bool)

(assert (=> b!1325073 (=> res!879498 e!755368)))

(assert (=> b!1325073 (= res!879498 (not e!755370))))

(declare-fun res!879497 () Bool)

(assert (=> b!1325073 (=> (not res!879497) (not e!755370))))

(assert (=> b!1325073 (= res!879497 (bvslt from!2000 (size!43757 _keys!1609)))))

(declare-fun b!1325074 () Bool)

(assert (=> b!1325074 (= e!755365 call!64708)))

(declare-fun b!1325075 () Bool)

(assert (=> b!1325075 (= e!755366 call!64705)))

(declare-fun bm!64704 () Bool)

(assert (=> bm!64704 (= call!64705 call!64707)))

(declare-fun b!1325076 () Bool)

(assert (=> b!1325076 (= e!755369 (= (apply!1029 lt!589616 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun bm!64705 () Bool)

(assert (=> bm!64705 (= call!64706 (contains!8743 lt!589616 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!142909 c!125673) b!1325070))

(assert (= (and d!142909 (not c!125673)) b!1325062))

(assert (= (and b!1325062 c!125672) b!1325075))

(assert (= (and b!1325062 (not c!125672)) b!1325059))

(assert (= (and b!1325059 c!125677) b!1325072))

(assert (= (and b!1325059 (not c!125677)) b!1325074))

(assert (= (or b!1325072 b!1325074) bm!64700))

(assert (= (or b!1325075 bm!64700) bm!64701))

(assert (= (or b!1325075 b!1325072) bm!64704))

(assert (= (or b!1325070 bm!64701) bm!64703))

(assert (= (or b!1325070 bm!64704) bm!64702))

(assert (= (and d!142909 res!879499) b!1325069))

(assert (= (and d!142909 c!125675) b!1325060))

(assert (= (and d!142909 (not c!125675)) b!1325065))

(assert (= (and d!142909 res!879493) b!1325073))

(assert (= (and b!1325073 res!879497) b!1325067))

(assert (= (and b!1325073 (not res!879498)) b!1325056))

(assert (= (and b!1325056 res!879496) b!1325068))

(assert (= (and b!1325073 res!879495) b!1325064))

(assert (= (and b!1325064 c!125674) b!1325066))

(assert (= (and b!1325064 (not c!125674)) b!1325057))

(assert (= (and b!1325066 res!879494) b!1325076))

(assert (= (or b!1325066 b!1325057) bm!64705))

(assert (= (and b!1325064 res!879491) b!1325058))

(assert (= (and b!1325058 c!125676) b!1325071))

(assert (= (and b!1325058 (not c!125676)) b!1325061))

(assert (= (and b!1325071 res!879492) b!1325063))

(assert (= (or b!1325071 b!1325061) bm!64699))

(declare-fun b_lambda!23717 () Bool)

(assert (=> (not b_lambda!23717) (not b!1325068)))

(assert (=> b!1325068 t!44557))

(declare-fun b_and!49011 () Bool)

(assert (= b_and!49009 (and (=> t!44557 result!24521) b_and!49011)))

(declare-fun m!1213767 () Bool)

(assert (=> bm!64702 m!1213767))

(declare-fun m!1213769 () Bool)

(assert (=> bm!64703 m!1213769))

(assert (=> b!1325067 m!1213625))

(assert (=> b!1325067 m!1213625))

(assert (=> b!1325067 m!1213645))

(assert (=> d!142909 m!1213631))

(declare-fun m!1213771 () Bool)

(assert (=> bm!64705 m!1213771))

(declare-fun m!1213773 () Bool)

(assert (=> b!1325070 m!1213773))

(assert (=> b!1325069 m!1213625))

(assert (=> b!1325069 m!1213625))

(assert (=> b!1325069 m!1213645))

(declare-fun m!1213775 () Bool)

(assert (=> bm!64699 m!1213775))

(declare-fun m!1213777 () Bool)

(assert (=> b!1325063 m!1213777))

(assert (=> b!1325068 m!1213613))

(assert (=> b!1325068 m!1213621))

(assert (=> b!1325068 m!1213621))

(assert (=> b!1325068 m!1213613))

(assert (=> b!1325068 m!1213627))

(assert (=> b!1325068 m!1213625))

(declare-fun m!1213779 () Bool)

(assert (=> b!1325068 m!1213779))

(assert (=> b!1325068 m!1213625))

(declare-fun m!1213781 () Bool)

(assert (=> b!1325060 m!1213781))

(declare-fun m!1213783 () Bool)

(assert (=> b!1325060 m!1213783))

(declare-fun m!1213785 () Bool)

(assert (=> b!1325060 m!1213785))

(declare-fun m!1213787 () Bool)

(assert (=> b!1325060 m!1213787))

(declare-fun m!1213789 () Bool)

(assert (=> b!1325060 m!1213789))

(declare-fun m!1213791 () Bool)

(assert (=> b!1325060 m!1213791))

(declare-fun m!1213793 () Bool)

(assert (=> b!1325060 m!1213793))

(assert (=> b!1325060 m!1213789))

(declare-fun m!1213795 () Bool)

(assert (=> b!1325060 m!1213795))

(declare-fun m!1213797 () Bool)

(assert (=> b!1325060 m!1213797))

(declare-fun m!1213799 () Bool)

(assert (=> b!1325060 m!1213799))

(declare-fun m!1213801 () Bool)

(assert (=> b!1325060 m!1213801))

(assert (=> b!1325060 m!1213625))

(assert (=> b!1325060 m!1213785))

(assert (=> b!1325060 m!1213799))

(assert (=> b!1325060 m!1213769))

(assert (=> b!1325060 m!1213781))

(declare-fun m!1213803 () Bool)

(assert (=> b!1325060 m!1213803))

(declare-fun m!1213805 () Bool)

(assert (=> b!1325060 m!1213805))

(declare-fun m!1213807 () Bool)

(assert (=> b!1325060 m!1213807))

(declare-fun m!1213809 () Bool)

(assert (=> b!1325060 m!1213809))

(assert (=> b!1325056 m!1213625))

(assert (=> b!1325056 m!1213625))

(declare-fun m!1213811 () Bool)

(assert (=> b!1325056 m!1213811))

(declare-fun m!1213813 () Bool)

(assert (=> b!1325076 m!1213813))

(assert (=> b!1324905 d!142909))

(declare-fun d!142911 () Bool)

(assert (=> d!142911 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111802 d!142911))

(declare-fun d!142913 () Bool)

(assert (=> d!142913 (= (array_inv!32613 _keys!1609) (bvsge (size!43757 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111802 d!142913))

(declare-fun d!142915 () Bool)

(assert (=> d!142915 (= (array_inv!32614 _values!1337) (bvsge (size!43758 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111802 d!142915))

(declare-fun d!142917 () Bool)

(assert (=> d!142917 (= (validKeyInArray!0 (select (arr!43207 _keys!1609) from!2000)) (and (not (= (select (arr!43207 _keys!1609) from!2000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43207 _keys!1609) from!2000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1324910 d!142917))

(declare-fun b!1325085 () Bool)

(declare-fun e!755383 () Bool)

(declare-fun e!755384 () Bool)

(assert (=> b!1325085 (= e!755383 e!755384)))

(declare-fun lt!589638 () (_ BitVec 64))

(assert (=> b!1325085 (= lt!589638 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000))))

(declare-fun lt!589637 () Unit!43642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89466 (_ BitVec 64) (_ BitVec 32)) Unit!43642)

(assert (=> b!1325085 (= lt!589637 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!589638 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1325085 (arrayContainsKey!0 _keys!1609 lt!589638 #b00000000000000000000000000000000)))

(declare-fun lt!589636 () Unit!43642)

(assert (=> b!1325085 (= lt!589636 lt!589637)))

(declare-fun res!879505 () Bool)

(declare-datatypes ((SeekEntryResult!10040 0))(
  ( (MissingZero!10040 (index!42531 (_ BitVec 32))) (Found!10040 (index!42532 (_ BitVec 32))) (Intermediate!10040 (undefined!10852 Bool) (index!42533 (_ BitVec 32)) (x!118108 (_ BitVec 32))) (Undefined!10040) (MissingVacant!10040 (index!42534 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89466 (_ BitVec 32)) SeekEntryResult!10040)

(assert (=> b!1325085 (= res!879505 (= (seekEntryOrOpen!0 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10040 #b00000000000000000000000000000000)))))

(assert (=> b!1325085 (=> (not res!879505) (not e!755384))))

(declare-fun b!1325086 () Bool)

(declare-fun call!64711 () Bool)

(assert (=> b!1325086 (= e!755383 call!64711)))

(declare-fun b!1325087 () Bool)

(assert (=> b!1325087 (= e!755384 call!64711)))

(declare-fun bm!64708 () Bool)

(assert (=> bm!64708 (= call!64711 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun d!142919 () Bool)

(declare-fun res!879504 () Bool)

(declare-fun e!755382 () Bool)

(assert (=> d!142919 (=> res!879504 e!755382)))

(assert (=> d!142919 (= res!879504 (bvsge #b00000000000000000000000000000000 (size!43757 _keys!1609)))))

(assert (=> d!142919 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!755382)))

(declare-fun b!1325088 () Bool)

(assert (=> b!1325088 (= e!755382 e!755383)))

(declare-fun c!125680 () Bool)

(assert (=> b!1325088 (= c!125680 (validKeyInArray!0 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!142919 (not res!879504)) b!1325088))

(assert (= (and b!1325088 c!125680) b!1325085))

(assert (= (and b!1325088 (not c!125680)) b!1325086))

(assert (= (and b!1325085 res!879505) b!1325087))

(assert (= (or b!1325087 b!1325086) bm!64708))

(declare-fun m!1213815 () Bool)

(assert (=> b!1325085 m!1213815))

(declare-fun m!1213817 () Bool)

(assert (=> b!1325085 m!1213817))

(declare-fun m!1213819 () Bool)

(assert (=> b!1325085 m!1213819))

(assert (=> b!1325085 m!1213815))

(declare-fun m!1213821 () Bool)

(assert (=> b!1325085 m!1213821))

(declare-fun m!1213823 () Bool)

(assert (=> bm!64708 m!1213823))

(assert (=> b!1325088 m!1213815))

(assert (=> b!1325088 m!1213815))

(declare-fun m!1213825 () Bool)

(assert (=> b!1325088 m!1213825))

(assert (=> b!1324904 d!142919))

(declare-fun b!1325099 () Bool)

(declare-fun e!755394 () Bool)

(declare-fun call!64714 () Bool)

(assert (=> b!1325099 (= e!755394 call!64714)))

(declare-fun b!1325100 () Bool)

(assert (=> b!1325100 (= e!755394 call!64714)))

(declare-fun b!1325101 () Bool)

(declare-fun e!755393 () Bool)

(assert (=> b!1325101 (= e!755393 e!755394)))

(declare-fun c!125683 () Bool)

(assert (=> b!1325101 (= c!125683 (validKeyInArray!0 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1325102 () Bool)

(declare-fun e!755396 () Bool)

(assert (=> b!1325102 (= e!755396 e!755393)))

(declare-fun res!879513 () Bool)

(assert (=> b!1325102 (=> (not res!879513) (not e!755393))))

(declare-fun e!755395 () Bool)

(assert (=> b!1325102 (= res!879513 (not e!755395))))

(declare-fun res!879512 () Bool)

(assert (=> b!1325102 (=> (not res!879512) (not e!755395))))

(assert (=> b!1325102 (= res!879512 (validKeyInArray!0 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1325103 () Bool)

(declare-fun contains!8745 (List!30629 (_ BitVec 64)) Bool)

(assert (=> b!1325103 (= e!755395 (contains!8745 Nil!30626 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun d!142921 () Bool)

(declare-fun res!879514 () Bool)

(assert (=> d!142921 (=> res!879514 e!755396)))

(assert (=> d!142921 (= res!879514 (bvsge #b00000000000000000000000000000000 (size!43757 _keys!1609)))))

(assert (=> d!142921 (= (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30626) e!755396)))

(declare-fun bm!64711 () Bool)

(assert (=> bm!64711 (= call!64714 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125683 (Cons!30625 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000) Nil!30626) Nil!30626)))))

(assert (= (and d!142921 (not res!879514)) b!1325102))

(assert (= (and b!1325102 res!879512) b!1325103))

(assert (= (and b!1325102 res!879513) b!1325101))

(assert (= (and b!1325101 c!125683) b!1325099))

(assert (= (and b!1325101 (not c!125683)) b!1325100))

(assert (= (or b!1325099 b!1325100) bm!64711))

(assert (=> b!1325101 m!1213815))

(assert (=> b!1325101 m!1213815))

(assert (=> b!1325101 m!1213825))

(assert (=> b!1325102 m!1213815))

(assert (=> b!1325102 m!1213815))

(assert (=> b!1325102 m!1213825))

(assert (=> b!1325103 m!1213815))

(assert (=> b!1325103 m!1213815))

(declare-fun m!1213827 () Bool)

(assert (=> b!1325103 m!1213827))

(assert (=> bm!64711 m!1213815))

(declare-fun m!1213829 () Bool)

(assert (=> bm!64711 m!1213829))

(assert (=> b!1324909 d!142921))

(declare-fun b!1325111 () Bool)

(declare-fun e!755402 () Bool)

(assert (=> b!1325111 (= e!755402 tp_is_empty!36279)))

(declare-fun condMapEmpty!56072 () Bool)

(declare-fun mapDefault!56072 () ValueCell!17241)

(assert (=> mapNonEmpty!56066 (= condMapEmpty!56072 (= mapRest!56066 ((as const (Array (_ BitVec 32) ValueCell!17241)) mapDefault!56072)))))

(declare-fun mapRes!56072 () Bool)

(assert (=> mapNonEmpty!56066 (= tp!106853 (and e!755402 mapRes!56072))))

(declare-fun mapIsEmpty!56072 () Bool)

(assert (=> mapIsEmpty!56072 mapRes!56072))

(declare-fun mapNonEmpty!56072 () Bool)

(declare-fun tp!106862 () Bool)

(declare-fun e!755401 () Bool)

(assert (=> mapNonEmpty!56072 (= mapRes!56072 (and tp!106862 e!755401))))

(declare-fun mapValue!56072 () ValueCell!17241)

(declare-fun mapRest!56072 () (Array (_ BitVec 32) ValueCell!17241))

(declare-fun mapKey!56072 () (_ BitVec 32))

(assert (=> mapNonEmpty!56072 (= mapRest!56066 (store mapRest!56072 mapKey!56072 mapValue!56072))))

(declare-fun b!1325110 () Bool)

(assert (=> b!1325110 (= e!755401 tp_is_empty!36279)))

(assert (= (and mapNonEmpty!56066 condMapEmpty!56072) mapIsEmpty!56072))

(assert (= (and mapNonEmpty!56066 (not condMapEmpty!56072)) mapNonEmpty!56072))

(assert (= (and mapNonEmpty!56072 ((_ is ValueCellFull!17241) mapValue!56072)) b!1325110))

(assert (= (and mapNonEmpty!56066 ((_ is ValueCellFull!17241) mapDefault!56072)) b!1325111))

(declare-fun m!1213831 () Bool)

(assert (=> mapNonEmpty!56072 m!1213831))

(declare-fun b_lambda!23719 () Bool)

(assert (= b_lambda!23715 (or (and start!111802 b_free!30459) b_lambda!23719)))

(declare-fun b_lambda!23721 () Bool)

(assert (= b_lambda!23717 (or (and start!111802 b_free!30459) b_lambda!23721)))

(declare-fun b_lambda!23723 () Bool)

(assert (= b_lambda!23713 (or (and start!111802 b_free!30459) b_lambda!23723)))

(check-sat (not b!1325067) (not b!1325006) (not b_next!30459) (not d!142901) (not bm!64702) (not b_lambda!23719) (not b!1324964) (not b!1324969) (not bm!64703) (not b!1325085) (not b!1325010) (not b!1324997) (not b!1325002) b_and!49011 (not d!142897) (not bm!64684) (not bm!64705) (not mapNonEmpty!56072) (not bm!64699) (not b!1325063) (not b!1325068) (not b!1325088) (not b!1325060) (not d!142903) (not b!1324963) (not bm!64711) (not b!1325011) (not b!1324996) (not b!1324956) tp_is_empty!36279 (not b_lambda!23721) (not b!1325069) (not b!1325013) (not b!1325070) (not b!1325005) (not d!142895) (not b!1325007) (not b!1324958) (not d!142907) (not b_lambda!23711) (not b!1325076) (not b_lambda!23723) (not b!1325103) (not b!1325009) (not b!1324970) (not d!142909) (not b!1325008) (not b!1325056) (not d!142905) (not b!1325001) (not b!1325101) (not b!1325000) (not bm!64708) (not b!1325102) (not b!1325004))
(check-sat b_and!49011 (not b_next!30459))
(get-model)

(declare-fun d!142923 () Bool)

(assert (=> d!142923 (isDefined!519 (getValueByKey!712 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-fun lt!589641 () Unit!43642)

(declare-fun choose!1945 (List!30628 (_ BitVec 64)) Unit!43642)

(assert (=> d!142923 (= lt!589641 (choose!1945 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-fun e!755405 () Bool)

(assert (=> d!142923 e!755405))

(declare-fun res!879517 () Bool)

(assert (=> d!142923 (=> (not res!879517) (not e!755405))))

(declare-fun isStrictlySorted!876 (List!30628) Bool)

(assert (=> d!142923 (= res!879517 (isStrictlySorted!876 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142923 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164) lt!589641)))

(declare-fun b!1325114 () Bool)

(assert (=> b!1325114 (= e!755405 (containsKey!734 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(assert (= (and d!142923 res!879517) b!1325114))

(assert (=> d!142923 m!1213687))

(assert (=> d!142923 m!1213687))

(assert (=> d!142923 m!1213689))

(declare-fun m!1213833 () Bool)

(assert (=> d!142923 m!1213833))

(declare-fun m!1213835 () Bool)

(assert (=> d!142923 m!1213835))

(assert (=> b!1325114 m!1213683))

(assert (=> b!1324956 d!142923))

(declare-fun d!142925 () Bool)

(declare-fun isEmpty!1076 (Option!764) Bool)

(assert (=> d!142925 (= (isDefined!519 (getValueByKey!712 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164)) (not (isEmpty!1076 (getValueByKey!712 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))))

(declare-fun bs!37895 () Bool)

(assert (= bs!37895 d!142925))

(assert (=> bs!37895 m!1213687))

(declare-fun m!1213837 () Bool)

(assert (=> bs!37895 m!1213837))

(assert (=> b!1324956 d!142925))

(declare-fun e!755410 () Option!764)

(declare-fun b!1325123 () Bool)

(assert (=> b!1325123 (= e!755410 (Some!763 (_2!11755 (h!31833 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))))

(declare-fun b!1325124 () Bool)

(declare-fun e!755411 () Option!764)

(assert (=> b!1325124 (= e!755410 e!755411)))

(declare-fun c!125689 () Bool)

(assert (=> b!1325124 (= c!125689 (and ((_ is Cons!30624) (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (not (= (_1!11755 (h!31833 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164))))))

(declare-fun d!142927 () Bool)

(declare-fun c!125688 () Bool)

(assert (=> d!142927 (= c!125688 (and ((_ is Cons!30624) (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (= (_1!11755 (h!31833 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164)))))

(assert (=> d!142927 (= (getValueByKey!712 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164) e!755410)))

(declare-fun b!1325126 () Bool)

(assert (=> b!1325126 (= e!755411 None!762)))

(declare-fun b!1325125 () Bool)

(assert (=> b!1325125 (= e!755411 (getValueByKey!712 (t!44558 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) k0!1164))))

(assert (= (and d!142927 c!125688) b!1325123))

(assert (= (and d!142927 (not c!125688)) b!1325124))

(assert (= (and b!1325124 c!125689) b!1325125))

(assert (= (and b!1325124 (not c!125689)) b!1325126))

(declare-fun m!1213839 () Bool)

(assert (=> b!1325125 m!1213839))

(assert (=> b!1324956 d!142927))

(declare-fun d!142929 () Bool)

(declare-fun e!755412 () Bool)

(assert (=> d!142929 e!755412))

(declare-fun res!879519 () Bool)

(assert (=> d!142929 (=> (not res!879519) (not e!755412))))

(declare-fun lt!589642 () ListLongMap!21145)

(assert (=> d!142929 (= res!879519 (contains!8743 lt!589642 (_1!11755 (tuple2!23489 lt!589545 lt!589548))))))

(declare-fun lt!589644 () List!30628)

(assert (=> d!142929 (= lt!589642 (ListLongMap!21146 lt!589644))))

(declare-fun lt!589645 () Unit!43642)

(declare-fun lt!589643 () Unit!43642)

(assert (=> d!142929 (= lt!589645 lt!589643)))

(assert (=> d!142929 (= (getValueByKey!712 lt!589644 (_1!11755 (tuple2!23489 lt!589545 lt!589548))) (Some!763 (_2!11755 (tuple2!23489 lt!589545 lt!589548))))))

(assert (=> d!142929 (= lt!589643 (lemmaContainsTupThenGetReturnValue!357 lt!589644 (_1!11755 (tuple2!23489 lt!589545 lt!589548)) (_2!11755 (tuple2!23489 lt!589545 lt!589548))))))

(assert (=> d!142929 (= lt!589644 (insertStrictlySorted!486 (toList!10588 lt!589546) (_1!11755 (tuple2!23489 lt!589545 lt!589548)) (_2!11755 (tuple2!23489 lt!589545 lt!589548))))))

(assert (=> d!142929 (= (+!4611 lt!589546 (tuple2!23489 lt!589545 lt!589548)) lt!589642)))

(declare-fun b!1325127 () Bool)

(declare-fun res!879518 () Bool)

(assert (=> b!1325127 (=> (not res!879518) (not e!755412))))

(assert (=> b!1325127 (= res!879518 (= (getValueByKey!712 (toList!10588 lt!589642) (_1!11755 (tuple2!23489 lt!589545 lt!589548))) (Some!763 (_2!11755 (tuple2!23489 lt!589545 lt!589548)))))))

(declare-fun b!1325128 () Bool)

(assert (=> b!1325128 (= e!755412 (contains!8744 (toList!10588 lt!589642) (tuple2!23489 lt!589545 lt!589548)))))

(assert (= (and d!142929 res!879519) b!1325127))

(assert (= (and b!1325127 res!879518) b!1325128))

(declare-fun m!1213841 () Bool)

(assert (=> d!142929 m!1213841))

(declare-fun m!1213843 () Bool)

(assert (=> d!142929 m!1213843))

(declare-fun m!1213845 () Bool)

(assert (=> d!142929 m!1213845))

(declare-fun m!1213847 () Bool)

(assert (=> d!142929 m!1213847))

(declare-fun m!1213849 () Bool)

(assert (=> b!1325127 m!1213849))

(declare-fun m!1213851 () Bool)

(assert (=> b!1325128 m!1213851))

(assert (=> b!1325000 d!142929))

(declare-fun d!142931 () Bool)

(assert (=> d!142931 (not (contains!8743 (+!4611 lt!589546 (tuple2!23489 lt!589545 lt!589548)) lt!589549))))

(declare-fun lt!589648 () Unit!43642)

(declare-fun choose!1946 (ListLongMap!21145 (_ BitVec 64) V!53475 (_ BitVec 64)) Unit!43642)

(assert (=> d!142931 (= lt!589648 (choose!1946 lt!589546 lt!589545 lt!589548 lt!589549))))

(declare-fun e!755415 () Bool)

(assert (=> d!142931 e!755415))

(declare-fun res!879522 () Bool)

(assert (=> d!142931 (=> (not res!879522) (not e!755415))))

(assert (=> d!142931 (= res!879522 (not (contains!8743 lt!589546 lt!589549)))))

(assert (=> d!142931 (= (addStillNotContains!493 lt!589546 lt!589545 lt!589548 lt!589549) lt!589648)))

(declare-fun b!1325132 () Bool)

(assert (=> b!1325132 (= e!755415 (not (= lt!589545 lt!589549)))))

(assert (= (and d!142931 res!879522) b!1325132))

(assert (=> d!142931 m!1213727))

(assert (=> d!142931 m!1213727))

(assert (=> d!142931 m!1213729))

(declare-fun m!1213853 () Bool)

(assert (=> d!142931 m!1213853))

(declare-fun m!1213855 () Bool)

(assert (=> d!142931 m!1213855))

(assert (=> b!1325000 d!142931))

(declare-fun d!142933 () Bool)

(declare-fun e!755416 () Bool)

(assert (=> d!142933 e!755416))

(declare-fun res!879523 () Bool)

(assert (=> d!142933 (=> res!879523 e!755416)))

(declare-fun lt!589652 () Bool)

(assert (=> d!142933 (= res!879523 (not lt!589652))))

(declare-fun lt!589650 () Bool)

(assert (=> d!142933 (= lt!589652 lt!589650)))

(declare-fun lt!589651 () Unit!43642)

(declare-fun e!755417 () Unit!43642)

(assert (=> d!142933 (= lt!589651 e!755417)))

(declare-fun c!125690 () Bool)

(assert (=> d!142933 (= c!125690 lt!589650)))

(assert (=> d!142933 (= lt!589650 (containsKey!734 (toList!10588 (+!4611 lt!589546 (tuple2!23489 lt!589545 lt!589548))) lt!589549))))

(assert (=> d!142933 (= (contains!8743 (+!4611 lt!589546 (tuple2!23489 lt!589545 lt!589548)) lt!589549) lt!589652)))

(declare-fun b!1325133 () Bool)

(declare-fun lt!589649 () Unit!43642)

(assert (=> b!1325133 (= e!755417 lt!589649)))

(assert (=> b!1325133 (= lt!589649 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 (+!4611 lt!589546 (tuple2!23489 lt!589545 lt!589548))) lt!589549))))

(assert (=> b!1325133 (isDefined!519 (getValueByKey!712 (toList!10588 (+!4611 lt!589546 (tuple2!23489 lt!589545 lt!589548))) lt!589549))))

(declare-fun b!1325134 () Bool)

(declare-fun Unit!43647 () Unit!43642)

(assert (=> b!1325134 (= e!755417 Unit!43647)))

(declare-fun b!1325135 () Bool)

(assert (=> b!1325135 (= e!755416 (isDefined!519 (getValueByKey!712 (toList!10588 (+!4611 lt!589546 (tuple2!23489 lt!589545 lt!589548))) lt!589549)))))

(assert (= (and d!142933 c!125690) b!1325133))

(assert (= (and d!142933 (not c!125690)) b!1325134))

(assert (= (and d!142933 (not res!879523)) b!1325135))

(declare-fun m!1213857 () Bool)

(assert (=> d!142933 m!1213857))

(declare-fun m!1213859 () Bool)

(assert (=> b!1325133 m!1213859))

(declare-fun m!1213861 () Bool)

(assert (=> b!1325133 m!1213861))

(assert (=> b!1325133 m!1213861))

(declare-fun m!1213863 () Bool)

(assert (=> b!1325133 m!1213863))

(assert (=> b!1325135 m!1213861))

(assert (=> b!1325135 m!1213861))

(assert (=> b!1325135 m!1213863))

(assert (=> b!1325000 d!142933))

(declare-fun d!142935 () Bool)

(declare-fun c!125691 () Bool)

(assert (=> d!142935 (= c!125691 ((_ is ValueCellFull!17241) (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun e!755418 () V!53475)

(assert (=> d!142935 (= (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!755418)))

(declare-fun b!1325136 () Bool)

(assert (=> b!1325136 (= e!755418 (get!21756 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1325137 () Bool)

(assert (=> b!1325137 (= e!755418 (get!21757 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142935 c!125691) b!1325136))

(assert (= (and d!142935 (not c!125691)) b!1325137))

(assert (=> b!1325136 m!1213721))

(assert (=> b!1325136 m!1213613))

(declare-fun m!1213865 () Bool)

(assert (=> b!1325136 m!1213865))

(assert (=> b!1325137 m!1213721))

(assert (=> b!1325137 m!1213613))

(declare-fun m!1213867 () Bool)

(assert (=> b!1325137 m!1213867))

(assert (=> b!1325000 d!142935))

(declare-fun d!142937 () Bool)

(declare-fun e!755419 () Bool)

(assert (=> d!142937 e!755419))

(declare-fun res!879525 () Bool)

(assert (=> d!142937 (=> (not res!879525) (not e!755419))))

(declare-fun lt!589653 () ListLongMap!21145)

(assert (=> d!142937 (= res!879525 (contains!8743 lt!589653 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!589655 () List!30628)

(assert (=> d!142937 (= lt!589653 (ListLongMap!21146 lt!589655))))

(declare-fun lt!589656 () Unit!43642)

(declare-fun lt!589654 () Unit!43642)

(assert (=> d!142937 (= lt!589656 lt!589654)))

(assert (=> d!142937 (= (getValueByKey!712 lt!589655 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!763 (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142937 (= lt!589654 (lemmaContainsTupThenGetReturnValue!357 lt!589655 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142937 (= lt!589655 (insertStrictlySorted!486 (toList!10588 call!64687) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142937 (= (+!4611 call!64687 (tuple2!23489 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!589653)))

(declare-fun b!1325138 () Bool)

(declare-fun res!879524 () Bool)

(assert (=> b!1325138 (=> (not res!879524) (not e!755419))))

(assert (=> b!1325138 (= res!879524 (= (getValueByKey!712 (toList!10588 lt!589653) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!763 (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1325139 () Bool)

(assert (=> b!1325139 (= e!755419 (contains!8744 (toList!10588 lt!589653) (tuple2!23489 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142937 res!879525) b!1325138))

(assert (= (and b!1325138 res!879524) b!1325139))

(declare-fun m!1213869 () Bool)

(assert (=> d!142937 m!1213869))

(declare-fun m!1213871 () Bool)

(assert (=> d!142937 m!1213871))

(declare-fun m!1213873 () Bool)

(assert (=> d!142937 m!1213873))

(declare-fun m!1213875 () Bool)

(assert (=> d!142937 m!1213875))

(declare-fun m!1213877 () Bool)

(assert (=> b!1325138 m!1213877))

(declare-fun m!1213879 () Bool)

(assert (=> b!1325139 m!1213879))

(assert (=> b!1325000 d!142937))

(declare-fun lt!589659 () Bool)

(declare-fun d!142939 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!653 (List!30628) (InoxSet tuple2!23488))

(assert (=> d!142939 (= lt!589659 (select (content!653 (toList!10588 lt!589527)) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!755424 () Bool)

(assert (=> d!142939 (= lt!589659 e!755424)))

(declare-fun res!879531 () Bool)

(assert (=> d!142939 (=> (not res!879531) (not e!755424))))

(assert (=> d!142939 (= res!879531 ((_ is Cons!30624) (toList!10588 lt!589527)))))

(assert (=> d!142939 (= (contains!8744 (toList!10588 lt!589527) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!589659)))

(declare-fun b!1325144 () Bool)

(declare-fun e!755425 () Bool)

(assert (=> b!1325144 (= e!755424 e!755425)))

(declare-fun res!879530 () Bool)

(assert (=> b!1325144 (=> res!879530 e!755425)))

(assert (=> b!1325144 (= res!879530 (= (h!31833 (toList!10588 lt!589527)) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1325145 () Bool)

(assert (=> b!1325145 (= e!755425 (contains!8744 (t!44558 (toList!10588 lt!589527)) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142939 res!879531) b!1325144))

(assert (= (and b!1325144 (not res!879530)) b!1325145))

(declare-fun m!1213881 () Bool)

(assert (=> d!142939 m!1213881))

(declare-fun m!1213883 () Bool)

(assert (=> d!142939 m!1213883))

(declare-fun m!1213885 () Bool)

(assert (=> b!1325145 m!1213885))

(assert (=> b!1324964 d!142939))

(declare-fun d!142941 () Bool)

(declare-fun e!755426 () Bool)

(assert (=> d!142941 e!755426))

(declare-fun res!879533 () Bool)

(assert (=> d!142941 (=> (not res!879533) (not e!755426))))

(declare-fun lt!589660 () ListLongMap!21145)

(assert (=> d!142941 (= res!879533 (contains!8743 lt!589660 (_1!11755 (ite (or c!125673 c!125672) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun lt!589662 () List!30628)

(assert (=> d!142941 (= lt!589660 (ListLongMap!21146 lt!589662))))

(declare-fun lt!589663 () Unit!43642)

(declare-fun lt!589661 () Unit!43642)

(assert (=> d!142941 (= lt!589663 lt!589661)))

(assert (=> d!142941 (= (getValueByKey!712 lt!589662 (_1!11755 (ite (or c!125673 c!125672) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!763 (_2!11755 (ite (or c!125673 c!125672) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142941 (= lt!589661 (lemmaContainsTupThenGetReturnValue!357 lt!589662 (_1!11755 (ite (or c!125673 c!125672) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11755 (ite (or c!125673 c!125672) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142941 (= lt!589662 (insertStrictlySorted!486 (toList!10588 (ite c!125673 call!64703 (ite c!125672 call!64702 call!64708))) (_1!11755 (ite (or c!125673 c!125672) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11755 (ite (or c!125673 c!125672) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142941 (= (+!4611 (ite c!125673 call!64703 (ite c!125672 call!64702 call!64708)) (ite (or c!125673 c!125672) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!589660)))

(declare-fun b!1325146 () Bool)

(declare-fun res!879532 () Bool)

(assert (=> b!1325146 (=> (not res!879532) (not e!755426))))

(assert (=> b!1325146 (= res!879532 (= (getValueByKey!712 (toList!10588 lt!589660) (_1!11755 (ite (or c!125673 c!125672) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!763 (_2!11755 (ite (or c!125673 c!125672) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun b!1325147 () Bool)

(assert (=> b!1325147 (= e!755426 (contains!8744 (toList!10588 lt!589660) (ite (or c!125673 c!125672) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!142941 res!879533) b!1325146))

(assert (= (and b!1325146 res!879532) b!1325147))

(declare-fun m!1213887 () Bool)

(assert (=> d!142941 m!1213887))

(declare-fun m!1213889 () Bool)

(assert (=> d!142941 m!1213889))

(declare-fun m!1213891 () Bool)

(assert (=> d!142941 m!1213891))

(declare-fun m!1213893 () Bool)

(assert (=> d!142941 m!1213893))

(declare-fun m!1213895 () Bool)

(assert (=> b!1325146 m!1213895))

(declare-fun m!1213897 () Bool)

(assert (=> b!1325147 m!1213897))

(assert (=> bm!64702 d!142941))

(declare-fun b!1325148 () Bool)

(declare-fun e!755427 () Option!764)

(assert (=> b!1325148 (= e!755427 (Some!763 (_2!11755 (h!31833 (toList!10588 lt!589527)))))))

(declare-fun b!1325149 () Bool)

(declare-fun e!755428 () Option!764)

(assert (=> b!1325149 (= e!755427 e!755428)))

(declare-fun c!125693 () Bool)

(assert (=> b!1325149 (= c!125693 (and ((_ is Cons!30624) (toList!10588 lt!589527)) (not (= (_1!11755 (h!31833 (toList!10588 lt!589527))) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!125692 () Bool)

(declare-fun d!142943 () Bool)

(assert (=> d!142943 (= c!125692 (and ((_ is Cons!30624) (toList!10588 lt!589527)) (= (_1!11755 (h!31833 (toList!10588 lt!589527))) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!142943 (= (getValueByKey!712 (toList!10588 lt!589527) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!755427)))

(declare-fun b!1325151 () Bool)

(assert (=> b!1325151 (= e!755428 None!762)))

(declare-fun b!1325150 () Bool)

(assert (=> b!1325150 (= e!755428 (getValueByKey!712 (t!44558 (toList!10588 lt!589527)) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!142943 c!125692) b!1325148))

(assert (= (and d!142943 (not c!125692)) b!1325149))

(assert (= (and b!1325149 c!125693) b!1325150))

(assert (= (and b!1325149 (not c!125693)) b!1325151))

(declare-fun m!1213899 () Bool)

(assert (=> b!1325150 m!1213899))

(assert (=> b!1324963 d!142943))

(declare-fun b!1325153 () Bool)

(declare-fun e!755431 () Bool)

(declare-fun e!755430 () Bool)

(assert (=> b!1325153 (= e!755431 e!755430)))

(assert (=> b!1325153 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43757 _keys!1609)))))

(declare-fun res!879537 () Bool)

(declare-fun lt!589669 () ListLongMap!21145)

(assert (=> b!1325153 (= res!879537 (contains!8743 lt!589669 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001))))))

(assert (=> b!1325153 (=> (not res!879537) (not e!755430))))

(declare-fun b!1325154 () Bool)

(assert (=> b!1325154 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43757 _keys!1609)))))

(assert (=> b!1325154 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43758 _values!1337)))))

(assert (=> b!1325154 (= e!755430 (= (apply!1029 lt!589669 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001))) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!64712 () Bool)

(declare-fun call!64715 () ListLongMap!21145)

(assert (=> bm!64712 (= call!64715 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1325155 () Bool)

(declare-fun e!755432 () ListLongMap!21145)

(assert (=> b!1325155 (= e!755432 call!64715)))

(declare-fun b!1325156 () Bool)

(declare-fun e!755433 () ListLongMap!21145)

(assert (=> b!1325156 (= e!755433 (ListLongMap!21146 Nil!30625))))

(declare-fun b!1325157 () Bool)

(declare-fun lt!589666 () Unit!43642)

(declare-fun lt!589670 () Unit!43642)

(assert (=> b!1325157 (= lt!589666 lt!589670)))

(declare-fun lt!589668 () (_ BitVec 64))

(declare-fun lt!589665 () ListLongMap!21145)

(declare-fun lt!589664 () (_ BitVec 64))

(declare-fun lt!589667 () V!53475)

(assert (=> b!1325157 (not (contains!8743 (+!4611 lt!589665 (tuple2!23489 lt!589664 lt!589667)) lt!589668))))

(assert (=> b!1325157 (= lt!589670 (addStillNotContains!493 lt!589665 lt!589664 lt!589667 lt!589668))))

(assert (=> b!1325157 (= lt!589668 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1325157 (= lt!589667 (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1325157 (= lt!589664 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)))))

(assert (=> b!1325157 (= lt!589665 call!64715)))

(assert (=> b!1325157 (= e!755432 (+!4611 call!64715 (tuple2!23489 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)) (get!21755 (select (arr!43208 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1325158 () Bool)

(declare-fun res!879534 () Bool)

(declare-fun e!755434 () Bool)

(assert (=> b!1325158 (=> (not res!879534) (not e!755434))))

(assert (=> b!1325158 (= res!879534 (not (contains!8743 lt!589669 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1325159 () Bool)

(assert (=> b!1325159 (= e!755433 e!755432)))

(declare-fun c!125696 () Bool)

(assert (=> b!1325159 (= c!125696 (validKeyInArray!0 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001))))))

(declare-fun d!142945 () Bool)

(assert (=> d!142945 e!755434))

(declare-fun res!879536 () Bool)

(assert (=> d!142945 (=> (not res!879536) (not e!755434))))

(assert (=> d!142945 (= res!879536 (not (contains!8743 lt!589669 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142945 (= lt!589669 e!755433)))

(declare-fun c!125697 () Bool)

(assert (=> d!142945 (= c!125697 (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43757 _keys!1609)))))

(assert (=> d!142945 (validMask!0 mask!2019)))

(assert (=> d!142945 (= (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340) lt!589669)))

(declare-fun b!1325152 () Bool)

(declare-fun e!755435 () Bool)

(assert (=> b!1325152 (= e!755431 e!755435)))

(declare-fun c!125695 () Bool)

(assert (=> b!1325152 (= c!125695 (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43757 _keys!1609)))))

(declare-fun b!1325160 () Bool)

(assert (=> b!1325160 (= e!755434 e!755431)))

(declare-fun c!125694 () Bool)

(declare-fun e!755429 () Bool)

(assert (=> b!1325160 (= c!125694 e!755429)))

(declare-fun res!879535 () Bool)

(assert (=> b!1325160 (=> (not res!879535) (not e!755429))))

(assert (=> b!1325160 (= res!879535 (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43757 _keys!1609)))))

(declare-fun b!1325161 () Bool)

(assert (=> b!1325161 (= e!755435 (= lt!589669 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun b!1325162 () Bool)

(assert (=> b!1325162 (= e!755435 (isEmpty!1075 lt!589669))))

(declare-fun b!1325163 () Bool)

(assert (=> b!1325163 (= e!755429 (validKeyInArray!0 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001))))))

(assert (=> b!1325163 (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (= (and d!142945 c!125697) b!1325156))

(assert (= (and d!142945 (not c!125697)) b!1325159))

(assert (= (and b!1325159 c!125696) b!1325157))

(assert (= (and b!1325159 (not c!125696)) b!1325155))

(assert (= (or b!1325157 b!1325155) bm!64712))

(assert (= (and d!142945 res!879536) b!1325158))

(assert (= (and b!1325158 res!879534) b!1325160))

(assert (= (and b!1325160 res!879535) b!1325163))

(assert (= (and b!1325160 c!125694) b!1325153))

(assert (= (and b!1325160 (not c!125694)) b!1325152))

(assert (= (and b!1325153 res!879537) b!1325154))

(assert (= (and b!1325152 c!125695) b!1325161))

(assert (= (and b!1325152 (not c!125695)) b!1325162))

(declare-fun b_lambda!23725 () Bool)

(assert (=> (not b_lambda!23725) (not b!1325154)))

(assert (=> b!1325154 t!44557))

(declare-fun b_and!49013 () Bool)

(assert (= b_and!49011 (and (=> t!44557 result!24521) b_and!49013)))

(declare-fun b_lambda!23727 () Bool)

(assert (=> (not b_lambda!23727) (not b!1325157)))

(assert (=> b!1325157 t!44557))

(declare-fun b_and!49015 () Bool)

(assert (= b_and!49013 (and (=> t!44557 result!24521) b_and!49015)))

(declare-fun m!1213901 () Bool)

(assert (=> b!1325158 m!1213901))

(declare-fun m!1213903 () Bool)

(assert (=> d!142945 m!1213903))

(assert (=> d!142945 m!1213631))

(declare-fun m!1213905 () Bool)

(assert (=> b!1325161 m!1213905))

(declare-fun m!1213907 () Bool)

(assert (=> b!1325153 m!1213907))

(assert (=> b!1325153 m!1213907))

(declare-fun m!1213909 () Bool)

(assert (=> b!1325153 m!1213909))

(declare-fun m!1213911 () Bool)

(assert (=> b!1325162 m!1213911))

(assert (=> b!1325159 m!1213907))

(assert (=> b!1325159 m!1213907))

(declare-fun m!1213913 () Bool)

(assert (=> b!1325159 m!1213913))

(declare-fun m!1213915 () Bool)

(assert (=> b!1325157 m!1213915))

(assert (=> b!1325157 m!1213613))

(declare-fun m!1213917 () Bool)

(assert (=> b!1325157 m!1213917))

(declare-fun m!1213919 () Bool)

(assert (=> b!1325157 m!1213919))

(declare-fun m!1213921 () Bool)

(assert (=> b!1325157 m!1213921))

(declare-fun m!1213923 () Bool)

(assert (=> b!1325157 m!1213923))

(assert (=> b!1325157 m!1213907))

(declare-fun m!1213925 () Bool)

(assert (=> b!1325157 m!1213925))

(assert (=> b!1325157 m!1213915))

(assert (=> b!1325157 m!1213921))

(assert (=> b!1325157 m!1213613))

(assert (=> b!1325163 m!1213907))

(assert (=> b!1325163 m!1213907))

(assert (=> b!1325163 m!1213913))

(assert (=> bm!64712 m!1213905))

(assert (=> b!1325154 m!1213915))

(assert (=> b!1325154 m!1213613))

(assert (=> b!1325154 m!1213917))

(assert (=> b!1325154 m!1213907))

(declare-fun m!1213927 () Bool)

(assert (=> b!1325154 m!1213927))

(assert (=> b!1325154 m!1213907))

(assert (=> b!1325154 m!1213613))

(assert (=> b!1325154 m!1213915))

(assert (=> bm!64684 d!142945))

(declare-fun d!142947 () Bool)

(declare-fun get!21758 (Option!764) V!53475)

(assert (=> d!142947 (= (apply!1029 lt!589550 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21758 (getValueByKey!712 (toList!10588 lt!589550) (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))))

(declare-fun bs!37896 () Bool)

(assert (= bs!37896 d!142947))

(assert (=> bs!37896 m!1213713))

(declare-fun m!1213929 () Bool)

(assert (=> bs!37896 m!1213929))

(assert (=> bs!37896 m!1213929))

(declare-fun m!1213931 () Bool)

(assert (=> bs!37896 m!1213931))

(assert (=> b!1324997 d!142947))

(assert (=> b!1324997 d!142935))

(declare-fun d!142949 () Bool)

(assert (=> d!142949 (= (apply!1029 lt!589616 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21758 (getValueByKey!712 (toList!10588 lt!589616) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37897 () Bool)

(assert (= bs!37897 d!142949))

(declare-fun m!1213933 () Bool)

(assert (=> bs!37897 m!1213933))

(assert (=> bs!37897 m!1213933))

(declare-fun m!1213935 () Bool)

(assert (=> bs!37897 m!1213935))

(assert (=> b!1325063 d!142949))

(declare-fun d!142951 () Bool)

(declare-fun isEmpty!1077 (List!30628) Bool)

(assert (=> d!142951 (= (isEmpty!1075 lt!589550) (isEmpty!1077 (toList!10588 lt!589550)))))

(declare-fun bs!37898 () Bool)

(assert (= bs!37898 d!142951))

(declare-fun m!1213937 () Bool)

(assert (=> bs!37898 m!1213937))

(assert (=> b!1325005 d!142951))

(declare-fun b!1325165 () Bool)

(declare-fun e!755438 () Bool)

(declare-fun e!755437 () Bool)

(assert (=> b!1325165 (= e!755438 e!755437)))

(assert (=> b!1325165 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43757 _keys!1609)))))

(declare-fun res!879541 () Bool)

(declare-fun lt!589676 () ListLongMap!21145)

(assert (=> b!1325165 (= res!879541 (contains!8743 lt!589676 (select (arr!43207 _keys!1609) from!2000)))))

(assert (=> b!1325165 (=> (not res!879541) (not e!755437))))

(declare-fun b!1325166 () Bool)

(assert (=> b!1325166 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43757 _keys!1609)))))

(assert (=> b!1325166 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43758 _values!1337)))))

(assert (=> b!1325166 (= e!755437 (= (apply!1029 lt!589676 (select (arr!43207 _keys!1609) from!2000)) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!64716 () ListLongMap!21145)

(declare-fun bm!64713 () Bool)

(assert (=> bm!64713 (= call!64716 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1325167 () Bool)

(declare-fun e!755439 () ListLongMap!21145)

(assert (=> b!1325167 (= e!755439 call!64716)))

(declare-fun b!1325168 () Bool)

(declare-fun e!755440 () ListLongMap!21145)

(assert (=> b!1325168 (= e!755440 (ListLongMap!21146 Nil!30625))))

(declare-fun b!1325169 () Bool)

(declare-fun lt!589673 () Unit!43642)

(declare-fun lt!589677 () Unit!43642)

(assert (=> b!1325169 (= lt!589673 lt!589677)))

(declare-fun lt!589675 () (_ BitVec 64))

(declare-fun lt!589671 () (_ BitVec 64))

(declare-fun lt!589674 () V!53475)

(declare-fun lt!589672 () ListLongMap!21145)

(assert (=> b!1325169 (not (contains!8743 (+!4611 lt!589672 (tuple2!23489 lt!589671 lt!589674)) lt!589675))))

(assert (=> b!1325169 (= lt!589677 (addStillNotContains!493 lt!589672 lt!589671 lt!589674 lt!589675))))

(assert (=> b!1325169 (= lt!589675 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1325169 (= lt!589674 (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1325169 (= lt!589671 (select (arr!43207 _keys!1609) from!2000))))

(assert (=> b!1325169 (= lt!589672 call!64716)))

(assert (=> b!1325169 (= e!755439 (+!4611 call!64716 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1325170 () Bool)

(declare-fun res!879538 () Bool)

(declare-fun e!755441 () Bool)

(assert (=> b!1325170 (=> (not res!879538) (not e!755441))))

(assert (=> b!1325170 (= res!879538 (not (contains!8743 lt!589676 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1325171 () Bool)

(assert (=> b!1325171 (= e!755440 e!755439)))

(declare-fun c!125700 () Bool)

(assert (=> b!1325171 (= c!125700 (validKeyInArray!0 (select (arr!43207 _keys!1609) from!2000)))))

(declare-fun d!142953 () Bool)

(assert (=> d!142953 e!755441))

(declare-fun res!879540 () Bool)

(assert (=> d!142953 (=> (not res!879540) (not e!755441))))

(assert (=> d!142953 (= res!879540 (not (contains!8743 lt!589676 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142953 (= lt!589676 e!755440)))

(declare-fun c!125701 () Bool)

(assert (=> d!142953 (= c!125701 (bvsge from!2000 (size!43757 _keys!1609)))))

(assert (=> d!142953 (validMask!0 mask!2019)))

(assert (=> d!142953 (= (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!589676)))

(declare-fun b!1325164 () Bool)

(declare-fun e!755442 () Bool)

(assert (=> b!1325164 (= e!755438 e!755442)))

(declare-fun c!125699 () Bool)

(assert (=> b!1325164 (= c!125699 (bvslt from!2000 (size!43757 _keys!1609)))))

(declare-fun b!1325172 () Bool)

(assert (=> b!1325172 (= e!755441 e!755438)))

(declare-fun c!125698 () Bool)

(declare-fun e!755436 () Bool)

(assert (=> b!1325172 (= c!125698 e!755436)))

(declare-fun res!879539 () Bool)

(assert (=> b!1325172 (=> (not res!879539) (not e!755436))))

(assert (=> b!1325172 (= res!879539 (bvslt from!2000 (size!43757 _keys!1609)))))

(declare-fun b!1325173 () Bool)

(assert (=> b!1325173 (= e!755442 (= lt!589676 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun b!1325174 () Bool)

(assert (=> b!1325174 (= e!755442 (isEmpty!1075 lt!589676))))

(declare-fun b!1325175 () Bool)

(assert (=> b!1325175 (= e!755436 (validKeyInArray!0 (select (arr!43207 _keys!1609) from!2000)))))

(assert (=> b!1325175 (bvsge from!2000 #b00000000000000000000000000000000)))

(assert (= (and d!142953 c!125701) b!1325168))

(assert (= (and d!142953 (not c!125701)) b!1325171))

(assert (= (and b!1325171 c!125700) b!1325169))

(assert (= (and b!1325171 (not c!125700)) b!1325167))

(assert (= (or b!1325169 b!1325167) bm!64713))

(assert (= (and d!142953 res!879540) b!1325170))

(assert (= (and b!1325170 res!879538) b!1325172))

(assert (= (and b!1325172 res!879539) b!1325175))

(assert (= (and b!1325172 c!125698) b!1325165))

(assert (= (and b!1325172 (not c!125698)) b!1325164))

(assert (= (and b!1325165 res!879541) b!1325166))

(assert (= (and b!1325164 c!125699) b!1325173))

(assert (= (and b!1325164 (not c!125699)) b!1325174))

(declare-fun b_lambda!23729 () Bool)

(assert (=> (not b_lambda!23729) (not b!1325166)))

(assert (=> b!1325166 t!44557))

(declare-fun b_and!49017 () Bool)

(assert (= b_and!49015 (and (=> t!44557 result!24521) b_and!49017)))

(declare-fun b_lambda!23731 () Bool)

(assert (=> (not b_lambda!23731) (not b!1325169)))

(assert (=> b!1325169 t!44557))

(declare-fun b_and!49019 () Bool)

(assert (= b_and!49017 (and (=> t!44557 result!24521) b_and!49019)))

(declare-fun m!1213939 () Bool)

(assert (=> b!1325170 m!1213939))

(declare-fun m!1213941 () Bool)

(assert (=> d!142953 m!1213941))

(assert (=> d!142953 m!1213631))

(declare-fun m!1213943 () Bool)

(assert (=> b!1325173 m!1213943))

(assert (=> b!1325165 m!1213625))

(assert (=> b!1325165 m!1213625))

(declare-fun m!1213945 () Bool)

(assert (=> b!1325165 m!1213945))

(declare-fun m!1213947 () Bool)

(assert (=> b!1325174 m!1213947))

(assert (=> b!1325171 m!1213625))

(assert (=> b!1325171 m!1213625))

(assert (=> b!1325171 m!1213645))

(assert (=> b!1325169 m!1213621))

(assert (=> b!1325169 m!1213613))

(assert (=> b!1325169 m!1213627))

(declare-fun m!1213949 () Bool)

(assert (=> b!1325169 m!1213949))

(declare-fun m!1213951 () Bool)

(assert (=> b!1325169 m!1213951))

(declare-fun m!1213953 () Bool)

(assert (=> b!1325169 m!1213953))

(assert (=> b!1325169 m!1213625))

(declare-fun m!1213955 () Bool)

(assert (=> b!1325169 m!1213955))

(assert (=> b!1325169 m!1213621))

(assert (=> b!1325169 m!1213951))

(assert (=> b!1325169 m!1213613))

(assert (=> b!1325175 m!1213625))

(assert (=> b!1325175 m!1213625))

(assert (=> b!1325175 m!1213645))

(assert (=> bm!64713 m!1213943))

(assert (=> b!1325166 m!1213621))

(assert (=> b!1325166 m!1213613))

(assert (=> b!1325166 m!1213627))

(assert (=> b!1325166 m!1213625))

(declare-fun m!1213957 () Bool)

(assert (=> b!1325166 m!1213957))

(assert (=> b!1325166 m!1213625))

(assert (=> b!1325166 m!1213613))

(assert (=> b!1325166 m!1213621))

(assert (=> bm!64703 d!142953))

(declare-fun d!142955 () Bool)

(assert (=> d!142955 (arrayContainsKey!0 _keys!1609 lt!589638 #b00000000000000000000000000000000)))

(declare-fun lt!589680 () Unit!43642)

(declare-fun choose!13 (array!89466 (_ BitVec 64) (_ BitVec 32)) Unit!43642)

(assert (=> d!142955 (= lt!589680 (choose!13 _keys!1609 lt!589638 #b00000000000000000000000000000000))))

(assert (=> d!142955 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!142955 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!589638 #b00000000000000000000000000000000) lt!589680)))

(declare-fun bs!37899 () Bool)

(assert (= bs!37899 d!142955))

(assert (=> bs!37899 m!1213819))

(declare-fun m!1213959 () Bool)

(assert (=> bs!37899 m!1213959))

(assert (=> b!1325085 d!142955))

(declare-fun d!142957 () Bool)

(declare-fun res!879546 () Bool)

(declare-fun e!755447 () Bool)

(assert (=> d!142957 (=> res!879546 e!755447)))

(assert (=> d!142957 (= res!879546 (= (select (arr!43207 _keys!1609) #b00000000000000000000000000000000) lt!589638))))

(assert (=> d!142957 (= (arrayContainsKey!0 _keys!1609 lt!589638 #b00000000000000000000000000000000) e!755447)))

(declare-fun b!1325180 () Bool)

(declare-fun e!755448 () Bool)

(assert (=> b!1325180 (= e!755447 e!755448)))

(declare-fun res!879547 () Bool)

(assert (=> b!1325180 (=> (not res!879547) (not e!755448))))

(assert (=> b!1325180 (= res!879547 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43757 _keys!1609)))))

(declare-fun b!1325181 () Bool)

(assert (=> b!1325181 (= e!755448 (arrayContainsKey!0 _keys!1609 lt!589638 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!142957 (not res!879546)) b!1325180))

(assert (= (and b!1325180 res!879547) b!1325181))

(assert (=> d!142957 m!1213815))

(declare-fun m!1213961 () Bool)

(assert (=> b!1325181 m!1213961))

(assert (=> b!1325085 d!142957))

(declare-fun b!1325194 () Bool)

(declare-fun e!755456 () SeekEntryResult!10040)

(declare-fun lt!589687 () SeekEntryResult!10040)

(assert (=> b!1325194 (= e!755456 (MissingZero!10040 (index!42533 lt!589687)))))

(declare-fun b!1325195 () Bool)

(declare-fun c!125709 () Bool)

(declare-fun lt!589689 () (_ BitVec 64))

(assert (=> b!1325195 (= c!125709 (= lt!589689 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!755455 () SeekEntryResult!10040)

(assert (=> b!1325195 (= e!755455 e!755456)))

(declare-fun b!1325196 () Bool)

(declare-fun e!755457 () SeekEntryResult!10040)

(assert (=> b!1325196 (= e!755457 Undefined!10040)))

(declare-fun d!142959 () Bool)

(declare-fun lt!589688 () SeekEntryResult!10040)

(assert (=> d!142959 (and (or ((_ is Undefined!10040) lt!589688) (not ((_ is Found!10040) lt!589688)) (and (bvsge (index!42532 lt!589688) #b00000000000000000000000000000000) (bvslt (index!42532 lt!589688) (size!43757 _keys!1609)))) (or ((_ is Undefined!10040) lt!589688) ((_ is Found!10040) lt!589688) (not ((_ is MissingZero!10040) lt!589688)) (and (bvsge (index!42531 lt!589688) #b00000000000000000000000000000000) (bvslt (index!42531 lt!589688) (size!43757 _keys!1609)))) (or ((_ is Undefined!10040) lt!589688) ((_ is Found!10040) lt!589688) ((_ is MissingZero!10040) lt!589688) (not ((_ is MissingVacant!10040) lt!589688)) (and (bvsge (index!42534 lt!589688) #b00000000000000000000000000000000) (bvslt (index!42534 lt!589688) (size!43757 _keys!1609)))) (or ((_ is Undefined!10040) lt!589688) (ite ((_ is Found!10040) lt!589688) (= (select (arr!43207 _keys!1609) (index!42532 lt!589688)) (select (arr!43207 _keys!1609) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10040) lt!589688) (= (select (arr!43207 _keys!1609) (index!42531 lt!589688)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10040) lt!589688) (= (select (arr!43207 _keys!1609) (index!42534 lt!589688)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142959 (= lt!589688 e!755457)))

(declare-fun c!125710 () Bool)

(assert (=> d!142959 (= c!125710 (and ((_ is Intermediate!10040) lt!589687) (undefined!10852 lt!589687)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!89466 (_ BitVec 32)) SeekEntryResult!10040)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!142959 (= lt!589687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000) mask!2019) (select (arr!43207 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019))))

(assert (=> d!142959 (validMask!0 mask!2019)))

(assert (=> d!142959 (= (seekEntryOrOpen!0 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) lt!589688)))

(declare-fun b!1325197 () Bool)

(assert (=> b!1325197 (= e!755455 (Found!10040 (index!42533 lt!589687)))))

(declare-fun b!1325198 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!89466 (_ BitVec 32)) SeekEntryResult!10040)

(assert (=> b!1325198 (= e!755456 (seekKeyOrZeroReturnVacant!0 (x!118108 lt!589687) (index!42533 lt!589687) (index!42533 lt!589687) (select (arr!43207 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019))))

(declare-fun b!1325199 () Bool)

(assert (=> b!1325199 (= e!755457 e!755455)))

(assert (=> b!1325199 (= lt!589689 (select (arr!43207 _keys!1609) (index!42533 lt!589687)))))

(declare-fun c!125708 () Bool)

(assert (=> b!1325199 (= c!125708 (= lt!589689 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!142959 c!125710) b!1325196))

(assert (= (and d!142959 (not c!125710)) b!1325199))

(assert (= (and b!1325199 c!125708) b!1325197))

(assert (= (and b!1325199 (not c!125708)) b!1325195))

(assert (= (and b!1325195 c!125709) b!1325194))

(assert (= (and b!1325195 (not c!125709)) b!1325198))

(assert (=> d!142959 m!1213815))

(declare-fun m!1213963 () Bool)

(assert (=> d!142959 m!1213963))

(declare-fun m!1213965 () Bool)

(assert (=> d!142959 m!1213965))

(declare-fun m!1213967 () Bool)

(assert (=> d!142959 m!1213967))

(assert (=> d!142959 m!1213631))

(assert (=> d!142959 m!1213963))

(assert (=> d!142959 m!1213815))

(declare-fun m!1213969 () Bool)

(assert (=> d!142959 m!1213969))

(declare-fun m!1213971 () Bool)

(assert (=> d!142959 m!1213971))

(assert (=> b!1325198 m!1213815))

(declare-fun m!1213973 () Bool)

(assert (=> b!1325198 m!1213973))

(declare-fun m!1213975 () Bool)

(assert (=> b!1325199 m!1213975))

(assert (=> b!1325085 d!142959))

(declare-fun d!142961 () Bool)

(assert (=> d!142961 (= (validKeyInArray!0 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (and (not (= (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1325006 d!142961))

(assert (=> b!1325004 d!142945))

(assert (=> d!142909 d!142911))

(declare-fun d!142963 () Bool)

(declare-fun e!755458 () Bool)

(assert (=> d!142963 e!755458))

(declare-fun res!879549 () Bool)

(assert (=> d!142963 (=> (not res!879549) (not e!755458))))

(declare-fun lt!589690 () ListLongMap!21145)

(assert (=> d!142963 (= res!879549 (contains!8743 lt!589690 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!589692 () List!30628)

(assert (=> d!142963 (= lt!589690 (ListLongMap!21146 lt!589692))))

(declare-fun lt!589693 () Unit!43642)

(declare-fun lt!589691 () Unit!43642)

(assert (=> d!142963 (= lt!589693 lt!589691)))

(assert (=> d!142963 (= (getValueByKey!712 lt!589692 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!763 (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142963 (= lt!589691 (lemmaContainsTupThenGetReturnValue!357 lt!589692 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142963 (= lt!589692 (insertStrictlySorted!486 (toList!10588 call!64707) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142963 (= (+!4611 call!64707 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!589690)))

(declare-fun b!1325200 () Bool)

(declare-fun res!879548 () Bool)

(assert (=> b!1325200 (=> (not res!879548) (not e!755458))))

(assert (=> b!1325200 (= res!879548 (= (getValueByKey!712 (toList!10588 lt!589690) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!763 (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1325201 () Bool)

(assert (=> b!1325201 (= e!755458 (contains!8744 (toList!10588 lt!589690) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!142963 res!879549) b!1325200))

(assert (= (and b!1325200 res!879548) b!1325201))

(declare-fun m!1213977 () Bool)

(assert (=> d!142963 m!1213977))

(declare-fun m!1213979 () Bool)

(assert (=> d!142963 m!1213979))

(declare-fun m!1213981 () Bool)

(assert (=> d!142963 m!1213981))

(declare-fun m!1213983 () Bool)

(assert (=> d!142963 m!1213983))

(declare-fun m!1213985 () Bool)

(assert (=> b!1325200 m!1213985))

(declare-fun m!1213987 () Bool)

(assert (=> b!1325201 m!1213987))

(assert (=> b!1325070 d!142963))

(declare-fun d!142965 () Bool)

(declare-fun res!879554 () Bool)

(declare-fun e!755463 () Bool)

(assert (=> d!142965 (=> res!879554 e!755463)))

(assert (=> d!142965 (= res!879554 (and ((_ is Cons!30624) (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (= (_1!11755 (h!31833 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(assert (=> d!142965 (= (containsKey!734 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) e!755463)))

(declare-fun b!1325206 () Bool)

(declare-fun e!755464 () Bool)

(assert (=> b!1325206 (= e!755463 e!755464)))

(declare-fun res!879555 () Bool)

(assert (=> b!1325206 (=> (not res!879555) (not e!755464))))

(assert (=> b!1325206 (= res!879555 (and (or (not ((_ is Cons!30624) (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) (bvsle (_1!11755 (h!31833 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)) ((_ is Cons!30624) (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (bvslt (_1!11755 (h!31833 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(declare-fun b!1325207 () Bool)

(assert (=> b!1325207 (= e!755464 (containsKey!734 (t!44558 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) k0!1164))))

(assert (= (and d!142965 (not res!879554)) b!1325206))

(assert (= (and b!1325206 res!879555) b!1325207))

(declare-fun m!1213989 () Bool)

(assert (=> b!1325207 m!1213989))

(assert (=> d!142907 d!142965))

(declare-fun d!142967 () Bool)

(assert (=> d!142967 (= (apply!1029 lt!589616 (select (arr!43207 _keys!1609) from!2000)) (get!21758 (getValueByKey!712 (toList!10588 lt!589616) (select (arr!43207 _keys!1609) from!2000))))))

(declare-fun bs!37900 () Bool)

(assert (= bs!37900 d!142967))

(assert (=> bs!37900 m!1213625))

(declare-fun m!1213991 () Bool)

(assert (=> bs!37900 m!1213991))

(assert (=> bs!37900 m!1213991))

(declare-fun m!1213993 () Bool)

(assert (=> bs!37900 m!1213993))

(assert (=> b!1325068 d!142967))

(assert (=> b!1325068 d!142899))

(declare-fun d!142969 () Bool)

(declare-fun e!755465 () Bool)

(assert (=> d!142969 e!755465))

(declare-fun res!879556 () Bool)

(assert (=> d!142969 (=> res!879556 e!755465)))

(declare-fun lt!589697 () Bool)

(assert (=> d!142969 (= res!879556 (not lt!589697))))

(declare-fun lt!589695 () Bool)

(assert (=> d!142969 (= lt!589697 lt!589695)))

(declare-fun lt!589696 () Unit!43642)

(declare-fun e!755466 () Unit!43642)

(assert (=> d!142969 (= lt!589696 e!755466)))

(declare-fun c!125711 () Bool)

(assert (=> d!142969 (= c!125711 lt!589695)))

(assert (=> d!142969 (= lt!589695 (containsKey!734 (toList!10588 lt!589556) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!142969 (= (contains!8743 lt!589556 (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) lt!589697)))

(declare-fun b!1325208 () Bool)

(declare-fun lt!589694 () Unit!43642)

(assert (=> b!1325208 (= e!755466 lt!589694)))

(assert (=> b!1325208 (= lt!589694 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 lt!589556) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> b!1325208 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589556) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun b!1325209 () Bool)

(declare-fun Unit!43648 () Unit!43642)

(assert (=> b!1325209 (= e!755466 Unit!43648)))

(declare-fun b!1325210 () Bool)

(assert (=> b!1325210 (= e!755465 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589556) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (= (and d!142969 c!125711) b!1325208))

(assert (= (and d!142969 (not c!125711)) b!1325209))

(assert (= (and d!142969 (not res!879556)) b!1325210))

(declare-fun m!1213995 () Bool)

(assert (=> d!142969 m!1213995))

(declare-fun m!1213997 () Bool)

(assert (=> b!1325208 m!1213997))

(assert (=> b!1325208 m!1213755))

(assert (=> b!1325208 m!1213755))

(declare-fun m!1213999 () Bool)

(assert (=> b!1325208 m!1213999))

(assert (=> b!1325210 m!1213755))

(assert (=> b!1325210 m!1213755))

(assert (=> b!1325210 m!1213999))

(assert (=> d!142905 d!142969))

(declare-fun b!1325211 () Bool)

(declare-fun e!755467 () Option!764)

(assert (=> b!1325211 (= e!755467 (Some!763 (_2!11755 (h!31833 lt!589558))))))

(declare-fun b!1325212 () Bool)

(declare-fun e!755468 () Option!764)

(assert (=> b!1325212 (= e!755467 e!755468)))

(declare-fun c!125713 () Bool)

(assert (=> b!1325212 (= c!125713 (and ((_ is Cons!30624) lt!589558) (not (= (_1!11755 (h!31833 lt!589558)) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))))

(declare-fun d!142971 () Bool)

(declare-fun c!125712 () Bool)

(assert (=> d!142971 (= c!125712 (and ((_ is Cons!30624) lt!589558) (= (_1!11755 (h!31833 lt!589558)) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (=> d!142971 (= (getValueByKey!712 lt!589558 (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) e!755467)))

(declare-fun b!1325214 () Bool)

(assert (=> b!1325214 (= e!755468 None!762)))

(declare-fun b!1325213 () Bool)

(assert (=> b!1325213 (= e!755468 (getValueByKey!712 (t!44558 lt!589558) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (= (and d!142971 c!125712) b!1325211))

(assert (= (and d!142971 (not c!125712)) b!1325212))

(assert (= (and b!1325212 c!125713) b!1325213))

(assert (= (and b!1325212 (not c!125713)) b!1325214))

(declare-fun m!1214001 () Bool)

(assert (=> b!1325213 m!1214001))

(assert (=> d!142905 d!142971))

(declare-fun d!142973 () Bool)

(assert (=> d!142973 (= (getValueByKey!712 lt!589558 (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (Some!763 (_2!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun lt!589700 () Unit!43642)

(declare-fun choose!1947 (List!30628 (_ BitVec 64) V!53475) Unit!43642)

(assert (=> d!142973 (= lt!589700 (choose!1947 lt!589558 (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun e!755471 () Bool)

(assert (=> d!142973 e!755471))

(declare-fun res!879561 () Bool)

(assert (=> d!142973 (=> (not res!879561) (not e!755471))))

(assert (=> d!142973 (= res!879561 (isStrictlySorted!876 lt!589558))))

(assert (=> d!142973 (= (lemmaContainsTupThenGetReturnValue!357 lt!589558 (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) lt!589700)))

(declare-fun b!1325219 () Bool)

(declare-fun res!879562 () Bool)

(assert (=> b!1325219 (=> (not res!879562) (not e!755471))))

(assert (=> b!1325219 (= res!879562 (containsKey!734 lt!589558 (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun b!1325220 () Bool)

(assert (=> b!1325220 (= e!755471 (contains!8744 lt!589558 (tuple2!23489 (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (= (and d!142973 res!879561) b!1325219))

(assert (= (and b!1325219 res!879562) b!1325220))

(assert (=> d!142973 m!1213749))

(declare-fun m!1214003 () Bool)

(assert (=> d!142973 m!1214003))

(declare-fun m!1214005 () Bool)

(assert (=> d!142973 m!1214005))

(declare-fun m!1214007 () Bool)

(assert (=> b!1325219 m!1214007))

(declare-fun m!1214009 () Bool)

(assert (=> b!1325220 m!1214009))

(assert (=> d!142905 d!142973))

(declare-fun b!1325241 () Bool)

(declare-fun e!755483 () Bool)

(declare-fun lt!589703 () List!30628)

(assert (=> b!1325241 (= e!755483 (contains!8744 lt!589703 (tuple2!23489 (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(declare-fun b!1325242 () Bool)

(declare-fun e!755484 () List!30628)

(assert (=> b!1325242 (= e!755484 (insertStrictlySorted!486 (t!44558 (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun bm!64720 () Bool)

(declare-fun call!64725 () List!30628)

(declare-fun call!64724 () List!30628)

(assert (=> bm!64720 (= call!64725 call!64724)))

(declare-fun d!142975 () Bool)

(assert (=> d!142975 e!755483))

(declare-fun res!879567 () Bool)

(assert (=> d!142975 (=> (not res!879567) (not e!755483))))

(assert (=> d!142975 (= res!879567 (isStrictlySorted!876 lt!589703))))

(declare-fun e!755486 () List!30628)

(assert (=> d!142975 (= lt!589703 e!755486)))

(declare-fun c!125724 () Bool)

(assert (=> d!142975 (= c!125724 (and ((_ is Cons!30624) (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!11755 (h!31833 (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (=> d!142975 (isStrictlySorted!876 (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142975 (= (insertStrictlySorted!486 (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) lt!589703)))

(declare-fun b!1325243 () Bool)

(declare-fun e!755482 () List!30628)

(assert (=> b!1325243 (= e!755482 call!64725)))

(declare-fun c!125725 () Bool)

(declare-fun b!1325244 () Bool)

(assert (=> b!1325244 (= c!125725 (and ((_ is Cons!30624) (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvsgt (_1!11755 (h!31833 (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(declare-fun e!755485 () List!30628)

(assert (=> b!1325244 (= e!755482 e!755485)))

(declare-fun bm!64721 () Bool)

(declare-fun $colon$colon!669 (List!30628 tuple2!23488) List!30628)

(assert (=> bm!64721 (= call!64724 ($colon$colon!669 e!755484 (ite c!125724 (h!31833 (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (tuple2!23489 (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))))

(declare-fun c!125723 () Bool)

(assert (=> bm!64721 (= c!125723 c!125724)))

(declare-fun b!1325245 () Bool)

(assert (=> b!1325245 (= e!755486 call!64724)))

(declare-fun b!1325246 () Bool)

(declare-fun call!64723 () List!30628)

(assert (=> b!1325246 (= e!755485 call!64723)))

(declare-fun bm!64722 () Bool)

(assert (=> bm!64722 (= call!64723 call!64725)))

(declare-fun c!125722 () Bool)

(declare-fun b!1325247 () Bool)

(assert (=> b!1325247 (= e!755484 (ite c!125722 (t!44558 (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (ite c!125725 (Cons!30624 (h!31833 (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (t!44558 (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))) Nil!30625)))))

(declare-fun b!1325248 () Bool)

(assert (=> b!1325248 (= e!755486 e!755482)))

(assert (=> b!1325248 (= c!125722 (and ((_ is Cons!30624) (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!11755 (h!31833 (toList!10588 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(declare-fun b!1325249 () Bool)

(assert (=> b!1325249 (= e!755485 call!64723)))

(declare-fun b!1325250 () Bool)

(declare-fun res!879568 () Bool)

(assert (=> b!1325250 (=> (not res!879568) (not e!755483))))

(assert (=> b!1325250 (= res!879568 (containsKey!734 lt!589703 (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (= (and d!142975 c!125724) b!1325245))

(assert (= (and d!142975 (not c!125724)) b!1325248))

(assert (= (and b!1325248 c!125722) b!1325243))

(assert (= (and b!1325248 (not c!125722)) b!1325244))

(assert (= (and b!1325244 c!125725) b!1325249))

(assert (= (and b!1325244 (not c!125725)) b!1325246))

(assert (= (or b!1325249 b!1325246) bm!64722))

(assert (= (or b!1325243 bm!64722) bm!64720))

(assert (= (or b!1325245 bm!64720) bm!64721))

(assert (= (and bm!64721 c!125723) b!1325242))

(assert (= (and bm!64721 (not c!125723)) b!1325247))

(assert (= (and d!142975 res!879567) b!1325250))

(assert (= (and b!1325250 res!879568) b!1325241))

(declare-fun m!1214011 () Bool)

(assert (=> b!1325241 m!1214011))

(declare-fun m!1214013 () Bool)

(assert (=> bm!64721 m!1214013))

(declare-fun m!1214015 () Bool)

(assert (=> b!1325250 m!1214015))

(declare-fun m!1214017 () Bool)

(assert (=> b!1325242 m!1214017))

(declare-fun m!1214019 () Bool)

(assert (=> d!142975 m!1214019))

(declare-fun m!1214021 () Bool)

(assert (=> d!142975 m!1214021))

(assert (=> d!142905 d!142975))

(assert (=> b!1325069 d!142917))

(declare-fun d!142977 () Bool)

(declare-fun e!755487 () Bool)

(assert (=> d!142977 e!755487))

(declare-fun res!879569 () Bool)

(assert (=> d!142977 (=> res!879569 e!755487)))

(declare-fun lt!589707 () Bool)

(assert (=> d!142977 (= res!879569 (not lt!589707))))

(declare-fun lt!589705 () Bool)

(assert (=> d!142977 (= lt!589707 lt!589705)))

(declare-fun lt!589706 () Unit!43642)

(declare-fun e!755488 () Unit!43642)

(assert (=> d!142977 (= lt!589706 e!755488)))

(declare-fun c!125726 () Bool)

(assert (=> d!142977 (= c!125726 lt!589705)))

(assert (=> d!142977 (= lt!589705 (containsKey!734 (toList!10588 lt!589550) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142977 (= (contains!8743 lt!589550 #b1000000000000000000000000000000000000000000000000000000000000000) lt!589707)))

(declare-fun b!1325251 () Bool)

(declare-fun lt!589704 () Unit!43642)

(assert (=> b!1325251 (= e!755488 lt!589704)))

(assert (=> b!1325251 (= lt!589704 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 lt!589550) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1325251 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589550) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1325252 () Bool)

(declare-fun Unit!43649 () Unit!43642)

(assert (=> b!1325252 (= e!755488 Unit!43649)))

(declare-fun b!1325253 () Bool)

(assert (=> b!1325253 (= e!755487 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142977 c!125726) b!1325251))

(assert (= (and d!142977 (not c!125726)) b!1325252))

(assert (= (and d!142977 (not res!879569)) b!1325253))

(declare-fun m!1214023 () Bool)

(assert (=> d!142977 m!1214023))

(declare-fun m!1214025 () Bool)

(assert (=> b!1325251 m!1214025))

(declare-fun m!1214027 () Bool)

(assert (=> b!1325251 m!1214027))

(assert (=> b!1325251 m!1214027))

(declare-fun m!1214029 () Bool)

(assert (=> b!1325251 m!1214029))

(assert (=> b!1325253 m!1214027))

(assert (=> b!1325253 m!1214027))

(assert (=> b!1325253 m!1214029))

(assert (=> b!1325001 d!142977))

(declare-fun d!142979 () Bool)

(declare-fun e!755489 () Bool)

(assert (=> d!142979 e!755489))

(declare-fun res!879570 () Bool)

(assert (=> d!142979 (=> res!879570 e!755489)))

(declare-fun lt!589711 () Bool)

(assert (=> d!142979 (= res!879570 (not lt!589711))))

(declare-fun lt!589709 () Bool)

(assert (=> d!142979 (= lt!589711 lt!589709)))

(declare-fun lt!589710 () Unit!43642)

(declare-fun e!755490 () Unit!43642)

(assert (=> d!142979 (= lt!589710 e!755490)))

(declare-fun c!125727 () Bool)

(assert (=> d!142979 (= c!125727 lt!589709)))

(assert (=> d!142979 (= lt!589709 (containsKey!734 (toList!10588 lt!589552) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142979 (= (contains!8743 lt!589552 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!589711)))

(declare-fun b!1325254 () Bool)

(declare-fun lt!589708 () Unit!43642)

(assert (=> b!1325254 (= e!755490 lt!589708)))

(assert (=> b!1325254 (= lt!589708 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 lt!589552) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> b!1325254 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589552) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1325255 () Bool)

(declare-fun Unit!43650 () Unit!43642)

(assert (=> b!1325255 (= e!755490 Unit!43650)))

(declare-fun b!1325256 () Bool)

(assert (=> b!1325256 (= e!755489 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589552) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (= (and d!142979 c!125727) b!1325254))

(assert (= (and d!142979 (not c!125727)) b!1325255))

(assert (= (and d!142979 (not res!879570)) b!1325256))

(declare-fun m!1214031 () Bool)

(assert (=> d!142979 m!1214031))

(declare-fun m!1214033 () Bool)

(assert (=> b!1325254 m!1214033))

(assert (=> b!1325254 m!1213743))

(assert (=> b!1325254 m!1213743))

(declare-fun m!1214035 () Bool)

(assert (=> b!1325254 m!1214035))

(assert (=> b!1325256 m!1213743))

(assert (=> b!1325256 m!1213743))

(assert (=> b!1325256 m!1214035))

(assert (=> d!142903 d!142979))

(declare-fun b!1325257 () Bool)

(declare-fun e!755491 () Option!764)

(assert (=> b!1325257 (= e!755491 (Some!763 (_2!11755 (h!31833 lt!589554))))))

(declare-fun b!1325258 () Bool)

(declare-fun e!755492 () Option!764)

(assert (=> b!1325258 (= e!755491 e!755492)))

(declare-fun c!125729 () Bool)

(assert (=> b!1325258 (= c!125729 (and ((_ is Cons!30624) lt!589554) (not (= (_1!11755 (h!31833 lt!589554)) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun d!142981 () Bool)

(declare-fun c!125728 () Bool)

(assert (=> d!142981 (= c!125728 (and ((_ is Cons!30624) lt!589554) (= (_1!11755 (h!31833 lt!589554)) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142981 (= (getValueByKey!712 lt!589554 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) e!755491)))

(declare-fun b!1325260 () Bool)

(assert (=> b!1325260 (= e!755492 None!762)))

(declare-fun b!1325259 () Bool)

(assert (=> b!1325259 (= e!755492 (getValueByKey!712 (t!44558 lt!589554) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!142981 c!125728) b!1325257))

(assert (= (and d!142981 (not c!125728)) b!1325258))

(assert (= (and b!1325258 c!125729) b!1325259))

(assert (= (and b!1325258 (not c!125729)) b!1325260))

(declare-fun m!1214037 () Bool)

(assert (=> b!1325259 m!1214037))

(assert (=> d!142903 d!142981))

(declare-fun d!142983 () Bool)

(assert (=> d!142983 (= (getValueByKey!712 lt!589554 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!763 (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!589712 () Unit!43642)

(assert (=> d!142983 (= lt!589712 (choose!1947 lt!589554 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun e!755493 () Bool)

(assert (=> d!142983 e!755493))

(declare-fun res!879571 () Bool)

(assert (=> d!142983 (=> (not res!879571) (not e!755493))))

(assert (=> d!142983 (= res!879571 (isStrictlySorted!876 lt!589554))))

(assert (=> d!142983 (= (lemmaContainsTupThenGetReturnValue!357 lt!589554 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!589712)))

(declare-fun b!1325261 () Bool)

(declare-fun res!879572 () Bool)

(assert (=> b!1325261 (=> (not res!879572) (not e!755493))))

(assert (=> b!1325261 (= res!879572 (containsKey!734 lt!589554 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1325262 () Bool)

(assert (=> b!1325262 (= e!755493 (contains!8744 lt!589554 (tuple2!23489 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (= (and d!142983 res!879571) b!1325261))

(assert (= (and b!1325261 res!879572) b!1325262))

(assert (=> d!142983 m!1213737))

(declare-fun m!1214039 () Bool)

(assert (=> d!142983 m!1214039))

(declare-fun m!1214041 () Bool)

(assert (=> d!142983 m!1214041))

(declare-fun m!1214043 () Bool)

(assert (=> b!1325261 m!1214043))

(declare-fun m!1214045 () Bool)

(assert (=> b!1325262 m!1214045))

(assert (=> d!142903 d!142983))

(declare-fun b!1325263 () Bool)

(declare-fun e!755495 () Bool)

(declare-fun lt!589713 () List!30628)

(assert (=> b!1325263 (= e!755495 (contains!8744 lt!589713 (tuple2!23489 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun e!755496 () List!30628)

(declare-fun b!1325264 () Bool)

(assert (=> b!1325264 (= e!755496 (insertStrictlySorted!486 (t!44558 (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun bm!64723 () Bool)

(declare-fun call!64728 () List!30628)

(declare-fun call!64727 () List!30628)

(assert (=> bm!64723 (= call!64728 call!64727)))

(declare-fun d!142985 () Bool)

(assert (=> d!142985 e!755495))

(declare-fun res!879573 () Bool)

(assert (=> d!142985 (=> (not res!879573) (not e!755495))))

(assert (=> d!142985 (= res!879573 (isStrictlySorted!876 lt!589713))))

(declare-fun e!755498 () List!30628)

(assert (=> d!142985 (= lt!589713 e!755498)))

(declare-fun c!125732 () Bool)

(assert (=> d!142985 (= c!125732 (and ((_ is Cons!30624) (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (bvslt (_1!11755 (h!31833 (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142985 (isStrictlySorted!876 (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!142985 (= (insertStrictlySorted!486 (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!589713)))

(declare-fun b!1325265 () Bool)

(declare-fun e!755494 () List!30628)

(assert (=> b!1325265 (= e!755494 call!64728)))

(declare-fun b!1325266 () Bool)

(declare-fun c!125733 () Bool)

(assert (=> b!1325266 (= c!125733 (and ((_ is Cons!30624) (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (bvsgt (_1!11755 (h!31833 (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun e!755497 () List!30628)

(assert (=> b!1325266 (= e!755494 e!755497)))

(declare-fun bm!64724 () Bool)

(assert (=> bm!64724 (= call!64727 ($colon$colon!669 e!755496 (ite c!125732 (h!31833 (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (tuple2!23489 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun c!125731 () Bool)

(assert (=> bm!64724 (= c!125731 c!125732)))

(declare-fun b!1325267 () Bool)

(assert (=> b!1325267 (= e!755498 call!64727)))

(declare-fun b!1325268 () Bool)

(declare-fun call!64726 () List!30628)

(assert (=> b!1325268 (= e!755497 call!64726)))

(declare-fun bm!64725 () Bool)

(assert (=> bm!64725 (= call!64726 call!64728)))

(declare-fun c!125730 () Bool)

(declare-fun b!1325269 () Bool)

(assert (=> b!1325269 (= e!755496 (ite c!125730 (t!44558 (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (ite c!125733 (Cons!30624 (h!31833 (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (t!44558 (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))) Nil!30625)))))

(declare-fun b!1325270 () Bool)

(assert (=> b!1325270 (= e!755498 e!755494)))

(assert (=> b!1325270 (= c!125730 (and ((_ is Cons!30624) (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (= (_1!11755 (h!31833 (toList!10588 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1325271 () Bool)

(assert (=> b!1325271 (= e!755497 call!64726)))

(declare-fun b!1325272 () Bool)

(declare-fun res!879574 () Bool)

(assert (=> b!1325272 (=> (not res!879574) (not e!755495))))

(assert (=> b!1325272 (= res!879574 (containsKey!734 lt!589713 (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!142985 c!125732) b!1325267))

(assert (= (and d!142985 (not c!125732)) b!1325270))

(assert (= (and b!1325270 c!125730) b!1325265))

(assert (= (and b!1325270 (not c!125730)) b!1325266))

(assert (= (and b!1325266 c!125733) b!1325271))

(assert (= (and b!1325266 (not c!125733)) b!1325268))

(assert (= (or b!1325271 b!1325268) bm!64725))

(assert (= (or b!1325265 bm!64725) bm!64723))

(assert (= (or b!1325267 bm!64723) bm!64724))

(assert (= (and bm!64724 c!125731) b!1325264))

(assert (= (and bm!64724 (not c!125731)) b!1325269))

(assert (= (and d!142985 res!879573) b!1325272))

(assert (= (and b!1325272 res!879574) b!1325263))

(declare-fun m!1214047 () Bool)

(assert (=> b!1325263 m!1214047))

(declare-fun m!1214049 () Bool)

(assert (=> bm!64724 m!1214049))

(declare-fun m!1214051 () Bool)

(assert (=> b!1325272 m!1214051))

(declare-fun m!1214053 () Bool)

(assert (=> b!1325264 m!1214053))

(declare-fun m!1214055 () Bool)

(assert (=> d!142985 m!1214055))

(declare-fun m!1214057 () Bool)

(assert (=> d!142985 m!1214057))

(assert (=> d!142903 d!142985))

(assert (=> b!1325067 d!142917))

(assert (=> b!1324958 d!142925))

(assert (=> b!1324958 d!142927))

(assert (=> b!1325002 d!142961))

(declare-fun d!142987 () Bool)

(declare-fun lt!589714 () Bool)

(assert (=> d!142987 (= lt!589714 (select (content!653 (toList!10588 lt!589552)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun e!755499 () Bool)

(assert (=> d!142987 (= lt!589714 e!755499)))

(declare-fun res!879576 () Bool)

(assert (=> d!142987 (=> (not res!879576) (not e!755499))))

(assert (=> d!142987 (= res!879576 ((_ is Cons!30624) (toList!10588 lt!589552)))))

(assert (=> d!142987 (= (contains!8744 (toList!10588 lt!589552) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!589714)))

(declare-fun b!1325273 () Bool)

(declare-fun e!755500 () Bool)

(assert (=> b!1325273 (= e!755499 e!755500)))

(declare-fun res!879575 () Bool)

(assert (=> b!1325273 (=> res!879575 e!755500)))

(assert (=> b!1325273 (= res!879575 (= (h!31833 (toList!10588 lt!589552)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun b!1325274 () Bool)

(assert (=> b!1325274 (= e!755500 (contains!8744 (t!44558 (toList!10588 lt!589552)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!142987 res!879576) b!1325273))

(assert (= (and b!1325273 (not res!879575)) b!1325274))

(declare-fun m!1214059 () Bool)

(assert (=> d!142987 m!1214059))

(declare-fun m!1214061 () Bool)

(assert (=> d!142987 m!1214061))

(declare-fun m!1214063 () Bool)

(assert (=> b!1325274 m!1214063))

(assert (=> b!1325008 d!142987))

(declare-fun b!1325275 () Bool)

(declare-fun e!755501 () Option!764)

(assert (=> b!1325275 (= e!755501 (Some!763 (_2!11755 (h!31833 (toList!10588 lt!589556)))))))

(declare-fun b!1325276 () Bool)

(declare-fun e!755502 () Option!764)

(assert (=> b!1325276 (= e!755501 e!755502)))

(declare-fun c!125735 () Bool)

(assert (=> b!1325276 (= c!125735 (and ((_ is Cons!30624) (toList!10588 lt!589556)) (not (= (_1!11755 (h!31833 (toList!10588 lt!589556))) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))))

(declare-fun d!142989 () Bool)

(declare-fun c!125734 () Bool)

(assert (=> d!142989 (= c!125734 (and ((_ is Cons!30624) (toList!10588 lt!589556)) (= (_1!11755 (h!31833 (toList!10588 lt!589556))) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (=> d!142989 (= (getValueByKey!712 (toList!10588 lt!589556) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) e!755501)))

(declare-fun b!1325278 () Bool)

(assert (=> b!1325278 (= e!755502 None!762)))

(declare-fun b!1325277 () Bool)

(assert (=> b!1325277 (= e!755502 (getValueByKey!712 (t!44558 (toList!10588 lt!589556)) (_1!11755 (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (= (and d!142989 c!125734) b!1325275))

(assert (= (and d!142989 (not c!125734)) b!1325276))

(assert (= (and b!1325276 c!125735) b!1325277))

(assert (= (and b!1325276 (not c!125735)) b!1325278))

(declare-fun m!1214065 () Bool)

(assert (=> b!1325277 m!1214065))

(assert (=> b!1325009 d!142989))

(declare-fun d!142991 () Bool)

(assert (=> d!142991 (= (get!21757 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1324970 d!142991))

(declare-fun b!1325279 () Bool)

(declare-fun e!755503 () Option!764)

(assert (=> b!1325279 (= e!755503 (Some!763 (_2!11755 (h!31833 (toList!10588 lt!589552)))))))

(declare-fun b!1325280 () Bool)

(declare-fun e!755504 () Option!764)

(assert (=> b!1325280 (= e!755503 e!755504)))

(declare-fun c!125737 () Bool)

(assert (=> b!1325280 (= c!125737 (and ((_ is Cons!30624) (toList!10588 lt!589552)) (not (= (_1!11755 (h!31833 (toList!10588 lt!589552))) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun d!142993 () Bool)

(declare-fun c!125736 () Bool)

(assert (=> d!142993 (= c!125736 (and ((_ is Cons!30624) (toList!10588 lt!589552)) (= (_1!11755 (h!31833 (toList!10588 lt!589552))) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142993 (= (getValueByKey!712 (toList!10588 lt!589552) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) e!755503)))

(declare-fun b!1325282 () Bool)

(assert (=> b!1325282 (= e!755504 None!762)))

(declare-fun b!1325281 () Bool)

(assert (=> b!1325281 (= e!755504 (getValueByKey!712 (t!44558 (toList!10588 lt!589552)) (_1!11755 (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!142993 c!125736) b!1325279))

(assert (= (and d!142993 (not c!125736)) b!1325280))

(assert (= (and b!1325280 c!125737) b!1325281))

(assert (= (and b!1325280 (not c!125737)) b!1325282))

(declare-fun m!1214067 () Bool)

(assert (=> b!1325281 m!1214067))

(assert (=> b!1325007 d!142993))

(declare-fun d!142995 () Bool)

(assert (=> d!142995 (= (validKeyInArray!0 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000)) (and (not (= (select (arr!43207 _keys!1609) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43207 _keys!1609) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1325088 d!142995))

(declare-fun d!142997 () Bool)

(declare-fun lt!589717 () Bool)

(declare-fun content!654 (List!30629) (InoxSet (_ BitVec 64)))

(assert (=> d!142997 (= lt!589717 (select (content!654 Nil!30626) (select (arr!43207 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun e!755509 () Bool)

(assert (=> d!142997 (= lt!589717 e!755509)))

(declare-fun res!879581 () Bool)

(assert (=> d!142997 (=> (not res!879581) (not e!755509))))

(assert (=> d!142997 (= res!879581 ((_ is Cons!30625) Nil!30626))))

(assert (=> d!142997 (= (contains!8745 Nil!30626 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000)) lt!589717)))

(declare-fun b!1325287 () Bool)

(declare-fun e!755510 () Bool)

(assert (=> b!1325287 (= e!755509 e!755510)))

(declare-fun res!879582 () Bool)

(assert (=> b!1325287 (=> res!879582 e!755510)))

(assert (=> b!1325287 (= res!879582 (= (h!31834 Nil!30626) (select (arr!43207 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1325288 () Bool)

(assert (=> b!1325288 (= e!755510 (contains!8745 (t!44559 Nil!30626) (select (arr!43207 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!142997 res!879581) b!1325287))

(assert (= (and b!1325287 (not res!879582)) b!1325288))

(declare-fun m!1214069 () Bool)

(assert (=> d!142997 m!1214069))

(assert (=> d!142997 m!1213815))

(declare-fun m!1214071 () Bool)

(assert (=> d!142997 m!1214071))

(assert (=> b!1325288 m!1213815))

(declare-fun m!1214073 () Bool)

(assert (=> b!1325288 m!1214073))

(assert (=> b!1325103 d!142997))

(declare-fun d!142999 () Bool)

(declare-fun res!879583 () Bool)

(declare-fun e!755511 () Bool)

(assert (=> d!142999 (=> res!879583 e!755511)))

(assert (=> d!142999 (= res!879583 (and ((_ is Cons!30624) (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (= (_1!11755 (h!31833 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164)))))

(assert (=> d!142999 (= (containsKey!734 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164) e!755511)))

(declare-fun b!1325289 () Bool)

(declare-fun e!755512 () Bool)

(assert (=> b!1325289 (= e!755511 e!755512)))

(declare-fun res!879584 () Bool)

(assert (=> b!1325289 (=> (not res!879584) (not e!755512))))

(assert (=> b!1325289 (= res!879584 (and (or (not ((_ is Cons!30624) (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) (bvsle (_1!11755 (h!31833 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164)) ((_ is Cons!30624) (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (bvslt (_1!11755 (h!31833 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164)))))

(declare-fun b!1325290 () Bool)

(assert (=> b!1325290 (= e!755512 (containsKey!734 (t!44558 (toList!10588 (+!4611 (+!4611 (+!4611 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) k0!1164))))

(assert (= (and d!142999 (not res!879583)) b!1325289))

(assert (= (and b!1325289 res!879584) b!1325290))

(declare-fun m!1214075 () Bool)

(assert (=> b!1325290 m!1214075))

(assert (=> d!142895 d!142999))

(declare-fun d!143001 () Bool)

(declare-fun e!755513 () Bool)

(assert (=> d!143001 e!755513))

(declare-fun res!879585 () Bool)

(assert (=> d!143001 (=> res!879585 e!755513)))

(declare-fun lt!589721 () Bool)

(assert (=> d!143001 (= res!879585 (not lt!589721))))

(declare-fun lt!589719 () Bool)

(assert (=> d!143001 (= lt!589721 lt!589719)))

(declare-fun lt!589720 () Unit!43642)

(declare-fun e!755514 () Unit!43642)

(assert (=> d!143001 (= lt!589720 e!755514)))

(declare-fun c!125738 () Bool)

(assert (=> d!143001 (= c!125738 lt!589719)))

(assert (=> d!143001 (= lt!589719 (containsKey!734 (toList!10588 lt!589616) (select (arr!43207 _keys!1609) from!2000)))))

(assert (=> d!143001 (= (contains!8743 lt!589616 (select (arr!43207 _keys!1609) from!2000)) lt!589721)))

(declare-fun b!1325291 () Bool)

(declare-fun lt!589718 () Unit!43642)

(assert (=> b!1325291 (= e!755514 lt!589718)))

(assert (=> b!1325291 (= lt!589718 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 lt!589616) (select (arr!43207 _keys!1609) from!2000)))))

(assert (=> b!1325291 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589616) (select (arr!43207 _keys!1609) from!2000)))))

(declare-fun b!1325292 () Bool)

(declare-fun Unit!43651 () Unit!43642)

(assert (=> b!1325292 (= e!755514 Unit!43651)))

(declare-fun b!1325293 () Bool)

(assert (=> b!1325293 (= e!755513 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589616) (select (arr!43207 _keys!1609) from!2000))))))

(assert (= (and d!143001 c!125738) b!1325291))

(assert (= (and d!143001 (not c!125738)) b!1325292))

(assert (= (and d!143001 (not res!879585)) b!1325293))

(assert (=> d!143001 m!1213625))

(declare-fun m!1214077 () Bool)

(assert (=> d!143001 m!1214077))

(assert (=> b!1325291 m!1213625))

(declare-fun m!1214079 () Bool)

(assert (=> b!1325291 m!1214079))

(assert (=> b!1325291 m!1213625))

(assert (=> b!1325291 m!1213991))

(assert (=> b!1325291 m!1213991))

(declare-fun m!1214081 () Bool)

(assert (=> b!1325291 m!1214081))

(assert (=> b!1325293 m!1213625))

(assert (=> b!1325293 m!1213991))

(assert (=> b!1325293 m!1213991))

(assert (=> b!1325293 m!1214081))

(assert (=> b!1325056 d!143001))

(declare-fun d!143003 () Bool)

(assert (=> d!143003 (= (get!21756 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!20844 (select (arr!43208 _values!1337) from!2000)))))

(assert (=> b!1324969 d!143003))

(declare-fun b!1325294 () Bool)

(declare-fun e!755516 () Bool)

(declare-fun e!755517 () Bool)

(assert (=> b!1325294 (= e!755516 e!755517)))

(declare-fun lt!589724 () (_ BitVec 64))

(assert (=> b!1325294 (= lt!589724 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!589723 () Unit!43642)

(assert (=> b!1325294 (= lt!589723 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!589724 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1325294 (arrayContainsKey!0 _keys!1609 lt!589724 #b00000000000000000000000000000000)))

(declare-fun lt!589722 () Unit!43642)

(assert (=> b!1325294 (= lt!589722 lt!589723)))

(declare-fun res!879587 () Bool)

(assert (=> b!1325294 (= res!879587 (= (seekEntryOrOpen!0 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1609 mask!2019) (Found!10040 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1325294 (=> (not res!879587) (not e!755517))))

(declare-fun b!1325295 () Bool)

(declare-fun call!64729 () Bool)

(assert (=> b!1325295 (= e!755516 call!64729)))

(declare-fun b!1325296 () Bool)

(assert (=> b!1325296 (= e!755517 call!64729)))

(declare-fun bm!64726 () Bool)

(assert (=> bm!64726 (= call!64729 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun d!143005 () Bool)

(declare-fun res!879586 () Bool)

(declare-fun e!755515 () Bool)

(assert (=> d!143005 (=> res!879586 e!755515)))

(assert (=> d!143005 (= res!879586 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43757 _keys!1609)))))

(assert (=> d!143005 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019) e!755515)))

(declare-fun b!1325297 () Bool)

(assert (=> b!1325297 (= e!755515 e!755516)))

(declare-fun c!125739 () Bool)

(assert (=> b!1325297 (= c!125739 (validKeyInArray!0 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!143005 (not res!879586)) b!1325297))

(assert (= (and b!1325297 c!125739) b!1325294))

(assert (= (and b!1325297 (not c!125739)) b!1325295))

(assert (= (and b!1325294 res!879587) b!1325296))

(assert (= (or b!1325296 b!1325295) bm!64726))

(declare-fun m!1214083 () Bool)

(assert (=> b!1325294 m!1214083))

(declare-fun m!1214085 () Bool)

(assert (=> b!1325294 m!1214085))

(declare-fun m!1214087 () Bool)

(assert (=> b!1325294 m!1214087))

(assert (=> b!1325294 m!1214083))

(declare-fun m!1214089 () Bool)

(assert (=> b!1325294 m!1214089))

(declare-fun m!1214091 () Bool)

(assert (=> bm!64726 m!1214091))

(assert (=> b!1325297 m!1214083))

(assert (=> b!1325297 m!1214083))

(declare-fun m!1214093 () Bool)

(assert (=> b!1325297 m!1214093))

(assert (=> bm!64708 d!143005))

(assert (=> b!1325102 d!142995))

(declare-fun d!143007 () Bool)

(declare-fun e!755518 () Bool)

(assert (=> d!143007 e!755518))

(declare-fun res!879588 () Bool)

(assert (=> d!143007 (=> res!879588 e!755518)))

(declare-fun lt!589728 () Bool)

(assert (=> d!143007 (= res!879588 (not lt!589728))))

(declare-fun lt!589726 () Bool)

(assert (=> d!143007 (= lt!589728 lt!589726)))

(declare-fun lt!589727 () Unit!43642)

(declare-fun e!755519 () Unit!43642)

(assert (=> d!143007 (= lt!589727 e!755519)))

(declare-fun c!125740 () Bool)

(assert (=> d!143007 (= c!125740 lt!589726)))

(assert (=> d!143007 (= lt!589726 (containsKey!734 (toList!10588 lt!589616) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143007 (= (contains!8743 lt!589616 #b1000000000000000000000000000000000000000000000000000000000000000) lt!589728)))

(declare-fun b!1325298 () Bool)

(declare-fun lt!589725 () Unit!43642)

(assert (=> b!1325298 (= e!755519 lt!589725)))

(assert (=> b!1325298 (= lt!589725 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 lt!589616) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1325298 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589616) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1325299 () Bool)

(declare-fun Unit!43652 () Unit!43642)

(assert (=> b!1325299 (= e!755519 Unit!43652)))

(declare-fun b!1325300 () Bool)

(assert (=> b!1325300 (= e!755518 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589616) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143007 c!125740) b!1325298))

(assert (= (and d!143007 (not c!125740)) b!1325299))

(assert (= (and d!143007 (not res!879588)) b!1325300))

(declare-fun m!1214095 () Bool)

(assert (=> d!143007 m!1214095))

(declare-fun m!1214097 () Bool)

(assert (=> b!1325298 m!1214097))

(assert (=> b!1325298 m!1213933))

(assert (=> b!1325298 m!1213933))

(declare-fun m!1214099 () Bool)

(assert (=> b!1325298 m!1214099))

(assert (=> b!1325300 m!1213933))

(assert (=> b!1325300 m!1213933))

(assert (=> b!1325300 m!1214099))

(assert (=> bm!64699 d!143007))

(declare-fun b!1325301 () Bool)

(declare-fun e!755521 () Bool)

(declare-fun call!64730 () Bool)

(assert (=> b!1325301 (= e!755521 call!64730)))

(declare-fun b!1325302 () Bool)

(assert (=> b!1325302 (= e!755521 call!64730)))

(declare-fun b!1325303 () Bool)

(declare-fun e!755520 () Bool)

(assert (=> b!1325303 (= e!755520 e!755521)))

(declare-fun c!125741 () Bool)

(assert (=> b!1325303 (= c!125741 (validKeyInArray!0 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1325304 () Bool)

(declare-fun e!755523 () Bool)

(assert (=> b!1325304 (= e!755523 e!755520)))

(declare-fun res!879590 () Bool)

(assert (=> b!1325304 (=> (not res!879590) (not e!755520))))

(declare-fun e!755522 () Bool)

(assert (=> b!1325304 (= res!879590 (not e!755522))))

(declare-fun res!879589 () Bool)

(assert (=> b!1325304 (=> (not res!879589) (not e!755522))))

(assert (=> b!1325304 (= res!879589 (validKeyInArray!0 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1325305 () Bool)

(assert (=> b!1325305 (= e!755522 (contains!8745 (ite c!125683 (Cons!30625 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000) Nil!30626) Nil!30626) (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!143009 () Bool)

(declare-fun res!879591 () Bool)

(assert (=> d!143009 (=> res!879591 e!755523)))

(assert (=> d!143009 (= res!879591 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43757 _keys!1609)))))

(assert (=> d!143009 (= (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125683 (Cons!30625 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000) Nil!30626) Nil!30626)) e!755523)))

(declare-fun bm!64727 () Bool)

(assert (=> bm!64727 (= call!64730 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125741 (Cons!30625 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125683 (Cons!30625 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000) Nil!30626) Nil!30626)) (ite c!125683 (Cons!30625 (select (arr!43207 _keys!1609) #b00000000000000000000000000000000) Nil!30626) Nil!30626))))))

(assert (= (and d!143009 (not res!879591)) b!1325304))

(assert (= (and b!1325304 res!879589) b!1325305))

(assert (= (and b!1325304 res!879590) b!1325303))

(assert (= (and b!1325303 c!125741) b!1325301))

(assert (= (and b!1325303 (not c!125741)) b!1325302))

(assert (= (or b!1325301 b!1325302) bm!64727))

(assert (=> b!1325303 m!1214083))

(assert (=> b!1325303 m!1214083))

(assert (=> b!1325303 m!1214093))

(assert (=> b!1325304 m!1214083))

(assert (=> b!1325304 m!1214083))

(assert (=> b!1325304 m!1214093))

(assert (=> b!1325305 m!1214083))

(assert (=> b!1325305 m!1214083))

(declare-fun m!1214101 () Bool)

(assert (=> b!1325305 m!1214101))

(assert (=> bm!64727 m!1214083))

(declare-fun m!1214103 () Bool)

(assert (=> bm!64727 m!1214103))

(assert (=> bm!64711 d!143009))

(assert (=> b!1325101 d!142995))

(declare-fun d!143011 () Bool)

(assert (=> d!143011 (= (isDefined!519 (getValueByKey!712 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)) (not (isEmpty!1076 (getValueByKey!712 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))))

(declare-fun bs!37901 () Bool)

(assert (= bs!37901 d!143011))

(assert (=> bs!37901 m!1213763))

(declare-fun m!1214105 () Bool)

(assert (=> bs!37901 m!1214105))

(assert (=> b!1325013 d!143011))

(declare-fun e!755524 () Option!764)

(declare-fun b!1325306 () Bool)

(assert (=> b!1325306 (= e!755524 (Some!763 (_2!11755 (h!31833 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))))))

(declare-fun b!1325307 () Bool)

(declare-fun e!755525 () Option!764)

(assert (=> b!1325307 (= e!755524 e!755525)))

(declare-fun c!125743 () Bool)

(assert (=> b!1325307 (= c!125743 (and ((_ is Cons!30624) (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (not (= (_1!11755 (h!31833 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164))))))

(declare-fun c!125742 () Bool)

(declare-fun d!143013 () Bool)

(assert (=> d!143013 (= c!125742 (and ((_ is Cons!30624) (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (= (_1!11755 (h!31833 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(assert (=> d!143013 (= (getValueByKey!712 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) e!755524)))

(declare-fun b!1325309 () Bool)

(assert (=> b!1325309 (= e!755525 None!762)))

(declare-fun b!1325308 () Bool)

(assert (=> b!1325308 (= e!755525 (getValueByKey!712 (t!44558 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) k0!1164))))

(assert (= (and d!143013 c!125742) b!1325306))

(assert (= (and d!143013 (not c!125742)) b!1325307))

(assert (= (and b!1325307 c!125743) b!1325308))

(assert (= (and b!1325307 (not c!125743)) b!1325309))

(declare-fun m!1214107 () Bool)

(assert (=> b!1325308 m!1214107))

(assert (=> b!1325013 d!143013))

(declare-fun d!143015 () Bool)

(declare-fun e!755526 () Bool)

(assert (=> d!143015 e!755526))

(declare-fun res!879592 () Bool)

(assert (=> d!143015 (=> res!879592 e!755526)))

(declare-fun lt!589732 () Bool)

(assert (=> d!143015 (= res!879592 (not lt!589732))))

(declare-fun lt!589730 () Bool)

(assert (=> d!143015 (= lt!589732 lt!589730)))

(declare-fun lt!589731 () Unit!43642)

(declare-fun e!755527 () Unit!43642)

(assert (=> d!143015 (= lt!589731 e!755527)))

(declare-fun c!125744 () Bool)

(assert (=> d!143015 (= c!125744 lt!589730)))

(assert (=> d!143015 (= lt!589730 (containsKey!734 (toList!10588 lt!589550) (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> d!143015 (= (contains!8743 lt!589550 (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) lt!589732)))

(declare-fun b!1325310 () Bool)

(declare-fun lt!589729 () Unit!43642)

(assert (=> b!1325310 (= e!755527 lt!589729)))

(assert (=> b!1325310 (= lt!589729 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 lt!589550) (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1325310 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589550) (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1325311 () Bool)

(declare-fun Unit!43653 () Unit!43642)

(assert (=> b!1325311 (= e!755527 Unit!43653)))

(declare-fun b!1325312 () Bool)

(assert (=> b!1325312 (= e!755526 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589550) (select (arr!43207 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))))

(assert (= (and d!143015 c!125744) b!1325310))

(assert (= (and d!143015 (not c!125744)) b!1325311))

(assert (= (and d!143015 (not res!879592)) b!1325312))

(assert (=> d!143015 m!1213713))

(declare-fun m!1214109 () Bool)

(assert (=> d!143015 m!1214109))

(assert (=> b!1325310 m!1213713))

(declare-fun m!1214111 () Bool)

(assert (=> b!1325310 m!1214111))

(assert (=> b!1325310 m!1213713))

(assert (=> b!1325310 m!1213929))

(assert (=> b!1325310 m!1213929))

(declare-fun m!1214113 () Bool)

(assert (=> b!1325310 m!1214113))

(assert (=> b!1325312 m!1213713))

(assert (=> b!1325312 m!1213929))

(assert (=> b!1325312 m!1213929))

(assert (=> b!1325312 m!1214113))

(assert (=> b!1324996 d!143015))

(declare-fun d!143017 () Bool)

(assert (=> d!143017 (= (apply!1029 (+!4611 lt!589629 (tuple2!23489 lt!589625 minValue!1279)) lt!589609) (apply!1029 lt!589629 lt!589609))))

(declare-fun lt!589735 () Unit!43642)

(declare-fun choose!1948 (ListLongMap!21145 (_ BitVec 64) V!53475 (_ BitVec 64)) Unit!43642)

(assert (=> d!143017 (= lt!589735 (choose!1948 lt!589629 lt!589625 minValue!1279 lt!589609))))

(declare-fun e!755530 () Bool)

(assert (=> d!143017 e!755530))

(declare-fun res!879595 () Bool)

(assert (=> d!143017 (=> (not res!879595) (not e!755530))))

(assert (=> d!143017 (= res!879595 (contains!8743 lt!589629 lt!589609))))

(assert (=> d!143017 (= (addApplyDifferent!571 lt!589629 lt!589625 minValue!1279 lt!589609) lt!589735)))

(declare-fun b!1325316 () Bool)

(assert (=> b!1325316 (= e!755530 (not (= lt!589609 lt!589625)))))

(assert (= (and d!143017 res!879595) b!1325316))

(assert (=> d!143017 m!1213781))

(assert (=> d!143017 m!1213809))

(assert (=> d!143017 m!1213781))

(assert (=> d!143017 m!1213783))

(declare-fun m!1214115 () Bool)

(assert (=> d!143017 m!1214115))

(declare-fun m!1214117 () Bool)

(assert (=> d!143017 m!1214117))

(assert (=> b!1325060 d!143017))

(declare-fun d!143019 () Bool)

(assert (=> d!143019 (= (apply!1029 (+!4611 lt!589614 (tuple2!23489 lt!589628 minValue!1279)) lt!589617) (apply!1029 lt!589614 lt!589617))))

(declare-fun lt!589736 () Unit!43642)

(assert (=> d!143019 (= lt!589736 (choose!1948 lt!589614 lt!589628 minValue!1279 lt!589617))))

(declare-fun e!755531 () Bool)

(assert (=> d!143019 e!755531))

(declare-fun res!879596 () Bool)

(assert (=> d!143019 (=> (not res!879596) (not e!755531))))

(assert (=> d!143019 (= res!879596 (contains!8743 lt!589614 lt!589617))))

(assert (=> d!143019 (= (addApplyDifferent!571 lt!589614 lt!589628 minValue!1279 lt!589617) lt!589736)))

(declare-fun b!1325317 () Bool)

(assert (=> b!1325317 (= e!755531 (not (= lt!589617 lt!589628)))))

(assert (= (and d!143019 res!879596) b!1325317))

(assert (=> d!143019 m!1213789))

(assert (=> d!143019 m!1213797))

(assert (=> d!143019 m!1213789))

(assert (=> d!143019 m!1213791))

(declare-fun m!1214119 () Bool)

(assert (=> d!143019 m!1214119))

(declare-fun m!1214121 () Bool)

(assert (=> d!143019 m!1214121))

(assert (=> b!1325060 d!143019))

(declare-fun d!143021 () Bool)

(declare-fun e!755532 () Bool)

(assert (=> d!143021 e!755532))

(declare-fun res!879597 () Bool)

(assert (=> d!143021 (=> res!879597 e!755532)))

(declare-fun lt!589740 () Bool)

(assert (=> d!143021 (= res!879597 (not lt!589740))))

(declare-fun lt!589738 () Bool)

(assert (=> d!143021 (= lt!589740 lt!589738)))

(declare-fun lt!589739 () Unit!43642)

(declare-fun e!755533 () Unit!43642)

(assert (=> d!143021 (= lt!589739 e!755533)))

(declare-fun c!125745 () Bool)

(assert (=> d!143021 (= c!125745 lt!589738)))

(assert (=> d!143021 (= lt!589738 (containsKey!734 (toList!10588 (+!4611 lt!589619 (tuple2!23489 lt!589627 zeroValue!1279))) lt!589611))))

(assert (=> d!143021 (= (contains!8743 (+!4611 lt!589619 (tuple2!23489 lt!589627 zeroValue!1279)) lt!589611) lt!589740)))

(declare-fun b!1325318 () Bool)

(declare-fun lt!589737 () Unit!43642)

(assert (=> b!1325318 (= e!755533 lt!589737)))

(assert (=> b!1325318 (= lt!589737 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 (+!4611 lt!589619 (tuple2!23489 lt!589627 zeroValue!1279))) lt!589611))))

(assert (=> b!1325318 (isDefined!519 (getValueByKey!712 (toList!10588 (+!4611 lt!589619 (tuple2!23489 lt!589627 zeroValue!1279))) lt!589611))))

(declare-fun b!1325319 () Bool)

(declare-fun Unit!43654 () Unit!43642)

(assert (=> b!1325319 (= e!755533 Unit!43654)))

(declare-fun b!1325320 () Bool)

(assert (=> b!1325320 (= e!755532 (isDefined!519 (getValueByKey!712 (toList!10588 (+!4611 lt!589619 (tuple2!23489 lt!589627 zeroValue!1279))) lt!589611)))))

(assert (= (and d!143021 c!125745) b!1325318))

(assert (= (and d!143021 (not c!125745)) b!1325319))

(assert (= (and d!143021 (not res!879597)) b!1325320))

(declare-fun m!1214123 () Bool)

(assert (=> d!143021 m!1214123))

(declare-fun m!1214125 () Bool)

(assert (=> b!1325318 m!1214125))

(declare-fun m!1214127 () Bool)

(assert (=> b!1325318 m!1214127))

(assert (=> b!1325318 m!1214127))

(declare-fun m!1214129 () Bool)

(assert (=> b!1325318 m!1214129))

(assert (=> b!1325320 m!1214127))

(assert (=> b!1325320 m!1214127))

(assert (=> b!1325320 m!1214129))

(assert (=> b!1325060 d!143021))

(declare-fun d!143023 () Bool)

(assert (=> d!143023 (= (apply!1029 (+!4611 lt!589614 (tuple2!23489 lt!589628 minValue!1279)) lt!589617) (get!21758 (getValueByKey!712 (toList!10588 (+!4611 lt!589614 (tuple2!23489 lt!589628 minValue!1279))) lt!589617)))))

(declare-fun bs!37902 () Bool)

(assert (= bs!37902 d!143023))

(declare-fun m!1214131 () Bool)

(assert (=> bs!37902 m!1214131))

(assert (=> bs!37902 m!1214131))

(declare-fun m!1214133 () Bool)

(assert (=> bs!37902 m!1214133))

(assert (=> b!1325060 d!143023))

(declare-fun d!143025 () Bool)

(assert (=> d!143025 (= (apply!1029 (+!4611 lt!589620 (tuple2!23489 lt!589621 zeroValue!1279)) lt!589622) (apply!1029 lt!589620 lt!589622))))

(declare-fun lt!589741 () Unit!43642)

(assert (=> d!143025 (= lt!589741 (choose!1948 lt!589620 lt!589621 zeroValue!1279 lt!589622))))

(declare-fun e!755534 () Bool)

(assert (=> d!143025 e!755534))

(declare-fun res!879598 () Bool)

(assert (=> d!143025 (=> (not res!879598) (not e!755534))))

(assert (=> d!143025 (= res!879598 (contains!8743 lt!589620 lt!589622))))

(assert (=> d!143025 (= (addApplyDifferent!571 lt!589620 lt!589621 zeroValue!1279 lt!589622) lt!589741)))

(declare-fun b!1325321 () Bool)

(assert (=> b!1325321 (= e!755534 (not (= lt!589622 lt!589621)))))

(assert (= (and d!143025 res!879598) b!1325321))

(assert (=> d!143025 m!1213799))

(assert (=> d!143025 m!1213793))

(assert (=> d!143025 m!1213799))

(assert (=> d!143025 m!1213801))

(declare-fun m!1214135 () Bool)

(assert (=> d!143025 m!1214135))

(declare-fun m!1214137 () Bool)

(assert (=> d!143025 m!1214137))

(assert (=> b!1325060 d!143025))

(declare-fun d!143027 () Bool)

(declare-fun e!755535 () Bool)

(assert (=> d!143027 e!755535))

(declare-fun res!879600 () Bool)

(assert (=> d!143027 (=> (not res!879600) (not e!755535))))

(declare-fun lt!589742 () ListLongMap!21145)

(assert (=> d!143027 (= res!879600 (contains!8743 lt!589742 (_1!11755 (tuple2!23489 lt!589628 minValue!1279))))))

(declare-fun lt!589744 () List!30628)

(assert (=> d!143027 (= lt!589742 (ListLongMap!21146 lt!589744))))

(declare-fun lt!589745 () Unit!43642)

(declare-fun lt!589743 () Unit!43642)

(assert (=> d!143027 (= lt!589745 lt!589743)))

(assert (=> d!143027 (= (getValueByKey!712 lt!589744 (_1!11755 (tuple2!23489 lt!589628 minValue!1279))) (Some!763 (_2!11755 (tuple2!23489 lt!589628 minValue!1279))))))

(assert (=> d!143027 (= lt!589743 (lemmaContainsTupThenGetReturnValue!357 lt!589744 (_1!11755 (tuple2!23489 lt!589628 minValue!1279)) (_2!11755 (tuple2!23489 lt!589628 minValue!1279))))))

(assert (=> d!143027 (= lt!589744 (insertStrictlySorted!486 (toList!10588 lt!589614) (_1!11755 (tuple2!23489 lt!589628 minValue!1279)) (_2!11755 (tuple2!23489 lt!589628 minValue!1279))))))

(assert (=> d!143027 (= (+!4611 lt!589614 (tuple2!23489 lt!589628 minValue!1279)) lt!589742)))

(declare-fun b!1325322 () Bool)

(declare-fun res!879599 () Bool)

(assert (=> b!1325322 (=> (not res!879599) (not e!755535))))

(assert (=> b!1325322 (= res!879599 (= (getValueByKey!712 (toList!10588 lt!589742) (_1!11755 (tuple2!23489 lt!589628 minValue!1279))) (Some!763 (_2!11755 (tuple2!23489 lt!589628 minValue!1279)))))))

(declare-fun b!1325323 () Bool)

(assert (=> b!1325323 (= e!755535 (contains!8744 (toList!10588 lt!589742) (tuple2!23489 lt!589628 minValue!1279)))))

(assert (= (and d!143027 res!879600) b!1325322))

(assert (= (and b!1325322 res!879599) b!1325323))

(declare-fun m!1214139 () Bool)

(assert (=> d!143027 m!1214139))

(declare-fun m!1214141 () Bool)

(assert (=> d!143027 m!1214141))

(declare-fun m!1214143 () Bool)

(assert (=> d!143027 m!1214143))

(declare-fun m!1214145 () Bool)

(assert (=> d!143027 m!1214145))

(declare-fun m!1214147 () Bool)

(assert (=> b!1325322 m!1214147))

(declare-fun m!1214149 () Bool)

(assert (=> b!1325323 m!1214149))

(assert (=> b!1325060 d!143027))

(declare-fun d!143029 () Bool)

(assert (=> d!143029 (= (apply!1029 (+!4611 lt!589629 (tuple2!23489 lt!589625 minValue!1279)) lt!589609) (get!21758 (getValueByKey!712 (toList!10588 (+!4611 lt!589629 (tuple2!23489 lt!589625 minValue!1279))) lt!589609)))))

(declare-fun bs!37903 () Bool)

(assert (= bs!37903 d!143029))

(declare-fun m!1214151 () Bool)

(assert (=> bs!37903 m!1214151))

(assert (=> bs!37903 m!1214151))

(declare-fun m!1214153 () Bool)

(assert (=> bs!37903 m!1214153))

(assert (=> b!1325060 d!143029))

(declare-fun d!143031 () Bool)

(declare-fun e!755536 () Bool)

(assert (=> d!143031 e!755536))

(declare-fun res!879602 () Bool)

(assert (=> d!143031 (=> (not res!879602) (not e!755536))))

(declare-fun lt!589746 () ListLongMap!21145)

(assert (=> d!143031 (= res!879602 (contains!8743 lt!589746 (_1!11755 (tuple2!23489 lt!589625 minValue!1279))))))

(declare-fun lt!589748 () List!30628)

(assert (=> d!143031 (= lt!589746 (ListLongMap!21146 lt!589748))))

(declare-fun lt!589749 () Unit!43642)

(declare-fun lt!589747 () Unit!43642)

(assert (=> d!143031 (= lt!589749 lt!589747)))

(assert (=> d!143031 (= (getValueByKey!712 lt!589748 (_1!11755 (tuple2!23489 lt!589625 minValue!1279))) (Some!763 (_2!11755 (tuple2!23489 lt!589625 minValue!1279))))))

(assert (=> d!143031 (= lt!589747 (lemmaContainsTupThenGetReturnValue!357 lt!589748 (_1!11755 (tuple2!23489 lt!589625 minValue!1279)) (_2!11755 (tuple2!23489 lt!589625 minValue!1279))))))

(assert (=> d!143031 (= lt!589748 (insertStrictlySorted!486 (toList!10588 lt!589629) (_1!11755 (tuple2!23489 lt!589625 minValue!1279)) (_2!11755 (tuple2!23489 lt!589625 minValue!1279))))))

(assert (=> d!143031 (= (+!4611 lt!589629 (tuple2!23489 lt!589625 minValue!1279)) lt!589746)))

(declare-fun b!1325324 () Bool)

(declare-fun res!879601 () Bool)

(assert (=> b!1325324 (=> (not res!879601) (not e!755536))))

(assert (=> b!1325324 (= res!879601 (= (getValueByKey!712 (toList!10588 lt!589746) (_1!11755 (tuple2!23489 lt!589625 minValue!1279))) (Some!763 (_2!11755 (tuple2!23489 lt!589625 minValue!1279)))))))

(declare-fun b!1325325 () Bool)

(assert (=> b!1325325 (= e!755536 (contains!8744 (toList!10588 lt!589746) (tuple2!23489 lt!589625 minValue!1279)))))

(assert (= (and d!143031 res!879602) b!1325324))

(assert (= (and b!1325324 res!879601) b!1325325))

(declare-fun m!1214155 () Bool)

(assert (=> d!143031 m!1214155))

(declare-fun m!1214157 () Bool)

(assert (=> d!143031 m!1214157))

(declare-fun m!1214159 () Bool)

(assert (=> d!143031 m!1214159))

(declare-fun m!1214161 () Bool)

(assert (=> d!143031 m!1214161))

(declare-fun m!1214163 () Bool)

(assert (=> b!1325324 m!1214163))

(declare-fun m!1214165 () Bool)

(assert (=> b!1325325 m!1214165))

(assert (=> b!1325060 d!143031))

(declare-fun d!143033 () Bool)

(assert (=> d!143033 (= (apply!1029 lt!589629 lt!589609) (get!21758 (getValueByKey!712 (toList!10588 lt!589629) lt!589609)))))

(declare-fun bs!37904 () Bool)

(assert (= bs!37904 d!143033))

(declare-fun m!1214167 () Bool)

(assert (=> bs!37904 m!1214167))

(assert (=> bs!37904 m!1214167))

(declare-fun m!1214169 () Bool)

(assert (=> bs!37904 m!1214169))

(assert (=> b!1325060 d!143033))

(declare-fun d!143035 () Bool)

(assert (=> d!143035 (= (apply!1029 lt!589620 lt!589622) (get!21758 (getValueByKey!712 (toList!10588 lt!589620) lt!589622)))))

(declare-fun bs!37905 () Bool)

(assert (= bs!37905 d!143035))

(declare-fun m!1214171 () Bool)

(assert (=> bs!37905 m!1214171))

(assert (=> bs!37905 m!1214171))

(declare-fun m!1214173 () Bool)

(assert (=> bs!37905 m!1214173))

(assert (=> b!1325060 d!143035))

(declare-fun d!143037 () Bool)

(declare-fun e!755537 () Bool)

(assert (=> d!143037 e!755537))

(declare-fun res!879604 () Bool)

(assert (=> d!143037 (=> (not res!879604) (not e!755537))))

(declare-fun lt!589750 () ListLongMap!21145)

(assert (=> d!143037 (= res!879604 (contains!8743 lt!589750 (_1!11755 (tuple2!23489 lt!589627 zeroValue!1279))))))

(declare-fun lt!589752 () List!30628)

(assert (=> d!143037 (= lt!589750 (ListLongMap!21146 lt!589752))))

(declare-fun lt!589753 () Unit!43642)

(declare-fun lt!589751 () Unit!43642)

(assert (=> d!143037 (= lt!589753 lt!589751)))

(assert (=> d!143037 (= (getValueByKey!712 lt!589752 (_1!11755 (tuple2!23489 lt!589627 zeroValue!1279))) (Some!763 (_2!11755 (tuple2!23489 lt!589627 zeroValue!1279))))))

(assert (=> d!143037 (= lt!589751 (lemmaContainsTupThenGetReturnValue!357 lt!589752 (_1!11755 (tuple2!23489 lt!589627 zeroValue!1279)) (_2!11755 (tuple2!23489 lt!589627 zeroValue!1279))))))

(assert (=> d!143037 (= lt!589752 (insertStrictlySorted!486 (toList!10588 lt!589619) (_1!11755 (tuple2!23489 lt!589627 zeroValue!1279)) (_2!11755 (tuple2!23489 lt!589627 zeroValue!1279))))))

(assert (=> d!143037 (= (+!4611 lt!589619 (tuple2!23489 lt!589627 zeroValue!1279)) lt!589750)))

(declare-fun b!1325326 () Bool)

(declare-fun res!879603 () Bool)

(assert (=> b!1325326 (=> (not res!879603) (not e!755537))))

(assert (=> b!1325326 (= res!879603 (= (getValueByKey!712 (toList!10588 lt!589750) (_1!11755 (tuple2!23489 lt!589627 zeroValue!1279))) (Some!763 (_2!11755 (tuple2!23489 lt!589627 zeroValue!1279)))))))

(declare-fun b!1325327 () Bool)

(assert (=> b!1325327 (= e!755537 (contains!8744 (toList!10588 lt!589750) (tuple2!23489 lt!589627 zeroValue!1279)))))

(assert (= (and d!143037 res!879604) b!1325326))

(assert (= (and b!1325326 res!879603) b!1325327))

(declare-fun m!1214175 () Bool)

(assert (=> d!143037 m!1214175))

(declare-fun m!1214177 () Bool)

(assert (=> d!143037 m!1214177))

(declare-fun m!1214179 () Bool)

(assert (=> d!143037 m!1214179))

(declare-fun m!1214181 () Bool)

(assert (=> d!143037 m!1214181))

(declare-fun m!1214183 () Bool)

(assert (=> b!1325326 m!1214183))

(declare-fun m!1214185 () Bool)

(assert (=> b!1325327 m!1214185))

(assert (=> b!1325060 d!143037))

(assert (=> b!1325060 d!142953))

(declare-fun d!143039 () Bool)

(assert (=> d!143039 (= (apply!1029 (+!4611 lt!589620 (tuple2!23489 lt!589621 zeroValue!1279)) lt!589622) (get!21758 (getValueByKey!712 (toList!10588 (+!4611 lt!589620 (tuple2!23489 lt!589621 zeroValue!1279))) lt!589622)))))

(declare-fun bs!37906 () Bool)

(assert (= bs!37906 d!143039))

(declare-fun m!1214187 () Bool)

(assert (=> bs!37906 m!1214187))

(assert (=> bs!37906 m!1214187))

(declare-fun m!1214189 () Bool)

(assert (=> bs!37906 m!1214189))

(assert (=> b!1325060 d!143039))

(declare-fun d!143041 () Bool)

(declare-fun e!755538 () Bool)

(assert (=> d!143041 e!755538))

(declare-fun res!879606 () Bool)

(assert (=> d!143041 (=> (not res!879606) (not e!755538))))

(declare-fun lt!589754 () ListLongMap!21145)

(assert (=> d!143041 (= res!879606 (contains!8743 lt!589754 (_1!11755 (tuple2!23489 lt!589621 zeroValue!1279))))))

(declare-fun lt!589756 () List!30628)

(assert (=> d!143041 (= lt!589754 (ListLongMap!21146 lt!589756))))

(declare-fun lt!589757 () Unit!43642)

(declare-fun lt!589755 () Unit!43642)

(assert (=> d!143041 (= lt!589757 lt!589755)))

(assert (=> d!143041 (= (getValueByKey!712 lt!589756 (_1!11755 (tuple2!23489 lt!589621 zeroValue!1279))) (Some!763 (_2!11755 (tuple2!23489 lt!589621 zeroValue!1279))))))

(assert (=> d!143041 (= lt!589755 (lemmaContainsTupThenGetReturnValue!357 lt!589756 (_1!11755 (tuple2!23489 lt!589621 zeroValue!1279)) (_2!11755 (tuple2!23489 lt!589621 zeroValue!1279))))))

(assert (=> d!143041 (= lt!589756 (insertStrictlySorted!486 (toList!10588 lt!589620) (_1!11755 (tuple2!23489 lt!589621 zeroValue!1279)) (_2!11755 (tuple2!23489 lt!589621 zeroValue!1279))))))

(assert (=> d!143041 (= (+!4611 lt!589620 (tuple2!23489 lt!589621 zeroValue!1279)) lt!589754)))

(declare-fun b!1325328 () Bool)

(declare-fun res!879605 () Bool)

(assert (=> b!1325328 (=> (not res!879605) (not e!755538))))

(assert (=> b!1325328 (= res!879605 (= (getValueByKey!712 (toList!10588 lt!589754) (_1!11755 (tuple2!23489 lt!589621 zeroValue!1279))) (Some!763 (_2!11755 (tuple2!23489 lt!589621 zeroValue!1279)))))))

(declare-fun b!1325329 () Bool)

(assert (=> b!1325329 (= e!755538 (contains!8744 (toList!10588 lt!589754) (tuple2!23489 lt!589621 zeroValue!1279)))))

(assert (= (and d!143041 res!879606) b!1325328))

(assert (= (and b!1325328 res!879605) b!1325329))

(declare-fun m!1214191 () Bool)

(assert (=> d!143041 m!1214191))

(declare-fun m!1214193 () Bool)

(assert (=> d!143041 m!1214193))

(declare-fun m!1214195 () Bool)

(assert (=> d!143041 m!1214195))

(declare-fun m!1214197 () Bool)

(assert (=> d!143041 m!1214197))

(declare-fun m!1214199 () Bool)

(assert (=> b!1325328 m!1214199))

(declare-fun m!1214201 () Bool)

(assert (=> b!1325329 m!1214201))

(assert (=> b!1325060 d!143041))

(declare-fun d!143043 () Bool)

(assert (=> d!143043 (= (apply!1029 lt!589614 lt!589617) (get!21758 (getValueByKey!712 (toList!10588 lt!589614) lt!589617)))))

(declare-fun bs!37907 () Bool)

(assert (= bs!37907 d!143043))

(declare-fun m!1214203 () Bool)

(assert (=> bs!37907 m!1214203))

(assert (=> bs!37907 m!1214203))

(declare-fun m!1214205 () Bool)

(assert (=> bs!37907 m!1214205))

(assert (=> b!1325060 d!143043))

(declare-fun d!143045 () Bool)

(assert (=> d!143045 (contains!8743 (+!4611 lt!589619 (tuple2!23489 lt!589627 zeroValue!1279)) lt!589611)))

(declare-fun lt!589760 () Unit!43642)

(declare-fun choose!1949 (ListLongMap!21145 (_ BitVec 64) V!53475 (_ BitVec 64)) Unit!43642)

(assert (=> d!143045 (= lt!589760 (choose!1949 lt!589619 lt!589627 zeroValue!1279 lt!589611))))

(assert (=> d!143045 (contains!8743 lt!589619 lt!589611)))

(assert (=> d!143045 (= (addStillContains!1160 lt!589619 lt!589627 zeroValue!1279 lt!589611) lt!589760)))

(declare-fun bs!37908 () Bool)

(assert (= bs!37908 d!143045))

(assert (=> bs!37908 m!1213785))

(assert (=> bs!37908 m!1213785))

(assert (=> bs!37908 m!1213787))

(declare-fun m!1214207 () Bool)

(assert (=> bs!37908 m!1214207))

(declare-fun m!1214209 () Bool)

(assert (=> bs!37908 m!1214209))

(assert (=> b!1325060 d!143045))

(declare-fun d!143047 () Bool)

(declare-fun e!755539 () Bool)

(assert (=> d!143047 e!755539))

(declare-fun res!879607 () Bool)

(assert (=> d!143047 (=> res!879607 e!755539)))

(declare-fun lt!589764 () Bool)

(assert (=> d!143047 (= res!879607 (not lt!589764))))

(declare-fun lt!589762 () Bool)

(assert (=> d!143047 (= lt!589764 lt!589762)))

(declare-fun lt!589763 () Unit!43642)

(declare-fun e!755540 () Unit!43642)

(assert (=> d!143047 (= lt!589763 e!755540)))

(declare-fun c!125746 () Bool)

(assert (=> d!143047 (= c!125746 lt!589762)))

(assert (=> d!143047 (= lt!589762 (containsKey!734 (toList!10588 lt!589550) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143047 (= (contains!8743 lt!589550 #b0000000000000000000000000000000000000000000000000000000000000000) lt!589764)))

(declare-fun b!1325331 () Bool)

(declare-fun lt!589761 () Unit!43642)

(assert (=> b!1325331 (= e!755540 lt!589761)))

(assert (=> b!1325331 (= lt!589761 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 lt!589550) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1325331 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589550) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1325332 () Bool)

(declare-fun Unit!43655 () Unit!43642)

(assert (=> b!1325332 (= e!755540 Unit!43655)))

(declare-fun b!1325333 () Bool)

(assert (=> b!1325333 (= e!755539 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589550) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143047 c!125746) b!1325331))

(assert (= (and d!143047 (not c!125746)) b!1325332))

(assert (= (and d!143047 (not res!879607)) b!1325333))

(declare-fun m!1214211 () Bool)

(assert (=> d!143047 m!1214211))

(declare-fun m!1214213 () Bool)

(assert (=> b!1325331 m!1214213))

(declare-fun m!1214215 () Bool)

(assert (=> b!1325331 m!1214215))

(assert (=> b!1325331 m!1214215))

(declare-fun m!1214217 () Bool)

(assert (=> b!1325331 m!1214217))

(assert (=> b!1325333 m!1214215))

(assert (=> b!1325333 m!1214215))

(assert (=> b!1325333 m!1214217))

(assert (=> d!142901 d!143047))

(assert (=> d!142901 d!142911))

(declare-fun d!143049 () Bool)

(declare-fun e!755541 () Bool)

(assert (=> d!143049 e!755541))

(declare-fun res!879608 () Bool)

(assert (=> d!143049 (=> res!879608 e!755541)))

(declare-fun lt!589768 () Bool)

(assert (=> d!143049 (= res!879608 (not lt!589768))))

(declare-fun lt!589766 () Bool)

(assert (=> d!143049 (= lt!589768 lt!589766)))

(declare-fun lt!589767 () Unit!43642)

(declare-fun e!755542 () Unit!43642)

(assert (=> d!143049 (= lt!589767 e!755542)))

(declare-fun c!125747 () Bool)

(assert (=> d!143049 (= c!125747 lt!589766)))

(assert (=> d!143049 (= lt!589766 (containsKey!734 (toList!10588 lt!589616) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143049 (= (contains!8743 lt!589616 #b0000000000000000000000000000000000000000000000000000000000000000) lt!589768)))

(declare-fun b!1325334 () Bool)

(declare-fun lt!589765 () Unit!43642)

(assert (=> b!1325334 (= e!755542 lt!589765)))

(assert (=> b!1325334 (= lt!589765 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 lt!589616) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1325334 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589616) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1325335 () Bool)

(declare-fun Unit!43656 () Unit!43642)

(assert (=> b!1325335 (= e!755542 Unit!43656)))

(declare-fun b!1325336 () Bool)

(assert (=> b!1325336 (= e!755541 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589616) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143049 c!125747) b!1325334))

(assert (= (and d!143049 (not c!125747)) b!1325335))

(assert (= (and d!143049 (not res!879608)) b!1325336))

(declare-fun m!1214219 () Bool)

(assert (=> d!143049 m!1214219))

(declare-fun m!1214221 () Bool)

(assert (=> b!1325334 m!1214221))

(declare-fun m!1214223 () Bool)

(assert (=> b!1325334 m!1214223))

(assert (=> b!1325334 m!1214223))

(declare-fun m!1214225 () Bool)

(assert (=> b!1325334 m!1214225))

(assert (=> b!1325336 m!1214223))

(assert (=> b!1325336 m!1214223))

(assert (=> b!1325336 m!1214225))

(assert (=> bm!64705 d!143049))

(declare-fun d!143051 () Bool)

(assert (=> d!143051 (isDefined!519 (getValueByKey!712 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun lt!589769 () Unit!43642)

(assert (=> d!143051 (= lt!589769 (choose!1945 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun e!755543 () Bool)

(assert (=> d!143051 e!755543))

(declare-fun res!879609 () Bool)

(assert (=> d!143051 (=> (not res!879609) (not e!755543))))

(assert (=> d!143051 (= res!879609 (isStrictlySorted!876 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))))

(assert (=> d!143051 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) lt!589769)))

(declare-fun b!1325337 () Bool)

(assert (=> b!1325337 (= e!755543 (containsKey!734 (toList!10588 (getCurrentListMap!5584 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (= (and d!143051 res!879609) b!1325337))

(assert (=> d!143051 m!1213763))

(assert (=> d!143051 m!1213763))

(assert (=> d!143051 m!1213765))

(declare-fun m!1214227 () Bool)

(assert (=> d!143051 m!1214227))

(declare-fun m!1214229 () Bool)

(assert (=> d!143051 m!1214229))

(assert (=> b!1325337 m!1213759))

(assert (=> b!1325011 d!143051))

(assert (=> b!1325011 d!143011))

(assert (=> b!1325011 d!143013))

(declare-fun d!143053 () Bool)

(declare-fun e!755544 () Bool)

(assert (=> d!143053 e!755544))

(declare-fun res!879610 () Bool)

(assert (=> d!143053 (=> res!879610 e!755544)))

(declare-fun lt!589773 () Bool)

(assert (=> d!143053 (= res!879610 (not lt!589773))))

(declare-fun lt!589771 () Bool)

(assert (=> d!143053 (= lt!589773 lt!589771)))

(declare-fun lt!589772 () Unit!43642)

(declare-fun e!755545 () Unit!43642)

(assert (=> d!143053 (= lt!589772 e!755545)))

(declare-fun c!125748 () Bool)

(assert (=> d!143053 (= c!125748 lt!589771)))

(assert (=> d!143053 (= lt!589771 (containsKey!734 (toList!10588 lt!589527) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143053 (= (contains!8743 lt!589527 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!589773)))

(declare-fun b!1325338 () Bool)

(declare-fun lt!589770 () Unit!43642)

(assert (=> b!1325338 (= e!755545 lt!589770)))

(assert (=> b!1325338 (= lt!589770 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10588 lt!589527) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1325338 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589527) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1325339 () Bool)

(declare-fun Unit!43657 () Unit!43642)

(assert (=> b!1325339 (= e!755545 Unit!43657)))

(declare-fun b!1325340 () Bool)

(assert (=> b!1325340 (= e!755544 (isDefined!519 (getValueByKey!712 (toList!10588 lt!589527) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!143053 c!125748) b!1325338))

(assert (= (and d!143053 (not c!125748)) b!1325339))

(assert (= (and d!143053 (not res!879610)) b!1325340))

(declare-fun m!1214231 () Bool)

(assert (=> d!143053 m!1214231))

(declare-fun m!1214233 () Bool)

(assert (=> b!1325338 m!1214233))

(assert (=> b!1325338 m!1213699))

(assert (=> b!1325338 m!1213699))

(declare-fun m!1214235 () Bool)

(assert (=> b!1325338 m!1214235))

(assert (=> b!1325340 m!1213699))

(assert (=> b!1325340 m!1213699))

(assert (=> b!1325340 m!1214235))

(assert (=> d!142897 d!143053))

(declare-fun b!1325341 () Bool)

(declare-fun e!755546 () Option!764)

(assert (=> b!1325341 (= e!755546 (Some!763 (_2!11755 (h!31833 lt!589529))))))

(declare-fun b!1325342 () Bool)

(declare-fun e!755547 () Option!764)

(assert (=> b!1325342 (= e!755546 e!755547)))

(declare-fun c!125750 () Bool)

(assert (=> b!1325342 (= c!125750 (and ((_ is Cons!30624) lt!589529) (not (= (_1!11755 (h!31833 lt!589529)) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!125749 () Bool)

(declare-fun d!143055 () Bool)

(assert (=> d!143055 (= c!125749 (and ((_ is Cons!30624) lt!589529) (= (_1!11755 (h!31833 lt!589529)) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143055 (= (getValueByKey!712 lt!589529 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!755546)))

(declare-fun b!1325344 () Bool)

(assert (=> b!1325344 (= e!755547 None!762)))

(declare-fun b!1325343 () Bool)

(assert (=> b!1325343 (= e!755547 (getValueByKey!712 (t!44558 lt!589529) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!143055 c!125749) b!1325341))

(assert (= (and d!143055 (not c!125749)) b!1325342))

(assert (= (and b!1325342 c!125750) b!1325343))

(assert (= (and b!1325342 (not c!125750)) b!1325344))

(declare-fun m!1214237 () Bool)

(assert (=> b!1325343 m!1214237))

(assert (=> d!142897 d!143055))

(declare-fun d!143057 () Bool)

(assert (=> d!143057 (= (getValueByKey!712 lt!589529 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!763 (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!589774 () Unit!43642)

(assert (=> d!143057 (= lt!589774 (choose!1947 lt!589529 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!755548 () Bool)

(assert (=> d!143057 e!755548))

(declare-fun res!879611 () Bool)

(assert (=> d!143057 (=> (not res!879611) (not e!755548))))

(assert (=> d!143057 (= res!879611 (isStrictlySorted!876 lt!589529))))

(assert (=> d!143057 (= (lemmaContainsTupThenGetReturnValue!357 lt!589529 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!589774)))

(declare-fun b!1325345 () Bool)

(declare-fun res!879612 () Bool)

(assert (=> b!1325345 (=> (not res!879612) (not e!755548))))

(assert (=> b!1325345 (= res!879612 (containsKey!734 lt!589529 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1325346 () Bool)

(assert (=> b!1325346 (= e!755548 (contains!8744 lt!589529 (tuple2!23489 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!143057 res!879611) b!1325345))

(assert (= (and b!1325345 res!879612) b!1325346))

(assert (=> d!143057 m!1213693))

(declare-fun m!1214239 () Bool)

(assert (=> d!143057 m!1214239))

(declare-fun m!1214241 () Bool)

(assert (=> d!143057 m!1214241))

(declare-fun m!1214243 () Bool)

(assert (=> b!1325345 m!1214243))

(declare-fun m!1214245 () Bool)

(assert (=> b!1325346 m!1214245))

(assert (=> d!142897 d!143057))

(declare-fun b!1325347 () Bool)

(declare-fun e!755550 () Bool)

(declare-fun lt!589775 () List!30628)

(assert (=> b!1325347 (= e!755550 (contains!8744 lt!589775 (tuple2!23489 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!755551 () List!30628)

(declare-fun b!1325348 () Bool)

(assert (=> b!1325348 (= e!755551 (insertStrictlySorted!486 (t!44558 (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!64728 () Bool)

(declare-fun call!64733 () List!30628)

(declare-fun call!64732 () List!30628)

(assert (=> bm!64728 (= call!64733 call!64732)))

(declare-fun d!143059 () Bool)

(assert (=> d!143059 e!755550))

(declare-fun res!879613 () Bool)

(assert (=> d!143059 (=> (not res!879613) (not e!755550))))

(assert (=> d!143059 (= res!879613 (isStrictlySorted!876 lt!589775))))

(declare-fun e!755553 () List!30628)

(assert (=> d!143059 (= lt!589775 e!755553)))

(declare-fun c!125753 () Bool)

(assert (=> d!143059 (= c!125753 (and ((_ is Cons!30624) (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (bvslt (_1!11755 (h!31833 (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143059 (isStrictlySorted!876 (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))))

(assert (=> d!143059 (= (insertStrictlySorted!486 (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!589775)))

(declare-fun b!1325349 () Bool)

(declare-fun e!755549 () List!30628)

(assert (=> b!1325349 (= e!755549 call!64733)))

(declare-fun b!1325350 () Bool)

(declare-fun c!125754 () Bool)

(assert (=> b!1325350 (= c!125754 (and ((_ is Cons!30624) (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (bvsgt (_1!11755 (h!31833 (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!755552 () List!30628)

(assert (=> b!1325350 (= e!755549 e!755552)))

(declare-fun bm!64729 () Bool)

(assert (=> bm!64729 (= call!64732 ($colon$colon!669 e!755551 (ite c!125753 (h!31833 (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (tuple2!23489 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!125752 () Bool)

(assert (=> bm!64729 (= c!125752 c!125753)))

(declare-fun b!1325351 () Bool)

(assert (=> b!1325351 (= e!755553 call!64732)))

(declare-fun b!1325352 () Bool)

(declare-fun call!64731 () List!30628)

(assert (=> b!1325352 (= e!755552 call!64731)))

(declare-fun bm!64730 () Bool)

(assert (=> bm!64730 (= call!64731 call!64733)))

(declare-fun b!1325353 () Bool)

(declare-fun c!125751 () Bool)

(assert (=> b!1325353 (= e!755551 (ite c!125751 (t!44558 (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (ite c!125754 (Cons!30624 (h!31833 (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (t!44558 (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) Nil!30625)))))

(declare-fun b!1325354 () Bool)

(assert (=> b!1325354 (= e!755553 e!755549)))

(assert (=> b!1325354 (= c!125751 (and ((_ is Cons!30624) (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (= (_1!11755 (h!31833 (toList!10588 (getCurrentListMapNoExtraKeys!6249 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1325355 () Bool)

(assert (=> b!1325355 (= e!755552 call!64731)))

(declare-fun b!1325356 () Bool)

(declare-fun res!879614 () Bool)

(assert (=> b!1325356 (=> (not res!879614) (not e!755550))))

(assert (=> b!1325356 (= res!879614 (containsKey!734 lt!589775 (_1!11755 (tuple2!23489 (select (arr!43207 _keys!1609) from!2000) (get!21755 (select (arr!43208 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!143059 c!125753) b!1325351))

(assert (= (and d!143059 (not c!125753)) b!1325354))

(assert (= (and b!1325354 c!125751) b!1325349))

(assert (= (and b!1325354 (not c!125751)) b!1325350))

(assert (= (and b!1325350 c!125754) b!1325355))

(assert (= (and b!1325350 (not c!125754)) b!1325352))

(assert (= (or b!1325355 b!1325352) bm!64730))

(assert (= (or b!1325349 bm!64730) bm!64728))

(assert (= (or b!1325351 bm!64728) bm!64729))

(assert (= (and bm!64729 c!125752) b!1325348))

(assert (= (and bm!64729 (not c!125752)) b!1325353))

(assert (= (and d!143059 res!879613) b!1325356))

(assert (= (and b!1325356 res!879614) b!1325347))

(declare-fun m!1214247 () Bool)

(assert (=> b!1325347 m!1214247))

(declare-fun m!1214249 () Bool)

(assert (=> bm!64729 m!1214249))

(declare-fun m!1214251 () Bool)

(assert (=> b!1325356 m!1214251))

(declare-fun m!1214253 () Bool)

(assert (=> b!1325348 m!1214253))

(declare-fun m!1214255 () Bool)

(assert (=> d!143059 m!1214255))

(declare-fun m!1214257 () Bool)

(assert (=> d!143059 m!1214257))

(assert (=> d!142897 d!143059))

(declare-fun d!143061 () Bool)

(declare-fun lt!589776 () Bool)

(assert (=> d!143061 (= lt!589776 (select (content!653 (toList!10588 lt!589556)) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun e!755554 () Bool)

(assert (=> d!143061 (= lt!589776 e!755554)))

(declare-fun res!879616 () Bool)

(assert (=> d!143061 (=> (not res!879616) (not e!755554))))

(assert (=> d!143061 (= res!879616 ((_ is Cons!30624) (toList!10588 lt!589556)))))

(assert (=> d!143061 (= (contains!8744 (toList!10588 lt!589556) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) lt!589776)))

(declare-fun b!1325357 () Bool)

(declare-fun e!755555 () Bool)

(assert (=> b!1325357 (= e!755554 e!755555)))

(declare-fun res!879615 () Bool)

(assert (=> b!1325357 (=> res!879615 e!755555)))

(assert (=> b!1325357 (= res!879615 (= (h!31833 (toList!10588 lt!589556)) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1325358 () Bool)

(assert (=> b!1325358 (= e!755555 (contains!8744 (t!44558 (toList!10588 lt!589556)) (tuple2!23489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (= (and d!143061 res!879616) b!1325357))

(assert (= (and b!1325357 (not res!879615)) b!1325358))

(declare-fun m!1214259 () Bool)

(assert (=> d!143061 m!1214259))

(declare-fun m!1214261 () Bool)

(assert (=> d!143061 m!1214261))

(declare-fun m!1214263 () Bool)

(assert (=> b!1325358 m!1214263))

(assert (=> b!1325010 d!143061))

(declare-fun d!143063 () Bool)

(assert (=> d!143063 (= (apply!1029 lt!589616 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21758 (getValueByKey!712 (toList!10588 lt!589616) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37909 () Bool)

(assert (= bs!37909 d!143063))

(assert (=> bs!37909 m!1214223))

(assert (=> bs!37909 m!1214223))

(declare-fun m!1214265 () Bool)

(assert (=> bs!37909 m!1214265))

(assert (=> b!1325076 d!143063))

(declare-fun b!1325360 () Bool)

(declare-fun e!755557 () Bool)

(assert (=> b!1325360 (= e!755557 tp_is_empty!36279)))

(declare-fun condMapEmpty!56073 () Bool)

(declare-fun mapDefault!56073 () ValueCell!17241)

(assert (=> mapNonEmpty!56072 (= condMapEmpty!56073 (= mapRest!56072 ((as const (Array (_ BitVec 32) ValueCell!17241)) mapDefault!56073)))))

(declare-fun mapRes!56073 () Bool)

(assert (=> mapNonEmpty!56072 (= tp!106862 (and e!755557 mapRes!56073))))

(declare-fun mapIsEmpty!56073 () Bool)

(assert (=> mapIsEmpty!56073 mapRes!56073))

(declare-fun mapNonEmpty!56073 () Bool)

(declare-fun tp!106863 () Bool)

(declare-fun e!755556 () Bool)

(assert (=> mapNonEmpty!56073 (= mapRes!56073 (and tp!106863 e!755556))))

(declare-fun mapValue!56073 () ValueCell!17241)

(declare-fun mapRest!56073 () (Array (_ BitVec 32) ValueCell!17241))

(declare-fun mapKey!56073 () (_ BitVec 32))

(assert (=> mapNonEmpty!56073 (= mapRest!56072 (store mapRest!56073 mapKey!56073 mapValue!56073))))

(declare-fun b!1325359 () Bool)

(assert (=> b!1325359 (= e!755556 tp_is_empty!36279)))

(assert (= (and mapNonEmpty!56072 condMapEmpty!56073) mapIsEmpty!56073))

(assert (= (and mapNonEmpty!56072 (not condMapEmpty!56073)) mapNonEmpty!56073))

(assert (= (and mapNonEmpty!56073 ((_ is ValueCellFull!17241) mapValue!56073)) b!1325359))

(assert (= (and mapNonEmpty!56072 ((_ is ValueCellFull!17241) mapDefault!56073)) b!1325360))

(declare-fun m!1214267 () Bool)

(assert (=> mapNonEmpty!56073 m!1214267))

(declare-fun b_lambda!23733 () Bool)

(assert (= b_lambda!23729 (or (and start!111802 b_free!30459) b_lambda!23733)))

(declare-fun b_lambda!23735 () Bool)

(assert (= b_lambda!23727 (or (and start!111802 b_free!30459) b_lambda!23735)))

(declare-fun b_lambda!23737 () Bool)

(assert (= b_lambda!23731 (or (and start!111802 b_free!30459) b_lambda!23737)))

(declare-fun b_lambda!23739 () Bool)

(assert (= b_lambda!23725 (or (and start!111802 b_free!30459) b_lambda!23739)))

(check-sat (not d!143027) (not d!143041) (not b!1325324) (not b!1325345) (not b!1325297) (not b!1325174) (not b!1325147) (not bm!64721) (not b!1325171) b_and!49019 (not d!143017) (not b!1325318) (not d!143001) (not b!1325136) (not b!1325200) (not b!1325137) (not b!1325163) (not bm!64729) (not d!142969) (not b!1325159) (not d!143061) (not b!1325198) (not d!143047) (not b!1325337) (not bm!64712) (not b!1325175) (not b_next!30459) (not bm!64726) (not b!1325154) (not d!143033) (not b!1325322) (not b!1325256) (not b!1325181) (not b!1325162) (not b!1325303) (not b!1325128) (not b!1325277) (not b!1325173) (not b!1325139) (not b!1325348) (not d!143023) (not b!1325241) (not b!1325310) (not b!1325261) (not b!1325210) (not d!142997) (not d!142967) (not d!143057) (not d!143043) (not b!1325138) (not b!1325263) (not b!1325158) (not b_lambda!23739) (not d!143015) (not b!1325305) (not b!1325161) (not b!1325146) (not b!1325290) (not d!143025) (not b!1325208) (not b!1325250) (not b!1325323) (not b!1325331) (not d!143011) (not d!142951) (not d!142953) (not d!142941) (not d!142975) tp_is_empty!36279 (not b!1325340) (not b_lambda!23721) (not d!143031) (not b!1325165) (not d!142987) (not b_lambda!23737) (not mapNonEmpty!56073) (not bm!64713) (not d!142985) (not d!143051) (not b!1325281) (not d!142923) (not b!1325114) (not b!1325272) (not d!142963) (not b_lambda!23711) (not d!142977) (not b_lambda!23723) (not b!1325264) (not b!1325253) (not d!143021) (not b!1325338) (not b!1325320) (not b!1325326) (not b!1325304) (not b!1325300) (not b!1325358) (not d!142959) (not b!1325312) (not bm!64727) (not b!1325327) (not b!1325145) (not d!143035) (not b!1325133) (not b!1325207) (not b_lambda!23719) (not d!142949) (not d!143039) (not d!142939) (not d!143029) (not d!143049) (not d!142929) (not b!1325346) (not b!1325343) (not d!142931) (not d!142947) (not b!1325329) (not d!143019) (not b!1325170) (not d!142933) (not b!1325274) (not b!1325293) (not d!142955) (not d!142945) (not b!1325213) (not b!1325150) (not b!1325336) (not d!142937) (not d!142979) (not b!1325201) (not b!1325288) (not b!1325157) (not b!1325347) (not d!143037) (not b!1325220) (not b!1325325) (not bm!64724) (not b!1325262) (not b!1325219) (not b!1325333) (not b!1325251) (not b!1325259) (not b!1325166) (not b!1325294) (not d!142983) (not d!143007) (not b!1325356) (not b!1325298) (not b_lambda!23735) (not d!143045) (not b!1325242) (not d!142925) (not b!1325127) (not b!1325254) (not d!143053) (not b!1325334) (not d!142973) (not b!1325308) (not b!1325135) (not d!143059) (not b_lambda!23733) (not d!143063) (not b!1325169) (not b!1325125) (not b!1325291) (not b!1325328) (not b!1325153))
(check-sat b_and!49019 (not b_next!30459))
