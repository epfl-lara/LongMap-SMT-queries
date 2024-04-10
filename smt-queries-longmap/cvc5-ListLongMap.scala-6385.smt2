; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82068 () Bool)

(assert start!82068)

(declare-fun b!956977 () Bool)

(declare-fun e!539323 () Bool)

(declare-fun e!539325 () Bool)

(declare-fun mapRes!33595 () Bool)

(assert (=> b!956977 (= e!539323 (and e!539325 mapRes!33595))))

(declare-fun condMapEmpty!33595 () Bool)

(declare-datatypes ((V!33097 0))(
  ( (V!33098 (val!10593 Int)) )
))
(declare-datatypes ((ValueCell!10061 0))(
  ( (ValueCellFull!10061 (v!13149 V!33097)) (EmptyCell!10061) )
))
(declare-datatypes ((array!58271 0))(
  ( (array!58272 (arr!28013 (Array (_ BitVec 32) ValueCell!10061)) (size!28492 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58271)

(declare-fun mapDefault!33595 () ValueCell!10061)

