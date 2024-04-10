; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72842 () Bool)

(assert start!72842)

(declare-fun b_free!13757 () Bool)

(declare-fun b_next!13757 () Bool)

(assert (=> start!72842 (= b_free!13757 (not b_next!13757))))

(declare-fun tp!48774 () Bool)

(declare-fun b_and!22843 () Bool)

(assert (=> start!72842 (= tp!48774 b_and!22843)))

(declare-fun res!574299 () Bool)

(declare-fun e!471933 () Bool)

(assert (=> start!72842 (=> (not res!574299) (not e!471933))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48006 0))(
  ( (array!48007 (arr!23034 (Array (_ BitVec 32) (_ BitVec 64))) (size!23474 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48006)

(assert (=> start!72842 (= res!574299 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23474 _keys!868))))))

(assert (=> start!72842 e!471933))

(assert (=> start!72842 true))

(assert (=> start!72842 tp!48774))

(declare-fun array_inv!18306 (array!48006) Bool)

(assert (=> start!72842 (array_inv!18306 _keys!868)))

(declare-datatypes ((V!26237 0))(
  ( (V!26238 (val!7994 Int)) )
))
(declare-datatypes ((ValueCell!7507 0))(
  ( (ValueCellFull!7507 (v!10419 V!26237)) (EmptyCell!7507) )
))
(declare-datatypes ((array!48008 0))(
  ( (array!48009 (arr!23035 (Array (_ BitVec 32) ValueCell!7507)) (size!23475 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48008)

(declare-fun e!471936 () Bool)

(declare-fun array_inv!18307 (array!48008) Bool)

(assert (=> start!72842 (and (array_inv!18307 _values!688) e!471936)))

(declare-fun tp_is_empty!15893 () Bool)

(assert (=> start!72842 tp_is_empty!15893))

(declare-fun mapIsEmpty!25439 () Bool)

(declare-fun mapRes!25439 () Bool)

(assert (=> mapIsEmpty!25439 mapRes!25439))

(declare-fun b!845374 () Bool)

(declare-fun e!471934 () Bool)

(assert (=> b!845374 (= e!471934 tp_is_empty!15893)))

(declare-fun mapNonEmpty!25439 () Bool)

(declare-fun tp!48775 () Bool)

(declare-fun e!471937 () Bool)

(assert (=> mapNonEmpty!25439 (= mapRes!25439 (and tp!48775 e!471937))))

(declare-fun mapRest!25439 () (Array (_ BitVec 32) ValueCell!7507))

(declare-fun mapKey!25439 () (_ BitVec 32))

(declare-fun mapValue!25439 () ValueCell!7507)

(assert (=> mapNonEmpty!25439 (= (arr!23035 _values!688) (store mapRest!25439 mapKey!25439 mapValue!25439))))

(declare-fun b!845375 () Bool)

(assert (=> b!845375 (= e!471933 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10440 0))(
  ( (tuple2!10441 (_1!5231 (_ BitVec 64)) (_2!5231 V!26237)) )
))
(declare-datatypes ((List!16303 0))(
  ( (Nil!16300) (Cons!16299 (h!17430 tuple2!10440) (t!22674 List!16303)) )
))
(declare-datatypes ((ListLongMap!9209 0))(
  ( (ListLongMap!9210 (toList!4620 List!16303)) )
))
(declare-fun lt!381406 () ListLongMap!9209)

(declare-fun minValue!654 () V!26237)

(declare-fun zeroValue!654 () V!26237)

(declare-fun getCurrentListMapNoExtraKeys!2605 (array!48006 array!48008 (_ BitVec 32) (_ BitVec 32) V!26237 V!26237 (_ BitVec 32) Int) ListLongMap!9209)

(assert (=> b!845375 (= lt!381406 (getCurrentListMapNoExtraKeys!2605 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845376 () Bool)

(declare-fun res!574295 () Bool)

(assert (=> b!845376 (=> (not res!574295) (not e!471933))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!845376 (= res!574295 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23474 _keys!868))))))

(declare-fun b!845377 () Bool)

(declare-fun res!574298 () Bool)

(assert (=> b!845377 (=> (not res!574298) (not e!471933))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!845377 (= res!574298 (and (= (select (arr!23034 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!845378 () Bool)

(declare-fun res!574300 () Bool)

(assert (=> b!845378 (=> (not res!574300) (not e!471933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48006 (_ BitVec 32)) Bool)

(assert (=> b!845378 (= res!574300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845379 () Bool)

(assert (=> b!845379 (= e!471936 (and e!471934 mapRes!25439))))

(declare-fun condMapEmpty!25439 () Bool)

(declare-fun mapDefault!25439 () ValueCell!7507)

