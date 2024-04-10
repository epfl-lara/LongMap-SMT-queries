; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41864 () Bool)

(assert start!41864)

(declare-fun b_free!11467 () Bool)

(declare-fun b_next!11467 () Bool)

(assert (=> start!41864 (= b_free!11467 (not b_next!11467))))

(declare-fun tp!40411 () Bool)

(declare-fun b_and!19847 () Bool)

(assert (=> start!41864 (= tp!40411 b_and!19847)))

(declare-fun b!467450 () Bool)

(declare-fun e!273441 () Bool)

(declare-fun e!273440 () Bool)

(declare-fun mapRes!21031 () Bool)

(assert (=> b!467450 (= e!273441 (and e!273440 mapRes!21031))))

(declare-fun condMapEmpty!21031 () Bool)

(declare-datatypes ((V!18299 0))(
  ( (V!18300 (val!6492 Int)) )
))
(declare-datatypes ((ValueCell!6104 0))(
  ( (ValueCellFull!6104 (v!8781 V!18299)) (EmptyCell!6104) )
))
(declare-datatypes ((array!29567 0))(
  ( (array!29568 (arr!14211 (Array (_ BitVec 32) ValueCell!6104)) (size!14563 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29567)

(declare-fun mapDefault!21031 () ValueCell!6104)

