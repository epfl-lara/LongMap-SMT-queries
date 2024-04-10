; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82134 () Bool)

(assert start!82134)

(declare-fun b!957365 () Bool)

(declare-fun e!539623 () Bool)

(declare-fun e!539621 () Bool)

(declare-fun mapRes!33649 () Bool)

(assert (=> b!957365 (= e!539623 (and e!539621 mapRes!33649))))

(declare-fun condMapEmpty!33649 () Bool)

(declare-datatypes ((V!33133 0))(
  ( (V!33134 (val!10607 Int)) )
))
(declare-datatypes ((ValueCell!10075 0))(
  ( (ValueCellFull!10075 (v!13164 V!33133)) (EmptyCell!10075) )
))
(declare-datatypes ((array!58333 0))(
  ( (array!58334 (arr!28040 (Array (_ BitVec 32) ValueCell!10075)) (size!28519 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58333)

(declare-fun mapDefault!33649 () ValueCell!10075)

