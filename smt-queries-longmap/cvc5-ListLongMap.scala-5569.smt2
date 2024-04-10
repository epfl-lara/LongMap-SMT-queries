; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73198 () Bool)

(assert start!73198)

(declare-fun b_free!14113 () Bool)

(declare-fun b_next!14113 () Bool)

(assert (=> start!73198 (= b_free!14113 (not b_next!14113))))

(declare-fun tp!49843 () Bool)

(declare-fun b_and!23385 () Bool)

(assert (=> start!73198 (= tp!49843 b_and!23385)))

(declare-fun mapIsEmpty!25973 () Bool)

(declare-fun mapRes!25973 () Bool)

(assert (=> mapIsEmpty!25973 mapRes!25973))

(declare-fun b!852810 () Bool)

(declare-fun e!475619 () Bool)

(assert (=> b!852810 (= e!475619 true)))

(declare-datatypes ((V!26713 0))(
  ( (V!26714 (val!8172 Int)) )
))
(declare-datatypes ((tuple2!10736 0))(
  ( (tuple2!10737 (_1!5379 (_ BitVec 64)) (_2!5379 V!26713)) )
))
(declare-fun lt!384343 () tuple2!10736)

(declare-datatypes ((List!16566 0))(
  ( (Nil!16563) (Cons!16562 (h!17693 tuple2!10736) (t!23125 List!16566)) )
))
(declare-datatypes ((ListLongMap!9505 0))(
  ( (ListLongMap!9506 (toList!4768 List!16566)) )
))
(declare-fun lt!384341 () ListLongMap!9505)

(declare-fun lt!384334 () V!26713)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2162 (ListLongMap!9505 tuple2!10736) ListLongMap!9505)

(assert (=> b!852810 (= (+!2162 lt!384341 lt!384343) (+!2162 (+!2162 lt!384341 (tuple2!10737 k!854 lt!384334)) lt!384343))))

(declare-fun lt!384338 () V!26713)

(assert (=> b!852810 (= lt!384343 (tuple2!10737 k!854 lt!384338))))

(declare-datatypes ((Unit!29109 0))(
  ( (Unit!29110) )
))
(declare-fun lt!384335 () Unit!29109)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!290 (ListLongMap!9505 (_ BitVec 64) V!26713 V!26713) Unit!29109)

(assert (=> b!852810 (= lt!384335 (addSameAsAddTwiceSameKeyDiffValues!290 lt!384341 k!854 lt!384334 lt!384338))))

(declare-fun lt!384337 () V!26713)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7685 0))(
  ( (ValueCellFull!7685 (v!10597 V!26713)) (EmptyCell!7685) )
))
(declare-datatypes ((array!48696 0))(
  ( (array!48697 (arr!23379 (Array (_ BitVec 32) ValueCell!7685)) (size!23819 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48696)

(declare-fun get!12326 (ValueCell!7685 V!26713) V!26713)

(assert (=> b!852810 (= lt!384334 (get!12326 (select (arr!23379 _values!688) from!1053) lt!384337))))

(declare-fun lt!384339 () ListLongMap!9505)

(declare-datatypes ((array!48698 0))(
  ( (array!48699 (arr!23380 (Array (_ BitVec 32) (_ BitVec 64))) (size!23820 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48698)

(assert (=> b!852810 (= lt!384339 (+!2162 lt!384341 (tuple2!10737 (select (arr!23380 _keys!868) from!1053) lt!384338)))))

(declare-fun v!557 () V!26713)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852810 (= lt!384338 (get!12326 (select (store (arr!23379 _values!688) i!612 (ValueCellFull!7685 v!557)) from!1053) lt!384337))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1044 (Int (_ BitVec 64)) V!26713)

(assert (=> b!852810 (= lt!384337 (dynLambda!1044 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!384336 () array!48696)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26713)

(declare-fun zeroValue!654 () V!26713)

(declare-fun getCurrentListMapNoExtraKeys!2749 (array!48698 array!48696 (_ BitVec 32) (_ BitVec 32) V!26713 V!26713 (_ BitVec 32) Int) ListLongMap!9505)

(assert (=> b!852810 (= lt!384341 (getCurrentListMapNoExtraKeys!2749 _keys!868 lt!384336 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852811 () Bool)

(declare-fun e!475623 () Bool)

(declare-fun e!475618 () Bool)

(assert (=> b!852811 (= e!475623 (and e!475618 mapRes!25973))))

(declare-fun condMapEmpty!25973 () Bool)

(declare-fun mapDefault!25973 () ValueCell!7685)

