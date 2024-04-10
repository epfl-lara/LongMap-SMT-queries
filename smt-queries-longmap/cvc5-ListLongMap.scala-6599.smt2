; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83478 () Bool)

(assert start!83478)

(declare-fun b_free!19465 () Bool)

(declare-fun b_next!19465 () Bool)

(assert (=> start!83478 (= b_free!19465 (not b_next!19465))))

(declare-fun tp!67683 () Bool)

(declare-fun b_and!31067 () Bool)

(assert (=> start!83478 (= tp!67683 b_and!31067)))

(declare-fun b!975127 () Bool)

(declare-fun e!549594 () Bool)

(declare-fun e!549593 () Bool)

(declare-fun mapRes!35563 () Bool)

(assert (=> b!975127 (= e!549594 (and e!549593 mapRes!35563))))

(declare-fun condMapEmpty!35563 () Bool)

(declare-datatypes ((V!34809 0))(
  ( (V!34810 (val!11235 Int)) )
))
(declare-datatypes ((ValueCell!10703 0))(
  ( (ValueCellFull!10703 (v!13794 V!34809)) (EmptyCell!10703) )
))
(declare-datatypes ((array!60771 0))(
  ( (array!60772 (arr!29249 (Array (_ BitVec 32) ValueCell!10703)) (size!29728 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60771)

(declare-fun mapDefault!35563 () ValueCell!10703)

