; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72374 () Bool)

(assert start!72374)

(declare-fun b_free!13559 () Bool)

(declare-fun b_next!13559 () Bool)

(assert (=> start!72374 (= b_free!13559 (not b_next!13559))))

(declare-fun tp!47776 () Bool)

(declare-fun b_and!22645 () Bool)

(assert (=> start!72374 (= tp!47776 b_and!22645)))

(declare-fun res!570301 () Bool)

(declare-fun e!468143 () Bool)

(assert (=> start!72374 (=> (not res!570301) (not e!468143))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47136 0))(
  ( (array!47137 (arr!22599 (Array (_ BitVec 32) (_ BitVec 64))) (size!23039 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47136)

(assert (=> start!72374 (= res!570301 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23039 _keys!868))))))

(assert (=> start!72374 e!468143))

(declare-fun tp_is_empty!15425 () Bool)

(assert (=> start!72374 tp_is_empty!15425))

(assert (=> start!72374 true))

(assert (=> start!72374 tp!47776))

(declare-fun array_inv!18004 (array!47136) Bool)

(assert (=> start!72374 (array_inv!18004 _keys!868)))

(declare-datatypes ((V!25613 0))(
  ( (V!25614 (val!7760 Int)) )
))
(declare-datatypes ((ValueCell!7273 0))(
  ( (ValueCellFull!7273 (v!10185 V!25613)) (EmptyCell!7273) )
))
(declare-datatypes ((array!47138 0))(
  ( (array!47139 (arr!22600 (Array (_ BitVec 32) ValueCell!7273)) (size!23040 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47138)

(declare-fun e!468148 () Bool)

(declare-fun array_inv!18005 (array!47138) Bool)

(assert (=> start!72374 (and (array_inv!18005 _values!688) e!468148)))

(declare-fun v!557 () V!25613)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10266 0))(
  ( (tuple2!10267 (_1!5144 (_ BitVec 64)) (_2!5144 V!25613)) )
))
(declare-datatypes ((List!16068 0))(
  ( (Nil!16065) (Cons!16064 (h!17195 tuple2!10266) (t!22439 List!16068)) )
))
(declare-datatypes ((ListLongMap!9035 0))(
  ( (ListLongMap!9036 (toList!4533 List!16068)) )
))
(declare-fun call!36910 () ListLongMap!9035)

(declare-fun minValue!654 () V!25613)

(declare-fun bm!36907 () Bool)

(declare-fun zeroValue!654 () V!25613)

(declare-fun getCurrentListMapNoExtraKeys!2525 (array!47136 array!47138 (_ BitVec 32) (_ BitVec 32) V!25613 V!25613 (_ BitVec 32) Int) ListLongMap!9035)

(assert (=> bm!36907 (= call!36910 (getCurrentListMapNoExtraKeys!2525 _keys!868 (array!47139 (store (arr!22600 _values!688) i!612 (ValueCellFull!7273 v!557)) (size!23040 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838712 () Bool)

(declare-fun e!468147 () Bool)

(declare-fun mapRes!24737 () Bool)

(assert (=> b!838712 (= e!468148 (and e!468147 mapRes!24737))))

(declare-fun condMapEmpty!24737 () Bool)

(declare-fun mapDefault!24737 () ValueCell!7273)

