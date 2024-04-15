; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97622 () Bool)

(assert start!97622)

(declare-fun b!1115355 () Bool)

(declare-fun e!635570 () Bool)

(declare-fun tp_is_empty!27859 () Bool)

(assert (=> b!1115355 (= e!635570 tp_is_empty!27859)))

(declare-fun b!1115356 () Bool)

(declare-fun e!635572 () Bool)

(assert (=> b!1115356 (= e!635572 tp_is_empty!27859)))

(declare-fun b!1115357 () Bool)

(declare-fun e!635574 () Bool)

(declare-fun mapRes!43606 () Bool)

(assert (=> b!1115357 (= e!635574 (and e!635572 mapRes!43606))))

(declare-fun condMapEmpty!43606 () Bool)

(declare-datatypes ((V!42273 0))(
  ( (V!42274 (val!13986 Int)) )
))
(declare-datatypes ((ValueCell!13220 0))(
  ( (ValueCellFull!13220 (v!16618 V!42273)) (EmptyCell!13220) )
))
(declare-datatypes ((array!72520 0))(
  ( (array!72521 (arr!34913 (Array (_ BitVec 32) ValueCell!13220)) (size!35451 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72520)

(declare-fun mapDefault!43606 () ValueCell!13220)

(assert (=> b!1115357 (= condMapEmpty!43606 (= (arr!34913 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13220)) mapDefault!43606)))))

(declare-fun b!1115358 () Bool)

(declare-fun res!744639 () Bool)

(declare-fun e!635571 () Bool)

(assert (=> b!1115358 (=> (not res!744639) (not e!635571))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115358 (= res!744639 (validKeyInArray!0 k0!934))))

(declare-fun b!1115359 () Bool)

(declare-fun res!744635 () Bool)

(assert (=> b!1115359 (=> (not res!744635) (not e!635571))))

(declare-datatypes ((array!72522 0))(
  ( (array!72523 (arr!34914 (Array (_ BitVec 32) (_ BitVec 64))) (size!35452 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72522)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1115359 (= res!744635 (and (= (size!35451 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35452 _keys!1208) (size!35451 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115360 () Bool)

(declare-fun e!635569 () Bool)

(assert (=> b!1115360 (= e!635571 e!635569)))

(declare-fun res!744636 () Bool)

(assert (=> b!1115360 (=> (not res!744636) (not e!635569))))

(declare-fun lt!496788 () array!72522)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72522 (_ BitVec 32)) Bool)

(assert (=> b!1115360 (= res!744636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496788 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115360 (= lt!496788 (array!72523 (store (arr!34914 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35452 _keys!1208)))))

(declare-fun b!1115361 () Bool)

(declare-fun res!744634 () Bool)

(assert (=> b!1115361 (=> (not res!744634) (not e!635569))))

(declare-datatypes ((List!24383 0))(
  ( (Nil!24380) (Cons!24379 (h!25588 (_ BitVec 64)) (t!34855 List!24383)) )
))
(declare-fun arrayNoDuplicates!0 (array!72522 (_ BitVec 32) List!24383) Bool)

(assert (=> b!1115361 (= res!744634 (arrayNoDuplicates!0 lt!496788 #b00000000000000000000000000000000 Nil!24380))))

(declare-fun b!1115362 () Bool)

(declare-fun res!744642 () Bool)

(assert (=> b!1115362 (=> (not res!744642) (not e!635571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115362 (= res!744642 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43606 () Bool)

(declare-fun tp!82850 () Bool)

(assert (=> mapNonEmpty!43606 (= mapRes!43606 (and tp!82850 e!635570))))

(declare-fun mapValue!43606 () ValueCell!13220)

(declare-fun mapRest!43606 () (Array (_ BitVec 32) ValueCell!13220))

(declare-fun mapKey!43606 () (_ BitVec 32))

(assert (=> mapNonEmpty!43606 (= (arr!34913 _values!996) (store mapRest!43606 mapKey!43606 mapValue!43606))))

(declare-fun b!1115364 () Bool)

(declare-fun res!744640 () Bool)

(assert (=> b!1115364 (=> (not res!744640) (not e!635571))))

(assert (=> b!1115364 (= res!744640 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24380))))

(declare-fun b!1115365 () Bool)

(assert (=> b!1115365 (= e!635569 (not true))))

(declare-fun arrayContainsKey!0 (array!72522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115365 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36431 0))(
  ( (Unit!36432) )
))
(declare-fun lt!496787 () Unit!36431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72522 (_ BitVec 64) (_ BitVec 32)) Unit!36431)

(assert (=> b!1115365 (= lt!496787 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115366 () Bool)

(declare-fun res!744643 () Bool)

(assert (=> b!1115366 (=> (not res!744643) (not e!635571))))

(assert (=> b!1115366 (= res!744643 (= (select (arr!34914 _keys!1208) i!673) k0!934))))

(declare-fun b!1115367 () Bool)

(declare-fun res!744638 () Bool)

(assert (=> b!1115367 (=> (not res!744638) (not e!635571))))

(assert (=> b!1115367 (= res!744638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43606 () Bool)

(assert (=> mapIsEmpty!43606 mapRes!43606))

(declare-fun res!744641 () Bool)

(assert (=> start!97622 (=> (not res!744641) (not e!635571))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97622 (= res!744641 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35452 _keys!1208))))))

(assert (=> start!97622 e!635571))

(declare-fun array_inv!26906 (array!72522) Bool)

(assert (=> start!97622 (array_inv!26906 _keys!1208)))

(assert (=> start!97622 true))

(declare-fun array_inv!26907 (array!72520) Bool)

(assert (=> start!97622 (and (array_inv!26907 _values!996) e!635574)))

(declare-fun b!1115363 () Bool)

(declare-fun res!744637 () Bool)

(assert (=> b!1115363 (=> (not res!744637) (not e!635571))))

(assert (=> b!1115363 (= res!744637 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35452 _keys!1208))))))

(assert (= (and start!97622 res!744641) b!1115362))

(assert (= (and b!1115362 res!744642) b!1115359))

(assert (= (and b!1115359 res!744635) b!1115367))

(assert (= (and b!1115367 res!744638) b!1115364))

(assert (= (and b!1115364 res!744640) b!1115363))

(assert (= (and b!1115363 res!744637) b!1115358))

(assert (= (and b!1115358 res!744639) b!1115366))

(assert (= (and b!1115366 res!744643) b!1115360))

(assert (= (and b!1115360 res!744636) b!1115361))

(assert (= (and b!1115361 res!744634) b!1115365))

(assert (= (and b!1115357 condMapEmpty!43606) mapIsEmpty!43606))

(assert (= (and b!1115357 (not condMapEmpty!43606)) mapNonEmpty!43606))

(get-info :version)

(assert (= (and mapNonEmpty!43606 ((_ is ValueCellFull!13220) mapValue!43606)) b!1115355))

(assert (= (and b!1115357 ((_ is ValueCellFull!13220) mapDefault!43606)) b!1115356))

(assert (= start!97622 b!1115357))

(declare-fun m!1031385 () Bool)

(assert (=> b!1115361 m!1031385))

(declare-fun m!1031387 () Bool)

(assert (=> b!1115367 m!1031387))

(declare-fun m!1031389 () Bool)

(assert (=> b!1115358 m!1031389))

(declare-fun m!1031391 () Bool)

(assert (=> b!1115360 m!1031391))

(declare-fun m!1031393 () Bool)

(assert (=> b!1115360 m!1031393))

(declare-fun m!1031395 () Bool)

(assert (=> b!1115362 m!1031395))

(declare-fun m!1031397 () Bool)

(assert (=> b!1115365 m!1031397))

(declare-fun m!1031399 () Bool)

(assert (=> b!1115365 m!1031399))

(declare-fun m!1031401 () Bool)

(assert (=> mapNonEmpty!43606 m!1031401))

(declare-fun m!1031403 () Bool)

(assert (=> start!97622 m!1031403))

(declare-fun m!1031405 () Bool)

(assert (=> start!97622 m!1031405))

(declare-fun m!1031407 () Bool)

(assert (=> b!1115366 m!1031407))

(declare-fun m!1031409 () Bool)

(assert (=> b!1115364 m!1031409))

(check-sat (not b!1115361) (not b!1115367) (not b!1115362) (not mapNonEmpty!43606) (not b!1115360) tp_is_empty!27859 (not b!1115364) (not start!97622) (not b!1115358) (not b!1115365))
(check-sat)
