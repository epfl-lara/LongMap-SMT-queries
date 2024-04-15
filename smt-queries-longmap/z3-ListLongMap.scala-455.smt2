; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8346 () Bool)

(assert start!8346)

(declare-fun b!55253 () Bool)

(declare-fun b_free!1849 () Bool)

(declare-fun b_next!1849 () Bool)

(assert (=> b!55253 (= b_free!1849 (not b_next!1849))))

(declare-fun tp!7647 () Bool)

(declare-fun b_and!3241 () Bool)

(assert (=> b!55253 (= tp!7647 b_and!3241)))

(declare-fun b!55255 () Bool)

(declare-fun b_free!1851 () Bool)

(declare-fun b_next!1851 () Bool)

(assert (=> b!55255 (= b_free!1851 (not b_next!1851))))

(declare-fun tp!7648 () Bool)

(declare-fun b_and!3243 () Bool)

(assert (=> b!55255 (= tp!7648 b_and!3243)))

(declare-fun b!55239 () Bool)

(declare-fun e!36289 () Bool)

(declare-fun e!36288 () Bool)

(declare-fun mapRes!2694 () Bool)

(assert (=> b!55239 (= e!36289 (and e!36288 mapRes!2694))))

(declare-fun condMapEmpty!2693 () Bool)

