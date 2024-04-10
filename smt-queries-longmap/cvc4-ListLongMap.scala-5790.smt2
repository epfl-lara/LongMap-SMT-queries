; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74686 () Bool)

(assert start!74686)

(declare-fun b_free!15335 () Bool)

(declare-fun b_next!15335 () Bool)

(assert (=> start!74686 (= b_free!15335 (not b_next!15335))))

(declare-fun tp!53693 () Bool)

(declare-fun b_and!25289 () Bool)

(assert (=> start!74686 (= tp!53693 b_and!25289)))

(declare-fun b!880382 () Bool)

(declare-fun res!598133 () Bool)

(declare-fun e!489926 () Bool)

(assert (=> b!880382 (=> (not res!598133) (not e!489926))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51286 0))(
  ( (array!51287 (arr!24667 (Array (_ BitVec 32) (_ BitVec 64))) (size!25107 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51286)

(assert (=> b!880382 (= res!598133 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25107 _keys!868))))))

(declare-fun b!880383 () Bool)

(declare-fun res!598137 () Bool)

(assert (=> b!880383 (=> (not res!598137) (not e!489926))))

(declare-datatypes ((List!17509 0))(
  ( (Nil!17506) (Cons!17505 (h!18636 (_ BitVec 64)) (t!24646 List!17509)) )
))
(declare-fun arrayNoDuplicates!0 (array!51286 (_ BitVec 32) List!17509) Bool)

(assert (=> b!880383 (= res!598137 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17506))))

(declare-fun b!880384 () Bool)

(declare-fun res!598131 () Bool)

