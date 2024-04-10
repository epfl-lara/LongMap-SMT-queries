; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111148 () Bool)

(assert start!111148)

(declare-fun b_free!29983 () Bool)

(declare-fun b_next!29983 () Bool)

(assert (=> start!111148 (= b_free!29983 (not b_next!29983))))

(declare-fun tp!105271 () Bool)

(declare-fun b_and!48191 () Bool)

(assert (=> start!111148 (= tp!105271 b_and!48191)))

(declare-fun b!1316006 () Bool)

(declare-fun e!750735 () Bool)

(declare-fun tp_is_empty!35713 () Bool)

(assert (=> b!1316006 (= e!750735 tp_is_empty!35713)))

(declare-fun res!873630 () Bool)

(declare-fun e!750737 () Bool)

(assert (=> start!111148 (=> (not res!873630) (not e!750737))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111148 (= res!873630 (validMask!0 mask!2040))))

(assert (=> start!111148 e!750737))

(assert (=> start!111148 tp!105271))

(declare-datatypes ((array!88384 0))(
  ( (array!88385 (arr!42672 (Array (_ BitVec 32) (_ BitVec 64))) (size!43222 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88384)

(declare-fun array_inv!32227 (array!88384) Bool)

(assert (=> start!111148 (array_inv!32227 _keys!1628)))

(assert (=> start!111148 true))

(assert (=> start!111148 tp_is_empty!35713))

(declare-datatypes ((V!52721 0))(
  ( (V!52722 (val!17931 Int)) )
))
(declare-datatypes ((ValueCell!16958 0))(
  ( (ValueCellFull!16958 (v!20558 V!52721)) (EmptyCell!16958) )
))
(declare-datatypes ((array!88386 0))(
  ( (array!88387 (arr!42673 (Array (_ BitVec 32) ValueCell!16958)) (size!43223 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88386)

(declare-fun e!750736 () Bool)

(declare-fun array_inv!32228 (array!88386) Bool)

(assert (=> start!111148 (and (array_inv!32228 _values!1354) e!750736)))

(declare-fun mapNonEmpty!55198 () Bool)

(declare-fun mapRes!55198 () Bool)

(declare-fun tp!105270 () Bool)

(assert (=> mapNonEmpty!55198 (= mapRes!55198 (and tp!105270 e!750735))))

(declare-fun mapValue!55198 () ValueCell!16958)

(declare-fun mapKey!55198 () (_ BitVec 32))

(declare-fun mapRest!55198 () (Array (_ BitVec 32) ValueCell!16958))

(assert (=> mapNonEmpty!55198 (= (arr!42673 _values!1354) (store mapRest!55198 mapKey!55198 mapValue!55198))))

(declare-fun b!1316007 () Bool)

(declare-fun e!750733 () Bool)

(assert (=> b!1316007 (= e!750736 (and e!750733 mapRes!55198))))

(declare-fun condMapEmpty!55198 () Bool)

(declare-fun mapDefault!55198 () ValueCell!16958)

