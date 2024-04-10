; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111014 () Bool)

(assert start!111014)

(declare-fun b_free!29849 () Bool)

(declare-fun b_next!29849 () Bool)

(assert (=> start!111014 (= b_free!29849 (not b_next!29849))))

(declare-fun tp!104868 () Bool)

(declare-fun b_and!48057 () Bool)

(assert (=> start!111014 (= tp!104868 b_and!48057)))

(declare-fun b!1314362 () Bool)

(declare-fun e!749731 () Bool)

(declare-fun tp_is_empty!35579 () Bool)

(assert (=> b!1314362 (= e!749731 tp_is_empty!35579)))

(declare-fun b!1314363 () Bool)

(declare-fun e!749732 () Bool)

(declare-fun e!749729 () Bool)

(declare-fun mapRes!54997 () Bool)

(assert (=> b!1314363 (= e!749732 (and e!749729 mapRes!54997))))

(declare-fun condMapEmpty!54997 () Bool)

(declare-datatypes ((V!52541 0))(
  ( (V!52542 (val!17864 Int)) )
))
(declare-datatypes ((ValueCell!16891 0))(
  ( (ValueCellFull!16891 (v!20491 V!52541)) (EmptyCell!16891) )
))
(declare-datatypes ((array!88130 0))(
  ( (array!88131 (arr!42545 (Array (_ BitVec 32) ValueCell!16891)) (size!43095 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88130)

(declare-fun mapDefault!54997 () ValueCell!16891)

