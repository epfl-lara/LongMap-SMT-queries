; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111252 () Bool)

(assert start!111252)

(declare-fun b_free!29863 () Bool)

(declare-fun b_next!29863 () Bool)

(assert (=> start!111252 (= b_free!29863 (not b_next!29863))))

(declare-fun tp!104911 () Bool)

(declare-fun b_and!48073 () Bool)

(assert (=> start!111252 (= tp!104911 b_and!48073)))

(declare-fun b!1315829 () Bool)

(declare-fun e!750677 () Bool)

(declare-fun e!750679 () Bool)

(declare-fun mapRes!55018 () Bool)

(assert (=> b!1315829 (= e!750677 (and e!750679 mapRes!55018))))

(declare-fun condMapEmpty!55018 () Bool)

(declare-datatypes ((V!52561 0))(
  ( (V!52562 (val!17871 Int)) )
))
(declare-datatypes ((ValueCell!16898 0))(
  ( (ValueCellFull!16898 (v!20493 V!52561)) (EmptyCell!16898) )
))
(declare-datatypes ((array!88213 0))(
  ( (array!88214 (arr!42582 (Array (_ BitVec 32) ValueCell!16898)) (size!43133 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88213)

(declare-fun mapDefault!55018 () ValueCell!16898)

(assert (=> b!1315829 (= condMapEmpty!55018 (= (arr!42582 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16898)) mapDefault!55018)))))

(declare-fun b!1315830 () Bool)

(declare-fun e!750678 () Bool)

(assert (=> b!1315830 (= e!750678 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88215 0))(
  ( (array!88216 (arr!42583 (Array (_ BitVec 32) (_ BitVec 64))) (size!43134 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88215)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52561)

(declare-fun zeroValue!1296 () V!52561)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!586280 () Bool)

(declare-datatypes ((tuple2!23072 0))(
  ( (tuple2!23073 (_1!11547 (_ BitVec 64)) (_2!11547 V!52561)) )
))
(declare-datatypes ((List!30221 0))(
  ( (Nil!30218) (Cons!30217 (h!31435 tuple2!23072) (t!43819 List!30221)) )
))
(declare-datatypes ((ListLongMap!20737 0))(
  ( (ListLongMap!20738 (toList!10384 List!30221)) )
))
(declare-fun contains!8546 (ListLongMap!20737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5388 (array!88215 array!88213 (_ BitVec 32) (_ BitVec 32) V!52561 V!52561 (_ BitVec 32) Int) ListLongMap!20737)

(assert (=> b!1315830 (= lt!586280 (contains!8546 (getCurrentListMap!5388 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315831 () Bool)

(declare-fun res!873210 () Bool)

(assert (=> b!1315831 (=> (not res!873210) (not e!750678))))

(assert (=> b!1315831 (= res!873210 (and (= (size!43133 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43134 _keys!1628) (size!43133 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315832 () Bool)

(declare-fun tp_is_empty!35593 () Bool)

(assert (=> b!1315832 (= e!750679 tp_is_empty!35593)))

(declare-fun b!1315833 () Bool)

(declare-fun e!750680 () Bool)

(assert (=> b!1315833 (= e!750680 tp_is_empty!35593)))

(declare-fun b!1315834 () Bool)

(declare-fun res!873209 () Bool)

(assert (=> b!1315834 (=> (not res!873209) (not e!750678))))

(assert (=> b!1315834 (= res!873209 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43134 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315836 () Bool)

(declare-fun res!873211 () Bool)

(assert (=> b!1315836 (=> (not res!873211) (not e!750678))))

(declare-datatypes ((List!30222 0))(
  ( (Nil!30219) (Cons!30218 (h!31436 (_ BitVec 64)) (t!43820 List!30222)) )
))
(declare-fun arrayNoDuplicates!0 (array!88215 (_ BitVec 32) List!30222) Bool)

(assert (=> b!1315836 (= res!873211 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30219))))

(declare-fun mapIsEmpty!55018 () Bool)

(assert (=> mapIsEmpty!55018 mapRes!55018))

(declare-fun mapNonEmpty!55018 () Bool)

(declare-fun tp!104910 () Bool)

(assert (=> mapNonEmpty!55018 (= mapRes!55018 (and tp!104910 e!750680))))

(declare-fun mapRest!55018 () (Array (_ BitVec 32) ValueCell!16898))

(declare-fun mapValue!55018 () ValueCell!16898)

(declare-fun mapKey!55018 () (_ BitVec 32))

(assert (=> mapNonEmpty!55018 (= (arr!42582 _values!1354) (store mapRest!55018 mapKey!55018 mapValue!55018))))

(declare-fun b!1315835 () Bool)

(declare-fun res!873212 () Bool)

(assert (=> b!1315835 (=> (not res!873212) (not e!750678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88215 (_ BitVec 32)) Bool)

(assert (=> b!1315835 (= res!873212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!873208 () Bool)

(assert (=> start!111252 (=> (not res!873208) (not e!750678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111252 (= res!873208 (validMask!0 mask!2040))))

(assert (=> start!111252 e!750678))

(assert (=> start!111252 tp!104911))

(declare-fun array_inv!32425 (array!88215) Bool)

(assert (=> start!111252 (array_inv!32425 _keys!1628)))

(assert (=> start!111252 true))

(assert (=> start!111252 tp_is_empty!35593))

(declare-fun array_inv!32426 (array!88213) Bool)

(assert (=> start!111252 (and (array_inv!32426 _values!1354) e!750677)))

(assert (= (and start!111252 res!873208) b!1315831))

(assert (= (and b!1315831 res!873210) b!1315835))

(assert (= (and b!1315835 res!873212) b!1315836))

(assert (= (and b!1315836 res!873211) b!1315834))

(assert (= (and b!1315834 res!873209) b!1315830))

(assert (= (and b!1315829 condMapEmpty!55018) mapIsEmpty!55018))

(assert (= (and b!1315829 (not condMapEmpty!55018)) mapNonEmpty!55018))

(get-info :version)

(assert (= (and mapNonEmpty!55018 ((_ is ValueCellFull!16898) mapValue!55018)) b!1315833))

(assert (= (and b!1315829 ((_ is ValueCellFull!16898) mapDefault!55018)) b!1315832))

(assert (= start!111252 b!1315829))

(declare-fun m!1204619 () Bool)

(assert (=> b!1315836 m!1204619))

(declare-fun m!1204621 () Bool)

(assert (=> start!111252 m!1204621))

(declare-fun m!1204623 () Bool)

(assert (=> start!111252 m!1204623))

(declare-fun m!1204625 () Bool)

(assert (=> start!111252 m!1204625))

(declare-fun m!1204627 () Bool)

(assert (=> b!1315830 m!1204627))

(assert (=> b!1315830 m!1204627))

(declare-fun m!1204629 () Bool)

(assert (=> b!1315830 m!1204629))

(declare-fun m!1204631 () Bool)

(assert (=> b!1315835 m!1204631))

(declare-fun m!1204633 () Bool)

(assert (=> mapNonEmpty!55018 m!1204633))

(check-sat (not b_next!29863) (not mapNonEmpty!55018) (not start!111252) b_and!48073 (not b!1315836) (not b!1315835) tp_is_empty!35593 (not b!1315830))
(check-sat b_and!48073 (not b_next!29863))
