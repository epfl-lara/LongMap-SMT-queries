; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35340 () Bool)

(assert start!35340)

(declare-fun b!353901 () Bool)

(declare-fun e!216808 () Bool)

(declare-fun e!216807 () Bool)

(declare-fun mapRes!13212 () Bool)

(assert (=> b!353901 (= e!216808 (and e!216807 mapRes!13212))))

(declare-fun condMapEmpty!13212 () Bool)

(declare-datatypes ((V!11383 0))(
  ( (V!11384 (val!3947 Int)) )
))
(declare-datatypes ((ValueCell!3559 0))(
  ( (ValueCellFull!3559 (v!6141 V!11383)) (EmptyCell!3559) )
))
(declare-datatypes ((array!19205 0))(
  ( (array!19206 (arr!9097 (Array (_ BitVec 32) ValueCell!3559)) (size!9449 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19205)

(declare-fun mapDefault!13212 () ValueCell!3559)