(assert (=> b!880384 (=> (not res!598131) (not e!489926))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880384 (= res!598131 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27990 () Bool)

(declare-fun mapRes!27990 () Bool)

(declare-fun tp!53692 () Bool)

(declare-fun e!489923 () Bool)

(assert (=> mapNonEmpty!27990 (= mapRes!27990 (and tp!53692 e!489923))))

(declare-datatypes ((V!28485 0))(
  ( (V!28486 (val!8837 Int)) )
))
(declare-datatypes ((ValueCell!8350 0))(
  ( (ValueCellFull!8350 (v!11285 V!28485)) (EmptyCell!8350) )
))
(declare-fun mapValue!27990 () ValueCell!8350)

(declare-fun mapRest!27990 () (Array (_ BitVec 32) ValueCell!8350))

(declare-fun mapKey!27990 () (_ BitVec 32))

(declare-datatypes ((array!51288 0))(
  ( (array!51289 (arr!24668 (Array (_ BitVec 32) ValueCell!8350)) (size!25108 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51288)

(assert (=> mapNonEmpty!27990 (= (arr!24668 _values!688) (store mapRest!27990 mapKey!27990 mapValue!27990))))

(declare-fun res!598136 () Bool)

(assert (=> start!74686 (=> (not res!598136) (not e!489926))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74686 (= res!598136 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25107 _keys!868))))))

(assert (=> start!74686 e!489926))

(declare-fun tp_is_empty!17579 () Bool)

(assert (=> start!74686 tp_is_empty!17579))

(assert (=> start!74686 true))

(assert (=> start!74686 tp!53693))

(declare-fun array_inv!19428 (array!51286) Bool)

(assert (=> start!74686 (array_inv!19428 _keys!868)))

(declare-fun e!489928 () Bool)

(declare-fun array_inv!19429 (array!51288) Bool)

(assert (=> start!74686 (and (array_inv!19429 _values!688) e!489928)))

(declare-fun b!880385 () Bool)

(assert (=> b!880385 (= e!489923 tp_is_empty!17579)))

(declare-fun b!880386 () Bool)

(declare-fun res!598132 () Bool)

(assert (=> b!880386 (=> (not res!598132) (not e!489926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51286 (_ BitVec 32)) Bool)

(assert (=> b!880386 (= res!598132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880387 () Bool)

(declare-fun res!598134 () Bool)

(assert (=> b!880387 (=> (not res!598134) (not e!489926))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!880387 (= res!598134 (and (= (size!25108 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25107 _keys!868) (size!25108 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880388 () Bool)

(declare-fun res!598139 () Bool)

(assert (=> b!880388 (=> (not res!598139) (not e!489926))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880388 (= res!598139 (validKeyInArray!0 k!854))))

(declare-fun b!880389 () Bool)

(declare-fun e!489925 () Bool)

(assert (=> b!880389 (= e!489925 tp_is_empty!17579)))

(declare-fun b!880390 () Bool)

(declare-fun e!489924 () Bool)

(declare-fun e!489929 () Bool)

(assert (=> b!880390 (= e!489924 (not e!489929))))

(declare-fun res!598135 () Bool)

(assert (=> b!880390 (=> res!598135 e!489929)))

(assert (=> b!880390 (= res!598135 (not (validKeyInArray!0 (select (arr!24667 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11696 0))(
  ( (tuple2!11697 (_1!5859 (_ BitVec 64)) (_2!5859 V!28485)) )
))
(declare-datatypes ((List!17510 0))(
  ( (Nil!17507) (Cons!17506 (h!18637 tuple2!11696) (t!24647 List!17510)) )
))
(declare-datatypes ((ListLongMap!10465 0))(
  ( (ListLongMap!10466 (toList!5248 List!17510)) )
))
(declare-fun lt!398093 () ListLongMap!10465)

(declare-fun lt!398095 () ListLongMap!10465)

(assert (=> b!880390 (= lt!398093 lt!398095)))

(declare-fun v!557 () V!28485)

(declare-fun lt!398090 () ListLongMap!10465)

(declare-fun +!2520 (ListLongMap!10465 tuple2!11696) ListLongMap!10465)

(assert (=> b!880390 (= lt!398095 (+!2520 lt!398090 (tuple2!11697 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398096 () array!51288)

(declare-fun minValue!654 () V!28485)

(declare-fun zeroValue!654 () V!28485)

(declare-fun getCurrentListMapNoExtraKeys!3211 (array!51286 array!51288 (_ BitVec 32) (_ BitVec 32) V!28485 V!28485 (_ BitVec 32) Int) ListLongMap!10465)

(assert (=> b!880390 (= lt!398093 (getCurrentListMapNoExtraKeys!3211 _keys!868 lt!398096 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880390 (= lt!398090 (getCurrentListMapNoExtraKeys!3211 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30056 0))(
  ( (Unit!30057) )
))
(declare-fun lt!398091 () Unit!30056)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!710 (array!51286 array!51288 (_ BitVec 32) (_ BitVec 32) V!28485 V!28485 (_ BitVec 32) (_ BitVec 64) V!28485 (_ BitVec 32) Int) Unit!30056)

(assert (=> b!880390 (= lt!398091 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!710 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880391 () Bool)

(assert (=> b!880391 (= e!489926 e!489924)))

(declare-fun res!598140 () Bool)

(assert (=> b!880391 (=> (not res!598140) (not e!489924))))

(assert (=> b!880391 (= res!598140 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!398094 () ListLongMap!10465)

(assert (=> b!880391 (= lt!398094 (getCurrentListMapNoExtraKeys!3211 _keys!868 lt!398096 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880391 (= lt!398096 (array!51289 (store (arr!24668 _values!688) i!612 (ValueCellFull!8350 v!557)) (size!25108 _values!688)))))

(declare-fun lt!398092 () ListLongMap!10465)

(assert (=> b!880391 (= lt!398092 (getCurrentListMapNoExtraKeys!3211 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880392 () Bool)

(assert (=> b!880392 (= e!489928 (and e!489925 mapRes!27990))))

(declare-fun condMapEmpty!27990 () Bool)

(declare-fun mapDefault!27990 () ValueCell!8350)

