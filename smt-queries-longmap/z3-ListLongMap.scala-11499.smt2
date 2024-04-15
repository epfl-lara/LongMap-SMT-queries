; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133752 () Bool)

(assert start!133752)

(declare-fun b!1564254 () Bool)

(declare-fun e!871822 () Bool)

(declare-fun tp_is_empty!38875 () Bool)

(assert (=> b!1564254 (= e!871822 tp_is_empty!38875)))

(declare-fun b!1564255 () Bool)

(declare-fun e!871823 () Bool)

(declare-fun e!871825 () Bool)

(assert (=> b!1564255 (= e!871823 e!871825)))

(declare-fun res!1069479 () Bool)

(assert (=> b!1564255 (=> res!1069479 e!871825)))

(declare-datatypes ((V!60041 0))(
  ( (V!60042 (val!19521 Int)) )
))
(declare-datatypes ((tuple2!25270 0))(
  ( (tuple2!25271 (_1!12646 (_ BitVec 64)) (_2!12646 V!60041)) )
))
(declare-datatypes ((List!36625 0))(
  ( (Nil!36622) (Cons!36621 (h!38068 tuple2!25270) (t!51464 List!36625)) )
))
(declare-datatypes ((ListLongMap!22705 0))(
  ( (ListLongMap!22706 (toList!11368 List!36625)) )
))
(declare-fun contains!10279 (ListLongMap!22705 (_ BitVec 64)) Bool)

