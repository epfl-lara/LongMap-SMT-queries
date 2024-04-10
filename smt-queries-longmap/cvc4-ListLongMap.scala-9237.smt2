; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110774 () Bool)

(assert start!110774)

(declare-fun b_free!29609 () Bool)

(declare-fun b_next!29609 () Bool)

(assert (=> start!110774 (= b_free!29609 (not b_next!29609))))

(declare-fun tp!104149 () Bool)

(declare-fun b_and!47817 () Bool)

(assert (=> start!110774 (= tp!104149 b_and!47817)))

(declare-fun b!1311095 () Bool)

(declare-fun res!870398 () Bool)

(declare-fun e!747928 () Bool)

(assert (=> b!1311095 (=> (not res!870398) (not e!747928))))

(declare-datatypes ((array!87666 0))(
  ( (array!87667 (arr!42313 (Array (_ BitVec 32) (_ BitVec 64))) (size!42863 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87666)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87666 (_ BitVec 32)) Bool)

(assert (=> b!1311095 (= res!870398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311096 () Bool)

(declare-fun e!747932 () Bool)

(declare-fun e!747931 () Bool)

(declare-fun mapRes!54637 () Bool)

(assert (=> b!1311096 (= e!747932 (and e!747931 mapRes!54637))))

(declare-fun condMapEmpty!54637 () Bool)

(declare-datatypes ((V!52221 0))(
  ( (V!52222 (val!17744 Int)) )
))
(declare-datatypes ((ValueCell!16771 0))(
  ( (ValueCellFull!16771 (v!20371 V!52221)) (EmptyCell!16771) )
))
(declare-datatypes ((array!87668 0))(
  ( (array!87669 (arr!42314 (Array (_ BitVec 32) ValueCell!16771)) (size!42864 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87668)

(declare-fun mapDefault!54637 () ValueCell!16771)

