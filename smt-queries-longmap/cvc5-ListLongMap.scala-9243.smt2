; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110806 () Bool)

(assert start!110806)

(declare-fun b_free!29641 () Bool)

(declare-fun b_next!29641 () Bool)

(assert (=> start!110806 (= b_free!29641 (not b_next!29641))))

(declare-fun tp!104244 () Bool)

(declare-fun b_and!47849 () Bool)

(assert (=> start!110806 (= tp!104244 b_and!47849)))

(declare-fun res!870641 () Bool)

(declare-fun e!748171 () Bool)

(assert (=> start!110806 (=> (not res!870641) (not e!748171))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110806 (= res!870641 (validMask!0 mask!2040))))

(assert (=> start!110806 e!748171))

(assert (=> start!110806 tp!104244))

(declare-datatypes ((array!87730 0))(
  ( (array!87731 (arr!42345 (Array (_ BitVec 32) (_ BitVec 64))) (size!42895 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87730)

(declare-fun array_inv!31999 (array!87730) Bool)

(assert (=> start!110806 (array_inv!31999 _keys!1628)))

(assert (=> start!110806 true))

(declare-fun tp_is_empty!35371 () Bool)

(assert (=> start!110806 tp_is_empty!35371))

(declare-datatypes ((V!52265 0))(
  ( (V!52266 (val!17760 Int)) )
))
(declare-datatypes ((ValueCell!16787 0))(
  ( (ValueCellFull!16787 (v!20387 V!52265)) (EmptyCell!16787) )
))
(declare-datatypes ((array!87732 0))(
  ( (array!87733 (arr!42346 (Array (_ BitVec 32) ValueCell!16787)) (size!42896 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87732)

(declare-fun e!748168 () Bool)

(declare-fun array_inv!32000 (array!87732) Bool)

(assert (=> start!110806 (and (array_inv!32000 _values!1354) e!748168)))

(declare-fun mapNonEmpty!54685 () Bool)

(declare-fun mapRes!54685 () Bool)

(declare-fun tp!104245 () Bool)

(declare-fun e!748170 () Bool)

(assert (=> mapNonEmpty!54685 (= mapRes!54685 (and tp!104245 e!748170))))

(declare-fun mapValue!54685 () ValueCell!16787)

(declare-fun mapRest!54685 () (Array (_ BitVec 32) ValueCell!16787))

(declare-fun mapKey!54685 () (_ BitVec 32))

(assert (=> mapNonEmpty!54685 (= (arr!42346 _values!1354) (store mapRest!54685 mapKey!54685 mapValue!54685))))

(declare-fun b!1311479 () Bool)

(declare-fun res!870638 () Bool)

(assert (=> b!1311479 (=> (not res!870638) (not e!748171))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311479 (= res!870638 (and (= (size!42896 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42895 _keys!1628) (size!42896 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54685 () Bool)

(assert (=> mapIsEmpty!54685 mapRes!54685))

(declare-fun b!1311480 () Bool)

(declare-fun e!748169 () Bool)

(assert (=> b!1311480 (= e!748168 (and e!748169 mapRes!54685))))

(declare-fun condMapEmpty!54685 () Bool)

(declare-fun mapDefault!54685 () ValueCell!16787)