(assert (=> b!1564255 (= res!1069479 (contains!10279 (ListLongMap!22706 Nil!36622) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564256 () Bool)

(declare-fun e!871824 () Bool)

(assert (=> b!1564256 (= e!871824 tp_is_empty!38875)))

(declare-fun b!1564257 () Bool)

(declare-fun res!1069481 () Bool)

(assert (=> b!1564257 (=> res!1069481 e!871825)))

(assert (=> b!1564257 (= res!1069481 (contains!10279 (ListLongMap!22706 Nil!36622) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!1069477 () Bool)

(assert (=> start!133752 (=> (not res!1069477) (not e!871823))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133752 (= res!1069477 (validMask!0 mask!947))))

(assert (=> start!133752 e!871823))

(assert (=> start!133752 true))

(declare-datatypes ((array!104368 0))(
  ( (array!104369 (arr!50376 (Array (_ BitVec 32) (_ BitVec 64))) (size!50928 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104368)

(declare-fun array_inv!39347 (array!104368) Bool)

(assert (=> start!133752 (array_inv!39347 _keys!637)))

(declare-datatypes ((ValueCell!18407 0))(
  ( (ValueCellFull!18407 (v!22269 V!60041)) (EmptyCell!18407) )
))
(declare-datatypes ((array!104370 0))(
  ( (array!104371 (arr!50377 (Array (_ BitVec 32) ValueCell!18407)) (size!50929 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104370)

(declare-fun e!871821 () Bool)

(declare-fun array_inv!39348 (array!104370) Bool)

(assert (=> start!133752 (and (array_inv!39348 _values!487) e!871821)))

(declare-fun b!1564258 () Bool)

(declare-fun res!1069482 () Bool)

(assert (=> b!1564258 (=> (not res!1069482) (not e!871823))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564258 (= res!1069482 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50928 _keys!637)) (bvsge from!782 (size!50928 _keys!637))))))

(declare-fun b!1564259 () Bool)

(declare-fun isEmpty!1146 (ListLongMap!22705) Bool)

(assert (=> b!1564259 (= e!871825 (not (isEmpty!1146 (ListLongMap!22706 Nil!36622))))))

(declare-fun mapIsEmpty!59691 () Bool)

(declare-fun mapRes!59691 () Bool)

(assert (=> mapIsEmpty!59691 mapRes!59691))

(declare-fun b!1564260 () Bool)

(declare-fun res!1069476 () Bool)

(assert (=> b!1564260 (=> (not res!1069476) (not e!871823))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564260 (= res!1069476 (and (= (size!50929 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50928 _keys!637) (size!50929 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564261 () Bool)

(declare-fun res!1069478 () Bool)

(assert (=> b!1564261 (=> (not res!1069478) (not e!871823))))

(declare-datatypes ((List!36626 0))(
  ( (Nil!36623) (Cons!36622 (h!38069 (_ BitVec 64)) (t!51465 List!36626)) )
))
(declare-fun arrayNoDuplicates!0 (array!104368 (_ BitVec 32) List!36626) Bool)

(assert (=> b!1564261 (= res!1069478 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36623))))

(declare-fun b!1564262 () Bool)

(assert (=> b!1564262 (= e!871821 (and e!871822 mapRes!59691))))

(declare-fun condMapEmpty!59691 () Bool)

(declare-fun mapDefault!59691 () ValueCell!18407)

(assert (=> b!1564262 (= condMapEmpty!59691 (= (arr!50377 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18407)) mapDefault!59691)))))

(declare-fun mapNonEmpty!59691 () Bool)

(declare-fun tp!113617 () Bool)

(assert (=> mapNonEmpty!59691 (= mapRes!59691 (and tp!113617 e!871824))))

(declare-fun mapKey!59691 () (_ BitVec 32))

(declare-fun mapRest!59691 () (Array (_ BitVec 32) ValueCell!18407))

(declare-fun mapValue!59691 () ValueCell!18407)

(assert (=> mapNonEmpty!59691 (= (arr!50377 _values!487) (store mapRest!59691 mapKey!59691 mapValue!59691))))

(declare-fun b!1564263 () Bool)

(declare-fun res!1069480 () Bool)

(assert (=> b!1564263 (=> (not res!1069480) (not e!871823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104368 (_ BitVec 32)) Bool)

(assert (=> b!1564263 (= res!1069480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!133752 res!1069477) b!1564260))

(assert (= (and b!1564260 res!1069476) b!1564263))

(assert (= (and b!1564263 res!1069480) b!1564261))

(assert (= (and b!1564261 res!1069478) b!1564258))

(assert (= (and b!1564258 res!1069482) b!1564255))

(assert (= (and b!1564255 (not res!1069479)) b!1564257))

(assert (= (and b!1564257 (not res!1069481)) b!1564259))

(assert (= (and b!1564262 condMapEmpty!59691) mapIsEmpty!59691))

(assert (= (and b!1564262 (not condMapEmpty!59691)) mapNonEmpty!59691))

(get-info :version)

(assert (= (and mapNonEmpty!59691 ((_ is ValueCellFull!18407) mapValue!59691)) b!1564256))

(assert (= (and b!1564262 ((_ is ValueCellFull!18407) mapDefault!59691)) b!1564254))

(assert (= start!133752 b!1564262))

(declare-fun m!1438815 () Bool)

(assert (=> b!1564257 m!1438815))

(declare-fun m!1438817 () Bool)

(assert (=> b!1564261 m!1438817))

(declare-fun m!1438819 () Bool)

(assert (=> b!1564259 m!1438819))

(declare-fun m!1438821 () Bool)

(assert (=> mapNonEmpty!59691 m!1438821))

(declare-fun m!1438823 () Bool)

(assert (=> b!1564263 m!1438823))

(declare-fun m!1438825 () Bool)

(assert (=> b!1564255 m!1438825))

(declare-fun m!1438827 () Bool)

(assert (=> start!133752 m!1438827))

(declare-fun m!1438829 () Bool)

(assert (=> start!133752 m!1438829))

(declare-fun m!1438831 () Bool)

(assert (=> start!133752 m!1438831))

(check-sat (not start!133752) (not mapNonEmpty!59691) (not b!1564257) (not b!1564261) tp_is_empty!38875 (not b!1564263) (not b!1564259) (not b!1564255))
(check-sat)
(get-model)

(declare-fun d!162835 () Bool)

(assert (=> d!162835 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133752 d!162835))

(declare-fun d!162837 () Bool)

(assert (=> d!162837 (= (array_inv!39347 _keys!637) (bvsge (size!50928 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133752 d!162837))

(declare-fun d!162839 () Bool)

(assert (=> d!162839 (= (array_inv!39348 _values!487) (bvsge (size!50929 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133752 d!162839))

(declare-fun d!162841 () Bool)

(declare-fun e!871867 () Bool)

(assert (=> d!162841 e!871867))

(declare-fun res!1069527 () Bool)

(assert (=> d!162841 (=> res!1069527 e!871867)))

(declare-fun lt!671774 () Bool)

(assert (=> d!162841 (= res!1069527 (not lt!671774))))

(declare-fun lt!671775 () Bool)

(assert (=> d!162841 (= lt!671774 lt!671775)))

(declare-datatypes ((Unit!51800 0))(
  ( (Unit!51801) )
))
(declare-fun lt!671776 () Unit!51800)

(declare-fun e!871866 () Unit!51800)

(assert (=> d!162841 (= lt!671776 e!871866)))

(declare-fun c!144144 () Bool)

(assert (=> d!162841 (= c!144144 lt!671775)))

(declare-fun containsKey!846 (List!36625 (_ BitVec 64)) Bool)

(assert (=> d!162841 (= lt!671775 (containsKey!846 (toList!11368 (ListLongMap!22706 Nil!36622)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!162841 (= (contains!10279 (ListLongMap!22706 Nil!36622) #b1000000000000000000000000000000000000000000000000000000000000000) lt!671774)))

(declare-fun b!1564330 () Bool)

(declare-fun lt!671777 () Unit!51800)

(assert (=> b!1564330 (= e!871866 lt!671777)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!530 (List!36625 (_ BitVec 64)) Unit!51800)

(assert (=> b!1564330 (= lt!671777 (lemmaContainsKeyImpliesGetValueByKeyDefined!530 (toList!11368 (ListLongMap!22706 Nil!36622)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!868 0))(
  ( (Some!867 (v!22272 V!60041)) (None!866) )
))
(declare-fun isDefined!581 (Option!868) Bool)

(declare-fun getValueByKey!793 (List!36625 (_ BitVec 64)) Option!868)

(assert (=> b!1564330 (isDefined!581 (getValueByKey!793 (toList!11368 (ListLongMap!22706 Nil!36622)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564331 () Bool)

(declare-fun Unit!51802 () Unit!51800)

(assert (=> b!1564331 (= e!871866 Unit!51802)))

(declare-fun b!1564332 () Bool)

(assert (=> b!1564332 (= e!871867 (isDefined!581 (getValueByKey!793 (toList!11368 (ListLongMap!22706 Nil!36622)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162841 c!144144) b!1564330))

(assert (= (and d!162841 (not c!144144)) b!1564331))

(assert (= (and d!162841 (not res!1069527)) b!1564332))

(declare-fun m!1438869 () Bool)

(assert (=> d!162841 m!1438869))

(declare-fun m!1438871 () Bool)

(assert (=> b!1564330 m!1438871))

(declare-fun m!1438873 () Bool)

(assert (=> b!1564330 m!1438873))

(assert (=> b!1564330 m!1438873))

(declare-fun m!1438875 () Bool)

(assert (=> b!1564330 m!1438875))

(assert (=> b!1564332 m!1438873))

(assert (=> b!1564332 m!1438873))

(assert (=> b!1564332 m!1438875))

(assert (=> b!1564257 d!162841))

(declare-fun bm!71815 () Bool)

(declare-fun call!71818 () Bool)

(declare-fun c!144147 () Bool)

(assert (=> bm!71815 (= call!71818 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144147 (Cons!36622 (select (arr!50376 _keys!637) #b00000000000000000000000000000000) Nil!36623) Nil!36623)))))

(declare-fun b!1564343 () Bool)

(declare-fun e!871879 () Bool)

(declare-fun contains!10282 (List!36626 (_ BitVec 64)) Bool)

(assert (=> b!1564343 (= e!871879 (contains!10282 Nil!36623 (select (arr!50376 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564344 () Bool)

(declare-fun e!871877 () Bool)

(declare-fun e!871878 () Bool)

(assert (=> b!1564344 (= e!871877 e!871878)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564344 (= c!144147 (validKeyInArray!0 (select (arr!50376 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!162843 () Bool)

(declare-fun res!1069535 () Bool)

(declare-fun e!871876 () Bool)

(assert (=> d!162843 (=> res!1069535 e!871876)))

(assert (=> d!162843 (= res!1069535 (bvsge #b00000000000000000000000000000000 (size!50928 _keys!637)))))

(assert (=> d!162843 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36623) e!871876)))

(declare-fun b!1564345 () Bool)

(assert (=> b!1564345 (= e!871876 e!871877)))

(declare-fun res!1069536 () Bool)

(assert (=> b!1564345 (=> (not res!1069536) (not e!871877))))

(assert (=> b!1564345 (= res!1069536 (not e!871879))))

(declare-fun res!1069534 () Bool)

(assert (=> b!1564345 (=> (not res!1069534) (not e!871879))))

(assert (=> b!1564345 (= res!1069534 (validKeyInArray!0 (select (arr!50376 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564346 () Bool)

(assert (=> b!1564346 (= e!871878 call!71818)))

(declare-fun b!1564347 () Bool)

(assert (=> b!1564347 (= e!871878 call!71818)))

(assert (= (and d!162843 (not res!1069535)) b!1564345))

(assert (= (and b!1564345 res!1069534) b!1564343))

(assert (= (and b!1564345 res!1069536) b!1564344))

(assert (= (and b!1564344 c!144147) b!1564346))

(assert (= (and b!1564344 (not c!144147)) b!1564347))

(assert (= (or b!1564346 b!1564347) bm!71815))

(declare-fun m!1438877 () Bool)

(assert (=> bm!71815 m!1438877))

(declare-fun m!1438879 () Bool)

(assert (=> bm!71815 m!1438879))

(assert (=> b!1564343 m!1438877))

(assert (=> b!1564343 m!1438877))

(declare-fun m!1438881 () Bool)

(assert (=> b!1564343 m!1438881))

(assert (=> b!1564344 m!1438877))

(assert (=> b!1564344 m!1438877))

(declare-fun m!1438883 () Bool)

(assert (=> b!1564344 m!1438883))

(assert (=> b!1564345 m!1438877))

(assert (=> b!1564345 m!1438877))

(assert (=> b!1564345 m!1438883))

(assert (=> b!1564261 d!162843))

(declare-fun d!162845 () Bool)

(declare-fun e!871881 () Bool)

(assert (=> d!162845 e!871881))

(declare-fun res!1069537 () Bool)

(assert (=> d!162845 (=> res!1069537 e!871881)))

(declare-fun lt!671778 () Bool)

(assert (=> d!162845 (= res!1069537 (not lt!671778))))

(declare-fun lt!671779 () Bool)

(assert (=> d!162845 (= lt!671778 lt!671779)))

(declare-fun lt!671780 () Unit!51800)

(declare-fun e!871880 () Unit!51800)

(assert (=> d!162845 (= lt!671780 e!871880)))

(declare-fun c!144148 () Bool)

(assert (=> d!162845 (= c!144148 lt!671779)))

(assert (=> d!162845 (= lt!671779 (containsKey!846 (toList!11368 (ListLongMap!22706 Nil!36622)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!162845 (= (contains!10279 (ListLongMap!22706 Nil!36622) #b0000000000000000000000000000000000000000000000000000000000000000) lt!671778)))

(declare-fun b!1564348 () Bool)

(declare-fun lt!671781 () Unit!51800)

(assert (=> b!1564348 (= e!871880 lt!671781)))

(assert (=> b!1564348 (= lt!671781 (lemmaContainsKeyImpliesGetValueByKeyDefined!530 (toList!11368 (ListLongMap!22706 Nil!36622)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1564348 (isDefined!581 (getValueByKey!793 (toList!11368 (ListLongMap!22706 Nil!36622)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564349 () Bool)

(declare-fun Unit!51803 () Unit!51800)

(assert (=> b!1564349 (= e!871880 Unit!51803)))

(declare-fun b!1564350 () Bool)

(assert (=> b!1564350 (= e!871881 (isDefined!581 (getValueByKey!793 (toList!11368 (ListLongMap!22706 Nil!36622)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!162845 c!144148) b!1564348))

(assert (= (and d!162845 (not c!144148)) b!1564349))

(assert (= (and d!162845 (not res!1069537)) b!1564350))

(declare-fun m!1438885 () Bool)

(assert (=> d!162845 m!1438885))

(declare-fun m!1438887 () Bool)

(assert (=> b!1564348 m!1438887))

(declare-fun m!1438889 () Bool)

(assert (=> b!1564348 m!1438889))

(assert (=> b!1564348 m!1438889))

(declare-fun m!1438891 () Bool)

(assert (=> b!1564348 m!1438891))

(assert (=> b!1564350 m!1438889))

(assert (=> b!1564350 m!1438889))

(assert (=> b!1564350 m!1438891))

(assert (=> b!1564255 d!162845))

(declare-fun b!1564359 () Bool)

(declare-fun e!871890 () Bool)

(declare-fun e!871889 () Bool)

(assert (=> b!1564359 (= e!871890 e!871889)))

(declare-fun c!144151 () Bool)

(assert (=> b!1564359 (= c!144151 (validKeyInArray!0 (select (arr!50376 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!162847 () Bool)

(declare-fun res!1069543 () Bool)

(assert (=> d!162847 (=> res!1069543 e!871890)))

(assert (=> d!162847 (= res!1069543 (bvsge #b00000000000000000000000000000000 (size!50928 _keys!637)))))

(assert (=> d!162847 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!871890)))

(declare-fun b!1564360 () Bool)

(declare-fun e!871888 () Bool)

(assert (=> b!1564360 (= e!871889 e!871888)))

(declare-fun lt!671788 () (_ BitVec 64))

(assert (=> b!1564360 (= lt!671788 (select (arr!50376 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!671789 () Unit!51800)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104368 (_ BitVec 64) (_ BitVec 32)) Unit!51800)

(assert (=> b!1564360 (= lt!671789 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!671788 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1564360 (arrayContainsKey!0 _keys!637 lt!671788 #b00000000000000000000000000000000)))

(declare-fun lt!671790 () Unit!51800)

(assert (=> b!1564360 (= lt!671790 lt!671789)))

(declare-fun res!1069542 () Bool)

(declare-datatypes ((SeekEntryResult!13522 0))(
  ( (MissingZero!13522 (index!56486 (_ BitVec 32))) (Found!13522 (index!56487 (_ BitVec 32))) (Intermediate!13522 (undefined!14334 Bool) (index!56488 (_ BitVec 32)) (x!140523 (_ BitVec 32))) (Undefined!13522) (MissingVacant!13522 (index!56489 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104368 (_ BitVec 32)) SeekEntryResult!13522)

(assert (=> b!1564360 (= res!1069542 (= (seekEntryOrOpen!0 (select (arr!50376 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13522 #b00000000000000000000000000000000)))))

(assert (=> b!1564360 (=> (not res!1069542) (not e!871888))))

(declare-fun b!1564361 () Bool)

(declare-fun call!71821 () Bool)

(assert (=> b!1564361 (= e!871888 call!71821)))

(declare-fun bm!71818 () Bool)

(assert (=> bm!71818 (= call!71821 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1564362 () Bool)

(assert (=> b!1564362 (= e!871889 call!71821)))

(assert (= (and d!162847 (not res!1069543)) b!1564359))

(assert (= (and b!1564359 c!144151) b!1564360))

(assert (= (and b!1564359 (not c!144151)) b!1564362))

(assert (= (and b!1564360 res!1069542) b!1564361))

(assert (= (or b!1564361 b!1564362) bm!71818))

(assert (=> b!1564359 m!1438877))

(assert (=> b!1564359 m!1438877))

(assert (=> b!1564359 m!1438883))

(assert (=> b!1564360 m!1438877))

(declare-fun m!1438893 () Bool)

(assert (=> b!1564360 m!1438893))

(declare-fun m!1438895 () Bool)

(assert (=> b!1564360 m!1438895))

(assert (=> b!1564360 m!1438877))

(declare-fun m!1438897 () Bool)

(assert (=> b!1564360 m!1438897))

(declare-fun m!1438899 () Bool)

(assert (=> bm!71818 m!1438899))

(assert (=> b!1564263 d!162847))

(declare-fun d!162849 () Bool)

(declare-fun isEmpty!1148 (List!36625) Bool)

(assert (=> d!162849 (= (isEmpty!1146 (ListLongMap!22706 Nil!36622)) (isEmpty!1148 (toList!11368 (ListLongMap!22706 Nil!36622))))))

(declare-fun bs!44977 () Bool)

(assert (= bs!44977 d!162849))

(declare-fun m!1438901 () Bool)

(assert (=> bs!44977 m!1438901))

(assert (=> b!1564259 d!162849))

(declare-fun b!1564370 () Bool)

(declare-fun e!871895 () Bool)

(assert (=> b!1564370 (= e!871895 tp_is_empty!38875)))

(declare-fun mapNonEmpty!59700 () Bool)

(declare-fun mapRes!59700 () Bool)

(declare-fun tp!113626 () Bool)

(declare-fun e!871896 () Bool)

(assert (=> mapNonEmpty!59700 (= mapRes!59700 (and tp!113626 e!871896))))

(declare-fun mapValue!59700 () ValueCell!18407)

(declare-fun mapRest!59700 () (Array (_ BitVec 32) ValueCell!18407))

(declare-fun mapKey!59700 () (_ BitVec 32))

(assert (=> mapNonEmpty!59700 (= mapRest!59691 (store mapRest!59700 mapKey!59700 mapValue!59700))))

(declare-fun b!1564369 () Bool)

(assert (=> b!1564369 (= e!871896 tp_is_empty!38875)))

(declare-fun mapIsEmpty!59700 () Bool)

(assert (=> mapIsEmpty!59700 mapRes!59700))

(declare-fun condMapEmpty!59700 () Bool)

(declare-fun mapDefault!59700 () ValueCell!18407)

(assert (=> mapNonEmpty!59691 (= condMapEmpty!59700 (= mapRest!59691 ((as const (Array (_ BitVec 32) ValueCell!18407)) mapDefault!59700)))))

(assert (=> mapNonEmpty!59691 (= tp!113617 (and e!871895 mapRes!59700))))

(assert (= (and mapNonEmpty!59691 condMapEmpty!59700) mapIsEmpty!59700))

(assert (= (and mapNonEmpty!59691 (not condMapEmpty!59700)) mapNonEmpty!59700))

(assert (= (and mapNonEmpty!59700 ((_ is ValueCellFull!18407) mapValue!59700)) b!1564369))

(assert (= (and mapNonEmpty!59691 ((_ is ValueCellFull!18407) mapDefault!59700)) b!1564370))

(declare-fun m!1438903 () Bool)

(assert (=> mapNonEmpty!59700 m!1438903))

(check-sat (not bm!71815) (not b!1564350) (not bm!71818) tp_is_empty!38875 (not mapNonEmpty!59700) (not b!1564348) (not b!1564344) (not b!1564360) (not d!162841) (not b!1564330) (not b!1564359) (not b!1564345) (not b!1564332) (not d!162845) (not d!162849) (not b!1564343))
(check-sat)
(get-model)

(declare-fun d!162851 () Bool)

(declare-fun lt!671793 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!797 (List!36626) (InoxSet (_ BitVec 64)))

(assert (=> d!162851 (= lt!671793 (select (content!797 Nil!36623) (select (arr!50376 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun e!871901 () Bool)

(assert (=> d!162851 (= lt!671793 e!871901)))

(declare-fun res!1069548 () Bool)

(assert (=> d!162851 (=> (not res!1069548) (not e!871901))))

(assert (=> d!162851 (= res!1069548 ((_ is Cons!36622) Nil!36623))))

(assert (=> d!162851 (= (contains!10282 Nil!36623 (select (arr!50376 _keys!637) #b00000000000000000000000000000000)) lt!671793)))

(declare-fun b!1564375 () Bool)

(declare-fun e!871902 () Bool)

(assert (=> b!1564375 (= e!871901 e!871902)))

(declare-fun res!1069549 () Bool)

(assert (=> b!1564375 (=> res!1069549 e!871902)))

(assert (=> b!1564375 (= res!1069549 (= (h!38069 Nil!36623) (select (arr!50376 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564376 () Bool)

(assert (=> b!1564376 (= e!871902 (contains!10282 (t!51465 Nil!36623) (select (arr!50376 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!162851 res!1069548) b!1564375))

(assert (= (and b!1564375 (not res!1069549)) b!1564376))

(declare-fun m!1438905 () Bool)

(assert (=> d!162851 m!1438905))

(assert (=> d!162851 m!1438877))

(declare-fun m!1438907 () Bool)

(assert (=> d!162851 m!1438907))

(assert (=> b!1564376 m!1438877))

(declare-fun m!1438909 () Bool)

(assert (=> b!1564376 m!1438909))

(assert (=> b!1564343 d!162851))

(declare-fun d!162853 () Bool)

(assert (=> d!162853 (= (isEmpty!1148 (toList!11368 (ListLongMap!22706 Nil!36622))) true)))

(assert (=> d!162849 d!162853))

(declare-fun b!1564377 () Bool)

(declare-fun e!871905 () Bool)

(declare-fun e!871904 () Bool)

(assert (=> b!1564377 (= e!871905 e!871904)))

(declare-fun c!144152 () Bool)

(assert (=> b!1564377 (= c!144152 (validKeyInArray!0 (select (arr!50376 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!162855 () Bool)

(declare-fun res!1069551 () Bool)

(assert (=> d!162855 (=> res!1069551 e!871905)))

(assert (=> d!162855 (= res!1069551 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50928 _keys!637)))))

(assert (=> d!162855 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947) e!871905)))

(declare-fun b!1564378 () Bool)

(declare-fun e!871903 () Bool)

(assert (=> b!1564378 (= e!871904 e!871903)))

(declare-fun lt!671794 () (_ BitVec 64))

(assert (=> b!1564378 (= lt!671794 (select (arr!50376 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!671795 () Unit!51800)

(assert (=> b!1564378 (= lt!671795 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!671794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1564378 (arrayContainsKey!0 _keys!637 lt!671794 #b00000000000000000000000000000000)))

(declare-fun lt!671796 () Unit!51800)

(assert (=> b!1564378 (= lt!671796 lt!671795)))

(declare-fun res!1069550 () Bool)

(assert (=> b!1564378 (= res!1069550 (= (seekEntryOrOpen!0 (select (arr!50376 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947) (Found!13522 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1564378 (=> (not res!1069550) (not e!871903))))

(declare-fun b!1564379 () Bool)

(declare-fun call!71822 () Bool)

(assert (=> b!1564379 (= e!871903 call!71822)))

(declare-fun bm!71819 () Bool)

(assert (=> bm!71819 (= call!71822 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1564380 () Bool)

(assert (=> b!1564380 (= e!871904 call!71822)))

(assert (= (and d!162855 (not res!1069551)) b!1564377))

(assert (= (and b!1564377 c!144152) b!1564378))

(assert (= (and b!1564377 (not c!144152)) b!1564380))

(assert (= (and b!1564378 res!1069550) b!1564379))

(assert (= (or b!1564379 b!1564380) bm!71819))

(declare-fun m!1438911 () Bool)

(assert (=> b!1564377 m!1438911))

(assert (=> b!1564377 m!1438911))

(declare-fun m!1438913 () Bool)

(assert (=> b!1564377 m!1438913))

(assert (=> b!1564378 m!1438911))

(declare-fun m!1438915 () Bool)

(assert (=> b!1564378 m!1438915))

(declare-fun m!1438917 () Bool)

(assert (=> b!1564378 m!1438917))

(assert (=> b!1564378 m!1438911))

(declare-fun m!1438919 () Bool)

(assert (=> b!1564378 m!1438919))

(declare-fun m!1438921 () Bool)

(assert (=> bm!71819 m!1438921))

(assert (=> bm!71818 d!162855))

(declare-fun call!71823 () Bool)

(declare-fun bm!71820 () Bool)

(declare-fun c!144153 () Bool)

(assert (=> bm!71820 (= call!71823 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!144153 (Cons!36622 (select (arr!50376 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!144147 (Cons!36622 (select (arr!50376 _keys!637) #b00000000000000000000000000000000) Nil!36623) Nil!36623)) (ite c!144147 (Cons!36622 (select (arr!50376 _keys!637) #b00000000000000000000000000000000) Nil!36623) Nil!36623))))))

(declare-fun b!1564381 () Bool)

(declare-fun e!871909 () Bool)

(assert (=> b!1564381 (= e!871909 (contains!10282 (ite c!144147 (Cons!36622 (select (arr!50376 _keys!637) #b00000000000000000000000000000000) Nil!36623) Nil!36623) (select (arr!50376 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1564382 () Bool)

(declare-fun e!871907 () Bool)

(declare-fun e!871908 () Bool)

(assert (=> b!1564382 (= e!871907 e!871908)))

(assert (=> b!1564382 (= c!144153 (validKeyInArray!0 (select (arr!50376 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!162857 () Bool)

(declare-fun res!1069553 () Bool)

(declare-fun e!871906 () Bool)

(assert (=> d!162857 (=> res!1069553 e!871906)))

(assert (=> d!162857 (= res!1069553 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50928 _keys!637)))))

(assert (=> d!162857 (= (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144147 (Cons!36622 (select (arr!50376 _keys!637) #b00000000000000000000000000000000) Nil!36623) Nil!36623)) e!871906)))

(declare-fun b!1564383 () Bool)

(assert (=> b!1564383 (= e!871906 e!871907)))

(declare-fun res!1069554 () Bool)

(assert (=> b!1564383 (=> (not res!1069554) (not e!871907))))

(assert (=> b!1564383 (= res!1069554 (not e!871909))))

(declare-fun res!1069552 () Bool)

(assert (=> b!1564383 (=> (not res!1069552) (not e!871909))))

(assert (=> b!1564383 (= res!1069552 (validKeyInArray!0 (select (arr!50376 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1564384 () Bool)

(assert (=> b!1564384 (= e!871908 call!71823)))

(declare-fun b!1564385 () Bool)

(assert (=> b!1564385 (= e!871908 call!71823)))

(assert (= (and d!162857 (not res!1069553)) b!1564383))

(assert (= (and b!1564383 res!1069552) b!1564381))

(assert (= (and b!1564383 res!1069554) b!1564382))

(assert (= (and b!1564382 c!144153) b!1564384))

(assert (= (and b!1564382 (not c!144153)) b!1564385))

(assert (= (or b!1564384 b!1564385) bm!71820))

(assert (=> bm!71820 m!1438911))

(declare-fun m!1438923 () Bool)

(assert (=> bm!71820 m!1438923))

(assert (=> b!1564381 m!1438911))

(assert (=> b!1564381 m!1438911))

(declare-fun m!1438925 () Bool)

(assert (=> b!1564381 m!1438925))

(assert (=> b!1564382 m!1438911))

(assert (=> b!1564382 m!1438911))

(assert (=> b!1564382 m!1438913))

(assert (=> b!1564383 m!1438911))

(assert (=> b!1564383 m!1438911))

(assert (=> b!1564383 m!1438913))

(assert (=> bm!71815 d!162857))

(declare-fun d!162859 () Bool)

(assert (=> d!162859 (arrayContainsKey!0 _keys!637 lt!671788 #b00000000000000000000000000000000)))

(declare-fun lt!671799 () Unit!51800)

(declare-fun choose!13 (array!104368 (_ BitVec 64) (_ BitVec 32)) Unit!51800)

(assert (=> d!162859 (= lt!671799 (choose!13 _keys!637 lt!671788 #b00000000000000000000000000000000))))

(assert (=> d!162859 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!162859 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!671788 #b00000000000000000000000000000000) lt!671799)))

(declare-fun bs!44978 () Bool)

(assert (= bs!44978 d!162859))

(assert (=> bs!44978 m!1438895))

(declare-fun m!1438927 () Bool)

(assert (=> bs!44978 m!1438927))

(assert (=> b!1564360 d!162859))

(declare-fun d!162861 () Bool)

(declare-fun res!1069559 () Bool)

(declare-fun e!871914 () Bool)

(assert (=> d!162861 (=> res!1069559 e!871914)))

(assert (=> d!162861 (= res!1069559 (= (select (arr!50376 _keys!637) #b00000000000000000000000000000000) lt!671788))))

(assert (=> d!162861 (= (arrayContainsKey!0 _keys!637 lt!671788 #b00000000000000000000000000000000) e!871914)))

(declare-fun b!1564390 () Bool)

(declare-fun e!871915 () Bool)

(assert (=> b!1564390 (= e!871914 e!871915)))

(declare-fun res!1069560 () Bool)

(assert (=> b!1564390 (=> (not res!1069560) (not e!871915))))

(assert (=> b!1564390 (= res!1069560 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50928 _keys!637)))))

(declare-fun b!1564391 () Bool)

(assert (=> b!1564391 (= e!871915 (arrayContainsKey!0 _keys!637 lt!671788 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!162861 (not res!1069559)) b!1564390))

(assert (= (and b!1564390 res!1069560) b!1564391))

(assert (=> d!162861 m!1438877))

(declare-fun m!1438929 () Bool)

(assert (=> b!1564391 m!1438929))

(assert (=> b!1564360 d!162861))

(declare-fun d!162863 () Bool)

(declare-fun lt!671808 () SeekEntryResult!13522)

(assert (=> d!162863 (and (or ((_ is Undefined!13522) lt!671808) (not ((_ is Found!13522) lt!671808)) (and (bvsge (index!56487 lt!671808) #b00000000000000000000000000000000) (bvslt (index!56487 lt!671808) (size!50928 _keys!637)))) (or ((_ is Undefined!13522) lt!671808) ((_ is Found!13522) lt!671808) (not ((_ is MissingZero!13522) lt!671808)) (and (bvsge (index!56486 lt!671808) #b00000000000000000000000000000000) (bvslt (index!56486 lt!671808) (size!50928 _keys!637)))) (or ((_ is Undefined!13522) lt!671808) ((_ is Found!13522) lt!671808) ((_ is MissingZero!13522) lt!671808) (not ((_ is MissingVacant!13522) lt!671808)) (and (bvsge (index!56489 lt!671808) #b00000000000000000000000000000000) (bvslt (index!56489 lt!671808) (size!50928 _keys!637)))) (or ((_ is Undefined!13522) lt!671808) (ite ((_ is Found!13522) lt!671808) (= (select (arr!50376 _keys!637) (index!56487 lt!671808)) (select (arr!50376 _keys!637) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!13522) lt!671808) (= (select (arr!50376 _keys!637) (index!56486 lt!671808)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13522) lt!671808) (= (select (arr!50376 _keys!637) (index!56489 lt!671808)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!871923 () SeekEntryResult!13522)

(assert (=> d!162863 (= lt!671808 e!871923)))

(declare-fun c!144162 () Bool)

(declare-fun lt!671806 () SeekEntryResult!13522)

(assert (=> d!162863 (= c!144162 (and ((_ is Intermediate!13522) lt!671806) (undefined!14334 lt!671806)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104368 (_ BitVec 32)) SeekEntryResult!13522)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!162863 (= lt!671806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50376 _keys!637) #b00000000000000000000000000000000) mask!947) (select (arr!50376 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(assert (=> d!162863 (validMask!0 mask!947)))

(assert (=> d!162863 (= (seekEntryOrOpen!0 (select (arr!50376 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) lt!671808)))

(declare-fun b!1564404 () Bool)

(declare-fun c!144160 () Bool)

(declare-fun lt!671807 () (_ BitVec 64))

(assert (=> b!1564404 (= c!144160 (= lt!671807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!871922 () SeekEntryResult!13522)

(declare-fun e!871924 () SeekEntryResult!13522)

(assert (=> b!1564404 (= e!871922 e!871924)))

(declare-fun b!1564405 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104368 (_ BitVec 32)) SeekEntryResult!13522)

(assert (=> b!1564405 (= e!871924 (seekKeyOrZeroReturnVacant!0 (x!140523 lt!671806) (index!56488 lt!671806) (index!56488 lt!671806) (select (arr!50376 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(declare-fun b!1564406 () Bool)

(assert (=> b!1564406 (= e!871923 e!871922)))

(assert (=> b!1564406 (= lt!671807 (select (arr!50376 _keys!637) (index!56488 lt!671806)))))

(declare-fun c!144161 () Bool)

(assert (=> b!1564406 (= c!144161 (= lt!671807 (select (arr!50376 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564407 () Bool)

(assert (=> b!1564407 (= e!871923 Undefined!13522)))

(declare-fun b!1564408 () Bool)

(assert (=> b!1564408 (= e!871924 (MissingZero!13522 (index!56488 lt!671806)))))

(declare-fun b!1564409 () Bool)

(assert (=> b!1564409 (= e!871922 (Found!13522 (index!56488 lt!671806)))))

(assert (= (and d!162863 c!144162) b!1564407))

(assert (= (and d!162863 (not c!144162)) b!1564406))

(assert (= (and b!1564406 c!144161) b!1564409))

(assert (= (and b!1564406 (not c!144161)) b!1564404))

(assert (= (and b!1564404 c!144160) b!1564408))

(assert (= (and b!1564404 (not c!144160)) b!1564405))

(declare-fun m!1438931 () Bool)

(assert (=> d!162863 m!1438931))

(assert (=> d!162863 m!1438827))

(declare-fun m!1438933 () Bool)

(assert (=> d!162863 m!1438933))

(assert (=> d!162863 m!1438877))

(declare-fun m!1438935 () Bool)

(assert (=> d!162863 m!1438935))

(declare-fun m!1438937 () Bool)

(assert (=> d!162863 m!1438937))

(assert (=> d!162863 m!1438877))

(assert (=> d!162863 m!1438933))

(declare-fun m!1438939 () Bool)

(assert (=> d!162863 m!1438939))

(assert (=> b!1564405 m!1438877))

(declare-fun m!1438941 () Bool)

(assert (=> b!1564405 m!1438941))

(declare-fun m!1438943 () Bool)

(assert (=> b!1564406 m!1438943))

(assert (=> b!1564360 d!162863))

(declare-fun d!162865 () Bool)

(assert (=> d!162865 (= (isDefined!581 (getValueByKey!793 (toList!11368 (ListLongMap!22706 Nil!36622)) #b1000000000000000000000000000000000000000000000000000000000000000)) false)))

(assert (=> b!1564332 d!162865))

(declare-fun d!162867 () Bool)

(assert (=> d!162867 (= (getValueByKey!793 (toList!11368 (ListLongMap!22706 Nil!36622)) #b1000000000000000000000000000000000000000000000000000000000000000) None!866)))

(assert (=> b!1564332 d!162867))

(declare-fun d!162869 () Bool)

(assert (=> d!162869 (= (validKeyInArray!0 (select (arr!50376 _keys!637) #b00000000000000000000000000000000)) (and (not (= (select (arr!50376 _keys!637) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50376 _keys!637) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1564359 d!162869))

(declare-fun d!162871 () Bool)

(assert (=> d!162871 (isDefined!581 (getValueByKey!793 (toList!11368 (ListLongMap!22706 Nil!36622)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671811 () Unit!51800)

(declare-fun choose!2082 (List!36625 (_ BitVec 64)) Unit!51800)

(assert (=> d!162871 (= lt!671811 (choose!2082 (toList!11368 (ListLongMap!22706 Nil!36622)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!871927 () Bool)

(assert (=> d!162871 e!871927))

(declare-fun res!1069563 () Bool)

(assert (=> d!162871 (=> (not res!1069563) (not e!871927))))

(declare-fun isStrictlySorted!984 (List!36625) Bool)

(assert (=> d!162871 (= res!1069563 (isStrictlySorted!984 (toList!11368 (ListLongMap!22706 Nil!36622))))))

(assert (=> d!162871 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!530 (toList!11368 (ListLongMap!22706 Nil!36622)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!671811)))

(declare-fun b!1564412 () Bool)

(assert (=> b!1564412 (= e!871927 (containsKey!846 (toList!11368 (ListLongMap!22706 Nil!36622)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!162871 res!1069563) b!1564412))

(assert (=> d!162871 m!1438873))

(assert (=> d!162871 m!1438873))

(assert (=> d!162871 m!1438875))

(declare-fun m!1438945 () Bool)

(assert (=> d!162871 m!1438945))

(declare-fun m!1438947 () Bool)

(assert (=> d!162871 m!1438947))

(assert (=> b!1564412 m!1438869))

(assert (=> b!1564330 d!162871))

(assert (=> b!1564330 d!162865))

(assert (=> b!1564330 d!162867))

(declare-fun d!162873 () Bool)

(assert (=> d!162873 (= (isDefined!581 (getValueByKey!793 (toList!11368 (ListLongMap!22706 Nil!36622)) #b0000000000000000000000000000000000000000000000000000000000000000)) false)))

(assert (=> b!1564350 d!162873))

(declare-fun d!162875 () Bool)

(assert (=> d!162875 (= (getValueByKey!793 (toList!11368 (ListLongMap!22706 Nil!36622)) #b0000000000000000000000000000000000000000000000000000000000000000) None!866)))

(assert (=> b!1564350 d!162875))

(declare-fun d!162877 () Bool)

(assert (=> d!162877 (= (containsKey!846 (toList!11368 (ListLongMap!22706 Nil!36622)) #b0000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> d!162845 d!162877))

(declare-fun d!162879 () Bool)

(assert (=> d!162879 (isDefined!581 (getValueByKey!793 (toList!11368 (ListLongMap!22706 Nil!36622)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671812 () Unit!51800)

(assert (=> d!162879 (= lt!671812 (choose!2082 (toList!11368 (ListLongMap!22706 Nil!36622)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!871928 () Bool)

(assert (=> d!162879 e!871928))

(declare-fun res!1069564 () Bool)

(assert (=> d!162879 (=> (not res!1069564) (not e!871928))))

(assert (=> d!162879 (= res!1069564 (isStrictlySorted!984 (toList!11368 (ListLongMap!22706 Nil!36622))))))

(assert (=> d!162879 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!530 (toList!11368 (ListLongMap!22706 Nil!36622)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!671812)))

(declare-fun b!1564413 () Bool)

(assert (=> b!1564413 (= e!871928 (containsKey!846 (toList!11368 (ListLongMap!22706 Nil!36622)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!162879 res!1069564) b!1564413))

(assert (=> d!162879 m!1438889))

(assert (=> d!162879 m!1438889))

(assert (=> d!162879 m!1438891))

(declare-fun m!1438949 () Bool)

(assert (=> d!162879 m!1438949))

(assert (=> d!162879 m!1438947))

(assert (=> b!1564413 m!1438885))

(assert (=> b!1564348 d!162879))

(assert (=> b!1564348 d!162873))

(assert (=> b!1564348 d!162875))

(declare-fun d!162881 () Bool)

(assert (=> d!162881 (= (containsKey!846 (toList!11368 (ListLongMap!22706 Nil!36622)) #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> d!162841 d!162881))

(assert (=> b!1564345 d!162869))

(assert (=> b!1564344 d!162869))

(declare-fun b!1564415 () Bool)

(declare-fun e!871929 () Bool)

(assert (=> b!1564415 (= e!871929 tp_is_empty!38875)))

(declare-fun mapNonEmpty!59701 () Bool)

(declare-fun mapRes!59701 () Bool)

(declare-fun tp!113627 () Bool)

(declare-fun e!871930 () Bool)

(assert (=> mapNonEmpty!59701 (= mapRes!59701 (and tp!113627 e!871930))))

(declare-fun mapRest!59701 () (Array (_ BitVec 32) ValueCell!18407))

(declare-fun mapKey!59701 () (_ BitVec 32))

(declare-fun mapValue!59701 () ValueCell!18407)

(assert (=> mapNonEmpty!59701 (= mapRest!59700 (store mapRest!59701 mapKey!59701 mapValue!59701))))

(declare-fun b!1564414 () Bool)

(assert (=> b!1564414 (= e!871930 tp_is_empty!38875)))

(declare-fun mapIsEmpty!59701 () Bool)

(assert (=> mapIsEmpty!59701 mapRes!59701))

(declare-fun condMapEmpty!59701 () Bool)

(declare-fun mapDefault!59701 () ValueCell!18407)

(assert (=> mapNonEmpty!59700 (= condMapEmpty!59701 (= mapRest!59700 ((as const (Array (_ BitVec 32) ValueCell!18407)) mapDefault!59701)))))

(assert (=> mapNonEmpty!59700 (= tp!113626 (and e!871929 mapRes!59701))))

(assert (= (and mapNonEmpty!59700 condMapEmpty!59701) mapIsEmpty!59701))

(assert (= (and mapNonEmpty!59700 (not condMapEmpty!59701)) mapNonEmpty!59701))

(assert (= (and mapNonEmpty!59701 ((_ is ValueCellFull!18407) mapValue!59701)) b!1564414))

(assert (= (and mapNonEmpty!59700 ((_ is ValueCellFull!18407) mapDefault!59701)) b!1564415))

(declare-fun m!1438951 () Bool)

(assert (=> mapNonEmpty!59701 m!1438951))

(check-sat (not mapNonEmpty!59701) (not bm!71820) tp_is_empty!38875 (not d!162859) (not bm!71819) (not b!1564383) (not b!1564377) (not b!1564413) (not d!162871) (not b!1564405) (not b!1564376) (not b!1564391) (not d!162879) (not b!1564378) (not d!162851) (not b!1564382) (not b!1564381) (not b!1564412) (not d!162863))
(check-sat)
