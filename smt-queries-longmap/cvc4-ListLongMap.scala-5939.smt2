; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77454 () Bool)

(assert start!77454)

(declare-fun mapIsEmpty!29410 () Bool)

(declare-fun mapRes!29410 () Bool)

(assert (=> mapIsEmpty!29410 mapRes!29410))

(declare-fun b!902668 () Bool)

(declare-fun e!505589 () Bool)

(declare-fun tp_is_empty!18467 () Bool)

(assert (=> b!902668 (= e!505589 tp_is_empty!18467)))

(declare-fun b!902669 () Bool)

(declare-fun e!505593 () Bool)

(assert (=> b!902669 (= e!505593 (and e!505589 mapRes!29410))))

(declare-fun condMapEmpty!29410 () Bool)

(declare-datatypes ((V!29587 0))(
  ( (V!29588 (val!9284 Int)) )
))
(declare-datatypes ((ValueCell!8752 0))(
  ( (ValueCellFull!8752 (v!11789 V!29587)) (EmptyCell!8752) )
))
(declare-datatypes ((array!52996 0))(
  ( (array!52997 (arr!25458 (Array (_ BitVec 32) ValueCell!8752)) (size!25917 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52996)

(declare-fun mapDefault!29410 () ValueCell!8752)

