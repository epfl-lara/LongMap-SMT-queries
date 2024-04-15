; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110890 () Bool)

(assert start!110890)

(declare-fun b_free!29725 () Bool)

(declare-fun b_next!29725 () Bool)

(assert (=> start!110890 (= b_free!29725 (not b_next!29725))))

(declare-fun tp!104497 () Bool)

(declare-fun b_and!47915 () Bool)

(assert (=> start!110890 (= tp!104497 b_and!47915)))

(declare-fun b!1312741 () Bool)

(declare-fun e!748767 () Bool)

(declare-fun tp_is_empty!35455 () Bool)

(assert (=> b!1312741 (= e!748767 tp_is_empty!35455)))

(declare-fun res!871564 () Bool)

(declare-fun e!748766 () Bool)

(assert (=> start!110890 (=> (not res!871564) (not e!748766))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110890 (= res!871564 (validMask!0 mask!2040))))

(assert (=> start!110890 e!748766))

(assert (=> start!110890 tp!104497))

(declare-datatypes ((array!87795 0))(
  ( (array!87796 (arr!42378 (Array (_ BitVec 32) (_ BitVec 64))) (size!42930 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87795)

(declare-fun array_inv!32205 (array!87795) Bool)

(assert (=> start!110890 (array_inv!32205 _keys!1628)))

(assert (=> start!110890 true))

(assert (=> start!110890 tp_is_empty!35455))

(declare-datatypes ((V!52377 0))(
  ( (V!52378 (val!17802 Int)) )
))
(declare-datatypes ((ValueCell!16829 0))(
  ( (ValueCellFull!16829 (v!20428 V!52377)) (EmptyCell!16829) )
))
(declare-datatypes ((array!87797 0))(
  ( (array!87798 (arr!42379 (Array (_ BitVec 32) ValueCell!16829)) (size!42931 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87797)

(declare-fun e!748769 () Bool)

(declare-fun array_inv!32206 (array!87797) Bool)

(assert (=> start!110890 (and (array_inv!32206 _values!1354) e!748769)))

(declare-fun b!1312742 () Bool)

(assert (=> b!1312742 (= e!748766 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52377)

(declare-fun zeroValue!1296 () V!52377)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585420 () Bool)

(declare-datatypes ((tuple2!23038 0))(
  ( (tuple2!23039 (_1!11530 (_ BitVec 64)) (_2!11530 V!52377)) )
))
(declare-datatypes ((List!30155 0))(
  ( (Nil!30152) (Cons!30151 (h!31360 tuple2!23038) (t!43753 List!30155)) )
))
(declare-datatypes ((ListLongMap!20695 0))(
  ( (ListLongMap!20696 (toList!10363 List!30155)) )
))
(declare-fun contains!8440 (ListLongMap!20695 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5258 (array!87795 array!87797 (_ BitVec 32) (_ BitVec 32) V!52377 V!52377 (_ BitVec 32) Int) ListLongMap!20695)

(assert (=> b!1312742 (= lt!585420 (contains!8440 (getCurrentListMap!5258 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312743 () Bool)

(declare-fun res!871566 () Bool)

(assert (=> b!1312743 (=> (not res!871566) (not e!748766))))

(declare-datatypes ((List!30156 0))(
  ( (Nil!30153) (Cons!30152 (h!31361 (_ BitVec 64)) (t!43754 List!30156)) )
))
(declare-fun arrayNoDuplicates!0 (array!87795 (_ BitVec 32) List!30156) Bool)

(assert (=> b!1312743 (= res!871566 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30153))))

(declare-fun b!1312744 () Bool)

(declare-fun res!871567 () Bool)

(assert (=> b!1312744 (=> (not res!871567) (not e!748766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87795 (_ BitVec 32)) Bool)

(assert (=> b!1312744 (= res!871567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312745 () Bool)

(declare-fun res!871565 () Bool)

(assert (=> b!1312745 (=> (not res!871565) (not e!748766))))

(assert (=> b!1312745 (= res!871565 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42930 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54811 () Bool)

(declare-fun mapRes!54811 () Bool)

(assert (=> mapIsEmpty!54811 mapRes!54811))

(declare-fun mapNonEmpty!54811 () Bool)

(declare-fun tp!104498 () Bool)

(assert (=> mapNonEmpty!54811 (= mapRes!54811 (and tp!104498 e!748767))))

(declare-fun mapRest!54811 () (Array (_ BitVec 32) ValueCell!16829))

(declare-fun mapValue!54811 () ValueCell!16829)

(declare-fun mapKey!54811 () (_ BitVec 32))

(assert (=> mapNonEmpty!54811 (= (arr!42379 _values!1354) (store mapRest!54811 mapKey!54811 mapValue!54811))))

(declare-fun b!1312746 () Bool)

(declare-fun e!748768 () Bool)

(assert (=> b!1312746 (= e!748769 (and e!748768 mapRes!54811))))

(declare-fun condMapEmpty!54811 () Bool)

(declare-fun mapDefault!54811 () ValueCell!16829)

(assert (=> b!1312746 (= condMapEmpty!54811 (= (arr!42379 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16829)) mapDefault!54811)))))

(declare-fun b!1312747 () Bool)

(assert (=> b!1312747 (= e!748768 tp_is_empty!35455)))

(declare-fun b!1312748 () Bool)

(declare-fun res!871563 () Bool)

(assert (=> b!1312748 (=> (not res!871563) (not e!748766))))

(assert (=> b!1312748 (= res!871563 (and (= (size!42931 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42930 _keys!1628) (size!42931 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110890 res!871564) b!1312748))

(assert (= (and b!1312748 res!871563) b!1312744))

(assert (= (and b!1312744 res!871567) b!1312743))

(assert (= (and b!1312743 res!871566) b!1312745))

(assert (= (and b!1312745 res!871565) b!1312742))

(assert (= (and b!1312746 condMapEmpty!54811) mapIsEmpty!54811))

(assert (= (and b!1312746 (not condMapEmpty!54811)) mapNonEmpty!54811))

(get-info :version)

(assert (= (and mapNonEmpty!54811 ((_ is ValueCellFull!16829) mapValue!54811)) b!1312741))

(assert (= (and b!1312746 ((_ is ValueCellFull!16829) mapDefault!54811)) b!1312747))

(assert (= start!110890 b!1312746))

(declare-fun m!1201359 () Bool)

(assert (=> b!1312742 m!1201359))

(assert (=> b!1312742 m!1201359))

(declare-fun m!1201361 () Bool)

(assert (=> b!1312742 m!1201361))

(declare-fun m!1201363 () Bool)

(assert (=> b!1312743 m!1201363))

(declare-fun m!1201365 () Bool)

(assert (=> b!1312744 m!1201365))

(declare-fun m!1201367 () Bool)

(assert (=> start!110890 m!1201367))

(declare-fun m!1201369 () Bool)

(assert (=> start!110890 m!1201369))

(declare-fun m!1201371 () Bool)

(assert (=> start!110890 m!1201371))

(declare-fun m!1201373 () Bool)

(assert (=> mapNonEmpty!54811 m!1201373))

(check-sat (not b!1312744) (not mapNonEmpty!54811) (not b!1312743) (not b_next!29725) tp_is_empty!35455 (not b!1312742) (not start!110890) b_and!47915)
(check-sat b_and!47915 (not b_next!29725))
