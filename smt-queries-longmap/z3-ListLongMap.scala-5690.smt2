; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73906 () Bool)

(assert start!73906)

(declare-fun b_free!14839 () Bool)

(declare-fun b_next!14839 () Bool)

(assert (=> start!73906 (= b_free!14839 (not b_next!14839))))

(declare-fun tp!52022 () Bool)

(declare-fun b_and!24565 () Bool)

(assert (=> start!73906 (= tp!52022 b_and!24565)))

(declare-fun b!868516 () Bool)

(declare-fun res!590231 () Bool)

(declare-fun e!483705 () Bool)

(assert (=> b!868516 (=> (not res!590231) (not e!483705))))

(declare-datatypes ((array!50093 0))(
  ( (array!50094 (arr!24078 (Array (_ BitVec 32) (_ BitVec 64))) (size!24520 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50093)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50093 (_ BitVec 32)) Bool)

(assert (=> b!868516 (= res!590231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868517 () Bool)

(declare-fun res!590233 () Bool)

(assert (=> b!868517 (=> (not res!590233) (not e!483705))))

(declare-datatypes ((List!17137 0))(
  ( (Nil!17134) (Cons!17133 (h!18264 (_ BitVec 64)) (t!24165 List!17137)) )
))
(declare-fun arrayNoDuplicates!0 (array!50093 (_ BitVec 32) List!17137) Bool)

(assert (=> b!868517 (= res!590233 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17134))))

(declare-fun b!868518 () Bool)

(declare-fun res!590230 () Bool)

(assert (=> b!868518 (=> (not res!590230) (not e!483705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868518 (= res!590230 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27062 () Bool)

(declare-fun mapRes!27062 () Bool)

(assert (=> mapIsEmpty!27062 mapRes!27062))

(declare-fun b!868519 () Bool)

(declare-fun e!483702 () Bool)

(declare-fun e!483704 () Bool)

(assert (=> b!868519 (= e!483702 (and e!483704 mapRes!27062))))

(declare-fun condMapEmpty!27062 () Bool)

(declare-datatypes ((V!27681 0))(
  ( (V!27682 (val!8535 Int)) )
))
(declare-datatypes ((ValueCell!8048 0))(
  ( (ValueCellFull!8048 (v!10954 V!27681)) (EmptyCell!8048) )
))
(declare-datatypes ((array!50095 0))(
  ( (array!50096 (arr!24079 (Array (_ BitVec 32) ValueCell!8048)) (size!24521 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50095)

(declare-fun mapDefault!27062 () ValueCell!8048)

(assert (=> b!868519 (= condMapEmpty!27062 (= (arr!24079 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8048)) mapDefault!27062)))))

(declare-fun b!868520 () Bool)

(declare-fun res!590232 () Bool)

(assert (=> b!868520 (=> (not res!590232) (not e!483705))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!868520 (= res!590232 (and (= (size!24521 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24520 _keys!868) (size!24521 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27062 () Bool)

(declare-fun tp!52021 () Bool)

(declare-fun e!483700 () Bool)

(assert (=> mapNonEmpty!27062 (= mapRes!27062 (and tp!52021 e!483700))))

(declare-fun mapKey!27062 () (_ BitVec 32))

(declare-fun mapRest!27062 () (Array (_ BitVec 32) ValueCell!8048))

(declare-fun mapValue!27062 () ValueCell!8048)

(assert (=> mapNonEmpty!27062 (= (arr!24079 _values!688) (store mapRest!27062 mapKey!27062 mapValue!27062))))

(declare-fun b!868521 () Bool)

(declare-fun res!590234 () Bool)

(assert (=> b!868521 (=> (not res!590234) (not e!483705))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!868521 (= res!590234 (and (= (select (arr!24078 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868522 () Bool)

(declare-fun tp_is_empty!16975 () Bool)

(assert (=> b!868522 (= e!483704 tp_is_empty!16975)))

(declare-fun b!868523 () Bool)

(declare-fun e!483703 () Bool)

(assert (=> b!868523 (= e!483705 e!483703)))

(declare-fun res!590237 () Bool)

(assert (=> b!868523 (=> (not res!590237) (not e!483703))))

(assert (=> b!868523 (= res!590237 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394337 () array!50095)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11352 0))(
  ( (tuple2!11353 (_1!5687 (_ BitVec 64)) (_2!5687 V!27681)) )
))
(declare-datatypes ((List!17138 0))(
  ( (Nil!17135) (Cons!17134 (h!18265 tuple2!11352) (t!24166 List!17138)) )
))
(declare-datatypes ((ListLongMap!10111 0))(
  ( (ListLongMap!10112 (toList!5071 List!17138)) )
))
(declare-fun lt!394340 () ListLongMap!10111)

(declare-fun minValue!654 () V!27681)

(declare-fun zeroValue!654 () V!27681)

(declare-fun getCurrentListMapNoExtraKeys!3064 (array!50093 array!50095 (_ BitVec 32) (_ BitVec 32) V!27681 V!27681 (_ BitVec 32) Int) ListLongMap!10111)

(assert (=> b!868523 (= lt!394340 (getCurrentListMapNoExtraKeys!3064 _keys!868 lt!394337 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27681)

(assert (=> b!868523 (= lt!394337 (array!50096 (store (arr!24079 _values!688) i!612 (ValueCellFull!8048 v!557)) (size!24521 _values!688)))))

(declare-fun lt!394338 () ListLongMap!10111)

(assert (=> b!868523 (= lt!394338 (getCurrentListMapNoExtraKeys!3064 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868524 () Bool)

(declare-fun res!590238 () Bool)

(assert (=> b!868524 (=> (not res!590238) (not e!483705))))

(assert (=> b!868524 (= res!590238 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24520 _keys!868))))))

(declare-fun b!868525 () Bool)

(assert (=> b!868525 (= e!483700 tp_is_empty!16975)))

(declare-fun b!868526 () Bool)

(assert (=> b!868526 (= e!483703 (not true))))

(declare-fun +!2433 (ListLongMap!10111 tuple2!11352) ListLongMap!10111)

(assert (=> b!868526 (= (getCurrentListMapNoExtraKeys!3064 _keys!868 lt!394337 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2433 (getCurrentListMapNoExtraKeys!3064 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11353 k0!854 v!557)))))

(declare-datatypes ((Unit!29753 0))(
  ( (Unit!29754) )
))
(declare-fun lt!394339 () Unit!29753)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!601 (array!50093 array!50095 (_ BitVec 32) (_ BitVec 32) V!27681 V!27681 (_ BitVec 32) (_ BitVec 64) V!27681 (_ BitVec 32) Int) Unit!29753)

(assert (=> b!868526 (= lt!394339 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!601 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868527 () Bool)

(declare-fun res!590235 () Bool)

(assert (=> b!868527 (=> (not res!590235) (not e!483705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868527 (= res!590235 (validKeyInArray!0 k0!854))))

(declare-fun res!590236 () Bool)

(assert (=> start!73906 (=> (not res!590236) (not e!483705))))

(assert (=> start!73906 (= res!590236 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24520 _keys!868))))))

(assert (=> start!73906 e!483705))

(assert (=> start!73906 tp_is_empty!16975))

(assert (=> start!73906 true))

(assert (=> start!73906 tp!52022))

(declare-fun array_inv!19092 (array!50093) Bool)

(assert (=> start!73906 (array_inv!19092 _keys!868)))

(declare-fun array_inv!19093 (array!50095) Bool)

(assert (=> start!73906 (and (array_inv!19093 _values!688) e!483702)))

(assert (= (and start!73906 res!590236) b!868518))

(assert (= (and b!868518 res!590230) b!868520))

(assert (= (and b!868520 res!590232) b!868516))

(assert (= (and b!868516 res!590231) b!868517))

(assert (= (and b!868517 res!590233) b!868524))

(assert (= (and b!868524 res!590238) b!868527))

(assert (= (and b!868527 res!590235) b!868521))

(assert (= (and b!868521 res!590234) b!868523))

(assert (= (and b!868523 res!590237) b!868526))

(assert (= (and b!868519 condMapEmpty!27062) mapIsEmpty!27062))

(assert (= (and b!868519 (not condMapEmpty!27062)) mapNonEmpty!27062))

(get-info :version)

(assert (= (and mapNonEmpty!27062 ((_ is ValueCellFull!8048) mapValue!27062)) b!868525))

(assert (= (and b!868519 ((_ is ValueCellFull!8048) mapDefault!27062)) b!868522))

(assert (= start!73906 b!868519))

(declare-fun m!809649 () Bool)

(assert (=> b!868526 m!809649))

(declare-fun m!809651 () Bool)

(assert (=> b!868526 m!809651))

(assert (=> b!868526 m!809651))

(declare-fun m!809653 () Bool)

(assert (=> b!868526 m!809653))

(declare-fun m!809655 () Bool)

(assert (=> b!868526 m!809655))

(declare-fun m!809657 () Bool)

(assert (=> b!868521 m!809657))

(declare-fun m!809659 () Bool)

(assert (=> b!868527 m!809659))

(declare-fun m!809661 () Bool)

(assert (=> mapNonEmpty!27062 m!809661))

(declare-fun m!809663 () Bool)

(assert (=> start!73906 m!809663))

(declare-fun m!809665 () Bool)

(assert (=> start!73906 m!809665))

(declare-fun m!809667 () Bool)

(assert (=> b!868518 m!809667))

(declare-fun m!809669 () Bool)

(assert (=> b!868523 m!809669))

(declare-fun m!809671 () Bool)

(assert (=> b!868523 m!809671))

(declare-fun m!809673 () Bool)

(assert (=> b!868523 m!809673))

(declare-fun m!809675 () Bool)

(assert (=> b!868517 m!809675))

(declare-fun m!809677 () Bool)

(assert (=> b!868516 m!809677))

(check-sat (not b!868517) (not start!73906) (not b_next!14839) (not b!868523) (not b!868526) b_and!24565 (not b!868516) tp_is_empty!16975 (not b!868527) (not mapNonEmpty!27062) (not b!868518))
(check-sat b_and!24565 (not b_next!14839))
