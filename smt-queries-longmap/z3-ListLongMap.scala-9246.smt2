; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110826 () Bool)

(assert start!110826)

(declare-fun b_free!29661 () Bool)

(declare-fun b_next!29661 () Bool)

(assert (=> start!110826 (= b_free!29661 (not b_next!29661))))

(declare-fun tp!104304 () Bool)

(declare-fun b_and!47869 () Bool)

(assert (=> start!110826 (= tp!104304 b_and!47869)))

(declare-fun b!1311811 () Bool)

(declare-fun res!870886 () Bool)

(declare-fun e!748320 () Bool)

(assert (=> b!1311811 (=> (not res!870886) (not e!748320))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87770 0))(
  ( (array!87771 (arr!42365 (Array (_ BitVec 32) (_ BitVec 64))) (size!42915 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87770)

(declare-datatypes ((V!52291 0))(
  ( (V!52292 (val!17770 Int)) )
))
(declare-fun minValue!1296 () V!52291)

(declare-datatypes ((ValueCell!16797 0))(
  ( (ValueCellFull!16797 (v!20397 V!52291)) (EmptyCell!16797) )
))
(declare-datatypes ((array!87772 0))(
  ( (array!87773 (arr!42366 (Array (_ BitVec 32) ValueCell!16797)) (size!42916 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87772)

(declare-fun zeroValue!1296 () V!52291)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((tuple2!22904 0))(
  ( (tuple2!22905 (_1!11463 (_ BitVec 64)) (_2!11463 V!52291)) )
))
(declare-datatypes ((List!30042 0))(
  ( (Nil!30039) (Cons!30038 (h!31247 tuple2!22904) (t!43648 List!30042)) )
))
(declare-datatypes ((ListLongMap!20561 0))(
  ( (ListLongMap!20562 (toList!10296 List!30042)) )
))
(declare-fun contains!8446 (ListLongMap!20561 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5309 (array!87770 array!87772 (_ BitVec 32) (_ BitVec 32) V!52291 V!52291 (_ BitVec 32) Int) ListLongMap!20561)

(assert (=> b!1311811 (= res!870886 (contains!8446 (getCurrentListMap!5309 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311812 () Bool)

(declare-fun res!870884 () Bool)

(assert (=> b!1311812 (=> (not res!870884) (not e!748320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87770 (_ BitVec 32)) Bool)

(assert (=> b!1311812 (= res!870884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311813 () Bool)

(declare-fun e!748321 () Bool)

(declare-fun tp_is_empty!35391 () Bool)

(assert (=> b!1311813 (= e!748321 tp_is_empty!35391)))

(declare-fun b!1311814 () Bool)

(assert (=> b!1311814 (= e!748320 (not true))))

(assert (=> b!1311814 (contains!8446 (getCurrentListMap!5309 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43358 0))(
  ( (Unit!43359) )
))
(declare-fun lt!585510 () Unit!43358)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!6 (array!87770 array!87772 (_ BitVec 32) (_ BitVec 32) V!52291 V!52291 (_ BitVec 64) (_ BitVec 32) Int) Unit!43358)

(assert (=> b!1311814 (= lt!585510 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!6 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311815 () Bool)

(declare-fun res!870883 () Bool)

(assert (=> b!1311815 (=> (not res!870883) (not e!748320))))

(assert (=> b!1311815 (= res!870883 (and (= (size!42916 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42915 _keys!1628) (size!42916 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54715 () Bool)

(declare-fun mapRes!54715 () Bool)

(assert (=> mapIsEmpty!54715 mapRes!54715))

(declare-fun b!1311816 () Bool)

(declare-fun res!870882 () Bool)

(assert (=> b!1311816 (=> (not res!870882) (not e!748320))))

(assert (=> b!1311816 (= res!870882 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1311817 () Bool)

(declare-fun res!870880 () Bool)

(assert (=> b!1311817 (=> (not res!870880) (not e!748320))))

(assert (=> b!1311817 (= res!870880 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42915 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311818 () Bool)

(declare-fun res!870887 () Bool)

(assert (=> b!1311818 (=> (not res!870887) (not e!748320))))

(assert (=> b!1311818 (= res!870887 (not (= (select (arr!42365 _keys!1628) from!2020) k0!1175)))))

(declare-fun res!870888 () Bool)

(assert (=> start!110826 (=> (not res!870888) (not e!748320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110826 (= res!870888 (validMask!0 mask!2040))))

(assert (=> start!110826 e!748320))

(assert (=> start!110826 tp!104304))

(declare-fun array_inv!32017 (array!87770) Bool)

(assert (=> start!110826 (array_inv!32017 _keys!1628)))

(assert (=> start!110826 true))

(assert (=> start!110826 tp_is_empty!35391))

(declare-fun e!748318 () Bool)

(declare-fun array_inv!32018 (array!87772) Bool)

(assert (=> start!110826 (and (array_inv!32018 _values!1354) e!748318)))

(declare-fun b!1311819 () Bool)

(assert (=> b!1311819 (= e!748318 (and e!748321 mapRes!54715))))

(declare-fun condMapEmpty!54715 () Bool)

(declare-fun mapDefault!54715 () ValueCell!16797)

(assert (=> b!1311819 (= condMapEmpty!54715 (= (arr!42366 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16797)) mapDefault!54715)))))

(declare-fun b!1311820 () Bool)

(declare-fun res!870881 () Bool)

(assert (=> b!1311820 (=> (not res!870881) (not e!748320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311820 (= res!870881 (validKeyInArray!0 (select (arr!42365 _keys!1628) from!2020)))))

(declare-fun b!1311821 () Bool)

(declare-fun e!748319 () Bool)

(assert (=> b!1311821 (= e!748319 tp_is_empty!35391)))

(declare-fun mapNonEmpty!54715 () Bool)

(declare-fun tp!104305 () Bool)

(assert (=> mapNonEmpty!54715 (= mapRes!54715 (and tp!104305 e!748319))))

(declare-fun mapRest!54715 () (Array (_ BitVec 32) ValueCell!16797))

(declare-fun mapValue!54715 () ValueCell!16797)

(declare-fun mapKey!54715 () (_ BitVec 32))

(assert (=> mapNonEmpty!54715 (= (arr!42366 _values!1354) (store mapRest!54715 mapKey!54715 mapValue!54715))))

(declare-fun b!1311822 () Bool)

(declare-fun res!870885 () Bool)

(assert (=> b!1311822 (=> (not res!870885) (not e!748320))))

(declare-datatypes ((List!30043 0))(
  ( (Nil!30040) (Cons!30039 (h!31248 (_ BitVec 64)) (t!43649 List!30043)) )
))
(declare-fun arrayNoDuplicates!0 (array!87770 (_ BitVec 32) List!30043) Bool)

(assert (=> b!1311822 (= res!870885 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30040))))

(assert (= (and start!110826 res!870888) b!1311815))

(assert (= (and b!1311815 res!870883) b!1311812))

(assert (= (and b!1311812 res!870884) b!1311822))

(assert (= (and b!1311822 res!870885) b!1311817))

(assert (= (and b!1311817 res!870880) b!1311811))

(assert (= (and b!1311811 res!870886) b!1311818))

(assert (= (and b!1311818 res!870887) b!1311820))

(assert (= (and b!1311820 res!870881) b!1311816))

(assert (= (and b!1311816 res!870882) b!1311814))

(assert (= (and b!1311819 condMapEmpty!54715) mapIsEmpty!54715))

(assert (= (and b!1311819 (not condMapEmpty!54715)) mapNonEmpty!54715))

(get-info :version)

(assert (= (and mapNonEmpty!54715 ((_ is ValueCellFull!16797) mapValue!54715)) b!1311821))

(assert (= (and b!1311819 ((_ is ValueCellFull!16797) mapDefault!54715)) b!1311813))

(assert (= start!110826 b!1311819))

(declare-fun m!1201163 () Bool)

(assert (=> b!1311814 m!1201163))

(assert (=> b!1311814 m!1201163))

(declare-fun m!1201165 () Bool)

(assert (=> b!1311814 m!1201165))

(declare-fun m!1201167 () Bool)

(assert (=> b!1311814 m!1201167))

(declare-fun m!1201169 () Bool)

(assert (=> b!1311812 m!1201169))

(declare-fun m!1201171 () Bool)

(assert (=> b!1311811 m!1201171))

(assert (=> b!1311811 m!1201171))

(declare-fun m!1201173 () Bool)

(assert (=> b!1311811 m!1201173))

(declare-fun m!1201175 () Bool)

(assert (=> b!1311822 m!1201175))

(declare-fun m!1201177 () Bool)

(assert (=> mapNonEmpty!54715 m!1201177))

(declare-fun m!1201179 () Bool)

(assert (=> start!110826 m!1201179))

(declare-fun m!1201181 () Bool)

(assert (=> start!110826 m!1201181))

(declare-fun m!1201183 () Bool)

(assert (=> start!110826 m!1201183))

(declare-fun m!1201185 () Bool)

(assert (=> b!1311818 m!1201185))

(assert (=> b!1311820 m!1201185))

(assert (=> b!1311820 m!1201185))

(declare-fun m!1201187 () Bool)

(assert (=> b!1311820 m!1201187))

(check-sat (not b!1311812) (not b!1311822) tp_is_empty!35391 (not b!1311811) (not start!110826) b_and!47869 (not b_next!29661) (not b!1311814) (not b!1311820) (not mapNonEmpty!54715))
(check-sat b_and!47869 (not b_next!29661))
