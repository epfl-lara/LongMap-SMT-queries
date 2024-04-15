; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112218 () Bool)

(assert start!112218)

(declare-fun b_free!30613 () Bool)

(declare-fun b_next!30613 () Bool)

(assert (=> start!112218 (= b_free!30613 (not b_next!30613))))

(declare-fun tp!107476 () Bool)

(declare-fun b_and!49263 () Bool)

(assert (=> start!112218 (= tp!107476 b_and!49263)))

(declare-fun b!1329139 () Bool)

(declare-fun e!757765 () Bool)

(assert (=> b!1329139 (= e!757765 (not true))))

(declare-datatypes ((V!53801 0))(
  ( (V!53802 (val!18336 Int)) )
))
(declare-datatypes ((tuple2!23666 0))(
  ( (tuple2!23667 (_1!11844 (_ BitVec 64)) (_2!11844 V!53801)) )
))
(declare-datatypes ((List!30815 0))(
  ( (Nil!30812) (Cons!30811 (h!32020 tuple2!23666) (t!44833 List!30815)) )
))
(declare-datatypes ((ListLongMap!21323 0))(
  ( (ListLongMap!21324 (toList!10677 List!30815)) )
))
(declare-fun lt!590733 () ListLongMap!21323)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8769 (ListLongMap!21323 (_ BitVec 64)) Bool)

(assert (=> b!1329139 (contains!8769 lt!590733 k0!1153)))

(declare-datatypes ((Unit!43538 0))(
  ( (Unit!43539) )
))
(declare-fun lt!590734 () Unit!43538)

(declare-fun minValue!1262 () V!53801)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!219 ((_ BitVec 64) (_ BitVec 64) V!53801 ListLongMap!21323) Unit!43538)

(assert (=> b!1329139 (= lt!590734 (lemmaInListMapAfterAddingDiffThenInBefore!219 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590733))))

