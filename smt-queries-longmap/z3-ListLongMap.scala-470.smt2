; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9210 () Bool)

(assert start!9210)

(declare-fun b!65398 () Bool)

(declare-fun b_free!2029 () Bool)

(declare-fun b_next!2029 () Bool)

(assert (=> b!65398 (= b_free!2029 (not b_next!2029))))

(declare-fun tp!8236 () Bool)

(declare-fun b_and!4005 () Bool)

(assert (=> b!65398 (= tp!8236 b_and!4005)))

(declare-fun b!65400 () Bool)

(declare-fun b_free!2031 () Bool)

(declare-fun b_next!2031 () Bool)

(assert (=> b!65400 (= b_free!2031 (not b_next!2031))))

(declare-fun tp!8237 () Bool)

(declare-fun b_and!4007 () Bool)

(assert (=> b!65400 (= tp!8237 b_and!4007)))

(declare-fun b!65387 () Bool)

(declare-fun e!42826 () Bool)

(declare-fun e!42828 () Bool)

(declare-fun mapRes!3012 () Bool)

(assert (=> b!65387 (= e!42826 (and e!42828 mapRes!3012))))

(declare-fun condMapEmpty!3011 () Bool)

(declare-datatypes ((V!2889 0))(
  ( (V!2890 (val!1260 Int)) )
))
(declare-datatypes ((array!3785 0))(
  ( (array!3786 (arr!1808 (Array (_ BitVec 32) (_ BitVec 64))) (size!2043 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!872 0))(
  ( (ValueCellFull!872 (v!2458 V!2889)) (EmptyCell!872) )
))
(declare-datatypes ((array!3787 0))(
  ( (array!3788 (arr!1809 (Array (_ BitVec 32) ValueCell!872)) (size!2044 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!652 0))(
  ( (LongMapFixedSize!653 (defaultEntry!2134 Int) (mask!6062 (_ BitVec 32)) (extraKeys!2005 (_ BitVec 32)) (zeroValue!2042 V!2889) (minValue!2042 V!2889) (_size!375 (_ BitVec 32)) (_keys!3774 array!3785) (_values!2117 array!3787) (_vacant!375 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!462 0))(
  ( (Cell!463 (v!2459 LongMapFixedSize!652)) )
))
(declare-datatypes ((LongMap!462 0))(
  ( (LongMap!463 (underlying!242 Cell!462)) )
))
(declare-fun thiss!992 () LongMap!462)

(declare-fun mapDefault!3011 () ValueCell!872)

(assert (=> b!65387 (= condMapEmpty!3011 (= (arr!1809 (_values!2117 (v!2459 (underlying!242 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!872)) mapDefault!3011)))))

(declare-fun b!65388 () Bool)

(declare-fun e!42832 () Bool)

(declare-fun tp_is_empty!2431 () Bool)

(assert (=> b!65388 (= e!42832 tp_is_empty!2431)))

(declare-fun b!65389 () Bool)

(declare-fun res!35567 () Bool)

(declare-fun e!42837 () Bool)

(assert (=> b!65389 (=> (not res!35567) (not e!42837))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!65389 (= res!35567 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2043 (_keys!3774 (v!2459 (underlying!242 thiss!992)))))))))

(declare-fun b!65390 () Bool)

(declare-fun e!42838 () Bool)

(assert (=> b!65390 (= e!42838 tp_is_empty!2431)))

(declare-fun b!65391 () Bool)

(declare-fun e!42824 () Bool)

(assert (=> b!65391 (= e!42824 tp_is_empty!2431)))

(declare-fun mapNonEmpty!3011 () Bool)

(declare-fun mapRes!3011 () Bool)

(declare-fun tp!8235 () Bool)

(assert (=> mapNonEmpty!3011 (= mapRes!3011 (and tp!8235 e!42838))))

(declare-fun mapValue!3012 () ValueCell!872)

(declare-fun mapRest!3012 () (Array (_ BitVec 32) ValueCell!872))

(declare-fun newMap!16 () LongMapFixedSize!652)

(declare-fun mapKey!3011 () (_ BitVec 32))

(assert (=> mapNonEmpty!3011 (= (arr!1809 (_values!2117 newMap!16)) (store mapRest!3012 mapKey!3011 mapValue!3012))))

(declare-fun b!65392 () Bool)

(declare-fun res!35569 () Bool)

(assert (=> b!65392 (=> (not res!35569) (not e!42837))))

(assert (=> b!65392 (= res!35569 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6062 newMap!16)) (_size!375 (v!2459 (underlying!242 thiss!992)))))))

(declare-fun b!65393 () Bool)

(declare-fun res!35572 () Bool)

(declare-fun e!42834 () Bool)

(assert (=> b!65393 (=> (not res!35572) (not e!42834))))

(declare-datatypes ((List!1442 0))(
  ( (Nil!1439) (Cons!1438 (h!2022 (_ BitVec 64)) (t!4880 List!1442)) )
))
(declare-fun arrayNoDuplicates!0 (array!3785 (_ BitVec 32) List!1442) Bool)

(assert (=> b!65393 (= res!35572 (arrayNoDuplicates!0 (_keys!3774 (v!2459 (underlying!242 thiss!992))) #b00000000000000000000000000000000 Nil!1439))))

(declare-fun b!65394 () Bool)

(declare-fun res!35573 () Bool)

(assert (=> b!65394 (=> (not res!35573) (not e!42837))))

(declare-fun valid!280 (LongMapFixedSize!652) Bool)

(assert (=> b!65394 (= res!35573 (valid!280 newMap!16))))

(declare-fun res!35568 () Bool)

(assert (=> start!9210 (=> (not res!35568) (not e!42837))))

(declare-fun valid!281 (LongMap!462) Bool)

(assert (=> start!9210 (= res!35568 (valid!281 thiss!992))))

(assert (=> start!9210 e!42837))

(declare-fun e!42825 () Bool)

(assert (=> start!9210 e!42825))

(assert (=> start!9210 true))

(declare-fun e!42823 () Bool)

(assert (=> start!9210 e!42823))

(declare-fun b!65395 () Bool)

(declare-fun e!42829 () Bool)

(assert (=> b!65395 (= e!42837 e!42829)))

(declare-fun res!35570 () Bool)

(assert (=> b!65395 (=> (not res!35570) (not e!42829))))

(declare-datatypes ((tuple2!2056 0))(
  ( (tuple2!2057 (_1!1039 (_ BitVec 64)) (_2!1039 V!2889)) )
))
(declare-datatypes ((List!1443 0))(
  ( (Nil!1440) (Cons!1439 (h!2023 tuple2!2056) (t!4881 List!1443)) )
))
(declare-datatypes ((ListLongMap!1365 0))(
  ( (ListLongMap!1366 (toList!698 List!1443)) )
))
(declare-fun lt!28051 () ListLongMap!1365)

(declare-fun lt!28052 () ListLongMap!1365)

(assert (=> b!65395 (= res!35570 (and (= lt!28052 lt!28051) (not (= (select (arr!1808 (_keys!3774 (v!2459 (underlying!242 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1808 (_keys!3774 (v!2459 (underlying!242 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1130 (LongMapFixedSize!652) ListLongMap!1365)

(assert (=> b!65395 (= lt!28051 (map!1130 newMap!16))))

(declare-fun getCurrentListMap!398 (array!3785 array!3787 (_ BitVec 32) (_ BitVec 32) V!2889 V!2889 (_ BitVec 32) Int) ListLongMap!1365)

(assert (=> b!65395 (= lt!28052 (getCurrentListMap!398 (_keys!3774 (v!2459 (underlying!242 thiss!992))) (_values!2117 (v!2459 (underlying!242 thiss!992))) (mask!6062 (v!2459 (underlying!242 thiss!992))) (extraKeys!2005 (v!2459 (underlying!242 thiss!992))) (zeroValue!2042 (v!2459 (underlying!242 thiss!992))) (minValue!2042 (v!2459 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2134 (v!2459 (underlying!242 thiss!992)))))))

(declare-fun mapIsEmpty!3011 () Bool)

(assert (=> mapIsEmpty!3011 mapRes!3012))

(declare-fun b!65396 () Bool)

(declare-datatypes ((Unit!1800 0))(
  ( (Unit!1801) )
))
(declare-fun e!42831 () Unit!1800)

(declare-fun Unit!1802 () Unit!1800)

(assert (=> b!65396 (= e!42831 Unit!1802)))

(declare-fun lt!28050 () Unit!1800)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!32 (array!3785 array!3787 (_ BitVec 32) (_ BitVec 32) V!2889 V!2889 (_ BitVec 64) (_ BitVec 32) Int) Unit!1800)

(assert (=> b!65396 (= lt!28050 (lemmaListMapContainsThenArrayContainsFrom!32 (_keys!3774 (v!2459 (underlying!242 thiss!992))) (_values!2117 (v!2459 (underlying!242 thiss!992))) (mask!6062 (v!2459 (underlying!242 thiss!992))) (extraKeys!2005 (v!2459 (underlying!242 thiss!992))) (zeroValue!2042 (v!2459 (underlying!242 thiss!992))) (minValue!2042 (v!2459 (underlying!242 thiss!992))) (select (arr!1808 (_keys!3774 (v!2459 (underlying!242 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2134 (v!2459 (underlying!242 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!65396 (arrayContainsKey!0 (_keys!3774 (v!2459 (underlying!242 thiss!992))) (select (arr!1808 (_keys!3774 (v!2459 (underlying!242 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!28053 () Unit!1800)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3785 (_ BitVec 32) (_ BitVec 32)) Unit!1800)

(assert (=> b!65396 (= lt!28053 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3774 (v!2459 (underlying!242 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!65396 (arrayNoDuplicates!0 (_keys!3774 (v!2459 (underlying!242 thiss!992))) from!355 Nil!1439)))

(declare-fun lt!28049 () Unit!1800)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3785 (_ BitVec 32) (_ BitVec 64) List!1442) Unit!1800)

(assert (=> b!65396 (= lt!28049 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3774 (v!2459 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1808 (_keys!3774 (v!2459 (underlying!242 thiss!992)))) from!355) (Cons!1438 (select (arr!1808 (_keys!3774 (v!2459 (underlying!242 thiss!992)))) from!355) Nil!1439)))))

(assert (=> b!65396 false))

(declare-fun b!65397 () Bool)

(declare-fun e!42836 () Bool)

(assert (=> b!65397 (= e!42825 e!42836)))

(declare-fun e!42835 () Bool)

(declare-fun array_inv!1109 (array!3785) Bool)

(declare-fun array_inv!1110 (array!3787) Bool)

(assert (=> b!65398 (= e!42835 (and tp!8236 tp_is_empty!2431 (array_inv!1109 (_keys!3774 (v!2459 (underlying!242 thiss!992)))) (array_inv!1110 (_values!2117 (v!2459 (underlying!242 thiss!992)))) e!42826))))

(declare-fun b!65399 () Bool)

(declare-fun e!42827 () Bool)

(assert (=> b!65399 (= e!42827 (and e!42832 mapRes!3011))))

(declare-fun condMapEmpty!3012 () Bool)

(declare-fun mapDefault!3012 () ValueCell!872)

(assert (=> b!65399 (= condMapEmpty!3012 (= (arr!1809 (_values!2117 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!872)) mapDefault!3012)))))

(assert (=> b!65400 (= e!42823 (and tp!8237 tp_is_empty!2431 (array_inv!1109 (_keys!3774 newMap!16)) (array_inv!1110 (_values!2117 newMap!16)) e!42827))))

(declare-fun b!65401 () Bool)

(assert (=> b!65401 (= e!42834 (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun b!65402 () Bool)

(assert (=> b!65402 (= e!42828 tp_is_empty!2431)))

(declare-fun b!65403 () Bool)

(declare-fun res!35566 () Bool)

(assert (=> b!65403 (=> (not res!35566) (not e!42834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!65403 (= res!35566 (validMask!0 (mask!6062 (v!2459 (underlying!242 thiss!992)))))))

(declare-fun mapIsEmpty!3012 () Bool)

(assert (=> mapIsEmpty!3012 mapRes!3011))

(declare-fun b!65404 () Bool)

(assert (=> b!65404 (= e!42829 e!42834)))

(declare-fun res!35564 () Bool)

(assert (=> b!65404 (=> (not res!35564) (not e!42834))))

(declare-datatypes ((tuple2!2058 0))(
  ( (tuple2!2059 (_1!1040 Bool) (_2!1040 LongMapFixedSize!652)) )
))
(declare-fun lt!28055 () tuple2!2058)

(assert (=> b!65404 (= res!35564 (and (_1!1040 lt!28055) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!28054 () Unit!1800)

(assert (=> b!65404 (= lt!28054 e!42831)))

(declare-fun c!9005 () Bool)

(declare-fun contains!698 (ListLongMap!1365 (_ BitVec 64)) Bool)

(assert (=> b!65404 (= c!9005 (contains!698 lt!28051 (select (arr!1808 (_keys!3774 (v!2459 (underlying!242 thiss!992)))) from!355)))))

(declare-fun update!96 (LongMapFixedSize!652 (_ BitVec 64) V!2889) tuple2!2058)

(declare-fun get!1109 (ValueCell!872 V!2889) V!2889)

(declare-fun dynLambda!314 (Int (_ BitVec 64)) V!2889)

(assert (=> b!65404 (= lt!28055 (update!96 newMap!16 (select (arr!1808 (_keys!3774 (v!2459 (underlying!242 thiss!992)))) from!355) (get!1109 (select (arr!1809 (_values!2117 (v!2459 (underlying!242 thiss!992)))) from!355) (dynLambda!314 (defaultEntry!2134 (v!2459 (underlying!242 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!65405 () Bool)

(assert (=> b!65405 (= e!42836 e!42835)))

(declare-fun b!65406 () Bool)

(declare-fun res!35565 () Bool)

(assert (=> b!65406 (=> (not res!35565) (not e!42834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3785 (_ BitVec 32)) Bool)

(assert (=> b!65406 (= res!35565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3774 (v!2459 (underlying!242 thiss!992))) (mask!6062 (v!2459 (underlying!242 thiss!992)))))))

(declare-fun mapNonEmpty!3012 () Bool)

(declare-fun tp!8238 () Bool)

(assert (=> mapNonEmpty!3012 (= mapRes!3012 (and tp!8238 e!42824))))

(declare-fun mapRest!3011 () (Array (_ BitVec 32) ValueCell!872))

(declare-fun mapValue!3011 () ValueCell!872)

(declare-fun mapKey!3012 () (_ BitVec 32))

(assert (=> mapNonEmpty!3012 (= (arr!1809 (_values!2117 (v!2459 (underlying!242 thiss!992)))) (store mapRest!3011 mapKey!3012 mapValue!3011))))

(declare-fun b!65407 () Bool)

(declare-fun res!35571 () Bool)

(assert (=> b!65407 (=> (not res!35571) (not e!42834))))

(assert (=> b!65407 (= res!35571 (and (= (size!2044 (_values!2117 (v!2459 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6062 (v!2459 (underlying!242 thiss!992))))) (= (size!2043 (_keys!3774 (v!2459 (underlying!242 thiss!992)))) (size!2044 (_values!2117 (v!2459 (underlying!242 thiss!992))))) (bvsge (mask!6062 (v!2459 (underlying!242 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2005 (v!2459 (underlying!242 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2005 (v!2459 (underlying!242 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!65408 () Bool)

(declare-fun Unit!1803 () Unit!1800)

(assert (=> b!65408 (= e!42831 Unit!1803)))

(assert (= (and start!9210 res!35568) b!65389))

(assert (= (and b!65389 res!35567) b!65394))

(assert (= (and b!65394 res!35573) b!65392))

(assert (= (and b!65392 res!35569) b!65395))

(assert (= (and b!65395 res!35570) b!65404))

(assert (= (and b!65404 c!9005) b!65396))

(assert (= (and b!65404 (not c!9005)) b!65408))

(assert (= (and b!65404 res!35564) b!65403))

(assert (= (and b!65403 res!35566) b!65407))

(assert (= (and b!65407 res!35571) b!65406))

(assert (= (and b!65406 res!35565) b!65393))

(assert (= (and b!65393 res!35572) b!65401))

(assert (= (and b!65387 condMapEmpty!3011) mapIsEmpty!3011))

(assert (= (and b!65387 (not condMapEmpty!3011)) mapNonEmpty!3012))

(get-info :version)

(assert (= (and mapNonEmpty!3012 ((_ is ValueCellFull!872) mapValue!3011)) b!65391))

(assert (= (and b!65387 ((_ is ValueCellFull!872) mapDefault!3011)) b!65402))

(assert (= b!65398 b!65387))

(assert (= b!65405 b!65398))

(assert (= b!65397 b!65405))

(assert (= start!9210 b!65397))

(assert (= (and b!65399 condMapEmpty!3012) mapIsEmpty!3012))

(assert (= (and b!65399 (not condMapEmpty!3012)) mapNonEmpty!3011))

(assert (= (and mapNonEmpty!3011 ((_ is ValueCellFull!872) mapValue!3012)) b!65390))

(assert (= (and b!65399 ((_ is ValueCellFull!872) mapDefault!3012)) b!65388))

(assert (= b!65400 b!65399))

(assert (= start!9210 b!65400))

(declare-fun b_lambda!2939 () Bool)

(assert (=> (not b_lambda!2939) (not b!65404)))

(declare-fun t!4877 () Bool)

(declare-fun tb!1413 () Bool)

(assert (=> (and b!65398 (= (defaultEntry!2134 (v!2459 (underlying!242 thiss!992))) (defaultEntry!2134 (v!2459 (underlying!242 thiss!992)))) t!4877) tb!1413))

(declare-fun result!2511 () Bool)

(assert (=> tb!1413 (= result!2511 tp_is_empty!2431)))

(assert (=> b!65404 t!4877))

(declare-fun b_and!4009 () Bool)

(assert (= b_and!4005 (and (=> t!4877 result!2511) b_and!4009)))

(declare-fun tb!1415 () Bool)

(declare-fun t!4879 () Bool)

(assert (=> (and b!65400 (= (defaultEntry!2134 newMap!16) (defaultEntry!2134 (v!2459 (underlying!242 thiss!992)))) t!4879) tb!1415))

(declare-fun result!2515 () Bool)

(assert (= result!2515 result!2511))

(assert (=> b!65404 t!4879))

(declare-fun b_and!4011 () Bool)

(assert (= b_and!4007 (and (=> t!4879 result!2515) b_and!4011)))

(declare-fun m!60155 () Bool)

(assert (=> start!9210 m!60155))

(declare-fun m!60157 () Bool)

(assert (=> mapNonEmpty!3012 m!60157))

(declare-fun m!60159 () Bool)

(assert (=> b!65406 m!60159))

(declare-fun m!60161 () Bool)

(assert (=> b!65396 m!60161))

(declare-fun m!60163 () Bool)

(assert (=> b!65396 m!60163))

(declare-fun m!60165 () Bool)

(assert (=> b!65396 m!60165))

(declare-fun m!60167 () Bool)

(assert (=> b!65396 m!60167))

(assert (=> b!65396 m!60165))

(assert (=> b!65396 m!60165))

(declare-fun m!60169 () Bool)

(assert (=> b!65396 m!60169))

(assert (=> b!65396 m!60165))

(declare-fun m!60171 () Bool)

(assert (=> b!65396 m!60171))

(assert (=> b!65395 m!60165))

(declare-fun m!60173 () Bool)

(assert (=> b!65395 m!60173))

(declare-fun m!60175 () Bool)

(assert (=> b!65395 m!60175))

(declare-fun m!60177 () Bool)

(assert (=> b!65400 m!60177))

(declare-fun m!60179 () Bool)

(assert (=> b!65400 m!60179))

(declare-fun m!60181 () Bool)

(assert (=> b!65403 m!60181))

(declare-fun m!60183 () Bool)

(assert (=> mapNonEmpty!3011 m!60183))

(declare-fun m!60185 () Bool)

(assert (=> b!65394 m!60185))

(declare-fun m!60187 () Bool)

(assert (=> b!65398 m!60187))

(declare-fun m!60189 () Bool)

(assert (=> b!65398 m!60189))

(declare-fun m!60191 () Bool)

(assert (=> b!65393 m!60191))

(declare-fun m!60193 () Bool)

(assert (=> b!65404 m!60193))

(declare-fun m!60195 () Bool)

(assert (=> b!65404 m!60195))

(declare-fun m!60197 () Bool)

(assert (=> b!65404 m!60197))

(assert (=> b!65404 m!60165))

(assert (=> b!65404 m!60195))

(assert (=> b!65404 m!60165))

(declare-fun m!60199 () Bool)

(assert (=> b!65404 m!60199))

(assert (=> b!65404 m!60165))

(assert (=> b!65404 m!60197))

(declare-fun m!60201 () Bool)

(assert (=> b!65404 m!60201))

(assert (=> b!65404 m!60193))

(check-sat (not mapNonEmpty!3011) (not b!65403) (not b!65400) (not b!65394) (not b_next!2029) b_and!4011 b_and!4009 (not b_next!2031) (not b!65396) (not mapNonEmpty!3012) (not b!65398) (not b!65404) (not b!65393) (not b!65395) tp_is_empty!2431 (not start!9210) (not b!65406) (not b_lambda!2939))
(check-sat b_and!4009 b_and!4011 (not b_next!2029) (not b_next!2031))
