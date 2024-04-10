; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84280 () Bool)

(assert start!84280)

(declare-fun b!985993 () Bool)

(declare-fun e!555833 () Bool)

(declare-fun e!555837 () Bool)

(declare-fun mapRes!36653 () Bool)

(assert (=> b!985993 (= e!555833 (and e!555837 mapRes!36653))))

(declare-fun condMapEmpty!36653 () Bool)

(declare-datatypes ((V!35761 0))(
  ( (V!35762 (val!11592 Int)) )
))
(declare-datatypes ((ValueCell!11060 0))(
  ( (ValueCellFull!11060 (v!14154 V!35761)) (EmptyCell!11060) )
))
(declare-datatypes ((array!62139 0))(
  ( (array!62140 (arr!29927 (Array (_ BitVec 32) ValueCell!11060)) (size!30406 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62139)

(declare-fun mapDefault!36653 () ValueCell!11060)

