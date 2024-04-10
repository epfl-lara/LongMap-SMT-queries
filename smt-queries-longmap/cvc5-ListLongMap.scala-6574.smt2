; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83328 () Bool)

(assert start!83328)

(declare-fun b_free!19321 () Bool)

(declare-fun b_next!19321 () Bool)

(assert (=> start!83328 (= b_free!19321 (not b_next!19321))))

(declare-fun tp!67241 () Bool)

(declare-fun b_and!30863 () Bool)

(assert (=> start!83328 (= tp!67241 b_and!30863)))

(declare-fun b!972756 () Bool)

(declare-fun e!548289 () Bool)

(declare-fun e!548290 () Bool)

(declare-fun mapRes!35338 () Bool)

(assert (=> b!972756 (= e!548289 (and e!548290 mapRes!35338))))

(declare-fun condMapEmpty!35338 () Bool)

(declare-datatypes ((V!34609 0))(
  ( (V!34610 (val!11160 Int)) )
))
(declare-datatypes ((ValueCell!10628 0))(
  ( (ValueCellFull!10628 (v!13719 V!34609)) (EmptyCell!10628) )
))
(declare-datatypes ((array!60483 0))(
  ( (array!60484 (arr!29105 (Array (_ BitVec 32) ValueCell!10628)) (size!29584 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60483)

(declare-fun mapDefault!35338 () ValueCell!10628)

