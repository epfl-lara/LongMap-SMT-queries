; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8326 () Bool)

(assert start!8326)

(declare-fun b!54887 () Bool)

(declare-fun b_free!1817 () Bool)

(declare-fun b_next!1817 () Bool)

(assert (=> b!54887 (= b_free!1817 (not b_next!1817))))

(declare-fun tp!7552 () Bool)

(declare-fun b_and!3175 () Bool)

(assert (=> b!54887 (= tp!7552 b_and!3175)))

(declare-fun b!54877 () Bool)

(declare-fun b_free!1819 () Bool)

(declare-fun b_next!1819 () Bool)

(assert (=> b!54877 (= b_free!1819 (not b_next!1819))))

(declare-fun tp!7554 () Bool)

(declare-fun b_and!3177 () Bool)

(assert (=> b!54877 (= tp!7554 b_and!3177)))

(declare-fun b!54873 () Bool)

(declare-fun e!35944 () Bool)

(declare-fun e!35948 () Bool)

(assert (=> b!54873 (= e!35944 e!35948)))

(declare-fun b!54874 () Bool)

(declare-fun e!35942 () Bool)

(declare-fun e!35946 () Bool)

(assert (=> b!54874 (= e!35942 e!35946)))

(declare-fun res!30980 () Bool)

(assert (=> b!54874 (=> (not res!30980) (not e!35946))))

