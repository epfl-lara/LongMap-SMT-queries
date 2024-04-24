; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97738 () Bool)

(assert start!97738)

(declare-fun b!1114355 () Bool)

(declare-fun e!635372 () Bool)

(assert (=> b!1114355 (= e!635372 (not true))))

(declare-datatypes ((array!72415 0))(
  ( (array!72416 (arr!34854 (Array (_ BitVec 32) (_ BitVec 64))) (size!35391 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72415)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114355 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36503 0))(
  ( (Unit!36504) )
))
(declare-fun lt!497124 () Unit!36503)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72415 (_ BitVec 64) (_ BitVec 32)) Unit!36503)

(assert (=> b!1114355 (= lt!497124 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43417 () Bool)

(declare-fun mapRes!43417 () Bool)

(declare-fun tp!82661 () Bool)

(declare-fun e!635374 () Bool)

(assert (=> mapNonEmpty!43417 (= mapRes!43417 (and tp!82661 e!635374))))

(declare-fun mapKey!43417 () (_ BitVec 32))

(declare-datatypes ((V!42105 0))(
  ( (V!42106 (val!13923 Int)) )
))
(declare-datatypes ((ValueCell!13157 0))(
  ( (ValueCellFull!13157 (v!16552 V!42105)) (EmptyCell!13157) )
))
(declare-fun mapRest!43417 () (Array (_ BitVec 32) ValueCell!13157))

(declare-datatypes ((array!72417 0))(
  ( (array!72418 (arr!34855 (Array (_ BitVec 32) ValueCell!13157)) (size!35392 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72417)

(declare-fun mapValue!43417 () ValueCell!13157)

(assert (=> mapNonEmpty!43417 (= (arr!34855 _values!996) (store mapRest!43417 mapKey!43417 mapValue!43417))))

(declare-fun mapIsEmpty!43417 () Bool)

(assert (=> mapIsEmpty!43417 mapRes!43417))

(declare-fun b!1114356 () Bool)

(declare-fun res!743336 () Bool)

(declare-fun e!635376 () Bool)

(assert (=> b!1114356 (=> (not res!743336) (not e!635376))))

(assert (=> b!1114356 (= res!743336 (= (select (arr!34854 _keys!1208) i!673) k0!934))))

(declare-fun b!1114357 () Bool)

(declare-fun res!743338 () Bool)

(assert (=> b!1114357 (=> (not res!743338) (not e!635372))))

(declare-fun lt!497125 () array!72415)

(declare-datatypes ((List!24321 0))(
  ( (Nil!24318) (Cons!24317 (h!25535 (_ BitVec 64)) (t!34794 List!24321)) )
))
(declare-fun arrayNoDuplicates!0 (array!72415 (_ BitVec 32) List!24321) Bool)

(assert (=> b!1114357 (= res!743338 (arrayNoDuplicates!0 lt!497125 #b00000000000000000000000000000000 Nil!24318))))

(declare-fun b!1114358 () Bool)

(declare-fun res!743335 () Bool)

(assert (=> b!1114358 (=> (not res!743335) (not e!635376))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1114358 (= res!743335 (and (= (size!35392 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35391 _keys!1208) (size!35392 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114359 () Bool)

(declare-fun tp_is_empty!27733 () Bool)

(assert (=> b!1114359 (= e!635374 tp_is_empty!27733)))

(declare-fun b!1114360 () Bool)

(declare-fun e!635371 () Bool)

(declare-fun e!635375 () Bool)

(assert (=> b!1114360 (= e!635371 (and e!635375 mapRes!43417))))

(declare-fun condMapEmpty!43417 () Bool)

(declare-fun mapDefault!43417 () ValueCell!13157)

(assert (=> b!1114360 (= condMapEmpty!43417 (= (arr!34855 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13157)) mapDefault!43417)))))

(declare-fun b!1114361 () Bool)

(declare-fun res!743341 () Bool)

(assert (=> b!1114361 (=> (not res!743341) (not e!635376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114361 (= res!743341 (validMask!0 mask!1564))))

(declare-fun b!1114354 () Bool)

(assert (=> b!1114354 (= e!635375 tp_is_empty!27733)))

(declare-fun res!743342 () Bool)

(assert (=> start!97738 (=> (not res!743342) (not e!635376))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97738 (= res!743342 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35391 _keys!1208))))))

(assert (=> start!97738 e!635376))

(declare-fun array_inv!26856 (array!72415) Bool)

(assert (=> start!97738 (array_inv!26856 _keys!1208)))

(assert (=> start!97738 true))

(declare-fun array_inv!26857 (array!72417) Bool)

(assert (=> start!97738 (and (array_inv!26857 _values!996) e!635371)))

(declare-fun b!1114362 () Bool)

(declare-fun res!743344 () Bool)

(assert (=> b!1114362 (=> (not res!743344) (not e!635376))))

(assert (=> b!1114362 (= res!743344 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35391 _keys!1208))))))

(declare-fun b!1114363 () Bool)

(declare-fun res!743339 () Bool)

(assert (=> b!1114363 (=> (not res!743339) (not e!635376))))

(assert (=> b!1114363 (= res!743339 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24318))))

(declare-fun b!1114364 () Bool)

(assert (=> b!1114364 (= e!635376 e!635372)))

(declare-fun res!743337 () Bool)

(assert (=> b!1114364 (=> (not res!743337) (not e!635372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72415 (_ BitVec 32)) Bool)

(assert (=> b!1114364 (= res!743337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497125 mask!1564))))

(assert (=> b!1114364 (= lt!497125 (array!72416 (store (arr!34854 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35391 _keys!1208)))))

(declare-fun b!1114365 () Bool)

(declare-fun res!743343 () Bool)

(assert (=> b!1114365 (=> (not res!743343) (not e!635376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114365 (= res!743343 (validKeyInArray!0 k0!934))))

(declare-fun b!1114366 () Bool)

(declare-fun res!743340 () Bool)

(assert (=> b!1114366 (=> (not res!743340) (not e!635376))))

(assert (=> b!1114366 (= res!743340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97738 res!743342) b!1114361))

(assert (= (and b!1114361 res!743341) b!1114358))

(assert (= (and b!1114358 res!743335) b!1114366))

(assert (= (and b!1114366 res!743340) b!1114363))

(assert (= (and b!1114363 res!743339) b!1114362))

(assert (= (and b!1114362 res!743344) b!1114365))

(assert (= (and b!1114365 res!743343) b!1114356))

(assert (= (and b!1114356 res!743336) b!1114364))

(assert (= (and b!1114364 res!743337) b!1114357))

(assert (= (and b!1114357 res!743338) b!1114355))

(assert (= (and b!1114360 condMapEmpty!43417) mapIsEmpty!43417))

(assert (= (and b!1114360 (not condMapEmpty!43417)) mapNonEmpty!43417))

(get-info :version)

(assert (= (and mapNonEmpty!43417 ((_ is ValueCellFull!13157) mapValue!43417)) b!1114359))

(assert (= (and b!1114360 ((_ is ValueCellFull!13157) mapDefault!43417)) b!1114354))

(assert (= start!97738 b!1114360))

(declare-fun m!1032045 () Bool)

(assert (=> b!1114361 m!1032045))

(declare-fun m!1032047 () Bool)

(assert (=> start!97738 m!1032047))

(declare-fun m!1032049 () Bool)

(assert (=> start!97738 m!1032049))

(declare-fun m!1032051 () Bool)

(assert (=> b!1114355 m!1032051))

(declare-fun m!1032053 () Bool)

(assert (=> b!1114355 m!1032053))

(declare-fun m!1032055 () Bool)

(assert (=> b!1114364 m!1032055))

(declare-fun m!1032057 () Bool)

(assert (=> b!1114364 m!1032057))

(declare-fun m!1032059 () Bool)

(assert (=> b!1114365 m!1032059))

(declare-fun m!1032061 () Bool)

(assert (=> b!1114357 m!1032061))

(declare-fun m!1032063 () Bool)

(assert (=> mapNonEmpty!43417 m!1032063))

(declare-fun m!1032065 () Bool)

(assert (=> b!1114363 m!1032065))

(declare-fun m!1032067 () Bool)

(assert (=> b!1114366 m!1032067))

(declare-fun m!1032069 () Bool)

(assert (=> b!1114356 m!1032069))

(check-sat (not start!97738) (not b!1114355) (not b!1114366) (not b!1114365) (not mapNonEmpty!43417) (not b!1114364) (not b!1114363) tp_is_empty!27733 (not b!1114361) (not b!1114357))
(check-sat)
