; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113674 () Bool)

(assert start!113674)

(declare-fun b_free!31501 () Bool)

(declare-fun b_next!31501 () Bool)

(assert (=> start!113674 (= b_free!31501 (not b_next!31501))))

(declare-fun tp!110307 () Bool)

(declare-fun b_and!50791 () Bool)

(assert (=> start!113674 (= tp!110307 b_and!50791)))

(declare-fun res!894176 () Bool)

(declare-fun e!767160 () Bool)

(assert (=> start!113674 (=> (not res!894176) (not e!767160))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113674 (= res!894176 (validMask!0 mask!1977))))

(assert (=> start!113674 e!767160))

(declare-fun tp_is_empty!37501 () Bool)

(assert (=> start!113674 tp_is_empty!37501))

(assert (=> start!113674 true))

(declare-datatypes ((array!91945 0))(
  ( (array!91946 (arr!44424 (Array (_ BitVec 32) (_ BitVec 64))) (size!44975 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91945)

(declare-fun array_inv!33729 (array!91945) Bool)

(assert (=> start!113674 (array_inv!33729 _keys!1571)))

(declare-datatypes ((V!55105 0))(
  ( (V!55106 (val!18825 Int)) )
))
(declare-datatypes ((ValueCell!17852 0))(
  ( (ValueCellFull!17852 (v!21468 V!55105)) (EmptyCell!17852) )
))
(declare-datatypes ((array!91947 0))(
  ( (array!91948 (arr!44425 (Array (_ BitVec 32) ValueCell!17852)) (size!44976 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91947)

(declare-fun e!767159 () Bool)

(declare-fun array_inv!33730 (array!91947) Bool)

(assert (=> start!113674 (and (array_inv!33730 _values!1303) e!767159)))

(assert (=> start!113674 tp!110307))

(declare-fun b!1348088 () Bool)

(declare-fun res!894179 () Bool)

(assert (=> b!1348088 (=> (not res!894179) (not e!767160))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348088 (= res!894179 (validKeyInArray!0 (select (arr!44424 _keys!1571) from!1960)))))

(declare-fun b!1348089 () Bool)

(declare-fun res!894180 () Bool)

(assert (=> b!1348089 (=> (not res!894180) (not e!767160))))

(declare-fun minValue!1245 () V!55105)

(declare-fun zeroValue!1245 () V!55105)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24314 0))(
  ( (tuple2!24315 (_1!12168 (_ BitVec 64)) (_2!12168 V!55105)) )
))
(declare-datatypes ((List!31455 0))(
  ( (Nil!31452) (Cons!31451 (h!32669 tuple2!24314) (t!46037 List!31455)) )
))
(declare-datatypes ((ListLongMap!21979 0))(
  ( (ListLongMap!21980 (toList!11005 List!31455)) )
))
(declare-fun contains!9193 (ListLongMap!21979 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5945 (array!91945 array!91947 (_ BitVec 32) (_ BitVec 32) V!55105 V!55105 (_ BitVec 32) Int) ListLongMap!21979)

(assert (=> b!1348089 (= res!894180 (contains!9193 (getCurrentListMap!5945 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348090 () Bool)

(declare-fun e!767158 () Bool)

(assert (=> b!1348090 (= e!767158 tp_is_empty!37501)))

(declare-fun b!1348091 () Bool)

(declare-fun res!894174 () Bool)

(assert (=> b!1348091 (=> (not res!894174) (not e!767160))))

(assert (=> b!1348091 (= res!894174 (and (= (size!44976 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44975 _keys!1571) (size!44976 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57958 () Bool)

(declare-fun mapRes!57958 () Bool)

(declare-fun tp!110308 () Bool)

(assert (=> mapNonEmpty!57958 (= mapRes!57958 (and tp!110308 e!767158))))

(declare-fun mapRest!57958 () (Array (_ BitVec 32) ValueCell!17852))

(declare-fun mapValue!57958 () ValueCell!17852)

(declare-fun mapKey!57958 () (_ BitVec 32))

(assert (=> mapNonEmpty!57958 (= (arr!44425 _values!1303) (store mapRest!57958 mapKey!57958 mapValue!57958))))

(declare-fun b!1348092 () Bool)

(assert (=> b!1348092 (= e!767160 false)))

(declare-fun lt!596021 () ListLongMap!21979)

(declare-fun getCurrentListMapNoExtraKeys!6521 (array!91945 array!91947 (_ BitVec 32) (_ BitVec 32) V!55105 V!55105 (_ BitVec 32) Int) ListLongMap!21979)

(assert (=> b!1348092 (= lt!596021 (getCurrentListMapNoExtraKeys!6521 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1348093 () Bool)

(declare-fun res!894182 () Bool)

(assert (=> b!1348093 (=> (not res!894182) (not e!767160))))

(assert (=> b!1348093 (= res!894182 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44975 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348094 () Bool)

(declare-fun res!894178 () Bool)

(assert (=> b!1348094 (=> (not res!894178) (not e!767160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91945 (_ BitVec 32)) Bool)

(assert (=> b!1348094 (= res!894178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348095 () Bool)

(declare-fun res!894175 () Bool)

(assert (=> b!1348095 (=> (not res!894175) (not e!767160))))

(assert (=> b!1348095 (= res!894175 (not (= (select (arr!44424 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57958 () Bool)

(assert (=> mapIsEmpty!57958 mapRes!57958))

(declare-fun b!1348096 () Bool)

(declare-fun res!894181 () Bool)

(assert (=> b!1348096 (=> (not res!894181) (not e!767160))))

(declare-datatypes ((List!31456 0))(
  ( (Nil!31453) (Cons!31452 (h!32670 (_ BitVec 64)) (t!46038 List!31456)) )
))
(declare-fun arrayNoDuplicates!0 (array!91945 (_ BitVec 32) List!31456) Bool)

(assert (=> b!1348096 (= res!894181 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31453))))

(declare-fun b!1348097 () Bool)

(declare-fun e!767161 () Bool)

(assert (=> b!1348097 (= e!767161 tp_is_empty!37501)))

(declare-fun b!1348098 () Bool)

(assert (=> b!1348098 (= e!767159 (and e!767161 mapRes!57958))))

(declare-fun condMapEmpty!57958 () Bool)

(declare-fun mapDefault!57958 () ValueCell!17852)

(assert (=> b!1348098 (= condMapEmpty!57958 (= (arr!44425 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17852)) mapDefault!57958)))))

(declare-fun b!1348099 () Bool)

(declare-fun res!894177 () Bool)

(assert (=> b!1348099 (=> (not res!894177) (not e!767160))))

(assert (=> b!1348099 (= res!894177 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!113674 res!894176) b!1348091))

(assert (= (and b!1348091 res!894174) b!1348094))

(assert (= (and b!1348094 res!894178) b!1348096))

(assert (= (and b!1348096 res!894181) b!1348093))

(assert (= (and b!1348093 res!894182) b!1348089))

(assert (= (and b!1348089 res!894180) b!1348095))

(assert (= (and b!1348095 res!894175) b!1348088))

(assert (= (and b!1348088 res!894179) b!1348099))

(assert (= (and b!1348099 res!894177) b!1348092))

(assert (= (and b!1348098 condMapEmpty!57958) mapIsEmpty!57958))

(assert (= (and b!1348098 (not condMapEmpty!57958)) mapNonEmpty!57958))

(get-info :version)

(assert (= (and mapNonEmpty!57958 ((_ is ValueCellFull!17852) mapValue!57958)) b!1348090))

(assert (= (and b!1348098 ((_ is ValueCellFull!17852) mapDefault!57958)) b!1348097))

(assert (= start!113674 b!1348098))

(declare-fun m!1235409 () Bool)

(assert (=> b!1348096 m!1235409))

(declare-fun m!1235411 () Bool)

(assert (=> start!113674 m!1235411))

(declare-fun m!1235413 () Bool)

(assert (=> start!113674 m!1235413))

(declare-fun m!1235415 () Bool)

(assert (=> start!113674 m!1235415))

(declare-fun m!1235417 () Bool)

(assert (=> mapNonEmpty!57958 m!1235417))

(declare-fun m!1235419 () Bool)

(assert (=> b!1348088 m!1235419))

(assert (=> b!1348088 m!1235419))

(declare-fun m!1235421 () Bool)

(assert (=> b!1348088 m!1235421))

(declare-fun m!1235423 () Bool)

(assert (=> b!1348092 m!1235423))

(declare-fun m!1235425 () Bool)

(assert (=> b!1348089 m!1235425))

(assert (=> b!1348089 m!1235425))

(declare-fun m!1235427 () Bool)

(assert (=> b!1348089 m!1235427))

(declare-fun m!1235429 () Bool)

(assert (=> b!1348094 m!1235429))

(assert (=> b!1348095 m!1235419))

(check-sat (not b!1348088) (not b!1348089) (not b!1348094) (not b!1348096) (not mapNonEmpty!57958) b_and!50791 tp_is_empty!37501 (not start!113674) (not b!1348092) (not b_next!31501))
(check-sat b_and!50791 (not b_next!31501))
