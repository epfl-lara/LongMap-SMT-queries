; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74254 () Bool)

(assert start!74254)

(declare-fun b_free!14995 () Bool)

(declare-fun b_next!14995 () Bool)

(assert (=> start!74254 (= b_free!14995 (not b_next!14995))))

(declare-fun tp!52498 () Bool)

(declare-fun b_and!24757 () Bool)

(assert (=> start!74254 (= tp!52498 b_and!24757)))

(declare-fun b!872545 () Bool)

(declare-fun res!592825 () Bool)

(declare-fun e!485890 () Bool)

(assert (=> b!872545 (=> (not res!592825) (not e!485890))))

(declare-datatypes ((array!50471 0))(
  ( (array!50472 (arr!24262 (Array (_ BitVec 32) (_ BitVec 64))) (size!24703 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50471)

(declare-datatypes ((List!17193 0))(
  ( (Nil!17190) (Cons!17189 (h!18326 (_ BitVec 64)) (t!24222 List!17193)) )
))
(declare-fun arrayNoDuplicates!0 (array!50471 (_ BitVec 32) List!17193) Bool)

(assert (=> b!872545 (= res!592825 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17190))))

(declare-fun b!872546 () Bool)

(declare-fun res!592826 () Bool)

(assert (=> b!872546 (=> (not res!592826) (not e!485890))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872546 (= res!592826 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27305 () Bool)

(declare-fun mapRes!27305 () Bool)

(declare-fun tp!52499 () Bool)

(declare-fun e!485889 () Bool)

(assert (=> mapNonEmpty!27305 (= mapRes!27305 (and tp!52499 e!485889))))

(declare-datatypes ((V!27897 0))(
  ( (V!27898 (val!8616 Int)) )
))
(declare-datatypes ((ValueCell!8129 0))(
  ( (ValueCellFull!8129 (v!11041 V!27897)) (EmptyCell!8129) )
))
(declare-fun mapValue!27305 () ValueCell!8129)

(declare-fun mapKey!27305 () (_ BitVec 32))

(declare-datatypes ((array!50473 0))(
  ( (array!50474 (arr!24263 (Array (_ BitVec 32) ValueCell!8129)) (size!24704 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50473)

(declare-fun mapRest!27305 () (Array (_ BitVec 32) ValueCell!8129))

(assert (=> mapNonEmpty!27305 (= (arr!24263 _values!688) (store mapRest!27305 mapKey!27305 mapValue!27305))))

(declare-fun mapIsEmpty!27305 () Bool)

(assert (=> mapIsEmpty!27305 mapRes!27305))

(declare-fun res!592828 () Bool)

(assert (=> start!74254 (=> (not res!592828) (not e!485890))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74254 (= res!592828 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24703 _keys!868))))))

(assert (=> start!74254 e!485890))

(declare-fun tp_is_empty!17137 () Bool)

(assert (=> start!74254 tp_is_empty!17137))

(assert (=> start!74254 true))

(assert (=> start!74254 tp!52498))

(declare-fun array_inv!19210 (array!50471) Bool)

(assert (=> start!74254 (array_inv!19210 _keys!868)))

(declare-fun e!485886 () Bool)

(declare-fun array_inv!19211 (array!50473) Bool)

(assert (=> start!74254 (and (array_inv!19211 _values!688) e!485886)))

(declare-fun b!872547 () Bool)

(assert (=> b!872547 (= e!485889 tp_is_empty!17137)))

(declare-fun b!872548 () Bool)

(declare-fun res!592830 () Bool)

(assert (=> b!872548 (=> (not res!592830) (not e!485890))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872548 (= res!592830 (validKeyInArray!0 k0!854))))

(declare-fun b!872549 () Bool)

(declare-fun e!485887 () Bool)

(assert (=> b!872549 (= e!485887 tp_is_empty!17137)))

(declare-fun b!872550 () Bool)

(declare-fun res!592831 () Bool)

(assert (=> b!872550 (=> (not res!592831) (not e!485890))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!872550 (= res!592831 (and (= (select (arr!24262 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!872551 () Bool)

(declare-fun res!592824 () Bool)

(assert (=> b!872551 (=> (not res!592824) (not e!485890))))

(assert (=> b!872551 (= res!592824 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24703 _keys!868))))))

(declare-fun b!872552 () Bool)

(declare-fun res!592827 () Bool)

(assert (=> b!872552 (=> (not res!592827) (not e!485890))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872552 (= res!592827 (and (= (size!24704 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24703 _keys!868) (size!24704 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872553 () Bool)

(assert (=> b!872553 (= e!485890 (and (not (= from!1053 i!612)) (bvsge from!1053 i!612)))))

(declare-fun v!557 () V!27897)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11376 0))(
  ( (tuple2!11377 (_1!5699 (_ BitVec 64)) (_2!5699 V!27897)) )
))
(declare-datatypes ((List!17194 0))(
  ( (Nil!17191) (Cons!17190 (h!18327 tuple2!11376) (t!24223 List!17194)) )
))
(declare-datatypes ((ListLongMap!10147 0))(
  ( (ListLongMap!10148 (toList!5089 List!17194)) )
))
(declare-fun lt!395875 () ListLongMap!10147)

(declare-fun minValue!654 () V!27897)

(declare-fun zeroValue!654 () V!27897)

(declare-fun getCurrentListMapNoExtraKeys!3133 (array!50471 array!50473 (_ BitVec 32) (_ BitVec 32) V!27897 V!27897 (_ BitVec 32) Int) ListLongMap!10147)

(assert (=> b!872553 (= lt!395875 (getCurrentListMapNoExtraKeys!3133 _keys!868 (array!50474 (store (arr!24263 _values!688) i!612 (ValueCellFull!8129 v!557)) (size!24704 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395876 () ListLongMap!10147)

(assert (=> b!872553 (= lt!395876 (getCurrentListMapNoExtraKeys!3133 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!872554 () Bool)

(assert (=> b!872554 (= e!485886 (and e!485887 mapRes!27305))))

(declare-fun condMapEmpty!27305 () Bool)

(declare-fun mapDefault!27305 () ValueCell!8129)

(assert (=> b!872554 (= condMapEmpty!27305 (= (arr!24263 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8129)) mapDefault!27305)))))

(declare-fun b!872555 () Bool)

(declare-fun res!592829 () Bool)

(assert (=> b!872555 (=> (not res!592829) (not e!485890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50471 (_ BitVec 32)) Bool)

(assert (=> b!872555 (= res!592829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74254 res!592828) b!872546))

(assert (= (and b!872546 res!592826) b!872552))

(assert (= (and b!872552 res!592827) b!872555))

(assert (= (and b!872555 res!592829) b!872545))

(assert (= (and b!872545 res!592825) b!872551))

(assert (= (and b!872551 res!592824) b!872548))

(assert (= (and b!872548 res!592830) b!872550))

(assert (= (and b!872550 res!592831) b!872553))

(assert (= (and b!872554 condMapEmpty!27305) mapIsEmpty!27305))

(assert (= (and b!872554 (not condMapEmpty!27305)) mapNonEmpty!27305))

(get-info :version)

(assert (= (and mapNonEmpty!27305 ((_ is ValueCellFull!8129) mapValue!27305)) b!872547))

(assert (= (and b!872554 ((_ is ValueCellFull!8129) mapDefault!27305)) b!872549))

(assert (= start!74254 b!872554))

(declare-fun m!814085 () Bool)

(assert (=> b!872553 m!814085))

(declare-fun m!814087 () Bool)

(assert (=> b!872553 m!814087))

(declare-fun m!814089 () Bool)

(assert (=> b!872553 m!814089))

(declare-fun m!814091 () Bool)

(assert (=> b!872550 m!814091))

(declare-fun m!814093 () Bool)

(assert (=> b!872546 m!814093))

(declare-fun m!814095 () Bool)

(assert (=> b!872555 m!814095))

(declare-fun m!814097 () Bool)

(assert (=> mapNonEmpty!27305 m!814097))

(declare-fun m!814099 () Bool)

(assert (=> b!872545 m!814099))

(declare-fun m!814101 () Bool)

(assert (=> b!872548 m!814101))

(declare-fun m!814103 () Bool)

(assert (=> start!74254 m!814103))

(declare-fun m!814105 () Bool)

(assert (=> start!74254 m!814105))

(check-sat tp_is_empty!17137 (not b!872555) (not mapNonEmpty!27305) (not b_next!14995) (not start!74254) (not b!872546) (not b!872548) (not b!872553) (not b!872545) b_and!24757)
(check-sat b_and!24757 (not b_next!14995))
