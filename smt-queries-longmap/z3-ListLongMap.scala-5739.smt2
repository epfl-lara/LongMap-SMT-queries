; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74430 () Bool)

(assert start!74430)

(declare-fun b_free!15025 () Bool)

(declare-fun b_next!15025 () Bool)

(assert (=> start!74430 (= b_free!15025 (not b_next!15025))))

(declare-fun tp!52750 () Bool)

(declare-fun b_and!24811 () Bool)

(assert (=> start!74430 (= tp!52750 b_and!24811)))

(declare-fun mapIsEmpty!27512 () Bool)

(declare-fun mapRes!27512 () Bool)

(assert (=> mapIsEmpty!27512 mapRes!27512))

(declare-fun b!874490 () Bool)

(declare-fun res!593973 () Bool)

(declare-fun e!487066 () Bool)

(assert (=> b!874490 (=> (not res!593973) (not e!487066))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874490 (= res!593973 (validMask!0 mask!1196))))

(declare-fun b!874491 () Bool)

(declare-fun e!487063 () Bool)

(declare-fun tp_is_empty!17269 () Bool)

(assert (=> b!874491 (= e!487063 tp_is_empty!17269)))

(declare-fun b!874492 () Bool)

(declare-fun e!487067 () Bool)

(assert (=> b!874492 (= e!487067 tp_is_empty!17269)))

(declare-fun b!874494 () Bool)

(declare-fun res!593972 () Bool)

