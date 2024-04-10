; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97564 () Bool)

(assert start!97564)

(declare-fun b!1114236 () Bool)

(declare-fun res!743750 () Bool)

(declare-fun e!635075 () Bool)

(assert (=> b!1114236 (=> (not res!743750) (not e!635075))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72497 0))(
  ( (array!72498 (arr!34901 (Array (_ BitVec 32) (_ BitVec 64))) (size!35437 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72497)

(assert (=> b!1114236 (= res!743750 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35437 _keys!1208))))))

(declare-fun b!1114237 () Bool)

(declare-fun res!743744 () Bool)

(assert (=> b!1114237 (=> (not res!743744) (not e!635075))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1114237 (= res!743744 (= (select (arr!34901 _keys!1208) i!673) k0!934))))

(declare-fun b!1114239 () Bool)

(declare-fun res!743752 () Bool)

(assert (=> b!1114239 (=> (not res!743752) (not e!635075))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72497 (_ BitVec 32)) Bool)

(assert (=> b!1114239 (= res!743752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43510 () Bool)

(declare-fun mapRes!43510 () Bool)

(assert (=> mapIsEmpty!43510 mapRes!43510))

(declare-fun b!1114240 () Bool)

(declare-fun res!743748 () Bool)

(assert (=> b!1114240 (=> (not res!743748) (not e!635075))))

(declare-datatypes ((List!24326 0))(
  ( (Nil!24323) (Cons!24322 (h!25531 (_ BitVec 64)) (t!34807 List!24326)) )
))
(declare-fun arrayNoDuplicates!0 (array!72497 (_ BitVec 32) List!24326) Bool)

(assert (=> b!1114240 (= res!743748 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24323))))

(declare-fun b!1114241 () Bool)

(declare-fun e!635077 () Bool)

(declare-fun e!635078 () Bool)

(assert (=> b!1114241 (= e!635077 (and e!635078 mapRes!43510))))

(declare-fun condMapEmpty!43510 () Bool)

(declare-datatypes ((V!42187 0))(
  ( (V!42188 (val!13954 Int)) )
))
(declare-datatypes ((ValueCell!13188 0))(
  ( (ValueCellFull!13188 (v!16587 V!42187)) (EmptyCell!13188) )
))
(declare-datatypes ((array!72499 0))(
  ( (array!72500 (arr!34902 (Array (_ BitVec 32) ValueCell!13188)) (size!35438 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72499)

(declare-fun mapDefault!43510 () ValueCell!13188)

(assert (=> b!1114241 (= condMapEmpty!43510 (= (arr!34902 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13188)) mapDefault!43510)))))

(declare-fun b!1114238 () Bool)

(declare-fun e!635076 () Bool)

(assert (=> b!1114238 (= e!635075 e!635076)))

(declare-fun res!743747 () Bool)

(assert (=> b!1114238 (=> (not res!743747) (not e!635076))))

(declare-fun lt!496795 () array!72497)

(assert (=> b!1114238 (= res!743747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496795 mask!1564))))

(assert (=> b!1114238 (= lt!496795 (array!72498 (store (arr!34901 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35437 _keys!1208)))))

(declare-fun res!743745 () Bool)

(assert (=> start!97564 (=> (not res!743745) (not e!635075))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97564 (= res!743745 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35437 _keys!1208))))))

(assert (=> start!97564 e!635075))

(declare-fun array_inv!26828 (array!72497) Bool)

(assert (=> start!97564 (array_inv!26828 _keys!1208)))

(assert (=> start!97564 true))

(declare-fun array_inv!26829 (array!72499) Bool)

(assert (=> start!97564 (and (array_inv!26829 _values!996) e!635077)))

(declare-fun mapNonEmpty!43510 () Bool)

(declare-fun tp!82754 () Bool)

(declare-fun e!635079 () Bool)

(assert (=> mapNonEmpty!43510 (= mapRes!43510 (and tp!82754 e!635079))))

(declare-fun mapRest!43510 () (Array (_ BitVec 32) ValueCell!13188))

(declare-fun mapValue!43510 () ValueCell!13188)

(declare-fun mapKey!43510 () (_ BitVec 32))

(assert (=> mapNonEmpty!43510 (= (arr!34902 _values!996) (store mapRest!43510 mapKey!43510 mapValue!43510))))

