; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110772 () Bool)

(assert start!110772)

(declare-fun b_free!29383 () Bool)

(declare-fun b_next!29383 () Bool)

(assert (=> start!110772 (= b_free!29383 (not b_next!29383))))

(declare-fun tp!103470 () Bool)

(declare-fun b_and!47593 () Bool)

(assert (=> start!110772 (= tp!103470 b_and!47593)))

(declare-fun b!1309034 () Bool)

(declare-fun e!747078 () Bool)

(declare-fun tp_is_empty!35113 () Bool)

(assert (=> b!1309034 (= e!747078 tp_is_empty!35113)))

(declare-fun b!1309035 () Bool)

(declare-fun res!868577 () Bool)

(declare-fun e!747079 () Bool)

(assert (=> b!1309035 (=> (not res!868577) (not e!747079))))

(declare-datatypes ((array!87285 0))(
  ( (array!87286 (arr!42118 (Array (_ BitVec 32) (_ BitVec 64))) (size!42669 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87285)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51921 0))(
  ( (V!51922 (val!17631 Int)) )
))
(declare-datatypes ((ValueCell!16658 0))(
  ( (ValueCellFull!16658 (v!20253 V!51921)) (EmptyCell!16658) )
))
(declare-datatypes ((array!87287 0))(
  ( (array!87288 (arr!42119 (Array (_ BitVec 32) ValueCell!16658)) (size!42670 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87287)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309035 (= res!868577 (and (= (size!42670 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42669 _keys!1628) (size!42670 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54298 () Bool)

(declare-fun mapRes!54298 () Bool)

(assert (=> mapIsEmpty!54298 mapRes!54298))

(declare-fun b!1309036 () Bool)

(declare-fun res!868573 () Bool)

(assert (=> b!1309036 (=> (not res!868573) (not e!747079))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309036 (= res!868573 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42669 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309037 () Bool)

(assert (=> b!1309037 (= e!747079 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585569 () Bool)

(declare-fun minValue!1296 () V!51921)

(declare-fun zeroValue!1296 () V!51921)

(declare-datatypes ((tuple2!22730 0))(
  ( (tuple2!22731 (_1!11376 (_ BitVec 64)) (_2!11376 V!51921)) )
))
(declare-datatypes ((List!29896 0))(
  ( (Nil!29893) (Cons!29892 (h!31110 tuple2!22730) (t!43494 List!29896)) )
))
(declare-datatypes ((ListLongMap!20395 0))(
  ( (ListLongMap!20396 (toList!10213 List!29896)) )
))
(declare-fun contains!8375 (ListLongMap!20395 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5217 (array!87285 array!87287 (_ BitVec 32) (_ BitVec 32) V!51921 V!51921 (_ BitVec 32) Int) ListLongMap!20395)

(assert (=> b!1309037 (= lt!585569 (contains!8375 (getCurrentListMap!5217 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309038 () Bool)

(declare-fun e!747076 () Bool)

(assert (=> b!1309038 (= e!747076 (and e!747078 mapRes!54298))))

(declare-fun condMapEmpty!54298 () Bool)

(declare-fun mapDefault!54298 () ValueCell!16658)

(assert (=> b!1309038 (= condMapEmpty!54298 (= (arr!42119 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16658)) mapDefault!54298)))))

(declare-fun b!1309039 () Bool)

(declare-fun res!868576 () Bool)

(assert (=> b!1309039 (=> (not res!868576) (not e!747079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87285 (_ BitVec 32)) Bool)

(assert (=> b!1309039 (= res!868576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!868574 () Bool)

(assert (=> start!110772 (=> (not res!868574) (not e!747079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110772 (= res!868574 (validMask!0 mask!2040))))

(assert (=> start!110772 e!747079))

(assert (=> start!110772 tp!103470))

(declare-fun array_inv!32093 (array!87285) Bool)

(assert (=> start!110772 (array_inv!32093 _keys!1628)))

(assert (=> start!110772 true))

(assert (=> start!110772 tp_is_empty!35113))

(declare-fun array_inv!32094 (array!87287) Bool)

(assert (=> start!110772 (and (array_inv!32094 _values!1354) e!747076)))

(declare-fun mapNonEmpty!54298 () Bool)

(declare-fun tp!103471 () Bool)

(declare-fun e!747077 () Bool)

(assert (=> mapNonEmpty!54298 (= mapRes!54298 (and tp!103471 e!747077))))

(declare-fun mapKey!54298 () (_ BitVec 32))

(declare-fun mapRest!54298 () (Array (_ BitVec 32) ValueCell!16658))

(declare-fun mapValue!54298 () ValueCell!16658)

(assert (=> mapNonEmpty!54298 (= (arr!42119 _values!1354) (store mapRest!54298 mapKey!54298 mapValue!54298))))

(declare-fun b!1309040 () Bool)

(declare-fun res!868575 () Bool)

(assert (=> b!1309040 (=> (not res!868575) (not e!747079))))

(declare-datatypes ((List!29897 0))(
  ( (Nil!29894) (Cons!29893 (h!31111 (_ BitVec 64)) (t!43495 List!29897)) )
))
(declare-fun arrayNoDuplicates!0 (array!87285 (_ BitVec 32) List!29897) Bool)

(assert (=> b!1309040 (= res!868575 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29894))))

(declare-fun b!1309041 () Bool)

(assert (=> b!1309041 (= e!747077 tp_is_empty!35113)))

(assert (= (and start!110772 res!868574) b!1309035))

(assert (= (and b!1309035 res!868577) b!1309039))

(assert (= (and b!1309039 res!868576) b!1309040))

(assert (= (and b!1309040 res!868575) b!1309036))

(assert (= (and b!1309036 res!868573) b!1309037))

(assert (= (and b!1309038 condMapEmpty!54298) mapIsEmpty!54298))

(assert (= (and b!1309038 (not condMapEmpty!54298)) mapNonEmpty!54298))

(get-info :version)

(assert (= (and mapNonEmpty!54298 ((_ is ValueCellFull!16658) mapValue!54298)) b!1309041))

(assert (= (and b!1309038 ((_ is ValueCellFull!16658) mapDefault!54298)) b!1309034))

(assert (= start!110772 b!1309038))

(declare-fun m!1199927 () Bool)

(assert (=> mapNonEmpty!54298 m!1199927))

(declare-fun m!1199929 () Bool)

(assert (=> b!1309039 m!1199929))

(declare-fun m!1199931 () Bool)

(assert (=> start!110772 m!1199931))

(declare-fun m!1199933 () Bool)

(assert (=> start!110772 m!1199933))

(declare-fun m!1199935 () Bool)

(assert (=> start!110772 m!1199935))

(declare-fun m!1199937 () Bool)

(assert (=> b!1309040 m!1199937))

(declare-fun m!1199939 () Bool)

(assert (=> b!1309037 m!1199939))

(assert (=> b!1309037 m!1199939))

(declare-fun m!1199941 () Bool)

(assert (=> b!1309037 m!1199941))

(check-sat (not mapNonEmpty!54298) (not b!1309039) (not start!110772) b_and!47593 (not b_next!29383) (not b!1309037) tp_is_empty!35113 (not b!1309040))
(check-sat b_and!47593 (not b_next!29383))
