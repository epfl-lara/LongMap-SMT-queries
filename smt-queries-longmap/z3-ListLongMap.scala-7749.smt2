; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97474 () Bool)

(assert start!97474)

(declare-fun b!1107982 () Bool)

(declare-fun res!739055 () Bool)

(declare-fun e!632329 () Bool)

(assert (=> b!1107982 (=> (not res!739055) (not e!632329))))

(declare-datatypes ((array!71891 0))(
  ( (array!71892 (arr!34592 (Array (_ BitVec 32) (_ BitVec 64))) (size!35129 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71891)

(declare-datatypes ((List!24120 0))(
  ( (Nil!24117) (Cons!24116 (h!25334 (_ BitVec 64)) (t!34377 List!24120)) )
))
(declare-fun arrayNoDuplicates!0 (array!71891 (_ BitVec 32) List!24120) Bool)

(assert (=> b!1107982 (= res!739055 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24117))))

(declare-fun b!1107983 () Bool)

(declare-fun res!739058 () Bool)

(assert (=> b!1107983 (=> (not res!739058) (not e!632329))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1107983 (= res!739058 (= (select (arr!34592 _keys!1208) i!673) k0!934))))

(declare-fun b!1107984 () Bool)

(declare-fun e!632333 () Bool)

(assert (=> b!1107984 (= e!632333 (not true))))

(declare-fun arrayContainsKey!0 (array!71891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107984 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36307 0))(
  ( (Unit!36308) )
))
(declare-fun lt!496008 () Unit!36307)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71891 (_ BitVec 64) (_ BitVec 32)) Unit!36307)

