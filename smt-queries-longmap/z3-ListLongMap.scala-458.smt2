; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8364 () Bool)

(assert start!8364)

(declare-fun b!55841 () Bool)

(declare-fun b_free!1885 () Bool)

(declare-fun b_next!1885 () Bool)

(assert (=> b!55841 (= b_free!1885 (not b_next!1885))))

(declare-fun tp!7758 () Bool)

(declare-fun b_and!3309 () Bool)

(assert (=> b!55841 (= tp!7758 b_and!3309)))

(declare-fun b!55847 () Bool)

(declare-fun b_free!1887 () Bool)

(declare-fun b_next!1887 () Bool)

(assert (=> b!55847 (= b_free!1887 (not b_next!1887))))

(declare-fun tp!7757 () Bool)

(declare-fun b_and!3311 () Bool)

(assert (=> b!55847 (= tp!7757 b_and!3311)))

(declare-fun b!55833 () Bool)

(declare-fun e!36718 () Bool)

(declare-fun e!36717 () Bool)

(assert (=> b!55833 (= e!36718 e!36717)))

(declare-fun res!31433 () Bool)

(assert (=> b!55833 (=> (not res!31433) (not e!36717))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2793 0))(
  ( (V!2794 (val!1224 Int)) )
))
(declare-datatypes ((array!3627 0))(
  ( (array!3628 (arr!1736 (Array (_ BitVec 32) (_ BitVec 64))) (size!1965 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!836 0))(
  ( (ValueCellFull!836 (v!2335 V!2793)) (EmptyCell!836) )
))
(declare-datatypes ((array!3629 0))(
  ( (array!3630 (arr!1737 (Array (_ BitVec 32) ValueCell!836)) (size!1966 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!580 0))(
  ( (LongMapFixedSize!581 (defaultEntry!2004 Int) (mask!5867 (_ BitVec 32)) (extraKeys!1895 (_ BitVec 32)) (zeroValue!1922 V!2793) (minValue!1922 V!2793) (_size!339 (_ BitVec 32)) (_keys!3624 array!3627) (_values!1987 array!3629) (_vacant!339 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!396 0))(
  ( (Cell!397 (v!2336 LongMapFixedSize!580)) )
))
(declare-datatypes ((LongMap!396 0))(
  ( (LongMap!397 (underlying!209 Cell!396)) )
))
(declare-fun thiss!992 () LongMap!396)

(declare-datatypes ((tuple2!1976 0))(
  ( (tuple2!1977 (_1!999 (_ BitVec 64)) (_2!999 V!2793)) )
))
(declare-datatypes ((List!1399 0))(
  ( (Nil!1396) (Cons!1395 (h!1975 tuple2!1976) (t!4653 List!1399)) )
))
(declare-datatypes ((ListLongMap!1321 0))(
  ( (ListLongMap!1322 (toList!676 List!1399)) )
))
(declare-fun lt!22046 () ListLongMap!1321)

(declare-fun contains!658 (ListLongMap!1321 (_ BitVec 64)) Bool)

(assert (=> b!55833 (= res!31433 (contains!658 lt!22046 (select (arr!1736 (_keys!3624 (v!2336 (underlying!209 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1978 0))(
  ( (tuple2!1979 (_1!1000 Bool) (_2!1000 LongMapFixedSize!580)) )
))
(declare-fun lt!22043 () tuple2!1978)

(declare-fun newMap!16 () LongMapFixedSize!580)

(declare-fun update!78 (LongMapFixedSize!580 (_ BitVec 64) V!2793) tuple2!1978)

(declare-fun get!1047 (ValueCell!836 V!2793) V!2793)

(declare-fun dynLambda!296 (Int (_ BitVec 64)) V!2793)

(assert (=> b!55833 (= lt!22043 (update!78 newMap!16 (select (arr!1736 (_keys!3624 (v!2336 (underlying!209 thiss!992)))) from!355) (get!1047 (select (arr!1737 (_values!1987 (v!2336 (underlying!209 thiss!992)))) from!355) (dynLambda!296 (defaultEntry!2004 (v!2336 (underlying!209 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55834 () Bool)

(declare-fun e!36727 () Bool)

(declare-fun tp_is_empty!2359 () Bool)

(assert (=> b!55834 (= e!36727 tp_is_empty!2359)))

(declare-fun b!55836 () Bool)

(declare-fun e!36728 () Bool)

(assert (=> b!55836 (= e!36728 true)))

(declare-fun lt!22042 () Bool)

(declare-datatypes ((List!1400 0))(
  ( (Nil!1397) (Cons!1396 (h!1976 (_ BitVec 64)) (t!4654 List!1400)) )
))
(declare-fun lt!22044 () List!1400)

(declare-fun contains!659 (List!1400 (_ BitVec 64)) Bool)

(assert (=> b!55836 (= lt!22042 (contains!659 lt!22044 (select (arr!1736 (_keys!3624 (v!2336 (underlying!209 thiss!992)))) from!355)))))

(declare-fun b!55837 () Bool)

(declare-fun res!31428 () Bool)

(assert (=> b!55837 (=> res!31428 e!36728)))

(declare-fun noDuplicate!42 (List!1400) Bool)

(assert (=> b!55837 (= res!31428 (not (noDuplicate!42 lt!22044)))))

(declare-fun b!55838 () Bool)

(declare-fun res!31430 () Bool)

(assert (=> b!55838 (=> res!31430 e!36728)))

(declare-fun arrayNoDuplicates!0 (array!3627 (_ BitVec 32) List!1400) Bool)

(assert (=> b!55838 (= res!31430 (not (arrayNoDuplicates!0 (_keys!3624 (v!2336 (underlying!209 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22044)))))

(declare-fun b!55839 () Bool)

(declare-fun e!36725 () Bool)

(declare-fun e!36729 () Bool)

(declare-fun mapRes!2748 () Bool)

(assert (=> b!55839 (= e!36725 (and e!36729 mapRes!2748))))

(declare-fun condMapEmpty!2747 () Bool)

(declare-fun mapDefault!2748 () ValueCell!836)

(assert (=> b!55839 (= condMapEmpty!2747 (= (arr!1737 (_values!1987 (v!2336 (underlying!209 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!836)) mapDefault!2748)))))

(declare-fun mapNonEmpty!2747 () Bool)

(declare-fun mapRes!2747 () Bool)

(declare-fun tp!7756 () Bool)

(declare-fun e!36720 () Bool)

(assert (=> mapNonEmpty!2747 (= mapRes!2747 (and tp!7756 e!36720))))

(declare-fun mapValue!2748 () ValueCell!836)

(declare-fun mapRest!2747 () (Array (_ BitVec 32) ValueCell!836))

(declare-fun mapKey!2747 () (_ BitVec 32))

(assert (=> mapNonEmpty!2747 (= (arr!1737 (_values!1987 newMap!16)) (store mapRest!2747 mapKey!2747 mapValue!2748))))

(declare-fun b!55840 () Bool)

(declare-fun e!36722 () Bool)

(declare-fun e!36724 () Bool)

(assert (=> b!55840 (= e!36722 e!36724)))

(declare-fun e!36726 () Bool)

(declare-fun array_inv!1069 (array!3627) Bool)

(declare-fun array_inv!1070 (array!3629) Bool)

(assert (=> b!55841 (= e!36726 (and tp!7758 tp_is_empty!2359 (array_inv!1069 (_keys!3624 (v!2336 (underlying!209 thiss!992)))) (array_inv!1070 (_values!1987 (v!2336 (underlying!209 thiss!992)))) e!36725))))

(declare-fun b!55842 () Bool)

(declare-fun res!31434 () Bool)

(assert (=> b!55842 (=> res!31434 e!36728)))

(assert (=> b!55842 (= res!31434 (contains!659 lt!22044 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55843 () Bool)

(declare-fun res!31437 () Bool)

(declare-fun e!36716 () Bool)

(assert (=> b!55843 (=> (not res!31437) (not e!36716))))

(assert (=> b!55843 (= res!31437 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5867 newMap!16)) (_size!339 (v!2336 (underlying!209 thiss!992)))))))

(declare-fun b!55844 () Bool)

(assert (=> b!55844 (= e!36720 tp_is_empty!2359)))

(declare-fun b!55845 () Bool)

(assert (=> b!55845 (= e!36729 tp_is_empty!2359)))

(declare-fun b!55846 () Bool)

(declare-fun res!31436 () Bool)

(assert (=> b!55846 (=> (not res!31436) (not e!36716))))

(assert (=> b!55846 (= res!31436 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1965 (_keys!3624 (v!2336 (underlying!209 thiss!992)))))))))

(declare-fun b!55835 () Bool)

(declare-fun e!36721 () Bool)

(declare-fun e!36723 () Bool)

(assert (=> b!55835 (= e!36721 (and e!36723 mapRes!2747))))

(declare-fun condMapEmpty!2748 () Bool)

(declare-fun mapDefault!2747 () ValueCell!836)

(assert (=> b!55835 (= condMapEmpty!2748 (= (arr!1737 (_values!1987 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!836)) mapDefault!2747)))))

(declare-fun res!31438 () Bool)

(assert (=> start!8364 (=> (not res!31438) (not e!36716))))

(declare-fun valid!244 (LongMap!396) Bool)

(assert (=> start!8364 (= res!31438 (valid!244 thiss!992))))

(assert (=> start!8364 e!36716))

(assert (=> start!8364 e!36722))

(assert (=> start!8364 true))

(declare-fun e!36719 () Bool)

(assert (=> start!8364 e!36719))

(assert (=> b!55847 (= e!36719 (and tp!7757 tp_is_empty!2359 (array_inv!1069 (_keys!3624 newMap!16)) (array_inv!1070 (_values!1987 newMap!16)) e!36721))))

(declare-fun b!55848 () Bool)

(declare-fun res!31435 () Bool)

(assert (=> b!55848 (=> (not res!31435) (not e!36716))))

(declare-fun valid!245 (LongMapFixedSize!580) Bool)

(assert (=> b!55848 (= res!31435 (valid!245 newMap!16))))

(declare-fun mapNonEmpty!2748 () Bool)

(declare-fun tp!7755 () Bool)

(assert (=> mapNonEmpty!2748 (= mapRes!2748 (and tp!7755 e!36727))))

(declare-fun mapValue!2747 () ValueCell!836)

(declare-fun mapRest!2748 () (Array (_ BitVec 32) ValueCell!836))

(declare-fun mapKey!2748 () (_ BitVec 32))

(assert (=> mapNonEmpty!2748 (= (arr!1737 (_values!1987 (v!2336 (underlying!209 thiss!992)))) (store mapRest!2748 mapKey!2748 mapValue!2747))))

(declare-fun mapIsEmpty!2747 () Bool)

(assert (=> mapIsEmpty!2747 mapRes!2748))

(declare-fun b!55849 () Bool)

(assert (=> b!55849 (= e!36724 e!36726)))

(declare-fun b!55850 () Bool)

(assert (=> b!55850 (= e!36716 e!36718)))

(declare-fun res!31429 () Bool)

(assert (=> b!55850 (=> (not res!31429) (not e!36718))))

(declare-fun lt!22041 () ListLongMap!1321)

(assert (=> b!55850 (= res!31429 (and (= lt!22041 lt!22046) (not (= (select (arr!1736 (_keys!3624 (v!2336 (underlying!209 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1736 (_keys!3624 (v!2336 (underlying!209 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1087 (LongMapFixedSize!580) ListLongMap!1321)

(assert (=> b!55850 (= lt!22046 (map!1087 newMap!16))))

(declare-fun getCurrentListMap!379 (array!3627 array!3629 (_ BitVec 32) (_ BitVec 32) V!2793 V!2793 (_ BitVec 32) Int) ListLongMap!1321)

(assert (=> b!55850 (= lt!22041 (getCurrentListMap!379 (_keys!3624 (v!2336 (underlying!209 thiss!992))) (_values!1987 (v!2336 (underlying!209 thiss!992))) (mask!5867 (v!2336 (underlying!209 thiss!992))) (extraKeys!1895 (v!2336 (underlying!209 thiss!992))) (zeroValue!1922 (v!2336 (underlying!209 thiss!992))) (minValue!1922 (v!2336 (underlying!209 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2004 (v!2336 (underlying!209 thiss!992)))))))

(declare-fun b!55851 () Bool)

(assert (=> b!55851 (= e!36717 (not e!36728))))

(declare-fun res!31432 () Bool)

(assert (=> b!55851 (=> res!31432 e!36728)))

(assert (=> b!55851 (= res!31432 (or (bvsge (size!1965 (_keys!3624 (v!2336 (underlying!209 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1965 (_keys!3624 (v!2336 (underlying!209 thiss!992)))))))))

(assert (=> b!55851 (= lt!22044 (Cons!1396 (select (arr!1736 (_keys!3624 (v!2336 (underlying!209 thiss!992)))) from!355) Nil!1397))))

(assert (=> b!55851 (arrayNoDuplicates!0 (_keys!3624 (v!2336 (underlying!209 thiss!992))) from!355 Nil!1397)))

(declare-datatypes ((Unit!1464 0))(
  ( (Unit!1465) )
))
(declare-fun lt!22045 () Unit!1464)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3627 (_ BitVec 32) (_ BitVec 32)) Unit!1464)

(assert (=> b!55851 (= lt!22045 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3624 (v!2336 (underlying!209 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55851 (arrayContainsKey!0 (_keys!3624 (v!2336 (underlying!209 thiss!992))) (select (arr!1736 (_keys!3624 (v!2336 (underlying!209 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22040 () Unit!1464)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!16 (array!3627 array!3629 (_ BitVec 32) (_ BitVec 32) V!2793 V!2793 (_ BitVec 64) (_ BitVec 32) Int) Unit!1464)

(assert (=> b!55851 (= lt!22040 (lemmaListMapContainsThenArrayContainsFrom!16 (_keys!3624 (v!2336 (underlying!209 thiss!992))) (_values!1987 (v!2336 (underlying!209 thiss!992))) (mask!5867 (v!2336 (underlying!209 thiss!992))) (extraKeys!1895 (v!2336 (underlying!209 thiss!992))) (zeroValue!1922 (v!2336 (underlying!209 thiss!992))) (minValue!1922 (v!2336 (underlying!209 thiss!992))) (select (arr!1736 (_keys!3624 (v!2336 (underlying!209 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2004 (v!2336 (underlying!209 thiss!992)))))))

(declare-fun b!55852 () Bool)

(declare-fun res!31431 () Bool)

(assert (=> b!55852 (=> res!31431 e!36728)))

(assert (=> b!55852 (= res!31431 (contains!659 lt!22044 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!2748 () Bool)

(assert (=> mapIsEmpty!2748 mapRes!2747))

(declare-fun b!55853 () Bool)

(assert (=> b!55853 (= e!36723 tp_is_empty!2359)))

(assert (= (and start!8364 res!31438) b!55846))

(assert (= (and b!55846 res!31436) b!55848))

(assert (= (and b!55848 res!31435) b!55843))

(assert (= (and b!55843 res!31437) b!55850))

(assert (= (and b!55850 res!31429) b!55833))

(assert (= (and b!55833 res!31433) b!55851))

(assert (= (and b!55851 (not res!31432)) b!55837))

(assert (= (and b!55837 (not res!31428)) b!55842))

(assert (= (and b!55842 (not res!31434)) b!55852))

(assert (= (and b!55852 (not res!31431)) b!55838))

(assert (= (and b!55838 (not res!31430)) b!55836))

(assert (= (and b!55839 condMapEmpty!2747) mapIsEmpty!2747))

(assert (= (and b!55839 (not condMapEmpty!2747)) mapNonEmpty!2748))

(get-info :version)

(assert (= (and mapNonEmpty!2748 ((_ is ValueCellFull!836) mapValue!2747)) b!55834))

(assert (= (and b!55839 ((_ is ValueCellFull!836) mapDefault!2748)) b!55845))

(assert (= b!55841 b!55839))

(assert (= b!55849 b!55841))

(assert (= b!55840 b!55849))

(assert (= start!8364 b!55840))

(assert (= (and b!55835 condMapEmpty!2748) mapIsEmpty!2748))

(assert (= (and b!55835 (not condMapEmpty!2748)) mapNonEmpty!2747))

(assert (= (and mapNonEmpty!2747 ((_ is ValueCellFull!836) mapValue!2748)) b!55844))

(assert (= (and b!55835 ((_ is ValueCellFull!836) mapDefault!2747)) b!55853))

(assert (= b!55847 b!55835))

(assert (= start!8364 b!55847))

(declare-fun b_lambda!2453 () Bool)

(assert (=> (not b_lambda!2453) (not b!55833)))

(declare-fun t!4650 () Bool)

(declare-fun tb!1229 () Bool)

(assert (=> (and b!55841 (= (defaultEntry!2004 (v!2336 (underlying!209 thiss!992))) (defaultEntry!2004 (v!2336 (underlying!209 thiss!992)))) t!4650) tb!1229))

(declare-fun result!2241 () Bool)

(assert (=> tb!1229 (= result!2241 tp_is_empty!2359)))

(assert (=> b!55833 t!4650))

(declare-fun b_and!3313 () Bool)

(assert (= b_and!3309 (and (=> t!4650 result!2241) b_and!3313)))

(declare-fun tb!1231 () Bool)

(declare-fun t!4652 () Bool)

(assert (=> (and b!55847 (= (defaultEntry!2004 newMap!16) (defaultEntry!2004 (v!2336 (underlying!209 thiss!992)))) t!4652) tb!1231))

(declare-fun result!2245 () Bool)

(assert (= result!2245 result!2241))

(assert (=> b!55833 t!4652))

(declare-fun b_and!3315 () Bool)

(assert (= b_and!3311 (and (=> t!4652 result!2245) b_and!3315)))

(declare-fun m!46981 () Bool)

(assert (=> b!55838 m!46981))

(declare-fun m!46983 () Bool)

(assert (=> b!55851 m!46983))

(declare-fun m!46985 () Bool)

(assert (=> b!55851 m!46985))

(declare-fun m!46987 () Bool)

(assert (=> b!55851 m!46987))

(declare-fun m!46989 () Bool)

(assert (=> b!55851 m!46989))

(assert (=> b!55851 m!46987))

(assert (=> b!55851 m!46987))

(declare-fun m!46991 () Bool)

(assert (=> b!55851 m!46991))

(declare-fun m!46993 () Bool)

(assert (=> mapNonEmpty!2748 m!46993))

(declare-fun m!46995 () Bool)

(assert (=> b!55837 m!46995))

(declare-fun m!46997 () Bool)

(assert (=> mapNonEmpty!2747 m!46997))

(declare-fun m!46999 () Bool)

(assert (=> b!55842 m!46999))

(declare-fun m!47001 () Bool)

(assert (=> b!55841 m!47001))

(declare-fun m!47003 () Bool)

(assert (=> b!55841 m!47003))

(declare-fun m!47005 () Bool)

(assert (=> b!55848 m!47005))

(assert (=> b!55850 m!46987))

(declare-fun m!47007 () Bool)

(assert (=> b!55850 m!47007))

(declare-fun m!47009 () Bool)

(assert (=> b!55850 m!47009))

(assert (=> b!55836 m!46987))

(assert (=> b!55836 m!46987))

(declare-fun m!47011 () Bool)

(assert (=> b!55836 m!47011))

(declare-fun m!47013 () Bool)

(assert (=> b!55833 m!47013))

(declare-fun m!47015 () Bool)

(assert (=> b!55833 m!47015))

(declare-fun m!47017 () Bool)

(assert (=> b!55833 m!47017))

(assert (=> b!55833 m!46987))

(declare-fun m!47019 () Bool)

(assert (=> b!55833 m!47019))

(assert (=> b!55833 m!46987))

(assert (=> b!55833 m!47015))

(assert (=> b!55833 m!46987))

(assert (=> b!55833 m!47017))

(declare-fun m!47021 () Bool)

(assert (=> b!55833 m!47021))

(assert (=> b!55833 m!47013))

(declare-fun m!47023 () Bool)

(assert (=> start!8364 m!47023))

(declare-fun m!47025 () Bool)

(assert (=> b!55852 m!47025))

(declare-fun m!47027 () Bool)

(assert (=> b!55847 m!47027))

(declare-fun m!47029 () Bool)

(assert (=> b!55847 m!47029))

(check-sat b_and!3315 (not b!55848) (not b!55837) (not b_next!1887) tp_is_empty!2359 (not b!55833) (not b_next!1885) (not mapNonEmpty!2748) (not mapNonEmpty!2747) (not start!8364) (not b!55841) (not b!55842) (not b!55836) (not b!55838) (not b!55852) (not b!55847) (not b!55850) b_and!3313 (not b!55851) (not b_lambda!2453))
(check-sat b_and!3313 b_and!3315 (not b_next!1885) (not b_next!1887))
