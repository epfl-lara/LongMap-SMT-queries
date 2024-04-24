; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8310 () Bool)

(assert start!8310)

(declare-fun b!54263 () Bool)

(declare-fun b_free!1777 () Bool)

(declare-fun b_next!1777 () Bool)

(assert (=> b!54263 (= b_free!1777 (not b_next!1777))))

(declare-fun tp!7434 () Bool)

(declare-fun b_and!3093 () Bool)

(assert (=> b!54263 (= tp!7434 b_and!3093)))

(declare-fun b!54266 () Bool)

(declare-fun b_free!1779 () Bool)

(declare-fun b_next!1779 () Bool)

(assert (=> b!54266 (= b_free!1779 (not b_next!1779))))

(declare-fun tp!7433 () Bool)

(declare-fun b_and!3095 () Bool)

(assert (=> b!54266 (= tp!7433 b_and!3095)))

(declare-fun b!54258 () Bool)

(declare-fun e!35426 () Bool)

(declare-fun e!35438 () Bool)

(assert (=> b!54258 (= e!35426 e!35438)))

(declare-fun res!30726 () Bool)

(assert (=> b!54258 (=> (not res!30726) (not e!35438))))

(declare-datatypes ((V!2721 0))(
  ( (V!2722 (val!1197 Int)) )
))
(declare-datatypes ((array!3519 0))(
  ( (array!3520 (arr!1682 (Array (_ BitVec 32) (_ BitVec 64))) (size!1911 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!809 0))(
  ( (ValueCellFull!809 (v!2283 V!2721)) (EmptyCell!809) )
))
(declare-datatypes ((array!3521 0))(
  ( (array!3522 (arr!1683 (Array (_ BitVec 32) ValueCell!809)) (size!1912 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!526 0))(
  ( (LongMapFixedSize!527 (defaultEntry!1977 Int) (mask!5822 (_ BitVec 32)) (extraKeys!1868 (_ BitVec 32)) (zeroValue!1895 V!2721) (minValue!1895 V!2721) (_size!312 (_ BitVec 32)) (_keys!3597 array!3519) (_values!1960 array!3521) (_vacant!312 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!346 0))(
  ( (Cell!347 (v!2284 LongMapFixedSize!526)) )
))
(declare-datatypes ((LongMap!346 0))(
  ( (LongMap!347 (underlying!184 Cell!346)) )
))
(declare-fun thiss!992 () LongMap!346)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!1912 0))(
  ( (tuple2!1913 (_1!967 (_ BitVec 64)) (_2!967 V!2721)) )
))
(declare-datatypes ((List!1361 0))(
  ( (Nil!1358) (Cons!1357 (h!1937 tuple2!1912) (t!4507 List!1361)) )
))
(declare-datatypes ((ListLongMap!1285 0))(
  ( (ListLongMap!1286 (toList!658 List!1361)) )
))
(declare-fun lt!21585 () ListLongMap!1285)

(declare-fun lt!21584 () ListLongMap!1285)

(assert (=> b!54258 (= res!30726 (and (= lt!21585 lt!21584) (not (= (select (arr!1682 (_keys!3597 (v!2284 (underlying!184 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1682 (_keys!3597 (v!2284 (underlying!184 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!526)

(declare-fun map!1052 (LongMapFixedSize!526) ListLongMap!1285)

(assert (=> b!54258 (= lt!21584 (map!1052 newMap!16))))

(declare-fun getCurrentListMap!362 (array!3519 array!3521 (_ BitVec 32) (_ BitVec 32) V!2721 V!2721 (_ BitVec 32) Int) ListLongMap!1285)

(assert (=> b!54258 (= lt!21585 (getCurrentListMap!362 (_keys!3597 (v!2284 (underlying!184 thiss!992))) (_values!1960 (v!2284 (underlying!184 thiss!992))) (mask!5822 (v!2284 (underlying!184 thiss!992))) (extraKeys!1868 (v!2284 (underlying!184 thiss!992))) (zeroValue!1895 (v!2284 (underlying!184 thiss!992))) (minValue!1895 (v!2284 (underlying!184 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1977 (v!2284 (underlying!184 thiss!992)))))))

(declare-fun b!54259 () Bool)

(declare-fun e!35432 () Bool)

(declare-fun e!35440 () Bool)

(assert (=> b!54259 (= e!35432 e!35440)))

(declare-fun b!54260 () Bool)

(declare-fun e!35435 () Bool)

(declare-fun tp_is_empty!2305 () Bool)

(assert (=> b!54260 (= e!35435 tp_is_empty!2305)))

(declare-fun b!54261 () Bool)

(declare-fun res!30722 () Bool)

(declare-fun e!35428 () Bool)

(assert (=> b!54261 (=> (not res!30722) (not e!35428))))

(assert (=> b!54261 (= res!30722 (and (= (size!1912 (_values!1960 (v!2284 (underlying!184 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5822 (v!2284 (underlying!184 thiss!992))))) (= (size!1911 (_keys!3597 (v!2284 (underlying!184 thiss!992)))) (size!1912 (_values!1960 (v!2284 (underlying!184 thiss!992))))) (bvsge (mask!5822 (v!2284 (underlying!184 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1868 (v!2284 (underlying!184 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1868 (v!2284 (underlying!184 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!54262 () Bool)

(declare-fun res!30727 () Bool)

(assert (=> b!54262 (=> (not res!30727) (not e!35426))))

(declare-fun valid!211 (LongMapFixedSize!526) Bool)

(assert (=> b!54262 (= res!30727 (valid!211 newMap!16))))

(declare-fun e!35430 () Bool)

(declare-fun array_inv!1029 (array!3519) Bool)

(declare-fun array_inv!1030 (array!3521) Bool)

(assert (=> b!54263 (= e!35440 (and tp!7434 tp_is_empty!2305 (array_inv!1029 (_keys!3597 (v!2284 (underlying!184 thiss!992)))) (array_inv!1030 (_values!1960 (v!2284 (underlying!184 thiss!992)))) e!35430))))

(declare-fun b!54264 () Bool)

(declare-fun res!30721 () Bool)

(assert (=> b!54264 (=> (not res!30721) (not e!35426))))

(assert (=> b!54264 (= res!30721 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1911 (_keys!3597 (v!2284 (underlying!184 thiss!992)))))))))

(declare-fun mapIsEmpty!2585 () Bool)

(declare-fun mapRes!2585 () Bool)

(assert (=> mapIsEmpty!2585 mapRes!2585))

(declare-fun b!54265 () Bool)

(declare-fun res!30718 () Bool)

(assert (=> b!54265 (=> (not res!30718) (not e!35428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3519 (_ BitVec 32)) Bool)

(assert (=> b!54265 (= res!30718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3597 (v!2284 (underlying!184 thiss!992))) (mask!5822 (v!2284 (underlying!184 thiss!992)))))))

(declare-fun e!35433 () Bool)

(declare-fun e!35429 () Bool)

(assert (=> b!54266 (= e!35433 (and tp!7433 tp_is_empty!2305 (array_inv!1029 (_keys!3597 newMap!16)) (array_inv!1030 (_values!1960 newMap!16)) e!35429))))

(declare-fun mapNonEmpty!2585 () Bool)

(declare-fun mapRes!2586 () Bool)

(declare-fun tp!7431 () Bool)

(declare-fun e!35436 () Bool)

(assert (=> mapNonEmpty!2585 (= mapRes!2586 (and tp!7431 e!35436))))

(declare-fun mapKey!2585 () (_ BitVec 32))

(declare-fun mapRest!2586 () (Array (_ BitVec 32) ValueCell!809))

(declare-fun mapValue!2585 () ValueCell!809)

(assert (=> mapNonEmpty!2585 (= (arr!1683 (_values!1960 (v!2284 (underlying!184 thiss!992)))) (store mapRest!2586 mapKey!2585 mapValue!2585))))

(declare-fun res!30717 () Bool)

(assert (=> start!8310 (=> (not res!30717) (not e!35426))))

(declare-fun valid!212 (LongMap!346) Bool)

(assert (=> start!8310 (= res!30717 (valid!212 thiss!992))))

(assert (=> start!8310 e!35426))

(declare-fun e!35431 () Bool)

(assert (=> start!8310 e!35431))

(assert (=> start!8310 true))

(assert (=> start!8310 e!35433))

(declare-fun b!54267 () Bool)

(assert (=> b!54267 (= e!35428 false)))

(declare-fun lt!21587 () Bool)

(declare-fun contains!636 (ListLongMap!1285 (_ BitVec 64)) Bool)

(assert (=> b!54267 (= lt!21587 (contains!636 lt!21585 (select (arr!1682 (_keys!3597 (v!2284 (underlying!184 thiss!992)))) from!355)))))

(declare-fun b!54268 () Bool)

(declare-fun e!35434 () Bool)

(assert (=> b!54268 (= e!35430 (and e!35434 mapRes!2586))))

(declare-fun condMapEmpty!2585 () Bool)

(declare-fun mapDefault!2586 () ValueCell!809)

(assert (=> b!54268 (= condMapEmpty!2585 (= (arr!1683 (_values!1960 (v!2284 (underlying!184 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!809)) mapDefault!2586)))))

(declare-fun b!54269 () Bool)

(assert (=> b!54269 (= e!35429 (and e!35435 mapRes!2585))))

(declare-fun condMapEmpty!2586 () Bool)

(declare-fun mapDefault!2585 () ValueCell!809)

(assert (=> b!54269 (= condMapEmpty!2586 (= (arr!1683 (_values!1960 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!809)) mapDefault!2585)))))

(declare-fun mapNonEmpty!2586 () Bool)

(declare-fun tp!7432 () Bool)

(declare-fun e!35439 () Bool)

(assert (=> mapNonEmpty!2586 (= mapRes!2585 (and tp!7432 e!35439))))

(declare-fun mapValue!2586 () ValueCell!809)

(declare-fun mapKey!2586 () (_ BitVec 32))

(declare-fun mapRest!2585 () (Array (_ BitVec 32) ValueCell!809))

(assert (=> mapNonEmpty!2586 (= (arr!1683 (_values!1960 newMap!16)) (store mapRest!2585 mapKey!2586 mapValue!2586))))

(declare-fun mapIsEmpty!2586 () Bool)

(assert (=> mapIsEmpty!2586 mapRes!2586))

(declare-fun b!54270 () Bool)

(declare-fun res!30724 () Bool)

(assert (=> b!54270 (=> (not res!30724) (not e!35428))))

(assert (=> b!54270 (= res!30724 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1911 (_keys!3597 (v!2284 (underlying!184 thiss!992)))))))))

(declare-fun b!54271 () Bool)

(declare-fun res!30723 () Bool)

(assert (=> b!54271 (=> (not res!30723) (not e!35426))))

(assert (=> b!54271 (= res!30723 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5822 newMap!16)) (_size!312 (v!2284 (underlying!184 thiss!992)))))))

(declare-fun b!54272 () Bool)

(assert (=> b!54272 (= e!35431 e!35432)))

(declare-fun b!54273 () Bool)

(declare-fun res!30719 () Bool)

(assert (=> b!54273 (=> (not res!30719) (not e!35428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!54273 (= res!30719 (validMask!0 (mask!5822 (v!2284 (underlying!184 thiss!992)))))))

(declare-fun b!54274 () Bool)

(assert (=> b!54274 (= e!35434 tp_is_empty!2305)))

(declare-fun b!54275 () Bool)

(assert (=> b!54275 (= e!35438 e!35428)))

(declare-fun res!30720 () Bool)

(assert (=> b!54275 (=> (not res!30720) (not e!35428))))

(assert (=> b!54275 (= res!30720 (contains!636 lt!21584 (select (arr!1682 (_keys!3597 (v!2284 (underlying!184 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1914 0))(
  ( (tuple2!1915 (_1!968 Bool) (_2!968 LongMapFixedSize!526)) )
))
(declare-fun lt!21586 () tuple2!1914)

(declare-fun update!64 (LongMapFixedSize!526 (_ BitVec 64) V!2721) tuple2!1914)

(declare-fun get!1015 (ValueCell!809 V!2721) V!2721)

(declare-fun dynLambda!282 (Int (_ BitVec 64)) V!2721)

(assert (=> b!54275 (= lt!21586 (update!64 newMap!16 (select (arr!1682 (_keys!3597 (v!2284 (underlying!184 thiss!992)))) from!355) (get!1015 (select (arr!1683 (_values!1960 (v!2284 (underlying!184 thiss!992)))) from!355) (dynLambda!282 (defaultEntry!1977 (v!2284 (underlying!184 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54276 () Bool)

(declare-fun res!30725 () Bool)

(assert (=> b!54276 (=> (not res!30725) (not e!35428))))

(declare-datatypes ((List!1362 0))(
  ( (Nil!1359) (Cons!1358 (h!1938 (_ BitVec 64)) (t!4508 List!1362)) )
))
(declare-fun arrayNoDuplicates!0 (array!3519 (_ BitVec 32) List!1362) Bool)

(assert (=> b!54276 (= res!30725 (arrayNoDuplicates!0 (_keys!3597 (v!2284 (underlying!184 thiss!992))) #b00000000000000000000000000000000 Nil!1359))))

(declare-fun b!54277 () Bool)

(assert (=> b!54277 (= e!35436 tp_is_empty!2305)))

(declare-fun b!54278 () Bool)

(assert (=> b!54278 (= e!35439 tp_is_empty!2305)))

(assert (= (and start!8310 res!30717) b!54264))

(assert (= (and b!54264 res!30721) b!54262))

(assert (= (and b!54262 res!30727) b!54271))

(assert (= (and b!54271 res!30723) b!54258))

(assert (= (and b!54258 res!30726) b!54275))

(assert (= (and b!54275 res!30720) b!54273))

(assert (= (and b!54273 res!30719) b!54261))

(assert (= (and b!54261 res!30722) b!54265))

(assert (= (and b!54265 res!30718) b!54276))

(assert (= (and b!54276 res!30725) b!54270))

(assert (= (and b!54270 res!30724) b!54267))

(assert (= (and b!54268 condMapEmpty!2585) mapIsEmpty!2586))

(assert (= (and b!54268 (not condMapEmpty!2585)) mapNonEmpty!2585))

(get-info :version)

(assert (= (and mapNonEmpty!2585 ((_ is ValueCellFull!809) mapValue!2585)) b!54277))

(assert (= (and b!54268 ((_ is ValueCellFull!809) mapDefault!2586)) b!54274))

(assert (= b!54263 b!54268))

(assert (= b!54259 b!54263))

(assert (= b!54272 b!54259))

(assert (= start!8310 b!54272))

(assert (= (and b!54269 condMapEmpty!2586) mapIsEmpty!2585))

(assert (= (and b!54269 (not condMapEmpty!2586)) mapNonEmpty!2586))

(assert (= (and mapNonEmpty!2586 ((_ is ValueCellFull!809) mapValue!2586)) b!54278))

(assert (= (and b!54269 ((_ is ValueCellFull!809) mapDefault!2585)) b!54260))

(assert (= b!54266 b!54269))

(assert (= start!8310 b!54266))

(declare-fun b_lambda!2399 () Bool)

(assert (=> (not b_lambda!2399) (not b!54275)))

(declare-fun t!4504 () Bool)

(declare-fun tb!1121 () Bool)

(assert (=> (and b!54263 (= (defaultEntry!1977 (v!2284 (underlying!184 thiss!992))) (defaultEntry!1977 (v!2284 (underlying!184 thiss!992)))) t!4504) tb!1121))

(declare-fun result!2079 () Bool)

(assert (=> tb!1121 (= result!2079 tp_is_empty!2305)))

(assert (=> b!54275 t!4504))

(declare-fun b_and!3097 () Bool)

(assert (= b_and!3093 (and (=> t!4504 result!2079) b_and!3097)))

(declare-fun tb!1123 () Bool)

(declare-fun t!4506 () Bool)

(assert (=> (and b!54266 (= (defaultEntry!1977 newMap!16) (defaultEntry!1977 (v!2284 (underlying!184 thiss!992)))) t!4506) tb!1123))

(declare-fun result!2083 () Bool)

(assert (= result!2083 result!2079))

(assert (=> b!54275 t!4506))

(declare-fun b_and!3099 () Bool)

(assert (= b_and!3095 (and (=> t!4506 result!2083) b_and!3099)))

(declare-fun m!45841 () Bool)

(assert (=> b!54262 m!45841))

(declare-fun m!45843 () Bool)

(assert (=> mapNonEmpty!2586 m!45843))

(declare-fun m!45845 () Bool)

(assert (=> b!54267 m!45845))

(assert (=> b!54267 m!45845))

(declare-fun m!45847 () Bool)

(assert (=> b!54267 m!45847))

(declare-fun m!45849 () Bool)

(assert (=> b!54275 m!45849))

(declare-fun m!45851 () Bool)

(assert (=> b!54275 m!45851))

(declare-fun m!45853 () Bool)

(assert (=> b!54275 m!45853))

(assert (=> b!54275 m!45845))

(assert (=> b!54275 m!45851))

(assert (=> b!54275 m!45845))

(declare-fun m!45855 () Bool)

(assert (=> b!54275 m!45855))

(assert (=> b!54275 m!45845))

(assert (=> b!54275 m!45853))

(declare-fun m!45857 () Bool)

(assert (=> b!54275 m!45857))

(assert (=> b!54275 m!45849))

(declare-fun m!45859 () Bool)

(assert (=> start!8310 m!45859))

(declare-fun m!45861 () Bool)

(assert (=> b!54266 m!45861))

(declare-fun m!45863 () Bool)

(assert (=> b!54266 m!45863))

(declare-fun m!45865 () Bool)

(assert (=> mapNonEmpty!2585 m!45865))

(declare-fun m!45867 () Bool)

(assert (=> b!54265 m!45867))

(declare-fun m!45869 () Bool)

(assert (=> b!54273 m!45869))

(assert (=> b!54258 m!45845))

(declare-fun m!45871 () Bool)

(assert (=> b!54258 m!45871))

(declare-fun m!45873 () Bool)

(assert (=> b!54258 m!45873))

(declare-fun m!45875 () Bool)

(assert (=> b!54263 m!45875))

(declare-fun m!45877 () Bool)

(assert (=> b!54263 m!45877))

(declare-fun m!45879 () Bool)

(assert (=> b!54276 m!45879))

(check-sat (not b!54262) (not b!54276) (not b!54263) (not b_next!1779) (not start!8310) (not b!54275) (not b!54266) (not b!54267) (not b_next!1777) b_and!3097 (not b!54273) b_and!3099 (not b!54258) (not b_lambda!2399) (not mapNonEmpty!2586) (not b!54265) (not mapNonEmpty!2585) tp_is_empty!2305)
(check-sat b_and!3097 b_and!3099 (not b_next!1777) (not b_next!1779))
