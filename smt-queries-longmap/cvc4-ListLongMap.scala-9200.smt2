; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110552 () Bool)

(assert start!110552)

(declare-fun b_free!29387 () Bool)

(declare-fun b_next!29387 () Bool)

(assert (=> start!110552 (= b_free!29387 (not b_next!29387))))

(declare-fun tp!103483 () Bool)

(declare-fun b_and!47595 () Bool)

(assert (=> start!110552 (= tp!103483 b_and!47595)))

(declare-fun b!1307783 () Bool)

(declare-fun res!868088 () Bool)

(declare-fun e!746267 () Bool)

(assert (=> b!1307783 (=> (not res!868088) (not e!746267))))

(declare-datatypes ((array!87234 0))(
  ( (array!87235 (arr!42097 (Array (_ BitVec 32) (_ BitVec 64))) (size!42647 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87234)

(declare-datatypes ((List!29842 0))(
  ( (Nil!29839) (Cons!29838 (h!31047 (_ BitVec 64)) (t!43448 List!29842)) )
))
(declare-fun arrayNoDuplicates!0 (array!87234 (_ BitVec 32) List!29842) Bool)

(assert (=> b!1307783 (= res!868088 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29839))))

(declare-fun b!1307784 () Bool)

(declare-fun res!868089 () Bool)

(assert (=> b!1307784 (=> (not res!868089) (not e!746267))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87234 (_ BitVec 32)) Bool)

(assert (=> b!1307784 (= res!868089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!868086 () Bool)

(assert (=> start!110552 (=> (not res!868086) (not e!746267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110552 (= res!868086 (validMask!0 mask!2040))))

(assert (=> start!110552 e!746267))

(assert (=> start!110552 tp!103483))

(declare-fun array_inv!31817 (array!87234) Bool)

(assert (=> start!110552 (array_inv!31817 _keys!1628)))

(assert (=> start!110552 true))

(declare-fun tp_is_empty!35117 () Bool)

(assert (=> start!110552 tp_is_empty!35117))

(declare-datatypes ((V!51925 0))(
  ( (V!51926 (val!17633 Int)) )
))
(declare-datatypes ((ValueCell!16660 0))(
  ( (ValueCellFull!16660 (v!20260 V!51925)) (EmptyCell!16660) )
))
(declare-datatypes ((array!87236 0))(
  ( (array!87237 (arr!42098 (Array (_ BitVec 32) ValueCell!16660)) (size!42648 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87236)

(declare-fun e!746264 () Bool)

(declare-fun array_inv!31818 (array!87236) Bool)

(assert (=> start!110552 (and (array_inv!31818 _values!1354) e!746264)))

(declare-fun b!1307785 () Bool)

(declare-fun e!746263 () Bool)

(assert (=> b!1307785 (= e!746263 tp_is_empty!35117)))

(declare-fun mapNonEmpty!54304 () Bool)

(declare-fun mapRes!54304 () Bool)

(declare-fun tp!103482 () Bool)

(declare-fun e!746265 () Bool)

(assert (=> mapNonEmpty!54304 (= mapRes!54304 (and tp!103482 e!746265))))

(declare-fun mapValue!54304 () ValueCell!16660)

(declare-fun mapRest!54304 () (Array (_ BitVec 32) ValueCell!16660))

(declare-fun mapKey!54304 () (_ BitVec 32))

(assert (=> mapNonEmpty!54304 (= (arr!42098 _values!1354) (store mapRest!54304 mapKey!54304 mapValue!54304))))

(declare-fun b!1307786 () Bool)

(assert (=> b!1307786 (= e!746264 (and e!746263 mapRes!54304))))

(declare-fun condMapEmpty!54304 () Bool)

(declare-fun mapDefault!54304 () ValueCell!16660)

