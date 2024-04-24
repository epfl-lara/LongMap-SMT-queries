; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15260 () Bool)

(assert start!15260)

(declare-fun b!147095 () Bool)

(declare-fun b_free!3145 () Bool)

(declare-fun b_next!3145 () Bool)

(assert (=> b!147095 (= b_free!3145 (not b_next!3145))))

(declare-fun tp!11944 () Bool)

(declare-fun b_and!9229 () Bool)

(assert (=> b!147095 (= tp!11944 b_and!9229)))

(declare-fun b!147096 () Bool)

(declare-fun b_free!3147 () Bool)

(declare-fun b_next!3147 () Bool)

(assert (=> b!147096 (= b_free!3147 (not b_next!3147))))

(declare-fun tp!11943 () Bool)

(declare-fun b_and!9231 () Bool)

(assert (=> b!147096 (= tp!11943 b_and!9231)))

(declare-fun b!147087 () Bool)

(declare-fun res!69926 () Bool)

(declare-fun e!96020 () Bool)

(assert (=> b!147087 (=> (not res!69926) (not e!96020))))

(declare-datatypes ((V!3633 0))(
  ( (V!3634 (val!1539 Int)) )
))
(declare-datatypes ((array!5011 0))(
  ( (array!5012 (arr!2366 (Array (_ BitVec 32) (_ BitVec 64))) (size!2642 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1151 0))(
  ( (ValueCellFull!1151 (v!3371 V!3633)) (EmptyCell!1151) )
))
(declare-datatypes ((array!5013 0))(
  ( (array!5014 (arr!2367 (Array (_ BitVec 32) ValueCell!1151)) (size!2643 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1210 0))(
  ( (LongMapFixedSize!1211 (defaultEntry!3024 Int) (mask!7406 (_ BitVec 32)) (extraKeys!2769 (_ BitVec 32)) (zeroValue!2869 V!3633) (minValue!2869 V!3633) (_size!654 (_ BitVec 32)) (_keys!4793 array!5011) (_values!3007 array!5013) (_vacant!654 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1210)

(declare-fun valid!609 (LongMapFixedSize!1210) Bool)

(assert (=> b!147087 (= res!69926 (valid!609 newMap!16))))

(declare-fun b!147088 () Bool)

(declare-datatypes ((Unit!4645 0))(
  ( (Unit!4646) )
))
(declare-fun e!96032 () Unit!4645)

(declare-fun Unit!4647 () Unit!4645)

(assert (=> b!147088 (= e!96032 Unit!4647)))

(declare-fun b!147089 () Bool)

(declare-fun e!96023 () Bool)

(declare-fun e!96021 () Bool)

(assert (=> b!147089 (= e!96023 e!96021)))

(declare-fun res!69923 () Bool)

(assert (=> b!147089 (=> (not res!69923) (not e!96021))))

(declare-datatypes ((tuple2!2708 0))(
  ( (tuple2!2709 (_1!1365 Bool) (_2!1365 LongMapFixedSize!1210)) )
))
(declare-fun lt!77618 () tuple2!2708)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!147089 (= res!69923 (and (_1!1365 lt!77618) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!77617 () Unit!4645)

(assert (=> b!147089 (= lt!77617 e!96032)))

(declare-datatypes ((Cell!994 0))(
  ( (Cell!995 (v!3372 LongMapFixedSize!1210)) )
))
(declare-datatypes ((LongMap!994 0))(
  ( (LongMap!995 (underlying!508 Cell!994)) )
))
(declare-fun thiss!992 () LongMap!994)

(declare-datatypes ((tuple2!2710 0))(
  ( (tuple2!2711 (_1!1366 (_ BitVec 64)) (_2!1366 V!3633)) )
))
(declare-datatypes ((List!1765 0))(
  ( (Nil!1762) (Cons!1761 (h!2369 tuple2!2710) (t!6486 List!1765)) )
))
(declare-datatypes ((ListLongMap!1731 0))(
  ( (ListLongMap!1732 (toList!881 List!1765)) )
))
(declare-fun lt!77620 () ListLongMap!1731)

(declare-fun c!27753 () Bool)

(declare-fun contains!937 (ListLongMap!1731 (_ BitVec 64)) Bool)

(assert (=> b!147089 (= c!27753 (contains!937 lt!77620 (select (arr!2366 (_keys!4793 (v!3372 (underlying!508 thiss!992)))) from!355)))))

(declare-fun update!228 (LongMapFixedSize!1210 (_ BitVec 64) V!3633) tuple2!2708)

(declare-fun get!1589 (ValueCell!1151 V!3633) V!3633)

(declare-fun dynLambda!461 (Int (_ BitVec 64)) V!3633)

(assert (=> b!147089 (= lt!77618 (update!228 newMap!16 (select (arr!2366 (_keys!4793 (v!3372 (underlying!508 thiss!992)))) from!355) (get!1589 (select (arr!2367 (_values!3007 (v!3372 (underlying!508 thiss!992)))) from!355) (dynLambda!461 (defaultEntry!3024 (v!3372 (underlying!508 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5043 () Bool)

(declare-fun mapRes!5044 () Bool)

(declare-fun tp!11941 () Bool)

(declare-fun e!96031 () Bool)

(assert (=> mapNonEmpty!5043 (= mapRes!5044 (and tp!11941 e!96031))))

(declare-fun mapValue!5043 () ValueCell!1151)

(declare-fun mapRest!5044 () (Array (_ BitVec 32) ValueCell!1151))

(declare-fun mapKey!5043 () (_ BitVec 32))

(assert (=> mapNonEmpty!5043 (= (arr!2367 (_values!3007 (v!3372 (underlying!508 thiss!992)))) (store mapRest!5044 mapKey!5043 mapValue!5043))))

(declare-fun mapIsEmpty!5043 () Bool)

(declare-fun mapRes!5043 () Bool)

(assert (=> mapIsEmpty!5043 mapRes!5043))

(declare-fun b!147090 () Bool)

(declare-fun tp_is_empty!2989 () Bool)

(assert (=> b!147090 (= e!96031 tp_is_empty!2989)))

(declare-fun b!147091 () Bool)

(assert (=> b!147091 (= e!96021 false)))

(declare-fun lt!77619 () ListLongMap!1731)

(declare-fun getCurrentListMapNoExtraKeys!153 (array!5011 array!5013 (_ BitVec 32) (_ BitVec 32) V!3633 V!3633 (_ BitVec 32) Int) ListLongMap!1731)

(assert (=> b!147091 (= lt!77619 (getCurrentListMapNoExtraKeys!153 (_keys!4793 (v!3372 (underlying!508 thiss!992))) (_values!3007 (v!3372 (underlying!508 thiss!992))) (mask!7406 (v!3372 (underlying!508 thiss!992))) (extraKeys!2769 (v!3372 (underlying!508 thiss!992))) (zeroValue!2869 (v!3372 (underlying!508 thiss!992))) (minValue!2869 (v!3372 (underlying!508 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3024 (v!3372 (underlying!508 thiss!992)))))))

(declare-fun b!147092 () Bool)

(declare-fun e!96018 () Bool)

(assert (=> b!147092 (= e!96018 tp_is_empty!2989)))

(declare-fun b!147093 () Bool)

(declare-fun e!96030 () Bool)

(declare-fun e!96019 () Bool)

(assert (=> b!147093 (= e!96030 e!96019)))

(declare-fun b!147094 () Bool)

(declare-fun e!96028 () Bool)

(assert (=> b!147094 (= e!96028 tp_is_empty!2989)))

(declare-fun e!96029 () Bool)

(declare-fun array_inv!1483 (array!5011) Bool)

(declare-fun array_inv!1484 (array!5013) Bool)

(assert (=> b!147095 (= e!96019 (and tp!11944 tp_is_empty!2989 (array_inv!1483 (_keys!4793 (v!3372 (underlying!508 thiss!992)))) (array_inv!1484 (_values!3007 (v!3372 (underlying!508 thiss!992)))) e!96029))))

(declare-fun e!96024 () Bool)

(declare-fun e!96027 () Bool)

(assert (=> b!147096 (= e!96027 (and tp!11943 tp_is_empty!2989 (array_inv!1483 (_keys!4793 newMap!16)) (array_inv!1484 (_values!3007 newMap!16)) e!96024))))

(declare-fun b!147097 () Bool)

(assert (=> b!147097 (= e!96020 e!96023)))

(declare-fun res!69924 () Bool)

(assert (=> b!147097 (=> (not res!69924) (not e!96023))))

(declare-fun lt!77614 () ListLongMap!1731)

(assert (=> b!147097 (= res!69924 (and (= lt!77614 lt!77620) (not (= (select (arr!2366 (_keys!4793 (v!3372 (underlying!508 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2366 (_keys!4793 (v!3372 (underlying!508 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1469 (LongMapFixedSize!1210) ListLongMap!1731)

(assert (=> b!147097 (= lt!77620 (map!1469 newMap!16))))

(declare-fun getCurrentListMap!551 (array!5011 array!5013 (_ BitVec 32) (_ BitVec 32) V!3633 V!3633 (_ BitVec 32) Int) ListLongMap!1731)

(assert (=> b!147097 (= lt!77614 (getCurrentListMap!551 (_keys!4793 (v!3372 (underlying!508 thiss!992))) (_values!3007 (v!3372 (underlying!508 thiss!992))) (mask!7406 (v!3372 (underlying!508 thiss!992))) (extraKeys!2769 (v!3372 (underlying!508 thiss!992))) (zeroValue!2869 (v!3372 (underlying!508 thiss!992))) (minValue!2869 (v!3372 (underlying!508 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3024 (v!3372 (underlying!508 thiss!992)))))))

(declare-fun b!147098 () Bool)

(declare-fun res!69925 () Bool)

(assert (=> b!147098 (=> (not res!69925) (not e!96020))))

(assert (=> b!147098 (= res!69925 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7406 newMap!16)) (_size!654 (v!3372 (underlying!508 thiss!992)))))))

(declare-fun b!147099 () Bool)

(declare-fun e!96026 () Bool)

(assert (=> b!147099 (= e!96026 e!96030)))

(declare-fun b!147100 () Bool)

(declare-fun res!69928 () Bool)

(assert (=> b!147100 (=> (not res!69928) (not e!96020))))

(assert (=> b!147100 (= res!69928 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2642 (_keys!4793 (v!3372 (underlying!508 thiss!992)))))))))

(declare-fun b!147101 () Bool)

(declare-fun Unit!4648 () Unit!4645)

(assert (=> b!147101 (= e!96032 Unit!4648)))

(declare-fun lt!77615 () Unit!4645)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!156 (array!5011 array!5013 (_ BitVec 32) (_ BitVec 32) V!3633 V!3633 (_ BitVec 64) (_ BitVec 32) Int) Unit!4645)

(assert (=> b!147101 (= lt!77615 (lemmaListMapContainsThenArrayContainsFrom!156 (_keys!4793 (v!3372 (underlying!508 thiss!992))) (_values!3007 (v!3372 (underlying!508 thiss!992))) (mask!7406 (v!3372 (underlying!508 thiss!992))) (extraKeys!2769 (v!3372 (underlying!508 thiss!992))) (zeroValue!2869 (v!3372 (underlying!508 thiss!992))) (minValue!2869 (v!3372 (underlying!508 thiss!992))) (select (arr!2366 (_keys!4793 (v!3372 (underlying!508 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3024 (v!3372 (underlying!508 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!5011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147101 (arrayContainsKey!0 (_keys!4793 (v!3372 (underlying!508 thiss!992))) (select (arr!2366 (_keys!4793 (v!3372 (underlying!508 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!77616 () Unit!4645)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5011 (_ BitVec 32) (_ BitVec 32)) Unit!4645)

(assert (=> b!147101 (= lt!77616 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4793 (v!3372 (underlying!508 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1766 0))(
  ( (Nil!1763) (Cons!1762 (h!2370 (_ BitVec 64)) (t!6487 List!1766)) )
))
(declare-fun arrayNoDuplicates!0 (array!5011 (_ BitVec 32) List!1766) Bool)

(assert (=> b!147101 (arrayNoDuplicates!0 (_keys!4793 (v!3372 (underlying!508 thiss!992))) from!355 Nil!1763)))

(declare-fun lt!77621 () Unit!4645)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5011 (_ BitVec 32) (_ BitVec 64) List!1766) Unit!4645)

(assert (=> b!147101 (= lt!77621 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4793 (v!3372 (underlying!508 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2366 (_keys!4793 (v!3372 (underlying!508 thiss!992)))) from!355) (Cons!1762 (select (arr!2366 (_keys!4793 (v!3372 (underlying!508 thiss!992)))) from!355) Nil!1763)))))

(assert (=> b!147101 false))

(declare-fun b!147102 () Bool)

(declare-fun e!96033 () Bool)

(assert (=> b!147102 (= e!96033 tp_is_empty!2989)))

(declare-fun b!147103 () Bool)

(assert (=> b!147103 (= e!96029 (and e!96028 mapRes!5044))))

(declare-fun condMapEmpty!5043 () Bool)

(declare-fun mapDefault!5044 () ValueCell!1151)

(assert (=> b!147103 (= condMapEmpty!5043 (= (arr!2367 (_values!3007 (v!3372 (underlying!508 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1151)) mapDefault!5044)))))

(declare-fun b!147104 () Bool)

(assert (=> b!147104 (= e!96024 (and e!96018 mapRes!5043))))

(declare-fun condMapEmpty!5044 () Bool)

(declare-fun mapDefault!5043 () ValueCell!1151)

(assert (=> b!147104 (= condMapEmpty!5044 (= (arr!2367 (_values!3007 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1151)) mapDefault!5043)))))

(declare-fun mapNonEmpty!5044 () Bool)

(declare-fun tp!11942 () Bool)

(assert (=> mapNonEmpty!5044 (= mapRes!5043 (and tp!11942 e!96033))))

(declare-fun mapRest!5043 () (Array (_ BitVec 32) ValueCell!1151))

(declare-fun mapKey!5044 () (_ BitVec 32))

(declare-fun mapValue!5044 () ValueCell!1151)

(assert (=> mapNonEmpty!5044 (= (arr!2367 (_values!3007 newMap!16)) (store mapRest!5043 mapKey!5044 mapValue!5044))))

(declare-fun res!69927 () Bool)

(assert (=> start!15260 (=> (not res!69927) (not e!96020))))

(declare-fun valid!610 (LongMap!994) Bool)

(assert (=> start!15260 (= res!69927 (valid!610 thiss!992))))

(assert (=> start!15260 e!96020))

(assert (=> start!15260 e!96026))

(assert (=> start!15260 true))

(assert (=> start!15260 e!96027))

(declare-fun mapIsEmpty!5044 () Bool)

(assert (=> mapIsEmpty!5044 mapRes!5044))

(assert (= (and start!15260 res!69927) b!147100))

(assert (= (and b!147100 res!69928) b!147087))

(assert (= (and b!147087 res!69926) b!147098))

(assert (= (and b!147098 res!69925) b!147097))

(assert (= (and b!147097 res!69924) b!147089))

(assert (= (and b!147089 c!27753) b!147101))

(assert (= (and b!147089 (not c!27753)) b!147088))

(assert (= (and b!147089 res!69923) b!147091))

(assert (= (and b!147103 condMapEmpty!5043) mapIsEmpty!5044))

(assert (= (and b!147103 (not condMapEmpty!5043)) mapNonEmpty!5043))

(get-info :version)

(assert (= (and mapNonEmpty!5043 ((_ is ValueCellFull!1151) mapValue!5043)) b!147090))

(assert (= (and b!147103 ((_ is ValueCellFull!1151) mapDefault!5044)) b!147094))

(assert (= b!147095 b!147103))

(assert (= b!147093 b!147095))

(assert (= b!147099 b!147093))

(assert (= start!15260 b!147099))

(assert (= (and b!147104 condMapEmpty!5044) mapIsEmpty!5043))

(assert (= (and b!147104 (not condMapEmpty!5044)) mapNonEmpty!5044))

(assert (= (and mapNonEmpty!5044 ((_ is ValueCellFull!1151) mapValue!5044)) b!147102))

(assert (= (and b!147104 ((_ is ValueCellFull!1151) mapDefault!5043)) b!147092))

(assert (= b!147096 b!147104))

(assert (= start!15260 b!147096))

(declare-fun b_lambda!6597 () Bool)

(assert (=> (not b_lambda!6597) (not b!147089)))

(declare-fun t!6483 () Bool)

(declare-fun tb!2681 () Bool)

(assert (=> (and b!147095 (= (defaultEntry!3024 (v!3372 (underlying!508 thiss!992))) (defaultEntry!3024 (v!3372 (underlying!508 thiss!992)))) t!6483) tb!2681))

(declare-fun result!4383 () Bool)

(assert (=> tb!2681 (= result!4383 tp_is_empty!2989)))

(assert (=> b!147089 t!6483))

(declare-fun b_and!9233 () Bool)

(assert (= b_and!9229 (and (=> t!6483 result!4383) b_and!9233)))

(declare-fun t!6485 () Bool)

(declare-fun tb!2683 () Bool)

(assert (=> (and b!147096 (= (defaultEntry!3024 newMap!16) (defaultEntry!3024 (v!3372 (underlying!508 thiss!992)))) t!6485) tb!2683))

(declare-fun result!4387 () Bool)

(assert (= result!4387 result!4383))

(assert (=> b!147089 t!6485))

(declare-fun b_and!9235 () Bool)

(assert (= b_and!9231 (and (=> t!6485 result!4387) b_and!9235)))

(declare-fun m!176883 () Bool)

(assert (=> b!147095 m!176883))

(declare-fun m!176885 () Bool)

(assert (=> b!147095 m!176885))

(declare-fun m!176887 () Bool)

(assert (=> b!147087 m!176887))

(declare-fun m!176889 () Bool)

(assert (=> mapNonEmpty!5044 m!176889))

(declare-fun m!176891 () Bool)

(assert (=> b!147097 m!176891))

(declare-fun m!176893 () Bool)

(assert (=> b!147097 m!176893))

(declare-fun m!176895 () Bool)

(assert (=> b!147097 m!176895))

(declare-fun m!176897 () Bool)

(assert (=> b!147091 m!176897))

(declare-fun m!176899 () Bool)

(assert (=> b!147101 m!176899))

(declare-fun m!176901 () Bool)

(assert (=> b!147101 m!176901))

(assert (=> b!147101 m!176891))

(declare-fun m!176903 () Bool)

(assert (=> b!147101 m!176903))

(assert (=> b!147101 m!176891))

(assert (=> b!147101 m!176891))

(declare-fun m!176905 () Bool)

(assert (=> b!147101 m!176905))

(assert (=> b!147101 m!176891))

(declare-fun m!176907 () Bool)

(assert (=> b!147101 m!176907))

(declare-fun m!176909 () Bool)

(assert (=> start!15260 m!176909))

(assert (=> b!147089 m!176891))

(declare-fun m!176911 () Bool)

(assert (=> b!147089 m!176911))

(assert (=> b!147089 m!176891))

(declare-fun m!176913 () Bool)

(assert (=> b!147089 m!176913))

(declare-fun m!176915 () Bool)

(assert (=> b!147089 m!176915))

(declare-fun m!176917 () Bool)

(assert (=> b!147089 m!176917))

(assert (=> b!147089 m!176917))

(assert (=> b!147089 m!176911))

(assert (=> b!147089 m!176913))

(assert (=> b!147089 m!176891))

(declare-fun m!176919 () Bool)

(assert (=> b!147089 m!176919))

(declare-fun m!176921 () Bool)

(assert (=> mapNonEmpty!5043 m!176921))

(declare-fun m!176923 () Bool)

(assert (=> b!147096 m!176923))

(declare-fun m!176925 () Bool)

(assert (=> b!147096 m!176925))

(check-sat (not b_next!3147) (not b!147091) (not mapNonEmpty!5044) b_and!9233 (not start!15260) (not b!147087) (not b!147097) tp_is_empty!2989 (not b_lambda!6597) (not mapNonEmpty!5043) (not b!147101) (not b_next!3145) (not b!147095) (not b!147089) b_and!9235 (not b!147096))
(check-sat b_and!9233 b_and!9235 (not b_next!3145) (not b_next!3147))
