; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83236 () Bool)

(assert start!83236)

(declare-fun b_free!19229 () Bool)

(declare-fun b_next!19229 () Bool)

(assert (=> start!83236 (= b_free!19229 (not b_next!19229))))

(declare-fun tp!66966 () Bool)

(declare-fun b_and!30717 () Bool)

(assert (=> start!83236 (= tp!66966 b_and!30717)))

(declare-fun mapIsEmpty!35200 () Bool)

(declare-fun mapRes!35200 () Bool)

(assert (=> mapIsEmpty!35200 mapRes!35200))

(declare-fun b!971239 () Bool)

(declare-fun e!547516 () Bool)

(declare-fun e!547515 () Bool)

(assert (=> b!971239 (= e!547516 (and e!547515 mapRes!35200))))

(declare-fun condMapEmpty!35200 () Bool)

(declare-datatypes ((V!34485 0))(
  ( (V!34486 (val!11114 Int)) )
))
(declare-datatypes ((ValueCell!10582 0))(
  ( (ValueCellFull!10582 (v!13673 V!34485)) (EmptyCell!10582) )
))
(declare-datatypes ((array!60307 0))(
  ( (array!60308 (arr!29017 (Array (_ BitVec 32) ValueCell!10582)) (size!29496 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60307)

(declare-fun mapDefault!35200 () ValueCell!10582)

