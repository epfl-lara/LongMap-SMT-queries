; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74206 () Bool)

(assert start!74206)

(declare-fun b_free!15013 () Bool)

(declare-fun b_next!15013 () Bool)

(assert (=> start!74206 (= b_free!15013 (not b_next!15013))))

(declare-fun tp!52689 () Bool)

(declare-fun b_and!24765 () Bool)

(assert (=> start!74206 (= tp!52689 b_and!24765)))

(declare-fun b!873013 () Bool)

(declare-fun res!593310 () Bool)

(declare-fun e!486165 () Bool)

(assert (=> b!873013 (=> (not res!593310) (not e!486165))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873013 (= res!593310 (validKeyInArray!0 k!854))))

(declare-fun b!873014 () Bool)

(declare-fun e!486163 () Bool)

(declare-fun tp_is_empty!17245 () Bool)

(assert (=> b!873014 (= e!486163 tp_is_empty!17245)))

(declare-fun b!873015 () Bool)

(declare-fun res!593312 () Bool)

(assert (=> b!873015 (=> (not res!593312) (not e!486165))))

(declare-datatypes ((array!50616 0))(
  ( (array!50617 (arr!24338 (Array (_ BitVec 32) (_ BitVec 64))) (size!24778 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50616)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50616 (_ BitVec 32)) Bool)

(assert (=> b!873015 (= res!593312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873016 () Bool)

(declare-datatypes ((V!28041 0))(
  ( (V!28042 (val!8670 Int)) )
))
(declare-fun v!557 () V!28041)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8183 0))(
  ( (ValueCellFull!8183 (v!11095 V!28041)) (EmptyCell!8183) )
))
(declare-datatypes ((array!50618 0))(
  ( (array!50619 (arr!24339 (Array (_ BitVec 32) ValueCell!8183)) (size!24779 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50618)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28041)

(declare-fun zeroValue!654 () V!28041)

(declare-datatypes ((tuple2!11466 0))(
  ( (tuple2!11467 (_1!5744 (_ BitVec 64)) (_2!5744 V!28041)) )
))
(declare-datatypes ((List!17282 0))(
  ( (Nil!17279) (Cons!17278 (h!18409 tuple2!11466) (t!24319 List!17282)) )
))
(declare-datatypes ((ListLongMap!10235 0))(
  ( (ListLongMap!10236 (toList!5133 List!17282)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3100 (array!50616 array!50618 (_ BitVec 32) (_ BitVec 32) V!28041 V!28041 (_ BitVec 32) Int) ListLongMap!10235)

(assert (=> b!873016 (= e!486165 (not (= (getCurrentListMapNoExtraKeys!3100 _keys!868 (array!50619 (store (arr!24339 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24779 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) (getCurrentListMapNoExtraKeys!3100 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))))

(declare-fun e!486164 () Bool)

(assert (=> b!873016 e!486164))

(declare-fun c!92413 () Bool)

(assert (=> b!873016 (= c!92413 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29922 0))(
  ( (Unit!29923) )
))
(declare-fun lt!395674 () Unit!29922)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!655 (array!50616 array!50618 (_ BitVec 32) (_ BitVec 32) V!28041 V!28041 (_ BitVec 32) (_ BitVec 64) V!28041 (_ BitVec 32) Int) Unit!29922)

(assert (=> b!873016 (= lt!395674 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!655 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27470 () Bool)

(declare-fun mapRes!27470 () Bool)

(declare-fun tp!52690 () Bool)

(declare-fun e!486166 () Bool)

(assert (=> mapNonEmpty!27470 (= mapRes!27470 (and tp!52690 e!486166))))

(declare-fun mapKey!27470 () (_ BitVec 32))

(declare-fun mapValue!27470 () ValueCell!8183)

(declare-fun mapRest!27470 () (Array (_ BitVec 32) ValueCell!8183))

(assert (=> mapNonEmpty!27470 (= (arr!24339 _values!688) (store mapRest!27470 mapKey!27470 mapValue!27470))))

(declare-fun b!873018 () Bool)

(assert (=> b!873018 (= e!486166 tp_is_empty!17245)))

(declare-fun b!873019 () Bool)

(declare-fun res!593305 () Bool)

(assert (=> b!873019 (=> (not res!593305) (not e!486165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873019 (= res!593305 (validMask!0 mask!1196))))

(declare-fun bm!38503 () Bool)

(declare-fun call!38506 () ListLongMap!10235)

(assert (=> bm!38503 (= call!38506 (getCurrentListMapNoExtraKeys!3100 _keys!868 (array!50619 (store (arr!24339 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24779 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38504 () Bool)

(declare-fun call!38507 () ListLongMap!10235)

(assert (=> bm!38504 (= call!38507 (getCurrentListMapNoExtraKeys!3100 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!873020 () Bool)

(declare-fun +!2462 (ListLongMap!10235 tuple2!11466) ListLongMap!10235)

(assert (=> b!873020 (= e!486164 (= call!38506 (+!2462 call!38507 (tuple2!11467 k!854 v!557))))))

(declare-fun b!873021 () Bool)

(declare-fun res!593309 () Bool)

(assert (=> b!873021 (=> (not res!593309) (not e!486165))))

(declare-datatypes ((List!17283 0))(
  ( (Nil!17280) (Cons!17279 (h!18410 (_ BitVec 64)) (t!24320 List!17283)) )
))
(declare-fun arrayNoDuplicates!0 (array!50616 (_ BitVec 32) List!17283) Bool)

(assert (=> b!873021 (= res!593309 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17280))))

(declare-fun res!593311 () Bool)

(assert (=> start!74206 (=> (not res!593311) (not e!486165))))

(assert (=> start!74206 (= res!593311 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24778 _keys!868))))))

(assert (=> start!74206 e!486165))

(assert (=> start!74206 tp_is_empty!17245))

(assert (=> start!74206 true))

(assert (=> start!74206 tp!52689))

(declare-fun array_inv!19204 (array!50616) Bool)

(assert (=> start!74206 (array_inv!19204 _keys!868)))

(declare-fun e!486162 () Bool)

(declare-fun array_inv!19205 (array!50618) Bool)

(assert (=> start!74206 (and (array_inv!19205 _values!688) e!486162)))

(declare-fun b!873017 () Bool)

(declare-fun res!593307 () Bool)

(assert (=> b!873017 (=> (not res!593307) (not e!486165))))

(assert (=> b!873017 (= res!593307 (and (= (size!24779 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24778 _keys!868) (size!24779 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873022 () Bool)

(declare-fun res!593306 () Bool)

(assert (=> b!873022 (=> (not res!593306) (not e!486165))))

(assert (=> b!873022 (= res!593306 (and (= (select (arr!24338 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24778 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!873023 () Bool)

(assert (=> b!873023 (= e!486162 (and e!486163 mapRes!27470))))

(declare-fun condMapEmpty!27470 () Bool)

(declare-fun mapDefault!27470 () ValueCell!8183)

