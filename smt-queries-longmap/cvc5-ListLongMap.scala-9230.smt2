; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110728 () Bool)

(assert start!110728)

(declare-fun b_free!29563 () Bool)

(declare-fun b_next!29563 () Bool)

(assert (=> start!110728 (= b_free!29563 (not b_next!29563))))

(declare-fun tp!104010 () Bool)

(declare-fun b_and!47771 () Bool)

(assert (=> start!110728 (= tp!104010 b_and!47771)))

(declare-fun b!1310480 () Bool)

(declare-fun res!869992 () Bool)

(declare-fun e!747585 () Bool)

(assert (=> b!1310480 (=> (not res!869992) (not e!747585))))

(declare-datatypes ((array!87574 0))(
  ( (array!87575 (arr!42267 (Array (_ BitVec 32) (_ BitVec 64))) (size!42817 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87574)

(declare-datatypes ((List!29970 0))(
  ( (Nil!29967) (Cons!29966 (h!31175 (_ BitVec 64)) (t!43576 List!29970)) )
))
(declare-fun arrayNoDuplicates!0 (array!87574 (_ BitVec 32) List!29970) Bool)

(assert (=> b!1310480 (= res!869992 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29967))))

(declare-fun mapNonEmpty!54568 () Bool)

(declare-fun mapRes!54568 () Bool)

(declare-fun tp!104011 () Bool)

(declare-fun e!747583 () Bool)

(assert (=> mapNonEmpty!54568 (= mapRes!54568 (and tp!104011 e!747583))))

(declare-fun mapKey!54568 () (_ BitVec 32))

(declare-datatypes ((V!52161 0))(
  ( (V!52162 (val!17721 Int)) )
))
(declare-datatypes ((ValueCell!16748 0))(
  ( (ValueCellFull!16748 (v!20348 V!52161)) (EmptyCell!16748) )
))
(declare-fun mapValue!54568 () ValueCell!16748)

(declare-datatypes ((array!87576 0))(
  ( (array!87577 (arr!42268 (Array (_ BitVec 32) ValueCell!16748)) (size!42818 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87576)

(declare-fun mapRest!54568 () (Array (_ BitVec 32) ValueCell!16748))

(assert (=> mapNonEmpty!54568 (= (arr!42268 _values!1354) (store mapRest!54568 mapKey!54568 mapValue!54568))))

(declare-fun b!1310481 () Bool)

(declare-fun e!747587 () Bool)

(declare-fun e!747584 () Bool)

(assert (=> b!1310481 (= e!747587 (and e!747584 mapRes!54568))))

(declare-fun condMapEmpty!54568 () Bool)

(declare-fun mapDefault!54568 () ValueCell!16748)

