; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110738 () Bool)

(assert start!110738)

(declare-fun b_free!29573 () Bool)

(declare-fun b_next!29573 () Bool)

(assert (=> start!110738 (= b_free!29573 (not b_next!29573))))

(declare-fun tp!104040 () Bool)

(declare-fun b_and!47781 () Bool)

(assert (=> start!110738 (= tp!104040 b_and!47781)))

(declare-fun b!1310659 () Bool)

(declare-fun res!870125 () Bool)

(declare-fun e!747658 () Bool)

(assert (=> b!1310659 (=> (not res!870125) (not e!747658))))

(declare-datatypes ((array!87594 0))(
  ( (array!87595 (arr!42277 (Array (_ BitVec 32) (_ BitVec 64))) (size!42827 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87594)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87594 (_ BitVec 32)) Bool)

(assert (=> b!1310659 (= res!870125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310660 () Bool)

(declare-fun res!870126 () Bool)

(assert (=> b!1310660 (=> (not res!870126) (not e!747658))))

(declare-datatypes ((List!29979 0))(
  ( (Nil!29976) (Cons!29975 (h!31184 (_ BitVec 64)) (t!43585 List!29979)) )
))
(declare-fun arrayNoDuplicates!0 (array!87594 (_ BitVec 32) List!29979) Bool)

(assert (=> b!1310660 (= res!870126 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29976))))

(declare-fun b!1310661 () Bool)

(declare-fun res!870129 () Bool)

(assert (=> b!1310661 (=> (not res!870129) (not e!747658))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310661 (= res!870129 (not (= (select (arr!42277 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1310662 () Bool)

(assert (=> b!1310662 (= e!747658 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((V!52173 0))(
  ( (V!52174 (val!17726 Int)) )
))
(declare-fun minValue!1296 () V!52173)

(declare-datatypes ((ValueCell!16753 0))(
  ( (ValueCellFull!16753 (v!20353 V!52173)) (EmptyCell!16753) )
))
(declare-datatypes ((array!87596 0))(
  ( (array!87597 (arr!42278 (Array (_ BitVec 32) ValueCell!16753)) (size!42828 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87596)

(declare-fun zeroValue!1296 () V!52173)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22840 0))(
  ( (tuple2!22841 (_1!11431 (_ BitVec 64)) (_2!11431 V!52173)) )
))
(declare-datatypes ((List!29980 0))(
  ( (Nil!29977) (Cons!29976 (h!31185 tuple2!22840) (t!43586 List!29980)) )
))
(declare-datatypes ((ListLongMap!20497 0))(
  ( (ListLongMap!20498 (toList!10264 List!29980)) )
))
(declare-fun contains!8414 (ListLongMap!20497 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5277 (array!87594 array!87596 (_ BitVec 32) (_ BitVec 32) V!52173 V!52173 (_ BitVec 32) Int) ListLongMap!20497)

(assert (=> b!1310662 (contains!8414 (getCurrentListMap!5277 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43346 0))(
  ( (Unit!43347) )
))
(declare-fun lt!585378 () Unit!43346)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!19 (array!87594 array!87596 (_ BitVec 32) (_ BitVec 32) V!52173 V!52173 (_ BitVec 64) (_ BitVec 32) Int) Unit!43346)

(assert (=> b!1310662 (= lt!585378 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!19 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310663 () Bool)

(declare-fun res!870127 () Bool)

(assert (=> b!1310663 (=> (not res!870127) (not e!747658))))

(assert (=> b!1310663 (= res!870127 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310664 () Bool)

(declare-fun e!747661 () Bool)

(declare-fun tp_is_empty!35303 () Bool)

(assert (=> b!1310664 (= e!747661 tp_is_empty!35303)))

(declare-fun mapIsEmpty!54583 () Bool)

(declare-fun mapRes!54583 () Bool)

(assert (=> mapIsEmpty!54583 mapRes!54583))

(declare-fun b!1310665 () Bool)

(declare-fun res!870128 () Bool)

(assert (=> b!1310665 (=> (not res!870128) (not e!747658))))

(assert (=> b!1310665 (= res!870128 (contains!8414 (getCurrentListMap!5277 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun res!870130 () Bool)

(assert (=> start!110738 (=> (not res!870130) (not e!747658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110738 (= res!870130 (validMask!0 mask!2040))))

(assert (=> start!110738 e!747658))

(assert (=> start!110738 tp!104040))

(declare-fun array_inv!31947 (array!87594) Bool)

(assert (=> start!110738 (array_inv!31947 _keys!1628)))

(assert (=> start!110738 true))

(assert (=> start!110738 tp_is_empty!35303))

(declare-fun e!747660 () Bool)

(declare-fun array_inv!31948 (array!87596) Bool)

(assert (=> start!110738 (and (array_inv!31948 _values!1354) e!747660)))

(declare-fun mapNonEmpty!54583 () Bool)

(declare-fun tp!104041 () Bool)

(declare-fun e!747662 () Bool)

(assert (=> mapNonEmpty!54583 (= mapRes!54583 (and tp!104041 e!747662))))

(declare-fun mapKey!54583 () (_ BitVec 32))

(declare-fun mapValue!54583 () ValueCell!16753)

(declare-fun mapRest!54583 () (Array (_ BitVec 32) ValueCell!16753))

(assert (=> mapNonEmpty!54583 (= (arr!42278 _values!1354) (store mapRest!54583 mapKey!54583 mapValue!54583))))

(declare-fun b!1310666 () Bool)

(declare-fun res!870132 () Bool)

(assert (=> b!1310666 (=> (not res!870132) (not e!747658))))

(assert (=> b!1310666 (= res!870132 (and (= (size!42828 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42827 _keys!1628) (size!42828 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310667 () Bool)

(declare-fun res!870124 () Bool)

(assert (=> b!1310667 (=> (not res!870124) (not e!747658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310667 (= res!870124 (validKeyInArray!0 (select (arr!42277 _keys!1628) from!2020)))))

(declare-fun b!1310668 () Bool)

(assert (=> b!1310668 (= e!747662 tp_is_empty!35303)))

(declare-fun b!1310669 () Bool)

(assert (=> b!1310669 (= e!747660 (and e!747661 mapRes!54583))))

(declare-fun condMapEmpty!54583 () Bool)

(declare-fun mapDefault!54583 () ValueCell!16753)

