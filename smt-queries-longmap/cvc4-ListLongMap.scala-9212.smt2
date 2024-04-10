; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110624 () Bool)

(assert start!110624)

(declare-fun b_free!29459 () Bool)

(declare-fun b_next!29459 () Bool)

(assert (=> start!110624 (= b_free!29459 (not b_next!29459))))

(declare-fun tp!103698 () Bool)

(declare-fun b_and!47667 () Bool)

(assert (=> start!110624 (= tp!103698 b_and!47667)))

(declare-fun b!1308971 () Bool)

(declare-fun res!868953 () Bool)

(declare-fun e!746805 () Bool)

(assert (=> b!1308971 (=> (not res!868953) (not e!746805))))

(declare-datatypes ((array!87372 0))(
  ( (array!87373 (arr!42166 (Array (_ BitVec 32) (_ BitVec 64))) (size!42716 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87372)

(declare-datatypes ((List!29895 0))(
  ( (Nil!29892) (Cons!29891 (h!31100 (_ BitVec 64)) (t!43501 List!29895)) )
))
(declare-fun arrayNoDuplicates!0 (array!87372 (_ BitVec 32) List!29895) Bool)

(assert (=> b!1308971 (= res!868953 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29892))))

(declare-fun mapIsEmpty!54412 () Bool)

(declare-fun mapRes!54412 () Bool)

(assert (=> mapIsEmpty!54412 mapRes!54412))

(declare-fun res!868949 () Bool)

(assert (=> start!110624 (=> (not res!868949) (not e!746805))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110624 (= res!868949 (validMask!0 mask!2040))))

(assert (=> start!110624 e!746805))

(assert (=> start!110624 tp!103698))

(declare-fun array_inv!31871 (array!87372) Bool)

(assert (=> start!110624 (array_inv!31871 _keys!1628)))

(assert (=> start!110624 true))

(declare-fun tp_is_empty!35189 () Bool)

(assert (=> start!110624 tp_is_empty!35189))

(declare-datatypes ((V!52021 0))(
  ( (V!52022 (val!17669 Int)) )
))
(declare-datatypes ((ValueCell!16696 0))(
  ( (ValueCellFull!16696 (v!20296 V!52021)) (EmptyCell!16696) )
))
(declare-datatypes ((array!87374 0))(
  ( (array!87375 (arr!42167 (Array (_ BitVec 32) ValueCell!16696)) (size!42717 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87374)

(declare-fun e!746803 () Bool)

(declare-fun array_inv!31872 (array!87374) Bool)

(assert (=> start!110624 (and (array_inv!31872 _values!1354) e!746803)))

(declare-fun b!1308972 () Bool)

(declare-fun e!746807 () Bool)

(assert (=> b!1308972 (= e!746807 tp_is_empty!35189)))

(declare-fun b!1308973 () Bool)

(assert (=> b!1308973 (= e!746803 (and e!746807 mapRes!54412))))

(declare-fun condMapEmpty!54412 () Bool)

(declare-fun mapDefault!54412 () ValueCell!16696)

