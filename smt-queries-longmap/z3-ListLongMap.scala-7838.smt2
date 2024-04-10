; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97774 () Bool)

(assert start!97774)

(declare-fun b_free!23475 () Bool)

(declare-fun b_next!23475 () Bool)

(assert (=> start!97774 (= b_free!23475 (not b_next!23475))))

(declare-fun tp!83128 () Bool)

(declare-fun b_and!37749 () Bool)

(assert (=> start!97774 (= tp!83128 b_and!37749)))

(declare-fun b!1118390 () Bool)

(declare-fun res!746955 () Bool)

(declare-fun e!637029 () Bool)

(assert (=> b!1118390 (=> (not res!746955) (not e!637029))))

(declare-datatypes ((array!72901 0))(
  ( (array!72902 (arr!35103 (Array (_ BitVec 32) (_ BitVec 64))) (size!35639 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72901)

(declare-datatypes ((List!24418 0))(
  ( (Nil!24415) (Cons!24414 (h!25623 (_ BitVec 64)) (t!34899 List!24418)) )
))
(declare-fun arrayNoDuplicates!0 (array!72901 (_ BitVec 32) List!24418) Bool)

(assert (=> b!1118390 (= res!746955 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24415))))

(declare-fun b!1118391 () Bool)

(declare-fun res!746952 () Bool)

(assert (=> b!1118391 (=> (not res!746952) (not e!637029))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42467 0))(
  ( (V!42468 (val!14059 Int)) )
))
(declare-datatypes ((ValueCell!13293 0))(
  ( (ValueCellFull!13293 (v!16692 V!42467)) (EmptyCell!13293) )
))
(declare-datatypes ((array!72903 0))(
  ( (array!72904 (arr!35104 (Array (_ BitVec 32) ValueCell!13293)) (size!35640 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72903)

(assert (=> b!1118391 (= res!746952 (and (= (size!35640 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35639 _keys!1208) (size!35640 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118392 () Bool)

(declare-fun e!637025 () Bool)

(assert (=> b!1118392 (= e!637029 e!637025)))

(declare-fun res!746959 () Bool)

(assert (=> b!1118392 (=> (not res!746959) (not e!637025))))

(declare-fun lt!497484 () array!72901)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72901 (_ BitVec 32)) Bool)

(assert (=> b!1118392 (= res!746959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497484 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118392 (= lt!497484 (array!72902 (store (arr!35103 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35639 _keys!1208)))))

(declare-fun b!1118393 () Bool)

(declare-fun res!746961 () Bool)

(assert (=> b!1118393 (=> (not res!746961) (not e!637029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118393 (= res!746961 (validMask!0 mask!1564))))

(declare-fun b!1118394 () Bool)

(declare-fun e!637028 () Bool)

(declare-fun e!637027 () Bool)

(declare-fun mapRes!43825 () Bool)

(assert (=> b!1118394 (= e!637028 (and e!637027 mapRes!43825))))

(declare-fun condMapEmpty!43825 () Bool)

(declare-fun mapDefault!43825 () ValueCell!13293)

(assert (=> b!1118394 (= condMapEmpty!43825 (= (arr!35104 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13293)) mapDefault!43825)))))

(declare-fun b!1118396 () Bool)

(declare-fun res!746956 () Bool)

(assert (=> b!1118396 (=> (not res!746956) (not e!637025))))

(assert (=> b!1118396 (= res!746956 (arrayNoDuplicates!0 lt!497484 #b00000000000000000000000000000000 Nil!24415))))

(declare-fun b!1118397 () Bool)

(declare-fun res!746954 () Bool)

(assert (=> b!1118397 (=> (not res!746954) (not e!637029))))

(assert (=> b!1118397 (= res!746954 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35639 _keys!1208))))))

(declare-fun mapIsEmpty!43825 () Bool)

(assert (=> mapIsEmpty!43825 mapRes!43825))

(declare-fun b!1118398 () Bool)

(declare-fun res!746962 () Bool)

(assert (=> b!1118398 (=> (not res!746962) (not e!637029))))

(assert (=> b!1118398 (= res!746962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43825 () Bool)

(declare-fun tp!83129 () Bool)

(declare-fun e!637023 () Bool)

(assert (=> mapNonEmpty!43825 (= mapRes!43825 (and tp!83129 e!637023))))

(declare-fun mapKey!43825 () (_ BitVec 32))

(declare-fun mapValue!43825 () ValueCell!13293)

(declare-fun mapRest!43825 () (Array (_ BitVec 32) ValueCell!13293))

(assert (=> mapNonEmpty!43825 (= (arr!35104 _values!996) (store mapRest!43825 mapKey!43825 mapValue!43825))))

(declare-fun b!1118399 () Bool)

(declare-fun res!746953 () Bool)

(assert (=> b!1118399 (=> (not res!746953) (not e!637029))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1118399 (= res!746953 (= (select (arr!35103 _keys!1208) i!673) k0!934))))

(declare-fun b!1118395 () Bool)

(declare-fun res!746958 () Bool)

(assert (=> b!1118395 (=> (not res!746958) (not e!637029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118395 (= res!746958 (validKeyInArray!0 k0!934))))

(declare-fun res!746960 () Bool)

(assert (=> start!97774 (=> (not res!746960) (not e!637029))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97774 (= res!746960 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35639 _keys!1208))))))

(assert (=> start!97774 e!637029))

(declare-fun tp_is_empty!28005 () Bool)

(assert (=> start!97774 tp_is_empty!28005))

(declare-fun array_inv!26970 (array!72901) Bool)

(assert (=> start!97774 (array_inv!26970 _keys!1208)))

(assert (=> start!97774 true))

(assert (=> start!97774 tp!83128))

(declare-fun array_inv!26971 (array!72903) Bool)

(assert (=> start!97774 (and (array_inv!26971 _values!996) e!637028)))

(declare-fun b!1118400 () Bool)

(assert (=> b!1118400 (= e!637027 tp_is_empty!28005)))

(declare-fun b!1118401 () Bool)

(assert (=> b!1118401 (= e!637023 tp_is_empty!28005)))

(declare-fun b!1118402 () Bool)

(declare-fun e!637024 () Bool)

(assert (=> b!1118402 (= e!637025 (not e!637024))))

(declare-fun res!746957 () Bool)

(assert (=> b!1118402 (=> res!746957 e!637024)))

(assert (=> b!1118402 (= res!746957 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118402 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36706 0))(
  ( (Unit!36707) )
))
(declare-fun lt!497485 () Unit!36706)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72901 (_ BitVec 64) (_ BitVec 32)) Unit!36706)

(assert (=> b!1118402 (= lt!497485 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118403 () Bool)

(assert (=> b!1118403 (= e!637024 true)))

(declare-fun zeroValue!944 () V!42467)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17632 0))(
  ( (tuple2!17633 (_1!8827 (_ BitVec 64)) (_2!8827 V!42467)) )
))
(declare-datatypes ((List!24419 0))(
  ( (Nil!24416) (Cons!24415 (h!25624 tuple2!17632) (t!34900 List!24419)) )
))
(declare-datatypes ((ListLongMap!15601 0))(
  ( (ListLongMap!15602 (toList!7816 List!24419)) )
))
(declare-fun lt!497486 () ListLongMap!15601)

(declare-fun minValue!944 () V!42467)

(declare-fun getCurrentListMapNoExtraKeys!4306 (array!72901 array!72903 (_ BitVec 32) (_ BitVec 32) V!42467 V!42467 (_ BitVec 32) Int) ListLongMap!15601)

(assert (=> b!1118403 (= lt!497486 (getCurrentListMapNoExtraKeys!4306 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!97774 res!746960) b!1118393))

(assert (= (and b!1118393 res!746961) b!1118391))

(assert (= (and b!1118391 res!746952) b!1118398))

(assert (= (and b!1118398 res!746962) b!1118390))

(assert (= (and b!1118390 res!746955) b!1118397))

(assert (= (and b!1118397 res!746954) b!1118395))

(assert (= (and b!1118395 res!746958) b!1118399))

(assert (= (and b!1118399 res!746953) b!1118392))

(assert (= (and b!1118392 res!746959) b!1118396))

(assert (= (and b!1118396 res!746956) b!1118402))

(assert (= (and b!1118402 (not res!746957)) b!1118403))

(assert (= (and b!1118394 condMapEmpty!43825) mapIsEmpty!43825))

(assert (= (and b!1118394 (not condMapEmpty!43825)) mapNonEmpty!43825))

(get-info :version)

(assert (= (and mapNonEmpty!43825 ((_ is ValueCellFull!13293) mapValue!43825)) b!1118401))

(assert (= (and b!1118394 ((_ is ValueCellFull!13293) mapDefault!43825)) b!1118400))

(assert (= start!97774 b!1118394))

(declare-fun m!1033947 () Bool)

(assert (=> b!1118396 m!1033947))

(declare-fun m!1033949 () Bool)

(assert (=> b!1118402 m!1033949))

(declare-fun m!1033951 () Bool)

(assert (=> b!1118402 m!1033951))

(declare-fun m!1033953 () Bool)

(assert (=> b!1118395 m!1033953))

(declare-fun m!1033955 () Bool)

(assert (=> mapNonEmpty!43825 m!1033955))

(declare-fun m!1033957 () Bool)

(assert (=> b!1118403 m!1033957))

(declare-fun m!1033959 () Bool)

(assert (=> b!1118392 m!1033959))

(declare-fun m!1033961 () Bool)

(assert (=> b!1118392 m!1033961))

(declare-fun m!1033963 () Bool)

(assert (=> b!1118390 m!1033963))

(declare-fun m!1033965 () Bool)

(assert (=> b!1118398 m!1033965))

(declare-fun m!1033967 () Bool)

(assert (=> b!1118393 m!1033967))

(declare-fun m!1033969 () Bool)

(assert (=> start!97774 m!1033969))

(declare-fun m!1033971 () Bool)

(assert (=> start!97774 m!1033971))

(declare-fun m!1033973 () Bool)

(assert (=> b!1118399 m!1033973))

(check-sat (not b!1118390) tp_is_empty!28005 (not b!1118398) (not b!1118395) (not b_next!23475) (not b!1118402) (not b!1118392) (not b!1118403) b_and!37749 (not b!1118393) (not start!97774) (not b!1118396) (not mapNonEmpty!43825))
(check-sat b_and!37749 (not b_next!23475))
