; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10024 () Bool)

(assert start!10024)

(declare-fun b!75990 () Bool)

(declare-fun b_free!2141 () Bool)

(declare-fun b_next!2141 () Bool)

(assert (=> b!75990 (= b_free!2141 (not b_next!2141))))

(declare-fun tp!8615 () Bool)

(declare-fun b_and!4647 () Bool)

(assert (=> b!75990 (= tp!8615 b_and!4647)))

(declare-fun b!75980 () Bool)

(declare-fun b_free!2143 () Bool)

(declare-fun b_next!2143 () Bool)

(assert (=> b!75980 (= b_free!2143 (not b_next!2143))))

(declare-fun tp!8614 () Bool)

(declare-fun b_and!4649 () Bool)

(assert (=> b!75980 (= tp!8614 b_and!4649)))

(declare-fun b!75975 () Bool)

(declare-fun e!49646 () Bool)

(declare-fun e!49635 () Bool)

(declare-fun mapRes!3221 () Bool)

(assert (=> b!75975 (= e!49646 (and e!49635 mapRes!3221))))

(declare-fun condMapEmpty!3221 () Bool)

(declare-datatypes ((V!2963 0))(
  ( (V!2964 (val!1288 Int)) )
))
(declare-datatypes ((array!3923 0))(
  ( (array!3924 (arr!1871 (Array (_ BitVec 32) (_ BitVec 64))) (size!2111 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!900 0))(
  ( (ValueCellFull!900 (v!2558 V!2963)) (EmptyCell!900) )
))
(declare-datatypes ((array!3925 0))(
  ( (array!3926 (arr!1872 (Array (_ BitVec 32) ValueCell!900)) (size!2112 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!708 0))(
  ( (LongMapFixedSize!709 (defaultEntry!2247 Int) (mask!6230 (_ BitVec 32)) (extraKeys!2100 (_ BitVec 32)) (zeroValue!2146 V!2963) (minValue!2146 V!2963) (_size!403 (_ BitVec 32)) (_keys!3905 array!3923) (_values!2230 array!3925) (_vacant!403 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!708)

(declare-fun mapDefault!3221 () ValueCell!900)

(assert (=> b!75975 (= condMapEmpty!3221 (= (arr!1872 (_values!2230 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!900)) mapDefault!3221)))))

(declare-fun res!40032 () Bool)

(declare-fun e!49629 () Bool)

(assert (=> start!10024 (=> (not res!40032) (not e!49629))))

(declare-datatypes ((Cell!510 0))(
  ( (Cell!511 (v!2559 LongMapFixedSize!708)) )
))
(declare-datatypes ((LongMap!510 0))(
  ( (LongMap!511 (underlying!266 Cell!510)) )
))
(declare-fun thiss!992 () LongMap!510)

(declare-fun valid!298 (LongMap!510) Bool)

(assert (=> start!10024 (= res!40032 (valid!298 thiss!992))))

(assert (=> start!10024 e!49629))

(declare-fun e!49641 () Bool)

(assert (=> start!10024 e!49641))

(assert (=> start!10024 true))

(declare-fun e!49645 () Bool)

(assert (=> start!10024 e!49645))

(declare-fun b!75976 () Bool)

(declare-fun res!40034 () Bool)

(declare-fun e!49633 () Bool)

(assert (=> b!75976 (=> res!40034 e!49633)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3923 (_ BitVec 32)) Bool)

(assert (=> b!75976 (= res!40034 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun mapNonEmpty!3221 () Bool)

(declare-fun tp!8616 () Bool)

(declare-fun e!49631 () Bool)

(assert (=> mapNonEmpty!3221 (= mapRes!3221 (and tp!8616 e!49631))))

(declare-fun mapKey!3222 () (_ BitVec 32))

(declare-fun mapValue!3222 () ValueCell!900)

(declare-fun mapRest!3221 () (Array (_ BitVec 32) ValueCell!900))

(assert (=> mapNonEmpty!3221 (= (arr!1872 (_values!2230 newMap!16)) (store mapRest!3221 mapKey!3222 mapValue!3222))))

(declare-fun b!75977 () Bool)

(declare-datatypes ((Unit!2193 0))(
  ( (Unit!2194) )
))
(declare-fun e!49642 () Unit!2193)

(declare-fun Unit!2195 () Unit!2193)

(assert (=> b!75977 (= e!49642 Unit!2195)))

(declare-fun lt!34506 () Unit!2193)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!54 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 64) (_ BitVec 32) Int) Unit!2193)

(assert (=> b!75977 (= lt!34506 (lemmaListMapContainsThenArrayContainsFrom!54 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!75977 (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!34505 () Unit!2193)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3923 (_ BitVec 32) (_ BitVec 32)) Unit!2193)

(assert (=> b!75977 (= lt!34505 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1488 0))(
  ( (Nil!1485) (Cons!1484 (h!2072 (_ BitVec 64)) (t!5082 List!1488)) )
))
(declare-fun arrayNoDuplicates!0 (array!3923 (_ BitVec 32) List!1488) Bool)

(assert (=> b!75977 (arrayNoDuplicates!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) from!355 Nil!1485)))

(declare-fun lt!34501 () Unit!2193)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3923 (_ BitVec 32) (_ BitVec 64) List!1488) Unit!2193)

(assert (=> b!75977 (= lt!34501 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) Nil!1485)))))

(assert (=> b!75977 false))

(declare-fun mapIsEmpty!3221 () Bool)

(assert (=> mapIsEmpty!3221 mapRes!3221))

(declare-fun b!75978 () Bool)

(declare-fun e!49643 () Bool)

(declare-fun e!49632 () Bool)

(assert (=> b!75978 (= e!49643 e!49632)))

(declare-fun res!40035 () Bool)

(assert (=> b!75978 (=> (not res!40035) (not e!49632))))

(assert (=> b!75978 (= res!40035 (and (not (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!34504 () V!2963)

(declare-fun get!1154 (ValueCell!900 V!2963) V!2963)

(declare-fun dynLambda!330 (Int (_ BitVec 64)) V!2963)

(assert (=> b!75978 (= lt!34504 (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) from!355) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!75979 () Bool)

(declare-fun e!49636 () Bool)

(declare-fun tp_is_empty!2487 () Bool)

(assert (=> b!75979 (= e!49636 tp_is_empty!2487)))

(declare-fun array_inv!1155 (array!3923) Bool)

(declare-fun array_inv!1156 (array!3925) Bool)

(assert (=> b!75980 (= e!49645 (and tp!8614 tp_is_empty!2487 (array_inv!1155 (_keys!3905 newMap!16)) (array_inv!1156 (_values!2230 newMap!16)) e!49646))))

(declare-fun mapNonEmpty!3222 () Bool)

(declare-fun mapRes!3222 () Bool)

(declare-fun tp!8613 () Bool)

(assert (=> mapNonEmpty!3222 (= mapRes!3222 (and tp!8613 e!49636))))

(declare-fun mapKey!3221 () (_ BitVec 32))

(declare-fun mapValue!3221 () ValueCell!900)

(declare-fun mapRest!3222 () (Array (_ BitVec 32) ValueCell!900))

(assert (=> mapNonEmpty!3222 (= (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (store mapRest!3222 mapKey!3221 mapValue!3221))))

(declare-fun b!75981 () Bool)

(declare-fun e!49638 () Bool)

(declare-fun e!49640 () Bool)

(assert (=> b!75981 (= e!49638 e!49640)))

(declare-fun b!75982 () Bool)

(assert (=> b!75982 (= e!49635 tp_is_empty!2487)))

(declare-fun b!75983 () Bool)

(declare-fun res!40038 () Bool)

(assert (=> b!75983 (=> (not res!40038) (not e!49629))))

(declare-fun valid!299 (LongMapFixedSize!708) Bool)

(assert (=> b!75983 (= res!40038 (valid!299 newMap!16))))

(declare-fun b!75984 () Bool)

(declare-fun e!49630 () Bool)

(assert (=> b!75984 (= e!49630 tp_is_empty!2487)))

(declare-fun b!75985 () Bool)

(assert (=> b!75985 (= e!49641 e!49638)))

(declare-fun b!75986 () Bool)

(declare-fun e!49634 () Bool)

(assert (=> b!75986 (= e!49634 (and e!49630 mapRes!3222))))

(declare-fun condMapEmpty!3222 () Bool)

(declare-fun mapDefault!3222 () ValueCell!900)

(assert (=> b!75986 (= condMapEmpty!3222 (= (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!900)) mapDefault!3222)))))

(declare-fun b!75987 () Bool)

(declare-fun res!40029 () Bool)

(assert (=> b!75987 (=> res!40029 e!49633)))

(assert (=> b!75987 (= res!40029 (or (not (= (size!2112 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6230 (v!2559 (underlying!266 thiss!992)))))) (not (= (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (size!2112 (_values!2230 (v!2559 (underlying!266 thiss!992)))))) (bvslt (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!75988 () Bool)

(declare-fun res!40037 () Bool)

(assert (=> b!75988 (=> (not res!40037) (not e!49629))))

(assert (=> b!75988 (= res!40037 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992)))))))))

(declare-fun b!75989 () Bool)

(assert (=> b!75989 (= e!49633 (arrayNoDuplicates!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000000 Nil!1485))))

(assert (=> b!75990 (= e!49640 (and tp!8615 tp_is_empty!2487 (array_inv!1155 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (array_inv!1156 (_values!2230 (v!2559 (underlying!266 thiss!992)))) e!49634))))

(declare-fun b!75991 () Bool)

(declare-fun e!49637 () Bool)

(assert (=> b!75991 (= e!49637 (not e!49633))))

(declare-fun res!40031 () Bool)

(assert (=> b!75991 (=> res!40031 e!49633)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!75991 (= res!40031 (not (validMask!0 (mask!6230 (v!2559 (underlying!266 thiss!992))))))))

(declare-datatypes ((tuple2!2140 0))(
  ( (tuple2!2141 (_1!1081 (_ BitVec 64)) (_2!1081 V!2963)) )
))
(declare-datatypes ((List!1489 0))(
  ( (Nil!1486) (Cons!1485 (h!2073 tuple2!2140) (t!5083 List!1489)) )
))
(declare-datatypes ((ListLongMap!1429 0))(
  ( (ListLongMap!1430 (toList!730 List!1489)) )
))
(declare-fun lt!34498 () ListLongMap!1429)

(declare-fun lt!34509 () tuple2!2140)

(declare-fun lt!34508 () tuple2!2140)

(declare-fun +!99 (ListLongMap!1429 tuple2!2140) ListLongMap!1429)

(assert (=> b!75991 (= (+!99 (+!99 lt!34498 lt!34509) lt!34508) (+!99 (+!99 lt!34498 lt!34508) lt!34509))))

(assert (=> b!75991 (= lt!34508 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))

(assert (=> b!75991 (= lt!34509 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))

(declare-fun lt!34502 () Unit!2193)

(declare-fun addCommutativeForDiffKeys!18 (ListLongMap!1429 (_ BitVec 64) V!2963 (_ BitVec 64) V!2963) Unit!2193)

(assert (=> b!75991 (= lt!34502 (addCommutativeForDiffKeys!18 lt!34498 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!64 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 32) Int) ListLongMap!1429)

(assert (=> b!75991 (= lt!34498 (getCurrentListMapNoExtraKeys!64 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun b!75992 () Bool)

(declare-fun res!40033 () Bool)

(assert (=> b!75992 (=> (not res!40033) (not e!49629))))

(assert (=> b!75992 (= res!40033 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6230 newMap!16)) (_size!403 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun mapIsEmpty!3222 () Bool)

(assert (=> mapIsEmpty!3222 mapRes!3222))

(declare-fun b!75993 () Bool)

(declare-fun Unit!2196 () Unit!2193)

(assert (=> b!75993 (= e!49642 Unit!2196)))

(declare-fun b!75994 () Bool)

(assert (=> b!75994 (= e!49631 tp_is_empty!2487)))

(declare-fun b!75995 () Bool)

(assert (=> b!75995 (= e!49629 e!49643)))

(declare-fun res!40036 () Bool)

(assert (=> b!75995 (=> (not res!40036) (not e!49643))))

(declare-fun lt!34503 () ListLongMap!1429)

(declare-fun lt!34500 () ListLongMap!1429)

(assert (=> b!75995 (= res!40036 (= lt!34503 lt!34500))))

(declare-fun map!1159 (LongMapFixedSize!708) ListLongMap!1429)

(assert (=> b!75995 (= lt!34500 (map!1159 newMap!16))))

(declare-fun getCurrentListMap!426 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 32) Int) ListLongMap!1429)

(assert (=> b!75995 (= lt!34503 (getCurrentListMap!426 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun b!75996 () Bool)

(assert (=> b!75996 (= e!49632 e!49637)))

(declare-fun res!40030 () Bool)

(assert (=> b!75996 (=> (not res!40030) (not e!49637))))

(declare-datatypes ((tuple2!2142 0))(
  ( (tuple2!2143 (_1!1082 Bool) (_2!1082 LongMapFixedSize!708)) )
))
(declare-fun lt!34507 () tuple2!2142)

(assert (=> b!75996 (= res!40030 (and (_1!1082 lt!34507) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!34499 () Unit!2193)

(assert (=> b!75996 (= lt!34499 e!49642)))

(declare-fun c!11559 () Bool)

(declare-fun contains!731 (ListLongMap!1429 (_ BitVec 64)) Bool)

(assert (=> b!75996 (= c!11559 (contains!731 lt!34500 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun update!100 (LongMapFixedSize!708 (_ BitVec 64) V!2963) tuple2!2142)

(assert (=> b!75996 (= lt!34507 (update!100 newMap!16 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))

(assert (= (and start!10024 res!40032) b!75988))

(assert (= (and b!75988 res!40037) b!75983))

(assert (= (and b!75983 res!40038) b!75992))

(assert (= (and b!75992 res!40033) b!75995))

(assert (= (and b!75995 res!40036) b!75978))

(assert (= (and b!75978 res!40035) b!75996))

(assert (= (and b!75996 c!11559) b!75977))

(assert (= (and b!75996 (not c!11559)) b!75993))

(assert (= (and b!75996 res!40030) b!75991))

(assert (= (and b!75991 (not res!40031)) b!75987))

(assert (= (and b!75987 (not res!40029)) b!75976))

(assert (= (and b!75976 (not res!40034)) b!75989))

(assert (= (and b!75986 condMapEmpty!3222) mapIsEmpty!3222))

(assert (= (and b!75986 (not condMapEmpty!3222)) mapNonEmpty!3222))

(get-info :version)

(assert (= (and mapNonEmpty!3222 ((_ is ValueCellFull!900) mapValue!3221)) b!75979))

(assert (= (and b!75986 ((_ is ValueCellFull!900) mapDefault!3222)) b!75984))

(assert (= b!75990 b!75986))

(assert (= b!75981 b!75990))

(assert (= b!75985 b!75981))

(assert (= start!10024 b!75985))

(assert (= (and b!75975 condMapEmpty!3221) mapIsEmpty!3221))

(assert (= (and b!75975 (not condMapEmpty!3221)) mapNonEmpty!3221))

(assert (= (and mapNonEmpty!3221 ((_ is ValueCellFull!900) mapValue!3222)) b!75994))

(assert (= (and b!75975 ((_ is ValueCellFull!900) mapDefault!3221)) b!75982))

(assert (= b!75980 b!75975))

(assert (= start!10024 b!75980))

(declare-fun b_lambda!3413 () Bool)

(assert (=> (not b_lambda!3413) (not b!75978)))

(declare-fun t!5079 () Bool)

(declare-fun tb!1565 () Bool)

(assert (=> (and b!75990 (= (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))) t!5079) tb!1565))

(declare-fun result!2731 () Bool)

(assert (=> tb!1565 (= result!2731 tp_is_empty!2487)))

(assert (=> b!75978 t!5079))

(declare-fun b_and!4651 () Bool)

(assert (= b_and!4647 (and (=> t!5079 result!2731) b_and!4651)))

(declare-fun tb!1567 () Bool)

(declare-fun t!5081 () Bool)

(assert (=> (and b!75980 (= (defaultEntry!2247 newMap!16) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))) t!5081) tb!1567))

(declare-fun result!2735 () Bool)

(assert (= result!2735 result!2731))

(assert (=> b!75978 t!5081))

(declare-fun b_and!4653 () Bool)

(assert (= b_and!4649 (and (=> t!5081 result!2735) b_and!4653)))

(declare-fun m!75817 () Bool)

(assert (=> b!75989 m!75817))

(declare-fun m!75819 () Bool)

(assert (=> mapNonEmpty!3221 m!75819))

(declare-fun m!75821 () Bool)

(assert (=> b!75995 m!75821))

(declare-fun m!75823 () Bool)

(assert (=> b!75995 m!75823))

(declare-fun m!75825 () Bool)

(assert (=> b!75978 m!75825))

(declare-fun m!75827 () Bool)

(assert (=> b!75978 m!75827))

(declare-fun m!75829 () Bool)

(assert (=> b!75978 m!75829))

(assert (=> b!75978 m!75827))

(assert (=> b!75978 m!75829))

(declare-fun m!75831 () Bool)

(assert (=> b!75978 m!75831))

(declare-fun m!75833 () Bool)

(assert (=> b!75977 m!75833))

(declare-fun m!75835 () Bool)

(assert (=> b!75977 m!75835))

(assert (=> b!75977 m!75825))

(declare-fun m!75837 () Bool)

(assert (=> b!75977 m!75837))

(assert (=> b!75977 m!75825))

(assert (=> b!75977 m!75825))

(declare-fun m!75839 () Bool)

(assert (=> b!75977 m!75839))

(assert (=> b!75977 m!75825))

(declare-fun m!75841 () Bool)

(assert (=> b!75977 m!75841))

(declare-fun m!75843 () Bool)

(assert (=> b!75991 m!75843))

(declare-fun m!75845 () Bool)

(assert (=> b!75991 m!75845))

(declare-fun m!75847 () Bool)

(assert (=> b!75991 m!75847))

(declare-fun m!75849 () Bool)

(assert (=> b!75991 m!75849))

(assert (=> b!75991 m!75825))

(assert (=> b!75991 m!75843))

(assert (=> b!75991 m!75849))

(declare-fun m!75851 () Bool)

(assert (=> b!75991 m!75851))

(assert (=> b!75991 m!75825))

(declare-fun m!75853 () Bool)

(assert (=> b!75991 m!75853))

(declare-fun m!75855 () Bool)

(assert (=> b!75991 m!75855))

(declare-fun m!75857 () Bool)

(assert (=> b!75990 m!75857))

(declare-fun m!75859 () Bool)

(assert (=> b!75990 m!75859))

(declare-fun m!75861 () Bool)

(assert (=> b!75983 m!75861))

(declare-fun m!75863 () Bool)

(assert (=> mapNonEmpty!3222 m!75863))

(declare-fun m!75865 () Bool)

(assert (=> start!10024 m!75865))

(declare-fun m!75867 () Bool)

(assert (=> b!75980 m!75867))

(declare-fun m!75869 () Bool)

(assert (=> b!75980 m!75869))

(assert (=> b!75996 m!75825))

(assert (=> b!75996 m!75825))

(declare-fun m!75871 () Bool)

(assert (=> b!75996 m!75871))

(assert (=> b!75996 m!75825))

(declare-fun m!75873 () Bool)

(assert (=> b!75996 m!75873))

(declare-fun m!75875 () Bool)

(assert (=> b!75976 m!75875))

(check-sat (not b!75978) (not b_next!2141) (not b_next!2143) (not b_lambda!3413) (not b!75983) (not mapNonEmpty!3221) (not b!75991) (not b!75995) (not b!75989) (not b!75990) (not mapNonEmpty!3222) b_and!4651 (not b!75996) (not b!75977) (not b!75976) tp_is_empty!2487 (not start!10024) b_and!4653 (not b!75980))
(check-sat b_and!4651 b_and!4653 (not b_next!2141) (not b_next!2143))
(get-model)

(declare-fun b_lambda!3417 () Bool)

(assert (= b_lambda!3413 (or (and b!75990 b_free!2141) (and b!75980 b_free!2143 (= (defaultEntry!2247 newMap!16) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))))) b_lambda!3417)))

(check-sat (not b!75978) (not b_next!2141) (not b_next!2143) (not b_lambda!3417) (not b!75983) (not mapNonEmpty!3221) (not b!75991) (not b!75995) (not b!75989) (not b!75990) (not mapNonEmpty!3222) b_and!4651 (not b!75996) (not b!75977) (not b!75976) tp_is_empty!2487 (not start!10024) b_and!4653 (not b!75980))
(check-sat b_and!4651 b_and!4653 (not b_next!2141) (not b_next!2143))
(get-model)

(declare-fun d!18093 () Bool)

(declare-fun c!11565 () Bool)

(assert (=> d!18093 (= c!11565 ((_ is ValueCellFull!900) (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun e!49703 () V!2963)

(assert (=> d!18093 (= (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) from!355) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!49703)))

(declare-fun b!76071 () Bool)

(declare-fun get!1156 (ValueCell!900 V!2963) V!2963)

(assert (=> b!76071 (= e!49703 (get!1156 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) from!355) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!76072 () Bool)

(declare-fun get!1157 (ValueCell!900 V!2963) V!2963)

(assert (=> b!76072 (= e!49703 (get!1157 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) from!355) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18093 c!11565) b!76071))

(assert (= (and d!18093 (not c!11565)) b!76072))

(assert (=> b!76071 m!75827))

(assert (=> b!76071 m!75829))

(declare-fun m!75937 () Bool)

(assert (=> b!76071 m!75937))

(assert (=> b!76072 m!75827))

(assert (=> b!76072 m!75829))

(declare-fun m!75939 () Bool)

(assert (=> b!76072 m!75939))

(assert (=> b!75978 d!18093))

(declare-fun d!18095 () Bool)

(declare-fun res!40075 () Bool)

(declare-fun e!49706 () Bool)

(assert (=> d!18095 (=> (not res!40075) (not e!49706))))

(declare-fun simpleValid!53 (LongMapFixedSize!708) Bool)

(assert (=> d!18095 (= res!40075 (simpleValid!53 newMap!16))))

(assert (=> d!18095 (= (valid!299 newMap!16) e!49706)))

(declare-fun b!76079 () Bool)

(declare-fun res!40076 () Bool)

(assert (=> b!76079 (=> (not res!40076) (not e!49706))))

(declare-fun arrayCountValidKeys!0 (array!3923 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!76079 (= res!40076 (= (arrayCountValidKeys!0 (_keys!3905 newMap!16) #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))) (_size!403 newMap!16)))))

(declare-fun b!76080 () Bool)

(declare-fun res!40077 () Bool)

(assert (=> b!76080 (=> (not res!40077) (not e!49706))))

(assert (=> b!76080 (= res!40077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3905 newMap!16) (mask!6230 newMap!16)))))

(declare-fun b!76081 () Bool)

(assert (=> b!76081 (= e!49706 (arrayNoDuplicates!0 (_keys!3905 newMap!16) #b00000000000000000000000000000000 Nil!1485))))

(assert (= (and d!18095 res!40075) b!76079))

(assert (= (and b!76079 res!40076) b!76080))

(assert (= (and b!76080 res!40077) b!76081))

(declare-fun m!75941 () Bool)

(assert (=> d!18095 m!75941))

(declare-fun m!75943 () Bool)

(assert (=> b!76079 m!75943))

(declare-fun m!75945 () Bool)

(assert (=> b!76080 m!75945))

(declare-fun m!75947 () Bool)

(assert (=> b!76081 m!75947))

(assert (=> b!75983 d!18095))

(declare-fun d!18097 () Bool)

(declare-fun e!49711 () Bool)

(assert (=> d!18097 e!49711))

(declare-fun res!40080 () Bool)

(assert (=> d!18097 (=> res!40080 e!49711)))

(declare-fun lt!34555 () Bool)

(assert (=> d!18097 (= res!40080 (not lt!34555))))

(declare-fun lt!34557 () Bool)

(assert (=> d!18097 (= lt!34555 lt!34557)))

(declare-fun lt!34554 () Unit!2193)

(declare-fun e!49712 () Unit!2193)

(assert (=> d!18097 (= lt!34554 e!49712)))

(declare-fun c!11568 () Bool)

(assert (=> d!18097 (= c!11568 lt!34557)))

(declare-fun containsKey!139 (List!1489 (_ BitVec 64)) Bool)

(assert (=> d!18097 (= lt!34557 (containsKey!139 (toList!730 lt!34500) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (=> d!18097 (= (contains!731 lt!34500 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) lt!34555)))

(declare-fun b!76088 () Bool)

(declare-fun lt!34556 () Unit!2193)

(assert (=> b!76088 (= e!49712 lt!34556)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!87 (List!1489 (_ BitVec 64)) Unit!2193)

(assert (=> b!76088 (= lt!34556 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 lt!34500) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-datatypes ((Option!141 0))(
  ( (Some!140 (v!2563 V!2963)) (None!139) )
))
(declare-fun isDefined!88 (Option!141) Bool)

(declare-fun getValueByKey!135 (List!1489 (_ BitVec 64)) Option!141)

(assert (=> b!76088 (isDefined!88 (getValueByKey!135 (toList!730 lt!34500) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun b!76089 () Bool)

(declare-fun Unit!2200 () Unit!2193)

(assert (=> b!76089 (= e!49712 Unit!2200)))

(declare-fun b!76090 () Bool)

(assert (=> b!76090 (= e!49711 (isDefined!88 (getValueByKey!135 (toList!730 lt!34500) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355))))))

(assert (= (and d!18097 c!11568) b!76088))

(assert (= (and d!18097 (not c!11568)) b!76089))

(assert (= (and d!18097 (not res!40080)) b!76090))

(assert (=> d!18097 m!75825))

(declare-fun m!75949 () Bool)

(assert (=> d!18097 m!75949))

(assert (=> b!76088 m!75825))

(declare-fun m!75951 () Bool)

(assert (=> b!76088 m!75951))

(assert (=> b!76088 m!75825))

(declare-fun m!75953 () Bool)

(assert (=> b!76088 m!75953))

(assert (=> b!76088 m!75953))

(declare-fun m!75955 () Bool)

(assert (=> b!76088 m!75955))

(assert (=> b!76090 m!75825))

(assert (=> b!76090 m!75953))

(assert (=> b!76090 m!75953))

(assert (=> b!76090 m!75955))

(assert (=> b!75996 d!18097))

(declare-fun b!76171 () Bool)

(declare-fun c!11597 () Bool)

(declare-datatypes ((SeekEntryResult!238 0))(
  ( (MissingZero!238 (index!3085 (_ BitVec 32))) (Found!238 (index!3086 (_ BitVec 32))) (Intermediate!238 (undefined!1050 Bool) (index!3087 (_ BitVec 32)) (x!11387 (_ BitVec 32))) (Undefined!238) (MissingVacant!238 (index!3088 (_ BitVec 32))) )
))
(declare-fun lt!34630 () SeekEntryResult!238)

(assert (=> b!76171 (= c!11597 ((_ is MissingVacant!238) lt!34630))))

(declare-fun e!49767 () tuple2!2142)

(declare-fun e!49770 () tuple2!2142)

(assert (=> b!76171 (= e!49767 e!49770)))

(declare-fun d!18099 () Bool)

(declare-fun e!49762 () Bool)

(assert (=> d!18099 e!49762))

(declare-fun res!40109 () Bool)

(assert (=> d!18099 (=> (not res!40109) (not e!49762))))

(declare-fun lt!34634 () tuple2!2142)

(assert (=> d!18099 (= res!40109 (valid!299 (_2!1082 lt!34634)))))

(declare-fun e!49763 () tuple2!2142)

(assert (=> d!18099 (= lt!34634 e!49763)))

(declare-fun c!11600 () Bool)

(assert (=> d!18099 (= c!11600 (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvneg (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355))))))

(assert (=> d!18099 (valid!299 newMap!16)))

(assert (=> d!18099 (= (update!100 newMap!16 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504) lt!34634)))

(declare-fun c!11599 () Bool)

(declare-fun c!11607 () Bool)

(declare-fun bm!6856 () Bool)

(declare-fun lt!34633 () SeekEntryResult!238)

(declare-fun c!11601 () Bool)

(declare-fun call!6875 () Bool)

(declare-fun lt!34616 () SeekEntryResult!238)

(declare-fun c!11598 () Bool)

(declare-fun lt!34612 () SeekEntryResult!238)

(declare-fun lt!34621 () SeekEntryResult!238)

(declare-fun c!11604 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6856 (= call!6875 (inRange!0 (ite c!11607 (ite c!11604 (index!3086 lt!34612) (ite c!11598 (index!3085 lt!34633) (index!3088 lt!34633))) (ite c!11601 (index!3086 lt!34616) (ite c!11599 (index!3085 lt!34621) (index!3088 lt!34621)))) (mask!6230 newMap!16)))))

(declare-fun call!6872 () ListLongMap!1429)

(declare-fun c!11602 () Bool)

(declare-fun call!6881 () ListLongMap!1429)

(declare-fun bm!6857 () Bool)

(declare-fun call!6862 () ListLongMap!1429)

(declare-fun call!6873 () ListLongMap!1429)

(assert (=> bm!6857 (= call!6862 (+!99 (ite c!11600 (ite c!11602 call!6872 call!6873) call!6881) (ite c!11600 (ite c!11602 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34504) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(declare-fun b!76172 () Bool)

(declare-fun lt!34635 () tuple2!2142)

(assert (=> b!76172 (= e!49770 (tuple2!2143 (_1!1082 lt!34635) (_2!1082 lt!34635)))))

(declare-fun call!6865 () tuple2!2142)

(assert (=> b!76172 (= lt!34635 call!6865)))

(declare-fun b!76173 () Bool)

(declare-fun e!49766 () Bool)

(declare-fun call!6880 () ListLongMap!1429)

(declare-fun call!6859 () ListLongMap!1429)

(assert (=> b!76173 (= e!49766 (= call!6880 call!6859))))

(declare-fun b!76174 () Bool)

(declare-fun e!49755 () Bool)

(assert (=> b!76174 (= e!49766 e!49755)))

(declare-fun res!40111 () Bool)

(assert (=> b!76174 (= res!40111 (contains!731 call!6880 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (=> b!76174 (=> (not res!40111) (not e!49755))))

(declare-fun b!76175 () Bool)

(declare-fun lt!34622 () Unit!2193)

(declare-fun e!49768 () Unit!2193)

(assert (=> b!76175 (= lt!34622 e!49768)))

(declare-fun call!6866 () Bool)

(assert (=> b!76175 (= c!11604 call!6866)))

(assert (=> b!76175 (= e!49767 (tuple2!2143 false newMap!16))))

(declare-fun b!76176 () Bool)

(declare-fun res!40121 () Bool)

(declare-fun e!49761 () Bool)

(assert (=> b!76176 (=> (not res!40121) (not e!49761))))

(declare-fun call!6868 () Bool)

(assert (=> b!76176 (= res!40121 call!6868)))

(declare-fun e!49764 () Bool)

(assert (=> b!76176 (= e!49764 e!49761)))

(declare-fun b!76177 () Bool)

(declare-fun c!11603 () Bool)

(assert (=> b!76177 (= c!11603 ((_ is MissingVacant!238) lt!34621))))

(declare-fun e!49759 () Bool)

(assert (=> b!76177 (= e!49764 e!49759)))

(declare-fun b!76178 () Bool)

(declare-fun Unit!2201 () Unit!2193)

(assert (=> b!76178 (= e!49768 Unit!2201)))

(declare-fun lt!34618 () Unit!2193)

(declare-fun call!6882 () Unit!2193)

(assert (=> b!76178 (= lt!34618 call!6882)))

(declare-fun call!6869 () SeekEntryResult!238)

(assert (=> b!76178 (= lt!34612 call!6869)))

(declare-fun res!40120 () Bool)

(assert (=> b!76178 (= res!40120 ((_ is Found!238) lt!34612))))

(declare-fun e!49772 () Bool)

(assert (=> b!76178 (=> (not res!40120) (not e!49772))))

(assert (=> b!76178 e!49772))

(declare-fun lt!34636 () Unit!2193)

(assert (=> b!76178 (= lt!34636 lt!34618)))

(assert (=> b!76178 false))

(declare-fun b!76179 () Bool)

(declare-fun res!40116 () Bool)

(declare-fun call!6861 () Bool)

(assert (=> b!76179 (= res!40116 call!6861)))

(declare-fun e!49771 () Bool)

(assert (=> b!76179 (=> (not res!40116) (not e!49771))))

(declare-fun b!76180 () Bool)

(declare-fun e!49765 () Unit!2193)

(declare-fun Unit!2202 () Unit!2193)

(assert (=> b!76180 (= e!49765 Unit!2202)))

(declare-fun lt!34620 () Unit!2193)

(declare-fun call!6863 () Unit!2193)

(assert (=> b!76180 (= lt!34620 call!6863)))

(declare-fun call!6860 () SeekEntryResult!238)

(assert (=> b!76180 (= lt!34621 call!6860)))

(assert (=> b!76180 (= c!11599 ((_ is MissingZero!238) lt!34621))))

(assert (=> b!76180 e!49764))

(declare-fun lt!34629 () Unit!2193)

(assert (=> b!76180 (= lt!34629 lt!34620)))

(assert (=> b!76180 false))

(declare-fun b!76181 () Bool)

(assert (=> b!76181 (= e!49755 (= call!6880 (+!99 call!6859 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(declare-fun lt!34637 () array!3925)

(declare-fun call!6864 () ListLongMap!1429)

(declare-fun bm!6858 () Bool)

(declare-fun lt!34614 () (_ BitVec 32))

(assert (=> bm!6858 (= call!6864 (getCurrentListMap!426 (_keys!3905 newMap!16) (ite (or c!11600 c!11607) (_values!2230 newMap!16) lt!34637) (mask!6230 newMap!16) (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) (zeroValue!2146 newMap!16) (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun b!76182 () Bool)

(declare-fun lt!34615 () Unit!2193)

(declare-fun lt!34624 () Unit!2193)

(assert (=> b!76182 (= lt!34615 lt!34624)))

(declare-fun call!6871 () ListLongMap!1429)

(assert (=> b!76182 (contains!731 call!6871 (select (arr!1871 (_keys!3905 newMap!16)) (index!3086 lt!34630)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!87 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 32) Int) Unit!2193)

(assert (=> b!76182 (= lt!34624 (lemmaValidKeyInArrayIsInListMap!87 (_keys!3905 newMap!16) lt!34637 (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (index!3086 lt!34630) (defaultEntry!2247 newMap!16)))))

(assert (=> b!76182 (= lt!34637 (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (index!3086 lt!34630) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))))))

(declare-fun lt!34627 () Unit!2193)

(declare-fun lt!34638 () Unit!2193)

(assert (=> b!76182 (= lt!34627 lt!34638)))

(assert (=> b!76182 (= call!6862 (getCurrentListMap!426 (_keys!3905 newMap!16) (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (index!3086 lt!34630) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!26 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 32) (_ BitVec 64) V!2963 Int) Unit!2193)

(assert (=> b!76182 (= lt!34638 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!26 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (index!3086 lt!34630) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!34613 () Unit!2193)

(assert (=> b!76182 (= lt!34613 e!49765)))

(assert (=> b!76182 (= c!11601 call!6866)))

(declare-fun e!49757 () tuple2!2142)

(assert (=> b!76182 (= e!49757 (tuple2!2143 true (LongMapFixedSize!709 (defaultEntry!2247 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (_size!403 newMap!16) (_keys!3905 newMap!16) (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (index!3086 lt!34630) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))) (_vacant!403 newMap!16))))))

(declare-fun b!76183 () Bool)

(assert (=> b!76183 (= e!49763 e!49767)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3923 (_ BitVec 32)) SeekEntryResult!238)

(assert (=> b!76183 (= lt!34630 (seekEntryOrOpen!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (_keys!3905 newMap!16) (mask!6230 newMap!16)))))

(assert (=> b!76183 (= c!11607 ((_ is Undefined!238) lt!34630))))

(declare-fun bm!6859 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!26 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 64) Int) Unit!2193)

(assert (=> bm!6859 (= call!6882 (lemmaInListMapThenSeekEntryOrOpenFindsIt!26 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (defaultEntry!2247 newMap!16)))))

(declare-fun b!76184 () Bool)

(declare-fun lt!34626 () Unit!2193)

(declare-fun lt!34623 () Unit!2193)

(assert (=> b!76184 (= lt!34626 lt!34623)))

(declare-fun call!6874 () ListLongMap!1429)

(assert (=> b!76184 (= call!6874 call!6873)))

(declare-fun lt!34625 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!26 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 V!2963 Int) Unit!2193)

(assert (=> b!76184 (= lt!34623 (lemmaChangeZeroKeyThenAddPairToListMap!26 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) lt!34625 (zeroValue!2146 newMap!16) lt!34504 (minValue!2146 newMap!16) (defaultEntry!2247 newMap!16)))))

(assert (=> b!76184 (= lt!34625 (bvor (extraKeys!2100 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!49756 () tuple2!2142)

(assert (=> b!76184 (= e!49756 (tuple2!2143 true (LongMapFixedSize!709 (defaultEntry!2247 newMap!16) (mask!6230 newMap!16) (bvor (extraKeys!2100 newMap!16) #b00000000000000000000000000000001) lt!34504 (minValue!2146 newMap!16) (_size!403 newMap!16) (_keys!3905 newMap!16) (_values!2230 newMap!16) (_vacant!403 newMap!16))))))

(declare-fun bm!6860 () Bool)

(assert (=> bm!6860 (= call!6880 (map!1159 (_2!1082 lt!34634)))))

(declare-fun bm!6861 () Bool)

(declare-fun updateHelperNewKey!26 (LongMapFixedSize!708 (_ BitVec 64) V!2963 (_ BitVec 32)) tuple2!2142)

(assert (=> bm!6861 (= call!6865 (updateHelperNewKey!26 newMap!16 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504 (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630))))))

(declare-fun bm!6862 () Bool)

(assert (=> bm!6862 (= call!6873 call!6881)))

(declare-fun bm!6863 () Bool)

(assert (=> bm!6863 (= call!6881 (getCurrentListMap!426 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) (ite (and c!11600 c!11602) lt!34504 (zeroValue!2146 newMap!16)) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun bm!6864 () Bool)

(assert (=> bm!6864 (= call!6872 call!6864)))

(declare-fun b!76185 () Bool)

(declare-fun res!40115 () Bool)

(assert (=> b!76185 (=> (not res!40115) (not e!49761))))

(assert (=> b!76185 (= res!40115 (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3085 lt!34621)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6865 () Bool)

(declare-fun call!6870 () Bool)

(declare-fun call!6878 () Bool)

(assert (=> bm!6865 (= call!6870 call!6878)))

(declare-fun bm!6866 () Bool)

(declare-fun c!11595 () Bool)

(assert (=> bm!6866 (= c!11595 c!11607)))

(declare-fun e!49760 () ListLongMap!1429)

(assert (=> bm!6866 (= call!6866 (contains!731 e!49760 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun bm!6867 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!26 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 64) Int) Unit!2193)

(assert (=> bm!6867 (= call!6863 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!26 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (defaultEntry!2247 newMap!16)))))

(declare-fun b!76186 () Bool)

(declare-fun res!40112 () Bool)

(assert (=> b!76186 (= res!40112 (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3088 lt!34633)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49769 () Bool)

(assert (=> b!76186 (=> (not res!40112) (not e!49769))))

(declare-fun bm!6868 () Bool)

(declare-fun call!6879 () Bool)

(assert (=> bm!6868 (= call!6879 call!6878)))

(declare-fun bm!6869 () Bool)

(assert (=> bm!6869 (= call!6859 (map!1159 newMap!16))))

(declare-fun b!76187 () Bool)

(assert (=> b!76187 (= e!49760 call!6871)))

(declare-fun b!76188 () Bool)

(assert (=> b!76188 (= e!49772 (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3086 lt!34612)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun bm!6870 () Bool)

(assert (=> bm!6870 (= call!6868 call!6861)))

(declare-fun b!76189 () Bool)

(assert (=> b!76189 (= e!49760 call!6881)))

(declare-fun bm!6871 () Bool)

(assert (=> bm!6871 (= call!6861 call!6875)))

(declare-fun b!76190 () Bool)

(declare-fun e!49758 () Bool)

(assert (=> b!76190 (= e!49758 (not call!6879))))

(declare-fun b!76191 () Bool)

(declare-fun lt!34631 () Unit!2193)

(assert (=> b!76191 (= e!49768 lt!34631)))

(assert (=> b!76191 (= lt!34631 call!6863)))

(assert (=> b!76191 (= lt!34633 call!6869)))

(assert (=> b!76191 (= c!11598 ((_ is MissingZero!238) lt!34633))))

(declare-fun e!49773 () Bool)

(assert (=> b!76191 e!49773))

(declare-fun bm!6872 () Bool)

(declare-fun call!6877 () Bool)

(assert (=> bm!6872 (= call!6877 call!6875)))

(declare-fun b!76192 () Bool)

(declare-fun e!49775 () Bool)

(assert (=> b!76192 (= e!49775 (not call!6870))))

(declare-fun b!76193 () Bool)

(declare-fun res!40122 () Bool)

(assert (=> b!76193 (=> (not res!40122) (not e!49758))))

(assert (=> b!76193 (= res!40122 (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3085 lt!34633)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76194 () Bool)

(declare-fun c!11605 () Bool)

(assert (=> b!76194 (= c!11605 ((_ is MissingVacant!238) lt!34633))))

(declare-fun e!49774 () Bool)

(assert (=> b!76194 (= e!49773 e!49774)))

(declare-fun b!76195 () Bool)

(assert (=> b!76195 (= e!49774 ((_ is Undefined!238) lt!34633))))

(declare-fun bm!6873 () Bool)

(declare-fun call!6876 () SeekEntryResult!238)

(assert (=> bm!6873 (= call!6876 (seekEntryOrOpen!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (_keys!3905 newMap!16) (mask!6230 newMap!16)))))

(declare-fun b!76196 () Bool)

(declare-fun res!40118 () Bool)

(assert (=> b!76196 (= res!40118 (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3088 lt!34621)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76196 (=> (not res!40118) (not e!49775))))

(declare-fun b!76197 () Bool)

(assert (=> b!76197 (= e!49771 (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3086 lt!34616)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun b!76198 () Bool)

(assert (=> b!76198 (= e!49769 (not call!6879))))

(declare-fun bm!6874 () Bool)

(assert (=> bm!6874 (= call!6871 call!6864)))

(declare-fun bm!6875 () Bool)

(assert (=> bm!6875 (= call!6860 call!6876)))

(declare-fun b!76199 () Bool)

(assert (=> b!76199 (= e!49762 e!49766)))

(declare-fun c!11596 () Bool)

(assert (=> b!76199 (= c!11596 (_1!1082 lt!34634))))

(declare-fun bm!6876 () Bool)

(assert (=> bm!6876 (= call!6874 call!6862)))

(declare-fun b!76200 () Bool)

(declare-fun lt!34632 () Unit!2193)

(declare-fun lt!34617 () Unit!2193)

(assert (=> b!76200 (= lt!34632 lt!34617)))

(assert (=> b!76200 (= call!6874 call!6872)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!26 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 V!2963 Int) Unit!2193)

(assert (=> b!76200 (= lt!34617 (lemmaChangeLongMinValueKeyThenAddPairToListMap!26 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) lt!34614 (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) lt!34504 (defaultEntry!2247 newMap!16)))))

(assert (=> b!76200 (= lt!34614 (bvor (extraKeys!2100 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!76200 (= e!49756 (tuple2!2143 true (LongMapFixedSize!709 (defaultEntry!2247 newMap!16) (mask!6230 newMap!16) (bvor (extraKeys!2100 newMap!16) #b00000000000000000000000000000010) (zeroValue!2146 newMap!16) lt!34504 (_size!403 newMap!16) (_keys!3905 newMap!16) (_values!2230 newMap!16) (_vacant!403 newMap!16))))))

(declare-fun b!76201 () Bool)

(declare-fun lt!34628 () Unit!2193)

(assert (=> b!76201 (= e!49765 lt!34628)))

(assert (=> b!76201 (= lt!34628 call!6882)))

(assert (=> b!76201 (= lt!34616 call!6860)))

(declare-fun res!40119 () Bool)

(assert (=> b!76201 (= res!40119 ((_ is Found!238) lt!34616))))

(assert (=> b!76201 (=> (not res!40119) (not e!49771))))

(assert (=> b!76201 e!49771))

(declare-fun b!76202 () Bool)

(assert (=> b!76202 (= e!49761 (not call!6870))))

(declare-fun bm!6877 () Bool)

(assert (=> bm!6877 (= call!6878 (arrayContainsKey!0 (_keys!3905 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!76203 () Bool)

(declare-fun res!40110 () Bool)

(assert (=> b!76203 (=> (not res!40110) (not e!49758))))

(declare-fun call!6867 () Bool)

(assert (=> b!76203 (= res!40110 call!6867)))

(assert (=> b!76203 (= e!49773 e!49758)))

(declare-fun b!76204 () Bool)

(assert (=> b!76204 (= e!49759 e!49775)))

(declare-fun res!40117 () Bool)

(assert (=> b!76204 (= res!40117 call!6868)))

(assert (=> b!76204 (=> (not res!40117) (not e!49775))))

(declare-fun b!76205 () Bool)

(declare-fun res!40114 () Bool)

(assert (=> b!76205 (= res!40114 call!6877)))

(assert (=> b!76205 (=> (not res!40114) (not e!49772))))

(declare-fun b!76206 () Bool)

(assert (=> b!76206 (= e!49770 e!49757)))

(declare-fun c!11606 () Bool)

(assert (=> b!76206 (= c!11606 ((_ is MissingZero!238) lt!34630))))

(declare-fun b!76207 () Bool)

(assert (=> b!76207 (= e!49759 ((_ is Undefined!238) lt!34621))))

(declare-fun b!76208 () Bool)

(assert (=> b!76208 (= e!49774 e!49769)))

(declare-fun res!40113 () Bool)

(assert (=> b!76208 (= res!40113 call!6867)))

(assert (=> b!76208 (=> (not res!40113) (not e!49769))))

(declare-fun b!76209 () Bool)

(declare-fun lt!34619 () tuple2!2142)

(assert (=> b!76209 (= lt!34619 call!6865)))

(assert (=> b!76209 (= e!49757 (tuple2!2143 (_1!1082 lt!34619) (_2!1082 lt!34619)))))

(declare-fun b!76210 () Bool)

(assert (=> b!76210 (= e!49763 e!49756)))

(assert (=> b!76210 (= c!11602 (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6878 () Bool)

(assert (=> bm!6878 (= call!6867 call!6877)))

(declare-fun bm!6879 () Bool)

(assert (=> bm!6879 (= call!6869 call!6876)))

(assert (= (and d!18099 c!11600) b!76210))

(assert (= (and d!18099 (not c!11600)) b!76183))

(assert (= (and b!76210 c!11602) b!76184))

(assert (= (and b!76210 (not c!11602)) b!76200))

(assert (= (or b!76184 b!76200) bm!6862))

(assert (= (or b!76184 b!76200) bm!6864))

(assert (= (or b!76184 b!76200) bm!6876))

(assert (= (and b!76183 c!11607) b!76175))

(assert (= (and b!76183 (not c!11607)) b!76171))

(assert (= (and b!76175 c!11604) b!76178))

(assert (= (and b!76175 (not c!11604)) b!76191))

(assert (= (and b!76178 res!40120) b!76205))

(assert (= (and b!76205 res!40114) b!76188))

(assert (= (and b!76191 c!11598) b!76203))

(assert (= (and b!76191 (not c!11598)) b!76194))

(assert (= (and b!76203 res!40110) b!76193))

(assert (= (and b!76193 res!40122) b!76190))

(assert (= (and b!76194 c!11605) b!76208))

(assert (= (and b!76194 (not c!11605)) b!76195))

(assert (= (and b!76208 res!40113) b!76186))

(assert (= (and b!76186 res!40112) b!76198))

(assert (= (or b!76203 b!76208) bm!6878))

(assert (= (or b!76190 b!76198) bm!6868))

(assert (= (or b!76205 bm!6878) bm!6872))

(assert (= (or b!76178 b!76191) bm!6879))

(assert (= (and b!76171 c!11597) b!76172))

(assert (= (and b!76171 (not c!11597)) b!76206))

(assert (= (and b!76206 c!11606) b!76209))

(assert (= (and b!76206 (not c!11606)) b!76182))

(assert (= (and b!76182 c!11601) b!76201))

(assert (= (and b!76182 (not c!11601)) b!76180))

(assert (= (and b!76201 res!40119) b!76179))

(assert (= (and b!76179 res!40116) b!76197))

(assert (= (and b!76180 c!11599) b!76176))

(assert (= (and b!76180 (not c!11599)) b!76177))

(assert (= (and b!76176 res!40121) b!76185))

(assert (= (and b!76185 res!40115) b!76202))

(assert (= (and b!76177 c!11603) b!76204))

(assert (= (and b!76177 (not c!11603)) b!76207))

(assert (= (and b!76204 res!40117) b!76196))

(assert (= (and b!76196 res!40118) b!76192))

(assert (= (or b!76176 b!76204) bm!6870))

(assert (= (or b!76202 b!76192) bm!6865))

(assert (= (or b!76179 bm!6870) bm!6871))

(assert (= (or b!76201 b!76180) bm!6875))

(assert (= (or b!76172 b!76209) bm!6861))

(assert (= (or b!76191 b!76180) bm!6867))

(assert (= (or bm!6868 bm!6865) bm!6877))

(assert (= (or b!76178 b!76201) bm!6859))

(assert (= (or bm!6872 bm!6871) bm!6856))

(assert (= (or b!76175 b!76182) bm!6874))

(assert (= (or bm!6879 bm!6875) bm!6873))

(assert (= (or b!76175 b!76182) bm!6866))

(assert (= (and bm!6866 c!11595) b!76187))

(assert (= (and bm!6866 (not c!11595)) b!76189))

(assert (= (or bm!6864 bm!6874) bm!6858))

(assert (= (or bm!6862 b!76182 b!76189) bm!6863))

(assert (= (or bm!6876 b!76182) bm!6857))

(assert (= (and d!18099 res!40109) b!76199))

(assert (= (and b!76199 c!11596) b!76174))

(assert (= (and b!76199 (not c!11596)) b!76173))

(assert (= (and b!76174 res!40111) b!76181))

(assert (= (or b!76181 b!76173) bm!6869))

(assert (= (or b!76174 b!76181 b!76173) bm!6860))

(declare-fun m!75957 () Bool)

(assert (=> b!76193 m!75957))

(declare-fun m!75959 () Bool)

(assert (=> b!76182 m!75959))

(declare-fun m!75961 () Bool)

(assert (=> b!76182 m!75961))

(declare-fun m!75963 () Bool)

(assert (=> b!76182 m!75963))

(assert (=> b!76182 m!75959))

(assert (=> b!76182 m!75825))

(declare-fun m!75965 () Bool)

(assert (=> b!76182 m!75965))

(declare-fun m!75967 () Bool)

(assert (=> b!76182 m!75967))

(declare-fun m!75969 () Bool)

(assert (=> b!76182 m!75969))

(assert (=> bm!6869 m!75821))

(declare-fun m!75971 () Bool)

(assert (=> b!76196 m!75971))

(assert (=> bm!6873 m!75825))

(declare-fun m!75973 () Bool)

(assert (=> bm!6873 m!75973))

(declare-fun m!75975 () Bool)

(assert (=> bm!6860 m!75975))

(declare-fun m!75977 () Bool)

(assert (=> b!76185 m!75977))

(assert (=> bm!6859 m!75825))

(declare-fun m!75979 () Bool)

(assert (=> bm!6859 m!75979))

(declare-fun m!75981 () Bool)

(assert (=> d!18099 m!75981))

(assert (=> d!18099 m!75861))

(declare-fun m!75983 () Bool)

(assert (=> b!76197 m!75983))

(declare-fun m!75985 () Bool)

(assert (=> b!76186 m!75985))

(declare-fun m!75987 () Bool)

(assert (=> bm!6856 m!75987))

(declare-fun m!75989 () Bool)

(assert (=> bm!6858 m!75989))

(declare-fun m!75991 () Bool)

(assert (=> b!76184 m!75991))

(declare-fun m!75993 () Bool)

(assert (=> bm!6857 m!75993))

(assert (=> bm!6866 m!75825))

(declare-fun m!75995 () Bool)

(assert (=> bm!6866 m!75995))

(declare-fun m!75997 () Bool)

(assert (=> b!76188 m!75997))

(assert (=> bm!6877 m!75825))

(declare-fun m!75999 () Bool)

(assert (=> bm!6877 m!75999))

(assert (=> b!76183 m!75825))

(assert (=> b!76183 m!75973))

(assert (=> bm!6867 m!75825))

(declare-fun m!76001 () Bool)

(assert (=> bm!6867 m!76001))

(assert (=> b!76174 m!75825))

(declare-fun m!76003 () Bool)

(assert (=> b!76174 m!76003))

(declare-fun m!76005 () Bool)

(assert (=> bm!6863 m!76005))

(declare-fun m!76007 () Bool)

(assert (=> b!76200 m!76007))

(declare-fun m!76009 () Bool)

(assert (=> b!76181 m!76009))

(assert (=> bm!6861 m!75825))

(declare-fun m!76011 () Bool)

(assert (=> bm!6861 m!76011))

(assert (=> b!75996 d!18099))

(declare-fun d!18101 () Bool)

(assert (=> d!18101 (= (map!1159 newMap!16) (getCurrentListMap!426 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun bs!3261 () Bool)

(assert (= bs!3261 d!18101))

(declare-fun m!76013 () Bool)

(assert (=> bs!3261 m!76013))

(assert (=> b!75995 d!18101))

(declare-fun b!76253 () Bool)

(declare-fun e!49802 () Bool)

(declare-fun call!6897 () Bool)

(assert (=> b!76253 (= e!49802 (not call!6897))))

(declare-fun b!76254 () Bool)

(declare-fun e!49803 () Bool)

(declare-fun call!6899 () Bool)

(assert (=> b!76254 (= e!49803 (not call!6899))))

(declare-fun bm!6894 () Bool)

(declare-fun call!6903 () ListLongMap!1429)

(declare-fun call!6898 () ListLongMap!1429)

(assert (=> bm!6894 (= call!6903 call!6898)))

(declare-fun b!76255 () Bool)

(declare-fun e!49807 () Unit!2193)

(declare-fun Unit!2203 () Unit!2193)

(assert (=> b!76255 (= e!49807 Unit!2203)))

(declare-fun c!11622 () Bool)

(declare-fun bm!6895 () Bool)

(declare-fun call!6902 () ListLongMap!1429)

(declare-fun c!11623 () Bool)

(declare-fun call!6901 () ListLongMap!1429)

(declare-fun call!6900 () ListLongMap!1429)

(assert (=> bm!6895 (= call!6898 (+!99 (ite c!11622 call!6902 (ite c!11623 call!6901 call!6900)) (ite (or c!11622 c!11623) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(declare-fun bm!6896 () Bool)

(assert (=> bm!6896 (= call!6902 (getCurrentListMapNoExtraKeys!64 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun bm!6897 () Bool)

(assert (=> bm!6897 (= call!6900 call!6901)))

(declare-fun b!76256 () Bool)

(declare-fun e!49814 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!76256 (= e!49814 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!6898 () Bool)

(declare-fun lt!34702 () ListLongMap!1429)

(assert (=> bm!6898 (= call!6899 (contains!731 lt!34702 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76257 () Bool)

(declare-fun c!11625 () Bool)

(assert (=> b!76257 (= c!11625 (and (not (= (bvand (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!49812 () ListLongMap!1429)

(declare-fun e!49806 () ListLongMap!1429)

(assert (=> b!76257 (= e!49812 e!49806)))

(declare-fun b!76258 () Bool)

(declare-fun e!49809 () Bool)

(declare-fun apply!77 (ListLongMap!1429 (_ BitVec 64)) V!2963)

(assert (=> b!76258 (= e!49809 (= (apply!77 lt!34702 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun e!49811 () Bool)

(declare-fun b!76259 () Bool)

(assert (=> b!76259 (= e!49811 (= (apply!77 lt!34702 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76259 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2112 (_values!2230 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> b!76259 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun b!76260 () Bool)

(declare-fun res!40141 () Bool)

(declare-fun e!49808 () Bool)

(assert (=> b!76260 (=> (not res!40141) (not e!49808))))

(declare-fun e!49805 () Bool)

(assert (=> b!76260 (= res!40141 e!49805)))

(declare-fun res!40149 () Bool)

(assert (=> b!76260 (=> res!40149 e!49805)))

(assert (=> b!76260 (= res!40149 (not e!49814))))

(declare-fun res!40145 () Bool)

(assert (=> b!76260 (=> (not res!40145) (not e!49814))))

(assert (=> b!76260 (= res!40145 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun bm!6900 () Bool)

(assert (=> bm!6900 (= call!6897 (contains!731 lt!34702 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76261 () Bool)

(assert (=> b!76261 (= e!49808 e!49803)))

(declare-fun c!11624 () Bool)

(assert (=> b!76261 (= c!11624 (not (= (bvand (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76262 () Bool)

(assert (=> b!76262 (= e!49806 call!6903)))

(declare-fun b!76263 () Bool)

(declare-fun e!49804 () ListLongMap!1429)

(assert (=> b!76263 (= e!49804 (+!99 call!6898 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun b!76264 () Bool)

(assert (=> b!76264 (= e!49812 call!6903)))

(declare-fun b!76265 () Bool)

(assert (=> b!76265 (= e!49802 e!49809)))

(declare-fun res!40146 () Bool)

(assert (=> b!76265 (= res!40146 call!6897)))

(assert (=> b!76265 (=> (not res!40146) (not e!49809))))

(declare-fun b!76266 () Bool)

(assert (=> b!76266 (= e!49806 call!6900)))

(declare-fun b!76267 () Bool)

(declare-fun e!49810 () Bool)

(assert (=> b!76267 (= e!49810 (= (apply!77 lt!34702 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun b!76268 () Bool)

(declare-fun e!49813 () Bool)

(assert (=> b!76268 (= e!49813 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!76269 () Bool)

(assert (=> b!76269 (= e!49805 e!49811)))

(declare-fun res!40142 () Bool)

(assert (=> b!76269 (=> (not res!40142) (not e!49811))))

(assert (=> b!76269 (= res!40142 (contains!731 lt!34702 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76269 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun b!76270 () Bool)

(declare-fun res!40147 () Bool)

(assert (=> b!76270 (=> (not res!40147) (not e!49808))))

(assert (=> b!76270 (= res!40147 e!49802)))

(declare-fun c!11621 () Bool)

(assert (=> b!76270 (= c!11621 (not (= (bvand (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!76271 () Bool)

(assert (=> b!76271 (= e!49803 e!49810)))

(declare-fun res!40148 () Bool)

(assert (=> b!76271 (= res!40148 call!6899)))

(assert (=> b!76271 (=> (not res!40148) (not e!49810))))

(declare-fun b!76272 () Bool)

(declare-fun lt!34701 () Unit!2193)

(assert (=> b!76272 (= e!49807 lt!34701)))

(declare-fun lt!34700 () ListLongMap!1429)

(assert (=> b!76272 (= lt!34700 (getCurrentListMapNoExtraKeys!64 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun lt!34695 () (_ BitVec 64))

(assert (=> b!76272 (= lt!34695 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34686 () (_ BitVec 64))

(assert (=> b!76272 (= lt!34686 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34697 () Unit!2193)

(declare-fun addStillContains!53 (ListLongMap!1429 (_ BitVec 64) V!2963 (_ BitVec 64)) Unit!2193)

(assert (=> b!76272 (= lt!34697 (addStillContains!53 lt!34700 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) lt!34686))))

(assert (=> b!76272 (contains!731 (+!99 lt!34700 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34686)))

(declare-fun lt!34692 () Unit!2193)

(assert (=> b!76272 (= lt!34692 lt!34697)))

(declare-fun lt!34690 () ListLongMap!1429)

(assert (=> b!76272 (= lt!34690 (getCurrentListMapNoExtraKeys!64 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun lt!34687 () (_ BitVec 64))

(assert (=> b!76272 (= lt!34687 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34684 () (_ BitVec 64))

(assert (=> b!76272 (= lt!34684 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34699 () Unit!2193)

(declare-fun addApplyDifferent!53 (ListLongMap!1429 (_ BitVec 64) V!2963 (_ BitVec 64)) Unit!2193)

(assert (=> b!76272 (= lt!34699 (addApplyDifferent!53 lt!34690 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992))) lt!34684))))

(assert (=> b!76272 (= (apply!77 (+!99 lt!34690 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34684) (apply!77 lt!34690 lt!34684))))

(declare-fun lt!34688 () Unit!2193)

(assert (=> b!76272 (= lt!34688 lt!34699)))

(declare-fun lt!34698 () ListLongMap!1429)

(assert (=> b!76272 (= lt!34698 (getCurrentListMapNoExtraKeys!64 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun lt!34691 () (_ BitVec 64))

(assert (=> b!76272 (= lt!34691 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34696 () (_ BitVec 64))

(assert (=> b!76272 (= lt!34696 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34683 () Unit!2193)

(assert (=> b!76272 (= lt!34683 (addApplyDifferent!53 lt!34698 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) lt!34696))))

(assert (=> b!76272 (= (apply!77 (+!99 lt!34698 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34696) (apply!77 lt!34698 lt!34696))))

(declare-fun lt!34693 () Unit!2193)

(assert (=> b!76272 (= lt!34693 lt!34683)))

(declare-fun lt!34703 () ListLongMap!1429)

(assert (=> b!76272 (= lt!34703 (getCurrentListMapNoExtraKeys!64 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun lt!34694 () (_ BitVec 64))

(assert (=> b!76272 (= lt!34694 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34704 () (_ BitVec 64))

(assert (=> b!76272 (= lt!34704 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!76272 (= lt!34701 (addApplyDifferent!53 lt!34703 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992))) lt!34704))))

(assert (=> b!76272 (= (apply!77 (+!99 lt!34703 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34704) (apply!77 lt!34703 lt!34704))))

(declare-fun b!76273 () Bool)

(assert (=> b!76273 (= e!49804 e!49812)))

(assert (=> b!76273 (= c!11623 (and (not (= (bvand (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6899 () Bool)

(assert (=> bm!6899 (= call!6901 call!6902)))

(declare-fun d!18103 () Bool)

(assert (=> d!18103 e!49808))

(declare-fun res!40144 () Bool)

(assert (=> d!18103 (=> (not res!40144) (not e!49808))))

(assert (=> d!18103 (= res!40144 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))))

(declare-fun lt!34685 () ListLongMap!1429)

(assert (=> d!18103 (= lt!34702 lt!34685)))

(declare-fun lt!34689 () Unit!2193)

(assert (=> d!18103 (= lt!34689 e!49807)))

(declare-fun c!11620 () Bool)

(assert (=> d!18103 (= c!11620 e!49813)))

(declare-fun res!40143 () Bool)

(assert (=> d!18103 (=> (not res!40143) (not e!49813))))

(assert (=> d!18103 (= res!40143 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> d!18103 (= lt!34685 e!49804)))

(assert (=> d!18103 (= c!11622 (and (not (= (bvand (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18103 (validMask!0 (mask!6230 (v!2559 (underlying!266 thiss!992))))))

(assert (=> d!18103 (= (getCurrentListMap!426 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))) lt!34702)))

(assert (= (and d!18103 c!11622) b!76263))

(assert (= (and d!18103 (not c!11622)) b!76273))

(assert (= (and b!76273 c!11623) b!76264))

(assert (= (and b!76273 (not c!11623)) b!76257))

(assert (= (and b!76257 c!11625) b!76262))

(assert (= (and b!76257 (not c!11625)) b!76266))

(assert (= (or b!76262 b!76266) bm!6897))

(assert (= (or b!76264 bm!6897) bm!6899))

(assert (= (or b!76264 b!76262) bm!6894))

(assert (= (or b!76263 bm!6899) bm!6896))

(assert (= (or b!76263 bm!6894) bm!6895))

(assert (= (and d!18103 res!40143) b!76268))

(assert (= (and d!18103 c!11620) b!76272))

(assert (= (and d!18103 (not c!11620)) b!76255))

(assert (= (and d!18103 res!40144) b!76260))

(assert (= (and b!76260 res!40145) b!76256))

(assert (= (and b!76260 (not res!40149)) b!76269))

(assert (= (and b!76269 res!40142) b!76259))

(assert (= (and b!76260 res!40141) b!76270))

(assert (= (and b!76270 c!11621) b!76265))

(assert (= (and b!76270 (not c!11621)) b!76253))

(assert (= (and b!76265 res!40146) b!76258))

(assert (= (or b!76265 b!76253) bm!6900))

(assert (= (and b!76270 res!40147) b!76261))

(assert (= (and b!76261 c!11624) b!76271))

(assert (= (and b!76261 (not c!11624)) b!76254))

(assert (= (and b!76271 res!40148) b!76267))

(assert (= (or b!76271 b!76254) bm!6898))

(declare-fun b_lambda!3419 () Bool)

(assert (=> (not b_lambda!3419) (not b!76259)))

(assert (=> b!76259 t!5079))

(declare-fun b_and!4663 () Bool)

(assert (= b_and!4651 (and (=> t!5079 result!2731) b_and!4663)))

(assert (=> b!76259 t!5081))

(declare-fun b_and!4665 () Bool)

(assert (= b_and!4653 (and (=> t!5081 result!2735) b_and!4665)))

(declare-fun m!76015 () Bool)

(assert (=> bm!6898 m!76015))

(declare-fun m!76017 () Bool)

(assert (=> b!76272 m!76017))

(declare-fun m!76019 () Bool)

(assert (=> b!76272 m!76019))

(declare-fun m!76021 () Bool)

(assert (=> b!76272 m!76021))

(declare-fun m!76023 () Bool)

(assert (=> b!76272 m!76023))

(declare-fun m!76025 () Bool)

(assert (=> b!76272 m!76025))

(declare-fun m!76027 () Bool)

(assert (=> b!76272 m!76027))

(declare-fun m!76029 () Bool)

(assert (=> b!76272 m!76029))

(declare-fun m!76031 () Bool)

(assert (=> b!76272 m!76031))

(declare-fun m!76033 () Bool)

(assert (=> b!76272 m!76033))

(declare-fun m!76035 () Bool)

(assert (=> b!76272 m!76035))

(declare-fun m!76037 () Bool)

(assert (=> b!76272 m!76037))

(assert (=> b!76272 m!76025))

(declare-fun m!76039 () Bool)

(assert (=> b!76272 m!76039))

(assert (=> b!76272 m!76029))

(assert (=> b!76272 m!76039))

(declare-fun m!76041 () Bool)

(assert (=> b!76272 m!76041))

(assert (=> b!76272 m!75855))

(assert (=> b!76272 m!76035))

(declare-fun m!76043 () Bool)

(assert (=> b!76272 m!76043))

(declare-fun m!76045 () Bool)

(assert (=> b!76272 m!76045))

(declare-fun m!76047 () Bool)

(assert (=> b!76272 m!76047))

(declare-fun m!76049 () Bool)

(assert (=> b!76267 m!76049))

(declare-fun m!76051 () Bool)

(assert (=> b!76259 m!76051))

(assert (=> b!76259 m!76051))

(assert (=> b!76259 m!75829))

(declare-fun m!76053 () Bool)

(assert (=> b!76259 m!76053))

(assert (=> b!76259 m!75829))

(assert (=> b!76259 m!76033))

(assert (=> b!76259 m!76033))

(declare-fun m!76055 () Bool)

(assert (=> b!76259 m!76055))

(assert (=> b!76256 m!76033))

(assert (=> b!76256 m!76033))

(declare-fun m!76057 () Bool)

(assert (=> b!76256 m!76057))

(declare-fun m!76059 () Bool)

(assert (=> b!76258 m!76059))

(assert (=> bm!6896 m!75855))

(assert (=> b!76269 m!76033))

(assert (=> b!76269 m!76033))

(declare-fun m!76061 () Bool)

(assert (=> b!76269 m!76061))

(declare-fun m!76063 () Bool)

(assert (=> b!76263 m!76063))

(assert (=> b!76268 m!76033))

(assert (=> b!76268 m!76033))

(assert (=> b!76268 m!76057))

(declare-fun m!76065 () Bool)

(assert (=> bm!6900 m!76065))

(declare-fun m!76067 () Bool)

(assert (=> bm!6895 m!76067))

(assert (=> d!18103 m!75847))

(assert (=> b!75995 d!18103))

(declare-fun d!18105 () Bool)

(assert (=> d!18105 (= (valid!298 thiss!992) (valid!299 (v!2559 (underlying!266 thiss!992))))))

(declare-fun bs!3262 () Bool)

(assert (= bs!3262 d!18105))

(declare-fun m!76069 () Bool)

(assert (=> bs!3262 m!76069))

(assert (=> start!10024 d!18105))

(declare-fun d!18107 () Bool)

(declare-fun e!49817 () Bool)

(assert (=> d!18107 e!49817))

(declare-fun res!40155 () Bool)

(assert (=> d!18107 (=> (not res!40155) (not e!49817))))

(declare-fun lt!34714 () ListLongMap!1429)

(assert (=> d!18107 (= res!40155 (contains!731 lt!34714 (_1!1081 lt!34509)))))

(declare-fun lt!34713 () List!1489)

(assert (=> d!18107 (= lt!34714 (ListLongMap!1430 lt!34713))))

(declare-fun lt!34716 () Unit!2193)

(declare-fun lt!34715 () Unit!2193)

(assert (=> d!18107 (= lt!34716 lt!34715)))

(assert (=> d!18107 (= (getValueByKey!135 lt!34713 (_1!1081 lt!34509)) (Some!140 (_2!1081 lt!34509)))))

(declare-fun lemmaContainsTupThenGetReturnValue!52 (List!1489 (_ BitVec 64) V!2963) Unit!2193)

(assert (=> d!18107 (= lt!34715 (lemmaContainsTupThenGetReturnValue!52 lt!34713 (_1!1081 lt!34509) (_2!1081 lt!34509)))))

(declare-fun insertStrictlySorted!55 (List!1489 (_ BitVec 64) V!2963) List!1489)

(assert (=> d!18107 (= lt!34713 (insertStrictlySorted!55 (toList!730 lt!34498) (_1!1081 lt!34509) (_2!1081 lt!34509)))))

(assert (=> d!18107 (= (+!99 lt!34498 lt!34509) lt!34714)))

(declare-fun b!76278 () Bool)

(declare-fun res!40154 () Bool)

(assert (=> b!76278 (=> (not res!40154) (not e!49817))))

(assert (=> b!76278 (= res!40154 (= (getValueByKey!135 (toList!730 lt!34714) (_1!1081 lt!34509)) (Some!140 (_2!1081 lt!34509))))))

(declare-fun b!76279 () Bool)

(declare-fun contains!733 (List!1489 tuple2!2140) Bool)

(assert (=> b!76279 (= e!49817 (contains!733 (toList!730 lt!34714) lt!34509))))

(assert (= (and d!18107 res!40155) b!76278))

(assert (= (and b!76278 res!40154) b!76279))

(declare-fun m!76071 () Bool)

(assert (=> d!18107 m!76071))

(declare-fun m!76073 () Bool)

(assert (=> d!18107 m!76073))

(declare-fun m!76075 () Bool)

(assert (=> d!18107 m!76075))

(declare-fun m!76077 () Bool)

(assert (=> d!18107 m!76077))

(declare-fun m!76079 () Bool)

(assert (=> b!76278 m!76079))

(declare-fun m!76081 () Bool)

(assert (=> b!76279 m!76081))

(assert (=> b!75991 d!18107))

(declare-fun b!76304 () Bool)

(declare-fun res!40166 () Bool)

(declare-fun e!49837 () Bool)

(assert (=> b!76304 (=> (not res!40166) (not e!49837))))

(declare-fun lt!34731 () ListLongMap!1429)

(assert (=> b!76304 (= res!40166 (not (contains!731 lt!34731 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!76305 () Bool)

(declare-fun e!49834 () Bool)

(assert (=> b!76305 (= e!49834 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76305 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!76306 () Bool)

(declare-fun e!49833 () ListLongMap!1429)

(declare-fun e!49832 () ListLongMap!1429)

(assert (=> b!76306 (= e!49833 e!49832)))

(declare-fun c!11635 () Bool)

(assert (=> b!76306 (= c!11635 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!76307 () Bool)

(declare-fun e!49836 () Bool)

(declare-fun e!49835 () Bool)

(assert (=> b!76307 (= e!49836 e!49835)))

(assert (=> b!76307 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun res!40165 () Bool)

(assert (=> b!76307 (= res!40165 (contains!731 lt!34731 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76307 (=> (not res!40165) (not e!49835))))

(declare-fun b!76308 () Bool)

(declare-fun e!49838 () Bool)

(declare-fun isEmpty!322 (ListLongMap!1429) Bool)

(assert (=> b!76308 (= e!49838 (isEmpty!322 lt!34731))))

(declare-fun d!18109 () Bool)

(assert (=> d!18109 e!49837))

(declare-fun res!40167 () Bool)

(assert (=> d!18109 (=> (not res!40167) (not e!49837))))

(assert (=> d!18109 (= res!40167 (not (contains!731 lt!34731 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18109 (= lt!34731 e!49833)))

(declare-fun c!11636 () Bool)

(assert (=> d!18109 (= c!11636 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> d!18109 (validMask!0 (mask!6230 (v!2559 (underlying!266 thiss!992))))))

(assert (=> d!18109 (= (getCurrentListMapNoExtraKeys!64 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))) lt!34731)))

(declare-fun b!76309 () Bool)

(assert (=> b!76309 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> b!76309 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2112 (_values!2230 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> b!76309 (= e!49835 (= (apply!77 lt!34731 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!76310 () Bool)

(assert (=> b!76310 (= e!49838 (= lt!34731 (getCurrentListMapNoExtraKeys!64 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun b!76311 () Bool)

(assert (=> b!76311 (= e!49833 (ListLongMap!1430 Nil!1486))))

(declare-fun b!76312 () Bool)

(declare-fun lt!34737 () Unit!2193)

(declare-fun lt!34733 () Unit!2193)

(assert (=> b!76312 (= lt!34737 lt!34733)))

(declare-fun lt!34734 () (_ BitVec 64))

(declare-fun lt!34736 () (_ BitVec 64))

(declare-fun lt!34735 () V!2963)

(declare-fun lt!34732 () ListLongMap!1429)

(assert (=> b!76312 (not (contains!731 (+!99 lt!34732 (tuple2!2141 lt!34734 lt!34735)) lt!34736))))

(declare-fun addStillNotContains!26 (ListLongMap!1429 (_ BitVec 64) V!2963 (_ BitVec 64)) Unit!2193)

(assert (=> b!76312 (= lt!34733 (addStillNotContains!26 lt!34732 lt!34734 lt!34735 lt!34736))))

(assert (=> b!76312 (= lt!34736 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!76312 (= lt!34735 (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76312 (= lt!34734 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!6906 () ListLongMap!1429)

(assert (=> b!76312 (= lt!34732 call!6906)))

(assert (=> b!76312 (= e!49832 (+!99 call!6906 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!6903 () Bool)

(assert (=> bm!6903 (= call!6906 (getCurrentListMapNoExtraKeys!64 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun b!76313 () Bool)

(assert (=> b!76313 (= e!49837 e!49836)))

(declare-fun c!11634 () Bool)

(assert (=> b!76313 (= c!11634 e!49834)))

(declare-fun res!40164 () Bool)

(assert (=> b!76313 (=> (not res!40164) (not e!49834))))

(assert (=> b!76313 (= res!40164 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun b!76314 () Bool)

(assert (=> b!76314 (= e!49832 call!6906)))

(declare-fun b!76315 () Bool)

(assert (=> b!76315 (= e!49836 e!49838)))

(declare-fun c!11637 () Bool)

(assert (=> b!76315 (= c!11637 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(assert (= (and d!18109 c!11636) b!76311))

(assert (= (and d!18109 (not c!11636)) b!76306))

(assert (= (and b!76306 c!11635) b!76312))

(assert (= (and b!76306 (not c!11635)) b!76314))

(assert (= (or b!76312 b!76314) bm!6903))

(assert (= (and d!18109 res!40167) b!76304))

(assert (= (and b!76304 res!40166) b!76313))

(assert (= (and b!76313 res!40164) b!76305))

(assert (= (and b!76313 c!11634) b!76307))

(assert (= (and b!76313 (not c!11634)) b!76315))

(assert (= (and b!76307 res!40165) b!76309))

(assert (= (and b!76315 c!11637) b!76310))

(assert (= (and b!76315 (not c!11637)) b!76308))

(declare-fun b_lambda!3421 () Bool)

(assert (=> (not b_lambda!3421) (not b!76309)))

(assert (=> b!76309 t!5079))

(declare-fun b_and!4667 () Bool)

(assert (= b_and!4663 (and (=> t!5079 result!2731) b_and!4667)))

(assert (=> b!76309 t!5081))

(declare-fun b_and!4669 () Bool)

(assert (= b_and!4665 (and (=> t!5081 result!2735) b_and!4669)))

(declare-fun b_lambda!3423 () Bool)

(assert (=> (not b_lambda!3423) (not b!76312)))

(assert (=> b!76312 t!5079))

(declare-fun b_and!4671 () Bool)

(assert (= b_and!4667 (and (=> t!5079 result!2731) b_and!4671)))

(assert (=> b!76312 t!5081))

(declare-fun b_and!4673 () Bool)

(assert (= b_and!4669 (and (=> t!5081 result!2735) b_and!4673)))

(assert (=> b!76306 m!76033))

(assert (=> b!76306 m!76033))

(assert (=> b!76306 m!76057))

(assert (=> b!76307 m!76033))

(assert (=> b!76307 m!76033))

(declare-fun m!76083 () Bool)

(assert (=> b!76307 m!76083))

(declare-fun m!76085 () Bool)

(assert (=> d!18109 m!76085))

(assert (=> d!18109 m!75847))

(declare-fun m!76087 () Bool)

(assert (=> b!76304 m!76087))

(declare-fun m!76089 () Bool)

(assert (=> b!76312 m!76089))

(assert (=> b!76312 m!75829))

(assert (=> b!76312 m!76089))

(declare-fun m!76091 () Bool)

(assert (=> b!76312 m!76091))

(assert (=> b!76312 m!76051))

(assert (=> b!76312 m!75829))

(assert (=> b!76312 m!76053))

(assert (=> b!76312 m!76051))

(declare-fun m!76093 () Bool)

(assert (=> b!76312 m!76093))

(declare-fun m!76095 () Bool)

(assert (=> b!76312 m!76095))

(assert (=> b!76312 m!76033))

(assert (=> b!76305 m!76033))

(assert (=> b!76305 m!76033))

(assert (=> b!76305 m!76057))

(declare-fun m!76097 () Bool)

(assert (=> b!76308 m!76097))

(declare-fun m!76099 () Bool)

(assert (=> b!76310 m!76099))

(assert (=> b!76309 m!76033))

(assert (=> b!76309 m!75829))

(assert (=> b!76309 m!76051))

(assert (=> b!76309 m!75829))

(assert (=> b!76309 m!76053))

(assert (=> b!76309 m!76051))

(assert (=> b!76309 m!76033))

(declare-fun m!76101 () Bool)

(assert (=> b!76309 m!76101))

(assert (=> bm!6903 m!76099))

(assert (=> b!75991 d!18109))

(declare-fun d!18111 () Bool)

(declare-fun e!49839 () Bool)

(assert (=> d!18111 e!49839))

(declare-fun res!40169 () Bool)

(assert (=> d!18111 (=> (not res!40169) (not e!49839))))

(declare-fun lt!34739 () ListLongMap!1429)

(assert (=> d!18111 (= res!40169 (contains!731 lt!34739 (_1!1081 lt!34508)))))

(declare-fun lt!34738 () List!1489)

(assert (=> d!18111 (= lt!34739 (ListLongMap!1430 lt!34738))))

(declare-fun lt!34741 () Unit!2193)

(declare-fun lt!34740 () Unit!2193)

(assert (=> d!18111 (= lt!34741 lt!34740)))

(assert (=> d!18111 (= (getValueByKey!135 lt!34738 (_1!1081 lt!34508)) (Some!140 (_2!1081 lt!34508)))))

(assert (=> d!18111 (= lt!34740 (lemmaContainsTupThenGetReturnValue!52 lt!34738 (_1!1081 lt!34508) (_2!1081 lt!34508)))))

(assert (=> d!18111 (= lt!34738 (insertStrictlySorted!55 (toList!730 lt!34498) (_1!1081 lt!34508) (_2!1081 lt!34508)))))

(assert (=> d!18111 (= (+!99 lt!34498 lt!34508) lt!34739)))

(declare-fun b!76316 () Bool)

(declare-fun res!40168 () Bool)

(assert (=> b!76316 (=> (not res!40168) (not e!49839))))

(assert (=> b!76316 (= res!40168 (= (getValueByKey!135 (toList!730 lt!34739) (_1!1081 lt!34508)) (Some!140 (_2!1081 lt!34508))))))

(declare-fun b!76317 () Bool)

(assert (=> b!76317 (= e!49839 (contains!733 (toList!730 lt!34739) lt!34508))))

(assert (= (and d!18111 res!40169) b!76316))

(assert (= (and b!76316 res!40168) b!76317))

(declare-fun m!76103 () Bool)

(assert (=> d!18111 m!76103))

(declare-fun m!76105 () Bool)

(assert (=> d!18111 m!76105))

(declare-fun m!76107 () Bool)

(assert (=> d!18111 m!76107))

(declare-fun m!76109 () Bool)

(assert (=> d!18111 m!76109))

(declare-fun m!76111 () Bool)

(assert (=> b!76316 m!76111))

(declare-fun m!76113 () Bool)

(assert (=> b!76317 m!76113))

(assert (=> b!75991 d!18111))

(declare-fun d!18113 () Bool)

(assert (=> d!18113 (= (+!99 (+!99 lt!34498 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) (+!99 (+!99 lt!34498 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))))

(declare-fun lt!34744 () Unit!2193)

(declare-fun choose!438 (ListLongMap!1429 (_ BitVec 64) V!2963 (_ BitVec 64) V!2963) Unit!2193)

(assert (=> d!18113 (= lt!34744 (choose!438 lt!34498 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))

(assert (=> d!18113 (not (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18113 (= (addCommutativeForDiffKeys!18 lt!34498 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) lt!34744)))

(declare-fun bs!3263 () Bool)

(assert (= bs!3263 d!18113))

(assert (=> bs!3263 m!75825))

(declare-fun m!76115 () Bool)

(assert (=> bs!3263 m!76115))

(declare-fun m!76117 () Bool)

(assert (=> bs!3263 m!76117))

(declare-fun m!76119 () Bool)

(assert (=> bs!3263 m!76119))

(declare-fun m!76121 () Bool)

(assert (=> bs!3263 m!76121))

(assert (=> bs!3263 m!76119))

(assert (=> bs!3263 m!76117))

(declare-fun m!76123 () Bool)

(assert (=> bs!3263 m!76123))

(assert (=> b!75991 d!18113))

(declare-fun d!18115 () Bool)

(declare-fun e!49840 () Bool)

(assert (=> d!18115 e!49840))

(declare-fun res!40171 () Bool)

(assert (=> d!18115 (=> (not res!40171) (not e!49840))))

(declare-fun lt!34746 () ListLongMap!1429)

(assert (=> d!18115 (= res!40171 (contains!731 lt!34746 (_1!1081 lt!34509)))))

(declare-fun lt!34745 () List!1489)

(assert (=> d!18115 (= lt!34746 (ListLongMap!1430 lt!34745))))

(declare-fun lt!34748 () Unit!2193)

(declare-fun lt!34747 () Unit!2193)

(assert (=> d!18115 (= lt!34748 lt!34747)))

(assert (=> d!18115 (= (getValueByKey!135 lt!34745 (_1!1081 lt!34509)) (Some!140 (_2!1081 lt!34509)))))

(assert (=> d!18115 (= lt!34747 (lemmaContainsTupThenGetReturnValue!52 lt!34745 (_1!1081 lt!34509) (_2!1081 lt!34509)))))

(assert (=> d!18115 (= lt!34745 (insertStrictlySorted!55 (toList!730 (+!99 lt!34498 lt!34508)) (_1!1081 lt!34509) (_2!1081 lt!34509)))))

(assert (=> d!18115 (= (+!99 (+!99 lt!34498 lt!34508) lt!34509) lt!34746)))

(declare-fun b!76318 () Bool)

(declare-fun res!40170 () Bool)

(assert (=> b!76318 (=> (not res!40170) (not e!49840))))

(assert (=> b!76318 (= res!40170 (= (getValueByKey!135 (toList!730 lt!34746) (_1!1081 lt!34509)) (Some!140 (_2!1081 lt!34509))))))

(declare-fun b!76319 () Bool)

(assert (=> b!76319 (= e!49840 (contains!733 (toList!730 lt!34746) lt!34509))))

(assert (= (and d!18115 res!40171) b!76318))

(assert (= (and b!76318 res!40170) b!76319))

(declare-fun m!76125 () Bool)

(assert (=> d!18115 m!76125))

(declare-fun m!76127 () Bool)

(assert (=> d!18115 m!76127))

(declare-fun m!76129 () Bool)

(assert (=> d!18115 m!76129))

(declare-fun m!76131 () Bool)

(assert (=> d!18115 m!76131))

(declare-fun m!76133 () Bool)

(assert (=> b!76318 m!76133))

(declare-fun m!76135 () Bool)

(assert (=> b!76319 m!76135))

(assert (=> b!75991 d!18115))

(declare-fun d!18117 () Bool)

(assert (=> d!18117 (= (validMask!0 (mask!6230 (v!2559 (underlying!266 thiss!992)))) (and (or (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000001111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000011111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000001111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000011111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000001111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000011111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000001111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000011111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000000111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000001111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000011111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000000111111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000001111111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000011111111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000000111111111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000001111111111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000011111111111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000000111111111111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000001111111111111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000011111111111111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00000111111111111111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00001111111111111111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00011111111111111111111111111111) (= (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6230 (v!2559 (underlying!266 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!75991 d!18117))

(declare-fun d!18119 () Bool)

(declare-fun e!49841 () Bool)

(assert (=> d!18119 e!49841))

(declare-fun res!40173 () Bool)

(assert (=> d!18119 (=> (not res!40173) (not e!49841))))

(declare-fun lt!34750 () ListLongMap!1429)

(assert (=> d!18119 (= res!40173 (contains!731 lt!34750 (_1!1081 lt!34508)))))

(declare-fun lt!34749 () List!1489)

(assert (=> d!18119 (= lt!34750 (ListLongMap!1430 lt!34749))))

(declare-fun lt!34752 () Unit!2193)

(declare-fun lt!34751 () Unit!2193)

(assert (=> d!18119 (= lt!34752 lt!34751)))

(assert (=> d!18119 (= (getValueByKey!135 lt!34749 (_1!1081 lt!34508)) (Some!140 (_2!1081 lt!34508)))))

(assert (=> d!18119 (= lt!34751 (lemmaContainsTupThenGetReturnValue!52 lt!34749 (_1!1081 lt!34508) (_2!1081 lt!34508)))))

(assert (=> d!18119 (= lt!34749 (insertStrictlySorted!55 (toList!730 (+!99 lt!34498 lt!34509)) (_1!1081 lt!34508) (_2!1081 lt!34508)))))

(assert (=> d!18119 (= (+!99 (+!99 lt!34498 lt!34509) lt!34508) lt!34750)))

(declare-fun b!76320 () Bool)

(declare-fun res!40172 () Bool)

(assert (=> b!76320 (=> (not res!40172) (not e!49841))))

(assert (=> b!76320 (= res!40172 (= (getValueByKey!135 (toList!730 lt!34750) (_1!1081 lt!34508)) (Some!140 (_2!1081 lt!34508))))))

(declare-fun b!76321 () Bool)

(assert (=> b!76321 (= e!49841 (contains!733 (toList!730 lt!34750) lt!34508))))

(assert (= (and d!18119 res!40173) b!76320))

(assert (= (and b!76320 res!40172) b!76321))

(declare-fun m!76137 () Bool)

(assert (=> d!18119 m!76137))

(declare-fun m!76139 () Bool)

(assert (=> d!18119 m!76139))

(declare-fun m!76141 () Bool)

(assert (=> d!18119 m!76141))

(declare-fun m!76143 () Bool)

(assert (=> d!18119 m!76143))

(declare-fun m!76145 () Bool)

(assert (=> b!76320 m!76145))

(declare-fun m!76147 () Bool)

(assert (=> b!76321 m!76147))

(assert (=> b!75991 d!18119))

(declare-fun d!18121 () Bool)

(assert (=> d!18121 (not (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34755 () Unit!2193)

(declare-fun choose!68 (array!3923 (_ BitVec 32) (_ BitVec 64) List!1488) Unit!2193)

(assert (=> d!18121 (= lt!34755 (choose!68 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) Nil!1485)))))

(assert (=> d!18121 (bvslt (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!18121 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) Nil!1485)) lt!34755)))

(declare-fun bs!3264 () Bool)

(assert (= bs!3264 d!18121))

(assert (=> bs!3264 m!75825))

(assert (=> bs!3264 m!75839))

(assert (=> bs!3264 m!75825))

(declare-fun m!76149 () Bool)

(assert (=> bs!3264 m!76149))

(assert (=> b!75977 d!18121))

(declare-fun d!18123 () Bool)

(assert (=> d!18123 (arrayNoDuplicates!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) from!355 Nil!1485)))

(declare-fun lt!34758 () Unit!2193)

(declare-fun choose!39 (array!3923 (_ BitVec 32) (_ BitVec 32)) Unit!2193)

(assert (=> d!18123 (= lt!34758 (choose!39 (_keys!3905 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!18123 (bvslt (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!18123 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000000 from!355) lt!34758)))

(declare-fun bs!3265 () Bool)

(assert (= bs!3265 d!18123))

(assert (=> bs!3265 m!75835))

(declare-fun m!76151 () Bool)

(assert (=> bs!3265 m!76151))

(assert (=> b!75977 d!18123))

(declare-fun d!18125 () Bool)

(declare-fun res!40178 () Bool)

(declare-fun e!49846 () Bool)

(assert (=> d!18125 (=> res!40178 e!49846)))

(assert (=> d!18125 (= res!40178 (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (=> d!18125 (= (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!49846)))

(declare-fun b!76326 () Bool)

(declare-fun e!49847 () Bool)

(assert (=> b!76326 (= e!49846 e!49847)))

(declare-fun res!40179 () Bool)

(assert (=> b!76326 (=> (not res!40179) (not e!49847))))

(assert (=> b!76326 (= res!40179 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun b!76327 () Bool)

(assert (=> b!76327 (= e!49847 (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!18125 (not res!40178)) b!76326))

(assert (= (and b!76326 res!40179) b!76327))

(assert (=> d!18125 m!76033))

(assert (=> b!76327 m!75825))

(declare-fun m!76153 () Bool)

(assert (=> b!76327 m!76153))

(assert (=> b!75977 d!18125))

(declare-fun d!18127 () Bool)

(declare-fun e!49850 () Bool)

(assert (=> d!18127 e!49850))

(declare-fun c!11640 () Bool)

(assert (=> d!18127 (= c!11640 (and (not (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!34761 () Unit!2193)

(declare-fun choose!439 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 64) (_ BitVec 32) Int) Unit!2193)

(assert (=> d!18127 (= lt!34761 (choose!439 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))))))

(assert (=> d!18127 (validMask!0 (mask!6230 (v!2559 (underlying!266 thiss!992))))))

(assert (=> d!18127 (= (lemmaListMapContainsThenArrayContainsFrom!54 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))) lt!34761)))

(declare-fun b!76332 () Bool)

(assert (=> b!76332 (= e!49850 (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!76333 () Bool)

(assert (=> b!76333 (= e!49850 (ite (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!18127 c!11640) b!76332))

(assert (= (and d!18127 (not c!11640)) b!76333))

(assert (=> d!18127 m!75825))

(declare-fun m!76155 () Bool)

(assert (=> d!18127 m!76155))

(assert (=> d!18127 m!75847))

(assert (=> b!76332 m!75825))

(assert (=> b!76332 m!75839))

(assert (=> b!75977 d!18127))

(declare-fun b!76344 () Bool)

(declare-fun e!49862 () Bool)

(declare-fun e!49861 () Bool)

(assert (=> b!76344 (= e!49862 e!49861)))

(declare-fun res!40188 () Bool)

(assert (=> b!76344 (=> (not res!40188) (not e!49861))))

(declare-fun e!49860 () Bool)

(assert (=> b!76344 (= res!40188 (not e!49860))))

(declare-fun res!40186 () Bool)

(assert (=> b!76344 (=> (not res!40186) (not e!49860))))

(assert (=> b!76344 (= res!40186 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun b!76345 () Bool)

(declare-fun e!49859 () Bool)

(declare-fun call!6909 () Bool)

(assert (=> b!76345 (= e!49859 call!6909)))

(declare-fun b!76346 () Bool)

(assert (=> b!76346 (= e!49861 e!49859)))

(declare-fun c!11643 () Bool)

(assert (=> b!76346 (= c!11643 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun bm!6906 () Bool)

(assert (=> bm!6906 (= call!6909 (arrayNoDuplicates!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11643 (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) Nil!1485) Nil!1485)))))

(declare-fun b!76347 () Bool)

(assert (=> b!76347 (= e!49859 call!6909)))

(declare-fun d!18129 () Bool)

(declare-fun res!40187 () Bool)

(assert (=> d!18129 (=> res!40187 e!49862)))

(assert (=> d!18129 (= res!40187 (bvsge from!355 (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> d!18129 (= (arrayNoDuplicates!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) from!355 Nil!1485) e!49862)))

(declare-fun b!76348 () Bool)

(declare-fun contains!734 (List!1488 (_ BitVec 64)) Bool)

(assert (=> b!76348 (= e!49860 (contains!734 Nil!1485 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (= (and d!18129 (not res!40187)) b!76344))

(assert (= (and b!76344 res!40186) b!76348))

(assert (= (and b!76344 res!40188) b!76346))

(assert (= (and b!76346 c!11643) b!76347))

(assert (= (and b!76346 (not c!11643)) b!76345))

(assert (= (or b!76347 b!76345) bm!6906))

(assert (=> b!76344 m!75825))

(assert (=> b!76344 m!75825))

(declare-fun m!76157 () Bool)

(assert (=> b!76344 m!76157))

(assert (=> b!76346 m!75825))

(assert (=> b!76346 m!75825))

(assert (=> b!76346 m!76157))

(assert (=> bm!6906 m!75825))

(declare-fun m!76159 () Bool)

(assert (=> bm!6906 m!76159))

(assert (=> b!76348 m!75825))

(assert (=> b!76348 m!75825))

(declare-fun m!76161 () Bool)

(assert (=> b!76348 m!76161))

(assert (=> b!75977 d!18129))

(declare-fun b!76349 () Bool)

(declare-fun e!49866 () Bool)

(declare-fun e!49865 () Bool)

(assert (=> b!76349 (= e!49866 e!49865)))

(declare-fun res!40191 () Bool)

(assert (=> b!76349 (=> (not res!40191) (not e!49865))))

(declare-fun e!49864 () Bool)

(assert (=> b!76349 (= res!40191 (not e!49864))))

(declare-fun res!40189 () Bool)

(assert (=> b!76349 (=> (not res!40189) (not e!49864))))

(assert (=> b!76349 (= res!40189 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!76350 () Bool)

(declare-fun e!49863 () Bool)

(declare-fun call!6910 () Bool)

(assert (=> b!76350 (= e!49863 call!6910)))

(declare-fun b!76351 () Bool)

(assert (=> b!76351 (= e!49865 e!49863)))

(declare-fun c!11644 () Bool)

(assert (=> b!76351 (= c!11644 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!6907 () Bool)

(assert (=> bm!6907 (= call!6910 (arrayNoDuplicates!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11644 (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000) Nil!1485) Nil!1485)))))

(declare-fun b!76352 () Bool)

(assert (=> b!76352 (= e!49863 call!6910)))

(declare-fun d!18131 () Bool)

(declare-fun res!40190 () Bool)

(assert (=> d!18131 (=> res!40190 e!49866)))

(assert (=> d!18131 (= res!40190 (bvsge #b00000000000000000000000000000000 (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> d!18131 (= (arrayNoDuplicates!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000000 Nil!1485) e!49866)))

(declare-fun b!76353 () Bool)

(assert (=> b!76353 (= e!49864 (contains!734 Nil!1485 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!18131 (not res!40190)) b!76349))

(assert (= (and b!76349 res!40189) b!76353))

(assert (= (and b!76349 res!40191) b!76351))

(assert (= (and b!76351 c!11644) b!76352))

(assert (= (and b!76351 (not c!11644)) b!76350))

(assert (= (or b!76352 b!76350) bm!6907))

(declare-fun m!76163 () Bool)

(assert (=> b!76349 m!76163))

(assert (=> b!76349 m!76163))

(declare-fun m!76165 () Bool)

(assert (=> b!76349 m!76165))

(assert (=> b!76351 m!76163))

(assert (=> b!76351 m!76163))

(assert (=> b!76351 m!76165))

(assert (=> bm!6907 m!76163))

(declare-fun m!76167 () Bool)

(assert (=> bm!6907 m!76167))

(assert (=> b!76353 m!76163))

(assert (=> b!76353 m!76163))

(declare-fun m!76169 () Bool)

(assert (=> b!76353 m!76169))

(assert (=> b!75989 d!18131))

(declare-fun bm!6910 () Bool)

(declare-fun call!6913 () Bool)

(assert (=> bm!6910 (= call!6913 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3905 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun d!18133 () Bool)

(declare-fun res!40197 () Bool)

(declare-fun e!49873 () Bool)

(assert (=> d!18133 (=> res!40197 e!49873)))

(assert (=> d!18133 (= res!40197 (bvsge #b00000000000000000000000000000000 (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> d!18133 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992)))) e!49873)))

(declare-fun b!76362 () Bool)

(declare-fun e!49874 () Bool)

(declare-fun e!49875 () Bool)

(assert (=> b!76362 (= e!49874 e!49875)))

(declare-fun lt!34770 () (_ BitVec 64))

(assert (=> b!76362 (= lt!34770 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!34768 () Unit!2193)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3923 (_ BitVec 64) (_ BitVec 32)) Unit!2193)

(assert (=> b!76362 (= lt!34768 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) lt!34770 #b00000000000000000000000000000000))))

(assert (=> b!76362 (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) lt!34770 #b00000000000000000000000000000000)))

(declare-fun lt!34769 () Unit!2193)

(assert (=> b!76362 (= lt!34769 lt!34768)))

(declare-fun res!40196 () Bool)

(assert (=> b!76362 (= res!40196 (= (seekEntryOrOpen!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000) (_keys!3905 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992)))) (Found!238 #b00000000000000000000000000000000)))))

(assert (=> b!76362 (=> (not res!40196) (not e!49875))))

(declare-fun b!76363 () Bool)

(assert (=> b!76363 (= e!49874 call!6913)))

(declare-fun b!76364 () Bool)

(assert (=> b!76364 (= e!49873 e!49874)))

(declare-fun c!11647 () Bool)

(assert (=> b!76364 (= c!11647 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!76365 () Bool)

(assert (=> b!76365 (= e!49875 call!6913)))

(assert (= (and d!18133 (not res!40197)) b!76364))

(assert (= (and b!76364 c!11647) b!76362))

(assert (= (and b!76364 (not c!11647)) b!76363))

(assert (= (and b!76362 res!40196) b!76365))

(assert (= (or b!76365 b!76363) bm!6910))

(declare-fun m!76171 () Bool)

(assert (=> bm!6910 m!76171))

(assert (=> b!76362 m!76163))

(declare-fun m!76173 () Bool)

(assert (=> b!76362 m!76173))

(declare-fun m!76175 () Bool)

(assert (=> b!76362 m!76175))

(assert (=> b!76362 m!76163))

(declare-fun m!76177 () Bool)

(assert (=> b!76362 m!76177))

(assert (=> b!76364 m!76163))

(assert (=> b!76364 m!76163))

(assert (=> b!76364 m!76165))

(assert (=> b!75976 d!18133))

(declare-fun d!18135 () Bool)

(assert (=> d!18135 (= (array_inv!1155 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvsge (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!75990 d!18135))

(declare-fun d!18137 () Bool)

(assert (=> d!18137 (= (array_inv!1156 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvsge (size!2112 (_values!2230 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!75990 d!18137))

(declare-fun d!18139 () Bool)

(assert (=> d!18139 (= (array_inv!1155 (_keys!3905 newMap!16)) (bvsge (size!2111 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75980 d!18139))

(declare-fun d!18141 () Bool)

(assert (=> d!18141 (= (array_inv!1156 (_values!2230 newMap!16)) (bvsge (size!2112 (_values!2230 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75980 d!18141))

(declare-fun b!76373 () Bool)

(declare-fun e!49881 () Bool)

(assert (=> b!76373 (= e!49881 tp_is_empty!2487)))

(declare-fun mapIsEmpty!3231 () Bool)

(declare-fun mapRes!3231 () Bool)

(assert (=> mapIsEmpty!3231 mapRes!3231))

(declare-fun condMapEmpty!3231 () Bool)

(declare-fun mapDefault!3231 () ValueCell!900)

(assert (=> mapNonEmpty!3222 (= condMapEmpty!3231 (= mapRest!3222 ((as const (Array (_ BitVec 32) ValueCell!900)) mapDefault!3231)))))

(assert (=> mapNonEmpty!3222 (= tp!8613 (and e!49881 mapRes!3231))))

(declare-fun b!76372 () Bool)

(declare-fun e!49880 () Bool)

(assert (=> b!76372 (= e!49880 tp_is_empty!2487)))

(declare-fun mapNonEmpty!3231 () Bool)

(declare-fun tp!8631 () Bool)

(assert (=> mapNonEmpty!3231 (= mapRes!3231 (and tp!8631 e!49880))))

(declare-fun mapKey!3231 () (_ BitVec 32))

(declare-fun mapRest!3231 () (Array (_ BitVec 32) ValueCell!900))

(declare-fun mapValue!3231 () ValueCell!900)

(assert (=> mapNonEmpty!3231 (= mapRest!3222 (store mapRest!3231 mapKey!3231 mapValue!3231))))

(assert (= (and mapNonEmpty!3222 condMapEmpty!3231) mapIsEmpty!3231))

(assert (= (and mapNonEmpty!3222 (not condMapEmpty!3231)) mapNonEmpty!3231))

(assert (= (and mapNonEmpty!3231 ((_ is ValueCellFull!900) mapValue!3231)) b!76372))

(assert (= (and mapNonEmpty!3222 ((_ is ValueCellFull!900) mapDefault!3231)) b!76373))

(declare-fun m!76179 () Bool)

(assert (=> mapNonEmpty!3231 m!76179))

(declare-fun b!76375 () Bool)

(declare-fun e!49883 () Bool)

(assert (=> b!76375 (= e!49883 tp_is_empty!2487)))

(declare-fun mapIsEmpty!3232 () Bool)

(declare-fun mapRes!3232 () Bool)

(assert (=> mapIsEmpty!3232 mapRes!3232))

(declare-fun condMapEmpty!3232 () Bool)

(declare-fun mapDefault!3232 () ValueCell!900)

(assert (=> mapNonEmpty!3221 (= condMapEmpty!3232 (= mapRest!3221 ((as const (Array (_ BitVec 32) ValueCell!900)) mapDefault!3232)))))

(assert (=> mapNonEmpty!3221 (= tp!8616 (and e!49883 mapRes!3232))))

(declare-fun b!76374 () Bool)

(declare-fun e!49882 () Bool)

(assert (=> b!76374 (= e!49882 tp_is_empty!2487)))

(declare-fun mapNonEmpty!3232 () Bool)

(declare-fun tp!8632 () Bool)

(assert (=> mapNonEmpty!3232 (= mapRes!3232 (and tp!8632 e!49882))))

(declare-fun mapRest!3232 () (Array (_ BitVec 32) ValueCell!900))

(declare-fun mapKey!3232 () (_ BitVec 32))

(declare-fun mapValue!3232 () ValueCell!900)

(assert (=> mapNonEmpty!3232 (= mapRest!3221 (store mapRest!3232 mapKey!3232 mapValue!3232))))

(assert (= (and mapNonEmpty!3221 condMapEmpty!3232) mapIsEmpty!3232))

(assert (= (and mapNonEmpty!3221 (not condMapEmpty!3232)) mapNonEmpty!3232))

(assert (= (and mapNonEmpty!3232 ((_ is ValueCellFull!900) mapValue!3232)) b!76374))

(assert (= (and mapNonEmpty!3221 ((_ is ValueCellFull!900) mapDefault!3232)) b!76375))

(declare-fun m!76181 () Bool)

(assert (=> mapNonEmpty!3232 m!76181))

(declare-fun b_lambda!3425 () Bool)

(assert (= b_lambda!3421 (or (and b!75990 b_free!2141) (and b!75980 b_free!2143 (= (defaultEntry!2247 newMap!16) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))))) b_lambda!3425)))

(declare-fun b_lambda!3427 () Bool)

(assert (= b_lambda!3419 (or (and b!75990 b_free!2141) (and b!75980 b_free!2143 (= (defaultEntry!2247 newMap!16) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))))) b_lambda!3427)))

(declare-fun b_lambda!3429 () Bool)

(assert (= b_lambda!3423 (or (and b!75990 b_free!2141) (and b!75980 b_free!2143 (= (defaultEntry!2247 newMap!16) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))))) b_lambda!3429)))

(check-sat (not b!76072) (not bm!6856) b_and!4673 (not b!76364) (not bm!6859) (not bm!6898) (not b!76351) (not b!76317) (not b!76312) (not bm!6903) (not b_next!2141) b_and!4671 (not bm!6873) (not d!18105) (not b_next!2143) (not b!76332) (not bm!6866) (not b_lambda!3425) (not d!18097) (not d!18111) (not b!76306) (not b!76320) (not b!76308) (not d!18103) (not b_lambda!3417) (not b!76309) (not bm!6910) (not b!76079) (not d!18119) (not bm!6869) (not b!76346) (not mapNonEmpty!3232) (not b!76327) (not b!76182) (not b!76267) (not bm!6857) (not b!76310) (not b!76279) (not b!76080) (not b!76304) (not b!76321) (not b!76362) (not b!76272) (not b_lambda!3429) (not b!76344) (not bm!6861) (not b!76305) (not b!76349) (not d!18127) (not d!18121) (not b!76319) (not b!76183) (not bm!6900) (not bm!6906) (not b!76268) (not d!18101) (not b!76081) (not b!76184) (not b!76278) (not b!76071) (not b!76256) tp_is_empty!2487 (not b!76090) (not b!76307) (not bm!6896) (not b!76259) (not b!76181) (not bm!6860) (not d!18109) (not d!18113) (not b!76174) (not bm!6867) (not b!76269) (not d!18115) (not b!76318) (not d!18107) (not bm!6858) (not bm!6895) (not mapNonEmpty!3231) (not b!76263) (not b!76200) (not b!76353) (not bm!6907) (not b!76316) (not b!76258) (not d!18099) (not b!76088) (not bm!6863) (not b!76348) (not d!18123) (not b_lambda!3427) (not bm!6877) (not d!18095))
(check-sat b_and!4671 b_and!4673 (not b_next!2141) (not b_next!2143))
(get-model)

(declare-fun d!18143 () Bool)

(declare-fun lt!34773 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!81 (List!1489) (InoxSet tuple2!2140))

(assert (=> d!18143 (= lt!34773 (select (content!81 (toList!730 lt!34739)) lt!34508))))

(declare-fun e!49889 () Bool)

(assert (=> d!18143 (= lt!34773 e!49889)))

(declare-fun res!40202 () Bool)

(assert (=> d!18143 (=> (not res!40202) (not e!49889))))

(assert (=> d!18143 (= res!40202 ((_ is Cons!1485) (toList!730 lt!34739)))))

(assert (=> d!18143 (= (contains!733 (toList!730 lt!34739) lt!34508) lt!34773)))

(declare-fun b!76380 () Bool)

(declare-fun e!49888 () Bool)

(assert (=> b!76380 (= e!49889 e!49888)))

(declare-fun res!40203 () Bool)

(assert (=> b!76380 (=> res!40203 e!49888)))

(assert (=> b!76380 (= res!40203 (= (h!2073 (toList!730 lt!34739)) lt!34508))))

(declare-fun b!76381 () Bool)

(assert (=> b!76381 (= e!49888 (contains!733 (t!5083 (toList!730 lt!34739)) lt!34508))))

(assert (= (and d!18143 res!40202) b!76380))

(assert (= (and b!76380 (not res!40203)) b!76381))

(declare-fun m!76183 () Bool)

(assert (=> d!18143 m!76183))

(declare-fun m!76185 () Bool)

(assert (=> d!18143 m!76185))

(declare-fun m!76187 () Bool)

(assert (=> b!76381 m!76187))

(assert (=> b!76317 d!18143))

(declare-fun d!18145 () Bool)

(declare-fun e!49890 () Bool)

(assert (=> d!18145 e!49890))

(declare-fun res!40204 () Bool)

(assert (=> d!18145 (=> res!40204 e!49890)))

(declare-fun lt!34775 () Bool)

(assert (=> d!18145 (= res!40204 (not lt!34775))))

(declare-fun lt!34777 () Bool)

(assert (=> d!18145 (= lt!34775 lt!34777)))

(declare-fun lt!34774 () Unit!2193)

(declare-fun e!49891 () Unit!2193)

(assert (=> d!18145 (= lt!34774 e!49891)))

(declare-fun c!11648 () Bool)

(assert (=> d!18145 (= c!11648 lt!34777)))

(assert (=> d!18145 (= lt!34777 (containsKey!139 (toList!730 lt!34750) (_1!1081 lt!34508)))))

(assert (=> d!18145 (= (contains!731 lt!34750 (_1!1081 lt!34508)) lt!34775)))

(declare-fun b!76382 () Bool)

(declare-fun lt!34776 () Unit!2193)

(assert (=> b!76382 (= e!49891 lt!34776)))

(assert (=> b!76382 (= lt!34776 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 lt!34750) (_1!1081 lt!34508)))))

(assert (=> b!76382 (isDefined!88 (getValueByKey!135 (toList!730 lt!34750) (_1!1081 lt!34508)))))

(declare-fun b!76383 () Bool)

(declare-fun Unit!2204 () Unit!2193)

(assert (=> b!76383 (= e!49891 Unit!2204)))

(declare-fun b!76384 () Bool)

(assert (=> b!76384 (= e!49890 (isDefined!88 (getValueByKey!135 (toList!730 lt!34750) (_1!1081 lt!34508))))))

(assert (= (and d!18145 c!11648) b!76382))

(assert (= (and d!18145 (not c!11648)) b!76383))

(assert (= (and d!18145 (not res!40204)) b!76384))

(declare-fun m!76189 () Bool)

(assert (=> d!18145 m!76189))

(declare-fun m!76191 () Bool)

(assert (=> b!76382 m!76191))

(assert (=> b!76382 m!76145))

(assert (=> b!76382 m!76145))

(declare-fun m!76193 () Bool)

(assert (=> b!76382 m!76193))

(assert (=> b!76384 m!76145))

(assert (=> b!76384 m!76145))

(assert (=> b!76384 m!76193))

(assert (=> d!18119 d!18145))

(declare-fun d!18147 () Bool)

(declare-fun c!11653 () Bool)

(assert (=> d!18147 (= c!11653 (and ((_ is Cons!1485) lt!34749) (= (_1!1081 (h!2073 lt!34749)) (_1!1081 lt!34508))))))

(declare-fun e!49896 () Option!141)

(assert (=> d!18147 (= (getValueByKey!135 lt!34749 (_1!1081 lt!34508)) e!49896)))

(declare-fun b!76394 () Bool)

(declare-fun e!49897 () Option!141)

(assert (=> b!76394 (= e!49896 e!49897)))

(declare-fun c!11654 () Bool)

(assert (=> b!76394 (= c!11654 (and ((_ is Cons!1485) lt!34749) (not (= (_1!1081 (h!2073 lt!34749)) (_1!1081 lt!34508)))))))

(declare-fun b!76395 () Bool)

(assert (=> b!76395 (= e!49897 (getValueByKey!135 (t!5083 lt!34749) (_1!1081 lt!34508)))))

(declare-fun b!76393 () Bool)

(assert (=> b!76393 (= e!49896 (Some!140 (_2!1081 (h!2073 lt!34749))))))

(declare-fun b!76396 () Bool)

(assert (=> b!76396 (= e!49897 None!139)))

(assert (= (and d!18147 c!11653) b!76393))

(assert (= (and d!18147 (not c!11653)) b!76394))

(assert (= (and b!76394 c!11654) b!76395))

(assert (= (and b!76394 (not c!11654)) b!76396))

(declare-fun m!76195 () Bool)

(assert (=> b!76395 m!76195))

(assert (=> d!18119 d!18147))

(declare-fun d!18149 () Bool)

(assert (=> d!18149 (= (getValueByKey!135 lt!34749 (_1!1081 lt!34508)) (Some!140 (_2!1081 lt!34508)))))

(declare-fun lt!34780 () Unit!2193)

(declare-fun choose!440 (List!1489 (_ BitVec 64) V!2963) Unit!2193)

(assert (=> d!18149 (= lt!34780 (choose!440 lt!34749 (_1!1081 lt!34508) (_2!1081 lt!34508)))))

(declare-fun e!49900 () Bool)

(assert (=> d!18149 e!49900))

(declare-fun res!40209 () Bool)

(assert (=> d!18149 (=> (not res!40209) (not e!49900))))

(declare-fun isStrictlySorted!294 (List!1489) Bool)

(assert (=> d!18149 (= res!40209 (isStrictlySorted!294 lt!34749))))

(assert (=> d!18149 (= (lemmaContainsTupThenGetReturnValue!52 lt!34749 (_1!1081 lt!34508) (_2!1081 lt!34508)) lt!34780)))

(declare-fun b!76401 () Bool)

(declare-fun res!40210 () Bool)

(assert (=> b!76401 (=> (not res!40210) (not e!49900))))

(assert (=> b!76401 (= res!40210 (containsKey!139 lt!34749 (_1!1081 lt!34508)))))

(declare-fun b!76402 () Bool)

(assert (=> b!76402 (= e!49900 (contains!733 lt!34749 (tuple2!2141 (_1!1081 lt!34508) (_2!1081 lt!34508))))))

(assert (= (and d!18149 res!40209) b!76401))

(assert (= (and b!76401 res!40210) b!76402))

(assert (=> d!18149 m!76139))

(declare-fun m!76197 () Bool)

(assert (=> d!18149 m!76197))

(declare-fun m!76199 () Bool)

(assert (=> d!18149 m!76199))

(declare-fun m!76201 () Bool)

(assert (=> b!76401 m!76201))

(declare-fun m!76203 () Bool)

(assert (=> b!76402 m!76203))

(assert (=> d!18119 d!18149))

(declare-fun b!76423 () Bool)

(declare-fun e!49913 () List!1489)

(declare-fun call!6920 () List!1489)

(assert (=> b!76423 (= e!49913 call!6920)))

(declare-fun c!11666 () Bool)

(declare-fun b!76424 () Bool)

(assert (=> b!76424 (= c!11666 (and ((_ is Cons!1485) (toList!730 (+!99 lt!34498 lt!34509))) (bvsgt (_1!1081 (h!2073 (toList!730 (+!99 lt!34498 lt!34509)))) (_1!1081 lt!34508))))))

(declare-fun e!49914 () List!1489)

(assert (=> b!76424 (= e!49914 e!49913)))

(declare-fun c!11663 () Bool)

(declare-fun bm!6917 () Bool)

(declare-fun call!6922 () List!1489)

(declare-fun e!49915 () List!1489)

(declare-fun $colon$colon!68 (List!1489 tuple2!2140) List!1489)

(assert (=> bm!6917 (= call!6922 ($colon$colon!68 e!49915 (ite c!11663 (h!2073 (toList!730 (+!99 lt!34498 lt!34509))) (tuple2!2141 (_1!1081 lt!34508) (_2!1081 lt!34508)))))))

(declare-fun c!11665 () Bool)

(assert (=> bm!6917 (= c!11665 c!11663)))

(declare-fun b!76425 () Bool)

(assert (=> b!76425 (= e!49915 (insertStrictlySorted!55 (t!5083 (toList!730 (+!99 lt!34498 lt!34509))) (_1!1081 lt!34508) (_2!1081 lt!34508)))))

(declare-fun bm!6918 () Bool)

(declare-fun call!6921 () List!1489)

(assert (=> bm!6918 (= call!6921 call!6922)))

(declare-fun bm!6919 () Bool)

(assert (=> bm!6919 (= call!6920 call!6921)))

(declare-fun b!76427 () Bool)

(declare-fun e!49912 () List!1489)

(assert (=> b!76427 (= e!49912 e!49914)))

(declare-fun c!11664 () Bool)

(assert (=> b!76427 (= c!11664 (and ((_ is Cons!1485) (toList!730 (+!99 lt!34498 lt!34509))) (= (_1!1081 (h!2073 (toList!730 (+!99 lt!34498 lt!34509)))) (_1!1081 lt!34508))))))

(declare-fun b!76428 () Bool)

(assert (=> b!76428 (= e!49913 call!6920)))

(declare-fun b!76429 () Bool)

(assert (=> b!76429 (= e!49912 call!6922)))

(declare-fun b!76430 () Bool)

(assert (=> b!76430 (= e!49914 call!6921)))

(declare-fun b!76426 () Bool)

(declare-fun e!49911 () Bool)

(declare-fun lt!34783 () List!1489)

(assert (=> b!76426 (= e!49911 (contains!733 lt!34783 (tuple2!2141 (_1!1081 lt!34508) (_2!1081 lt!34508))))))

(declare-fun d!18151 () Bool)

(assert (=> d!18151 e!49911))

(declare-fun res!40216 () Bool)

(assert (=> d!18151 (=> (not res!40216) (not e!49911))))

(assert (=> d!18151 (= res!40216 (isStrictlySorted!294 lt!34783))))

(assert (=> d!18151 (= lt!34783 e!49912)))

(assert (=> d!18151 (= c!11663 (and ((_ is Cons!1485) (toList!730 (+!99 lt!34498 lt!34509))) (bvslt (_1!1081 (h!2073 (toList!730 (+!99 lt!34498 lt!34509)))) (_1!1081 lt!34508))))))

(assert (=> d!18151 (isStrictlySorted!294 (toList!730 (+!99 lt!34498 lt!34509)))))

(assert (=> d!18151 (= (insertStrictlySorted!55 (toList!730 (+!99 lt!34498 lt!34509)) (_1!1081 lt!34508) (_2!1081 lt!34508)) lt!34783)))

(declare-fun b!76431 () Bool)

(assert (=> b!76431 (= e!49915 (ite c!11664 (t!5083 (toList!730 (+!99 lt!34498 lt!34509))) (ite c!11666 (Cons!1485 (h!2073 (toList!730 (+!99 lt!34498 lt!34509))) (t!5083 (toList!730 (+!99 lt!34498 lt!34509)))) Nil!1486)))))

(declare-fun b!76432 () Bool)

(declare-fun res!40215 () Bool)

(assert (=> b!76432 (=> (not res!40215) (not e!49911))))

(assert (=> b!76432 (= res!40215 (containsKey!139 lt!34783 (_1!1081 lt!34508)))))

(assert (= (and d!18151 c!11663) b!76429))

(assert (= (and d!18151 (not c!11663)) b!76427))

(assert (= (and b!76427 c!11664) b!76430))

(assert (= (and b!76427 (not c!11664)) b!76424))

(assert (= (and b!76424 c!11666) b!76428))

(assert (= (and b!76424 (not c!11666)) b!76423))

(assert (= (or b!76428 b!76423) bm!6919))

(assert (= (or b!76430 bm!6919) bm!6918))

(assert (= (or b!76429 bm!6918) bm!6917))

(assert (= (and bm!6917 c!11665) b!76425))

(assert (= (and bm!6917 (not c!11665)) b!76431))

(assert (= (and d!18151 res!40216) b!76432))

(assert (= (and b!76432 res!40215) b!76426))

(declare-fun m!76205 () Bool)

(assert (=> b!76425 m!76205))

(declare-fun m!76207 () Bool)

(assert (=> b!76426 m!76207))

(declare-fun m!76209 () Bool)

(assert (=> d!18151 m!76209))

(declare-fun m!76211 () Bool)

(assert (=> d!18151 m!76211))

(declare-fun m!76213 () Bool)

(assert (=> bm!6917 m!76213))

(declare-fun m!76215 () Bool)

(assert (=> b!76432 m!76215))

(assert (=> d!18119 d!18151))

(declare-fun d!18153 () Bool)

(assert (=> d!18153 (= (+!99 (getCurrentListMap!426 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (getCurrentListMap!426 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) lt!34614 (zeroValue!2146 newMap!16) lt!34504 #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!34786 () Unit!2193)

(declare-fun choose!441 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 V!2963 Int) Unit!2193)

(assert (=> d!18153 (= lt!34786 (choose!441 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) lt!34614 (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) lt!34504 (defaultEntry!2247 newMap!16)))))

(assert (=> d!18153 (validMask!0 (mask!6230 newMap!16))))

(assert (=> d!18153 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!26 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) lt!34614 (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) lt!34504 (defaultEntry!2247 newMap!16)) lt!34786)))

(declare-fun bs!3266 () Bool)

(assert (= bs!3266 d!18153))

(assert (=> bs!3266 m!76013))

(declare-fun m!76217 () Bool)

(assert (=> bs!3266 m!76217))

(declare-fun m!76219 () Bool)

(assert (=> bs!3266 m!76219))

(assert (=> bs!3266 m!76013))

(declare-fun m!76221 () Bool)

(assert (=> bs!3266 m!76221))

(declare-fun m!76223 () Bool)

(assert (=> bs!3266 m!76223))

(assert (=> b!76200 d!18153))

(assert (=> bm!6869 d!18101))

(declare-fun b!76433 () Bool)

(declare-fun res!40219 () Bool)

(declare-fun e!49921 () Bool)

(assert (=> b!76433 (=> (not res!40219) (not e!49921))))

(declare-fun lt!34787 () ListLongMap!1429)

(assert (=> b!76433 (= res!40219 (not (contains!731 lt!34787 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!76434 () Bool)

(declare-fun e!49918 () Bool)

(assert (=> b!76434 (= e!49918 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!76434 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!76435 () Bool)

(declare-fun e!49917 () ListLongMap!1429)

(declare-fun e!49916 () ListLongMap!1429)

(assert (=> b!76435 (= e!49917 e!49916)))

(declare-fun c!11668 () Bool)

(assert (=> b!76435 (= c!11668 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!76436 () Bool)

(declare-fun e!49920 () Bool)

(declare-fun e!49919 () Bool)

(assert (=> b!76436 (= e!49920 e!49919)))

(assert (=> b!76436 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun res!40218 () Bool)

(assert (=> b!76436 (= res!40218 (contains!731 lt!34787 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!76436 (=> (not res!40218) (not e!49919))))

(declare-fun b!76437 () Bool)

(declare-fun e!49922 () Bool)

(assert (=> b!76437 (= e!49922 (isEmpty!322 lt!34787))))

(declare-fun d!18155 () Bool)

(assert (=> d!18155 e!49921))

(declare-fun res!40220 () Bool)

(assert (=> d!18155 (=> (not res!40220) (not e!49921))))

(assert (=> d!18155 (= res!40220 (not (contains!731 lt!34787 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18155 (= lt!34787 e!49917)))

(declare-fun c!11669 () Bool)

(assert (=> d!18155 (= c!11669 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> d!18155 (validMask!0 (mask!6230 (v!2559 (underlying!266 thiss!992))))))

(assert (=> d!18155 (= (getCurrentListMapNoExtraKeys!64 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))) lt!34787)))

(declare-fun b!76438 () Bool)

(assert (=> b!76438 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> b!76438 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2112 (_values!2230 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> b!76438 (= e!49919 (= (apply!77 lt!34787 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!76439 () Bool)

(assert (=> b!76439 (= e!49922 (= lt!34787 (getCurrentListMapNoExtraKeys!64 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun b!76440 () Bool)

(assert (=> b!76440 (= e!49917 (ListLongMap!1430 Nil!1486))))

(declare-fun b!76441 () Bool)

(declare-fun lt!34793 () Unit!2193)

(declare-fun lt!34789 () Unit!2193)

(assert (=> b!76441 (= lt!34793 lt!34789)))

(declare-fun lt!34788 () ListLongMap!1429)

(declare-fun lt!34792 () (_ BitVec 64))

(declare-fun lt!34791 () V!2963)

(declare-fun lt!34790 () (_ BitVec 64))

(assert (=> b!76441 (not (contains!731 (+!99 lt!34788 (tuple2!2141 lt!34790 lt!34791)) lt!34792))))

(assert (=> b!76441 (= lt!34789 (addStillNotContains!26 lt!34788 lt!34790 lt!34791 lt!34792))))

(assert (=> b!76441 (= lt!34792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!76441 (= lt!34791 (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76441 (= lt!34790 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(declare-fun call!6923 () ListLongMap!1429)

(assert (=> b!76441 (= lt!34788 call!6923)))

(assert (=> b!76441 (= e!49916 (+!99 call!6923 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!6920 () Bool)

(assert (=> bm!6920 (= call!6923 (getCurrentListMapNoExtraKeys!64 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun b!76442 () Bool)

(assert (=> b!76442 (= e!49921 e!49920)))

(declare-fun c!11667 () Bool)

(assert (=> b!76442 (= c!11667 e!49918)))

(declare-fun res!40217 () Bool)

(assert (=> b!76442 (=> (not res!40217) (not e!49918))))

(assert (=> b!76442 (= res!40217 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun b!76443 () Bool)

(assert (=> b!76443 (= e!49916 call!6923)))

(declare-fun b!76444 () Bool)

(assert (=> b!76444 (= e!49920 e!49922)))

(declare-fun c!11670 () Bool)

(assert (=> b!76444 (= c!11670 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(assert (= (and d!18155 c!11669) b!76440))

(assert (= (and d!18155 (not c!11669)) b!76435))

(assert (= (and b!76435 c!11668) b!76441))

(assert (= (and b!76435 (not c!11668)) b!76443))

(assert (= (or b!76441 b!76443) bm!6920))

(assert (= (and d!18155 res!40220) b!76433))

(assert (= (and b!76433 res!40219) b!76442))

(assert (= (and b!76442 res!40217) b!76434))

(assert (= (and b!76442 c!11667) b!76436))

(assert (= (and b!76442 (not c!11667)) b!76444))

(assert (= (and b!76436 res!40218) b!76438))

(assert (= (and b!76444 c!11670) b!76439))

(assert (= (and b!76444 (not c!11670)) b!76437))

(declare-fun b_lambda!3431 () Bool)

(assert (=> (not b_lambda!3431) (not b!76438)))

(assert (=> b!76438 t!5079))

(declare-fun b_and!4675 () Bool)

(assert (= b_and!4671 (and (=> t!5079 result!2731) b_and!4675)))

(assert (=> b!76438 t!5081))

(declare-fun b_and!4677 () Bool)

(assert (= b_and!4673 (and (=> t!5081 result!2735) b_and!4677)))

(declare-fun b_lambda!3433 () Bool)

(assert (=> (not b_lambda!3433) (not b!76441)))

(assert (=> b!76441 t!5079))

(declare-fun b_and!4679 () Bool)

(assert (= b_and!4675 (and (=> t!5079 result!2731) b_and!4679)))

(assert (=> b!76441 t!5081))

(declare-fun b_and!4681 () Bool)

(assert (= b_and!4677 (and (=> t!5081 result!2735) b_and!4681)))

(declare-fun m!76225 () Bool)

(assert (=> b!76435 m!76225))

(assert (=> b!76435 m!76225))

(declare-fun m!76227 () Bool)

(assert (=> b!76435 m!76227))

(assert (=> b!76436 m!76225))

(assert (=> b!76436 m!76225))

(declare-fun m!76229 () Bool)

(assert (=> b!76436 m!76229))

(declare-fun m!76231 () Bool)

(assert (=> d!18155 m!76231))

(assert (=> d!18155 m!75847))

(declare-fun m!76233 () Bool)

(assert (=> b!76433 m!76233))

(declare-fun m!76235 () Bool)

(assert (=> b!76441 m!76235))

(assert (=> b!76441 m!75829))

(assert (=> b!76441 m!76235))

(declare-fun m!76237 () Bool)

(assert (=> b!76441 m!76237))

(declare-fun m!76239 () Bool)

(assert (=> b!76441 m!76239))

(assert (=> b!76441 m!75829))

(declare-fun m!76241 () Bool)

(assert (=> b!76441 m!76241))

(assert (=> b!76441 m!76239))

(declare-fun m!76243 () Bool)

(assert (=> b!76441 m!76243))

(declare-fun m!76245 () Bool)

(assert (=> b!76441 m!76245))

(assert (=> b!76441 m!76225))

(assert (=> b!76434 m!76225))

(assert (=> b!76434 m!76225))

(assert (=> b!76434 m!76227))

(declare-fun m!76247 () Bool)

(assert (=> b!76437 m!76247))

(declare-fun m!76249 () Bool)

(assert (=> b!76439 m!76249))

(assert (=> b!76438 m!76225))

(assert (=> b!76438 m!75829))

(assert (=> b!76438 m!76239))

(assert (=> b!76438 m!75829))

(assert (=> b!76438 m!76241))

(assert (=> b!76438 m!76239))

(assert (=> b!76438 m!76225))

(declare-fun m!76251 () Bool)

(assert (=> b!76438 m!76251))

(assert (=> bm!6920 m!76249))

(assert (=> bm!6903 d!18155))

(declare-fun d!18157 () Bool)

(declare-fun e!49923 () Bool)

(assert (=> d!18157 e!49923))

(declare-fun res!40221 () Bool)

(assert (=> d!18157 (=> res!40221 e!49923)))

(declare-fun lt!34795 () Bool)

(assert (=> d!18157 (= res!40221 (not lt!34795))))

(declare-fun lt!34797 () Bool)

(assert (=> d!18157 (= lt!34795 lt!34797)))

(declare-fun lt!34794 () Unit!2193)

(declare-fun e!49924 () Unit!2193)

(assert (=> d!18157 (= lt!34794 e!49924)))

(declare-fun c!11671 () Bool)

(assert (=> d!18157 (= c!11671 lt!34797)))

(assert (=> d!18157 (= lt!34797 (containsKey!139 (toList!730 lt!34702) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!18157 (= (contains!731 lt!34702 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!34795)))

(declare-fun b!76445 () Bool)

(declare-fun lt!34796 () Unit!2193)

(assert (=> b!76445 (= e!49924 lt!34796)))

(assert (=> b!76445 (= lt!34796 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 lt!34702) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76445 (isDefined!88 (getValueByKey!135 (toList!730 lt!34702) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!76446 () Bool)

(declare-fun Unit!2205 () Unit!2193)

(assert (=> b!76446 (= e!49924 Unit!2205)))

(declare-fun b!76447 () Bool)

(assert (=> b!76447 (= e!49923 (isDefined!88 (getValueByKey!135 (toList!730 lt!34702) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!18157 c!11671) b!76445))

(assert (= (and d!18157 (not c!11671)) b!76446))

(assert (= (and d!18157 (not res!40221)) b!76447))

(assert (=> d!18157 m!76033))

(declare-fun m!76253 () Bool)

(assert (=> d!18157 m!76253))

(assert (=> b!76445 m!76033))

(declare-fun m!76255 () Bool)

(assert (=> b!76445 m!76255))

(assert (=> b!76445 m!76033))

(declare-fun m!76257 () Bool)

(assert (=> b!76445 m!76257))

(assert (=> b!76445 m!76257))

(declare-fun m!76259 () Bool)

(assert (=> b!76445 m!76259))

(assert (=> b!76447 m!76033))

(assert (=> b!76447 m!76257))

(assert (=> b!76447 m!76257))

(assert (=> b!76447 m!76259))

(assert (=> b!76269 d!18157))

(declare-fun d!18159 () Bool)

(declare-fun e!49925 () Bool)

(assert (=> d!18159 e!49925))

(declare-fun res!40223 () Bool)

(assert (=> d!18159 (=> (not res!40223) (not e!49925))))

(declare-fun lt!34799 () ListLongMap!1429)

(assert (=> d!18159 (= res!40223 (contains!731 lt!34799 (_1!1081 (ite (or c!11622 c!11623) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992))))))))))

(declare-fun lt!34798 () List!1489)

(assert (=> d!18159 (= lt!34799 (ListLongMap!1430 lt!34798))))

(declare-fun lt!34801 () Unit!2193)

(declare-fun lt!34800 () Unit!2193)

(assert (=> d!18159 (= lt!34801 lt!34800)))

(assert (=> d!18159 (= (getValueByKey!135 lt!34798 (_1!1081 (ite (or c!11622 c!11623) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992))))))) (Some!140 (_2!1081 (ite (or c!11622 c!11623) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992))))))))))

(assert (=> d!18159 (= lt!34800 (lemmaContainsTupThenGetReturnValue!52 lt!34798 (_1!1081 (ite (or c!11622 c!11623) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))) (_2!1081 (ite (or c!11622 c!11623) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992))))))))))

(assert (=> d!18159 (= lt!34798 (insertStrictlySorted!55 (toList!730 (ite c!11622 call!6902 (ite c!11623 call!6901 call!6900))) (_1!1081 (ite (or c!11622 c!11623) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))) (_2!1081 (ite (or c!11622 c!11623) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992))))))))))

(assert (=> d!18159 (= (+!99 (ite c!11622 call!6902 (ite c!11623 call!6901 call!6900)) (ite (or c!11622 c!11623) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))) lt!34799)))

(declare-fun b!76448 () Bool)

(declare-fun res!40222 () Bool)

(assert (=> b!76448 (=> (not res!40222) (not e!49925))))

(assert (=> b!76448 (= res!40222 (= (getValueByKey!135 (toList!730 lt!34799) (_1!1081 (ite (or c!11622 c!11623) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992))))))) (Some!140 (_2!1081 (ite (or c!11622 c!11623) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))))

(declare-fun b!76449 () Bool)

(assert (=> b!76449 (= e!49925 (contains!733 (toList!730 lt!34799) (ite (or c!11622 c!11623) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (= (and d!18159 res!40223) b!76448))

(assert (= (and b!76448 res!40222) b!76449))

(declare-fun m!76261 () Bool)

(assert (=> d!18159 m!76261))

(declare-fun m!76263 () Bool)

(assert (=> d!18159 m!76263))

(declare-fun m!76265 () Bool)

(assert (=> d!18159 m!76265))

(declare-fun m!76267 () Bool)

(assert (=> d!18159 m!76267))

(declare-fun m!76269 () Bool)

(assert (=> b!76448 m!76269))

(declare-fun m!76271 () Bool)

(assert (=> b!76449 m!76271))

(assert (=> bm!6895 d!18159))

(declare-fun d!18161 () Bool)

(declare-fun isEmpty!323 (Option!141) Bool)

(assert (=> d!18161 (= (isDefined!88 (getValueByKey!135 (toList!730 lt!34500) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355))) (not (isEmpty!323 (getValueByKey!135 (toList!730 lt!34500) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))))

(declare-fun bs!3267 () Bool)

(assert (= bs!3267 d!18161))

(assert (=> bs!3267 m!75953))

(declare-fun m!76273 () Bool)

(assert (=> bs!3267 m!76273))

(assert (=> b!76090 d!18161))

(declare-fun c!11672 () Bool)

(declare-fun d!18163 () Bool)

(assert (=> d!18163 (= c!11672 (and ((_ is Cons!1485) (toList!730 lt!34500)) (= (_1!1081 (h!2073 (toList!730 lt!34500))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355))))))

(declare-fun e!49926 () Option!141)

(assert (=> d!18163 (= (getValueByKey!135 (toList!730 lt!34500) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) e!49926)))

(declare-fun b!76451 () Bool)

(declare-fun e!49927 () Option!141)

(assert (=> b!76451 (= e!49926 e!49927)))

(declare-fun c!11673 () Bool)

(assert (=> b!76451 (= c!11673 (and ((_ is Cons!1485) (toList!730 lt!34500)) (not (= (_1!1081 (h!2073 (toList!730 lt!34500))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))))

(declare-fun b!76452 () Bool)

(assert (=> b!76452 (= e!49927 (getValueByKey!135 (t!5083 (toList!730 lt!34500)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun b!76450 () Bool)

(assert (=> b!76450 (= e!49926 (Some!140 (_2!1081 (h!2073 (toList!730 lt!34500)))))))

(declare-fun b!76453 () Bool)

(assert (=> b!76453 (= e!49927 None!139)))

(assert (= (and d!18163 c!11672) b!76450))

(assert (= (and d!18163 (not c!11672)) b!76451))

(assert (= (and b!76451 c!11673) b!76452))

(assert (= (and b!76451 (not c!11673)) b!76453))

(assert (=> b!76452 m!75825))

(declare-fun m!76275 () Bool)

(assert (=> b!76452 m!76275))

(assert (=> b!76090 d!18163))

(declare-fun d!18165 () Bool)

(declare-fun lt!34802 () Bool)

(assert (=> d!18165 (= lt!34802 (select (content!81 (toList!730 lt!34714)) lt!34509))))

(declare-fun e!49929 () Bool)

(assert (=> d!18165 (= lt!34802 e!49929)))

(declare-fun res!40224 () Bool)

(assert (=> d!18165 (=> (not res!40224) (not e!49929))))

(assert (=> d!18165 (= res!40224 ((_ is Cons!1485) (toList!730 lt!34714)))))

(assert (=> d!18165 (= (contains!733 (toList!730 lt!34714) lt!34509) lt!34802)))

(declare-fun b!76454 () Bool)

(declare-fun e!49928 () Bool)

(assert (=> b!76454 (= e!49929 e!49928)))

(declare-fun res!40225 () Bool)

(assert (=> b!76454 (=> res!40225 e!49928)))

(assert (=> b!76454 (= res!40225 (= (h!2073 (toList!730 lt!34714)) lt!34509))))

(declare-fun b!76455 () Bool)

(assert (=> b!76455 (= e!49928 (contains!733 (t!5083 (toList!730 lt!34714)) lt!34509))))

(assert (= (and d!18165 res!40224) b!76454))

(assert (= (and b!76454 (not res!40225)) b!76455))

(declare-fun m!76277 () Bool)

(assert (=> d!18165 m!76277))

(declare-fun m!76279 () Bool)

(assert (=> d!18165 m!76279))

(declare-fun m!76281 () Bool)

(assert (=> b!76455 m!76281))

(assert (=> b!76279 d!18165))

(declare-fun d!18167 () Bool)

(assert (=> d!18167 (isDefined!88 (getValueByKey!135 (toList!730 lt!34500) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun lt!34805 () Unit!2193)

(declare-fun choose!442 (List!1489 (_ BitVec 64)) Unit!2193)

(assert (=> d!18167 (= lt!34805 (choose!442 (toList!730 lt!34500) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun e!49932 () Bool)

(assert (=> d!18167 e!49932))

(declare-fun res!40228 () Bool)

(assert (=> d!18167 (=> (not res!40228) (not e!49932))))

(assert (=> d!18167 (= res!40228 (isStrictlySorted!294 (toList!730 lt!34500)))))

(assert (=> d!18167 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 lt!34500) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) lt!34805)))

(declare-fun b!76458 () Bool)

(assert (=> b!76458 (= e!49932 (containsKey!139 (toList!730 lt!34500) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (= (and d!18167 res!40228) b!76458))

(assert (=> d!18167 m!75825))

(assert (=> d!18167 m!75953))

(assert (=> d!18167 m!75953))

(assert (=> d!18167 m!75955))

(assert (=> d!18167 m!75825))

(declare-fun m!76283 () Bool)

(assert (=> d!18167 m!76283))

(declare-fun m!76285 () Bool)

(assert (=> d!18167 m!76285))

(assert (=> b!76458 m!75825))

(assert (=> b!76458 m!75949))

(assert (=> b!76088 d!18167))

(assert (=> b!76088 d!18161))

(assert (=> b!76088 d!18163))

(declare-fun d!18169 () Bool)

(declare-fun get!1158 (Option!141) V!2963)

(assert (=> d!18169 (= (apply!77 lt!34702 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1158 (getValueByKey!135 (toList!730 lt!34702) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3268 () Bool)

(assert (= bs!3268 d!18169))

(declare-fun m!76287 () Bool)

(assert (=> bs!3268 m!76287))

(assert (=> bs!3268 m!76287))

(declare-fun m!76289 () Bool)

(assert (=> bs!3268 m!76289))

(assert (=> b!76267 d!18169))

(declare-fun d!18171 () Bool)

(declare-fun e!49933 () Bool)

(assert (=> d!18171 e!49933))

(declare-fun res!40229 () Bool)

(assert (=> d!18171 (=> res!40229 e!49933)))

(declare-fun lt!34807 () Bool)

(assert (=> d!18171 (= res!40229 (not lt!34807))))

(declare-fun lt!34809 () Bool)

(assert (=> d!18171 (= lt!34807 lt!34809)))

(declare-fun lt!34806 () Unit!2193)

(declare-fun e!49934 () Unit!2193)

(assert (=> d!18171 (= lt!34806 e!49934)))

(declare-fun c!11674 () Bool)

(assert (=> d!18171 (= c!11674 lt!34809)))

(assert (=> d!18171 (= lt!34809 (containsKey!139 (toList!730 e!49760) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (=> d!18171 (= (contains!731 e!49760 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) lt!34807)))

(declare-fun b!76459 () Bool)

(declare-fun lt!34808 () Unit!2193)

(assert (=> b!76459 (= e!49934 lt!34808)))

(assert (=> b!76459 (= lt!34808 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 e!49760) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (=> b!76459 (isDefined!88 (getValueByKey!135 (toList!730 e!49760) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun b!76460 () Bool)

(declare-fun Unit!2206 () Unit!2193)

(assert (=> b!76460 (= e!49934 Unit!2206)))

(declare-fun b!76461 () Bool)

(assert (=> b!76461 (= e!49933 (isDefined!88 (getValueByKey!135 (toList!730 e!49760) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355))))))

(assert (= (and d!18171 c!11674) b!76459))

(assert (= (and d!18171 (not c!11674)) b!76460))

(assert (= (and d!18171 (not res!40229)) b!76461))

(assert (=> d!18171 m!75825))

(declare-fun m!76291 () Bool)

(assert (=> d!18171 m!76291))

(assert (=> b!76459 m!75825))

(declare-fun m!76293 () Bool)

(assert (=> b!76459 m!76293))

(assert (=> b!76459 m!75825))

(declare-fun m!76295 () Bool)

(assert (=> b!76459 m!76295))

(assert (=> b!76459 m!76295))

(declare-fun m!76297 () Bool)

(assert (=> b!76459 m!76297))

(assert (=> b!76461 m!75825))

(assert (=> b!76461 m!76295))

(assert (=> b!76461 m!76295))

(assert (=> b!76461 m!76297))

(assert (=> bm!6866 d!18171))

(declare-fun d!18173 () Bool)

(declare-fun e!49935 () Bool)

(assert (=> d!18173 e!49935))

(declare-fun res!40231 () Bool)

(assert (=> d!18173 (=> (not res!40231) (not e!49935))))

(declare-fun lt!34811 () ListLongMap!1429)

(assert (=> d!18173 (= res!40231 (contains!731 lt!34811 (_1!1081 (ite c!11600 (ite c!11602 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34504) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))))))

(declare-fun lt!34810 () List!1489)

(assert (=> d!18173 (= lt!34811 (ListLongMap!1430 lt!34810))))

(declare-fun lt!34813 () Unit!2193)

(declare-fun lt!34812 () Unit!2193)

(assert (=> d!18173 (= lt!34813 lt!34812)))

(assert (=> d!18173 (= (getValueByKey!135 lt!34810 (_1!1081 (ite c!11600 (ite c!11602 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34504) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))) (Some!140 (_2!1081 (ite c!11600 (ite c!11602 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34504) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))))))

(assert (=> d!18173 (= lt!34812 (lemmaContainsTupThenGetReturnValue!52 lt!34810 (_1!1081 (ite c!11600 (ite c!11602 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34504) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))) (_2!1081 (ite c!11600 (ite c!11602 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34504) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))))))

(assert (=> d!18173 (= lt!34810 (insertStrictlySorted!55 (toList!730 (ite c!11600 (ite c!11602 call!6872 call!6873) call!6881)) (_1!1081 (ite c!11600 (ite c!11602 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34504) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))) (_2!1081 (ite c!11600 (ite c!11602 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34504) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))))))

(assert (=> d!18173 (= (+!99 (ite c!11600 (ite c!11602 call!6872 call!6873) call!6881) (ite c!11600 (ite c!11602 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34504) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))) lt!34811)))

(declare-fun b!76462 () Bool)

(declare-fun res!40230 () Bool)

(assert (=> b!76462 (=> (not res!40230) (not e!49935))))

(assert (=> b!76462 (= res!40230 (= (getValueByKey!135 (toList!730 lt!34811) (_1!1081 (ite c!11600 (ite c!11602 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34504) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))) (Some!140 (_2!1081 (ite c!11600 (ite c!11602 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34504) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))))

(declare-fun b!76463 () Bool)

(assert (=> b!76463 (= e!49935 (contains!733 (toList!730 lt!34811) (ite c!11600 (ite c!11602 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34504) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(assert (= (and d!18173 res!40231) b!76462))

(assert (= (and b!76462 res!40230) b!76463))

(declare-fun m!76299 () Bool)

(assert (=> d!18173 m!76299))

(declare-fun m!76301 () Bool)

(assert (=> d!18173 m!76301))

(declare-fun m!76303 () Bool)

(assert (=> d!18173 m!76303))

(declare-fun m!76305 () Bool)

(assert (=> d!18173 m!76305))

(declare-fun m!76307 () Bool)

(assert (=> b!76462 m!76307))

(declare-fun m!76309 () Bool)

(assert (=> b!76463 m!76309))

(assert (=> bm!6857 d!18173))

(declare-fun d!18175 () Bool)

(assert (=> d!18175 (= (apply!77 lt!34731 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1158 (getValueByKey!135 (toList!730 lt!34731) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3269 () Bool)

(assert (= bs!3269 d!18175))

(assert (=> bs!3269 m!76033))

(declare-fun m!76311 () Bool)

(assert (=> bs!3269 m!76311))

(assert (=> bs!3269 m!76311))

(declare-fun m!76313 () Bool)

(assert (=> bs!3269 m!76313))

(assert (=> b!76309 d!18175))

(declare-fun d!18177 () Bool)

(declare-fun c!11675 () Bool)

(assert (=> d!18177 (= c!11675 ((_ is ValueCellFull!900) (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!49936 () V!2963)

(assert (=> d!18177 (= (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!49936)))

(declare-fun b!76464 () Bool)

(assert (=> b!76464 (= e!49936 (get!1156 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!76465 () Bool)

(assert (=> b!76465 (= e!49936 (get!1157 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18177 c!11675) b!76464))

(assert (= (and d!18177 (not c!11675)) b!76465))

(assert (=> b!76464 m!76051))

(assert (=> b!76464 m!75829))

(declare-fun m!76315 () Bool)

(assert (=> b!76464 m!76315))

(assert (=> b!76465 m!76051))

(assert (=> b!76465 m!75829))

(declare-fun m!76317 () Bool)

(assert (=> b!76465 m!76317))

(assert (=> b!76309 d!18177))

(declare-fun bm!6921 () Bool)

(declare-fun call!6924 () Bool)

(assert (=> bm!6921 (= call!6924 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3905 newMap!16) (mask!6230 newMap!16)))))

(declare-fun d!18179 () Bool)

(declare-fun res!40233 () Bool)

(declare-fun e!49937 () Bool)

(assert (=> d!18179 (=> res!40233 e!49937)))

(assert (=> d!18179 (= res!40233 (bvsge #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(assert (=> d!18179 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3905 newMap!16) (mask!6230 newMap!16)) e!49937)))

(declare-fun b!76466 () Bool)

(declare-fun e!49938 () Bool)

(declare-fun e!49939 () Bool)

(assert (=> b!76466 (= e!49938 e!49939)))

(declare-fun lt!34816 () (_ BitVec 64))

(assert (=> b!76466 (= lt!34816 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34814 () Unit!2193)

(assert (=> b!76466 (= lt!34814 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3905 newMap!16) lt!34816 #b00000000000000000000000000000000))))

(assert (=> b!76466 (arrayContainsKey!0 (_keys!3905 newMap!16) lt!34816 #b00000000000000000000000000000000)))

(declare-fun lt!34815 () Unit!2193)

(assert (=> b!76466 (= lt!34815 lt!34814)))

(declare-fun res!40232 () Bool)

(assert (=> b!76466 (= res!40232 (= (seekEntryOrOpen!0 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000) (_keys!3905 newMap!16) (mask!6230 newMap!16)) (Found!238 #b00000000000000000000000000000000)))))

(assert (=> b!76466 (=> (not res!40232) (not e!49939))))

(declare-fun b!76467 () Bool)

(assert (=> b!76467 (= e!49938 call!6924)))

(declare-fun b!76468 () Bool)

(assert (=> b!76468 (= e!49937 e!49938)))

(declare-fun c!11676 () Bool)

(assert (=> b!76468 (= c!11676 (validKeyInArray!0 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76469 () Bool)

(assert (=> b!76469 (= e!49939 call!6924)))

(assert (= (and d!18179 (not res!40233)) b!76468))

(assert (= (and b!76468 c!11676) b!76466))

(assert (= (and b!76468 (not c!11676)) b!76467))

(assert (= (and b!76466 res!40232) b!76469))

(assert (= (or b!76469 b!76467) bm!6921))

(declare-fun m!76319 () Bool)

(assert (=> bm!6921 m!76319))

(declare-fun m!76321 () Bool)

(assert (=> b!76466 m!76321))

(declare-fun m!76323 () Bool)

(assert (=> b!76466 m!76323))

(declare-fun m!76325 () Bool)

(assert (=> b!76466 m!76325))

(assert (=> b!76466 m!76321))

(declare-fun m!76327 () Bool)

(assert (=> b!76466 m!76327))

(assert (=> b!76468 m!76321))

(assert (=> b!76468 m!76321))

(declare-fun m!76329 () Bool)

(assert (=> b!76468 m!76329))

(assert (=> b!76080 d!18179))

(declare-fun d!18181 () Bool)

(declare-fun lt!34819 () Bool)

(declare-fun content!82 (List!1488) (InoxSet (_ BitVec 64)))

(assert (=> d!18181 (= lt!34819 (select (content!82 Nil!1485) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!49945 () Bool)

(assert (=> d!18181 (= lt!34819 e!49945)))

(declare-fun res!40239 () Bool)

(assert (=> d!18181 (=> (not res!40239) (not e!49945))))

(assert (=> d!18181 (= res!40239 ((_ is Cons!1484) Nil!1485))))

(assert (=> d!18181 (= (contains!734 Nil!1485 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000)) lt!34819)))

(declare-fun b!76474 () Bool)

(declare-fun e!49944 () Bool)

(assert (=> b!76474 (= e!49945 e!49944)))

(declare-fun res!40238 () Bool)

(assert (=> b!76474 (=> res!40238 e!49944)))

(assert (=> b!76474 (= res!40238 (= (h!2072 Nil!1485) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!76475 () Bool)

(assert (=> b!76475 (= e!49944 (contains!734 (t!5082 Nil!1485) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!18181 res!40239) b!76474))

(assert (= (and b!76474 (not res!40238)) b!76475))

(declare-fun m!76331 () Bool)

(assert (=> d!18181 m!76331))

(assert (=> d!18181 m!76163))

(declare-fun m!76333 () Bool)

(assert (=> d!18181 m!76333))

(assert (=> b!76475 m!76163))

(declare-fun m!76335 () Bool)

(assert (=> b!76475 m!76335))

(assert (=> b!76353 d!18181))

(declare-fun d!18183 () Bool)

(declare-fun res!40240 () Bool)

(declare-fun e!49946 () Bool)

(assert (=> d!18183 (=> res!40240 e!49946)))

(assert (=> d!18183 (= res!40240 (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (=> d!18183 (= (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!49946)))

(declare-fun b!76476 () Bool)

(declare-fun e!49947 () Bool)

(assert (=> b!76476 (= e!49946 e!49947)))

(declare-fun res!40241 () Bool)

(assert (=> b!76476 (=> (not res!40241) (not e!49947))))

(assert (=> b!76476 (= res!40241 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun b!76477 () Bool)

(assert (=> b!76477 (= e!49947 (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!18183 (not res!40240)) b!76476))

(assert (= (and b!76476 res!40241) b!76477))

(assert (=> d!18183 m!76225))

(assert (=> b!76477 m!75825))

(declare-fun m!76337 () Bool)

(assert (=> b!76477 m!76337))

(assert (=> b!76327 d!18183))

(declare-fun d!18185 () Bool)

(assert (=> d!18185 (= (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76306 d!18185))

(declare-fun d!18187 () Bool)

(assert (=> d!18187 (= (map!1159 (_2!1082 lt!34634)) (getCurrentListMap!426 (_keys!3905 (_2!1082 lt!34634)) (_values!2230 (_2!1082 lt!34634)) (mask!6230 (_2!1082 lt!34634)) (extraKeys!2100 (_2!1082 lt!34634)) (zeroValue!2146 (_2!1082 lt!34634)) (minValue!2146 (_2!1082 lt!34634)) #b00000000000000000000000000000000 (defaultEntry!2247 (_2!1082 lt!34634))))))

(declare-fun bs!3270 () Bool)

(assert (= bs!3270 d!18187))

(declare-fun m!76339 () Bool)

(assert (=> bs!3270 m!76339))

(assert (=> bm!6860 d!18187))

(declare-fun d!18189 () Bool)

(declare-fun res!40242 () Bool)

(declare-fun e!49948 () Bool)

(assert (=> d!18189 (=> (not res!40242) (not e!49948))))

(assert (=> d!18189 (= res!40242 (simpleValid!53 (_2!1082 lt!34634)))))

(assert (=> d!18189 (= (valid!299 (_2!1082 lt!34634)) e!49948)))

(declare-fun b!76478 () Bool)

(declare-fun res!40243 () Bool)

(assert (=> b!76478 (=> (not res!40243) (not e!49948))))

(assert (=> b!76478 (= res!40243 (= (arrayCountValidKeys!0 (_keys!3905 (_2!1082 lt!34634)) #b00000000000000000000000000000000 (size!2111 (_keys!3905 (_2!1082 lt!34634)))) (_size!403 (_2!1082 lt!34634))))))

(declare-fun b!76479 () Bool)

(declare-fun res!40244 () Bool)

(assert (=> b!76479 (=> (not res!40244) (not e!49948))))

(assert (=> b!76479 (= res!40244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3905 (_2!1082 lt!34634)) (mask!6230 (_2!1082 lt!34634))))))

(declare-fun b!76480 () Bool)

(assert (=> b!76480 (= e!49948 (arrayNoDuplicates!0 (_keys!3905 (_2!1082 lt!34634)) #b00000000000000000000000000000000 Nil!1485))))

(assert (= (and d!18189 res!40242) b!76478))

(assert (= (and b!76478 res!40243) b!76479))

(assert (= (and b!76479 res!40244) b!76480))

(declare-fun m!76341 () Bool)

(assert (=> d!18189 m!76341))

(declare-fun m!76343 () Bool)

(assert (=> b!76478 m!76343))

(declare-fun m!76345 () Bool)

(assert (=> b!76479 m!76345))

(declare-fun m!76347 () Bool)

(assert (=> b!76480 m!76347))

(assert (=> d!18099 d!18189))

(assert (=> d!18099 d!18095))

(declare-fun d!18191 () Bool)

(declare-fun c!11677 () Bool)

(assert (=> d!18191 (= c!11677 (and ((_ is Cons!1485) (toList!730 lt!34750)) (= (_1!1081 (h!2073 (toList!730 lt!34750))) (_1!1081 lt!34508))))))

(declare-fun e!49949 () Option!141)

(assert (=> d!18191 (= (getValueByKey!135 (toList!730 lt!34750) (_1!1081 lt!34508)) e!49949)))

(declare-fun b!76482 () Bool)

(declare-fun e!49950 () Option!141)

(assert (=> b!76482 (= e!49949 e!49950)))

(declare-fun c!11678 () Bool)

(assert (=> b!76482 (= c!11678 (and ((_ is Cons!1485) (toList!730 lt!34750)) (not (= (_1!1081 (h!2073 (toList!730 lt!34750))) (_1!1081 lt!34508)))))))

(declare-fun b!76483 () Bool)

(assert (=> b!76483 (= e!49950 (getValueByKey!135 (t!5083 (toList!730 lt!34750)) (_1!1081 lt!34508)))))

(declare-fun b!76481 () Bool)

(assert (=> b!76481 (= e!49949 (Some!140 (_2!1081 (h!2073 (toList!730 lt!34750)))))))

(declare-fun b!76484 () Bool)

(assert (=> b!76484 (= e!49950 None!139)))

(assert (= (and d!18191 c!11677) b!76481))

(assert (= (and d!18191 (not c!11677)) b!76482))

(assert (= (and b!76482 c!11678) b!76483))

(assert (= (and b!76482 (not c!11678)) b!76484))

(declare-fun m!76349 () Bool)

(assert (=> b!76483 m!76349))

(assert (=> b!76320 d!18191))

(declare-fun d!18193 () Bool)

(declare-fun e!49951 () Bool)

(assert (=> d!18193 e!49951))

(declare-fun res!40245 () Bool)

(assert (=> d!18193 (=> res!40245 e!49951)))

(declare-fun lt!34821 () Bool)

(assert (=> d!18193 (= res!40245 (not lt!34821))))

(declare-fun lt!34823 () Bool)

(assert (=> d!18193 (= lt!34821 lt!34823)))

(declare-fun lt!34820 () Unit!2193)

(declare-fun e!49952 () Unit!2193)

(assert (=> d!18193 (= lt!34820 e!49952)))

(declare-fun c!11679 () Bool)

(assert (=> d!18193 (= c!11679 lt!34823)))

(assert (=> d!18193 (= lt!34823 (containsKey!139 (toList!730 lt!34731) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18193 (= (contains!731 lt!34731 #b1000000000000000000000000000000000000000000000000000000000000000) lt!34821)))

(declare-fun b!76485 () Bool)

(declare-fun lt!34822 () Unit!2193)

(assert (=> b!76485 (= e!49952 lt!34822)))

(assert (=> b!76485 (= lt!34822 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 lt!34731) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76485 (isDefined!88 (getValueByKey!135 (toList!730 lt!34731) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76486 () Bool)

(declare-fun Unit!2207 () Unit!2193)

(assert (=> b!76486 (= e!49952 Unit!2207)))

(declare-fun b!76487 () Bool)

(assert (=> b!76487 (= e!49951 (isDefined!88 (getValueByKey!135 (toList!730 lt!34731) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18193 c!11679) b!76485))

(assert (= (and d!18193 (not c!11679)) b!76486))

(assert (= (and d!18193 (not res!40245)) b!76487))

(declare-fun m!76351 () Bool)

(assert (=> d!18193 m!76351))

(declare-fun m!76353 () Bool)

(assert (=> b!76485 m!76353))

(declare-fun m!76355 () Bool)

(assert (=> b!76485 m!76355))

(assert (=> b!76485 m!76355))

(declare-fun m!76357 () Bool)

(assert (=> b!76485 m!76357))

(assert (=> b!76487 m!76355))

(assert (=> b!76487 m!76355))

(assert (=> b!76487 m!76357))

(assert (=> b!76304 d!18193))

(declare-fun d!18195 () Bool)

(declare-fun lt!34824 () Bool)

(assert (=> d!18195 (= lt!34824 (select (content!82 Nil!1485) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun e!49954 () Bool)

(assert (=> d!18195 (= lt!34824 e!49954)))

(declare-fun res!40247 () Bool)

(assert (=> d!18195 (=> (not res!40247) (not e!49954))))

(assert (=> d!18195 (= res!40247 ((_ is Cons!1484) Nil!1485))))

(assert (=> d!18195 (= (contains!734 Nil!1485 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) lt!34824)))

(declare-fun b!76488 () Bool)

(declare-fun e!49953 () Bool)

(assert (=> b!76488 (= e!49954 e!49953)))

(declare-fun res!40246 () Bool)

(assert (=> b!76488 (=> res!40246 e!49953)))

(assert (=> b!76488 (= res!40246 (= (h!2072 Nil!1485) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun b!76489 () Bool)

(assert (=> b!76489 (= e!49953 (contains!734 (t!5082 Nil!1485) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (= (and d!18195 res!40247) b!76488))

(assert (= (and b!76488 (not res!40246)) b!76489))

(assert (=> d!18195 m!76331))

(assert (=> d!18195 m!75825))

(declare-fun m!76359 () Bool)

(assert (=> d!18195 m!76359))

(assert (=> b!76489 m!75825))

(declare-fun m!76361 () Bool)

(assert (=> b!76489 m!76361))

(assert (=> b!76348 d!18195))

(declare-fun d!18197 () Bool)

(declare-fun e!49955 () Bool)

(assert (=> d!18197 e!49955))

(declare-fun res!40248 () Bool)

(assert (=> d!18197 (=> res!40248 e!49955)))

(declare-fun lt!34826 () Bool)

(assert (=> d!18197 (= res!40248 (not lt!34826))))

(declare-fun lt!34828 () Bool)

(assert (=> d!18197 (= lt!34826 lt!34828)))

(declare-fun lt!34825 () Unit!2193)

(declare-fun e!49956 () Unit!2193)

(assert (=> d!18197 (= lt!34825 e!49956)))

(declare-fun c!11680 () Bool)

(assert (=> d!18197 (= c!11680 lt!34828)))

(assert (=> d!18197 (= lt!34828 (containsKey!139 (toList!730 lt!34731) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18197 (= (contains!731 lt!34731 #b0000000000000000000000000000000000000000000000000000000000000000) lt!34826)))

(declare-fun b!76490 () Bool)

(declare-fun lt!34827 () Unit!2193)

(assert (=> b!76490 (= e!49956 lt!34827)))

(assert (=> b!76490 (= lt!34827 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 lt!34731) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76490 (isDefined!88 (getValueByKey!135 (toList!730 lt!34731) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76491 () Bool)

(declare-fun Unit!2208 () Unit!2193)

(assert (=> b!76491 (= e!49956 Unit!2208)))

(declare-fun b!76492 () Bool)

(assert (=> b!76492 (= e!49955 (isDefined!88 (getValueByKey!135 (toList!730 lt!34731) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18197 c!11680) b!76490))

(assert (= (and d!18197 (not c!11680)) b!76491))

(assert (= (and d!18197 (not res!40248)) b!76492))

(declare-fun m!76363 () Bool)

(assert (=> d!18197 m!76363))

(declare-fun m!76365 () Bool)

(assert (=> b!76490 m!76365))

(declare-fun m!76367 () Bool)

(assert (=> b!76490 m!76367))

(assert (=> b!76490 m!76367))

(declare-fun m!76369 () Bool)

(assert (=> b!76490 m!76369))

(assert (=> b!76492 m!76367))

(assert (=> b!76492 m!76367))

(assert (=> b!76492 m!76369))

(assert (=> d!18109 d!18197))

(assert (=> d!18109 d!18117))

(declare-fun d!18199 () Bool)

(declare-fun e!49957 () Bool)

(assert (=> d!18199 e!49957))

(declare-fun res!40249 () Bool)

(assert (=> d!18199 (=> res!40249 e!49957)))

(declare-fun lt!34830 () Bool)

(assert (=> d!18199 (= res!40249 (not lt!34830))))

(declare-fun lt!34832 () Bool)

(assert (=> d!18199 (= lt!34830 lt!34832)))

(declare-fun lt!34829 () Unit!2193)

(declare-fun e!49958 () Unit!2193)

(assert (=> d!18199 (= lt!34829 e!49958)))

(declare-fun c!11681 () Bool)

(assert (=> d!18199 (= c!11681 lt!34832)))

(assert (=> d!18199 (= lt!34832 (containsKey!139 (toList!730 lt!34702) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18199 (= (contains!731 lt!34702 #b0000000000000000000000000000000000000000000000000000000000000000) lt!34830)))

(declare-fun b!76493 () Bool)

(declare-fun lt!34831 () Unit!2193)

(assert (=> b!76493 (= e!49958 lt!34831)))

(assert (=> b!76493 (= lt!34831 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 lt!34702) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76493 (isDefined!88 (getValueByKey!135 (toList!730 lt!34702) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76494 () Bool)

(declare-fun Unit!2209 () Unit!2193)

(assert (=> b!76494 (= e!49958 Unit!2209)))

(declare-fun b!76495 () Bool)

(assert (=> b!76495 (= e!49957 (isDefined!88 (getValueByKey!135 (toList!730 lt!34702) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18199 c!11681) b!76493))

(assert (= (and d!18199 (not c!11681)) b!76494))

(assert (= (and d!18199 (not res!40249)) b!76495))

(declare-fun m!76371 () Bool)

(assert (=> d!18199 m!76371))

(declare-fun m!76373 () Bool)

(assert (=> b!76493 m!76373))

(declare-fun m!76375 () Bool)

(assert (=> b!76493 m!76375))

(assert (=> b!76493 m!76375))

(declare-fun m!76377 () Bool)

(assert (=> b!76493 m!76377))

(assert (=> b!76495 m!76375))

(assert (=> b!76495 m!76375))

(assert (=> b!76495 m!76377))

(assert (=> bm!6900 d!18199))

(declare-fun b!76496 () Bool)

(declare-fun e!49962 () Bool)

(declare-fun e!49961 () Bool)

(assert (=> b!76496 (= e!49962 e!49961)))

(declare-fun res!40252 () Bool)

(assert (=> b!76496 (=> (not res!40252) (not e!49961))))

(declare-fun e!49960 () Bool)

(assert (=> b!76496 (= res!40252 (not e!49960))))

(declare-fun res!40250 () Bool)

(assert (=> b!76496 (=> (not res!40250) (not e!49960))))

(assert (=> b!76496 (= res!40250 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!76497 () Bool)

(declare-fun e!49959 () Bool)

(declare-fun call!6925 () Bool)

(assert (=> b!76497 (= e!49959 call!6925)))

(declare-fun b!76498 () Bool)

(assert (=> b!76498 (= e!49961 e!49959)))

(declare-fun c!11682 () Bool)

(assert (=> b!76498 (= c!11682 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!6922 () Bool)

(assert (=> bm!6922 (= call!6925 (arrayNoDuplicates!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!11682 (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!11644 (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000) Nil!1485) Nil!1485)) (ite c!11644 (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000) Nil!1485) Nil!1485))))))

(declare-fun b!76499 () Bool)

(assert (=> b!76499 (= e!49959 call!6925)))

(declare-fun d!18201 () Bool)

(declare-fun res!40251 () Bool)

(assert (=> d!18201 (=> res!40251 e!49962)))

(assert (=> d!18201 (= res!40251 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> d!18201 (= (arrayNoDuplicates!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11644 (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000) Nil!1485) Nil!1485)) e!49962)))

(declare-fun b!76500 () Bool)

(assert (=> b!76500 (= e!49960 (contains!734 (ite c!11644 (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000) Nil!1485) Nil!1485) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!18201 (not res!40251)) b!76496))

(assert (= (and b!76496 res!40250) b!76500))

(assert (= (and b!76496 res!40252) b!76498))

(assert (= (and b!76498 c!11682) b!76499))

(assert (= (and b!76498 (not c!11682)) b!76497))

(assert (= (or b!76499 b!76497) bm!6922))

(declare-fun m!76379 () Bool)

(assert (=> b!76496 m!76379))

(assert (=> b!76496 m!76379))

(declare-fun m!76381 () Bool)

(assert (=> b!76496 m!76381))

(assert (=> b!76498 m!76379))

(assert (=> b!76498 m!76379))

(assert (=> b!76498 m!76381))

(assert (=> bm!6922 m!76379))

(declare-fun m!76383 () Bool)

(assert (=> bm!6922 m!76383))

(assert (=> b!76500 m!76379))

(assert (=> b!76500 m!76379))

(declare-fun m!76385 () Bool)

(assert (=> b!76500 m!76385))

(assert (=> bm!6907 d!18201))

(declare-fun d!18203 () Bool)

(assert (=> d!18203 (= (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76364 d!18203))

(declare-fun d!18205 () Bool)

(declare-fun e!49965 () Bool)

(assert (=> d!18205 e!49965))

(declare-fun res!40258 () Bool)

(assert (=> d!18205 (=> (not res!40258) (not e!49965))))

(declare-fun lt!34838 () SeekEntryResult!238)

(assert (=> d!18205 (= res!40258 ((_ is Found!238) lt!34838))))

(assert (=> d!18205 (= lt!34838 (seekEntryOrOpen!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (_keys!3905 newMap!16) (mask!6230 newMap!16)))))

(declare-fun lt!34837 () Unit!2193)

(declare-fun choose!443 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 64) Int) Unit!2193)

(assert (=> d!18205 (= lt!34837 (choose!443 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (defaultEntry!2247 newMap!16)))))

(assert (=> d!18205 (validMask!0 (mask!6230 newMap!16))))

(assert (=> d!18205 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!26 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (defaultEntry!2247 newMap!16)) lt!34837)))

(declare-fun b!76505 () Bool)

(declare-fun res!40257 () Bool)

(assert (=> b!76505 (=> (not res!40257) (not e!49965))))

(assert (=> b!76505 (= res!40257 (inRange!0 (index!3086 lt!34838) (mask!6230 newMap!16)))))

(declare-fun b!76506 () Bool)

(assert (=> b!76506 (= e!49965 (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3086 lt!34838)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (=> b!76506 (and (bvsge (index!3086 lt!34838) #b00000000000000000000000000000000) (bvslt (index!3086 lt!34838) (size!2111 (_keys!3905 newMap!16))))))

(assert (= (and d!18205 res!40258) b!76505))

(assert (= (and b!76505 res!40257) b!76506))

(assert (=> d!18205 m!75825))

(assert (=> d!18205 m!75973))

(assert (=> d!18205 m!75825))

(declare-fun m!76387 () Bool)

(assert (=> d!18205 m!76387))

(assert (=> d!18205 m!76219))

(declare-fun m!76389 () Bool)

(assert (=> b!76505 m!76389))

(declare-fun m!76391 () Bool)

(assert (=> b!76506 m!76391))

(assert (=> bm!6859 d!18205))

(declare-fun d!18207 () Bool)

(declare-fun e!49966 () Bool)

(assert (=> d!18207 e!49966))

(declare-fun res!40259 () Bool)

(assert (=> d!18207 (=> res!40259 e!49966)))

(declare-fun lt!34840 () Bool)

(assert (=> d!18207 (= res!40259 (not lt!34840))))

(declare-fun lt!34842 () Bool)

(assert (=> d!18207 (= lt!34840 lt!34842)))

(declare-fun lt!34839 () Unit!2193)

(declare-fun e!49967 () Unit!2193)

(assert (=> d!18207 (= lt!34839 e!49967)))

(declare-fun c!11683 () Bool)

(assert (=> d!18207 (= c!11683 lt!34842)))

(assert (=> d!18207 (= lt!34842 (containsKey!139 (toList!730 call!6871) (select (arr!1871 (_keys!3905 newMap!16)) (index!3086 lt!34630))))))

(assert (=> d!18207 (= (contains!731 call!6871 (select (arr!1871 (_keys!3905 newMap!16)) (index!3086 lt!34630))) lt!34840)))

(declare-fun b!76507 () Bool)

(declare-fun lt!34841 () Unit!2193)

(assert (=> b!76507 (= e!49967 lt!34841)))

(assert (=> b!76507 (= lt!34841 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 call!6871) (select (arr!1871 (_keys!3905 newMap!16)) (index!3086 lt!34630))))))

(assert (=> b!76507 (isDefined!88 (getValueByKey!135 (toList!730 call!6871) (select (arr!1871 (_keys!3905 newMap!16)) (index!3086 lt!34630))))))

(declare-fun b!76508 () Bool)

(declare-fun Unit!2210 () Unit!2193)

(assert (=> b!76508 (= e!49967 Unit!2210)))

(declare-fun b!76509 () Bool)

(assert (=> b!76509 (= e!49966 (isDefined!88 (getValueByKey!135 (toList!730 call!6871) (select (arr!1871 (_keys!3905 newMap!16)) (index!3086 lt!34630)))))))

(assert (= (and d!18207 c!11683) b!76507))

(assert (= (and d!18207 (not c!11683)) b!76508))

(assert (= (and d!18207 (not res!40259)) b!76509))

(assert (=> d!18207 m!75959))

(declare-fun m!76393 () Bool)

(assert (=> d!18207 m!76393))

(assert (=> b!76507 m!75959))

(declare-fun m!76395 () Bool)

(assert (=> b!76507 m!76395))

(assert (=> b!76507 m!75959))

(declare-fun m!76397 () Bool)

(assert (=> b!76507 m!76397))

(assert (=> b!76507 m!76397))

(declare-fun m!76399 () Bool)

(assert (=> b!76507 m!76399))

(assert (=> b!76509 m!75959))

(assert (=> b!76509 m!76397))

(assert (=> b!76509 m!76397))

(assert (=> b!76509 m!76399))

(assert (=> b!76182 d!18207))

(declare-fun d!18209 () Bool)

(declare-fun e!49970 () Bool)

(assert (=> d!18209 e!49970))

(declare-fun res!40262 () Bool)

(assert (=> d!18209 (=> (not res!40262) (not e!49970))))

(assert (=> d!18209 (= res!40262 (and (bvsge (index!3086 lt!34630) #b00000000000000000000000000000000) (bvslt (index!3086 lt!34630) (size!2111 (_keys!3905 newMap!16)))))))

(declare-fun lt!34845 () Unit!2193)

(declare-fun choose!444 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 32) Int) Unit!2193)

(assert (=> d!18209 (= lt!34845 (choose!444 (_keys!3905 newMap!16) lt!34637 (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (index!3086 lt!34630) (defaultEntry!2247 newMap!16)))))

(assert (=> d!18209 (validMask!0 (mask!6230 newMap!16))))

(assert (=> d!18209 (= (lemmaValidKeyInArrayIsInListMap!87 (_keys!3905 newMap!16) lt!34637 (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (index!3086 lt!34630) (defaultEntry!2247 newMap!16)) lt!34845)))

(declare-fun b!76512 () Bool)

(assert (=> b!76512 (= e!49970 (contains!731 (getCurrentListMap!426 (_keys!3905 newMap!16) lt!34637 (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)) (select (arr!1871 (_keys!3905 newMap!16)) (index!3086 lt!34630))))))

(assert (= (and d!18209 res!40262) b!76512))

(declare-fun m!76401 () Bool)

(assert (=> d!18209 m!76401))

(assert (=> d!18209 m!76219))

(declare-fun m!76403 () Bool)

(assert (=> b!76512 m!76403))

(assert (=> b!76512 m!75959))

(assert (=> b!76512 m!76403))

(assert (=> b!76512 m!75959))

(declare-fun m!76405 () Bool)

(assert (=> b!76512 m!76405))

(assert (=> b!76182 d!18209))

(declare-fun b!76513 () Bool)

(declare-fun e!49971 () Bool)

(declare-fun call!6926 () Bool)

(assert (=> b!76513 (= e!49971 (not call!6926))))

(declare-fun b!76514 () Bool)

(declare-fun e!49972 () Bool)

(declare-fun call!6928 () Bool)

(assert (=> b!76514 (= e!49972 (not call!6928))))

(declare-fun bm!6923 () Bool)

(declare-fun call!6932 () ListLongMap!1429)

(declare-fun call!6927 () ListLongMap!1429)

(assert (=> bm!6923 (= call!6932 call!6927)))

(declare-fun b!76515 () Bool)

(declare-fun e!49976 () Unit!2193)

(declare-fun Unit!2211 () Unit!2193)

(assert (=> b!76515 (= e!49976 Unit!2211)))

(declare-fun call!6930 () ListLongMap!1429)

(declare-fun c!11686 () Bool)

(declare-fun bm!6924 () Bool)

(declare-fun call!6929 () ListLongMap!1429)

(declare-fun c!11687 () Bool)

(declare-fun call!6931 () ListLongMap!1429)

(assert (=> bm!6924 (= call!6927 (+!99 (ite c!11686 call!6931 (ite c!11687 call!6930 call!6929)) (ite (or c!11686 c!11687) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 newMap!16)) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 newMap!16)))))))

(declare-fun bm!6925 () Bool)

(assert (=> bm!6925 (= call!6931 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (index!3086 lt!34630) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun bm!6926 () Bool)

(assert (=> bm!6926 (= call!6929 call!6930)))

(declare-fun b!76516 () Bool)

(declare-fun e!49983 () Bool)

(assert (=> b!76516 (= e!49983 (validKeyInArray!0 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6927 () Bool)

(declare-fun lt!34865 () ListLongMap!1429)

(assert (=> bm!6927 (= call!6928 (contains!731 lt!34865 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76517 () Bool)

(declare-fun c!11689 () Bool)

(assert (=> b!76517 (= c!11689 (and (not (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!49981 () ListLongMap!1429)

(declare-fun e!49975 () ListLongMap!1429)

(assert (=> b!76517 (= e!49981 e!49975)))

(declare-fun b!76518 () Bool)

(declare-fun e!49978 () Bool)

(assert (=> b!76518 (= e!49978 (= (apply!77 lt!34865 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2146 newMap!16)))))

(declare-fun b!76519 () Bool)

(declare-fun e!49980 () Bool)

(assert (=> b!76519 (= e!49980 (= (apply!77 lt!34865 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)) (get!1154 (select (arr!1872 (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (index!3086 lt!34630) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!330 (defaultEntry!2247 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2112 (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (index!3086 lt!34630) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))))))))

(assert (=> b!76519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(declare-fun b!76520 () Bool)

(declare-fun res!40263 () Bool)

(declare-fun e!49977 () Bool)

(assert (=> b!76520 (=> (not res!40263) (not e!49977))))

(declare-fun e!49974 () Bool)

(assert (=> b!76520 (= res!40263 e!49974)))

(declare-fun res!40271 () Bool)

(assert (=> b!76520 (=> res!40271 e!49974)))

(assert (=> b!76520 (= res!40271 (not e!49983))))

(declare-fun res!40267 () Bool)

(assert (=> b!76520 (=> (not res!40267) (not e!49983))))

(assert (=> b!76520 (= res!40267 (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(declare-fun bm!6929 () Bool)

(assert (=> bm!6929 (= call!6926 (contains!731 lt!34865 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76521 () Bool)

(assert (=> b!76521 (= e!49977 e!49972)))

(declare-fun c!11688 () Bool)

(assert (=> b!76521 (= c!11688 (not (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76522 () Bool)

(assert (=> b!76522 (= e!49975 call!6932)))

(declare-fun b!76523 () Bool)

(declare-fun e!49973 () ListLongMap!1429)

(assert (=> b!76523 (= e!49973 (+!99 call!6927 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 newMap!16))))))

(declare-fun b!76524 () Bool)

(assert (=> b!76524 (= e!49981 call!6932)))

(declare-fun b!76525 () Bool)

(assert (=> b!76525 (= e!49971 e!49978)))

(declare-fun res!40268 () Bool)

(assert (=> b!76525 (= res!40268 call!6926)))

(assert (=> b!76525 (=> (not res!40268) (not e!49978))))

(declare-fun b!76526 () Bool)

(assert (=> b!76526 (= e!49975 call!6929)))

(declare-fun b!76527 () Bool)

(declare-fun e!49979 () Bool)

(assert (=> b!76527 (= e!49979 (= (apply!77 lt!34865 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2146 newMap!16)))))

(declare-fun b!76528 () Bool)

(declare-fun e!49982 () Bool)

(assert (=> b!76528 (= e!49982 (validKeyInArray!0 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76529 () Bool)

(assert (=> b!76529 (= e!49974 e!49980)))

(declare-fun res!40264 () Bool)

(assert (=> b!76529 (=> (not res!40264) (not e!49980))))

(assert (=> b!76529 (= res!40264 (contains!731 lt!34865 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!76529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(declare-fun b!76530 () Bool)

(declare-fun res!40269 () Bool)

(assert (=> b!76530 (=> (not res!40269) (not e!49977))))

(assert (=> b!76530 (= res!40269 e!49971)))

(declare-fun c!11685 () Bool)

(assert (=> b!76530 (= c!11685 (not (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!76531 () Bool)

(assert (=> b!76531 (= e!49972 e!49979)))

(declare-fun res!40270 () Bool)

(assert (=> b!76531 (= res!40270 call!6928)))

(assert (=> b!76531 (=> (not res!40270) (not e!49979))))

(declare-fun b!76532 () Bool)

(declare-fun lt!34864 () Unit!2193)

(assert (=> b!76532 (= e!49976 lt!34864)))

(declare-fun lt!34863 () ListLongMap!1429)

(assert (=> b!76532 (= lt!34863 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (index!3086 lt!34630) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!34858 () (_ BitVec 64))

(assert (=> b!76532 (= lt!34858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34849 () (_ BitVec 64))

(assert (=> b!76532 (= lt!34849 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34860 () Unit!2193)

(assert (=> b!76532 (= lt!34860 (addStillContains!53 lt!34863 lt!34858 (zeroValue!2146 newMap!16) lt!34849))))

(assert (=> b!76532 (contains!731 (+!99 lt!34863 (tuple2!2141 lt!34858 (zeroValue!2146 newMap!16))) lt!34849)))

(declare-fun lt!34855 () Unit!2193)

(assert (=> b!76532 (= lt!34855 lt!34860)))

(declare-fun lt!34853 () ListLongMap!1429)

(assert (=> b!76532 (= lt!34853 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (index!3086 lt!34630) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!34850 () (_ BitVec 64))

(assert (=> b!76532 (= lt!34850 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34847 () (_ BitVec 64))

(assert (=> b!76532 (= lt!34847 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34862 () Unit!2193)

(assert (=> b!76532 (= lt!34862 (addApplyDifferent!53 lt!34853 lt!34850 (minValue!2146 newMap!16) lt!34847))))

(assert (=> b!76532 (= (apply!77 (+!99 lt!34853 (tuple2!2141 lt!34850 (minValue!2146 newMap!16))) lt!34847) (apply!77 lt!34853 lt!34847))))

(declare-fun lt!34851 () Unit!2193)

(assert (=> b!76532 (= lt!34851 lt!34862)))

(declare-fun lt!34861 () ListLongMap!1429)

(assert (=> b!76532 (= lt!34861 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (index!3086 lt!34630) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!34854 () (_ BitVec 64))

(assert (=> b!76532 (= lt!34854 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34859 () (_ BitVec 64))

(assert (=> b!76532 (= lt!34859 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34846 () Unit!2193)

(assert (=> b!76532 (= lt!34846 (addApplyDifferent!53 lt!34861 lt!34854 (zeroValue!2146 newMap!16) lt!34859))))

(assert (=> b!76532 (= (apply!77 (+!99 lt!34861 (tuple2!2141 lt!34854 (zeroValue!2146 newMap!16))) lt!34859) (apply!77 lt!34861 lt!34859))))

(declare-fun lt!34856 () Unit!2193)

(assert (=> b!76532 (= lt!34856 lt!34846)))

(declare-fun lt!34866 () ListLongMap!1429)

(assert (=> b!76532 (= lt!34866 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (index!3086 lt!34630) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!34857 () (_ BitVec 64))

(assert (=> b!76532 (= lt!34857 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34867 () (_ BitVec 64))

(assert (=> b!76532 (= lt!34867 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!76532 (= lt!34864 (addApplyDifferent!53 lt!34866 lt!34857 (minValue!2146 newMap!16) lt!34867))))

(assert (=> b!76532 (= (apply!77 (+!99 lt!34866 (tuple2!2141 lt!34857 (minValue!2146 newMap!16))) lt!34867) (apply!77 lt!34866 lt!34867))))

(declare-fun b!76533 () Bool)

(assert (=> b!76533 (= e!49973 e!49981)))

(assert (=> b!76533 (= c!11687 (and (not (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6928 () Bool)

(assert (=> bm!6928 (= call!6930 call!6931)))

(declare-fun d!18211 () Bool)

(assert (=> d!18211 e!49977))

(declare-fun res!40266 () Bool)

(assert (=> d!18211 (=> (not res!40266) (not e!49977))))

(assert (=> d!18211 (= res!40266 (or (bvsge #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))))

(declare-fun lt!34848 () ListLongMap!1429)

(assert (=> d!18211 (= lt!34865 lt!34848)))

(declare-fun lt!34852 () Unit!2193)

(assert (=> d!18211 (= lt!34852 e!49976)))

(declare-fun c!11684 () Bool)

(assert (=> d!18211 (= c!11684 e!49982)))

(declare-fun res!40265 () Bool)

(assert (=> d!18211 (=> (not res!40265) (not e!49982))))

(assert (=> d!18211 (= res!40265 (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(assert (=> d!18211 (= lt!34848 e!49973)))

(assert (=> d!18211 (= c!11686 (and (not (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18211 (validMask!0 (mask!6230 newMap!16))))

(assert (=> d!18211 (= (getCurrentListMap!426 (_keys!3905 newMap!16) (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (index!3086 lt!34630) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)) lt!34865)))

(assert (= (and d!18211 c!11686) b!76523))

(assert (= (and d!18211 (not c!11686)) b!76533))

(assert (= (and b!76533 c!11687) b!76524))

(assert (= (and b!76533 (not c!11687)) b!76517))

(assert (= (and b!76517 c!11689) b!76522))

(assert (= (and b!76517 (not c!11689)) b!76526))

(assert (= (or b!76522 b!76526) bm!6926))

(assert (= (or b!76524 bm!6926) bm!6928))

(assert (= (or b!76524 b!76522) bm!6923))

(assert (= (or b!76523 bm!6928) bm!6925))

(assert (= (or b!76523 bm!6923) bm!6924))

(assert (= (and d!18211 res!40265) b!76528))

(assert (= (and d!18211 c!11684) b!76532))

(assert (= (and d!18211 (not c!11684)) b!76515))

(assert (= (and d!18211 res!40266) b!76520))

(assert (= (and b!76520 res!40267) b!76516))

(assert (= (and b!76520 (not res!40271)) b!76529))

(assert (= (and b!76529 res!40264) b!76519))

(assert (= (and b!76520 res!40263) b!76530))

(assert (= (and b!76530 c!11685) b!76525))

(assert (= (and b!76530 (not c!11685)) b!76513))

(assert (= (and b!76525 res!40268) b!76518))

(assert (= (or b!76525 b!76513) bm!6929))

(assert (= (and b!76530 res!40269) b!76521))

(assert (= (and b!76521 c!11688) b!76531))

(assert (= (and b!76521 (not c!11688)) b!76514))

(assert (= (and b!76531 res!40270) b!76527))

(assert (= (or b!76531 b!76514) bm!6927))

(declare-fun b_lambda!3435 () Bool)

(assert (=> (not b_lambda!3435) (not b!76519)))

(declare-fun t!5091 () Bool)

(declare-fun tb!1573 () Bool)

(assert (=> (and b!75990 (= (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) (defaultEntry!2247 newMap!16)) t!5091) tb!1573))

(declare-fun result!2745 () Bool)

(assert (=> tb!1573 (= result!2745 tp_is_empty!2487)))

(assert (=> b!76519 t!5091))

(declare-fun b_and!4683 () Bool)

(assert (= b_and!4679 (and (=> t!5091 result!2745) b_and!4683)))

(declare-fun t!5093 () Bool)

(declare-fun tb!1575 () Bool)

(assert (=> (and b!75980 (= (defaultEntry!2247 newMap!16) (defaultEntry!2247 newMap!16)) t!5093) tb!1575))

(declare-fun result!2747 () Bool)

(assert (= result!2747 result!2745))

(assert (=> b!76519 t!5093))

(declare-fun b_and!4685 () Bool)

(assert (= b_and!4681 (and (=> t!5093 result!2747) b_and!4685)))

(declare-fun m!76407 () Bool)

(assert (=> bm!6927 m!76407))

(declare-fun m!76409 () Bool)

(assert (=> b!76532 m!76409))

(declare-fun m!76411 () Bool)

(assert (=> b!76532 m!76411))

(declare-fun m!76413 () Bool)

(assert (=> b!76532 m!76413))

(declare-fun m!76415 () Bool)

(assert (=> b!76532 m!76415))

(declare-fun m!76417 () Bool)

(assert (=> b!76532 m!76417))

(declare-fun m!76419 () Bool)

(assert (=> b!76532 m!76419))

(declare-fun m!76421 () Bool)

(assert (=> b!76532 m!76421))

(declare-fun m!76423 () Bool)

(assert (=> b!76532 m!76423))

(assert (=> b!76532 m!76321))

(declare-fun m!76425 () Bool)

(assert (=> b!76532 m!76425))

(declare-fun m!76427 () Bool)

(assert (=> b!76532 m!76427))

(assert (=> b!76532 m!76417))

(declare-fun m!76429 () Bool)

(assert (=> b!76532 m!76429))

(assert (=> b!76532 m!76421))

(assert (=> b!76532 m!76429))

(declare-fun m!76431 () Bool)

(assert (=> b!76532 m!76431))

(declare-fun m!76433 () Bool)

(assert (=> b!76532 m!76433))

(assert (=> b!76532 m!76425))

(declare-fun m!76435 () Bool)

(assert (=> b!76532 m!76435))

(declare-fun m!76437 () Bool)

(assert (=> b!76532 m!76437))

(declare-fun m!76439 () Bool)

(assert (=> b!76532 m!76439))

(declare-fun m!76441 () Bool)

(assert (=> b!76527 m!76441))

(declare-fun m!76443 () Bool)

(assert (=> b!76519 m!76443))

(assert (=> b!76519 m!76443))

(declare-fun m!76445 () Bool)

(assert (=> b!76519 m!76445))

(declare-fun m!76447 () Bool)

(assert (=> b!76519 m!76447))

(assert (=> b!76519 m!76445))

(assert (=> b!76519 m!76321))

(assert (=> b!76519 m!76321))

(declare-fun m!76449 () Bool)

(assert (=> b!76519 m!76449))

(assert (=> b!76516 m!76321))

(assert (=> b!76516 m!76321))

(assert (=> b!76516 m!76329))

(declare-fun m!76451 () Bool)

(assert (=> b!76518 m!76451))

(assert (=> bm!6925 m!76433))

(assert (=> b!76529 m!76321))

(assert (=> b!76529 m!76321))

(declare-fun m!76453 () Bool)

(assert (=> b!76529 m!76453))

(declare-fun m!76455 () Bool)

(assert (=> b!76523 m!76455))

(assert (=> b!76528 m!76321))

(assert (=> b!76528 m!76321))

(assert (=> b!76528 m!76329))

(declare-fun m!76457 () Bool)

(assert (=> bm!6929 m!76457))

(declare-fun m!76459 () Bool)

(assert (=> bm!6924 m!76459))

(assert (=> d!18211 m!76219))

(assert (=> b!76182 d!18211))

(declare-fun d!18213 () Bool)

(declare-fun e!49986 () Bool)

(assert (=> d!18213 e!49986))

(declare-fun res!40274 () Bool)

(assert (=> d!18213 (=> (not res!40274) (not e!49986))))

(assert (=> d!18213 (= res!40274 (and (bvsge (index!3086 lt!34630) #b00000000000000000000000000000000) (bvslt (index!3086 lt!34630) (size!2112 (_values!2230 newMap!16)))))))

(declare-fun lt!34870 () Unit!2193)

(declare-fun choose!445 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 32) (_ BitVec 64) V!2963 Int) Unit!2193)

(assert (=> d!18213 (= lt!34870 (choose!445 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (index!3086 lt!34630) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504 (defaultEntry!2247 newMap!16)))))

(assert (=> d!18213 (validMask!0 (mask!6230 newMap!16))))

(assert (=> d!18213 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!26 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (index!3086 lt!34630) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504 (defaultEntry!2247 newMap!16)) lt!34870)))

(declare-fun b!76536 () Bool)

(assert (=> b!76536 (= e!49986 (= (+!99 (getCurrentListMap!426 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) (getCurrentListMap!426 (_keys!3905 newMap!16) (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (index!3086 lt!34630) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16))))))

(assert (= (and d!18213 res!40274) b!76536))

(assert (=> d!18213 m!75825))

(declare-fun m!76461 () Bool)

(assert (=> d!18213 m!76461))

(assert (=> d!18213 m!76219))

(assert (=> b!76536 m!76013))

(assert (=> b!76536 m!76013))

(declare-fun m!76463 () Bool)

(assert (=> b!76536 m!76463))

(assert (=> b!76536 m!75967))

(assert (=> b!76536 m!75963))

(assert (=> b!76182 d!18213))

(declare-fun b!76537 () Bool)

(declare-fun e!49990 () Bool)

(declare-fun e!49989 () Bool)

(assert (=> b!76537 (= e!49990 e!49989)))

(declare-fun res!40277 () Bool)

(assert (=> b!76537 (=> (not res!40277) (not e!49989))))

(declare-fun e!49988 () Bool)

(assert (=> b!76537 (= res!40277 (not e!49988))))

(declare-fun res!40275 () Bool)

(assert (=> b!76537 (=> (not res!40275) (not e!49988))))

(assert (=> b!76537 (= res!40275 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!76538 () Bool)

(declare-fun e!49987 () Bool)

(declare-fun call!6933 () Bool)

(assert (=> b!76538 (= e!49987 call!6933)))

(declare-fun b!76539 () Bool)

(assert (=> b!76539 (= e!49989 e!49987)))

(declare-fun c!11690 () Bool)

(assert (=> b!76539 (= c!11690 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!6930 () Bool)

(assert (=> bm!6930 (= call!6933 (arrayNoDuplicates!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!11690 (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!11643 (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) Nil!1485) Nil!1485)) (ite c!11643 (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) Nil!1485) Nil!1485))))))

(declare-fun b!76540 () Bool)

(assert (=> b!76540 (= e!49987 call!6933)))

(declare-fun d!18215 () Bool)

(declare-fun res!40276 () Bool)

(assert (=> d!18215 (=> res!40276 e!49990)))

(assert (=> d!18215 (= res!40276 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> d!18215 (= (arrayNoDuplicates!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11643 (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) Nil!1485) Nil!1485)) e!49990)))

(declare-fun b!76541 () Bool)

(assert (=> b!76541 (= e!49988 (contains!734 (ite c!11643 (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) Nil!1485) Nil!1485) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!18215 (not res!40276)) b!76537))

(assert (= (and b!76537 res!40275) b!76541))

(assert (= (and b!76537 res!40277) b!76539))

(assert (= (and b!76539 c!11690) b!76540))

(assert (= (and b!76539 (not c!11690)) b!76538))

(assert (= (or b!76540 b!76538) bm!6930))

(declare-fun m!76465 () Bool)

(assert (=> b!76537 m!76465))

(assert (=> b!76537 m!76465))

(declare-fun m!76467 () Bool)

(assert (=> b!76537 m!76467))

(assert (=> b!76539 m!76465))

(assert (=> b!76539 m!76465))

(assert (=> b!76539 m!76467))

(assert (=> bm!6930 m!76465))

(declare-fun m!76469 () Bool)

(assert (=> bm!6930 m!76469))

(assert (=> b!76541 m!76465))

(assert (=> b!76541 m!76465))

(declare-fun m!76471 () Bool)

(assert (=> b!76541 m!76471))

(assert (=> bm!6906 d!18215))

(declare-fun d!18217 () Bool)

(assert (=> d!18217 (= (apply!77 lt!34702 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1158 (getValueByKey!135 (toList!730 lt!34702) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3271 () Bool)

(assert (= bs!3271 d!18217))

(assert (=> bs!3271 m!76033))

(assert (=> bs!3271 m!76257))

(assert (=> bs!3271 m!76257))

(declare-fun m!76473 () Bool)

(assert (=> bs!3271 m!76473))

(assert (=> b!76259 d!18217))

(assert (=> b!76259 d!18177))

(declare-fun b!76542 () Bool)

(declare-fun e!49991 () Bool)

(declare-fun call!6934 () Bool)

(assert (=> b!76542 (= e!49991 (not call!6934))))

(declare-fun b!76543 () Bool)

(declare-fun e!49992 () Bool)

(declare-fun call!6936 () Bool)

(assert (=> b!76543 (= e!49992 (not call!6936))))

(declare-fun bm!6931 () Bool)

(declare-fun call!6940 () ListLongMap!1429)

(declare-fun call!6935 () ListLongMap!1429)

(assert (=> bm!6931 (= call!6940 call!6935)))

(declare-fun b!76544 () Bool)

(declare-fun e!49996 () Unit!2193)

(declare-fun Unit!2212 () Unit!2193)

(assert (=> b!76544 (= e!49996 Unit!2212)))

(declare-fun bm!6932 () Bool)

(declare-fun call!6938 () ListLongMap!1429)

(declare-fun c!11694 () Bool)

(declare-fun call!6937 () ListLongMap!1429)

(declare-fun call!6939 () ListLongMap!1429)

(declare-fun c!11693 () Bool)

(assert (=> bm!6932 (= call!6935 (+!99 (ite c!11693 call!6939 (ite c!11694 call!6938 call!6937)) (ite (or c!11693 c!11694) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 newMap!16)) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 newMap!16)))))))

(declare-fun bm!6933 () Bool)

(assert (=> bm!6933 (= call!6939 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun bm!6934 () Bool)

(assert (=> bm!6934 (= call!6937 call!6938)))

(declare-fun b!76545 () Bool)

(declare-fun e!50003 () Bool)

(assert (=> b!76545 (= e!50003 (validKeyInArray!0 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6935 () Bool)

(declare-fun lt!34890 () ListLongMap!1429)

(assert (=> bm!6935 (= call!6936 (contains!731 lt!34890 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76546 () Bool)

(declare-fun c!11696 () Bool)

(assert (=> b!76546 (= c!11696 (and (not (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!50001 () ListLongMap!1429)

(declare-fun e!49995 () ListLongMap!1429)

(assert (=> b!76546 (= e!50001 e!49995)))

(declare-fun b!76547 () Bool)

(declare-fun e!49998 () Bool)

(assert (=> b!76547 (= e!49998 (= (apply!77 lt!34890 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2146 newMap!16)))))

(declare-fun b!76548 () Bool)

(declare-fun e!50000 () Bool)

(assert (=> b!76548 (= e!50000 (= (apply!77 lt!34890 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)) (get!1154 (select (arr!1872 (_values!2230 newMap!16)) #b00000000000000000000000000000000) (dynLambda!330 (defaultEntry!2247 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76548 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2112 (_values!2230 newMap!16))))))

(assert (=> b!76548 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(declare-fun b!76549 () Bool)

(declare-fun res!40278 () Bool)

(declare-fun e!49997 () Bool)

(assert (=> b!76549 (=> (not res!40278) (not e!49997))))

(declare-fun e!49994 () Bool)

(assert (=> b!76549 (= res!40278 e!49994)))

(declare-fun res!40286 () Bool)

(assert (=> b!76549 (=> res!40286 e!49994)))

(assert (=> b!76549 (= res!40286 (not e!50003))))

(declare-fun res!40282 () Bool)

(assert (=> b!76549 (=> (not res!40282) (not e!50003))))

(assert (=> b!76549 (= res!40282 (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(declare-fun bm!6937 () Bool)

(assert (=> bm!6937 (= call!6934 (contains!731 lt!34890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76550 () Bool)

(assert (=> b!76550 (= e!49997 e!49992)))

(declare-fun c!11695 () Bool)

(assert (=> b!76550 (= c!11695 (not (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76551 () Bool)

(assert (=> b!76551 (= e!49995 call!6940)))

(declare-fun b!76552 () Bool)

(declare-fun e!49993 () ListLongMap!1429)

(assert (=> b!76552 (= e!49993 (+!99 call!6935 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 newMap!16))))))

(declare-fun b!76553 () Bool)

(assert (=> b!76553 (= e!50001 call!6940)))

(declare-fun b!76554 () Bool)

(assert (=> b!76554 (= e!49991 e!49998)))

(declare-fun res!40283 () Bool)

(assert (=> b!76554 (= res!40283 call!6934)))

(assert (=> b!76554 (=> (not res!40283) (not e!49998))))

(declare-fun b!76555 () Bool)

(assert (=> b!76555 (= e!49995 call!6937)))

(declare-fun b!76556 () Bool)

(declare-fun e!49999 () Bool)

(assert (=> b!76556 (= e!49999 (= (apply!77 lt!34890 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2146 newMap!16)))))

(declare-fun b!76557 () Bool)

(declare-fun e!50002 () Bool)

(assert (=> b!76557 (= e!50002 (validKeyInArray!0 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76558 () Bool)

(assert (=> b!76558 (= e!49994 e!50000)))

(declare-fun res!40279 () Bool)

(assert (=> b!76558 (=> (not res!40279) (not e!50000))))

(assert (=> b!76558 (= res!40279 (contains!731 lt!34890 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!76558 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(declare-fun b!76559 () Bool)

(declare-fun res!40284 () Bool)

(assert (=> b!76559 (=> (not res!40284) (not e!49997))))

(assert (=> b!76559 (= res!40284 e!49991)))

(declare-fun c!11692 () Bool)

(assert (=> b!76559 (= c!11692 (not (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!76560 () Bool)

(assert (=> b!76560 (= e!49992 e!49999)))

(declare-fun res!40285 () Bool)

(assert (=> b!76560 (= res!40285 call!6936)))

(assert (=> b!76560 (=> (not res!40285) (not e!49999))))

(declare-fun b!76561 () Bool)

(declare-fun lt!34889 () Unit!2193)

(assert (=> b!76561 (= e!49996 lt!34889)))

(declare-fun lt!34888 () ListLongMap!1429)

(assert (=> b!76561 (= lt!34888 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!34883 () (_ BitVec 64))

(assert (=> b!76561 (= lt!34883 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34874 () (_ BitVec 64))

(assert (=> b!76561 (= lt!34874 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34885 () Unit!2193)

(assert (=> b!76561 (= lt!34885 (addStillContains!53 lt!34888 lt!34883 (zeroValue!2146 newMap!16) lt!34874))))

(assert (=> b!76561 (contains!731 (+!99 lt!34888 (tuple2!2141 lt!34883 (zeroValue!2146 newMap!16))) lt!34874)))

(declare-fun lt!34880 () Unit!2193)

(assert (=> b!76561 (= lt!34880 lt!34885)))

(declare-fun lt!34878 () ListLongMap!1429)

(assert (=> b!76561 (= lt!34878 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!34875 () (_ BitVec 64))

(assert (=> b!76561 (= lt!34875 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34872 () (_ BitVec 64))

(assert (=> b!76561 (= lt!34872 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34887 () Unit!2193)

(assert (=> b!76561 (= lt!34887 (addApplyDifferent!53 lt!34878 lt!34875 (minValue!2146 newMap!16) lt!34872))))

(assert (=> b!76561 (= (apply!77 (+!99 lt!34878 (tuple2!2141 lt!34875 (minValue!2146 newMap!16))) lt!34872) (apply!77 lt!34878 lt!34872))))

(declare-fun lt!34876 () Unit!2193)

(assert (=> b!76561 (= lt!34876 lt!34887)))

(declare-fun lt!34886 () ListLongMap!1429)

(assert (=> b!76561 (= lt!34886 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!34879 () (_ BitVec 64))

(assert (=> b!76561 (= lt!34879 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34884 () (_ BitVec 64))

(assert (=> b!76561 (= lt!34884 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34871 () Unit!2193)

(assert (=> b!76561 (= lt!34871 (addApplyDifferent!53 lt!34886 lt!34879 (zeroValue!2146 newMap!16) lt!34884))))

(assert (=> b!76561 (= (apply!77 (+!99 lt!34886 (tuple2!2141 lt!34879 (zeroValue!2146 newMap!16))) lt!34884) (apply!77 lt!34886 lt!34884))))

(declare-fun lt!34881 () Unit!2193)

(assert (=> b!76561 (= lt!34881 lt!34871)))

(declare-fun lt!34891 () ListLongMap!1429)

(assert (=> b!76561 (= lt!34891 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!34882 () (_ BitVec 64))

(assert (=> b!76561 (= lt!34882 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34892 () (_ BitVec 64))

(assert (=> b!76561 (= lt!34892 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!76561 (= lt!34889 (addApplyDifferent!53 lt!34891 lt!34882 (minValue!2146 newMap!16) lt!34892))))

(assert (=> b!76561 (= (apply!77 (+!99 lt!34891 (tuple2!2141 lt!34882 (minValue!2146 newMap!16))) lt!34892) (apply!77 lt!34891 lt!34892))))

(declare-fun b!76562 () Bool)

(assert (=> b!76562 (= e!49993 e!50001)))

(assert (=> b!76562 (= c!11694 (and (not (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6936 () Bool)

(assert (=> bm!6936 (= call!6938 call!6939)))

(declare-fun d!18219 () Bool)

(assert (=> d!18219 e!49997))

(declare-fun res!40281 () Bool)

(assert (=> d!18219 (=> (not res!40281) (not e!49997))))

(assert (=> d!18219 (= res!40281 (or (bvsge #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))))

(declare-fun lt!34873 () ListLongMap!1429)

(assert (=> d!18219 (= lt!34890 lt!34873)))

(declare-fun lt!34877 () Unit!2193)

(assert (=> d!18219 (= lt!34877 e!49996)))

(declare-fun c!11691 () Bool)

(assert (=> d!18219 (= c!11691 e!50002)))

(declare-fun res!40280 () Bool)

(assert (=> d!18219 (=> (not res!40280) (not e!50002))))

(assert (=> d!18219 (= res!40280 (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(assert (=> d!18219 (= lt!34873 e!49993)))

(assert (=> d!18219 (= c!11693 (and (not (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2100 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18219 (validMask!0 (mask!6230 newMap!16))))

(assert (=> d!18219 (= (getCurrentListMap!426 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)) lt!34890)))

(assert (= (and d!18219 c!11693) b!76552))

(assert (= (and d!18219 (not c!11693)) b!76562))

(assert (= (and b!76562 c!11694) b!76553))

(assert (= (and b!76562 (not c!11694)) b!76546))

(assert (= (and b!76546 c!11696) b!76551))

(assert (= (and b!76546 (not c!11696)) b!76555))

(assert (= (or b!76551 b!76555) bm!6934))

(assert (= (or b!76553 bm!6934) bm!6936))

(assert (= (or b!76553 b!76551) bm!6931))

(assert (= (or b!76552 bm!6936) bm!6933))

(assert (= (or b!76552 bm!6931) bm!6932))

(assert (= (and d!18219 res!40280) b!76557))

(assert (= (and d!18219 c!11691) b!76561))

(assert (= (and d!18219 (not c!11691)) b!76544))

(assert (= (and d!18219 res!40281) b!76549))

(assert (= (and b!76549 res!40282) b!76545))

(assert (= (and b!76549 (not res!40286)) b!76558))

(assert (= (and b!76558 res!40279) b!76548))

(assert (= (and b!76549 res!40278) b!76559))

(assert (= (and b!76559 c!11692) b!76554))

(assert (= (and b!76559 (not c!11692)) b!76542))

(assert (= (and b!76554 res!40283) b!76547))

(assert (= (or b!76554 b!76542) bm!6937))

(assert (= (and b!76559 res!40284) b!76550))

(assert (= (and b!76550 c!11695) b!76560))

(assert (= (and b!76550 (not c!11695)) b!76543))

(assert (= (and b!76560 res!40285) b!76556))

(assert (= (or b!76560 b!76543) bm!6935))

(declare-fun b_lambda!3437 () Bool)

(assert (=> (not b_lambda!3437) (not b!76548)))

(assert (=> b!76548 t!5091))

(declare-fun b_and!4687 () Bool)

(assert (= b_and!4683 (and (=> t!5091 result!2745) b_and!4687)))

(assert (=> b!76548 t!5093))

(declare-fun b_and!4689 () Bool)

(assert (= b_and!4685 (and (=> t!5093 result!2747) b_and!4689)))

(declare-fun m!76475 () Bool)

(assert (=> bm!6935 m!76475))

(declare-fun m!76477 () Bool)

(assert (=> b!76561 m!76477))

(declare-fun m!76479 () Bool)

(assert (=> b!76561 m!76479))

(declare-fun m!76481 () Bool)

(assert (=> b!76561 m!76481))

(declare-fun m!76483 () Bool)

(assert (=> b!76561 m!76483))

(declare-fun m!76485 () Bool)

(assert (=> b!76561 m!76485))

(declare-fun m!76487 () Bool)

(assert (=> b!76561 m!76487))

(declare-fun m!76489 () Bool)

(assert (=> b!76561 m!76489))

(declare-fun m!76491 () Bool)

(assert (=> b!76561 m!76491))

(assert (=> b!76561 m!76321))

(declare-fun m!76493 () Bool)

(assert (=> b!76561 m!76493))

(declare-fun m!76495 () Bool)

(assert (=> b!76561 m!76495))

(assert (=> b!76561 m!76485))

(declare-fun m!76497 () Bool)

(assert (=> b!76561 m!76497))

(assert (=> b!76561 m!76489))

(assert (=> b!76561 m!76497))

(declare-fun m!76499 () Bool)

(assert (=> b!76561 m!76499))

(declare-fun m!76501 () Bool)

(assert (=> b!76561 m!76501))

(assert (=> b!76561 m!76493))

(declare-fun m!76503 () Bool)

(assert (=> b!76561 m!76503))

(declare-fun m!76505 () Bool)

(assert (=> b!76561 m!76505))

(declare-fun m!76507 () Bool)

(assert (=> b!76561 m!76507))

(declare-fun m!76509 () Bool)

(assert (=> b!76556 m!76509))

(declare-fun m!76511 () Bool)

(assert (=> b!76548 m!76511))

(assert (=> b!76548 m!76511))

(assert (=> b!76548 m!76445))

(declare-fun m!76513 () Bool)

(assert (=> b!76548 m!76513))

(assert (=> b!76548 m!76445))

(assert (=> b!76548 m!76321))

(assert (=> b!76548 m!76321))

(declare-fun m!76515 () Bool)

(assert (=> b!76548 m!76515))

(assert (=> b!76545 m!76321))

(assert (=> b!76545 m!76321))

(assert (=> b!76545 m!76329))

(declare-fun m!76517 () Bool)

(assert (=> b!76547 m!76517))

(assert (=> bm!6933 m!76501))

(assert (=> b!76558 m!76321))

(assert (=> b!76558 m!76321))

(declare-fun m!76519 () Bool)

(assert (=> b!76558 m!76519))

(declare-fun m!76521 () Bool)

(assert (=> b!76552 m!76521))

(assert (=> b!76557 m!76321))

(assert (=> b!76557 m!76321))

(assert (=> b!76557 m!76329))

(declare-fun m!76523 () Bool)

(assert (=> bm!6937 m!76523))

(declare-fun m!76525 () Bool)

(assert (=> bm!6932 m!76525))

(assert (=> d!18219 m!76219))

(assert (=> d!18101 d!18219))

(declare-fun d!18221 () Bool)

(assert (=> d!18221 (= (get!1156 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) from!355) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2558 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (=> b!76071 d!18221))

(assert (=> d!18121 d!18125))

(declare-fun d!18223 () Bool)

(assert (=> d!18223 (not (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!18223 true))

(declare-fun _$68!61 () Unit!2193)

(assert (=> d!18223 (= (choose!68 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (Cons!1484 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) Nil!1485)) _$68!61)))

(declare-fun bs!3272 () Bool)

(assert (= bs!3272 d!18223))

(assert (=> bs!3272 m!75825))

(assert (=> bs!3272 m!75839))

(assert (=> d!18121 d!18223))

(declare-fun d!18225 () Bool)

(declare-fun e!50004 () Bool)

(assert (=> d!18225 e!50004))

(declare-fun res!40287 () Bool)

(assert (=> d!18225 (=> res!40287 e!50004)))

(declare-fun lt!34894 () Bool)

(assert (=> d!18225 (= res!40287 (not lt!34894))))

(declare-fun lt!34896 () Bool)

(assert (=> d!18225 (= lt!34894 lt!34896)))

(declare-fun lt!34893 () Unit!2193)

(declare-fun e!50005 () Unit!2193)

(assert (=> d!18225 (= lt!34893 e!50005)))

(declare-fun c!11697 () Bool)

(assert (=> d!18225 (= c!11697 lt!34896)))

(assert (=> d!18225 (= lt!34896 (containsKey!139 (toList!730 lt!34702) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18225 (= (contains!731 lt!34702 #b1000000000000000000000000000000000000000000000000000000000000000) lt!34894)))

(declare-fun b!76563 () Bool)

(declare-fun lt!34895 () Unit!2193)

(assert (=> b!76563 (= e!50005 lt!34895)))

(assert (=> b!76563 (= lt!34895 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 lt!34702) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76563 (isDefined!88 (getValueByKey!135 (toList!730 lt!34702) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76564 () Bool)

(declare-fun Unit!2213 () Unit!2193)

(assert (=> b!76564 (= e!50005 Unit!2213)))

(declare-fun b!76565 () Bool)

(assert (=> b!76565 (= e!50004 (isDefined!88 (getValueByKey!135 (toList!730 lt!34702) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18225 c!11697) b!76563))

(assert (= (and d!18225 (not c!11697)) b!76564))

(assert (= (and d!18225 (not res!40287)) b!76565))

(declare-fun m!76527 () Bool)

(assert (=> d!18225 m!76527))

(declare-fun m!76529 () Bool)

(assert (=> b!76563 m!76529))

(assert (=> b!76563 m!76287))

(assert (=> b!76563 m!76287))

(declare-fun m!76531 () Bool)

(assert (=> b!76563 m!76531))

(assert (=> b!76565 m!76287))

(assert (=> b!76565 m!76287))

(assert (=> b!76565 m!76531))

(assert (=> bm!6898 d!18225))

(declare-fun d!18227 () Bool)

(declare-fun e!50006 () Bool)

(assert (=> d!18227 e!50006))

(declare-fun res!40289 () Bool)

(assert (=> d!18227 (=> (not res!40289) (not e!50006))))

(declare-fun lt!34898 () ListLongMap!1429)

(assert (=> d!18227 (= res!40289 (contains!731 lt!34898 (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(declare-fun lt!34897 () List!1489)

(assert (=> d!18227 (= lt!34898 (ListLongMap!1430 lt!34897))))

(declare-fun lt!34900 () Unit!2193)

(declare-fun lt!34899 () Unit!2193)

(assert (=> d!18227 (= lt!34900 lt!34899)))

(assert (=> d!18227 (= (getValueByKey!135 lt!34897 (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))) (Some!140 (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(assert (=> d!18227 (= lt!34899 (lemmaContainsTupThenGetReturnValue!52 lt!34897 (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(assert (=> d!18227 (= lt!34897 (insertStrictlySorted!55 (toList!730 call!6859) (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(assert (=> d!18227 (= (+!99 call!6859 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) lt!34898)))

(declare-fun b!76566 () Bool)

(declare-fun res!40288 () Bool)

(assert (=> b!76566 (=> (not res!40288) (not e!50006))))

(assert (=> b!76566 (= res!40288 (= (getValueByKey!135 (toList!730 lt!34898) (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))) (Some!140 (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))))))

(declare-fun b!76567 () Bool)

(assert (=> b!76567 (= e!50006 (contains!733 (toList!730 lt!34898) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))))

(assert (= (and d!18227 res!40289) b!76566))

(assert (= (and b!76566 res!40288) b!76567))

(declare-fun m!76533 () Bool)

(assert (=> d!18227 m!76533))

(declare-fun m!76535 () Bool)

(assert (=> d!18227 m!76535))

(declare-fun m!76537 () Bool)

(assert (=> d!18227 m!76537))

(declare-fun m!76539 () Bool)

(assert (=> d!18227 m!76539))

(declare-fun m!76541 () Bool)

(assert (=> b!76566 m!76541))

(declare-fun m!76543 () Bool)

(assert (=> b!76567 m!76543))

(assert (=> b!76181 d!18227))

(declare-fun d!18229 () Bool)

(assert (=> d!18229 (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) lt!34770 #b00000000000000000000000000000000)))

(declare-fun lt!34903 () Unit!2193)

(declare-fun choose!13 (array!3923 (_ BitVec 64) (_ BitVec 32)) Unit!2193)

(assert (=> d!18229 (= lt!34903 (choose!13 (_keys!3905 (v!2559 (underlying!266 thiss!992))) lt!34770 #b00000000000000000000000000000000))))

(assert (=> d!18229 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!18229 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) lt!34770 #b00000000000000000000000000000000) lt!34903)))

(declare-fun bs!3273 () Bool)

(assert (= bs!3273 d!18229))

(assert (=> bs!3273 m!76175))

(declare-fun m!76545 () Bool)

(assert (=> bs!3273 m!76545))

(assert (=> b!76362 d!18229))

(declare-fun d!18231 () Bool)

(declare-fun res!40290 () Bool)

(declare-fun e!50007 () Bool)

(assert (=> d!18231 (=> res!40290 e!50007)))

(assert (=> d!18231 (= res!40290 (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000) lt!34770))))

(assert (=> d!18231 (= (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) lt!34770 #b00000000000000000000000000000000) e!50007)))

(declare-fun b!76568 () Bool)

(declare-fun e!50008 () Bool)

(assert (=> b!76568 (= e!50007 e!50008)))

(declare-fun res!40291 () Bool)

(assert (=> b!76568 (=> (not res!40291) (not e!50008))))

(assert (=> b!76568 (= res!40291 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(declare-fun b!76569 () Bool)

(assert (=> b!76569 (= e!50008 (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) lt!34770 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!18231 (not res!40290)) b!76568))

(assert (= (and b!76568 res!40291) b!76569))

(assert (=> d!18231 m!76163))

(declare-fun m!76547 () Bool)

(assert (=> b!76569 m!76547))

(assert (=> b!76362 d!18231))

(declare-fun b!76582 () Bool)

(declare-fun e!50015 () SeekEntryResult!238)

(declare-fun lt!34910 () SeekEntryResult!238)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3923 (_ BitVec 32)) SeekEntryResult!238)

(assert (=> b!76582 (= e!50015 (seekKeyOrZeroReturnVacant!0 (x!11387 lt!34910) (index!3087 lt!34910) (index!3087 lt!34910) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000) (_keys!3905 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun b!76583 () Bool)

(assert (=> b!76583 (= e!50015 (MissingZero!238 (index!3087 lt!34910)))))

(declare-fun b!76584 () Bool)

(declare-fun e!50016 () SeekEntryResult!238)

(assert (=> b!76584 (= e!50016 (Found!238 (index!3087 lt!34910)))))

(declare-fun d!18233 () Bool)

(declare-fun lt!34911 () SeekEntryResult!238)

(assert (=> d!18233 (and (or ((_ is Undefined!238) lt!34911) (not ((_ is Found!238) lt!34911)) (and (bvsge (index!3086 lt!34911) #b00000000000000000000000000000000) (bvslt (index!3086 lt!34911) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))) (or ((_ is Undefined!238) lt!34911) ((_ is Found!238) lt!34911) (not ((_ is MissingZero!238) lt!34911)) (and (bvsge (index!3085 lt!34911) #b00000000000000000000000000000000) (bvslt (index!3085 lt!34911) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))) (or ((_ is Undefined!238) lt!34911) ((_ is Found!238) lt!34911) ((_ is MissingZero!238) lt!34911) (not ((_ is MissingVacant!238) lt!34911)) (and (bvsge (index!3088 lt!34911) #b00000000000000000000000000000000) (bvslt (index!3088 lt!34911) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))) (or ((_ is Undefined!238) lt!34911) (ite ((_ is Found!238) lt!34911) (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (index!3086 lt!34911)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!238) lt!34911) (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (index!3085 lt!34911)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!238) lt!34911) (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (index!3088 lt!34911)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!50017 () SeekEntryResult!238)

(assert (=> d!18233 (= lt!34911 e!50017)))

(declare-fun c!11705 () Bool)

(assert (=> d!18233 (= c!11705 (and ((_ is Intermediate!238) lt!34910) (undefined!1050 lt!34910)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3923 (_ BitVec 32)) SeekEntryResult!238)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!18233 (= lt!34910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000) (mask!6230 (v!2559 (underlying!266 thiss!992)))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000) (_keys!3905 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992)))))))

(assert (=> d!18233 (validMask!0 (mask!6230 (v!2559 (underlying!266 thiss!992))))))

(assert (=> d!18233 (= (seekEntryOrOpen!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000) (_keys!3905 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992)))) lt!34911)))

(declare-fun b!76585 () Bool)

(assert (=> b!76585 (= e!50017 e!50016)))

(declare-fun lt!34912 () (_ BitVec 64))

(assert (=> b!76585 (= lt!34912 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (index!3087 lt!34910)))))

(declare-fun c!11704 () Bool)

(assert (=> b!76585 (= c!11704 (= lt!34912 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!76586 () Bool)

(assert (=> b!76586 (= e!50017 Undefined!238)))

(declare-fun b!76587 () Bool)

(declare-fun c!11706 () Bool)

(assert (=> b!76587 (= c!11706 (= lt!34912 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76587 (= e!50016 e!50015)))

(assert (= (and d!18233 c!11705) b!76586))

(assert (= (and d!18233 (not c!11705)) b!76585))

(assert (= (and b!76585 c!11704) b!76584))

(assert (= (and b!76585 (not c!11704)) b!76587))

(assert (= (and b!76587 c!11706) b!76583))

(assert (= (and b!76587 (not c!11706)) b!76582))

(assert (=> b!76582 m!76163))

(declare-fun m!76549 () Bool)

(assert (=> b!76582 m!76549))

(declare-fun m!76551 () Bool)

(assert (=> d!18233 m!76551))

(assert (=> d!18233 m!76163))

(declare-fun m!76553 () Bool)

(assert (=> d!18233 m!76553))

(declare-fun m!76555 () Bool)

(assert (=> d!18233 m!76555))

(declare-fun m!76557 () Bool)

(assert (=> d!18233 m!76557))

(assert (=> d!18233 m!76553))

(assert (=> d!18233 m!76163))

(declare-fun m!76559 () Bool)

(assert (=> d!18233 m!76559))

(assert (=> d!18233 m!75847))

(declare-fun m!76561 () Bool)

(assert (=> b!76585 m!76561))

(assert (=> b!76362 d!18233))

(declare-fun d!18235 () Bool)

(declare-fun lt!34913 () Bool)

(assert (=> d!18235 (= lt!34913 (select (content!81 (toList!730 lt!34746)) lt!34509))))

(declare-fun e!50019 () Bool)

(assert (=> d!18235 (= lt!34913 e!50019)))

(declare-fun res!40292 () Bool)

(assert (=> d!18235 (=> (not res!40292) (not e!50019))))

(assert (=> d!18235 (= res!40292 ((_ is Cons!1485) (toList!730 lt!34746)))))

(assert (=> d!18235 (= (contains!733 (toList!730 lt!34746) lt!34509) lt!34913)))

(declare-fun b!76588 () Bool)

(declare-fun e!50018 () Bool)

(assert (=> b!76588 (= e!50019 e!50018)))

(declare-fun res!40293 () Bool)

(assert (=> b!76588 (=> res!40293 e!50018)))

(assert (=> b!76588 (= res!40293 (= (h!2073 (toList!730 lt!34746)) lt!34509))))

(declare-fun b!76589 () Bool)

(assert (=> b!76589 (= e!50018 (contains!733 (t!5083 (toList!730 lt!34746)) lt!34509))))

(assert (= (and d!18235 res!40292) b!76588))

(assert (= (and b!76588 (not res!40293)) b!76589))

(declare-fun m!76563 () Bool)

(assert (=> d!18235 m!76563))

(declare-fun m!76565 () Bool)

(assert (=> d!18235 m!76565))

(declare-fun m!76567 () Bool)

(assert (=> b!76589 m!76567))

(assert (=> b!76319 d!18235))

(declare-fun d!18237 () Bool)

(declare-fun res!40294 () Bool)

(declare-fun e!50020 () Bool)

(assert (=> d!18237 (=> res!40294 e!50020)))

(assert (=> d!18237 (= res!40294 (= (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (=> d!18237 (= (arrayContainsKey!0 (_keys!3905 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b00000000000000000000000000000000) e!50020)))

(declare-fun b!76590 () Bool)

(declare-fun e!50021 () Bool)

(assert (=> b!76590 (= e!50020 e!50021)))

(declare-fun res!40295 () Bool)

(assert (=> b!76590 (=> (not res!40295) (not e!50021))))

(assert (=> b!76590 (= res!40295 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2111 (_keys!3905 newMap!16))))))

(declare-fun b!76591 () Bool)

(assert (=> b!76591 (= e!50021 (arrayContainsKey!0 (_keys!3905 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!18237 (not res!40294)) b!76590))

(assert (= (and b!76590 res!40295) b!76591))

(assert (=> d!18237 m!76321))

(assert (=> b!76591 m!75825))

(declare-fun m!76569 () Bool)

(assert (=> b!76591 m!76569))

(assert (=> bm!6877 d!18237))

(assert (=> bm!6896 d!18109))

(declare-fun d!18239 () Bool)

(declare-fun e!50022 () Bool)

(assert (=> d!18239 e!50022))

(declare-fun res!40296 () Bool)

(assert (=> d!18239 (=> res!40296 e!50022)))

(declare-fun lt!34915 () Bool)

(assert (=> d!18239 (= res!40296 (not lt!34915))))

(declare-fun lt!34917 () Bool)

(assert (=> d!18239 (= lt!34915 lt!34917)))

(declare-fun lt!34914 () Unit!2193)

(declare-fun e!50023 () Unit!2193)

(assert (=> d!18239 (= lt!34914 e!50023)))

(declare-fun c!11707 () Bool)

(assert (=> d!18239 (= c!11707 lt!34917)))

(assert (=> d!18239 (= lt!34917 (containsKey!139 (toList!730 (+!99 lt!34700 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) lt!34686))))

(assert (=> d!18239 (= (contains!731 (+!99 lt!34700 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34686) lt!34915)))

(declare-fun b!76592 () Bool)

(declare-fun lt!34916 () Unit!2193)

(assert (=> b!76592 (= e!50023 lt!34916)))

(assert (=> b!76592 (= lt!34916 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 (+!99 lt!34700 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) lt!34686))))

(assert (=> b!76592 (isDefined!88 (getValueByKey!135 (toList!730 (+!99 lt!34700 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) lt!34686))))

(declare-fun b!76593 () Bool)

(declare-fun Unit!2214 () Unit!2193)

(assert (=> b!76593 (= e!50023 Unit!2214)))

(declare-fun b!76594 () Bool)

(assert (=> b!76594 (= e!50022 (isDefined!88 (getValueByKey!135 (toList!730 (+!99 lt!34700 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) lt!34686)))))

(assert (= (and d!18239 c!11707) b!76592))

(assert (= (and d!18239 (not c!11707)) b!76593))

(assert (= (and d!18239 (not res!40296)) b!76594))

(declare-fun m!76571 () Bool)

(assert (=> d!18239 m!76571))

(declare-fun m!76573 () Bool)

(assert (=> b!76592 m!76573))

(declare-fun m!76575 () Bool)

(assert (=> b!76592 m!76575))

(assert (=> b!76592 m!76575))

(declare-fun m!76577 () Bool)

(assert (=> b!76592 m!76577))

(assert (=> b!76594 m!76575))

(assert (=> b!76594 m!76575))

(assert (=> b!76594 m!76577))

(assert (=> b!76272 d!18239))

(declare-fun d!18241 () Bool)

(assert (=> d!18241 (= (apply!77 (+!99 lt!34698 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34696) (get!1158 (getValueByKey!135 (toList!730 (+!99 lt!34698 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) lt!34696)))))

(declare-fun bs!3274 () Bool)

(assert (= bs!3274 d!18241))

(declare-fun m!76579 () Bool)

(assert (=> bs!3274 m!76579))

(assert (=> bs!3274 m!76579))

(declare-fun m!76581 () Bool)

(assert (=> bs!3274 m!76581))

(assert (=> b!76272 d!18241))

(assert (=> b!76272 d!18109))

(declare-fun d!18243 () Bool)

(assert (=> d!18243 (= (apply!77 (+!99 lt!34698 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34696) (apply!77 lt!34698 lt!34696))))

(declare-fun lt!34920 () Unit!2193)

(declare-fun choose!446 (ListLongMap!1429 (_ BitVec 64) V!2963 (_ BitVec 64)) Unit!2193)

(assert (=> d!18243 (= lt!34920 (choose!446 lt!34698 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) lt!34696))))

(declare-fun e!50026 () Bool)

(assert (=> d!18243 e!50026))

(declare-fun res!40299 () Bool)

(assert (=> d!18243 (=> (not res!40299) (not e!50026))))

(assert (=> d!18243 (= res!40299 (contains!731 lt!34698 lt!34696))))

(assert (=> d!18243 (= (addApplyDifferent!53 lt!34698 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) lt!34696) lt!34920)))

(declare-fun b!76598 () Bool)

(assert (=> b!76598 (= e!50026 (not (= lt!34696 lt!34691)))))

(assert (= (and d!18243 res!40299) b!76598))

(assert (=> d!18243 m!76039))

(declare-fun m!76583 () Bool)

(assert (=> d!18243 m!76583))

(assert (=> d!18243 m!76039))

(assert (=> d!18243 m!76041))

(declare-fun m!76585 () Bool)

(assert (=> d!18243 m!76585))

(assert (=> d!18243 m!76045))

(assert (=> b!76272 d!18243))

(declare-fun d!18245 () Bool)

(assert (=> d!18245 (= (apply!77 (+!99 lt!34703 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34704) (apply!77 lt!34703 lt!34704))))

(declare-fun lt!34921 () Unit!2193)

(assert (=> d!18245 (= lt!34921 (choose!446 lt!34703 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992))) lt!34704))))

(declare-fun e!50027 () Bool)

(assert (=> d!18245 e!50027))

(declare-fun res!40300 () Bool)

(assert (=> d!18245 (=> (not res!40300) (not e!50027))))

(assert (=> d!18245 (= res!40300 (contains!731 lt!34703 lt!34704))))

(assert (=> d!18245 (= (addApplyDifferent!53 lt!34703 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992))) lt!34704) lt!34921)))

(declare-fun b!76599 () Bool)

(assert (=> b!76599 (= e!50027 (not (= lt!34704 lt!34694)))))

(assert (= (and d!18245 res!40300) b!76599))

(assert (=> d!18245 m!76025))

(declare-fun m!76587 () Bool)

(assert (=> d!18245 m!76587))

(assert (=> d!18245 m!76025))

(assert (=> d!18245 m!76027))

(declare-fun m!76589 () Bool)

(assert (=> d!18245 m!76589))

(assert (=> d!18245 m!76019))

(assert (=> b!76272 d!18245))

(declare-fun d!18247 () Bool)

(assert (=> d!18247 (= (apply!77 lt!34690 lt!34684) (get!1158 (getValueByKey!135 (toList!730 lt!34690) lt!34684)))))

(declare-fun bs!3275 () Bool)

(assert (= bs!3275 d!18247))

(declare-fun m!76591 () Bool)

(assert (=> bs!3275 m!76591))

(assert (=> bs!3275 m!76591))

(declare-fun m!76593 () Bool)

(assert (=> bs!3275 m!76593))

(assert (=> b!76272 d!18247))

(declare-fun d!18249 () Bool)

(declare-fun e!50028 () Bool)

(assert (=> d!18249 e!50028))

(declare-fun res!40302 () Bool)

(assert (=> d!18249 (=> (not res!40302) (not e!50028))))

(declare-fun lt!34923 () ListLongMap!1429)

(assert (=> d!18249 (= res!40302 (contains!731 lt!34923 (_1!1081 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(declare-fun lt!34922 () List!1489)

(assert (=> d!18249 (= lt!34923 (ListLongMap!1430 lt!34922))))

(declare-fun lt!34925 () Unit!2193)

(declare-fun lt!34924 () Unit!2193)

(assert (=> d!18249 (= lt!34925 lt!34924)))

(assert (=> d!18249 (= (getValueByKey!135 lt!34922 (_1!1081 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18249 (= lt!34924 (lemmaContainsTupThenGetReturnValue!52 lt!34922 (_1!1081 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18249 (= lt!34922 (insertStrictlySorted!55 (toList!730 lt!34703) (_1!1081 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18249 (= (+!99 lt!34703 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34923)))

(declare-fun b!76600 () Bool)

(declare-fun res!40301 () Bool)

(assert (=> b!76600 (=> (not res!40301) (not e!50028))))

(assert (=> b!76600 (= res!40301 (= (getValueByKey!135 (toList!730 lt!34923) (_1!1081 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992))))))))))

(declare-fun b!76601 () Bool)

(assert (=> b!76601 (= e!50028 (contains!733 (toList!730 lt!34923) (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992))))))))

(assert (= (and d!18249 res!40302) b!76600))

(assert (= (and b!76600 res!40301) b!76601))

(declare-fun m!76595 () Bool)

(assert (=> d!18249 m!76595))

(declare-fun m!76597 () Bool)

(assert (=> d!18249 m!76597))

(declare-fun m!76599 () Bool)

(assert (=> d!18249 m!76599))

(declare-fun m!76601 () Bool)

(assert (=> d!18249 m!76601))

(declare-fun m!76603 () Bool)

(assert (=> b!76600 m!76603))

(declare-fun m!76605 () Bool)

(assert (=> b!76601 m!76605))

(assert (=> b!76272 d!18249))

(declare-fun d!18251 () Bool)

(assert (=> d!18251 (= (apply!77 lt!34698 lt!34696) (get!1158 (getValueByKey!135 (toList!730 lt!34698) lt!34696)))))

(declare-fun bs!3276 () Bool)

(assert (= bs!3276 d!18251))

(declare-fun m!76607 () Bool)

(assert (=> bs!3276 m!76607))

(assert (=> bs!3276 m!76607))

(declare-fun m!76609 () Bool)

(assert (=> bs!3276 m!76609))

(assert (=> b!76272 d!18251))

(declare-fun d!18253 () Bool)

(declare-fun e!50029 () Bool)

(assert (=> d!18253 e!50029))

(declare-fun res!40304 () Bool)

(assert (=> d!18253 (=> (not res!40304) (not e!50029))))

(declare-fun lt!34927 () ListLongMap!1429)

(assert (=> d!18253 (= res!40304 (contains!731 lt!34927 (_1!1081 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(declare-fun lt!34926 () List!1489)

(assert (=> d!18253 (= lt!34927 (ListLongMap!1430 lt!34926))))

(declare-fun lt!34929 () Unit!2193)

(declare-fun lt!34928 () Unit!2193)

(assert (=> d!18253 (= lt!34929 lt!34928)))

(assert (=> d!18253 (= (getValueByKey!135 lt!34926 (_1!1081 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18253 (= lt!34928 (lemmaContainsTupThenGetReturnValue!52 lt!34926 (_1!1081 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18253 (= lt!34926 (insertStrictlySorted!55 (toList!730 lt!34700) (_1!1081 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18253 (= (+!99 lt!34700 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34927)))

(declare-fun b!76602 () Bool)

(declare-fun res!40303 () Bool)

(assert (=> b!76602 (=> (not res!40303) (not e!50029))))

(assert (=> b!76602 (= res!40303 (= (getValueByKey!135 (toList!730 lt!34927) (_1!1081 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))))))))

(declare-fun b!76603 () Bool)

(assert (=> b!76603 (= e!50029 (contains!733 (toList!730 lt!34927) (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))))))

(assert (= (and d!18253 res!40304) b!76602))

(assert (= (and b!76602 res!40303) b!76603))

(declare-fun m!76611 () Bool)

(assert (=> d!18253 m!76611))

(declare-fun m!76613 () Bool)

(assert (=> d!18253 m!76613))

(declare-fun m!76615 () Bool)

(assert (=> d!18253 m!76615))

(declare-fun m!76617 () Bool)

(assert (=> d!18253 m!76617))

(declare-fun m!76619 () Bool)

(assert (=> b!76602 m!76619))

(declare-fun m!76621 () Bool)

(assert (=> b!76603 m!76621))

(assert (=> b!76272 d!18253))

(declare-fun d!18255 () Bool)

(assert (=> d!18255 (= (apply!77 (+!99 lt!34703 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34704) (get!1158 (getValueByKey!135 (toList!730 (+!99 lt!34703 (tuple2!2141 lt!34694 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))) lt!34704)))))

(declare-fun bs!3277 () Bool)

(assert (= bs!3277 d!18255))

(declare-fun m!76623 () Bool)

(assert (=> bs!3277 m!76623))

(assert (=> bs!3277 m!76623))

(declare-fun m!76625 () Bool)

(assert (=> bs!3277 m!76625))

(assert (=> b!76272 d!18255))

(declare-fun d!18257 () Bool)

(assert (=> d!18257 (= (apply!77 (+!99 lt!34690 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34684) (apply!77 lt!34690 lt!34684))))

(declare-fun lt!34930 () Unit!2193)

(assert (=> d!18257 (= lt!34930 (choose!446 lt!34690 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992))) lt!34684))))

(declare-fun e!50030 () Bool)

(assert (=> d!18257 e!50030))

(declare-fun res!40305 () Bool)

(assert (=> d!18257 (=> (not res!40305) (not e!50030))))

(assert (=> d!18257 (= res!40305 (contains!731 lt!34690 lt!34684))))

(assert (=> d!18257 (= (addApplyDifferent!53 lt!34690 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992))) lt!34684) lt!34930)))

(declare-fun b!76604 () Bool)

(assert (=> b!76604 (= e!50030 (not (= lt!34684 lt!34687)))))

(assert (= (and d!18257 res!40305) b!76604))

(assert (=> d!18257 m!76029))

(declare-fun m!76627 () Bool)

(assert (=> d!18257 m!76627))

(assert (=> d!18257 m!76029))

(assert (=> d!18257 m!76031))

(declare-fun m!76629 () Bool)

(assert (=> d!18257 m!76629))

(assert (=> d!18257 m!76021))

(assert (=> b!76272 d!18257))

(declare-fun d!18259 () Bool)

(assert (=> d!18259 (contains!731 (+!99 lt!34700 (tuple2!2141 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34686)))

(declare-fun lt!34933 () Unit!2193)

(declare-fun choose!447 (ListLongMap!1429 (_ BitVec 64) V!2963 (_ BitVec 64)) Unit!2193)

(assert (=> d!18259 (= lt!34933 (choose!447 lt!34700 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) lt!34686))))

(assert (=> d!18259 (contains!731 lt!34700 lt!34686)))

(assert (=> d!18259 (= (addStillContains!53 lt!34700 lt!34695 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) lt!34686) lt!34933)))

(declare-fun bs!3278 () Bool)

(assert (= bs!3278 d!18259))

(assert (=> bs!3278 m!76035))

(assert (=> bs!3278 m!76035))

(assert (=> bs!3278 m!76037))

(declare-fun m!76631 () Bool)

(assert (=> bs!3278 m!76631))

(declare-fun m!76633 () Bool)

(assert (=> bs!3278 m!76633))

(assert (=> b!76272 d!18259))

(declare-fun d!18261 () Bool)

(assert (=> d!18261 (= (apply!77 (+!99 lt!34690 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34684) (get!1158 (getValueByKey!135 (toList!730 (+!99 lt!34690 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))) lt!34684)))))

(declare-fun bs!3279 () Bool)

(assert (= bs!3279 d!18261))

(declare-fun m!76635 () Bool)

(assert (=> bs!3279 m!76635))

(assert (=> bs!3279 m!76635))

(declare-fun m!76637 () Bool)

(assert (=> bs!3279 m!76637))

(assert (=> b!76272 d!18261))

(declare-fun d!18263 () Bool)

(assert (=> d!18263 (= (apply!77 lt!34703 lt!34704) (get!1158 (getValueByKey!135 (toList!730 lt!34703) lt!34704)))))

(declare-fun bs!3280 () Bool)

(assert (= bs!3280 d!18263))

(declare-fun m!76639 () Bool)

(assert (=> bs!3280 m!76639))

(assert (=> bs!3280 m!76639))

(declare-fun m!76641 () Bool)

(assert (=> bs!3280 m!76641))

(assert (=> b!76272 d!18263))

(declare-fun d!18265 () Bool)

(declare-fun e!50031 () Bool)

(assert (=> d!18265 e!50031))

(declare-fun res!40307 () Bool)

(assert (=> d!18265 (=> (not res!40307) (not e!50031))))

(declare-fun lt!34935 () ListLongMap!1429)

(assert (=> d!18265 (= res!40307 (contains!731 lt!34935 (_1!1081 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(declare-fun lt!34934 () List!1489)

(assert (=> d!18265 (= lt!34935 (ListLongMap!1430 lt!34934))))

(declare-fun lt!34937 () Unit!2193)

(declare-fun lt!34936 () Unit!2193)

(assert (=> d!18265 (= lt!34937 lt!34936)))

(assert (=> d!18265 (= (getValueByKey!135 lt!34934 (_1!1081 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18265 (= lt!34936 (lemmaContainsTupThenGetReturnValue!52 lt!34934 (_1!1081 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18265 (= lt!34934 (insertStrictlySorted!55 (toList!730 lt!34698) (_1!1081 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18265 (= (+!99 lt!34698 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34935)))

(declare-fun b!76606 () Bool)

(declare-fun res!40306 () Bool)

(assert (=> b!76606 (=> (not res!40306) (not e!50031))))

(assert (=> b!76606 (= res!40306 (= (getValueByKey!135 (toList!730 lt!34935) (_1!1081 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))))))))

(declare-fun b!76607 () Bool)

(assert (=> b!76607 (= e!50031 (contains!733 (toList!730 lt!34935) (tuple2!2141 lt!34691 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))))))

(assert (= (and d!18265 res!40307) b!76606))

(assert (= (and b!76606 res!40306) b!76607))

(declare-fun m!76643 () Bool)

(assert (=> d!18265 m!76643))

(declare-fun m!76645 () Bool)

(assert (=> d!18265 m!76645))

(declare-fun m!76647 () Bool)

(assert (=> d!18265 m!76647))

(declare-fun m!76649 () Bool)

(assert (=> d!18265 m!76649))

(declare-fun m!76651 () Bool)

(assert (=> b!76606 m!76651))

(declare-fun m!76653 () Bool)

(assert (=> b!76607 m!76653))

(assert (=> b!76272 d!18265))

(declare-fun d!18267 () Bool)

(declare-fun e!50032 () Bool)

(assert (=> d!18267 e!50032))

(declare-fun res!40309 () Bool)

(assert (=> d!18267 (=> (not res!40309) (not e!50032))))

(declare-fun lt!34939 () ListLongMap!1429)

(assert (=> d!18267 (= res!40309 (contains!731 lt!34939 (_1!1081 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(declare-fun lt!34938 () List!1489)

(assert (=> d!18267 (= lt!34939 (ListLongMap!1430 lt!34938))))

(declare-fun lt!34941 () Unit!2193)

(declare-fun lt!34940 () Unit!2193)

(assert (=> d!18267 (= lt!34941 lt!34940)))

(assert (=> d!18267 (= (getValueByKey!135 lt!34938 (_1!1081 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18267 (= lt!34940 (lemmaContainsTupThenGetReturnValue!52 lt!34938 (_1!1081 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18267 (= lt!34938 (insertStrictlySorted!55 (toList!730 lt!34690) (_1!1081 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18267 (= (+!99 lt!34690 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34939)))

(declare-fun b!76608 () Bool)

(declare-fun res!40308 () Bool)

(assert (=> b!76608 (=> (not res!40308) (not e!50032))))

(assert (=> b!76608 (= res!40308 (= (getValueByKey!135 (toList!730 lt!34939) (_1!1081 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992))))))))))

(declare-fun b!76609 () Bool)

(assert (=> b!76609 (= e!50032 (contains!733 (toList!730 lt!34939) (tuple2!2141 lt!34687 (minValue!2146 (v!2559 (underlying!266 thiss!992))))))))

(assert (= (and d!18267 res!40309) b!76608))

(assert (= (and b!76608 res!40308) b!76609))

(declare-fun m!76655 () Bool)

(assert (=> d!18267 m!76655))

(declare-fun m!76657 () Bool)

(assert (=> d!18267 m!76657))

(declare-fun m!76659 () Bool)

(assert (=> d!18267 m!76659))

(declare-fun m!76661 () Bool)

(assert (=> d!18267 m!76661))

(declare-fun m!76663 () Bool)

(assert (=> b!76608 m!76663))

(declare-fun m!76665 () Bool)

(assert (=> b!76609 m!76665))

(assert (=> b!76272 d!18267))

(declare-fun d!18269 () Bool)

(declare-fun c!11708 () Bool)

(assert (=> d!18269 (= c!11708 (and ((_ is Cons!1485) (toList!730 lt!34739)) (= (_1!1081 (h!2073 (toList!730 lt!34739))) (_1!1081 lt!34508))))))

(declare-fun e!50033 () Option!141)

(assert (=> d!18269 (= (getValueByKey!135 (toList!730 lt!34739) (_1!1081 lt!34508)) e!50033)))

(declare-fun b!76611 () Bool)

(declare-fun e!50034 () Option!141)

(assert (=> b!76611 (= e!50033 e!50034)))

(declare-fun c!11709 () Bool)

(assert (=> b!76611 (= c!11709 (and ((_ is Cons!1485) (toList!730 lt!34739)) (not (= (_1!1081 (h!2073 (toList!730 lt!34739))) (_1!1081 lt!34508)))))))

(declare-fun b!76612 () Bool)

(assert (=> b!76612 (= e!50034 (getValueByKey!135 (t!5083 (toList!730 lt!34739)) (_1!1081 lt!34508)))))

(declare-fun b!76610 () Bool)

(assert (=> b!76610 (= e!50033 (Some!140 (_2!1081 (h!2073 (toList!730 lt!34739)))))))

(declare-fun b!76613 () Bool)

(assert (=> b!76613 (= e!50034 None!139)))

(assert (= (and d!18269 c!11708) b!76610))

(assert (= (and d!18269 (not c!11708)) b!76611))

(assert (= (and b!76611 c!11709) b!76612))

(assert (= (and b!76611 (not c!11709)) b!76613))

(declare-fun m!76667 () Bool)

(assert (=> b!76612 m!76667))

(assert (=> b!76316 d!18269))

(assert (=> b!76332 d!18125))

(declare-fun d!18271 () Bool)

(declare-fun res!40310 () Bool)

(declare-fun e!50035 () Bool)

(assert (=> d!18271 (=> (not res!40310) (not e!50035))))

(assert (=> d!18271 (= res!40310 (simpleValid!53 (v!2559 (underlying!266 thiss!992))))))

(assert (=> d!18271 (= (valid!299 (v!2559 (underlying!266 thiss!992))) e!50035)))

(declare-fun b!76614 () Bool)

(declare-fun res!40311 () Bool)

(assert (=> b!76614 (=> (not res!40311) (not e!50035))))

(assert (=> b!76614 (= res!40311 (= (arrayCountValidKeys!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000000 (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))) (_size!403 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun b!76615 () Bool)

(declare-fun res!40312 () Bool)

(assert (=> b!76615 (=> (not res!40312) (not e!50035))))

(assert (=> b!76615 (= res!40312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun b!76616 () Bool)

(assert (=> b!76616 (= e!50035 (arrayNoDuplicates!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000000 Nil!1485))))

(assert (= (and d!18271 res!40310) b!76614))

(assert (= (and b!76614 res!40311) b!76615))

(assert (= (and b!76615 res!40312) b!76616))

(declare-fun m!76669 () Bool)

(assert (=> d!18271 m!76669))

(declare-fun m!76671 () Bool)

(assert (=> b!76614 m!76671))

(assert (=> b!76615 m!75875))

(assert (=> b!76616 m!75817))

(assert (=> d!18105 d!18271))

(declare-fun b!76633 () Bool)

(declare-fun e!50046 () Bool)

(declare-fun call!6945 () Bool)

(assert (=> b!76633 (= e!50046 (not call!6945))))

(declare-fun b!76634 () Bool)

(declare-fun res!40323 () Bool)

(assert (=> b!76634 (=> (not res!40323) (not e!50046))))

(declare-fun call!6946 () Bool)

(assert (=> b!76634 (= res!40323 call!6946)))

(declare-fun e!50047 () Bool)

(assert (=> b!76634 (= e!50047 e!50046)))

(declare-fun c!11715 () Bool)

(declare-fun lt!34947 () SeekEntryResult!238)

(declare-fun bm!6942 () Bool)

(assert (=> bm!6942 (= call!6946 (inRange!0 (ite c!11715 (index!3085 lt!34947) (index!3088 lt!34947)) (mask!6230 newMap!16)))))

(declare-fun bm!6943 () Bool)

(assert (=> bm!6943 (= call!6945 (arrayContainsKey!0 (_keys!3905 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!76635 () Bool)

(declare-fun e!50044 () Bool)

(assert (=> b!76635 (= e!50044 (not call!6945))))

(declare-fun b!76636 () Bool)

(declare-fun e!50045 () Bool)

(assert (=> b!76636 (= e!50045 e!50047)))

(declare-fun c!11714 () Bool)

(assert (=> b!76636 (= c!11714 ((_ is MissingVacant!238) lt!34947))))

(declare-fun b!76637 () Bool)

(declare-fun res!40322 () Bool)

(assert (=> b!76637 (=> (not res!40322) (not e!50046))))

(assert (=> b!76637 (= res!40322 (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3088 lt!34947)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76637 (and (bvsge (index!3088 lt!34947) #b00000000000000000000000000000000) (bvslt (index!3088 lt!34947) (size!2111 (_keys!3905 newMap!16))))))

(declare-fun b!76638 () Bool)

(assert (=> b!76638 (and (bvsge (index!3085 lt!34947) #b00000000000000000000000000000000) (bvslt (index!3085 lt!34947) (size!2111 (_keys!3905 newMap!16))))))

(declare-fun res!40321 () Bool)

(assert (=> b!76638 (= res!40321 (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3085 lt!34947)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76638 (=> (not res!40321) (not e!50044))))

(declare-fun d!18273 () Bool)

(assert (=> d!18273 e!50045))

(assert (=> d!18273 (= c!11715 ((_ is MissingZero!238) lt!34947))))

(assert (=> d!18273 (= lt!34947 (seekEntryOrOpen!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (_keys!3905 newMap!16) (mask!6230 newMap!16)))))

(declare-fun lt!34946 () Unit!2193)

(declare-fun choose!448 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 64) Int) Unit!2193)

(assert (=> d!18273 (= lt!34946 (choose!448 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (defaultEntry!2247 newMap!16)))))

(assert (=> d!18273 (validMask!0 (mask!6230 newMap!16))))

(assert (=> d!18273 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!26 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (defaultEntry!2247 newMap!16)) lt!34946)))

(declare-fun b!76639 () Bool)

(assert (=> b!76639 (= e!50047 ((_ is Undefined!238) lt!34947))))

(declare-fun b!76640 () Bool)

(assert (=> b!76640 (= e!50045 e!50044)))

(declare-fun res!40324 () Bool)

(assert (=> b!76640 (= res!40324 call!6946)))

(assert (=> b!76640 (=> (not res!40324) (not e!50044))))

(assert (= (and d!18273 c!11715) b!76640))

(assert (= (and d!18273 (not c!11715)) b!76636))

(assert (= (and b!76640 res!40324) b!76638))

(assert (= (and b!76638 res!40321) b!76635))

(assert (= (and b!76636 c!11714) b!76634))

(assert (= (and b!76636 (not c!11714)) b!76639))

(assert (= (and b!76634 res!40323) b!76637))

(assert (= (and b!76637 res!40322) b!76633))

(assert (= (or b!76640 b!76634) bm!6942))

(assert (= (or b!76635 b!76633) bm!6943))

(declare-fun m!76673 () Bool)

(assert (=> b!76638 m!76673))

(assert (=> bm!6943 m!75825))

(assert (=> bm!6943 m!75999))

(assert (=> d!18273 m!75825))

(assert (=> d!18273 m!75973))

(assert (=> d!18273 m!75825))

(declare-fun m!76675 () Bool)

(assert (=> d!18273 m!76675))

(assert (=> d!18273 m!76219))

(declare-fun m!76677 () Bool)

(assert (=> bm!6942 m!76677))

(declare-fun m!76679 () Bool)

(assert (=> b!76637 m!76679))

(assert (=> bm!6867 d!18273))

(declare-fun d!18275 () Bool)

(declare-fun e!50048 () Bool)

(assert (=> d!18275 e!50048))

(declare-fun res!40325 () Bool)

(assert (=> d!18275 (=> res!40325 e!50048)))

(declare-fun lt!34949 () Bool)

(assert (=> d!18275 (= res!40325 (not lt!34949))))

(declare-fun lt!34951 () Bool)

(assert (=> d!18275 (= lt!34949 lt!34951)))

(declare-fun lt!34948 () Unit!2193)

(declare-fun e!50049 () Unit!2193)

(assert (=> d!18275 (= lt!34948 e!50049)))

(declare-fun c!11716 () Bool)

(assert (=> d!18275 (= c!11716 lt!34951)))

(assert (=> d!18275 (= lt!34951 (containsKey!139 (toList!730 call!6880) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (=> d!18275 (= (contains!731 call!6880 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) lt!34949)))

(declare-fun b!76641 () Bool)

(declare-fun lt!34950 () Unit!2193)

(assert (=> b!76641 (= e!50049 lt!34950)))

(assert (=> b!76641 (= lt!34950 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 call!6880) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (=> b!76641 (isDefined!88 (getValueByKey!135 (toList!730 call!6880) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun b!76642 () Bool)

(declare-fun Unit!2215 () Unit!2193)

(assert (=> b!76642 (= e!50049 Unit!2215)))

(declare-fun b!76643 () Bool)

(assert (=> b!76643 (= e!50048 (isDefined!88 (getValueByKey!135 (toList!730 call!6880) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355))))))

(assert (= (and d!18275 c!11716) b!76641))

(assert (= (and d!18275 (not c!11716)) b!76642))

(assert (= (and d!18275 (not res!40325)) b!76643))

(assert (=> d!18275 m!75825))

(declare-fun m!76681 () Bool)

(assert (=> d!18275 m!76681))

(assert (=> b!76641 m!75825))

(declare-fun m!76683 () Bool)

(assert (=> b!76641 m!76683))

(assert (=> b!76641 m!75825))

(declare-fun m!76685 () Bool)

(assert (=> b!76641 m!76685))

(assert (=> b!76641 m!76685))

(declare-fun m!76687 () Bool)

(assert (=> b!76641 m!76687))

(assert (=> b!76643 m!75825))

(assert (=> b!76643 m!76685))

(assert (=> b!76643 m!76685))

(assert (=> b!76643 m!76687))

(assert (=> b!76174 d!18275))

(declare-fun d!18277 () Bool)

(declare-fun e!50050 () Bool)

(assert (=> d!18277 e!50050))

(declare-fun res!40326 () Bool)

(assert (=> d!18277 (=> res!40326 e!50050)))

(declare-fun lt!34953 () Bool)

(assert (=> d!18277 (= res!40326 (not lt!34953))))

(declare-fun lt!34955 () Bool)

(assert (=> d!18277 (= lt!34953 lt!34955)))

(declare-fun lt!34952 () Unit!2193)

(declare-fun e!50051 () Unit!2193)

(assert (=> d!18277 (= lt!34952 e!50051)))

(declare-fun c!11717 () Bool)

(assert (=> d!18277 (= c!11717 lt!34955)))

(assert (=> d!18277 (= lt!34955 (containsKey!139 (toList!730 lt!34746) (_1!1081 lt!34509)))))

(assert (=> d!18277 (= (contains!731 lt!34746 (_1!1081 lt!34509)) lt!34953)))

(declare-fun b!76644 () Bool)

(declare-fun lt!34954 () Unit!2193)

(assert (=> b!76644 (= e!50051 lt!34954)))

(assert (=> b!76644 (= lt!34954 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 lt!34746) (_1!1081 lt!34509)))))

(assert (=> b!76644 (isDefined!88 (getValueByKey!135 (toList!730 lt!34746) (_1!1081 lt!34509)))))

(declare-fun b!76645 () Bool)

(declare-fun Unit!2216 () Unit!2193)

(assert (=> b!76645 (= e!50051 Unit!2216)))

(declare-fun b!76646 () Bool)

(assert (=> b!76646 (= e!50050 (isDefined!88 (getValueByKey!135 (toList!730 lt!34746) (_1!1081 lt!34509))))))

(assert (= (and d!18277 c!11717) b!76644))

(assert (= (and d!18277 (not c!11717)) b!76645))

(assert (= (and d!18277 (not res!40326)) b!76646))

(declare-fun m!76689 () Bool)

(assert (=> d!18277 m!76689))

(declare-fun m!76691 () Bool)

(assert (=> b!76644 m!76691))

(assert (=> b!76644 m!76133))

(assert (=> b!76644 m!76133))

(declare-fun m!76693 () Bool)

(assert (=> b!76644 m!76693))

(assert (=> b!76646 m!76133))

(assert (=> b!76646 m!76133))

(assert (=> b!76646 m!76693))

(assert (=> d!18115 d!18277))

(declare-fun d!18279 () Bool)

(declare-fun c!11718 () Bool)

(assert (=> d!18279 (= c!11718 (and ((_ is Cons!1485) lt!34745) (= (_1!1081 (h!2073 lt!34745)) (_1!1081 lt!34509))))))

(declare-fun e!50052 () Option!141)

(assert (=> d!18279 (= (getValueByKey!135 lt!34745 (_1!1081 lt!34509)) e!50052)))

(declare-fun b!76648 () Bool)

(declare-fun e!50053 () Option!141)

(assert (=> b!76648 (= e!50052 e!50053)))

(declare-fun c!11719 () Bool)

(assert (=> b!76648 (= c!11719 (and ((_ is Cons!1485) lt!34745) (not (= (_1!1081 (h!2073 lt!34745)) (_1!1081 lt!34509)))))))

(declare-fun b!76649 () Bool)

(assert (=> b!76649 (= e!50053 (getValueByKey!135 (t!5083 lt!34745) (_1!1081 lt!34509)))))

(declare-fun b!76647 () Bool)

(assert (=> b!76647 (= e!50052 (Some!140 (_2!1081 (h!2073 lt!34745))))))

(declare-fun b!76650 () Bool)

(assert (=> b!76650 (= e!50053 None!139)))

(assert (= (and d!18279 c!11718) b!76647))

(assert (= (and d!18279 (not c!11718)) b!76648))

(assert (= (and b!76648 c!11719) b!76649))

(assert (= (and b!76648 (not c!11719)) b!76650))

(declare-fun m!76695 () Bool)

(assert (=> b!76649 m!76695))

(assert (=> d!18115 d!18279))

(declare-fun d!18281 () Bool)

(assert (=> d!18281 (= (getValueByKey!135 lt!34745 (_1!1081 lt!34509)) (Some!140 (_2!1081 lt!34509)))))

(declare-fun lt!34956 () Unit!2193)

(assert (=> d!18281 (= lt!34956 (choose!440 lt!34745 (_1!1081 lt!34509) (_2!1081 lt!34509)))))

(declare-fun e!50054 () Bool)

(assert (=> d!18281 e!50054))

(declare-fun res!40327 () Bool)

(assert (=> d!18281 (=> (not res!40327) (not e!50054))))

(assert (=> d!18281 (= res!40327 (isStrictlySorted!294 lt!34745))))

(assert (=> d!18281 (= (lemmaContainsTupThenGetReturnValue!52 lt!34745 (_1!1081 lt!34509) (_2!1081 lt!34509)) lt!34956)))

(declare-fun b!76651 () Bool)

(declare-fun res!40328 () Bool)

(assert (=> b!76651 (=> (not res!40328) (not e!50054))))

(assert (=> b!76651 (= res!40328 (containsKey!139 lt!34745 (_1!1081 lt!34509)))))

(declare-fun b!76652 () Bool)

(assert (=> b!76652 (= e!50054 (contains!733 lt!34745 (tuple2!2141 (_1!1081 lt!34509) (_2!1081 lt!34509))))))

(assert (= (and d!18281 res!40327) b!76651))

(assert (= (and b!76651 res!40328) b!76652))

(assert (=> d!18281 m!76127))

(declare-fun m!76697 () Bool)

(assert (=> d!18281 m!76697))

(declare-fun m!76699 () Bool)

(assert (=> d!18281 m!76699))

(declare-fun m!76701 () Bool)

(assert (=> b!76651 m!76701))

(declare-fun m!76703 () Bool)

(assert (=> b!76652 m!76703))

(assert (=> d!18115 d!18281))

(declare-fun b!76653 () Bool)

(declare-fun e!50057 () List!1489)

(declare-fun call!6947 () List!1489)

(assert (=> b!76653 (= e!50057 call!6947)))

(declare-fun b!76654 () Bool)

(declare-fun c!11723 () Bool)

(assert (=> b!76654 (= c!11723 (and ((_ is Cons!1485) (toList!730 (+!99 lt!34498 lt!34508))) (bvsgt (_1!1081 (h!2073 (toList!730 (+!99 lt!34498 lt!34508)))) (_1!1081 lt!34509))))))

(declare-fun e!50058 () List!1489)

(assert (=> b!76654 (= e!50058 e!50057)))

(declare-fun call!6949 () List!1489)

(declare-fun c!11720 () Bool)

(declare-fun e!50059 () List!1489)

(declare-fun bm!6944 () Bool)

(assert (=> bm!6944 (= call!6949 ($colon$colon!68 e!50059 (ite c!11720 (h!2073 (toList!730 (+!99 lt!34498 lt!34508))) (tuple2!2141 (_1!1081 lt!34509) (_2!1081 lt!34509)))))))

(declare-fun c!11722 () Bool)

(assert (=> bm!6944 (= c!11722 c!11720)))

(declare-fun b!76655 () Bool)

(assert (=> b!76655 (= e!50059 (insertStrictlySorted!55 (t!5083 (toList!730 (+!99 lt!34498 lt!34508))) (_1!1081 lt!34509) (_2!1081 lt!34509)))))

(declare-fun bm!6945 () Bool)

(declare-fun call!6948 () List!1489)

(assert (=> bm!6945 (= call!6948 call!6949)))

(declare-fun bm!6946 () Bool)

(assert (=> bm!6946 (= call!6947 call!6948)))

(declare-fun b!76657 () Bool)

(declare-fun e!50056 () List!1489)

(assert (=> b!76657 (= e!50056 e!50058)))

(declare-fun c!11721 () Bool)

(assert (=> b!76657 (= c!11721 (and ((_ is Cons!1485) (toList!730 (+!99 lt!34498 lt!34508))) (= (_1!1081 (h!2073 (toList!730 (+!99 lt!34498 lt!34508)))) (_1!1081 lt!34509))))))

(declare-fun b!76658 () Bool)

(assert (=> b!76658 (= e!50057 call!6947)))

(declare-fun b!76659 () Bool)

(assert (=> b!76659 (= e!50056 call!6949)))

(declare-fun b!76660 () Bool)

(assert (=> b!76660 (= e!50058 call!6948)))

(declare-fun b!76656 () Bool)

(declare-fun e!50055 () Bool)

(declare-fun lt!34957 () List!1489)

(assert (=> b!76656 (= e!50055 (contains!733 lt!34957 (tuple2!2141 (_1!1081 lt!34509) (_2!1081 lt!34509))))))

(declare-fun d!18283 () Bool)

(assert (=> d!18283 e!50055))

(declare-fun res!40330 () Bool)

(assert (=> d!18283 (=> (not res!40330) (not e!50055))))

(assert (=> d!18283 (= res!40330 (isStrictlySorted!294 lt!34957))))

(assert (=> d!18283 (= lt!34957 e!50056)))

(assert (=> d!18283 (= c!11720 (and ((_ is Cons!1485) (toList!730 (+!99 lt!34498 lt!34508))) (bvslt (_1!1081 (h!2073 (toList!730 (+!99 lt!34498 lt!34508)))) (_1!1081 lt!34509))))))

(assert (=> d!18283 (isStrictlySorted!294 (toList!730 (+!99 lt!34498 lt!34508)))))

(assert (=> d!18283 (= (insertStrictlySorted!55 (toList!730 (+!99 lt!34498 lt!34508)) (_1!1081 lt!34509) (_2!1081 lt!34509)) lt!34957)))

(declare-fun b!76661 () Bool)

(assert (=> b!76661 (= e!50059 (ite c!11721 (t!5083 (toList!730 (+!99 lt!34498 lt!34508))) (ite c!11723 (Cons!1485 (h!2073 (toList!730 (+!99 lt!34498 lt!34508))) (t!5083 (toList!730 (+!99 lt!34498 lt!34508)))) Nil!1486)))))

(declare-fun b!76662 () Bool)

(declare-fun res!40329 () Bool)

(assert (=> b!76662 (=> (not res!40329) (not e!50055))))

(assert (=> b!76662 (= res!40329 (containsKey!139 lt!34957 (_1!1081 lt!34509)))))

(assert (= (and d!18283 c!11720) b!76659))

(assert (= (and d!18283 (not c!11720)) b!76657))

(assert (= (and b!76657 c!11721) b!76660))

(assert (= (and b!76657 (not c!11721)) b!76654))

(assert (= (and b!76654 c!11723) b!76658))

(assert (= (and b!76654 (not c!11723)) b!76653))

(assert (= (or b!76658 b!76653) bm!6946))

(assert (= (or b!76660 bm!6946) bm!6945))

(assert (= (or b!76659 bm!6945) bm!6944))

(assert (= (and bm!6944 c!11722) b!76655))

(assert (= (and bm!6944 (not c!11722)) b!76661))

(assert (= (and d!18283 res!40330) b!76662))

(assert (= (and b!76662 res!40329) b!76656))

(declare-fun m!76705 () Bool)

(assert (=> b!76655 m!76705))

(declare-fun m!76707 () Bool)

(assert (=> b!76656 m!76707))

(declare-fun m!76709 () Bool)

(assert (=> d!18283 m!76709))

(declare-fun m!76711 () Bool)

(assert (=> d!18283 m!76711))

(declare-fun m!76713 () Bool)

(assert (=> bm!6944 m!76713))

(declare-fun m!76715 () Bool)

(assert (=> b!76662 m!76715))

(assert (=> d!18115 d!18283))

(assert (=> b!76310 d!18155))

(declare-fun d!18285 () Bool)

(declare-fun c!11724 () Bool)

(assert (=> d!18285 (= c!11724 (and ((_ is Cons!1485) (toList!730 lt!34714)) (= (_1!1081 (h!2073 (toList!730 lt!34714))) (_1!1081 lt!34509))))))

(declare-fun e!50060 () Option!141)

(assert (=> d!18285 (= (getValueByKey!135 (toList!730 lt!34714) (_1!1081 lt!34509)) e!50060)))

(declare-fun b!76664 () Bool)

(declare-fun e!50061 () Option!141)

(assert (=> b!76664 (= e!50060 e!50061)))

(declare-fun c!11725 () Bool)

(assert (=> b!76664 (= c!11725 (and ((_ is Cons!1485) (toList!730 lt!34714)) (not (= (_1!1081 (h!2073 (toList!730 lt!34714))) (_1!1081 lt!34509)))))))

(declare-fun b!76665 () Bool)

(assert (=> b!76665 (= e!50061 (getValueByKey!135 (t!5083 (toList!730 lt!34714)) (_1!1081 lt!34509)))))

(declare-fun b!76663 () Bool)

(assert (=> b!76663 (= e!50060 (Some!140 (_2!1081 (h!2073 (toList!730 lt!34714)))))))

(declare-fun b!76666 () Bool)

(assert (=> b!76666 (= e!50061 None!139)))

(assert (= (and d!18285 c!11724) b!76663))

(assert (= (and d!18285 (not c!11724)) b!76664))

(assert (= (and b!76664 c!11725) b!76665))

(assert (= (and b!76664 (not c!11725)) b!76666))

(declare-fun m!76717 () Bool)

(assert (=> b!76665 m!76717))

(assert (=> b!76278 d!18285))

(assert (=> b!76312 d!18177))

(declare-fun d!18287 () Bool)

(declare-fun e!50062 () Bool)

(assert (=> d!18287 e!50062))

(declare-fun res!40331 () Bool)

(assert (=> d!18287 (=> res!40331 e!50062)))

(declare-fun lt!34959 () Bool)

(assert (=> d!18287 (= res!40331 (not lt!34959))))

(declare-fun lt!34961 () Bool)

(assert (=> d!18287 (= lt!34959 lt!34961)))

(declare-fun lt!34958 () Unit!2193)

(declare-fun e!50063 () Unit!2193)

(assert (=> d!18287 (= lt!34958 e!50063)))

(declare-fun c!11726 () Bool)

(assert (=> d!18287 (= c!11726 lt!34961)))

(assert (=> d!18287 (= lt!34961 (containsKey!139 (toList!730 (+!99 lt!34732 (tuple2!2141 lt!34734 lt!34735))) lt!34736))))

(assert (=> d!18287 (= (contains!731 (+!99 lt!34732 (tuple2!2141 lt!34734 lt!34735)) lt!34736) lt!34959)))

(declare-fun b!76667 () Bool)

(declare-fun lt!34960 () Unit!2193)

(assert (=> b!76667 (= e!50063 lt!34960)))

(assert (=> b!76667 (= lt!34960 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 (+!99 lt!34732 (tuple2!2141 lt!34734 lt!34735))) lt!34736))))

(assert (=> b!76667 (isDefined!88 (getValueByKey!135 (toList!730 (+!99 lt!34732 (tuple2!2141 lt!34734 lt!34735))) lt!34736))))

(declare-fun b!76668 () Bool)

(declare-fun Unit!2217 () Unit!2193)

(assert (=> b!76668 (= e!50063 Unit!2217)))

(declare-fun b!76669 () Bool)

(assert (=> b!76669 (= e!50062 (isDefined!88 (getValueByKey!135 (toList!730 (+!99 lt!34732 (tuple2!2141 lt!34734 lt!34735))) lt!34736)))))

(assert (= (and d!18287 c!11726) b!76667))

(assert (= (and d!18287 (not c!11726)) b!76668))

(assert (= (and d!18287 (not res!40331)) b!76669))

(declare-fun m!76719 () Bool)

(assert (=> d!18287 m!76719))

(declare-fun m!76721 () Bool)

(assert (=> b!76667 m!76721))

(declare-fun m!76723 () Bool)

(assert (=> b!76667 m!76723))

(assert (=> b!76667 m!76723))

(declare-fun m!76725 () Bool)

(assert (=> b!76667 m!76725))

(assert (=> b!76669 m!76723))

(assert (=> b!76669 m!76723))

(assert (=> b!76669 m!76725))

(assert (=> b!76312 d!18287))

(declare-fun d!18289 () Bool)

(declare-fun e!50064 () Bool)

(assert (=> d!18289 e!50064))

(declare-fun res!40333 () Bool)

(assert (=> d!18289 (=> (not res!40333) (not e!50064))))

(declare-fun lt!34963 () ListLongMap!1429)

(assert (=> d!18289 (= res!40333 (contains!731 lt!34963 (_1!1081 (tuple2!2141 lt!34734 lt!34735))))))

(declare-fun lt!34962 () List!1489)

(assert (=> d!18289 (= lt!34963 (ListLongMap!1430 lt!34962))))

(declare-fun lt!34965 () Unit!2193)

(declare-fun lt!34964 () Unit!2193)

(assert (=> d!18289 (= lt!34965 lt!34964)))

(assert (=> d!18289 (= (getValueByKey!135 lt!34962 (_1!1081 (tuple2!2141 lt!34734 lt!34735))) (Some!140 (_2!1081 (tuple2!2141 lt!34734 lt!34735))))))

(assert (=> d!18289 (= lt!34964 (lemmaContainsTupThenGetReturnValue!52 lt!34962 (_1!1081 (tuple2!2141 lt!34734 lt!34735)) (_2!1081 (tuple2!2141 lt!34734 lt!34735))))))

(assert (=> d!18289 (= lt!34962 (insertStrictlySorted!55 (toList!730 lt!34732) (_1!1081 (tuple2!2141 lt!34734 lt!34735)) (_2!1081 (tuple2!2141 lt!34734 lt!34735))))))

(assert (=> d!18289 (= (+!99 lt!34732 (tuple2!2141 lt!34734 lt!34735)) lt!34963)))

(declare-fun b!76670 () Bool)

(declare-fun res!40332 () Bool)

(assert (=> b!76670 (=> (not res!40332) (not e!50064))))

(assert (=> b!76670 (= res!40332 (= (getValueByKey!135 (toList!730 lt!34963) (_1!1081 (tuple2!2141 lt!34734 lt!34735))) (Some!140 (_2!1081 (tuple2!2141 lt!34734 lt!34735)))))))

(declare-fun b!76671 () Bool)

(assert (=> b!76671 (= e!50064 (contains!733 (toList!730 lt!34963) (tuple2!2141 lt!34734 lt!34735)))))

(assert (= (and d!18289 res!40333) b!76670))

(assert (= (and b!76670 res!40332) b!76671))

(declare-fun m!76727 () Bool)

(assert (=> d!18289 m!76727))

(declare-fun m!76729 () Bool)

(assert (=> d!18289 m!76729))

(declare-fun m!76731 () Bool)

(assert (=> d!18289 m!76731))

(declare-fun m!76733 () Bool)

(assert (=> d!18289 m!76733))

(declare-fun m!76735 () Bool)

(assert (=> b!76670 m!76735))

(declare-fun m!76737 () Bool)

(assert (=> b!76671 m!76737))

(assert (=> b!76312 d!18289))

(declare-fun d!18291 () Bool)

(declare-fun e!50065 () Bool)

(assert (=> d!18291 e!50065))

(declare-fun res!40335 () Bool)

(assert (=> d!18291 (=> (not res!40335) (not e!50065))))

(declare-fun lt!34967 () ListLongMap!1429)

(assert (=> d!18291 (= res!40335 (contains!731 lt!34967 (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!34966 () List!1489)

(assert (=> d!18291 (= lt!34967 (ListLongMap!1430 lt!34966))))

(declare-fun lt!34969 () Unit!2193)

(declare-fun lt!34968 () Unit!2193)

(assert (=> d!18291 (= lt!34969 lt!34968)))

(assert (=> d!18291 (= (getValueByKey!135 lt!34966 (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!140 (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18291 (= lt!34968 (lemmaContainsTupThenGetReturnValue!52 lt!34966 (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18291 (= lt!34966 (insertStrictlySorted!55 (toList!730 call!6906) (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18291 (= (+!99 call!6906 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!34967)))

(declare-fun b!76672 () Bool)

(declare-fun res!40334 () Bool)

(assert (=> b!76672 (=> (not res!40334) (not e!50065))))

(assert (=> b!76672 (= res!40334 (= (getValueByKey!135 (toList!730 lt!34967) (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!140 (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!76673 () Bool)

(assert (=> b!76673 (= e!50065 (contains!733 (toList!730 lt!34967) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1154 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!18291 res!40335) b!76672))

(assert (= (and b!76672 res!40334) b!76673))

(declare-fun m!76739 () Bool)

(assert (=> d!18291 m!76739))

(declare-fun m!76741 () Bool)

(assert (=> d!18291 m!76741))

(declare-fun m!76743 () Bool)

(assert (=> d!18291 m!76743))

(declare-fun m!76745 () Bool)

(assert (=> d!18291 m!76745))

(declare-fun m!76747 () Bool)

(assert (=> b!76672 m!76747))

(declare-fun m!76749 () Bool)

(assert (=> b!76673 m!76749))

(assert (=> b!76312 d!18291))

(declare-fun d!18293 () Bool)

(assert (=> d!18293 (not (contains!731 (+!99 lt!34732 (tuple2!2141 lt!34734 lt!34735)) lt!34736))))

(declare-fun lt!34972 () Unit!2193)

(declare-fun choose!449 (ListLongMap!1429 (_ BitVec 64) V!2963 (_ BitVec 64)) Unit!2193)

(assert (=> d!18293 (= lt!34972 (choose!449 lt!34732 lt!34734 lt!34735 lt!34736))))

(declare-fun e!50068 () Bool)

(assert (=> d!18293 e!50068))

(declare-fun res!40338 () Bool)

(assert (=> d!18293 (=> (not res!40338) (not e!50068))))

(assert (=> d!18293 (= res!40338 (not (contains!731 lt!34732 lt!34736)))))

(assert (=> d!18293 (= (addStillNotContains!26 lt!34732 lt!34734 lt!34735 lt!34736) lt!34972)))

(declare-fun b!76677 () Bool)

(assert (=> b!76677 (= e!50068 (not (= lt!34734 lt!34736)))))

(assert (= (and d!18293 res!40338) b!76677))

(assert (=> d!18293 m!76089))

(assert (=> d!18293 m!76089))

(assert (=> d!18293 m!76091))

(declare-fun m!76751 () Bool)

(assert (=> d!18293 m!76751))

(declare-fun m!76753 () Bool)

(assert (=> d!18293 m!76753))

(assert (=> b!76312 d!18293))

(assert (=> d!18123 d!18129))

(declare-fun d!18295 () Bool)

(assert (=> d!18295 (arrayNoDuplicates!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) from!355 Nil!1485)))

(assert (=> d!18295 true))

(declare-fun _$71!102 () Unit!2193)

(assert (=> d!18295 (= (choose!39 (_keys!3905 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!102)))

(declare-fun bs!3281 () Bool)

(assert (= bs!3281 d!18295))

(assert (=> bs!3281 m!75835))

(assert (=> d!18123 d!18295))

(assert (=> b!76268 d!18185))

(declare-fun d!18297 () Bool)

(declare-fun isEmpty!324 (List!1489) Bool)

(assert (=> d!18297 (= (isEmpty!322 lt!34731) (isEmpty!324 (toList!730 lt!34731)))))

(declare-fun bs!3282 () Bool)

(assert (= bs!3282 d!18297))

(declare-fun m!76755 () Bool)

(assert (=> bs!3282 m!76755))

(assert (=> b!76308 d!18297))

(declare-fun b!76678 () Bool)

(declare-fun e!50072 () Bool)

(declare-fun e!50071 () Bool)

(assert (=> b!76678 (= e!50072 e!50071)))

(declare-fun res!40341 () Bool)

(assert (=> b!76678 (=> (not res!40341) (not e!50071))))

(declare-fun e!50070 () Bool)

(assert (=> b!76678 (= res!40341 (not e!50070))))

(declare-fun res!40339 () Bool)

(assert (=> b!76678 (=> (not res!40339) (not e!50070))))

(assert (=> b!76678 (= res!40339 (validKeyInArray!0 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76679 () Bool)

(declare-fun e!50069 () Bool)

(declare-fun call!6950 () Bool)

(assert (=> b!76679 (= e!50069 call!6950)))

(declare-fun b!76680 () Bool)

(assert (=> b!76680 (= e!50071 e!50069)))

(declare-fun c!11727 () Bool)

(assert (=> b!76680 (= c!11727 (validKeyInArray!0 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6947 () Bool)

(assert (=> bm!6947 (= call!6950 (arrayNoDuplicates!0 (_keys!3905 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11727 (Cons!1484 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000) Nil!1485) Nil!1485)))))

(declare-fun b!76681 () Bool)

(assert (=> b!76681 (= e!50069 call!6950)))

(declare-fun d!18299 () Bool)

(declare-fun res!40340 () Bool)

(assert (=> d!18299 (=> res!40340 e!50072)))

(assert (=> d!18299 (= res!40340 (bvsge #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(assert (=> d!18299 (= (arrayNoDuplicates!0 (_keys!3905 newMap!16) #b00000000000000000000000000000000 Nil!1485) e!50072)))

(declare-fun b!76682 () Bool)

(assert (=> b!76682 (= e!50070 (contains!734 Nil!1485 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!18299 (not res!40340)) b!76678))

(assert (= (and b!76678 res!40339) b!76682))

(assert (= (and b!76678 res!40341) b!76680))

(assert (= (and b!76680 c!11727) b!76681))

(assert (= (and b!76680 (not c!11727)) b!76679))

(assert (= (or b!76681 b!76679) bm!6947))

(assert (=> b!76678 m!76321))

(assert (=> b!76678 m!76321))

(assert (=> b!76678 m!76329))

(assert (=> b!76680 m!76321))

(assert (=> b!76680 m!76321))

(assert (=> b!76680 m!76329))

(assert (=> bm!6947 m!76321))

(declare-fun m!76757 () Bool)

(assert (=> bm!6947 m!76757))

(assert (=> b!76682 m!76321))

(assert (=> b!76682 m!76321))

(declare-fun m!76759 () Bool)

(assert (=> b!76682 m!76759))

(assert (=> b!76081 d!18299))

(assert (=> d!18103 d!18117))

(declare-fun d!18301 () Bool)

(declare-fun e!50073 () Bool)

(assert (=> d!18301 e!50073))

(declare-fun res!40342 () Bool)

(assert (=> d!18301 (=> res!40342 e!50073)))

(declare-fun lt!34974 () Bool)

(assert (=> d!18301 (= res!40342 (not lt!34974))))

(declare-fun lt!34976 () Bool)

(assert (=> d!18301 (= lt!34974 lt!34976)))

(declare-fun lt!34973 () Unit!2193)

(declare-fun e!50074 () Unit!2193)

(assert (=> d!18301 (= lt!34973 e!50074)))

(declare-fun c!11728 () Bool)

(assert (=> d!18301 (= c!11728 lt!34976)))

(assert (=> d!18301 (= lt!34976 (containsKey!139 (toList!730 lt!34739) (_1!1081 lt!34508)))))

(assert (=> d!18301 (= (contains!731 lt!34739 (_1!1081 lt!34508)) lt!34974)))

(declare-fun b!76683 () Bool)

(declare-fun lt!34975 () Unit!2193)

(assert (=> b!76683 (= e!50074 lt!34975)))

(assert (=> b!76683 (= lt!34975 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 lt!34739) (_1!1081 lt!34508)))))

(assert (=> b!76683 (isDefined!88 (getValueByKey!135 (toList!730 lt!34739) (_1!1081 lt!34508)))))

(declare-fun b!76684 () Bool)

(declare-fun Unit!2218 () Unit!2193)

(assert (=> b!76684 (= e!50074 Unit!2218)))

(declare-fun b!76685 () Bool)

(assert (=> b!76685 (= e!50073 (isDefined!88 (getValueByKey!135 (toList!730 lt!34739) (_1!1081 lt!34508))))))

(assert (= (and d!18301 c!11728) b!76683))

(assert (= (and d!18301 (not c!11728)) b!76684))

(assert (= (and d!18301 (not res!40342)) b!76685))

(declare-fun m!76761 () Bool)

(assert (=> d!18301 m!76761))

(declare-fun m!76763 () Bool)

(assert (=> b!76683 m!76763))

(assert (=> b!76683 m!76111))

(assert (=> b!76683 m!76111))

(declare-fun m!76765 () Bool)

(assert (=> b!76683 m!76765))

(assert (=> b!76685 m!76111))

(assert (=> b!76685 m!76111))

(assert (=> b!76685 m!76765))

(assert (=> d!18111 d!18301))

(declare-fun d!18303 () Bool)

(declare-fun c!11729 () Bool)

(assert (=> d!18303 (= c!11729 (and ((_ is Cons!1485) lt!34738) (= (_1!1081 (h!2073 lt!34738)) (_1!1081 lt!34508))))))

(declare-fun e!50075 () Option!141)

(assert (=> d!18303 (= (getValueByKey!135 lt!34738 (_1!1081 lt!34508)) e!50075)))

(declare-fun b!76687 () Bool)

(declare-fun e!50076 () Option!141)

(assert (=> b!76687 (= e!50075 e!50076)))

(declare-fun c!11730 () Bool)

(assert (=> b!76687 (= c!11730 (and ((_ is Cons!1485) lt!34738) (not (= (_1!1081 (h!2073 lt!34738)) (_1!1081 lt!34508)))))))

(declare-fun b!76688 () Bool)

(assert (=> b!76688 (= e!50076 (getValueByKey!135 (t!5083 lt!34738) (_1!1081 lt!34508)))))

(declare-fun b!76686 () Bool)

(assert (=> b!76686 (= e!50075 (Some!140 (_2!1081 (h!2073 lt!34738))))))

(declare-fun b!76689 () Bool)

(assert (=> b!76689 (= e!50076 None!139)))

(assert (= (and d!18303 c!11729) b!76686))

(assert (= (and d!18303 (not c!11729)) b!76687))

(assert (= (and b!76687 c!11730) b!76688))

(assert (= (and b!76687 (not c!11730)) b!76689))

(declare-fun m!76767 () Bool)

(assert (=> b!76688 m!76767))

(assert (=> d!18111 d!18303))

(declare-fun d!18305 () Bool)

(assert (=> d!18305 (= (getValueByKey!135 lt!34738 (_1!1081 lt!34508)) (Some!140 (_2!1081 lt!34508)))))

(declare-fun lt!34977 () Unit!2193)

(assert (=> d!18305 (= lt!34977 (choose!440 lt!34738 (_1!1081 lt!34508) (_2!1081 lt!34508)))))

(declare-fun e!50077 () Bool)

(assert (=> d!18305 e!50077))

(declare-fun res!40343 () Bool)

(assert (=> d!18305 (=> (not res!40343) (not e!50077))))

(assert (=> d!18305 (= res!40343 (isStrictlySorted!294 lt!34738))))

(assert (=> d!18305 (= (lemmaContainsTupThenGetReturnValue!52 lt!34738 (_1!1081 lt!34508) (_2!1081 lt!34508)) lt!34977)))

(declare-fun b!76690 () Bool)

(declare-fun res!40344 () Bool)

(assert (=> b!76690 (=> (not res!40344) (not e!50077))))

(assert (=> b!76690 (= res!40344 (containsKey!139 lt!34738 (_1!1081 lt!34508)))))

(declare-fun b!76691 () Bool)

(assert (=> b!76691 (= e!50077 (contains!733 lt!34738 (tuple2!2141 (_1!1081 lt!34508) (_2!1081 lt!34508))))))

(assert (= (and d!18305 res!40343) b!76690))

(assert (= (and b!76690 res!40344) b!76691))

(assert (=> d!18305 m!76105))

(declare-fun m!76769 () Bool)

(assert (=> d!18305 m!76769))

(declare-fun m!76771 () Bool)

(assert (=> d!18305 m!76771))

(declare-fun m!76773 () Bool)

(assert (=> b!76690 m!76773))

(declare-fun m!76775 () Bool)

(assert (=> b!76691 m!76775))

(assert (=> d!18111 d!18305))

(declare-fun b!76692 () Bool)

(declare-fun e!50080 () List!1489)

(declare-fun call!6951 () List!1489)

(assert (=> b!76692 (= e!50080 call!6951)))

(declare-fun b!76693 () Bool)

(declare-fun c!11734 () Bool)

(assert (=> b!76693 (= c!11734 (and ((_ is Cons!1485) (toList!730 lt!34498)) (bvsgt (_1!1081 (h!2073 (toList!730 lt!34498))) (_1!1081 lt!34508))))))

(declare-fun e!50081 () List!1489)

(assert (=> b!76693 (= e!50081 e!50080)))

(declare-fun c!11731 () Bool)

(declare-fun bm!6948 () Bool)

(declare-fun call!6953 () List!1489)

(declare-fun e!50082 () List!1489)

(assert (=> bm!6948 (= call!6953 ($colon$colon!68 e!50082 (ite c!11731 (h!2073 (toList!730 lt!34498)) (tuple2!2141 (_1!1081 lt!34508) (_2!1081 lt!34508)))))))

(declare-fun c!11733 () Bool)

(assert (=> bm!6948 (= c!11733 c!11731)))

(declare-fun b!76694 () Bool)

(assert (=> b!76694 (= e!50082 (insertStrictlySorted!55 (t!5083 (toList!730 lt!34498)) (_1!1081 lt!34508) (_2!1081 lt!34508)))))

(declare-fun bm!6949 () Bool)

(declare-fun call!6952 () List!1489)

(assert (=> bm!6949 (= call!6952 call!6953)))

(declare-fun bm!6950 () Bool)

(assert (=> bm!6950 (= call!6951 call!6952)))

(declare-fun b!76696 () Bool)

(declare-fun e!50079 () List!1489)

(assert (=> b!76696 (= e!50079 e!50081)))

(declare-fun c!11732 () Bool)

(assert (=> b!76696 (= c!11732 (and ((_ is Cons!1485) (toList!730 lt!34498)) (= (_1!1081 (h!2073 (toList!730 lt!34498))) (_1!1081 lt!34508))))))

(declare-fun b!76697 () Bool)

(assert (=> b!76697 (= e!50080 call!6951)))

(declare-fun b!76698 () Bool)

(assert (=> b!76698 (= e!50079 call!6953)))

(declare-fun b!76699 () Bool)

(assert (=> b!76699 (= e!50081 call!6952)))

(declare-fun b!76695 () Bool)

(declare-fun e!50078 () Bool)

(declare-fun lt!34978 () List!1489)

(assert (=> b!76695 (= e!50078 (contains!733 lt!34978 (tuple2!2141 (_1!1081 lt!34508) (_2!1081 lt!34508))))))

(declare-fun d!18307 () Bool)

(assert (=> d!18307 e!50078))

(declare-fun res!40346 () Bool)

(assert (=> d!18307 (=> (not res!40346) (not e!50078))))

(assert (=> d!18307 (= res!40346 (isStrictlySorted!294 lt!34978))))

(assert (=> d!18307 (= lt!34978 e!50079)))

(assert (=> d!18307 (= c!11731 (and ((_ is Cons!1485) (toList!730 lt!34498)) (bvslt (_1!1081 (h!2073 (toList!730 lt!34498))) (_1!1081 lt!34508))))))

(assert (=> d!18307 (isStrictlySorted!294 (toList!730 lt!34498))))

(assert (=> d!18307 (= (insertStrictlySorted!55 (toList!730 lt!34498) (_1!1081 lt!34508) (_2!1081 lt!34508)) lt!34978)))

(declare-fun b!76700 () Bool)

(assert (=> b!76700 (= e!50082 (ite c!11732 (t!5083 (toList!730 lt!34498)) (ite c!11734 (Cons!1485 (h!2073 (toList!730 lt!34498)) (t!5083 (toList!730 lt!34498))) Nil!1486)))))

(declare-fun b!76701 () Bool)

(declare-fun res!40345 () Bool)

(assert (=> b!76701 (=> (not res!40345) (not e!50078))))

(assert (=> b!76701 (= res!40345 (containsKey!139 lt!34978 (_1!1081 lt!34508)))))

(assert (= (and d!18307 c!11731) b!76698))

(assert (= (and d!18307 (not c!11731)) b!76696))

(assert (= (and b!76696 c!11732) b!76699))

(assert (= (and b!76696 (not c!11732)) b!76693))

(assert (= (and b!76693 c!11734) b!76697))

(assert (= (and b!76693 (not c!11734)) b!76692))

(assert (= (or b!76697 b!76692) bm!6950))

(assert (= (or b!76699 bm!6950) bm!6949))

(assert (= (or b!76698 bm!6949) bm!6948))

(assert (= (and bm!6948 c!11733) b!76694))

(assert (= (and bm!6948 (not c!11733)) b!76700))

(assert (= (and d!18307 res!40346) b!76701))

(assert (= (and b!76701 res!40345) b!76695))

(declare-fun m!76777 () Bool)

(assert (=> b!76694 m!76777))

(declare-fun m!76779 () Bool)

(assert (=> b!76695 m!76779))

(declare-fun m!76781 () Bool)

(assert (=> d!18307 m!76781))

(declare-fun m!76783 () Bool)

(assert (=> d!18307 m!76783))

(declare-fun m!76785 () Bool)

(assert (=> bm!6948 m!76785))

(declare-fun m!76787 () Bool)

(assert (=> b!76701 m!76787))

(assert (=> d!18111 d!18307))

(declare-fun bm!6953 () Bool)

(declare-fun call!6956 () (_ BitVec 32))

(assert (=> bm!6953 (= call!6956 (arrayCountValidKeys!0 (_keys!3905 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2111 (_keys!3905 newMap!16))))))

(declare-fun b!76710 () Bool)

(declare-fun e!50087 () (_ BitVec 32))

(declare-fun e!50088 () (_ BitVec 32))

(assert (=> b!76710 (= e!50087 e!50088)))

(declare-fun c!11740 () Bool)

(assert (=> b!76710 (= c!11740 (validKeyInArray!0 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76711 () Bool)

(assert (=> b!76711 (= e!50088 (bvadd #b00000000000000000000000000000001 call!6956))))

(declare-fun d!18309 () Bool)

(declare-fun lt!34981 () (_ BitVec 32))

(assert (=> d!18309 (and (bvsge lt!34981 #b00000000000000000000000000000000) (bvsle lt!34981 (bvsub (size!2111 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!18309 (= lt!34981 e!50087)))

(declare-fun c!11739 () Bool)

(assert (=> d!18309 (= c!11739 (bvsge #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(assert (=> d!18309 (and (bvsle #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2111 (_keys!3905 newMap!16)) (size!2111 (_keys!3905 newMap!16))))))

(assert (=> d!18309 (= (arrayCountValidKeys!0 (_keys!3905 newMap!16) #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))) lt!34981)))

(declare-fun b!76712 () Bool)

(assert (=> b!76712 (= e!50087 #b00000000000000000000000000000000)))

(declare-fun b!76713 () Bool)

(assert (=> b!76713 (= e!50088 call!6956)))

(assert (= (and d!18309 c!11739) b!76712))

(assert (= (and d!18309 (not c!11739)) b!76710))

(assert (= (and b!76710 c!11740) b!76711))

(assert (= (and b!76710 (not c!11740)) b!76713))

(assert (= (or b!76711 b!76713) bm!6953))

(declare-fun m!76789 () Bool)

(assert (=> bm!6953 m!76789))

(assert (=> b!76710 m!76321))

(assert (=> b!76710 m!76321))

(assert (=> b!76710 m!76329))

(assert (=> b!76079 d!18309))

(declare-fun d!18311 () Bool)

(assert (=> d!18311 (= (inRange!0 (ite c!11607 (ite c!11604 (index!3086 lt!34612) (ite c!11598 (index!3085 lt!34633) (index!3088 lt!34633))) (ite c!11601 (index!3086 lt!34616) (ite c!11599 (index!3085 lt!34621) (index!3088 lt!34621)))) (mask!6230 newMap!16)) (and (bvsge (ite c!11607 (ite c!11604 (index!3086 lt!34612) (ite c!11598 (index!3085 lt!34633) (index!3088 lt!34633))) (ite c!11601 (index!3086 lt!34616) (ite c!11599 (index!3085 lt!34621) (index!3088 lt!34621)))) #b00000000000000000000000000000000) (bvslt (ite c!11607 (ite c!11604 (index!3086 lt!34612) (ite c!11598 (index!3085 lt!34633) (index!3088 lt!34633))) (ite c!11601 (index!3086 lt!34616) (ite c!11599 (index!3085 lt!34621) (index!3088 lt!34621)))) (bvadd (mask!6230 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!6856 d!18311))

(declare-fun d!18313 () Bool)

(declare-fun e!50091 () Bool)

(assert (=> d!18313 e!50091))

(declare-fun c!11743 () Bool)

(assert (=> d!18313 (= c!11743 (and (not (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!18313 true))

(declare-fun _$29!96 () Unit!2193)

(assert (=> d!18313 (= (choose!439 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (_values!2230 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992))) (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) (zeroValue!2146 (v!2559 (underlying!266 thiss!992))) (minValue!2146 (v!2559 (underlying!266 thiss!992))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992)))) _$29!96)))

(declare-fun b!76718 () Bool)

(assert (=> b!76718 (= e!50091 (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!76719 () Bool)

(assert (=> b!76719 (= e!50091 (ite (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2100 (v!2559 (underlying!266 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!18313 c!11743) b!76718))

(assert (= (and d!18313 (not c!11743)) b!76719))

(assert (=> b!76718 m!75825))

(assert (=> b!76718 m!75839))

(assert (=> d!18127 d!18313))

(assert (=> d!18127 d!18117))

(declare-fun d!18315 () Bool)

(declare-fun e!50092 () Bool)

(assert (=> d!18315 e!50092))

(declare-fun res!40348 () Bool)

(assert (=> d!18315 (=> (not res!40348) (not e!50092))))

(declare-fun lt!34983 () ListLongMap!1429)

(assert (=> d!18315 (= res!40348 (contains!731 lt!34983 (_1!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(declare-fun lt!34982 () List!1489)

(assert (=> d!18315 (= lt!34983 (ListLongMap!1430 lt!34982))))

(declare-fun lt!34985 () Unit!2193)

(declare-fun lt!34984 () Unit!2193)

(assert (=> d!18315 (= lt!34985 lt!34984)))

(assert (=> d!18315 (= (getValueByKey!135 lt!34982 (_1!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18315 (= lt!34984 (lemmaContainsTupThenGetReturnValue!52 lt!34982 (_1!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18315 (= lt!34982 (insertStrictlySorted!55 (toList!730 lt!34498) (_1!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18315 (= (+!99 lt!34498 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34983)))

(declare-fun b!76720 () Bool)

(declare-fun res!40347 () Bool)

(assert (=> b!76720 (=> (not res!40347) (not e!50092))))

(assert (=> b!76720 (= res!40347 (= (getValueByKey!135 (toList!730 lt!34983) (_1!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))))))))

(declare-fun b!76721 () Bool)

(assert (=> b!76721 (= e!50092 (contains!733 (toList!730 lt!34983) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))))))

(assert (= (and d!18315 res!40348) b!76720))

(assert (= (and b!76720 res!40347) b!76721))

(declare-fun m!76791 () Bool)

(assert (=> d!18315 m!76791))

(declare-fun m!76793 () Bool)

(assert (=> d!18315 m!76793))

(declare-fun m!76795 () Bool)

(assert (=> d!18315 m!76795))

(declare-fun m!76797 () Bool)

(assert (=> d!18315 m!76797))

(declare-fun m!76799 () Bool)

(assert (=> b!76720 m!76799))

(declare-fun m!76801 () Bool)

(assert (=> b!76721 m!76801))

(assert (=> d!18113 d!18315))

(declare-fun d!18317 () Bool)

(assert (=> d!18317 (= (+!99 (+!99 lt!34498 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) (+!99 (+!99 lt!34498 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))))

(assert (=> d!18317 true))

(declare-fun _$28!127 () Unit!2193)

(assert (=> d!18317 (= (choose!438 lt!34498 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))) _$28!127)))

(declare-fun bs!3283 () Bool)

(assert (= bs!3283 d!18317))

(assert (=> bs!3283 m!76119))

(assert (=> bs!3283 m!76119))

(assert (=> bs!3283 m!76121))

(assert (=> bs!3283 m!76117))

(assert (=> bs!3283 m!76117))

(assert (=> bs!3283 m!76123))

(assert (=> d!18113 d!18317))

(declare-fun d!18319 () Bool)

(declare-fun e!50093 () Bool)

(assert (=> d!18319 e!50093))

(declare-fun res!40350 () Bool)

(assert (=> d!18319 (=> (not res!40350) (not e!50093))))

(declare-fun lt!34987 () ListLongMap!1429)

(assert (=> d!18319 (= res!40350 (contains!731 lt!34987 (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(declare-fun lt!34986 () List!1489)

(assert (=> d!18319 (= lt!34987 (ListLongMap!1430 lt!34986))))

(declare-fun lt!34989 () Unit!2193)

(declare-fun lt!34988 () Unit!2193)

(assert (=> d!18319 (= lt!34989 lt!34988)))

(assert (=> d!18319 (= (getValueByKey!135 lt!34986 (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))) (Some!140 (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(assert (=> d!18319 (= lt!34988 (lemmaContainsTupThenGetReturnValue!52 lt!34986 (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(assert (=> d!18319 (= lt!34986 (insertStrictlySorted!55 (toList!730 (+!99 lt!34498 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(assert (=> d!18319 (= (+!99 (+!99 lt!34498 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) lt!34987)))

(declare-fun b!76722 () Bool)

(declare-fun res!40349 () Bool)

(assert (=> b!76722 (=> (not res!40349) (not e!50093))))

(assert (=> b!76722 (= res!40349 (= (getValueByKey!135 (toList!730 lt!34987) (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))) (Some!140 (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))))))

(declare-fun b!76723 () Bool)

(assert (=> b!76723 (= e!50093 (contains!733 (toList!730 lt!34987) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))))

(assert (= (and d!18319 res!40350) b!76722))

(assert (= (and b!76722 res!40349) b!76723))

(declare-fun m!76803 () Bool)

(assert (=> d!18319 m!76803))

(declare-fun m!76805 () Bool)

(assert (=> d!18319 m!76805))

(declare-fun m!76807 () Bool)

(assert (=> d!18319 m!76807))

(declare-fun m!76809 () Bool)

(assert (=> d!18319 m!76809))

(declare-fun m!76811 () Bool)

(assert (=> b!76722 m!76811))

(declare-fun m!76813 () Bool)

(assert (=> b!76723 m!76813))

(assert (=> d!18113 d!18319))

(declare-fun d!18321 () Bool)

(declare-fun e!50094 () Bool)

(assert (=> d!18321 e!50094))

(declare-fun res!40352 () Bool)

(assert (=> d!18321 (=> (not res!40352) (not e!50094))))

(declare-fun lt!34991 () ListLongMap!1429)

(assert (=> d!18321 (= res!40352 (contains!731 lt!34991 (_1!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(declare-fun lt!34990 () List!1489)

(assert (=> d!18321 (= lt!34991 (ListLongMap!1430 lt!34990))))

(declare-fun lt!34993 () Unit!2193)

(declare-fun lt!34992 () Unit!2193)

(assert (=> d!18321 (= lt!34993 lt!34992)))

(assert (=> d!18321 (= (getValueByKey!135 lt!34990 (_1!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18321 (= lt!34992 (lemmaContainsTupThenGetReturnValue!52 lt!34990 (_1!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18321 (= lt!34990 (insertStrictlySorted!55 (toList!730 (+!99 lt!34498 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))) (_1!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18321 (= (+!99 (+!99 lt!34498 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!34991)))

(declare-fun b!76724 () Bool)

(declare-fun res!40351 () Bool)

(assert (=> b!76724 (=> (not res!40351) (not e!50094))))

(assert (=> b!76724 (= res!40351 (= (getValueByKey!135 (toList!730 lt!34991) (_1!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))))))))

(declare-fun b!76725 () Bool)

(assert (=> b!76725 (= e!50094 (contains!733 (toList!730 lt!34991) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 (v!2559 (underlying!266 thiss!992))))))))

(assert (= (and d!18321 res!40352) b!76724))

(assert (= (and b!76724 res!40351) b!76725))

(declare-fun m!76815 () Bool)

(assert (=> d!18321 m!76815))

(declare-fun m!76817 () Bool)

(assert (=> d!18321 m!76817))

(declare-fun m!76819 () Bool)

(assert (=> d!18321 m!76819))

(declare-fun m!76821 () Bool)

(assert (=> d!18321 m!76821))

(declare-fun m!76823 () Bool)

(assert (=> b!76724 m!76823))

(declare-fun m!76825 () Bool)

(assert (=> b!76725 m!76825))

(assert (=> d!18113 d!18321))

(declare-fun d!18323 () Bool)

(declare-fun e!50095 () Bool)

(assert (=> d!18323 e!50095))

(declare-fun res!40354 () Bool)

(assert (=> d!18323 (=> (not res!40354) (not e!50095))))

(declare-fun lt!34995 () ListLongMap!1429)

(assert (=> d!18323 (= res!40354 (contains!731 lt!34995 (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(declare-fun lt!34994 () List!1489)

(assert (=> d!18323 (= lt!34995 (ListLongMap!1430 lt!34994))))

(declare-fun lt!34997 () Unit!2193)

(declare-fun lt!34996 () Unit!2193)

(assert (=> d!18323 (= lt!34997 lt!34996)))

(assert (=> d!18323 (= (getValueByKey!135 lt!34994 (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))) (Some!140 (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(assert (=> d!18323 (= lt!34996 (lemmaContainsTupThenGetReturnValue!52 lt!34994 (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(assert (=> d!18323 (= lt!34994 (insertStrictlySorted!55 (toList!730 lt!34498) (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(assert (=> d!18323 (= (+!99 lt!34498 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) lt!34995)))

(declare-fun b!76726 () Bool)

(declare-fun res!40353 () Bool)

(assert (=> b!76726 (=> (not res!40353) (not e!50095))))

(assert (=> b!76726 (= res!40353 (= (getValueByKey!135 (toList!730 lt!34995) (_1!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))) (Some!140 (_2!1081 (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))))))

(declare-fun b!76727 () Bool)

(assert (=> b!76727 (= e!50095 (contains!733 (toList!730 lt!34995) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)))))

(assert (= (and d!18323 res!40354) b!76726))

(assert (= (and b!76726 res!40353) b!76727))

(declare-fun m!76827 () Bool)

(assert (=> d!18323 m!76827))

(declare-fun m!76829 () Bool)

(assert (=> d!18323 m!76829))

(declare-fun m!76831 () Bool)

(assert (=> d!18323 m!76831))

(declare-fun m!76833 () Bool)

(assert (=> d!18323 m!76833))

(declare-fun m!76835 () Bool)

(assert (=> b!76726 m!76835))

(declare-fun m!76837 () Bool)

(assert (=> b!76727 m!76837))

(assert (=> d!18113 d!18323))

(declare-fun lt!34998 () SeekEntryResult!238)

(declare-fun b!76728 () Bool)

(declare-fun e!50096 () SeekEntryResult!238)

(assert (=> b!76728 (= e!50096 (seekKeyOrZeroReturnVacant!0 (x!11387 lt!34998) (index!3087 lt!34998) (index!3087 lt!34998) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (_keys!3905 newMap!16) (mask!6230 newMap!16)))))

(declare-fun b!76729 () Bool)

(assert (=> b!76729 (= e!50096 (MissingZero!238 (index!3087 lt!34998)))))

(declare-fun b!76730 () Bool)

(declare-fun e!50097 () SeekEntryResult!238)

(assert (=> b!76730 (= e!50097 (Found!238 (index!3087 lt!34998)))))

(declare-fun d!18325 () Bool)

(declare-fun lt!34999 () SeekEntryResult!238)

(assert (=> d!18325 (and (or ((_ is Undefined!238) lt!34999) (not ((_ is Found!238) lt!34999)) (and (bvsge (index!3086 lt!34999) #b00000000000000000000000000000000) (bvslt (index!3086 lt!34999) (size!2111 (_keys!3905 newMap!16))))) (or ((_ is Undefined!238) lt!34999) ((_ is Found!238) lt!34999) (not ((_ is MissingZero!238) lt!34999)) (and (bvsge (index!3085 lt!34999) #b00000000000000000000000000000000) (bvslt (index!3085 lt!34999) (size!2111 (_keys!3905 newMap!16))))) (or ((_ is Undefined!238) lt!34999) ((_ is Found!238) lt!34999) ((_ is MissingZero!238) lt!34999) (not ((_ is MissingVacant!238) lt!34999)) (and (bvsge (index!3088 lt!34999) #b00000000000000000000000000000000) (bvslt (index!3088 lt!34999) (size!2111 (_keys!3905 newMap!16))))) (or ((_ is Undefined!238) lt!34999) (ite ((_ is Found!238) lt!34999) (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3086 lt!34999)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) (ite ((_ is MissingZero!238) lt!34999) (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3085 lt!34999)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!238) lt!34999) (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3088 lt!34999)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!50098 () SeekEntryResult!238)

(assert (=> d!18325 (= lt!34999 e!50098)))

(declare-fun c!11745 () Bool)

(assert (=> d!18325 (= c!11745 (and ((_ is Intermediate!238) lt!34998) (undefined!1050 lt!34998)))))

(assert (=> d!18325 (= lt!34998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (mask!6230 newMap!16)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (_keys!3905 newMap!16) (mask!6230 newMap!16)))))

(assert (=> d!18325 (validMask!0 (mask!6230 newMap!16))))

(assert (=> d!18325 (= (seekEntryOrOpen!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (_keys!3905 newMap!16) (mask!6230 newMap!16)) lt!34999)))

(declare-fun b!76731 () Bool)

(assert (=> b!76731 (= e!50098 e!50097)))

(declare-fun lt!35000 () (_ BitVec 64))

(assert (=> b!76731 (= lt!35000 (select (arr!1871 (_keys!3905 newMap!16)) (index!3087 lt!34998)))))

(declare-fun c!11744 () Bool)

(assert (=> b!76731 (= c!11744 (= lt!35000 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun b!76732 () Bool)

(assert (=> b!76732 (= e!50098 Undefined!238)))

(declare-fun b!76733 () Bool)

(declare-fun c!11746 () Bool)

(assert (=> b!76733 (= c!11746 (= lt!35000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76733 (= e!50097 e!50096)))

(assert (= (and d!18325 c!11745) b!76732))

(assert (= (and d!18325 (not c!11745)) b!76731))

(assert (= (and b!76731 c!11744) b!76730))

(assert (= (and b!76731 (not c!11744)) b!76733))

(assert (= (and b!76733 c!11746) b!76729))

(assert (= (and b!76733 (not c!11746)) b!76728))

(assert (=> b!76728 m!75825))

(declare-fun m!76839 () Bool)

(assert (=> b!76728 m!76839))

(declare-fun m!76841 () Bool)

(assert (=> d!18325 m!76841))

(assert (=> d!18325 m!75825))

(declare-fun m!76843 () Bool)

(assert (=> d!18325 m!76843))

(declare-fun m!76845 () Bool)

(assert (=> d!18325 m!76845))

(declare-fun m!76847 () Bool)

(assert (=> d!18325 m!76847))

(assert (=> d!18325 m!76843))

(assert (=> d!18325 m!75825))

(declare-fun m!76849 () Bool)

(assert (=> d!18325 m!76849))

(assert (=> d!18325 m!76219))

(declare-fun m!76851 () Bool)

(assert (=> b!76731 m!76851))

(assert (=> bm!6873 d!18325))

(declare-fun b!76734 () Bool)

(declare-fun e!50099 () Bool)

(declare-fun call!6957 () Bool)

(assert (=> b!76734 (= e!50099 (not call!6957))))

(declare-fun b!76735 () Bool)

(declare-fun e!50100 () Bool)

(declare-fun call!6959 () Bool)

(assert (=> b!76735 (= e!50100 (not call!6959))))

(declare-fun bm!6954 () Bool)

(declare-fun call!6963 () ListLongMap!1429)

(declare-fun call!6958 () ListLongMap!1429)

(assert (=> bm!6954 (= call!6963 call!6958)))

(declare-fun b!76736 () Bool)

(declare-fun e!50104 () Unit!2193)

(declare-fun Unit!2219 () Unit!2193)

(assert (=> b!76736 (= e!50104 Unit!2219)))

(declare-fun bm!6955 () Bool)

(declare-fun c!11750 () Bool)

(declare-fun call!6962 () ListLongMap!1429)

(declare-fun call!6960 () ListLongMap!1429)

(declare-fun c!11749 () Bool)

(declare-fun call!6961 () ListLongMap!1429)

(assert (=> bm!6955 (= call!6958 (+!99 (ite c!11749 call!6962 (ite c!11750 call!6961 call!6960)) (ite (or c!11749 c!11750) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!11600 c!11602) lt!34504 (zeroValue!2146 newMap!16))) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 newMap!16)))))))

(declare-fun bm!6956 () Bool)

(assert (=> bm!6956 (= call!6962 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) (ite (and c!11600 c!11602) lt!34504 (zeroValue!2146 newMap!16)) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun bm!6957 () Bool)

(assert (=> bm!6957 (= call!6960 call!6961)))

(declare-fun b!76737 () Bool)

(declare-fun e!50111 () Bool)

(assert (=> b!76737 (= e!50111 (validKeyInArray!0 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6958 () Bool)

(declare-fun lt!35020 () ListLongMap!1429)

(assert (=> bm!6958 (= call!6959 (contains!731 lt!35020 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!11752 () Bool)

(declare-fun b!76738 () Bool)

(assert (=> b!76738 (= c!11752 (and (not (= (bvand (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!50109 () ListLongMap!1429)

(declare-fun e!50103 () ListLongMap!1429)

(assert (=> b!76738 (= e!50109 e!50103)))

(declare-fun e!50106 () Bool)

(declare-fun b!76739 () Bool)

(assert (=> b!76739 (= e!50106 (= (apply!77 lt!35020 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!11600 c!11602) lt!34504 (zeroValue!2146 newMap!16))))))

(declare-fun b!76740 () Bool)

(declare-fun e!50108 () Bool)

(assert (=> b!76740 (= e!50108 (= (apply!77 lt!35020 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)) (get!1154 (select (arr!1872 (_values!2230 newMap!16)) #b00000000000000000000000000000000) (dynLambda!330 (defaultEntry!2247 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2112 (_values!2230 newMap!16))))))

(assert (=> b!76740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(declare-fun b!76741 () Bool)

(declare-fun res!40355 () Bool)

(declare-fun e!50105 () Bool)

(assert (=> b!76741 (=> (not res!40355) (not e!50105))))

(declare-fun e!50102 () Bool)

(assert (=> b!76741 (= res!40355 e!50102)))

(declare-fun res!40363 () Bool)

(assert (=> b!76741 (=> res!40363 e!50102)))

(assert (=> b!76741 (= res!40363 (not e!50111))))

(declare-fun res!40359 () Bool)

(assert (=> b!76741 (=> (not res!40359) (not e!50111))))

(assert (=> b!76741 (= res!40359 (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(declare-fun bm!6960 () Bool)

(assert (=> bm!6960 (= call!6957 (contains!731 lt!35020 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76742 () Bool)

(assert (=> b!76742 (= e!50105 e!50100)))

(declare-fun c!11751 () Bool)

(assert (=> b!76742 (= c!11751 (not (= (bvand (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76743 () Bool)

(assert (=> b!76743 (= e!50103 call!6963)))

(declare-fun b!76744 () Bool)

(declare-fun e!50101 () ListLongMap!1429)

(assert (=> b!76744 (= e!50101 (+!99 call!6958 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 newMap!16))))))

(declare-fun b!76745 () Bool)

(assert (=> b!76745 (= e!50109 call!6963)))

(declare-fun b!76746 () Bool)

(assert (=> b!76746 (= e!50099 e!50106)))

(declare-fun res!40360 () Bool)

(assert (=> b!76746 (= res!40360 call!6957)))

(assert (=> b!76746 (=> (not res!40360) (not e!50106))))

(declare-fun b!76747 () Bool)

(assert (=> b!76747 (= e!50103 call!6960)))

(declare-fun b!76748 () Bool)

(declare-fun e!50107 () Bool)

(assert (=> b!76748 (= e!50107 (= (apply!77 lt!35020 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2146 newMap!16)))))

(declare-fun b!76749 () Bool)

(declare-fun e!50110 () Bool)

(assert (=> b!76749 (= e!50110 (validKeyInArray!0 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76750 () Bool)

(assert (=> b!76750 (= e!50102 e!50108)))

(declare-fun res!40356 () Bool)

(assert (=> b!76750 (=> (not res!40356) (not e!50108))))

(assert (=> b!76750 (= res!40356 (contains!731 lt!35020 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!76750 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(declare-fun b!76751 () Bool)

(declare-fun res!40361 () Bool)

(assert (=> b!76751 (=> (not res!40361) (not e!50105))))

(assert (=> b!76751 (= res!40361 e!50099)))

(declare-fun c!11748 () Bool)

(assert (=> b!76751 (= c!11748 (not (= (bvand (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!76752 () Bool)

(assert (=> b!76752 (= e!50100 e!50107)))

(declare-fun res!40362 () Bool)

(assert (=> b!76752 (= res!40362 call!6959)))

(assert (=> b!76752 (=> (not res!40362) (not e!50107))))

(declare-fun b!76753 () Bool)

(declare-fun lt!35019 () Unit!2193)

(assert (=> b!76753 (= e!50104 lt!35019)))

(declare-fun lt!35018 () ListLongMap!1429)

(assert (=> b!76753 (= lt!35018 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) (ite (and c!11600 c!11602) lt!34504 (zeroValue!2146 newMap!16)) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!35013 () (_ BitVec 64))

(assert (=> b!76753 (= lt!35013 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35004 () (_ BitVec 64))

(assert (=> b!76753 (= lt!35004 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!35015 () Unit!2193)

(assert (=> b!76753 (= lt!35015 (addStillContains!53 lt!35018 lt!35013 (ite (and c!11600 c!11602) lt!34504 (zeroValue!2146 newMap!16)) lt!35004))))

(assert (=> b!76753 (contains!731 (+!99 lt!35018 (tuple2!2141 lt!35013 (ite (and c!11600 c!11602) lt!34504 (zeroValue!2146 newMap!16)))) lt!35004)))

(declare-fun lt!35010 () Unit!2193)

(assert (=> b!76753 (= lt!35010 lt!35015)))

(declare-fun lt!35008 () ListLongMap!1429)

(assert (=> b!76753 (= lt!35008 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) (ite (and c!11600 c!11602) lt!34504 (zeroValue!2146 newMap!16)) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!35005 () (_ BitVec 64))

(assert (=> b!76753 (= lt!35005 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35002 () (_ BitVec 64))

(assert (=> b!76753 (= lt!35002 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!35017 () Unit!2193)

(assert (=> b!76753 (= lt!35017 (addApplyDifferent!53 lt!35008 lt!35005 (minValue!2146 newMap!16) lt!35002))))

(assert (=> b!76753 (= (apply!77 (+!99 lt!35008 (tuple2!2141 lt!35005 (minValue!2146 newMap!16))) lt!35002) (apply!77 lt!35008 lt!35002))))

(declare-fun lt!35006 () Unit!2193)

(assert (=> b!76753 (= lt!35006 lt!35017)))

(declare-fun lt!35016 () ListLongMap!1429)

(assert (=> b!76753 (= lt!35016 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) (ite (and c!11600 c!11602) lt!34504 (zeroValue!2146 newMap!16)) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!35009 () (_ BitVec 64))

(assert (=> b!76753 (= lt!35009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35014 () (_ BitVec 64))

(assert (=> b!76753 (= lt!35014 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!35001 () Unit!2193)

(assert (=> b!76753 (= lt!35001 (addApplyDifferent!53 lt!35016 lt!35009 (ite (and c!11600 c!11602) lt!34504 (zeroValue!2146 newMap!16)) lt!35014))))

(assert (=> b!76753 (= (apply!77 (+!99 lt!35016 (tuple2!2141 lt!35009 (ite (and c!11600 c!11602) lt!34504 (zeroValue!2146 newMap!16)))) lt!35014) (apply!77 lt!35016 lt!35014))))

(declare-fun lt!35011 () Unit!2193)

(assert (=> b!76753 (= lt!35011 lt!35001)))

(declare-fun lt!35021 () ListLongMap!1429)

(assert (=> b!76753 (= lt!35021 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) (ite (and c!11600 c!11602) lt!34504 (zeroValue!2146 newMap!16)) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!35012 () (_ BitVec 64))

(assert (=> b!76753 (= lt!35012 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35022 () (_ BitVec 64))

(assert (=> b!76753 (= lt!35022 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!76753 (= lt!35019 (addApplyDifferent!53 lt!35021 lt!35012 (minValue!2146 newMap!16) lt!35022))))

(assert (=> b!76753 (= (apply!77 (+!99 lt!35021 (tuple2!2141 lt!35012 (minValue!2146 newMap!16))) lt!35022) (apply!77 lt!35021 lt!35022))))

(declare-fun b!76754 () Bool)

(assert (=> b!76754 (= e!50101 e!50109)))

(assert (=> b!76754 (= c!11750 (and (not (= (bvand (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6959 () Bool)

(assert (=> bm!6959 (= call!6961 call!6962)))

(declare-fun d!18327 () Bool)

(assert (=> d!18327 e!50105))

(declare-fun res!40358 () Bool)

(assert (=> d!18327 (=> (not res!40358) (not e!50105))))

(assert (=> d!18327 (= res!40358 (or (bvsge #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))))

(declare-fun lt!35003 () ListLongMap!1429)

(assert (=> d!18327 (= lt!35020 lt!35003)))

(declare-fun lt!35007 () Unit!2193)

(assert (=> d!18327 (= lt!35007 e!50104)))

(declare-fun c!11747 () Bool)

(assert (=> d!18327 (= c!11747 e!50110)))

(declare-fun res!40357 () Bool)

(assert (=> d!18327 (=> (not res!40357) (not e!50110))))

(assert (=> d!18327 (= res!40357 (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(assert (=> d!18327 (= lt!35003 e!50101)))

(assert (=> d!18327 (= c!11749 (and (not (= (bvand (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18327 (validMask!0 (mask!6230 newMap!16))))

(assert (=> d!18327 (= (getCurrentListMap!426 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (ite (and c!11600 c!11602) lt!34625 (extraKeys!2100 newMap!16)) (ite (and c!11600 c!11602) lt!34504 (zeroValue!2146 newMap!16)) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)) lt!35020)))

(assert (= (and d!18327 c!11749) b!76744))

(assert (= (and d!18327 (not c!11749)) b!76754))

(assert (= (and b!76754 c!11750) b!76745))

(assert (= (and b!76754 (not c!11750)) b!76738))

(assert (= (and b!76738 c!11752) b!76743))

(assert (= (and b!76738 (not c!11752)) b!76747))

(assert (= (or b!76743 b!76747) bm!6957))

(assert (= (or b!76745 bm!6957) bm!6959))

(assert (= (or b!76745 b!76743) bm!6954))

(assert (= (or b!76744 bm!6959) bm!6956))

(assert (= (or b!76744 bm!6954) bm!6955))

(assert (= (and d!18327 res!40357) b!76749))

(assert (= (and d!18327 c!11747) b!76753))

(assert (= (and d!18327 (not c!11747)) b!76736))

(assert (= (and d!18327 res!40358) b!76741))

(assert (= (and b!76741 res!40359) b!76737))

(assert (= (and b!76741 (not res!40363)) b!76750))

(assert (= (and b!76750 res!40356) b!76740))

(assert (= (and b!76741 res!40355) b!76751))

(assert (= (and b!76751 c!11748) b!76746))

(assert (= (and b!76751 (not c!11748)) b!76734))

(assert (= (and b!76746 res!40360) b!76739))

(assert (= (or b!76746 b!76734) bm!6960))

(assert (= (and b!76751 res!40361) b!76742))

(assert (= (and b!76742 c!11751) b!76752))

(assert (= (and b!76742 (not c!11751)) b!76735))

(assert (= (and b!76752 res!40362) b!76748))

(assert (= (or b!76752 b!76735) bm!6958))

(declare-fun b_lambda!3439 () Bool)

(assert (=> (not b_lambda!3439) (not b!76740)))

(assert (=> b!76740 t!5091))

(declare-fun b_and!4691 () Bool)

(assert (= b_and!4687 (and (=> t!5091 result!2745) b_and!4691)))

(assert (=> b!76740 t!5093))

(declare-fun b_and!4693 () Bool)

(assert (= b_and!4689 (and (=> t!5093 result!2747) b_and!4693)))

(declare-fun m!76853 () Bool)

(assert (=> bm!6958 m!76853))

(declare-fun m!76855 () Bool)

(assert (=> b!76753 m!76855))

(declare-fun m!76857 () Bool)

(assert (=> b!76753 m!76857))

(declare-fun m!76859 () Bool)

(assert (=> b!76753 m!76859))

(declare-fun m!76861 () Bool)

(assert (=> b!76753 m!76861))

(declare-fun m!76863 () Bool)

(assert (=> b!76753 m!76863))

(declare-fun m!76865 () Bool)

(assert (=> b!76753 m!76865))

(declare-fun m!76867 () Bool)

(assert (=> b!76753 m!76867))

(declare-fun m!76869 () Bool)

(assert (=> b!76753 m!76869))

(assert (=> b!76753 m!76321))

(declare-fun m!76871 () Bool)

(assert (=> b!76753 m!76871))

(declare-fun m!76873 () Bool)

(assert (=> b!76753 m!76873))

(assert (=> b!76753 m!76863))

(declare-fun m!76875 () Bool)

(assert (=> b!76753 m!76875))

(assert (=> b!76753 m!76867))

(assert (=> b!76753 m!76875))

(declare-fun m!76877 () Bool)

(assert (=> b!76753 m!76877))

(declare-fun m!76879 () Bool)

(assert (=> b!76753 m!76879))

(assert (=> b!76753 m!76871))

(declare-fun m!76881 () Bool)

(assert (=> b!76753 m!76881))

(declare-fun m!76883 () Bool)

(assert (=> b!76753 m!76883))

(declare-fun m!76885 () Bool)

(assert (=> b!76753 m!76885))

(declare-fun m!76887 () Bool)

(assert (=> b!76748 m!76887))

(assert (=> b!76740 m!76511))

(assert (=> b!76740 m!76511))

(assert (=> b!76740 m!76445))

(assert (=> b!76740 m!76513))

(assert (=> b!76740 m!76445))

(assert (=> b!76740 m!76321))

(assert (=> b!76740 m!76321))

(declare-fun m!76889 () Bool)

(assert (=> b!76740 m!76889))

(assert (=> b!76737 m!76321))

(assert (=> b!76737 m!76321))

(assert (=> b!76737 m!76329))

(declare-fun m!76891 () Bool)

(assert (=> b!76739 m!76891))

(assert (=> bm!6956 m!76879))

(assert (=> b!76750 m!76321))

(assert (=> b!76750 m!76321))

(declare-fun m!76893 () Bool)

(assert (=> b!76750 m!76893))

(declare-fun m!76895 () Bool)

(assert (=> b!76744 m!76895))

(assert (=> b!76749 m!76321))

(assert (=> b!76749 m!76321))

(assert (=> b!76749 m!76329))

(declare-fun m!76897 () Bool)

(assert (=> bm!6960 m!76897))

(declare-fun m!76899 () Bool)

(assert (=> bm!6955 m!76899))

(assert (=> d!18327 m!76219))

(assert (=> bm!6863 d!18327))

(declare-fun b!76766 () Bool)

(declare-fun e!50114 () Bool)

(assert (=> b!76766 (= e!50114 (and (bvsge (extraKeys!2100 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2100 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!403 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!76763 () Bool)

(declare-fun res!40374 () Bool)

(assert (=> b!76763 (=> (not res!40374) (not e!50114))))

(assert (=> b!76763 (= res!40374 (and (= (size!2112 (_values!2230 newMap!16)) (bvadd (mask!6230 newMap!16) #b00000000000000000000000000000001)) (= (size!2111 (_keys!3905 newMap!16)) (size!2112 (_values!2230 newMap!16))) (bvsge (_size!403 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!403 newMap!16) (bvadd (mask!6230 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!76764 () Bool)

(declare-fun res!40375 () Bool)

(assert (=> b!76764 (=> (not res!40375) (not e!50114))))

(declare-fun size!2115 (LongMapFixedSize!708) (_ BitVec 32))

(assert (=> b!76764 (= res!40375 (bvsge (size!2115 newMap!16) (_size!403 newMap!16)))))

(declare-fun d!18329 () Bool)

(declare-fun res!40372 () Bool)

(assert (=> d!18329 (=> (not res!40372) (not e!50114))))

(assert (=> d!18329 (= res!40372 (validMask!0 (mask!6230 newMap!16)))))

(assert (=> d!18329 (= (simpleValid!53 newMap!16) e!50114)))

(declare-fun b!76765 () Bool)

(declare-fun res!40373 () Bool)

(assert (=> b!76765 (=> (not res!40373) (not e!50114))))

(assert (=> b!76765 (= res!40373 (= (size!2115 newMap!16) (bvadd (_size!403 newMap!16) (bvsdiv (bvadd (extraKeys!2100 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!18329 res!40372) b!76763))

(assert (= (and b!76763 res!40374) b!76764))

(assert (= (and b!76764 res!40375) b!76765))

(assert (= (and b!76765 res!40373) b!76766))

(declare-fun m!76901 () Bool)

(assert (=> b!76764 m!76901))

(assert (=> d!18329 m!76219))

(assert (=> b!76765 m!76901))

(assert (=> d!18095 d!18329))

(declare-fun d!18331 () Bool)

(declare-fun lt!35023 () Bool)

(assert (=> d!18331 (= lt!35023 (select (content!81 (toList!730 lt!34750)) lt!34508))))

(declare-fun e!50116 () Bool)

(assert (=> d!18331 (= lt!35023 e!50116)))

(declare-fun res!40376 () Bool)

(assert (=> d!18331 (=> (not res!40376) (not e!50116))))

(assert (=> d!18331 (= res!40376 ((_ is Cons!1485) (toList!730 lt!34750)))))

(assert (=> d!18331 (= (contains!733 (toList!730 lt!34750) lt!34508) lt!35023)))

(declare-fun b!76767 () Bool)

(declare-fun e!50115 () Bool)

(assert (=> b!76767 (= e!50116 e!50115)))

(declare-fun res!40377 () Bool)

(assert (=> b!76767 (=> res!40377 e!50115)))

(assert (=> b!76767 (= res!40377 (= (h!2073 (toList!730 lt!34750)) lt!34508))))

(declare-fun b!76768 () Bool)

(assert (=> b!76768 (= e!50115 (contains!733 (t!5083 (toList!730 lt!34750)) lt!34508))))

(assert (= (and d!18331 res!40376) b!76767))

(assert (= (and b!76767 (not res!40377)) b!76768))

(declare-fun m!76903 () Bool)

(assert (=> d!18331 m!76903))

(declare-fun m!76905 () Bool)

(assert (=> d!18331 m!76905))

(declare-fun m!76907 () Bool)

(assert (=> b!76768 m!76907))

(assert (=> b!76321 d!18331))

(assert (=> b!76305 d!18185))

(declare-fun d!18333 () Bool)

(declare-fun e!50117 () Bool)

(assert (=> d!18333 e!50117))

(declare-fun res!40378 () Bool)

(assert (=> d!18333 (=> res!40378 e!50117)))

(declare-fun lt!35025 () Bool)

(assert (=> d!18333 (= res!40378 (not lt!35025))))

(declare-fun lt!35027 () Bool)

(assert (=> d!18333 (= lt!35025 lt!35027)))

(declare-fun lt!35024 () Unit!2193)

(declare-fun e!50118 () Unit!2193)

(assert (=> d!18333 (= lt!35024 e!50118)))

(declare-fun c!11753 () Bool)

(assert (=> d!18333 (= c!11753 lt!35027)))

(assert (=> d!18333 (= lt!35027 (containsKey!139 (toList!730 lt!34731) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!18333 (= (contains!731 lt!34731 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!35025)))

(declare-fun b!76769 () Bool)

(declare-fun lt!35026 () Unit!2193)

(assert (=> b!76769 (= e!50118 lt!35026)))

(assert (=> b!76769 (= lt!35026 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 lt!34731) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76769 (isDefined!88 (getValueByKey!135 (toList!730 lt!34731) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!76770 () Bool)

(declare-fun Unit!2220 () Unit!2193)

(assert (=> b!76770 (= e!50118 Unit!2220)))

(declare-fun b!76771 () Bool)

(assert (=> b!76771 (= e!50117 (isDefined!88 (getValueByKey!135 (toList!730 lt!34731) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!18333 c!11753) b!76769))

(assert (= (and d!18333 (not c!11753)) b!76770))

(assert (= (and d!18333 (not res!40378)) b!76771))

(assert (=> d!18333 m!76033))

(declare-fun m!76909 () Bool)

(assert (=> d!18333 m!76909))

(assert (=> b!76769 m!76033))

(declare-fun m!76911 () Bool)

(assert (=> b!76769 m!76911))

(assert (=> b!76769 m!76033))

(assert (=> b!76769 m!76311))

(assert (=> b!76769 m!76311))

(declare-fun m!76913 () Bool)

(assert (=> b!76769 m!76913))

(assert (=> b!76771 m!76033))

(assert (=> b!76771 m!76311))

(assert (=> b!76771 m!76311))

(assert (=> b!76771 m!76913))

(assert (=> b!76307 d!18333))

(declare-fun d!18335 () Bool)

(declare-fun e!50119 () Bool)

(assert (=> d!18335 e!50119))

(declare-fun res!40380 () Bool)

(assert (=> d!18335 (=> (not res!40380) (not e!50119))))

(declare-fun lt!35029 () ListLongMap!1429)

(assert (=> d!18335 (= res!40380 (contains!731 lt!35029 (_1!1081 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(declare-fun lt!35028 () List!1489)

(assert (=> d!18335 (= lt!35029 (ListLongMap!1430 lt!35028))))

(declare-fun lt!35031 () Unit!2193)

(declare-fun lt!35030 () Unit!2193)

(assert (=> d!18335 (= lt!35031 lt!35030)))

(assert (=> d!18335 (= (getValueByKey!135 lt!35028 (_1!1081 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18335 (= lt!35030 (lemmaContainsTupThenGetReturnValue!52 lt!35028 (_1!1081 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18335 (= lt!35028 (insertStrictlySorted!55 (toList!730 call!6898) (_1!1081 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) (_2!1081 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))))))

(assert (=> d!18335 (= (+!99 call!6898 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992))))) lt!35029)))

(declare-fun b!76772 () Bool)

(declare-fun res!40379 () Bool)

(assert (=> b!76772 (=> (not res!40379) (not e!50119))))

(assert (=> b!76772 (= res!40379 (= (getValueByKey!135 (toList!730 lt!35029) (_1!1081 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992)))))) (Some!140 (_2!1081 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992))))))))))

(declare-fun b!76773 () Bool)

(assert (=> b!76773 (= e!50119 (contains!733 (toList!730 lt!35029) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2146 (v!2559 (underlying!266 thiss!992))))))))

(assert (= (and d!18335 res!40380) b!76772))

(assert (= (and b!76772 res!40379) b!76773))

(declare-fun m!76915 () Bool)

(assert (=> d!18335 m!76915))

(declare-fun m!76917 () Bool)

(assert (=> d!18335 m!76917))

(declare-fun m!76919 () Bool)

(assert (=> d!18335 m!76919))

(declare-fun m!76921 () Bool)

(assert (=> d!18335 m!76921))

(declare-fun m!76923 () Bool)

(assert (=> b!76772 m!76923))

(declare-fun m!76925 () Bool)

(assert (=> b!76773 m!76925))

(assert (=> b!76263 d!18335))

(assert (=> b!76351 d!18203))

(declare-fun b!76809 () Bool)

(declare-fun e!50143 () Unit!2193)

(declare-fun Unit!2221 () Unit!2193)

(assert (=> b!76809 (= e!50143 Unit!2221)))

(declare-fun lt!35092 () Unit!2193)

(assert (=> b!76809 (= lt!35092 (lemmaInListMapThenSeekEntryOrOpenFindsIt!26 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (defaultEntry!2247 newMap!16)))))

(declare-fun lt!35120 () SeekEntryResult!238)

(declare-fun call!6975 () SeekEntryResult!238)

(assert (=> b!76809 (= lt!35120 call!6975)))

(declare-fun res!40407 () Bool)

(assert (=> b!76809 (= res!40407 ((_ is Found!238) lt!35120))))

(declare-fun e!50139 () Bool)

(assert (=> b!76809 (=> (not res!40407) (not e!50139))))

(assert (=> b!76809 e!50139))

(declare-fun lt!35111 () Unit!2193)

(assert (=> b!76809 (= lt!35111 lt!35092)))

(assert (=> b!76809 false))

(declare-fun bm!6969 () Bool)

(declare-fun call!6974 () Bool)

(declare-fun c!11763 () Bool)

(declare-fun lt!35094 () SeekEntryResult!238)

(declare-fun c!11762 () Bool)

(assert (=> bm!6969 (= call!6974 (inRange!0 (ite c!11763 (index!3086 lt!35120) (ite c!11762 (index!3085 lt!35094) (index!3088 lt!35094))) (mask!6230 newMap!16)))))

(declare-fun bm!6970 () Bool)

(declare-fun call!6973 () Bool)

(assert (=> bm!6970 (= call!6973 call!6974)))

(declare-fun bm!6971 () Bool)

(declare-fun call!6972 () Bool)

(assert (=> bm!6971 (= call!6972 (arrayContainsKey!0 (_keys!3905 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!76810 () Bool)

(declare-fun e!50136 () Bool)

(assert (=> b!76810 (= e!50136 (not call!6972))))

(declare-fun b!76811 () Bool)

(declare-fun e!50141 () Bool)

(declare-fun e!50140 () Bool)

(assert (=> b!76811 (= e!50141 e!50140)))

(declare-fun res!40403 () Bool)

(assert (=> b!76811 (= res!40403 call!6973)))

(assert (=> b!76811 (=> (not res!40403) (not e!50140))))

(declare-fun b!76812 () Bool)

(declare-fun res!40401 () Bool)

(assert (=> b!76812 (=> (not res!40401) (not e!50136))))

(assert (=> b!76812 (= res!40401 call!6973)))

(declare-fun e!50138 () Bool)

(assert (=> b!76812 (= e!50138 e!50136)))

(declare-fun b!76813 () Bool)

(declare-fun res!40404 () Bool)

(declare-fun e!50142 () Bool)

(assert (=> b!76813 (=> (not res!40404) (not e!50142))))

(declare-fun lt!35101 () tuple2!2142)

(assert (=> b!76813 (= res!40404 (contains!731 (map!1159 (_2!1082 lt!35101)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun b!76814 () Bool)

(assert (=> b!76814 (= e!50140 (not call!6972))))

(declare-fun b!76815 () Bool)

(declare-fun res!40399 () Bool)

(assert (=> b!76815 (= res!40399 (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3088 lt!35094)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76815 (=> (not res!40399) (not e!50140))))

(declare-fun bm!6972 () Bool)

(assert (=> bm!6972 (= call!6975 (seekEntryOrOpen!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (_keys!3905 newMap!16) (mask!6230 newMap!16)))))

(declare-fun b!76816 () Bool)

(declare-fun lt!35117 () Unit!2193)

(assert (=> b!76816 (= e!50143 lt!35117)))

(assert (=> b!76816 (= lt!35117 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!26 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (defaultEntry!2247 newMap!16)))))

(assert (=> b!76816 (= lt!35094 call!6975)))

(assert (=> b!76816 (= c!11762 ((_ is MissingZero!238) lt!35094))))

(assert (=> b!76816 e!50138))

(declare-fun b!76817 () Bool)

(declare-fun res!40405 () Bool)

(assert (=> b!76817 (=> (not res!40405) (not e!50142))))

(assert (=> b!76817 (= res!40405 (valid!299 (_2!1082 lt!35101)))))

(declare-fun b!76818 () Bool)

(declare-fun res!40406 () Bool)

(assert (=> b!76818 (=> (not res!40406) (not e!50136))))

(assert (=> b!76818 (= res!40406 (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3085 lt!35094)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76819 () Bool)

(assert (=> b!76819 (= e!50139 (= (select (arr!1871 (_keys!3905 newMap!16)) (index!3086 lt!35120)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun d!18337 () Bool)

(assert (=> d!18337 e!50142))

(declare-fun res!40402 () Bool)

(assert (=> d!18337 (=> (not res!40402) (not e!50142))))

(assert (=> d!18337 (= res!40402 (_1!1082 lt!35101))))

(assert (=> d!18337 (= lt!35101 (tuple2!2143 true (LongMapFixedSize!709 (defaultEntry!2247 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (bvadd (_size!403 newMap!16) #b00000000000000000000000000000001) (array!3924 (store (arr!1871 (_keys!3905 newMap!16)) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) (size!2111 (_keys!3905 newMap!16))) (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))) (_vacant!403 newMap!16))))))

(declare-fun lt!35096 () Unit!2193)

(declare-fun lt!35108 () Unit!2193)

(assert (=> d!18337 (= lt!35096 lt!35108)))

(declare-fun lt!35104 () array!3923)

(declare-fun lt!35107 () array!3925)

(assert (=> d!18337 (contains!731 (getCurrentListMap!426 lt!35104 lt!35107 (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)) (select (store (arr!1871 (_keys!3905 newMap!16)) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630))))))

(assert (=> d!18337 (= lt!35108 (lemmaValidKeyInArrayIsInListMap!87 lt!35104 lt!35107 (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (defaultEntry!2247 newMap!16)))))

(assert (=> d!18337 (= lt!35107 (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))))))

(assert (=> d!18337 (= lt!35104 (array!3924 (store (arr!1871 (_keys!3905 newMap!16)) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) (size!2111 (_keys!3905 newMap!16))))))

(declare-fun lt!35093 () Unit!2193)

(declare-fun lt!35112 () Unit!2193)

(assert (=> d!18337 (= lt!35093 lt!35112)))

(declare-fun lt!35099 () array!3923)

(assert (=> d!18337 (= (arrayCountValidKeys!0 lt!35099 (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (bvadd (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!3923 (_ BitVec 32)) Unit!2193)

(assert (=> d!18337 (= lt!35112 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!35099 (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630))))))

(assert (=> d!18337 (= lt!35099 (array!3924 (store (arr!1871 (_keys!3905 newMap!16)) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) (size!2111 (_keys!3905 newMap!16))))))

(declare-fun lt!35100 () Unit!2193)

(declare-fun lt!35121 () Unit!2193)

(assert (=> d!18337 (= lt!35100 lt!35121)))

(declare-fun lt!35119 () array!3923)

(assert (=> d!18337 (arrayContainsKey!0 lt!35119 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!18337 (= lt!35121 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!35119 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630))))))

(assert (=> d!18337 (= lt!35119 (array!3924 (store (arr!1871 (_keys!3905 newMap!16)) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) (size!2111 (_keys!3905 newMap!16))))))

(declare-fun lt!35105 () Unit!2193)

(declare-fun lt!35118 () Unit!2193)

(assert (=> d!18337 (= lt!35105 lt!35118)))

(assert (=> d!18337 (= (+!99 (getCurrentListMap!426 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504)) (getCurrentListMap!426 (array!3924 (store (arr!1871 (_keys!3905 newMap!16)) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) (size!2111 (_keys!3905 newMap!16))) (array!3926 (store (arr!1872 (_values!2230 newMap!16)) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (ValueCellFull!900 lt!34504)) (size!2112 (_values!2230 newMap!16))) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!15 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 32) (_ BitVec 64) V!2963 Int) Unit!2193)

(assert (=> d!18337 (= lt!35118 (lemmaAddValidKeyToArrayThenAddPairToListMap!15 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!35102 () Unit!2193)

(declare-fun lt!35106 () Unit!2193)

(assert (=> d!18337 (= lt!35102 lt!35106)))

(assert (=> d!18337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3924 (store (arr!1871 (_keys!3905 newMap!16)) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) (size!2111 (_keys!3905 newMap!16))) (mask!6230 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!3923 (_ BitVec 32) (_ BitVec 32)) Unit!2193)

(assert (=> d!18337 (= lt!35106 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (_keys!3905 newMap!16) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (mask!6230 newMap!16)))))

(declare-fun lt!35095 () Unit!2193)

(declare-fun lt!35116 () Unit!2193)

(assert (=> d!18337 (= lt!35095 lt!35116)))

(assert (=> d!18337 (= (arrayCountValidKeys!0 (array!3924 (store (arr!1871 (_keys!3905 newMap!16)) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) (size!2111 (_keys!3905 newMap!16))) #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3905 newMap!16) #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!3923 (_ BitVec 32) (_ BitVec 64)) Unit!2193)

(assert (=> d!18337 (= lt!35116 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3905 newMap!16) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(declare-fun lt!35103 () Unit!2193)

(declare-fun lt!35098 () Unit!2193)

(assert (=> d!18337 (= lt!35103 lt!35098)))

(declare-fun lt!35097 () List!1488)

(declare-fun lt!35114 () (_ BitVec 32))

(assert (=> d!18337 (arrayNoDuplicates!0 (array!3924 (store (arr!1871 (_keys!3905 newMap!16)) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) (size!2111 (_keys!3905 newMap!16))) lt!35114 lt!35097)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!3923 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1488) Unit!2193)

(assert (=> d!18337 (= lt!35098 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3905 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630)) lt!35114 lt!35097))))

(assert (=> d!18337 (= lt!35097 Nil!1485)))

(assert (=> d!18337 (= lt!35114 #b00000000000000000000000000000000)))

(declare-fun lt!35115 () Unit!2193)

(declare-fun e!50137 () Unit!2193)

(assert (=> d!18337 (= lt!35115 e!50137)))

(declare-fun c!11764 () Bool)

(assert (=> d!18337 (= c!11764 (arrayContainsKey!0 (_keys!3905 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!35113 () Unit!2193)

(assert (=> d!18337 (= lt!35113 e!50143)))

(assert (=> d!18337 (= c!11763 (contains!731 (getCurrentListMap!426 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (=> d!18337 (valid!299 newMap!16)))

(assert (=> d!18337 (= (updateHelperNewKey!26 newMap!16 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504 (ite c!11597 (index!3088 lt!34630) (index!3085 lt!34630))) lt!35101)))

(declare-fun b!76808 () Bool)

(declare-fun Unit!2222 () Unit!2193)

(assert (=> b!76808 (= e!50137 Unit!2222)))

(declare-fun b!76820 () Bool)

(declare-fun Unit!2223 () Unit!2193)

(assert (=> b!76820 (= e!50137 Unit!2223)))

(declare-fun lt!35110 () Unit!2193)

(declare-fun lemmaArrayContainsKeyThenInListMap!15 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 (_ BitVec 64) (_ BitVec 32) Int) Unit!2193)

(assert (=> b!76820 (= lt!35110 (lemmaArrayContainsKeyThenInListMap!15 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(assert (=> b!76820 (contains!731 (getCurrentListMap!426 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355))))

(declare-fun lt!35109 () Unit!2193)

(assert (=> b!76820 (= lt!35109 lt!35110)))

(assert (=> b!76820 false))

(declare-fun b!76821 () Bool)

(declare-fun res!40400 () Bool)

(assert (=> b!76821 (= res!40400 call!6974)))

(assert (=> b!76821 (=> (not res!40400) (not e!50139))))

(declare-fun b!76822 () Bool)

(assert (=> b!76822 (= e!50141 ((_ is Undefined!238) lt!35094))))

(declare-fun b!76823 () Bool)

(assert (=> b!76823 (= e!50142 (= (map!1159 (_2!1082 lt!35101)) (+!99 (map!1159 newMap!16) (tuple2!2141 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) lt!34504))))))

(declare-fun b!76824 () Bool)

(declare-fun c!11765 () Bool)

(assert (=> b!76824 (= c!11765 ((_ is MissingVacant!238) lt!35094))))

(assert (=> b!76824 (= e!50138 e!50141)))

(assert (= (and d!18337 c!11763) b!76809))

(assert (= (and d!18337 (not c!11763)) b!76816))

(assert (= (and b!76809 res!40407) b!76821))

(assert (= (and b!76821 res!40400) b!76819))

(assert (= (and b!76816 c!11762) b!76812))

(assert (= (and b!76816 (not c!11762)) b!76824))

(assert (= (and b!76812 res!40401) b!76818))

(assert (= (and b!76818 res!40406) b!76810))

(assert (= (and b!76824 c!11765) b!76811))

(assert (= (and b!76824 (not c!11765)) b!76822))

(assert (= (and b!76811 res!40403) b!76815))

(assert (= (and b!76815 res!40399) b!76814))

(assert (= (or b!76812 b!76811) bm!6970))

(assert (= (or b!76810 b!76814) bm!6971))

(assert (= (or b!76821 bm!6970) bm!6969))

(assert (= (or b!76809 b!76816) bm!6972))

(assert (= (and d!18337 c!11764) b!76820))

(assert (= (and d!18337 (not c!11764)) b!76808))

(assert (= (and d!18337 res!40402) b!76817))

(assert (= (and b!76817 res!40405) b!76813))

(assert (= (and b!76813 res!40404) b!76823))

(declare-fun m!76927 () Bool)

(assert (=> b!76818 m!76927))

(declare-fun m!76929 () Bool)

(assert (=> bm!6969 m!76929))

(declare-fun m!76931 () Bool)

(assert (=> b!76815 m!76931))

(declare-fun m!76933 () Bool)

(assert (=> d!18337 m!76933))

(assert (=> d!18337 m!76013))

(assert (=> d!18337 m!76463))

(declare-fun m!76935 () Bool)

(assert (=> d!18337 m!76935))

(declare-fun m!76937 () Bool)

(assert (=> d!18337 m!76937))

(declare-fun m!76939 () Bool)

(assert (=> d!18337 m!76939))

(assert (=> d!18337 m!76013))

(assert (=> d!18337 m!75825))

(declare-fun m!76941 () Bool)

(assert (=> d!18337 m!76941))

(assert (=> d!18337 m!75825))

(declare-fun m!76943 () Bool)

(assert (=> d!18337 m!76943))

(declare-fun m!76945 () Bool)

(assert (=> d!18337 m!76945))

(declare-fun m!76947 () Bool)

(assert (=> d!18337 m!76947))

(assert (=> d!18337 m!75825))

(declare-fun m!76949 () Bool)

(assert (=> d!18337 m!76949))

(assert (=> d!18337 m!75825))

(declare-fun m!76951 () Bool)

(assert (=> d!18337 m!76951))

(assert (=> d!18337 m!75825))

(assert (=> d!18337 m!75999))

(declare-fun m!76953 () Bool)

(assert (=> d!18337 m!76953))

(assert (=> d!18337 m!76013))

(assert (=> d!18337 m!75825))

(declare-fun m!76955 () Bool)

(assert (=> d!18337 m!76955))

(declare-fun m!76957 () Bool)

(assert (=> d!18337 m!76957))

(assert (=> d!18337 m!75861))

(assert (=> d!18337 m!75943))

(assert (=> d!18337 m!75825))

(declare-fun m!76959 () Bool)

(assert (=> d!18337 m!76959))

(assert (=> d!18337 m!76935))

(assert (=> d!18337 m!76953))

(declare-fun m!76961 () Bool)

(assert (=> d!18337 m!76961))

(declare-fun m!76963 () Bool)

(assert (=> d!18337 m!76963))

(declare-fun m!76965 () Bool)

(assert (=> d!18337 m!76965))

(assert (=> d!18337 m!75825))

(declare-fun m!76967 () Bool)

(assert (=> d!18337 m!76967))

(declare-fun m!76969 () Bool)

(assert (=> d!18337 m!76969))

(declare-fun m!76971 () Bool)

(assert (=> b!76819 m!76971))

(declare-fun m!76973 () Bool)

(assert (=> b!76817 m!76973))

(declare-fun m!76975 () Bool)

(assert (=> b!76813 m!76975))

(assert (=> b!76813 m!76975))

(assert (=> b!76813 m!75825))

(declare-fun m!76977 () Bool)

(assert (=> b!76813 m!76977))

(assert (=> b!76820 m!75825))

(declare-fun m!76979 () Bool)

(assert (=> b!76820 m!76979))

(assert (=> b!76820 m!76013))

(assert (=> b!76820 m!76013))

(assert (=> b!76820 m!75825))

(assert (=> b!76820 m!76941))

(assert (=> b!76823 m!76975))

(assert (=> b!76823 m!75821))

(assert (=> b!76823 m!75821))

(declare-fun m!76981 () Bool)

(assert (=> b!76823 m!76981))

(assert (=> b!76809 m!75825))

(assert (=> b!76809 m!75979))

(assert (=> b!76816 m!75825))

(assert (=> b!76816 m!76001))

(assert (=> bm!6972 m!75825))

(assert (=> bm!6972 m!75973))

(assert (=> bm!6971 m!75825))

(assert (=> bm!6971 m!75999))

(assert (=> bm!6861 d!18337))

(declare-fun d!18339 () Bool)

(assert (=> d!18339 (= (+!99 (getCurrentListMap!426 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) (zeroValue!2146 newMap!16) (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34504)) (getCurrentListMap!426 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) lt!34625 lt!34504 (minValue!2146 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!35124 () Unit!2193)

(declare-fun choose!450 (array!3923 array!3925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2963 V!2963 V!2963 Int) Unit!2193)

(assert (=> d!18339 (= lt!35124 (choose!450 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) lt!34625 (zeroValue!2146 newMap!16) lt!34504 (minValue!2146 newMap!16) (defaultEntry!2247 newMap!16)))))

(assert (=> d!18339 (validMask!0 (mask!6230 newMap!16))))

(assert (=> d!18339 (= (lemmaChangeZeroKeyThenAddPairToListMap!26 (_keys!3905 newMap!16) (_values!2230 newMap!16) (mask!6230 newMap!16) (extraKeys!2100 newMap!16) lt!34625 (zeroValue!2146 newMap!16) lt!34504 (minValue!2146 newMap!16) (defaultEntry!2247 newMap!16)) lt!35124)))

(declare-fun bs!3284 () Bool)

(assert (= bs!3284 d!18339))

(assert (=> bs!3284 m!76013))

(assert (=> bs!3284 m!76013))

(declare-fun m!76983 () Bool)

(assert (=> bs!3284 m!76983))

(assert (=> bs!3284 m!76219))

(declare-fun m!76985 () Bool)

(assert (=> bs!3284 m!76985))

(declare-fun m!76987 () Bool)

(assert (=> bs!3284 m!76987))

(assert (=> b!76184 d!18339))

(declare-fun d!18341 () Bool)

(assert (=> d!18341 (= (get!1157 (select (arr!1872 (_values!2230 (v!2559 (underlying!266 thiss!992)))) from!355) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!330 (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76072 d!18341))

(assert (=> b!76349 d!18203))

(declare-fun d!18343 () Bool)

(declare-fun e!50144 () Bool)

(assert (=> d!18343 e!50144))

(declare-fun res!40408 () Bool)

(assert (=> d!18343 (=> res!40408 e!50144)))

(declare-fun lt!35126 () Bool)

(assert (=> d!18343 (= res!40408 (not lt!35126))))

(declare-fun lt!35128 () Bool)

(assert (=> d!18343 (= lt!35126 lt!35128)))

(declare-fun lt!35125 () Unit!2193)

(declare-fun e!50145 () Unit!2193)

(assert (=> d!18343 (= lt!35125 e!50145)))

(declare-fun c!11766 () Bool)

(assert (=> d!18343 (= c!11766 lt!35128)))

(assert (=> d!18343 (= lt!35128 (containsKey!139 (toList!730 lt!34714) (_1!1081 lt!34509)))))

(assert (=> d!18343 (= (contains!731 lt!34714 (_1!1081 lt!34509)) lt!35126)))

(declare-fun b!76825 () Bool)

(declare-fun lt!35127 () Unit!2193)

(assert (=> b!76825 (= e!50145 lt!35127)))

(assert (=> b!76825 (= lt!35127 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 lt!34714) (_1!1081 lt!34509)))))

(assert (=> b!76825 (isDefined!88 (getValueByKey!135 (toList!730 lt!34714) (_1!1081 lt!34509)))))

(declare-fun b!76826 () Bool)

(declare-fun Unit!2224 () Unit!2193)

(assert (=> b!76826 (= e!50145 Unit!2224)))

(declare-fun b!76827 () Bool)

(assert (=> b!76827 (= e!50144 (isDefined!88 (getValueByKey!135 (toList!730 lt!34714) (_1!1081 lt!34509))))))

(assert (= (and d!18343 c!11766) b!76825))

(assert (= (and d!18343 (not c!11766)) b!76826))

(assert (= (and d!18343 (not res!40408)) b!76827))

(declare-fun m!76989 () Bool)

(assert (=> d!18343 m!76989))

(declare-fun m!76991 () Bool)

(assert (=> b!76825 m!76991))

(assert (=> b!76825 m!76079))

(assert (=> b!76825 m!76079))

(declare-fun m!76993 () Bool)

(assert (=> b!76825 m!76993))

(assert (=> b!76827 m!76079))

(assert (=> b!76827 m!76079))

(assert (=> b!76827 m!76993))

(assert (=> d!18107 d!18343))

(declare-fun d!18345 () Bool)

(declare-fun c!11767 () Bool)

(assert (=> d!18345 (= c!11767 (and ((_ is Cons!1485) lt!34713) (= (_1!1081 (h!2073 lt!34713)) (_1!1081 lt!34509))))))

(declare-fun e!50146 () Option!141)

(assert (=> d!18345 (= (getValueByKey!135 lt!34713 (_1!1081 lt!34509)) e!50146)))

(declare-fun b!76829 () Bool)

(declare-fun e!50147 () Option!141)

(assert (=> b!76829 (= e!50146 e!50147)))

(declare-fun c!11768 () Bool)

(assert (=> b!76829 (= c!11768 (and ((_ is Cons!1485) lt!34713) (not (= (_1!1081 (h!2073 lt!34713)) (_1!1081 lt!34509)))))))

(declare-fun b!76830 () Bool)

(assert (=> b!76830 (= e!50147 (getValueByKey!135 (t!5083 lt!34713) (_1!1081 lt!34509)))))

(declare-fun b!76828 () Bool)

(assert (=> b!76828 (= e!50146 (Some!140 (_2!1081 (h!2073 lt!34713))))))

(declare-fun b!76831 () Bool)

(assert (=> b!76831 (= e!50147 None!139)))

(assert (= (and d!18345 c!11767) b!76828))

(assert (= (and d!18345 (not c!11767)) b!76829))

(assert (= (and b!76829 c!11768) b!76830))

(assert (= (and b!76829 (not c!11768)) b!76831))

(declare-fun m!76995 () Bool)

(assert (=> b!76830 m!76995))

(assert (=> d!18107 d!18345))

(declare-fun d!18347 () Bool)

(assert (=> d!18347 (= (getValueByKey!135 lt!34713 (_1!1081 lt!34509)) (Some!140 (_2!1081 lt!34509)))))

(declare-fun lt!35129 () Unit!2193)

(assert (=> d!18347 (= lt!35129 (choose!440 lt!34713 (_1!1081 lt!34509) (_2!1081 lt!34509)))))

(declare-fun e!50148 () Bool)

(assert (=> d!18347 e!50148))

(declare-fun res!40409 () Bool)

(assert (=> d!18347 (=> (not res!40409) (not e!50148))))

(assert (=> d!18347 (= res!40409 (isStrictlySorted!294 lt!34713))))

(assert (=> d!18347 (= (lemmaContainsTupThenGetReturnValue!52 lt!34713 (_1!1081 lt!34509) (_2!1081 lt!34509)) lt!35129)))

(declare-fun b!76832 () Bool)

(declare-fun res!40410 () Bool)

(assert (=> b!76832 (=> (not res!40410) (not e!50148))))

(assert (=> b!76832 (= res!40410 (containsKey!139 lt!34713 (_1!1081 lt!34509)))))

(declare-fun b!76833 () Bool)

(assert (=> b!76833 (= e!50148 (contains!733 lt!34713 (tuple2!2141 (_1!1081 lt!34509) (_2!1081 lt!34509))))))

(assert (= (and d!18347 res!40409) b!76832))

(assert (= (and b!76832 res!40410) b!76833))

(assert (=> d!18347 m!76073))

(declare-fun m!76997 () Bool)

(assert (=> d!18347 m!76997))

(declare-fun m!76999 () Bool)

(assert (=> d!18347 m!76999))

(declare-fun m!77001 () Bool)

(assert (=> b!76832 m!77001))

(declare-fun m!77003 () Bool)

(assert (=> b!76833 m!77003))

(assert (=> d!18107 d!18347))

(declare-fun b!76834 () Bool)

(declare-fun e!50151 () List!1489)

(declare-fun call!6976 () List!1489)

(assert (=> b!76834 (= e!50151 call!6976)))

(declare-fun b!76835 () Bool)

(declare-fun c!11772 () Bool)

(assert (=> b!76835 (= c!11772 (and ((_ is Cons!1485) (toList!730 lt!34498)) (bvsgt (_1!1081 (h!2073 (toList!730 lt!34498))) (_1!1081 lt!34509))))))

(declare-fun e!50152 () List!1489)

(assert (=> b!76835 (= e!50152 e!50151)))

(declare-fun e!50153 () List!1489)

(declare-fun c!11769 () Bool)

(declare-fun bm!6973 () Bool)

(declare-fun call!6978 () List!1489)

(assert (=> bm!6973 (= call!6978 ($colon$colon!68 e!50153 (ite c!11769 (h!2073 (toList!730 lt!34498)) (tuple2!2141 (_1!1081 lt!34509) (_2!1081 lt!34509)))))))

(declare-fun c!11771 () Bool)

(assert (=> bm!6973 (= c!11771 c!11769)))

(declare-fun b!76836 () Bool)

(assert (=> b!76836 (= e!50153 (insertStrictlySorted!55 (t!5083 (toList!730 lt!34498)) (_1!1081 lt!34509) (_2!1081 lt!34509)))))

(declare-fun bm!6974 () Bool)

(declare-fun call!6977 () List!1489)

(assert (=> bm!6974 (= call!6977 call!6978)))

(declare-fun bm!6975 () Bool)

(assert (=> bm!6975 (= call!6976 call!6977)))

(declare-fun b!76838 () Bool)

(declare-fun e!50150 () List!1489)

(assert (=> b!76838 (= e!50150 e!50152)))

(declare-fun c!11770 () Bool)

(assert (=> b!76838 (= c!11770 (and ((_ is Cons!1485) (toList!730 lt!34498)) (= (_1!1081 (h!2073 (toList!730 lt!34498))) (_1!1081 lt!34509))))))

(declare-fun b!76839 () Bool)

(assert (=> b!76839 (= e!50151 call!6976)))

(declare-fun b!76840 () Bool)

(assert (=> b!76840 (= e!50150 call!6978)))

(declare-fun b!76841 () Bool)

(assert (=> b!76841 (= e!50152 call!6977)))

(declare-fun b!76837 () Bool)

(declare-fun e!50149 () Bool)

(declare-fun lt!35130 () List!1489)

(assert (=> b!76837 (= e!50149 (contains!733 lt!35130 (tuple2!2141 (_1!1081 lt!34509) (_2!1081 lt!34509))))))

(declare-fun d!18349 () Bool)

(assert (=> d!18349 e!50149))

(declare-fun res!40412 () Bool)

(assert (=> d!18349 (=> (not res!40412) (not e!50149))))

(assert (=> d!18349 (= res!40412 (isStrictlySorted!294 lt!35130))))

(assert (=> d!18349 (= lt!35130 e!50150)))

(assert (=> d!18349 (= c!11769 (and ((_ is Cons!1485) (toList!730 lt!34498)) (bvslt (_1!1081 (h!2073 (toList!730 lt!34498))) (_1!1081 lt!34509))))))

(assert (=> d!18349 (isStrictlySorted!294 (toList!730 lt!34498))))

(assert (=> d!18349 (= (insertStrictlySorted!55 (toList!730 lt!34498) (_1!1081 lt!34509) (_2!1081 lt!34509)) lt!35130)))

(declare-fun b!76842 () Bool)

(assert (=> b!76842 (= e!50153 (ite c!11770 (t!5083 (toList!730 lt!34498)) (ite c!11772 (Cons!1485 (h!2073 (toList!730 lt!34498)) (t!5083 (toList!730 lt!34498))) Nil!1486)))))

(declare-fun b!76843 () Bool)

(declare-fun res!40411 () Bool)

(assert (=> b!76843 (=> (not res!40411) (not e!50149))))

(assert (=> b!76843 (= res!40411 (containsKey!139 lt!35130 (_1!1081 lt!34509)))))

(assert (= (and d!18349 c!11769) b!76840))

(assert (= (and d!18349 (not c!11769)) b!76838))

(assert (= (and b!76838 c!11770) b!76841))

(assert (= (and b!76838 (not c!11770)) b!76835))

(assert (= (and b!76835 c!11772) b!76839))

(assert (= (and b!76835 (not c!11772)) b!76834))

(assert (= (or b!76839 b!76834) bm!6975))

(assert (= (or b!76841 bm!6975) bm!6974))

(assert (= (or b!76840 bm!6974) bm!6973))

(assert (= (and bm!6973 c!11771) b!76836))

(assert (= (and bm!6973 (not c!11771)) b!76842))

(assert (= (and d!18349 res!40412) b!76843))

(assert (= (and b!76843 res!40411) b!76837))

(declare-fun m!77005 () Bool)

(assert (=> b!76836 m!77005))

(declare-fun m!77007 () Bool)

(assert (=> b!76837 m!77007))

(declare-fun m!77009 () Bool)

(assert (=> d!18349 m!77009))

(assert (=> d!18349 m!76783))

(declare-fun m!77011 () Bool)

(assert (=> bm!6973 m!77011))

(declare-fun m!77013 () Bool)

(assert (=> b!76843 m!77013))

(assert (=> d!18107 d!18349))

(assert (=> b!76183 d!18325))

(declare-fun d!18351 () Bool)

(assert (=> d!18351 (= (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) (and (not (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76346 d!18351))

(declare-fun d!18353 () Bool)

(assert (=> d!18353 (= (apply!77 lt!34702 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1158 (getValueByKey!135 (toList!730 lt!34702) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3285 () Bool)

(assert (= bs!3285 d!18353))

(assert (=> bs!3285 m!76375))

(assert (=> bs!3285 m!76375))

(declare-fun m!77015 () Bool)

(assert (=> bs!3285 m!77015))

(assert (=> b!76258 d!18353))

(declare-fun d!18355 () Bool)

(declare-fun res!40417 () Bool)

(declare-fun e!50158 () Bool)

(assert (=> d!18355 (=> res!40417 e!50158)))

(assert (=> d!18355 (= res!40417 (and ((_ is Cons!1485) (toList!730 lt!34500)) (= (_1!1081 (h!2073 (toList!730 lt!34500))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355))))))

(assert (=> d!18355 (= (containsKey!139 (toList!730 lt!34500) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)) e!50158)))

(declare-fun b!76848 () Bool)

(declare-fun e!50159 () Bool)

(assert (=> b!76848 (= e!50158 e!50159)))

(declare-fun res!40418 () Bool)

(assert (=> b!76848 (=> (not res!40418) (not e!50159))))

(assert (=> b!76848 (= res!40418 (and (or (not ((_ is Cons!1485) (toList!730 lt!34500))) (bvsle (_1!1081 (h!2073 (toList!730 lt!34500))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355))) ((_ is Cons!1485) (toList!730 lt!34500)) (bvslt (_1!1081 (h!2073 (toList!730 lt!34500))) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355))))))

(declare-fun b!76849 () Bool)

(assert (=> b!76849 (= e!50159 (containsKey!139 (t!5083 (toList!730 lt!34500)) (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) from!355)))))

(assert (= (and d!18355 (not res!40417)) b!76848))

(assert (= (and b!76848 res!40418) b!76849))

(assert (=> b!76849 m!75825))

(declare-fun m!77017 () Bool)

(assert (=> b!76849 m!77017))

(assert (=> d!18097 d!18355))

(declare-fun b!76850 () Bool)

(declare-fun e!50160 () Bool)

(declare-fun call!6979 () Bool)

(assert (=> b!76850 (= e!50160 (not call!6979))))

(declare-fun b!76851 () Bool)

(declare-fun e!50161 () Bool)

(declare-fun call!6981 () Bool)

(assert (=> b!76851 (= e!50161 (not call!6981))))

(declare-fun bm!6976 () Bool)

(declare-fun call!6985 () ListLongMap!1429)

(declare-fun call!6980 () ListLongMap!1429)

(assert (=> bm!6976 (= call!6985 call!6980)))

(declare-fun b!76852 () Bool)

(declare-fun e!50165 () Unit!2193)

(declare-fun Unit!2225 () Unit!2193)

(assert (=> b!76852 (= e!50165 Unit!2225)))

(declare-fun call!6983 () ListLongMap!1429)

(declare-fun call!6984 () ListLongMap!1429)

(declare-fun bm!6977 () Bool)

(declare-fun c!11775 () Bool)

(declare-fun c!11776 () Bool)

(declare-fun call!6982 () ListLongMap!1429)

(assert (=> bm!6977 (= call!6980 (+!99 (ite c!11775 call!6984 (ite c!11776 call!6983 call!6982)) (ite (or c!11775 c!11776) (tuple2!2141 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2146 newMap!16)) (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16))))))))

(declare-fun bm!6978 () Bool)

(assert (=> bm!6978 (= call!6984 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (ite (or c!11600 c!11607) (_values!2230 newMap!16) lt!34637) (mask!6230 newMap!16) (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) (zeroValue!2146 newMap!16) (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun bm!6979 () Bool)

(assert (=> bm!6979 (= call!6982 call!6983)))

(declare-fun b!76853 () Bool)

(declare-fun e!50172 () Bool)

(assert (=> b!76853 (= e!50172 (validKeyInArray!0 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6980 () Bool)

(declare-fun lt!35150 () ListLongMap!1429)

(assert (=> bm!6980 (= call!6981 (contains!731 lt!35150 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!11778 () Bool)

(declare-fun b!76854 () Bool)

(assert (=> b!76854 (= c!11778 (and (not (= (bvand (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!50170 () ListLongMap!1429)

(declare-fun e!50164 () ListLongMap!1429)

(assert (=> b!76854 (= e!50170 e!50164)))

(declare-fun b!76855 () Bool)

(declare-fun e!50167 () Bool)

(assert (=> b!76855 (= e!50167 (= (apply!77 lt!35150 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2146 newMap!16)))))

(declare-fun b!76856 () Bool)

(declare-fun e!50169 () Bool)

(assert (=> b!76856 (= e!50169 (= (apply!77 lt!35150 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)) (get!1154 (select (arr!1872 (ite (or c!11600 c!11607) (_values!2230 newMap!16) lt!34637)) #b00000000000000000000000000000000) (dynLambda!330 (defaultEntry!2247 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76856 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2112 (ite (or c!11600 c!11607) (_values!2230 newMap!16) lt!34637))))))

(assert (=> b!76856 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(declare-fun b!76857 () Bool)

(declare-fun res!40419 () Bool)

(declare-fun e!50166 () Bool)

(assert (=> b!76857 (=> (not res!40419) (not e!50166))))

(declare-fun e!50163 () Bool)

(assert (=> b!76857 (= res!40419 e!50163)))

(declare-fun res!40427 () Bool)

(assert (=> b!76857 (=> res!40427 e!50163)))

(assert (=> b!76857 (= res!40427 (not e!50172))))

(declare-fun res!40423 () Bool)

(assert (=> b!76857 (=> (not res!40423) (not e!50172))))

(assert (=> b!76857 (= res!40423 (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(declare-fun bm!6982 () Bool)

(assert (=> bm!6982 (= call!6979 (contains!731 lt!35150 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76858 () Bool)

(assert (=> b!76858 (= e!50166 e!50161)))

(declare-fun c!11777 () Bool)

(assert (=> b!76858 (= c!11777 (not (= (bvand (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76859 () Bool)

(assert (=> b!76859 (= e!50164 call!6985)))

(declare-fun b!76860 () Bool)

(declare-fun e!50162 () ListLongMap!1429)

(assert (=> b!76860 (= e!50162 (+!99 call!6980 (tuple2!2141 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16)))))))

(declare-fun b!76861 () Bool)

(assert (=> b!76861 (= e!50170 call!6985)))

(declare-fun b!76862 () Bool)

(assert (=> b!76862 (= e!50160 e!50167)))

(declare-fun res!40424 () Bool)

(assert (=> b!76862 (= res!40424 call!6979)))

(assert (=> b!76862 (=> (not res!40424) (not e!50167))))

(declare-fun b!76863 () Bool)

(assert (=> b!76863 (= e!50164 call!6982)))

(declare-fun e!50168 () Bool)

(declare-fun b!76864 () Bool)

(assert (=> b!76864 (= e!50168 (= (apply!77 lt!35150 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16))))))

(declare-fun b!76865 () Bool)

(declare-fun e!50171 () Bool)

(assert (=> b!76865 (= e!50171 (validKeyInArray!0 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76866 () Bool)

(assert (=> b!76866 (= e!50163 e!50169)))

(declare-fun res!40420 () Bool)

(assert (=> b!76866 (=> (not res!40420) (not e!50169))))

(assert (=> b!76866 (= res!40420 (contains!731 lt!35150 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!76866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(declare-fun b!76867 () Bool)

(declare-fun res!40425 () Bool)

(assert (=> b!76867 (=> (not res!40425) (not e!50166))))

(assert (=> b!76867 (= res!40425 e!50160)))

(declare-fun c!11774 () Bool)

(assert (=> b!76867 (= c!11774 (not (= (bvand (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!76868 () Bool)

(assert (=> b!76868 (= e!50161 e!50168)))

(declare-fun res!40426 () Bool)

(assert (=> b!76868 (= res!40426 call!6981)))

(assert (=> b!76868 (=> (not res!40426) (not e!50168))))

(declare-fun b!76869 () Bool)

(declare-fun lt!35149 () Unit!2193)

(assert (=> b!76869 (= e!50165 lt!35149)))

(declare-fun lt!35148 () ListLongMap!1429)

(assert (=> b!76869 (= lt!35148 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (ite (or c!11600 c!11607) (_values!2230 newMap!16) lt!34637) (mask!6230 newMap!16) (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) (zeroValue!2146 newMap!16) (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!35143 () (_ BitVec 64))

(assert (=> b!76869 (= lt!35143 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35134 () (_ BitVec 64))

(assert (=> b!76869 (= lt!35134 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!35145 () Unit!2193)

(assert (=> b!76869 (= lt!35145 (addStillContains!53 lt!35148 lt!35143 (zeroValue!2146 newMap!16) lt!35134))))

(assert (=> b!76869 (contains!731 (+!99 lt!35148 (tuple2!2141 lt!35143 (zeroValue!2146 newMap!16))) lt!35134)))

(declare-fun lt!35140 () Unit!2193)

(assert (=> b!76869 (= lt!35140 lt!35145)))

(declare-fun lt!35138 () ListLongMap!1429)

(assert (=> b!76869 (= lt!35138 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (ite (or c!11600 c!11607) (_values!2230 newMap!16) lt!34637) (mask!6230 newMap!16) (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) (zeroValue!2146 newMap!16) (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!35135 () (_ BitVec 64))

(assert (=> b!76869 (= lt!35135 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35132 () (_ BitVec 64))

(assert (=> b!76869 (= lt!35132 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!35147 () Unit!2193)

(assert (=> b!76869 (= lt!35147 (addApplyDifferent!53 lt!35138 lt!35135 (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16)) lt!35132))))

(assert (=> b!76869 (= (apply!77 (+!99 lt!35138 (tuple2!2141 lt!35135 (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16)))) lt!35132) (apply!77 lt!35138 lt!35132))))

(declare-fun lt!35136 () Unit!2193)

(assert (=> b!76869 (= lt!35136 lt!35147)))

(declare-fun lt!35146 () ListLongMap!1429)

(assert (=> b!76869 (= lt!35146 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (ite (or c!11600 c!11607) (_values!2230 newMap!16) lt!34637) (mask!6230 newMap!16) (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) (zeroValue!2146 newMap!16) (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!35139 () (_ BitVec 64))

(assert (=> b!76869 (= lt!35139 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35144 () (_ BitVec 64))

(assert (=> b!76869 (= lt!35144 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!35131 () Unit!2193)

(assert (=> b!76869 (= lt!35131 (addApplyDifferent!53 lt!35146 lt!35139 (zeroValue!2146 newMap!16) lt!35144))))

(assert (=> b!76869 (= (apply!77 (+!99 lt!35146 (tuple2!2141 lt!35139 (zeroValue!2146 newMap!16))) lt!35144) (apply!77 lt!35146 lt!35144))))

(declare-fun lt!35141 () Unit!2193)

(assert (=> b!76869 (= lt!35141 lt!35131)))

(declare-fun lt!35151 () ListLongMap!1429)

(assert (=> b!76869 (= lt!35151 (getCurrentListMapNoExtraKeys!64 (_keys!3905 newMap!16) (ite (or c!11600 c!11607) (_values!2230 newMap!16) lt!34637) (mask!6230 newMap!16) (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) (zeroValue!2146 newMap!16) (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)))))

(declare-fun lt!35142 () (_ BitVec 64))

(assert (=> b!76869 (= lt!35142 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35152 () (_ BitVec 64))

(assert (=> b!76869 (= lt!35152 (select (arr!1871 (_keys!3905 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!76869 (= lt!35149 (addApplyDifferent!53 lt!35151 lt!35142 (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16)) lt!35152))))

(assert (=> b!76869 (= (apply!77 (+!99 lt!35151 (tuple2!2141 lt!35142 (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16)))) lt!35152) (apply!77 lt!35151 lt!35152))))

(declare-fun b!76870 () Bool)

(assert (=> b!76870 (= e!50162 e!50170)))

(assert (=> b!76870 (= c!11776 (and (not (= (bvand (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6981 () Bool)

(assert (=> bm!6981 (= call!6983 call!6984)))

(declare-fun d!18357 () Bool)

(assert (=> d!18357 e!50166))

(declare-fun res!40422 () Bool)

(assert (=> d!18357 (=> (not res!40422) (not e!50166))))

(assert (=> d!18357 (= res!40422 (or (bvsge #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))))

(declare-fun lt!35133 () ListLongMap!1429)

(assert (=> d!18357 (= lt!35150 lt!35133)))

(declare-fun lt!35137 () Unit!2193)

(assert (=> d!18357 (= lt!35137 e!50165)))

(declare-fun c!11773 () Bool)

(assert (=> d!18357 (= c!11773 e!50171)))

(declare-fun res!40421 () Bool)

(assert (=> d!18357 (=> (not res!40421) (not e!50171))))

(assert (=> d!18357 (= res!40421 (bvslt #b00000000000000000000000000000000 (size!2111 (_keys!3905 newMap!16))))))

(assert (=> d!18357 (= lt!35133 e!50162)))

(assert (=> d!18357 (= c!11775 (and (not (= (bvand (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18357 (validMask!0 (mask!6230 newMap!16))))

(assert (=> d!18357 (= (getCurrentListMap!426 (_keys!3905 newMap!16) (ite (or c!11600 c!11607) (_values!2230 newMap!16) lt!34637) (mask!6230 newMap!16) (ite c!11600 (ite c!11602 (extraKeys!2100 newMap!16) lt!34614) (extraKeys!2100 newMap!16)) (zeroValue!2146 newMap!16) (ite c!11600 (ite c!11602 (minValue!2146 newMap!16) lt!34504) (minValue!2146 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2247 newMap!16)) lt!35150)))

(assert (= (and d!18357 c!11775) b!76860))

(assert (= (and d!18357 (not c!11775)) b!76870))

(assert (= (and b!76870 c!11776) b!76861))

(assert (= (and b!76870 (not c!11776)) b!76854))

(assert (= (and b!76854 c!11778) b!76859))

(assert (= (and b!76854 (not c!11778)) b!76863))

(assert (= (or b!76859 b!76863) bm!6979))

(assert (= (or b!76861 bm!6979) bm!6981))

(assert (= (or b!76861 b!76859) bm!6976))

(assert (= (or b!76860 bm!6981) bm!6978))

(assert (= (or b!76860 bm!6976) bm!6977))

(assert (= (and d!18357 res!40421) b!76865))

(assert (= (and d!18357 c!11773) b!76869))

(assert (= (and d!18357 (not c!11773)) b!76852))

(assert (= (and d!18357 res!40422) b!76857))

(assert (= (and b!76857 res!40423) b!76853))

(assert (= (and b!76857 (not res!40427)) b!76866))

(assert (= (and b!76866 res!40420) b!76856))

(assert (= (and b!76857 res!40419) b!76867))

(assert (= (and b!76867 c!11774) b!76862))

(assert (= (and b!76867 (not c!11774)) b!76850))

(assert (= (and b!76862 res!40424) b!76855))

(assert (= (or b!76862 b!76850) bm!6982))

(assert (= (and b!76867 res!40425) b!76858))

(assert (= (and b!76858 c!11777) b!76868))

(assert (= (and b!76858 (not c!11777)) b!76851))

(assert (= (and b!76868 res!40426) b!76864))

(assert (= (or b!76868 b!76851) bm!6980))

(declare-fun b_lambda!3441 () Bool)

(assert (=> (not b_lambda!3441) (not b!76856)))

(assert (=> b!76856 t!5091))

(declare-fun b_and!4695 () Bool)

(assert (= b_and!4691 (and (=> t!5091 result!2745) b_and!4695)))

(assert (=> b!76856 t!5093))

(declare-fun b_and!4697 () Bool)

(assert (= b_and!4693 (and (=> t!5093 result!2747) b_and!4697)))

(declare-fun m!77019 () Bool)

(assert (=> bm!6980 m!77019))

(declare-fun m!77021 () Bool)

(assert (=> b!76869 m!77021))

(declare-fun m!77023 () Bool)

(assert (=> b!76869 m!77023))

(declare-fun m!77025 () Bool)

(assert (=> b!76869 m!77025))

(declare-fun m!77027 () Bool)

(assert (=> b!76869 m!77027))

(declare-fun m!77029 () Bool)

(assert (=> b!76869 m!77029))

(declare-fun m!77031 () Bool)

(assert (=> b!76869 m!77031))

(declare-fun m!77033 () Bool)

(assert (=> b!76869 m!77033))

(declare-fun m!77035 () Bool)

(assert (=> b!76869 m!77035))

(assert (=> b!76869 m!76321))

(declare-fun m!77037 () Bool)

(assert (=> b!76869 m!77037))

(declare-fun m!77039 () Bool)

(assert (=> b!76869 m!77039))

(assert (=> b!76869 m!77029))

(declare-fun m!77041 () Bool)

(assert (=> b!76869 m!77041))

(assert (=> b!76869 m!77033))

(assert (=> b!76869 m!77041))

(declare-fun m!77043 () Bool)

(assert (=> b!76869 m!77043))

(declare-fun m!77045 () Bool)

(assert (=> b!76869 m!77045))

(assert (=> b!76869 m!77037))

(declare-fun m!77047 () Bool)

(assert (=> b!76869 m!77047))

(declare-fun m!77049 () Bool)

(assert (=> b!76869 m!77049))

(declare-fun m!77051 () Bool)

(assert (=> b!76869 m!77051))

(declare-fun m!77053 () Bool)

(assert (=> b!76864 m!77053))

(declare-fun m!77055 () Bool)

(assert (=> b!76856 m!77055))

(assert (=> b!76856 m!77055))

(assert (=> b!76856 m!76445))

(declare-fun m!77057 () Bool)

(assert (=> b!76856 m!77057))

(assert (=> b!76856 m!76445))

(assert (=> b!76856 m!76321))

(assert (=> b!76856 m!76321))

(declare-fun m!77059 () Bool)

(assert (=> b!76856 m!77059))

(assert (=> b!76853 m!76321))

(assert (=> b!76853 m!76321))

(assert (=> b!76853 m!76329))

(declare-fun m!77061 () Bool)

(assert (=> b!76855 m!77061))

(assert (=> bm!6978 m!77045))

(assert (=> b!76866 m!76321))

(assert (=> b!76866 m!76321))

(declare-fun m!77063 () Bool)

(assert (=> b!76866 m!77063))

(declare-fun m!77065 () Bool)

(assert (=> b!76860 m!77065))

(assert (=> b!76865 m!76321))

(assert (=> b!76865 m!76321))

(assert (=> b!76865 m!76329))

(declare-fun m!77067 () Bool)

(assert (=> bm!6982 m!77067))

(declare-fun m!77069 () Bool)

(assert (=> bm!6977 m!77069))

(assert (=> d!18357 m!76219))

(assert (=> bm!6858 d!18357))

(declare-fun bm!6983 () Bool)

(declare-fun call!6986 () Bool)

(assert (=> bm!6983 (= call!6986 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3905 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992)))))))

(declare-fun d!18359 () Bool)

(declare-fun res!40429 () Bool)

(declare-fun e!50173 () Bool)

(assert (=> d!18359 (=> res!40429 e!50173)))

(assert (=> d!18359 (= res!40429 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2111 (_keys!3905 (v!2559 (underlying!266 thiss!992))))))))

(assert (=> d!18359 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3905 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992)))) e!50173)))

(declare-fun b!76871 () Bool)

(declare-fun e!50174 () Bool)

(declare-fun e!50175 () Bool)

(assert (=> b!76871 (= e!50174 e!50175)))

(declare-fun lt!35155 () (_ BitVec 64))

(assert (=> b!76871 (= lt!35155 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!35153 () Unit!2193)

(assert (=> b!76871 (= lt!35153 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) lt!35155 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!76871 (arrayContainsKey!0 (_keys!3905 (v!2559 (underlying!266 thiss!992))) lt!35155 #b00000000000000000000000000000000)))

(declare-fun lt!35154 () Unit!2193)

(assert (=> b!76871 (= lt!35154 lt!35153)))

(declare-fun res!40428 () Bool)

(assert (=> b!76871 (= res!40428 (= (seekEntryOrOpen!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3905 (v!2559 (underlying!266 thiss!992))) (mask!6230 (v!2559 (underlying!266 thiss!992)))) (Found!238 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!76871 (=> (not res!40428) (not e!50175))))

(declare-fun b!76872 () Bool)

(assert (=> b!76872 (= e!50174 call!6986)))

(declare-fun b!76873 () Bool)

(assert (=> b!76873 (= e!50173 e!50174)))

(declare-fun c!11779 () Bool)

(assert (=> b!76873 (= c!11779 (validKeyInArray!0 (select (arr!1871 (_keys!3905 (v!2559 (underlying!266 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!76874 () Bool)

(assert (=> b!76874 (= e!50175 call!6986)))

(assert (= (and d!18359 (not res!40429)) b!76873))

(assert (= (and b!76873 c!11779) b!76871))

(assert (= (and b!76873 (not c!11779)) b!76872))

(assert (= (and b!76871 res!40428) b!76874))

(assert (= (or b!76874 b!76872) bm!6983))

(declare-fun m!77071 () Bool)

(assert (=> bm!6983 m!77071))

(assert (=> b!76871 m!76379))

(declare-fun m!77073 () Bool)

(assert (=> b!76871 m!77073))

(declare-fun m!77075 () Bool)

(assert (=> b!76871 m!77075))

(assert (=> b!76871 m!76379))

(declare-fun m!77077 () Bool)

(assert (=> b!76871 m!77077))

(assert (=> b!76873 m!76379))

(assert (=> b!76873 m!76379))

(assert (=> b!76873 m!76381))

(assert (=> bm!6910 d!18359))

(declare-fun d!18361 () Bool)

(declare-fun c!11780 () Bool)

(assert (=> d!18361 (= c!11780 (and ((_ is Cons!1485) (toList!730 lt!34746)) (= (_1!1081 (h!2073 (toList!730 lt!34746))) (_1!1081 lt!34509))))))

(declare-fun e!50176 () Option!141)

(assert (=> d!18361 (= (getValueByKey!135 (toList!730 lt!34746) (_1!1081 lt!34509)) e!50176)))

(declare-fun b!76876 () Bool)

(declare-fun e!50177 () Option!141)

(assert (=> b!76876 (= e!50176 e!50177)))

(declare-fun c!11781 () Bool)

(assert (=> b!76876 (= c!11781 (and ((_ is Cons!1485) (toList!730 lt!34746)) (not (= (_1!1081 (h!2073 (toList!730 lt!34746))) (_1!1081 lt!34509)))))))

(declare-fun b!76877 () Bool)

(assert (=> b!76877 (= e!50177 (getValueByKey!135 (t!5083 (toList!730 lt!34746)) (_1!1081 lt!34509)))))

(declare-fun b!76875 () Bool)

(assert (=> b!76875 (= e!50176 (Some!140 (_2!1081 (h!2073 (toList!730 lt!34746)))))))

(declare-fun b!76878 () Bool)

(assert (=> b!76878 (= e!50177 None!139)))

(assert (= (and d!18361 c!11780) b!76875))

(assert (= (and d!18361 (not c!11780)) b!76876))

(assert (= (and b!76876 c!11781) b!76877))

(assert (= (and b!76876 (not c!11781)) b!76878))

(declare-fun m!77079 () Bool)

(assert (=> b!76877 m!77079))

(assert (=> b!76318 d!18361))

(assert (=> b!76256 d!18185))

(assert (=> b!76344 d!18351))

(declare-fun b!76880 () Bool)

(declare-fun e!50179 () Bool)

(assert (=> b!76880 (= e!50179 tp_is_empty!2487)))

(declare-fun mapIsEmpty!3233 () Bool)

(declare-fun mapRes!3233 () Bool)

(assert (=> mapIsEmpty!3233 mapRes!3233))

(declare-fun condMapEmpty!3233 () Bool)

(declare-fun mapDefault!3233 () ValueCell!900)

(assert (=> mapNonEmpty!3232 (= condMapEmpty!3233 (= mapRest!3232 ((as const (Array (_ BitVec 32) ValueCell!900)) mapDefault!3233)))))

(assert (=> mapNonEmpty!3232 (= tp!8632 (and e!50179 mapRes!3233))))

(declare-fun b!76879 () Bool)

(declare-fun e!50178 () Bool)

(assert (=> b!76879 (= e!50178 tp_is_empty!2487)))

(declare-fun mapNonEmpty!3233 () Bool)

(declare-fun tp!8633 () Bool)

(assert (=> mapNonEmpty!3233 (= mapRes!3233 (and tp!8633 e!50178))))

(declare-fun mapRest!3233 () (Array (_ BitVec 32) ValueCell!900))

(declare-fun mapKey!3233 () (_ BitVec 32))

(declare-fun mapValue!3233 () ValueCell!900)

(assert (=> mapNonEmpty!3233 (= mapRest!3232 (store mapRest!3233 mapKey!3233 mapValue!3233))))

(assert (= (and mapNonEmpty!3232 condMapEmpty!3233) mapIsEmpty!3233))

(assert (= (and mapNonEmpty!3232 (not condMapEmpty!3233)) mapNonEmpty!3233))

(assert (= (and mapNonEmpty!3233 ((_ is ValueCellFull!900) mapValue!3233)) b!76879))

(assert (= (and mapNonEmpty!3232 ((_ is ValueCellFull!900) mapDefault!3233)) b!76880))

(declare-fun m!77081 () Bool)

(assert (=> mapNonEmpty!3233 m!77081))

(declare-fun b!76882 () Bool)

(declare-fun e!50181 () Bool)

(assert (=> b!76882 (= e!50181 tp_is_empty!2487)))

(declare-fun mapIsEmpty!3234 () Bool)

(declare-fun mapRes!3234 () Bool)

(assert (=> mapIsEmpty!3234 mapRes!3234))

(declare-fun condMapEmpty!3234 () Bool)

(declare-fun mapDefault!3234 () ValueCell!900)

(assert (=> mapNonEmpty!3231 (= condMapEmpty!3234 (= mapRest!3231 ((as const (Array (_ BitVec 32) ValueCell!900)) mapDefault!3234)))))

(assert (=> mapNonEmpty!3231 (= tp!8631 (and e!50181 mapRes!3234))))

(declare-fun b!76881 () Bool)

(declare-fun e!50180 () Bool)

(assert (=> b!76881 (= e!50180 tp_is_empty!2487)))

(declare-fun mapNonEmpty!3234 () Bool)

(declare-fun tp!8634 () Bool)

(assert (=> mapNonEmpty!3234 (= mapRes!3234 (and tp!8634 e!50180))))

(declare-fun mapKey!3234 () (_ BitVec 32))

(declare-fun mapValue!3234 () ValueCell!900)

(declare-fun mapRest!3234 () (Array (_ BitVec 32) ValueCell!900))

(assert (=> mapNonEmpty!3234 (= mapRest!3231 (store mapRest!3234 mapKey!3234 mapValue!3234))))

(assert (= (and mapNonEmpty!3231 condMapEmpty!3234) mapIsEmpty!3234))

(assert (= (and mapNonEmpty!3231 (not condMapEmpty!3234)) mapNonEmpty!3234))

(assert (= (and mapNonEmpty!3234 ((_ is ValueCellFull!900) mapValue!3234)) b!76881))

(assert (= (and mapNonEmpty!3231 ((_ is ValueCellFull!900) mapDefault!3234)) b!76882))

(declare-fun m!77083 () Bool)

(assert (=> mapNonEmpty!3234 m!77083))

(declare-fun b_lambda!3443 () Bool)

(assert (= b_lambda!3431 (or (and b!75990 b_free!2141) (and b!75980 b_free!2143 (= (defaultEntry!2247 newMap!16) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))))) b_lambda!3443)))

(declare-fun b_lambda!3445 () Bool)

(assert (= b_lambda!3435 (or (and b!75990 b_free!2141 (= (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) (defaultEntry!2247 newMap!16))) (and b!75980 b_free!2143) b_lambda!3445)))

(declare-fun b_lambda!3447 () Bool)

(assert (= b_lambda!3437 (or (and b!75990 b_free!2141 (= (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) (defaultEntry!2247 newMap!16))) (and b!75980 b_free!2143) b_lambda!3447)))

(declare-fun b_lambda!3449 () Bool)

(assert (= b_lambda!3433 (or (and b!75990 b_free!2141) (and b!75980 b_free!2143 (= (defaultEntry!2247 newMap!16) (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))))) b_lambda!3449)))

(declare-fun b_lambda!3451 () Bool)

(assert (= b_lambda!3439 (or (and b!75990 b_free!2141 (= (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) (defaultEntry!2247 newMap!16))) (and b!75980 b_free!2143) b_lambda!3451)))

(declare-fun b_lambda!3453 () Bool)

(assert (= b_lambda!3441 (or (and b!75990 b_free!2141 (= (defaultEntry!2247 (v!2559 (underlying!266 thiss!992))) (defaultEntry!2247 newMap!16))) (and b!75980 b_free!2143) b_lambda!3453)))

(check-sat (not bm!6972) (not b!76856) (not b!76441) (not bm!6960) (not b!76737) (not d!18339) (not b!76561) (not b!76748) (not b!76864) (not b_lambda!3449) (not bm!6983) (not d!18329) (not b!76837) (not b!76641) (not d!18175) (not b!76548) (not b!76673) (not b!76869) (not b!76688) (not b!76827) (not b!76505) (not b!76401) (not d!18353) (not b!76836) (not b_next!2141) (not bm!6927) (not b!76512) (not b!76439) (not b!76865) (not d!18253) (not d!18297) (not bm!6933) (not d!18209) (not b!76492) (not b_lambda!3443) (not b!76447) (not b!76602) (not d!18145) (not d!18223) (not d!18213) (not b!76529) (not b_next!2143) (not b!76773) (not b!76563) (not b!76833) (not bm!6969) (not b!76691) (not b!76462) (not bm!6958) (not b!76771) (not d!18187) (not b!76669) (not b!76435) (not b_lambda!3425) (not b!76518) (not d!18331) (not b!76662) (not b!76680) (not b!76682) (not d!18337) (not b!76649) (not b!76437) (not d!18169) (not b!76768) (not b_lambda!3417) (not d!18349) (not b!76478) (not bm!6935) (not b!76683) (not d!18267) (not b_lambda!3447) (not b!76843) (not b!76600) (not d!18251) (not b!76485) (not b!76740) (not b!76500) (not d!18275) (not d!18241) (not d!18233) (not bm!6977) (not b!76537) (not b!76463) (not b!76516) (not b!76495) (not b!76672) (not b!76655) (not d!18261) (not d!18293) (not b!76589) (not b!76823) (not d!18157) (not b!76772) (not b!76475) (not bm!6978) (not b!76646) (not b!76528) (not b!76592) (not d!18257) (not b_lambda!3445) (not b!76545) (not b!76718) (not d!18255) (not bm!6982) (not d!18167) (not d!18219) (not b!76860) (not b!76612) (not b!76721) (not b!76817) (not b!76667) (not b!76701) (not b!76464) (not d!18153) (not b!76652) (not bm!6953) (not bm!6948) (not b!76656) (not mapNonEmpty!3234) (not b!76523) (not bm!6929) (not b!76694) (not b!76384) (not b!76753) (not b!76849) (not b!76749) (not b!76690) (not d!18273) (not b!76466) (not b!76594) (not bm!6943) (not mapNonEmpty!3233) (not d!18271) (not b!76710) (not b_lambda!3429) (not b!76479) (not d!18307) (not d!18323) (not b!76866) (not b!76607) (not b!76498) (not b!76726) (not b!76434) (not d!18149) (not b!76609) (not b!76614) (not b!76382) (not d!18159) (not b!76489) (not d!18265) (not b!76582) (not d!18197) (not b!76496) (not d!18239) (not d!18225) (not b!76425) (not b!76468) (not bm!6942) (not b!76490) (not d!18195) (not b!76569) (not b!76695) (not d!18277) (not d!18319) (not b!76483) (not d!18333) (not bm!6921) (not b_lambda!3451) (not b_lambda!3453) (not bm!6980) (not d!18287) (not b!76557) (not b!76651) (not d!18205) (not b!76830) (not b!76855) (not b!76493) (not b!76644) (not bm!6971) (not d!18305) (not b!76809) (not d!18249) (not b!76720) (not d!18173) (not b!76461) (not d!18207) (not b!76465) (not d!18357) (not b!76685) (not bm!6932) (not d!18281) (not d!18335) (not b!76477) (not b!76724) (not b!76452) (not b!76480) (not d!18229) (not d!18235) (not d!18343) (not b!76536) (not b!76458) (not b!76539) (not d!18227) (not b!76769) tp_is_empty!2487 (not b!76643) (not d!18263) (not b!76728) (not b!76750) (not d!18321) (not bm!6973) (not b!76395) (not b!76445) (not b!76727) (not b!76825) (not b!76606) (not d!18259) (not b!76556) (not bm!6922) (not b!76591) (not d!18165) (not b!76764) (not b!76816) (not bm!6930) (not b!76438) (not d!18199) (not d!18295) (not d!18217) (not d!18193) (not bm!6924) (not b!76381) (not d!18181) (not bm!6920) (not b!76744) (not b!76820) (not b!76532) (not b!76765) b_and!4697 (not b!76566) (not b!76723) (not b!76877) (not bm!6925) (not d!18211) (not bm!6955) (not b!76455) (not d!18151) (not d!18161) (not d!18247) (not d!18327) (not d!18189) (not b!76509) (not d!18315) (not b!76567) (not b!76448) (not b!76616) (not d!18317) (not b!76813) (not bm!6947) (not b!76678) (not b!76739) (not b!76608) (not b!76558) (not b!76433) (not d!18301) (not b!76547) (not d!18245) (not b!76832) (not b!76487) (not d!18325) (not d!18171) (not d!18291) (not b!76871) (not d!18289) b_and!4695 (not b!76873) (not b!76565) (not b!76459) (not b!76722) (not b!76426) (not b!76853) (not b!76670) (not d!18155) (not b!76436) (not bm!6956) (not b_lambda!3427) (not bm!6917) (not d!18283) (not b!76402) (not bm!6944) (not b!76603) (not d!18143) (not b!76527) (not b!76432) (not d!18347) (not b!76725) (not b!76601) (not b!76507) (not b!76615) (not b!76519) (not b!76449) (not b!76552) (not b!76665) (not b!76541) (not b!76671) (not bm!6937) (not d!18243))
(check-sat b_and!4695 b_and!4697 (not b_next!2141) (not b_next!2143))
