; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72908 () Bool)

(assert start!72908)

(declare-fun b_free!13823 () Bool)

(declare-fun b_next!13823 () Bool)

(assert (=> start!72908 (= b_free!13823 (not b_next!13823))))

(declare-fun tp!48973 () Bool)

(declare-fun b_and!22909 () Bool)

(assert (=> start!72908 (= tp!48973 b_and!22909)))

(declare-fun res!575089 () Bool)

(declare-fun e!472432 () Bool)

(assert (=> start!72908 (=> (not res!575089) (not e!472432))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48130 0))(
  ( (array!48131 (arr!23096 (Array (_ BitVec 32) (_ BitVec 64))) (size!23536 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48130)

(assert (=> start!72908 (= res!575089 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23536 _keys!868))))))

(assert (=> start!72908 e!472432))

(declare-fun tp_is_empty!15959 () Bool)

(assert (=> start!72908 tp_is_empty!15959))

(assert (=> start!72908 true))

(assert (=> start!72908 tp!48973))

(declare-fun array_inv!18350 (array!48130) Bool)

(assert (=> start!72908 (array_inv!18350 _keys!868)))

(declare-datatypes ((V!26325 0))(
  ( (V!26326 (val!8027 Int)) )
))
(declare-datatypes ((ValueCell!7540 0))(
  ( (ValueCellFull!7540 (v!10452 V!26325)) (EmptyCell!7540) )
))
(declare-datatypes ((array!48132 0))(
  ( (array!48133 (arr!23097 (Array (_ BitVec 32) ValueCell!7540)) (size!23537 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48132)

(declare-fun e!472428 () Bool)

(declare-fun array_inv!18351 (array!48132) Bool)

(assert (=> start!72908 (and (array_inv!18351 _values!688) e!472428)))

(declare-fun b!846463 () Bool)

(declare-fun res!575086 () Bool)

(assert (=> b!846463 (=> (not res!575086) (not e!472432))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!846463 (= res!575086 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23536 _keys!868))))))

(declare-fun b!846464 () Bool)

(declare-fun e!472430 () Bool)

(assert (=> b!846464 (= e!472430 tp_is_empty!15959)))

(declare-fun b!846465 () Bool)

(assert (=> b!846465 (= e!472432 false)))

(declare-fun v!557 () V!26325)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10484 0))(
  ( (tuple2!10485 (_1!5253 (_ BitVec 64)) (_2!5253 V!26325)) )
))
(declare-datatypes ((List!16345 0))(
  ( (Nil!16342) (Cons!16341 (h!17472 tuple2!10484) (t!22716 List!16345)) )
))
(declare-datatypes ((ListLongMap!9253 0))(
  ( (ListLongMap!9254 (toList!4642 List!16345)) )
))
(declare-fun lt!381541 () ListLongMap!9253)

(declare-fun minValue!654 () V!26325)

(declare-fun zeroValue!654 () V!26325)

(declare-fun getCurrentListMapNoExtraKeys!2627 (array!48130 array!48132 (_ BitVec 32) (_ BitVec 32) V!26325 V!26325 (_ BitVec 32) Int) ListLongMap!9253)

(assert (=> b!846465 (= lt!381541 (getCurrentListMapNoExtraKeys!2627 _keys!868 (array!48133 (store (arr!23097 _values!688) i!612 (ValueCellFull!7540 v!557)) (size!23537 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381540 () ListLongMap!9253)

(assert (=> b!846465 (= lt!381540 (getCurrentListMapNoExtraKeys!2627 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25538 () Bool)

(declare-fun mapRes!25538 () Bool)

(declare-fun tp!48972 () Bool)

(declare-fun e!472429 () Bool)

(assert (=> mapNonEmpty!25538 (= mapRes!25538 (and tp!48972 e!472429))))

(declare-fun mapKey!25538 () (_ BitVec 32))

(declare-fun mapRest!25538 () (Array (_ BitVec 32) ValueCell!7540))

(declare-fun mapValue!25538 () ValueCell!7540)

(assert (=> mapNonEmpty!25538 (= (arr!23097 _values!688) (store mapRest!25538 mapKey!25538 mapValue!25538))))

(declare-fun b!846466 () Bool)

(declare-fun res!575091 () Bool)

(assert (=> b!846466 (=> (not res!575091) (not e!472432))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846466 (= res!575091 (validKeyInArray!0 k!854))))

(declare-fun b!846467 () Bool)

(assert (=> b!846467 (= e!472429 tp_is_empty!15959)))

(declare-fun b!846468 () Bool)

(declare-fun res!575088 () Bool)

(assert (=> b!846468 (=> (not res!575088) (not e!472432))))

(assert (=> b!846468 (= res!575088 (and (= (select (arr!23096 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!846469 () Bool)

(assert (=> b!846469 (= e!472428 (and e!472430 mapRes!25538))))

(declare-fun condMapEmpty!25538 () Bool)

(declare-fun mapDefault!25538 () ValueCell!7540)

