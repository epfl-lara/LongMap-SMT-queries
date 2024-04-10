; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11062 () Bool)

(assert start!11062)

(declare-fun b!90125 () Bool)

(declare-fun b_free!2285 () Bool)

(declare-fun b_next!2285 () Bool)

(assert (=> b!90125 (= b_free!2285 (not b_next!2285))))

(declare-fun tp!9101 () Bool)

(declare-fun b_and!5423 () Bool)

(assert (=> b!90125 (= tp!9101 b_and!5423)))

(declare-fun b!90116 () Bool)

(declare-fun b_free!2287 () Bool)

(declare-fun b_next!2287 () Bool)

(assert (=> b!90116 (= b_free!2287 (not b_next!2287))))

(declare-fun tp!9099 () Bool)

(declare-fun b_and!5425 () Bool)

(assert (=> b!90116 (= tp!9099 b_and!5425)))

(declare-fun b!90109 () Bool)

(declare-fun e!58684 () Bool)

(declare-fun e!58686 () Bool)

(declare-fun mapRes!3492 () Bool)

(assert (=> b!90109 (= e!58684 (and e!58686 mapRes!3492))))

(declare-fun condMapEmpty!3491 () Bool)

(declare-datatypes ((V!3059 0))(
  ( (V!3060 (val!1324 Int)) )
))
(declare-datatypes ((array!4083 0))(
  ( (array!4084 (arr!1943 (Array (_ BitVec 32) (_ BitVec 64))) (size!2190 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!936 0))(
  ( (ValueCellFull!936 (v!2692 V!3059)) (EmptyCell!936) )
))
(declare-datatypes ((array!4085 0))(
  ( (array!4086 (arr!1944 (Array (_ BitVec 32) ValueCell!936)) (size!2191 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!780 0))(
  ( (LongMapFixedSize!781 (defaultEntry!2388 Int) (mask!6440 (_ BitVec 32)) (extraKeys!2219 (_ BitVec 32)) (zeroValue!2276 V!3059) (minValue!2276 V!3059) (_size!439 (_ BitVec 32)) (_keys!4068 array!4083) (_values!2371 array!4085) (_vacant!439 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!580 0))(
  ( (Cell!581 (v!2693 LongMapFixedSize!780)) )
))
(declare-datatypes ((LongMap!580 0))(
  ( (LongMap!581 (underlying!301 Cell!580)) )
))
(declare-fun thiss!992 () LongMap!580)

(declare-fun mapDefault!3492 () ValueCell!936)

(assert (=> b!90109 (= condMapEmpty!3491 (= (arr!1944 (_values!2371 (v!2693 (underlying!301 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!936)) mapDefault!3492)))))

(declare-fun res!46024 () Bool)

(declare-fun e!58691 () Bool)

(assert (=> start!11062 (=> (not res!46024) (not e!58691))))

(declare-fun valid!338 (LongMap!580) Bool)

(assert (=> start!11062 (= res!46024 (valid!338 thiss!992))))

(assert (=> start!11062 e!58691))

(declare-fun e!58694 () Bool)

(assert (=> start!11062 e!58694))

(assert (=> start!11062 true))

(declare-fun e!58688 () Bool)

(assert (=> start!11062 e!58688))

(declare-fun b!90110 () Bool)

(declare-fun e!58683 () Bool)

(assert (=> b!90110 (= e!58691 e!58683)))

(declare-fun res!46022 () Bool)

(assert (=> b!90110 (=> (not res!46022) (not e!58683))))

(declare-datatypes ((tuple2!2226 0))(
  ( (tuple2!2227 (_1!1124 (_ BitVec 64)) (_2!1124 V!3059)) )
))
(declare-datatypes ((List!1535 0))(
  ( (Nil!1532) (Cons!1531 (h!2123 tuple2!2226) (t!5321 List!1535)) )
))
(declare-datatypes ((ListLongMap!1479 0))(
  ( (ListLongMap!1480 (toList!755 List!1535)) )
))
(declare-fun lt!43497 () ListLongMap!1479)

(declare-fun lt!43508 () ListLongMap!1479)

(assert (=> b!90110 (= res!46022 (= lt!43497 lt!43508))))

(declare-fun newMap!16 () LongMapFixedSize!780)

(declare-fun map!1204 (LongMapFixedSize!780) ListLongMap!1479)

(assert (=> b!90110 (= lt!43508 (map!1204 newMap!16))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!447 (array!4083 array!4085 (_ BitVec 32) (_ BitVec 32) V!3059 V!3059 (_ BitVec 32) Int) ListLongMap!1479)

(assert (=> b!90110 (= lt!43497 (getCurrentListMap!447 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun mapNonEmpty!3491 () Bool)

(declare-fun tp!9100 () Bool)

(declare-fun e!58693 () Bool)

(assert (=> mapNonEmpty!3491 (= mapRes!3492 (and tp!9100 e!58693))))

(declare-fun mapKey!3492 () (_ BitVec 32))

(declare-fun mapValue!3492 () ValueCell!936)

(declare-fun mapRest!3491 () (Array (_ BitVec 32) ValueCell!936))

(assert (=> mapNonEmpty!3491 (= (arr!1944 (_values!2371 (v!2693 (underlying!301 thiss!992)))) (store mapRest!3491 mapKey!3492 mapValue!3492))))

(declare-fun b!90111 () Bool)

(declare-fun e!58687 () Bool)

(declare-fun tp_is_empty!2559 () Bool)

(assert (=> b!90111 (= e!58687 tp_is_empty!2559)))

(declare-fun b!90112 () Bool)

(declare-fun e!58682 () Bool)

(declare-fun e!58680 () Bool)

(assert (=> b!90112 (= e!58682 e!58680)))

(declare-fun res!46023 () Bool)

(assert (=> b!90112 (=> (not res!46023) (not e!58680))))

(declare-datatypes ((tuple2!2228 0))(
  ( (tuple2!2229 (_1!1125 Bool) (_2!1125 LongMapFixedSize!780)) )
))
(declare-fun lt!43502 () tuple2!2228)

(assert (=> b!90112 (= res!46023 (and (_1!1125 lt!43502) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2679 0))(
  ( (Unit!2680) )
))
(declare-fun lt!43499 () Unit!2679)

(declare-fun e!58692 () Unit!2679)

(assert (=> b!90112 (= lt!43499 e!58692)))

(declare-fun c!14978 () Bool)

(declare-fun contains!765 (ListLongMap!1479 (_ BitVec 64)) Bool)

(assert (=> b!90112 (= c!14978 (contains!765 lt!43508 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355)))))

(declare-fun lt!43491 () V!3059)

(declare-fun update!118 (LongMapFixedSize!780 (_ BitVec 64) V!3059) tuple2!2228)

(assert (=> b!90112 (= lt!43502 (update!118 newMap!16 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491))))

(declare-fun b!90113 () Bool)

(declare-fun e!58690 () Bool)

(assert (=> b!90113 (= e!58694 e!58690)))

(declare-fun b!90114 () Bool)

(assert (=> b!90114 (= e!58686 tp_is_empty!2559)))

(declare-fun b!90115 () Bool)

(declare-fun Unit!2681 () Unit!2679)

(assert (=> b!90115 (= e!58692 Unit!2681)))

(declare-fun e!58681 () Bool)

(declare-fun array_inv!1203 (array!4083) Bool)

(declare-fun array_inv!1204 (array!4085) Bool)

(assert (=> b!90116 (= e!58688 (and tp!9099 tp_is_empty!2559 (array_inv!1203 (_keys!4068 newMap!16)) (array_inv!1204 (_values!2371 newMap!16)) e!58681))))

(declare-fun mapIsEmpty!3491 () Bool)

(declare-fun mapRes!3491 () Bool)

(assert (=> mapIsEmpty!3491 mapRes!3491))

(declare-fun b!90117 () Bool)

(declare-fun res!46020 () Bool)

(assert (=> b!90117 (=> (not res!46020) (not e!58691))))

(declare-fun valid!339 (LongMapFixedSize!780) Bool)

(assert (=> b!90117 (= res!46020 (valid!339 newMap!16))))

(declare-fun b!90118 () Bool)

(declare-fun res!46021 () Bool)

(assert (=> b!90118 (=> (not res!46021) (not e!58691))))

(assert (=> b!90118 (= res!46021 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6440 newMap!16)) (_size!439 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun mapIsEmpty!3492 () Bool)

(assert (=> mapIsEmpty!3492 mapRes!3492))

(declare-fun b!90119 () Bool)

(declare-fun Unit!2682 () Unit!2679)

(assert (=> b!90119 (= e!58692 Unit!2682)))

(declare-fun lt!43505 () Unit!2679)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!72 (array!4083 array!4085 (_ BitVec 32) (_ BitVec 32) V!3059 V!3059 (_ BitVec 64) (_ BitVec 32) Int) Unit!2679)

(assert (=> b!90119 (= lt!43505 (lemmaListMapContainsThenArrayContainsFrom!72 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!90119 (arrayContainsKey!0 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!43498 () Unit!2679)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4083 (_ BitVec 32) (_ BitVec 32)) Unit!2679)

(assert (=> b!90119 (= lt!43498 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4068 (v!2693 (underlying!301 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1536 0))(
  ( (Nil!1533) (Cons!1532 (h!2124 (_ BitVec 64)) (t!5322 List!1536)) )
))
(declare-fun arrayNoDuplicates!0 (array!4083 (_ BitVec 32) List!1536) Bool)

(assert (=> b!90119 (arrayNoDuplicates!0 (_keys!4068 (v!2693 (underlying!301 thiss!992))) from!355 Nil!1533)))

(declare-fun lt!43493 () Unit!2679)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4083 (_ BitVec 32) (_ BitVec 64) List!1536) Unit!2679)

(assert (=> b!90119 (= lt!43493 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (Cons!1532 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) Nil!1533)))))

(assert (=> b!90119 false))

(declare-fun b!90120 () Bool)

(declare-fun e!58678 () Bool)

(assert (=> b!90120 (= e!58678 tp_is_empty!2559)))

(declare-fun b!90121 () Bool)

(assert (=> b!90121 (= e!58693 tp_is_empty!2559)))

(declare-fun b!90122 () Bool)

(declare-fun res!46025 () Bool)

(assert (=> b!90122 (=> (not res!46025) (not e!58691))))

(assert (=> b!90122 (= res!46025 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992)))))))))

(declare-fun b!90123 () Bool)

(assert (=> b!90123 (= e!58680 (not (valid!339 (_2!1125 lt!43502))))))

(declare-fun lt!43503 () tuple2!2226)

(declare-fun lt!43501 () tuple2!2226)

(declare-fun lt!43506 () ListLongMap!1479)

(declare-fun lt!43495 () ListLongMap!1479)

(declare-fun +!117 (ListLongMap!1479 tuple2!2226) ListLongMap!1479)

(assert (=> b!90123 (= (+!117 lt!43506 lt!43503) (+!117 (+!117 lt!43495 lt!43503) lt!43501))))

(assert (=> b!90123 (= lt!43503 (tuple2!2227 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2276 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun lt!43507 () Unit!2679)

(declare-fun addCommutativeForDiffKeys!36 (ListLongMap!1479 (_ BitVec 64) V!3059 (_ BitVec 64) V!3059) Unit!2679)

(assert (=> b!90123 (= lt!43507 (addCommutativeForDiffKeys!36 lt!43495 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2276 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun lt!43496 () ListLongMap!1479)

(assert (=> b!90123 (= lt!43496 lt!43506)))

(assert (=> b!90123 (= lt!43506 (+!117 lt!43495 lt!43501))))

(declare-fun lt!43504 () ListLongMap!1479)

(declare-fun lt!43494 () tuple2!2226)

(assert (=> b!90123 (= lt!43496 (+!117 lt!43504 lt!43494))))

(declare-fun lt!43492 () ListLongMap!1479)

(assert (=> b!90123 (= lt!43495 (+!117 lt!43492 lt!43494))))

(assert (=> b!90123 (= lt!43494 (tuple2!2227 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2276 (v!2693 (underlying!301 thiss!992)))))))

(assert (=> b!90123 (= lt!43504 (+!117 lt!43492 lt!43501))))

(assert (=> b!90123 (= lt!43501 (tuple2!2227 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491))))

(declare-fun lt!43500 () Unit!2679)

(assert (=> b!90123 (= lt!43500 (addCommutativeForDiffKeys!36 lt!43492 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2276 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!82 (array!4083 array!4085 (_ BitVec 32) (_ BitVec 32) V!3059 V!3059 (_ BitVec 32) Int) ListLongMap!1479)

(assert (=> b!90123 (= lt!43492 (getCurrentListMapNoExtraKeys!82 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun b!90124 () Bool)

(assert (=> b!90124 (= e!58683 e!58682)))

(declare-fun res!46026 () Bool)

(assert (=> b!90124 (=> (not res!46026) (not e!58682))))

(assert (=> b!90124 (= res!46026 (and (not (= (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1218 (ValueCell!936 V!3059) V!3059)

(declare-fun dynLambda!347 (Int (_ BitVec 64)) V!3059)

(assert (=> b!90124 (= lt!43491 (get!1218 (select (arr!1944 (_values!2371 (v!2693 (underlying!301 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!3492 () Bool)

(declare-fun tp!9102 () Bool)

(assert (=> mapNonEmpty!3492 (= mapRes!3491 (and tp!9102 e!58687))))

(declare-fun mapKey!3491 () (_ BitVec 32))

(declare-fun mapValue!3491 () ValueCell!936)

(declare-fun mapRest!3492 () (Array (_ BitVec 32) ValueCell!936))

(assert (=> mapNonEmpty!3492 (= (arr!1944 (_values!2371 newMap!16)) (store mapRest!3492 mapKey!3491 mapValue!3491))))

(declare-fun e!58679 () Bool)

(assert (=> b!90125 (= e!58679 (and tp!9101 tp_is_empty!2559 (array_inv!1203 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (array_inv!1204 (_values!2371 (v!2693 (underlying!301 thiss!992)))) e!58684))))

(declare-fun b!90126 () Bool)

(assert (=> b!90126 (= e!58690 e!58679)))

(declare-fun b!90127 () Bool)

(assert (=> b!90127 (= e!58681 (and e!58678 mapRes!3491))))

(declare-fun condMapEmpty!3492 () Bool)

(declare-fun mapDefault!3491 () ValueCell!936)

(assert (=> b!90127 (= condMapEmpty!3492 (= (arr!1944 (_values!2371 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!936)) mapDefault!3491)))))

(assert (= (and start!11062 res!46024) b!90122))

(assert (= (and b!90122 res!46025) b!90117))

(assert (= (and b!90117 res!46020) b!90118))

(assert (= (and b!90118 res!46021) b!90110))

(assert (= (and b!90110 res!46022) b!90124))

(assert (= (and b!90124 res!46026) b!90112))

(assert (= (and b!90112 c!14978) b!90119))

(assert (= (and b!90112 (not c!14978)) b!90115))

(assert (= (and b!90112 res!46023) b!90123))

(assert (= (and b!90109 condMapEmpty!3491) mapIsEmpty!3492))

(assert (= (and b!90109 (not condMapEmpty!3491)) mapNonEmpty!3491))

(get-info :version)

(assert (= (and mapNonEmpty!3491 ((_ is ValueCellFull!936) mapValue!3492)) b!90121))

(assert (= (and b!90109 ((_ is ValueCellFull!936) mapDefault!3492)) b!90114))

(assert (= b!90125 b!90109))

(assert (= b!90126 b!90125))

(assert (= b!90113 b!90126))

(assert (= start!11062 b!90113))

(assert (= (and b!90127 condMapEmpty!3492) mapIsEmpty!3491))

(assert (= (and b!90127 (not condMapEmpty!3492)) mapNonEmpty!3492))

(assert (= (and mapNonEmpty!3492 ((_ is ValueCellFull!936) mapValue!3491)) b!90111))

(assert (= (and b!90127 ((_ is ValueCellFull!936) mapDefault!3491)) b!90120))

(assert (= b!90116 b!90127))

(assert (= start!11062 b!90116))

(declare-fun b_lambda!3981 () Bool)

(assert (=> (not b_lambda!3981) (not b!90124)))

(declare-fun t!5318 () Bool)

(declare-fun tb!1753 () Bool)

(assert (=> (and b!90125 (= (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))) t!5318) tb!1753))

(declare-fun result!3007 () Bool)

(assert (=> tb!1753 (= result!3007 tp_is_empty!2559)))

(assert (=> b!90124 t!5318))

(declare-fun b_and!5427 () Bool)

(assert (= b_and!5423 (and (=> t!5318 result!3007) b_and!5427)))

(declare-fun t!5320 () Bool)

(declare-fun tb!1755 () Bool)

(assert (=> (and b!90116 (= (defaultEntry!2388 newMap!16) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))) t!5320) tb!1755))

(declare-fun result!3011 () Bool)

(assert (= result!3011 result!3007))

(assert (=> b!90124 t!5320))

(declare-fun b_and!5429 () Bool)

(assert (= b_and!5425 (and (=> t!5320 result!3011) b_and!5429)))

(declare-fun m!96889 () Bool)

(assert (=> b!90125 m!96889))

(declare-fun m!96891 () Bool)

(assert (=> b!90125 m!96891))

(declare-fun m!96893 () Bool)

(assert (=> mapNonEmpty!3492 m!96893))

(declare-fun m!96895 () Bool)

(assert (=> b!90124 m!96895))

(declare-fun m!96897 () Bool)

(assert (=> b!90124 m!96897))

(declare-fun m!96899 () Bool)

(assert (=> b!90124 m!96899))

(assert (=> b!90124 m!96897))

(assert (=> b!90124 m!96899))

(declare-fun m!96901 () Bool)

(assert (=> b!90124 m!96901))

(declare-fun m!96903 () Bool)

(assert (=> b!90117 m!96903))

(declare-fun m!96905 () Bool)

(assert (=> b!90116 m!96905))

(declare-fun m!96907 () Bool)

(assert (=> b!90116 m!96907))

(declare-fun m!96909 () Bool)

(assert (=> mapNonEmpty!3491 m!96909))

(declare-fun m!96911 () Bool)

(assert (=> b!90110 m!96911))

(declare-fun m!96913 () Bool)

(assert (=> b!90110 m!96913))

(declare-fun m!96915 () Bool)

(assert (=> start!11062 m!96915))

(declare-fun m!96917 () Bool)

(assert (=> b!90123 m!96917))

(declare-fun m!96919 () Bool)

(assert (=> b!90123 m!96919))

(assert (=> b!90123 m!96895))

(declare-fun m!96921 () Bool)

(assert (=> b!90123 m!96921))

(declare-fun m!96923 () Bool)

(assert (=> b!90123 m!96923))

(declare-fun m!96925 () Bool)

(assert (=> b!90123 m!96925))

(assert (=> b!90123 m!96895))

(declare-fun m!96927 () Bool)

(assert (=> b!90123 m!96927))

(declare-fun m!96929 () Bool)

(assert (=> b!90123 m!96929))

(declare-fun m!96931 () Bool)

(assert (=> b!90123 m!96931))

(assert (=> b!90123 m!96895))

(declare-fun m!96933 () Bool)

(assert (=> b!90123 m!96933))

(declare-fun m!96935 () Bool)

(assert (=> b!90123 m!96935))

(declare-fun m!96937 () Bool)

(assert (=> b!90123 m!96937))

(assert (=> b!90123 m!96935))

(declare-fun m!96939 () Bool)

(assert (=> b!90119 m!96939))

(declare-fun m!96941 () Bool)

(assert (=> b!90119 m!96941))

(assert (=> b!90119 m!96895))

(declare-fun m!96943 () Bool)

(assert (=> b!90119 m!96943))

(assert (=> b!90119 m!96895))

(assert (=> b!90119 m!96895))

(declare-fun m!96945 () Bool)

(assert (=> b!90119 m!96945))

(assert (=> b!90119 m!96895))

(declare-fun m!96947 () Bool)

(assert (=> b!90119 m!96947))

(assert (=> b!90112 m!96895))

(assert (=> b!90112 m!96895))

(declare-fun m!96949 () Bool)

(assert (=> b!90112 m!96949))

(assert (=> b!90112 m!96895))

(declare-fun m!96951 () Bool)

(assert (=> b!90112 m!96951))

(check-sat (not b!90123) (not b!90125) (not mapNonEmpty!3491) b_and!5429 (not b_next!2285) b_and!5427 (not b!90119) (not b!90117) (not b!90112) (not start!11062) (not b!90110) (not b_lambda!3981) tp_is_empty!2559 (not mapNonEmpty!3492) (not b!90116) (not b_next!2287) (not b!90124))
(check-sat b_and!5427 b_and!5429 (not b_next!2285) (not b_next!2287))
(get-model)

(declare-fun b_lambda!3985 () Bool)

(assert (= b_lambda!3981 (or (and b!90125 b_free!2285) (and b!90116 b_free!2287 (= (defaultEntry!2388 newMap!16) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))))) b_lambda!3985)))

(check-sat (not b!90123) (not b!90125) (not mapNonEmpty!3491) b_and!5429 (not b_next!2285) b_and!5427 (not b!90119) (not b!90117) (not b!90112) (not b_lambda!3985) (not start!11062) (not b!90110) tp_is_empty!2559 (not mapNonEmpty!3492) (not b!90116) (not b_next!2287) (not b!90124))
(check-sat b_and!5427 b_and!5429 (not b_next!2285) (not b_next!2287))
(get-model)

(declare-fun d!23993 () Bool)

(declare-fun res!46054 () Bool)

(declare-fun e!58748 () Bool)

(assert (=> d!23993 (=> (not res!46054) (not e!58748))))

(declare-fun simpleValid!61 (LongMapFixedSize!780) Bool)

(assert (=> d!23993 (= res!46054 (simpleValid!61 newMap!16))))

(assert (=> d!23993 (= (valid!339 newMap!16) e!58748)))

(declare-fun b!90195 () Bool)

(declare-fun res!46055 () Bool)

(assert (=> b!90195 (=> (not res!46055) (not e!58748))))

(declare-fun arrayCountValidKeys!0 (array!4083 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!90195 (= res!46055 (= (arrayCountValidKeys!0 (_keys!4068 newMap!16) #b00000000000000000000000000000000 (size!2190 (_keys!4068 newMap!16))) (_size!439 newMap!16)))))

(declare-fun b!90196 () Bool)

(declare-fun res!46056 () Bool)

(assert (=> b!90196 (=> (not res!46056) (not e!58748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4083 (_ BitVec 32)) Bool)

(assert (=> b!90196 (= res!46056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4068 newMap!16) (mask!6440 newMap!16)))))

(declare-fun b!90197 () Bool)

(assert (=> b!90197 (= e!58748 (arrayNoDuplicates!0 (_keys!4068 newMap!16) #b00000000000000000000000000000000 Nil!1533))))

(assert (= (and d!23993 res!46054) b!90195))

(assert (= (and b!90195 res!46055) b!90196))

(assert (= (and b!90196 res!46056) b!90197))

(declare-fun m!97017 () Bool)

(assert (=> d!23993 m!97017))

(declare-fun m!97019 () Bool)

(assert (=> b!90195 m!97019))

(declare-fun m!97021 () Bool)

(assert (=> b!90196 m!97021))

(declare-fun m!97023 () Bool)

(assert (=> b!90197 m!97023))

(assert (=> b!90117 d!23993))

(declare-fun d!23995 () Bool)

(assert (=> d!23995 (= (valid!338 thiss!992) (valid!339 (v!2693 (underlying!301 thiss!992))))))

(declare-fun bs!3780 () Bool)

(assert (= bs!3780 d!23995))

(declare-fun m!97025 () Bool)

(assert (=> bs!3780 m!97025))

(assert (=> start!11062 d!23995))

(declare-fun d!23997 () Bool)

(assert (=> d!23997 (= (array_inv!1203 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvsge (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!90125 d!23997))

(declare-fun d!23999 () Bool)

(assert (=> d!23999 (= (array_inv!1204 (_values!2371 (v!2693 (underlying!301 thiss!992)))) (bvsge (size!2191 (_values!2371 (v!2693 (underlying!301 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!90125 d!23999))

(declare-fun d!24001 () Bool)

(declare-fun e!58753 () Bool)

(assert (=> d!24001 e!58753))

(declare-fun res!46059 () Bool)

(assert (=> d!24001 (=> res!46059 e!58753)))

(declare-fun lt!43572 () Bool)

(assert (=> d!24001 (= res!46059 (not lt!43572))))

(declare-fun lt!43573 () Bool)

(assert (=> d!24001 (= lt!43572 lt!43573)))

(declare-fun lt!43571 () Unit!2679)

(declare-fun e!58754 () Unit!2679)

(assert (=> d!24001 (= lt!43571 e!58754)))

(declare-fun c!14984 () Bool)

(assert (=> d!24001 (= c!14984 lt!43573)))

(declare-fun containsKey!147 (List!1535 (_ BitVec 64)) Bool)

(assert (=> d!24001 (= lt!43573 (containsKey!147 (toList!755 lt!43508) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355)))))

(assert (=> d!24001 (= (contains!765 lt!43508 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355)) lt!43572)))

(declare-fun b!90204 () Bool)

(declare-fun lt!43574 () Unit!2679)

(assert (=> b!90204 (= e!58754 lt!43574)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!95 (List!1535 (_ BitVec 64)) Unit!2679)

(assert (=> b!90204 (= lt!43574 (lemmaContainsKeyImpliesGetValueByKeyDefined!95 (toList!755 lt!43508) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355)))))

(declare-datatypes ((Option!149 0))(
  ( (Some!148 (v!2697 V!3059)) (None!147) )
))
(declare-fun isDefined!96 (Option!149) Bool)

(declare-fun getValueByKey!143 (List!1535 (_ BitVec 64)) Option!149)

(assert (=> b!90204 (isDefined!96 (getValueByKey!143 (toList!755 lt!43508) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355)))))

(declare-fun b!90205 () Bool)

(declare-fun Unit!2683 () Unit!2679)

(assert (=> b!90205 (= e!58754 Unit!2683)))

(declare-fun b!90206 () Bool)

(assert (=> b!90206 (= e!58753 (isDefined!96 (getValueByKey!143 (toList!755 lt!43508) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355))))))

(assert (= (and d!24001 c!14984) b!90204))

(assert (= (and d!24001 (not c!14984)) b!90205))

(assert (= (and d!24001 (not res!46059)) b!90206))

(assert (=> d!24001 m!96895))

(declare-fun m!97027 () Bool)

(assert (=> d!24001 m!97027))

(assert (=> b!90204 m!96895))

(declare-fun m!97029 () Bool)

(assert (=> b!90204 m!97029))

(assert (=> b!90204 m!96895))

(declare-fun m!97031 () Bool)

(assert (=> b!90204 m!97031))

(assert (=> b!90204 m!97031))

(declare-fun m!97033 () Bool)

(assert (=> b!90204 m!97033))

(assert (=> b!90206 m!96895))

(assert (=> b!90206 m!97031))

(assert (=> b!90206 m!97031))

(assert (=> b!90206 m!97033))

(assert (=> b!90112 d!24001))

(declare-fun bm!8774 () Bool)

(declare-fun call!8789 () Bool)

(declare-fun call!8783 () Bool)

(assert (=> bm!8774 (= call!8789 call!8783)))

(declare-fun b!90287 () Bool)

(declare-fun res!46101 () Bool)

(declare-fun e!58817 () Bool)

(assert (=> b!90287 (=> (not res!46101) (not e!58817))))

(declare-datatypes ((SeekEntryResult!246 0))(
  ( (MissingZero!246 (index!3124 (_ BitVec 32))) (Found!246 (index!3125 (_ BitVec 32))) (Intermediate!246 (undefined!1058 Bool) (index!3126 (_ BitVec 32)) (x!12335 (_ BitVec 32))) (Undefined!246) (MissingVacant!246 (index!3127 (_ BitVec 32))) )
))
(declare-fun lt!43649 () SeekEntryResult!246)

(assert (=> b!90287 (= res!46101 (= (select (arr!1943 (_keys!4068 newMap!16)) (index!3124 lt!43649)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!58813 () Bool)

(declare-fun b!90288 () Bool)

(declare-fun lt!43646 () SeekEntryResult!246)

(assert (=> b!90288 (= e!58813 (= (select (arr!1943 (_keys!4068 newMap!16)) (index!3125 lt!43646)) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355)))))

(declare-fun bm!8776 () Bool)

(declare-fun call!8787 () Bool)

(declare-fun call!8793 () Bool)

(assert (=> bm!8776 (= call!8787 call!8793)))

(declare-fun b!90289 () Bool)

(declare-fun e!58816 () tuple2!2228)

(declare-fun e!58802 () tuple2!2228)

(assert (=> b!90289 (= e!58816 e!58802)))

(declare-fun c!15018 () Bool)

(declare-fun lt!43652 () SeekEntryResult!246)

(assert (=> b!90289 (= c!15018 ((_ is MissingZero!246) lt!43652))))

(declare-fun bm!8777 () Bool)

(assert (=> bm!8777 (= call!8793 (arrayContainsKey!0 (_keys!4068 newMap!16) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!90290 () Bool)

(declare-fun e!58808 () Bool)

(declare-fun e!58811 () Bool)

(assert (=> b!90290 (= e!58808 e!58811)))

(declare-fun c!15015 () Bool)

(declare-fun lt!43638 () tuple2!2228)

(assert (=> b!90290 (= c!15015 (_1!1125 lt!43638))))

(declare-fun call!8779 () SeekEntryResult!246)

(declare-fun bm!8778 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4083 (_ BitVec 32)) SeekEntryResult!246)

(assert (=> bm!8778 (= call!8779 (seekEntryOrOpen!0 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (_keys!4068 newMap!16) (mask!6440 newMap!16)))))

(declare-fun b!90291 () Bool)

(declare-fun lt!43654 () Unit!2679)

(declare-fun e!58798 () Unit!2679)

(assert (=> b!90291 (= lt!43654 e!58798)))

(declare-fun c!15021 () Bool)

(declare-fun call!8797 () Bool)

(assert (=> b!90291 (= c!15021 call!8797)))

(declare-fun e!58803 () tuple2!2228)

(assert (=> b!90291 (= e!58803 (tuple2!2229 false newMap!16))))

(declare-fun b!90292 () Bool)

(declare-fun Unit!2684 () Unit!2679)

(assert (=> b!90292 (= e!58798 Unit!2684)))

(declare-fun lt!43647 () Unit!2679)

(declare-fun call!8792 () Unit!2679)

(assert (=> b!90292 (= lt!43647 call!8792)))

(declare-fun lt!43633 () SeekEntryResult!246)

(declare-fun call!8795 () SeekEntryResult!246)

(assert (=> b!90292 (= lt!43633 call!8795)))

(declare-fun res!46093 () Bool)

(assert (=> b!90292 (= res!46093 ((_ is Found!246) lt!43633))))

(declare-fun e!58814 () Bool)

(assert (=> b!90292 (=> (not res!46093) (not e!58814))))

(assert (=> b!90292 e!58814))

(declare-fun lt!43653 () Unit!2679)

(assert (=> b!90292 (= lt!43653 lt!43647)))

(assert (=> b!90292 false))

(declare-fun bm!8779 () Bool)

(declare-fun call!8788 () Bool)

(declare-fun call!8798 () Bool)

(assert (=> bm!8779 (= call!8788 call!8798)))

(declare-fun b!90293 () Bool)

(declare-fun res!46098 () Bool)

(assert (=> b!90293 (= res!46098 call!8798)))

(assert (=> b!90293 (=> (not res!46098) (not e!58814))))

(declare-fun b!90294 () Bool)

(declare-fun e!58806 () tuple2!2228)

(assert (=> b!90294 (= e!58806 e!58803)))

(assert (=> b!90294 (= lt!43652 (seekEntryOrOpen!0 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (_keys!4068 newMap!16) (mask!6440 newMap!16)))))

(declare-fun c!15011 () Bool)

(assert (=> b!90294 (= c!15011 ((_ is Undefined!246) lt!43652))))

(declare-fun lt!43635 () (_ BitVec 32))

(declare-fun call!8791 () ListLongMap!1479)

(declare-fun bm!8780 () Bool)

(declare-fun lt!43629 () array!4085)

(declare-fun c!15020 () Bool)

(declare-fun c!15012 () Bool)

(assert (=> bm!8780 (= call!8791 (getCurrentListMap!447 (_keys!4068 newMap!16) (ite (or c!15012 c!15011) (_values!2371 newMap!16) lt!43629) (mask!6440 newMap!16) (ite (and c!15012 c!15020) lt!43635 (extraKeys!2219 newMap!16)) (ite (and c!15012 c!15020) lt!43491 (zeroValue!2276 newMap!16)) (minValue!2276 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2388 newMap!16)))))

(declare-fun b!90295 () Bool)

(declare-fun e!58797 () Bool)

(declare-fun lt!43637 () SeekEntryResult!246)

(assert (=> b!90295 (= e!58797 ((_ is Undefined!246) lt!43637))))

(declare-fun b!90296 () Bool)

(declare-fun res!46092 () Bool)

(assert (=> b!90296 (= res!46092 (= (select (arr!1943 (_keys!4068 newMap!16)) (index!3127 lt!43649)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!58809 () Bool)

(assert (=> b!90296 (=> (not res!46092) (not e!58809))))

(declare-fun b!90297 () Bool)

(declare-fun e!58800 () Bool)

(assert (=> b!90297 (= e!58800 ((_ is Undefined!246) lt!43649))))

(declare-fun call!8786 () ListLongMap!1479)

(declare-fun call!8785 () ListLongMap!1479)

(declare-fun bm!8781 () Bool)

(declare-fun call!8777 () ListLongMap!1479)

(declare-fun call!8781 () ListLongMap!1479)

(assert (=> bm!8781 (= call!8786 (+!117 (ite c!15012 (ite c!15020 call!8785 call!8777) call!8781) (ite c!15012 (ite c!15020 (tuple2!2227 #b0000000000000000000000000000000000000000000000000000000000000000 lt!43491) (tuple2!2227 #b1000000000000000000000000000000000000000000000000000000000000000 lt!43491)) (tuple2!2227 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491))))))

(declare-fun b!90298 () Bool)

(declare-fun e!58804 () Unit!2679)

(declare-fun Unit!2685 () Unit!2679)

(assert (=> b!90298 (= e!58804 Unit!2685)))

(declare-fun lt!43648 () Unit!2679)

(declare-fun call!8782 () Unit!2679)

(assert (=> b!90298 (= lt!43648 call!8782)))

(declare-fun call!8800 () SeekEntryResult!246)

(assert (=> b!90298 (= lt!43637 call!8800)))

(declare-fun c!15013 () Bool)

(assert (=> b!90298 (= c!15013 ((_ is MissingZero!246) lt!43637))))

(declare-fun e!58812 () Bool)

(assert (=> b!90298 e!58812))

(declare-fun lt!43640 () Unit!2679)

(assert (=> b!90298 (= lt!43640 lt!43648)))

(assert (=> b!90298 false))

(declare-fun b!90299 () Bool)

(declare-fun lt!43651 () Unit!2679)

(declare-fun lt!43643 () Unit!2679)

(assert (=> b!90299 (= lt!43651 lt!43643)))

(declare-fun call!8794 () ListLongMap!1479)

(assert (=> b!90299 (= call!8794 call!8777)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!34 (array!4083 array!4085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3059 V!3059 V!3059 Int) Unit!2679)

(assert (=> b!90299 (= lt!43643 (lemmaChangeZeroKeyThenAddPairToListMap!34 (_keys!4068 newMap!16) (_values!2371 newMap!16) (mask!6440 newMap!16) (extraKeys!2219 newMap!16) lt!43635 (zeroValue!2276 newMap!16) lt!43491 (minValue!2276 newMap!16) (defaultEntry!2388 newMap!16)))))

(assert (=> b!90299 (= lt!43635 (bvor (extraKeys!2219 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!58801 () tuple2!2228)

(assert (=> b!90299 (= e!58801 (tuple2!2229 true (LongMapFixedSize!781 (defaultEntry!2388 newMap!16) (mask!6440 newMap!16) (bvor (extraKeys!2219 newMap!16) #b00000000000000000000000000000001) lt!43491 (minValue!2276 newMap!16) (_size!439 newMap!16) (_keys!4068 newMap!16) (_values!2371 newMap!16) (_vacant!439 newMap!16))))))

(declare-fun bm!8782 () Bool)

(declare-fun c!15022 () Bool)

(assert (=> bm!8782 (= c!15022 c!15011)))

(declare-fun e!58799 () ListLongMap!1479)

(assert (=> bm!8782 (= call!8797 (contains!765 e!58799 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355)))))

(declare-fun call!8799 () tuple2!2228)

(declare-fun c!15023 () Bool)

(declare-fun bm!8783 () Bool)

(declare-fun updateHelperNewKey!34 (LongMapFixedSize!780 (_ BitVec 64) V!3059 (_ BitVec 32)) tuple2!2228)

(assert (=> bm!8783 (= call!8799 (updateHelperNewKey!34 newMap!16 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491 (ite c!15023 (index!3127 lt!43652) (index!3124 lt!43652))))))

(declare-fun bm!8784 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!34 (array!4083 array!4085 (_ BitVec 32) (_ BitVec 32) V!3059 V!3059 (_ BitVec 64) Int) Unit!2679)

(assert (=> bm!8784 (= call!8792 (lemmaInListMapThenSeekEntryOrOpenFindsIt!34 (_keys!4068 newMap!16) (_values!2371 newMap!16) (mask!6440 newMap!16) (extraKeys!2219 newMap!16) (zeroValue!2276 newMap!16) (minValue!2276 newMap!16) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (defaultEntry!2388 newMap!16)))))

(declare-fun b!90300 () Bool)

(declare-fun e!58805 () Bool)

(assert (=> b!90300 (= e!58797 e!58805)))

(declare-fun res!46089 () Bool)

(assert (=> b!90300 (= res!46089 call!8789)))

(assert (=> b!90300 (=> (not res!46089) (not e!58805))))

(declare-fun call!8780 () ListLongMap!1479)

(declare-fun e!58807 () Bool)

(declare-fun b!90301 () Bool)

(declare-fun call!8796 () ListLongMap!1479)

(assert (=> b!90301 (= e!58807 (= call!8796 (+!117 call!8780 (tuple2!2227 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491))))))

(declare-fun b!90302 () Bool)

(assert (=> b!90302 (= c!15023 ((_ is MissingVacant!246) lt!43652))))

(assert (=> b!90302 (= e!58803 e!58816)))

(declare-fun b!90303 () Bool)

(assert (=> b!90303 (= e!58799 call!8781)))

(declare-fun bm!8785 () Bool)

(assert (=> bm!8785 (= call!8780 (map!1204 newMap!16))))

(declare-fun lt!43641 () (_ BitVec 32))

(declare-fun bm!8786 () Bool)

(assert (=> bm!8786 (= call!8781 (getCurrentListMap!447 (_keys!4068 newMap!16) (_values!2371 newMap!16) (mask!6440 newMap!16) (ite c!15012 (ite c!15020 (extraKeys!2219 newMap!16) lt!43641) (extraKeys!2219 newMap!16)) (zeroValue!2276 newMap!16) (ite c!15012 (ite c!15020 (minValue!2276 newMap!16) lt!43491) (minValue!2276 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2388 newMap!16)))))

(declare-fun bm!8787 () Bool)

(assert (=> bm!8787 (= call!8777 call!8791)))

(declare-fun bm!8788 () Bool)

(assert (=> bm!8788 (= call!8800 call!8779)))

(declare-fun b!90304 () Bool)

(declare-fun res!46096 () Bool)

(declare-fun e!58815 () Bool)

(assert (=> b!90304 (=> (not res!46096) (not e!58815))))

(assert (=> b!90304 (= res!46096 (= (select (arr!1943 (_keys!4068 newMap!16)) (index!3124 lt!43637)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!90305 () Bool)

(declare-fun lt!43655 () tuple2!2228)

(assert (=> b!90305 (= e!58816 (tuple2!2229 (_1!1125 lt!43655) (_2!1125 lt!43655)))))

(assert (=> b!90305 (= lt!43655 call!8799)))

(declare-fun bm!8789 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!34 (array!4083 array!4085 (_ BitVec 32) (_ BitVec 32) V!3059 V!3059 (_ BitVec 64) Int) Unit!2679)

(assert (=> bm!8789 (= call!8782 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!34 (_keys!4068 newMap!16) (_values!2371 newMap!16) (mask!6440 newMap!16) (extraKeys!2219 newMap!16) (zeroValue!2276 newMap!16) (minValue!2276 newMap!16) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (defaultEntry!2388 newMap!16)))))

(declare-fun bm!8790 () Bool)

(assert (=> bm!8790 (= call!8796 (map!1204 (_2!1125 lt!43638)))))

(declare-fun b!90306 () Bool)

(assert (=> b!90306 (= e!58814 (= (select (arr!1943 (_keys!4068 newMap!16)) (index!3125 lt!43633)) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355)))))

(declare-fun bm!8791 () Bool)

(declare-fun c!15019 () Bool)

(declare-fun call!8790 () Bool)

(declare-fun c!15014 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!8791 (= call!8790 (inRange!0 (ite c!15011 (ite c!15021 (index!3125 lt!43633) (ite c!15019 (index!3124 lt!43649) (index!3127 lt!43649))) (ite c!15014 (index!3125 lt!43646) (ite c!15013 (index!3124 lt!43637) (index!3127 lt!43637)))) (mask!6440 newMap!16)))))

(declare-fun bm!8792 () Bool)

(declare-fun call!8778 () ListLongMap!1479)

(assert (=> bm!8792 (= call!8778 call!8791)))

(declare-fun b!90307 () Bool)

(declare-fun c!15016 () Bool)

(assert (=> b!90307 (= c!15016 ((_ is MissingVacant!246) lt!43649))))

(declare-fun e!58810 () Bool)

(assert (=> b!90307 (= e!58810 e!58800)))

(declare-fun b!90308 () Bool)

(declare-fun call!8784 () Bool)

(assert (=> b!90308 (= e!58815 (not call!8784))))

(declare-fun bm!8793 () Bool)

(assert (=> bm!8793 (= call!8795 call!8779)))

(declare-fun b!90309 () Bool)

(declare-fun res!46099 () Bool)

(assert (=> b!90309 (=> (not res!46099) (not e!58817))))

(assert (=> b!90309 (= res!46099 call!8788)))

(assert (=> b!90309 (= e!58810 e!58817)))

(declare-fun d!24003 () Bool)

(assert (=> d!24003 e!58808))

(declare-fun res!46095 () Bool)

(assert (=> d!24003 (=> (not res!46095) (not e!58808))))

(assert (=> d!24003 (= res!46095 (valid!339 (_2!1125 lt!43638)))))

(assert (=> d!24003 (= lt!43638 e!58806)))

(assert (=> d!24003 (= c!15012 (= (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (bvneg (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355))))))

(assert (=> d!24003 (valid!339 newMap!16)))

(assert (=> d!24003 (= (update!118 newMap!16 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491) lt!43638)))

(declare-fun bm!8775 () Bool)

(assert (=> bm!8775 (= call!8784 call!8793)))

(declare-fun bm!8794 () Bool)

(assert (=> bm!8794 (= call!8783 call!8790)))

(declare-fun b!90310 () Bool)

(assert (=> b!90310 (= e!58811 (= call!8796 call!8780))))

(declare-fun b!90311 () Bool)

(assert (=> b!90311 (= e!58811 e!58807)))

(declare-fun res!46090 () Bool)

(assert (=> b!90311 (= res!46090 (contains!765 call!8796 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355)))))

(assert (=> b!90311 (=> (not res!46090) (not e!58807))))

(declare-fun b!90312 () Bool)

(declare-fun lt!43636 () Unit!2679)

(assert (=> b!90312 (= e!58804 lt!43636)))

(assert (=> b!90312 (= lt!43636 call!8792)))

(assert (=> b!90312 (= lt!43646 call!8800)))

(declare-fun res!46094 () Bool)

(assert (=> b!90312 (= res!46094 ((_ is Found!246) lt!43646))))

(assert (=> b!90312 (=> (not res!46094) (not e!58813))))

(assert (=> b!90312 e!58813))

(declare-fun b!90313 () Bool)

(assert (=> b!90313 (= e!58817 (not call!8787))))

(declare-fun b!90314 () Bool)

(declare-fun c!15017 () Bool)

(assert (=> b!90314 (= c!15017 ((_ is MissingVacant!246) lt!43637))))

(assert (=> b!90314 (= e!58812 e!58797)))

(declare-fun b!90315 () Bool)

(assert (=> b!90315 (= e!58806 e!58801)))

(assert (=> b!90315 (= c!15020 (= (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8795 () Bool)

(assert (=> bm!8795 (= call!8798 call!8790)))

(declare-fun b!90316 () Bool)

(assert (=> b!90316 (= e!58799 call!8778)))

(declare-fun bm!8796 () Bool)

(assert (=> bm!8796 (= call!8785 call!8781)))

(declare-fun b!90317 () Bool)

(assert (=> b!90317 (= e!58809 (not call!8787))))

(declare-fun b!90318 () Bool)

(declare-fun lt!43650 () Unit!2679)

(assert (=> b!90318 (= e!58798 lt!43650)))

(assert (=> b!90318 (= lt!43650 call!8782)))

(assert (=> b!90318 (= lt!43649 call!8795)))

(assert (=> b!90318 (= c!15019 ((_ is MissingZero!246) lt!43649))))

(assert (=> b!90318 e!58810))

(declare-fun b!90319 () Bool)

(declare-fun lt!43630 () Unit!2679)

(declare-fun lt!43632 () Unit!2679)

(assert (=> b!90319 (= lt!43630 lt!43632)))

(assert (=> b!90319 (= call!8794 call!8785)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!34 (array!4083 array!4085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3059 V!3059 V!3059 Int) Unit!2679)

(assert (=> b!90319 (= lt!43632 (lemmaChangeLongMinValueKeyThenAddPairToListMap!34 (_keys!4068 newMap!16) (_values!2371 newMap!16) (mask!6440 newMap!16) (extraKeys!2219 newMap!16) lt!43641 (zeroValue!2276 newMap!16) (minValue!2276 newMap!16) lt!43491 (defaultEntry!2388 newMap!16)))))

(assert (=> b!90319 (= lt!43641 (bvor (extraKeys!2219 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!90319 (= e!58801 (tuple2!2229 true (LongMapFixedSize!781 (defaultEntry!2388 newMap!16) (mask!6440 newMap!16) (bvor (extraKeys!2219 newMap!16) #b00000000000000000000000000000010) (zeroValue!2276 newMap!16) lt!43491 (_size!439 newMap!16) (_keys!4068 newMap!16) (_values!2371 newMap!16) (_vacant!439 newMap!16))))))

(declare-fun b!90320 () Bool)

(declare-fun lt!43631 () Unit!2679)

(declare-fun lt!43642 () Unit!2679)

(assert (=> b!90320 (= lt!43631 lt!43642)))

(assert (=> b!90320 (contains!765 call!8778 (select (arr!1943 (_keys!4068 newMap!16)) (index!3125 lt!43652)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!95 (array!4083 array!4085 (_ BitVec 32) (_ BitVec 32) V!3059 V!3059 (_ BitVec 32) Int) Unit!2679)

(assert (=> b!90320 (= lt!43642 (lemmaValidKeyInArrayIsInListMap!95 (_keys!4068 newMap!16) lt!43629 (mask!6440 newMap!16) (extraKeys!2219 newMap!16) (zeroValue!2276 newMap!16) (minValue!2276 newMap!16) (index!3125 lt!43652) (defaultEntry!2388 newMap!16)))))

(assert (=> b!90320 (= lt!43629 (array!4086 (store (arr!1944 (_values!2371 newMap!16)) (index!3125 lt!43652) (ValueCellFull!936 lt!43491)) (size!2191 (_values!2371 newMap!16))))))

(declare-fun lt!43634 () Unit!2679)

(declare-fun lt!43644 () Unit!2679)

(assert (=> b!90320 (= lt!43634 lt!43644)))

(assert (=> b!90320 (= call!8786 (getCurrentListMap!447 (_keys!4068 newMap!16) (array!4086 (store (arr!1944 (_values!2371 newMap!16)) (index!3125 lt!43652) (ValueCellFull!936 lt!43491)) (size!2191 (_values!2371 newMap!16))) (mask!6440 newMap!16) (extraKeys!2219 newMap!16) (zeroValue!2276 newMap!16) (minValue!2276 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2388 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!34 (array!4083 array!4085 (_ BitVec 32) (_ BitVec 32) V!3059 V!3059 (_ BitVec 32) (_ BitVec 64) V!3059 Int) Unit!2679)

(assert (=> b!90320 (= lt!43644 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!34 (_keys!4068 newMap!16) (_values!2371 newMap!16) (mask!6440 newMap!16) (extraKeys!2219 newMap!16) (zeroValue!2276 newMap!16) (minValue!2276 newMap!16) (index!3125 lt!43652) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491 (defaultEntry!2388 newMap!16)))))

(declare-fun lt!43645 () Unit!2679)

(assert (=> b!90320 (= lt!43645 e!58804)))

(assert (=> b!90320 (= c!15014 call!8797)))

(assert (=> b!90320 (= e!58802 (tuple2!2229 true (LongMapFixedSize!781 (defaultEntry!2388 newMap!16) (mask!6440 newMap!16) (extraKeys!2219 newMap!16) (zeroValue!2276 newMap!16) (minValue!2276 newMap!16) (_size!439 newMap!16) (_keys!4068 newMap!16) (array!4086 (store (arr!1944 (_values!2371 newMap!16)) (index!3125 lt!43652) (ValueCellFull!936 lt!43491)) (size!2191 (_values!2371 newMap!16))) (_vacant!439 newMap!16))))))

(declare-fun b!90321 () Bool)

(assert (=> b!90321 (= e!58800 e!58809)))

(declare-fun res!46100 () Bool)

(assert (=> b!90321 (= res!46100 call!8788)))

(assert (=> b!90321 (=> (not res!46100) (not e!58809))))

(declare-fun b!90322 () Bool)

(declare-fun res!46088 () Bool)

(assert (=> b!90322 (= res!46088 (= (select (arr!1943 (_keys!4068 newMap!16)) (index!3127 lt!43637)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!90322 (=> (not res!46088) (not e!58805))))

(declare-fun b!90323 () Bool)

(assert (=> b!90323 (= e!58805 (not call!8784))))

(declare-fun b!90324 () Bool)

(declare-fun res!46097 () Bool)

(assert (=> b!90324 (=> (not res!46097) (not e!58815))))

(assert (=> b!90324 (= res!46097 call!8789)))

(assert (=> b!90324 (= e!58812 e!58815)))

(declare-fun b!90325 () Bool)

(declare-fun lt!43639 () tuple2!2228)

(assert (=> b!90325 (= lt!43639 call!8799)))

(assert (=> b!90325 (= e!58802 (tuple2!2229 (_1!1125 lt!43639) (_2!1125 lt!43639)))))

(declare-fun b!90326 () Bool)

(declare-fun res!46091 () Bool)

(assert (=> b!90326 (= res!46091 call!8783)))

(assert (=> b!90326 (=> (not res!46091) (not e!58813))))

(declare-fun bm!8797 () Bool)

(assert (=> bm!8797 (= call!8794 call!8786)))

(assert (= (and d!24003 c!15012) b!90315))

(assert (= (and d!24003 (not c!15012)) b!90294))

(assert (= (and b!90315 c!15020) b!90299))

(assert (= (and b!90315 (not c!15020)) b!90319))

(assert (= (or b!90299 b!90319) bm!8787))

(assert (= (or b!90299 b!90319) bm!8796))

(assert (= (or b!90299 b!90319) bm!8797))

(assert (= (and b!90294 c!15011) b!90291))

(assert (= (and b!90294 (not c!15011)) b!90302))

(assert (= (and b!90291 c!15021) b!90292))

(assert (= (and b!90291 (not c!15021)) b!90318))

(assert (= (and b!90292 res!46093) b!90293))

(assert (= (and b!90293 res!46098) b!90306))

(assert (= (and b!90318 c!15019) b!90309))

(assert (= (and b!90318 (not c!15019)) b!90307))

(assert (= (and b!90309 res!46099) b!90287))

(assert (= (and b!90287 res!46101) b!90313))

(assert (= (and b!90307 c!15016) b!90321))

(assert (= (and b!90307 (not c!15016)) b!90297))

(assert (= (and b!90321 res!46100) b!90296))

(assert (= (and b!90296 res!46092) b!90317))

(assert (= (or b!90309 b!90321) bm!8779))

(assert (= (or b!90313 b!90317) bm!8776))

(assert (= (or b!90293 bm!8779) bm!8795))

(assert (= (or b!90292 b!90318) bm!8793))

(assert (= (and b!90302 c!15023) b!90305))

(assert (= (and b!90302 (not c!15023)) b!90289))

(assert (= (and b!90289 c!15018) b!90325))

(assert (= (and b!90289 (not c!15018)) b!90320))

(assert (= (and b!90320 c!15014) b!90312))

(assert (= (and b!90320 (not c!15014)) b!90298))

(assert (= (and b!90312 res!46094) b!90326))

(assert (= (and b!90326 res!46091) b!90288))

(assert (= (and b!90298 c!15013) b!90324))

(assert (= (and b!90298 (not c!15013)) b!90314))

(assert (= (and b!90324 res!46097) b!90304))

(assert (= (and b!90304 res!46096) b!90308))

(assert (= (and b!90314 c!15017) b!90300))

(assert (= (and b!90314 (not c!15017)) b!90295))

(assert (= (and b!90300 res!46089) b!90322))

(assert (= (and b!90322 res!46088) b!90323))

(assert (= (or b!90324 b!90300) bm!8774))

(assert (= (or b!90308 b!90323) bm!8775))

(assert (= (or b!90326 bm!8774) bm!8794))

(assert (= (or b!90312 b!90298) bm!8788))

(assert (= (or b!90305 b!90325) bm!8783))

(assert (= (or b!90292 b!90312) bm!8784))

(assert (= (or bm!8793 bm!8788) bm!8778))

(assert (= (or b!90291 b!90320) bm!8792))

(assert (= (or bm!8795 bm!8794) bm!8791))

(assert (= (or b!90318 b!90298) bm!8789))

(assert (= (or bm!8776 bm!8775) bm!8777))

(assert (= (or b!90291 b!90320) bm!8782))

(assert (= (and bm!8782 c!15022) b!90316))

(assert (= (and bm!8782 (not c!15022)) b!90303))

(assert (= (or bm!8787 bm!8792) bm!8780))

(assert (= (or bm!8796 b!90303 b!90320) bm!8786))

(assert (= (or bm!8797 b!90320) bm!8781))

(assert (= (and d!24003 res!46095) b!90290))

(assert (= (and b!90290 c!15015) b!90311))

(assert (= (and b!90290 (not c!15015)) b!90310))

(assert (= (and b!90311 res!46090) b!90301))

(assert (= (or b!90301 b!90310) bm!8785))

(assert (= (or b!90311 b!90301 b!90310) bm!8790))

(declare-fun m!97035 () Bool)

(assert (=> d!24003 m!97035))

(assert (=> d!24003 m!96903))

(declare-fun m!97037 () Bool)

(assert (=> bm!8781 m!97037))

(declare-fun m!97039 () Bool)

(assert (=> b!90319 m!97039))

(declare-fun m!97041 () Bool)

(assert (=> b!90288 m!97041))

(assert (=> b!90294 m!96895))

(declare-fun m!97043 () Bool)

(assert (=> b!90294 m!97043))

(assert (=> bm!8782 m!96895))

(declare-fun m!97045 () Bool)

(assert (=> bm!8782 m!97045))

(assert (=> bm!8778 m!96895))

(assert (=> bm!8778 m!97043))

(declare-fun m!97047 () Bool)

(assert (=> b!90306 m!97047))

(declare-fun m!97049 () Bool)

(assert (=> b!90299 m!97049))

(declare-fun m!97051 () Bool)

(assert (=> bm!8791 m!97051))

(assert (=> bm!8785 m!96911))

(declare-fun m!97053 () Bool)

(assert (=> bm!8780 m!97053))

(declare-fun m!97055 () Bool)

(assert (=> b!90320 m!97055))

(declare-fun m!97057 () Bool)

(assert (=> b!90320 m!97057))

(declare-fun m!97059 () Bool)

(assert (=> b!90320 m!97059))

(declare-fun m!97061 () Bool)

(assert (=> b!90320 m!97061))

(declare-fun m!97063 () Bool)

(assert (=> b!90320 m!97063))

(assert (=> b!90320 m!96895))

(declare-fun m!97065 () Bool)

(assert (=> b!90320 m!97065))

(assert (=> b!90320 m!97061))

(declare-fun m!97067 () Bool)

(assert (=> bm!8790 m!97067))

(assert (=> bm!8783 m!96895))

(declare-fun m!97069 () Bool)

(assert (=> bm!8783 m!97069))

(assert (=> bm!8777 m!96895))

(declare-fun m!97071 () Bool)

(assert (=> bm!8777 m!97071))

(declare-fun m!97073 () Bool)

(assert (=> b!90301 m!97073))

(declare-fun m!97075 () Bool)

(assert (=> b!90287 m!97075))

(declare-fun m!97077 () Bool)

(assert (=> b!90296 m!97077))

(assert (=> b!90311 m!96895))

(declare-fun m!97079 () Bool)

(assert (=> b!90311 m!97079))

(assert (=> bm!8784 m!96895))

(declare-fun m!97081 () Bool)

(assert (=> bm!8784 m!97081))

(assert (=> bm!8789 m!96895))

(declare-fun m!97083 () Bool)

(assert (=> bm!8789 m!97083))

(declare-fun m!97085 () Bool)

(assert (=> b!90304 m!97085))

(declare-fun m!97087 () Bool)

(assert (=> b!90322 m!97087))

(declare-fun m!97089 () Bool)

(assert (=> bm!8786 m!97089))

(assert (=> b!90112 d!24003))

(declare-fun d!24005 () Bool)

(declare-fun c!15026 () Bool)

(assert (=> d!24005 (= c!15026 ((_ is ValueCellFull!936) (select (arr!1944 (_values!2371 (v!2693 (underlying!301 thiss!992)))) from!355)))))

(declare-fun e!58820 () V!3059)

(assert (=> d!24005 (= (get!1218 (select (arr!1944 (_values!2371 (v!2693 (underlying!301 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!58820)))

(declare-fun b!90331 () Bool)

(declare-fun get!1219 (ValueCell!936 V!3059) V!3059)

(assert (=> b!90331 (= e!58820 (get!1219 (select (arr!1944 (_values!2371 (v!2693 (underlying!301 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90332 () Bool)

(declare-fun get!1220 (ValueCell!936 V!3059) V!3059)

(assert (=> b!90332 (= e!58820 (get!1220 (select (arr!1944 (_values!2371 (v!2693 (underlying!301 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24005 c!15026) b!90331))

(assert (= (and d!24005 (not c!15026)) b!90332))

(assert (=> b!90331 m!96897))

(assert (=> b!90331 m!96899))

(declare-fun m!97091 () Bool)

(assert (=> b!90331 m!97091))

(assert (=> b!90332 m!96897))

(assert (=> b!90332 m!96899))

(declare-fun m!97093 () Bool)

(assert (=> b!90332 m!97093))

(assert (=> b!90124 d!24005))

(declare-fun d!24007 () Bool)

(assert (=> d!24007 (not (arrayContainsKey!0 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!43658 () Unit!2679)

(declare-fun choose!68 (array!4083 (_ BitVec 32) (_ BitVec 64) List!1536) Unit!2679)

(assert (=> d!24007 (= lt!43658 (choose!68 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (Cons!1532 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) Nil!1533)))))

(assert (=> d!24007 (bvslt (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24007 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (Cons!1532 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) Nil!1533)) lt!43658)))

(declare-fun bs!3781 () Bool)

(assert (= bs!3781 d!24007))

(assert (=> bs!3781 m!96895))

(assert (=> bs!3781 m!96945))

(assert (=> bs!3781 m!96895))

(declare-fun m!97095 () Bool)

(assert (=> bs!3781 m!97095))

(assert (=> b!90119 d!24007))

(declare-fun d!24009 () Bool)

(assert (=> d!24009 (arrayNoDuplicates!0 (_keys!4068 (v!2693 (underlying!301 thiss!992))) from!355 Nil!1533)))

(declare-fun lt!43661 () Unit!2679)

(declare-fun choose!39 (array!4083 (_ BitVec 32) (_ BitVec 32)) Unit!2679)

(assert (=> d!24009 (= lt!43661 (choose!39 (_keys!4068 (v!2693 (underlying!301 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24009 (bvslt (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24009 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4068 (v!2693 (underlying!301 thiss!992))) #b00000000000000000000000000000000 from!355) lt!43661)))

(declare-fun bs!3782 () Bool)

(assert (= bs!3782 d!24009))

(assert (=> bs!3782 m!96941))

(declare-fun m!97097 () Bool)

(assert (=> bs!3782 m!97097))

(assert (=> b!90119 d!24009))

(declare-fun d!24011 () Bool)

(declare-fun res!46106 () Bool)

(declare-fun e!58825 () Bool)

(assert (=> d!24011 (=> res!46106 e!58825)))

(assert (=> d!24011 (= res!46106 (= (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355)))))

(assert (=> d!24011 (= (arrayContainsKey!0 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!58825)))

(declare-fun b!90337 () Bool)

(declare-fun e!58826 () Bool)

(assert (=> b!90337 (= e!58825 e!58826)))

(declare-fun res!46107 () Bool)

(assert (=> b!90337 (=> (not res!46107) (not e!58826))))

(assert (=> b!90337 (= res!46107 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992))))))))

(declare-fun b!90338 () Bool)

(assert (=> b!90338 (= e!58826 (arrayContainsKey!0 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24011 (not res!46106)) b!90337))

(assert (= (and b!90337 res!46107) b!90338))

(declare-fun m!97099 () Bool)

(assert (=> d!24011 m!97099))

(assert (=> b!90338 m!96895))

(declare-fun m!97101 () Bool)

(assert (=> b!90338 m!97101))

(assert (=> b!90119 d!24011))

(declare-fun d!24013 () Bool)

(declare-fun e!58829 () Bool)

(assert (=> d!24013 e!58829))

(declare-fun c!15029 () Bool)

(assert (=> d!24013 (= c!15029 (and (not (= (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!43664 () Unit!2679)

(declare-fun choose!539 (array!4083 array!4085 (_ BitVec 32) (_ BitVec 32) V!3059 V!3059 (_ BitVec 64) (_ BitVec 32) Int) Unit!2679)

(assert (=> d!24013 (= lt!43664 (choose!539 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!24013 (validMask!0 (mask!6440 (v!2693 (underlying!301 thiss!992))))))

(assert (=> d!24013 (= (lemmaListMapContainsThenArrayContainsFrom!72 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))) lt!43664)))

(declare-fun b!90343 () Bool)

(assert (=> b!90343 (= e!58829 (arrayContainsKey!0 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!90344 () Bool)

(assert (=> b!90344 (= e!58829 (ite (= (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24013 c!15029) b!90343))

(assert (= (and d!24013 (not c!15029)) b!90344))

(assert (=> d!24013 m!96895))

(declare-fun m!97103 () Bool)

(assert (=> d!24013 m!97103))

(declare-fun m!97105 () Bool)

(assert (=> d!24013 m!97105))

(assert (=> b!90343 m!96895))

(assert (=> b!90343 m!96945))

(assert (=> b!90119 d!24013))

(declare-fun b!90356 () Bool)

(declare-fun e!58840 () Bool)

(declare-fun e!58839 () Bool)

(assert (=> b!90356 (= e!58840 e!58839)))

(declare-fun c!15032 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!90356 (= c!15032 (validKeyInArray!0 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355)))))

(declare-fun b!90357 () Bool)

(declare-fun call!8803 () Bool)

(assert (=> b!90357 (= e!58839 call!8803)))

(declare-fun b!90358 () Bool)

(declare-fun e!58841 () Bool)

(assert (=> b!90358 (= e!58841 e!58840)))

(declare-fun res!46116 () Bool)

(assert (=> b!90358 (=> (not res!46116) (not e!58840))))

(declare-fun e!58838 () Bool)

(assert (=> b!90358 (= res!46116 (not e!58838))))

(declare-fun res!46115 () Bool)

(assert (=> b!90358 (=> (not res!46115) (not e!58838))))

(assert (=> b!90358 (= res!46115 (validKeyInArray!0 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355)))))

(declare-fun b!90355 () Bool)

(declare-fun contains!766 (List!1536 (_ BitVec 64)) Bool)

(assert (=> b!90355 (= e!58838 (contains!766 Nil!1533 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355)))))

(declare-fun d!24015 () Bool)

(declare-fun res!46114 () Bool)

(assert (=> d!24015 (=> res!46114 e!58841)))

(assert (=> d!24015 (= res!46114 (bvsge from!355 (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992))))))))

(assert (=> d!24015 (= (arrayNoDuplicates!0 (_keys!4068 (v!2693 (underlying!301 thiss!992))) from!355 Nil!1533) e!58841)))

(declare-fun b!90359 () Bool)

(assert (=> b!90359 (= e!58839 call!8803)))

(declare-fun bm!8800 () Bool)

(assert (=> bm!8800 (= call!8803 (arrayNoDuplicates!0 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15032 (Cons!1532 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) Nil!1533) Nil!1533)))))

(assert (= (and d!24015 (not res!46114)) b!90358))

(assert (= (and b!90358 res!46115) b!90355))

(assert (= (and b!90358 res!46116) b!90356))

(assert (= (and b!90356 c!15032) b!90357))

(assert (= (and b!90356 (not c!15032)) b!90359))

(assert (= (or b!90357 b!90359) bm!8800))

(assert (=> b!90356 m!96895))

(assert (=> b!90356 m!96895))

(declare-fun m!97107 () Bool)

(assert (=> b!90356 m!97107))

(assert (=> b!90358 m!96895))

(assert (=> b!90358 m!96895))

(assert (=> b!90358 m!97107))

(assert (=> b!90355 m!96895))

(assert (=> b!90355 m!96895))

(declare-fun m!97109 () Bool)

(assert (=> b!90355 m!97109))

(assert (=> bm!8800 m!96895))

(declare-fun m!97111 () Bool)

(assert (=> bm!8800 m!97111))

(assert (=> b!90119 d!24015))

(declare-fun d!24017 () Bool)

(assert (=> d!24017 (= (array_inv!1203 (_keys!4068 newMap!16)) (bvsge (size!2190 (_keys!4068 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!90116 d!24017))

(declare-fun d!24019 () Bool)

(assert (=> d!24019 (= (array_inv!1204 (_values!2371 newMap!16)) (bvsge (size!2191 (_values!2371 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!90116 d!24019))

(declare-fun d!24021 () Bool)

(assert (=> d!24021 (= (map!1204 newMap!16) (getCurrentListMap!447 (_keys!4068 newMap!16) (_values!2371 newMap!16) (mask!6440 newMap!16) (extraKeys!2219 newMap!16) (zeroValue!2276 newMap!16) (minValue!2276 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2388 newMap!16)))))

(declare-fun bs!3783 () Bool)

(assert (= bs!3783 d!24021))

(declare-fun m!97113 () Bool)

(assert (=> bs!3783 m!97113))

(assert (=> b!90110 d!24021))

(declare-fun b!90402 () Bool)

(declare-fun c!15048 () Bool)

(assert (=> b!90402 (= c!15048 (and (not (= (bvand (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!58868 () ListLongMap!1479)

(declare-fun e!58872 () ListLongMap!1479)

(assert (=> b!90402 (= e!58868 e!58872)))

(declare-fun b!90404 () Bool)

(declare-fun lt!43718 () ListLongMap!1479)

(declare-fun e!58875 () Bool)

(declare-fun apply!85 (ListLongMap!1479 (_ BitVec 64)) V!3059)

(assert (=> b!90404 (= e!58875 (= (apply!85 lt!43718 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1218 (select (arr!1944 (_values!2371 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!90404 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2191 (_values!2371 (v!2693 (underlying!301 thiss!992))))))))

(assert (=> b!90404 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992))))))))

(declare-fun b!90405 () Bool)

(declare-fun e!58876 () Unit!2679)

(declare-fun lt!43716 () Unit!2679)

(assert (=> b!90405 (= e!58876 lt!43716)))

(declare-fun lt!43723 () ListLongMap!1479)

(assert (=> b!90405 (= lt!43723 (getCurrentListMapNoExtraKeys!82 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun lt!43720 () (_ BitVec 64))

(assert (=> b!90405 (= lt!43720 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43724 () (_ BitVec 64))

(assert (=> b!90405 (= lt!43724 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!43726 () Unit!2679)

(declare-fun addStillContains!61 (ListLongMap!1479 (_ BitVec 64) V!3059 (_ BitVec 64)) Unit!2679)

(assert (=> b!90405 (= lt!43726 (addStillContains!61 lt!43723 lt!43720 (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) lt!43724))))

(assert (=> b!90405 (contains!765 (+!117 lt!43723 (tuple2!2227 lt!43720 (zeroValue!2276 (v!2693 (underlying!301 thiss!992))))) lt!43724)))

(declare-fun lt!43710 () Unit!2679)

(assert (=> b!90405 (= lt!43710 lt!43726)))

(declare-fun lt!43712 () ListLongMap!1479)

(assert (=> b!90405 (= lt!43712 (getCurrentListMapNoExtraKeys!82 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun lt!43709 () (_ BitVec 64))

(assert (=> b!90405 (= lt!43709 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43728 () (_ BitVec 64))

(assert (=> b!90405 (= lt!43728 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!43711 () Unit!2679)

(declare-fun addApplyDifferent!61 (ListLongMap!1479 (_ BitVec 64) V!3059 (_ BitVec 64)) Unit!2679)

(assert (=> b!90405 (= lt!43711 (addApplyDifferent!61 lt!43712 lt!43709 (minValue!2276 (v!2693 (underlying!301 thiss!992))) lt!43728))))

(assert (=> b!90405 (= (apply!85 (+!117 lt!43712 (tuple2!2227 lt!43709 (minValue!2276 (v!2693 (underlying!301 thiss!992))))) lt!43728) (apply!85 lt!43712 lt!43728))))

(declare-fun lt!43721 () Unit!2679)

(assert (=> b!90405 (= lt!43721 lt!43711)))

(declare-fun lt!43713 () ListLongMap!1479)

(assert (=> b!90405 (= lt!43713 (getCurrentListMapNoExtraKeys!82 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun lt!43727 () (_ BitVec 64))

(assert (=> b!90405 (= lt!43727 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43725 () (_ BitVec 64))

(assert (=> b!90405 (= lt!43725 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!43729 () Unit!2679)

(assert (=> b!90405 (= lt!43729 (addApplyDifferent!61 lt!43713 lt!43727 (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) lt!43725))))

(assert (=> b!90405 (= (apply!85 (+!117 lt!43713 (tuple2!2227 lt!43727 (zeroValue!2276 (v!2693 (underlying!301 thiss!992))))) lt!43725) (apply!85 lt!43713 lt!43725))))

(declare-fun lt!43715 () Unit!2679)

(assert (=> b!90405 (= lt!43715 lt!43729)))

(declare-fun lt!43719 () ListLongMap!1479)

(assert (=> b!90405 (= lt!43719 (getCurrentListMapNoExtraKeys!82 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun lt!43714 () (_ BitVec 64))

(assert (=> b!90405 (= lt!43714 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43717 () (_ BitVec 64))

(assert (=> b!90405 (= lt!43717 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!90405 (= lt!43716 (addApplyDifferent!61 lt!43719 lt!43714 (minValue!2276 (v!2693 (underlying!301 thiss!992))) lt!43717))))

(assert (=> b!90405 (= (apply!85 (+!117 lt!43719 (tuple2!2227 lt!43714 (minValue!2276 (v!2693 (underlying!301 thiss!992))))) lt!43717) (apply!85 lt!43719 lt!43717))))

(declare-fun b!90406 () Bool)

(declare-fun e!58869 () Bool)

(assert (=> b!90406 (= e!58869 (validKeyInArray!0 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!90407 () Bool)

(declare-fun e!58870 () ListLongMap!1479)

(assert (=> b!90407 (= e!58870 e!58868)))

(declare-fun c!15045 () Bool)

(assert (=> b!90407 (= c!15045 (and (not (= (bvand (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!90408 () Bool)

(declare-fun e!58878 () Bool)

(declare-fun e!58871 () Bool)

(assert (=> b!90408 (= e!58878 e!58871)))

(declare-fun res!46140 () Bool)

(declare-fun call!8823 () Bool)

(assert (=> b!90408 (= res!46140 call!8823)))

(assert (=> b!90408 (=> (not res!46140) (not e!58871))))

(declare-fun b!90409 () Bool)

(declare-fun call!8824 () ListLongMap!1479)

(assert (=> b!90409 (= e!58870 (+!117 call!8824 (tuple2!2227 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2276 (v!2693 (underlying!301 thiss!992))))))))

(declare-fun bm!8815 () Bool)

(assert (=> bm!8815 (= call!8823 (contains!765 lt!43718 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!90410 () Bool)

(declare-fun Unit!2686 () Unit!2679)

(assert (=> b!90410 (= e!58876 Unit!2686)))

(declare-fun bm!8816 () Bool)

(declare-fun call!8821 () ListLongMap!1479)

(declare-fun call!8818 () ListLongMap!1479)

(assert (=> bm!8816 (= call!8821 call!8818)))

(declare-fun b!90411 () Bool)

(declare-fun res!46137 () Bool)

(declare-fun e!58880 () Bool)

(assert (=> b!90411 (=> (not res!46137) (not e!58880))))

(declare-fun e!58874 () Bool)

(assert (=> b!90411 (= res!46137 e!58874)))

(declare-fun res!46136 () Bool)

(assert (=> b!90411 (=> res!46136 e!58874)))

(declare-fun e!58873 () Bool)

(assert (=> b!90411 (= res!46136 (not e!58873))))

(declare-fun res!46139 () Bool)

(assert (=> b!90411 (=> (not res!46139) (not e!58873))))

(assert (=> b!90411 (= res!46139 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992))))))))

(declare-fun b!90403 () Bool)

(assert (=> b!90403 (= e!58871 (= (apply!85 lt!43718 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2276 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun d!24023 () Bool)

(assert (=> d!24023 e!58880))

(declare-fun res!46142 () Bool)

(assert (=> d!24023 (=> (not res!46142) (not e!58880))))

(assert (=> d!24023 (= res!46142 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992))))))))))

(declare-fun lt!43722 () ListLongMap!1479)

(assert (=> d!24023 (= lt!43718 lt!43722)))

(declare-fun lt!43730 () Unit!2679)

(assert (=> d!24023 (= lt!43730 e!58876)))

(declare-fun c!15046 () Bool)

(assert (=> d!24023 (= c!15046 e!58869)))

(declare-fun res!46138 () Bool)

(assert (=> d!24023 (=> (not res!46138) (not e!58869))))

(assert (=> d!24023 (= res!46138 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992))))))))

(assert (=> d!24023 (= lt!43722 e!58870)))

(declare-fun c!15050 () Bool)

(assert (=> d!24023 (= c!15050 (and (not (= (bvand (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24023 (validMask!0 (mask!6440 (v!2693 (underlying!301 thiss!992))))))

(assert (=> d!24023 (= (getCurrentListMap!447 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))) lt!43718)))

(declare-fun bm!8817 () Bool)

(declare-fun call!8819 () Bool)

(assert (=> bm!8817 (= call!8819 (contains!765 lt!43718 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!8822 () ListLongMap!1479)

(declare-fun bm!8818 () Bool)

(assert (=> bm!8818 (= call!8824 (+!117 (ite c!15050 call!8818 (ite c!15045 call!8821 call!8822)) (ite (or c!15050 c!15045) (tuple2!2227 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2276 (v!2693 (underlying!301 thiss!992)))) (tuple2!2227 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2276 (v!2693 (underlying!301 thiss!992)))))))))

(declare-fun b!90412 () Bool)

(assert (=> b!90412 (= e!58878 (not call!8823))))

(declare-fun bm!8819 () Bool)

(assert (=> bm!8819 (= call!8822 call!8821)))

(declare-fun b!90413 () Bool)

(assert (=> b!90413 (= e!58880 e!58878)))

(declare-fun c!15047 () Bool)

(assert (=> b!90413 (= c!15047 (not (= (bvand (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!90414 () Bool)

(declare-fun call!8820 () ListLongMap!1479)

(assert (=> b!90414 (= e!58868 call!8820)))

(declare-fun b!90415 () Bool)

(assert (=> b!90415 (= e!58874 e!58875)))

(declare-fun res!46141 () Bool)

(assert (=> b!90415 (=> (not res!46141) (not e!58875))))

(assert (=> b!90415 (= res!46141 (contains!765 lt!43718 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!90415 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992))))))))

(declare-fun b!90416 () Bool)

(assert (=> b!90416 (= e!58873 (validKeyInArray!0 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!90417 () Bool)

(declare-fun e!58877 () Bool)

(assert (=> b!90417 (= e!58877 (not call!8819))))

(declare-fun b!90418 () Bool)

(assert (=> b!90418 (= e!58872 call!8822)))

(declare-fun bm!8820 () Bool)

(assert (=> bm!8820 (= call!8820 call!8824)))

(declare-fun b!90419 () Bool)

(declare-fun e!58879 () Bool)

(assert (=> b!90419 (= e!58879 (= (apply!85 lt!43718 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2276 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun bm!8821 () Bool)

(assert (=> bm!8821 (= call!8818 (getCurrentListMapNoExtraKeys!82 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun b!90420 () Bool)

(declare-fun res!46135 () Bool)

(assert (=> b!90420 (=> (not res!46135) (not e!58880))))

(assert (=> b!90420 (= res!46135 e!58877)))

(declare-fun c!15049 () Bool)

(assert (=> b!90420 (= c!15049 (not (= (bvand (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!90421 () Bool)

(assert (=> b!90421 (= e!58872 call!8820)))

(declare-fun b!90422 () Bool)

(assert (=> b!90422 (= e!58877 e!58879)))

(declare-fun res!46143 () Bool)

(assert (=> b!90422 (= res!46143 call!8819)))

(assert (=> b!90422 (=> (not res!46143) (not e!58879))))

(assert (= (and d!24023 c!15050) b!90409))

(assert (= (and d!24023 (not c!15050)) b!90407))

(assert (= (and b!90407 c!15045) b!90414))

(assert (= (and b!90407 (not c!15045)) b!90402))

(assert (= (and b!90402 c!15048) b!90421))

(assert (= (and b!90402 (not c!15048)) b!90418))

(assert (= (or b!90421 b!90418) bm!8819))

(assert (= (or b!90414 bm!8819) bm!8816))

(assert (= (or b!90414 b!90421) bm!8820))

(assert (= (or b!90409 bm!8816) bm!8821))

(assert (= (or b!90409 bm!8820) bm!8818))

(assert (= (and d!24023 res!46138) b!90406))

(assert (= (and d!24023 c!15046) b!90405))

(assert (= (and d!24023 (not c!15046)) b!90410))

(assert (= (and d!24023 res!46142) b!90411))

(assert (= (and b!90411 res!46139) b!90416))

(assert (= (and b!90411 (not res!46136)) b!90415))

(assert (= (and b!90415 res!46141) b!90404))

(assert (= (and b!90411 res!46137) b!90420))

(assert (= (and b!90420 c!15049) b!90422))

(assert (= (and b!90420 (not c!15049)) b!90417))

(assert (= (and b!90422 res!46143) b!90419))

(assert (= (or b!90422 b!90417) bm!8817))

(assert (= (and b!90420 res!46135) b!90413))

(assert (= (and b!90413 c!15047) b!90408))

(assert (= (and b!90413 (not c!15047)) b!90412))

(assert (= (and b!90408 res!46140) b!90403))

(assert (= (or b!90408 b!90412) bm!8815))

(declare-fun b_lambda!3987 () Bool)

(assert (=> (not b_lambda!3987) (not b!90404)))

(assert (=> b!90404 t!5318))

(declare-fun b_and!5439 () Bool)

(assert (= b_and!5427 (and (=> t!5318 result!3007) b_and!5439)))

(assert (=> b!90404 t!5320))

(declare-fun b_and!5441 () Bool)

(assert (= b_and!5429 (and (=> t!5320 result!3011) b_and!5441)))

(declare-fun m!97115 () Bool)

(assert (=> b!90405 m!97115))

(declare-fun m!97117 () Bool)

(assert (=> b!90405 m!97117))

(assert (=> b!90405 m!97117))

(declare-fun m!97119 () Bool)

(assert (=> b!90405 m!97119))

(declare-fun m!97121 () Bool)

(assert (=> b!90405 m!97121))

(declare-fun m!97123 () Bool)

(assert (=> b!90405 m!97123))

(declare-fun m!97125 () Bool)

(assert (=> b!90405 m!97125))

(declare-fun m!97127 () Bool)

(assert (=> b!90405 m!97127))

(declare-fun m!97129 () Bool)

(assert (=> b!90405 m!97129))

(declare-fun m!97131 () Bool)

(assert (=> b!90405 m!97131))

(assert (=> b!90405 m!97123))

(declare-fun m!97133 () Bool)

(assert (=> b!90405 m!97133))

(assert (=> b!90405 m!97099))

(assert (=> b!90405 m!97115))

(declare-fun m!97135 () Bool)

(assert (=> b!90405 m!97135))

(assert (=> b!90405 m!97127))

(declare-fun m!97137 () Bool)

(assert (=> b!90405 m!97137))

(assert (=> b!90405 m!96931))

(declare-fun m!97139 () Bool)

(assert (=> b!90405 m!97139))

(declare-fun m!97141 () Bool)

(assert (=> b!90405 m!97141))

(declare-fun m!97143 () Bool)

(assert (=> b!90405 m!97143))

(declare-fun m!97145 () Bool)

(assert (=> b!90419 m!97145))

(assert (=> d!24023 m!97105))

(assert (=> b!90415 m!97099))

(assert (=> b!90415 m!97099))

(declare-fun m!97147 () Bool)

(assert (=> b!90415 m!97147))

(declare-fun m!97149 () Bool)

(assert (=> b!90403 m!97149))

(declare-fun m!97151 () Bool)

(assert (=> b!90404 m!97151))

(assert (=> b!90404 m!97151))

(assert (=> b!90404 m!96899))

(declare-fun m!97153 () Bool)

(assert (=> b!90404 m!97153))

(assert (=> b!90404 m!96899))

(assert (=> b!90404 m!97099))

(assert (=> b!90404 m!97099))

(declare-fun m!97155 () Bool)

(assert (=> b!90404 m!97155))

(assert (=> b!90416 m!97099))

(assert (=> b!90416 m!97099))

(declare-fun m!97157 () Bool)

(assert (=> b!90416 m!97157))

(declare-fun m!97159 () Bool)

(assert (=> bm!8818 m!97159))

(declare-fun m!97161 () Bool)

(assert (=> bm!8815 m!97161))

(assert (=> bm!8821 m!96931))

(declare-fun m!97163 () Bool)

(assert (=> bm!8817 m!97163))

(declare-fun m!97165 () Bool)

(assert (=> b!90409 m!97165))

(assert (=> b!90406 m!97099))

(assert (=> b!90406 m!97099))

(assert (=> b!90406 m!97157))

(assert (=> b!90110 d!24023))

(declare-fun d!24025 () Bool)

(declare-fun res!46144 () Bool)

(declare-fun e!58881 () Bool)

(assert (=> d!24025 (=> (not res!46144) (not e!58881))))

(assert (=> d!24025 (= res!46144 (simpleValid!61 (_2!1125 lt!43502)))))

(assert (=> d!24025 (= (valid!339 (_2!1125 lt!43502)) e!58881)))

(declare-fun b!90423 () Bool)

(declare-fun res!46145 () Bool)

(assert (=> b!90423 (=> (not res!46145) (not e!58881))))

(assert (=> b!90423 (= res!46145 (= (arrayCountValidKeys!0 (_keys!4068 (_2!1125 lt!43502)) #b00000000000000000000000000000000 (size!2190 (_keys!4068 (_2!1125 lt!43502)))) (_size!439 (_2!1125 lt!43502))))))

(declare-fun b!90424 () Bool)

(declare-fun res!46146 () Bool)

(assert (=> b!90424 (=> (not res!46146) (not e!58881))))

(assert (=> b!90424 (= res!46146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4068 (_2!1125 lt!43502)) (mask!6440 (_2!1125 lt!43502))))))

(declare-fun b!90425 () Bool)

(assert (=> b!90425 (= e!58881 (arrayNoDuplicates!0 (_keys!4068 (_2!1125 lt!43502)) #b00000000000000000000000000000000 Nil!1533))))

(assert (= (and d!24025 res!46144) b!90423))

(assert (= (and b!90423 res!46145) b!90424))

(assert (= (and b!90424 res!46146) b!90425))

(declare-fun m!97167 () Bool)

(assert (=> d!24025 m!97167))

(declare-fun m!97169 () Bool)

(assert (=> b!90423 m!97169))

(declare-fun m!97171 () Bool)

(assert (=> b!90424 m!97171))

(declare-fun m!97173 () Bool)

(assert (=> b!90425 m!97173))

(assert (=> b!90123 d!24025))

(declare-fun d!24027 () Bool)

(declare-fun e!58884 () Bool)

(assert (=> d!24027 e!58884))

(declare-fun res!46151 () Bool)

(assert (=> d!24027 (=> (not res!46151) (not e!58884))))

(declare-fun lt!43739 () ListLongMap!1479)

(assert (=> d!24027 (= res!46151 (contains!765 lt!43739 (_1!1124 lt!43503)))))

(declare-fun lt!43740 () List!1535)

(assert (=> d!24027 (= lt!43739 (ListLongMap!1480 lt!43740))))

(declare-fun lt!43741 () Unit!2679)

(declare-fun lt!43742 () Unit!2679)

(assert (=> d!24027 (= lt!43741 lt!43742)))

(assert (=> d!24027 (= (getValueByKey!143 lt!43740 (_1!1124 lt!43503)) (Some!148 (_2!1124 lt!43503)))))

(declare-fun lemmaContainsTupThenGetReturnValue!60 (List!1535 (_ BitVec 64) V!3059) Unit!2679)

(assert (=> d!24027 (= lt!43742 (lemmaContainsTupThenGetReturnValue!60 lt!43740 (_1!1124 lt!43503) (_2!1124 lt!43503)))))

(declare-fun insertStrictlySorted!63 (List!1535 (_ BitVec 64) V!3059) List!1535)

(assert (=> d!24027 (= lt!43740 (insertStrictlySorted!63 (toList!755 lt!43495) (_1!1124 lt!43503) (_2!1124 lt!43503)))))

(assert (=> d!24027 (= (+!117 lt!43495 lt!43503) lt!43739)))

(declare-fun b!90430 () Bool)

(declare-fun res!46152 () Bool)

(assert (=> b!90430 (=> (not res!46152) (not e!58884))))

(assert (=> b!90430 (= res!46152 (= (getValueByKey!143 (toList!755 lt!43739) (_1!1124 lt!43503)) (Some!148 (_2!1124 lt!43503))))))

(declare-fun b!90431 () Bool)

(declare-fun contains!767 (List!1535 tuple2!2226) Bool)

(assert (=> b!90431 (= e!58884 (contains!767 (toList!755 lt!43739) lt!43503))))

(assert (= (and d!24027 res!46151) b!90430))

(assert (= (and b!90430 res!46152) b!90431))

(declare-fun m!97175 () Bool)

(assert (=> d!24027 m!97175))

(declare-fun m!97177 () Bool)

(assert (=> d!24027 m!97177))

(declare-fun m!97179 () Bool)

(assert (=> d!24027 m!97179))

(declare-fun m!97181 () Bool)

(assert (=> d!24027 m!97181))

(declare-fun m!97183 () Bool)

(assert (=> b!90430 m!97183))

(declare-fun m!97185 () Bool)

(assert (=> b!90431 m!97185))

(assert (=> b!90123 d!24027))

(declare-fun d!24029 () Bool)

(declare-fun e!58885 () Bool)

(assert (=> d!24029 e!58885))

(declare-fun res!46153 () Bool)

(assert (=> d!24029 (=> (not res!46153) (not e!58885))))

(declare-fun lt!43743 () ListLongMap!1479)

(assert (=> d!24029 (= res!46153 (contains!765 lt!43743 (_1!1124 lt!43501)))))

(declare-fun lt!43744 () List!1535)

(assert (=> d!24029 (= lt!43743 (ListLongMap!1480 lt!43744))))

(declare-fun lt!43745 () Unit!2679)

(declare-fun lt!43746 () Unit!2679)

(assert (=> d!24029 (= lt!43745 lt!43746)))

(assert (=> d!24029 (= (getValueByKey!143 lt!43744 (_1!1124 lt!43501)) (Some!148 (_2!1124 lt!43501)))))

(assert (=> d!24029 (= lt!43746 (lemmaContainsTupThenGetReturnValue!60 lt!43744 (_1!1124 lt!43501) (_2!1124 lt!43501)))))

(assert (=> d!24029 (= lt!43744 (insertStrictlySorted!63 (toList!755 lt!43492) (_1!1124 lt!43501) (_2!1124 lt!43501)))))

(assert (=> d!24029 (= (+!117 lt!43492 lt!43501) lt!43743)))

(declare-fun b!90432 () Bool)

(declare-fun res!46154 () Bool)

(assert (=> b!90432 (=> (not res!46154) (not e!58885))))

(assert (=> b!90432 (= res!46154 (= (getValueByKey!143 (toList!755 lt!43743) (_1!1124 lt!43501)) (Some!148 (_2!1124 lt!43501))))))

(declare-fun b!90433 () Bool)

(assert (=> b!90433 (= e!58885 (contains!767 (toList!755 lt!43743) lt!43501))))

(assert (= (and d!24029 res!46153) b!90432))

(assert (= (and b!90432 res!46154) b!90433))

(declare-fun m!97187 () Bool)

(assert (=> d!24029 m!97187))

(declare-fun m!97189 () Bool)

(assert (=> d!24029 m!97189))

(declare-fun m!97191 () Bool)

(assert (=> d!24029 m!97191))

(declare-fun m!97193 () Bool)

(assert (=> d!24029 m!97193))

(declare-fun m!97195 () Bool)

(assert (=> b!90432 m!97195))

(declare-fun m!97197 () Bool)

(assert (=> b!90433 m!97197))

(assert (=> b!90123 d!24029))

(declare-fun d!24031 () Bool)

(declare-fun e!58886 () Bool)

(assert (=> d!24031 e!58886))

(declare-fun res!46155 () Bool)

(assert (=> d!24031 (=> (not res!46155) (not e!58886))))

(declare-fun lt!43747 () ListLongMap!1479)

(assert (=> d!24031 (= res!46155 (contains!765 lt!43747 (_1!1124 lt!43501)))))

(declare-fun lt!43748 () List!1535)

(assert (=> d!24031 (= lt!43747 (ListLongMap!1480 lt!43748))))

(declare-fun lt!43749 () Unit!2679)

(declare-fun lt!43750 () Unit!2679)

(assert (=> d!24031 (= lt!43749 lt!43750)))

(assert (=> d!24031 (= (getValueByKey!143 lt!43748 (_1!1124 lt!43501)) (Some!148 (_2!1124 lt!43501)))))

(assert (=> d!24031 (= lt!43750 (lemmaContainsTupThenGetReturnValue!60 lt!43748 (_1!1124 lt!43501) (_2!1124 lt!43501)))))

(assert (=> d!24031 (= lt!43748 (insertStrictlySorted!63 (toList!755 (+!117 lt!43495 lt!43503)) (_1!1124 lt!43501) (_2!1124 lt!43501)))))

(assert (=> d!24031 (= (+!117 (+!117 lt!43495 lt!43503) lt!43501) lt!43747)))

(declare-fun b!90434 () Bool)

(declare-fun res!46156 () Bool)

(assert (=> b!90434 (=> (not res!46156) (not e!58886))))

(assert (=> b!90434 (= res!46156 (= (getValueByKey!143 (toList!755 lt!43747) (_1!1124 lt!43501)) (Some!148 (_2!1124 lt!43501))))))

(declare-fun b!90435 () Bool)

(assert (=> b!90435 (= e!58886 (contains!767 (toList!755 lt!43747) lt!43501))))

(assert (= (and d!24031 res!46155) b!90434))

(assert (= (and b!90434 res!46156) b!90435))

(declare-fun m!97199 () Bool)

(assert (=> d!24031 m!97199))

(declare-fun m!97201 () Bool)

(assert (=> d!24031 m!97201))

(declare-fun m!97203 () Bool)

(assert (=> d!24031 m!97203))

(declare-fun m!97205 () Bool)

(assert (=> d!24031 m!97205))

(declare-fun m!97207 () Bool)

(assert (=> b!90434 m!97207))

(declare-fun m!97209 () Bool)

(assert (=> b!90435 m!97209))

(assert (=> b!90123 d!24031))

(declare-fun b!90460 () Bool)

(declare-fun e!58901 () Bool)

(assert (=> b!90460 (= e!58901 (validKeyInArray!0 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!90460 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!90461 () Bool)

(declare-fun lt!43765 () ListLongMap!1479)

(declare-fun e!58905 () Bool)

(assert (=> b!90461 (= e!58905 (= lt!43765 (getCurrentListMapNoExtraKeys!82 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))))))))

(declare-fun b!90462 () Bool)

(declare-fun e!58903 () Bool)

(assert (=> b!90462 (= e!58903 e!58905)))

(declare-fun c!15062 () Bool)

(assert (=> b!90462 (= c!15062 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992))))))))

(declare-fun b!90464 () Bool)

(declare-fun e!58902 () Bool)

(assert (=> b!90464 (= e!58903 e!58902)))

(assert (=> b!90464 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992))))))))

(declare-fun res!46168 () Bool)

(assert (=> b!90464 (= res!46168 (contains!765 lt!43765 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!90464 (=> (not res!46168) (not e!58902))))

(declare-fun b!90465 () Bool)

(declare-fun lt!43770 () Unit!2679)

(declare-fun lt!43766 () Unit!2679)

(assert (=> b!90465 (= lt!43770 lt!43766)))

(declare-fun lt!43768 () ListLongMap!1479)

(declare-fun lt!43769 () (_ BitVec 64))

(declare-fun lt!43771 () (_ BitVec 64))

(declare-fun lt!43767 () V!3059)

(assert (=> b!90465 (not (contains!765 (+!117 lt!43768 (tuple2!2227 lt!43769 lt!43767)) lt!43771))))

(declare-fun addStillNotContains!34 (ListLongMap!1479 (_ BitVec 64) V!3059 (_ BitVec 64)) Unit!2679)

(assert (=> b!90465 (= lt!43766 (addStillNotContains!34 lt!43768 lt!43769 lt!43767 lt!43771))))

(assert (=> b!90465 (= lt!43771 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!90465 (= lt!43767 (get!1218 (select (arr!1944 (_values!2371 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90465 (= lt!43769 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!8827 () ListLongMap!1479)

(assert (=> b!90465 (= lt!43768 call!8827)))

(declare-fun e!58904 () ListLongMap!1479)

(assert (=> b!90465 (= e!58904 (+!117 call!8827 (tuple2!2227 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1218 (select (arr!1944 (_values!2371 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!90466 () Bool)

(declare-fun e!58906 () ListLongMap!1479)

(assert (=> b!90466 (= e!58906 e!58904)))

(declare-fun c!15060 () Bool)

(assert (=> b!90466 (= c!15060 (validKeyInArray!0 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!90467 () Bool)

(assert (=> b!90467 (= e!58904 call!8827)))

(declare-fun b!90468 () Bool)

(declare-fun isEmpty!344 (ListLongMap!1479) Bool)

(assert (=> b!90468 (= e!58905 (isEmpty!344 lt!43765))))

(declare-fun bm!8824 () Bool)

(assert (=> bm!8824 (= call!8827 (getCurrentListMapNoExtraKeys!82 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))))))

(declare-fun d!24033 () Bool)

(declare-fun e!58907 () Bool)

(assert (=> d!24033 e!58907))

(declare-fun res!46167 () Bool)

(assert (=> d!24033 (=> (not res!46167) (not e!58907))))

(assert (=> d!24033 (= res!46167 (not (contains!765 lt!43765 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24033 (= lt!43765 e!58906)))

(declare-fun c!15061 () Bool)

(assert (=> d!24033 (= c!15061 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992))))))))

(assert (=> d!24033 (validMask!0 (mask!6440 (v!2693 (underlying!301 thiss!992))))))

(assert (=> d!24033 (= (getCurrentListMapNoExtraKeys!82 (_keys!4068 (v!2693 (underlying!301 thiss!992))) (_values!2371 (v!2693 (underlying!301 thiss!992))) (mask!6440 (v!2693 (underlying!301 thiss!992))) (extraKeys!2219 (v!2693 (underlying!301 thiss!992))) (zeroValue!2276 (v!2693 (underlying!301 thiss!992))) (minValue!2276 (v!2693 (underlying!301 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992)))) lt!43765)))

(declare-fun b!90463 () Bool)

(assert (=> b!90463 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992))))))))

(assert (=> b!90463 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2191 (_values!2371 (v!2693 (underlying!301 thiss!992))))))))

(assert (=> b!90463 (= e!58902 (= (apply!85 lt!43765 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1218 (select (arr!1944 (_values!2371 (v!2693 (underlying!301 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!90469 () Bool)

(assert (=> b!90469 (= e!58906 (ListLongMap!1480 Nil!1532))))

(declare-fun b!90470 () Bool)

(declare-fun res!46165 () Bool)

(assert (=> b!90470 (=> (not res!46165) (not e!58907))))

(assert (=> b!90470 (= res!46165 (not (contains!765 lt!43765 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90471 () Bool)

(assert (=> b!90471 (= e!58907 e!58903)))

(declare-fun c!15059 () Bool)

(assert (=> b!90471 (= c!15059 e!58901)))

(declare-fun res!46166 () Bool)

(assert (=> b!90471 (=> (not res!46166) (not e!58901))))

(assert (=> b!90471 (= res!46166 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2190 (_keys!4068 (v!2693 (underlying!301 thiss!992))))))))

(assert (= (and d!24033 c!15061) b!90469))

(assert (= (and d!24033 (not c!15061)) b!90466))

(assert (= (and b!90466 c!15060) b!90465))

(assert (= (and b!90466 (not c!15060)) b!90467))

(assert (= (or b!90465 b!90467) bm!8824))

(assert (= (and d!24033 res!46167) b!90470))

(assert (= (and b!90470 res!46165) b!90471))

(assert (= (and b!90471 res!46166) b!90460))

(assert (= (and b!90471 c!15059) b!90464))

(assert (= (and b!90471 (not c!15059)) b!90462))

(assert (= (and b!90464 res!46168) b!90463))

(assert (= (and b!90462 c!15062) b!90461))

(assert (= (and b!90462 (not c!15062)) b!90468))

(declare-fun b_lambda!3989 () Bool)

(assert (=> (not b_lambda!3989) (not b!90465)))

(assert (=> b!90465 t!5318))

(declare-fun b_and!5443 () Bool)

(assert (= b_and!5439 (and (=> t!5318 result!3007) b_and!5443)))

(assert (=> b!90465 t!5320))

(declare-fun b_and!5445 () Bool)

(assert (= b_and!5441 (and (=> t!5320 result!3011) b_and!5445)))

(declare-fun b_lambda!3991 () Bool)

(assert (=> (not b_lambda!3991) (not b!90463)))

(assert (=> b!90463 t!5318))

(declare-fun b_and!5447 () Bool)

(assert (= b_and!5443 (and (=> t!5318 result!3007) b_and!5447)))

(assert (=> b!90463 t!5320))

(declare-fun b_and!5449 () Bool)

(assert (= b_and!5445 (and (=> t!5320 result!3011) b_and!5449)))

(declare-fun m!97211 () Bool)

(assert (=> bm!8824 m!97211))

(assert (=> b!90460 m!97099))

(assert (=> b!90460 m!97099))

(assert (=> b!90460 m!97157))

(assert (=> b!90461 m!97211))

(assert (=> b!90463 m!97099))

(assert (=> b!90463 m!97151))

(assert (=> b!90463 m!97151))

(assert (=> b!90463 m!96899))

(assert (=> b!90463 m!97153))

(assert (=> b!90463 m!97099))

(declare-fun m!97213 () Bool)

(assert (=> b!90463 m!97213))

(assert (=> b!90463 m!96899))

(assert (=> b!90466 m!97099))

(assert (=> b!90466 m!97099))

(assert (=> b!90466 m!97157))

(declare-fun m!97215 () Bool)

(assert (=> d!24033 m!97215))

(assert (=> d!24033 m!97105))

(declare-fun m!97217 () Bool)

(assert (=> b!90470 m!97217))

(assert (=> b!90464 m!97099))

(assert (=> b!90464 m!97099))

(declare-fun m!97219 () Bool)

(assert (=> b!90464 m!97219))

(declare-fun m!97221 () Bool)

(assert (=> b!90465 m!97221))

(assert (=> b!90465 m!97099))

(assert (=> b!90465 m!97151))

(assert (=> b!90465 m!97151))

(assert (=> b!90465 m!96899))

(assert (=> b!90465 m!97153))

(declare-fun m!97223 () Bool)

(assert (=> b!90465 m!97223))

(assert (=> b!90465 m!96899))

(declare-fun m!97225 () Bool)

(assert (=> b!90465 m!97225))

(assert (=> b!90465 m!97221))

(declare-fun m!97227 () Bool)

(assert (=> b!90465 m!97227))

(declare-fun m!97229 () Bool)

(assert (=> b!90468 m!97229))

(assert (=> b!90123 d!24033))

(declare-fun d!24035 () Bool)

(declare-fun e!58908 () Bool)

(assert (=> d!24035 e!58908))

(declare-fun res!46169 () Bool)

(assert (=> d!24035 (=> (not res!46169) (not e!58908))))

(declare-fun lt!43772 () ListLongMap!1479)

(assert (=> d!24035 (= res!46169 (contains!765 lt!43772 (_1!1124 lt!43501)))))

(declare-fun lt!43773 () List!1535)

(assert (=> d!24035 (= lt!43772 (ListLongMap!1480 lt!43773))))

(declare-fun lt!43774 () Unit!2679)

(declare-fun lt!43775 () Unit!2679)

(assert (=> d!24035 (= lt!43774 lt!43775)))

(assert (=> d!24035 (= (getValueByKey!143 lt!43773 (_1!1124 lt!43501)) (Some!148 (_2!1124 lt!43501)))))

(assert (=> d!24035 (= lt!43775 (lemmaContainsTupThenGetReturnValue!60 lt!43773 (_1!1124 lt!43501) (_2!1124 lt!43501)))))

(assert (=> d!24035 (= lt!43773 (insertStrictlySorted!63 (toList!755 lt!43495) (_1!1124 lt!43501) (_2!1124 lt!43501)))))

(assert (=> d!24035 (= (+!117 lt!43495 lt!43501) lt!43772)))

(declare-fun b!90472 () Bool)

(declare-fun res!46170 () Bool)

(assert (=> b!90472 (=> (not res!46170) (not e!58908))))

(assert (=> b!90472 (= res!46170 (= (getValueByKey!143 (toList!755 lt!43772) (_1!1124 lt!43501)) (Some!148 (_2!1124 lt!43501))))))

(declare-fun b!90473 () Bool)

(assert (=> b!90473 (= e!58908 (contains!767 (toList!755 lt!43772) lt!43501))))

(assert (= (and d!24035 res!46169) b!90472))

(assert (= (and b!90472 res!46170) b!90473))

(declare-fun m!97231 () Bool)

(assert (=> d!24035 m!97231))

(declare-fun m!97233 () Bool)

(assert (=> d!24035 m!97233))

(declare-fun m!97235 () Bool)

(assert (=> d!24035 m!97235))

(declare-fun m!97237 () Bool)

(assert (=> d!24035 m!97237))

(declare-fun m!97239 () Bool)

(assert (=> b!90472 m!97239))

(declare-fun m!97241 () Bool)

(assert (=> b!90473 m!97241))

(assert (=> b!90123 d!24035))

(declare-fun d!24037 () Bool)

(declare-fun e!58909 () Bool)

(assert (=> d!24037 e!58909))

(declare-fun res!46171 () Bool)

(assert (=> d!24037 (=> (not res!46171) (not e!58909))))

(declare-fun lt!43776 () ListLongMap!1479)

(assert (=> d!24037 (= res!46171 (contains!765 lt!43776 (_1!1124 lt!43494)))))

(declare-fun lt!43777 () List!1535)

(assert (=> d!24037 (= lt!43776 (ListLongMap!1480 lt!43777))))

(declare-fun lt!43778 () Unit!2679)

(declare-fun lt!43779 () Unit!2679)

(assert (=> d!24037 (= lt!43778 lt!43779)))

(assert (=> d!24037 (= (getValueByKey!143 lt!43777 (_1!1124 lt!43494)) (Some!148 (_2!1124 lt!43494)))))

(assert (=> d!24037 (= lt!43779 (lemmaContainsTupThenGetReturnValue!60 lt!43777 (_1!1124 lt!43494) (_2!1124 lt!43494)))))

(assert (=> d!24037 (= lt!43777 (insertStrictlySorted!63 (toList!755 lt!43492) (_1!1124 lt!43494) (_2!1124 lt!43494)))))

(assert (=> d!24037 (= (+!117 lt!43492 lt!43494) lt!43776)))

(declare-fun b!90474 () Bool)

(declare-fun res!46172 () Bool)

(assert (=> b!90474 (=> (not res!46172) (not e!58909))))

(assert (=> b!90474 (= res!46172 (= (getValueByKey!143 (toList!755 lt!43776) (_1!1124 lt!43494)) (Some!148 (_2!1124 lt!43494))))))

(declare-fun b!90475 () Bool)

(assert (=> b!90475 (= e!58909 (contains!767 (toList!755 lt!43776) lt!43494))))

(assert (= (and d!24037 res!46171) b!90474))

(assert (= (and b!90474 res!46172) b!90475))

(declare-fun m!97243 () Bool)

(assert (=> d!24037 m!97243))

(declare-fun m!97245 () Bool)

(assert (=> d!24037 m!97245))

(declare-fun m!97247 () Bool)

(assert (=> d!24037 m!97247))

(declare-fun m!97249 () Bool)

(assert (=> d!24037 m!97249))

(declare-fun m!97251 () Bool)

(assert (=> b!90474 m!97251))

(declare-fun m!97253 () Bool)

(assert (=> b!90475 m!97253))

(assert (=> b!90123 d!24037))

(declare-fun d!24039 () Bool)

(declare-fun e!58910 () Bool)

(assert (=> d!24039 e!58910))

(declare-fun res!46173 () Bool)

(assert (=> d!24039 (=> (not res!46173) (not e!58910))))

(declare-fun lt!43780 () ListLongMap!1479)

(assert (=> d!24039 (= res!46173 (contains!765 lt!43780 (_1!1124 lt!43503)))))

(declare-fun lt!43781 () List!1535)

(assert (=> d!24039 (= lt!43780 (ListLongMap!1480 lt!43781))))

(declare-fun lt!43782 () Unit!2679)

(declare-fun lt!43783 () Unit!2679)

(assert (=> d!24039 (= lt!43782 lt!43783)))

(assert (=> d!24039 (= (getValueByKey!143 lt!43781 (_1!1124 lt!43503)) (Some!148 (_2!1124 lt!43503)))))

(assert (=> d!24039 (= lt!43783 (lemmaContainsTupThenGetReturnValue!60 lt!43781 (_1!1124 lt!43503) (_2!1124 lt!43503)))))

(assert (=> d!24039 (= lt!43781 (insertStrictlySorted!63 (toList!755 lt!43506) (_1!1124 lt!43503) (_2!1124 lt!43503)))))

(assert (=> d!24039 (= (+!117 lt!43506 lt!43503) lt!43780)))

(declare-fun b!90476 () Bool)

(declare-fun res!46174 () Bool)

(assert (=> b!90476 (=> (not res!46174) (not e!58910))))

(assert (=> b!90476 (= res!46174 (= (getValueByKey!143 (toList!755 lt!43780) (_1!1124 lt!43503)) (Some!148 (_2!1124 lt!43503))))))

(declare-fun b!90477 () Bool)

(assert (=> b!90477 (= e!58910 (contains!767 (toList!755 lt!43780) lt!43503))))

(assert (= (and d!24039 res!46173) b!90476))

(assert (= (and b!90476 res!46174) b!90477))

(declare-fun m!97255 () Bool)

(assert (=> d!24039 m!97255))

(declare-fun m!97257 () Bool)

(assert (=> d!24039 m!97257))

(declare-fun m!97259 () Bool)

(assert (=> d!24039 m!97259))

(declare-fun m!97261 () Bool)

(assert (=> d!24039 m!97261))

(declare-fun m!97263 () Bool)

(assert (=> b!90476 m!97263))

(declare-fun m!97265 () Bool)

(assert (=> b!90477 m!97265))

(assert (=> b!90123 d!24039))

(declare-fun d!24041 () Bool)

(declare-fun e!58911 () Bool)

(assert (=> d!24041 e!58911))

(declare-fun res!46175 () Bool)

(assert (=> d!24041 (=> (not res!46175) (not e!58911))))

(declare-fun lt!43784 () ListLongMap!1479)

(assert (=> d!24041 (= res!46175 (contains!765 lt!43784 (_1!1124 lt!43494)))))

(declare-fun lt!43785 () List!1535)

(assert (=> d!24041 (= lt!43784 (ListLongMap!1480 lt!43785))))

(declare-fun lt!43786 () Unit!2679)

(declare-fun lt!43787 () Unit!2679)

(assert (=> d!24041 (= lt!43786 lt!43787)))

(assert (=> d!24041 (= (getValueByKey!143 lt!43785 (_1!1124 lt!43494)) (Some!148 (_2!1124 lt!43494)))))

(assert (=> d!24041 (= lt!43787 (lemmaContainsTupThenGetReturnValue!60 lt!43785 (_1!1124 lt!43494) (_2!1124 lt!43494)))))

(assert (=> d!24041 (= lt!43785 (insertStrictlySorted!63 (toList!755 lt!43504) (_1!1124 lt!43494) (_2!1124 lt!43494)))))

(assert (=> d!24041 (= (+!117 lt!43504 lt!43494) lt!43784)))

(declare-fun b!90478 () Bool)

(declare-fun res!46176 () Bool)

(assert (=> b!90478 (=> (not res!46176) (not e!58911))))

(assert (=> b!90478 (= res!46176 (= (getValueByKey!143 (toList!755 lt!43784) (_1!1124 lt!43494)) (Some!148 (_2!1124 lt!43494))))))

(declare-fun b!90479 () Bool)

(assert (=> b!90479 (= e!58911 (contains!767 (toList!755 lt!43784) lt!43494))))

(assert (= (and d!24041 res!46175) b!90478))

(assert (= (and b!90478 res!46176) b!90479))

(declare-fun m!97267 () Bool)

(assert (=> d!24041 m!97267))

(declare-fun m!97269 () Bool)

(assert (=> d!24041 m!97269))

(declare-fun m!97271 () Bool)

(assert (=> d!24041 m!97271))

(declare-fun m!97273 () Bool)

(assert (=> d!24041 m!97273))

(declare-fun m!97275 () Bool)

(assert (=> b!90478 m!97275))

(declare-fun m!97277 () Bool)

(assert (=> b!90479 m!97277))

(assert (=> b!90123 d!24041))

(declare-fun d!24043 () Bool)

(assert (=> d!24043 (= (+!117 (+!117 lt!43492 (tuple2!2227 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491)) (tuple2!2227 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2276 (v!2693 (underlying!301 thiss!992))))) (+!117 (+!117 lt!43492 (tuple2!2227 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2276 (v!2693 (underlying!301 thiss!992))))) (tuple2!2227 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491)))))

(declare-fun lt!43790 () Unit!2679)

(declare-fun choose!540 (ListLongMap!1479 (_ BitVec 64) V!3059 (_ BitVec 64) V!3059) Unit!2679)

(assert (=> d!24043 (= lt!43790 (choose!540 lt!43492 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2276 (v!2693 (underlying!301 thiss!992)))))))

(assert (=> d!24043 (not (= (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24043 (= (addCommutativeForDiffKeys!36 lt!43492 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2276 (v!2693 (underlying!301 thiss!992)))) lt!43790)))

(declare-fun bs!3784 () Bool)

(assert (= bs!3784 d!24043))

(assert (=> bs!3784 m!96895))

(declare-fun m!97279 () Bool)

(assert (=> bs!3784 m!97279))

(declare-fun m!97281 () Bool)

(assert (=> bs!3784 m!97281))

(declare-fun m!97283 () Bool)

(assert (=> bs!3784 m!97283))

(assert (=> bs!3784 m!97281))

(declare-fun m!97285 () Bool)

(assert (=> bs!3784 m!97285))

(assert (=> bs!3784 m!97285))

(declare-fun m!97287 () Bool)

(assert (=> bs!3784 m!97287))

(assert (=> b!90123 d!24043))

(declare-fun d!24045 () Bool)

(assert (=> d!24045 (= (+!117 (+!117 lt!43495 (tuple2!2227 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491)) (tuple2!2227 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2276 (v!2693 (underlying!301 thiss!992))))) (+!117 (+!117 lt!43495 (tuple2!2227 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2276 (v!2693 (underlying!301 thiss!992))))) (tuple2!2227 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491)))))

(declare-fun lt!43791 () Unit!2679)

(assert (=> d!24045 (= lt!43791 (choose!540 lt!43495 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2276 (v!2693 (underlying!301 thiss!992)))))))

(assert (=> d!24045 (not (= (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24045 (= (addCommutativeForDiffKeys!36 lt!43495 (select (arr!1943 (_keys!4068 (v!2693 (underlying!301 thiss!992)))) from!355) lt!43491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2276 (v!2693 (underlying!301 thiss!992)))) lt!43791)))

(declare-fun bs!3785 () Bool)

(assert (= bs!3785 d!24045))

(assert (=> bs!3785 m!96895))

(declare-fun m!97289 () Bool)

(assert (=> bs!3785 m!97289))

(declare-fun m!97291 () Bool)

(assert (=> bs!3785 m!97291))

(declare-fun m!97293 () Bool)

(assert (=> bs!3785 m!97293))

(assert (=> bs!3785 m!97291))

(declare-fun m!97295 () Bool)

(assert (=> bs!3785 m!97295))

(assert (=> bs!3785 m!97295))

(declare-fun m!97297 () Bool)

(assert (=> bs!3785 m!97297))

(assert (=> b!90123 d!24045))

(declare-fun b!90486 () Bool)

(declare-fun e!58917 () Bool)

(assert (=> b!90486 (= e!58917 tp_is_empty!2559)))

(declare-fun mapIsEmpty!3501 () Bool)

(declare-fun mapRes!3501 () Bool)

(assert (=> mapIsEmpty!3501 mapRes!3501))

(declare-fun condMapEmpty!3501 () Bool)

(declare-fun mapDefault!3501 () ValueCell!936)

(assert (=> mapNonEmpty!3491 (= condMapEmpty!3501 (= mapRest!3491 ((as const (Array (_ BitVec 32) ValueCell!936)) mapDefault!3501)))))

(declare-fun e!58916 () Bool)

(assert (=> mapNonEmpty!3491 (= tp!9100 (and e!58916 mapRes!3501))))

(declare-fun mapNonEmpty!3501 () Bool)

(declare-fun tp!9117 () Bool)

(assert (=> mapNonEmpty!3501 (= mapRes!3501 (and tp!9117 e!58917))))

(declare-fun mapValue!3501 () ValueCell!936)

(declare-fun mapKey!3501 () (_ BitVec 32))

(declare-fun mapRest!3501 () (Array (_ BitVec 32) ValueCell!936))

(assert (=> mapNonEmpty!3501 (= mapRest!3491 (store mapRest!3501 mapKey!3501 mapValue!3501))))

(declare-fun b!90487 () Bool)

(assert (=> b!90487 (= e!58916 tp_is_empty!2559)))

(assert (= (and mapNonEmpty!3491 condMapEmpty!3501) mapIsEmpty!3501))

(assert (= (and mapNonEmpty!3491 (not condMapEmpty!3501)) mapNonEmpty!3501))

(assert (= (and mapNonEmpty!3501 ((_ is ValueCellFull!936) mapValue!3501)) b!90486))

(assert (= (and mapNonEmpty!3491 ((_ is ValueCellFull!936) mapDefault!3501)) b!90487))

(declare-fun m!97299 () Bool)

(assert (=> mapNonEmpty!3501 m!97299))

(declare-fun b!90488 () Bool)

(declare-fun e!58919 () Bool)

(assert (=> b!90488 (= e!58919 tp_is_empty!2559)))

(declare-fun mapIsEmpty!3502 () Bool)

(declare-fun mapRes!3502 () Bool)

(assert (=> mapIsEmpty!3502 mapRes!3502))

(declare-fun condMapEmpty!3502 () Bool)

(declare-fun mapDefault!3502 () ValueCell!936)

(assert (=> mapNonEmpty!3492 (= condMapEmpty!3502 (= mapRest!3492 ((as const (Array (_ BitVec 32) ValueCell!936)) mapDefault!3502)))))

(declare-fun e!58918 () Bool)

(assert (=> mapNonEmpty!3492 (= tp!9102 (and e!58918 mapRes!3502))))

(declare-fun mapNonEmpty!3502 () Bool)

(declare-fun tp!9118 () Bool)

(assert (=> mapNonEmpty!3502 (= mapRes!3502 (and tp!9118 e!58919))))

(declare-fun mapValue!3502 () ValueCell!936)

(declare-fun mapKey!3502 () (_ BitVec 32))

(declare-fun mapRest!3502 () (Array (_ BitVec 32) ValueCell!936))

(assert (=> mapNonEmpty!3502 (= mapRest!3492 (store mapRest!3502 mapKey!3502 mapValue!3502))))

(declare-fun b!90489 () Bool)

(assert (=> b!90489 (= e!58918 tp_is_empty!2559)))

(assert (= (and mapNonEmpty!3492 condMapEmpty!3502) mapIsEmpty!3502))

(assert (= (and mapNonEmpty!3492 (not condMapEmpty!3502)) mapNonEmpty!3502))

(assert (= (and mapNonEmpty!3502 ((_ is ValueCellFull!936) mapValue!3502)) b!90488))

(assert (= (and mapNonEmpty!3492 ((_ is ValueCellFull!936) mapDefault!3502)) b!90489))

(declare-fun m!97301 () Bool)

(assert (=> mapNonEmpty!3502 m!97301))

(declare-fun b_lambda!3993 () Bool)

(assert (= b_lambda!3991 (or (and b!90125 b_free!2285) (and b!90116 b_free!2287 (= (defaultEntry!2388 newMap!16) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))))) b_lambda!3993)))

(declare-fun b_lambda!3995 () Bool)

(assert (= b_lambda!3987 (or (and b!90125 b_free!2285) (and b!90116 b_free!2287 (= (defaultEntry!2388 newMap!16) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))))) b_lambda!3995)))

(declare-fun b_lambda!3997 () Bool)

(assert (= b_lambda!3989 (or (and b!90125 b_free!2285) (and b!90116 b_free!2287 (= (defaultEntry!2388 newMap!16) (defaultEntry!2388 (v!2693 (underlying!301 thiss!992))))) b_lambda!3997)))

(check-sat (not b!90409) (not b!90406) (not b!90331) (not bm!8781) (not b!90476) (not b!90415) (not b_lambda!3995) (not b!90461) (not d!24043) (not d!24003) (not b!90472) (not d!24039) (not b!90358) (not b!90195) (not b!90332) (not b!90405) (not b!90475) (not d!24041) (not bm!8777) (not b_lambda!3997) (not bm!8785) (not b!90311) (not b!90478) (not d!24025) (not d!24035) (not b!90465) (not bm!8818) (not b!90319) (not b!90299) b_and!5447 (not b_next!2285) (not bm!8780) (not b_lambda!3993) (not b!90460) (not b!90355) (not b!90320) (not d!24027) (not bm!8824) (not mapNonEmpty!3501) (not b!90196) (not b!90463) (not bm!8782) (not b!90434) (not d!23995) (not b!90206) (not bm!8778) (not bm!8790) (not b!90425) (not bm!8817) (not d!23993) (not bm!8786) (not mapNonEmpty!3502) (not d!24029) (not b!90416) (not b!90479) (not b!90338) (not b!90468) b_and!5449 (not b!90423) (not bm!8800) (not bm!8789) (not d!24033) (not b!90424) (not d!24021) (not b_lambda!3985) (not b!90356) (not b!90301) (not b!90430) (not d!24023) (not d!24013) (not d!24031) (not bm!8783) (not b!90473) (not d!24045) (not b_next!2287) (not b!90474) (not b!90419) (not b!90466) (not bm!8821) (not b!90433) (not bm!8784) (not b!90435) (not d!24001) (not b!90294) (not b!90343) (not b!90477) (not b!90464) (not b!90432) (not b!90470) (not d!24009) tp_is_empty!2559 (not b!90197) (not b!90204) (not bm!8815) (not b!90404) (not bm!8791) (not b!90403) (not d!24037) (not b!90431) (not d!24007))
(check-sat b_and!5447 b_and!5449 (not b_next!2285) (not b_next!2287))
