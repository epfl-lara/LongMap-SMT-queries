; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97176 () Bool)

(assert start!97176)

(declare-fun b!1105446 () Bool)

(declare-fun res!737605 () Bool)

(declare-fun e!630921 () Bool)

(assert (=> b!1105446 (=> (not res!737605) (not e!630921))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105446 (= res!737605 (validMask!0 mask!1564))))

(declare-fun b!1105447 () Bool)

(declare-fun e!630918 () Bool)

(declare-fun e!630919 () Bool)

(declare-fun mapRes!42928 () Bool)

(assert (=> b!1105447 (= e!630918 (and e!630919 mapRes!42928))))

(declare-fun condMapEmpty!42928 () Bool)

(declare-datatypes ((V!41669 0))(
  ( (V!41670 (val!13760 Int)) )
))
(declare-datatypes ((ValueCell!12994 0))(
  ( (ValueCellFull!12994 (v!16393 V!41669)) (EmptyCell!12994) )
))
(declare-datatypes ((array!71737 0))(
  ( (array!71738 (arr!34521 (Array (_ BitVec 32) ValueCell!12994)) (size!35057 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71737)

(declare-fun mapDefault!42928 () ValueCell!12994)

