; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40534 () Bool)

(assert start!40534)

(declare-fun b!446699 () Bool)

(declare-fun res!265189 () Bool)

(declare-fun e!262403 () Bool)

(assert (=> b!446699 (=> (not res!265189) (not e!262403))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446699 (= res!265189 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!19479 () Bool)

(declare-fun mapRes!19479 () Bool)

(declare-fun tp!37506 () Bool)

(declare-fun e!262401 () Bool)

(assert (=> mapNonEmpty!19479 (= mapRes!19479 (and tp!37506 e!262401))))

(declare-datatypes ((V!16971 0))(
  ( (V!16972 (val!5994 Int)) )
))
(declare-datatypes ((ValueCell!5606 0))(
  ( (ValueCellFull!5606 (v!8249 V!16971)) (EmptyCell!5606) )
))
(declare-datatypes ((array!27605 0))(
  ( (array!27606 (arr!13249 (Array (_ BitVec 32) ValueCell!5606)) (size!13601 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27605)

(declare-fun mapValue!19479 () ValueCell!5606)

(declare-fun mapKey!19479 () (_ BitVec 32))

(declare-fun mapRest!19479 () (Array (_ BitVec 32) ValueCell!5606))

(assert (=> mapNonEmpty!19479 (= (arr!13249 _values!549) (store mapRest!19479 mapKey!19479 mapValue!19479))))

(declare-fun b!446700 () Bool)

(declare-fun e!262404 () Bool)

(declare-fun tp_is_empty!11899 () Bool)

(assert (=> b!446700 (= e!262404 tp_is_empty!11899)))

(declare-fun b!446701 () Bool)

(declare-fun e!262400 () Bool)

(assert (=> b!446701 (= e!262400 (and e!262404 mapRes!19479))))

(declare-fun condMapEmpty!19479 () Bool)

(declare-fun mapDefault!19479 () ValueCell!5606)

