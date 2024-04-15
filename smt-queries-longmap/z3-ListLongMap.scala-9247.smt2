; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110830 () Bool)

(assert start!110830)

(declare-fun b_free!29665 () Bool)

(declare-fun b_next!29665 () Bool)

(assert (=> start!110830 (= b_free!29665 (not b_next!29665))))

(declare-fun tp!104317 () Bool)

(declare-fun b_and!47855 () Bool)

(assert (=> start!110830 (= tp!104317 b_and!47855)))

(declare-fun b!1311813 () Bool)

(declare-fun res!870912 () Bool)

(declare-fun e!748319 () Bool)

(assert (=> b!1311813 (=> (not res!870912) (not e!748319))))

(declare-datatypes ((array!87683 0))(
  ( (array!87684 (arr!42322 (Array (_ BitVec 32) (_ BitVec 64))) (size!42874 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87683)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87683 (_ BitVec 32)) Bool)

(assert (=> b!1311813 (= res!870912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!870909 () Bool)

(assert (=> start!110830 (=> (not res!870909) (not e!748319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110830 (= res!870909 (validMask!0 mask!2040))))

(assert (=> start!110830 e!748319))

(assert (=> start!110830 tp!104317))

(declare-fun array_inv!32163 (array!87683) Bool)

(assert (=> start!110830 (array_inv!32163 _keys!1628)))

(assert (=> start!110830 true))

(declare-fun tp_is_empty!35395 () Bool)

(assert (=> start!110830 tp_is_empty!35395))

(declare-datatypes ((V!52297 0))(
  ( (V!52298 (val!17772 Int)) )
))
(declare-datatypes ((ValueCell!16799 0))(
  ( (ValueCellFull!16799 (v!20398 V!52297)) (EmptyCell!16799) )
))
(declare-datatypes ((array!87685 0))(
  ( (array!87686 (arr!42323 (Array (_ BitVec 32) ValueCell!16799)) (size!42875 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87685)

(declare-fun e!748316 () Bool)

(declare-fun array_inv!32164 (array!87685) Bool)

(assert (=> start!110830 (and (array_inv!32164 _values!1354) e!748316)))

(declare-fun b!1311814 () Bool)

(declare-fun e!748318 () Bool)

(declare-fun mapRes!54721 () Bool)

(assert (=> b!1311814 (= e!748316 (and e!748318 mapRes!54721))))

(declare-fun condMapEmpty!54721 () Bool)

(declare-fun mapDefault!54721 () ValueCell!16799)

(assert (=> b!1311814 (= condMapEmpty!54721 (= (arr!42323 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16799)) mapDefault!54721)))))

(declare-fun b!1311815 () Bool)

(declare-fun res!870906 () Bool)

(assert (=> b!1311815 (=> (not res!870906) (not e!748319))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311815 (= res!870906 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1311816 () Bool)

(declare-fun res!870905 () Bool)

(assert (=> b!1311816 (=> (not res!870905) (not e!748319))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311816 (= res!870905 (validKeyInArray!0 (select (arr!42322 _keys!1628) from!2020)))))

(declare-fun b!1311817 () Bool)

(declare-fun res!870910 () Bool)

(assert (=> b!1311817 (=> (not res!870910) (not e!748319))))

(declare-datatypes ((List!30112 0))(
  ( (Nil!30109) (Cons!30108 (h!31317 (_ BitVec 64)) (t!43710 List!30112)) )
))
(declare-fun arrayNoDuplicates!0 (array!87683 (_ BitVec 32) List!30112) Bool)

(assert (=> b!1311817 (= res!870910 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30109))))

(declare-fun b!1311818 () Bool)

(assert (=> b!1311818 (= e!748318 tp_is_empty!35395)))

(declare-fun b!1311819 () Bool)

(assert (=> b!1311819 (= e!748319 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52297)

(declare-fun zeroValue!1296 () V!52297)

(declare-datatypes ((tuple2!22992 0))(
  ( (tuple2!22993 (_1!11507 (_ BitVec 64)) (_2!11507 V!52297)) )
))
(declare-datatypes ((List!30113 0))(
  ( (Nil!30110) (Cons!30109 (h!31318 tuple2!22992) (t!43711 List!30113)) )
))
(declare-datatypes ((ListLongMap!20649 0))(
  ( (ListLongMap!20650 (toList!10340 List!30113)) )
))
(declare-fun contains!8417 (ListLongMap!20649 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5235 (array!87683 array!87685 (_ BitVec 32) (_ BitVec 32) V!52297 V!52297 (_ BitVec 32) Int) ListLongMap!20649)

(assert (=> b!1311819 (contains!8417 (getCurrentListMap!5235 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43195 0))(
  ( (Unit!43196) )
))
(declare-fun lt!585330 () Unit!43195)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!8 (array!87683 array!87685 (_ BitVec 32) (_ BitVec 32) V!52297 V!52297 (_ BitVec 64) (_ BitVec 32) Int) Unit!43195)

(assert (=> b!1311819 (= lt!585330 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!8 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun mapNonEmpty!54721 () Bool)

(declare-fun tp!104318 () Bool)

(declare-fun e!748317 () Bool)

(assert (=> mapNonEmpty!54721 (= mapRes!54721 (and tp!104318 e!748317))))

(declare-fun mapKey!54721 () (_ BitVec 32))

(declare-fun mapValue!54721 () ValueCell!16799)

(declare-fun mapRest!54721 () (Array (_ BitVec 32) ValueCell!16799))

(assert (=> mapNonEmpty!54721 (= (arr!42323 _values!1354) (store mapRest!54721 mapKey!54721 mapValue!54721))))

(declare-fun b!1311820 () Bool)

(declare-fun res!870913 () Bool)

(assert (=> b!1311820 (=> (not res!870913) (not e!748319))))

(assert (=> b!1311820 (= res!870913 (contains!8417 (getCurrentListMap!5235 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311821 () Bool)

(assert (=> b!1311821 (= e!748317 tp_is_empty!35395)))

(declare-fun b!1311822 () Bool)

(declare-fun res!870908 () Bool)

(assert (=> b!1311822 (=> (not res!870908) (not e!748319))))

(assert (=> b!1311822 (= res!870908 (and (= (size!42875 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42874 _keys!1628) (size!42875 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311823 () Bool)

(declare-fun res!870911 () Bool)

(assert (=> b!1311823 (=> (not res!870911) (not e!748319))))

(assert (=> b!1311823 (= res!870911 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42874 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311824 () Bool)

(declare-fun res!870907 () Bool)

(assert (=> b!1311824 (=> (not res!870907) (not e!748319))))

(assert (=> b!1311824 (= res!870907 (not (= (select (arr!42322 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapIsEmpty!54721 () Bool)

(assert (=> mapIsEmpty!54721 mapRes!54721))

(assert (= (and start!110830 res!870909) b!1311822))

(assert (= (and b!1311822 res!870908) b!1311813))

(assert (= (and b!1311813 res!870912) b!1311817))

(assert (= (and b!1311817 res!870910) b!1311823))

(assert (= (and b!1311823 res!870911) b!1311820))

(assert (= (and b!1311820 res!870913) b!1311824))

(assert (= (and b!1311824 res!870907) b!1311816))

(assert (= (and b!1311816 res!870905) b!1311815))

(assert (= (and b!1311815 res!870906) b!1311819))

(assert (= (and b!1311814 condMapEmpty!54721) mapIsEmpty!54721))

(assert (= (and b!1311814 (not condMapEmpty!54721)) mapNonEmpty!54721))

(get-info :version)

(assert (= (and mapNonEmpty!54721 ((_ is ValueCellFull!16799) mapValue!54721)) b!1311821))

(assert (= (and b!1311814 ((_ is ValueCellFull!16799) mapDefault!54721)) b!1311818))

(assert (= start!110830 b!1311814))

(declare-fun m!1200699 () Bool)

(assert (=> b!1311813 m!1200699))

(declare-fun m!1200701 () Bool)

(assert (=> b!1311820 m!1200701))

(assert (=> b!1311820 m!1200701))

(declare-fun m!1200703 () Bool)

(assert (=> b!1311820 m!1200703))

(declare-fun m!1200705 () Bool)

(assert (=> b!1311816 m!1200705))

(assert (=> b!1311816 m!1200705))

(declare-fun m!1200707 () Bool)

(assert (=> b!1311816 m!1200707))

(declare-fun m!1200709 () Bool)

(assert (=> mapNonEmpty!54721 m!1200709))

(assert (=> b!1311824 m!1200705))

(declare-fun m!1200711 () Bool)

(assert (=> b!1311819 m!1200711))

(assert (=> b!1311819 m!1200711))

(declare-fun m!1200713 () Bool)

(assert (=> b!1311819 m!1200713))

(declare-fun m!1200715 () Bool)

(assert (=> b!1311819 m!1200715))

(declare-fun m!1200717 () Bool)

(assert (=> start!110830 m!1200717))

(declare-fun m!1200719 () Bool)

(assert (=> start!110830 m!1200719))

(declare-fun m!1200721 () Bool)

(assert (=> start!110830 m!1200721))

(declare-fun m!1200723 () Bool)

(assert (=> b!1311817 m!1200723))

(check-sat b_and!47855 (not b!1311817) (not b!1311820) (not b!1311813) tp_is_empty!35395 (not b!1311819) (not b_next!29665) (not b!1311816) (not start!110830) (not mapNonEmpty!54721))
(check-sat b_and!47855 (not b_next!29665))
