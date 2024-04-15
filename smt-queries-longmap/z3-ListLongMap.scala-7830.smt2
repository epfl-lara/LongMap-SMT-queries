; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97718 () Bool)

(assert start!97718)

(declare-fun b!1117227 () Bool)

(declare-fun res!746080 () Bool)

(declare-fun e!636436 () Bool)

(assert (=> b!1117227 (=> (not res!746080) (not e!636436))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72706 0))(
  ( (array!72707 (arr!35006 (Array (_ BitVec 32) (_ BitVec 64))) (size!35544 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72706)

(assert (=> b!1117227 (= res!746080 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35544 _keys!1208))))))

(declare-fun mapNonEmpty!43750 () Bool)

(declare-fun mapRes!43750 () Bool)

(declare-fun tp!82994 () Bool)

(declare-fun e!636437 () Bool)

(assert (=> mapNonEmpty!43750 (= mapRes!43750 (and tp!82994 e!636437))))

(declare-datatypes ((V!42401 0))(
  ( (V!42402 (val!14034 Int)) )
))
(declare-datatypes ((ValueCell!13268 0))(
  ( (ValueCellFull!13268 (v!16666 V!42401)) (EmptyCell!13268) )
))
(declare-fun mapValue!43750 () ValueCell!13268)

(declare-fun mapRest!43750 () (Array (_ BitVec 32) ValueCell!13268))

