; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8424 () Bool)

(assert start!8424)

(declare-fun b!57026 () Bool)

(declare-fun b_free!1945 () Bool)

(declare-fun b_next!1945 () Bool)

(assert (=> b!57026 (= b_free!1945 (not b_next!1945))))

(declare-fun tp!7941 () Bool)

(declare-fun b_and!3437 () Bool)

(assert (=> b!57026 (= tp!7941 b_and!3437)))

(declare-fun b!57016 () Bool)

(declare-fun b_free!1947 () Bool)

(declare-fun b_next!1947 () Bool)

(assert (=> b!57016 (= b_free!1947 (not b_next!1947))))

(declare-fun tp!7940 () Bool)

(declare-fun b_and!3439 () Bool)

(assert (=> b!57016 (= tp!7940 b_and!3439)))

(declare-fun b!57012 () Bool)

(declare-fun e!37580 () Bool)

(declare-datatypes ((V!2833 0))(
  ( (V!2834 (val!1239 Int)) )
))
(declare-datatypes ((array!3683 0))(
  ( (array!3684 (arr!1762 (Array (_ BitVec 32) (_ BitVec 64))) (size!1992 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!851 0))(
  ( (ValueCellFull!851 (v!2360 V!2833)) (EmptyCell!851) )
))
(declare-datatypes ((array!3685 0))(
  ( (array!3686 (arr!1763 (Array (_ BitVec 32) ValueCell!851)) (size!1993 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!610 0))(
  ( (LongMapFixedSize!611 (defaultEntry!2021 Int) (mask!5894 (_ BitVec 32)) (extraKeys!1912 (_ BitVec 32)) (zeroValue!1939 V!2833) (minValue!1939 V!2833) (_size!354 (_ BitVec 32)) (_keys!3640 array!3683) (_values!2004 array!3685) (_vacant!354 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!418 0))(
  ( (Cell!419 (v!2361 LongMapFixedSize!610)) )
))
(declare-datatypes ((LongMap!418 0))(
  ( (LongMap!419 (underlying!220 Cell!418)) )
))
(declare-fun thiss!992 () LongMap!418)

(assert (=> b!57012 (= e!37580 (not (= (size!1993 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5894 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun mapIsEmpty!2841 () Bool)

(declare-fun mapRes!2842 () Bool)

(assert (=> mapIsEmpty!2841 mapRes!2842))

(declare-fun mapNonEmpty!2841 () Bool)

(declare-fun mapRes!2841 () Bool)

(declare-fun tp!7939 () Bool)

(declare-fun e!37579 () Bool)

(assert (=> mapNonEmpty!2841 (= mapRes!2841 (and tp!7939 e!37579))))

(declare-fun mapRest!2842 () (Array (_ BitVec 32) ValueCell!851))

(declare-fun newMap!16 () LongMapFixedSize!610)

(declare-fun mapValue!2842 () ValueCell!851)

(declare-fun mapKey!2841 () (_ BitVec 32))

(assert (=> mapNonEmpty!2841 (= (arr!1763 (_values!2004 newMap!16)) (store mapRest!2842 mapKey!2841 mapValue!2842))))

(declare-fun mapNonEmpty!2842 () Bool)

(declare-fun tp!7942 () Bool)

(declare-fun e!37584 () Bool)

(assert (=> mapNonEmpty!2842 (= mapRes!2842 (and tp!7942 e!37584))))

(declare-fun mapKey!2842 () (_ BitVec 32))

(declare-fun mapRest!2841 () (Array (_ BitVec 32) ValueCell!851))

(declare-fun mapValue!2841 () ValueCell!851)

(assert (=> mapNonEmpty!2842 (= (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (store mapRest!2841 mapKey!2842 mapValue!2841))))

(declare-fun b!57013 () Bool)

(declare-fun e!37572 () Bool)

(declare-fun e!37587 () Bool)

(assert (=> b!57013 (= e!37572 (and e!37587 mapRes!2841))))

(declare-fun condMapEmpty!2841 () Bool)

(declare-fun mapDefault!2841 () ValueCell!851)

(assert (=> b!57013 (= condMapEmpty!2841 (= (arr!1763 (_values!2004 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!851)) mapDefault!2841)))))

(declare-fun b!57014 () Bool)

(declare-datatypes ((Unit!1484 0))(
  ( (Unit!1485) )
))
(declare-fun e!37573 () Unit!1484)

(declare-fun Unit!1486 () Unit!1484)

(assert (=> b!57014 (= e!37573 Unit!1486)))

(declare-fun lt!22555 () Unit!1484)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!25 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 64) (_ BitVec 32) Int) Unit!1484)

(assert (=> b!57014 (= lt!22555 (lemmaListMapContainsThenArrayContainsFrom!25 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!57014 (arrayContainsKey!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22553 () Unit!1484)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3683 (_ BitVec 32) (_ BitVec 32)) Unit!1484)

(assert (=> b!57014 (= lt!22553 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1430 0))(
  ( (Nil!1427) (Cons!1426 (h!2006 (_ BitVec 64)) (t!4743 List!1430)) )
))
(declare-fun arrayNoDuplicates!0 (array!3683 (_ BitVec 32) List!1430) Bool)

(assert (=> b!57014 (arrayNoDuplicates!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) from!355 Nil!1427)))

(declare-fun lt!22550 () Unit!1484)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3683 (_ BitVec 32) (_ BitVec 64) List!1430) Unit!1484)

(assert (=> b!57014 (= lt!22550 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427)))))

(assert (=> b!57014 false))

(declare-fun b!57015 () Bool)

(declare-fun e!37575 () Bool)

(declare-fun e!37577 () Bool)

(assert (=> b!57015 (= e!37575 e!37577)))

(declare-fun b!57017 () Bool)

(declare-fun Unit!1487 () Unit!1484)

(assert (=> b!57017 (= e!37573 Unit!1487)))

(declare-fun mapIsEmpty!2842 () Bool)

(assert (=> mapIsEmpty!2842 mapRes!2841))

(declare-fun b!57018 () Bool)

(declare-fun e!37574 () Bool)

(assert (=> b!57018 (= e!37577 e!37574)))

(declare-fun b!57019 () Bool)

(declare-fun res!31975 () Bool)

(assert (=> b!57019 (=> (not res!31975) (not e!37580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!57019 (= res!31975 (validMask!0 (mask!5894 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun b!57020 () Bool)

(declare-fun e!37585 () Bool)

(declare-fun e!37586 () Bool)

(assert (=> b!57020 (= e!37585 (and e!37586 mapRes!2842))))

(declare-fun condMapEmpty!2842 () Bool)

(declare-fun mapDefault!2842 () ValueCell!851)

(assert (=> b!57020 (= condMapEmpty!2842 (= (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!851)) mapDefault!2842)))))

(declare-fun b!57021 () Bool)

(declare-fun tp_is_empty!2389 () Bool)

(assert (=> b!57021 (= e!37586 tp_is_empty!2389)))

(declare-fun b!57022 () Bool)

(declare-fun res!31971 () Bool)

(declare-fun e!37578 () Bool)

(assert (=> b!57022 (=> (not res!31971) (not e!37578))))

(declare-fun valid!250 (LongMapFixedSize!610) Bool)

(assert (=> b!57022 (= res!31971 (valid!250 newMap!16))))

(declare-fun b!57023 () Bool)

(assert (=> b!57023 (= e!37579 tp_is_empty!2389)))

(declare-fun b!57024 () Bool)

(declare-fun e!37576 () Bool)

(assert (=> b!57024 (= e!37576 e!37580)))

(declare-fun res!31973 () Bool)

(assert (=> b!57024 (=> (not res!31973) (not e!37580))))

(declare-datatypes ((tuple2!2022 0))(
  ( (tuple2!2023 (_1!1022 Bool) (_2!1022 LongMapFixedSize!610)) )
))
(declare-fun lt!22554 () tuple2!2022)

(assert (=> b!57024 (= res!31973 (and (_1!1022 lt!22554) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!22552 () Unit!1484)

(assert (=> b!57024 (= lt!22552 e!37573)))

(declare-fun c!7010 () Bool)

(declare-datatypes ((tuple2!2024 0))(
  ( (tuple2!2025 (_1!1023 (_ BitVec 64)) (_2!1023 V!2833)) )
))
(declare-datatypes ((List!1431 0))(
  ( (Nil!1428) (Cons!1427 (h!2007 tuple2!2024) (t!4744 List!1431)) )
))
(declare-datatypes ((ListLongMap!1349 0))(
  ( (ListLongMap!1350 (toList!690 List!1431)) )
))
(declare-fun lt!22556 () ListLongMap!1349)

(declare-fun contains!677 (ListLongMap!1349 (_ BitVec 64)) Bool)

(assert (=> b!57024 (= c!7010 (contains!677 lt!22556 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun update!81 (LongMapFixedSize!610 (_ BitVec 64) V!2833) tuple2!2022)

(declare-fun get!1065 (ValueCell!851 V!2833) V!2833)

(declare-fun dynLambda!305 (Int (_ BitVec 64)) V!2833)

(assert (=> b!57024 (= lt!22554 (update!81 newMap!16 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!57025 () Bool)

(assert (=> b!57025 (= e!37587 tp_is_empty!2389)))

(declare-fun array_inv!1093 (array!3683) Bool)

(declare-fun array_inv!1094 (array!3685) Bool)

(assert (=> b!57026 (= e!37574 (and tp!7941 tp_is_empty!2389 (array_inv!1093 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (array_inv!1094 (_values!2004 (v!2361 (underlying!220 thiss!992)))) e!37585))))

(declare-fun b!57027 () Bool)

(assert (=> b!57027 (= e!37584 tp_is_empty!2389)))

(declare-fun b!57028 () Bool)

(declare-fun res!31976 () Bool)

(assert (=> b!57028 (=> (not res!31976) (not e!37578))))

(assert (=> b!57028 (= res!31976 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!57029 () Bool)

(assert (=> b!57029 (= e!37578 e!37576)))

(declare-fun res!31977 () Bool)

(assert (=> b!57029 (=> (not res!31977) (not e!37576))))

(declare-fun lt!22551 () ListLongMap!1349)

(assert (=> b!57029 (= res!31977 (and (= lt!22551 lt!22556) (not (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1099 (LongMapFixedSize!610) ListLongMap!1349)

(assert (=> b!57029 (= lt!22556 (map!1099 newMap!16))))

(declare-fun getCurrentListMap!387 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 32) Int) ListLongMap!1349)

(assert (=> b!57029 (= lt!22551 (getCurrentListMap!387 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun b!57030 () Bool)

(declare-fun res!31974 () Bool)

(assert (=> b!57030 (=> (not res!31974) (not e!37578))))

(assert (=> b!57030 (= res!31974 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5894 newMap!16)) (_size!354 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun res!31972 () Bool)

(assert (=> start!8424 (=> (not res!31972) (not e!37578))))

(declare-fun valid!251 (LongMap!418) Bool)

(assert (=> start!8424 (= res!31972 (valid!251 thiss!992))))

(assert (=> start!8424 e!37578))

(assert (=> start!8424 e!37575))

(assert (=> start!8424 true))

(declare-fun e!37581 () Bool)

(assert (=> start!8424 e!37581))

(assert (=> b!57016 (= e!37581 (and tp!7940 tp_is_empty!2389 (array_inv!1093 (_keys!3640 newMap!16)) (array_inv!1094 (_values!2004 newMap!16)) e!37572))))

(assert (= (and start!8424 res!31972) b!57028))

(assert (= (and b!57028 res!31976) b!57022))

(assert (= (and b!57022 res!31971) b!57030))

(assert (= (and b!57030 res!31974) b!57029))

(assert (= (and b!57029 res!31977) b!57024))

(assert (= (and b!57024 c!7010) b!57014))

(assert (= (and b!57024 (not c!7010)) b!57017))

(assert (= (and b!57024 res!31973) b!57019))

(assert (= (and b!57019 res!31975) b!57012))

(assert (= (and b!57020 condMapEmpty!2842) mapIsEmpty!2841))

(assert (= (and b!57020 (not condMapEmpty!2842)) mapNonEmpty!2842))

(get-info :version)

(assert (= (and mapNonEmpty!2842 ((_ is ValueCellFull!851) mapValue!2841)) b!57027))

(assert (= (and b!57020 ((_ is ValueCellFull!851) mapDefault!2842)) b!57021))

(assert (= b!57026 b!57020))

(assert (= b!57018 b!57026))

(assert (= b!57015 b!57018))

(assert (= start!8424 b!57015))

(assert (= (and b!57013 condMapEmpty!2841) mapIsEmpty!2842))

(assert (= (and b!57013 (not condMapEmpty!2841)) mapNonEmpty!2841))

(assert (= (and mapNonEmpty!2841 ((_ is ValueCellFull!851) mapValue!2842)) b!57023))

(assert (= (and b!57013 ((_ is ValueCellFull!851) mapDefault!2841)) b!57025))

(assert (= b!57016 b!57013))

(assert (= start!8424 b!57016))

(declare-fun b_lambda!2493 () Bool)

(assert (=> (not b_lambda!2493) (not b!57024)))

(declare-fun t!4740 () Bool)

(declare-fun tb!1289 () Bool)

(assert (=> (and b!57026 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))) t!4740) tb!1289))

(declare-fun result!2333 () Bool)

(assert (=> tb!1289 (= result!2333 tp_is_empty!2389)))

(assert (=> b!57024 t!4740))

(declare-fun b_and!3441 () Bool)

(assert (= b_and!3437 (and (=> t!4740 result!2333) b_and!3441)))

(declare-fun t!4742 () Bool)

(declare-fun tb!1291 () Bool)

(assert (=> (and b!57016 (= (defaultEntry!2021 newMap!16) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))) t!4742) tb!1291))

(declare-fun result!2337 () Bool)

(assert (= result!2337 result!2333))

(assert (=> b!57024 t!4742))

(declare-fun b_and!3443 () Bool)

(assert (= b_and!3439 (and (=> t!4742 result!2337) b_and!3443)))

(declare-fun m!47907 () Bool)

(assert (=> b!57022 m!47907))

(declare-fun m!47909 () Bool)

(assert (=> b!57014 m!47909))

(declare-fun m!47911 () Bool)

(assert (=> b!57014 m!47911))

(declare-fun m!47913 () Bool)

(assert (=> b!57014 m!47913))

(declare-fun m!47915 () Bool)

(assert (=> b!57014 m!47915))

(assert (=> b!57014 m!47913))

(assert (=> b!57014 m!47913))

(declare-fun m!47917 () Bool)

(assert (=> b!57014 m!47917))

(assert (=> b!57014 m!47913))

(declare-fun m!47919 () Bool)

(assert (=> b!57014 m!47919))

(declare-fun m!47921 () Bool)

(assert (=> b!57026 m!47921))

(declare-fun m!47923 () Bool)

(assert (=> b!57026 m!47923))

(declare-fun m!47925 () Bool)

(assert (=> mapNonEmpty!2842 m!47925))

(declare-fun m!47927 () Bool)

(assert (=> b!57019 m!47927))

(declare-fun m!47929 () Bool)

(assert (=> b!57016 m!47929))

(declare-fun m!47931 () Bool)

(assert (=> b!57016 m!47931))

(declare-fun m!47933 () Bool)

(assert (=> mapNonEmpty!2841 m!47933))

(declare-fun m!47935 () Bool)

(assert (=> b!57024 m!47935))

(declare-fun m!47937 () Bool)

(assert (=> b!57024 m!47937))

(declare-fun m!47939 () Bool)

(assert (=> b!57024 m!47939))

(assert (=> b!57024 m!47913))

(declare-fun m!47941 () Bool)

(assert (=> b!57024 m!47941))

(assert (=> b!57024 m!47913))

(assert (=> b!57024 m!47937))

(assert (=> b!57024 m!47913))

(assert (=> b!57024 m!47939))

(declare-fun m!47943 () Bool)

(assert (=> b!57024 m!47943))

(assert (=> b!57024 m!47935))

(declare-fun m!47945 () Bool)

(assert (=> start!8424 m!47945))

(assert (=> b!57029 m!47913))

(declare-fun m!47947 () Bool)

(assert (=> b!57029 m!47947))

(declare-fun m!47949 () Bool)

(assert (=> b!57029 m!47949))

(check-sat (not mapNonEmpty!2841) (not b!57024) tp_is_empty!2389 (not b!57016) (not b_next!1947) (not b!57019) (not b!57026) (not b!57022) (not b!57029) (not b!57014) (not start!8424) (not mapNonEmpty!2842) b_and!3441 (not b_lambda!2493) (not b_next!1945) b_and!3443)
(check-sat b_and!3441 b_and!3443 (not b_next!1945) (not b_next!1947))
(get-model)

(declare-fun b_lambda!2499 () Bool)

(assert (= b_lambda!2493 (or (and b!57026 b_free!1945) (and b!57016 b_free!1947 (= (defaultEntry!2021 newMap!16) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))))) b_lambda!2499)))

(check-sat (not mapNonEmpty!2841) tp_is_empty!2389 (not b!57016) b_and!3441 (not b_next!1947) (not b!57019) (not b!57026) (not b!57022) (not b!57029) (not b!57014) (not start!8424) (not mapNonEmpty!2842) (not b_lambda!2499) (not b!57024) (not b_next!1945) b_and!3443)
(check-sat b_and!3441 b_and!3443 (not b_next!1945) (not b_next!1947))
(get-model)

(declare-fun d!10505 () Bool)

(declare-fun res!32026 () Bool)

(declare-fun e!37686 () Bool)

(assert (=> d!10505 (=> (not res!32026) (not e!37686))))

(declare-fun simpleValid!41 (LongMapFixedSize!610) Bool)

(assert (=> d!10505 (= res!32026 (simpleValid!41 newMap!16))))

(assert (=> d!10505 (= (valid!250 newMap!16) e!37686)))

(declare-fun b!57157 () Bool)

(declare-fun res!32027 () Bool)

(assert (=> b!57157 (=> (not res!32027) (not e!37686))))

(declare-fun arrayCountValidKeys!0 (array!3683 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!57157 (= res!32027 (= (arrayCountValidKeys!0 (_keys!3640 newMap!16) #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) (_size!354 newMap!16)))))

(declare-fun b!57158 () Bool)

(declare-fun res!32028 () Bool)

(assert (=> b!57158 (=> (not res!32028) (not e!37686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3683 (_ BitVec 32)) Bool)

(assert (=> b!57158 (= res!32028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(declare-fun b!57159 () Bool)

(assert (=> b!57159 (= e!37686 (arrayNoDuplicates!0 (_keys!3640 newMap!16) #b00000000000000000000000000000000 Nil!1427))))

(assert (= (and d!10505 res!32026) b!57157))

(assert (= (and b!57157 res!32027) b!57158))

(assert (= (and b!57158 res!32028) b!57159))

(declare-fun m!48039 () Bool)

(assert (=> d!10505 m!48039))

(declare-fun m!48041 () Bool)

(assert (=> b!57157 m!48041))

(declare-fun m!48043 () Bool)

(assert (=> b!57158 m!48043))

(declare-fun m!48045 () Bool)

(assert (=> b!57159 m!48045))

(assert (=> b!57022 d!10505))

(declare-fun d!10507 () Bool)

(assert (=> d!10507 (= (validMask!0 (mask!5894 (v!2361 (underlying!220 thiss!992)))) (and (or (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000001111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000011111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000001111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000011111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000001111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000011111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000001111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000011111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000001111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000011111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000111111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000001111111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000011111111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000111111111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000001111111111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000011111111111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000111111111111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000001111111111111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000011111111111111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000111111111111111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00001111111111111111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00011111111111111111111111111111) (= (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!57019 d!10507))

(declare-fun d!10509 () Bool)

(declare-fun e!37691 () Bool)

(assert (=> d!10509 e!37691))

(declare-fun res!32031 () Bool)

(assert (=> d!10509 (=> res!32031 e!37691)))

(declare-fun lt!22607 () Bool)

(assert (=> d!10509 (= res!32031 (not lt!22607))))

(declare-fun lt!22610 () Bool)

(assert (=> d!10509 (= lt!22607 lt!22610)))

(declare-fun lt!22609 () Unit!1484)

(declare-fun e!37692 () Unit!1484)

(assert (=> d!10509 (= lt!22609 e!37692)))

(declare-fun c!7019 () Bool)

(assert (=> d!10509 (= c!7019 lt!22610)))

(declare-fun containsKey!125 (List!1431 (_ BitVec 64)) Bool)

(assert (=> d!10509 (= lt!22610 (containsKey!125 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!10509 (= (contains!677 lt!22556 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) lt!22607)))

(declare-fun b!57166 () Bool)

(declare-fun lt!22608 () Unit!1484)

(assert (=> b!57166 (= e!37692 lt!22608)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!74 (List!1431 (_ BitVec 64)) Unit!1484)

(assert (=> b!57166 (= lt!22608 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-datatypes ((Option!127 0))(
  ( (Some!126 (v!2367 V!2833)) (None!125) )
))
(declare-fun isDefined!75 (Option!127) Bool)

(declare-fun getValueByKey!121 (List!1431 (_ BitVec 64)) Option!127)

(assert (=> b!57166 (isDefined!75 (getValueByKey!121 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!57167 () Bool)

(declare-fun Unit!1495 () Unit!1484)

(assert (=> b!57167 (= e!37692 Unit!1495)))

(declare-fun b!57168 () Bool)

(assert (=> b!57168 (= e!37691 (isDefined!75 (getValueByKey!121 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (= (and d!10509 c!7019) b!57166))

(assert (= (and d!10509 (not c!7019)) b!57167))

(assert (= (and d!10509 (not res!32031)) b!57168))

(assert (=> d!10509 m!47913))

(declare-fun m!48047 () Bool)

(assert (=> d!10509 m!48047))

(assert (=> b!57166 m!47913))

(declare-fun m!48049 () Bool)

(assert (=> b!57166 m!48049))

(assert (=> b!57166 m!47913))

(declare-fun m!48051 () Bool)

(assert (=> b!57166 m!48051))

(assert (=> b!57166 m!48051))

(declare-fun m!48053 () Bool)

(assert (=> b!57166 m!48053))

(assert (=> b!57168 m!47913))

(assert (=> b!57168 m!48051))

(assert (=> b!57168 m!48051))

(assert (=> b!57168 m!48053))

(assert (=> b!57024 d!10509))

(declare-fun b!57249 () Bool)

(declare-fun e!37750 () Bool)

(declare-fun call!4114 () Bool)

(assert (=> b!57249 (= e!37750 (not call!4114))))

(declare-fun b!57250 () Bool)

(declare-fun c!7055 () Bool)

(declare-datatypes ((SeekEntryResult!229 0))(
  ( (MissingZero!229 (index!3038 (_ BitVec 32))) (Found!229 (index!3039 (_ BitVec 32))) (Intermediate!229 (undefined!1041 Bool) (index!3040 (_ BitVec 32)) (x!9860 (_ BitVec 32))) (Undefined!229) (MissingVacant!229 (index!3041 (_ BitVec 32))) )
))
(declare-fun lt!22678 () SeekEntryResult!229)

(assert (=> b!57250 (= c!7055 ((_ is MissingVacant!229) lt!22678))))

(declare-fun e!37739 () Bool)

(declare-fun e!37752 () Bool)

(assert (=> b!57250 (= e!37739 e!37752)))

(declare-fun b!57251 () Bool)

(declare-fun res!32064 () Bool)

(declare-fun call!4121 () Bool)

(assert (=> b!57251 (= res!32064 call!4121)))

(declare-fun e!37747 () Bool)

(assert (=> b!57251 (=> (not res!32064) (not e!37747))))

(declare-fun call!4137 () Unit!1484)

(declare-fun bm!4111 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!14 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 64) Int) Unit!1484)

(assert (=> bm!4111 (= call!4137 (lemmaInListMapThenSeekEntryOrOpenFindsIt!14 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (defaultEntry!2021 newMap!16)))))

(declare-fun bm!4112 () Bool)

(declare-fun call!4119 () Bool)

(declare-fun call!4125 () Bool)

(assert (=> bm!4112 (= call!4119 call!4125)))

(declare-fun c!7052 () Bool)

(declare-fun lt!22686 () SeekEntryResult!229)

(declare-fun lt!22675 () SeekEntryResult!229)

(declare-fun lt!22672 () SeekEntryResult!229)

(declare-fun bm!4113 () Bool)

(declare-fun c!7051 () Bool)

(declare-fun c!7058 () Bool)

(declare-fun c!7056 () Bool)

(declare-fun c!7053 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4113 (= call!4125 (inRange!0 (ite c!7052 (ite c!7053 (index!3039 lt!22686) (ite c!7058 (index!3038 lt!22675) (index!3041 lt!22675))) (ite c!7051 (index!3039 lt!22672) (ite c!7056 (index!3038 lt!22678) (index!3041 lt!22678)))) (mask!5894 newMap!16)))))

(declare-fun b!57252 () Bool)

(declare-fun e!37753 () Bool)

(declare-fun call!4127 () ListLongMap!1349)

(declare-fun call!4131 () ListLongMap!1349)

(assert (=> b!57252 (= e!37753 (= call!4127 call!4131))))

(declare-fun b!57253 () Bool)

(declare-fun res!32062 () Bool)

(assert (=> b!57253 (= res!32062 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3041 lt!22678)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!57253 (=> (not res!32062) (not e!37750))))

(declare-fun bm!4114 () Bool)

(declare-fun call!4132 () SeekEntryResult!229)

(declare-fun call!4120 () SeekEntryResult!229)

(assert (=> bm!4114 (= call!4132 call!4120)))

(declare-fun b!57254 () Bool)

(declare-fun res!32069 () Bool)

(assert (=> b!57254 (= res!32069 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3041 lt!22675)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37751 () Bool)

(assert (=> b!57254 (=> (not res!32069) (not e!37751))))

(declare-fun b!57255 () Bool)

(declare-fun call!4118 () Bool)

(assert (=> b!57255 (= e!37751 (not call!4118))))

(declare-fun b!57256 () Bool)

(declare-fun lt!22677 () Unit!1484)

(declare-fun lt!22682 () Unit!1484)

(assert (=> b!57256 (= lt!22677 lt!22682)))

(declare-fun call!4116 () ListLongMap!1349)

(declare-fun call!4133 () ListLongMap!1349)

(assert (=> b!57256 (= call!4116 call!4133)))

(declare-fun lt!22673 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!14 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 V!2833 Int) Unit!1484)

(assert (=> b!57256 (= lt!22682 (lemmaChangeZeroKeyThenAddPairToListMap!14 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) lt!22673 (zeroValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1939 newMap!16) (defaultEntry!2021 newMap!16)))))

(assert (=> b!57256 (= lt!22673 (bvor (extraKeys!1912 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!37741 () tuple2!2022)

(assert (=> b!57256 (= e!37741 (tuple2!2023 true (LongMapFixedSize!611 (defaultEntry!2021 newMap!16) (mask!5894 newMap!16) (bvor (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1939 newMap!16) (_size!354 newMap!16) (_keys!3640 newMap!16) (_values!2004 newMap!16) (_vacant!354 newMap!16))))))

(declare-fun b!57257 () Bool)

(declare-fun e!37748 () Unit!1484)

(declare-fun Unit!1496 () Unit!1484)

(assert (=> b!57257 (= e!37748 Unit!1496)))

(declare-fun lt!22690 () Unit!1484)

(assert (=> b!57257 (= lt!22690 call!4137)))

(declare-fun call!4129 () SeekEntryResult!229)

(assert (=> b!57257 (= lt!22686 call!4129)))

(declare-fun res!32067 () Bool)

(assert (=> b!57257 (= res!32067 ((_ is Found!229) lt!22686))))

(assert (=> b!57257 (=> (not res!32067) (not e!37747))))

(assert (=> b!57257 e!37747))

(declare-fun lt!22671 () Unit!1484)

(assert (=> b!57257 (= lt!22671 lt!22690)))

(assert (=> b!57257 false))

(declare-fun b!57258 () Bool)

(declare-fun e!37742 () ListLongMap!1349)

(declare-fun lt!22683 () array!3685)

(assert (=> b!57258 (= e!37742 (getCurrentListMap!387 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun bm!4115 () Bool)

(assert (=> bm!4115 (= call!4131 (map!1099 newMap!16))))

(declare-fun b!57259 () Bool)

(declare-fun lt!22684 () Unit!1484)

(declare-fun lt!22685 () Unit!1484)

(assert (=> b!57259 (= lt!22684 lt!22685)))

(declare-fun call!4122 () Bool)

(assert (=> b!57259 call!4122))

(declare-fun lt!22666 () SeekEntryResult!229)

(declare-fun lemmaValidKeyInArrayIsInListMap!73 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 32) Int) Unit!1484)

(assert (=> b!57259 (= lt!22685 (lemmaValidKeyInArrayIsInListMap!73 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (index!3039 lt!22666) (defaultEntry!2021 newMap!16)))))

(assert (=> b!57259 (= lt!22683 (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))))))

(declare-fun lt!22668 () Unit!1484)

(declare-fun lt!22676 () Unit!1484)

(assert (=> b!57259 (= lt!22668 lt!22676)))

(declare-fun call!4135 () ListLongMap!1349)

(declare-fun call!4130 () ListLongMap!1349)

(assert (=> b!57259 (= call!4135 call!4130)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!14 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 32) (_ BitVec 64) V!2833 Int) Unit!1484)

(assert (=> b!57259 (= lt!22676 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!14 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (index!3039 lt!22666) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2021 newMap!16)))))

(declare-fun lt!22665 () Unit!1484)

(declare-fun e!37737 () Unit!1484)

(assert (=> b!57259 (= lt!22665 e!37737)))

(declare-fun call!4115 () ListLongMap!1349)

(assert (=> b!57259 (= c!7051 (contains!677 call!4115 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun e!37738 () tuple2!2022)

(assert (=> b!57259 (= e!37738 (tuple2!2023 true (LongMapFixedSize!611 (defaultEntry!2021 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (_size!354 newMap!16) (_keys!3640 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (_vacant!354 newMap!16))))))

(declare-fun b!57260 () Bool)

(declare-fun lt!22691 () Unit!1484)

(assert (=> b!57260 (= e!37737 lt!22691)))

(assert (=> b!57260 (= lt!22691 call!4137)))

(assert (=> b!57260 (= lt!22672 call!4132)))

(declare-fun res!32072 () Bool)

(assert (=> b!57260 (= res!32072 ((_ is Found!229) lt!22672))))

(declare-fun e!37745 () Bool)

(assert (=> b!57260 (=> (not res!32072) (not e!37745))))

(assert (=> b!57260 e!37745))

(declare-fun bm!4116 () Bool)

(assert (=> bm!4116 (= call!4121 call!4125)))

(declare-fun b!57261 () Bool)

(declare-fun e!37740 () tuple2!2022)

(declare-fun lt!22679 () tuple2!2022)

(assert (=> b!57261 (= e!37740 (tuple2!2023 (_1!1022 lt!22679) (_2!1022 lt!22679)))))

(declare-fun call!4136 () tuple2!2022)

(assert (=> b!57261 (= lt!22679 call!4136)))

(declare-fun bm!4117 () Bool)

(declare-fun call!4123 () Bool)

(assert (=> bm!4117 (= call!4118 call!4123)))

(declare-fun b!57262 () Bool)

(declare-fun e!37749 () tuple2!2022)

(declare-fun e!37746 () tuple2!2022)

(assert (=> b!57262 (= e!37749 e!37746)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3683 (_ BitVec 32)) SeekEntryResult!229)

(assert (=> b!57262 (= lt!22666 (seekEntryOrOpen!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(assert (=> b!57262 (= c!7052 ((_ is Undefined!229) lt!22666))))

(declare-fun b!57263 () Bool)

(assert (=> b!57263 (= e!37740 e!37738)))

(declare-fun c!7047 () Bool)

(assert (=> b!57263 (= c!7047 ((_ is MissingZero!229) lt!22666))))

(declare-fun bm!4118 () Bool)

(assert (=> bm!4118 (= call!4114 call!4123)))

(declare-fun bm!4119 () Bool)

(declare-fun call!4134 () ListLongMap!1349)

(assert (=> bm!4119 (= call!4130 call!4134)))

(declare-fun b!57264 () Bool)

(declare-fun c!7048 () Bool)

(assert (=> b!57264 (= c!7048 ((_ is MissingVacant!229) lt!22666))))

(assert (=> b!57264 (= e!37746 e!37740)))

(declare-fun bm!4120 () Bool)

(assert (=> bm!4120 (= call!4123 (arrayContainsKey!0 (_keys!3640 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!57265 () Bool)

(declare-fun e!37743 () Bool)

(assert (=> b!57265 (= e!37743 (not call!4114))))

(declare-fun bm!4121 () Bool)

(declare-fun call!4117 () Unit!1484)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!14 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 64) Int) Unit!1484)

(assert (=> bm!4121 (= call!4117 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!14 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (defaultEntry!2021 newMap!16)))))

(declare-fun bm!4122 () Bool)

(declare-fun lt!22687 () tuple2!2022)

(assert (=> bm!4122 (= call!4127 (map!1099 (_2!1022 lt!22687)))))

(declare-fun b!57266 () Bool)

(declare-fun e!37735 () Bool)

(assert (=> b!57266 (= e!37735 e!37751)))

(declare-fun res!32065 () Bool)

(declare-fun call!4126 () Bool)

(assert (=> b!57266 (= res!32065 call!4126)))

(assert (=> b!57266 (=> (not res!32065) (not e!37751))))

(declare-fun bm!4123 () Bool)

(declare-fun call!4128 () Bool)

(assert (=> bm!4123 (= call!4128 call!4119)))

(declare-fun b!57267 () Bool)

(assert (=> b!57267 (= e!37745 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22672)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!57268 () Bool)

(assert (=> b!57268 (= e!37742 call!4130)))

(declare-fun bm!4124 () Bool)

(declare-fun call!4124 () ListLongMap!1349)

(assert (=> bm!4124 (= call!4124 call!4115)))

(declare-fun b!57269 () Bool)

(declare-fun res!32068 () Bool)

(assert (=> b!57269 (= res!32068 call!4119)))

(assert (=> b!57269 (=> (not res!32068) (not e!37745))))

(declare-fun bm!4125 () Bool)

(declare-fun c!7049 () Bool)

(declare-fun c!7050 () Bool)

(declare-fun +!80 (ListLongMap!1349 tuple2!2024) ListLongMap!1349)

(assert (=> bm!4125 (= call!4135 (+!80 (ite c!7050 call!4124 call!4115) (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!57270 () Bool)

(declare-fun e!37755 () Bool)

(assert (=> b!57270 (= e!37755 e!37753)))

(declare-fun c!7057 () Bool)

(assert (=> b!57270 (= c!7057 (_1!1022 lt!22687))))

(declare-fun b!57271 () Bool)

(declare-fun res!32070 () Bool)

(declare-fun e!37754 () Bool)

(assert (=> b!57271 (=> (not res!32070) (not e!37754))))

(assert (=> b!57271 (= res!32070 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3038 lt!22675)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!4126 () Bool)

(declare-fun updateHelperNewKey!14 (LongMapFixedSize!610 (_ BitVec 64) V!2833 (_ BitVec 32)) tuple2!2022)

(assert (=> bm!4126 (= call!4136 (updateHelperNewKey!14 newMap!16 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666))))))

(declare-fun bm!4127 () Bool)

(assert (=> bm!4127 (= call!4115 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun b!57272 () Bool)

(assert (=> b!57272 (= e!37735 ((_ is Undefined!229) lt!22675))))

(declare-fun b!57273 () Bool)

(declare-fun e!37744 () Bool)

(assert (=> b!57273 (= e!37744 (= call!4127 (+!80 call!4131 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!57274 () Bool)

(declare-fun res!32060 () Bool)

(assert (=> b!57274 (=> (not res!32060) (not e!37743))))

(assert (=> b!57274 (= res!32060 call!4128)))

(assert (=> b!57274 (= e!37739 e!37743)))

(declare-fun d!10511 () Bool)

(assert (=> d!10511 e!37755))

(declare-fun res!32061 () Bool)

(assert (=> d!10511 (=> (not res!32061) (not e!37755))))

(assert (=> d!10511 (= res!32061 (valid!250 (_2!1022 lt!22687)))))

(assert (=> d!10511 (= lt!22687 e!37749)))

(assert (=> d!10511 (= c!7050 (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvneg (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (=> d!10511 (valid!250 newMap!16)))

(assert (=> d!10511 (= (update!81 newMap!16 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!22687)))

(declare-fun b!57275 () Bool)

(assert (=> b!57275 (= e!37749 e!37741)))

(assert (=> b!57275 (= c!7049 (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!22674 () (_ BitVec 32))

(declare-fun bm!4128 () Bool)

(assert (=> bm!4128 (= call!4134 (getCurrentListMap!387 (_keys!3640 newMap!16) (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))) (mask!5894 newMap!16) (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun b!57276 () Bool)

(assert (=> b!57276 (= e!37752 ((_ is Undefined!229) lt!22678))))

(declare-fun b!57277 () Bool)

(declare-fun res!32063 () Bool)

(assert (=> b!57277 (=> (not res!32063) (not e!37754))))

(assert (=> b!57277 (= res!32063 call!4126)))

(declare-fun e!37736 () Bool)

(assert (=> b!57277 (= e!37736 e!37754)))

(declare-fun bm!4129 () Bool)

(declare-fun c!7046 () Bool)

(assert (=> bm!4129 (= c!7046 c!7052)))

(assert (=> bm!4129 (= call!4122 (contains!677 e!37742 (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))))))

(declare-fun b!57278 () Bool)

(assert (=> b!57278 (= e!37747 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22686)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun bm!4130 () Bool)

(assert (=> bm!4130 (= call!4133 call!4134)))

(declare-fun b!57279 () Bool)

(declare-fun lt!22667 () Unit!1484)

(declare-fun lt!22670 () Unit!1484)

(assert (=> b!57279 (= lt!22667 lt!22670)))

(assert (=> b!57279 (= call!4116 call!4133)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!14 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 V!2833 Int) Unit!1484)

(assert (=> b!57279 (= lt!22670 (lemmaChangeLongMinValueKeyThenAddPairToListMap!14 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) lt!22674 (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2021 newMap!16)))))

(assert (=> b!57279 (= lt!22674 (bvor (extraKeys!1912 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!57279 (= e!37741 (tuple2!2023 true (LongMapFixedSize!611 (defaultEntry!2021 newMap!16) (mask!5894 newMap!16) (bvor (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) (zeroValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!354 newMap!16) (_keys!3640 newMap!16) (_values!2004 newMap!16) (_vacant!354 newMap!16))))))

(declare-fun bm!4131 () Bool)

(assert (=> bm!4131 (= call!4120 (seekEntryOrOpen!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(declare-fun b!57280 () Bool)

(declare-fun lt!22681 () Unit!1484)

(assert (=> b!57280 (= e!37748 lt!22681)))

(assert (=> b!57280 (= lt!22681 call!4117)))

(assert (=> b!57280 (= lt!22675 call!4129)))

(assert (=> b!57280 (= c!7058 ((_ is MissingZero!229) lt!22675))))

(assert (=> b!57280 e!37736))

(declare-fun b!57281 () Bool)

(declare-fun lt!22688 () Unit!1484)

(assert (=> b!57281 (= lt!22688 e!37748)))

(assert (=> b!57281 (= c!7053 call!4122)))

(assert (=> b!57281 (= e!37746 (tuple2!2023 false newMap!16))))

(declare-fun bm!4132 () Bool)

(assert (=> bm!4132 (= call!4126 call!4121)))

(declare-fun b!57282 () Bool)

(assert (=> b!57282 (= e!37754 (not call!4118))))

(declare-fun bm!4133 () Bool)

(assert (=> bm!4133 (= call!4116 call!4135)))

(declare-fun bm!4134 () Bool)

(assert (=> bm!4134 (= call!4129 call!4120)))

(declare-fun b!57283 () Bool)

(declare-fun Unit!1497 () Unit!1484)

(assert (=> b!57283 (= e!37737 Unit!1497)))

(declare-fun lt!22680 () Unit!1484)

(assert (=> b!57283 (= lt!22680 call!4117)))

(assert (=> b!57283 (= lt!22678 call!4132)))

(assert (=> b!57283 (= c!7056 ((_ is MissingZero!229) lt!22678))))

(assert (=> b!57283 e!37739))

(declare-fun lt!22689 () Unit!1484)

(assert (=> b!57283 (= lt!22689 lt!22680)))

(assert (=> b!57283 false))

(declare-fun b!57284 () Bool)

(declare-fun res!32071 () Bool)

(assert (=> b!57284 (=> (not res!32071) (not e!37743))))

(assert (=> b!57284 (= res!32071 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3038 lt!22678)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57285 () Bool)

(assert (=> b!57285 (= e!37753 e!37744)))

(declare-fun res!32073 () Bool)

(assert (=> b!57285 (= res!32073 (contains!677 call!4127 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> b!57285 (=> (not res!32073) (not e!37744))))

(declare-fun b!57286 () Bool)

(declare-fun lt!22669 () tuple2!2022)

(assert (=> b!57286 (= lt!22669 call!4136)))

(assert (=> b!57286 (= e!37738 (tuple2!2023 (_1!1022 lt!22669) (_2!1022 lt!22669)))))

(declare-fun b!57287 () Bool)

(assert (=> b!57287 (= e!37752 e!37750)))

(declare-fun res!32066 () Bool)

(assert (=> b!57287 (= res!32066 call!4128)))

(assert (=> b!57287 (=> (not res!32066) (not e!37750))))

(declare-fun b!57288 () Bool)

(declare-fun c!7054 () Bool)

(assert (=> b!57288 (= c!7054 ((_ is MissingVacant!229) lt!22675))))

(assert (=> b!57288 (= e!37736 e!37735)))

(assert (= (and d!10511 c!7050) b!57275))

(assert (= (and d!10511 (not c!7050)) b!57262))

(assert (= (and b!57275 c!7049) b!57256))

(assert (= (and b!57275 (not c!7049)) b!57279))

(assert (= (or b!57256 b!57279) bm!4130))

(assert (= (or b!57256 b!57279) bm!4124))

(assert (= (or b!57256 b!57279) bm!4133))

(assert (= (and b!57262 c!7052) b!57281))

(assert (= (and b!57262 (not c!7052)) b!57264))

(assert (= (and b!57281 c!7053) b!57257))

(assert (= (and b!57281 (not c!7053)) b!57280))

(assert (= (and b!57257 res!32067) b!57251))

(assert (= (and b!57251 res!32064) b!57278))

(assert (= (and b!57280 c!7058) b!57277))

(assert (= (and b!57280 (not c!7058)) b!57288))

(assert (= (and b!57277 res!32063) b!57271))

(assert (= (and b!57271 res!32070) b!57282))

(assert (= (and b!57288 c!7054) b!57266))

(assert (= (and b!57288 (not c!7054)) b!57272))

(assert (= (and b!57266 res!32065) b!57254))

(assert (= (and b!57254 res!32069) b!57255))

(assert (= (or b!57277 b!57266) bm!4132))

(assert (= (or b!57282 b!57255) bm!4117))

(assert (= (or b!57251 bm!4132) bm!4116))

(assert (= (or b!57257 b!57280) bm!4134))

(assert (= (and b!57264 c!7048) b!57261))

(assert (= (and b!57264 (not c!7048)) b!57263))

(assert (= (and b!57263 c!7047) b!57286))

(assert (= (and b!57263 (not c!7047)) b!57259))

(assert (= (and b!57259 c!7051) b!57260))

(assert (= (and b!57259 (not c!7051)) b!57283))

(assert (= (and b!57260 res!32072) b!57269))

(assert (= (and b!57269 res!32068) b!57267))

(assert (= (and b!57283 c!7056) b!57274))

(assert (= (and b!57283 (not c!7056)) b!57250))

(assert (= (and b!57274 res!32060) b!57284))

(assert (= (and b!57284 res!32071) b!57265))

(assert (= (and b!57250 c!7055) b!57287))

(assert (= (and b!57250 (not c!7055)) b!57276))

(assert (= (and b!57287 res!32066) b!57253))

(assert (= (and b!57253 res!32062) b!57249))

(assert (= (or b!57274 b!57287) bm!4123))

(assert (= (or b!57265 b!57249) bm!4118))

(assert (= (or b!57269 bm!4123) bm!4112))

(assert (= (or b!57260 b!57283) bm!4114))

(assert (= (or b!57261 b!57286) bm!4126))

(assert (= (or b!57257 b!57260) bm!4111))

(assert (= (or b!57281 b!57259) bm!4119))

(assert (= (or b!57280 b!57283) bm!4121))

(assert (= (or bm!4117 bm!4118) bm!4120))

(assert (= (or bm!4134 bm!4114) bm!4131))

(assert (= (or bm!4116 bm!4112) bm!4113))

(assert (= (or b!57281 b!57259) bm!4129))

(assert (= (and bm!4129 c!7046) b!57268))

(assert (= (and bm!4129 (not c!7046)) b!57258))

(assert (= (or bm!4130 bm!4119) bm!4128))

(assert (= (or bm!4124 b!57259) bm!4127))

(assert (= (or bm!4133 b!57259) bm!4125))

(assert (= (and d!10511 res!32061) b!57270))

(assert (= (and b!57270 c!7057) b!57285))

(assert (= (and b!57270 (not c!7057)) b!57252))

(assert (= (and b!57285 res!32073) b!57273))

(assert (= (or b!57273 b!57252) bm!4115))

(assert (= (or b!57285 b!57273 b!57252) bm!4122))

(declare-fun m!48055 () Bool)

(assert (=> b!57267 m!48055))

(declare-fun m!48057 () Bool)

(assert (=> b!57278 m!48057))

(declare-fun m!48059 () Bool)

(assert (=> b!57284 m!48059))

(assert (=> bm!4111 m!47913))

(declare-fun m!48061 () Bool)

(assert (=> bm!4111 m!48061))

(declare-fun m!48063 () Bool)

(assert (=> b!57258 m!48063))

(declare-fun m!48065 () Bool)

(assert (=> bm!4125 m!48065))

(assert (=> bm!4131 m!47913))

(declare-fun m!48067 () Bool)

(assert (=> bm!4131 m!48067))

(declare-fun m!48069 () Bool)

(assert (=> b!57259 m!48069))

(declare-fun m!48071 () Bool)

(assert (=> b!57259 m!48071))

(assert (=> b!57259 m!47913))

(assert (=> b!57259 m!47939))

(declare-fun m!48073 () Bool)

(assert (=> b!57259 m!48073))

(assert (=> b!57259 m!47913))

(declare-fun m!48075 () Bool)

(assert (=> b!57259 m!48075))

(declare-fun m!48077 () Bool)

(assert (=> b!57254 m!48077))

(declare-fun m!48079 () Bool)

(assert (=> b!57271 m!48079))

(assert (=> bm!4128 m!48071))

(declare-fun m!48081 () Bool)

(assert (=> bm!4128 m!48081))

(declare-fun m!48083 () Bool)

(assert (=> bm!4113 m!48083))

(declare-fun m!48085 () Bool)

(assert (=> bm!4122 m!48085))

(assert (=> bm!4121 m!47913))

(declare-fun m!48087 () Bool)

(assert (=> bm!4121 m!48087))

(declare-fun m!48089 () Bool)

(assert (=> b!57273 m!48089))

(assert (=> b!57279 m!47939))

(declare-fun m!48091 () Bool)

(assert (=> b!57279 m!48091))

(declare-fun m!48093 () Bool)

(assert (=> b!57253 m!48093))

(declare-fun m!48095 () Bool)

(assert (=> bm!4129 m!48095))

(declare-fun m!48097 () Bool)

(assert (=> bm!4129 m!48097))

(assert (=> bm!4115 m!47947))

(assert (=> b!57256 m!47939))

(declare-fun m!48099 () Bool)

(assert (=> b!57256 m!48099))

(declare-fun m!48101 () Bool)

(assert (=> bm!4127 m!48101))

(assert (=> b!57285 m!47913))

(declare-fun m!48103 () Bool)

(assert (=> b!57285 m!48103))

(assert (=> bm!4126 m!47913))

(assert (=> bm!4126 m!47939))

(declare-fun m!48105 () Bool)

(assert (=> bm!4126 m!48105))

(declare-fun m!48107 () Bool)

(assert (=> d!10511 m!48107))

(assert (=> d!10511 m!47907))

(assert (=> b!57262 m!47913))

(assert (=> b!57262 m!48067))

(assert (=> bm!4120 m!47913))

(declare-fun m!48109 () Bool)

(assert (=> bm!4120 m!48109))

(assert (=> b!57024 d!10511))

(declare-fun d!10513 () Bool)

(declare-fun c!7061 () Bool)

(assert (=> d!10513 (= c!7061 ((_ is ValueCellFull!851) (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun e!37758 () V!2833)

(assert (=> d!10513 (= (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!37758)))

(declare-fun b!57293 () Bool)

(declare-fun get!1068 (ValueCell!851 V!2833) V!2833)

(assert (=> b!57293 (= e!37758 (get!1068 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!57294 () Bool)

(declare-fun get!1069 (ValueCell!851 V!2833) V!2833)

(assert (=> b!57294 (= e!37758 (get!1069 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10513 c!7061) b!57293))

(assert (= (and d!10513 (not c!7061)) b!57294))

(assert (=> b!57293 m!47935))

(assert (=> b!57293 m!47937))

(declare-fun m!48111 () Bool)

(assert (=> b!57293 m!48111))

(assert (=> b!57294 m!47935))

(assert (=> b!57294 m!47937))

(declare-fun m!48113 () Bool)

(assert (=> b!57294 m!48113))

(assert (=> b!57024 d!10513))

(declare-fun d!10515 () Bool)

(assert (=> d!10515 (not (arrayContainsKey!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22694 () Unit!1484)

(declare-fun choose!68 (array!3683 (_ BitVec 32) (_ BitVec 64) List!1430) Unit!1484)

(assert (=> d!10515 (= lt!22694 (choose!68 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427)))))

(assert (=> d!10515 (bvslt (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!10515 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427)) lt!22694)))

(declare-fun bs!2475 () Bool)

(assert (= bs!2475 d!10515))

(assert (=> bs!2475 m!47913))

(assert (=> bs!2475 m!47917))

(assert (=> bs!2475 m!47913))

(declare-fun m!48115 () Bool)

(assert (=> bs!2475 m!48115))

(assert (=> b!57014 d!10515))

(declare-fun d!10517 () Bool)

(assert (=> d!10517 (arrayNoDuplicates!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) from!355 Nil!1427)))

(declare-fun lt!22697 () Unit!1484)

(declare-fun choose!39 (array!3683 (_ BitVec 32) (_ BitVec 32)) Unit!1484)

(assert (=> d!10517 (= lt!22697 (choose!39 (_keys!3640 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!10517 (bvslt (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!10517 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000000 from!355) lt!22697)))

(declare-fun bs!2476 () Bool)

(assert (= bs!2476 d!10517))

(assert (=> bs!2476 m!47911))

(declare-fun m!48117 () Bool)

(assert (=> bs!2476 m!48117))

(assert (=> b!57014 d!10517))

(declare-fun d!10519 () Bool)

(declare-fun res!32078 () Bool)

(declare-fun e!37763 () Bool)

(assert (=> d!10519 (=> res!32078 e!37763)))

(assert (=> d!10519 (= res!32078 (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!10519 (= (arrayContainsKey!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!37763)))

(declare-fun b!57299 () Bool)

(declare-fun e!37764 () Bool)

(assert (=> b!57299 (= e!37763 e!37764)))

(declare-fun res!32079 () Bool)

(assert (=> b!57299 (=> (not res!32079) (not e!37764))))

(assert (=> b!57299 (= res!32079 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!57300 () Bool)

(assert (=> b!57300 (= e!37764 (arrayContainsKey!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!10519 (not res!32078)) b!57299))

(assert (= (and b!57299 res!32079) b!57300))

(declare-fun m!48119 () Bool)

(assert (=> d!10519 m!48119))

(assert (=> b!57300 m!47913))

(declare-fun m!48121 () Bool)

(assert (=> b!57300 m!48121))

(assert (=> b!57014 d!10519))

(declare-fun d!10521 () Bool)

(declare-fun e!37767 () Bool)

(assert (=> d!10521 e!37767))

(declare-fun c!7064 () Bool)

(assert (=> d!10521 (= c!7064 (and (not (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!22700 () Unit!1484)

(declare-fun choose!294 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 64) (_ BitVec 32) Int) Unit!1484)

(assert (=> d!10521 (= lt!22700 (choose!294 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))))))

(assert (=> d!10521 (validMask!0 (mask!5894 (v!2361 (underlying!220 thiss!992))))))

(assert (=> d!10521 (= (lemmaListMapContainsThenArrayContainsFrom!25 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))) lt!22700)))

(declare-fun b!57305 () Bool)

(assert (=> b!57305 (= e!37767 (arrayContainsKey!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!57306 () Bool)

(assert (=> b!57306 (= e!37767 (ite (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!10521 c!7064) b!57305))

(assert (= (and d!10521 (not c!7064)) b!57306))

(assert (=> d!10521 m!47913))

(declare-fun m!48123 () Bool)

(assert (=> d!10521 m!48123))

(assert (=> d!10521 m!47927))

(assert (=> b!57305 m!47913))

(assert (=> b!57305 m!47917))

(assert (=> b!57014 d!10521))

(declare-fun b!57317 () Bool)

(declare-fun e!37778 () Bool)

(declare-fun call!4140 () Bool)

(assert (=> b!57317 (= e!37778 call!4140)))

(declare-fun d!10523 () Bool)

(declare-fun res!32087 () Bool)

(declare-fun e!37779 () Bool)

(assert (=> d!10523 (=> res!32087 e!37779)))

(assert (=> d!10523 (= res!32087 (bvsge from!355 (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> d!10523 (= (arrayNoDuplicates!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) from!355 Nil!1427) e!37779)))

(declare-fun b!57318 () Bool)

(declare-fun e!37777 () Bool)

(declare-fun contains!680 (List!1430 (_ BitVec 64)) Bool)

(assert (=> b!57318 (= e!37777 (contains!680 Nil!1427 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!57319 () Bool)

(declare-fun e!37776 () Bool)

(assert (=> b!57319 (= e!37776 e!37778)))

(declare-fun c!7067 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!57319 (= c!7067 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!57320 () Bool)

(assert (=> b!57320 (= e!37778 call!4140)))

(declare-fun b!57321 () Bool)

(assert (=> b!57321 (= e!37779 e!37776)))

(declare-fun res!32086 () Bool)

(assert (=> b!57321 (=> (not res!32086) (not e!37776))))

(assert (=> b!57321 (= res!32086 (not e!37777))))

(declare-fun res!32088 () Bool)

(assert (=> b!57321 (=> (not res!32088) (not e!37777))))

(assert (=> b!57321 (= res!32088 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun bm!4137 () Bool)

(assert (=> bm!4137 (= call!4140 (arrayNoDuplicates!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427)))))

(assert (= (and d!10523 (not res!32087)) b!57321))

(assert (= (and b!57321 res!32088) b!57318))

(assert (= (and b!57321 res!32086) b!57319))

(assert (= (and b!57319 c!7067) b!57320))

(assert (= (and b!57319 (not c!7067)) b!57317))

(assert (= (or b!57320 b!57317) bm!4137))

(assert (=> b!57318 m!47913))

(assert (=> b!57318 m!47913))

(declare-fun m!48125 () Bool)

(assert (=> b!57318 m!48125))

(assert (=> b!57319 m!47913))

(assert (=> b!57319 m!47913))

(declare-fun m!48127 () Bool)

(assert (=> b!57319 m!48127))

(assert (=> b!57321 m!47913))

(assert (=> b!57321 m!47913))

(assert (=> b!57321 m!48127))

(assert (=> bm!4137 m!47913))

(declare-fun m!48129 () Bool)

(assert (=> bm!4137 m!48129))

(assert (=> b!57014 d!10523))

(declare-fun d!10525 () Bool)

(assert (=> d!10525 (= (map!1099 newMap!16) (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun bs!2477 () Bool)

(assert (= bs!2477 d!10525))

(assert (=> bs!2477 m!48101))

(assert (=> b!57029 d!10525))

(declare-fun b!57365 () Bool)

(declare-fun e!37808 () ListLongMap!1349)

(declare-fun call!4157 () ListLongMap!1349)

(assert (=> b!57365 (= e!37808 call!4157)))

(declare-fun b!57366 () Bool)

(declare-fun e!37812 () Bool)

(assert (=> b!57366 (= e!37812 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!57367 () Bool)

(declare-fun e!37816 () Bool)

(declare-fun e!37813 () Bool)

(assert (=> b!57367 (= e!37816 e!37813)))

(declare-fun res!32107 () Bool)

(declare-fun call!4156 () Bool)

(assert (=> b!57367 (= res!32107 call!4156)))

(assert (=> b!57367 (=> (not res!32107) (not e!37813))))

(declare-fun b!57368 () Bool)

(declare-fun e!37814 () ListLongMap!1349)

(declare-fun e!37817 () ListLongMap!1349)

(assert (=> b!57368 (= e!37814 e!37817)))

(declare-fun c!7081 () Bool)

(assert (=> b!57368 (= c!7081 (and (not (= (bvand (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!57369 () Bool)

(declare-fun c!7082 () Bool)

(assert (=> b!57369 (= c!7082 (and (not (= (bvand (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!57369 (= e!37817 e!37808)))

(declare-fun bm!4152 () Bool)

(declare-fun call!4158 () ListLongMap!1349)

(declare-fun call!4160 () ListLongMap!1349)

(assert (=> bm!4152 (= call!4158 call!4160)))

(declare-fun b!57370 () Bool)

(declare-fun e!37807 () Bool)

(declare-fun e!37806 () Bool)

(assert (=> b!57370 (= e!37807 e!37806)))

(declare-fun res!32113 () Bool)

(assert (=> b!57370 (=> (not res!32113) (not e!37806))))

(declare-fun lt!22766 () ListLongMap!1349)

(assert (=> b!57370 (= res!32113 (contains!677 lt!22766 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!57370 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!57371 () Bool)

(declare-fun e!37815 () Unit!1484)

(declare-fun Unit!1498 () Unit!1484)

(assert (=> b!57371 (= e!37815 Unit!1498)))

(declare-fun b!57372 () Bool)

(declare-fun call!4161 () ListLongMap!1349)

(assert (=> b!57372 (= e!37814 (+!80 call!4161 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun d!10527 () Bool)

(declare-fun e!37809 () Bool)

(assert (=> d!10527 e!37809))

(declare-fun res!32111 () Bool)

(assert (=> d!10527 (=> (not res!32111) (not e!37809))))

(assert (=> d!10527 (= res!32111 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun lt!22760 () ListLongMap!1349)

(assert (=> d!10527 (= lt!22766 lt!22760)))

(declare-fun lt!22758 () Unit!1484)

(assert (=> d!10527 (= lt!22758 e!37815)))

(declare-fun c!7084 () Bool)

(declare-fun e!37818 () Bool)

(assert (=> d!10527 (= c!7084 e!37818)))

(declare-fun res!32115 () Bool)

(assert (=> d!10527 (=> (not res!32115) (not e!37818))))

(assert (=> d!10527 (= res!32115 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> d!10527 (= lt!22760 e!37814)))

(declare-fun c!7083 () Bool)

(assert (=> d!10527 (= c!7083 (and (not (= (bvand (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!10527 (validMask!0 (mask!5894 (v!2361 (underlying!220 thiss!992))))))

(assert (=> d!10527 (= (getCurrentListMap!387 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))) lt!22766)))

(declare-fun b!57364 () Bool)

(assert (=> b!57364 (= e!37809 e!37816)))

(declare-fun c!7085 () Bool)

(assert (=> b!57364 (= c!7085 (not (= (bvand (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!4153 () Bool)

(declare-fun call!4155 () ListLongMap!1349)

(assert (=> bm!4153 (= call!4155 call!4161)))

(declare-fun bm!4154 () Bool)

(assert (=> bm!4154 (= call!4156 (contains!677 lt!22766 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57373 () Bool)

(assert (=> b!57373 (= e!37817 call!4155)))

(declare-fun bm!4155 () Bool)

(assert (=> bm!4155 (= call!4157 call!4158)))

(declare-fun b!57374 () Bool)

(declare-fun res!32110 () Bool)

(assert (=> b!57374 (=> (not res!32110) (not e!37809))))

(assert (=> b!57374 (= res!32110 e!37807)))

(declare-fun res!32108 () Bool)

(assert (=> b!57374 (=> res!32108 e!37807)))

(assert (=> b!57374 (= res!32108 (not e!37812))))

(declare-fun res!32112 () Bool)

(assert (=> b!57374 (=> (not res!32112) (not e!37812))))

(assert (=> b!57374 (= res!32112 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!57375 () Bool)

(declare-fun e!37811 () Bool)

(declare-fun e!37810 () Bool)

(assert (=> b!57375 (= e!37811 e!37810)))

(declare-fun res!32114 () Bool)

(declare-fun call!4159 () Bool)

(assert (=> b!57375 (= res!32114 call!4159)))

(assert (=> b!57375 (=> (not res!32114) (not e!37810))))

(declare-fun bm!4156 () Bool)

(assert (=> bm!4156 (= call!4161 (+!80 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157)) (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!57376 () Bool)

(declare-fun apply!65 (ListLongMap!1349 (_ BitVec 64)) V!2833)

(assert (=> b!57376 (= e!37806 (= (apply!65 lt!22766 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57376 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1993 (_values!2004 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> b!57376 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!57377 () Bool)

(assert (=> b!57377 (= e!37810 (= (apply!65 lt!22766 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun b!57378 () Bool)

(declare-fun res!32109 () Bool)

(assert (=> b!57378 (=> (not res!32109) (not e!37809))))

(assert (=> b!57378 (= res!32109 e!37811)))

(declare-fun c!7080 () Bool)

(assert (=> b!57378 (= c!7080 (not (= (bvand (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!57379 () Bool)

(assert (=> b!57379 (= e!37808 call!4155)))

(declare-fun b!57380 () Bool)

(assert (=> b!57380 (= e!37811 (not call!4159))))

(declare-fun b!57381 () Bool)

(assert (=> b!57381 (= e!37816 (not call!4156))))

(declare-fun b!57382 () Bool)

(declare-fun lt!22750 () Unit!1484)

(assert (=> b!57382 (= e!37815 lt!22750)))

(declare-fun lt!22756 () ListLongMap!1349)

(declare-fun getCurrentListMapNoExtraKeys!43 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 32) Int) ListLongMap!1349)

(assert (=> b!57382 (= lt!22756 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun lt!22751 () (_ BitVec 64))

(assert (=> b!57382 (= lt!22751 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22749 () (_ BitVec 64))

(assert (=> b!57382 (= lt!22749 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22753 () Unit!1484)

(declare-fun addStillContains!41 (ListLongMap!1349 (_ BitVec 64) V!2833 (_ BitVec 64)) Unit!1484)

(assert (=> b!57382 (= lt!22753 (addStillContains!41 lt!22756 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22749))))

(assert (=> b!57382 (contains!677 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22749)))

(declare-fun lt!22763 () Unit!1484)

(assert (=> b!57382 (= lt!22763 lt!22753)))

(declare-fun lt!22747 () ListLongMap!1349)

(assert (=> b!57382 (= lt!22747 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun lt!22748 () (_ BitVec 64))

(assert (=> b!57382 (= lt!22748 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22745 () (_ BitVec 64))

(assert (=> b!57382 (= lt!22745 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22761 () Unit!1484)

(declare-fun addApplyDifferent!41 (ListLongMap!1349 (_ BitVec 64) V!2833 (_ BitVec 64)) Unit!1484)

(assert (=> b!57382 (= lt!22761 (addApplyDifferent!41 lt!22747 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22745))))

(assert (=> b!57382 (= (apply!65 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22745) (apply!65 lt!22747 lt!22745))))

(declare-fun lt!22746 () Unit!1484)

(assert (=> b!57382 (= lt!22746 lt!22761)))

(declare-fun lt!22752 () ListLongMap!1349)

(assert (=> b!57382 (= lt!22752 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun lt!22759 () (_ BitVec 64))

(assert (=> b!57382 (= lt!22759 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22764 () (_ BitVec 64))

(assert (=> b!57382 (= lt!22764 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22755 () Unit!1484)

(assert (=> b!57382 (= lt!22755 (addApplyDifferent!41 lt!22752 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22764))))

(assert (=> b!57382 (= (apply!65 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22764) (apply!65 lt!22752 lt!22764))))

(declare-fun lt!22757 () Unit!1484)

(assert (=> b!57382 (= lt!22757 lt!22755)))

(declare-fun lt!22754 () ListLongMap!1349)

(assert (=> b!57382 (= lt!22754 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun lt!22765 () (_ BitVec 64))

(assert (=> b!57382 (= lt!22765 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22762 () (_ BitVec 64))

(assert (=> b!57382 (= lt!22762 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!57382 (= lt!22750 (addApplyDifferent!41 lt!22754 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22762))))

(assert (=> b!57382 (= (apply!65 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22762) (apply!65 lt!22754 lt!22762))))

(declare-fun bm!4157 () Bool)

(assert (=> bm!4157 (= call!4159 (contains!677 lt!22766 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57383 () Bool)

(assert (=> b!57383 (= e!37818 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!4158 () Bool)

(assert (=> bm!4158 (= call!4160 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun b!57384 () Bool)

(assert (=> b!57384 (= e!37813 (= (apply!65 lt!22766 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))

(assert (= (and d!10527 c!7083) b!57372))

(assert (= (and d!10527 (not c!7083)) b!57368))

(assert (= (and b!57368 c!7081) b!57373))

(assert (= (and b!57368 (not c!7081)) b!57369))

(assert (= (and b!57369 c!7082) b!57379))

(assert (= (and b!57369 (not c!7082)) b!57365))

(assert (= (or b!57379 b!57365) bm!4155))

(assert (= (or b!57373 bm!4155) bm!4152))

(assert (= (or b!57373 b!57379) bm!4153))

(assert (= (or b!57372 bm!4152) bm!4158))

(assert (= (or b!57372 bm!4153) bm!4156))

(assert (= (and d!10527 res!32115) b!57383))

(assert (= (and d!10527 c!7084) b!57382))

(assert (= (and d!10527 (not c!7084)) b!57371))

(assert (= (and d!10527 res!32111) b!57374))

(assert (= (and b!57374 res!32112) b!57366))

(assert (= (and b!57374 (not res!32108)) b!57370))

(assert (= (and b!57370 res!32113) b!57376))

(assert (= (and b!57374 res!32110) b!57378))

(assert (= (and b!57378 c!7080) b!57375))

(assert (= (and b!57378 (not c!7080)) b!57380))

(assert (= (and b!57375 res!32114) b!57377))

(assert (= (or b!57375 b!57380) bm!4157))

(assert (= (and b!57378 res!32109) b!57364))

(assert (= (and b!57364 c!7085) b!57367))

(assert (= (and b!57364 (not c!7085)) b!57381))

(assert (= (and b!57367 res!32107) b!57384))

(assert (= (or b!57367 b!57381) bm!4154))

(declare-fun b_lambda!2501 () Bool)

(assert (=> (not b_lambda!2501) (not b!57376)))

(assert (=> b!57376 t!4740))

(declare-fun b_and!3461 () Bool)

(assert (= b_and!3441 (and (=> t!4740 result!2333) b_and!3461)))

(assert (=> b!57376 t!4742))

(declare-fun b_and!3463 () Bool)

(assert (= b_and!3443 (and (=> t!4742 result!2337) b_and!3463)))

(declare-fun m!48131 () Bool)

(assert (=> b!57376 m!48131))

(assert (=> b!57376 m!47937))

(declare-fun m!48133 () Bool)

(assert (=> b!57376 m!48133))

(assert (=> b!57376 m!48131))

(assert (=> b!57376 m!48119))

(declare-fun m!48135 () Bool)

(assert (=> b!57376 m!48135))

(assert (=> b!57376 m!48119))

(assert (=> b!57376 m!47937))

(declare-fun m!48137 () Bool)

(assert (=> b!57372 m!48137))

(declare-fun m!48139 () Bool)

(assert (=> bm!4156 m!48139))

(assert (=> b!57370 m!48119))

(assert (=> b!57370 m!48119))

(declare-fun m!48141 () Bool)

(assert (=> b!57370 m!48141))

(declare-fun m!48143 () Bool)

(assert (=> b!57384 m!48143))

(declare-fun m!48145 () Bool)

(assert (=> bm!4154 m!48145))

(declare-fun m!48147 () Bool)

(assert (=> bm!4157 m!48147))

(assert (=> b!57382 m!48119))

(declare-fun m!48149 () Bool)

(assert (=> b!57382 m!48149))

(declare-fun m!48151 () Bool)

(assert (=> b!57382 m!48151))

(declare-fun m!48153 () Bool)

(assert (=> b!57382 m!48153))

(declare-fun m!48155 () Bool)

(assert (=> b!57382 m!48155))

(declare-fun m!48157 () Bool)

(assert (=> b!57382 m!48157))

(declare-fun m!48159 () Bool)

(assert (=> b!57382 m!48159))

(declare-fun m!48161 () Bool)

(assert (=> b!57382 m!48161))

(declare-fun m!48163 () Bool)

(assert (=> b!57382 m!48163))

(declare-fun m!48165 () Bool)

(assert (=> b!57382 m!48165))

(assert (=> b!57382 m!48157))

(declare-fun m!48167 () Bool)

(assert (=> b!57382 m!48167))

(assert (=> b!57382 m!48161))

(declare-fun m!48169 () Bool)

(assert (=> b!57382 m!48169))

(declare-fun m!48171 () Bool)

(assert (=> b!57382 m!48171))

(declare-fun m!48173 () Bool)

(assert (=> b!57382 m!48173))

(declare-fun m!48175 () Bool)

(assert (=> b!57382 m!48175))

(declare-fun m!48177 () Bool)

(assert (=> b!57382 m!48177))

(assert (=> b!57382 m!48163))

(assert (=> b!57382 m!48171))

(declare-fun m!48179 () Bool)

(assert (=> b!57382 m!48179))

(declare-fun m!48181 () Bool)

(assert (=> b!57377 m!48181))

(assert (=> bm!4158 m!48177))

(assert (=> d!10527 m!47927))

(assert (=> b!57366 m!48119))

(assert (=> b!57366 m!48119))

(declare-fun m!48183 () Bool)

(assert (=> b!57366 m!48183))

(assert (=> b!57383 m!48119))

(assert (=> b!57383 m!48119))

(assert (=> b!57383 m!48183))

(assert (=> b!57029 d!10527))

(declare-fun d!10529 () Bool)

(assert (=> d!10529 (= (array_inv!1093 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvsge (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!57026 d!10529))

(declare-fun d!10531 () Bool)

(assert (=> d!10531 (= (array_inv!1094 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvsge (size!1993 (_values!2004 (v!2361 (underlying!220 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!57026 d!10531))

(declare-fun d!10533 () Bool)

(assert (=> d!10533 (= (valid!251 thiss!992) (valid!250 (v!2361 (underlying!220 thiss!992))))))

(declare-fun bs!2478 () Bool)

(assert (= bs!2478 d!10533))

(declare-fun m!48185 () Bool)

(assert (=> bs!2478 m!48185))

(assert (=> start!8424 d!10533))

(declare-fun d!10535 () Bool)

(assert (=> d!10535 (= (array_inv!1093 (_keys!3640 newMap!16)) (bvsge (size!1992 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!57016 d!10535))

(declare-fun d!10537 () Bool)

(assert (=> d!10537 (= (array_inv!1094 (_values!2004 newMap!16)) (bvsge (size!1993 (_values!2004 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!57016 d!10537))

(declare-fun b!57392 () Bool)

(declare-fun e!37823 () Bool)

(assert (=> b!57392 (= e!37823 tp_is_empty!2389)))

(declare-fun mapIsEmpty!2857 () Bool)

(declare-fun mapRes!2857 () Bool)

(assert (=> mapIsEmpty!2857 mapRes!2857))

(declare-fun b!57391 () Bool)

(declare-fun e!37824 () Bool)

(assert (=> b!57391 (= e!37824 tp_is_empty!2389)))

(declare-fun mapNonEmpty!2857 () Bool)

(declare-fun tp!7969 () Bool)

(assert (=> mapNonEmpty!2857 (= mapRes!2857 (and tp!7969 e!37824))))

(declare-fun mapRest!2857 () (Array (_ BitVec 32) ValueCell!851))

(declare-fun mapValue!2857 () ValueCell!851)

(declare-fun mapKey!2857 () (_ BitVec 32))

(assert (=> mapNonEmpty!2857 (= mapRest!2841 (store mapRest!2857 mapKey!2857 mapValue!2857))))

(declare-fun condMapEmpty!2857 () Bool)

(declare-fun mapDefault!2857 () ValueCell!851)

(assert (=> mapNonEmpty!2842 (= condMapEmpty!2857 (= mapRest!2841 ((as const (Array (_ BitVec 32) ValueCell!851)) mapDefault!2857)))))

(assert (=> mapNonEmpty!2842 (= tp!7942 (and e!37823 mapRes!2857))))

(assert (= (and mapNonEmpty!2842 condMapEmpty!2857) mapIsEmpty!2857))

(assert (= (and mapNonEmpty!2842 (not condMapEmpty!2857)) mapNonEmpty!2857))

(assert (= (and mapNonEmpty!2857 ((_ is ValueCellFull!851) mapValue!2857)) b!57391))

(assert (= (and mapNonEmpty!2842 ((_ is ValueCellFull!851) mapDefault!2857)) b!57392))

(declare-fun m!48187 () Bool)

(assert (=> mapNonEmpty!2857 m!48187))

(declare-fun b!57394 () Bool)

(declare-fun e!37825 () Bool)

(assert (=> b!57394 (= e!37825 tp_is_empty!2389)))

(declare-fun mapIsEmpty!2858 () Bool)

(declare-fun mapRes!2858 () Bool)

(assert (=> mapIsEmpty!2858 mapRes!2858))

(declare-fun b!57393 () Bool)

(declare-fun e!37826 () Bool)

(assert (=> b!57393 (= e!37826 tp_is_empty!2389)))

(declare-fun mapNonEmpty!2858 () Bool)

(declare-fun tp!7970 () Bool)

(assert (=> mapNonEmpty!2858 (= mapRes!2858 (and tp!7970 e!37826))))

(declare-fun mapValue!2858 () ValueCell!851)

(declare-fun mapKey!2858 () (_ BitVec 32))

(declare-fun mapRest!2858 () (Array (_ BitVec 32) ValueCell!851))

(assert (=> mapNonEmpty!2858 (= mapRest!2842 (store mapRest!2858 mapKey!2858 mapValue!2858))))

(declare-fun condMapEmpty!2858 () Bool)

(declare-fun mapDefault!2858 () ValueCell!851)

(assert (=> mapNonEmpty!2841 (= condMapEmpty!2858 (= mapRest!2842 ((as const (Array (_ BitVec 32) ValueCell!851)) mapDefault!2858)))))

(assert (=> mapNonEmpty!2841 (= tp!7939 (and e!37825 mapRes!2858))))

(assert (= (and mapNonEmpty!2841 condMapEmpty!2858) mapIsEmpty!2858))

(assert (= (and mapNonEmpty!2841 (not condMapEmpty!2858)) mapNonEmpty!2858))

(assert (= (and mapNonEmpty!2858 ((_ is ValueCellFull!851) mapValue!2858)) b!57393))

(assert (= (and mapNonEmpty!2841 ((_ is ValueCellFull!851) mapDefault!2858)) b!57394))

(declare-fun m!48189 () Bool)

(assert (=> mapNonEmpty!2858 m!48189))

(declare-fun b_lambda!2503 () Bool)

(assert (= b_lambda!2501 (or (and b!57026 b_free!1945) (and b!57016 b_free!1947 (= (defaultEntry!2021 newMap!16) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))))) b_lambda!2503)))

(check-sat (not d!10511) (not bm!4122) (not bm!4137) (not bm!4156) (not b_next!1947) (not mapNonEmpty!2857) (not b_next!1945) (not mapNonEmpty!2858) (not b!57166) (not b!57366) (not b!57262) (not bm!4121) (not b!57382) (not b!57370) (not b!57383) (not bm!4157) (not bm!4115) (not bm!4111) (not b!57372) (not b!57259) (not b_lambda!2503) b_and!3463 b_and!3461 (not b_lambda!2499) (not bm!4129) (not b!57273) (not b!57305) (not b!57294) (not bm!4154) (not b!57321) (not b!57293) tp_is_empty!2389 (not bm!4126) (not d!10517) (not bm!4125) (not b!57279) (not d!10525) (not b!57168) (not d!10505) (not b!57318) (not b!57157) (not b!57256) (not b!57384) (not d!10527) (not d!10509) (not bm!4131) (not b!57285) (not b!57300) (not b!57377) (not b!57158) (not bm!4120) (not bm!4113) (not bm!4158) (not b!57258) (not d!10515) (not d!10521) (not bm!4127) (not b!57319) (not b!57376) (not b!57159) (not bm!4128) (not d!10533))
(check-sat b_and!3461 b_and!3463 (not b_next!1945) (not b_next!1947))
(get-model)

(declare-fun d!10539 () Bool)

(assert (=> d!10539 (= (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57366 d!10539))

(declare-fun d!10541 () Bool)

(assert (=> d!10541 (contains!677 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22749)))

(declare-fun lt!22769 () Unit!1484)

(declare-fun choose!295 (ListLongMap!1349 (_ BitVec 64) V!2833 (_ BitVec 64)) Unit!1484)

(assert (=> d!10541 (= lt!22769 (choose!295 lt!22756 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22749))))

(assert (=> d!10541 (contains!677 lt!22756 lt!22749)))

(assert (=> d!10541 (= (addStillContains!41 lt!22756 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22749) lt!22769)))

(declare-fun bs!2479 () Bool)

(assert (= bs!2479 d!10541))

(assert (=> bs!2479 m!48157))

(assert (=> bs!2479 m!48157))

(assert (=> bs!2479 m!48167))

(declare-fun m!48191 () Bool)

(assert (=> bs!2479 m!48191))

(declare-fun m!48193 () Bool)

(assert (=> bs!2479 m!48193))

(assert (=> b!57382 d!10541))

(declare-fun d!10543 () Bool)

(assert (=> d!10543 (= (apply!65 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22745) (apply!65 lt!22747 lt!22745))))

(declare-fun lt!22772 () Unit!1484)

(declare-fun choose!296 (ListLongMap!1349 (_ BitVec 64) V!2833 (_ BitVec 64)) Unit!1484)

(assert (=> d!10543 (= lt!22772 (choose!296 lt!22747 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22745))))

(declare-fun e!37829 () Bool)

(assert (=> d!10543 e!37829))

(declare-fun res!32118 () Bool)

(assert (=> d!10543 (=> (not res!32118) (not e!37829))))

(assert (=> d!10543 (= res!32118 (contains!677 lt!22747 lt!22745))))

(assert (=> d!10543 (= (addApplyDifferent!41 lt!22747 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22745) lt!22772)))

(declare-fun b!57399 () Bool)

(assert (=> b!57399 (= e!37829 (not (= lt!22745 lt!22748)))))

(assert (= (and d!10543 res!32118) b!57399))

(assert (=> d!10543 m!48171))

(assert (=> d!10543 m!48179))

(assert (=> d!10543 m!48175))

(declare-fun m!48195 () Bool)

(assert (=> d!10543 m!48195))

(declare-fun m!48197 () Bool)

(assert (=> d!10543 m!48197))

(assert (=> d!10543 m!48171))

(assert (=> b!57382 d!10543))

(declare-fun b!57424 () Bool)

(declare-fun e!37846 () Bool)

(assert (=> b!57424 (= e!37846 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!57424 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun d!10545 () Bool)

(declare-fun e!37844 () Bool)

(assert (=> d!10545 e!37844))

(declare-fun res!32130 () Bool)

(assert (=> d!10545 (=> (not res!32130) (not e!37844))))

(declare-fun lt!22790 () ListLongMap!1349)

(assert (=> d!10545 (= res!32130 (not (contains!677 lt!22790 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!37845 () ListLongMap!1349)

(assert (=> d!10545 (= lt!22790 e!37845)))

(declare-fun c!7096 () Bool)

(assert (=> d!10545 (= c!7096 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> d!10545 (validMask!0 (mask!5894 (v!2361 (underlying!220 thiss!992))))))

(assert (=> d!10545 (= (getCurrentListMapNoExtraKeys!43 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))) lt!22790)))

(declare-fun b!57425 () Bool)

(declare-fun e!37849 () Bool)

(declare-fun e!37850 () Bool)

(assert (=> b!57425 (= e!37849 e!37850)))

(declare-fun c!7095 () Bool)

(assert (=> b!57425 (= c!7095 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun bm!4161 () Bool)

(declare-fun call!4164 () ListLongMap!1349)

(assert (=> bm!4161 (= call!4164 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun b!57426 () Bool)

(declare-fun res!32129 () Bool)

(assert (=> b!57426 (=> (not res!32129) (not e!37844))))

(assert (=> b!57426 (= res!32129 (not (contains!677 lt!22790 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!57427 () Bool)

(declare-fun isEmpty!294 (ListLongMap!1349) Bool)

(assert (=> b!57427 (= e!37850 (isEmpty!294 lt!22790))))

(declare-fun b!57428 () Bool)

(assert (=> b!57428 (= e!37844 e!37849)))

(declare-fun c!7097 () Bool)

(assert (=> b!57428 (= c!7097 e!37846)))

(declare-fun res!32128 () Bool)

(assert (=> b!57428 (=> (not res!32128) (not e!37846))))

(assert (=> b!57428 (= res!32128 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!57429 () Bool)

(assert (=> b!57429 (= e!37850 (= lt!22790 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!57430 () Bool)

(declare-fun e!37847 () ListLongMap!1349)

(assert (=> b!57430 (= e!37847 call!4164)))

(declare-fun b!57431 () Bool)

(declare-fun lt!22791 () Unit!1484)

(declare-fun lt!22788 () Unit!1484)

(assert (=> b!57431 (= lt!22791 lt!22788)))

(declare-fun lt!22793 () (_ BitVec 64))

(declare-fun lt!22792 () (_ BitVec 64))

(declare-fun lt!22787 () ListLongMap!1349)

(declare-fun lt!22789 () V!2833)

(assert (=> b!57431 (not (contains!677 (+!80 lt!22787 (tuple2!2025 lt!22793 lt!22789)) lt!22792))))

(declare-fun addStillNotContains!15 (ListLongMap!1349 (_ BitVec 64) V!2833 (_ BitVec 64)) Unit!1484)

(assert (=> b!57431 (= lt!22788 (addStillNotContains!15 lt!22787 lt!22793 lt!22789 lt!22792))))

(assert (=> b!57431 (= lt!22792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!57431 (= lt!22789 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57431 (= lt!22793 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!57431 (= lt!22787 call!4164)))

(assert (=> b!57431 (= e!37847 (+!80 call!4164 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!57432 () Bool)

(assert (=> b!57432 (= e!37845 e!37847)))

(declare-fun c!7094 () Bool)

(assert (=> b!57432 (= c!7094 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!57433 () Bool)

(declare-fun e!37848 () Bool)

(assert (=> b!57433 (= e!37849 e!37848)))

(assert (=> b!57433 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun res!32127 () Bool)

(assert (=> b!57433 (= res!32127 (contains!677 lt!22790 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!57433 (=> (not res!32127) (not e!37848))))

(declare-fun b!57434 () Bool)

(assert (=> b!57434 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> b!57434 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1993 (_values!2004 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> b!57434 (= e!37848 (= (apply!65 lt!22790 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!57435 () Bool)

(assert (=> b!57435 (= e!37845 (ListLongMap!1350 Nil!1428))))

(assert (= (and d!10545 c!7096) b!57435))

(assert (= (and d!10545 (not c!7096)) b!57432))

(assert (= (and b!57432 c!7094) b!57431))

(assert (= (and b!57432 (not c!7094)) b!57430))

(assert (= (or b!57431 b!57430) bm!4161))

(assert (= (and d!10545 res!32130) b!57426))

(assert (= (and b!57426 res!32129) b!57428))

(assert (= (and b!57428 res!32128) b!57424))

(assert (= (and b!57428 c!7097) b!57433))

(assert (= (and b!57428 (not c!7097)) b!57425))

(assert (= (and b!57433 res!32127) b!57434))

(assert (= (and b!57425 c!7095) b!57429))

(assert (= (and b!57425 (not c!7095)) b!57427))

(declare-fun b_lambda!2505 () Bool)

(assert (=> (not b_lambda!2505) (not b!57431)))

(assert (=> b!57431 t!4740))

(declare-fun b_and!3465 () Bool)

(assert (= b_and!3461 (and (=> t!4740 result!2333) b_and!3465)))

(assert (=> b!57431 t!4742))

(declare-fun b_and!3467 () Bool)

(assert (= b_and!3463 (and (=> t!4742 result!2337) b_and!3467)))

(declare-fun b_lambda!2507 () Bool)

(assert (=> (not b_lambda!2507) (not b!57434)))

(assert (=> b!57434 t!4740))

(declare-fun b_and!3469 () Bool)

(assert (= b_and!3465 (and (=> t!4740 result!2333) b_and!3469)))

(assert (=> b!57434 t!4742))

(declare-fun b_and!3471 () Bool)

(assert (= b_and!3467 (and (=> t!4742 result!2337) b_and!3471)))

(assert (=> b!57432 m!48119))

(assert (=> b!57432 m!48119))

(assert (=> b!57432 m!48183))

(declare-fun m!48199 () Bool)

(assert (=> b!57427 m!48199))

(declare-fun m!48201 () Bool)

(assert (=> b!57429 m!48201))

(declare-fun m!48203 () Bool)

(assert (=> d!10545 m!48203))

(assert (=> d!10545 m!47927))

(assert (=> b!57431 m!47937))

(assert (=> b!57431 m!48131))

(assert (=> b!57431 m!47937))

(assert (=> b!57431 m!48133))

(assert (=> b!57431 m!48131))

(declare-fun m!48205 () Bool)

(assert (=> b!57431 m!48205))

(declare-fun m!48207 () Bool)

(assert (=> b!57431 m!48207))

(declare-fun m!48209 () Bool)

(assert (=> b!57431 m!48209))

(assert (=> b!57431 m!48119))

(assert (=> b!57431 m!48209))

(declare-fun m!48211 () Bool)

(assert (=> b!57431 m!48211))

(assert (=> bm!4161 m!48201))

(assert (=> b!57434 m!48131))

(assert (=> b!57434 m!47937))

(assert (=> b!57434 m!48131))

(assert (=> b!57434 m!47937))

(assert (=> b!57434 m!48133))

(assert (=> b!57434 m!48119))

(declare-fun m!48213 () Bool)

(assert (=> b!57434 m!48213))

(assert (=> b!57434 m!48119))

(declare-fun m!48215 () Bool)

(assert (=> b!57426 m!48215))

(assert (=> b!57424 m!48119))

(assert (=> b!57424 m!48119))

(assert (=> b!57424 m!48183))

(assert (=> b!57433 m!48119))

(assert (=> b!57433 m!48119))

(declare-fun m!48217 () Bool)

(assert (=> b!57433 m!48217))

(assert (=> b!57382 d!10545))

(declare-fun d!10547 () Bool)

(declare-fun get!1070 (Option!127) V!2833)

(assert (=> d!10547 (= (apply!65 lt!22754 lt!22762) (get!1070 (getValueByKey!121 (toList!690 lt!22754) lt!22762)))))

(declare-fun bs!2480 () Bool)

(assert (= bs!2480 d!10547))

(declare-fun m!48219 () Bool)

(assert (=> bs!2480 m!48219))

(assert (=> bs!2480 m!48219))

(declare-fun m!48221 () Bool)

(assert (=> bs!2480 m!48221))

(assert (=> b!57382 d!10547))

(declare-fun d!10549 () Bool)

(assert (=> d!10549 (= (apply!65 lt!22752 lt!22764) (get!1070 (getValueByKey!121 (toList!690 lt!22752) lt!22764)))))

(declare-fun bs!2481 () Bool)

(assert (= bs!2481 d!10549))

(declare-fun m!48223 () Bool)

(assert (=> bs!2481 m!48223))

(assert (=> bs!2481 m!48223))

(declare-fun m!48225 () Bool)

(assert (=> bs!2481 m!48225))

(assert (=> b!57382 d!10549))

(declare-fun d!10551 () Bool)

(declare-fun e!37851 () Bool)

(assert (=> d!10551 e!37851))

(declare-fun res!32131 () Bool)

(assert (=> d!10551 (=> res!32131 e!37851)))

(declare-fun lt!22794 () Bool)

(assert (=> d!10551 (= res!32131 (not lt!22794))))

(declare-fun lt!22797 () Bool)

(assert (=> d!10551 (= lt!22794 lt!22797)))

(declare-fun lt!22796 () Unit!1484)

(declare-fun e!37852 () Unit!1484)

(assert (=> d!10551 (= lt!22796 e!37852)))

(declare-fun c!7098 () Bool)

(assert (=> d!10551 (= c!7098 lt!22797)))

(assert (=> d!10551 (= lt!22797 (containsKey!125 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22749))))

(assert (=> d!10551 (= (contains!677 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22749) lt!22794)))

(declare-fun b!57436 () Bool)

(declare-fun lt!22795 () Unit!1484)

(assert (=> b!57436 (= e!37852 lt!22795)))

(assert (=> b!57436 (= lt!22795 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22749))))

(assert (=> b!57436 (isDefined!75 (getValueByKey!121 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22749))))

(declare-fun b!57437 () Bool)

(declare-fun Unit!1499 () Unit!1484)

(assert (=> b!57437 (= e!37852 Unit!1499)))

(declare-fun b!57438 () Bool)

(assert (=> b!57438 (= e!37851 (isDefined!75 (getValueByKey!121 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22749)))))

(assert (= (and d!10551 c!7098) b!57436))

(assert (= (and d!10551 (not c!7098)) b!57437))

(assert (= (and d!10551 (not res!32131)) b!57438))

(declare-fun m!48227 () Bool)

(assert (=> d!10551 m!48227))

(declare-fun m!48229 () Bool)

(assert (=> b!57436 m!48229))

(declare-fun m!48231 () Bool)

(assert (=> b!57436 m!48231))

(assert (=> b!57436 m!48231))

(declare-fun m!48233 () Bool)

(assert (=> b!57436 m!48233))

(assert (=> b!57438 m!48231))

(assert (=> b!57438 m!48231))

(assert (=> b!57438 m!48233))

(assert (=> b!57382 d!10551))

(declare-fun d!10553 () Bool)

(assert (=> d!10553 (= (apply!65 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22764) (apply!65 lt!22752 lt!22764))))

(declare-fun lt!22798 () Unit!1484)

(assert (=> d!10553 (= lt!22798 (choose!296 lt!22752 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22764))))

(declare-fun e!37853 () Bool)

(assert (=> d!10553 e!37853))

(declare-fun res!32132 () Bool)

(assert (=> d!10553 (=> (not res!32132) (not e!37853))))

(assert (=> d!10553 (= res!32132 (contains!677 lt!22752 lt!22764))))

(assert (=> d!10553 (= (addApplyDifferent!41 lt!22752 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22764) lt!22798)))

(declare-fun b!57439 () Bool)

(assert (=> b!57439 (= e!37853 (not (= lt!22764 lt!22759)))))

(assert (= (and d!10553 res!32132) b!57439))

(assert (=> d!10553 m!48163))

(assert (=> d!10553 m!48165))

(assert (=> d!10553 m!48155))

(declare-fun m!48235 () Bool)

(assert (=> d!10553 m!48235))

(declare-fun m!48237 () Bool)

(assert (=> d!10553 m!48237))

(assert (=> d!10553 m!48163))

(assert (=> b!57382 d!10553))

(declare-fun d!10555 () Bool)

(declare-fun e!37856 () Bool)

(assert (=> d!10555 e!37856))

(declare-fun res!32138 () Bool)

(assert (=> d!10555 (=> (not res!32138) (not e!37856))))

(declare-fun lt!22809 () ListLongMap!1349)

(assert (=> d!10555 (= res!32138 (contains!677 lt!22809 (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun lt!22810 () List!1431)

(assert (=> d!10555 (= lt!22809 (ListLongMap!1350 lt!22810))))

(declare-fun lt!22807 () Unit!1484)

(declare-fun lt!22808 () Unit!1484)

(assert (=> d!10555 (= lt!22807 lt!22808)))

(assert (=> d!10555 (= (getValueByKey!121 lt!22810 (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!41 (List!1431 (_ BitVec 64) V!2833) Unit!1484)

(assert (=> d!10555 (= lt!22808 (lemmaContainsTupThenGetReturnValue!41 lt!22810 (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun insertStrictlySorted!44 (List!1431 (_ BitVec 64) V!2833) List!1431)

(assert (=> d!10555 (= lt!22810 (insertStrictlySorted!44 (toList!690 lt!22756) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10555 (= (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22809)))

(declare-fun b!57444 () Bool)

(declare-fun res!32137 () Bool)

(assert (=> b!57444 (=> (not res!32137) (not e!37856))))

(assert (=> b!57444 (= res!32137 (= (getValueByKey!121 (toList!690 lt!22809) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!57445 () Bool)

(declare-fun contains!681 (List!1431 tuple2!2024) Bool)

(assert (=> b!57445 (= e!37856 (contains!681 (toList!690 lt!22809) (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(assert (= (and d!10555 res!32138) b!57444))

(assert (= (and b!57444 res!32137) b!57445))

(declare-fun m!48239 () Bool)

(assert (=> d!10555 m!48239))

(declare-fun m!48241 () Bool)

(assert (=> d!10555 m!48241))

(declare-fun m!48243 () Bool)

(assert (=> d!10555 m!48243))

(declare-fun m!48245 () Bool)

(assert (=> d!10555 m!48245))

(declare-fun m!48247 () Bool)

(assert (=> b!57444 m!48247))

(declare-fun m!48249 () Bool)

(assert (=> b!57445 m!48249))

(assert (=> b!57382 d!10555))

(declare-fun d!10557 () Bool)

(assert (=> d!10557 (= (apply!65 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22745) (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22745)))))

(declare-fun bs!2482 () Bool)

(assert (= bs!2482 d!10557))

(declare-fun m!48251 () Bool)

(assert (=> bs!2482 m!48251))

(assert (=> bs!2482 m!48251))

(declare-fun m!48253 () Bool)

(assert (=> bs!2482 m!48253))

(assert (=> b!57382 d!10557))

(declare-fun d!10559 () Bool)

(assert (=> d!10559 (= (apply!65 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22762) (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22762)))))

(declare-fun bs!2483 () Bool)

(assert (= bs!2483 d!10559))

(declare-fun m!48255 () Bool)

(assert (=> bs!2483 m!48255))

(assert (=> bs!2483 m!48255))

(declare-fun m!48257 () Bool)

(assert (=> bs!2483 m!48257))

(assert (=> b!57382 d!10559))

(declare-fun d!10561 () Bool)

(declare-fun e!37857 () Bool)

(assert (=> d!10561 e!37857))

(declare-fun res!32140 () Bool)

(assert (=> d!10561 (=> (not res!32140) (not e!37857))))

(declare-fun lt!22813 () ListLongMap!1349)

(assert (=> d!10561 (= res!32140 (contains!677 lt!22813 (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun lt!22814 () List!1431)

(assert (=> d!10561 (= lt!22813 (ListLongMap!1350 lt!22814))))

(declare-fun lt!22811 () Unit!1484)

(declare-fun lt!22812 () Unit!1484)

(assert (=> d!10561 (= lt!22811 lt!22812)))

(assert (=> d!10561 (= (getValueByKey!121 lt!22814 (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10561 (= lt!22812 (lemmaContainsTupThenGetReturnValue!41 lt!22814 (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10561 (= lt!22814 (insertStrictlySorted!44 (toList!690 lt!22754) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10561 (= (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22813)))

(declare-fun b!57446 () Bool)

(declare-fun res!32139 () Bool)

(assert (=> b!57446 (=> (not res!32139) (not e!37857))))

(assert (=> b!57446 (= res!32139 (= (getValueByKey!121 (toList!690 lt!22813) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!57447 () Bool)

(assert (=> b!57447 (= e!37857 (contains!681 (toList!690 lt!22813) (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(assert (= (and d!10561 res!32140) b!57446))

(assert (= (and b!57446 res!32139) b!57447))

(declare-fun m!48259 () Bool)

(assert (=> d!10561 m!48259))

(declare-fun m!48261 () Bool)

(assert (=> d!10561 m!48261))

(declare-fun m!48263 () Bool)

(assert (=> d!10561 m!48263))

(declare-fun m!48265 () Bool)

(assert (=> d!10561 m!48265))

(declare-fun m!48267 () Bool)

(assert (=> b!57446 m!48267))

(declare-fun m!48269 () Bool)

(assert (=> b!57447 m!48269))

(assert (=> b!57382 d!10561))

(declare-fun d!10563 () Bool)

(declare-fun e!37858 () Bool)

(assert (=> d!10563 e!37858))

(declare-fun res!32142 () Bool)

(assert (=> d!10563 (=> (not res!32142) (not e!37858))))

(declare-fun lt!22817 () ListLongMap!1349)

(assert (=> d!10563 (= res!32142 (contains!677 lt!22817 (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun lt!22818 () List!1431)

(assert (=> d!10563 (= lt!22817 (ListLongMap!1350 lt!22818))))

(declare-fun lt!22815 () Unit!1484)

(declare-fun lt!22816 () Unit!1484)

(assert (=> d!10563 (= lt!22815 lt!22816)))

(assert (=> d!10563 (= (getValueByKey!121 lt!22818 (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10563 (= lt!22816 (lemmaContainsTupThenGetReturnValue!41 lt!22818 (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10563 (= lt!22818 (insertStrictlySorted!44 (toList!690 lt!22747) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10563 (= (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22817)))

(declare-fun b!57448 () Bool)

(declare-fun res!32141 () Bool)

(assert (=> b!57448 (=> (not res!32141) (not e!37858))))

(assert (=> b!57448 (= res!32141 (= (getValueByKey!121 (toList!690 lt!22817) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!57449 () Bool)

(assert (=> b!57449 (= e!37858 (contains!681 (toList!690 lt!22817) (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(assert (= (and d!10563 res!32142) b!57448))

(assert (= (and b!57448 res!32141) b!57449))

(declare-fun m!48271 () Bool)

(assert (=> d!10563 m!48271))

(declare-fun m!48273 () Bool)

(assert (=> d!10563 m!48273))

(declare-fun m!48275 () Bool)

(assert (=> d!10563 m!48275))

(declare-fun m!48277 () Bool)

(assert (=> d!10563 m!48277))

(declare-fun m!48279 () Bool)

(assert (=> b!57448 m!48279))

(declare-fun m!48281 () Bool)

(assert (=> b!57449 m!48281))

(assert (=> b!57382 d!10563))

(declare-fun d!10565 () Bool)

(declare-fun e!37859 () Bool)

(assert (=> d!10565 e!37859))

(declare-fun res!32144 () Bool)

(assert (=> d!10565 (=> (not res!32144) (not e!37859))))

(declare-fun lt!22821 () ListLongMap!1349)

(assert (=> d!10565 (= res!32144 (contains!677 lt!22821 (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun lt!22822 () List!1431)

(assert (=> d!10565 (= lt!22821 (ListLongMap!1350 lt!22822))))

(declare-fun lt!22819 () Unit!1484)

(declare-fun lt!22820 () Unit!1484)

(assert (=> d!10565 (= lt!22819 lt!22820)))

(assert (=> d!10565 (= (getValueByKey!121 lt!22822 (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10565 (= lt!22820 (lemmaContainsTupThenGetReturnValue!41 lt!22822 (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10565 (= lt!22822 (insertStrictlySorted!44 (toList!690 lt!22752) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10565 (= (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22821)))

(declare-fun b!57450 () Bool)

(declare-fun res!32143 () Bool)

(assert (=> b!57450 (=> (not res!32143) (not e!37859))))

(assert (=> b!57450 (= res!32143 (= (getValueByKey!121 (toList!690 lt!22821) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!57451 () Bool)

(assert (=> b!57451 (= e!37859 (contains!681 (toList!690 lt!22821) (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(assert (= (and d!10565 res!32144) b!57450))

(assert (= (and b!57450 res!32143) b!57451))

(declare-fun m!48283 () Bool)

(assert (=> d!10565 m!48283))

(declare-fun m!48285 () Bool)

(assert (=> d!10565 m!48285))

(declare-fun m!48287 () Bool)

(assert (=> d!10565 m!48287))

(declare-fun m!48289 () Bool)

(assert (=> d!10565 m!48289))

(declare-fun m!48291 () Bool)

(assert (=> b!57450 m!48291))

(declare-fun m!48293 () Bool)

(assert (=> b!57451 m!48293))

(assert (=> b!57382 d!10565))

(declare-fun d!10567 () Bool)

(assert (=> d!10567 (= (apply!65 lt!22747 lt!22745) (get!1070 (getValueByKey!121 (toList!690 lt!22747) lt!22745)))))

(declare-fun bs!2484 () Bool)

(assert (= bs!2484 d!10567))

(declare-fun m!48295 () Bool)

(assert (=> bs!2484 m!48295))

(assert (=> bs!2484 m!48295))

(declare-fun m!48297 () Bool)

(assert (=> bs!2484 m!48297))

(assert (=> b!57382 d!10567))

(declare-fun d!10569 () Bool)

(assert (=> d!10569 (= (apply!65 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22762) (apply!65 lt!22754 lt!22762))))

(declare-fun lt!22823 () Unit!1484)

(assert (=> d!10569 (= lt!22823 (choose!296 lt!22754 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22762))))

(declare-fun e!37860 () Bool)

(assert (=> d!10569 e!37860))

(declare-fun res!32145 () Bool)

(assert (=> d!10569 (=> (not res!32145) (not e!37860))))

(assert (=> d!10569 (= res!32145 (contains!677 lt!22754 lt!22762))))

(assert (=> d!10569 (= (addApplyDifferent!41 lt!22754 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22762) lt!22823)))

(declare-fun b!57452 () Bool)

(assert (=> b!57452 (= e!37860 (not (= lt!22762 lt!22765)))))

(assert (= (and d!10569 res!32145) b!57452))

(assert (=> d!10569 m!48161))

(assert (=> d!10569 m!48169))

(assert (=> d!10569 m!48153))

(declare-fun m!48299 () Bool)

(assert (=> d!10569 m!48299))

(declare-fun m!48301 () Bool)

(assert (=> d!10569 m!48301))

(assert (=> d!10569 m!48161))

(assert (=> b!57382 d!10569))

(declare-fun d!10571 () Bool)

(assert (=> d!10571 (= (apply!65 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22764) (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22764)))))

(declare-fun bs!2485 () Bool)

(assert (= bs!2485 d!10571))

(declare-fun m!48303 () Bool)

(assert (=> bs!2485 m!48303))

(assert (=> bs!2485 m!48303))

(declare-fun m!48305 () Bool)

(assert (=> bs!2485 m!48305))

(assert (=> b!57382 d!10571))

(declare-fun d!10573 () Bool)

(declare-fun res!32146 () Bool)

(declare-fun e!37861 () Bool)

(assert (=> d!10573 (=> res!32146 e!37861)))

(assert (=> d!10573 (= res!32146 (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!10573 (= (arrayContainsKey!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!37861)))

(declare-fun b!57453 () Bool)

(declare-fun e!37862 () Bool)

(assert (=> b!57453 (= e!37861 e!37862)))

(declare-fun res!32147 () Bool)

(assert (=> b!57453 (=> (not res!32147) (not e!37862))))

(assert (=> b!57453 (= res!32147 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!57454 () Bool)

(assert (=> b!57454 (= e!37862 (arrayContainsKey!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!10573 (not res!32146)) b!57453))

(assert (= (and b!57453 res!32147) b!57454))

(declare-fun m!48307 () Bool)

(assert (=> d!10573 m!48307))

(assert (=> b!57454 m!47913))

(declare-fun m!48309 () Bool)

(assert (=> b!57454 m!48309))

(assert (=> b!57300 d!10573))

(declare-fun d!10575 () Bool)

(declare-fun lt!22826 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!61 (List!1430) (InoxSet (_ BitVec 64)))

(assert (=> d!10575 (= lt!22826 (select (content!61 Nil!1427) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun e!37868 () Bool)

(assert (=> d!10575 (= lt!22826 e!37868)))

(declare-fun res!32152 () Bool)

(assert (=> d!10575 (=> (not res!32152) (not e!37868))))

(assert (=> d!10575 (= res!32152 ((_ is Cons!1426) Nil!1427))))

(assert (=> d!10575 (= (contains!680 Nil!1427 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) lt!22826)))

(declare-fun b!57459 () Bool)

(declare-fun e!37867 () Bool)

(assert (=> b!57459 (= e!37868 e!37867)))

(declare-fun res!32153 () Bool)

(assert (=> b!57459 (=> res!32153 e!37867)))

(assert (=> b!57459 (= res!32153 (= (h!2006 Nil!1427) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!57460 () Bool)

(assert (=> b!57460 (= e!37867 (contains!680 (t!4743 Nil!1427) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (= (and d!10575 res!32152) b!57459))

(assert (= (and b!57459 (not res!32153)) b!57460))

(declare-fun m!48311 () Bool)

(assert (=> d!10575 m!48311))

(assert (=> d!10575 m!47913))

(declare-fun m!48313 () Bool)

(assert (=> d!10575 m!48313))

(assert (=> b!57460 m!47913))

(declare-fun m!48315 () Bool)

(assert (=> b!57460 m!48315))

(assert (=> b!57318 d!10575))

(declare-fun b!57461 () Bool)

(declare-fun e!37871 () Bool)

(declare-fun call!4165 () Bool)

(assert (=> b!57461 (= e!37871 call!4165)))

(declare-fun d!10577 () Bool)

(declare-fun res!32155 () Bool)

(declare-fun e!37872 () Bool)

(assert (=> d!10577 (=> res!32155 e!37872)))

(assert (=> d!10577 (= res!32155 (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10577 (= (arrayNoDuplicates!0 (_keys!3640 newMap!16) #b00000000000000000000000000000000 Nil!1427) e!37872)))

(declare-fun b!57462 () Bool)

(declare-fun e!37870 () Bool)

(assert (=> b!57462 (= e!37870 (contains!680 Nil!1427 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!57463 () Bool)

(declare-fun e!37869 () Bool)

(assert (=> b!57463 (= e!37869 e!37871)))

(declare-fun c!7099 () Bool)

(assert (=> b!57463 (= c!7099 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!57464 () Bool)

(assert (=> b!57464 (= e!37871 call!4165)))

(declare-fun b!57465 () Bool)

(assert (=> b!57465 (= e!37872 e!37869)))

(declare-fun res!32154 () Bool)

(assert (=> b!57465 (=> (not res!32154) (not e!37869))))

(assert (=> b!57465 (= res!32154 (not e!37870))))

(declare-fun res!32156 () Bool)

(assert (=> b!57465 (=> (not res!32156) (not e!37870))))

(assert (=> b!57465 (= res!32156 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!4162 () Bool)

(assert (=> bm!4162 (= call!4165 (arrayNoDuplicates!0 (_keys!3640 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!7099 (Cons!1426 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) Nil!1427) Nil!1427)))))

(assert (= (and d!10577 (not res!32155)) b!57465))

(assert (= (and b!57465 res!32156) b!57462))

(assert (= (and b!57465 res!32154) b!57463))

(assert (= (and b!57463 c!7099) b!57464))

(assert (= (and b!57463 (not c!7099)) b!57461))

(assert (= (or b!57464 b!57461) bm!4162))

(declare-fun m!48317 () Bool)

(assert (=> b!57462 m!48317))

(assert (=> b!57462 m!48317))

(declare-fun m!48319 () Bool)

(assert (=> b!57462 m!48319))

(assert (=> b!57463 m!48317))

(assert (=> b!57463 m!48317))

(declare-fun m!48321 () Bool)

(assert (=> b!57463 m!48321))

(assert (=> b!57465 m!48317))

(assert (=> b!57465 m!48317))

(assert (=> b!57465 m!48321))

(assert (=> bm!4162 m!48317))

(declare-fun m!48323 () Bool)

(assert (=> bm!4162 m!48323))

(assert (=> b!57159 d!10577))

(declare-fun d!10579 () Bool)

(assert (=> d!10579 (isDefined!75 (getValueByKey!121 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun lt!22829 () Unit!1484)

(declare-fun choose!297 (List!1431 (_ BitVec 64)) Unit!1484)

(assert (=> d!10579 (= lt!22829 (choose!297 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun e!37875 () Bool)

(assert (=> d!10579 e!37875))

(declare-fun res!32159 () Bool)

(assert (=> d!10579 (=> (not res!32159) (not e!37875))))

(declare-fun isStrictlySorted!278 (List!1431) Bool)

(assert (=> d!10579 (= res!32159 (isStrictlySorted!278 (toList!690 lt!22556)))))

(assert (=> d!10579 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) lt!22829)))

(declare-fun b!57468 () Bool)

(assert (=> b!57468 (= e!37875 (containsKey!125 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (= (and d!10579 res!32159) b!57468))

(assert (=> d!10579 m!47913))

(assert (=> d!10579 m!48051))

(assert (=> d!10579 m!48051))

(assert (=> d!10579 m!48053))

(assert (=> d!10579 m!47913))

(declare-fun m!48325 () Bool)

(assert (=> d!10579 m!48325))

(declare-fun m!48327 () Bool)

(assert (=> d!10579 m!48327))

(assert (=> b!57468 m!47913))

(assert (=> b!57468 m!48047))

(assert (=> b!57166 d!10579))

(declare-fun d!10581 () Bool)

(declare-fun isEmpty!295 (Option!127) Bool)

(assert (=> d!10581 (= (isDefined!75 (getValueByKey!121 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))) (not (isEmpty!295 (getValueByKey!121 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))))

(declare-fun bs!2486 () Bool)

(assert (= bs!2486 d!10581))

(assert (=> bs!2486 m!48051))

(declare-fun m!48329 () Bool)

(assert (=> bs!2486 m!48329))

(assert (=> b!57166 d!10581))

(declare-fun b!57478 () Bool)

(declare-fun e!37880 () Option!127)

(declare-fun e!37881 () Option!127)

(assert (=> b!57478 (= e!37880 e!37881)))

(declare-fun c!7105 () Bool)

(assert (=> b!57478 (= c!7105 (and ((_ is Cons!1427) (toList!690 lt!22556)) (not (= (_1!1023 (h!2007 (toList!690 lt!22556))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))))

(declare-fun b!57480 () Bool)

(assert (=> b!57480 (= e!37881 None!125)))

(declare-fun b!57479 () Bool)

(assert (=> b!57479 (= e!37881 (getValueByKey!121 (t!4744 (toList!690 lt!22556)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!57477 () Bool)

(assert (=> b!57477 (= e!37880 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22556)))))))

(declare-fun c!7104 () Bool)

(declare-fun d!10583 () Bool)

(assert (=> d!10583 (= c!7104 (and ((_ is Cons!1427) (toList!690 lt!22556)) (= (_1!1023 (h!2007 (toList!690 lt!22556))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (=> d!10583 (= (getValueByKey!121 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) e!37880)))

(assert (= (and d!10583 c!7104) b!57477))

(assert (= (and d!10583 (not c!7104)) b!57478))

(assert (= (and b!57478 c!7105) b!57479))

(assert (= (and b!57478 (not c!7105)) b!57480))

(assert (=> b!57479 m!47913))

(declare-fun m!48331 () Bool)

(assert (=> b!57479 m!48331))

(assert (=> b!57166 d!10583))

(declare-fun b!57497 () Bool)

(declare-fun e!37890 () Bool)

(declare-fun lt!22834 () SeekEntryResult!229)

(assert (=> b!57497 (= e!37890 ((_ is Undefined!229) lt!22834))))

(declare-fun b!57498 () Bool)

(declare-fun res!32170 () Bool)

(declare-fun e!37893 () Bool)

(assert (=> b!57498 (=> (not res!32170) (not e!37893))))

(assert (=> b!57498 (= res!32170 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3041 lt!22834)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!57498 (and (bvsge (index!3041 lt!22834) #b00000000000000000000000000000000) (bvslt (index!3041 lt!22834) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun bm!4167 () Bool)

(declare-fun call!4171 () Bool)

(assert (=> bm!4167 (= call!4171 (arrayContainsKey!0 (_keys!3640 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!57499 () Bool)

(assert (=> b!57499 (and (bvsge (index!3038 lt!22834) #b00000000000000000000000000000000) (bvslt (index!3038 lt!22834) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun res!32171 () Bool)

(assert (=> b!57499 (= res!32171 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3038 lt!22834)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37891 () Bool)

(assert (=> b!57499 (=> (not res!32171) (not e!37891))))

(declare-fun b!57500 () Bool)

(declare-fun e!37892 () Bool)

(assert (=> b!57500 (= e!37892 e!37890)))

(declare-fun c!7110 () Bool)

(assert (=> b!57500 (= c!7110 ((_ is MissingVacant!229) lt!22834))))

(declare-fun b!57501 () Bool)

(assert (=> b!57501 (= e!37893 (not call!4171))))

(declare-fun b!57502 () Bool)

(assert (=> b!57502 (= e!37891 (not call!4171))))

(declare-fun b!57503 () Bool)

(declare-fun res!32168 () Bool)

(assert (=> b!57503 (=> (not res!32168) (not e!37893))))

(declare-fun call!4170 () Bool)

(assert (=> b!57503 (= res!32168 call!4170)))

(assert (=> b!57503 (= e!37890 e!37893)))

(declare-fun d!10585 () Bool)

(assert (=> d!10585 e!37892))

(declare-fun c!7111 () Bool)

(assert (=> d!10585 (= c!7111 ((_ is MissingZero!229) lt!22834))))

(assert (=> d!10585 (= lt!22834 (seekEntryOrOpen!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(declare-fun lt!22835 () Unit!1484)

(declare-fun choose!298 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 64) Int) Unit!1484)

(assert (=> d!10585 (= lt!22835 (choose!298 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (defaultEntry!2021 newMap!16)))))

(assert (=> d!10585 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10585 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!14 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (defaultEntry!2021 newMap!16)) lt!22835)))

(declare-fun bm!4168 () Bool)

(assert (=> bm!4168 (= call!4170 (inRange!0 (ite c!7111 (index!3038 lt!22834) (index!3041 lt!22834)) (mask!5894 newMap!16)))))

(declare-fun b!57504 () Bool)

(assert (=> b!57504 (= e!37892 e!37891)))

(declare-fun res!32169 () Bool)

(assert (=> b!57504 (= res!32169 call!4170)))

(assert (=> b!57504 (=> (not res!32169) (not e!37891))))

(assert (= (and d!10585 c!7111) b!57504))

(assert (= (and d!10585 (not c!7111)) b!57500))

(assert (= (and b!57504 res!32169) b!57499))

(assert (= (and b!57499 res!32171) b!57502))

(assert (= (and b!57500 c!7110) b!57503))

(assert (= (and b!57500 (not c!7110)) b!57497))

(assert (= (and b!57503 res!32168) b!57498))

(assert (= (and b!57498 res!32170) b!57501))

(assert (= (or b!57504 b!57503) bm!4168))

(assert (= (or b!57502 b!57501) bm!4167))

(assert (=> bm!4167 m!47913))

(assert (=> bm!4167 m!48109))

(assert (=> d!10585 m!47913))

(assert (=> d!10585 m!48067))

(assert (=> d!10585 m!47913))

(declare-fun m!48333 () Bool)

(assert (=> d!10585 m!48333))

(declare-fun m!48335 () Bool)

(assert (=> d!10585 m!48335))

(declare-fun m!48337 () Bool)

(assert (=> b!57499 m!48337))

(declare-fun m!48339 () Bool)

(assert (=> b!57498 m!48339))

(declare-fun m!48341 () Bool)

(assert (=> bm!4168 m!48341))

(assert (=> bm!4121 d!10585))

(declare-fun b!57505 () Bool)

(declare-fun e!37896 () Bool)

(declare-fun call!4172 () Bool)

(assert (=> b!57505 (= e!37896 call!4172)))

(declare-fun d!10587 () Bool)

(declare-fun res!32173 () Bool)

(declare-fun e!37897 () Bool)

(assert (=> d!10587 (=> res!32173 e!37897)))

(assert (=> d!10587 (= res!32173 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> d!10587 (= (arrayNoDuplicates!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427)) e!37897)))

(declare-fun b!57506 () Bool)

(declare-fun e!37895 () Bool)

(assert (=> b!57506 (= e!37895 (contains!680 (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!57507 () Bool)

(declare-fun e!37894 () Bool)

(assert (=> b!57507 (= e!37894 e!37896)))

(declare-fun c!7112 () Bool)

(assert (=> b!57507 (= c!7112 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!57508 () Bool)

(assert (=> b!57508 (= e!37896 call!4172)))

(declare-fun b!57509 () Bool)

(assert (=> b!57509 (= e!37897 e!37894)))

(declare-fun res!32172 () Bool)

(assert (=> b!57509 (=> (not res!32172) (not e!37894))))

(assert (=> b!57509 (= res!32172 (not e!37895))))

(declare-fun res!32174 () Bool)

(assert (=> b!57509 (=> (not res!32174) (not e!37895))))

(assert (=> b!57509 (= res!32174 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!4169 () Bool)

(assert (=> bm!4169 (= call!4172 (arrayNoDuplicates!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!7112 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427)) (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427))))))

(assert (= (and d!10587 (not res!32173)) b!57509))

(assert (= (and b!57509 res!32174) b!57506))

(assert (= (and b!57509 res!32172) b!57507))

(assert (= (and b!57507 c!7112) b!57508))

(assert (= (and b!57507 (not c!7112)) b!57505))

(assert (= (or b!57508 b!57505) bm!4169))

(declare-fun m!48343 () Bool)

(assert (=> b!57506 m!48343))

(assert (=> b!57506 m!48343))

(declare-fun m!48345 () Bool)

(assert (=> b!57506 m!48345))

(assert (=> b!57507 m!48343))

(assert (=> b!57507 m!48343))

(declare-fun m!48347 () Bool)

(assert (=> b!57507 m!48347))

(assert (=> b!57509 m!48343))

(assert (=> b!57509 m!48343))

(assert (=> b!57509 m!48347))

(assert (=> bm!4169 m!48343))

(declare-fun m!48349 () Bool)

(assert (=> bm!4169 m!48349))

(assert (=> bm!4137 d!10587))

(assert (=> b!57383 d!10539))

(declare-fun b!57511 () Bool)

(declare-fun e!37900 () ListLongMap!1349)

(declare-fun call!4175 () ListLongMap!1349)

(assert (=> b!57511 (= e!37900 call!4175)))

(declare-fun b!57512 () Bool)

(declare-fun e!37904 () Bool)

(assert (=> b!57512 (= e!37904 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!57513 () Bool)

(declare-fun e!37908 () Bool)

(declare-fun e!37905 () Bool)

(assert (=> b!57513 (= e!37908 e!37905)))

(declare-fun res!32175 () Bool)

(declare-fun call!4174 () Bool)

(assert (=> b!57513 (= res!32175 call!4174)))

(assert (=> b!57513 (=> (not res!32175) (not e!37905))))

(declare-fun b!57514 () Bool)

(declare-fun e!37906 () ListLongMap!1349)

(declare-fun e!37909 () ListLongMap!1349)

(assert (=> b!57514 (= e!37906 e!37909)))

(declare-fun c!7114 () Bool)

(assert (=> b!57514 (= c!7114 (and (not (= (bvand (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!7115 () Bool)

(declare-fun b!57515 () Bool)

(assert (=> b!57515 (= c!7115 (and (not (= (bvand (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!57515 (= e!37909 e!37900)))

(declare-fun bm!4170 () Bool)

(declare-fun call!4176 () ListLongMap!1349)

(declare-fun call!4178 () ListLongMap!1349)

(assert (=> bm!4170 (= call!4176 call!4178)))

(declare-fun b!57516 () Bool)

(declare-fun e!37899 () Bool)

(declare-fun e!37898 () Bool)

(assert (=> b!57516 (= e!37899 e!37898)))

(declare-fun res!32181 () Bool)

(assert (=> b!57516 (=> (not res!32181) (not e!37898))))

(declare-fun lt!22857 () ListLongMap!1349)

(assert (=> b!57516 (= res!32181 (contains!677 lt!22857 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!57516 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57517 () Bool)

(declare-fun e!37907 () Unit!1484)

(declare-fun Unit!1500 () Unit!1484)

(assert (=> b!57517 (= e!37907 Unit!1500)))

(declare-fun call!4179 () ListLongMap!1349)

(declare-fun b!57518 () Bool)

(assert (=> b!57518 (= e!37906 (+!80 call!4179 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))))))

(declare-fun d!10589 () Bool)

(declare-fun e!37901 () Bool)

(assert (=> d!10589 e!37901))

(declare-fun res!32179 () Bool)

(assert (=> d!10589 (=> (not res!32179) (not e!37901))))

(assert (=> d!10589 (= res!32179 (or (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))))

(declare-fun lt!22851 () ListLongMap!1349)

(assert (=> d!10589 (= lt!22857 lt!22851)))

(declare-fun lt!22849 () Unit!1484)

(assert (=> d!10589 (= lt!22849 e!37907)))

(declare-fun c!7117 () Bool)

(declare-fun e!37910 () Bool)

(assert (=> d!10589 (= c!7117 e!37910)))

(declare-fun res!32183 () Bool)

(assert (=> d!10589 (=> (not res!32183) (not e!37910))))

(assert (=> d!10589 (= res!32183 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10589 (= lt!22851 e!37906)))

(declare-fun c!7116 () Bool)

(assert (=> d!10589 (= c!7116 (and (not (= (bvand (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!10589 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10589 (= (getCurrentListMap!387 (_keys!3640 newMap!16) (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))) (mask!5894 newMap!16) (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) lt!22857)))

(declare-fun b!57510 () Bool)

(assert (=> b!57510 (= e!37901 e!37908)))

(declare-fun c!7118 () Bool)

(assert (=> b!57510 (= c!7118 (not (= (bvand (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!4171 () Bool)

(declare-fun call!4173 () ListLongMap!1349)

(assert (=> bm!4171 (= call!4173 call!4179)))

(declare-fun bm!4172 () Bool)

(assert (=> bm!4172 (= call!4174 (contains!677 lt!22857 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57519 () Bool)

(assert (=> b!57519 (= e!37909 call!4173)))

(declare-fun bm!4173 () Bool)

(assert (=> bm!4173 (= call!4175 call!4176)))

(declare-fun b!57520 () Bool)

(declare-fun res!32178 () Bool)

(assert (=> b!57520 (=> (not res!32178) (not e!37901))))

(assert (=> b!57520 (= res!32178 e!37899)))

(declare-fun res!32176 () Bool)

(assert (=> b!57520 (=> res!32176 e!37899)))

(assert (=> b!57520 (= res!32176 (not e!37904))))

(declare-fun res!32180 () Bool)

(assert (=> b!57520 (=> (not res!32180) (not e!37904))))

(assert (=> b!57520 (= res!32180 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57521 () Bool)

(declare-fun e!37903 () Bool)

(declare-fun e!37902 () Bool)

(assert (=> b!57521 (= e!37903 e!37902)))

(declare-fun res!32182 () Bool)

(declare-fun call!4177 () Bool)

(assert (=> b!57521 (= res!32182 call!4177)))

(assert (=> b!57521 (=> (not res!32182) (not e!37902))))

(declare-fun bm!4174 () Bool)

(assert (=> bm!4174 (= call!4179 (+!80 (ite c!7116 call!4178 (ite c!7114 call!4176 call!4175)) (ite (or c!7116 c!7114) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(declare-fun b!57522 () Bool)

(assert (=> b!57522 (= e!37898 (= (apply!65 lt!22857 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (get!1065 (select (arr!1763 (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1993 (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))))))))

(assert (=> b!57522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57523 () Bool)

(assert (=> b!57523 (= e!37902 (= (apply!65 lt!22857 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))))

(declare-fun b!57524 () Bool)

(declare-fun res!32177 () Bool)

(assert (=> b!57524 (=> (not res!32177) (not e!37901))))

(assert (=> b!57524 (= res!32177 e!37903)))

(declare-fun c!7113 () Bool)

(assert (=> b!57524 (= c!7113 (not (= (bvand (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!57525 () Bool)

(assert (=> b!57525 (= e!37900 call!4173)))

(declare-fun b!57526 () Bool)

(assert (=> b!57526 (= e!37903 (not call!4177))))

(declare-fun b!57527 () Bool)

(assert (=> b!57527 (= e!37908 (not call!4174))))

(declare-fun b!57528 () Bool)

(declare-fun lt!22841 () Unit!1484)

(assert (=> b!57528 (= e!37907 lt!22841)))

(declare-fun lt!22847 () ListLongMap!1349)

(assert (=> b!57528 (= lt!22847 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))) (mask!5894 newMap!16) (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!22842 () (_ BitVec 64))

(assert (=> b!57528 (= lt!22842 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22840 () (_ BitVec 64))

(assert (=> b!57528 (= lt!22840 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!22844 () Unit!1484)

(assert (=> b!57528 (= lt!22844 (addStillContains!41 lt!22847 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) lt!22840))))

(assert (=> b!57528 (contains!677 (+!80 lt!22847 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))) lt!22840)))

(declare-fun lt!22854 () Unit!1484)

(assert (=> b!57528 (= lt!22854 lt!22844)))

(declare-fun lt!22838 () ListLongMap!1349)

(assert (=> b!57528 (= lt!22838 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))) (mask!5894 newMap!16) (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!22839 () (_ BitVec 64))

(assert (=> b!57528 (= lt!22839 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22836 () (_ BitVec 64))

(assert (=> b!57528 (= lt!22836 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!22852 () Unit!1484)

(assert (=> b!57528 (= lt!22852 (addApplyDifferent!41 lt!22838 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) lt!22836))))

(assert (=> b!57528 (= (apply!65 (+!80 lt!22838 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) lt!22836) (apply!65 lt!22838 lt!22836))))

(declare-fun lt!22837 () Unit!1484)

(assert (=> b!57528 (= lt!22837 lt!22852)))

(declare-fun lt!22843 () ListLongMap!1349)

(assert (=> b!57528 (= lt!22843 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))) (mask!5894 newMap!16) (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!22850 () (_ BitVec 64))

(assert (=> b!57528 (= lt!22850 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22855 () (_ BitVec 64))

(assert (=> b!57528 (= lt!22855 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!22846 () Unit!1484)

(assert (=> b!57528 (= lt!22846 (addApplyDifferent!41 lt!22843 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) lt!22855))))

(assert (=> b!57528 (= (apply!65 (+!80 lt!22843 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))) lt!22855) (apply!65 lt!22843 lt!22855))))

(declare-fun lt!22848 () Unit!1484)

(assert (=> b!57528 (= lt!22848 lt!22846)))

(declare-fun lt!22845 () ListLongMap!1349)

(assert (=> b!57528 (= lt!22845 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))) (mask!5894 newMap!16) (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!22856 () (_ BitVec 64))

(assert (=> b!57528 (= lt!22856 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22853 () (_ BitVec 64))

(assert (=> b!57528 (= lt!22853 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!57528 (= lt!22841 (addApplyDifferent!41 lt!22845 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) lt!22853))))

(assert (=> b!57528 (= (apply!65 (+!80 lt!22845 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) lt!22853) (apply!65 lt!22845 lt!22853))))

(declare-fun bm!4175 () Bool)

(assert (=> bm!4175 (= call!4177 (contains!677 lt!22857 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57529 () Bool)

(assert (=> b!57529 (= e!37910 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!4176 () Bool)

(assert (=> bm!4176 (= call!4178 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))) (mask!5894 newMap!16) (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun b!57530 () Bool)

(assert (=> b!57530 (= e!37905 (= (apply!65 lt!22857 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))

(assert (= (and d!10589 c!7116) b!57518))

(assert (= (and d!10589 (not c!7116)) b!57514))

(assert (= (and b!57514 c!7114) b!57519))

(assert (= (and b!57514 (not c!7114)) b!57515))

(assert (= (and b!57515 c!7115) b!57525))

(assert (= (and b!57515 (not c!7115)) b!57511))

(assert (= (or b!57525 b!57511) bm!4173))

(assert (= (or b!57519 bm!4173) bm!4170))

(assert (= (or b!57519 b!57525) bm!4171))

(assert (= (or b!57518 bm!4170) bm!4176))

(assert (= (or b!57518 bm!4171) bm!4174))

(assert (= (and d!10589 res!32183) b!57529))

(assert (= (and d!10589 c!7117) b!57528))

(assert (= (and d!10589 (not c!7117)) b!57517))

(assert (= (and d!10589 res!32179) b!57520))

(assert (= (and b!57520 res!32180) b!57512))

(assert (= (and b!57520 (not res!32176)) b!57516))

(assert (= (and b!57516 res!32181) b!57522))

(assert (= (and b!57520 res!32178) b!57524))

(assert (= (and b!57524 c!7113) b!57521))

(assert (= (and b!57524 (not c!7113)) b!57526))

(assert (= (and b!57521 res!32182) b!57523))

(assert (= (or b!57521 b!57526) bm!4175))

(assert (= (and b!57524 res!32177) b!57510))

(assert (= (and b!57510 c!7118) b!57513))

(assert (= (and b!57510 (not c!7118)) b!57527))

(assert (= (and b!57513 res!32175) b!57530))

(assert (= (or b!57513 b!57527) bm!4172))

(declare-fun b_lambda!2509 () Bool)

(assert (=> (not b_lambda!2509) (not b!57522)))

(declare-fun t!4758 () Bool)

(declare-fun tb!1301 () Bool)

(assert (=> (and b!57026 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16)) t!4758) tb!1301))

(declare-fun result!2353 () Bool)

(assert (=> tb!1301 (= result!2353 tp_is_empty!2389)))

(assert (=> b!57522 t!4758))

(declare-fun b_and!3473 () Bool)

(assert (= b_and!3469 (and (=> t!4758 result!2353) b_and!3473)))

(declare-fun t!4760 () Bool)

(declare-fun tb!1303 () Bool)

(assert (=> (and b!57016 (= (defaultEntry!2021 newMap!16) (defaultEntry!2021 newMap!16)) t!4760) tb!1303))

(declare-fun result!2355 () Bool)

(assert (= result!2355 result!2353))

(assert (=> b!57522 t!4760))

(declare-fun b_and!3475 () Bool)

(assert (= b_and!3471 (and (=> t!4760 result!2355) b_and!3475)))

(declare-fun m!48351 () Bool)

(assert (=> b!57522 m!48351))

(declare-fun m!48353 () Bool)

(assert (=> b!57522 m!48353))

(declare-fun m!48355 () Bool)

(assert (=> b!57522 m!48355))

(assert (=> b!57522 m!48351))

(assert (=> b!57522 m!48317))

(declare-fun m!48357 () Bool)

(assert (=> b!57522 m!48357))

(assert (=> b!57522 m!48317))

(assert (=> b!57522 m!48353))

(declare-fun m!48359 () Bool)

(assert (=> b!57518 m!48359))

(declare-fun m!48361 () Bool)

(assert (=> bm!4174 m!48361))

(assert (=> b!57516 m!48317))

(assert (=> b!57516 m!48317))

(declare-fun m!48363 () Bool)

(assert (=> b!57516 m!48363))

(declare-fun m!48365 () Bool)

(assert (=> b!57530 m!48365))

(declare-fun m!48367 () Bool)

(assert (=> bm!4172 m!48367))

(declare-fun m!48369 () Bool)

(assert (=> bm!4175 m!48369))

(assert (=> b!57528 m!48317))

(declare-fun m!48371 () Bool)

(assert (=> b!57528 m!48371))

(declare-fun m!48373 () Bool)

(assert (=> b!57528 m!48373))

(declare-fun m!48375 () Bool)

(assert (=> b!57528 m!48375))

(declare-fun m!48377 () Bool)

(assert (=> b!57528 m!48377))

(declare-fun m!48379 () Bool)

(assert (=> b!57528 m!48379))

(declare-fun m!48381 () Bool)

(assert (=> b!57528 m!48381))

(declare-fun m!48383 () Bool)

(assert (=> b!57528 m!48383))

(declare-fun m!48385 () Bool)

(assert (=> b!57528 m!48385))

(declare-fun m!48387 () Bool)

(assert (=> b!57528 m!48387))

(assert (=> b!57528 m!48379))

(declare-fun m!48389 () Bool)

(assert (=> b!57528 m!48389))

(assert (=> b!57528 m!48383))

(declare-fun m!48391 () Bool)

(assert (=> b!57528 m!48391))

(declare-fun m!48393 () Bool)

(assert (=> b!57528 m!48393))

(declare-fun m!48395 () Bool)

(assert (=> b!57528 m!48395))

(declare-fun m!48397 () Bool)

(assert (=> b!57528 m!48397))

(declare-fun m!48399 () Bool)

(assert (=> b!57528 m!48399))

(assert (=> b!57528 m!48385))

(assert (=> b!57528 m!48393))

(declare-fun m!48401 () Bool)

(assert (=> b!57528 m!48401))

(declare-fun m!48403 () Bool)

(assert (=> b!57523 m!48403))

(assert (=> bm!4176 m!48399))

(assert (=> d!10589 m!48335))

(assert (=> b!57512 m!48317))

(assert (=> b!57512 m!48317))

(assert (=> b!57512 m!48321))

(assert (=> b!57529 m!48317))

(assert (=> b!57529 m!48317))

(assert (=> b!57529 m!48321))

(assert (=> bm!4128 d!10589))

(declare-fun d!10591 () Bool)

(declare-fun res!32184 () Bool)

(declare-fun e!37911 () Bool)

(assert (=> d!10591 (=> res!32184 e!37911)))

(assert (=> d!10591 (= res!32184 (= (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!10591 (= (arrayContainsKey!0 (_keys!3640 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b00000000000000000000000000000000) e!37911)))

(declare-fun b!57531 () Bool)

(declare-fun e!37912 () Bool)

(assert (=> b!57531 (= e!37911 e!37912)))

(declare-fun res!32185 () Bool)

(assert (=> b!57531 (=> (not res!32185) (not e!37912))))

(assert (=> b!57531 (= res!32185 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57532 () Bool)

(assert (=> b!57532 (= e!37912 (arrayContainsKey!0 (_keys!3640 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10591 (not res!32184)) b!57531))

(assert (= (and b!57531 res!32185) b!57532))

(assert (=> d!10591 m!48317))

(assert (=> b!57532 m!47913))

(declare-fun m!48405 () Bool)

(assert (=> b!57532 m!48405))

(assert (=> bm!4120 d!10591))

(declare-fun d!10593 () Bool)

(assert (=> d!10593 (= (apply!65 lt!22766 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1070 (getValueByKey!121 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2487 () Bool)

(assert (= bs!2487 d!10593))

(declare-fun m!48407 () Bool)

(assert (=> bs!2487 m!48407))

(assert (=> bs!2487 m!48407))

(declare-fun m!48409 () Bool)

(assert (=> bs!2487 m!48409))

(assert (=> b!57384 d!10593))

(declare-fun b!57534 () Bool)

(declare-fun e!37915 () ListLongMap!1349)

(declare-fun call!4182 () ListLongMap!1349)

(assert (=> b!57534 (= e!37915 call!4182)))

(declare-fun b!57535 () Bool)

(declare-fun e!37919 () Bool)

(assert (=> b!57535 (= e!37919 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!57536 () Bool)

(declare-fun e!37923 () Bool)

(declare-fun e!37920 () Bool)

(assert (=> b!57536 (= e!37923 e!37920)))

(declare-fun res!32186 () Bool)

(declare-fun call!4181 () Bool)

(assert (=> b!57536 (= res!32186 call!4181)))

(assert (=> b!57536 (=> (not res!32186) (not e!37920))))

(declare-fun b!57537 () Bool)

(declare-fun e!37921 () ListLongMap!1349)

(declare-fun e!37924 () ListLongMap!1349)

(assert (=> b!57537 (= e!37921 e!37924)))

(declare-fun c!7120 () Bool)

(assert (=> b!57537 (= c!7120 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!57538 () Bool)

(declare-fun c!7121 () Bool)

(assert (=> b!57538 (= c!7121 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!57538 (= e!37924 e!37915)))

(declare-fun bm!4177 () Bool)

(declare-fun call!4183 () ListLongMap!1349)

(declare-fun call!4185 () ListLongMap!1349)

(assert (=> bm!4177 (= call!4183 call!4185)))

(declare-fun b!57539 () Bool)

(declare-fun e!37914 () Bool)

(declare-fun e!37913 () Bool)

(assert (=> b!57539 (= e!37914 e!37913)))

(declare-fun res!32192 () Bool)

(assert (=> b!57539 (=> (not res!32192) (not e!37913))))

(declare-fun lt!22879 () ListLongMap!1349)

(assert (=> b!57539 (= res!32192 (contains!677 lt!22879 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!57539 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57540 () Bool)

(declare-fun e!37922 () Unit!1484)

(declare-fun Unit!1501 () Unit!1484)

(assert (=> b!57540 (= e!37922 Unit!1501)))

(declare-fun b!57541 () Bool)

(declare-fun call!4186 () ListLongMap!1349)

(assert (=> b!57541 (= e!37921 (+!80 call!4186 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))

(declare-fun d!10595 () Bool)

(declare-fun e!37916 () Bool)

(assert (=> d!10595 e!37916))

(declare-fun res!32190 () Bool)

(assert (=> d!10595 (=> (not res!32190) (not e!37916))))

(assert (=> d!10595 (= res!32190 (or (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))))

(declare-fun lt!22873 () ListLongMap!1349)

(assert (=> d!10595 (= lt!22879 lt!22873)))

(declare-fun lt!22871 () Unit!1484)

(assert (=> d!10595 (= lt!22871 e!37922)))

(declare-fun c!7123 () Bool)

(declare-fun e!37925 () Bool)

(assert (=> d!10595 (= c!7123 e!37925)))

(declare-fun res!32194 () Bool)

(assert (=> d!10595 (=> (not res!32194) (not e!37925))))

(assert (=> d!10595 (= res!32194 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10595 (= lt!22873 e!37921)))

(declare-fun c!7122 () Bool)

(assert (=> d!10595 (= c!7122 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!10595 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10595 (= (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) lt!22879)))

(declare-fun b!57533 () Bool)

(assert (=> b!57533 (= e!37916 e!37923)))

(declare-fun c!7124 () Bool)

(assert (=> b!57533 (= c!7124 (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!4178 () Bool)

(declare-fun call!4180 () ListLongMap!1349)

(assert (=> bm!4178 (= call!4180 call!4186)))

(declare-fun bm!4179 () Bool)

(assert (=> bm!4179 (= call!4181 (contains!677 lt!22879 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57542 () Bool)

(assert (=> b!57542 (= e!37924 call!4180)))

(declare-fun bm!4180 () Bool)

(assert (=> bm!4180 (= call!4182 call!4183)))

(declare-fun b!57543 () Bool)

(declare-fun res!32189 () Bool)

(assert (=> b!57543 (=> (not res!32189) (not e!37916))))

(assert (=> b!57543 (= res!32189 e!37914)))

(declare-fun res!32187 () Bool)

(assert (=> b!57543 (=> res!32187 e!37914)))

(assert (=> b!57543 (= res!32187 (not e!37919))))

(declare-fun res!32191 () Bool)

(assert (=> b!57543 (=> (not res!32191) (not e!37919))))

(assert (=> b!57543 (= res!32191 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57544 () Bool)

(declare-fun e!37918 () Bool)

(declare-fun e!37917 () Bool)

(assert (=> b!57544 (= e!37918 e!37917)))

(declare-fun res!32193 () Bool)

(declare-fun call!4184 () Bool)

(assert (=> b!57544 (= res!32193 call!4184)))

(assert (=> b!57544 (=> (not res!32193) (not e!37917))))

(declare-fun bm!4181 () Bool)

(assert (=> bm!4181 (= call!4186 (+!80 (ite c!7122 call!4185 (ite c!7120 call!4183 call!4182)) (ite (or c!7122 c!7120) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(declare-fun b!57545 () Bool)

(assert (=> b!57545 (= e!37913 (= (apply!65 lt!22879 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (get!1065 (select (arr!1763 (_values!2004 newMap!16)) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1993 (_values!2004 newMap!16))))))

(assert (=> b!57545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57546 () Bool)

(assert (=> b!57546 (= e!37917 (= (apply!65 lt!22879 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1939 newMap!16)))))

(declare-fun b!57547 () Bool)

(declare-fun res!32188 () Bool)

(assert (=> b!57547 (=> (not res!32188) (not e!37916))))

(assert (=> b!57547 (= res!32188 e!37918)))

(declare-fun c!7119 () Bool)

(assert (=> b!57547 (= c!7119 (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!57548 () Bool)

(assert (=> b!57548 (= e!37915 call!4180)))

(declare-fun b!57549 () Bool)

(assert (=> b!57549 (= e!37918 (not call!4184))))

(declare-fun b!57550 () Bool)

(assert (=> b!57550 (= e!37923 (not call!4181))))

(declare-fun b!57551 () Bool)

(declare-fun lt!22863 () Unit!1484)

(assert (=> b!57551 (= e!37922 lt!22863)))

(declare-fun lt!22869 () ListLongMap!1349)

(assert (=> b!57551 (= lt!22869 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!22864 () (_ BitVec 64))

(assert (=> b!57551 (= lt!22864 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22862 () (_ BitVec 64))

(assert (=> b!57551 (= lt!22862 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!22866 () Unit!1484)

(assert (=> b!57551 (= lt!22866 (addStillContains!41 lt!22869 lt!22864 (zeroValue!1939 newMap!16) lt!22862))))

(assert (=> b!57551 (contains!677 (+!80 lt!22869 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16))) lt!22862)))

(declare-fun lt!22876 () Unit!1484)

(assert (=> b!57551 (= lt!22876 lt!22866)))

(declare-fun lt!22860 () ListLongMap!1349)

(assert (=> b!57551 (= lt!22860 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!22861 () (_ BitVec 64))

(assert (=> b!57551 (= lt!22861 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22858 () (_ BitVec 64))

(assert (=> b!57551 (= lt!22858 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!22874 () Unit!1484)

(assert (=> b!57551 (= lt!22874 (addApplyDifferent!41 lt!22860 lt!22861 (minValue!1939 newMap!16) lt!22858))))

(assert (=> b!57551 (= (apply!65 (+!80 lt!22860 (tuple2!2025 lt!22861 (minValue!1939 newMap!16))) lt!22858) (apply!65 lt!22860 lt!22858))))

(declare-fun lt!22859 () Unit!1484)

(assert (=> b!57551 (= lt!22859 lt!22874)))

(declare-fun lt!22865 () ListLongMap!1349)

(assert (=> b!57551 (= lt!22865 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!22872 () (_ BitVec 64))

(assert (=> b!57551 (= lt!22872 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22877 () (_ BitVec 64))

(assert (=> b!57551 (= lt!22877 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!22868 () Unit!1484)

(assert (=> b!57551 (= lt!22868 (addApplyDifferent!41 lt!22865 lt!22872 (zeroValue!1939 newMap!16) lt!22877))))

(assert (=> b!57551 (= (apply!65 (+!80 lt!22865 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16))) lt!22877) (apply!65 lt!22865 lt!22877))))

(declare-fun lt!22870 () Unit!1484)

(assert (=> b!57551 (= lt!22870 lt!22868)))

(declare-fun lt!22867 () ListLongMap!1349)

(assert (=> b!57551 (= lt!22867 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!22878 () (_ BitVec 64))

(assert (=> b!57551 (= lt!22878 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22875 () (_ BitVec 64))

(assert (=> b!57551 (= lt!22875 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!57551 (= lt!22863 (addApplyDifferent!41 lt!22867 lt!22878 (minValue!1939 newMap!16) lt!22875))))

(assert (=> b!57551 (= (apply!65 (+!80 lt!22867 (tuple2!2025 lt!22878 (minValue!1939 newMap!16))) lt!22875) (apply!65 lt!22867 lt!22875))))

(declare-fun bm!4182 () Bool)

(assert (=> bm!4182 (= call!4184 (contains!677 lt!22879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57552 () Bool)

(assert (=> b!57552 (= e!37925 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!4183 () Bool)

(assert (=> bm!4183 (= call!4185 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun b!57553 () Bool)

(assert (=> b!57553 (= e!37920 (= (apply!65 lt!22879 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1939 newMap!16)))))

(assert (= (and d!10595 c!7122) b!57541))

(assert (= (and d!10595 (not c!7122)) b!57537))

(assert (= (and b!57537 c!7120) b!57542))

(assert (= (and b!57537 (not c!7120)) b!57538))

(assert (= (and b!57538 c!7121) b!57548))

(assert (= (and b!57538 (not c!7121)) b!57534))

(assert (= (or b!57548 b!57534) bm!4180))

(assert (= (or b!57542 bm!4180) bm!4177))

(assert (= (or b!57542 b!57548) bm!4178))

(assert (= (or b!57541 bm!4177) bm!4183))

(assert (= (or b!57541 bm!4178) bm!4181))

(assert (= (and d!10595 res!32194) b!57552))

(assert (= (and d!10595 c!7123) b!57551))

(assert (= (and d!10595 (not c!7123)) b!57540))

(assert (= (and d!10595 res!32190) b!57543))

(assert (= (and b!57543 res!32191) b!57535))

(assert (= (and b!57543 (not res!32187)) b!57539))

(assert (= (and b!57539 res!32192) b!57545))

(assert (= (and b!57543 res!32189) b!57547))

(assert (= (and b!57547 c!7119) b!57544))

(assert (= (and b!57547 (not c!7119)) b!57549))

(assert (= (and b!57544 res!32193) b!57546))

(assert (= (or b!57544 b!57549) bm!4182))

(assert (= (and b!57547 res!32188) b!57533))

(assert (= (and b!57533 c!7124) b!57536))

(assert (= (and b!57533 (not c!7124)) b!57550))

(assert (= (and b!57536 res!32186) b!57553))

(assert (= (or b!57536 b!57550) bm!4179))

(declare-fun b_lambda!2511 () Bool)

(assert (=> (not b_lambda!2511) (not b!57545)))

(assert (=> b!57545 t!4758))

(declare-fun b_and!3477 () Bool)

(assert (= b_and!3473 (and (=> t!4758 result!2353) b_and!3477)))

(assert (=> b!57545 t!4760))

(declare-fun b_and!3479 () Bool)

(assert (= b_and!3475 (and (=> t!4760 result!2355) b_and!3479)))

(declare-fun m!48411 () Bool)

(assert (=> b!57545 m!48411))

(assert (=> b!57545 m!48353))

(declare-fun m!48413 () Bool)

(assert (=> b!57545 m!48413))

(assert (=> b!57545 m!48411))

(assert (=> b!57545 m!48317))

(declare-fun m!48415 () Bool)

(assert (=> b!57545 m!48415))

(assert (=> b!57545 m!48317))

(assert (=> b!57545 m!48353))

(declare-fun m!48417 () Bool)

(assert (=> b!57541 m!48417))

(declare-fun m!48419 () Bool)

(assert (=> bm!4181 m!48419))

(assert (=> b!57539 m!48317))

(assert (=> b!57539 m!48317))

(declare-fun m!48421 () Bool)

(assert (=> b!57539 m!48421))

(declare-fun m!48423 () Bool)

(assert (=> b!57553 m!48423))

(declare-fun m!48425 () Bool)

(assert (=> bm!4179 m!48425))

(declare-fun m!48427 () Bool)

(assert (=> bm!4182 m!48427))

(assert (=> b!57551 m!48317))

(declare-fun m!48429 () Bool)

(assert (=> b!57551 m!48429))

(declare-fun m!48431 () Bool)

(assert (=> b!57551 m!48431))

(declare-fun m!48433 () Bool)

(assert (=> b!57551 m!48433))

(declare-fun m!48435 () Bool)

(assert (=> b!57551 m!48435))

(declare-fun m!48437 () Bool)

(assert (=> b!57551 m!48437))

(declare-fun m!48439 () Bool)

(assert (=> b!57551 m!48439))

(declare-fun m!48441 () Bool)

(assert (=> b!57551 m!48441))

(declare-fun m!48443 () Bool)

(assert (=> b!57551 m!48443))

(declare-fun m!48445 () Bool)

(assert (=> b!57551 m!48445))

(assert (=> b!57551 m!48437))

(declare-fun m!48447 () Bool)

(assert (=> b!57551 m!48447))

(assert (=> b!57551 m!48441))

(declare-fun m!48449 () Bool)

(assert (=> b!57551 m!48449))

(declare-fun m!48451 () Bool)

(assert (=> b!57551 m!48451))

(declare-fun m!48453 () Bool)

(assert (=> b!57551 m!48453))

(declare-fun m!48455 () Bool)

(assert (=> b!57551 m!48455))

(declare-fun m!48457 () Bool)

(assert (=> b!57551 m!48457))

(assert (=> b!57551 m!48443))

(assert (=> b!57551 m!48451))

(declare-fun m!48459 () Bool)

(assert (=> b!57551 m!48459))

(declare-fun m!48461 () Bool)

(assert (=> b!57546 m!48461))

(assert (=> bm!4183 m!48457))

(assert (=> d!10595 m!48335))

(assert (=> b!57535 m!48317))

(assert (=> b!57535 m!48317))

(assert (=> b!57535 m!48321))

(assert (=> b!57552 m!48317))

(assert (=> b!57552 m!48317))

(assert (=> b!57552 m!48321))

(assert (=> d!10525 d!10595))

(assert (=> b!57305 d!10519))

(declare-fun d!10597 () Bool)

(declare-fun e!37928 () Bool)

(assert (=> d!10597 e!37928))

(declare-fun c!7127 () Bool)

(assert (=> d!10597 (= c!7127 (and (not (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!10597 true))

(declare-fun _$29!63 () Unit!1484)

(assert (=> d!10597 (= (choose!294 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))) _$29!63)))

(declare-fun b!57558 () Bool)

(assert (=> b!57558 (= e!37928 (arrayContainsKey!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!57559 () Bool)

(assert (=> b!57559 (= e!37928 (ite (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!10597 c!7127) b!57558))

(assert (= (and d!10597 (not c!7127)) b!57559))

(assert (=> b!57558 m!47913))

(assert (=> b!57558 m!47917))

(assert (=> d!10521 d!10597))

(assert (=> d!10521 d!10507))

(assert (=> d!10517 d!10523))

(declare-fun d!10599 () Bool)

(assert (=> d!10599 (arrayNoDuplicates!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) from!355 Nil!1427)))

(assert (=> d!10599 true))

(declare-fun _$71!69 () Unit!1484)

(assert (=> d!10599 (= (choose!39 (_keys!3640 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!69)))

(declare-fun bs!2488 () Bool)

(assert (= bs!2488 d!10599))

(assert (=> bs!2488 m!47911))

(assert (=> d!10517 d!10599))

(assert (=> b!57168 d!10581))

(assert (=> b!57168 d!10583))

(declare-fun d!10601 () Bool)

(assert (=> d!10601 (= (+!80 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22674 (zeroValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!22882 () Unit!1484)

(declare-fun choose!299 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 V!2833 Int) Unit!1484)

(assert (=> d!10601 (= lt!22882 (choose!299 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) lt!22674 (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2021 newMap!16)))))

(assert (=> d!10601 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10601 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!14 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) lt!22674 (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2021 newMap!16)) lt!22882)))

(declare-fun bs!2489 () Bool)

(assert (= bs!2489 d!10601))

(assert (=> bs!2489 m!47939))

(declare-fun m!48463 () Bool)

(assert (=> bs!2489 m!48463))

(assert (=> bs!2489 m!47939))

(declare-fun m!48465 () Bool)

(assert (=> bs!2489 m!48465))

(assert (=> bs!2489 m!48335))

(assert (=> bs!2489 m!48101))

(declare-fun m!48467 () Bool)

(assert (=> bs!2489 m!48467))

(assert (=> bs!2489 m!48101))

(assert (=> b!57279 d!10601))

(declare-fun d!10603 () Bool)

(assert (=> d!10603 (= (get!1068 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2360 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> b!57293 d!10603))

(declare-fun d!10605 () Bool)

(assert (=> d!10605 (= (apply!65 lt!22766 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1070 (getValueByKey!121 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2490 () Bool)

(assert (= bs!2490 d!10605))

(declare-fun m!48469 () Bool)

(assert (=> bs!2490 m!48469))

(assert (=> bs!2490 m!48469))

(declare-fun m!48471 () Bool)

(assert (=> bs!2490 m!48471))

(assert (=> b!57377 d!10605))

(assert (=> d!10527 d!10507))

(declare-fun d!10607 () Bool)

(declare-fun res!32195 () Bool)

(declare-fun e!37929 () Bool)

(assert (=> d!10607 (=> (not res!32195) (not e!37929))))

(assert (=> d!10607 (= res!32195 (simpleValid!41 (_2!1022 lt!22687)))))

(assert (=> d!10607 (= (valid!250 (_2!1022 lt!22687)) e!37929)))

(declare-fun b!57560 () Bool)

(declare-fun res!32196 () Bool)

(assert (=> b!57560 (=> (not res!32196) (not e!37929))))

(assert (=> b!57560 (= res!32196 (= (arrayCountValidKeys!0 (_keys!3640 (_2!1022 lt!22687)) #b00000000000000000000000000000000 (size!1992 (_keys!3640 (_2!1022 lt!22687)))) (_size!354 (_2!1022 lt!22687))))))

(declare-fun b!57561 () Bool)

(declare-fun res!32197 () Bool)

(assert (=> b!57561 (=> (not res!32197) (not e!37929))))

(assert (=> b!57561 (= res!32197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3640 (_2!1022 lt!22687)) (mask!5894 (_2!1022 lt!22687))))))

(declare-fun b!57562 () Bool)

(assert (=> b!57562 (= e!37929 (arrayNoDuplicates!0 (_keys!3640 (_2!1022 lt!22687)) #b00000000000000000000000000000000 Nil!1427))))

(assert (= (and d!10607 res!32195) b!57560))

(assert (= (and b!57560 res!32196) b!57561))

(assert (= (and b!57561 res!32197) b!57562))

(declare-fun m!48473 () Bool)

(assert (=> d!10607 m!48473))

(declare-fun m!48475 () Bool)

(assert (=> b!57560 m!48475))

(declare-fun m!48477 () Bool)

(assert (=> b!57561 m!48477))

(declare-fun m!48479 () Bool)

(assert (=> b!57562 m!48479))

(assert (=> d!10511 d!10607))

(assert (=> d!10511 d!10505))

(declare-fun b!57574 () Bool)

(declare-fun e!37932 () Bool)

(assert (=> b!57574 (= e!37932 (and (bvsge (extraKeys!1912 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1912 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!354 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!10609 () Bool)

(declare-fun res!32206 () Bool)

(assert (=> d!10609 (=> (not res!32206) (not e!37932))))

(assert (=> d!10609 (= res!32206 (validMask!0 (mask!5894 newMap!16)))))

(assert (=> d!10609 (= (simpleValid!41 newMap!16) e!37932)))

(declare-fun b!57571 () Bool)

(declare-fun res!32208 () Bool)

(assert (=> b!57571 (=> (not res!32208) (not e!37932))))

(assert (=> b!57571 (= res!32208 (and (= (size!1993 (_values!2004 newMap!16)) (bvadd (mask!5894 newMap!16) #b00000000000000000000000000000001)) (= (size!1992 (_keys!3640 newMap!16)) (size!1993 (_values!2004 newMap!16))) (bvsge (_size!354 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!354 newMap!16) (bvadd (mask!5894 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!57572 () Bool)

(declare-fun res!32207 () Bool)

(assert (=> b!57572 (=> (not res!32207) (not e!37932))))

(declare-fun size!1998 (LongMapFixedSize!610) (_ BitVec 32))

(assert (=> b!57572 (= res!32207 (bvsge (size!1998 newMap!16) (_size!354 newMap!16)))))

(declare-fun b!57573 () Bool)

(declare-fun res!32209 () Bool)

(assert (=> b!57573 (=> (not res!32209) (not e!37932))))

(assert (=> b!57573 (= res!32209 (= (size!1998 newMap!16) (bvadd (_size!354 newMap!16) (bvsdiv (bvadd (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!10609 res!32206) b!57571))

(assert (= (and b!57571 res!32208) b!57572))

(assert (= (and b!57572 res!32207) b!57573))

(assert (= (and b!57573 res!32209) b!57574))

(assert (=> d!10609 m!48335))

(declare-fun m!48481 () Bool)

(assert (=> b!57572 m!48481))

(assert (=> b!57573 m!48481))

(assert (=> d!10505 d!10609))

(declare-fun d!10611 () Bool)

(declare-fun e!37933 () Bool)

(assert (=> d!10611 e!37933))

(declare-fun res!32211 () Bool)

(assert (=> d!10611 (=> (not res!32211) (not e!37933))))

(declare-fun lt!22885 () ListLongMap!1349)

(assert (=> d!10611 (= res!32211 (contains!677 lt!22885 (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun lt!22886 () List!1431)

(assert (=> d!10611 (= lt!22885 (ListLongMap!1350 lt!22886))))

(declare-fun lt!22883 () Unit!1484)

(declare-fun lt!22884 () Unit!1484)

(assert (=> d!10611 (= lt!22883 lt!22884)))

(assert (=> d!10611 (= (getValueByKey!121 lt!22886 (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) (Some!126 (_2!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!10611 (= lt!22884 (lemmaContainsTupThenGetReturnValue!41 lt!22886 (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (_2!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!10611 (= lt!22886 (insertStrictlySorted!44 (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157))) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (_2!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!10611 (= (+!80 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157)) (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22885)))

(declare-fun b!57575 () Bool)

(declare-fun res!32210 () Bool)

(assert (=> b!57575 (=> (not res!32210) (not e!37933))))

(assert (=> b!57575 (= res!32210 (= (getValueByKey!121 (toList!690 lt!22885) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) (Some!126 (_2!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun b!57576 () Bool)

(assert (=> b!57576 (= e!37933 (contains!681 (toList!690 lt!22885) (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (= (and d!10611 res!32211) b!57575))

(assert (= (and b!57575 res!32210) b!57576))

(declare-fun m!48483 () Bool)

(assert (=> d!10611 m!48483))

(declare-fun m!48485 () Bool)

(assert (=> d!10611 m!48485))

(declare-fun m!48487 () Bool)

(assert (=> d!10611 m!48487))

(declare-fun m!48489 () Bool)

(assert (=> d!10611 m!48489))

(declare-fun m!48491 () Bool)

(assert (=> b!57575 m!48491))

(declare-fun m!48493 () Bool)

(assert (=> b!57576 m!48493))

(assert (=> bm!4156 d!10611))

(declare-fun d!10613 () Bool)

(declare-fun e!37934 () Bool)

(assert (=> d!10613 e!37934))

(declare-fun res!32213 () Bool)

(assert (=> d!10613 (=> (not res!32213) (not e!37934))))

(declare-fun lt!22889 () ListLongMap!1349)

(assert (=> d!10613 (= res!32213 (contains!677 lt!22889 (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!22890 () List!1431)

(assert (=> d!10613 (= lt!22889 (ListLongMap!1350 lt!22890))))

(declare-fun lt!22887 () Unit!1484)

(declare-fun lt!22888 () Unit!1484)

(assert (=> d!10613 (= lt!22887 lt!22888)))

(assert (=> d!10613 (= (getValueByKey!121 lt!22890 (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!126 (_2!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!10613 (= lt!22888 (lemmaContainsTupThenGetReturnValue!41 lt!22890 (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!10613 (= lt!22890 (insertStrictlySorted!44 (toList!690 (ite c!7050 call!4124 call!4115)) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!10613 (= (+!80 (ite c!7050 call!4124 call!4115) (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!22889)))

(declare-fun b!57577 () Bool)

(declare-fun res!32212 () Bool)

(assert (=> b!57577 (=> (not res!32212) (not e!37934))))

(assert (=> b!57577 (= res!32212 (= (getValueByKey!121 (toList!690 lt!22889) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!126 (_2!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!57578 () Bool)

(assert (=> b!57578 (= e!37934 (contains!681 (toList!690 lt!22889) (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!10613 res!32213) b!57577))

(assert (= (and b!57577 res!32212) b!57578))

(declare-fun m!48495 () Bool)

(assert (=> d!10613 m!48495))

(declare-fun m!48497 () Bool)

(assert (=> d!10613 m!48497))

(declare-fun m!48499 () Bool)

(assert (=> d!10613 m!48499))

(declare-fun m!48501 () Bool)

(assert (=> d!10613 m!48501))

(declare-fun m!48503 () Bool)

(assert (=> b!57577 m!48503))

(declare-fun m!48505 () Bool)

(assert (=> b!57578 m!48505))

(assert (=> bm!4125 d!10613))

(assert (=> bm!4115 d!10525))

(declare-fun d!10615 () Bool)

(assert (=> d!10615 (= (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (and (not (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57319 d!10615))

(declare-fun lt!22898 () SeekEntryResult!229)

(declare-fun d!10617 () Bool)

(assert (=> d!10617 (and (or ((_ is Undefined!229) lt!22898) (not ((_ is Found!229) lt!22898)) (and (bvsge (index!3039 lt!22898) #b00000000000000000000000000000000) (bvslt (index!3039 lt!22898) (size!1992 (_keys!3640 newMap!16))))) (or ((_ is Undefined!229) lt!22898) ((_ is Found!229) lt!22898) (not ((_ is MissingZero!229) lt!22898)) (and (bvsge (index!3038 lt!22898) #b00000000000000000000000000000000) (bvslt (index!3038 lt!22898) (size!1992 (_keys!3640 newMap!16))))) (or ((_ is Undefined!229) lt!22898) ((_ is Found!229) lt!22898) ((_ is MissingZero!229) lt!22898) (not ((_ is MissingVacant!229) lt!22898)) (and (bvsge (index!3041 lt!22898) #b00000000000000000000000000000000) (bvslt (index!3041 lt!22898) (size!1992 (_keys!3640 newMap!16))))) (or ((_ is Undefined!229) lt!22898) (ite ((_ is Found!229) lt!22898) (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22898)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (ite ((_ is MissingZero!229) lt!22898) (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3038 lt!22898)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!229) lt!22898) (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3041 lt!22898)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!37943 () SeekEntryResult!229)

(assert (=> d!10617 (= lt!22898 e!37943)))

(declare-fun c!7135 () Bool)

(declare-fun lt!22897 () SeekEntryResult!229)

(assert (=> d!10617 (= c!7135 (and ((_ is Intermediate!229) lt!22897) (undefined!1041 lt!22897)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3683 (_ BitVec 32)) SeekEntryResult!229)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10617 (= lt!22897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (mask!5894 newMap!16)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(assert (=> d!10617 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10617 (= (seekEntryOrOpen!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)) lt!22898)))

(declare-fun b!57591 () Bool)

(declare-fun c!7134 () Bool)

(declare-fun lt!22899 () (_ BitVec 64))

(assert (=> b!57591 (= c!7134 (= lt!22899 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37941 () SeekEntryResult!229)

(declare-fun e!37942 () SeekEntryResult!229)

(assert (=> b!57591 (= e!37941 e!37942)))

(declare-fun b!57592 () Bool)

(assert (=> b!57592 (= e!37943 Undefined!229)))

(declare-fun b!57593 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3683 (_ BitVec 32)) SeekEntryResult!229)

(assert (=> b!57593 (= e!37942 (seekKeyOrZeroReturnVacant!0 (x!9860 lt!22897) (index!3040 lt!22897) (index!3040 lt!22897) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(declare-fun b!57594 () Bool)

(assert (=> b!57594 (= e!37943 e!37941)))

(assert (=> b!57594 (= lt!22899 (select (arr!1762 (_keys!3640 newMap!16)) (index!3040 lt!22897)))))

(declare-fun c!7136 () Bool)

(assert (=> b!57594 (= c!7136 (= lt!22899 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!57595 () Bool)

(assert (=> b!57595 (= e!37942 (MissingZero!229 (index!3040 lt!22897)))))

(declare-fun b!57596 () Bool)

(assert (=> b!57596 (= e!37941 (Found!229 (index!3040 lt!22897)))))

(assert (= (and d!10617 c!7135) b!57592))

(assert (= (and d!10617 (not c!7135)) b!57594))

(assert (= (and b!57594 c!7136) b!57596))

(assert (= (and b!57594 (not c!7136)) b!57591))

(assert (= (and b!57591 c!7134) b!57595))

(assert (= (and b!57591 (not c!7134)) b!57593))

(declare-fun m!48507 () Bool)

(assert (=> d!10617 m!48507))

(assert (=> d!10617 m!48335))

(declare-fun m!48509 () Bool)

(assert (=> d!10617 m!48509))

(declare-fun m!48511 () Bool)

(assert (=> d!10617 m!48511))

(assert (=> d!10617 m!47913))

(declare-fun m!48513 () Bool)

(assert (=> d!10617 m!48513))

(declare-fun m!48515 () Bool)

(assert (=> d!10617 m!48515))

(assert (=> d!10617 m!47913))

(assert (=> d!10617 m!48511))

(assert (=> b!57593 m!47913))

(declare-fun m!48517 () Bool)

(assert (=> b!57593 m!48517))

(declare-fun m!48519 () Bool)

(assert (=> b!57594 m!48519))

(assert (=> b!57262 d!10617))

(declare-fun d!10619 () Bool)

(declare-fun e!37944 () Bool)

(assert (=> d!10619 e!37944))

(declare-fun res!32214 () Bool)

(assert (=> d!10619 (=> res!32214 e!37944)))

(declare-fun lt!22900 () Bool)

(assert (=> d!10619 (= res!32214 (not lt!22900))))

(declare-fun lt!22903 () Bool)

(assert (=> d!10619 (= lt!22900 lt!22903)))

(declare-fun lt!22902 () Unit!1484)

(declare-fun e!37945 () Unit!1484)

(assert (=> d!10619 (= lt!22902 e!37945)))

(declare-fun c!7137 () Bool)

(assert (=> d!10619 (= c!7137 lt!22903)))

(assert (=> d!10619 (= lt!22903 (containsKey!125 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10619 (= (contains!677 lt!22766 #b0000000000000000000000000000000000000000000000000000000000000000) lt!22900)))

(declare-fun b!57597 () Bool)

(declare-fun lt!22901 () Unit!1484)

(assert (=> b!57597 (= e!37945 lt!22901)))

(assert (=> b!57597 (= lt!22901 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!57597 (isDefined!75 (getValueByKey!121 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57598 () Bool)

(declare-fun Unit!1502 () Unit!1484)

(assert (=> b!57598 (= e!37945 Unit!1502)))

(declare-fun b!57599 () Bool)

(assert (=> b!57599 (= e!37944 (isDefined!75 (getValueByKey!121 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10619 c!7137) b!57597))

(assert (= (and d!10619 (not c!7137)) b!57598))

(assert (= (and d!10619 (not res!32214)) b!57599))

(declare-fun m!48521 () Bool)

(assert (=> d!10619 m!48521))

(declare-fun m!48523 () Bool)

(assert (=> b!57597 m!48523))

(assert (=> b!57597 m!48469))

(assert (=> b!57597 m!48469))

(declare-fun m!48525 () Bool)

(assert (=> b!57597 m!48525))

(assert (=> b!57599 m!48469))

(assert (=> b!57599 m!48469))

(assert (=> b!57599 m!48525))

(assert (=> bm!4157 d!10619))

(assert (=> b!57321 d!10615))

(declare-fun b!57608 () Bool)

(declare-fun e!37952 () Bool)

(declare-fun call!4189 () Bool)

(assert (=> b!57608 (= e!37952 call!4189)))

(declare-fun b!57609 () Bool)

(declare-fun e!37954 () Bool)

(assert (=> b!57609 (= e!37954 e!37952)))

(declare-fun c!7140 () Bool)

(assert (=> b!57609 (= c!7140 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!57610 () Bool)

(declare-fun e!37953 () Bool)

(assert (=> b!57610 (= e!37953 call!4189)))

(declare-fun b!57611 () Bool)

(assert (=> b!57611 (= e!37952 e!37953)))

(declare-fun lt!22912 () (_ BitVec 64))

(assert (=> b!57611 (= lt!22912 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!22911 () Unit!1484)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3683 (_ BitVec 64) (_ BitVec 32)) Unit!1484)

(assert (=> b!57611 (= lt!22911 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3640 newMap!16) lt!22912 #b00000000000000000000000000000000))))

(assert (=> b!57611 (arrayContainsKey!0 (_keys!3640 newMap!16) lt!22912 #b00000000000000000000000000000000)))

(declare-fun lt!22910 () Unit!1484)

(assert (=> b!57611 (= lt!22910 lt!22911)))

(declare-fun res!32219 () Bool)

(assert (=> b!57611 (= res!32219 (= (seekEntryOrOpen!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) (_keys!3640 newMap!16) (mask!5894 newMap!16)) (Found!229 #b00000000000000000000000000000000)))))

(assert (=> b!57611 (=> (not res!32219) (not e!37953))))

(declare-fun d!10621 () Bool)

(declare-fun res!32220 () Bool)

(assert (=> d!10621 (=> res!32220 e!37954)))

(assert (=> d!10621 (= res!32220 (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3640 newMap!16) (mask!5894 newMap!16)) e!37954)))

(declare-fun bm!4186 () Bool)

(assert (=> bm!4186 (= call!4189 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(assert (= (and d!10621 (not res!32220)) b!57609))

(assert (= (and b!57609 c!7140) b!57611))

(assert (= (and b!57609 (not c!7140)) b!57608))

(assert (= (and b!57611 res!32219) b!57610))

(assert (= (or b!57610 b!57608) bm!4186))

(assert (=> b!57609 m!48317))

(assert (=> b!57609 m!48317))

(assert (=> b!57609 m!48321))

(assert (=> b!57611 m!48317))

(declare-fun m!48527 () Bool)

(assert (=> b!57611 m!48527))

(declare-fun m!48529 () Bool)

(assert (=> b!57611 m!48529))

(assert (=> b!57611 m!48317))

(declare-fun m!48531 () Bool)

(assert (=> b!57611 m!48531))

(declare-fun m!48533 () Bool)

(assert (=> bm!4186 m!48533))

(assert (=> b!57158 d!10621))

(assert (=> bm!4127 d!10595))

(declare-fun d!10623 () Bool)

(declare-fun e!37955 () Bool)

(assert (=> d!10623 e!37955))

(declare-fun res!32221 () Bool)

(assert (=> d!10623 (=> res!32221 e!37955)))

(declare-fun lt!22913 () Bool)

(assert (=> d!10623 (= res!32221 (not lt!22913))))

(declare-fun lt!22916 () Bool)

(assert (=> d!10623 (= lt!22913 lt!22916)))

(declare-fun lt!22915 () Unit!1484)

(declare-fun e!37956 () Unit!1484)

(assert (=> d!10623 (= lt!22915 e!37956)))

(declare-fun c!7141 () Bool)

(assert (=> d!10623 (= c!7141 lt!22916)))

(assert (=> d!10623 (= lt!22916 (containsKey!125 (toList!690 call!4127) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!10623 (= (contains!677 call!4127 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) lt!22913)))

(declare-fun b!57612 () Bool)

(declare-fun lt!22914 () Unit!1484)

(assert (=> b!57612 (= e!37956 lt!22914)))

(assert (=> b!57612 (= lt!22914 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 call!4127) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> b!57612 (isDefined!75 (getValueByKey!121 (toList!690 call!4127) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!57613 () Bool)

(declare-fun Unit!1503 () Unit!1484)

(assert (=> b!57613 (= e!37956 Unit!1503)))

(declare-fun b!57614 () Bool)

(assert (=> b!57614 (= e!37955 (isDefined!75 (getValueByKey!121 (toList!690 call!4127) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (= (and d!10623 c!7141) b!57612))

(assert (= (and d!10623 (not c!7141)) b!57613))

(assert (= (and d!10623 (not res!32221)) b!57614))

(assert (=> d!10623 m!47913))

(declare-fun m!48535 () Bool)

(assert (=> d!10623 m!48535))

(assert (=> b!57612 m!47913))

(declare-fun m!48537 () Bool)

(assert (=> b!57612 m!48537))

(assert (=> b!57612 m!47913))

(declare-fun m!48539 () Bool)

(assert (=> b!57612 m!48539))

(assert (=> b!57612 m!48539))

(declare-fun m!48541 () Bool)

(assert (=> b!57612 m!48541))

(assert (=> b!57614 m!47913))

(assert (=> b!57614 m!48539))

(assert (=> b!57614 m!48539))

(assert (=> b!57614 m!48541))

(assert (=> b!57285 d!10623))

(declare-fun d!10625 () Bool)

(declare-fun e!37957 () Bool)

(assert (=> d!10625 e!37957))

(declare-fun res!32223 () Bool)

(assert (=> d!10625 (=> (not res!32223) (not e!37957))))

(declare-fun lt!22919 () ListLongMap!1349)

(assert (=> d!10625 (= res!32223 (contains!677 lt!22919 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!22920 () List!1431)

(assert (=> d!10625 (= lt!22919 (ListLongMap!1350 lt!22920))))

(declare-fun lt!22917 () Unit!1484)

(declare-fun lt!22918 () Unit!1484)

(assert (=> d!10625 (= lt!22917 lt!22918)))

(assert (=> d!10625 (= (getValueByKey!121 lt!22920 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!126 (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10625 (= lt!22918 (lemmaContainsTupThenGetReturnValue!41 lt!22920 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10625 (= lt!22920 (insertStrictlySorted!44 (toList!690 call!4131) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10625 (= (+!80 call!4131 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!22919)))

(declare-fun b!57615 () Bool)

(declare-fun res!32222 () Bool)

(assert (=> b!57615 (=> (not res!32222) (not e!37957))))

(assert (=> b!57615 (= res!32222 (= (getValueByKey!121 (toList!690 lt!22919) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!126 (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!57616 () Bool)

(assert (=> b!57616 (= e!37957 (contains!681 (toList!690 lt!22919) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!10625 res!32223) b!57615))

(assert (= (and b!57615 res!32222) b!57616))

(declare-fun m!48543 () Bool)

(assert (=> d!10625 m!48543))

(declare-fun m!48545 () Bool)

(assert (=> d!10625 m!48545))

(declare-fun m!48547 () Bool)

(assert (=> d!10625 m!48547))

(declare-fun m!48549 () Bool)

(assert (=> d!10625 m!48549))

(declare-fun m!48551 () Bool)

(assert (=> b!57615 m!48551))

(declare-fun m!48553 () Bool)

(assert (=> b!57616 m!48553))

(assert (=> b!57273 d!10625))

(declare-fun d!10627 () Bool)

(declare-fun e!37958 () Bool)

(assert (=> d!10627 e!37958))

(declare-fun res!32224 () Bool)

(assert (=> d!10627 (=> res!32224 e!37958)))

(declare-fun lt!22921 () Bool)

(assert (=> d!10627 (= res!32224 (not lt!22921))))

(declare-fun lt!22924 () Bool)

(assert (=> d!10627 (= lt!22921 lt!22924)))

(declare-fun lt!22923 () Unit!1484)

(declare-fun e!37959 () Unit!1484)

(assert (=> d!10627 (= lt!22923 e!37959)))

(declare-fun c!7142 () Bool)

(assert (=> d!10627 (= c!7142 lt!22924)))

(assert (=> d!10627 (= lt!22924 (containsKey!125 (toList!690 e!37742) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))))))

(assert (=> d!10627 (= (contains!677 e!37742 (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))) lt!22921)))

(declare-fun b!57617 () Bool)

(declare-fun lt!22922 () Unit!1484)

(assert (=> b!57617 (= e!37959 lt!22922)))

(assert (=> b!57617 (= lt!22922 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 e!37742) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))))))

(assert (=> b!57617 (isDefined!75 (getValueByKey!121 (toList!690 e!37742) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))))))

(declare-fun b!57618 () Bool)

(declare-fun Unit!1504 () Unit!1484)

(assert (=> b!57618 (= e!37959 Unit!1504)))

(declare-fun b!57619 () Bool)

(assert (=> b!57619 (= e!37958 (isDefined!75 (getValueByKey!121 (toList!690 e!37742) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666))))))))

(assert (= (and d!10627 c!7142) b!57617))

(assert (= (and d!10627 (not c!7142)) b!57618))

(assert (= (and d!10627 (not res!32224)) b!57619))

(declare-fun m!48555 () Bool)

(assert (=> d!10627 m!48555))

(declare-fun m!48557 () Bool)

(assert (=> b!57617 m!48557))

(declare-fun m!48559 () Bool)

(assert (=> b!57617 m!48559))

(assert (=> b!57617 m!48559))

(declare-fun m!48561 () Bool)

(assert (=> b!57617 m!48561))

(assert (=> b!57619 m!48559))

(assert (=> b!57619 m!48559))

(assert (=> b!57619 m!48561))

(assert (=> bm!4129 d!10627))

(declare-fun d!10629 () Bool)

(assert (=> d!10629 (= (inRange!0 (ite c!7052 (ite c!7053 (index!3039 lt!22686) (ite c!7058 (index!3038 lt!22675) (index!3041 lt!22675))) (ite c!7051 (index!3039 lt!22672) (ite c!7056 (index!3038 lt!22678) (index!3041 lt!22678)))) (mask!5894 newMap!16)) (and (bvsge (ite c!7052 (ite c!7053 (index!3039 lt!22686) (ite c!7058 (index!3038 lt!22675) (index!3041 lt!22675))) (ite c!7051 (index!3039 lt!22672) (ite c!7056 (index!3038 lt!22678) (index!3041 lt!22678)))) #b00000000000000000000000000000000) (bvslt (ite c!7052 (ite c!7053 (index!3039 lt!22686) (ite c!7058 (index!3038 lt!22675) (index!3041 lt!22675))) (ite c!7051 (index!3039 lt!22672) (ite c!7056 (index!3038 lt!22678) (index!3041 lt!22678)))) (bvadd (mask!5894 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!4113 d!10629))

(declare-fun d!10631 () Bool)

(declare-fun e!37960 () Bool)

(assert (=> d!10631 e!37960))

(declare-fun res!32225 () Bool)

(assert (=> d!10631 (=> res!32225 e!37960)))

(declare-fun lt!22925 () Bool)

(assert (=> d!10631 (= res!32225 (not lt!22925))))

(declare-fun lt!22928 () Bool)

(assert (=> d!10631 (= lt!22925 lt!22928)))

(declare-fun lt!22927 () Unit!1484)

(declare-fun e!37961 () Unit!1484)

(assert (=> d!10631 (= lt!22927 e!37961)))

(declare-fun c!7143 () Bool)

(assert (=> d!10631 (= c!7143 lt!22928)))

(assert (=> d!10631 (= lt!22928 (containsKey!125 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!10631 (= (contains!677 lt!22766 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!22925)))

(declare-fun b!57620 () Bool)

(declare-fun lt!22926 () Unit!1484)

(assert (=> b!57620 (= e!37961 lt!22926)))

(assert (=> b!57620 (= lt!22926 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!57620 (isDefined!75 (getValueByKey!121 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!57621 () Bool)

(declare-fun Unit!1505 () Unit!1484)

(assert (=> b!57621 (= e!37961 Unit!1505)))

(declare-fun b!57622 () Bool)

(assert (=> b!57622 (= e!37960 (isDefined!75 (getValueByKey!121 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!10631 c!7143) b!57620))

(assert (= (and d!10631 (not c!7143)) b!57621))

(assert (= (and d!10631 (not res!32225)) b!57622))

(assert (=> d!10631 m!48119))

(declare-fun m!48563 () Bool)

(assert (=> d!10631 m!48563))

(assert (=> b!57620 m!48119))

(declare-fun m!48565 () Bool)

(assert (=> b!57620 m!48565))

(assert (=> b!57620 m!48119))

(declare-fun m!48567 () Bool)

(assert (=> b!57620 m!48567))

(assert (=> b!57620 m!48567))

(declare-fun m!48569 () Bool)

(assert (=> b!57620 m!48569))

(assert (=> b!57622 m!48119))

(assert (=> b!57622 m!48567))

(assert (=> b!57622 m!48567))

(assert (=> b!57622 m!48569))

(assert (=> b!57370 d!10631))

(assert (=> bm!4158 d!10545))

(declare-fun d!10633 () Bool)

(declare-fun e!37964 () Bool)

(assert (=> d!10633 e!37964))

(declare-fun res!32230 () Bool)

(assert (=> d!10633 (=> (not res!32230) (not e!37964))))

(declare-fun lt!22933 () SeekEntryResult!229)

(assert (=> d!10633 (= res!32230 ((_ is Found!229) lt!22933))))

(assert (=> d!10633 (= lt!22933 (seekEntryOrOpen!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(declare-fun lt!22934 () Unit!1484)

(declare-fun choose!300 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 64) Int) Unit!1484)

(assert (=> d!10633 (= lt!22934 (choose!300 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (defaultEntry!2021 newMap!16)))))

(assert (=> d!10633 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10633 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!14 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (defaultEntry!2021 newMap!16)) lt!22934)))

(declare-fun b!57627 () Bool)

(declare-fun res!32231 () Bool)

(assert (=> b!57627 (=> (not res!32231) (not e!37964))))

(assert (=> b!57627 (= res!32231 (inRange!0 (index!3039 lt!22933) (mask!5894 newMap!16)))))

(declare-fun b!57628 () Bool)

(assert (=> b!57628 (= e!37964 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22933)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> b!57628 (and (bvsge (index!3039 lt!22933) #b00000000000000000000000000000000) (bvslt (index!3039 lt!22933) (size!1992 (_keys!3640 newMap!16))))))

(assert (= (and d!10633 res!32230) b!57627))

(assert (= (and b!57627 res!32231) b!57628))

(assert (=> d!10633 m!47913))

(assert (=> d!10633 m!48067))

(assert (=> d!10633 m!47913))

(declare-fun m!48571 () Bool)

(assert (=> d!10633 m!48571))

(assert (=> d!10633 m!48335))

(declare-fun m!48573 () Bool)

(assert (=> b!57627 m!48573))

(declare-fun m!48575 () Bool)

(assert (=> b!57628 m!48575))

(assert (=> bm!4111 d!10633))

(declare-fun d!10635 () Bool)

(assert (=> d!10635 (= (+!80 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22673 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!22937 () Unit!1484)

(declare-fun choose!301 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 V!2833 Int) Unit!1484)

(assert (=> d!10635 (= lt!22937 (choose!301 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) lt!22673 (zeroValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1939 newMap!16) (defaultEntry!2021 newMap!16)))))

(assert (=> d!10635 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10635 (= (lemmaChangeZeroKeyThenAddPairToListMap!14 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) lt!22673 (zeroValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1939 newMap!16) (defaultEntry!2021 newMap!16)) lt!22937)))

(declare-fun bs!2491 () Bool)

(assert (= bs!2491 d!10635))

(assert (=> bs!2491 m!47939))

(declare-fun m!48577 () Bool)

(assert (=> bs!2491 m!48577))

(assert (=> bs!2491 m!47939))

(declare-fun m!48579 () Bool)

(assert (=> bs!2491 m!48579))

(assert (=> bs!2491 m!48101))

(assert (=> bs!2491 m!48101))

(declare-fun m!48581 () Bool)

(assert (=> bs!2491 m!48581))

(assert (=> bs!2491 m!48335))

(assert (=> b!57256 d!10635))

(declare-fun d!10637 () Bool)

(declare-fun res!32232 () Bool)

(declare-fun e!37965 () Bool)

(assert (=> d!10637 (=> (not res!32232) (not e!37965))))

(assert (=> d!10637 (= res!32232 (simpleValid!41 (v!2361 (underlying!220 thiss!992))))))

(assert (=> d!10637 (= (valid!250 (v!2361 (underlying!220 thiss!992))) e!37965)))

(declare-fun b!57629 () Bool)

(declare-fun res!32233 () Bool)

(assert (=> b!57629 (=> (not res!32233) (not e!37965))))

(assert (=> b!57629 (= res!32233 (= (arrayCountValidKeys!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000000 (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))) (_size!354 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun b!57630 () Bool)

(declare-fun res!32234 () Bool)

(assert (=> b!57630 (=> (not res!32234) (not e!37965))))

(assert (=> b!57630 (= res!32234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun b!57631 () Bool)

(assert (=> b!57631 (= e!37965 (arrayNoDuplicates!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000000 Nil!1427))))

(assert (= (and d!10637 res!32232) b!57629))

(assert (= (and b!57629 res!32233) b!57630))

(assert (= (and b!57630 res!32234) b!57631))

(declare-fun m!48583 () Bool)

(assert (=> d!10637 m!48583))

(declare-fun m!48585 () Bool)

(assert (=> b!57629 m!48585))

(declare-fun m!48587 () Bool)

(assert (=> b!57630 m!48587))

(declare-fun m!48589 () Bool)

(assert (=> b!57631 m!48589))

(assert (=> d!10533 d!10637))

(declare-fun d!10639 () Bool)

(declare-fun e!37966 () Bool)

(assert (=> d!10639 e!37966))

(declare-fun res!32236 () Bool)

(assert (=> d!10639 (=> (not res!32236) (not e!37966))))

(declare-fun lt!22940 () ListLongMap!1349)

(assert (=> d!10639 (= res!32236 (contains!677 lt!22940 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun lt!22941 () List!1431)

(assert (=> d!10639 (= lt!22940 (ListLongMap!1350 lt!22941))))

(declare-fun lt!22938 () Unit!1484)

(declare-fun lt!22939 () Unit!1484)

(assert (=> d!10639 (= lt!22938 lt!22939)))

(assert (=> d!10639 (= (getValueByKey!121 lt!22941 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10639 (= lt!22939 (lemmaContainsTupThenGetReturnValue!41 lt!22941 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10639 (= lt!22941 (insertStrictlySorted!44 (toList!690 call!4161) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10639 (= (+!80 call!4161 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22940)))

(declare-fun b!57632 () Bool)

(declare-fun res!32235 () Bool)

(assert (=> b!57632 (=> (not res!32235) (not e!37966))))

(assert (=> b!57632 (= res!32235 (= (getValueByKey!121 (toList!690 lt!22940) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!57633 () Bool)

(assert (=> b!57633 (= e!37966 (contains!681 (toList!690 lt!22940) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(assert (= (and d!10639 res!32236) b!57632))

(assert (= (and b!57632 res!32235) b!57633))

(declare-fun m!48591 () Bool)

(assert (=> d!10639 m!48591))

(declare-fun m!48593 () Bool)

(assert (=> d!10639 m!48593))

(declare-fun m!48595 () Bool)

(assert (=> d!10639 m!48595))

(declare-fun m!48597 () Bool)

(assert (=> d!10639 m!48597))

(declare-fun m!48599 () Bool)

(assert (=> b!57632 m!48599))

(declare-fun m!48601 () Bool)

(assert (=> b!57633 m!48601))

(assert (=> b!57372 d!10639))

(declare-fun d!10641 () Bool)

(assert (=> d!10641 (= (map!1099 (_2!1022 lt!22687)) (getCurrentListMap!387 (_keys!3640 (_2!1022 lt!22687)) (_values!2004 (_2!1022 lt!22687)) (mask!5894 (_2!1022 lt!22687)) (extraKeys!1912 (_2!1022 lt!22687)) (zeroValue!1939 (_2!1022 lt!22687)) (minValue!1939 (_2!1022 lt!22687)) #b00000000000000000000000000000000 (defaultEntry!2021 (_2!1022 lt!22687))))))

(declare-fun bs!2492 () Bool)

(assert (= bs!2492 d!10641))

(declare-fun m!48603 () Bool)

(assert (=> bs!2492 m!48603))

(assert (=> bm!4122 d!10641))

(assert (=> bm!4131 d!10617))

(declare-fun d!10643 () Bool)

(assert (=> d!10643 (= (get!1069 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!57294 d!10643))

(declare-fun d!10645 () Bool)

(declare-fun e!37967 () Bool)

(assert (=> d!10645 e!37967))

(declare-fun res!32237 () Bool)

(assert (=> d!10645 (=> res!32237 e!37967)))

(declare-fun lt!22942 () Bool)

(assert (=> d!10645 (= res!32237 (not lt!22942))))

(declare-fun lt!22945 () Bool)

(assert (=> d!10645 (= lt!22942 lt!22945)))

(declare-fun lt!22944 () Unit!1484)

(declare-fun e!37968 () Unit!1484)

(assert (=> d!10645 (= lt!22944 e!37968)))

(declare-fun c!7144 () Bool)

(assert (=> d!10645 (= c!7144 lt!22945)))

(assert (=> d!10645 (= lt!22945 (containsKey!125 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10645 (= (contains!677 lt!22766 #b1000000000000000000000000000000000000000000000000000000000000000) lt!22942)))

(declare-fun b!57634 () Bool)

(declare-fun lt!22943 () Unit!1484)

(assert (=> b!57634 (= e!37968 lt!22943)))

(assert (=> b!57634 (= lt!22943 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!57634 (isDefined!75 (getValueByKey!121 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57635 () Bool)

(declare-fun Unit!1506 () Unit!1484)

(assert (=> b!57635 (= e!37968 Unit!1506)))

(declare-fun b!57636 () Bool)

(assert (=> b!57636 (= e!37967 (isDefined!75 (getValueByKey!121 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10645 c!7144) b!57634))

(assert (= (and d!10645 (not c!7144)) b!57635))

(assert (= (and d!10645 (not res!32237)) b!57636))

(declare-fun m!48605 () Bool)

(assert (=> d!10645 m!48605))

(declare-fun m!48607 () Bool)

(assert (=> b!57634 m!48607))

(assert (=> b!57634 m!48407))

(assert (=> b!57634 m!48407))

(declare-fun m!48609 () Bool)

(assert (=> b!57634 m!48609))

(assert (=> b!57636 m!48407))

(assert (=> b!57636 m!48407))

(assert (=> b!57636 m!48609))

(assert (=> bm!4154 d!10645))

(declare-fun d!10647 () Bool)

(declare-fun e!37971 () Bool)

(assert (=> d!10647 e!37971))

(declare-fun res!32240 () Bool)

(assert (=> d!10647 (=> (not res!32240) (not e!37971))))

(assert (=> d!10647 (= res!32240 (and (bvsge (index!3039 lt!22666) #b00000000000000000000000000000000) (bvslt (index!3039 lt!22666) (size!1992 (_keys!3640 newMap!16)))))))

(declare-fun lt!22948 () Unit!1484)

(declare-fun choose!302 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 32) Int) Unit!1484)

(assert (=> d!10647 (= lt!22948 (choose!302 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (index!3039 lt!22666) (defaultEntry!2021 newMap!16)))))

(assert (=> d!10647 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10647 (= (lemmaValidKeyInArrayIsInListMap!73 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (index!3039 lt!22666) (defaultEntry!2021 newMap!16)) lt!22948)))

(declare-fun b!57639 () Bool)

(assert (=> b!57639 (= e!37971 (contains!677 (getCurrentListMap!387 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666))))))

(assert (= (and d!10647 res!32240) b!57639))

(declare-fun m!48611 () Bool)

(assert (=> d!10647 m!48611))

(assert (=> d!10647 m!48335))

(assert (=> b!57639 m!48063))

(assert (=> b!57639 m!48095))

(assert (=> b!57639 m!48063))

(assert (=> b!57639 m!48095))

(declare-fun m!48613 () Bool)

(assert (=> b!57639 m!48613))

(assert (=> b!57259 d!10647))

(declare-fun d!10649 () Bool)

(declare-fun e!37974 () Bool)

(assert (=> d!10649 e!37974))

(declare-fun res!32243 () Bool)

(assert (=> d!10649 (=> (not res!32243) (not e!37974))))

(assert (=> d!10649 (= res!32243 (and (bvsge (index!3039 lt!22666) #b00000000000000000000000000000000) (bvslt (index!3039 lt!22666) (size!1993 (_values!2004 newMap!16)))))))

(declare-fun lt!22951 () Unit!1484)

(declare-fun choose!303 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 32) (_ BitVec 64) V!2833 Int) Unit!1484)

(assert (=> d!10649 (= lt!22951 (choose!303 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (index!3039 lt!22666) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2021 newMap!16)))))

(assert (=> d!10649 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10649 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!14 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (index!3039 lt!22666) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2021 newMap!16)) lt!22951)))

(declare-fun b!57642 () Bool)

(assert (=> b!57642 (= e!37974 (= (+!80 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!387 (_keys!3640 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))))))

(assert (= (and d!10649 res!32243) b!57642))

(assert (=> d!10649 m!47913))

(assert (=> d!10649 m!47939))

(declare-fun m!48615 () Bool)

(assert (=> d!10649 m!48615))

(assert (=> d!10649 m!48335))

(assert (=> b!57642 m!48101))

(assert (=> b!57642 m!48101))

(declare-fun m!48617 () Bool)

(assert (=> b!57642 m!48617))

(assert (=> b!57642 m!48071))

(declare-fun m!48619 () Bool)

(assert (=> b!57642 m!48619))

(assert (=> b!57259 d!10649))

(declare-fun d!10651 () Bool)

(declare-fun e!37975 () Bool)

(assert (=> d!10651 e!37975))

(declare-fun res!32244 () Bool)

(assert (=> d!10651 (=> res!32244 e!37975)))

(declare-fun lt!22952 () Bool)

(assert (=> d!10651 (= res!32244 (not lt!22952))))

(declare-fun lt!22955 () Bool)

(assert (=> d!10651 (= lt!22952 lt!22955)))

(declare-fun lt!22954 () Unit!1484)

(declare-fun e!37976 () Unit!1484)

(assert (=> d!10651 (= lt!22954 e!37976)))

(declare-fun c!7145 () Bool)

(assert (=> d!10651 (= c!7145 lt!22955)))

(assert (=> d!10651 (= lt!22955 (containsKey!125 (toList!690 call!4115) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!10651 (= (contains!677 call!4115 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) lt!22952)))

(declare-fun b!57643 () Bool)

(declare-fun lt!22953 () Unit!1484)

(assert (=> b!57643 (= e!37976 lt!22953)))

(assert (=> b!57643 (= lt!22953 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 call!4115) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> b!57643 (isDefined!75 (getValueByKey!121 (toList!690 call!4115) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!57644 () Bool)

(declare-fun Unit!1507 () Unit!1484)

(assert (=> b!57644 (= e!37976 Unit!1507)))

(declare-fun b!57645 () Bool)

(assert (=> b!57645 (= e!37975 (isDefined!75 (getValueByKey!121 (toList!690 call!4115) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (= (and d!10651 c!7145) b!57643))

(assert (= (and d!10651 (not c!7145)) b!57644))

(assert (= (and d!10651 (not res!32244)) b!57645))

(assert (=> d!10651 m!47913))

(declare-fun m!48621 () Bool)

(assert (=> d!10651 m!48621))

(assert (=> b!57643 m!47913))

(declare-fun m!48623 () Bool)

(assert (=> b!57643 m!48623))

(assert (=> b!57643 m!47913))

(declare-fun m!48625 () Bool)

(assert (=> b!57643 m!48625))

(assert (=> b!57643 m!48625))

(declare-fun m!48627 () Bool)

(assert (=> b!57643 m!48627))

(assert (=> b!57645 m!47913))

(assert (=> b!57645 m!48625))

(assert (=> b!57645 m!48625))

(assert (=> b!57645 m!48627))

(assert (=> b!57259 d!10651))

(assert (=> d!10515 d!10519))

(declare-fun d!10653 () Bool)

(assert (=> d!10653 (not (arrayContainsKey!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!10653 true))

(declare-fun _$68!28 () Unit!1484)

(assert (=> d!10653 (= (choose!68 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427)) _$68!28)))

(declare-fun bs!2493 () Bool)

(assert (= bs!2493 d!10653))

(assert (=> bs!2493 m!47913))

(assert (=> bs!2493 m!47917))

(assert (=> d!10515 d!10653))

(declare-fun d!10655 () Bool)

(assert (=> d!10655 (= (apply!65 lt!22766 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1070 (getValueByKey!121 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!2494 () Bool)

(assert (= bs!2494 d!10655))

(assert (=> bs!2494 m!48119))

(assert (=> bs!2494 m!48567))

(assert (=> bs!2494 m!48567))

(declare-fun m!48629 () Bool)

(assert (=> bs!2494 m!48629))

(assert (=> b!57376 d!10655))

(declare-fun d!10657 () Bool)

(declare-fun c!7146 () Bool)

(assert (=> d!10657 (= c!7146 ((_ is ValueCellFull!851) (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!37977 () V!2833)

(assert (=> d!10657 (= (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!37977)))

(declare-fun b!57646 () Bool)

(assert (=> b!57646 (= e!37977 (get!1068 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!57647 () Bool)

(assert (=> b!57647 (= e!37977 (get!1069 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10657 c!7146) b!57646))

(assert (= (and d!10657 (not c!7146)) b!57647))

(assert (=> b!57646 m!48131))

(assert (=> b!57646 m!47937))

(declare-fun m!48631 () Bool)

(assert (=> b!57646 m!48631))

(assert (=> b!57647 m!48131))

(assert (=> b!57647 m!47937))

(declare-fun m!48633 () Bool)

(assert (=> b!57647 m!48633))

(assert (=> b!57376 d!10657))

(declare-fun b!57656 () Bool)

(declare-fun e!37983 () (_ BitVec 32))

(declare-fun call!4192 () (_ BitVec 32))

(assert (=> b!57656 (= e!37983 (bvadd #b00000000000000000000000000000001 call!4192))))

(declare-fun b!57657 () Bool)

(assert (=> b!57657 (= e!37983 call!4192)))

(declare-fun bm!4189 () Bool)

(assert (=> bm!4189 (= call!4192 (arrayCountValidKeys!0 (_keys!3640 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57658 () Bool)

(declare-fun e!37982 () (_ BitVec 32))

(assert (=> b!57658 (= e!37982 #b00000000000000000000000000000000)))

(declare-fun b!57659 () Bool)

(assert (=> b!57659 (= e!37982 e!37983)))

(declare-fun c!7152 () Bool)

(assert (=> b!57659 (= c!7152 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10659 () Bool)

(declare-fun lt!22958 () (_ BitVec 32))

(assert (=> d!10659 (and (bvsge lt!22958 #b00000000000000000000000000000000) (bvsle lt!22958 (bvsub (size!1992 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10659 (= lt!22958 e!37982)))

(declare-fun c!7151 () Bool)

(assert (=> d!10659 (= c!7151 (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10659 (and (bvsle #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1992 (_keys!3640 newMap!16)) (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10659 (= (arrayCountValidKeys!0 (_keys!3640 newMap!16) #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) lt!22958)))

(assert (= (and d!10659 c!7151) b!57658))

(assert (= (and d!10659 (not c!7151)) b!57659))

(assert (= (and b!57659 c!7152) b!57656))

(assert (= (and b!57659 (not c!7152)) b!57657))

(assert (= (or b!57656 b!57657) bm!4189))

(declare-fun m!48635 () Bool)

(assert (=> bm!4189 m!48635))

(assert (=> b!57659 m!48317))

(assert (=> b!57659 m!48317))

(assert (=> b!57659 m!48321))

(assert (=> b!57157 d!10659))

(declare-fun b!57694 () Bool)

(declare-fun e!38000 () Bool)

(declare-fun call!4201 () Bool)

(assert (=> b!57694 (= e!38000 (not call!4201))))

(declare-fun b!57695 () Bool)

(declare-fun e!38006 () Unit!1484)

(declare-fun Unit!1508 () Unit!1484)

(assert (=> b!57695 (= e!38006 Unit!1508)))

(declare-fun lt!23042 () Unit!1484)

(declare-fun lemmaArrayContainsKeyThenInListMap!4 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 64) (_ BitVec 32) Int) Unit!1484)

(assert (=> b!57695 (= lt!23042 (lemmaArrayContainsKeyThenInListMap!4 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(assert (=> b!57695 (contains!677 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))

(declare-fun lt!23026 () Unit!1484)

(assert (=> b!57695 (= lt!23026 lt!23042)))

(assert (=> b!57695 false))

(declare-fun b!57696 () Bool)

(declare-fun e!38001 () Unit!1484)

(declare-fun Unit!1509 () Unit!1484)

(assert (=> b!57696 (= e!38001 Unit!1509)))

(declare-fun lt!23031 () Unit!1484)

(assert (=> b!57696 (= lt!23031 (lemmaInListMapThenSeekEntryOrOpenFindsIt!14 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23030 () SeekEntryResult!229)

(declare-fun call!4203 () SeekEntryResult!229)

(assert (=> b!57696 (= lt!23030 call!4203)))

(declare-fun res!32265 () Bool)

(assert (=> b!57696 (= res!32265 ((_ is Found!229) lt!23030))))

(declare-fun e!38002 () Bool)

(assert (=> b!57696 (=> (not res!32265) (not e!38002))))

(assert (=> b!57696 e!38002))

(declare-fun lt!23025 () Unit!1484)

(assert (=> b!57696 (= lt!23025 lt!23031)))

(assert (=> b!57696 false))

(declare-fun b!57697 () Bool)

(declare-fun res!32263 () Bool)

(declare-fun call!4204 () Bool)

(assert (=> b!57697 (= res!32263 call!4204)))

(assert (=> b!57697 (=> (not res!32263) (not e!38002))))

(declare-fun d!10661 () Bool)

(declare-fun e!38007 () Bool)

(assert (=> d!10661 e!38007))

(declare-fun res!32269 () Bool)

(assert (=> d!10661 (=> (not res!32269) (not e!38007))))

(declare-fun lt!23019 () tuple2!2022)

(assert (=> d!10661 (= res!32269 (_1!1022 lt!23019))))

(assert (=> d!10661 (= lt!23019 (tuple2!2023 true (LongMapFixedSize!611 (defaultEntry!2021 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (bvadd (_size!354 newMap!16) #b00000000000000000000000000000001) (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (_vacant!354 newMap!16))))))

(declare-fun lt!23033 () Unit!1484)

(declare-fun lt!23038 () Unit!1484)

(assert (=> d!10661 (= lt!23033 lt!23038)))

(declare-fun lt!23028 () array!3685)

(declare-fun lt!23034 () array!3683)

(assert (=> d!10661 (contains!677 (getCurrentListMap!387 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (select (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666))))))

(assert (=> d!10661 (= lt!23038 (lemmaValidKeyInArrayIsInListMap!73 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (defaultEntry!2021 newMap!16)))))

(assert (=> d!10661 (= lt!23028 (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))))))

(assert (=> d!10661 (= lt!23034 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun lt!23027 () Unit!1484)

(declare-fun lt!23040 () Unit!1484)

(assert (=> d!10661 (= lt!23027 lt!23040)))

(declare-fun lt!23035 () array!3683)

(assert (=> d!10661 (= (arrayCountValidKeys!0 lt!23035 (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (bvadd (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!3683 (_ BitVec 32)) Unit!1484)

(assert (=> d!10661 (= lt!23040 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!23035 (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666))))))

(assert (=> d!10661 (= lt!23035 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun lt!23036 () Unit!1484)

(declare-fun lt!23045 () Unit!1484)

(assert (=> d!10661 (= lt!23036 lt!23045)))

(declare-fun lt!23029 () array!3683)

(assert (=> d!10661 (arrayContainsKey!0 lt!23029 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!10661 (= lt!23045 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!23029 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666))))))

(assert (=> d!10661 (= lt!23029 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun lt!23046 () Unit!1484)

(declare-fun lt!23032 () Unit!1484)

(assert (=> d!10661 (= lt!23046 lt!23032)))

(assert (=> d!10661 (= (+!80 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!387 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!4 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 32) (_ BitVec 64) V!2833 Int) Unit!1484)

(assert (=> d!10661 (= lt!23032 (lemmaAddValidKeyToArrayThenAddPairToListMap!4 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23047 () Unit!1484)

(declare-fun lt!23023 () Unit!1484)

(assert (=> d!10661 (= lt!23047 lt!23023)))

(assert (=> d!10661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (mask!5894 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!3683 (_ BitVec 32) (_ BitVec 32)) Unit!1484)

(assert (=> d!10661 (= lt!23023 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (mask!5894 newMap!16)))))

(declare-fun lt!23039 () Unit!1484)

(declare-fun lt!23037 () Unit!1484)

(assert (=> d!10661 (= lt!23039 lt!23037)))

(assert (=> d!10661 (= (arrayCountValidKeys!0 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3640 newMap!16) #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!3683 (_ BitVec 32) (_ BitVec 64)) Unit!1484)

(assert (=> d!10661 (= lt!23037 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3640 newMap!16) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun lt!23020 () Unit!1484)

(declare-fun lt!23048 () Unit!1484)

(assert (=> d!10661 (= lt!23020 lt!23048)))

(declare-fun lt!23024 () (_ BitVec 32))

(declare-fun lt!23022 () List!1430)

(assert (=> d!10661 (arrayNoDuplicates!0 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) lt!23024 lt!23022)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!3683 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1430) Unit!1484)

(assert (=> d!10661 (= lt!23048 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3640 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) lt!23024 lt!23022))))

(assert (=> d!10661 (= lt!23022 Nil!1427)))

(assert (=> d!10661 (= lt!23024 #b00000000000000000000000000000000)))

(declare-fun lt!23041 () Unit!1484)

(assert (=> d!10661 (= lt!23041 e!38006)))

(declare-fun c!7162 () Bool)

(assert (=> d!10661 (= c!7162 (arrayContainsKey!0 (_keys!3640 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!23021 () Unit!1484)

(assert (=> d!10661 (= lt!23021 e!38001)))

(declare-fun c!7163 () Bool)

(assert (=> d!10661 (= c!7163 (contains!677 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!10661 (valid!250 newMap!16)))

(assert (=> d!10661 (= (updateHelperNewKey!14 newMap!16 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666))) lt!23019)))

(declare-fun b!57698 () Bool)

(assert (=> b!57698 (= e!38002 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!23030)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!57699 () Bool)

(declare-fun c!7161 () Bool)

(declare-fun lt!23044 () SeekEntryResult!229)

(assert (=> b!57699 (= c!7161 ((_ is MissingVacant!229) lt!23044))))

(declare-fun e!38005 () Bool)

(declare-fun e!38004 () Bool)

(assert (=> b!57699 (= e!38005 e!38004)))

(declare-fun bm!4198 () Bool)

(assert (=> bm!4198 (= call!4203 (seekEntryOrOpen!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(declare-fun b!57700 () Bool)

(declare-fun res!32267 () Bool)

(assert (=> b!57700 (=> (not res!32267) (not e!38007))))

(assert (=> b!57700 (= res!32267 (valid!250 (_2!1022 lt!23019)))))

(declare-fun b!57701 () Bool)

(declare-fun res!32270 () Bool)

(declare-fun e!38003 () Bool)

(assert (=> b!57701 (=> (not res!32270) (not e!38003))))

(assert (=> b!57701 (= res!32270 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3038 lt!23044)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57702 () Bool)

(declare-fun lt!23043 () Unit!1484)

(assert (=> b!57702 (= e!38001 lt!23043)))

(assert (=> b!57702 (= lt!23043 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!14 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (defaultEntry!2021 newMap!16)))))

(assert (=> b!57702 (= lt!23044 call!4203)))

(declare-fun c!7164 () Bool)

(assert (=> b!57702 (= c!7164 ((_ is MissingZero!229) lt!23044))))

(assert (=> b!57702 e!38005))

(declare-fun b!57703 () Bool)

(assert (=> b!57703 (= e!38007 (= (map!1099 (_2!1022 lt!23019)) (+!80 (map!1099 newMap!16) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!57704 () Bool)

(assert (=> b!57704 (= e!38004 e!38000)))

(declare-fun res!32264 () Bool)

(declare-fun call!4202 () Bool)

(assert (=> b!57704 (= res!32264 call!4202)))

(assert (=> b!57704 (=> (not res!32264) (not e!38000))))

(declare-fun bm!4199 () Bool)

(assert (=> bm!4199 (= call!4201 (arrayContainsKey!0 (_keys!3640 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!57705 () Bool)

(assert (=> b!57705 (= e!38004 ((_ is Undefined!229) lt!23044))))

(declare-fun bm!4200 () Bool)

(assert (=> bm!4200 (= call!4202 call!4204)))

(declare-fun b!57706 () Bool)

(declare-fun res!32271 () Bool)

(assert (=> b!57706 (=> (not res!32271) (not e!38007))))

(assert (=> b!57706 (= res!32271 (contains!677 (map!1099 (_2!1022 lt!23019)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!57707 () Bool)

(declare-fun Unit!1510 () Unit!1484)

(assert (=> b!57707 (= e!38006 Unit!1510)))

(declare-fun b!57708 () Bool)

(assert (=> b!57708 (= e!38003 (not call!4201))))

(declare-fun bm!4201 () Bool)

(assert (=> bm!4201 (= call!4204 (inRange!0 (ite c!7163 (index!3039 lt!23030) (ite c!7164 (index!3038 lt!23044) (index!3041 lt!23044))) (mask!5894 newMap!16)))))

(declare-fun b!57709 () Bool)

(declare-fun res!32268 () Bool)

(assert (=> b!57709 (= res!32268 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3041 lt!23044)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!57709 (=> (not res!32268) (not e!38000))))

(declare-fun b!57710 () Bool)

(declare-fun res!32266 () Bool)

(assert (=> b!57710 (=> (not res!32266) (not e!38003))))

(assert (=> b!57710 (= res!32266 call!4202)))

(assert (=> b!57710 (= e!38005 e!38003)))

(assert (= (and d!10661 c!7163) b!57696))

(assert (= (and d!10661 (not c!7163)) b!57702))

(assert (= (and b!57696 res!32265) b!57697))

(assert (= (and b!57697 res!32263) b!57698))

(assert (= (and b!57702 c!7164) b!57710))

(assert (= (and b!57702 (not c!7164)) b!57699))

(assert (= (and b!57710 res!32266) b!57701))

(assert (= (and b!57701 res!32270) b!57708))

(assert (= (and b!57699 c!7161) b!57704))

(assert (= (and b!57699 (not c!7161)) b!57705))

(assert (= (and b!57704 res!32264) b!57709))

(assert (= (and b!57709 res!32268) b!57694))

(assert (= (or b!57710 b!57704) bm!4200))

(assert (= (or b!57708 b!57694) bm!4199))

(assert (= (or b!57697 bm!4200) bm!4201))

(assert (= (or b!57696 b!57702) bm!4198))

(assert (= (and d!10661 c!7162) b!57695))

(assert (= (and d!10661 (not c!7162)) b!57707))

(assert (= (and d!10661 res!32269) b!57700))

(assert (= (and b!57700 res!32267) b!57706))

(assert (= (and b!57706 res!32271) b!57703))

(assert (=> b!57702 m!47913))

(assert (=> b!57702 m!48087))

(declare-fun m!48637 () Bool)

(assert (=> b!57703 m!48637))

(assert (=> b!57703 m!47947))

(assert (=> b!57703 m!47947))

(declare-fun m!48639 () Bool)

(assert (=> b!57703 m!48639))

(declare-fun m!48641 () Bool)

(assert (=> bm!4201 m!48641))

(declare-fun m!48643 () Bool)

(assert (=> b!57700 m!48643))

(assert (=> b!57696 m!47913))

(assert (=> b!57696 m!48061))

(assert (=> b!57706 m!48637))

(assert (=> b!57706 m!48637))

(assert (=> b!57706 m!47913))

(declare-fun m!48645 () Bool)

(assert (=> b!57706 m!48645))

(declare-fun m!48647 () Bool)

(assert (=> b!57701 m!48647))

(declare-fun m!48649 () Bool)

(assert (=> b!57698 m!48649))

(assert (=> bm!4198 m!47913))

(assert (=> bm!4198 m!48067))

(assert (=> bm!4199 m!47913))

(assert (=> bm!4199 m!48109))

(assert (=> b!57695 m!47913))

(declare-fun m!48651 () Bool)

(assert (=> b!57695 m!48651))

(assert (=> b!57695 m!48101))

(assert (=> b!57695 m!48101))

(assert (=> b!57695 m!47913))

(declare-fun m!48653 () Bool)

(assert (=> b!57695 m!48653))

(declare-fun m!48655 () Bool)

(assert (=> b!57709 m!48655))

(declare-fun m!48657 () Bool)

(assert (=> d!10661 m!48657))

(assert (=> d!10661 m!47913))

(declare-fun m!48659 () Bool)

(assert (=> d!10661 m!48659))

(declare-fun m!48661 () Bool)

(assert (=> d!10661 m!48661))

(declare-fun m!48663 () Bool)

(assert (=> d!10661 m!48663))

(declare-fun m!48665 () Bool)

(assert (=> d!10661 m!48665))

(assert (=> d!10661 m!48041))

(declare-fun m!48667 () Bool)

(assert (=> d!10661 m!48667))

(assert (=> d!10661 m!47913))

(assert (=> d!10661 m!48109))

(assert (=> d!10661 m!47913))

(declare-fun m!48669 () Bool)

(assert (=> d!10661 m!48669))

(assert (=> d!10661 m!48101))

(assert (=> d!10661 m!47913))

(assert (=> d!10661 m!48653))

(declare-fun m!48671 () Bool)

(assert (=> d!10661 m!48671))

(declare-fun m!48673 () Bool)

(assert (=> d!10661 m!48673))

(assert (=> d!10661 m!47913))

(declare-fun m!48675 () Bool)

(assert (=> d!10661 m!48675))

(assert (=> d!10661 m!48661))

(declare-fun m!48677 () Bool)

(assert (=> d!10661 m!48677))

(declare-fun m!48679 () Bool)

(assert (=> d!10661 m!48679))

(assert (=> d!10661 m!48101))

(declare-fun m!48681 () Bool)

(assert (=> d!10661 m!48681))

(declare-fun m!48683 () Bool)

(assert (=> d!10661 m!48683))

(assert (=> d!10661 m!48677))

(assert (=> d!10661 m!48101))

(assert (=> d!10661 m!48617))

(assert (=> d!10661 m!47913))

(assert (=> d!10661 m!47939))

(declare-fun m!48685 () Bool)

(assert (=> d!10661 m!48685))

(declare-fun m!48687 () Bool)

(assert (=> d!10661 m!48687))

(assert (=> d!10661 m!47913))

(declare-fun m!48689 () Bool)

(assert (=> d!10661 m!48689))

(assert (=> d!10661 m!47913))

(declare-fun m!48691 () Bool)

(assert (=> d!10661 m!48691))

(assert (=> d!10661 m!47907))

(assert (=> bm!4126 d!10661))

(declare-fun d!10663 () Bool)

(declare-fun res!32276 () Bool)

(declare-fun e!38012 () Bool)

(assert (=> d!10663 (=> res!32276 e!38012)))

(assert (=> d!10663 (= res!32276 (and ((_ is Cons!1427) (toList!690 lt!22556)) (= (_1!1023 (h!2007 (toList!690 lt!22556))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (=> d!10663 (= (containsKey!125 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) e!38012)))

(declare-fun b!57715 () Bool)

(declare-fun e!38013 () Bool)

(assert (=> b!57715 (= e!38012 e!38013)))

(declare-fun res!32277 () Bool)

(assert (=> b!57715 (=> (not res!32277) (not e!38013))))

(assert (=> b!57715 (= res!32277 (and (or (not ((_ is Cons!1427) (toList!690 lt!22556))) (bvsle (_1!1023 (h!2007 (toList!690 lt!22556))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))) ((_ is Cons!1427) (toList!690 lt!22556)) (bvslt (_1!1023 (h!2007 (toList!690 lt!22556))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(declare-fun b!57716 () Bool)

(assert (=> b!57716 (= e!38013 (containsKey!125 (t!4744 (toList!690 lt!22556)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (= (and d!10663 (not res!32276)) b!57715))

(assert (= (and b!57715 res!32277) b!57716))

(assert (=> b!57716 m!47913))

(declare-fun m!48693 () Bool)

(assert (=> b!57716 m!48693))

(assert (=> d!10509 d!10663))

(declare-fun b!57718 () Bool)

(declare-fun e!38016 () ListLongMap!1349)

(declare-fun call!4207 () ListLongMap!1349)

(assert (=> b!57718 (= e!38016 call!4207)))

(declare-fun b!57719 () Bool)

(declare-fun e!38020 () Bool)

(assert (=> b!57719 (= e!38020 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!57720 () Bool)

(declare-fun e!38024 () Bool)

(declare-fun e!38021 () Bool)

(assert (=> b!57720 (= e!38024 e!38021)))

(declare-fun res!32278 () Bool)

(declare-fun call!4206 () Bool)

(assert (=> b!57720 (= res!32278 call!4206)))

(assert (=> b!57720 (=> (not res!32278) (not e!38021))))

(declare-fun b!57721 () Bool)

(declare-fun e!38022 () ListLongMap!1349)

(declare-fun e!38025 () ListLongMap!1349)

(assert (=> b!57721 (= e!38022 e!38025)))

(declare-fun c!7166 () Bool)

(assert (=> b!57721 (= c!7166 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!57722 () Bool)

(declare-fun c!7167 () Bool)

(assert (=> b!57722 (= c!7167 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!57722 (= e!38025 e!38016)))

(declare-fun bm!4202 () Bool)

(declare-fun call!4208 () ListLongMap!1349)

(declare-fun call!4210 () ListLongMap!1349)

(assert (=> bm!4202 (= call!4208 call!4210)))

(declare-fun b!57723 () Bool)

(declare-fun e!38015 () Bool)

(declare-fun e!38014 () Bool)

(assert (=> b!57723 (= e!38015 e!38014)))

(declare-fun res!32284 () Bool)

(assert (=> b!57723 (=> (not res!32284) (not e!38014))))

(declare-fun lt!23070 () ListLongMap!1349)

(assert (=> b!57723 (= res!32284 (contains!677 lt!23070 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!57723 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57724 () Bool)

(declare-fun e!38023 () Unit!1484)

(declare-fun Unit!1511 () Unit!1484)

(assert (=> b!57724 (= e!38023 Unit!1511)))

(declare-fun b!57725 () Bool)

(declare-fun call!4211 () ListLongMap!1349)

(assert (=> b!57725 (= e!38022 (+!80 call!4211 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))

(declare-fun d!10665 () Bool)

(declare-fun e!38017 () Bool)

(assert (=> d!10665 e!38017))

(declare-fun res!32282 () Bool)

(assert (=> d!10665 (=> (not res!32282) (not e!38017))))

(assert (=> d!10665 (= res!32282 (or (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))))

(declare-fun lt!23064 () ListLongMap!1349)

(assert (=> d!10665 (= lt!23070 lt!23064)))

(declare-fun lt!23062 () Unit!1484)

(assert (=> d!10665 (= lt!23062 e!38023)))

(declare-fun c!7169 () Bool)

(declare-fun e!38026 () Bool)

(assert (=> d!10665 (= c!7169 e!38026)))

(declare-fun res!32286 () Bool)

(assert (=> d!10665 (=> (not res!32286) (not e!38026))))

(assert (=> d!10665 (= res!32286 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10665 (= lt!23064 e!38022)))

(declare-fun c!7168 () Bool)

(assert (=> d!10665 (= c!7168 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!10665 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10665 (= (getCurrentListMap!387 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) lt!23070)))

(declare-fun b!57717 () Bool)

(assert (=> b!57717 (= e!38017 e!38024)))

(declare-fun c!7170 () Bool)

(assert (=> b!57717 (= c!7170 (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!4203 () Bool)

(declare-fun call!4205 () ListLongMap!1349)

(assert (=> bm!4203 (= call!4205 call!4211)))

(declare-fun bm!4204 () Bool)

(assert (=> bm!4204 (= call!4206 (contains!677 lt!23070 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57726 () Bool)

(assert (=> b!57726 (= e!38025 call!4205)))

(declare-fun bm!4205 () Bool)

(assert (=> bm!4205 (= call!4207 call!4208)))

(declare-fun b!57727 () Bool)

(declare-fun res!32281 () Bool)

(assert (=> b!57727 (=> (not res!32281) (not e!38017))))

(assert (=> b!57727 (= res!32281 e!38015)))

(declare-fun res!32279 () Bool)

(assert (=> b!57727 (=> res!32279 e!38015)))

(assert (=> b!57727 (= res!32279 (not e!38020))))

(declare-fun res!32283 () Bool)

(assert (=> b!57727 (=> (not res!32283) (not e!38020))))

(assert (=> b!57727 (= res!32283 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57728 () Bool)

(declare-fun e!38019 () Bool)

(declare-fun e!38018 () Bool)

(assert (=> b!57728 (= e!38019 e!38018)))

(declare-fun res!32285 () Bool)

(declare-fun call!4209 () Bool)

(assert (=> b!57728 (= res!32285 call!4209)))

(assert (=> b!57728 (=> (not res!32285) (not e!38018))))

(declare-fun bm!4206 () Bool)

(assert (=> bm!4206 (= call!4211 (+!80 (ite c!7168 call!4210 (ite c!7166 call!4208 call!4207)) (ite (or c!7168 c!7166) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(declare-fun b!57729 () Bool)

(assert (=> b!57729 (= e!38014 (= (apply!65 lt!23070 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (get!1065 (select (arr!1763 lt!22683) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1993 lt!22683)))))

(assert (=> b!57729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57730 () Bool)

(assert (=> b!57730 (= e!38018 (= (apply!65 lt!23070 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1939 newMap!16)))))

(declare-fun b!57731 () Bool)

(declare-fun res!32280 () Bool)

(assert (=> b!57731 (=> (not res!32280) (not e!38017))))

(assert (=> b!57731 (= res!32280 e!38019)))

(declare-fun c!7165 () Bool)

(assert (=> b!57731 (= c!7165 (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!57732 () Bool)

(assert (=> b!57732 (= e!38016 call!4205)))

(declare-fun b!57733 () Bool)

(assert (=> b!57733 (= e!38019 (not call!4209))))

(declare-fun b!57734 () Bool)

(assert (=> b!57734 (= e!38024 (not call!4206))))

(declare-fun b!57735 () Bool)

(declare-fun lt!23054 () Unit!1484)

(assert (=> b!57735 (= e!38023 lt!23054)))

(declare-fun lt!23060 () ListLongMap!1349)

(assert (=> b!57735 (= lt!23060 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23055 () (_ BitVec 64))

(assert (=> b!57735 (= lt!23055 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23053 () (_ BitVec 64))

(assert (=> b!57735 (= lt!23053 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!23057 () Unit!1484)

(assert (=> b!57735 (= lt!23057 (addStillContains!41 lt!23060 lt!23055 (zeroValue!1939 newMap!16) lt!23053))))

(assert (=> b!57735 (contains!677 (+!80 lt!23060 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16))) lt!23053)))

(declare-fun lt!23067 () Unit!1484)

(assert (=> b!57735 (= lt!23067 lt!23057)))

(declare-fun lt!23051 () ListLongMap!1349)

(assert (=> b!57735 (= lt!23051 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23052 () (_ BitVec 64))

(assert (=> b!57735 (= lt!23052 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23049 () (_ BitVec 64))

(assert (=> b!57735 (= lt!23049 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!23065 () Unit!1484)

(assert (=> b!57735 (= lt!23065 (addApplyDifferent!41 lt!23051 lt!23052 (minValue!1939 newMap!16) lt!23049))))

(assert (=> b!57735 (= (apply!65 (+!80 lt!23051 (tuple2!2025 lt!23052 (minValue!1939 newMap!16))) lt!23049) (apply!65 lt!23051 lt!23049))))

(declare-fun lt!23050 () Unit!1484)

(assert (=> b!57735 (= lt!23050 lt!23065)))

(declare-fun lt!23056 () ListLongMap!1349)

(assert (=> b!57735 (= lt!23056 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23063 () (_ BitVec 64))

(assert (=> b!57735 (= lt!23063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23068 () (_ BitVec 64))

(assert (=> b!57735 (= lt!23068 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!23059 () Unit!1484)

(assert (=> b!57735 (= lt!23059 (addApplyDifferent!41 lt!23056 lt!23063 (zeroValue!1939 newMap!16) lt!23068))))

(assert (=> b!57735 (= (apply!65 (+!80 lt!23056 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16))) lt!23068) (apply!65 lt!23056 lt!23068))))

(declare-fun lt!23061 () Unit!1484)

(assert (=> b!57735 (= lt!23061 lt!23059)))

(declare-fun lt!23058 () ListLongMap!1349)

(assert (=> b!57735 (= lt!23058 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23069 () (_ BitVec 64))

(assert (=> b!57735 (= lt!23069 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23066 () (_ BitVec 64))

(assert (=> b!57735 (= lt!23066 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!57735 (= lt!23054 (addApplyDifferent!41 lt!23058 lt!23069 (minValue!1939 newMap!16) lt!23066))))

(assert (=> b!57735 (= (apply!65 (+!80 lt!23058 (tuple2!2025 lt!23069 (minValue!1939 newMap!16))) lt!23066) (apply!65 lt!23058 lt!23066))))

(declare-fun bm!4207 () Bool)

(assert (=> bm!4207 (= call!4209 (contains!677 lt!23070 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57736 () Bool)

(assert (=> b!57736 (= e!38026 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!4208 () Bool)

(assert (=> bm!4208 (= call!4210 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun b!57737 () Bool)

(assert (=> b!57737 (= e!38021 (= (apply!65 lt!23070 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1939 newMap!16)))))

(assert (= (and d!10665 c!7168) b!57725))

(assert (= (and d!10665 (not c!7168)) b!57721))

(assert (= (and b!57721 c!7166) b!57726))

(assert (= (and b!57721 (not c!7166)) b!57722))

(assert (= (and b!57722 c!7167) b!57732))

(assert (= (and b!57722 (not c!7167)) b!57718))

(assert (= (or b!57732 b!57718) bm!4205))

(assert (= (or b!57726 bm!4205) bm!4202))

(assert (= (or b!57726 b!57732) bm!4203))

(assert (= (or b!57725 bm!4202) bm!4208))

(assert (= (or b!57725 bm!4203) bm!4206))

(assert (= (and d!10665 res!32286) b!57736))

(assert (= (and d!10665 c!7169) b!57735))

(assert (= (and d!10665 (not c!7169)) b!57724))

(assert (= (and d!10665 res!32282) b!57727))

(assert (= (and b!57727 res!32283) b!57719))

(assert (= (and b!57727 (not res!32279)) b!57723))

(assert (= (and b!57723 res!32284) b!57729))

(assert (= (and b!57727 res!32281) b!57731))

(assert (= (and b!57731 c!7165) b!57728))

(assert (= (and b!57731 (not c!7165)) b!57733))

(assert (= (and b!57728 res!32285) b!57730))

(assert (= (or b!57728 b!57733) bm!4207))

(assert (= (and b!57731 res!32280) b!57717))

(assert (= (and b!57717 c!7170) b!57720))

(assert (= (and b!57717 (not c!7170)) b!57734))

(assert (= (and b!57720 res!32278) b!57737))

(assert (= (or b!57720 b!57734) bm!4204))

(declare-fun b_lambda!2513 () Bool)

(assert (=> (not b_lambda!2513) (not b!57729)))

(assert (=> b!57729 t!4758))

(declare-fun b_and!3481 () Bool)

(assert (= b_and!3477 (and (=> t!4758 result!2353) b_and!3481)))

(assert (=> b!57729 t!4760))

(declare-fun b_and!3483 () Bool)

(assert (= b_and!3479 (and (=> t!4760 result!2355) b_and!3483)))

(declare-fun m!48695 () Bool)

(assert (=> b!57729 m!48695))

(assert (=> b!57729 m!48353))

(declare-fun m!48697 () Bool)

(assert (=> b!57729 m!48697))

(assert (=> b!57729 m!48695))

(assert (=> b!57729 m!48317))

(declare-fun m!48699 () Bool)

(assert (=> b!57729 m!48699))

(assert (=> b!57729 m!48317))

(assert (=> b!57729 m!48353))

(declare-fun m!48701 () Bool)

(assert (=> b!57725 m!48701))

(declare-fun m!48703 () Bool)

(assert (=> bm!4206 m!48703))

(assert (=> b!57723 m!48317))

(assert (=> b!57723 m!48317))

(declare-fun m!48705 () Bool)

(assert (=> b!57723 m!48705))

(declare-fun m!48707 () Bool)

(assert (=> b!57737 m!48707))

(declare-fun m!48709 () Bool)

(assert (=> bm!4204 m!48709))

(declare-fun m!48711 () Bool)

(assert (=> bm!4207 m!48711))

(assert (=> b!57735 m!48317))

(declare-fun m!48713 () Bool)

(assert (=> b!57735 m!48713))

(declare-fun m!48715 () Bool)

(assert (=> b!57735 m!48715))

(declare-fun m!48717 () Bool)

(assert (=> b!57735 m!48717))

(declare-fun m!48719 () Bool)

(assert (=> b!57735 m!48719))

(declare-fun m!48721 () Bool)

(assert (=> b!57735 m!48721))

(declare-fun m!48723 () Bool)

(assert (=> b!57735 m!48723))

(declare-fun m!48725 () Bool)

(assert (=> b!57735 m!48725))

(declare-fun m!48727 () Bool)

(assert (=> b!57735 m!48727))

(declare-fun m!48729 () Bool)

(assert (=> b!57735 m!48729))

(assert (=> b!57735 m!48721))

(declare-fun m!48731 () Bool)

(assert (=> b!57735 m!48731))

(assert (=> b!57735 m!48725))

(declare-fun m!48733 () Bool)

(assert (=> b!57735 m!48733))

(declare-fun m!48735 () Bool)

(assert (=> b!57735 m!48735))

(declare-fun m!48737 () Bool)

(assert (=> b!57735 m!48737))

(declare-fun m!48739 () Bool)

(assert (=> b!57735 m!48739))

(declare-fun m!48741 () Bool)

(assert (=> b!57735 m!48741))

(assert (=> b!57735 m!48727))

(assert (=> b!57735 m!48735))

(declare-fun m!48743 () Bool)

(assert (=> b!57735 m!48743))

(declare-fun m!48745 () Bool)

(assert (=> b!57730 m!48745))

(assert (=> bm!4208 m!48741))

(assert (=> d!10665 m!48335))

(assert (=> b!57719 m!48317))

(assert (=> b!57719 m!48317))

(assert (=> b!57719 m!48321))

(assert (=> b!57736 m!48317))

(assert (=> b!57736 m!48317))

(assert (=> b!57736 m!48321))

(assert (=> b!57258 d!10665))

(declare-fun b!57739 () Bool)

(declare-fun e!38027 () Bool)

(assert (=> b!57739 (= e!38027 tp_is_empty!2389)))

(declare-fun mapIsEmpty!2859 () Bool)

(declare-fun mapRes!2859 () Bool)

(assert (=> mapIsEmpty!2859 mapRes!2859))

(declare-fun b!57738 () Bool)

(declare-fun e!38028 () Bool)

(assert (=> b!57738 (= e!38028 tp_is_empty!2389)))

(declare-fun mapNonEmpty!2859 () Bool)

(declare-fun tp!7971 () Bool)

(assert (=> mapNonEmpty!2859 (= mapRes!2859 (and tp!7971 e!38028))))

(declare-fun mapRest!2859 () (Array (_ BitVec 32) ValueCell!851))

(declare-fun mapKey!2859 () (_ BitVec 32))

(declare-fun mapValue!2859 () ValueCell!851)

(assert (=> mapNonEmpty!2859 (= mapRest!2858 (store mapRest!2859 mapKey!2859 mapValue!2859))))

(declare-fun condMapEmpty!2859 () Bool)

(declare-fun mapDefault!2859 () ValueCell!851)

(assert (=> mapNonEmpty!2858 (= condMapEmpty!2859 (= mapRest!2858 ((as const (Array (_ BitVec 32) ValueCell!851)) mapDefault!2859)))))

(assert (=> mapNonEmpty!2858 (= tp!7970 (and e!38027 mapRes!2859))))

(assert (= (and mapNonEmpty!2858 condMapEmpty!2859) mapIsEmpty!2859))

(assert (= (and mapNonEmpty!2858 (not condMapEmpty!2859)) mapNonEmpty!2859))

(assert (= (and mapNonEmpty!2859 ((_ is ValueCellFull!851) mapValue!2859)) b!57738))

(assert (= (and mapNonEmpty!2858 ((_ is ValueCellFull!851) mapDefault!2859)) b!57739))

(declare-fun m!48747 () Bool)

(assert (=> mapNonEmpty!2859 m!48747))

(declare-fun b!57741 () Bool)

(declare-fun e!38029 () Bool)

(assert (=> b!57741 (= e!38029 tp_is_empty!2389)))

(declare-fun mapIsEmpty!2860 () Bool)

(declare-fun mapRes!2860 () Bool)

(assert (=> mapIsEmpty!2860 mapRes!2860))

(declare-fun b!57740 () Bool)

(declare-fun e!38030 () Bool)

(assert (=> b!57740 (= e!38030 tp_is_empty!2389)))

(declare-fun mapNonEmpty!2860 () Bool)

(declare-fun tp!7972 () Bool)

(assert (=> mapNonEmpty!2860 (= mapRes!2860 (and tp!7972 e!38030))))

(declare-fun mapValue!2860 () ValueCell!851)

(declare-fun mapRest!2860 () (Array (_ BitVec 32) ValueCell!851))

(declare-fun mapKey!2860 () (_ BitVec 32))

(assert (=> mapNonEmpty!2860 (= mapRest!2857 (store mapRest!2860 mapKey!2860 mapValue!2860))))

(declare-fun condMapEmpty!2860 () Bool)

(declare-fun mapDefault!2860 () ValueCell!851)

(assert (=> mapNonEmpty!2857 (= condMapEmpty!2860 (= mapRest!2857 ((as const (Array (_ BitVec 32) ValueCell!851)) mapDefault!2860)))))

(assert (=> mapNonEmpty!2857 (= tp!7969 (and e!38029 mapRes!2860))))

(assert (= (and mapNonEmpty!2857 condMapEmpty!2860) mapIsEmpty!2860))

(assert (= (and mapNonEmpty!2857 (not condMapEmpty!2860)) mapNonEmpty!2860))

(assert (= (and mapNonEmpty!2860 ((_ is ValueCellFull!851) mapValue!2860)) b!57740))

(assert (= (and mapNonEmpty!2857 ((_ is ValueCellFull!851) mapDefault!2860)) b!57741))

(declare-fun m!48749 () Bool)

(assert (=> mapNonEmpty!2860 m!48749))

(declare-fun b_lambda!2515 () Bool)

(assert (= b_lambda!2513 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2515)))

(declare-fun b_lambda!2517 () Bool)

(assert (= b_lambda!2509 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2517)))

(declare-fun b_lambda!2519 () Bool)

(assert (= b_lambda!2511 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2519)))

(declare-fun b_lambda!2521 () Bool)

(assert (= b_lambda!2507 (or (and b!57026 b_free!1945) (and b!57016 b_free!1947 (= (defaultEntry!2021 newMap!16) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))))) b_lambda!2521)))

(declare-fun b_lambda!2523 () Bool)

(assert (= b_lambda!2505 (or (and b!57026 b_free!1945) (and b!57016 b_free!1947 (= (defaultEntry!2021 newMap!16) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))))) b_lambda!2523)))

(check-sat (not bm!4174) (not b!57562) (not d!10653) (not bm!4167) (not b!57535) (not b!57622) (not b!57642) (not b!57426) (not b!57438) (not b!57522) (not b!57617) (not b!57447) (not b!57647) (not d!10585) (not b!57593) (not d!10625) (not b!57445) (not b!57460) (not d!10645) (not b_lambda!2503) (not b!57620) (not b_lambda!2499) (not b!57735) (not b!57639) (not mapNonEmpty!2859) (not b!57695) (not d!10545) (not d!10623) b_and!3483 (not d!10581) (not bm!4172) (not d!10639) (not b_lambda!2515) (not d!10607) (not b!57523) (not bm!4175) (not b!57700) (not b!57532) (not b!57572) (not d!10635) (not b!57575) (not d!10547) (not d!10559) (not d!10595) (not b!57737) (not b!57541) tp_is_empty!2389 (not b!57630) (not b!57616) (not d!10605) (not bm!4183) (not b_lambda!2521) (not d!10557) (not d!10579) (not bm!4186) (not b!57560) (not d!10609) (not b!57518) (not b!57553) (not d!10565) (not b!57659) (not bm!4199) (not b!57696) (not b!57551) (not bm!4176) (not b!57627) (not b!57552) (not d!10647) (not b!57507) (not b!57578) (not b!57530) (not b!57706) (not bm!4179) (not b!57612) (not b!57448) (not b!57631) (not d!10575) b_and!3481 (not b!57454) (not d!10631) (not bm!4201) (not b!57444) (not bm!4181) (not d!10561) (not d!10611) (not b_next!1947) (not d!10655) (not b!57576) (not b!57615) (not d!10601) (not d!10637) (not bm!4162) (not b!57636) (not d!10649) (not b!57558) (not d!10665) (not d!10563) (not b!57725) (not b!57573) (not b!57632) (not b!57716) (not b!57561) (not b!57611) (not b!57599) (not b!57432) (not b_next!1945) (not b!57529) (not bm!4208) (not b!57736) (not b!57719) (not d!10641) (not b!57436) (not bm!4182) (not b!57643) (not b!57433) (not d!10567) (not b!57429) (not bm!4168) (not d!10543) (not b!57723) (not b!57539) (not b!57729) (not d!10571) (not d!10549) (not bm!4198) (not b!57450) (not d!10569) (not b_lambda!2523) (not bm!4169) (not d!10589) (not d!10541) (not b!57597) (not b!57629) (not d!10617) (not d!10593) (not b!57424) (not b!57577) (not b!57431) (not d!10551) (not b!57645) (not b!57546) (not b!57646) (not bm!4189) (not d!10619) (not b!57434) (not b!57468) (not b!57730) (not d!10651) (not d!10661) (not b!57614) (not d!10633) (not b!57427) (not d!10613) (not b!57545) (not b!57512) (not b!57449) (not bm!4206) (not b!57703) (not b!57446) (not d!10599) (not bm!4204) (not mapNonEmpty!2860) (not bm!4161) (not b!57634) (not b!57479) (not b!57506) (not d!10555) (not b!57451) (not b!57463) (not b!57528) (not b!57633) (not b_lambda!2519) (not b_lambda!2517) (not b!57516) (not b!57465) (not b!57609) (not b!57702) (not bm!4207) (not b!57462) (not d!10553) (not b!57619) (not d!10627) (not b!57509))
(check-sat b_and!3481 b_and!3483 (not b_next!1945) (not b_next!1947))
(get-model)

(declare-fun d!10667 () Bool)

(assert (=> d!10667 (= (isDefined!75 (getValueByKey!121 (toList!690 call!4115) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))) (not (isEmpty!295 (getValueByKey!121 (toList!690 call!4115) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))))

(declare-fun bs!2495 () Bool)

(assert (= bs!2495 d!10667))

(assert (=> bs!2495 m!48625))

(declare-fun m!48751 () Bool)

(assert (=> bs!2495 m!48751))

(assert (=> b!57645 d!10667))

(declare-fun b!57743 () Bool)

(declare-fun e!38031 () Option!127)

(declare-fun e!38032 () Option!127)

(assert (=> b!57743 (= e!38031 e!38032)))

(declare-fun c!7172 () Bool)

(assert (=> b!57743 (= c!7172 (and ((_ is Cons!1427) (toList!690 call!4115)) (not (= (_1!1023 (h!2007 (toList!690 call!4115))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))))

(declare-fun b!57745 () Bool)

(assert (=> b!57745 (= e!38032 None!125)))

(declare-fun b!57744 () Bool)

(assert (=> b!57744 (= e!38032 (getValueByKey!121 (t!4744 (toList!690 call!4115)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!57742 () Bool)

(assert (=> b!57742 (= e!38031 (Some!126 (_2!1023 (h!2007 (toList!690 call!4115)))))))

(declare-fun d!10669 () Bool)

(declare-fun c!7171 () Bool)

(assert (=> d!10669 (= c!7171 (and ((_ is Cons!1427) (toList!690 call!4115)) (= (_1!1023 (h!2007 (toList!690 call!4115))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (=> d!10669 (= (getValueByKey!121 (toList!690 call!4115) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) e!38031)))

(assert (= (and d!10669 c!7171) b!57742))

(assert (= (and d!10669 (not c!7171)) b!57743))

(assert (= (and b!57743 c!7172) b!57744))

(assert (= (and b!57743 (not c!7172)) b!57745))

(assert (=> b!57744 m!47913))

(declare-fun m!48753 () Bool)

(assert (=> b!57744 m!48753))

(assert (=> b!57645 d!10669))

(declare-fun d!10671 () Bool)

(assert (=> d!10671 (= (isDefined!75 (getValueByKey!121 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!295 (getValueByKey!121 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!2496 () Bool)

(assert (= bs!2496 d!10671))

(assert (=> bs!2496 m!48567))

(declare-fun m!48755 () Bool)

(assert (=> bs!2496 m!48755))

(assert (=> b!57622 d!10671))

(declare-fun b!57747 () Bool)

(declare-fun e!38033 () Option!127)

(declare-fun e!38034 () Option!127)

(assert (=> b!57747 (= e!38033 e!38034)))

(declare-fun c!7174 () Bool)

(assert (=> b!57747 (= c!7174 (and ((_ is Cons!1427) (toList!690 lt!22766)) (not (= (_1!1023 (h!2007 (toList!690 lt!22766))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun b!57749 () Bool)

(assert (=> b!57749 (= e!38034 None!125)))

(declare-fun b!57748 () Bool)

(assert (=> b!57748 (= e!38034 (getValueByKey!121 (t!4744 (toList!690 lt!22766)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!57746 () Bool)

(assert (=> b!57746 (= e!38033 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22766)))))))

(declare-fun c!7173 () Bool)

(declare-fun d!10673 () Bool)

(assert (=> d!10673 (= c!7173 (and ((_ is Cons!1427) (toList!690 lt!22766)) (= (_1!1023 (h!2007 (toList!690 lt!22766))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!10673 (= (getValueByKey!121 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!38033)))

(assert (= (and d!10673 c!7173) b!57746))

(assert (= (and d!10673 (not c!7173)) b!57747))

(assert (= (and b!57747 c!7174) b!57748))

(assert (= (and b!57747 (not c!7174)) b!57749))

(assert (=> b!57748 m!48119))

(declare-fun m!48757 () Bool)

(assert (=> b!57748 m!48757))

(assert (=> b!57622 d!10673))

(declare-fun d!10675 () Bool)

(assert (=> d!10675 (isDefined!75 (getValueByKey!121 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22749))))

(declare-fun lt!23071 () Unit!1484)

(assert (=> d!10675 (= lt!23071 (choose!297 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22749))))

(declare-fun e!38035 () Bool)

(assert (=> d!10675 e!38035))

(declare-fun res!32287 () Bool)

(assert (=> d!10675 (=> (not res!32287) (not e!38035))))

(assert (=> d!10675 (= res!32287 (isStrictlySorted!278 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!10675 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22749) lt!23071)))

(declare-fun b!57750 () Bool)

(assert (=> b!57750 (= e!38035 (containsKey!125 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22749))))

(assert (= (and d!10675 res!32287) b!57750))

(assert (=> d!10675 m!48231))

(assert (=> d!10675 m!48231))

(assert (=> d!10675 m!48233))

(declare-fun m!48759 () Bool)

(assert (=> d!10675 m!48759))

(declare-fun m!48761 () Bool)

(assert (=> d!10675 m!48761))

(assert (=> b!57750 m!48227))

(assert (=> b!57436 d!10675))

(declare-fun d!10677 () Bool)

(assert (=> d!10677 (= (isDefined!75 (getValueByKey!121 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22749)) (not (isEmpty!295 (getValueByKey!121 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22749))))))

(declare-fun bs!2497 () Bool)

(assert (= bs!2497 d!10677))

(assert (=> bs!2497 m!48231))

(declare-fun m!48763 () Bool)

(assert (=> bs!2497 m!48763))

(assert (=> b!57436 d!10677))

(declare-fun b!57752 () Bool)

(declare-fun e!38036 () Option!127)

(declare-fun e!38037 () Option!127)

(assert (=> b!57752 (= e!38036 e!38037)))

(declare-fun c!7176 () Bool)

(assert (=> b!57752 (= c!7176 (and ((_ is Cons!1427) (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))) (not (= (_1!1023 (h!2007 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))) lt!22749))))))

(declare-fun b!57754 () Bool)

(assert (=> b!57754 (= e!38037 None!125)))

(declare-fun b!57753 () Bool)

(assert (=> b!57753 (= e!38037 (getValueByKey!121 (t!4744 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))) lt!22749))))

(declare-fun b!57751 () Bool)

(assert (=> b!57751 (= e!38036 (Some!126 (_2!1023 (h!2007 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))))

(declare-fun d!10679 () Bool)

(declare-fun c!7175 () Bool)

(assert (=> d!10679 (= c!7175 (and ((_ is Cons!1427) (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))) (= (_1!1023 (h!2007 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))) lt!22749)))))

(assert (=> d!10679 (= (getValueByKey!121 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22749) e!38036)))

(assert (= (and d!10679 c!7175) b!57751))

(assert (= (and d!10679 (not c!7175)) b!57752))

(assert (= (and b!57752 c!7176) b!57753))

(assert (= (and b!57752 (not c!7176)) b!57754))

(declare-fun m!48765 () Bool)

(assert (=> b!57753 m!48765))

(assert (=> b!57436 d!10679))

(declare-fun d!10681 () Bool)

(declare-fun e!38038 () Bool)

(assert (=> d!10681 e!38038))

(declare-fun res!32288 () Bool)

(assert (=> d!10681 (=> res!32288 e!38038)))

(declare-fun lt!23072 () Bool)

(assert (=> d!10681 (= res!32288 (not lt!23072))))

(declare-fun lt!23075 () Bool)

(assert (=> d!10681 (= lt!23072 lt!23075)))

(declare-fun lt!23074 () Unit!1484)

(declare-fun e!38039 () Unit!1484)

(assert (=> d!10681 (= lt!23074 e!38039)))

(declare-fun c!7177 () Bool)

(assert (=> d!10681 (= c!7177 lt!23075)))

(assert (=> d!10681 (= lt!23075 (containsKey!125 (toList!690 lt!22790) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!10681 (= (contains!677 lt!22790 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!23072)))

(declare-fun b!57755 () Bool)

(declare-fun lt!23073 () Unit!1484)

(assert (=> b!57755 (= e!38039 lt!23073)))

(assert (=> b!57755 (= lt!23073 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22790) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!57755 (isDefined!75 (getValueByKey!121 (toList!690 lt!22790) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!57756 () Bool)

(declare-fun Unit!1512 () Unit!1484)

(assert (=> b!57756 (= e!38039 Unit!1512)))

(declare-fun b!57757 () Bool)

(assert (=> b!57757 (= e!38038 (isDefined!75 (getValueByKey!121 (toList!690 lt!22790) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!10681 c!7177) b!57755))

(assert (= (and d!10681 (not c!7177)) b!57756))

(assert (= (and d!10681 (not res!32288)) b!57757))

(assert (=> d!10681 m!48119))

(declare-fun m!48767 () Bool)

(assert (=> d!10681 m!48767))

(assert (=> b!57755 m!48119))

(declare-fun m!48769 () Bool)

(assert (=> b!57755 m!48769))

(assert (=> b!57755 m!48119))

(declare-fun m!48771 () Bool)

(assert (=> b!57755 m!48771))

(assert (=> b!57755 m!48771))

(declare-fun m!48773 () Bool)

(assert (=> b!57755 m!48773))

(assert (=> b!57757 m!48119))

(assert (=> b!57757 m!48771))

(assert (=> b!57757 m!48771))

(assert (=> b!57757 m!48773))

(assert (=> b!57433 d!10681))

(declare-fun d!10683 () Bool)

(assert (=> d!10683 (= (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57552 d!10683))

(assert (=> b!57463 d!10683))

(declare-fun b!57758 () Bool)

(declare-fun e!38042 () Bool)

(assert (=> b!57758 (= e!38042 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!57758 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!10685 () Bool)

(declare-fun e!38040 () Bool)

(assert (=> d!10685 e!38040))

(declare-fun res!32292 () Bool)

(assert (=> d!10685 (=> (not res!32292) (not e!38040))))

(declare-fun lt!23079 () ListLongMap!1349)

(assert (=> d!10685 (= res!32292 (not (contains!677 lt!23079 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!38041 () ListLongMap!1349)

(assert (=> d!10685 (= lt!23079 e!38041)))

(declare-fun c!7180 () Bool)

(assert (=> d!10685 (= c!7180 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> d!10685 (validMask!0 (mask!5894 (v!2361 (underlying!220 thiss!992))))))

(assert (=> d!10685 (= (getCurrentListMapNoExtraKeys!43 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))) lt!23079)))

(declare-fun b!57759 () Bool)

(declare-fun e!38045 () Bool)

(declare-fun e!38046 () Bool)

(assert (=> b!57759 (= e!38045 e!38046)))

(declare-fun c!7179 () Bool)

(assert (=> b!57759 (= c!7179 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun bm!4209 () Bool)

(declare-fun call!4212 () ListLongMap!1349)

(assert (=> bm!4209 (= call!4212 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun b!57760 () Bool)

(declare-fun res!32291 () Bool)

(assert (=> b!57760 (=> (not res!32291) (not e!38040))))

(assert (=> b!57760 (= res!32291 (not (contains!677 lt!23079 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!57761 () Bool)

(assert (=> b!57761 (= e!38046 (isEmpty!294 lt!23079))))

(declare-fun b!57762 () Bool)

(assert (=> b!57762 (= e!38040 e!38045)))

(declare-fun c!7181 () Bool)

(assert (=> b!57762 (= c!7181 e!38042)))

(declare-fun res!32290 () Bool)

(assert (=> b!57762 (=> (not res!32290) (not e!38042))))

(assert (=> b!57762 (= res!32290 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!57763 () Bool)

(assert (=> b!57763 (= e!38046 (= lt!23079 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (_values!2004 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992))) (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) (minValue!1939 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!57764 () Bool)

(declare-fun e!38043 () ListLongMap!1349)

(assert (=> b!57764 (= e!38043 call!4212)))

(declare-fun b!57765 () Bool)

(declare-fun lt!23080 () Unit!1484)

(declare-fun lt!23077 () Unit!1484)

(assert (=> b!57765 (= lt!23080 lt!23077)))

(declare-fun lt!23081 () (_ BitVec 64))

(declare-fun lt!23082 () (_ BitVec 64))

(declare-fun lt!23078 () V!2833)

(declare-fun lt!23076 () ListLongMap!1349)

(assert (=> b!57765 (not (contains!677 (+!80 lt!23076 (tuple2!2025 lt!23082 lt!23078)) lt!23081))))

(assert (=> b!57765 (= lt!23077 (addStillNotContains!15 lt!23076 lt!23082 lt!23078 lt!23081))))

(assert (=> b!57765 (= lt!23081 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!57765 (= lt!23078 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57765 (= lt!23082 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!57765 (= lt!23076 call!4212)))

(assert (=> b!57765 (= e!38043 (+!80 call!4212 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!57766 () Bool)

(assert (=> b!57766 (= e!38041 e!38043)))

(declare-fun c!7178 () Bool)

(assert (=> b!57766 (= c!7178 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!57767 () Bool)

(declare-fun e!38044 () Bool)

(assert (=> b!57767 (= e!38045 e!38044)))

(assert (=> b!57767 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun res!32289 () Bool)

(assert (=> b!57767 (= res!32289 (contains!677 lt!23079 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!57767 (=> (not res!32289) (not e!38044))))

(declare-fun b!57768 () Bool)

(assert (=> b!57768 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> b!57768 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!1993 (_values!2004 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> b!57768 (= e!38044 (= (apply!65 lt!23079 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!57769 () Bool)

(assert (=> b!57769 (= e!38041 (ListLongMap!1350 Nil!1428))))

(assert (= (and d!10685 c!7180) b!57769))

(assert (= (and d!10685 (not c!7180)) b!57766))

(assert (= (and b!57766 c!7178) b!57765))

(assert (= (and b!57766 (not c!7178)) b!57764))

(assert (= (or b!57765 b!57764) bm!4209))

(assert (= (and d!10685 res!32292) b!57760))

(assert (= (and b!57760 res!32291) b!57762))

(assert (= (and b!57762 res!32290) b!57758))

(assert (= (and b!57762 c!7181) b!57767))

(assert (= (and b!57762 (not c!7181)) b!57759))

(assert (= (and b!57767 res!32289) b!57768))

(assert (= (and b!57759 c!7179) b!57763))

(assert (= (and b!57759 (not c!7179)) b!57761))

(declare-fun b_lambda!2525 () Bool)

(assert (=> (not b_lambda!2525) (not b!57765)))

(assert (=> b!57765 t!4740))

(declare-fun b_and!3485 () Bool)

(assert (= b_and!3481 (and (=> t!4740 result!2333) b_and!3485)))

(assert (=> b!57765 t!4742))

(declare-fun b_and!3487 () Bool)

(assert (= b_and!3483 (and (=> t!4742 result!2337) b_and!3487)))

(declare-fun b_lambda!2527 () Bool)

(assert (=> (not b_lambda!2527) (not b!57768)))

(assert (=> b!57768 t!4740))

(declare-fun b_and!3489 () Bool)

(assert (= b_and!3485 (and (=> t!4740 result!2333) b_and!3489)))

(assert (=> b!57768 t!4742))

(declare-fun b_and!3491 () Bool)

(assert (= b_and!3487 (and (=> t!4742 result!2337) b_and!3491)))

(assert (=> b!57766 m!48307))

(assert (=> b!57766 m!48307))

(declare-fun m!48775 () Bool)

(assert (=> b!57766 m!48775))

(declare-fun m!48777 () Bool)

(assert (=> b!57761 m!48777))

(declare-fun m!48779 () Bool)

(assert (=> b!57763 m!48779))

(declare-fun m!48781 () Bool)

(assert (=> d!10685 m!48781))

(assert (=> d!10685 m!47927))

(assert (=> b!57765 m!47937))

(declare-fun m!48783 () Bool)

(assert (=> b!57765 m!48783))

(assert (=> b!57765 m!47937))

(declare-fun m!48785 () Bool)

(assert (=> b!57765 m!48785))

(assert (=> b!57765 m!48783))

(declare-fun m!48787 () Bool)

(assert (=> b!57765 m!48787))

(declare-fun m!48789 () Bool)

(assert (=> b!57765 m!48789))

(declare-fun m!48791 () Bool)

(assert (=> b!57765 m!48791))

(assert (=> b!57765 m!48307))

(assert (=> b!57765 m!48791))

(declare-fun m!48793 () Bool)

(assert (=> b!57765 m!48793))

(assert (=> bm!4209 m!48779))

(assert (=> b!57768 m!48783))

(assert (=> b!57768 m!47937))

(assert (=> b!57768 m!48783))

(assert (=> b!57768 m!47937))

(assert (=> b!57768 m!48785))

(assert (=> b!57768 m!48307))

(declare-fun m!48795 () Bool)

(assert (=> b!57768 m!48795))

(assert (=> b!57768 m!48307))

(declare-fun m!48797 () Bool)

(assert (=> b!57760 m!48797))

(assert (=> b!57758 m!48307))

(assert (=> b!57758 m!48307))

(assert (=> b!57758 m!48775))

(assert (=> b!57767 m!48307))

(assert (=> b!57767 m!48307))

(declare-fun m!48799 () Bool)

(assert (=> b!57767 m!48799))

(assert (=> b!57429 d!10685))

(declare-fun d!10687 () Bool)

(assert (=> d!10687 (= (isDefined!75 (getValueByKey!121 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!295 (getValueByKey!121 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!2498 () Bool)

(assert (= bs!2498 d!10687))

(assert (=> bs!2498 m!48407))

(declare-fun m!48801 () Bool)

(assert (=> bs!2498 m!48801))

(assert (=> b!57636 d!10687))

(declare-fun b!57771 () Bool)

(declare-fun e!38047 () Option!127)

(declare-fun e!38048 () Option!127)

(assert (=> b!57771 (= e!38047 e!38048)))

(declare-fun c!7183 () Bool)

(assert (=> b!57771 (= c!7183 (and ((_ is Cons!1427) (toList!690 lt!22766)) (not (= (_1!1023 (h!2007 (toList!690 lt!22766))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!57773 () Bool)

(assert (=> b!57773 (= e!38048 None!125)))

(declare-fun b!57772 () Bool)

(assert (=> b!57772 (= e!38048 (getValueByKey!121 (t!4744 (toList!690 lt!22766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57770 () Bool)

(assert (=> b!57770 (= e!38047 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22766)))))))

(declare-fun d!10689 () Bool)

(declare-fun c!7182 () Bool)

(assert (=> d!10689 (= c!7182 (and ((_ is Cons!1427) (toList!690 lt!22766)) (= (_1!1023 (h!2007 (toList!690 lt!22766))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10689 (= (getValueByKey!121 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000) e!38047)))

(assert (= (and d!10689 c!7182) b!57770))

(assert (= (and d!10689 (not c!7182)) b!57771))

(assert (= (and b!57771 c!7183) b!57772))

(assert (= (and b!57771 (not c!7183)) b!57773))

(declare-fun m!48803 () Bool)

(assert (=> b!57772 m!48803))

(assert (=> b!57636 d!10689))

(declare-fun d!10691 () Bool)

(declare-fun lt!23083 () Bool)

(assert (=> d!10691 (= lt!23083 (select (content!61 (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun e!38050 () Bool)

(assert (=> d!10691 (= lt!23083 e!38050)))

(declare-fun res!32293 () Bool)

(assert (=> d!10691 (=> (not res!32293) (not e!38050))))

(assert (=> d!10691 (= res!32293 ((_ is Cons!1426) (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427)))))

(assert (=> d!10691 (= (contains!680 (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))) lt!23083)))

(declare-fun b!57774 () Bool)

(declare-fun e!38049 () Bool)

(assert (=> b!57774 (= e!38050 e!38049)))

(declare-fun res!32294 () Bool)

(assert (=> b!57774 (=> res!32294 e!38049)))

(assert (=> b!57774 (= res!32294 (= (h!2006 (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!57775 () Bool)

(assert (=> b!57775 (= e!38049 (contains!680 (t!4743 (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!10691 res!32293) b!57774))

(assert (= (and b!57774 (not res!32294)) b!57775))

(declare-fun m!48805 () Bool)

(assert (=> d!10691 m!48805))

(assert (=> d!10691 m!48343))

(declare-fun m!48807 () Bool)

(assert (=> d!10691 m!48807))

(assert (=> b!57775 m!48343))

(declare-fun m!48809 () Bool)

(assert (=> b!57775 m!48809))

(assert (=> b!57506 d!10691))

(declare-fun d!10693 () Bool)

(declare-fun res!32295 () Bool)

(declare-fun e!38051 () Bool)

(assert (=> d!10693 (=> res!32295 e!38051)))

(assert (=> d!10693 (= res!32295 (and ((_ is Cons!1427) (toList!690 e!37742)) (= (_1!1023 (h!2007 (toList!690 e!37742))) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666))))))))

(assert (=> d!10693 (= (containsKey!125 (toList!690 e!37742) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))) e!38051)))

(declare-fun b!57776 () Bool)

(declare-fun e!38052 () Bool)

(assert (=> b!57776 (= e!38051 e!38052)))

(declare-fun res!32296 () Bool)

(assert (=> b!57776 (=> (not res!32296) (not e!38052))))

(assert (=> b!57776 (= res!32296 (and (or (not ((_ is Cons!1427) (toList!690 e!37742))) (bvsle (_1!1023 (h!2007 (toList!690 e!37742))) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666))))) ((_ is Cons!1427) (toList!690 e!37742)) (bvslt (_1!1023 (h!2007 (toList!690 e!37742))) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666))))))))

(declare-fun b!57777 () Bool)

(assert (=> b!57777 (= e!38052 (containsKey!125 (t!4744 (toList!690 e!37742)) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))))))

(assert (= (and d!10693 (not res!32295)) b!57776))

(assert (= (and b!57776 res!32296) b!57777))

(declare-fun m!48811 () Bool)

(assert (=> b!57777 m!48811))

(assert (=> d!10627 d!10693))

(declare-fun d!10695 () Bool)

(declare-fun lt!23086 () Bool)

(declare-fun content!62 (List!1431) (InoxSet tuple2!2024))

(assert (=> d!10695 (= lt!23086 (select (content!62 (toList!690 lt!22817)) (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun e!38058 () Bool)

(assert (=> d!10695 (= lt!23086 e!38058)))

(declare-fun res!32301 () Bool)

(assert (=> d!10695 (=> (not res!32301) (not e!38058))))

(assert (=> d!10695 (= res!32301 ((_ is Cons!1427) (toList!690 lt!22817)))))

(assert (=> d!10695 (= (contains!681 (toList!690 lt!22817) (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!23086)))

(declare-fun b!57782 () Bool)

(declare-fun e!38057 () Bool)

(assert (=> b!57782 (= e!38058 e!38057)))

(declare-fun res!32302 () Bool)

(assert (=> b!57782 (=> res!32302 e!38057)))

(assert (=> b!57782 (= res!32302 (= (h!2007 (toList!690 lt!22817)) (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!57783 () Bool)

(assert (=> b!57783 (= e!38057 (contains!681 (t!4744 (toList!690 lt!22817)) (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(assert (= (and d!10695 res!32301) b!57782))

(assert (= (and b!57782 (not res!32302)) b!57783))

(declare-fun m!48813 () Bool)

(assert (=> d!10695 m!48813))

(declare-fun m!48815 () Bool)

(assert (=> d!10695 m!48815))

(declare-fun m!48817 () Bool)

(assert (=> b!57783 m!48817))

(assert (=> b!57449 d!10695))

(assert (=> b!57702 d!10585))

(declare-fun lt!23087 () Bool)

(declare-fun d!10697 () Bool)

(assert (=> d!10697 (= lt!23087 (select (content!62 (toList!690 lt!22885)) (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun e!38060 () Bool)

(assert (=> d!10697 (= lt!23087 e!38060)))

(declare-fun res!32303 () Bool)

(assert (=> d!10697 (=> (not res!32303) (not e!38060))))

(assert (=> d!10697 (= res!32303 ((_ is Cons!1427) (toList!690 lt!22885)))))

(assert (=> d!10697 (= (contains!681 (toList!690 lt!22885) (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23087)))

(declare-fun b!57784 () Bool)

(declare-fun e!38059 () Bool)

(assert (=> b!57784 (= e!38060 e!38059)))

(declare-fun res!32304 () Bool)

(assert (=> b!57784 (=> res!32304 e!38059)))

(assert (=> b!57784 (= res!32304 (= (h!2007 (toList!690 lt!22885)) (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!57785 () Bool)

(assert (=> b!57785 (= e!38059 (contains!681 (t!4744 (toList!690 lt!22885)) (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (= (and d!10697 res!32303) b!57784))

(assert (= (and b!57784 (not res!32304)) b!57785))

(declare-fun m!48819 () Bool)

(assert (=> d!10697 m!48819))

(declare-fun m!48821 () Bool)

(assert (=> d!10697 m!48821))

(declare-fun m!48823 () Bool)

(assert (=> b!57785 m!48823))

(assert (=> b!57576 d!10697))

(declare-fun d!10699 () Bool)

(assert (=> d!10699 (= (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22745)) (v!2367 (getValueByKey!121 (toList!690 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22745)))))

(assert (=> d!10557 d!10699))

(declare-fun b!57787 () Bool)

(declare-fun e!38061 () Option!127)

(declare-fun e!38062 () Option!127)

(assert (=> b!57787 (= e!38061 e!38062)))

(declare-fun c!7185 () Bool)

(assert (=> b!57787 (= c!7185 (and ((_ is Cons!1427) (toList!690 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) (not (= (_1!1023 (h!2007 (toList!690 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))) lt!22745))))))

(declare-fun b!57789 () Bool)

(assert (=> b!57789 (= e!38062 None!125)))

(declare-fun b!57788 () Bool)

(assert (=> b!57788 (= e!38062 (getValueByKey!121 (t!4744 (toList!690 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) lt!22745))))

(declare-fun b!57786 () Bool)

(assert (=> b!57786 (= e!38061 (Some!126 (_2!1023 (h!2007 (toList!690 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))))

(declare-fun c!7184 () Bool)

(declare-fun d!10701 () Bool)

(assert (=> d!10701 (= c!7184 (and ((_ is Cons!1427) (toList!690 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) (= (_1!1023 (h!2007 (toList!690 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))) lt!22745)))))

(assert (=> d!10701 (= (getValueByKey!121 (toList!690 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22745) e!38061)))

(assert (= (and d!10701 c!7184) b!57786))

(assert (= (and d!10701 (not c!7184)) b!57787))

(assert (= (and b!57787 c!7185) b!57788))

(assert (= (and b!57787 (not c!7185)) b!57789))

(declare-fun m!48825 () Bool)

(assert (=> b!57788 m!48825))

(assert (=> d!10557 d!10701))

(declare-fun d!10703 () Bool)

(assert (=> d!10703 (= (get!1070 (getValueByKey!121 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2367 (getValueByKey!121 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10605 d!10703))

(declare-fun b!57791 () Bool)

(declare-fun e!38063 () Option!127)

(declare-fun e!38064 () Option!127)

(assert (=> b!57791 (= e!38063 e!38064)))

(declare-fun c!7187 () Bool)

(assert (=> b!57791 (= c!7187 (and ((_ is Cons!1427) (toList!690 lt!22766)) (not (= (_1!1023 (h!2007 (toList!690 lt!22766))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!57793 () Bool)

(assert (=> b!57793 (= e!38064 None!125)))

(declare-fun b!57792 () Bool)

(assert (=> b!57792 (= e!38064 (getValueByKey!121 (t!4744 (toList!690 lt!22766)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57790 () Bool)

(assert (=> b!57790 (= e!38063 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22766)))))))

(declare-fun d!10705 () Bool)

(declare-fun c!7186 () Bool)

(assert (=> d!10705 (= c!7186 (and ((_ is Cons!1427) (toList!690 lt!22766)) (= (_1!1023 (h!2007 (toList!690 lt!22766))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10705 (= (getValueByKey!121 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000) e!38063)))

(assert (= (and d!10705 c!7186) b!57790))

(assert (= (and d!10705 (not c!7186)) b!57791))

(assert (= (and b!57791 c!7187) b!57792))

(assert (= (and b!57791 (not c!7187)) b!57793))

(declare-fun m!48827 () Bool)

(assert (=> b!57792 m!48827))

(assert (=> d!10605 d!10705))

(assert (=> b!57468 d!10663))

(declare-fun b!57794 () Bool)

(declare-fun e!38067 () Bool)

(declare-fun call!4213 () Bool)

(assert (=> b!57794 (= e!38067 call!4213)))

(declare-fun d!10707 () Bool)

(declare-fun res!32306 () Bool)

(declare-fun e!38068 () Bool)

(assert (=> d!10707 (=> res!32306 e!38068)))

(assert (=> d!10707 (= res!32306 (bvsge (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> d!10707 (= (arrayNoDuplicates!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!7112 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427)) (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427))) e!38068)))

(declare-fun e!38066 () Bool)

(declare-fun b!57795 () Bool)

(assert (=> b!57795 (= e!38066 (contains!680 (ite c!7112 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427)) (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!57796 () Bool)

(declare-fun e!38065 () Bool)

(assert (=> b!57796 (= e!38065 e!38067)))

(declare-fun c!7188 () Bool)

(assert (=> b!57796 (= c!7188 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!57797 () Bool)

(assert (=> b!57797 (= e!38067 call!4213)))

(declare-fun b!57798 () Bool)

(assert (=> b!57798 (= e!38068 e!38065)))

(declare-fun res!32305 () Bool)

(assert (=> b!57798 (=> (not res!32305) (not e!38065))))

(assert (=> b!57798 (= res!32305 (not e!38066))))

(declare-fun res!32307 () Bool)

(assert (=> b!57798 (=> (not res!32307) (not e!38066))))

(assert (=> b!57798 (= res!32307 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!4210 () Bool)

(assert (=> bm!4210 (= call!4213 (arrayNoDuplicates!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!7188 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!7112 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427)) (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427))) (ite c!7112 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427)) (ite c!7067 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) Nil!1427) Nil!1427)))))))

(assert (= (and d!10707 (not res!32306)) b!57798))

(assert (= (and b!57798 res!32307) b!57795))

(assert (= (and b!57798 res!32305) b!57796))

(assert (= (and b!57796 c!7188) b!57797))

(assert (= (and b!57796 (not c!7188)) b!57794))

(assert (= (or b!57797 b!57794) bm!4210))

(declare-fun m!48829 () Bool)

(assert (=> b!57795 m!48829))

(assert (=> b!57795 m!48829))

(declare-fun m!48831 () Bool)

(assert (=> b!57795 m!48831))

(assert (=> b!57796 m!48829))

(assert (=> b!57796 m!48829))

(declare-fun m!48833 () Bool)

(assert (=> b!57796 m!48833))

(assert (=> b!57798 m!48829))

(assert (=> b!57798 m!48829))

(assert (=> b!57798 m!48833))

(assert (=> bm!4210 m!48829))

(declare-fun m!48835 () Bool)

(assert (=> bm!4210 m!48835))

(assert (=> bm!4169 d!10707))

(assert (=> b!57719 d!10683))

(declare-fun d!10709 () Bool)

(assert (=> d!10709 (= (apply!65 (+!80 lt!23058 (tuple2!2025 lt!23069 (minValue!1939 newMap!16))) lt!23066) (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!23058 (tuple2!2025 lt!23069 (minValue!1939 newMap!16)))) lt!23066)))))

(declare-fun bs!2499 () Bool)

(assert (= bs!2499 d!10709))

(declare-fun m!48837 () Bool)

(assert (=> bs!2499 m!48837))

(assert (=> bs!2499 m!48837))

(declare-fun m!48839 () Bool)

(assert (=> bs!2499 m!48839))

(assert (=> b!57735 d!10709))

(declare-fun d!10711 () Bool)

(assert (=> d!10711 (= (apply!65 (+!80 lt!23056 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16))) lt!23068) (apply!65 lt!23056 lt!23068))))

(declare-fun lt!23088 () Unit!1484)

(assert (=> d!10711 (= lt!23088 (choose!296 lt!23056 lt!23063 (zeroValue!1939 newMap!16) lt!23068))))

(declare-fun e!38069 () Bool)

(assert (=> d!10711 e!38069))

(declare-fun res!32308 () Bool)

(assert (=> d!10711 (=> (not res!32308) (not e!38069))))

(assert (=> d!10711 (= res!32308 (contains!677 lt!23056 lt!23068))))

(assert (=> d!10711 (= (addApplyDifferent!41 lt!23056 lt!23063 (zeroValue!1939 newMap!16) lt!23068) lt!23088)))

(declare-fun b!57799 () Bool)

(assert (=> b!57799 (= e!38069 (not (= lt!23068 lt!23063)))))

(assert (= (and d!10711 res!32308) b!57799))

(assert (=> d!10711 m!48727))

(assert (=> d!10711 m!48729))

(assert (=> d!10711 m!48719))

(declare-fun m!48841 () Bool)

(assert (=> d!10711 m!48841))

(declare-fun m!48843 () Bool)

(assert (=> d!10711 m!48843))

(assert (=> d!10711 m!48727))

(assert (=> b!57735 d!10711))

(declare-fun d!10713 () Bool)

(declare-fun e!38070 () Bool)

(assert (=> d!10713 e!38070))

(declare-fun res!32310 () Bool)

(assert (=> d!10713 (=> (not res!32310) (not e!38070))))

(declare-fun lt!23091 () ListLongMap!1349)

(assert (=> d!10713 (= res!32310 (contains!677 lt!23091 (_1!1023 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16)))))))

(declare-fun lt!23092 () List!1431)

(assert (=> d!10713 (= lt!23091 (ListLongMap!1350 lt!23092))))

(declare-fun lt!23089 () Unit!1484)

(declare-fun lt!23090 () Unit!1484)

(assert (=> d!10713 (= lt!23089 lt!23090)))

(assert (=> d!10713 (= (getValueByKey!121 lt!23092 (_1!1023 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16)))))))

(assert (=> d!10713 (= lt!23090 (lemmaContainsTupThenGetReturnValue!41 lt!23092 (_1!1023 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16)))))))

(assert (=> d!10713 (= lt!23092 (insertStrictlySorted!44 (toList!690 lt!23060) (_1!1023 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16)))))))

(assert (=> d!10713 (= (+!80 lt!23060 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16))) lt!23091)))

(declare-fun b!57800 () Bool)

(declare-fun res!32309 () Bool)

(assert (=> b!57800 (=> (not res!32309) (not e!38070))))

(assert (=> b!57800 (= res!32309 (= (getValueByKey!121 (toList!690 lt!23091) (_1!1023 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16))))))))

(declare-fun b!57801 () Bool)

(assert (=> b!57801 (= e!38070 (contains!681 (toList!690 lt!23091) (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16))))))

(assert (= (and d!10713 res!32310) b!57800))

(assert (= (and b!57800 res!32309) b!57801))

(declare-fun m!48845 () Bool)

(assert (=> d!10713 m!48845))

(declare-fun m!48847 () Bool)

(assert (=> d!10713 m!48847))

(declare-fun m!48849 () Bool)

(assert (=> d!10713 m!48849))

(declare-fun m!48851 () Bool)

(assert (=> d!10713 m!48851))

(declare-fun m!48853 () Bool)

(assert (=> b!57800 m!48853))

(declare-fun m!48855 () Bool)

(assert (=> b!57801 m!48855))

(assert (=> b!57735 d!10713))

(declare-fun d!10715 () Bool)

(declare-fun e!38071 () Bool)

(assert (=> d!10715 e!38071))

(declare-fun res!32312 () Bool)

(assert (=> d!10715 (=> (not res!32312) (not e!38071))))

(declare-fun lt!23095 () ListLongMap!1349)

(assert (=> d!10715 (= res!32312 (contains!677 lt!23095 (_1!1023 (tuple2!2025 lt!23069 (minValue!1939 newMap!16)))))))

(declare-fun lt!23096 () List!1431)

(assert (=> d!10715 (= lt!23095 (ListLongMap!1350 lt!23096))))

(declare-fun lt!23093 () Unit!1484)

(declare-fun lt!23094 () Unit!1484)

(assert (=> d!10715 (= lt!23093 lt!23094)))

(assert (=> d!10715 (= (getValueByKey!121 lt!23096 (_1!1023 (tuple2!2025 lt!23069 (minValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!23069 (minValue!1939 newMap!16)))))))

(assert (=> d!10715 (= lt!23094 (lemmaContainsTupThenGetReturnValue!41 lt!23096 (_1!1023 (tuple2!2025 lt!23069 (minValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!23069 (minValue!1939 newMap!16)))))))

(assert (=> d!10715 (= lt!23096 (insertStrictlySorted!44 (toList!690 lt!23058) (_1!1023 (tuple2!2025 lt!23069 (minValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!23069 (minValue!1939 newMap!16)))))))

(assert (=> d!10715 (= (+!80 lt!23058 (tuple2!2025 lt!23069 (minValue!1939 newMap!16))) lt!23095)))

(declare-fun b!57802 () Bool)

(declare-fun res!32311 () Bool)

(assert (=> b!57802 (=> (not res!32311) (not e!38071))))

(assert (=> b!57802 (= res!32311 (= (getValueByKey!121 (toList!690 lt!23095) (_1!1023 (tuple2!2025 lt!23069 (minValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!23069 (minValue!1939 newMap!16))))))))

(declare-fun b!57803 () Bool)

(assert (=> b!57803 (= e!38071 (contains!681 (toList!690 lt!23095) (tuple2!2025 lt!23069 (minValue!1939 newMap!16))))))

(assert (= (and d!10715 res!32312) b!57802))

(assert (= (and b!57802 res!32311) b!57803))

(declare-fun m!48857 () Bool)

(assert (=> d!10715 m!48857))

(declare-fun m!48859 () Bool)

(assert (=> d!10715 m!48859))

(declare-fun m!48861 () Bool)

(assert (=> d!10715 m!48861))

(declare-fun m!48863 () Bool)

(assert (=> d!10715 m!48863))

(declare-fun m!48865 () Bool)

(assert (=> b!57802 m!48865))

(declare-fun m!48867 () Bool)

(assert (=> b!57803 m!48867))

(assert (=> b!57735 d!10715))

(declare-fun d!10717 () Bool)

(declare-fun e!38072 () Bool)

(assert (=> d!10717 e!38072))

(declare-fun res!32314 () Bool)

(assert (=> d!10717 (=> (not res!32314) (not e!38072))))

(declare-fun lt!23099 () ListLongMap!1349)

(assert (=> d!10717 (= res!32314 (contains!677 lt!23099 (_1!1023 (tuple2!2025 lt!23052 (minValue!1939 newMap!16)))))))

(declare-fun lt!23100 () List!1431)

(assert (=> d!10717 (= lt!23099 (ListLongMap!1350 lt!23100))))

(declare-fun lt!23097 () Unit!1484)

(declare-fun lt!23098 () Unit!1484)

(assert (=> d!10717 (= lt!23097 lt!23098)))

(assert (=> d!10717 (= (getValueByKey!121 lt!23100 (_1!1023 (tuple2!2025 lt!23052 (minValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!23052 (minValue!1939 newMap!16)))))))

(assert (=> d!10717 (= lt!23098 (lemmaContainsTupThenGetReturnValue!41 lt!23100 (_1!1023 (tuple2!2025 lt!23052 (minValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!23052 (minValue!1939 newMap!16)))))))

(assert (=> d!10717 (= lt!23100 (insertStrictlySorted!44 (toList!690 lt!23051) (_1!1023 (tuple2!2025 lt!23052 (minValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!23052 (minValue!1939 newMap!16)))))))

(assert (=> d!10717 (= (+!80 lt!23051 (tuple2!2025 lt!23052 (minValue!1939 newMap!16))) lt!23099)))

(declare-fun b!57804 () Bool)

(declare-fun res!32313 () Bool)

(assert (=> b!57804 (=> (not res!32313) (not e!38072))))

(assert (=> b!57804 (= res!32313 (= (getValueByKey!121 (toList!690 lt!23099) (_1!1023 (tuple2!2025 lt!23052 (minValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!23052 (minValue!1939 newMap!16))))))))

(declare-fun b!57805 () Bool)

(assert (=> b!57805 (= e!38072 (contains!681 (toList!690 lt!23099) (tuple2!2025 lt!23052 (minValue!1939 newMap!16))))))

(assert (= (and d!10717 res!32314) b!57804))

(assert (= (and b!57804 res!32313) b!57805))

(declare-fun m!48869 () Bool)

(assert (=> d!10717 m!48869))

(declare-fun m!48871 () Bool)

(assert (=> d!10717 m!48871))

(declare-fun m!48873 () Bool)

(assert (=> d!10717 m!48873))

(declare-fun m!48875 () Bool)

(assert (=> d!10717 m!48875))

(declare-fun m!48877 () Bool)

(assert (=> b!57804 m!48877))

(declare-fun m!48879 () Bool)

(assert (=> b!57805 m!48879))

(assert (=> b!57735 d!10717))

(declare-fun b!57806 () Bool)

(declare-fun e!38075 () Bool)

(assert (=> b!57806 (= e!38075 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!57806 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!10719 () Bool)

(declare-fun e!38073 () Bool)

(assert (=> d!10719 e!38073))

(declare-fun res!32318 () Bool)

(assert (=> d!10719 (=> (not res!32318) (not e!38073))))

(declare-fun lt!23104 () ListLongMap!1349)

(assert (=> d!10719 (= res!32318 (not (contains!677 lt!23104 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!38074 () ListLongMap!1349)

(assert (=> d!10719 (= lt!23104 e!38074)))

(declare-fun c!7191 () Bool)

(assert (=> d!10719 (= c!7191 (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10719 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10719 (= (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) lt!23104)))

(declare-fun b!57807 () Bool)

(declare-fun e!38078 () Bool)

(declare-fun e!38079 () Bool)

(assert (=> b!57807 (= e!38078 e!38079)))

(declare-fun c!7190 () Bool)

(assert (=> b!57807 (= c!7190 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun bm!4211 () Bool)

(declare-fun call!4214 () ListLongMap!1349)

(assert (=> bm!4211 (= call!4214 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2021 newMap!16)))))

(declare-fun b!57808 () Bool)

(declare-fun res!32317 () Bool)

(assert (=> b!57808 (=> (not res!32317) (not e!38073))))

(assert (=> b!57808 (= res!32317 (not (contains!677 lt!23104 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!57809 () Bool)

(assert (=> b!57809 (= e!38079 (isEmpty!294 lt!23104))))

(declare-fun b!57810 () Bool)

(assert (=> b!57810 (= e!38073 e!38078)))

(declare-fun c!7192 () Bool)

(assert (=> b!57810 (= c!7192 e!38075)))

(declare-fun res!32316 () Bool)

(assert (=> b!57810 (=> (not res!32316) (not e!38075))))

(assert (=> b!57810 (= res!32316 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57811 () Bool)

(assert (=> b!57811 (= e!38079 (= lt!23104 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2021 newMap!16))))))

(declare-fun b!57812 () Bool)

(declare-fun e!38076 () ListLongMap!1349)

(assert (=> b!57812 (= e!38076 call!4214)))

(declare-fun b!57813 () Bool)

(declare-fun lt!23105 () Unit!1484)

(declare-fun lt!23102 () Unit!1484)

(assert (=> b!57813 (= lt!23105 lt!23102)))

(declare-fun lt!23101 () ListLongMap!1349)

(declare-fun lt!23103 () V!2833)

(declare-fun lt!23107 () (_ BitVec 64))

(declare-fun lt!23106 () (_ BitVec 64))

(assert (=> b!57813 (not (contains!677 (+!80 lt!23101 (tuple2!2025 lt!23107 lt!23103)) lt!23106))))

(assert (=> b!57813 (= lt!23102 (addStillNotContains!15 lt!23101 lt!23107 lt!23103 lt!23106))))

(assert (=> b!57813 (= lt!23106 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!57813 (= lt!23103 (get!1065 (select (arr!1763 lt!22683) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57813 (= lt!23107 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!57813 (= lt!23101 call!4214)))

(assert (=> b!57813 (= e!38076 (+!80 call!4214 (tuple2!2025 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) (get!1065 (select (arr!1763 lt!22683) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!57814 () Bool)

(assert (=> b!57814 (= e!38074 e!38076)))

(declare-fun c!7189 () Bool)

(assert (=> b!57814 (= c!7189 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!57815 () Bool)

(declare-fun e!38077 () Bool)

(assert (=> b!57815 (= e!38078 e!38077)))

(assert (=> b!57815 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun res!32315 () Bool)

(assert (=> b!57815 (= res!32315 (contains!677 lt!23104 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!57815 (=> (not res!32315) (not e!38077))))

(declare-fun b!57816 () Bool)

(assert (=> b!57816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> b!57816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1993 lt!22683)))))

(assert (=> b!57816 (= e!38077 (= (apply!65 lt!23104 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (get!1065 (select (arr!1763 lt!22683) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!57817 () Bool)

(assert (=> b!57817 (= e!38074 (ListLongMap!1350 Nil!1428))))

(assert (= (and d!10719 c!7191) b!57817))

(assert (= (and d!10719 (not c!7191)) b!57814))

(assert (= (and b!57814 c!7189) b!57813))

(assert (= (and b!57814 (not c!7189)) b!57812))

(assert (= (or b!57813 b!57812) bm!4211))

(assert (= (and d!10719 res!32318) b!57808))

(assert (= (and b!57808 res!32317) b!57810))

(assert (= (and b!57810 res!32316) b!57806))

(assert (= (and b!57810 c!7192) b!57815))

(assert (= (and b!57810 (not c!7192)) b!57807))

(assert (= (and b!57815 res!32315) b!57816))

(assert (= (and b!57807 c!7190) b!57811))

(assert (= (and b!57807 (not c!7190)) b!57809))

(declare-fun b_lambda!2529 () Bool)

(assert (=> (not b_lambda!2529) (not b!57813)))

(assert (=> b!57813 t!4758))

(declare-fun b_and!3493 () Bool)

(assert (= b_and!3489 (and (=> t!4758 result!2353) b_and!3493)))

(assert (=> b!57813 t!4760))

(declare-fun b_and!3495 () Bool)

(assert (= b_and!3491 (and (=> t!4760 result!2355) b_and!3495)))

(declare-fun b_lambda!2531 () Bool)

(assert (=> (not b_lambda!2531) (not b!57816)))

(assert (=> b!57816 t!4758))

(declare-fun b_and!3497 () Bool)

(assert (= b_and!3493 (and (=> t!4758 result!2353) b_and!3497)))

(assert (=> b!57816 t!4760))

(declare-fun b_and!3499 () Bool)

(assert (= b_and!3495 (and (=> t!4760 result!2355) b_and!3499)))

(assert (=> b!57814 m!48317))

(assert (=> b!57814 m!48317))

(assert (=> b!57814 m!48321))

(declare-fun m!48881 () Bool)

(assert (=> b!57809 m!48881))

(declare-fun m!48883 () Bool)

(assert (=> b!57811 m!48883))

(declare-fun m!48885 () Bool)

(assert (=> d!10719 m!48885))

(assert (=> d!10719 m!48335))

(assert (=> b!57813 m!48353))

(assert (=> b!57813 m!48695))

(assert (=> b!57813 m!48353))

(assert (=> b!57813 m!48697))

(assert (=> b!57813 m!48695))

(declare-fun m!48887 () Bool)

(assert (=> b!57813 m!48887))

(declare-fun m!48889 () Bool)

(assert (=> b!57813 m!48889))

(declare-fun m!48891 () Bool)

(assert (=> b!57813 m!48891))

(assert (=> b!57813 m!48317))

(assert (=> b!57813 m!48891))

(declare-fun m!48893 () Bool)

(assert (=> b!57813 m!48893))

(assert (=> bm!4211 m!48883))

(assert (=> b!57816 m!48695))

(assert (=> b!57816 m!48353))

(assert (=> b!57816 m!48695))

(assert (=> b!57816 m!48353))

(assert (=> b!57816 m!48697))

(assert (=> b!57816 m!48317))

(declare-fun m!48895 () Bool)

(assert (=> b!57816 m!48895))

(assert (=> b!57816 m!48317))

(declare-fun m!48897 () Bool)

(assert (=> b!57808 m!48897))

(assert (=> b!57806 m!48317))

(assert (=> b!57806 m!48317))

(assert (=> b!57806 m!48321))

(assert (=> b!57815 m!48317))

(assert (=> b!57815 m!48317))

(declare-fun m!48899 () Bool)

(assert (=> b!57815 m!48899))

(assert (=> b!57735 d!10719))

(declare-fun d!10721 () Bool)

(declare-fun e!38080 () Bool)

(assert (=> d!10721 e!38080))

(declare-fun res!32319 () Bool)

(assert (=> d!10721 (=> res!32319 e!38080)))

(declare-fun lt!23108 () Bool)

(assert (=> d!10721 (= res!32319 (not lt!23108))))

(declare-fun lt!23111 () Bool)

(assert (=> d!10721 (= lt!23108 lt!23111)))

(declare-fun lt!23110 () Unit!1484)

(declare-fun e!38081 () Unit!1484)

(assert (=> d!10721 (= lt!23110 e!38081)))

(declare-fun c!7193 () Bool)

(assert (=> d!10721 (= c!7193 lt!23111)))

(assert (=> d!10721 (= lt!23111 (containsKey!125 (toList!690 (+!80 lt!23060 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16)))) lt!23053))))

(assert (=> d!10721 (= (contains!677 (+!80 lt!23060 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16))) lt!23053) lt!23108)))

(declare-fun b!57818 () Bool)

(declare-fun lt!23109 () Unit!1484)

(assert (=> b!57818 (= e!38081 lt!23109)))

(assert (=> b!57818 (= lt!23109 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 (+!80 lt!23060 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16)))) lt!23053))))

(assert (=> b!57818 (isDefined!75 (getValueByKey!121 (toList!690 (+!80 lt!23060 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16)))) lt!23053))))

(declare-fun b!57819 () Bool)

(declare-fun Unit!1513 () Unit!1484)

(assert (=> b!57819 (= e!38081 Unit!1513)))

(declare-fun b!57820 () Bool)

(assert (=> b!57820 (= e!38080 (isDefined!75 (getValueByKey!121 (toList!690 (+!80 lt!23060 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16)))) lt!23053)))))

(assert (= (and d!10721 c!7193) b!57818))

(assert (= (and d!10721 (not c!7193)) b!57819))

(assert (= (and d!10721 (not res!32319)) b!57820))

(declare-fun m!48901 () Bool)

(assert (=> d!10721 m!48901))

(declare-fun m!48903 () Bool)

(assert (=> b!57818 m!48903))

(declare-fun m!48905 () Bool)

(assert (=> b!57818 m!48905))

(assert (=> b!57818 m!48905))

(declare-fun m!48907 () Bool)

(assert (=> b!57818 m!48907))

(assert (=> b!57820 m!48905))

(assert (=> b!57820 m!48905))

(assert (=> b!57820 m!48907))

(assert (=> b!57735 d!10721))

(declare-fun d!10723 () Bool)

(declare-fun e!38082 () Bool)

(assert (=> d!10723 e!38082))

(declare-fun res!32321 () Bool)

(assert (=> d!10723 (=> (not res!32321) (not e!38082))))

(declare-fun lt!23114 () ListLongMap!1349)

(assert (=> d!10723 (= res!32321 (contains!677 lt!23114 (_1!1023 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16)))))))

(declare-fun lt!23115 () List!1431)

(assert (=> d!10723 (= lt!23114 (ListLongMap!1350 lt!23115))))

(declare-fun lt!23112 () Unit!1484)

(declare-fun lt!23113 () Unit!1484)

(assert (=> d!10723 (= lt!23112 lt!23113)))

(assert (=> d!10723 (= (getValueByKey!121 lt!23115 (_1!1023 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16)))))))

(assert (=> d!10723 (= lt!23113 (lemmaContainsTupThenGetReturnValue!41 lt!23115 (_1!1023 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16)))))))

(assert (=> d!10723 (= lt!23115 (insertStrictlySorted!44 (toList!690 lt!23056) (_1!1023 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16)))))))

(assert (=> d!10723 (= (+!80 lt!23056 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16))) lt!23114)))

(declare-fun b!57821 () Bool)

(declare-fun res!32320 () Bool)

(assert (=> b!57821 (=> (not res!32320) (not e!38082))))

(assert (=> b!57821 (= res!32320 (= (getValueByKey!121 (toList!690 lt!23114) (_1!1023 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16))))))))

(declare-fun b!57822 () Bool)

(assert (=> b!57822 (= e!38082 (contains!681 (toList!690 lt!23114) (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16))))))

(assert (= (and d!10723 res!32321) b!57821))

(assert (= (and b!57821 res!32320) b!57822))

(declare-fun m!48909 () Bool)

(assert (=> d!10723 m!48909))

(declare-fun m!48911 () Bool)

(assert (=> d!10723 m!48911))

(declare-fun m!48913 () Bool)

(assert (=> d!10723 m!48913))

(declare-fun m!48915 () Bool)

(assert (=> d!10723 m!48915))

(declare-fun m!48917 () Bool)

(assert (=> b!57821 m!48917))

(declare-fun m!48919 () Bool)

(assert (=> b!57822 m!48919))

(assert (=> b!57735 d!10723))

(declare-fun d!10725 () Bool)

(assert (=> d!10725 (= (apply!65 (+!80 lt!23058 (tuple2!2025 lt!23069 (minValue!1939 newMap!16))) lt!23066) (apply!65 lt!23058 lt!23066))))

(declare-fun lt!23116 () Unit!1484)

(assert (=> d!10725 (= lt!23116 (choose!296 lt!23058 lt!23069 (minValue!1939 newMap!16) lt!23066))))

(declare-fun e!38083 () Bool)

(assert (=> d!10725 e!38083))

(declare-fun res!32322 () Bool)

(assert (=> d!10725 (=> (not res!32322) (not e!38083))))

(assert (=> d!10725 (= res!32322 (contains!677 lt!23058 lt!23066))))

(assert (=> d!10725 (= (addApplyDifferent!41 lt!23058 lt!23069 (minValue!1939 newMap!16) lt!23066) lt!23116)))

(declare-fun b!57823 () Bool)

(assert (=> b!57823 (= e!38083 (not (= lt!23066 lt!23069)))))

(assert (= (and d!10725 res!32322) b!57823))

(assert (=> d!10725 m!48725))

(assert (=> d!10725 m!48733))

(assert (=> d!10725 m!48717))

(declare-fun m!48921 () Bool)

(assert (=> d!10725 m!48921))

(declare-fun m!48923 () Bool)

(assert (=> d!10725 m!48923))

(assert (=> d!10725 m!48725))

(assert (=> b!57735 d!10725))

(declare-fun d!10727 () Bool)

(assert (=> d!10727 (= (apply!65 (+!80 lt!23056 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16))) lt!23068) (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!23056 (tuple2!2025 lt!23063 (zeroValue!1939 newMap!16)))) lt!23068)))))

(declare-fun bs!2500 () Bool)

(assert (= bs!2500 d!10727))

(declare-fun m!48925 () Bool)

(assert (=> bs!2500 m!48925))

(assert (=> bs!2500 m!48925))

(declare-fun m!48927 () Bool)

(assert (=> bs!2500 m!48927))

(assert (=> b!57735 d!10727))

(declare-fun d!10729 () Bool)

(assert (=> d!10729 (= (apply!65 lt!23056 lt!23068) (get!1070 (getValueByKey!121 (toList!690 lt!23056) lt!23068)))))

(declare-fun bs!2501 () Bool)

(assert (= bs!2501 d!10729))

(declare-fun m!48929 () Bool)

(assert (=> bs!2501 m!48929))

(assert (=> bs!2501 m!48929))

(declare-fun m!48931 () Bool)

(assert (=> bs!2501 m!48931))

(assert (=> b!57735 d!10729))

(declare-fun d!10731 () Bool)

(assert (=> d!10731 (= (apply!65 (+!80 lt!23051 (tuple2!2025 lt!23052 (minValue!1939 newMap!16))) lt!23049) (apply!65 lt!23051 lt!23049))))

(declare-fun lt!23117 () Unit!1484)

(assert (=> d!10731 (= lt!23117 (choose!296 lt!23051 lt!23052 (minValue!1939 newMap!16) lt!23049))))

(declare-fun e!38084 () Bool)

(assert (=> d!10731 e!38084))

(declare-fun res!32323 () Bool)

(assert (=> d!10731 (=> (not res!32323) (not e!38084))))

(assert (=> d!10731 (= res!32323 (contains!677 lt!23051 lt!23049))))

(assert (=> d!10731 (= (addApplyDifferent!41 lt!23051 lt!23052 (minValue!1939 newMap!16) lt!23049) lt!23117)))

(declare-fun b!57824 () Bool)

(assert (=> b!57824 (= e!38084 (not (= lt!23049 lt!23052)))))

(assert (= (and d!10731 res!32323) b!57824))

(assert (=> d!10731 m!48735))

(assert (=> d!10731 m!48743))

(assert (=> d!10731 m!48739))

(declare-fun m!48933 () Bool)

(assert (=> d!10731 m!48933))

(declare-fun m!48935 () Bool)

(assert (=> d!10731 m!48935))

(assert (=> d!10731 m!48735))

(assert (=> b!57735 d!10731))

(declare-fun d!10733 () Bool)

(assert (=> d!10733 (= (apply!65 (+!80 lt!23051 (tuple2!2025 lt!23052 (minValue!1939 newMap!16))) lt!23049) (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!23051 (tuple2!2025 lt!23052 (minValue!1939 newMap!16)))) lt!23049)))))

(declare-fun bs!2502 () Bool)

(assert (= bs!2502 d!10733))

(declare-fun m!48937 () Bool)

(assert (=> bs!2502 m!48937))

(assert (=> bs!2502 m!48937))

(declare-fun m!48939 () Bool)

(assert (=> bs!2502 m!48939))

(assert (=> b!57735 d!10733))

(declare-fun d!10735 () Bool)

(assert (=> d!10735 (= (apply!65 lt!23058 lt!23066) (get!1070 (getValueByKey!121 (toList!690 lt!23058) lt!23066)))))

(declare-fun bs!2503 () Bool)

(assert (= bs!2503 d!10735))

(declare-fun m!48941 () Bool)

(assert (=> bs!2503 m!48941))

(assert (=> bs!2503 m!48941))

(declare-fun m!48943 () Bool)

(assert (=> bs!2503 m!48943))

(assert (=> b!57735 d!10735))

(declare-fun d!10737 () Bool)

(assert (=> d!10737 (contains!677 (+!80 lt!23060 (tuple2!2025 lt!23055 (zeroValue!1939 newMap!16))) lt!23053)))

(declare-fun lt!23118 () Unit!1484)

(assert (=> d!10737 (= lt!23118 (choose!295 lt!23060 lt!23055 (zeroValue!1939 newMap!16) lt!23053))))

(assert (=> d!10737 (contains!677 lt!23060 lt!23053)))

(assert (=> d!10737 (= (addStillContains!41 lt!23060 lt!23055 (zeroValue!1939 newMap!16) lt!23053) lt!23118)))

(declare-fun bs!2504 () Bool)

(assert (= bs!2504 d!10737))

(assert (=> bs!2504 m!48721))

(assert (=> bs!2504 m!48721))

(assert (=> bs!2504 m!48731))

(declare-fun m!48945 () Bool)

(assert (=> bs!2504 m!48945))

(declare-fun m!48947 () Bool)

(assert (=> bs!2504 m!48947))

(assert (=> b!57735 d!10737))

(declare-fun d!10739 () Bool)

(assert (=> d!10739 (= (apply!65 lt!23051 lt!23049) (get!1070 (getValueByKey!121 (toList!690 lt!23051) lt!23049)))))

(declare-fun bs!2505 () Bool)

(assert (= bs!2505 d!10739))

(declare-fun m!48949 () Bool)

(assert (=> bs!2505 m!48949))

(assert (=> bs!2505 m!48949))

(declare-fun m!48951 () Bool)

(assert (=> bs!2505 m!48951))

(assert (=> b!57735 d!10739))

(declare-fun d!10741 () Bool)

(declare-fun e!38085 () Bool)

(assert (=> d!10741 e!38085))

(declare-fun res!32324 () Bool)

(assert (=> d!10741 (=> res!32324 e!38085)))

(declare-fun lt!23119 () Bool)

(assert (=> d!10741 (= res!32324 (not lt!23119))))

(declare-fun lt!23122 () Bool)

(assert (=> d!10741 (= lt!23119 lt!23122)))

(declare-fun lt!23121 () Unit!1484)

(declare-fun e!38086 () Unit!1484)

(assert (=> d!10741 (= lt!23121 e!38086)))

(declare-fun c!7194 () Bool)

(assert (=> d!10741 (= c!7194 lt!23122)))

(assert (=> d!10741 (= lt!23122 (containsKey!125 (toList!690 lt!22752) lt!22764))))

(assert (=> d!10741 (= (contains!677 lt!22752 lt!22764) lt!23119)))

(declare-fun b!57825 () Bool)

(declare-fun lt!23120 () Unit!1484)

(assert (=> b!57825 (= e!38086 lt!23120)))

(assert (=> b!57825 (= lt!23120 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22752) lt!22764))))

(assert (=> b!57825 (isDefined!75 (getValueByKey!121 (toList!690 lt!22752) lt!22764))))

(declare-fun b!57826 () Bool)

(declare-fun Unit!1514 () Unit!1484)

(assert (=> b!57826 (= e!38086 Unit!1514)))

(declare-fun b!57827 () Bool)

(assert (=> b!57827 (= e!38085 (isDefined!75 (getValueByKey!121 (toList!690 lt!22752) lt!22764)))))

(assert (= (and d!10741 c!7194) b!57825))

(assert (= (and d!10741 (not c!7194)) b!57826))

(assert (= (and d!10741 (not res!32324)) b!57827))

(declare-fun m!48953 () Bool)

(assert (=> d!10741 m!48953))

(declare-fun m!48955 () Bool)

(assert (=> b!57825 m!48955))

(assert (=> b!57825 m!48223))

(assert (=> b!57825 m!48223))

(declare-fun m!48957 () Bool)

(assert (=> b!57825 m!48957))

(assert (=> b!57827 m!48223))

(assert (=> b!57827 m!48223))

(assert (=> b!57827 m!48957))

(assert (=> d!10553 d!10741))

(assert (=> d!10553 d!10549))

(assert (=> d!10553 d!10571))

(assert (=> d!10553 d!10565))

(declare-fun d!10743 () Bool)

(assert (=> d!10743 (= (apply!65 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22764) (apply!65 lt!22752 lt!22764))))

(assert (=> d!10743 true))

(declare-fun _$34!751 () Unit!1484)

(assert (=> d!10743 (= (choose!296 lt!22752 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22764) _$34!751)))

(declare-fun bs!2506 () Bool)

(assert (= bs!2506 d!10743))

(assert (=> bs!2506 m!48163))

(assert (=> bs!2506 m!48163))

(assert (=> bs!2506 m!48165))

(assert (=> bs!2506 m!48155))

(assert (=> d!10553 d!10743))

(declare-fun d!10745 () Bool)

(assert (=> d!10745 (contains!677 (getCurrentListMap!387 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))))

(assert (=> d!10745 true))

(declare-fun _$16!75 () Unit!1484)

(assert (=> d!10745 (= (choose!302 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (index!3039 lt!22666) (defaultEntry!2021 newMap!16)) _$16!75)))

(declare-fun bs!2507 () Bool)

(assert (= bs!2507 d!10745))

(assert (=> bs!2507 m!48063))

(assert (=> bs!2507 m!48095))

(assert (=> bs!2507 m!48063))

(assert (=> bs!2507 m!48095))

(assert (=> bs!2507 m!48613))

(assert (=> d!10647 d!10745))

(declare-fun d!10747 () Bool)

(assert (=> d!10747 (= (validMask!0 (mask!5894 newMap!16)) (and (or (= (mask!5894 newMap!16) #b00000000000000000000000000000111) (= (mask!5894 newMap!16) #b00000000000000000000000000001111) (= (mask!5894 newMap!16) #b00000000000000000000000000011111) (= (mask!5894 newMap!16) #b00000000000000000000000000111111) (= (mask!5894 newMap!16) #b00000000000000000000000001111111) (= (mask!5894 newMap!16) #b00000000000000000000000011111111) (= (mask!5894 newMap!16) #b00000000000000000000000111111111) (= (mask!5894 newMap!16) #b00000000000000000000001111111111) (= (mask!5894 newMap!16) #b00000000000000000000011111111111) (= (mask!5894 newMap!16) #b00000000000000000000111111111111) (= (mask!5894 newMap!16) #b00000000000000000001111111111111) (= (mask!5894 newMap!16) #b00000000000000000011111111111111) (= (mask!5894 newMap!16) #b00000000000000000111111111111111) (= (mask!5894 newMap!16) #b00000000000000001111111111111111) (= (mask!5894 newMap!16) #b00000000000000011111111111111111) (= (mask!5894 newMap!16) #b00000000000000111111111111111111) (= (mask!5894 newMap!16) #b00000000000001111111111111111111) (= (mask!5894 newMap!16) #b00000000000011111111111111111111) (= (mask!5894 newMap!16) #b00000000000111111111111111111111) (= (mask!5894 newMap!16) #b00000000001111111111111111111111) (= (mask!5894 newMap!16) #b00000000011111111111111111111111) (= (mask!5894 newMap!16) #b00000000111111111111111111111111) (= (mask!5894 newMap!16) #b00000001111111111111111111111111) (= (mask!5894 newMap!16) #b00000011111111111111111111111111) (= (mask!5894 newMap!16) #b00000111111111111111111111111111) (= (mask!5894 newMap!16) #b00001111111111111111111111111111) (= (mask!5894 newMap!16) #b00011111111111111111111111111111) (= (mask!5894 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5894 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10647 d!10747))

(assert (=> d!10585 d!10617))

(declare-fun b!57845 () Bool)

(declare-fun e!38096 () Bool)

(declare-fun lt!23125 () SeekEntryResult!229)

(assert (=> b!57845 (= e!38096 ((_ is Undefined!229) lt!23125))))

(declare-fun call!4219 () Bool)

(declare-fun c!7199 () Bool)

(declare-fun bm!4216 () Bool)

(assert (=> bm!4216 (= call!4219 (inRange!0 (ite c!7199 (index!3038 lt!23125) (index!3041 lt!23125)) (mask!5894 newMap!16)))))

(declare-fun d!10749 () Bool)

(declare-fun e!38097 () Bool)

(assert (=> d!10749 e!38097))

(assert (=> d!10749 (= c!7199 ((_ is MissingZero!229) lt!23125))))

(assert (=> d!10749 (= lt!23125 (seekEntryOrOpen!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(assert (=> d!10749 true))

(declare-fun _$34!754 () Unit!1484)

(assert (=> d!10749 (= (choose!298 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (defaultEntry!2021 newMap!16)) _$34!754)))

(declare-fun b!57846 () Bool)

(declare-fun e!38095 () Bool)

(assert (=> b!57846 (= e!38097 e!38095)))

(declare-fun res!32336 () Bool)

(assert (=> b!57846 (= res!32336 call!4219)))

(assert (=> b!57846 (=> (not res!32336) (not e!38095))))

(declare-fun b!57847 () Bool)

(assert (=> b!57847 (= e!38097 e!38096)))

(declare-fun c!7200 () Bool)

(assert (=> b!57847 (= c!7200 ((_ is MissingVacant!229) lt!23125))))

(declare-fun b!57848 () Bool)

(declare-fun res!32335 () Bool)

(declare-fun e!38098 () Bool)

(assert (=> b!57848 (=> (not res!32335) (not e!38098))))

(assert (=> b!57848 (= res!32335 call!4219)))

(assert (=> b!57848 (= e!38096 e!38098)))

(declare-fun b!57849 () Bool)

(declare-fun res!32334 () Bool)

(assert (=> b!57849 (=> (not res!32334) (not e!38098))))

(assert (=> b!57849 (= res!32334 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3041 lt!23125)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57850 () Bool)

(declare-fun call!4220 () Bool)

(assert (=> b!57850 (= e!38095 (not call!4220))))

(declare-fun b!57851 () Bool)

(assert (=> b!57851 (= e!38098 (not call!4220))))

(declare-fun bm!4217 () Bool)

(assert (=> bm!4217 (= call!4220 (arrayContainsKey!0 (_keys!3640 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!57852 () Bool)

(declare-fun res!32333 () Bool)

(assert (=> b!57852 (= res!32333 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3038 lt!23125)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!57852 (=> (not res!32333) (not e!38095))))

(assert (= (and d!10749 c!7199) b!57846))

(assert (= (and d!10749 (not c!7199)) b!57847))

(assert (= (and b!57846 res!32336) b!57852))

(assert (= (and b!57852 res!32333) b!57850))

(assert (= (and b!57847 c!7200) b!57848))

(assert (= (and b!57847 (not c!7200)) b!57845))

(assert (= (and b!57848 res!32335) b!57849))

(assert (= (and b!57849 res!32334) b!57851))

(assert (= (or b!57846 b!57848) bm!4216))

(assert (= (or b!57850 b!57851) bm!4217))

(declare-fun m!48959 () Bool)

(assert (=> b!57849 m!48959))

(assert (=> bm!4217 m!47913))

(assert (=> bm!4217 m!48109))

(declare-fun m!48961 () Bool)

(assert (=> bm!4216 m!48961))

(declare-fun m!48963 () Bool)

(assert (=> b!57852 m!48963))

(assert (=> d!10749 m!47913))

(assert (=> d!10749 m!48067))

(assert (=> d!10585 d!10749))

(assert (=> d!10585 d!10747))

(declare-fun d!10751 () Bool)

(assert (=> d!10751 (arrayContainsKey!0 (_keys!3640 newMap!16) lt!22912 #b00000000000000000000000000000000)))

(declare-fun lt!23128 () Unit!1484)

(declare-fun choose!13 (array!3683 (_ BitVec 64) (_ BitVec 32)) Unit!1484)

(assert (=> d!10751 (= lt!23128 (choose!13 (_keys!3640 newMap!16) lt!22912 #b00000000000000000000000000000000))))

(assert (=> d!10751 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10751 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3640 newMap!16) lt!22912 #b00000000000000000000000000000000) lt!23128)))

(declare-fun bs!2508 () Bool)

(assert (= bs!2508 d!10751))

(assert (=> bs!2508 m!48529))

(declare-fun m!48965 () Bool)

(assert (=> bs!2508 m!48965))

(assert (=> b!57611 d!10751))

(declare-fun d!10753 () Bool)

(declare-fun res!32337 () Bool)

(declare-fun e!38099 () Bool)

(assert (=> d!10753 (=> res!32337 e!38099)))

(assert (=> d!10753 (= res!32337 (= (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) lt!22912))))

(assert (=> d!10753 (= (arrayContainsKey!0 (_keys!3640 newMap!16) lt!22912 #b00000000000000000000000000000000) e!38099)))

(declare-fun b!57853 () Bool)

(declare-fun e!38100 () Bool)

(assert (=> b!57853 (= e!38099 e!38100)))

(declare-fun res!32338 () Bool)

(assert (=> b!57853 (=> (not res!32338) (not e!38100))))

(assert (=> b!57853 (= res!32338 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57854 () Bool)

(assert (=> b!57854 (= e!38100 (arrayContainsKey!0 (_keys!3640 newMap!16) lt!22912 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10753 (not res!32337)) b!57853))

(assert (= (and b!57853 res!32338) b!57854))

(assert (=> d!10753 m!48317))

(declare-fun m!48967 () Bool)

(assert (=> b!57854 m!48967))

(assert (=> b!57611 d!10753))

(declare-fun d!10755 () Bool)

(declare-fun lt!23130 () SeekEntryResult!229)

(assert (=> d!10755 (and (or ((_ is Undefined!229) lt!23130) (not ((_ is Found!229) lt!23130)) (and (bvsge (index!3039 lt!23130) #b00000000000000000000000000000000) (bvslt (index!3039 lt!23130) (size!1992 (_keys!3640 newMap!16))))) (or ((_ is Undefined!229) lt!23130) ((_ is Found!229) lt!23130) (not ((_ is MissingZero!229) lt!23130)) (and (bvsge (index!3038 lt!23130) #b00000000000000000000000000000000) (bvslt (index!3038 lt!23130) (size!1992 (_keys!3640 newMap!16))))) (or ((_ is Undefined!229) lt!23130) ((_ is Found!229) lt!23130) ((_ is MissingZero!229) lt!23130) (not ((_ is MissingVacant!229) lt!23130)) (and (bvsge (index!3041 lt!23130) #b00000000000000000000000000000000) (bvslt (index!3041 lt!23130) (size!1992 (_keys!3640 newMap!16))))) (or ((_ is Undefined!229) lt!23130) (ite ((_ is Found!229) lt!23130) (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!23130)) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!229) lt!23130) (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3038 lt!23130)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!229) lt!23130) (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3041 lt!23130)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!38103 () SeekEntryResult!229)

(assert (=> d!10755 (= lt!23130 e!38103)))

(declare-fun c!7202 () Bool)

(declare-fun lt!23129 () SeekEntryResult!229)

(assert (=> d!10755 (= c!7202 (and ((_ is Intermediate!229) lt!23129) (undefined!1041 lt!23129)))))

(assert (=> d!10755 (= lt!23129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) (mask!5894 newMap!16)) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(assert (=> d!10755 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10755 (= (seekEntryOrOpen!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) (_keys!3640 newMap!16) (mask!5894 newMap!16)) lt!23130)))

(declare-fun b!57855 () Bool)

(declare-fun c!7201 () Bool)

(declare-fun lt!23131 () (_ BitVec 64))

(assert (=> b!57855 (= c!7201 (= lt!23131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!38101 () SeekEntryResult!229)

(declare-fun e!38102 () SeekEntryResult!229)

(assert (=> b!57855 (= e!38101 e!38102)))

(declare-fun b!57856 () Bool)

(assert (=> b!57856 (= e!38103 Undefined!229)))

(declare-fun b!57857 () Bool)

(assert (=> b!57857 (= e!38102 (seekKeyOrZeroReturnVacant!0 (x!9860 lt!23129) (index!3040 lt!23129) (index!3040 lt!23129) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(declare-fun b!57858 () Bool)

(assert (=> b!57858 (= e!38103 e!38101)))

(assert (=> b!57858 (= lt!23131 (select (arr!1762 (_keys!3640 newMap!16)) (index!3040 lt!23129)))))

(declare-fun c!7203 () Bool)

(assert (=> b!57858 (= c!7203 (= lt!23131 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!57859 () Bool)

(assert (=> b!57859 (= e!38102 (MissingZero!229 (index!3040 lt!23129)))))

(declare-fun b!57860 () Bool)

(assert (=> b!57860 (= e!38101 (Found!229 (index!3040 lt!23129)))))

(assert (= (and d!10755 c!7202) b!57856))

(assert (= (and d!10755 (not c!7202)) b!57858))

(assert (= (and b!57858 c!7203) b!57860))

(assert (= (and b!57858 (not c!7203)) b!57855))

(assert (= (and b!57855 c!7201) b!57859))

(assert (= (and b!57855 (not c!7201)) b!57857))

(declare-fun m!48969 () Bool)

(assert (=> d!10755 m!48969))

(assert (=> d!10755 m!48335))

(declare-fun m!48971 () Bool)

(assert (=> d!10755 m!48971))

(declare-fun m!48973 () Bool)

(assert (=> d!10755 m!48973))

(assert (=> d!10755 m!48317))

(declare-fun m!48975 () Bool)

(assert (=> d!10755 m!48975))

(declare-fun m!48977 () Bool)

(assert (=> d!10755 m!48977))

(assert (=> d!10755 m!48317))

(assert (=> d!10755 m!48973))

(assert (=> b!57857 m!48317))

(declare-fun m!48979 () Bool)

(assert (=> b!57857 m!48979))

(declare-fun m!48981 () Bool)

(assert (=> b!57858 m!48981))

(assert (=> b!57611 d!10755))

(declare-fun d!10757 () Bool)

(assert (=> d!10757 (= (apply!65 lt!23070 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1070 (getValueByKey!121 (toList!690 lt!23070) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2509 () Bool)

(assert (= bs!2509 d!10757))

(declare-fun m!48983 () Bool)

(assert (=> bs!2509 m!48983))

(assert (=> bs!2509 m!48983))

(declare-fun m!48985 () Bool)

(assert (=> bs!2509 m!48985))

(assert (=> b!57737 d!10757))

(declare-fun d!10759 () Bool)

(declare-fun e!38104 () Bool)

(assert (=> d!10759 e!38104))

(declare-fun res!32340 () Bool)

(assert (=> d!10759 (=> (not res!32340) (not e!38104))))

(declare-fun lt!23134 () ListLongMap!1349)

(assert (=> d!10759 (= res!32340 (contains!677 lt!23134 (_1!1023 (ite (or c!7116 c!7114) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))))))))

(declare-fun lt!23135 () List!1431)

(assert (=> d!10759 (= lt!23134 (ListLongMap!1350 lt!23135))))

(declare-fun lt!23132 () Unit!1484)

(declare-fun lt!23133 () Unit!1484)

(assert (=> d!10759 (= lt!23132 lt!23133)))

(assert (=> d!10759 (= (getValueByKey!121 lt!23135 (_1!1023 (ite (or c!7116 c!7114) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))))) (Some!126 (_2!1023 (ite (or c!7116 c!7114) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))))))))

(assert (=> d!10759 (= lt!23133 (lemmaContainsTupThenGetReturnValue!41 lt!23135 (_1!1023 (ite (or c!7116 c!7114) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))) (_2!1023 (ite (or c!7116 c!7114) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))))))))

(assert (=> d!10759 (= lt!23135 (insertStrictlySorted!44 (toList!690 (ite c!7116 call!4178 (ite c!7114 call!4176 call!4175))) (_1!1023 (ite (or c!7116 c!7114) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))) (_2!1023 (ite (or c!7116 c!7114) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))))))))

(assert (=> d!10759 (= (+!80 (ite c!7116 call!4178 (ite c!7114 call!4176 call!4175)) (ite (or c!7116 c!7114) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))) lt!23134)))

(declare-fun b!57861 () Bool)

(declare-fun res!32339 () Bool)

(assert (=> b!57861 (=> (not res!32339) (not e!38104))))

(assert (=> b!57861 (= res!32339 (= (getValueByKey!121 (toList!690 lt!23134) (_1!1023 (ite (or c!7116 c!7114) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))))) (Some!126 (_2!1023 (ite (or c!7116 c!7114) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))))

(declare-fun b!57862 () Bool)

(assert (=> b!57862 (= e!38104 (contains!681 (toList!690 lt!23134) (ite (or c!7116 c!7114) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(assert (= (and d!10759 res!32340) b!57861))

(assert (= (and b!57861 res!32339) b!57862))

(declare-fun m!48987 () Bool)

(assert (=> d!10759 m!48987))

(declare-fun m!48989 () Bool)

(assert (=> d!10759 m!48989))

(declare-fun m!48991 () Bool)

(assert (=> d!10759 m!48991))

(declare-fun m!48993 () Bool)

(assert (=> d!10759 m!48993))

(declare-fun m!48995 () Bool)

(assert (=> b!57861 m!48995))

(declare-fun m!48997 () Bool)

(assert (=> b!57862 m!48997))

(assert (=> bm!4174 d!10759))

(declare-fun d!10761 () Bool)

(declare-fun res!32341 () Bool)

(declare-fun e!38105 () Bool)

(assert (=> d!10761 (=> res!32341 e!38105)))

(assert (=> d!10761 (= res!32341 (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!10761 (= (arrayContainsKey!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) e!38105)))

(declare-fun b!57863 () Bool)

(declare-fun e!38106 () Bool)

(assert (=> b!57863 (= e!38105 e!38106)))

(declare-fun res!32342 () Bool)

(assert (=> b!57863 (=> (not res!32342) (not e!38106))))

(assert (=> b!57863 (= res!32342 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!57864 () Bool)

(assert (=> b!57864 (= e!38106 (arrayContainsKey!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!10761 (not res!32341)) b!57863))

(assert (= (and b!57863 res!32342) b!57864))

(declare-fun m!48999 () Bool)

(assert (=> d!10761 m!48999))

(assert (=> b!57864 m!47913))

(declare-fun m!49001 () Bool)

(assert (=> b!57864 m!49001))

(assert (=> b!57454 d!10761))

(assert (=> b!57659 d!10683))

(declare-fun b!57865 () Bool)

(declare-fun e!38108 () (_ BitVec 32))

(declare-fun call!4221 () (_ BitVec 32))

(assert (=> b!57865 (= e!38108 (bvadd #b00000000000000000000000000000001 call!4221))))

(declare-fun b!57866 () Bool)

(assert (=> b!57866 (= e!38108 call!4221)))

(declare-fun bm!4218 () Bool)

(assert (=> bm!4218 (= call!4221 (arrayCountValidKeys!0 (_keys!3640 (_2!1022 lt!22687)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1992 (_keys!3640 (_2!1022 lt!22687)))))))

(declare-fun b!57867 () Bool)

(declare-fun e!38107 () (_ BitVec 32))

(assert (=> b!57867 (= e!38107 #b00000000000000000000000000000000)))

(declare-fun b!57868 () Bool)

(assert (=> b!57868 (= e!38107 e!38108)))

(declare-fun c!7205 () Bool)

(assert (=> b!57868 (= c!7205 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000)))))

(declare-fun d!10763 () Bool)

(declare-fun lt!23136 () (_ BitVec 32))

(assert (=> d!10763 (and (bvsge lt!23136 #b00000000000000000000000000000000) (bvsle lt!23136 (bvsub (size!1992 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000)))))

(assert (=> d!10763 (= lt!23136 e!38107)))

(declare-fun c!7204 () Bool)

(assert (=> d!10763 (= c!7204 (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 (_2!1022 lt!22687)))))))

(assert (=> d!10763 (and (bvsle #b00000000000000000000000000000000 (size!1992 (_keys!3640 (_2!1022 lt!22687)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1992 (_keys!3640 (_2!1022 lt!22687))) (size!1992 (_keys!3640 (_2!1022 lt!22687)))))))

(assert (=> d!10763 (= (arrayCountValidKeys!0 (_keys!3640 (_2!1022 lt!22687)) #b00000000000000000000000000000000 (size!1992 (_keys!3640 (_2!1022 lt!22687)))) lt!23136)))

(assert (= (and d!10763 c!7204) b!57867))

(assert (= (and d!10763 (not c!7204)) b!57868))

(assert (= (and b!57868 c!7205) b!57865))

(assert (= (and b!57868 (not c!7205)) b!57866))

(assert (= (or b!57865 b!57866) bm!4218))

(declare-fun m!49003 () Bool)

(assert (=> bm!4218 m!49003))

(declare-fun m!49005 () Bool)

(assert (=> b!57868 m!49005))

(assert (=> b!57868 m!49005))

(declare-fun m!49007 () Bool)

(assert (=> b!57868 m!49007))

(assert (=> b!57560 d!10763))

(declare-fun d!10765 () Bool)

(declare-fun e!38109 () Bool)

(assert (=> d!10765 e!38109))

(declare-fun res!32344 () Bool)

(assert (=> d!10765 (=> (not res!32344) (not e!38109))))

(declare-fun lt!23139 () ListLongMap!1349)

(assert (=> d!10765 (= res!32344 (contains!677 lt!23139 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!23140 () List!1431)

(assert (=> d!10765 (= lt!23139 (ListLongMap!1350 lt!23140))))

(declare-fun lt!23137 () Unit!1484)

(declare-fun lt!23138 () Unit!1484)

(assert (=> d!10765 (= lt!23137 lt!23138)))

(assert (=> d!10765 (= (getValueByKey!121 lt!23140 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!126 (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10765 (= lt!23138 (lemmaContainsTupThenGetReturnValue!41 lt!23140 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10765 (= lt!23140 (insertStrictlySorted!44 (toList!690 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10765 (= (+!80 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!23139)))

(declare-fun b!57869 () Bool)

(declare-fun res!32343 () Bool)

(assert (=> b!57869 (=> (not res!32343) (not e!38109))))

(assert (=> b!57869 (= res!32343 (= (getValueByKey!121 (toList!690 lt!23139) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!126 (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!57870 () Bool)

(assert (=> b!57870 (= e!38109 (contains!681 (toList!690 lt!23139) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!10765 res!32344) b!57869))

(assert (= (and b!57869 res!32343) b!57870))

(declare-fun m!49009 () Bool)

(assert (=> d!10765 m!49009))

(declare-fun m!49011 () Bool)

(assert (=> d!10765 m!49011))

(declare-fun m!49013 () Bool)

(assert (=> d!10765 m!49013))

(declare-fun m!49015 () Bool)

(assert (=> d!10765 m!49015))

(declare-fun m!49017 () Bool)

(assert (=> b!57869 m!49017))

(declare-fun m!49019 () Bool)

(assert (=> b!57870 m!49019))

(assert (=> d!10661 d!10765))

(declare-fun b!57871 () Bool)

(declare-fun e!38112 () Bool)

(declare-fun call!4222 () Bool)

(assert (=> b!57871 (= e!38112 call!4222)))

(declare-fun d!10767 () Bool)

(declare-fun res!32346 () Bool)

(declare-fun e!38113 () Bool)

(assert (=> d!10767 (=> res!32346 e!38113)))

(assert (=> d!10767 (= res!32346 (bvsge lt!23024 (size!1992 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))))))))

(assert (=> d!10767 (= (arrayNoDuplicates!0 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) lt!23024 lt!23022) e!38113)))

(declare-fun e!38111 () Bool)

(declare-fun b!57872 () Bool)

(assert (=> b!57872 (= e!38111 (contains!680 lt!23022 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) lt!23024)))))

(declare-fun b!57873 () Bool)

(declare-fun e!38110 () Bool)

(assert (=> b!57873 (= e!38110 e!38112)))

(declare-fun c!7206 () Bool)

(assert (=> b!57873 (= c!7206 (validKeyInArray!0 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) lt!23024)))))

(declare-fun b!57874 () Bool)

(assert (=> b!57874 (= e!38112 call!4222)))

(declare-fun b!57875 () Bool)

(assert (=> b!57875 (= e!38113 e!38110)))

(declare-fun res!32345 () Bool)

(assert (=> b!57875 (=> (not res!32345) (not e!38110))))

(assert (=> b!57875 (= res!32345 (not e!38111))))

(declare-fun res!32347 () Bool)

(assert (=> b!57875 (=> (not res!32347) (not e!38111))))

(assert (=> b!57875 (= res!32347 (validKeyInArray!0 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) lt!23024)))))

(declare-fun bm!4219 () Bool)

(assert (=> bm!4219 (= call!4222 (arrayNoDuplicates!0 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (bvadd lt!23024 #b00000000000000000000000000000001) (ite c!7206 (Cons!1426 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) lt!23024) lt!23022) lt!23022)))))

(assert (= (and d!10767 (not res!32346)) b!57875))

(assert (= (and b!57875 res!32347) b!57872))

(assert (= (and b!57875 res!32345) b!57873))

(assert (= (and b!57873 c!7206) b!57874))

(assert (= (and b!57873 (not c!7206)) b!57871))

(assert (= (or b!57874 b!57871) bm!4219))

(declare-fun m!49021 () Bool)

(assert (=> b!57872 m!49021))

(assert (=> b!57872 m!49021))

(declare-fun m!49023 () Bool)

(assert (=> b!57872 m!49023))

(assert (=> b!57873 m!49021))

(assert (=> b!57873 m!49021))

(declare-fun m!49025 () Bool)

(assert (=> b!57873 m!49025))

(assert (=> b!57875 m!49021))

(assert (=> b!57875 m!49021))

(assert (=> b!57875 m!49025))

(assert (=> bm!4219 m!49021))

(declare-fun m!49027 () Bool)

(assert (=> bm!4219 m!49027))

(assert (=> d!10661 d!10767))

(declare-fun d!10769 () Bool)

(declare-fun e!38116 () Bool)

(assert (=> d!10769 e!38116))

(declare-fun res!32350 () Bool)

(assert (=> d!10769 (=> (not res!32350) (not e!38116))))

(assert (=> d!10769 (= res!32350 (and (bvsge (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000000) (bvslt (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (size!1992 (_keys!3640 newMap!16)))))))

(declare-fun lt!23143 () Unit!1484)

(declare-fun choose!41 (array!3683 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1430) Unit!1484)

(assert (=> d!10769 (= lt!23143 (choose!41 (_keys!3640 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) lt!23024 lt!23022))))

(assert (=> d!10769 (bvslt (size!1992 (_keys!3640 newMap!16)) #b01111111111111111111111111111111)))

(assert (=> d!10769 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3640 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) lt!23024 lt!23022) lt!23143)))

(declare-fun b!57878 () Bool)

(assert (=> b!57878 (= e!38116 (arrayNoDuplicates!0 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) lt!23024 lt!23022))))

(assert (= (and d!10769 res!32350) b!57878))

(assert (=> d!10769 m!47913))

(declare-fun m!49029 () Bool)

(assert (=> d!10769 m!49029))

(assert (=> b!57878 m!48671))

(assert (=> b!57878 m!48687))

(assert (=> d!10661 d!10769))

(declare-fun d!10771 () Bool)

(assert (=> d!10771 (arrayContainsKey!0 lt!23029 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lt!23144 () Unit!1484)

(assert (=> d!10771 (= lt!23144 (choose!13 lt!23029 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666))))))

(assert (=> d!10771 (bvsge (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000000)))

(assert (=> d!10771 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!23029 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666))) lt!23144)))

(declare-fun bs!2510 () Bool)

(assert (= bs!2510 d!10771))

(assert (=> bs!2510 m!47913))

(assert (=> bs!2510 m!48689))

(assert (=> bs!2510 m!47913))

(declare-fun m!49031 () Bool)

(assert (=> bs!2510 m!49031))

(assert (=> d!10661 d!10771))

(declare-fun d!10773 () Bool)

(declare-fun e!38117 () Bool)

(assert (=> d!10773 e!38117))

(declare-fun res!32351 () Bool)

(assert (=> d!10773 (=> res!32351 e!38117)))

(declare-fun lt!23145 () Bool)

(assert (=> d!10773 (= res!32351 (not lt!23145))))

(declare-fun lt!23148 () Bool)

(assert (=> d!10773 (= lt!23145 lt!23148)))

(declare-fun lt!23147 () Unit!1484)

(declare-fun e!38118 () Unit!1484)

(assert (=> d!10773 (= lt!23147 e!38118)))

(declare-fun c!7207 () Bool)

(assert (=> d!10773 (= c!7207 lt!23148)))

(assert (=> d!10773 (= lt!23148 (containsKey!125 (toList!690 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!10773 (= (contains!677 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) lt!23145)))

(declare-fun b!57879 () Bool)

(declare-fun lt!23146 () Unit!1484)

(assert (=> b!57879 (= e!38118 lt!23146)))

(assert (=> b!57879 (= lt!23146 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> b!57879 (isDefined!75 (getValueByKey!121 (toList!690 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!57880 () Bool)

(declare-fun Unit!1515 () Unit!1484)

(assert (=> b!57880 (= e!38118 Unit!1515)))

(declare-fun b!57881 () Bool)

(assert (=> b!57881 (= e!38117 (isDefined!75 (getValueByKey!121 (toList!690 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (= (and d!10773 c!7207) b!57879))

(assert (= (and d!10773 (not c!7207)) b!57880))

(assert (= (and d!10773 (not res!32351)) b!57881))

(assert (=> d!10773 m!47913))

(declare-fun m!49033 () Bool)

(assert (=> d!10773 m!49033))

(assert (=> b!57879 m!47913))

(declare-fun m!49035 () Bool)

(assert (=> b!57879 m!49035))

(assert (=> b!57879 m!47913))

(declare-fun m!49037 () Bool)

(assert (=> b!57879 m!49037))

(assert (=> b!57879 m!49037))

(declare-fun m!49039 () Bool)

(assert (=> b!57879 m!49039))

(assert (=> b!57881 m!47913))

(assert (=> b!57881 m!49037))

(assert (=> b!57881 m!49037))

(assert (=> b!57881 m!49039))

(assert (=> d!10661 d!10773))

(assert (=> d!10661 d!10595))

(assert (=> d!10661 d!10505))

(declare-fun d!10775 () Bool)

(declare-fun e!38119 () Bool)

(assert (=> d!10775 e!38119))

(declare-fun res!32352 () Bool)

(assert (=> d!10775 (=> (not res!32352) (not e!38119))))

(assert (=> d!10775 (= res!32352 (and (bvsge (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000000) (bvslt (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (size!1992 lt!23034))))))

(declare-fun lt!23149 () Unit!1484)

(assert (=> d!10775 (= lt!23149 (choose!302 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (defaultEntry!2021 newMap!16)))))

(assert (=> d!10775 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10775 (= (lemmaValidKeyInArrayIsInListMap!73 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (defaultEntry!2021 newMap!16)) lt!23149)))

(declare-fun b!57882 () Bool)

(assert (=> b!57882 (= e!38119 (contains!677 (getCurrentListMap!387 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (select (arr!1762 lt!23034) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)))))))

(assert (= (and d!10775 res!32352) b!57882))

(declare-fun m!49041 () Bool)

(assert (=> d!10775 m!49041))

(assert (=> d!10775 m!48335))

(assert (=> b!57882 m!48661))

(declare-fun m!49043 () Bool)

(assert (=> b!57882 m!49043))

(assert (=> b!57882 m!48661))

(assert (=> b!57882 m!49043))

(declare-fun m!49045 () Bool)

(assert (=> b!57882 m!49045))

(assert (=> d!10661 d!10775))

(declare-fun b!57884 () Bool)

(declare-fun e!38122 () ListLongMap!1349)

(declare-fun call!4225 () ListLongMap!1349)

(assert (=> b!57884 (= e!38122 call!4225)))

(declare-fun b!57885 () Bool)

(declare-fun e!38126 () Bool)

(assert (=> b!57885 (= e!38126 (validKeyInArray!0 (select (arr!1762 lt!23034) #b00000000000000000000000000000000)))))

(declare-fun b!57886 () Bool)

(declare-fun e!38130 () Bool)

(declare-fun e!38127 () Bool)

(assert (=> b!57886 (= e!38130 e!38127)))

(declare-fun res!32353 () Bool)

(declare-fun call!4224 () Bool)

(assert (=> b!57886 (= res!32353 call!4224)))

(assert (=> b!57886 (=> (not res!32353) (not e!38127))))

(declare-fun b!57887 () Bool)

(declare-fun e!38128 () ListLongMap!1349)

(declare-fun e!38131 () ListLongMap!1349)

(assert (=> b!57887 (= e!38128 e!38131)))

(declare-fun c!7209 () Bool)

(assert (=> b!57887 (= c!7209 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!57888 () Bool)

(declare-fun c!7210 () Bool)

(assert (=> b!57888 (= c!7210 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!57888 (= e!38131 e!38122)))

(declare-fun bm!4220 () Bool)

(declare-fun call!4226 () ListLongMap!1349)

(declare-fun call!4228 () ListLongMap!1349)

(assert (=> bm!4220 (= call!4226 call!4228)))

(declare-fun b!57889 () Bool)

(declare-fun e!38121 () Bool)

(declare-fun e!38120 () Bool)

(assert (=> b!57889 (= e!38121 e!38120)))

(declare-fun res!32359 () Bool)

(assert (=> b!57889 (=> (not res!32359) (not e!38120))))

(declare-fun lt!23171 () ListLongMap!1349)

(assert (=> b!57889 (= res!32359 (contains!677 lt!23171 (select (arr!1762 lt!23034) #b00000000000000000000000000000000)))))

(assert (=> b!57889 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 lt!23034)))))

(declare-fun b!57890 () Bool)

(declare-fun e!38129 () Unit!1484)

(declare-fun Unit!1516 () Unit!1484)

(assert (=> b!57890 (= e!38129 Unit!1516)))

(declare-fun b!57891 () Bool)

(declare-fun call!4229 () ListLongMap!1349)

(assert (=> b!57891 (= e!38128 (+!80 call!4229 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))

(declare-fun d!10777 () Bool)

(declare-fun e!38123 () Bool)

(assert (=> d!10777 e!38123))

(declare-fun res!32357 () Bool)

(assert (=> d!10777 (=> (not res!32357) (not e!38123))))

(assert (=> d!10777 (= res!32357 (or (bvsge #b00000000000000000000000000000000 (size!1992 lt!23034)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 lt!23034)))))))

(declare-fun lt!23165 () ListLongMap!1349)

(assert (=> d!10777 (= lt!23171 lt!23165)))

(declare-fun lt!23163 () Unit!1484)

(assert (=> d!10777 (= lt!23163 e!38129)))

(declare-fun c!7212 () Bool)

(declare-fun e!38132 () Bool)

(assert (=> d!10777 (= c!7212 e!38132)))

(declare-fun res!32361 () Bool)

(assert (=> d!10777 (=> (not res!32361) (not e!38132))))

(assert (=> d!10777 (= res!32361 (bvslt #b00000000000000000000000000000000 (size!1992 lt!23034)))))

(assert (=> d!10777 (= lt!23165 e!38128)))

(declare-fun c!7211 () Bool)

(assert (=> d!10777 (= c!7211 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!10777 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10777 (= (getCurrentListMap!387 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) lt!23171)))

(declare-fun b!57883 () Bool)

(assert (=> b!57883 (= e!38123 e!38130)))

(declare-fun c!7213 () Bool)

(assert (=> b!57883 (= c!7213 (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!4221 () Bool)

(declare-fun call!4223 () ListLongMap!1349)

(assert (=> bm!4221 (= call!4223 call!4229)))

(declare-fun bm!4222 () Bool)

(assert (=> bm!4222 (= call!4224 (contains!677 lt!23171 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57892 () Bool)

(assert (=> b!57892 (= e!38131 call!4223)))

(declare-fun bm!4223 () Bool)

(assert (=> bm!4223 (= call!4225 call!4226)))

(declare-fun b!57893 () Bool)

(declare-fun res!32356 () Bool)

(assert (=> b!57893 (=> (not res!32356) (not e!38123))))

(assert (=> b!57893 (= res!32356 e!38121)))

(declare-fun res!32354 () Bool)

(assert (=> b!57893 (=> res!32354 e!38121)))

(assert (=> b!57893 (= res!32354 (not e!38126))))

(declare-fun res!32358 () Bool)

(assert (=> b!57893 (=> (not res!32358) (not e!38126))))

(assert (=> b!57893 (= res!32358 (bvslt #b00000000000000000000000000000000 (size!1992 lt!23034)))))

(declare-fun b!57894 () Bool)

(declare-fun e!38125 () Bool)

(declare-fun e!38124 () Bool)

(assert (=> b!57894 (= e!38125 e!38124)))

(declare-fun res!32360 () Bool)

(declare-fun call!4227 () Bool)

(assert (=> b!57894 (= res!32360 call!4227)))

(assert (=> b!57894 (=> (not res!32360) (not e!38124))))

(declare-fun bm!4224 () Bool)

(assert (=> bm!4224 (= call!4229 (+!80 (ite c!7211 call!4228 (ite c!7209 call!4226 call!4225)) (ite (or c!7211 c!7209) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(declare-fun b!57895 () Bool)

(assert (=> b!57895 (= e!38120 (= (apply!65 lt!23171 (select (arr!1762 lt!23034) #b00000000000000000000000000000000)) (get!1065 (select (arr!1763 lt!23028) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57895 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1993 lt!23028)))))

(assert (=> b!57895 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 lt!23034)))))

(declare-fun b!57896 () Bool)

(assert (=> b!57896 (= e!38124 (= (apply!65 lt!23171 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1939 newMap!16)))))

(declare-fun b!57897 () Bool)

(declare-fun res!32355 () Bool)

(assert (=> b!57897 (=> (not res!32355) (not e!38123))))

(assert (=> b!57897 (= res!32355 e!38125)))

(declare-fun c!7208 () Bool)

(assert (=> b!57897 (= c!7208 (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!57898 () Bool)

(assert (=> b!57898 (= e!38122 call!4223)))

(declare-fun b!57899 () Bool)

(assert (=> b!57899 (= e!38125 (not call!4227))))

(declare-fun b!57900 () Bool)

(assert (=> b!57900 (= e!38130 (not call!4224))))

(declare-fun b!57901 () Bool)

(declare-fun lt!23155 () Unit!1484)

(assert (=> b!57901 (= e!38129 lt!23155)))

(declare-fun lt!23161 () ListLongMap!1349)

(assert (=> b!57901 (= lt!23161 (getCurrentListMapNoExtraKeys!43 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23156 () (_ BitVec 64))

(assert (=> b!57901 (= lt!23156 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23154 () (_ BitVec 64))

(assert (=> b!57901 (= lt!23154 (select (arr!1762 lt!23034) #b00000000000000000000000000000000))))

(declare-fun lt!23158 () Unit!1484)

(assert (=> b!57901 (= lt!23158 (addStillContains!41 lt!23161 lt!23156 (zeroValue!1939 newMap!16) lt!23154))))

(assert (=> b!57901 (contains!677 (+!80 lt!23161 (tuple2!2025 lt!23156 (zeroValue!1939 newMap!16))) lt!23154)))

(declare-fun lt!23168 () Unit!1484)

(assert (=> b!57901 (= lt!23168 lt!23158)))

(declare-fun lt!23152 () ListLongMap!1349)

(assert (=> b!57901 (= lt!23152 (getCurrentListMapNoExtraKeys!43 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23153 () (_ BitVec 64))

(assert (=> b!57901 (= lt!23153 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23150 () (_ BitVec 64))

(assert (=> b!57901 (= lt!23150 (select (arr!1762 lt!23034) #b00000000000000000000000000000000))))

(declare-fun lt!23166 () Unit!1484)

(assert (=> b!57901 (= lt!23166 (addApplyDifferent!41 lt!23152 lt!23153 (minValue!1939 newMap!16) lt!23150))))

(assert (=> b!57901 (= (apply!65 (+!80 lt!23152 (tuple2!2025 lt!23153 (minValue!1939 newMap!16))) lt!23150) (apply!65 lt!23152 lt!23150))))

(declare-fun lt!23151 () Unit!1484)

(assert (=> b!57901 (= lt!23151 lt!23166)))

(declare-fun lt!23157 () ListLongMap!1349)

(assert (=> b!57901 (= lt!23157 (getCurrentListMapNoExtraKeys!43 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23164 () (_ BitVec 64))

(assert (=> b!57901 (= lt!23164 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23169 () (_ BitVec 64))

(assert (=> b!57901 (= lt!23169 (select (arr!1762 lt!23034) #b00000000000000000000000000000000))))

(declare-fun lt!23160 () Unit!1484)

(assert (=> b!57901 (= lt!23160 (addApplyDifferent!41 lt!23157 lt!23164 (zeroValue!1939 newMap!16) lt!23169))))

(assert (=> b!57901 (= (apply!65 (+!80 lt!23157 (tuple2!2025 lt!23164 (zeroValue!1939 newMap!16))) lt!23169) (apply!65 lt!23157 lt!23169))))

(declare-fun lt!23162 () Unit!1484)

(assert (=> b!57901 (= lt!23162 lt!23160)))

(declare-fun lt!23159 () ListLongMap!1349)

(assert (=> b!57901 (= lt!23159 (getCurrentListMapNoExtraKeys!43 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23170 () (_ BitVec 64))

(assert (=> b!57901 (= lt!23170 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23167 () (_ BitVec 64))

(assert (=> b!57901 (= lt!23167 (select (arr!1762 lt!23034) #b00000000000000000000000000000000))))

(assert (=> b!57901 (= lt!23155 (addApplyDifferent!41 lt!23159 lt!23170 (minValue!1939 newMap!16) lt!23167))))

(assert (=> b!57901 (= (apply!65 (+!80 lt!23159 (tuple2!2025 lt!23170 (minValue!1939 newMap!16))) lt!23167) (apply!65 lt!23159 lt!23167))))

(declare-fun bm!4225 () Bool)

(assert (=> bm!4225 (= call!4227 (contains!677 lt!23171 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57902 () Bool)

(assert (=> b!57902 (= e!38132 (validKeyInArray!0 (select (arr!1762 lt!23034) #b00000000000000000000000000000000)))))

(declare-fun bm!4226 () Bool)

(assert (=> bm!4226 (= call!4228 (getCurrentListMapNoExtraKeys!43 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun b!57903 () Bool)

(assert (=> b!57903 (= e!38127 (= (apply!65 lt!23171 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1939 newMap!16)))))

(assert (= (and d!10777 c!7211) b!57891))

(assert (= (and d!10777 (not c!7211)) b!57887))

(assert (= (and b!57887 c!7209) b!57892))

(assert (= (and b!57887 (not c!7209)) b!57888))

(assert (= (and b!57888 c!7210) b!57898))

(assert (= (and b!57888 (not c!7210)) b!57884))

(assert (= (or b!57898 b!57884) bm!4223))

(assert (= (or b!57892 bm!4223) bm!4220))

(assert (= (or b!57892 b!57898) bm!4221))

(assert (= (or b!57891 bm!4220) bm!4226))

(assert (= (or b!57891 bm!4221) bm!4224))

(assert (= (and d!10777 res!32361) b!57902))

(assert (= (and d!10777 c!7212) b!57901))

(assert (= (and d!10777 (not c!7212)) b!57890))

(assert (= (and d!10777 res!32357) b!57893))

(assert (= (and b!57893 res!32358) b!57885))

(assert (= (and b!57893 (not res!32354)) b!57889))

(assert (= (and b!57889 res!32359) b!57895))

(assert (= (and b!57893 res!32356) b!57897))

(assert (= (and b!57897 c!7208) b!57894))

(assert (= (and b!57897 (not c!7208)) b!57899))

(assert (= (and b!57894 res!32360) b!57896))

(assert (= (or b!57894 b!57899) bm!4225))

(assert (= (and b!57897 res!32355) b!57883))

(assert (= (and b!57883 c!7213) b!57886))

(assert (= (and b!57883 (not c!7213)) b!57900))

(assert (= (and b!57886 res!32353) b!57903))

(assert (= (or b!57886 b!57900) bm!4222))

(declare-fun b_lambda!2533 () Bool)

(assert (=> (not b_lambda!2533) (not b!57895)))

(assert (=> b!57895 t!4758))

(declare-fun b_and!3501 () Bool)

(assert (= b_and!3497 (and (=> t!4758 result!2353) b_and!3501)))

(assert (=> b!57895 t!4760))

(declare-fun b_and!3503 () Bool)

(assert (= b_and!3499 (and (=> t!4760 result!2355) b_and!3503)))

(declare-fun m!49047 () Bool)

(assert (=> b!57895 m!49047))

(assert (=> b!57895 m!48353))

(declare-fun m!49049 () Bool)

(assert (=> b!57895 m!49049))

(assert (=> b!57895 m!49047))

(declare-fun m!49051 () Bool)

(assert (=> b!57895 m!49051))

(declare-fun m!49053 () Bool)

(assert (=> b!57895 m!49053))

(assert (=> b!57895 m!49051))

(assert (=> b!57895 m!48353))

(declare-fun m!49055 () Bool)

(assert (=> b!57891 m!49055))

(declare-fun m!49057 () Bool)

(assert (=> bm!4224 m!49057))

(assert (=> b!57889 m!49051))

(assert (=> b!57889 m!49051))

(declare-fun m!49059 () Bool)

(assert (=> b!57889 m!49059))

(declare-fun m!49061 () Bool)

(assert (=> b!57903 m!49061))

(declare-fun m!49063 () Bool)

(assert (=> bm!4222 m!49063))

(declare-fun m!49065 () Bool)

(assert (=> bm!4225 m!49065))

(assert (=> b!57901 m!49051))

(declare-fun m!49067 () Bool)

(assert (=> b!57901 m!49067))

(declare-fun m!49069 () Bool)

(assert (=> b!57901 m!49069))

(declare-fun m!49071 () Bool)

(assert (=> b!57901 m!49071))

(declare-fun m!49073 () Bool)

(assert (=> b!57901 m!49073))

(declare-fun m!49075 () Bool)

(assert (=> b!57901 m!49075))

(declare-fun m!49077 () Bool)

(assert (=> b!57901 m!49077))

(declare-fun m!49079 () Bool)

(assert (=> b!57901 m!49079))

(declare-fun m!49081 () Bool)

(assert (=> b!57901 m!49081))

(declare-fun m!49083 () Bool)

(assert (=> b!57901 m!49083))

(assert (=> b!57901 m!49075))

(declare-fun m!49085 () Bool)

(assert (=> b!57901 m!49085))

(assert (=> b!57901 m!49079))

(declare-fun m!49087 () Bool)

(assert (=> b!57901 m!49087))

(declare-fun m!49089 () Bool)

(assert (=> b!57901 m!49089))

(declare-fun m!49091 () Bool)

(assert (=> b!57901 m!49091))

(declare-fun m!49093 () Bool)

(assert (=> b!57901 m!49093))

(declare-fun m!49095 () Bool)

(assert (=> b!57901 m!49095))

(assert (=> b!57901 m!49081))

(assert (=> b!57901 m!49089))

(declare-fun m!49097 () Bool)

(assert (=> b!57901 m!49097))

(declare-fun m!49099 () Bool)

(assert (=> b!57896 m!49099))

(assert (=> bm!4226 m!49095))

(assert (=> d!10777 m!48335))

(assert (=> b!57885 m!49051))

(assert (=> b!57885 m!49051))

(declare-fun m!49101 () Bool)

(assert (=> b!57885 m!49101))

(assert (=> b!57902 m!49051))

(assert (=> b!57902 m!49051))

(assert (=> b!57902 m!49101))

(assert (=> d!10661 d!10777))

(declare-fun d!10779 () Bool)

(declare-fun res!32362 () Bool)

(declare-fun e!38133 () Bool)

(assert (=> d!10779 (=> res!32362 e!38133)))

(assert (=> d!10779 (= res!32362 (= (select (arr!1762 lt!23029) #b00000000000000000000000000000000) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!10779 (= (arrayContainsKey!0 lt!23029 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b00000000000000000000000000000000) e!38133)))

(declare-fun b!57904 () Bool)

(declare-fun e!38134 () Bool)

(assert (=> b!57904 (= e!38133 e!38134)))

(declare-fun res!32363 () Bool)

(assert (=> b!57904 (=> (not res!32363) (not e!38134))))

(assert (=> b!57904 (= res!32363 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1992 lt!23029)))))

(declare-fun b!57905 () Bool)

(assert (=> b!57905 (= e!38134 (arrayContainsKey!0 lt!23029 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10779 (not res!32362)) b!57904))

(assert (= (and b!57904 res!32363) b!57905))

(declare-fun m!49103 () Bool)

(assert (=> d!10779 m!49103))

(assert (=> b!57905 m!47913))

(declare-fun m!49105 () Bool)

(assert (=> b!57905 m!49105))

(assert (=> d!10661 d!10779))

(declare-fun d!10781 () Bool)

(assert (=> d!10781 (= (arrayCountValidKeys!0 lt!23035 (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (bvadd (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!23174 () Unit!1484)

(declare-fun choose!2 (array!3683 (_ BitVec 32)) Unit!1484)

(assert (=> d!10781 (= lt!23174 (choose!2 lt!23035 (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666))))))

(declare-fun e!38137 () Bool)

(assert (=> d!10781 e!38137))

(declare-fun res!32368 () Bool)

(assert (=> d!10781 (=> (not res!32368) (not e!38137))))

(assert (=> d!10781 (= res!32368 (and (bvsge (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000000) (bvslt (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (size!1992 lt!23035))))))

(assert (=> d!10781 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!23035 (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666))) lt!23174)))

(declare-fun b!57910 () Bool)

(declare-fun res!32369 () Bool)

(assert (=> b!57910 (=> (not res!32369) (not e!38137))))

(assert (=> b!57910 (= res!32369 (validKeyInArray!0 (select (arr!1762 lt!23035) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)))))))

(declare-fun b!57911 () Bool)

(assert (=> b!57911 (= e!38137 (bvslt (size!1992 lt!23035) #b01111111111111111111111111111111))))

(assert (= (and d!10781 res!32368) b!57910))

(assert (= (and b!57910 res!32369) b!57911))

(assert (=> d!10781 m!48681))

(declare-fun m!49107 () Bool)

(assert (=> d!10781 m!49107))

(declare-fun m!49109 () Bool)

(assert (=> b!57910 m!49109))

(assert (=> b!57910 m!49109))

(declare-fun m!49111 () Bool)

(assert (=> b!57910 m!49111))

(assert (=> d!10661 d!10781))

(declare-fun b!57912 () Bool)

(declare-fun e!38139 () (_ BitVec 32))

(declare-fun call!4230 () (_ BitVec 32))

(assert (=> b!57912 (= e!38139 (bvadd #b00000000000000000000000000000001 call!4230))))

(declare-fun b!57913 () Bool)

(assert (=> b!57913 (= e!38139 call!4230)))

(declare-fun bm!4227 () Bool)

(assert (=> bm!4227 (= call!4230 (arrayCountValidKeys!0 lt!23035 (bvadd (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000001) (bvadd (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000001)))))

(declare-fun b!57914 () Bool)

(declare-fun e!38138 () (_ BitVec 32))

(assert (=> b!57914 (= e!38138 #b00000000000000000000000000000000)))

(declare-fun b!57915 () Bool)

(assert (=> b!57915 (= e!38138 e!38139)))

(declare-fun c!7215 () Bool)

(assert (=> b!57915 (= c!7215 (validKeyInArray!0 (select (arr!1762 lt!23035) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)))))))

(declare-fun d!10783 () Bool)

(declare-fun lt!23175 () (_ BitVec 32))

(assert (=> d!10783 (and (bvsge lt!23175 #b00000000000000000000000000000000) (bvsle lt!23175 (bvsub (size!1992 lt!23035) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)))))))

(assert (=> d!10783 (= lt!23175 e!38138)))

(declare-fun c!7214 () Bool)

(assert (=> d!10783 (= c!7214 (bvsge (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (bvadd (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000001)))))

(assert (=> d!10783 (and (bvsle (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (bvadd (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000001)) (bvsge (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000000) (bvsle (bvadd (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000001) (size!1992 lt!23035)))))

(assert (=> d!10783 (= (arrayCountValidKeys!0 lt!23035 (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (bvadd (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000001)) lt!23175)))

(assert (= (and d!10783 c!7214) b!57914))

(assert (= (and d!10783 (not c!7214)) b!57915))

(assert (= (and b!57915 c!7215) b!57912))

(assert (= (and b!57915 (not c!7215)) b!57913))

(assert (= (or b!57912 b!57913) bm!4227))

(declare-fun m!49113 () Bool)

(assert (=> bm!4227 m!49113))

(assert (=> b!57915 m!49109))

(assert (=> b!57915 m!49109))

(assert (=> b!57915 m!49111))

(assert (=> d!10661 d!10783))

(declare-fun b!57916 () Bool)

(declare-fun e!38141 () (_ BitVec 32))

(declare-fun call!4231 () (_ BitVec 32))

(assert (=> b!57916 (= e!38141 (bvadd #b00000000000000000000000000000001 call!4231))))

(declare-fun b!57917 () Bool)

(assert (=> b!57917 (= e!38141 call!4231)))

(declare-fun bm!4228 () Bool)

(assert (=> bm!4228 (= call!4231 (arrayCountValidKeys!0 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!57918 () Bool)

(declare-fun e!38140 () (_ BitVec 32))

(assert (=> b!57918 (= e!38140 #b00000000000000000000000000000000)))

(declare-fun b!57919 () Bool)

(assert (=> b!57919 (= e!38140 e!38141)))

(declare-fun c!7217 () Bool)

(assert (=> b!57919 (= c!7217 (validKeyInArray!0 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun d!10785 () Bool)

(declare-fun lt!23176 () (_ BitVec 32))

(assert (=> d!10785 (and (bvsge lt!23176 #b00000000000000000000000000000000) (bvsle lt!23176 (bvsub (size!1992 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> d!10785 (= lt!23176 e!38140)))

(declare-fun c!7216 () Bool)

(assert (=> d!10785 (= c!7216 (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10785 (and (bvsle #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1992 (_keys!3640 newMap!16)) (size!1992 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))))))))

(assert (=> d!10785 (= (arrayCountValidKeys!0 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) lt!23176)))

(assert (= (and d!10785 c!7216) b!57918))

(assert (= (and d!10785 (not c!7216)) b!57919))

(assert (= (and b!57919 c!7217) b!57916))

(assert (= (and b!57919 (not c!7217)) b!57917))

(assert (= (or b!57916 b!57917) bm!4228))

(declare-fun m!49115 () Bool)

(assert (=> bm!4228 m!49115))

(declare-fun m!49117 () Bool)

(assert (=> b!57919 m!49117))

(assert (=> b!57919 m!49117))

(declare-fun m!49119 () Bool)

(assert (=> b!57919 m!49119))

(assert (=> d!10661 d!10785))

(declare-fun b!57920 () Bool)

(declare-fun e!38142 () Bool)

(declare-fun call!4232 () Bool)

(assert (=> b!57920 (= e!38142 call!4232)))

(declare-fun b!57921 () Bool)

(declare-fun e!38144 () Bool)

(assert (=> b!57921 (= e!38144 e!38142)))

(declare-fun c!7218 () Bool)

(assert (=> b!57921 (= c!7218 (validKeyInArray!0 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!57922 () Bool)

(declare-fun e!38143 () Bool)

(assert (=> b!57922 (= e!38143 call!4232)))

(declare-fun b!57923 () Bool)

(assert (=> b!57923 (= e!38142 e!38143)))

(declare-fun lt!23179 () (_ BitVec 64))

(assert (=> b!57923 (= lt!23179 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!23178 () Unit!1484)

(assert (=> b!57923 (= lt!23178 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) lt!23179 #b00000000000000000000000000000000))))

(assert (=> b!57923 (arrayContainsKey!0 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) lt!23179 #b00000000000000000000000000000000)))

(declare-fun lt!23177 () Unit!1484)

(assert (=> b!57923 (= lt!23177 lt!23178)))

(declare-fun res!32370 () Bool)

(assert (=> b!57923 (= res!32370 (= (seekEntryOrOpen!0 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) #b00000000000000000000000000000000) (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (mask!5894 newMap!16)) (Found!229 #b00000000000000000000000000000000)))))

(assert (=> b!57923 (=> (not res!32370) (not e!38143))))

(declare-fun d!10787 () Bool)

(declare-fun res!32371 () Bool)

(assert (=> d!10787 (=> res!32371 e!38144)))

(assert (=> d!10787 (= res!32371 (bvsge #b00000000000000000000000000000000 (size!1992 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))))))))

(assert (=> d!10787 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (mask!5894 newMap!16)) e!38144)))

(declare-fun bm!4229 () Bool)

(assert (=> bm!4229 (= call!4232 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (mask!5894 newMap!16)))))

(assert (= (and d!10787 (not res!32371)) b!57921))

(assert (= (and b!57921 c!7218) b!57923))

(assert (= (and b!57921 (not c!7218)) b!57920))

(assert (= (and b!57923 res!32370) b!57922))

(assert (= (or b!57922 b!57920) bm!4229))

(assert (=> b!57921 m!49117))

(assert (=> b!57921 m!49117))

(assert (=> b!57921 m!49119))

(assert (=> b!57923 m!49117))

(declare-fun m!49121 () Bool)

(assert (=> b!57923 m!49121))

(declare-fun m!49123 () Bool)

(assert (=> b!57923 m!49123))

(assert (=> b!57923 m!49117))

(declare-fun m!49125 () Bool)

(assert (=> b!57923 m!49125))

(declare-fun m!49127 () Bool)

(assert (=> bm!4229 m!49127))

(assert (=> d!10661 d!10787))

(declare-fun b!57925 () Bool)

(declare-fun e!38147 () ListLongMap!1349)

(declare-fun call!4235 () ListLongMap!1349)

(assert (=> b!57925 (= e!38147 call!4235)))

(declare-fun b!57926 () Bool)

(declare-fun e!38151 () Bool)

(assert (=> b!57926 (= e!38151 (validKeyInArray!0 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!57927 () Bool)

(declare-fun e!38155 () Bool)

(declare-fun e!38152 () Bool)

(assert (=> b!57927 (= e!38155 e!38152)))

(declare-fun res!32372 () Bool)

(declare-fun call!4234 () Bool)

(assert (=> b!57927 (= res!32372 call!4234)))

(assert (=> b!57927 (=> (not res!32372) (not e!38152))))

(declare-fun b!57928 () Bool)

(declare-fun e!38153 () ListLongMap!1349)

(declare-fun e!38156 () ListLongMap!1349)

(assert (=> b!57928 (= e!38153 e!38156)))

(declare-fun c!7220 () Bool)

(assert (=> b!57928 (= c!7220 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!57929 () Bool)

(declare-fun c!7221 () Bool)

(assert (=> b!57929 (= c!7221 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!57929 (= e!38156 e!38147)))

(declare-fun bm!4230 () Bool)

(declare-fun call!4236 () ListLongMap!1349)

(declare-fun call!4238 () ListLongMap!1349)

(assert (=> bm!4230 (= call!4236 call!4238)))

(declare-fun b!57930 () Bool)

(declare-fun e!38146 () Bool)

(declare-fun e!38145 () Bool)

(assert (=> b!57930 (= e!38146 e!38145)))

(declare-fun res!32378 () Bool)

(assert (=> b!57930 (=> (not res!32378) (not e!38145))))

(declare-fun lt!23201 () ListLongMap!1349)

(assert (=> b!57930 (= res!32378 (contains!677 lt!23201 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> b!57930 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))))))))

(declare-fun b!57931 () Bool)

(declare-fun e!38154 () Unit!1484)

(declare-fun Unit!1517 () Unit!1484)

(assert (=> b!57931 (= e!38154 Unit!1517)))

(declare-fun b!57932 () Bool)

(declare-fun call!4239 () ListLongMap!1349)

(assert (=> b!57932 (= e!38153 (+!80 call!4239 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))

(declare-fun d!10789 () Bool)

(declare-fun e!38148 () Bool)

(assert (=> d!10789 e!38148))

(declare-fun res!32376 () Bool)

(assert (=> d!10789 (=> (not res!32376) (not e!38148))))

(assert (=> d!10789 (= res!32376 (or (bvsge #b00000000000000000000000000000000 (size!1992 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))))))))))

(declare-fun lt!23195 () ListLongMap!1349)

(assert (=> d!10789 (= lt!23201 lt!23195)))

(declare-fun lt!23193 () Unit!1484)

(assert (=> d!10789 (= lt!23193 e!38154)))

(declare-fun c!7223 () Bool)

(declare-fun e!38157 () Bool)

(assert (=> d!10789 (= c!7223 e!38157)))

(declare-fun res!32380 () Bool)

(assert (=> d!10789 (=> (not res!32380) (not e!38157))))

(assert (=> d!10789 (= res!32380 (bvslt #b00000000000000000000000000000000 (size!1992 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))))))))

(assert (=> d!10789 (= lt!23195 e!38153)))

(declare-fun c!7222 () Bool)

(assert (=> d!10789 (= c!7222 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!10789 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10789 (= (getCurrentListMap!387 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) lt!23201)))

(declare-fun b!57924 () Bool)

(assert (=> b!57924 (= e!38148 e!38155)))

(declare-fun c!7224 () Bool)

(assert (=> b!57924 (= c!7224 (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!4231 () Bool)

(declare-fun call!4233 () ListLongMap!1349)

(assert (=> bm!4231 (= call!4233 call!4239)))

(declare-fun bm!4232 () Bool)

(assert (=> bm!4232 (= call!4234 (contains!677 lt!23201 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57933 () Bool)

(assert (=> b!57933 (= e!38156 call!4233)))

(declare-fun bm!4233 () Bool)

(assert (=> bm!4233 (= call!4235 call!4236)))

(declare-fun b!57934 () Bool)

(declare-fun res!32375 () Bool)

(assert (=> b!57934 (=> (not res!32375) (not e!38148))))

(assert (=> b!57934 (= res!32375 e!38146)))

(declare-fun res!32373 () Bool)

(assert (=> b!57934 (=> res!32373 e!38146)))

(assert (=> b!57934 (= res!32373 (not e!38151))))

(declare-fun res!32377 () Bool)

(assert (=> b!57934 (=> (not res!32377) (not e!38151))))

(assert (=> b!57934 (= res!32377 (bvslt #b00000000000000000000000000000000 (size!1992 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))))))))

(declare-fun b!57935 () Bool)

(declare-fun e!38150 () Bool)

(declare-fun e!38149 () Bool)

(assert (=> b!57935 (= e!38150 e!38149)))

(declare-fun res!32379 () Bool)

(declare-fun call!4237 () Bool)

(assert (=> b!57935 (= res!32379 call!4237)))

(assert (=> b!57935 (=> (not res!32379) (not e!38149))))

(declare-fun bm!4234 () Bool)

(assert (=> bm!4234 (= call!4239 (+!80 (ite c!7222 call!4238 (ite c!7220 call!4236 call!4235)) (ite (or c!7222 c!7220) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(declare-fun b!57936 () Bool)

(assert (=> b!57936 (= e!38145 (= (apply!65 lt!23201 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) #b00000000000000000000000000000000)) (get!1065 (select (arr!1763 (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57936 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1993 (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))))))))

(assert (=> b!57936 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))))))))

(declare-fun b!57937 () Bool)

(assert (=> b!57937 (= e!38149 (= (apply!65 lt!23201 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1939 newMap!16)))))

(declare-fun b!57938 () Bool)

(declare-fun res!32374 () Bool)

(assert (=> b!57938 (=> (not res!32374) (not e!38148))))

(assert (=> b!57938 (= res!32374 e!38150)))

(declare-fun c!7219 () Bool)

(assert (=> b!57938 (= c!7219 (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!57939 () Bool)

(assert (=> b!57939 (= e!38147 call!4233)))

(declare-fun b!57940 () Bool)

(assert (=> b!57940 (= e!38150 (not call!4237))))

(declare-fun b!57941 () Bool)

(assert (=> b!57941 (= e!38155 (not call!4234))))

(declare-fun b!57942 () Bool)

(declare-fun lt!23185 () Unit!1484)

(assert (=> b!57942 (= e!38154 lt!23185)))

(declare-fun lt!23191 () ListLongMap!1349)

(assert (=> b!57942 (= lt!23191 (getCurrentListMapNoExtraKeys!43 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23186 () (_ BitVec 64))

(assert (=> b!57942 (= lt!23186 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23184 () (_ BitVec 64))

(assert (=> b!57942 (= lt!23184 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!23188 () Unit!1484)

(assert (=> b!57942 (= lt!23188 (addStillContains!41 lt!23191 lt!23186 (zeroValue!1939 newMap!16) lt!23184))))

(assert (=> b!57942 (contains!677 (+!80 lt!23191 (tuple2!2025 lt!23186 (zeroValue!1939 newMap!16))) lt!23184)))

(declare-fun lt!23198 () Unit!1484)

(assert (=> b!57942 (= lt!23198 lt!23188)))

(declare-fun lt!23182 () ListLongMap!1349)

(assert (=> b!57942 (= lt!23182 (getCurrentListMapNoExtraKeys!43 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23183 () (_ BitVec 64))

(assert (=> b!57942 (= lt!23183 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23180 () (_ BitVec 64))

(assert (=> b!57942 (= lt!23180 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!23196 () Unit!1484)

(assert (=> b!57942 (= lt!23196 (addApplyDifferent!41 lt!23182 lt!23183 (minValue!1939 newMap!16) lt!23180))))

(assert (=> b!57942 (= (apply!65 (+!80 lt!23182 (tuple2!2025 lt!23183 (minValue!1939 newMap!16))) lt!23180) (apply!65 lt!23182 lt!23180))))

(declare-fun lt!23181 () Unit!1484)

(assert (=> b!57942 (= lt!23181 lt!23196)))

(declare-fun lt!23187 () ListLongMap!1349)

(assert (=> b!57942 (= lt!23187 (getCurrentListMapNoExtraKeys!43 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23194 () (_ BitVec 64))

(assert (=> b!57942 (= lt!23194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23199 () (_ BitVec 64))

(assert (=> b!57942 (= lt!23199 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!23190 () Unit!1484)

(assert (=> b!57942 (= lt!23190 (addApplyDifferent!41 lt!23187 lt!23194 (zeroValue!1939 newMap!16) lt!23199))))

(assert (=> b!57942 (= (apply!65 (+!80 lt!23187 (tuple2!2025 lt!23194 (zeroValue!1939 newMap!16))) lt!23199) (apply!65 lt!23187 lt!23199))))

(declare-fun lt!23192 () Unit!1484)

(assert (=> b!57942 (= lt!23192 lt!23190)))

(declare-fun lt!23189 () ListLongMap!1349)

(assert (=> b!57942 (= lt!23189 (getCurrentListMapNoExtraKeys!43 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23200 () (_ BitVec 64))

(assert (=> b!57942 (= lt!23200 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23197 () (_ BitVec 64))

(assert (=> b!57942 (= lt!23197 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) #b00000000000000000000000000000000))))

(assert (=> b!57942 (= lt!23185 (addApplyDifferent!41 lt!23189 lt!23200 (minValue!1939 newMap!16) lt!23197))))

(assert (=> b!57942 (= (apply!65 (+!80 lt!23189 (tuple2!2025 lt!23200 (minValue!1939 newMap!16))) lt!23197) (apply!65 lt!23189 lt!23197))))

(declare-fun bm!4235 () Bool)

(assert (=> bm!4235 (= call!4237 (contains!677 lt!23201 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57943 () Bool)

(assert (=> b!57943 (= e!38157 (validKeyInArray!0 (select (arr!1762 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun bm!4236 () Bool)

(assert (=> bm!4236 (= call!4238 (getCurrentListMapNoExtraKeys!43 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun b!57944 () Bool)

(assert (=> b!57944 (= e!38152 (= (apply!65 lt!23201 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1939 newMap!16)))))

(assert (= (and d!10789 c!7222) b!57932))

(assert (= (and d!10789 (not c!7222)) b!57928))

(assert (= (and b!57928 c!7220) b!57933))

(assert (= (and b!57928 (not c!7220)) b!57929))

(assert (= (and b!57929 c!7221) b!57939))

(assert (= (and b!57929 (not c!7221)) b!57925))

(assert (= (or b!57939 b!57925) bm!4233))

(assert (= (or b!57933 bm!4233) bm!4230))

(assert (= (or b!57933 b!57939) bm!4231))

(assert (= (or b!57932 bm!4230) bm!4236))

(assert (= (or b!57932 bm!4231) bm!4234))

(assert (= (and d!10789 res!32380) b!57943))

(assert (= (and d!10789 c!7223) b!57942))

(assert (= (and d!10789 (not c!7223)) b!57931))

(assert (= (and d!10789 res!32376) b!57934))

(assert (= (and b!57934 res!32377) b!57926))

(assert (= (and b!57934 (not res!32373)) b!57930))

(assert (= (and b!57930 res!32378) b!57936))

(assert (= (and b!57934 res!32375) b!57938))

(assert (= (and b!57938 c!7219) b!57935))

(assert (= (and b!57938 (not c!7219)) b!57940))

(assert (= (and b!57935 res!32379) b!57937))

(assert (= (or b!57935 b!57940) bm!4235))

(assert (= (and b!57938 res!32374) b!57924))

(assert (= (and b!57924 c!7224) b!57927))

(assert (= (and b!57924 (not c!7224)) b!57941))

(assert (= (and b!57927 res!32372) b!57944))

(assert (= (or b!57927 b!57941) bm!4232))

(declare-fun b_lambda!2535 () Bool)

(assert (=> (not b_lambda!2535) (not b!57936)))

(assert (=> b!57936 t!4758))

(declare-fun b_and!3505 () Bool)

(assert (= b_and!3501 (and (=> t!4758 result!2353) b_and!3505)))

(assert (=> b!57936 t!4760))

(declare-fun b_and!3507 () Bool)

(assert (= b_and!3503 (and (=> t!4760 result!2355) b_and!3507)))

(declare-fun m!49129 () Bool)

(assert (=> b!57936 m!49129))

(assert (=> b!57936 m!48353))

(declare-fun m!49131 () Bool)

(assert (=> b!57936 m!49131))

(assert (=> b!57936 m!49129))

(assert (=> b!57936 m!49117))

(declare-fun m!49133 () Bool)

(assert (=> b!57936 m!49133))

(assert (=> b!57936 m!49117))

(assert (=> b!57936 m!48353))

(declare-fun m!49135 () Bool)

(assert (=> b!57932 m!49135))

(declare-fun m!49137 () Bool)

(assert (=> bm!4234 m!49137))

(assert (=> b!57930 m!49117))

(assert (=> b!57930 m!49117))

(declare-fun m!49139 () Bool)

(assert (=> b!57930 m!49139))

(declare-fun m!49141 () Bool)

(assert (=> b!57944 m!49141))

(declare-fun m!49143 () Bool)

(assert (=> bm!4232 m!49143))

(declare-fun m!49145 () Bool)

(assert (=> bm!4235 m!49145))

(assert (=> b!57942 m!49117))

(declare-fun m!49147 () Bool)

(assert (=> b!57942 m!49147))

(declare-fun m!49149 () Bool)

(assert (=> b!57942 m!49149))

(declare-fun m!49151 () Bool)

(assert (=> b!57942 m!49151))

(declare-fun m!49153 () Bool)

(assert (=> b!57942 m!49153))

(declare-fun m!49155 () Bool)

(assert (=> b!57942 m!49155))

(declare-fun m!49157 () Bool)

(assert (=> b!57942 m!49157))

(declare-fun m!49159 () Bool)

(assert (=> b!57942 m!49159))

(declare-fun m!49161 () Bool)

(assert (=> b!57942 m!49161))

(declare-fun m!49163 () Bool)

(assert (=> b!57942 m!49163))

(assert (=> b!57942 m!49155))

(declare-fun m!49165 () Bool)

(assert (=> b!57942 m!49165))

(assert (=> b!57942 m!49159))

(declare-fun m!49167 () Bool)

(assert (=> b!57942 m!49167))

(declare-fun m!49169 () Bool)

(assert (=> b!57942 m!49169))

(declare-fun m!49171 () Bool)

(assert (=> b!57942 m!49171))

(declare-fun m!49173 () Bool)

(assert (=> b!57942 m!49173))

(declare-fun m!49175 () Bool)

(assert (=> b!57942 m!49175))

(assert (=> b!57942 m!49161))

(assert (=> b!57942 m!49169))

(declare-fun m!49177 () Bool)

(assert (=> b!57942 m!49177))

(declare-fun m!49179 () Bool)

(assert (=> b!57937 m!49179))

(assert (=> bm!4236 m!49175))

(assert (=> d!10789 m!48335))

(assert (=> b!57926 m!49117))

(assert (=> b!57926 m!49117))

(assert (=> b!57926 m!49119))

(assert (=> b!57943 m!49117))

(assert (=> b!57943 m!49117))

(assert (=> b!57943 m!49119))

(assert (=> d!10661 d!10789))

(assert (=> d!10661 d!10591))

(declare-fun d!10791 () Bool)

(declare-fun e!38160 () Bool)

(assert (=> d!10791 e!38160))

(declare-fun res!32383 () Bool)

(assert (=> d!10791 (=> (not res!32383) (not e!38160))))

(assert (=> d!10791 (= res!32383 (and (bvsge (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000000) (bvslt (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (size!1992 (_keys!3640 newMap!16))) (bvslt (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (size!1993 (_values!2004 newMap!16)))))))

(declare-fun lt!23204 () Unit!1484)

(declare-fun choose!304 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 32) (_ BitVec 64) V!2833 Int) Unit!1484)

(assert (=> d!10791 (= lt!23204 (choose!304 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2021 newMap!16)))))

(assert (=> d!10791 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10791 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!4 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2021 newMap!16)) lt!23204)))

(declare-fun b!57947 () Bool)

(assert (=> b!57947 (= e!38160 (= (+!80 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!387 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))))))

(assert (= (and d!10791 res!32383) b!57947))

(assert (=> d!10791 m!47913))

(assert (=> d!10791 m!47939))

(declare-fun m!49181 () Bool)

(assert (=> d!10791 m!49181))

(assert (=> d!10791 m!48335))

(assert (=> b!57947 m!48101))

(assert (=> b!57947 m!48617))

(assert (=> b!57947 m!48671))

(assert (=> b!57947 m!48663))

(assert (=> b!57947 m!48657))

(assert (=> b!57947 m!48101))

(assert (=> d!10661 d!10791))

(declare-fun d!10793 () Bool)

(declare-fun e!38161 () Bool)

(assert (=> d!10793 e!38161))

(declare-fun res!32384 () Bool)

(assert (=> d!10793 (=> res!32384 e!38161)))

(declare-fun lt!23205 () Bool)

(assert (=> d!10793 (= res!32384 (not lt!23205))))

(declare-fun lt!23208 () Bool)

(assert (=> d!10793 (= lt!23205 lt!23208)))

(declare-fun lt!23207 () Unit!1484)

(declare-fun e!38162 () Unit!1484)

(assert (=> d!10793 (= lt!23207 e!38162)))

(declare-fun c!7225 () Bool)

(assert (=> d!10793 (= c!7225 lt!23208)))

(assert (=> d!10793 (= lt!23208 (containsKey!125 (toList!690 (getCurrentListMap!387 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (select (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)))))))

(assert (=> d!10793 (= (contains!677 (getCurrentListMap!387 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (select (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)))) lt!23205)))

(declare-fun b!57948 () Bool)

(declare-fun lt!23206 () Unit!1484)

(assert (=> b!57948 (= e!38162 lt!23206)))

(assert (=> b!57948 (= lt!23206 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 (getCurrentListMap!387 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (select (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)))))))

(assert (=> b!57948 (isDefined!75 (getValueByKey!121 (toList!690 (getCurrentListMap!387 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (select (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)))))))

(declare-fun b!57949 () Bool)

(declare-fun Unit!1518 () Unit!1484)

(assert (=> b!57949 (= e!38162 Unit!1518)))

(declare-fun b!57950 () Bool)

(assert (=> b!57950 (= e!38161 (isDefined!75 (getValueByKey!121 (toList!690 (getCurrentListMap!387 lt!23034 lt!23028 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (select (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666))))))))

(assert (= (and d!10793 c!7225) b!57948))

(assert (= (and d!10793 (not c!7225)) b!57949))

(assert (= (and d!10793 (not res!32384)) b!57950))

(assert (=> d!10793 m!48677))

(declare-fun m!49183 () Bool)

(assert (=> d!10793 m!49183))

(assert (=> b!57948 m!48677))

(declare-fun m!49185 () Bool)

(assert (=> b!57948 m!49185))

(assert (=> b!57948 m!48677))

(declare-fun m!49187 () Bool)

(assert (=> b!57948 m!49187))

(assert (=> b!57948 m!49187))

(declare-fun m!49189 () Bool)

(assert (=> b!57948 m!49189))

(assert (=> b!57950 m!48677))

(assert (=> b!57950 m!49187))

(assert (=> b!57950 m!49187))

(assert (=> b!57950 m!49189))

(assert (=> d!10661 d!10793))

(assert (=> d!10661 d!10659))

(declare-fun d!10795 () Bool)

(declare-fun e!38165 () Bool)

(assert (=> d!10795 e!38165))

(declare-fun res!32387 () Bool)

(assert (=> d!10795 (=> (not res!32387) (not e!38165))))

(assert (=> d!10795 (= res!32387 (and (bvsge (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000000) (bvslt (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (size!1992 (_keys!3640 newMap!16)))))))

(declare-fun lt!23211 () Unit!1484)

(declare-fun choose!102 ((_ BitVec 64) array!3683 (_ BitVec 32) (_ BitVec 32)) Unit!1484)

(assert (=> d!10795 (= lt!23211 (choose!102 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (mask!5894 newMap!16)))))

(assert (=> d!10795 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10795 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (mask!5894 newMap!16)) lt!23211)))

(declare-fun b!57953 () Bool)

(assert (=> b!57953 (= e!38165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) (mask!5894 newMap!16)))))

(assert (= (and d!10795 res!32387) b!57953))

(assert (=> d!10795 m!47913))

(declare-fun m!49191 () Bool)

(assert (=> d!10795 m!49191))

(assert (=> d!10795 m!48335))

(assert (=> b!57953 m!48671))

(assert (=> b!57953 m!48683))

(assert (=> d!10661 d!10795))

(declare-fun b!57962 () Bool)

(declare-fun res!32398 () Bool)

(declare-fun e!38170 () Bool)

(assert (=> b!57962 (=> (not res!32398) (not e!38170))))

(assert (=> b!57962 (= res!32398 (not (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666))))))))

(declare-fun b!57964 () Bool)

(assert (=> b!57964 (= e!38170 (bvslt (size!1992 (_keys!3640 newMap!16)) #b01111111111111111111111111111111))))

(declare-fun b!57963 () Bool)

(declare-fun res!32397 () Bool)

(assert (=> b!57963 (=> (not res!32397) (not e!38170))))

(assert (=> b!57963 (= res!32397 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun d!10797 () Bool)

(declare-fun e!38171 () Bool)

(assert (=> d!10797 e!38171))

(declare-fun res!32399 () Bool)

(assert (=> d!10797 (=> (not res!32399) (not e!38171))))

(assert (=> d!10797 (= res!32399 (and (bvsge (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000000) (bvslt (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (size!1992 (_keys!3640 newMap!16)))))))

(declare-fun lt!23214 () Unit!1484)

(declare-fun choose!1 (array!3683 (_ BitVec 32) (_ BitVec 64)) Unit!1484)

(assert (=> d!10797 (= lt!23214 (choose!1 (_keys!3640 newMap!16) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!10797 e!38170))

(declare-fun res!32396 () Bool)

(assert (=> d!10797 (=> (not res!32396) (not e!38170))))

(assert (=> d!10797 (= res!32396 (and (bvsge (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) #b00000000000000000000000000000000) (bvslt (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (size!1992 (_keys!3640 newMap!16)))))))

(assert (=> d!10797 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3640 newMap!16) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) lt!23214)))

(declare-fun b!57965 () Bool)

(assert (=> b!57965 (= e!38171 (= (arrayCountValidKeys!0 (array!3684 (store (arr!1762 (_keys!3640 newMap!16)) (ite c!7048 (index!3041 lt!22666) (index!3038 lt!22666)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (size!1992 (_keys!3640 newMap!16))) #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3640 newMap!16) #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) #b00000000000000000000000000000001)))))

(assert (= (and d!10797 res!32396) b!57962))

(assert (= (and b!57962 res!32398) b!57963))

(assert (= (and b!57963 res!32397) b!57964))

(assert (= (and d!10797 res!32399) b!57965))

(declare-fun m!49193 () Bool)

(assert (=> b!57962 m!49193))

(assert (=> b!57962 m!49193))

(declare-fun m!49195 () Bool)

(assert (=> b!57962 m!49195))

(assert (=> b!57963 m!47913))

(assert (=> b!57963 m!48127))

(assert (=> d!10797 m!47913))

(declare-fun m!49197 () Bool)

(assert (=> d!10797 m!49197))

(assert (=> b!57965 m!48671))

(assert (=> b!57965 m!48665))

(assert (=> b!57965 m!48041))

(assert (=> d!10661 d!10797))

(declare-fun d!10799 () Bool)

(declare-fun e!38172 () Bool)

(assert (=> d!10799 e!38172))

(declare-fun res!32400 () Bool)

(assert (=> d!10799 (=> res!32400 e!38172)))

(declare-fun lt!23215 () Bool)

(assert (=> d!10799 (= res!32400 (not lt!23215))))

(declare-fun lt!23218 () Bool)

(assert (=> d!10799 (= lt!23215 lt!23218)))

(declare-fun lt!23217 () Unit!1484)

(declare-fun e!38173 () Unit!1484)

(assert (=> d!10799 (= lt!23217 e!38173)))

(declare-fun c!7226 () Bool)

(assert (=> d!10799 (= c!7226 lt!23218)))

(assert (=> d!10799 (= lt!23218 (containsKey!125 (toList!690 lt!22857) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10799 (= (contains!677 lt!22857 #b0000000000000000000000000000000000000000000000000000000000000000) lt!23215)))

(declare-fun b!57966 () Bool)

(declare-fun lt!23216 () Unit!1484)

(assert (=> b!57966 (= e!38173 lt!23216)))

(assert (=> b!57966 (= lt!23216 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22857) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!57966 (isDefined!75 (getValueByKey!121 (toList!690 lt!22857) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57967 () Bool)

(declare-fun Unit!1519 () Unit!1484)

(assert (=> b!57967 (= e!38173 Unit!1519)))

(declare-fun b!57968 () Bool)

(assert (=> b!57968 (= e!38172 (isDefined!75 (getValueByKey!121 (toList!690 lt!22857) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10799 c!7226) b!57966))

(assert (= (and d!10799 (not c!7226)) b!57967))

(assert (= (and d!10799 (not res!32400)) b!57968))

(declare-fun m!49199 () Bool)

(assert (=> d!10799 m!49199))

(declare-fun m!49201 () Bool)

(assert (=> b!57966 m!49201))

(declare-fun m!49203 () Bool)

(assert (=> b!57966 m!49203))

(assert (=> b!57966 m!49203))

(declare-fun m!49205 () Bool)

(assert (=> b!57966 m!49205))

(assert (=> b!57968 m!49203))

(assert (=> b!57968 m!49203))

(assert (=> b!57968 m!49205))

(assert (=> bm!4175 d!10799))

(declare-fun d!10801 () Bool)

(declare-fun lt!23219 () Bool)

(assert (=> d!10801 (= lt!23219 (select (content!61 Nil!1427) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!38175 () Bool)

(assert (=> d!10801 (= lt!23219 e!38175)))

(declare-fun res!32401 () Bool)

(assert (=> d!10801 (=> (not res!32401) (not e!38175))))

(assert (=> d!10801 (= res!32401 ((_ is Cons!1426) Nil!1427))))

(assert (=> d!10801 (= (contains!680 Nil!1427 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) lt!23219)))

(declare-fun b!57969 () Bool)

(declare-fun e!38174 () Bool)

(assert (=> b!57969 (= e!38175 e!38174)))

(declare-fun res!32402 () Bool)

(assert (=> b!57969 (=> res!32402 e!38174)))

(assert (=> b!57969 (= res!32402 (= (h!2006 Nil!1427) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!57970 () Bool)

(assert (=> b!57970 (= e!38174 (contains!680 (t!4743 Nil!1427) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10801 res!32401) b!57969))

(assert (= (and b!57969 (not res!32402)) b!57970))

(assert (=> d!10801 m!48311))

(assert (=> d!10801 m!48317))

(declare-fun m!49207 () Bool)

(assert (=> d!10801 m!49207))

(assert (=> b!57970 m!48317))

(declare-fun m!49209 () Bool)

(assert (=> b!57970 m!49209))

(assert (=> b!57462 d!10801))

(declare-fun b!57971 () Bool)

(declare-fun e!38178 () Bool)

(declare-fun call!4240 () Bool)

(assert (=> b!57971 (= e!38178 call!4240)))

(declare-fun d!10803 () Bool)

(declare-fun res!32404 () Bool)

(declare-fun e!38179 () Bool)

(assert (=> d!10803 (=> res!32404 e!38179)))

(assert (=> d!10803 (= res!32404 (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> d!10803 (= (arrayNoDuplicates!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000000 Nil!1427) e!38179)))

(declare-fun b!57972 () Bool)

(declare-fun e!38177 () Bool)

(assert (=> b!57972 (= e!38177 (contains!680 Nil!1427 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!57973 () Bool)

(declare-fun e!38176 () Bool)

(assert (=> b!57973 (= e!38176 e!38178)))

(declare-fun c!7227 () Bool)

(assert (=> b!57973 (= c!7227 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!57974 () Bool)

(assert (=> b!57974 (= e!38178 call!4240)))

(declare-fun b!57975 () Bool)

(assert (=> b!57975 (= e!38179 e!38176)))

(declare-fun res!32403 () Bool)

(assert (=> b!57975 (=> (not res!32403) (not e!38176))))

(assert (=> b!57975 (= res!32403 (not e!38177))))

(declare-fun res!32405 () Bool)

(assert (=> b!57975 (=> (not res!32405) (not e!38177))))

(assert (=> b!57975 (= res!32405 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!4237 () Bool)

(assert (=> bm!4237 (= call!4240 (arrayNoDuplicates!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!7227 (Cons!1426 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) #b00000000000000000000000000000000) Nil!1427) Nil!1427)))))

(assert (= (and d!10803 (not res!32404)) b!57975))

(assert (= (and b!57975 res!32405) b!57972))

(assert (= (and b!57975 res!32403) b!57973))

(assert (= (and b!57973 c!7227) b!57974))

(assert (= (and b!57973 (not c!7227)) b!57971))

(assert (= (or b!57974 b!57971) bm!4237))

(declare-fun m!49211 () Bool)

(assert (=> b!57972 m!49211))

(assert (=> b!57972 m!49211))

(declare-fun m!49213 () Bool)

(assert (=> b!57972 m!49213))

(assert (=> b!57973 m!49211))

(assert (=> b!57973 m!49211))

(declare-fun m!49215 () Bool)

(assert (=> b!57973 m!49215))

(assert (=> b!57975 m!49211))

(assert (=> b!57975 m!49211))

(assert (=> b!57975 m!49215))

(assert (=> bm!4237 m!49211))

(declare-fun m!49217 () Bool)

(assert (=> bm!4237 m!49217))

(assert (=> b!57631 d!10803))

(declare-fun d!10805 () Bool)

(declare-fun res!32406 () Bool)

(declare-fun e!38180 () Bool)

(assert (=> d!10805 (=> res!32406 e!38180)))

(assert (=> d!10805 (= res!32406 (and ((_ is Cons!1427) (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))) (= (_1!1023 (h!2007 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))) lt!22749)))))

(assert (=> d!10805 (= (containsKey!125 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22749) e!38180)))

(declare-fun b!57976 () Bool)

(declare-fun e!38181 () Bool)

(assert (=> b!57976 (= e!38180 e!38181)))

(declare-fun res!32407 () Bool)

(assert (=> b!57976 (=> (not res!32407) (not e!38181))))

(assert (=> b!57976 (= res!32407 (and (or (not ((_ is Cons!1427) (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))) (bvsle (_1!1023 (h!2007 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))) lt!22749)) ((_ is Cons!1427) (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))) (bvslt (_1!1023 (h!2007 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))) lt!22749)))))

(declare-fun b!57977 () Bool)

(assert (=> b!57977 (= e!38181 (containsKey!125 (t!4744 (toList!690 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))) lt!22749))))

(assert (= (and d!10805 (not res!32406)) b!57976))

(assert (= (and b!57976 res!32407) b!57977))

(declare-fun m!49219 () Bool)

(assert (=> b!57977 m!49219))

(assert (=> d!10551 d!10805))

(declare-fun d!10807 () Bool)

(assert (=> d!10807 (isDefined!75 (getValueByKey!121 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!23220 () Unit!1484)

(assert (=> d!10807 (= lt!23220 (choose!297 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!38182 () Bool)

(assert (=> d!10807 e!38182))

(declare-fun res!32408 () Bool)

(assert (=> d!10807 (=> (not res!32408) (not e!38182))))

(assert (=> d!10807 (= res!32408 (isStrictlySorted!278 (toList!690 lt!22766)))))

(assert (=> d!10807 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000) lt!23220)))

(declare-fun b!57978 () Bool)

(assert (=> b!57978 (= e!38182 (containsKey!125 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!10807 res!32408) b!57978))

(assert (=> d!10807 m!48469))

(assert (=> d!10807 m!48469))

(assert (=> d!10807 m!48525))

(declare-fun m!49221 () Bool)

(assert (=> d!10807 m!49221))

(declare-fun m!49223 () Bool)

(assert (=> d!10807 m!49223))

(assert (=> b!57978 m!48521))

(assert (=> b!57597 d!10807))

(declare-fun d!10809 () Bool)

(assert (=> d!10809 (= (isDefined!75 (getValueByKey!121 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!295 (getValueByKey!121 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!2511 () Bool)

(assert (= bs!2511 d!10809))

(assert (=> bs!2511 m!48469))

(declare-fun m!49225 () Bool)

(assert (=> bs!2511 m!49225))

(assert (=> b!57597 d!10809))

(assert (=> b!57597 d!10705))

(declare-fun d!10811 () Bool)

(declare-fun e!38183 () Bool)

(assert (=> d!10811 e!38183))

(declare-fun res!32410 () Bool)

(assert (=> d!10811 (=> (not res!32410) (not e!38183))))

(declare-fun lt!23223 () ListLongMap!1349)

(assert (=> d!10811 (= res!32410 (contains!677 lt!23223 (_1!1023 (ite (or c!7122 c!7120) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))))

(declare-fun lt!23224 () List!1431)

(assert (=> d!10811 (= lt!23223 (ListLongMap!1350 lt!23224))))

(declare-fun lt!23221 () Unit!1484)

(declare-fun lt!23222 () Unit!1484)

(assert (=> d!10811 (= lt!23221 lt!23222)))

(assert (=> d!10811 (= (getValueByKey!121 lt!23224 (_1!1023 (ite (or c!7122 c!7120) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))) (Some!126 (_2!1023 (ite (or c!7122 c!7120) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))))

(assert (=> d!10811 (= lt!23222 (lemmaContainsTupThenGetReturnValue!41 lt!23224 (_1!1023 (ite (or c!7122 c!7120) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))) (_2!1023 (ite (or c!7122 c!7120) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))))

(assert (=> d!10811 (= lt!23224 (insertStrictlySorted!44 (toList!690 (ite c!7122 call!4185 (ite c!7120 call!4183 call!4182))) (_1!1023 (ite (or c!7122 c!7120) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))) (_2!1023 (ite (or c!7122 c!7120) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))))

(assert (=> d!10811 (= (+!80 (ite c!7122 call!4185 (ite c!7120 call!4183 call!4182)) (ite (or c!7122 c!7120) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))) lt!23223)))

(declare-fun b!57979 () Bool)

(declare-fun res!32409 () Bool)

(assert (=> b!57979 (=> (not res!32409) (not e!38183))))

(assert (=> b!57979 (= res!32409 (= (getValueByKey!121 (toList!690 lt!23223) (_1!1023 (ite (or c!7122 c!7120) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))) (Some!126 (_2!1023 (ite (or c!7122 c!7120) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))))

(declare-fun b!57980 () Bool)

(assert (=> b!57980 (= e!38183 (contains!681 (toList!690 lt!23223) (ite (or c!7122 c!7120) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(assert (= (and d!10811 res!32410) b!57979))

(assert (= (and b!57979 res!32409) b!57980))

(declare-fun m!49227 () Bool)

(assert (=> d!10811 m!49227))

(declare-fun m!49229 () Bool)

(assert (=> d!10811 m!49229))

(declare-fun m!49231 () Bool)

(assert (=> d!10811 m!49231))

(declare-fun m!49233 () Bool)

(assert (=> d!10811 m!49233))

(declare-fun m!49235 () Bool)

(assert (=> b!57979 m!49235))

(declare-fun m!49237 () Bool)

(assert (=> b!57980 m!49237))

(assert (=> bm!4181 d!10811))

(declare-fun d!10813 () Bool)

(declare-fun e!38184 () Bool)

(assert (=> d!10813 e!38184))

(declare-fun res!32411 () Bool)

(assert (=> d!10813 (=> res!32411 e!38184)))

(declare-fun lt!23225 () Bool)

(assert (=> d!10813 (= res!32411 (not lt!23225))))

(declare-fun lt!23228 () Bool)

(assert (=> d!10813 (= lt!23225 lt!23228)))

(declare-fun lt!23227 () Unit!1484)

(declare-fun e!38185 () Unit!1484)

(assert (=> d!10813 (= lt!23227 e!38185)))

(declare-fun c!7228 () Bool)

(assert (=> d!10813 (= c!7228 lt!23228)))

(assert (=> d!10813 (= lt!23228 (containsKey!125 (toList!690 lt!22821) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10813 (= (contains!677 lt!22821 (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23225)))

(declare-fun b!57981 () Bool)

(declare-fun lt!23226 () Unit!1484)

(assert (=> b!57981 (= e!38185 lt!23226)))

(assert (=> b!57981 (= lt!23226 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22821) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> b!57981 (isDefined!75 (getValueByKey!121 (toList!690 lt!22821) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!57982 () Bool)

(declare-fun Unit!1520 () Unit!1484)

(assert (=> b!57982 (= e!38185 Unit!1520)))

(declare-fun b!57983 () Bool)

(assert (=> b!57983 (= e!38184 (isDefined!75 (getValueByKey!121 (toList!690 lt!22821) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (= (and d!10813 c!7228) b!57981))

(assert (= (and d!10813 (not c!7228)) b!57982))

(assert (= (and d!10813 (not res!32411)) b!57983))

(declare-fun m!49239 () Bool)

(assert (=> d!10813 m!49239))

(declare-fun m!49241 () Bool)

(assert (=> b!57981 m!49241))

(assert (=> b!57981 m!48291))

(assert (=> b!57981 m!48291))

(declare-fun m!49243 () Bool)

(assert (=> b!57981 m!49243))

(assert (=> b!57983 m!48291))

(assert (=> b!57983 m!48291))

(assert (=> b!57983 m!49243))

(assert (=> d!10565 d!10813))

(declare-fun b!57985 () Bool)

(declare-fun e!38186 () Option!127)

(declare-fun e!38187 () Option!127)

(assert (=> b!57985 (= e!38186 e!38187)))

(declare-fun c!7230 () Bool)

(assert (=> b!57985 (= c!7230 (and ((_ is Cons!1427) lt!22822) (not (= (_1!1023 (h!2007 lt!22822)) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun b!57987 () Bool)

(assert (=> b!57987 (= e!38187 None!125)))

(declare-fun b!57986 () Bool)

(assert (=> b!57986 (= e!38187 (getValueByKey!121 (t!4744 lt!22822) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!57984 () Bool)

(assert (=> b!57984 (= e!38186 (Some!126 (_2!1023 (h!2007 lt!22822))))))

(declare-fun c!7229 () Bool)

(declare-fun d!10815 () Bool)

(assert (=> d!10815 (= c!7229 (and ((_ is Cons!1427) lt!22822) (= (_1!1023 (h!2007 lt!22822)) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!10815 (= (getValueByKey!121 lt!22822 (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) e!38186)))

(assert (= (and d!10815 c!7229) b!57984))

(assert (= (and d!10815 (not c!7229)) b!57985))

(assert (= (and b!57985 c!7230) b!57986))

(assert (= (and b!57985 (not c!7230)) b!57987))

(declare-fun m!49245 () Bool)

(assert (=> b!57986 m!49245))

(assert (=> d!10565 d!10815))

(declare-fun d!10817 () Bool)

(assert (=> d!10817 (= (getValueByKey!121 lt!22822 (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun lt!23231 () Unit!1484)

(declare-fun choose!305 (List!1431 (_ BitVec 64) V!2833) Unit!1484)

(assert (=> d!10817 (= lt!23231 (choose!305 lt!22822 (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun e!38190 () Bool)

(assert (=> d!10817 e!38190))

(declare-fun res!32416 () Bool)

(assert (=> d!10817 (=> (not res!32416) (not e!38190))))

(assert (=> d!10817 (= res!32416 (isStrictlySorted!278 lt!22822))))

(assert (=> d!10817 (= (lemmaContainsTupThenGetReturnValue!41 lt!22822 (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23231)))

(declare-fun b!57992 () Bool)

(declare-fun res!32417 () Bool)

(assert (=> b!57992 (=> (not res!32417) (not e!38190))))

(assert (=> b!57992 (= res!32417 (containsKey!125 lt!22822 (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!57993 () Bool)

(assert (=> b!57993 (= e!38190 (contains!681 lt!22822 (tuple2!2025 (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (= (and d!10817 res!32416) b!57992))

(assert (= (and b!57992 res!32417) b!57993))

(assert (=> d!10817 m!48285))

(declare-fun m!49247 () Bool)

(assert (=> d!10817 m!49247))

(declare-fun m!49249 () Bool)

(assert (=> d!10817 m!49249))

(declare-fun m!49251 () Bool)

(assert (=> b!57992 m!49251))

(declare-fun m!49253 () Bool)

(assert (=> b!57993 m!49253))

(assert (=> d!10565 d!10817))

(declare-fun bm!4244 () Bool)

(declare-fun call!4249 () List!1431)

(declare-fun call!4248 () List!1431)

(assert (=> bm!4244 (= call!4249 call!4248)))

(declare-fun bm!4245 () Bool)

(declare-fun call!4247 () List!1431)

(assert (=> bm!4245 (= call!4248 call!4247)))

(declare-fun bm!4246 () Bool)

(declare-fun c!7239 () Bool)

(declare-fun e!38204 () List!1431)

(declare-fun $colon$colon!58 (List!1431 tuple2!2024) List!1431)

(assert (=> bm!4246 (= call!4247 ($colon$colon!58 e!38204 (ite c!7239 (h!2007 (toList!690 lt!22752)) (tuple2!2025 (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun c!7241 () Bool)

(assert (=> bm!4246 (= c!7241 c!7239)))

(declare-fun b!58014 () Bool)

(declare-fun e!38201 () Bool)

(declare-fun lt!23234 () List!1431)

(assert (=> b!58014 (= e!38201 (contains!681 lt!23234 (tuple2!2025 (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58015 () Bool)

(declare-fun e!38205 () List!1431)

(declare-fun e!38202 () List!1431)

(assert (=> b!58015 (= e!38205 e!38202)))

(declare-fun c!7242 () Bool)

(assert (=> b!58015 (= c!7242 (and ((_ is Cons!1427) (toList!690 lt!22752)) (= (_1!1023 (h!2007 (toList!690 lt!22752))) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58016 () Bool)

(declare-fun e!38203 () List!1431)

(assert (=> b!58016 (= e!38203 call!4249)))

(declare-fun b!58017 () Bool)

(assert (=> b!58017 (= e!38205 call!4247)))

(declare-fun b!58018 () Bool)

(assert (=> b!58018 (= e!38203 call!4249)))

(declare-fun b!58019 () Bool)

(declare-fun res!32422 () Bool)

(assert (=> b!58019 (=> (not res!32422) (not e!38201))))

(assert (=> b!58019 (= res!32422 (containsKey!125 lt!23234 (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58020 () Bool)

(declare-fun c!7240 () Bool)

(assert (=> b!58020 (= c!7240 (and ((_ is Cons!1427) (toList!690 lt!22752)) (bvsgt (_1!1023 (h!2007 (toList!690 lt!22752))) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> b!58020 (= e!38202 e!38203)))

(declare-fun b!58021 () Bool)

(assert (=> b!58021 (= e!38204 (insertStrictlySorted!44 (t!4744 (toList!690 lt!22752)) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58022 () Bool)

(assert (=> b!58022 (= e!38202 call!4248)))

(declare-fun d!10819 () Bool)

(assert (=> d!10819 e!38201))

(declare-fun res!32423 () Bool)

(assert (=> d!10819 (=> (not res!32423) (not e!38201))))

(assert (=> d!10819 (= res!32423 (isStrictlySorted!278 lt!23234))))

(assert (=> d!10819 (= lt!23234 e!38205)))

(assert (=> d!10819 (= c!7239 (and ((_ is Cons!1427) (toList!690 lt!22752)) (bvslt (_1!1023 (h!2007 (toList!690 lt!22752))) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!10819 (isStrictlySorted!278 (toList!690 lt!22752))))

(assert (=> d!10819 (= (insertStrictlySorted!44 (toList!690 lt!22752) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23234)))

(declare-fun b!58023 () Bool)

(assert (=> b!58023 (= e!38204 (ite c!7242 (t!4744 (toList!690 lt!22752)) (ite c!7240 (Cons!1427 (h!2007 (toList!690 lt!22752)) (t!4744 (toList!690 lt!22752))) Nil!1428)))))

(assert (= (and d!10819 c!7239) b!58017))

(assert (= (and d!10819 (not c!7239)) b!58015))

(assert (= (and b!58015 c!7242) b!58022))

(assert (= (and b!58015 (not c!7242)) b!58020))

(assert (= (and b!58020 c!7240) b!58016))

(assert (= (and b!58020 (not c!7240)) b!58018))

(assert (= (or b!58016 b!58018) bm!4244))

(assert (= (or b!58022 bm!4244) bm!4245))

(assert (= (or b!58017 bm!4245) bm!4246))

(assert (= (and bm!4246 c!7241) b!58021))

(assert (= (and bm!4246 (not c!7241)) b!58023))

(assert (= (and d!10819 res!32423) b!58019))

(assert (= (and b!58019 res!32422) b!58014))

(declare-fun m!49255 () Bool)

(assert (=> b!58019 m!49255))

(declare-fun m!49257 () Bool)

(assert (=> b!58014 m!49257))

(declare-fun m!49259 () Bool)

(assert (=> b!58021 m!49259))

(declare-fun m!49261 () Bool)

(assert (=> bm!4246 m!49261))

(declare-fun m!49263 () Bool)

(assert (=> d!10819 m!49263))

(declare-fun m!49265 () Bool)

(assert (=> d!10819 m!49265))

(assert (=> d!10565 d!10819))

(assert (=> b!57599 d!10809))

(assert (=> b!57599 d!10705))

(declare-fun d!10821 () Bool)

(declare-fun e!38206 () Bool)

(assert (=> d!10821 e!38206))

(declare-fun res!32424 () Bool)

(assert (=> d!10821 (=> res!32424 e!38206)))

(declare-fun lt!23235 () Bool)

(assert (=> d!10821 (= res!32424 (not lt!23235))))

(declare-fun lt!23238 () Bool)

(assert (=> d!10821 (= lt!23235 lt!23238)))

(declare-fun lt!23237 () Unit!1484)

(declare-fun e!38207 () Unit!1484)

(assert (=> d!10821 (= lt!23237 e!38207)))

(declare-fun c!7243 () Bool)

(assert (=> d!10821 (= c!7243 lt!23238)))

(assert (=> d!10821 (= lt!23238 (containsKey!125 (toList!690 lt!22809) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10821 (= (contains!677 lt!22809 (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23235)))

(declare-fun b!58024 () Bool)

(declare-fun lt!23236 () Unit!1484)

(assert (=> b!58024 (= e!38207 lt!23236)))

(assert (=> b!58024 (= lt!23236 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22809) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> b!58024 (isDefined!75 (getValueByKey!121 (toList!690 lt!22809) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58025 () Bool)

(declare-fun Unit!1521 () Unit!1484)

(assert (=> b!58025 (= e!38207 Unit!1521)))

(declare-fun b!58026 () Bool)

(assert (=> b!58026 (= e!38206 (isDefined!75 (getValueByKey!121 (toList!690 lt!22809) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (= (and d!10821 c!7243) b!58024))

(assert (= (and d!10821 (not c!7243)) b!58025))

(assert (= (and d!10821 (not res!32424)) b!58026))

(declare-fun m!49267 () Bool)

(assert (=> d!10821 m!49267))

(declare-fun m!49269 () Bool)

(assert (=> b!58024 m!49269))

(assert (=> b!58024 m!48247))

(assert (=> b!58024 m!48247))

(declare-fun m!49271 () Bool)

(assert (=> b!58024 m!49271))

(assert (=> b!58026 m!48247))

(assert (=> b!58026 m!48247))

(assert (=> b!58026 m!49271))

(assert (=> d!10555 d!10821))

(declare-fun b!58028 () Bool)

(declare-fun e!38208 () Option!127)

(declare-fun e!38209 () Option!127)

(assert (=> b!58028 (= e!38208 e!38209)))

(declare-fun c!7245 () Bool)

(assert (=> b!58028 (= c!7245 (and ((_ is Cons!1427) lt!22810) (not (= (_1!1023 (h!2007 lt!22810)) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun b!58030 () Bool)

(assert (=> b!58030 (= e!38209 None!125)))

(declare-fun b!58029 () Bool)

(assert (=> b!58029 (= e!38209 (getValueByKey!121 (t!4744 lt!22810) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58027 () Bool)

(assert (=> b!58027 (= e!38208 (Some!126 (_2!1023 (h!2007 lt!22810))))))

(declare-fun d!10823 () Bool)

(declare-fun c!7244 () Bool)

(assert (=> d!10823 (= c!7244 (and ((_ is Cons!1427) lt!22810) (= (_1!1023 (h!2007 lt!22810)) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!10823 (= (getValueByKey!121 lt!22810 (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) e!38208)))

(assert (= (and d!10823 c!7244) b!58027))

(assert (= (and d!10823 (not c!7244)) b!58028))

(assert (= (and b!58028 c!7245) b!58029))

(assert (= (and b!58028 (not c!7245)) b!58030))

(declare-fun m!49273 () Bool)

(assert (=> b!58029 m!49273))

(assert (=> d!10555 d!10823))

(declare-fun d!10825 () Bool)

(assert (=> d!10825 (= (getValueByKey!121 lt!22810 (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun lt!23239 () Unit!1484)

(assert (=> d!10825 (= lt!23239 (choose!305 lt!22810 (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun e!38210 () Bool)

(assert (=> d!10825 e!38210))

(declare-fun res!32425 () Bool)

(assert (=> d!10825 (=> (not res!32425) (not e!38210))))

(assert (=> d!10825 (= res!32425 (isStrictlySorted!278 lt!22810))))

(assert (=> d!10825 (= (lemmaContainsTupThenGetReturnValue!41 lt!22810 (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23239)))

(declare-fun b!58031 () Bool)

(declare-fun res!32426 () Bool)

(assert (=> b!58031 (=> (not res!32426) (not e!38210))))

(assert (=> b!58031 (= res!32426 (containsKey!125 lt!22810 (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58032 () Bool)

(assert (=> b!58032 (= e!38210 (contains!681 lt!22810 (tuple2!2025 (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (= (and d!10825 res!32425) b!58031))

(assert (= (and b!58031 res!32426) b!58032))

(assert (=> d!10825 m!48241))

(declare-fun m!49275 () Bool)

(assert (=> d!10825 m!49275))

(declare-fun m!49277 () Bool)

(assert (=> d!10825 m!49277))

(declare-fun m!49279 () Bool)

(assert (=> b!58031 m!49279))

(declare-fun m!49281 () Bool)

(assert (=> b!58032 m!49281))

(assert (=> d!10555 d!10825))

(declare-fun bm!4247 () Bool)

(declare-fun call!4252 () List!1431)

(declare-fun call!4251 () List!1431)

(assert (=> bm!4247 (= call!4252 call!4251)))

(declare-fun bm!4248 () Bool)

(declare-fun call!4250 () List!1431)

(assert (=> bm!4248 (= call!4251 call!4250)))

(declare-fun e!38214 () List!1431)

(declare-fun bm!4249 () Bool)

(declare-fun c!7246 () Bool)

(assert (=> bm!4249 (= call!4250 ($colon$colon!58 e!38214 (ite c!7246 (h!2007 (toList!690 lt!22756)) (tuple2!2025 (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun c!7248 () Bool)

(assert (=> bm!4249 (= c!7248 c!7246)))

(declare-fun b!58033 () Bool)

(declare-fun lt!23240 () List!1431)

(declare-fun e!38211 () Bool)

(assert (=> b!58033 (= e!38211 (contains!681 lt!23240 (tuple2!2025 (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58034 () Bool)

(declare-fun e!38215 () List!1431)

(declare-fun e!38212 () List!1431)

(assert (=> b!58034 (= e!38215 e!38212)))

(declare-fun c!7249 () Bool)

(assert (=> b!58034 (= c!7249 (and ((_ is Cons!1427) (toList!690 lt!22756)) (= (_1!1023 (h!2007 (toList!690 lt!22756))) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58035 () Bool)

(declare-fun e!38213 () List!1431)

(assert (=> b!58035 (= e!38213 call!4252)))

(declare-fun b!58036 () Bool)

(assert (=> b!58036 (= e!38215 call!4250)))

(declare-fun b!58037 () Bool)

(assert (=> b!58037 (= e!38213 call!4252)))

(declare-fun b!58038 () Bool)

(declare-fun res!32427 () Bool)

(assert (=> b!58038 (=> (not res!32427) (not e!38211))))

(assert (=> b!58038 (= res!32427 (containsKey!125 lt!23240 (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun c!7247 () Bool)

(declare-fun b!58039 () Bool)

(assert (=> b!58039 (= c!7247 (and ((_ is Cons!1427) (toList!690 lt!22756)) (bvsgt (_1!1023 (h!2007 (toList!690 lt!22756))) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> b!58039 (= e!38212 e!38213)))

(declare-fun b!58040 () Bool)

(assert (=> b!58040 (= e!38214 (insertStrictlySorted!44 (t!4744 (toList!690 lt!22756)) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58041 () Bool)

(assert (=> b!58041 (= e!38212 call!4251)))

(declare-fun d!10827 () Bool)

(assert (=> d!10827 e!38211))

(declare-fun res!32428 () Bool)

(assert (=> d!10827 (=> (not res!32428) (not e!38211))))

(assert (=> d!10827 (= res!32428 (isStrictlySorted!278 lt!23240))))

(assert (=> d!10827 (= lt!23240 e!38215)))

(assert (=> d!10827 (= c!7246 (and ((_ is Cons!1427) (toList!690 lt!22756)) (bvslt (_1!1023 (h!2007 (toList!690 lt!22756))) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!10827 (isStrictlySorted!278 (toList!690 lt!22756))))

(assert (=> d!10827 (= (insertStrictlySorted!44 (toList!690 lt!22756) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23240)))

(declare-fun b!58042 () Bool)

(assert (=> b!58042 (= e!38214 (ite c!7249 (t!4744 (toList!690 lt!22756)) (ite c!7247 (Cons!1427 (h!2007 (toList!690 lt!22756)) (t!4744 (toList!690 lt!22756))) Nil!1428)))))

(assert (= (and d!10827 c!7246) b!58036))

(assert (= (and d!10827 (not c!7246)) b!58034))

(assert (= (and b!58034 c!7249) b!58041))

(assert (= (and b!58034 (not c!7249)) b!58039))

(assert (= (and b!58039 c!7247) b!58035))

(assert (= (and b!58039 (not c!7247)) b!58037))

(assert (= (or b!58035 b!58037) bm!4247))

(assert (= (or b!58041 bm!4247) bm!4248))

(assert (= (or b!58036 bm!4248) bm!4249))

(assert (= (and bm!4249 c!7248) b!58040))

(assert (= (and bm!4249 (not c!7248)) b!58042))

(assert (= (and d!10827 res!32428) b!58038))

(assert (= (and b!58038 res!32427) b!58033))

(declare-fun m!49283 () Bool)

(assert (=> b!58038 m!49283))

(declare-fun m!49285 () Bool)

(assert (=> b!58033 m!49285))

(declare-fun m!49287 () Bool)

(assert (=> b!58040 m!49287))

(declare-fun m!49289 () Bool)

(assert (=> bm!4249 m!49289))

(declare-fun m!49291 () Bool)

(assert (=> d!10827 m!49291))

(declare-fun m!49293 () Bool)

(assert (=> d!10827 m!49293))

(assert (=> d!10555 d!10827))

(declare-fun d!10829 () Bool)

(declare-fun e!38216 () Bool)

(assert (=> d!10829 e!38216))

(declare-fun res!32430 () Bool)

(assert (=> d!10829 (=> (not res!32430) (not e!38216))))

(declare-fun lt!23243 () ListLongMap!1349)

(assert (=> d!10829 (= res!32430 (contains!677 lt!23243 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(declare-fun lt!23244 () List!1431)

(assert (=> d!10829 (= lt!23243 (ListLongMap!1350 lt!23244))))

(declare-fun lt!23241 () Unit!1484)

(declare-fun lt!23242 () Unit!1484)

(assert (=> d!10829 (= lt!23241 lt!23242)))

(assert (=> d!10829 (= (getValueByKey!121 lt!23244 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))) (Some!126 (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(assert (=> d!10829 (= lt!23242 (lemmaContainsTupThenGetReturnValue!41 lt!23244 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(assert (=> d!10829 (= lt!23244 (insertStrictlySorted!44 (toList!690 call!4179) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(assert (=> d!10829 (= (+!80 call!4179 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) lt!23243)))

(declare-fun b!58043 () Bool)

(declare-fun res!32429 () Bool)

(assert (=> b!58043 (=> (not res!32429) (not e!38216))))

(assert (=> b!58043 (= res!32429 (= (getValueByKey!121 (toList!690 lt!23243) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))) (Some!126 (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))))))))

(declare-fun b!58044 () Bool)

(assert (=> b!58044 (= e!38216 (contains!681 (toList!690 lt!23243) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))))))

(assert (= (and d!10829 res!32430) b!58043))

(assert (= (and b!58043 res!32429) b!58044))

(declare-fun m!49295 () Bool)

(assert (=> d!10829 m!49295))

(declare-fun m!49297 () Bool)

(assert (=> d!10829 m!49297))

(declare-fun m!49299 () Bool)

(assert (=> d!10829 m!49299))

(declare-fun m!49301 () Bool)

(assert (=> d!10829 m!49301))

(declare-fun m!49303 () Bool)

(assert (=> b!58043 m!49303))

(declare-fun m!49305 () Bool)

(assert (=> b!58044 m!49305))

(assert (=> b!57518 d!10829))

(declare-fun b!58045 () Bool)

(declare-fun e!38219 () Bool)

(assert (=> b!58045 (= e!38219 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!58045 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!10831 () Bool)

(declare-fun e!38217 () Bool)

(assert (=> d!10831 e!38217))

(declare-fun res!32434 () Bool)

(assert (=> d!10831 (=> (not res!32434) (not e!38217))))

(declare-fun lt!23248 () ListLongMap!1349)

(assert (=> d!10831 (= res!32434 (not (contains!677 lt!23248 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!38218 () ListLongMap!1349)

(assert (=> d!10831 (= lt!23248 e!38218)))

(declare-fun c!7252 () Bool)

(assert (=> d!10831 (= c!7252 (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10831 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10831 (= (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))) (mask!5894 newMap!16) (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) lt!23248)))

(declare-fun b!58046 () Bool)

(declare-fun e!38222 () Bool)

(declare-fun e!38223 () Bool)

(assert (=> b!58046 (= e!38222 e!38223)))

(declare-fun c!7251 () Bool)

(assert (=> b!58046 (= c!7251 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun bm!4250 () Bool)

(declare-fun call!4253 () ListLongMap!1349)

(assert (=> bm!4250 (= call!4253 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))) (mask!5894 newMap!16) (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2021 newMap!16)))))

(declare-fun b!58047 () Bool)

(declare-fun res!32433 () Bool)

(assert (=> b!58047 (=> (not res!32433) (not e!38217))))

(assert (=> b!58047 (= res!32433 (not (contains!677 lt!23248 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!58048 () Bool)

(assert (=> b!58048 (= e!38223 (isEmpty!294 lt!23248))))

(declare-fun b!58049 () Bool)

(assert (=> b!58049 (= e!38217 e!38222)))

(declare-fun c!7253 () Bool)

(assert (=> b!58049 (= c!7253 e!38219)))

(declare-fun res!32432 () Bool)

(assert (=> b!58049 (=> (not res!32432) (not e!38219))))

(assert (=> b!58049 (= res!32432 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!58050 () Bool)

(assert (=> b!58050 (= e!38223 (= lt!23248 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))) (mask!5894 newMap!16) (ite c!7050 (ite c!7049 lt!22673 lt!22674) (extraKeys!1912 newMap!16)) (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2021 newMap!16))))))

(declare-fun b!58051 () Bool)

(declare-fun e!38220 () ListLongMap!1349)

(assert (=> b!58051 (= e!38220 call!4253)))

(declare-fun b!58052 () Bool)

(declare-fun lt!23249 () Unit!1484)

(declare-fun lt!23246 () Unit!1484)

(assert (=> b!58052 (= lt!23249 lt!23246)))

(declare-fun lt!23250 () (_ BitVec 64))

(declare-fun lt!23247 () V!2833)

(declare-fun lt!23251 () (_ BitVec 64))

(declare-fun lt!23245 () ListLongMap!1349)

(assert (=> b!58052 (not (contains!677 (+!80 lt!23245 (tuple2!2025 lt!23251 lt!23247)) lt!23250))))

(assert (=> b!58052 (= lt!23246 (addStillNotContains!15 lt!23245 lt!23251 lt!23247 lt!23250))))

(assert (=> b!58052 (= lt!23250 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!58052 (= lt!23247 (get!1065 (select (arr!1763 (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!58052 (= lt!23251 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!58052 (= lt!23245 call!4253)))

(assert (=> b!58052 (= e!38220 (+!80 call!4253 (tuple2!2025 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) (get!1065 (select (arr!1763 (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!58053 () Bool)

(assert (=> b!58053 (= e!38218 e!38220)))

(declare-fun c!7250 () Bool)

(assert (=> b!58053 (= c!7250 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!58054 () Bool)

(declare-fun e!38221 () Bool)

(assert (=> b!58054 (= e!38222 e!38221)))

(assert (=> b!58054 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun res!32431 () Bool)

(assert (=> b!58054 (= res!32431 (contains!677 lt!23248 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!58054 (=> (not res!32431) (not e!38221))))

(declare-fun b!58055 () Bool)

(assert (=> b!58055 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> b!58055 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1993 (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))))))))

(assert (=> b!58055 (= e!38221 (= (apply!65 lt!23248 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (get!1065 (select (arr!1763 (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!58056 () Bool)

(assert (=> b!58056 (= e!38218 (ListLongMap!1350 Nil!1428))))

(assert (= (and d!10831 c!7252) b!58056))

(assert (= (and d!10831 (not c!7252)) b!58053))

(assert (= (and b!58053 c!7250) b!58052))

(assert (= (and b!58053 (not c!7250)) b!58051))

(assert (= (or b!58052 b!58051) bm!4250))

(assert (= (and d!10831 res!32434) b!58047))

(assert (= (and b!58047 res!32433) b!58049))

(assert (= (and b!58049 res!32432) b!58045))

(assert (= (and b!58049 c!7253) b!58054))

(assert (= (and b!58049 (not c!7253)) b!58046))

(assert (= (and b!58054 res!32431) b!58055))

(assert (= (and b!58046 c!7251) b!58050))

(assert (= (and b!58046 (not c!7251)) b!58048))

(declare-fun b_lambda!2537 () Bool)

(assert (=> (not b_lambda!2537) (not b!58052)))

(assert (=> b!58052 t!4758))

(declare-fun b_and!3509 () Bool)

(assert (= b_and!3505 (and (=> t!4758 result!2353) b_and!3509)))

(assert (=> b!58052 t!4760))

(declare-fun b_and!3511 () Bool)

(assert (= b_and!3507 (and (=> t!4760 result!2355) b_and!3511)))

(declare-fun b_lambda!2539 () Bool)

(assert (=> (not b_lambda!2539) (not b!58055)))

(assert (=> b!58055 t!4758))

(declare-fun b_and!3513 () Bool)

(assert (= b_and!3509 (and (=> t!4758 result!2353) b_and!3513)))

(assert (=> b!58055 t!4760))

(declare-fun b_and!3515 () Bool)

(assert (= b_and!3511 (and (=> t!4760 result!2355) b_and!3515)))

(assert (=> b!58053 m!48317))

(assert (=> b!58053 m!48317))

(assert (=> b!58053 m!48321))

(declare-fun m!49307 () Bool)

(assert (=> b!58048 m!49307))

(declare-fun m!49309 () Bool)

(assert (=> b!58050 m!49309))

(declare-fun m!49311 () Bool)

(assert (=> d!10831 m!49311))

(assert (=> d!10831 m!48335))

(assert (=> b!58052 m!48353))

(assert (=> b!58052 m!48351))

(assert (=> b!58052 m!48353))

(assert (=> b!58052 m!48355))

(assert (=> b!58052 m!48351))

(declare-fun m!49313 () Bool)

(assert (=> b!58052 m!49313))

(declare-fun m!49315 () Bool)

(assert (=> b!58052 m!49315))

(declare-fun m!49317 () Bool)

(assert (=> b!58052 m!49317))

(assert (=> b!58052 m!48317))

(assert (=> b!58052 m!49317))

(declare-fun m!49319 () Bool)

(assert (=> b!58052 m!49319))

(assert (=> bm!4250 m!49309))

(assert (=> b!58055 m!48351))

(assert (=> b!58055 m!48353))

(assert (=> b!58055 m!48351))

(assert (=> b!58055 m!48353))

(assert (=> b!58055 m!48355))

(assert (=> b!58055 m!48317))

(declare-fun m!49321 () Bool)

(assert (=> b!58055 m!49321))

(assert (=> b!58055 m!48317))

(declare-fun m!49323 () Bool)

(assert (=> b!58047 m!49323))

(assert (=> b!58045 m!48317))

(assert (=> b!58045 m!48317))

(assert (=> b!58045 m!48321))

(assert (=> b!58054 m!48317))

(assert (=> b!58054 m!48317))

(declare-fun m!49325 () Bool)

(assert (=> b!58054 m!49325))

(assert (=> bm!4176 d!10831))

(declare-fun d!10833 () Bool)

(declare-fun e!38224 () Bool)

(assert (=> d!10833 e!38224))

(declare-fun res!32436 () Bool)

(assert (=> d!10833 (=> (not res!32436) (not e!38224))))

(declare-fun lt!23254 () ListLongMap!1349)

(assert (=> d!10833 (= res!32436 (contains!677 lt!23254 (_1!1023 (ite (or c!7168 c!7166) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))))

(declare-fun lt!23255 () List!1431)

(assert (=> d!10833 (= lt!23254 (ListLongMap!1350 lt!23255))))

(declare-fun lt!23252 () Unit!1484)

(declare-fun lt!23253 () Unit!1484)

(assert (=> d!10833 (= lt!23252 lt!23253)))

(assert (=> d!10833 (= (getValueByKey!121 lt!23255 (_1!1023 (ite (or c!7168 c!7166) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))) (Some!126 (_2!1023 (ite (or c!7168 c!7166) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))))

(assert (=> d!10833 (= lt!23253 (lemmaContainsTupThenGetReturnValue!41 lt!23255 (_1!1023 (ite (or c!7168 c!7166) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))) (_2!1023 (ite (or c!7168 c!7166) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))))

(assert (=> d!10833 (= lt!23255 (insertStrictlySorted!44 (toList!690 (ite c!7168 call!4210 (ite c!7166 call!4208 call!4207))) (_1!1023 (ite (or c!7168 c!7166) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))) (_2!1023 (ite (or c!7168 c!7166) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))))

(assert (=> d!10833 (= (+!80 (ite c!7168 call!4210 (ite c!7166 call!4208 call!4207)) (ite (or c!7168 c!7166) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))) lt!23254)))

(declare-fun b!58057 () Bool)

(declare-fun res!32435 () Bool)

(assert (=> b!58057 (=> (not res!32435) (not e!38224))))

(assert (=> b!58057 (= res!32435 (= (getValueByKey!121 (toList!690 lt!23254) (_1!1023 (ite (or c!7168 c!7166) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))) (Some!126 (_2!1023 (ite (or c!7168 c!7166) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))))

(declare-fun b!58058 () Bool)

(assert (=> b!58058 (= e!38224 (contains!681 (toList!690 lt!23254) (ite (or c!7168 c!7166) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(assert (= (and d!10833 res!32436) b!58057))

(assert (= (and b!58057 res!32435) b!58058))

(declare-fun m!49327 () Bool)

(assert (=> d!10833 m!49327))

(declare-fun m!49329 () Bool)

(assert (=> d!10833 m!49329))

(declare-fun m!49331 () Bool)

(assert (=> d!10833 m!49331))

(declare-fun m!49333 () Bool)

(assert (=> d!10833 m!49333))

(declare-fun m!49335 () Bool)

(assert (=> b!58057 m!49335))

(declare-fun m!49337 () Bool)

(assert (=> b!58058 m!49337))

(assert (=> bm!4206 d!10833))

(declare-fun d!10835 () Bool)

(assert (not d!10835))

(assert (=> b!57460 d!10835))

(assert (=> d!10589 d!10747))

(declare-fun d!10837 () Bool)

(assert (=> d!10837 (= (get!1070 (getValueByKey!121 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!2367 (getValueByKey!121 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!10655 d!10837))

(assert (=> d!10655 d!10673))

(assert (=> bm!4198 d!10617))

(declare-fun d!10839 () Bool)

(declare-fun e!38225 () Bool)

(assert (=> d!10839 e!38225))

(declare-fun res!32437 () Bool)

(assert (=> d!10839 (=> res!32437 e!38225)))

(declare-fun lt!23256 () Bool)

(assert (=> d!10839 (= res!32437 (not lt!23256))))

(declare-fun lt!23259 () Bool)

(assert (=> d!10839 (= lt!23256 lt!23259)))

(declare-fun lt!23258 () Unit!1484)

(declare-fun e!38226 () Unit!1484)

(assert (=> d!10839 (= lt!23258 e!38226)))

(declare-fun c!7254 () Bool)

(assert (=> d!10839 (= c!7254 lt!23259)))

(assert (=> d!10839 (= lt!23259 (containsKey!125 (toList!690 lt!22889) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!10839 (= (contains!677 lt!22889 (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!23256)))

(declare-fun b!58059 () Bool)

(declare-fun lt!23257 () Unit!1484)

(assert (=> b!58059 (= e!38226 lt!23257)))

(assert (=> b!58059 (= lt!23257 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22889) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!58059 (isDefined!75 (getValueByKey!121 (toList!690 lt!22889) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!58060 () Bool)

(declare-fun Unit!1522 () Unit!1484)

(assert (=> b!58060 (= e!38226 Unit!1522)))

(declare-fun b!58061 () Bool)

(assert (=> b!58061 (= e!38225 (isDefined!75 (getValueByKey!121 (toList!690 lt!22889) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!10839 c!7254) b!58059))

(assert (= (and d!10839 (not c!7254)) b!58060))

(assert (= (and d!10839 (not res!32437)) b!58061))

(declare-fun m!49339 () Bool)

(assert (=> d!10839 m!49339))

(declare-fun m!49341 () Bool)

(assert (=> b!58059 m!49341))

(assert (=> b!58059 m!48503))

(assert (=> b!58059 m!48503))

(declare-fun m!49343 () Bool)

(assert (=> b!58059 m!49343))

(assert (=> b!58061 m!48503))

(assert (=> b!58061 m!48503))

(assert (=> b!58061 m!49343))

(assert (=> d!10613 d!10839))

(declare-fun b!58063 () Bool)

(declare-fun e!38227 () Option!127)

(declare-fun e!38228 () Option!127)

(assert (=> b!58063 (= e!38227 e!38228)))

(declare-fun c!7256 () Bool)

(assert (=> b!58063 (= c!7256 (and ((_ is Cons!1427) lt!22890) (not (= (_1!1023 (h!2007 lt!22890)) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!58065 () Bool)

(assert (=> b!58065 (= e!38228 None!125)))

(declare-fun b!58064 () Bool)

(assert (=> b!58064 (= e!38228 (getValueByKey!121 (t!4744 lt!22890) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!58062 () Bool)

(assert (=> b!58062 (= e!38227 (Some!126 (_2!1023 (h!2007 lt!22890))))))

(declare-fun c!7255 () Bool)

(declare-fun d!10841 () Bool)

(assert (=> d!10841 (= c!7255 (and ((_ is Cons!1427) lt!22890) (= (_1!1023 (h!2007 lt!22890)) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!10841 (= (getValueByKey!121 lt!22890 (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!38227)))

(assert (= (and d!10841 c!7255) b!58062))

(assert (= (and d!10841 (not c!7255)) b!58063))

(assert (= (and b!58063 c!7256) b!58064))

(assert (= (and b!58063 (not c!7256)) b!58065))

(declare-fun m!49345 () Bool)

(assert (=> b!58064 m!49345))

(assert (=> d!10613 d!10841))

(declare-fun d!10843 () Bool)

(assert (=> d!10843 (= (getValueByKey!121 lt!22890 (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!126 (_2!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!23260 () Unit!1484)

(assert (=> d!10843 (= lt!23260 (choose!305 lt!22890 (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!38229 () Bool)

(assert (=> d!10843 e!38229))

(declare-fun res!32438 () Bool)

(assert (=> d!10843 (=> (not res!32438) (not e!38229))))

(assert (=> d!10843 (= res!32438 (isStrictlySorted!278 lt!22890))))

(assert (=> d!10843 (= (lemmaContainsTupThenGetReturnValue!41 lt!22890 (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!23260)))

(declare-fun b!58066 () Bool)

(declare-fun res!32439 () Bool)

(assert (=> b!58066 (=> (not res!32439) (not e!38229))))

(assert (=> b!58066 (= res!32439 (containsKey!125 lt!22890 (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!58067 () Bool)

(assert (=> b!58067 (= e!38229 (contains!681 lt!22890 (tuple2!2025 (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!10843 res!32438) b!58066))

(assert (= (and b!58066 res!32439) b!58067))

(assert (=> d!10843 m!48497))

(declare-fun m!49347 () Bool)

(assert (=> d!10843 m!49347))

(declare-fun m!49349 () Bool)

(assert (=> d!10843 m!49349))

(declare-fun m!49351 () Bool)

(assert (=> b!58066 m!49351))

(declare-fun m!49353 () Bool)

(assert (=> b!58067 m!49353))

(assert (=> d!10613 d!10843))

(declare-fun bm!4251 () Bool)

(declare-fun call!4256 () List!1431)

(declare-fun call!4255 () List!1431)

(assert (=> bm!4251 (= call!4256 call!4255)))

(declare-fun bm!4252 () Bool)

(declare-fun call!4254 () List!1431)

(assert (=> bm!4252 (= call!4255 call!4254)))

(declare-fun c!7257 () Bool)

(declare-fun bm!4253 () Bool)

(declare-fun e!38233 () List!1431)

(assert (=> bm!4253 (= call!4254 ($colon$colon!58 e!38233 (ite c!7257 (h!2007 (toList!690 (ite c!7050 call!4124 call!4115))) (tuple2!2025 (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!7259 () Bool)

(assert (=> bm!4253 (= c!7259 c!7257)))

(declare-fun e!38230 () Bool)

(declare-fun b!58068 () Bool)

(declare-fun lt!23261 () List!1431)

(assert (=> b!58068 (= e!38230 (contains!681 lt!23261 (tuple2!2025 (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!58069 () Bool)

(declare-fun e!38234 () List!1431)

(declare-fun e!38231 () List!1431)

(assert (=> b!58069 (= e!38234 e!38231)))

(declare-fun c!7260 () Bool)

(assert (=> b!58069 (= c!7260 (and ((_ is Cons!1427) (toList!690 (ite c!7050 call!4124 call!4115))) (= (_1!1023 (h!2007 (toList!690 (ite c!7050 call!4124 call!4115)))) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!58070 () Bool)

(declare-fun e!38232 () List!1431)

(assert (=> b!58070 (= e!38232 call!4256)))

(declare-fun b!58071 () Bool)

(assert (=> b!58071 (= e!38234 call!4254)))

(declare-fun b!58072 () Bool)

(assert (=> b!58072 (= e!38232 call!4256)))

(declare-fun b!58073 () Bool)

(declare-fun res!32440 () Bool)

(assert (=> b!58073 (=> (not res!32440) (not e!38230))))

(assert (=> b!58073 (= res!32440 (containsKey!125 lt!23261 (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!7258 () Bool)

(declare-fun b!58074 () Bool)

(assert (=> b!58074 (= c!7258 (and ((_ is Cons!1427) (toList!690 (ite c!7050 call!4124 call!4115))) (bvsgt (_1!1023 (h!2007 (toList!690 (ite c!7050 call!4124 call!4115)))) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!58074 (= e!38231 e!38232)))

(declare-fun b!58075 () Bool)

(assert (=> b!58075 (= e!38233 (insertStrictlySorted!44 (t!4744 (toList!690 (ite c!7050 call!4124 call!4115))) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!58076 () Bool)

(assert (=> b!58076 (= e!38231 call!4255)))

(declare-fun d!10845 () Bool)

(assert (=> d!10845 e!38230))

(declare-fun res!32441 () Bool)

(assert (=> d!10845 (=> (not res!32441) (not e!38230))))

(assert (=> d!10845 (= res!32441 (isStrictlySorted!278 lt!23261))))

(assert (=> d!10845 (= lt!23261 e!38234)))

(assert (=> d!10845 (= c!7257 (and ((_ is Cons!1427) (toList!690 (ite c!7050 call!4124 call!4115))) (bvslt (_1!1023 (h!2007 (toList!690 (ite c!7050 call!4124 call!4115)))) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!10845 (isStrictlySorted!278 (toList!690 (ite c!7050 call!4124 call!4115)))))

(assert (=> d!10845 (= (insertStrictlySorted!44 (toList!690 (ite c!7050 call!4124 call!4115)) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!23261)))

(declare-fun b!58077 () Bool)

(assert (=> b!58077 (= e!38233 (ite c!7260 (t!4744 (toList!690 (ite c!7050 call!4124 call!4115))) (ite c!7258 (Cons!1427 (h!2007 (toList!690 (ite c!7050 call!4124 call!4115))) (t!4744 (toList!690 (ite c!7050 call!4124 call!4115)))) Nil!1428)))))

(assert (= (and d!10845 c!7257) b!58071))

(assert (= (and d!10845 (not c!7257)) b!58069))

(assert (= (and b!58069 c!7260) b!58076))

(assert (= (and b!58069 (not c!7260)) b!58074))

(assert (= (and b!58074 c!7258) b!58070))

(assert (= (and b!58074 (not c!7258)) b!58072))

(assert (= (or b!58070 b!58072) bm!4251))

(assert (= (or b!58076 bm!4251) bm!4252))

(assert (= (or b!58071 bm!4252) bm!4253))

(assert (= (and bm!4253 c!7259) b!58075))

(assert (= (and bm!4253 (not c!7259)) b!58077))

(assert (= (and d!10845 res!32441) b!58073))

(assert (= (and b!58073 res!32440) b!58068))

(declare-fun m!49355 () Bool)

(assert (=> b!58073 m!49355))

(declare-fun m!49357 () Bool)

(assert (=> b!58068 m!49357))

(declare-fun m!49359 () Bool)

(assert (=> b!58075 m!49359))

(declare-fun m!49361 () Bool)

(assert (=> bm!4253 m!49361))

(declare-fun m!49363 () Bool)

(assert (=> d!10845 m!49363))

(declare-fun m!49365 () Bool)

(assert (=> d!10845 m!49365))

(assert (=> d!10613 d!10845))

(declare-fun d!10847 () Bool)

(assert (=> d!10847 (= (get!1070 (getValueByKey!121 (toList!690 lt!22752) lt!22764)) (v!2367 (getValueByKey!121 (toList!690 lt!22752) lt!22764)))))

(assert (=> d!10549 d!10847))

(declare-fun b!58079 () Bool)

(declare-fun e!38235 () Option!127)

(declare-fun e!38236 () Option!127)

(assert (=> b!58079 (= e!38235 e!38236)))

(declare-fun c!7262 () Bool)

(assert (=> b!58079 (= c!7262 (and ((_ is Cons!1427) (toList!690 lt!22752)) (not (= (_1!1023 (h!2007 (toList!690 lt!22752))) lt!22764))))))

(declare-fun b!58081 () Bool)

(assert (=> b!58081 (= e!38236 None!125)))

(declare-fun b!58080 () Bool)

(assert (=> b!58080 (= e!38236 (getValueByKey!121 (t!4744 (toList!690 lt!22752)) lt!22764))))

(declare-fun b!58078 () Bool)

(assert (=> b!58078 (= e!38235 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22752)))))))

(declare-fun d!10849 () Bool)

(declare-fun c!7261 () Bool)

(assert (=> d!10849 (= c!7261 (and ((_ is Cons!1427) (toList!690 lt!22752)) (= (_1!1023 (h!2007 (toList!690 lt!22752))) lt!22764)))))

(assert (=> d!10849 (= (getValueByKey!121 (toList!690 lt!22752) lt!22764) e!38235)))

(assert (= (and d!10849 c!7261) b!58078))

(assert (= (and d!10849 (not c!7261)) b!58079))

(assert (= (and b!58079 c!7262) b!58080))

(assert (= (and b!58079 (not c!7262)) b!58081))

(declare-fun m!49367 () Bool)

(assert (=> b!58080 m!49367))

(assert (=> d!10549 d!10849))

(declare-fun d!10851 () Bool)

(assert (=> d!10851 (= (map!1099 (_2!1022 lt!23019)) (getCurrentListMap!387 (_keys!3640 (_2!1022 lt!23019)) (_values!2004 (_2!1022 lt!23019)) (mask!5894 (_2!1022 lt!23019)) (extraKeys!1912 (_2!1022 lt!23019)) (zeroValue!1939 (_2!1022 lt!23019)) (minValue!1939 (_2!1022 lt!23019)) #b00000000000000000000000000000000 (defaultEntry!2021 (_2!1022 lt!23019))))))

(declare-fun bs!2512 () Bool)

(assert (= bs!2512 d!10851))

(declare-fun m!49369 () Bool)

(assert (=> bs!2512 m!49369))

(assert (=> b!57703 d!10851))

(declare-fun d!10853 () Bool)

(declare-fun e!38237 () Bool)

(assert (=> d!10853 e!38237))

(declare-fun res!32443 () Bool)

(assert (=> d!10853 (=> (not res!32443) (not e!38237))))

(declare-fun lt!23264 () ListLongMap!1349)

(assert (=> d!10853 (= res!32443 (contains!677 lt!23264 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!23265 () List!1431)

(assert (=> d!10853 (= lt!23264 (ListLongMap!1350 lt!23265))))

(declare-fun lt!23262 () Unit!1484)

(declare-fun lt!23263 () Unit!1484)

(assert (=> d!10853 (= lt!23262 lt!23263)))

(assert (=> d!10853 (= (getValueByKey!121 lt!23265 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!126 (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10853 (= lt!23263 (lemmaContainsTupThenGetReturnValue!41 lt!23265 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10853 (= lt!23265 (insertStrictlySorted!44 (toList!690 (map!1099 newMap!16)) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10853 (= (+!80 (map!1099 newMap!16) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!23264)))

(declare-fun b!58082 () Bool)

(declare-fun res!32442 () Bool)

(assert (=> b!58082 (=> (not res!32442) (not e!38237))))

(assert (=> b!58082 (= res!32442 (= (getValueByKey!121 (toList!690 lt!23264) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!126 (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!58083 () Bool)

(assert (=> b!58083 (= e!38237 (contains!681 (toList!690 lt!23264) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!10853 res!32443) b!58082))

(assert (= (and b!58082 res!32442) b!58083))

(declare-fun m!49371 () Bool)

(assert (=> d!10853 m!49371))

(declare-fun m!49373 () Bool)

(assert (=> d!10853 m!49373))

(declare-fun m!49375 () Bool)

(assert (=> d!10853 m!49375))

(declare-fun m!49377 () Bool)

(assert (=> d!10853 m!49377))

(declare-fun m!49379 () Bool)

(assert (=> b!58082 m!49379))

(declare-fun m!49381 () Bool)

(assert (=> b!58083 m!49381))

(assert (=> b!57703 d!10853))

(assert (=> b!57703 d!10525))

(declare-fun e!38251 () SeekEntryResult!229)

(declare-fun b!58102 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!58102 (= e!38251 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (mask!5894 newMap!16)) #b00000000000000000000000000000000 (mask!5894 newMap!16)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(declare-fun b!58103 () Bool)

(declare-fun lt!23271 () SeekEntryResult!229)

(assert (=> b!58103 (and (bvsge (index!3040 lt!23271) #b00000000000000000000000000000000) (bvslt (index!3040 lt!23271) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun e!38250 () Bool)

(assert (=> b!58103 (= e!38250 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3040 lt!23271)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!10855 () Bool)

(declare-fun e!38249 () Bool)

(assert (=> d!10855 e!38249))

(declare-fun c!7269 () Bool)

(assert (=> d!10855 (= c!7269 (and ((_ is Intermediate!229) lt!23271) (undefined!1041 lt!23271)))))

(declare-fun e!38252 () SeekEntryResult!229)

(assert (=> d!10855 (= lt!23271 e!38252)))

(declare-fun c!7271 () Bool)

(assert (=> d!10855 (= c!7271 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!23270 () (_ BitVec 64))

(assert (=> d!10855 (= lt!23270 (select (arr!1762 (_keys!3640 newMap!16)) (toIndex!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (mask!5894 newMap!16))))))

(assert (=> d!10855 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (mask!5894 newMap!16)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)) lt!23271)))

(declare-fun b!58104 () Bool)

(assert (=> b!58104 (= e!38249 (bvsge (x!9860 lt!23271) #b01111111111111111111111111111110))))

(declare-fun b!58105 () Bool)

(assert (=> b!58105 (= e!38251 (Intermediate!229 false (toIndex!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (mask!5894 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!58106 () Bool)

(assert (=> b!58106 (and (bvsge (index!3040 lt!23271) #b00000000000000000000000000000000) (bvslt (index!3040 lt!23271) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun res!32450 () Bool)

(assert (=> b!58106 (= res!32450 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3040 lt!23271)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!58106 (=> res!32450 e!38250)))

(declare-fun b!58107 () Bool)

(assert (=> b!58107 (= e!38252 e!38251)))

(declare-fun c!7270 () Bool)

(assert (=> b!58107 (= c!7270 (or (= lt!23270 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (= (bvadd lt!23270 lt!23270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!58108 () Bool)

(assert (=> b!58108 (and (bvsge (index!3040 lt!23271) #b00000000000000000000000000000000) (bvslt (index!3040 lt!23271) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun res!32452 () Bool)

(assert (=> b!58108 (= res!32452 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3040 lt!23271)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> b!58108 (=> res!32452 e!38250)))

(declare-fun e!38248 () Bool)

(assert (=> b!58108 (= e!38248 e!38250)))

(declare-fun b!58109 () Bool)

(assert (=> b!58109 (= e!38249 e!38248)))

(declare-fun res!32451 () Bool)

(assert (=> b!58109 (= res!32451 (and ((_ is Intermediate!229) lt!23271) (not (undefined!1041 lt!23271)) (bvslt (x!9860 lt!23271) #b01111111111111111111111111111110) (bvsge (x!9860 lt!23271) #b00000000000000000000000000000000) (bvsge (x!9860 lt!23271) #b00000000000000000000000000000000)))))

(assert (=> b!58109 (=> (not res!32451) (not e!38248))))

(declare-fun b!58110 () Bool)

(assert (=> b!58110 (= e!38252 (Intermediate!229 true (toIndex!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (mask!5894 newMap!16)) #b00000000000000000000000000000000))))

(assert (= (and d!10855 c!7271) b!58110))

(assert (= (and d!10855 (not c!7271)) b!58107))

(assert (= (and b!58107 c!7270) b!58105))

(assert (= (and b!58107 (not c!7270)) b!58102))

(assert (= (and d!10855 c!7269) b!58104))

(assert (= (and d!10855 (not c!7269)) b!58109))

(assert (= (and b!58109 res!32451) b!58108))

(assert (= (and b!58108 (not res!32452)) b!58106))

(assert (= (and b!58106 (not res!32450)) b!58103))

(assert (=> d!10855 m!48511))

(declare-fun m!49383 () Bool)

(assert (=> d!10855 m!49383))

(assert (=> d!10855 m!48335))

(declare-fun m!49385 () Bool)

(assert (=> b!58108 m!49385))

(assert (=> b!58103 m!49385))

(assert (=> b!58102 m!48511))

(declare-fun m!49387 () Bool)

(assert (=> b!58102 m!49387))

(assert (=> b!58102 m!49387))

(assert (=> b!58102 m!47913))

(declare-fun m!49389 () Bool)

(assert (=> b!58102 m!49389))

(assert (=> b!58106 m!49385))

(assert (=> d!10617 d!10855))

(declare-fun d!10857 () Bool)

(declare-fun lt!23277 () (_ BitVec 32))

(declare-fun lt!23276 () (_ BitVec 32))

(assert (=> d!10857 (= lt!23277 (bvmul (bvxor lt!23276 (bvlshr lt!23276 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!10857 (= lt!23276 ((_ extract 31 0) (bvand (bvxor (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvlshr (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!10857 (and (bvsge (mask!5894 newMap!16) #b00000000000000000000000000000000) (let ((res!32453 (let ((h!2012 ((_ extract 31 0) (bvand (bvxor (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvlshr (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!9963 (bvmul (bvxor h!2012 (bvlshr h!2012 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!9963 (bvlshr x!9963 #b00000000000000000000000000001101)) (mask!5894 newMap!16)))))) (and (bvslt res!32453 (bvadd (mask!5894 newMap!16) #b00000000000000000000000000000001)) (bvsge res!32453 #b00000000000000000000000000000000))))))

(assert (=> d!10857 (= (toIndex!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (mask!5894 newMap!16)) (bvand (bvxor lt!23277 (bvlshr lt!23277 #b00000000000000000000000000001101)) (mask!5894 newMap!16)))))

(assert (=> d!10617 d!10857))

(assert (=> d!10617 d!10747))

(declare-fun d!10859 () Bool)

(declare-fun e!38253 () Bool)

(assert (=> d!10859 e!38253))

(declare-fun res!32455 () Bool)

(assert (=> d!10859 (=> (not res!32455) (not e!38253))))

(declare-fun lt!23280 () ListLongMap!1349)

(assert (=> d!10859 (= res!32455 (contains!677 lt!23280 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(declare-fun lt!23281 () List!1431)

(assert (=> d!10859 (= lt!23280 (ListLongMap!1350 lt!23281))))

(declare-fun lt!23278 () Unit!1484)

(declare-fun lt!23279 () Unit!1484)

(assert (=> d!10859 (= lt!23278 lt!23279)))

(assert (=> d!10859 (= (getValueByKey!121 lt!23281 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(assert (=> d!10859 (= lt!23279 (lemmaContainsTupThenGetReturnValue!41 lt!23281 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(assert (=> d!10859 (= lt!23281 (insertStrictlySorted!44 (toList!690 call!4186) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(assert (=> d!10859 (= (+!80 call!4186 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))) lt!23280)))

(declare-fun b!58111 () Bool)

(declare-fun res!32454 () Bool)

(assert (=> b!58111 (=> (not res!32454) (not e!38253))))

(assert (=> b!58111 (= res!32454 (= (getValueByKey!121 (toList!690 lt!23280) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))))

(declare-fun b!58112 () Bool)

(assert (=> b!58112 (= e!38253 (contains!681 (toList!690 lt!23280) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))

(assert (= (and d!10859 res!32455) b!58111))

(assert (= (and b!58111 res!32454) b!58112))

(declare-fun m!49391 () Bool)

(assert (=> d!10859 m!49391))

(declare-fun m!49393 () Bool)

(assert (=> d!10859 m!49393))

(declare-fun m!49395 () Bool)

(assert (=> d!10859 m!49395))

(declare-fun m!49397 () Bool)

(assert (=> d!10859 m!49397))

(declare-fun m!49399 () Bool)

(assert (=> b!58111 m!49399))

(declare-fun m!49401 () Bool)

(assert (=> b!58112 m!49401))

(assert (=> b!57541 d!10859))

(declare-fun d!10861 () Bool)

(assert (=> d!10861 (= (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))) (and (not (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57507 d!10861))

(declare-fun d!10863 () Bool)

(declare-fun e!38254 () Bool)

(assert (=> d!10863 e!38254))

(declare-fun res!32456 () Bool)

(assert (=> d!10863 (=> res!32456 e!38254)))

(declare-fun lt!23282 () Bool)

(assert (=> d!10863 (= res!32456 (not lt!23282))))

(declare-fun lt!23285 () Bool)

(assert (=> d!10863 (= lt!23282 lt!23285)))

(declare-fun lt!23284 () Unit!1484)

(declare-fun e!38255 () Unit!1484)

(assert (=> d!10863 (= lt!23284 e!38255)))

(declare-fun c!7272 () Bool)

(assert (=> d!10863 (= c!7272 lt!23285)))

(assert (=> d!10863 (= lt!23285 (containsKey!125 (toList!690 lt!22940) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!10863 (= (contains!677 lt!22940 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23282)))

(declare-fun b!58113 () Bool)

(declare-fun lt!23283 () Unit!1484)

(assert (=> b!58113 (= e!38255 lt!23283)))

(assert (=> b!58113 (= lt!23283 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22940) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> b!58113 (isDefined!75 (getValueByKey!121 (toList!690 lt!22940) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58114 () Bool)

(declare-fun Unit!1523 () Unit!1484)

(assert (=> b!58114 (= e!38255 Unit!1523)))

(declare-fun b!58115 () Bool)

(assert (=> b!58115 (= e!38254 (isDefined!75 (getValueByKey!121 (toList!690 lt!22940) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (= (and d!10863 c!7272) b!58113))

(assert (= (and d!10863 (not c!7272)) b!58114))

(assert (= (and d!10863 (not res!32456)) b!58115))

(declare-fun m!49403 () Bool)

(assert (=> d!10863 m!49403))

(declare-fun m!49405 () Bool)

(assert (=> b!58113 m!49405))

(assert (=> b!58113 m!48599))

(assert (=> b!58113 m!48599))

(declare-fun m!49407 () Bool)

(assert (=> b!58113 m!49407))

(assert (=> b!58115 m!48599))

(assert (=> b!58115 m!48599))

(assert (=> b!58115 m!49407))

(assert (=> d!10639 d!10863))

(declare-fun b!58117 () Bool)

(declare-fun e!38256 () Option!127)

(declare-fun e!38257 () Option!127)

(assert (=> b!58117 (= e!38256 e!38257)))

(declare-fun c!7274 () Bool)

(assert (=> b!58117 (= c!7274 (and ((_ is Cons!1427) lt!22941) (not (= (_1!1023 (h!2007 lt!22941)) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun b!58119 () Bool)

(assert (=> b!58119 (= e!38257 None!125)))

(declare-fun b!58118 () Bool)

(assert (=> b!58118 (= e!38257 (getValueByKey!121 (t!4744 lt!22941) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58116 () Bool)

(assert (=> b!58116 (= e!38256 (Some!126 (_2!1023 (h!2007 lt!22941))))))

(declare-fun d!10865 () Bool)

(declare-fun c!7273 () Bool)

(assert (=> d!10865 (= c!7273 (and ((_ is Cons!1427) lt!22941) (= (_1!1023 (h!2007 lt!22941)) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!10865 (= (getValueByKey!121 lt!22941 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) e!38256)))

(assert (= (and d!10865 c!7273) b!58116))

(assert (= (and d!10865 (not c!7273)) b!58117))

(assert (= (and b!58117 c!7274) b!58118))

(assert (= (and b!58117 (not c!7274)) b!58119))

(declare-fun m!49409 () Bool)

(assert (=> b!58118 m!49409))

(assert (=> d!10639 d!10865))

(declare-fun d!10867 () Bool)

(assert (=> d!10867 (= (getValueByKey!121 lt!22941 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun lt!23286 () Unit!1484)

(assert (=> d!10867 (= lt!23286 (choose!305 lt!22941 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun e!38258 () Bool)

(assert (=> d!10867 e!38258))

(declare-fun res!32457 () Bool)

(assert (=> d!10867 (=> (not res!32457) (not e!38258))))

(assert (=> d!10867 (= res!32457 (isStrictlySorted!278 lt!22941))))

(assert (=> d!10867 (= (lemmaContainsTupThenGetReturnValue!41 lt!22941 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23286)))

(declare-fun b!58120 () Bool)

(declare-fun res!32458 () Bool)

(assert (=> b!58120 (=> (not res!32458) (not e!38258))))

(assert (=> b!58120 (= res!32458 (containsKey!125 lt!22941 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58121 () Bool)

(assert (=> b!58121 (= e!38258 (contains!681 lt!22941 (tuple2!2025 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (= (and d!10867 res!32457) b!58120))

(assert (= (and b!58120 res!32458) b!58121))

(assert (=> d!10867 m!48593))

(declare-fun m!49411 () Bool)

(assert (=> d!10867 m!49411))

(declare-fun m!49413 () Bool)

(assert (=> d!10867 m!49413))

(declare-fun m!49415 () Bool)

(assert (=> b!58120 m!49415))

(declare-fun m!49417 () Bool)

(assert (=> b!58121 m!49417))

(assert (=> d!10639 d!10867))

(declare-fun bm!4254 () Bool)

(declare-fun call!4259 () List!1431)

(declare-fun call!4258 () List!1431)

(assert (=> bm!4254 (= call!4259 call!4258)))

(declare-fun bm!4255 () Bool)

(declare-fun call!4257 () List!1431)

(assert (=> bm!4255 (= call!4258 call!4257)))

(declare-fun bm!4256 () Bool)

(declare-fun e!38262 () List!1431)

(declare-fun c!7275 () Bool)

(assert (=> bm!4256 (= call!4257 ($colon$colon!58 e!38262 (ite c!7275 (h!2007 (toList!690 call!4161)) (tuple2!2025 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun c!7277 () Bool)

(assert (=> bm!4256 (= c!7277 c!7275)))

(declare-fun b!58122 () Bool)

(declare-fun e!38259 () Bool)

(declare-fun lt!23287 () List!1431)

(assert (=> b!58122 (= e!38259 (contains!681 lt!23287 (tuple2!2025 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58123 () Bool)

(declare-fun e!38263 () List!1431)

(declare-fun e!38260 () List!1431)

(assert (=> b!58123 (= e!38263 e!38260)))

(declare-fun c!7278 () Bool)

(assert (=> b!58123 (= c!7278 (and ((_ is Cons!1427) (toList!690 call!4161)) (= (_1!1023 (h!2007 (toList!690 call!4161))) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58124 () Bool)

(declare-fun e!38261 () List!1431)

(assert (=> b!58124 (= e!38261 call!4259)))

(declare-fun b!58125 () Bool)

(assert (=> b!58125 (= e!38263 call!4257)))

(declare-fun b!58126 () Bool)

(assert (=> b!58126 (= e!38261 call!4259)))

(declare-fun b!58127 () Bool)

(declare-fun res!32459 () Bool)

(assert (=> b!58127 (=> (not res!32459) (not e!38259))))

(assert (=> b!58127 (= res!32459 (containsKey!125 lt!23287 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58128 () Bool)

(declare-fun c!7276 () Bool)

(assert (=> b!58128 (= c!7276 (and ((_ is Cons!1427) (toList!690 call!4161)) (bvsgt (_1!1023 (h!2007 (toList!690 call!4161))) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> b!58128 (= e!38260 e!38261)))

(declare-fun b!58129 () Bool)

(assert (=> b!58129 (= e!38262 (insertStrictlySorted!44 (t!4744 (toList!690 call!4161)) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58130 () Bool)

(assert (=> b!58130 (= e!38260 call!4258)))

(declare-fun d!10869 () Bool)

(assert (=> d!10869 e!38259))

(declare-fun res!32460 () Bool)

(assert (=> d!10869 (=> (not res!32460) (not e!38259))))

(assert (=> d!10869 (= res!32460 (isStrictlySorted!278 lt!23287))))

(assert (=> d!10869 (= lt!23287 e!38263)))

(assert (=> d!10869 (= c!7275 (and ((_ is Cons!1427) (toList!690 call!4161)) (bvslt (_1!1023 (h!2007 (toList!690 call!4161))) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!10869 (isStrictlySorted!278 (toList!690 call!4161))))

(assert (=> d!10869 (= (insertStrictlySorted!44 (toList!690 call!4161) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23287)))

(declare-fun b!58131 () Bool)

(assert (=> b!58131 (= e!38262 (ite c!7278 (t!4744 (toList!690 call!4161)) (ite c!7276 (Cons!1427 (h!2007 (toList!690 call!4161)) (t!4744 (toList!690 call!4161))) Nil!1428)))))

(assert (= (and d!10869 c!7275) b!58125))

(assert (= (and d!10869 (not c!7275)) b!58123))

(assert (= (and b!58123 c!7278) b!58130))

(assert (= (and b!58123 (not c!7278)) b!58128))

(assert (= (and b!58128 c!7276) b!58124))

(assert (= (and b!58128 (not c!7276)) b!58126))

(assert (= (or b!58124 b!58126) bm!4254))

(assert (= (or b!58130 bm!4254) bm!4255))

(assert (= (or b!58125 bm!4255) bm!4256))

(assert (= (and bm!4256 c!7277) b!58129))

(assert (= (and bm!4256 (not c!7277)) b!58131))

(assert (= (and d!10869 res!32460) b!58127))

(assert (= (and b!58127 res!32459) b!58122))

(declare-fun m!49419 () Bool)

(assert (=> b!58127 m!49419))

(declare-fun m!49421 () Bool)

(assert (=> b!58122 m!49421))

(declare-fun m!49423 () Bool)

(assert (=> b!58129 m!49423))

(declare-fun m!49425 () Bool)

(assert (=> bm!4256 m!49425))

(declare-fun m!49427 () Bool)

(assert (=> d!10869 m!49427))

(declare-fun m!49429 () Bool)

(assert (=> d!10869 m!49429))

(assert (=> d!10639 d!10869))

(declare-fun d!10871 () Bool)

(assert (=> d!10871 (= (apply!65 lt!22790 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1070 (getValueByKey!121 (toList!690 lt!22790) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!2513 () Bool)

(assert (= bs!2513 d!10871))

(assert (=> bs!2513 m!48119))

(assert (=> bs!2513 m!48771))

(assert (=> bs!2513 m!48771))

(declare-fun m!49431 () Bool)

(assert (=> bs!2513 m!49431))

(assert (=> b!57434 d!10871))

(assert (=> b!57434 d!10657))

(declare-fun b!58132 () Bool)

(declare-fun e!38266 () Bool)

(assert (=> b!58132 (= e!38266 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!58132 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!10873 () Bool)

(declare-fun e!38264 () Bool)

(assert (=> d!10873 e!38264))

(declare-fun res!32464 () Bool)

(assert (=> d!10873 (=> (not res!32464) (not e!38264))))

(declare-fun lt!23291 () ListLongMap!1349)

(assert (=> d!10873 (= res!32464 (not (contains!677 lt!23291 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!38265 () ListLongMap!1349)

(assert (=> d!10873 (= lt!23291 e!38265)))

(declare-fun c!7281 () Bool)

(assert (=> d!10873 (= c!7281 (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10873 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10873 (= (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) lt!23291)))

(declare-fun b!58133 () Bool)

(declare-fun e!38269 () Bool)

(declare-fun e!38270 () Bool)

(assert (=> b!58133 (= e!38269 e!38270)))

(declare-fun c!7280 () Bool)

(assert (=> b!58133 (= c!7280 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun bm!4257 () Bool)

(declare-fun call!4260 () ListLongMap!1349)

(assert (=> bm!4257 (= call!4260 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2021 newMap!16)))))

(declare-fun b!58134 () Bool)

(declare-fun res!32463 () Bool)

(assert (=> b!58134 (=> (not res!32463) (not e!38264))))

(assert (=> b!58134 (= res!32463 (not (contains!677 lt!23291 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!58135 () Bool)

(assert (=> b!58135 (= e!38270 (isEmpty!294 lt!23291))))

(declare-fun b!58136 () Bool)

(assert (=> b!58136 (= e!38264 e!38269)))

(declare-fun c!7282 () Bool)

(assert (=> b!58136 (= c!7282 e!38266)))

(declare-fun res!32462 () Bool)

(assert (=> b!58136 (=> (not res!32462) (not e!38266))))

(assert (=> b!58136 (= res!32462 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!58137 () Bool)

(assert (=> b!58137 (= e!38270 (= lt!23291 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2021 newMap!16))))))

(declare-fun b!58138 () Bool)

(declare-fun e!38267 () ListLongMap!1349)

(assert (=> b!58138 (= e!38267 call!4260)))

(declare-fun b!58139 () Bool)

(declare-fun lt!23292 () Unit!1484)

(declare-fun lt!23289 () Unit!1484)

(assert (=> b!58139 (= lt!23292 lt!23289)))

(declare-fun lt!23290 () V!2833)

(declare-fun lt!23293 () (_ BitVec 64))

(declare-fun lt!23288 () ListLongMap!1349)

(declare-fun lt!23294 () (_ BitVec 64))

(assert (=> b!58139 (not (contains!677 (+!80 lt!23288 (tuple2!2025 lt!23294 lt!23290)) lt!23293))))

(assert (=> b!58139 (= lt!23289 (addStillNotContains!15 lt!23288 lt!23294 lt!23290 lt!23293))))

(assert (=> b!58139 (= lt!23293 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!58139 (= lt!23290 (get!1065 (select (arr!1763 (_values!2004 newMap!16)) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!58139 (= lt!23294 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!58139 (= lt!23288 call!4260)))

(assert (=> b!58139 (= e!38267 (+!80 call!4260 (tuple2!2025 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) (get!1065 (select (arr!1763 (_values!2004 newMap!16)) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!58140 () Bool)

(assert (=> b!58140 (= e!38265 e!38267)))

(declare-fun c!7279 () Bool)

(assert (=> b!58140 (= c!7279 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!58141 () Bool)

(declare-fun e!38268 () Bool)

(assert (=> b!58141 (= e!38269 e!38268)))

(assert (=> b!58141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun res!32461 () Bool)

(assert (=> b!58141 (= res!32461 (contains!677 lt!23291 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!58141 (=> (not res!32461) (not e!38268))))

(declare-fun b!58142 () Bool)

(assert (=> b!58142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> b!58142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1993 (_values!2004 newMap!16))))))

(assert (=> b!58142 (= e!38268 (= (apply!65 lt!23291 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (get!1065 (select (arr!1763 (_values!2004 newMap!16)) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!58143 () Bool)

(assert (=> b!58143 (= e!38265 (ListLongMap!1350 Nil!1428))))

(assert (= (and d!10873 c!7281) b!58143))

(assert (= (and d!10873 (not c!7281)) b!58140))

(assert (= (and b!58140 c!7279) b!58139))

(assert (= (and b!58140 (not c!7279)) b!58138))

(assert (= (or b!58139 b!58138) bm!4257))

(assert (= (and d!10873 res!32464) b!58134))

(assert (= (and b!58134 res!32463) b!58136))

(assert (= (and b!58136 res!32462) b!58132))

(assert (= (and b!58136 c!7282) b!58141))

(assert (= (and b!58136 (not c!7282)) b!58133))

(assert (= (and b!58141 res!32461) b!58142))

(assert (= (and b!58133 c!7280) b!58137))

(assert (= (and b!58133 (not c!7280)) b!58135))

(declare-fun b_lambda!2541 () Bool)

(assert (=> (not b_lambda!2541) (not b!58139)))

(assert (=> b!58139 t!4758))

(declare-fun b_and!3517 () Bool)

(assert (= b_and!3513 (and (=> t!4758 result!2353) b_and!3517)))

(assert (=> b!58139 t!4760))

(declare-fun b_and!3519 () Bool)

(assert (= b_and!3515 (and (=> t!4760 result!2355) b_and!3519)))

(declare-fun b_lambda!2543 () Bool)

(assert (=> (not b_lambda!2543) (not b!58142)))

(assert (=> b!58142 t!4758))

(declare-fun b_and!3521 () Bool)

(assert (= b_and!3517 (and (=> t!4758 result!2353) b_and!3521)))

(assert (=> b!58142 t!4760))

(declare-fun b_and!3523 () Bool)

(assert (= b_and!3519 (and (=> t!4760 result!2355) b_and!3523)))

(assert (=> b!58140 m!48317))

(assert (=> b!58140 m!48317))

(assert (=> b!58140 m!48321))

(declare-fun m!49433 () Bool)

(assert (=> b!58135 m!49433))

(declare-fun m!49435 () Bool)

(assert (=> b!58137 m!49435))

(declare-fun m!49437 () Bool)

(assert (=> d!10873 m!49437))

(assert (=> d!10873 m!48335))

(assert (=> b!58139 m!48353))

(assert (=> b!58139 m!48411))

(assert (=> b!58139 m!48353))

(assert (=> b!58139 m!48413))

(assert (=> b!58139 m!48411))

(declare-fun m!49439 () Bool)

(assert (=> b!58139 m!49439))

(declare-fun m!49441 () Bool)

(assert (=> b!58139 m!49441))

(declare-fun m!49443 () Bool)

(assert (=> b!58139 m!49443))

(assert (=> b!58139 m!48317))

(assert (=> b!58139 m!49443))

(declare-fun m!49445 () Bool)

(assert (=> b!58139 m!49445))

(assert (=> bm!4257 m!49435))

(assert (=> b!58142 m!48411))

(assert (=> b!58142 m!48353))

(assert (=> b!58142 m!48411))

(assert (=> b!58142 m!48353))

(assert (=> b!58142 m!48413))

(assert (=> b!58142 m!48317))

(declare-fun m!49447 () Bool)

(assert (=> b!58142 m!49447))

(assert (=> b!58142 m!48317))

(declare-fun m!49449 () Bool)

(assert (=> b!58134 m!49449))

(assert (=> b!58132 m!48317))

(assert (=> b!58132 m!48317))

(assert (=> b!58132 m!48321))

(assert (=> b!58141 m!48317))

(assert (=> b!58141 m!48317))

(declare-fun m!49451 () Bool)

(assert (=> b!58141 m!49451))

(assert (=> bm!4183 d!10873))

(declare-fun b!58147 () Bool)

(declare-fun e!38271 () Bool)

(assert (=> b!58147 (= e!38271 (and (bvsge (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!354 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun d!10875 () Bool)

(declare-fun res!32465 () Bool)

(assert (=> d!10875 (=> (not res!32465) (not e!38271))))

(assert (=> d!10875 (= res!32465 (validMask!0 (mask!5894 (v!2361 (underlying!220 thiss!992)))))))

(assert (=> d!10875 (= (simpleValid!41 (v!2361 (underlying!220 thiss!992))) e!38271)))

(declare-fun b!58144 () Bool)

(declare-fun res!32467 () Bool)

(assert (=> b!58144 (=> (not res!32467) (not e!38271))))

(assert (=> b!58144 (= res!32467 (and (= (size!1993 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000001)) (= (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (size!1993 (_values!2004 (v!2361 (underlying!220 thiss!992))))) (bvsge (_size!354 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!354 (v!2361 (underlying!220 thiss!992))) (bvadd (mask!5894 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!58145 () Bool)

(declare-fun res!32466 () Bool)

(assert (=> b!58145 (=> (not res!32466) (not e!38271))))

(assert (=> b!58145 (= res!32466 (bvsge (size!1998 (v!2361 (underlying!220 thiss!992))) (_size!354 (v!2361 (underlying!220 thiss!992)))))))

(declare-fun b!58146 () Bool)

(declare-fun res!32468 () Bool)

(assert (=> b!58146 (=> (not res!32468) (not e!38271))))

(assert (=> b!58146 (= res!32468 (= (size!1998 (v!2361 (underlying!220 thiss!992))) (bvadd (_size!354 (v!2361 (underlying!220 thiss!992))) (bvsdiv (bvadd (extraKeys!1912 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!10875 res!32465) b!58144))

(assert (= (and b!58144 res!32467) b!58145))

(assert (= (and b!58145 res!32466) b!58146))

(assert (= (and b!58146 res!32468) b!58147))

(assert (=> d!10875 m!47927))

(declare-fun m!49453 () Bool)

(assert (=> b!58145 m!49453))

(assert (=> b!58146 m!49453))

(assert (=> d!10637 d!10875))

(declare-fun d!10877 () Bool)

(assert (=> d!10877 (= (inRange!0 (ite c!7111 (index!3038 lt!22834) (index!3041 lt!22834)) (mask!5894 newMap!16)) (and (bvsge (ite c!7111 (index!3038 lt!22834) (index!3041 lt!22834)) #b00000000000000000000000000000000) (bvslt (ite c!7111 (index!3038 lt!22834) (index!3041 lt!22834)) (bvadd (mask!5894 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!4168 d!10877))

(assert (=> d!10595 d!10747))

(declare-fun b!58149 () Bool)

(declare-fun e!38272 () Option!127)

(declare-fun e!38273 () Option!127)

(assert (=> b!58149 (= e!38272 e!38273)))

(declare-fun c!7284 () Bool)

(assert (=> b!58149 (= c!7284 (and ((_ is Cons!1427) (toList!690 lt!22813)) (not (= (_1!1023 (h!2007 (toList!690 lt!22813))) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun b!58151 () Bool)

(assert (=> b!58151 (= e!38273 None!125)))

(declare-fun b!58150 () Bool)

(assert (=> b!58150 (= e!38273 (getValueByKey!121 (t!4744 (toList!690 lt!22813)) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58148 () Bool)

(assert (=> b!58148 (= e!38272 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22813)))))))

(declare-fun c!7283 () Bool)

(declare-fun d!10879 () Bool)

(assert (=> d!10879 (= c!7283 (and ((_ is Cons!1427) (toList!690 lt!22813)) (= (_1!1023 (h!2007 (toList!690 lt!22813))) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!10879 (= (getValueByKey!121 (toList!690 lt!22813) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) e!38272)))

(assert (= (and d!10879 c!7283) b!58148))

(assert (= (and d!10879 (not c!7283)) b!58149))

(assert (= (and b!58149 c!7284) b!58150))

(assert (= (and b!58149 (not c!7284)) b!58151))

(declare-fun m!49455 () Bool)

(assert (=> b!58150 m!49455))

(assert (=> b!57446 d!10879))

(declare-fun d!10881 () Bool)

(declare-fun e!38274 () Bool)

(assert (=> d!10881 e!38274))

(declare-fun res!32469 () Bool)

(assert (=> d!10881 (=> res!32469 e!38274)))

(declare-fun lt!23295 () Bool)

(assert (=> d!10881 (= res!32469 (not lt!23295))))

(declare-fun lt!23298 () Bool)

(assert (=> d!10881 (= lt!23295 lt!23298)))

(declare-fun lt!23297 () Unit!1484)

(declare-fun e!38275 () Unit!1484)

(assert (=> d!10881 (= lt!23297 e!38275)))

(declare-fun c!7285 () Bool)

(assert (=> d!10881 (= c!7285 lt!23298)))

(assert (=> d!10881 (= lt!23298 (containsKey!125 (toList!690 lt!23070) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10881 (= (contains!677 lt!23070 #b0000000000000000000000000000000000000000000000000000000000000000) lt!23295)))

(declare-fun b!58152 () Bool)

(declare-fun lt!23296 () Unit!1484)

(assert (=> b!58152 (= e!38275 lt!23296)))

(assert (=> b!58152 (= lt!23296 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!23070) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!58152 (isDefined!75 (getValueByKey!121 (toList!690 lt!23070) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58153 () Bool)

(declare-fun Unit!1524 () Unit!1484)

(assert (=> b!58153 (= e!38275 Unit!1524)))

(declare-fun b!58154 () Bool)

(assert (=> b!58154 (= e!38274 (isDefined!75 (getValueByKey!121 (toList!690 lt!23070) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10881 c!7285) b!58152))

(assert (= (and d!10881 (not c!7285)) b!58153))

(assert (= (and d!10881 (not res!32469)) b!58154))

(declare-fun m!49457 () Bool)

(assert (=> d!10881 m!49457))

(declare-fun m!49459 () Bool)

(assert (=> b!58152 m!49459))

(declare-fun m!49461 () Bool)

(assert (=> b!58152 m!49461))

(assert (=> b!58152 m!49461))

(declare-fun m!49463 () Bool)

(assert (=> b!58152 m!49463))

(assert (=> b!58154 m!49461))

(assert (=> b!58154 m!49461))

(assert (=> b!58154 m!49463))

(assert (=> bm!4207 d!10881))

(declare-fun d!10883 () Bool)

(assert (=> d!10883 (= (get!1068 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2360 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!57646 d!10883))

(declare-fun d!10885 () Bool)

(declare-fun e!38276 () Bool)

(assert (=> d!10885 e!38276))

(declare-fun res!32470 () Bool)

(assert (=> d!10885 (=> res!32470 e!38276)))

(declare-fun lt!23299 () Bool)

(assert (=> d!10885 (= res!32470 (not lt!23299))))

(declare-fun lt!23302 () Bool)

(assert (=> d!10885 (= lt!23299 lt!23302)))

(declare-fun lt!23301 () Unit!1484)

(declare-fun e!38277 () Unit!1484)

(assert (=> d!10885 (= lt!23301 e!38277)))

(declare-fun c!7286 () Bool)

(assert (=> d!10885 (= c!7286 lt!23302)))

(assert (=> d!10885 (= lt!23302 (containsKey!125 (toList!690 lt!22790) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10885 (= (contains!677 lt!22790 #b0000000000000000000000000000000000000000000000000000000000000000) lt!23299)))

(declare-fun b!58155 () Bool)

(declare-fun lt!23300 () Unit!1484)

(assert (=> b!58155 (= e!38277 lt!23300)))

(assert (=> b!58155 (= lt!23300 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22790) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!58155 (isDefined!75 (getValueByKey!121 (toList!690 lt!22790) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58156 () Bool)

(declare-fun Unit!1525 () Unit!1484)

(assert (=> b!58156 (= e!38277 Unit!1525)))

(declare-fun b!58157 () Bool)

(assert (=> b!58157 (= e!38276 (isDefined!75 (getValueByKey!121 (toList!690 lt!22790) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10885 c!7286) b!58155))

(assert (= (and d!10885 (not c!7286)) b!58156))

(assert (= (and d!10885 (not res!32470)) b!58157))

(declare-fun m!49465 () Bool)

(assert (=> d!10885 m!49465))

(declare-fun m!49467 () Bool)

(assert (=> b!58155 m!49467))

(declare-fun m!49469 () Bool)

(assert (=> b!58155 m!49469))

(assert (=> b!58155 m!49469))

(declare-fun m!49471 () Bool)

(assert (=> b!58155 m!49471))

(assert (=> b!58157 m!49469))

(assert (=> b!58157 m!49469))

(assert (=> b!58157 m!49471))

(assert (=> d!10545 d!10885))

(assert (=> d!10545 d!10507))

(declare-fun b!58159 () Bool)

(declare-fun e!38278 () Option!127)

(declare-fun e!38279 () Option!127)

(assert (=> b!58159 (= e!38278 e!38279)))

(declare-fun c!7288 () Bool)

(assert (=> b!58159 (= c!7288 (and ((_ is Cons!1427) (toList!690 lt!22889)) (not (= (_1!1023 (h!2007 (toList!690 lt!22889))) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!58161 () Bool)

(assert (=> b!58161 (= e!38279 None!125)))

(declare-fun b!58160 () Bool)

(assert (=> b!58160 (= e!38279 (getValueByKey!121 (t!4744 (toList!690 lt!22889)) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!58158 () Bool)

(assert (=> b!58158 (= e!38278 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22889)))))))

(declare-fun c!7287 () Bool)

(declare-fun d!10887 () Bool)

(assert (=> d!10887 (= c!7287 (and ((_ is Cons!1427) (toList!690 lt!22889)) (= (_1!1023 (h!2007 (toList!690 lt!22889))) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!10887 (= (getValueByKey!121 (toList!690 lt!22889) (_1!1023 (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!38278)))

(assert (= (and d!10887 c!7287) b!58158))

(assert (= (and d!10887 (not c!7287)) b!58159))

(assert (= (and b!58159 c!7288) b!58160))

(assert (= (and b!58159 (not c!7288)) b!58161))

(declare-fun m!49473 () Bool)

(assert (=> b!58160 m!49473))

(assert (=> b!57577 d!10887))

(declare-fun b!58163 () Bool)

(declare-fun e!38280 () Option!127)

(declare-fun e!38281 () Option!127)

(assert (=> b!58163 (= e!38280 e!38281)))

(declare-fun c!7290 () Bool)

(assert (=> b!58163 (= c!7290 (and ((_ is Cons!1427) (toList!690 lt!22821)) (not (= (_1!1023 (h!2007 (toList!690 lt!22821))) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun b!58165 () Bool)

(assert (=> b!58165 (= e!38281 None!125)))

(declare-fun b!58164 () Bool)

(assert (=> b!58164 (= e!38281 (getValueByKey!121 (t!4744 (toList!690 lt!22821)) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58162 () Bool)

(assert (=> b!58162 (= e!38280 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22821)))))))

(declare-fun d!10889 () Bool)

(declare-fun c!7289 () Bool)

(assert (=> d!10889 (= c!7289 (and ((_ is Cons!1427) (toList!690 lt!22821)) (= (_1!1023 (h!2007 (toList!690 lt!22821))) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!10889 (= (getValueByKey!121 (toList!690 lt!22821) (_1!1023 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) e!38280)))

(assert (= (and d!10889 c!7289) b!58162))

(assert (= (and d!10889 (not c!7289)) b!58163))

(assert (= (and b!58163 c!7290) b!58164))

(assert (= (and b!58163 (not c!7290)) b!58165))

(declare-fun m!49475 () Bool)

(assert (=> b!58164 m!49475))

(assert (=> b!57450 d!10889))

(declare-fun d!10891 () Bool)

(assert (=> d!10891 (isDefined!75 (getValueByKey!121 (toList!690 e!37742) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))))))

(declare-fun lt!23303 () Unit!1484)

(assert (=> d!10891 (= lt!23303 (choose!297 (toList!690 e!37742) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))))))

(declare-fun e!38282 () Bool)

(assert (=> d!10891 e!38282))

(declare-fun res!32471 () Bool)

(assert (=> d!10891 (=> (not res!32471) (not e!38282))))

(assert (=> d!10891 (= res!32471 (isStrictlySorted!278 (toList!690 e!37742)))))

(assert (=> d!10891 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 e!37742) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))) lt!23303)))

(declare-fun b!58166 () Bool)

(assert (=> b!58166 (= e!38282 (containsKey!125 (toList!690 e!37742) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))))))

(assert (= (and d!10891 res!32471) b!58166))

(assert (=> d!10891 m!48559))

(assert (=> d!10891 m!48559))

(assert (=> d!10891 m!48561))

(declare-fun m!49477 () Bool)

(assert (=> d!10891 m!49477))

(declare-fun m!49479 () Bool)

(assert (=> d!10891 m!49479))

(assert (=> b!58166 m!48555))

(assert (=> b!57617 d!10891))

(declare-fun d!10893 () Bool)

(assert (=> d!10893 (= (isDefined!75 (getValueByKey!121 (toList!690 e!37742) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666))))) (not (isEmpty!295 (getValueByKey!121 (toList!690 e!37742) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))))))))

(declare-fun bs!2514 () Bool)

(assert (= bs!2514 d!10893))

(assert (=> bs!2514 m!48559))

(declare-fun m!49481 () Bool)

(assert (=> bs!2514 m!49481))

(assert (=> b!57617 d!10893))

(declare-fun b!58168 () Bool)

(declare-fun e!38283 () Option!127)

(declare-fun e!38284 () Option!127)

(assert (=> b!58168 (= e!38283 e!38284)))

(declare-fun c!7292 () Bool)

(assert (=> b!58168 (= c!7292 (and ((_ is Cons!1427) (toList!690 e!37742)) (not (= (_1!1023 (h!2007 (toList!690 e!37742))) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))))))))

(declare-fun b!58170 () Bool)

(assert (=> b!58170 (= e!38284 None!125)))

(declare-fun b!58169 () Bool)

(assert (=> b!58169 (= e!38284 (getValueByKey!121 (t!4744 (toList!690 e!37742)) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))))))

(declare-fun b!58167 () Bool)

(assert (=> b!58167 (= e!38283 (Some!126 (_2!1023 (h!2007 (toList!690 e!37742)))))))

(declare-fun d!10895 () Bool)

(declare-fun c!7291 () Bool)

(assert (=> d!10895 (= c!7291 (and ((_ is Cons!1427) (toList!690 e!37742)) (= (_1!1023 (h!2007 (toList!690 e!37742))) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666))))))))

(assert (=> d!10895 (= (getValueByKey!121 (toList!690 e!37742) (ite c!7052 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))) e!38283)))

(assert (= (and d!10895 c!7291) b!58167))

(assert (= (and d!10895 (not c!7291)) b!58168))

(assert (= (and b!58168 c!7292) b!58169))

(assert (= (and b!58168 (not c!7292)) b!58170))

(declare-fun m!49483 () Bool)

(assert (=> b!58169 m!49483))

(assert (=> b!57617 d!10895))

(declare-fun d!10897 () Bool)

(assert (=> d!10897 (= (inRange!0 (ite c!7163 (index!3039 lt!23030) (ite c!7164 (index!3038 lt!23044) (index!3041 lt!23044))) (mask!5894 newMap!16)) (and (bvsge (ite c!7163 (index!3039 lt!23030) (ite c!7164 (index!3038 lt!23044) (index!3041 lt!23044))) #b00000000000000000000000000000000) (bvslt (ite c!7163 (index!3039 lt!23030) (ite c!7164 (index!3038 lt!23044) (index!3041 lt!23044))) (bvadd (mask!5894 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!4201 d!10897))

(declare-fun b!58183 () Bool)

(declare-fun e!38291 () SeekEntryResult!229)

(declare-fun e!38292 () SeekEntryResult!229)

(assert (=> b!58183 (= e!38291 e!38292)))

(declare-fun c!7300 () Bool)

(declare-fun lt!23308 () (_ BitVec 64))

(assert (=> b!58183 (= c!7300 (= lt!23308 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun d!10899 () Bool)

(declare-fun lt!23309 () SeekEntryResult!229)

(assert (=> d!10899 (and (or ((_ is Undefined!229) lt!23309) (not ((_ is Found!229) lt!23309)) (and (bvsge (index!3039 lt!23309) #b00000000000000000000000000000000) (bvslt (index!3039 lt!23309) (size!1992 (_keys!3640 newMap!16))))) (or ((_ is Undefined!229) lt!23309) ((_ is Found!229) lt!23309) (not ((_ is MissingVacant!229) lt!23309)) (not (= (index!3041 lt!23309) (index!3040 lt!22897))) (and (bvsge (index!3041 lt!23309) #b00000000000000000000000000000000) (bvslt (index!3041 lt!23309) (size!1992 (_keys!3640 newMap!16))))) (or ((_ is Undefined!229) lt!23309) (ite ((_ is Found!229) lt!23309) (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!23309)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) (and ((_ is MissingVacant!229) lt!23309) (= (index!3041 lt!23309) (index!3040 lt!22897)) (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3041 lt!23309)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!10899 (= lt!23309 e!38291)))

(declare-fun c!7299 () Bool)

(assert (=> d!10899 (= c!7299 (bvsge (x!9860 lt!22897) #b01111111111111111111111111111110))))

(assert (=> d!10899 (= lt!23308 (select (arr!1762 (_keys!3640 newMap!16)) (index!3040 lt!22897)))))

(assert (=> d!10899 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10899 (= (seekKeyOrZeroReturnVacant!0 (x!9860 lt!22897) (index!3040 lt!22897) (index!3040 lt!22897) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)) lt!23309)))

(declare-fun b!58184 () Bool)

(declare-fun e!38293 () SeekEntryResult!229)

(assert (=> b!58184 (= e!38293 (seekKeyOrZeroReturnVacant!0 (bvadd (x!9860 lt!22897) #b00000000000000000000000000000001) (nextIndex!0 (index!3040 lt!22897) (x!9860 lt!22897) (mask!5894 newMap!16)) (index!3040 lt!22897) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(declare-fun b!58185 () Bool)

(assert (=> b!58185 (= e!38292 (Found!229 (index!3040 lt!22897)))))

(declare-fun b!58186 () Bool)

(declare-fun c!7301 () Bool)

(assert (=> b!58186 (= c!7301 (= lt!23308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!58186 (= e!38292 e!38293)))

(declare-fun b!58187 () Bool)

(assert (=> b!58187 (= e!38293 (MissingVacant!229 (index!3040 lt!22897)))))

(declare-fun b!58188 () Bool)

(assert (=> b!58188 (= e!38291 Undefined!229)))

(assert (= (and d!10899 c!7299) b!58188))

(assert (= (and d!10899 (not c!7299)) b!58183))

(assert (= (and b!58183 c!7300) b!58185))

(assert (= (and b!58183 (not c!7300)) b!58186))

(assert (= (and b!58186 c!7301) b!58187))

(assert (= (and b!58186 (not c!7301)) b!58184))

(declare-fun m!49485 () Bool)

(assert (=> d!10899 m!49485))

(declare-fun m!49487 () Bool)

(assert (=> d!10899 m!49487))

(assert (=> d!10899 m!48519))

(assert (=> d!10899 m!48335))

(declare-fun m!49489 () Bool)

(assert (=> b!58184 m!49489))

(assert (=> b!58184 m!49489))

(assert (=> b!58184 m!47913))

(declare-fun m!49491 () Bool)

(assert (=> b!58184 m!49491))

(assert (=> b!57593 d!10899))

(declare-fun d!10901 () Bool)

(assert (=> d!10901 (= (apply!65 lt!22857 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (get!1070 (getValueByKey!121 (toList!690 lt!22857) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!2515 () Bool)

(assert (= bs!2515 d!10901))

(assert (=> bs!2515 m!48317))

(declare-fun m!49493 () Bool)

(assert (=> bs!2515 m!49493))

(assert (=> bs!2515 m!49493))

(declare-fun m!49495 () Bool)

(assert (=> bs!2515 m!49495))

(assert (=> b!57522 d!10901))

(declare-fun c!7302 () Bool)

(declare-fun d!10903 () Bool)

(assert (=> d!10903 (= c!7302 ((_ is ValueCellFull!851) (select (arr!1763 (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))))) #b00000000000000000000000000000000)))))

(declare-fun e!38294 () V!2833)

(assert (=> d!10903 (= (get!1065 (select (arr!1763 (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!38294)))

(declare-fun b!58189 () Bool)

(assert (=> b!58189 (= e!38294 (get!1068 (select (arr!1763 (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!58190 () Bool)

(assert (=> b!58190 (= e!38294 (get!1069 (select (arr!1763 (ite (or c!7050 c!7052) (_values!2004 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10903 c!7302) b!58189))

(assert (= (and d!10903 (not c!7302)) b!58190))

(assert (=> b!58189 m!48351))

(assert (=> b!58189 m!48353))

(declare-fun m!49497 () Bool)

(assert (=> b!58189 m!49497))

(assert (=> b!58190 m!48351))

(assert (=> b!58190 m!48353))

(declare-fun m!49499 () Bool)

(assert (=> b!58190 m!49499))

(assert (=> b!57522 d!10903))

(assert (=> d!10579 d!10581))

(assert (=> d!10579 d!10583))

(declare-fun d!10905 () Bool)

(assert (=> d!10905 (isDefined!75 (getValueByKey!121 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!10905 true))

(declare-fun _$12!302 () Unit!1484)

(assert (=> d!10905 (= (choose!297 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) _$12!302)))

(declare-fun bs!2516 () Bool)

(assert (= bs!2516 d!10905))

(assert (=> bs!2516 m!47913))

(assert (=> bs!2516 m!48051))

(assert (=> bs!2516 m!48051))

(assert (=> bs!2516 m!48053))

(assert (=> d!10579 d!10905))

(declare-fun d!10907 () Bool)

(declare-fun res!32476 () Bool)

(declare-fun e!38299 () Bool)

(assert (=> d!10907 (=> res!32476 e!38299)))

(assert (=> d!10907 (= res!32476 (or ((_ is Nil!1428) (toList!690 lt!22556)) ((_ is Nil!1428) (t!4744 (toList!690 lt!22556)))))))

(assert (=> d!10907 (= (isStrictlySorted!278 (toList!690 lt!22556)) e!38299)))

(declare-fun b!58195 () Bool)

(declare-fun e!38300 () Bool)

(assert (=> b!58195 (= e!38299 e!38300)))

(declare-fun res!32477 () Bool)

(assert (=> b!58195 (=> (not res!32477) (not e!38300))))

(assert (=> b!58195 (= res!32477 (bvslt (_1!1023 (h!2007 (toList!690 lt!22556))) (_1!1023 (h!2007 (t!4744 (toList!690 lt!22556))))))))

(declare-fun b!58196 () Bool)

(assert (=> b!58196 (= e!38300 (isStrictlySorted!278 (t!4744 (toList!690 lt!22556))))))

(assert (= (and d!10907 (not res!32476)) b!58195))

(assert (= (and b!58195 res!32477) b!58196))

(declare-fun m!49501 () Bool)

(assert (=> b!58196 m!49501))

(assert (=> d!10579 d!10907))

(declare-fun b!58198 () Bool)

(declare-fun e!38301 () Option!127)

(declare-fun e!38302 () Option!127)

(assert (=> b!58198 (= e!38301 e!38302)))

(declare-fun c!7304 () Bool)

(assert (=> b!58198 (= c!7304 (and ((_ is Cons!1427) (toList!690 lt!22940)) (not (= (_1!1023 (h!2007 (toList!690 lt!22940))) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun b!58200 () Bool)

(assert (=> b!58200 (= e!38302 None!125)))

(declare-fun b!58199 () Bool)

(assert (=> b!58199 (= e!38302 (getValueByKey!121 (t!4744 (toList!690 lt!22940)) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58197 () Bool)

(assert (=> b!58197 (= e!38301 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22940)))))))

(declare-fun d!10909 () Bool)

(declare-fun c!7303 () Bool)

(assert (=> d!10909 (= c!7303 (and ((_ is Cons!1427) (toList!690 lt!22940)) (= (_1!1023 (h!2007 (toList!690 lt!22940))) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!10909 (= (getValueByKey!121 (toList!690 lt!22940) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) e!38301)))

(assert (= (and d!10909 c!7303) b!58197))

(assert (= (and d!10909 (not c!7303)) b!58198))

(assert (= (and b!58198 c!7304) b!58199))

(assert (= (and b!58198 (not c!7304)) b!58200))

(declare-fun m!49503 () Bool)

(assert (=> b!58199 m!49503))

(assert (=> b!57632 d!10909))

(declare-fun b!58201 () Bool)

(declare-fun e!38303 () Bool)

(declare-fun call!4261 () Bool)

(assert (=> b!58201 (= e!38303 call!4261)))

(declare-fun b!58202 () Bool)

(declare-fun e!38305 () Bool)

(assert (=> b!58202 (= e!38305 e!38303)))

(declare-fun c!7305 () Bool)

(assert (=> b!58202 (= c!7305 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000)))))

(declare-fun b!58203 () Bool)

(declare-fun e!38304 () Bool)

(assert (=> b!58203 (= e!38304 call!4261)))

(declare-fun b!58204 () Bool)

(assert (=> b!58204 (= e!38303 e!38304)))

(declare-fun lt!23312 () (_ BitVec 64))

(assert (=> b!58204 (= lt!23312 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000))))

(declare-fun lt!23311 () Unit!1484)

(assert (=> b!58204 (= lt!23311 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3640 (_2!1022 lt!22687)) lt!23312 #b00000000000000000000000000000000))))

(assert (=> b!58204 (arrayContainsKey!0 (_keys!3640 (_2!1022 lt!22687)) lt!23312 #b00000000000000000000000000000000)))

(declare-fun lt!23310 () Unit!1484)

(assert (=> b!58204 (= lt!23310 lt!23311)))

(declare-fun res!32478 () Bool)

(assert (=> b!58204 (= res!32478 (= (seekEntryOrOpen!0 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000) (_keys!3640 (_2!1022 lt!22687)) (mask!5894 (_2!1022 lt!22687))) (Found!229 #b00000000000000000000000000000000)))))

(assert (=> b!58204 (=> (not res!32478) (not e!38304))))

(declare-fun d!10911 () Bool)

(declare-fun res!32479 () Bool)

(assert (=> d!10911 (=> res!32479 e!38305)))

(assert (=> d!10911 (= res!32479 (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 (_2!1022 lt!22687)))))))

(assert (=> d!10911 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3640 (_2!1022 lt!22687)) (mask!5894 (_2!1022 lt!22687))) e!38305)))

(declare-fun bm!4258 () Bool)

(assert (=> bm!4258 (= call!4261 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3640 (_2!1022 lt!22687)) (mask!5894 (_2!1022 lt!22687))))))

(assert (= (and d!10911 (not res!32479)) b!58202))

(assert (= (and b!58202 c!7305) b!58204))

(assert (= (and b!58202 (not c!7305)) b!58201))

(assert (= (and b!58204 res!32478) b!58203))

(assert (= (or b!58203 b!58201) bm!4258))

(assert (=> b!58202 m!49005))

(assert (=> b!58202 m!49005))

(assert (=> b!58202 m!49007))

(assert (=> b!58204 m!49005))

(declare-fun m!49505 () Bool)

(assert (=> b!58204 m!49505))

(declare-fun m!49507 () Bool)

(assert (=> b!58204 m!49507))

(assert (=> b!58204 m!49005))

(declare-fun m!49509 () Bool)

(assert (=> b!58204 m!49509))

(declare-fun m!49511 () Bool)

(assert (=> bm!4258 m!49511))

(assert (=> b!57561 d!10911))

(declare-fun d!10913 () Bool)

(declare-fun e!38306 () Bool)

(assert (=> d!10913 e!38306))

(declare-fun res!32481 () Bool)

(assert (=> d!10913 (=> (not res!32481) (not e!38306))))

(declare-fun lt!23315 () ListLongMap!1349)

(assert (=> d!10913 (= res!32481 (contains!677 lt!23315 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!23316 () List!1431)

(assert (=> d!10913 (= lt!23315 (ListLongMap!1350 lt!23316))))

(declare-fun lt!23313 () Unit!1484)

(declare-fun lt!23314 () Unit!1484)

(assert (=> d!10913 (= lt!23313 lt!23314)))

(assert (=> d!10913 (= (getValueByKey!121 lt!23316 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!126 (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10913 (= lt!23314 (lemmaContainsTupThenGetReturnValue!41 lt!23316 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10913 (= lt!23316 (insertStrictlySorted!44 (toList!690 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10913 (= (+!80 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!23315)))

(declare-fun b!58205 () Bool)

(declare-fun res!32480 () Bool)

(assert (=> b!58205 (=> (not res!32480) (not e!38306))))

(assert (=> b!58205 (= res!32480 (= (getValueByKey!121 (toList!690 lt!23315) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!126 (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!58206 () Bool)

(assert (=> b!58206 (= e!38306 (contains!681 (toList!690 lt!23315) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!10913 res!32481) b!58205))

(assert (= (and b!58205 res!32480) b!58206))

(declare-fun m!49513 () Bool)

(assert (=> d!10913 m!49513))

(declare-fun m!49515 () Bool)

(assert (=> d!10913 m!49515))

(declare-fun m!49517 () Bool)

(assert (=> d!10913 m!49517))

(declare-fun m!49519 () Bool)

(assert (=> d!10913 m!49519))

(declare-fun m!49521 () Bool)

(assert (=> b!58205 m!49521))

(declare-fun m!49523 () Bool)

(assert (=> b!58206 m!49523))

(assert (=> d!10601 d!10913))

(declare-fun b!58208 () Bool)

(declare-fun e!38309 () ListLongMap!1349)

(declare-fun call!4264 () ListLongMap!1349)

(assert (=> b!58208 (= e!38309 call!4264)))

(declare-fun b!58209 () Bool)

(declare-fun e!38313 () Bool)

(assert (=> b!58209 (= e!38313 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!58210 () Bool)

(declare-fun e!38317 () Bool)

(declare-fun e!38314 () Bool)

(assert (=> b!58210 (= e!38317 e!38314)))

(declare-fun res!32482 () Bool)

(declare-fun call!4263 () Bool)

(assert (=> b!58210 (= res!32482 call!4263)))

(assert (=> b!58210 (=> (not res!32482) (not e!38314))))

(declare-fun b!58211 () Bool)

(declare-fun e!38315 () ListLongMap!1349)

(declare-fun e!38318 () ListLongMap!1349)

(assert (=> b!58211 (= e!38315 e!38318)))

(declare-fun c!7307 () Bool)

(assert (=> b!58211 (= c!7307 (and (not (= (bvand lt!22674 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!22674 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!58212 () Bool)

(declare-fun c!7308 () Bool)

(assert (=> b!58212 (= c!7308 (and (not (= (bvand lt!22674 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!22674 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!58212 (= e!38318 e!38309)))

(declare-fun bm!4259 () Bool)

(declare-fun call!4265 () ListLongMap!1349)

(declare-fun call!4267 () ListLongMap!1349)

(assert (=> bm!4259 (= call!4265 call!4267)))

(declare-fun b!58213 () Bool)

(declare-fun e!38308 () Bool)

(declare-fun e!38307 () Bool)

(assert (=> b!58213 (= e!38308 e!38307)))

(declare-fun res!32488 () Bool)

(assert (=> b!58213 (=> (not res!32488) (not e!38307))))

(declare-fun lt!23338 () ListLongMap!1349)

(assert (=> b!58213 (= res!32488 (contains!677 lt!23338 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!58213 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!58214 () Bool)

(declare-fun e!38316 () Unit!1484)

(declare-fun Unit!1526 () Unit!1484)

(assert (=> b!58214 (= e!38316 Unit!1526)))

(declare-fun b!58215 () Bool)

(declare-fun call!4268 () ListLongMap!1349)

(assert (=> b!58215 (= e!38315 (+!80 call!4268 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!10915 () Bool)

(declare-fun e!38310 () Bool)

(assert (=> d!10915 e!38310))

(declare-fun res!32486 () Bool)

(assert (=> d!10915 (=> (not res!32486) (not e!38310))))

(assert (=> d!10915 (= res!32486 (or (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))))

(declare-fun lt!23332 () ListLongMap!1349)

(assert (=> d!10915 (= lt!23338 lt!23332)))

(declare-fun lt!23330 () Unit!1484)

(assert (=> d!10915 (= lt!23330 e!38316)))

(declare-fun c!7310 () Bool)

(declare-fun e!38319 () Bool)

(assert (=> d!10915 (= c!7310 e!38319)))

(declare-fun res!32490 () Bool)

(assert (=> d!10915 (=> (not res!32490) (not e!38319))))

(assert (=> d!10915 (= res!32490 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10915 (= lt!23332 e!38315)))

(declare-fun c!7309 () Bool)

(assert (=> d!10915 (= c!7309 (and (not (= (bvand lt!22674 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!22674 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!10915 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10915 (= (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22674 (zeroValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) lt!23338)))

(declare-fun b!58207 () Bool)

(assert (=> b!58207 (= e!38310 e!38317)))

(declare-fun c!7311 () Bool)

(assert (=> b!58207 (= c!7311 (not (= (bvand lt!22674 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!4260 () Bool)

(declare-fun call!4262 () ListLongMap!1349)

(assert (=> bm!4260 (= call!4262 call!4268)))

(declare-fun bm!4261 () Bool)

(assert (=> bm!4261 (= call!4263 (contains!677 lt!23338 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58216 () Bool)

(assert (=> b!58216 (= e!38318 call!4262)))

(declare-fun bm!4262 () Bool)

(assert (=> bm!4262 (= call!4264 call!4265)))

(declare-fun b!58217 () Bool)

(declare-fun res!32485 () Bool)

(assert (=> b!58217 (=> (not res!32485) (not e!38310))))

(assert (=> b!58217 (= res!32485 e!38308)))

(declare-fun res!32483 () Bool)

(assert (=> b!58217 (=> res!32483 e!38308)))

(assert (=> b!58217 (= res!32483 (not e!38313))))

(declare-fun res!32487 () Bool)

(assert (=> b!58217 (=> (not res!32487) (not e!38313))))

(assert (=> b!58217 (= res!32487 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!58218 () Bool)

(declare-fun e!38312 () Bool)

(declare-fun e!38311 () Bool)

(assert (=> b!58218 (= e!38312 e!38311)))

(declare-fun res!32489 () Bool)

(declare-fun call!4266 () Bool)

(assert (=> b!58218 (= res!32489 call!4266)))

(assert (=> b!58218 (=> (not res!32489) (not e!38311))))

(declare-fun bm!4263 () Bool)

(assert (=> bm!4263 (= call!4268 (+!80 (ite c!7309 call!4267 (ite c!7307 call!4265 call!4264)) (ite (or c!7309 c!7307) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!58219 () Bool)

(assert (=> b!58219 (= e!38307 (= (apply!65 lt!23338 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (get!1065 (select (arr!1763 (_values!2004 newMap!16)) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!58219 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1993 (_values!2004 newMap!16))))))

(assert (=> b!58219 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!58220 () Bool)

(assert (=> b!58220 (= e!38311 (= (apply!65 lt!23338 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1939 newMap!16)))))

(declare-fun b!58221 () Bool)

(declare-fun res!32484 () Bool)

(assert (=> b!58221 (=> (not res!32484) (not e!38310))))

(assert (=> b!58221 (= res!32484 e!38312)))

(declare-fun c!7306 () Bool)

(assert (=> b!58221 (= c!7306 (not (= (bvand lt!22674 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!58222 () Bool)

(assert (=> b!58222 (= e!38309 call!4262)))

(declare-fun b!58223 () Bool)

(assert (=> b!58223 (= e!38312 (not call!4266))))

(declare-fun b!58224 () Bool)

(assert (=> b!58224 (= e!38317 (not call!4263))))

(declare-fun b!58225 () Bool)

(declare-fun lt!23322 () Unit!1484)

(assert (=> b!58225 (= e!38316 lt!23322)))

(declare-fun lt!23328 () ListLongMap!1349)

(assert (=> b!58225 (= lt!23328 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22674 (zeroValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23323 () (_ BitVec 64))

(assert (=> b!58225 (= lt!23323 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23321 () (_ BitVec 64))

(assert (=> b!58225 (= lt!23321 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!23325 () Unit!1484)

(assert (=> b!58225 (= lt!23325 (addStillContains!41 lt!23328 lt!23323 (zeroValue!1939 newMap!16) lt!23321))))

(assert (=> b!58225 (contains!677 (+!80 lt!23328 (tuple2!2025 lt!23323 (zeroValue!1939 newMap!16))) lt!23321)))

(declare-fun lt!23335 () Unit!1484)

(assert (=> b!58225 (= lt!23335 lt!23325)))

(declare-fun lt!23319 () ListLongMap!1349)

(assert (=> b!58225 (= lt!23319 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22674 (zeroValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23320 () (_ BitVec 64))

(assert (=> b!58225 (= lt!23320 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23317 () (_ BitVec 64))

(assert (=> b!58225 (= lt!23317 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!23333 () Unit!1484)

(assert (=> b!58225 (= lt!23333 (addApplyDifferent!41 lt!23319 lt!23320 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!23317))))

(assert (=> b!58225 (= (apply!65 (+!80 lt!23319 (tuple2!2025 lt!23320 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!23317) (apply!65 lt!23319 lt!23317))))

(declare-fun lt!23318 () Unit!1484)

(assert (=> b!58225 (= lt!23318 lt!23333)))

(declare-fun lt!23324 () ListLongMap!1349)

(assert (=> b!58225 (= lt!23324 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22674 (zeroValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23331 () (_ BitVec 64))

(assert (=> b!58225 (= lt!23331 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23336 () (_ BitVec 64))

(assert (=> b!58225 (= lt!23336 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!23327 () Unit!1484)

(assert (=> b!58225 (= lt!23327 (addApplyDifferent!41 lt!23324 lt!23331 (zeroValue!1939 newMap!16) lt!23336))))

(assert (=> b!58225 (= (apply!65 (+!80 lt!23324 (tuple2!2025 lt!23331 (zeroValue!1939 newMap!16))) lt!23336) (apply!65 lt!23324 lt!23336))))

(declare-fun lt!23329 () Unit!1484)

(assert (=> b!58225 (= lt!23329 lt!23327)))

(declare-fun lt!23326 () ListLongMap!1349)

(assert (=> b!58225 (= lt!23326 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22674 (zeroValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23337 () (_ BitVec 64))

(assert (=> b!58225 (= lt!23337 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23334 () (_ BitVec 64))

(assert (=> b!58225 (= lt!23334 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!58225 (= lt!23322 (addApplyDifferent!41 lt!23326 lt!23337 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!23334))))

(assert (=> b!58225 (= (apply!65 (+!80 lt!23326 (tuple2!2025 lt!23337 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!23334) (apply!65 lt!23326 lt!23334))))

(declare-fun bm!4264 () Bool)

(assert (=> bm!4264 (= call!4266 (contains!677 lt!23338 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58226 () Bool)

(assert (=> b!58226 (= e!38319 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!4265 () Bool)

(assert (=> bm!4265 (= call!4267 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22674 (zeroValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun b!58227 () Bool)

(assert (=> b!58227 (= e!38314 (= (apply!65 lt!23338 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!10915 c!7309) b!58215))

(assert (= (and d!10915 (not c!7309)) b!58211))

(assert (= (and b!58211 c!7307) b!58216))

(assert (= (and b!58211 (not c!7307)) b!58212))

(assert (= (and b!58212 c!7308) b!58222))

(assert (= (and b!58212 (not c!7308)) b!58208))

(assert (= (or b!58222 b!58208) bm!4262))

(assert (= (or b!58216 bm!4262) bm!4259))

(assert (= (or b!58216 b!58222) bm!4260))

(assert (= (or b!58215 bm!4259) bm!4265))

(assert (= (or b!58215 bm!4260) bm!4263))

(assert (= (and d!10915 res!32490) b!58226))

(assert (= (and d!10915 c!7310) b!58225))

(assert (= (and d!10915 (not c!7310)) b!58214))

(assert (= (and d!10915 res!32486) b!58217))

(assert (= (and b!58217 res!32487) b!58209))

(assert (= (and b!58217 (not res!32483)) b!58213))

(assert (= (and b!58213 res!32488) b!58219))

(assert (= (and b!58217 res!32485) b!58221))

(assert (= (and b!58221 c!7306) b!58218))

(assert (= (and b!58221 (not c!7306)) b!58223))

(assert (= (and b!58218 res!32489) b!58220))

(assert (= (or b!58218 b!58223) bm!4264))

(assert (= (and b!58221 res!32484) b!58207))

(assert (= (and b!58207 c!7311) b!58210))

(assert (= (and b!58207 (not c!7311)) b!58224))

(assert (= (and b!58210 res!32482) b!58227))

(assert (= (or b!58210 b!58224) bm!4261))

(declare-fun b_lambda!2545 () Bool)

(assert (=> (not b_lambda!2545) (not b!58219)))

(assert (=> b!58219 t!4758))

(declare-fun b_and!3525 () Bool)

(assert (= b_and!3521 (and (=> t!4758 result!2353) b_and!3525)))

(assert (=> b!58219 t!4760))

(declare-fun b_and!3527 () Bool)

(assert (= b_and!3523 (and (=> t!4760 result!2355) b_and!3527)))

(assert (=> b!58219 m!48411))

(assert (=> b!58219 m!48353))

(assert (=> b!58219 m!48413))

(assert (=> b!58219 m!48411))

(assert (=> b!58219 m!48317))

(declare-fun m!49525 () Bool)

(assert (=> b!58219 m!49525))

(assert (=> b!58219 m!48317))

(assert (=> b!58219 m!48353))

(declare-fun m!49527 () Bool)

(assert (=> b!58215 m!49527))

(declare-fun m!49529 () Bool)

(assert (=> bm!4263 m!49529))

(assert (=> b!58213 m!48317))

(assert (=> b!58213 m!48317))

(declare-fun m!49531 () Bool)

(assert (=> b!58213 m!49531))

(declare-fun m!49533 () Bool)

(assert (=> b!58227 m!49533))

(declare-fun m!49535 () Bool)

(assert (=> bm!4261 m!49535))

(declare-fun m!49537 () Bool)

(assert (=> bm!4264 m!49537))

(assert (=> b!58225 m!48317))

(assert (=> b!58225 m!47939))

(declare-fun m!49539 () Bool)

(assert (=> b!58225 m!49539))

(assert (=> b!58225 m!47939))

(declare-fun m!49541 () Bool)

(assert (=> b!58225 m!49541))

(declare-fun m!49543 () Bool)

(assert (=> b!58225 m!49543))

(declare-fun m!49545 () Bool)

(assert (=> b!58225 m!49545))

(declare-fun m!49547 () Bool)

(assert (=> b!58225 m!49547))

(declare-fun m!49549 () Bool)

(assert (=> b!58225 m!49549))

(declare-fun m!49551 () Bool)

(assert (=> b!58225 m!49551))

(declare-fun m!49553 () Bool)

(assert (=> b!58225 m!49553))

(declare-fun m!49555 () Bool)

(assert (=> b!58225 m!49555))

(assert (=> b!58225 m!49547))

(declare-fun m!49557 () Bool)

(assert (=> b!58225 m!49557))

(assert (=> b!58225 m!49551))

(declare-fun m!49559 () Bool)

(assert (=> b!58225 m!49559))

(declare-fun m!49561 () Bool)

(assert (=> b!58225 m!49561))

(declare-fun m!49563 () Bool)

(assert (=> b!58225 m!49563))

(declare-fun m!49565 () Bool)

(assert (=> b!58225 m!49565))

(assert (=> b!58225 m!47939))

(declare-fun m!49567 () Bool)

(assert (=> b!58225 m!49567))

(assert (=> b!58225 m!49553))

(assert (=> b!58225 m!49561))

(declare-fun m!49569 () Bool)

(assert (=> b!58225 m!49569))

(declare-fun m!49571 () Bool)

(assert (=> b!58220 m!49571))

(assert (=> bm!4265 m!47939))

(assert (=> bm!4265 m!49567))

(assert (=> d!10915 m!48335))

(assert (=> b!58209 m!48317))

(assert (=> b!58209 m!48317))

(assert (=> b!58209 m!48321))

(assert (=> b!58226 m!48317))

(assert (=> b!58226 m!48317))

(assert (=> b!58226 m!48321))

(assert (=> d!10601 d!10915))

(assert (=> d!10601 d!10595))

(assert (=> d!10601 d!10747))

(declare-fun d!10917 () Bool)

(assert (=> d!10917 (= (+!80 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22674 (zeroValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(assert (=> d!10917 true))

(declare-fun _$8!43 () Unit!1484)

(assert (=> d!10917 (= (choose!299 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) lt!22674 (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2021 newMap!16)) _$8!43)))

(declare-fun bs!2517 () Bool)

(assert (= bs!2517 d!10917))

(assert (=> bs!2517 m!48101))

(assert (=> bs!2517 m!48101))

(assert (=> bs!2517 m!48467))

(assert (=> bs!2517 m!47939))

(assert (=> bs!2517 m!48463))

(assert (=> d!10601 d!10917))

(declare-fun d!10919 () Bool)

(declare-fun e!38320 () Bool)

(assert (=> d!10919 e!38320))

(declare-fun res!32491 () Bool)

(assert (=> d!10919 (=> res!32491 e!38320)))

(declare-fun lt!23339 () Bool)

(assert (=> d!10919 (= res!32491 (not lt!23339))))

(declare-fun lt!23342 () Bool)

(assert (=> d!10919 (= lt!23339 lt!23342)))

(declare-fun lt!23341 () Unit!1484)

(declare-fun e!38321 () Unit!1484)

(assert (=> d!10919 (= lt!23341 e!38321)))

(declare-fun c!7312 () Bool)

(assert (=> d!10919 (= c!7312 lt!23342)))

(assert (=> d!10919 (= lt!23342 (containsKey!125 (toList!690 lt!23070) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10919 (= (contains!677 lt!23070 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) lt!23339)))

(declare-fun b!58228 () Bool)

(declare-fun lt!23340 () Unit!1484)

(assert (=> b!58228 (= e!38321 lt!23340)))

(assert (=> b!58228 (= lt!23340 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!23070) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!58228 (isDefined!75 (getValueByKey!121 (toList!690 lt!23070) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!58229 () Bool)

(declare-fun Unit!1527 () Unit!1484)

(assert (=> b!58229 (= e!38321 Unit!1527)))

(declare-fun b!58230 () Bool)

(assert (=> b!58230 (= e!38320 (isDefined!75 (getValueByKey!121 (toList!690 lt!23070) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!10919 c!7312) b!58228))

(assert (= (and d!10919 (not c!7312)) b!58229))

(assert (= (and d!10919 (not res!32491)) b!58230))

(assert (=> d!10919 m!48317))

(declare-fun m!49573 () Bool)

(assert (=> d!10919 m!49573))

(assert (=> b!58228 m!48317))

(declare-fun m!49575 () Bool)

(assert (=> b!58228 m!49575))

(assert (=> b!58228 m!48317))

(declare-fun m!49577 () Bool)

(assert (=> b!58228 m!49577))

(assert (=> b!58228 m!49577))

(declare-fun m!49579 () Bool)

(assert (=> b!58228 m!49579))

(assert (=> b!58230 m!48317))

(assert (=> b!58230 m!49577))

(assert (=> b!58230 m!49577))

(assert (=> b!58230 m!49579))

(assert (=> b!57723 d!10919))

(declare-fun d!10921 () Bool)

(declare-fun e!38322 () Bool)

(assert (=> d!10921 e!38322))

(declare-fun res!32492 () Bool)

(assert (=> d!10921 (=> res!32492 e!38322)))

(declare-fun lt!23343 () Bool)

(assert (=> d!10921 (= res!32492 (not lt!23343))))

(declare-fun lt!23346 () Bool)

(assert (=> d!10921 (= lt!23343 lt!23346)))

(declare-fun lt!23345 () Unit!1484)

(declare-fun e!38323 () Unit!1484)

(assert (=> d!10921 (= lt!23345 e!38323)))

(declare-fun c!7313 () Bool)

(assert (=> d!10921 (= c!7313 lt!23346)))

(assert (=> d!10921 (= lt!23346 (containsKey!125 (toList!690 (getCurrentListMap!387 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666))))))

(assert (=> d!10921 (= (contains!677 (getCurrentListMap!387 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666))) lt!23343)))

(declare-fun b!58231 () Bool)

(declare-fun lt!23344 () Unit!1484)

(assert (=> b!58231 (= e!38323 lt!23344)))

(assert (=> b!58231 (= lt!23344 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 (getCurrentListMap!387 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666))))))

(assert (=> b!58231 (isDefined!75 (getValueByKey!121 (toList!690 (getCurrentListMap!387 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666))))))

(declare-fun b!58232 () Bool)

(declare-fun Unit!1528 () Unit!1484)

(assert (=> b!58232 (= e!38323 Unit!1528)))

(declare-fun b!58233 () Bool)

(assert (=> b!58233 (= e!38322 (isDefined!75 (getValueByKey!121 (toList!690 (getCurrentListMap!387 (_keys!3640 newMap!16) lt!22683 (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!22666)))))))

(assert (= (and d!10921 c!7313) b!58231))

(assert (= (and d!10921 (not c!7313)) b!58232))

(assert (= (and d!10921 (not res!32492)) b!58233))

(assert (=> d!10921 m!48095))

(declare-fun m!49581 () Bool)

(assert (=> d!10921 m!49581))

(assert (=> b!58231 m!48095))

(declare-fun m!49583 () Bool)

(assert (=> b!58231 m!49583))

(assert (=> b!58231 m!48095))

(declare-fun m!49585 () Bool)

(assert (=> b!58231 m!49585))

(assert (=> b!58231 m!49585))

(declare-fun m!49587 () Bool)

(assert (=> b!58231 m!49587))

(assert (=> b!58233 m!48095))

(assert (=> b!58233 m!49585))

(assert (=> b!58233 m!49585))

(assert (=> b!58233 m!49587))

(assert (=> b!57639 d!10921))

(assert (=> b!57639 d!10665))

(declare-fun b!58234 () Bool)

(declare-fun e!38324 () Bool)

(declare-fun call!4269 () Bool)

(assert (=> b!58234 (= e!38324 call!4269)))

(declare-fun b!58235 () Bool)

(declare-fun e!38326 () Bool)

(assert (=> b!58235 (= e!38326 e!38324)))

(declare-fun c!7314 () Bool)

(assert (=> b!58235 (= c!7314 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!58236 () Bool)

(declare-fun e!38325 () Bool)

(assert (=> b!58236 (= e!38325 call!4269)))

(declare-fun b!58237 () Bool)

(assert (=> b!58237 (= e!38324 e!38325)))

(declare-fun lt!23349 () (_ BitVec 64))

(assert (=> b!58237 (= lt!23349 (select (arr!1762 (_keys!3640 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!23348 () Unit!1484)

(assert (=> b!58237 (= lt!23348 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3640 newMap!16) lt!23349 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!58237 (arrayContainsKey!0 (_keys!3640 newMap!16) lt!23349 #b00000000000000000000000000000000)))

(declare-fun lt!23347 () Unit!1484)

(assert (=> b!58237 (= lt!23347 lt!23348)))

(declare-fun res!32493 () Bool)

(assert (=> b!58237 (= res!32493 (= (seekEntryOrOpen!0 (select (arr!1762 (_keys!3640 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3640 newMap!16) (mask!5894 newMap!16)) (Found!229 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!58237 (=> (not res!32493) (not e!38325))))

(declare-fun d!10923 () Bool)

(declare-fun res!32494 () Bool)

(assert (=> d!10923 (=> res!32494 e!38326)))

(assert (=> d!10923 (= res!32494 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10923 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3640 newMap!16) (mask!5894 newMap!16)) e!38326)))

(declare-fun bm!4266 () Bool)

(assert (=> bm!4266 (= call!4269 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(assert (= (and d!10923 (not res!32494)) b!58235))

(assert (= (and b!58235 c!7314) b!58237))

(assert (= (and b!58235 (not c!7314)) b!58234))

(assert (= (and b!58237 res!32493) b!58236))

(assert (= (or b!58236 b!58234) bm!4266))

(declare-fun m!49589 () Bool)

(assert (=> b!58235 m!49589))

(assert (=> b!58235 m!49589))

(declare-fun m!49591 () Bool)

(assert (=> b!58235 m!49591))

(assert (=> b!58237 m!49589))

(declare-fun m!49593 () Bool)

(assert (=> b!58237 m!49593))

(declare-fun m!49595 () Bool)

(assert (=> b!58237 m!49595))

(assert (=> b!58237 m!49589))

(declare-fun m!49597 () Bool)

(assert (=> b!58237 m!49597))

(declare-fun m!49599 () Bool)

(assert (=> bm!4266 m!49599))

(assert (=> bm!4186 d!10923))

(assert (=> b!57529 d!10683))

(declare-fun d!10925 () Bool)

(assert (=> d!10925 (= (isDefined!75 (getValueByKey!121 (toList!690 call!4127) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))) (not (isEmpty!295 (getValueByKey!121 (toList!690 call!4127) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))))

(declare-fun bs!2518 () Bool)

(assert (= bs!2518 d!10925))

(assert (=> bs!2518 m!48539))

(declare-fun m!49601 () Bool)

(assert (=> bs!2518 m!49601))

(assert (=> b!57614 d!10925))

(declare-fun b!58239 () Bool)

(declare-fun e!38327 () Option!127)

(declare-fun e!38328 () Option!127)

(assert (=> b!58239 (= e!38327 e!38328)))

(declare-fun c!7316 () Bool)

(assert (=> b!58239 (= c!7316 (and ((_ is Cons!1427) (toList!690 call!4127)) (not (= (_1!1023 (h!2007 (toList!690 call!4127))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))))

(declare-fun b!58241 () Bool)

(assert (=> b!58241 (= e!38328 None!125)))

(declare-fun b!58240 () Bool)

(assert (=> b!58240 (= e!38328 (getValueByKey!121 (t!4744 (toList!690 call!4127)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!58238 () Bool)

(assert (=> b!58238 (= e!38327 (Some!126 (_2!1023 (h!2007 (toList!690 call!4127)))))))

(declare-fun c!7315 () Bool)

(declare-fun d!10927 () Bool)

(assert (=> d!10927 (= c!7315 (and ((_ is Cons!1427) (toList!690 call!4127)) (= (_1!1023 (h!2007 (toList!690 call!4127))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (=> d!10927 (= (getValueByKey!121 (toList!690 call!4127) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) e!38327)))

(assert (= (and d!10927 c!7315) b!58238))

(assert (= (and d!10927 (not c!7315)) b!58239))

(assert (= (and b!58239 c!7316) b!58240))

(assert (= (and b!58239 (not c!7316)) b!58241))

(assert (=> b!58240 m!47913))

(declare-fun m!49603 () Bool)

(assert (=> b!58240 m!49603))

(assert (=> b!57614 d!10927))

(declare-fun d!10929 () Bool)

(declare-fun e!38329 () Bool)

(assert (=> d!10929 e!38329))

(declare-fun res!32495 () Bool)

(assert (=> d!10929 (=> res!32495 e!38329)))

(declare-fun lt!23350 () Bool)

(assert (=> d!10929 (= res!32495 (not lt!23350))))

(declare-fun lt!23353 () Bool)

(assert (=> d!10929 (= lt!23350 lt!23353)))

(declare-fun lt!23352 () Unit!1484)

(declare-fun e!38330 () Unit!1484)

(assert (=> d!10929 (= lt!23352 e!38330)))

(declare-fun c!7317 () Bool)

(assert (=> d!10929 (= c!7317 lt!23353)))

(assert (=> d!10929 (= lt!23353 (containsKey!125 (toList!690 lt!23070) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10929 (= (contains!677 lt!23070 #b1000000000000000000000000000000000000000000000000000000000000000) lt!23350)))

(declare-fun b!58242 () Bool)

(declare-fun lt!23351 () Unit!1484)

(assert (=> b!58242 (= e!38330 lt!23351)))

(assert (=> b!58242 (= lt!23351 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!23070) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!58242 (isDefined!75 (getValueByKey!121 (toList!690 lt!23070) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58243 () Bool)

(declare-fun Unit!1529 () Unit!1484)

(assert (=> b!58243 (= e!38330 Unit!1529)))

(declare-fun b!58244 () Bool)

(assert (=> b!58244 (= e!38329 (isDefined!75 (getValueByKey!121 (toList!690 lt!23070) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10929 c!7317) b!58242))

(assert (= (and d!10929 (not c!7317)) b!58243))

(assert (= (and d!10929 (not res!32495)) b!58244))

(declare-fun m!49605 () Bool)

(assert (=> d!10929 m!49605))

(declare-fun m!49607 () Bool)

(assert (=> b!58242 m!49607))

(assert (=> b!58242 m!48983))

(assert (=> b!58242 m!48983))

(declare-fun m!49609 () Bool)

(assert (=> b!58242 m!49609))

(assert (=> b!58244 m!48983))

(assert (=> b!58244 m!48983))

(assert (=> b!58244 m!49609))

(assert (=> bm!4204 d!10929))

(assert (=> bm!4161 d!10685))

(declare-fun d!10931 () Bool)

(assert (=> d!10931 (contains!677 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))

(declare-fun lt!23356 () Unit!1484)

(declare-fun choose!306 (array!3683 array!3685 (_ BitVec 32) (_ BitVec 32) V!2833 V!2833 (_ BitVec 64) (_ BitVec 32) Int) Unit!1484)

(assert (=> d!10931 (= lt!23356 (choose!306 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(assert (=> d!10931 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10931 (= (lemmaArrayContainsKeyThenInListMap!4 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) lt!23356)))

(declare-fun bs!2519 () Bool)

(assert (= bs!2519 d!10931))

(assert (=> bs!2519 m!48101))

(assert (=> bs!2519 m!48101))

(assert (=> bs!2519 m!47913))

(assert (=> bs!2519 m!48653))

(assert (=> bs!2519 m!47913))

(declare-fun m!49611 () Bool)

(assert (=> bs!2519 m!49611))

(assert (=> bs!2519 m!48335))

(assert (=> b!57695 d!10931))

(assert (=> b!57695 d!10773))

(assert (=> b!57695 d!10595))

(declare-fun d!10933 () Bool)

(assert (=> d!10933 (= (apply!65 lt!22879 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (get!1070 (getValueByKey!121 (toList!690 lt!22879) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!2520 () Bool)

(assert (= bs!2520 d!10933))

(assert (=> bs!2520 m!48317))

(declare-fun m!49613 () Bool)

(assert (=> bs!2520 m!49613))

(assert (=> bs!2520 m!49613))

(declare-fun m!49615 () Bool)

(assert (=> bs!2520 m!49615))

(assert (=> b!57545 d!10933))

(declare-fun d!10935 () Bool)

(declare-fun c!7318 () Bool)

(assert (=> d!10935 (= c!7318 ((_ is ValueCellFull!851) (select (arr!1763 (_values!2004 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!38331 () V!2833)

(assert (=> d!10935 (= (get!1065 (select (arr!1763 (_values!2004 newMap!16)) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!38331)))

(declare-fun b!58245 () Bool)

(assert (=> b!58245 (= e!38331 (get!1068 (select (arr!1763 (_values!2004 newMap!16)) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!58246 () Bool)

(assert (=> b!58246 (= e!38331 (get!1069 (select (arr!1763 (_values!2004 newMap!16)) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10935 c!7318) b!58245))

(assert (= (and d!10935 (not c!7318)) b!58246))

(assert (=> b!58245 m!48411))

(assert (=> b!58245 m!48353))

(declare-fun m!49617 () Bool)

(assert (=> b!58245 m!49617))

(assert (=> b!58246 m!48411))

(assert (=> b!58246 m!48353))

(declare-fun m!49619 () Bool)

(assert (=> b!58246 m!49619))

(assert (=> b!57545 d!10935))

(assert (=> b!57431 d!10657))

(declare-fun d!10937 () Bool)

(declare-fun e!38332 () Bool)

(assert (=> d!10937 e!38332))

(declare-fun res!32496 () Bool)

(assert (=> d!10937 (=> res!32496 e!38332)))

(declare-fun lt!23357 () Bool)

(assert (=> d!10937 (= res!32496 (not lt!23357))))

(declare-fun lt!23360 () Bool)

(assert (=> d!10937 (= lt!23357 lt!23360)))

(declare-fun lt!23359 () Unit!1484)

(declare-fun e!38333 () Unit!1484)

(assert (=> d!10937 (= lt!23359 e!38333)))

(declare-fun c!7319 () Bool)

(assert (=> d!10937 (= c!7319 lt!23360)))

(assert (=> d!10937 (= lt!23360 (containsKey!125 (toList!690 (+!80 lt!22787 (tuple2!2025 lt!22793 lt!22789))) lt!22792))))

(assert (=> d!10937 (= (contains!677 (+!80 lt!22787 (tuple2!2025 lt!22793 lt!22789)) lt!22792) lt!23357)))

(declare-fun b!58247 () Bool)

(declare-fun lt!23358 () Unit!1484)

(assert (=> b!58247 (= e!38333 lt!23358)))

(assert (=> b!58247 (= lt!23358 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 (+!80 lt!22787 (tuple2!2025 lt!22793 lt!22789))) lt!22792))))

(assert (=> b!58247 (isDefined!75 (getValueByKey!121 (toList!690 (+!80 lt!22787 (tuple2!2025 lt!22793 lt!22789))) lt!22792))))

(declare-fun b!58248 () Bool)

(declare-fun Unit!1530 () Unit!1484)

(assert (=> b!58248 (= e!38333 Unit!1530)))

(declare-fun b!58249 () Bool)

(assert (=> b!58249 (= e!38332 (isDefined!75 (getValueByKey!121 (toList!690 (+!80 lt!22787 (tuple2!2025 lt!22793 lt!22789))) lt!22792)))))

(assert (= (and d!10937 c!7319) b!58247))

(assert (= (and d!10937 (not c!7319)) b!58248))

(assert (= (and d!10937 (not res!32496)) b!58249))

(declare-fun m!49621 () Bool)

(assert (=> d!10937 m!49621))

(declare-fun m!49623 () Bool)

(assert (=> b!58247 m!49623))

(declare-fun m!49625 () Bool)

(assert (=> b!58247 m!49625))

(assert (=> b!58247 m!49625))

(declare-fun m!49627 () Bool)

(assert (=> b!58247 m!49627))

(assert (=> b!58249 m!49625))

(assert (=> b!58249 m!49625))

(assert (=> b!58249 m!49627))

(assert (=> b!57431 d!10937))

(declare-fun d!10939 () Bool)

(declare-fun e!38334 () Bool)

(assert (=> d!10939 e!38334))

(declare-fun res!32498 () Bool)

(assert (=> d!10939 (=> (not res!32498) (not e!38334))))

(declare-fun lt!23363 () ListLongMap!1349)

(assert (=> d!10939 (= res!32498 (contains!677 lt!23363 (_1!1023 (tuple2!2025 lt!22793 lt!22789))))))

(declare-fun lt!23364 () List!1431)

(assert (=> d!10939 (= lt!23363 (ListLongMap!1350 lt!23364))))

(declare-fun lt!23361 () Unit!1484)

(declare-fun lt!23362 () Unit!1484)

(assert (=> d!10939 (= lt!23361 lt!23362)))

(assert (=> d!10939 (= (getValueByKey!121 lt!23364 (_1!1023 (tuple2!2025 lt!22793 lt!22789))) (Some!126 (_2!1023 (tuple2!2025 lt!22793 lt!22789))))))

(assert (=> d!10939 (= lt!23362 (lemmaContainsTupThenGetReturnValue!41 lt!23364 (_1!1023 (tuple2!2025 lt!22793 lt!22789)) (_2!1023 (tuple2!2025 lt!22793 lt!22789))))))

(assert (=> d!10939 (= lt!23364 (insertStrictlySorted!44 (toList!690 lt!22787) (_1!1023 (tuple2!2025 lt!22793 lt!22789)) (_2!1023 (tuple2!2025 lt!22793 lt!22789))))))

(assert (=> d!10939 (= (+!80 lt!22787 (tuple2!2025 lt!22793 lt!22789)) lt!23363)))

(declare-fun b!58250 () Bool)

(declare-fun res!32497 () Bool)

(assert (=> b!58250 (=> (not res!32497) (not e!38334))))

(assert (=> b!58250 (= res!32497 (= (getValueByKey!121 (toList!690 lt!23363) (_1!1023 (tuple2!2025 lt!22793 lt!22789))) (Some!126 (_2!1023 (tuple2!2025 lt!22793 lt!22789)))))))

(declare-fun b!58251 () Bool)

(assert (=> b!58251 (= e!38334 (contains!681 (toList!690 lt!23363) (tuple2!2025 lt!22793 lt!22789)))))

(assert (= (and d!10939 res!32498) b!58250))

(assert (= (and b!58250 res!32497) b!58251))

(declare-fun m!49629 () Bool)

(assert (=> d!10939 m!49629))

(declare-fun m!49631 () Bool)

(assert (=> d!10939 m!49631))

(declare-fun m!49633 () Bool)

(assert (=> d!10939 m!49633))

(declare-fun m!49635 () Bool)

(assert (=> d!10939 m!49635))

(declare-fun m!49637 () Bool)

(assert (=> b!58250 m!49637))

(declare-fun m!49639 () Bool)

(assert (=> b!58251 m!49639))

(assert (=> b!57431 d!10939))

(declare-fun d!10941 () Bool)

(assert (=> d!10941 (not (contains!677 (+!80 lt!22787 (tuple2!2025 lt!22793 lt!22789)) lt!22792))))

(declare-fun lt!23367 () Unit!1484)

(declare-fun choose!307 (ListLongMap!1349 (_ BitVec 64) V!2833 (_ BitVec 64)) Unit!1484)

(assert (=> d!10941 (= lt!23367 (choose!307 lt!22787 lt!22793 lt!22789 lt!22792))))

(declare-fun e!38337 () Bool)

(assert (=> d!10941 e!38337))

(declare-fun res!32501 () Bool)

(assert (=> d!10941 (=> (not res!32501) (not e!38337))))

(assert (=> d!10941 (= res!32501 (not (contains!677 lt!22787 lt!22792)))))

(assert (=> d!10941 (= (addStillNotContains!15 lt!22787 lt!22793 lt!22789 lt!22792) lt!23367)))

(declare-fun b!58255 () Bool)

(assert (=> b!58255 (= e!38337 (not (= lt!22793 lt!22792)))))

(assert (= (and d!10941 res!32501) b!58255))

(assert (=> d!10941 m!48209))

(assert (=> d!10941 m!48209))

(assert (=> d!10941 m!48211))

(declare-fun m!49641 () Bool)

(assert (=> d!10941 m!49641))

(declare-fun m!49643 () Bool)

(assert (=> d!10941 m!49643))

(assert (=> b!57431 d!10941))

(declare-fun d!10943 () Bool)

(declare-fun e!38338 () Bool)

(assert (=> d!10943 e!38338))

(declare-fun res!32503 () Bool)

(assert (=> d!10943 (=> (not res!32503) (not e!38338))))

(declare-fun lt!23370 () ListLongMap!1349)

(assert (=> d!10943 (= res!32503 (contains!677 lt!23370 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!23371 () List!1431)

(assert (=> d!10943 (= lt!23370 (ListLongMap!1350 lt!23371))))

(declare-fun lt!23368 () Unit!1484)

(declare-fun lt!23369 () Unit!1484)

(assert (=> d!10943 (= lt!23368 lt!23369)))

(assert (=> d!10943 (= (getValueByKey!121 lt!23371 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!126 (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10943 (= lt!23369 (lemmaContainsTupThenGetReturnValue!41 lt!23371 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10943 (= lt!23371 (insertStrictlySorted!44 (toList!690 call!4164) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10943 (= (+!80 call!4164 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!23370)))

(declare-fun b!58256 () Bool)

(declare-fun res!32502 () Bool)

(assert (=> b!58256 (=> (not res!32502) (not e!38338))))

(assert (=> b!58256 (= res!32502 (= (getValueByKey!121 (toList!690 lt!23370) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!126 (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!58257 () Bool)

(assert (=> b!58257 (= e!38338 (contains!681 (toList!690 lt!23370) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!10943 res!32503) b!58256))

(assert (= (and b!58256 res!32502) b!58257))

(declare-fun m!49645 () Bool)

(assert (=> d!10943 m!49645))

(declare-fun m!49647 () Bool)

(assert (=> d!10943 m!49647))

(declare-fun m!49649 () Bool)

(assert (=> d!10943 m!49649))

(declare-fun m!49651 () Bool)

(assert (=> d!10943 m!49651))

(declare-fun m!49653 () Bool)

(assert (=> b!58256 m!49653))

(declare-fun m!49655 () Bool)

(assert (=> b!58257 m!49655))

(assert (=> b!57431 d!10943))

(declare-fun d!10945 () Bool)

(assert (=> d!10945 (= (apply!65 (+!80 lt!22867 (tuple2!2025 lt!22878 (minValue!1939 newMap!16))) lt!22875) (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!22867 (tuple2!2025 lt!22878 (minValue!1939 newMap!16)))) lt!22875)))))

(declare-fun bs!2521 () Bool)

(assert (= bs!2521 d!10945))

(declare-fun m!49657 () Bool)

(assert (=> bs!2521 m!49657))

(assert (=> bs!2521 m!49657))

(declare-fun m!49659 () Bool)

(assert (=> bs!2521 m!49659))

(assert (=> b!57551 d!10945))

(declare-fun d!10947 () Bool)

(assert (=> d!10947 (contains!677 (+!80 lt!22869 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16))) lt!22862)))

(declare-fun lt!23372 () Unit!1484)

(assert (=> d!10947 (= lt!23372 (choose!295 lt!22869 lt!22864 (zeroValue!1939 newMap!16) lt!22862))))

(assert (=> d!10947 (contains!677 lt!22869 lt!22862)))

(assert (=> d!10947 (= (addStillContains!41 lt!22869 lt!22864 (zeroValue!1939 newMap!16) lt!22862) lt!23372)))

(declare-fun bs!2522 () Bool)

(assert (= bs!2522 d!10947))

(assert (=> bs!2522 m!48437))

(assert (=> bs!2522 m!48437))

(assert (=> bs!2522 m!48447))

(declare-fun m!49661 () Bool)

(assert (=> bs!2522 m!49661))

(declare-fun m!49663 () Bool)

(assert (=> bs!2522 m!49663))

(assert (=> b!57551 d!10947))

(declare-fun d!10949 () Bool)

(assert (=> d!10949 (= (apply!65 (+!80 lt!22865 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16))) lt!22877) (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!22865 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16)))) lt!22877)))))

(declare-fun bs!2523 () Bool)

(assert (= bs!2523 d!10949))

(declare-fun m!49665 () Bool)

(assert (=> bs!2523 m!49665))

(assert (=> bs!2523 m!49665))

(declare-fun m!49667 () Bool)

(assert (=> bs!2523 m!49667))

(assert (=> b!57551 d!10949))

(declare-fun d!10951 () Bool)

(assert (=> d!10951 (= (apply!65 (+!80 lt!22867 (tuple2!2025 lt!22878 (minValue!1939 newMap!16))) lt!22875) (apply!65 lt!22867 lt!22875))))

(declare-fun lt!23373 () Unit!1484)

(assert (=> d!10951 (= lt!23373 (choose!296 lt!22867 lt!22878 (minValue!1939 newMap!16) lt!22875))))

(declare-fun e!38339 () Bool)

(assert (=> d!10951 e!38339))

(declare-fun res!32504 () Bool)

(assert (=> d!10951 (=> (not res!32504) (not e!38339))))

(assert (=> d!10951 (= res!32504 (contains!677 lt!22867 lt!22875))))

(assert (=> d!10951 (= (addApplyDifferent!41 lt!22867 lt!22878 (minValue!1939 newMap!16) lt!22875) lt!23373)))

(declare-fun b!58258 () Bool)

(assert (=> b!58258 (= e!38339 (not (= lt!22875 lt!22878)))))

(assert (= (and d!10951 res!32504) b!58258))

(assert (=> d!10951 m!48441))

(assert (=> d!10951 m!48449))

(assert (=> d!10951 m!48433))

(declare-fun m!49669 () Bool)

(assert (=> d!10951 m!49669))

(declare-fun m!49671 () Bool)

(assert (=> d!10951 m!49671))

(assert (=> d!10951 m!48441))

(assert (=> b!57551 d!10951))

(declare-fun d!10953 () Bool)

(declare-fun e!38340 () Bool)

(assert (=> d!10953 e!38340))

(declare-fun res!32506 () Bool)

(assert (=> d!10953 (=> (not res!32506) (not e!38340))))

(declare-fun lt!23376 () ListLongMap!1349)

(assert (=> d!10953 (= res!32506 (contains!677 lt!23376 (_1!1023 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16)))))))

(declare-fun lt!23377 () List!1431)

(assert (=> d!10953 (= lt!23376 (ListLongMap!1350 lt!23377))))

(declare-fun lt!23374 () Unit!1484)

(declare-fun lt!23375 () Unit!1484)

(assert (=> d!10953 (= lt!23374 lt!23375)))

(assert (=> d!10953 (= (getValueByKey!121 lt!23377 (_1!1023 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16)))))))

(assert (=> d!10953 (= lt!23375 (lemmaContainsTupThenGetReturnValue!41 lt!23377 (_1!1023 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16)))))))

(assert (=> d!10953 (= lt!23377 (insertStrictlySorted!44 (toList!690 lt!22869) (_1!1023 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16)))))))

(assert (=> d!10953 (= (+!80 lt!22869 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16))) lt!23376)))

(declare-fun b!58259 () Bool)

(declare-fun res!32505 () Bool)

(assert (=> b!58259 (=> (not res!32505) (not e!38340))))

(assert (=> b!58259 (= res!32505 (= (getValueByKey!121 (toList!690 lt!23376) (_1!1023 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16))))))))

(declare-fun b!58260 () Bool)

(assert (=> b!58260 (= e!38340 (contains!681 (toList!690 lt!23376) (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16))))))

(assert (= (and d!10953 res!32506) b!58259))

(assert (= (and b!58259 res!32505) b!58260))

(declare-fun m!49673 () Bool)

(assert (=> d!10953 m!49673))

(declare-fun m!49675 () Bool)

(assert (=> d!10953 m!49675))

(declare-fun m!49677 () Bool)

(assert (=> d!10953 m!49677))

(declare-fun m!49679 () Bool)

(assert (=> d!10953 m!49679))

(declare-fun m!49681 () Bool)

(assert (=> b!58259 m!49681))

(declare-fun m!49683 () Bool)

(assert (=> b!58260 m!49683))

(assert (=> b!57551 d!10953))

(declare-fun d!10955 () Bool)

(assert (=> d!10955 (= (apply!65 lt!22865 lt!22877) (get!1070 (getValueByKey!121 (toList!690 lt!22865) lt!22877)))))

(declare-fun bs!2524 () Bool)

(assert (= bs!2524 d!10955))

(declare-fun m!49685 () Bool)

(assert (=> bs!2524 m!49685))

(assert (=> bs!2524 m!49685))

(declare-fun m!49687 () Bool)

(assert (=> bs!2524 m!49687))

(assert (=> b!57551 d!10955))

(declare-fun d!10957 () Bool)

(assert (=> d!10957 (= (apply!65 (+!80 lt!22860 (tuple2!2025 lt!22861 (minValue!1939 newMap!16))) lt!22858) (apply!65 lt!22860 lt!22858))))

(declare-fun lt!23378 () Unit!1484)

(assert (=> d!10957 (= lt!23378 (choose!296 lt!22860 lt!22861 (minValue!1939 newMap!16) lt!22858))))

(declare-fun e!38341 () Bool)

(assert (=> d!10957 e!38341))

(declare-fun res!32507 () Bool)

(assert (=> d!10957 (=> (not res!32507) (not e!38341))))

(assert (=> d!10957 (= res!32507 (contains!677 lt!22860 lt!22858))))

(assert (=> d!10957 (= (addApplyDifferent!41 lt!22860 lt!22861 (minValue!1939 newMap!16) lt!22858) lt!23378)))

(declare-fun b!58261 () Bool)

(assert (=> b!58261 (= e!38341 (not (= lt!22858 lt!22861)))))

(assert (= (and d!10957 res!32507) b!58261))

(assert (=> d!10957 m!48451))

(assert (=> d!10957 m!48459))

(assert (=> d!10957 m!48455))

(declare-fun m!49689 () Bool)

(assert (=> d!10957 m!49689))

(declare-fun m!49691 () Bool)

(assert (=> d!10957 m!49691))

(assert (=> d!10957 m!48451))

(assert (=> b!57551 d!10957))

(declare-fun d!10959 () Bool)

(declare-fun e!38342 () Bool)

(assert (=> d!10959 e!38342))

(declare-fun res!32508 () Bool)

(assert (=> d!10959 (=> res!32508 e!38342)))

(declare-fun lt!23379 () Bool)

(assert (=> d!10959 (= res!32508 (not lt!23379))))

(declare-fun lt!23382 () Bool)

(assert (=> d!10959 (= lt!23379 lt!23382)))

(declare-fun lt!23381 () Unit!1484)

(declare-fun e!38343 () Unit!1484)

(assert (=> d!10959 (= lt!23381 e!38343)))

(declare-fun c!7320 () Bool)

(assert (=> d!10959 (= c!7320 lt!23382)))

(assert (=> d!10959 (= lt!23382 (containsKey!125 (toList!690 (+!80 lt!22869 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16)))) lt!22862))))

(assert (=> d!10959 (= (contains!677 (+!80 lt!22869 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16))) lt!22862) lt!23379)))

(declare-fun b!58262 () Bool)

(declare-fun lt!23380 () Unit!1484)

(assert (=> b!58262 (= e!38343 lt!23380)))

(assert (=> b!58262 (= lt!23380 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 (+!80 lt!22869 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16)))) lt!22862))))

(assert (=> b!58262 (isDefined!75 (getValueByKey!121 (toList!690 (+!80 lt!22869 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16)))) lt!22862))))

(declare-fun b!58263 () Bool)

(declare-fun Unit!1531 () Unit!1484)

(assert (=> b!58263 (= e!38343 Unit!1531)))

(declare-fun b!58264 () Bool)

(assert (=> b!58264 (= e!38342 (isDefined!75 (getValueByKey!121 (toList!690 (+!80 lt!22869 (tuple2!2025 lt!22864 (zeroValue!1939 newMap!16)))) lt!22862)))))

(assert (= (and d!10959 c!7320) b!58262))

(assert (= (and d!10959 (not c!7320)) b!58263))

(assert (= (and d!10959 (not res!32508)) b!58264))

(declare-fun m!49693 () Bool)

(assert (=> d!10959 m!49693))

(declare-fun m!49695 () Bool)

(assert (=> b!58262 m!49695))

(declare-fun m!49697 () Bool)

(assert (=> b!58262 m!49697))

(assert (=> b!58262 m!49697))

(declare-fun m!49699 () Bool)

(assert (=> b!58262 m!49699))

(assert (=> b!58264 m!49697))

(assert (=> b!58264 m!49697))

(assert (=> b!58264 m!49699))

(assert (=> b!57551 d!10959))

(declare-fun d!10961 () Bool)

(assert (=> d!10961 (= (apply!65 (+!80 lt!22860 (tuple2!2025 lt!22861 (minValue!1939 newMap!16))) lt!22858) (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!22860 (tuple2!2025 lt!22861 (minValue!1939 newMap!16)))) lt!22858)))))

(declare-fun bs!2525 () Bool)

(assert (= bs!2525 d!10961))

(declare-fun m!49701 () Bool)

(assert (=> bs!2525 m!49701))

(assert (=> bs!2525 m!49701))

(declare-fun m!49703 () Bool)

(assert (=> bs!2525 m!49703))

(assert (=> b!57551 d!10961))

(declare-fun d!10963 () Bool)

(assert (=> d!10963 (= (apply!65 (+!80 lt!22865 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16))) lt!22877) (apply!65 lt!22865 lt!22877))))

(declare-fun lt!23383 () Unit!1484)

(assert (=> d!10963 (= lt!23383 (choose!296 lt!22865 lt!22872 (zeroValue!1939 newMap!16) lt!22877))))

(declare-fun e!38344 () Bool)

(assert (=> d!10963 e!38344))

(declare-fun res!32509 () Bool)

(assert (=> d!10963 (=> (not res!32509) (not e!38344))))

(assert (=> d!10963 (= res!32509 (contains!677 lt!22865 lt!22877))))

(assert (=> d!10963 (= (addApplyDifferent!41 lt!22865 lt!22872 (zeroValue!1939 newMap!16) lt!22877) lt!23383)))

(declare-fun b!58265 () Bool)

(assert (=> b!58265 (= e!38344 (not (= lt!22877 lt!22872)))))

(assert (= (and d!10963 res!32509) b!58265))

(assert (=> d!10963 m!48443))

(assert (=> d!10963 m!48445))

(assert (=> d!10963 m!48435))

(declare-fun m!49705 () Bool)

(assert (=> d!10963 m!49705))

(declare-fun m!49707 () Bool)

(assert (=> d!10963 m!49707))

(assert (=> d!10963 m!48443))

(assert (=> b!57551 d!10963))

(declare-fun d!10965 () Bool)

(assert (=> d!10965 (= (apply!65 lt!22860 lt!22858) (get!1070 (getValueByKey!121 (toList!690 lt!22860) lt!22858)))))

(declare-fun bs!2526 () Bool)

(assert (= bs!2526 d!10965))

(declare-fun m!49709 () Bool)

(assert (=> bs!2526 m!49709))

(assert (=> bs!2526 m!49709))

(declare-fun m!49711 () Bool)

(assert (=> bs!2526 m!49711))

(assert (=> b!57551 d!10965))

(declare-fun d!10967 () Bool)

(declare-fun e!38345 () Bool)

(assert (=> d!10967 e!38345))

(declare-fun res!32511 () Bool)

(assert (=> d!10967 (=> (not res!32511) (not e!38345))))

(declare-fun lt!23386 () ListLongMap!1349)

(assert (=> d!10967 (= res!32511 (contains!677 lt!23386 (_1!1023 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16)))))))

(declare-fun lt!23387 () List!1431)

(assert (=> d!10967 (= lt!23386 (ListLongMap!1350 lt!23387))))

(declare-fun lt!23384 () Unit!1484)

(declare-fun lt!23385 () Unit!1484)

(assert (=> d!10967 (= lt!23384 lt!23385)))

(assert (=> d!10967 (= (getValueByKey!121 lt!23387 (_1!1023 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16)))))))

(assert (=> d!10967 (= lt!23385 (lemmaContainsTupThenGetReturnValue!41 lt!23387 (_1!1023 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16)))))))

(assert (=> d!10967 (= lt!23387 (insertStrictlySorted!44 (toList!690 lt!22865) (_1!1023 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16)))))))

(assert (=> d!10967 (= (+!80 lt!22865 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16))) lt!23386)))

(declare-fun b!58266 () Bool)

(declare-fun res!32510 () Bool)

(assert (=> b!58266 (=> (not res!32510) (not e!38345))))

(assert (=> b!58266 (= res!32510 (= (getValueByKey!121 (toList!690 lt!23386) (_1!1023 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16))))))))

(declare-fun b!58267 () Bool)

(assert (=> b!58267 (= e!38345 (contains!681 (toList!690 lt!23386) (tuple2!2025 lt!22872 (zeroValue!1939 newMap!16))))))

(assert (= (and d!10967 res!32511) b!58266))

(assert (= (and b!58266 res!32510) b!58267))

(declare-fun m!49713 () Bool)

(assert (=> d!10967 m!49713))

(declare-fun m!49715 () Bool)

(assert (=> d!10967 m!49715))

(declare-fun m!49717 () Bool)

(assert (=> d!10967 m!49717))

(declare-fun m!49719 () Bool)

(assert (=> d!10967 m!49719))

(declare-fun m!49721 () Bool)

(assert (=> b!58266 m!49721))

(declare-fun m!49723 () Bool)

(assert (=> b!58267 m!49723))

(assert (=> b!57551 d!10967))

(declare-fun d!10969 () Bool)

(assert (=> d!10969 (= (apply!65 lt!22867 lt!22875) (get!1070 (getValueByKey!121 (toList!690 lt!22867) lt!22875)))))

(declare-fun bs!2527 () Bool)

(assert (= bs!2527 d!10969))

(declare-fun m!49725 () Bool)

(assert (=> bs!2527 m!49725))

(assert (=> bs!2527 m!49725))

(declare-fun m!49727 () Bool)

(assert (=> bs!2527 m!49727))

(assert (=> b!57551 d!10969))

(declare-fun d!10971 () Bool)

(declare-fun e!38346 () Bool)

(assert (=> d!10971 e!38346))

(declare-fun res!32513 () Bool)

(assert (=> d!10971 (=> (not res!32513) (not e!38346))))

(declare-fun lt!23390 () ListLongMap!1349)

(assert (=> d!10971 (= res!32513 (contains!677 lt!23390 (_1!1023 (tuple2!2025 lt!22861 (minValue!1939 newMap!16)))))))

(declare-fun lt!23391 () List!1431)

(assert (=> d!10971 (= lt!23390 (ListLongMap!1350 lt!23391))))

(declare-fun lt!23388 () Unit!1484)

(declare-fun lt!23389 () Unit!1484)

(assert (=> d!10971 (= lt!23388 lt!23389)))

(assert (=> d!10971 (= (getValueByKey!121 lt!23391 (_1!1023 (tuple2!2025 lt!22861 (minValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!22861 (minValue!1939 newMap!16)))))))

(assert (=> d!10971 (= lt!23389 (lemmaContainsTupThenGetReturnValue!41 lt!23391 (_1!1023 (tuple2!2025 lt!22861 (minValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!22861 (minValue!1939 newMap!16)))))))

(assert (=> d!10971 (= lt!23391 (insertStrictlySorted!44 (toList!690 lt!22860) (_1!1023 (tuple2!2025 lt!22861 (minValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!22861 (minValue!1939 newMap!16)))))))

(assert (=> d!10971 (= (+!80 lt!22860 (tuple2!2025 lt!22861 (minValue!1939 newMap!16))) lt!23390)))

(declare-fun b!58268 () Bool)

(declare-fun res!32512 () Bool)

(assert (=> b!58268 (=> (not res!32512) (not e!38346))))

(assert (=> b!58268 (= res!32512 (= (getValueByKey!121 (toList!690 lt!23390) (_1!1023 (tuple2!2025 lt!22861 (minValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!22861 (minValue!1939 newMap!16))))))))

(declare-fun b!58269 () Bool)

(assert (=> b!58269 (= e!38346 (contains!681 (toList!690 lt!23390) (tuple2!2025 lt!22861 (minValue!1939 newMap!16))))))

(assert (= (and d!10971 res!32513) b!58268))

(assert (= (and b!58268 res!32512) b!58269))

(declare-fun m!49729 () Bool)

(assert (=> d!10971 m!49729))

(declare-fun m!49731 () Bool)

(assert (=> d!10971 m!49731))

(declare-fun m!49733 () Bool)

(assert (=> d!10971 m!49733))

(declare-fun m!49735 () Bool)

(assert (=> d!10971 m!49735))

(declare-fun m!49737 () Bool)

(assert (=> b!58268 m!49737))

(declare-fun m!49739 () Bool)

(assert (=> b!58269 m!49739))

(assert (=> b!57551 d!10971))

(declare-fun d!10973 () Bool)

(declare-fun e!38347 () Bool)

(assert (=> d!10973 e!38347))

(declare-fun res!32515 () Bool)

(assert (=> d!10973 (=> (not res!32515) (not e!38347))))

(declare-fun lt!23394 () ListLongMap!1349)

(assert (=> d!10973 (= res!32515 (contains!677 lt!23394 (_1!1023 (tuple2!2025 lt!22878 (minValue!1939 newMap!16)))))))

(declare-fun lt!23395 () List!1431)

(assert (=> d!10973 (= lt!23394 (ListLongMap!1350 lt!23395))))

(declare-fun lt!23392 () Unit!1484)

(declare-fun lt!23393 () Unit!1484)

(assert (=> d!10973 (= lt!23392 lt!23393)))

(assert (=> d!10973 (= (getValueByKey!121 lt!23395 (_1!1023 (tuple2!2025 lt!22878 (minValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!22878 (minValue!1939 newMap!16)))))))

(assert (=> d!10973 (= lt!23393 (lemmaContainsTupThenGetReturnValue!41 lt!23395 (_1!1023 (tuple2!2025 lt!22878 (minValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!22878 (minValue!1939 newMap!16)))))))

(assert (=> d!10973 (= lt!23395 (insertStrictlySorted!44 (toList!690 lt!22867) (_1!1023 (tuple2!2025 lt!22878 (minValue!1939 newMap!16))) (_2!1023 (tuple2!2025 lt!22878 (minValue!1939 newMap!16)))))))

(assert (=> d!10973 (= (+!80 lt!22867 (tuple2!2025 lt!22878 (minValue!1939 newMap!16))) lt!23394)))

(declare-fun b!58270 () Bool)

(declare-fun res!32514 () Bool)

(assert (=> b!58270 (=> (not res!32514) (not e!38347))))

(assert (=> b!58270 (= res!32514 (= (getValueByKey!121 (toList!690 lt!23394) (_1!1023 (tuple2!2025 lt!22878 (minValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 lt!22878 (minValue!1939 newMap!16))))))))

(declare-fun b!58271 () Bool)

(assert (=> b!58271 (= e!38347 (contains!681 (toList!690 lt!23394) (tuple2!2025 lt!22878 (minValue!1939 newMap!16))))))

(assert (= (and d!10973 res!32515) b!58270))

(assert (= (and b!58270 res!32514) b!58271))

(declare-fun m!49741 () Bool)

(assert (=> d!10973 m!49741))

(declare-fun m!49743 () Bool)

(assert (=> d!10973 m!49743))

(declare-fun m!49745 () Bool)

(assert (=> d!10973 m!49745))

(declare-fun m!49747 () Bool)

(assert (=> d!10973 m!49747))

(declare-fun m!49749 () Bool)

(assert (=> b!58270 m!49749))

(declare-fun m!49751 () Bool)

(assert (=> b!58271 m!49751))

(assert (=> b!57551 d!10973))

(assert (=> b!57551 d!10873))

(assert (=> b!57535 d!10683))

(declare-fun d!10975 () Bool)

(assert (=> d!10975 (= (+!80 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!387 (_keys!3640 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(assert (=> d!10975 true))

(declare-fun _$5!59 () Unit!1484)

(assert (=> d!10975 (= (choose!303 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (index!3039 lt!22666) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2021 newMap!16)) _$5!59)))

(declare-fun bs!2528 () Bool)

(assert (= bs!2528 d!10975))

(assert (=> bs!2528 m!48101))

(assert (=> bs!2528 m!48101))

(assert (=> bs!2528 m!48617))

(assert (=> bs!2528 m!48071))

(assert (=> bs!2528 m!48619))

(assert (=> d!10649 d!10975))

(assert (=> d!10649 d!10747))

(declare-fun d!10977 () Bool)

(assert (=> d!10977 (isDefined!75 (getValueByKey!121 (toList!690 call!4115) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun lt!23396 () Unit!1484)

(assert (=> d!10977 (= lt!23396 (choose!297 (toList!690 call!4115) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun e!38348 () Bool)

(assert (=> d!10977 e!38348))

(declare-fun res!32516 () Bool)

(assert (=> d!10977 (=> (not res!32516) (not e!38348))))

(assert (=> d!10977 (= res!32516 (isStrictlySorted!278 (toList!690 call!4115)))))

(assert (=> d!10977 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 call!4115) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) lt!23396)))

(declare-fun b!58272 () Bool)

(assert (=> b!58272 (= e!38348 (containsKey!125 (toList!690 call!4115) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (= (and d!10977 res!32516) b!58272))

(assert (=> d!10977 m!47913))

(assert (=> d!10977 m!48625))

(assert (=> d!10977 m!48625))

(assert (=> d!10977 m!48627))

(assert (=> d!10977 m!47913))

(declare-fun m!49753 () Bool)

(assert (=> d!10977 m!49753))

(declare-fun m!49755 () Bool)

(assert (=> d!10977 m!49755))

(assert (=> b!58272 m!47913))

(assert (=> b!58272 m!48621))

(assert (=> b!57643 d!10977))

(assert (=> b!57643 d!10667))

(assert (=> b!57643 d!10669))

(declare-fun d!10979 () Bool)

(assert (=> d!10979 (= (apply!65 lt!23070 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (get!1070 (getValueByKey!121 (toList!690 lt!23070) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!2529 () Bool)

(assert (= bs!2529 d!10979))

(assert (=> bs!2529 m!48317))

(assert (=> bs!2529 m!49577))

(assert (=> bs!2529 m!49577))

(declare-fun m!49757 () Bool)

(assert (=> bs!2529 m!49757))

(assert (=> b!57729 d!10979))

(declare-fun d!10981 () Bool)

(declare-fun c!7321 () Bool)

(assert (=> d!10981 (= c!7321 ((_ is ValueCellFull!851) (select (arr!1763 lt!22683) #b00000000000000000000000000000000)))))

(declare-fun e!38349 () V!2833)

(assert (=> d!10981 (= (get!1065 (select (arr!1763 lt!22683) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!38349)))

(declare-fun b!58273 () Bool)

(assert (=> b!58273 (= e!38349 (get!1068 (select (arr!1763 lt!22683) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!58274 () Bool)

(assert (=> b!58274 (= e!38349 (get!1069 (select (arr!1763 lt!22683) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10981 c!7321) b!58273))

(assert (= (and d!10981 (not c!7321)) b!58274))

(assert (=> b!58273 m!48695))

(assert (=> b!58273 m!48353))

(declare-fun m!49759 () Bool)

(assert (=> b!58273 m!49759))

(assert (=> b!58274 m!48695))

(assert (=> b!58274 m!48353))

(declare-fun m!49761 () Bool)

(assert (=> b!58274 m!49761))

(assert (=> b!57729 d!10981))

(declare-fun d!10983 () Bool)

(declare-fun res!32517 () Bool)

(declare-fun e!38350 () Bool)

(assert (=> d!10983 (=> res!32517 e!38350)))

(assert (=> d!10983 (= res!32517 (and ((_ is Cons!1427) (toList!690 call!4127)) (= (_1!1023 (h!2007 (toList!690 call!4127))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (=> d!10983 (= (containsKey!125 (toList!690 call!4127) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) e!38350)))

(declare-fun b!58275 () Bool)

(declare-fun e!38351 () Bool)

(assert (=> b!58275 (= e!38350 e!38351)))

(declare-fun res!32518 () Bool)

(assert (=> b!58275 (=> (not res!32518) (not e!38351))))

(assert (=> b!58275 (= res!32518 (and (or (not ((_ is Cons!1427) (toList!690 call!4127))) (bvsle (_1!1023 (h!2007 (toList!690 call!4127))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))) ((_ is Cons!1427) (toList!690 call!4127)) (bvslt (_1!1023 (h!2007 (toList!690 call!4127))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(declare-fun b!58276 () Bool)

(assert (=> b!58276 (= e!38351 (containsKey!125 (t!4744 (toList!690 call!4127)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (= (and d!10983 (not res!32517)) b!58275))

(assert (= (and b!58275 res!32518) b!58276))

(assert (=> b!58276 m!47913))

(declare-fun m!49763 () Bool)

(assert (=> b!58276 m!49763))

(assert (=> d!10623 d!10983))

(declare-fun d!10985 () Bool)

(assert (=> d!10985 (= (get!1070 (getValueByKey!121 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!2367 (getValueByKey!121 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10593 d!10985))

(assert (=> d!10593 d!10689))

(assert (=> b!57642 d!10765))

(assert (=> b!57642 d!10595))

(declare-fun b!58278 () Bool)

(declare-fun e!38354 () ListLongMap!1349)

(declare-fun call!4272 () ListLongMap!1349)

(assert (=> b!58278 (= e!38354 call!4272)))

(declare-fun b!58279 () Bool)

(declare-fun e!38358 () Bool)

(assert (=> b!58279 (= e!38358 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!58280 () Bool)

(declare-fun e!38362 () Bool)

(declare-fun e!38359 () Bool)

(assert (=> b!58280 (= e!38362 e!38359)))

(declare-fun res!32519 () Bool)

(declare-fun call!4271 () Bool)

(assert (=> b!58280 (= res!32519 call!4271)))

(assert (=> b!58280 (=> (not res!32519) (not e!38359))))

(declare-fun b!58281 () Bool)

(declare-fun e!38360 () ListLongMap!1349)

(declare-fun e!38363 () ListLongMap!1349)

(assert (=> b!58281 (= e!38360 e!38363)))

(declare-fun c!7323 () Bool)

(assert (=> b!58281 (= c!7323 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!58282 () Bool)

(declare-fun c!7324 () Bool)

(assert (=> b!58282 (= c!7324 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!58282 (= e!38363 e!38354)))

(declare-fun bm!4267 () Bool)

(declare-fun call!4273 () ListLongMap!1349)

(declare-fun call!4275 () ListLongMap!1349)

(assert (=> bm!4267 (= call!4273 call!4275)))

(declare-fun b!58283 () Bool)

(declare-fun e!38353 () Bool)

(declare-fun e!38352 () Bool)

(assert (=> b!58283 (= e!38353 e!38352)))

(declare-fun res!32525 () Bool)

(assert (=> b!58283 (=> (not res!32525) (not e!38352))))

(declare-fun lt!23418 () ListLongMap!1349)

(assert (=> b!58283 (= res!32525 (contains!677 lt!23418 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!58283 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!58284 () Bool)

(declare-fun e!38361 () Unit!1484)

(declare-fun Unit!1532 () Unit!1484)

(assert (=> b!58284 (= e!38361 Unit!1532)))

(declare-fun b!58285 () Bool)

(declare-fun call!4276 () ListLongMap!1349)

(assert (=> b!58285 (= e!38360 (+!80 call!4276 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))

(declare-fun d!10987 () Bool)

(declare-fun e!38355 () Bool)

(assert (=> d!10987 e!38355))

(declare-fun res!32523 () Bool)

(assert (=> d!10987 (=> (not res!32523) (not e!38355))))

(assert (=> d!10987 (= res!32523 (or (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))))

(declare-fun lt!23412 () ListLongMap!1349)

(assert (=> d!10987 (= lt!23418 lt!23412)))

(declare-fun lt!23410 () Unit!1484)

(assert (=> d!10987 (= lt!23410 e!38361)))

(declare-fun c!7326 () Bool)

(declare-fun e!38364 () Bool)

(assert (=> d!10987 (= c!7326 e!38364)))

(declare-fun res!32527 () Bool)

(assert (=> d!10987 (=> (not res!32527) (not e!38364))))

(assert (=> d!10987 (= res!32527 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!10987 (= lt!23412 e!38360)))

(declare-fun c!7325 () Bool)

(assert (=> d!10987 (= c!7325 (and (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!10987 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!10987 (= (getCurrentListMap!387 (_keys!3640 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) lt!23418)))

(declare-fun b!58277 () Bool)

(assert (=> b!58277 (= e!38355 e!38362)))

(declare-fun c!7327 () Bool)

(assert (=> b!58277 (= c!7327 (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!4268 () Bool)

(declare-fun call!4270 () ListLongMap!1349)

(assert (=> bm!4268 (= call!4270 call!4276)))

(declare-fun bm!4269 () Bool)

(assert (=> bm!4269 (= call!4271 (contains!677 lt!23418 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58286 () Bool)

(assert (=> b!58286 (= e!38363 call!4270)))

(declare-fun bm!4270 () Bool)

(assert (=> bm!4270 (= call!4272 call!4273)))

(declare-fun b!58287 () Bool)

(declare-fun res!32522 () Bool)

(assert (=> b!58287 (=> (not res!32522) (not e!38355))))

(assert (=> b!58287 (= res!32522 e!38353)))

(declare-fun res!32520 () Bool)

(assert (=> b!58287 (=> res!32520 e!38353)))

(assert (=> b!58287 (= res!32520 (not e!38358))))

(declare-fun res!32524 () Bool)

(assert (=> b!58287 (=> (not res!32524) (not e!38358))))

(assert (=> b!58287 (= res!32524 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!58288 () Bool)

(declare-fun e!38357 () Bool)

(declare-fun e!38356 () Bool)

(assert (=> b!58288 (= e!38357 e!38356)))

(declare-fun res!32526 () Bool)

(declare-fun call!4274 () Bool)

(assert (=> b!58288 (= res!32526 call!4274)))

(assert (=> b!58288 (=> (not res!32526) (not e!38356))))

(declare-fun bm!4271 () Bool)

(assert (=> bm!4271 (= call!4276 (+!80 (ite c!7325 call!4275 (ite c!7323 call!4273 call!4272)) (ite (or c!7325 c!7323) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 newMap!16)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(declare-fun b!58289 () Bool)

(assert (=> b!58289 (= e!38352 (= (apply!65 lt!23418 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (get!1065 (select (arr!1763 (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!58289 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1993 (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))))))))

(assert (=> b!58289 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!58290 () Bool)

(assert (=> b!58290 (= e!38356 (= (apply!65 lt!23418 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1939 newMap!16)))))

(declare-fun b!58291 () Bool)

(declare-fun res!32521 () Bool)

(assert (=> b!58291 (=> (not res!32521) (not e!38355))))

(assert (=> b!58291 (= res!32521 e!38357)))

(declare-fun c!7322 () Bool)

(assert (=> b!58291 (= c!7322 (not (= (bvand (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!58292 () Bool)

(assert (=> b!58292 (= e!38354 call!4270)))

(declare-fun b!58293 () Bool)

(assert (=> b!58293 (= e!38357 (not call!4274))))

(declare-fun b!58294 () Bool)

(assert (=> b!58294 (= e!38362 (not call!4271))))

(declare-fun b!58295 () Bool)

(declare-fun lt!23402 () Unit!1484)

(assert (=> b!58295 (= e!38361 lt!23402)))

(declare-fun lt!23408 () ListLongMap!1349)

(assert (=> b!58295 (= lt!23408 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23403 () (_ BitVec 64))

(assert (=> b!58295 (= lt!23403 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23401 () (_ BitVec 64))

(assert (=> b!58295 (= lt!23401 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!23405 () Unit!1484)

(assert (=> b!58295 (= lt!23405 (addStillContains!41 lt!23408 lt!23403 (zeroValue!1939 newMap!16) lt!23401))))

(assert (=> b!58295 (contains!677 (+!80 lt!23408 (tuple2!2025 lt!23403 (zeroValue!1939 newMap!16))) lt!23401)))

(declare-fun lt!23415 () Unit!1484)

(assert (=> b!58295 (= lt!23415 lt!23405)))

(declare-fun lt!23399 () ListLongMap!1349)

(assert (=> b!58295 (= lt!23399 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23400 () (_ BitVec 64))

(assert (=> b!58295 (= lt!23400 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23397 () (_ BitVec 64))

(assert (=> b!58295 (= lt!23397 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!23413 () Unit!1484)

(assert (=> b!58295 (= lt!23413 (addApplyDifferent!41 lt!23399 lt!23400 (minValue!1939 newMap!16) lt!23397))))

(assert (=> b!58295 (= (apply!65 (+!80 lt!23399 (tuple2!2025 lt!23400 (minValue!1939 newMap!16))) lt!23397) (apply!65 lt!23399 lt!23397))))

(declare-fun lt!23398 () Unit!1484)

(assert (=> b!58295 (= lt!23398 lt!23413)))

(declare-fun lt!23404 () ListLongMap!1349)

(assert (=> b!58295 (= lt!23404 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23411 () (_ BitVec 64))

(assert (=> b!58295 (= lt!23411 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23416 () (_ BitVec 64))

(assert (=> b!58295 (= lt!23416 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!23407 () Unit!1484)

(assert (=> b!58295 (= lt!23407 (addApplyDifferent!41 lt!23404 lt!23411 (zeroValue!1939 newMap!16) lt!23416))))

(assert (=> b!58295 (= (apply!65 (+!80 lt!23404 (tuple2!2025 lt!23411 (zeroValue!1939 newMap!16))) lt!23416) (apply!65 lt!23404 lt!23416))))

(declare-fun lt!23409 () Unit!1484)

(assert (=> b!58295 (= lt!23409 lt!23407)))

(declare-fun lt!23406 () ListLongMap!1349)

(assert (=> b!58295 (= lt!23406 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23417 () (_ BitVec 64))

(assert (=> b!58295 (= lt!23417 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23414 () (_ BitVec 64))

(assert (=> b!58295 (= lt!23414 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!58295 (= lt!23402 (addApplyDifferent!41 lt!23406 lt!23417 (minValue!1939 newMap!16) lt!23414))))

(assert (=> b!58295 (= (apply!65 (+!80 lt!23406 (tuple2!2025 lt!23417 (minValue!1939 newMap!16))) lt!23414) (apply!65 lt!23406 lt!23414))))

(declare-fun bm!4272 () Bool)

(assert (=> bm!4272 (= call!4274 (contains!677 lt!23418 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58296 () Bool)

(assert (=> b!58296 (= e!38364 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!4273 () Bool)

(assert (=> bm!4273 (= call!4275 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (array!3686 (store (arr!1763 (_values!2004 newMap!16)) (index!3039 lt!22666) (ValueCellFull!851 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1993 (_values!2004 newMap!16))) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun b!58297 () Bool)

(assert (=> b!58297 (= e!38359 (= (apply!65 lt!23418 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1939 newMap!16)))))

(assert (= (and d!10987 c!7325) b!58285))

(assert (= (and d!10987 (not c!7325)) b!58281))

(assert (= (and b!58281 c!7323) b!58286))

(assert (= (and b!58281 (not c!7323)) b!58282))

(assert (= (and b!58282 c!7324) b!58292))

(assert (= (and b!58282 (not c!7324)) b!58278))

(assert (= (or b!58292 b!58278) bm!4270))

(assert (= (or b!58286 bm!4270) bm!4267))

(assert (= (or b!58286 b!58292) bm!4268))

(assert (= (or b!58285 bm!4267) bm!4273))

(assert (= (or b!58285 bm!4268) bm!4271))

(assert (= (and d!10987 res!32527) b!58296))

(assert (= (and d!10987 c!7326) b!58295))

(assert (= (and d!10987 (not c!7326)) b!58284))

(assert (= (and d!10987 res!32523) b!58287))

(assert (= (and b!58287 res!32524) b!58279))

(assert (= (and b!58287 (not res!32520)) b!58283))

(assert (= (and b!58283 res!32525) b!58289))

(assert (= (and b!58287 res!32522) b!58291))

(assert (= (and b!58291 c!7322) b!58288))

(assert (= (and b!58291 (not c!7322)) b!58293))

(assert (= (and b!58288 res!32526) b!58290))

(assert (= (or b!58288 b!58293) bm!4272))

(assert (= (and b!58291 res!32521) b!58277))

(assert (= (and b!58277 c!7327) b!58280))

(assert (= (and b!58277 (not c!7327)) b!58294))

(assert (= (and b!58280 res!32519) b!58297))

(assert (= (or b!58280 b!58294) bm!4269))

(declare-fun b_lambda!2547 () Bool)

(assert (=> (not b_lambda!2547) (not b!58289)))

(assert (=> b!58289 t!4758))

(declare-fun b_and!3529 () Bool)

(assert (= b_and!3525 (and (=> t!4758 result!2353) b_and!3529)))

(assert (=> b!58289 t!4760))

(declare-fun b_and!3531 () Bool)

(assert (= b_and!3527 (and (=> t!4760 result!2355) b_and!3531)))

(declare-fun m!49765 () Bool)

(assert (=> b!58289 m!49765))

(assert (=> b!58289 m!48353))

(declare-fun m!49767 () Bool)

(assert (=> b!58289 m!49767))

(assert (=> b!58289 m!49765))

(assert (=> b!58289 m!48317))

(declare-fun m!49769 () Bool)

(assert (=> b!58289 m!49769))

(assert (=> b!58289 m!48317))

(assert (=> b!58289 m!48353))

(declare-fun m!49771 () Bool)

(assert (=> b!58285 m!49771))

(declare-fun m!49773 () Bool)

(assert (=> bm!4271 m!49773))

(assert (=> b!58283 m!48317))

(assert (=> b!58283 m!48317))

(declare-fun m!49775 () Bool)

(assert (=> b!58283 m!49775))

(declare-fun m!49777 () Bool)

(assert (=> b!58297 m!49777))

(declare-fun m!49779 () Bool)

(assert (=> bm!4269 m!49779))

(declare-fun m!49781 () Bool)

(assert (=> bm!4272 m!49781))

(assert (=> b!58295 m!48317))

(declare-fun m!49783 () Bool)

(assert (=> b!58295 m!49783))

(declare-fun m!49785 () Bool)

(assert (=> b!58295 m!49785))

(declare-fun m!49787 () Bool)

(assert (=> b!58295 m!49787))

(declare-fun m!49789 () Bool)

(assert (=> b!58295 m!49789))

(declare-fun m!49791 () Bool)

(assert (=> b!58295 m!49791))

(declare-fun m!49793 () Bool)

(assert (=> b!58295 m!49793))

(declare-fun m!49795 () Bool)

(assert (=> b!58295 m!49795))

(declare-fun m!49797 () Bool)

(assert (=> b!58295 m!49797))

(declare-fun m!49799 () Bool)

(assert (=> b!58295 m!49799))

(assert (=> b!58295 m!49791))

(declare-fun m!49801 () Bool)

(assert (=> b!58295 m!49801))

(assert (=> b!58295 m!49795))

(declare-fun m!49803 () Bool)

(assert (=> b!58295 m!49803))

(declare-fun m!49805 () Bool)

(assert (=> b!58295 m!49805))

(declare-fun m!49807 () Bool)

(assert (=> b!58295 m!49807))

(declare-fun m!49809 () Bool)

(assert (=> b!58295 m!49809))

(declare-fun m!49811 () Bool)

(assert (=> b!58295 m!49811))

(assert (=> b!58295 m!49797))

(assert (=> b!58295 m!49805))

(declare-fun m!49813 () Bool)

(assert (=> b!58295 m!49813))

(declare-fun m!49815 () Bool)

(assert (=> b!58290 m!49815))

(assert (=> bm!4273 m!49811))

(assert (=> d!10987 m!48335))

(assert (=> b!58279 m!48317))

(assert (=> b!58279 m!48317))

(assert (=> b!58279 m!48321))

(assert (=> b!58296 m!48317))

(assert (=> b!58296 m!48317))

(assert (=> b!58296 m!48321))

(assert (=> b!57642 d!10987))

(declare-fun d!10989 () Bool)

(declare-fun e!38365 () Bool)

(assert (=> d!10989 e!38365))

(declare-fun res!32528 () Bool)

(assert (=> d!10989 (=> res!32528 e!38365)))

(declare-fun lt!23419 () Bool)

(assert (=> d!10989 (= res!32528 (not lt!23419))))

(declare-fun lt!23422 () Bool)

(assert (=> d!10989 (= lt!23419 lt!23422)))

(declare-fun lt!23421 () Unit!1484)

(declare-fun e!38366 () Unit!1484)

(assert (=> d!10989 (= lt!23421 e!38366)))

(declare-fun c!7328 () Bool)

(assert (=> d!10989 (= c!7328 lt!23422)))

(assert (=> d!10989 (= lt!23422 (containsKey!125 (toList!690 lt!22919) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10989 (= (contains!677 lt!22919 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!23419)))

(declare-fun b!58298 () Bool)

(declare-fun lt!23420 () Unit!1484)

(assert (=> b!58298 (= e!38366 lt!23420)))

(assert (=> b!58298 (= lt!23420 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22919) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!58298 (isDefined!75 (getValueByKey!121 (toList!690 lt!22919) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!58299 () Bool)

(declare-fun Unit!1533 () Unit!1484)

(assert (=> b!58299 (= e!38366 Unit!1533)))

(declare-fun b!58300 () Bool)

(assert (=> b!58300 (= e!38365 (isDefined!75 (getValueByKey!121 (toList!690 lt!22919) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!10989 c!7328) b!58298))

(assert (= (and d!10989 (not c!7328)) b!58299))

(assert (= (and d!10989 (not res!32528)) b!58300))

(declare-fun m!49817 () Bool)

(assert (=> d!10989 m!49817))

(declare-fun m!49819 () Bool)

(assert (=> b!58298 m!49819))

(assert (=> b!58298 m!48551))

(assert (=> b!58298 m!48551))

(declare-fun m!49821 () Bool)

(assert (=> b!58298 m!49821))

(assert (=> b!58300 m!48551))

(assert (=> b!58300 m!48551))

(assert (=> b!58300 m!49821))

(assert (=> d!10625 d!10989))

(declare-fun b!58302 () Bool)

(declare-fun e!38367 () Option!127)

(declare-fun e!38368 () Option!127)

(assert (=> b!58302 (= e!38367 e!38368)))

(declare-fun c!7330 () Bool)

(assert (=> b!58302 (= c!7330 (and ((_ is Cons!1427) lt!22920) (not (= (_1!1023 (h!2007 lt!22920)) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!58304 () Bool)

(assert (=> b!58304 (= e!38368 None!125)))

(declare-fun b!58303 () Bool)

(assert (=> b!58303 (= e!38368 (getValueByKey!121 (t!4744 lt!22920) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!58301 () Bool)

(assert (=> b!58301 (= e!38367 (Some!126 (_2!1023 (h!2007 lt!22920))))))

(declare-fun d!10991 () Bool)

(declare-fun c!7329 () Bool)

(assert (=> d!10991 (= c!7329 (and ((_ is Cons!1427) lt!22920) (= (_1!1023 (h!2007 lt!22920)) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!10991 (= (getValueByKey!121 lt!22920 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!38367)))

(assert (= (and d!10991 c!7329) b!58301))

(assert (= (and d!10991 (not c!7329)) b!58302))

(assert (= (and b!58302 c!7330) b!58303))

(assert (= (and b!58302 (not c!7330)) b!58304))

(declare-fun m!49823 () Bool)

(assert (=> b!58303 m!49823))

(assert (=> d!10625 d!10991))

(declare-fun d!10993 () Bool)

(assert (=> d!10993 (= (getValueByKey!121 lt!22920 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!126 (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!23423 () Unit!1484)

(assert (=> d!10993 (= lt!23423 (choose!305 lt!22920 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!38369 () Bool)

(assert (=> d!10993 e!38369))

(declare-fun res!32529 () Bool)

(assert (=> d!10993 (=> (not res!32529) (not e!38369))))

(assert (=> d!10993 (= res!32529 (isStrictlySorted!278 lt!22920))))

(assert (=> d!10993 (= (lemmaContainsTupThenGetReturnValue!41 lt!22920 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!23423)))

(declare-fun b!58305 () Bool)

(declare-fun res!32530 () Bool)

(assert (=> b!58305 (=> (not res!32530) (not e!38369))))

(assert (=> b!58305 (= res!32530 (containsKey!125 lt!22920 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!58306 () Bool)

(assert (=> b!58306 (= e!38369 (contains!681 lt!22920 (tuple2!2025 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!10993 res!32529) b!58305))

(assert (= (and b!58305 res!32530) b!58306))

(assert (=> d!10993 m!48545))

(declare-fun m!49825 () Bool)

(assert (=> d!10993 m!49825))

(declare-fun m!49827 () Bool)

(assert (=> d!10993 m!49827))

(declare-fun m!49829 () Bool)

(assert (=> b!58305 m!49829))

(declare-fun m!49831 () Bool)

(assert (=> b!58306 m!49831))

(assert (=> d!10625 d!10993))

(declare-fun bm!4274 () Bool)

(declare-fun call!4279 () List!1431)

(declare-fun call!4278 () List!1431)

(assert (=> bm!4274 (= call!4279 call!4278)))

(declare-fun bm!4275 () Bool)

(declare-fun call!4277 () List!1431)

(assert (=> bm!4275 (= call!4278 call!4277)))

(declare-fun e!38373 () List!1431)

(declare-fun c!7331 () Bool)

(declare-fun bm!4276 () Bool)

(assert (=> bm!4276 (= call!4277 ($colon$colon!58 e!38373 (ite c!7331 (h!2007 (toList!690 call!4131)) (tuple2!2025 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!7333 () Bool)

(assert (=> bm!4276 (= c!7333 c!7331)))

(declare-fun e!38370 () Bool)

(declare-fun lt!23424 () List!1431)

(declare-fun b!58307 () Bool)

(assert (=> b!58307 (= e!38370 (contains!681 lt!23424 (tuple2!2025 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!58308 () Bool)

(declare-fun e!38374 () List!1431)

(declare-fun e!38371 () List!1431)

(assert (=> b!58308 (= e!38374 e!38371)))

(declare-fun c!7334 () Bool)

(assert (=> b!58308 (= c!7334 (and ((_ is Cons!1427) (toList!690 call!4131)) (= (_1!1023 (h!2007 (toList!690 call!4131))) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!58309 () Bool)

(declare-fun e!38372 () List!1431)

(assert (=> b!58309 (= e!38372 call!4279)))

(declare-fun b!58310 () Bool)

(assert (=> b!58310 (= e!38374 call!4277)))

(declare-fun b!58311 () Bool)

(assert (=> b!58311 (= e!38372 call!4279)))

(declare-fun b!58312 () Bool)

(declare-fun res!32531 () Bool)

(assert (=> b!58312 (=> (not res!32531) (not e!38370))))

(assert (=> b!58312 (= res!32531 (containsKey!125 lt!23424 (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!58313 () Bool)

(declare-fun c!7332 () Bool)

(assert (=> b!58313 (= c!7332 (and ((_ is Cons!1427) (toList!690 call!4131)) (bvsgt (_1!1023 (h!2007 (toList!690 call!4131))) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!58313 (= e!38371 e!38372)))

(declare-fun b!58314 () Bool)

(assert (=> b!58314 (= e!38373 (insertStrictlySorted!44 (t!4744 (toList!690 call!4131)) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!58315 () Bool)

(assert (=> b!58315 (= e!38371 call!4278)))

(declare-fun d!10995 () Bool)

(assert (=> d!10995 e!38370))

(declare-fun res!32532 () Bool)

(assert (=> d!10995 (=> (not res!32532) (not e!38370))))

(assert (=> d!10995 (= res!32532 (isStrictlySorted!278 lt!23424))))

(assert (=> d!10995 (= lt!23424 e!38374)))

(assert (=> d!10995 (= c!7331 (and ((_ is Cons!1427) (toList!690 call!4131)) (bvslt (_1!1023 (h!2007 (toList!690 call!4131))) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!10995 (isStrictlySorted!278 (toList!690 call!4131))))

(assert (=> d!10995 (= (insertStrictlySorted!44 (toList!690 call!4131) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!23424)))

(declare-fun b!58316 () Bool)

(assert (=> b!58316 (= e!38373 (ite c!7334 (t!4744 (toList!690 call!4131)) (ite c!7332 (Cons!1427 (h!2007 (toList!690 call!4131)) (t!4744 (toList!690 call!4131))) Nil!1428)))))

(assert (= (and d!10995 c!7331) b!58310))

(assert (= (and d!10995 (not c!7331)) b!58308))

(assert (= (and b!58308 c!7334) b!58315))

(assert (= (and b!58308 (not c!7334)) b!58313))

(assert (= (and b!58313 c!7332) b!58309))

(assert (= (and b!58313 (not c!7332)) b!58311))

(assert (= (or b!58309 b!58311) bm!4274))

(assert (= (or b!58315 bm!4274) bm!4275))

(assert (= (or b!58310 bm!4275) bm!4276))

(assert (= (and bm!4276 c!7333) b!58314))

(assert (= (and bm!4276 (not c!7333)) b!58316))

(assert (= (and d!10995 res!32532) b!58312))

(assert (= (and b!58312 res!32531) b!58307))

(declare-fun m!49833 () Bool)

(assert (=> b!58312 m!49833))

(declare-fun m!49835 () Bool)

(assert (=> b!58307 m!49835))

(declare-fun m!49837 () Bool)

(assert (=> b!58314 m!49837))

(declare-fun m!49839 () Bool)

(assert (=> bm!4276 m!49839))

(declare-fun m!49841 () Bool)

(assert (=> d!10995 m!49841))

(declare-fun m!49843 () Bool)

(assert (=> d!10995 m!49843))

(assert (=> d!10625 d!10995))

(declare-fun d!10997 () Bool)

(declare-fun res!32533 () Bool)

(declare-fun e!38375 () Bool)

(assert (=> d!10997 (=> (not res!32533) (not e!38375))))

(assert (=> d!10997 (= res!32533 (simpleValid!41 (_2!1022 lt!23019)))))

(assert (=> d!10997 (= (valid!250 (_2!1022 lt!23019)) e!38375)))

(declare-fun b!58317 () Bool)

(declare-fun res!32534 () Bool)

(assert (=> b!58317 (=> (not res!32534) (not e!38375))))

(assert (=> b!58317 (= res!32534 (= (arrayCountValidKeys!0 (_keys!3640 (_2!1022 lt!23019)) #b00000000000000000000000000000000 (size!1992 (_keys!3640 (_2!1022 lt!23019)))) (_size!354 (_2!1022 lt!23019))))))

(declare-fun b!58318 () Bool)

(declare-fun res!32535 () Bool)

(assert (=> b!58318 (=> (not res!32535) (not e!38375))))

(assert (=> b!58318 (= res!32535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3640 (_2!1022 lt!23019)) (mask!5894 (_2!1022 lt!23019))))))

(declare-fun b!58319 () Bool)

(assert (=> b!58319 (= e!38375 (arrayNoDuplicates!0 (_keys!3640 (_2!1022 lt!23019)) #b00000000000000000000000000000000 Nil!1427))))

(assert (= (and d!10997 res!32533) b!58317))

(assert (= (and b!58317 res!32534) b!58318))

(assert (= (and b!58318 res!32535) b!58319))

(declare-fun m!49845 () Bool)

(assert (=> d!10997 m!49845))

(declare-fun m!49847 () Bool)

(assert (=> b!58317 m!49847))

(declare-fun m!49849 () Bool)

(assert (=> b!58318 m!49849))

(declare-fun m!49851 () Bool)

(assert (=> b!58319 m!49851))

(assert (=> b!57700 d!10997))

(declare-fun d!10999 () Bool)

(assert (=> d!10999 (= (apply!65 lt!22857 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1070 (getValueByKey!121 (toList!690 lt!22857) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2530 () Bool)

(assert (= bs!2530 d!10999))

(declare-fun m!49853 () Bool)

(assert (=> bs!2530 m!49853))

(assert (=> bs!2530 m!49853))

(declare-fun m!49855 () Bool)

(assert (=> bs!2530 m!49855))

(assert (=> b!57530 d!10999))

(assert (=> b!57465 d!10683))

(declare-fun d!11001 () Bool)

(declare-fun lt!23425 () Bool)

(assert (=> d!11001 (= lt!23425 (select (content!62 (toList!690 lt!22813)) (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun e!38377 () Bool)

(assert (=> d!11001 (= lt!23425 e!38377)))

(declare-fun res!32536 () Bool)

(assert (=> d!11001 (=> (not res!32536) (not e!38377))))

(assert (=> d!11001 (= res!32536 ((_ is Cons!1427) (toList!690 lt!22813)))))

(assert (=> d!11001 (= (contains!681 (toList!690 lt!22813) (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!23425)))

(declare-fun b!58320 () Bool)

(declare-fun e!38376 () Bool)

(assert (=> b!58320 (= e!38377 e!38376)))

(declare-fun res!32537 () Bool)

(assert (=> b!58320 (=> res!32537 e!38376)))

(assert (=> b!58320 (= res!32537 (= (h!2007 (toList!690 lt!22813)) (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!58321 () Bool)

(assert (=> b!58321 (= e!38376 (contains!681 (t!4744 (toList!690 lt!22813)) (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(assert (= (and d!11001 res!32536) b!58320))

(assert (= (and b!58320 (not res!32537)) b!58321))

(declare-fun m!49857 () Bool)

(assert (=> d!11001 m!49857))

(declare-fun m!49859 () Bool)

(assert (=> d!11001 m!49859))

(declare-fun m!49861 () Bool)

(assert (=> b!58321 m!49861))

(assert (=> b!57447 d!11001))

(assert (=> d!10599 d!10523))

(declare-fun d!11003 () Bool)

(assert (=> d!11003 (isDefined!75 (getValueByKey!121 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!23426 () Unit!1484)

(assert (=> d!11003 (= lt!23426 (choose!297 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!38378 () Bool)

(assert (=> d!11003 e!38378))

(declare-fun res!32538 () Bool)

(assert (=> d!11003 (=> (not res!32538) (not e!38378))))

(assert (=> d!11003 (= res!32538 (isStrictlySorted!278 (toList!690 lt!22766)))))

(assert (=> d!11003 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000) lt!23426)))

(declare-fun b!58322 () Bool)

(assert (=> b!58322 (= e!38378 (containsKey!125 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!11003 res!32538) b!58322))

(assert (=> d!11003 m!48407))

(assert (=> d!11003 m!48407))

(assert (=> d!11003 m!48609))

(declare-fun m!49863 () Bool)

(assert (=> d!11003 m!49863))

(assert (=> d!11003 m!49223))

(assert (=> b!58322 m!48605))

(assert (=> b!57634 d!11003))

(assert (=> b!57634 d!10687))

(assert (=> b!57634 d!10689))

(assert (=> b!57438 d!10677))

(assert (=> b!57438 d!10679))

(declare-fun d!11005 () Bool)

(assert (=> d!11005 (= (apply!65 lt!22879 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1070 (getValueByKey!121 (toList!690 lt!22879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2531 () Bool)

(assert (= bs!2531 d!11005))

(declare-fun m!49865 () Bool)

(assert (=> bs!2531 m!49865))

(assert (=> bs!2531 m!49865))

(declare-fun m!49867 () Bool)

(assert (=> bs!2531 m!49867))

(assert (=> b!57553 d!11005))

(assert (=> b!57736 d!10683))

(declare-fun d!11007 () Bool)

(assert (=> d!11007 (= (isEmpty!295 (getValueByKey!121 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))) (not ((_ is Some!126) (getValueByKey!121 (toList!690 lt!22556) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))))

(assert (=> d!10581 d!11007))

(declare-fun d!11009 () Bool)

(declare-fun res!32539 () Bool)

(declare-fun e!38379 () Bool)

(assert (=> d!11009 (=> res!32539 e!38379)))

(assert (=> d!11009 (= res!32539 (and ((_ is Cons!1427) (toList!690 call!4115)) (= (_1!1023 (h!2007 (toList!690 call!4115))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (=> d!11009 (= (containsKey!125 (toList!690 call!4115) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) e!38379)))

(declare-fun b!58323 () Bool)

(declare-fun e!38380 () Bool)

(assert (=> b!58323 (= e!38379 e!38380)))

(declare-fun res!32540 () Bool)

(assert (=> b!58323 (=> (not res!32540) (not e!38380))))

(assert (=> b!58323 (= res!32540 (and (or (not ((_ is Cons!1427) (toList!690 call!4115))) (bvsle (_1!1023 (h!2007 (toList!690 call!4115))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))) ((_ is Cons!1427) (toList!690 call!4115)) (bvslt (_1!1023 (h!2007 (toList!690 call!4115))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(declare-fun b!58324 () Bool)

(assert (=> b!58324 (= e!38380 (containsKey!125 (t!4744 (toList!690 call!4115)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (= (and d!11009 (not res!32539)) b!58323))

(assert (= (and b!58323 res!32540) b!58324))

(assert (=> b!58324 m!47913))

(declare-fun m!49869 () Bool)

(assert (=> b!58324 m!49869))

(assert (=> d!10651 d!11009))

(declare-fun b!58326 () Bool)

(declare-fun e!38381 () Option!127)

(declare-fun e!38382 () Option!127)

(assert (=> b!58326 (= e!38381 e!38382)))

(declare-fun c!7336 () Bool)

(assert (=> b!58326 (= c!7336 (and ((_ is Cons!1427) (toList!690 lt!22919)) (not (= (_1!1023 (h!2007 (toList!690 lt!22919))) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!58328 () Bool)

(assert (=> b!58328 (= e!38382 None!125)))

(declare-fun b!58327 () Bool)

(assert (=> b!58327 (= e!38382 (getValueByKey!121 (t!4744 (toList!690 lt!22919)) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!58325 () Bool)

(assert (=> b!58325 (= e!38381 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22919)))))))

(declare-fun c!7335 () Bool)

(declare-fun d!11011 () Bool)

(assert (=> d!11011 (= c!7335 (and ((_ is Cons!1427) (toList!690 lt!22919)) (= (_1!1023 (h!2007 (toList!690 lt!22919))) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!11011 (= (getValueByKey!121 (toList!690 lt!22919) (_1!1023 (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!38381)))

(assert (= (and d!11011 c!7335) b!58325))

(assert (= (and d!11011 (not c!7335)) b!58326))

(assert (= (and b!58326 c!7336) b!58327))

(assert (= (and b!58326 (not c!7336)) b!58328))

(declare-fun m!49871 () Bool)

(assert (=> b!58327 m!49871))

(assert (=> b!57615 d!11011))

(declare-fun d!11013 () Bool)

(assert (=> d!11013 (= (apply!65 lt!22857 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1070 (getValueByKey!121 (toList!690 lt!22857) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2532 () Bool)

(assert (= bs!2532 d!11013))

(assert (=> bs!2532 m!49203))

(assert (=> bs!2532 m!49203))

(declare-fun m!49873 () Bool)

(assert (=> bs!2532 m!49873))

(assert (=> b!57523 d!11013))

(assert (=> d!10653 d!10519))

(declare-fun d!11015 () Bool)

(assert (=> d!11015 (= (get!1069 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!57647 d!11015))

(declare-fun d!11017 () Bool)

(declare-fun res!32541 () Bool)

(declare-fun e!38383 () Bool)

(assert (=> d!11017 (=> res!32541 e!38383)))

(assert (=> d!11017 (= res!32541 (and ((_ is Cons!1427) (toList!690 lt!22766)) (= (_1!1023 (h!2007 (toList!690 lt!22766))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!11017 (= (containsKey!125 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!38383)))

(declare-fun b!58329 () Bool)

(declare-fun e!38384 () Bool)

(assert (=> b!58329 (= e!38383 e!38384)))

(declare-fun res!32542 () Bool)

(assert (=> b!58329 (=> (not res!32542) (not e!38384))))

(assert (=> b!58329 (= res!32542 (and (or (not ((_ is Cons!1427) (toList!690 lt!22766))) (bvsle (_1!1023 (h!2007 (toList!690 lt!22766))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1427) (toList!690 lt!22766)) (bvslt (_1!1023 (h!2007 (toList!690 lt!22766))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!58330 () Bool)

(assert (=> b!58330 (= e!38384 (containsKey!125 (t!4744 (toList!690 lt!22766)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!11017 (not res!32541)) b!58329))

(assert (= (and b!58329 res!32542) b!58330))

(assert (=> b!58330 m!48119))

(declare-fun m!49875 () Bool)

(assert (=> b!58330 m!49875))

(assert (=> d!10631 d!11017))

(declare-fun d!11019 () Bool)

(declare-fun e!38385 () Bool)

(assert (=> d!11019 e!38385))

(declare-fun res!32543 () Bool)

(assert (=> d!11019 (=> res!32543 e!38385)))

(declare-fun lt!23427 () Bool)

(assert (=> d!11019 (= res!32543 (not lt!23427))))

(declare-fun lt!23430 () Bool)

(assert (=> d!11019 (= lt!23427 lt!23430)))

(declare-fun lt!23429 () Unit!1484)

(declare-fun e!38386 () Unit!1484)

(assert (=> d!11019 (= lt!23429 e!38386)))

(declare-fun c!7337 () Bool)

(assert (=> d!11019 (= c!7337 lt!23430)))

(assert (=> d!11019 (= lt!23430 (containsKey!125 (toList!690 (map!1099 (_2!1022 lt!23019))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!11019 (= (contains!677 (map!1099 (_2!1022 lt!23019)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) lt!23427)))

(declare-fun b!58331 () Bool)

(declare-fun lt!23428 () Unit!1484)

(assert (=> b!58331 (= e!38386 lt!23428)))

(assert (=> b!58331 (= lt!23428 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 (map!1099 (_2!1022 lt!23019))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> b!58331 (isDefined!75 (getValueByKey!121 (toList!690 (map!1099 (_2!1022 lt!23019))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!58332 () Bool)

(declare-fun Unit!1534 () Unit!1484)

(assert (=> b!58332 (= e!38386 Unit!1534)))

(declare-fun b!58333 () Bool)

(assert (=> b!58333 (= e!38385 (isDefined!75 (getValueByKey!121 (toList!690 (map!1099 (_2!1022 lt!23019))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (= (and d!11019 c!7337) b!58331))

(assert (= (and d!11019 (not c!7337)) b!58332))

(assert (= (and d!11019 (not res!32543)) b!58333))

(assert (=> d!11019 m!47913))

(declare-fun m!49877 () Bool)

(assert (=> d!11019 m!49877))

(assert (=> b!58331 m!47913))

(declare-fun m!49879 () Bool)

(assert (=> b!58331 m!49879))

(assert (=> b!58331 m!47913))

(declare-fun m!49881 () Bool)

(assert (=> b!58331 m!49881))

(assert (=> b!58331 m!49881))

(declare-fun m!49883 () Bool)

(assert (=> b!58331 m!49883))

(assert (=> b!58333 m!47913))

(assert (=> b!58333 m!49881))

(assert (=> b!58333 m!49881))

(assert (=> b!58333 m!49883))

(assert (=> b!57706 d!11019))

(assert (=> b!57706 d!10851))

(assert (=> d!10633 d!10617))

(declare-fun d!11021 () Bool)

(declare-fun e!38389 () Bool)

(assert (=> d!11021 e!38389))

(declare-fun res!32549 () Bool)

(assert (=> d!11021 (=> (not res!32549) (not e!38389))))

(declare-fun lt!23433 () SeekEntryResult!229)

(assert (=> d!11021 (= res!32549 ((_ is Found!229) lt!23433))))

(assert (=> d!11021 (= lt!23433 (seekEntryOrOpen!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (_keys!3640 newMap!16) (mask!5894 newMap!16)))))

(assert (=> d!11021 true))

(declare-fun _$33!39 () Unit!1484)

(assert (=> d!11021 (= (choose!300 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (defaultEntry!2021 newMap!16)) _$33!39)))

(declare-fun b!58338 () Bool)

(declare-fun res!32548 () Bool)

(assert (=> b!58338 (=> (not res!32548) (not e!38389))))

(assert (=> b!58338 (= res!32548 (inRange!0 (index!3039 lt!23433) (mask!5894 newMap!16)))))

(declare-fun b!58339 () Bool)

(assert (=> b!58339 (= e!38389 (= (select (arr!1762 (_keys!3640 newMap!16)) (index!3039 lt!23433)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (= (and d!11021 res!32549) b!58338))

(assert (= (and b!58338 res!32548) b!58339))

(assert (=> d!11021 m!47913))

(assert (=> d!11021 m!48067))

(declare-fun m!49885 () Bool)

(assert (=> b!58338 m!49885))

(declare-fun m!49887 () Bool)

(assert (=> b!58339 m!49887))

(assert (=> d!10633 d!11021))

(assert (=> d!10633 d!10747))

(declare-fun lt!23434 () Bool)

(declare-fun d!11023 () Bool)

(assert (=> d!11023 (= lt!23434 (select (content!62 (toList!690 lt!22889)) (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!38391 () Bool)

(assert (=> d!11023 (= lt!23434 e!38391)))

(declare-fun res!32550 () Bool)

(assert (=> d!11023 (=> (not res!32550) (not e!38391))))

(assert (=> d!11023 (= res!32550 ((_ is Cons!1427) (toList!690 lt!22889)))))

(assert (=> d!11023 (= (contains!681 (toList!690 lt!22889) (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!23434)))

(declare-fun b!58340 () Bool)

(declare-fun e!38390 () Bool)

(assert (=> b!58340 (= e!38391 e!38390)))

(declare-fun res!32551 () Bool)

(assert (=> b!58340 (=> res!32551 e!38390)))

(assert (=> b!58340 (= res!32551 (= (h!2007 (toList!690 lt!22889)) (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!58341 () Bool)

(assert (=> b!58341 (= e!38390 (contains!681 (t!4744 (toList!690 lt!22889)) (ite c!7050 (ite c!7049 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!11023 res!32550) b!58340))

(assert (= (and b!58340 (not res!32551)) b!58341))

(declare-fun m!49889 () Bool)

(assert (=> d!11023 m!49889))

(declare-fun m!49891 () Bool)

(assert (=> d!11023 m!49891))

(declare-fun m!49893 () Bool)

(assert (=> b!58341 m!49893))

(assert (=> b!57578 d!11023))

(declare-fun b!58342 () Bool)

(declare-fun e!38393 () (_ BitVec 32))

(declare-fun call!4280 () (_ BitVec 32))

(assert (=> b!58342 (= e!38393 (bvadd #b00000000000000000000000000000001 call!4280))))

(declare-fun b!58343 () Bool)

(assert (=> b!58343 (= e!38393 call!4280)))

(declare-fun bm!4277 () Bool)

(assert (=> bm!4277 (= call!4280 (arrayCountValidKeys!0 (_keys!3640 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!58344 () Bool)

(declare-fun e!38392 () (_ BitVec 32))

(assert (=> b!58344 (= e!38392 #b00000000000000000000000000000000)))

(declare-fun b!58345 () Bool)

(assert (=> b!58345 (= e!38392 e!38393)))

(declare-fun c!7339 () Bool)

(assert (=> b!58345 (= c!7339 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!11025 () Bool)

(declare-fun lt!23435 () (_ BitVec 32))

(assert (=> d!11025 (and (bvsge lt!23435 #b00000000000000000000000000000000) (bvsle lt!23435 (bvsub (size!1992 (_keys!3640 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!11025 (= lt!23435 e!38392)))

(declare-fun c!7338 () Bool)

(assert (=> d!11025 (= c!7338 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!11025 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1992 (_keys!3640 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1992 (_keys!3640 newMap!16)) (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!11025 (= (arrayCountValidKeys!0 (_keys!3640 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1992 (_keys!3640 newMap!16))) lt!23435)))

(assert (= (and d!11025 c!7338) b!58344))

(assert (= (and d!11025 (not c!7338)) b!58345))

(assert (= (and b!58345 c!7339) b!58342))

(assert (= (and b!58345 (not c!7339)) b!58343))

(assert (= (or b!58342 b!58343) bm!4277))

(declare-fun m!49895 () Bool)

(assert (=> bm!4277 m!49895))

(assert (=> b!58345 m!49589))

(assert (=> b!58345 m!49589))

(assert (=> b!58345 m!49591))

(assert (=> bm!4189 d!11025))

(assert (=> d!10569 d!10547))

(declare-fun d!11027 () Bool)

(assert (=> d!11027 (= (apply!65 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22762) (apply!65 lt!22754 lt!22762))))

(assert (=> d!11027 true))

(declare-fun _$34!755 () Unit!1484)

(assert (=> d!11027 (= (choose!296 lt!22754 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22762) _$34!755)))

(declare-fun bs!2533 () Bool)

(assert (= bs!2533 d!11027))

(assert (=> bs!2533 m!48161))

(assert (=> bs!2533 m!48161))

(assert (=> bs!2533 m!48169))

(assert (=> bs!2533 m!48153))

(assert (=> d!10569 d!11027))

(assert (=> d!10569 d!10559))

(assert (=> d!10569 d!10561))

(declare-fun d!11029 () Bool)

(declare-fun e!38394 () Bool)

(assert (=> d!11029 e!38394))

(declare-fun res!32552 () Bool)

(assert (=> d!11029 (=> res!32552 e!38394)))

(declare-fun lt!23436 () Bool)

(assert (=> d!11029 (= res!32552 (not lt!23436))))

(declare-fun lt!23439 () Bool)

(assert (=> d!11029 (= lt!23436 lt!23439)))

(declare-fun lt!23438 () Unit!1484)

(declare-fun e!38395 () Unit!1484)

(assert (=> d!11029 (= lt!23438 e!38395)))

(declare-fun c!7340 () Bool)

(assert (=> d!11029 (= c!7340 lt!23439)))

(assert (=> d!11029 (= lt!23439 (containsKey!125 (toList!690 lt!22754) lt!22762))))

(assert (=> d!11029 (= (contains!677 lt!22754 lt!22762) lt!23436)))

(declare-fun b!58346 () Bool)

(declare-fun lt!23437 () Unit!1484)

(assert (=> b!58346 (= e!38395 lt!23437)))

(assert (=> b!58346 (= lt!23437 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22754) lt!22762))))

(assert (=> b!58346 (isDefined!75 (getValueByKey!121 (toList!690 lt!22754) lt!22762))))

(declare-fun b!58347 () Bool)

(declare-fun Unit!1535 () Unit!1484)

(assert (=> b!58347 (= e!38395 Unit!1535)))

(declare-fun b!58348 () Bool)

(assert (=> b!58348 (= e!38394 (isDefined!75 (getValueByKey!121 (toList!690 lt!22754) lt!22762)))))

(assert (= (and d!11029 c!7340) b!58346))

(assert (= (and d!11029 (not c!7340)) b!58347))

(assert (= (and d!11029 (not res!32552)) b!58348))

(declare-fun m!49897 () Bool)

(assert (=> d!11029 m!49897))

(declare-fun m!49899 () Bool)

(assert (=> b!58346 m!49899))

(assert (=> b!58346 m!48219))

(assert (=> b!58346 m!48219))

(declare-fun m!49901 () Bool)

(assert (=> b!58346 m!49901))

(assert (=> b!58348 m!48219))

(assert (=> b!58348 m!48219))

(assert (=> b!58348 m!49901))

(assert (=> d!10569 d!11029))

(declare-fun d!11031 () Bool)

(declare-fun lt!23440 () Bool)

(assert (=> d!11031 (= lt!23440 (select (content!62 (toList!690 lt!22821)) (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun e!38397 () Bool)

(assert (=> d!11031 (= lt!23440 e!38397)))

(declare-fun res!32553 () Bool)

(assert (=> d!11031 (=> (not res!32553) (not e!38397))))

(assert (=> d!11031 (= res!32553 ((_ is Cons!1427) (toList!690 lt!22821)))))

(assert (=> d!11031 (= (contains!681 (toList!690 lt!22821) (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!23440)))

(declare-fun b!58349 () Bool)

(declare-fun e!38396 () Bool)

(assert (=> b!58349 (= e!38397 e!38396)))

(declare-fun res!32554 () Bool)

(assert (=> b!58349 (=> res!32554 e!38396)))

(assert (=> b!58349 (= res!32554 (= (h!2007 (toList!690 lt!22821)) (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!58350 () Bool)

(assert (=> b!58350 (= e!38396 (contains!681 (t!4744 (toList!690 lt!22821)) (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(assert (= (and d!11031 res!32553) b!58349))

(assert (= (and b!58349 (not res!32554)) b!58350))

(declare-fun m!49903 () Bool)

(assert (=> d!11031 m!49903))

(declare-fun m!49905 () Bool)

(assert (=> d!11031 m!49905))

(declare-fun m!49907 () Bool)

(assert (=> b!58350 m!49907))

(assert (=> b!57451 d!11031))

(declare-fun b!58351 () Bool)

(declare-fun e!38399 () (_ BitVec 32))

(declare-fun call!4281 () (_ BitVec 32))

(assert (=> b!58351 (= e!38399 (bvadd #b00000000000000000000000000000001 call!4281))))

(declare-fun b!58352 () Bool)

(assert (=> b!58352 (= e!38399 call!4281)))

(declare-fun bm!4278 () Bool)

(assert (=> bm!4278 (= call!4281 (arrayCountValidKeys!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!58353 () Bool)

(declare-fun e!38398 () (_ BitVec 32))

(assert (=> b!58353 (= e!38398 #b00000000000000000000000000000000)))

(declare-fun b!58354 () Bool)

(assert (=> b!58354 (= e!38398 e!38399)))

(declare-fun c!7342 () Bool)

(assert (=> b!58354 (= c!7342 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!11033 () Bool)

(declare-fun lt!23441 () (_ BitVec 32))

(assert (=> d!11033 (and (bvsge lt!23441 #b00000000000000000000000000000000) (bvsle lt!23441 (bvsub (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!11033 (= lt!23441 e!38398)))

(declare-fun c!7341 () Bool)

(assert (=> d!11033 (= c!7341 (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> d!11033 (and (bvsle #b00000000000000000000000000000000 (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> d!11033 (= (arrayCountValidKeys!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) #b00000000000000000000000000000000 (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))) lt!23441)))

(assert (= (and d!11033 c!7341) b!58353))

(assert (= (and d!11033 (not c!7341)) b!58354))

(assert (= (and b!58354 c!7342) b!58351))

(assert (= (and b!58354 (not c!7342)) b!58352))

(assert (= (or b!58351 b!58352) bm!4278))

(declare-fun m!49909 () Bool)

(assert (=> bm!4278 m!49909))

(assert (=> b!58354 m!49211))

(assert (=> b!58354 m!49211))

(assert (=> b!58354 m!49215))

(assert (=> b!57629 d!11033))

(declare-fun d!11035 () Bool)

(declare-fun lt!23442 () Bool)

(assert (=> d!11035 (= lt!23442 (select (content!62 (toList!690 lt!22940)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun e!38401 () Bool)

(assert (=> d!11035 (= lt!23442 e!38401)))

(declare-fun res!32555 () Bool)

(assert (=> d!11035 (=> (not res!32555) (not e!38401))))

(assert (=> d!11035 (= res!32555 ((_ is Cons!1427) (toList!690 lt!22940)))))

(assert (=> d!11035 (= (contains!681 (toList!690 lt!22940) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!23442)))

(declare-fun b!58355 () Bool)

(declare-fun e!38400 () Bool)

(assert (=> b!58355 (= e!38401 e!38400)))

(declare-fun res!32556 () Bool)

(assert (=> b!58355 (=> res!32556 e!38400)))

(assert (=> b!58355 (= res!32556 (= (h!2007 (toList!690 lt!22940)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!58356 () Bool)

(assert (=> b!58356 (= e!38400 (contains!681 (t!4744 (toList!690 lt!22940)) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(assert (= (and d!11035 res!32555) b!58355))

(assert (= (and b!58355 (not res!32556)) b!58356))

(declare-fun m!49911 () Bool)

(assert (=> d!11035 m!49911))

(declare-fun m!49913 () Bool)

(assert (=> d!11035 m!49913))

(declare-fun m!49915 () Bool)

(assert (=> b!58356 m!49915))

(assert (=> b!57633 d!11035))

(declare-fun b!58358 () Bool)

(declare-fun e!38402 () Option!127)

(declare-fun e!38403 () Option!127)

(assert (=> b!58358 (= e!38402 e!38403)))

(declare-fun c!7344 () Bool)

(assert (=> b!58358 (= c!7344 (and ((_ is Cons!1427) (toList!690 lt!22809)) (not (= (_1!1023 (h!2007 (toList!690 lt!22809))) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun b!58360 () Bool)

(assert (=> b!58360 (= e!38403 None!125)))

(declare-fun b!58359 () Bool)

(assert (=> b!58359 (= e!38403 (getValueByKey!121 (t!4744 (toList!690 lt!22809)) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58357 () Bool)

(assert (=> b!58357 (= e!38402 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22809)))))))

(declare-fun c!7343 () Bool)

(declare-fun d!11037 () Bool)

(assert (=> d!11037 (= c!7343 (and ((_ is Cons!1427) (toList!690 lt!22809)) (= (_1!1023 (h!2007 (toList!690 lt!22809))) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!11037 (= (getValueByKey!121 (toList!690 lt!22809) (_1!1023 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) e!38402)))

(assert (= (and d!11037 c!7343) b!58357))

(assert (= (and d!11037 (not c!7343)) b!58358))

(assert (= (and b!58358 c!7344) b!58359))

(assert (= (and b!58358 (not c!7344)) b!58360))

(declare-fun m!49917 () Bool)

(assert (=> b!58359 m!49917))

(assert (=> b!57444 d!11037))

(declare-fun d!11039 () Bool)

(declare-fun e!38404 () Bool)

(assert (=> d!11039 e!38404))

(declare-fun res!32557 () Bool)

(assert (=> d!11039 (=> res!32557 e!38404)))

(declare-fun lt!23443 () Bool)

(assert (=> d!11039 (= res!32557 (not lt!23443))))

(declare-fun lt!23446 () Bool)

(assert (=> d!11039 (= lt!23443 lt!23446)))

(declare-fun lt!23445 () Unit!1484)

(declare-fun e!38405 () Unit!1484)

(assert (=> d!11039 (= lt!23445 e!38405)))

(declare-fun c!7345 () Bool)

(assert (=> d!11039 (= c!7345 lt!23446)))

(assert (=> d!11039 (= lt!23446 (containsKey!125 (toList!690 lt!22747) lt!22745))))

(assert (=> d!11039 (= (contains!677 lt!22747 lt!22745) lt!23443)))

(declare-fun b!58361 () Bool)

(declare-fun lt!23444 () Unit!1484)

(assert (=> b!58361 (= e!38405 lt!23444)))

(assert (=> b!58361 (= lt!23444 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22747) lt!22745))))

(assert (=> b!58361 (isDefined!75 (getValueByKey!121 (toList!690 lt!22747) lt!22745))))

(declare-fun b!58362 () Bool)

(declare-fun Unit!1536 () Unit!1484)

(assert (=> b!58362 (= e!38405 Unit!1536)))

(declare-fun b!58363 () Bool)

(assert (=> b!58363 (= e!38404 (isDefined!75 (getValueByKey!121 (toList!690 lt!22747) lt!22745)))))

(assert (= (and d!11039 c!7345) b!58361))

(assert (= (and d!11039 (not c!7345)) b!58362))

(assert (= (and d!11039 (not res!32557)) b!58363))

(declare-fun m!49919 () Bool)

(assert (=> d!11039 m!49919))

(declare-fun m!49921 () Bool)

(assert (=> b!58361 m!49921))

(assert (=> b!58361 m!48295))

(assert (=> b!58361 m!48295))

(declare-fun m!49923 () Bool)

(assert (=> b!58361 m!49923))

(assert (=> b!58363 m!48295))

(assert (=> b!58363 m!48295))

(assert (=> b!58363 m!49923))

(assert (=> d!10543 d!11039))

(assert (=> d!10543 d!10563))

(assert (=> d!10543 d!10567))

(declare-fun d!11041 () Bool)

(assert (=> d!11041 (= (apply!65 (+!80 lt!22747 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22745) (apply!65 lt!22747 lt!22745))))

(assert (=> d!11041 true))

(declare-fun _$34!756 () Unit!1484)

(assert (=> d!11041 (= (choose!296 lt!22747 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22745) _$34!756)))

(declare-fun bs!2534 () Bool)

(assert (= bs!2534 d!11041))

(assert (=> bs!2534 m!48171))

(assert (=> bs!2534 m!48171))

(assert (=> bs!2534 m!48179))

(assert (=> bs!2534 m!48175))

(assert (=> d!10543 d!11041))

(assert (=> d!10543 d!10557))

(assert (=> b!57609 d!10683))

(declare-fun d!11043 () Bool)

(assert (=> d!11043 (= (content!61 Nil!1427) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!10575 d!11043))

(declare-fun d!11045 () Bool)

(declare-fun e!38406 () Bool)

(assert (=> d!11045 e!38406))

(declare-fun res!32558 () Bool)

(assert (=> d!11045 (=> res!32558 e!38406)))

(declare-fun lt!23447 () Bool)

(assert (=> d!11045 (= res!32558 (not lt!23447))))

(declare-fun lt!23450 () Bool)

(assert (=> d!11045 (= lt!23447 lt!23450)))

(declare-fun lt!23449 () Unit!1484)

(declare-fun e!38407 () Unit!1484)

(assert (=> d!11045 (= lt!23449 e!38407)))

(declare-fun c!7346 () Bool)

(assert (=> d!11045 (= c!7346 lt!23450)))

(assert (=> d!11045 (= lt!23450 (containsKey!125 (toList!690 lt!22790) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11045 (= (contains!677 lt!22790 #b1000000000000000000000000000000000000000000000000000000000000000) lt!23447)))

(declare-fun b!58364 () Bool)

(declare-fun lt!23448 () Unit!1484)

(assert (=> b!58364 (= e!38407 lt!23448)))

(assert (=> b!58364 (= lt!23448 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22790) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!58364 (isDefined!75 (getValueByKey!121 (toList!690 lt!22790) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58365 () Bool)

(declare-fun Unit!1537 () Unit!1484)

(assert (=> b!58365 (= e!38407 Unit!1537)))

(declare-fun b!58366 () Bool)

(assert (=> b!58366 (= e!38406 (isDefined!75 (getValueByKey!121 (toList!690 lt!22790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!11045 c!7346) b!58364))

(assert (= (and d!11045 (not c!7346)) b!58365))

(assert (= (and d!11045 (not res!32558)) b!58366))

(declare-fun m!49925 () Bool)

(assert (=> d!11045 m!49925))

(declare-fun m!49927 () Bool)

(assert (=> b!58364 m!49927))

(declare-fun m!49929 () Bool)

(assert (=> b!58364 m!49929))

(assert (=> b!58364 m!49929))

(declare-fun m!49931 () Bool)

(assert (=> b!58364 m!49931))

(assert (=> b!58366 m!49929))

(assert (=> b!58366 m!49929))

(assert (=> b!58366 m!49931))

(assert (=> b!57426 d!11045))

(declare-fun d!11047 () Bool)

(declare-fun res!32559 () Bool)

(declare-fun e!38408 () Bool)

(assert (=> d!11047 (=> res!32559 e!38408)))

(assert (=> d!11047 (= res!32559 (and ((_ is Cons!1427) (toList!690 lt!22766)) (= (_1!1023 (h!2007 (toList!690 lt!22766))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11047 (= (containsKey!125 (toList!690 lt!22766) #b1000000000000000000000000000000000000000000000000000000000000000) e!38408)))

(declare-fun b!58367 () Bool)

(declare-fun e!38409 () Bool)

(assert (=> b!58367 (= e!38408 e!38409)))

(declare-fun res!32560 () Bool)

(assert (=> b!58367 (=> (not res!32560) (not e!38409))))

(assert (=> b!58367 (= res!32560 (and (or (not ((_ is Cons!1427) (toList!690 lt!22766))) (bvsle (_1!1023 (h!2007 (toList!690 lt!22766))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1427) (toList!690 lt!22766)) (bvslt (_1!1023 (h!2007 (toList!690 lt!22766))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!58368 () Bool)

(assert (=> b!58368 (= e!38409 (containsKey!125 (t!4744 (toList!690 lt!22766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!11047 (not res!32559)) b!58367))

(assert (= (and b!58367 res!32560) b!58368))

(declare-fun m!49933 () Bool)

(assert (=> b!58368 m!49933))

(assert (=> d!10645 d!11047))

(declare-fun d!11049 () Bool)

(assert (=> d!11049 (= (apply!65 lt!22879 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1070 (getValueByKey!121 (toList!690 lt!22879) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2535 () Bool)

(assert (= bs!2535 d!11049))

(declare-fun m!49935 () Bool)

(assert (=> bs!2535 m!49935))

(assert (=> bs!2535 m!49935))

(declare-fun m!49937 () Bool)

(assert (=> bs!2535 m!49937))

(assert (=> b!57546 d!11049))

(declare-fun d!11051 () Bool)

(declare-fun e!38410 () Bool)

(assert (=> d!11051 e!38410))

(declare-fun res!32561 () Bool)

(assert (=> d!11051 (=> res!32561 e!38410)))

(declare-fun lt!23451 () Bool)

(assert (=> d!11051 (= res!32561 (not lt!23451))))

(declare-fun lt!23454 () Bool)

(assert (=> d!11051 (= lt!23451 lt!23454)))

(declare-fun lt!23453 () Unit!1484)

(declare-fun e!38411 () Unit!1484)

(assert (=> d!11051 (= lt!23453 e!38411)))

(declare-fun c!7347 () Bool)

(assert (=> d!11051 (= c!7347 lt!23454)))

(assert (=> d!11051 (= lt!23454 (containsKey!125 (toList!690 lt!22813) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!11051 (= (contains!677 lt!22813 (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23451)))

(declare-fun b!58369 () Bool)

(declare-fun lt!23452 () Unit!1484)

(assert (=> b!58369 (= e!38411 lt!23452)))

(assert (=> b!58369 (= lt!23452 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22813) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> b!58369 (isDefined!75 (getValueByKey!121 (toList!690 lt!22813) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58370 () Bool)

(declare-fun Unit!1538 () Unit!1484)

(assert (=> b!58370 (= e!38411 Unit!1538)))

(declare-fun b!58371 () Bool)

(assert (=> b!58371 (= e!38410 (isDefined!75 (getValueByKey!121 (toList!690 lt!22813) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (= (and d!11051 c!7347) b!58369))

(assert (= (and d!11051 (not c!7347)) b!58370))

(assert (= (and d!11051 (not res!32561)) b!58371))

(declare-fun m!49939 () Bool)

(assert (=> d!11051 m!49939))

(declare-fun m!49941 () Bool)

(assert (=> b!58369 m!49941))

(assert (=> b!58369 m!48267))

(assert (=> b!58369 m!48267))

(declare-fun m!49943 () Bool)

(assert (=> b!58369 m!49943))

(assert (=> b!58371 m!48267))

(assert (=> b!58371 m!48267))

(assert (=> b!58371 m!49943))

(assert (=> d!10561 d!11051))

(declare-fun b!58373 () Bool)

(declare-fun e!38412 () Option!127)

(declare-fun e!38413 () Option!127)

(assert (=> b!58373 (= e!38412 e!38413)))

(declare-fun c!7349 () Bool)

(assert (=> b!58373 (= c!7349 (and ((_ is Cons!1427) lt!22814) (not (= (_1!1023 (h!2007 lt!22814)) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun b!58375 () Bool)

(assert (=> b!58375 (= e!38413 None!125)))

(declare-fun b!58374 () Bool)

(assert (=> b!58374 (= e!38413 (getValueByKey!121 (t!4744 lt!22814) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58372 () Bool)

(assert (=> b!58372 (= e!38412 (Some!126 (_2!1023 (h!2007 lt!22814))))))

(declare-fun d!11053 () Bool)

(declare-fun c!7348 () Bool)

(assert (=> d!11053 (= c!7348 (and ((_ is Cons!1427) lt!22814) (= (_1!1023 (h!2007 lt!22814)) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!11053 (= (getValueByKey!121 lt!22814 (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) e!38412)))

(assert (= (and d!11053 c!7348) b!58372))

(assert (= (and d!11053 (not c!7348)) b!58373))

(assert (= (and b!58373 c!7349) b!58374))

(assert (= (and b!58373 (not c!7349)) b!58375))

(declare-fun m!49945 () Bool)

(assert (=> b!58374 m!49945))

(assert (=> d!10561 d!11053))

(declare-fun d!11055 () Bool)

(assert (=> d!11055 (= (getValueByKey!121 lt!22814 (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun lt!23455 () Unit!1484)

(assert (=> d!11055 (= lt!23455 (choose!305 lt!22814 (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun e!38414 () Bool)

(assert (=> d!11055 e!38414))

(declare-fun res!32562 () Bool)

(assert (=> d!11055 (=> (not res!32562) (not e!38414))))

(assert (=> d!11055 (= res!32562 (isStrictlySorted!278 lt!22814))))

(assert (=> d!11055 (= (lemmaContainsTupThenGetReturnValue!41 lt!22814 (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23455)))

(declare-fun b!58376 () Bool)

(declare-fun res!32563 () Bool)

(assert (=> b!58376 (=> (not res!32563) (not e!38414))))

(assert (=> b!58376 (= res!32563 (containsKey!125 lt!22814 (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58377 () Bool)

(assert (=> b!58377 (= e!38414 (contains!681 lt!22814 (tuple2!2025 (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (= (and d!11055 res!32562) b!58376))

(assert (= (and b!58376 res!32563) b!58377))

(assert (=> d!11055 m!48261))

(declare-fun m!49947 () Bool)

(assert (=> d!11055 m!49947))

(declare-fun m!49949 () Bool)

(assert (=> d!11055 m!49949))

(declare-fun m!49951 () Bool)

(assert (=> b!58376 m!49951))

(declare-fun m!49953 () Bool)

(assert (=> b!58377 m!49953))

(assert (=> d!10561 d!11055))

(declare-fun bm!4279 () Bool)

(declare-fun call!4284 () List!1431)

(declare-fun call!4283 () List!1431)

(assert (=> bm!4279 (= call!4284 call!4283)))

(declare-fun bm!4280 () Bool)

(declare-fun call!4282 () List!1431)

(assert (=> bm!4280 (= call!4283 call!4282)))

(declare-fun c!7350 () Bool)

(declare-fun bm!4281 () Bool)

(declare-fun e!38418 () List!1431)

(assert (=> bm!4281 (= call!4282 ($colon$colon!58 e!38418 (ite c!7350 (h!2007 (toList!690 lt!22754)) (tuple2!2025 (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun c!7352 () Bool)

(assert (=> bm!4281 (= c!7352 c!7350)))

(declare-fun b!58378 () Bool)

(declare-fun e!38415 () Bool)

(declare-fun lt!23456 () List!1431)

(assert (=> b!58378 (= e!38415 (contains!681 lt!23456 (tuple2!2025 (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58379 () Bool)

(declare-fun e!38419 () List!1431)

(declare-fun e!38416 () List!1431)

(assert (=> b!58379 (= e!38419 e!38416)))

(declare-fun c!7353 () Bool)

(assert (=> b!58379 (= c!7353 (and ((_ is Cons!1427) (toList!690 lt!22754)) (= (_1!1023 (h!2007 (toList!690 lt!22754))) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58380 () Bool)

(declare-fun e!38417 () List!1431)

(assert (=> b!58380 (= e!38417 call!4284)))

(declare-fun b!58381 () Bool)

(assert (=> b!58381 (= e!38419 call!4282)))

(declare-fun b!58382 () Bool)

(assert (=> b!58382 (= e!38417 call!4284)))

(declare-fun b!58383 () Bool)

(declare-fun res!32564 () Bool)

(assert (=> b!58383 (=> (not res!32564) (not e!38415))))

(assert (=> b!58383 (= res!32564 (containsKey!125 lt!23456 (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58384 () Bool)

(declare-fun c!7351 () Bool)

(assert (=> b!58384 (= c!7351 (and ((_ is Cons!1427) (toList!690 lt!22754)) (bvsgt (_1!1023 (h!2007 (toList!690 lt!22754))) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> b!58384 (= e!38416 e!38417)))

(declare-fun b!58385 () Bool)

(assert (=> b!58385 (= e!38418 (insertStrictlySorted!44 (t!4744 (toList!690 lt!22754)) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58386 () Bool)

(assert (=> b!58386 (= e!38416 call!4283)))

(declare-fun d!11057 () Bool)

(assert (=> d!11057 e!38415))

(declare-fun res!32565 () Bool)

(assert (=> d!11057 (=> (not res!32565) (not e!38415))))

(assert (=> d!11057 (= res!32565 (isStrictlySorted!278 lt!23456))))

(assert (=> d!11057 (= lt!23456 e!38419)))

(assert (=> d!11057 (= c!7350 (and ((_ is Cons!1427) (toList!690 lt!22754)) (bvslt (_1!1023 (h!2007 (toList!690 lt!22754))) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!11057 (isStrictlySorted!278 (toList!690 lt!22754))))

(assert (=> d!11057 (= (insertStrictlySorted!44 (toList!690 lt!22754) (_1!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23456)))

(declare-fun b!58387 () Bool)

(assert (=> b!58387 (= e!38418 (ite c!7353 (t!4744 (toList!690 lt!22754)) (ite c!7351 (Cons!1427 (h!2007 (toList!690 lt!22754)) (t!4744 (toList!690 lt!22754))) Nil!1428)))))

(assert (= (and d!11057 c!7350) b!58381))

(assert (= (and d!11057 (not c!7350)) b!58379))

(assert (= (and b!58379 c!7353) b!58386))

(assert (= (and b!58379 (not c!7353)) b!58384))

(assert (= (and b!58384 c!7351) b!58380))

(assert (= (and b!58384 (not c!7351)) b!58382))

(assert (= (or b!58380 b!58382) bm!4279))

(assert (= (or b!58386 bm!4279) bm!4280))

(assert (= (or b!58381 bm!4280) bm!4281))

(assert (= (and bm!4281 c!7352) b!58385))

(assert (= (and bm!4281 (not c!7352)) b!58387))

(assert (= (and d!11057 res!32565) b!58383))

(assert (= (and b!58383 res!32564) b!58378))

(declare-fun m!49955 () Bool)

(assert (=> b!58383 m!49955))

(declare-fun m!49957 () Bool)

(assert (=> b!58378 m!49957))

(declare-fun m!49959 () Bool)

(assert (=> b!58385 m!49959))

(declare-fun m!49961 () Bool)

(assert (=> bm!4281 m!49961))

(declare-fun m!49963 () Bool)

(assert (=> d!11057 m!49963))

(declare-fun m!49965 () Bool)

(assert (=> d!11057 m!49965))

(assert (=> d!10561 d!11057))

(declare-fun d!11059 () Bool)

(assert (=> d!11059 (= (size!1998 newMap!16) (bvadd (_size!354 newMap!16) (bvsdiv (bvadd (extraKeys!1912 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!57572 d!11059))

(declare-fun b!58388 () Bool)

(declare-fun e!38422 () Bool)

(declare-fun call!4285 () Bool)

(assert (=> b!58388 (= e!38422 call!4285)))

(declare-fun d!11061 () Bool)

(declare-fun res!32567 () Bool)

(declare-fun e!38423 () Bool)

(assert (=> d!11061 (=> res!32567 e!38423)))

(assert (=> d!11061 (= res!32567 (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 (_2!1022 lt!22687)))))))

(assert (=> d!11061 (= (arrayNoDuplicates!0 (_keys!3640 (_2!1022 lt!22687)) #b00000000000000000000000000000000 Nil!1427) e!38423)))

(declare-fun b!58389 () Bool)

(declare-fun e!38421 () Bool)

(assert (=> b!58389 (= e!38421 (contains!680 Nil!1427 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000)))))

(declare-fun b!58390 () Bool)

(declare-fun e!38420 () Bool)

(assert (=> b!58390 (= e!38420 e!38422)))

(declare-fun c!7354 () Bool)

(assert (=> b!58390 (= c!7354 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000)))))

(declare-fun b!58391 () Bool)

(assert (=> b!58391 (= e!38422 call!4285)))

(declare-fun b!58392 () Bool)

(assert (=> b!58392 (= e!38423 e!38420)))

(declare-fun res!32566 () Bool)

(assert (=> b!58392 (=> (not res!32566) (not e!38420))))

(assert (=> b!58392 (= res!32566 (not e!38421))))

(declare-fun res!32568 () Bool)

(assert (=> b!58392 (=> (not res!32568) (not e!38421))))

(assert (=> b!58392 (= res!32568 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000)))))

(declare-fun bm!4282 () Bool)

(assert (=> bm!4282 (= call!4285 (arrayNoDuplicates!0 (_keys!3640 (_2!1022 lt!22687)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!7354 (Cons!1426 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000) Nil!1427) Nil!1427)))))

(assert (= (and d!11061 (not res!32567)) b!58392))

(assert (= (and b!58392 res!32568) b!58389))

(assert (= (and b!58392 res!32566) b!58390))

(assert (= (and b!58390 c!7354) b!58391))

(assert (= (and b!58390 (not c!7354)) b!58388))

(assert (= (or b!58391 b!58388) bm!4282))

(assert (=> b!58389 m!49005))

(assert (=> b!58389 m!49005))

(declare-fun m!49967 () Bool)

(assert (=> b!58389 m!49967))

(assert (=> b!58390 m!49005))

(assert (=> b!58390 m!49005))

(assert (=> b!58390 m!49007))

(assert (=> b!58392 m!49005))

(assert (=> b!58392 m!49005))

(assert (=> b!58392 m!49007))

(assert (=> bm!4282 m!49005))

(declare-fun m!49969 () Bool)

(assert (=> bm!4282 m!49969))

(assert (=> b!57562 d!11061))

(assert (=> b!57696 d!10633))

(declare-fun d!11063 () Bool)

(declare-fun e!38424 () Bool)

(assert (=> d!11063 e!38424))

(declare-fun res!32569 () Bool)

(assert (=> d!11063 (=> res!32569 e!38424)))

(declare-fun lt!23457 () Bool)

(assert (=> d!11063 (= res!32569 (not lt!23457))))

(declare-fun lt!23460 () Bool)

(assert (=> d!11063 (= lt!23457 lt!23460)))

(declare-fun lt!23459 () Unit!1484)

(declare-fun e!38425 () Unit!1484)

(assert (=> d!11063 (= lt!23459 e!38425)))

(declare-fun c!7355 () Bool)

(assert (=> d!11063 (= c!7355 lt!23460)))

(assert (=> d!11063 (= lt!23460 (containsKey!125 (toList!690 lt!22857) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!11063 (= (contains!677 lt!22857 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) lt!23457)))

(declare-fun b!58393 () Bool)

(declare-fun lt!23458 () Unit!1484)

(assert (=> b!58393 (= e!38425 lt!23458)))

(assert (=> b!58393 (= lt!23458 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22857) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!58393 (isDefined!75 (getValueByKey!121 (toList!690 lt!22857) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!58394 () Bool)

(declare-fun Unit!1539 () Unit!1484)

(assert (=> b!58394 (= e!38425 Unit!1539)))

(declare-fun b!58395 () Bool)

(assert (=> b!58395 (= e!38424 (isDefined!75 (getValueByKey!121 (toList!690 lt!22857) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!11063 c!7355) b!58393))

(assert (= (and d!11063 (not c!7355)) b!58394))

(assert (= (and d!11063 (not res!32569)) b!58395))

(assert (=> d!11063 m!48317))

(declare-fun m!49971 () Bool)

(assert (=> d!11063 m!49971))

(assert (=> b!58393 m!48317))

(declare-fun m!49973 () Bool)

(assert (=> b!58393 m!49973))

(assert (=> b!58393 m!48317))

(assert (=> b!58393 m!49493))

(assert (=> b!58393 m!49493))

(declare-fun m!49975 () Bool)

(assert (=> b!58393 m!49975))

(assert (=> b!58395 m!48317))

(assert (=> b!58395 m!49493))

(assert (=> b!58395 m!49493))

(assert (=> b!58395 m!49975))

(assert (=> b!57516 d!11063))

(declare-fun b!58396 () Bool)

(declare-fun e!38428 () Bool)

(declare-fun call!4286 () Bool)

(assert (=> b!58396 (= e!38428 call!4286)))

(declare-fun d!11065 () Bool)

(declare-fun res!32571 () Bool)

(declare-fun e!38429 () Bool)

(assert (=> d!11065 (=> res!32571 e!38429)))

(assert (=> d!11065 (= res!32571 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!11065 (= (arrayNoDuplicates!0 (_keys!3640 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!7099 (Cons!1426 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) Nil!1427) Nil!1427)) e!38429)))

(declare-fun b!58397 () Bool)

(declare-fun e!38427 () Bool)

(assert (=> b!58397 (= e!38427 (contains!680 (ite c!7099 (Cons!1426 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) Nil!1427) Nil!1427) (select (arr!1762 (_keys!3640 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!58398 () Bool)

(declare-fun e!38426 () Bool)

(assert (=> b!58398 (= e!38426 e!38428)))

(declare-fun c!7356 () Bool)

(assert (=> b!58398 (= c!7356 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!58399 () Bool)

(assert (=> b!58399 (= e!38428 call!4286)))

(declare-fun b!58400 () Bool)

(assert (=> b!58400 (= e!38429 e!38426)))

(declare-fun res!32570 () Bool)

(assert (=> b!58400 (=> (not res!32570) (not e!38426))))

(assert (=> b!58400 (= res!32570 (not e!38427))))

(declare-fun res!32572 () Bool)

(assert (=> b!58400 (=> (not res!32572) (not e!38427))))

(assert (=> b!58400 (= res!32572 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!4283 () Bool)

(assert (=> bm!4283 (= call!4286 (arrayNoDuplicates!0 (_keys!3640 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!7356 (Cons!1426 (select (arr!1762 (_keys!3640 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!7099 (Cons!1426 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) Nil!1427) Nil!1427)) (ite c!7099 (Cons!1426 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000) Nil!1427) Nil!1427))))))

(assert (= (and d!11065 (not res!32571)) b!58400))

(assert (= (and b!58400 res!32572) b!58397))

(assert (= (and b!58400 res!32570) b!58398))

(assert (= (and b!58398 c!7356) b!58399))

(assert (= (and b!58398 (not c!7356)) b!58396))

(assert (= (or b!58399 b!58396) bm!4283))

(assert (=> b!58397 m!49589))

(assert (=> b!58397 m!49589))

(declare-fun m!49977 () Bool)

(assert (=> b!58397 m!49977))

(assert (=> b!58398 m!49589))

(assert (=> b!58398 m!49589))

(assert (=> b!58398 m!49591))

(assert (=> b!58400 m!49589))

(assert (=> b!58400 m!49589))

(assert (=> b!58400 m!49591))

(assert (=> bm!4283 m!49589))

(declare-fun m!49979 () Bool)

(assert (=> bm!4283 m!49979))

(assert (=> bm!4162 d!11065))

(assert (=> b!57432 d!10539))

(declare-fun d!11067 () Bool)

(declare-fun e!38430 () Bool)

(assert (=> d!11067 e!38430))

(declare-fun res!32573 () Bool)

(assert (=> d!11067 (=> res!32573 e!38430)))

(declare-fun lt!23461 () Bool)

(assert (=> d!11067 (= res!32573 (not lt!23461))))

(declare-fun lt!23464 () Bool)

(assert (=> d!11067 (= lt!23461 lt!23464)))

(declare-fun lt!23463 () Unit!1484)

(declare-fun e!38431 () Unit!1484)

(assert (=> d!11067 (= lt!23463 e!38431)))

(declare-fun c!7357 () Bool)

(assert (=> d!11067 (= c!7357 lt!23464)))

(assert (=> d!11067 (= lt!23464 (containsKey!125 (toList!690 lt!22879) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11067 (= (contains!677 lt!22879 #b0000000000000000000000000000000000000000000000000000000000000000) lt!23461)))

(declare-fun b!58401 () Bool)

(declare-fun lt!23462 () Unit!1484)

(assert (=> b!58401 (= e!38431 lt!23462)))

(assert (=> b!58401 (= lt!23462 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22879) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!58401 (isDefined!75 (getValueByKey!121 (toList!690 lt!22879) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58402 () Bool)

(declare-fun Unit!1540 () Unit!1484)

(assert (=> b!58402 (= e!38431 Unit!1540)))

(declare-fun b!58403 () Bool)

(assert (=> b!58403 (= e!38430 (isDefined!75 (getValueByKey!121 (toList!690 lt!22879) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!11067 c!7357) b!58401))

(assert (= (and d!11067 (not c!7357)) b!58402))

(assert (= (and d!11067 (not res!32573)) b!58403))

(declare-fun m!49981 () Bool)

(assert (=> d!11067 m!49981))

(declare-fun m!49983 () Bool)

(assert (=> b!58401 m!49983))

(assert (=> b!58401 m!49935))

(assert (=> b!58401 m!49935))

(declare-fun m!49985 () Bool)

(assert (=> b!58401 m!49985))

(assert (=> b!58403 m!49935))

(assert (=> b!58403 m!49935))

(assert (=> b!58403 m!49985))

(assert (=> bm!4182 d!11067))

(declare-fun d!11069 () Bool)

(declare-fun e!38432 () Bool)

(assert (=> d!11069 e!38432))

(declare-fun res!32574 () Bool)

(assert (=> d!11069 (=> res!32574 e!38432)))

(declare-fun lt!23465 () Bool)

(assert (=> d!11069 (= res!32574 (not lt!23465))))

(declare-fun lt!23468 () Bool)

(assert (=> d!11069 (= lt!23465 lt!23468)))

(declare-fun lt!23467 () Unit!1484)

(declare-fun e!38433 () Unit!1484)

(assert (=> d!11069 (= lt!23467 e!38433)))

(declare-fun c!7358 () Bool)

(assert (=> d!11069 (= c!7358 lt!23468)))

(assert (=> d!11069 (= lt!23468 (containsKey!125 (toList!690 lt!22885) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!11069 (= (contains!677 lt!22885 (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) lt!23465)))

(declare-fun b!58404 () Bool)

(declare-fun lt!23466 () Unit!1484)

(assert (=> b!58404 (= e!38433 lt!23466)))

(assert (=> b!58404 (= lt!23466 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22885) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> b!58404 (isDefined!75 (getValueByKey!121 (toList!690 lt!22885) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58405 () Bool)

(declare-fun Unit!1541 () Unit!1484)

(assert (=> b!58405 (= e!38433 Unit!1541)))

(declare-fun b!58406 () Bool)

(assert (=> b!58406 (= e!38432 (isDefined!75 (getValueByKey!121 (toList!690 lt!22885) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(assert (= (and d!11069 c!7358) b!58404))

(assert (= (and d!11069 (not c!7358)) b!58405))

(assert (= (and d!11069 (not res!32574)) b!58406))

(declare-fun m!49987 () Bool)

(assert (=> d!11069 m!49987))

(declare-fun m!49989 () Bool)

(assert (=> b!58404 m!49989))

(assert (=> b!58404 m!48491))

(assert (=> b!58404 m!48491))

(declare-fun m!49991 () Bool)

(assert (=> b!58404 m!49991))

(assert (=> b!58406 m!48491))

(assert (=> b!58406 m!48491))

(assert (=> b!58406 m!49991))

(assert (=> d!10611 d!11069))

(declare-fun b!58408 () Bool)

(declare-fun e!38434 () Option!127)

(declare-fun e!38435 () Option!127)

(assert (=> b!58408 (= e!38434 e!38435)))

(declare-fun c!7360 () Bool)

(assert (=> b!58408 (= c!7360 (and ((_ is Cons!1427) lt!22886) (not (= (_1!1023 (h!2007 lt!22886)) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))))

(declare-fun b!58410 () Bool)

(assert (=> b!58410 (= e!38435 None!125)))

(declare-fun b!58409 () Bool)

(assert (=> b!58409 (= e!38435 (getValueByKey!121 (t!4744 lt!22886) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58407 () Bool)

(assert (=> b!58407 (= e!38434 (Some!126 (_2!1023 (h!2007 lt!22886))))))

(declare-fun d!11071 () Bool)

(declare-fun c!7359 () Bool)

(assert (=> d!11071 (= c!7359 (and ((_ is Cons!1427) lt!22886) (= (_1!1023 (h!2007 lt!22886)) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(assert (=> d!11071 (= (getValueByKey!121 lt!22886 (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) e!38434)))

(assert (= (and d!11071 c!7359) b!58407))

(assert (= (and d!11071 (not c!7359)) b!58408))

(assert (= (and b!58408 c!7360) b!58409))

(assert (= (and b!58408 (not c!7360)) b!58410))

(declare-fun m!49993 () Bool)

(assert (=> b!58409 m!49993))

(assert (=> d!10611 d!11071))

(declare-fun d!11073 () Bool)

(assert (=> d!11073 (= (getValueByKey!121 lt!22886 (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) (Some!126 (_2!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun lt!23469 () Unit!1484)

(assert (=> d!11073 (= lt!23469 (choose!305 lt!22886 (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (_2!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun e!38436 () Bool)

(assert (=> d!11073 e!38436))

(declare-fun res!32575 () Bool)

(assert (=> d!11073 (=> (not res!32575) (not e!38436))))

(assert (=> d!11073 (= res!32575 (isStrictlySorted!278 lt!22886))))

(assert (=> d!11073 (= (lemmaContainsTupThenGetReturnValue!41 lt!22886 (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (_2!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) lt!23469)))

(declare-fun b!58411 () Bool)

(declare-fun res!32576 () Bool)

(assert (=> b!58411 (=> (not res!32576) (not e!38436))))

(assert (=> b!58411 (= res!32576 (containsKey!125 lt!22886 (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58412 () Bool)

(assert (=> b!58412 (= e!38436 (contains!681 lt!22886 (tuple2!2025 (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (_2!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(assert (= (and d!11073 res!32575) b!58411))

(assert (= (and b!58411 res!32576) b!58412))

(assert (=> d!11073 m!48485))

(declare-fun m!49995 () Bool)

(assert (=> d!11073 m!49995))

(declare-fun m!49997 () Bool)

(assert (=> d!11073 m!49997))

(declare-fun m!49999 () Bool)

(assert (=> b!58411 m!49999))

(declare-fun m!50001 () Bool)

(assert (=> b!58412 m!50001))

(assert (=> d!10611 d!11073))

(declare-fun bm!4284 () Bool)

(declare-fun call!4289 () List!1431)

(declare-fun call!4288 () List!1431)

(assert (=> bm!4284 (= call!4289 call!4288)))

(declare-fun bm!4285 () Bool)

(declare-fun call!4287 () List!1431)

(assert (=> bm!4285 (= call!4288 call!4287)))

(declare-fun e!38440 () List!1431)

(declare-fun c!7361 () Bool)

(declare-fun bm!4286 () Bool)

(assert (=> bm!4286 (= call!4287 ($colon$colon!58 e!38440 (ite c!7361 (h!2007 (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157)))) (tuple2!2025 (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (_2!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))))

(declare-fun c!7363 () Bool)

(assert (=> bm!4286 (= c!7363 c!7361)))

(declare-fun b!58413 () Bool)

(declare-fun lt!23470 () List!1431)

(declare-fun e!38437 () Bool)

(assert (=> b!58413 (= e!38437 (contains!681 lt!23470 (tuple2!2025 (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (_2!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun b!58414 () Bool)

(declare-fun e!38441 () List!1431)

(declare-fun e!38438 () List!1431)

(assert (=> b!58414 (= e!38441 e!38438)))

(declare-fun c!7364 () Bool)

(assert (=> b!58414 (= c!7364 (and ((_ is Cons!1427) (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157)))) (= (_1!1023 (h!2007 (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157))))) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun b!58415 () Bool)

(declare-fun e!38439 () List!1431)

(assert (=> b!58415 (= e!38439 call!4289)))

(declare-fun b!58416 () Bool)

(assert (=> b!58416 (= e!38441 call!4287)))

(declare-fun b!58417 () Bool)

(assert (=> b!58417 (= e!38439 call!4289)))

(declare-fun b!58418 () Bool)

(declare-fun res!32577 () Bool)

(assert (=> b!58418 (=> (not res!32577) (not e!38437))))

(assert (=> b!58418 (= res!32577 (containsKey!125 lt!23470 (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun c!7362 () Bool)

(declare-fun b!58419 () Bool)

(assert (=> b!58419 (= c!7362 (and ((_ is Cons!1427) (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157)))) (bvsgt (_1!1023 (h!2007 (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157))))) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(assert (=> b!58419 (= e!38438 e!38439)))

(declare-fun b!58420 () Bool)

(assert (=> b!58420 (= e!38440 (insertStrictlySorted!44 (t!4744 (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157)))) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (_2!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58421 () Bool)

(assert (=> b!58421 (= e!38438 call!4288)))

(declare-fun d!11075 () Bool)

(assert (=> d!11075 e!38437))

(declare-fun res!32578 () Bool)

(assert (=> d!11075 (=> (not res!32578) (not e!38437))))

(assert (=> d!11075 (= res!32578 (isStrictlySorted!278 lt!23470))))

(assert (=> d!11075 (= lt!23470 e!38441)))

(assert (=> d!11075 (= c!7361 (and ((_ is Cons!1427) (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157)))) (bvslt (_1!1023 (h!2007 (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157))))) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(assert (=> d!11075 (isStrictlySorted!278 (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157))))))

(assert (=> d!11075 (= (insertStrictlySorted!44 (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157))) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (_2!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) lt!23470)))

(declare-fun b!58422 () Bool)

(assert (=> b!58422 (= e!38440 (ite c!7364 (t!4744 (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157)))) (ite c!7362 (Cons!1427 (h!2007 (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157)))) (t!4744 (toList!690 (ite c!7083 call!4160 (ite c!7081 call!4158 call!4157))))) Nil!1428)))))

(assert (= (and d!11075 c!7361) b!58416))

(assert (= (and d!11075 (not c!7361)) b!58414))

(assert (= (and b!58414 c!7364) b!58421))

(assert (= (and b!58414 (not c!7364)) b!58419))

(assert (= (and b!58419 c!7362) b!58415))

(assert (= (and b!58419 (not c!7362)) b!58417))

(assert (= (or b!58415 b!58417) bm!4284))

(assert (= (or b!58421 bm!4284) bm!4285))

(assert (= (or b!58416 bm!4285) bm!4286))

(assert (= (and bm!4286 c!7363) b!58420))

(assert (= (and bm!4286 (not c!7363)) b!58422))

(assert (= (and d!11075 res!32578) b!58418))

(assert (= (and b!58418 res!32577) b!58413))

(declare-fun m!50003 () Bool)

(assert (=> b!58418 m!50003))

(declare-fun m!50005 () Bool)

(assert (=> b!58413 m!50005))

(declare-fun m!50007 () Bool)

(assert (=> b!58420 m!50007))

(declare-fun m!50009 () Bool)

(assert (=> bm!4286 m!50009))

(declare-fun m!50011 () Bool)

(assert (=> d!11075 m!50011))

(declare-fun m!50013 () Bool)

(assert (=> d!11075 m!50013))

(assert (=> d!10611 d!11075))

(declare-fun d!11077 () Bool)

(assert (=> d!11077 (= (get!1070 (getValueByKey!121 (toList!690 lt!22747) lt!22745)) (v!2367 (getValueByKey!121 (toList!690 lt!22747) lt!22745)))))

(assert (=> d!10567 d!11077))

(declare-fun b!58424 () Bool)

(declare-fun e!38442 () Option!127)

(declare-fun e!38443 () Option!127)

(assert (=> b!58424 (= e!38442 e!38443)))

(declare-fun c!7366 () Bool)

(assert (=> b!58424 (= c!7366 (and ((_ is Cons!1427) (toList!690 lt!22747)) (not (= (_1!1023 (h!2007 (toList!690 lt!22747))) lt!22745))))))

(declare-fun b!58426 () Bool)

(assert (=> b!58426 (= e!38443 None!125)))

(declare-fun b!58425 () Bool)

(assert (=> b!58425 (= e!38443 (getValueByKey!121 (t!4744 (toList!690 lt!22747)) lt!22745))))

(declare-fun b!58423 () Bool)

(assert (=> b!58423 (= e!38442 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22747)))))))

(declare-fun d!11079 () Bool)

(declare-fun c!7365 () Bool)

(assert (=> d!11079 (= c!7365 (and ((_ is Cons!1427) (toList!690 lt!22747)) (= (_1!1023 (h!2007 (toList!690 lt!22747))) lt!22745)))))

(assert (=> d!11079 (= (getValueByKey!121 (toList!690 lt!22747) lt!22745) e!38442)))

(assert (= (and d!11079 c!7365) b!58423))

(assert (= (and d!11079 (not c!7365)) b!58424))

(assert (= (and b!58424 c!7366) b!58425))

(assert (= (and b!58424 (not c!7366)) b!58426))

(declare-fun m!50015 () Bool)

(assert (=> b!58425 m!50015))

(assert (=> d!10567 d!11079))

(declare-fun d!11081 () Bool)

(assert (=> d!11081 (= (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22764)) (v!2367 (getValueByKey!121 (toList!690 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22764)))))

(assert (=> d!10571 d!11081))

(declare-fun b!58428 () Bool)

(declare-fun e!38444 () Option!127)

(declare-fun e!38445 () Option!127)

(assert (=> b!58428 (= e!38444 e!38445)))

(declare-fun c!7368 () Bool)

(assert (=> b!58428 (= c!7368 (and ((_ is Cons!1427) (toList!690 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))) (not (= (_1!1023 (h!2007 (toList!690 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))) lt!22764))))))

(declare-fun b!58430 () Bool)

(assert (=> b!58430 (= e!38445 None!125)))

(declare-fun b!58429 () Bool)

(assert (=> b!58429 (= e!38445 (getValueByKey!121 (t!4744 (toList!690 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))) lt!22764))))

(declare-fun b!58427 () Bool)

(assert (=> b!58427 (= e!38444 (Some!126 (_2!1023 (h!2007 (toList!690 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))))))

(declare-fun c!7367 () Bool)

(declare-fun d!11083 () Bool)

(assert (=> d!11083 (= c!7367 (and ((_ is Cons!1427) (toList!690 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))) (= (_1!1023 (h!2007 (toList!690 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))))) lt!22764)))))

(assert (=> d!11083 (= (getValueByKey!121 (toList!690 (+!80 lt!22752 (tuple2!2025 lt!22759 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22764) e!38444)))

(assert (= (and d!11083 c!7367) b!58427))

(assert (= (and d!11083 (not c!7367)) b!58428))

(assert (= (and b!58428 c!7368) b!58429))

(assert (= (and b!58428 (not c!7368)) b!58430))

(declare-fun m!50017 () Bool)

(assert (=> b!58429 m!50017))

(assert (=> d!10571 d!11083))

(assert (=> bm!4167 d!10591))

(declare-fun d!11085 () Bool)

(declare-fun e!38446 () Bool)

(assert (=> d!11085 e!38446))

(declare-fun res!32579 () Bool)

(assert (=> d!11085 (=> res!32579 e!38446)))

(declare-fun lt!23471 () Bool)

(assert (=> d!11085 (= res!32579 (not lt!23471))))

(declare-fun lt!23474 () Bool)

(assert (=> d!11085 (= lt!23471 lt!23474)))

(declare-fun lt!23473 () Unit!1484)

(declare-fun e!38447 () Unit!1484)

(assert (=> d!11085 (= lt!23473 e!38447)))

(declare-fun c!7369 () Bool)

(assert (=> d!11085 (= c!7369 lt!23474)))

(assert (=> d!11085 (= lt!23474 (containsKey!125 (toList!690 lt!22817) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> d!11085 (= (contains!677 lt!22817 (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23471)))

(declare-fun b!58431 () Bool)

(declare-fun lt!23472 () Unit!1484)

(assert (=> b!58431 (= e!38447 lt!23472)))

(assert (=> b!58431 (= lt!23472 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22817) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(assert (=> b!58431 (isDefined!75 (getValueByKey!121 (toList!690 lt!22817) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58432 () Bool)

(declare-fun Unit!1542 () Unit!1484)

(assert (=> b!58432 (= e!38447 Unit!1542)))

(declare-fun b!58433 () Bool)

(assert (=> b!58433 (= e!38446 (isDefined!75 (getValueByKey!121 (toList!690 lt!22817) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (= (and d!11085 c!7369) b!58431))

(assert (= (and d!11085 (not c!7369)) b!58432))

(assert (= (and d!11085 (not res!32579)) b!58433))

(declare-fun m!50019 () Bool)

(assert (=> d!11085 m!50019))

(declare-fun m!50021 () Bool)

(assert (=> b!58431 m!50021))

(assert (=> b!58431 m!48279))

(assert (=> b!58431 m!48279))

(declare-fun m!50023 () Bool)

(assert (=> b!58431 m!50023))

(assert (=> b!58433 m!48279))

(assert (=> b!58433 m!48279))

(assert (=> b!58433 m!50023))

(assert (=> d!10563 d!11085))

(declare-fun b!58435 () Bool)

(declare-fun e!38448 () Option!127)

(declare-fun e!38449 () Option!127)

(assert (=> b!58435 (= e!38448 e!38449)))

(declare-fun c!7371 () Bool)

(assert (=> b!58435 (= c!7371 (and ((_ is Cons!1427) lt!22818) (not (= (_1!1023 (h!2007 lt!22818)) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun b!58437 () Bool)

(assert (=> b!58437 (= e!38449 None!125)))

(declare-fun b!58436 () Bool)

(assert (=> b!58436 (= e!38449 (getValueByKey!121 (t!4744 lt!22818) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58434 () Bool)

(assert (=> b!58434 (= e!38448 (Some!126 (_2!1023 (h!2007 lt!22818))))))

(declare-fun c!7370 () Bool)

(declare-fun d!11087 () Bool)

(assert (=> d!11087 (= c!7370 (and ((_ is Cons!1427) lt!22818) (= (_1!1023 (h!2007 lt!22818)) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!11087 (= (getValueByKey!121 lt!22818 (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) e!38448)))

(assert (= (and d!11087 c!7370) b!58434))

(assert (= (and d!11087 (not c!7370)) b!58435))

(assert (= (and b!58435 c!7371) b!58436))

(assert (= (and b!58435 (not c!7371)) b!58437))

(declare-fun m!50025 () Bool)

(assert (=> b!58436 m!50025))

(assert (=> d!10563 d!11087))

(declare-fun d!11089 () Bool)

(assert (=> d!11089 (= (getValueByKey!121 lt!22818 (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) (Some!126 (_2!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun lt!23475 () Unit!1484)

(assert (=> d!11089 (= lt!23475 (choose!305 lt!22818 (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun e!38450 () Bool)

(assert (=> d!11089 e!38450))

(declare-fun res!32580 () Bool)

(assert (=> d!11089 (=> (not res!32580) (not e!38450))))

(assert (=> d!11089 (= res!32580 (isStrictlySorted!278 lt!22818))))

(assert (=> d!11089 (= (lemmaContainsTupThenGetReturnValue!41 lt!22818 (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23475)))

(declare-fun b!58438 () Bool)

(declare-fun res!32581 () Bool)

(assert (=> b!58438 (=> (not res!32581) (not e!38450))))

(assert (=> b!58438 (= res!32581 (containsKey!125 lt!22818 (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58439 () Bool)

(assert (=> b!58439 (= e!38450 (contains!681 lt!22818 (tuple2!2025 (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (= (and d!11089 res!32580) b!58438))

(assert (= (and b!58438 res!32581) b!58439))

(assert (=> d!11089 m!48273))

(declare-fun m!50027 () Bool)

(assert (=> d!11089 m!50027))

(declare-fun m!50029 () Bool)

(assert (=> d!11089 m!50029))

(declare-fun m!50031 () Bool)

(assert (=> b!58438 m!50031))

(declare-fun m!50033 () Bool)

(assert (=> b!58439 m!50033))

(assert (=> d!10563 d!11089))

(declare-fun bm!4287 () Bool)

(declare-fun call!4292 () List!1431)

(declare-fun call!4291 () List!1431)

(assert (=> bm!4287 (= call!4292 call!4291)))

(declare-fun bm!4288 () Bool)

(declare-fun call!4290 () List!1431)

(assert (=> bm!4288 (= call!4291 call!4290)))

(declare-fun bm!4289 () Bool)

(declare-fun c!7372 () Bool)

(declare-fun e!38454 () List!1431)

(assert (=> bm!4289 (= call!4290 ($colon$colon!58 e!38454 (ite c!7372 (h!2007 (toList!690 lt!22747)) (tuple2!2025 (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun c!7374 () Bool)

(assert (=> bm!4289 (= c!7374 c!7372)))

(declare-fun lt!23476 () List!1431)

(declare-fun b!58440 () Bool)

(declare-fun e!38451 () Bool)

(assert (=> b!58440 (= e!38451 (contains!681 lt!23476 (tuple2!2025 (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58441 () Bool)

(declare-fun e!38455 () List!1431)

(declare-fun e!38452 () List!1431)

(assert (=> b!58441 (= e!38455 e!38452)))

(declare-fun c!7375 () Bool)

(assert (=> b!58441 (= c!7375 (and ((_ is Cons!1427) (toList!690 lt!22747)) (= (_1!1023 (h!2007 (toList!690 lt!22747))) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58442 () Bool)

(declare-fun e!38453 () List!1431)

(assert (=> b!58442 (= e!38453 call!4292)))

(declare-fun b!58443 () Bool)

(assert (=> b!58443 (= e!38455 call!4290)))

(declare-fun b!58444 () Bool)

(assert (=> b!58444 (= e!38453 call!4292)))

(declare-fun b!58445 () Bool)

(declare-fun res!32582 () Bool)

(assert (=> b!58445 (=> (not res!32582) (not e!38451))))

(assert (=> b!58445 (= res!32582 (containsKey!125 lt!23476 (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58446 () Bool)

(declare-fun c!7373 () Bool)

(assert (=> b!58446 (= c!7373 (and ((_ is Cons!1427) (toList!690 lt!22747)) (bvsgt (_1!1023 (h!2007 (toList!690 lt!22747))) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> b!58446 (= e!38452 e!38453)))

(declare-fun b!58447 () Bool)

(assert (=> b!58447 (= e!38454 (insertStrictlySorted!44 (t!4744 (toList!690 lt!22747)) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58448 () Bool)

(assert (=> b!58448 (= e!38452 call!4291)))

(declare-fun d!11091 () Bool)

(assert (=> d!11091 e!38451))

(declare-fun res!32583 () Bool)

(assert (=> d!11091 (=> (not res!32583) (not e!38451))))

(assert (=> d!11091 (= res!32583 (isStrictlySorted!278 lt!23476))))

(assert (=> d!11091 (= lt!23476 e!38455)))

(assert (=> d!11091 (= c!7372 (and ((_ is Cons!1427) (toList!690 lt!22747)) (bvslt (_1!1023 (h!2007 (toList!690 lt!22747))) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!11091 (isStrictlySorted!278 (toList!690 lt!22747))))

(assert (=> d!11091 (= (insertStrictlySorted!44 (toList!690 lt!22747) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))) (_2!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!23476)))

(declare-fun b!58449 () Bool)

(assert (=> b!58449 (= e!38454 (ite c!7375 (t!4744 (toList!690 lt!22747)) (ite c!7373 (Cons!1427 (h!2007 (toList!690 lt!22747)) (t!4744 (toList!690 lt!22747))) Nil!1428)))))

(assert (= (and d!11091 c!7372) b!58443))

(assert (= (and d!11091 (not c!7372)) b!58441))

(assert (= (and b!58441 c!7375) b!58448))

(assert (= (and b!58441 (not c!7375)) b!58446))

(assert (= (and b!58446 c!7373) b!58442))

(assert (= (and b!58446 (not c!7373)) b!58444))

(assert (= (or b!58442 b!58444) bm!4287))

(assert (= (or b!58448 bm!4287) bm!4288))

(assert (= (or b!58443 bm!4288) bm!4289))

(assert (= (and bm!4289 c!7374) b!58447))

(assert (= (and bm!4289 (not c!7374)) b!58449))

(assert (= (and d!11091 res!32583) b!58445))

(assert (= (and b!58445 res!32582) b!58440))

(declare-fun m!50035 () Bool)

(assert (=> b!58445 m!50035))

(declare-fun m!50037 () Bool)

(assert (=> b!58440 m!50037))

(declare-fun m!50039 () Bool)

(assert (=> b!58447 m!50039))

(declare-fun m!50041 () Bool)

(assert (=> bm!4289 m!50041))

(declare-fun m!50043 () Bool)

(assert (=> d!11091 m!50043))

(declare-fun m!50045 () Bool)

(assert (=> d!11091 m!50045))

(assert (=> d!10563 d!11091))

(declare-fun d!11093 () Bool)

(declare-fun e!38456 () Bool)

(assert (=> d!11093 e!38456))

(declare-fun res!32584 () Bool)

(assert (=> d!11093 (=> res!32584 e!38456)))

(declare-fun lt!23477 () Bool)

(assert (=> d!11093 (= res!32584 (not lt!23477))))

(declare-fun lt!23480 () Bool)

(assert (=> d!11093 (= lt!23477 lt!23480)))

(declare-fun lt!23479 () Unit!1484)

(declare-fun e!38457 () Unit!1484)

(assert (=> d!11093 (= lt!23479 e!38457)))

(declare-fun c!7376 () Bool)

(assert (=> d!11093 (= c!7376 lt!23480)))

(assert (=> d!11093 (= lt!23480 (containsKey!125 (toList!690 lt!22879) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!11093 (= (contains!677 lt!22879 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) lt!23477)))

(declare-fun b!58450 () Bool)

(declare-fun lt!23478 () Unit!1484)

(assert (=> b!58450 (= e!38457 lt!23478)))

(assert (=> b!58450 (= lt!23478 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22879) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!58450 (isDefined!75 (getValueByKey!121 (toList!690 lt!22879) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!58451 () Bool)

(declare-fun Unit!1543 () Unit!1484)

(assert (=> b!58451 (= e!38457 Unit!1543)))

(declare-fun b!58452 () Bool)

(assert (=> b!58452 (= e!38456 (isDefined!75 (getValueByKey!121 (toList!690 lt!22879) (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!11093 c!7376) b!58450))

(assert (= (and d!11093 (not c!7376)) b!58451))

(assert (= (and d!11093 (not res!32584)) b!58452))

(assert (=> d!11093 m!48317))

(declare-fun m!50047 () Bool)

(assert (=> d!11093 m!50047))

(assert (=> b!58450 m!48317))

(declare-fun m!50049 () Bool)

(assert (=> b!58450 m!50049))

(assert (=> b!58450 m!48317))

(assert (=> b!58450 m!49613))

(assert (=> b!58450 m!49613))

(declare-fun m!50051 () Bool)

(assert (=> b!58450 m!50051))

(assert (=> b!58452 m!48317))

(assert (=> b!58452 m!49613))

(assert (=> b!58452 m!49613))

(assert (=> b!58452 m!50051))

(assert (=> b!57539 d!11093))

(declare-fun b!58454 () Bool)

(declare-fun e!38460 () ListLongMap!1349)

(declare-fun call!4295 () ListLongMap!1349)

(assert (=> b!58454 (= e!38460 call!4295)))

(declare-fun b!58455 () Bool)

(declare-fun e!38464 () Bool)

(assert (=> b!58455 (= e!38464 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000)))))

(declare-fun b!58456 () Bool)

(declare-fun e!38468 () Bool)

(declare-fun e!38465 () Bool)

(assert (=> b!58456 (= e!38468 e!38465)))

(declare-fun res!32585 () Bool)

(declare-fun call!4294 () Bool)

(assert (=> b!58456 (= res!32585 call!4294)))

(assert (=> b!58456 (=> (not res!32585) (not e!38465))))

(declare-fun b!58457 () Bool)

(declare-fun e!38466 () ListLongMap!1349)

(declare-fun e!38469 () ListLongMap!1349)

(assert (=> b!58457 (= e!38466 e!38469)))

(declare-fun c!7378 () Bool)

(assert (=> b!58457 (= c!7378 (and (not (= (bvand (extraKeys!1912 (_2!1022 lt!22687)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 (_2!1022 lt!22687)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!58458 () Bool)

(declare-fun c!7379 () Bool)

(assert (=> b!58458 (= c!7379 (and (not (= (bvand (extraKeys!1912 (_2!1022 lt!22687)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1912 (_2!1022 lt!22687)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!58458 (= e!38469 e!38460)))

(declare-fun bm!4290 () Bool)

(declare-fun call!4296 () ListLongMap!1349)

(declare-fun call!4298 () ListLongMap!1349)

(assert (=> bm!4290 (= call!4296 call!4298)))

(declare-fun b!58459 () Bool)

(declare-fun e!38459 () Bool)

(declare-fun e!38458 () Bool)

(assert (=> b!58459 (= e!38459 e!38458)))

(declare-fun res!32591 () Bool)

(assert (=> b!58459 (=> (not res!32591) (not e!38458))))

(declare-fun lt!23502 () ListLongMap!1349)

(assert (=> b!58459 (= res!32591 (contains!677 lt!23502 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000)))))

(assert (=> b!58459 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 (_2!1022 lt!22687)))))))

(declare-fun b!58460 () Bool)

(declare-fun e!38467 () Unit!1484)

(declare-fun Unit!1544 () Unit!1484)

(assert (=> b!58460 (= e!38467 Unit!1544)))

(declare-fun b!58461 () Bool)

(declare-fun call!4299 () ListLongMap!1349)

(assert (=> b!58461 (= e!38466 (+!80 call!4299 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (_2!1022 lt!22687)))))))

(declare-fun d!11095 () Bool)

(declare-fun e!38461 () Bool)

(assert (=> d!11095 e!38461))

(declare-fun res!32589 () Bool)

(assert (=> d!11095 (=> (not res!32589) (not e!38461))))

(assert (=> d!11095 (= res!32589 (or (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 (_2!1022 lt!22687)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 (_2!1022 lt!22687)))))))))

(declare-fun lt!23496 () ListLongMap!1349)

(assert (=> d!11095 (= lt!23502 lt!23496)))

(declare-fun lt!23494 () Unit!1484)

(assert (=> d!11095 (= lt!23494 e!38467)))

(declare-fun c!7381 () Bool)

(declare-fun e!38470 () Bool)

(assert (=> d!11095 (= c!7381 e!38470)))

(declare-fun res!32593 () Bool)

(assert (=> d!11095 (=> (not res!32593) (not e!38470))))

(assert (=> d!11095 (= res!32593 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 (_2!1022 lt!22687)))))))

(assert (=> d!11095 (= lt!23496 e!38466)))

(declare-fun c!7380 () Bool)

(assert (=> d!11095 (= c!7380 (and (not (= (bvand (extraKeys!1912 (_2!1022 lt!22687)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1912 (_2!1022 lt!22687)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!11095 (validMask!0 (mask!5894 (_2!1022 lt!22687)))))

(assert (=> d!11095 (= (getCurrentListMap!387 (_keys!3640 (_2!1022 lt!22687)) (_values!2004 (_2!1022 lt!22687)) (mask!5894 (_2!1022 lt!22687)) (extraKeys!1912 (_2!1022 lt!22687)) (zeroValue!1939 (_2!1022 lt!22687)) (minValue!1939 (_2!1022 lt!22687)) #b00000000000000000000000000000000 (defaultEntry!2021 (_2!1022 lt!22687))) lt!23502)))

(declare-fun b!58453 () Bool)

(assert (=> b!58453 (= e!38461 e!38468)))

(declare-fun c!7382 () Bool)

(assert (=> b!58453 (= c!7382 (not (= (bvand (extraKeys!1912 (_2!1022 lt!22687)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!4291 () Bool)

(declare-fun call!4293 () ListLongMap!1349)

(assert (=> bm!4291 (= call!4293 call!4299)))

(declare-fun bm!4292 () Bool)

(assert (=> bm!4292 (= call!4294 (contains!677 lt!23502 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58462 () Bool)

(assert (=> b!58462 (= e!38469 call!4293)))

(declare-fun bm!4293 () Bool)

(assert (=> bm!4293 (= call!4295 call!4296)))

(declare-fun b!58463 () Bool)

(declare-fun res!32588 () Bool)

(assert (=> b!58463 (=> (not res!32588) (not e!38461))))

(assert (=> b!58463 (= res!32588 e!38459)))

(declare-fun res!32586 () Bool)

(assert (=> b!58463 (=> res!32586 e!38459)))

(assert (=> b!58463 (= res!32586 (not e!38464))))

(declare-fun res!32590 () Bool)

(assert (=> b!58463 (=> (not res!32590) (not e!38464))))

(assert (=> b!58463 (= res!32590 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 (_2!1022 lt!22687)))))))

(declare-fun b!58464 () Bool)

(declare-fun e!38463 () Bool)

(declare-fun e!38462 () Bool)

(assert (=> b!58464 (= e!38463 e!38462)))

(declare-fun res!32592 () Bool)

(declare-fun call!4297 () Bool)

(assert (=> b!58464 (= res!32592 call!4297)))

(assert (=> b!58464 (=> (not res!32592) (not e!38462))))

(declare-fun bm!4294 () Bool)

(assert (=> bm!4294 (= call!4299 (+!80 (ite c!7380 call!4298 (ite c!7378 call!4296 call!4295)) (ite (or c!7380 c!7378) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (_2!1022 lt!22687))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (_2!1022 lt!22687))))))))

(declare-fun b!58465 () Bool)

(assert (=> b!58465 (= e!38458 (= (apply!65 lt!23502 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000)) (get!1065 (select (arr!1763 (_values!2004 (_2!1022 lt!22687))) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 (_2!1022 lt!22687)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!58465 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1993 (_values!2004 (_2!1022 lt!22687)))))))

(assert (=> b!58465 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 (_2!1022 lt!22687)))))))

(declare-fun b!58466 () Bool)

(assert (=> b!58466 (= e!38462 (= (apply!65 lt!23502 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1939 (_2!1022 lt!22687))))))

(declare-fun b!58467 () Bool)

(declare-fun res!32587 () Bool)

(assert (=> b!58467 (=> (not res!32587) (not e!38461))))

(assert (=> b!58467 (= res!32587 e!38463)))

(declare-fun c!7377 () Bool)

(assert (=> b!58467 (= c!7377 (not (= (bvand (extraKeys!1912 (_2!1022 lt!22687)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!58468 () Bool)

(assert (=> b!58468 (= e!38460 call!4293)))

(declare-fun b!58469 () Bool)

(assert (=> b!58469 (= e!38463 (not call!4297))))

(declare-fun b!58470 () Bool)

(assert (=> b!58470 (= e!38468 (not call!4294))))

(declare-fun b!58471 () Bool)

(declare-fun lt!23486 () Unit!1484)

(assert (=> b!58471 (= e!38467 lt!23486)))

(declare-fun lt!23492 () ListLongMap!1349)

(assert (=> b!58471 (= lt!23492 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (_2!1022 lt!22687)) (_values!2004 (_2!1022 lt!22687)) (mask!5894 (_2!1022 lt!22687)) (extraKeys!1912 (_2!1022 lt!22687)) (zeroValue!1939 (_2!1022 lt!22687)) (minValue!1939 (_2!1022 lt!22687)) #b00000000000000000000000000000000 (defaultEntry!2021 (_2!1022 lt!22687))))))

(declare-fun lt!23487 () (_ BitVec 64))

(assert (=> b!58471 (= lt!23487 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23485 () (_ BitVec 64))

(assert (=> b!58471 (= lt!23485 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000))))

(declare-fun lt!23489 () Unit!1484)

(assert (=> b!58471 (= lt!23489 (addStillContains!41 lt!23492 lt!23487 (zeroValue!1939 (_2!1022 lt!22687)) lt!23485))))

(assert (=> b!58471 (contains!677 (+!80 lt!23492 (tuple2!2025 lt!23487 (zeroValue!1939 (_2!1022 lt!22687)))) lt!23485)))

(declare-fun lt!23499 () Unit!1484)

(assert (=> b!58471 (= lt!23499 lt!23489)))

(declare-fun lt!23483 () ListLongMap!1349)

(assert (=> b!58471 (= lt!23483 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (_2!1022 lt!22687)) (_values!2004 (_2!1022 lt!22687)) (mask!5894 (_2!1022 lt!22687)) (extraKeys!1912 (_2!1022 lt!22687)) (zeroValue!1939 (_2!1022 lt!22687)) (minValue!1939 (_2!1022 lt!22687)) #b00000000000000000000000000000000 (defaultEntry!2021 (_2!1022 lt!22687))))))

(declare-fun lt!23484 () (_ BitVec 64))

(assert (=> b!58471 (= lt!23484 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23481 () (_ BitVec 64))

(assert (=> b!58471 (= lt!23481 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000))))

(declare-fun lt!23497 () Unit!1484)

(assert (=> b!58471 (= lt!23497 (addApplyDifferent!41 lt!23483 lt!23484 (minValue!1939 (_2!1022 lt!22687)) lt!23481))))

(assert (=> b!58471 (= (apply!65 (+!80 lt!23483 (tuple2!2025 lt!23484 (minValue!1939 (_2!1022 lt!22687)))) lt!23481) (apply!65 lt!23483 lt!23481))))

(declare-fun lt!23482 () Unit!1484)

(assert (=> b!58471 (= lt!23482 lt!23497)))

(declare-fun lt!23488 () ListLongMap!1349)

(assert (=> b!58471 (= lt!23488 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (_2!1022 lt!22687)) (_values!2004 (_2!1022 lt!22687)) (mask!5894 (_2!1022 lt!22687)) (extraKeys!1912 (_2!1022 lt!22687)) (zeroValue!1939 (_2!1022 lt!22687)) (minValue!1939 (_2!1022 lt!22687)) #b00000000000000000000000000000000 (defaultEntry!2021 (_2!1022 lt!22687))))))

(declare-fun lt!23495 () (_ BitVec 64))

(assert (=> b!58471 (= lt!23495 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23500 () (_ BitVec 64))

(assert (=> b!58471 (= lt!23500 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000))))

(declare-fun lt!23491 () Unit!1484)

(assert (=> b!58471 (= lt!23491 (addApplyDifferent!41 lt!23488 lt!23495 (zeroValue!1939 (_2!1022 lt!22687)) lt!23500))))

(assert (=> b!58471 (= (apply!65 (+!80 lt!23488 (tuple2!2025 lt!23495 (zeroValue!1939 (_2!1022 lt!22687)))) lt!23500) (apply!65 lt!23488 lt!23500))))

(declare-fun lt!23493 () Unit!1484)

(assert (=> b!58471 (= lt!23493 lt!23491)))

(declare-fun lt!23490 () ListLongMap!1349)

(assert (=> b!58471 (= lt!23490 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (_2!1022 lt!22687)) (_values!2004 (_2!1022 lt!22687)) (mask!5894 (_2!1022 lt!22687)) (extraKeys!1912 (_2!1022 lt!22687)) (zeroValue!1939 (_2!1022 lt!22687)) (minValue!1939 (_2!1022 lt!22687)) #b00000000000000000000000000000000 (defaultEntry!2021 (_2!1022 lt!22687))))))

(declare-fun lt!23501 () (_ BitVec 64))

(assert (=> b!58471 (= lt!23501 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23498 () (_ BitVec 64))

(assert (=> b!58471 (= lt!23498 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000))))

(assert (=> b!58471 (= lt!23486 (addApplyDifferent!41 lt!23490 lt!23501 (minValue!1939 (_2!1022 lt!22687)) lt!23498))))

(assert (=> b!58471 (= (apply!65 (+!80 lt!23490 (tuple2!2025 lt!23501 (minValue!1939 (_2!1022 lt!22687)))) lt!23498) (apply!65 lt!23490 lt!23498))))

(declare-fun bm!4295 () Bool)

(assert (=> bm!4295 (= call!4297 (contains!677 lt!23502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58472 () Bool)

(assert (=> b!58472 (= e!38470 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (_2!1022 lt!22687))) #b00000000000000000000000000000000)))))

(declare-fun bm!4296 () Bool)

(assert (=> bm!4296 (= call!4298 (getCurrentListMapNoExtraKeys!43 (_keys!3640 (_2!1022 lt!22687)) (_values!2004 (_2!1022 lt!22687)) (mask!5894 (_2!1022 lt!22687)) (extraKeys!1912 (_2!1022 lt!22687)) (zeroValue!1939 (_2!1022 lt!22687)) (minValue!1939 (_2!1022 lt!22687)) #b00000000000000000000000000000000 (defaultEntry!2021 (_2!1022 lt!22687))))))

(declare-fun b!58473 () Bool)

(assert (=> b!58473 (= e!38465 (= (apply!65 lt!23502 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1939 (_2!1022 lt!22687))))))

(assert (= (and d!11095 c!7380) b!58461))

(assert (= (and d!11095 (not c!7380)) b!58457))

(assert (= (and b!58457 c!7378) b!58462))

(assert (= (and b!58457 (not c!7378)) b!58458))

(assert (= (and b!58458 c!7379) b!58468))

(assert (= (and b!58458 (not c!7379)) b!58454))

(assert (= (or b!58468 b!58454) bm!4293))

(assert (= (or b!58462 bm!4293) bm!4290))

(assert (= (or b!58462 b!58468) bm!4291))

(assert (= (or b!58461 bm!4290) bm!4296))

(assert (= (or b!58461 bm!4291) bm!4294))

(assert (= (and d!11095 res!32593) b!58472))

(assert (= (and d!11095 c!7381) b!58471))

(assert (= (and d!11095 (not c!7381)) b!58460))

(assert (= (and d!11095 res!32589) b!58463))

(assert (= (and b!58463 res!32590) b!58455))

(assert (= (and b!58463 (not res!32586)) b!58459))

(assert (= (and b!58459 res!32591) b!58465))

(assert (= (and b!58463 res!32588) b!58467))

(assert (= (and b!58467 c!7377) b!58464))

(assert (= (and b!58467 (not c!7377)) b!58469))

(assert (= (and b!58464 res!32592) b!58466))

(assert (= (or b!58464 b!58469) bm!4295))

(assert (= (and b!58467 res!32587) b!58453))

(assert (= (and b!58453 c!7382) b!58456))

(assert (= (and b!58453 (not c!7382)) b!58470))

(assert (= (and b!58456 res!32585) b!58473))

(assert (= (or b!58456 b!58470) bm!4292))

(declare-fun b_lambda!2549 () Bool)

(assert (=> (not b_lambda!2549) (not b!58465)))

(declare-fun t!4762 () Bool)

(declare-fun tb!1305 () Bool)

(assert (=> (and b!57026 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 (_2!1022 lt!22687))) t!4762) tb!1305))

(declare-fun result!2357 () Bool)

(assert (=> tb!1305 (= result!2357 tp_is_empty!2389)))

(assert (=> b!58465 t!4762))

(declare-fun b_and!3533 () Bool)

(assert (= b_and!3529 (and (=> t!4762 result!2357) b_and!3533)))

(declare-fun tb!1307 () Bool)

(declare-fun t!4764 () Bool)

(assert (=> (and b!57016 (= (defaultEntry!2021 newMap!16) (defaultEntry!2021 (_2!1022 lt!22687))) t!4764) tb!1307))

(declare-fun result!2359 () Bool)

(assert (= result!2359 result!2357))

(assert (=> b!58465 t!4764))

(declare-fun b_and!3535 () Bool)

(assert (= b_and!3531 (and (=> t!4764 result!2359) b_and!3535)))

(declare-fun m!50053 () Bool)

(assert (=> b!58465 m!50053))

(declare-fun m!50055 () Bool)

(assert (=> b!58465 m!50055))

(declare-fun m!50057 () Bool)

(assert (=> b!58465 m!50057))

(assert (=> b!58465 m!50053))

(assert (=> b!58465 m!49005))

(declare-fun m!50059 () Bool)

(assert (=> b!58465 m!50059))

(assert (=> b!58465 m!49005))

(assert (=> b!58465 m!50055))

(declare-fun m!50061 () Bool)

(assert (=> b!58461 m!50061))

(declare-fun m!50063 () Bool)

(assert (=> bm!4294 m!50063))

(assert (=> b!58459 m!49005))

(assert (=> b!58459 m!49005))

(declare-fun m!50065 () Bool)

(assert (=> b!58459 m!50065))

(declare-fun m!50067 () Bool)

(assert (=> b!58473 m!50067))

(declare-fun m!50069 () Bool)

(assert (=> bm!4292 m!50069))

(declare-fun m!50071 () Bool)

(assert (=> bm!4295 m!50071))

(assert (=> b!58471 m!49005))

(declare-fun m!50073 () Bool)

(assert (=> b!58471 m!50073))

(declare-fun m!50075 () Bool)

(assert (=> b!58471 m!50075))

(declare-fun m!50077 () Bool)

(assert (=> b!58471 m!50077))

(declare-fun m!50079 () Bool)

(assert (=> b!58471 m!50079))

(declare-fun m!50081 () Bool)

(assert (=> b!58471 m!50081))

(declare-fun m!50083 () Bool)

(assert (=> b!58471 m!50083))

(declare-fun m!50085 () Bool)

(assert (=> b!58471 m!50085))

(declare-fun m!50087 () Bool)

(assert (=> b!58471 m!50087))

(declare-fun m!50089 () Bool)

(assert (=> b!58471 m!50089))

(assert (=> b!58471 m!50081))

(declare-fun m!50091 () Bool)

(assert (=> b!58471 m!50091))

(assert (=> b!58471 m!50085))

(declare-fun m!50093 () Bool)

(assert (=> b!58471 m!50093))

(declare-fun m!50095 () Bool)

(assert (=> b!58471 m!50095))

(declare-fun m!50097 () Bool)

(assert (=> b!58471 m!50097))

(declare-fun m!50099 () Bool)

(assert (=> b!58471 m!50099))

(declare-fun m!50101 () Bool)

(assert (=> b!58471 m!50101))

(assert (=> b!58471 m!50087))

(assert (=> b!58471 m!50095))

(declare-fun m!50103 () Bool)

(assert (=> b!58471 m!50103))

(declare-fun m!50105 () Bool)

(assert (=> b!58466 m!50105))

(assert (=> bm!4296 m!50101))

(declare-fun m!50107 () Bool)

(assert (=> d!11095 m!50107))

(assert (=> b!58455 m!49005))

(assert (=> b!58455 m!49005))

(assert (=> b!58455 m!49007))

(assert (=> b!58472 m!49005))

(assert (=> b!58472 m!49005))

(assert (=> b!58472 m!49007))

(assert (=> d!10641 d!11095))

(declare-fun b!58475 () Bool)

(declare-fun e!38471 () Option!127)

(declare-fun e!38472 () Option!127)

(assert (=> b!58475 (= e!38471 e!38472)))

(declare-fun c!7384 () Bool)

(assert (=> b!58475 (= c!7384 (and ((_ is Cons!1427) (toList!690 lt!22817)) (not (= (_1!1023 (h!2007 (toList!690 lt!22817))) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(declare-fun b!58477 () Bool)

(assert (=> b!58477 (= e!38472 None!125)))

(declare-fun b!58476 () Bool)

(assert (=> b!58476 (= e!38472 (getValueByKey!121 (t!4744 (toList!690 lt!22817)) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))

(declare-fun b!58474 () Bool)

(assert (=> b!58474 (= e!38471 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22817)))))))

(declare-fun c!7383 () Bool)

(declare-fun d!11097 () Bool)

(assert (=> d!11097 (= c!7383 (and ((_ is Cons!1427) (toList!690 lt!22817)) (= (_1!1023 (h!2007 (toList!690 lt!22817))) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(assert (=> d!11097 (= (getValueByKey!121 (toList!690 lt!22817) (_1!1023 (tuple2!2025 lt!22748 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) e!38471)))

(assert (= (and d!11097 c!7383) b!58474))

(assert (= (and d!11097 (not c!7383)) b!58475))

(assert (= (and b!58475 c!7384) b!58476))

(assert (= (and b!58475 (not c!7384)) b!58477))

(declare-fun m!50109 () Bool)

(assert (=> b!58476 m!50109))

(assert (=> b!57448 d!11097))

(assert (=> d!10609 d!10747))

(declare-fun d!11099 () Bool)

(assert (=> d!11099 (= (apply!65 lt!23070 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1070 (getValueByKey!121 (toList!690 lt!23070) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2536 () Bool)

(assert (= bs!2536 d!11099))

(assert (=> bs!2536 m!49461))

(assert (=> bs!2536 m!49461))

(declare-fun m!50111 () Bool)

(assert (=> bs!2536 m!50111))

(assert (=> b!57730 d!11099))

(declare-fun b!58479 () Bool)

(declare-fun e!38473 () Option!127)

(declare-fun e!38474 () Option!127)

(assert (=> b!58479 (= e!38473 e!38474)))

(declare-fun c!7386 () Bool)

(assert (=> b!58479 (= c!7386 (and ((_ is Cons!1427) (t!4744 (toList!690 lt!22556))) (not (= (_1!1023 (h!2007 (t!4744 (toList!690 lt!22556)))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))))

(declare-fun b!58481 () Bool)

(assert (=> b!58481 (= e!38474 None!125)))

(declare-fun b!58480 () Bool)

(assert (=> b!58480 (= e!38474 (getValueByKey!121 (t!4744 (t!4744 (toList!690 lt!22556))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun b!58478 () Bool)

(assert (=> b!58478 (= e!38473 (Some!126 (_2!1023 (h!2007 (t!4744 (toList!690 lt!22556))))))))

(declare-fun d!11101 () Bool)

(declare-fun c!7385 () Bool)

(assert (=> d!11101 (= c!7385 (and ((_ is Cons!1427) (t!4744 (toList!690 lt!22556))) (= (_1!1023 (h!2007 (t!4744 (toList!690 lt!22556)))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (=> d!11101 (= (getValueByKey!121 (t!4744 (toList!690 lt!22556)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) e!38473)))

(assert (= (and d!11101 c!7385) b!58478))

(assert (= (and d!11101 (not c!7385)) b!58479))

(assert (= (and b!58479 c!7386) b!58480))

(assert (= (and b!58479 (not c!7386)) b!58481))

(assert (=> b!58480 m!47913))

(declare-fun m!50113 () Bool)

(assert (=> b!58480 m!50113))

(assert (=> b!57479 d!11101))

(assert (=> b!57558 d!10519))

(declare-fun b!58483 () Bool)

(declare-fun e!38475 () Option!127)

(declare-fun e!38476 () Option!127)

(assert (=> b!58483 (= e!38475 e!38476)))

(declare-fun c!7388 () Bool)

(assert (=> b!58483 (= c!7388 (and ((_ is Cons!1427) (toList!690 lt!22885)) (not (= (_1!1023 (h!2007 (toList!690 lt!22885))) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))))

(declare-fun b!58485 () Bool)

(assert (=> b!58485 (= e!38476 None!125)))

(declare-fun b!58484 () Bool)

(assert (=> b!58484 (= e!38476 (getValueByKey!121 (t!4744 (toList!690 lt!22885)) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))

(declare-fun b!58482 () Bool)

(assert (=> b!58482 (= e!38475 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22885)))))))

(declare-fun d!11103 () Bool)

(declare-fun c!7387 () Bool)

(assert (=> d!11103 (= c!7387 (and ((_ is Cons!1427) (toList!690 lt!22885)) (= (_1!1023 (h!2007 (toList!690 lt!22885))) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))))))

(assert (=> d!11103 (= (getValueByKey!121 (toList!690 lt!22885) (_1!1023 (ite (or c!7083 c!7081) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1939 (v!2361 (underlying!220 thiss!992)))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) e!38475)))

(assert (= (and d!11103 c!7387) b!58482))

(assert (= (and d!11103 (not c!7387)) b!58483))

(assert (= (and b!58483 c!7388) b!58484))

(assert (= (and b!58483 (not c!7388)) b!58485))

(declare-fun m!50115 () Bool)

(assert (=> b!58484 m!50115))

(assert (=> b!57575 d!11103))

(declare-fun d!11105 () Bool)

(declare-fun e!38477 () Bool)

(assert (=> d!11105 e!38477))

(declare-fun res!32594 () Bool)

(assert (=> d!11105 (=> res!32594 e!38477)))

(declare-fun lt!23503 () Bool)

(assert (=> d!11105 (= res!32594 (not lt!23503))))

(declare-fun lt!23506 () Bool)

(assert (=> d!11105 (= lt!23503 lt!23506)))

(declare-fun lt!23505 () Unit!1484)

(declare-fun e!38478 () Unit!1484)

(assert (=> d!11105 (= lt!23505 e!38478)))

(declare-fun c!7389 () Bool)

(assert (=> d!11105 (= c!7389 lt!23506)))

(assert (=> d!11105 (= lt!23506 (containsKey!125 (toList!690 lt!22857) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11105 (= (contains!677 lt!22857 #b1000000000000000000000000000000000000000000000000000000000000000) lt!23503)))

(declare-fun b!58486 () Bool)

(declare-fun lt!23504 () Unit!1484)

(assert (=> b!58486 (= e!38478 lt!23504)))

(assert (=> b!58486 (= lt!23504 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22857) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!58486 (isDefined!75 (getValueByKey!121 (toList!690 lt!22857) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58487 () Bool)

(declare-fun Unit!1545 () Unit!1484)

(assert (=> b!58487 (= e!38478 Unit!1545)))

(declare-fun b!58488 () Bool)

(assert (=> b!58488 (= e!38477 (isDefined!75 (getValueByKey!121 (toList!690 lt!22857) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!11105 c!7389) b!58486))

(assert (= (and d!11105 (not c!7389)) b!58487))

(assert (= (and d!11105 (not res!32594)) b!58488))

(declare-fun m!50117 () Bool)

(assert (=> d!11105 m!50117))

(declare-fun m!50119 () Bool)

(assert (=> b!58486 m!50119))

(assert (=> b!58486 m!49853))

(assert (=> b!58486 m!49853))

(declare-fun m!50121 () Bool)

(assert (=> b!58486 m!50121))

(assert (=> b!58488 m!49853))

(assert (=> b!58488 m!49853))

(assert (=> b!58488 m!50121))

(assert (=> bm!4172 d!11105))

(assert (=> bm!4199 d!10591))

(declare-fun d!11107 () Bool)

(declare-fun e!38479 () Bool)

(assert (=> d!11107 e!38479))

(declare-fun res!32596 () Bool)

(assert (=> d!11107 (=> (not res!32596) (not e!38479))))

(declare-fun lt!23509 () ListLongMap!1349)

(assert (=> d!11107 (= res!32596 (contains!677 lt!23509 (_1!1023 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!23510 () List!1431)

(assert (=> d!11107 (= lt!23509 (ListLongMap!1350 lt!23510))))

(declare-fun lt!23507 () Unit!1484)

(declare-fun lt!23508 () Unit!1484)

(assert (=> d!11107 (= lt!23507 lt!23508)))

(assert (=> d!11107 (= (getValueByKey!121 lt!23510 (_1!1023 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!126 (_2!1023 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!11107 (= lt!23508 (lemmaContainsTupThenGetReturnValue!41 lt!23510 (_1!1023 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!11107 (= lt!23510 (insertStrictlySorted!44 (toList!690 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16))) (_1!1023 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1023 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!11107 (= (+!80 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!23509)))

(declare-fun b!58489 () Bool)

(declare-fun res!32595 () Bool)

(assert (=> b!58489 (=> (not res!32595) (not e!38479))))

(assert (=> b!58489 (= res!32595 (= (getValueByKey!121 (toList!690 lt!23509) (_1!1023 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!126 (_2!1023 (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!58490 () Bool)

(assert (=> b!58490 (= e!38479 (contains!681 (toList!690 lt!23509) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!11107 res!32596) b!58489))

(assert (= (and b!58489 res!32595) b!58490))

(declare-fun m!50123 () Bool)

(assert (=> d!11107 m!50123))

(declare-fun m!50125 () Bool)

(assert (=> d!11107 m!50125))

(declare-fun m!50127 () Bool)

(assert (=> d!11107 m!50127))

(declare-fun m!50129 () Bool)

(assert (=> d!11107 m!50129))

(declare-fun m!50131 () Bool)

(assert (=> b!58489 m!50131))

(declare-fun m!50133 () Bool)

(assert (=> b!58490 m!50133))

(assert (=> d!10635 d!11107))

(declare-fun b!58492 () Bool)

(declare-fun e!38482 () ListLongMap!1349)

(declare-fun call!4302 () ListLongMap!1349)

(assert (=> b!58492 (= e!38482 call!4302)))

(declare-fun b!58493 () Bool)

(declare-fun e!38486 () Bool)

(assert (=> b!58493 (= e!38486 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!58494 () Bool)

(declare-fun e!38490 () Bool)

(declare-fun e!38487 () Bool)

(assert (=> b!58494 (= e!38490 e!38487)))

(declare-fun res!32597 () Bool)

(declare-fun call!4301 () Bool)

(assert (=> b!58494 (= res!32597 call!4301)))

(assert (=> b!58494 (=> (not res!32597) (not e!38487))))

(declare-fun b!58495 () Bool)

(declare-fun e!38488 () ListLongMap!1349)

(declare-fun e!38491 () ListLongMap!1349)

(assert (=> b!58495 (= e!38488 e!38491)))

(declare-fun c!7391 () Bool)

(assert (=> b!58495 (= c!7391 (and (not (= (bvand lt!22673 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!22673 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!58496 () Bool)

(declare-fun c!7392 () Bool)

(assert (=> b!58496 (= c!7392 (and (not (= (bvand lt!22673 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!22673 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!58496 (= e!38491 e!38482)))

(declare-fun bm!4297 () Bool)

(declare-fun call!4303 () ListLongMap!1349)

(declare-fun call!4305 () ListLongMap!1349)

(assert (=> bm!4297 (= call!4303 call!4305)))

(declare-fun b!58497 () Bool)

(declare-fun e!38481 () Bool)

(declare-fun e!38480 () Bool)

(assert (=> b!58497 (= e!38481 e!38480)))

(declare-fun res!32603 () Bool)

(assert (=> b!58497 (=> (not res!32603) (not e!38480))))

(declare-fun lt!23532 () ListLongMap!1349)

(assert (=> b!58497 (= res!32603 (contains!677 lt!23532 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!58497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!58498 () Bool)

(declare-fun e!38489 () Unit!1484)

(declare-fun Unit!1546 () Unit!1484)

(assert (=> b!58498 (= e!38489 Unit!1546)))

(declare-fun b!58499 () Bool)

(declare-fun call!4306 () ListLongMap!1349)

(assert (=> b!58499 (= e!38488 (+!80 call!4306 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))

(declare-fun d!11109 () Bool)

(declare-fun e!38483 () Bool)

(assert (=> d!11109 e!38483))

(declare-fun res!32601 () Bool)

(assert (=> d!11109 (=> (not res!32601) (not e!38483))))

(assert (=> d!11109 (= res!32601 (or (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))))

(declare-fun lt!23526 () ListLongMap!1349)

(assert (=> d!11109 (= lt!23532 lt!23526)))

(declare-fun lt!23524 () Unit!1484)

(assert (=> d!11109 (= lt!23524 e!38489)))

(declare-fun c!7394 () Bool)

(declare-fun e!38492 () Bool)

(assert (=> d!11109 (= c!7394 e!38492)))

(declare-fun res!32605 () Bool)

(assert (=> d!11109 (=> (not res!32605) (not e!38492))))

(assert (=> d!11109 (= res!32605 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(assert (=> d!11109 (= lt!23526 e!38488)))

(declare-fun c!7393 () Bool)

(assert (=> d!11109 (= c!7393 (and (not (= (bvand lt!22673 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!22673 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!11109 (validMask!0 (mask!5894 newMap!16))))

(assert (=> d!11109 (= (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22673 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) lt!23532)))

(declare-fun b!58491 () Bool)

(assert (=> b!58491 (= e!38483 e!38490)))

(declare-fun c!7395 () Bool)

(assert (=> b!58491 (= c!7395 (not (= (bvand lt!22673 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!4298 () Bool)

(declare-fun call!4300 () ListLongMap!1349)

(assert (=> bm!4298 (= call!4300 call!4306)))

(declare-fun bm!4299 () Bool)

(assert (=> bm!4299 (= call!4301 (contains!677 lt!23532 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58500 () Bool)

(assert (=> b!58500 (= e!38491 call!4300)))

(declare-fun bm!4300 () Bool)

(assert (=> bm!4300 (= call!4302 call!4303)))

(declare-fun b!58501 () Bool)

(declare-fun res!32600 () Bool)

(assert (=> b!58501 (=> (not res!32600) (not e!38483))))

(assert (=> b!58501 (= res!32600 e!38481)))

(declare-fun res!32598 () Bool)

(assert (=> b!58501 (=> res!32598 e!38481)))

(assert (=> b!58501 (= res!32598 (not e!38486))))

(declare-fun res!32602 () Bool)

(assert (=> b!58501 (=> (not res!32602) (not e!38486))))

(assert (=> b!58501 (= res!32602 (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!58502 () Bool)

(declare-fun e!38485 () Bool)

(declare-fun e!38484 () Bool)

(assert (=> b!58502 (= e!38485 e!38484)))

(declare-fun res!32604 () Bool)

(declare-fun call!4304 () Bool)

(assert (=> b!58502 (= res!32604 call!4304)))

(assert (=> b!58502 (=> (not res!32604) (not e!38484))))

(declare-fun bm!4301 () Bool)

(assert (=> bm!4301 (= call!4306 (+!80 (ite c!7393 call!4305 (ite c!7391 call!4303 call!4302)) (ite (or c!7393 c!7391) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(declare-fun b!58503 () Bool)

(assert (=> b!58503 (= e!38480 (= (apply!65 lt!23532 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)) (get!1065 (select (arr!1763 (_values!2004 newMap!16)) #b00000000000000000000000000000000) (dynLambda!305 (defaultEntry!2021 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!58503 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1993 (_values!2004 newMap!16))))))

(assert (=> b!58503 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!58504 () Bool)

(assert (=> b!58504 (= e!38484 (= (apply!65 lt!23532 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!58505 () Bool)

(declare-fun res!32599 () Bool)

(assert (=> b!58505 (=> (not res!32599) (not e!38483))))

(assert (=> b!58505 (= res!32599 e!38485)))

(declare-fun c!7390 () Bool)

(assert (=> b!58505 (= c!7390 (not (= (bvand lt!22673 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!58506 () Bool)

(assert (=> b!58506 (= e!38482 call!4300)))

(declare-fun b!58507 () Bool)

(assert (=> b!58507 (= e!38485 (not call!4304))))

(declare-fun b!58508 () Bool)

(assert (=> b!58508 (= e!38490 (not call!4301))))

(declare-fun b!58509 () Bool)

(declare-fun lt!23516 () Unit!1484)

(assert (=> b!58509 (= e!38489 lt!23516)))

(declare-fun lt!23522 () ListLongMap!1349)

(assert (=> b!58509 (= lt!23522 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22673 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23517 () (_ BitVec 64))

(assert (=> b!58509 (= lt!23517 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23515 () (_ BitVec 64))

(assert (=> b!58509 (= lt!23515 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!23519 () Unit!1484)

(assert (=> b!58509 (= lt!23519 (addStillContains!41 lt!23522 lt!23517 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!23515))))

(assert (=> b!58509 (contains!677 (+!80 lt!23522 (tuple2!2025 lt!23517 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!23515)))

(declare-fun lt!23529 () Unit!1484)

(assert (=> b!58509 (= lt!23529 lt!23519)))

(declare-fun lt!23513 () ListLongMap!1349)

(assert (=> b!58509 (= lt!23513 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22673 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23514 () (_ BitVec 64))

(assert (=> b!58509 (= lt!23514 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23511 () (_ BitVec 64))

(assert (=> b!58509 (= lt!23511 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!23527 () Unit!1484)

(assert (=> b!58509 (= lt!23527 (addApplyDifferent!41 lt!23513 lt!23514 (minValue!1939 newMap!16) lt!23511))))

(assert (=> b!58509 (= (apply!65 (+!80 lt!23513 (tuple2!2025 lt!23514 (minValue!1939 newMap!16))) lt!23511) (apply!65 lt!23513 lt!23511))))

(declare-fun lt!23512 () Unit!1484)

(assert (=> b!58509 (= lt!23512 lt!23527)))

(declare-fun lt!23518 () ListLongMap!1349)

(assert (=> b!58509 (= lt!23518 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22673 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23525 () (_ BitVec 64))

(assert (=> b!58509 (= lt!23525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23530 () (_ BitVec 64))

(assert (=> b!58509 (= lt!23530 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!23521 () Unit!1484)

(assert (=> b!58509 (= lt!23521 (addApplyDifferent!41 lt!23518 lt!23525 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!23530))))

(assert (=> b!58509 (= (apply!65 (+!80 lt!23518 (tuple2!2025 lt!23525 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!23530) (apply!65 lt!23518 lt!23530))))

(declare-fun lt!23523 () Unit!1484)

(assert (=> b!58509 (= lt!23523 lt!23521)))

(declare-fun lt!23520 () ListLongMap!1349)

(assert (=> b!58509 (= lt!23520 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22673 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun lt!23531 () (_ BitVec 64))

(assert (=> b!58509 (= lt!23531 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23528 () (_ BitVec 64))

(assert (=> b!58509 (= lt!23528 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!58509 (= lt!23516 (addApplyDifferent!41 lt!23520 lt!23531 (minValue!1939 newMap!16) lt!23528))))

(assert (=> b!58509 (= (apply!65 (+!80 lt!23520 (tuple2!2025 lt!23531 (minValue!1939 newMap!16))) lt!23528) (apply!65 lt!23520 lt!23528))))

(declare-fun bm!4302 () Bool)

(assert (=> bm!4302 (= call!4304 (contains!677 lt!23532 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58510 () Bool)

(assert (=> b!58510 (= e!38492 (validKeyInArray!0 (select (arr!1762 (_keys!3640 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!4303 () Bool)

(assert (=> bm!4303 (= call!4305 (getCurrentListMapNoExtraKeys!43 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22673 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(declare-fun b!58511 () Bool)

(assert (=> b!58511 (= e!38487 (= (apply!65 lt!23532 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1939 newMap!16)))))

(assert (= (and d!11109 c!7393) b!58499))

(assert (= (and d!11109 (not c!7393)) b!58495))

(assert (= (and b!58495 c!7391) b!58500))

(assert (= (and b!58495 (not c!7391)) b!58496))

(assert (= (and b!58496 c!7392) b!58506))

(assert (= (and b!58496 (not c!7392)) b!58492))

(assert (= (or b!58506 b!58492) bm!4300))

(assert (= (or b!58500 bm!4300) bm!4297))

(assert (= (or b!58500 b!58506) bm!4298))

(assert (= (or b!58499 bm!4297) bm!4303))

(assert (= (or b!58499 bm!4298) bm!4301))

(assert (= (and d!11109 res!32605) b!58510))

(assert (= (and d!11109 c!7394) b!58509))

(assert (= (and d!11109 (not c!7394)) b!58498))

(assert (= (and d!11109 res!32601) b!58501))

(assert (= (and b!58501 res!32602) b!58493))

(assert (= (and b!58501 (not res!32598)) b!58497))

(assert (= (and b!58497 res!32603) b!58503))

(assert (= (and b!58501 res!32600) b!58505))

(assert (= (and b!58505 c!7390) b!58502))

(assert (= (and b!58505 (not c!7390)) b!58507))

(assert (= (and b!58502 res!32604) b!58504))

(assert (= (or b!58502 b!58507) bm!4302))

(assert (= (and b!58505 res!32599) b!58491))

(assert (= (and b!58491 c!7395) b!58494))

(assert (= (and b!58491 (not c!7395)) b!58508))

(assert (= (and b!58494 res!32597) b!58511))

(assert (= (or b!58494 b!58508) bm!4299))

(declare-fun b_lambda!2551 () Bool)

(assert (=> (not b_lambda!2551) (not b!58503)))

(assert (=> b!58503 t!4758))

(declare-fun b_and!3537 () Bool)

(assert (= b_and!3533 (and (=> t!4758 result!2353) b_and!3537)))

(assert (=> b!58503 t!4760))

(declare-fun b_and!3539 () Bool)

(assert (= b_and!3535 (and (=> t!4760 result!2355) b_and!3539)))

(assert (=> b!58503 m!48411))

(assert (=> b!58503 m!48353))

(assert (=> b!58503 m!48413))

(assert (=> b!58503 m!48411))

(assert (=> b!58503 m!48317))

(declare-fun m!50135 () Bool)

(assert (=> b!58503 m!50135))

(assert (=> b!58503 m!48317))

(assert (=> b!58503 m!48353))

(declare-fun m!50137 () Bool)

(assert (=> b!58499 m!50137))

(declare-fun m!50139 () Bool)

(assert (=> bm!4301 m!50139))

(assert (=> b!58497 m!48317))

(assert (=> b!58497 m!48317))

(declare-fun m!50141 () Bool)

(assert (=> b!58497 m!50141))

(declare-fun m!50143 () Bool)

(assert (=> b!58511 m!50143))

(declare-fun m!50145 () Bool)

(assert (=> bm!4299 m!50145))

(declare-fun m!50147 () Bool)

(assert (=> bm!4302 m!50147))

(assert (=> b!58509 m!48317))

(declare-fun m!50149 () Bool)

(assert (=> b!58509 m!50149))

(declare-fun m!50151 () Bool)

(assert (=> b!58509 m!50151))

(declare-fun m!50153 () Bool)

(assert (=> b!58509 m!50153))

(declare-fun m!50155 () Bool)

(assert (=> b!58509 m!50155))

(declare-fun m!50157 () Bool)

(assert (=> b!58509 m!50157))

(assert (=> b!58509 m!47939))

(declare-fun m!50159 () Bool)

(assert (=> b!58509 m!50159))

(declare-fun m!50161 () Bool)

(assert (=> b!58509 m!50161))

(declare-fun m!50163 () Bool)

(assert (=> b!58509 m!50163))

(declare-fun m!50165 () Bool)

(assert (=> b!58509 m!50165))

(assert (=> b!58509 m!50157))

(declare-fun m!50167 () Bool)

(assert (=> b!58509 m!50167))

(assert (=> b!58509 m!50161))

(declare-fun m!50169 () Bool)

(assert (=> b!58509 m!50169))

(declare-fun m!50171 () Bool)

(assert (=> b!58509 m!50171))

(assert (=> b!58509 m!47939))

(declare-fun m!50173 () Bool)

(assert (=> b!58509 m!50173))

(declare-fun m!50175 () Bool)

(assert (=> b!58509 m!50175))

(assert (=> b!58509 m!47939))

(declare-fun m!50177 () Bool)

(assert (=> b!58509 m!50177))

(assert (=> b!58509 m!50163))

(assert (=> b!58509 m!50171))

(declare-fun m!50179 () Bool)

(assert (=> b!58509 m!50179))

(declare-fun m!50181 () Bool)

(assert (=> b!58504 m!50181))

(assert (=> bm!4303 m!47939))

(assert (=> bm!4303 m!50177))

(assert (=> d!11109 m!48335))

(assert (=> b!58493 m!48317))

(assert (=> b!58493 m!48317))

(assert (=> b!58493 m!48321))

(assert (=> b!58510 m!48317))

(assert (=> b!58510 m!48317))

(assert (=> b!58510 m!48321))

(assert (=> d!10635 d!11109))

(assert (=> d!10635 d!10595))

(declare-fun d!11111 () Bool)

(assert (=> d!11111 (= (+!80 (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) (zeroValue!1939 newMap!16) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)) (tuple2!2025 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!387 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) lt!22673 (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1939 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2021 newMap!16)))))

(assert (=> d!11111 true))

(declare-fun _$7!41 () Unit!1484)

(assert (=> d!11111 (= (choose!301 (_keys!3640 newMap!16) (_values!2004 newMap!16) (mask!5894 newMap!16) (extraKeys!1912 newMap!16) lt!22673 (zeroValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1939 newMap!16) (defaultEntry!2021 newMap!16)) _$7!41)))

(declare-fun bs!2537 () Bool)

(assert (= bs!2537 d!11111))

(assert (=> bs!2537 m!48101))

(assert (=> bs!2537 m!48101))

(assert (=> bs!2537 m!48581))

(assert (=> bs!2537 m!47939))

(assert (=> bs!2537 m!48577))

(assert (=> d!10635 d!11111))

(assert (=> d!10635 d!10747))

(declare-fun d!11113 () Bool)

(assert (=> d!11113 (= (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22762)) (v!2367 (getValueByKey!121 (toList!690 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22762)))))

(assert (=> d!10559 d!11113))

(declare-fun b!58513 () Bool)

(declare-fun e!38493 () Option!127)

(declare-fun e!38494 () Option!127)

(assert (=> b!58513 (= e!38493 e!38494)))

(declare-fun c!7397 () Bool)

(assert (=> b!58513 (= c!7397 (and ((_ is Cons!1427) (toList!690 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) (not (= (_1!1023 (h!2007 (toList!690 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))) lt!22762))))))

(declare-fun b!58515 () Bool)

(assert (=> b!58515 (= e!38494 None!125)))

(declare-fun b!58514 () Bool)

(assert (=> b!58514 (= e!38494 (getValueByKey!121 (t!4744 (toList!690 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) lt!22762))))

(declare-fun b!58512 () Bool)

(assert (=> b!58512 (= e!38493 (Some!126 (_2!1023 (h!2007 (toList!690 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))))))))

(declare-fun c!7396 () Bool)

(declare-fun d!11115 () Bool)

(assert (=> d!11115 (= c!7396 (and ((_ is Cons!1427) (toList!690 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992))))))) (= (_1!1023 (h!2007 (toList!690 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))))) lt!22762)))))

(assert (=> d!11115 (= (getValueByKey!121 (toList!690 (+!80 lt!22754 (tuple2!2025 lt!22765 (minValue!1939 (v!2361 (underlying!220 thiss!992)))))) lt!22762) e!38493)))

(assert (= (and d!11115 c!7396) b!58512))

(assert (= (and d!11115 (not c!7396)) b!58513))

(assert (= (and b!58513 c!7397) b!58514))

(assert (= (and b!58513 (not c!7397)) b!58515))

(declare-fun m!50183 () Bool)

(assert (=> b!58514 m!50183))

(assert (=> d!10559 d!11115))

(declare-fun b!58519 () Bool)

(declare-fun e!38495 () Bool)

(assert (=> b!58519 (= e!38495 (and (bvsge (extraKeys!1912 (_2!1022 lt!22687)) #b00000000000000000000000000000000) (bvsle (extraKeys!1912 (_2!1022 lt!22687)) #b00000000000000000000000000000011) (bvsge (_vacant!354 (_2!1022 lt!22687)) #b00000000000000000000000000000000)))))

(declare-fun d!11117 () Bool)

(declare-fun res!32606 () Bool)

(assert (=> d!11117 (=> (not res!32606) (not e!38495))))

(assert (=> d!11117 (= res!32606 (validMask!0 (mask!5894 (_2!1022 lt!22687))))))

(assert (=> d!11117 (= (simpleValid!41 (_2!1022 lt!22687)) e!38495)))

(declare-fun b!58516 () Bool)

(declare-fun res!32608 () Bool)

(assert (=> b!58516 (=> (not res!32608) (not e!38495))))

(assert (=> b!58516 (= res!32608 (and (= (size!1993 (_values!2004 (_2!1022 lt!22687))) (bvadd (mask!5894 (_2!1022 lt!22687)) #b00000000000000000000000000000001)) (= (size!1992 (_keys!3640 (_2!1022 lt!22687))) (size!1993 (_values!2004 (_2!1022 lt!22687)))) (bvsge (_size!354 (_2!1022 lt!22687)) #b00000000000000000000000000000000) (bvsle (_size!354 (_2!1022 lt!22687)) (bvadd (mask!5894 (_2!1022 lt!22687)) #b00000000000000000000000000000001))))))

(declare-fun b!58517 () Bool)

(declare-fun res!32607 () Bool)

(assert (=> b!58517 (=> (not res!32607) (not e!38495))))

(assert (=> b!58517 (= res!32607 (bvsge (size!1998 (_2!1022 lt!22687)) (_size!354 (_2!1022 lt!22687))))))

(declare-fun b!58518 () Bool)

(declare-fun res!32609 () Bool)

(assert (=> b!58518 (=> (not res!32609) (not e!38495))))

(assert (=> b!58518 (= res!32609 (= (size!1998 (_2!1022 lt!22687)) (bvadd (_size!354 (_2!1022 lt!22687)) (bvsdiv (bvadd (extraKeys!1912 (_2!1022 lt!22687)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!11117 res!32606) b!58516))

(assert (= (and b!58516 res!32608) b!58517))

(assert (= (and b!58517 res!32607) b!58518))

(assert (= (and b!58518 res!32609) b!58519))

(assert (=> d!11117 m!50107))

(declare-fun m!50185 () Bool)

(assert (=> b!58517 m!50185))

(assert (=> b!58518 m!50185))

(assert (=> d!10607 d!11117))

(declare-fun lt!23533 () Bool)

(declare-fun d!11119 () Bool)

(assert (=> d!11119 (= lt!23533 (select (content!62 (toList!690 lt!22809)) (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun e!38497 () Bool)

(assert (=> d!11119 (= lt!23533 e!38497)))

(declare-fun res!32610 () Bool)

(assert (=> d!11119 (=> (not res!32610) (not e!38497))))

(assert (=> d!11119 (= res!32610 ((_ is Cons!1427) (toList!690 lt!22809)))))

(assert (=> d!11119 (= (contains!681 (toList!690 lt!22809) (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!23533)))

(declare-fun b!58520 () Bool)

(declare-fun e!38496 () Bool)

(assert (=> b!58520 (= e!38497 e!38496)))

(declare-fun res!32611 () Bool)

(assert (=> b!58520 (=> res!32611 e!38496)))

(assert (=> b!58520 (= res!32611 (= (h!2007 (toList!690 lt!22809)) (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(declare-fun b!58521 () Bool)

(assert (=> b!58521 (= e!38496 (contains!681 (t!4744 (toList!690 lt!22809)) (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))))))

(assert (= (and d!11119 res!32610) b!58520))

(assert (= (and b!58520 (not res!32611)) b!58521))

(declare-fun m!50187 () Bool)

(assert (=> d!11119 m!50187))

(declare-fun m!50189 () Bool)

(assert (=> d!11119 m!50189))

(declare-fun m!50191 () Bool)

(assert (=> b!58521 m!50191))

(assert (=> b!57445 d!11119))

(declare-fun d!11121 () Bool)

(declare-fun res!32612 () Bool)

(declare-fun e!38498 () Bool)

(assert (=> d!11121 (=> res!32612 e!38498)))

(assert (=> d!11121 (= res!32612 (and ((_ is Cons!1427) (t!4744 (toList!690 lt!22556))) (= (_1!1023 (h!2007 (t!4744 (toList!690 lt!22556)))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(assert (=> d!11121 (= (containsKey!125 (t!4744 (toList!690 lt!22556)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) e!38498)))

(declare-fun b!58522 () Bool)

(declare-fun e!38499 () Bool)

(assert (=> b!58522 (= e!38498 e!38499)))

(declare-fun res!32613 () Bool)

(assert (=> b!58522 (=> (not res!32613) (not e!38499))))

(assert (=> b!58522 (= res!32613 (and (or (not ((_ is Cons!1427) (t!4744 (toList!690 lt!22556)))) (bvsle (_1!1023 (h!2007 (t!4744 (toList!690 lt!22556)))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))) ((_ is Cons!1427) (t!4744 (toList!690 lt!22556))) (bvslt (_1!1023 (h!2007 (t!4744 (toList!690 lt!22556)))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355))))))

(declare-fun b!58523 () Bool)

(assert (=> b!58523 (= e!38499 (containsKey!125 (t!4744 (t!4744 (toList!690 lt!22556))) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (= (and d!11121 (not res!32612)) b!58522))

(assert (= (and b!58522 res!32613) b!58523))

(assert (=> b!58523 m!47913))

(declare-fun m!50193 () Bool)

(assert (=> b!58523 m!50193))

(assert (=> b!57716 d!11121))

(declare-fun d!11123 () Bool)

(declare-fun res!32614 () Bool)

(declare-fun e!38500 () Bool)

(assert (=> d!11123 (=> res!32614 e!38500)))

(assert (=> d!11123 (= res!32614 (and ((_ is Cons!1427) (toList!690 lt!22766)) (= (_1!1023 (h!2007 (toList!690 lt!22766))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11123 (= (containsKey!125 (toList!690 lt!22766) #b0000000000000000000000000000000000000000000000000000000000000000) e!38500)))

(declare-fun b!58524 () Bool)

(declare-fun e!38501 () Bool)

(assert (=> b!58524 (= e!38500 e!38501)))

(declare-fun res!32615 () Bool)

(assert (=> b!58524 (=> (not res!32615) (not e!38501))))

(assert (=> b!58524 (= res!32615 (and (or (not ((_ is Cons!1427) (toList!690 lt!22766))) (bvsle (_1!1023 (h!2007 (toList!690 lt!22766))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1427) (toList!690 lt!22766)) (bvslt (_1!1023 (h!2007 (toList!690 lt!22766))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!58525 () Bool)

(assert (=> b!58525 (= e!38501 (containsKey!125 (t!4744 (toList!690 lt!22766)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!11123 (not res!32614)) b!58524))

(assert (= (and b!58524 res!32615) b!58525))

(declare-fun m!50195 () Bool)

(assert (=> b!58525 m!50195))

(assert (=> d!10619 d!11123))

(declare-fun b!58526 () Bool)

(declare-fun e!38502 () Bool)

(declare-fun call!4307 () Bool)

(assert (=> b!58526 (= e!38502 call!4307)))

(declare-fun b!58527 () Bool)

(declare-fun e!38504 () Bool)

(assert (=> b!58527 (= e!38504 e!38502)))

(declare-fun c!7398 () Bool)

(assert (=> b!58527 (= c!7398 (validKeyInArray!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!58528 () Bool)

(declare-fun e!38503 () Bool)

(assert (=> b!58528 (= e!38503 call!4307)))

(declare-fun b!58529 () Bool)

(assert (=> b!58529 (= e!38502 e!38503)))

(declare-fun lt!23536 () (_ BitVec 64))

(assert (=> b!58529 (= lt!23536 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!23535 () Unit!1484)

(assert (=> b!58529 (= lt!23535 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) lt!23536 #b00000000000000000000000000000000))))

(assert (=> b!58529 (arrayContainsKey!0 (_keys!3640 (v!2361 (underlying!220 thiss!992))) lt!23536 #b00000000000000000000000000000000)))

(declare-fun lt!23534 () Unit!1484)

(assert (=> b!58529 (= lt!23534 lt!23535)))

(declare-fun res!32616 () Bool)

(assert (=> b!58529 (= res!32616 (= (seekEntryOrOpen!0 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) #b00000000000000000000000000000000) (_keys!3640 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992)))) (Found!229 #b00000000000000000000000000000000)))))

(assert (=> b!58529 (=> (not res!32616) (not e!38503))))

(declare-fun d!11125 () Bool)

(declare-fun res!32617 () Bool)

(assert (=> d!11125 (=> res!32617 e!38504)))

(assert (=> d!11125 (= res!32617 (bvsge #b00000000000000000000000000000000 (size!1992 (_keys!3640 (v!2361 (underlying!220 thiss!992))))))))

(assert (=> d!11125 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3640 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992)))) e!38504)))

(declare-fun bm!4304 () Bool)

(assert (=> bm!4304 (= call!4307 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3640 (v!2361 (underlying!220 thiss!992))) (mask!5894 (v!2361 (underlying!220 thiss!992)))))))

(assert (= (and d!11125 (not res!32617)) b!58527))

(assert (= (and b!58527 c!7398) b!58529))

(assert (= (and b!58527 (not c!7398)) b!58526))

(assert (= (and b!58529 res!32616) b!58528))

(assert (= (or b!58528 b!58526) bm!4304))

(assert (=> b!58527 m!49211))

(assert (=> b!58527 m!49211))

(assert (=> b!58527 m!49215))

(assert (=> b!58529 m!49211))

(declare-fun m!50197 () Bool)

(assert (=> b!58529 m!50197))

(declare-fun m!50199 () Bool)

(assert (=> b!58529 m!50199))

(assert (=> b!58529 m!49211))

(declare-fun m!50201 () Bool)

(assert (=> b!58529 m!50201))

(declare-fun m!50203 () Bool)

(assert (=> bm!4304 m!50203))

(assert (=> b!57630 d!11125))

(assert (=> d!10665 d!10747))

(declare-fun d!11127 () Bool)

(declare-fun e!38505 () Bool)

(assert (=> d!11127 e!38505))

(declare-fun res!32618 () Bool)

(assert (=> d!11127 (=> res!32618 e!38505)))

(declare-fun lt!23537 () Bool)

(assert (=> d!11127 (= res!32618 (not lt!23537))))

(declare-fun lt!23540 () Bool)

(assert (=> d!11127 (= lt!23537 lt!23540)))

(declare-fun lt!23539 () Unit!1484)

(declare-fun e!38506 () Unit!1484)

(assert (=> d!11127 (= lt!23539 e!38506)))

(declare-fun c!7399 () Bool)

(assert (=> d!11127 (= c!7399 lt!23540)))

(assert (=> d!11127 (= lt!23540 (containsKey!125 (toList!690 lt!22879) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11127 (= (contains!677 lt!22879 #b1000000000000000000000000000000000000000000000000000000000000000) lt!23537)))

(declare-fun b!58530 () Bool)

(declare-fun lt!23538 () Unit!1484)

(assert (=> b!58530 (= e!38506 lt!23538)))

(assert (=> b!58530 (= lt!23538 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22879) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!58530 (isDefined!75 (getValueByKey!121 (toList!690 lt!22879) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!58531 () Bool)

(declare-fun Unit!1547 () Unit!1484)

(assert (=> b!58531 (= e!38506 Unit!1547)))

(declare-fun b!58532 () Bool)

(assert (=> b!58532 (= e!38505 (isDefined!75 (getValueByKey!121 (toList!690 lt!22879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!11127 c!7399) b!58530))

(assert (= (and d!11127 (not c!7399)) b!58531))

(assert (= (and d!11127 (not res!32618)) b!58532))

(declare-fun m!50205 () Bool)

(assert (=> d!11127 m!50205))

(declare-fun m!50207 () Bool)

(assert (=> b!58530 m!50207))

(assert (=> b!58530 m!49865))

(assert (=> b!58530 m!49865))

(declare-fun m!50209 () Bool)

(assert (=> b!58530 m!50209))

(assert (=> b!58532 m!49865))

(assert (=> b!58532 m!49865))

(assert (=> b!58532 m!50209))

(assert (=> bm!4179 d!11127))

(assert (=> b!57509 d!10861))

(assert (=> bm!4208 d!10719))

(declare-fun d!11129 () Bool)

(assert (=> d!11129 (isDefined!75 (getValueByKey!121 (toList!690 call!4127) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun lt!23541 () Unit!1484)

(assert (=> d!11129 (= lt!23541 (choose!297 (toList!690 call!4127) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(declare-fun e!38507 () Bool)

(assert (=> d!11129 e!38507))

(declare-fun res!32619 () Bool)

(assert (=> d!11129 (=> (not res!32619) (not e!38507))))

(assert (=> d!11129 (= res!32619 (isStrictlySorted!278 (toList!690 call!4127)))))

(assert (=> d!11129 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 call!4127) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)) lt!23541)))

(declare-fun b!58533 () Bool)

(assert (=> b!58533 (= e!38507 (containsKey!125 (toList!690 call!4127) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (= (and d!11129 res!32619) b!58533))

(assert (=> d!11129 m!47913))

(assert (=> d!11129 m!48539))

(assert (=> d!11129 m!48539))

(assert (=> d!11129 m!48541))

(assert (=> d!11129 m!47913))

(declare-fun m!50211 () Bool)

(assert (=> d!11129 m!50211))

(declare-fun m!50213 () Bool)

(assert (=> d!11129 m!50213))

(assert (=> b!58533 m!47913))

(assert (=> b!58533 m!48535))

(assert (=> b!57612 d!11129))

(assert (=> b!57612 d!10925))

(assert (=> b!57612 d!10927))

(declare-fun lt!23542 () Bool)

(declare-fun d!11131 () Bool)

(assert (=> d!11131 (= lt!23542 (select (content!62 (toList!690 lt!22919)) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!38509 () Bool)

(assert (=> d!11131 (= lt!23542 e!38509)))

(declare-fun res!32620 () Bool)

(assert (=> d!11131 (=> (not res!32620) (not e!38509))))

(assert (=> d!11131 (= res!32620 ((_ is Cons!1427) (toList!690 lt!22919)))))

(assert (=> d!11131 (= (contains!681 (toList!690 lt!22919) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!23542)))

(declare-fun b!58534 () Bool)

(declare-fun e!38508 () Bool)

(assert (=> b!58534 (= e!38509 e!38508)))

(declare-fun res!32621 () Bool)

(assert (=> b!58534 (=> res!32621 e!38508)))

(assert (=> b!58534 (= res!32621 (= (h!2007 (toList!690 lt!22919)) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!58535 () Bool)

(assert (=> b!58535 (= e!38508 (contains!681 (t!4744 (toList!690 lt!22919)) (tuple2!2025 (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!11131 res!32620) b!58534))

(assert (= (and b!58534 (not res!32621)) b!58535))

(declare-fun m!50215 () Bool)

(assert (=> d!11131 m!50215))

(declare-fun m!50217 () Bool)

(assert (=> d!11131 m!50217))

(declare-fun m!50219 () Bool)

(assert (=> b!58535 m!50219))

(assert (=> b!57616 d!11131))

(declare-fun d!11133 () Bool)

(declare-fun e!38510 () Bool)

(assert (=> d!11133 e!38510))

(declare-fun res!32623 () Bool)

(assert (=> d!11133 (=> (not res!32623) (not e!38510))))

(declare-fun lt!23545 () ListLongMap!1349)

(assert (=> d!11133 (= res!32623 (contains!677 lt!23545 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(declare-fun lt!23546 () List!1431)

(assert (=> d!11133 (= lt!23545 (ListLongMap!1350 lt!23546))))

(declare-fun lt!23543 () Unit!1484)

(declare-fun lt!23544 () Unit!1484)

(assert (=> d!11133 (= lt!23543 lt!23544)))

(assert (=> d!11133 (= (getValueByKey!121 lt!23546 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(assert (=> d!11133 (= lt!23544 (lemmaContainsTupThenGetReturnValue!41 lt!23546 (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(assert (=> d!11133 (= lt!23546 (insertStrictlySorted!44 (toList!690 call!4211) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))) (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))))))

(assert (=> d!11133 (= (+!80 call!4211 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))) lt!23545)))

(declare-fun b!58536 () Bool)

(declare-fun res!32622 () Bool)

(assert (=> b!58536 (=> (not res!32622) (not e!38510))))

(assert (=> b!58536 (= res!32622 (= (getValueByKey!121 (toList!690 lt!23545) (_1!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16)))) (Some!126 (_2!1023 (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))))

(declare-fun b!58537 () Bool)

(assert (=> b!58537 (= e!38510 (contains!681 (toList!690 lt!23545) (tuple2!2025 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1939 newMap!16))))))

(assert (= (and d!11133 res!32623) b!58536))

(assert (= (and b!58536 res!32622) b!58537))

(declare-fun m!50221 () Bool)

(assert (=> d!11133 m!50221))

(declare-fun m!50223 () Bool)

(assert (=> d!11133 m!50223))

(declare-fun m!50225 () Bool)

(assert (=> d!11133 m!50225))

(declare-fun m!50227 () Bool)

(assert (=> d!11133 m!50227))

(declare-fun m!50229 () Bool)

(assert (=> b!58536 m!50229))

(declare-fun m!50231 () Bool)

(assert (=> b!58537 m!50231))

(assert (=> b!57725 d!11133))

(assert (=> b!57528 d!10831))

(declare-fun d!11135 () Bool)

(declare-fun e!38511 () Bool)

(assert (=> d!11135 e!38511))

(declare-fun res!32624 () Bool)

(assert (=> d!11135 (=> res!32624 e!38511)))

(declare-fun lt!23547 () Bool)

(assert (=> d!11135 (= res!32624 (not lt!23547))))

(declare-fun lt!23550 () Bool)

(assert (=> d!11135 (= lt!23547 lt!23550)))

(declare-fun lt!23549 () Unit!1484)

(declare-fun e!38512 () Unit!1484)

(assert (=> d!11135 (= lt!23549 e!38512)))

(declare-fun c!7400 () Bool)

(assert (=> d!11135 (= c!7400 lt!23550)))

(assert (=> d!11135 (= lt!23550 (containsKey!125 (toList!690 (+!80 lt!22847 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))) lt!22840))))

(assert (=> d!11135 (= (contains!677 (+!80 lt!22847 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))) lt!22840) lt!23547)))

(declare-fun b!58538 () Bool)

(declare-fun lt!23548 () Unit!1484)

(assert (=> b!58538 (= e!38512 lt!23548)))

(assert (=> b!58538 (= lt!23548 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 (+!80 lt!22847 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))) lt!22840))))

(assert (=> b!58538 (isDefined!75 (getValueByKey!121 (toList!690 (+!80 lt!22847 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))) lt!22840))))

(declare-fun b!58539 () Bool)

(declare-fun Unit!1548 () Unit!1484)

(assert (=> b!58539 (= e!38512 Unit!1548)))

(declare-fun b!58540 () Bool)

(assert (=> b!58540 (= e!38511 (isDefined!75 (getValueByKey!121 (toList!690 (+!80 lt!22847 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))) lt!22840)))))

(assert (= (and d!11135 c!7400) b!58538))

(assert (= (and d!11135 (not c!7400)) b!58539))

(assert (= (and d!11135 (not res!32624)) b!58540))

(declare-fun m!50233 () Bool)

(assert (=> d!11135 m!50233))

(declare-fun m!50235 () Bool)

(assert (=> b!58538 m!50235))

(declare-fun m!50237 () Bool)

(assert (=> b!58538 m!50237))

(assert (=> b!58538 m!50237))

(declare-fun m!50239 () Bool)

(assert (=> b!58538 m!50239))

(assert (=> b!58540 m!50237))

(assert (=> b!58540 m!50237))

(assert (=> b!58540 m!50239))

(assert (=> b!57528 d!11135))

(declare-fun d!11137 () Bool)

(assert (=> d!11137 (= (apply!65 lt!22838 lt!22836) (get!1070 (getValueByKey!121 (toList!690 lt!22838) lt!22836)))))

(declare-fun bs!2538 () Bool)

(assert (= bs!2538 d!11137))

(declare-fun m!50241 () Bool)

(assert (=> bs!2538 m!50241))

(assert (=> bs!2538 m!50241))

(declare-fun m!50243 () Bool)

(assert (=> bs!2538 m!50243))

(assert (=> b!57528 d!11137))

(declare-fun d!11139 () Bool)

(assert (=> d!11139 (contains!677 (+!80 lt!22847 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))) lt!22840)))

(declare-fun lt!23551 () Unit!1484)

(assert (=> d!11139 (= lt!23551 (choose!295 lt!22847 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) lt!22840))))

(assert (=> d!11139 (contains!677 lt!22847 lt!22840)))

(assert (=> d!11139 (= (addStillContains!41 lt!22847 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) lt!22840) lt!23551)))

(declare-fun bs!2539 () Bool)

(assert (= bs!2539 d!11139))

(assert (=> bs!2539 m!48379))

(assert (=> bs!2539 m!48379))

(assert (=> bs!2539 m!48389))

(declare-fun m!50245 () Bool)

(assert (=> bs!2539 m!50245))

(declare-fun m!50247 () Bool)

(assert (=> bs!2539 m!50247))

(assert (=> b!57528 d!11139))

(declare-fun d!11141 () Bool)

(declare-fun e!38513 () Bool)

(assert (=> d!11141 e!38513))

(declare-fun res!32626 () Bool)

(assert (=> d!11141 (=> (not res!32626) (not e!38513))))

(declare-fun lt!23554 () ListLongMap!1349)

(assert (=> d!11141 (= res!32626 (contains!677 lt!23554 (_1!1023 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(declare-fun lt!23555 () List!1431)

(assert (=> d!11141 (= lt!23554 (ListLongMap!1350 lt!23555))))

(declare-fun lt!23552 () Unit!1484)

(declare-fun lt!23553 () Unit!1484)

(assert (=> d!11141 (= lt!23552 lt!23553)))

(assert (=> d!11141 (= (getValueByKey!121 lt!23555 (_1!1023 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))) (Some!126 (_2!1023 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(assert (=> d!11141 (= lt!23553 (lemmaContainsTupThenGetReturnValue!41 lt!23555 (_1!1023 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) (_2!1023 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(assert (=> d!11141 (= lt!23555 (insertStrictlySorted!44 (toList!690 lt!22845) (_1!1023 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) (_2!1023 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(assert (=> d!11141 (= (+!80 lt!22845 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) lt!23554)))

(declare-fun b!58541 () Bool)

(declare-fun res!32625 () Bool)

(assert (=> b!58541 (=> (not res!32625) (not e!38513))))

(assert (=> b!58541 (= res!32625 (= (getValueByKey!121 (toList!690 lt!23554) (_1!1023 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))) (Some!126 (_2!1023 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))))))))

(declare-fun b!58542 () Bool)

(assert (=> b!58542 (= e!38513 (contains!681 (toList!690 lt!23554) (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))))))

(assert (= (and d!11141 res!32626) b!58541))

(assert (= (and b!58541 res!32625) b!58542))

(declare-fun m!50249 () Bool)

(assert (=> d!11141 m!50249))

(declare-fun m!50251 () Bool)

(assert (=> d!11141 m!50251))

(declare-fun m!50253 () Bool)

(assert (=> d!11141 m!50253))

(declare-fun m!50255 () Bool)

(assert (=> d!11141 m!50255))

(declare-fun m!50257 () Bool)

(assert (=> b!58541 m!50257))

(declare-fun m!50259 () Bool)

(assert (=> b!58542 m!50259))

(assert (=> b!57528 d!11141))

(declare-fun d!11143 () Bool)

(declare-fun e!38514 () Bool)

(assert (=> d!11143 e!38514))

(declare-fun res!32628 () Bool)

(assert (=> d!11143 (=> (not res!32628) (not e!38514))))

(declare-fun lt!23558 () ListLongMap!1349)

(assert (=> d!11143 (= res!32628 (contains!677 lt!23558 (_1!1023 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(declare-fun lt!23559 () List!1431)

(assert (=> d!11143 (= lt!23558 (ListLongMap!1350 lt!23559))))

(declare-fun lt!23556 () Unit!1484)

(declare-fun lt!23557 () Unit!1484)

(assert (=> d!11143 (= lt!23556 lt!23557)))

(assert (=> d!11143 (= (getValueByKey!121 lt!23559 (_1!1023 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))) (Some!126 (_2!1023 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(assert (=> d!11143 (= lt!23557 (lemmaContainsTupThenGetReturnValue!41 lt!23559 (_1!1023 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) (_2!1023 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(assert (=> d!11143 (= lt!23559 (insertStrictlySorted!44 (toList!690 lt!22838) (_1!1023 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) (_2!1023 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))))))

(assert (=> d!11143 (= (+!80 lt!22838 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) lt!23558)))

(declare-fun b!58543 () Bool)

(declare-fun res!32627 () Bool)

(assert (=> b!58543 (=> (not res!32627) (not e!38514))))

(assert (=> b!58543 (= res!32627 (= (getValueByKey!121 (toList!690 lt!23558) (_1!1023 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))) (Some!126 (_2!1023 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))))))))

(declare-fun b!58544 () Bool)

(assert (=> b!58544 (= e!38514 (contains!681 (toList!690 lt!23558) (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))))))

(assert (= (and d!11143 res!32628) b!58543))

(assert (= (and b!58543 res!32627) b!58544))

(declare-fun m!50261 () Bool)

(assert (=> d!11143 m!50261))

(declare-fun m!50263 () Bool)

(assert (=> d!11143 m!50263))

(declare-fun m!50265 () Bool)

(assert (=> d!11143 m!50265))

(declare-fun m!50267 () Bool)

(assert (=> d!11143 m!50267))

(declare-fun m!50269 () Bool)

(assert (=> b!58543 m!50269))

(declare-fun m!50271 () Bool)

(assert (=> b!58544 m!50271))

(assert (=> b!57528 d!11143))

(declare-fun d!11145 () Bool)

(assert (=> d!11145 (= (apply!65 (+!80 lt!22843 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))) lt!22855) (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!22843 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))) lt!22855)))))

(declare-fun bs!2540 () Bool)

(assert (= bs!2540 d!11145))

(declare-fun m!50273 () Bool)

(assert (=> bs!2540 m!50273))

(assert (=> bs!2540 m!50273))

(declare-fun m!50275 () Bool)

(assert (=> bs!2540 m!50275))

(assert (=> b!57528 d!11145))

(declare-fun d!11147 () Bool)

(assert (=> d!11147 (= (apply!65 lt!22843 lt!22855) (get!1070 (getValueByKey!121 (toList!690 lt!22843) lt!22855)))))

(declare-fun bs!2541 () Bool)

(assert (= bs!2541 d!11147))

(declare-fun m!50277 () Bool)

(assert (=> bs!2541 m!50277))

(assert (=> bs!2541 m!50277))

(declare-fun m!50279 () Bool)

(assert (=> bs!2541 m!50279))

(assert (=> b!57528 d!11147))

(declare-fun d!11149 () Bool)

(assert (=> d!11149 (= (apply!65 (+!80 lt!22838 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) lt!22836) (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!22838 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))) lt!22836)))))

(declare-fun bs!2542 () Bool)

(assert (= bs!2542 d!11149))

(declare-fun m!50281 () Bool)

(assert (=> bs!2542 m!50281))

(assert (=> bs!2542 m!50281))

(declare-fun m!50283 () Bool)

(assert (=> bs!2542 m!50283))

(assert (=> b!57528 d!11149))

(declare-fun d!11151 () Bool)

(assert (=> d!11151 (= (apply!65 (+!80 lt!22845 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) lt!22853) (get!1070 (getValueByKey!121 (toList!690 (+!80 lt!22845 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16))))) lt!22853)))))

(declare-fun bs!2543 () Bool)

(assert (= bs!2543 d!11151))

(declare-fun m!50285 () Bool)

(assert (=> bs!2543 m!50285))

(assert (=> bs!2543 m!50285))

(declare-fun m!50287 () Bool)

(assert (=> bs!2543 m!50287))

(assert (=> b!57528 d!11151))

(declare-fun d!11153 () Bool)

(assert (=> d!11153 (= (apply!65 (+!80 lt!22838 (tuple2!2025 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) lt!22836) (apply!65 lt!22838 lt!22836))))

(declare-fun lt!23560 () Unit!1484)

(assert (=> d!11153 (= lt!23560 (choose!296 lt!22838 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) lt!22836))))

(declare-fun e!38515 () Bool)

(assert (=> d!11153 e!38515))

(declare-fun res!32629 () Bool)

(assert (=> d!11153 (=> (not res!32629) (not e!38515))))

(assert (=> d!11153 (= res!32629 (contains!677 lt!22838 lt!22836))))

(assert (=> d!11153 (= (addApplyDifferent!41 lt!22838 lt!22839 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) lt!22836) lt!23560)))

(declare-fun b!58545 () Bool)

(assert (=> b!58545 (= e!38515 (not (= lt!22836 lt!22839)))))

(assert (= (and d!11153 res!32629) b!58545))

(assert (=> d!11153 m!48393))

(assert (=> d!11153 m!48401))

(assert (=> d!11153 m!48397))

(declare-fun m!50289 () Bool)

(assert (=> d!11153 m!50289))

(declare-fun m!50291 () Bool)

(assert (=> d!11153 m!50291))

(assert (=> d!11153 m!48393))

(assert (=> b!57528 d!11153))

(declare-fun d!11155 () Bool)

(assert (=> d!11155 (= (apply!65 (+!80 lt!22845 (tuple2!2025 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)))) lt!22853) (apply!65 lt!22845 lt!22853))))

(declare-fun lt!23561 () Unit!1484)

(assert (=> d!11155 (= lt!23561 (choose!296 lt!22845 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) lt!22853))))

(declare-fun e!38516 () Bool)

(assert (=> d!11155 e!38516))

(declare-fun res!32630 () Bool)

(assert (=> d!11155 (=> (not res!32630) (not e!38516))))

(assert (=> d!11155 (= res!32630 (contains!677 lt!22845 lt!22853))))

(assert (=> d!11155 (= (addApplyDifferent!41 lt!22845 lt!22856 (ite c!7050 (ite c!7049 (minValue!1939 newMap!16) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1939 newMap!16)) lt!22853) lt!23561)))

(declare-fun b!58546 () Bool)

(assert (=> b!58546 (= e!38516 (not (= lt!22853 lt!22856)))))

(assert (= (and d!11155 res!32630) b!58546))

(assert (=> d!11155 m!48383))

(assert (=> d!11155 m!48391))

(assert (=> d!11155 m!48375))

(declare-fun m!50293 () Bool)

(assert (=> d!11155 m!50293))

(declare-fun m!50295 () Bool)

(assert (=> d!11155 m!50295))

(assert (=> d!11155 m!48383))

(assert (=> b!57528 d!11155))

(declare-fun d!11157 () Bool)

(declare-fun e!38517 () Bool)

(assert (=> d!11157 e!38517))

(declare-fun res!32632 () Bool)

(assert (=> d!11157 (=> (not res!32632) (not e!38517))))

(declare-fun lt!23564 () ListLongMap!1349)

(assert (=> d!11157 (= res!32632 (contains!677 lt!23564 (_1!1023 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))))))

(declare-fun lt!23565 () List!1431)

(assert (=> d!11157 (= lt!23564 (ListLongMap!1350 lt!23565))))

(declare-fun lt!23562 () Unit!1484)

(declare-fun lt!23563 () Unit!1484)

(assert (=> d!11157 (= lt!23562 lt!23563)))

(assert (=> d!11157 (= (getValueByKey!121 lt!23565 (_1!1023 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))) (Some!126 (_2!1023 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))))))

(assert (=> d!11157 (= lt!23563 (lemmaContainsTupThenGetReturnValue!41 lt!23565 (_1!1023 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))) (_2!1023 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))))))

(assert (=> d!11157 (= lt!23565 (insertStrictlySorted!44 (toList!690 lt!22843) (_1!1023 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))) (_2!1023 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))))))

(assert (=> d!11157 (= (+!80 lt!22843 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))) lt!23564)))

(declare-fun b!58547 () Bool)

(declare-fun res!32631 () Bool)

(assert (=> b!58547 (=> (not res!32631) (not e!38517))))

(assert (=> b!58547 (= res!32631 (= (getValueByKey!121 (toList!690 lt!23564) (_1!1023 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))) (Some!126 (_2!1023 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))))))))

(declare-fun b!58548 () Bool)

(assert (=> b!58548 (= e!38517 (contains!681 (toList!690 lt!23564) (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))))))

(assert (= (and d!11157 res!32632) b!58547))

(assert (= (and b!58547 res!32631) b!58548))

(declare-fun m!50297 () Bool)

(assert (=> d!11157 m!50297))

(declare-fun m!50299 () Bool)

(assert (=> d!11157 m!50299))

(declare-fun m!50301 () Bool)

(assert (=> d!11157 m!50301))

(declare-fun m!50303 () Bool)

(assert (=> d!11157 m!50303))

(declare-fun m!50305 () Bool)

(assert (=> b!58547 m!50305))

(declare-fun m!50307 () Bool)

(assert (=> b!58548 m!50307))

(assert (=> b!57528 d!11157))

(declare-fun d!11159 () Bool)

(declare-fun e!38518 () Bool)

(assert (=> d!11159 e!38518))

(declare-fun res!32634 () Bool)

(assert (=> d!11159 (=> (not res!32634) (not e!38518))))

(declare-fun lt!23568 () ListLongMap!1349)

(assert (=> d!11159 (= res!32634 (contains!677 lt!23568 (_1!1023 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))))))

(declare-fun lt!23569 () List!1431)

(assert (=> d!11159 (= lt!23568 (ListLongMap!1350 lt!23569))))

(declare-fun lt!23566 () Unit!1484)

(declare-fun lt!23567 () Unit!1484)

(assert (=> d!11159 (= lt!23566 lt!23567)))

(assert (=> d!11159 (= (getValueByKey!121 lt!23569 (_1!1023 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))) (Some!126 (_2!1023 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))))))

(assert (=> d!11159 (= lt!23567 (lemmaContainsTupThenGetReturnValue!41 lt!23569 (_1!1023 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))) (_2!1023 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))))))

(assert (=> d!11159 (= lt!23569 (insertStrictlySorted!44 (toList!690 lt!22847) (_1!1023 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))) (_2!1023 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))))))

(assert (=> d!11159 (= (+!80 lt!22847 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))) lt!23568)))

(declare-fun b!58549 () Bool)

(declare-fun res!32633 () Bool)

(assert (=> b!58549 (=> (not res!32633) (not e!38518))))

(assert (=> b!58549 (= res!32633 (= (getValueByKey!121 (toList!690 lt!23568) (_1!1023 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16))))) (Some!126 (_2!1023 (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))))))))

(declare-fun b!58550 () Bool)

(assert (=> b!58550 (= e!38518 (contains!681 (toList!690 lt!23568) (tuple2!2025 lt!22842 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))))))

(assert (= (and d!11159 res!32634) b!58549))

(assert (= (and b!58549 res!32633) b!58550))

(declare-fun m!50309 () Bool)

(assert (=> d!11159 m!50309))

(declare-fun m!50311 () Bool)

(assert (=> d!11159 m!50311))

(declare-fun m!50313 () Bool)

(assert (=> d!11159 m!50313))

(declare-fun m!50315 () Bool)

(assert (=> d!11159 m!50315))

(declare-fun m!50317 () Bool)

(assert (=> b!58549 m!50317))

(declare-fun m!50319 () Bool)

(assert (=> b!58550 m!50319))

(assert (=> b!57528 d!11159))

(declare-fun d!11161 () Bool)

(assert (=> d!11161 (= (apply!65 lt!22845 lt!22853) (get!1070 (getValueByKey!121 (toList!690 lt!22845) lt!22853)))))

(declare-fun bs!2544 () Bool)

(assert (= bs!2544 d!11161))

(declare-fun m!50321 () Bool)

(assert (=> bs!2544 m!50321))

(assert (=> bs!2544 m!50321))

(declare-fun m!50323 () Bool)

(assert (=> bs!2544 m!50323))

(assert (=> b!57528 d!11161))

(declare-fun d!11163 () Bool)

(assert (=> d!11163 (= (apply!65 (+!80 lt!22843 (tuple2!2025 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)))) lt!22855) (apply!65 lt!22843 lt!22855))))

(declare-fun lt!23570 () Unit!1484)

(assert (=> d!11163 (= lt!23570 (choose!296 lt!22843 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) lt!22855))))

(declare-fun e!38519 () Bool)

(assert (=> d!11163 e!38519))

(declare-fun res!32635 () Bool)

(assert (=> d!11163 (=> (not res!32635) (not e!38519))))

(assert (=> d!11163 (= res!32635 (contains!677 lt!22843 lt!22855))))

(assert (=> d!11163 (= (addApplyDifferent!41 lt!22843 lt!22850 (ite (and c!7050 c!7049) (get!1065 (select (arr!1763 (_values!2004 (v!2361 (underlying!220 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1939 newMap!16)) lt!22855) lt!23570)))

(declare-fun b!58551 () Bool)

(assert (=> b!58551 (= e!38519 (not (= lt!22855 lt!22850)))))

(assert (= (and d!11163 res!32635) b!58551))

(assert (=> d!11163 m!48385))

(assert (=> d!11163 m!48387))

(assert (=> d!11163 m!48377))

(declare-fun m!50325 () Bool)

(assert (=> d!11163 m!50325))

(declare-fun m!50327 () Bool)

(assert (=> d!11163 m!50327))

(assert (=> d!11163 m!48385))

(assert (=> b!57528 d!11163))

(assert (=> b!57512 d!10683))

(declare-fun d!11165 () Bool)

(assert (=> d!11165 (= (get!1070 (getValueByKey!121 (toList!690 lt!22754) lt!22762)) (v!2367 (getValueByKey!121 (toList!690 lt!22754) lt!22762)))))

(assert (=> d!10547 d!11165))

(declare-fun b!58553 () Bool)

(declare-fun e!38520 () Option!127)

(declare-fun e!38521 () Option!127)

(assert (=> b!58553 (= e!38520 e!38521)))

(declare-fun c!7402 () Bool)

(assert (=> b!58553 (= c!7402 (and ((_ is Cons!1427) (toList!690 lt!22754)) (not (= (_1!1023 (h!2007 (toList!690 lt!22754))) lt!22762))))))

(declare-fun b!58555 () Bool)

(assert (=> b!58555 (= e!38521 None!125)))

(declare-fun b!58554 () Bool)

(assert (=> b!58554 (= e!38521 (getValueByKey!121 (t!4744 (toList!690 lt!22754)) lt!22762))))

(declare-fun b!58552 () Bool)

(assert (=> b!58552 (= e!38520 (Some!126 (_2!1023 (h!2007 (toList!690 lt!22754)))))))

(declare-fun d!11167 () Bool)

(declare-fun c!7401 () Bool)

(assert (=> d!11167 (= c!7401 (and ((_ is Cons!1427) (toList!690 lt!22754)) (= (_1!1023 (h!2007 (toList!690 lt!22754))) lt!22762)))))

(assert (=> d!11167 (= (getValueByKey!121 (toList!690 lt!22754) lt!22762) e!38520)))

(assert (= (and d!11167 c!7401) b!58552))

(assert (= (and d!11167 (not c!7401)) b!58553))

(assert (= (and b!58553 c!7402) b!58554))

(assert (= (and b!58553 (not c!7402)) b!58555))

(declare-fun m!50329 () Bool)

(assert (=> b!58554 m!50329))

(assert (=> d!10547 d!11167))

(assert (=> b!57619 d!10893))

(assert (=> b!57619 d!10895))

(assert (=> b!57573 d!11059))

(declare-fun d!11169 () Bool)

(declare-fun isEmpty!296 (List!1431) Bool)

(assert (=> d!11169 (= (isEmpty!294 lt!22790) (isEmpty!296 (toList!690 lt!22790)))))

(declare-fun bs!2545 () Bool)

(assert (= bs!2545 d!11169))

(declare-fun m!50331 () Bool)

(assert (=> bs!2545 m!50331))

(assert (=> b!57427 d!11169))

(assert (=> b!57424 d!10539))

(declare-fun d!11171 () Bool)

(assert (=> d!11171 (isDefined!75 (getValueByKey!121 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!23571 () Unit!1484)

(assert (=> d!11171 (= lt!23571 (choose!297 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!38522 () Bool)

(assert (=> d!11171 e!38522))

(declare-fun res!32636 () Bool)

(assert (=> d!11171 (=> (not res!32636) (not e!38522))))

(assert (=> d!11171 (= res!32636 (isStrictlySorted!278 (toList!690 lt!22766)))))

(assert (=> d!11171 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!23571)))

(declare-fun b!58556 () Bool)

(assert (=> b!58556 (= e!38522 (containsKey!125 (toList!690 lt!22766) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!11171 res!32636) b!58556))

(assert (=> d!11171 m!48119))

(assert (=> d!11171 m!48567))

(assert (=> d!11171 m!48567))

(assert (=> d!11171 m!48569))

(assert (=> d!11171 m!48119))

(declare-fun m!50333 () Bool)

(assert (=> d!11171 m!50333))

(assert (=> d!11171 m!49223))

(assert (=> b!58556 m!48119))

(assert (=> b!58556 m!48563))

(assert (=> b!57620 d!11171))

(assert (=> b!57620 d!10671))

(assert (=> b!57620 d!10673))

(declare-fun d!11173 () Bool)

(assert (=> d!11173 (= (inRange!0 (index!3039 lt!22933) (mask!5894 newMap!16)) (and (bvsge (index!3039 lt!22933) #b00000000000000000000000000000000) (bvslt (index!3039 lt!22933) (bvadd (mask!5894 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> b!57627 d!11173))

(declare-fun d!11175 () Bool)

(declare-fun res!32637 () Bool)

(declare-fun e!38523 () Bool)

(assert (=> d!11175 (=> res!32637 e!38523)))

(assert (=> d!11175 (= res!32637 (= (select (arr!1762 (_keys!3640 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355)))))

(assert (=> d!11175 (= (arrayContainsKey!0 (_keys!3640 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!38523)))

(declare-fun b!58557 () Bool)

(declare-fun e!38524 () Bool)

(assert (=> b!58557 (= e!38523 e!38524)))

(declare-fun res!32638 () Bool)

(assert (=> b!58557 (=> (not res!32638) (not e!38524))))

(assert (=> b!58557 (= res!32638 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1992 (_keys!3640 newMap!16))))))

(declare-fun b!58558 () Bool)

(assert (=> b!58558 (= e!38524 (arrayContainsKey!0 (_keys!3640 newMap!16) (select (arr!1762 (_keys!3640 (v!2361 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!11175 (not res!32637)) b!58557))

(assert (= (and b!58557 res!32638) b!58558))

(assert (=> d!11175 m!49589))

(assert (=> b!58558 m!47913))

(declare-fun m!50335 () Bool)

(assert (=> b!58558 m!50335))

(assert (=> b!57532 d!11175))

(assert (=> d!10541 d!10551))

(assert (=> d!10541 d!10555))

(declare-fun d!11177 () Bool)

(assert (=> d!11177 (contains!677 (+!80 lt!22756 (tuple2!2025 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))))) lt!22749)))

(assert (=> d!11177 true))

(declare-fun _$35!297 () Unit!1484)

(assert (=> d!11177 (= (choose!295 lt!22756 lt!22751 (zeroValue!1939 (v!2361 (underlying!220 thiss!992))) lt!22749) _$35!297)))

(declare-fun bs!2546 () Bool)

(assert (= bs!2546 d!11177))

(assert (=> bs!2546 m!48157))

(assert (=> bs!2546 m!48157))

(assert (=> bs!2546 m!48167))

(assert (=> d!10541 d!11177))

(declare-fun d!11179 () Bool)

(declare-fun e!38525 () Bool)

(assert (=> d!11179 e!38525))

(declare-fun res!32639 () Bool)

(assert (=> d!11179 (=> res!32639 e!38525)))

(declare-fun lt!23572 () Bool)

(assert (=> d!11179 (= res!32639 (not lt!23572))))

(declare-fun lt!23575 () Bool)

(assert (=> d!11179 (= lt!23572 lt!23575)))

(declare-fun lt!23574 () Unit!1484)

(declare-fun e!38526 () Unit!1484)

(assert (=> d!11179 (= lt!23574 e!38526)))

(declare-fun c!7403 () Bool)

(assert (=> d!11179 (= c!7403 lt!23575)))

(assert (=> d!11179 (= lt!23575 (containsKey!125 (toList!690 lt!22756) lt!22749))))

(assert (=> d!11179 (= (contains!677 lt!22756 lt!22749) lt!23572)))

(declare-fun b!58560 () Bool)

(declare-fun lt!23573 () Unit!1484)

(assert (=> b!58560 (= e!38526 lt!23573)))

(assert (=> b!58560 (= lt!23573 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!690 lt!22756) lt!22749))))

(assert (=> b!58560 (isDefined!75 (getValueByKey!121 (toList!690 lt!22756) lt!22749))))

(declare-fun b!58561 () Bool)

(declare-fun Unit!1549 () Unit!1484)

(assert (=> b!58561 (= e!38526 Unit!1549)))

(declare-fun b!58562 () Bool)

(assert (=> b!58562 (= e!38525 (isDefined!75 (getValueByKey!121 (toList!690 lt!22756) lt!22749)))))

(assert (= (and d!11179 c!7403) b!58560))

(assert (= (and d!11179 (not c!7403)) b!58561))

(assert (= (and d!11179 (not res!32639)) b!58562))

(declare-fun m!50337 () Bool)

(assert (=> d!11179 m!50337))

(declare-fun m!50339 () Bool)

(assert (=> b!58560 m!50339))

(declare-fun m!50341 () Bool)

(assert (=> b!58560 m!50341))

(assert (=> b!58560 m!50341))

(declare-fun m!50343 () Bool)

(assert (=> b!58560 m!50343))

(assert (=> b!58562 m!50341))

(assert (=> b!58562 m!50341))

(assert (=> b!58562 m!50343))

(assert (=> d!10541 d!11179))

(declare-fun b!58564 () Bool)

(declare-fun e!38527 () Bool)

(assert (=> b!58564 (= e!38527 tp_is_empty!2389)))

(declare-fun mapIsEmpty!2861 () Bool)

(declare-fun mapRes!2861 () Bool)

(assert (=> mapIsEmpty!2861 mapRes!2861))

(declare-fun b!58563 () Bool)

(declare-fun e!38528 () Bool)

(assert (=> b!58563 (= e!38528 tp_is_empty!2389)))

(declare-fun mapNonEmpty!2861 () Bool)

(declare-fun tp!7973 () Bool)

(assert (=> mapNonEmpty!2861 (= mapRes!2861 (and tp!7973 e!38528))))

(declare-fun mapValue!2861 () ValueCell!851)

(declare-fun mapKey!2861 () (_ BitVec 32))

(declare-fun mapRest!2861 () (Array (_ BitVec 32) ValueCell!851))

(assert (=> mapNonEmpty!2861 (= mapRest!2859 (store mapRest!2861 mapKey!2861 mapValue!2861))))

(declare-fun condMapEmpty!2861 () Bool)

(declare-fun mapDefault!2861 () ValueCell!851)

(assert (=> mapNonEmpty!2859 (= condMapEmpty!2861 (= mapRest!2859 ((as const (Array (_ BitVec 32) ValueCell!851)) mapDefault!2861)))))

(assert (=> mapNonEmpty!2859 (= tp!7971 (and e!38527 mapRes!2861))))

(assert (= (and mapNonEmpty!2859 condMapEmpty!2861) mapIsEmpty!2861))

(assert (= (and mapNonEmpty!2859 (not condMapEmpty!2861)) mapNonEmpty!2861))

(assert (= (and mapNonEmpty!2861 ((_ is ValueCellFull!851) mapValue!2861)) b!58563))

(assert (= (and mapNonEmpty!2859 ((_ is ValueCellFull!851) mapDefault!2861)) b!58564))

(declare-fun m!50345 () Bool)

(assert (=> mapNonEmpty!2861 m!50345))

(declare-fun b!58566 () Bool)

(declare-fun e!38529 () Bool)

(assert (=> b!58566 (= e!38529 tp_is_empty!2389)))

(declare-fun mapIsEmpty!2862 () Bool)

(declare-fun mapRes!2862 () Bool)

(assert (=> mapIsEmpty!2862 mapRes!2862))

(declare-fun b!58565 () Bool)

(declare-fun e!38530 () Bool)

(assert (=> b!58565 (= e!38530 tp_is_empty!2389)))

(declare-fun mapNonEmpty!2862 () Bool)

(declare-fun tp!7974 () Bool)

(assert (=> mapNonEmpty!2862 (= mapRes!2862 (and tp!7974 e!38530))))

(declare-fun mapValue!2862 () ValueCell!851)

(declare-fun mapRest!2862 () (Array (_ BitVec 32) ValueCell!851))

(declare-fun mapKey!2862 () (_ BitVec 32))

(assert (=> mapNonEmpty!2862 (= mapRest!2860 (store mapRest!2862 mapKey!2862 mapValue!2862))))

(declare-fun condMapEmpty!2862 () Bool)

(declare-fun mapDefault!2862 () ValueCell!851)

(assert (=> mapNonEmpty!2860 (= condMapEmpty!2862 (= mapRest!2860 ((as const (Array (_ BitVec 32) ValueCell!851)) mapDefault!2862)))))

(assert (=> mapNonEmpty!2860 (= tp!7972 (and e!38529 mapRes!2862))))

(assert (= (and mapNonEmpty!2860 condMapEmpty!2862) mapIsEmpty!2862))

(assert (= (and mapNonEmpty!2860 (not condMapEmpty!2862)) mapNonEmpty!2862))

(assert (= (and mapNonEmpty!2862 ((_ is ValueCellFull!851) mapValue!2862)) b!58565))

(assert (= (and mapNonEmpty!2860 ((_ is ValueCellFull!851) mapDefault!2862)) b!58566))

(declare-fun m!50347 () Bool)

(assert (=> mapNonEmpty!2862 m!50347))

(declare-fun b_lambda!2553 () Bool)

(assert (= b_lambda!2527 (or (and b!57026 b_free!1945) (and b!57016 b_free!1947 (= (defaultEntry!2021 newMap!16) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))))) b_lambda!2553)))

(declare-fun b_lambda!2555 () Bool)

(assert (= b_lambda!2545 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2555)))

(declare-fun b_lambda!2557 () Bool)

(assert (= b_lambda!2529 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2557)))

(declare-fun b_lambda!2559 () Bool)

(assert (= b_lambda!2535 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2559)))

(declare-fun b_lambda!2561 () Bool)

(assert (= b_lambda!2551 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2561)))

(declare-fun b_lambda!2563 () Bool)

(assert (= b_lambda!2543 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2563)))

(declare-fun b_lambda!2565 () Bool)

(assert (= b_lambda!2537 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2565)))

(declare-fun b_lambda!2567 () Bool)

(assert (= b_lambda!2525 (or (and b!57026 b_free!1945) (and b!57016 b_free!1947 (= (defaultEntry!2021 newMap!16) (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))))) b_lambda!2567)))

(declare-fun b_lambda!2569 () Bool)

(assert (= b_lambda!2531 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2569)))

(declare-fun b_lambda!2571 () Bool)

(assert (= b_lambda!2547 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2571)))

(declare-fun b_lambda!2573 () Bool)

(assert (= b_lambda!2533 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2573)))

(declare-fun b_lambda!2575 () Bool)

(assert (= b_lambda!2539 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2575)))

(declare-fun b_lambda!2577 () Bool)

(assert (= b_lambda!2541 (or (and b!57026 b_free!1945 (= (defaultEntry!2021 (v!2361 (underlying!220 thiss!992))) (defaultEntry!2021 newMap!16))) (and b!57016 b_free!1947) b_lambda!2577)))

(check-sat (not d!10873) (not d!11171) (not b!57930) (not bm!4272) (not d!10801) (not d!11159) (not d!11111) (not b!58209) (not bm!4256) (not b!58374) (not bm!4209) (not d!10977) (not d!10733) (not d!11069) (not b!58385) (not d!11051) (not b!58264) (not d!10675) (not d!10737) (not d!10943) (not bm!4237) (not bm!4222) (not d!10915) (not b!57963) (not d!10933) (not b!58473) (not b!57857) (not b!57758) (not b!57805) (not b!58285) (not b!58058) (not b!58350) (not bm!4253) (not d!11131) (not b!58345) (not d!11143) (not bm!4296) (not b_lambda!2553) (not d!10973) (not b!58409) (not b!58061) (not b!58338) (not b!58511) (not b!58233) (not bm!4289) (not b!58075) (not b!58134) (not b!58330) (not b!58166) (not b!57889) (not b!57981) (not bm!4216) (not b!58331) (not b!58471) (not d!10809) (not b!58140) (not b!57962) (not b!57891) (not b_lambda!2555) (not b!58303) (not b!58406) (not b_lambda!2503) (not d!10843) (not b!58562) (not b!57768) (not b!58296) (not b!58318) (not d!10697) (not bm!4282) (not b!58533) (not d!11149) (not d!10731) (not b!57978) (not b!57814) (not b!58251) (not d!11135) (not bm!4232) (not b!58122) (not d!10791) (not b!58535) (not b!57881) (not b_lambda!2499) (not d!11169) (not d!10955) (not d!10831) (not b!58205) (not b!58141) (not b!58523) (not b!57788) (not b!57820) (not b!58509) (not b!57800) (not b!58327) (not b!58127) (not b!57953) (not b!58083) (not b!58139) (not b!58190) (not d!10813) (not d!10881) (not b!58518) (not b!58152) (not b!58322) (not b!57966) (not d!11127) (not d!10839) (not bm!4265) (not b!57973) (not b!58102) (not b!58476) (not d!11089) (not b!58452) (not d!10859) (not b!57753) (not b!58321) (not b!58359) (not d!11055) (not d!10913) (not b_lambda!2515) (not d!10781) (not b!57772) (not b!57902) (not b!57910) (not d!10899) (not d!10959) (not d!10677) (not b_lambda!2569) (not b!58395) (not b!58026) (not d!10971) (not d!11157) (not b!57818) (not d!11027) (not bm!4303) (not b_lambda!2557) (not d!11049) (not b_lambda!2565) (not b!58459) (not b!58111) (not d!10919) (not b!58393) (not b!58242) (not d!11177) (not bm!4249) (not b!57979) (not bm!4266) (not d!11093) (not bm!4276) (not bm!4273) (not d!10937) (not b!57862) (not d!10957) (not bm!4271) (not b!57767) (not b!58413) (not b!58541) (not b!58290) (not b!58556) (not b!58366) (not b!58157) (not d!10953) (not bm!4283) (not d!11161) (not b!57872) (not bm!4304) (not b!57915) (not b!57854) (not b!58031) (not b!58527) (not b!57926) (not bm!4219) (not d!10851) (not b!58550) (not b!58346) tp_is_empty!2389 (not b_lambda!2575) (not b!58129) (not b!58067) (not b!58262) (not b!58558) (not bm!4261) b_and!3537 (not d!10743) (not b!57804) (not b!58272) (not d!10771) (not bm!4295) (not d!10941) (not d!11045) (not b_lambda!2561) (not b!58164) (not bm!4292) (not bm!4257) (not b!58057) (not b!58306) (not b!57821) (not b_lambda!2521) (not b!58019) (not d!10845) (not d!10979) (not b!58425) (not d!10893) (not d!11107) (not b!58053) (not b!57919) (not b!58260) (not b!58215) (not b!57972) (not b!58530) (not d!11139) (not b!58298) (not b!58256) (not b!57980) (not b!58220) (not d!10713) (not b!58038) (not d!11039) (not b!57815) (not b!57873) (not b!58297) (not b!57879) (not b!57942) (not b!58196) (not d!10961) (not b!57806) (not b!57921) (not b!58319) (not b!58493) (not bm!4264) (not b!57870) (not b!58420) (not b!58364) (not b!58484) (not b_lambda!2577) (not b!58438) (not d!11141) (not b!58032) (not d!11109) (not b!58376) (not b!57993) (not b!58538) (not bm!4226) (not b!58064) (not b!58267) (not b!57943) (not b!58231) (not b!58411) (not b!58461) (not bm!4234) (not bm!4228) (not b!57992) (not bm!4258) (not d!10727) (not b!57765) (not d!11179) (not b!57977) (not d!10963) (not b!58055) (not bm!4250) (not b!57965) (not b!58169) (not b!58392) (not bm!4246) (not b!58307) (not d!10799) (not b!58450) (not d!10793) (not b!58244) (not b!58247) (not b!57795) (not d!10925) (not d!10947) (not d!11063) (not b!58418) (not b!57875) (not d!10821) (not b!57796) (not d!10875) (not b!57803) (not d!11117) (not b!57785) (not b!57760) (not d!11031) (not b!58439) (not d!10867) (not d!10807) (not b!58226) (not d!10975) (not d!10811) (not b!57809) (not bm!4301) (not b_next!1947) (not b!58199) (not b!57975) (not d!10759) (not d!11163) (not d!11023) (not b!58048) (not d!10719) (not d!10827) (not b!58225) (not b!58398) (not b!58132) (not b!57903) (not b!58363) (not d!10667) (not d!10777) (not d!11155) (not d!11021) (not d!11105) (not bm!4235) (not d!10751) (not b!58521) (not bm!4263) (not b!58154) (not d!10735) (not d!10723) (not d!10711) (not b!58317) (not d!11013) (not bm!4210) (not d!11151) (not d!11003) (not b!58237) (not b!58050) (not b!58273) (not b!58024) (not b!58371) (not d!11095) (not d!10989) (not d!11147) (not d!10929) (not b!58389) (not b!58560) (not b!58202) (not b!57861) (not b!58348) (not b!58257) (not d!10871) (not b!58549) (not b!58266) (not b!58356) (not d!11067) (not bm!4269) (not d!11099) (not d!10965) (not b!58250) (not b!58021) (not d!11129) (not b_lambda!2573) (not b!58145) (not d!10739) (not b!58433) b_and!3539 (not d!10931) (not b!58510) (not d!10765) (not d!10901) (not b!58540) (not b!57763) (not d!11057) (not d!10853) (not b!58082) (not b!58354) (not b!58146) (not b!57970) (not b!58324) (not bm!4218) (not b!58213) (not b!58043) (not bm!4217) (not d!10997) (not b!58504) (not b!57936) (not b_next!1945) (not b!58499) (not bm!4278) (not b!58554) (not d!10725) (not b!58118) (not b!58368) (not mapNonEmpty!2862) (not b!57811) (not b!58066) (not b!58240) (not b!57825) (not b!57896) (not b!58276) (not d!10721) (not d!10987) (not mapNonEmpty!2861) (not b!57895) (not b!58429) (not b!58219) (not b!57878) (not d!10891) (not b!57882) (not d!10729) (not d!10695) (not b!58045) (not b!58341) (not b!58378) (not b!58404) (not b!58436) (not b!58532) (not b!58283) (not b!58115) (not bm!4211) (not b!58300) (not b!58249) (not b!58184) (not d!10795) (not d!11075) (not d!10717) (not b!57944) (not b!58270) (not d!11133) (not d!10855) (not b!58040) (not b!58135) (not d!11145) (not d!10817) (not d!11119) (not d!10885) (not b!58289) (not bm!4224) (not b!58227) (not d!10833) (not b!58472) (not b!57750) (not b!58543) (not b!58189) (not bm!4294) (not b!58112) (not bm!4281) (not b!58369) (not d!10921) (not b!57868) (not b_lambda!2523) (not b!58160) (not b!58268) (not b!58400) (not d!11019) (not d!10773) (not b_lambda!2559) (not b!58548) (not b!58466) (not bm!4277) (not b!57950) (not bm!4236) (not b!58014) (not b!57801) (not b!58121) (not d!11029) (not d!10967) (not b!58455) (not b!57986) (not b!58080) (not b!58489) (not b!57968) (not b_lambda!2571) (not d!10755) (not d!10741) (not d!11001) (not d!11085) (not b_lambda!2549) (not d!11153) (not b!58497) (not b!57748) (not b!57905) (not d!10905) (not b!58204) (not d!10775) (not b!58228) (not b!57792) (not d!10863) (not b!58052) (not b!58390) (not d!10951) (not b!58230) (not b!58235) (not b!57937) (not b!58445) (not b!57816) (not b!57766) (not b!57757) (not bm!4229) (not d!10825) (not d!10691) (not b!58486) (not b!58155) (not b!57777) (not bm!4302) (not b!58150) (not b!58113) (not b!58142) (not b!57755) (not b!58525) (not bm!4225) (not b!58269) (not b!58305) (not b!58431) (not b!58447) (not b!58412) (not b!58403) (not b!58490) (not d!11041) (not b!57775) (not b_lambda!2567) (not b!57932) (not d!11137) (not d!10769) (not b!58295) (not bm!4227) (not d!10819) (not b!58044) (not b!58054) (not b!58542) (not d!10969) (not d!10685) (not d!10917) (not d!10995) (not b!58068) (not d!10869) (not b!58377) (not b!58401) (not b!57869) (not d!10687) (not d!10715) (not b_lambda!2563) (not b!57822) (not b!58517) (not d!10993) (not b!58073) (not d!11005) (not d!10757) (not b!58544) (not bm!4299) (not d!11091) (not d!10749) (not b!58514) (not b!58279) (not d!10681) (not b!57783) (not d!10949) (not b!58120) (not b!58488) (not b!57744) (not b!58383) (not b!58480) (not d!10671) (not b!57827) (not b!58333) (not b!58274) (not b!58259) (not b!58271) (not b!58547) (not b!58537) (not b!57864) (not d!10797) (not b!57983) (not b!58536) (not b!58312) (not d!10709) (not b!58465) (not b!57808) (not d!10789) (not b!57901) (not d!10939) (not b!57802) (not b!58440) (not d!11035) (not b!58314) (not b_lambda!2519) (not b_lambda!2517) (not b!58397) (not b!57923) (not bm!4286) (not b!58137) (not d!11073) (not b!58206) (not b!58503) (not d!10829) (not b!58059) (not b!58033) (not b!58029) (not d!10745) (not b!58246) (not b!57947) (not b!57813) (not b!58047) (not d!10999) (not d!10945) (not b!57948) (not b!57798) (not b!57761) (not b!58361) (not b!58529) (not b!58245) (not b!57885))
(check-sat b_and!3537 b_and!3539 (not b_next!1945) (not b_next!1947))
