; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40376 () Bool)

(assert start!40376)

(declare-fun b!443678 () Bool)

(declare-fun res!262954 () Bool)

(declare-fun e!261021 () Bool)

(assert (=> b!443678 (=> (not res!262954) (not e!261021))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443678 (= res!262954 (validKeyInArray!0 k!794))))

(declare-fun b!443680 () Bool)

(declare-fun e!261026 () Bool)

(declare-fun e!261025 () Bool)

(declare-fun mapRes!19269 () Bool)

(assert (=> b!443680 (= e!261026 (and e!261025 mapRes!19269))))

(declare-fun condMapEmpty!19269 () Bool)

(declare-datatypes ((V!16787 0))(
  ( (V!16788 (val!5925 Int)) )
))
(declare-datatypes ((ValueCell!5537 0))(
  ( (ValueCellFull!5537 (v!8176 V!16787)) (EmptyCell!5537) )
))
(declare-datatypes ((array!27333 0))(
  ( (array!27334 (arr!13114 (Array (_ BitVec 32) ValueCell!5537)) (size!13466 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27333)

(declare-fun mapDefault!19269 () ValueCell!5537)