(declare-datatypes ((ValueCell!17363 0))(
  ( (ValueCellFull!17363 (v!20972 V!53801)) (EmptyCell!17363) )
))
(declare-datatypes ((array!89873 0))(
  ( (array!89874 (arr!43403 (Array (_ BitVec 32) ValueCell!17363)) (size!43955 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89873)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89875 0))(
  ( (array!89876 (arr!43404 (Array (_ BitVec 32) (_ BitVec 64))) (size!43956 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89875)

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53801)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun +!4663 (ListLongMap!21323 tuple2!23666) ListLongMap!21323)

(declare-fun getCurrentListMapNoExtraKeys!6301 (array!89875 array!89873 (_ BitVec 32) (_ BitVec 32) V!53801 V!53801 (_ BitVec 32) Int) ListLongMap!21323)

(declare-fun get!21864 (ValueCell!17363 V!53801) V!53801)

(declare-fun dynLambda!3593 (Int (_ BitVec 64)) V!53801)

(assert (=> b!1329139 (= lt!590733 (+!4663 (getCurrentListMapNoExtraKeys!6301 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23667 (select (arr!43404 _keys!1590) from!1980) (get!21864 (select (arr!43403 _values!1320) from!1980) (dynLambda!3593 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329141 () Bool)

(declare-fun res!881911 () Bool)

(assert (=> b!1329141 (=> (not res!881911) (not e!757765))))

(assert (=> b!1329141 (= res!881911 (not (= (select (arr!43404 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329142 () Bool)

(declare-fun res!881909 () Bool)

(assert (=> b!1329142 (=> (not res!881909) (not e!757765))))

(assert (=> b!1329142 (= res!881909 (and (= (size!43955 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43956 _keys!1590) (size!43955 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329143 () Bool)

(declare-fun res!881908 () Bool)

(assert (=> b!1329143 (=> (not res!881908) (not e!757765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329143 (= res!881908 (validKeyInArray!0 (select (arr!43404 _keys!1590) from!1980)))))

(declare-fun b!1329144 () Bool)

(declare-fun e!757767 () Bool)

(declare-fun tp_is_empty!36523 () Bool)

(assert (=> b!1329144 (= e!757767 tp_is_empty!36523)))

(declare-fun b!1329145 () Bool)

(declare-fun e!757764 () Bool)

(declare-fun e!757766 () Bool)

(declare-fun mapRes!56458 () Bool)

(assert (=> b!1329145 (= e!757764 (and e!757766 mapRes!56458))))

(declare-fun condMapEmpty!56458 () Bool)

(declare-fun mapDefault!56458 () ValueCell!17363)

(assert (=> b!1329145 (= condMapEmpty!56458 (= (arr!43403 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17363)) mapDefault!56458)))))

(declare-fun b!1329146 () Bool)

(declare-fun res!881910 () Bool)

(assert (=> b!1329146 (=> (not res!881910) (not e!757765))))

(declare-fun getCurrentListMap!5547 (array!89875 array!89873 (_ BitVec 32) (_ BitVec 32) V!53801 V!53801 (_ BitVec 32) Int) ListLongMap!21323)

(assert (=> b!1329146 (= res!881910 (contains!8769 (getCurrentListMap!5547 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!881904 () Bool)

(assert (=> start!112218 (=> (not res!881904) (not e!757765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112218 (= res!881904 (validMask!0 mask!1998))))

(assert (=> start!112218 e!757765))

(declare-fun array_inv!32921 (array!89873) Bool)

(assert (=> start!112218 (and (array_inv!32921 _values!1320) e!757764)))

(assert (=> start!112218 true))

(declare-fun array_inv!32922 (array!89875) Bool)

(assert (=> start!112218 (array_inv!32922 _keys!1590)))

(assert (=> start!112218 tp!107476))

(assert (=> start!112218 tp_is_empty!36523))

(declare-fun b!1329140 () Bool)

(declare-fun res!881903 () Bool)

(assert (=> b!1329140 (=> (not res!881903) (not e!757765))))

(assert (=> b!1329140 (= res!881903 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43956 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329147 () Bool)

(assert (=> b!1329147 (= e!757766 tp_is_empty!36523)))

(declare-fun b!1329148 () Bool)

(declare-fun res!881906 () Bool)

(assert (=> b!1329148 (=> (not res!881906) (not e!757765))))

(declare-datatypes ((List!30816 0))(
  ( (Nil!30813) (Cons!30812 (h!32021 (_ BitVec 64)) (t!44834 List!30816)) )
))
(declare-fun arrayNoDuplicates!0 (array!89875 (_ BitVec 32) List!30816) Bool)

(assert (=> b!1329148 (= res!881906 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30813))))

(declare-fun b!1329149 () Bool)

(declare-fun res!881907 () Bool)

(assert (=> b!1329149 (=> (not res!881907) (not e!757765))))

(assert (=> b!1329149 (= res!881907 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!56458 () Bool)

(declare-fun tp!107477 () Bool)

(assert (=> mapNonEmpty!56458 (= mapRes!56458 (and tp!107477 e!757767))))

(declare-fun mapRest!56458 () (Array (_ BitVec 32) ValueCell!17363))

(declare-fun mapKey!56458 () (_ BitVec 32))

(declare-fun mapValue!56458 () ValueCell!17363)

(assert (=> mapNonEmpty!56458 (= (arr!43403 _values!1320) (store mapRest!56458 mapKey!56458 mapValue!56458))))

(declare-fun mapIsEmpty!56458 () Bool)

(assert (=> mapIsEmpty!56458 mapRes!56458))

(declare-fun b!1329150 () Bool)

(declare-fun res!881905 () Bool)

(assert (=> b!1329150 (=> (not res!881905) (not e!757765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89875 (_ BitVec 32)) Bool)

(assert (=> b!1329150 (= res!881905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112218 res!881904) b!1329142))

(assert (= (and b!1329142 res!881909) b!1329150))

(assert (= (and b!1329150 res!881905) b!1329148))

(assert (= (and b!1329148 res!881906) b!1329140))

(assert (= (and b!1329140 res!881903) b!1329146))

(assert (= (and b!1329146 res!881910) b!1329141))

(assert (= (and b!1329141 res!881911) b!1329143))

(assert (= (and b!1329143 res!881908) b!1329149))

(assert (= (and b!1329149 res!881907) b!1329139))

(assert (= (and b!1329145 condMapEmpty!56458) mapIsEmpty!56458))

(assert (= (and b!1329145 (not condMapEmpty!56458)) mapNonEmpty!56458))

(get-info :version)

(assert (= (and mapNonEmpty!56458 ((_ is ValueCellFull!17363) mapValue!56458)) b!1329144))

(assert (= (and b!1329145 ((_ is ValueCellFull!17363) mapDefault!56458)) b!1329147))

(assert (= start!112218 b!1329145))

(declare-fun b_lambda!23863 () Bool)

(assert (=> (not b_lambda!23863) (not b!1329139)))

(declare-fun t!44832 () Bool)

(declare-fun tb!11821 () Bool)

(assert (=> (and start!112218 (= defaultEntry!1323 defaultEntry!1323) t!44832) tb!11821))

(declare-fun result!24721 () Bool)

(assert (=> tb!11821 (= result!24721 tp_is_empty!36523)))

(assert (=> b!1329139 t!44832))

(declare-fun b_and!49265 () Bool)

(assert (= b_and!49263 (and (=> t!44832 result!24721) b_and!49265)))

(declare-fun m!1217475 () Bool)

(assert (=> b!1329150 m!1217475))

(declare-fun m!1217477 () Bool)

(assert (=> start!112218 m!1217477))

(declare-fun m!1217479 () Bool)

(assert (=> start!112218 m!1217479))

(declare-fun m!1217481 () Bool)

(assert (=> start!112218 m!1217481))

(declare-fun m!1217483 () Bool)

(assert (=> b!1329139 m!1217483))

(declare-fun m!1217485 () Bool)

(assert (=> b!1329139 m!1217485))

(declare-fun m!1217487 () Bool)

(assert (=> b!1329139 m!1217487))

(declare-fun m!1217489 () Bool)

(assert (=> b!1329139 m!1217489))

(assert (=> b!1329139 m!1217483))

(declare-fun m!1217491 () Bool)

(assert (=> b!1329139 m!1217491))

(assert (=> b!1329139 m!1217485))

(declare-fun m!1217493 () Bool)

(assert (=> b!1329139 m!1217493))

(assert (=> b!1329139 m!1217489))

(declare-fun m!1217495 () Bool)

(assert (=> b!1329139 m!1217495))

(declare-fun m!1217497 () Bool)

(assert (=> b!1329139 m!1217497))

(assert (=> b!1329143 m!1217497))

(assert (=> b!1329143 m!1217497))

(declare-fun m!1217499 () Bool)

(assert (=> b!1329143 m!1217499))

(assert (=> b!1329141 m!1217497))

(declare-fun m!1217501 () Bool)

(assert (=> b!1329146 m!1217501))

(assert (=> b!1329146 m!1217501))

(declare-fun m!1217503 () Bool)

(assert (=> b!1329146 m!1217503))

(declare-fun m!1217505 () Bool)

(assert (=> b!1329148 m!1217505))

(declare-fun m!1217507 () Bool)

(assert (=> mapNonEmpty!56458 m!1217507))

(check-sat (not b_next!30613) (not b_lambda!23863) tp_is_empty!36523 (not start!112218) b_and!49265 (not b!1329148) (not mapNonEmpty!56458) (not b!1329143) (not b!1329146) (not b!1329139) (not b!1329150))
(check-sat b_and!49265 (not b_next!30613))
