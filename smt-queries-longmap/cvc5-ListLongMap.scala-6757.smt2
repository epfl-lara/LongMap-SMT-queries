; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84794 () Bool)

(assert start!84794)

(declare-fun mapIsEmpty!37032 () Bool)

(declare-fun mapRes!37032 () Bool)

(assert (=> mapIsEmpty!37032 mapRes!37032))

(declare-fun b!991409 () Bool)

(declare-fun e!559076 () Bool)

(declare-fun e!559078 () Bool)

(assert (=> b!991409 (= e!559076 (and e!559078 mapRes!37032))))

(declare-fun condMapEmpty!37032 () Bool)

(declare-datatypes ((V!36073 0))(
  ( (V!36074 (val!11709 Int)) )
))
(declare-datatypes ((ValueCell!11177 0))(
  ( (ValueCellFull!11177 (v!14285 V!36073)) (EmptyCell!11177) )
))
(declare-datatypes ((array!62599 0))(
  ( (array!62600 (arr!30149 (Array (_ BitVec 32) ValueCell!11177)) (size!30628 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62599)

(declare-fun mapDefault!37032 () ValueCell!11177)

