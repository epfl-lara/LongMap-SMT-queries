; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8370 () Bool)

(assert start!8370)

(declare-fun b!56025 () Bool)

(declare-fun b_free!1897 () Bool)

(declare-fun b_next!1897 () Bool)

(assert (=> b!56025 (= b_free!1897 (not b_next!1897))))

(declare-fun tp!7794 () Bool)

(declare-fun b_and!3337 () Bool)

(assert (=> b!56025 (= tp!7794 b_and!3337)))

(declare-fun b!56032 () Bool)

(declare-fun b_free!1899 () Bool)

(declare-fun b_next!1899 () Bool)

(assert (=> b!56032 (= b_free!1899 (not b_next!1899))))

(declare-fun tp!7791 () Bool)

(declare-fun b_and!3339 () Bool)

(assert (=> b!56032 (= tp!7791 b_and!3339)))

(declare-fun b!56019 () Bool)

(declare-fun e!36854 () Bool)

(declare-fun e!36867 () Bool)

(assert (=> b!56019 (= e!36854 e!36867)))

(declare-fun b!56020 () Bool)

(declare-fun e!36856 () Bool)

(declare-fun tp_is_empty!2365 () Bool)

(assert (=> b!56020 (= e!36856 tp_is_empty!2365)))

(declare-fun b!56021 () Bool)

(declare-fun e!36861 () Bool)

(declare-fun e!36863 () Bool)

(assert (=> b!56021 (= e!36861 e!36863)))

(declare-fun res!31542 () Bool)

(assert (=> b!56021 (=> (not res!31542) (not e!36863))))

