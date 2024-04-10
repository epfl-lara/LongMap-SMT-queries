; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110540 () Bool)

(assert start!110540)

(declare-fun b_free!29375 () Bool)

(declare-fun b_next!29375 () Bool)

(assert (=> start!110540 (= b_free!29375 (not b_next!29375))))

(declare-fun tp!103446 () Bool)

(declare-fun b_and!47583 () Bool)

(assert (=> start!110540 (= tp!103446 b_and!47583)))

(declare-fun b!1307639 () Bool)

(declare-fun res!867996 () Bool)

(declare-fun e!746174 () Bool)

(assert (=> b!1307639 (=> (not res!867996) (not e!746174))))

(declare-datatypes ((array!87210 0))(
  ( (array!87211 (arr!42085 (Array (_ BitVec 32) (_ BitVec 64))) (size!42635 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87210)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87210 (_ BitVec 32)) Bool)

(assert (=> b!1307639 (= res!867996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307640 () Bool)

(declare-fun res!867999 () Bool)

(assert (=> b!1307640 (=> (not res!867999) (not e!746174))))

(declare-datatypes ((List!29833 0))(
  ( (Nil!29830) (Cons!29829 (h!31038 (_ BitVec 64)) (t!43439 List!29833)) )
))
(declare-fun arrayNoDuplicates!0 (array!87210 (_ BitVec 32) List!29833) Bool)

(assert (=> b!1307640 (= res!867999 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29830))))

(declare-fun res!867995 () Bool)

(assert (=> start!110540 (=> (not res!867995) (not e!746174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110540 (= res!867995 (validMask!0 mask!2040))))

(assert (=> start!110540 e!746174))

(assert (=> start!110540 tp!103446))

(declare-fun array_inv!31809 (array!87210) Bool)

(assert (=> start!110540 (array_inv!31809 _keys!1628)))

(assert (=> start!110540 true))

(declare-fun tp_is_empty!35105 () Bool)

(assert (=> start!110540 tp_is_empty!35105))

(declare-datatypes ((V!51909 0))(
  ( (V!51910 (val!17627 Int)) )
))
(declare-datatypes ((ValueCell!16654 0))(
  ( (ValueCellFull!16654 (v!20254 V!51909)) (EmptyCell!16654) )
))
(declare-datatypes ((array!87212 0))(
  ( (array!87213 (arr!42086 (Array (_ BitVec 32) ValueCell!16654)) (size!42636 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87212)

(declare-fun e!746176 () Bool)

(declare-fun array_inv!31810 (array!87212) Bool)

(assert (=> start!110540 (and (array_inv!31810 _values!1354) e!746176)))

(declare-fun mapIsEmpty!54286 () Bool)

(declare-fun mapRes!54286 () Bool)

(assert (=> mapIsEmpty!54286 mapRes!54286))

(declare-fun b!1307641 () Bool)

(declare-fun e!746173 () Bool)

(assert (=> b!1307641 (= e!746173 tp_is_empty!35105)))

(declare-fun b!1307642 () Bool)

(declare-fun res!867998 () Bool)

(assert (=> b!1307642 (=> (not res!867998) (not e!746174))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307642 (= res!867998 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42635 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54286 () Bool)

(declare-fun tp!103447 () Bool)

(assert (=> mapNonEmpty!54286 (= mapRes!54286 (and tp!103447 e!746173))))

(declare-fun mapKey!54286 () (_ BitVec 32))

(declare-fun mapRest!54286 () (Array (_ BitVec 32) ValueCell!16654))

(declare-fun mapValue!54286 () ValueCell!16654)

(assert (=> mapNonEmpty!54286 (= (arr!42086 _values!1354) (store mapRest!54286 mapKey!54286 mapValue!54286))))

(declare-fun b!1307643 () Bool)

(declare-fun e!746175 () Bool)

(assert (=> b!1307643 (= e!746176 (and e!746175 mapRes!54286))))

(declare-fun condMapEmpty!54286 () Bool)

(declare-fun mapDefault!54286 () ValueCell!16654)

