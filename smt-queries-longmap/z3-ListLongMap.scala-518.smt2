; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13068 () Bool)

(assert start!13068)

(declare-fun b!113842 () Bool)

(declare-fun b_free!2605 () Bool)

(declare-fun b_next!2605 () Bool)

(assert (=> b!113842 (= b_free!2605 (not b_next!2605))))

(declare-fun tp!10174 () Bool)

(declare-fun b_and!6989 () Bool)

(assert (=> b!113842 (= tp!10174 b_and!6989)))

(declare-fun b!113844 () Bool)

(declare-fun b_free!2607 () Bool)

(declare-fun b_next!2607 () Bool)

(assert (=> b!113844 (= b_free!2607 (not b_next!2607))))

(declare-fun tp!10176 () Bool)

(declare-fun b_and!6991 () Bool)

(assert (=> b!113844 (= tp!10176 b_and!6991)))

(declare-fun res!56079 () Bool)

(declare-fun e!73985 () Bool)

(assert (=> start!13068 (=> (not res!56079) (not e!73985))))

(declare-datatypes ((V!3273 0))(
  ( (V!3274 (val!1404 Int)) )
))
(declare-datatypes ((array!4419 0))(
  ( (array!4420 (arr!2092 (Array (_ BitVec 32) (_ BitVec 64))) (size!2353 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1016 0))(
  ( (ValueCellFull!1016 (v!2967 V!3273)) (EmptyCell!1016) )
))
(declare-datatypes ((array!4421 0))(
  ( (array!4422 (arr!2093 (Array (_ BitVec 32) ValueCell!1016)) (size!2354 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!940 0))(
  ( (LongMapFixedSize!941 (defaultEntry!2676 Int) (mask!6867 (_ BitVec 32)) (extraKeys!2465 (_ BitVec 32)) (zeroValue!2543 V!3273) (minValue!2543 V!3273) (_size!519 (_ BitVec 32)) (_keys!4397 array!4419) (_values!2659 array!4421) (_vacant!519 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!728 0))(
  ( (Cell!729 (v!2968 LongMapFixedSize!940)) )
))
(declare-datatypes ((LongMap!728 0))(
  ( (LongMap!729 (underlying!375 Cell!728)) )
))
(declare-fun thiss!992 () LongMap!728)

(declare-fun valid!441 (LongMap!728) Bool)

(assert (=> start!13068 (= res!56079 (valid!441 thiss!992))))

(assert (=> start!13068 e!73985))

(declare-fun e!73995 () Bool)

(assert (=> start!13068 e!73995))

(assert (=> start!13068 true))

(declare-fun e!73997 () Bool)

(assert (=> start!13068 e!73997))

(declare-fun b!113827 () Bool)

(declare-fun e!73994 () Bool)

(assert (=> b!113827 (= e!73995 e!73994)))

(declare-fun b!113828 () Bool)

(declare-fun e!73988 () Bool)

(assert (=> b!113828 (= e!73994 e!73988)))

(declare-fun b!113829 () Bool)

(declare-fun e!73999 () Bool)

(assert (=> b!113829 (= e!73985 e!73999)))

(declare-fun res!56078 () Bool)

(assert (=> b!113829 (=> (not res!56078) (not e!73999))))

(declare-datatypes ((tuple2!2426 0))(
  ( (tuple2!2427 (_1!1224 (_ BitVec 64)) (_2!1224 V!3273)) )
))
(declare-datatypes ((List!1640 0))(
  ( (Nil!1637) (Cons!1636 (h!2236 tuple2!2426) (t!5833 List!1640)) )
))
(declare-datatypes ((ListLongMap!1571 0))(
  ( (ListLongMap!1572 (toList!801 List!1640)) )
))
(declare-fun lt!59099 () ListLongMap!1571)

(declare-fun lt!59090 () ListLongMap!1571)

(assert (=> b!113829 (= res!56078 (= lt!59099 lt!59090))))

(declare-fun newMap!16 () LongMapFixedSize!940)

(declare-fun map!1296 (LongMapFixedSize!940) ListLongMap!1571)

(assert (=> b!113829 (= lt!59090 (map!1296 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!476 (array!4419 array!4421 (_ BitVec 32) (_ BitVec 32) V!3273 V!3273 (_ BitVec 32) Int) ListLongMap!1571)

(assert (=> b!113829 (= lt!59099 (getCurrentListMap!476 (_keys!4397 (v!2968 (underlying!375 thiss!992))) (_values!2659 (v!2968 (underlying!375 thiss!992))) (mask!6867 (v!2968 (underlying!375 thiss!992))) (extraKeys!2465 (v!2968 (underlying!375 thiss!992))) (zeroValue!2543 (v!2968 (underlying!375 thiss!992))) (minValue!2543 (v!2968 (underlying!375 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2676 (v!2968 (underlying!375 thiss!992)))))))

(declare-fun b!113830 () Bool)

(declare-fun e!73990 () Bool)

(declare-fun e!73989 () Bool)

(declare-fun mapRes!4085 () Bool)

(assert (=> b!113830 (= e!73990 (and e!73989 mapRes!4085))))

(declare-fun condMapEmpty!4085 () Bool)

(declare-fun mapDefault!4086 () ValueCell!1016)

(assert (=> b!113830 (= condMapEmpty!4085 (= (arr!2093 (_values!2659 (v!2968 (underlying!375 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1016)) mapDefault!4086)))))

(declare-fun mapNonEmpty!4085 () Bool)

(declare-fun tp!10173 () Bool)

(declare-fun e!73996 () Bool)

(assert (=> mapNonEmpty!4085 (= mapRes!4085 (and tp!10173 e!73996))))

(declare-fun mapValue!4085 () ValueCell!1016)

(declare-fun mapKey!4085 () (_ BitVec 32))

(declare-fun mapRest!4085 () (Array (_ BitVec 32) ValueCell!1016))

(assert (=> mapNonEmpty!4085 (= (arr!2093 (_values!2659 (v!2968 (underlying!375 thiss!992)))) (store mapRest!4085 mapKey!4085 mapValue!4085))))

(declare-fun b!113831 () Bool)

(declare-fun res!56077 () Bool)

(assert (=> b!113831 (=> (not res!56077) (not e!73985))))

(declare-fun valid!442 (LongMapFixedSize!940) Bool)

(assert (=> b!113831 (= res!56077 (valid!442 newMap!16))))

(declare-fun mapNonEmpty!4086 () Bool)

(declare-fun mapRes!4086 () Bool)

(declare-fun tp!10175 () Bool)

(declare-fun e!73998 () Bool)

(assert (=> mapNonEmpty!4086 (= mapRes!4086 (and tp!10175 e!73998))))

(declare-fun mapKey!4086 () (_ BitVec 32))

(declare-fun mapValue!4086 () ValueCell!1016)

(declare-fun mapRest!4086 () (Array (_ BitVec 32) ValueCell!1016))

(assert (=> mapNonEmpty!4086 (= (arr!2093 (_values!2659 newMap!16)) (store mapRest!4086 mapKey!4086 mapValue!4086))))

(declare-fun b!113832 () Bool)

(declare-fun res!56074 () Bool)

(assert (=> b!113832 (=> (not res!56074) (not e!73985))))

(assert (=> b!113832 (= res!56074 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2353 (_keys!4397 (v!2968 (underlying!375 thiss!992)))))))))

(declare-fun b!113833 () Bool)

(declare-fun tp_is_empty!2719 () Bool)

(assert (=> b!113833 (= e!73998 tp_is_empty!2719)))

(declare-fun b!113834 () Bool)

(declare-fun e!73987 () Bool)

(declare-fun e!73992 () Bool)

(assert (=> b!113834 (= e!73987 e!73992)))

(declare-fun res!56076 () Bool)

(assert (=> b!113834 (=> (not res!56076) (not e!73992))))

(declare-datatypes ((tuple2!2428 0))(
  ( (tuple2!2429 (_1!1225 Bool) (_2!1225 LongMapFixedSize!940)) )
))
(declare-fun lt!59089 () tuple2!2428)

(assert (=> b!113834 (= res!56076 (and (_1!1225 lt!59089) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3543 0))(
  ( (Unit!3544) )
))
(declare-fun lt!59093 () Unit!3543)

(declare-fun e!73986 () Unit!3543)

(assert (=> b!113834 (= lt!59093 e!73986)))

(declare-fun c!20374 () Bool)

(declare-fun contains!839 (ListLongMap!1571 (_ BitVec 64)) Bool)

(assert (=> b!113834 (= c!20374 (contains!839 lt!59090 (select (arr!2092 (_keys!4397 (v!2968 (underlying!375 thiss!992)))) from!355)))))

(declare-fun lt!59091 () V!3273)

(declare-fun update!168 (LongMapFixedSize!940 (_ BitVec 64) V!3273) tuple2!2428)

(assert (=> b!113834 (= lt!59089 (update!168 newMap!16 (select (arr!2092 (_keys!4397 (v!2968 (underlying!375 thiss!992)))) from!355) lt!59091))))

(declare-fun b!113835 () Bool)

(declare-fun e!73984 () Bool)

(assert (=> b!113835 (= e!73984 tp_is_empty!2719)))

(declare-fun b!113836 () Bool)

(declare-fun Unit!3545 () Unit!3543)

(assert (=> b!113836 (= e!73986 Unit!3545)))

(declare-fun mapIsEmpty!4085 () Bool)

(assert (=> mapIsEmpty!4085 mapRes!4085))

(declare-fun b!113837 () Bool)

(declare-fun res!56073 () Bool)

(assert (=> b!113837 (=> (not res!56073) (not e!73985))))

(assert (=> b!113837 (= res!56073 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6867 newMap!16)) (_size!519 (v!2968 (underlying!375 thiss!992)))))))

(declare-fun b!113838 () Bool)

(assert (=> b!113838 (= e!73992 (not true))))

(declare-fun lt!59098 () ListLongMap!1571)

(declare-fun lt!59095 () tuple2!2426)

(declare-fun lt!59088 () tuple2!2426)

(declare-fun +!147 (ListLongMap!1571 tuple2!2426) ListLongMap!1571)

(assert (=> b!113838 (= (+!147 (+!147 lt!59098 lt!59095) lt!59088) (+!147 (+!147 lt!59098 lt!59088) lt!59095))))

(assert (=> b!113838 (= lt!59088 (tuple2!2427 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2543 (v!2968 (underlying!375 thiss!992)))))))

(assert (=> b!113838 (= lt!59095 (tuple2!2427 (select (arr!2092 (_keys!4397 (v!2968 (underlying!375 thiss!992)))) from!355) lt!59091))))

(declare-fun lt!59092 () Unit!3543)

(declare-fun addCommutativeForDiffKeys!59 (ListLongMap!1571 (_ BitVec 64) V!3273 (_ BitVec 64) V!3273) Unit!3543)

(assert (=> b!113838 (= lt!59092 (addCommutativeForDiffKeys!59 lt!59098 (select (arr!2092 (_keys!4397 (v!2968 (underlying!375 thiss!992)))) from!355) lt!59091 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2543 (v!2968 (underlying!375 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!112 (array!4419 array!4421 (_ BitVec 32) (_ BitVec 32) V!3273 V!3273 (_ BitVec 32) Int) ListLongMap!1571)

(assert (=> b!113838 (= lt!59098 (getCurrentListMapNoExtraKeys!112 (_keys!4397 (v!2968 (underlying!375 thiss!992))) (_values!2659 (v!2968 (underlying!375 thiss!992))) (mask!6867 (v!2968 (underlying!375 thiss!992))) (extraKeys!2465 (v!2968 (underlying!375 thiss!992))) (zeroValue!2543 (v!2968 (underlying!375 thiss!992))) (minValue!2543 (v!2968 (underlying!375 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2676 (v!2968 (underlying!375 thiss!992)))))))

(declare-fun b!113839 () Bool)

(declare-fun Unit!3546 () Unit!3543)

(assert (=> b!113839 (= e!73986 Unit!3546)))

(declare-fun lt!59096 () Unit!3543)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!120 (array!4419 array!4421 (_ BitVec 32) (_ BitVec 32) V!3273 V!3273 (_ BitVec 64) (_ BitVec 32) Int) Unit!3543)

(assert (=> b!113839 (= lt!59096 (lemmaListMapContainsThenArrayContainsFrom!120 (_keys!4397 (v!2968 (underlying!375 thiss!992))) (_values!2659 (v!2968 (underlying!375 thiss!992))) (mask!6867 (v!2968 (underlying!375 thiss!992))) (extraKeys!2465 (v!2968 (underlying!375 thiss!992))) (zeroValue!2543 (v!2968 (underlying!375 thiss!992))) (minValue!2543 (v!2968 (underlying!375 thiss!992))) (select (arr!2092 (_keys!4397 (v!2968 (underlying!375 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2676 (v!2968 (underlying!375 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!113839 (arrayContainsKey!0 (_keys!4397 (v!2968 (underlying!375 thiss!992))) (select (arr!2092 (_keys!4397 (v!2968 (underlying!375 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59094 () Unit!3543)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4419 (_ BitVec 32) (_ BitVec 32)) Unit!3543)

(assert (=> b!113839 (= lt!59094 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4397 (v!2968 (underlying!375 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1641 0))(
  ( (Nil!1638) (Cons!1637 (h!2237 (_ BitVec 64)) (t!5834 List!1641)) )
))
(declare-fun arrayNoDuplicates!0 (array!4419 (_ BitVec 32) List!1641) Bool)

(assert (=> b!113839 (arrayNoDuplicates!0 (_keys!4397 (v!2968 (underlying!375 thiss!992))) from!355 Nil!1638)))

(declare-fun lt!59097 () Unit!3543)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4419 (_ BitVec 32) (_ BitVec 64) List!1641) Unit!3543)

(assert (=> b!113839 (= lt!59097 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4397 (v!2968 (underlying!375 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2092 (_keys!4397 (v!2968 (underlying!375 thiss!992)))) from!355) (Cons!1637 (select (arr!2092 (_keys!4397 (v!2968 (underlying!375 thiss!992)))) from!355) Nil!1638)))))

(assert (=> b!113839 false))

(declare-fun b!113840 () Bool)

(declare-fun e!73991 () Bool)

(assert (=> b!113840 (= e!73991 (and e!73984 mapRes!4086))))

(declare-fun condMapEmpty!4086 () Bool)

(declare-fun mapDefault!4085 () ValueCell!1016)

(assert (=> b!113840 (= condMapEmpty!4086 (= (arr!2093 (_values!2659 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1016)) mapDefault!4085)))))

(declare-fun b!113841 () Bool)

(assert (=> b!113841 (= e!73996 tp_is_empty!2719)))

(declare-fun array_inv!1325 (array!4419) Bool)

(declare-fun array_inv!1326 (array!4421) Bool)

(assert (=> b!113842 (= e!73988 (and tp!10174 tp_is_empty!2719 (array_inv!1325 (_keys!4397 (v!2968 (underlying!375 thiss!992)))) (array_inv!1326 (_values!2659 (v!2968 (underlying!375 thiss!992)))) e!73990))))

(declare-fun mapIsEmpty!4086 () Bool)

(assert (=> mapIsEmpty!4086 mapRes!4086))

(declare-fun b!113843 () Bool)

(assert (=> b!113843 (= e!73989 tp_is_empty!2719)))

(assert (=> b!113844 (= e!73997 (and tp!10176 tp_is_empty!2719 (array_inv!1325 (_keys!4397 newMap!16)) (array_inv!1326 (_values!2659 newMap!16)) e!73991))))

(declare-fun b!113845 () Bool)

(assert (=> b!113845 (= e!73999 e!73987)))

(declare-fun res!56075 () Bool)

(assert (=> b!113845 (=> (not res!56075) (not e!73987))))

(assert (=> b!113845 (= res!56075 (and (not (= (select (arr!2092 (_keys!4397 (v!2968 (underlying!375 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2092 (_keys!4397 (v!2968 (underlying!375 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1369 (ValueCell!1016 V!3273) V!3273)

(declare-fun dynLambda!392 (Int (_ BitVec 64)) V!3273)

(assert (=> b!113845 (= lt!59091 (get!1369 (select (arr!2093 (_values!2659 (v!2968 (underlying!375 thiss!992)))) from!355) (dynLambda!392 (defaultEntry!2676 (v!2968 (underlying!375 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!13068 res!56079) b!113832))

(assert (= (and b!113832 res!56074) b!113831))

(assert (= (and b!113831 res!56077) b!113837))

(assert (= (and b!113837 res!56073) b!113829))

(assert (= (and b!113829 res!56078) b!113845))

(assert (= (and b!113845 res!56075) b!113834))

(assert (= (and b!113834 c!20374) b!113839))

(assert (= (and b!113834 (not c!20374)) b!113836))

(assert (= (and b!113834 res!56076) b!113838))

(assert (= (and b!113830 condMapEmpty!4085) mapIsEmpty!4085))

(assert (= (and b!113830 (not condMapEmpty!4085)) mapNonEmpty!4085))

(get-info :version)

(assert (= (and mapNonEmpty!4085 ((_ is ValueCellFull!1016) mapValue!4085)) b!113841))

(assert (= (and b!113830 ((_ is ValueCellFull!1016) mapDefault!4086)) b!113843))

(assert (= b!113842 b!113830))

(assert (= b!113828 b!113842))

(assert (= b!113827 b!113828))

(assert (= start!13068 b!113827))

(assert (= (and b!113840 condMapEmpty!4086) mapIsEmpty!4086))

(assert (= (and b!113840 (not condMapEmpty!4086)) mapNonEmpty!4086))

(assert (= (and mapNonEmpty!4086 ((_ is ValueCellFull!1016) mapValue!4086)) b!113833))

(assert (= (and b!113840 ((_ is ValueCellFull!1016) mapDefault!4085)) b!113835))

(assert (= b!113844 b!113840))

(assert (= start!13068 b!113844))

(declare-fun b_lambda!5089 () Bool)

(assert (=> (not b_lambda!5089) (not b!113845)))

(declare-fun t!5830 () Bool)

(declare-fun tb!2157 () Bool)

(assert (=> (and b!113842 (= (defaultEntry!2676 (v!2968 (underlying!375 thiss!992))) (defaultEntry!2676 (v!2968 (underlying!375 thiss!992)))) t!5830) tb!2157))

(declare-fun result!3607 () Bool)

(assert (=> tb!2157 (= result!3607 tp_is_empty!2719)))

(assert (=> b!113845 t!5830))

(declare-fun b_and!6993 () Bool)

(assert (= b_and!6989 (and (=> t!5830 result!3607) b_and!6993)))

(declare-fun t!5832 () Bool)

(declare-fun tb!2159 () Bool)

(assert (=> (and b!113844 (= (defaultEntry!2676 newMap!16) (defaultEntry!2676 (v!2968 (underlying!375 thiss!992)))) t!5832) tb!2159))

(declare-fun result!3611 () Bool)

(assert (= result!3611 result!3607))

(assert (=> b!113845 t!5832))

(declare-fun b_and!6995 () Bool)

(assert (= b_and!6991 (and (=> t!5832 result!3611) b_and!6995)))

(declare-fun m!129967 () Bool)

(assert (=> b!113839 m!129967))

(declare-fun m!129969 () Bool)

(assert (=> b!113839 m!129969))

(declare-fun m!129971 () Bool)

(assert (=> b!113839 m!129971))

(declare-fun m!129973 () Bool)

(assert (=> b!113839 m!129973))

(assert (=> b!113839 m!129971))

(assert (=> b!113839 m!129971))

(declare-fun m!129975 () Bool)

(assert (=> b!113839 m!129975))

(assert (=> b!113839 m!129971))

(declare-fun m!129977 () Bool)

(assert (=> b!113839 m!129977))

(declare-fun m!129979 () Bool)

(assert (=> b!113838 m!129979))

(declare-fun m!129981 () Bool)

(assert (=> b!113838 m!129981))

(assert (=> b!113838 m!129979))

(assert (=> b!113838 m!129971))

(declare-fun m!129983 () Bool)

(assert (=> b!113838 m!129983))

(declare-fun m!129985 () Bool)

(assert (=> b!113838 m!129985))

(declare-fun m!129987 () Bool)

(assert (=> b!113838 m!129987))

(assert (=> b!113838 m!129983))

(assert (=> b!113838 m!129971))

(declare-fun m!129989 () Bool)

(assert (=> b!113838 m!129989))

(assert (=> b!113834 m!129971))

(assert (=> b!113834 m!129971))

(declare-fun m!129991 () Bool)

(assert (=> b!113834 m!129991))

(assert (=> b!113834 m!129971))

(declare-fun m!129993 () Bool)

(assert (=> b!113834 m!129993))

(declare-fun m!129995 () Bool)

(assert (=> start!13068 m!129995))

(declare-fun m!129997 () Bool)

(assert (=> mapNonEmpty!4085 m!129997))

(declare-fun m!129999 () Bool)

(assert (=> b!113844 m!129999))

(declare-fun m!130001 () Bool)

(assert (=> b!113844 m!130001))

(declare-fun m!130003 () Bool)

(assert (=> b!113831 m!130003))

(assert (=> b!113845 m!129971))

(declare-fun m!130005 () Bool)

(assert (=> b!113845 m!130005))

(declare-fun m!130007 () Bool)

(assert (=> b!113845 m!130007))

(assert (=> b!113845 m!130005))

(assert (=> b!113845 m!130007))

(declare-fun m!130009 () Bool)

(assert (=> b!113845 m!130009))

(declare-fun m!130011 () Bool)

(assert (=> mapNonEmpty!4086 m!130011))

(declare-fun m!130013 () Bool)

(assert (=> b!113842 m!130013))

(declare-fun m!130015 () Bool)

(assert (=> b!113842 m!130015))

(declare-fun m!130017 () Bool)

(assert (=> b!113829 m!130017))

(declare-fun m!130019 () Bool)

(assert (=> b!113829 m!130019))

(check-sat (not b!113838) (not b_lambda!5089) (not b!113842) (not mapNonEmpty!4085) (not b_next!2605) (not mapNonEmpty!4086) (not start!13068) (not b!113844) (not b!113829) (not b!113834) (not b_next!2607) b_and!6995 (not b!113845) (not b!113831) (not b!113839) b_and!6993 tp_is_empty!2719)
(check-sat b_and!6993 b_and!6995 (not b_next!2605) (not b_next!2607))
