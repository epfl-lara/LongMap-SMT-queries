; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110764 () Bool)

(assert start!110764)

(declare-fun b_free!29599 () Bool)

(declare-fun b_next!29599 () Bool)

(assert (=> start!110764 (= b_free!29599 (not b_next!29599))))

(declare-fun tp!104119 () Bool)

(declare-fun b_and!47807 () Bool)

(assert (=> start!110764 (= tp!104119 b_and!47807)))

(declare-fun b!1310975 () Bool)

(declare-fun res!870325 () Bool)

(declare-fun e!747855 () Bool)

(assert (=> b!1310975 (=> (not res!870325) (not e!747855))))

(declare-datatypes ((array!87646 0))(
  ( (array!87647 (arr!42303 (Array (_ BitVec 32) (_ BitVec 64))) (size!42853 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87646)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310975 (= res!870325 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42853 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!870324 () Bool)

(assert (=> start!110764 (=> (not res!870324) (not e!747855))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110764 (= res!870324 (validMask!0 mask!2040))))

(assert (=> start!110764 e!747855))

(assert (=> start!110764 tp!104119))

(declare-fun array_inv!31967 (array!87646) Bool)

(assert (=> start!110764 (array_inv!31967 _keys!1628)))

(assert (=> start!110764 true))

(declare-fun tp_is_empty!35329 () Bool)

(assert (=> start!110764 tp_is_empty!35329))

(declare-datatypes ((V!52209 0))(
  ( (V!52210 (val!17739 Int)) )
))
(declare-datatypes ((ValueCell!16766 0))(
  ( (ValueCellFull!16766 (v!20366 V!52209)) (EmptyCell!16766) )
))
(declare-datatypes ((array!87648 0))(
  ( (array!87649 (arr!42304 (Array (_ BitVec 32) ValueCell!16766)) (size!42854 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87648)

(declare-fun e!747856 () Bool)

(declare-fun array_inv!31968 (array!87648) Bool)

(assert (=> start!110764 (and (array_inv!31968 _values!1354) e!747856)))

(declare-fun mapIsEmpty!54622 () Bool)

(declare-fun mapRes!54622 () Bool)

(assert (=> mapIsEmpty!54622 mapRes!54622))

(declare-fun b!1310976 () Bool)

(declare-fun res!870327 () Bool)

(assert (=> b!1310976 (=> (not res!870327) (not e!747855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87646 (_ BitVec 32)) Bool)

(assert (=> b!1310976 (= res!870327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310977 () Bool)

(declare-fun e!747853 () Bool)

(assert (=> b!1310977 (= e!747853 tp_is_empty!35329)))

(declare-fun b!1310978 () Bool)

(declare-fun e!747857 () Bool)

(assert (=> b!1310978 (= e!747857 tp_is_empty!35329)))

(declare-fun b!1310979 () Bool)

(assert (=> b!1310979 (= e!747856 (and e!747853 mapRes!54622))))

(declare-fun condMapEmpty!54622 () Bool)

(declare-fun mapDefault!54622 () ValueCell!16766)