(declare-datatypes ((V!2769 0))(
  ( (V!2770 (val!1215 Int)) )
))
(declare-datatypes ((array!3585 0))(
  ( (array!3586 (arr!1714 (Array (_ BitVec 32) (_ BitVec 64))) (size!1944 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!827 0))(
  ( (ValueCellFull!827 (v!2312 V!2769)) (EmptyCell!827) )
))
(declare-datatypes ((array!3587 0))(
  ( (array!3588 (arr!1715 (Array (_ BitVec 32) ValueCell!827)) (size!1945 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!562 0))(
  ( (LongMapFixedSize!563 (defaultEntry!1995 Int) (mask!5851 (_ BitVec 32)) (extraKeys!1886 (_ BitVec 32)) (zeroValue!1913 V!2769) (minValue!1913 V!2769) (_size!330 (_ BitVec 32)) (_keys!3614 array!3585) (_values!1978 array!3587) (_vacant!330 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!562)

(declare-fun mapDefault!2693 () ValueCell!827)

(assert (=> b!55239 (= condMapEmpty!2693 (= (arr!1715 (_values!1978 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!827)) mapDefault!2693)))))

(declare-fun mapNonEmpty!2693 () Bool)

(declare-fun mapRes!2693 () Bool)

(declare-fun tp!7650 () Bool)

(declare-fun e!36285 () Bool)

(assert (=> mapNonEmpty!2693 (= mapRes!2693 (and tp!7650 e!36285))))

(declare-fun mapRest!2694 () (Array (_ BitVec 32) ValueCell!827))

(declare-datatypes ((Cell!374 0))(
  ( (Cell!375 (v!2313 LongMapFixedSize!562)) )
))
(declare-datatypes ((LongMap!374 0))(
  ( (LongMap!375 (underlying!198 Cell!374)) )
))
(declare-fun thiss!992 () LongMap!374)

(declare-fun mapValue!2694 () ValueCell!827)

(declare-fun mapKey!2693 () (_ BitVec 32))

(assert (=> mapNonEmpty!2693 (= (arr!1715 (_values!1978 (v!2313 (underlying!198 thiss!992)))) (store mapRest!2694 mapKey!2693 mapValue!2694))))

(declare-fun b!55240 () Bool)

(declare-fun e!36279 () Bool)

(declare-fun e!36290 () Bool)

(assert (=> b!55240 (= e!36279 (not e!36290))))

(declare-fun res!31139 () Bool)

(assert (=> b!55240 (=> res!31139 e!36290)))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!55240 (= res!31139 (or (bvsge (size!1944 (_keys!3614 (v!2313 (underlying!198 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1944 (_keys!3614 (v!2313 (underlying!198 thiss!992)))))))))

(declare-datatypes ((List!1399 0))(
  ( (Nil!1396) (Cons!1395 (h!1975 (_ BitVec 64)) (t!4616 List!1399)) )
))
(declare-fun lt!21884 () List!1399)

(assert (=> b!55240 (= lt!21884 (Cons!1395 (select (arr!1714 (_keys!3614 (v!2313 (underlying!198 thiss!992)))) from!355) Nil!1396))))

(declare-fun arrayNoDuplicates!0 (array!3585 (_ BitVec 32) List!1399) Bool)

(assert (=> b!55240 (arrayNoDuplicates!0 (_keys!3614 (v!2313 (underlying!198 thiss!992))) from!355 Nil!1396)))

(declare-datatypes ((Unit!1448 0))(
  ( (Unit!1449) )
))
(declare-fun lt!21880 () Unit!1448)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3585 (_ BitVec 32) (_ BitVec 32)) Unit!1448)

(assert (=> b!55240 (= lt!21880 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3614 (v!2313 (underlying!198 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55240 (arrayContainsKey!0 (_keys!3614 (v!2313 (underlying!198 thiss!992))) (select (arr!1714 (_keys!3614 (v!2313 (underlying!198 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!21883 () Unit!1448)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!11 (array!3585 array!3587 (_ BitVec 32) (_ BitVec 32) V!2769 V!2769 (_ BitVec 64) (_ BitVec 32) Int) Unit!1448)

(assert (=> b!55240 (= lt!21883 (lemmaListMapContainsThenArrayContainsFrom!11 (_keys!3614 (v!2313 (underlying!198 thiss!992))) (_values!1978 (v!2313 (underlying!198 thiss!992))) (mask!5851 (v!2313 (underlying!198 thiss!992))) (extraKeys!1886 (v!2313 (underlying!198 thiss!992))) (zeroValue!1913 (v!2313 (underlying!198 thiss!992))) (minValue!1913 (v!2313 (underlying!198 thiss!992))) (select (arr!1714 (_keys!3614 (v!2313 (underlying!198 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1995 (v!2313 (underlying!198 thiss!992)))))))

(declare-fun b!55241 () Bool)

(declare-fun e!36291 () Bool)

(declare-fun e!36281 () Bool)

(assert (=> b!55241 (= e!36291 (and e!36281 mapRes!2693))))

(declare-fun condMapEmpty!2694 () Bool)

(declare-fun mapDefault!2694 () ValueCell!827)

(assert (=> b!55241 (= condMapEmpty!2694 (= (arr!1715 (_values!1978 (v!2313 (underlying!198 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!827)) mapDefault!2694)))))

(declare-fun b!55242 () Bool)

(declare-fun res!31142 () Bool)

(declare-fun e!36283 () Bool)

(assert (=> b!55242 (=> (not res!31142) (not e!36283))))

(assert (=> b!55242 (= res!31142 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5851 newMap!16)) (_size!330 (v!2313 (underlying!198 thiss!992)))))))

(declare-fun b!55243 () Bool)

(declare-fun tp_is_empty!2341 () Bool)

(assert (=> b!55243 (= e!36288 tp_is_empty!2341)))

(declare-fun b!55244 () Bool)

(declare-fun e!36287 () Bool)

(assert (=> b!55244 (= e!36287 e!36279)))

(declare-fun res!31136 () Bool)

(assert (=> b!55244 (=> (not res!31136) (not e!36279))))

(declare-datatypes ((tuple2!1978 0))(
  ( (tuple2!1979 (_1!1000 (_ BitVec 64)) (_2!1000 V!2769)) )
))
(declare-datatypes ((List!1400 0))(
  ( (Nil!1397) (Cons!1396 (h!1976 tuple2!1978) (t!4617 List!1400)) )
))
(declare-datatypes ((ListLongMap!1325 0))(
  ( (ListLongMap!1326 (toList!678 List!1400)) )
))
(declare-fun lt!21879 () ListLongMap!1325)

(declare-fun contains!652 (ListLongMap!1325 (_ BitVec 64)) Bool)

(assert (=> b!55244 (= res!31136 (contains!652 lt!21879 (select (arr!1714 (_keys!3614 (v!2313 (underlying!198 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1980 0))(
  ( (tuple2!1981 (_1!1001 Bool) (_2!1001 LongMapFixedSize!562)) )
))
(declare-fun lt!21882 () tuple2!1980)

(declare-fun update!71 (LongMapFixedSize!562 (_ BitVec 64) V!2769) tuple2!1980)

(declare-fun get!1037 (ValueCell!827 V!2769) V!2769)

(declare-fun dynLambda!295 (Int (_ BitVec 64)) V!2769)

(assert (=> b!55244 (= lt!21882 (update!71 newMap!16 (select (arr!1714 (_keys!3614 (v!2313 (underlying!198 thiss!992)))) from!355) (get!1037 (select (arr!1715 (_values!1978 (v!2313 (underlying!198 thiss!992)))) from!355) (dynLambda!295 (defaultEntry!1995 (v!2313 (underlying!198 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55246 () Bool)

(assert (=> b!55246 (= e!36290 true)))

(declare-fun lt!21878 () Bool)

(declare-fun contains!653 (List!1399 (_ BitVec 64)) Bool)

(assert (=> b!55246 (= lt!21878 (contains!653 lt!21884 (select (arr!1714 (_keys!3614 (v!2313 (underlying!198 thiss!992)))) from!355)))))

(declare-fun b!55247 () Bool)

(declare-fun res!31138 () Bool)

(assert (=> b!55247 (=> (not res!31138) (not e!36283))))

(assert (=> b!55247 (= res!31138 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1944 (_keys!3614 (v!2313 (underlying!198 thiss!992)))))))))

(declare-fun b!55248 () Bool)

(declare-fun res!31145 () Bool)

(assert (=> b!55248 (=> res!31145 e!36290)))

(assert (=> b!55248 (= res!31145 (not (arrayNoDuplicates!0 (_keys!3614 (v!2313 (underlying!198 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!21884)))))

(declare-fun mapIsEmpty!2693 () Bool)

(assert (=> mapIsEmpty!2693 mapRes!2694))

(declare-fun b!55249 () Bool)

(assert (=> b!55249 (= e!36283 e!36287)))

(declare-fun res!31141 () Bool)

(assert (=> b!55249 (=> (not res!31141) (not e!36287))))

(declare-fun lt!21881 () ListLongMap!1325)

(assert (=> b!55249 (= res!31141 (and (= lt!21881 lt!21879) (not (= (select (arr!1714 (_keys!3614 (v!2313 (underlying!198 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1714 (_keys!3614 (v!2313 (underlying!198 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1073 (LongMapFixedSize!562) ListLongMap!1325)

(assert (=> b!55249 (= lt!21879 (map!1073 newMap!16))))

(declare-fun getCurrentListMap!377 (array!3585 array!3587 (_ BitVec 32) (_ BitVec 32) V!2769 V!2769 (_ BitVec 32) Int) ListLongMap!1325)

(assert (=> b!55249 (= lt!21881 (getCurrentListMap!377 (_keys!3614 (v!2313 (underlying!198 thiss!992))) (_values!1978 (v!2313 (underlying!198 thiss!992))) (mask!5851 (v!2313 (underlying!198 thiss!992))) (extraKeys!1886 (v!2313 (underlying!198 thiss!992))) (zeroValue!1913 (v!2313 (underlying!198 thiss!992))) (minValue!1913 (v!2313 (underlying!198 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1995 (v!2313 (underlying!198 thiss!992)))))))

(declare-fun b!55250 () Bool)

(declare-fun res!31144 () Bool)

(assert (=> b!55250 (=> res!31144 e!36290)))

(assert (=> b!55250 (= res!31144 (contains!653 lt!21884 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!2694 () Bool)

(declare-fun tp!7649 () Bool)

(declare-fun e!36277 () Bool)

(assert (=> mapNonEmpty!2694 (= mapRes!2694 (and tp!7649 e!36277))))

(declare-fun mapValue!2693 () ValueCell!827)

(declare-fun mapRest!2693 () (Array (_ BitVec 32) ValueCell!827))

(declare-fun mapKey!2694 () (_ BitVec 32))

(assert (=> mapNonEmpty!2694 (= (arr!1715 (_values!1978 newMap!16)) (store mapRest!2693 mapKey!2694 mapValue!2693))))

(declare-fun res!31146 () Bool)

(assert (=> start!8346 (=> (not res!31146) (not e!36283))))

(declare-fun valid!224 (LongMap!374) Bool)

(assert (=> start!8346 (= res!31146 (valid!224 thiss!992))))

(assert (=> start!8346 e!36283))

(declare-fun e!36280 () Bool)

(assert (=> start!8346 e!36280))

(assert (=> start!8346 true))

(declare-fun e!36286 () Bool)

(assert (=> start!8346 e!36286))

(declare-fun b!55245 () Bool)

(declare-fun e!36292 () Bool)

(assert (=> b!55245 (= e!36280 e!36292)))

(declare-fun b!55251 () Bool)

(assert (=> b!55251 (= e!36277 tp_is_empty!2341)))

(declare-fun b!55252 () Bool)

(declare-fun e!36282 () Bool)

(assert (=> b!55252 (= e!36292 e!36282)))

(declare-fun array_inv!1055 (array!3585) Bool)

(declare-fun array_inv!1056 (array!3587) Bool)

(assert (=> b!55253 (= e!36282 (and tp!7647 tp_is_empty!2341 (array_inv!1055 (_keys!3614 (v!2313 (underlying!198 thiss!992)))) (array_inv!1056 (_values!1978 (v!2313 (underlying!198 thiss!992)))) e!36291))))

(declare-fun mapIsEmpty!2694 () Bool)

(assert (=> mapIsEmpty!2694 mapRes!2693))

(declare-fun b!55254 () Bool)

(declare-fun res!31140 () Bool)

(assert (=> b!55254 (=> (not res!31140) (not e!36283))))

(declare-fun valid!225 (LongMapFixedSize!562) Bool)

(assert (=> b!55254 (= res!31140 (valid!225 newMap!16))))

(assert (=> b!55255 (= e!36286 (and tp!7648 tp_is_empty!2341 (array_inv!1055 (_keys!3614 newMap!16)) (array_inv!1056 (_values!1978 newMap!16)) e!36289))))

(declare-fun b!55256 () Bool)

(assert (=> b!55256 (= e!36281 tp_is_empty!2341)))

(declare-fun b!55257 () Bool)

(declare-fun res!31137 () Bool)

(assert (=> b!55257 (=> res!31137 e!36290)))

(declare-fun noDuplicate!40 (List!1399) Bool)

(assert (=> b!55257 (= res!31137 (not (noDuplicate!40 lt!21884)))))

(declare-fun b!55258 () Bool)

(declare-fun res!31143 () Bool)

(assert (=> b!55258 (=> res!31143 e!36290)))

(assert (=> b!55258 (= res!31143 (contains!653 lt!21884 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55259 () Bool)

(assert (=> b!55259 (= e!36285 tp_is_empty!2341)))

(assert (= (and start!8346 res!31146) b!55247))

(assert (= (and b!55247 res!31138) b!55254))

(assert (= (and b!55254 res!31140) b!55242))

(assert (= (and b!55242 res!31142) b!55249))

(assert (= (and b!55249 res!31141) b!55244))

(assert (= (and b!55244 res!31136) b!55240))

(assert (= (and b!55240 (not res!31139)) b!55257))

(assert (= (and b!55257 (not res!31137)) b!55250))

(assert (= (and b!55250 (not res!31144)) b!55258))

(assert (= (and b!55258 (not res!31143)) b!55248))

(assert (= (and b!55248 (not res!31145)) b!55246))

(assert (= (and b!55241 condMapEmpty!2694) mapIsEmpty!2694))

(assert (= (and b!55241 (not condMapEmpty!2694)) mapNonEmpty!2693))

(get-info :version)

(assert (= (and mapNonEmpty!2693 ((_ is ValueCellFull!827) mapValue!2694)) b!55259))

(assert (= (and b!55241 ((_ is ValueCellFull!827) mapDefault!2694)) b!55256))

(assert (= b!55253 b!55241))

(assert (= b!55252 b!55253))

(assert (= b!55245 b!55252))

(assert (= start!8346 b!55245))

(assert (= (and b!55239 condMapEmpty!2693) mapIsEmpty!2693))

(assert (= (and b!55239 (not condMapEmpty!2693)) mapNonEmpty!2694))

(assert (= (and mapNonEmpty!2694 ((_ is ValueCellFull!827) mapValue!2693)) b!55251))

(assert (= (and b!55239 ((_ is ValueCellFull!827) mapDefault!2693)) b!55243))

(assert (= b!55255 b!55239))

(assert (= start!8346 b!55255))

(declare-fun b_lambda!2439 () Bool)

(assert (=> (not b_lambda!2439) (not b!55244)))

(declare-fun t!4613 () Bool)

(declare-fun tb!1193 () Bool)

(assert (=> (and b!55253 (= (defaultEntry!1995 (v!2313 (underlying!198 thiss!992))) (defaultEntry!1995 (v!2313 (underlying!198 thiss!992)))) t!4613) tb!1193))

(declare-fun result!2187 () Bool)

(assert (=> tb!1193 (= result!2187 tp_is_empty!2341)))

(assert (=> b!55244 t!4613))

(declare-fun b_and!3245 () Bool)

(assert (= b_and!3241 (and (=> t!4613 result!2187) b_and!3245)))

(declare-fun tb!1195 () Bool)

(declare-fun t!4615 () Bool)

(assert (=> (and b!55255 (= (defaultEntry!1995 newMap!16) (defaultEntry!1995 (v!2313 (underlying!198 thiss!992)))) t!4615) tb!1195))

(declare-fun result!2191 () Bool)

(assert (= result!2191 result!2187))

(assert (=> b!55244 t!4615))

(declare-fun b_and!3247 () Bool)

(assert (= b_and!3243 (and (=> t!4615 result!2191) b_and!3247)))

(declare-fun m!46573 () Bool)

(assert (=> b!55249 m!46573))

(declare-fun m!46575 () Bool)

(assert (=> b!55249 m!46575))

(declare-fun m!46577 () Bool)

(assert (=> b!55249 m!46577))

(declare-fun m!46579 () Bool)

(assert (=> b!55250 m!46579))

(declare-fun m!46581 () Bool)

(assert (=> b!55253 m!46581))

(declare-fun m!46583 () Bool)

(assert (=> b!55253 m!46583))

(declare-fun m!46585 () Bool)

(assert (=> b!55244 m!46585))

(declare-fun m!46587 () Bool)

(assert (=> b!55244 m!46587))

(declare-fun m!46589 () Bool)

(assert (=> b!55244 m!46589))

(assert (=> b!55244 m!46573))

(assert (=> b!55244 m!46587))

(assert (=> b!55244 m!46573))

(declare-fun m!46591 () Bool)

(assert (=> b!55244 m!46591))

(assert (=> b!55244 m!46573))

(assert (=> b!55244 m!46589))

(declare-fun m!46593 () Bool)

(assert (=> b!55244 m!46593))

(assert (=> b!55244 m!46585))

(declare-fun m!46595 () Bool)

(assert (=> mapNonEmpty!2693 m!46595))

(declare-fun m!46597 () Bool)

(assert (=> b!55248 m!46597))

(assert (=> b!55246 m!46573))

(assert (=> b!55246 m!46573))

(declare-fun m!46599 () Bool)

(assert (=> b!55246 m!46599))

(declare-fun m!46601 () Bool)

(assert (=> b!55240 m!46601))

(declare-fun m!46603 () Bool)

(assert (=> b!55240 m!46603))

(assert (=> b!55240 m!46573))

(declare-fun m!46605 () Bool)

(assert (=> b!55240 m!46605))

(assert (=> b!55240 m!46573))

(assert (=> b!55240 m!46573))

(declare-fun m!46607 () Bool)

(assert (=> b!55240 m!46607))

(declare-fun m!46609 () Bool)

(assert (=> mapNonEmpty!2694 m!46609))

(declare-fun m!46611 () Bool)

(assert (=> b!55254 m!46611))

(declare-fun m!46613 () Bool)

(assert (=> b!55258 m!46613))

(declare-fun m!46615 () Bool)

(assert (=> b!55257 m!46615))

(declare-fun m!46617 () Bool)

(assert (=> start!8346 m!46617))

(declare-fun m!46619 () Bool)

(assert (=> b!55255 m!46619))

(declare-fun m!46621 () Bool)

(assert (=> b!55255 m!46621))

(check-sat (not b_lambda!2439) (not b_next!1851) (not b!55240) (not b!55249) b_and!3247 (not b_next!1849) (not b!55258) (not b!55257) (not b!55253) (not b!55248) (not b!55254) (not b!55244) (not b!55250) (not start!8346) tp_is_empty!2341 b_and!3245 (not mapNonEmpty!2693) (not mapNonEmpty!2694) (not b!55255) (not b!55246))
(check-sat b_and!3245 b_and!3247 (not b_next!1849) (not b_next!1851))
