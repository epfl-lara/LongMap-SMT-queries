; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74288 () Bool)

(assert start!74288)

(declare-fun b_free!15051 () Bool)

(declare-fun b_next!15051 () Bool)

(assert (=> start!74288 (= b_free!15051 (not b_next!15051))))

(declare-fun tp!52827 () Bool)

(declare-fun b_and!24827 () Bool)

(assert (=> start!74288 (= tp!52827 b_and!24827)))

(declare-fun b!874016 () Bool)

(declare-fun e!486676 () Bool)

(declare-fun tp_is_empty!17295 () Bool)

(assert (=> b!874016 (= e!486676 tp_is_empty!17295)))

(declare-fun res!593946 () Bool)

(declare-fun e!486680 () Bool)

(assert (=> start!74288 (=> (not res!593946) (not e!486680))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50718 0))(
  ( (array!50719 (arr!24387 (Array (_ BitVec 32) (_ BitVec 64))) (size!24827 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50718)

(assert (=> start!74288 (= res!593946 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24827 _keys!868))))))

(assert (=> start!74288 e!486680))

(assert (=> start!74288 tp_is_empty!17295))

(assert (=> start!74288 true))

(assert (=> start!74288 tp!52827))

(declare-fun array_inv!19238 (array!50718) Bool)

(assert (=> start!74288 (array_inv!19238 _keys!868)))

