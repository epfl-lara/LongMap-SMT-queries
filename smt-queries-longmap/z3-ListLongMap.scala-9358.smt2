; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111808 () Bool)

(assert start!111808)

(declare-fun b_free!30241 () Bool)

(declare-fun b_next!30241 () Bool)

(assert (=> start!111808 (= b_free!30241 (not b_next!30241))))

(declare-fun tp!106198 () Bool)

(declare-fun b_and!48643 () Bool)

(assert (=> start!111808 (= tp!106198 b_and!48643)))

(declare-fun b!1322734 () Bool)

(declare-fun e!754491 () Bool)

(assert (=> b!1322734 (= e!754491 (not true))))

(declare-datatypes ((V!53185 0))(
  ( (V!53186 (val!18105 Int)) )
))
(declare-datatypes ((tuple2!23360 0))(
  ( (tuple2!23361 (_1!11691 (_ BitVec 64)) (_2!11691 V!53185)) )
))
(declare-datatypes ((List!30514 0))(
  ( (Nil!30511) (Cons!30510 (h!31728 tuple2!23360) (t!44296 List!30514)) )
))
(declare-datatypes ((ListLongMap!21025 0))(
  ( (ListLongMap!21026 (toList!10528 List!30514)) )
))
(declare-fun lt!587939 () ListLongMap!21025)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8695 (ListLongMap!21025 (_ BitVec 64)) Bool)

(assert (=> b!1322734 (contains!8695 lt!587939 k0!1164)))

