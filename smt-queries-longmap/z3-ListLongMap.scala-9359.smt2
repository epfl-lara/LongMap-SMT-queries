; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111590 () Bool)

(assert start!111590)

(declare-fun b_free!30247 () Bool)

(declare-fun b_next!30247 () Bool)

(assert (=> start!111590 (= b_free!30247 (not b_next!30247))))

(declare-fun tp!106218 () Bool)

(declare-fun b_and!48635 () Bool)

(assert (=> start!111590 (= tp!106218 b_and!48635)))

(declare-fun b!1321470 () Bool)

(declare-fun res!877118 () Bool)

(declare-fun e!753659 () Bool)

(assert (=> b!1321470 (=> (not res!877118) (not e!753659))))

(declare-datatypes ((array!88987 0))(
  ( (array!88988 (arr!42968 (Array (_ BitVec 32) (_ BitVec 64))) (size!43520 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88987)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1321470 (= res!877118 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43520 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55748 () Bool)

(declare-fun mapRes!55748 () Bool)

(declare-fun tp!106217 () Bool)

(declare-fun e!753661 () Bool)

(assert (=> mapNonEmpty!55748 (= mapRes!55748 (and tp!106217 e!753661))))

(declare-fun mapKey!55748 () (_ BitVec 32))

(declare-datatypes ((V!53193 0))(
  ( (V!53194 (val!18108 Int)) )
))
(declare-datatypes ((ValueCell!17135 0))(
  ( (ValueCellFull!17135 (v!20737 V!53193)) (EmptyCell!17135) )
))
(declare-datatypes ((array!88989 0))(
  ( (array!88990 (arr!42969 (Array (_ BitVec 32) ValueCell!17135)) (size!43521 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88989)

(declare-fun mapRest!55748 () (Array (_ BitVec 32) ValueCell!17135))

(declare-fun mapValue!55748 () ValueCell!17135)

(assert (=> mapNonEmpty!55748 (= (arr!42969 _values!1337) (store mapRest!55748 mapKey!55748 mapValue!55748))))

(declare-fun mapIsEmpty!55748 () Bool)

(assert (=> mapIsEmpty!55748 mapRes!55748))

(declare-fun b!1321471 () Bool)

(declare-fun res!877115 () Bool)

(assert (=> b!1321471 (=> (not res!877115) (not e!753659))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88987 (_ BitVec 32)) Bool)

(assert (=> b!1321471 (= res!877115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321472 () Bool)

(declare-fun e!753660 () Bool)

(declare-fun tp_is_empty!36067 () Bool)

(assert (=> b!1321472 (= e!753660 tp_is_empty!36067)))

(declare-fun b!1321473 () Bool)

(declare-fun res!877116 () Bool)

(assert (=> b!1321473 (=> (not res!877116) (not e!753659))))

(declare-fun zeroValue!1279 () V!53193)

(declare-fun minValue!1279 () V!53193)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23402 0))(
  ( (tuple2!23403 (_1!11712 (_ BitVec 64)) (_2!11712 V!53193)) )
))
(declare-datatypes ((List!30536 0))(
  ( (Nil!30533) (Cons!30532 (h!31741 tuple2!23402) (t!44324 List!30536)) )
))
(declare-datatypes ((ListLongMap!21059 0))(
  ( (ListLongMap!21060 (toList!10545 List!30536)) )
))
(declare-fun contains!8628 (ListLongMap!21059 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5430 (array!88987 array!88989 (_ BitVec 32) (_ BitVec 32) V!53193 V!53193 (_ BitVec 32) Int) ListLongMap!21059)

(assert (=> b!1321473 (= res!877116 (contains!8628 (getCurrentListMap!5430 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321474 () Bool)

(declare-fun res!877113 () Bool)

(assert (=> b!1321474 (=> (not res!877113) (not e!753659))))

(declare-datatypes ((List!30537 0))(
  ( (Nil!30534) (Cons!30533 (h!31742 (_ BitVec 64)) (t!44325 List!30537)) )
))
(declare-fun arrayNoDuplicates!0 (array!88987 (_ BitVec 32) List!30537) Bool)

(assert (=> b!1321474 (= res!877113 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30534))))

(declare-fun b!1321475 () Bool)

(declare-fun e!753657 () Bool)

(assert (=> b!1321475 (= e!753657 (and e!753660 mapRes!55748))))

(declare-fun condMapEmpty!55748 () Bool)

(declare-fun mapDefault!55748 () ValueCell!17135)

(assert (=> b!1321475 (= condMapEmpty!55748 (= (arr!42969 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17135)) mapDefault!55748)))))

(declare-fun res!877117 () Bool)

(assert (=> start!111590 (=> (not res!877117) (not e!753659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111590 (= res!877117 (validMask!0 mask!2019))))

(assert (=> start!111590 e!753659))

(declare-fun array_inv!32625 (array!88987) Bool)

(assert (=> start!111590 (array_inv!32625 _keys!1609)))

(assert (=> start!111590 true))

(assert (=> start!111590 tp_is_empty!36067))

(declare-fun array_inv!32626 (array!88989) Bool)

(assert (=> start!111590 (and (array_inv!32626 _values!1337) e!753657)))

(assert (=> start!111590 tp!106218))

(declare-fun b!1321476 () Bool)

(assert (=> b!1321476 (= e!753659 (not true))))

(declare-fun lt!587341 () ListLongMap!21059)

(assert (=> b!1321476 (contains!8628 lt!587341 k0!1164)))

(declare-fun lt!587343 () V!53193)

(declare-datatypes ((Unit!43359 0))(
  ( (Unit!43360) )
))
(declare-fun lt!587337 () Unit!43359)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!153 ((_ BitVec 64) (_ BitVec 64) V!53193 ListLongMap!21059) Unit!43359)

(assert (=> b!1321476 (= lt!587337 (lemmaInListMapAfterAddingDiffThenInBefore!153 k0!1164 (select (arr!42968 _keys!1609) from!2000) lt!587343 lt!587341))))

(declare-fun lt!587342 () ListLongMap!21059)

(assert (=> b!1321476 (contains!8628 lt!587342 k0!1164)))

(declare-fun lt!587339 () Unit!43359)

(assert (=> b!1321476 (= lt!587339 (lemmaInListMapAfterAddingDiffThenInBefore!153 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587342))))

(declare-fun lt!587340 () ListLongMap!21059)

(assert (=> b!1321476 (contains!8628 lt!587340 k0!1164)))

(declare-fun lt!587338 () Unit!43359)

(assert (=> b!1321476 (= lt!587338 (lemmaInListMapAfterAddingDiffThenInBefore!153 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587340))))

(declare-fun +!4588 (ListLongMap!21059 tuple2!23402) ListLongMap!21059)

(assert (=> b!1321476 (= lt!587340 (+!4588 lt!587342 (tuple2!23403 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321476 (= lt!587342 (+!4588 lt!587341 (tuple2!23403 (select (arr!42968 _keys!1609) from!2000) lt!587343)))))

(declare-fun get!21629 (ValueCell!17135 V!53193) V!53193)

(declare-fun dynLambda!3518 (Int (_ BitVec 64)) V!53193)

(assert (=> b!1321476 (= lt!587343 (get!21629 (select (arr!42969 _values!1337) from!2000) (dynLambda!3518 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6221 (array!88987 array!88989 (_ BitVec 32) (_ BitVec 32) V!53193 V!53193 (_ BitVec 32) Int) ListLongMap!21059)

(assert (=> b!1321476 (= lt!587341 (getCurrentListMapNoExtraKeys!6221 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321477 () Bool)

(declare-fun res!877112 () Bool)

(assert (=> b!1321477 (=> (not res!877112) (not e!753659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321477 (= res!877112 (validKeyInArray!0 (select (arr!42968 _keys!1609) from!2000)))))

(declare-fun b!1321478 () Bool)

(declare-fun res!877114 () Bool)

(assert (=> b!1321478 (=> (not res!877114) (not e!753659))))

(assert (=> b!1321478 (= res!877114 (and (= (size!43521 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43520 _keys!1609) (size!43521 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321479 () Bool)

(declare-fun res!877119 () Bool)

(assert (=> b!1321479 (=> (not res!877119) (not e!753659))))

(assert (=> b!1321479 (= res!877119 (not (= (select (arr!42968 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321480 () Bool)

(assert (=> b!1321480 (= e!753661 tp_is_empty!36067)))

(assert (= (and start!111590 res!877117) b!1321478))

(assert (= (and b!1321478 res!877114) b!1321471))

(assert (= (and b!1321471 res!877115) b!1321474))

(assert (= (and b!1321474 res!877113) b!1321470))

(assert (= (and b!1321470 res!877118) b!1321473))

(assert (= (and b!1321473 res!877116) b!1321479))

(assert (= (and b!1321479 res!877119) b!1321477))

(assert (= (and b!1321477 res!877112) b!1321476))

(assert (= (and b!1321475 condMapEmpty!55748) mapIsEmpty!55748))

(assert (= (and b!1321475 (not condMapEmpty!55748)) mapNonEmpty!55748))

(get-info :version)

(assert (= (and mapNonEmpty!55748 ((_ is ValueCellFull!17135) mapValue!55748)) b!1321480))

(assert (= (and b!1321475 ((_ is ValueCellFull!17135) mapDefault!55748)) b!1321472))

(assert (= start!111590 b!1321475))

(declare-fun b_lambda!23563 () Bool)

(assert (=> (not b_lambda!23563) (not b!1321476)))

(declare-fun t!44323 () Bool)

(declare-fun tb!11591 () Bool)

(assert (=> (and start!111590 (= defaultEntry!1340 defaultEntry!1340) t!44323) tb!11591))

(declare-fun result!24245 () Bool)

(assert (=> tb!11591 (= result!24245 tp_is_empty!36067)))

(assert (=> b!1321476 t!44323))

(declare-fun b_and!48637 () Bool)

(assert (= b_and!48635 (and (=> t!44323 result!24245) b_and!48637)))

(declare-fun m!1208979 () Bool)

(assert (=> start!111590 m!1208979))

(declare-fun m!1208981 () Bool)

(assert (=> start!111590 m!1208981))

(declare-fun m!1208983 () Bool)

(assert (=> start!111590 m!1208983))

(declare-fun m!1208985 () Bool)

(assert (=> b!1321474 m!1208985))

(declare-fun m!1208987 () Bool)

(assert (=> b!1321479 m!1208987))

(declare-fun m!1208989 () Bool)

(assert (=> b!1321473 m!1208989))

(assert (=> b!1321473 m!1208989))

(declare-fun m!1208991 () Bool)

(assert (=> b!1321473 m!1208991))

(assert (=> b!1321477 m!1208987))

(assert (=> b!1321477 m!1208987))

(declare-fun m!1208993 () Bool)

(assert (=> b!1321477 m!1208993))

(declare-fun m!1208995 () Bool)

(assert (=> b!1321476 m!1208995))

(declare-fun m!1208997 () Bool)

(assert (=> b!1321476 m!1208997))

(declare-fun m!1208999 () Bool)

(assert (=> b!1321476 m!1208999))

(declare-fun m!1209001 () Bool)

(assert (=> b!1321476 m!1209001))

(declare-fun m!1209003 () Bool)

(assert (=> b!1321476 m!1209003))

(declare-fun m!1209005 () Bool)

(assert (=> b!1321476 m!1209005))

(declare-fun m!1209007 () Bool)

(assert (=> b!1321476 m!1209007))

(assert (=> b!1321476 m!1209007))

(assert (=> b!1321476 m!1208999))

(declare-fun m!1209009 () Bool)

(assert (=> b!1321476 m!1209009))

(assert (=> b!1321476 m!1208987))

(declare-fun m!1209011 () Bool)

(assert (=> b!1321476 m!1209011))

(declare-fun m!1209013 () Bool)

(assert (=> b!1321476 m!1209013))

(declare-fun m!1209015 () Bool)

(assert (=> b!1321476 m!1209015))

(assert (=> b!1321476 m!1208987))

(declare-fun m!1209017 () Bool)

(assert (=> b!1321476 m!1209017))

(declare-fun m!1209019 () Bool)

(assert (=> mapNonEmpty!55748 m!1209019))

(declare-fun m!1209021 () Bool)

(assert (=> b!1321471 m!1209021))

(check-sat (not b!1321474) b_and!48637 (not b_next!30247) (not start!111590) (not b!1321477) tp_is_empty!36067 (not b!1321476) (not mapNonEmpty!55748) (not b_lambda!23563) (not b!1321473) (not b!1321471))
(check-sat b_and!48637 (not b_next!30247))
