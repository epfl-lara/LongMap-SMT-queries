; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73012 () Bool)

(assert start!73012)

(declare-fun b_free!13927 () Bool)

(declare-fun b_next!13927 () Bool)

(assert (=> start!73012 (= b_free!13927 (not b_next!13927))))

(declare-fun tp!49285 () Bool)

(declare-fun b_and!23013 () Bool)

(assert (=> start!73012 (= tp!49285 b_and!23013)))

(declare-fun mapIsEmpty!25694 () Bool)

(declare-fun mapRes!25694 () Bool)

(assert (=> mapIsEmpty!25694 mapRes!25694))

(declare-fun mapNonEmpty!25694 () Bool)

(declare-fun tp!49284 () Bool)

(declare-fun e!473386 () Bool)

(assert (=> mapNonEmpty!25694 (= mapRes!25694 (and tp!49284 e!473386))))

(declare-fun mapKey!25694 () (_ BitVec 32))

(declare-datatypes ((V!26465 0))(
  ( (V!26466 (val!8079 Int)) )
))
(declare-datatypes ((ValueCell!7592 0))(
  ( (ValueCellFull!7592 (v!10504 V!26465)) (EmptyCell!7592) )
))
(declare-fun mapRest!25694 () (Array (_ BitVec 32) ValueCell!7592))

(declare-datatypes ((array!48332 0))(
  ( (array!48333 (arr!23197 (Array (_ BitVec 32) ValueCell!7592)) (size!23637 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48332)

(declare-fun mapValue!25694 () ValueCell!7592)

(assert (=> mapNonEmpty!25694 (= (arr!23197 _values!688) (store mapRest!25694 mapKey!25694 mapValue!25694))))

(declare-fun b!848439 () Bool)

(declare-fun res!576437 () Bool)

(declare-fun e!473388 () Bool)

(assert (=> b!848439 (=> (not res!576437) (not e!473388))))

(declare-datatypes ((array!48334 0))(
  ( (array!48335 (arr!23198 (Array (_ BitVec 32) (_ BitVec 64))) (size!23638 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48334)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48334 (_ BitVec 32)) Bool)

(assert (=> b!848439 (= res!576437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848440 () Bool)

(declare-fun res!576436 () Bool)

(assert (=> b!848440 (=> (not res!576436) (not e!473388))))

(declare-datatypes ((List!16420 0))(
  ( (Nil!16417) (Cons!16416 (h!17547 (_ BitVec 64)) (t!22793 List!16420)) )
))
(declare-fun arrayNoDuplicates!0 (array!48334 (_ BitVec 32) List!16420) Bool)

(assert (=> b!848440 (= res!576436 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16417))))

(declare-fun b!848441 () Bool)

(declare-fun e!473391 () Bool)

(declare-datatypes ((tuple2!10564 0))(
  ( (tuple2!10565 (_1!5293 (_ BitVec 64)) (_2!5293 V!26465)) )
))
(declare-datatypes ((List!16421 0))(
  ( (Nil!16418) (Cons!16417 (h!17548 tuple2!10564) (t!22794 List!16421)) )
))
(declare-datatypes ((ListLongMap!9333 0))(
  ( (ListLongMap!9334 (toList!4682 List!16421)) )
))
(declare-fun call!37637 () ListLongMap!9333)

(declare-fun call!37636 () ListLongMap!9333)

(assert (=> b!848441 (= e!473391 (= call!37637 call!37636))))

(declare-fun b!848442 () Bool)

(declare-fun tp_is_empty!16063 () Bool)

(assert (=> b!848442 (= e!473386 tp_is_empty!16063)))

(declare-fun b!848443 () Bool)

(declare-fun res!576434 () Bool)

(assert (=> b!848443 (=> (not res!576434) (not e!473388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848443 (= res!576434 (validMask!0 mask!1196))))

(declare-fun b!848444 () Bool)

(declare-fun res!576430 () Bool)

(assert (=> b!848444 (=> (not res!576430) (not e!473388))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!848444 (= res!576430 (and (= (size!23637 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23638 _keys!868) (size!23637 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848445 () Bool)

(declare-fun res!576431 () Bool)

(assert (=> b!848445 (=> (not res!576431) (not e!473388))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848445 (= res!576431 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23638 _keys!868))))))

(declare-fun b!848446 () Bool)

(declare-fun e!473390 () Bool)

(declare-fun e!473385 () Bool)

(assert (=> b!848446 (= e!473390 (and e!473385 mapRes!25694))))

(declare-fun condMapEmpty!25694 () Bool)

(declare-fun mapDefault!25694 () ValueCell!7592)

