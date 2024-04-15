; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8310 () Bool)

(assert start!8310)

(declare-fun b!54254 () Bool)

(declare-fun b_free!1777 () Bool)

(declare-fun b_next!1777 () Bool)

(assert (=> b!54254 (= b_free!1777 (not b_next!1777))))

(declare-fun tp!7433 () Bool)

(declare-fun b_and!3097 () Bool)

(assert (=> b!54254 (= tp!7433 b_and!3097)))

(declare-fun b!54257 () Bool)

(declare-fun b_free!1779 () Bool)

(declare-fun b_next!1779 () Bool)

(assert (=> b!54257 (= b_free!1779 (not b_next!1779))))

(declare-fun tp!7434 () Bool)

(declare-fun b_and!3099 () Bool)

(assert (=> b!54257 (= tp!7434 b_and!3099)))

(declare-fun b!54249 () Bool)

(declare-fun e!35421 () Bool)

(declare-fun e!35424 () Bool)

(assert (=> b!54249 (= e!35421 e!35424)))

(declare-fun res!30729 () Bool)

(assert (=> b!54249 (=> (not res!30729) (not e!35424))))

(declare-datatypes ((V!2721 0))(
  ( (V!2722 (val!1197 Int)) )
))
(declare-datatypes ((array!3513 0))(
  ( (array!3514 (arr!1678 (Array (_ BitVec 32) (_ BitVec 64))) (size!1908 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!809 0))(
  ( (ValueCellFull!809 (v!2278 V!2721)) (EmptyCell!809) )
))
(declare-datatypes ((array!3515 0))(
  ( (array!3516 (arr!1679 (Array (_ BitVec 32) ValueCell!809)) (size!1909 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!526 0))(
  ( (LongMapFixedSize!527 (defaultEntry!1977 Int) (mask!5821 (_ BitVec 32)) (extraKeys!1868 (_ BitVec 32)) (zeroValue!1895 V!2721) (minValue!1895 V!2721) (_size!312 (_ BitVec 32)) (_keys!3596 array!3513) (_values!1960 array!3515) (_vacant!312 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!342 0))(
  ( (Cell!343 (v!2279 LongMapFixedSize!526)) )
))
(declare-datatypes ((LongMap!342 0))(
  ( (LongMap!343 (underlying!182 Cell!342)) )
))
(declare-fun thiss!992 () LongMap!342)

(declare-datatypes ((tuple2!1930 0))(
  ( (tuple2!1931 (_1!976 (_ BitVec 64)) (_2!976 V!2721)) )
))
(declare-datatypes ((List!1377 0))(
  ( (Nil!1374) (Cons!1373 (h!1953 tuple2!1930) (t!4522 List!1377)) )
))
(declare-datatypes ((ListLongMap!1301 0))(
  ( (ListLongMap!1302 (toList!666 List!1377)) )
))
(declare-fun lt!21611 () ListLongMap!1301)

(declare-fun lt!21612 () ListLongMap!1301)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!54249 (= res!30729 (and (= lt!21612 lt!21611) (not (= (select (arr!1678 (_keys!3596 (v!2279 (underlying!182 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1678 (_keys!3596 (v!2279 (underlying!182 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!526)

(declare-fun map!1053 (LongMapFixedSize!526) ListLongMap!1301)

(assert (=> b!54249 (= lt!21611 (map!1053 newMap!16))))

(declare-fun getCurrentListMap!369 (array!3513 array!3515 (_ BitVec 32) (_ BitVec 32) V!2721 V!2721 (_ BitVec 32) Int) ListLongMap!1301)

(assert (=> b!54249 (= lt!21612 (getCurrentListMap!369 (_keys!3596 (v!2279 (underlying!182 thiss!992))) (_values!1960 (v!2279 (underlying!182 thiss!992))) (mask!5821 (v!2279 (underlying!182 thiss!992))) (extraKeys!1868 (v!2279 (underlying!182 thiss!992))) (zeroValue!1895 (v!2279 (underlying!182 thiss!992))) (minValue!1895 (v!2279 (underlying!182 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1977 (v!2279 (underlying!182 thiss!992)))))))

(declare-fun b!54250 () Bool)

(declare-fun res!30731 () Bool)

(declare-fun e!35431 () Bool)

(assert (=> b!54250 (=> (not res!30731) (not e!35431))))

(assert (=> b!54250 (= res!30731 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1908 (_keys!3596 (v!2279 (underlying!182 thiss!992)))))))))

(declare-fun b!54251 () Bool)

(declare-fun res!30727 () Bool)

(assert (=> b!54251 (=> (not res!30727) (not e!35431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!54251 (= res!30727 (validMask!0 (mask!5821 (v!2279 (underlying!182 thiss!992)))))))

(declare-fun b!54252 () Bool)

(declare-fun e!35432 () Bool)

(declare-fun e!35434 () Bool)

(declare-fun mapRes!2585 () Bool)

(assert (=> b!54252 (= e!35432 (and e!35434 mapRes!2585))))

(declare-fun condMapEmpty!2585 () Bool)

(declare-fun mapDefault!2585 () ValueCell!809)

(assert (=> b!54252 (= condMapEmpty!2585 (= (arr!1679 (_values!1960 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!809)) mapDefault!2585)))))

(declare-fun b!54253 () Bool)

(assert (=> b!54253 (= e!35424 e!35431)))

(declare-fun res!30722 () Bool)

(assert (=> b!54253 (=> (not res!30722) (not e!35431))))

(declare-fun contains!640 (ListLongMap!1301 (_ BitVec 64)) Bool)

(assert (=> b!54253 (= res!30722 (contains!640 lt!21611 (select (arr!1678 (_keys!3596 (v!2279 (underlying!182 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1932 0))(
  ( (tuple2!1933 (_1!977 Bool) (_2!977 LongMapFixedSize!526)) )
))
(declare-fun lt!21614 () tuple2!1932)

(declare-fun update!59 (LongMapFixedSize!526 (_ BitVec 64) V!2721) tuple2!1932)

(declare-fun get!1013 (ValueCell!809 V!2721) V!2721)

(declare-fun dynLambda!283 (Int (_ BitVec 64)) V!2721)

(assert (=> b!54253 (= lt!21614 (update!59 newMap!16 (select (arr!1678 (_keys!3596 (v!2279 (underlying!182 thiss!992)))) from!355) (get!1013 (select (arr!1679 (_values!1960 (v!2279 (underlying!182 thiss!992)))) from!355) (dynLambda!283 (defaultEntry!1977 (v!2279 (underlying!182 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!35429 () Bool)

(declare-fun tp_is_empty!2305 () Bool)

(declare-fun e!35426 () Bool)

(declare-fun array_inv!1033 (array!3513) Bool)

(declare-fun array_inv!1034 (array!3515) Bool)

(assert (=> b!54254 (= e!35426 (and tp!7433 tp_is_empty!2305 (array_inv!1033 (_keys!3596 (v!2279 (underlying!182 thiss!992)))) (array_inv!1034 (_values!1960 (v!2279 (underlying!182 thiss!992)))) e!35429))))

(declare-fun b!54255 () Bool)

(declare-fun res!30732 () Bool)

(assert (=> b!54255 (=> (not res!30732) (not e!35421))))

(assert (=> b!54255 (= res!30732 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5821 newMap!16)) (_size!312 (v!2279 (underlying!182 thiss!992)))))))

(declare-fun res!30725 () Bool)

(assert (=> start!8310 (=> (not res!30725) (not e!35421))))

(declare-fun valid!205 (LongMap!342) Bool)

(assert (=> start!8310 (= res!30725 (valid!205 thiss!992))))

(assert (=> start!8310 e!35421))

(declare-fun e!35425 () Bool)

(assert (=> start!8310 e!35425))

(assert (=> start!8310 true))

(declare-fun e!35427 () Bool)

(assert (=> start!8310 e!35427))

(declare-fun b!54256 () Bool)

(declare-fun res!30723 () Bool)

(assert (=> b!54256 (=> (not res!30723) (not e!35431))))

(declare-datatypes ((List!1378 0))(
  ( (Nil!1375) (Cons!1374 (h!1954 (_ BitVec 64)) (t!4523 List!1378)) )
))
(declare-fun arrayNoDuplicates!0 (array!3513 (_ BitVec 32) List!1378) Bool)

(assert (=> b!54256 (= res!30723 (arrayNoDuplicates!0 (_keys!3596 (v!2279 (underlying!182 thiss!992))) #b00000000000000000000000000000000 Nil!1375))))

(assert (=> b!54257 (= e!35427 (and tp!7434 tp_is_empty!2305 (array_inv!1033 (_keys!3596 newMap!16)) (array_inv!1034 (_values!1960 newMap!16)) e!35432))))

(declare-fun b!54258 () Bool)

(declare-fun res!30726 () Bool)

(assert (=> b!54258 (=> (not res!30726) (not e!35431))))

(assert (=> b!54258 (= res!30726 (and (= (size!1909 (_values!1960 (v!2279 (underlying!182 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5821 (v!2279 (underlying!182 thiss!992))))) (= (size!1908 (_keys!3596 (v!2279 (underlying!182 thiss!992)))) (size!1909 (_values!1960 (v!2279 (underlying!182 thiss!992))))) (bvsge (mask!5821 (v!2279 (underlying!182 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1868 (v!2279 (underlying!182 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1868 (v!2279 (underlying!182 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!2585 () Bool)

(declare-fun tp!7431 () Bool)

(declare-fun e!35423 () Bool)

(assert (=> mapNonEmpty!2585 (= mapRes!2585 (and tp!7431 e!35423))))

(declare-fun mapRest!2586 () (Array (_ BitVec 32) ValueCell!809))

(declare-fun mapKey!2586 () (_ BitVec 32))

(declare-fun mapValue!2585 () ValueCell!809)

(assert (=> mapNonEmpty!2585 (= (arr!1679 (_values!1960 newMap!16)) (store mapRest!2586 mapKey!2586 mapValue!2585))))

(declare-fun b!54259 () Bool)

(declare-fun e!35420 () Bool)

(assert (=> b!54259 (= e!35420 tp_is_empty!2305)))

(declare-fun b!54260 () Bool)

(declare-fun e!35422 () Bool)

(assert (=> b!54260 (= e!35422 e!35426)))

(declare-fun b!54261 () Bool)

(assert (=> b!54261 (= e!35423 tp_is_empty!2305)))

(declare-fun b!54262 () Bool)

(declare-fun res!30730 () Bool)

(assert (=> b!54262 (=> (not res!30730) (not e!35421))))

(assert (=> b!54262 (= res!30730 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1908 (_keys!3596 (v!2279 (underlying!182 thiss!992)))))))))

(declare-fun b!54263 () Bool)

(assert (=> b!54263 (= e!35434 tp_is_empty!2305)))

(declare-fun b!54264 () Bool)

(declare-fun res!30728 () Bool)

(assert (=> b!54264 (=> (not res!30728) (not e!35431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3513 (_ BitVec 32)) Bool)

(assert (=> b!54264 (= res!30728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3596 (v!2279 (underlying!182 thiss!992))) (mask!5821 (v!2279 (underlying!182 thiss!992)))))))

(declare-fun b!54265 () Bool)

(assert (=> b!54265 (= e!35431 false)))

(declare-fun lt!21613 () Bool)

(assert (=> b!54265 (= lt!21613 (contains!640 lt!21612 (select (arr!1678 (_keys!3596 (v!2279 (underlying!182 thiss!992)))) from!355)))))

(declare-fun b!54266 () Bool)

(declare-fun res!30724 () Bool)

(assert (=> b!54266 (=> (not res!30724) (not e!35421))))

(declare-fun valid!206 (LongMapFixedSize!526) Bool)

(assert (=> b!54266 (= res!30724 (valid!206 newMap!16))))

(declare-fun mapIsEmpty!2585 () Bool)

(declare-fun mapRes!2586 () Bool)

(assert (=> mapIsEmpty!2585 mapRes!2586))

(declare-fun mapNonEmpty!2586 () Bool)

(declare-fun tp!7432 () Bool)

(declare-fun e!35433 () Bool)

(assert (=> mapNonEmpty!2586 (= mapRes!2586 (and tp!7432 e!35433))))

(declare-fun mapKey!2585 () (_ BitVec 32))

(declare-fun mapValue!2586 () ValueCell!809)

(declare-fun mapRest!2585 () (Array (_ BitVec 32) ValueCell!809))

(assert (=> mapNonEmpty!2586 (= (arr!1679 (_values!1960 (v!2279 (underlying!182 thiss!992)))) (store mapRest!2585 mapKey!2585 mapValue!2586))))

(declare-fun b!54267 () Bool)

(assert (=> b!54267 (= e!35429 (and e!35420 mapRes!2586))))

(declare-fun condMapEmpty!2586 () Bool)

(declare-fun mapDefault!2586 () ValueCell!809)

(assert (=> b!54267 (= condMapEmpty!2586 (= (arr!1679 (_values!1960 (v!2279 (underlying!182 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!809)) mapDefault!2586)))))

(declare-fun b!54268 () Bool)

(assert (=> b!54268 (= e!35425 e!35422)))

(declare-fun mapIsEmpty!2586 () Bool)

(assert (=> mapIsEmpty!2586 mapRes!2585))

(declare-fun b!54269 () Bool)

(assert (=> b!54269 (= e!35433 tp_is_empty!2305)))

(assert (= (and start!8310 res!30725) b!54262))

(assert (= (and b!54262 res!30730) b!54266))

(assert (= (and b!54266 res!30724) b!54255))

(assert (= (and b!54255 res!30732) b!54249))

(assert (= (and b!54249 res!30729) b!54253))

(assert (= (and b!54253 res!30722) b!54251))

(assert (= (and b!54251 res!30727) b!54258))

(assert (= (and b!54258 res!30726) b!54264))

(assert (= (and b!54264 res!30728) b!54256))

(assert (= (and b!54256 res!30723) b!54250))

(assert (= (and b!54250 res!30731) b!54265))

(assert (= (and b!54267 condMapEmpty!2586) mapIsEmpty!2585))

(assert (= (and b!54267 (not condMapEmpty!2586)) mapNonEmpty!2586))

(get-info :version)

(assert (= (and mapNonEmpty!2586 ((_ is ValueCellFull!809) mapValue!2586)) b!54269))

(assert (= (and b!54267 ((_ is ValueCellFull!809) mapDefault!2586)) b!54259))

(assert (= b!54254 b!54267))

(assert (= b!54260 b!54254))

(assert (= b!54268 b!54260))

(assert (= start!8310 b!54268))

(assert (= (and b!54252 condMapEmpty!2585) mapIsEmpty!2586))

(assert (= (and b!54252 (not condMapEmpty!2585)) mapNonEmpty!2585))

(assert (= (and mapNonEmpty!2585 ((_ is ValueCellFull!809) mapValue!2585)) b!54261))

(assert (= (and b!54252 ((_ is ValueCellFull!809) mapDefault!2585)) b!54263))

(assert (= b!54257 b!54252))

(assert (= start!8310 b!54257))

(declare-fun b_lambda!2403 () Bool)

(assert (=> (not b_lambda!2403) (not b!54253)))

(declare-fun t!4519 () Bool)

(declare-fun tb!1121 () Bool)

(assert (=> (and b!54254 (= (defaultEntry!1977 (v!2279 (underlying!182 thiss!992))) (defaultEntry!1977 (v!2279 (underlying!182 thiss!992)))) t!4519) tb!1121))

(declare-fun result!2079 () Bool)

(assert (=> tb!1121 (= result!2079 tp_is_empty!2305)))

(assert (=> b!54253 t!4519))

(declare-fun b_and!3101 () Bool)

(assert (= b_and!3097 (and (=> t!4519 result!2079) b_and!3101)))

(declare-fun t!4521 () Bool)

(declare-fun tb!1123 () Bool)

(assert (=> (and b!54257 (= (defaultEntry!1977 newMap!16) (defaultEntry!1977 (v!2279 (underlying!182 thiss!992)))) t!4521) tb!1123))

(declare-fun result!2083 () Bool)

(assert (= result!2083 result!2079))

(assert (=> b!54253 t!4521))

(declare-fun b_and!3103 () Bool)

(assert (= b_and!3099 (and (=> t!4521 result!2083) b_and!3103)))

(declare-fun m!45883 () Bool)

(assert (=> mapNonEmpty!2585 m!45883))

(declare-fun m!45885 () Bool)

(assert (=> b!54254 m!45885))

(declare-fun m!45887 () Bool)

(assert (=> b!54254 m!45887))

(declare-fun m!45889 () Bool)

(assert (=> b!54257 m!45889))

(declare-fun m!45891 () Bool)

(assert (=> b!54257 m!45891))

(declare-fun m!45893 () Bool)

(assert (=> b!54266 m!45893))

(declare-fun m!45895 () Bool)

(assert (=> b!54256 m!45895))

(declare-fun m!45897 () Bool)

(assert (=> b!54249 m!45897))

(declare-fun m!45899 () Bool)

(assert (=> b!54249 m!45899))

(declare-fun m!45901 () Bool)

(assert (=> b!54249 m!45901))

(declare-fun m!45903 () Bool)

(assert (=> b!54251 m!45903))

(declare-fun m!45905 () Bool)

(assert (=> mapNonEmpty!2586 m!45905))

(declare-fun m!45907 () Bool)

(assert (=> b!54253 m!45907))

(declare-fun m!45909 () Bool)

(assert (=> b!54253 m!45909))

(declare-fun m!45911 () Bool)

(assert (=> b!54253 m!45911))

(assert (=> b!54253 m!45897))

(assert (=> b!54253 m!45909))

(assert (=> b!54253 m!45897))

(declare-fun m!45913 () Bool)

(assert (=> b!54253 m!45913))

(assert (=> b!54253 m!45897))

(assert (=> b!54253 m!45911))

(declare-fun m!45915 () Bool)

(assert (=> b!54253 m!45915))

(assert (=> b!54253 m!45907))

(declare-fun m!45917 () Bool)

(assert (=> start!8310 m!45917))

(declare-fun m!45919 () Bool)

(assert (=> b!54264 m!45919))

(assert (=> b!54265 m!45897))

(assert (=> b!54265 m!45897))

(declare-fun m!45921 () Bool)

(assert (=> b!54265 m!45921))

(check-sat (not mapNonEmpty!2586) (not b_lambda!2403) b_and!3101 (not b!54264) tp_is_empty!2305 (not b_next!1779) (not start!8310) (not b!54249) (not b!54257) (not b!54251) (not b!54266) (not b!54254) (not b!54253) (not b!54256) (not b_next!1777) b_and!3103 (not b!54265) (not mapNonEmpty!2585))
(check-sat b_and!3101 b_and!3103 (not b_next!1777) (not b_next!1779))
