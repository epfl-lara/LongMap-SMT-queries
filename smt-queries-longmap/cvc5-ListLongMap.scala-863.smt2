; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20274 () Bool)

(assert start!20274)

(declare-fun b_free!4933 () Bool)

(declare-fun b_next!4933 () Bool)

(assert (=> start!20274 (= b_free!4933 (not b_next!4933))))

(declare-fun tp!17830 () Bool)

(declare-fun b_and!11679 () Bool)

(assert (=> start!20274 (= tp!17830 b_and!11679)))

(declare-fun b!199544 () Bool)

(declare-fun e!130979 () Bool)

(declare-fun e!130978 () Bool)

(declare-fun mapRes!8252 () Bool)

(assert (=> b!199544 (= e!130979 (and e!130978 mapRes!8252))))

(declare-fun condMapEmpty!8252 () Bool)

(declare-datatypes ((V!6033 0))(
  ( (V!6034 (val!2439 Int)) )
))
(declare-datatypes ((ValueCell!2051 0))(
  ( (ValueCellFull!2051 (v!4409 V!6033)) (EmptyCell!2051) )
))
(declare-datatypes ((array!8819 0))(
  ( (array!8820 (arr!4160 (Array (_ BitVec 32) ValueCell!2051)) (size!4485 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8819)

(declare-fun mapDefault!8252 () ValueCell!2051)

