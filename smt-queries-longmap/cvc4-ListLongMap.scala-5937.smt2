; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77430 () Bool)

(assert start!77430)

(declare-fun b!902523 () Bool)

(declare-fun e!505470 () Bool)

(declare-fun e!505472 () Bool)

(declare-fun mapRes!29389 () Bool)

(assert (=> b!902523 (= e!505470 (and e!505472 mapRes!29389))))

(declare-fun condMapEmpty!29389 () Bool)

(declare-datatypes ((V!29571 0))(
  ( (V!29572 (val!9278 Int)) )
))
(declare-datatypes ((ValueCell!8746 0))(
  ( (ValueCellFull!8746 (v!11782 V!29571)) (EmptyCell!8746) )
))
(declare-datatypes ((array!52972 0))(
  ( (array!52973 (arr!25447 (Array (_ BitVec 32) ValueCell!8746)) (size!25906 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52972)

(declare-fun mapDefault!29389 () ValueCell!8746)

