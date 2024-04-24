; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74224 () Bool)

(assert start!74224)

(declare-fun b_free!14971 () Bool)

(declare-fun b_next!14971 () Bool)

(assert (=> start!74224 (= b_free!14971 (not b_next!14971))))

(declare-fun tp!52418 () Bool)

(declare-fun b_and!24733 () Bool)

(assert (=> start!74224 (= tp!52418 b_and!24733)))

(declare-fun b!872034 () Bool)

(declare-fun res!592467 () Bool)

(declare-fun e!485619 () Bool)

(assert (=> b!872034 (=> (not res!592467) (not e!485619))))

(declare-datatypes ((array!50415 0))(
  ( (array!50416 (arr!24234 (Array (_ BitVec 32) (_ BitVec 64))) (size!24675 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50415)

(declare-datatypes ((List!17179 0))(
  ( (Nil!17176) (Cons!17175 (h!18312 (_ BitVec 64)) (t!24208 List!17179)) )
))
(declare-fun arrayNoDuplicates!0 (array!50415 (_ BitVec 32) List!17179) Bool)

(assert (=> b!872034 (= res!592467 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17176))))

(declare-fun res!592469 () Bool)

(assert (=> start!74224 (=> (not res!592469) (not e!485619))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74224 (= res!592469 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24675 _keys!868))))))

(assert (=> start!74224 e!485619))

(declare-fun tp_is_empty!17107 () Bool)

(assert (=> start!74224 tp_is_empty!17107))

(assert (=> start!74224 true))

(assert (=> start!74224 tp!52418))

(declare-fun array_inv!19190 (array!50415) Bool)

(assert (=> start!74224 (array_inv!19190 _keys!868)))

