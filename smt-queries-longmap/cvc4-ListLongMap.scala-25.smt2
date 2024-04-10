; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!576 () Bool)

(assert start!576)

(declare-fun b!3520 () Bool)

(declare-fun e!1714 () Bool)

(declare-fun tp_is_empty!137 () Bool)

(assert (=> b!3520 (= e!1714 tp_is_empty!137)))

(declare-fun mapIsEmpty!161 () Bool)

(declare-fun mapRes!161 () Bool)

(assert (=> mapIsEmpty!161 mapRes!161))

(declare-fun b!3521 () Bool)

(declare-fun e!1718 () Bool)

(assert (=> b!3521 (= e!1718 false)))

(declare-fun lt!489 () Bool)

(declare-datatypes ((array!213 0))(
  ( (array!214 (arr!100 (Array (_ BitVec 32) (_ BitVec 64))) (size!162 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!213)

(declare-datatypes ((List!62 0))(
  ( (Nil!59) (Cons!58 (h!624 (_ BitVec 64)) (t!2189 List!62)) )
))
(declare-fun arrayNoDuplicates!0 (array!213 (_ BitVec 32) List!62) Bool)

(assert (=> b!3521 (= lt!489 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!59))))

(declare-fun b!3522 () Bool)

(declare-fun e!1715 () Bool)

(declare-fun e!1716 () Bool)

(assert (=> b!3522 (= e!1715 (and e!1716 mapRes!161))))

(declare-fun condMapEmpty!161 () Bool)

(declare-datatypes ((V!359 0))(
  ( (V!360 (val!74 Int)) )
))
(declare-datatypes ((ValueCell!52 0))(
  ( (ValueCellFull!52 (v!1161 V!359)) (EmptyCell!52) )
))
(declare-datatypes ((array!215 0))(
  ( (array!216 (arr!101 (Array (_ BitVec 32) ValueCell!52)) (size!163 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!215)

(declare-fun mapDefault!161 () ValueCell!52)

