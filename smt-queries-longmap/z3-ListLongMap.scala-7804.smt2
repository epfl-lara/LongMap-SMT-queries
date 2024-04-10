; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97570 () Bool)

(assert start!97570)

(declare-fun b!1114353 () Bool)

(declare-fun e!635129 () Bool)

(assert (=> b!1114353 (= e!635129 (not true))))

(declare-datatypes ((array!72509 0))(
  ( (array!72510 (arr!34907 (Array (_ BitVec 32) (_ BitVec 64))) (size!35443 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72509)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114353 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36576 0))(
  ( (Unit!36577) )
))
(declare-fun lt!496814 () Unit!36576)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72509 (_ BitVec 64) (_ BitVec 32)) Unit!36576)

(assert (=> b!1114353 (= lt!496814 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114354 () Bool)

(declare-fun e!635133 () Bool)

(declare-fun e!635130 () Bool)

(declare-fun mapRes!43519 () Bool)

(assert (=> b!1114354 (= e!635133 (and e!635130 mapRes!43519))))

(declare-fun condMapEmpty!43519 () Bool)

(declare-datatypes ((V!42195 0))(
  ( (V!42196 (val!13957 Int)) )
))
(declare-datatypes ((ValueCell!13191 0))(
  ( (ValueCellFull!13191 (v!16590 V!42195)) (EmptyCell!13191) )
))
(declare-datatypes ((array!72511 0))(
  ( (array!72512 (arr!34908 (Array (_ BitVec 32) ValueCell!13191)) (size!35444 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72511)

(declare-fun mapDefault!43519 () ValueCell!13191)

(assert (=> b!1114354 (= condMapEmpty!43519 (= (arr!34908 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13191)) mapDefault!43519)))))

(declare-fun b!1114355 () Bool)

(declare-fun res!743834 () Bool)

(declare-fun e!635132 () Bool)

(assert (=> b!1114355 (=> (not res!743834) (not e!635132))))

(assert (=> b!1114355 (= res!743834 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35443 _keys!1208))))))

(declare-fun b!1114356 () Bool)

(declare-fun res!743839 () Bool)

(assert (=> b!1114356 (=> (not res!743839) (not e!635129))))

(declare-fun lt!496813 () array!72509)

(declare-datatypes ((List!24329 0))(
  ( (Nil!24326) (Cons!24325 (h!25534 (_ BitVec 64)) (t!34810 List!24329)) )
))
(declare-fun arrayNoDuplicates!0 (array!72509 (_ BitVec 32) List!24329) Bool)

(assert (=> b!1114356 (= res!743839 (arrayNoDuplicates!0 lt!496813 #b00000000000000000000000000000000 Nil!24326))))

(declare-fun b!1114357 () Bool)

(declare-fun res!743840 () Bool)

(assert (=> b!1114357 (=> (not res!743840) (not e!635132))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114357 (= res!743840 (validMask!0 mask!1564))))

(declare-fun res!743842 () Bool)

(assert (=> start!97570 (=> (not res!743842) (not e!635132))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97570 (= res!743842 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35443 _keys!1208))))))

(assert (=> start!97570 e!635132))

(declare-fun array_inv!26832 (array!72509) Bool)

(assert (=> start!97570 (array_inv!26832 _keys!1208)))

(assert (=> start!97570 true))

(declare-fun array_inv!26833 (array!72511) Bool)

(assert (=> start!97570 (and (array_inv!26833 _values!996) e!635133)))

(declare-fun b!1114358 () Bool)

(declare-fun res!743838 () Bool)

(assert (=> b!1114358 (=> (not res!743838) (not e!635132))))

(assert (=> b!1114358 (= res!743838 (= (select (arr!34907 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43519 () Bool)

(assert (=> mapIsEmpty!43519 mapRes!43519))

(declare-fun b!1114359 () Bool)

(assert (=> b!1114359 (= e!635132 e!635129)))

(declare-fun res!743841 () Bool)

(assert (=> b!1114359 (=> (not res!743841) (not e!635129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72509 (_ BitVec 32)) Bool)

(assert (=> b!1114359 (= res!743841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496813 mask!1564))))

(assert (=> b!1114359 (= lt!496813 (array!72510 (store (arr!34907 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35443 _keys!1208)))))

(declare-fun b!1114360 () Bool)

(declare-fun res!743835 () Bool)

(assert (=> b!1114360 (=> (not res!743835) (not e!635132))))

(assert (=> b!1114360 (= res!743835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114361 () Bool)

(declare-fun res!743837 () Bool)

(assert (=> b!1114361 (=> (not res!743837) (not e!635132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114361 (= res!743837 (validKeyInArray!0 k0!934))))

(declare-fun b!1114362 () Bool)

(declare-fun e!635131 () Bool)

(declare-fun tp_is_empty!27801 () Bool)

(assert (=> b!1114362 (= e!635131 tp_is_empty!27801)))

(declare-fun b!1114363 () Bool)

(assert (=> b!1114363 (= e!635130 tp_is_empty!27801)))

(declare-fun b!1114364 () Bool)

(declare-fun res!743833 () Bool)

(assert (=> b!1114364 (=> (not res!743833) (not e!635132))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114364 (= res!743833 (and (= (size!35444 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35443 _keys!1208) (size!35444 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43519 () Bool)

(declare-fun tp!82763 () Bool)

(assert (=> mapNonEmpty!43519 (= mapRes!43519 (and tp!82763 e!635131))))

(declare-fun mapValue!43519 () ValueCell!13191)

(declare-fun mapKey!43519 () (_ BitVec 32))

(declare-fun mapRest!43519 () (Array (_ BitVec 32) ValueCell!13191))

(assert (=> mapNonEmpty!43519 (= (arr!34908 _values!996) (store mapRest!43519 mapKey!43519 mapValue!43519))))

(declare-fun b!1114365 () Bool)

(declare-fun res!743836 () Bool)

(assert (=> b!1114365 (=> (not res!743836) (not e!635132))))

(assert (=> b!1114365 (= res!743836 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24326))))

(assert (= (and start!97570 res!743842) b!1114357))

(assert (= (and b!1114357 res!743840) b!1114364))

(assert (= (and b!1114364 res!743833) b!1114360))

(assert (= (and b!1114360 res!743835) b!1114365))

(assert (= (and b!1114365 res!743836) b!1114355))

(assert (= (and b!1114355 res!743834) b!1114361))

(assert (= (and b!1114361 res!743837) b!1114358))

(assert (= (and b!1114358 res!743838) b!1114359))

(assert (= (and b!1114359 res!743841) b!1114356))

(assert (= (and b!1114356 res!743839) b!1114353))

(assert (= (and b!1114354 condMapEmpty!43519) mapIsEmpty!43519))

(assert (= (and b!1114354 (not condMapEmpty!43519)) mapNonEmpty!43519))

(get-info :version)

(assert (= (and mapNonEmpty!43519 ((_ is ValueCellFull!13191) mapValue!43519)) b!1114362))

(assert (= (and b!1114354 ((_ is ValueCellFull!13191) mapDefault!43519)) b!1114363))

(assert (= start!97570 b!1114354))

(declare-fun m!1031257 () Bool)

(assert (=> b!1114357 m!1031257))

(declare-fun m!1031259 () Bool)

(assert (=> b!1114356 m!1031259))

(declare-fun m!1031261 () Bool)

(assert (=> b!1114353 m!1031261))

(declare-fun m!1031263 () Bool)

(assert (=> b!1114353 m!1031263))

(declare-fun m!1031265 () Bool)

(assert (=> b!1114361 m!1031265))

(declare-fun m!1031267 () Bool)

(assert (=> b!1114359 m!1031267))

(declare-fun m!1031269 () Bool)

(assert (=> b!1114359 m!1031269))

(declare-fun m!1031271 () Bool)

(assert (=> start!97570 m!1031271))

(declare-fun m!1031273 () Bool)

(assert (=> start!97570 m!1031273))

(declare-fun m!1031275 () Bool)

(assert (=> b!1114365 m!1031275))

(declare-fun m!1031277 () Bool)

(assert (=> b!1114358 m!1031277))

(declare-fun m!1031279 () Bool)

(assert (=> b!1114360 m!1031279))

(declare-fun m!1031281 () Bool)

(assert (=> mapNonEmpty!43519 m!1031281))

(check-sat (not b!1114359) tp_is_empty!27801 (not start!97570) (not mapNonEmpty!43519) (not b!1114353) (not b!1114356) (not b!1114365) (not b!1114361) (not b!1114360) (not b!1114357))
(check-sat)
