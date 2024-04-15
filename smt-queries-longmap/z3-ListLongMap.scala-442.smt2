; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8268 () Bool)

(assert start!8268)

(declare-fun b!52901 () Bool)

(declare-fun b_free!1693 () Bool)

(declare-fun b_next!1693 () Bool)

(assert (=> b!52901 (= b_free!1693 (not b_next!1693))))

(declare-fun tp!7181 () Bool)

(declare-fun b_and!2929 () Bool)

(assert (=> b!52901 (= tp!7181 b_and!2929)))

(declare-fun b!52891 () Bool)

(declare-fun b_free!1695 () Bool)

(declare-fun b_next!1695 () Bool)

(assert (=> b!52891 (= b_free!1695 (not b_next!1695))))

(declare-fun tp!7182 () Bool)

(declare-fun b_and!2931 () Bool)

(assert (=> b!52891 (= tp!7182 b_and!2931)))

(declare-fun b!52884 () Bool)

(declare-fun res!30034 () Bool)

(declare-fun e!34477 () Bool)

(assert (=> b!52884 (=> (not res!30034) (not e!34477))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2665 0))(
  ( (V!2666 (val!1176 Int)) )
))
(declare-datatypes ((array!3429 0))(
  ( (array!3430 (arr!1636 (Array (_ BitVec 32) (_ BitVec 64))) (size!1866 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!788 0))(
  ( (ValueCellFull!788 (v!2238 V!2665)) (EmptyCell!788) )
))
(declare-datatypes ((array!3431 0))(
  ( (array!3432 (arr!1637 (Array (_ BitVec 32) ValueCell!788)) (size!1867 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!484 0))(
  ( (LongMapFixedSize!485 (defaultEntry!1956 Int) (mask!5786 (_ BitVec 32)) (extraKeys!1847 (_ BitVec 32)) (zeroValue!1874 V!2665) (minValue!1874 V!2665) (_size!291 (_ BitVec 32)) (_keys!3575 array!3429) (_values!1939 array!3431) (_vacant!291 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!304 0))(
  ( (Cell!305 (v!2239 LongMapFixedSize!484)) )
))
(declare-datatypes ((LongMap!304 0))(
  ( (LongMap!305 (underlying!163 Cell!304)) )
))
(declare-fun thiss!992 () LongMap!304)

(assert (=> b!52884 (= res!30034 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1866 (_keys!3575 (v!2239 (underlying!163 thiss!992)))))))))

(declare-fun b!52886 () Bool)

(declare-fun res!30039 () Bool)

(declare-fun e!34485 () Bool)

(assert (=> b!52886 (=> (not res!30039) (not e!34485))))

(declare-datatypes ((List!1347 0))(
  ( (Nil!1344) (Cons!1343 (h!1923 (_ BitVec 64)) (t!4408 List!1347)) )
))
(declare-fun arrayNoDuplicates!0 (array!3429 (_ BitVec 32) List!1347) Bool)

(assert (=> b!52886 (= res!30039 (arrayNoDuplicates!0 (_keys!3575 (v!2239 (underlying!163 thiss!992))) #b00000000000000000000000000000000 Nil!1344))))

(declare-fun b!52887 () Bool)

(declare-fun e!34488 () Bool)

(assert (=> b!52887 (= e!34488 e!34485)))

(declare-fun res!30029 () Bool)

(assert (=> b!52887 (=> (not res!30029) (not e!34485))))

(declare-datatypes ((tuple2!1876 0))(
  ( (tuple2!1877 (_1!949 (_ BitVec 64)) (_2!949 V!2665)) )
))
(declare-datatypes ((List!1348 0))(
  ( (Nil!1345) (Cons!1344 (h!1924 tuple2!1876) (t!4409 List!1348)) )
))
(declare-datatypes ((ListLongMap!1269 0))(
  ( (ListLongMap!1270 (toList!650 List!1348)) )
))
(declare-fun lt!21361 () ListLongMap!1269)

(declare-fun contains!627 (ListLongMap!1269 (_ BitVec 64)) Bool)

(assert (=> b!52887 (= res!30029 (contains!627 lt!21361 (select (arr!1636 (_keys!3575 (v!2239 (underlying!163 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1878 0))(
  ( (tuple2!1879 (_1!950 Bool) (_2!950 LongMapFixedSize!484)) )
))
(declare-fun lt!21359 () tuple2!1878)

(declare-fun newMap!16 () LongMapFixedSize!484)

(declare-fun update!48 (LongMapFixedSize!484 (_ BitVec 64) V!2665) tuple2!1878)

(declare-fun get!988 (ValueCell!788 V!2665) V!2665)

(declare-fun dynLambda!272 (Int (_ BitVec 64)) V!2665)

(assert (=> b!52887 (= lt!21359 (update!48 newMap!16 (select (arr!1636 (_keys!3575 (v!2239 (underlying!163 thiss!992)))) from!355) (get!988 (select (arr!1637 (_values!1939 (v!2239 (underlying!163 thiss!992)))) from!355) (dynLambda!272 (defaultEntry!1956 (v!2239 (underlying!163 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!2459 () Bool)

(declare-fun mapRes!2460 () Bool)

(assert (=> mapIsEmpty!2459 mapRes!2460))

(declare-fun b!52888 () Bool)

(assert (=> b!52888 (= e!34477 e!34488)))

(declare-fun res!30036 () Bool)

(assert (=> b!52888 (=> (not res!30036) (not e!34488))))

(declare-fun lt!21360 () ListLongMap!1269)

(assert (=> b!52888 (= res!30036 (and (= lt!21360 lt!21361) (not (= (select (arr!1636 (_keys!3575 (v!2239 (underlying!163 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1636 (_keys!3575 (v!2239 (underlying!163 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1024 (LongMapFixedSize!484) ListLongMap!1269)

(assert (=> b!52888 (= lt!21361 (map!1024 newMap!16))))

(declare-fun getCurrentListMap!354 (array!3429 array!3431 (_ BitVec 32) (_ BitVec 32) V!2665 V!2665 (_ BitVec 32) Int) ListLongMap!1269)

(assert (=> b!52888 (= lt!21360 (getCurrentListMap!354 (_keys!3575 (v!2239 (underlying!163 thiss!992))) (_values!1939 (v!2239 (underlying!163 thiss!992))) (mask!5786 (v!2239 (underlying!163 thiss!992))) (extraKeys!1847 (v!2239 (underlying!163 thiss!992))) (zeroValue!1874 (v!2239 (underlying!163 thiss!992))) (minValue!1874 (v!2239 (underlying!163 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1956 (v!2239 (underlying!163 thiss!992)))))))

(declare-fun b!52889 () Bool)

(declare-fun res!30038 () Bool)

(assert (=> b!52889 (=> (not res!30038) (not e!34477))))

(declare-fun valid!186 (LongMapFixedSize!484) Bool)

(assert (=> b!52889 (= res!30038 (valid!186 newMap!16))))

(declare-fun b!52890 () Bool)

(declare-fun e!34489 () Bool)

(declare-fun tp_is_empty!2263 () Bool)

(assert (=> b!52890 (= e!34489 tp_is_empty!2263)))

(declare-fun e!34480 () Bool)

(declare-fun e!34481 () Bool)

(declare-fun array_inv!1001 (array!3429) Bool)

(declare-fun array_inv!1002 (array!3431) Bool)

(assert (=> b!52891 (= e!34480 (and tp!7182 tp_is_empty!2263 (array_inv!1001 (_keys!3575 newMap!16)) (array_inv!1002 (_values!1939 newMap!16)) e!34481))))

(declare-fun b!52892 () Bool)

(assert (=> b!52892 (= e!34481 (and e!34489 mapRes!2460))))

(declare-fun condMapEmpty!2459 () Bool)

(declare-fun mapDefault!2459 () ValueCell!788)

(assert (=> b!52892 (= condMapEmpty!2459 (= (arr!1637 (_values!1939 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!788)) mapDefault!2459)))))

(declare-fun b!52893 () Bool)

(declare-fun res!30031 () Bool)

(assert (=> b!52893 (=> (not res!30031) (not e!34485))))

(assert (=> b!52893 (= res!30031 (and (= (size!1867 (_values!1939 (v!2239 (underlying!163 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5786 (v!2239 (underlying!163 thiss!992))))) (= (size!1866 (_keys!3575 (v!2239 (underlying!163 thiss!992)))) (size!1867 (_values!1939 (v!2239 (underlying!163 thiss!992))))) (bvsge (mask!5786 (v!2239 (underlying!163 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1847 (v!2239 (underlying!163 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1847 (v!2239 (underlying!163 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!52894 () Bool)

(declare-fun res!30035 () Bool)

(assert (=> b!52894 (=> (not res!30035) (not e!34485))))

(assert (=> b!52894 (= res!30035 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1866 (_keys!3575 (v!2239 (underlying!163 thiss!992)))))))))

(declare-fun mapIsEmpty!2460 () Bool)

(declare-fun mapRes!2459 () Bool)

(assert (=> mapIsEmpty!2460 mapRes!2459))

(declare-fun b!52895 () Bool)

(assert (=> b!52895 (= e!34485 false)))

(declare-fun lt!21362 () Bool)

(assert (=> b!52895 (= lt!21362 (contains!627 lt!21360 (select (arr!1636 (_keys!3575 (v!2239 (underlying!163 thiss!992)))) from!355)))))

(declare-fun res!30032 () Bool)

(assert (=> start!8268 (=> (not res!30032) (not e!34477))))

(declare-fun valid!187 (LongMap!304) Bool)

(assert (=> start!8268 (= res!30032 (valid!187 thiss!992))))

(assert (=> start!8268 e!34477))

(declare-fun e!34478 () Bool)

(assert (=> start!8268 e!34478))

(assert (=> start!8268 true))

(assert (=> start!8268 e!34480))

(declare-fun b!52885 () Bool)

(declare-fun e!34486 () Bool)

(declare-fun e!34475 () Bool)

(assert (=> b!52885 (= e!34486 e!34475)))

(declare-fun b!52896 () Bool)

(declare-fun e!34476 () Bool)

(assert (=> b!52896 (= e!34476 tp_is_empty!2263)))

(declare-fun b!52897 () Bool)

(declare-fun res!30033 () Bool)

(assert (=> b!52897 (=> (not res!30033) (not e!34485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!52897 (= res!30033 (validMask!0 (mask!5786 (v!2239 (underlying!163 thiss!992)))))))

(declare-fun b!52898 () Bool)

(declare-fun e!34487 () Bool)

(assert (=> b!52898 (= e!34487 tp_is_empty!2263)))

(declare-fun b!52899 () Bool)

(declare-fun e!34479 () Bool)

(assert (=> b!52899 (= e!34479 tp_is_empty!2263)))

(declare-fun b!52900 () Bool)

(declare-fun res!30037 () Bool)

(assert (=> b!52900 (=> (not res!30037) (not e!34477))))

(assert (=> b!52900 (= res!30037 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5786 newMap!16)) (_size!291 (v!2239 (underlying!163 thiss!992)))))))

(declare-fun mapNonEmpty!2459 () Bool)

(declare-fun tp!7179 () Bool)

(assert (=> mapNonEmpty!2459 (= mapRes!2459 (and tp!7179 e!34487))))

(declare-fun mapRest!2460 () (Array (_ BitVec 32) ValueCell!788))

(declare-fun mapValue!2460 () ValueCell!788)

(declare-fun mapKey!2459 () (_ BitVec 32))

(assert (=> mapNonEmpty!2459 (= (arr!1637 (_values!1939 (v!2239 (underlying!163 thiss!992)))) (store mapRest!2460 mapKey!2459 mapValue!2460))))

(declare-fun e!34482 () Bool)

(assert (=> b!52901 (= e!34475 (and tp!7181 tp_is_empty!2263 (array_inv!1001 (_keys!3575 (v!2239 (underlying!163 thiss!992)))) (array_inv!1002 (_values!1939 (v!2239 (underlying!163 thiss!992)))) e!34482))))

(declare-fun b!52902 () Bool)

(assert (=> b!52902 (= e!34478 e!34486)))

(declare-fun b!52903 () Bool)

(declare-fun res!30030 () Bool)

(assert (=> b!52903 (=> (not res!30030) (not e!34485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3429 (_ BitVec 32)) Bool)

(assert (=> b!52903 (= res!30030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3575 (v!2239 (underlying!163 thiss!992))) (mask!5786 (v!2239 (underlying!163 thiss!992)))))))

(declare-fun b!52904 () Bool)

(assert (=> b!52904 (= e!34482 (and e!34479 mapRes!2459))))

(declare-fun condMapEmpty!2460 () Bool)

(declare-fun mapDefault!2460 () ValueCell!788)

(assert (=> b!52904 (= condMapEmpty!2460 (= (arr!1637 (_values!1939 (v!2239 (underlying!163 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!788)) mapDefault!2460)))))

(declare-fun mapNonEmpty!2460 () Bool)

(declare-fun tp!7180 () Bool)

(assert (=> mapNonEmpty!2460 (= mapRes!2460 (and tp!7180 e!34476))))

(declare-fun mapRest!2459 () (Array (_ BitVec 32) ValueCell!788))

(declare-fun mapKey!2460 () (_ BitVec 32))

(declare-fun mapValue!2459 () ValueCell!788)

(assert (=> mapNonEmpty!2460 (= (arr!1637 (_values!1939 newMap!16)) (store mapRest!2459 mapKey!2460 mapValue!2459))))

(assert (= (and start!8268 res!30032) b!52884))

(assert (= (and b!52884 res!30034) b!52889))

(assert (= (and b!52889 res!30038) b!52900))

(assert (= (and b!52900 res!30037) b!52888))

(assert (= (and b!52888 res!30036) b!52887))

(assert (= (and b!52887 res!30029) b!52897))

(assert (= (and b!52897 res!30033) b!52893))

(assert (= (and b!52893 res!30031) b!52903))

(assert (= (and b!52903 res!30030) b!52886))

(assert (= (and b!52886 res!30039) b!52894))

(assert (= (and b!52894 res!30035) b!52895))

(assert (= (and b!52904 condMapEmpty!2460) mapIsEmpty!2460))

(assert (= (and b!52904 (not condMapEmpty!2460)) mapNonEmpty!2459))

(get-info :version)

(assert (= (and mapNonEmpty!2459 ((_ is ValueCellFull!788) mapValue!2460)) b!52898))

(assert (= (and b!52904 ((_ is ValueCellFull!788) mapDefault!2460)) b!52899))

(assert (= b!52901 b!52904))

(assert (= b!52885 b!52901))

(assert (= b!52902 b!52885))

(assert (= start!8268 b!52902))

(assert (= (and b!52892 condMapEmpty!2459) mapIsEmpty!2459))

(assert (= (and b!52892 (not condMapEmpty!2459)) mapNonEmpty!2460))

(assert (= (and mapNonEmpty!2460 ((_ is ValueCellFull!788) mapValue!2459)) b!52896))

(assert (= (and b!52892 ((_ is ValueCellFull!788) mapDefault!2459)) b!52890))

(assert (= b!52891 b!52892))

(assert (= start!8268 b!52891))

(declare-fun b_lambda!2361 () Bool)

(assert (=> (not b_lambda!2361) (not b!52887)))

(declare-fun t!4405 () Bool)

(declare-fun tb!1037 () Bool)

(assert (=> (and b!52901 (= (defaultEntry!1956 (v!2239 (underlying!163 thiss!992))) (defaultEntry!1956 (v!2239 (underlying!163 thiss!992)))) t!4405) tb!1037))

(declare-fun result!1953 () Bool)

(assert (=> tb!1037 (= result!1953 tp_is_empty!2263)))

(assert (=> b!52887 t!4405))

(declare-fun b_and!2933 () Bool)

(assert (= b_and!2929 (and (=> t!4405 result!1953) b_and!2933)))

(declare-fun t!4407 () Bool)

(declare-fun tb!1039 () Bool)

(assert (=> (and b!52891 (= (defaultEntry!1956 newMap!16) (defaultEntry!1956 (v!2239 (underlying!163 thiss!992)))) t!4407) tb!1039))

(declare-fun result!1957 () Bool)

(assert (= result!1957 result!1953))

(assert (=> b!52887 t!4407))

(declare-fun b_and!2935 () Bool)

(assert (= b_and!2931 (and (=> t!4407 result!1957) b_and!2935)))

(declare-fun m!45043 () Bool)

(assert (=> b!52889 m!45043))

(declare-fun m!45045 () Bool)

(assert (=> b!52897 m!45045))

(declare-fun m!45047 () Bool)

(assert (=> b!52887 m!45047))

(declare-fun m!45049 () Bool)

(assert (=> b!52887 m!45049))

(declare-fun m!45051 () Bool)

(assert (=> b!52887 m!45051))

(declare-fun m!45053 () Bool)

(assert (=> b!52887 m!45053))

(assert (=> b!52887 m!45049))

(assert (=> b!52887 m!45053))

(declare-fun m!45055 () Bool)

(assert (=> b!52887 m!45055))

(assert (=> b!52887 m!45053))

(assert (=> b!52887 m!45051))

(declare-fun m!45057 () Bool)

(assert (=> b!52887 m!45057))

(assert (=> b!52887 m!45047))

(declare-fun m!45059 () Bool)

(assert (=> mapNonEmpty!2459 m!45059))

(assert (=> b!52888 m!45053))

(declare-fun m!45061 () Bool)

(assert (=> b!52888 m!45061))

(declare-fun m!45063 () Bool)

(assert (=> b!52888 m!45063))

(declare-fun m!45065 () Bool)

(assert (=> mapNonEmpty!2460 m!45065))

(declare-fun m!45067 () Bool)

(assert (=> b!52903 m!45067))

(declare-fun m!45069 () Bool)

(assert (=> b!52886 m!45069))

(declare-fun m!45071 () Bool)

(assert (=> b!52901 m!45071))

(declare-fun m!45073 () Bool)

(assert (=> b!52901 m!45073))

(declare-fun m!45075 () Bool)

(assert (=> b!52891 m!45075))

(declare-fun m!45077 () Bool)

(assert (=> b!52891 m!45077))

(assert (=> b!52895 m!45053))

(assert (=> b!52895 m!45053))

(declare-fun m!45079 () Bool)

(assert (=> b!52895 m!45079))

(declare-fun m!45081 () Bool)

(assert (=> start!8268 m!45081))

(check-sat (not mapNonEmpty!2460) (not b!52887) (not b!52903) tp_is_empty!2263 (not b!52901) (not b!52888) b_and!2933 (not b!52886) (not b_next!1695) (not mapNonEmpty!2459) (not start!8268) (not b!52889) (not b!52895) (not b!52897) (not b!52891) b_and!2935 (not b_lambda!2361) (not b_next!1693))
(check-sat b_and!2933 b_and!2935 (not b_next!1693) (not b_next!1695))
