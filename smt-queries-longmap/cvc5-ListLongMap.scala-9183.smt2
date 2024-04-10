; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110446 () Bool)

(assert start!110446)

(declare-fun res!867403 () Bool)

(declare-fun e!745469 () Bool)

(assert (=> start!110446 (=> (not res!867403) (not e!745469))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110446 (= res!867403 (validMask!0 mask!2040))))

(assert (=> start!110446 e!745469))

(assert (=> start!110446 true))

(declare-datatypes ((V!51785 0))(
  ( (V!51786 (val!17580 Int)) )
))
(declare-datatypes ((ValueCell!16607 0))(
  ( (ValueCellFull!16607 (v!20207 V!51785)) (EmptyCell!16607) )
))
(declare-datatypes ((array!87036 0))(
  ( (array!87037 (arr!41998 (Array (_ BitVec 32) ValueCell!16607)) (size!42548 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87036)

(declare-fun e!745468 () Bool)

(declare-fun array_inv!31751 (array!87036) Bool)

(assert (=> start!110446 (and (array_inv!31751 _values!1354) e!745468)))

(declare-datatypes ((array!87038 0))(
  ( (array!87039 (arr!41999 (Array (_ BitVec 32) (_ BitVec 64))) (size!42549 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87038)

(declare-fun array_inv!31752 (array!87038) Bool)

(assert (=> start!110446 (array_inv!31752 _keys!1628)))

(declare-fun b!1306624 () Bool)

(declare-fun e!745470 () Bool)

(declare-fun tp_is_empty!35011 () Bool)

(assert (=> b!1306624 (= e!745470 tp_is_empty!35011)))

(declare-fun b!1306625 () Bool)

(declare-fun mapRes!54145 () Bool)

(assert (=> b!1306625 (= e!745468 (and e!745470 mapRes!54145))))

(declare-fun condMapEmpty!54145 () Bool)

(declare-fun mapDefault!54145 () ValueCell!16607)

