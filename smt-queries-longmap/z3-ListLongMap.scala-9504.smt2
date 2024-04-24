; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112914 () Bool)

(assert start!112914)

(declare-fun b_free!31027 () Bool)

(declare-fun b_next!31027 () Bool)

(assert (=> start!112914 (= b_free!31027 (not b_next!31027))))

(declare-fun tp!108722 () Bool)

(declare-fun b_and!49993 () Bool)

(assert (=> start!112914 (= tp!108722 b_and!49993)))

(declare-fun mapIsEmpty!57083 () Bool)

(declare-fun mapRes!57083 () Bool)

(assert (=> mapIsEmpty!57083 mapRes!57083))

(declare-fun b!1338122 () Bool)

(declare-fun res!887697 () Bool)

(declare-fun e!762071 () Bool)

(assert (=> b!1338122 (=> (not res!887697) (not e!762071))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1338122 (= res!887697 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338123 () Bool)

(declare-fun res!887699 () Bool)

(assert (=> b!1338123 (=> (not res!887699) (not e!762071))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90847 0))(
  ( (array!90848 (arr!43884 (Array (_ BitVec 32) (_ BitVec 64))) (size!44435 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90847)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1338123 (= res!887699 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44435 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!887702 () Bool)

(assert (=> start!112914 (=> (not res!887702) (not e!762071))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112914 (= res!887702 (validMask!0 mask!1998))))

(assert (=> start!112914 e!762071))

(declare-datatypes ((V!54353 0))(
  ( (V!54354 (val!18543 Int)) )
))
(declare-datatypes ((ValueCell!17570 0))(
  ( (ValueCellFull!17570 (v!21178 V!54353)) (EmptyCell!17570) )
))
(declare-datatypes ((array!90849 0))(
  ( (array!90850 (arr!43885 (Array (_ BitVec 32) ValueCell!17570)) (size!44436 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90849)

(declare-fun e!762070 () Bool)

(declare-fun array_inv!33361 (array!90849) Bool)

(assert (=> start!112914 (and (array_inv!33361 _values!1320) e!762070)))

(assert (=> start!112914 true))

(declare-fun array_inv!33362 (array!90847) Bool)

(assert (=> start!112914 (array_inv!33362 _keys!1590)))

(assert (=> start!112914 tp!108722))

(declare-fun tp_is_empty!36937 () Bool)

(assert (=> start!112914 tp_is_empty!36937))

(declare-fun b!1338124 () Bool)

(declare-fun e!762073 () Bool)

(assert (=> b!1338124 (= e!762070 (and e!762073 mapRes!57083))))

(declare-fun condMapEmpty!57083 () Bool)

(declare-fun mapDefault!57083 () ValueCell!17570)

(assert (=> b!1338124 (= condMapEmpty!57083 (= (arr!43885 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17570)) mapDefault!57083)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54353)

(declare-fun b!1338125 () Bool)

(declare-fun zeroValue!1262 () V!54353)

(declare-datatypes ((tuple2!23962 0))(
  ( (tuple2!23963 (_1!11992 (_ BitVec 64)) (_2!11992 V!54353)) )
))
(declare-datatypes ((List!31103 0))(
  ( (Nil!31100) (Cons!31099 (h!32317 tuple2!23962) (t!45403 List!31103)) )
))
(declare-datatypes ((ListLongMap!21627 0))(
  ( (ListLongMap!21628 (toList!10829 List!31103)) )
))
(declare-fun contains!9006 (ListLongMap!21627 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5783 (array!90847 array!90849 (_ BitVec 32) (_ BitVec 32) V!54353 V!54353 (_ BitVec 32) Int) ListLongMap!21627)

(assert (=> b!1338125 (= e!762071 (not (contains!9006 (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153)))))

(declare-fun lt!593348 () ListLongMap!21627)

(declare-fun +!4779 (ListLongMap!21627 tuple2!23962) ListLongMap!21627)

(assert (=> b!1338125 (contains!9006 (+!4779 lt!593348 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43867 0))(
  ( (Unit!43868) )
))
(declare-fun lt!593345 () Unit!43867)

(declare-fun addStillContains!1192 (ListLongMap!21627 (_ BitVec 64) V!54353 (_ BitVec 64)) Unit!43867)

(assert (=> b!1338125 (= lt!593345 (addStillContains!1192 lt!593348 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1338125 (contains!9006 lt!593348 k0!1153)))

(declare-fun lt!593346 () V!54353)

(declare-fun lt!593349 () Unit!43867)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!314 ((_ BitVec 64) (_ BitVec 64) V!54353 ListLongMap!21627) Unit!43867)

(assert (=> b!1338125 (= lt!593349 (lemmaInListMapAfterAddingDiffThenInBefore!314 k0!1153 (select (arr!43884 _keys!1590) from!1980) lt!593346 lt!593348))))

(declare-fun lt!593350 () ListLongMap!21627)

(assert (=> b!1338125 (contains!9006 lt!593350 k0!1153)))

(declare-fun lt!593347 () Unit!43867)

(assert (=> b!1338125 (= lt!593347 (lemmaInListMapAfterAddingDiffThenInBefore!314 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!593350))))

(assert (=> b!1338125 (= lt!593350 (+!4779 lt!593348 (tuple2!23963 (select (arr!43884 _keys!1590) from!1980) lt!593346)))))

(declare-fun get!22157 (ValueCell!17570 V!54353) V!54353)

(declare-fun dynLambda!3733 (Int (_ BitVec 64)) V!54353)

(assert (=> b!1338125 (= lt!593346 (get!22157 (select (arr!43885 _values!1320) from!1980) (dynLambda!3733 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6428 (array!90847 array!90849 (_ BitVec 32) (_ BitVec 32) V!54353 V!54353 (_ BitVec 32) Int) ListLongMap!21627)

(assert (=> b!1338125 (= lt!593348 (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1338126 () Bool)

(declare-fun res!887698 () Bool)

(assert (=> b!1338126 (=> (not res!887698) (not e!762071))))

(declare-datatypes ((List!31104 0))(
  ( (Nil!31101) (Cons!31100 (h!32318 (_ BitVec 64)) (t!45404 List!31104)) )
))
(declare-fun arrayNoDuplicates!0 (array!90847 (_ BitVec 32) List!31104) Bool)

(assert (=> b!1338126 (= res!887698 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31101))))

(declare-fun b!1338127 () Bool)

(declare-fun res!887703 () Bool)

(assert (=> b!1338127 (=> (not res!887703) (not e!762071))))

(assert (=> b!1338127 (= res!887703 (not (= (select (arr!43884 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1338128 () Bool)

(declare-fun res!887704 () Bool)

(assert (=> b!1338128 (=> (not res!887704) (not e!762071))))

(assert (=> b!1338128 (= res!887704 (and (= (size!44436 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44435 _keys!1590) (size!44436 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57083 () Bool)

(declare-fun tp!108721 () Bool)

(declare-fun e!762072 () Bool)

(assert (=> mapNonEmpty!57083 (= mapRes!57083 (and tp!108721 e!762072))))

(declare-fun mapRest!57083 () (Array (_ BitVec 32) ValueCell!17570))

(declare-fun mapKey!57083 () (_ BitVec 32))

(declare-fun mapValue!57083 () ValueCell!17570)

(assert (=> mapNonEmpty!57083 (= (arr!43885 _values!1320) (store mapRest!57083 mapKey!57083 mapValue!57083))))

(declare-fun b!1338129 () Bool)

(assert (=> b!1338129 (= e!762072 tp_is_empty!36937)))

(declare-fun b!1338130 () Bool)

(assert (=> b!1338130 (= e!762073 tp_is_empty!36937)))

(declare-fun b!1338131 () Bool)

(declare-fun res!887701 () Bool)

(assert (=> b!1338131 (=> (not res!887701) (not e!762071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338131 (= res!887701 (validKeyInArray!0 (select (arr!43884 _keys!1590) from!1980)))))

(declare-fun b!1338132 () Bool)

(declare-fun res!887700 () Bool)

(assert (=> b!1338132 (=> (not res!887700) (not e!762071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90847 (_ BitVec 32)) Bool)

(assert (=> b!1338132 (= res!887700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1338133 () Bool)

(declare-fun res!887696 () Bool)

(assert (=> b!1338133 (=> (not res!887696) (not e!762071))))

(assert (=> b!1338133 (= res!887696 (contains!9006 (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112914 res!887702) b!1338128))

(assert (= (and b!1338128 res!887704) b!1338132))

(assert (= (and b!1338132 res!887700) b!1338126))

(assert (= (and b!1338126 res!887698) b!1338123))

(assert (= (and b!1338123 res!887699) b!1338133))

(assert (= (and b!1338133 res!887696) b!1338127))

(assert (= (and b!1338127 res!887703) b!1338131))

(assert (= (and b!1338131 res!887701) b!1338122))

(assert (= (and b!1338122 res!887697) b!1338125))

(assert (= (and b!1338124 condMapEmpty!57083) mapIsEmpty!57083))

(assert (= (and b!1338124 (not condMapEmpty!57083)) mapNonEmpty!57083))

(get-info :version)

(assert (= (and mapNonEmpty!57083 ((_ is ValueCellFull!17570) mapValue!57083)) b!1338129))

(assert (= (and b!1338124 ((_ is ValueCellFull!17570) mapDefault!57083)) b!1338130))

(assert (= start!112914 b!1338124))

(declare-fun b_lambda!24179 () Bool)

(assert (=> (not b_lambda!24179) (not b!1338125)))

(declare-fun t!45402 () Bool)

(declare-fun tb!12103 () Bool)

(assert (=> (and start!112914 (= defaultEntry!1323 defaultEntry!1323) t!45402) tb!12103))

(declare-fun result!25287 () Bool)

(assert (=> tb!12103 (= result!25287 tp_is_empty!36937)))

(assert (=> b!1338125 t!45402))

(declare-fun b_and!49995 () Bool)

(assert (= b_and!49993 (and (=> t!45402 result!25287) b_and!49995)))

(declare-fun m!1226481 () Bool)

(assert (=> b!1338126 m!1226481))

(declare-fun m!1226483 () Bool)

(assert (=> start!112914 m!1226483))

(declare-fun m!1226485 () Bool)

(assert (=> start!112914 m!1226485))

(declare-fun m!1226487 () Bool)

(assert (=> start!112914 m!1226487))

(declare-fun m!1226489 () Bool)

(assert (=> b!1338127 m!1226489))

(declare-fun m!1226491 () Bool)

(assert (=> mapNonEmpty!57083 m!1226491))

(assert (=> b!1338131 m!1226489))

(assert (=> b!1338131 m!1226489))

(declare-fun m!1226493 () Bool)

(assert (=> b!1338131 m!1226493))

(declare-fun m!1226495 () Bool)

(assert (=> b!1338125 m!1226495))

(declare-fun m!1226497 () Bool)

(assert (=> b!1338125 m!1226497))

(declare-fun m!1226499 () Bool)

(assert (=> b!1338125 m!1226499))

(declare-fun m!1226501 () Bool)

(assert (=> b!1338125 m!1226501))

(assert (=> b!1338125 m!1226489))

(declare-fun m!1226503 () Bool)

(assert (=> b!1338125 m!1226503))

(declare-fun m!1226505 () Bool)

(assert (=> b!1338125 m!1226505))

(declare-fun m!1226507 () Bool)

(assert (=> b!1338125 m!1226507))

(declare-fun m!1226509 () Bool)

(assert (=> b!1338125 m!1226509))

(declare-fun m!1226511 () Bool)

(assert (=> b!1338125 m!1226511))

(assert (=> b!1338125 m!1226489))

(declare-fun m!1226513 () Bool)

(assert (=> b!1338125 m!1226513))

(assert (=> b!1338125 m!1226509))

(assert (=> b!1338125 m!1226497))

(declare-fun m!1226515 () Bool)

(assert (=> b!1338125 m!1226515))

(assert (=> b!1338125 m!1226505))

(declare-fun m!1226517 () Bool)

(assert (=> b!1338125 m!1226517))

(declare-fun m!1226519 () Bool)

(assert (=> b!1338125 m!1226519))

(assert (=> b!1338125 m!1226495))

(declare-fun m!1226521 () Bool)

(assert (=> b!1338125 m!1226521))

(declare-fun m!1226523 () Bool)

(assert (=> b!1338132 m!1226523))

(declare-fun m!1226525 () Bool)

(assert (=> b!1338133 m!1226525))

(assert (=> b!1338133 m!1226525))

(declare-fun m!1226527 () Bool)

(assert (=> b!1338133 m!1226527))

(check-sat b_and!49995 (not b_next!31027) (not b!1338131) (not start!112914) (not b!1338126) tp_is_empty!36937 (not b!1338133) (not mapNonEmpty!57083) (not b_lambda!24179) (not b!1338125) (not b!1338132))
(check-sat b_and!49995 (not b_next!31027))
(get-model)

(declare-fun b_lambda!24185 () Bool)

(assert (= b_lambda!24179 (or (and start!112914 b_free!31027) b_lambda!24185)))

(check-sat (not b_lambda!24185) b_and!49995 (not b_next!31027) (not b!1338131) (not start!112914) (not b!1338126) tp_is_empty!36937 (not b!1338133) (not mapNonEmpty!57083) (not b!1338125) (not b!1338132))
(check-sat b_and!49995 (not b_next!31027))
(get-model)

(declare-fun b!1338222 () Bool)

(declare-fun e!762113 () Bool)

(declare-fun contains!9009 (List!31104 (_ BitVec 64)) Bool)

(assert (=> b!1338222 (= e!762113 (contains!9009 Nil!31101 (select (arr!43884 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338223 () Bool)

(declare-fun e!762114 () Bool)

(declare-fun e!762115 () Bool)

(assert (=> b!1338223 (= e!762114 e!762115)))

(declare-fun c!126407 () Bool)

(assert (=> b!1338223 (= c!126407 (validKeyInArray!0 (select (arr!43884 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338224 () Bool)

(declare-fun e!762112 () Bool)

(assert (=> b!1338224 (= e!762112 e!762114)))

(declare-fun res!887765 () Bool)

(assert (=> b!1338224 (=> (not res!887765) (not e!762114))))

(assert (=> b!1338224 (= res!887765 (not e!762113))))

(declare-fun res!887767 () Bool)

(assert (=> b!1338224 (=> (not res!887767) (not e!762113))))

(assert (=> b!1338224 (= res!887767 (validKeyInArray!0 (select (arr!43884 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338225 () Bool)

(declare-fun call!64936 () Bool)

(assert (=> b!1338225 (= e!762115 call!64936)))

(declare-fun bm!64933 () Bool)

(assert (=> bm!64933 (= call!64936 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126407 (Cons!31100 (select (arr!43884 _keys!1590) #b00000000000000000000000000000000) Nil!31101) Nil!31101)))))

(declare-fun b!1338226 () Bool)

(assert (=> b!1338226 (= e!762115 call!64936)))

(declare-fun d!144135 () Bool)

(declare-fun res!887766 () Bool)

(assert (=> d!144135 (=> res!887766 e!762112)))

(assert (=> d!144135 (= res!887766 (bvsge #b00000000000000000000000000000000 (size!44435 _keys!1590)))))

(assert (=> d!144135 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31101) e!762112)))

(assert (= (and d!144135 (not res!887766)) b!1338224))

(assert (= (and b!1338224 res!887767) b!1338222))

(assert (= (and b!1338224 res!887765) b!1338223))

(assert (= (and b!1338223 c!126407) b!1338225))

(assert (= (and b!1338223 (not c!126407)) b!1338226))

(assert (= (or b!1338225 b!1338226) bm!64933))

(declare-fun m!1226625 () Bool)

(assert (=> b!1338222 m!1226625))

(assert (=> b!1338222 m!1226625))

(declare-fun m!1226627 () Bool)

(assert (=> b!1338222 m!1226627))

(assert (=> b!1338223 m!1226625))

(assert (=> b!1338223 m!1226625))

(declare-fun m!1226629 () Bool)

(assert (=> b!1338223 m!1226629))

(assert (=> b!1338224 m!1226625))

(assert (=> b!1338224 m!1226625))

(assert (=> b!1338224 m!1226629))

(assert (=> bm!64933 m!1226625))

(declare-fun m!1226631 () Bool)

(assert (=> bm!64933 m!1226631))

(assert (=> b!1338126 d!144135))

(declare-fun d!144137 () Bool)

(assert (=> d!144137 (= (validKeyInArray!0 (select (arr!43884 _keys!1590) from!1980)) (and (not (= (select (arr!43884 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43884 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338131 d!144137))

(declare-fun b!1338235 () Bool)

(declare-fun e!762123 () Bool)

(declare-fun call!64939 () Bool)

(assert (=> b!1338235 (= e!762123 call!64939)))

(declare-fun bm!64936 () Bool)

(assert (=> bm!64936 (= call!64939 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1338236 () Bool)

(declare-fun e!762124 () Bool)

(assert (=> b!1338236 (= e!762124 call!64939)))

(declare-fun b!1338237 () Bool)

(declare-fun e!762122 () Bool)

(assert (=> b!1338237 (= e!762122 e!762123)))

(declare-fun c!126410 () Bool)

(assert (=> b!1338237 (= c!126410 (validKeyInArray!0 (select (arr!43884 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!144139 () Bool)

(declare-fun res!887772 () Bool)

(assert (=> d!144139 (=> res!887772 e!762122)))

(assert (=> d!144139 (= res!887772 (bvsge #b00000000000000000000000000000000 (size!44435 _keys!1590)))))

(assert (=> d!144139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!762122)))

(declare-fun b!1338238 () Bool)

(assert (=> b!1338238 (= e!762123 e!762124)))

(declare-fun lt!593395 () (_ BitVec 64))

(assert (=> b!1338238 (= lt!593395 (select (arr!43884 _keys!1590) #b00000000000000000000000000000000))))

(declare-fun lt!593393 () Unit!43867)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90847 (_ BitVec 64) (_ BitVec 32)) Unit!43867)

(assert (=> b!1338238 (= lt!593393 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593395 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1338238 (arrayContainsKey!0 _keys!1590 lt!593395 #b00000000000000000000000000000000)))

(declare-fun lt!593394 () Unit!43867)

(assert (=> b!1338238 (= lt!593394 lt!593393)))

(declare-fun res!887773 () Bool)

(declare-datatypes ((SeekEntryResult!10004 0))(
  ( (MissingZero!10004 (index!42387 (_ BitVec 32))) (Found!10004 (index!42388 (_ BitVec 32))) (Intermediate!10004 (undefined!10816 Bool) (index!42389 (_ BitVec 32)) (x!119418 (_ BitVec 32))) (Undefined!10004) (MissingVacant!10004 (index!42390 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90847 (_ BitVec 32)) SeekEntryResult!10004)

(assert (=> b!1338238 (= res!887773 (= (seekEntryOrOpen!0 (select (arr!43884 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10004 #b00000000000000000000000000000000)))))

(assert (=> b!1338238 (=> (not res!887773) (not e!762124))))

(assert (= (and d!144139 (not res!887772)) b!1338237))

(assert (= (and b!1338237 c!126410) b!1338238))

(assert (= (and b!1338237 (not c!126410)) b!1338235))

(assert (= (and b!1338238 res!887773) b!1338236))

(assert (= (or b!1338236 b!1338235) bm!64936))

(declare-fun m!1226633 () Bool)

(assert (=> bm!64936 m!1226633))

(assert (=> b!1338237 m!1226625))

(assert (=> b!1338237 m!1226625))

(assert (=> b!1338237 m!1226629))

(assert (=> b!1338238 m!1226625))

(declare-fun m!1226635 () Bool)

(assert (=> b!1338238 m!1226635))

(declare-fun m!1226637 () Bool)

(assert (=> b!1338238 m!1226637))

(assert (=> b!1338238 m!1226625))

(declare-fun m!1226639 () Bool)

(assert (=> b!1338238 m!1226639))

(assert (=> b!1338132 d!144139))

(declare-fun d!144141 () Bool)

(assert (=> d!144141 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112914 d!144141))

(declare-fun d!144143 () Bool)

(assert (=> d!144143 (= (array_inv!33361 _values!1320) (bvsge (size!44436 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112914 d!144143))

(declare-fun d!144145 () Bool)

(assert (=> d!144145 (= (array_inv!33362 _keys!1590) (bvsge (size!44435 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112914 d!144145))

(declare-fun d!144147 () Bool)

(declare-fun e!762130 () Bool)

(assert (=> d!144147 e!762130))

(declare-fun res!887776 () Bool)

(assert (=> d!144147 (=> res!887776 e!762130)))

(declare-fun lt!593407 () Bool)

(assert (=> d!144147 (= res!887776 (not lt!593407))))

(declare-fun lt!593404 () Bool)

(assert (=> d!144147 (= lt!593407 lt!593404)))

(declare-fun lt!593405 () Unit!43867)

(declare-fun e!762129 () Unit!43867)

(assert (=> d!144147 (= lt!593405 e!762129)))

(declare-fun c!126413 () Bool)

(assert (=> d!144147 (= c!126413 lt!593404)))

(declare-fun containsKey!738 (List!31103 (_ BitVec 64)) Bool)

(assert (=> d!144147 (= lt!593404 (containsKey!738 (toList!10829 (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!144147 (= (contains!9006 (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!593407)))

(declare-fun b!1338245 () Bool)

(declare-fun lt!593406 () Unit!43867)

(assert (=> b!1338245 (= e!762129 lt!593406)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!484 (List!31103 (_ BitVec 64)) Unit!43867)

(assert (=> b!1338245 (= lt!593406 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10829 (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-datatypes ((Option!763 0))(
  ( (Some!762 (v!21181 V!54353)) (None!761) )
))
(declare-fun isDefined!521 (Option!763) Bool)

(declare-fun getValueByKey!712 (List!31103 (_ BitVec 64)) Option!763)

(assert (=> b!1338245 (isDefined!521 (getValueByKey!712 (toList!10829 (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1338246 () Bool)

(declare-fun Unit!43873 () Unit!43867)

(assert (=> b!1338246 (= e!762129 Unit!43873)))

(declare-fun b!1338247 () Bool)

(assert (=> b!1338247 (= e!762130 (isDefined!521 (getValueByKey!712 (toList!10829 (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!144147 c!126413) b!1338245))

(assert (= (and d!144147 (not c!126413)) b!1338246))

(assert (= (and d!144147 (not res!887776)) b!1338247))

(declare-fun m!1226641 () Bool)

(assert (=> d!144147 m!1226641))

(declare-fun m!1226643 () Bool)

(assert (=> b!1338245 m!1226643))

(declare-fun m!1226645 () Bool)

(assert (=> b!1338245 m!1226645))

(assert (=> b!1338245 m!1226645))

(declare-fun m!1226647 () Bool)

(assert (=> b!1338245 m!1226647))

(assert (=> b!1338247 m!1226645))

(assert (=> b!1338247 m!1226645))

(assert (=> b!1338247 m!1226647))

(assert (=> b!1338133 d!144147))

(declare-fun b!1338290 () Bool)

(declare-fun e!762166 () ListLongMap!21627)

(declare-fun call!64959 () ListLongMap!21627)

(assert (=> b!1338290 (= e!762166 call!64959)))

(declare-fun b!1338291 () Bool)

(declare-fun res!887799 () Bool)

(declare-fun e!762165 () Bool)

(assert (=> b!1338291 (=> (not res!887799) (not e!762165))))

(declare-fun e!762168 () Bool)

(assert (=> b!1338291 (= res!887799 e!762168)))

(declare-fun res!887796 () Bool)

(assert (=> b!1338291 (=> res!887796 e!762168)))

(declare-fun e!762159 () Bool)

(assert (=> b!1338291 (= res!887796 (not e!762159))))

(declare-fun res!887803 () Bool)

(assert (=> b!1338291 (=> (not res!887803) (not e!762159))))

(assert (=> b!1338291 (= res!887803 (bvslt from!1980 (size!44435 _keys!1590)))))

(declare-fun bm!64951 () Bool)

(declare-fun call!64956 () ListLongMap!21627)

(declare-fun call!64957 () ListLongMap!21627)

(assert (=> bm!64951 (= call!64956 call!64957)))

(declare-fun b!1338292 () Bool)

(declare-fun e!762163 () Bool)

(assert (=> b!1338292 (= e!762165 e!762163)))

(declare-fun c!126430 () Bool)

(assert (=> b!1338292 (= c!126430 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338293 () Bool)

(declare-fun e!762167 () Bool)

(declare-fun call!64958 () Bool)

(assert (=> b!1338293 (= e!762167 (not call!64958))))

(declare-fun b!1338294 () Bool)

(declare-fun e!762169 () ListLongMap!21627)

(declare-fun call!64960 () ListLongMap!21627)

(assert (=> b!1338294 (= e!762169 (+!4779 call!64960 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1338295 () Bool)

(declare-fun c!126431 () Bool)

(assert (=> b!1338295 (= c!126431 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!762158 () ListLongMap!21627)

(assert (=> b!1338295 (= e!762158 e!762166)))

(declare-fun d!144149 () Bool)

(assert (=> d!144149 e!762165))

(declare-fun res!887802 () Bool)

(assert (=> d!144149 (=> (not res!887802) (not e!762165))))

(assert (=> d!144149 (= res!887802 (or (bvsge from!1980 (size!44435 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44435 _keys!1590)))))))

(declare-fun lt!593463 () ListLongMap!21627)

(declare-fun lt!593467 () ListLongMap!21627)

(assert (=> d!144149 (= lt!593463 lt!593467)))

(declare-fun lt!593462 () Unit!43867)

(declare-fun e!762164 () Unit!43867)

(assert (=> d!144149 (= lt!593462 e!762164)))

(declare-fun c!126428 () Bool)

(declare-fun e!762162 () Bool)

(assert (=> d!144149 (= c!126428 e!762162)))

(declare-fun res!887801 () Bool)

(assert (=> d!144149 (=> (not res!887801) (not e!762162))))

(assert (=> d!144149 (= res!887801 (bvslt from!1980 (size!44435 _keys!1590)))))

(assert (=> d!144149 (= lt!593467 e!762169)))

(declare-fun c!126427 () Bool)

(assert (=> d!144149 (= c!126427 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144149 (validMask!0 mask!1998)))

(assert (=> d!144149 (= (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593463)))

(declare-fun b!1338296 () Bool)

(assert (=> b!1338296 (= e!762169 e!762158)))

(declare-fun c!126426 () Bool)

(assert (=> b!1338296 (= c!126426 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338297 () Bool)

(assert (=> b!1338297 (= e!762158 call!64959)))

(declare-fun bm!64952 () Bool)

(declare-fun call!64954 () Bool)

(assert (=> bm!64952 (= call!64954 (contains!9006 lt!593463 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338298 () Bool)

(assert (=> b!1338298 (= e!762162 (validKeyInArray!0 (select (arr!43884 _keys!1590) from!1980)))))

(declare-fun b!1338299 () Bool)

(declare-fun e!762160 () Bool)

(declare-fun apply!1042 (ListLongMap!21627 (_ BitVec 64)) V!54353)

(assert (=> b!1338299 (= e!762160 (= (apply!1042 lt!593463 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun bm!64953 () Bool)

(assert (=> bm!64953 (= call!64959 call!64960)))

(declare-fun b!1338300 () Bool)

(declare-fun e!762161 () Bool)

(assert (=> b!1338300 (= e!762167 e!762161)))

(declare-fun res!887798 () Bool)

(assert (=> b!1338300 (= res!887798 call!64958)))

(assert (=> b!1338300 (=> (not res!887798) (not e!762161))))

(declare-fun b!1338301 () Bool)

(declare-fun call!64955 () ListLongMap!21627)

(assert (=> b!1338301 (= e!762166 call!64955)))

(declare-fun bm!64954 () Bool)

(assert (=> bm!64954 (= call!64957 (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun b!1338302 () Bool)

(declare-fun res!887800 () Bool)

(assert (=> b!1338302 (=> (not res!887800) (not e!762165))))

(assert (=> b!1338302 (= res!887800 e!762167)))

(declare-fun c!126429 () Bool)

(assert (=> b!1338302 (= c!126429 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1338303 () Bool)

(declare-fun Unit!43874 () Unit!43867)

(assert (=> b!1338303 (= e!762164 Unit!43874)))

(declare-fun b!1338304 () Bool)

(assert (=> b!1338304 (= e!762163 (not call!64954))))

(declare-fun bm!64955 () Bool)

(assert (=> bm!64955 (= call!64958 (contains!9006 lt!593463 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338305 () Bool)

(assert (=> b!1338305 (= e!762159 (validKeyInArray!0 (select (arr!43884 _keys!1590) from!1980)))))

(declare-fun b!1338306 () Bool)

(assert (=> b!1338306 (= e!762161 (= (apply!1042 lt!593463 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun e!762157 () Bool)

(declare-fun b!1338307 () Bool)

(assert (=> b!1338307 (= e!762157 (= (apply!1042 lt!593463 (select (arr!43884 _keys!1590) from!1980)) (get!22157 (select (arr!43885 _values!1320) from!1980) (dynLambda!3733 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338307 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44436 _values!1320)))))

(assert (=> b!1338307 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44435 _keys!1590)))))

(declare-fun bm!64956 () Bool)

(assert (=> bm!64956 (= call!64960 (+!4779 (ite c!126427 call!64957 (ite c!126426 call!64956 call!64955)) (ite (or c!126427 c!126426) (tuple2!23963 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun bm!64957 () Bool)

(assert (=> bm!64957 (= call!64955 call!64956)))

(declare-fun b!1338308 () Bool)

(assert (=> b!1338308 (= e!762168 e!762157)))

(declare-fun res!887797 () Bool)

(assert (=> b!1338308 (=> (not res!887797) (not e!762157))))

(assert (=> b!1338308 (= res!887797 (contains!9006 lt!593463 (select (arr!43884 _keys!1590) from!1980)))))

(assert (=> b!1338308 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44435 _keys!1590)))))

(declare-fun b!1338309 () Bool)

(declare-fun lt!593464 () Unit!43867)

(assert (=> b!1338309 (= e!762164 lt!593464)))

(declare-fun lt!593457 () ListLongMap!21627)

(assert (=> b!1338309 (= lt!593457 (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593458 () (_ BitVec 64))

(assert (=> b!1338309 (= lt!593458 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593454 () (_ BitVec 64))

(assert (=> b!1338309 (= lt!593454 (select (arr!43884 _keys!1590) from!1980))))

(declare-fun lt!593471 () Unit!43867)

(assert (=> b!1338309 (= lt!593471 (addStillContains!1192 lt!593457 lt!593458 zeroValue!1262 lt!593454))))

(assert (=> b!1338309 (contains!9006 (+!4779 lt!593457 (tuple2!23963 lt!593458 zeroValue!1262)) lt!593454)))

(declare-fun lt!593455 () Unit!43867)

(assert (=> b!1338309 (= lt!593455 lt!593471)))

(declare-fun lt!593465 () ListLongMap!21627)

(assert (=> b!1338309 (= lt!593465 (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593453 () (_ BitVec 64))

(assert (=> b!1338309 (= lt!593453 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593459 () (_ BitVec 64))

(assert (=> b!1338309 (= lt!593459 (select (arr!43884 _keys!1590) from!1980))))

(declare-fun lt!593472 () Unit!43867)

(declare-fun addApplyDifferent!571 (ListLongMap!21627 (_ BitVec 64) V!54353 (_ BitVec 64)) Unit!43867)

(assert (=> b!1338309 (= lt!593472 (addApplyDifferent!571 lt!593465 lt!593453 minValue!1262 lt!593459))))

(assert (=> b!1338309 (= (apply!1042 (+!4779 lt!593465 (tuple2!23963 lt!593453 minValue!1262)) lt!593459) (apply!1042 lt!593465 lt!593459))))

(declare-fun lt!593456 () Unit!43867)

(assert (=> b!1338309 (= lt!593456 lt!593472)))

(declare-fun lt!593461 () ListLongMap!21627)

(assert (=> b!1338309 (= lt!593461 (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593452 () (_ BitVec 64))

(assert (=> b!1338309 (= lt!593452 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593470 () (_ BitVec 64))

(assert (=> b!1338309 (= lt!593470 (select (arr!43884 _keys!1590) from!1980))))

(declare-fun lt!593460 () Unit!43867)

(assert (=> b!1338309 (= lt!593460 (addApplyDifferent!571 lt!593461 lt!593452 zeroValue!1262 lt!593470))))

(assert (=> b!1338309 (= (apply!1042 (+!4779 lt!593461 (tuple2!23963 lt!593452 zeroValue!1262)) lt!593470) (apply!1042 lt!593461 lt!593470))))

(declare-fun lt!593468 () Unit!43867)

(assert (=> b!1338309 (= lt!593468 lt!593460)))

(declare-fun lt!593466 () ListLongMap!21627)

(assert (=> b!1338309 (= lt!593466 (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593469 () (_ BitVec 64))

(assert (=> b!1338309 (= lt!593469 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593473 () (_ BitVec 64))

(assert (=> b!1338309 (= lt!593473 (select (arr!43884 _keys!1590) from!1980))))

(assert (=> b!1338309 (= lt!593464 (addApplyDifferent!571 lt!593466 lt!593469 minValue!1262 lt!593473))))

(assert (=> b!1338309 (= (apply!1042 (+!4779 lt!593466 (tuple2!23963 lt!593469 minValue!1262)) lt!593473) (apply!1042 lt!593466 lt!593473))))

(declare-fun b!1338310 () Bool)

(assert (=> b!1338310 (= e!762163 e!762160)))

(declare-fun res!887795 () Bool)

(assert (=> b!1338310 (= res!887795 call!64954)))

(assert (=> b!1338310 (=> (not res!887795) (not e!762160))))

(assert (= (and d!144149 c!126427) b!1338294))

(assert (= (and d!144149 (not c!126427)) b!1338296))

(assert (= (and b!1338296 c!126426) b!1338297))

(assert (= (and b!1338296 (not c!126426)) b!1338295))

(assert (= (and b!1338295 c!126431) b!1338290))

(assert (= (and b!1338295 (not c!126431)) b!1338301))

(assert (= (or b!1338290 b!1338301) bm!64957))

(assert (= (or b!1338297 bm!64957) bm!64951))

(assert (= (or b!1338297 b!1338290) bm!64953))

(assert (= (or b!1338294 bm!64951) bm!64954))

(assert (= (or b!1338294 bm!64953) bm!64956))

(assert (= (and d!144149 res!887801) b!1338298))

(assert (= (and d!144149 c!126428) b!1338309))

(assert (= (and d!144149 (not c!126428)) b!1338303))

(assert (= (and d!144149 res!887802) b!1338291))

(assert (= (and b!1338291 res!887803) b!1338305))

(assert (= (and b!1338291 (not res!887796)) b!1338308))

(assert (= (and b!1338308 res!887797) b!1338307))

(assert (= (and b!1338291 res!887799) b!1338302))

(assert (= (and b!1338302 c!126429) b!1338300))

(assert (= (and b!1338302 (not c!126429)) b!1338293))

(assert (= (and b!1338300 res!887798) b!1338306))

(assert (= (or b!1338300 b!1338293) bm!64955))

(assert (= (and b!1338302 res!887800) b!1338292))

(assert (= (and b!1338292 c!126430) b!1338310))

(assert (= (and b!1338292 (not c!126430)) b!1338304))

(assert (= (and b!1338310 res!887795) b!1338299))

(assert (= (or b!1338310 b!1338304) bm!64952))

(declare-fun b_lambda!24187 () Bool)

(assert (=> (not b_lambda!24187) (not b!1338307)))

(assert (=> b!1338307 t!45402))

(declare-fun b_and!50005 () Bool)

(assert (= b_and!49995 (and (=> t!45402 result!25287) b_and!50005)))

(declare-fun m!1226649 () Bool)

(assert (=> b!1338299 m!1226649))

(assert (=> d!144149 m!1226483))

(declare-fun m!1226651 () Bool)

(assert (=> b!1338306 m!1226651))

(assert (=> b!1338309 m!1226489))

(declare-fun m!1226653 () Bool)

(assert (=> b!1338309 m!1226653))

(declare-fun m!1226655 () Bool)

(assert (=> b!1338309 m!1226655))

(declare-fun m!1226657 () Bool)

(assert (=> b!1338309 m!1226657))

(declare-fun m!1226659 () Bool)

(assert (=> b!1338309 m!1226659))

(declare-fun m!1226661 () Bool)

(assert (=> b!1338309 m!1226661))

(declare-fun m!1226663 () Bool)

(assert (=> b!1338309 m!1226663))

(declare-fun m!1226665 () Bool)

(assert (=> b!1338309 m!1226665))

(declare-fun m!1226667 () Bool)

(assert (=> b!1338309 m!1226667))

(assert (=> b!1338309 m!1226655))

(assert (=> b!1338309 m!1226667))

(declare-fun m!1226669 () Bool)

(assert (=> b!1338309 m!1226669))

(declare-fun m!1226671 () Bool)

(assert (=> b!1338309 m!1226671))

(declare-fun m!1226673 () Bool)

(assert (=> b!1338309 m!1226673))

(declare-fun m!1226675 () Bool)

(assert (=> b!1338309 m!1226675))

(declare-fun m!1226677 () Bool)

(assert (=> b!1338309 m!1226677))

(declare-fun m!1226679 () Bool)

(assert (=> b!1338309 m!1226679))

(assert (=> b!1338309 m!1226675))

(declare-fun m!1226681 () Bool)

(assert (=> b!1338309 m!1226681))

(assert (=> b!1338309 m!1226653))

(declare-fun m!1226683 () Bool)

(assert (=> b!1338309 m!1226683))

(assert (=> b!1338307 m!1226489))

(assert (=> b!1338307 m!1226497))

(assert (=> b!1338307 m!1226509))

(assert (=> b!1338307 m!1226497))

(assert (=> b!1338307 m!1226515))

(assert (=> b!1338307 m!1226509))

(assert (=> b!1338307 m!1226489))

(declare-fun m!1226685 () Bool)

(assert (=> b!1338307 m!1226685))

(declare-fun m!1226687 () Bool)

(assert (=> bm!64952 m!1226687))

(assert (=> b!1338305 m!1226489))

(assert (=> b!1338305 m!1226489))

(assert (=> b!1338305 m!1226493))

(assert (=> b!1338308 m!1226489))

(assert (=> b!1338308 m!1226489))

(declare-fun m!1226689 () Bool)

(assert (=> b!1338308 m!1226689))

(declare-fun m!1226691 () Bool)

(assert (=> bm!64955 m!1226691))

(assert (=> bm!64954 m!1226663))

(declare-fun m!1226693 () Bool)

(assert (=> b!1338294 m!1226693))

(declare-fun m!1226695 () Bool)

(assert (=> bm!64956 m!1226695))

(assert (=> b!1338298 m!1226489))

(assert (=> b!1338298 m!1226489))

(assert (=> b!1338298 m!1226493))

(assert (=> b!1338133 d!144149))

(declare-fun d!144151 () Bool)

(assert (=> d!144151 (contains!9006 (+!4779 lt!593348 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-fun lt!593476 () Unit!43867)

(declare-fun choose!1963 (ListLongMap!21627 (_ BitVec 64) V!54353 (_ BitVec 64)) Unit!43867)

(assert (=> d!144151 (= lt!593476 (choose!1963 lt!593348 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> d!144151 (contains!9006 lt!593348 k0!1153)))

(assert (=> d!144151 (= (addStillContains!1192 lt!593348 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153) lt!593476)))

(declare-fun bs!38299 () Bool)

(assert (= bs!38299 d!144151))

(assert (=> bs!38299 m!1226505))

(assert (=> bs!38299 m!1226505))

(assert (=> bs!38299 m!1226517))

(declare-fun m!1226697 () Bool)

(assert (=> bs!38299 m!1226697))

(assert (=> bs!38299 m!1226499))

(assert (=> b!1338125 d!144151))

(declare-fun b!1338312 () Bool)

(declare-fun e!762179 () ListLongMap!21627)

(declare-fun call!64966 () ListLongMap!21627)

(assert (=> b!1338312 (= e!762179 call!64966)))

(declare-fun b!1338313 () Bool)

(declare-fun res!887808 () Bool)

(declare-fun e!762178 () Bool)

(assert (=> b!1338313 (=> (not res!887808) (not e!762178))))

(declare-fun e!762181 () Bool)

(assert (=> b!1338313 (= res!887808 e!762181)))

(declare-fun res!887805 () Bool)

(assert (=> b!1338313 (=> res!887805 e!762181)))

(declare-fun e!762172 () Bool)

(assert (=> b!1338313 (= res!887805 (not e!762172))))

(declare-fun res!887812 () Bool)

(assert (=> b!1338313 (=> (not res!887812) (not e!762172))))

(assert (=> b!1338313 (= res!887812 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44435 _keys!1590)))))

(declare-fun bm!64958 () Bool)

(declare-fun call!64963 () ListLongMap!21627)

(declare-fun call!64964 () ListLongMap!21627)

(assert (=> bm!64958 (= call!64963 call!64964)))

(declare-fun b!1338314 () Bool)

(declare-fun e!762176 () Bool)

(assert (=> b!1338314 (= e!762178 e!762176)))

(declare-fun c!126436 () Bool)

(assert (=> b!1338314 (= c!126436 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338315 () Bool)

(declare-fun e!762180 () Bool)

(declare-fun call!64965 () Bool)

(assert (=> b!1338315 (= e!762180 (not call!64965))))

(declare-fun b!1338316 () Bool)

(declare-fun e!762182 () ListLongMap!21627)

(declare-fun call!64967 () ListLongMap!21627)

(assert (=> b!1338316 (= e!762182 (+!4779 call!64967 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1338317 () Bool)

(declare-fun c!126437 () Bool)

(assert (=> b!1338317 (= c!126437 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!762171 () ListLongMap!21627)

(assert (=> b!1338317 (= e!762171 e!762179)))

(declare-fun d!144153 () Bool)

(assert (=> d!144153 e!762178))

(declare-fun res!887811 () Bool)

(assert (=> d!144153 (=> (not res!887811) (not e!762178))))

(assert (=> d!144153 (= res!887811 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44435 _keys!1590)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44435 _keys!1590)))))))

(declare-fun lt!593488 () ListLongMap!21627)

(declare-fun lt!593492 () ListLongMap!21627)

(assert (=> d!144153 (= lt!593488 lt!593492)))

(declare-fun lt!593487 () Unit!43867)

(declare-fun e!762177 () Unit!43867)

(assert (=> d!144153 (= lt!593487 e!762177)))

(declare-fun c!126434 () Bool)

(declare-fun e!762175 () Bool)

(assert (=> d!144153 (= c!126434 e!762175)))

(declare-fun res!887810 () Bool)

(assert (=> d!144153 (=> (not res!887810) (not e!762175))))

(assert (=> d!144153 (= res!887810 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44435 _keys!1590)))))

(assert (=> d!144153 (= lt!593492 e!762182)))

(declare-fun c!126433 () Bool)

(assert (=> d!144153 (= c!126433 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144153 (validMask!0 mask!1998)))

(assert (=> d!144153 (= (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593488)))

(declare-fun b!1338318 () Bool)

(assert (=> b!1338318 (= e!762182 e!762171)))

(declare-fun c!126432 () Bool)

(assert (=> b!1338318 (= c!126432 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338319 () Bool)

(assert (=> b!1338319 (= e!762171 call!64966)))

(declare-fun bm!64959 () Bool)

(declare-fun call!64961 () Bool)

(assert (=> bm!64959 (= call!64961 (contains!9006 lt!593488 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338320 () Bool)

(assert (=> b!1338320 (= e!762175 (validKeyInArray!0 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338321 () Bool)

(declare-fun e!762173 () Bool)

(assert (=> b!1338321 (= e!762173 (= (apply!1042 lt!593488 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun bm!64960 () Bool)

(assert (=> bm!64960 (= call!64966 call!64967)))

(declare-fun b!1338322 () Bool)

(declare-fun e!762174 () Bool)

(assert (=> b!1338322 (= e!762180 e!762174)))

(declare-fun res!887807 () Bool)

(assert (=> b!1338322 (= res!887807 call!64965)))

(assert (=> b!1338322 (=> (not res!887807) (not e!762174))))

(declare-fun b!1338323 () Bool)

(declare-fun call!64962 () ListLongMap!21627)

(assert (=> b!1338323 (= e!762179 call!64962)))

(declare-fun bm!64961 () Bool)

(assert (=> bm!64961 (= call!64964 (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1338324 () Bool)

(declare-fun res!887809 () Bool)

(assert (=> b!1338324 (=> (not res!887809) (not e!762178))))

(assert (=> b!1338324 (= res!887809 e!762180)))

(declare-fun c!126435 () Bool)

(assert (=> b!1338324 (= c!126435 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1338325 () Bool)

(declare-fun Unit!43875 () Unit!43867)

(assert (=> b!1338325 (= e!762177 Unit!43875)))

(declare-fun b!1338326 () Bool)

(assert (=> b!1338326 (= e!762176 (not call!64961))))

(declare-fun bm!64962 () Bool)

(assert (=> bm!64962 (= call!64965 (contains!9006 lt!593488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338327 () Bool)

(assert (=> b!1338327 (= e!762172 (validKeyInArray!0 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338328 () Bool)

(assert (=> b!1338328 (= e!762174 (= (apply!1042 lt!593488 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun e!762170 () Bool)

(declare-fun b!1338329 () Bool)

(assert (=> b!1338329 (= e!762170 (= (apply!1042 lt!593488 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22157 (select (arr!43885 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3733 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338329 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44436 _values!1320)))))

(assert (=> b!1338329 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44435 _keys!1590)))))

(declare-fun bm!64963 () Bool)

(assert (=> bm!64963 (= call!64967 (+!4779 (ite c!126433 call!64964 (ite c!126432 call!64963 call!64962)) (ite (or c!126433 c!126432) (tuple2!23963 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun bm!64964 () Bool)

(assert (=> bm!64964 (= call!64962 call!64963)))

(declare-fun b!1338330 () Bool)

(assert (=> b!1338330 (= e!762181 e!762170)))

(declare-fun res!887806 () Bool)

(assert (=> b!1338330 (=> (not res!887806) (not e!762170))))

(assert (=> b!1338330 (= res!887806 (contains!9006 lt!593488 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338330 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44435 _keys!1590)))))

(declare-fun b!1338331 () Bool)

(declare-fun lt!593489 () Unit!43867)

(assert (=> b!1338331 (= e!762177 lt!593489)))

(declare-fun lt!593482 () ListLongMap!21627)

(assert (=> b!1338331 (= lt!593482 (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593483 () (_ BitVec 64))

(assert (=> b!1338331 (= lt!593483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593479 () (_ BitVec 64))

(assert (=> b!1338331 (= lt!593479 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593496 () Unit!43867)

(assert (=> b!1338331 (= lt!593496 (addStillContains!1192 lt!593482 lt!593483 zeroValue!1262 lt!593479))))

(assert (=> b!1338331 (contains!9006 (+!4779 lt!593482 (tuple2!23963 lt!593483 zeroValue!1262)) lt!593479)))

(declare-fun lt!593480 () Unit!43867)

(assert (=> b!1338331 (= lt!593480 lt!593496)))

(declare-fun lt!593490 () ListLongMap!21627)

(assert (=> b!1338331 (= lt!593490 (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593478 () (_ BitVec 64))

(assert (=> b!1338331 (= lt!593478 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593484 () (_ BitVec 64))

(assert (=> b!1338331 (= lt!593484 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593497 () Unit!43867)

(assert (=> b!1338331 (= lt!593497 (addApplyDifferent!571 lt!593490 lt!593478 minValue!1262 lt!593484))))

(assert (=> b!1338331 (= (apply!1042 (+!4779 lt!593490 (tuple2!23963 lt!593478 minValue!1262)) lt!593484) (apply!1042 lt!593490 lt!593484))))

(declare-fun lt!593481 () Unit!43867)

(assert (=> b!1338331 (= lt!593481 lt!593497)))

(declare-fun lt!593486 () ListLongMap!21627)

(assert (=> b!1338331 (= lt!593486 (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593477 () (_ BitVec 64))

(assert (=> b!1338331 (= lt!593477 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593495 () (_ BitVec 64))

(assert (=> b!1338331 (= lt!593495 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593485 () Unit!43867)

(assert (=> b!1338331 (= lt!593485 (addApplyDifferent!571 lt!593486 lt!593477 zeroValue!1262 lt!593495))))

(assert (=> b!1338331 (= (apply!1042 (+!4779 lt!593486 (tuple2!23963 lt!593477 zeroValue!1262)) lt!593495) (apply!1042 lt!593486 lt!593495))))

(declare-fun lt!593493 () Unit!43867)

(assert (=> b!1338331 (= lt!593493 lt!593485)))

(declare-fun lt!593491 () ListLongMap!21627)

(assert (=> b!1338331 (= lt!593491 (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593494 () (_ BitVec 64))

(assert (=> b!1338331 (= lt!593494 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593498 () (_ BitVec 64))

(assert (=> b!1338331 (= lt!593498 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1338331 (= lt!593489 (addApplyDifferent!571 lt!593491 lt!593494 minValue!1262 lt!593498))))

(assert (=> b!1338331 (= (apply!1042 (+!4779 lt!593491 (tuple2!23963 lt!593494 minValue!1262)) lt!593498) (apply!1042 lt!593491 lt!593498))))

(declare-fun b!1338332 () Bool)

(assert (=> b!1338332 (= e!762176 e!762173)))

(declare-fun res!887804 () Bool)

(assert (=> b!1338332 (= res!887804 call!64961)))

(assert (=> b!1338332 (=> (not res!887804) (not e!762173))))

(assert (= (and d!144153 c!126433) b!1338316))

(assert (= (and d!144153 (not c!126433)) b!1338318))

(assert (= (and b!1338318 c!126432) b!1338319))

(assert (= (and b!1338318 (not c!126432)) b!1338317))

(assert (= (and b!1338317 c!126437) b!1338312))

(assert (= (and b!1338317 (not c!126437)) b!1338323))

(assert (= (or b!1338312 b!1338323) bm!64964))

(assert (= (or b!1338319 bm!64964) bm!64958))

(assert (= (or b!1338319 b!1338312) bm!64960))

(assert (= (or b!1338316 bm!64958) bm!64961))

(assert (= (or b!1338316 bm!64960) bm!64963))

(assert (= (and d!144153 res!887810) b!1338320))

(assert (= (and d!144153 c!126434) b!1338331))

(assert (= (and d!144153 (not c!126434)) b!1338325))

(assert (= (and d!144153 res!887811) b!1338313))

(assert (= (and b!1338313 res!887812) b!1338327))

(assert (= (and b!1338313 (not res!887805)) b!1338330))

(assert (= (and b!1338330 res!887806) b!1338329))

(assert (= (and b!1338313 res!887808) b!1338324))

(assert (= (and b!1338324 c!126435) b!1338322))

(assert (= (and b!1338324 (not c!126435)) b!1338315))

(assert (= (and b!1338322 res!887807) b!1338328))

(assert (= (or b!1338322 b!1338315) bm!64962))

(assert (= (and b!1338324 res!887809) b!1338314))

(assert (= (and b!1338314 c!126436) b!1338332))

(assert (= (and b!1338314 (not c!126436)) b!1338326))

(assert (= (and b!1338332 res!887804) b!1338321))

(assert (= (or b!1338332 b!1338326) bm!64959))

(declare-fun b_lambda!24189 () Bool)

(assert (=> (not b_lambda!24189) (not b!1338329)))

(assert (=> b!1338329 t!45402))

(declare-fun b_and!50007 () Bool)

(assert (= b_and!50005 (and (=> t!45402 result!25287) b_and!50007)))

(declare-fun m!1226699 () Bool)

(assert (=> b!1338321 m!1226699))

(assert (=> d!144153 m!1226483))

(declare-fun m!1226701 () Bool)

(assert (=> b!1338328 m!1226701))

(declare-fun m!1226703 () Bool)

(assert (=> b!1338331 m!1226703))

(declare-fun m!1226705 () Bool)

(assert (=> b!1338331 m!1226705))

(declare-fun m!1226707 () Bool)

(assert (=> b!1338331 m!1226707))

(declare-fun m!1226709 () Bool)

(assert (=> b!1338331 m!1226709))

(declare-fun m!1226711 () Bool)

(assert (=> b!1338331 m!1226711))

(declare-fun m!1226713 () Bool)

(assert (=> b!1338331 m!1226713))

(assert (=> b!1338331 m!1226507))

(declare-fun m!1226715 () Bool)

(assert (=> b!1338331 m!1226715))

(declare-fun m!1226717 () Bool)

(assert (=> b!1338331 m!1226717))

(assert (=> b!1338331 m!1226707))

(assert (=> b!1338331 m!1226717))

(declare-fun m!1226719 () Bool)

(assert (=> b!1338331 m!1226719))

(declare-fun m!1226721 () Bool)

(assert (=> b!1338331 m!1226721))

(declare-fun m!1226723 () Bool)

(assert (=> b!1338331 m!1226723))

(declare-fun m!1226725 () Bool)

(assert (=> b!1338331 m!1226725))

(declare-fun m!1226727 () Bool)

(assert (=> b!1338331 m!1226727))

(declare-fun m!1226729 () Bool)

(assert (=> b!1338331 m!1226729))

(assert (=> b!1338331 m!1226725))

(declare-fun m!1226731 () Bool)

(assert (=> b!1338331 m!1226731))

(assert (=> b!1338331 m!1226705))

(declare-fun m!1226733 () Bool)

(assert (=> b!1338331 m!1226733))

(assert (=> b!1338329 m!1226703))

(assert (=> b!1338329 m!1226497))

(declare-fun m!1226735 () Bool)

(assert (=> b!1338329 m!1226735))

(assert (=> b!1338329 m!1226497))

(declare-fun m!1226737 () Bool)

(assert (=> b!1338329 m!1226737))

(assert (=> b!1338329 m!1226735))

(assert (=> b!1338329 m!1226703))

(declare-fun m!1226739 () Bool)

(assert (=> b!1338329 m!1226739))

(declare-fun m!1226741 () Bool)

(assert (=> bm!64959 m!1226741))

(assert (=> b!1338327 m!1226703))

(assert (=> b!1338327 m!1226703))

(declare-fun m!1226743 () Bool)

(assert (=> b!1338327 m!1226743))

(assert (=> b!1338330 m!1226703))

(assert (=> b!1338330 m!1226703))

(declare-fun m!1226745 () Bool)

(assert (=> b!1338330 m!1226745))

(declare-fun m!1226747 () Bool)

(assert (=> bm!64962 m!1226747))

(assert (=> bm!64961 m!1226507))

(declare-fun m!1226749 () Bool)

(assert (=> b!1338316 m!1226749))

(declare-fun m!1226751 () Bool)

(assert (=> bm!64963 m!1226751))

(assert (=> b!1338320 m!1226703))

(assert (=> b!1338320 m!1226703))

(assert (=> b!1338320 m!1226743))

(assert (=> b!1338125 d!144153))

(declare-fun d!144155 () Bool)

(declare-fun c!126440 () Bool)

(assert (=> d!144155 (= c!126440 ((_ is ValueCellFull!17570) (select (arr!43885 _values!1320) from!1980)))))

(declare-fun e!762185 () V!54353)

(assert (=> d!144155 (= (get!22157 (select (arr!43885 _values!1320) from!1980) (dynLambda!3733 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!762185)))

(declare-fun b!1338337 () Bool)

(declare-fun get!22160 (ValueCell!17570 V!54353) V!54353)

(assert (=> b!1338337 (= e!762185 (get!22160 (select (arr!43885 _values!1320) from!1980) (dynLambda!3733 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338338 () Bool)

(declare-fun get!22161 (ValueCell!17570 V!54353) V!54353)

(assert (=> b!1338338 (= e!762185 (get!22161 (select (arr!43885 _values!1320) from!1980) (dynLambda!3733 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144155 c!126440) b!1338337))

(assert (= (and d!144155 (not c!126440)) b!1338338))

(assert (=> b!1338337 m!1226509))

(assert (=> b!1338337 m!1226497))

(declare-fun m!1226753 () Bool)

(assert (=> b!1338337 m!1226753))

(assert (=> b!1338338 m!1226509))

(assert (=> b!1338338 m!1226497))

(declare-fun m!1226755 () Bool)

(assert (=> b!1338338 m!1226755))

(assert (=> b!1338125 d!144155))

(declare-fun d!144157 () Bool)

(assert (=> d!144157 (contains!9006 lt!593350 k0!1153)))

(declare-fun lt!593501 () Unit!43867)

(declare-fun choose!1964 ((_ BitVec 64) (_ BitVec 64) V!54353 ListLongMap!21627) Unit!43867)

(assert (=> d!144157 (= lt!593501 (choose!1964 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!593350))))

(assert (=> d!144157 (contains!9006 (+!4779 lt!593350 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(assert (=> d!144157 (= (lemmaInListMapAfterAddingDiffThenInBefore!314 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!593350) lt!593501)))

(declare-fun bs!38300 () Bool)

(assert (= bs!38300 d!144157))

(assert (=> bs!38300 m!1226519))

(declare-fun m!1226757 () Bool)

(assert (=> bs!38300 m!1226757))

(declare-fun m!1226759 () Bool)

(assert (=> bs!38300 m!1226759))

(assert (=> bs!38300 m!1226759))

(declare-fun m!1226761 () Bool)

(assert (=> bs!38300 m!1226761))

(assert (=> b!1338125 d!144157))

(declare-fun d!144159 () Bool)

(declare-fun e!762188 () Bool)

(assert (=> d!144159 e!762188))

(declare-fun res!887818 () Bool)

(assert (=> d!144159 (=> (not res!887818) (not e!762188))))

(declare-fun lt!593512 () ListLongMap!21627)

(assert (=> d!144159 (= res!887818 (contains!9006 lt!593512 (_1!11992 (tuple2!23963 (select (arr!43884 _keys!1590) from!1980) lt!593346))))))

(declare-fun lt!593513 () List!31103)

(assert (=> d!144159 (= lt!593512 (ListLongMap!21628 lt!593513))))

(declare-fun lt!593511 () Unit!43867)

(declare-fun lt!593510 () Unit!43867)

(assert (=> d!144159 (= lt!593511 lt!593510)))

(assert (=> d!144159 (= (getValueByKey!712 lt!593513 (_1!11992 (tuple2!23963 (select (arr!43884 _keys!1590) from!1980) lt!593346))) (Some!762 (_2!11992 (tuple2!23963 (select (arr!43884 _keys!1590) from!1980) lt!593346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!362 (List!31103 (_ BitVec 64) V!54353) Unit!43867)

(assert (=> d!144159 (= lt!593510 (lemmaContainsTupThenGetReturnValue!362 lt!593513 (_1!11992 (tuple2!23963 (select (arr!43884 _keys!1590) from!1980) lt!593346)) (_2!11992 (tuple2!23963 (select (arr!43884 _keys!1590) from!1980) lt!593346))))))

(declare-fun insertStrictlySorted!491 (List!31103 (_ BitVec 64) V!54353) List!31103)

(assert (=> d!144159 (= lt!593513 (insertStrictlySorted!491 (toList!10829 lt!593348) (_1!11992 (tuple2!23963 (select (arr!43884 _keys!1590) from!1980) lt!593346)) (_2!11992 (tuple2!23963 (select (arr!43884 _keys!1590) from!1980) lt!593346))))))

(assert (=> d!144159 (= (+!4779 lt!593348 (tuple2!23963 (select (arr!43884 _keys!1590) from!1980) lt!593346)) lt!593512)))

(declare-fun b!1338343 () Bool)

(declare-fun res!887817 () Bool)

(assert (=> b!1338343 (=> (not res!887817) (not e!762188))))

(assert (=> b!1338343 (= res!887817 (= (getValueByKey!712 (toList!10829 lt!593512) (_1!11992 (tuple2!23963 (select (arr!43884 _keys!1590) from!1980) lt!593346))) (Some!762 (_2!11992 (tuple2!23963 (select (arr!43884 _keys!1590) from!1980) lt!593346)))))))

(declare-fun b!1338344 () Bool)

(declare-fun contains!9010 (List!31103 tuple2!23962) Bool)

(assert (=> b!1338344 (= e!762188 (contains!9010 (toList!10829 lt!593512) (tuple2!23963 (select (arr!43884 _keys!1590) from!1980) lt!593346)))))

(assert (= (and d!144159 res!887818) b!1338343))

(assert (= (and b!1338343 res!887817) b!1338344))

(declare-fun m!1226763 () Bool)

(assert (=> d!144159 m!1226763))

(declare-fun m!1226765 () Bool)

(assert (=> d!144159 m!1226765))

(declare-fun m!1226767 () Bool)

(assert (=> d!144159 m!1226767))

(declare-fun m!1226769 () Bool)

(assert (=> d!144159 m!1226769))

(declare-fun m!1226771 () Bool)

(assert (=> b!1338343 m!1226771))

(declare-fun m!1226773 () Bool)

(assert (=> b!1338344 m!1226773))

(assert (=> b!1338125 d!144159))

(declare-fun d!144161 () Bool)

(declare-fun e!762190 () Bool)

(assert (=> d!144161 e!762190))

(declare-fun res!887819 () Bool)

(assert (=> d!144161 (=> res!887819 e!762190)))

(declare-fun lt!593517 () Bool)

(assert (=> d!144161 (= res!887819 (not lt!593517))))

(declare-fun lt!593514 () Bool)

(assert (=> d!144161 (= lt!593517 lt!593514)))

(declare-fun lt!593515 () Unit!43867)

(declare-fun e!762189 () Unit!43867)

(assert (=> d!144161 (= lt!593515 e!762189)))

(declare-fun c!126441 () Bool)

(assert (=> d!144161 (= c!126441 lt!593514)))

(assert (=> d!144161 (= lt!593514 (containsKey!738 (toList!10829 lt!593348) k0!1153))))

(assert (=> d!144161 (= (contains!9006 lt!593348 k0!1153) lt!593517)))

(declare-fun b!1338345 () Bool)

(declare-fun lt!593516 () Unit!43867)

(assert (=> b!1338345 (= e!762189 lt!593516)))

(assert (=> b!1338345 (= lt!593516 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10829 lt!593348) k0!1153))))

(assert (=> b!1338345 (isDefined!521 (getValueByKey!712 (toList!10829 lt!593348) k0!1153))))

(declare-fun b!1338346 () Bool)

(declare-fun Unit!43876 () Unit!43867)

(assert (=> b!1338346 (= e!762189 Unit!43876)))

(declare-fun b!1338347 () Bool)

(assert (=> b!1338347 (= e!762190 (isDefined!521 (getValueByKey!712 (toList!10829 lt!593348) k0!1153)))))

(assert (= (and d!144161 c!126441) b!1338345))

(assert (= (and d!144161 (not c!126441)) b!1338346))

(assert (= (and d!144161 (not res!887819)) b!1338347))

(declare-fun m!1226775 () Bool)

(assert (=> d!144161 m!1226775))

(declare-fun m!1226777 () Bool)

(assert (=> b!1338345 m!1226777))

(declare-fun m!1226779 () Bool)

(assert (=> b!1338345 m!1226779))

(assert (=> b!1338345 m!1226779))

(declare-fun m!1226781 () Bool)

(assert (=> b!1338345 m!1226781))

(assert (=> b!1338347 m!1226779))

(assert (=> b!1338347 m!1226779))

(assert (=> b!1338347 m!1226781))

(assert (=> b!1338125 d!144161))

(declare-fun d!144163 () Bool)

(declare-fun e!762192 () Bool)

(assert (=> d!144163 e!762192))

(declare-fun res!887820 () Bool)

(assert (=> d!144163 (=> res!887820 e!762192)))

(declare-fun lt!593521 () Bool)

(assert (=> d!144163 (= res!887820 (not lt!593521))))

(declare-fun lt!593518 () Bool)

(assert (=> d!144163 (= lt!593521 lt!593518)))

(declare-fun lt!593519 () Unit!43867)

(declare-fun e!762191 () Unit!43867)

(assert (=> d!144163 (= lt!593519 e!762191)))

(declare-fun c!126442 () Bool)

(assert (=> d!144163 (= c!126442 lt!593518)))

(assert (=> d!144163 (= lt!593518 (containsKey!738 (toList!10829 (+!4779 lt!593348 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(assert (=> d!144163 (= (contains!9006 (+!4779 lt!593348 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153) lt!593521)))

(declare-fun b!1338348 () Bool)

(declare-fun lt!593520 () Unit!43867)

(assert (=> b!1338348 (= e!762191 lt!593520)))

(assert (=> b!1338348 (= lt!593520 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10829 (+!4779 lt!593348 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(assert (=> b!1338348 (isDefined!521 (getValueByKey!712 (toList!10829 (+!4779 lt!593348 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun b!1338349 () Bool)

(declare-fun Unit!43877 () Unit!43867)

(assert (=> b!1338349 (= e!762191 Unit!43877)))

(declare-fun b!1338350 () Bool)

(assert (=> b!1338350 (= e!762192 (isDefined!521 (getValueByKey!712 (toList!10829 (+!4779 lt!593348 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153)))))

(assert (= (and d!144163 c!126442) b!1338348))

(assert (= (and d!144163 (not c!126442)) b!1338349))

(assert (= (and d!144163 (not res!887820)) b!1338350))

(declare-fun m!1226783 () Bool)

(assert (=> d!144163 m!1226783))

(declare-fun m!1226785 () Bool)

(assert (=> b!1338348 m!1226785))

(declare-fun m!1226787 () Bool)

(assert (=> b!1338348 m!1226787))

(assert (=> b!1338348 m!1226787))

(declare-fun m!1226789 () Bool)

(assert (=> b!1338348 m!1226789))

(assert (=> b!1338350 m!1226787))

(assert (=> b!1338350 m!1226787))

(assert (=> b!1338350 m!1226789))

(assert (=> b!1338125 d!144163))

(declare-fun d!144165 () Bool)

(assert (=> d!144165 (contains!9006 lt!593348 k0!1153)))

(declare-fun lt!593522 () Unit!43867)

(assert (=> d!144165 (= lt!593522 (choose!1964 k0!1153 (select (arr!43884 _keys!1590) from!1980) lt!593346 lt!593348))))

(assert (=> d!144165 (contains!9006 (+!4779 lt!593348 (tuple2!23963 (select (arr!43884 _keys!1590) from!1980) lt!593346)) k0!1153)))

(assert (=> d!144165 (= (lemmaInListMapAfterAddingDiffThenInBefore!314 k0!1153 (select (arr!43884 _keys!1590) from!1980) lt!593346 lt!593348) lt!593522)))

(declare-fun bs!38301 () Bool)

(assert (= bs!38301 d!144165))

(assert (=> bs!38301 m!1226499))

(assert (=> bs!38301 m!1226489))

(declare-fun m!1226791 () Bool)

(assert (=> bs!38301 m!1226791))

(assert (=> bs!38301 m!1226501))

(assert (=> bs!38301 m!1226501))

(declare-fun m!1226793 () Bool)

(assert (=> bs!38301 m!1226793))

(assert (=> b!1338125 d!144165))

(declare-fun d!144167 () Bool)

(declare-fun e!762193 () Bool)

(assert (=> d!144167 e!762193))

(declare-fun res!887822 () Bool)

(assert (=> d!144167 (=> (not res!887822) (not e!762193))))

(declare-fun lt!593525 () ListLongMap!21627)

(assert (=> d!144167 (= res!887822 (contains!9006 lt!593525 (_1!11992 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!593526 () List!31103)

(assert (=> d!144167 (= lt!593525 (ListLongMap!21628 lt!593526))))

(declare-fun lt!593524 () Unit!43867)

(declare-fun lt!593523 () Unit!43867)

(assert (=> d!144167 (= lt!593524 lt!593523)))

(assert (=> d!144167 (= (getValueByKey!712 lt!593526 (_1!11992 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!762 (_2!11992 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144167 (= lt!593523 (lemmaContainsTupThenGetReturnValue!362 lt!593526 (_1!11992 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11992 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144167 (= lt!593526 (insertStrictlySorted!491 (toList!10829 lt!593348) (_1!11992 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11992 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!144167 (= (+!4779 lt!593348 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!593525)))

(declare-fun b!1338351 () Bool)

(declare-fun res!887821 () Bool)

(assert (=> b!1338351 (=> (not res!887821) (not e!762193))))

(assert (=> b!1338351 (= res!887821 (= (getValueByKey!712 (toList!10829 lt!593525) (_1!11992 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!762 (_2!11992 (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1338352 () Bool)

(assert (=> b!1338352 (= e!762193 (contains!9010 (toList!10829 lt!593525) (tuple2!23963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!144167 res!887822) b!1338351))

(assert (= (and b!1338351 res!887821) b!1338352))

(declare-fun m!1226795 () Bool)

(assert (=> d!144167 m!1226795))

(declare-fun m!1226797 () Bool)

(assert (=> d!144167 m!1226797))

(declare-fun m!1226799 () Bool)

(assert (=> d!144167 m!1226799))

(declare-fun m!1226801 () Bool)

(assert (=> d!144167 m!1226801))

(declare-fun m!1226803 () Bool)

(assert (=> b!1338351 m!1226803))

(declare-fun m!1226805 () Bool)

(assert (=> b!1338352 m!1226805))

(assert (=> b!1338125 d!144167))

(declare-fun bm!64967 () Bool)

(declare-fun call!64970 () ListLongMap!21627)

(assert (=> bm!64967 (= call!64970 (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1338377 () Bool)

(declare-fun lt!593545 () Unit!43867)

(declare-fun lt!593546 () Unit!43867)

(assert (=> b!1338377 (= lt!593545 lt!593546)))

(declare-fun lt!593547 () ListLongMap!21627)

(declare-fun lt!593542 () V!54353)

(declare-fun lt!593544 () (_ BitVec 64))

(declare-fun lt!593541 () (_ BitVec 64))

(assert (=> b!1338377 (not (contains!9006 (+!4779 lt!593547 (tuple2!23963 lt!593544 lt!593542)) lt!593541))))

(declare-fun addStillNotContains!498 (ListLongMap!21627 (_ BitVec 64) V!54353 (_ BitVec 64)) Unit!43867)

(assert (=> b!1338377 (= lt!593546 (addStillNotContains!498 lt!593547 lt!593544 lt!593542 lt!593541))))

(assert (=> b!1338377 (= lt!593541 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1338377 (= lt!593542 (get!22157 (select (arr!43885 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3733 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1338377 (= lt!593544 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1338377 (= lt!593547 call!64970)))

(declare-fun e!762208 () ListLongMap!21627)

(assert (=> b!1338377 (= e!762208 (+!4779 call!64970 (tuple2!23963 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22157 (select (arr!43885 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3733 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1338378 () Bool)

(declare-fun e!762211 () Bool)

(declare-fun e!762210 () Bool)

(assert (=> b!1338378 (= e!762211 e!762210)))

(assert (=> b!1338378 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44435 _keys!1590)))))

(declare-fun res!887831 () Bool)

(declare-fun lt!593543 () ListLongMap!21627)

(assert (=> b!1338378 (= res!887831 (contains!9006 lt!593543 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338378 (=> (not res!887831) (not e!762210))))

(declare-fun b!1338379 () Bool)

(declare-fun e!762212 () Bool)

(assert (=> b!1338379 (= e!762212 (validKeyInArray!0 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338379 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1338380 () Bool)

(declare-fun e!762209 () Bool)

(declare-fun isEmpty!1088 (ListLongMap!21627) Bool)

(assert (=> b!1338380 (= e!762209 (isEmpty!1088 lt!593543))))

(declare-fun b!1338381 () Bool)

(assert (=> b!1338381 (= e!762209 (= lt!593543 (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1338382 () Bool)

(declare-fun res!887832 () Bool)

(declare-fun e!762213 () Bool)

(assert (=> b!1338382 (=> (not res!887832) (not e!762213))))

(assert (=> b!1338382 (= res!887832 (not (contains!9006 lt!593543 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338383 () Bool)

(assert (=> b!1338383 (= e!762211 e!762209)))

(declare-fun c!126451 () Bool)

(assert (=> b!1338383 (= c!126451 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44435 _keys!1590)))))

(declare-fun b!1338384 () Bool)

(declare-fun e!762214 () ListLongMap!21627)

(assert (=> b!1338384 (= e!762214 (ListLongMap!21628 Nil!31100))))

(declare-fun d!144169 () Bool)

(assert (=> d!144169 e!762213))

(declare-fun res!887833 () Bool)

(assert (=> d!144169 (=> (not res!887833) (not e!762213))))

(assert (=> d!144169 (= res!887833 (not (contains!9006 lt!593543 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!144169 (= lt!593543 e!762214)))

(declare-fun c!126452 () Bool)

(assert (=> d!144169 (= c!126452 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44435 _keys!1590)))))

(assert (=> d!144169 (validMask!0 mask!1998)))

(assert (=> d!144169 (= (getCurrentListMapNoExtraKeys!6428 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593543)))

(declare-fun b!1338385 () Bool)

(assert (=> b!1338385 (= e!762214 e!762208)))

(declare-fun c!126453 () Bool)

(assert (=> b!1338385 (= c!126453 (validKeyInArray!0 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338386 () Bool)

(assert (=> b!1338386 (= e!762208 call!64970)))

(declare-fun b!1338387 () Bool)

(assert (=> b!1338387 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44435 _keys!1590)))))

(assert (=> b!1338387 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44436 _values!1320)))))

(assert (=> b!1338387 (= e!762210 (= (apply!1042 lt!593543 (select (arr!43884 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22157 (select (arr!43885 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3733 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1338388 () Bool)

(assert (=> b!1338388 (= e!762213 e!762211)))

(declare-fun c!126454 () Bool)

(assert (=> b!1338388 (= c!126454 e!762212)))

(declare-fun res!887834 () Bool)

(assert (=> b!1338388 (=> (not res!887834) (not e!762212))))

(assert (=> b!1338388 (= res!887834 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44435 _keys!1590)))))

(assert (= (and d!144169 c!126452) b!1338384))

(assert (= (and d!144169 (not c!126452)) b!1338385))

(assert (= (and b!1338385 c!126453) b!1338377))

(assert (= (and b!1338385 (not c!126453)) b!1338386))

(assert (= (or b!1338377 b!1338386) bm!64967))

(assert (= (and d!144169 res!887833) b!1338382))

(assert (= (and b!1338382 res!887832) b!1338388))

(assert (= (and b!1338388 res!887834) b!1338379))

(assert (= (and b!1338388 c!126454) b!1338378))

(assert (= (and b!1338388 (not c!126454)) b!1338383))

(assert (= (and b!1338378 res!887831) b!1338387))

(assert (= (and b!1338383 c!126451) b!1338381))

(assert (= (and b!1338383 (not c!126451)) b!1338380))

(declare-fun b_lambda!24191 () Bool)

(assert (=> (not b_lambda!24191) (not b!1338377)))

(assert (=> b!1338377 t!45402))

(declare-fun b_and!50009 () Bool)

(assert (= b_and!50007 (and (=> t!45402 result!25287) b_and!50009)))

(declare-fun b_lambda!24193 () Bool)

(assert (=> (not b_lambda!24193) (not b!1338387)))

(assert (=> b!1338387 t!45402))

(declare-fun b_and!50011 () Bool)

(assert (= b_and!50009 (and (=> t!45402 result!25287) b_and!50011)))

(assert (=> b!1338378 m!1226703))

(assert (=> b!1338378 m!1226703))

(declare-fun m!1226807 () Bool)

(assert (=> b!1338378 m!1226807))

(declare-fun m!1226809 () Bool)

(assert (=> d!144169 m!1226809))

(assert (=> d!144169 m!1226483))

(assert (=> b!1338377 m!1226735))

(declare-fun m!1226811 () Bool)

(assert (=> b!1338377 m!1226811))

(declare-fun m!1226813 () Bool)

(assert (=> b!1338377 m!1226813))

(assert (=> b!1338377 m!1226735))

(assert (=> b!1338377 m!1226497))

(assert (=> b!1338377 m!1226737))

(declare-fun m!1226815 () Bool)

(assert (=> b!1338377 m!1226815))

(assert (=> b!1338377 m!1226813))

(declare-fun m!1226817 () Bool)

(assert (=> b!1338377 m!1226817))

(assert (=> b!1338377 m!1226497))

(assert (=> b!1338377 m!1226703))

(declare-fun m!1226819 () Bool)

(assert (=> b!1338380 m!1226819))

(assert (=> b!1338379 m!1226703))

(assert (=> b!1338379 m!1226703))

(assert (=> b!1338379 m!1226743))

(declare-fun m!1226821 () Bool)

(assert (=> b!1338381 m!1226821))

(declare-fun m!1226823 () Bool)

(assert (=> b!1338382 m!1226823))

(assert (=> b!1338385 m!1226703))

(assert (=> b!1338385 m!1226703))

(assert (=> b!1338385 m!1226743))

(assert (=> bm!64967 m!1226821))

(assert (=> b!1338387 m!1226735))

(assert (=> b!1338387 m!1226703))

(declare-fun m!1226825 () Bool)

(assert (=> b!1338387 m!1226825))

(assert (=> b!1338387 m!1226735))

(assert (=> b!1338387 m!1226497))

(assert (=> b!1338387 m!1226737))

(assert (=> b!1338387 m!1226497))

(assert (=> b!1338387 m!1226703))

(assert (=> b!1338125 d!144169))

(declare-fun d!144171 () Bool)

(declare-fun e!762216 () Bool)

(assert (=> d!144171 e!762216))

(declare-fun res!887835 () Bool)

(assert (=> d!144171 (=> res!887835 e!762216)))

(declare-fun lt!593551 () Bool)

(assert (=> d!144171 (= res!887835 (not lt!593551))))

(declare-fun lt!593548 () Bool)

(assert (=> d!144171 (= lt!593551 lt!593548)))

(declare-fun lt!593549 () Unit!43867)

(declare-fun e!762215 () Unit!43867)

(assert (=> d!144171 (= lt!593549 e!762215)))

(declare-fun c!126455 () Bool)

(assert (=> d!144171 (= c!126455 lt!593548)))

(assert (=> d!144171 (= lt!593548 (containsKey!738 (toList!10829 lt!593350) k0!1153))))

(assert (=> d!144171 (= (contains!9006 lt!593350 k0!1153) lt!593551)))

(declare-fun b!1338389 () Bool)

(declare-fun lt!593550 () Unit!43867)

(assert (=> b!1338389 (= e!762215 lt!593550)))

(assert (=> b!1338389 (= lt!593550 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10829 lt!593350) k0!1153))))

(assert (=> b!1338389 (isDefined!521 (getValueByKey!712 (toList!10829 lt!593350) k0!1153))))

(declare-fun b!1338390 () Bool)

(declare-fun Unit!43878 () Unit!43867)

(assert (=> b!1338390 (= e!762215 Unit!43878)))

(declare-fun b!1338391 () Bool)

(assert (=> b!1338391 (= e!762216 (isDefined!521 (getValueByKey!712 (toList!10829 lt!593350) k0!1153)))))

(assert (= (and d!144171 c!126455) b!1338389))

(assert (= (and d!144171 (not c!126455)) b!1338390))

(assert (= (and d!144171 (not res!887835)) b!1338391))

(declare-fun m!1226827 () Bool)

(assert (=> d!144171 m!1226827))

(declare-fun m!1226829 () Bool)

(assert (=> b!1338389 m!1226829))

(declare-fun m!1226831 () Bool)

(assert (=> b!1338389 m!1226831))

(assert (=> b!1338389 m!1226831))

(declare-fun m!1226833 () Bool)

(assert (=> b!1338389 m!1226833))

(assert (=> b!1338391 m!1226831))

(assert (=> b!1338391 m!1226831))

(assert (=> b!1338391 m!1226833))

(assert (=> b!1338125 d!144171))

(declare-fun d!144173 () Bool)

(declare-fun e!762218 () Bool)

(assert (=> d!144173 e!762218))

(declare-fun res!887836 () Bool)

(assert (=> d!144173 (=> res!887836 e!762218)))

(declare-fun lt!593555 () Bool)

(assert (=> d!144173 (= res!887836 (not lt!593555))))

(declare-fun lt!593552 () Bool)

(assert (=> d!144173 (= lt!593555 lt!593552)))

(declare-fun lt!593553 () Unit!43867)

(declare-fun e!762217 () Unit!43867)

(assert (=> d!144173 (= lt!593553 e!762217)))

(declare-fun c!126456 () Bool)

(assert (=> d!144173 (= c!126456 lt!593552)))

(assert (=> d!144173 (= lt!593552 (containsKey!738 (toList!10829 (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (=> d!144173 (= (contains!9006 (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153) lt!593555)))

(declare-fun b!1338392 () Bool)

(declare-fun lt!593554 () Unit!43867)

(assert (=> b!1338392 (= e!762217 lt!593554)))

(assert (=> b!1338392 (= lt!593554 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10829 (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (=> b!1338392 (isDefined!521 (getValueByKey!712 (toList!10829 (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun b!1338393 () Bool)

(declare-fun Unit!43879 () Unit!43867)

(assert (=> b!1338393 (= e!762217 Unit!43879)))

(declare-fun b!1338394 () Bool)

(assert (=> b!1338394 (= e!762218 (isDefined!521 (getValueByKey!712 (toList!10829 (getCurrentListMap!5783 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153)))))

(assert (= (and d!144173 c!126456) b!1338392))

(assert (= (and d!144173 (not c!126456)) b!1338393))

(assert (= (and d!144173 (not res!887836)) b!1338394))

(declare-fun m!1226835 () Bool)

(assert (=> d!144173 m!1226835))

(declare-fun m!1226837 () Bool)

(assert (=> b!1338392 m!1226837))

(declare-fun m!1226839 () Bool)

(assert (=> b!1338392 m!1226839))

(assert (=> b!1338392 m!1226839))

(declare-fun m!1226841 () Bool)

(assert (=> b!1338392 m!1226841))

(assert (=> b!1338394 m!1226839))

(assert (=> b!1338394 m!1226839))

(assert (=> b!1338394 m!1226841))

(assert (=> b!1338125 d!144173))

(declare-fun condMapEmpty!57092 () Bool)

(declare-fun mapDefault!57092 () ValueCell!17570)

(assert (=> mapNonEmpty!57083 (= condMapEmpty!57092 (= mapRest!57083 ((as const (Array (_ BitVec 32) ValueCell!17570)) mapDefault!57092)))))

(declare-fun e!762223 () Bool)

(declare-fun mapRes!57092 () Bool)

(assert (=> mapNonEmpty!57083 (= tp!108721 (and e!762223 mapRes!57092))))

(declare-fun mapNonEmpty!57092 () Bool)

(declare-fun tp!108737 () Bool)

(declare-fun e!762224 () Bool)

(assert (=> mapNonEmpty!57092 (= mapRes!57092 (and tp!108737 e!762224))))

(declare-fun mapKey!57092 () (_ BitVec 32))

(declare-fun mapValue!57092 () ValueCell!17570)

(declare-fun mapRest!57092 () (Array (_ BitVec 32) ValueCell!17570))

(assert (=> mapNonEmpty!57092 (= mapRest!57083 (store mapRest!57092 mapKey!57092 mapValue!57092))))

(declare-fun b!1338401 () Bool)

(assert (=> b!1338401 (= e!762224 tp_is_empty!36937)))

(declare-fun b!1338402 () Bool)

(assert (=> b!1338402 (= e!762223 tp_is_empty!36937)))

(declare-fun mapIsEmpty!57092 () Bool)

(assert (=> mapIsEmpty!57092 mapRes!57092))

(assert (= (and mapNonEmpty!57083 condMapEmpty!57092) mapIsEmpty!57092))

(assert (= (and mapNonEmpty!57083 (not condMapEmpty!57092)) mapNonEmpty!57092))

(assert (= (and mapNonEmpty!57092 ((_ is ValueCellFull!17570) mapValue!57092)) b!1338401))

(assert (= (and mapNonEmpty!57083 ((_ is ValueCellFull!17570) mapDefault!57092)) b!1338402))

(declare-fun m!1226843 () Bool)

(assert (=> mapNonEmpty!57092 m!1226843))

(declare-fun b_lambda!24195 () Bool)

(assert (= b_lambda!24191 (or (and start!112914 b_free!31027) b_lambda!24195)))

(declare-fun b_lambda!24197 () Bool)

(assert (= b_lambda!24193 (or (and start!112914 b_free!31027) b_lambda!24197)))

(declare-fun b_lambda!24199 () Bool)

(assert (= b_lambda!24187 (or (and start!112914 b_free!31027) b_lambda!24199)))

(declare-fun b_lambda!24201 () Bool)

(assert (= b_lambda!24189 (or (and start!112914 b_free!31027) b_lambda!24201)))

(check-sat (not b!1338306) (not b!1338337) (not d!144159) (not b!1338351) (not b!1338378) (not b!1338307) (not b!1338294) (not bm!64956) (not bm!64967) (not b!1338394) (not bm!64952) (not b!1338316) (not b!1338350) (not d!144167) (not b!1338238) (not b!1338392) (not d!144157) (not b!1338338) (not b_lambda!24199) (not b_lambda!24185) (not b!1338299) (not b!1338345) (not b!1338237) (not b!1338344) (not d!144169) (not d!144171) (not b!1338309) (not b!1338327) (not b!1338387) (not b!1338320) (not d!144151) (not bm!64955) (not b!1338247) (not b!1338382) (not b!1338379) (not d!144163) (not b!1338224) (not b!1338377) (not b!1338380) (not b!1338222) (not b!1338391) (not bm!64954) (not d!144149) (not bm!64963) (not b!1338328) (not b!1338305) (not b_next!31027) (not d!144161) (not mapNonEmpty!57092) (not b!1338352) (not d!144147) (not d!144165) b_and!50011 (not b!1338348) (not d!144153) (not b_lambda!24195) (not bm!64959) (not b!1338321) (not bm!64962) (not b!1338308) (not b_lambda!24201) (not b_lambda!24197) (not b!1338245) (not b!1338389) (not b!1338385) (not b!1338330) (not b!1338298) (not b!1338381) (not bm!64936) (not b!1338347) tp_is_empty!36937 (not b!1338223) (not bm!64933) (not b!1338343) (not d!144173) (not bm!64961) (not b!1338331) (not b!1338329))
(check-sat b_and!50011 (not b_next!31027))
