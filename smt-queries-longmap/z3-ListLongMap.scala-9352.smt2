; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111550 () Bool)

(assert start!111550)

(declare-fun b_free!30207 () Bool)

(declare-fun b_next!30207 () Bool)

(assert (=> start!111550 (= b_free!30207 (not b_next!30207))))

(declare-fun tp!106097 () Bool)

(declare-fun b_and!48573 () Bool)

(assert (=> start!111550 (= tp!106097 b_and!48573)))

(declare-fun b!1320840 () Bool)

(declare-fun res!876664 () Bool)

(declare-fun e!753392 () Bool)

(assert (=> b!1320840 (=> (not res!876664) (not e!753392))))

(declare-datatypes ((array!88984 0))(
  ( (array!88985 (arr!42966 (Array (_ BitVec 32) (_ BitVec 64))) (size!43516 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88984)

(declare-datatypes ((List!30443 0))(
  ( (Nil!30440) (Cons!30439 (h!31648 (_ BitVec 64)) (t!44199 List!30443)) )
))
(declare-fun arrayNoDuplicates!0 (array!88984 (_ BitVec 32) List!30443) Bool)

(assert (=> b!1320840 (= res!876664 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30440))))

(declare-fun b!1320841 () Bool)

(assert (=> b!1320841 (= e!753392 (not true))))

(declare-datatypes ((V!53139 0))(
  ( (V!53140 (val!18088 Int)) )
))
(declare-datatypes ((tuple2!23294 0))(
  ( (tuple2!23295 (_1!11658 (_ BitVec 64)) (_2!11658 V!53139)) )
))
(declare-datatypes ((List!30444 0))(
  ( (Nil!30441) (Cons!30440 (h!31649 tuple2!23294) (t!44200 List!30444)) )
))
(declare-datatypes ((ListLongMap!20951 0))(
  ( (ListLongMap!20952 (toList!10491 List!30444)) )
))
(declare-fun lt!587106 () ListLongMap!20951)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8646 (ListLongMap!20951 (_ BitVec 64)) Bool)

(assert (=> b!1320841 (contains!8646 lt!587106 k0!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((Unit!43520 0))(
  ( (Unit!43521) )
))
(declare-fun lt!587105 () Unit!43520)

(declare-fun lt!587108 () V!53139)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!146 ((_ BitVec 64) (_ BitVec 64) V!53139 ListLongMap!20951) Unit!43520)

(assert (=> b!1320841 (= lt!587105 (lemmaInListMapAfterAddingDiffThenInBefore!146 k0!1164 (select (arr!42966 _keys!1609) from!2000) lt!587108 lt!587106))))

(declare-fun lt!587104 () ListLongMap!20951)

(assert (=> b!1320841 (contains!8646 lt!587104 k0!1164)))

(declare-fun lt!587109 () Unit!43520)

(declare-fun zeroValue!1279 () V!53139)

(assert (=> b!1320841 (= lt!587109 (lemmaInListMapAfterAddingDiffThenInBefore!146 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587104))))

(declare-fun lt!587107 () ListLongMap!20951)

(assert (=> b!1320841 (contains!8646 lt!587107 k0!1164)))

(declare-fun minValue!1279 () V!53139)

(declare-fun lt!587103 () Unit!43520)

(assert (=> b!1320841 (= lt!587103 (lemmaInListMapAfterAddingDiffThenInBefore!146 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587107))))

(declare-fun +!4550 (ListLongMap!20951 tuple2!23294) ListLongMap!20951)

(assert (=> b!1320841 (= lt!587107 (+!4550 lt!587104 (tuple2!23295 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1320841 (= lt!587104 (+!4550 lt!587106 (tuple2!23295 (select (arr!42966 _keys!1609) from!2000) lt!587108)))))

(declare-datatypes ((ValueCell!17115 0))(
  ( (ValueCellFull!17115 (v!20718 V!53139)) (EmptyCell!17115) )
))
(declare-datatypes ((array!88986 0))(
  ( (array!88987 (arr!42967 (Array (_ BitVec 32) ValueCell!17115)) (size!43517 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88986)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21610 (ValueCell!17115 V!53139) V!53139)

(declare-fun dynLambda!3489 (Int (_ BitVec 64)) V!53139)

(assert (=> b!1320841 (= lt!587108 (get!21610 (select (arr!42967 _values!1337) from!2000) (dynLambda!3489 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6185 (array!88984 array!88986 (_ BitVec 32) (_ BitVec 32) V!53139 V!53139 (_ BitVec 32) Int) ListLongMap!20951)

(assert (=> b!1320841 (= lt!587106 (getCurrentListMapNoExtraKeys!6185 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1320842 () Bool)

(declare-fun res!876661 () Bool)

(assert (=> b!1320842 (=> (not res!876661) (not e!753392))))

(assert (=> b!1320842 (= res!876661 (and (= (size!43517 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43516 _keys!1609) (size!43517 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320843 () Bool)

(declare-fun res!876667 () Bool)

(assert (=> b!1320843 (=> (not res!876667) (not e!753392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320843 (= res!876667 (validKeyInArray!0 (select (arr!42966 _keys!1609) from!2000)))))

(declare-fun b!1320844 () Bool)

(declare-fun e!753394 () Bool)

(declare-fun tp_is_empty!36027 () Bool)

(assert (=> b!1320844 (= e!753394 tp_is_empty!36027)))

(declare-fun b!1320845 () Bool)

(declare-fun e!753393 () Bool)

(assert (=> b!1320845 (= e!753393 tp_is_empty!36027)))

(declare-fun b!1320846 () Bool)

(declare-fun res!876663 () Bool)

(assert (=> b!1320846 (=> (not res!876663) (not e!753392))))

(assert (=> b!1320846 (= res!876663 (not (= (select (arr!42966 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320847 () Bool)

(declare-fun res!876668 () Bool)

(assert (=> b!1320847 (=> (not res!876668) (not e!753392))))

(assert (=> b!1320847 (= res!876668 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43516 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55688 () Bool)

(declare-fun mapRes!55688 () Bool)

(assert (=> mapIsEmpty!55688 mapRes!55688))

(declare-fun res!876666 () Bool)

(assert (=> start!111550 (=> (not res!876666) (not e!753392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111550 (= res!876666 (validMask!0 mask!2019))))

(assert (=> start!111550 e!753392))

(declare-fun array_inv!32437 (array!88984) Bool)

(assert (=> start!111550 (array_inv!32437 _keys!1609)))

(assert (=> start!111550 true))

(assert (=> start!111550 tp_is_empty!36027))

(declare-fun e!753391 () Bool)

(declare-fun array_inv!32438 (array!88986) Bool)

(assert (=> start!111550 (and (array_inv!32438 _values!1337) e!753391)))

(assert (=> start!111550 tp!106097))

(declare-fun mapNonEmpty!55688 () Bool)

(declare-fun tp!106096 () Bool)

(assert (=> mapNonEmpty!55688 (= mapRes!55688 (and tp!106096 e!753394))))

(declare-fun mapRest!55688 () (Array (_ BitVec 32) ValueCell!17115))

(declare-fun mapValue!55688 () ValueCell!17115)

(declare-fun mapKey!55688 () (_ BitVec 32))

(assert (=> mapNonEmpty!55688 (= (arr!42967 _values!1337) (store mapRest!55688 mapKey!55688 mapValue!55688))))

(declare-fun b!1320848 () Bool)

(declare-fun res!876665 () Bool)

(assert (=> b!1320848 (=> (not res!876665) (not e!753392))))

(declare-fun getCurrentListMap!5494 (array!88984 array!88986 (_ BitVec 32) (_ BitVec 32) V!53139 V!53139 (_ BitVec 32) Int) ListLongMap!20951)

(assert (=> b!1320848 (= res!876665 (contains!8646 (getCurrentListMap!5494 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320849 () Bool)

(declare-fun res!876662 () Bool)

(assert (=> b!1320849 (=> (not res!876662) (not e!753392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88984 (_ BitVec 32)) Bool)

(assert (=> b!1320849 (= res!876662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320850 () Bool)

(assert (=> b!1320850 (= e!753391 (and e!753393 mapRes!55688))))

(declare-fun condMapEmpty!55688 () Bool)

(declare-fun mapDefault!55688 () ValueCell!17115)

(assert (=> b!1320850 (= condMapEmpty!55688 (= (arr!42967 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17115)) mapDefault!55688)))))

(assert (= (and start!111550 res!876666) b!1320842))

(assert (= (and b!1320842 res!876661) b!1320849))

(assert (= (and b!1320849 res!876662) b!1320840))

(assert (= (and b!1320840 res!876664) b!1320847))

(assert (= (and b!1320847 res!876668) b!1320848))

(assert (= (and b!1320848 res!876665) b!1320846))

(assert (= (and b!1320846 res!876663) b!1320843))

(assert (= (and b!1320843 res!876667) b!1320841))

(assert (= (and b!1320850 condMapEmpty!55688) mapIsEmpty!55688))

(assert (= (and b!1320850 (not condMapEmpty!55688)) mapNonEmpty!55688))

(get-info :version)

(assert (= (and mapNonEmpty!55688 ((_ is ValueCellFull!17115) mapValue!55688)) b!1320844))

(assert (= (and b!1320850 ((_ is ValueCellFull!17115) mapDefault!55688)) b!1320845))

(assert (= start!111550 b!1320850))

(declare-fun b_lambda!23533 () Bool)

(assert (=> (not b_lambda!23533) (not b!1320841)))

(declare-fun t!44198 () Bool)

(declare-fun tb!11559 () Bool)

(assert (=> (and start!111550 (= defaultEntry!1340 defaultEntry!1340) t!44198) tb!11559))

(declare-fun result!24173 () Bool)

(assert (=> tb!11559 (= result!24173 tp_is_empty!36027)))

(assert (=> b!1320841 t!44198))

(declare-fun b_and!48575 () Bool)

(assert (= b_and!48573 (and (=> t!44198 result!24173) b_and!48575)))

(declare-fun m!1208615 () Bool)

(assert (=> b!1320849 m!1208615))

(declare-fun m!1208617 () Bool)

(assert (=> b!1320841 m!1208617))

(declare-fun m!1208619 () Bool)

(assert (=> b!1320841 m!1208619))

(declare-fun m!1208621 () Bool)

(assert (=> b!1320841 m!1208621))

(declare-fun m!1208623 () Bool)

(assert (=> b!1320841 m!1208623))

(declare-fun m!1208625 () Bool)

(assert (=> b!1320841 m!1208625))

(declare-fun m!1208627 () Bool)

(assert (=> b!1320841 m!1208627))

(declare-fun m!1208629 () Bool)

(assert (=> b!1320841 m!1208629))

(declare-fun m!1208631 () Bool)

(assert (=> b!1320841 m!1208631))

(declare-fun m!1208633 () Bool)

(assert (=> b!1320841 m!1208633))

(declare-fun m!1208635 () Bool)

(assert (=> b!1320841 m!1208635))

(assert (=> b!1320841 m!1208625))

(declare-fun m!1208637 () Bool)

(assert (=> b!1320841 m!1208637))

(assert (=> b!1320841 m!1208635))

(assert (=> b!1320841 m!1208621))

(declare-fun m!1208639 () Bool)

(assert (=> b!1320841 m!1208639))

(declare-fun m!1208641 () Bool)

(assert (=> b!1320841 m!1208641))

(declare-fun m!1208643 () Bool)

(assert (=> b!1320848 m!1208643))

(assert (=> b!1320848 m!1208643))

(declare-fun m!1208645 () Bool)

(assert (=> b!1320848 m!1208645))

(declare-fun m!1208647 () Bool)

(assert (=> b!1320840 m!1208647))

(declare-fun m!1208649 () Bool)

(assert (=> mapNonEmpty!55688 m!1208649))

(assert (=> b!1320843 m!1208625))

(assert (=> b!1320843 m!1208625))

(declare-fun m!1208651 () Bool)

(assert (=> b!1320843 m!1208651))

(declare-fun m!1208653 () Bool)

(assert (=> start!111550 m!1208653))

(declare-fun m!1208655 () Bool)

(assert (=> start!111550 m!1208655))

(declare-fun m!1208657 () Bool)

(assert (=> start!111550 m!1208657))

(assert (=> b!1320846 m!1208625))

(check-sat (not b!1320840) (not b!1320849) (not b_next!30207) (not start!111550) b_and!48575 (not b!1320843) (not b_lambda!23533) (not b!1320841) (not mapNonEmpty!55688) (not b!1320848) tp_is_empty!36027)
(check-sat b_and!48575 (not b_next!30207))
