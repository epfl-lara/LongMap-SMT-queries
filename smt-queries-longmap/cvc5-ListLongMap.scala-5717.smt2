; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74086 () Bool)

(assert start!74086)

(declare-fun b_free!14995 () Bool)

(declare-fun b_next!14995 () Bool)

(assert (=> start!74086 (= b_free!14995 (not b_next!14995))))

(declare-fun tp!52498 () Bool)

(declare-fun b_and!24747 () Bool)

(assert (=> start!74086 (= tp!52498 b_and!24747)))

(declare-fun b!871642 () Bool)

(declare-fun res!592486 () Bool)

(declare-fun e!485308 () Bool)

(assert (=> b!871642 (=> (not res!592486) (not e!485308))))

(declare-datatypes ((array!50412 0))(
  ( (array!50413 (arr!24237 (Array (_ BitVec 32) (_ BitVec 64))) (size!24677 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50412)

(declare-datatypes ((List!17236 0))(
  ( (Nil!17233) (Cons!17232 (h!18363 (_ BitVec 64)) (t!24273 List!17236)) )
))
(declare-fun arrayNoDuplicates!0 (array!50412 (_ BitVec 32) List!17236) Bool)

(assert (=> b!871642 (= res!592486 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17233))))

(declare-fun res!592485 () Bool)

(assert (=> start!74086 (=> (not res!592485) (not e!485308))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74086 (= res!592485 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24677 _keys!868))))))

(assert (=> start!74086 e!485308))

(declare-fun tp_is_empty!17137 () Bool)

(assert (=> start!74086 tp_is_empty!17137))

(assert (=> start!74086 true))

(assert (=> start!74086 tp!52498))

(declare-fun array_inv!19138 (array!50412) Bool)

(assert (=> start!74086 (array_inv!19138 _keys!868)))

(declare-datatypes ((V!27897 0))(
  ( (V!27898 (val!8616 Int)) )
))
(declare-datatypes ((ValueCell!8129 0))(
  ( (ValueCellFull!8129 (v!11041 V!27897)) (EmptyCell!8129) )
))
(declare-datatypes ((array!50414 0))(
  ( (array!50415 (arr!24238 (Array (_ BitVec 32) ValueCell!8129)) (size!24678 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50414)

(declare-fun e!485305 () Bool)

(declare-fun array_inv!19139 (array!50414) Bool)

(assert (=> start!74086 (and (array_inv!19139 _values!688) e!485305)))

(declare-fun b!871643 () Bool)

(declare-fun e!485306 () Bool)

(assert (=> b!871643 (= e!485306 tp_is_empty!17137)))

(declare-fun b!871644 () Bool)

(declare-fun res!592487 () Bool)

(assert (=> b!871644 (=> (not res!592487) (not e!485308))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871644 (= res!592487 (validMask!0 mask!1196))))

(declare-fun b!871645 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!871645 (= e!485308 (and (not (= from!1053 i!612)) (bvsge from!1053 i!612)))))

(declare-datatypes ((tuple2!11448 0))(
  ( (tuple2!11449 (_1!5735 (_ BitVec 64)) (_2!5735 V!27897)) )
))
(declare-datatypes ((List!17237 0))(
  ( (Nil!17234) (Cons!17233 (h!18364 tuple2!11448) (t!24274 List!17237)) )
))
(declare-datatypes ((ListLongMap!10217 0))(
  ( (ListLongMap!10218 (toList!5124 List!17237)) )
))
(declare-fun lt!395514 () ListLongMap!10217)

(declare-fun v!557 () V!27897)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27897)

(declare-fun zeroValue!654 () V!27897)

(declare-fun getCurrentListMapNoExtraKeys!3093 (array!50412 array!50414 (_ BitVec 32) (_ BitVec 32) V!27897 V!27897 (_ BitVec 32) Int) ListLongMap!10217)

(assert (=> b!871645 (= lt!395514 (getCurrentListMapNoExtraKeys!3093 _keys!868 (array!50415 (store (arr!24238 _values!688) i!612 (ValueCellFull!8129 v!557)) (size!24678 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395515 () ListLongMap!10217)

(assert (=> b!871645 (= lt!395515 (getCurrentListMapNoExtraKeys!3093 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871646 () Bool)

(declare-fun res!592484 () Bool)

(assert (=> b!871646 (=> (not res!592484) (not e!485308))))

(assert (=> b!871646 (= res!592484 (and (= (size!24678 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24677 _keys!868) (size!24678 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871647 () Bool)

(declare-fun res!592483 () Bool)

(assert (=> b!871647 (=> (not res!592483) (not e!485308))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!871647 (= res!592483 (and (= (select (arr!24237 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!871648 () Bool)

(declare-fun res!592481 () Bool)

(assert (=> b!871648 (=> (not res!592481) (not e!485308))))

(assert (=> b!871648 (= res!592481 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24677 _keys!868))))))

(declare-fun b!871649 () Bool)

(declare-fun res!592482 () Bool)

(assert (=> b!871649 (=> (not res!592482) (not e!485308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50412 (_ BitVec 32)) Bool)

(assert (=> b!871649 (= res!592482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871650 () Bool)

(declare-fun res!592480 () Bool)

(assert (=> b!871650 (=> (not res!592480) (not e!485308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871650 (= res!592480 (validKeyInArray!0 k!854))))

(declare-fun b!871651 () Bool)

(declare-fun e!485307 () Bool)

(assert (=> b!871651 (= e!485307 tp_is_empty!17137)))

(declare-fun mapNonEmpty!27305 () Bool)

(declare-fun mapRes!27305 () Bool)

(declare-fun tp!52497 () Bool)

(assert (=> mapNonEmpty!27305 (= mapRes!27305 (and tp!52497 e!485307))))

(declare-fun mapRest!27305 () (Array (_ BitVec 32) ValueCell!8129))

(declare-fun mapValue!27305 () ValueCell!8129)

(declare-fun mapKey!27305 () (_ BitVec 32))

(assert (=> mapNonEmpty!27305 (= (arr!24238 _values!688) (store mapRest!27305 mapKey!27305 mapValue!27305))))

(declare-fun mapIsEmpty!27305 () Bool)

(assert (=> mapIsEmpty!27305 mapRes!27305))

(declare-fun b!871652 () Bool)

(assert (=> b!871652 (= e!485305 (and e!485306 mapRes!27305))))

(declare-fun condMapEmpty!27305 () Bool)

(declare-fun mapDefault!27305 () ValueCell!8129)

