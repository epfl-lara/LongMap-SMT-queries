; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112328 () Bool)

(assert start!112328)

(declare-fun b_free!30723 () Bool)

(declare-fun b_next!30723 () Bool)

(assert (=> start!112328 (= b_free!30723 (not b_next!30723))))

(declare-fun tp!107806 () Bool)

(declare-fun b_and!49501 () Bool)

(assert (=> start!112328 (= tp!107806 b_and!49501)))

(declare-fun b!1331299 () Bool)

(declare-fun e!758626 () Bool)

(declare-fun e!758622 () Bool)

(declare-fun mapRes!56623 () Bool)

(assert (=> b!1331299 (= e!758626 (and e!758622 mapRes!56623))))

(declare-fun condMapEmpty!56623 () Bool)

(declare-datatypes ((V!53947 0))(
  ( (V!53948 (val!18391 Int)) )
))
(declare-datatypes ((ValueCell!17418 0))(
  ( (ValueCellFull!17418 (v!21028 V!53947)) (EmptyCell!17418) )
))
(declare-datatypes ((array!90146 0))(
  ( (array!90147 (arr!43539 (Array (_ BitVec 32) ValueCell!17418)) (size!44089 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90146)

(declare-fun mapDefault!56623 () ValueCell!17418)

(assert (=> b!1331299 (= condMapEmpty!56623 (= (arr!43539 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17418)) mapDefault!56623)))))

(declare-fun mapNonEmpty!56623 () Bool)

(declare-fun tp!107805 () Bool)

(declare-fun e!758625 () Bool)

(assert (=> mapNonEmpty!56623 (= mapRes!56623 (and tp!107805 e!758625))))

(declare-fun mapRest!56623 () (Array (_ BitVec 32) ValueCell!17418))

(declare-fun mapValue!56623 () ValueCell!17418)

(declare-fun mapKey!56623 () (_ BitVec 32))

(assert (=> mapNonEmpty!56623 (= (arr!43539 _values!1320) (store mapRest!56623 mapKey!56623 mapValue!56623))))

(declare-fun b!1331300 () Bool)

(declare-fun tp_is_empty!36633 () Bool)

(assert (=> b!1331300 (= e!758625 tp_is_empty!36633)))

(declare-fun b!1331301 () Bool)

(assert (=> b!1331301 (= e!758622 tp_is_empty!36633)))

(declare-fun b!1331302 () Bool)

(declare-fun res!883421 () Bool)

(declare-fun e!758624 () Bool)

(assert (=> b!1331302 (=> (not res!883421) (not e!758624))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90148 0))(
  ( (array!90149 (arr!43540 (Array (_ BitVec 32) (_ BitVec 64))) (size!44090 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90148)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1331302 (= res!883421 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44090 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331303 () Bool)

(declare-fun res!883418 () Bool)

(assert (=> b!1331303 (=> (not res!883418) (not e!758624))))

(declare-datatypes ((List!30836 0))(
  ( (Nil!30833) (Cons!30832 (h!32041 (_ BitVec 64)) (t!44972 List!30836)) )
))
(declare-fun arrayNoDuplicates!0 (array!90148 (_ BitVec 32) List!30836) Bool)

(assert (=> b!1331303 (= res!883418 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30833))))

(declare-fun b!1331304 () Bool)

(assert (=> b!1331304 (= e!758624 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!23686 0))(
  ( (tuple2!23687 (_1!11854 (_ BitVec 64)) (_2!11854 V!53947)) )
))
(declare-datatypes ((List!30837 0))(
  ( (Nil!30834) (Cons!30833 (h!32042 tuple2!23686) (t!44973 List!30837)) )
))
(declare-datatypes ((ListLongMap!21343 0))(
  ( (ListLongMap!21344 (toList!10687 List!30837)) )
))
(declare-fun lt!591481 () ListLongMap!21343)

(declare-fun contains!8851 (ListLongMap!21343 (_ BitVec 64)) Bool)

(assert (=> b!1331304 (contains!8851 lt!591481 k0!1153)))

(declare-fun lt!591483 () V!53947)

(declare-datatypes ((Unit!43813 0))(
  ( (Unit!43814) )
))
(declare-fun lt!591480 () Unit!43813)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!269 ((_ BitVec 64) (_ BitVec 64) V!53947 ListLongMap!21343) Unit!43813)

(assert (=> b!1331304 (= lt!591480 (lemmaInListMapAfterAddingDiffThenInBefore!269 k0!1153 (select (arr!43540 _keys!1590) from!1980) lt!591483 lt!591481))))

(declare-fun lt!591484 () ListLongMap!21343)

(assert (=> b!1331304 (contains!8851 lt!591484 k0!1153)))

(declare-fun lt!591482 () Unit!43813)

(declare-fun minValue!1262 () V!53947)

(assert (=> b!1331304 (= lt!591482 (lemmaInListMapAfterAddingDiffThenInBefore!269 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591484))))

(declare-fun +!4682 (ListLongMap!21343 tuple2!23686) ListLongMap!21343)

(assert (=> b!1331304 (= lt!591484 (+!4682 lt!591481 (tuple2!23687 (select (arr!43540 _keys!1590) from!1980) lt!591483)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21952 (ValueCell!17418 V!53947) V!53947)

(declare-fun dynLambda!3621 (Int (_ BitVec 64)) V!53947)

(assert (=> b!1331304 (= lt!591483 (get!21952 (select (arr!43539 _values!1320) from!1980) (dynLambda!3621 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53947)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6320 (array!90148 array!90146 (_ BitVec 32) (_ BitVec 32) V!53947 V!53947 (_ BitVec 32) Int) ListLongMap!21343)

(assert (=> b!1331304 (= lt!591481 (getCurrentListMapNoExtraKeys!6320 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331305 () Bool)

(declare-fun res!883419 () Bool)

(assert (=> b!1331305 (=> (not res!883419) (not e!758624))))

(declare-fun getCurrentListMap!5672 (array!90148 array!90146 (_ BitVec 32) (_ BitVec 32) V!53947 V!53947 (_ BitVec 32) Int) ListLongMap!21343)

(assert (=> b!1331305 (= res!883419 (contains!8851 (getCurrentListMap!5672 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!883420 () Bool)

(assert (=> start!112328 (=> (not res!883420) (not e!758624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112328 (= res!883420 (validMask!0 mask!1998))))

(assert (=> start!112328 e!758624))

(declare-fun array_inv!32839 (array!90146) Bool)

(assert (=> start!112328 (and (array_inv!32839 _values!1320) e!758626)))

(assert (=> start!112328 true))

(declare-fun array_inv!32840 (array!90148) Bool)

(assert (=> start!112328 (array_inv!32840 _keys!1590)))

(assert (=> start!112328 tp!107806))

(assert (=> start!112328 tp_is_empty!36633))

(declare-fun b!1331306 () Bool)

(declare-fun res!883425 () Bool)

(assert (=> b!1331306 (=> (not res!883425) (not e!758624))))

(assert (=> b!1331306 (= res!883425 (not (= (select (arr!43540 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331307 () Bool)

(declare-fun res!883424 () Bool)

(assert (=> b!1331307 (=> (not res!883424) (not e!758624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90148 (_ BitVec 32)) Bool)

(assert (=> b!1331307 (= res!883424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331308 () Bool)

(declare-fun res!883422 () Bool)

(assert (=> b!1331308 (=> (not res!883422) (not e!758624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331308 (= res!883422 (validKeyInArray!0 (select (arr!43540 _keys!1590) from!1980)))))

(declare-fun b!1331309 () Bool)

(declare-fun res!883417 () Bool)

(assert (=> b!1331309 (=> (not res!883417) (not e!758624))))

(assert (=> b!1331309 (= res!883417 (and (= (size!44089 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44090 _keys!1590) (size!44089 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56623 () Bool)

(assert (=> mapIsEmpty!56623 mapRes!56623))

(declare-fun b!1331310 () Bool)

(declare-fun res!883423 () Bool)

(assert (=> b!1331310 (=> (not res!883423) (not e!758624))))

(assert (=> b!1331310 (= res!883423 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!112328 res!883420) b!1331309))

(assert (= (and b!1331309 res!883417) b!1331307))

(assert (= (and b!1331307 res!883424) b!1331303))

(assert (= (and b!1331303 res!883418) b!1331302))

(assert (= (and b!1331302 res!883421) b!1331305))

(assert (= (and b!1331305 res!883419) b!1331306))

(assert (= (and b!1331306 res!883425) b!1331308))

(assert (= (and b!1331308 res!883422) b!1331310))

(assert (= (and b!1331310 res!883423) b!1331304))

(assert (= (and b!1331299 condMapEmpty!56623) mapIsEmpty!56623))

(assert (= (and b!1331299 (not condMapEmpty!56623)) mapNonEmpty!56623))

(get-info :version)

(assert (= (and mapNonEmpty!56623 ((_ is ValueCellFull!17418) mapValue!56623)) b!1331300))

(assert (= (and b!1331299 ((_ is ValueCellFull!17418) mapDefault!56623)) b!1331301))

(assert (= start!112328 b!1331299))

(declare-fun b_lambda!23983 () Bool)

(assert (=> (not b_lambda!23983) (not b!1331304)))

(declare-fun t!44971 () Bool)

(declare-fun tb!11939 () Bool)

(assert (=> (and start!112328 (= defaultEntry!1323 defaultEntry!1323) t!44971) tb!11939))

(declare-fun result!24949 () Bool)

(assert (=> tb!11939 (= result!24949 tp_is_empty!36633)))

(assert (=> b!1331304 t!44971))

(declare-fun b_and!49503 () Bool)

(assert (= b_and!49501 (and (=> t!44971 result!24949) b_and!49503)))

(declare-fun m!1219961 () Bool)

(assert (=> b!1331306 m!1219961))

(declare-fun m!1219963 () Bool)

(assert (=> b!1331304 m!1219963))

(declare-fun m!1219965 () Bool)

(assert (=> b!1331304 m!1219965))

(assert (=> b!1331304 m!1219963))

(declare-fun m!1219967 () Bool)

(assert (=> b!1331304 m!1219967))

(declare-fun m!1219969 () Bool)

(assert (=> b!1331304 m!1219969))

(declare-fun m!1219971 () Bool)

(assert (=> b!1331304 m!1219971))

(declare-fun m!1219973 () Bool)

(assert (=> b!1331304 m!1219973))

(assert (=> b!1331304 m!1219961))

(assert (=> b!1331304 m!1219961))

(declare-fun m!1219975 () Bool)

(assert (=> b!1331304 m!1219975))

(declare-fun m!1219977 () Bool)

(assert (=> b!1331304 m!1219977))

(assert (=> b!1331304 m!1219965))

(declare-fun m!1219979 () Bool)

(assert (=> b!1331304 m!1219979))

(assert (=> b!1331308 m!1219961))

(assert (=> b!1331308 m!1219961))

(declare-fun m!1219981 () Bool)

(assert (=> b!1331308 m!1219981))

(declare-fun m!1219983 () Bool)

(assert (=> b!1331305 m!1219983))

(assert (=> b!1331305 m!1219983))

(declare-fun m!1219985 () Bool)

(assert (=> b!1331305 m!1219985))

(declare-fun m!1219987 () Bool)

(assert (=> mapNonEmpty!56623 m!1219987))

(declare-fun m!1219989 () Bool)

(assert (=> b!1331307 m!1219989))

(declare-fun m!1219991 () Bool)

(assert (=> b!1331303 m!1219991))

(declare-fun m!1219993 () Bool)

(assert (=> start!112328 m!1219993))

(declare-fun m!1219995 () Bool)

(assert (=> start!112328 m!1219995))

(declare-fun m!1219997 () Bool)

(assert (=> start!112328 m!1219997))

(check-sat (not b_lambda!23983) (not start!112328) (not b!1331307) tp_is_empty!36633 (not mapNonEmpty!56623) (not b_next!30723) (not b!1331305) (not b!1331304) (not b!1331303) b_and!49503 (not b!1331308))
(check-sat b_and!49503 (not b_next!30723))
