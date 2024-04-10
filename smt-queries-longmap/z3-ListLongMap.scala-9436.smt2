; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112226 () Bool)

(assert start!112226)

(declare-fun b_free!30621 () Bool)

(declare-fun b_next!30621 () Bool)

(assert (=> start!112226 (= b_free!30621 (not b_next!30621))))

(declare-fun tp!107500 () Bool)

(declare-fun b_and!49297 () Bool)

(assert (=> start!112226 (= tp!107500 b_and!49297)))

(declare-fun b!1329361 () Bool)

(declare-fun res!882047 () Bool)

(declare-fun e!757859 () Bool)

(assert (=> b!1329361 (=> (not res!882047) (not e!757859))))

(declare-datatypes ((array!89954 0))(
  ( (array!89955 (arr!43443 (Array (_ BitVec 32) (_ BitVec 64))) (size!43993 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89954)

(declare-datatypes ((List!30765 0))(
  ( (Nil!30762) (Cons!30761 (h!31970 (_ BitVec 64)) (t!44799 List!30765)) )
))
(declare-fun arrayNoDuplicates!0 (array!89954 (_ BitVec 32) List!30765) Bool)

(assert (=> b!1329361 (= res!882047 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30762))))

(declare-fun mapNonEmpty!56470 () Bool)

(declare-fun mapRes!56470 () Bool)

(declare-fun tp!107499 () Bool)

(declare-fun e!757860 () Bool)

(assert (=> mapNonEmpty!56470 (= mapRes!56470 (and tp!107499 e!757860))))

(declare-fun mapKey!56470 () (_ BitVec 32))

(declare-datatypes ((V!53811 0))(
  ( (V!53812 (val!18340 Int)) )
))
(declare-datatypes ((ValueCell!17367 0))(
  ( (ValueCellFull!17367 (v!20977 V!53811)) (EmptyCell!17367) )
))
(declare-datatypes ((array!89956 0))(
  ( (array!89957 (arr!43444 (Array (_ BitVec 32) ValueCell!17367)) (size!43994 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89956)

(declare-fun mapValue!56470 () ValueCell!17367)

(declare-fun mapRest!56470 () (Array (_ BitVec 32) ValueCell!17367))

(assert (=> mapNonEmpty!56470 (= (arr!43444 _values!1320) (store mapRest!56470 mapKey!56470 mapValue!56470))))

(declare-fun b!1329363 () Bool)

(declare-fun tp_is_empty!36531 () Bool)

(assert (=> b!1329363 (= e!757860 tp_is_empty!36531)))

(declare-fun mapIsEmpty!56470 () Bool)

(assert (=> mapIsEmpty!56470 mapRes!56470))

(declare-fun b!1329364 () Bool)

(declare-fun res!882044 () Bool)

(assert (=> b!1329364 (=> (not res!882044) (not e!757859))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1329364 (= res!882044 (not (= (select (arr!43443 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329365 () Bool)

(declare-fun res!882046 () Bool)

(assert (=> b!1329365 (=> (not res!882046) (not e!757859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329365 (= res!882046 (validKeyInArray!0 (select (arr!43443 _keys!1590) from!1980)))))

(declare-fun b!1329366 () Bool)

(declare-fun e!757857 () Bool)

(assert (=> b!1329366 (= e!757857 tp_is_empty!36531)))

(declare-fun b!1329367 () Bool)

(declare-fun res!882041 () Bool)

(assert (=> b!1329367 (=> (not res!882041) (not e!757859))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329367 (= res!882041 (and (= (size!43994 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43993 _keys!1590) (size!43994 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329362 () Bool)

(declare-fun e!757858 () Bool)

(assert (=> b!1329362 (= e!757858 (and e!757857 mapRes!56470))))

(declare-fun condMapEmpty!56470 () Bool)

(declare-fun mapDefault!56470 () ValueCell!17367)

(assert (=> b!1329362 (= condMapEmpty!56470 (= (arr!43444 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17367)) mapDefault!56470)))))

(declare-fun res!882042 () Bool)

(assert (=> start!112226 (=> (not res!882042) (not e!757859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112226 (= res!882042 (validMask!0 mask!1998))))

(assert (=> start!112226 e!757859))

(declare-fun array_inv!32779 (array!89956) Bool)

(assert (=> start!112226 (and (array_inv!32779 _values!1320) e!757858)))

(assert (=> start!112226 true))

(declare-fun array_inv!32780 (array!89954) Bool)

(assert (=> start!112226 (array_inv!32780 _keys!1590)))

(assert (=> start!112226 tp!107500))

(assert (=> start!112226 tp_is_empty!36531))

(declare-fun b!1329368 () Bool)

(assert (=> b!1329368 (= e!757859 (not true))))

(declare-datatypes ((tuple2!23612 0))(
  ( (tuple2!23613 (_1!11817 (_ BitVec 64)) (_2!11817 V!53811)) )
))
(declare-datatypes ((List!30766 0))(
  ( (Nil!30763) (Cons!30762 (h!31971 tuple2!23612) (t!44800 List!30766)) )
))
(declare-datatypes ((ListLongMap!21269 0))(
  ( (ListLongMap!21270 (toList!10650 List!30766)) )
))
(declare-fun lt!590944 () ListLongMap!21269)

(declare-fun contains!8814 (ListLongMap!21269 (_ BitVec 64)) Bool)

(assert (=> b!1329368 (contains!8814 lt!590944 k0!1153)))

(declare-datatypes ((Unit!43749 0))(
  ( (Unit!43750) )
))
(declare-fun lt!590943 () Unit!43749)

(declare-fun minValue!1262 () V!53811)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!237 ((_ BitVec 64) (_ BitVec 64) V!53811 ListLongMap!21269) Unit!43749)

(assert (=> b!1329368 (= lt!590943 (lemmaInListMapAfterAddingDiffThenInBefore!237 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590944))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53811)

(declare-fun +!4650 (ListLongMap!21269 tuple2!23612) ListLongMap!21269)

(declare-fun getCurrentListMapNoExtraKeys!6288 (array!89954 array!89956 (_ BitVec 32) (_ BitVec 32) V!53811 V!53811 (_ BitVec 32) Int) ListLongMap!21269)

(declare-fun get!21886 (ValueCell!17367 V!53811) V!53811)

(declare-fun dynLambda!3589 (Int (_ BitVec 64)) V!53811)

(assert (=> b!1329368 (= lt!590944 (+!4650 (getCurrentListMapNoExtraKeys!6288 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23613 (select (arr!43443 _keys!1590) from!1980) (get!21886 (select (arr!43444 _values!1320) from!1980) (dynLambda!3589 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329369 () Bool)

(declare-fun res!882045 () Bool)

(assert (=> b!1329369 (=> (not res!882045) (not e!757859))))

(assert (=> b!1329369 (= res!882045 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329370 () Bool)

(declare-fun res!882043 () Bool)

(assert (=> b!1329370 (=> (not res!882043) (not e!757859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89954 (_ BitVec 32)) Bool)

(assert (=> b!1329370 (= res!882043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329371 () Bool)

(declare-fun res!882048 () Bool)

(assert (=> b!1329371 (=> (not res!882048) (not e!757859))))

(declare-fun getCurrentListMap!5640 (array!89954 array!89956 (_ BitVec 32) (_ BitVec 32) V!53811 V!53811 (_ BitVec 32) Int) ListLongMap!21269)

(assert (=> b!1329371 (= res!882048 (contains!8814 (getCurrentListMap!5640 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329372 () Bool)

(declare-fun res!882040 () Bool)

(assert (=> b!1329372 (=> (not res!882040) (not e!757859))))

(assert (=> b!1329372 (= res!882040 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43993 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112226 res!882042) b!1329367))

(assert (= (and b!1329367 res!882041) b!1329370))

(assert (= (and b!1329370 res!882043) b!1329361))

(assert (= (and b!1329361 res!882047) b!1329372))

(assert (= (and b!1329372 res!882040) b!1329371))

(assert (= (and b!1329371 res!882048) b!1329364))

(assert (= (and b!1329364 res!882044) b!1329365))

(assert (= (and b!1329365 res!882046) b!1329369))

(assert (= (and b!1329369 res!882045) b!1329368))

(assert (= (and b!1329362 condMapEmpty!56470) mapIsEmpty!56470))

(assert (= (and b!1329362 (not condMapEmpty!56470)) mapNonEmpty!56470))

(get-info :version)

(assert (= (and mapNonEmpty!56470 ((_ is ValueCellFull!17367) mapValue!56470)) b!1329363))

(assert (= (and b!1329362 ((_ is ValueCellFull!17367) mapDefault!56470)) b!1329366))

(assert (= start!112226 b!1329362))

(declare-fun b_lambda!23881 () Bool)

(assert (=> (not b_lambda!23881) (not b!1329368)))

(declare-fun t!44798 () Bool)

(declare-fun tb!11837 () Bool)

(assert (=> (and start!112226 (= defaultEntry!1323 defaultEntry!1323) t!44798) tb!11837))

(declare-fun result!24745 () Bool)

(assert (=> tb!11837 (= result!24745 tp_is_empty!36531)))

(assert (=> b!1329368 t!44798))

(declare-fun b_and!49299 () Bool)

(assert (= b_and!49297 (and (=> t!44798 result!24745) b_and!49299)))

(declare-fun m!1218127 () Bool)

(assert (=> b!1329361 m!1218127))

(declare-fun m!1218129 () Bool)

(assert (=> start!112226 m!1218129))

(declare-fun m!1218131 () Bool)

(assert (=> start!112226 m!1218131))

(declare-fun m!1218133 () Bool)

(assert (=> start!112226 m!1218133))

(declare-fun m!1218135 () Bool)

(assert (=> b!1329364 m!1218135))

(declare-fun m!1218137 () Bool)

(assert (=> mapNonEmpty!56470 m!1218137))

(declare-fun m!1218139 () Bool)

(assert (=> b!1329368 m!1218139))

(declare-fun m!1218141 () Bool)

(assert (=> b!1329368 m!1218141))

(declare-fun m!1218143 () Bool)

(assert (=> b!1329368 m!1218143))

(declare-fun m!1218145 () Bool)

(assert (=> b!1329368 m!1218145))

(declare-fun m!1218147 () Bool)

(assert (=> b!1329368 m!1218147))

(assert (=> b!1329368 m!1218141))

(declare-fun m!1218149 () Bool)

(assert (=> b!1329368 m!1218149))

(assert (=> b!1329368 m!1218143))

(assert (=> b!1329368 m!1218147))

(declare-fun m!1218151 () Bool)

(assert (=> b!1329368 m!1218151))

(assert (=> b!1329368 m!1218135))

(assert (=> b!1329365 m!1218135))

(assert (=> b!1329365 m!1218135))

(declare-fun m!1218153 () Bool)

(assert (=> b!1329365 m!1218153))

(declare-fun m!1218155 () Bool)

(assert (=> b!1329371 m!1218155))

(assert (=> b!1329371 m!1218155))

(declare-fun m!1218157 () Bool)

(assert (=> b!1329371 m!1218157))

(declare-fun m!1218159 () Bool)

(assert (=> b!1329370 m!1218159))

(check-sat (not b!1329371) tp_is_empty!36531 (not mapNonEmpty!56470) (not b!1329370) b_and!49299 (not b!1329361) (not b_lambda!23881) (not b_next!30621) (not b!1329365) (not start!112226) (not b!1329368))
(check-sat b_and!49299 (not b_next!30621))
