; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72974 () Bool)

(assert start!72974)

(declare-fun b_free!13889 () Bool)

(declare-fun b_next!13889 () Bool)

(assert (=> start!72974 (= b_free!13889 (not b_next!13889))))

(declare-fun tp!49171 () Bool)

(declare-fun b_and!22975 () Bool)

(assert (=> start!72974 (= tp!49171 b_and!22975)))

(declare-fun b!847630 () Bool)

(declare-fun e!472981 () Bool)

(declare-datatypes ((V!26413 0))(
  ( (V!26414 (val!8060 Int)) )
))
(declare-datatypes ((tuple2!10530 0))(
  ( (tuple2!10531 (_1!5276 (_ BitVec 64)) (_2!5276 V!26413)) )
))
(declare-datatypes ((List!16388 0))(
  ( (Nil!16385) (Cons!16384 (h!17515 tuple2!10530) (t!22759 List!16388)) )
))
(declare-datatypes ((ListLongMap!9299 0))(
  ( (ListLongMap!9300 (toList!4665 List!16388)) )
))
(declare-fun call!37522 () ListLongMap!9299)

(declare-fun call!37523 () ListLongMap!9299)

(assert (=> b!847630 (= e!472981 (= call!37522 call!37523))))

(declare-fun b!847631 () Bool)

(declare-fun e!472977 () Bool)

(declare-fun tp_is_empty!16025 () Bool)

(assert (=> b!847631 (= e!472977 tp_is_empty!16025)))

(declare-fun res!575909 () Bool)

(declare-fun e!472979 () Bool)

(assert (=> start!72974 (=> (not res!575909) (not e!472979))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48260 0))(
  ( (array!48261 (arr!23161 (Array (_ BitVec 32) (_ BitVec 64))) (size!23601 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48260)

(assert (=> start!72974 (= res!575909 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23601 _keys!868))))))

(assert (=> start!72974 e!472979))

(assert (=> start!72974 tp_is_empty!16025))

(assert (=> start!72974 true))

(assert (=> start!72974 tp!49171))

(declare-fun array_inv!18394 (array!48260) Bool)

(assert (=> start!72974 (array_inv!18394 _keys!868)))

(declare-datatypes ((ValueCell!7573 0))(
  ( (ValueCellFull!7573 (v!10485 V!26413)) (EmptyCell!7573) )
))
(declare-datatypes ((array!48262 0))(
  ( (array!48263 (arr!23162 (Array (_ BitVec 32) ValueCell!7573)) (size!23602 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48262)

(declare-fun e!472975 () Bool)

(declare-fun array_inv!18395 (array!48262) Bool)

(assert (=> start!72974 (and (array_inv!18395 _values!688) e!472975)))

(declare-fun b!847632 () Bool)

(declare-fun e!472978 () Bool)

(assert (=> b!847632 (= e!472978 (not true))))

(assert (=> b!847632 e!472981))

(declare-fun c!91504 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847632 (= c!91504 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28945 0))(
  ( (Unit!28946) )
))
(declare-fun lt!381792 () Unit!28945)

(declare-fun v!557 () V!26413)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!26413)

(declare-fun zeroValue!654 () V!26413)

(declare-fun defaultEntry!696 () Int)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!318 (array!48260 array!48262 (_ BitVec 32) (_ BitVec 32) V!26413 V!26413 (_ BitVec 32) (_ BitVec 64) V!26413 (_ BitVec 32) Int) Unit!28945)

(assert (=> b!847632 (= lt!381792 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!318 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847633 () Bool)

(declare-fun res!575911 () Bool)

(assert (=> b!847633 (=> (not res!575911) (not e!472979))))

(declare-datatypes ((List!16389 0))(
  ( (Nil!16386) (Cons!16385 (h!17516 (_ BitVec 64)) (t!22760 List!16389)) )
))
(declare-fun arrayNoDuplicates!0 (array!48260 (_ BitVec 32) List!16389) Bool)

(assert (=> b!847633 (= res!575911 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16386))))

(declare-fun b!847634 () Bool)

(assert (=> b!847634 (= e!472979 e!472978)))

(declare-fun res!575908 () Bool)

(assert (=> b!847634 (=> (not res!575908) (not e!472978))))

(assert (=> b!847634 (= res!575908 (= from!1053 i!612))))

(declare-fun lt!381793 () array!48262)

(declare-fun lt!381791 () ListLongMap!9299)

(declare-fun getCurrentListMapNoExtraKeys!2649 (array!48260 array!48262 (_ BitVec 32) (_ BitVec 32) V!26413 V!26413 (_ BitVec 32) Int) ListLongMap!9299)

(assert (=> b!847634 (= lt!381791 (getCurrentListMapNoExtraKeys!2649 _keys!868 lt!381793 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!847634 (= lt!381793 (array!48263 (store (arr!23162 _values!688) i!612 (ValueCellFull!7573 v!557)) (size!23602 _values!688)))))

(declare-fun lt!381790 () ListLongMap!9299)

(assert (=> b!847634 (= lt!381790 (getCurrentListMapNoExtraKeys!2649 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!37519 () Bool)

(assert (=> bm!37519 (= call!37522 (getCurrentListMapNoExtraKeys!2649 _keys!868 lt!381793 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847635 () Bool)

(declare-fun res!575904 () Bool)

(assert (=> b!847635 (=> (not res!575904) (not e!472979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48260 (_ BitVec 32)) Bool)

(assert (=> b!847635 (= res!575904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847636 () Bool)

(declare-fun +!2081 (ListLongMap!9299 tuple2!10530) ListLongMap!9299)

(assert (=> b!847636 (= e!472981 (= call!37522 (+!2081 call!37523 (tuple2!10531 k!854 v!557))))))

(declare-fun b!847637 () Bool)

(declare-fun res!575905 () Bool)

(assert (=> b!847637 (=> (not res!575905) (not e!472979))))

(assert (=> b!847637 (= res!575905 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23601 _keys!868))))))

(declare-fun b!847638 () Bool)

(declare-fun res!575906 () Bool)

(assert (=> b!847638 (=> (not res!575906) (not e!472979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847638 (= res!575906 (validMask!0 mask!1196))))

(declare-fun b!847639 () Bool)

(declare-fun mapRes!25637 () Bool)

(assert (=> b!847639 (= e!472975 (and e!472977 mapRes!25637))))

(declare-fun condMapEmpty!25637 () Bool)

(declare-fun mapDefault!25637 () ValueCell!7573)

