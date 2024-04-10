; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97738 () Bool)

(assert start!97738)

(declare-fun b_free!23439 () Bool)

(declare-fun b_next!23439 () Bool)

(assert (=> start!97738 (= b_free!23439 (not b_next!23439))))

(declare-fun tp!83020 () Bool)

(declare-fun b_and!37713 () Bool)

(assert (=> start!97738 (= tp!83020 b_and!37713)))

(declare-fun b!1117634 () Bool)

(declare-fun res!746358 () Bool)

(declare-fun e!636648 () Bool)

(assert (=> b!1117634 (=> (not res!746358) (not e!636648))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72829 0))(
  ( (array!72830 (arr!35067 (Array (_ BitVec 32) (_ BitVec 64))) (size!35603 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72829)

(assert (=> b!1117634 (= res!746358 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35603 _keys!1208))))))

(declare-fun b!1117635 () Bool)

(declare-fun res!746367 () Bool)

(assert (=> b!1117635 (=> (not res!746367) (not e!636648))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42419 0))(
  ( (V!42420 (val!14041 Int)) )
))
(declare-datatypes ((ValueCell!13275 0))(
  ( (ValueCellFull!13275 (v!16674 V!42419)) (EmptyCell!13275) )
))
(declare-datatypes ((array!72831 0))(
  ( (array!72832 (arr!35068 (Array (_ BitVec 32) ValueCell!13275)) (size!35604 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72831)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1117635 (= res!746367 (and (= (size!35604 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35603 _keys!1208) (size!35604 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117636 () Bool)

(declare-fun res!746365 () Bool)

(declare-fun e!636646 () Bool)

(assert (=> b!1117636 (=> (not res!746365) (not e!636646))))

(declare-fun lt!497324 () array!72829)

(declare-datatypes ((List!24390 0))(
  ( (Nil!24387) (Cons!24386 (h!25595 (_ BitVec 64)) (t!34871 List!24390)) )
))
(declare-fun arrayNoDuplicates!0 (array!72829 (_ BitVec 32) List!24390) Bool)

(assert (=> b!1117636 (= res!746365 (arrayNoDuplicates!0 lt!497324 #b00000000000000000000000000000000 Nil!24387))))

(declare-fun b!1117637 () Bool)

(declare-fun res!746366 () Bool)

(assert (=> b!1117637 (=> (not res!746366) (not e!636648))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117637 (= res!746366 (validKeyInArray!0 k0!934))))

(declare-fun b!1117638 () Bool)

(declare-fun res!746360 () Bool)

(assert (=> b!1117638 (=> (not res!746360) (not e!636648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72829 (_ BitVec 32)) Bool)

(assert (=> b!1117638 (= res!746360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117639 () Bool)

(declare-fun e!636647 () Bool)

(declare-fun e!636650 () Bool)

(declare-fun mapRes!43771 () Bool)

(assert (=> b!1117639 (= e!636647 (and e!636650 mapRes!43771))))

(declare-fun condMapEmpty!43771 () Bool)

(declare-fun mapDefault!43771 () ValueCell!13275)

(assert (=> b!1117639 (= condMapEmpty!43771 (= (arr!35068 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13275)) mapDefault!43771)))))

(declare-fun b!1117640 () Bool)

(declare-fun e!636649 () Bool)

(assert (=> b!1117640 (= e!636649 true)))

(declare-fun zeroValue!944 () V!42419)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17604 0))(
  ( (tuple2!17605 (_1!8813 (_ BitVec 64)) (_2!8813 V!42419)) )
))
(declare-datatypes ((List!24391 0))(
  ( (Nil!24388) (Cons!24387 (h!25596 tuple2!17604) (t!34872 List!24391)) )
))
(declare-datatypes ((ListLongMap!15573 0))(
  ( (ListLongMap!15574 (toList!7802 List!24391)) )
))
(declare-fun lt!497323 () ListLongMap!15573)

(declare-fun minValue!944 () V!42419)

(declare-fun getCurrentListMapNoExtraKeys!4292 (array!72829 array!72831 (_ BitVec 32) (_ BitVec 32) V!42419 V!42419 (_ BitVec 32) Int) ListLongMap!15573)

(assert (=> b!1117640 (= lt!497323 (getCurrentListMapNoExtraKeys!4292 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1117641 () Bool)

(declare-fun tp_is_empty!27969 () Bool)

(assert (=> b!1117641 (= e!636650 tp_is_empty!27969)))

(declare-fun b!1117642 () Bool)

(declare-fun res!746363 () Bool)

(assert (=> b!1117642 (=> (not res!746363) (not e!636648))))

(assert (=> b!1117642 (= res!746363 (= (select (arr!35067 _keys!1208) i!673) k0!934))))

(declare-fun b!1117643 () Bool)

(assert (=> b!1117643 (= e!636646 (not e!636649))))

(declare-fun res!746361 () Bool)

(assert (=> b!1117643 (=> res!746361 e!636649)))

(assert (=> b!1117643 (= res!746361 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117643 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36676 0))(
  ( (Unit!36677) )
))
(declare-fun lt!497322 () Unit!36676)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72829 (_ BitVec 64) (_ BitVec 32)) Unit!36676)

(assert (=> b!1117643 (= lt!497322 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117644 () Bool)

(declare-fun res!746364 () Bool)

(assert (=> b!1117644 (=> (not res!746364) (not e!636648))))

(assert (=> b!1117644 (= res!746364 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24387))))

(declare-fun res!746368 () Bool)

(assert (=> start!97738 (=> (not res!746368) (not e!636648))))

(assert (=> start!97738 (= res!746368 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35603 _keys!1208))))))

(assert (=> start!97738 e!636648))

(assert (=> start!97738 tp_is_empty!27969))

(declare-fun array_inv!26944 (array!72829) Bool)

(assert (=> start!97738 (array_inv!26944 _keys!1208)))

(assert (=> start!97738 true))

(assert (=> start!97738 tp!83020))

(declare-fun array_inv!26945 (array!72831) Bool)

(assert (=> start!97738 (and (array_inv!26945 _values!996) e!636647)))

(declare-fun mapNonEmpty!43771 () Bool)

(declare-fun tp!83021 () Bool)

(declare-fun e!636645 () Bool)

(assert (=> mapNonEmpty!43771 (= mapRes!43771 (and tp!83021 e!636645))))

(declare-fun mapValue!43771 () ValueCell!13275)

(declare-fun mapRest!43771 () (Array (_ BitVec 32) ValueCell!13275))

(declare-fun mapKey!43771 () (_ BitVec 32))

(assert (=> mapNonEmpty!43771 (= (arr!35068 _values!996) (store mapRest!43771 mapKey!43771 mapValue!43771))))

(declare-fun mapIsEmpty!43771 () Bool)

(assert (=> mapIsEmpty!43771 mapRes!43771))

(declare-fun b!1117645 () Bool)

(assert (=> b!1117645 (= e!636648 e!636646)))

(declare-fun res!746362 () Bool)

(assert (=> b!1117645 (=> (not res!746362) (not e!636646))))

(assert (=> b!1117645 (= res!746362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497324 mask!1564))))

(assert (=> b!1117645 (= lt!497324 (array!72830 (store (arr!35067 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35603 _keys!1208)))))

(declare-fun b!1117646 () Bool)

(declare-fun res!746359 () Bool)

(assert (=> b!1117646 (=> (not res!746359) (not e!636648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117646 (= res!746359 (validMask!0 mask!1564))))

(declare-fun b!1117647 () Bool)

(assert (=> b!1117647 (= e!636645 tp_is_empty!27969)))

(assert (= (and start!97738 res!746368) b!1117646))

(assert (= (and b!1117646 res!746359) b!1117635))

(assert (= (and b!1117635 res!746367) b!1117638))

(assert (= (and b!1117638 res!746360) b!1117644))

(assert (= (and b!1117644 res!746364) b!1117634))

(assert (= (and b!1117634 res!746358) b!1117637))

(assert (= (and b!1117637 res!746366) b!1117642))

(assert (= (and b!1117642 res!746363) b!1117645))

(assert (= (and b!1117645 res!746362) b!1117636))

(assert (= (and b!1117636 res!746365) b!1117643))

(assert (= (and b!1117643 (not res!746361)) b!1117640))

(assert (= (and b!1117639 condMapEmpty!43771) mapIsEmpty!43771))

(assert (= (and b!1117639 (not condMapEmpty!43771)) mapNonEmpty!43771))

(get-info :version)

(assert (= (and mapNonEmpty!43771 ((_ is ValueCellFull!13275) mapValue!43771)) b!1117647))

(assert (= (and b!1117639 ((_ is ValueCellFull!13275) mapDefault!43771)) b!1117641))

(assert (= start!97738 b!1117639))

(declare-fun m!1033443 () Bool)

(assert (=> start!97738 m!1033443))

(declare-fun m!1033445 () Bool)

(assert (=> start!97738 m!1033445))

(declare-fun m!1033447 () Bool)

(assert (=> b!1117644 m!1033447))

(declare-fun m!1033449 () Bool)

(assert (=> b!1117638 m!1033449))

(declare-fun m!1033451 () Bool)

(assert (=> b!1117640 m!1033451))

(declare-fun m!1033453 () Bool)

(assert (=> b!1117643 m!1033453))

(declare-fun m!1033455 () Bool)

(assert (=> b!1117643 m!1033455))

(declare-fun m!1033457 () Bool)

(assert (=> b!1117637 m!1033457))

(declare-fun m!1033459 () Bool)

(assert (=> b!1117636 m!1033459))

(declare-fun m!1033461 () Bool)

(assert (=> b!1117642 m!1033461))

(declare-fun m!1033463 () Bool)

(assert (=> b!1117646 m!1033463))

(declare-fun m!1033465 () Bool)

(assert (=> mapNonEmpty!43771 m!1033465))

(declare-fun m!1033467 () Bool)

(assert (=> b!1117645 m!1033467))

(declare-fun m!1033469 () Bool)

(assert (=> b!1117645 m!1033469))

(check-sat (not mapNonEmpty!43771) (not b!1117637) (not b_next!23439) (not start!97738) b_and!37713 (not b!1117645) (not b!1117638) tp_is_empty!27969 (not b!1117636) (not b!1117646) (not b!1117640) (not b!1117643) (not b!1117644))
(check-sat b_and!37713 (not b_next!23439))