(declare-datatypes ((V!27857 0))(
  ( (V!27858 (val!8601 Int)) )
))
(declare-datatypes ((ValueCell!8114 0))(
  ( (ValueCellFull!8114 (v!11026 V!27857)) (EmptyCell!8114) )
))
(declare-datatypes ((array!50417 0))(
  ( (array!50418 (arr!24235 (Array (_ BitVec 32) ValueCell!8114)) (size!24676 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50417)

(declare-fun e!485618 () Bool)

(declare-fun array_inv!19191 (array!50417) Bool)

(assert (=> start!74224 (and (array_inv!19191 _values!688) e!485618)))

(declare-fun mapIsEmpty!27260 () Bool)

(declare-fun mapRes!27260 () Bool)

(assert (=> mapIsEmpty!27260 mapRes!27260))

(declare-fun b!872035 () Bool)

(declare-fun res!592474 () Bool)

(assert (=> b!872035 (=> (not res!592474) (not e!485619))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!872035 (= res!592474 (and (= (select (arr!24234 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!872036 () Bool)

(declare-fun res!592466 () Bool)

(assert (=> b!872036 (=> (not res!592466) (not e!485619))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!872036 (= res!592466 (and (= (size!24676 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24675 _keys!868) (size!24676 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872037 () Bool)

(declare-fun e!485623 () Bool)

(assert (=> b!872037 (= e!485623 tp_is_empty!17107)))

(declare-fun b!872038 () Bool)

(declare-fun res!592468 () Bool)

(assert (=> b!872038 (=> (not res!592468) (not e!485619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50415 (_ BitVec 32)) Bool)

(assert (=> b!872038 (= res!592468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872039 () Bool)

(declare-fun res!592473 () Bool)

(assert (=> b!872039 (=> (not res!592473) (not e!485619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872039 (= res!592473 (validKeyInArray!0 k0!854))))

(declare-fun b!872040 () Bool)

(declare-fun e!485622 () Bool)

(assert (=> b!872040 (= e!485622 (not true))))

(declare-fun v!557 () V!27857)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!395729 () array!50417)

(declare-fun minValue!654 () V!27857)

(declare-fun zeroValue!654 () V!27857)

(declare-datatypes ((tuple2!11360 0))(
  ( (tuple2!11361 (_1!5691 (_ BitVec 64)) (_2!5691 V!27857)) )
))
(declare-datatypes ((List!17180 0))(
  ( (Nil!17177) (Cons!17176 (h!18313 tuple2!11360) (t!24209 List!17180)) )
))
(declare-datatypes ((ListLongMap!10131 0))(
  ( (ListLongMap!10132 (toList!5081 List!17180)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3125 (array!50415 array!50417 (_ BitVec 32) (_ BitVec 32) V!27857 V!27857 (_ BitVec 32) Int) ListLongMap!10131)

(declare-fun +!2470 (ListLongMap!10131 tuple2!11360) ListLongMap!10131)

(assert (=> b!872040 (= (getCurrentListMapNoExtraKeys!3125 _keys!868 lt!395729 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2470 (getCurrentListMapNoExtraKeys!3125 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11361 k0!854 v!557)))))

(declare-datatypes ((Unit!29890 0))(
  ( (Unit!29891) )
))
(declare-fun lt!395728 () Unit!29890)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!641 (array!50415 array!50417 (_ BitVec 32) (_ BitVec 32) V!27857 V!27857 (_ BitVec 32) (_ BitVec 64) V!27857 (_ BitVec 32) Int) Unit!29890)

(assert (=> b!872040 (= lt!395728 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!641 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27260 () Bool)

(declare-fun tp!52417 () Bool)

(assert (=> mapNonEmpty!27260 (= mapRes!27260 (and tp!52417 e!485623))))

(declare-fun mapKey!27260 () (_ BitVec 32))

(declare-fun mapRest!27260 () (Array (_ BitVec 32) ValueCell!8114))

(declare-fun mapValue!27260 () ValueCell!8114)

(assert (=> mapNonEmpty!27260 (= (arr!24235 _values!688) (store mapRest!27260 mapKey!27260 mapValue!27260))))

(declare-fun b!872041 () Bool)

(declare-fun e!485621 () Bool)

(assert (=> b!872041 (= e!485621 tp_is_empty!17107)))

(declare-fun b!872042 () Bool)

(assert (=> b!872042 (= e!485618 (and e!485621 mapRes!27260))))

(declare-fun condMapEmpty!27260 () Bool)

(declare-fun mapDefault!27260 () ValueCell!8114)

(assert (=> b!872042 (= condMapEmpty!27260 (= (arr!24235 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8114)) mapDefault!27260)))))

(declare-fun b!872043 () Bool)

(assert (=> b!872043 (= e!485619 e!485622)))

(declare-fun res!592471 () Bool)

(assert (=> b!872043 (=> (not res!592471) (not e!485622))))

(assert (=> b!872043 (= res!592471 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395727 () ListLongMap!10131)

(assert (=> b!872043 (= lt!395727 (getCurrentListMapNoExtraKeys!3125 _keys!868 lt!395729 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!872043 (= lt!395729 (array!50418 (store (arr!24235 _values!688) i!612 (ValueCellFull!8114 v!557)) (size!24676 _values!688)))))

(declare-fun lt!395726 () ListLongMap!10131)

(assert (=> b!872043 (= lt!395726 (getCurrentListMapNoExtraKeys!3125 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!872044 () Bool)

(declare-fun res!592470 () Bool)

(assert (=> b!872044 (=> (not res!592470) (not e!485619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872044 (= res!592470 (validMask!0 mask!1196))))

(declare-fun b!872045 () Bool)

(declare-fun res!592472 () Bool)

(assert (=> b!872045 (=> (not res!592472) (not e!485619))))

(assert (=> b!872045 (= res!592472 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24675 _keys!868))))))

(assert (= (and start!74224 res!592469) b!872044))

(assert (= (and b!872044 res!592470) b!872036))

(assert (= (and b!872036 res!592466) b!872038))

(assert (= (and b!872038 res!592468) b!872034))

(assert (= (and b!872034 res!592467) b!872045))

(assert (= (and b!872045 res!592472) b!872039))

(assert (= (and b!872039 res!592473) b!872035))

(assert (= (and b!872035 res!592474) b!872043))

(assert (= (and b!872043 res!592471) b!872040))

(assert (= (and b!872042 condMapEmpty!27260) mapIsEmpty!27260))

(assert (= (and b!872042 (not condMapEmpty!27260)) mapNonEmpty!27260))

(get-info :version)

(assert (= (and mapNonEmpty!27260 ((_ is ValueCellFull!8114) mapValue!27260)) b!872037))

(assert (= (and b!872042 ((_ is ValueCellFull!8114) mapDefault!27260)) b!872041))

(assert (= start!74224 b!872042))

(declare-fun m!813677 () Bool)

(assert (=> start!74224 m!813677))

(declare-fun m!813679 () Bool)

(assert (=> start!74224 m!813679))

(declare-fun m!813681 () Bool)

(assert (=> b!872038 m!813681))

(declare-fun m!813683 () Bool)

(assert (=> b!872044 m!813683))

(declare-fun m!813685 () Bool)

(assert (=> b!872035 m!813685))

(declare-fun m!813687 () Bool)

(assert (=> b!872034 m!813687))

(declare-fun m!813689 () Bool)

(assert (=> b!872039 m!813689))

(declare-fun m!813691 () Bool)

(assert (=> b!872040 m!813691))

(declare-fun m!813693 () Bool)

(assert (=> b!872040 m!813693))

(assert (=> b!872040 m!813693))

(declare-fun m!813695 () Bool)

(assert (=> b!872040 m!813695))

(declare-fun m!813697 () Bool)

(assert (=> b!872040 m!813697))

(declare-fun m!813699 () Bool)

(assert (=> b!872043 m!813699))

(declare-fun m!813701 () Bool)

(assert (=> b!872043 m!813701))

(declare-fun m!813703 () Bool)

(assert (=> b!872043 m!813703))

(declare-fun m!813705 () Bool)

(assert (=> mapNonEmpty!27260 m!813705))

(check-sat (not b!872043) (not b!872040) (not b!872044) (not b!872038) b_and!24733 tp_is_empty!17107 (not b!872039) (not mapNonEmpty!27260) (not b_next!14971) (not start!74224) (not b!872034))
(check-sat b_and!24733 (not b_next!14971))
