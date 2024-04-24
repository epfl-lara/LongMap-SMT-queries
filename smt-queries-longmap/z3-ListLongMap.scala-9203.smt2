; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110790 () Bool)

(assert start!110790)

(declare-fun b_free!29401 () Bool)

(declare-fun b_next!29401 () Bool)

(assert (=> start!110790 (= b_free!29401 (not b_next!29401))))

(declare-fun tp!103525 () Bool)

(declare-fun b_and!47611 () Bool)

(assert (=> start!110790 (= tp!103525 b_and!47611)))

(declare-fun b!1309294 () Bool)

(declare-fun e!747214 () Bool)

(declare-fun tp_is_empty!35131 () Bool)

(assert (=> b!1309294 (= e!747214 tp_is_empty!35131)))

(declare-fun b!1309295 () Bool)

(declare-fun res!868754 () Bool)

(declare-fun e!747211 () Bool)

(assert (=> b!1309295 (=> (not res!868754) (not e!747211))))

(declare-datatypes ((array!87319 0))(
  ( (array!87320 (arr!42135 (Array (_ BitVec 32) (_ BitVec 64))) (size!42686 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87319)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309295 (= res!868754 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42686 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309296 () Bool)

(declare-fun res!868757 () Bool)

(assert (=> b!1309296 (=> (not res!868757) (not e!747211))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87319 (_ BitVec 32)) Bool)

(assert (=> b!1309296 (= res!868757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309297 () Bool)

(declare-fun e!747215 () Bool)

(declare-fun mapRes!54325 () Bool)

(assert (=> b!1309297 (= e!747215 (and e!747214 mapRes!54325))))

(declare-fun condMapEmpty!54325 () Bool)

(declare-datatypes ((V!51945 0))(
  ( (V!51946 (val!17640 Int)) )
))
(declare-datatypes ((ValueCell!16667 0))(
  ( (ValueCellFull!16667 (v!20262 V!51945)) (EmptyCell!16667) )
))
(declare-datatypes ((array!87321 0))(
  ( (array!87322 (arr!42136 (Array (_ BitVec 32) ValueCell!16667)) (size!42687 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87321)

(declare-fun mapDefault!54325 () ValueCell!16667)

(assert (=> b!1309297 (= condMapEmpty!54325 (= (arr!42136 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16667)) mapDefault!54325)))))

(declare-fun b!1309298 () Bool)

(declare-fun res!868755 () Bool)

(assert (=> b!1309298 (=> (not res!868755) (not e!747211))))

(assert (=> b!1309298 (= res!868755 (not (= (select (arr!42135 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1309299 () Bool)

(declare-fun res!868759 () Bool)

(assert (=> b!1309299 (=> (not res!868759) (not e!747211))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51945)

(declare-fun zeroValue!1296 () V!51945)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22744 0))(
  ( (tuple2!22745 (_1!11383 (_ BitVec 64)) (_2!11383 V!51945)) )
))
(declare-datatypes ((List!29908 0))(
  ( (Nil!29905) (Cons!29904 (h!31122 tuple2!22744) (t!43506 List!29908)) )
))
(declare-datatypes ((ListLongMap!20409 0))(
  ( (ListLongMap!20410 (toList!10220 List!29908)) )
))
(declare-fun contains!8382 (ListLongMap!20409 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5224 (array!87319 array!87321 (_ BitVec 32) (_ BitVec 32) V!51945 V!51945 (_ BitVec 32) Int) ListLongMap!20409)

(assert (=> b!1309299 (= res!868759 (contains!8382 (getCurrentListMap!5224 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309300 () Bool)

(declare-fun res!868760 () Bool)

(assert (=> b!1309300 (=> (not res!868760) (not e!747211))))

(assert (=> b!1309300 (= res!868760 (and (= (size!42687 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42686 _keys!1628) (size!42687 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!868753 () Bool)

(assert (=> start!110790 (=> (not res!868753) (not e!747211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110790 (= res!868753 (validMask!0 mask!2040))))

(assert (=> start!110790 e!747211))

(assert (=> start!110790 tp!103525))

(declare-fun array_inv!32103 (array!87319) Bool)

(assert (=> start!110790 (array_inv!32103 _keys!1628)))

(assert (=> start!110790 true))

(assert (=> start!110790 tp_is_empty!35131))

(declare-fun array_inv!32104 (array!87321) Bool)

(assert (=> start!110790 (and (array_inv!32104 _values!1354) e!747215)))

(declare-fun b!1309301 () Bool)

(declare-fun res!868756 () Bool)

(assert (=> b!1309301 (=> (not res!868756) (not e!747211))))

(declare-datatypes ((List!29909 0))(
  ( (Nil!29906) (Cons!29905 (h!31123 (_ BitVec 64)) (t!43507 List!29909)) )
))
(declare-fun arrayNoDuplicates!0 (array!87319 (_ BitVec 32) List!29909) Bool)

(assert (=> b!1309301 (= res!868756 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29906))))

(declare-fun b!1309302 () Bool)

(declare-fun res!868758 () Bool)

(assert (=> b!1309302 (=> (not res!868758) (not e!747211))))

(assert (=> b!1309302 (= res!868758 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!54325 () Bool)

(declare-fun tp!103524 () Bool)

(declare-fun e!747212 () Bool)

(assert (=> mapNonEmpty!54325 (= mapRes!54325 (and tp!103524 e!747212))))

(declare-fun mapRest!54325 () (Array (_ BitVec 32) ValueCell!16667))

(declare-fun mapValue!54325 () ValueCell!16667)

(declare-fun mapKey!54325 () (_ BitVec 32))

(assert (=> mapNonEmpty!54325 (= (arr!42136 _values!1354) (store mapRest!54325 mapKey!54325 mapValue!54325))))

(declare-fun mapIsEmpty!54325 () Bool)

(assert (=> mapIsEmpty!54325 mapRes!54325))

(declare-fun b!1309303 () Bool)

(assert (=> b!1309303 (= e!747212 tp_is_empty!35131)))

(declare-fun b!1309304 () Bool)

(assert (=> b!1309304 (= e!747211 (not true))))

(assert (=> b!1309304 (contains!8382 (getCurrentListMap!5224 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43243 0))(
  ( (Unit!43244) )
))
(declare-fun lt!585596 () Unit!43243)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!2 (array!87319 array!87321 (_ BitVec 32) (_ BitVec 32) V!51945 V!51945 (_ BitVec 64) (_ BitVec 32) Int) Unit!43243)

(assert (=> b!1309304 (= lt!585596 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!2 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309305 () Bool)

(declare-fun res!868752 () Bool)

(assert (=> b!1309305 (=> (not res!868752) (not e!747211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309305 (= res!868752 (validKeyInArray!0 (select (arr!42135 _keys!1628) from!2020)))))

(assert (= (and start!110790 res!868753) b!1309300))

(assert (= (and b!1309300 res!868760) b!1309296))

(assert (= (and b!1309296 res!868757) b!1309301))

(assert (= (and b!1309301 res!868756) b!1309295))

(assert (= (and b!1309295 res!868754) b!1309299))

(assert (= (and b!1309299 res!868759) b!1309298))

(assert (= (and b!1309298 res!868755) b!1309305))

(assert (= (and b!1309305 res!868752) b!1309302))

(assert (= (and b!1309302 res!868758) b!1309304))

(assert (= (and b!1309297 condMapEmpty!54325) mapIsEmpty!54325))

(assert (= (and b!1309297 (not condMapEmpty!54325)) mapNonEmpty!54325))

(get-info :version)

(assert (= (and mapNonEmpty!54325 ((_ is ValueCellFull!16667) mapValue!54325)) b!1309303))

(assert (= (and b!1309297 ((_ is ValueCellFull!16667) mapDefault!54325)) b!1309294))

(assert (= start!110790 b!1309297))

(declare-fun m!1200101 () Bool)

(assert (=> b!1309298 m!1200101))

(assert (=> b!1309305 m!1200101))

(assert (=> b!1309305 m!1200101))

(declare-fun m!1200103 () Bool)

(assert (=> b!1309305 m!1200103))

(declare-fun m!1200105 () Bool)

(assert (=> mapNonEmpty!54325 m!1200105))

(declare-fun m!1200107 () Bool)

(assert (=> b!1309301 m!1200107))

(declare-fun m!1200109 () Bool)

(assert (=> start!110790 m!1200109))

(declare-fun m!1200111 () Bool)

(assert (=> start!110790 m!1200111))

(declare-fun m!1200113 () Bool)

(assert (=> start!110790 m!1200113))

(declare-fun m!1200115 () Bool)

(assert (=> b!1309296 m!1200115))

(declare-fun m!1200117 () Bool)

(assert (=> b!1309299 m!1200117))

(assert (=> b!1309299 m!1200117))

(declare-fun m!1200119 () Bool)

(assert (=> b!1309299 m!1200119))

(declare-fun m!1200121 () Bool)

(assert (=> b!1309304 m!1200121))

(assert (=> b!1309304 m!1200121))

(declare-fun m!1200123 () Bool)

(assert (=> b!1309304 m!1200123))

(declare-fun m!1200125 () Bool)

(assert (=> b!1309304 m!1200125))

(check-sat (not b!1309305) (not b_next!29401) (not b!1309304) (not b!1309301) tp_is_empty!35131 (not b!1309296) (not mapNonEmpty!54325) b_and!47611 (not b!1309299) (not start!110790))
(check-sat b_and!47611 (not b_next!29401))