(declare-datatypes ((array!72708 0))(
  ( (array!72709 (arr!35007 (Array (_ BitVec 32) ValueCell!13268)) (size!35545 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72708)

(declare-fun mapKey!43750 () (_ BitVec 32))

(assert (=> mapNonEmpty!43750 (= (arr!35007 _values!996) (store mapRest!43750 mapKey!43750 mapValue!43750))))

(declare-fun b!1117228 () Bool)

(declare-fun res!746078 () Bool)

(assert (=> b!1117228 (=> (not res!746078) (not e!636436))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1117228 (= res!746078 (= (select (arr!35006 _keys!1208) i!673) k0!934))))

(declare-fun b!1117229 () Bool)

(declare-fun e!636433 () Bool)

(assert (=> b!1117229 (= e!636436 e!636433)))

(declare-fun res!746083 () Bool)

(assert (=> b!1117229 (=> (not res!746083) (not e!636433))))

(declare-fun lt!497075 () array!72706)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72706 (_ BitVec 32)) Bool)

(assert (=> b!1117229 (= res!746083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497075 mask!1564))))

(assert (=> b!1117229 (= lt!497075 (array!72707 (store (arr!35006 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35544 _keys!1208)))))

(declare-fun b!1117230 () Bool)

(declare-fun res!746074 () Bool)

(assert (=> b!1117230 (=> (not res!746074) (not e!636436))))

(assert (=> b!1117230 (= res!746074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117231 () Bool)

(assert (=> b!1117231 (= e!636433 (not true))))

(declare-fun arrayContainsKey!0 (array!72706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117231 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36495 0))(
  ( (Unit!36496) )
))
(declare-fun lt!497076 () Unit!36495)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72706 (_ BitVec 64) (_ BitVec 32)) Unit!36495)

(assert (=> b!1117231 (= lt!497076 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117232 () Bool)

(declare-fun res!746081 () Bool)

(assert (=> b!1117232 (=> (not res!746081) (not e!636436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117232 (= res!746081 (validKeyInArray!0 k0!934))))

(declare-fun b!1117233 () Bool)

(declare-fun res!746077 () Bool)

(assert (=> b!1117233 (=> (not res!746077) (not e!636436))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117233 (= res!746077 (and (= (size!35545 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35544 _keys!1208) (size!35545 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117234 () Bool)

(declare-fun tp_is_empty!27955 () Bool)

(assert (=> b!1117234 (= e!636437 tp_is_empty!27955)))

(declare-fun mapIsEmpty!43750 () Bool)

(assert (=> mapIsEmpty!43750 mapRes!43750))

(declare-fun b!1117235 () Bool)

(declare-fun res!746075 () Bool)

(assert (=> b!1117235 (=> (not res!746075) (not e!636436))))

(declare-datatypes ((List!24424 0))(
  ( (Nil!24421) (Cons!24420 (h!25629 (_ BitVec 64)) (t!34896 List!24424)) )
))
(declare-fun arrayNoDuplicates!0 (array!72706 (_ BitVec 32) List!24424) Bool)

(assert (=> b!1117235 (= res!746075 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24421))))

(declare-fun b!1117236 () Bool)

(declare-fun e!636434 () Bool)

(assert (=> b!1117236 (= e!636434 tp_is_empty!27955)))

(declare-fun b!1117237 () Bool)

(declare-fun res!746076 () Bool)

(assert (=> b!1117237 (=> (not res!746076) (not e!636433))))

(assert (=> b!1117237 (= res!746076 (arrayNoDuplicates!0 lt!497075 #b00000000000000000000000000000000 Nil!24421))))

(declare-fun res!746082 () Bool)

(assert (=> start!97718 (=> (not res!746082) (not e!636436))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97718 (= res!746082 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35544 _keys!1208))))))

(assert (=> start!97718 e!636436))

(declare-fun array_inv!26976 (array!72706) Bool)

(assert (=> start!97718 (array_inv!26976 _keys!1208)))

(assert (=> start!97718 true))

(declare-fun e!636435 () Bool)

(declare-fun array_inv!26977 (array!72708) Bool)

(assert (=> start!97718 (and (array_inv!26977 _values!996) e!636435)))

(declare-fun b!1117238 () Bool)

(assert (=> b!1117238 (= e!636435 (and e!636434 mapRes!43750))))

(declare-fun condMapEmpty!43750 () Bool)

(declare-fun mapDefault!43750 () ValueCell!13268)

(assert (=> b!1117238 (= condMapEmpty!43750 (= (arr!35007 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13268)) mapDefault!43750)))))

(declare-fun b!1117239 () Bool)

(declare-fun res!746079 () Bool)

(assert (=> b!1117239 (=> (not res!746079) (not e!636436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117239 (= res!746079 (validMask!0 mask!1564))))

(assert (= (and start!97718 res!746082) b!1117239))

(assert (= (and b!1117239 res!746079) b!1117233))

(assert (= (and b!1117233 res!746077) b!1117230))

(assert (= (and b!1117230 res!746074) b!1117235))

(assert (= (and b!1117235 res!746075) b!1117227))

(assert (= (and b!1117227 res!746080) b!1117232))

(assert (= (and b!1117232 res!746081) b!1117228))

(assert (= (and b!1117228 res!746078) b!1117229))

(assert (= (and b!1117229 res!746083) b!1117237))

(assert (= (and b!1117237 res!746076) b!1117231))

(assert (= (and b!1117238 condMapEmpty!43750) mapIsEmpty!43750))

(assert (= (and b!1117238 (not condMapEmpty!43750)) mapNonEmpty!43750))

(get-info :version)

(assert (= (and mapNonEmpty!43750 ((_ is ValueCellFull!13268) mapValue!43750)) b!1117234))

(assert (= (and b!1117238 ((_ is ValueCellFull!13268) mapDefault!43750)) b!1117236))

(assert (= start!97718 b!1117238))

(declare-fun m!1032633 () Bool)

(assert (=> b!1117229 m!1032633))

(declare-fun m!1032635 () Bool)

(assert (=> b!1117229 m!1032635))

(declare-fun m!1032637 () Bool)

(assert (=> mapNonEmpty!43750 m!1032637))

(declare-fun m!1032639 () Bool)

(assert (=> b!1117230 m!1032639))

(declare-fun m!1032641 () Bool)

(assert (=> b!1117228 m!1032641))

(declare-fun m!1032643 () Bool)

(assert (=> start!97718 m!1032643))

(declare-fun m!1032645 () Bool)

(assert (=> start!97718 m!1032645))

(declare-fun m!1032647 () Bool)

(assert (=> b!1117239 m!1032647))

(declare-fun m!1032649 () Bool)

(assert (=> b!1117235 m!1032649))

(declare-fun m!1032651 () Bool)

(assert (=> b!1117232 m!1032651))

(declare-fun m!1032653 () Bool)

(assert (=> b!1117231 m!1032653))

(declare-fun m!1032655 () Bool)

(assert (=> b!1117231 m!1032655))

(declare-fun m!1032657 () Bool)

(assert (=> b!1117237 m!1032657))

(check-sat (not b!1117229) tp_is_empty!27955 (not start!97718) (not b!1117230) (not b!1117235) (not b!1117232) (not b!1117231) (not b!1117239) (not b!1117237) (not mapNonEmpty!43750))
(check-sat)