(declare-datatypes ((array!89129 0))(
  ( (array!89130 (arr!43034 (Array (_ BitVec 32) (_ BitVec 64))) (size!43585 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89129)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!587938 () V!53185)

(declare-datatypes ((Unit!43499 0))(
  ( (Unit!43500) )
))
(declare-fun lt!587936 () Unit!43499)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!161 ((_ BitVec 64) (_ BitVec 64) V!53185 ListLongMap!21025) Unit!43499)

(assert (=> b!1322734 (= lt!587936 (lemmaInListMapAfterAddingDiffThenInBefore!161 k0!1164 (select (arr!43034 _keys!1609) from!2000) lt!587938 lt!587939))))

(declare-fun lt!587940 () ListLongMap!21025)

(assert (=> b!1322734 (contains!8695 lt!587940 k0!1164)))

(declare-fun zeroValue!1279 () V!53185)

(declare-fun lt!587941 () Unit!43499)

(assert (=> b!1322734 (= lt!587941 (lemmaInListMapAfterAddingDiffThenInBefore!161 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587940))))

(declare-fun lt!587942 () ListLongMap!21025)

(assert (=> b!1322734 (contains!8695 lt!587942 k0!1164)))

(declare-fun minValue!1279 () V!53185)

(declare-fun lt!587937 () Unit!43499)

(assert (=> b!1322734 (= lt!587937 (lemmaInListMapAfterAddingDiffThenInBefore!161 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587942))))

(declare-fun +!4606 (ListLongMap!21025 tuple2!23360) ListLongMap!21025)

(assert (=> b!1322734 (= lt!587942 (+!4606 lt!587940 (tuple2!23361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1322734 (= lt!587940 (+!4606 lt!587939 (tuple2!23361 (select (arr!43034 _keys!1609) from!2000) lt!587938)))))

(declare-datatypes ((ValueCell!17132 0))(
  ( (ValueCellFull!17132 (v!20730 V!53185)) (EmptyCell!17132) )
))
(declare-datatypes ((array!89131 0))(
  ( (array!89132 (arr!43035 (Array (_ BitVec 32) ValueCell!17132)) (size!43586 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89131)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21681 (ValueCell!17132 V!53185) V!53185)

(declare-fun dynLambda!3560 (Int (_ BitVec 64)) V!53185)

(assert (=> b!1322734 (= lt!587938 (get!21681 (select (arr!43035 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6245 (array!89129 array!89131 (_ BitVec 32) (_ BitVec 32) V!53185 V!53185 (_ BitVec 32) Int) ListLongMap!21025)

(assert (=> b!1322734 (= lt!587939 (getCurrentListMapNoExtraKeys!6245 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322735 () Bool)

(declare-fun res!877591 () Bool)

(assert (=> b!1322735 (=> (not res!877591) (not e!754491))))

(declare-fun getCurrentListMap!5521 (array!89129 array!89131 (_ BitVec 32) (_ BitVec 32) V!53185 V!53185 (_ BitVec 32) Int) ListLongMap!21025)

(assert (=> b!1322735 (= res!877591 (contains!8695 (getCurrentListMap!5521 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322736 () Bool)

(declare-fun e!754492 () Bool)

(declare-fun tp_is_empty!36061 () Bool)

(assert (=> b!1322736 (= e!754492 tp_is_empty!36061)))

(declare-fun res!877590 () Bool)

(assert (=> start!111808 (=> (not res!877590) (not e!754491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111808 (= res!877590 (validMask!0 mask!2019))))

(assert (=> start!111808 e!754491))

(declare-fun array_inv!32765 (array!89129) Bool)

(assert (=> start!111808 (array_inv!32765 _keys!1609)))

(assert (=> start!111808 true))

(assert (=> start!111808 tp_is_empty!36061))

(declare-fun e!754490 () Bool)

(declare-fun array_inv!32766 (array!89131) Bool)

(assert (=> start!111808 (and (array_inv!32766 _values!1337) e!754490)))

(assert (=> start!111808 tp!106198))

(declare-fun b!1322737 () Bool)

(declare-fun res!877594 () Bool)

(assert (=> b!1322737 (=> (not res!877594) (not e!754491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322737 (= res!877594 (validKeyInArray!0 (select (arr!43034 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55739 () Bool)

(declare-fun mapRes!55739 () Bool)

(declare-fun tp!106199 () Bool)

(assert (=> mapNonEmpty!55739 (= mapRes!55739 (and tp!106199 e!754492))))

(declare-fun mapValue!55739 () ValueCell!17132)

(declare-fun mapKey!55739 () (_ BitVec 32))

(declare-fun mapRest!55739 () (Array (_ BitVec 32) ValueCell!17132))

(assert (=> mapNonEmpty!55739 (= (arr!43035 _values!1337) (store mapRest!55739 mapKey!55739 mapValue!55739))))

(declare-fun b!1322738 () Bool)

(declare-fun res!877592 () Bool)

(assert (=> b!1322738 (=> (not res!877592) (not e!754491))))

(assert (=> b!1322738 (= res!877592 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43585 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322739 () Bool)

(declare-fun res!877589 () Bool)

(assert (=> b!1322739 (=> (not res!877589) (not e!754491))))

(declare-datatypes ((List!30515 0))(
  ( (Nil!30512) (Cons!30511 (h!31729 (_ BitVec 64)) (t!44297 List!30515)) )
))
(declare-fun arrayNoDuplicates!0 (array!89129 (_ BitVec 32) List!30515) Bool)

(assert (=> b!1322739 (= res!877589 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30512))))

(declare-fun b!1322740 () Bool)

(declare-fun res!877588 () Bool)

(assert (=> b!1322740 (=> (not res!877588) (not e!754491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89129 (_ BitVec 32)) Bool)

(assert (=> b!1322740 (= res!877588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322741 () Bool)

(declare-fun res!877593 () Bool)

(assert (=> b!1322741 (=> (not res!877593) (not e!754491))))

(assert (=> b!1322741 (= res!877593 (not (= (select (arr!43034 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322742 () Bool)

(declare-fun res!877587 () Bool)

(assert (=> b!1322742 (=> (not res!877587) (not e!754491))))

(assert (=> b!1322742 (= res!877587 (and (= (size!43586 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43585 _keys!1609) (size!43586 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55739 () Bool)

(assert (=> mapIsEmpty!55739 mapRes!55739))

(declare-fun b!1322743 () Bool)

(declare-fun e!754488 () Bool)

(assert (=> b!1322743 (= e!754488 tp_is_empty!36061)))

(declare-fun b!1322744 () Bool)

(assert (=> b!1322744 (= e!754490 (and e!754488 mapRes!55739))))

(declare-fun condMapEmpty!55739 () Bool)

(declare-fun mapDefault!55739 () ValueCell!17132)

(assert (=> b!1322744 (= condMapEmpty!55739 (= (arr!43035 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17132)) mapDefault!55739)))))

(assert (= (and start!111808 res!877590) b!1322742))

(assert (= (and b!1322742 res!877587) b!1322740))

(assert (= (and b!1322740 res!877588) b!1322739))

(assert (= (and b!1322739 res!877589) b!1322738))

(assert (= (and b!1322738 res!877592) b!1322735))

(assert (= (and b!1322735 res!877591) b!1322741))

(assert (= (and b!1322741 res!877593) b!1322737))

(assert (= (and b!1322737 res!877594) b!1322734))

(assert (= (and b!1322744 condMapEmpty!55739) mapIsEmpty!55739))

(assert (= (and b!1322744 (not condMapEmpty!55739)) mapNonEmpty!55739))

(get-info :version)

(assert (= (and mapNonEmpty!55739 ((_ is ValueCellFull!17132) mapValue!55739)) b!1322736))

(assert (= (and b!1322744 ((_ is ValueCellFull!17132) mapDefault!55739)) b!1322743))

(assert (= start!111808 b!1322744))

(declare-fun b_lambda!23561 () Bool)

(assert (=> (not b_lambda!23561) (not b!1322734)))

(declare-fun t!44295 () Bool)

(declare-fun tb!11585 () Bool)

(assert (=> (and start!111808 (= defaultEntry!1340 defaultEntry!1340) t!44295) tb!11585))

(declare-fun result!24233 () Bool)

(assert (=> tb!11585 (= result!24233 tp_is_empty!36061)))

(assert (=> b!1322734 t!44295))

(declare-fun b_and!48645 () Bool)

(assert (= b_and!48643 (and (=> t!44295 result!24233) b_and!48645)))

(declare-fun m!1210961 () Bool)

(assert (=> mapNonEmpty!55739 m!1210961))

(declare-fun m!1210963 () Bool)

(assert (=> b!1322739 m!1210963))

(declare-fun m!1210965 () Bool)

(assert (=> b!1322740 m!1210965))

(declare-fun m!1210967 () Bool)

(assert (=> b!1322735 m!1210967))

(assert (=> b!1322735 m!1210967))

(declare-fun m!1210969 () Bool)

(assert (=> b!1322735 m!1210969))

(declare-fun m!1210971 () Bool)

(assert (=> b!1322741 m!1210971))

(declare-fun m!1210973 () Bool)

(assert (=> start!111808 m!1210973))

(declare-fun m!1210975 () Bool)

(assert (=> start!111808 m!1210975))

(declare-fun m!1210977 () Bool)

(assert (=> start!111808 m!1210977))

(declare-fun m!1210979 () Bool)

(assert (=> b!1322734 m!1210979))

(declare-fun m!1210981 () Bool)

(assert (=> b!1322734 m!1210981))

(declare-fun m!1210983 () Bool)

(assert (=> b!1322734 m!1210983))

(declare-fun m!1210985 () Bool)

(assert (=> b!1322734 m!1210985))

(declare-fun m!1210987 () Bool)

(assert (=> b!1322734 m!1210987))

(declare-fun m!1210989 () Bool)

(assert (=> b!1322734 m!1210989))

(assert (=> b!1322734 m!1210971))

(assert (=> b!1322734 m!1210971))

(declare-fun m!1210991 () Bool)

(assert (=> b!1322734 m!1210991))

(declare-fun m!1210993 () Bool)

(assert (=> b!1322734 m!1210993))

(declare-fun m!1210995 () Bool)

(assert (=> b!1322734 m!1210995))

(assert (=> b!1322734 m!1210989))

(assert (=> b!1322734 m!1210983))

(declare-fun m!1210997 () Bool)

(assert (=> b!1322734 m!1210997))

(declare-fun m!1210999 () Bool)

(assert (=> b!1322734 m!1210999))

(declare-fun m!1211001 () Bool)

(assert (=> b!1322734 m!1211001))

(assert (=> b!1322737 m!1210971))

(assert (=> b!1322737 m!1210971))

(declare-fun m!1211003 () Bool)

(assert (=> b!1322737 m!1211003))

(check-sat (not b!1322734) (not b!1322739) tp_is_empty!36061 (not mapNonEmpty!55739) (not start!111808) (not b!1322740) (not b_next!30241) (not b!1322737) (not b_lambda!23561) (not b!1322735) b_and!48645)
(check-sat b_and!48645 (not b_next!30241))