(assert (=> b!874494 (=> (not res!593972) (not e!487066))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50721 0))(
  ( (array!50722 (arr!24384 (Array (_ BitVec 32) (_ BitVec 64))) (size!24825 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50721)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874494 (= res!593972 (and (= (select (arr!24384 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27512 () Bool)

(declare-fun tp!52751 () Bool)

(assert (=> mapNonEmpty!27512 (= mapRes!27512 (and tp!52751 e!487063))))

(declare-fun mapKey!27512 () (_ BitVec 32))

(declare-datatypes ((V!28073 0))(
  ( (V!28074 (val!8682 Int)) )
))
(declare-datatypes ((ValueCell!8195 0))(
  ( (ValueCellFull!8195 (v!11111 V!28073)) (EmptyCell!8195) )
))
(declare-fun mapValue!27512 () ValueCell!8195)

(declare-fun mapRest!27512 () (Array (_ BitVec 32) ValueCell!8195))

(declare-datatypes ((array!50723 0))(
  ( (array!50724 (arr!24385 (Array (_ BitVec 32) ValueCell!8195)) (size!24826 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50723)

(assert (=> mapNonEmpty!27512 (= (arr!24385 _values!688) (store mapRest!27512 mapKey!27512 mapValue!27512))))

(declare-fun b!874495 () Bool)

(declare-fun res!593978 () Bool)

(assert (=> b!874495 (=> (not res!593978) (not e!487066))))

(declare-datatypes ((List!17243 0))(
  ( (Nil!17240) (Cons!17239 (h!18376 (_ BitVec 64)) (t!24276 List!17243)) )
))
(declare-fun arrayNoDuplicates!0 (array!50721 (_ BitVec 32) List!17243) Bool)

(assert (=> b!874495 (= res!593978 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17240))))

(declare-fun b!874496 () Bool)

(declare-fun res!593977 () Bool)

(assert (=> b!874496 (=> (not res!593977) (not e!487066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50721 (_ BitVec 32)) Bool)

(assert (=> b!874496 (= res!593977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874497 () Bool)

(declare-fun res!593975 () Bool)

(assert (=> b!874497 (=> (not res!593975) (not e!487066))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!874497 (= res!593975 (and (= (size!24826 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24825 _keys!868) (size!24826 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874498 () Bool)

(declare-fun e!487064 () Bool)

(assert (=> b!874498 (= e!487064 (and e!487067 mapRes!27512))))

(declare-fun condMapEmpty!27512 () Bool)

(declare-fun mapDefault!27512 () ValueCell!8195)

(assert (=> b!874498 (= condMapEmpty!27512 (= (arr!24385 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8195)) mapDefault!27512)))))

(declare-fun res!593976 () Bool)

(assert (=> start!74430 (=> (not res!593976) (not e!487066))))

(assert (=> start!74430 (= res!593976 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24825 _keys!868))))))

(assert (=> start!74430 e!487066))

(assert (=> start!74430 true))

(assert (=> start!74430 tp!52750))

(declare-fun array_inv!19290 (array!50721) Bool)

(assert (=> start!74430 (array_inv!19290 _keys!868)))

(declare-fun array_inv!19291 (array!50723) Bool)

(assert (=> start!74430 (and (array_inv!19291 _values!688) e!487064)))

(assert (=> start!74430 tp_is_empty!17269))

(declare-fun b!874493 () Bool)

(declare-fun res!593974 () Bool)

(assert (=> b!874493 (=> (not res!593974) (not e!487066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874493 (= res!593974 (validKeyInArray!0 k0!854))))

(declare-fun b!874499 () Bool)

(declare-fun res!593971 () Bool)

(assert (=> b!874499 (=> (not res!593971) (not e!487066))))

(assert (=> b!874499 (= res!593971 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24825 _keys!868))))))

(declare-fun b!874500 () Bool)

(assert (=> b!874500 (= e!487066 (bvsge i!612 (size!24826 _values!688)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28073)

(declare-datatypes ((tuple2!11396 0))(
  ( (tuple2!11397 (_1!5709 (_ BitVec 64)) (_2!5709 V!28073)) )
))
(declare-datatypes ((List!17244 0))(
  ( (Nil!17241) (Cons!17240 (h!18377 tuple2!11396) (t!24277 List!17244)) )
))
(declare-datatypes ((ListLongMap!10167 0))(
  ( (ListLongMap!10168 (toList!5099 List!17244)) )
))
(declare-fun lt!396156 () ListLongMap!10167)

(declare-fun zeroValue!654 () V!28073)

(declare-fun getCurrentListMapNoExtraKeys!3142 (array!50721 array!50723 (_ BitVec 32) (_ BitVec 32) V!28073 V!28073 (_ BitVec 32) Int) ListLongMap!10167)

(assert (=> b!874500 (= lt!396156 (getCurrentListMapNoExtraKeys!3142 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74430 res!593976) b!874490))

(assert (= (and b!874490 res!593973) b!874497))

(assert (= (and b!874497 res!593975) b!874496))

(assert (= (and b!874496 res!593977) b!874495))

(assert (= (and b!874495 res!593978) b!874499))

(assert (= (and b!874499 res!593971) b!874493))

(assert (= (and b!874493 res!593974) b!874494))

(assert (= (and b!874494 res!593972) b!874500))

(assert (= (and b!874498 condMapEmpty!27512) mapIsEmpty!27512))

(assert (= (and b!874498 (not condMapEmpty!27512)) mapNonEmpty!27512))

(get-info :version)

(assert (= (and mapNonEmpty!27512 ((_ is ValueCellFull!8195) mapValue!27512)) b!874491))

(assert (= (and b!874498 ((_ is ValueCellFull!8195) mapDefault!27512)) b!874492))

(assert (= start!74430 b!874498))

(declare-fun m!815341 () Bool)

(assert (=> b!874490 m!815341))

(declare-fun m!815343 () Bool)

(assert (=> start!74430 m!815343))

(declare-fun m!815345 () Bool)

(assert (=> start!74430 m!815345))

(declare-fun m!815347 () Bool)

(assert (=> b!874494 m!815347))

(declare-fun m!815349 () Bool)

(assert (=> b!874493 m!815349))

(declare-fun m!815351 () Bool)

(assert (=> b!874495 m!815351))

(declare-fun m!815353 () Bool)

(assert (=> b!874500 m!815353))

(declare-fun m!815355 () Bool)

(assert (=> mapNonEmpty!27512 m!815355))

(declare-fun m!815357 () Bool)

(assert (=> b!874496 m!815357))

(check-sat b_and!24811 (not b_next!15025) (not b!874495) (not start!74430) (not b!874493) (not b!874500) (not b!874490) tp_is_empty!17269 (not b!874496) (not mapNonEmpty!27512))
(check-sat b_and!24811 (not b_next!15025))
