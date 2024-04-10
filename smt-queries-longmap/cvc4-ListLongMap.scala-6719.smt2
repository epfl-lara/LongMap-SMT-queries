; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84290 () Bool)

(assert start!84290)

(declare-fun b!986083 () Bool)

(declare-fun e!555909 () Bool)

(declare-fun e!555910 () Bool)

(declare-fun mapRes!36668 () Bool)

(assert (=> b!986083 (= e!555909 (and e!555910 mapRes!36668))))

(declare-fun condMapEmpty!36668 () Bool)

(declare-datatypes ((V!35773 0))(
  ( (V!35774 (val!11597 Int)) )
))
(declare-datatypes ((ValueCell!11065 0))(
  ( (ValueCellFull!11065 (v!14159 V!35773)) (EmptyCell!11065) )
))
(declare-datatypes ((array!62157 0))(
  ( (array!62158 (arr!29936 (Array (_ BitVec 32) ValueCell!11065)) (size!30415 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62157)

(declare-fun mapDefault!36668 () ValueCell!11065)

