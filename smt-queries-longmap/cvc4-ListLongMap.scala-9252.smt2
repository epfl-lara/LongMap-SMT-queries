; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110864 () Bool)

(assert start!110864)

(declare-fun b_free!29699 () Bool)

(declare-fun b_next!29699 () Bool)

(assert (=> start!110864 (= b_free!29699 (not b_next!29699))))

(declare-fun tp!104418 () Bool)

(declare-fun b_and!47907 () Bool)

(assert (=> start!110864 (= tp!104418 b_and!47907)))

(declare-fun b!1312495 () Bool)

(declare-fun res!871395 () Bool)

(declare-fun e!748607 () Bool)

(assert (=> b!1312495 (=> (not res!871395) (not e!748607))))

(declare-datatypes ((array!87844 0))(
  ( (array!87845 (arr!42402 (Array (_ BitVec 32) (_ BitVec 64))) (size!42952 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87844)

(declare-datatypes ((List!30070 0))(
  ( (Nil!30067) (Cons!30066 (h!31275 (_ BitVec 64)) (t!43676 List!30070)) )
))
(declare-fun arrayNoDuplicates!0 (array!87844 (_ BitVec 32) List!30070) Bool)

(assert (=> b!1312495 (= res!871395 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30067))))

(declare-fun b!1312496 () Bool)

(declare-fun res!871393 () Bool)

(assert (=> b!1312496 (=> (not res!871393) (not e!748607))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87844 (_ BitVec 32)) Bool)

(assert (=> b!1312496 (= res!871393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312497 () Bool)

(declare-fun e!748603 () Bool)

(declare-fun e!748605 () Bool)

(declare-fun mapRes!54772 () Bool)

(assert (=> b!1312497 (= e!748603 (and e!748605 mapRes!54772))))

(declare-fun condMapEmpty!54772 () Bool)

(declare-datatypes ((V!52341 0))(
  ( (V!52342 (val!17789 Int)) )
))
(declare-datatypes ((ValueCell!16816 0))(
  ( (ValueCellFull!16816 (v!20416 V!52341)) (EmptyCell!16816) )
))
(declare-datatypes ((array!87846 0))(
  ( (array!87847 (arr!42403 (Array (_ BitVec 32) ValueCell!16816)) (size!42953 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87846)

(declare-fun mapDefault!54772 () ValueCell!16816)