(assert (=> b!1107984 (= lt!496008 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107985 () Bool)

(declare-fun e!632332 () Bool)

(declare-fun tp_is_empty!27469 () Bool)

(assert (=> b!1107985 (= e!632332 tp_is_empty!27469)))

(declare-fun b!1107986 () Bool)

(declare-fun res!739057 () Bool)

(assert (=> b!1107986 (=> (not res!739057) (not e!632329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107986 (= res!739057 (validKeyInArray!0 k0!934))))

(declare-fun b!1107987 () Bool)

(declare-fun res!739056 () Bool)

(assert (=> b!1107987 (=> (not res!739056) (not e!632333))))

(declare-fun lt!496009 () array!71891)

(assert (=> b!1107987 (= res!739056 (arrayNoDuplicates!0 lt!496009 #b00000000000000000000000000000000 Nil!24117))))

(declare-fun mapIsEmpty!43021 () Bool)

(declare-fun mapRes!43021 () Bool)

(assert (=> mapIsEmpty!43021 mapRes!43021))

(declare-fun b!1107988 () Bool)

(declare-fun e!632334 () Bool)

(assert (=> b!1107988 (= e!632334 (and e!632332 mapRes!43021))))

(declare-fun condMapEmpty!43021 () Bool)

(declare-datatypes ((V!41753 0))(
  ( (V!41754 (val!13791 Int)) )
))
(declare-datatypes ((ValueCell!13025 0))(
  ( (ValueCellFull!13025 (v!16420 V!41753)) (EmptyCell!13025) )
))
(declare-datatypes ((array!71893 0))(
  ( (array!71894 (arr!34593 (Array (_ BitVec 32) ValueCell!13025)) (size!35130 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71893)

(declare-fun mapDefault!43021 () ValueCell!13025)

(assert (=> b!1107988 (= condMapEmpty!43021 (= (arr!34593 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13025)) mapDefault!43021)))))

(declare-fun res!739060 () Bool)

(assert (=> start!97474 (=> (not res!739060) (not e!632329))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97474 (= res!739060 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35129 _keys!1208))))))

(assert (=> start!97474 e!632329))

(declare-fun array_inv!26654 (array!71891) Bool)

(assert (=> start!97474 (array_inv!26654 _keys!1208)))

(assert (=> start!97474 true))

(declare-fun array_inv!26655 (array!71893) Bool)

(assert (=> start!97474 (and (array_inv!26655 _values!996) e!632334)))

(declare-fun b!1107989 () Bool)

(declare-fun res!739052 () Bool)

(assert (=> b!1107989 (=> (not res!739052) (not e!632329))))

(assert (=> b!1107989 (= res!739052 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35129 _keys!1208))))))

(declare-fun mapNonEmpty!43021 () Bool)

(declare-fun tp!81941 () Bool)

(declare-fun e!632330 () Bool)

(assert (=> mapNonEmpty!43021 (= mapRes!43021 (and tp!81941 e!632330))))

(declare-fun mapRest!43021 () (Array (_ BitVec 32) ValueCell!13025))

(declare-fun mapValue!43021 () ValueCell!13025)

(declare-fun mapKey!43021 () (_ BitVec 32))

(assert (=> mapNonEmpty!43021 (= (arr!34593 _values!996) (store mapRest!43021 mapKey!43021 mapValue!43021))))

(declare-fun b!1107990 () Bool)

(assert (=> b!1107990 (= e!632329 e!632333)))

(declare-fun res!739059 () Bool)

(assert (=> b!1107990 (=> (not res!739059) (not e!632333))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71891 (_ BitVec 32)) Bool)

(assert (=> b!1107990 (= res!739059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496009 mask!1564))))

(assert (=> b!1107990 (= lt!496009 (array!71892 (store (arr!34592 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35129 _keys!1208)))))

(declare-fun b!1107991 () Bool)

(declare-fun res!739053 () Bool)

(assert (=> b!1107991 (=> (not res!739053) (not e!632329))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1107991 (= res!739053 (and (= (size!35130 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35129 _keys!1208) (size!35130 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107992 () Bool)

(declare-fun res!739051 () Bool)

(assert (=> b!1107992 (=> (not res!739051) (not e!632329))))

(assert (=> b!1107992 (= res!739051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107993 () Bool)

(assert (=> b!1107993 (= e!632330 tp_is_empty!27469)))

(declare-fun b!1107994 () Bool)

(declare-fun res!739054 () Bool)

(assert (=> b!1107994 (=> (not res!739054) (not e!632329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107994 (= res!739054 (validMask!0 mask!1564))))

(assert (= (and start!97474 res!739060) b!1107994))

(assert (= (and b!1107994 res!739054) b!1107991))

(assert (= (and b!1107991 res!739053) b!1107992))

(assert (= (and b!1107992 res!739051) b!1107982))

(assert (= (and b!1107982 res!739055) b!1107989))

(assert (= (and b!1107989 res!739052) b!1107986))

(assert (= (and b!1107986 res!739057) b!1107983))

(assert (= (and b!1107983 res!739058) b!1107990))

(assert (= (and b!1107990 res!739059) b!1107987))

(assert (= (and b!1107987 res!739056) b!1107984))

(assert (= (and b!1107988 condMapEmpty!43021) mapIsEmpty!43021))

(assert (= (and b!1107988 (not condMapEmpty!43021)) mapNonEmpty!43021))

(get-info :version)

(assert (= (and mapNonEmpty!43021 ((_ is ValueCellFull!13025) mapValue!43021)) b!1107993))

(assert (= (and b!1107988 ((_ is ValueCellFull!13025) mapDefault!43021)) b!1107985))

(assert (= start!97474 b!1107988))

(declare-fun m!1027317 () Bool)

(assert (=> b!1107992 m!1027317))

(declare-fun m!1027319 () Bool)

(assert (=> b!1107984 m!1027319))

(declare-fun m!1027321 () Bool)

(assert (=> b!1107984 m!1027321))

(declare-fun m!1027323 () Bool)

(assert (=> start!97474 m!1027323))

(declare-fun m!1027325 () Bool)

(assert (=> start!97474 m!1027325))

(declare-fun m!1027327 () Bool)

(assert (=> b!1107994 m!1027327))

(declare-fun m!1027329 () Bool)

(assert (=> b!1107983 m!1027329))

(declare-fun m!1027331 () Bool)

(assert (=> b!1107986 m!1027331))

(declare-fun m!1027333 () Bool)

(assert (=> b!1107982 m!1027333))

(declare-fun m!1027335 () Bool)

(assert (=> b!1107990 m!1027335))

(declare-fun m!1027337 () Bool)

(assert (=> b!1107990 m!1027337))

(declare-fun m!1027339 () Bool)

(assert (=> mapNonEmpty!43021 m!1027339))

(declare-fun m!1027341 () Bool)

(assert (=> b!1107987 m!1027341))

(check-sat (not b!1107986) (not mapNonEmpty!43021) (not b!1107992) (not b!1107982) tp_is_empty!27469 (not b!1107990) (not start!97474) (not b!1107987) (not b!1107984) (not b!1107994))
(check-sat)
