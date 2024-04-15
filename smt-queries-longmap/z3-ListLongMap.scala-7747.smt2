; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97220 () Bool)

(assert start!97220)

(declare-fun b!1106268 () Bool)

(declare-fun res!738285 () Bool)

(declare-fun e!631276 () Bool)

(assert (=> b!1106268 (=> (not res!738285) (not e!631276))))

(declare-datatypes ((array!71742 0))(
  ( (array!71743 (arr!34524 (Array (_ BitVec 32) (_ BitVec 64))) (size!35062 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71742)

(declare-datatypes ((List!24128 0))(
  ( (Nil!24125) (Cons!24124 (h!25333 (_ BitVec 64)) (t!34384 List!24128)) )
))
(declare-fun arrayNoDuplicates!0 (array!71742 (_ BitVec 32) List!24128) Bool)

(assert (=> b!1106268 (= res!738285 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24125))))

(declare-fun b!1106269 () Bool)

(declare-fun res!738282 () Bool)

(assert (=> b!1106269 (=> (not res!738282) (not e!631276))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41737 0))(
  ( (V!41738 (val!13785 Int)) )
))
(declare-datatypes ((ValueCell!13019 0))(
  ( (ValueCellFull!13019 (v!16417 V!41737)) (EmptyCell!13019) )
))
(declare-datatypes ((array!71744 0))(
  ( (array!71745 (arr!34525 (Array (_ BitVec 32) ValueCell!13019)) (size!35063 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71744)

(assert (=> b!1106269 (= res!738282 (and (= (size!35063 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35062 _keys!1208) (size!35063 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106270 () Bool)

(declare-fun e!631275 () Bool)

(assert (=> b!1106270 (= e!631276 e!631275)))

(declare-fun res!738288 () Bool)

(assert (=> b!1106270 (=> (not res!738288) (not e!631275))))

(declare-fun lt!495257 () array!71742)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71742 (_ BitVec 32)) Bool)

(assert (=> b!1106270 (= res!738288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495257 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106270 (= lt!495257 (array!71743 (store (arr!34524 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35062 _keys!1208)))))

(declare-fun b!1106271 () Bool)

(declare-fun res!738283 () Bool)

(assert (=> b!1106271 (=> (not res!738283) (not e!631276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106271 (= res!738283 (validMask!0 mask!1564))))

(declare-fun b!1106272 () Bool)

(declare-fun res!738281 () Bool)

(assert (=> b!1106272 (=> (not res!738281) (not e!631275))))

(assert (=> b!1106272 (= res!738281 (arrayNoDuplicates!0 lt!495257 #b00000000000000000000000000000000 Nil!24125))))

(declare-fun mapIsEmpty!43003 () Bool)

(declare-fun mapRes!43003 () Bool)

(assert (=> mapIsEmpty!43003 mapRes!43003))

(declare-fun b!1106274 () Bool)

(assert (=> b!1106274 (= e!631275 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106274 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36127 0))(
  ( (Unit!36128) )
))
(declare-fun lt!495258 () Unit!36127)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71742 (_ BitVec 64) (_ BitVec 32)) Unit!36127)

(assert (=> b!1106274 (= lt!495258 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106275 () Bool)

(declare-fun res!738286 () Bool)

(assert (=> b!1106275 (=> (not res!738286) (not e!631276))))

(assert (=> b!1106275 (= res!738286 (= (select (arr!34524 _keys!1208) i!673) k0!934))))

(declare-fun b!1106276 () Bool)

(declare-fun e!631274 () Bool)

(declare-fun tp_is_empty!27457 () Bool)

(assert (=> b!1106276 (= e!631274 tp_is_empty!27457)))

(declare-fun b!1106277 () Bool)

(declare-fun res!738289 () Bool)

(assert (=> b!1106277 (=> (not res!738289) (not e!631276))))

(assert (=> b!1106277 (= res!738289 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35062 _keys!1208))))))

(declare-fun b!1106278 () Bool)

(declare-fun e!631278 () Bool)

(assert (=> b!1106278 (= e!631278 tp_is_empty!27457)))

(declare-fun b!1106279 () Bool)

(declare-fun res!738280 () Bool)

(assert (=> b!1106279 (=> (not res!738280) (not e!631276))))

(assert (=> b!1106279 (= res!738280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!738284 () Bool)

(assert (=> start!97220 (=> (not res!738284) (not e!631276))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97220 (= res!738284 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35062 _keys!1208))))))

(assert (=> start!97220 e!631276))

(declare-fun array_inv!26626 (array!71742) Bool)

(assert (=> start!97220 (array_inv!26626 _keys!1208)))

(assert (=> start!97220 true))

(declare-fun e!631273 () Bool)

(declare-fun array_inv!26627 (array!71744) Bool)

(assert (=> start!97220 (and (array_inv!26627 _values!996) e!631273)))

(declare-fun b!1106273 () Bool)

(assert (=> b!1106273 (= e!631273 (and e!631278 mapRes!43003))))

(declare-fun condMapEmpty!43003 () Bool)

(declare-fun mapDefault!43003 () ValueCell!13019)

(assert (=> b!1106273 (= condMapEmpty!43003 (= (arr!34525 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13019)) mapDefault!43003)))))

(declare-fun b!1106280 () Bool)

(declare-fun res!738287 () Bool)

(assert (=> b!1106280 (=> (not res!738287) (not e!631276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106280 (= res!738287 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43003 () Bool)

(declare-fun tp!81923 () Bool)

(assert (=> mapNonEmpty!43003 (= mapRes!43003 (and tp!81923 e!631274))))

(declare-fun mapKey!43003 () (_ BitVec 32))

(declare-fun mapValue!43003 () ValueCell!13019)

(declare-fun mapRest!43003 () (Array (_ BitVec 32) ValueCell!13019))

(assert (=> mapNonEmpty!43003 (= (arr!34525 _values!996) (store mapRest!43003 mapKey!43003 mapValue!43003))))

(assert (= (and start!97220 res!738284) b!1106271))

(assert (= (and b!1106271 res!738283) b!1106269))

(assert (= (and b!1106269 res!738282) b!1106279))

(assert (= (and b!1106279 res!738280) b!1106268))

(assert (= (and b!1106268 res!738285) b!1106277))

(assert (= (and b!1106277 res!738289) b!1106280))

(assert (= (and b!1106280 res!738287) b!1106275))

(assert (= (and b!1106275 res!738286) b!1106270))

(assert (= (and b!1106270 res!738288) b!1106272))

(assert (= (and b!1106272 res!738281) b!1106274))

(assert (= (and b!1106273 condMapEmpty!43003) mapIsEmpty!43003))

(assert (= (and b!1106273 (not condMapEmpty!43003)) mapNonEmpty!43003))

(get-info :version)

(assert (= (and mapNonEmpty!43003 ((_ is ValueCellFull!13019) mapValue!43003)) b!1106276))

(assert (= (and b!1106273 ((_ is ValueCellFull!13019) mapDefault!43003)) b!1106278))

(assert (= start!97220 b!1106273))

(declare-fun m!1024863 () Bool)

(assert (=> b!1106268 m!1024863))

(declare-fun m!1024865 () Bool)

(assert (=> b!1106280 m!1024865))

(declare-fun m!1024867 () Bool)

(assert (=> b!1106272 m!1024867))

(declare-fun m!1024869 () Bool)

(assert (=> mapNonEmpty!43003 m!1024869))

(declare-fun m!1024871 () Bool)

(assert (=> b!1106279 m!1024871))

(declare-fun m!1024873 () Bool)

(assert (=> b!1106270 m!1024873))

(declare-fun m!1024875 () Bool)

(assert (=> b!1106270 m!1024875))

(declare-fun m!1024877 () Bool)

(assert (=> b!1106275 m!1024877))

(declare-fun m!1024879 () Bool)

(assert (=> b!1106271 m!1024879))

(declare-fun m!1024881 () Bool)

(assert (=> start!97220 m!1024881))

(declare-fun m!1024883 () Bool)

(assert (=> start!97220 m!1024883))

(declare-fun m!1024885 () Bool)

(assert (=> b!1106274 m!1024885))

(declare-fun m!1024887 () Bool)

(assert (=> b!1106274 m!1024887))

(check-sat (not b!1106268) (not start!97220) (not b!1106271) (not b!1106272) (not b!1106280) (not b!1106279) (not b!1106274) tp_is_empty!27457 (not b!1106270) (not mapNonEmpty!43003))
(check-sat)
