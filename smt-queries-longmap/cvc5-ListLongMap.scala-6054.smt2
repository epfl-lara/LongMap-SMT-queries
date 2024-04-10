; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78314 () Bool)

(assert start!78314)

(declare-fun b_free!16735 () Bool)

(declare-fun b_next!16735 () Bool)

(assert (=> start!78314 (= b_free!16735 (not b_next!16735))))

(declare-fun tp!58489 () Bool)

(declare-fun b_and!27325 () Bool)

(assert (=> start!78314 (= tp!58489 b_and!27325)))

(declare-fun mapNonEmpty!30464 () Bool)

(declare-fun mapRes!30464 () Bool)

(declare-fun tp!58488 () Bool)

(declare-fun e!512564 () Bool)

(assert (=> mapNonEmpty!30464 (= mapRes!30464 (and tp!58488 e!512564))))

(declare-datatypes ((V!30503 0))(
  ( (V!30504 (val!9627 Int)) )
))
(declare-datatypes ((ValueCell!9095 0))(
  ( (ValueCellFull!9095 (v!12141 V!30503)) (EmptyCell!9095) )
))
(declare-datatypes ((array!54300 0))(
  ( (array!54301 (arr!26102 (Array (_ BitVec 32) ValueCell!9095)) (size!26561 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54300)

(declare-fun mapKey!30464 () (_ BitVec 32))

(declare-fun mapRest!30464 () (Array (_ BitVec 32) ValueCell!9095))

(declare-fun mapValue!30464 () ValueCell!9095)

(assert (=> mapNonEmpty!30464 (= (arr!26102 _values!1152) (store mapRest!30464 mapKey!30464 mapValue!30464))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun b!913753 () Bool)

(declare-fun e!512566 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12548 0))(
  ( (tuple2!12549 (_1!6285 (_ BitVec 64)) (_2!6285 V!30503)) )
))
(declare-datatypes ((List!18336 0))(
  ( (Nil!18333) (Cons!18332 (h!19478 tuple2!12548) (t!25931 List!18336)) )
))
(declare-datatypes ((ListLongMap!11245 0))(
  ( (ListLongMap!11246 (toList!5638 List!18336)) )
))
(declare-fun lt!411111 () ListLongMap!11245)

(declare-fun apply!517 (ListLongMap!11245 (_ BitVec 64)) V!30503)

(declare-fun get!13705 (ValueCell!9095 V!30503) V!30503)

(declare-fun dynLambda!1393 (Int (_ BitVec 64)) V!30503)

(assert (=> b!913753 (= e!512566 (= (apply!517 lt!411111 k!1033) (get!13705 (select (arr!26102 _values!1152) i!717) (dynLambda!1393 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913754 () Bool)

(declare-fun e!512565 () Bool)

(declare-fun e!512561 () Bool)

(assert (=> b!913754 (= e!512565 (and e!512561 mapRes!30464))))

(declare-fun condMapEmpty!30464 () Bool)

(declare-fun mapDefault!30464 () ValueCell!9095)

