; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111930 () Bool)

(assert start!111930)

(declare-fun b_free!30529 () Bool)

(declare-fun b_next!30529 () Bool)

(assert (=> start!111930 (= b_free!30529 (not b_next!30529))))

(declare-fun tp!107067 () Bool)

(declare-fun b_and!49135 () Bool)

(assert (=> start!111930 (= tp!107067 b_and!49135)))

(declare-fun b!1326468 () Bool)

(declare-fun res!880399 () Bool)

(declare-fun e!756032 () Bool)

(assert (=> b!1326468 (=> (not res!880399) (not e!756032))))

(declare-datatypes ((array!89537 0))(
  ( (array!89538 (arr!43242 (Array (_ BitVec 32) (_ BitVec 64))) (size!43794 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89537)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1326468 (= res!880399 (not (= (select (arr!43242 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!56175 () Bool)

(declare-fun mapRes!56175 () Bool)

(declare-fun tp!107068 () Bool)

(declare-fun e!756031 () Bool)

(assert (=> mapNonEmpty!56175 (= mapRes!56175 (and tp!107068 e!756031))))

(declare-fun mapKey!56175 () (_ BitVec 32))

(declare-datatypes ((V!53569 0))(
  ( (V!53570 (val!18249 Int)) )
))
(declare-datatypes ((ValueCell!17276 0))(
  ( (ValueCellFull!17276 (v!20881 V!53569)) (EmptyCell!17276) )
))
(declare-datatypes ((array!89539 0))(
  ( (array!89540 (arr!43243 (Array (_ BitVec 32) ValueCell!17276)) (size!43795 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89539)

(declare-fun mapValue!56175 () ValueCell!17276)

(declare-fun mapRest!56175 () (Array (_ BitVec 32) ValueCell!17276))

(assert (=> mapNonEmpty!56175 (= (arr!43243 _values!1337) (store mapRest!56175 mapKey!56175 mapValue!56175))))

(declare-fun b!1326469 () Bool)

(declare-fun res!880400 () Bool)

(assert (=> b!1326469 (=> (not res!880400) (not e!756032))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53569)

(declare-fun minValue!1279 () V!53569)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23606 0))(
  ( (tuple2!23607 (_1!11814 (_ BitVec 64)) (_2!11814 V!53569)) )
))
(declare-datatypes ((List!30733 0))(
  ( (Nil!30730) (Cons!30729 (h!31938 tuple2!23606) (t!44725 List!30733)) )
))
(declare-datatypes ((ListLongMap!21263 0))(
  ( (ListLongMap!21264 (toList!10647 List!30733)) )
))
(declare-fun contains!8731 (ListLongMap!21263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5519 (array!89537 array!89539 (_ BitVec 32) (_ BitVec 32) V!53569 V!53569 (_ BitVec 32) Int) ListLongMap!21263)

(assert (=> b!1326469 (= res!880400 (contains!8731 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1326470 () Bool)

(declare-fun res!880396 () Bool)

(assert (=> b!1326470 (=> (not res!880396) (not e!756032))))

(assert (=> b!1326470 (= res!880396 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43794 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326472 () Bool)

(declare-fun res!880398 () Bool)

(assert (=> b!1326472 (=> (not res!880398) (not e!756032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326472 (= res!880398 (validKeyInArray!0 (select (arr!43242 _keys!1609) from!2000)))))

(declare-fun b!1326473 () Bool)

(declare-fun res!880397 () Bool)

(assert (=> b!1326473 (=> (not res!880397) (not e!756032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89537 (_ BitVec 32)) Bool)

(assert (=> b!1326473 (= res!880397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!56175 () Bool)

(assert (=> mapIsEmpty!56175 mapRes!56175))

(declare-fun b!1326474 () Bool)

(declare-fun res!880403 () Bool)

(assert (=> b!1326474 (=> (not res!880403) (not e!756032))))

(assert (=> b!1326474 (= res!880403 (and (= (size!43795 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43794 _keys!1609) (size!43795 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326475 () Bool)

(declare-fun tp_is_empty!36349 () Bool)

(assert (=> b!1326475 (= e!756031 tp_is_empty!36349)))

(declare-fun b!1326476 () Bool)

(declare-fun res!880402 () Bool)

(assert (=> b!1326476 (=> (not res!880402) (not e!756032))))

(declare-datatypes ((List!30734 0))(
  ( (Nil!30731) (Cons!30730 (h!31939 (_ BitVec 64)) (t!44726 List!30734)) )
))
(declare-fun arrayNoDuplicates!0 (array!89537 (_ BitVec 32) List!30734) Bool)

(assert (=> b!1326476 (= res!880402 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30731))))

(declare-fun b!1326471 () Bool)

(declare-fun e!756033 () Bool)

(declare-fun e!756034 () Bool)

(assert (=> b!1326471 (= e!756033 (and e!756034 mapRes!56175))))

(declare-fun condMapEmpty!56175 () Bool)

(declare-fun mapDefault!56175 () ValueCell!17276)

(assert (=> b!1326471 (= condMapEmpty!56175 (= (arr!43243 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17276)) mapDefault!56175)))))

(declare-fun res!880401 () Bool)

(assert (=> start!111930 (=> (not res!880401) (not e!756032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111930 (= res!880401 (validMask!0 mask!2019))))

(assert (=> start!111930 e!756032))

(declare-fun array_inv!32811 (array!89537) Bool)

(assert (=> start!111930 (array_inv!32811 _keys!1609)))

(assert (=> start!111930 true))

(assert (=> start!111930 tp_is_empty!36349))

(declare-fun array_inv!32812 (array!89539) Bool)

(assert (=> start!111930 (and (array_inv!32812 _values!1337) e!756033)))

(assert (=> start!111930 tp!107067))

(declare-fun b!1326477 () Bool)

(assert (=> b!1326477 (= e!756032 (not (contains!8731 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k0!1164)))))

(declare-fun lt!589986 () ListLongMap!21263)

(declare-fun +!4653 (ListLongMap!21263 tuple2!23606) ListLongMap!21263)

(assert (=> b!1326477 (contains!8731 (+!4653 lt!589986 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43499 0))(
  ( (Unit!43500) )
))
(declare-fun lt!589988 () Unit!43499)

(declare-fun addStillContains!1157 (ListLongMap!21263 (_ BitVec 64) V!53569 (_ BitVec 64)) Unit!43499)

(assert (=> b!1326477 (= lt!589988 (addStillContains!1157 lt!589986 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1326477 (contains!8731 lt!589986 k0!1164)))

(declare-fun lt!589992 () ListLongMap!21263)

(declare-fun lt!589989 () tuple2!23606)

(assert (=> b!1326477 (= lt!589986 (+!4653 lt!589992 lt!589989))))

(declare-fun lt!589983 () Unit!43499)

(assert (=> b!1326477 (= lt!589983 (addStillContains!1157 lt!589992 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1326477 (contains!8731 lt!589992 k0!1164)))

(declare-fun lt!589985 () V!53569)

(declare-fun lt!589990 () Unit!43499)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!215 ((_ BitVec 64) (_ BitVec 64) V!53569 ListLongMap!21263) Unit!43499)

(assert (=> b!1326477 (= lt!589990 (lemmaInListMapAfterAddingDiffThenInBefore!215 k0!1164 (select (arr!43242 _keys!1609) from!2000) lt!589985 lt!589992))))

(declare-fun lt!589982 () ListLongMap!21263)

(assert (=> b!1326477 (contains!8731 lt!589982 k0!1164)))

(declare-fun lt!589991 () Unit!43499)

(assert (=> b!1326477 (= lt!589991 (lemmaInListMapAfterAddingDiffThenInBefore!215 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589982))))

(declare-fun lt!589984 () ListLongMap!21263)

(assert (=> b!1326477 (contains!8731 lt!589984 k0!1164)))

(declare-fun lt!589987 () Unit!43499)

(assert (=> b!1326477 (= lt!589987 (lemmaInListMapAfterAddingDiffThenInBefore!215 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589984))))

(assert (=> b!1326477 (= lt!589984 (+!4653 lt!589982 lt!589989))))

(assert (=> b!1326477 (= lt!589989 (tuple2!23607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1326477 (= lt!589982 (+!4653 lt!589992 (tuple2!23607 (select (arr!43242 _keys!1609) from!2000) lt!589985)))))

(declare-fun get!21791 (ValueCell!17276 V!53569) V!53569)

(declare-fun dynLambda!3583 (Int (_ BitVec 64)) V!53569)

(assert (=> b!1326477 (= lt!589985 (get!21791 (select (arr!43243 _values!1337) from!2000) (dynLambda!3583 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6291 (array!89537 array!89539 (_ BitVec 32) (_ BitVec 32) V!53569 V!53569 (_ BitVec 32) Int) ListLongMap!21263)

(assert (=> b!1326477 (= lt!589992 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1326478 () Bool)

(assert (=> b!1326478 (= e!756034 tp_is_empty!36349)))

(assert (= (and start!111930 res!880401) b!1326474))

(assert (= (and b!1326474 res!880403) b!1326473))

(assert (= (and b!1326473 res!880397) b!1326476))

(assert (= (and b!1326476 res!880402) b!1326470))

(assert (= (and b!1326470 res!880396) b!1326469))

(assert (= (and b!1326469 res!880400) b!1326468))

(assert (= (and b!1326468 res!880399) b!1326472))

(assert (= (and b!1326472 res!880398) b!1326477))

(assert (= (and b!1326471 condMapEmpty!56175) mapIsEmpty!56175))

(assert (= (and b!1326471 (not condMapEmpty!56175)) mapNonEmpty!56175))

(get-info :version)

(assert (= (and mapNonEmpty!56175 ((_ is ValueCellFull!17276) mapValue!56175)) b!1326475))

(assert (= (and b!1326471 ((_ is ValueCellFull!17276) mapDefault!56175)) b!1326478))

(assert (= start!111930 b!1326471))

(declare-fun b_lambda!23797 () Bool)

(assert (=> (not b_lambda!23797) (not b!1326477)))

(declare-fun t!44724 () Bool)

(declare-fun tb!11795 () Bool)

(assert (=> (and start!111930 (= defaultEntry!1340 defaultEntry!1340) t!44724) tb!11795))

(declare-fun result!24655 () Bool)

(assert (=> tb!11795 (= result!24655 tp_is_empty!36349)))

(assert (=> b!1326477 t!44724))

(declare-fun b_and!49137 () Bool)

(assert (= b_and!49135 (and (=> t!44724 result!24655) b_and!49137)))

(declare-fun m!1215055 () Bool)

(assert (=> b!1326476 m!1215055))

(declare-fun m!1215057 () Bool)

(assert (=> mapNonEmpty!56175 m!1215057))

(declare-fun m!1215059 () Bool)

(assert (=> b!1326472 m!1215059))

(assert (=> b!1326472 m!1215059))

(declare-fun m!1215061 () Bool)

(assert (=> b!1326472 m!1215061))

(declare-fun m!1215063 () Bool)

(assert (=> b!1326473 m!1215063))

(assert (=> b!1326468 m!1215059))

(declare-fun m!1215065 () Bool)

(assert (=> b!1326477 m!1215065))

(declare-fun m!1215067 () Bool)

(assert (=> b!1326477 m!1215067))

(declare-fun m!1215069 () Bool)

(assert (=> b!1326477 m!1215069))

(declare-fun m!1215071 () Bool)

(assert (=> b!1326477 m!1215071))

(declare-fun m!1215073 () Bool)

(assert (=> b!1326477 m!1215073))

(declare-fun m!1215075 () Bool)

(assert (=> b!1326477 m!1215075))

(declare-fun m!1215077 () Bool)

(assert (=> b!1326477 m!1215077))

(declare-fun m!1215079 () Bool)

(assert (=> b!1326477 m!1215079))

(declare-fun m!1215081 () Bool)

(assert (=> b!1326477 m!1215081))

(assert (=> b!1326477 m!1215059))

(declare-fun m!1215083 () Bool)

(assert (=> b!1326477 m!1215083))

(declare-fun m!1215085 () Bool)

(assert (=> b!1326477 m!1215085))

(assert (=> b!1326477 m!1215073))

(declare-fun m!1215087 () Bool)

(assert (=> b!1326477 m!1215087))

(assert (=> b!1326477 m!1215059))

(declare-fun m!1215089 () Bool)

(assert (=> b!1326477 m!1215089))

(declare-fun m!1215091 () Bool)

(assert (=> b!1326477 m!1215091))

(declare-fun m!1215093 () Bool)

(assert (=> b!1326477 m!1215093))

(assert (=> b!1326477 m!1215069))

(declare-fun m!1215095 () Bool)

(assert (=> b!1326477 m!1215095))

(assert (=> b!1326477 m!1215085))

(declare-fun m!1215097 () Bool)

(assert (=> b!1326477 m!1215097))

(declare-fun m!1215099 () Bool)

(assert (=> b!1326477 m!1215099))

(assert (=> b!1326477 m!1215065))

(declare-fun m!1215101 () Bool)

(assert (=> b!1326477 m!1215101))

(declare-fun m!1215103 () Bool)

(assert (=> b!1326477 m!1215103))

(declare-fun m!1215105 () Bool)

(assert (=> b!1326469 m!1215105))

(assert (=> b!1326469 m!1215105))

(declare-fun m!1215107 () Bool)

(assert (=> b!1326469 m!1215107))

(declare-fun m!1215109 () Bool)

(assert (=> start!111930 m!1215109))

(declare-fun m!1215111 () Bool)

(assert (=> start!111930 m!1215111))

(declare-fun m!1215113 () Bool)

(assert (=> start!111930 m!1215113))

(check-sat (not b!1326469) (not mapNonEmpty!56175) (not b!1326473) (not b!1326476) (not b_next!30529) (not b_lambda!23797) b_and!49137 tp_is_empty!36349 (not b!1326472) (not start!111930) (not b!1326477))
(check-sat b_and!49137 (not b_next!30529))
(get-model)

(declare-fun b_lambda!23803 () Bool)

(assert (= b_lambda!23797 (or (and start!111930 b_free!30529) b_lambda!23803)))

(check-sat (not b!1326469) (not mapNonEmpty!56175) (not b_lambda!23803) (not b!1326473) b_and!49137 (not b!1326476) (not b_next!30529) tp_is_empty!36349 (not b!1326472) (not start!111930) (not b!1326477))
(check-sat b_and!49137 (not b_next!30529))
(get-model)

(declare-fun d!142973 () Bool)

(declare-fun e!756070 () Bool)

(assert (=> d!142973 e!756070))

(declare-fun res!880454 () Bool)

(assert (=> d!142973 (=> res!880454 e!756070)))

(declare-fun lt!590067 () Bool)

(assert (=> d!142973 (= res!880454 (not lt!590067))))

(declare-fun lt!590068 () Bool)

(assert (=> d!142973 (= lt!590067 lt!590068)))

(declare-fun lt!590070 () Unit!43499)

(declare-fun e!756069 () Unit!43499)

(assert (=> d!142973 (= lt!590070 e!756069)))

(declare-fun c!125739 () Bool)

(assert (=> d!142973 (= c!125739 lt!590068)))

(declare-fun containsKey!733 (List!30733 (_ BitVec 64)) Bool)

(assert (=> d!142973 (= lt!590068 (containsKey!733 (toList!10647 lt!589984) k0!1164))))

(assert (=> d!142973 (= (contains!8731 lt!589984 k0!1164) lt!590067)))

(declare-fun b!1326557 () Bool)

(declare-fun lt!590069 () Unit!43499)

(assert (=> b!1326557 (= e!756069 lt!590069)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!480 (List!30733 (_ BitVec 64)) Unit!43499)

(assert (=> b!1326557 (= lt!590069 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10647 lt!589984) k0!1164))))

(declare-datatypes ((Option!767 0))(
  ( (Some!766 (v!20884 V!53569)) (None!765) )
))
(declare-fun isDefined!523 (Option!767) Bool)

(declare-fun getValueByKey!716 (List!30733 (_ BitVec 64)) Option!767)

(assert (=> b!1326557 (isDefined!523 (getValueByKey!716 (toList!10647 lt!589984) k0!1164))))

(declare-fun b!1326558 () Bool)

(declare-fun Unit!43503 () Unit!43499)

(assert (=> b!1326558 (= e!756069 Unit!43503)))

(declare-fun b!1326559 () Bool)

(assert (=> b!1326559 (= e!756070 (isDefined!523 (getValueByKey!716 (toList!10647 lt!589984) k0!1164)))))

(assert (= (and d!142973 c!125739) b!1326557))

(assert (= (and d!142973 (not c!125739)) b!1326558))

(assert (= (and d!142973 (not res!880454)) b!1326559))

(declare-fun m!1215235 () Bool)

(assert (=> d!142973 m!1215235))

(declare-fun m!1215237 () Bool)

(assert (=> b!1326557 m!1215237))

(declare-fun m!1215239 () Bool)

(assert (=> b!1326557 m!1215239))

(assert (=> b!1326557 m!1215239))

(declare-fun m!1215241 () Bool)

(assert (=> b!1326557 m!1215241))

(assert (=> b!1326559 m!1215239))

(assert (=> b!1326559 m!1215239))

(assert (=> b!1326559 m!1215241))

(assert (=> b!1326477 d!142973))

(declare-fun d!142975 () Bool)

(assert (=> d!142975 (contains!8731 lt!589984 k0!1164)))

(declare-fun lt!590073 () Unit!43499)

(declare-fun choose!1959 ((_ BitVec 64) (_ BitVec 64) V!53569 ListLongMap!21263) Unit!43499)

(assert (=> d!142975 (= lt!590073 (choose!1959 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589984))))

(assert (=> d!142975 (contains!8731 (+!4653 lt!589984 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(assert (=> d!142975 (= (lemmaInListMapAfterAddingDiffThenInBefore!215 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589984) lt!590073)))

(declare-fun bs!37919 () Bool)

(assert (= bs!37919 d!142975))

(assert (=> bs!37919 m!1215103))

(declare-fun m!1215243 () Bool)

(assert (=> bs!37919 m!1215243))

(declare-fun m!1215245 () Bool)

(assert (=> bs!37919 m!1215245))

(assert (=> bs!37919 m!1215245))

(declare-fun m!1215247 () Bool)

(assert (=> bs!37919 m!1215247))

(assert (=> b!1326477 d!142975))

(declare-fun d!142977 () Bool)

(declare-fun e!756072 () Bool)

(assert (=> d!142977 e!756072))

(declare-fun res!880455 () Bool)

(assert (=> d!142977 (=> res!880455 e!756072)))

(declare-fun lt!590074 () Bool)

(assert (=> d!142977 (= res!880455 (not lt!590074))))

(declare-fun lt!590075 () Bool)

(assert (=> d!142977 (= lt!590074 lt!590075)))

(declare-fun lt!590077 () Unit!43499)

(declare-fun e!756071 () Unit!43499)

(assert (=> d!142977 (= lt!590077 e!756071)))

(declare-fun c!125740 () Bool)

(assert (=> d!142977 (= c!125740 lt!590075)))

(assert (=> d!142977 (= lt!590075 (containsKey!733 (toList!10647 (+!4653 lt!589986 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(assert (=> d!142977 (= (contains!8731 (+!4653 lt!589986 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164) lt!590074)))

(declare-fun b!1326560 () Bool)

(declare-fun lt!590076 () Unit!43499)

(assert (=> b!1326560 (= e!756071 lt!590076)))

(assert (=> b!1326560 (= lt!590076 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10647 (+!4653 lt!589986 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(assert (=> b!1326560 (isDefined!523 (getValueByKey!716 (toList!10647 (+!4653 lt!589986 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-fun b!1326561 () Bool)

(declare-fun Unit!43504 () Unit!43499)

(assert (=> b!1326561 (= e!756071 Unit!43504)))

(declare-fun b!1326562 () Bool)

(assert (=> b!1326562 (= e!756072 (isDefined!523 (getValueByKey!716 (toList!10647 (+!4653 lt!589986 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164)))))

(assert (= (and d!142977 c!125740) b!1326560))

(assert (= (and d!142977 (not c!125740)) b!1326561))

(assert (= (and d!142977 (not res!880455)) b!1326562))

(declare-fun m!1215249 () Bool)

(assert (=> d!142977 m!1215249))

(declare-fun m!1215251 () Bool)

(assert (=> b!1326560 m!1215251))

(declare-fun m!1215253 () Bool)

(assert (=> b!1326560 m!1215253))

(assert (=> b!1326560 m!1215253))

(declare-fun m!1215255 () Bool)

(assert (=> b!1326560 m!1215255))

(assert (=> b!1326562 m!1215253))

(assert (=> b!1326562 m!1215253))

(assert (=> b!1326562 m!1215255))

(assert (=> b!1326477 d!142977))

(declare-fun d!142979 () Bool)

(assert (=> d!142979 (contains!8731 lt!589982 k0!1164)))

(declare-fun lt!590078 () Unit!43499)

(assert (=> d!142979 (= lt!590078 (choose!1959 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589982))))

(assert (=> d!142979 (contains!8731 (+!4653 lt!589982 (tuple2!23607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) k0!1164)))

(assert (=> d!142979 (= (lemmaInListMapAfterAddingDiffThenInBefore!215 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589982) lt!590078)))

(declare-fun bs!37920 () Bool)

(assert (= bs!37920 d!142979))

(assert (=> bs!37920 m!1215075))

(declare-fun m!1215257 () Bool)

(assert (=> bs!37920 m!1215257))

(declare-fun m!1215259 () Bool)

(assert (=> bs!37920 m!1215259))

(assert (=> bs!37920 m!1215259))

(declare-fun m!1215261 () Bool)

(assert (=> bs!37920 m!1215261))

(assert (=> b!1326477 d!142979))

(declare-fun d!142981 () Bool)

(declare-fun c!125743 () Bool)

(assert (=> d!142981 (= c!125743 ((_ is ValueCellFull!17276) (select (arr!43243 _values!1337) from!2000)))))

(declare-fun e!756075 () V!53569)

(assert (=> d!142981 (= (get!21791 (select (arr!43243 _values!1337) from!2000) (dynLambda!3583 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!756075)))

(declare-fun b!1326567 () Bool)

(declare-fun get!21793 (ValueCell!17276 V!53569) V!53569)

(assert (=> b!1326567 (= e!756075 (get!21793 (select (arr!43243 _values!1337) from!2000) (dynLambda!3583 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1326568 () Bool)

(declare-fun get!21794 (ValueCell!17276 V!53569) V!53569)

(assert (=> b!1326568 (= e!756075 (get!21794 (select (arr!43243 _values!1337) from!2000) (dynLambda!3583 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142981 c!125743) b!1326567))

(assert (= (and d!142981 (not c!125743)) b!1326568))

(assert (=> b!1326567 m!1215085))

(assert (=> b!1326567 m!1215073))

(declare-fun m!1215263 () Bool)

(assert (=> b!1326567 m!1215263))

(assert (=> b!1326568 m!1215085))

(assert (=> b!1326568 m!1215073))

(declare-fun m!1215265 () Bool)

(assert (=> b!1326568 m!1215265))

(assert (=> b!1326477 d!142981))

(declare-fun d!142983 () Bool)

(declare-fun e!756077 () Bool)

(assert (=> d!142983 e!756077))

(declare-fun res!880456 () Bool)

(assert (=> d!142983 (=> res!880456 e!756077)))

(declare-fun lt!590079 () Bool)

(assert (=> d!142983 (= res!880456 (not lt!590079))))

(declare-fun lt!590080 () Bool)

(assert (=> d!142983 (= lt!590079 lt!590080)))

(declare-fun lt!590082 () Unit!43499)

(declare-fun e!756076 () Unit!43499)

(assert (=> d!142983 (= lt!590082 e!756076)))

(declare-fun c!125744 () Bool)

(assert (=> d!142983 (= c!125744 lt!590080)))

(assert (=> d!142983 (= lt!590080 (containsKey!733 (toList!10647 lt!589986) k0!1164))))

(assert (=> d!142983 (= (contains!8731 lt!589986 k0!1164) lt!590079)))

(declare-fun b!1326569 () Bool)

(declare-fun lt!590081 () Unit!43499)

(assert (=> b!1326569 (= e!756076 lt!590081)))

(assert (=> b!1326569 (= lt!590081 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10647 lt!589986) k0!1164))))

(assert (=> b!1326569 (isDefined!523 (getValueByKey!716 (toList!10647 lt!589986) k0!1164))))

(declare-fun b!1326570 () Bool)

(declare-fun Unit!43505 () Unit!43499)

(assert (=> b!1326570 (= e!756076 Unit!43505)))

(declare-fun b!1326571 () Bool)

(assert (=> b!1326571 (= e!756077 (isDefined!523 (getValueByKey!716 (toList!10647 lt!589986) k0!1164)))))

(assert (= (and d!142983 c!125744) b!1326569))

(assert (= (and d!142983 (not c!125744)) b!1326570))

(assert (= (and d!142983 (not res!880456)) b!1326571))

(declare-fun m!1215267 () Bool)

(assert (=> d!142983 m!1215267))

(declare-fun m!1215269 () Bool)

(assert (=> b!1326569 m!1215269))

(declare-fun m!1215271 () Bool)

(assert (=> b!1326569 m!1215271))

(assert (=> b!1326569 m!1215271))

(declare-fun m!1215273 () Bool)

(assert (=> b!1326569 m!1215273))

(assert (=> b!1326571 m!1215271))

(assert (=> b!1326571 m!1215271))

(assert (=> b!1326571 m!1215273))

(assert (=> b!1326477 d!142983))

(declare-fun d!142985 () Bool)

(declare-fun e!756080 () Bool)

(assert (=> d!142985 e!756080))

(declare-fun res!880462 () Bool)

(assert (=> d!142985 (=> (not res!880462) (not e!756080))))

(declare-fun lt!590094 () ListLongMap!21263)

(assert (=> d!142985 (= res!880462 (contains!8731 lt!590094 (_1!11814 (tuple2!23607 (select (arr!43242 _keys!1609) from!2000) lt!589985))))))

(declare-fun lt!590093 () List!30733)

(assert (=> d!142985 (= lt!590094 (ListLongMap!21264 lt!590093))))

(declare-fun lt!590091 () Unit!43499)

(declare-fun lt!590092 () Unit!43499)

(assert (=> d!142985 (= lt!590091 lt!590092)))

(assert (=> d!142985 (= (getValueByKey!716 lt!590093 (_1!11814 (tuple2!23607 (select (arr!43242 _keys!1609) from!2000) lt!589985))) (Some!766 (_2!11814 (tuple2!23607 (select (arr!43242 _keys!1609) from!2000) lt!589985))))))

(declare-fun lemmaContainsTupThenGetReturnValue!359 (List!30733 (_ BitVec 64) V!53569) Unit!43499)

(assert (=> d!142985 (= lt!590092 (lemmaContainsTupThenGetReturnValue!359 lt!590093 (_1!11814 (tuple2!23607 (select (arr!43242 _keys!1609) from!2000) lt!589985)) (_2!11814 (tuple2!23607 (select (arr!43242 _keys!1609) from!2000) lt!589985))))))

(declare-fun insertStrictlySorted!488 (List!30733 (_ BitVec 64) V!53569) List!30733)

(assert (=> d!142985 (= lt!590093 (insertStrictlySorted!488 (toList!10647 lt!589992) (_1!11814 (tuple2!23607 (select (arr!43242 _keys!1609) from!2000) lt!589985)) (_2!11814 (tuple2!23607 (select (arr!43242 _keys!1609) from!2000) lt!589985))))))

(assert (=> d!142985 (= (+!4653 lt!589992 (tuple2!23607 (select (arr!43242 _keys!1609) from!2000) lt!589985)) lt!590094)))

(declare-fun b!1326576 () Bool)

(declare-fun res!880461 () Bool)

(assert (=> b!1326576 (=> (not res!880461) (not e!756080))))

(assert (=> b!1326576 (= res!880461 (= (getValueByKey!716 (toList!10647 lt!590094) (_1!11814 (tuple2!23607 (select (arr!43242 _keys!1609) from!2000) lt!589985))) (Some!766 (_2!11814 (tuple2!23607 (select (arr!43242 _keys!1609) from!2000) lt!589985)))))))

(declare-fun b!1326577 () Bool)

(declare-fun contains!8734 (List!30733 tuple2!23606) Bool)

(assert (=> b!1326577 (= e!756080 (contains!8734 (toList!10647 lt!590094) (tuple2!23607 (select (arr!43242 _keys!1609) from!2000) lt!589985)))))

(assert (= (and d!142985 res!880462) b!1326576))

(assert (= (and b!1326576 res!880461) b!1326577))

(declare-fun m!1215275 () Bool)

(assert (=> d!142985 m!1215275))

(declare-fun m!1215277 () Bool)

(assert (=> d!142985 m!1215277))

(declare-fun m!1215279 () Bool)

(assert (=> d!142985 m!1215279))

(declare-fun m!1215281 () Bool)

(assert (=> d!142985 m!1215281))

(declare-fun m!1215283 () Bool)

(assert (=> b!1326576 m!1215283))

(declare-fun m!1215285 () Bool)

(assert (=> b!1326577 m!1215285))

(assert (=> b!1326477 d!142985))

(declare-fun d!142987 () Bool)

(assert (=> d!142987 (contains!8731 lt!589992 k0!1164)))

(declare-fun lt!590095 () Unit!43499)

(assert (=> d!142987 (= lt!590095 (choose!1959 k0!1164 (select (arr!43242 _keys!1609) from!2000) lt!589985 lt!589992))))

(assert (=> d!142987 (contains!8731 (+!4653 lt!589992 (tuple2!23607 (select (arr!43242 _keys!1609) from!2000) lt!589985)) k0!1164)))

(assert (=> d!142987 (= (lemmaInListMapAfterAddingDiffThenInBefore!215 k0!1164 (select (arr!43242 _keys!1609) from!2000) lt!589985 lt!589992) lt!590095)))

(declare-fun bs!37921 () Bool)

(assert (= bs!37921 d!142987))

(assert (=> bs!37921 m!1215093))

(assert (=> bs!37921 m!1215059))

(declare-fun m!1215287 () Bool)

(assert (=> bs!37921 m!1215287))

(assert (=> bs!37921 m!1215079))

(assert (=> bs!37921 m!1215079))

(declare-fun m!1215289 () Bool)

(assert (=> bs!37921 m!1215289))

(assert (=> b!1326477 d!142987))

(declare-fun d!142989 () Bool)

(declare-fun e!756082 () Bool)

(assert (=> d!142989 e!756082))

(declare-fun res!880463 () Bool)

(assert (=> d!142989 (=> res!880463 e!756082)))

(declare-fun lt!590096 () Bool)

(assert (=> d!142989 (= res!880463 (not lt!590096))))

(declare-fun lt!590097 () Bool)

(assert (=> d!142989 (= lt!590096 lt!590097)))

(declare-fun lt!590099 () Unit!43499)

(declare-fun e!756081 () Unit!43499)

(assert (=> d!142989 (= lt!590099 e!756081)))

(declare-fun c!125745 () Bool)

(assert (=> d!142989 (= c!125745 lt!590097)))

(assert (=> d!142989 (= lt!590097 (containsKey!733 (toList!10647 lt!589982) k0!1164))))

(assert (=> d!142989 (= (contains!8731 lt!589982 k0!1164) lt!590096)))

(declare-fun b!1326578 () Bool)

(declare-fun lt!590098 () Unit!43499)

(assert (=> b!1326578 (= e!756081 lt!590098)))

(assert (=> b!1326578 (= lt!590098 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10647 lt!589982) k0!1164))))

(assert (=> b!1326578 (isDefined!523 (getValueByKey!716 (toList!10647 lt!589982) k0!1164))))

(declare-fun b!1326579 () Bool)

(declare-fun Unit!43506 () Unit!43499)

(assert (=> b!1326579 (= e!756081 Unit!43506)))

(declare-fun b!1326580 () Bool)

(assert (=> b!1326580 (= e!756082 (isDefined!523 (getValueByKey!716 (toList!10647 lt!589982) k0!1164)))))

(assert (= (and d!142989 c!125745) b!1326578))

(assert (= (and d!142989 (not c!125745)) b!1326579))

(assert (= (and d!142989 (not res!880463)) b!1326580))

(declare-fun m!1215291 () Bool)

(assert (=> d!142989 m!1215291))

(declare-fun m!1215293 () Bool)

(assert (=> b!1326578 m!1215293))

(declare-fun m!1215295 () Bool)

(assert (=> b!1326578 m!1215295))

(assert (=> b!1326578 m!1215295))

(declare-fun m!1215297 () Bool)

(assert (=> b!1326578 m!1215297))

(assert (=> b!1326580 m!1215295))

(assert (=> b!1326580 m!1215295))

(assert (=> b!1326580 m!1215297))

(assert (=> b!1326477 d!142989))

(declare-fun d!142991 () Bool)

(declare-fun e!756084 () Bool)

(assert (=> d!142991 e!756084))

(declare-fun res!880464 () Bool)

(assert (=> d!142991 (=> res!880464 e!756084)))

(declare-fun lt!590100 () Bool)

(assert (=> d!142991 (= res!880464 (not lt!590100))))

(declare-fun lt!590101 () Bool)

(assert (=> d!142991 (= lt!590100 lt!590101)))

(declare-fun lt!590103 () Unit!43499)

(declare-fun e!756083 () Unit!43499)

(assert (=> d!142991 (= lt!590103 e!756083)))

(declare-fun c!125746 () Bool)

(assert (=> d!142991 (= c!125746 lt!590101)))

(assert (=> d!142991 (= lt!590101 (containsKey!733 (toList!10647 lt!589992) k0!1164))))

(assert (=> d!142991 (= (contains!8731 lt!589992 k0!1164) lt!590100)))

(declare-fun b!1326581 () Bool)

(declare-fun lt!590102 () Unit!43499)

(assert (=> b!1326581 (= e!756083 lt!590102)))

(assert (=> b!1326581 (= lt!590102 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10647 lt!589992) k0!1164))))

(assert (=> b!1326581 (isDefined!523 (getValueByKey!716 (toList!10647 lt!589992) k0!1164))))

(declare-fun b!1326582 () Bool)

(declare-fun Unit!43507 () Unit!43499)

(assert (=> b!1326582 (= e!756083 Unit!43507)))

(declare-fun b!1326583 () Bool)

(assert (=> b!1326583 (= e!756084 (isDefined!523 (getValueByKey!716 (toList!10647 lt!589992) k0!1164)))))

(assert (= (and d!142991 c!125746) b!1326581))

(assert (= (and d!142991 (not c!125746)) b!1326582))

(assert (= (and d!142991 (not res!880464)) b!1326583))

(declare-fun m!1215299 () Bool)

(assert (=> d!142991 m!1215299))

(declare-fun m!1215301 () Bool)

(assert (=> b!1326581 m!1215301))

(declare-fun m!1215303 () Bool)

(assert (=> b!1326581 m!1215303))

(assert (=> b!1326581 m!1215303))

(declare-fun m!1215305 () Bool)

(assert (=> b!1326581 m!1215305))

(assert (=> b!1326583 m!1215303))

(assert (=> b!1326583 m!1215303))

(assert (=> b!1326583 m!1215305))

(assert (=> b!1326477 d!142991))

(declare-fun d!142993 () Bool)

(assert (=> d!142993 (contains!8731 (+!4653 lt!589992 (tuple2!23607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) k0!1164)))

(declare-fun lt!590106 () Unit!43499)

(declare-fun choose!1960 (ListLongMap!21263 (_ BitVec 64) V!53569 (_ BitVec 64)) Unit!43499)

(assert (=> d!142993 (= lt!590106 (choose!1960 lt!589992 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> d!142993 (contains!8731 lt!589992 k0!1164)))

(assert (=> d!142993 (= (addStillContains!1157 lt!589992 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164) lt!590106)))

(declare-fun bs!37922 () Bool)

(assert (= bs!37922 d!142993))

(declare-fun m!1215307 () Bool)

(assert (=> bs!37922 m!1215307))

(assert (=> bs!37922 m!1215307))

(declare-fun m!1215309 () Bool)

(assert (=> bs!37922 m!1215309))

(declare-fun m!1215311 () Bool)

(assert (=> bs!37922 m!1215311))

(assert (=> bs!37922 m!1215093))

(assert (=> b!1326477 d!142993))

(declare-fun d!142995 () Bool)

(declare-fun e!756115 () Bool)

(assert (=> d!142995 e!756115))

(declare-fun res!880485 () Bool)

(assert (=> d!142995 (=> (not res!880485) (not e!756115))))

(assert (=> d!142995 (= res!880485 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43794 _keys!1609)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43794 _keys!1609)))))))

(declare-fun lt!590171 () ListLongMap!21263)

(declare-fun lt!590164 () ListLongMap!21263)

(assert (=> d!142995 (= lt!590171 lt!590164)))

(declare-fun lt!590159 () Unit!43499)

(declare-fun e!756118 () Unit!43499)

(assert (=> d!142995 (= lt!590159 e!756118)))

(declare-fun c!125762 () Bool)

(declare-fun e!756123 () Bool)

(assert (=> d!142995 (= c!125762 e!756123)))

(declare-fun res!880484 () Bool)

(assert (=> d!142995 (=> (not res!880484) (not e!756123))))

(assert (=> d!142995 (= res!880484 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43794 _keys!1609)))))

(declare-fun e!756119 () ListLongMap!21263)

(assert (=> d!142995 (= lt!590164 e!756119)))

(declare-fun c!125761 () Bool)

(assert (=> d!142995 (= c!125761 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142995 (validMask!0 mask!2019)))

(assert (=> d!142995 (= (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!590171)))

(declare-fun bm!64726 () Bool)

(declare-fun call!64733 () Bool)

(assert (=> bm!64726 (= call!64733 (contains!8731 lt!590171 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326627 () Bool)

(declare-fun e!756121 () Bool)

(declare-fun e!756111 () Bool)

(assert (=> b!1326627 (= e!756121 e!756111)))

(declare-fun res!880487 () Bool)

(declare-fun call!64734 () Bool)

(assert (=> b!1326627 (= res!880487 call!64734)))

(assert (=> b!1326627 (=> (not res!880487) (not e!756111))))

(declare-fun b!1326628 () Bool)

(declare-fun e!756116 () Bool)

(declare-fun apply!1023 (ListLongMap!21263 (_ BitVec 64)) V!53569)

(assert (=> b!1326628 (= e!756116 (= (apply!1023 lt!590171 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun b!1326629 () Bool)

(declare-fun e!756114 () Bool)

(assert (=> b!1326629 (= e!756115 e!756114)))

(declare-fun c!125760 () Bool)

(assert (=> b!1326629 (= c!125760 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1326630 () Bool)

(declare-fun call!64730 () ListLongMap!21263)

(assert (=> b!1326630 (= e!756119 (+!4653 call!64730 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun b!1326631 () Bool)

(declare-fun Unit!43508 () Unit!43499)

(assert (=> b!1326631 (= e!756118 Unit!43508)))

(declare-fun b!1326632 () Bool)

(declare-fun e!756112 () ListLongMap!21263)

(declare-fun call!64731 () ListLongMap!21263)

(assert (=> b!1326632 (= e!756112 call!64731)))

(declare-fun bm!64727 () Bool)

(declare-fun call!64732 () ListLongMap!21263)

(assert (=> bm!64727 (= call!64732 call!64730)))

(declare-fun bm!64728 () Bool)

(assert (=> bm!64728 (= call!64734 (contains!8731 lt!590171 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326633 () Bool)

(declare-fun c!125764 () Bool)

(assert (=> b!1326633 (= c!125764 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!756120 () ListLongMap!21263)

(assert (=> b!1326633 (= e!756120 e!756112)))

(declare-fun b!1326634 () Bool)

(assert (=> b!1326634 (= e!756114 (not call!64733))))

(declare-fun b!1326635 () Bool)

(declare-fun e!756117 () Bool)

(assert (=> b!1326635 (= e!756117 (validKeyInArray!0 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun call!64729 () ListLongMap!21263)

(declare-fun bm!64729 () Bool)

(assert (=> bm!64729 (= call!64729 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1326636 () Bool)

(declare-fun res!880488 () Bool)

(assert (=> b!1326636 (=> (not res!880488) (not e!756115))))

(declare-fun e!756113 () Bool)

(assert (=> b!1326636 (= res!880488 e!756113)))

(declare-fun res!880491 () Bool)

(assert (=> b!1326636 (=> res!880491 e!756113)))

(assert (=> b!1326636 (= res!880491 (not e!756117))))

(declare-fun res!880489 () Bool)

(assert (=> b!1326636 (=> (not res!880489) (not e!756117))))

(assert (=> b!1326636 (= res!880489 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43794 _keys!1609)))))

(declare-fun call!64735 () ListLongMap!21263)

(declare-fun c!125763 () Bool)

(declare-fun bm!64730 () Bool)

(assert (=> bm!64730 (= call!64730 (+!4653 (ite c!125761 call!64729 (ite c!125763 call!64735 call!64731)) (ite (or c!125761 c!125763) (tuple2!23607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1326637 () Bool)

(assert (=> b!1326637 (= e!756114 e!756116)))

(declare-fun res!880490 () Bool)

(assert (=> b!1326637 (= res!880490 call!64733)))

(assert (=> b!1326637 (=> (not res!880490) (not e!756116))))

(declare-fun b!1326638 () Bool)

(assert (=> b!1326638 (= e!756123 (validKeyInArray!0 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1326639 () Bool)

(assert (=> b!1326639 (= e!756112 call!64732)))

(declare-fun b!1326640 () Bool)

(assert (=> b!1326640 (= e!756111 (= (apply!1023 lt!590171 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun b!1326641 () Bool)

(declare-fun e!756122 () Bool)

(assert (=> b!1326641 (= e!756113 e!756122)))

(declare-fun res!880483 () Bool)

(assert (=> b!1326641 (=> (not res!880483) (not e!756122))))

(assert (=> b!1326641 (= res!880483 (contains!8731 lt!590171 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1326641 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43794 _keys!1609)))))

(declare-fun b!1326642 () Bool)

(assert (=> b!1326642 (= e!756121 (not call!64734))))

(declare-fun b!1326643 () Bool)

(declare-fun lt!590168 () Unit!43499)

(assert (=> b!1326643 (= e!756118 lt!590168)))

(declare-fun lt!590166 () ListLongMap!21263)

(assert (=> b!1326643 (= lt!590166 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590157 () (_ BitVec 64))

(assert (=> b!1326643 (= lt!590157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590156 () (_ BitVec 64))

(assert (=> b!1326643 (= lt!590156 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590161 () Unit!43499)

(assert (=> b!1326643 (= lt!590161 (addStillContains!1157 lt!590166 lt!590157 zeroValue!1279 lt!590156))))

(assert (=> b!1326643 (contains!8731 (+!4653 lt!590166 (tuple2!23607 lt!590157 zeroValue!1279)) lt!590156)))

(declare-fun lt!590155 () Unit!43499)

(assert (=> b!1326643 (= lt!590155 lt!590161)))

(declare-fun lt!590170 () ListLongMap!21263)

(assert (=> b!1326643 (= lt!590170 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590163 () (_ BitVec 64))

(assert (=> b!1326643 (= lt!590163 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590151 () (_ BitVec 64))

(assert (=> b!1326643 (= lt!590151 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590154 () Unit!43499)

(declare-fun addApplyDifferent!561 (ListLongMap!21263 (_ BitVec 64) V!53569 (_ BitVec 64)) Unit!43499)

(assert (=> b!1326643 (= lt!590154 (addApplyDifferent!561 lt!590170 lt!590163 minValue!1279 lt!590151))))

(assert (=> b!1326643 (= (apply!1023 (+!4653 lt!590170 (tuple2!23607 lt!590163 minValue!1279)) lt!590151) (apply!1023 lt!590170 lt!590151))))

(declare-fun lt!590158 () Unit!43499)

(assert (=> b!1326643 (= lt!590158 lt!590154)))

(declare-fun lt!590165 () ListLongMap!21263)

(assert (=> b!1326643 (= lt!590165 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590162 () (_ BitVec 64))

(assert (=> b!1326643 (= lt!590162 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590152 () (_ BitVec 64))

(assert (=> b!1326643 (= lt!590152 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590153 () Unit!43499)

(assert (=> b!1326643 (= lt!590153 (addApplyDifferent!561 lt!590165 lt!590162 zeroValue!1279 lt!590152))))

(assert (=> b!1326643 (= (apply!1023 (+!4653 lt!590165 (tuple2!23607 lt!590162 zeroValue!1279)) lt!590152) (apply!1023 lt!590165 lt!590152))))

(declare-fun lt!590160 () Unit!43499)

(assert (=> b!1326643 (= lt!590160 lt!590153)))

(declare-fun lt!590169 () ListLongMap!21263)

(assert (=> b!1326643 (= lt!590169 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590172 () (_ BitVec 64))

(assert (=> b!1326643 (= lt!590172 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590167 () (_ BitVec 64))

(assert (=> b!1326643 (= lt!590167 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(assert (=> b!1326643 (= lt!590168 (addApplyDifferent!561 lt!590169 lt!590172 minValue!1279 lt!590167))))

(assert (=> b!1326643 (= (apply!1023 (+!4653 lt!590169 (tuple2!23607 lt!590172 minValue!1279)) lt!590167) (apply!1023 lt!590169 lt!590167))))

(declare-fun bm!64731 () Bool)

(assert (=> bm!64731 (= call!64735 call!64729)))

(declare-fun b!1326644 () Bool)

(assert (=> b!1326644 (= e!756122 (= (apply!1023 lt!590171 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21791 (select (arr!43243 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3583 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326644 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43795 _values!1337)))))

(assert (=> b!1326644 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43794 _keys!1609)))))

(declare-fun b!1326645 () Bool)

(assert (=> b!1326645 (= e!756120 call!64732)))

(declare-fun b!1326646 () Bool)

(assert (=> b!1326646 (= e!756119 e!756120)))

(assert (=> b!1326646 (= c!125763 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64732 () Bool)

(assert (=> bm!64732 (= call!64731 call!64735)))

(declare-fun b!1326647 () Bool)

(declare-fun res!880486 () Bool)

(assert (=> b!1326647 (=> (not res!880486) (not e!756115))))

(assert (=> b!1326647 (= res!880486 e!756121)))

(declare-fun c!125759 () Bool)

(assert (=> b!1326647 (= c!125759 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!142995 c!125761) b!1326630))

(assert (= (and d!142995 (not c!125761)) b!1326646))

(assert (= (and b!1326646 c!125763) b!1326645))

(assert (= (and b!1326646 (not c!125763)) b!1326633))

(assert (= (and b!1326633 c!125764) b!1326639))

(assert (= (and b!1326633 (not c!125764)) b!1326632))

(assert (= (or b!1326639 b!1326632) bm!64732))

(assert (= (or b!1326645 bm!64732) bm!64731))

(assert (= (or b!1326645 b!1326639) bm!64727))

(assert (= (or b!1326630 bm!64731) bm!64729))

(assert (= (or b!1326630 bm!64727) bm!64730))

(assert (= (and d!142995 res!880484) b!1326638))

(assert (= (and d!142995 c!125762) b!1326643))

(assert (= (and d!142995 (not c!125762)) b!1326631))

(assert (= (and d!142995 res!880485) b!1326636))

(assert (= (and b!1326636 res!880489) b!1326635))

(assert (= (and b!1326636 (not res!880491)) b!1326641))

(assert (= (and b!1326641 res!880483) b!1326644))

(assert (= (and b!1326636 res!880488) b!1326647))

(assert (= (and b!1326647 c!125759) b!1326627))

(assert (= (and b!1326647 (not c!125759)) b!1326642))

(assert (= (and b!1326627 res!880487) b!1326640))

(assert (= (or b!1326627 b!1326642) bm!64728))

(assert (= (and b!1326647 res!880486) b!1326629))

(assert (= (and b!1326629 c!125760) b!1326637))

(assert (= (and b!1326629 (not c!125760)) b!1326634))

(assert (= (and b!1326637 res!880490) b!1326628))

(assert (= (or b!1326637 b!1326634) bm!64726))

(declare-fun b_lambda!23805 () Bool)

(assert (=> (not b_lambda!23805) (not b!1326644)))

(assert (=> b!1326644 t!44724))

(declare-fun b_and!49147 () Bool)

(assert (= b_and!49137 (and (=> t!44724 result!24655) b_and!49147)))

(declare-fun m!1215313 () Bool)

(assert (=> bm!64728 m!1215313))

(declare-fun m!1215315 () Bool)

(assert (=> b!1326641 m!1215315))

(assert (=> b!1326641 m!1215315))

(declare-fun m!1215317 () Bool)

(assert (=> b!1326641 m!1215317))

(assert (=> b!1326638 m!1215315))

(assert (=> b!1326638 m!1215315))

(declare-fun m!1215319 () Bool)

(assert (=> b!1326638 m!1215319))

(assert (=> bm!64729 m!1215091))

(assert (=> b!1326635 m!1215315))

(assert (=> b!1326635 m!1215315))

(assert (=> b!1326635 m!1215319))

(assert (=> d!142995 m!1215109))

(declare-fun m!1215321 () Bool)

(assert (=> b!1326640 m!1215321))

(declare-fun m!1215323 () Bool)

(assert (=> b!1326644 m!1215323))

(assert (=> b!1326644 m!1215073))

(declare-fun m!1215325 () Bool)

(assert (=> b!1326644 m!1215325))

(assert (=> b!1326644 m!1215315))

(declare-fun m!1215327 () Bool)

(assert (=> b!1326644 m!1215327))

(assert (=> b!1326644 m!1215323))

(assert (=> b!1326644 m!1215315))

(assert (=> b!1326644 m!1215073))

(declare-fun m!1215329 () Bool)

(assert (=> b!1326628 m!1215329))

(declare-fun m!1215331 () Bool)

(assert (=> bm!64726 m!1215331))

(declare-fun m!1215333 () Bool)

(assert (=> bm!64730 m!1215333))

(declare-fun m!1215335 () Bool)

(assert (=> b!1326643 m!1215335))

(declare-fun m!1215337 () Bool)

(assert (=> b!1326643 m!1215337))

(declare-fun m!1215339 () Bool)

(assert (=> b!1326643 m!1215339))

(declare-fun m!1215341 () Bool)

(assert (=> b!1326643 m!1215341))

(declare-fun m!1215343 () Bool)

(assert (=> b!1326643 m!1215343))

(declare-fun m!1215345 () Bool)

(assert (=> b!1326643 m!1215345))

(declare-fun m!1215347 () Bool)

(assert (=> b!1326643 m!1215347))

(assert (=> b!1326643 m!1215341))

(declare-fun m!1215349 () Bool)

(assert (=> b!1326643 m!1215349))

(declare-fun m!1215351 () Bool)

(assert (=> b!1326643 m!1215351))

(declare-fun m!1215353 () Bool)

(assert (=> b!1326643 m!1215353))

(assert (=> b!1326643 m!1215337))

(declare-fun m!1215355 () Bool)

(assert (=> b!1326643 m!1215355))

(declare-fun m!1215357 () Bool)

(assert (=> b!1326643 m!1215357))

(assert (=> b!1326643 m!1215355))

(declare-fun m!1215359 () Bool)

(assert (=> b!1326643 m!1215359))

(assert (=> b!1326643 m!1215351))

(assert (=> b!1326643 m!1215315))

(declare-fun m!1215361 () Bool)

(assert (=> b!1326643 m!1215361))

(declare-fun m!1215363 () Bool)

(assert (=> b!1326643 m!1215363))

(assert (=> b!1326643 m!1215091))

(declare-fun m!1215365 () Bool)

(assert (=> b!1326630 m!1215365))

(assert (=> b!1326477 d!142995))

(declare-fun d!142997 () Bool)

(declare-fun e!756124 () Bool)

(assert (=> d!142997 e!756124))

(declare-fun res!880493 () Bool)

(assert (=> d!142997 (=> (not res!880493) (not e!756124))))

(declare-fun lt!590176 () ListLongMap!21263)

(assert (=> d!142997 (= res!880493 (contains!8731 lt!590176 (_1!11814 lt!589989)))))

(declare-fun lt!590175 () List!30733)

(assert (=> d!142997 (= lt!590176 (ListLongMap!21264 lt!590175))))

(declare-fun lt!590173 () Unit!43499)

(declare-fun lt!590174 () Unit!43499)

(assert (=> d!142997 (= lt!590173 lt!590174)))

(assert (=> d!142997 (= (getValueByKey!716 lt!590175 (_1!11814 lt!589989)) (Some!766 (_2!11814 lt!589989)))))

(assert (=> d!142997 (= lt!590174 (lemmaContainsTupThenGetReturnValue!359 lt!590175 (_1!11814 lt!589989) (_2!11814 lt!589989)))))

(assert (=> d!142997 (= lt!590175 (insertStrictlySorted!488 (toList!10647 lt!589992) (_1!11814 lt!589989) (_2!11814 lt!589989)))))

(assert (=> d!142997 (= (+!4653 lt!589992 lt!589989) lt!590176)))

(declare-fun b!1326648 () Bool)

(declare-fun res!880492 () Bool)

(assert (=> b!1326648 (=> (not res!880492) (not e!756124))))

(assert (=> b!1326648 (= res!880492 (= (getValueByKey!716 (toList!10647 lt!590176) (_1!11814 lt!589989)) (Some!766 (_2!11814 lt!589989))))))

(declare-fun b!1326649 () Bool)

(assert (=> b!1326649 (= e!756124 (contains!8734 (toList!10647 lt!590176) lt!589989))))

(assert (= (and d!142997 res!880493) b!1326648))

(assert (= (and b!1326648 res!880492) b!1326649))

(declare-fun m!1215367 () Bool)

(assert (=> d!142997 m!1215367))

(declare-fun m!1215369 () Bool)

(assert (=> d!142997 m!1215369))

(declare-fun m!1215371 () Bool)

(assert (=> d!142997 m!1215371))

(declare-fun m!1215373 () Bool)

(assert (=> d!142997 m!1215373))

(declare-fun m!1215375 () Bool)

(assert (=> b!1326648 m!1215375))

(declare-fun m!1215377 () Bool)

(assert (=> b!1326649 m!1215377))

(assert (=> b!1326477 d!142997))

(declare-fun d!142999 () Bool)

(declare-fun e!756125 () Bool)

(assert (=> d!142999 e!756125))

(declare-fun res!880495 () Bool)

(assert (=> d!142999 (=> (not res!880495) (not e!756125))))

(declare-fun lt!590180 () ListLongMap!21263)

(assert (=> d!142999 (= res!880495 (contains!8731 lt!590180 (_1!11814 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!590179 () List!30733)

(assert (=> d!142999 (= lt!590180 (ListLongMap!21264 lt!590179))))

(declare-fun lt!590177 () Unit!43499)

(declare-fun lt!590178 () Unit!43499)

(assert (=> d!142999 (= lt!590177 lt!590178)))

(assert (=> d!142999 (= (getValueByKey!716 lt!590179 (_1!11814 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!766 (_2!11814 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142999 (= lt!590178 (lemmaContainsTupThenGetReturnValue!359 lt!590179 (_1!11814 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11814 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142999 (= lt!590179 (insertStrictlySorted!488 (toList!10647 lt!589986) (_1!11814 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11814 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142999 (= (+!4653 lt!589986 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!590180)))

(declare-fun b!1326650 () Bool)

(declare-fun res!880494 () Bool)

(assert (=> b!1326650 (=> (not res!880494) (not e!756125))))

(assert (=> b!1326650 (= res!880494 (= (getValueByKey!716 (toList!10647 lt!590180) (_1!11814 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!766 (_2!11814 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1326651 () Bool)

(assert (=> b!1326651 (= e!756125 (contains!8734 (toList!10647 lt!590180) (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!142999 res!880495) b!1326650))

(assert (= (and b!1326650 res!880494) b!1326651))

(declare-fun m!1215379 () Bool)

(assert (=> d!142999 m!1215379))

(declare-fun m!1215381 () Bool)

(assert (=> d!142999 m!1215381))

(declare-fun m!1215383 () Bool)

(assert (=> d!142999 m!1215383))

(declare-fun m!1215385 () Bool)

(assert (=> d!142999 m!1215385))

(declare-fun m!1215387 () Bool)

(assert (=> b!1326650 m!1215387))

(declare-fun m!1215389 () Bool)

(assert (=> b!1326651 m!1215389))

(assert (=> b!1326477 d!142999))

(declare-fun d!143001 () Bool)

(assert (=> d!143001 (contains!8731 (+!4653 lt!589986 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-fun lt!590181 () Unit!43499)

(assert (=> d!143001 (= lt!590181 (choose!1960 lt!589986 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> d!143001 (contains!8731 lt!589986 k0!1164)))

(assert (=> d!143001 (= (addStillContains!1157 lt!589986 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164) lt!590181)))

(declare-fun bs!37923 () Bool)

(assert (= bs!37923 d!143001))

(assert (=> bs!37923 m!1215065))

(assert (=> bs!37923 m!1215065))

(assert (=> bs!37923 m!1215067))

(declare-fun m!1215391 () Bool)

(assert (=> bs!37923 m!1215391))

(assert (=> bs!37923 m!1215089))

(assert (=> b!1326477 d!143001))

(declare-fun d!143003 () Bool)

(declare-fun e!756126 () Bool)

(assert (=> d!143003 e!756126))

(declare-fun res!880497 () Bool)

(assert (=> d!143003 (=> (not res!880497) (not e!756126))))

(declare-fun lt!590185 () ListLongMap!21263)

(assert (=> d!143003 (= res!880497 (contains!8731 lt!590185 (_1!11814 lt!589989)))))

(declare-fun lt!590184 () List!30733)

(assert (=> d!143003 (= lt!590185 (ListLongMap!21264 lt!590184))))

(declare-fun lt!590182 () Unit!43499)

(declare-fun lt!590183 () Unit!43499)

(assert (=> d!143003 (= lt!590182 lt!590183)))

(assert (=> d!143003 (= (getValueByKey!716 lt!590184 (_1!11814 lt!589989)) (Some!766 (_2!11814 lt!589989)))))

(assert (=> d!143003 (= lt!590183 (lemmaContainsTupThenGetReturnValue!359 lt!590184 (_1!11814 lt!589989) (_2!11814 lt!589989)))))

(assert (=> d!143003 (= lt!590184 (insertStrictlySorted!488 (toList!10647 lt!589982) (_1!11814 lt!589989) (_2!11814 lt!589989)))))

(assert (=> d!143003 (= (+!4653 lt!589982 lt!589989) lt!590185)))

(declare-fun b!1326652 () Bool)

(declare-fun res!880496 () Bool)

(assert (=> b!1326652 (=> (not res!880496) (not e!756126))))

(assert (=> b!1326652 (= res!880496 (= (getValueByKey!716 (toList!10647 lt!590185) (_1!11814 lt!589989)) (Some!766 (_2!11814 lt!589989))))))

(declare-fun b!1326653 () Bool)

(assert (=> b!1326653 (= e!756126 (contains!8734 (toList!10647 lt!590185) lt!589989))))

(assert (= (and d!143003 res!880497) b!1326652))

(assert (= (and b!1326652 res!880496) b!1326653))

(declare-fun m!1215393 () Bool)

(assert (=> d!143003 m!1215393))

(declare-fun m!1215395 () Bool)

(assert (=> d!143003 m!1215395))

(declare-fun m!1215397 () Bool)

(assert (=> d!143003 m!1215397))

(declare-fun m!1215399 () Bool)

(assert (=> d!143003 m!1215399))

(declare-fun m!1215401 () Bool)

(assert (=> b!1326652 m!1215401))

(declare-fun m!1215403 () Bool)

(assert (=> b!1326653 m!1215403))

(assert (=> b!1326477 d!143003))

(declare-fun d!143005 () Bool)

(declare-fun e!756128 () Bool)

(assert (=> d!143005 e!756128))

(declare-fun res!880498 () Bool)

(assert (=> d!143005 (=> res!880498 e!756128)))

(declare-fun lt!590186 () Bool)

(assert (=> d!143005 (= res!880498 (not lt!590186))))

(declare-fun lt!590187 () Bool)

(assert (=> d!143005 (= lt!590186 lt!590187)))

(declare-fun lt!590189 () Unit!43499)

(declare-fun e!756127 () Unit!43499)

(assert (=> d!143005 (= lt!590189 e!756127)))

(declare-fun c!125765 () Bool)

(assert (=> d!143005 (= c!125765 lt!590187)))

(assert (=> d!143005 (= lt!590187 (containsKey!733 (toList!10647 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (=> d!143005 (= (contains!8731 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k0!1164) lt!590186)))

(declare-fun b!1326654 () Bool)

(declare-fun lt!590188 () Unit!43499)

(assert (=> b!1326654 (= e!756127 lt!590188)))

(assert (=> b!1326654 (= lt!590188 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10647 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (=> b!1326654 (isDefined!523 (getValueByKey!716 (toList!10647 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(declare-fun b!1326655 () Bool)

(declare-fun Unit!43509 () Unit!43499)

(assert (=> b!1326655 (= e!756127 Unit!43509)))

(declare-fun b!1326656 () Bool)

(assert (=> b!1326656 (= e!756128 (isDefined!523 (getValueByKey!716 (toList!10647 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164)))))

(assert (= (and d!143005 c!125765) b!1326654))

(assert (= (and d!143005 (not c!125765)) b!1326655))

(assert (= (and d!143005 (not res!880498)) b!1326656))

(declare-fun m!1215405 () Bool)

(assert (=> d!143005 m!1215405))

(declare-fun m!1215407 () Bool)

(assert (=> b!1326654 m!1215407))

(declare-fun m!1215409 () Bool)

(assert (=> b!1326654 m!1215409))

(assert (=> b!1326654 m!1215409))

(declare-fun m!1215411 () Bool)

(assert (=> b!1326654 m!1215411))

(assert (=> b!1326656 m!1215409))

(assert (=> b!1326656 m!1215409))

(assert (=> b!1326656 m!1215411))

(assert (=> b!1326477 d!143005))

(declare-fun b!1326681 () Bool)

(declare-fun lt!590204 () Unit!43499)

(declare-fun lt!590206 () Unit!43499)

(assert (=> b!1326681 (= lt!590204 lt!590206)))

(declare-fun lt!590208 () V!53569)

(declare-fun lt!590210 () (_ BitVec 64))

(declare-fun lt!590209 () ListLongMap!21263)

(declare-fun lt!590205 () (_ BitVec 64))

(assert (=> b!1326681 (not (contains!8731 (+!4653 lt!590209 (tuple2!23607 lt!590205 lt!590208)) lt!590210))))

(declare-fun addStillNotContains!482 (ListLongMap!21263 (_ BitVec 64) V!53569 (_ BitVec 64)) Unit!43499)

(assert (=> b!1326681 (= lt!590206 (addStillNotContains!482 lt!590209 lt!590205 lt!590208 lt!590210))))

(assert (=> b!1326681 (= lt!590210 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1326681 (= lt!590208 (get!21791 (select (arr!43243 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3583 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1326681 (= lt!590205 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun call!64738 () ListLongMap!21263)

(assert (=> b!1326681 (= lt!590209 call!64738)))

(declare-fun e!756148 () ListLongMap!21263)

(assert (=> b!1326681 (= e!756148 (+!4653 call!64738 (tuple2!23607 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21791 (select (arr!43243 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3583 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1326682 () Bool)

(assert (=> b!1326682 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43794 _keys!1609)))))

(assert (=> b!1326682 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43795 _values!1337)))))

(declare-fun e!756145 () Bool)

(declare-fun lt!590207 () ListLongMap!21263)

(assert (=> b!1326682 (= e!756145 (= (apply!1023 lt!590207 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21791 (select (arr!43243 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3583 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!64735 () Bool)

(assert (=> bm!64735 (= call!64738 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1326683 () Bool)

(declare-fun e!756146 () Bool)

(assert (=> b!1326683 (= e!756146 e!756145)))

(assert (=> b!1326683 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43794 _keys!1609)))))

(declare-fun res!880508 () Bool)

(assert (=> b!1326683 (= res!880508 (contains!8731 lt!590207 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1326683 (=> (not res!880508) (not e!756145))))

(declare-fun b!1326684 () Bool)

(declare-fun e!756143 () Bool)

(assert (=> b!1326684 (= e!756143 e!756146)))

(declare-fun c!125777 () Bool)

(declare-fun e!756147 () Bool)

(assert (=> b!1326684 (= c!125777 e!756147)))

(declare-fun res!880509 () Bool)

(assert (=> b!1326684 (=> (not res!880509) (not e!756147))))

(assert (=> b!1326684 (= res!880509 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43794 _keys!1609)))))

(declare-fun b!1326685 () Bool)

(assert (=> b!1326685 (= e!756148 call!64738)))

(declare-fun b!1326686 () Bool)

(assert (=> b!1326686 (= e!756147 (validKeyInArray!0 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1326686 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))

(declare-fun b!1326687 () Bool)

(declare-fun e!756149 () Bool)

(declare-fun isEmpty!1084 (ListLongMap!21263) Bool)

(assert (=> b!1326687 (= e!756149 (isEmpty!1084 lt!590207))))

(declare-fun d!143007 () Bool)

(assert (=> d!143007 e!756143))

(declare-fun res!880507 () Bool)

(assert (=> d!143007 (=> (not res!880507) (not e!756143))))

(assert (=> d!143007 (= res!880507 (not (contains!8731 lt!590207 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!756144 () ListLongMap!21263)

(assert (=> d!143007 (= lt!590207 e!756144)))

(declare-fun c!125776 () Bool)

(assert (=> d!143007 (= c!125776 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43794 _keys!1609)))))

(assert (=> d!143007 (validMask!0 mask!2019)))

(assert (=> d!143007 (= (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!590207)))

(declare-fun b!1326688 () Bool)

(assert (=> b!1326688 (= e!756144 e!756148)))

(declare-fun c!125775 () Bool)

(assert (=> b!1326688 (= c!125775 (validKeyInArray!0 (select (arr!43242 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1326689 () Bool)

(assert (=> b!1326689 (= e!756149 (= lt!590207 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun b!1326690 () Bool)

(assert (=> b!1326690 (= e!756144 (ListLongMap!21264 Nil!30730))))

(declare-fun b!1326691 () Bool)

(declare-fun res!880510 () Bool)

(assert (=> b!1326691 (=> (not res!880510) (not e!756143))))

(assert (=> b!1326691 (= res!880510 (not (contains!8731 lt!590207 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1326692 () Bool)

(assert (=> b!1326692 (= e!756146 e!756149)))

(declare-fun c!125774 () Bool)

(assert (=> b!1326692 (= c!125774 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43794 _keys!1609)))))

(assert (= (and d!143007 c!125776) b!1326690))

(assert (= (and d!143007 (not c!125776)) b!1326688))

(assert (= (and b!1326688 c!125775) b!1326681))

(assert (= (and b!1326688 (not c!125775)) b!1326685))

(assert (= (or b!1326681 b!1326685) bm!64735))

(assert (= (and d!143007 res!880507) b!1326691))

(assert (= (and b!1326691 res!880510) b!1326684))

(assert (= (and b!1326684 res!880509) b!1326686))

(assert (= (and b!1326684 c!125777) b!1326683))

(assert (= (and b!1326684 (not c!125777)) b!1326692))

(assert (= (and b!1326683 res!880508) b!1326682))

(assert (= (and b!1326692 c!125774) b!1326689))

(assert (= (and b!1326692 (not c!125774)) b!1326687))

(declare-fun b_lambda!23807 () Bool)

(assert (=> (not b_lambda!23807) (not b!1326681)))

(assert (=> b!1326681 t!44724))

(declare-fun b_and!49149 () Bool)

(assert (= b_and!49147 (and (=> t!44724 result!24655) b_and!49149)))

(declare-fun b_lambda!23809 () Bool)

(assert (=> (not b_lambda!23809) (not b!1326682)))

(assert (=> b!1326682 t!44724))

(declare-fun b_and!49151 () Bool)

(assert (= b_and!49149 (and (=> t!44724 result!24655) b_and!49151)))

(declare-fun m!1215413 () Bool)

(assert (=> b!1326689 m!1215413))

(assert (=> bm!64735 m!1215413))

(assert (=> b!1326683 m!1215315))

(assert (=> b!1326683 m!1215315))

(declare-fun m!1215415 () Bool)

(assert (=> b!1326683 m!1215415))

(declare-fun m!1215417 () Bool)

(assert (=> b!1326687 m!1215417))

(assert (=> b!1326686 m!1215315))

(assert (=> b!1326686 m!1215315))

(assert (=> b!1326686 m!1215319))

(declare-fun m!1215419 () Bool)

(assert (=> b!1326681 m!1215419))

(assert (=> b!1326681 m!1215323))

(declare-fun m!1215421 () Bool)

(assert (=> b!1326681 m!1215421))

(assert (=> b!1326681 m!1215323))

(assert (=> b!1326681 m!1215073))

(assert (=> b!1326681 m!1215325))

(declare-fun m!1215423 () Bool)

(assert (=> b!1326681 m!1215423))

(assert (=> b!1326681 m!1215421))

(declare-fun m!1215425 () Bool)

(assert (=> b!1326681 m!1215425))

(assert (=> b!1326681 m!1215315))

(assert (=> b!1326681 m!1215073))

(declare-fun m!1215427 () Bool)

(assert (=> b!1326691 m!1215427))

(assert (=> b!1326682 m!1215323))

(assert (=> b!1326682 m!1215315))

(declare-fun m!1215429 () Bool)

(assert (=> b!1326682 m!1215429))

(assert (=> b!1326682 m!1215323))

(assert (=> b!1326682 m!1215073))

(assert (=> b!1326682 m!1215325))

(assert (=> b!1326682 m!1215315))

(assert (=> b!1326682 m!1215073))

(assert (=> b!1326688 m!1215315))

(assert (=> b!1326688 m!1215315))

(assert (=> b!1326688 m!1215319))

(declare-fun m!1215431 () Bool)

(assert (=> d!143007 m!1215431))

(assert (=> d!143007 m!1215109))

(assert (=> b!1326477 d!143007))

(declare-fun d!143009 () Bool)

(assert (=> d!143009 (= (validKeyInArray!0 (select (arr!43242 _keys!1609) from!2000)) (and (not (= (select (arr!43242 _keys!1609) from!2000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43242 _keys!1609) from!2000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326472 d!143009))

(declare-fun b!1326703 () Bool)

(declare-fun e!756160 () Bool)

(declare-fun call!64741 () Bool)

(assert (=> b!1326703 (= e!756160 call!64741)))

(declare-fun b!1326704 () Bool)

(declare-fun e!756159 () Bool)

(declare-fun e!756161 () Bool)

(assert (=> b!1326704 (= e!756159 e!756161)))

(declare-fun res!880518 () Bool)

(assert (=> b!1326704 (=> (not res!880518) (not e!756161))))

(declare-fun e!756158 () Bool)

(assert (=> b!1326704 (= res!880518 (not e!756158))))

(declare-fun res!880517 () Bool)

(assert (=> b!1326704 (=> (not res!880517) (not e!756158))))

(assert (=> b!1326704 (= res!880517 (validKeyInArray!0 (select (arr!43242 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326705 () Bool)

(assert (=> b!1326705 (= e!756161 e!756160)))

(declare-fun c!125780 () Bool)

(assert (=> b!1326705 (= c!125780 (validKeyInArray!0 (select (arr!43242 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326706 () Bool)

(declare-fun contains!8735 (List!30734 (_ BitVec 64)) Bool)

(assert (=> b!1326706 (= e!756158 (contains!8735 Nil!30731 (select (arr!43242 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326707 () Bool)

(assert (=> b!1326707 (= e!756160 call!64741)))

(declare-fun d!143011 () Bool)

(declare-fun res!880519 () Bool)

(assert (=> d!143011 (=> res!880519 e!756159)))

(assert (=> d!143011 (= res!880519 (bvsge #b00000000000000000000000000000000 (size!43794 _keys!1609)))))

(assert (=> d!143011 (= (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30731) e!756159)))

(declare-fun bm!64738 () Bool)

(assert (=> bm!64738 (= call!64741 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125780 (Cons!30730 (select (arr!43242 _keys!1609) #b00000000000000000000000000000000) Nil!30731) Nil!30731)))))

(assert (= (and d!143011 (not res!880519)) b!1326704))

(assert (= (and b!1326704 res!880517) b!1326706))

(assert (= (and b!1326704 res!880518) b!1326705))

(assert (= (and b!1326705 c!125780) b!1326707))

(assert (= (and b!1326705 (not c!125780)) b!1326703))

(assert (= (or b!1326707 b!1326703) bm!64738))

(declare-fun m!1215433 () Bool)

(assert (=> b!1326704 m!1215433))

(assert (=> b!1326704 m!1215433))

(declare-fun m!1215435 () Bool)

(assert (=> b!1326704 m!1215435))

(assert (=> b!1326705 m!1215433))

(assert (=> b!1326705 m!1215433))

(assert (=> b!1326705 m!1215435))

(assert (=> b!1326706 m!1215433))

(assert (=> b!1326706 m!1215433))

(declare-fun m!1215437 () Bool)

(assert (=> b!1326706 m!1215437))

(assert (=> bm!64738 m!1215433))

(declare-fun m!1215439 () Bool)

(assert (=> bm!64738 m!1215439))

(assert (=> b!1326476 d!143011))

(declare-fun bm!64741 () Bool)

(declare-fun call!64744 () Bool)

(assert (=> bm!64741 (= call!64744 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun d!143013 () Bool)

(declare-fun res!880525 () Bool)

(declare-fun e!756170 () Bool)

(assert (=> d!143013 (=> res!880525 e!756170)))

(assert (=> d!143013 (= res!880525 (bvsge #b00000000000000000000000000000000 (size!43794 _keys!1609)))))

(assert (=> d!143013 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!756170)))

(declare-fun b!1326716 () Bool)

(declare-fun e!756169 () Bool)

(assert (=> b!1326716 (= e!756169 call!64744)))

(declare-fun b!1326717 () Bool)

(assert (=> b!1326717 (= e!756170 e!756169)))

(declare-fun c!125783 () Bool)

(assert (=> b!1326717 (= c!125783 (validKeyInArray!0 (select (arr!43242 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326718 () Bool)

(declare-fun e!756168 () Bool)

(assert (=> b!1326718 (= e!756168 call!64744)))

(declare-fun b!1326719 () Bool)

(assert (=> b!1326719 (= e!756169 e!756168)))

(declare-fun lt!590218 () (_ BitVec 64))

(assert (=> b!1326719 (= lt!590218 (select (arr!43242 _keys!1609) #b00000000000000000000000000000000))))

(declare-fun lt!590217 () Unit!43499)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89537 (_ BitVec 64) (_ BitVec 32)) Unit!43499)

(assert (=> b!1326719 (= lt!590217 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590218 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1326719 (arrayContainsKey!0 _keys!1609 lt!590218 #b00000000000000000000000000000000)))

(declare-fun lt!590219 () Unit!43499)

(assert (=> b!1326719 (= lt!590219 lt!590217)))

(declare-fun res!880524 () Bool)

(declare-datatypes ((SeekEntryResult!10040 0))(
  ( (MissingZero!10040 (index!42531 (_ BitVec 32))) (Found!10040 (index!42532 (_ BitVec 32))) (Intermediate!10040 (undefined!10852 Bool) (index!42533 (_ BitVec 32)) (x!118288 (_ BitVec 32))) (Undefined!10040) (MissingVacant!10040 (index!42534 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89537 (_ BitVec 32)) SeekEntryResult!10040)

(assert (=> b!1326719 (= res!880524 (= (seekEntryOrOpen!0 (select (arr!43242 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10040 #b00000000000000000000000000000000)))))

(assert (=> b!1326719 (=> (not res!880524) (not e!756168))))

(assert (= (and d!143013 (not res!880525)) b!1326717))

(assert (= (and b!1326717 c!125783) b!1326719))

(assert (= (and b!1326717 (not c!125783)) b!1326716))

(assert (= (and b!1326719 res!880524) b!1326718))

(assert (= (or b!1326718 b!1326716) bm!64741))

(declare-fun m!1215441 () Bool)

(assert (=> bm!64741 m!1215441))

(assert (=> b!1326717 m!1215433))

(assert (=> b!1326717 m!1215433))

(assert (=> b!1326717 m!1215435))

(assert (=> b!1326719 m!1215433))

(declare-fun m!1215443 () Bool)

(assert (=> b!1326719 m!1215443))

(declare-fun m!1215445 () Bool)

(assert (=> b!1326719 m!1215445))

(assert (=> b!1326719 m!1215433))

(declare-fun m!1215447 () Bool)

(assert (=> b!1326719 m!1215447))

(assert (=> b!1326473 d!143013))

(declare-fun d!143015 () Bool)

(assert (=> d!143015 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111930 d!143015))

(declare-fun d!143017 () Bool)

(assert (=> d!143017 (= (array_inv!32811 _keys!1609) (bvsge (size!43794 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111930 d!143017))

(declare-fun d!143019 () Bool)

(assert (=> d!143019 (= (array_inv!32812 _values!1337) (bvsge (size!43795 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111930 d!143019))

(declare-fun d!143021 () Bool)

(declare-fun e!756172 () Bool)

(assert (=> d!143021 e!756172))

(declare-fun res!880526 () Bool)

(assert (=> d!143021 (=> res!880526 e!756172)))

(declare-fun lt!590220 () Bool)

(assert (=> d!143021 (= res!880526 (not lt!590220))))

(declare-fun lt!590221 () Bool)

(assert (=> d!143021 (= lt!590220 lt!590221)))

(declare-fun lt!590223 () Unit!43499)

(declare-fun e!756171 () Unit!43499)

(assert (=> d!143021 (= lt!590223 e!756171)))

(declare-fun c!125784 () Bool)

(assert (=> d!143021 (= c!125784 lt!590221)))

(assert (=> d!143021 (= lt!590221 (containsKey!733 (toList!10647 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> d!143021 (= (contains!8731 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164) lt!590220)))

(declare-fun b!1326720 () Bool)

(declare-fun lt!590222 () Unit!43499)

(assert (=> b!1326720 (= e!756171 lt!590222)))

(assert (=> b!1326720 (= lt!590222 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10647 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> b!1326720 (isDefined!523 (getValueByKey!716 (toList!10647 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun b!1326721 () Bool)

(declare-fun Unit!43510 () Unit!43499)

(assert (=> b!1326721 (= e!756171 Unit!43510)))

(declare-fun b!1326722 () Bool)

(assert (=> b!1326722 (= e!756172 (isDefined!523 (getValueByKey!716 (toList!10647 (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)))))

(assert (= (and d!143021 c!125784) b!1326720))

(assert (= (and d!143021 (not c!125784)) b!1326721))

(assert (= (and d!143021 (not res!880526)) b!1326722))

(declare-fun m!1215449 () Bool)

(assert (=> d!143021 m!1215449))

(declare-fun m!1215451 () Bool)

(assert (=> b!1326720 m!1215451))

(declare-fun m!1215453 () Bool)

(assert (=> b!1326720 m!1215453))

(assert (=> b!1326720 m!1215453))

(declare-fun m!1215455 () Bool)

(assert (=> b!1326720 m!1215455))

(assert (=> b!1326722 m!1215453))

(assert (=> b!1326722 m!1215453))

(assert (=> b!1326722 m!1215455))

(assert (=> b!1326469 d!143021))

(declare-fun d!143023 () Bool)

(declare-fun e!756177 () Bool)

(assert (=> d!143023 e!756177))

(declare-fun res!880529 () Bool)

(assert (=> d!143023 (=> (not res!880529) (not e!756177))))

(assert (=> d!143023 (= res!880529 (or (bvsge from!2000 (size!43794 _keys!1609)) (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43794 _keys!1609)))))))

(declare-fun lt!590244 () ListLongMap!21263)

(declare-fun lt!590237 () ListLongMap!21263)

(assert (=> d!143023 (= lt!590244 lt!590237)))

(declare-fun lt!590232 () Unit!43499)

(declare-fun e!756180 () Unit!43499)

(assert (=> d!143023 (= lt!590232 e!756180)))

(declare-fun c!125788 () Bool)

(declare-fun e!756185 () Bool)

(assert (=> d!143023 (= c!125788 e!756185)))

(declare-fun res!880528 () Bool)

(assert (=> d!143023 (=> (not res!880528) (not e!756185))))

(assert (=> d!143023 (= res!880528 (bvslt from!2000 (size!43794 _keys!1609)))))

(declare-fun e!756181 () ListLongMap!21263)

(assert (=> d!143023 (= lt!590237 e!756181)))

(declare-fun c!125787 () Bool)

(assert (=> d!143023 (= c!125787 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143023 (validMask!0 mask!2019)))

(assert (=> d!143023 (= (getCurrentListMap!5519 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!590244)))

(declare-fun bm!64742 () Bool)

(declare-fun call!64749 () Bool)

(assert (=> bm!64742 (= call!64749 (contains!8731 lt!590244 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326723 () Bool)

(declare-fun e!756183 () Bool)

(declare-fun e!756173 () Bool)

(assert (=> b!1326723 (= e!756183 e!756173)))

(declare-fun res!880531 () Bool)

(declare-fun call!64750 () Bool)

(assert (=> b!1326723 (= res!880531 call!64750)))

(assert (=> b!1326723 (=> (not res!880531) (not e!756173))))

(declare-fun b!1326724 () Bool)

(declare-fun e!756178 () Bool)

(assert (=> b!1326724 (= e!756178 (= (apply!1023 lt!590244 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun b!1326725 () Bool)

(declare-fun e!756176 () Bool)

(assert (=> b!1326725 (= e!756177 e!756176)))

(declare-fun c!125786 () Bool)

(assert (=> b!1326725 (= c!125786 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1326726 () Bool)

(declare-fun call!64746 () ListLongMap!21263)

(assert (=> b!1326726 (= e!756181 (+!4653 call!64746 (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun b!1326727 () Bool)

(declare-fun Unit!43511 () Unit!43499)

(assert (=> b!1326727 (= e!756180 Unit!43511)))

(declare-fun b!1326728 () Bool)

(declare-fun e!756174 () ListLongMap!21263)

(declare-fun call!64747 () ListLongMap!21263)

(assert (=> b!1326728 (= e!756174 call!64747)))

(declare-fun bm!64743 () Bool)

(declare-fun call!64748 () ListLongMap!21263)

(assert (=> bm!64743 (= call!64748 call!64746)))

(declare-fun bm!64744 () Bool)

(assert (=> bm!64744 (= call!64750 (contains!8731 lt!590244 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326729 () Bool)

(declare-fun c!125790 () Bool)

(assert (=> b!1326729 (= c!125790 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!756182 () ListLongMap!21263)

(assert (=> b!1326729 (= e!756182 e!756174)))

(declare-fun b!1326730 () Bool)

(assert (=> b!1326730 (= e!756176 (not call!64749))))

(declare-fun b!1326731 () Bool)

(declare-fun e!756179 () Bool)

(assert (=> b!1326731 (= e!756179 (validKeyInArray!0 (select (arr!43242 _keys!1609) from!2000)))))

(declare-fun call!64745 () ListLongMap!21263)

(declare-fun bm!64745 () Bool)

(assert (=> bm!64745 (= call!64745 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun b!1326732 () Bool)

(declare-fun res!880532 () Bool)

(assert (=> b!1326732 (=> (not res!880532) (not e!756177))))

(declare-fun e!756175 () Bool)

(assert (=> b!1326732 (= res!880532 e!756175)))

(declare-fun res!880535 () Bool)

(assert (=> b!1326732 (=> res!880535 e!756175)))

(assert (=> b!1326732 (= res!880535 (not e!756179))))

(declare-fun res!880533 () Bool)

(assert (=> b!1326732 (=> (not res!880533) (not e!756179))))

(assert (=> b!1326732 (= res!880533 (bvslt from!2000 (size!43794 _keys!1609)))))

(declare-fun call!64751 () ListLongMap!21263)

(declare-fun bm!64746 () Bool)

(declare-fun c!125789 () Bool)

(assert (=> bm!64746 (= call!64746 (+!4653 (ite c!125787 call!64745 (ite c!125789 call!64751 call!64747)) (ite (or c!125787 c!125789) (tuple2!23607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1326733 () Bool)

(assert (=> b!1326733 (= e!756176 e!756178)))

(declare-fun res!880534 () Bool)

(assert (=> b!1326733 (= res!880534 call!64749)))

(assert (=> b!1326733 (=> (not res!880534) (not e!756178))))

(declare-fun b!1326734 () Bool)

(assert (=> b!1326734 (= e!756185 (validKeyInArray!0 (select (arr!43242 _keys!1609) from!2000)))))

(declare-fun b!1326735 () Bool)

(assert (=> b!1326735 (= e!756174 call!64748)))

(declare-fun b!1326736 () Bool)

(assert (=> b!1326736 (= e!756173 (= (apply!1023 lt!590244 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun b!1326737 () Bool)

(declare-fun e!756184 () Bool)

(assert (=> b!1326737 (= e!756175 e!756184)))

(declare-fun res!880527 () Bool)

(assert (=> b!1326737 (=> (not res!880527) (not e!756184))))

(assert (=> b!1326737 (= res!880527 (contains!8731 lt!590244 (select (arr!43242 _keys!1609) from!2000)))))

(assert (=> b!1326737 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43794 _keys!1609)))))

(declare-fun b!1326738 () Bool)

(assert (=> b!1326738 (= e!756183 (not call!64750))))

(declare-fun b!1326739 () Bool)

(declare-fun lt!590241 () Unit!43499)

(assert (=> b!1326739 (= e!756180 lt!590241)))

(declare-fun lt!590239 () ListLongMap!21263)

(assert (=> b!1326739 (= lt!590239 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590230 () (_ BitVec 64))

(assert (=> b!1326739 (= lt!590230 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590229 () (_ BitVec 64))

(assert (=> b!1326739 (= lt!590229 (select (arr!43242 _keys!1609) from!2000))))

(declare-fun lt!590234 () Unit!43499)

(assert (=> b!1326739 (= lt!590234 (addStillContains!1157 lt!590239 lt!590230 zeroValue!1279 lt!590229))))

(assert (=> b!1326739 (contains!8731 (+!4653 lt!590239 (tuple2!23607 lt!590230 zeroValue!1279)) lt!590229)))

(declare-fun lt!590228 () Unit!43499)

(assert (=> b!1326739 (= lt!590228 lt!590234)))

(declare-fun lt!590243 () ListLongMap!21263)

(assert (=> b!1326739 (= lt!590243 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590236 () (_ BitVec 64))

(assert (=> b!1326739 (= lt!590236 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590224 () (_ BitVec 64))

(assert (=> b!1326739 (= lt!590224 (select (arr!43242 _keys!1609) from!2000))))

(declare-fun lt!590227 () Unit!43499)

(assert (=> b!1326739 (= lt!590227 (addApplyDifferent!561 lt!590243 lt!590236 minValue!1279 lt!590224))))

(assert (=> b!1326739 (= (apply!1023 (+!4653 lt!590243 (tuple2!23607 lt!590236 minValue!1279)) lt!590224) (apply!1023 lt!590243 lt!590224))))

(declare-fun lt!590231 () Unit!43499)

(assert (=> b!1326739 (= lt!590231 lt!590227)))

(declare-fun lt!590238 () ListLongMap!21263)

(assert (=> b!1326739 (= lt!590238 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590235 () (_ BitVec 64))

(assert (=> b!1326739 (= lt!590235 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590225 () (_ BitVec 64))

(assert (=> b!1326739 (= lt!590225 (select (arr!43242 _keys!1609) from!2000))))

(declare-fun lt!590226 () Unit!43499)

(assert (=> b!1326739 (= lt!590226 (addApplyDifferent!561 lt!590238 lt!590235 zeroValue!1279 lt!590225))))

(assert (=> b!1326739 (= (apply!1023 (+!4653 lt!590238 (tuple2!23607 lt!590235 zeroValue!1279)) lt!590225) (apply!1023 lt!590238 lt!590225))))

(declare-fun lt!590233 () Unit!43499)

(assert (=> b!1326739 (= lt!590233 lt!590226)))

(declare-fun lt!590242 () ListLongMap!21263)

(assert (=> b!1326739 (= lt!590242 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590245 () (_ BitVec 64))

(assert (=> b!1326739 (= lt!590245 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590240 () (_ BitVec 64))

(assert (=> b!1326739 (= lt!590240 (select (arr!43242 _keys!1609) from!2000))))

(assert (=> b!1326739 (= lt!590241 (addApplyDifferent!561 lt!590242 lt!590245 minValue!1279 lt!590240))))

(assert (=> b!1326739 (= (apply!1023 (+!4653 lt!590242 (tuple2!23607 lt!590245 minValue!1279)) lt!590240) (apply!1023 lt!590242 lt!590240))))

(declare-fun bm!64747 () Bool)

(assert (=> bm!64747 (= call!64751 call!64745)))

(declare-fun b!1326740 () Bool)

(assert (=> b!1326740 (= e!756184 (= (apply!1023 lt!590244 (select (arr!43242 _keys!1609) from!2000)) (get!21791 (select (arr!43243 _values!1337) from!2000) (dynLambda!3583 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326740 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43795 _values!1337)))))

(assert (=> b!1326740 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43794 _keys!1609)))))

(declare-fun b!1326741 () Bool)

(assert (=> b!1326741 (= e!756182 call!64748)))

(declare-fun b!1326742 () Bool)

(assert (=> b!1326742 (= e!756181 e!756182)))

(assert (=> b!1326742 (= c!125789 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64748 () Bool)

(assert (=> bm!64748 (= call!64747 call!64751)))

(declare-fun b!1326743 () Bool)

(declare-fun res!880530 () Bool)

(assert (=> b!1326743 (=> (not res!880530) (not e!756177))))

(assert (=> b!1326743 (= res!880530 e!756183)))

(declare-fun c!125785 () Bool)

(assert (=> b!1326743 (= c!125785 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!143023 c!125787) b!1326726))

(assert (= (and d!143023 (not c!125787)) b!1326742))

(assert (= (and b!1326742 c!125789) b!1326741))

(assert (= (and b!1326742 (not c!125789)) b!1326729))

(assert (= (and b!1326729 c!125790) b!1326735))

(assert (= (and b!1326729 (not c!125790)) b!1326728))

(assert (= (or b!1326735 b!1326728) bm!64748))

(assert (= (or b!1326741 bm!64748) bm!64747))

(assert (= (or b!1326741 b!1326735) bm!64743))

(assert (= (or b!1326726 bm!64747) bm!64745))

(assert (= (or b!1326726 bm!64743) bm!64746))

(assert (= (and d!143023 res!880528) b!1326734))

(assert (= (and d!143023 c!125788) b!1326739))

(assert (= (and d!143023 (not c!125788)) b!1326727))

(assert (= (and d!143023 res!880529) b!1326732))

(assert (= (and b!1326732 res!880533) b!1326731))

(assert (= (and b!1326732 (not res!880535)) b!1326737))

(assert (= (and b!1326737 res!880527) b!1326740))

(assert (= (and b!1326732 res!880532) b!1326743))

(assert (= (and b!1326743 c!125785) b!1326723))

(assert (= (and b!1326743 (not c!125785)) b!1326738))

(assert (= (and b!1326723 res!880531) b!1326736))

(assert (= (or b!1326723 b!1326738) bm!64744))

(assert (= (and b!1326743 res!880530) b!1326725))

(assert (= (and b!1326725 c!125786) b!1326733))

(assert (= (and b!1326725 (not c!125786)) b!1326730))

(assert (= (and b!1326733 res!880534) b!1326724))

(assert (= (or b!1326733 b!1326730) bm!64742))

(declare-fun b_lambda!23811 () Bool)

(assert (=> (not b_lambda!23811) (not b!1326740)))

(assert (=> b!1326740 t!44724))

(declare-fun b_and!49153 () Bool)

(assert (= b_and!49151 (and (=> t!44724 result!24655) b_and!49153)))

(declare-fun m!1215457 () Bool)

(assert (=> bm!64744 m!1215457))

(assert (=> b!1326737 m!1215059))

(assert (=> b!1326737 m!1215059))

(declare-fun m!1215459 () Bool)

(assert (=> b!1326737 m!1215459))

(assert (=> b!1326734 m!1215059))

(assert (=> b!1326734 m!1215059))

(assert (=> b!1326734 m!1215061))

(declare-fun m!1215461 () Bool)

(assert (=> bm!64745 m!1215461))

(assert (=> b!1326731 m!1215059))

(assert (=> b!1326731 m!1215059))

(assert (=> b!1326731 m!1215061))

(assert (=> d!143023 m!1215109))

(declare-fun m!1215463 () Bool)

(assert (=> b!1326736 m!1215463))

(assert (=> b!1326740 m!1215085))

(assert (=> b!1326740 m!1215073))

(assert (=> b!1326740 m!1215087))

(assert (=> b!1326740 m!1215059))

(declare-fun m!1215465 () Bool)

(assert (=> b!1326740 m!1215465))

(assert (=> b!1326740 m!1215085))

(assert (=> b!1326740 m!1215059))

(assert (=> b!1326740 m!1215073))

(declare-fun m!1215467 () Bool)

(assert (=> b!1326724 m!1215467))

(declare-fun m!1215469 () Bool)

(assert (=> bm!64742 m!1215469))

(declare-fun m!1215471 () Bool)

(assert (=> bm!64746 m!1215471))

(declare-fun m!1215473 () Bool)

(assert (=> b!1326739 m!1215473))

(declare-fun m!1215475 () Bool)

(assert (=> b!1326739 m!1215475))

(declare-fun m!1215477 () Bool)

(assert (=> b!1326739 m!1215477))

(declare-fun m!1215479 () Bool)

(assert (=> b!1326739 m!1215479))

(declare-fun m!1215481 () Bool)

(assert (=> b!1326739 m!1215481))

(declare-fun m!1215483 () Bool)

(assert (=> b!1326739 m!1215483))

(declare-fun m!1215485 () Bool)

(assert (=> b!1326739 m!1215485))

(assert (=> b!1326739 m!1215479))

(declare-fun m!1215487 () Bool)

(assert (=> b!1326739 m!1215487))

(declare-fun m!1215489 () Bool)

(assert (=> b!1326739 m!1215489))

(declare-fun m!1215491 () Bool)

(assert (=> b!1326739 m!1215491))

(assert (=> b!1326739 m!1215475))

(declare-fun m!1215493 () Bool)

(assert (=> b!1326739 m!1215493))

(declare-fun m!1215495 () Bool)

(assert (=> b!1326739 m!1215495))

(assert (=> b!1326739 m!1215493))

(declare-fun m!1215497 () Bool)

(assert (=> b!1326739 m!1215497))

(assert (=> b!1326739 m!1215489))

(assert (=> b!1326739 m!1215059))

(declare-fun m!1215499 () Bool)

(assert (=> b!1326739 m!1215499))

(declare-fun m!1215501 () Bool)

(assert (=> b!1326739 m!1215501))

(assert (=> b!1326739 m!1215461))

(declare-fun m!1215503 () Bool)

(assert (=> b!1326726 m!1215503))

(assert (=> b!1326469 d!143023))

(declare-fun b!1326750 () Bool)

(declare-fun e!756191 () Bool)

(assert (=> b!1326750 (= e!756191 tp_is_empty!36349)))

(declare-fun b!1326751 () Bool)

(declare-fun e!756190 () Bool)

(assert (=> b!1326751 (= e!756190 tp_is_empty!36349)))

(declare-fun mapNonEmpty!56184 () Bool)

(declare-fun mapRes!56184 () Bool)

(declare-fun tp!107083 () Bool)

(assert (=> mapNonEmpty!56184 (= mapRes!56184 (and tp!107083 e!756191))))

(declare-fun mapRest!56184 () (Array (_ BitVec 32) ValueCell!17276))

(declare-fun mapValue!56184 () ValueCell!17276)

(declare-fun mapKey!56184 () (_ BitVec 32))

(assert (=> mapNonEmpty!56184 (= mapRest!56175 (store mapRest!56184 mapKey!56184 mapValue!56184))))

(declare-fun mapIsEmpty!56184 () Bool)

(assert (=> mapIsEmpty!56184 mapRes!56184))

(declare-fun condMapEmpty!56184 () Bool)

(declare-fun mapDefault!56184 () ValueCell!17276)

(assert (=> mapNonEmpty!56175 (= condMapEmpty!56184 (= mapRest!56175 ((as const (Array (_ BitVec 32) ValueCell!17276)) mapDefault!56184)))))

(assert (=> mapNonEmpty!56175 (= tp!107068 (and e!756190 mapRes!56184))))

(assert (= (and mapNonEmpty!56175 condMapEmpty!56184) mapIsEmpty!56184))

(assert (= (and mapNonEmpty!56175 (not condMapEmpty!56184)) mapNonEmpty!56184))

(assert (= (and mapNonEmpty!56184 ((_ is ValueCellFull!17276) mapValue!56184)) b!1326750))

(assert (= (and mapNonEmpty!56175 ((_ is ValueCellFull!17276) mapDefault!56184)) b!1326751))

(declare-fun m!1215505 () Bool)

(assert (=> mapNonEmpty!56184 m!1215505))

(declare-fun b_lambda!23813 () Bool)

(assert (= b_lambda!23807 (or (and start!111930 b_free!30529) b_lambda!23813)))

(declare-fun b_lambda!23815 () Bool)

(assert (= b_lambda!23811 (or (and start!111930 b_free!30529) b_lambda!23815)))

(declare-fun b_lambda!23817 () Bool)

(assert (= b_lambda!23809 (or (and start!111930 b_free!30529) b_lambda!23817)))

(declare-fun b_lambda!23819 () Bool)

(assert (= b_lambda!23805 (or (and start!111930 b_free!30529) b_lambda!23819)))

(check-sat (not b!1326583) (not b!1326654) (not d!142997) (not d!142977) (not bm!64726) (not d!142999) (not b!1326734) (not d!142989) (not b!1326687) (not b!1326628) (not b!1326577) (not d!143023) (not b!1326576) (not b!1326643) (not b!1326650) (not d!142973) (not d!142991) (not b!1326644) (not b!1326578) (not b!1326656) (not bm!64745) (not bm!64729) (not d!142985) (not b!1326720) b_and!49153 (not b!1326560) (not b!1326641) (not d!143021) (not b!1326688) (not b!1326717) (not b!1326557) (not b!1326562) (not b_lambda!23803) (not b!1326705) (not b!1326724) (not b!1326689) (not b!1326722) (not b!1326652) (not b!1326569) (not b!1326726) (not b!1326648) (not bm!64744) (not d!143005) (not b_lambda!23817) (not bm!64741) (not b!1326683) (not bm!64728) (not b!1326638) (not b!1326651) (not bm!64746) (not b!1326635) (not b!1326691) (not b!1326640) (not b!1326649) tp_is_empty!36349 (not bm!64738) (not b!1326706) (not d!142987) (not d!142983) (not d!143007) (not d!142993) (not b!1326581) (not d!142995) (not d!142979) (not b_lambda!23813) (not b!1326736) (not b!1326740) (not mapNonEmpty!56184) (not d!143001) (not b_lambda!23815) (not b!1326704) (not b!1326686) (not b!1326568) (not d!142975) (not b!1326630) (not b!1326567) (not b!1326731) (not b!1326682) (not b!1326739) (not b!1326571) (not b!1326559) (not bm!64735) (not b!1326737) (not b!1326653) (not b!1326681) (not b!1326719) (not bm!64742) (not bm!64730) (not b_lambda!23819) (not b_next!30529) (not b!1326580) (not d!143003))
(check-sat b_and!49153 (not b_next!30529))
