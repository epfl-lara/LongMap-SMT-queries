; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84292 () Bool)

(assert start!84292)

(declare-fun b!986101 () Bool)

(declare-fun e!555925 () Bool)

(declare-fun e!555924 () Bool)

(declare-fun mapRes!36671 () Bool)

(assert (=> b!986101 (= e!555925 (and e!555924 mapRes!36671))))

(declare-fun condMapEmpty!36671 () Bool)

(declare-datatypes ((V!35777 0))(
  ( (V!35778 (val!11598 Int)) )
))
(declare-datatypes ((ValueCell!11066 0))(
  ( (ValueCellFull!11066 (v!14160 V!35777)) (EmptyCell!11066) )
))
(declare-datatypes ((array!62159 0))(
  ( (array!62160 (arr!29937 (Array (_ BitVec 32) ValueCell!11066)) (size!30416 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62159)

(declare-fun mapDefault!36671 () ValueCell!11066)