(declare-datatypes ((V!28107 0))(
  ( (V!28108 (val!8695 Int)) )
))
(declare-datatypes ((ValueCell!8208 0))(
  ( (ValueCellFull!8208 (v!11124 V!28107)) (EmptyCell!8208) )
))
(declare-datatypes ((array!50720 0))(
  ( (array!50721 (arr!24388 (Array (_ BitVec 32) ValueCell!8208)) (size!24828 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50720)

(declare-fun e!486677 () Bool)

(declare-fun array_inv!19239 (array!50720) Bool)

(assert (=> start!74288 (and (array_inv!19239 _values!688) e!486677)))

(declare-fun b!874017 () Bool)

(declare-fun res!593941 () Bool)

(assert (=> b!874017 (=> (not res!593941) (not e!486680))))

(declare-datatypes ((List!17311 0))(
  ( (Nil!17308) (Cons!17307 (h!18438 (_ BitVec 64)) (t!24352 List!17311)) )
))
(declare-fun arrayNoDuplicates!0 (array!50718 (_ BitVec 32) List!17311) Bool)

(assert (=> b!874017 (= res!593941 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17308))))

(declare-fun b!874018 () Bool)

(declare-fun res!593940 () Bool)

(assert (=> b!874018 (=> (not res!593940) (not e!486680))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!874018 (= res!593940 (and (= (select (arr!24387 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874019 () Bool)

(declare-fun res!593939 () Bool)

(assert (=> b!874019 (=> (not res!593939) (not e!486680))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!874019 (= res!593939 (and (= (size!24828 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24827 _keys!868) (size!24828 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874020 () Bool)

(declare-fun res!593944 () Bool)

(assert (=> b!874020 (=> (not res!593944) (not e!486680))))

(assert (=> b!874020 (= res!593944 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24827 _keys!868))))))

(declare-fun b!874021 () Bool)

(declare-fun res!593943 () Bool)

(assert (=> b!874021 (=> (not res!593943) (not e!486680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874021 (= res!593943 (validKeyInArray!0 k0!854))))

(declare-fun b!874022 () Bool)

(declare-fun res!593942 () Bool)

(assert (=> b!874022 (=> (not res!593942) (not e!486680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874022 (= res!593942 (validMask!0 mask!1196))))

(declare-fun b!874023 () Bool)

(declare-fun res!593945 () Bool)

(assert (=> b!874023 (=> (not res!593945) (not e!486680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50718 (_ BitVec 32)) Bool)

(assert (=> b!874023 (= res!593945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27551 () Bool)

(declare-fun mapRes!27551 () Bool)

(declare-fun tp!52828 () Bool)

(declare-fun e!486679 () Bool)

(assert (=> mapNonEmpty!27551 (= mapRes!27551 (and tp!52828 e!486679))))

(declare-fun mapValue!27551 () ValueCell!8208)

(declare-fun mapKey!27551 () (_ BitVec 32))

(declare-fun mapRest!27551 () (Array (_ BitVec 32) ValueCell!8208))

(assert (=> mapNonEmpty!27551 (= (arr!24388 _values!688) (store mapRest!27551 mapKey!27551 mapValue!27551))))

(declare-fun b!874024 () Bool)

(assert (=> b!874024 (= e!486677 (and e!486676 mapRes!27551))))

(declare-fun condMapEmpty!27551 () Bool)

(declare-fun mapDefault!27551 () ValueCell!8208)

(assert (=> b!874024 (= condMapEmpty!27551 (= (arr!24388 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8208)) mapDefault!27551)))))

(declare-fun b!874025 () Bool)

(assert (=> b!874025 (= e!486679 tp_is_empty!17295)))

(declare-fun mapIsEmpty!27551 () Bool)

(assert (=> mapIsEmpty!27551 mapRes!27551))

(declare-fun b!874026 () Bool)

(assert (=> b!874026 (= e!486680 false)))

(declare-fun v!557 () V!28107)

(declare-fun minValue!654 () V!28107)

(declare-fun zeroValue!654 () V!28107)

(declare-datatypes ((tuple2!11492 0))(
  ( (tuple2!11493 (_1!5757 (_ BitVec 64)) (_2!5757 V!28107)) )
))
(declare-datatypes ((List!17312 0))(
  ( (Nil!17309) (Cons!17308 (h!18439 tuple2!11492) (t!24353 List!17312)) )
))
(declare-datatypes ((ListLongMap!10261 0))(
  ( (ListLongMap!10262 (toList!5146 List!17312)) )
))
(declare-fun lt!395866 () ListLongMap!10261)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3113 (array!50718 array!50720 (_ BitVec 32) (_ BitVec 32) V!28107 V!28107 (_ BitVec 32) Int) ListLongMap!10261)

(assert (=> b!874026 (= lt!395866 (getCurrentListMapNoExtraKeys!3113 _keys!868 (array!50721 (store (arr!24388 _values!688) i!612 (ValueCellFull!8208 v!557)) (size!24828 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395867 () ListLongMap!10261)

(assert (=> b!874026 (= lt!395867 (getCurrentListMapNoExtraKeys!3113 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74288 res!593946) b!874022))

(assert (= (and b!874022 res!593942) b!874019))

(assert (= (and b!874019 res!593939) b!874023))

(assert (= (and b!874023 res!593945) b!874017))

(assert (= (and b!874017 res!593941) b!874020))

(assert (= (and b!874020 res!593944) b!874021))

(assert (= (and b!874021 res!593943) b!874018))

(assert (= (and b!874018 res!593940) b!874026))

(assert (= (and b!874024 condMapEmpty!27551) mapIsEmpty!27551))

(assert (= (and b!874024 (not condMapEmpty!27551)) mapNonEmpty!27551))

(get-info :version)

(assert (= (and mapNonEmpty!27551 ((_ is ValueCellFull!8208) mapValue!27551)) b!874025))

(assert (= (and b!874024 ((_ is ValueCellFull!8208) mapDefault!27551)) b!874016))

(assert (= start!74288 b!874024))

(declare-fun m!814325 () Bool)

(assert (=> b!874022 m!814325))

(declare-fun m!814327 () Bool)

(assert (=> b!874021 m!814327))

(declare-fun m!814329 () Bool)

(assert (=> start!74288 m!814329))

(declare-fun m!814331 () Bool)

(assert (=> start!74288 m!814331))

(declare-fun m!814333 () Bool)

(assert (=> b!874017 m!814333))

(declare-fun m!814335 () Bool)

(assert (=> b!874026 m!814335))

(declare-fun m!814337 () Bool)

(assert (=> b!874026 m!814337))

(declare-fun m!814339 () Bool)

(assert (=> b!874026 m!814339))

(declare-fun m!814341 () Bool)

(assert (=> b!874023 m!814341))

(declare-fun m!814343 () Bool)

(assert (=> mapNonEmpty!27551 m!814343))

(declare-fun m!814345 () Bool)

(assert (=> b!874018 m!814345))

(check-sat (not b!874022) (not b!874026) tp_is_empty!17295 (not start!74288) (not b!874023) (not mapNonEmpty!27551) b_and!24827 (not b!874021) (not b_next!15051) (not b!874017))
(check-sat b_and!24827 (not b_next!15051))
