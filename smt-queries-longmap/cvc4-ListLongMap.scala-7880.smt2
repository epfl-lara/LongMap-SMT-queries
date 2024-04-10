; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98028 () Bool)

(assert start!98028)

(declare-fun b_free!23729 () Bool)

(declare-fun b_next!23729 () Bool)

(assert (=> start!98028 (= b_free!23729 (not b_next!23729))))

(declare-fun tp!83891 () Bool)

(declare-fun b_and!38241 () Bool)

(assert (=> start!98028 (= tp!83891 b_and!38241)))

(declare-fun mapIsEmpty!44206 () Bool)

(declare-fun mapRes!44206 () Bool)

(assert (=> mapIsEmpty!44206 mapRes!44206))

(declare-fun b!1124946 () Bool)

(declare-fun e!640376 () Bool)

(declare-fun e!640373 () Bool)

(assert (=> b!1124946 (= e!640376 (and e!640373 mapRes!44206))))

(declare-fun condMapEmpty!44206 () Bool)

(declare-datatypes ((V!42805 0))(
  ( (V!42806 (val!14186 Int)) )
))
(declare-datatypes ((ValueCell!13420 0))(
  ( (ValueCellFull!13420 (v!16819 V!42805)) (EmptyCell!13420) )
))
(declare-datatypes ((array!73385 0))(
  ( (array!73386 (arr!35345 (Array (_ BitVec 32) ValueCell!13420)) (size!35881 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73385)

(declare-fun mapDefault!44206 () ValueCell!13420)

