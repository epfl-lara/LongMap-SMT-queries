; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110450 () Bool)

(assert start!110450)

(declare-fun res!867422 () Bool)

(declare-fun e!745500 () Bool)

(assert (=> start!110450 (=> (not res!867422) (not e!745500))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110450 (= res!867422 (validMask!0 mask!2040))))

(assert (=> start!110450 e!745500))

(assert (=> start!110450 true))

(declare-datatypes ((V!51789 0))(
  ( (V!51790 (val!17582 Int)) )
))
(declare-datatypes ((ValueCell!16609 0))(
  ( (ValueCellFull!16609 (v!20209 V!51789)) (EmptyCell!16609) )
))
(declare-datatypes ((array!87044 0))(
  ( (array!87045 (arr!42002 (Array (_ BitVec 32) ValueCell!16609)) (size!42552 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87044)

(declare-fun e!745501 () Bool)

(declare-fun array_inv!31755 (array!87044) Bool)

(assert (=> start!110450 (and (array_inv!31755 _values!1354) e!745501)))

(declare-datatypes ((array!87046 0))(
  ( (array!87047 (arr!42003 (Array (_ BitVec 32) (_ BitVec 64))) (size!42553 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87046)

(declare-fun array_inv!31756 (array!87046) Bool)

(assert (=> start!110450 (array_inv!31756 _keys!1628)))

(declare-fun b!1306660 () Bool)

(declare-fun res!867423 () Bool)

(assert (=> b!1306660 (=> (not res!867423) (not e!745500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87046 (_ BitVec 32)) Bool)

(assert (=> b!1306660 (= res!867423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306661 () Bool)

(assert (=> b!1306661 (= e!745500 false)))

(declare-fun lt!584955 () Bool)

(declare-datatypes ((List!29795 0))(
  ( (Nil!29792) (Cons!29791 (h!31000 (_ BitVec 64)) (t!43401 List!29795)) )
))
(declare-fun arrayNoDuplicates!0 (array!87046 (_ BitVec 32) List!29795) Bool)

(assert (=> b!1306661 (= lt!584955 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29792))))

(declare-fun mapIsEmpty!54151 () Bool)

(declare-fun mapRes!54151 () Bool)

(assert (=> mapIsEmpty!54151 mapRes!54151))

(declare-fun b!1306662 () Bool)

(declare-fun e!745498 () Bool)

(declare-fun tp_is_empty!35015 () Bool)

(assert (=> b!1306662 (= e!745498 tp_is_empty!35015)))

(declare-fun b!1306663 () Bool)

(declare-fun e!745502 () Bool)

(assert (=> b!1306663 (= e!745501 (and e!745502 mapRes!54151))))

(declare-fun condMapEmpty!54151 () Bool)

(declare-fun mapDefault!54151 () ValueCell!16609)

