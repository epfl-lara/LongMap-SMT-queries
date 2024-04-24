; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8370 () Bool)

(assert start!8370)

(declare-fun b!56041 () Bool)

(declare-fun b_free!1897 () Bool)

(declare-fun b_next!1897 () Bool)

(assert (=> b!56041 (= b_free!1897 (not b_next!1897))))

(declare-fun tp!7794 () Bool)

(declare-fun b_and!3333 () Bool)

(assert (=> b!56041 (= tp!7794 b_and!3333)))

(declare-fun b!56034 () Bool)

(declare-fun b_free!1899 () Bool)

(declare-fun b_next!1899 () Bool)

(assert (=> b!56034 (= b_free!1899 (not b_next!1899))))

(declare-fun tp!7793 () Bool)

(declare-fun b_and!3335 () Bool)

(assert (=> b!56034 (= tp!7793 b_and!3335)))

(declare-fun b!56028 () Bool)

(declare-fun e!36861 () Bool)

(assert (=> b!56028 (= e!36861 true)))

(declare-datatypes ((V!2801 0))(
  ( (V!2802 (val!1227 Int)) )
))
(declare-datatypes ((array!3639 0))(
  ( (array!3640 (arr!1742 (Array (_ BitVec 32) (_ BitVec 64))) (size!1971 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!839 0))(
  ( (ValueCellFull!839 (v!2341 V!2801)) (EmptyCell!839) )
))
(declare-datatypes ((array!3641 0))(
  ( (array!3642 (arr!1743 (Array (_ BitVec 32) ValueCell!839)) (size!1972 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!586 0))(
  ( (LongMapFixedSize!587 (defaultEntry!2007 Int) (mask!5872 (_ BitVec 32)) (extraKeys!1898 (_ BitVec 32)) (zeroValue!1925 V!2801) (minValue!1925 V!2801) (_size!342 (_ BitVec 32)) (_keys!3627 array!3639) (_values!1990 array!3641) (_vacant!342 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!402 0))(
  ( (Cell!403 (v!2342 LongMapFixedSize!586)) )
))
(declare-datatypes ((LongMap!402 0))(
  ( (LongMap!403 (underlying!212 Cell!402)) )
))
(declare-fun thiss!992 () LongMap!402)

(declare-fun lt!22108 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((List!1403 0))(
  ( (Nil!1400) (Cons!1399 (h!1979 (_ BitVec 64)) (t!4669 List!1403)) )
))
(declare-fun lt!22109 () List!1403)

(declare-fun contains!662 (List!1403 (_ BitVec 64)) Bool)

(assert (=> b!56028 (= lt!22108 (contains!662 lt!22109 (select (arr!1742 (_keys!3627 (v!2342 (underlying!212 thiss!992)))) from!355)))))

(declare-fun b!56030 () Bool)

(declare-fun e!36866 () Bool)

(assert (=> b!56030 (= e!36866 (not e!36861))))

(declare-fun res!31529 () Bool)

(assert (=> b!56030 (=> res!31529 e!36861)))

(assert (=> b!56030 (= res!31529 (or (bvsge (size!1971 (_keys!3627 (v!2342 (underlying!212 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1971 (_keys!3627 (v!2342 (underlying!212 thiss!992)))))))))

(assert (=> b!56030 (= lt!22109 (Cons!1399 (select (arr!1742 (_keys!3627 (v!2342 (underlying!212 thiss!992)))) from!355) Nil!1400))))

(declare-fun arrayNoDuplicates!0 (array!3639 (_ BitVec 32) List!1403) Bool)

(assert (=> b!56030 (arrayNoDuplicates!0 (_keys!3627 (v!2342 (underlying!212 thiss!992))) from!355 Nil!1400)))

(declare-datatypes ((Unit!1466 0))(
  ( (Unit!1467) )
))
(declare-fun lt!22105 () Unit!1466)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3639 (_ BitVec 32) (_ BitVec 32)) Unit!1466)

(assert (=> b!56030 (= lt!22105 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3627 (v!2342 (underlying!212 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56030 (arrayContainsKey!0 (_keys!3627 (v!2342 (underlying!212 thiss!992))) (select (arr!1742 (_keys!3627 (v!2342 (underlying!212 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22103 () Unit!1466)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!17 (array!3639 array!3641 (_ BitVec 32) (_ BitVec 32) V!2801 V!2801 (_ BitVec 64) (_ BitVec 32) Int) Unit!1466)

(assert (=> b!56030 (= lt!22103 (lemmaListMapContainsThenArrayContainsFrom!17 (_keys!3627 (v!2342 (underlying!212 thiss!992))) (_values!1990 (v!2342 (underlying!212 thiss!992))) (mask!5872 (v!2342 (underlying!212 thiss!992))) (extraKeys!1898 (v!2342 (underlying!212 thiss!992))) (zeroValue!1925 (v!2342 (underlying!212 thiss!992))) (minValue!1925 (v!2342 (underlying!212 thiss!992))) (select (arr!1742 (_keys!3627 (v!2342 (underlying!212 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2007 (v!2342 (underlying!212 thiss!992)))))))

(declare-fun mapNonEmpty!2765 () Bool)

(declare-fun mapRes!2766 () Bool)

(declare-fun tp!7792 () Bool)

(declare-fun e!36865 () Bool)

(assert (=> mapNonEmpty!2765 (= mapRes!2766 (and tp!7792 e!36865))))

(declare-fun mapKey!2765 () (_ BitVec 32))

(declare-fun mapRest!2766 () (Array (_ BitVec 32) ValueCell!839))

(declare-fun mapValue!2765 () ValueCell!839)

(assert (=> mapNonEmpty!2765 (= (arr!1743 (_values!1990 (v!2342 (underlying!212 thiss!992)))) (store mapRest!2766 mapKey!2765 mapValue!2765))))

(declare-fun b!56031 () Bool)

(declare-fun res!31533 () Bool)

(declare-fun e!36868 () Bool)

(assert (=> b!56031 (=> (not res!31533) (not e!36868))))

(declare-fun newMap!16 () LongMapFixedSize!586)

(declare-fun valid!249 (LongMapFixedSize!586) Bool)

(assert (=> b!56031 (= res!31533 (valid!249 newMap!16))))

(declare-fun b!56032 () Bool)

(declare-fun res!31536 () Bool)

(assert (=> b!56032 (=> res!31536 e!36861)))

(assert (=> b!56032 (= res!31536 (contains!662 lt!22109 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56033 () Bool)

(declare-fun res!31531 () Bool)

(assert (=> b!56033 (=> (not res!31531) (not e!36868))))

(assert (=> b!56033 (= res!31531 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1971 (_keys!3627 (v!2342 (underlying!212 thiss!992)))))))))

(declare-fun tp_is_empty!2365 () Bool)

(declare-fun e!36864 () Bool)

(declare-fun e!36871 () Bool)

(declare-fun array_inv!1073 (array!3639) Bool)

(declare-fun array_inv!1074 (array!3641) Bool)

(assert (=> b!56034 (= e!36871 (and tp!7793 tp_is_empty!2365 (array_inv!1073 (_keys!3627 newMap!16)) (array_inv!1074 (_values!1990 newMap!16)) e!36864))))

(declare-fun b!56035 () Bool)

(declare-fun e!36874 () Bool)

(assert (=> b!56035 (= e!36874 tp_is_empty!2365)))

(declare-fun b!56036 () Bool)

(declare-fun e!36860 () Bool)

(declare-fun e!36873 () Bool)

(assert (=> b!56036 (= e!36860 (and e!36873 mapRes!2766))))

(declare-fun condMapEmpty!2766 () Bool)

(declare-fun mapDefault!2765 () ValueCell!839)

(assert (=> b!56036 (= condMapEmpty!2766 (= (arr!1743 (_values!1990 (v!2342 (underlying!212 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!839)) mapDefault!2765)))))

(declare-fun b!56037 () Bool)

(declare-fun e!36862 () Bool)

(assert (=> b!56037 (= e!36862 tp_is_empty!2365)))

(declare-fun mapIsEmpty!2765 () Bool)

(assert (=> mapIsEmpty!2765 mapRes!2766))

(declare-fun mapNonEmpty!2766 () Bool)

(declare-fun mapRes!2765 () Bool)

(declare-fun tp!7791 () Bool)

(assert (=> mapNonEmpty!2766 (= mapRes!2765 (and tp!7791 e!36862))))

(declare-fun mapRest!2765 () (Array (_ BitVec 32) ValueCell!839))

(declare-fun mapKey!2766 () (_ BitVec 32))

(declare-fun mapValue!2766 () ValueCell!839)

(assert (=> mapNonEmpty!2766 (= (arr!1743 (_values!1990 newMap!16)) (store mapRest!2765 mapKey!2766 mapValue!2766))))

(declare-fun res!31537 () Bool)

(assert (=> start!8370 (=> (not res!31537) (not e!36868))))

(declare-fun valid!250 (LongMap!402) Bool)

(assert (=> start!8370 (= res!31537 (valid!250 thiss!992))))

(assert (=> start!8370 e!36868))

(declare-fun e!36863 () Bool)

(assert (=> start!8370 e!36863))

(assert (=> start!8370 true))

(assert (=> start!8370 e!36871))

(declare-fun b!56029 () Bool)

(declare-fun res!31535 () Bool)

(assert (=> b!56029 (=> res!31535 e!36861)))

(assert (=> b!56029 (= res!31535 (not (arrayNoDuplicates!0 (_keys!3627 (v!2342 (underlying!212 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22109)))))

(declare-fun b!56038 () Bool)

(assert (=> b!56038 (= e!36864 (and e!36874 mapRes!2765))))

(declare-fun condMapEmpty!2765 () Bool)

(declare-fun mapDefault!2766 () ValueCell!839)

(assert (=> b!56038 (= condMapEmpty!2765 (= (arr!1743 (_values!1990 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!839)) mapDefault!2766)))))

(declare-fun mapIsEmpty!2766 () Bool)

(assert (=> mapIsEmpty!2766 mapRes!2765))

(declare-fun b!56039 () Bool)

(assert (=> b!56039 (= e!36865 tp_is_empty!2365)))

(declare-fun b!56040 () Bool)

(assert (=> b!56040 (= e!36873 tp_is_empty!2365)))

(declare-fun e!36867 () Bool)

(assert (=> b!56041 (= e!36867 (and tp!7794 tp_is_empty!2365 (array_inv!1073 (_keys!3627 (v!2342 (underlying!212 thiss!992)))) (array_inv!1074 (_values!1990 (v!2342 (underlying!212 thiss!992)))) e!36860))))

(declare-fun b!56042 () Bool)

(declare-fun res!31532 () Bool)

(assert (=> b!56042 (=> res!31532 e!36861)))

(assert (=> b!56042 (= res!31532 (contains!662 lt!22109 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56043 () Bool)

(declare-fun e!36869 () Bool)

(assert (=> b!56043 (= e!36869 e!36866)))

(declare-fun res!31530 () Bool)

(assert (=> b!56043 (=> (not res!31530) (not e!36866))))

(declare-datatypes ((tuple2!1980 0))(
  ( (tuple2!1981 (_1!1001 (_ BitVec 64)) (_2!1001 V!2801)) )
))
(declare-datatypes ((List!1404 0))(
  ( (Nil!1401) (Cons!1400 (h!1980 tuple2!1980) (t!4670 List!1404)) )
))
(declare-datatypes ((ListLongMap!1323 0))(
  ( (ListLongMap!1324 (toList!677 List!1404)) )
))
(declare-fun lt!22106 () ListLongMap!1323)

(declare-fun contains!663 (ListLongMap!1323 (_ BitVec 64)) Bool)

(assert (=> b!56043 (= res!31530 (contains!663 lt!22106 (select (arr!1742 (_keys!3627 (v!2342 (underlying!212 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1982 0))(
  ( (tuple2!1983 (_1!1002 Bool) (_2!1002 LongMapFixedSize!586)) )
))
(declare-fun lt!22107 () tuple2!1982)

(declare-fun update!79 (LongMapFixedSize!586 (_ BitVec 64) V!2801) tuple2!1982)

(declare-fun get!1050 (ValueCell!839 V!2801) V!2801)

(declare-fun dynLambda!297 (Int (_ BitVec 64)) V!2801)

(assert (=> b!56043 (= lt!22107 (update!79 newMap!16 (select (arr!1742 (_keys!3627 (v!2342 (underlying!212 thiss!992)))) from!355) (get!1050 (select (arr!1743 (_values!1990 (v!2342 (underlying!212 thiss!992)))) from!355) (dynLambda!297 (defaultEntry!2007 (v!2342 (underlying!212 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!56044 () Bool)

(declare-fun e!36872 () Bool)

(assert (=> b!56044 (= e!36872 e!36867)))

(declare-fun b!56045 () Bool)

(assert (=> b!56045 (= e!36868 e!36869)))

(declare-fun res!31534 () Bool)

(assert (=> b!56045 (=> (not res!31534) (not e!36869))))

(declare-fun lt!22104 () ListLongMap!1323)

(assert (=> b!56045 (= res!31534 (and (= lt!22104 lt!22106) (not (= (select (arr!1742 (_keys!3627 (v!2342 (underlying!212 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1742 (_keys!3627 (v!2342 (underlying!212 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1090 (LongMapFixedSize!586) ListLongMap!1323)

(assert (=> b!56045 (= lt!22106 (map!1090 newMap!16))))

(declare-fun getCurrentListMap!380 (array!3639 array!3641 (_ BitVec 32) (_ BitVec 32) V!2801 V!2801 (_ BitVec 32) Int) ListLongMap!1323)

(assert (=> b!56045 (= lt!22104 (getCurrentListMap!380 (_keys!3627 (v!2342 (underlying!212 thiss!992))) (_values!1990 (v!2342 (underlying!212 thiss!992))) (mask!5872 (v!2342 (underlying!212 thiss!992))) (extraKeys!1898 (v!2342 (underlying!212 thiss!992))) (zeroValue!1925 (v!2342 (underlying!212 thiss!992))) (minValue!1925 (v!2342 (underlying!212 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2007 (v!2342 (underlying!212 thiss!992)))))))

(declare-fun b!56046 () Bool)

(assert (=> b!56046 (= e!36863 e!36872)))

(declare-fun b!56047 () Bool)

(declare-fun res!31527 () Bool)

(assert (=> b!56047 (=> (not res!31527) (not e!36868))))

(assert (=> b!56047 (= res!31527 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5872 newMap!16)) (_size!342 (v!2342 (underlying!212 thiss!992)))))))

(declare-fun b!56048 () Bool)

(declare-fun res!31528 () Bool)

(assert (=> b!56048 (=> res!31528 e!36861)))

(declare-fun noDuplicate!43 (List!1403) Bool)

(assert (=> b!56048 (= res!31528 (not (noDuplicate!43 lt!22109)))))

(assert (= (and start!8370 res!31537) b!56033))

(assert (= (and b!56033 res!31531) b!56031))

(assert (= (and b!56031 res!31533) b!56047))

(assert (= (and b!56047 res!31527) b!56045))

(assert (= (and b!56045 res!31534) b!56043))

(assert (= (and b!56043 res!31530) b!56030))

(assert (= (and b!56030 (not res!31529)) b!56048))

(assert (= (and b!56048 (not res!31528)) b!56032))

(assert (= (and b!56032 (not res!31536)) b!56042))

(assert (= (and b!56042 (not res!31532)) b!56029))

(assert (= (and b!56029 (not res!31535)) b!56028))

(assert (= (and b!56036 condMapEmpty!2766) mapIsEmpty!2765))

(assert (= (and b!56036 (not condMapEmpty!2766)) mapNonEmpty!2765))

(get-info :version)

(assert (= (and mapNonEmpty!2765 ((_ is ValueCellFull!839) mapValue!2765)) b!56039))

(assert (= (and b!56036 ((_ is ValueCellFull!839) mapDefault!2765)) b!56040))

(assert (= b!56041 b!56036))

(assert (= b!56044 b!56041))

(assert (= b!56046 b!56044))

(assert (= start!8370 b!56046))

(assert (= (and b!56038 condMapEmpty!2765) mapIsEmpty!2766))

(assert (= (and b!56038 (not condMapEmpty!2765)) mapNonEmpty!2766))

(assert (= (and mapNonEmpty!2766 ((_ is ValueCellFull!839) mapValue!2766)) b!56037))

(assert (= (and b!56038 ((_ is ValueCellFull!839) mapDefault!2766)) b!56035))

(assert (= b!56034 b!56038))

(assert (= start!8370 b!56034))

(declare-fun b_lambda!2459 () Bool)

(assert (=> (not b_lambda!2459) (not b!56043)))

(declare-fun t!4666 () Bool)

(declare-fun tb!1241 () Bool)

(assert (=> (and b!56041 (= (defaultEntry!2007 (v!2342 (underlying!212 thiss!992))) (defaultEntry!2007 (v!2342 (underlying!212 thiss!992)))) t!4666) tb!1241))

(declare-fun result!2259 () Bool)

(assert (=> tb!1241 (= result!2259 tp_is_empty!2365)))

(assert (=> b!56043 t!4666))

(declare-fun b_and!3337 () Bool)

(assert (= b_and!3333 (and (=> t!4666 result!2259) b_and!3337)))

(declare-fun tb!1243 () Bool)

(declare-fun t!4668 () Bool)

(assert (=> (and b!56034 (= (defaultEntry!2007 newMap!16) (defaultEntry!2007 (v!2342 (underlying!212 thiss!992)))) t!4668) tb!1243))

(declare-fun result!2263 () Bool)

(assert (= result!2263 result!2259))

(assert (=> b!56043 t!4668))

(declare-fun b_and!3339 () Bool)

(assert (= b_and!3335 (and (=> t!4668 result!2263) b_and!3339)))

(declare-fun m!47131 () Bool)

(assert (=> b!56032 m!47131))

(declare-fun m!47133 () Bool)

(assert (=> b!56042 m!47133))

(declare-fun m!47135 () Bool)

(assert (=> start!8370 m!47135))

(declare-fun m!47137 () Bool)

(assert (=> b!56028 m!47137))

(assert (=> b!56028 m!47137))

(declare-fun m!47139 () Bool)

(assert (=> b!56028 m!47139))

(declare-fun m!47141 () Bool)

(assert (=> b!56030 m!47141))

(declare-fun m!47143 () Bool)

(assert (=> b!56030 m!47143))

(assert (=> b!56030 m!47137))

(declare-fun m!47145 () Bool)

(assert (=> b!56030 m!47145))

(assert (=> b!56030 m!47137))

(assert (=> b!56030 m!47137))

(declare-fun m!47147 () Bool)

(assert (=> b!56030 m!47147))

(declare-fun m!47149 () Bool)

(assert (=> b!56031 m!47149))

(declare-fun m!47151 () Bool)

(assert (=> mapNonEmpty!2766 m!47151))

(declare-fun m!47153 () Bool)

(assert (=> b!56041 m!47153))

(declare-fun m!47155 () Bool)

(assert (=> b!56041 m!47155))

(declare-fun m!47157 () Bool)

(assert (=> mapNonEmpty!2765 m!47157))

(declare-fun m!47159 () Bool)

(assert (=> b!56029 m!47159))

(declare-fun m!47161 () Bool)

(assert (=> b!56043 m!47161))

(declare-fun m!47163 () Bool)

(assert (=> b!56043 m!47163))

(declare-fun m!47165 () Bool)

(assert (=> b!56043 m!47165))

(assert (=> b!56043 m!47137))

(assert (=> b!56043 m!47163))

(assert (=> b!56043 m!47137))

(declare-fun m!47167 () Bool)

(assert (=> b!56043 m!47167))

(assert (=> b!56043 m!47137))

(assert (=> b!56043 m!47165))

(declare-fun m!47169 () Bool)

(assert (=> b!56043 m!47169))

(assert (=> b!56043 m!47161))

(assert (=> b!56045 m!47137))

(declare-fun m!47171 () Bool)

(assert (=> b!56045 m!47171))

(declare-fun m!47173 () Bool)

(assert (=> b!56045 m!47173))

(declare-fun m!47175 () Bool)

(assert (=> b!56034 m!47175))

(declare-fun m!47177 () Bool)

(assert (=> b!56034 m!47177))

(declare-fun m!47179 () Bool)

(assert (=> b!56048 m!47179))

(check-sat (not b!56029) tp_is_empty!2365 (not b!56032) (not b!56042) (not b!56048) (not mapNonEmpty!2766) (not b!56031) b_and!3339 (not b!56030) b_and!3337 (not b!56034) (not b!56028) (not b_next!1897) (not b_lambda!2459) (not start!8370) (not b!56043) (not b_next!1899) (not b!56041) (not mapNonEmpty!2765) (not b!56045))
(check-sat b_and!3337 b_and!3339 (not b_next!1897) (not b_next!1899))
