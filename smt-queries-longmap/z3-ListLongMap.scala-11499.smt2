; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133804 () Bool)

(assert start!133804)

(declare-fun b!1564597 () Bool)

(declare-fun e!872041 () Bool)

(declare-fun e!872039 () Bool)

(assert (=> b!1564597 (= e!872041 e!872039)))

(declare-fun res!1069628 () Bool)

(assert (=> b!1564597 (=> res!1069628 e!872039)))

(declare-datatypes ((V!60043 0))(
  ( (V!60044 (val!19522 Int)) )
))
(declare-datatypes ((tuple2!25192 0))(
  ( (tuple2!25193 (_1!12607 (_ BitVec 64)) (_2!12607 V!60043)) )
))
(declare-datatypes ((List!36577 0))(
  ( (Nil!36574) (Cons!36573 (h!38019 tuple2!25192) (t!51424 List!36577)) )
))
(declare-datatypes ((ListLongMap!22627 0))(
  ( (ListLongMap!22628 (toList!11329 List!36577)) )
))
(declare-fun contains!10319 (ListLongMap!22627 (_ BitVec 64)) Bool)

(assert (=> b!1564597 (= res!1069628 (contains!10319 (ListLongMap!22628 Nil!36574) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564598 () Bool)

(declare-fun res!1069626 () Bool)

(assert (=> b!1564598 (=> (not res!1069626) (not e!872041))))

(declare-datatypes ((array!104442 0))(
  ( (array!104443 (arr!50412 (Array (_ BitVec 32) (_ BitVec 64))) (size!50962 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104442)

(declare-datatypes ((List!36578 0))(
  ( (Nil!36575) (Cons!36574 (h!38020 (_ BitVec 64)) (t!51425 List!36578)) )
))
(declare-fun arrayNoDuplicates!0 (array!104442 (_ BitVec 32) List!36578) Bool)

(assert (=> b!1564598 (= res!1069626 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36575))))

(declare-fun b!1564599 () Bool)

(declare-fun e!872040 () Bool)

(declare-fun e!872036 () Bool)

(declare-fun mapRes!59694 () Bool)

(assert (=> b!1564599 (= e!872040 (and e!872036 mapRes!59694))))

(declare-fun condMapEmpty!59694 () Bool)

(declare-datatypes ((ValueCell!18408 0))(
  ( (ValueCellFull!18408 (v!22274 V!60043)) (EmptyCell!18408) )
))
(declare-datatypes ((array!104444 0))(
  ( (array!104445 (arr!50413 (Array (_ BitVec 32) ValueCell!18408)) (size!50963 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104444)

(declare-fun mapDefault!59694 () ValueCell!18408)

(assert (=> b!1564599 (= condMapEmpty!59694 (= (arr!50413 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18408)) mapDefault!59694)))))

(declare-fun b!1564600 () Bool)

(declare-fun isEmpty!1142 (ListLongMap!22627) Bool)

(assert (=> b!1564600 (= e!872039 (not (isEmpty!1142 (ListLongMap!22628 Nil!36574))))))

(declare-fun mapNonEmpty!59694 () Bool)

(declare-fun tp!113619 () Bool)

(declare-fun e!872038 () Bool)

(assert (=> mapNonEmpty!59694 (= mapRes!59694 (and tp!113619 e!872038))))

(declare-fun mapKey!59694 () (_ BitVec 32))

(declare-fun mapRest!59694 () (Array (_ BitVec 32) ValueCell!18408))

(declare-fun mapValue!59694 () ValueCell!18408)

(assert (=> mapNonEmpty!59694 (= (arr!50413 _values!487) (store mapRest!59694 mapKey!59694 mapValue!59694))))

(declare-fun b!1564601 () Bool)

(declare-fun res!1069629 () Bool)

(assert (=> b!1564601 (=> (not res!1069629) (not e!872041))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104442 (_ BitVec 32)) Bool)

(assert (=> b!1564601 (= res!1069629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564602 () Bool)

(declare-fun res!1069631 () Bool)

(assert (=> b!1564602 (=> (not res!1069631) (not e!872041))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564602 (= res!1069631 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50962 _keys!637)) (bvsge from!782 (size!50962 _keys!637))))))

(declare-fun res!1069630 () Bool)

(assert (=> start!133804 (=> (not res!1069630) (not e!872041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133804 (= res!1069630 (validMask!0 mask!947))))

(assert (=> start!133804 e!872041))

(assert (=> start!133804 true))

(declare-fun array_inv!39179 (array!104442) Bool)

(assert (=> start!133804 (array_inv!39179 _keys!637)))

(declare-fun array_inv!39180 (array!104444) Bool)

(assert (=> start!133804 (and (array_inv!39180 _values!487) e!872040)))

(declare-fun b!1564603 () Bool)

(declare-fun tp_is_empty!38877 () Bool)

(assert (=> b!1564603 (= e!872038 tp_is_empty!38877)))

(declare-fun b!1564604 () Bool)

(declare-fun res!1069627 () Bool)

(assert (=> b!1564604 (=> (not res!1069627) (not e!872041))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564604 (= res!1069627 (and (= (size!50963 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50962 _keys!637) (size!50963 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564605 () Bool)

(assert (=> b!1564605 (= e!872036 tp_is_empty!38877)))

(declare-fun b!1564606 () Bool)

(declare-fun res!1069632 () Bool)

(assert (=> b!1564606 (=> res!1069632 e!872039)))

(assert (=> b!1564606 (= res!1069632 (contains!10319 (ListLongMap!22628 Nil!36574) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59694 () Bool)

(assert (=> mapIsEmpty!59694 mapRes!59694))

(assert (= (and start!133804 res!1069630) b!1564604))

(assert (= (and b!1564604 res!1069627) b!1564601))

(assert (= (and b!1564601 res!1069629) b!1564598))

(assert (= (and b!1564598 res!1069626) b!1564602))

(assert (= (and b!1564602 res!1069631) b!1564597))

(assert (= (and b!1564597 (not res!1069628)) b!1564606))

(assert (= (and b!1564606 (not res!1069632)) b!1564600))

(assert (= (and b!1564599 condMapEmpty!59694) mapIsEmpty!59694))

(assert (= (and b!1564599 (not condMapEmpty!59694)) mapNonEmpty!59694))

(get-info :version)

(assert (= (and mapNonEmpty!59694 ((_ is ValueCellFull!18408) mapValue!59694)) b!1564603))

(assert (= (and b!1564599 ((_ is ValueCellFull!18408) mapDefault!59694)) b!1564605))

(assert (= start!133804 b!1564599))

(declare-fun m!1439725 () Bool)

(assert (=> mapNonEmpty!59694 m!1439725))

(declare-fun m!1439727 () Bool)

(assert (=> b!1564606 m!1439727))

(declare-fun m!1439729 () Bool)

(assert (=> b!1564597 m!1439729))

(declare-fun m!1439731 () Bool)

(assert (=> b!1564598 m!1439731))

(declare-fun m!1439733 () Bool)

(assert (=> start!133804 m!1439733))

(declare-fun m!1439735 () Bool)

(assert (=> start!133804 m!1439735))

(declare-fun m!1439737 () Bool)

(assert (=> start!133804 m!1439737))

(declare-fun m!1439739 () Bool)

(assert (=> b!1564600 m!1439739))

(declare-fun m!1439741 () Bool)

(assert (=> b!1564601 m!1439741))

(check-sat (not b!1564606) tp_is_empty!38877 (not b!1564597) (not start!133804) (not mapNonEmpty!59694) (not b!1564598) (not b!1564601) (not b!1564600))
(check-sat)
(get-model)

(declare-fun d!163089 () Bool)

(assert (=> d!163089 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133804 d!163089))

(declare-fun d!163091 () Bool)

(assert (=> d!163091 (= (array_inv!39179 _keys!637) (bvsge (size!50962 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133804 d!163091))

(declare-fun d!163093 () Bool)

(assert (=> d!163093 (= (array_inv!39180 _values!487) (bvsge (size!50963 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133804 d!163093))

(declare-fun b!1564647 () Bool)

(declare-fun e!872070 () Bool)

(declare-fun call!71853 () Bool)

(assert (=> b!1564647 (= e!872070 call!71853)))

(declare-fun b!1564648 () Bool)

(declare-fun e!872071 () Bool)

(assert (=> b!1564648 (= e!872071 e!872070)))

(declare-fun c!144233 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564648 (= c!144233 (validKeyInArray!0 (select (arr!50412 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163095 () Bool)

(declare-fun res!1069661 () Bool)

(declare-fun e!872068 () Bool)

(assert (=> d!163095 (=> res!1069661 e!872068)))

(assert (=> d!163095 (= res!1069661 (bvsge #b00000000000000000000000000000000 (size!50962 _keys!637)))))

(assert (=> d!163095 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36575) e!872068)))

(declare-fun bm!71850 () Bool)

(assert (=> bm!71850 (= call!71853 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144233 (Cons!36574 (select (arr!50412 _keys!637) #b00000000000000000000000000000000) Nil!36575) Nil!36575)))))

(declare-fun b!1564649 () Bool)

(assert (=> b!1564649 (= e!872068 e!872071)))

(declare-fun res!1069662 () Bool)

(assert (=> b!1564649 (=> (not res!1069662) (not e!872071))))

(declare-fun e!872069 () Bool)

(assert (=> b!1564649 (= res!1069662 (not e!872069))))

(declare-fun res!1069660 () Bool)

(assert (=> b!1564649 (=> (not res!1069660) (not e!872069))))

(assert (=> b!1564649 (= res!1069660 (validKeyInArray!0 (select (arr!50412 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564650 () Bool)

(declare-fun contains!10321 (List!36578 (_ BitVec 64)) Bool)

(assert (=> b!1564650 (= e!872069 (contains!10321 Nil!36575 (select (arr!50412 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564651 () Bool)

(assert (=> b!1564651 (= e!872070 call!71853)))

(assert (= (and d!163095 (not res!1069661)) b!1564649))

(assert (= (and b!1564649 res!1069660) b!1564650))

(assert (= (and b!1564649 res!1069662) b!1564648))

(assert (= (and b!1564648 c!144233) b!1564647))

(assert (= (and b!1564648 (not c!144233)) b!1564651))

(assert (= (or b!1564647 b!1564651) bm!71850))

(declare-fun m!1439761 () Bool)

(assert (=> b!1564648 m!1439761))

(assert (=> b!1564648 m!1439761))

(declare-fun m!1439763 () Bool)

(assert (=> b!1564648 m!1439763))

(assert (=> bm!71850 m!1439761))

(declare-fun m!1439765 () Bool)

(assert (=> bm!71850 m!1439765))

(assert (=> b!1564649 m!1439761))

(assert (=> b!1564649 m!1439761))

(assert (=> b!1564649 m!1439763))

(assert (=> b!1564650 m!1439761))

(assert (=> b!1564650 m!1439761))

(declare-fun m!1439767 () Bool)

(assert (=> b!1564650 m!1439767))

(assert (=> b!1564598 d!163095))

(declare-fun d!163097 () Bool)

(declare-fun e!872077 () Bool)

(assert (=> d!163097 e!872077))

(declare-fun res!1069665 () Bool)

(assert (=> d!163097 (=> res!1069665 e!872077)))

(declare-fun lt!672060 () Bool)

(assert (=> d!163097 (= res!1069665 (not lt!672060))))

(declare-fun lt!672061 () Bool)

(assert (=> d!163097 (= lt!672060 lt!672061)))

(declare-datatypes ((Unit!51986 0))(
  ( (Unit!51987) )
))
(declare-fun lt!672062 () Unit!51986)

(declare-fun e!872076 () Unit!51986)

(assert (=> d!163097 (= lt!672062 e!872076)))

(declare-fun c!144236 () Bool)

(assert (=> d!163097 (= c!144236 lt!672061)))

(declare-fun containsKey!848 (List!36577 (_ BitVec 64)) Bool)

(assert (=> d!163097 (= lt!672061 (containsKey!848 (toList!11329 (ListLongMap!22628 Nil!36574)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163097 (= (contains!10319 (ListLongMap!22628 Nil!36574) #b1000000000000000000000000000000000000000000000000000000000000000) lt!672060)))

(declare-fun b!1564658 () Bool)

(declare-fun lt!672063 () Unit!51986)

(assert (=> b!1564658 (= e!872076 lt!672063)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!531 (List!36577 (_ BitVec 64)) Unit!51986)

(assert (=> b!1564658 (= lt!672063 (lemmaContainsKeyImpliesGetValueByKeyDefined!531 (toList!11329 (ListLongMap!22628 Nil!36574)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!866 0))(
  ( (Some!865 (v!22276 V!60043)) (None!864) )
))
(declare-fun isDefined!579 (Option!866) Bool)

(declare-fun getValueByKey!790 (List!36577 (_ BitVec 64)) Option!866)

(assert (=> b!1564658 (isDefined!579 (getValueByKey!790 (toList!11329 (ListLongMap!22628 Nil!36574)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564659 () Bool)

(declare-fun Unit!51988 () Unit!51986)

(assert (=> b!1564659 (= e!872076 Unit!51988)))

(declare-fun b!1564660 () Bool)

(assert (=> b!1564660 (= e!872077 (isDefined!579 (getValueByKey!790 (toList!11329 (ListLongMap!22628 Nil!36574)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163097 c!144236) b!1564658))

(assert (= (and d!163097 (not c!144236)) b!1564659))

(assert (= (and d!163097 (not res!1069665)) b!1564660))

(declare-fun m!1439769 () Bool)

(assert (=> d!163097 m!1439769))

(declare-fun m!1439771 () Bool)

(assert (=> b!1564658 m!1439771))

(declare-fun m!1439773 () Bool)

(assert (=> b!1564658 m!1439773))

(assert (=> b!1564658 m!1439773))

(declare-fun m!1439775 () Bool)

(assert (=> b!1564658 m!1439775))

(assert (=> b!1564660 m!1439773))

(assert (=> b!1564660 m!1439773))

(assert (=> b!1564660 m!1439775))

(assert (=> b!1564606 d!163097))

(declare-fun d!163099 () Bool)

(declare-fun e!872079 () Bool)

(assert (=> d!163099 e!872079))

(declare-fun res!1069666 () Bool)

(assert (=> d!163099 (=> res!1069666 e!872079)))

(declare-fun lt!672064 () Bool)

(assert (=> d!163099 (= res!1069666 (not lt!672064))))

(declare-fun lt!672065 () Bool)

(assert (=> d!163099 (= lt!672064 lt!672065)))

(declare-fun lt!672066 () Unit!51986)

(declare-fun e!872078 () Unit!51986)

(assert (=> d!163099 (= lt!672066 e!872078)))

(declare-fun c!144237 () Bool)

(assert (=> d!163099 (= c!144237 lt!672065)))

(assert (=> d!163099 (= lt!672065 (containsKey!848 (toList!11329 (ListLongMap!22628 Nil!36574)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!163099 (= (contains!10319 (ListLongMap!22628 Nil!36574) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672064)))

(declare-fun b!1564661 () Bool)

(declare-fun lt!672067 () Unit!51986)

(assert (=> b!1564661 (= e!872078 lt!672067)))

(assert (=> b!1564661 (= lt!672067 (lemmaContainsKeyImpliesGetValueByKeyDefined!531 (toList!11329 (ListLongMap!22628 Nil!36574)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1564661 (isDefined!579 (getValueByKey!790 (toList!11329 (ListLongMap!22628 Nil!36574)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564662 () Bool)

(declare-fun Unit!51989 () Unit!51986)

(assert (=> b!1564662 (= e!872078 Unit!51989)))

(declare-fun b!1564663 () Bool)

(assert (=> b!1564663 (= e!872079 (isDefined!579 (getValueByKey!790 (toList!11329 (ListLongMap!22628 Nil!36574)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!163099 c!144237) b!1564661))

(assert (= (and d!163099 (not c!144237)) b!1564662))

(assert (= (and d!163099 (not res!1069666)) b!1564663))

(declare-fun m!1439777 () Bool)

(assert (=> d!163099 m!1439777))

(declare-fun m!1439779 () Bool)

(assert (=> b!1564661 m!1439779))

(declare-fun m!1439781 () Bool)

(assert (=> b!1564661 m!1439781))

(assert (=> b!1564661 m!1439781))

(declare-fun m!1439783 () Bool)

(assert (=> b!1564661 m!1439783))

(assert (=> b!1564663 m!1439781))

(assert (=> b!1564663 m!1439781))

(assert (=> b!1564663 m!1439783))

(assert (=> b!1564597 d!163099))

(declare-fun b!1564672 () Bool)

(declare-fun e!872087 () Bool)

(declare-fun e!872086 () Bool)

(assert (=> b!1564672 (= e!872087 e!872086)))

(declare-fun lt!672076 () (_ BitVec 64))

(assert (=> b!1564672 (= lt!672076 (select (arr!50412 _keys!637) #b00000000000000000000000000000000))))

(declare-fun lt!672074 () Unit!51986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104442 (_ BitVec 64) (_ BitVec 32)) Unit!51986)

(assert (=> b!1564672 (= lt!672074 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672076 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1564672 (arrayContainsKey!0 _keys!637 lt!672076 #b00000000000000000000000000000000)))

(declare-fun lt!672075 () Unit!51986)

(assert (=> b!1564672 (= lt!672075 lt!672074)))

(declare-fun res!1069671 () Bool)

(declare-datatypes ((SeekEntryResult!13522 0))(
  ( (MissingZero!13522 (index!56486 (_ BitVec 32))) (Found!13522 (index!56487 (_ BitVec 32))) (Intermediate!13522 (undefined!14334 Bool) (index!56488 (_ BitVec 32)) (x!140528 (_ BitVec 32))) (Undefined!13522) (MissingVacant!13522 (index!56489 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104442 (_ BitVec 32)) SeekEntryResult!13522)

(assert (=> b!1564672 (= res!1069671 (= (seekEntryOrOpen!0 (select (arr!50412 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13522 #b00000000000000000000000000000000)))))

(assert (=> b!1564672 (=> (not res!1069671) (not e!872086))))

(declare-fun b!1564673 () Bool)

(declare-fun call!71856 () Bool)

(assert (=> b!1564673 (= e!872087 call!71856)))

(declare-fun b!1564674 () Bool)

(assert (=> b!1564674 (= e!872086 call!71856)))

(declare-fun bm!71853 () Bool)

(assert (=> bm!71853 (= call!71856 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1564675 () Bool)

(declare-fun e!872088 () Bool)

(assert (=> b!1564675 (= e!872088 e!872087)))

(declare-fun c!144240 () Bool)

(assert (=> b!1564675 (= c!144240 (validKeyInArray!0 (select (arr!50412 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163101 () Bool)

(declare-fun res!1069672 () Bool)

(assert (=> d!163101 (=> res!1069672 e!872088)))

(assert (=> d!163101 (= res!1069672 (bvsge #b00000000000000000000000000000000 (size!50962 _keys!637)))))

(assert (=> d!163101 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!872088)))

(assert (= (and d!163101 (not res!1069672)) b!1564675))

(assert (= (and b!1564675 c!144240) b!1564672))

(assert (= (and b!1564675 (not c!144240)) b!1564673))

(assert (= (and b!1564672 res!1069671) b!1564674))

(assert (= (or b!1564674 b!1564673) bm!71853))

(assert (=> b!1564672 m!1439761))

(declare-fun m!1439785 () Bool)

(assert (=> b!1564672 m!1439785))

(declare-fun m!1439787 () Bool)

(assert (=> b!1564672 m!1439787))

(assert (=> b!1564672 m!1439761))

(declare-fun m!1439789 () Bool)

(assert (=> b!1564672 m!1439789))

(declare-fun m!1439791 () Bool)

(assert (=> bm!71853 m!1439791))

(assert (=> b!1564675 m!1439761))

(assert (=> b!1564675 m!1439761))

(assert (=> b!1564675 m!1439763))

(assert (=> b!1564601 d!163101))

(declare-fun d!163103 () Bool)

(declare-fun isEmpty!1143 (List!36577) Bool)

(assert (=> d!163103 (= (isEmpty!1142 (ListLongMap!22628 Nil!36574)) (isEmpty!1143 (toList!11329 (ListLongMap!22628 Nil!36574))))))

(declare-fun bs!45023 () Bool)

(assert (= bs!45023 d!163103))

(declare-fun m!1439793 () Bool)

(assert (=> bs!45023 m!1439793))

(assert (=> b!1564600 d!163103))

(declare-fun condMapEmpty!59700 () Bool)

(declare-fun mapDefault!59700 () ValueCell!18408)

(assert (=> mapNonEmpty!59694 (= condMapEmpty!59700 (= mapRest!59694 ((as const (Array (_ BitVec 32) ValueCell!18408)) mapDefault!59700)))))

(declare-fun e!872094 () Bool)

(declare-fun mapRes!59700 () Bool)

(assert (=> mapNonEmpty!59694 (= tp!113619 (and e!872094 mapRes!59700))))

(declare-fun b!1564683 () Bool)

(assert (=> b!1564683 (= e!872094 tp_is_empty!38877)))

(declare-fun b!1564682 () Bool)

(declare-fun e!872093 () Bool)

(assert (=> b!1564682 (= e!872093 tp_is_empty!38877)))

(declare-fun mapIsEmpty!59700 () Bool)

(assert (=> mapIsEmpty!59700 mapRes!59700))

(declare-fun mapNonEmpty!59700 () Bool)

(declare-fun tp!113625 () Bool)

(assert (=> mapNonEmpty!59700 (= mapRes!59700 (and tp!113625 e!872093))))

(declare-fun mapValue!59700 () ValueCell!18408)

(declare-fun mapRest!59700 () (Array (_ BitVec 32) ValueCell!18408))

(declare-fun mapKey!59700 () (_ BitVec 32))

(assert (=> mapNonEmpty!59700 (= mapRest!59694 (store mapRest!59700 mapKey!59700 mapValue!59700))))

(assert (= (and mapNonEmpty!59694 condMapEmpty!59700) mapIsEmpty!59700))

(assert (= (and mapNonEmpty!59694 (not condMapEmpty!59700)) mapNonEmpty!59700))

(assert (= (and mapNonEmpty!59700 ((_ is ValueCellFull!18408) mapValue!59700)) b!1564682))

(assert (= (and mapNonEmpty!59694 ((_ is ValueCellFull!18408) mapDefault!59700)) b!1564683))

(declare-fun m!1439795 () Bool)

(assert (=> mapNonEmpty!59700 m!1439795))

(check-sat (not b!1564650) (not d!163103) (not b!1564649) (not b!1564675) (not b!1564661) (not b!1564663) (not d!163099) (not d!163097) (not b!1564660) tp_is_empty!38877 (not mapNonEmpty!59700) (not bm!71850) (not b!1564672) (not b!1564648) (not b!1564658) (not bm!71853))
(check-sat)
(get-model)

(declare-fun d!163105 () Bool)

(assert (=> d!163105 (isDefined!579 (getValueByKey!790 (toList!11329 (ListLongMap!22628 Nil!36574)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672079 () Unit!51986)

(declare-fun choose!2073 (List!36577 (_ BitVec 64)) Unit!51986)

(assert (=> d!163105 (= lt!672079 (choose!2073 (toList!11329 (ListLongMap!22628 Nil!36574)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!872097 () Bool)

(assert (=> d!163105 e!872097))

(declare-fun res!1069675 () Bool)

(assert (=> d!163105 (=> (not res!1069675) (not e!872097))))

(declare-fun isStrictlySorted!985 (List!36577) Bool)

(assert (=> d!163105 (= res!1069675 (isStrictlySorted!985 (toList!11329 (ListLongMap!22628 Nil!36574))))))

(assert (=> d!163105 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!531 (toList!11329 (ListLongMap!22628 Nil!36574)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!672079)))

(declare-fun b!1564686 () Bool)

(assert (=> b!1564686 (= e!872097 (containsKey!848 (toList!11329 (ListLongMap!22628 Nil!36574)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163105 res!1069675) b!1564686))

(assert (=> d!163105 m!1439773))

(assert (=> d!163105 m!1439773))

(assert (=> d!163105 m!1439775))

(declare-fun m!1439797 () Bool)

(assert (=> d!163105 m!1439797))

(declare-fun m!1439799 () Bool)

(assert (=> d!163105 m!1439799))

(assert (=> b!1564686 m!1439769))

(assert (=> b!1564658 d!163105))

(declare-fun d!163107 () Bool)

(assert (=> d!163107 (= (isDefined!579 (getValueByKey!790 (toList!11329 (ListLongMap!22628 Nil!36574)) #b1000000000000000000000000000000000000000000000000000000000000000)) false)))

(assert (=> b!1564658 d!163107))

(declare-fun d!163109 () Bool)

(assert (=> d!163109 (= (getValueByKey!790 (toList!11329 (ListLongMap!22628 Nil!36574)) #b1000000000000000000000000000000000000000000000000000000000000000) None!864)))

(assert (=> b!1564658 d!163109))

(declare-fun d!163111 () Bool)

(assert (=> d!163111 (= (isEmpty!1143 (toList!11329 (ListLongMap!22628 Nil!36574))) true)))

(assert (=> d!163103 d!163111))

(declare-fun b!1564687 () Bool)

(declare-fun e!872099 () Bool)

(declare-fun e!872098 () Bool)

(assert (=> b!1564687 (= e!872099 e!872098)))

(declare-fun lt!672082 () (_ BitVec 64))

(assert (=> b!1564687 (= lt!672082 (select (arr!50412 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!672080 () Unit!51986)

(assert (=> b!1564687 (= lt!672080 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672082 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1564687 (arrayContainsKey!0 _keys!637 lt!672082 #b00000000000000000000000000000000)))

(declare-fun lt!672081 () Unit!51986)

(assert (=> b!1564687 (= lt!672081 lt!672080)))

(declare-fun res!1069676 () Bool)

(assert (=> b!1564687 (= res!1069676 (= (seekEntryOrOpen!0 (select (arr!50412 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!637 mask!947) (Found!13522 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1564687 (=> (not res!1069676) (not e!872098))))

(declare-fun b!1564688 () Bool)

(declare-fun call!71857 () Bool)

(assert (=> b!1564688 (= e!872099 call!71857)))

(declare-fun b!1564689 () Bool)

(assert (=> b!1564689 (= e!872098 call!71857)))

(declare-fun bm!71854 () Bool)

(assert (=> bm!71854 (= call!71857 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1564690 () Bool)

(declare-fun e!872100 () Bool)

(assert (=> b!1564690 (= e!872100 e!872099)))

(declare-fun c!144241 () Bool)

(assert (=> b!1564690 (= c!144241 (validKeyInArray!0 (select (arr!50412 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!163113 () Bool)

(declare-fun res!1069677 () Bool)

(assert (=> d!163113 (=> res!1069677 e!872100)))

(assert (=> d!163113 (= res!1069677 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50962 _keys!637)))))

(assert (=> d!163113 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947) e!872100)))

(assert (= (and d!163113 (not res!1069677)) b!1564690))

(assert (= (and b!1564690 c!144241) b!1564687))

(assert (= (and b!1564690 (not c!144241)) b!1564688))

(assert (= (and b!1564687 res!1069676) b!1564689))

(assert (= (or b!1564689 b!1564688) bm!71854))

(declare-fun m!1439801 () Bool)

(assert (=> b!1564687 m!1439801))

(declare-fun m!1439803 () Bool)

(assert (=> b!1564687 m!1439803))

(declare-fun m!1439805 () Bool)

(assert (=> b!1564687 m!1439805))

(assert (=> b!1564687 m!1439801))

(declare-fun m!1439807 () Bool)

(assert (=> b!1564687 m!1439807))

(declare-fun m!1439809 () Bool)

(assert (=> bm!71854 m!1439809))

(assert (=> b!1564690 m!1439801))

(assert (=> b!1564690 m!1439801))

(declare-fun m!1439811 () Bool)

(assert (=> b!1564690 m!1439811))

(assert (=> bm!71853 d!163113))

(declare-fun d!163115 () Bool)

(assert (=> d!163115 (= (validKeyInArray!0 (select (arr!50412 _keys!637) #b00000000000000000000000000000000)) (and (not (= (select (arr!50412 _keys!637) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50412 _keys!637) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1564675 d!163115))

(declare-fun d!163117 () Bool)

(assert (=> d!163117 (= (containsKey!848 (toList!11329 (ListLongMap!22628 Nil!36574)) #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> d!163097 d!163117))

(declare-fun d!163119 () Bool)

(declare-fun lt!672085 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!809 (List!36578) (InoxSet (_ BitVec 64)))

(assert (=> d!163119 (= lt!672085 (select (content!809 Nil!36575) (select (arr!50412 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun e!872106 () Bool)

(assert (=> d!163119 (= lt!672085 e!872106)))

(declare-fun res!1069682 () Bool)

(assert (=> d!163119 (=> (not res!1069682) (not e!872106))))

(assert (=> d!163119 (= res!1069682 ((_ is Cons!36574) Nil!36575))))

(assert (=> d!163119 (= (contains!10321 Nil!36575 (select (arr!50412 _keys!637) #b00000000000000000000000000000000)) lt!672085)))

(declare-fun b!1564695 () Bool)

(declare-fun e!872105 () Bool)

(assert (=> b!1564695 (= e!872106 e!872105)))

(declare-fun res!1069683 () Bool)

(assert (=> b!1564695 (=> res!1069683 e!872105)))

(assert (=> b!1564695 (= res!1069683 (= (h!38020 Nil!36575) (select (arr!50412 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564696 () Bool)

(assert (=> b!1564696 (= e!872105 (contains!10321 (t!51425 Nil!36575) (select (arr!50412 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163119 res!1069682) b!1564695))

(assert (= (and b!1564695 (not res!1069683)) b!1564696))

(declare-fun m!1439813 () Bool)

(assert (=> d!163119 m!1439813))

(assert (=> d!163119 m!1439761))

(declare-fun m!1439815 () Bool)

(assert (=> d!163119 m!1439815))

(assert (=> b!1564696 m!1439761))

(declare-fun m!1439817 () Bool)

(assert (=> b!1564696 m!1439817))

(assert (=> b!1564650 d!163119))

(declare-fun b!1564697 () Bool)

(declare-fun e!872109 () Bool)

(declare-fun call!71858 () Bool)

(assert (=> b!1564697 (= e!872109 call!71858)))

(declare-fun b!1564698 () Bool)

(declare-fun e!872110 () Bool)

(assert (=> b!1564698 (= e!872110 e!872109)))

(declare-fun c!144242 () Bool)

(assert (=> b!1564698 (= c!144242 (validKeyInArray!0 (select (arr!50412 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!163121 () Bool)

(declare-fun res!1069685 () Bool)

(declare-fun e!872107 () Bool)

(assert (=> d!163121 (=> res!1069685 e!872107)))

(assert (=> d!163121 (= res!1069685 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50962 _keys!637)))))

(assert (=> d!163121 (= (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!144233 (Cons!36574 (select (arr!50412 _keys!637) #b00000000000000000000000000000000) Nil!36575) Nil!36575)) e!872107)))

(declare-fun bm!71855 () Bool)

(assert (=> bm!71855 (= call!71858 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!144242 (Cons!36574 (select (arr!50412 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!144233 (Cons!36574 (select (arr!50412 _keys!637) #b00000000000000000000000000000000) Nil!36575) Nil!36575)) (ite c!144233 (Cons!36574 (select (arr!50412 _keys!637) #b00000000000000000000000000000000) Nil!36575) Nil!36575))))))

(declare-fun b!1564699 () Bool)

(assert (=> b!1564699 (= e!872107 e!872110)))

(declare-fun res!1069686 () Bool)

(assert (=> b!1564699 (=> (not res!1069686) (not e!872110))))

(declare-fun e!872108 () Bool)

(assert (=> b!1564699 (= res!1069686 (not e!872108))))

(declare-fun res!1069684 () Bool)

(assert (=> b!1564699 (=> (not res!1069684) (not e!872108))))

(assert (=> b!1564699 (= res!1069684 (validKeyInArray!0 (select (arr!50412 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1564700 () Bool)

(assert (=> b!1564700 (= e!872108 (contains!10321 (ite c!144233 (Cons!36574 (select (arr!50412 _keys!637) #b00000000000000000000000000000000) Nil!36575) Nil!36575) (select (arr!50412 _keys!637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1564701 () Bool)

(assert (=> b!1564701 (= e!872109 call!71858)))

(assert (= (and d!163121 (not res!1069685)) b!1564699))

(assert (= (and b!1564699 res!1069684) b!1564700))

(assert (= (and b!1564699 res!1069686) b!1564698))

(assert (= (and b!1564698 c!144242) b!1564697))

(assert (= (and b!1564698 (not c!144242)) b!1564701))

(assert (= (or b!1564697 b!1564701) bm!71855))

(assert (=> b!1564698 m!1439801))

(assert (=> b!1564698 m!1439801))

(assert (=> b!1564698 m!1439811))

(assert (=> bm!71855 m!1439801))

(declare-fun m!1439819 () Bool)

(assert (=> bm!71855 m!1439819))

(assert (=> b!1564699 m!1439801))

(assert (=> b!1564699 m!1439801))

(assert (=> b!1564699 m!1439811))

(assert (=> b!1564700 m!1439801))

(assert (=> b!1564700 m!1439801))

(declare-fun m!1439821 () Bool)

(assert (=> b!1564700 m!1439821))

(assert (=> bm!71850 d!163121))

(assert (=> b!1564649 d!163115))

(declare-fun d!163123 () Bool)

(assert (=> d!163123 (arrayContainsKey!0 _keys!637 lt!672076 #b00000000000000000000000000000000)))

(declare-fun lt!672088 () Unit!51986)

(declare-fun choose!13 (array!104442 (_ BitVec 64) (_ BitVec 32)) Unit!51986)

(assert (=> d!163123 (= lt!672088 (choose!13 _keys!637 lt!672076 #b00000000000000000000000000000000))))

(assert (=> d!163123 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!163123 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672076 #b00000000000000000000000000000000) lt!672088)))

(declare-fun bs!45024 () Bool)

(assert (= bs!45024 d!163123))

(assert (=> bs!45024 m!1439787))

(declare-fun m!1439823 () Bool)

(assert (=> bs!45024 m!1439823))

(assert (=> b!1564672 d!163123))

(declare-fun d!163125 () Bool)

(declare-fun res!1069691 () Bool)

(declare-fun e!872115 () Bool)

(assert (=> d!163125 (=> res!1069691 e!872115)))

(assert (=> d!163125 (= res!1069691 (= (select (arr!50412 _keys!637) #b00000000000000000000000000000000) lt!672076))))

(assert (=> d!163125 (= (arrayContainsKey!0 _keys!637 lt!672076 #b00000000000000000000000000000000) e!872115)))

(declare-fun b!1564706 () Bool)

(declare-fun e!872116 () Bool)

(assert (=> b!1564706 (= e!872115 e!872116)))

(declare-fun res!1069692 () Bool)

(assert (=> b!1564706 (=> (not res!1069692) (not e!872116))))

(assert (=> b!1564706 (= res!1069692 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!50962 _keys!637)))))

(declare-fun b!1564707 () Bool)

(assert (=> b!1564707 (= e!872116 (arrayContainsKey!0 _keys!637 lt!672076 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!163125 (not res!1069691)) b!1564706))

(assert (= (and b!1564706 res!1069692) b!1564707))

(assert (=> d!163125 m!1439761))

(declare-fun m!1439825 () Bool)

(assert (=> b!1564707 m!1439825))

(assert (=> b!1564672 d!163125))

(declare-fun b!1564720 () Bool)

(declare-fun e!872123 () SeekEntryResult!13522)

(assert (=> b!1564720 (= e!872123 Undefined!13522)))

(declare-fun d!163127 () Bool)

(declare-fun lt!672095 () SeekEntryResult!13522)

(assert (=> d!163127 (and (or ((_ is Undefined!13522) lt!672095) (not ((_ is Found!13522) lt!672095)) (and (bvsge (index!56487 lt!672095) #b00000000000000000000000000000000) (bvslt (index!56487 lt!672095) (size!50962 _keys!637)))) (or ((_ is Undefined!13522) lt!672095) ((_ is Found!13522) lt!672095) (not ((_ is MissingZero!13522) lt!672095)) (and (bvsge (index!56486 lt!672095) #b00000000000000000000000000000000) (bvslt (index!56486 lt!672095) (size!50962 _keys!637)))) (or ((_ is Undefined!13522) lt!672095) ((_ is Found!13522) lt!672095) ((_ is MissingZero!13522) lt!672095) (not ((_ is MissingVacant!13522) lt!672095)) (and (bvsge (index!56489 lt!672095) #b00000000000000000000000000000000) (bvslt (index!56489 lt!672095) (size!50962 _keys!637)))) (or ((_ is Undefined!13522) lt!672095) (ite ((_ is Found!13522) lt!672095) (= (select (arr!50412 _keys!637) (index!56487 lt!672095)) (select (arr!50412 _keys!637) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!13522) lt!672095) (= (select (arr!50412 _keys!637) (index!56486 lt!672095)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13522) lt!672095) (= (select (arr!50412 _keys!637) (index!56489 lt!672095)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!163127 (= lt!672095 e!872123)))

(declare-fun c!144251 () Bool)

(declare-fun lt!672096 () SeekEntryResult!13522)

(assert (=> d!163127 (= c!144251 (and ((_ is Intermediate!13522) lt!672096) (undefined!14334 lt!672096)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104442 (_ BitVec 32)) SeekEntryResult!13522)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!163127 (= lt!672096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!50412 _keys!637) #b00000000000000000000000000000000) mask!947) (select (arr!50412 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(assert (=> d!163127 (validMask!0 mask!947)))

(assert (=> d!163127 (= (seekEntryOrOpen!0 (select (arr!50412 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) lt!672095)))

(declare-fun b!1564721 () Bool)

(declare-fun e!872125 () SeekEntryResult!13522)

(assert (=> b!1564721 (= e!872125 (MissingZero!13522 (index!56488 lt!672096)))))

(declare-fun b!1564722 () Bool)

(declare-fun e!872124 () SeekEntryResult!13522)

(assert (=> b!1564722 (= e!872124 (Found!13522 (index!56488 lt!672096)))))

(declare-fun b!1564723 () Bool)

(assert (=> b!1564723 (= e!872123 e!872124)))

(declare-fun lt!672097 () (_ BitVec 64))

(assert (=> b!1564723 (= lt!672097 (select (arr!50412 _keys!637) (index!56488 lt!672096)))))

(declare-fun c!144250 () Bool)

(assert (=> b!1564723 (= c!144250 (= lt!672097 (select (arr!50412 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1564724 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104442 (_ BitVec 32)) SeekEntryResult!13522)

(assert (=> b!1564724 (= e!872125 (seekKeyOrZeroReturnVacant!0 (x!140528 lt!672096) (index!56488 lt!672096) (index!56488 lt!672096) (select (arr!50412 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947))))

(declare-fun b!1564725 () Bool)

(declare-fun c!144249 () Bool)

(assert (=> b!1564725 (= c!144249 (= lt!672097 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1564725 (= e!872124 e!872125)))

(assert (= (and d!163127 c!144251) b!1564720))

(assert (= (and d!163127 (not c!144251)) b!1564723))

(assert (= (and b!1564723 c!144250) b!1564722))

(assert (= (and b!1564723 (not c!144250)) b!1564725))

(assert (= (and b!1564725 c!144249) b!1564721))

(assert (= (and b!1564725 (not c!144249)) b!1564724))

(declare-fun m!1439827 () Bool)

(assert (=> d!163127 m!1439827))

(assert (=> d!163127 m!1439761))

(declare-fun m!1439829 () Bool)

(assert (=> d!163127 m!1439829))

(assert (=> d!163127 m!1439733))

(assert (=> d!163127 m!1439829))

(assert (=> d!163127 m!1439761))

(declare-fun m!1439831 () Bool)

(assert (=> d!163127 m!1439831))

(declare-fun m!1439833 () Bool)

(assert (=> d!163127 m!1439833))

(declare-fun m!1439835 () Bool)

(assert (=> d!163127 m!1439835))

(declare-fun m!1439837 () Bool)

(assert (=> b!1564723 m!1439837))

(assert (=> b!1564724 m!1439761))

(declare-fun m!1439839 () Bool)

(assert (=> b!1564724 m!1439839))

(assert (=> b!1564672 d!163127))

(assert (=> b!1564648 d!163115))

(assert (=> b!1564660 d!163107))

(assert (=> b!1564660 d!163109))

(declare-fun d!163129 () Bool)

(assert (=> d!163129 (= (isDefined!579 (getValueByKey!790 (toList!11329 (ListLongMap!22628 Nil!36574)) #b0000000000000000000000000000000000000000000000000000000000000000)) false)))

(assert (=> b!1564663 d!163129))

(declare-fun d!163131 () Bool)

(assert (=> d!163131 (= (getValueByKey!790 (toList!11329 (ListLongMap!22628 Nil!36574)) #b0000000000000000000000000000000000000000000000000000000000000000) None!864)))

(assert (=> b!1564663 d!163131))

(declare-fun d!163133 () Bool)

(assert (=> d!163133 (isDefined!579 (getValueByKey!790 (toList!11329 (ListLongMap!22628 Nil!36574)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672098 () Unit!51986)

(assert (=> d!163133 (= lt!672098 (choose!2073 (toList!11329 (ListLongMap!22628 Nil!36574)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!872126 () Bool)

(assert (=> d!163133 e!872126))

(declare-fun res!1069693 () Bool)

(assert (=> d!163133 (=> (not res!1069693) (not e!872126))))

(assert (=> d!163133 (= res!1069693 (isStrictlySorted!985 (toList!11329 (ListLongMap!22628 Nil!36574))))))

(assert (=> d!163133 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!531 (toList!11329 (ListLongMap!22628 Nil!36574)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!672098)))

(declare-fun b!1564726 () Bool)

(assert (=> b!1564726 (= e!872126 (containsKey!848 (toList!11329 (ListLongMap!22628 Nil!36574)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!163133 res!1069693) b!1564726))

(assert (=> d!163133 m!1439781))

(assert (=> d!163133 m!1439781))

(assert (=> d!163133 m!1439783))

(declare-fun m!1439841 () Bool)

(assert (=> d!163133 m!1439841))

(assert (=> d!163133 m!1439799))

(assert (=> b!1564726 m!1439777))

(assert (=> b!1564661 d!163133))

(assert (=> b!1564661 d!163129))

(assert (=> b!1564661 d!163131))

(declare-fun d!163135 () Bool)

(assert (=> d!163135 (= (containsKey!848 (toList!11329 (ListLongMap!22628 Nil!36574)) #b0000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> d!163099 d!163135))

(declare-fun condMapEmpty!59701 () Bool)

(declare-fun mapDefault!59701 () ValueCell!18408)

(assert (=> mapNonEmpty!59700 (= condMapEmpty!59701 (= mapRest!59700 ((as const (Array (_ BitVec 32) ValueCell!18408)) mapDefault!59701)))))

(declare-fun e!872128 () Bool)

(declare-fun mapRes!59701 () Bool)

(assert (=> mapNonEmpty!59700 (= tp!113625 (and e!872128 mapRes!59701))))

(declare-fun b!1564728 () Bool)

(assert (=> b!1564728 (= e!872128 tp_is_empty!38877)))

(declare-fun b!1564727 () Bool)

(declare-fun e!872127 () Bool)

(assert (=> b!1564727 (= e!872127 tp_is_empty!38877)))

(declare-fun mapIsEmpty!59701 () Bool)

(assert (=> mapIsEmpty!59701 mapRes!59701))

(declare-fun mapNonEmpty!59701 () Bool)

(declare-fun tp!113626 () Bool)

(assert (=> mapNonEmpty!59701 (= mapRes!59701 (and tp!113626 e!872127))))

(declare-fun mapRest!59701 () (Array (_ BitVec 32) ValueCell!18408))

(declare-fun mapValue!59701 () ValueCell!18408)

(declare-fun mapKey!59701 () (_ BitVec 32))

(assert (=> mapNonEmpty!59701 (= mapRest!59700 (store mapRest!59701 mapKey!59701 mapValue!59701))))

(assert (= (and mapNonEmpty!59700 condMapEmpty!59701) mapIsEmpty!59701))

(assert (= (and mapNonEmpty!59700 (not condMapEmpty!59701)) mapNonEmpty!59701))

(assert (= (and mapNonEmpty!59701 ((_ is ValueCellFull!18408) mapValue!59701)) b!1564727))

(assert (= (and mapNonEmpty!59700 ((_ is ValueCellFull!18408) mapDefault!59701)) b!1564728))

(declare-fun m!1439843 () Bool)

(assert (=> mapNonEmpty!59701 m!1439843))

(check-sat (not mapNonEmpty!59701) tp_is_empty!38877 (not d!163123) (not b!1564700) (not b!1564707) (not d!163105) (not b!1564686) (not bm!71855) (not b!1564726) (not bm!71854) (not b!1564696) (not b!1564698) (not b!1564724) (not d!163127) (not b!1564699) (not d!163133) (not d!163119) (not b!1564690) (not b!1564687))
(check-sat)
