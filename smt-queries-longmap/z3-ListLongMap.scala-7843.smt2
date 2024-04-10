; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97804 () Bool)

(assert start!97804)

(declare-fun b_free!23505 () Bool)

(declare-fun b_next!23505 () Bool)

(assert (=> start!97804 (= b_free!23505 (not b_next!23505))))

(declare-fun tp!83218 () Bool)

(declare-fun b_and!37793 () Bool)

(assert (=> start!97804 (= tp!83218 b_and!37793)))

(declare-fun b!1119034 () Bool)

(declare-fun res!747450 () Bool)

(declare-fun e!637338 () Bool)

(assert (=> b!1119034 (=> (not res!747450) (not e!637338))))

(declare-datatypes ((array!72957 0))(
  ( (array!72958 (arr!35131 (Array (_ BitVec 32) (_ BitVec 64))) (size!35667 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72957)

(declare-datatypes ((List!24442 0))(
  ( (Nil!24439) (Cons!24438 (h!25647 (_ BitVec 64)) (t!34939 List!24442)) )
))
(declare-fun arrayNoDuplicates!0 (array!72957 (_ BitVec 32) List!24442) Bool)

(assert (=> b!1119034 (= res!747450 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24439))))

(declare-fun mapNonEmpty!43870 () Bool)

(declare-fun mapRes!43870 () Bool)

(declare-fun tp!83219 () Bool)

(declare-fun e!637342 () Bool)

(assert (=> mapNonEmpty!43870 (= mapRes!43870 (and tp!83219 e!637342))))

(declare-datatypes ((V!42507 0))(
  ( (V!42508 (val!14074 Int)) )
))
(declare-datatypes ((ValueCell!13308 0))(
  ( (ValueCellFull!13308 (v!16707 V!42507)) (EmptyCell!13308) )
))
(declare-fun mapValue!43870 () ValueCell!13308)

(declare-fun mapRest!43870 () (Array (_ BitVec 32) ValueCell!13308))

(declare-datatypes ((array!72959 0))(
  ( (array!72960 (arr!35132 (Array (_ BitVec 32) ValueCell!13308)) (size!35668 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72959)

(declare-fun mapKey!43870 () (_ BitVec 32))

(assert (=> mapNonEmpty!43870 (= (arr!35132 _values!996) (store mapRest!43870 mapKey!43870 mapValue!43870))))

(declare-fun b!1119035 () Bool)

(declare-fun res!747456 () Bool)

(assert (=> b!1119035 (=> (not res!747456) (not e!637338))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72957 (_ BitVec 32)) Bool)

(assert (=> b!1119035 (= res!747456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119036 () Bool)

(declare-fun res!747449 () Bool)

(declare-fun e!637341 () Bool)

(assert (=> b!1119036 (=> (not res!747449) (not e!637341))))

(declare-fun lt!497643 () array!72957)

(assert (=> b!1119036 (= res!747449 (arrayNoDuplicates!0 lt!497643 #b00000000000000000000000000000000 Nil!24439))))

(declare-fun b!1119037 () Bool)

(assert (=> b!1119037 (= e!637338 e!637341)))

(declare-fun res!747447 () Bool)

(assert (=> b!1119037 (=> (not res!747447) (not e!637341))))

(assert (=> b!1119037 (= res!747447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497643 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119037 (= lt!497643 (array!72958 (store (arr!35131 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35667 _keys!1208)))))

(declare-fun b!1119038 () Bool)

(declare-fun e!637343 () Bool)

(declare-fun e!637344 () Bool)

(assert (=> b!1119038 (= e!637343 (and e!637344 mapRes!43870))))

(declare-fun condMapEmpty!43870 () Bool)

(declare-fun mapDefault!43870 () ValueCell!13308)

(assert (=> b!1119038 (= condMapEmpty!43870 (= (arr!35132 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13308)) mapDefault!43870)))))

(declare-fun b!1119039 () Bool)

(declare-fun tp_is_empty!28035 () Bool)

(assert (=> b!1119039 (= e!637342 tp_is_empty!28035)))

(declare-fun b!1119040 () Bool)

(declare-fun res!747452 () Bool)

(assert (=> b!1119040 (=> (not res!747452) (not e!637338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119040 (= res!747452 (validMask!0 mask!1564))))

(declare-fun b!1119041 () Bool)

(declare-fun res!747457 () Bool)

(assert (=> b!1119041 (=> (not res!747457) (not e!637338))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1119041 (= res!747457 (and (= (size!35668 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35667 _keys!1208) (size!35668 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43870 () Bool)

(assert (=> mapIsEmpty!43870 mapRes!43870))

(declare-fun b!1119042 () Bool)

(declare-fun res!747451 () Bool)

(assert (=> b!1119042 (=> (not res!747451) (not e!637338))))

(assert (=> b!1119042 (= res!747451 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35667 _keys!1208))))))

(declare-fun b!1119043 () Bool)

(declare-fun e!637340 () Bool)

(assert (=> b!1119043 (= e!637340 true)))

(declare-fun zeroValue!944 () V!42507)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42507)

(declare-datatypes ((tuple2!17656 0))(
  ( (tuple2!17657 (_1!8839 (_ BitVec 64)) (_2!8839 V!42507)) )
))
(declare-datatypes ((List!24443 0))(
  ( (Nil!24440) (Cons!24439 (h!25648 tuple2!17656) (t!34940 List!24443)) )
))
(declare-datatypes ((ListLongMap!15625 0))(
  ( (ListLongMap!15626 (toList!7828 List!24443)) )
))
(declare-fun lt!497644 () ListLongMap!15625)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4318 (array!72957 array!72959 (_ BitVec 32) (_ BitVec 32) V!42507 V!42507 (_ BitVec 32) Int) ListLongMap!15625)

(declare-fun dynLambda!2422 (Int (_ BitVec 64)) V!42507)

(assert (=> b!1119043 (= lt!497644 (getCurrentListMapNoExtraKeys!4318 lt!497643 (array!72960 (store (arr!35132 _values!996) i!673 (ValueCellFull!13308 (dynLambda!2422 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35668 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497645 () ListLongMap!15625)

(assert (=> b!1119043 (= lt!497645 (getCurrentListMapNoExtraKeys!4318 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119045 () Bool)

(assert (=> b!1119045 (= e!637341 (not e!637340))))

(declare-fun res!747448 () Bool)

(assert (=> b!1119045 (=> res!747448 e!637340)))

(assert (=> b!1119045 (= res!747448 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119045 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36726 0))(
  ( (Unit!36727) )
))
(declare-fun lt!497642 () Unit!36726)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72957 (_ BitVec 64) (_ BitVec 32)) Unit!36726)

(assert (=> b!1119045 (= lt!497642 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119046 () Bool)

(declare-fun res!747454 () Bool)

(assert (=> b!1119046 (=> (not res!747454) (not e!637338))))

(assert (=> b!1119046 (= res!747454 (= (select (arr!35131 _keys!1208) i!673) k0!934))))

(declare-fun b!1119047 () Bool)

(declare-fun res!747455 () Bool)

(assert (=> b!1119047 (=> (not res!747455) (not e!637338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119047 (= res!747455 (validKeyInArray!0 k0!934))))

(declare-fun b!1119044 () Bool)

(assert (=> b!1119044 (= e!637344 tp_is_empty!28035)))

(declare-fun res!747453 () Bool)

(assert (=> start!97804 (=> (not res!747453) (not e!637338))))

(assert (=> start!97804 (= res!747453 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35667 _keys!1208))))))

(assert (=> start!97804 e!637338))

(assert (=> start!97804 tp_is_empty!28035))

(declare-fun array_inv!26994 (array!72957) Bool)

(assert (=> start!97804 (array_inv!26994 _keys!1208)))

(assert (=> start!97804 true))

(assert (=> start!97804 tp!83218))

(declare-fun array_inv!26995 (array!72959) Bool)

(assert (=> start!97804 (and (array_inv!26995 _values!996) e!637343)))

(assert (= (and start!97804 res!747453) b!1119040))

(assert (= (and b!1119040 res!747452) b!1119041))

(assert (= (and b!1119041 res!747457) b!1119035))

(assert (= (and b!1119035 res!747456) b!1119034))

(assert (= (and b!1119034 res!747450) b!1119042))

(assert (= (and b!1119042 res!747451) b!1119047))

(assert (= (and b!1119047 res!747455) b!1119046))

(assert (= (and b!1119046 res!747454) b!1119037))

(assert (= (and b!1119037 res!747447) b!1119036))

(assert (= (and b!1119036 res!747449) b!1119045))

(assert (= (and b!1119045 (not res!747448)) b!1119043))

(assert (= (and b!1119038 condMapEmpty!43870) mapIsEmpty!43870))

(assert (= (and b!1119038 (not condMapEmpty!43870)) mapNonEmpty!43870))

(get-info :version)

(assert (= (and mapNonEmpty!43870 ((_ is ValueCellFull!13308) mapValue!43870)) b!1119039))

(assert (= (and b!1119038 ((_ is ValueCellFull!13308) mapDefault!43870)) b!1119044))

(assert (= start!97804 b!1119038))

(declare-fun b_lambda!18475 () Bool)

(assert (=> (not b_lambda!18475) (not b!1119043)))

(declare-fun t!34938 () Bool)

(declare-fun tb!8317 () Bool)

(assert (=> (and start!97804 (= defaultEntry!1004 defaultEntry!1004) t!34938) tb!8317))

(declare-fun result!17195 () Bool)

(assert (=> tb!8317 (= result!17195 tp_is_empty!28035)))

(assert (=> b!1119043 t!34938))

(declare-fun b_and!37795 () Bool)

(assert (= b_and!37793 (and (=> t!34938 result!17195) b_and!37795)))

(declare-fun m!1034409 () Bool)

(assert (=> start!97804 m!1034409))

(declare-fun m!1034411 () Bool)

(assert (=> start!97804 m!1034411))

(declare-fun m!1034413 () Bool)

(assert (=> b!1119045 m!1034413))

(declare-fun m!1034415 () Bool)

(assert (=> b!1119045 m!1034415))

(declare-fun m!1034417 () Bool)

(assert (=> mapNonEmpty!43870 m!1034417))

(declare-fun m!1034419 () Bool)

(assert (=> b!1119043 m!1034419))

(declare-fun m!1034421 () Bool)

(assert (=> b!1119043 m!1034421))

(declare-fun m!1034423 () Bool)

(assert (=> b!1119043 m!1034423))

(declare-fun m!1034425 () Bool)

(assert (=> b!1119043 m!1034425))

(declare-fun m!1034427 () Bool)

(assert (=> b!1119036 m!1034427))

(declare-fun m!1034429 () Bool)

(assert (=> b!1119037 m!1034429))

(declare-fun m!1034431 () Bool)

(assert (=> b!1119037 m!1034431))

(declare-fun m!1034433 () Bool)

(assert (=> b!1119046 m!1034433))

(declare-fun m!1034435 () Bool)

(assert (=> b!1119034 m!1034435))

(declare-fun m!1034437 () Bool)

(assert (=> b!1119040 m!1034437))

(declare-fun m!1034439 () Bool)

(assert (=> b!1119047 m!1034439))

(declare-fun m!1034441 () Bool)

(assert (=> b!1119035 m!1034441))

(check-sat (not b!1119045) (not b_next!23505) (not b!1119034) (not b!1119037) (not b!1119035) (not b!1119047) (not b!1119043) (not start!97804) (not mapNonEmpty!43870) (not b_lambda!18475) (not b!1119036) (not b!1119040) b_and!37795 tp_is_empty!28035)
(check-sat b_and!37795 (not b_next!23505))
