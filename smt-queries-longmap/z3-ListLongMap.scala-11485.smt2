; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133710 () Bool)

(assert start!133710)

(declare-fun b_free!32073 () Bool)

(declare-fun b_next!32073 () Bool)

(assert (=> start!133710 (= b_free!32073 (not b_next!32073))))

(declare-fun tp!113424 () Bool)

(declare-fun b_and!51643 () Bool)

(assert (=> start!133710 (= tp!113424 b_and!51643)))

(declare-fun b!1563365 () Bool)

(declare-fun res!1068795 () Bool)

(declare-fun e!871311 () Bool)

(assert (=> b!1563365 (=> (not res!1068795) (not e!871311))))

(declare-datatypes ((array!104282 0))(
  ( (array!104283 (arr!50333 (Array (_ BitVec 32) (_ BitVec 64))) (size!50883 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104282)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563365 (= res!1068795 (not (validKeyInArray!0 (select (arr!50333 _keys!637) from!782))))))

(declare-fun mapNonEmpty!59565 () Bool)

(declare-fun mapRes!59565 () Bool)

(declare-fun tp!113423 () Bool)

(declare-fun e!871308 () Bool)

(assert (=> mapNonEmpty!59565 (= mapRes!59565 (and tp!113423 e!871308))))

(declare-datatypes ((V!59931 0))(
  ( (V!59932 (val!19480 Int)) )
))
(declare-datatypes ((ValueCell!18366 0))(
  ( (ValueCellFull!18366 (v!22232 V!59931)) (EmptyCell!18366) )
))
(declare-fun mapRest!59565 () (Array (_ BitVec 32) ValueCell!18366))

(declare-fun mapKey!59565 () (_ BitVec 32))

(declare-datatypes ((array!104284 0))(
  ( (array!104285 (arr!50334 (Array (_ BitVec 32) ValueCell!18366)) (size!50884 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104284)

(declare-fun mapValue!59565 () ValueCell!18366)

(assert (=> mapNonEmpty!59565 (= (arr!50334 _values!487) (store mapRest!59565 mapKey!59565 mapValue!59565))))

(declare-fun b!1563366 () Bool)

(declare-fun res!1068794 () Bool)

(assert (=> b!1563366 (=> (not res!1068794) (not e!871311))))

(assert (=> b!1563366 (= res!1068794 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50883 _keys!637)) (bvslt from!782 (size!50883 _keys!637))))))

(declare-fun b!1563367 () Bool)

(declare-fun res!1068796 () Bool)

(assert (=> b!1563367 (=> (not res!1068796) (not e!871311))))

(declare-datatypes ((List!36517 0))(
  ( (Nil!36514) (Cons!36513 (h!37959 (_ BitVec 64)) (t!51364 List!36517)) )
))
(declare-fun arrayNoDuplicates!0 (array!104282 (_ BitVec 32) List!36517) Bool)

(assert (=> b!1563367 (= res!1068796 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36514))))

(declare-fun b!1563368 () Bool)

(declare-fun tp_is_empty!38793 () Bool)

(assert (=> b!1563368 (= e!871308 tp_is_empty!38793)))

(declare-fun res!1068793 () Bool)

(assert (=> start!133710 (=> (not res!1068793) (not e!871311))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133710 (= res!1068793 (validMask!0 mask!947))))

(assert (=> start!133710 e!871311))

(assert (=> start!133710 tp!113424))

(assert (=> start!133710 tp_is_empty!38793))

(assert (=> start!133710 true))

(declare-fun array_inv!39119 (array!104282) Bool)

(assert (=> start!133710 (array_inv!39119 _keys!637)))

(declare-fun e!871312 () Bool)

(declare-fun array_inv!39120 (array!104284) Bool)

(assert (=> start!133710 (and (array_inv!39120 _values!487) e!871312)))

(declare-fun b!1563369 () Bool)

(declare-fun e!871307 () Bool)

(assert (=> b!1563369 (= e!871311 e!871307)))

(declare-fun res!1068797 () Bool)

(assert (=> b!1563369 (=> (not res!1068797) (not e!871307))))

(declare-datatypes ((tuple2!25134 0))(
  ( (tuple2!25135 (_1!12578 (_ BitVec 64)) (_2!12578 V!59931)) )
))
(declare-datatypes ((List!36518 0))(
  ( (Nil!36515) (Cons!36514 (h!37960 tuple2!25134) (t!51365 List!36518)) )
))
(declare-datatypes ((ListLongMap!22569 0))(
  ( (ListLongMap!22570 (toList!11300 List!36518)) )
))
(declare-fun lt!671873 () ListLongMap!22569)

(declare-fun contains!10290 (ListLongMap!22569 (_ BitVec 64)) Bool)

(assert (=> b!1563369 (= res!1068797 (not (contains!10290 lt!671873 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59931)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59931)

(declare-fun getCurrentListMapNoExtraKeys!6683 (array!104282 array!104284 (_ BitVec 32) (_ BitVec 32) V!59931 V!59931 (_ BitVec 32) Int) ListLongMap!22569)

(assert (=> b!1563369 (= lt!671873 (getCurrentListMapNoExtraKeys!6683 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563370 () Bool)

(declare-fun res!1068798 () Bool)

(assert (=> b!1563370 (=> (not res!1068798) (not e!871311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104282 (_ BitVec 32)) Bool)

(assert (=> b!1563370 (= res!1068798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59565 () Bool)

(assert (=> mapIsEmpty!59565 mapRes!59565))

(declare-fun b!1563371 () Bool)

(assert (=> b!1563371 (= e!871307 false)))

(declare-fun lt!671874 () Bool)

(assert (=> b!1563371 (= lt!671874 (contains!10290 lt!671873 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563372 () Bool)

(declare-fun e!871309 () Bool)

(assert (=> b!1563372 (= e!871312 (and e!871309 mapRes!59565))))

(declare-fun condMapEmpty!59565 () Bool)

(declare-fun mapDefault!59565 () ValueCell!18366)

(assert (=> b!1563372 (= condMapEmpty!59565 (= (arr!50334 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18366)) mapDefault!59565)))))

(declare-fun b!1563373 () Bool)

(declare-fun res!1068792 () Bool)

(assert (=> b!1563373 (=> (not res!1068792) (not e!871311))))

(assert (=> b!1563373 (= res!1068792 (and (= (size!50884 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50883 _keys!637) (size!50884 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563374 () Bool)

(assert (=> b!1563374 (= e!871309 tp_is_empty!38793)))

(assert (= (and start!133710 res!1068793) b!1563373))

(assert (= (and b!1563373 res!1068792) b!1563370))

(assert (= (and b!1563370 res!1068798) b!1563367))

(assert (= (and b!1563367 res!1068796) b!1563366))

(assert (= (and b!1563366 res!1068794) b!1563365))

(assert (= (and b!1563365 res!1068795) b!1563369))

(assert (= (and b!1563369 res!1068797) b!1563371))

(assert (= (and b!1563372 condMapEmpty!59565) mapIsEmpty!59565))

(assert (= (and b!1563372 (not condMapEmpty!59565)) mapNonEmpty!59565))

(get-info :version)

(assert (= (and mapNonEmpty!59565 ((_ is ValueCellFull!18366) mapValue!59565)) b!1563368))

(assert (= (and b!1563372 ((_ is ValueCellFull!18366) mapDefault!59565)) b!1563374))

(assert (= start!133710 b!1563372))

(declare-fun m!1438907 () Bool)

(assert (=> mapNonEmpty!59565 m!1438907))

(declare-fun m!1438909 () Bool)

(assert (=> b!1563370 m!1438909))

(declare-fun m!1438911 () Bool)

(assert (=> start!133710 m!1438911))

(declare-fun m!1438913 () Bool)

(assert (=> start!133710 m!1438913))

(declare-fun m!1438915 () Bool)

(assert (=> start!133710 m!1438915))

(declare-fun m!1438917 () Bool)

(assert (=> b!1563365 m!1438917))

(assert (=> b!1563365 m!1438917))

(declare-fun m!1438919 () Bool)

(assert (=> b!1563365 m!1438919))

(declare-fun m!1438921 () Bool)

(assert (=> b!1563371 m!1438921))

(declare-fun m!1438923 () Bool)

(assert (=> b!1563367 m!1438923))

(declare-fun m!1438925 () Bool)

(assert (=> b!1563369 m!1438925))

(declare-fun m!1438927 () Bool)

(assert (=> b!1563369 m!1438927))

(check-sat (not mapNonEmpty!59565) (not b!1563371) (not b!1563370) (not b!1563367) (not b_next!32073) (not b!1563365) (not start!133710) (not b!1563369) tp_is_empty!38793 b_and!51643)
(check-sat b_and!51643 (not b_next!32073))