(declare-datatypes ((V!2801 0))(
  ( (V!2802 (val!1227 Int)) )
))
(declare-datatypes ((array!3633 0))(
  ( (array!3634 (arr!1738 (Array (_ BitVec 32) (_ BitVec 64))) (size!1968 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!839 0))(
  ( (ValueCellFull!839 (v!2335 V!2801)) (EmptyCell!839) )
))
(declare-datatypes ((array!3635 0))(
  ( (array!3636 (arr!1739 (Array (_ BitVec 32) ValueCell!839)) (size!1969 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!586 0))(
  ( (LongMapFixedSize!587 (defaultEntry!2007 Int) (mask!5871 (_ BitVec 32)) (extraKeys!1898 (_ BitVec 32)) (zeroValue!1925 V!2801) (minValue!1925 V!2801) (_size!342 (_ BitVec 32)) (_keys!3626 array!3633) (_values!1990 array!3635) (_vacant!342 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!396 0))(
  ( (Cell!397 (v!2336 LongMapFixedSize!586)) )
))
(declare-datatypes ((LongMap!396 0))(
  ( (LongMap!397 (underlying!209 Cell!396)) )
))
(declare-fun thiss!992 () LongMap!396)

(declare-datatypes ((tuple2!2000 0))(
  ( (tuple2!2001 (_1!1011 (_ BitVec 64)) (_2!1011 V!2801)) )
))
(declare-datatypes ((List!1415 0))(
  ( (Nil!1412) (Cons!1411 (h!1991 tuple2!2000) (t!4680 List!1415)) )
))
(declare-datatypes ((ListLongMap!1337 0))(
  ( (ListLongMap!1338 (toList!684 List!1415)) )
))
(declare-fun lt!22132 () ListLongMap!1337)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!666 (ListLongMap!1337 (_ BitVec 64)) Bool)

(assert (=> b!56021 (= res!31542 (contains!666 lt!22132 (select (arr!1738 (_keys!3626 (v!2336 (underlying!209 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2002 0))(
  ( (tuple2!2003 (_1!1012 Bool) (_2!1012 LongMapFixedSize!586)) )
))
(declare-fun lt!22136 () tuple2!2002)

(declare-fun newMap!16 () LongMapFixedSize!586)

(declare-fun update!76 (LongMapFixedSize!586 (_ BitVec 64) V!2801) tuple2!2002)

(declare-fun get!1050 (ValueCell!839 V!2801) V!2801)

(declare-fun dynLambda!300 (Int (_ BitVec 64)) V!2801)

(assert (=> b!56021 (= lt!22136 (update!76 newMap!16 (select (arr!1738 (_keys!3626 (v!2336 (underlying!209 thiss!992)))) from!355) (get!1050 (select (arr!1739 (_values!1990 (v!2336 (underlying!209 thiss!992)))) from!355) (dynLambda!300 (defaultEntry!2007 (v!2336 (underlying!209 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!56022 () Bool)

(declare-fun res!31538 () Bool)

(declare-fun e!36865 () Bool)

(assert (=> b!56022 (=> (not res!31538) (not e!36865))))

(assert (=> b!56022 (= res!31538 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1968 (_keys!3626 (v!2336 (underlying!209 thiss!992)))))))))

(declare-fun mapNonEmpty!2765 () Bool)

(declare-fun mapRes!2765 () Bool)

(declare-fun tp!7793 () Bool)

(declare-fun e!36857 () Bool)

(assert (=> mapNonEmpty!2765 (= mapRes!2765 (and tp!7793 e!36857))))

(declare-fun mapKey!2765 () (_ BitVec 32))

(declare-fun mapRest!2766 () (Array (_ BitVec 32) ValueCell!839))

(declare-fun mapValue!2765 () ValueCell!839)

(assert (=> mapNonEmpty!2765 (= (arr!1739 (_values!1990 newMap!16)) (store mapRest!2766 mapKey!2765 mapValue!2765))))

(declare-fun b!56023 () Bool)

(declare-fun e!36862 () Bool)

(assert (=> b!56023 (= e!36862 tp_is_empty!2365)))

(declare-fun b!56024 () Bool)

(declare-fun res!31532 () Bool)

(declare-fun e!36855 () Bool)

(assert (=> b!56024 (=> res!31532 e!36855)))

(declare-datatypes ((List!1416 0))(
  ( (Nil!1413) (Cons!1412 (h!1992 (_ BitVec 64)) (t!4681 List!1416)) )
))
(declare-fun lt!22133 () List!1416)

(declare-fun contains!667 (List!1416 (_ BitVec 64)) Bool)

(assert (=> b!56024 (= res!31532 (contains!667 lt!22133 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!36860 () Bool)

(declare-fun e!36853 () Bool)

(declare-fun array_inv!1073 (array!3633) Bool)

(declare-fun array_inv!1074 (array!3635) Bool)

(assert (=> b!56025 (= e!36860 (and tp!7794 tp_is_empty!2365 (array_inv!1073 (_keys!3626 (v!2336 (underlying!209 thiss!992)))) (array_inv!1074 (_values!1990 (v!2336 (underlying!209 thiss!992)))) e!36853))))

(declare-fun b!56026 () Bool)

(assert (=> b!56026 (= e!36857 tp_is_empty!2365)))

(declare-fun b!56027 () Bool)

(assert (=> b!56027 (= e!36865 e!36861)))

(declare-fun res!31533 () Bool)

(assert (=> b!56027 (=> (not res!31533) (not e!36861))))

(declare-fun lt!22135 () ListLongMap!1337)

(assert (=> b!56027 (= res!31533 (and (= lt!22135 lt!22132) (not (= (select (arr!1738 (_keys!3626 (v!2336 (underlying!209 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1738 (_keys!3626 (v!2336 (underlying!209 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1086 (LongMapFixedSize!586) ListLongMap!1337)

(assert (=> b!56027 (= lt!22132 (map!1086 newMap!16))))

(declare-fun getCurrentListMap!382 (array!3633 array!3635 (_ BitVec 32) (_ BitVec 32) V!2801 V!2801 (_ BitVec 32) Int) ListLongMap!1337)

(assert (=> b!56027 (= lt!22135 (getCurrentListMap!382 (_keys!3626 (v!2336 (underlying!209 thiss!992))) (_values!1990 (v!2336 (underlying!209 thiss!992))) (mask!5871 (v!2336 (underlying!209 thiss!992))) (extraKeys!1898 (v!2336 (underlying!209 thiss!992))) (zeroValue!1925 (v!2336 (underlying!209 thiss!992))) (minValue!1925 (v!2336 (underlying!209 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2007 (v!2336 (underlying!209 thiss!992)))))))

(declare-fun b!56029 () Bool)

(assert (=> b!56029 (= e!36855 true)))

(declare-fun lt!22134 () Bool)

(assert (=> b!56029 (= lt!22134 (contains!667 lt!22133 (select (arr!1738 (_keys!3626 (v!2336 (underlying!209 thiss!992)))) from!355)))))

(declare-fun mapIsEmpty!2765 () Bool)

(declare-fun mapRes!2766 () Bool)

(assert (=> mapIsEmpty!2765 mapRes!2766))

(declare-fun mapNonEmpty!2766 () Bool)

(declare-fun tp!7792 () Bool)

(assert (=> mapNonEmpty!2766 (= mapRes!2766 (and tp!7792 e!36862))))

(declare-fun mapKey!2766 () (_ BitVec 32))

(declare-fun mapRest!2765 () (Array (_ BitVec 32) ValueCell!839))

(declare-fun mapValue!2766 () ValueCell!839)

(assert (=> mapNonEmpty!2766 (= (arr!1739 (_values!1990 (v!2336 (underlying!209 thiss!992)))) (store mapRest!2765 mapKey!2766 mapValue!2766))))

(declare-fun b!56030 () Bool)

(declare-fun e!36868 () Bool)

(assert (=> b!56030 (= e!36853 (and e!36868 mapRes!2766))))

(declare-fun condMapEmpty!2765 () Bool)

(declare-fun mapDefault!2765 () ValueCell!839)

(assert (=> b!56030 (= condMapEmpty!2765 (= (arr!1739 (_values!1990 (v!2336 (underlying!209 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!839)) mapDefault!2765)))))

(declare-fun b!56031 () Bool)

(declare-fun res!31537 () Bool)

(assert (=> b!56031 (=> (not res!31537) (not e!36865))))

(declare-fun valid!238 (LongMapFixedSize!586) Bool)

(assert (=> b!56031 (= res!31537 (valid!238 newMap!16))))

(declare-fun e!36859 () Bool)

(declare-fun e!36866 () Bool)

(assert (=> b!56032 (= e!36866 (and tp!7791 tp_is_empty!2365 (array_inv!1073 (_keys!3626 newMap!16)) (array_inv!1074 (_values!1990 newMap!16)) e!36859))))

(declare-fun b!56033 () Bool)

(assert (=> b!56033 (= e!36863 (not e!36855))))

(declare-fun res!31541 () Bool)

(assert (=> b!56033 (=> res!31541 e!36855)))

(assert (=> b!56033 (= res!31541 (or (bvsge (size!1968 (_keys!3626 (v!2336 (underlying!209 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1968 (_keys!3626 (v!2336 (underlying!209 thiss!992)))))))))

(assert (=> b!56033 (= lt!22133 (Cons!1412 (select (arr!1738 (_keys!3626 (v!2336 (underlying!209 thiss!992)))) from!355) Nil!1413))))

(declare-fun arrayNoDuplicates!0 (array!3633 (_ BitVec 32) List!1416) Bool)

(assert (=> b!56033 (arrayNoDuplicates!0 (_keys!3626 (v!2336 (underlying!209 thiss!992))) from!355 Nil!1413)))

(declare-datatypes ((Unit!1460 0))(
  ( (Unit!1461) )
))
(declare-fun lt!22131 () Unit!1460)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3633 (_ BitVec 32) (_ BitVec 32)) Unit!1460)

(assert (=> b!56033 (= lt!22131 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3626 (v!2336 (underlying!209 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56033 (arrayContainsKey!0 (_keys!3626 (v!2336 (underlying!209 thiss!992))) (select (arr!1738 (_keys!3626 (v!2336 (underlying!209 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22130 () Unit!1460)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!17 (array!3633 array!3635 (_ BitVec 32) (_ BitVec 32) V!2801 V!2801 (_ BitVec 64) (_ BitVec 32) Int) Unit!1460)

(assert (=> b!56033 (= lt!22130 (lemmaListMapContainsThenArrayContainsFrom!17 (_keys!3626 (v!2336 (underlying!209 thiss!992))) (_values!1990 (v!2336 (underlying!209 thiss!992))) (mask!5871 (v!2336 (underlying!209 thiss!992))) (extraKeys!1898 (v!2336 (underlying!209 thiss!992))) (zeroValue!1925 (v!2336 (underlying!209 thiss!992))) (minValue!1925 (v!2336 (underlying!209 thiss!992))) (select (arr!1738 (_keys!3626 (v!2336 (underlying!209 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2007 (v!2336 (underlying!209 thiss!992)))))))

(declare-fun b!56034 () Bool)

(assert (=> b!56034 (= e!36868 tp_is_empty!2365)))

(declare-fun b!56035 () Bool)

(assert (=> b!56035 (= e!36867 e!36860)))

(declare-fun b!56036 () Bool)

(declare-fun res!31535 () Bool)

(assert (=> b!56036 (=> res!31535 e!36855)))

(assert (=> b!56036 (= res!31535 (not (arrayNoDuplicates!0 (_keys!3626 (v!2336 (underlying!209 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22133)))))

(declare-fun b!56037 () Bool)

(assert (=> b!56037 (= e!36859 (and e!36856 mapRes!2765))))

(declare-fun condMapEmpty!2766 () Bool)

(declare-fun mapDefault!2766 () ValueCell!839)

(assert (=> b!56037 (= condMapEmpty!2766 (= (arr!1739 (_values!1990 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!839)) mapDefault!2766)))))

(declare-fun b!56028 () Bool)

(declare-fun res!31536 () Bool)

(assert (=> b!56028 (=> res!31536 e!36855)))

(declare-fun noDuplicate!46 (List!1416) Bool)

(assert (=> b!56028 (= res!31536 (not (noDuplicate!46 lt!22133)))))

(declare-fun res!31540 () Bool)

(assert (=> start!8370 (=> (not res!31540) (not e!36865))))

(declare-fun valid!239 (LongMap!396) Bool)

(assert (=> start!8370 (= res!31540 (valid!239 thiss!992))))

(assert (=> start!8370 e!36865))

(assert (=> start!8370 e!36854))

(assert (=> start!8370 true))

(assert (=> start!8370 e!36866))

(declare-fun b!56038 () Bool)

(declare-fun res!31534 () Bool)

(assert (=> b!56038 (=> res!31534 e!36855)))

(assert (=> b!56038 (= res!31534 (contains!667 lt!22133 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56039 () Bool)

(declare-fun res!31539 () Bool)

(assert (=> b!56039 (=> (not res!31539) (not e!36865))))

(assert (=> b!56039 (= res!31539 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5871 newMap!16)) (_size!342 (v!2336 (underlying!209 thiss!992)))))))

(declare-fun mapIsEmpty!2766 () Bool)

(assert (=> mapIsEmpty!2766 mapRes!2765))

(assert (= (and start!8370 res!31540) b!56022))

(assert (= (and b!56022 res!31538) b!56031))

(assert (= (and b!56031 res!31537) b!56039))

(assert (= (and b!56039 res!31539) b!56027))

(assert (= (and b!56027 res!31533) b!56021))

(assert (= (and b!56021 res!31542) b!56033))

(assert (= (and b!56033 (not res!31541)) b!56028))

(assert (= (and b!56028 (not res!31536)) b!56038))

(assert (= (and b!56038 (not res!31534)) b!56024))

(assert (= (and b!56024 (not res!31532)) b!56036))

(assert (= (and b!56036 (not res!31535)) b!56029))

(assert (= (and b!56030 condMapEmpty!2765) mapIsEmpty!2765))

(assert (= (and b!56030 (not condMapEmpty!2765)) mapNonEmpty!2766))

(get-info :version)

(assert (= (and mapNonEmpty!2766 ((_ is ValueCellFull!839) mapValue!2766)) b!56023))

(assert (= (and b!56030 ((_ is ValueCellFull!839) mapDefault!2765)) b!56034))

(assert (= b!56025 b!56030))

(assert (= b!56035 b!56025))

(assert (= b!56019 b!56035))

(assert (= start!8370 b!56019))

(assert (= (and b!56037 condMapEmpty!2766) mapIsEmpty!2766))

(assert (= (and b!56037 (not condMapEmpty!2766)) mapNonEmpty!2765))

(assert (= (and mapNonEmpty!2765 ((_ is ValueCellFull!839) mapValue!2765)) b!56026))

(assert (= (and b!56037 ((_ is ValueCellFull!839) mapDefault!2766)) b!56020))

(assert (= b!56032 b!56037))

(assert (= start!8370 b!56032))

(declare-fun b_lambda!2463 () Bool)

(assert (=> (not b_lambda!2463) (not b!56021)))

(declare-fun t!4677 () Bool)

(declare-fun tb!1241 () Bool)

(assert (=> (and b!56025 (= (defaultEntry!2007 (v!2336 (underlying!209 thiss!992))) (defaultEntry!2007 (v!2336 (underlying!209 thiss!992)))) t!4677) tb!1241))

(declare-fun result!2259 () Bool)

(assert (=> tb!1241 (= result!2259 tp_is_empty!2365)))

(assert (=> b!56021 t!4677))

(declare-fun b_and!3341 () Bool)

(assert (= b_and!3337 (and (=> t!4677 result!2259) b_and!3341)))

(declare-fun t!4679 () Bool)

(declare-fun tb!1243 () Bool)

(assert (=> (and b!56032 (= (defaultEntry!2007 newMap!16) (defaultEntry!2007 (v!2336 (underlying!209 thiss!992)))) t!4679) tb!1243))

(declare-fun result!2263 () Bool)

(assert (= result!2263 result!2259))

(assert (=> b!56021 t!4679))

(declare-fun b_and!3343 () Bool)

(assert (= b_and!3339 (and (=> t!4679 result!2263) b_and!3343)))

(declare-fun m!47173 () Bool)

(assert (=> b!56027 m!47173))

(declare-fun m!47175 () Bool)

(assert (=> b!56027 m!47175))

(declare-fun m!47177 () Bool)

(assert (=> b!56027 m!47177))

(declare-fun m!47179 () Bool)

(assert (=> b!56028 m!47179))

(declare-fun m!47181 () Bool)

(assert (=> b!56032 m!47181))

(declare-fun m!47183 () Bool)

(assert (=> b!56032 m!47183))

(declare-fun m!47185 () Bool)

(assert (=> b!56033 m!47185))

(declare-fun m!47187 () Bool)

(assert (=> b!56033 m!47187))

(assert (=> b!56033 m!47173))

(declare-fun m!47189 () Bool)

(assert (=> b!56033 m!47189))

(assert (=> b!56033 m!47173))

(assert (=> b!56033 m!47173))

(declare-fun m!47191 () Bool)

(assert (=> b!56033 m!47191))

(declare-fun m!47193 () Bool)

(assert (=> b!56031 m!47193))

(declare-fun m!47195 () Bool)

(assert (=> b!56024 m!47195))

(declare-fun m!47197 () Bool)

(assert (=> b!56021 m!47197))

(declare-fun m!47199 () Bool)

(assert (=> b!56021 m!47199))

(declare-fun m!47201 () Bool)

(assert (=> b!56021 m!47201))

(assert (=> b!56021 m!47173))

(assert (=> b!56021 m!47199))

(assert (=> b!56021 m!47173))

(assert (=> b!56021 m!47201))

(declare-fun m!47203 () Bool)

(assert (=> b!56021 m!47203))

(assert (=> b!56021 m!47197))

(assert (=> b!56021 m!47173))

(declare-fun m!47205 () Bool)

(assert (=> b!56021 m!47205))

(declare-fun m!47207 () Bool)

(assert (=> mapNonEmpty!2766 m!47207))

(declare-fun m!47209 () Bool)

(assert (=> b!56038 m!47209))

(declare-fun m!47211 () Bool)

(assert (=> b!56036 m!47211))

(declare-fun m!47213 () Bool)

(assert (=> b!56025 m!47213))

(declare-fun m!47215 () Bool)

(assert (=> b!56025 m!47215))

(declare-fun m!47217 () Bool)

(assert (=> mapNonEmpty!2765 m!47217))

(declare-fun m!47219 () Bool)

(assert (=> start!8370 m!47219))

(assert (=> b!56029 m!47173))

(assert (=> b!56029 m!47173))

(declare-fun m!47221 () Bool)

(assert (=> b!56029 m!47221))

(check-sat (not b!56036) (not b!56031) (not b!56025) tp_is_empty!2365 (not mapNonEmpty!2765) b_and!3341 (not b!56027) (not b!56028) (not b_next!1899) (not b!56029) b_and!3343 (not mapNonEmpty!2766) (not start!8370) (not b!56033) (not b!56032) (not b_lambda!2463) (not b!56024) (not b!56038) (not b_next!1897) (not b!56021))
(check-sat b_and!3341 b_and!3343 (not b_next!1897) (not b_next!1899))
