; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112590 () Bool)

(assert start!112590)

(declare-fun b_free!30985 () Bool)

(declare-fun b_next!30985 () Bool)

(assert (=> start!112590 (= b_free!30985 (not b_next!30985))))

(declare-fun tp!108592 () Bool)

(declare-fun b_and!49875 () Bool)

(assert (=> start!112590 (= tp!108592 b_and!49875)))

(declare-fun b!1335571 () Bool)

(declare-fun res!886421 () Bool)

(declare-fun e!760638 () Bool)

(assert (=> b!1335571 (=> (not res!886421) (not e!760638))))

(declare-datatypes ((array!90595 0))(
  ( (array!90596 (arr!43764 (Array (_ BitVec 32) (_ BitVec 64))) (size!44316 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90595)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90595 (_ BitVec 32)) Bool)

(assert (=> b!1335571 (= res!886421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335572 () Bool)

(declare-fun res!886428 () Bool)

(assert (=> b!1335572 (=> (not res!886428) (not e!760638))))

(declare-datatypes ((V!54297 0))(
  ( (V!54298 (val!18522 Int)) )
))
(declare-datatypes ((ValueCell!17549 0))(
  ( (ValueCellFull!17549 (v!21158 V!54297)) (EmptyCell!17549) )
))
(declare-datatypes ((array!90597 0))(
  ( (array!90598 (arr!43765 (Array (_ BitVec 32) ValueCell!17549)) (size!44317 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90597)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1335572 (= res!886428 (and (= (size!44317 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44316 _keys!1590) (size!44317 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335573 () Bool)

(declare-fun e!760639 () Bool)

(declare-fun tp_is_empty!36895 () Bool)

(assert (=> b!1335573 (= e!760639 tp_is_empty!36895)))

(declare-fun mapNonEmpty!57016 () Bool)

(declare-fun mapRes!57016 () Bool)

(declare-fun tp!108593 () Bool)

(assert (=> mapNonEmpty!57016 (= mapRes!57016 (and tp!108593 e!760639))))

(declare-fun mapRest!57016 () (Array (_ BitVec 32) ValueCell!17549))

(declare-fun mapKey!57016 () (_ BitVec 32))

(declare-fun mapValue!57016 () ValueCell!17549)

(assert (=> mapNonEmpty!57016 (= (arr!43765 _values!1320) (store mapRest!57016 mapKey!57016 mapValue!57016))))

(declare-fun b!1335574 () Bool)

(declare-fun e!760636 () Bool)

(declare-fun e!760635 () Bool)

(assert (=> b!1335574 (= e!760636 (and e!760635 mapRes!57016))))

(declare-fun condMapEmpty!57016 () Bool)

(declare-fun mapDefault!57016 () ValueCell!17549)

(assert (=> b!1335574 (= condMapEmpty!57016 (= (arr!43765 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17549)) mapDefault!57016)))))

(declare-fun b!1335575 () Bool)

(declare-fun res!886423 () Bool)

(assert (=> b!1335575 (=> (not res!886423) (not e!760638))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54297)

(declare-fun zeroValue!1262 () V!54297)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23950 0))(
  ( (tuple2!23951 (_1!11986 (_ BitVec 64)) (_2!11986 V!54297)) )
))
(declare-datatypes ((List!31084 0))(
  ( (Nil!31081) (Cons!31080 (h!32289 tuple2!23950) (t!45342 List!31084)) )
))
(declare-datatypes ((ListLongMap!21607 0))(
  ( (ListLongMap!21608 (toList!10819 List!31084)) )
))
(declare-fun contains!8911 (ListLongMap!21607 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5673 (array!90595 array!90597 (_ BitVec 32) (_ BitVec 32) V!54297 V!54297 (_ BitVec 32) Int) ListLongMap!21607)

(assert (=> b!1335575 (= res!886423 (contains!8911 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335576 () Bool)

(declare-fun res!886422 () Bool)

(assert (=> b!1335576 (=> (not res!886422) (not e!760638))))

(declare-datatypes ((List!31085 0))(
  ( (Nil!31082) (Cons!31081 (h!32290 (_ BitVec 64)) (t!45343 List!31085)) )
))
(declare-fun arrayNoDuplicates!0 (array!90595 (_ BitVec 32) List!31085) Bool)

(assert (=> b!1335576 (= res!886422 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31082))))

(declare-fun mapIsEmpty!57016 () Bool)

(assert (=> mapIsEmpty!57016 mapRes!57016))

(declare-fun res!886427 () Bool)

(assert (=> start!112590 (=> (not res!886427) (not e!760638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112590 (= res!886427 (validMask!0 mask!1998))))

(assert (=> start!112590 e!760638))

(declare-fun array_inv!33199 (array!90597) Bool)

(assert (=> start!112590 (and (array_inv!33199 _values!1320) e!760636)))

(assert (=> start!112590 true))

(declare-fun array_inv!33200 (array!90595) Bool)

(assert (=> start!112590 (array_inv!33200 _keys!1590)))

(assert (=> start!112590 tp!108592))

(assert (=> start!112590 tp_is_empty!36895))

(declare-fun b!1335577 () Bool)

(declare-fun res!886425 () Bool)

(assert (=> b!1335577 (=> (not res!886425) (not e!760638))))

(assert (=> b!1335577 (= res!886425 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44316 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335578 () Bool)

(declare-fun res!886429 () Bool)

(assert (=> b!1335578 (=> (not res!886429) (not e!760638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335578 (= res!886429 (validKeyInArray!0 (select (arr!43764 _keys!1590) from!1980)))))

(declare-fun b!1335579 () Bool)

(declare-fun +!4753 (ListLongMap!21607 tuple2!23950) ListLongMap!21607)

(declare-fun getCurrentListMapNoExtraKeys!6396 (array!90595 array!90597 (_ BitVec 32) (_ BitVec 32) V!54297 V!54297 (_ BitVec 32) Int) ListLongMap!21607)

(declare-fun get!22078 (ValueCell!17549 V!54297) V!54297)

(declare-fun dynLambda!3683 (Int (_ BitVec 64)) V!54297)

(assert (=> b!1335579 (= e!760638 (not (contains!8911 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))))

(declare-fun b!1335580 () Bool)

(declare-fun res!886424 () Bool)

(assert (=> b!1335580 (=> (not res!886424) (not e!760638))))

(assert (=> b!1335580 (= res!886424 (not (= (select (arr!43764 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1335581 () Bool)

(declare-fun res!886426 () Bool)

(assert (=> b!1335581 (=> (not res!886426) (not e!760638))))

(assert (=> b!1335581 (= res!886426 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1335582 () Bool)

(assert (=> b!1335582 (= e!760635 tp_is_empty!36895)))

(assert (= (and start!112590 res!886427) b!1335572))

(assert (= (and b!1335572 res!886428) b!1335571))

(assert (= (and b!1335571 res!886421) b!1335576))

(assert (= (and b!1335576 res!886422) b!1335577))

(assert (= (and b!1335577 res!886425) b!1335575))

(assert (= (and b!1335575 res!886423) b!1335580))

(assert (= (and b!1335580 res!886424) b!1335578))

(assert (= (and b!1335578 res!886429) b!1335581))

(assert (= (and b!1335581 res!886426) b!1335579))

(assert (= (and b!1335574 condMapEmpty!57016) mapIsEmpty!57016))

(assert (= (and b!1335574 (not condMapEmpty!57016)) mapNonEmpty!57016))

(get-info :version)

(assert (= (and mapNonEmpty!57016 ((_ is ValueCellFull!17549) mapValue!57016)) b!1335573))

(assert (= (and b!1335574 ((_ is ValueCellFull!17549) mapDefault!57016)) b!1335582))

(assert (= start!112590 b!1335574))

(declare-fun b_lambda!24103 () Bool)

(assert (=> (not b_lambda!24103) (not b!1335579)))

(declare-fun t!45341 () Bool)

(declare-fun tb!12061 () Bool)

(assert (=> (and start!112590 (= defaultEntry!1323 defaultEntry!1323) t!45341) tb!12061))

(declare-fun result!25201 () Bool)

(assert (=> tb!12061 (= result!25201 tp_is_empty!36895)))

(assert (=> b!1335579 t!45341))

(declare-fun b_and!49877 () Bool)

(assert (= b_and!49875 (and (=> t!45341 result!25201) b_and!49877)))

(declare-fun m!1223103 () Bool)

(assert (=> start!112590 m!1223103))

(declare-fun m!1223105 () Bool)

(assert (=> start!112590 m!1223105))

(declare-fun m!1223107 () Bool)

(assert (=> start!112590 m!1223107))

(declare-fun m!1223109 () Bool)

(assert (=> b!1335578 m!1223109))

(assert (=> b!1335578 m!1223109))

(declare-fun m!1223111 () Bool)

(assert (=> b!1335578 m!1223111))

(declare-fun m!1223113 () Bool)

(assert (=> b!1335571 m!1223113))

(assert (=> b!1335580 m!1223109))

(declare-fun m!1223115 () Bool)

(assert (=> b!1335576 m!1223115))

(declare-fun m!1223117 () Bool)

(assert (=> b!1335575 m!1223117))

(assert (=> b!1335575 m!1223117))

(declare-fun m!1223119 () Bool)

(assert (=> b!1335575 m!1223119))

(declare-fun m!1223121 () Bool)

(assert (=> mapNonEmpty!57016 m!1223121))

(declare-fun m!1223123 () Bool)

(assert (=> b!1335579 m!1223123))

(declare-fun m!1223125 () Bool)

(assert (=> b!1335579 m!1223125))

(declare-fun m!1223127 () Bool)

(assert (=> b!1335579 m!1223127))

(declare-fun m!1223129 () Bool)

(assert (=> b!1335579 m!1223129))

(declare-fun m!1223131 () Bool)

(assert (=> b!1335579 m!1223131))

(assert (=> b!1335579 m!1223125))

(declare-fun m!1223133 () Bool)

(assert (=> b!1335579 m!1223133))

(assert (=> b!1335579 m!1223123))

(assert (=> b!1335579 m!1223127))

(assert (=> b!1335579 m!1223109))

(assert (=> b!1335579 m!1223129))

(assert (=> b!1335579 m!1223133))

(declare-fun m!1223135 () Bool)

(assert (=> b!1335579 m!1223135))

(check-sat (not b!1335578) (not mapNonEmpty!57016) (not start!112590) (not b!1335571) b_and!49877 (not b!1335575) tp_is_empty!36895 (not b_lambda!24103) (not b_next!30985) (not b!1335579) (not b!1335576))
(check-sat b_and!49877 (not b_next!30985))
(get-model)

(declare-fun b_lambda!24109 () Bool)

(assert (= b_lambda!24103 (or (and start!112590 b_free!30985) b_lambda!24109)))

(check-sat (not b!1335578) (not mapNonEmpty!57016) (not start!112590) (not b_lambda!24109) (not b!1335571) (not b_next!30985) b_and!49877 (not b!1335575) tp_is_empty!36895 (not b!1335579) (not b!1335576))
(check-sat b_and!49877 (not b_next!30985))
(get-model)

(declare-fun b!1335672 () Bool)

(declare-fun e!760679 () Bool)

(declare-fun e!760678 () Bool)

(assert (=> b!1335672 (= e!760679 e!760678)))

(declare-fun c!125886 () Bool)

(assert (=> b!1335672 (= c!125886 (validKeyInArray!0 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1335673 () Bool)

(declare-fun e!760680 () Bool)

(declare-fun contains!8914 (List!31085 (_ BitVec 64)) Bool)

(assert (=> b!1335673 (= e!760680 (contains!8914 Nil!31082 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1335674 () Bool)

(declare-fun call!64806 () Bool)

(assert (=> b!1335674 (= e!760678 call!64806)))

(declare-fun bm!64803 () Bool)

(assert (=> bm!64803 (= call!64806 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125886 (Cons!31081 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000) Nil!31082) Nil!31082)))))

(declare-fun b!1335675 () Bool)

(assert (=> b!1335675 (= e!760678 call!64806)))

(declare-fun b!1335671 () Bool)

(declare-fun e!760681 () Bool)

(assert (=> b!1335671 (= e!760681 e!760679)))

(declare-fun res!886490 () Bool)

(assert (=> b!1335671 (=> (not res!886490) (not e!760679))))

(assert (=> b!1335671 (= res!886490 (not e!760680))))

(declare-fun res!886491 () Bool)

(assert (=> b!1335671 (=> (not res!886491) (not e!760680))))

(assert (=> b!1335671 (= res!886491 (validKeyInArray!0 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!143405 () Bool)

(declare-fun res!886492 () Bool)

(assert (=> d!143405 (=> res!886492 e!760681)))

(assert (=> d!143405 (= res!886492 (bvsge #b00000000000000000000000000000000 (size!44316 _keys!1590)))))

(assert (=> d!143405 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31082) e!760681)))

(assert (= (and d!143405 (not res!886492)) b!1335671))

(assert (= (and b!1335671 res!886491) b!1335673))

(assert (= (and b!1335671 res!886490) b!1335672))

(assert (= (and b!1335672 c!125886) b!1335675))

(assert (= (and b!1335672 (not c!125886)) b!1335674))

(assert (= (or b!1335675 b!1335674) bm!64803))

(declare-fun m!1223205 () Bool)

(assert (=> b!1335672 m!1223205))

(assert (=> b!1335672 m!1223205))

(declare-fun m!1223207 () Bool)

(assert (=> b!1335672 m!1223207))

(assert (=> b!1335673 m!1223205))

(assert (=> b!1335673 m!1223205))

(declare-fun m!1223209 () Bool)

(assert (=> b!1335673 m!1223209))

(assert (=> bm!64803 m!1223205))

(declare-fun m!1223211 () Bool)

(assert (=> bm!64803 m!1223211))

(assert (=> b!1335671 m!1223205))

(assert (=> b!1335671 m!1223205))

(assert (=> b!1335671 m!1223207))

(assert (=> b!1335576 d!143405))

(declare-fun d!143407 () Bool)

(declare-fun e!760686 () Bool)

(assert (=> d!143407 e!760686))

(declare-fun res!886495 () Bool)

(assert (=> d!143407 (=> res!886495 e!760686)))

(declare-fun lt!592294 () Bool)

(assert (=> d!143407 (= res!886495 (not lt!592294))))

(declare-fun lt!592297 () Bool)

(assert (=> d!143407 (= lt!592294 lt!592297)))

(declare-datatypes ((Unit!43702 0))(
  ( (Unit!43703) )
))
(declare-fun lt!592295 () Unit!43702)

(declare-fun e!760687 () Unit!43702)

(assert (=> d!143407 (= lt!592295 e!760687)))

(declare-fun c!125889 () Bool)

(assert (=> d!143407 (= c!125889 lt!592297)))

(declare-fun containsKey!735 (List!31084 (_ BitVec 64)) Bool)

(assert (=> d!143407 (= lt!592297 (containsKey!735 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!143407 (= (contains!8911 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!592294)))

(declare-fun b!1335682 () Bool)

(declare-fun lt!592296 () Unit!43702)

(assert (=> b!1335682 (= e!760687 lt!592296)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!482 (List!31084 (_ BitVec 64)) Unit!43702)

(assert (=> b!1335682 (= lt!592296 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-datatypes ((Option!769 0))(
  ( (Some!768 (v!21161 V!54297)) (None!767) )
))
(declare-fun isDefined!525 (Option!769) Bool)

(declare-fun getValueByKey!718 (List!31084 (_ BitVec 64)) Option!769)

(assert (=> b!1335682 (isDefined!525 (getValueByKey!718 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1335683 () Bool)

(declare-fun Unit!43704 () Unit!43702)

(assert (=> b!1335683 (= e!760687 Unit!43704)))

(declare-fun b!1335684 () Bool)

(assert (=> b!1335684 (= e!760686 (isDefined!525 (getValueByKey!718 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143407 c!125889) b!1335682))

(assert (= (and d!143407 (not c!125889)) b!1335683))

(assert (= (and d!143407 (not res!886495)) b!1335684))

(declare-fun m!1223213 () Bool)

(assert (=> d!143407 m!1223213))

(declare-fun m!1223215 () Bool)

(assert (=> b!1335682 m!1223215))

(declare-fun m!1223217 () Bool)

(assert (=> b!1335682 m!1223217))

(assert (=> b!1335682 m!1223217))

(declare-fun m!1223219 () Bool)

(assert (=> b!1335682 m!1223219))

(assert (=> b!1335684 m!1223217))

(assert (=> b!1335684 m!1223217))

(assert (=> b!1335684 m!1223219))

(assert (=> b!1335575 d!143407))

(declare-fun b!1335727 () Bool)

(declare-fun e!760722 () ListLongMap!21607)

(declare-fun e!760718 () ListLongMap!21607)

(assert (=> b!1335727 (= e!760722 e!760718)))

(declare-fun c!125906 () Bool)

(assert (=> b!1335727 (= c!125906 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1335728 () Bool)

(declare-fun e!760720 () Bool)

(declare-fun lt!592343 () ListLongMap!21607)

(declare-fun apply!1025 (ListLongMap!21607 (_ BitVec 64)) V!54297)

(assert (=> b!1335728 (= e!760720 (= (apply!1025 lt!592343 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun b!1335729 () Bool)

(declare-fun e!760719 () Bool)

(declare-fun e!760715 () Bool)

(assert (=> b!1335729 (= e!760719 e!760715)))

(declare-fun res!886522 () Bool)

(assert (=> b!1335729 (=> (not res!886522) (not e!760715))))

(assert (=> b!1335729 (= res!886522 (contains!8911 lt!592343 (select (arr!43764 _keys!1590) from!1980)))))

(assert (=> b!1335729 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44316 _keys!1590)))))

(declare-fun b!1335730 () Bool)

(declare-fun e!760725 () ListLongMap!21607)

(declare-fun call!64824 () ListLongMap!21607)

(assert (=> b!1335730 (= e!760725 call!64824)))

(declare-fun bm!64818 () Bool)

(declare-fun call!64827 () Bool)

(assert (=> bm!64818 (= call!64827 (contains!8911 lt!592343 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1335731 () Bool)

(declare-fun e!760721 () Bool)

(assert (=> b!1335731 (= e!760721 e!760720)))

(declare-fun res!886515 () Bool)

(declare-fun call!64822 () Bool)

(assert (=> b!1335731 (= res!886515 call!64822)))

(assert (=> b!1335731 (=> (not res!886515) (not e!760720))))

(declare-fun b!1335732 () Bool)

(declare-fun e!760717 () Bool)

(assert (=> b!1335732 (= e!760717 (validKeyInArray!0 (select (arr!43764 _keys!1590) from!1980)))))

(declare-fun b!1335733 () Bool)

(declare-fun e!760726 () Bool)

(assert (=> b!1335733 (= e!760726 (= (apply!1025 lt!592343 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun call!64826 () ListLongMap!21607)

(declare-fun call!64825 () ListLongMap!21607)

(declare-fun call!64823 () ListLongMap!21607)

(declare-fun bm!64819 () Bool)

(declare-fun c!125903 () Bool)

(assert (=> bm!64819 (= call!64826 (+!4753 (ite c!125903 call!64825 (ite c!125906 call!64823 call!64824)) (ite (or c!125903 c!125906) (tuple2!23951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1335734 () Bool)

(declare-fun call!64821 () ListLongMap!21607)

(assert (=> b!1335734 (= e!760725 call!64821)))

(declare-fun b!1335735 () Bool)

(assert (=> b!1335735 (= e!760721 (not call!64822))))

(declare-fun bm!64820 () Bool)

(assert (=> bm!64820 (= call!64825 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun b!1335736 () Bool)

(declare-fun e!760724 () Unit!43702)

(declare-fun Unit!43705 () Unit!43702)

(assert (=> b!1335736 (= e!760724 Unit!43705)))

(declare-fun b!1335737 () Bool)

(declare-fun res!886514 () Bool)

(declare-fun e!760714 () Bool)

(assert (=> b!1335737 (=> (not res!886514) (not e!760714))))

(assert (=> b!1335737 (= res!886514 e!760719)))

(declare-fun res!886516 () Bool)

(assert (=> b!1335737 (=> res!886516 e!760719)))

(declare-fun e!760716 () Bool)

(assert (=> b!1335737 (= res!886516 (not e!760716))))

(declare-fun res!886521 () Bool)

(assert (=> b!1335737 (=> (not res!886521) (not e!760716))))

(assert (=> b!1335737 (= res!886521 (bvslt from!1980 (size!44316 _keys!1590)))))

(declare-fun b!1335738 () Bool)

(assert (=> b!1335738 (= e!760718 call!64821)))

(declare-fun d!143409 () Bool)

(assert (=> d!143409 e!760714))

(declare-fun res!886520 () Bool)

(assert (=> d!143409 (=> (not res!886520) (not e!760714))))

(assert (=> d!143409 (= res!886520 (or (bvsge from!1980 (size!44316 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44316 _keys!1590)))))))

(declare-fun lt!592350 () ListLongMap!21607)

(assert (=> d!143409 (= lt!592343 lt!592350)))

(declare-fun lt!592355 () Unit!43702)

(assert (=> d!143409 (= lt!592355 e!760724)))

(declare-fun c!125907 () Bool)

(assert (=> d!143409 (= c!125907 e!760717)))

(declare-fun res!886518 () Bool)

(assert (=> d!143409 (=> (not res!886518) (not e!760717))))

(assert (=> d!143409 (= res!886518 (bvslt from!1980 (size!44316 _keys!1590)))))

(assert (=> d!143409 (= lt!592350 e!760722)))

(assert (=> d!143409 (= c!125903 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143409 (validMask!0 mask!1998)))

(assert (=> d!143409 (= (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!592343)))

(declare-fun b!1335739 () Bool)

(assert (=> b!1335739 (= e!760716 (validKeyInArray!0 (select (arr!43764 _keys!1590) from!1980)))))

(declare-fun b!1335740 () Bool)

(assert (=> b!1335740 (= e!760722 (+!4753 call!64826 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun bm!64821 () Bool)

(assert (=> bm!64821 (= call!64821 call!64826)))

(declare-fun b!1335741 () Bool)

(declare-fun e!760723 () Bool)

(assert (=> b!1335741 (= e!760723 (not call!64827))))

(declare-fun b!1335742 () Bool)

(assert (=> b!1335742 (= e!760715 (= (apply!1025 lt!592343 (select (arr!43764 _keys!1590) from!1980)) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1335742 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44317 _values!1320)))))

(assert (=> b!1335742 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44316 _keys!1590)))))

(declare-fun bm!64822 () Bool)

(assert (=> bm!64822 (= call!64822 (contains!8911 lt!592343 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64823 () Bool)

(assert (=> bm!64823 (= call!64824 call!64823)))

(declare-fun b!1335743 () Bool)

(declare-fun res!886517 () Bool)

(assert (=> b!1335743 (=> (not res!886517) (not e!760714))))

(assert (=> b!1335743 (= res!886517 e!760723)))

(declare-fun c!125902 () Bool)

(assert (=> b!1335743 (= c!125902 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1335744 () Bool)

(declare-fun c!125904 () Bool)

(assert (=> b!1335744 (= c!125904 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1335744 (= e!760718 e!760725)))

(declare-fun b!1335745 () Bool)

(assert (=> b!1335745 (= e!760714 e!760721)))

(declare-fun c!125905 () Bool)

(assert (=> b!1335745 (= c!125905 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1335746 () Bool)

(declare-fun lt!592363 () Unit!43702)

(assert (=> b!1335746 (= e!760724 lt!592363)))

(declare-fun lt!592351 () ListLongMap!21607)

(assert (=> b!1335746 (= lt!592351 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!592352 () (_ BitVec 64))

(assert (=> b!1335746 (= lt!592352 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592348 () (_ BitVec 64))

(assert (=> b!1335746 (= lt!592348 (select (arr!43764 _keys!1590) from!1980))))

(declare-fun lt!592344 () Unit!43702)

(declare-fun addStillContains!1183 (ListLongMap!21607 (_ BitVec 64) V!54297 (_ BitVec 64)) Unit!43702)

(assert (=> b!1335746 (= lt!592344 (addStillContains!1183 lt!592351 lt!592352 zeroValue!1262 lt!592348))))

(assert (=> b!1335746 (contains!8911 (+!4753 lt!592351 (tuple2!23951 lt!592352 zeroValue!1262)) lt!592348)))

(declare-fun lt!592345 () Unit!43702)

(assert (=> b!1335746 (= lt!592345 lt!592344)))

(declare-fun lt!592346 () ListLongMap!21607)

(assert (=> b!1335746 (= lt!592346 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!592357 () (_ BitVec 64))

(assert (=> b!1335746 (= lt!592357 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592356 () (_ BitVec 64))

(assert (=> b!1335746 (= lt!592356 (select (arr!43764 _keys!1590) from!1980))))

(declare-fun lt!592342 () Unit!43702)

(declare-fun addApplyDifferent!563 (ListLongMap!21607 (_ BitVec 64) V!54297 (_ BitVec 64)) Unit!43702)

(assert (=> b!1335746 (= lt!592342 (addApplyDifferent!563 lt!592346 lt!592357 minValue!1262 lt!592356))))

(assert (=> b!1335746 (= (apply!1025 (+!4753 lt!592346 (tuple2!23951 lt!592357 minValue!1262)) lt!592356) (apply!1025 lt!592346 lt!592356))))

(declare-fun lt!592359 () Unit!43702)

(assert (=> b!1335746 (= lt!592359 lt!592342)))

(declare-fun lt!592358 () ListLongMap!21607)

(assert (=> b!1335746 (= lt!592358 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!592362 () (_ BitVec 64))

(assert (=> b!1335746 (= lt!592362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592354 () (_ BitVec 64))

(assert (=> b!1335746 (= lt!592354 (select (arr!43764 _keys!1590) from!1980))))

(declare-fun lt!592360 () Unit!43702)

(assert (=> b!1335746 (= lt!592360 (addApplyDifferent!563 lt!592358 lt!592362 zeroValue!1262 lt!592354))))

(assert (=> b!1335746 (= (apply!1025 (+!4753 lt!592358 (tuple2!23951 lt!592362 zeroValue!1262)) lt!592354) (apply!1025 lt!592358 lt!592354))))

(declare-fun lt!592353 () Unit!43702)

(assert (=> b!1335746 (= lt!592353 lt!592360)))

(declare-fun lt!592361 () ListLongMap!21607)

(assert (=> b!1335746 (= lt!592361 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!592347 () (_ BitVec 64))

(assert (=> b!1335746 (= lt!592347 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592349 () (_ BitVec 64))

(assert (=> b!1335746 (= lt!592349 (select (arr!43764 _keys!1590) from!1980))))

(assert (=> b!1335746 (= lt!592363 (addApplyDifferent!563 lt!592361 lt!592347 minValue!1262 lt!592349))))

(assert (=> b!1335746 (= (apply!1025 (+!4753 lt!592361 (tuple2!23951 lt!592347 minValue!1262)) lt!592349) (apply!1025 lt!592361 lt!592349))))

(declare-fun bm!64824 () Bool)

(assert (=> bm!64824 (= call!64823 call!64825)))

(declare-fun b!1335747 () Bool)

(assert (=> b!1335747 (= e!760723 e!760726)))

(declare-fun res!886519 () Bool)

(assert (=> b!1335747 (= res!886519 call!64827)))

(assert (=> b!1335747 (=> (not res!886519) (not e!760726))))

(assert (= (and d!143409 c!125903) b!1335740))

(assert (= (and d!143409 (not c!125903)) b!1335727))

(assert (= (and b!1335727 c!125906) b!1335738))

(assert (= (and b!1335727 (not c!125906)) b!1335744))

(assert (= (and b!1335744 c!125904) b!1335734))

(assert (= (and b!1335744 (not c!125904)) b!1335730))

(assert (= (or b!1335734 b!1335730) bm!64823))

(assert (= (or b!1335738 bm!64823) bm!64824))

(assert (= (or b!1335738 b!1335734) bm!64821))

(assert (= (or b!1335740 bm!64824) bm!64820))

(assert (= (or b!1335740 bm!64821) bm!64819))

(assert (= (and d!143409 res!886518) b!1335732))

(assert (= (and d!143409 c!125907) b!1335746))

(assert (= (and d!143409 (not c!125907)) b!1335736))

(assert (= (and d!143409 res!886520) b!1335737))

(assert (= (and b!1335737 res!886521) b!1335739))

(assert (= (and b!1335737 (not res!886516)) b!1335729))

(assert (= (and b!1335729 res!886522) b!1335742))

(assert (= (and b!1335737 res!886514) b!1335743))

(assert (= (and b!1335743 c!125902) b!1335747))

(assert (= (and b!1335743 (not c!125902)) b!1335741))

(assert (= (and b!1335747 res!886519) b!1335733))

(assert (= (or b!1335747 b!1335741) bm!64818))

(assert (= (and b!1335743 res!886517) b!1335745))

(assert (= (and b!1335745 c!125905) b!1335731))

(assert (= (and b!1335745 (not c!125905)) b!1335735))

(assert (= (and b!1335731 res!886515) b!1335728))

(assert (= (or b!1335731 b!1335735) bm!64822))

(declare-fun b_lambda!24111 () Bool)

(assert (=> (not b_lambda!24111) (not b!1335742)))

(assert (=> b!1335742 t!45341))

(declare-fun b_and!49887 () Bool)

(assert (= b_and!49877 (and (=> t!45341 result!25201) b_and!49887)))

(declare-fun m!1223221 () Bool)

(assert (=> b!1335728 m!1223221))

(declare-fun m!1223223 () Bool)

(assert (=> b!1335740 m!1223223))

(declare-fun m!1223225 () Bool)

(assert (=> bm!64820 m!1223225))

(assert (=> b!1335746 m!1223109))

(declare-fun m!1223227 () Bool)

(assert (=> b!1335746 m!1223227))

(declare-fun m!1223229 () Bool)

(assert (=> b!1335746 m!1223229))

(assert (=> b!1335746 m!1223225))

(declare-fun m!1223231 () Bool)

(assert (=> b!1335746 m!1223231))

(declare-fun m!1223233 () Bool)

(assert (=> b!1335746 m!1223233))

(declare-fun m!1223235 () Bool)

(assert (=> b!1335746 m!1223235))

(declare-fun m!1223237 () Bool)

(assert (=> b!1335746 m!1223237))

(declare-fun m!1223239 () Bool)

(assert (=> b!1335746 m!1223239))

(declare-fun m!1223241 () Bool)

(assert (=> b!1335746 m!1223241))

(assert (=> b!1335746 m!1223231))

(declare-fun m!1223243 () Bool)

(assert (=> b!1335746 m!1223243))

(declare-fun m!1223245 () Bool)

(assert (=> b!1335746 m!1223245))

(assert (=> b!1335746 m!1223229))

(declare-fun m!1223247 () Bool)

(assert (=> b!1335746 m!1223247))

(declare-fun m!1223249 () Bool)

(assert (=> b!1335746 m!1223249))

(declare-fun m!1223251 () Bool)

(assert (=> b!1335746 m!1223251))

(declare-fun m!1223253 () Bool)

(assert (=> b!1335746 m!1223253))

(assert (=> b!1335746 m!1223241))

(declare-fun m!1223255 () Bool)

(assert (=> b!1335746 m!1223255))

(assert (=> b!1335746 m!1223249))

(assert (=> b!1335739 m!1223109))

(assert (=> b!1335739 m!1223109))

(assert (=> b!1335739 m!1223111))

(assert (=> b!1335729 m!1223109))

(assert (=> b!1335729 m!1223109))

(declare-fun m!1223257 () Bool)

(assert (=> b!1335729 m!1223257))

(declare-fun m!1223259 () Bool)

(assert (=> b!1335733 m!1223259))

(declare-fun m!1223261 () Bool)

(assert (=> bm!64822 m!1223261))

(assert (=> b!1335742 m!1223109))

(assert (=> b!1335742 m!1223127))

(assert (=> b!1335742 m!1223129))

(assert (=> b!1335742 m!1223131))

(assert (=> b!1335742 m!1223129))

(assert (=> b!1335742 m!1223127))

(assert (=> b!1335742 m!1223109))

(declare-fun m!1223263 () Bool)

(assert (=> b!1335742 m!1223263))

(assert (=> b!1335732 m!1223109))

(assert (=> b!1335732 m!1223109))

(assert (=> b!1335732 m!1223111))

(declare-fun m!1223265 () Bool)

(assert (=> bm!64818 m!1223265))

(declare-fun m!1223267 () Bool)

(assert (=> bm!64819 m!1223267))

(assert (=> d!143409 m!1223103))

(assert (=> b!1335575 d!143409))

(declare-fun bm!64827 () Bool)

(declare-fun call!64830 () Bool)

(assert (=> bm!64827 (= call!64830 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun d!143411 () Bool)

(declare-fun res!886527 () Bool)

(declare-fun e!760735 () Bool)

(assert (=> d!143411 (=> res!886527 e!760735)))

(assert (=> d!143411 (= res!886527 (bvsge #b00000000000000000000000000000000 (size!44316 _keys!1590)))))

(assert (=> d!143411 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!760735)))

(declare-fun b!1335756 () Bool)

(declare-fun e!760733 () Bool)

(assert (=> b!1335756 (= e!760735 e!760733)))

(declare-fun c!125910 () Bool)

(assert (=> b!1335756 (= c!125910 (validKeyInArray!0 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1335757 () Bool)

(assert (=> b!1335757 (= e!760733 call!64830)))

(declare-fun b!1335758 () Bool)

(declare-fun e!760734 () Bool)

(assert (=> b!1335758 (= e!760734 call!64830)))

(declare-fun b!1335759 () Bool)

(assert (=> b!1335759 (= e!760733 e!760734)))

(declare-fun lt!592370 () (_ BitVec 64))

(assert (=> b!1335759 (= lt!592370 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000))))

(declare-fun lt!592372 () Unit!43702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90595 (_ BitVec 64) (_ BitVec 32)) Unit!43702)

(assert (=> b!1335759 (= lt!592372 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!592370 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1335759 (arrayContainsKey!0 _keys!1590 lt!592370 #b00000000000000000000000000000000)))

(declare-fun lt!592371 () Unit!43702)

(assert (=> b!1335759 (= lt!592371 lt!592372)))

(declare-fun res!886528 () Bool)

(declare-datatypes ((SeekEntryResult!10046 0))(
  ( (MissingZero!10046 (index!42555 (_ BitVec 32))) (Found!10046 (index!42556 (_ BitVec 32))) (Intermediate!10046 (undefined!10858 Bool) (index!42557 (_ BitVec 32)) (x!119322 (_ BitVec 32))) (Undefined!10046) (MissingVacant!10046 (index!42558 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90595 (_ BitVec 32)) SeekEntryResult!10046)

(assert (=> b!1335759 (= res!886528 (= (seekEntryOrOpen!0 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10046 #b00000000000000000000000000000000)))))

(assert (=> b!1335759 (=> (not res!886528) (not e!760734))))

(assert (= (and d!143411 (not res!886527)) b!1335756))

(assert (= (and b!1335756 c!125910) b!1335759))

(assert (= (and b!1335756 (not c!125910)) b!1335757))

(assert (= (and b!1335759 res!886528) b!1335758))

(assert (= (or b!1335758 b!1335757) bm!64827))

(declare-fun m!1223269 () Bool)

(assert (=> bm!64827 m!1223269))

(assert (=> b!1335756 m!1223205))

(assert (=> b!1335756 m!1223205))

(assert (=> b!1335756 m!1223207))

(assert (=> b!1335759 m!1223205))

(declare-fun m!1223271 () Bool)

(assert (=> b!1335759 m!1223271))

(declare-fun m!1223273 () Bool)

(assert (=> b!1335759 m!1223273))

(assert (=> b!1335759 m!1223205))

(declare-fun m!1223275 () Bool)

(assert (=> b!1335759 m!1223275))

(assert (=> b!1335571 d!143411))

(declare-fun d!143413 () Bool)

(assert (=> d!143413 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112590 d!143413))

(declare-fun d!143415 () Bool)

(assert (=> d!143415 (= (array_inv!33199 _values!1320) (bvsge (size!44317 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112590 d!143415))

(declare-fun d!143417 () Bool)

(assert (=> d!143417 (= (array_inv!33200 _keys!1590) (bvsge (size!44316 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112590 d!143417))

(declare-fun d!143419 () Bool)

(declare-fun e!760738 () Bool)

(assert (=> d!143419 e!760738))

(declare-fun res!886533 () Bool)

(assert (=> d!143419 (=> (not res!886533) (not e!760738))))

(declare-fun lt!592384 () ListLongMap!21607)

(assert (=> d!143419 (= res!886533 (contains!8911 lt!592384 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!592383 () List!31084)

(assert (=> d!143419 (= lt!592384 (ListLongMap!21608 lt!592383))))

(declare-fun lt!592381 () Unit!43702)

(declare-fun lt!592382 () Unit!43702)

(assert (=> d!143419 (= lt!592381 lt!592382)))

(assert (=> d!143419 (= (getValueByKey!718 lt!592383 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!361 (List!31084 (_ BitVec 64) V!54297) Unit!43702)

(assert (=> d!143419 (= lt!592382 (lemmaContainsTupThenGetReturnValue!361 lt!592383 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!490 (List!31084 (_ BitVec 64) V!54297) List!31084)

(assert (=> d!143419 (= lt!592383 (insertStrictlySorted!490 (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143419 (= (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!592384)))

(declare-fun b!1335764 () Bool)

(declare-fun res!886534 () Bool)

(assert (=> b!1335764 (=> (not res!886534) (not e!760738))))

(assert (=> b!1335764 (= res!886534 (= (getValueByKey!718 (toList!10819 lt!592384) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1335765 () Bool)

(declare-fun contains!8915 (List!31084 tuple2!23950) Bool)

(assert (=> b!1335765 (= e!760738 (contains!8915 (toList!10819 lt!592384) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143419 res!886533) b!1335764))

(assert (= (and b!1335764 res!886534) b!1335765))

(declare-fun m!1223277 () Bool)

(assert (=> d!143419 m!1223277))

(declare-fun m!1223279 () Bool)

(assert (=> d!143419 m!1223279))

(declare-fun m!1223281 () Bool)

(assert (=> d!143419 m!1223281))

(declare-fun m!1223283 () Bool)

(assert (=> d!143419 m!1223283))

(declare-fun m!1223285 () Bool)

(assert (=> b!1335764 m!1223285))

(declare-fun m!1223287 () Bool)

(assert (=> b!1335765 m!1223287))

(assert (=> b!1335579 d!143419))

(declare-fun d!143421 () Bool)

(declare-fun e!760739 () Bool)

(assert (=> d!143421 e!760739))

(declare-fun res!886535 () Bool)

(assert (=> d!143421 (=> (not res!886535) (not e!760739))))

(declare-fun lt!592388 () ListLongMap!21607)

(assert (=> d!143421 (= res!886535 (contains!8911 lt!592388 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!592387 () List!31084)

(assert (=> d!143421 (= lt!592388 (ListLongMap!21608 lt!592387))))

(declare-fun lt!592385 () Unit!43702)

(declare-fun lt!592386 () Unit!43702)

(assert (=> d!143421 (= lt!592385 lt!592386)))

(assert (=> d!143421 (= (getValueByKey!718 lt!592387 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!768 (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143421 (= lt!592386 (lemmaContainsTupThenGetReturnValue!361 lt!592387 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143421 (= lt!592387 (insertStrictlySorted!490 (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143421 (= (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!592388)))

(declare-fun b!1335766 () Bool)

(declare-fun res!886536 () Bool)

(assert (=> b!1335766 (=> (not res!886536) (not e!760739))))

(assert (=> b!1335766 (= res!886536 (= (getValueByKey!718 (toList!10819 lt!592388) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!768 (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1335767 () Bool)

(assert (=> b!1335767 (= e!760739 (contains!8915 (toList!10819 lt!592388) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143421 res!886535) b!1335766))

(assert (= (and b!1335766 res!886536) b!1335767))

(declare-fun m!1223289 () Bool)

(assert (=> d!143421 m!1223289))

(declare-fun m!1223291 () Bool)

(assert (=> d!143421 m!1223291))

(declare-fun m!1223293 () Bool)

(assert (=> d!143421 m!1223293))

(declare-fun m!1223295 () Bool)

(assert (=> d!143421 m!1223295))

(declare-fun m!1223297 () Bool)

(assert (=> b!1335766 m!1223297))

(declare-fun m!1223299 () Bool)

(assert (=> b!1335767 m!1223299))

(assert (=> b!1335579 d!143421))

(declare-fun b!1335792 () Bool)

(declare-fun e!760756 () ListLongMap!21607)

(declare-fun call!64833 () ListLongMap!21607)

(assert (=> b!1335792 (= e!760756 call!64833)))

(declare-fun d!143423 () Bool)

(declare-fun e!760754 () Bool)

(assert (=> d!143423 e!760754))

(declare-fun res!886545 () Bool)

(assert (=> d!143423 (=> (not res!886545) (not e!760754))))

(declare-fun lt!592404 () ListLongMap!21607)

(assert (=> d!143423 (= res!886545 (not (contains!8911 lt!592404 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!760760 () ListLongMap!21607)

(assert (=> d!143423 (= lt!592404 e!760760)))

(declare-fun c!125919 () Bool)

(assert (=> d!143423 (= c!125919 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44316 _keys!1590)))))

(assert (=> d!143423 (validMask!0 mask!1998)))

(assert (=> d!143423 (= (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!592404)))

(declare-fun b!1335793 () Bool)

(declare-fun e!760755 () Bool)

(assert (=> b!1335793 (= e!760755 (validKeyInArray!0 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1335793 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1335794 () Bool)

(declare-fun e!760757 () Bool)

(declare-fun e!760758 () Bool)

(assert (=> b!1335794 (= e!760757 e!760758)))

(declare-fun c!125922 () Bool)

(assert (=> b!1335794 (= c!125922 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44316 _keys!1590)))))

(declare-fun b!1335795 () Bool)

(declare-fun res!886547 () Bool)

(assert (=> b!1335795 (=> (not res!886547) (not e!760754))))

(assert (=> b!1335795 (= res!886547 (not (contains!8911 lt!592404 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1335796 () Bool)

(declare-fun lt!592407 () Unit!43702)

(declare-fun lt!592405 () Unit!43702)

(assert (=> b!1335796 (= lt!592407 lt!592405)))

(declare-fun lt!592408 () ListLongMap!21607)

(declare-fun lt!592403 () V!54297)

(declare-fun lt!592409 () (_ BitVec 64))

(declare-fun lt!592406 () (_ BitVec 64))

(assert (=> b!1335796 (not (contains!8911 (+!4753 lt!592408 (tuple2!23951 lt!592409 lt!592403)) lt!592406))))

(declare-fun addStillNotContains!484 (ListLongMap!21607 (_ BitVec 64) V!54297 (_ BitVec 64)) Unit!43702)

(assert (=> b!1335796 (= lt!592405 (addStillNotContains!484 lt!592408 lt!592409 lt!592403 lt!592406))))

(assert (=> b!1335796 (= lt!592406 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1335796 (= lt!592403 (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1335796 (= lt!592409 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1335796 (= lt!592408 call!64833)))

(assert (=> b!1335796 (= e!760756 (+!4753 call!64833 (tuple2!23951 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1335797 () Bool)

(assert (=> b!1335797 (= e!760754 e!760757)))

(declare-fun c!125920 () Bool)

(assert (=> b!1335797 (= c!125920 e!760755)))

(declare-fun res!886548 () Bool)

(assert (=> b!1335797 (=> (not res!886548) (not e!760755))))

(assert (=> b!1335797 (= res!886548 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44316 _keys!1590)))))

(declare-fun bm!64830 () Bool)

(assert (=> bm!64830 (= call!64833 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1335798 () Bool)

(assert (=> b!1335798 (= e!760758 (= lt!592404 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1335799 () Bool)

(declare-fun e!760759 () Bool)

(assert (=> b!1335799 (= e!760757 e!760759)))

(assert (=> b!1335799 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44316 _keys!1590)))))

(declare-fun res!886546 () Bool)

(assert (=> b!1335799 (= res!886546 (contains!8911 lt!592404 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1335799 (=> (not res!886546) (not e!760759))))

(declare-fun b!1335800 () Bool)

(assert (=> b!1335800 (= e!760760 (ListLongMap!21608 Nil!31081))))

(declare-fun b!1335801 () Bool)

(declare-fun isEmpty!1087 (ListLongMap!21607) Bool)

(assert (=> b!1335801 (= e!760758 (isEmpty!1087 lt!592404))))

(declare-fun b!1335802 () Bool)

(assert (=> b!1335802 (= e!760760 e!760756)))

(declare-fun c!125921 () Bool)

(assert (=> b!1335802 (= c!125921 (validKeyInArray!0 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1335803 () Bool)

(assert (=> b!1335803 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44316 _keys!1590)))))

(assert (=> b!1335803 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44317 _values!1320)))))

(assert (=> b!1335803 (= e!760759 (= (apply!1025 lt!592404 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!143423 c!125919) b!1335800))

(assert (= (and d!143423 (not c!125919)) b!1335802))

(assert (= (and b!1335802 c!125921) b!1335796))

(assert (= (and b!1335802 (not c!125921)) b!1335792))

(assert (= (or b!1335796 b!1335792) bm!64830))

(assert (= (and d!143423 res!886545) b!1335795))

(assert (= (and b!1335795 res!886547) b!1335797))

(assert (= (and b!1335797 res!886548) b!1335793))

(assert (= (and b!1335797 c!125920) b!1335799))

(assert (= (and b!1335797 (not c!125920)) b!1335794))

(assert (= (and b!1335799 res!886546) b!1335803))

(assert (= (and b!1335794 c!125922) b!1335798))

(assert (= (and b!1335794 (not c!125922)) b!1335801))

(declare-fun b_lambda!24113 () Bool)

(assert (=> (not b_lambda!24113) (not b!1335796)))

(assert (=> b!1335796 t!45341))

(declare-fun b_and!49889 () Bool)

(assert (= b_and!49887 (and (=> t!45341 result!25201) b_and!49889)))

(declare-fun b_lambda!24115 () Bool)

(assert (=> (not b_lambda!24115) (not b!1335803)))

(assert (=> b!1335803 t!45341))

(declare-fun b_and!49891 () Bool)

(assert (= b_and!49889 (and (=> t!45341 result!25201) b_and!49891)))

(declare-fun m!1223301 () Bool)

(assert (=> b!1335801 m!1223301))

(declare-fun m!1223303 () Bool)

(assert (=> d!143423 m!1223303))

(assert (=> d!143423 m!1223103))

(declare-fun m!1223305 () Bool)

(assert (=> bm!64830 m!1223305))

(assert (=> b!1335803 m!1223129))

(declare-fun m!1223307 () Bool)

(assert (=> b!1335803 m!1223307))

(assert (=> b!1335803 m!1223129))

(declare-fun m!1223309 () Bool)

(assert (=> b!1335803 m!1223309))

(declare-fun m!1223311 () Bool)

(assert (=> b!1335803 m!1223311))

(declare-fun m!1223313 () Bool)

(assert (=> b!1335803 m!1223313))

(assert (=> b!1335803 m!1223307))

(assert (=> b!1335803 m!1223311))

(assert (=> b!1335802 m!1223311))

(assert (=> b!1335802 m!1223311))

(declare-fun m!1223315 () Bool)

(assert (=> b!1335802 m!1223315))

(assert (=> b!1335793 m!1223311))

(assert (=> b!1335793 m!1223311))

(assert (=> b!1335793 m!1223315))

(assert (=> b!1335798 m!1223305))

(assert (=> b!1335799 m!1223311))

(assert (=> b!1335799 m!1223311))

(declare-fun m!1223317 () Bool)

(assert (=> b!1335799 m!1223317))

(declare-fun m!1223319 () Bool)

(assert (=> b!1335795 m!1223319))

(assert (=> b!1335796 m!1223129))

(declare-fun m!1223321 () Bool)

(assert (=> b!1335796 m!1223321))

(declare-fun m!1223323 () Bool)

(assert (=> b!1335796 m!1223323))

(declare-fun m!1223325 () Bool)

(assert (=> b!1335796 m!1223325))

(assert (=> b!1335796 m!1223307))

(assert (=> b!1335796 m!1223323))

(assert (=> b!1335796 m!1223311))

(assert (=> b!1335796 m!1223307))

(assert (=> b!1335796 m!1223129))

(assert (=> b!1335796 m!1223309))

(declare-fun m!1223327 () Bool)

(assert (=> b!1335796 m!1223327))

(assert (=> b!1335579 d!143423))

(declare-fun d!143425 () Bool)

(declare-fun c!125925 () Bool)

(assert (=> d!143425 (= c!125925 ((_ is ValueCellFull!17549) (select (arr!43765 _values!1320) from!1980)))))

(declare-fun e!760763 () V!54297)

(assert (=> d!143425 (= (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!760763)))

(declare-fun b!1335808 () Bool)

(declare-fun get!22080 (ValueCell!17549 V!54297) V!54297)

(assert (=> b!1335808 (= e!760763 (get!22080 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1335809 () Bool)

(declare-fun get!22081 (ValueCell!17549 V!54297) V!54297)

(assert (=> b!1335809 (= e!760763 (get!22081 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143425 c!125925) b!1335808))

(assert (= (and d!143425 (not c!125925)) b!1335809))

(assert (=> b!1335808 m!1223127))

(assert (=> b!1335808 m!1223129))

(declare-fun m!1223329 () Bool)

(assert (=> b!1335808 m!1223329))

(assert (=> b!1335809 m!1223127))

(assert (=> b!1335809 m!1223129))

(declare-fun m!1223331 () Bool)

(assert (=> b!1335809 m!1223331))

(assert (=> b!1335579 d!143425))

(declare-fun d!143427 () Bool)

(declare-fun e!760764 () Bool)

(assert (=> d!143427 e!760764))

(declare-fun res!886549 () Bool)

(assert (=> d!143427 (=> res!886549 e!760764)))

(declare-fun lt!592410 () Bool)

(assert (=> d!143427 (= res!886549 (not lt!592410))))

(declare-fun lt!592413 () Bool)

(assert (=> d!143427 (= lt!592410 lt!592413)))

(declare-fun lt!592411 () Unit!43702)

(declare-fun e!760765 () Unit!43702)

(assert (=> d!143427 (= lt!592411 e!760765)))

(declare-fun c!125926 () Bool)

(assert (=> d!143427 (= c!125926 lt!592413)))

(assert (=> d!143427 (= lt!592413 (containsKey!735 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(assert (=> d!143427 (= (contains!8911 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153) lt!592410)))

(declare-fun b!1335810 () Bool)

(declare-fun lt!592412 () Unit!43702)

(assert (=> b!1335810 (= e!760765 lt!592412)))

(assert (=> b!1335810 (= lt!592412 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(assert (=> b!1335810 (isDefined!525 (getValueByKey!718 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun b!1335811 () Bool)

(declare-fun Unit!43706 () Unit!43702)

(assert (=> b!1335811 (= e!760765 Unit!43706)))

(declare-fun b!1335812 () Bool)

(assert (=> b!1335812 (= e!760764 (isDefined!525 (getValueByKey!718 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153)))))

(assert (= (and d!143427 c!125926) b!1335810))

(assert (= (and d!143427 (not c!125926)) b!1335811))

(assert (= (and d!143427 (not res!886549)) b!1335812))

(declare-fun m!1223333 () Bool)

(assert (=> d!143427 m!1223333))

(declare-fun m!1223335 () Bool)

(assert (=> b!1335810 m!1223335))

(declare-fun m!1223337 () Bool)

(assert (=> b!1335810 m!1223337))

(assert (=> b!1335810 m!1223337))

(declare-fun m!1223339 () Bool)

(assert (=> b!1335810 m!1223339))

(assert (=> b!1335812 m!1223337))

(assert (=> b!1335812 m!1223337))

(assert (=> b!1335812 m!1223339))

(assert (=> b!1335579 d!143427))

(declare-fun d!143429 () Bool)

(assert (=> d!143429 (= (validKeyInArray!0 (select (arr!43764 _keys!1590) from!1980)) (and (not (= (select (arr!43764 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43764 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1335578 d!143429))

(declare-fun b!1335819 () Bool)

(declare-fun e!760771 () Bool)

(assert (=> b!1335819 (= e!760771 tp_is_empty!36895)))

(declare-fun b!1335820 () Bool)

(declare-fun e!760770 () Bool)

(assert (=> b!1335820 (= e!760770 tp_is_empty!36895)))

(declare-fun mapNonEmpty!57025 () Bool)

(declare-fun mapRes!57025 () Bool)

(declare-fun tp!108608 () Bool)

(assert (=> mapNonEmpty!57025 (= mapRes!57025 (and tp!108608 e!760771))))

(declare-fun mapRest!57025 () (Array (_ BitVec 32) ValueCell!17549))

(declare-fun mapKey!57025 () (_ BitVec 32))

(declare-fun mapValue!57025 () ValueCell!17549)

(assert (=> mapNonEmpty!57025 (= mapRest!57016 (store mapRest!57025 mapKey!57025 mapValue!57025))))

(declare-fun condMapEmpty!57025 () Bool)

(declare-fun mapDefault!57025 () ValueCell!17549)

(assert (=> mapNonEmpty!57016 (= condMapEmpty!57025 (= mapRest!57016 ((as const (Array (_ BitVec 32) ValueCell!17549)) mapDefault!57025)))))

(assert (=> mapNonEmpty!57016 (= tp!108593 (and e!760770 mapRes!57025))))

(declare-fun mapIsEmpty!57025 () Bool)

(assert (=> mapIsEmpty!57025 mapRes!57025))

(assert (= (and mapNonEmpty!57016 condMapEmpty!57025) mapIsEmpty!57025))

(assert (= (and mapNonEmpty!57016 (not condMapEmpty!57025)) mapNonEmpty!57025))

(assert (= (and mapNonEmpty!57025 ((_ is ValueCellFull!17549) mapValue!57025)) b!1335819))

(assert (= (and mapNonEmpty!57016 ((_ is ValueCellFull!17549) mapDefault!57025)) b!1335820))

(declare-fun m!1223341 () Bool)

(assert (=> mapNonEmpty!57025 m!1223341))

(declare-fun b_lambda!24117 () Bool)

(assert (= b_lambda!24111 (or (and start!112590 b_free!30985) b_lambda!24117)))

(declare-fun b_lambda!24119 () Bool)

(assert (= b_lambda!24115 (or (and start!112590 b_free!30985) b_lambda!24119)))

(declare-fun b_lambda!24121 () Bool)

(assert (= b_lambda!24113 (or (and start!112590 b_free!30985) b_lambda!24121)))

(check-sat (not d!143427) tp_is_empty!36895 (not b!1335808) (not b_lambda!24119) (not d!143409) (not bm!64819) (not b!1335756) (not bm!64822) (not b!1335793) (not b!1335803) b_and!49891 (not b!1335733) (not bm!64820) (not bm!64803) (not b!1335739) (not bm!64830) (not b!1335684) (not b!1335809) (not b!1335673) (not b!1335766) (not b!1335742) (not b!1335729) (not b_lambda!24109) (not b!1335801) (not b!1335796) (not b!1335672) (not bm!64827) (not b!1335810) (not b!1335799) (not b!1335767) (not b!1335795) (not d!143407) (not b!1335764) (not b!1335759) (not d!143423) (not b!1335728) (not b_lambda!24121) (not b_lambda!24117) (not b!1335740) (not mapNonEmpty!57025) (not b!1335802) (not b_next!30985) (not b!1335682) (not b!1335765) (not d!143421) (not d!143419) (not bm!64818) (not b!1335671) (not b!1335798) (not b!1335812) (not b!1335746) (not b!1335732))
(check-sat b_and!49891 (not b_next!30985))
(get-model)

(declare-fun d!143431 () Bool)

(declare-fun e!760772 () Bool)

(assert (=> d!143431 e!760772))

(declare-fun res!886550 () Bool)

(assert (=> d!143431 (=> res!886550 e!760772)))

(declare-fun lt!592414 () Bool)

(assert (=> d!143431 (= res!886550 (not lt!592414))))

(declare-fun lt!592417 () Bool)

(assert (=> d!143431 (= lt!592414 lt!592417)))

(declare-fun lt!592415 () Unit!43702)

(declare-fun e!760773 () Unit!43702)

(assert (=> d!143431 (= lt!592415 e!760773)))

(declare-fun c!125927 () Bool)

(assert (=> d!143431 (= c!125927 lt!592417)))

(assert (=> d!143431 (= lt!592417 (containsKey!735 (toList!10819 lt!592404) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143431 (= (contains!8911 lt!592404 #b1000000000000000000000000000000000000000000000000000000000000000) lt!592414)))

(declare-fun b!1335821 () Bool)

(declare-fun lt!592416 () Unit!43702)

(assert (=> b!1335821 (= e!760773 lt!592416)))

(assert (=> b!1335821 (= lt!592416 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 lt!592404) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1335821 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592404) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1335822 () Bool)

(declare-fun Unit!43707 () Unit!43702)

(assert (=> b!1335822 (= e!760773 Unit!43707)))

(declare-fun b!1335823 () Bool)

(assert (=> b!1335823 (= e!760772 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143431 c!125927) b!1335821))

(assert (= (and d!143431 (not c!125927)) b!1335822))

(assert (= (and d!143431 (not res!886550)) b!1335823))

(declare-fun m!1223343 () Bool)

(assert (=> d!143431 m!1223343))

(declare-fun m!1223345 () Bool)

(assert (=> b!1335821 m!1223345))

(declare-fun m!1223347 () Bool)

(assert (=> b!1335821 m!1223347))

(assert (=> b!1335821 m!1223347))

(declare-fun m!1223349 () Bool)

(assert (=> b!1335821 m!1223349))

(assert (=> b!1335823 m!1223347))

(assert (=> b!1335823 m!1223347))

(assert (=> b!1335823 m!1223349))

(assert (=> b!1335795 d!143431))

(declare-fun d!143433 () Bool)

(declare-fun res!886555 () Bool)

(declare-fun e!760778 () Bool)

(assert (=> d!143433 (=> res!886555 e!760778)))

(assert (=> d!143433 (= res!886555 (and ((_ is Cons!31080) (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!11986 (h!32289 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143433 (= (containsKey!735 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!760778)))

(declare-fun b!1335828 () Bool)

(declare-fun e!760779 () Bool)

(assert (=> b!1335828 (= e!760778 e!760779)))

(declare-fun res!886556 () Bool)

(assert (=> b!1335828 (=> (not res!886556) (not e!760779))))

(assert (=> b!1335828 (= res!886556 (and (or (not ((_ is Cons!31080) (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) (bvsle (_1!11986 (h!32289 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)) ((_ is Cons!31080) (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (bvslt (_1!11986 (h!32289 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(declare-fun b!1335829 () Bool)

(assert (=> b!1335829 (= e!760779 (containsKey!735 (t!45342 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(assert (= (and d!143433 (not res!886555)) b!1335828))

(assert (= (and b!1335828 res!886556) b!1335829))

(declare-fun m!1223351 () Bool)

(assert (=> b!1335829 m!1223351))

(assert (=> d!143407 d!143433))

(declare-fun d!143435 () Bool)

(assert (=> d!143435 (= (get!22081 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1335809 d!143435))

(declare-fun d!143437 () Bool)

(declare-fun lt!592420 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!655 (List!31084) (InoxSet tuple2!23950))

(assert (=> d!143437 (= lt!592420 (select (content!655 (toList!10819 lt!592384)) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!760785 () Bool)

(assert (=> d!143437 (= lt!592420 e!760785)))

(declare-fun res!886561 () Bool)

(assert (=> d!143437 (=> (not res!886561) (not e!760785))))

(assert (=> d!143437 (= res!886561 ((_ is Cons!31080) (toList!10819 lt!592384)))))

(assert (=> d!143437 (= (contains!8915 (toList!10819 lt!592384) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!592420)))

(declare-fun b!1335834 () Bool)

(declare-fun e!760784 () Bool)

(assert (=> b!1335834 (= e!760785 e!760784)))

(declare-fun res!886562 () Bool)

(assert (=> b!1335834 (=> res!886562 e!760784)))

(assert (=> b!1335834 (= res!886562 (= (h!32289 (toList!10819 lt!592384)) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1335835 () Bool)

(assert (=> b!1335835 (= e!760784 (contains!8915 (t!45342 (toList!10819 lt!592384)) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143437 res!886561) b!1335834))

(assert (= (and b!1335834 (not res!886562)) b!1335835))

(declare-fun m!1223353 () Bool)

(assert (=> d!143437 m!1223353))

(declare-fun m!1223355 () Bool)

(assert (=> d!143437 m!1223355))

(declare-fun m!1223357 () Bool)

(assert (=> b!1335835 m!1223357))

(assert (=> b!1335765 d!143437))

(declare-fun d!143439 () Bool)

(declare-fun c!125932 () Bool)

(assert (=> d!143439 (= c!125932 (and ((_ is Cons!31080) (toList!10819 lt!592388)) (= (_1!11986 (h!32289 (toList!10819 lt!592388))) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun e!760790 () Option!769)

(assert (=> d!143439 (= (getValueByKey!718 (toList!10819 lt!592388) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) e!760790)))

(declare-fun b!1335847 () Bool)

(declare-fun e!760791 () Option!769)

(assert (=> b!1335847 (= e!760791 None!767)))

(declare-fun b!1335845 () Bool)

(assert (=> b!1335845 (= e!760790 e!760791)))

(declare-fun c!125933 () Bool)

(assert (=> b!1335845 (= c!125933 (and ((_ is Cons!31080) (toList!10819 lt!592388)) (not (= (_1!11986 (h!32289 (toList!10819 lt!592388))) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1335846 () Bool)

(assert (=> b!1335846 (= e!760791 (getValueByKey!718 (t!45342 (toList!10819 lt!592388)) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1335844 () Bool)

(assert (=> b!1335844 (= e!760790 (Some!768 (_2!11986 (h!32289 (toList!10819 lt!592388)))))))

(assert (= (and d!143439 c!125932) b!1335844))

(assert (= (and d!143439 (not c!125932)) b!1335845))

(assert (= (and b!1335845 c!125933) b!1335846))

(assert (= (and b!1335845 (not c!125933)) b!1335847))

(declare-fun m!1223359 () Bool)

(assert (=> b!1335846 m!1223359))

(assert (=> b!1335766 d!143439))

(declare-fun b!1335848 () Bool)

(declare-fun e!760794 () ListLongMap!21607)

(declare-fun call!64834 () ListLongMap!21607)

(assert (=> b!1335848 (= e!760794 call!64834)))

(declare-fun d!143441 () Bool)

(declare-fun e!760792 () Bool)

(assert (=> d!143441 e!760792))

(declare-fun res!886563 () Bool)

(assert (=> d!143441 (=> (not res!886563) (not e!760792))))

(declare-fun lt!592422 () ListLongMap!21607)

(assert (=> d!143441 (= res!886563 (not (contains!8911 lt!592422 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!760798 () ListLongMap!21607)

(assert (=> d!143441 (= lt!592422 e!760798)))

(declare-fun c!125934 () Bool)

(assert (=> d!143441 (= c!125934 (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44316 _keys!1590)))))

(assert (=> d!143441 (validMask!0 mask!1998)))

(assert (=> d!143441 (= (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323) lt!592422)))

(declare-fun b!1335849 () Bool)

(declare-fun e!760793 () Bool)

(assert (=> b!1335849 (= e!760793 (validKeyInArray!0 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(assert (=> b!1335849 (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1335850 () Bool)

(declare-fun e!760795 () Bool)

(declare-fun e!760796 () Bool)

(assert (=> b!1335850 (= e!760795 e!760796)))

(declare-fun c!125937 () Bool)

(assert (=> b!1335850 (= c!125937 (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44316 _keys!1590)))))

(declare-fun b!1335851 () Bool)

(declare-fun res!886565 () Bool)

(assert (=> b!1335851 (=> (not res!886565) (not e!760792))))

(assert (=> b!1335851 (= res!886565 (not (contains!8911 lt!592422 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1335852 () Bool)

(declare-fun lt!592425 () Unit!43702)

(declare-fun lt!592423 () Unit!43702)

(assert (=> b!1335852 (= lt!592425 lt!592423)))

(declare-fun lt!592426 () ListLongMap!21607)

(declare-fun lt!592424 () (_ BitVec 64))

(declare-fun lt!592421 () V!54297)

(declare-fun lt!592427 () (_ BitVec 64))

(assert (=> b!1335852 (not (contains!8911 (+!4753 lt!592426 (tuple2!23951 lt!592427 lt!592421)) lt!592424))))

(assert (=> b!1335852 (= lt!592423 (addStillNotContains!484 lt!592426 lt!592427 lt!592421 lt!592424))))

(assert (=> b!1335852 (= lt!592424 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1335852 (= lt!592421 (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1335852 (= lt!592427 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)))))

(assert (=> b!1335852 (= lt!592426 call!64834)))

(assert (=> b!1335852 (= e!760794 (+!4753 call!64834 (tuple2!23951 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1335853 () Bool)

(assert (=> b!1335853 (= e!760792 e!760795)))

(declare-fun c!125935 () Bool)

(assert (=> b!1335853 (= c!125935 e!760793)))

(declare-fun res!886566 () Bool)

(assert (=> b!1335853 (=> (not res!886566) (not e!760793))))

(assert (=> b!1335853 (= res!886566 (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44316 _keys!1590)))))

(declare-fun bm!64831 () Bool)

(assert (=> bm!64831 (= call!64834 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1335854 () Bool)

(assert (=> b!1335854 (= e!760796 (= lt!592422 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1335855 () Bool)

(declare-fun e!760797 () Bool)

(assert (=> b!1335855 (= e!760795 e!760797)))

(assert (=> b!1335855 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44316 _keys!1590)))))

(declare-fun res!886564 () Bool)

(assert (=> b!1335855 (= res!886564 (contains!8911 lt!592422 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(assert (=> b!1335855 (=> (not res!886564) (not e!760797))))

(declare-fun b!1335856 () Bool)

(assert (=> b!1335856 (= e!760798 (ListLongMap!21608 Nil!31081))))

(declare-fun b!1335857 () Bool)

(assert (=> b!1335857 (= e!760796 (isEmpty!1087 lt!592422))))

(declare-fun b!1335858 () Bool)

(assert (=> b!1335858 (= e!760798 e!760794)))

(declare-fun c!125936 () Bool)

(assert (=> b!1335858 (= c!125936 (validKeyInArray!0 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(declare-fun b!1335859 () Bool)

(assert (=> b!1335859 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44316 _keys!1590)))))

(assert (=> b!1335859 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44317 _values!1320)))))

(assert (=> b!1335859 (= e!760797 (= (apply!1025 lt!592422 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!143441 c!125934) b!1335856))

(assert (= (and d!143441 (not c!125934)) b!1335858))

(assert (= (and b!1335858 c!125936) b!1335852))

(assert (= (and b!1335858 (not c!125936)) b!1335848))

(assert (= (or b!1335852 b!1335848) bm!64831))

(assert (= (and d!143441 res!886563) b!1335851))

(assert (= (and b!1335851 res!886565) b!1335853))

(assert (= (and b!1335853 res!886566) b!1335849))

(assert (= (and b!1335853 c!125935) b!1335855))

(assert (= (and b!1335853 (not c!125935)) b!1335850))

(assert (= (and b!1335855 res!886564) b!1335859))

(assert (= (and b!1335850 c!125937) b!1335854))

(assert (= (and b!1335850 (not c!125937)) b!1335857))

(declare-fun b_lambda!24123 () Bool)

(assert (=> (not b_lambda!24123) (not b!1335852)))

(assert (=> b!1335852 t!45341))

(declare-fun b_and!49893 () Bool)

(assert (= b_and!49891 (and (=> t!45341 result!25201) b_and!49893)))

(declare-fun b_lambda!24125 () Bool)

(assert (=> (not b_lambda!24125) (not b!1335859)))

(assert (=> b!1335859 t!45341))

(declare-fun b_and!49895 () Bool)

(assert (= b_and!49893 (and (=> t!45341 result!25201) b_and!49895)))

(declare-fun m!1223361 () Bool)

(assert (=> b!1335857 m!1223361))

(declare-fun m!1223363 () Bool)

(assert (=> d!143441 m!1223363))

(assert (=> d!143441 m!1223103))

(declare-fun m!1223365 () Bool)

(assert (=> bm!64831 m!1223365))

(assert (=> b!1335859 m!1223129))

(declare-fun m!1223367 () Bool)

(assert (=> b!1335859 m!1223367))

(assert (=> b!1335859 m!1223129))

(declare-fun m!1223369 () Bool)

(assert (=> b!1335859 m!1223369))

(declare-fun m!1223371 () Bool)

(assert (=> b!1335859 m!1223371))

(declare-fun m!1223373 () Bool)

(assert (=> b!1335859 m!1223373))

(assert (=> b!1335859 m!1223367))

(assert (=> b!1335859 m!1223371))

(assert (=> b!1335858 m!1223371))

(assert (=> b!1335858 m!1223371))

(declare-fun m!1223375 () Bool)

(assert (=> b!1335858 m!1223375))

(assert (=> b!1335849 m!1223371))

(assert (=> b!1335849 m!1223371))

(assert (=> b!1335849 m!1223375))

(assert (=> b!1335854 m!1223365))

(assert (=> b!1335855 m!1223371))

(assert (=> b!1335855 m!1223371))

(declare-fun m!1223377 () Bool)

(assert (=> b!1335855 m!1223377))

(declare-fun m!1223379 () Bool)

(assert (=> b!1335851 m!1223379))

(assert (=> b!1335852 m!1223129))

(declare-fun m!1223381 () Bool)

(assert (=> b!1335852 m!1223381))

(declare-fun m!1223383 () Bool)

(assert (=> b!1335852 m!1223383))

(declare-fun m!1223385 () Bool)

(assert (=> b!1335852 m!1223385))

(assert (=> b!1335852 m!1223367))

(assert (=> b!1335852 m!1223383))

(assert (=> b!1335852 m!1223371))

(assert (=> b!1335852 m!1223367))

(assert (=> b!1335852 m!1223129))

(assert (=> b!1335852 m!1223369))

(declare-fun m!1223387 () Bool)

(assert (=> b!1335852 m!1223387))

(assert (=> bm!64830 d!143441))

(declare-fun d!143443 () Bool)

(declare-fun c!125938 () Bool)

(assert (=> d!143443 (= c!125938 (and ((_ is Cons!31080) (toList!10819 lt!592384)) (= (_1!11986 (h!32289 (toList!10819 lt!592384))) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!760799 () Option!769)

(assert (=> d!143443 (= (getValueByKey!718 (toList!10819 lt!592384) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!760799)))

(declare-fun b!1335863 () Bool)

(declare-fun e!760800 () Option!769)

(assert (=> b!1335863 (= e!760800 None!767)))

(declare-fun b!1335861 () Bool)

(assert (=> b!1335861 (= e!760799 e!760800)))

(declare-fun c!125939 () Bool)

(assert (=> b!1335861 (= c!125939 (and ((_ is Cons!31080) (toList!10819 lt!592384)) (not (= (_1!11986 (h!32289 (toList!10819 lt!592384))) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1335862 () Bool)

(assert (=> b!1335862 (= e!760800 (getValueByKey!718 (t!45342 (toList!10819 lt!592384)) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1335860 () Bool)

(assert (=> b!1335860 (= e!760799 (Some!768 (_2!11986 (h!32289 (toList!10819 lt!592384)))))))

(assert (= (and d!143443 c!125938) b!1335860))

(assert (= (and d!143443 (not c!125938)) b!1335861))

(assert (= (and b!1335861 c!125939) b!1335862))

(assert (= (and b!1335861 (not c!125939)) b!1335863))

(declare-fun m!1223389 () Bool)

(assert (=> b!1335862 m!1223389))

(assert (=> b!1335764 d!143443))

(declare-fun d!143445 () Bool)

(declare-fun e!760801 () Bool)

(assert (=> d!143445 e!760801))

(declare-fun res!886567 () Bool)

(assert (=> d!143445 (=> (not res!886567) (not e!760801))))

(declare-fun lt!592431 () ListLongMap!21607)

(assert (=> d!143445 (= res!886567 (contains!8911 lt!592431 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!592430 () List!31084)

(assert (=> d!143445 (= lt!592431 (ListLongMap!21608 lt!592430))))

(declare-fun lt!592428 () Unit!43702)

(declare-fun lt!592429 () Unit!43702)

(assert (=> d!143445 (= lt!592428 lt!592429)))

(assert (=> d!143445 (= (getValueByKey!718 lt!592430 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!768 (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143445 (= lt!592429 (lemmaContainsTupThenGetReturnValue!361 lt!592430 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143445 (= lt!592430 (insertStrictlySorted!490 (toList!10819 call!64826) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143445 (= (+!4753 call!64826 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!592431)))

(declare-fun b!1335864 () Bool)

(declare-fun res!886568 () Bool)

(assert (=> b!1335864 (=> (not res!886568) (not e!760801))))

(assert (=> b!1335864 (= res!886568 (= (getValueByKey!718 (toList!10819 lt!592431) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!768 (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1335865 () Bool)

(assert (=> b!1335865 (= e!760801 (contains!8915 (toList!10819 lt!592431) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143445 res!886567) b!1335864))

(assert (= (and b!1335864 res!886568) b!1335865))

(declare-fun m!1223391 () Bool)

(assert (=> d!143445 m!1223391))

(declare-fun m!1223393 () Bool)

(assert (=> d!143445 m!1223393))

(declare-fun m!1223395 () Bool)

(assert (=> d!143445 m!1223395))

(declare-fun m!1223397 () Bool)

(assert (=> d!143445 m!1223397))

(declare-fun m!1223399 () Bool)

(assert (=> b!1335864 m!1223399))

(declare-fun m!1223401 () Bool)

(assert (=> b!1335865 m!1223401))

(assert (=> b!1335740 d!143445))

(declare-fun d!143447 () Bool)

(declare-fun e!760802 () Bool)

(assert (=> d!143447 e!760802))

(declare-fun res!886569 () Bool)

(assert (=> d!143447 (=> (not res!886569) (not e!760802))))

(declare-fun lt!592435 () ListLongMap!21607)

(assert (=> d!143447 (= res!886569 (contains!8911 lt!592435 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!592434 () List!31084)

(assert (=> d!143447 (= lt!592435 (ListLongMap!21608 lt!592434))))

(declare-fun lt!592432 () Unit!43702)

(declare-fun lt!592433 () Unit!43702)

(assert (=> d!143447 (= lt!592432 lt!592433)))

(assert (=> d!143447 (= (getValueByKey!718 lt!592434 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143447 (= lt!592433 (lemmaContainsTupThenGetReturnValue!361 lt!592434 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143447 (= lt!592434 (insertStrictlySorted!490 (toList!10819 call!64833) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143447 (= (+!4753 call!64833 (tuple2!23951 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!592435)))

(declare-fun b!1335866 () Bool)

(declare-fun res!886570 () Bool)

(assert (=> b!1335866 (=> (not res!886570) (not e!760802))))

(assert (=> b!1335866 (= res!886570 (= (getValueByKey!718 (toList!10819 lt!592435) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1335867 () Bool)

(assert (=> b!1335867 (= e!760802 (contains!8915 (toList!10819 lt!592435) (tuple2!23951 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143447 res!886569) b!1335866))

(assert (= (and b!1335866 res!886570) b!1335867))

(declare-fun m!1223403 () Bool)

(assert (=> d!143447 m!1223403))

(declare-fun m!1223405 () Bool)

(assert (=> d!143447 m!1223405))

(declare-fun m!1223407 () Bool)

(assert (=> d!143447 m!1223407))

(declare-fun m!1223409 () Bool)

(assert (=> d!143447 m!1223409))

(declare-fun m!1223411 () Bool)

(assert (=> b!1335866 m!1223411))

(declare-fun m!1223413 () Bool)

(assert (=> b!1335867 m!1223413))

(assert (=> b!1335796 d!143447))

(declare-fun d!143449 () Bool)

(assert (=> d!143449 (not (contains!8911 (+!4753 lt!592408 (tuple2!23951 lt!592409 lt!592403)) lt!592406))))

(declare-fun lt!592438 () Unit!43702)

(declare-fun choose!1964 (ListLongMap!21607 (_ BitVec 64) V!54297 (_ BitVec 64)) Unit!43702)

(assert (=> d!143449 (= lt!592438 (choose!1964 lt!592408 lt!592409 lt!592403 lt!592406))))

(declare-fun e!760805 () Bool)

(assert (=> d!143449 e!760805))

(declare-fun res!886573 () Bool)

(assert (=> d!143449 (=> (not res!886573) (not e!760805))))

(assert (=> d!143449 (= res!886573 (not (contains!8911 lt!592408 lt!592406)))))

(assert (=> d!143449 (= (addStillNotContains!484 lt!592408 lt!592409 lt!592403 lt!592406) lt!592438)))

(declare-fun b!1335871 () Bool)

(assert (=> b!1335871 (= e!760805 (not (= lt!592409 lt!592406)))))

(assert (= (and d!143449 res!886573) b!1335871))

(assert (=> d!143449 m!1223323))

(assert (=> d!143449 m!1223323))

(assert (=> d!143449 m!1223325))

(declare-fun m!1223415 () Bool)

(assert (=> d!143449 m!1223415))

(declare-fun m!1223417 () Bool)

(assert (=> d!143449 m!1223417))

(assert (=> b!1335796 d!143449))

(declare-fun d!143451 () Bool)

(declare-fun e!760806 () Bool)

(assert (=> d!143451 e!760806))

(declare-fun res!886574 () Bool)

(assert (=> d!143451 (=> res!886574 e!760806)))

(declare-fun lt!592439 () Bool)

(assert (=> d!143451 (= res!886574 (not lt!592439))))

(declare-fun lt!592442 () Bool)

(assert (=> d!143451 (= lt!592439 lt!592442)))

(declare-fun lt!592440 () Unit!43702)

(declare-fun e!760807 () Unit!43702)

(assert (=> d!143451 (= lt!592440 e!760807)))

(declare-fun c!125940 () Bool)

(assert (=> d!143451 (= c!125940 lt!592442)))

(assert (=> d!143451 (= lt!592442 (containsKey!735 (toList!10819 (+!4753 lt!592408 (tuple2!23951 lt!592409 lt!592403))) lt!592406))))

(assert (=> d!143451 (= (contains!8911 (+!4753 lt!592408 (tuple2!23951 lt!592409 lt!592403)) lt!592406) lt!592439)))

(declare-fun b!1335872 () Bool)

(declare-fun lt!592441 () Unit!43702)

(assert (=> b!1335872 (= e!760807 lt!592441)))

(assert (=> b!1335872 (= lt!592441 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 (+!4753 lt!592408 (tuple2!23951 lt!592409 lt!592403))) lt!592406))))

(assert (=> b!1335872 (isDefined!525 (getValueByKey!718 (toList!10819 (+!4753 lt!592408 (tuple2!23951 lt!592409 lt!592403))) lt!592406))))

(declare-fun b!1335873 () Bool)

(declare-fun Unit!43708 () Unit!43702)

(assert (=> b!1335873 (= e!760807 Unit!43708)))

(declare-fun b!1335874 () Bool)

(assert (=> b!1335874 (= e!760806 (isDefined!525 (getValueByKey!718 (toList!10819 (+!4753 lt!592408 (tuple2!23951 lt!592409 lt!592403))) lt!592406)))))

(assert (= (and d!143451 c!125940) b!1335872))

(assert (= (and d!143451 (not c!125940)) b!1335873))

(assert (= (and d!143451 (not res!886574)) b!1335874))

(declare-fun m!1223419 () Bool)

(assert (=> d!143451 m!1223419))

(declare-fun m!1223421 () Bool)

(assert (=> b!1335872 m!1223421))

(declare-fun m!1223423 () Bool)

(assert (=> b!1335872 m!1223423))

(assert (=> b!1335872 m!1223423))

(declare-fun m!1223425 () Bool)

(assert (=> b!1335872 m!1223425))

(assert (=> b!1335874 m!1223423))

(assert (=> b!1335874 m!1223423))

(assert (=> b!1335874 m!1223425))

(assert (=> b!1335796 d!143451))

(declare-fun d!143453 () Bool)

(declare-fun c!125941 () Bool)

(assert (=> d!143453 (= c!125941 ((_ is ValueCellFull!17549) (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun e!760808 () V!54297)

(assert (=> d!143453 (= (get!22078 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!760808)))

(declare-fun b!1335875 () Bool)

(assert (=> b!1335875 (= e!760808 (get!22080 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1335876 () Bool)

(assert (=> b!1335876 (= e!760808 (get!22081 (select (arr!43765 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143453 c!125941) b!1335875))

(assert (= (and d!143453 (not c!125941)) b!1335876))

(assert (=> b!1335875 m!1223307))

(assert (=> b!1335875 m!1223129))

(declare-fun m!1223427 () Bool)

(assert (=> b!1335875 m!1223427))

(assert (=> b!1335876 m!1223307))

(assert (=> b!1335876 m!1223129))

(declare-fun m!1223429 () Bool)

(assert (=> b!1335876 m!1223429))

(assert (=> b!1335796 d!143453))

(declare-fun d!143455 () Bool)

(declare-fun e!760809 () Bool)

(assert (=> d!143455 e!760809))

(declare-fun res!886575 () Bool)

(assert (=> d!143455 (=> (not res!886575) (not e!760809))))

(declare-fun lt!592446 () ListLongMap!21607)

(assert (=> d!143455 (= res!886575 (contains!8911 lt!592446 (_1!11986 (tuple2!23951 lt!592409 lt!592403))))))

(declare-fun lt!592445 () List!31084)

(assert (=> d!143455 (= lt!592446 (ListLongMap!21608 lt!592445))))

(declare-fun lt!592443 () Unit!43702)

(declare-fun lt!592444 () Unit!43702)

(assert (=> d!143455 (= lt!592443 lt!592444)))

(assert (=> d!143455 (= (getValueByKey!718 lt!592445 (_1!11986 (tuple2!23951 lt!592409 lt!592403))) (Some!768 (_2!11986 (tuple2!23951 lt!592409 lt!592403))))))

(assert (=> d!143455 (= lt!592444 (lemmaContainsTupThenGetReturnValue!361 lt!592445 (_1!11986 (tuple2!23951 lt!592409 lt!592403)) (_2!11986 (tuple2!23951 lt!592409 lt!592403))))))

(assert (=> d!143455 (= lt!592445 (insertStrictlySorted!490 (toList!10819 lt!592408) (_1!11986 (tuple2!23951 lt!592409 lt!592403)) (_2!11986 (tuple2!23951 lt!592409 lt!592403))))))

(assert (=> d!143455 (= (+!4753 lt!592408 (tuple2!23951 lt!592409 lt!592403)) lt!592446)))

(declare-fun b!1335877 () Bool)

(declare-fun res!886576 () Bool)

(assert (=> b!1335877 (=> (not res!886576) (not e!760809))))

(assert (=> b!1335877 (= res!886576 (= (getValueByKey!718 (toList!10819 lt!592446) (_1!11986 (tuple2!23951 lt!592409 lt!592403))) (Some!768 (_2!11986 (tuple2!23951 lt!592409 lt!592403)))))))

(declare-fun b!1335878 () Bool)

(assert (=> b!1335878 (= e!760809 (contains!8915 (toList!10819 lt!592446) (tuple2!23951 lt!592409 lt!592403)))))

(assert (= (and d!143455 res!886575) b!1335877))

(assert (= (and b!1335877 res!886576) b!1335878))

(declare-fun m!1223431 () Bool)

(assert (=> d!143455 m!1223431))

(declare-fun m!1223433 () Bool)

(assert (=> d!143455 m!1223433))

(declare-fun m!1223435 () Bool)

(assert (=> d!143455 m!1223435))

(declare-fun m!1223437 () Bool)

(assert (=> d!143455 m!1223437))

(declare-fun m!1223439 () Bool)

(assert (=> b!1335877 m!1223439))

(declare-fun m!1223441 () Bool)

(assert (=> b!1335878 m!1223441))

(assert (=> b!1335796 d!143455))

(assert (=> b!1335739 d!143429))

(declare-fun d!143457 () Bool)

(assert (=> d!143457 (= (validKeyInArray!0 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000)) (and (not (= (select (arr!43764 _keys!1590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43764 _keys!1590) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1335671 d!143457))

(declare-fun d!143459 () Bool)

(declare-fun e!760810 () Bool)

(assert (=> d!143459 e!760810))

(declare-fun res!886577 () Bool)

(assert (=> d!143459 (=> res!886577 e!760810)))

(declare-fun lt!592447 () Bool)

(assert (=> d!143459 (= res!886577 (not lt!592447))))

(declare-fun lt!592450 () Bool)

(assert (=> d!143459 (= lt!592447 lt!592450)))

(declare-fun lt!592448 () Unit!43702)

(declare-fun e!760811 () Unit!43702)

(assert (=> d!143459 (= lt!592448 e!760811)))

(declare-fun c!125942 () Bool)

(assert (=> d!143459 (= c!125942 lt!592450)))

(assert (=> d!143459 (= lt!592450 (containsKey!735 (toList!10819 lt!592343) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143459 (= (contains!8911 lt!592343 #b1000000000000000000000000000000000000000000000000000000000000000) lt!592447)))

(declare-fun b!1335879 () Bool)

(declare-fun lt!592449 () Unit!43702)

(assert (=> b!1335879 (= e!760811 lt!592449)))

(assert (=> b!1335879 (= lt!592449 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 lt!592343) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1335879 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592343) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1335880 () Bool)

(declare-fun Unit!43709 () Unit!43702)

(assert (=> b!1335880 (= e!760811 Unit!43709)))

(declare-fun b!1335881 () Bool)

(assert (=> b!1335881 (= e!760810 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592343) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143459 c!125942) b!1335879))

(assert (= (and d!143459 (not c!125942)) b!1335880))

(assert (= (and d!143459 (not res!886577)) b!1335881))

(declare-fun m!1223443 () Bool)

(assert (=> d!143459 m!1223443))

(declare-fun m!1223445 () Bool)

(assert (=> b!1335879 m!1223445))

(declare-fun m!1223447 () Bool)

(assert (=> b!1335879 m!1223447))

(assert (=> b!1335879 m!1223447))

(declare-fun m!1223449 () Bool)

(assert (=> b!1335879 m!1223449))

(assert (=> b!1335881 m!1223447))

(assert (=> b!1335881 m!1223447))

(assert (=> b!1335881 m!1223449))

(assert (=> bm!64822 d!143459))

(declare-fun d!143461 () Bool)

(declare-fun e!760812 () Bool)

(assert (=> d!143461 e!760812))

(declare-fun res!886578 () Bool)

(assert (=> d!143461 (=> res!886578 e!760812)))

(declare-fun lt!592451 () Bool)

(assert (=> d!143461 (= res!886578 (not lt!592451))))

(declare-fun lt!592454 () Bool)

(assert (=> d!143461 (= lt!592451 lt!592454)))

(declare-fun lt!592452 () Unit!43702)

(declare-fun e!760813 () Unit!43702)

(assert (=> d!143461 (= lt!592452 e!760813)))

(declare-fun c!125943 () Bool)

(assert (=> d!143461 (= c!125943 lt!592454)))

(assert (=> d!143461 (= lt!592454 (containsKey!735 (toList!10819 lt!592404) (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> d!143461 (= (contains!8911 lt!592404 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) lt!592451)))

(declare-fun b!1335882 () Bool)

(declare-fun lt!592453 () Unit!43702)

(assert (=> b!1335882 (= e!760813 lt!592453)))

(assert (=> b!1335882 (= lt!592453 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 lt!592404) (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1335882 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592404) (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1335883 () Bool)

(declare-fun Unit!43710 () Unit!43702)

(assert (=> b!1335883 (= e!760813 Unit!43710)))

(declare-fun b!1335884 () Bool)

(assert (=> b!1335884 (= e!760812 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592404) (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(assert (= (and d!143461 c!125943) b!1335882))

(assert (= (and d!143461 (not c!125943)) b!1335883))

(assert (= (and d!143461 (not res!886578)) b!1335884))

(assert (=> d!143461 m!1223311))

(declare-fun m!1223451 () Bool)

(assert (=> d!143461 m!1223451))

(assert (=> b!1335882 m!1223311))

(declare-fun m!1223453 () Bool)

(assert (=> b!1335882 m!1223453))

(assert (=> b!1335882 m!1223311))

(declare-fun m!1223455 () Bool)

(assert (=> b!1335882 m!1223455))

(assert (=> b!1335882 m!1223455))

(declare-fun m!1223457 () Bool)

(assert (=> b!1335882 m!1223457))

(assert (=> b!1335884 m!1223311))

(assert (=> b!1335884 m!1223455))

(assert (=> b!1335884 m!1223455))

(assert (=> b!1335884 m!1223457))

(assert (=> b!1335799 d!143461))

(declare-fun d!143463 () Bool)

(declare-fun res!886579 () Bool)

(declare-fun e!760814 () Bool)

(assert (=> d!143463 (=> res!886579 e!760814)))

(assert (=> d!143463 (= res!886579 (and ((_ is Cons!31080) (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (= (_1!11986 (h!32289 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153)))))

(assert (=> d!143463 (= (containsKey!735 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153) e!760814)))

(declare-fun b!1335885 () Bool)

(declare-fun e!760815 () Bool)

(assert (=> b!1335885 (= e!760814 e!760815)))

(declare-fun res!886580 () Bool)

(assert (=> b!1335885 (=> (not res!886580) (not e!760815))))

(assert (=> b!1335885 (= res!886580 (and (or (not ((_ is Cons!31080) (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) (bvsle (_1!11986 (h!32289 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153)) ((_ is Cons!31080) (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (bvslt (_1!11986 (h!32289 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153)))))

(declare-fun b!1335886 () Bool)

(assert (=> b!1335886 (= e!760815 (containsKey!735 (t!45342 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) k0!1153))))

(assert (= (and d!143463 (not res!886579)) b!1335885))

(assert (= (and b!1335885 res!886580) b!1335886))

(declare-fun m!1223459 () Bool)

(assert (=> b!1335886 m!1223459))

(assert (=> d!143427 d!143463))

(declare-fun d!143465 () Bool)

(declare-fun get!22082 (Option!769) V!54297)

(assert (=> d!143465 (= (apply!1025 lt!592343 (select (arr!43764 _keys!1590) from!1980)) (get!22082 (getValueByKey!718 (toList!10819 lt!592343) (select (arr!43764 _keys!1590) from!1980))))))

(declare-fun bs!38220 () Bool)

(assert (= bs!38220 d!143465))

(assert (=> bs!38220 m!1223109))

(declare-fun m!1223461 () Bool)

(assert (=> bs!38220 m!1223461))

(assert (=> bs!38220 m!1223461))

(declare-fun m!1223463 () Bool)

(assert (=> bs!38220 m!1223463))

(assert (=> b!1335742 d!143465))

(assert (=> b!1335742 d!143425))

(declare-fun d!143467 () Bool)

(declare-fun lt!592455 () Bool)

(assert (=> d!143467 (= lt!592455 (select (content!655 (toList!10819 lt!592388)) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun e!760817 () Bool)

(assert (=> d!143467 (= lt!592455 e!760817)))

(declare-fun res!886581 () Bool)

(assert (=> d!143467 (=> (not res!886581) (not e!760817))))

(assert (=> d!143467 (= res!886581 ((_ is Cons!31080) (toList!10819 lt!592388)))))

(assert (=> d!143467 (= (contains!8915 (toList!10819 lt!592388) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!592455)))

(declare-fun b!1335887 () Bool)

(declare-fun e!760816 () Bool)

(assert (=> b!1335887 (= e!760817 e!760816)))

(declare-fun res!886582 () Bool)

(assert (=> b!1335887 (=> res!886582 e!760816)))

(assert (=> b!1335887 (= res!886582 (= (h!32289 (toList!10819 lt!592388)) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1335888 () Bool)

(assert (=> b!1335888 (= e!760816 (contains!8915 (t!45342 (toList!10819 lt!592388)) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143467 res!886581) b!1335887))

(assert (= (and b!1335887 (not res!886582)) b!1335888))

(declare-fun m!1223465 () Bool)

(assert (=> d!143467 m!1223465))

(declare-fun m!1223467 () Bool)

(assert (=> d!143467 m!1223467))

(declare-fun m!1223469 () Bool)

(assert (=> b!1335888 m!1223469))

(assert (=> b!1335767 d!143467))

(assert (=> b!1335798 d!143441))

(assert (=> d!143409 d!143413))

(declare-fun d!143469 () Bool)

(assert (=> d!143469 (= (apply!1025 lt!592343 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22082 (getValueByKey!718 (toList!10819 lt!592343) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38221 () Bool)

(assert (= bs!38221 d!143469))

(assert (=> bs!38221 m!1223447))

(assert (=> bs!38221 m!1223447))

(declare-fun m!1223471 () Bool)

(assert (=> bs!38221 m!1223471))

(assert (=> b!1335728 d!143469))

(declare-fun d!143471 () Bool)

(assert (=> d!143471 (= (validKeyInArray!0 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (and (not (= (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1335802 d!143471))

(declare-fun d!143473 () Bool)

(declare-fun lt!592458 () Bool)

(declare-fun content!656 (List!31085) (InoxSet (_ BitVec 64)))

(assert (=> d!143473 (= lt!592458 (select (content!656 Nil!31082) (select (arr!43764 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun e!760823 () Bool)

(assert (=> d!143473 (= lt!592458 e!760823)))

(declare-fun res!886587 () Bool)

(assert (=> d!143473 (=> (not res!886587) (not e!760823))))

(assert (=> d!143473 (= res!886587 ((_ is Cons!31081) Nil!31082))))

(assert (=> d!143473 (= (contains!8914 Nil!31082 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000)) lt!592458)))

(declare-fun b!1335893 () Bool)

(declare-fun e!760822 () Bool)

(assert (=> b!1335893 (= e!760823 e!760822)))

(declare-fun res!886588 () Bool)

(assert (=> b!1335893 (=> res!886588 e!760822)))

(assert (=> b!1335893 (= res!886588 (= (h!32290 Nil!31082) (select (arr!43764 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1335894 () Bool)

(assert (=> b!1335894 (= e!760822 (contains!8914 (t!45343 Nil!31082) (select (arr!43764 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!143473 res!886587) b!1335893))

(assert (= (and b!1335893 (not res!886588)) b!1335894))

(declare-fun m!1223473 () Bool)

(assert (=> d!143473 m!1223473))

(assert (=> d!143473 m!1223205))

(declare-fun m!1223475 () Bool)

(assert (=> d!143473 m!1223475))

(assert (=> b!1335894 m!1223205))

(declare-fun m!1223477 () Bool)

(assert (=> b!1335894 m!1223477))

(assert (=> b!1335673 d!143473))

(assert (=> b!1335672 d!143457))

(declare-fun bm!64832 () Bool)

(declare-fun call!64835 () Bool)

(assert (=> bm!64832 (= call!64835 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun d!143475 () Bool)

(declare-fun res!886589 () Bool)

(declare-fun e!760826 () Bool)

(assert (=> d!143475 (=> res!886589 e!760826)))

(assert (=> d!143475 (= res!886589 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44316 _keys!1590)))))

(assert (=> d!143475 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998) e!760826)))

(declare-fun b!1335895 () Bool)

(declare-fun e!760824 () Bool)

(assert (=> b!1335895 (= e!760826 e!760824)))

(declare-fun c!125944 () Bool)

(assert (=> b!1335895 (= c!125944 (validKeyInArray!0 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1335896 () Bool)

(assert (=> b!1335896 (= e!760824 call!64835)))

(declare-fun b!1335897 () Bool)

(declare-fun e!760825 () Bool)

(assert (=> b!1335897 (= e!760825 call!64835)))

(declare-fun b!1335898 () Bool)

(assert (=> b!1335898 (= e!760824 e!760825)))

(declare-fun lt!592459 () (_ BitVec 64))

(assert (=> b!1335898 (= lt!592459 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!592461 () Unit!43702)

(assert (=> b!1335898 (= lt!592461 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!592459 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1335898 (arrayContainsKey!0 _keys!1590 lt!592459 #b00000000000000000000000000000000)))

(declare-fun lt!592460 () Unit!43702)

(assert (=> b!1335898 (= lt!592460 lt!592461)))

(declare-fun res!886590 () Bool)

(assert (=> b!1335898 (= res!886590 (= (seekEntryOrOpen!0 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1590 mask!1998) (Found!10046 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1335898 (=> (not res!886590) (not e!760825))))

(assert (= (and d!143475 (not res!886589)) b!1335895))

(assert (= (and b!1335895 c!125944) b!1335898))

(assert (= (and b!1335895 (not c!125944)) b!1335896))

(assert (= (and b!1335898 res!886590) b!1335897))

(assert (= (or b!1335897 b!1335896) bm!64832))

(declare-fun m!1223479 () Bool)

(assert (=> bm!64832 m!1223479))

(declare-fun m!1223481 () Bool)

(assert (=> b!1335895 m!1223481))

(assert (=> b!1335895 m!1223481))

(declare-fun m!1223483 () Bool)

(assert (=> b!1335895 m!1223483))

(assert (=> b!1335898 m!1223481))

(declare-fun m!1223485 () Bool)

(assert (=> b!1335898 m!1223485))

(declare-fun m!1223487 () Bool)

(assert (=> b!1335898 m!1223487))

(assert (=> b!1335898 m!1223481))

(declare-fun m!1223489 () Bool)

(assert (=> b!1335898 m!1223489))

(assert (=> bm!64827 d!143475))

(assert (=> b!1335756 d!143457))

(declare-fun d!143477 () Bool)

(declare-fun isEmpty!1088 (List!31084) Bool)

(assert (=> d!143477 (= (isEmpty!1087 lt!592404) (isEmpty!1088 (toList!10819 lt!592404)))))

(declare-fun bs!38222 () Bool)

(assert (= bs!38222 d!143477))

(declare-fun m!1223491 () Bool)

(assert (=> bs!38222 m!1223491))

(assert (=> b!1335801 d!143477))

(declare-fun d!143479 () Bool)

(assert (=> d!143479 (= (apply!1025 lt!592361 lt!592349) (get!22082 (getValueByKey!718 (toList!10819 lt!592361) lt!592349)))))

(declare-fun bs!38223 () Bool)

(assert (= bs!38223 d!143479))

(declare-fun m!1223493 () Bool)

(assert (=> bs!38223 m!1223493))

(assert (=> bs!38223 m!1223493))

(declare-fun m!1223495 () Bool)

(assert (=> bs!38223 m!1223495))

(assert (=> b!1335746 d!143479))

(declare-fun d!143481 () Bool)

(assert (=> d!143481 (= (apply!1025 (+!4753 lt!592358 (tuple2!23951 lt!592362 zeroValue!1262)) lt!592354) (get!22082 (getValueByKey!718 (toList!10819 (+!4753 lt!592358 (tuple2!23951 lt!592362 zeroValue!1262))) lt!592354)))))

(declare-fun bs!38224 () Bool)

(assert (= bs!38224 d!143481))

(declare-fun m!1223497 () Bool)

(assert (=> bs!38224 m!1223497))

(assert (=> bs!38224 m!1223497))

(declare-fun m!1223499 () Bool)

(assert (=> bs!38224 m!1223499))

(assert (=> b!1335746 d!143481))

(declare-fun d!143483 () Bool)

(assert (=> d!143483 (= (apply!1025 lt!592358 lt!592354) (get!22082 (getValueByKey!718 (toList!10819 lt!592358) lt!592354)))))

(declare-fun bs!38225 () Bool)

(assert (= bs!38225 d!143483))

(declare-fun m!1223501 () Bool)

(assert (=> bs!38225 m!1223501))

(assert (=> bs!38225 m!1223501))

(declare-fun m!1223503 () Bool)

(assert (=> bs!38225 m!1223503))

(assert (=> b!1335746 d!143483))

(declare-fun d!143485 () Bool)

(declare-fun e!760827 () Bool)

(assert (=> d!143485 e!760827))

(declare-fun res!886591 () Bool)

(assert (=> d!143485 (=> res!886591 e!760827)))

(declare-fun lt!592462 () Bool)

(assert (=> d!143485 (= res!886591 (not lt!592462))))

(declare-fun lt!592465 () Bool)

(assert (=> d!143485 (= lt!592462 lt!592465)))

(declare-fun lt!592463 () Unit!43702)

(declare-fun e!760828 () Unit!43702)

(assert (=> d!143485 (= lt!592463 e!760828)))

(declare-fun c!125945 () Bool)

(assert (=> d!143485 (= c!125945 lt!592465)))

(assert (=> d!143485 (= lt!592465 (containsKey!735 (toList!10819 (+!4753 lt!592351 (tuple2!23951 lt!592352 zeroValue!1262))) lt!592348))))

(assert (=> d!143485 (= (contains!8911 (+!4753 lt!592351 (tuple2!23951 lt!592352 zeroValue!1262)) lt!592348) lt!592462)))

(declare-fun b!1335899 () Bool)

(declare-fun lt!592464 () Unit!43702)

(assert (=> b!1335899 (= e!760828 lt!592464)))

(assert (=> b!1335899 (= lt!592464 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 (+!4753 lt!592351 (tuple2!23951 lt!592352 zeroValue!1262))) lt!592348))))

(assert (=> b!1335899 (isDefined!525 (getValueByKey!718 (toList!10819 (+!4753 lt!592351 (tuple2!23951 lt!592352 zeroValue!1262))) lt!592348))))

(declare-fun b!1335900 () Bool)

(declare-fun Unit!43711 () Unit!43702)

(assert (=> b!1335900 (= e!760828 Unit!43711)))

(declare-fun b!1335901 () Bool)

(assert (=> b!1335901 (= e!760827 (isDefined!525 (getValueByKey!718 (toList!10819 (+!4753 lt!592351 (tuple2!23951 lt!592352 zeroValue!1262))) lt!592348)))))

(assert (= (and d!143485 c!125945) b!1335899))

(assert (= (and d!143485 (not c!125945)) b!1335900))

(assert (= (and d!143485 (not res!886591)) b!1335901))

(declare-fun m!1223505 () Bool)

(assert (=> d!143485 m!1223505))

(declare-fun m!1223507 () Bool)

(assert (=> b!1335899 m!1223507))

(declare-fun m!1223509 () Bool)

(assert (=> b!1335899 m!1223509))

(assert (=> b!1335899 m!1223509))

(declare-fun m!1223511 () Bool)

(assert (=> b!1335899 m!1223511))

(assert (=> b!1335901 m!1223509))

(assert (=> b!1335901 m!1223509))

(assert (=> b!1335901 m!1223511))

(assert (=> b!1335746 d!143485))

(declare-fun d!143487 () Bool)

(assert (=> d!143487 (= (apply!1025 (+!4753 lt!592361 (tuple2!23951 lt!592347 minValue!1262)) lt!592349) (get!22082 (getValueByKey!718 (toList!10819 (+!4753 lt!592361 (tuple2!23951 lt!592347 minValue!1262))) lt!592349)))))

(declare-fun bs!38226 () Bool)

(assert (= bs!38226 d!143487))

(declare-fun m!1223513 () Bool)

(assert (=> bs!38226 m!1223513))

(assert (=> bs!38226 m!1223513))

(declare-fun m!1223515 () Bool)

(assert (=> bs!38226 m!1223515))

(assert (=> b!1335746 d!143487))

(declare-fun d!143489 () Bool)

(declare-fun e!760829 () Bool)

(assert (=> d!143489 e!760829))

(declare-fun res!886592 () Bool)

(assert (=> d!143489 (=> (not res!886592) (not e!760829))))

(declare-fun lt!592469 () ListLongMap!21607)

(assert (=> d!143489 (= res!886592 (contains!8911 lt!592469 (_1!11986 (tuple2!23951 lt!592347 minValue!1262))))))

(declare-fun lt!592468 () List!31084)

(assert (=> d!143489 (= lt!592469 (ListLongMap!21608 lt!592468))))

(declare-fun lt!592466 () Unit!43702)

(declare-fun lt!592467 () Unit!43702)

(assert (=> d!143489 (= lt!592466 lt!592467)))

(assert (=> d!143489 (= (getValueByKey!718 lt!592468 (_1!11986 (tuple2!23951 lt!592347 minValue!1262))) (Some!768 (_2!11986 (tuple2!23951 lt!592347 minValue!1262))))))

(assert (=> d!143489 (= lt!592467 (lemmaContainsTupThenGetReturnValue!361 lt!592468 (_1!11986 (tuple2!23951 lt!592347 minValue!1262)) (_2!11986 (tuple2!23951 lt!592347 minValue!1262))))))

(assert (=> d!143489 (= lt!592468 (insertStrictlySorted!490 (toList!10819 lt!592361) (_1!11986 (tuple2!23951 lt!592347 minValue!1262)) (_2!11986 (tuple2!23951 lt!592347 minValue!1262))))))

(assert (=> d!143489 (= (+!4753 lt!592361 (tuple2!23951 lt!592347 minValue!1262)) lt!592469)))

(declare-fun b!1335902 () Bool)

(declare-fun res!886593 () Bool)

(assert (=> b!1335902 (=> (not res!886593) (not e!760829))))

(assert (=> b!1335902 (= res!886593 (= (getValueByKey!718 (toList!10819 lt!592469) (_1!11986 (tuple2!23951 lt!592347 minValue!1262))) (Some!768 (_2!11986 (tuple2!23951 lt!592347 minValue!1262)))))))

(declare-fun b!1335903 () Bool)

(assert (=> b!1335903 (= e!760829 (contains!8915 (toList!10819 lt!592469) (tuple2!23951 lt!592347 minValue!1262)))))

(assert (= (and d!143489 res!886592) b!1335902))

(assert (= (and b!1335902 res!886593) b!1335903))

(declare-fun m!1223517 () Bool)

(assert (=> d!143489 m!1223517))

(declare-fun m!1223519 () Bool)

(assert (=> d!143489 m!1223519))

(declare-fun m!1223521 () Bool)

(assert (=> d!143489 m!1223521))

(declare-fun m!1223523 () Bool)

(assert (=> d!143489 m!1223523))

(declare-fun m!1223525 () Bool)

(assert (=> b!1335902 m!1223525))

(declare-fun m!1223527 () Bool)

(assert (=> b!1335903 m!1223527))

(assert (=> b!1335746 d!143489))

(declare-fun d!143491 () Bool)

(assert (=> d!143491 (= (apply!1025 (+!4753 lt!592346 (tuple2!23951 lt!592357 minValue!1262)) lt!592356) (get!22082 (getValueByKey!718 (toList!10819 (+!4753 lt!592346 (tuple2!23951 lt!592357 minValue!1262))) lt!592356)))))

(declare-fun bs!38227 () Bool)

(assert (= bs!38227 d!143491))

(declare-fun m!1223529 () Bool)

(assert (=> bs!38227 m!1223529))

(assert (=> bs!38227 m!1223529))

(declare-fun m!1223531 () Bool)

(assert (=> bs!38227 m!1223531))

(assert (=> b!1335746 d!143491))

(declare-fun d!143493 () Bool)

(assert (=> d!143493 (= (apply!1025 (+!4753 lt!592358 (tuple2!23951 lt!592362 zeroValue!1262)) lt!592354) (apply!1025 lt!592358 lt!592354))))

(declare-fun lt!592472 () Unit!43702)

(declare-fun choose!1965 (ListLongMap!21607 (_ BitVec 64) V!54297 (_ BitVec 64)) Unit!43702)

(assert (=> d!143493 (= lt!592472 (choose!1965 lt!592358 lt!592362 zeroValue!1262 lt!592354))))

(declare-fun e!760832 () Bool)

(assert (=> d!143493 e!760832))

(declare-fun res!886596 () Bool)

(assert (=> d!143493 (=> (not res!886596) (not e!760832))))

(assert (=> d!143493 (= res!886596 (contains!8911 lt!592358 lt!592354))))

(assert (=> d!143493 (= (addApplyDifferent!563 lt!592358 lt!592362 zeroValue!1262 lt!592354) lt!592472)))

(declare-fun b!1335907 () Bool)

(assert (=> b!1335907 (= e!760832 (not (= lt!592354 lt!592362)))))

(assert (= (and d!143493 res!886596) b!1335907))

(declare-fun m!1223533 () Bool)

(assert (=> d!143493 m!1223533))

(assert (=> d!143493 m!1223229))

(assert (=> d!143493 m!1223247))

(assert (=> d!143493 m!1223229))

(assert (=> d!143493 m!1223253))

(declare-fun m!1223535 () Bool)

(assert (=> d!143493 m!1223535))

(assert (=> b!1335746 d!143493))

(declare-fun d!143495 () Bool)

(declare-fun e!760833 () Bool)

(assert (=> d!143495 e!760833))

(declare-fun res!886597 () Bool)

(assert (=> d!143495 (=> (not res!886597) (not e!760833))))

(declare-fun lt!592476 () ListLongMap!21607)

(assert (=> d!143495 (= res!886597 (contains!8911 lt!592476 (_1!11986 (tuple2!23951 lt!592362 zeroValue!1262))))))

(declare-fun lt!592475 () List!31084)

(assert (=> d!143495 (= lt!592476 (ListLongMap!21608 lt!592475))))

(declare-fun lt!592473 () Unit!43702)

(declare-fun lt!592474 () Unit!43702)

(assert (=> d!143495 (= lt!592473 lt!592474)))

(assert (=> d!143495 (= (getValueByKey!718 lt!592475 (_1!11986 (tuple2!23951 lt!592362 zeroValue!1262))) (Some!768 (_2!11986 (tuple2!23951 lt!592362 zeroValue!1262))))))

(assert (=> d!143495 (= lt!592474 (lemmaContainsTupThenGetReturnValue!361 lt!592475 (_1!11986 (tuple2!23951 lt!592362 zeroValue!1262)) (_2!11986 (tuple2!23951 lt!592362 zeroValue!1262))))))

(assert (=> d!143495 (= lt!592475 (insertStrictlySorted!490 (toList!10819 lt!592358) (_1!11986 (tuple2!23951 lt!592362 zeroValue!1262)) (_2!11986 (tuple2!23951 lt!592362 zeroValue!1262))))))

(assert (=> d!143495 (= (+!4753 lt!592358 (tuple2!23951 lt!592362 zeroValue!1262)) lt!592476)))

(declare-fun b!1335908 () Bool)

(declare-fun res!886598 () Bool)

(assert (=> b!1335908 (=> (not res!886598) (not e!760833))))

(assert (=> b!1335908 (= res!886598 (= (getValueByKey!718 (toList!10819 lt!592476) (_1!11986 (tuple2!23951 lt!592362 zeroValue!1262))) (Some!768 (_2!11986 (tuple2!23951 lt!592362 zeroValue!1262)))))))

(declare-fun b!1335909 () Bool)

(assert (=> b!1335909 (= e!760833 (contains!8915 (toList!10819 lt!592476) (tuple2!23951 lt!592362 zeroValue!1262)))))

(assert (= (and d!143495 res!886597) b!1335908))

(assert (= (and b!1335908 res!886598) b!1335909))

(declare-fun m!1223537 () Bool)

(assert (=> d!143495 m!1223537))

(declare-fun m!1223539 () Bool)

(assert (=> d!143495 m!1223539))

(declare-fun m!1223541 () Bool)

(assert (=> d!143495 m!1223541))

(declare-fun m!1223543 () Bool)

(assert (=> d!143495 m!1223543))

(declare-fun m!1223545 () Bool)

(assert (=> b!1335908 m!1223545))

(declare-fun m!1223547 () Bool)

(assert (=> b!1335909 m!1223547))

(assert (=> b!1335746 d!143495))

(declare-fun d!143497 () Bool)

(declare-fun e!760834 () Bool)

(assert (=> d!143497 e!760834))

(declare-fun res!886599 () Bool)

(assert (=> d!143497 (=> (not res!886599) (not e!760834))))

(declare-fun lt!592480 () ListLongMap!21607)

(assert (=> d!143497 (= res!886599 (contains!8911 lt!592480 (_1!11986 (tuple2!23951 lt!592352 zeroValue!1262))))))

(declare-fun lt!592479 () List!31084)

(assert (=> d!143497 (= lt!592480 (ListLongMap!21608 lt!592479))))

(declare-fun lt!592477 () Unit!43702)

(declare-fun lt!592478 () Unit!43702)

(assert (=> d!143497 (= lt!592477 lt!592478)))

(assert (=> d!143497 (= (getValueByKey!718 lt!592479 (_1!11986 (tuple2!23951 lt!592352 zeroValue!1262))) (Some!768 (_2!11986 (tuple2!23951 lt!592352 zeroValue!1262))))))

(assert (=> d!143497 (= lt!592478 (lemmaContainsTupThenGetReturnValue!361 lt!592479 (_1!11986 (tuple2!23951 lt!592352 zeroValue!1262)) (_2!11986 (tuple2!23951 lt!592352 zeroValue!1262))))))

(assert (=> d!143497 (= lt!592479 (insertStrictlySorted!490 (toList!10819 lt!592351) (_1!11986 (tuple2!23951 lt!592352 zeroValue!1262)) (_2!11986 (tuple2!23951 lt!592352 zeroValue!1262))))))

(assert (=> d!143497 (= (+!4753 lt!592351 (tuple2!23951 lt!592352 zeroValue!1262)) lt!592480)))

(declare-fun b!1335910 () Bool)

(declare-fun res!886600 () Bool)

(assert (=> b!1335910 (=> (not res!886600) (not e!760834))))

(assert (=> b!1335910 (= res!886600 (= (getValueByKey!718 (toList!10819 lt!592480) (_1!11986 (tuple2!23951 lt!592352 zeroValue!1262))) (Some!768 (_2!11986 (tuple2!23951 lt!592352 zeroValue!1262)))))))

(declare-fun b!1335911 () Bool)

(assert (=> b!1335911 (= e!760834 (contains!8915 (toList!10819 lt!592480) (tuple2!23951 lt!592352 zeroValue!1262)))))

(assert (= (and d!143497 res!886599) b!1335910))

(assert (= (and b!1335910 res!886600) b!1335911))

(declare-fun m!1223549 () Bool)

(assert (=> d!143497 m!1223549))

(declare-fun m!1223551 () Bool)

(assert (=> d!143497 m!1223551))

(declare-fun m!1223553 () Bool)

(assert (=> d!143497 m!1223553))

(declare-fun m!1223555 () Bool)

(assert (=> d!143497 m!1223555))

(declare-fun m!1223557 () Bool)

(assert (=> b!1335910 m!1223557))

(declare-fun m!1223559 () Bool)

(assert (=> b!1335911 m!1223559))

(assert (=> b!1335746 d!143497))

(declare-fun b!1335912 () Bool)

(declare-fun e!760837 () ListLongMap!21607)

(declare-fun call!64836 () ListLongMap!21607)

(assert (=> b!1335912 (= e!760837 call!64836)))

(declare-fun d!143499 () Bool)

(declare-fun e!760835 () Bool)

(assert (=> d!143499 e!760835))

(declare-fun res!886601 () Bool)

(assert (=> d!143499 (=> (not res!886601) (not e!760835))))

(declare-fun lt!592482 () ListLongMap!21607)

(assert (=> d!143499 (= res!886601 (not (contains!8911 lt!592482 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!760841 () ListLongMap!21607)

(assert (=> d!143499 (= lt!592482 e!760841)))

(declare-fun c!125946 () Bool)

(assert (=> d!143499 (= c!125946 (bvsge from!1980 (size!44316 _keys!1590)))))

(assert (=> d!143499 (validMask!0 mask!1998)))

(assert (=> d!143499 (= (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!592482)))

(declare-fun b!1335913 () Bool)

(declare-fun e!760836 () Bool)

(assert (=> b!1335913 (= e!760836 (validKeyInArray!0 (select (arr!43764 _keys!1590) from!1980)))))

(assert (=> b!1335913 (bvsge from!1980 #b00000000000000000000000000000000)))

(declare-fun b!1335914 () Bool)

(declare-fun e!760838 () Bool)

(declare-fun e!760839 () Bool)

(assert (=> b!1335914 (= e!760838 e!760839)))

(declare-fun c!125949 () Bool)

(assert (=> b!1335914 (= c!125949 (bvslt from!1980 (size!44316 _keys!1590)))))

(declare-fun b!1335915 () Bool)

(declare-fun res!886603 () Bool)

(assert (=> b!1335915 (=> (not res!886603) (not e!760835))))

(assert (=> b!1335915 (= res!886603 (not (contains!8911 lt!592482 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1335916 () Bool)

(declare-fun lt!592485 () Unit!43702)

(declare-fun lt!592483 () Unit!43702)

(assert (=> b!1335916 (= lt!592485 lt!592483)))

(declare-fun lt!592486 () ListLongMap!21607)

(declare-fun lt!592481 () V!54297)

(declare-fun lt!592484 () (_ BitVec 64))

(declare-fun lt!592487 () (_ BitVec 64))

(assert (=> b!1335916 (not (contains!8911 (+!4753 lt!592486 (tuple2!23951 lt!592487 lt!592481)) lt!592484))))

(assert (=> b!1335916 (= lt!592483 (addStillNotContains!484 lt!592486 lt!592487 lt!592481 lt!592484))))

(assert (=> b!1335916 (= lt!592484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1335916 (= lt!592481 (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1335916 (= lt!592487 (select (arr!43764 _keys!1590) from!1980))))

(assert (=> b!1335916 (= lt!592486 call!64836)))

(assert (=> b!1335916 (= e!760837 (+!4753 call!64836 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1335917 () Bool)

(assert (=> b!1335917 (= e!760835 e!760838)))

(declare-fun c!125947 () Bool)

(assert (=> b!1335917 (= c!125947 e!760836)))

(declare-fun res!886604 () Bool)

(assert (=> b!1335917 (=> (not res!886604) (not e!760836))))

(assert (=> b!1335917 (= res!886604 (bvslt from!1980 (size!44316 _keys!1590)))))

(declare-fun bm!64833 () Bool)

(assert (=> bm!64833 (= call!64836 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1335918 () Bool)

(assert (=> b!1335918 (= e!760839 (= lt!592482 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1335919 () Bool)

(declare-fun e!760840 () Bool)

(assert (=> b!1335919 (= e!760838 e!760840)))

(assert (=> b!1335919 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44316 _keys!1590)))))

(declare-fun res!886602 () Bool)

(assert (=> b!1335919 (= res!886602 (contains!8911 lt!592482 (select (arr!43764 _keys!1590) from!1980)))))

(assert (=> b!1335919 (=> (not res!886602) (not e!760840))))

(declare-fun b!1335920 () Bool)

(assert (=> b!1335920 (= e!760841 (ListLongMap!21608 Nil!31081))))

(declare-fun b!1335921 () Bool)

(assert (=> b!1335921 (= e!760839 (isEmpty!1087 lt!592482))))

(declare-fun b!1335922 () Bool)

(assert (=> b!1335922 (= e!760841 e!760837)))

(declare-fun c!125948 () Bool)

(assert (=> b!1335922 (= c!125948 (validKeyInArray!0 (select (arr!43764 _keys!1590) from!1980)))))

(declare-fun b!1335923 () Bool)

(assert (=> b!1335923 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44316 _keys!1590)))))

(assert (=> b!1335923 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44317 _values!1320)))))

(assert (=> b!1335923 (= e!760840 (= (apply!1025 lt!592482 (select (arr!43764 _keys!1590) from!1980)) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!143499 c!125946) b!1335920))

(assert (= (and d!143499 (not c!125946)) b!1335922))

(assert (= (and b!1335922 c!125948) b!1335916))

(assert (= (and b!1335922 (not c!125948)) b!1335912))

(assert (= (or b!1335916 b!1335912) bm!64833))

(assert (= (and d!143499 res!886601) b!1335915))

(assert (= (and b!1335915 res!886603) b!1335917))

(assert (= (and b!1335917 res!886604) b!1335913))

(assert (= (and b!1335917 c!125947) b!1335919))

(assert (= (and b!1335917 (not c!125947)) b!1335914))

(assert (= (and b!1335919 res!886602) b!1335923))

(assert (= (and b!1335914 c!125949) b!1335918))

(assert (= (and b!1335914 (not c!125949)) b!1335921))

(declare-fun b_lambda!24127 () Bool)

(assert (=> (not b_lambda!24127) (not b!1335916)))

(assert (=> b!1335916 t!45341))

(declare-fun b_and!49897 () Bool)

(assert (= b_and!49895 (and (=> t!45341 result!25201) b_and!49897)))

(declare-fun b_lambda!24129 () Bool)

(assert (=> (not b_lambda!24129) (not b!1335923)))

(assert (=> b!1335923 t!45341))

(declare-fun b_and!49899 () Bool)

(assert (= b_and!49897 (and (=> t!45341 result!25201) b_and!49899)))

(declare-fun m!1223561 () Bool)

(assert (=> b!1335921 m!1223561))

(declare-fun m!1223563 () Bool)

(assert (=> d!143499 m!1223563))

(assert (=> d!143499 m!1223103))

(declare-fun m!1223565 () Bool)

(assert (=> bm!64833 m!1223565))

(assert (=> b!1335923 m!1223129))

(assert (=> b!1335923 m!1223127))

(assert (=> b!1335923 m!1223129))

(assert (=> b!1335923 m!1223131))

(assert (=> b!1335923 m!1223109))

(declare-fun m!1223567 () Bool)

(assert (=> b!1335923 m!1223567))

(assert (=> b!1335923 m!1223127))

(assert (=> b!1335923 m!1223109))

(assert (=> b!1335922 m!1223109))

(assert (=> b!1335922 m!1223109))

(assert (=> b!1335922 m!1223111))

(assert (=> b!1335913 m!1223109))

(assert (=> b!1335913 m!1223109))

(assert (=> b!1335913 m!1223111))

(assert (=> b!1335918 m!1223565))

(assert (=> b!1335919 m!1223109))

(assert (=> b!1335919 m!1223109))

(declare-fun m!1223569 () Bool)

(assert (=> b!1335919 m!1223569))

(declare-fun m!1223571 () Bool)

(assert (=> b!1335915 m!1223571))

(assert (=> b!1335916 m!1223129))

(declare-fun m!1223573 () Bool)

(assert (=> b!1335916 m!1223573))

(declare-fun m!1223575 () Bool)

(assert (=> b!1335916 m!1223575))

(declare-fun m!1223577 () Bool)

(assert (=> b!1335916 m!1223577))

(assert (=> b!1335916 m!1223127))

(assert (=> b!1335916 m!1223575))

(assert (=> b!1335916 m!1223109))

(assert (=> b!1335916 m!1223127))

(assert (=> b!1335916 m!1223129))

(assert (=> b!1335916 m!1223131))

(declare-fun m!1223579 () Bool)

(assert (=> b!1335916 m!1223579))

(assert (=> b!1335746 d!143499))

(declare-fun d!143501 () Bool)

(assert (=> d!143501 (= (apply!1025 lt!592346 lt!592356) (get!22082 (getValueByKey!718 (toList!10819 lt!592346) lt!592356)))))

(declare-fun bs!38228 () Bool)

(assert (= bs!38228 d!143501))

(declare-fun m!1223581 () Bool)

(assert (=> bs!38228 m!1223581))

(assert (=> bs!38228 m!1223581))

(declare-fun m!1223583 () Bool)

(assert (=> bs!38228 m!1223583))

(assert (=> b!1335746 d!143501))

(declare-fun d!143503 () Bool)

(assert (=> d!143503 (contains!8911 (+!4753 lt!592351 (tuple2!23951 lt!592352 zeroValue!1262)) lt!592348)))

(declare-fun lt!592490 () Unit!43702)

(declare-fun choose!1966 (ListLongMap!21607 (_ BitVec 64) V!54297 (_ BitVec 64)) Unit!43702)

(assert (=> d!143503 (= lt!592490 (choose!1966 lt!592351 lt!592352 zeroValue!1262 lt!592348))))

(assert (=> d!143503 (contains!8911 lt!592351 lt!592348)))

(assert (=> d!143503 (= (addStillContains!1183 lt!592351 lt!592352 zeroValue!1262 lt!592348) lt!592490)))

(declare-fun bs!38229 () Bool)

(assert (= bs!38229 d!143503))

(assert (=> bs!38229 m!1223231))

(assert (=> bs!38229 m!1223231))

(assert (=> bs!38229 m!1223233))

(declare-fun m!1223585 () Bool)

(assert (=> bs!38229 m!1223585))

(declare-fun m!1223587 () Bool)

(assert (=> bs!38229 m!1223587))

(assert (=> b!1335746 d!143503))

(declare-fun d!143505 () Bool)

(assert (=> d!143505 (= (apply!1025 (+!4753 lt!592361 (tuple2!23951 lt!592347 minValue!1262)) lt!592349) (apply!1025 lt!592361 lt!592349))))

(declare-fun lt!592491 () Unit!43702)

(assert (=> d!143505 (= lt!592491 (choose!1965 lt!592361 lt!592347 minValue!1262 lt!592349))))

(declare-fun e!760842 () Bool)

(assert (=> d!143505 e!760842))

(declare-fun res!886605 () Bool)

(assert (=> d!143505 (=> (not res!886605) (not e!760842))))

(assert (=> d!143505 (= res!886605 (contains!8911 lt!592361 lt!592349))))

(assert (=> d!143505 (= (addApplyDifferent!563 lt!592361 lt!592347 minValue!1262 lt!592349) lt!592491)))

(declare-fun b!1335925 () Bool)

(assert (=> b!1335925 (= e!760842 (not (= lt!592349 lt!592347)))))

(assert (= (and d!143505 res!886605) b!1335925))

(declare-fun m!1223589 () Bool)

(assert (=> d!143505 m!1223589))

(assert (=> d!143505 m!1223241))

(assert (=> d!143505 m!1223255))

(assert (=> d!143505 m!1223241))

(assert (=> d!143505 m!1223235))

(declare-fun m!1223591 () Bool)

(assert (=> d!143505 m!1223591))

(assert (=> b!1335746 d!143505))

(declare-fun d!143507 () Bool)

(declare-fun e!760843 () Bool)

(assert (=> d!143507 e!760843))

(declare-fun res!886606 () Bool)

(assert (=> d!143507 (=> (not res!886606) (not e!760843))))

(declare-fun lt!592495 () ListLongMap!21607)

(assert (=> d!143507 (= res!886606 (contains!8911 lt!592495 (_1!11986 (tuple2!23951 lt!592357 minValue!1262))))))

(declare-fun lt!592494 () List!31084)

(assert (=> d!143507 (= lt!592495 (ListLongMap!21608 lt!592494))))

(declare-fun lt!592492 () Unit!43702)

(declare-fun lt!592493 () Unit!43702)

(assert (=> d!143507 (= lt!592492 lt!592493)))

(assert (=> d!143507 (= (getValueByKey!718 lt!592494 (_1!11986 (tuple2!23951 lt!592357 minValue!1262))) (Some!768 (_2!11986 (tuple2!23951 lt!592357 minValue!1262))))))

(assert (=> d!143507 (= lt!592493 (lemmaContainsTupThenGetReturnValue!361 lt!592494 (_1!11986 (tuple2!23951 lt!592357 minValue!1262)) (_2!11986 (tuple2!23951 lt!592357 minValue!1262))))))

(assert (=> d!143507 (= lt!592494 (insertStrictlySorted!490 (toList!10819 lt!592346) (_1!11986 (tuple2!23951 lt!592357 minValue!1262)) (_2!11986 (tuple2!23951 lt!592357 minValue!1262))))))

(assert (=> d!143507 (= (+!4753 lt!592346 (tuple2!23951 lt!592357 minValue!1262)) lt!592495)))

(declare-fun b!1335926 () Bool)

(declare-fun res!886607 () Bool)

(assert (=> b!1335926 (=> (not res!886607) (not e!760843))))

(assert (=> b!1335926 (= res!886607 (= (getValueByKey!718 (toList!10819 lt!592495) (_1!11986 (tuple2!23951 lt!592357 minValue!1262))) (Some!768 (_2!11986 (tuple2!23951 lt!592357 minValue!1262)))))))

(declare-fun b!1335927 () Bool)

(assert (=> b!1335927 (= e!760843 (contains!8915 (toList!10819 lt!592495) (tuple2!23951 lt!592357 minValue!1262)))))

(assert (= (and d!143507 res!886606) b!1335926))

(assert (= (and b!1335926 res!886607) b!1335927))

(declare-fun m!1223593 () Bool)

(assert (=> d!143507 m!1223593))

(declare-fun m!1223595 () Bool)

(assert (=> d!143507 m!1223595))

(declare-fun m!1223597 () Bool)

(assert (=> d!143507 m!1223597))

(declare-fun m!1223599 () Bool)

(assert (=> d!143507 m!1223599))

(declare-fun m!1223601 () Bool)

(assert (=> b!1335926 m!1223601))

(declare-fun m!1223603 () Bool)

(assert (=> b!1335927 m!1223603))

(assert (=> b!1335746 d!143507))

(declare-fun d!143509 () Bool)

(assert (=> d!143509 (= (apply!1025 (+!4753 lt!592346 (tuple2!23951 lt!592357 minValue!1262)) lt!592356) (apply!1025 lt!592346 lt!592356))))

(declare-fun lt!592496 () Unit!43702)

(assert (=> d!143509 (= lt!592496 (choose!1965 lt!592346 lt!592357 minValue!1262 lt!592356))))

(declare-fun e!760844 () Bool)

(assert (=> d!143509 e!760844))

(declare-fun res!886608 () Bool)

(assert (=> d!143509 (=> (not res!886608) (not e!760844))))

(assert (=> d!143509 (= res!886608 (contains!8911 lt!592346 lt!592356))))

(assert (=> d!143509 (= (addApplyDifferent!563 lt!592346 lt!592357 minValue!1262 lt!592356) lt!592496)))

(declare-fun b!1335928 () Bool)

(assert (=> b!1335928 (= e!760844 (not (= lt!592356 lt!592357)))))

(assert (= (and d!143509 res!886608) b!1335928))

(declare-fun m!1223605 () Bool)

(assert (=> d!143509 m!1223605))

(assert (=> d!143509 m!1223249))

(assert (=> d!143509 m!1223251))

(assert (=> d!143509 m!1223249))

(assert (=> d!143509 m!1223243))

(declare-fun m!1223607 () Bool)

(assert (=> d!143509 m!1223607))

(assert (=> b!1335746 d!143509))

(declare-fun d!143511 () Bool)

(declare-fun e!760845 () Bool)

(assert (=> d!143511 e!760845))

(declare-fun res!886609 () Bool)

(assert (=> d!143511 (=> res!886609 e!760845)))

(declare-fun lt!592497 () Bool)

(assert (=> d!143511 (= res!886609 (not lt!592497))))

(declare-fun lt!592500 () Bool)

(assert (=> d!143511 (= lt!592497 lt!592500)))

(declare-fun lt!592498 () Unit!43702)

(declare-fun e!760846 () Unit!43702)

(assert (=> d!143511 (= lt!592498 e!760846)))

(declare-fun c!125950 () Bool)

(assert (=> d!143511 (= c!125950 lt!592500)))

(assert (=> d!143511 (= lt!592500 (containsKey!735 (toList!10819 lt!592343) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143511 (= (contains!8911 lt!592343 #b0000000000000000000000000000000000000000000000000000000000000000) lt!592497)))

(declare-fun b!1335929 () Bool)

(declare-fun lt!592499 () Unit!43702)

(assert (=> b!1335929 (= e!760846 lt!592499)))

(assert (=> b!1335929 (= lt!592499 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 lt!592343) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1335929 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592343) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1335930 () Bool)

(declare-fun Unit!43712 () Unit!43702)

(assert (=> b!1335930 (= e!760846 Unit!43712)))

(declare-fun b!1335931 () Bool)

(assert (=> b!1335931 (= e!760845 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592343) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143511 c!125950) b!1335929))

(assert (= (and d!143511 (not c!125950)) b!1335930))

(assert (= (and d!143511 (not res!886609)) b!1335931))

(declare-fun m!1223609 () Bool)

(assert (=> d!143511 m!1223609))

(declare-fun m!1223611 () Bool)

(assert (=> b!1335929 m!1223611))

(declare-fun m!1223613 () Bool)

(assert (=> b!1335929 m!1223613))

(assert (=> b!1335929 m!1223613))

(declare-fun m!1223615 () Bool)

(assert (=> b!1335929 m!1223615))

(assert (=> b!1335931 m!1223613))

(assert (=> b!1335931 m!1223613))

(assert (=> b!1335931 m!1223615))

(assert (=> bm!64818 d!143511))

(declare-fun d!143513 () Bool)

(assert (=> d!143513 (arrayContainsKey!0 _keys!1590 lt!592370 #b00000000000000000000000000000000)))

(declare-fun lt!592503 () Unit!43702)

(declare-fun choose!13 (array!90595 (_ BitVec 64) (_ BitVec 32)) Unit!43702)

(assert (=> d!143513 (= lt!592503 (choose!13 _keys!1590 lt!592370 #b00000000000000000000000000000000))))

(assert (=> d!143513 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!143513 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!592370 #b00000000000000000000000000000000) lt!592503)))

(declare-fun bs!38230 () Bool)

(assert (= bs!38230 d!143513))

(assert (=> bs!38230 m!1223273))

(declare-fun m!1223617 () Bool)

(assert (=> bs!38230 m!1223617))

(assert (=> b!1335759 d!143513))

(declare-fun d!143515 () Bool)

(declare-fun res!886614 () Bool)

(declare-fun e!760851 () Bool)

(assert (=> d!143515 (=> res!886614 e!760851)))

(assert (=> d!143515 (= res!886614 (= (select (arr!43764 _keys!1590) #b00000000000000000000000000000000) lt!592370))))

(assert (=> d!143515 (= (arrayContainsKey!0 _keys!1590 lt!592370 #b00000000000000000000000000000000) e!760851)))

(declare-fun b!1335936 () Bool)

(declare-fun e!760852 () Bool)

(assert (=> b!1335936 (= e!760851 e!760852)))

(declare-fun res!886615 () Bool)

(assert (=> b!1335936 (=> (not res!886615) (not e!760852))))

(assert (=> b!1335936 (= res!886615 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44316 _keys!1590)))))

(declare-fun b!1335937 () Bool)

(assert (=> b!1335937 (= e!760852 (arrayContainsKey!0 _keys!1590 lt!592370 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!143515 (not res!886614)) b!1335936))

(assert (= (and b!1335936 res!886615) b!1335937))

(assert (=> d!143515 m!1223205))

(declare-fun m!1223619 () Bool)

(assert (=> b!1335937 m!1223619))

(assert (=> b!1335759 d!143515))

(declare-fun b!1335950 () Bool)

(declare-fun e!760860 () SeekEntryResult!10046)

(declare-fun lt!592510 () SeekEntryResult!10046)

(assert (=> b!1335950 (= e!760860 (Found!10046 (index!42557 lt!592510)))))

(declare-fun b!1335952 () Bool)

(declare-fun e!760859 () SeekEntryResult!10046)

(assert (=> b!1335952 (= e!760859 Undefined!10046)))

(declare-fun b!1335953 () Bool)

(assert (=> b!1335953 (= e!760859 e!760860)))

(declare-fun lt!592511 () (_ BitVec 64))

(assert (=> b!1335953 (= lt!592511 (select (arr!43764 _keys!1590) (index!42557 lt!592510)))))

(declare-fun c!125958 () Bool)

(assert (=> b!1335953 (= c!125958 (= lt!592511 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1335954 () Bool)

(declare-fun e!760861 () SeekEntryResult!10046)

(assert (=> b!1335954 (= e!760861 (MissingZero!10046 (index!42557 lt!592510)))))

(declare-fun b!1335955 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90595 (_ BitVec 32)) SeekEntryResult!10046)

(assert (=> b!1335955 (= e!760861 (seekKeyOrZeroReturnVacant!0 (x!119322 lt!592510) (index!42557 lt!592510) (index!42557 lt!592510) (select (arr!43764 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(declare-fun b!1335951 () Bool)

(declare-fun c!125959 () Bool)

(assert (=> b!1335951 (= c!125959 (= lt!592511 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1335951 (= e!760860 e!760861)))

(declare-fun d!143517 () Bool)

(declare-fun lt!592512 () SeekEntryResult!10046)

(assert (=> d!143517 (and (or ((_ is Undefined!10046) lt!592512) (not ((_ is Found!10046) lt!592512)) (and (bvsge (index!42556 lt!592512) #b00000000000000000000000000000000) (bvslt (index!42556 lt!592512) (size!44316 _keys!1590)))) (or ((_ is Undefined!10046) lt!592512) ((_ is Found!10046) lt!592512) (not ((_ is MissingZero!10046) lt!592512)) (and (bvsge (index!42555 lt!592512) #b00000000000000000000000000000000) (bvslt (index!42555 lt!592512) (size!44316 _keys!1590)))) (or ((_ is Undefined!10046) lt!592512) ((_ is Found!10046) lt!592512) ((_ is MissingZero!10046) lt!592512) (not ((_ is MissingVacant!10046) lt!592512)) (and (bvsge (index!42558 lt!592512) #b00000000000000000000000000000000) (bvslt (index!42558 lt!592512) (size!44316 _keys!1590)))) (or ((_ is Undefined!10046) lt!592512) (ite ((_ is Found!10046) lt!592512) (= (select (arr!43764 _keys!1590) (index!42556 lt!592512)) (select (arr!43764 _keys!1590) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10046) lt!592512) (= (select (arr!43764 _keys!1590) (index!42555 lt!592512)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10046) lt!592512) (= (select (arr!43764 _keys!1590) (index!42558 lt!592512)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143517 (= lt!592512 e!760859)))

(declare-fun c!125957 () Bool)

(assert (=> d!143517 (= c!125957 (and ((_ is Intermediate!10046) lt!592510) (undefined!10858 lt!592510)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90595 (_ BitVec 32)) SeekEntryResult!10046)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!143517 (= lt!592510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000) mask!1998) (select (arr!43764 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(assert (=> d!143517 (validMask!0 mask!1998)))

(assert (=> d!143517 (= (seekEntryOrOpen!0 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) lt!592512)))

(assert (= (and d!143517 c!125957) b!1335952))

(assert (= (and d!143517 (not c!125957)) b!1335953))

(assert (= (and b!1335953 c!125958) b!1335950))

(assert (= (and b!1335953 (not c!125958)) b!1335951))

(assert (= (and b!1335951 c!125959) b!1335954))

(assert (= (and b!1335951 (not c!125959)) b!1335955))

(declare-fun m!1223621 () Bool)

(assert (=> b!1335953 m!1223621))

(assert (=> b!1335955 m!1223205))

(declare-fun m!1223623 () Bool)

(assert (=> b!1335955 m!1223623))

(assert (=> d!143517 m!1223205))

(declare-fun m!1223625 () Bool)

(assert (=> d!143517 m!1223625))

(assert (=> d!143517 m!1223103))

(declare-fun m!1223627 () Bool)

(assert (=> d!143517 m!1223627))

(assert (=> d!143517 m!1223625))

(assert (=> d!143517 m!1223205))

(declare-fun m!1223629 () Bool)

(assert (=> d!143517 m!1223629))

(declare-fun m!1223631 () Bool)

(assert (=> d!143517 m!1223631))

(declare-fun m!1223633 () Bool)

(assert (=> d!143517 m!1223633))

(assert (=> b!1335759 d!143517))

(declare-fun b!1335957 () Bool)

(declare-fun e!760863 () Bool)

(declare-fun e!760862 () Bool)

(assert (=> b!1335957 (= e!760863 e!760862)))

(declare-fun c!125960 () Bool)

(assert (=> b!1335957 (= c!125960 (validKeyInArray!0 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1335958 () Bool)

(declare-fun e!760864 () Bool)

(assert (=> b!1335958 (= e!760864 (contains!8914 (ite c!125886 (Cons!31081 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000) Nil!31082) Nil!31082) (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1335959 () Bool)

(declare-fun call!64837 () Bool)

(assert (=> b!1335959 (= e!760862 call!64837)))

(declare-fun bm!64834 () Bool)

(assert (=> bm!64834 (= call!64837 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125960 (Cons!31081 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125886 (Cons!31081 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000) Nil!31082) Nil!31082)) (ite c!125886 (Cons!31081 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000) Nil!31082) Nil!31082))))))

(declare-fun b!1335960 () Bool)

(assert (=> b!1335960 (= e!760862 call!64837)))

(declare-fun b!1335956 () Bool)

(declare-fun e!760865 () Bool)

(assert (=> b!1335956 (= e!760865 e!760863)))

(declare-fun res!886616 () Bool)

(assert (=> b!1335956 (=> (not res!886616) (not e!760863))))

(assert (=> b!1335956 (= res!886616 (not e!760864))))

(declare-fun res!886617 () Bool)

(assert (=> b!1335956 (=> (not res!886617) (not e!760864))))

(assert (=> b!1335956 (= res!886617 (validKeyInArray!0 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!143519 () Bool)

(declare-fun res!886618 () Bool)

(assert (=> d!143519 (=> res!886618 e!760865)))

(assert (=> d!143519 (= res!886618 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44316 _keys!1590)))))

(assert (=> d!143519 (= (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125886 (Cons!31081 (select (arr!43764 _keys!1590) #b00000000000000000000000000000000) Nil!31082) Nil!31082)) e!760865)))

(assert (= (and d!143519 (not res!886618)) b!1335956))

(assert (= (and b!1335956 res!886617) b!1335958))

(assert (= (and b!1335956 res!886616) b!1335957))

(assert (= (and b!1335957 c!125960) b!1335960))

(assert (= (and b!1335957 (not c!125960)) b!1335959))

(assert (= (or b!1335960 b!1335959) bm!64834))

(assert (=> b!1335957 m!1223481))

(assert (=> b!1335957 m!1223481))

(assert (=> b!1335957 m!1223483))

(assert (=> b!1335958 m!1223481))

(assert (=> b!1335958 m!1223481))

(declare-fun m!1223635 () Bool)

(assert (=> b!1335958 m!1223635))

(assert (=> bm!64834 m!1223481))

(declare-fun m!1223637 () Bool)

(assert (=> bm!64834 m!1223637))

(assert (=> b!1335956 m!1223481))

(assert (=> b!1335956 m!1223481))

(assert (=> b!1335956 m!1223483))

(assert (=> bm!64803 d!143519))

(declare-fun d!143521 () Bool)

(assert (=> d!143521 (= (apply!1025 lt!592404 (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22082 (getValueByKey!718 (toList!10819 lt!592404) (select (arr!43764 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(declare-fun bs!38231 () Bool)

(assert (= bs!38231 d!143521))

(assert (=> bs!38231 m!1223311))

(assert (=> bs!38231 m!1223455))

(assert (=> bs!38231 m!1223455))

(declare-fun m!1223639 () Bool)

(assert (=> bs!38231 m!1223639))

(assert (=> b!1335803 d!143521))

(assert (=> b!1335803 d!143453))

(declare-fun d!143523 () Bool)

(declare-fun e!760866 () Bool)

(assert (=> d!143523 e!760866))

(declare-fun res!886619 () Bool)

(assert (=> d!143523 (=> res!886619 e!760866)))

(declare-fun lt!592513 () Bool)

(assert (=> d!143523 (= res!886619 (not lt!592513))))

(declare-fun lt!592516 () Bool)

(assert (=> d!143523 (= lt!592513 lt!592516)))

(declare-fun lt!592514 () Unit!43702)

(declare-fun e!760867 () Unit!43702)

(assert (=> d!143523 (= lt!592514 e!760867)))

(declare-fun c!125961 () Bool)

(assert (=> d!143523 (= c!125961 lt!592516)))

(assert (=> d!143523 (= lt!592516 (containsKey!735 (toList!10819 lt!592343) (select (arr!43764 _keys!1590) from!1980)))))

(assert (=> d!143523 (= (contains!8911 lt!592343 (select (arr!43764 _keys!1590) from!1980)) lt!592513)))

(declare-fun b!1335961 () Bool)

(declare-fun lt!592515 () Unit!43702)

(assert (=> b!1335961 (= e!760867 lt!592515)))

(assert (=> b!1335961 (= lt!592515 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 lt!592343) (select (arr!43764 _keys!1590) from!1980)))))

(assert (=> b!1335961 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592343) (select (arr!43764 _keys!1590) from!1980)))))

(declare-fun b!1335962 () Bool)

(declare-fun Unit!43713 () Unit!43702)

(assert (=> b!1335962 (= e!760867 Unit!43713)))

(declare-fun b!1335963 () Bool)

(assert (=> b!1335963 (= e!760866 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592343) (select (arr!43764 _keys!1590) from!1980))))))

(assert (= (and d!143523 c!125961) b!1335961))

(assert (= (and d!143523 (not c!125961)) b!1335962))

(assert (= (and d!143523 (not res!886619)) b!1335963))

(assert (=> d!143523 m!1223109))

(declare-fun m!1223641 () Bool)

(assert (=> d!143523 m!1223641))

(assert (=> b!1335961 m!1223109))

(declare-fun m!1223643 () Bool)

(assert (=> b!1335961 m!1223643))

(assert (=> b!1335961 m!1223109))

(assert (=> b!1335961 m!1223461))

(assert (=> b!1335961 m!1223461))

(declare-fun m!1223645 () Bool)

(assert (=> b!1335961 m!1223645))

(assert (=> b!1335963 m!1223109))

(assert (=> b!1335963 m!1223461))

(assert (=> b!1335963 m!1223461))

(assert (=> b!1335963 m!1223645))

(assert (=> b!1335729 d!143523))

(declare-fun d!143525 () Bool)

(declare-fun e!760868 () Bool)

(assert (=> d!143525 e!760868))

(declare-fun res!886620 () Bool)

(assert (=> d!143525 (=> res!886620 e!760868)))

(declare-fun lt!592517 () Bool)

(assert (=> d!143525 (= res!886620 (not lt!592517))))

(declare-fun lt!592520 () Bool)

(assert (=> d!143525 (= lt!592517 lt!592520)))

(declare-fun lt!592518 () Unit!43702)

(declare-fun e!760869 () Unit!43702)

(assert (=> d!143525 (= lt!592518 e!760869)))

(declare-fun c!125962 () Bool)

(assert (=> d!143525 (= c!125962 lt!592520)))

(assert (=> d!143525 (= lt!592520 (containsKey!735 (toList!10819 lt!592384) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143525 (= (contains!8911 lt!592384 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!592517)))

(declare-fun b!1335964 () Bool)

(declare-fun lt!592519 () Unit!43702)

(assert (=> b!1335964 (= e!760869 lt!592519)))

(assert (=> b!1335964 (= lt!592519 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 lt!592384) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1335964 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592384) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1335965 () Bool)

(declare-fun Unit!43714 () Unit!43702)

(assert (=> b!1335965 (= e!760869 Unit!43714)))

(declare-fun b!1335966 () Bool)

(assert (=> b!1335966 (= e!760868 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592384) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!143525 c!125962) b!1335964))

(assert (= (and d!143525 (not c!125962)) b!1335965))

(assert (= (and d!143525 (not res!886620)) b!1335966))

(declare-fun m!1223647 () Bool)

(assert (=> d!143525 m!1223647))

(declare-fun m!1223649 () Bool)

(assert (=> b!1335964 m!1223649))

(assert (=> b!1335964 m!1223285))

(assert (=> b!1335964 m!1223285))

(declare-fun m!1223651 () Bool)

(assert (=> b!1335964 m!1223651))

(assert (=> b!1335966 m!1223285))

(assert (=> b!1335966 m!1223285))

(assert (=> b!1335966 m!1223651))

(assert (=> d!143419 d!143525))

(declare-fun c!125963 () Bool)

(declare-fun d!143527 () Bool)

(assert (=> d!143527 (= c!125963 (and ((_ is Cons!31080) lt!592383) (= (_1!11986 (h!32289 lt!592383)) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!760870 () Option!769)

(assert (=> d!143527 (= (getValueByKey!718 lt!592383 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!760870)))

(declare-fun b!1335970 () Bool)

(declare-fun e!760871 () Option!769)

(assert (=> b!1335970 (= e!760871 None!767)))

(declare-fun b!1335968 () Bool)

(assert (=> b!1335968 (= e!760870 e!760871)))

(declare-fun c!125964 () Bool)

(assert (=> b!1335968 (= c!125964 (and ((_ is Cons!31080) lt!592383) (not (= (_1!11986 (h!32289 lt!592383)) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1335969 () Bool)

(assert (=> b!1335969 (= e!760871 (getValueByKey!718 (t!45342 lt!592383) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1335967 () Bool)

(assert (=> b!1335967 (= e!760870 (Some!768 (_2!11986 (h!32289 lt!592383))))))

(assert (= (and d!143527 c!125963) b!1335967))

(assert (= (and d!143527 (not c!125963)) b!1335968))

(assert (= (and b!1335968 c!125964) b!1335969))

(assert (= (and b!1335968 (not c!125964)) b!1335970))

(declare-fun m!1223653 () Bool)

(assert (=> b!1335969 m!1223653))

(assert (=> d!143419 d!143527))

(declare-fun d!143529 () Bool)

(assert (=> d!143529 (= (getValueByKey!718 lt!592383 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!768 (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!592523 () Unit!43702)

(declare-fun choose!1967 (List!31084 (_ BitVec 64) V!54297) Unit!43702)

(assert (=> d!143529 (= lt!592523 (choose!1967 lt!592383 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!760874 () Bool)

(assert (=> d!143529 e!760874))

(declare-fun res!886625 () Bool)

(assert (=> d!143529 (=> (not res!886625) (not e!760874))))

(declare-fun isStrictlySorted!875 (List!31084) Bool)

(assert (=> d!143529 (= res!886625 (isStrictlySorted!875 lt!592383))))

(assert (=> d!143529 (= (lemmaContainsTupThenGetReturnValue!361 lt!592383 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!592523)))

(declare-fun b!1335975 () Bool)

(declare-fun res!886626 () Bool)

(assert (=> b!1335975 (=> (not res!886626) (not e!760874))))

(assert (=> b!1335975 (= res!886626 (containsKey!735 lt!592383 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1335976 () Bool)

(assert (=> b!1335976 (= e!760874 (contains!8915 lt!592383 (tuple2!23951 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!143529 res!886625) b!1335975))

(assert (= (and b!1335975 res!886626) b!1335976))

(assert (=> d!143529 m!1223279))

(declare-fun m!1223655 () Bool)

(assert (=> d!143529 m!1223655))

(declare-fun m!1223657 () Bool)

(assert (=> d!143529 m!1223657))

(declare-fun m!1223659 () Bool)

(assert (=> b!1335975 m!1223659))

(declare-fun m!1223661 () Bool)

(assert (=> b!1335976 m!1223661))

(assert (=> d!143419 d!143529))

(declare-fun b!1335997 () Bool)

(declare-fun c!125976 () Bool)

(assert (=> b!1335997 (= c!125976 (and ((_ is Cons!31080) (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvsgt (_1!11986 (h!32289 (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!760887 () List!31084)

(declare-fun e!760885 () List!31084)

(assert (=> b!1335997 (= e!760887 e!760885)))

(declare-fun bm!64841 () Bool)

(declare-fun call!64844 () List!31084)

(declare-fun call!64845 () List!31084)

(assert (=> bm!64841 (= call!64844 call!64845)))

(declare-fun b!1335998 () Bool)

(assert (=> b!1335998 (= e!760885 call!64844)))

(declare-fun e!760888 () Bool)

(declare-fun lt!592526 () List!31084)

(declare-fun b!1335999 () Bool)

(assert (=> b!1335999 (= e!760888 (contains!8915 lt!592526 (tuple2!23951 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!64842 () Bool)

(declare-fun call!64846 () List!31084)

(assert (=> bm!64842 (= call!64845 call!64846)))

(declare-fun e!760886 () List!31084)

(declare-fun bm!64843 () Bool)

(declare-fun c!125973 () Bool)

(declare-fun $colon$colon!672 (List!31084 tuple2!23950) List!31084)

(assert (=> bm!64843 (= call!64846 ($colon$colon!672 e!760886 (ite c!125973 (h!32289 (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (tuple2!23951 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!125975 () Bool)

(assert (=> bm!64843 (= c!125975 c!125973)))

(declare-fun d!143531 () Bool)

(assert (=> d!143531 e!760888))

(declare-fun res!886632 () Bool)

(assert (=> d!143531 (=> (not res!886632) (not e!760888))))

(assert (=> d!143531 (= res!886632 (isStrictlySorted!875 lt!592526))))

(declare-fun e!760889 () List!31084)

(assert (=> d!143531 (= lt!592526 e!760889)))

(assert (=> d!143531 (= c!125973 (and ((_ is Cons!31080) (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvslt (_1!11986 (h!32289 (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143531 (isStrictlySorted!875 (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))))

(assert (=> d!143531 (= (insertStrictlySorted!490 (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!592526)))

(declare-fun b!1336000 () Bool)

(assert (=> b!1336000 (= e!760889 e!760887)))

(declare-fun c!125974 () Bool)

(assert (=> b!1336000 (= c!125974 (and ((_ is Cons!31080) (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (= (_1!11986 (h!32289 (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1336001 () Bool)

(assert (=> b!1336001 (= e!760887 call!64845)))

(declare-fun b!1336002 () Bool)

(assert (=> b!1336002 (= e!760886 (ite c!125974 (t!45342 (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (ite c!125976 (Cons!31080 (h!32289 (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (t!45342 (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) Nil!31081)))))

(declare-fun b!1336003 () Bool)

(assert (=> b!1336003 (= e!760889 call!64846)))

(declare-fun b!1336004 () Bool)

(assert (=> b!1336004 (= e!760885 call!64844)))

(declare-fun b!1336005 () Bool)

(declare-fun res!886631 () Bool)

(assert (=> b!1336005 (=> (not res!886631) (not e!760888))))

(assert (=> b!1336005 (= res!886631 (containsKey!735 lt!592526 (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1336006 () Bool)

(assert (=> b!1336006 (= e!760886 (insertStrictlySorted!490 (t!45342 (toList!10819 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (_1!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11986 (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!143531 c!125973) b!1336003))

(assert (= (and d!143531 (not c!125973)) b!1336000))

(assert (= (and b!1336000 c!125974) b!1336001))

(assert (= (and b!1336000 (not c!125974)) b!1335997))

(assert (= (and b!1335997 c!125976) b!1336004))

(assert (= (and b!1335997 (not c!125976)) b!1335998))

(assert (= (or b!1336004 b!1335998) bm!64841))

(assert (= (or b!1336001 bm!64841) bm!64842))

(assert (= (or b!1336003 bm!64842) bm!64843))

(assert (= (and bm!64843 c!125975) b!1336006))

(assert (= (and bm!64843 (not c!125975)) b!1336002))

(assert (= (and d!143531 res!886632) b!1336005))

(assert (= (and b!1336005 res!886631) b!1335999))

(declare-fun m!1223663 () Bool)

(assert (=> b!1336005 m!1223663))

(declare-fun m!1223665 () Bool)

(assert (=> d!143531 m!1223665))

(declare-fun m!1223667 () Bool)

(assert (=> d!143531 m!1223667))

(declare-fun m!1223669 () Bool)

(assert (=> bm!64843 m!1223669))

(declare-fun m!1223671 () Bool)

(assert (=> b!1336006 m!1223671))

(declare-fun m!1223673 () Bool)

(assert (=> b!1335999 m!1223673))

(assert (=> d!143419 d!143531))

(declare-fun d!143533 () Bool)

(assert (=> d!143533 (isDefined!525 (getValueByKey!718 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun lt!592529 () Unit!43702)

(declare-fun choose!1968 (List!31084 (_ BitVec 64)) Unit!43702)

(assert (=> d!143533 (= lt!592529 (choose!1968 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun e!760892 () Bool)

(assert (=> d!143533 e!760892))

(declare-fun res!886635 () Bool)

(assert (=> d!143533 (=> (not res!886635) (not e!760892))))

(assert (=> d!143533 (= res!886635 (isStrictlySorted!875 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143533 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153) lt!592529)))

(declare-fun b!1336009 () Bool)

(assert (=> b!1336009 (= e!760892 (containsKey!735 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(assert (= (and d!143533 res!886635) b!1336009))

(assert (=> d!143533 m!1223337))

(assert (=> d!143533 m!1223337))

(assert (=> d!143533 m!1223339))

(declare-fun m!1223675 () Bool)

(assert (=> d!143533 m!1223675))

(declare-fun m!1223677 () Bool)

(assert (=> d!143533 m!1223677))

(assert (=> b!1336009 m!1223333))

(assert (=> b!1335810 d!143533))

(declare-fun d!143535 () Bool)

(declare-fun isEmpty!1089 (Option!769) Bool)

(assert (=> d!143535 (= (isDefined!525 (getValueByKey!718 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153)) (not (isEmpty!1089 (getValueByKey!718 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))))

(declare-fun bs!38232 () Bool)

(assert (= bs!38232 d!143535))

(assert (=> bs!38232 m!1223337))

(declare-fun m!1223679 () Bool)

(assert (=> bs!38232 m!1223679))

(assert (=> b!1335810 d!143535))

(declare-fun d!143537 () Bool)

(declare-fun c!125977 () Bool)

(assert (=> d!143537 (= c!125977 (and ((_ is Cons!31080) (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (= (_1!11986 (h!32289 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153)))))

(declare-fun e!760893 () Option!769)

(assert (=> d!143537 (= (getValueByKey!718 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153) e!760893)))

(declare-fun b!1336013 () Bool)

(declare-fun e!760894 () Option!769)

(assert (=> b!1336013 (= e!760894 None!767)))

(declare-fun b!1336011 () Bool)

(assert (=> b!1336011 (= e!760893 e!760894)))

(declare-fun c!125978 () Bool)

(assert (=> b!1336011 (= c!125978 (and ((_ is Cons!31080) (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (not (= (_1!11986 (h!32289 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153))))))

(declare-fun b!1336012 () Bool)

(assert (=> b!1336012 (= e!760894 (getValueByKey!718 (t!45342 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) k0!1153))))

(declare-fun b!1336010 () Bool)

(assert (=> b!1336010 (= e!760893 (Some!768 (_2!11986 (h!32289 (toList!10819 (+!4753 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))))

(assert (= (and d!143537 c!125977) b!1336010))

(assert (= (and d!143537 (not c!125977)) b!1336011))

(assert (= (and b!1336011 c!125978) b!1336012))

(assert (= (and b!1336011 (not c!125978)) b!1336013))

(declare-fun m!1223681 () Bool)

(assert (=> b!1336012 m!1223681))

(assert (=> b!1335810 d!143537))

(declare-fun d!143539 () Bool)

(assert (=> d!143539 (isDefined!525 (getValueByKey!718 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun lt!592530 () Unit!43702)

(assert (=> d!143539 (= lt!592530 (choose!1968 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun e!760895 () Bool)

(assert (=> d!143539 e!760895))

(declare-fun res!886636 () Bool)

(assert (=> d!143539 (=> (not res!886636) (not e!760895))))

(assert (=> d!143539 (= res!886636 (isStrictlySorted!875 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))

(assert (=> d!143539 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) lt!592530)))

(declare-fun b!1336014 () Bool)

(assert (=> b!1336014 (= e!760895 (containsKey!735 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (= (and d!143539 res!886636) b!1336014))

(assert (=> d!143539 m!1223217))

(assert (=> d!143539 m!1223217))

(assert (=> d!143539 m!1223219))

(declare-fun m!1223683 () Bool)

(assert (=> d!143539 m!1223683))

(declare-fun m!1223685 () Bool)

(assert (=> d!143539 m!1223685))

(assert (=> b!1336014 m!1223213))

(assert (=> b!1335682 d!143539))

(declare-fun d!143541 () Bool)

(assert (=> d!143541 (= (isDefined!525 (getValueByKey!718 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)) (not (isEmpty!1089 (getValueByKey!718 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))))

(declare-fun bs!38233 () Bool)

(assert (= bs!38233 d!143541))

(assert (=> bs!38233 m!1223217))

(declare-fun m!1223687 () Bool)

(assert (=> bs!38233 m!1223687))

(assert (=> b!1335682 d!143541))

(declare-fun d!143543 () Bool)

(declare-fun c!125979 () Bool)

(assert (=> d!143543 (= c!125979 (and ((_ is Cons!31080) (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!11986 (h!32289 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(declare-fun e!760896 () Option!769)

(assert (=> d!143543 (= (getValueByKey!718 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!760896)))

(declare-fun b!1336018 () Bool)

(declare-fun e!760897 () Option!769)

(assert (=> b!1336018 (= e!760897 None!767)))

(declare-fun b!1336016 () Bool)

(assert (=> b!1336016 (= e!760896 e!760897)))

(declare-fun c!125980 () Bool)

(assert (=> b!1336016 (= c!125980 (and ((_ is Cons!31080) (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (not (= (_1!11986 (h!32289 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153))))))

(declare-fun b!1336017 () Bool)

(assert (=> b!1336017 (= e!760897 (getValueByKey!718 (t!45342 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(declare-fun b!1336015 () Bool)

(assert (=> b!1336015 (= e!760896 (Some!768 (_2!11986 (h!32289 (toList!10819 (getCurrentListMap!5673 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))))

(assert (= (and d!143543 c!125979) b!1336015))

(assert (= (and d!143543 (not c!125979)) b!1336016))

(assert (= (and b!1336016 c!125980) b!1336017))

(assert (= (and b!1336016 (not c!125980)) b!1336018))

(declare-fun m!1223689 () Bool)

(assert (=> b!1336017 m!1223689))

(assert (=> b!1335682 d!143543))

(assert (=> b!1335732 d!143429))

(assert (=> b!1335812 d!143535))

(assert (=> b!1335812 d!143537))

(declare-fun d!143545 () Bool)

(declare-fun e!760898 () Bool)

(assert (=> d!143545 e!760898))

(declare-fun res!886637 () Bool)

(assert (=> d!143545 (=> res!886637 e!760898)))

(declare-fun lt!592531 () Bool)

(assert (=> d!143545 (= res!886637 (not lt!592531))))

(declare-fun lt!592534 () Bool)

(assert (=> d!143545 (= lt!592531 lt!592534)))

(declare-fun lt!592532 () Unit!43702)

(declare-fun e!760899 () Unit!43702)

(assert (=> d!143545 (= lt!592532 e!760899)))

(declare-fun c!125981 () Bool)

(assert (=> d!143545 (= c!125981 lt!592534)))

(assert (=> d!143545 (= lt!592534 (containsKey!735 (toList!10819 lt!592388) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143545 (= (contains!8911 lt!592388 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!592531)))

(declare-fun b!1336019 () Bool)

(declare-fun lt!592533 () Unit!43702)

(assert (=> b!1336019 (= e!760899 lt!592533)))

(assert (=> b!1336019 (= lt!592533 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 lt!592388) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> b!1336019 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592388) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1336020 () Bool)

(declare-fun Unit!43715 () Unit!43702)

(assert (=> b!1336020 (= e!760899 Unit!43715)))

(declare-fun b!1336021 () Bool)

(assert (=> b!1336021 (= e!760898 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592388) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (= (and d!143545 c!125981) b!1336019))

(assert (= (and d!143545 (not c!125981)) b!1336020))

(assert (= (and d!143545 (not res!886637)) b!1336021))

(declare-fun m!1223691 () Bool)

(assert (=> d!143545 m!1223691))

(declare-fun m!1223693 () Bool)

(assert (=> b!1336019 m!1223693))

(assert (=> b!1336019 m!1223297))

(assert (=> b!1336019 m!1223297))

(declare-fun m!1223695 () Bool)

(assert (=> b!1336019 m!1223695))

(assert (=> b!1336021 m!1223297))

(assert (=> b!1336021 m!1223297))

(assert (=> b!1336021 m!1223695))

(assert (=> d!143421 d!143545))

(declare-fun d!143547 () Bool)

(declare-fun c!125982 () Bool)

(assert (=> d!143547 (= c!125982 (and ((_ is Cons!31080) lt!592387) (= (_1!11986 (h!32289 lt!592387)) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun e!760900 () Option!769)

(assert (=> d!143547 (= (getValueByKey!718 lt!592387 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) e!760900)))

(declare-fun b!1336025 () Bool)

(declare-fun e!760901 () Option!769)

(assert (=> b!1336025 (= e!760901 None!767)))

(declare-fun b!1336023 () Bool)

(assert (=> b!1336023 (= e!760900 e!760901)))

(declare-fun c!125983 () Bool)

(assert (=> b!1336023 (= c!125983 (and ((_ is Cons!31080) lt!592387) (not (= (_1!11986 (h!32289 lt!592387)) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1336024 () Bool)

(assert (=> b!1336024 (= e!760901 (getValueByKey!718 (t!45342 lt!592387) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1336022 () Bool)

(assert (=> b!1336022 (= e!760900 (Some!768 (_2!11986 (h!32289 lt!592387))))))

(assert (= (and d!143547 c!125982) b!1336022))

(assert (= (and d!143547 (not c!125982)) b!1336023))

(assert (= (and b!1336023 c!125983) b!1336024))

(assert (= (and b!1336023 (not c!125983)) b!1336025))

(declare-fun m!1223697 () Bool)

(assert (=> b!1336024 m!1223697))

(assert (=> d!143421 d!143547))

(declare-fun d!143549 () Bool)

(assert (=> d!143549 (= (getValueByKey!718 lt!592387 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!768 (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!592535 () Unit!43702)

(assert (=> d!143549 (= lt!592535 (choose!1967 lt!592387 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun e!760902 () Bool)

(assert (=> d!143549 e!760902))

(declare-fun res!886638 () Bool)

(assert (=> d!143549 (=> (not res!886638) (not e!760902))))

(assert (=> d!143549 (= res!886638 (isStrictlySorted!875 lt!592387))))

(assert (=> d!143549 (= (lemmaContainsTupThenGetReturnValue!361 lt!592387 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!592535)))

(declare-fun b!1336026 () Bool)

(declare-fun res!886639 () Bool)

(assert (=> b!1336026 (=> (not res!886639) (not e!760902))))

(assert (=> b!1336026 (= res!886639 (containsKey!735 lt!592387 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1336027 () Bool)

(assert (=> b!1336027 (= e!760902 (contains!8915 lt!592387 (tuple2!23951 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (= (and d!143549 res!886638) b!1336026))

(assert (= (and b!1336026 res!886639) b!1336027))

(assert (=> d!143549 m!1223291))

(declare-fun m!1223699 () Bool)

(assert (=> d!143549 m!1223699))

(declare-fun m!1223701 () Bool)

(assert (=> d!143549 m!1223701))

(declare-fun m!1223703 () Bool)

(assert (=> b!1336026 m!1223703))

(declare-fun m!1223705 () Bool)

(assert (=> b!1336027 m!1223705))

(assert (=> d!143421 d!143549))

(declare-fun b!1336028 () Bool)

(declare-fun c!125987 () Bool)

(assert (=> b!1336028 (= c!125987 (and ((_ is Cons!31080) (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvsgt (_1!11986 (h!32289 (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun e!760905 () List!31084)

(declare-fun e!760903 () List!31084)

(assert (=> b!1336028 (= e!760905 e!760903)))

(declare-fun bm!64844 () Bool)

(declare-fun call!64847 () List!31084)

(declare-fun call!64848 () List!31084)

(assert (=> bm!64844 (= call!64847 call!64848)))

(declare-fun b!1336029 () Bool)

(assert (=> b!1336029 (= e!760903 call!64847)))

(declare-fun b!1336030 () Bool)

(declare-fun e!760906 () Bool)

(declare-fun lt!592536 () List!31084)

(assert (=> b!1336030 (= e!760906 (contains!8915 lt!592536 (tuple2!23951 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun bm!64845 () Bool)

(declare-fun call!64849 () List!31084)

(assert (=> bm!64845 (= call!64848 call!64849)))

(declare-fun c!125984 () Bool)

(declare-fun e!760904 () List!31084)

(declare-fun bm!64846 () Bool)

(assert (=> bm!64846 (= call!64849 ($colon$colon!672 e!760904 (ite c!125984 (h!32289 (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (tuple2!23951 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun c!125986 () Bool)

(assert (=> bm!64846 (= c!125986 c!125984)))

(declare-fun d!143551 () Bool)

(assert (=> d!143551 e!760906))

(declare-fun res!886641 () Bool)

(assert (=> d!143551 (=> (not res!886641) (not e!760906))))

(assert (=> d!143551 (= res!886641 (isStrictlySorted!875 lt!592536))))

(declare-fun e!760907 () List!31084)

(assert (=> d!143551 (= lt!592536 e!760907)))

(assert (=> d!143551 (= c!125984 (and ((_ is Cons!31080) (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!11986 (h!32289 (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143551 (isStrictlySorted!875 (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143551 (= (insertStrictlySorted!490 (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!592536)))

(declare-fun b!1336031 () Bool)

(assert (=> b!1336031 (= e!760907 e!760905)))

(declare-fun c!125985 () Bool)

(assert (=> b!1336031 (= c!125985 (and ((_ is Cons!31080) (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!11986 (h!32289 (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1336032 () Bool)

(assert (=> b!1336032 (= e!760905 call!64848)))

(declare-fun b!1336033 () Bool)

(assert (=> b!1336033 (= e!760904 (ite c!125985 (t!45342 (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (ite c!125987 (Cons!31080 (h!32289 (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (t!45342 (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) Nil!31081)))))

(declare-fun b!1336034 () Bool)

(assert (=> b!1336034 (= e!760907 call!64849)))

(declare-fun b!1336035 () Bool)

(assert (=> b!1336035 (= e!760903 call!64847)))

(declare-fun b!1336036 () Bool)

(declare-fun res!886640 () Bool)

(assert (=> b!1336036 (=> (not res!886640) (not e!760906))))

(assert (=> b!1336036 (= res!886640 (containsKey!735 lt!592536 (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1336037 () Bool)

(assert (=> b!1336037 (= e!760904 (insertStrictlySorted!490 (t!45342 (toList!10819 (+!4753 (getCurrentListMapNoExtraKeys!6396 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23951 (select (arr!43764 _keys!1590) from!1980) (get!22078 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (_1!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11986 (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (= (and d!143551 c!125984) b!1336034))

(assert (= (and d!143551 (not c!125984)) b!1336031))

(assert (= (and b!1336031 c!125985) b!1336032))

(assert (= (and b!1336031 (not c!125985)) b!1336028))

(assert (= (and b!1336028 c!125987) b!1336035))

(assert (= (and b!1336028 (not c!125987)) b!1336029))

(assert (= (or b!1336035 b!1336029) bm!64844))

(assert (= (or b!1336032 bm!64844) bm!64845))

(assert (= (or b!1336034 bm!64845) bm!64846))

(assert (= (and bm!64846 c!125986) b!1336037))

(assert (= (and bm!64846 (not c!125986)) b!1336033))

(assert (= (and d!143551 res!886641) b!1336036))

(assert (= (and b!1336036 res!886640) b!1336030))

(declare-fun m!1223707 () Bool)

(assert (=> b!1336036 m!1223707))

(declare-fun m!1223709 () Bool)

(assert (=> d!143551 m!1223709))

(declare-fun m!1223711 () Bool)

(assert (=> d!143551 m!1223711))

(declare-fun m!1223713 () Bool)

(assert (=> bm!64846 m!1223713))

(declare-fun m!1223715 () Bool)

(assert (=> b!1336037 m!1223715))

(declare-fun m!1223717 () Bool)

(assert (=> b!1336030 m!1223717))

(assert (=> d!143421 d!143551))

(assert (=> b!1335684 d!143541))

(assert (=> b!1335684 d!143543))

(declare-fun d!143553 () Bool)

(declare-fun e!760908 () Bool)

(assert (=> d!143553 e!760908))

(declare-fun res!886642 () Bool)

(assert (=> d!143553 (=> (not res!886642) (not e!760908))))

(declare-fun lt!592540 () ListLongMap!21607)

(assert (=> d!143553 (= res!886642 (contains!8911 lt!592540 (_1!11986 (ite (or c!125903 c!125906) (tuple2!23951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun lt!592539 () List!31084)

(assert (=> d!143553 (= lt!592540 (ListLongMap!21608 lt!592539))))

(declare-fun lt!592537 () Unit!43702)

(declare-fun lt!592538 () Unit!43702)

(assert (=> d!143553 (= lt!592537 lt!592538)))

(assert (=> d!143553 (= (getValueByKey!718 lt!592539 (_1!11986 (ite (or c!125903 c!125906) (tuple2!23951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!768 (_2!11986 (ite (or c!125903 c!125906) (tuple2!23951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143553 (= lt!592538 (lemmaContainsTupThenGetReturnValue!361 lt!592539 (_1!11986 (ite (or c!125903 c!125906) (tuple2!23951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!11986 (ite (or c!125903 c!125906) (tuple2!23951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143553 (= lt!592539 (insertStrictlySorted!490 (toList!10819 (ite c!125903 call!64825 (ite c!125906 call!64823 call!64824))) (_1!11986 (ite (or c!125903 c!125906) (tuple2!23951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!11986 (ite (or c!125903 c!125906) (tuple2!23951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143553 (= (+!4753 (ite c!125903 call!64825 (ite c!125906 call!64823 call!64824)) (ite (or c!125903 c!125906) (tuple2!23951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!592540)))

(declare-fun b!1336038 () Bool)

(declare-fun res!886643 () Bool)

(assert (=> b!1336038 (=> (not res!886643) (not e!760908))))

(assert (=> b!1336038 (= res!886643 (= (getValueByKey!718 (toList!10819 lt!592540) (_1!11986 (ite (or c!125903 c!125906) (tuple2!23951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!768 (_2!11986 (ite (or c!125903 c!125906) (tuple2!23951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1336039 () Bool)

(assert (=> b!1336039 (= e!760908 (contains!8915 (toList!10819 lt!592540) (ite (or c!125903 c!125906) (tuple2!23951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23951 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (= (and d!143553 res!886642) b!1336038))

(assert (= (and b!1336038 res!886643) b!1336039))

(declare-fun m!1223719 () Bool)

(assert (=> d!143553 m!1223719))

(declare-fun m!1223721 () Bool)

(assert (=> d!143553 m!1223721))

(declare-fun m!1223723 () Bool)

(assert (=> d!143553 m!1223723))

(declare-fun m!1223725 () Bool)

(assert (=> d!143553 m!1223725))

(declare-fun m!1223727 () Bool)

(assert (=> b!1336038 m!1223727))

(declare-fun m!1223729 () Bool)

(assert (=> b!1336039 m!1223729))

(assert (=> bm!64819 d!143553))

(declare-fun d!143555 () Bool)

(assert (=> d!143555 (= (apply!1025 lt!592343 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22082 (getValueByKey!718 (toList!10819 lt!592343) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38234 () Bool)

(assert (= bs!38234 d!143555))

(assert (=> bs!38234 m!1223613))

(assert (=> bs!38234 m!1223613))

(declare-fun m!1223731 () Bool)

(assert (=> bs!38234 m!1223731))

(assert (=> b!1335733 d!143555))

(assert (=> bm!64820 d!143499))

(assert (=> b!1335793 d!143471))

(declare-fun d!143557 () Bool)

(assert (=> d!143557 (= (get!22080 (select (arr!43765 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21158 (select (arr!43765 _values!1320) from!1980)))))

(assert (=> b!1335808 d!143557))

(declare-fun d!143559 () Bool)

(declare-fun e!760909 () Bool)

(assert (=> d!143559 e!760909))

(declare-fun res!886644 () Bool)

(assert (=> d!143559 (=> res!886644 e!760909)))

(declare-fun lt!592541 () Bool)

(assert (=> d!143559 (= res!886644 (not lt!592541))))

(declare-fun lt!592544 () Bool)

(assert (=> d!143559 (= lt!592541 lt!592544)))

(declare-fun lt!592542 () Unit!43702)

(declare-fun e!760910 () Unit!43702)

(assert (=> d!143559 (= lt!592542 e!760910)))

(declare-fun c!125988 () Bool)

(assert (=> d!143559 (= c!125988 lt!592544)))

(assert (=> d!143559 (= lt!592544 (containsKey!735 (toList!10819 lt!592404) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143559 (= (contains!8911 lt!592404 #b0000000000000000000000000000000000000000000000000000000000000000) lt!592541)))

(declare-fun b!1336040 () Bool)

(declare-fun lt!592543 () Unit!43702)

(assert (=> b!1336040 (= e!760910 lt!592543)))

(assert (=> b!1336040 (= lt!592543 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10819 lt!592404) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1336040 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592404) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1336041 () Bool)

(declare-fun Unit!43716 () Unit!43702)

(assert (=> b!1336041 (= e!760910 Unit!43716)))

(declare-fun b!1336042 () Bool)

(assert (=> b!1336042 (= e!760909 (isDefined!525 (getValueByKey!718 (toList!10819 lt!592404) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143559 c!125988) b!1336040))

(assert (= (and d!143559 (not c!125988)) b!1336041))

(assert (= (and d!143559 (not res!886644)) b!1336042))

(declare-fun m!1223733 () Bool)

(assert (=> d!143559 m!1223733))

(declare-fun m!1223735 () Bool)

(assert (=> b!1336040 m!1223735))

(declare-fun m!1223737 () Bool)

(assert (=> b!1336040 m!1223737))

(assert (=> b!1336040 m!1223737))

(declare-fun m!1223739 () Bool)

(assert (=> b!1336040 m!1223739))

(assert (=> b!1336042 m!1223737))

(assert (=> b!1336042 m!1223737))

(assert (=> b!1336042 m!1223739))

(assert (=> d!143423 d!143559))

(assert (=> d!143423 d!143413))

(declare-fun b!1336043 () Bool)

(declare-fun e!760912 () Bool)

(assert (=> b!1336043 (= e!760912 tp_is_empty!36895)))

(declare-fun b!1336044 () Bool)

(declare-fun e!760911 () Bool)

(assert (=> b!1336044 (= e!760911 tp_is_empty!36895)))

(declare-fun mapNonEmpty!57026 () Bool)

(declare-fun mapRes!57026 () Bool)

(declare-fun tp!108609 () Bool)

(assert (=> mapNonEmpty!57026 (= mapRes!57026 (and tp!108609 e!760912))))

(declare-fun mapKey!57026 () (_ BitVec 32))

(declare-fun mapRest!57026 () (Array (_ BitVec 32) ValueCell!17549))

(declare-fun mapValue!57026 () ValueCell!17549)

(assert (=> mapNonEmpty!57026 (= mapRest!57025 (store mapRest!57026 mapKey!57026 mapValue!57026))))

(declare-fun condMapEmpty!57026 () Bool)

(declare-fun mapDefault!57026 () ValueCell!17549)

(assert (=> mapNonEmpty!57025 (= condMapEmpty!57026 (= mapRest!57025 ((as const (Array (_ BitVec 32) ValueCell!17549)) mapDefault!57026)))))

(assert (=> mapNonEmpty!57025 (= tp!108608 (and e!760911 mapRes!57026))))

(declare-fun mapIsEmpty!57026 () Bool)

(assert (=> mapIsEmpty!57026 mapRes!57026))

(assert (= (and mapNonEmpty!57025 condMapEmpty!57026) mapIsEmpty!57026))

(assert (= (and mapNonEmpty!57025 (not condMapEmpty!57026)) mapNonEmpty!57026))

(assert (= (and mapNonEmpty!57026 ((_ is ValueCellFull!17549) mapValue!57026)) b!1336043))

(assert (= (and mapNonEmpty!57025 ((_ is ValueCellFull!17549) mapDefault!57026)) b!1336044))

(declare-fun m!1223741 () Bool)

(assert (=> mapNonEmpty!57026 m!1223741))

(declare-fun b_lambda!24131 () Bool)

(assert (= b_lambda!24129 (or (and start!112590 b_free!30985) b_lambda!24131)))

(declare-fun b_lambda!24133 () Bool)

(assert (= b_lambda!24123 (or (and start!112590 b_free!30985) b_lambda!24133)))

(declare-fun b_lambda!24135 () Bool)

(assert (= b_lambda!24127 (or (and start!112590 b_free!30985) b_lambda!24135)))

(declare-fun b_lambda!24137 () Bool)

(assert (= b_lambda!24125 (or (and start!112590 b_free!30985) b_lambda!24137)))

(check-sat (not b!1335858) (not b!1335963) (not b!1335854) (not b!1335964) (not b!1335823) (not d!143455) (not b!1335866) (not d!143517) (not d!143483) (not d!143437) (not d!143451) (not b!1335918) (not d!143495) (not d!143553) (not d!143533) (not b!1335867) (not b!1335966) (not b!1335976) (not b!1335969) (not b!1336024) (not b!1335898) (not d!143481) (not b_lambda!24109) (not b!1336012) (not b!1335895) (not b!1335877) (not b!1335879) (not d!143509) (not b!1335929) (not b_lambda!24137) (not b!1335910) (not d!143501) (not b!1335975) (not d!143551) (not b!1336014) (not d!143441) (not b!1335923) (not d!143549) (not b!1335835) (not d!143479) (not b!1335821) tp_is_empty!36895 (not bm!64846) (not b!1335862) (not d!143469) (not b!1335864) (not d!143473) (not b!1335874) (not d!143559) (not b!1335894) (not b!1335829) b_and!49899 (not mapNonEmpty!57026) (not d!143499) (not b!1335859) (not b_lambda!24121) (not b!1335927) (not d!143521) (not d!143503) (not b_lambda!24117) (not b!1335876) (not b!1335931) (not bm!64832) (not b!1335926) (not d!143449) (not d!143485) (not b!1336037) (not d!143513) (not b!1335903) (not d!143487) (not b!1336026) (not b!1335911) (not b!1335857) (not b_next!30985) (not bm!64843) (not bm!64831) (not b!1336038) (not b!1335961) (not b_lambda!24119) (not d!143541) (not b!1336040) (not b!1335872) (not d!143459) (not b!1335888) (not b!1335958) (not d!143467) (not d!143507) (not d!143491) (not d!143525) (not b!1335913) (not b!1335849) (not b!1336027) (not b!1336019) (not b!1336039) (not d!143511) (not b!1335884) (not b_lambda!24131) (not b!1335908) (not b!1335855) (not b!1335957) (not b!1335915) (not b!1335921) (not b!1336021) (not d!143523) (not b!1335852) (not d!143477) (not b!1335881) (not d!143431) (not b!1335955) (not b!1336036) (not b!1335875) (not d!143531) (not b!1335902) (not b!1336030) (not bm!64834) (not b!1335956) (not b!1335909) (not d!143493) (not b!1335865) (not d!143497) (not b_lambda!24133) (not b!1336009) (not d!143539) (not bm!64833) (not b!1335846) (not b!1336005) (not b!1335937) (not b!1335878) (not b!1335916) (not d!143447) (not b!1336006) (not d!143489) (not b!1335999) (not d!143505) (not b!1336017) (not d!143445) (not b!1335901) (not b!1335922) (not d!143535) (not d!143465) (not b!1335899) (not b_lambda!24135) (not d!143555) (not d!143529) (not b!1335882) (not b!1335919) (not b!1335851) (not b!1335886) (not d!143461) (not b!1336042) (not d!143545))
(check-sat b_and!49899 (not b_next!30985))
