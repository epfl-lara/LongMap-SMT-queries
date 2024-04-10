; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97648 () Bool)

(assert start!97648)

(declare-fun b!1115874 () Bool)

(declare-fun res!745012 () Bool)

(declare-fun e!635834 () Bool)

(assert (=> b!1115874 (=> (not res!745012) (not e!635834))))

(declare-datatypes ((array!72655 0))(
  ( (array!72656 (arr!34980 (Array (_ BitVec 32) (_ BitVec 64))) (size!35516 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72655)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42299 0))(
  ( (V!42300 (val!13996 Int)) )
))
(declare-datatypes ((ValueCell!13230 0))(
  ( (ValueCellFull!13230 (v!16629 V!42299)) (EmptyCell!13230) )
))
(declare-datatypes ((array!72657 0))(
  ( (array!72658 (arr!34981 (Array (_ BitVec 32) ValueCell!13230)) (size!35517 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72657)

(assert (=> b!1115874 (= res!745012 (and (= (size!35517 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35516 _keys!1208) (size!35517 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115875 () Bool)

(declare-fun res!745003 () Bool)

(assert (=> b!1115875 (=> (not res!745003) (not e!635834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72655 (_ BitVec 32)) Bool)

(assert (=> b!1115875 (= res!745003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115876 () Bool)

(declare-fun e!635835 () Bool)

(declare-fun tp_is_empty!27879 () Bool)

(assert (=> b!1115876 (= e!635835 tp_is_empty!27879)))

(declare-fun b!1115877 () Bool)

(declare-fun res!745007 () Bool)

(assert (=> b!1115877 (=> (not res!745007) (not e!635834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115877 (= res!745007 (validMask!0 mask!1564))))

(declare-fun b!1115878 () Bool)

(declare-fun res!745004 () Bool)

(declare-fun e!635830 () Bool)

(assert (=> b!1115878 (=> (not res!745004) (not e!635830))))

(declare-fun lt!497048 () array!72655)

(declare-datatypes ((List!24356 0))(
  ( (Nil!24353) (Cons!24352 (h!25561 (_ BitVec 64)) (t!34837 List!24356)) )
))
(declare-fun arrayNoDuplicates!0 (array!72655 (_ BitVec 32) List!24356) Bool)

(assert (=> b!1115878 (= res!745004 (arrayNoDuplicates!0 lt!497048 #b00000000000000000000000000000000 Nil!24353))))

(declare-fun b!1115879 () Bool)

(declare-fun res!745008 () Bool)

(assert (=> b!1115879 (=> (not res!745008) (not e!635834))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115879 (= res!745008 (validKeyInArray!0 k0!934))))

(declare-fun b!1115880 () Bool)

(assert (=> b!1115880 (= e!635834 e!635830)))

(declare-fun res!745009 () Bool)

(assert (=> b!1115880 (=> (not res!745009) (not e!635830))))

(assert (=> b!1115880 (= res!745009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497048 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115880 (= lt!497048 (array!72656 (store (arr!34980 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35516 _keys!1208)))))

(declare-fun b!1115881 () Bool)

(declare-fun res!745010 () Bool)

(assert (=> b!1115881 (=> (not res!745010) (not e!635834))))

(assert (=> b!1115881 (= res!745010 (= (select (arr!34980 _keys!1208) i!673) k0!934))))

(declare-fun b!1115882 () Bool)

(declare-fun res!745005 () Bool)

(assert (=> b!1115882 (=> (not res!745005) (not e!635834))))

(assert (=> b!1115882 (= res!745005 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35516 _keys!1208))))))

(declare-fun b!1115883 () Bool)

(declare-fun res!745006 () Bool)

(assert (=> b!1115883 (=> (not res!745006) (not e!635834))))

(assert (=> b!1115883 (= res!745006 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24353))))

(declare-fun b!1115884 () Bool)

(declare-fun e!635832 () Bool)

(declare-fun mapRes!43636 () Bool)

(assert (=> b!1115884 (= e!635832 (and e!635835 mapRes!43636))))

(declare-fun condMapEmpty!43636 () Bool)

(declare-fun mapDefault!43636 () ValueCell!13230)

(assert (=> b!1115884 (= condMapEmpty!43636 (= (arr!34981 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13230)) mapDefault!43636)))))

(declare-fun mapNonEmpty!43636 () Bool)

(declare-fun tp!82880 () Bool)

(declare-fun e!635833 () Bool)

(assert (=> mapNonEmpty!43636 (= mapRes!43636 (and tp!82880 e!635833))))

(declare-fun mapRest!43636 () (Array (_ BitVec 32) ValueCell!13230))

(declare-fun mapValue!43636 () ValueCell!13230)

(declare-fun mapKey!43636 () (_ BitVec 32))

(assert (=> mapNonEmpty!43636 (= (arr!34981 _values!996) (store mapRest!43636 mapKey!43636 mapValue!43636))))

(declare-fun b!1115885 () Bool)

(assert (=> b!1115885 (= e!635833 tp_is_empty!27879)))

(declare-fun b!1115886 () Bool)

(assert (=> b!1115886 (= e!635830 (not true))))

(declare-fun arrayContainsKey!0 (array!72655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115886 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36622 0))(
  ( (Unit!36623) )
))
(declare-fun lt!497047 () Unit!36622)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72655 (_ BitVec 64) (_ BitVec 32)) Unit!36622)

(assert (=> b!1115886 (= lt!497047 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43636 () Bool)

(assert (=> mapIsEmpty!43636 mapRes!43636))

(declare-fun res!745011 () Bool)

(assert (=> start!97648 (=> (not res!745011) (not e!635834))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97648 (= res!745011 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35516 _keys!1208))))))

(assert (=> start!97648 e!635834))

(declare-fun array_inv!26888 (array!72655) Bool)

(assert (=> start!97648 (array_inv!26888 _keys!1208)))

(assert (=> start!97648 true))

(declare-fun array_inv!26889 (array!72657) Bool)

(assert (=> start!97648 (and (array_inv!26889 _values!996) e!635832)))

(assert (= (and start!97648 res!745011) b!1115877))

(assert (= (and b!1115877 res!745007) b!1115874))

(assert (= (and b!1115874 res!745012) b!1115875))

(assert (= (and b!1115875 res!745003) b!1115883))

(assert (= (and b!1115883 res!745006) b!1115882))

(assert (= (and b!1115882 res!745005) b!1115879))

(assert (= (and b!1115879 res!745008) b!1115881))

(assert (= (and b!1115881 res!745010) b!1115880))

(assert (= (and b!1115880 res!745009) b!1115878))

(assert (= (and b!1115878 res!745004) b!1115886))

(assert (= (and b!1115884 condMapEmpty!43636) mapIsEmpty!43636))

(assert (= (and b!1115884 (not condMapEmpty!43636)) mapNonEmpty!43636))

(get-info :version)

(assert (= (and mapNonEmpty!43636 ((_ is ValueCellFull!13230) mapValue!43636)) b!1115885))

(assert (= (and b!1115884 ((_ is ValueCellFull!13230) mapDefault!43636)) b!1115876))

(assert (= start!97648 b!1115884))

(declare-fun m!1032271 () Bool)

(assert (=> b!1115875 m!1032271))

(declare-fun m!1032273 () Bool)

(assert (=> start!97648 m!1032273))

(declare-fun m!1032275 () Bool)

(assert (=> start!97648 m!1032275))

(declare-fun m!1032277 () Bool)

(assert (=> mapNonEmpty!43636 m!1032277))

(declare-fun m!1032279 () Bool)

(assert (=> b!1115886 m!1032279))

(declare-fun m!1032281 () Bool)

(assert (=> b!1115886 m!1032281))

(declare-fun m!1032283 () Bool)

(assert (=> b!1115880 m!1032283))

(declare-fun m!1032285 () Bool)

(assert (=> b!1115880 m!1032285))

(declare-fun m!1032287 () Bool)

(assert (=> b!1115883 m!1032287))

(declare-fun m!1032289 () Bool)

(assert (=> b!1115879 m!1032289))

(declare-fun m!1032291 () Bool)

(assert (=> b!1115877 m!1032291))

(declare-fun m!1032293 () Bool)

(assert (=> b!1115878 m!1032293))

(declare-fun m!1032295 () Bool)

(assert (=> b!1115881 m!1032295))

(check-sat (not b!1115875) (not b!1115878) (not start!97648) (not b!1115879) (not mapNonEmpty!43636) (not b!1115886) (not b!1115877) tp_is_empty!27879 (not b!1115883) (not b!1115880))
(check-sat)
