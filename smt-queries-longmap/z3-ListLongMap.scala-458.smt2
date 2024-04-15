; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8364 () Bool)

(assert start!8364)

(declare-fun b!55839 () Bool)

(declare-fun b_free!1885 () Bool)

(declare-fun b_next!1885 () Bool)

(assert (=> b!55839 (= b_free!1885 (not b_next!1885))))

(declare-fun tp!7757 () Bool)

(declare-fun b_and!3313 () Bool)

(assert (=> b!55839 (= tp!7757 b_and!3313)))

(declare-fun b!55842 () Bool)

(declare-fun b_free!1887 () Bool)

(declare-fun b_next!1887 () Bool)

(assert (=> b!55842 (= b_free!1887 (not b_next!1887))))

(declare-fun tp!7758 () Bool)

(declare-fun b_and!3315 () Bool)

(assert (=> b!55842 (= tp!7758 b_and!3315)))

(declare-fun b!55824 () Bool)

(declare-fun e!36710 () Bool)

(declare-fun e!36718 () Bool)

(assert (=> b!55824 (= e!36710 e!36718)))

(declare-fun b!55825 () Bool)

(declare-fun e!36715 () Bool)

(declare-fun tp_is_empty!2359 () Bool)

(assert (=> b!55825 (= e!36715 tp_is_empty!2359)))

(declare-fun b!55826 () Bool)

(declare-fun res!31436 () Bool)

(declare-fun e!36724 () Bool)

(assert (=> b!55826 (=> res!31436 e!36724)))

(declare-datatypes ((List!1410 0))(
  ( (Nil!1407) (Cons!1406 (h!1986 (_ BitVec 64)) (t!4663 List!1410)) )
))
(declare-fun lt!22069 () List!1410)

(declare-fun contains!662 (List!1410 (_ BitVec 64)) Bool)

