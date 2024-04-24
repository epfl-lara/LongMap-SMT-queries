; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8268 () Bool)

(assert start!8268)

(declare-fun b!52904 () Bool)

(declare-fun b_free!1693 () Bool)

(declare-fun b_next!1693 () Bool)

(assert (=> b!52904 (= b_free!1693 (not b_next!1693))))

(declare-fun tp!7179 () Bool)

(declare-fun b_and!2925 () Bool)

(assert (=> b!52904 (= tp!7179 b_and!2925)))

(declare-fun b!52901 () Bool)

(declare-fun b_free!1695 () Bool)

(declare-fun b_next!1695 () Bool)

(assert (=> b!52901 (= b_free!1695 (not b_next!1695))))

(declare-fun tp!7181 () Bool)

(declare-fun b_and!2927 () Bool)

(assert (=> b!52901 (= tp!7181 b_and!2927)))

(declare-fun b!52893 () Bool)

(declare-fun res!30025 () Bool)

(declare-fun e!34489 () Bool)

(assert (=> b!52893 (=> (not res!30025) (not e!34489))))

(declare-datatypes ((V!2665 0))(
  ( (V!2666 (val!1176 Int)) )
))
(declare-datatypes ((array!3435 0))(
  ( (array!3436 (arr!1640 (Array (_ BitVec 32) (_ BitVec 64))) (size!1869 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!788 0))(
  ( (ValueCellFull!788 (v!2241 V!2665)) (EmptyCell!788) )
))
(declare-datatypes ((array!3437 0))(
  ( (array!3438 (arr!1641 (Array (_ BitVec 32) ValueCell!788)) (size!1870 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!484 0))(
  ( (LongMapFixedSize!485 (defaultEntry!1956 Int) (mask!5787 (_ BitVec 32)) (extraKeys!1847 (_ BitVec 32)) (zeroValue!1874 V!2665) (minValue!1874 V!2665) (_size!291 (_ BitVec 32)) (_keys!3576 array!3435) (_values!1939 array!3437) (_vacant!291 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!484)

(declare-datatypes ((Cell!304 0))(
  ( (Cell!305 (v!2242 LongMapFixedSize!484)) )
))
(declare-datatypes ((LongMap!304 0))(
  ( (LongMap!305 (underlying!163 Cell!304)) )
))
(declare-fun thiss!992 () LongMap!304)

(assert (=> b!52893 (= res!30025 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5787 newMap!16)) (_size!291 (v!2242 (underlying!163 thiss!992)))))))

(declare-fun mapIsEmpty!2459 () Bool)

(declare-fun mapRes!2459 () Bool)

(assert (=> mapIsEmpty!2459 mapRes!2459))

(declare-fun b!52894 () Bool)

(declare-fun e!34491 () Bool)

(declare-fun e!34493 () Bool)

(assert (=> b!52894 (= e!34491 e!34493)))

(declare-fun res!30024 () Bool)

(assert (=> b!52894 (=> (not res!30024) (not e!34493))))

(declare-datatypes ((tuple2!1850 0))(
  ( (tuple2!1851 (_1!936 (_ BitVec 64)) (_2!936 V!2665)) )
))
(declare-datatypes ((List!1333 0))(
  ( (Nil!1330) (Cons!1329 (h!1909 tuple2!1850) (t!4395 List!1333)) )
))
(declare-datatypes ((ListLongMap!1251 0))(
  ( (ListLongMap!1252 (toList!641 List!1333)) )
))
(declare-fun lt!21334 () ListLongMap!1251)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!620 (ListLongMap!1251 (_ BitVec 64)) Bool)

(assert (=> b!52894 (= res!30024 (contains!620 lt!21334 (select (arr!1640 (_keys!3576 (v!2242 (underlying!163 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1852 0))(
  ( (tuple2!1853 (_1!937 Bool) (_2!937 LongMapFixedSize!484)) )
))
(declare-fun lt!21332 () tuple2!1852)

(declare-fun update!50 (LongMapFixedSize!484 (_ BitVec 64) V!2665) tuple2!1852)

(declare-fun get!987 (ValueCell!788 V!2665) V!2665)

(declare-fun dynLambda!268 (Int (_ BitVec 64)) V!2665)

(assert (=> b!52894 (= lt!21332 (update!50 newMap!16 (select (arr!1640 (_keys!3576 (v!2242 (underlying!163 thiss!992)))) from!355) (get!987 (select (arr!1641 (_values!1939 (v!2242 (underlying!163 thiss!992)))) from!355) (dynLambda!268 (defaultEntry!1956 (v!2242 (underlying!163 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!52895 () Bool)

(declare-fun res!30026 () Bool)

(assert (=> b!52895 (=> (not res!30026) (not e!34493))))

(assert (=> b!52895 (= res!30026 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1869 (_keys!3576 (v!2242 (underlying!163 thiss!992)))))))))

(declare-fun b!52896 () Bool)

(assert (=> b!52896 (= e!34493 false)))

(declare-fun lt!21333 () Bool)

(declare-fun lt!21335 () ListLongMap!1251)

(assert (=> b!52896 (= lt!21333 (contains!620 lt!21335 (select (arr!1640 (_keys!3576 (v!2242 (underlying!163 thiss!992)))) from!355)))))

(declare-fun b!52897 () Bool)

(declare-fun res!30028 () Bool)

(assert (=> b!52897 (=> (not res!30028) (not e!34493))))

(declare-datatypes ((List!1334 0))(
  ( (Nil!1331) (Cons!1330 (h!1910 (_ BitVec 64)) (t!4396 List!1334)) )
))
(declare-fun arrayNoDuplicates!0 (array!3435 (_ BitVec 32) List!1334) Bool)

(assert (=> b!52897 (= res!30028 (arrayNoDuplicates!0 (_keys!3576 (v!2242 (underlying!163 thiss!992))) #b00000000000000000000000000000000 Nil!1331))))

(declare-fun mapNonEmpty!2459 () Bool)

(declare-fun tp!7180 () Bool)

(declare-fun e!34490 () Bool)

(assert (=> mapNonEmpty!2459 (= mapRes!2459 (and tp!7180 e!34490))))

(declare-fun mapValue!2459 () ValueCell!788)

(declare-fun mapKey!2460 () (_ BitVec 32))

(declare-fun mapRest!2460 () (Array (_ BitVec 32) ValueCell!788))

(assert (=> mapNonEmpty!2459 (= (arr!1641 (_values!1939 newMap!16)) (store mapRest!2460 mapKey!2460 mapValue!2459))))

(declare-fun b!52898 () Bool)

(declare-fun e!34482 () Bool)

(declare-fun tp_is_empty!2263 () Bool)

(assert (=> b!52898 (= e!34482 tp_is_empty!2263)))

(declare-fun b!52899 () Bool)

(declare-fun res!30027 () Bool)

(assert (=> b!52899 (=> (not res!30027) (not e!34493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3435 (_ BitVec 32)) Bool)

(assert (=> b!52899 (= res!30027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3576 (v!2242 (underlying!163 thiss!992))) (mask!5787 (v!2242 (underlying!163 thiss!992)))))))

(declare-fun b!52900 () Bool)

(declare-fun e!34485 () Bool)

(assert (=> b!52900 (= e!34485 tp_is_empty!2263)))

(declare-fun e!34495 () Bool)

(declare-fun e!34481 () Bool)

(declare-fun array_inv!995 (array!3435) Bool)

(declare-fun array_inv!996 (array!3437) Bool)

(assert (=> b!52901 (= e!34481 (and tp!7181 tp_is_empty!2263 (array_inv!995 (_keys!3576 newMap!16)) (array_inv!996 (_values!1939 newMap!16)) e!34495))))

(declare-fun b!52902 () Bool)

(declare-fun res!30031 () Bool)

(assert (=> b!52902 (=> (not res!30031) (not e!34489))))

(declare-fun valid!187 (LongMapFixedSize!484) Bool)

(assert (=> b!52902 (= res!30031 (valid!187 newMap!16))))

(declare-fun b!52903 () Bool)

(assert (=> b!52903 (= e!34489 e!34491)))

(declare-fun res!30034 () Bool)

(assert (=> b!52903 (=> (not res!30034) (not e!34491))))

(assert (=> b!52903 (= res!30034 (and (= lt!21335 lt!21334) (not (= (select (arr!1640 (_keys!3576 (v!2242 (underlying!163 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1640 (_keys!3576 (v!2242 (underlying!163 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1024 (LongMapFixedSize!484) ListLongMap!1251)

(assert (=> b!52903 (= lt!21334 (map!1024 newMap!16))))

(declare-fun getCurrentListMap!348 (array!3435 array!3437 (_ BitVec 32) (_ BitVec 32) V!2665 V!2665 (_ BitVec 32) Int) ListLongMap!1251)

(assert (=> b!52903 (= lt!21335 (getCurrentListMap!348 (_keys!3576 (v!2242 (underlying!163 thiss!992))) (_values!1939 (v!2242 (underlying!163 thiss!992))) (mask!5787 (v!2242 (underlying!163 thiss!992))) (extraKeys!1847 (v!2242 (underlying!163 thiss!992))) (zeroValue!1874 (v!2242 (underlying!163 thiss!992))) (minValue!1874 (v!2242 (underlying!163 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1956 (v!2242 (underlying!163 thiss!992)))))))

(declare-fun e!34483 () Bool)

(declare-fun e!34484 () Bool)

(assert (=> b!52904 (= e!34484 (and tp!7179 tp_is_empty!2263 (array_inv!995 (_keys!3576 (v!2242 (underlying!163 thiss!992)))) (array_inv!996 (_values!1939 (v!2242 (underlying!163 thiss!992)))) e!34483))))

(declare-fun b!52905 () Bool)

(assert (=> b!52905 (= e!34490 tp_is_empty!2263)))

(declare-fun b!52906 () Bool)

(declare-fun res!30032 () Bool)

(assert (=> b!52906 (=> (not res!30032) (not e!34493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!52906 (= res!30032 (validMask!0 (mask!5787 (v!2242 (underlying!163 thiss!992)))))))

(declare-fun b!52907 () Bool)

(declare-fun res!30033 () Bool)

(assert (=> b!52907 (=> (not res!30033) (not e!34489))))

(assert (=> b!52907 (= res!30033 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1869 (_keys!3576 (v!2242 (underlying!163 thiss!992)))))))))

(declare-fun b!52908 () Bool)

(declare-fun mapRes!2460 () Bool)

(assert (=> b!52908 (= e!34483 (and e!34482 mapRes!2460))))

(declare-fun condMapEmpty!2460 () Bool)

(declare-fun mapDefault!2460 () ValueCell!788)

(assert (=> b!52908 (= condMapEmpty!2460 (= (arr!1641 (_values!1939 (v!2242 (underlying!163 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!788)) mapDefault!2460)))))

(declare-fun b!52909 () Bool)

(declare-fun res!30029 () Bool)

(assert (=> b!52909 (=> (not res!30029) (not e!34493))))

(assert (=> b!52909 (= res!30029 (and (= (size!1870 (_values!1939 (v!2242 (underlying!163 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5787 (v!2242 (underlying!163 thiss!992))))) (= (size!1869 (_keys!3576 (v!2242 (underlying!163 thiss!992)))) (size!1870 (_values!1939 (v!2242 (underlying!163 thiss!992))))) (bvsge (mask!5787 (v!2242 (underlying!163 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1847 (v!2242 (underlying!163 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1847 (v!2242 (underlying!163 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!52910 () Bool)

(declare-fun e!34494 () Bool)

(declare-fun e!34488 () Bool)

(assert (=> b!52910 (= e!34494 e!34488)))

(declare-fun b!52911 () Bool)

(declare-fun e!34492 () Bool)

(assert (=> b!52911 (= e!34495 (and e!34492 mapRes!2459))))

(declare-fun condMapEmpty!2459 () Bool)

(declare-fun mapDefault!2459 () ValueCell!788)

(assert (=> b!52911 (= condMapEmpty!2459 (= (arr!1641 (_values!1939 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!788)) mapDefault!2459)))))

(declare-fun res!30030 () Bool)

(assert (=> start!8268 (=> (not res!30030) (not e!34489))))

(declare-fun valid!188 (LongMap!304) Bool)

(assert (=> start!8268 (= res!30030 (valid!188 thiss!992))))

(assert (=> start!8268 e!34489))

(assert (=> start!8268 e!34494))

(assert (=> start!8268 true))

(assert (=> start!8268 e!34481))

(declare-fun mapIsEmpty!2460 () Bool)

(assert (=> mapIsEmpty!2460 mapRes!2460))

(declare-fun b!52912 () Bool)

(assert (=> b!52912 (= e!34492 tp_is_empty!2263)))

(declare-fun mapNonEmpty!2460 () Bool)

(declare-fun tp!7182 () Bool)

(assert (=> mapNonEmpty!2460 (= mapRes!2460 (and tp!7182 e!34485))))

(declare-fun mapRest!2459 () (Array (_ BitVec 32) ValueCell!788))

(declare-fun mapKey!2459 () (_ BitVec 32))

(declare-fun mapValue!2460 () ValueCell!788)

(assert (=> mapNonEmpty!2460 (= (arr!1641 (_values!1939 (v!2242 (underlying!163 thiss!992)))) (store mapRest!2459 mapKey!2459 mapValue!2460))))

(declare-fun b!52913 () Bool)

(assert (=> b!52913 (= e!34488 e!34484)))

(assert (= (and start!8268 res!30030) b!52907))

(assert (= (and b!52907 res!30033) b!52902))

(assert (= (and b!52902 res!30031) b!52893))

(assert (= (and b!52893 res!30025) b!52903))

(assert (= (and b!52903 res!30034) b!52894))

(assert (= (and b!52894 res!30024) b!52906))

(assert (= (and b!52906 res!30032) b!52909))

(assert (= (and b!52909 res!30029) b!52899))

(assert (= (and b!52899 res!30027) b!52897))

(assert (= (and b!52897 res!30028) b!52895))

(assert (= (and b!52895 res!30026) b!52896))

(assert (= (and b!52908 condMapEmpty!2460) mapIsEmpty!2460))

(assert (= (and b!52908 (not condMapEmpty!2460)) mapNonEmpty!2460))

(get-info :version)

(assert (= (and mapNonEmpty!2460 ((_ is ValueCellFull!788) mapValue!2460)) b!52900))

(assert (= (and b!52908 ((_ is ValueCellFull!788) mapDefault!2460)) b!52898))

(assert (= b!52904 b!52908))

(assert (= b!52913 b!52904))

(assert (= b!52910 b!52913))

(assert (= start!8268 b!52910))

(assert (= (and b!52911 condMapEmpty!2459) mapIsEmpty!2459))

(assert (= (and b!52911 (not condMapEmpty!2459)) mapNonEmpty!2459))

(assert (= (and mapNonEmpty!2459 ((_ is ValueCellFull!788) mapValue!2459)) b!52905))

(assert (= (and b!52911 ((_ is ValueCellFull!788) mapDefault!2459)) b!52912))

(assert (= b!52901 b!52911))

(assert (= start!8268 b!52901))

(declare-fun b_lambda!2357 () Bool)

(assert (=> (not b_lambda!2357) (not b!52894)))

(declare-fun t!4392 () Bool)

(declare-fun tb!1037 () Bool)

(assert (=> (and b!52904 (= (defaultEntry!1956 (v!2242 (underlying!163 thiss!992))) (defaultEntry!1956 (v!2242 (underlying!163 thiss!992)))) t!4392) tb!1037))

(declare-fun result!1953 () Bool)

(assert (=> tb!1037 (= result!1953 tp_is_empty!2263)))

(assert (=> b!52894 t!4392))

(declare-fun b_and!2929 () Bool)

(assert (= b_and!2925 (and (=> t!4392 result!1953) b_and!2929)))

(declare-fun t!4394 () Bool)

(declare-fun tb!1039 () Bool)

(assert (=> (and b!52901 (= (defaultEntry!1956 newMap!16) (defaultEntry!1956 (v!2242 (underlying!163 thiss!992)))) t!4394) tb!1039))

(declare-fun result!1957 () Bool)

(assert (= result!1957 result!1953))

(assert (=> b!52894 t!4394))

(declare-fun b_and!2931 () Bool)

(assert (= b_and!2927 (and (=> t!4394 result!1957) b_and!2931)))

(declare-fun m!45001 () Bool)

(assert (=> mapNonEmpty!2459 m!45001))

(declare-fun m!45003 () Bool)

(assert (=> b!52901 m!45003))

(declare-fun m!45005 () Bool)

(assert (=> b!52901 m!45005))

(declare-fun m!45007 () Bool)

(assert (=> b!52899 m!45007))

(declare-fun m!45009 () Bool)

(assert (=> b!52896 m!45009))

(assert (=> b!52896 m!45009))

(declare-fun m!45011 () Bool)

(assert (=> b!52896 m!45011))

(declare-fun m!45013 () Bool)

(assert (=> b!52906 m!45013))

(declare-fun m!45015 () Bool)

(assert (=> b!52904 m!45015))

(declare-fun m!45017 () Bool)

(assert (=> b!52904 m!45017))

(assert (=> b!52903 m!45009))

(declare-fun m!45019 () Bool)

(assert (=> b!52903 m!45019))

(declare-fun m!45021 () Bool)

(assert (=> b!52903 m!45021))

(declare-fun m!45023 () Bool)

(assert (=> start!8268 m!45023))

(declare-fun m!45025 () Bool)

(assert (=> mapNonEmpty!2460 m!45025))

(declare-fun m!45027 () Bool)

(assert (=> b!52902 m!45027))

(declare-fun m!45029 () Bool)

(assert (=> b!52894 m!45029))

(declare-fun m!45031 () Bool)

(assert (=> b!52894 m!45031))

(declare-fun m!45033 () Bool)

(assert (=> b!52894 m!45033))

(assert (=> b!52894 m!45009))

(declare-fun m!45035 () Bool)

(assert (=> b!52894 m!45035))

(assert (=> b!52894 m!45009))

(assert (=> b!52894 m!45031))

(assert (=> b!52894 m!45009))

(assert (=> b!52894 m!45033))

(declare-fun m!45037 () Bool)

(assert (=> b!52894 m!45037))

(assert (=> b!52894 m!45029))

(declare-fun m!45039 () Bool)

(assert (=> b!52897 m!45039))

(check-sat (not b!52901) b_and!2929 (not b!52897) (not b_lambda!2357) (not mapNonEmpty!2459) b_and!2931 (not b!52903) (not b!52894) (not mapNonEmpty!2460) (not b_next!1693) (not b!52904) (not b!52896) (not b!52902) tp_is_empty!2263 (not b_next!1695) (not b!52899) (not b!52906) (not start!8268))
(check-sat b_and!2929 b_and!2931 (not b_next!1693) (not b_next!1695))
