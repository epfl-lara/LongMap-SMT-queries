; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77414 () Bool)

(assert start!77414)

(declare-fun b!902418 () Bool)

(declare-fun e!505396 () Bool)

(declare-fun e!505399 () Bool)

(declare-fun mapRes!29377 () Bool)

(assert (=> b!902418 (= e!505396 (and e!505399 mapRes!29377))))

(declare-fun condMapEmpty!29377 () Bool)

(declare-datatypes ((V!29563 0))(
  ( (V!29564 (val!9275 Int)) )
))
(declare-datatypes ((ValueCell!8743 0))(
  ( (ValueCellFull!8743 (v!11779 V!29563)) (EmptyCell!8743) )
))
(declare-datatypes ((array!52960 0))(
  ( (array!52961 (arr!25442 (Array (_ BitVec 32) ValueCell!8743)) (size!25901 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52960)

(declare-fun mapDefault!29377 () ValueCell!8743)