(declare-fun b!1114242 () Bool)

(declare-fun tp_is_empty!27795 () Bool)

(assert (=> b!1114242 (= e!635079 tp_is_empty!27795)))

(declare-fun b!1114243 () Bool)

(declare-fun res!743751 () Bool)

(assert (=> b!1114243 (=> (not res!743751) (not e!635075))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114243 (= res!743751 (and (= (size!35438 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35437 _keys!1208) (size!35438 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114244 () Bool)

(assert (=> b!1114244 (= e!635076 (not true))))

(declare-fun arrayContainsKey!0 (array!72497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114244 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36572 0))(
  ( (Unit!36573) )
))
(declare-fun lt!496796 () Unit!36572)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72497 (_ BitVec 64) (_ BitVec 32)) Unit!36572)

(assert (=> b!1114244 (= lt!496796 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114245 () Bool)

(declare-fun res!743749 () Bool)

(assert (=> b!1114245 (=> (not res!743749) (not e!635075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114245 (= res!743749 (validKeyInArray!0 k0!934))))

(declare-fun b!1114246 () Bool)

(declare-fun res!743743 () Bool)

(assert (=> b!1114246 (=> (not res!743743) (not e!635075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114246 (= res!743743 (validMask!0 mask!1564))))

(declare-fun b!1114247 () Bool)

(declare-fun res!743746 () Bool)

(assert (=> b!1114247 (=> (not res!743746) (not e!635076))))

(assert (=> b!1114247 (= res!743746 (arrayNoDuplicates!0 lt!496795 #b00000000000000000000000000000000 Nil!24323))))

(declare-fun b!1114248 () Bool)

(assert (=> b!1114248 (= e!635078 tp_is_empty!27795)))

(assert (= (and start!97564 res!743745) b!1114246))

(assert (= (and b!1114246 res!743743) b!1114243))

(assert (= (and b!1114243 res!743751) b!1114239))

(assert (= (and b!1114239 res!743752) b!1114240))

(assert (= (and b!1114240 res!743748) b!1114236))

(assert (= (and b!1114236 res!743750) b!1114245))

(assert (= (and b!1114245 res!743749) b!1114237))

(assert (= (and b!1114237 res!743744) b!1114238))

(assert (= (and b!1114238 res!743747) b!1114247))

(assert (= (and b!1114247 res!743746) b!1114244))

(assert (= (and b!1114241 condMapEmpty!43510) mapIsEmpty!43510))

(assert (= (and b!1114241 (not condMapEmpty!43510)) mapNonEmpty!43510))

(get-info :version)

(assert (= (and mapNonEmpty!43510 ((_ is ValueCellFull!13188) mapValue!43510)) b!1114242))

(assert (= (and b!1114241 ((_ is ValueCellFull!13188) mapDefault!43510)) b!1114248))

(assert (= start!97564 b!1114241))

(declare-fun m!1031179 () Bool)

(assert (=> b!1114244 m!1031179))

(declare-fun m!1031181 () Bool)

(assert (=> b!1114244 m!1031181))

(declare-fun m!1031183 () Bool)

(assert (=> b!1114245 m!1031183))

(declare-fun m!1031185 () Bool)

(assert (=> mapNonEmpty!43510 m!1031185))

(declare-fun m!1031187 () Bool)

(assert (=> b!1114247 m!1031187))

(declare-fun m!1031189 () Bool)

(assert (=> b!1114246 m!1031189))

(declare-fun m!1031191 () Bool)

(assert (=> b!1114238 m!1031191))

(declare-fun m!1031193 () Bool)

(assert (=> b!1114238 m!1031193))

(declare-fun m!1031195 () Bool)

(assert (=> start!97564 m!1031195))

(declare-fun m!1031197 () Bool)

(assert (=> start!97564 m!1031197))

(declare-fun m!1031199 () Bool)

(assert (=> b!1114239 m!1031199))

(declare-fun m!1031201 () Bool)

(assert (=> b!1114240 m!1031201))

(declare-fun m!1031203 () Bool)

(assert (=> b!1114237 m!1031203))

(check-sat (not b!1114247) (not b!1114240) tp_is_empty!27795 (not mapNonEmpty!43510) (not b!1114246) (not b!1114245) (not b!1114238) (not start!97564) (not b!1114239) (not b!1114244))
(check-sat)
