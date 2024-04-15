; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73912 () Bool)

(assert start!73912)

(declare-fun b_free!14845 () Bool)

(declare-fun b_next!14845 () Bool)

(assert (=> start!73912 (= b_free!14845 (not b_next!14845))))

(declare-fun tp!52039 () Bool)

(declare-fun b_and!24571 () Bool)

(assert (=> start!73912 (= tp!52039 b_and!24571)))

(declare-fun b!868624 () Bool)

(declare-fun res!590314 () Bool)

(declare-fun e!483754 () Bool)

(assert (=> b!868624 (=> (not res!590314) (not e!483754))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50105 0))(
  ( (array!50106 (arr!24084 (Array (_ BitVec 32) (_ BitVec 64))) (size!24526 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50105)

(declare-datatypes ((V!27689 0))(
  ( (V!27690 (val!8538 Int)) )
))
(declare-datatypes ((ValueCell!8051 0))(
  ( (ValueCellFull!8051 (v!10957 V!27689)) (EmptyCell!8051) )
))
(declare-datatypes ((array!50107 0))(
  ( (array!50108 (arr!24085 (Array (_ BitVec 32) ValueCell!8051)) (size!24527 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50107)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!868624 (= res!590314 (and (= (size!24527 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24526 _keys!868) (size!24527 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868625 () Bool)

(declare-fun res!590313 () Bool)

(assert (=> b!868625 (=> (not res!590313) (not e!483754))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868625 (= res!590313 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24526 _keys!868))))))

(declare-fun b!868626 () Bool)

(declare-fun res!590315 () Bool)

(assert (=> b!868626 (=> (not res!590315) (not e!483754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868626 (= res!590315 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27071 () Bool)

(declare-fun mapRes!27071 () Bool)

(declare-fun tp!52040 () Bool)

(declare-fun e!483756 () Bool)

(assert (=> mapNonEmpty!27071 (= mapRes!27071 (and tp!52040 e!483756))))

(declare-fun mapValue!27071 () ValueCell!8051)

(declare-fun mapKey!27071 () (_ BitVec 32))

(declare-fun mapRest!27071 () (Array (_ BitVec 32) ValueCell!8051))

(assert (=> mapNonEmpty!27071 (= (arr!24085 _values!688) (store mapRest!27071 mapKey!27071 mapValue!27071))))

(declare-fun b!868627 () Bool)

(declare-fun res!590317 () Bool)

(assert (=> b!868627 (=> (not res!590317) (not e!483754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50105 (_ BitVec 32)) Bool)

(assert (=> b!868627 (= res!590317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868628 () Bool)

(declare-fun e!483758 () Bool)

(declare-fun e!483757 () Bool)

(assert (=> b!868628 (= e!483758 (and e!483757 mapRes!27071))))

(declare-fun condMapEmpty!27071 () Bool)

(declare-fun mapDefault!27071 () ValueCell!8051)

(assert (=> b!868628 (= condMapEmpty!27071 (= (arr!24085 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8051)) mapDefault!27071)))))

(declare-fun b!868629 () Bool)

(declare-fun res!590316 () Bool)

(assert (=> b!868629 (=> (not res!590316) (not e!483754))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!868629 (= res!590316 (and (= (select (arr!24084 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!590311 () Bool)

(assert (=> start!73912 (=> (not res!590311) (not e!483754))))

(assert (=> start!73912 (= res!590311 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24526 _keys!868))))))

(assert (=> start!73912 e!483754))

(declare-fun tp_is_empty!16981 () Bool)

(assert (=> start!73912 tp_is_empty!16981))

(assert (=> start!73912 true))

(assert (=> start!73912 tp!52039))

(declare-fun array_inv!19094 (array!50105) Bool)

(assert (=> start!73912 (array_inv!19094 _keys!868)))

(declare-fun array_inv!19095 (array!50107) Bool)

(assert (=> start!73912 (and (array_inv!19095 _values!688) e!483758)))

(declare-fun b!868630 () Bool)

(assert (=> b!868630 (= e!483756 tp_is_empty!16981)))

(declare-fun b!868631 () Bool)

(assert (=> b!868631 (= e!483757 tp_is_empty!16981)))

(declare-fun mapIsEmpty!27071 () Bool)

(assert (=> mapIsEmpty!27071 mapRes!27071))

(declare-fun b!868632 () Bool)

(declare-fun e!483755 () Bool)

(assert (=> b!868632 (= e!483755 (not true))))

(declare-fun v!557 () V!27689)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394374 () array!50107)

(declare-fun minValue!654 () V!27689)

(declare-fun zeroValue!654 () V!27689)

(declare-datatypes ((tuple2!11358 0))(
  ( (tuple2!11359 (_1!5690 (_ BitVec 64)) (_2!5690 V!27689)) )
))
(declare-datatypes ((List!17142 0))(
  ( (Nil!17139) (Cons!17138 (h!18269 tuple2!11358) (t!24170 List!17142)) )
))
(declare-datatypes ((ListLongMap!10117 0))(
  ( (ListLongMap!10118 (toList!5074 List!17142)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3067 (array!50105 array!50107 (_ BitVec 32) (_ BitVec 32) V!27689 V!27689 (_ BitVec 32) Int) ListLongMap!10117)

(declare-fun +!2436 (ListLongMap!10117 tuple2!11358) ListLongMap!10117)

(assert (=> b!868632 (= (getCurrentListMapNoExtraKeys!3067 _keys!868 lt!394374 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2436 (getCurrentListMapNoExtraKeys!3067 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11359 k0!854 v!557)))))

(declare-datatypes ((Unit!29759 0))(
  ( (Unit!29760) )
))
(declare-fun lt!394373 () Unit!29759)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!604 (array!50105 array!50107 (_ BitVec 32) (_ BitVec 32) V!27689 V!27689 (_ BitVec 32) (_ BitVec 64) V!27689 (_ BitVec 32) Int) Unit!29759)

(assert (=> b!868632 (= lt!394373 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!604 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868633 () Bool)

(declare-fun res!590312 () Bool)

(assert (=> b!868633 (=> (not res!590312) (not e!483754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868633 (= res!590312 (validKeyInArray!0 k0!854))))

(declare-fun b!868634 () Bool)

(assert (=> b!868634 (= e!483754 e!483755)))

(declare-fun res!590319 () Bool)

(assert (=> b!868634 (=> (not res!590319) (not e!483755))))

(assert (=> b!868634 (= res!590319 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394375 () ListLongMap!10117)

(assert (=> b!868634 (= lt!394375 (getCurrentListMapNoExtraKeys!3067 _keys!868 lt!394374 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868634 (= lt!394374 (array!50108 (store (arr!24085 _values!688) i!612 (ValueCellFull!8051 v!557)) (size!24527 _values!688)))))

(declare-fun lt!394376 () ListLongMap!10117)

(assert (=> b!868634 (= lt!394376 (getCurrentListMapNoExtraKeys!3067 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868635 () Bool)

(declare-fun res!590318 () Bool)

(assert (=> b!868635 (=> (not res!590318) (not e!483754))))

(declare-datatypes ((List!17143 0))(
  ( (Nil!17140) (Cons!17139 (h!18270 (_ BitVec 64)) (t!24171 List!17143)) )
))
(declare-fun arrayNoDuplicates!0 (array!50105 (_ BitVec 32) List!17143) Bool)

(assert (=> b!868635 (= res!590318 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17140))))

(assert (= (and start!73912 res!590311) b!868626))

(assert (= (and b!868626 res!590315) b!868624))

(assert (= (and b!868624 res!590314) b!868627))

(assert (= (and b!868627 res!590317) b!868635))

(assert (= (and b!868635 res!590318) b!868625))

(assert (= (and b!868625 res!590313) b!868633))

(assert (= (and b!868633 res!590312) b!868629))

(assert (= (and b!868629 res!590316) b!868634))

(assert (= (and b!868634 res!590319) b!868632))

(assert (= (and b!868628 condMapEmpty!27071) mapIsEmpty!27071))

(assert (= (and b!868628 (not condMapEmpty!27071)) mapNonEmpty!27071))

(get-info :version)

(assert (= (and mapNonEmpty!27071 ((_ is ValueCellFull!8051) mapValue!27071)) b!868630))

(assert (= (and b!868628 ((_ is ValueCellFull!8051) mapDefault!27071)) b!868631))

(assert (= start!73912 b!868628))

(declare-fun m!809739 () Bool)

(assert (=> b!868634 m!809739))

(declare-fun m!809741 () Bool)

(assert (=> b!868634 m!809741))

(declare-fun m!809743 () Bool)

(assert (=> b!868634 m!809743))

(declare-fun m!809745 () Bool)

(assert (=> mapNonEmpty!27071 m!809745))

(declare-fun m!809747 () Bool)

(assert (=> start!73912 m!809747))

(declare-fun m!809749 () Bool)

(assert (=> start!73912 m!809749))

(declare-fun m!809751 () Bool)

(assert (=> b!868633 m!809751))

(declare-fun m!809753 () Bool)

(assert (=> b!868632 m!809753))

(declare-fun m!809755 () Bool)

(assert (=> b!868632 m!809755))

(assert (=> b!868632 m!809755))

(declare-fun m!809757 () Bool)

(assert (=> b!868632 m!809757))

(declare-fun m!809759 () Bool)

(assert (=> b!868632 m!809759))

(declare-fun m!809761 () Bool)

(assert (=> b!868629 m!809761))

(declare-fun m!809763 () Bool)

(assert (=> b!868627 m!809763))

(declare-fun m!809765 () Bool)

(assert (=> b!868626 m!809765))

(declare-fun m!809767 () Bool)

(assert (=> b!868635 m!809767))

(check-sat (not start!73912) (not b!868634) b_and!24571 (not b!868627) (not b!868635) (not b!868626) tp_is_empty!16981 (not b!868633) (not mapNonEmpty!27071) (not b_next!14845) (not b!868632))
(check-sat b_and!24571 (not b_next!14845))
