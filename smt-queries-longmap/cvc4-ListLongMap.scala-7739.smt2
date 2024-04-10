; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97182 () Bool)

(assert start!97182)

(declare-fun b!1105563 () Bool)

(declare-fun res!737698 () Bool)

(declare-fun e!630975 () Bool)

(assert (=> b!1105563 (=> (not res!737698) (not e!630975))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105563 (= res!737698 (validMask!0 mask!1564))))

(declare-fun b!1105564 () Bool)

(declare-fun e!630974 () Bool)

(declare-fun e!630972 () Bool)

(declare-fun mapRes!42937 () Bool)

(assert (=> b!1105564 (= e!630974 (and e!630972 mapRes!42937))))

(declare-fun condMapEmpty!42937 () Bool)

(declare-datatypes ((V!41677 0))(
  ( (V!41678 (val!13763 Int)) )
))
(declare-datatypes ((ValueCell!12997 0))(
  ( (ValueCellFull!12997 (v!16396 V!41677)) (EmptyCell!12997) )
))
(declare-datatypes ((array!71747 0))(
  ( (array!71748 (arr!34526 (Array (_ BitVec 32) ValueCell!12997)) (size!35062 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71747)

(declare-fun mapDefault!42937 () ValueCell!12997)

