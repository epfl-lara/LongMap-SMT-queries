; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41932 () Bool)

(assert start!41932)

(declare-fun b_free!11521 () Bool)

(declare-fun b_next!11521 () Bool)

(assert (=> start!41932 (= b_free!11521 (not b_next!11521))))

(declare-fun tp!40575 () Bool)

(declare-fun b_and!19909 () Bool)

(assert (=> start!41932 (= tp!40575 b_and!19909)))

(declare-fun b!468158 () Bool)

(declare-fun e!273959 () Bool)

(declare-fun e!273961 () Bool)

(declare-fun mapRes!21115 () Bool)

(assert (=> b!468158 (= e!273959 (and e!273961 mapRes!21115))))

(declare-fun condMapEmpty!21115 () Bool)

(declare-datatypes ((V!18371 0))(
  ( (V!18372 (val!6519 Int)) )
))
(declare-datatypes ((ValueCell!6131 0))(
  ( (ValueCellFull!6131 (v!8808 V!18371)) (EmptyCell!6131) )
))
(declare-datatypes ((array!29675 0))(
  ( (array!29676 (arr!14264 (Array (_ BitVec 32) ValueCell!6131)) (size!14616 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29675)

(declare-fun mapDefault!21115 () ValueCell!6131)

