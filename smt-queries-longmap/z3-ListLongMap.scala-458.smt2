; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8362 () Bool)

(assert start!8362)

(declare-fun b!55959 () Bool)

(declare-fun b_free!1889 () Bool)

(declare-fun b_next!1889 () Bool)

(assert (=> b!55959 (= b_free!1889 (not b_next!1889))))

(declare-fun tp!7770 () Bool)

(declare-fun b_and!3319 () Bool)

(assert (=> b!55959 (= tp!7770 b_and!3319)))

(declare-fun b!55970 () Bool)

(declare-fun b_free!1891 () Bool)

(declare-fun b_next!1891 () Bool)

(assert (=> b!55970 (= b_free!1891 (not b_next!1891))))

(declare-fun tp!7769 () Bool)

(declare-fun b_and!3321 () Bool)

(assert (=> b!55970 (= tp!7769 b_and!3321)))

(declare-fun b!55955 () Bool)

(declare-fun res!31494 () Bool)

(declare-fun e!36809 () Bool)

(assert (=> b!55955 (=> (not res!31494) (not e!36809))))

(declare-datatypes ((V!2795 0))(
  ( (V!2796 (val!1225 Int)) )
))
(declare-datatypes ((array!3645 0))(
  ( (array!3646 (arr!1745 (Array (_ BitVec 32) (_ BitVec 64))) (size!1974 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!837 0))(
  ( (ValueCellFull!837 (v!2336 V!2795)) (EmptyCell!837) )
))
(declare-datatypes ((array!3647 0))(
  ( (array!3648 (arr!1746 (Array (_ BitVec 32) ValueCell!837)) (size!1975 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!582 0))(
  ( (LongMapFixedSize!583 (defaultEntry!2005 Int) (mask!5868 (_ BitVec 32)) (extraKeys!1896 (_ BitVec 32)) (zeroValue!1923 V!2795) (minValue!1923 V!2795) (_size!340 (_ BitVec 32)) (_keys!3625 array!3645) (_values!1988 array!3647) (_vacant!340 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!582)

(declare-datatypes ((Cell!398 0))(
  ( (Cell!399 (v!2337 LongMapFixedSize!582)) )
))
(declare-datatypes ((LongMap!398 0))(
  ( (LongMap!399 (underlying!210 Cell!398)) )
))
(declare-fun thiss!992 () LongMap!398)

(assert (=> b!55955 (= res!31494 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5868 newMap!16)) (_size!340 (v!2337 (underlying!210 thiss!992)))))))

(declare-fun mapIsEmpty!2753 () Bool)

(declare-fun mapRes!2754 () Bool)

(assert (=> mapIsEmpty!2753 mapRes!2754))

(declare-fun b!55956 () Bool)

(declare-fun e!36812 () Bool)

(assert (=> b!55956 (= e!36812 true)))

(declare-datatypes ((List!1405 0))(
  ( (Nil!1402) (Cons!1401 (h!1981 (_ BitVec 64)) (t!4663 List!1405)) )
))
(declare-fun lt!22109 () List!1405)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!22106 () Bool)

(declare-fun contains!663 (List!1405 (_ BitVec 64)) Bool)

(assert (=> b!55956 (= lt!22106 (contains!663 lt!22109 (select (arr!1745 (_keys!3625 (v!2337 (underlying!210 thiss!992)))) from!355)))))

(declare-fun b!55957 () Bool)

(declare-fun e!36802 () Bool)

(declare-fun tp_is_empty!2361 () Bool)

(assert (=> b!55957 (= e!36802 tp_is_empty!2361)))

(declare-fun mapNonEmpty!2753 () Bool)

(declare-fun tp!7768 () Bool)

(declare-fun e!36801 () Bool)

(assert (=> mapNonEmpty!2753 (= mapRes!2754 (and tp!7768 e!36801))))

(declare-fun mapKey!2753 () (_ BitVec 32))

(declare-fun mapValue!2753 () ValueCell!837)

(declare-fun mapRest!2754 () (Array (_ BitVec 32) ValueCell!837))

(assert (=> mapNonEmpty!2753 (= (arr!1746 (_values!1988 (v!2337 (underlying!210 thiss!992)))) (store mapRest!2754 mapKey!2753 mapValue!2753))))

(declare-fun b!55958 () Bool)

(declare-fun e!36808 () Bool)

(declare-fun e!36800 () Bool)

(assert (=> b!55958 (= e!36808 e!36800)))

(declare-fun e!36814 () Bool)

(declare-fun e!36815 () Bool)

(declare-fun array_inv!1079 (array!3645) Bool)

(declare-fun array_inv!1080 (array!3647) Bool)

(assert (=> b!55959 (= e!36815 (and tp!7770 tp_is_empty!2361 (array_inv!1079 (_keys!3625 (v!2337 (underlying!210 thiss!992)))) (array_inv!1080 (_values!1988 (v!2337 (underlying!210 thiss!992)))) e!36814))))

(declare-fun b!55960 () Bool)

(declare-fun e!36806 () Bool)

(declare-fun e!36813 () Bool)

(declare-fun mapRes!2753 () Bool)

(assert (=> b!55960 (= e!36806 (and e!36813 mapRes!2753))))

(declare-fun condMapEmpty!2754 () Bool)

(declare-fun mapDefault!2753 () ValueCell!837)

(assert (=> b!55960 (= condMapEmpty!2754 (= (arr!1746 (_values!1988 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!837)) mapDefault!2753)))))

(declare-fun mapIsEmpty!2754 () Bool)

(assert (=> mapIsEmpty!2754 mapRes!2753))

(declare-fun b!55961 () Bool)

(assert (=> b!55961 (= e!36800 e!36815)))

(declare-fun mapNonEmpty!2754 () Bool)

(declare-fun tp!7767 () Bool)

(assert (=> mapNonEmpty!2754 (= mapRes!2753 (and tp!7767 e!36802))))

(declare-fun mapKey!2754 () (_ BitVec 32))

(declare-fun mapRest!2753 () (Array (_ BitVec 32) ValueCell!837))

(declare-fun mapValue!2754 () ValueCell!837)

(assert (=> mapNonEmpty!2754 (= (arr!1746 (_values!1988 newMap!16)) (store mapRest!2753 mapKey!2754 mapValue!2754))))

(declare-fun res!31496 () Bool)

(assert (=> start!8362 (=> (not res!31496) (not e!36809))))

(declare-fun valid!234 (LongMap!398) Bool)

(assert (=> start!8362 (= res!31496 (valid!234 thiss!992))))

(assert (=> start!8362 e!36809))

(assert (=> start!8362 e!36808))

(assert (=> start!8362 true))

(declare-fun e!36807 () Bool)

(assert (=> start!8362 e!36807))

(declare-fun b!55962 () Bool)

(declare-fun e!36811 () Bool)

(assert (=> b!55962 (= e!36809 e!36811)))

(declare-fun res!31489 () Bool)

(assert (=> b!55962 (=> (not res!31489) (not e!36811))))

(declare-datatypes ((tuple2!1980 0))(
  ( (tuple2!1981 (_1!1001 (_ BitVec 64)) (_2!1001 V!2795)) )
))
(declare-datatypes ((List!1406 0))(
  ( (Nil!1403) (Cons!1402 (h!1982 tuple2!1980) (t!4664 List!1406)) )
))
(declare-datatypes ((ListLongMap!1339 0))(
  ( (ListLongMap!1340 (toList!685 List!1406)) )
))
(declare-fun lt!22107 () ListLongMap!1339)

(declare-fun lt!22110 () ListLongMap!1339)

(assert (=> b!55962 (= res!31489 (and (= lt!22110 lt!22107) (not (= (select (arr!1745 (_keys!3625 (v!2337 (underlying!210 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1745 (_keys!3625 (v!2337 (underlying!210 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1083 (LongMapFixedSize!582) ListLongMap!1339)

(assert (=> b!55962 (= lt!22107 (map!1083 newMap!16))))

(declare-fun getCurrentListMap!392 (array!3645 array!3647 (_ BitVec 32) (_ BitVec 32) V!2795 V!2795 (_ BitVec 32) Int) ListLongMap!1339)

(assert (=> b!55962 (= lt!22110 (getCurrentListMap!392 (_keys!3625 (v!2337 (underlying!210 thiss!992))) (_values!1988 (v!2337 (underlying!210 thiss!992))) (mask!5868 (v!2337 (underlying!210 thiss!992))) (extraKeys!1896 (v!2337 (underlying!210 thiss!992))) (zeroValue!1923 (v!2337 (underlying!210 thiss!992))) (minValue!1923 (v!2337 (underlying!210 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2005 (v!2337 (underlying!210 thiss!992)))))))

(declare-fun b!55963 () Bool)

(declare-fun res!31491 () Bool)

(assert (=> b!55963 (=> res!31491 e!36812)))

(assert (=> b!55963 (= res!31491 (contains!663 lt!22109 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55964 () Bool)

(declare-fun e!36810 () Bool)

(assert (=> b!55964 (= e!36810 (not e!36812))))

(declare-fun res!31486 () Bool)

(assert (=> b!55964 (=> res!31486 e!36812)))

(assert (=> b!55964 (= res!31486 (or (bvsge (size!1974 (_keys!3625 (v!2337 (underlying!210 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1974 (_keys!3625 (v!2337 (underlying!210 thiss!992)))))))))

(assert (=> b!55964 (= lt!22109 (Cons!1401 (select (arr!1745 (_keys!3625 (v!2337 (underlying!210 thiss!992)))) from!355) Nil!1402))))

(declare-fun arrayNoDuplicates!0 (array!3645 (_ BitVec 32) List!1405) Bool)

(assert (=> b!55964 (arrayNoDuplicates!0 (_keys!3625 (v!2337 (underlying!210 thiss!992))) from!355 Nil!1402)))

(declare-datatypes ((Unit!1461 0))(
  ( (Unit!1462) )
))
(declare-fun lt!22105 () Unit!1461)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3645 (_ BitVec 32) (_ BitVec 32)) Unit!1461)

(assert (=> b!55964 (= lt!22105 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3625 (v!2337 (underlying!210 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55964 (arrayContainsKey!0 (_keys!3625 (v!2337 (underlying!210 thiss!992))) (select (arr!1745 (_keys!3625 (v!2337 (underlying!210 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22108 () Unit!1461)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!20 (array!3645 array!3647 (_ BitVec 32) (_ BitVec 32) V!2795 V!2795 (_ BitVec 64) (_ BitVec 32) Int) Unit!1461)

(assert (=> b!55964 (= lt!22108 (lemmaListMapContainsThenArrayContainsFrom!20 (_keys!3625 (v!2337 (underlying!210 thiss!992))) (_values!1988 (v!2337 (underlying!210 thiss!992))) (mask!5868 (v!2337 (underlying!210 thiss!992))) (extraKeys!1896 (v!2337 (underlying!210 thiss!992))) (zeroValue!1923 (v!2337 (underlying!210 thiss!992))) (minValue!1923 (v!2337 (underlying!210 thiss!992))) (select (arr!1745 (_keys!3625 (v!2337 (underlying!210 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2005 (v!2337 (underlying!210 thiss!992)))))))

(declare-fun b!55965 () Bool)

(declare-fun res!31490 () Bool)

(assert (=> b!55965 (=> res!31490 e!36812)))

(assert (=> b!55965 (= res!31490 (contains!663 lt!22109 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55966 () Bool)

(declare-fun e!36805 () Bool)

(assert (=> b!55966 (= e!36814 (and e!36805 mapRes!2754))))

(declare-fun condMapEmpty!2753 () Bool)

(declare-fun mapDefault!2754 () ValueCell!837)

(assert (=> b!55966 (= condMapEmpty!2753 (= (arr!1746 (_values!1988 (v!2337 (underlying!210 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!837)) mapDefault!2754)))))

(declare-fun b!55967 () Bool)

(assert (=> b!55967 (= e!36805 tp_is_empty!2361)))

(declare-fun b!55968 () Bool)

(declare-fun res!31487 () Bool)

(assert (=> b!55968 (=> (not res!31487) (not e!36809))))

(assert (=> b!55968 (= res!31487 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1974 (_keys!3625 (v!2337 (underlying!210 thiss!992)))))))))

(declare-fun b!55969 () Bool)

(assert (=> b!55969 (= e!36811 e!36810)))

(declare-fun res!31492 () Bool)

(assert (=> b!55969 (=> (not res!31492) (not e!36810))))

(declare-fun contains!664 (ListLongMap!1339 (_ BitVec 64)) Bool)

(assert (=> b!55969 (= res!31492 (contains!664 lt!22107 (select (arr!1745 (_keys!3625 (v!2337 (underlying!210 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1982 0))(
  ( (tuple2!1983 (_1!1002 Bool) (_2!1002 LongMapFixedSize!582)) )
))
(declare-fun lt!22104 () tuple2!1982)

(declare-fun update!65 (LongMapFixedSize!582 (_ BitVec 64) V!2795) tuple2!1982)

(declare-fun get!1041 (ValueCell!837 V!2795) V!2795)

(declare-fun dynLambda!296 (Int (_ BitVec 64)) V!2795)

(assert (=> b!55969 (= lt!22104 (update!65 newMap!16 (select (arr!1745 (_keys!3625 (v!2337 (underlying!210 thiss!992)))) from!355) (get!1041 (select (arr!1746 (_values!1988 (v!2337 (underlying!210 thiss!992)))) from!355) (dynLambda!296 (defaultEntry!2005 (v!2337 (underlying!210 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!55970 (= e!36807 (and tp!7769 tp_is_empty!2361 (array_inv!1079 (_keys!3625 newMap!16)) (array_inv!1080 (_values!1988 newMap!16)) e!36806))))

(declare-fun b!55971 () Bool)

(assert (=> b!55971 (= e!36801 tp_is_empty!2361)))

(declare-fun b!55972 () Bool)

(declare-fun res!31493 () Bool)

(assert (=> b!55972 (=> res!31493 e!36812)))

(assert (=> b!55972 (= res!31493 (not (arrayNoDuplicates!0 (_keys!3625 (v!2337 (underlying!210 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22109)))))

(declare-fun b!55973 () Bool)

(declare-fun res!31488 () Bool)

(assert (=> b!55973 (=> (not res!31488) (not e!36809))))

(declare-fun valid!235 (LongMapFixedSize!582) Bool)

(assert (=> b!55973 (= res!31488 (valid!235 newMap!16))))

(declare-fun b!55974 () Bool)

(assert (=> b!55974 (= e!36813 tp_is_empty!2361)))

(declare-fun b!55975 () Bool)

(declare-fun res!31495 () Bool)

(assert (=> b!55975 (=> res!31495 e!36812)))

(declare-fun noDuplicate!46 (List!1405) Bool)

(assert (=> b!55975 (= res!31495 (not (noDuplicate!46 lt!22109)))))

(assert (= (and start!8362 res!31496) b!55968))

(assert (= (and b!55968 res!31487) b!55973))

(assert (= (and b!55973 res!31488) b!55955))

(assert (= (and b!55955 res!31494) b!55962))

(assert (= (and b!55962 res!31489) b!55969))

(assert (= (and b!55969 res!31492) b!55964))

(assert (= (and b!55964 (not res!31486)) b!55975))

(assert (= (and b!55975 (not res!31495)) b!55963))

(assert (= (and b!55963 (not res!31491)) b!55965))

(assert (= (and b!55965 (not res!31490)) b!55972))

(assert (= (and b!55972 (not res!31493)) b!55956))

(assert (= (and b!55966 condMapEmpty!2753) mapIsEmpty!2753))

(assert (= (and b!55966 (not condMapEmpty!2753)) mapNonEmpty!2753))

(get-info :version)

(assert (= (and mapNonEmpty!2753 ((_ is ValueCellFull!837) mapValue!2753)) b!55971))

(assert (= (and b!55966 ((_ is ValueCellFull!837) mapDefault!2754)) b!55967))

(assert (= b!55959 b!55966))

(assert (= b!55961 b!55959))

(assert (= b!55958 b!55961))

(assert (= start!8362 b!55958))

(assert (= (and b!55960 condMapEmpty!2754) mapIsEmpty!2754))

(assert (= (and b!55960 (not condMapEmpty!2754)) mapNonEmpty!2754))

(assert (= (and mapNonEmpty!2754 ((_ is ValueCellFull!837) mapValue!2754)) b!55957))

(assert (= (and b!55960 ((_ is ValueCellFull!837) mapDefault!2753)) b!55974))

(assert (= b!55970 b!55960))

(assert (= start!8362 b!55970))

(declare-fun b_lambda!2455 () Bool)

(assert (=> (not b_lambda!2455) (not b!55969)))

(declare-fun t!4660 () Bool)

(declare-fun tb!1233 () Bool)

(assert (=> (and b!55959 (= (defaultEntry!2005 (v!2337 (underlying!210 thiss!992))) (defaultEntry!2005 (v!2337 (underlying!210 thiss!992)))) t!4660) tb!1233))

(declare-fun result!2247 () Bool)

(assert (=> tb!1233 (= result!2247 tp_is_empty!2361)))

(assert (=> b!55969 t!4660))

(declare-fun b_and!3323 () Bool)

(assert (= b_and!3319 (and (=> t!4660 result!2247) b_and!3323)))

(declare-fun t!4662 () Bool)

(declare-fun tb!1235 () Bool)

(assert (=> (and b!55970 (= (defaultEntry!2005 newMap!16) (defaultEntry!2005 (v!2337 (underlying!210 thiss!992)))) t!4662) tb!1235))

(declare-fun result!2251 () Bool)

(assert (= result!2251 result!2247))

(assert (=> b!55969 t!4662))

(declare-fun b_and!3325 () Bool)

(assert (= b_and!3321 (and (=> t!4662 result!2251) b_and!3325)))

(declare-fun m!47155 () Bool)

(assert (=> b!55975 m!47155))

(declare-fun m!47157 () Bool)

(assert (=> b!55963 m!47157))

(declare-fun m!47159 () Bool)

(assert (=> b!55962 m!47159))

(declare-fun m!47161 () Bool)

(assert (=> b!55962 m!47161))

(declare-fun m!47163 () Bool)

(assert (=> b!55962 m!47163))

(declare-fun m!47165 () Bool)

(assert (=> b!55959 m!47165))

(declare-fun m!47167 () Bool)

(assert (=> b!55959 m!47167))

(assert (=> b!55956 m!47159))

(assert (=> b!55956 m!47159))

(declare-fun m!47169 () Bool)

(assert (=> b!55956 m!47169))

(declare-fun m!47171 () Bool)

(assert (=> b!55972 m!47171))

(declare-fun m!47173 () Bool)

(assert (=> b!55969 m!47173))

(declare-fun m!47175 () Bool)

(assert (=> b!55969 m!47175))

(declare-fun m!47177 () Bool)

(assert (=> b!55969 m!47177))

(assert (=> b!55969 m!47159))

(declare-fun m!47179 () Bool)

(assert (=> b!55969 m!47179))

(assert (=> b!55969 m!47159))

(assert (=> b!55969 m!47175))

(assert (=> b!55969 m!47159))

(assert (=> b!55969 m!47177))

(declare-fun m!47181 () Bool)

(assert (=> b!55969 m!47181))

(assert (=> b!55969 m!47173))

(declare-fun m!47183 () Bool)

(assert (=> b!55964 m!47183))

(declare-fun m!47185 () Bool)

(assert (=> b!55964 m!47185))

(assert (=> b!55964 m!47159))

(declare-fun m!47187 () Bool)

(assert (=> b!55964 m!47187))

(assert (=> b!55964 m!47159))

(assert (=> b!55964 m!47159))

(declare-fun m!47189 () Bool)

(assert (=> b!55964 m!47189))

(declare-fun m!47191 () Bool)

(assert (=> mapNonEmpty!2753 m!47191))

(declare-fun m!47193 () Bool)

(assert (=> b!55965 m!47193))

(declare-fun m!47195 () Bool)

(assert (=> b!55970 m!47195))

(declare-fun m!47197 () Bool)

(assert (=> b!55970 m!47197))

(declare-fun m!47199 () Bool)

(assert (=> mapNonEmpty!2754 m!47199))

(declare-fun m!47201 () Bool)

(assert (=> start!8362 m!47201))

(declare-fun m!47203 () Bool)

(assert (=> b!55973 m!47203))

(check-sat (not b_next!1891) b_and!3323 (not b!55973) (not b!55965) (not b!55969) (not mapNonEmpty!2754) (not b!55963) (not b!55959) tp_is_empty!2361 (not b!55962) (not b_lambda!2455) (not start!8362) (not b!55972) (not b!55964) (not b_next!1889) (not b!55956) (not b!55975) b_and!3325 (not mapNonEmpty!2753) (not b!55970))
(check-sat b_and!3323 b_and!3325 (not b_next!1889) (not b_next!1891))
