; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110910 () Bool)

(assert start!110910)

(declare-fun b_free!29521 () Bool)

(declare-fun b_next!29521 () Bool)

(assert (=> start!110910 (= b_free!29521 (not b_next!29521))))

(declare-fun tp!103885 () Bool)

(declare-fun b_and!47731 () Bool)

(assert (=> start!110910 (= tp!103885 b_and!47731)))

(declare-fun b!1311022 () Bool)

(declare-fun res!869944 () Bool)

(declare-fun e!748113 () Bool)

(assert (=> b!1311022 (=> (not res!869944) (not e!748113))))

(declare-datatypes ((array!87555 0))(
  ( (array!87556 (arr!42253 (Array (_ BitVec 32) (_ BitVec 64))) (size!42804 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87555)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311022 (= res!869944 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42804 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311023 () Bool)

(declare-fun res!869947 () Bool)

(assert (=> b!1311023 (=> (not res!869947) (not e!748113))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311023 (= res!869947 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1311024 () Bool)

(declare-fun res!869941 () Bool)

(assert (=> b!1311024 (=> (not res!869941) (not e!748113))))

(assert (=> b!1311024 (= res!869941 (not (= (select (arr!42253 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1311025 () Bool)

(declare-fun e!748115 () Bool)

(declare-fun tp_is_empty!35251 () Bool)

(assert (=> b!1311025 (= e!748115 tp_is_empty!35251)))

(declare-fun b!1311026 () Bool)

(declare-fun res!869948 () Bool)

(assert (=> b!1311026 (=> (not res!869948) (not e!748113))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52105 0))(
  ( (V!52106 (val!17700 Int)) )
))
(declare-fun minValue!1296 () V!52105)

(declare-fun zeroValue!1296 () V!52105)

(declare-datatypes ((ValueCell!16727 0))(
  ( (ValueCellFull!16727 (v!20322 V!52105)) (EmptyCell!16727) )
))
(declare-datatypes ((array!87557 0))(
  ( (array!87558 (arr!42254 (Array (_ BitVec 32) ValueCell!16727)) (size!42805 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87557)

(declare-datatypes ((tuple2!22838 0))(
  ( (tuple2!22839 (_1!11430 (_ BitVec 64)) (_2!11430 V!52105)) )
))
(declare-datatypes ((List!29997 0))(
  ( (Nil!29994) (Cons!29993 (h!31211 tuple2!22838) (t!43595 List!29997)) )
))
(declare-datatypes ((ListLongMap!20503 0))(
  ( (ListLongMap!20504 (toList!10267 List!29997)) )
))
(declare-fun contains!8429 (ListLongMap!20503 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5271 (array!87555 array!87557 (_ BitVec 32) (_ BitVec 32) V!52105 V!52105 (_ BitVec 32) Int) ListLongMap!20503)

(assert (=> b!1311026 (= res!869948 (contains!8429 (getCurrentListMap!5271 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311027 () Bool)

(declare-fun res!869940 () Bool)

(assert (=> b!1311027 (=> (not res!869940) (not e!748113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311027 (= res!869940 (validKeyInArray!0 (select (arr!42253 _keys!1628) from!2020)))))

(declare-fun b!1311028 () Bool)

(declare-fun e!748111 () Bool)

(assert (=> b!1311028 (= e!748111 tp_is_empty!35251)))

(declare-fun b!1311029 () Bool)

(declare-fun res!869942 () Bool)

(assert (=> b!1311029 (=> (not res!869942) (not e!748113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87555 (_ BitVec 32)) Bool)

(assert (=> b!1311029 (= res!869942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311030 () Bool)

(assert (=> b!1311030 (= e!748113 (not true))))

(assert (=> b!1311030 (contains!8429 (getCurrentListMap!5271 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43279 0))(
  ( (Unit!43280) )
))
(declare-fun lt!585776 () Unit!43279)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!1 (array!87555 array!87557 (_ BitVec 32) (_ BitVec 32) V!52105 V!52105 (_ BitVec 64) (_ BitVec 32) Int) Unit!43279)

(assert (=> b!1311030 (= lt!585776 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!1 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311031 () Bool)

(declare-fun res!869943 () Bool)

(assert (=> b!1311031 (=> (not res!869943) (not e!748113))))

(assert (=> b!1311031 (= res!869943 (and (= (size!42805 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42804 _keys!1628) (size!42805 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311032 () Bool)

(declare-fun e!748112 () Bool)

(declare-fun mapRes!54505 () Bool)

(assert (=> b!1311032 (= e!748112 (and e!748111 mapRes!54505))))

(declare-fun condMapEmpty!54505 () Bool)

(declare-fun mapDefault!54505 () ValueCell!16727)

(assert (=> b!1311032 (= condMapEmpty!54505 (= (arr!42254 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16727)) mapDefault!54505)))))

(declare-fun mapNonEmpty!54505 () Bool)

(declare-fun tp!103884 () Bool)

(assert (=> mapNonEmpty!54505 (= mapRes!54505 (and tp!103884 e!748115))))

(declare-fun mapRest!54505 () (Array (_ BitVec 32) ValueCell!16727))

(declare-fun mapValue!54505 () ValueCell!16727)

(declare-fun mapKey!54505 () (_ BitVec 32))

(assert (=> mapNonEmpty!54505 (= (arr!42254 _values!1354) (store mapRest!54505 mapKey!54505 mapValue!54505))))

(declare-fun res!869945 () Bool)

(assert (=> start!110910 (=> (not res!869945) (not e!748113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110910 (= res!869945 (validMask!0 mask!2040))))

(assert (=> start!110910 e!748113))

(assert (=> start!110910 tp!103885))

(declare-fun array_inv!32199 (array!87555) Bool)

(assert (=> start!110910 (array_inv!32199 _keys!1628)))

(assert (=> start!110910 true))

(assert (=> start!110910 tp_is_empty!35251))

(declare-fun array_inv!32200 (array!87557) Bool)

(assert (=> start!110910 (and (array_inv!32200 _values!1354) e!748112)))

(declare-fun b!1311033 () Bool)

(declare-fun res!869946 () Bool)

(assert (=> b!1311033 (=> (not res!869946) (not e!748113))))

(declare-datatypes ((List!29998 0))(
  ( (Nil!29995) (Cons!29994 (h!31212 (_ BitVec 64)) (t!43596 List!29998)) )
))
(declare-fun arrayNoDuplicates!0 (array!87555 (_ BitVec 32) List!29998) Bool)

(assert (=> b!1311033 (= res!869946 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29995))))

(declare-fun mapIsEmpty!54505 () Bool)

(assert (=> mapIsEmpty!54505 mapRes!54505))

(assert (= (and start!110910 res!869945) b!1311031))

(assert (= (and b!1311031 res!869943) b!1311029))

(assert (= (and b!1311029 res!869942) b!1311033))

(assert (= (and b!1311033 res!869946) b!1311022))

(assert (= (and b!1311022 res!869944) b!1311026))

(assert (= (and b!1311026 res!869948) b!1311024))

(assert (= (and b!1311024 res!869941) b!1311027))

(assert (= (and b!1311027 res!869940) b!1311023))

(assert (= (and b!1311023 res!869947) b!1311030))

(assert (= (and b!1311032 condMapEmpty!54505) mapIsEmpty!54505))

(assert (= (and b!1311032 (not condMapEmpty!54505)) mapNonEmpty!54505))

(get-info :version)

(assert (= (and mapNonEmpty!54505 ((_ is ValueCellFull!16727) mapValue!54505)) b!1311025))

(assert (= (and b!1311032 ((_ is ValueCellFull!16727) mapDefault!54505)) b!1311028))

(assert (= start!110910 b!1311032))

(declare-fun m!1201301 () Bool)

(assert (=> b!1311030 m!1201301))

(assert (=> b!1311030 m!1201301))

(declare-fun m!1201303 () Bool)

(assert (=> b!1311030 m!1201303))

(declare-fun m!1201305 () Bool)

(assert (=> b!1311030 m!1201305))

(declare-fun m!1201307 () Bool)

(assert (=> start!110910 m!1201307))

(declare-fun m!1201309 () Bool)

(assert (=> start!110910 m!1201309))

(declare-fun m!1201311 () Bool)

(assert (=> start!110910 m!1201311))

(declare-fun m!1201313 () Bool)

(assert (=> b!1311026 m!1201313))

(assert (=> b!1311026 m!1201313))

(declare-fun m!1201315 () Bool)

(assert (=> b!1311026 m!1201315))

(declare-fun m!1201317 () Bool)

(assert (=> b!1311024 m!1201317))

(declare-fun m!1201319 () Bool)

(assert (=> b!1311033 m!1201319))

(assert (=> b!1311027 m!1201317))

(assert (=> b!1311027 m!1201317))

(declare-fun m!1201321 () Bool)

(assert (=> b!1311027 m!1201321))

(declare-fun m!1201323 () Bool)

(assert (=> b!1311029 m!1201323))

(declare-fun m!1201325 () Bool)

(assert (=> mapNonEmpty!54505 m!1201325))

(check-sat (not b_next!29521) (not start!110910) tp_is_empty!35251 (not b!1311027) (not mapNonEmpty!54505) b_and!47731 (not b!1311030) (not b!1311026) (not b!1311033) (not b!1311029))
(check-sat b_and!47731 (not b_next!29521))
