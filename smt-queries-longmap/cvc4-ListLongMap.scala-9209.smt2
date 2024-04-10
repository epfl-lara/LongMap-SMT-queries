; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110606 () Bool)

(assert start!110606)

(declare-fun b_free!29441 () Bool)

(declare-fun b_next!29441 () Bool)

(assert (=> start!110606 (= b_free!29441 (not b_next!29441))))

(declare-fun tp!103645 () Bool)

(declare-fun b_and!47649 () Bool)

(assert (=> start!110606 (= tp!103645 b_and!47649)))

(declare-fun b!1308715 () Bool)

(declare-fun res!868777 () Bool)

(declare-fun e!746670 () Bool)

(assert (=> b!1308715 (=> (not res!868777) (not e!746670))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308715 (= res!868777 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308716 () Bool)

(declare-fun res!868775 () Bool)

(assert (=> b!1308716 (=> (not res!868775) (not e!746670))))

(declare-datatypes ((array!87340 0))(
  ( (array!87341 (arr!42150 (Array (_ BitVec 32) (_ BitVec 64))) (size!42700 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87340)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308716 (= res!868775 (not (= (select (arr!42150 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1308717 () Bool)

(declare-fun res!868774 () Bool)

(assert (=> b!1308717 (=> (not res!868774) (not e!746670))))

(declare-datatypes ((List!29881 0))(
  ( (Nil!29878) (Cons!29877 (h!31086 (_ BitVec 64)) (t!43487 List!29881)) )
))
(declare-fun arrayNoDuplicates!0 (array!87340 (_ BitVec 32) List!29881) Bool)

(assert (=> b!1308717 (= res!868774 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29878))))

(declare-fun b!1308718 () Bool)

(declare-fun res!868776 () Bool)

(assert (=> b!1308718 (=> (not res!868776) (not e!746670))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51997 0))(
  ( (V!51998 (val!17660 Int)) )
))
(declare-fun minValue!1296 () V!51997)

(declare-datatypes ((ValueCell!16687 0))(
  ( (ValueCellFull!16687 (v!20287 V!51997)) (EmptyCell!16687) )
))
(declare-datatypes ((array!87342 0))(
  ( (array!87343 (arr!42151 (Array (_ BitVec 32) ValueCell!16687)) (size!42701 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87342)

(declare-fun zeroValue!1296 () V!51997)

(declare-datatypes ((tuple2!22740 0))(
  ( (tuple2!22741 (_1!11381 (_ BitVec 64)) (_2!11381 V!51997)) )
))
(declare-datatypes ((List!29882 0))(
  ( (Nil!29879) (Cons!29878 (h!31087 tuple2!22740) (t!43488 List!29882)) )
))
(declare-datatypes ((ListLongMap!20397 0))(
  ( (ListLongMap!20398 (toList!10214 List!29882)) )
))
(declare-fun contains!8364 (ListLongMap!20397 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5227 (array!87340 array!87342 (_ BitVec 32) (_ BitVec 32) V!51997 V!51997 (_ BitVec 32) Int) ListLongMap!20397)

(assert (=> b!1308718 (= res!868776 (contains!8364 (getCurrentListMap!5227 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun res!868778 () Bool)

(assert (=> start!110606 (=> (not res!868778) (not e!746670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110606 (= res!868778 (validMask!0 mask!2040))))

(assert (=> start!110606 e!746670))

(assert (=> start!110606 tp!103645))

(declare-fun array_inv!31859 (array!87340) Bool)

(assert (=> start!110606 (array_inv!31859 _keys!1628)))

(assert (=> start!110606 true))

(declare-fun tp_is_empty!35171 () Bool)

(assert (=> start!110606 tp_is_empty!35171))

(declare-fun e!746668 () Bool)

(declare-fun array_inv!31860 (array!87342) Bool)

(assert (=> start!110606 (and (array_inv!31860 _values!1354) e!746668)))

(declare-fun mapNonEmpty!54385 () Bool)

(declare-fun mapRes!54385 () Bool)

(declare-fun tp!103644 () Bool)

(declare-fun e!746669 () Bool)

(assert (=> mapNonEmpty!54385 (= mapRes!54385 (and tp!103644 e!746669))))

(declare-fun mapKey!54385 () (_ BitVec 32))

(declare-fun mapValue!54385 () ValueCell!16687)

(declare-fun mapRest!54385 () (Array (_ BitVec 32) ValueCell!16687))

(assert (=> mapNonEmpty!54385 (= (arr!42151 _values!1354) (store mapRest!54385 mapKey!54385 mapValue!54385))))

(declare-fun b!1308719 () Bool)

(declare-fun e!746671 () Bool)

(assert (=> b!1308719 (= e!746671 tp_is_empty!35171)))

(declare-fun b!1308720 () Bool)

(assert (=> b!1308720 (= e!746669 tp_is_empty!35171)))

(declare-fun b!1308721 () Bool)

(declare-fun res!868781 () Bool)

(assert (=> b!1308721 (=> (not res!868781) (not e!746670))))

(assert (=> b!1308721 (= res!868781 (and (= (size!42701 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42700 _keys!1628) (size!42701 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308722 () Bool)

(declare-fun res!868779 () Bool)

(assert (=> b!1308722 (=> (not res!868779) (not e!746670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308722 (= res!868779 (validKeyInArray!0 (select (arr!42150 _keys!1628) from!2020)))))

(declare-fun b!1308723 () Bool)

(assert (=> b!1308723 (= e!746670 (not true))))

(assert (=> b!1308723 (contains!8364 (getCurrentListMap!5227 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43306 0))(
  ( (Unit!43307) )
))
(declare-fun lt!585180 () Unit!43306)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!17 (array!87340 array!87342 (_ BitVec 32) (_ BitVec 32) V!51997 V!51997 (_ BitVec 64) (_ BitVec 32) Int) Unit!43306)

(assert (=> b!1308723 (= lt!585180 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!17 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308724 () Bool)

(declare-fun res!868780 () Bool)

(assert (=> b!1308724 (=> (not res!868780) (not e!746670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87340 (_ BitVec 32)) Bool)

(assert (=> b!1308724 (= res!868780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54385 () Bool)

(assert (=> mapIsEmpty!54385 mapRes!54385))

(declare-fun b!1308725 () Bool)

(declare-fun res!868782 () Bool)

(assert (=> b!1308725 (=> (not res!868782) (not e!746670))))

(assert (=> b!1308725 (= res!868782 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42700 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308726 () Bool)

(assert (=> b!1308726 (= e!746668 (and e!746671 mapRes!54385))))

(declare-fun condMapEmpty!54385 () Bool)

(declare-fun mapDefault!54385 () ValueCell!16687)

