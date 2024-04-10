; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73034 () Bool)

(assert start!73034)

(declare-fun b_free!13949 () Bool)

(declare-fun b_next!13949 () Bool)

(assert (=> start!73034 (= b_free!13949 (not b_next!13949))))

(declare-fun tp!49350 () Bool)

(declare-fun b_and!23057 () Bool)

(assert (=> start!73034 (= tp!49350 b_and!23057)))

(declare-fun b!848956 () Bool)

(declare-fun e!473652 () Bool)

(declare-fun tp_is_empty!16085 () Bool)

(assert (=> b!848956 (= e!473652 tp_is_empty!16085)))

(declare-fun res!576767 () Bool)

(declare-fun e!473649 () Bool)

(assert (=> start!73034 (=> (not res!576767) (not e!473649))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48376 0))(
  ( (array!48377 (arr!23219 (Array (_ BitVec 32) (_ BitVec 64))) (size!23659 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48376)

(assert (=> start!73034 (= res!576767 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23659 _keys!868))))))

(assert (=> start!73034 e!473649))

(assert (=> start!73034 tp_is_empty!16085))

(assert (=> start!73034 true))

(assert (=> start!73034 tp!49350))

(declare-fun array_inv!18430 (array!48376) Bool)

(assert (=> start!73034 (array_inv!18430 _keys!868)))

(declare-datatypes ((V!26493 0))(
  ( (V!26494 (val!8090 Int)) )
))
(declare-datatypes ((ValueCell!7603 0))(
  ( (ValueCellFull!7603 (v!10515 V!26493)) (EmptyCell!7603) )
))
(declare-datatypes ((array!48378 0))(
  ( (array!48379 (arr!23220 (Array (_ BitVec 32) ValueCell!7603)) (size!23660 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48378)

(declare-fun e!473651 () Bool)

(declare-fun array_inv!18431 (array!48378) Bool)

(assert (=> start!73034 (and (array_inv!18431 _values!688) e!473651)))

(declare-fun b!848957 () Bool)

(declare-fun e!473653 () Bool)

(assert (=> b!848957 (= e!473649 e!473653)))

(declare-fun res!576763 () Bool)

(assert (=> b!848957 (=> (not res!576763) (not e!473653))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848957 (= res!576763 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10586 0))(
  ( (tuple2!10587 (_1!5304 (_ BitVec 64)) (_2!5304 V!26493)) )
))
(declare-datatypes ((List!16439 0))(
  ( (Nil!16436) (Cons!16435 (h!17566 tuple2!10586) (t!22834 List!16439)) )
))
(declare-datatypes ((ListLongMap!9355 0))(
  ( (ListLongMap!9356 (toList!4693 List!16439)) )
))
(declare-fun lt!382152 () ListLongMap!9355)

(declare-fun minValue!654 () V!26493)

(declare-fun zeroValue!654 () V!26493)

(declare-fun lt!382153 () array!48378)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2675 (array!48376 array!48378 (_ BitVec 32) (_ BitVec 32) V!26493 V!26493 (_ BitVec 32) Int) ListLongMap!9355)

(assert (=> b!848957 (= lt!382152 (getCurrentListMapNoExtraKeys!2675 _keys!868 lt!382153 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26493)

(assert (=> b!848957 (= lt!382153 (array!48379 (store (arr!23220 _values!688) i!612 (ValueCellFull!7603 v!557)) (size!23660 _values!688)))))

(declare-fun lt!382150 () ListLongMap!9355)

(assert (=> b!848957 (= lt!382150 (getCurrentListMapNoExtraKeys!2675 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848958 () Bool)

(declare-fun mapRes!25727 () Bool)

(assert (=> b!848958 (= e!473651 (and e!473652 mapRes!25727))))

(declare-fun condMapEmpty!25727 () Bool)

(declare-fun mapDefault!25727 () ValueCell!7603)