(assert (=> b!55826 (= res!31436 (contains!662 lt!22069 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55827 () Bool)

(assert (=> b!55827 (= e!36724 true)))

(declare-datatypes ((V!2793 0))(
  ( (V!2794 (val!1224 Int)) )
))
(declare-datatypes ((array!3621 0))(
  ( (array!3622 (arr!1732 (Array (_ BitVec 32) (_ BitVec 64))) (size!1962 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!836 0))(
  ( (ValueCellFull!836 (v!2329 V!2793)) (EmptyCell!836) )
))
(declare-datatypes ((array!3623 0))(
  ( (array!3624 (arr!1733 (Array (_ BitVec 32) ValueCell!836)) (size!1963 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!580 0))(
  ( (LongMapFixedSize!581 (defaultEntry!2004 Int) (mask!5866 (_ BitVec 32)) (extraKeys!1895 (_ BitVec 32)) (zeroValue!1922 V!2793) (minValue!1922 V!2793) (_size!339 (_ BitVec 32)) (_keys!3623 array!3621) (_values!1987 array!3623) (_vacant!339 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!390 0))(
  ( (Cell!391 (v!2330 LongMapFixedSize!580)) )
))
(declare-datatypes ((LongMap!390 0))(
  ( (LongMap!391 (underlying!206 Cell!390)) )
))
(declare-fun thiss!992 () LongMap!390)

(declare-fun lt!22070 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!55827 (= lt!22070 (contains!662 lt!22069 (select (arr!1732 (_keys!3623 (v!2330 (underlying!206 thiss!992)))) from!355)))))

(declare-fun b!55828 () Bool)

(declare-fun e!36712 () Bool)

(declare-fun e!36723 () Bool)

(declare-fun mapRes!2747 () Bool)

(assert (=> b!55828 (= e!36712 (and e!36723 mapRes!2747))))

(declare-fun condMapEmpty!2747 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!580)

(declare-fun mapDefault!2747 () ValueCell!836)

(assert (=> b!55828 (= condMapEmpty!2747 (= (arr!1733 (_values!1987 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!836)) mapDefault!2747)))))

(declare-fun b!55829 () Bool)

(declare-fun res!31434 () Bool)

(declare-fun e!36716 () Bool)

(assert (=> b!55829 (=> (not res!31434) (not e!36716))))

(assert (=> b!55829 (= res!31434 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1962 (_keys!3623 (v!2330 (underlying!206 thiss!992)))))))))

(declare-fun b!55830 () Bool)

(assert (=> b!55830 (= e!36723 tp_is_empty!2359)))

(declare-fun b!55831 () Bool)

(declare-fun e!36713 () Bool)

(assert (=> b!55831 (= e!36713 tp_is_empty!2359)))

(declare-fun b!55832 () Bool)

(declare-fun e!36717 () Bool)

(declare-fun e!36722 () Bool)

(assert (=> b!55832 (= e!36717 e!36722)))

(declare-fun res!31438 () Bool)

(assert (=> b!55832 (=> (not res!31438) (not e!36722))))

(declare-datatypes ((tuple2!1994 0))(
  ( (tuple2!1995 (_1!1008 (_ BitVec 64)) (_2!1008 V!2793)) )
))
(declare-datatypes ((List!1411 0))(
  ( (Nil!1408) (Cons!1407 (h!1987 tuple2!1994) (t!4664 List!1411)) )
))
(declare-datatypes ((ListLongMap!1333 0))(
  ( (ListLongMap!1334 (toList!682 List!1411)) )
))
(declare-fun lt!22068 () ListLongMap!1333)

(declare-fun contains!663 (ListLongMap!1333 (_ BitVec 64)) Bool)

(assert (=> b!55832 (= res!31438 (contains!663 lt!22068 (select (arr!1732 (_keys!3623 (v!2330 (underlying!206 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1996 0))(
  ( (tuple2!1997 (_1!1009 Bool) (_2!1009 LongMapFixedSize!580)) )
))
(declare-fun lt!22073 () tuple2!1996)

(declare-fun update!75 (LongMapFixedSize!580 (_ BitVec 64) V!2793) tuple2!1996)

(declare-fun get!1047 (ValueCell!836 V!2793) V!2793)

(declare-fun dynLambda!299 (Int (_ BitVec 64)) V!2793)

(assert (=> b!55832 (= lt!22073 (update!75 newMap!16 (select (arr!1732 (_keys!3623 (v!2330 (underlying!206 thiss!992)))) from!355) (get!1047 (select (arr!1733 (_values!1987 (v!2330 (underlying!206 thiss!992)))) from!355) (dynLambda!299 (defaultEntry!2004 (v!2330 (underlying!206 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55834 () Bool)

(declare-fun e!36720 () Bool)

(assert (=> b!55834 (= e!36720 tp_is_empty!2359)))

(declare-fun b!55835 () Bool)

(declare-fun res!31441 () Bool)

(assert (=> b!55835 (=> (not res!31441) (not e!36716))))

(declare-fun valid!233 (LongMapFixedSize!580) Bool)

(assert (=> b!55835 (= res!31441 (valid!233 newMap!16))))

(declare-fun b!55836 () Bool)

(assert (=> b!55836 (= e!36716 e!36717)))

(declare-fun res!31440 () Bool)

(assert (=> b!55836 (=> (not res!31440) (not e!36717))))

(declare-fun lt!22071 () ListLongMap!1333)

(assert (=> b!55836 (= res!31440 (and (= lt!22071 lt!22068) (not (= (select (arr!1732 (_keys!3623 (v!2330 (underlying!206 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1732 (_keys!3623 (v!2330 (underlying!206 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1082 (LongMapFixedSize!580) ListLongMap!1333)

(assert (=> b!55836 (= lt!22068 (map!1082 newMap!16))))

(declare-fun getCurrentListMap!380 (array!3621 array!3623 (_ BitVec 32) (_ BitVec 32) V!2793 V!2793 (_ BitVec 32) Int) ListLongMap!1333)

(assert (=> b!55836 (= lt!22071 (getCurrentListMap!380 (_keys!3623 (v!2330 (underlying!206 thiss!992))) (_values!1987 (v!2330 (underlying!206 thiss!992))) (mask!5866 (v!2330 (underlying!206 thiss!992))) (extraKeys!1895 (v!2330 (underlying!206 thiss!992))) (zeroValue!1922 (v!2330 (underlying!206 thiss!992))) (minValue!1922 (v!2330 (underlying!206 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2004 (v!2330 (underlying!206 thiss!992)))))))

(declare-fun b!55837 () Bool)

(declare-fun res!31435 () Bool)

(assert (=> b!55837 (=> (not res!31435) (not e!36716))))

(assert (=> b!55837 (= res!31435 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5866 newMap!16)) (_size!339 (v!2330 (underlying!206 thiss!992)))))))

(declare-fun b!55838 () Bool)

(declare-fun res!31433 () Bool)

(assert (=> b!55838 (=> res!31433 e!36724)))

(declare-fun noDuplicate!44 (List!1410) Bool)

(assert (=> b!55838 (= res!31433 (not (noDuplicate!44 lt!22069)))))

(declare-fun e!36711 () Bool)

(declare-fun array_inv!1067 (array!3621) Bool)

(declare-fun array_inv!1068 (array!3623) Bool)

(assert (=> b!55839 (= e!36718 (and tp!7757 tp_is_empty!2359 (array_inv!1067 (_keys!3623 (v!2330 (underlying!206 thiss!992)))) (array_inv!1068 (_values!1987 (v!2330 (underlying!206 thiss!992)))) e!36711))))

(declare-fun mapNonEmpty!2747 () Bool)

(declare-fun tp!7756 () Bool)

(assert (=> mapNonEmpty!2747 (= mapRes!2747 (and tp!7756 e!36720))))

(declare-fun mapRest!2748 () (Array (_ BitVec 32) ValueCell!836))

(declare-fun mapKey!2748 () (_ BitVec 32))

(declare-fun mapValue!2748 () ValueCell!836)

(assert (=> mapNonEmpty!2747 (= (arr!1733 (_values!1987 newMap!16)) (store mapRest!2748 mapKey!2748 mapValue!2748))))

(declare-fun mapIsEmpty!2747 () Bool)

(assert (=> mapIsEmpty!2747 mapRes!2747))

(declare-fun b!55840 () Bool)

(declare-fun e!36721 () Bool)

(assert (=> b!55840 (= e!36721 e!36710)))

(declare-fun b!55841 () Bool)

(assert (=> b!55841 (= e!36722 (not e!36724))))

(declare-fun res!31437 () Bool)

(assert (=> b!55841 (=> res!31437 e!36724)))

(assert (=> b!55841 (= res!31437 (or (bvsge (size!1962 (_keys!3623 (v!2330 (underlying!206 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1962 (_keys!3623 (v!2330 (underlying!206 thiss!992)))))))))

(assert (=> b!55841 (= lt!22069 (Cons!1406 (select (arr!1732 (_keys!3623 (v!2330 (underlying!206 thiss!992)))) from!355) Nil!1407))))

(declare-fun arrayNoDuplicates!0 (array!3621 (_ BitVec 32) List!1410) Bool)

(assert (=> b!55841 (arrayNoDuplicates!0 (_keys!3623 (v!2330 (underlying!206 thiss!992))) from!355 Nil!1407)))

(declare-datatypes ((Unit!1456 0))(
  ( (Unit!1457) )
))
(declare-fun lt!22067 () Unit!1456)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3621 (_ BitVec 32) (_ BitVec 32)) Unit!1456)

(assert (=> b!55841 (= lt!22067 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3623 (v!2330 (underlying!206 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55841 (arrayContainsKey!0 (_keys!3623 (v!2330 (underlying!206 thiss!992))) (select (arr!1732 (_keys!3623 (v!2330 (underlying!206 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22072 () Unit!1456)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!15 (array!3621 array!3623 (_ BitVec 32) (_ BitVec 32) V!2793 V!2793 (_ BitVec 64) (_ BitVec 32) Int) Unit!1456)

(assert (=> b!55841 (= lt!22072 (lemmaListMapContainsThenArrayContainsFrom!15 (_keys!3623 (v!2330 (underlying!206 thiss!992))) (_values!1987 (v!2330 (underlying!206 thiss!992))) (mask!5866 (v!2330 (underlying!206 thiss!992))) (extraKeys!1895 (v!2330 (underlying!206 thiss!992))) (zeroValue!1922 (v!2330 (underlying!206 thiss!992))) (minValue!1922 (v!2330 (underlying!206 thiss!992))) (select (arr!1732 (_keys!3623 (v!2330 (underlying!206 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2004 (v!2330 (underlying!206 thiss!992)))))))

(declare-fun mapNonEmpty!2748 () Bool)

(declare-fun mapRes!2748 () Bool)

(declare-fun tp!7755 () Bool)

(assert (=> mapNonEmpty!2748 (= mapRes!2748 (and tp!7755 e!36715))))

(declare-fun mapRest!2747 () (Array (_ BitVec 32) ValueCell!836))

(declare-fun mapValue!2747 () ValueCell!836)

(declare-fun mapKey!2747 () (_ BitVec 32))

(assert (=> mapNonEmpty!2748 (= (arr!1733 (_values!1987 (v!2330 (underlying!206 thiss!992)))) (store mapRest!2747 mapKey!2747 mapValue!2747))))

(declare-fun e!36714 () Bool)

(assert (=> b!55842 (= e!36714 (and tp!7758 tp_is_empty!2359 (array_inv!1067 (_keys!3623 newMap!16)) (array_inv!1068 (_values!1987 newMap!16)) e!36712))))

(declare-fun b!55843 () Bool)

(declare-fun res!31442 () Bool)

(assert (=> b!55843 (=> res!31442 e!36724)))

(assert (=> b!55843 (= res!31442 (contains!662 lt!22069 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55844 () Bool)

(assert (=> b!55844 (= e!36711 (and e!36713 mapRes!2748))))

(declare-fun condMapEmpty!2748 () Bool)

(declare-fun mapDefault!2748 () ValueCell!836)

(assert (=> b!55844 (= condMapEmpty!2748 (= (arr!1733 (_values!1987 (v!2330 (underlying!206 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!836)) mapDefault!2748)))))

(declare-fun mapIsEmpty!2748 () Bool)

(assert (=> mapIsEmpty!2748 mapRes!2748))

(declare-fun b!55833 () Bool)

(declare-fun res!31439 () Bool)

(assert (=> b!55833 (=> res!31439 e!36724)))

(assert (=> b!55833 (= res!31439 (not (arrayNoDuplicates!0 (_keys!3623 (v!2330 (underlying!206 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22069)))))

(declare-fun res!31443 () Bool)

(assert (=> start!8364 (=> (not res!31443) (not e!36716))))

(declare-fun valid!234 (LongMap!390) Bool)

(assert (=> start!8364 (= res!31443 (valid!234 thiss!992))))

(assert (=> start!8364 e!36716))

(assert (=> start!8364 e!36721))

(assert (=> start!8364 true))

(assert (=> start!8364 e!36714))

(assert (= (and start!8364 res!31443) b!55829))

(assert (= (and b!55829 res!31434) b!55835))

(assert (= (and b!55835 res!31441) b!55837))

(assert (= (and b!55837 res!31435) b!55836))

(assert (= (and b!55836 res!31440) b!55832))

(assert (= (and b!55832 res!31438) b!55841))

(assert (= (and b!55841 (not res!31437)) b!55838))

(assert (= (and b!55838 (not res!31433)) b!55843))

(assert (= (and b!55843 (not res!31442)) b!55826))

(assert (= (and b!55826 (not res!31436)) b!55833))

(assert (= (and b!55833 (not res!31439)) b!55827))

(assert (= (and b!55844 condMapEmpty!2748) mapIsEmpty!2748))

(assert (= (and b!55844 (not condMapEmpty!2748)) mapNonEmpty!2748))

(get-info :version)

(assert (= (and mapNonEmpty!2748 ((_ is ValueCellFull!836) mapValue!2747)) b!55825))

(assert (= (and b!55844 ((_ is ValueCellFull!836) mapDefault!2748)) b!55831))

(assert (= b!55839 b!55844))

(assert (= b!55824 b!55839))

(assert (= b!55840 b!55824))

(assert (= start!8364 b!55840))

(assert (= (and b!55828 condMapEmpty!2747) mapIsEmpty!2747))

(assert (= (and b!55828 (not condMapEmpty!2747)) mapNonEmpty!2747))

(assert (= (and mapNonEmpty!2747 ((_ is ValueCellFull!836) mapValue!2748)) b!55834))

(assert (= (and b!55828 ((_ is ValueCellFull!836) mapDefault!2747)) b!55830))

(assert (= b!55842 b!55828))

(assert (= start!8364 b!55842))

(declare-fun b_lambda!2457 () Bool)

(assert (=> (not b_lambda!2457) (not b!55832)))

(declare-fun t!4660 () Bool)

(declare-fun tb!1229 () Bool)

(assert (=> (and b!55839 (= (defaultEntry!2004 (v!2330 (underlying!206 thiss!992))) (defaultEntry!2004 (v!2330 (underlying!206 thiss!992)))) t!4660) tb!1229))

(declare-fun result!2241 () Bool)

(assert (=> tb!1229 (= result!2241 tp_is_empty!2359)))

(assert (=> b!55832 t!4660))

(declare-fun b_and!3317 () Bool)

(assert (= b_and!3313 (and (=> t!4660 result!2241) b_and!3317)))

(declare-fun t!4662 () Bool)

(declare-fun tb!1231 () Bool)

(assert (=> (and b!55842 (= (defaultEntry!2004 newMap!16) (defaultEntry!2004 (v!2330 (underlying!206 thiss!992)))) t!4662) tb!1231))

(declare-fun result!2245 () Bool)

(assert (= result!2245 result!2241))

(assert (=> b!55832 t!4662))

(declare-fun b_and!3319 () Bool)

(assert (= b_and!3315 (and (=> t!4662 result!2245) b_and!3319)))

(declare-fun m!47023 () Bool)

(assert (=> b!55835 m!47023))

(declare-fun m!47025 () Bool)

(assert (=> start!8364 m!47025))

(declare-fun m!47027 () Bool)

(assert (=> b!55836 m!47027))

(declare-fun m!47029 () Bool)

(assert (=> b!55836 m!47029))

(declare-fun m!47031 () Bool)

(assert (=> b!55836 m!47031))

(declare-fun m!47033 () Bool)

(assert (=> mapNonEmpty!2747 m!47033))

(declare-fun m!47035 () Bool)

(assert (=> b!55843 m!47035))

(declare-fun m!47037 () Bool)

(assert (=> b!55839 m!47037))

(declare-fun m!47039 () Bool)

(assert (=> b!55839 m!47039))

(declare-fun m!47041 () Bool)

(assert (=> b!55842 m!47041))

(declare-fun m!47043 () Bool)

(assert (=> b!55842 m!47043))

(declare-fun m!47045 () Bool)

(assert (=> b!55833 m!47045))

(declare-fun m!47047 () Bool)

(assert (=> mapNonEmpty!2748 m!47047))

(declare-fun m!47049 () Bool)

(assert (=> b!55838 m!47049))

(declare-fun m!47051 () Bool)

(assert (=> b!55826 m!47051))

(declare-fun m!47053 () Bool)

(assert (=> b!55832 m!47053))

(declare-fun m!47055 () Bool)

(assert (=> b!55832 m!47055))

(declare-fun m!47057 () Bool)

(assert (=> b!55832 m!47057))

(assert (=> b!55832 m!47027))

(assert (=> b!55832 m!47027))

(declare-fun m!47059 () Bool)

(assert (=> b!55832 m!47059))

(assert (=> b!55832 m!47055))

(assert (=> b!55832 m!47027))

(assert (=> b!55832 m!47057))

(declare-fun m!47061 () Bool)

(assert (=> b!55832 m!47061))

(assert (=> b!55832 m!47053))

(assert (=> b!55827 m!47027))

(assert (=> b!55827 m!47027))

(declare-fun m!47063 () Bool)

(assert (=> b!55827 m!47063))

(declare-fun m!47065 () Bool)

(assert (=> b!55841 m!47065))

(declare-fun m!47067 () Bool)

(assert (=> b!55841 m!47067))

(assert (=> b!55841 m!47027))

(declare-fun m!47069 () Bool)

(assert (=> b!55841 m!47069))

(assert (=> b!55841 m!47027))

(assert (=> b!55841 m!47027))

(declare-fun m!47071 () Bool)

(assert (=> b!55841 m!47071))

(check-sat (not b!55833) (not b!55843) (not b!55836) (not b!55839) (not b!55827) (not b!55842) (not mapNonEmpty!2748) (not b!55826) (not b!55838) b_and!3319 (not start!8364) (not b_next!1887) (not b_next!1885) b_and!3317 (not b!55835) (not mapNonEmpty!2747) (not b!55832) tp_is_empty!2359 (not b!55841) (not b_lambda!2457))
(check-sat b_and!3317 b_and!3319 (not b_next!1885) (not b_next!1887))
