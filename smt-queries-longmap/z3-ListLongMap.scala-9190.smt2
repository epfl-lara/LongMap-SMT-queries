; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110490 () Bool)

(assert start!110490)

(declare-fun b_free!29325 () Bool)

(declare-fun b_next!29325 () Bool)

(assert (=> start!110490 (= b_free!29325 (not b_next!29325))))

(declare-fun tp!103296 () Bool)

(declare-fun b_and!47533 () Bool)

(assert (=> start!110490 (= tp!103296 b_and!47533)))

(declare-fun b!1307039 () Bool)

(declare-fun res!867622 () Bool)

(declare-fun e!745802 () Bool)

(assert (=> b!1307039 (=> (not res!867622) (not e!745802))))

(declare-datatypes ((array!87116 0))(
  ( (array!87117 (arr!42038 (Array (_ BitVec 32) (_ BitVec 64))) (size!42588 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87116)

(declare-datatypes ((List!29806 0))(
  ( (Nil!29803) (Cons!29802 (h!31011 (_ BitVec 64)) (t!43412 List!29806)) )
))
(declare-fun arrayNoDuplicates!0 (array!87116 (_ BitVec 32) List!29806) Bool)

(assert (=> b!1307039 (= res!867622 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29803))))

(declare-fun b!1307040 () Bool)

(declare-fun res!867620 () Bool)

(assert (=> b!1307040 (=> (not res!867620) (not e!745802))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307040 (= res!867620 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42588 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307041 () Bool)

(declare-fun e!745801 () Bool)

(declare-fun tp_is_empty!35055 () Bool)

(assert (=> b!1307041 (= e!745801 tp_is_empty!35055)))

(declare-fun res!867623 () Bool)

(assert (=> start!110490 (=> (not res!867623) (not e!745802))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110490 (= res!867623 (validMask!0 mask!2040))))

(assert (=> start!110490 e!745802))

(assert (=> start!110490 tp!103296))

(declare-fun array_inv!31779 (array!87116) Bool)

(assert (=> start!110490 (array_inv!31779 _keys!1628)))

(assert (=> start!110490 true))

(assert (=> start!110490 tp_is_empty!35055))

(declare-datatypes ((V!51843 0))(
  ( (V!51844 (val!17602 Int)) )
))
(declare-datatypes ((ValueCell!16629 0))(
  ( (ValueCellFull!16629 (v!20229 V!51843)) (EmptyCell!16629) )
))
(declare-datatypes ((array!87118 0))(
  ( (array!87119 (arr!42039 (Array (_ BitVec 32) ValueCell!16629)) (size!42589 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87118)

(declare-fun e!745799 () Bool)

(declare-fun array_inv!31780 (array!87118) Bool)

(assert (=> start!110490 (and (array_inv!31780 _values!1354) e!745799)))

(declare-fun b!1307042 () Bool)

(assert (=> b!1307042 (= e!745802 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!51843)

(declare-fun zeroValue!1296 () V!51843)

(declare-fun lt!585006 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22666 0))(
  ( (tuple2!22667 (_1!11344 (_ BitVec 64)) (_2!11344 V!51843)) )
))
(declare-datatypes ((List!29807 0))(
  ( (Nil!29804) (Cons!29803 (h!31012 tuple2!22666) (t!43413 List!29807)) )
))
(declare-datatypes ((ListLongMap!20323 0))(
  ( (ListLongMap!20324 (toList!10177 List!29807)) )
))
(declare-fun contains!8327 (ListLongMap!20323 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5190 (array!87116 array!87118 (_ BitVec 32) (_ BitVec 32) V!51843 V!51843 (_ BitVec 32) Int) ListLongMap!20323)

(assert (=> b!1307042 (= lt!585006 (contains!8327 (getCurrentListMap!5190 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307043 () Bool)

(declare-fun res!867621 () Bool)

(assert (=> b!1307043 (=> (not res!867621) (not e!745802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87116 (_ BitVec 32)) Bool)

(assert (=> b!1307043 (= res!867621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307044 () Bool)

(declare-fun e!745800 () Bool)

(assert (=> b!1307044 (= e!745800 tp_is_empty!35055)))

(declare-fun b!1307045 () Bool)

(declare-fun mapRes!54211 () Bool)

(assert (=> b!1307045 (= e!745799 (and e!745800 mapRes!54211))))

(declare-fun condMapEmpty!54211 () Bool)

(declare-fun mapDefault!54211 () ValueCell!16629)

(assert (=> b!1307045 (= condMapEmpty!54211 (= (arr!42039 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16629)) mapDefault!54211)))))

(declare-fun b!1307046 () Bool)

(declare-fun res!867624 () Bool)

(assert (=> b!1307046 (=> (not res!867624) (not e!745802))))

(assert (=> b!1307046 (= res!867624 (and (= (size!42589 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42588 _keys!1628) (size!42589 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54211 () Bool)

(declare-fun tp!103297 () Bool)

(assert (=> mapNonEmpty!54211 (= mapRes!54211 (and tp!103297 e!745801))))

(declare-fun mapValue!54211 () ValueCell!16629)

(declare-fun mapRest!54211 () (Array (_ BitVec 32) ValueCell!16629))

(declare-fun mapKey!54211 () (_ BitVec 32))

(assert (=> mapNonEmpty!54211 (= (arr!42039 _values!1354) (store mapRest!54211 mapKey!54211 mapValue!54211))))

(declare-fun mapIsEmpty!54211 () Bool)

(assert (=> mapIsEmpty!54211 mapRes!54211))

(assert (= (and start!110490 res!867623) b!1307046))

(assert (= (and b!1307046 res!867624) b!1307043))

(assert (= (and b!1307043 res!867621) b!1307039))

(assert (= (and b!1307039 res!867622) b!1307040))

(assert (= (and b!1307040 res!867620) b!1307042))

(assert (= (and b!1307045 condMapEmpty!54211) mapIsEmpty!54211))

(assert (= (and b!1307045 (not condMapEmpty!54211)) mapNonEmpty!54211))

(get-info :version)

(assert (= (and mapNonEmpty!54211 ((_ is ValueCellFull!16629) mapValue!54211)) b!1307041))

(assert (= (and b!1307045 ((_ is ValueCellFull!16629) mapDefault!54211)) b!1307044))

(assert (= start!110490 b!1307045))

(declare-fun m!1197865 () Bool)

(assert (=> mapNonEmpty!54211 m!1197865))

(declare-fun m!1197867 () Bool)

(assert (=> start!110490 m!1197867))

(declare-fun m!1197869 () Bool)

(assert (=> start!110490 m!1197869))

(declare-fun m!1197871 () Bool)

(assert (=> start!110490 m!1197871))

(declare-fun m!1197873 () Bool)

(assert (=> b!1307043 m!1197873))

(declare-fun m!1197875 () Bool)

(assert (=> b!1307039 m!1197875))

(declare-fun m!1197877 () Bool)

(assert (=> b!1307042 m!1197877))

(assert (=> b!1307042 m!1197877))

(declare-fun m!1197879 () Bool)

(assert (=> b!1307042 m!1197879))

(check-sat (not b!1307043) b_and!47533 (not b_next!29325) (not mapNonEmpty!54211) (not b!1307039) (not b!1307042) (not start!110490) tp_is_empty!35055)
(check-sat b_and!47533 (not b_next!29325))
