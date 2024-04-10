; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78562 () Bool)

(assert start!78562)

(declare-fun b_free!16775 () Bool)

(declare-fun b_next!16775 () Bool)

(assert (=> start!78562 (= b_free!16775 (not b_next!16775))))

(declare-fun tp!58766 () Bool)

(declare-fun b_and!27397 () Bool)

(assert (=> start!78562 (= tp!58766 b_and!27397)))

(declare-fun b!915794 () Bool)

(declare-fun res!617409 () Bool)

(declare-fun e!514036 () Bool)

(assert (=> b!915794 (=> (not res!617409) (not e!514036))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54560 0))(
  ( (array!54561 (arr!26225 (Array (_ BitVec 32) (_ BitVec 64))) (size!26684 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54560)

(assert (=> b!915794 (= res!617409 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26684 _keys!1487))))))

(declare-fun b!915795 () Bool)

(declare-fun e!514035 () Bool)

(declare-fun tp_is_empty!19283 () Bool)

(assert (=> b!915795 (= e!514035 tp_is_empty!19283)))

(declare-fun b!915796 () Bool)

(declare-fun e!514033 () Bool)

(assert (=> b!915796 (= e!514033 tp_is_empty!19283)))

(declare-fun b!915797 () Bool)

(declare-fun e!514034 () Bool)

(declare-fun mapRes!30681 () Bool)

(assert (=> b!915797 (= e!514034 (and e!514035 mapRes!30681))))

(declare-fun condMapEmpty!30681 () Bool)

(declare-datatypes ((V!30675 0))(
  ( (V!30676 (val!9692 Int)) )
))
(declare-datatypes ((ValueCell!9160 0))(
  ( (ValueCellFull!9160 (v!12210 V!30675)) (EmptyCell!9160) )
))
(declare-datatypes ((array!54562 0))(
  ( (array!54563 (arr!26226 (Array (_ BitVec 32) ValueCell!9160)) (size!26685 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54562)

(declare-fun mapDefault!30681 () ValueCell!9160)

