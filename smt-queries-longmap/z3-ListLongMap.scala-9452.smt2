; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112320 () Bool)

(assert start!112320)

(declare-fun b_free!30715 () Bool)

(declare-fun b_next!30715 () Bool)

(assert (=> start!112320 (= b_free!30715 (not b_next!30715))))

(declare-fun tp!107782 () Bool)

(declare-fun b_and!49467 () Bool)

(assert (=> start!112320 (= tp!107782 b_and!49467)))

(declare-fun b!1331077 () Bool)

(declare-fun e!758529 () Bool)

(declare-fun e!758533 () Bool)

(declare-fun mapRes!56611 () Bool)

(assert (=> b!1331077 (= e!758529 (and e!758533 mapRes!56611))))

(declare-fun condMapEmpty!56611 () Bool)

(declare-datatypes ((V!53937 0))(
  ( (V!53938 (val!18387 Int)) )
))
(declare-datatypes ((ValueCell!17414 0))(
  ( (ValueCellFull!17414 (v!21023 V!53937)) (EmptyCell!17414) )
))
(declare-datatypes ((array!90069 0))(
  ( (array!90070 (arr!43501 (Array (_ BitVec 32) ValueCell!17414)) (size!44053 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90069)

(declare-fun mapDefault!56611 () ValueCell!17414)

(assert (=> b!1331077 (= condMapEmpty!56611 (= (arr!43501 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17414)) mapDefault!56611)))))

(declare-fun b!1331078 () Bool)

(declare-fun res!883288 () Bool)

(declare-fun e!758530 () Bool)

(assert (=> b!1331078 (=> (not res!883288) (not e!758530))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90071 0))(
  ( (array!90072 (arr!43502 (Array (_ BitVec 32) (_ BitVec 64))) (size!44054 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90071)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1331078 (= res!883288 (not (= (select (arr!43502 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331079 () Bool)

(declare-fun res!883282 () Bool)

(assert (=> b!1331079 (=> (not res!883282) (not e!758530))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331079 (= res!883282 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331080 () Bool)

(declare-fun res!883284 () Bool)

(assert (=> b!1331080 (=> (not res!883284) (not e!758530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331080 (= res!883284 (validKeyInArray!0 (select (arr!43502 _keys!1590) from!1980)))))

(declare-fun b!1331081 () Bool)

(declare-fun tp_is_empty!36625 () Bool)

(assert (=> b!1331081 (= e!758533 tp_is_empty!36625)))

(declare-fun mapNonEmpty!56611 () Bool)

(declare-fun tp!107783 () Bool)

(declare-fun e!758531 () Bool)

(assert (=> mapNonEmpty!56611 (= mapRes!56611 (and tp!107783 e!758531))))

(declare-fun mapRest!56611 () (Array (_ BitVec 32) ValueCell!17414))

(declare-fun mapValue!56611 () ValueCell!17414)

(declare-fun mapKey!56611 () (_ BitVec 32))

(assert (=> mapNonEmpty!56611 (= (arr!43501 _values!1320) (store mapRest!56611 mapKey!56611 mapValue!56611))))

(declare-fun b!1331082 () Bool)

(declare-fun res!883287 () Bool)

(assert (=> b!1331082 (=> (not res!883287) (not e!758530))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90071 (_ BitVec 32)) Bool)

(assert (=> b!1331082 (= res!883287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!883283 () Bool)

(assert (=> start!112320 (=> (not res!883283) (not e!758530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112320 (= res!883283 (validMask!0 mask!1998))))

(assert (=> start!112320 e!758530))

(declare-fun array_inv!32993 (array!90069) Bool)

(assert (=> start!112320 (and (array_inv!32993 _values!1320) e!758529)))

(assert (=> start!112320 true))

(declare-fun array_inv!32994 (array!90071) Bool)

(assert (=> start!112320 (array_inv!32994 _keys!1590)))

(assert (=> start!112320 tp!107782))

(assert (=> start!112320 tp_is_empty!36625))

(declare-fun b!1331083 () Bool)

(declare-fun res!883285 () Bool)

(assert (=> b!1331083 (=> (not res!883285) (not e!758530))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53937)

(declare-fun zeroValue!1262 () V!53937)

(declare-datatypes ((tuple2!23748 0))(
  ( (tuple2!23749 (_1!11885 (_ BitVec 64)) (_2!11885 V!53937)) )
))
(declare-datatypes ((List!30888 0))(
  ( (Nil!30885) (Cons!30884 (h!32093 tuple2!23748) (t!45008 List!30888)) )
))
(declare-datatypes ((ListLongMap!21405 0))(
  ( (ListLongMap!21406 (toList!10718 List!30888)) )
))
(declare-fun contains!8810 (ListLongMap!21405 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5581 (array!90071 array!90069 (_ BitVec 32) (_ BitVec 32) V!53937 V!53937 (_ BitVec 32) Int) ListLongMap!21405)

(assert (=> b!1331083 (= res!883285 (contains!8810 (getCurrentListMap!5581 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331084 () Bool)

(declare-fun res!883280 () Bool)

(assert (=> b!1331084 (=> (not res!883280) (not e!758530))))

(assert (=> b!1331084 (= res!883280 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44054 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331085 () Bool)

(assert (=> b!1331085 (= e!758531 tp_is_empty!36625)))

(declare-fun b!1331086 () Bool)

(declare-fun res!883286 () Bool)

(assert (=> b!1331086 (=> (not res!883286) (not e!758530))))

(assert (=> b!1331086 (= res!883286 (and (= (size!44053 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44054 _keys!1590) (size!44053 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331087 () Bool)

(declare-fun res!883281 () Bool)

(assert (=> b!1331087 (=> (not res!883281) (not e!758530))))

(declare-datatypes ((List!30889 0))(
  ( (Nil!30886) (Cons!30885 (h!32094 (_ BitVec 64)) (t!45009 List!30889)) )
))
(declare-fun arrayNoDuplicates!0 (array!90071 (_ BitVec 32) List!30889) Bool)

(assert (=> b!1331087 (= res!883281 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30886))))

(declare-fun b!1331088 () Bool)

(assert (=> b!1331088 (= e!758530 (not true))))

(declare-fun lt!591234 () ListLongMap!21405)

(assert (=> b!1331088 (contains!8810 lt!591234 k0!1153)))

(declare-datatypes ((Unit!43610 0))(
  ( (Unit!43611) )
))
(declare-fun lt!591235 () Unit!43610)

(declare-fun lt!591238 () V!53937)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!255 ((_ BitVec 64) (_ BitVec 64) V!53937 ListLongMap!21405) Unit!43610)

(assert (=> b!1331088 (= lt!591235 (lemmaInListMapAfterAddingDiffThenInBefore!255 k0!1153 (select (arr!43502 _keys!1590) from!1980) lt!591238 lt!591234))))

(declare-fun lt!591236 () ListLongMap!21405)

(assert (=> b!1331088 (contains!8810 lt!591236 k0!1153)))

(declare-fun lt!591237 () Unit!43610)

(assert (=> b!1331088 (= lt!591237 (lemmaInListMapAfterAddingDiffThenInBefore!255 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591236))))

(declare-fun +!4699 (ListLongMap!21405 tuple2!23748) ListLongMap!21405)

(assert (=> b!1331088 (= lt!591236 (+!4699 lt!591234 (tuple2!23749 (select (arr!43502 _keys!1590) from!1980) lt!591238)))))

(declare-fun get!21934 (ValueCell!17414 V!53937) V!53937)

(declare-fun dynLambda!3629 (Int (_ BitVec 64)) V!53937)

(assert (=> b!1331088 (= lt!591238 (get!21934 (select (arr!43501 _values!1320) from!1980) (dynLambda!3629 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6337 (array!90071 array!90069 (_ BitVec 32) (_ BitVec 32) V!53937 V!53937 (_ BitVec 32) Int) ListLongMap!21405)

(assert (=> b!1331088 (= lt!591234 (getCurrentListMapNoExtraKeys!6337 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun mapIsEmpty!56611 () Bool)

(assert (=> mapIsEmpty!56611 mapRes!56611))

(assert (= (and start!112320 res!883283) b!1331086))

(assert (= (and b!1331086 res!883286) b!1331082))

(assert (= (and b!1331082 res!883287) b!1331087))

(assert (= (and b!1331087 res!883281) b!1331084))

(assert (= (and b!1331084 res!883280) b!1331083))

(assert (= (and b!1331083 res!883285) b!1331078))

(assert (= (and b!1331078 res!883288) b!1331080))

(assert (= (and b!1331080 res!883284) b!1331079))

(assert (= (and b!1331079 res!883282) b!1331088))

(assert (= (and b!1331077 condMapEmpty!56611) mapIsEmpty!56611))

(assert (= (and b!1331077 (not condMapEmpty!56611)) mapNonEmpty!56611))

(get-info :version)

(assert (= (and mapNonEmpty!56611 ((_ is ValueCellFull!17414) mapValue!56611)) b!1331085))

(assert (= (and b!1331077 ((_ is ValueCellFull!17414) mapDefault!56611)) b!1331081))

(assert (= start!112320 b!1331077))

(declare-fun b_lambda!23965 () Bool)

(assert (=> (not b_lambda!23965) (not b!1331088)))

(declare-fun t!45007 () Bool)

(declare-fun tb!11923 () Bool)

(assert (=> (and start!112320 (= defaultEntry!1323 defaultEntry!1323) t!45007) tb!11923))

(declare-fun result!24925 () Bool)

(assert (=> tb!11923 (= result!24925 tp_is_empty!36625)))

(assert (=> b!1331088 t!45007))

(declare-fun b_and!49469 () Bool)

(assert (= b_and!49467 (and (=> t!45007 result!24925) b_and!49469)))

(declare-fun m!1219293 () Bool)

(assert (=> b!1331088 m!1219293))

(declare-fun m!1219295 () Bool)

(assert (=> b!1331088 m!1219295))

(declare-fun m!1219297 () Bool)

(assert (=> b!1331088 m!1219297))

(assert (=> b!1331088 m!1219295))

(declare-fun m!1219299 () Bool)

(assert (=> b!1331088 m!1219299))

(declare-fun m!1219301 () Bool)

(assert (=> b!1331088 m!1219301))

(declare-fun m!1219303 () Bool)

(assert (=> b!1331088 m!1219303))

(declare-fun m!1219305 () Bool)

(assert (=> b!1331088 m!1219305))

(declare-fun m!1219307 () Bool)

(assert (=> b!1331088 m!1219307))

(declare-fun m!1219309 () Bool)

(assert (=> b!1331088 m!1219309))

(assert (=> b!1331088 m!1219305))

(assert (=> b!1331088 m!1219297))

(declare-fun m!1219311 () Bool)

(assert (=> b!1331088 m!1219311))

(declare-fun m!1219313 () Bool)

(assert (=> b!1331087 m!1219313))

(assert (=> b!1331080 m!1219305))

(assert (=> b!1331080 m!1219305))

(declare-fun m!1219315 () Bool)

(assert (=> b!1331080 m!1219315))

(assert (=> b!1331078 m!1219305))

(declare-fun m!1219317 () Bool)

(assert (=> b!1331082 m!1219317))

(declare-fun m!1219319 () Bool)

(assert (=> b!1331083 m!1219319))

(assert (=> b!1331083 m!1219319))

(declare-fun m!1219321 () Bool)

(assert (=> b!1331083 m!1219321))

(declare-fun m!1219323 () Bool)

(assert (=> mapNonEmpty!56611 m!1219323))

(declare-fun m!1219325 () Bool)

(assert (=> start!112320 m!1219325))

(declare-fun m!1219327 () Bool)

(assert (=> start!112320 m!1219327))

(declare-fun m!1219329 () Bool)

(assert (=> start!112320 m!1219329))

(check-sat (not b_next!30715) (not b!1331088) (not mapNonEmpty!56611) (not b_lambda!23965) (not b!1331083) b_and!49469 tp_is_empty!36625 (not b!1331080) (not b!1331082) (not start!112320) (not b!1331087))
(check-sat b_and!49469 (not b_next!30715))
