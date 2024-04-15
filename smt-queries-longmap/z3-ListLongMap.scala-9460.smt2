; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112368 () Bool)

(assert start!112368)

(declare-fun b_free!30763 () Bool)

(declare-fun b_next!30763 () Bool)

(assert (=> start!112368 (= b_free!30763 (not b_next!30763))))

(declare-fun tp!107926 () Bool)

(declare-fun b_and!49563 () Bool)

(assert (=> start!112368 (= tp!107926 b_and!49563)))

(declare-fun b!1331989 () Bool)

(declare-fun res!883933 () Bool)

(declare-fun e!758891 () Bool)

(assert (=> b!1331989 (=> (not res!883933) (not e!758891))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90165 0))(
  ( (array!90166 (arr!43549 (Array (_ BitVec 32) (_ BitVec 64))) (size!44101 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90165)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1331989 (= res!883933 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44101 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331990 () Bool)

(declare-fun res!883936 () Bool)

(assert (=> b!1331990 (=> (not res!883936) (not e!758891))))

(declare-datatypes ((V!54001 0))(
  ( (V!54002 (val!18411 Int)) )
))
(declare-datatypes ((ValueCell!17438 0))(
  ( (ValueCellFull!17438 (v!21047 V!54001)) (EmptyCell!17438) )
))
(declare-datatypes ((array!90167 0))(
  ( (array!90168 (arr!43550 (Array (_ BitVec 32) ValueCell!17438)) (size!44102 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90167)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54001)

(declare-fun zeroValue!1262 () V!54001)

(declare-datatypes ((tuple2!23794 0))(
  ( (tuple2!23795 (_1!11908 (_ BitVec 64)) (_2!11908 V!54001)) )
))
(declare-datatypes ((List!30929 0))(
  ( (Nil!30926) (Cons!30925 (h!32134 tuple2!23794) (t!45097 List!30929)) )
))
(declare-datatypes ((ListLongMap!21451 0))(
  ( (ListLongMap!21452 (toList!10741 List!30929)) )
))
(declare-fun contains!8833 (ListLongMap!21451 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5601 (array!90165 array!90167 (_ BitVec 32) (_ BitVec 32) V!54001 V!54001 (_ BitVec 32) Int) ListLongMap!21451)

(assert (=> b!1331990 (= res!883936 (contains!8833 (getCurrentListMap!5601 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56683 () Bool)

(declare-fun mapRes!56683 () Bool)

(assert (=> mapIsEmpty!56683 mapRes!56683))

(declare-fun mapNonEmpty!56683 () Bool)

(declare-fun tp!107927 () Bool)

(declare-fun e!758890 () Bool)

(assert (=> mapNonEmpty!56683 (= mapRes!56683 (and tp!107927 e!758890))))

(declare-fun mapRest!56683 () (Array (_ BitVec 32) ValueCell!17438))

(declare-fun mapValue!56683 () ValueCell!17438)

(declare-fun mapKey!56683 () (_ BitVec 32))

(assert (=> mapNonEmpty!56683 (= (arr!43550 _values!1320) (store mapRest!56683 mapKey!56683 mapValue!56683))))

(declare-fun b!1331991 () Bool)

(declare-fun res!883930 () Bool)

(assert (=> b!1331991 (=> (not res!883930) (not e!758891))))

(assert (=> b!1331991 (= res!883930 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331992 () Bool)

(declare-fun res!883932 () Bool)

(assert (=> b!1331992 (=> (not res!883932) (not e!758891))))

(declare-datatypes ((List!30930 0))(
  ( (Nil!30927) (Cons!30926 (h!32135 (_ BitVec 64)) (t!45098 List!30930)) )
))
(declare-fun arrayNoDuplicates!0 (array!90165 (_ BitVec 32) List!30930) Bool)

(assert (=> b!1331992 (= res!883932 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30927))))

(declare-fun b!1331993 () Bool)

(declare-fun e!758893 () Bool)

(declare-fun tp_is_empty!36673 () Bool)

(assert (=> b!1331993 (= e!758893 tp_is_empty!36673)))

(declare-fun b!1331994 () Bool)

(assert (=> b!1331994 (= e!758890 tp_is_empty!36673)))

(declare-fun res!883935 () Bool)

(assert (=> start!112368 (=> (not res!883935) (not e!758891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112368 (= res!883935 (validMask!0 mask!1998))))

(assert (=> start!112368 e!758891))

(declare-fun e!758892 () Bool)

(declare-fun array_inv!33031 (array!90167) Bool)

(assert (=> start!112368 (and (array_inv!33031 _values!1320) e!758892)))

(assert (=> start!112368 true))

(declare-fun array_inv!33032 (array!90165) Bool)

(assert (=> start!112368 (array_inv!33032 _keys!1590)))

(assert (=> start!112368 tp!107926))

(assert (=> start!112368 tp_is_empty!36673))

(declare-fun b!1331995 () Bool)

(declare-fun res!883929 () Bool)

(assert (=> b!1331995 (=> (not res!883929) (not e!758891))))

(assert (=> b!1331995 (= res!883929 (and (= (size!44102 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44101 _keys!1590) (size!44102 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331996 () Bool)

(declare-fun res!883934 () Bool)

(assert (=> b!1331996 (=> (not res!883934) (not e!758891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331996 (= res!883934 (validKeyInArray!0 (select (arr!43549 _keys!1590) from!1980)))))

(declare-fun b!1331997 () Bool)

(assert (=> b!1331997 (= e!758891 (not true))))

(declare-fun lt!591646 () ListLongMap!21451)

(declare-fun +!4720 (ListLongMap!21451 tuple2!23794) ListLongMap!21451)

(assert (=> b!1331997 (contains!8833 (+!4720 lt!591646 (tuple2!23795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43652 0))(
  ( (Unit!43653) )
))
(declare-fun lt!591643 () Unit!43652)

(declare-fun addStillContains!1174 (ListLongMap!21451 (_ BitVec 64) V!54001 (_ BitVec 64)) Unit!43652)

(assert (=> b!1331997 (= lt!591643 (addStillContains!1174 lt!591646 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1331997 (contains!8833 lt!591646 k0!1153)))

(declare-fun lt!591641 () V!54001)

(declare-fun lt!591645 () Unit!43652)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!276 ((_ BitVec 64) (_ BitVec 64) V!54001 ListLongMap!21451) Unit!43652)

(assert (=> b!1331997 (= lt!591645 (lemmaInListMapAfterAddingDiffThenInBefore!276 k0!1153 (select (arr!43549 _keys!1590) from!1980) lt!591641 lt!591646))))

(declare-fun lt!591644 () ListLongMap!21451)

(assert (=> b!1331997 (contains!8833 lt!591644 k0!1153)))

(declare-fun lt!591642 () Unit!43652)

(assert (=> b!1331997 (= lt!591642 (lemmaInListMapAfterAddingDiffThenInBefore!276 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591644))))

(assert (=> b!1331997 (= lt!591644 (+!4720 lt!591646 (tuple2!23795 (select (arr!43549 _keys!1590) from!1980) lt!591641)))))

(declare-fun get!21971 (ValueCell!17438 V!54001) V!54001)

(declare-fun dynLambda!3650 (Int (_ BitVec 64)) V!54001)

(assert (=> b!1331997 (= lt!591641 (get!21971 (select (arr!43550 _values!1320) from!1980) (dynLambda!3650 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6358 (array!90165 array!90167 (_ BitVec 32) (_ BitVec 32) V!54001 V!54001 (_ BitVec 32) Int) ListLongMap!21451)

(assert (=> b!1331997 (= lt!591646 (getCurrentListMapNoExtraKeys!6358 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331998 () Bool)

(assert (=> b!1331998 (= e!758892 (and e!758893 mapRes!56683))))

(declare-fun condMapEmpty!56683 () Bool)

(declare-fun mapDefault!56683 () ValueCell!17438)

(assert (=> b!1331998 (= condMapEmpty!56683 (= (arr!43550 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17438)) mapDefault!56683)))))

(declare-fun b!1331999 () Bool)

(declare-fun res!883931 () Bool)

(assert (=> b!1331999 (=> (not res!883931) (not e!758891))))

(assert (=> b!1331999 (= res!883931 (not (= (select (arr!43549 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1332000 () Bool)

(declare-fun res!883928 () Bool)

(assert (=> b!1332000 (=> (not res!883928) (not e!758891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90165 (_ BitVec 32)) Bool)

(assert (=> b!1332000 (= res!883928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112368 res!883935) b!1331995))

(assert (= (and b!1331995 res!883929) b!1332000))

(assert (= (and b!1332000 res!883928) b!1331992))

(assert (= (and b!1331992 res!883932) b!1331989))

(assert (= (and b!1331989 res!883933) b!1331990))

(assert (= (and b!1331990 res!883936) b!1331999))

(assert (= (and b!1331999 res!883931) b!1331996))

(assert (= (and b!1331996 res!883934) b!1331991))

(assert (= (and b!1331991 res!883930) b!1331997))

(assert (= (and b!1331998 condMapEmpty!56683) mapIsEmpty!56683))

(assert (= (and b!1331998 (not condMapEmpty!56683)) mapNonEmpty!56683))

(get-info :version)

(assert (= (and mapNonEmpty!56683 ((_ is ValueCellFull!17438) mapValue!56683)) b!1331994))

(assert (= (and b!1331998 ((_ is ValueCellFull!17438) mapDefault!56683)) b!1331993))

(assert (= start!112368 b!1331998))

(declare-fun b_lambda!24013 () Bool)

(assert (=> (not b_lambda!24013) (not b!1331997)))

(declare-fun t!45096 () Bool)

(declare-fun tb!11971 () Bool)

(assert (=> (and start!112368 (= defaultEntry!1323 defaultEntry!1323) t!45096) tb!11971))

(declare-fun result!25021 () Bool)

(assert (=> tb!11971 (= result!25021 tp_is_empty!36673)))

(assert (=> b!1331997 t!45096))

(declare-fun b_and!49565 () Bool)

(assert (= b_and!49563 (and (=> t!45096 result!25021) b_and!49565)))

(declare-fun m!1220295 () Bool)

(assert (=> b!1331990 m!1220295))

(assert (=> b!1331990 m!1220295))

(declare-fun m!1220297 () Bool)

(assert (=> b!1331990 m!1220297))

(declare-fun m!1220299 () Bool)

(assert (=> b!1331999 m!1220299))

(declare-fun m!1220301 () Bool)

(assert (=> b!1331997 m!1220301))

(declare-fun m!1220303 () Bool)

(assert (=> b!1331997 m!1220303))

(declare-fun m!1220305 () Bool)

(assert (=> b!1331997 m!1220305))

(declare-fun m!1220307 () Bool)

(assert (=> b!1331997 m!1220307))

(declare-fun m!1220309 () Bool)

(assert (=> b!1331997 m!1220309))

(declare-fun m!1220311 () Bool)

(assert (=> b!1331997 m!1220311))

(declare-fun m!1220313 () Bool)

(assert (=> b!1331997 m!1220313))

(assert (=> b!1331997 m!1220299))

(assert (=> b!1331997 m!1220307))

(declare-fun m!1220315 () Bool)

(assert (=> b!1331997 m!1220315))

(assert (=> b!1331997 m!1220313))

(assert (=> b!1331997 m!1220303))

(declare-fun m!1220317 () Bool)

(assert (=> b!1331997 m!1220317))

(assert (=> b!1331997 m!1220299))

(declare-fun m!1220319 () Bool)

(assert (=> b!1331997 m!1220319))

(declare-fun m!1220321 () Bool)

(assert (=> b!1331997 m!1220321))

(declare-fun m!1220323 () Bool)

(assert (=> b!1331997 m!1220323))

(declare-fun m!1220325 () Bool)

(assert (=> b!1332000 m!1220325))

(declare-fun m!1220327 () Bool)

(assert (=> mapNonEmpty!56683 m!1220327))

(assert (=> b!1331996 m!1220299))

(assert (=> b!1331996 m!1220299))

(declare-fun m!1220329 () Bool)

(assert (=> b!1331996 m!1220329))

(declare-fun m!1220331 () Bool)

(assert (=> b!1331992 m!1220331))

(declare-fun m!1220333 () Bool)

(assert (=> start!112368 m!1220333))

(declare-fun m!1220335 () Bool)

(assert (=> start!112368 m!1220335))

(declare-fun m!1220337 () Bool)

(assert (=> start!112368 m!1220337))

(check-sat (not start!112368) (not b!1331992) b_and!49565 (not b_lambda!24013) (not b!1332000) (not mapNonEmpty!56683) (not b!1331996) (not b!1331990) (not b!1331997) (not b_next!30763) tp_is_empty!36673)
(check-sat b_and!49565 (not b_next!30763))