(declare-datatypes ((V!2747 0))(
  ( (V!2748 (val!1207 Int)) )
))
(declare-datatypes ((array!3573 0))(
  ( (array!3574 (arr!1709 (Array (_ BitVec 32) (_ BitVec 64))) (size!1938 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!819 0))(
  ( (ValueCellFull!819 (v!2300 V!2747)) (EmptyCell!819) )
))
(declare-datatypes ((array!3575 0))(
  ( (array!3576 (arr!1710 (Array (_ BitVec 32) ValueCell!819)) (size!1939 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!546 0))(
  ( (LongMapFixedSize!547 (defaultEntry!1987 Int) (mask!5838 (_ BitVec 32)) (extraKeys!1878 (_ BitVec 32)) (zeroValue!1905 V!2747) (minValue!1905 V!2747) (_size!322 (_ BitVec 32)) (_keys!3607 array!3573) (_values!1970 array!3575) (_vacant!322 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!362 0))(
  ( (Cell!363 (v!2301 LongMapFixedSize!546)) )
))
(declare-datatypes ((LongMap!362 0))(
  ( (LongMap!363 (underlying!192 Cell!362)) )
))
(declare-fun thiss!992 () LongMap!362)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!1946 0))(
  ( (tuple2!1947 (_1!984 (_ BitVec 64)) (_2!984 V!2747)) )
))
(declare-datatypes ((List!1384 0))(
  ( (Nil!1381) (Cons!1380 (h!1960 tuple2!1946) (t!4570 List!1384)) )
))
(declare-datatypes ((ListLongMap!1321 0))(
  ( (ListLongMap!1322 (toList!676 List!1384)) )
))
(declare-fun lt!21770 () ListLongMap!1321)

(declare-fun lt!21772 () ListLongMap!1321)

(assert (=> b!54874 (= res!30980 (and (= lt!21770 lt!21772) (not (= (select (arr!1709 (_keys!3607 (v!2301 (underlying!192 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1709 (_keys!3607 (v!2301 (underlying!192 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!546)

(declare-fun map!1063 (LongMapFixedSize!546) ListLongMap!1321)

(assert (=> b!54874 (= lt!21772 (map!1063 newMap!16))))

(declare-fun getCurrentListMap!384 (array!3573 array!3575 (_ BitVec 32) (_ BitVec 32) V!2747 V!2747 (_ BitVec 32) Int) ListLongMap!1321)

(assert (=> b!54874 (= lt!21770 (getCurrentListMap!384 (_keys!3607 (v!2301 (underlying!192 thiss!992))) (_values!1970 (v!2301 (underlying!192 thiss!992))) (mask!5838 (v!2301 (underlying!192 thiss!992))) (extraKeys!1878 (v!2301 (underlying!192 thiss!992))) (zeroValue!1905 (v!2301 (underlying!192 thiss!992))) (minValue!1905 (v!2301 (underlying!192 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1987 (v!2301 (underlying!192 thiss!992)))))))

(declare-fun res!30983 () Bool)

(assert (=> start!8326 (=> (not res!30983) (not e!35942))))

(declare-fun valid!213 (LongMap!362) Bool)

(assert (=> start!8326 (= res!30983 (valid!213 thiss!992))))

(assert (=> start!8326 e!35942))

(assert (=> start!8326 e!35944))

(assert (=> start!8326 true))

(declare-fun e!35943 () Bool)

(assert (=> start!8326 e!35943))

(declare-fun mapNonEmpty!2645 () Bool)

(declare-fun mapRes!2645 () Bool)

(declare-fun tp!7551 () Bool)

(declare-fun e!35938 () Bool)

(assert (=> mapNonEmpty!2645 (= mapRes!2645 (and tp!7551 e!35938))))

(declare-fun mapRest!2646 () (Array (_ BitVec 32) ValueCell!819))

(declare-fun mapValue!2645 () ValueCell!819)

(declare-fun mapKey!2645 () (_ BitVec 32))

(assert (=> mapNonEmpty!2645 (= (arr!1710 (_values!1970 newMap!16)) (store mapRest!2646 mapKey!2645 mapValue!2645))))

(declare-fun b!54875 () Bool)

(declare-fun e!35939 () Bool)

(assert (=> b!54875 (= e!35948 e!35939)))

(declare-fun b!54876 () Bool)

(declare-fun e!35949 () Bool)

(assert (=> b!54876 (= e!35949 true)))

(declare-fun lt!21771 () Bool)

(declare-datatypes ((List!1385 0))(
  ( (Nil!1382) (Cons!1381 (h!1961 (_ BitVec 64)) (t!4571 List!1385)) )
))
(declare-fun arrayNoDuplicates!0 (array!3573 (_ BitVec 32) List!1385) Bool)

(assert (=> b!54876 (= lt!21771 (arrayNoDuplicates!0 (_keys!3607 (v!2301 (underlying!192 thiss!992))) #b00000000000000000000000000000000 Nil!1382))))

(declare-fun tp_is_empty!2325 () Bool)

(declare-fun e!35940 () Bool)

(declare-fun array_inv!1057 (array!3573) Bool)

(declare-fun array_inv!1058 (array!3575) Bool)

(assert (=> b!54877 (= e!35943 (and tp!7554 tp_is_empty!2325 (array_inv!1057 (_keys!3607 newMap!16)) (array_inv!1058 (_values!1970 newMap!16)) e!35940))))

(declare-fun b!54878 () Bool)

(declare-fun e!35936 () Bool)

(assert (=> b!54878 (= e!35940 (and e!35936 mapRes!2645))))

(declare-fun condMapEmpty!2646 () Bool)

(declare-fun mapDefault!2646 () ValueCell!819)

(assert (=> b!54878 (= condMapEmpty!2646 (= (arr!1710 (_values!1970 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!819)) mapDefault!2646)))))

(declare-fun b!54879 () Bool)

(assert (=> b!54879 (= e!35938 tp_is_empty!2325)))

(declare-fun b!54880 () Bool)

(declare-fun e!35937 () Bool)

(assert (=> b!54880 (= e!35937 tp_is_empty!2325)))

(declare-fun b!54881 () Bool)

(declare-fun e!35941 () Bool)

(assert (=> b!54881 (= e!35946 e!35941)))

(declare-fun res!30982 () Bool)

(assert (=> b!54881 (=> (not res!30982) (not e!35941))))

(declare-fun contains!649 (ListLongMap!1321 (_ BitVec 64)) Bool)

(assert (=> b!54881 (= res!30982 (contains!649 lt!21772 (select (arr!1709 (_keys!3607 (v!2301 (underlying!192 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1948 0))(
  ( (tuple2!1949 (_1!985 Bool) (_2!985 LongMapFixedSize!546)) )
))
(declare-fun lt!21773 () tuple2!1948)

(declare-fun update!57 (LongMapFixedSize!546 (_ BitVec 64) V!2747) tuple2!1948)

(declare-fun get!1021 (ValueCell!819 V!2747) V!2747)

(declare-fun dynLambda!288 (Int (_ BitVec 64)) V!2747)

(assert (=> b!54881 (= lt!21773 (update!57 newMap!16 (select (arr!1709 (_keys!3607 (v!2301 (underlying!192 thiss!992)))) from!355) (get!1021 (select (arr!1710 (_values!1970 (v!2301 (underlying!192 thiss!992)))) from!355) (dynLambda!288 (defaultEntry!1987 (v!2301 (underlying!192 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54882 () Bool)

(declare-fun res!30984 () Bool)

(assert (=> b!54882 (=> (not res!30984) (not e!35942))))

(assert (=> b!54882 (= res!30984 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5838 newMap!16)) (_size!322 (v!2301 (underlying!192 thiss!992)))))))

(declare-fun mapIsEmpty!2645 () Bool)

(assert (=> mapIsEmpty!2645 mapRes!2645))

(declare-fun b!54883 () Bool)

(declare-fun res!30985 () Bool)

(assert (=> b!54883 (=> (not res!30985) (not e!35942))))

(assert (=> b!54883 (= res!30985 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1938 (_keys!3607 (v!2301 (underlying!192 thiss!992)))))))))

(declare-fun b!54884 () Bool)

(declare-fun e!35947 () Bool)

(assert (=> b!54884 (= e!35947 tp_is_empty!2325)))

(declare-fun b!54885 () Bool)

(declare-fun res!30986 () Bool)

(assert (=> b!54885 (=> (not res!30986) (not e!35942))))

(declare-fun valid!214 (LongMapFixedSize!546) Bool)

(assert (=> b!54885 (= res!30986 (valid!214 newMap!16))))

(declare-fun b!54886 () Bool)

(declare-fun e!35951 () Bool)

(declare-fun mapRes!2646 () Bool)

(assert (=> b!54886 (= e!35951 (and e!35937 mapRes!2646))))

(declare-fun condMapEmpty!2645 () Bool)

(declare-fun mapDefault!2645 () ValueCell!819)

(assert (=> b!54886 (= condMapEmpty!2645 (= (arr!1710 (_values!1970 (v!2301 (underlying!192 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!819)) mapDefault!2645)))))

(assert (=> b!54887 (= e!35939 (and tp!7552 tp_is_empty!2325 (array_inv!1057 (_keys!3607 (v!2301 (underlying!192 thiss!992)))) (array_inv!1058 (_values!1970 (v!2301 (underlying!192 thiss!992)))) e!35951))))

(declare-fun b!54888 () Bool)

(assert (=> b!54888 (= e!35941 (not e!35949))))

(declare-fun res!30981 () Bool)

(assert (=> b!54888 (=> res!30981 e!35949)))

(assert (=> b!54888 (= res!30981 (or (bvsge (size!1938 (_keys!3607 (v!2301 (underlying!192 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1938 (_keys!3607 (v!2301 (underlying!192 thiss!992))))) (bvsgt from!355 (size!1938 (_keys!3607 (v!2301 (underlying!192 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54888 (arrayContainsKey!0 (_keys!3607 (v!2301 (underlying!192 thiss!992))) (select (arr!1709 (_keys!3607 (v!2301 (underlying!192 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1441 0))(
  ( (Unit!1442) )
))
(declare-fun lt!21774 () Unit!1441)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!10 (array!3573 array!3575 (_ BitVec 32) (_ BitVec 32) V!2747 V!2747 (_ BitVec 64) (_ BitVec 32) Int) Unit!1441)

(assert (=> b!54888 (= lt!21774 (lemmaListMapContainsThenArrayContainsFrom!10 (_keys!3607 (v!2301 (underlying!192 thiss!992))) (_values!1970 (v!2301 (underlying!192 thiss!992))) (mask!5838 (v!2301 (underlying!192 thiss!992))) (extraKeys!1878 (v!2301 (underlying!192 thiss!992))) (zeroValue!1905 (v!2301 (underlying!192 thiss!992))) (minValue!1905 (v!2301 (underlying!192 thiss!992))) (select (arr!1709 (_keys!3607 (v!2301 (underlying!192 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1987 (v!2301 (underlying!192 thiss!992)))))))

(declare-fun mapNonEmpty!2646 () Bool)

(declare-fun tp!7553 () Bool)

(assert (=> mapNonEmpty!2646 (= mapRes!2646 (and tp!7553 e!35947))))

(declare-fun mapRest!2645 () (Array (_ BitVec 32) ValueCell!819))

(declare-fun mapKey!2646 () (_ BitVec 32))

(declare-fun mapValue!2646 () ValueCell!819)

(assert (=> mapNonEmpty!2646 (= (arr!1710 (_values!1970 (v!2301 (underlying!192 thiss!992)))) (store mapRest!2645 mapKey!2646 mapValue!2646))))

(declare-fun b!54889 () Bool)

(assert (=> b!54889 (= e!35936 tp_is_empty!2325)))

(declare-fun mapIsEmpty!2646 () Bool)

(assert (=> mapIsEmpty!2646 mapRes!2646))

(assert (= (and start!8326 res!30983) b!54883))

(assert (= (and b!54883 res!30985) b!54885))

(assert (= (and b!54885 res!30986) b!54882))

(assert (= (and b!54882 res!30984) b!54874))

(assert (= (and b!54874 res!30980) b!54881))

(assert (= (and b!54881 res!30982) b!54888))

(assert (= (and b!54888 (not res!30981)) b!54876))

(assert (= (and b!54886 condMapEmpty!2645) mapIsEmpty!2646))

(assert (= (and b!54886 (not condMapEmpty!2645)) mapNonEmpty!2646))

(get-info :version)

(assert (= (and mapNonEmpty!2646 ((_ is ValueCellFull!819) mapValue!2646)) b!54884))

(assert (= (and b!54886 ((_ is ValueCellFull!819) mapDefault!2645)) b!54880))

(assert (= b!54887 b!54886))

(assert (= b!54875 b!54887))

(assert (= b!54873 b!54875))

(assert (= start!8326 b!54873))

(assert (= (and b!54878 condMapEmpty!2646) mapIsEmpty!2645))

(assert (= (and b!54878 (not condMapEmpty!2646)) mapNonEmpty!2645))

(assert (= (and mapNonEmpty!2645 ((_ is ValueCellFull!819) mapValue!2645)) b!54879))

(assert (= (and b!54878 ((_ is ValueCellFull!819) mapDefault!2646)) b!54889))

(assert (= b!54877 b!54878))

(assert (= start!8326 b!54877))

(declare-fun b_lambda!2419 () Bool)

(assert (=> (not b_lambda!2419) (not b!54881)))

(declare-fun t!4567 () Bool)

(declare-fun tb!1161 () Bool)

(assert (=> (and b!54887 (= (defaultEntry!1987 (v!2301 (underlying!192 thiss!992))) (defaultEntry!1987 (v!2301 (underlying!192 thiss!992)))) t!4567) tb!1161))

(declare-fun result!2139 () Bool)

(assert (=> tb!1161 (= result!2139 tp_is_empty!2325)))

(assert (=> b!54881 t!4567))

(declare-fun b_and!3179 () Bool)

(assert (= b_and!3175 (and (=> t!4567 result!2139) b_and!3179)))

(declare-fun t!4569 () Bool)

(declare-fun tb!1163 () Bool)

(assert (=> (and b!54877 (= (defaultEntry!1987 newMap!16) (defaultEntry!1987 (v!2301 (underlying!192 thiss!992)))) t!4569) tb!1163))

(declare-fun result!2143 () Bool)

(assert (= result!2143 result!2139))

(assert (=> b!54881 t!4569))

(declare-fun b_and!3181 () Bool)

(assert (= b_and!3177 (and (=> t!4569 result!2143) b_and!3181)))

(declare-fun m!46351 () Bool)

(assert (=> b!54876 m!46351))

(declare-fun m!46353 () Bool)

(assert (=> mapNonEmpty!2645 m!46353))

(declare-fun m!46355 () Bool)

(assert (=> b!54877 m!46355))

(declare-fun m!46357 () Bool)

(assert (=> b!54877 m!46357))

(declare-fun m!46359 () Bool)

(assert (=> b!54888 m!46359))

(assert (=> b!54888 m!46359))

(declare-fun m!46361 () Bool)

(assert (=> b!54888 m!46361))

(assert (=> b!54888 m!46359))

(declare-fun m!46363 () Bool)

(assert (=> b!54888 m!46363))

(declare-fun m!46365 () Bool)

(assert (=> b!54887 m!46365))

(declare-fun m!46367 () Bool)

(assert (=> b!54887 m!46367))

(declare-fun m!46369 () Bool)

(assert (=> mapNonEmpty!2646 m!46369))

(declare-fun m!46371 () Bool)

(assert (=> b!54885 m!46371))

(assert (=> b!54874 m!46359))

(declare-fun m!46373 () Bool)

(assert (=> b!54874 m!46373))

(declare-fun m!46375 () Bool)

(assert (=> b!54874 m!46375))

(declare-fun m!46377 () Bool)

(assert (=> b!54881 m!46377))

(declare-fun m!46379 () Bool)

(assert (=> b!54881 m!46379))

(declare-fun m!46381 () Bool)

(assert (=> b!54881 m!46381))

(assert (=> b!54881 m!46359))

(declare-fun m!46383 () Bool)

(assert (=> b!54881 m!46383))

(assert (=> b!54881 m!46359))

(assert (=> b!54881 m!46379))

(assert (=> b!54881 m!46359))

(assert (=> b!54881 m!46381))

(declare-fun m!46385 () Bool)

(assert (=> b!54881 m!46385))

(assert (=> b!54881 m!46377))

(declare-fun m!46387 () Bool)

(assert (=> start!8326 m!46387))

(check-sat (not b!54887) (not b_lambda!2419) (not b_next!1819) b_and!3179 (not b!54877) (not start!8326) (not mapNonEmpty!2645) b_and!3181 (not mapNonEmpty!2646) (not b!54881) (not b_next!1817) (not b!54876) (not b!54885) (not b!54888) (not b!54874) tp_is_empty!2325)
(check-sat b_and!3179 b_and!3181 (not b_next!1817) (not b_next!1819))
