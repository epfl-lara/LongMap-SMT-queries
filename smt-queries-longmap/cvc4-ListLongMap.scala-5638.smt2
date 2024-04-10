; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73616 () Bool)

(assert start!73616)

(declare-fun b_free!14531 () Bool)

(declare-fun b_next!14531 () Bool)

(assert (=> start!73616 (= b_free!14531 (not b_next!14531))))

(declare-fun tp!51097 () Bool)

(declare-fun b_and!24041 () Bool)

(assert (=> start!73616 (= tp!51097 b_and!24041)))

(declare-fun b!861562 () Bool)

(declare-fun e!480037 () Bool)

(declare-fun e!480032 () Bool)

(declare-fun mapRes!26600 () Bool)

(assert (=> b!861562 (= e!480037 (and e!480032 mapRes!26600))))

(declare-fun condMapEmpty!26600 () Bool)

(declare-datatypes ((V!27269 0))(
  ( (V!27270 (val!8381 Int)) )
))
(declare-datatypes ((ValueCell!7894 0))(
  ( (ValueCellFull!7894 (v!10806 V!27269)) (EmptyCell!7894) )
))
(declare-datatypes ((array!49500 0))(
  ( (array!49501 (arr!23781 (Array (_ BitVec 32) ValueCell!7894)) (size!24221 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49500)

(declare-fun mapDefault!26600 () ValueCell!7894)

