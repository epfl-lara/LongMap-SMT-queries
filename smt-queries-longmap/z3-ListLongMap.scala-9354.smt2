; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111560 () Bool)

(assert start!111560)

(declare-fun b_free!30217 () Bool)

(declare-fun b_next!30217 () Bool)

(assert (=> start!111560 (= b_free!30217 (not b_next!30217))))

(declare-fun tp!106127 () Bool)

(declare-fun b_and!48575 () Bool)

(assert (=> start!111560 (= tp!106127 b_and!48575)))

(declare-fun b!1320945 () Bool)

(declare-fun res!876752 () Bool)

(declare-fun e!753433 () Bool)

(assert (=> b!1320945 (=> (not res!876752) (not e!753433))))

(declare-datatypes ((array!88927 0))(
  ( (array!88928 (arr!42938 (Array (_ BitVec 32) (_ BitVec 64))) (size!43490 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88927)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320945 (= res!876752 (validKeyInArray!0 (select (arr!42938 _keys!1609) from!2000)))))

(declare-fun b!1320946 () Bool)

(declare-fun e!753432 () Bool)

(declare-fun e!753435 () Bool)

(declare-fun mapRes!55703 () Bool)

(assert (=> b!1320946 (= e!753432 (and e!753435 mapRes!55703))))

(declare-fun condMapEmpty!55703 () Bool)

(declare-datatypes ((V!53153 0))(
  ( (V!53154 (val!18093 Int)) )
))
(declare-datatypes ((ValueCell!17120 0))(
  ( (ValueCellFull!17120 (v!20722 V!53153)) (EmptyCell!17120) )
))
(declare-datatypes ((array!88929 0))(
  ( (array!88930 (arr!42939 (Array (_ BitVec 32) ValueCell!17120)) (size!43491 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88929)

(declare-fun mapDefault!55703 () ValueCell!17120)

(assert (=> b!1320946 (= condMapEmpty!55703 (= (arr!42939 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17120)) mapDefault!55703)))))

(declare-fun b!1320947 () Bool)

(declare-fun res!876757 () Bool)

(assert (=> b!1320947 (=> (not res!876757) (not e!753433))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1320947 (= res!876757 (and (= (size!43491 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43490 _keys!1609) (size!43491 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320948 () Bool)

(declare-fun e!753436 () Bool)

(declare-fun tp_is_empty!36037 () Bool)

(assert (=> b!1320948 (= e!753436 tp_is_empty!36037)))

(declare-fun res!876759 () Bool)

(assert (=> start!111560 (=> (not res!876759) (not e!753433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111560 (= res!876759 (validMask!0 mask!2019))))

(assert (=> start!111560 e!753433))

(declare-fun array_inv!32601 (array!88927) Bool)

(assert (=> start!111560 (array_inv!32601 _keys!1609)))

(assert (=> start!111560 true))

(assert (=> start!111560 tp_is_empty!36037))

(declare-fun array_inv!32602 (array!88929) Bool)

(assert (=> start!111560 (and (array_inv!32602 _values!1337) e!753432)))

(assert (=> start!111560 tp!106127))

(declare-fun mapNonEmpty!55703 () Bool)

(declare-fun tp!106128 () Bool)

(assert (=> mapNonEmpty!55703 (= mapRes!55703 (and tp!106128 e!753436))))

(declare-fun mapValue!55703 () ValueCell!17120)

(declare-fun mapRest!55703 () (Array (_ BitVec 32) ValueCell!17120))

(declare-fun mapKey!55703 () (_ BitVec 32))

(assert (=> mapNonEmpty!55703 (= (arr!42939 _values!1337) (store mapRest!55703 mapKey!55703 mapValue!55703))))

(declare-fun b!1320949 () Bool)

(declare-fun res!876753 () Bool)

(assert (=> b!1320949 (=> (not res!876753) (not e!753433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88927 (_ BitVec 32)) Bool)

(assert (=> b!1320949 (= res!876753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55703 () Bool)

(assert (=> mapIsEmpty!55703 mapRes!55703))

(declare-fun b!1320950 () Bool)

(declare-fun res!876756 () Bool)

(assert (=> b!1320950 (=> (not res!876756) (not e!753433))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1320950 (= res!876756 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43490 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320951 () Bool)

(assert (=> b!1320951 (= e!753433 (not true))))

(declare-datatypes ((tuple2!23380 0))(
  ( (tuple2!23381 (_1!11701 (_ BitVec 64)) (_2!11701 V!53153)) )
))
(declare-datatypes ((List!30513 0))(
  ( (Nil!30510) (Cons!30509 (h!31718 tuple2!23380) (t!44271 List!30513)) )
))
(declare-datatypes ((ListLongMap!21037 0))(
  ( (ListLongMap!21038 (toList!10534 List!30513)) )
))
(declare-fun lt!587028 () ListLongMap!21037)

(declare-fun contains!8617 (ListLongMap!21037 (_ BitVec 64)) Bool)

(assert (=> b!1320951 (contains!8617 lt!587028 k0!1164)))

(declare-fun lt!587025 () V!53153)

(declare-datatypes ((Unit!43337 0))(
  ( (Unit!43338) )
))
(declare-fun lt!587026 () Unit!43337)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!142 ((_ BitVec 64) (_ BitVec 64) V!53153 ListLongMap!21037) Unit!43337)

(assert (=> b!1320951 (= lt!587026 (lemmaInListMapAfterAddingDiffThenInBefore!142 k0!1164 (select (arr!42938 _keys!1609) from!2000) lt!587025 lt!587028))))

(declare-fun lt!587023 () ListLongMap!21037)

(assert (=> b!1320951 (contains!8617 lt!587023 k0!1164)))

(declare-fun zeroValue!1279 () V!53153)

(declare-fun lt!587022 () Unit!43337)

(assert (=> b!1320951 (= lt!587022 (lemmaInListMapAfterAddingDiffThenInBefore!142 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587023))))

(declare-fun lt!587027 () ListLongMap!21037)

(assert (=> b!1320951 (contains!8617 lt!587027 k0!1164)))

(declare-fun minValue!1279 () V!53153)

(declare-fun lt!587024 () Unit!43337)

(assert (=> b!1320951 (= lt!587024 (lemmaInListMapAfterAddingDiffThenInBefore!142 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587027))))

(declare-fun +!4577 (ListLongMap!21037 tuple2!23380) ListLongMap!21037)

(assert (=> b!1320951 (= lt!587027 (+!4577 lt!587023 (tuple2!23381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1320951 (= lt!587023 (+!4577 lt!587028 (tuple2!23381 (select (arr!42938 _keys!1609) from!2000) lt!587025)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21608 (ValueCell!17120 V!53153) V!53153)

(declare-fun dynLambda!3507 (Int (_ BitVec 64)) V!53153)

(assert (=> b!1320951 (= lt!587025 (get!21608 (select (arr!42939 _values!1337) from!2000) (dynLambda!3507 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6210 (array!88927 array!88929 (_ BitVec 32) (_ BitVec 32) V!53153 V!53153 (_ BitVec 32) Int) ListLongMap!21037)

(assert (=> b!1320951 (= lt!587028 (getCurrentListMapNoExtraKeys!6210 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1320952 () Bool)

(assert (=> b!1320952 (= e!753435 tp_is_empty!36037)))

(declare-fun b!1320953 () Bool)

(declare-fun res!876755 () Bool)

(assert (=> b!1320953 (=> (not res!876755) (not e!753433))))

(declare-datatypes ((List!30514 0))(
  ( (Nil!30511) (Cons!30510 (h!31719 (_ BitVec 64)) (t!44272 List!30514)) )
))
(declare-fun arrayNoDuplicates!0 (array!88927 (_ BitVec 32) List!30514) Bool)

(assert (=> b!1320953 (= res!876755 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30511))))

(declare-fun b!1320954 () Bool)

(declare-fun res!876754 () Bool)

(assert (=> b!1320954 (=> (not res!876754) (not e!753433))))

(declare-fun getCurrentListMap!5420 (array!88927 array!88929 (_ BitVec 32) (_ BitVec 32) V!53153 V!53153 (_ BitVec 32) Int) ListLongMap!21037)

(assert (=> b!1320954 (= res!876754 (contains!8617 (getCurrentListMap!5420 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320955 () Bool)

(declare-fun res!876758 () Bool)

(assert (=> b!1320955 (=> (not res!876758) (not e!753433))))

(assert (=> b!1320955 (= res!876758 (not (= (select (arr!42938 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111560 res!876759) b!1320947))

(assert (= (and b!1320947 res!876757) b!1320949))

(assert (= (and b!1320949 res!876753) b!1320953))

(assert (= (and b!1320953 res!876755) b!1320950))

(assert (= (and b!1320950 res!876756) b!1320954))

(assert (= (and b!1320954 res!876754) b!1320955))

(assert (= (and b!1320955 res!876758) b!1320945))

(assert (= (and b!1320945 res!876752) b!1320951))

(assert (= (and b!1320946 condMapEmpty!55703) mapIsEmpty!55703))

(assert (= (and b!1320946 (not condMapEmpty!55703)) mapNonEmpty!55703))

(get-info :version)

(assert (= (and mapNonEmpty!55703 ((_ is ValueCellFull!17120) mapValue!55703)) b!1320948))

(assert (= (and b!1320946 ((_ is ValueCellFull!17120) mapDefault!55703)) b!1320952))

(assert (= start!111560 b!1320946))

(declare-fun b_lambda!23533 () Bool)

(assert (=> (not b_lambda!23533) (not b!1320951)))

(declare-fun t!44270 () Bool)

(declare-fun tb!11561 () Bool)

(assert (=> (and start!111560 (= defaultEntry!1340 defaultEntry!1340) t!44270) tb!11561))

(declare-fun result!24185 () Bool)

(assert (=> tb!11561 (= result!24185 tp_is_empty!36037)))

(assert (=> b!1320951 t!44270))

(declare-fun b_and!48577 () Bool)

(assert (= b_and!48575 (and (=> t!44270 result!24185) b_and!48577)))

(declare-fun m!1208319 () Bool)

(assert (=> b!1320951 m!1208319))

(declare-fun m!1208321 () Bool)

(assert (=> b!1320951 m!1208321))

(declare-fun m!1208323 () Bool)

(assert (=> b!1320951 m!1208323))

(declare-fun m!1208325 () Bool)

(assert (=> b!1320951 m!1208325))

(declare-fun m!1208327 () Bool)

(assert (=> b!1320951 m!1208327))

(declare-fun m!1208329 () Bool)

(assert (=> b!1320951 m!1208329))

(declare-fun m!1208331 () Bool)

(assert (=> b!1320951 m!1208331))

(declare-fun m!1208333 () Bool)

(assert (=> b!1320951 m!1208333))

(assert (=> b!1320951 m!1208325))

(declare-fun m!1208335 () Bool)

(assert (=> b!1320951 m!1208335))

(assert (=> b!1320951 m!1208329))

(declare-fun m!1208337 () Bool)

(assert (=> b!1320951 m!1208337))

(declare-fun m!1208339 () Bool)

(assert (=> b!1320951 m!1208339))

(assert (=> b!1320951 m!1208333))

(declare-fun m!1208341 () Bool)

(assert (=> b!1320951 m!1208341))

(declare-fun m!1208343 () Bool)

(assert (=> b!1320951 m!1208343))

(declare-fun m!1208345 () Bool)

(assert (=> mapNonEmpty!55703 m!1208345))

(declare-fun m!1208347 () Bool)

(assert (=> start!111560 m!1208347))

(declare-fun m!1208349 () Bool)

(assert (=> start!111560 m!1208349))

(declare-fun m!1208351 () Bool)

(assert (=> start!111560 m!1208351))

(assert (=> b!1320955 m!1208329))

(assert (=> b!1320945 m!1208329))

(assert (=> b!1320945 m!1208329))

(declare-fun m!1208353 () Bool)

(assert (=> b!1320945 m!1208353))

(declare-fun m!1208355 () Bool)

(assert (=> b!1320949 m!1208355))

(declare-fun m!1208357 () Bool)

(assert (=> b!1320954 m!1208357))

(assert (=> b!1320954 m!1208357))

(declare-fun m!1208359 () Bool)

(assert (=> b!1320954 m!1208359))

(declare-fun m!1208361 () Bool)

(assert (=> b!1320953 m!1208361))

(check-sat (not start!111560) (not b!1320949) tp_is_empty!36037 (not b_lambda!23533) (not b!1320954) (not b!1320951) (not b!1320945) b_and!48577 (not b!1320953) (not b_next!30217) (not mapNonEmpty!55703))
(check-sat b_and!48577 (not b_next!30217))
