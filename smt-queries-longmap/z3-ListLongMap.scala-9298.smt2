; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111138 () Bool)

(assert start!111138)

(declare-fun b_free!29973 () Bool)

(declare-fun b_next!29973 () Bool)

(assert (=> start!111138 (= b_free!29973 (not b_next!29973))))

(declare-fun tp!105241 () Bool)

(declare-fun b_and!48181 () Bool)

(assert (=> start!111138 (= tp!105241 b_and!48181)))

(declare-fun mapIsEmpty!55183 () Bool)

(declare-fun mapRes!55183 () Bool)

(assert (=> mapIsEmpty!55183 mapRes!55183))

(declare-fun b!1315886 () Bool)

(declare-fun res!873554 () Bool)

(declare-fun e!750658 () Bool)

(assert (=> b!1315886 (=> (not res!873554) (not e!750658))))

(declare-datatypes ((array!88366 0))(
  ( (array!88367 (arr!42663 (Array (_ BitVec 32) (_ BitVec 64))) (size!43213 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88366)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88366 (_ BitVec 32)) Bool)

(assert (=> b!1315886 (= res!873554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315887 () Bool)

(declare-fun e!750661 () Bool)

(declare-fun e!750659 () Bool)

(assert (=> b!1315887 (= e!750661 (and e!750659 mapRes!55183))))

(declare-fun condMapEmpty!55183 () Bool)

(declare-datatypes ((V!52707 0))(
  ( (V!52708 (val!17926 Int)) )
))
(declare-datatypes ((ValueCell!16953 0))(
  ( (ValueCellFull!16953 (v!20553 V!52707)) (EmptyCell!16953) )
))
(declare-datatypes ((array!88368 0))(
  ( (array!88369 (arr!42664 (Array (_ BitVec 32) ValueCell!16953)) (size!43214 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88368)

(declare-fun mapDefault!55183 () ValueCell!16953)

(assert (=> b!1315887 (= condMapEmpty!55183 (= (arr!42664 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16953)) mapDefault!55183)))))

(declare-fun b!1315888 () Bool)

(declare-fun tp_is_empty!35703 () Bool)

(assert (=> b!1315888 (= e!750659 tp_is_empty!35703)))

(declare-fun res!873552 () Bool)

(assert (=> start!111138 (=> (not res!873552) (not e!750658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111138 (= res!873552 (validMask!0 mask!2040))))

(assert (=> start!111138 e!750658))

(assert (=> start!111138 tp!105241))

(declare-fun array_inv!32221 (array!88366) Bool)

(assert (=> start!111138 (array_inv!32221 _keys!1628)))

(assert (=> start!111138 true))

(assert (=> start!111138 tp_is_empty!35703))

(declare-fun array_inv!32222 (array!88368) Bool)

(assert (=> start!111138 (and (array_inv!32222 _values!1354) e!750661)))

(declare-fun b!1315889 () Bool)

(declare-fun res!873551 () Bool)

(assert (=> b!1315889 (=> (not res!873551) (not e!750658))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315889 (= res!873551 (and (= (size!43214 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43213 _keys!1628) (size!43214 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315890 () Bool)

(declare-fun res!873553 () Bool)

(assert (=> b!1315890 (=> (not res!873553) (not e!750658))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315890 (= res!873553 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43213 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315891 () Bool)

(declare-fun res!873555 () Bool)

(assert (=> b!1315891 (=> (not res!873555) (not e!750658))))

(declare-datatypes ((List!30266 0))(
  ( (Nil!30263) (Cons!30262 (h!31471 (_ BitVec 64)) (t!43872 List!30266)) )
))
(declare-fun arrayNoDuplicates!0 (array!88366 (_ BitVec 32) List!30266) Bool)

(assert (=> b!1315891 (= res!873555 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30263))))

(declare-fun b!1315892 () Bool)

(declare-fun e!750662 () Bool)

(assert (=> b!1315892 (= e!750662 tp_is_empty!35703)))

(declare-fun b!1315893 () Bool)

(assert (=> b!1315893 (= e!750658 false)))

(declare-fun minValue!1296 () V!52707)

(declare-fun zeroValue!1296 () V!52707)

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585969 () Bool)

(declare-datatypes ((tuple2!23128 0))(
  ( (tuple2!23129 (_1!11575 (_ BitVec 64)) (_2!11575 V!52707)) )
))
(declare-datatypes ((List!30267 0))(
  ( (Nil!30264) (Cons!30263 (h!31472 tuple2!23128) (t!43873 List!30267)) )
))
(declare-datatypes ((ListLongMap!20785 0))(
  ( (ListLongMap!20786 (toList!10408 List!30267)) )
))
(declare-fun contains!8558 (ListLongMap!20785 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5421 (array!88366 array!88368 (_ BitVec 32) (_ BitVec 32) V!52707 V!52707 (_ BitVec 32) Int) ListLongMap!20785)

(assert (=> b!1315893 (= lt!585969 (contains!8558 (getCurrentListMap!5421 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!55183 () Bool)

(declare-fun tp!105240 () Bool)

(assert (=> mapNonEmpty!55183 (= mapRes!55183 (and tp!105240 e!750662))))

(declare-fun mapKey!55183 () (_ BitVec 32))

(declare-fun mapRest!55183 () (Array (_ BitVec 32) ValueCell!16953))

(declare-fun mapValue!55183 () ValueCell!16953)

(assert (=> mapNonEmpty!55183 (= (arr!42664 _values!1354) (store mapRest!55183 mapKey!55183 mapValue!55183))))

(assert (= (and start!111138 res!873552) b!1315889))

(assert (= (and b!1315889 res!873551) b!1315886))

(assert (= (and b!1315886 res!873554) b!1315891))

(assert (= (and b!1315891 res!873555) b!1315890))

(assert (= (and b!1315890 res!873553) b!1315893))

(assert (= (and b!1315887 condMapEmpty!55183) mapIsEmpty!55183))

(assert (= (and b!1315887 (not condMapEmpty!55183)) mapNonEmpty!55183))

(get-info :version)

(assert (= (and mapNonEmpty!55183 ((_ is ValueCellFull!16953) mapValue!55183)) b!1315892))

(assert (= (and b!1315887 ((_ is ValueCellFull!16953) mapDefault!55183)) b!1315888))

(assert (= start!111138 b!1315887))

(declare-fun m!1203931 () Bool)

(assert (=> b!1315886 m!1203931))

(declare-fun m!1203933 () Bool)

(assert (=> start!111138 m!1203933))

(declare-fun m!1203935 () Bool)

(assert (=> start!111138 m!1203935))

(declare-fun m!1203937 () Bool)

(assert (=> start!111138 m!1203937))

(declare-fun m!1203939 () Bool)

(assert (=> b!1315891 m!1203939))

(declare-fun m!1203941 () Bool)

(assert (=> mapNonEmpty!55183 m!1203941))

(declare-fun m!1203943 () Bool)

(assert (=> b!1315893 m!1203943))

(assert (=> b!1315893 m!1203943))

(declare-fun m!1203945 () Bool)

(assert (=> b!1315893 m!1203945))

(check-sat (not b!1315891) b_and!48181 tp_is_empty!35703 (not b!1315886) (not start!111138) (not b_next!29973) (not b!1315893) (not mapNonEmpty!55183))
(check-sat b_and!48181 (not b_next!29973))
