; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111502 () Bool)

(assert start!111502)

(declare-fun b_free!30159 () Bool)

(declare-fun b_next!30159 () Bool)

(assert (=> start!111502 (= b_free!30159 (not b_next!30159))))

(declare-fun tp!105953 () Bool)

(declare-fun b_and!48477 () Bool)

(assert (=> start!111502 (= tp!105953 b_and!48477)))

(declare-fun b!1320000 () Bool)

(declare-fun res!876092 () Bool)

(declare-fun e!753033 () Bool)

(assert (=> b!1320000 (=> (not res!876092) (not e!753033))))

(declare-datatypes ((array!88890 0))(
  ( (array!88891 (arr!42919 (Array (_ BitVec 32) (_ BitVec 64))) (size!43469 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88890)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53075 0))(
  ( (V!53076 (val!18064 Int)) )
))
(declare-fun zeroValue!1279 () V!53075)

(declare-datatypes ((ValueCell!17091 0))(
  ( (ValueCellFull!17091 (v!20694 V!53075)) (EmptyCell!17091) )
))
(declare-datatypes ((array!88892 0))(
  ( (array!88893 (arr!42920 (Array (_ BitVec 32) ValueCell!17091)) (size!43470 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88892)

(declare-fun minValue!1279 () V!53075)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23254 0))(
  ( (tuple2!23255 (_1!11638 (_ BitVec 64)) (_2!11638 V!53075)) )
))
(declare-datatypes ((List!30406 0))(
  ( (Nil!30403) (Cons!30402 (h!31611 tuple2!23254) (t!44114 List!30406)) )
))
(declare-datatypes ((ListLongMap!20911 0))(
  ( (ListLongMap!20912 (toList!10471 List!30406)) )
))
(declare-fun contains!8626 (ListLongMap!20911 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5479 (array!88890 array!88892 (_ BitVec 32) (_ BitVec 32) V!53075 V!53075 (_ BitVec 32) Int) ListLongMap!20911)

(assert (=> b!1320000 (= res!876092 (contains!8626 (getCurrentListMap!5479 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320001 () Bool)

(declare-fun e!753032 () Bool)

(declare-fun e!753030 () Bool)

(declare-fun mapRes!55616 () Bool)

(assert (=> b!1320001 (= e!753032 (and e!753030 mapRes!55616))))

(declare-fun condMapEmpty!55616 () Bool)

(declare-fun mapDefault!55616 () ValueCell!17091)

(assert (=> b!1320001 (= condMapEmpty!55616 (= (arr!42920 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17091)) mapDefault!55616)))))

(declare-fun b!1320002 () Bool)

(declare-fun e!753031 () Bool)

(declare-fun tp_is_empty!35979 () Bool)

(assert (=> b!1320002 (= e!753031 tp_is_empty!35979)))

(declare-fun b!1320003 () Bool)

(assert (=> b!1320003 (= e!753033 (not true))))

(declare-fun lt!586802 () ListLongMap!20911)

(assert (=> b!1320003 (contains!8626 lt!586802 k0!1164)))

(declare-datatypes ((Unit!43480 0))(
  ( (Unit!43481) )
))
(declare-fun lt!586800 () Unit!43480)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!126 ((_ BitVec 64) (_ BitVec 64) V!53075 ListLongMap!20911) Unit!43480)

(assert (=> b!1320003 (= lt!586800 (lemmaInListMapAfterAddingDiffThenInBefore!126 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586802))))

(declare-fun lt!586801 () ListLongMap!20911)

(assert (=> b!1320003 (contains!8626 lt!586801 k0!1164)))

(declare-fun lt!586803 () Unit!43480)

(assert (=> b!1320003 (= lt!586803 (lemmaInListMapAfterAddingDiffThenInBefore!126 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586801))))

(declare-fun +!4530 (ListLongMap!20911 tuple2!23254) ListLongMap!20911)

(assert (=> b!1320003 (= lt!586801 (+!4530 lt!586802 (tuple2!23255 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6165 (array!88890 array!88892 (_ BitVec 32) (_ BitVec 32) V!53075 V!53075 (_ BitVec 32) Int) ListLongMap!20911)

(declare-fun get!21574 (ValueCell!17091 V!53075) V!53075)

(declare-fun dynLambda!3469 (Int (_ BitVec 64)) V!53075)

(assert (=> b!1320003 (= lt!586802 (+!4530 (getCurrentListMapNoExtraKeys!6165 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23255 (select (arr!42919 _keys!1609) from!2000) (get!21574 (select (arr!42920 _values!1337) from!2000) (dynLambda!3469 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320004 () Bool)

(declare-fun res!876086 () Bool)

(assert (=> b!1320004 (=> (not res!876086) (not e!753033))))

(assert (=> b!1320004 (= res!876086 (not (= (select (arr!42919 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!876090 () Bool)

(assert (=> start!111502 (=> (not res!876090) (not e!753033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111502 (= res!876090 (validMask!0 mask!2019))))

(assert (=> start!111502 e!753033))

(declare-fun array_inv!32405 (array!88890) Bool)

(assert (=> start!111502 (array_inv!32405 _keys!1609)))

(assert (=> start!111502 true))

(assert (=> start!111502 tp_is_empty!35979))

(declare-fun array_inv!32406 (array!88892) Bool)

(assert (=> start!111502 (and (array_inv!32406 _values!1337) e!753032)))

(assert (=> start!111502 tp!105953))

(declare-fun b!1320005 () Bool)

(declare-fun res!876085 () Bool)

(assert (=> b!1320005 (=> (not res!876085) (not e!753033))))

(assert (=> b!1320005 (= res!876085 (and (= (size!43470 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43469 _keys!1609) (size!43470 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55616 () Bool)

(assert (=> mapIsEmpty!55616 mapRes!55616))

(declare-fun b!1320006 () Bool)

(declare-fun res!876091 () Bool)

(assert (=> b!1320006 (=> (not res!876091) (not e!753033))))

(declare-datatypes ((List!30407 0))(
  ( (Nil!30404) (Cons!30403 (h!31612 (_ BitVec 64)) (t!44115 List!30407)) )
))
(declare-fun arrayNoDuplicates!0 (array!88890 (_ BitVec 32) List!30407) Bool)

(assert (=> b!1320006 (= res!876091 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30404))))

(declare-fun b!1320007 () Bool)

(declare-fun res!876089 () Bool)

(assert (=> b!1320007 (=> (not res!876089) (not e!753033))))

(assert (=> b!1320007 (= res!876089 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43469 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55616 () Bool)

(declare-fun tp!105952 () Bool)

(assert (=> mapNonEmpty!55616 (= mapRes!55616 (and tp!105952 e!753031))))

(declare-fun mapRest!55616 () (Array (_ BitVec 32) ValueCell!17091))

(declare-fun mapKey!55616 () (_ BitVec 32))

(declare-fun mapValue!55616 () ValueCell!17091)

(assert (=> mapNonEmpty!55616 (= (arr!42920 _values!1337) (store mapRest!55616 mapKey!55616 mapValue!55616))))

(declare-fun b!1320008 () Bool)

(declare-fun res!876087 () Bool)

(assert (=> b!1320008 (=> (not res!876087) (not e!753033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88890 (_ BitVec 32)) Bool)

(assert (=> b!1320008 (= res!876087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320009 () Bool)

(declare-fun res!876088 () Bool)

(assert (=> b!1320009 (=> (not res!876088) (not e!753033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320009 (= res!876088 (validKeyInArray!0 (select (arr!42919 _keys!1609) from!2000)))))

(declare-fun b!1320010 () Bool)

(assert (=> b!1320010 (= e!753030 tp_is_empty!35979)))

(assert (= (and start!111502 res!876090) b!1320005))

(assert (= (and b!1320005 res!876085) b!1320008))

(assert (= (and b!1320008 res!876087) b!1320006))

(assert (= (and b!1320006 res!876091) b!1320007))

(assert (= (and b!1320007 res!876089) b!1320000))

(assert (= (and b!1320000 res!876092) b!1320004))

(assert (= (and b!1320004 res!876086) b!1320009))

(assert (= (and b!1320009 res!876088) b!1320003))

(assert (= (and b!1320001 condMapEmpty!55616) mapIsEmpty!55616))

(assert (= (and b!1320001 (not condMapEmpty!55616)) mapNonEmpty!55616))

(get-info :version)

(assert (= (and mapNonEmpty!55616 ((_ is ValueCellFull!17091) mapValue!55616)) b!1320002))

(assert (= (and b!1320001 ((_ is ValueCellFull!17091) mapDefault!55616)) b!1320010))

(assert (= start!111502 b!1320001))

(declare-fun b_lambda!23485 () Bool)

(assert (=> (not b_lambda!23485) (not b!1320003)))

(declare-fun t!44113 () Bool)

(declare-fun tb!11511 () Bool)

(assert (=> (and start!111502 (= defaultEntry!1340 defaultEntry!1340) t!44113) tb!11511))

(declare-fun result!24077 () Bool)

(assert (=> tb!11511 (= result!24077 tp_is_empty!35979)))

(assert (=> b!1320003 t!44113))

(declare-fun b_and!48479 () Bool)

(assert (= b_and!48477 (and (=> t!44113 result!24077) b_and!48479)))

(declare-fun m!1207651 () Bool)

(assert (=> b!1320000 m!1207651))

(assert (=> b!1320000 m!1207651))

(declare-fun m!1207653 () Bool)

(assert (=> b!1320000 m!1207653))

(declare-fun m!1207655 () Bool)

(assert (=> b!1320008 m!1207655))

(declare-fun m!1207657 () Bool)

(assert (=> b!1320004 m!1207657))

(declare-fun m!1207659 () Bool)

(assert (=> mapNonEmpty!55616 m!1207659))

(declare-fun m!1207661 () Bool)

(assert (=> b!1320006 m!1207661))

(declare-fun m!1207663 () Bool)

(assert (=> start!111502 m!1207663))

(declare-fun m!1207665 () Bool)

(assert (=> start!111502 m!1207665))

(declare-fun m!1207667 () Bool)

(assert (=> start!111502 m!1207667))

(declare-fun m!1207669 () Bool)

(assert (=> b!1320003 m!1207669))

(declare-fun m!1207671 () Bool)

(assert (=> b!1320003 m!1207671))

(assert (=> b!1320003 m!1207669))

(declare-fun m!1207673 () Bool)

(assert (=> b!1320003 m!1207673))

(declare-fun m!1207675 () Bool)

(assert (=> b!1320003 m!1207675))

(declare-fun m!1207677 () Bool)

(assert (=> b!1320003 m!1207677))

(declare-fun m!1207679 () Bool)

(assert (=> b!1320003 m!1207679))

(declare-fun m!1207681 () Bool)

(assert (=> b!1320003 m!1207681))

(declare-fun m!1207683 () Bool)

(assert (=> b!1320003 m!1207683))

(assert (=> b!1320003 m!1207657))

(assert (=> b!1320003 m!1207679))

(assert (=> b!1320003 m!1207671))

(declare-fun m!1207685 () Bool)

(assert (=> b!1320003 m!1207685))

(declare-fun m!1207687 () Bool)

(assert (=> b!1320003 m!1207687))

(assert (=> b!1320009 m!1207657))

(assert (=> b!1320009 m!1207657))

(declare-fun m!1207689 () Bool)

(assert (=> b!1320009 m!1207689))

(check-sat (not b!1320008) (not b!1320006) tp_is_empty!35979 b_and!48479 (not start!111502) (not b!1320009) (not b!1320003) (not b_lambda!23485) (not b_next!30159) (not mapNonEmpty!55616) (not b!1320000))
(check-sat b_and!48479 (not b_next!30159))
