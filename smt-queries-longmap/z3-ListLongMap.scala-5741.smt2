; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74442 () Bool)

(assert start!74442)

(declare-fun b_free!15037 () Bool)

(declare-fun b_next!15037 () Bool)

(assert (=> start!74442 (= b_free!15037 (not b_next!15037))))

(declare-fun tp!52787 () Bool)

(declare-fun b_and!24823 () Bool)

(assert (=> start!74442 (= tp!52787 b_and!24823)))

(declare-fun b!874688 () Bool)

(declare-fun res!594120 () Bool)

(declare-fun e!487155 () Bool)

(assert (=> b!874688 (=> (not res!594120) (not e!487155))))

(declare-datatypes ((array!50745 0))(
  ( (array!50746 (arr!24396 (Array (_ BitVec 32) (_ BitVec 64))) (size!24837 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50745)

(declare-datatypes ((List!17254 0))(
  ( (Nil!17251) (Cons!17250 (h!18387 (_ BitVec 64)) (t!24287 List!17254)) )
))
(declare-fun arrayNoDuplicates!0 (array!50745 (_ BitVec 32) List!17254) Bool)

(assert (=> b!874688 (= res!594120 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17251))))

(declare-fun mapIsEmpty!27530 () Bool)

(declare-fun mapRes!27530 () Bool)

(assert (=> mapIsEmpty!27530 mapRes!27530))

(declare-fun b!874689 () Bool)

(declare-fun e!487153 () Bool)

(declare-fun e!487154 () Bool)

(assert (=> b!874689 (= e!487153 (and e!487154 mapRes!27530))))

(declare-fun condMapEmpty!27530 () Bool)

(declare-datatypes ((V!28089 0))(
  ( (V!28090 (val!8688 Int)) )
))
(declare-datatypes ((ValueCell!8201 0))(
  ( (ValueCellFull!8201 (v!11117 V!28089)) (EmptyCell!8201) )
))
(declare-datatypes ((array!50747 0))(
  ( (array!50748 (arr!24397 (Array (_ BitVec 32) ValueCell!8201)) (size!24838 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50747)

(declare-fun mapDefault!27530 () ValueCell!8201)

(assert (=> b!874689 (= condMapEmpty!27530 (= (arr!24397 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8201)) mapDefault!27530)))))

(declare-fun b!874690 () Bool)

(declare-fun res!594119 () Bool)

(assert (=> b!874690 (=> (not res!594119) (not e!487155))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50745 (_ BitVec 32)) Bool)

(assert (=> b!874690 (= res!594119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874691 () Bool)

(declare-fun e!487156 () Bool)

(declare-fun tp_is_empty!17281 () Bool)

(assert (=> b!874691 (= e!487156 tp_is_empty!17281)))

(declare-fun b!874692 () Bool)

(declare-fun res!594115 () Bool)

(assert (=> b!874692 (=> (not res!594115) (not e!487155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874692 (= res!594115 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27530 () Bool)

(declare-fun tp!52786 () Bool)

(assert (=> mapNonEmpty!27530 (= mapRes!27530 (and tp!52786 e!487156))))

(declare-fun mapKey!27530 () (_ BitVec 32))

(declare-fun mapRest!27530 () (Array (_ BitVec 32) ValueCell!8201))

(declare-fun mapValue!27530 () ValueCell!8201)

(assert (=> mapNonEmpty!27530 (= (arr!24397 _values!688) (store mapRest!27530 mapKey!27530 mapValue!27530))))

(declare-fun b!874694 () Bool)

(declare-fun res!594121 () Bool)

(assert (=> b!874694 (=> (not res!594121) (not e!487155))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!874694 (= res!594121 (and (= (size!24838 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24837 _keys!868) (size!24838 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874695 () Bool)

(declare-fun res!594117 () Bool)

(assert (=> b!874695 (=> (not res!594117) (not e!487155))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874695 (= res!594117 (validKeyInArray!0 k0!854))))

(declare-fun b!874696 () Bool)

(declare-fun res!594118 () Bool)

(assert (=> b!874696 (=> (not res!594118) (not e!487155))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874696 (= res!594118 (and (= (select (arr!24396 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874697 () Bool)

(assert (=> b!874697 (= e!487154 tp_is_empty!17281)))

(declare-fun b!874698 () Bool)

(declare-fun res!594116 () Bool)

(assert (=> b!874698 (=> (not res!594116) (not e!487155))))

(assert (=> b!874698 (= res!594116 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24837 _keys!868))))))

(declare-fun b!874693 () Bool)

(assert (=> b!874693 (= e!487155 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11406 0))(
  ( (tuple2!11407 (_1!5714 (_ BitVec 64)) (_2!5714 V!28089)) )
))
(declare-datatypes ((List!17255 0))(
  ( (Nil!17252) (Cons!17251 (h!18388 tuple2!11406) (t!24288 List!17255)) )
))
(declare-datatypes ((ListLongMap!10177 0))(
  ( (ListLongMap!10178 (toList!5104 List!17255)) )
))
(declare-fun lt!396186 () ListLongMap!10177)

(declare-fun minValue!654 () V!28089)

(declare-fun zeroValue!654 () V!28089)

(declare-fun v!557 () V!28089)

(declare-fun getCurrentListMapNoExtraKeys!3147 (array!50745 array!50747 (_ BitVec 32) (_ BitVec 32) V!28089 V!28089 (_ BitVec 32) Int) ListLongMap!10177)

(assert (=> b!874693 (= lt!396186 (getCurrentListMapNoExtraKeys!3147 _keys!868 (array!50748 (store (arr!24397 _values!688) i!612 (ValueCellFull!8201 v!557)) (size!24838 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396185 () ListLongMap!10177)

(assert (=> b!874693 (= lt!396185 (getCurrentListMapNoExtraKeys!3147 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!594122 () Bool)

(assert (=> start!74442 (=> (not res!594122) (not e!487155))))

(assert (=> start!74442 (= res!594122 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24837 _keys!868))))))

(assert (=> start!74442 e!487155))

(assert (=> start!74442 tp_is_empty!17281))

(assert (=> start!74442 true))

(assert (=> start!74442 tp!52787))

(declare-fun array_inv!19300 (array!50745) Bool)

(assert (=> start!74442 (array_inv!19300 _keys!868)))

(declare-fun array_inv!19301 (array!50747) Bool)

(assert (=> start!74442 (and (array_inv!19301 _values!688) e!487153)))

(assert (= (and start!74442 res!594122) b!874692))

(assert (= (and b!874692 res!594115) b!874694))

(assert (= (and b!874694 res!594121) b!874690))

(assert (= (and b!874690 res!594119) b!874688))

(assert (= (and b!874688 res!594120) b!874698))

(assert (= (and b!874698 res!594116) b!874695))

(assert (= (and b!874695 res!594117) b!874696))

(assert (= (and b!874696 res!594118) b!874693))

(assert (= (and b!874689 condMapEmpty!27530) mapIsEmpty!27530))

(assert (= (and b!874689 (not condMapEmpty!27530)) mapNonEmpty!27530))

(get-info :version)

(assert (= (and mapNonEmpty!27530 ((_ is ValueCellFull!8201) mapValue!27530)) b!874691))

(assert (= (and b!874689 ((_ is ValueCellFull!8201) mapDefault!27530)) b!874697))

(assert (= start!74442 b!874689))

(declare-fun m!815461 () Bool)

(assert (=> b!874692 m!815461))

(declare-fun m!815463 () Bool)

(assert (=> b!874688 m!815463))

(declare-fun m!815465 () Bool)

(assert (=> b!874696 m!815465))

(declare-fun m!815467 () Bool)

(assert (=> b!874695 m!815467))

(declare-fun m!815469 () Bool)

(assert (=> mapNonEmpty!27530 m!815469))

(declare-fun m!815471 () Bool)

(assert (=> b!874690 m!815471))

(declare-fun m!815473 () Bool)

(assert (=> b!874693 m!815473))

(declare-fun m!815475 () Bool)

(assert (=> b!874693 m!815475))

(declare-fun m!815477 () Bool)

(assert (=> b!874693 m!815477))

(declare-fun m!815479 () Bool)

(assert (=> start!74442 m!815479))

(declare-fun m!815481 () Bool)

(assert (=> start!74442 m!815481))

(check-sat (not b!874692) (not b!874693) (not b!874695) (not b!874690) b_and!24823 tp_is_empty!17281 (not mapNonEmpty!27530) (not b_next!15037) (not b!874688) (not start!74442))
(check-sat b_and!24823 (not b_next!15037))
