; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!460 () Bool)

(assert start!460)

(declare-fun b!2729 () Bool)

(declare-fun e!1082 () Bool)

(declare-fun tp_is_empty!65 () Bool)

(assert (=> b!2729 (= e!1082 tp_is_empty!65)))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun e!1083 () Bool)

(declare-datatypes ((array!59 0))(
  ( (array!60 (arr!28 (Array (_ BitVec 32) (_ BitVec 64))) (size!90 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!59)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun b!2730 () Bool)

(declare-datatypes ((V!263 0))(
  ( (V!264 (val!38 Int)) )
))
(declare-datatypes ((ValueCell!16 0))(
  ( (ValueCellFull!16 (v!1124 V!263)) (EmptyCell!16) )
))
(declare-datatypes ((array!61 0))(
  ( (array!62 (arr!29 (Array (_ BitVec 32) ValueCell!16)) (size!91 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!61)

(assert (=> b!2730 (= e!1083 (and (= (size!91 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!90 _keys!1806) (size!91 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011) (= (size!90 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250)) (bvsgt #b00000000000000000000000000000000 (size!90 _keys!1806))))))

(declare-fun b!2731 () Bool)

(declare-fun e!1081 () Bool)

(declare-fun mapRes!38 () Bool)

(assert (=> b!2731 (= e!1081 (and e!1082 mapRes!38))))

(declare-fun condMapEmpty!38 () Bool)

(declare-fun mapDefault!38 () ValueCell!16)

