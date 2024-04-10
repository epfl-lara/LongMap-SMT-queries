; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77400 () Bool)

(assert start!77400)

(declare-fun b!902336 () Bool)

(declare-fun e!505336 () Bool)

(declare-fun e!505339 () Bool)

(declare-fun mapRes!29365 () Bool)

(assert (=> b!902336 (= e!505336 (and e!505339 mapRes!29365))))

(declare-fun condMapEmpty!29365 () Bool)

(declare-datatypes ((V!29555 0))(
  ( (V!29556 (val!9272 Int)) )
))
(declare-datatypes ((ValueCell!8740 0))(
  ( (ValueCellFull!8740 (v!11776 V!29555)) (EmptyCell!8740) )
))
(declare-datatypes ((array!52950 0))(
  ( (array!52951 (arr!25438 (Array (_ BitVec 32) ValueCell!8740)) (size!25897 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52950)

(declare-fun mapDefault!29365 () ValueCell!8740)

