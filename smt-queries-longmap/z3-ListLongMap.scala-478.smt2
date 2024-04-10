; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9916 () Bool)

(assert start!9916)

(declare-fun b!75012 () Bool)

(declare-fun b_free!2129 () Bool)

(declare-fun b_next!2129 () Bool)

(assert (=> b!75012 (= b_free!2129 (not b_next!2129))))

(declare-fun tp!8571 () Bool)

(declare-fun b_and!4591 () Bool)

(assert (=> b!75012 (= tp!8571 b_and!4591)))

(declare-fun b!74998 () Bool)

(declare-fun b_free!2131 () Bool)

(declare-fun b_next!2131 () Bool)

(assert (=> b!74998 (= b_free!2131 (not b_next!2131))))

(declare-fun tp!8574 () Bool)

(declare-fun b_and!4593 () Bool)

(assert (=> b!74998 (= tp!8574 b_and!4593)))

(declare-fun b!74992 () Bool)

(declare-fun e!49013 () Bool)

(declare-fun tp_is_empty!2481 () Bool)

(assert (=> b!74992 (= e!49013 tp_is_empty!2481)))

(declare-fun b!74993 () Bool)

(declare-fun e!49022 () Bool)

(declare-fun e!49023 () Bool)

(assert (=> b!74993 (= e!49022 e!49023)))

(declare-fun res!39604 () Bool)

(assert (=> b!74993 (=> (not res!39604) (not e!49023))))

(declare-datatypes ((V!2955 0))(
  ( (V!2956 (val!1285 Int)) )
))
(declare-datatypes ((array!3909 0))(
  ( (array!3910 (arr!1865 (Array (_ BitVec 32) (_ BitVec 64))) (size!2104 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!897 0))(
  ( (ValueCellFull!897 (v!2545 V!2955)) (EmptyCell!897) )
))
(declare-datatypes ((array!3911 0))(
  ( (array!3912 (arr!1866 (Array (_ BitVec 32) ValueCell!897)) (size!2105 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!702 0))(
  ( (LongMapFixedSize!703 (defaultEntry!2234 Int) (mask!6211 (_ BitVec 32)) (extraKeys!2089 (_ BitVec 32)) (zeroValue!2134 V!2955) (minValue!2134 V!2955) (_size!400 (_ BitVec 32)) (_keys!3890 array!3909) (_values!2217 array!3911) (_vacant!400 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2130 0))(
  ( (tuple2!2131 (_1!1076 Bool) (_2!1076 LongMapFixedSize!702)) )
))
(declare-fun lt!33811 () tuple2!2130)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!74993 (= res!39604 (and (_1!1076 lt!33811) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2157 0))(
  ( (Unit!2158) )
))
(declare-fun lt!33812 () Unit!2157)

(declare-fun e!49015 () Unit!2157)

(assert (=> b!74993 (= lt!33812 e!49015)))

(declare-datatypes ((Cell!504 0))(
  ( (Cell!505 (v!2546 LongMapFixedSize!702)) )
))
(declare-datatypes ((LongMap!504 0))(
  ( (LongMap!505 (underlying!263 Cell!504)) )
))
(declare-fun thiss!992 () LongMap!504)

(declare-fun c!11339 () Bool)

(declare-datatypes ((tuple2!2132 0))(
  ( (tuple2!2133 (_1!1077 (_ BitVec 64)) (_2!1077 V!2955)) )
))
(declare-datatypes ((List!1482 0))(
  ( (Nil!1479) (Cons!1478 (h!2066 tuple2!2132) (t!5060 List!1482)) )
))
(declare-datatypes ((ListLongMap!1423 0))(
  ( (ListLongMap!1424 (toList!727 List!1482)) )
))
(declare-fun lt!33808 () ListLongMap!1423)

(declare-fun contains!727 (ListLongMap!1423 (_ BitVec 64)) Bool)

(assert (=> b!74993 (= c!11339 (contains!727 lt!33808 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!702)

(declare-fun lt!33806 () V!2955)

(declare-fun update!98 (LongMapFixedSize!702 (_ BitVec 64) V!2955) tuple2!2130)

(assert (=> b!74993 (= lt!33811 (update!98 newMap!16 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))

(declare-fun mapNonEmpty!3197 () Bool)

(declare-fun mapRes!3198 () Bool)

(declare-fun tp!8573 () Bool)

(declare-fun e!49026 () Bool)

(assert (=> mapNonEmpty!3197 (= mapRes!3198 (and tp!8573 e!49026))))

(declare-fun mapValue!3197 () ValueCell!897)

(declare-fun mapRest!3197 () (Array (_ BitVec 32) ValueCell!897))

(declare-fun mapKey!3197 () (_ BitVec 32))

(assert (=> mapNonEmpty!3197 (= (arr!1866 (_values!2217 newMap!16)) (store mapRest!3197 mapKey!3197 mapValue!3197))))

(declare-fun mapNonEmpty!3198 () Bool)

(declare-fun mapRes!3197 () Bool)

(declare-fun tp!8572 () Bool)

(declare-fun e!49012 () Bool)

(assert (=> mapNonEmpty!3198 (= mapRes!3197 (and tp!8572 e!49012))))

(declare-fun mapValue!3198 () ValueCell!897)

(declare-fun mapRest!3198 () (Array (_ BitVec 32) ValueCell!897))

(declare-fun mapKey!3198 () (_ BitVec 32))

(assert (=> mapNonEmpty!3198 (= (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (store mapRest!3198 mapKey!3198 mapValue!3198))))

(declare-fun b!74995 () Bool)

(declare-fun res!39607 () Bool)

(declare-fun e!49011 () Bool)

(assert (=> b!74995 (=> (not res!39607) (not e!49011))))

(declare-fun valid!293 (LongMapFixedSize!702) Bool)

(assert (=> b!74995 (= res!39607 (valid!293 newMap!16))))

(declare-fun b!74996 () Bool)

(declare-fun res!39600 () Bool)

(declare-fun e!49024 () Bool)

(assert (=> b!74996 (=> res!39600 e!49024)))

(assert (=> b!74996 (= res!39600 (or (not (= (size!2105 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6211 (v!2546 (underlying!263 thiss!992)))))) (not (= (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (size!2105 (_values!2217 (v!2546 (underlying!263 thiss!992)))))) (bvslt (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!3197 () Bool)

(assert (=> mapIsEmpty!3197 mapRes!3198))

(declare-fun b!74997 () Bool)

(declare-fun res!39605 () Bool)

(assert (=> b!74997 (=> (not res!39605) (not e!49011))))

(assert (=> b!74997 (= res!39605 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992)))))))))

(declare-fun e!49018 () Bool)

(declare-fun e!49025 () Bool)

(declare-fun array_inv!1151 (array!3909) Bool)

(declare-fun array_inv!1152 (array!3911) Bool)

(assert (=> b!74998 (= e!49018 (and tp!8574 tp_is_empty!2481 (array_inv!1151 (_keys!3890 newMap!16)) (array_inv!1152 (_values!2217 newMap!16)) e!49025))))

(declare-fun b!74999 () Bool)

(declare-fun e!49014 () Bool)

(assert (=> b!74999 (= e!49014 e!49022)))

(declare-fun res!39599 () Bool)

(assert (=> b!74999 (=> (not res!39599) (not e!49022))))

(assert (=> b!74999 (= res!39599 (and (not (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1146 (ValueCell!897 V!2955) V!2955)

(declare-fun dynLambda!327 (Int (_ BitVec 64)) V!2955)

(assert (=> b!74999 (= lt!33806 (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) from!355) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!75000 () Bool)

(assert (=> b!75000 (= e!49012 tp_is_empty!2481)))

(declare-fun b!74994 () Bool)

(declare-fun e!49010 () Bool)

(declare-fun e!49009 () Bool)

(assert (=> b!74994 (= e!49010 e!49009)))

(declare-fun res!39602 () Bool)

(assert (=> start!9916 (=> (not res!39602) (not e!49011))))

(declare-fun valid!294 (LongMap!504) Bool)

(assert (=> start!9916 (= res!39602 (valid!294 thiss!992))))

(assert (=> start!9916 e!49011))

(declare-fun e!49016 () Bool)

(assert (=> start!9916 e!49016))

(assert (=> start!9916 true))

(assert (=> start!9916 e!49018))

(declare-fun b!75001 () Bool)

(assert (=> b!75001 (= e!49016 e!49010)))

(declare-fun b!75002 () Bool)

(assert (=> b!75002 (= e!49026 tp_is_empty!2481)))

(declare-fun b!75003 () Bool)

(declare-fun res!39606 () Bool)

(assert (=> b!75003 (=> (not res!39606) (not e!49011))))

(assert (=> b!75003 (= res!39606 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6211 newMap!16)) (_size!400 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun b!75004 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3909 (_ BitVec 32)) Bool)

(assert (=> b!75004 (= e!49024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun b!75005 () Bool)

(declare-fun e!49019 () Bool)

(assert (=> b!75005 (= e!49019 tp_is_empty!2481)))

(declare-fun b!75006 () Bool)

(declare-fun Unit!2159 () Unit!2157)

(assert (=> b!75006 (= e!49015 Unit!2159)))

(declare-fun lt!33804 () Unit!2157)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!51 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 64) (_ BitVec 32) Int) Unit!2157)

(assert (=> b!75006 (= lt!33804 (lemmaListMapContainsThenArrayContainsFrom!51 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!75006 (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!33805 () Unit!2157)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3909 (_ BitVec 32) (_ BitVec 32)) Unit!2157)

(assert (=> b!75006 (= lt!33805 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1483 0))(
  ( (Nil!1480) (Cons!1479 (h!2067 (_ BitVec 64)) (t!5061 List!1483)) )
))
(declare-fun arrayNoDuplicates!0 (array!3909 (_ BitVec 32) List!1483) Bool)

(assert (=> b!75006 (arrayNoDuplicates!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) from!355 Nil!1480)))

(declare-fun lt!33807 () Unit!2157)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3909 (_ BitVec 32) (_ BitVec 64) List!1483) Unit!2157)

(assert (=> b!75006 (= lt!33807 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (Cons!1479 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) Nil!1480)))))

(assert (=> b!75006 false))

(declare-fun b!75007 () Bool)

(declare-fun e!49020 () Bool)

(assert (=> b!75007 (= e!49020 (and e!49013 mapRes!3197))))

(declare-fun condMapEmpty!3198 () Bool)

(declare-fun mapDefault!3198 () ValueCell!897)

(assert (=> b!75007 (= condMapEmpty!3198 (= (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!897)) mapDefault!3198)))))

(declare-fun mapIsEmpty!3198 () Bool)

(assert (=> mapIsEmpty!3198 mapRes!3197))

(declare-fun b!75008 () Bool)

(assert (=> b!75008 (= e!49011 e!49014)))

(declare-fun res!39601 () Bool)

(assert (=> b!75008 (=> (not res!39601) (not e!49014))))

(declare-fun lt!33810 () ListLongMap!1423)

(assert (=> b!75008 (= res!39601 (= lt!33810 lt!33808))))

(declare-fun map!1155 (LongMapFixedSize!702) ListLongMap!1423)

(assert (=> b!75008 (= lt!33808 (map!1155 newMap!16))))

(declare-fun getCurrentListMap!424 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 32) Int) ListLongMap!1423)

(assert (=> b!75008 (= lt!33810 (getCurrentListMap!424 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun b!75009 () Bool)

(assert (=> b!75009 (= e!49023 (not e!49024))))

(declare-fun res!39603 () Bool)

(assert (=> b!75009 (=> res!39603 e!49024)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!75009 (= res!39603 (not (validMask!0 (mask!6211 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun lt!33809 () ListLongMap!1423)

(declare-fun lt!33813 () tuple2!2132)

(declare-fun lt!33803 () tuple2!2132)

(declare-fun +!96 (ListLongMap!1423 tuple2!2132) ListLongMap!1423)

(assert (=> b!75009 (= (+!96 (+!96 lt!33809 lt!33813) lt!33803) (+!96 (+!96 lt!33809 lt!33803) lt!33813))))

(assert (=> b!75009 (= lt!33803 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))

(assert (=> b!75009 (= lt!33813 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))

(declare-fun lt!33814 () Unit!2157)

(declare-fun addCommutativeForDiffKeys!15 (ListLongMap!1423 (_ BitVec 64) V!2955 (_ BitVec 64) V!2955) Unit!2157)

(assert (=> b!75009 (= lt!33814 (addCommutativeForDiffKeys!15 lt!33809 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!61 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 32) Int) ListLongMap!1423)

(assert (=> b!75009 (= lt!33809 (getCurrentListMapNoExtraKeys!61 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun b!75010 () Bool)

(assert (=> b!75010 (= e!49025 (and e!49019 mapRes!3198))))

(declare-fun condMapEmpty!3197 () Bool)

(declare-fun mapDefault!3197 () ValueCell!897)

(assert (=> b!75010 (= condMapEmpty!3197 (= (arr!1866 (_values!2217 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!897)) mapDefault!3197)))))

(declare-fun b!75011 () Bool)

(declare-fun Unit!2160 () Unit!2157)

(assert (=> b!75011 (= e!49015 Unit!2160)))

(assert (=> b!75012 (= e!49009 (and tp!8571 tp_is_empty!2481 (array_inv!1151 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (array_inv!1152 (_values!2217 (v!2546 (underlying!263 thiss!992)))) e!49020))))

(assert (= (and start!9916 res!39602) b!74997))

(assert (= (and b!74997 res!39605) b!74995))

(assert (= (and b!74995 res!39607) b!75003))

(assert (= (and b!75003 res!39606) b!75008))

(assert (= (and b!75008 res!39601) b!74999))

(assert (= (and b!74999 res!39599) b!74993))

(assert (= (and b!74993 c!11339) b!75006))

(assert (= (and b!74993 (not c!11339)) b!75011))

(assert (= (and b!74993 res!39604) b!75009))

(assert (= (and b!75009 (not res!39603)) b!74996))

(assert (= (and b!74996 (not res!39600)) b!75004))

(assert (= (and b!75007 condMapEmpty!3198) mapIsEmpty!3198))

(assert (= (and b!75007 (not condMapEmpty!3198)) mapNonEmpty!3198))

(get-info :version)

(assert (= (and mapNonEmpty!3198 ((_ is ValueCellFull!897) mapValue!3198)) b!75000))

(assert (= (and b!75007 ((_ is ValueCellFull!897) mapDefault!3198)) b!74992))

(assert (= b!75012 b!75007))

(assert (= b!74994 b!75012))

(assert (= b!75001 b!74994))

(assert (= start!9916 b!75001))

(assert (= (and b!75010 condMapEmpty!3197) mapIsEmpty!3197))

(assert (= (and b!75010 (not condMapEmpty!3197)) mapNonEmpty!3197))

(assert (= (and mapNonEmpty!3197 ((_ is ValueCellFull!897) mapValue!3197)) b!75002))

(assert (= (and b!75010 ((_ is ValueCellFull!897) mapDefault!3197)) b!75005))

(assert (= b!74998 b!75010))

(assert (= start!9916 b!74998))

(declare-fun b_lambda!3373 () Bool)

(assert (=> (not b_lambda!3373) (not b!74999)))

(declare-fun t!5057 () Bool)

(declare-fun tb!1549 () Bool)

(assert (=> (and b!75012 (= (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))) t!5057) tb!1549))

(declare-fun result!2707 () Bool)

(assert (=> tb!1549 (= result!2707 tp_is_empty!2481)))

(assert (=> b!74999 t!5057))

(declare-fun b_and!4595 () Bool)

(assert (= b_and!4591 (and (=> t!5057 result!2707) b_and!4595)))

(declare-fun t!5059 () Bool)

(declare-fun tb!1551 () Bool)

(assert (=> (and b!74998 (= (defaultEntry!2234 newMap!16) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))) t!5059) tb!1551))

(declare-fun result!2711 () Bool)

(assert (= result!2711 result!2707))

(assert (=> b!74999 t!5059))

(declare-fun b_and!4597 () Bool)

(assert (= b_and!4593 (and (=> t!5059 result!2711) b_and!4597)))

(declare-fun m!74551 () Bool)

(assert (=> b!75012 m!74551))

(declare-fun m!74553 () Bool)

(assert (=> b!75012 m!74553))

(declare-fun m!74555 () Bool)

(assert (=> start!9916 m!74555))

(declare-fun m!74557 () Bool)

(assert (=> b!74993 m!74557))

(assert (=> b!74993 m!74557))

(declare-fun m!74559 () Bool)

(assert (=> b!74993 m!74559))

(assert (=> b!74993 m!74557))

(declare-fun m!74561 () Bool)

(assert (=> b!74993 m!74561))

(declare-fun m!74563 () Bool)

(assert (=> mapNonEmpty!3197 m!74563))

(declare-fun m!74565 () Bool)

(assert (=> b!75009 m!74565))

(declare-fun m!74567 () Bool)

(assert (=> b!75009 m!74567))

(assert (=> b!75009 m!74557))

(assert (=> b!75009 m!74565))

(declare-fun m!74569 () Bool)

(assert (=> b!75009 m!74569))

(assert (=> b!75009 m!74557))

(declare-fun m!74571 () Bool)

(assert (=> b!75009 m!74571))

(declare-fun m!74573 () Bool)

(assert (=> b!75009 m!74573))

(declare-fun m!74575 () Bool)

(assert (=> b!75009 m!74575))

(assert (=> b!75009 m!74573))

(declare-fun m!74577 () Bool)

(assert (=> b!75009 m!74577))

(declare-fun m!74579 () Bool)

(assert (=> b!75008 m!74579))

(declare-fun m!74581 () Bool)

(assert (=> b!75008 m!74581))

(assert (=> b!74999 m!74557))

(declare-fun m!74583 () Bool)

(assert (=> b!74999 m!74583))

(declare-fun m!74585 () Bool)

(assert (=> b!74999 m!74585))

(assert (=> b!74999 m!74583))

(assert (=> b!74999 m!74585))

(declare-fun m!74587 () Bool)

(assert (=> b!74999 m!74587))

(declare-fun m!74589 () Bool)

(assert (=> b!74995 m!74589))

(declare-fun m!74591 () Bool)

(assert (=> b!75006 m!74591))

(declare-fun m!74593 () Bool)

(assert (=> b!75006 m!74593))

(assert (=> b!75006 m!74557))

(declare-fun m!74595 () Bool)

(assert (=> b!75006 m!74595))

(assert (=> b!75006 m!74557))

(assert (=> b!75006 m!74557))

(declare-fun m!74597 () Bool)

(assert (=> b!75006 m!74597))

(assert (=> b!75006 m!74557))

(declare-fun m!74599 () Bool)

(assert (=> b!75006 m!74599))

(declare-fun m!74601 () Bool)

(assert (=> b!74998 m!74601))

(declare-fun m!74603 () Bool)

(assert (=> b!74998 m!74603))

(declare-fun m!74605 () Bool)

(assert (=> b!75004 m!74605))

(declare-fun m!74607 () Bool)

(assert (=> mapNonEmpty!3198 m!74607))

(check-sat (not b_lambda!3373) (not start!9916) (not mapNonEmpty!3198) (not b_next!2129) (not b!74999) (not b!75006) (not b!75008) (not b!74998) b_and!4597 (not b!74995) (not b!75004) b_and!4595 (not b!75009) tp_is_empty!2481 (not mapNonEmpty!3197) (not b!75012) (not b!74993) (not b_next!2131))
(check-sat b_and!4595 b_and!4597 (not b_next!2129) (not b_next!2131))
(get-model)

(declare-fun b_lambda!3377 () Bool)

(assert (= b_lambda!3373 (or (and b!75012 b_free!2129) (and b!74998 b_free!2131 (= (defaultEntry!2234 newMap!16) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))))) b_lambda!3377)))

(check-sat (not start!9916) (not mapNonEmpty!3198) (not b_next!2129) (not b!74999) (not b!75006) (not b!75008) (not b!74998) b_and!4597 (not b_lambda!3377) (not b!74995) (not b!75004) b_and!4595 (not b!75009) tp_is_empty!2481 (not mapNonEmpty!3197) (not b!75012) (not b!74993) (not b_next!2131))
(check-sat b_and!4595 b_and!4597 (not b_next!2129) (not b_next!2131))
(get-model)

(declare-fun d!17829 () Bool)

(assert (=> d!17829 (= (array_inv!1151 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvsge (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!75012 d!17829))

(declare-fun d!17831 () Bool)

(assert (=> d!17831 (= (array_inv!1152 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvsge (size!2105 (_values!2217 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!75012 d!17831))

(declare-fun d!17833 () Bool)

(assert (=> d!17833 (= (array_inv!1151 (_keys!3890 newMap!16)) (bvsge (size!2104 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!74998 d!17833))

(declare-fun d!17835 () Bool)

(assert (=> d!17835 (= (array_inv!1152 (_values!2217 newMap!16)) (bvsge (size!2105 (_values!2217 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!74998 d!17835))

(declare-fun d!17837 () Bool)

(assert (=> d!17837 (= (map!1155 newMap!16) (getCurrentListMap!424 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun bs!3233 () Bool)

(assert (= bs!3233 d!17837))

(declare-fun m!74667 () Bool)

(assert (=> bs!3233 m!74667))

(assert (=> b!75008 d!17837))

(declare-fun bm!6655 () Bool)

(declare-fun call!6663 () ListLongMap!1423)

(declare-fun call!6659 () ListLongMap!1423)

(declare-fun call!6662 () ListLongMap!1423)

(declare-fun c!11360 () Bool)

(declare-fun c!11359 () Bool)

(declare-fun call!6664 () ListLongMap!1423)

(assert (=> bm!6655 (= call!6664 (+!96 (ite c!11359 call!6662 (ite c!11360 call!6663 call!6659)) (ite (or c!11359 c!11360) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(declare-fun b!75122 () Bool)

(declare-fun e!49116 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!75122 (= e!49116 (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!6656 () Bool)

(assert (=> bm!6656 (= call!6659 call!6663)))

(declare-fun b!75123 () Bool)

(declare-fun e!49108 () Bool)

(declare-fun call!6658 () Bool)

(assert (=> b!75123 (= e!49108 (not call!6658))))

(declare-fun b!75124 () Bool)

(declare-fun e!49119 () Bool)

(declare-fun call!6660 () Bool)

(assert (=> b!75124 (= e!49119 (not call!6660))))

(declare-fun b!75125 () Bool)

(declare-fun res!39655 () Bool)

(declare-fun e!49112 () Bool)

(assert (=> b!75125 (=> (not res!39655) (not e!49112))))

(assert (=> b!75125 (= res!39655 e!49119)))

(declare-fun c!11356 () Bool)

(assert (=> b!75125 (= c!11356 (not (= (bvand (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!6657 () Bool)

(assert (=> bm!6657 (= call!6663 call!6662)))

(declare-fun b!75126 () Bool)

(declare-fun e!49110 () Bool)

(declare-fun e!49117 () Bool)

(assert (=> b!75126 (= e!49110 e!49117)))

(declare-fun res!39654 () Bool)

(assert (=> b!75126 (=> (not res!39654) (not e!49117))))

(declare-fun lt!33914 () ListLongMap!1423)

(assert (=> b!75126 (= res!39654 (contains!727 lt!33914 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75126 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun d!17839 () Bool)

(assert (=> d!17839 e!49112))

(declare-fun res!39657 () Bool)

(assert (=> d!17839 (=> (not res!39657) (not e!49112))))

(assert (=> d!17839 (= res!39657 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))))

(declare-fun lt!33904 () ListLongMap!1423)

(assert (=> d!17839 (= lt!33914 lt!33904)))

(declare-fun lt!33901 () Unit!2157)

(declare-fun e!49113 () Unit!2157)

(assert (=> d!17839 (= lt!33901 e!49113)))

(declare-fun c!11357 () Bool)

(declare-fun e!49115 () Bool)

(assert (=> d!17839 (= c!11357 e!49115)))

(declare-fun res!39656 () Bool)

(assert (=> d!17839 (=> (not res!39656) (not e!49115))))

(assert (=> d!17839 (= res!39656 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun e!49109 () ListLongMap!1423)

(assert (=> d!17839 (= lt!33904 e!49109)))

(assert (=> d!17839 (= c!11359 (and (not (= (bvand (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!17839 (validMask!0 (mask!6211 (v!2546 (underlying!263 thiss!992))))))

(assert (=> d!17839 (= (getCurrentListMap!424 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))) lt!33914)))

(declare-fun b!75127 () Bool)

(declare-fun e!49114 () ListLongMap!1423)

(declare-fun call!6661 () ListLongMap!1423)

(assert (=> b!75127 (= e!49114 call!6661)))

(declare-fun b!75128 () Bool)

(declare-fun lt!33910 () Unit!2157)

(assert (=> b!75128 (= e!49113 lt!33910)))

(declare-fun lt!33900 () ListLongMap!1423)

(assert (=> b!75128 (= lt!33900 (getCurrentListMapNoExtraKeys!61 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun lt!33899 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33899 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33908 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33908 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!33913 () Unit!2157)

(declare-fun addStillContains!52 (ListLongMap!1423 (_ BitVec 64) V!2955 (_ BitVec 64)) Unit!2157)

(assert (=> b!75128 (= lt!33913 (addStillContains!52 lt!33900 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) lt!33908))))

(assert (=> b!75128 (contains!727 (+!96 lt!33900 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!33908)))

(declare-fun lt!33896 () Unit!2157)

(assert (=> b!75128 (= lt!33896 lt!33913)))

(declare-fun lt!33898 () ListLongMap!1423)

(assert (=> b!75128 (= lt!33898 (getCurrentListMapNoExtraKeys!61 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun lt!33916 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33916 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33912 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33912 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!33897 () Unit!2157)

(declare-fun addApplyDifferent!52 (ListLongMap!1423 (_ BitVec 64) V!2955 (_ BitVec 64)) Unit!2157)

(assert (=> b!75128 (= lt!33897 (addApplyDifferent!52 lt!33898 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992))) lt!33912))))

(declare-fun apply!76 (ListLongMap!1423 (_ BitVec 64)) V!2955)

(assert (=> b!75128 (= (apply!76 (+!96 lt!33898 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!33912) (apply!76 lt!33898 lt!33912))))

(declare-fun lt!33902 () Unit!2157)

(assert (=> b!75128 (= lt!33902 lt!33897)))

(declare-fun lt!33906 () ListLongMap!1423)

(assert (=> b!75128 (= lt!33906 (getCurrentListMapNoExtraKeys!61 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun lt!33895 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33895 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33905 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33905 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!33903 () Unit!2157)

(assert (=> b!75128 (= lt!33903 (addApplyDifferent!52 lt!33906 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) lt!33905))))

(assert (=> b!75128 (= (apply!76 (+!96 lt!33906 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!33905) (apply!76 lt!33906 lt!33905))))

(declare-fun lt!33909 () Unit!2157)

(assert (=> b!75128 (= lt!33909 lt!33903)))

(declare-fun lt!33911 () ListLongMap!1423)

(assert (=> b!75128 (= lt!33911 (getCurrentListMapNoExtraKeys!61 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun lt!33915 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33915 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33907 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33907 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!75128 (= lt!33910 (addApplyDifferent!52 lt!33911 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992))) lt!33907))))

(assert (=> b!75128 (= (apply!76 (+!96 lt!33911 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!33907) (apply!76 lt!33911 lt!33907))))

(declare-fun b!75129 () Bool)

(declare-fun c!11355 () Bool)

(assert (=> b!75129 (= c!11355 (and (not (= (bvand (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!49118 () ListLongMap!1423)

(assert (=> b!75129 (= e!49114 e!49118)))

(declare-fun bm!6658 () Bool)

(assert (=> bm!6658 (= call!6662 (getCurrentListMapNoExtraKeys!61 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun b!75130 () Bool)

(declare-fun res!39653 () Bool)

(assert (=> b!75130 (=> (not res!39653) (not e!49112))))

(assert (=> b!75130 (= res!39653 e!49110)))

(declare-fun res!39661 () Bool)

(assert (=> b!75130 (=> res!39661 e!49110)))

(assert (=> b!75130 (= res!39661 (not e!49116))))

(declare-fun res!39659 () Bool)

(assert (=> b!75130 (=> (not res!39659) (not e!49116))))

(assert (=> b!75130 (= res!39659 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun b!75131 () Bool)

(assert (=> b!75131 (= e!49115 (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!75132 () Bool)

(declare-fun e!49111 () Bool)

(assert (=> b!75132 (= e!49119 e!49111)))

(declare-fun res!39658 () Bool)

(assert (=> b!75132 (= res!39658 call!6660)))

(assert (=> b!75132 (=> (not res!39658) (not e!49111))))

(declare-fun b!75133 () Bool)

(assert (=> b!75133 (= e!49111 (= (apply!76 lt!33914 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun b!75134 () Bool)

(assert (=> b!75134 (= e!49118 call!6661)))

(declare-fun b!75135 () Bool)

(declare-fun e!49107 () Bool)

(assert (=> b!75135 (= e!49107 (= (apply!76 lt!33914 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun b!75136 () Bool)

(assert (=> b!75136 (= e!49112 e!49108)))

(declare-fun c!11358 () Bool)

(assert (=> b!75136 (= c!11358 (not (= (bvand (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75137 () Bool)

(assert (=> b!75137 (= e!49109 (+!96 call!6664 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun b!75138 () Bool)

(assert (=> b!75138 (= e!49109 e!49114)))

(assert (=> b!75138 (= c!11360 (and (not (= (bvand (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6659 () Bool)

(assert (=> bm!6659 (= call!6658 (contains!727 lt!33914 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6660 () Bool)

(assert (=> bm!6660 (= call!6661 call!6664)))

(declare-fun b!75139 () Bool)

(assert (=> b!75139 (= e!49108 e!49107)))

(declare-fun res!39660 () Bool)

(assert (=> b!75139 (= res!39660 call!6658)))

(assert (=> b!75139 (=> (not res!39660) (not e!49107))))

(declare-fun b!75140 () Bool)

(assert (=> b!75140 (= e!49118 call!6659)))

(declare-fun b!75141 () Bool)

(declare-fun Unit!2165 () Unit!2157)

(assert (=> b!75141 (= e!49113 Unit!2165)))

(declare-fun bm!6661 () Bool)

(assert (=> bm!6661 (= call!6660 (contains!727 lt!33914 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75142 () Bool)

(assert (=> b!75142 (= e!49117 (= (apply!76 lt!33914 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75142 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2105 (_values!2217 (v!2546 (underlying!263 thiss!992))))))))

(assert (=> b!75142 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(assert (= (and d!17839 c!11359) b!75137))

(assert (= (and d!17839 (not c!11359)) b!75138))

(assert (= (and b!75138 c!11360) b!75127))

(assert (= (and b!75138 (not c!11360)) b!75129))

(assert (= (and b!75129 c!11355) b!75134))

(assert (= (and b!75129 (not c!11355)) b!75140))

(assert (= (or b!75134 b!75140) bm!6656))

(assert (= (or b!75127 bm!6656) bm!6657))

(assert (= (or b!75127 b!75134) bm!6660))

(assert (= (or b!75137 bm!6657) bm!6658))

(assert (= (or b!75137 bm!6660) bm!6655))

(assert (= (and d!17839 res!39656) b!75131))

(assert (= (and d!17839 c!11357) b!75128))

(assert (= (and d!17839 (not c!11357)) b!75141))

(assert (= (and d!17839 res!39657) b!75130))

(assert (= (and b!75130 res!39659) b!75122))

(assert (= (and b!75130 (not res!39661)) b!75126))

(assert (= (and b!75126 res!39654) b!75142))

(assert (= (and b!75130 res!39653) b!75125))

(assert (= (and b!75125 c!11356) b!75132))

(assert (= (and b!75125 (not c!11356)) b!75124))

(assert (= (and b!75132 res!39658) b!75133))

(assert (= (or b!75132 b!75124) bm!6661))

(assert (= (and b!75125 res!39655) b!75136))

(assert (= (and b!75136 c!11358) b!75139))

(assert (= (and b!75136 (not c!11358)) b!75123))

(assert (= (and b!75139 res!39660) b!75135))

(assert (= (or b!75139 b!75123) bm!6659))

(declare-fun b_lambda!3379 () Bool)

(assert (=> (not b_lambda!3379) (not b!75142)))

(assert (=> b!75142 t!5057))

(declare-fun b_and!4607 () Bool)

(assert (= b_and!4595 (and (=> t!5057 result!2707) b_and!4607)))

(assert (=> b!75142 t!5059))

(declare-fun b_and!4609 () Bool)

(assert (= b_and!4597 (and (=> t!5059 result!2711) b_and!4609)))

(declare-fun m!74669 () Bool)

(assert (=> bm!6659 m!74669))

(declare-fun m!74671 () Bool)

(assert (=> b!75133 m!74671))

(declare-fun m!74673 () Bool)

(assert (=> b!75122 m!74673))

(assert (=> b!75122 m!74673))

(declare-fun m!74675 () Bool)

(assert (=> b!75122 m!74675))

(declare-fun m!74677 () Bool)

(assert (=> b!75135 m!74677))

(declare-fun m!74679 () Bool)

(assert (=> b!75128 m!74679))

(declare-fun m!74681 () Bool)

(assert (=> b!75128 m!74681))

(declare-fun m!74683 () Bool)

(assert (=> b!75128 m!74683))

(declare-fun m!74685 () Bool)

(assert (=> b!75128 m!74685))

(declare-fun m!74687 () Bool)

(assert (=> b!75128 m!74687))

(assert (=> b!75128 m!74577))

(assert (=> b!75128 m!74685))

(declare-fun m!74689 () Bool)

(assert (=> b!75128 m!74689))

(declare-fun m!74691 () Bool)

(assert (=> b!75128 m!74691))

(declare-fun m!74693 () Bool)

(assert (=> b!75128 m!74693))

(assert (=> b!75128 m!74691))

(declare-fun m!74695 () Bool)

(assert (=> b!75128 m!74695))

(declare-fun m!74697 () Bool)

(assert (=> b!75128 m!74697))

(declare-fun m!74699 () Bool)

(assert (=> b!75128 m!74699))

(declare-fun m!74701 () Bool)

(assert (=> b!75128 m!74701))

(declare-fun m!74703 () Bool)

(assert (=> b!75128 m!74703))

(assert (=> b!75128 m!74695))

(assert (=> b!75128 m!74673))

(assert (=> b!75128 m!74701))

(declare-fun m!74705 () Bool)

(assert (=> b!75128 m!74705))

(declare-fun m!74707 () Bool)

(assert (=> b!75128 m!74707))

(declare-fun m!74709 () Bool)

(assert (=> b!75137 m!74709))

(assert (=> b!75126 m!74673))

(assert (=> b!75126 m!74673))

(declare-fun m!74711 () Bool)

(assert (=> b!75126 m!74711))

(declare-fun m!74713 () Bool)

(assert (=> bm!6655 m!74713))

(assert (=> b!75142 m!74585))

(assert (=> b!75142 m!74673))

(declare-fun m!74715 () Bool)

(assert (=> b!75142 m!74715))

(declare-fun m!74717 () Bool)

(assert (=> b!75142 m!74717))

(assert (=> b!75142 m!74585))

(declare-fun m!74719 () Bool)

(assert (=> b!75142 m!74719))

(assert (=> b!75142 m!74673))

(assert (=> b!75142 m!74717))

(assert (=> d!17839 m!74567))

(assert (=> bm!6658 m!74577))

(assert (=> b!75131 m!74673))

(assert (=> b!75131 m!74673))

(assert (=> b!75131 m!74675))

(declare-fun m!74721 () Bool)

(assert (=> bm!6661 m!74721))

(assert (=> b!75008 d!17839))

(declare-fun d!17841 () Bool)

(assert (=> d!17841 (= (valid!294 thiss!992) (valid!293 (v!2546 (underlying!263 thiss!992))))))

(declare-fun bs!3234 () Bool)

(assert (= bs!3234 d!17841))

(declare-fun m!74723 () Bool)

(assert (=> bs!3234 m!74723))

(assert (=> start!9916 d!17841))

(declare-fun d!17843 () Bool)

(declare-fun res!39668 () Bool)

(declare-fun e!49122 () Bool)

(assert (=> d!17843 (=> (not res!39668) (not e!49122))))

(declare-fun simpleValid!52 (LongMapFixedSize!702) Bool)

(assert (=> d!17843 (= res!39668 (simpleValid!52 newMap!16))))

(assert (=> d!17843 (= (valid!293 newMap!16) e!49122)))

(declare-fun b!75149 () Bool)

(declare-fun res!39669 () Bool)

(assert (=> b!75149 (=> (not res!39669) (not e!49122))))

(declare-fun arrayCountValidKeys!0 (array!3909 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!75149 (= res!39669 (= (arrayCountValidKeys!0 (_keys!3890 newMap!16) #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))) (_size!400 newMap!16)))))

(declare-fun b!75150 () Bool)

(declare-fun res!39670 () Bool)

(assert (=> b!75150 (=> (not res!39670) (not e!49122))))

(assert (=> b!75150 (= res!39670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3890 newMap!16) (mask!6211 newMap!16)))))

(declare-fun b!75151 () Bool)

(assert (=> b!75151 (= e!49122 (arrayNoDuplicates!0 (_keys!3890 newMap!16) #b00000000000000000000000000000000 Nil!1480))))

(assert (= (and d!17843 res!39668) b!75149))

(assert (= (and b!75149 res!39669) b!75150))

(assert (= (and b!75150 res!39670) b!75151))

(declare-fun m!74725 () Bool)

(assert (=> d!17843 m!74725))

(declare-fun m!74727 () Bool)

(assert (=> b!75149 m!74727))

(declare-fun m!74729 () Bool)

(assert (=> b!75150 m!74729))

(declare-fun m!74731 () Bool)

(assert (=> b!75151 m!74731))

(assert (=> b!74995 d!17843))

(declare-fun b!75176 () Bool)

(declare-fun e!49137 () Bool)

(assert (=> b!75176 (= e!49137 (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75176 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!75177 () Bool)

(declare-fun e!49141 () ListLongMap!1423)

(declare-fun e!49139 () ListLongMap!1423)

(assert (=> b!75177 (= e!49141 e!49139)))

(declare-fun c!11372 () Bool)

(assert (=> b!75177 (= c!11372 (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!75178 () Bool)

(declare-fun res!39681 () Bool)

(declare-fun e!49143 () Bool)

(assert (=> b!75178 (=> (not res!39681) (not e!49143))))

(declare-fun lt!33937 () ListLongMap!1423)

(assert (=> b!75178 (= res!39681 (not (contains!727 lt!33937 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!75179 () Bool)

(declare-fun e!49140 () Bool)

(declare-fun e!49138 () Bool)

(assert (=> b!75179 (= e!49140 e!49138)))

(declare-fun c!11371 () Bool)

(assert (=> b!75179 (= c!11371 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun d!17845 () Bool)

(assert (=> d!17845 e!49143))

(declare-fun res!39680 () Bool)

(assert (=> d!17845 (=> (not res!39680) (not e!49143))))

(assert (=> d!17845 (= res!39680 (not (contains!727 lt!33937 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17845 (= lt!33937 e!49141)))

(declare-fun c!11369 () Bool)

(assert (=> d!17845 (= c!11369 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(assert (=> d!17845 (validMask!0 (mask!6211 (v!2546 (underlying!263 thiss!992))))))

(assert (=> d!17845 (= (getCurrentListMapNoExtraKeys!61 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))) lt!33937)))

(declare-fun bm!6664 () Bool)

(declare-fun call!6667 () ListLongMap!1423)

(assert (=> bm!6664 (= call!6667 (getCurrentListMapNoExtraKeys!61 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun b!75180 () Bool)

(declare-fun isEmpty!319 (ListLongMap!1423) Bool)

(assert (=> b!75180 (= e!49138 (isEmpty!319 lt!33937))))

(declare-fun b!75181 () Bool)

(assert (=> b!75181 (= e!49138 (= lt!33937 (getCurrentListMapNoExtraKeys!61 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun b!75182 () Bool)

(assert (=> b!75182 (= e!49141 (ListLongMap!1424 Nil!1479))))

(declare-fun b!75183 () Bool)

(assert (=> b!75183 (= e!49139 call!6667)))

(declare-fun b!75184 () Bool)

(assert (=> b!75184 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(assert (=> b!75184 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2105 (_values!2217 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun e!49142 () Bool)

(assert (=> b!75184 (= e!49142 (= (apply!76 lt!33937 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!75185 () Bool)

(declare-fun lt!33931 () Unit!2157)

(declare-fun lt!33936 () Unit!2157)

(assert (=> b!75185 (= lt!33931 lt!33936)))

(declare-fun lt!33933 () V!2955)

(declare-fun lt!33934 () (_ BitVec 64))

(declare-fun lt!33932 () (_ BitVec 64))

(declare-fun lt!33935 () ListLongMap!1423)

(assert (=> b!75185 (not (contains!727 (+!96 lt!33935 (tuple2!2133 lt!33934 lt!33933)) lt!33932))))

(declare-fun addStillNotContains!25 (ListLongMap!1423 (_ BitVec 64) V!2955 (_ BitVec 64)) Unit!2157)

(assert (=> b!75185 (= lt!33936 (addStillNotContains!25 lt!33935 lt!33934 lt!33933 lt!33932))))

(assert (=> b!75185 (= lt!33932 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!75185 (= lt!33933 (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75185 (= lt!33934 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!75185 (= lt!33935 call!6667)))

(assert (=> b!75185 (= e!49139 (+!96 call!6667 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!75186 () Bool)

(assert (=> b!75186 (= e!49140 e!49142)))

(assert (=> b!75186 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun res!39682 () Bool)

(assert (=> b!75186 (= res!39682 (contains!727 lt!33937 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75186 (=> (not res!39682) (not e!49142))))

(declare-fun b!75187 () Bool)

(assert (=> b!75187 (= e!49143 e!49140)))

(declare-fun c!11370 () Bool)

(assert (=> b!75187 (= c!11370 e!49137)))

(declare-fun res!39679 () Bool)

(assert (=> b!75187 (=> (not res!39679) (not e!49137))))

(assert (=> b!75187 (= res!39679 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(assert (= (and d!17845 c!11369) b!75182))

(assert (= (and d!17845 (not c!11369)) b!75177))

(assert (= (and b!75177 c!11372) b!75185))

(assert (= (and b!75177 (not c!11372)) b!75183))

(assert (= (or b!75185 b!75183) bm!6664))

(assert (= (and d!17845 res!39680) b!75178))

(assert (= (and b!75178 res!39681) b!75187))

(assert (= (and b!75187 res!39679) b!75176))

(assert (= (and b!75187 c!11370) b!75186))

(assert (= (and b!75187 (not c!11370)) b!75179))

(assert (= (and b!75186 res!39682) b!75184))

(assert (= (and b!75179 c!11371) b!75181))

(assert (= (and b!75179 (not c!11371)) b!75180))

(declare-fun b_lambda!3381 () Bool)

(assert (=> (not b_lambda!3381) (not b!75184)))

(assert (=> b!75184 t!5057))

(declare-fun b_and!4611 () Bool)

(assert (= b_and!4607 (and (=> t!5057 result!2707) b_and!4611)))

(assert (=> b!75184 t!5059))

(declare-fun b_and!4613 () Bool)

(assert (= b_and!4609 (and (=> t!5059 result!2711) b_and!4613)))

(declare-fun b_lambda!3383 () Bool)

(assert (=> (not b_lambda!3383) (not b!75185)))

(assert (=> b!75185 t!5057))

(declare-fun b_and!4615 () Bool)

(assert (= b_and!4611 (and (=> t!5057 result!2707) b_and!4615)))

(assert (=> b!75185 t!5059))

(declare-fun b_and!4617 () Bool)

(assert (= b_and!4613 (and (=> t!5059 result!2711) b_and!4617)))

(declare-fun m!74733 () Bool)

(assert (=> b!75178 m!74733))

(declare-fun m!74735 () Bool)

(assert (=> d!17845 m!74735))

(assert (=> d!17845 m!74567))

(declare-fun m!74737 () Bool)

(assert (=> b!75181 m!74737))

(assert (=> b!75184 m!74585))

(assert (=> b!75184 m!74717))

(assert (=> b!75184 m!74717))

(assert (=> b!75184 m!74585))

(assert (=> b!75184 m!74719))

(assert (=> b!75184 m!74673))

(assert (=> b!75184 m!74673))

(declare-fun m!74739 () Bool)

(assert (=> b!75184 m!74739))

(declare-fun m!74741 () Bool)

(assert (=> b!75180 m!74741))

(assert (=> bm!6664 m!74737))

(assert (=> b!75185 m!74585))

(assert (=> b!75185 m!74717))

(declare-fun m!74743 () Bool)

(assert (=> b!75185 m!74743))

(declare-fun m!74745 () Bool)

(assert (=> b!75185 m!74745))

(assert (=> b!75185 m!74717))

(assert (=> b!75185 m!74585))

(assert (=> b!75185 m!74719))

(assert (=> b!75185 m!74673))

(assert (=> b!75185 m!74743))

(declare-fun m!74747 () Bool)

(assert (=> b!75185 m!74747))

(declare-fun m!74749 () Bool)

(assert (=> b!75185 m!74749))

(assert (=> b!75177 m!74673))

(assert (=> b!75177 m!74673))

(assert (=> b!75177 m!74675))

(assert (=> b!75176 m!74673))

(assert (=> b!75176 m!74673))

(assert (=> b!75176 m!74675))

(assert (=> b!75186 m!74673))

(assert (=> b!75186 m!74673))

(declare-fun m!74751 () Bool)

(assert (=> b!75186 m!74751))

(assert (=> b!75009 d!17845))

(declare-fun d!17847 () Bool)

(declare-fun e!49146 () Bool)

(assert (=> d!17847 e!49146))

(declare-fun res!39687 () Bool)

(assert (=> d!17847 (=> (not res!39687) (not e!49146))))

(declare-fun lt!33946 () ListLongMap!1423)

(assert (=> d!17847 (= res!39687 (contains!727 lt!33946 (_1!1077 lt!33813)))))

(declare-fun lt!33948 () List!1482)

(assert (=> d!17847 (= lt!33946 (ListLongMap!1424 lt!33948))))

(declare-fun lt!33947 () Unit!2157)

(declare-fun lt!33949 () Unit!2157)

(assert (=> d!17847 (= lt!33947 lt!33949)))

(declare-datatypes ((Option!140 0))(
  ( (Some!139 (v!2550 V!2955)) (None!138) )
))
(declare-fun getValueByKey!134 (List!1482 (_ BitVec 64)) Option!140)

(assert (=> d!17847 (= (getValueByKey!134 lt!33948 (_1!1077 lt!33813)) (Some!139 (_2!1077 lt!33813)))))

(declare-fun lemmaContainsTupThenGetReturnValue!51 (List!1482 (_ BitVec 64) V!2955) Unit!2157)

(assert (=> d!17847 (= lt!33949 (lemmaContainsTupThenGetReturnValue!51 lt!33948 (_1!1077 lt!33813) (_2!1077 lt!33813)))))

(declare-fun insertStrictlySorted!54 (List!1482 (_ BitVec 64) V!2955) List!1482)

(assert (=> d!17847 (= lt!33948 (insertStrictlySorted!54 (toList!727 (+!96 lt!33809 lt!33803)) (_1!1077 lt!33813) (_2!1077 lt!33813)))))

(assert (=> d!17847 (= (+!96 (+!96 lt!33809 lt!33803) lt!33813) lt!33946)))

(declare-fun b!75192 () Bool)

(declare-fun res!39688 () Bool)

(assert (=> b!75192 (=> (not res!39688) (not e!49146))))

(assert (=> b!75192 (= res!39688 (= (getValueByKey!134 (toList!727 lt!33946) (_1!1077 lt!33813)) (Some!139 (_2!1077 lt!33813))))))

(declare-fun b!75193 () Bool)

(declare-fun contains!729 (List!1482 tuple2!2132) Bool)

(assert (=> b!75193 (= e!49146 (contains!729 (toList!727 lt!33946) lt!33813))))

(assert (= (and d!17847 res!39687) b!75192))

(assert (= (and b!75192 res!39688) b!75193))

(declare-fun m!74753 () Bool)

(assert (=> d!17847 m!74753))

(declare-fun m!74755 () Bool)

(assert (=> d!17847 m!74755))

(declare-fun m!74757 () Bool)

(assert (=> d!17847 m!74757))

(declare-fun m!74759 () Bool)

(assert (=> d!17847 m!74759))

(declare-fun m!74761 () Bool)

(assert (=> b!75192 m!74761))

(declare-fun m!74763 () Bool)

(assert (=> b!75193 m!74763))

(assert (=> b!75009 d!17847))

(declare-fun d!17849 () Bool)

(declare-fun e!49147 () Bool)

(assert (=> d!17849 e!49147))

(declare-fun res!39689 () Bool)

(assert (=> d!17849 (=> (not res!39689) (not e!49147))))

(declare-fun lt!33950 () ListLongMap!1423)

(assert (=> d!17849 (= res!39689 (contains!727 lt!33950 (_1!1077 lt!33803)))))

(declare-fun lt!33952 () List!1482)

(assert (=> d!17849 (= lt!33950 (ListLongMap!1424 lt!33952))))

(declare-fun lt!33951 () Unit!2157)

(declare-fun lt!33953 () Unit!2157)

(assert (=> d!17849 (= lt!33951 lt!33953)))

(assert (=> d!17849 (= (getValueByKey!134 lt!33952 (_1!1077 lt!33803)) (Some!139 (_2!1077 lt!33803)))))

(assert (=> d!17849 (= lt!33953 (lemmaContainsTupThenGetReturnValue!51 lt!33952 (_1!1077 lt!33803) (_2!1077 lt!33803)))))

(assert (=> d!17849 (= lt!33952 (insertStrictlySorted!54 (toList!727 (+!96 lt!33809 lt!33813)) (_1!1077 lt!33803) (_2!1077 lt!33803)))))

(assert (=> d!17849 (= (+!96 (+!96 lt!33809 lt!33813) lt!33803) lt!33950)))

(declare-fun b!75194 () Bool)

(declare-fun res!39690 () Bool)

(assert (=> b!75194 (=> (not res!39690) (not e!49147))))

(assert (=> b!75194 (= res!39690 (= (getValueByKey!134 (toList!727 lt!33950) (_1!1077 lt!33803)) (Some!139 (_2!1077 lt!33803))))))

(declare-fun b!75195 () Bool)

(assert (=> b!75195 (= e!49147 (contains!729 (toList!727 lt!33950) lt!33803))))

(assert (= (and d!17849 res!39689) b!75194))

(assert (= (and b!75194 res!39690) b!75195))

(declare-fun m!74765 () Bool)

(assert (=> d!17849 m!74765))

(declare-fun m!74767 () Bool)

(assert (=> d!17849 m!74767))

(declare-fun m!74769 () Bool)

(assert (=> d!17849 m!74769))

(declare-fun m!74771 () Bool)

(assert (=> d!17849 m!74771))

(declare-fun m!74773 () Bool)

(assert (=> b!75194 m!74773))

(declare-fun m!74775 () Bool)

(assert (=> b!75195 m!74775))

(assert (=> b!75009 d!17849))

(declare-fun d!17851 () Bool)

(declare-fun e!49148 () Bool)

(assert (=> d!17851 e!49148))

(declare-fun res!39691 () Bool)

(assert (=> d!17851 (=> (not res!39691) (not e!49148))))

(declare-fun lt!33954 () ListLongMap!1423)

(assert (=> d!17851 (= res!39691 (contains!727 lt!33954 (_1!1077 lt!33813)))))

(declare-fun lt!33956 () List!1482)

(assert (=> d!17851 (= lt!33954 (ListLongMap!1424 lt!33956))))

(declare-fun lt!33955 () Unit!2157)

(declare-fun lt!33957 () Unit!2157)

(assert (=> d!17851 (= lt!33955 lt!33957)))

(assert (=> d!17851 (= (getValueByKey!134 lt!33956 (_1!1077 lt!33813)) (Some!139 (_2!1077 lt!33813)))))

(assert (=> d!17851 (= lt!33957 (lemmaContainsTupThenGetReturnValue!51 lt!33956 (_1!1077 lt!33813) (_2!1077 lt!33813)))))

(assert (=> d!17851 (= lt!33956 (insertStrictlySorted!54 (toList!727 lt!33809) (_1!1077 lt!33813) (_2!1077 lt!33813)))))

(assert (=> d!17851 (= (+!96 lt!33809 lt!33813) lt!33954)))

(declare-fun b!75196 () Bool)

(declare-fun res!39692 () Bool)

(assert (=> b!75196 (=> (not res!39692) (not e!49148))))

(assert (=> b!75196 (= res!39692 (= (getValueByKey!134 (toList!727 lt!33954) (_1!1077 lt!33813)) (Some!139 (_2!1077 lt!33813))))))

(declare-fun b!75197 () Bool)

(assert (=> b!75197 (= e!49148 (contains!729 (toList!727 lt!33954) lt!33813))))

(assert (= (and d!17851 res!39691) b!75196))

(assert (= (and b!75196 res!39692) b!75197))

(declare-fun m!74777 () Bool)

(assert (=> d!17851 m!74777))

(declare-fun m!74779 () Bool)

(assert (=> d!17851 m!74779))

(declare-fun m!74781 () Bool)

(assert (=> d!17851 m!74781))

(declare-fun m!74783 () Bool)

(assert (=> d!17851 m!74783))

(declare-fun m!74785 () Bool)

(assert (=> b!75196 m!74785))

(declare-fun m!74787 () Bool)

(assert (=> b!75197 m!74787))

(assert (=> b!75009 d!17851))

(declare-fun d!17853 () Bool)

(assert (=> d!17853 (= (validMask!0 (mask!6211 (v!2546 (underlying!263 thiss!992)))) (and (or (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000001111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000011111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000001111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000011111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000001111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000011111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000001111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000011111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000000111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000001111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000011111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000000111111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000001111111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000011111111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000000111111111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000001111111111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000011111111111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000000111111111111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000001111111111111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000011111111111111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00000111111111111111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00001111111111111111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00011111111111111111111111111111) (= (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6211 (v!2546 (underlying!263 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!75009 d!17853))

(declare-fun d!17855 () Bool)

(declare-fun e!49149 () Bool)

(assert (=> d!17855 e!49149))

(declare-fun res!39693 () Bool)

(assert (=> d!17855 (=> (not res!39693) (not e!49149))))

(declare-fun lt!33958 () ListLongMap!1423)

(assert (=> d!17855 (= res!39693 (contains!727 lt!33958 (_1!1077 lt!33803)))))

(declare-fun lt!33960 () List!1482)

(assert (=> d!17855 (= lt!33958 (ListLongMap!1424 lt!33960))))

(declare-fun lt!33959 () Unit!2157)

(declare-fun lt!33961 () Unit!2157)

(assert (=> d!17855 (= lt!33959 lt!33961)))

(assert (=> d!17855 (= (getValueByKey!134 lt!33960 (_1!1077 lt!33803)) (Some!139 (_2!1077 lt!33803)))))

(assert (=> d!17855 (= lt!33961 (lemmaContainsTupThenGetReturnValue!51 lt!33960 (_1!1077 lt!33803) (_2!1077 lt!33803)))))

(assert (=> d!17855 (= lt!33960 (insertStrictlySorted!54 (toList!727 lt!33809) (_1!1077 lt!33803) (_2!1077 lt!33803)))))

(assert (=> d!17855 (= (+!96 lt!33809 lt!33803) lt!33958)))

(declare-fun b!75198 () Bool)

(declare-fun res!39694 () Bool)

(assert (=> b!75198 (=> (not res!39694) (not e!49149))))

(assert (=> b!75198 (= res!39694 (= (getValueByKey!134 (toList!727 lt!33958) (_1!1077 lt!33803)) (Some!139 (_2!1077 lt!33803))))))

(declare-fun b!75199 () Bool)

(assert (=> b!75199 (= e!49149 (contains!729 (toList!727 lt!33958) lt!33803))))

(assert (= (and d!17855 res!39693) b!75198))

(assert (= (and b!75198 res!39694) b!75199))

(declare-fun m!74789 () Bool)

(assert (=> d!17855 m!74789))

(declare-fun m!74791 () Bool)

(assert (=> d!17855 m!74791))

(declare-fun m!74793 () Bool)

(assert (=> d!17855 m!74793))

(declare-fun m!74795 () Bool)

(assert (=> d!17855 m!74795))

(declare-fun m!74797 () Bool)

(assert (=> b!75198 m!74797))

(declare-fun m!74799 () Bool)

(assert (=> b!75199 m!74799))

(assert (=> b!75009 d!17855))

(declare-fun d!17857 () Bool)

(assert (=> d!17857 (= (+!96 (+!96 lt!33809 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) (+!96 (+!96 lt!33809 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))))

(declare-fun lt!33964 () Unit!2157)

(declare-fun choose!425 (ListLongMap!1423 (_ BitVec 64) V!2955 (_ BitVec 64) V!2955) Unit!2157)

(assert (=> d!17857 (= lt!33964 (choose!425 lt!33809 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))

(assert (=> d!17857 (not (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17857 (= (addCommutativeForDiffKeys!15 lt!33809 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) lt!33964)))

(declare-fun bs!3235 () Bool)

(assert (= bs!3235 d!17857))

(assert (=> bs!3235 m!74557))

(declare-fun m!74801 () Bool)

(assert (=> bs!3235 m!74801))

(declare-fun m!74803 () Bool)

(assert (=> bs!3235 m!74803))

(assert (=> bs!3235 m!74803))

(declare-fun m!74805 () Bool)

(assert (=> bs!3235 m!74805))

(declare-fun m!74807 () Bool)

(assert (=> bs!3235 m!74807))

(assert (=> bs!3235 m!74807))

(declare-fun m!74809 () Bool)

(assert (=> bs!3235 m!74809))

(assert (=> b!75009 d!17857))

(declare-fun b!75209 () Bool)

(declare-fun e!49158 () Bool)

(declare-fun e!49157 () Bool)

(assert (=> b!75209 (= e!49158 e!49157)))

(declare-fun c!11375 () Bool)

(assert (=> b!75209 (= c!11375 (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!6667 () Bool)

(declare-fun call!6670 () Bool)

(assert (=> bm!6667 (= call!6670 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3890 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun d!17859 () Bool)

(declare-fun res!39699 () Bool)

(assert (=> d!17859 (=> res!39699 e!49158)))

(assert (=> d!17859 (= res!39699 (bvsge #b00000000000000000000000000000000 (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(assert (=> d!17859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992)))) e!49158)))

(declare-fun b!75208 () Bool)

(declare-fun e!49156 () Bool)

(assert (=> b!75208 (= e!49156 call!6670)))

(declare-fun b!75210 () Bool)

(assert (=> b!75210 (= e!49157 call!6670)))

(declare-fun b!75211 () Bool)

(assert (=> b!75211 (= e!49157 e!49156)))

(declare-fun lt!33972 () (_ BitVec 64))

(assert (=> b!75211 (= lt!33972 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!33971 () Unit!2157)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3909 (_ BitVec 64) (_ BitVec 32)) Unit!2157)

(assert (=> b!75211 (= lt!33971 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) lt!33972 #b00000000000000000000000000000000))))

(assert (=> b!75211 (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) lt!33972 #b00000000000000000000000000000000)))

(declare-fun lt!33973 () Unit!2157)

(assert (=> b!75211 (= lt!33973 lt!33971)))

(declare-fun res!39700 () Bool)

(declare-datatypes ((SeekEntryResult!237 0))(
  ( (MissingZero!237 (index!3080 (_ BitVec 32))) (Found!237 (index!3081 (_ BitVec 32))) (Intermediate!237 (undefined!1049 Bool) (index!3082 (_ BitVec 32)) (x!11297 (_ BitVec 32))) (Undefined!237) (MissingVacant!237 (index!3083 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3909 (_ BitVec 32)) SeekEntryResult!237)

(assert (=> b!75211 (= res!39700 (= (seekEntryOrOpen!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000) (_keys!3890 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992)))) (Found!237 #b00000000000000000000000000000000)))))

(assert (=> b!75211 (=> (not res!39700) (not e!49156))))

(assert (= (and d!17859 (not res!39699)) b!75209))

(assert (= (and b!75209 c!11375) b!75211))

(assert (= (and b!75209 (not c!11375)) b!75210))

(assert (= (and b!75211 res!39700) b!75208))

(assert (= (or b!75208 b!75210) bm!6667))

(declare-fun m!74811 () Bool)

(assert (=> b!75209 m!74811))

(assert (=> b!75209 m!74811))

(declare-fun m!74813 () Bool)

(assert (=> b!75209 m!74813))

(declare-fun m!74815 () Bool)

(assert (=> bm!6667 m!74815))

(assert (=> b!75211 m!74811))

(declare-fun m!74817 () Bool)

(assert (=> b!75211 m!74817))

(declare-fun m!74819 () Bool)

(assert (=> b!75211 m!74819))

(assert (=> b!75211 m!74811))

(declare-fun m!74821 () Bool)

(assert (=> b!75211 m!74821))

(assert (=> b!75004 d!17859))

(declare-fun d!17861 () Bool)

(declare-fun c!11378 () Bool)

(assert (=> d!17861 (= c!11378 ((_ is ValueCellFull!897) (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun e!49161 () V!2955)

(assert (=> d!17861 (= (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) from!355) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!49161)))

(declare-fun b!75216 () Bool)

(declare-fun get!1148 (ValueCell!897 V!2955) V!2955)

(assert (=> b!75216 (= e!49161 (get!1148 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) from!355) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!75217 () Bool)

(declare-fun get!1149 (ValueCell!897 V!2955) V!2955)

(assert (=> b!75217 (= e!49161 (get!1149 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) from!355) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17861 c!11378) b!75216))

(assert (= (and d!17861 (not c!11378)) b!75217))

(assert (=> b!75216 m!74583))

(assert (=> b!75216 m!74585))

(declare-fun m!74823 () Bool)

(assert (=> b!75216 m!74823))

(assert (=> b!75217 m!74583))

(assert (=> b!75217 m!74585))

(declare-fun m!74825 () Bool)

(assert (=> b!75217 m!74825))

(assert (=> b!74999 d!17861))

(declare-fun d!17863 () Bool)

(declare-fun e!49167 () Bool)

(assert (=> d!17863 e!49167))

(declare-fun res!39703 () Bool)

(assert (=> d!17863 (=> res!39703 e!49167)))

(declare-fun lt!33985 () Bool)

(assert (=> d!17863 (= res!39703 (not lt!33985))))

(declare-fun lt!33982 () Bool)

(assert (=> d!17863 (= lt!33985 lt!33982)))

(declare-fun lt!33983 () Unit!2157)

(declare-fun e!49166 () Unit!2157)

(assert (=> d!17863 (= lt!33983 e!49166)))

(declare-fun c!11381 () Bool)

(assert (=> d!17863 (= c!11381 lt!33982)))

(declare-fun containsKey!138 (List!1482 (_ BitVec 64)) Bool)

(assert (=> d!17863 (= lt!33982 (containsKey!138 (toList!727 lt!33808) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (=> d!17863 (= (contains!727 lt!33808 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) lt!33985)))

(declare-fun b!75224 () Bool)

(declare-fun lt!33984 () Unit!2157)

(assert (=> b!75224 (= e!49166 lt!33984)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!86 (List!1482 (_ BitVec 64)) Unit!2157)

(assert (=> b!75224 (= lt!33984 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 lt!33808) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun isDefined!87 (Option!140) Bool)

(assert (=> b!75224 (isDefined!87 (getValueByKey!134 (toList!727 lt!33808) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun b!75225 () Bool)

(declare-fun Unit!2166 () Unit!2157)

(assert (=> b!75225 (= e!49166 Unit!2166)))

(declare-fun b!75226 () Bool)

(assert (=> b!75226 (= e!49167 (isDefined!87 (getValueByKey!134 (toList!727 lt!33808) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355))))))

(assert (= (and d!17863 c!11381) b!75224))

(assert (= (and d!17863 (not c!11381)) b!75225))

(assert (= (and d!17863 (not res!39703)) b!75226))

(assert (=> d!17863 m!74557))

(declare-fun m!74827 () Bool)

(assert (=> d!17863 m!74827))

(assert (=> b!75224 m!74557))

(declare-fun m!74829 () Bool)

(assert (=> b!75224 m!74829))

(assert (=> b!75224 m!74557))

(declare-fun m!74831 () Bool)

(assert (=> b!75224 m!74831))

(assert (=> b!75224 m!74831))

(declare-fun m!74833 () Bool)

(assert (=> b!75224 m!74833))

(assert (=> b!75226 m!74557))

(assert (=> b!75226 m!74831))

(assert (=> b!75226 m!74831))

(assert (=> b!75226 m!74833))

(assert (=> b!74993 d!17863))

(declare-fun b!75307 () Bool)

(declare-fun e!49213 () Unit!2157)

(declare-fun Unit!2167 () Unit!2157)

(assert (=> b!75307 (= e!49213 Unit!2167)))

(declare-fun lt!34060 () Unit!2157)

(declare-fun call!6741 () Unit!2157)

(assert (=> b!75307 (= lt!34060 call!6741)))

(declare-fun lt!34040 () SeekEntryResult!237)

(declare-fun call!6735 () SeekEntryResult!237)

(assert (=> b!75307 (= lt!34040 call!6735)))

(declare-fun c!11413 () Bool)

(assert (=> b!75307 (= c!11413 ((_ is MissingZero!237) lt!34040))))

(declare-fun e!49211 () Bool)

(assert (=> b!75307 e!49211))

(declare-fun lt!34057 () Unit!2157)

(assert (=> b!75307 (= lt!34057 lt!34060)))

(assert (=> b!75307 false))

(declare-fun b!75308 () Bool)

(declare-fun res!39736 () Bool)

(declare-fun e!49227 () Bool)

(assert (=> b!75308 (=> (not res!39736) (not e!49227))))

(declare-fun lt!34066 () SeekEntryResult!237)

(assert (=> b!75308 (= res!39736 (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3080 lt!34066)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6716 () Bool)

(declare-fun call!6737 () Bool)

(declare-fun call!6738 () Bool)

(assert (=> bm!6716 (= call!6737 call!6738)))

(declare-fun bm!6717 () Bool)

(declare-fun call!6721 () ListLongMap!1423)

(assert (=> bm!6717 (= call!6721 (map!1155 newMap!16))))

(declare-fun b!75309 () Bool)

(assert (=> b!75309 (= e!49227 (not call!6737))))

(declare-fun bm!6718 () Bool)

(declare-fun call!6723 () SeekEntryResult!237)

(assert (=> bm!6718 (= call!6735 call!6723)))

(declare-fun b!75310 () Bool)

(declare-fun res!39738 () Bool)

(assert (=> b!75310 (= res!39738 (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3083 lt!34040)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49229 () Bool)

(assert (=> b!75310 (=> (not res!39738) (not e!49229))))

(declare-fun c!11416 () Bool)

(declare-fun call!6734 () tuple2!2130)

(declare-fun lt!34048 () SeekEntryResult!237)

(declare-fun bm!6719 () Bool)

(declare-fun updateHelperNewKey!25 (LongMapFixedSize!702 (_ BitVec 64) V!2955 (_ BitVec 32)) tuple2!2130)

(assert (=> bm!6719 (= call!6734 (updateHelperNewKey!25 newMap!16 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806 (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048))))))

(declare-fun bm!6720 () Bool)

(declare-fun call!6730 () SeekEntryResult!237)

(assert (=> bm!6720 (= call!6730 call!6723)))

(declare-fun call!6736 () ListLongMap!1423)

(declare-fun b!75311 () Bool)

(declare-fun e!49222 () Bool)

(assert (=> b!75311 (= e!49222 (= call!6736 (+!96 call!6721 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(declare-fun b!75312 () Bool)

(declare-fun lt!34041 () tuple2!2130)

(assert (=> b!75312 (= lt!34041 call!6734)))

(declare-fun e!49210 () tuple2!2130)

(assert (=> b!75312 (= e!49210 (tuple2!2131 (_1!1076 lt!34041) (_2!1076 lt!34041)))))

(declare-fun b!75313 () Bool)

(declare-fun e!49224 () Bool)

(assert (=> b!75313 (= e!49224 e!49229)))

(declare-fun res!39732 () Bool)

(declare-fun call!6742 () Bool)

(assert (=> b!75313 (= res!39732 call!6742)))

(assert (=> b!75313 (=> (not res!39732) (not e!49229))))

(declare-fun b!75314 () Bool)

(declare-fun e!49220 () Unit!2157)

(declare-fun Unit!2168 () Unit!2157)

(assert (=> b!75314 (= e!49220 Unit!2168)))

(declare-fun lt!34054 () Unit!2157)

(declare-fun call!6725 () Unit!2157)

(assert (=> b!75314 (= lt!34054 call!6725)))

(declare-fun lt!34051 () SeekEntryResult!237)

(assert (=> b!75314 (= lt!34051 call!6730)))

(declare-fun res!39743 () Bool)

(assert (=> b!75314 (= res!39743 ((_ is Found!237) lt!34051))))

(declare-fun e!49223 () Bool)

(assert (=> b!75314 (=> (not res!39743) (not e!49223))))

(assert (=> b!75314 e!49223))

(declare-fun lt!34055 () Unit!2157)

(assert (=> b!75314 (= lt!34055 lt!34054)))

(assert (=> b!75314 false))

(declare-fun bm!6721 () Bool)

(declare-fun c!11410 () Bool)

(declare-fun lt!34063 () (_ BitVec 32))

(declare-fun lt!34065 () (_ BitVec 32))

(declare-fun call!6733 () ListLongMap!1423)

(declare-fun c!11408 () Bool)

(declare-fun lt!34058 () array!3911)

(assert (=> bm!6721 (= call!6733 (getCurrentListMap!424 (_keys!3890 newMap!16) (ite c!11408 (_values!2217 newMap!16) lt!34058) (mask!6211 newMap!16) (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) (ite (and c!11408 c!11410) lt!33806 (zeroValue!2134 newMap!16)) (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun b!75315 () Bool)

(declare-fun res!39740 () Bool)

(assert (=> b!75315 (= res!39740 (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3083 lt!34066)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49218 () Bool)

(assert (=> b!75315 (=> (not res!39740) (not e!49218))))

(declare-fun c!11415 () Bool)

(declare-fun lt!34045 () SeekEntryResult!237)

(declare-fun call!6726 () Bool)

(declare-fun c!11420 () Bool)

(declare-fun c!11419 () Bool)

(declare-fun bm!6722 () Bool)

(declare-fun c!11418 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6722 (= call!6726 (inRange!0 (ite c!11419 (ite c!11418 (index!3081 lt!34051) (ite c!11420 (index!3080 lt!34066) (index!3083 lt!34066))) (ite c!11415 (index!3081 lt!34045) (ite c!11413 (index!3080 lt!34040) (index!3083 lt!34040)))) (mask!6211 newMap!16)))))

(declare-fun b!75316 () Bool)

(declare-fun res!39742 () Bool)

(declare-fun call!6720 () Bool)

(assert (=> b!75316 (= res!39742 call!6720)))

(assert (=> b!75316 (=> (not res!39742) (not e!49223))))

(declare-fun b!75317 () Bool)

(declare-fun e!49216 () ListLongMap!1423)

(assert (=> b!75317 (= e!49216 call!6733)))

(declare-fun bm!6723 () Bool)

(assert (=> bm!6723 (= call!6738 (arrayContainsKey!0 (_keys!3890 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!6724 () Bool)

(assert (=> bm!6724 (= call!6723 (seekEntryOrOpen!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (_keys!3890 newMap!16) (mask!6211 newMap!16)))))

(declare-fun b!75318 () Bool)

(declare-fun c!11411 () Bool)

(assert (=> b!75318 (= c!11411 ((_ is MissingVacant!237) lt!34040))))

(assert (=> b!75318 (= e!49211 e!49224)))

(declare-fun b!75319 () Bool)

(assert (=> b!75319 (= e!49223 (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3081 lt!34051)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun b!75320 () Bool)

(declare-fun lt!34047 () Unit!2157)

(declare-fun lt!34061 () Unit!2157)

(assert (=> b!75320 (= lt!34047 lt!34061)))

(declare-fun call!6719 () ListLongMap!1423)

(declare-fun call!6739 () ListLongMap!1423)

(assert (=> b!75320 (= call!6719 call!6739)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!25 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 V!2955 Int) Unit!2157)

(assert (=> b!75320 (= lt!34061 (lemmaChangeLongMinValueKeyThenAddPairToListMap!25 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) lt!34065 (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) lt!33806 (defaultEntry!2234 newMap!16)))))

(assert (=> b!75320 (= lt!34065 (bvor (extraKeys!2089 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!49215 () tuple2!2130)

(assert (=> b!75320 (= e!49215 (tuple2!2131 true (LongMapFixedSize!703 (defaultEntry!2234 newMap!16) (mask!6211 newMap!16) (bvor (extraKeys!2089 newMap!16) #b00000000000000000000000000000010) (zeroValue!2134 newMap!16) lt!33806 (_size!400 newMap!16) (_keys!3890 newMap!16) (_values!2217 newMap!16) (_vacant!400 newMap!16))))))

(declare-fun b!75321 () Bool)

(assert (=> b!75321 (= c!11416 ((_ is MissingVacant!237) lt!34048))))

(declare-fun e!49228 () tuple2!2130)

(declare-fun e!49217 () tuple2!2130)

(assert (=> b!75321 (= e!49228 e!49217)))

(declare-fun bm!6725 () Bool)

(assert (=> bm!6725 (= call!6739 call!6733)))

(declare-fun call!6731 () ListLongMap!1423)

(declare-fun bm!6726 () Bool)

(assert (=> bm!6726 (= call!6731 (getCurrentListMap!424 (_keys!3890 newMap!16) (ite c!11419 (_values!2217 newMap!16) (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (index!3081 lt!34048) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16)))) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun b!75322 () Bool)

(declare-fun e!49226 () Bool)

(assert (=> b!75322 (= e!49226 e!49218)))

(declare-fun res!39741 () Bool)

(declare-fun call!6722 () Bool)

(assert (=> b!75322 (= res!39741 call!6722)))

(assert (=> b!75322 (=> (not res!39741) (not e!49218))))

(declare-fun b!75323 () Bool)

(declare-fun lt!34053 () Unit!2157)

(assert (=> b!75323 (= e!49213 lt!34053)))

(assert (=> b!75323 (= lt!34053 call!6725)))

(assert (=> b!75323 (= lt!34045 call!6735)))

(declare-fun res!39745 () Bool)

(assert (=> b!75323 (= res!39745 ((_ is Found!237) lt!34045))))

(declare-fun e!49230 () Bool)

(assert (=> b!75323 (=> (not res!39745) (not e!49230))))

(assert (=> b!75323 e!49230))

(declare-fun b!75324 () Bool)

(assert (=> b!75324 (= e!49218 (not call!6737))))

(declare-fun b!75325 () Bool)

(declare-fun call!6732 () Bool)

(assert (=> b!75325 (= e!49229 (not call!6732))))

(declare-fun b!75326 () Bool)

(declare-fun e!49221 () Bool)

(assert (=> b!75326 (= e!49221 e!49222)))

(declare-fun res!39734 () Bool)

(assert (=> b!75326 (= res!39734 (contains!727 call!6736 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (=> b!75326 (=> (not res!39734) (not e!49222))))

(declare-fun d!17865 () Bool)

(declare-fun e!49225 () Bool)

(assert (=> d!17865 e!49225))

(declare-fun res!39737 () Bool)

(assert (=> d!17865 (=> (not res!39737) (not e!49225))))

(declare-fun lt!34059 () tuple2!2130)

(assert (=> d!17865 (= res!39737 (valid!293 (_2!1076 lt!34059)))))

(declare-fun e!49214 () tuple2!2130)

(assert (=> d!17865 (= lt!34059 e!49214)))

(assert (=> d!17865 (= c!11408 (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvneg (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355))))))

(assert (=> d!17865 (valid!293 newMap!16)))

(assert (=> d!17865 (= (update!98 newMap!16 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806) lt!34059)))

(declare-fun bm!6727 () Bool)

(declare-fun call!6727 () Bool)

(assert (=> bm!6727 (= call!6742 call!6727)))

(declare-fun b!75327 () Bool)

(declare-fun res!39739 () Bool)

(declare-fun e!49219 () Bool)

(assert (=> b!75327 (=> (not res!39739) (not e!49219))))

(assert (=> b!75327 (= res!39739 (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3080 lt!34040)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75328 () Bool)

(declare-fun res!39744 () Bool)

(assert (=> b!75328 (= res!39744 call!6727)))

(assert (=> b!75328 (=> (not res!39744) (not e!49230))))

(declare-fun bm!6728 () Bool)

(assert (=> bm!6728 (= call!6732 call!6738)))

(declare-fun b!75329 () Bool)

(assert (=> b!75329 (= e!49214 e!49215)))

(assert (=> b!75329 (= c!11410 (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75330 () Bool)

(declare-fun res!39733 () Bool)

(assert (=> b!75330 (=> (not res!39733) (not e!49219))))

(assert (=> b!75330 (= res!39733 call!6742)))

(assert (=> b!75330 (= e!49211 e!49219)))

(declare-fun bm!6729 () Bool)

(assert (=> bm!6729 (= call!6720 call!6726)))

(declare-fun b!75331 () Bool)

(assert (=> b!75331 (= e!49226 ((_ is Undefined!237) lt!34066))))

(declare-fun bm!6730 () Bool)

(declare-fun call!6724 () ListLongMap!1423)

(declare-fun call!6728 () ListLongMap!1423)

(assert (=> bm!6730 (= call!6724 call!6728)))

(declare-fun b!75332 () Bool)

(assert (=> b!75332 (= e!49214 e!49228)))

(assert (=> b!75332 (= lt!34048 (seekEntryOrOpen!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (_keys!3890 newMap!16) (mask!6211 newMap!16)))))

(assert (=> b!75332 (= c!11419 ((_ is Undefined!237) lt!34048))))

(declare-fun b!75333 () Bool)

(declare-fun lt!34064 () tuple2!2130)

(assert (=> b!75333 (= e!49217 (tuple2!2131 (_1!1076 lt!34064) (_2!1076 lt!34064)))))

(assert (=> b!75333 (= lt!34064 call!6734)))

(declare-fun bm!6731 () Bool)

(declare-fun c!11414 () Bool)

(assert (=> bm!6731 (= c!11414 c!11419)))

(declare-fun call!6729 () Bool)

(assert (=> bm!6731 (= call!6729 (contains!727 e!49216 (ite c!11419 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (select (arr!1865 (_keys!3890 newMap!16)) (index!3081 lt!34048)))))))

(declare-fun b!75334 () Bool)

(declare-fun lt!34042 () Unit!2157)

(assert (=> b!75334 (= e!49220 lt!34042)))

(assert (=> b!75334 (= lt!34042 call!6741)))

(assert (=> b!75334 (= lt!34066 call!6730)))

(assert (=> b!75334 (= c!11420 ((_ is MissingZero!237) lt!34066))))

(declare-fun e!49212 () Bool)

(assert (=> b!75334 e!49212))

(declare-fun bm!6732 () Bool)

(declare-fun call!6740 () ListLongMap!1423)

(assert (=> bm!6732 (= call!6719 call!6740)))

(declare-fun bm!6733 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!25 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 64) Int) Unit!2157)

(assert (=> bm!6733 (= call!6741 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!25 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (defaultEntry!2234 newMap!16)))))

(declare-fun bm!6734 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!25 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 64) Int) Unit!2157)

(assert (=> bm!6734 (= call!6725 (lemmaInListMapThenSeekEntryOrOpenFindsIt!25 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (defaultEntry!2234 newMap!16)))))

(declare-fun bm!6735 () Bool)

(assert (=> bm!6735 (= call!6727 call!6726)))

(declare-fun bm!6736 () Bool)

(assert (=> bm!6736 (= call!6740 (+!96 (ite c!11408 call!6724 call!6728) (ite c!11408 (ite c!11410 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33806) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(declare-fun b!75335 () Bool)

(assert (=> b!75335 (= e!49224 ((_ is Undefined!237) lt!34040))))

(declare-fun b!75336 () Bool)

(assert (=> b!75336 (= e!49216 call!6731)))

(declare-fun b!75337 () Bool)

(declare-fun lt!34049 () Unit!2157)

(assert (=> b!75337 (= lt!34049 e!49220)))

(assert (=> b!75337 (= c!11418 call!6729)))

(assert (=> b!75337 (= e!49228 (tuple2!2131 false newMap!16))))

(declare-fun b!75338 () Bool)

(declare-fun res!39735 () Bool)

(assert (=> b!75338 (=> (not res!39735) (not e!49227))))

(assert (=> b!75338 (= res!39735 call!6722)))

(assert (=> b!75338 (= e!49212 e!49227)))

(declare-fun b!75339 () Bool)

(assert (=> b!75339 (= e!49230 (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3081 lt!34045)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun b!75340 () Bool)

(declare-fun lt!34056 () Unit!2157)

(declare-fun lt!34043 () Unit!2157)

(assert (=> b!75340 (= lt!34056 lt!34043)))

(assert (=> b!75340 (= call!6719 call!6739)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!25 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 V!2955 Int) Unit!2157)

(assert (=> b!75340 (= lt!34043 (lemmaChangeZeroKeyThenAddPairToListMap!25 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) lt!34063 (zeroValue!2134 newMap!16) lt!33806 (minValue!2134 newMap!16) (defaultEntry!2234 newMap!16)))))

(assert (=> b!75340 (= lt!34063 (bvor (extraKeys!2089 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!75340 (= e!49215 (tuple2!2131 true (LongMapFixedSize!703 (defaultEntry!2234 newMap!16) (mask!6211 newMap!16) (bvor (extraKeys!2089 newMap!16) #b00000000000000000000000000000001) lt!33806 (minValue!2134 newMap!16) (_size!400 newMap!16) (_keys!3890 newMap!16) (_values!2217 newMap!16) (_vacant!400 newMap!16))))))

(declare-fun bm!6737 () Bool)

(assert (=> bm!6737 (= call!6722 call!6720)))

(declare-fun b!75341 () Bool)

(assert (=> b!75341 (= e!49219 (not call!6732))))

(declare-fun b!75342 () Bool)

(declare-fun lt!34052 () Unit!2157)

(declare-fun lt!34062 () Unit!2157)

(assert (=> b!75342 (= lt!34052 lt!34062)))

(assert (=> b!75342 call!6729))

(declare-fun lemmaValidKeyInArrayIsInListMap!86 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 32) Int) Unit!2157)

(assert (=> b!75342 (= lt!34062 (lemmaValidKeyInArrayIsInListMap!86 (_keys!3890 newMap!16) lt!34058 (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (index!3081 lt!34048) (defaultEntry!2234 newMap!16)))))

(assert (=> b!75342 (= lt!34058 (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (index!3081 lt!34048) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16))))))

(declare-fun lt!34044 () Unit!2157)

(declare-fun lt!34050 () Unit!2157)

(assert (=> b!75342 (= lt!34044 lt!34050)))

(assert (=> b!75342 (= call!6740 call!6731)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!25 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 32) (_ BitVec 64) V!2955 Int) Unit!2157)

(assert (=> b!75342 (= lt!34050 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!25 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (index!3081 lt!34048) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34046 () Unit!2157)

(assert (=> b!75342 (= lt!34046 e!49213)))

(assert (=> b!75342 (= c!11415 (contains!727 call!6728 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (=> b!75342 (= e!49210 (tuple2!2131 true (LongMapFixedSize!703 (defaultEntry!2234 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (_size!400 newMap!16) (_keys!3890 newMap!16) (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (index!3081 lt!34048) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16))) (_vacant!400 newMap!16))))))

(declare-fun bm!6738 () Bool)

(assert (=> bm!6738 (= call!6736 (map!1155 (_2!1076 lt!34059)))))

(declare-fun bm!6739 () Bool)

(assert (=> bm!6739 (= call!6728 (getCurrentListMap!424 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun b!75343 () Bool)

(assert (=> b!75343 (= e!49225 e!49221)))

(declare-fun c!11412 () Bool)

(assert (=> b!75343 (= c!11412 (_1!1076 lt!34059))))

(declare-fun b!75344 () Bool)

(assert (=> b!75344 (= e!49221 (= call!6736 call!6721))))

(declare-fun b!75345 () Bool)

(declare-fun c!11409 () Bool)

(assert (=> b!75345 (= c!11409 ((_ is MissingVacant!237) lt!34066))))

(assert (=> b!75345 (= e!49212 e!49226)))

(declare-fun b!75346 () Bool)

(assert (=> b!75346 (= e!49217 e!49210)))

(declare-fun c!11417 () Bool)

(assert (=> b!75346 (= c!11417 ((_ is MissingZero!237) lt!34048))))

(assert (= (and d!17865 c!11408) b!75329))

(assert (= (and d!17865 (not c!11408)) b!75332))

(assert (= (and b!75329 c!11410) b!75340))

(assert (= (and b!75329 (not c!11410)) b!75320))

(assert (= (or b!75340 b!75320) bm!6725))

(assert (= (or b!75340 b!75320) bm!6730))

(assert (= (or b!75340 b!75320) bm!6732))

(assert (= (and b!75332 c!11419) b!75337))

(assert (= (and b!75332 (not c!11419)) b!75321))

(assert (= (and b!75337 c!11418) b!75314))

(assert (= (and b!75337 (not c!11418)) b!75334))

(assert (= (and b!75314 res!39743) b!75316))

(assert (= (and b!75316 res!39742) b!75319))

(assert (= (and b!75334 c!11420) b!75338))

(assert (= (and b!75334 (not c!11420)) b!75345))

(assert (= (and b!75338 res!39735) b!75308))

(assert (= (and b!75308 res!39736) b!75309))

(assert (= (and b!75345 c!11409) b!75322))

(assert (= (and b!75345 (not c!11409)) b!75331))

(assert (= (and b!75322 res!39741) b!75315))

(assert (= (and b!75315 res!39740) b!75324))

(assert (= (or b!75338 b!75322) bm!6737))

(assert (= (or b!75309 b!75324) bm!6716))

(assert (= (or b!75316 bm!6737) bm!6729))

(assert (= (or b!75314 b!75334) bm!6720))

(assert (= (and b!75321 c!11416) b!75333))

(assert (= (and b!75321 (not c!11416)) b!75346))

(assert (= (and b!75346 c!11417) b!75312))

(assert (= (and b!75346 (not c!11417)) b!75342))

(assert (= (and b!75342 c!11415) b!75323))

(assert (= (and b!75342 (not c!11415)) b!75307))

(assert (= (and b!75323 res!39745) b!75328))

(assert (= (and b!75328 res!39744) b!75339))

(assert (= (and b!75307 c!11413) b!75330))

(assert (= (and b!75307 (not c!11413)) b!75318))

(assert (= (and b!75330 res!39733) b!75327))

(assert (= (and b!75327 res!39739) b!75341))

(assert (= (and b!75318 c!11411) b!75313))

(assert (= (and b!75318 (not c!11411)) b!75335))

(assert (= (and b!75313 res!39732) b!75310))

(assert (= (and b!75310 res!39738) b!75325))

(assert (= (or b!75330 b!75313) bm!6727))

(assert (= (or b!75341 b!75325) bm!6728))

(assert (= (or b!75328 bm!6727) bm!6735))

(assert (= (or b!75323 b!75307) bm!6718))

(assert (= (or b!75333 b!75312) bm!6719))

(assert (= (or b!75337 b!75342) bm!6726))

(assert (= (or bm!6720 bm!6718) bm!6724))

(assert (= (or bm!6729 bm!6735) bm!6722))

(assert (= (or b!75314 b!75323) bm!6734))

(assert (= (or b!75334 b!75307) bm!6733))

(assert (= (or bm!6716 bm!6728) bm!6723))

(assert (= (or b!75337 b!75342) bm!6731))

(assert (= (and bm!6731 c!11414) b!75336))

(assert (= (and bm!6731 (not c!11414)) b!75317))

(assert (= (or bm!6730 b!75342) bm!6739))

(assert (= (or bm!6725 b!75317) bm!6721))

(assert (= (or bm!6732 b!75342) bm!6736))

(assert (= (and d!17865 res!39737) b!75343))

(assert (= (and b!75343 c!11412) b!75326))

(assert (= (and b!75343 (not c!11412)) b!75344))

(assert (= (and b!75326 res!39734) b!75311))

(assert (= (or b!75326 b!75311 b!75344) bm!6738))

(assert (= (or b!75311 b!75344) bm!6717))

(declare-fun m!74835 () Bool)

(assert (=> b!75339 m!74835))

(declare-fun m!74837 () Bool)

(assert (=> d!17865 m!74837))

(assert (=> d!17865 m!74589))

(declare-fun m!74839 () Bool)

(assert (=> b!75342 m!74839))

(declare-fun m!74841 () Bool)

(assert (=> b!75342 m!74841))

(assert (=> b!75342 m!74557))

(declare-fun m!74843 () Bool)

(assert (=> b!75342 m!74843))

(assert (=> b!75342 m!74557))

(declare-fun m!74845 () Bool)

(assert (=> b!75342 m!74845))

(assert (=> bm!6739 m!74667))

(declare-fun m!74847 () Bool)

(assert (=> bm!6731 m!74847))

(declare-fun m!74849 () Bool)

(assert (=> bm!6731 m!74849))

(declare-fun m!74851 () Bool)

(assert (=> b!75311 m!74851))

(declare-fun m!74853 () Bool)

(assert (=> bm!6721 m!74853))

(assert (=> b!75326 m!74557))

(declare-fun m!74855 () Bool)

(assert (=> b!75326 m!74855))

(assert (=> bm!6719 m!74557))

(declare-fun m!74857 () Bool)

(assert (=> bm!6719 m!74857))

(declare-fun m!74859 () Bool)

(assert (=> bm!6738 m!74859))

(declare-fun m!74861 () Bool)

(assert (=> b!75310 m!74861))

(assert (=> bm!6723 m!74557))

(declare-fun m!74863 () Bool)

(assert (=> bm!6723 m!74863))

(declare-fun m!74865 () Bool)

(assert (=> b!75308 m!74865))

(declare-fun m!74867 () Bool)

(assert (=> b!75340 m!74867))

(assert (=> bm!6717 m!74579))

(assert (=> bm!6726 m!74841))

(declare-fun m!74869 () Bool)

(assert (=> bm!6726 m!74869))

(assert (=> b!75332 m!74557))

(declare-fun m!74871 () Bool)

(assert (=> b!75332 m!74871))

(declare-fun m!74873 () Bool)

(assert (=> b!75315 m!74873))

(assert (=> bm!6734 m!74557))

(declare-fun m!74875 () Bool)

(assert (=> bm!6734 m!74875))

(assert (=> bm!6724 m!74557))

(assert (=> bm!6724 m!74871))

(declare-fun m!74877 () Bool)

(assert (=> bm!6736 m!74877))

(declare-fun m!74879 () Bool)

(assert (=> b!75327 m!74879))

(declare-fun m!74881 () Bool)

(assert (=> b!75320 m!74881))

(declare-fun m!74883 () Bool)

(assert (=> bm!6722 m!74883))

(assert (=> bm!6733 m!74557))

(declare-fun m!74885 () Bool)

(assert (=> bm!6733 m!74885))

(declare-fun m!74887 () Bool)

(assert (=> b!75319 m!74887))

(assert (=> b!74993 d!17865))

(declare-fun d!17867 () Bool)

(assert (=> d!17867 (not (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34069 () Unit!2157)

(declare-fun choose!68 (array!3909 (_ BitVec 32) (_ BitVec 64) List!1483) Unit!2157)

(assert (=> d!17867 (= lt!34069 (choose!68 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (Cons!1479 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) Nil!1480)))))

(assert (=> d!17867 (bvslt (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!17867 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (Cons!1479 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) Nil!1480)) lt!34069)))

(declare-fun bs!3236 () Bool)

(assert (= bs!3236 d!17867))

(assert (=> bs!3236 m!74557))

(assert (=> bs!3236 m!74597))

(assert (=> bs!3236 m!74557))

(declare-fun m!74889 () Bool)

(assert (=> bs!3236 m!74889))

(assert (=> b!75006 d!17867))

(declare-fun d!17869 () Bool)

(assert (=> d!17869 (arrayNoDuplicates!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) from!355 Nil!1480)))

(declare-fun lt!34072 () Unit!2157)

(declare-fun choose!39 (array!3909 (_ BitVec 32) (_ BitVec 32)) Unit!2157)

(assert (=> d!17869 (= lt!34072 (choose!39 (_keys!3890 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!17869 (bvslt (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!17869 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000000 from!355) lt!34072)))

(declare-fun bs!3237 () Bool)

(assert (= bs!3237 d!17869))

(assert (=> bs!3237 m!74593))

(declare-fun m!74891 () Bool)

(assert (=> bs!3237 m!74891))

(assert (=> b!75006 d!17869))

(declare-fun d!17871 () Bool)

(declare-fun res!39750 () Bool)

(declare-fun e!49235 () Bool)

(assert (=> d!17871 (=> res!39750 e!49235)))

(assert (=> d!17871 (= res!39750 (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (=> d!17871 (= (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!49235)))

(declare-fun b!75351 () Bool)

(declare-fun e!49236 () Bool)

(assert (=> b!75351 (= e!49235 e!49236)))

(declare-fun res!39751 () Bool)

(assert (=> b!75351 (=> (not res!39751) (not e!49236))))

(assert (=> b!75351 (= res!39751 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun b!75352 () Bool)

(assert (=> b!75352 (= e!49236 (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!17871 (not res!39750)) b!75351))

(assert (= (and b!75351 res!39751) b!75352))

(assert (=> d!17871 m!74673))

(assert (=> b!75352 m!74557))

(declare-fun m!74893 () Bool)

(assert (=> b!75352 m!74893))

(assert (=> b!75006 d!17871))

(declare-fun d!17873 () Bool)

(declare-fun e!49239 () Bool)

(assert (=> d!17873 e!49239))

(declare-fun c!11423 () Bool)

(assert (=> d!17873 (= c!11423 (and (not (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!34075 () Unit!2157)

(declare-fun choose!426 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 64) (_ BitVec 32) Int) Unit!2157)

(assert (=> d!17873 (= lt!34075 (choose!426 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))))))

(assert (=> d!17873 (validMask!0 (mask!6211 (v!2546 (underlying!263 thiss!992))))))

(assert (=> d!17873 (= (lemmaListMapContainsThenArrayContainsFrom!51 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))) lt!34075)))

(declare-fun b!75357 () Bool)

(assert (=> b!75357 (= e!49239 (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!75358 () Bool)

(assert (=> b!75358 (= e!49239 (ite (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!17873 c!11423) b!75357))

(assert (= (and d!17873 (not c!11423)) b!75358))

(assert (=> d!17873 m!74557))

(declare-fun m!74895 () Bool)

(assert (=> d!17873 m!74895))

(assert (=> d!17873 m!74567))

(assert (=> b!75357 m!74557))

(assert (=> b!75357 m!74597))

(assert (=> b!75006 d!17873))

(declare-fun b!75369 () Bool)

(declare-fun e!49248 () Bool)

(declare-fun e!49249 () Bool)

(assert (=> b!75369 (= e!49248 e!49249)))

(declare-fun c!11426 () Bool)

(assert (=> b!75369 (= c!11426 (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun b!75370 () Bool)

(declare-fun call!6745 () Bool)

(assert (=> b!75370 (= e!49249 call!6745)))

(declare-fun d!17875 () Bool)

(declare-fun res!39760 () Bool)

(declare-fun e!49251 () Bool)

(assert (=> d!17875 (=> res!39760 e!49251)))

(assert (=> d!17875 (= res!39760 (bvsge from!355 (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(assert (=> d!17875 (= (arrayNoDuplicates!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) from!355 Nil!1480) e!49251)))

(declare-fun b!75371 () Bool)

(assert (=> b!75371 (= e!49249 call!6745)))

(declare-fun b!75372 () Bool)

(assert (=> b!75372 (= e!49251 e!49248)))

(declare-fun res!39759 () Bool)

(assert (=> b!75372 (=> (not res!39759) (not e!49248))))

(declare-fun e!49250 () Bool)

(assert (=> b!75372 (= res!39759 (not e!49250))))

(declare-fun res!39758 () Bool)

(assert (=> b!75372 (=> (not res!39758) (not e!49250))))

(assert (=> b!75372 (= res!39758 (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun bm!6742 () Bool)

(assert (=> bm!6742 (= call!6745 (arrayNoDuplicates!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11426 (Cons!1479 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) Nil!1480) Nil!1480)))))

(declare-fun b!75373 () Bool)

(declare-fun contains!730 (List!1483 (_ BitVec 64)) Bool)

(assert (=> b!75373 (= e!49250 (contains!730 Nil!1480 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (= (and d!17875 (not res!39760)) b!75372))

(assert (= (and b!75372 res!39758) b!75373))

(assert (= (and b!75372 res!39759) b!75369))

(assert (= (and b!75369 c!11426) b!75370))

(assert (= (and b!75369 (not c!11426)) b!75371))

(assert (= (or b!75370 b!75371) bm!6742))

(assert (=> b!75369 m!74557))

(assert (=> b!75369 m!74557))

(declare-fun m!74897 () Bool)

(assert (=> b!75369 m!74897))

(assert (=> b!75372 m!74557))

(assert (=> b!75372 m!74557))

(assert (=> b!75372 m!74897))

(assert (=> bm!6742 m!74557))

(declare-fun m!74899 () Bool)

(assert (=> bm!6742 m!74899))

(assert (=> b!75373 m!74557))

(assert (=> b!75373 m!74557))

(declare-fun m!74901 () Bool)

(assert (=> b!75373 m!74901))

(assert (=> b!75006 d!17875))

(declare-fun mapIsEmpty!3207 () Bool)

(declare-fun mapRes!3207 () Bool)

(assert (=> mapIsEmpty!3207 mapRes!3207))

(declare-fun b!75381 () Bool)

(declare-fun e!49256 () Bool)

(assert (=> b!75381 (= e!49256 tp_is_empty!2481)))

(declare-fun mapNonEmpty!3207 () Bool)

(declare-fun tp!8589 () Bool)

(declare-fun e!49257 () Bool)

(assert (=> mapNonEmpty!3207 (= mapRes!3207 (and tp!8589 e!49257))))

(declare-fun mapKey!3207 () (_ BitVec 32))

(declare-fun mapValue!3207 () ValueCell!897)

(declare-fun mapRest!3207 () (Array (_ BitVec 32) ValueCell!897))

(assert (=> mapNonEmpty!3207 (= mapRest!3198 (store mapRest!3207 mapKey!3207 mapValue!3207))))

(declare-fun b!75380 () Bool)

(assert (=> b!75380 (= e!49257 tp_is_empty!2481)))

(declare-fun condMapEmpty!3207 () Bool)

(declare-fun mapDefault!3207 () ValueCell!897)

(assert (=> mapNonEmpty!3198 (= condMapEmpty!3207 (= mapRest!3198 ((as const (Array (_ BitVec 32) ValueCell!897)) mapDefault!3207)))))

(assert (=> mapNonEmpty!3198 (= tp!8572 (and e!49256 mapRes!3207))))

(assert (= (and mapNonEmpty!3198 condMapEmpty!3207) mapIsEmpty!3207))

(assert (= (and mapNonEmpty!3198 (not condMapEmpty!3207)) mapNonEmpty!3207))

(assert (= (and mapNonEmpty!3207 ((_ is ValueCellFull!897) mapValue!3207)) b!75380))

(assert (= (and mapNonEmpty!3198 ((_ is ValueCellFull!897) mapDefault!3207)) b!75381))

(declare-fun m!74903 () Bool)

(assert (=> mapNonEmpty!3207 m!74903))

(declare-fun mapIsEmpty!3208 () Bool)

(declare-fun mapRes!3208 () Bool)

(assert (=> mapIsEmpty!3208 mapRes!3208))

(declare-fun b!75383 () Bool)

(declare-fun e!49258 () Bool)

(assert (=> b!75383 (= e!49258 tp_is_empty!2481)))

(declare-fun mapNonEmpty!3208 () Bool)

(declare-fun tp!8590 () Bool)

(declare-fun e!49259 () Bool)

(assert (=> mapNonEmpty!3208 (= mapRes!3208 (and tp!8590 e!49259))))

(declare-fun mapKey!3208 () (_ BitVec 32))

(declare-fun mapValue!3208 () ValueCell!897)

(declare-fun mapRest!3208 () (Array (_ BitVec 32) ValueCell!897))

(assert (=> mapNonEmpty!3208 (= mapRest!3197 (store mapRest!3208 mapKey!3208 mapValue!3208))))

(declare-fun b!75382 () Bool)

(assert (=> b!75382 (= e!49259 tp_is_empty!2481)))

(declare-fun condMapEmpty!3208 () Bool)

(declare-fun mapDefault!3208 () ValueCell!897)

(assert (=> mapNonEmpty!3197 (= condMapEmpty!3208 (= mapRest!3197 ((as const (Array (_ BitVec 32) ValueCell!897)) mapDefault!3208)))))

(assert (=> mapNonEmpty!3197 (= tp!8573 (and e!49258 mapRes!3208))))

(assert (= (and mapNonEmpty!3197 condMapEmpty!3208) mapIsEmpty!3208))

(assert (= (and mapNonEmpty!3197 (not condMapEmpty!3208)) mapNonEmpty!3208))

(assert (= (and mapNonEmpty!3208 ((_ is ValueCellFull!897) mapValue!3208)) b!75382))

(assert (= (and mapNonEmpty!3197 ((_ is ValueCellFull!897) mapDefault!3208)) b!75383))

(declare-fun m!74905 () Bool)

(assert (=> mapNonEmpty!3208 m!74905))

(declare-fun b_lambda!3385 () Bool)

(assert (= b_lambda!3379 (or (and b!75012 b_free!2129) (and b!74998 b_free!2131 (= (defaultEntry!2234 newMap!16) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))))) b_lambda!3385)))

(declare-fun b_lambda!3387 () Bool)

(assert (= b_lambda!3383 (or (and b!75012 b_free!2129) (and b!74998 b_free!2131 (= (defaultEntry!2234 newMap!16) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))))) b_lambda!3387)))

(declare-fun b_lambda!3389 () Bool)

(assert (= b_lambda!3381 (or (and b!75012 b_free!2129) (and b!74998 b_free!2131 (= (defaultEntry!2234 newMap!16) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))))) b_lambda!3389)))

(check-sat (not b!75198) (not b!75185) tp_is_empty!2481 (not b!75142) (not b!75342) (not b!75224) (not b_lambda!3385) (not bm!6664) (not b!75177) (not b!75320) (not bm!6724) (not d!17869) (not b!75133) (not b_lambda!3387) (not d!17849) (not d!17865) (not d!17855) (not b_next!2129) (not b!75195) (not d!17851) (not bm!6731) (not b!75372) (not b!75180) (not b!75311) b_and!4615 (not b!75197) (not bm!6719) (not d!17847) (not bm!6667) b_and!4617 (not mapNonEmpty!3207) (not b!75151) (not d!17839) (not b_lambda!3389) (not b!75352) (not mapNonEmpty!3208) (not b!75326) (not b!75178) (not b!75211) (not b!75209) (not d!17837) (not bm!6658) (not b!75131) (not bm!6733) (not bm!6736) (not b!75192) (not b!75150) (not bm!6723) (not b!75226) (not bm!6661) (not bm!6739) (not bm!6659) (not b!75176) (not b!75196) (not d!17867) (not b!75184) (not d!17841) (not b_lambda!3377) (not b!75137) (not d!17873) (not bm!6734) (not b!75149) (not d!17845) (not b!75135) (not b!75332) (not b!75217) (not bm!6655) (not b!75193) (not b!75199) (not bm!6738) (not bm!6717) (not bm!6742) (not d!17843) (not d!17863) (not b!75181) (not b!75340) (not b!75126) (not b!75357) (not bm!6722) (not bm!6726) (not b!75373) (not b!75194) (not b!75216) (not b!75122) (not b!75186) (not b!75128) (not d!17857) (not b_next!2131) (not b!75369) (not bm!6721))
(check-sat b_and!4615 b_and!4617 (not b_next!2129) (not b_next!2131))
(get-model)

(declare-fun d!17877 () Bool)

(assert (=> d!17877 (= (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75122 d!17877))

(declare-fun d!17879 () Bool)

(declare-fun e!49261 () Bool)

(assert (=> d!17879 e!49261))

(declare-fun res!39761 () Bool)

(assert (=> d!17879 (=> res!39761 e!49261)))

(declare-fun lt!34079 () Bool)

(assert (=> d!17879 (= res!39761 (not lt!34079))))

(declare-fun lt!34076 () Bool)

(assert (=> d!17879 (= lt!34079 lt!34076)))

(declare-fun lt!34077 () Unit!2157)

(declare-fun e!49260 () Unit!2157)

(assert (=> d!17879 (= lt!34077 e!49260)))

(declare-fun c!11427 () Bool)

(assert (=> d!17879 (= c!11427 lt!34076)))

(assert (=> d!17879 (= lt!34076 (containsKey!138 (toList!727 lt!33937) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17879 (= (contains!727 lt!33937 #b0000000000000000000000000000000000000000000000000000000000000000) lt!34079)))

(declare-fun b!75384 () Bool)

(declare-fun lt!34078 () Unit!2157)

(assert (=> b!75384 (= e!49260 lt!34078)))

(assert (=> b!75384 (= lt!34078 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 lt!33937) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75384 (isDefined!87 (getValueByKey!134 (toList!727 lt!33937) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75385 () Bool)

(declare-fun Unit!2169 () Unit!2157)

(assert (=> b!75385 (= e!49260 Unit!2169)))

(declare-fun b!75386 () Bool)

(assert (=> b!75386 (= e!49261 (isDefined!87 (getValueByKey!134 (toList!727 lt!33937) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17879 c!11427) b!75384))

(assert (= (and d!17879 (not c!11427)) b!75385))

(assert (= (and d!17879 (not res!39761)) b!75386))

(declare-fun m!74907 () Bool)

(assert (=> d!17879 m!74907))

(declare-fun m!74909 () Bool)

(assert (=> b!75384 m!74909))

(declare-fun m!74911 () Bool)

(assert (=> b!75384 m!74911))

(assert (=> b!75384 m!74911))

(declare-fun m!74913 () Bool)

(assert (=> b!75384 m!74913))

(assert (=> b!75386 m!74911))

(assert (=> b!75386 m!74911))

(assert (=> b!75386 m!74913))

(assert (=> d!17845 d!17879))

(assert (=> d!17845 d!17853))

(declare-fun d!17881 () Bool)

(declare-fun res!39762 () Bool)

(declare-fun e!49262 () Bool)

(assert (=> d!17881 (=> (not res!39762) (not e!49262))))

(assert (=> d!17881 (= res!39762 (simpleValid!52 (v!2546 (underlying!263 thiss!992))))))

(assert (=> d!17881 (= (valid!293 (v!2546 (underlying!263 thiss!992))) e!49262)))

(declare-fun b!75387 () Bool)

(declare-fun res!39763 () Bool)

(assert (=> b!75387 (=> (not res!39763) (not e!49262))))

(assert (=> b!75387 (= res!39763 (= (arrayCountValidKeys!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000000 (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))) (_size!400 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun b!75388 () Bool)

(declare-fun res!39764 () Bool)

(assert (=> b!75388 (=> (not res!39764) (not e!49262))))

(assert (=> b!75388 (= res!39764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun b!75389 () Bool)

(assert (=> b!75389 (= e!49262 (arrayNoDuplicates!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000000 Nil!1480))))

(assert (= (and d!17881 res!39762) b!75387))

(assert (= (and b!75387 res!39763) b!75388))

(assert (= (and b!75388 res!39764) b!75389))

(declare-fun m!74915 () Bool)

(assert (=> d!17881 m!74915))

(declare-fun m!74917 () Bool)

(assert (=> b!75387 m!74917))

(assert (=> b!75388 m!74605))

(declare-fun m!74919 () Bool)

(assert (=> b!75389 m!74919))

(assert (=> d!17841 d!17881))

(declare-fun d!17883 () Bool)

(assert (=> d!17883 (= (map!1155 (_2!1076 lt!34059)) (getCurrentListMap!424 (_keys!3890 (_2!1076 lt!34059)) (_values!2217 (_2!1076 lt!34059)) (mask!6211 (_2!1076 lt!34059)) (extraKeys!2089 (_2!1076 lt!34059)) (zeroValue!2134 (_2!1076 lt!34059)) (minValue!2134 (_2!1076 lt!34059)) #b00000000000000000000000000000000 (defaultEntry!2234 (_2!1076 lt!34059))))))

(declare-fun bs!3238 () Bool)

(assert (= bs!3238 d!17883))

(declare-fun m!74921 () Bool)

(assert (=> bs!3238 m!74921))

(assert (=> bm!6738 d!17883))

(declare-fun d!17885 () Bool)

(assert (=> d!17885 (= (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75209 d!17885))

(assert (=> b!75176 d!17877))

(declare-fun d!17887 () Bool)

(assert (=> d!17887 (= (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) (and (not (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75372 d!17887))

(declare-fun d!17889 () Bool)

(declare-fun e!49264 () Bool)

(assert (=> d!17889 e!49264))

(declare-fun res!39765 () Bool)

(assert (=> d!17889 (=> res!39765 e!49264)))

(declare-fun lt!34083 () Bool)

(assert (=> d!17889 (= res!39765 (not lt!34083))))

(declare-fun lt!34080 () Bool)

(assert (=> d!17889 (= lt!34083 lt!34080)))

(declare-fun lt!34081 () Unit!2157)

(declare-fun e!49263 () Unit!2157)

(assert (=> d!17889 (= lt!34081 e!49263)))

(declare-fun c!11428 () Bool)

(assert (=> d!17889 (= c!11428 lt!34080)))

(assert (=> d!17889 (= lt!34080 (containsKey!138 (toList!727 lt!33914) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17889 (= (contains!727 lt!33914 #b0000000000000000000000000000000000000000000000000000000000000000) lt!34083)))

(declare-fun b!75390 () Bool)

(declare-fun lt!34082 () Unit!2157)

(assert (=> b!75390 (= e!49263 lt!34082)))

(assert (=> b!75390 (= lt!34082 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 lt!33914) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75390 (isDefined!87 (getValueByKey!134 (toList!727 lt!33914) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75391 () Bool)

(declare-fun Unit!2170 () Unit!2157)

(assert (=> b!75391 (= e!49263 Unit!2170)))

(declare-fun b!75392 () Bool)

(assert (=> b!75392 (= e!49264 (isDefined!87 (getValueByKey!134 (toList!727 lt!33914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17889 c!11428) b!75390))

(assert (= (and d!17889 (not c!11428)) b!75391))

(assert (= (and d!17889 (not res!39765)) b!75392))

(declare-fun m!74923 () Bool)

(assert (=> d!17889 m!74923))

(declare-fun m!74925 () Bool)

(assert (=> b!75390 m!74925))

(declare-fun m!74927 () Bool)

(assert (=> b!75390 m!74927))

(assert (=> b!75390 m!74927))

(declare-fun m!74929 () Bool)

(assert (=> b!75390 m!74929))

(assert (=> b!75392 m!74927))

(assert (=> b!75392 m!74927))

(assert (=> b!75392 m!74929))

(assert (=> bm!6661 d!17889))

(declare-fun d!17891 () Bool)

(declare-fun res!39766 () Bool)

(declare-fun e!49265 () Bool)

(assert (=> d!17891 (=> (not res!39766) (not e!49265))))

(assert (=> d!17891 (= res!39766 (simpleValid!52 (_2!1076 lt!34059)))))

(assert (=> d!17891 (= (valid!293 (_2!1076 lt!34059)) e!49265)))

(declare-fun b!75393 () Bool)

(declare-fun res!39767 () Bool)

(assert (=> b!75393 (=> (not res!39767) (not e!49265))))

(assert (=> b!75393 (= res!39767 (= (arrayCountValidKeys!0 (_keys!3890 (_2!1076 lt!34059)) #b00000000000000000000000000000000 (size!2104 (_keys!3890 (_2!1076 lt!34059)))) (_size!400 (_2!1076 lt!34059))))))

(declare-fun b!75394 () Bool)

(declare-fun res!39768 () Bool)

(assert (=> b!75394 (=> (not res!39768) (not e!49265))))

(assert (=> b!75394 (= res!39768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3890 (_2!1076 lt!34059)) (mask!6211 (_2!1076 lt!34059))))))

(declare-fun b!75395 () Bool)

(assert (=> b!75395 (= e!49265 (arrayNoDuplicates!0 (_keys!3890 (_2!1076 lt!34059)) #b00000000000000000000000000000000 Nil!1480))))

(assert (= (and d!17891 res!39766) b!75393))

(assert (= (and b!75393 res!39767) b!75394))

(assert (= (and b!75394 res!39768) b!75395))

(declare-fun m!74931 () Bool)

(assert (=> d!17891 m!74931))

(declare-fun m!74933 () Bool)

(assert (=> b!75393 m!74933))

(declare-fun m!74935 () Bool)

(assert (=> b!75394 m!74935))

(declare-fun m!74937 () Bool)

(assert (=> b!75395 m!74937))

(assert (=> d!17865 d!17891))

(assert (=> d!17865 d!17843))

(declare-fun d!17893 () Bool)

(declare-fun lt!34086 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!79 (List!1482) (InoxSet tuple2!2132))

(assert (=> d!17893 (= lt!34086 (select (content!79 (toList!727 lt!33958)) lt!33803))))

(declare-fun e!49270 () Bool)

(assert (=> d!17893 (= lt!34086 e!49270)))

(declare-fun res!39774 () Bool)

(assert (=> d!17893 (=> (not res!39774) (not e!49270))))

(assert (=> d!17893 (= res!39774 ((_ is Cons!1478) (toList!727 lt!33958)))))

(assert (=> d!17893 (= (contains!729 (toList!727 lt!33958) lt!33803) lt!34086)))

(declare-fun b!75400 () Bool)

(declare-fun e!49271 () Bool)

(assert (=> b!75400 (= e!49270 e!49271)))

(declare-fun res!39773 () Bool)

(assert (=> b!75400 (=> res!39773 e!49271)))

(assert (=> b!75400 (= res!39773 (= (h!2066 (toList!727 lt!33958)) lt!33803))))

(declare-fun b!75401 () Bool)

(assert (=> b!75401 (= e!49271 (contains!729 (t!5060 (toList!727 lt!33958)) lt!33803))))

(assert (= (and d!17893 res!39774) b!75400))

(assert (= (and b!75400 (not res!39773)) b!75401))

(declare-fun m!74939 () Bool)

(assert (=> d!17893 m!74939))

(declare-fun m!74941 () Bool)

(assert (=> d!17893 m!74941))

(declare-fun m!74943 () Bool)

(assert (=> b!75401 m!74943))

(assert (=> b!75199 d!17893))

(declare-fun d!17895 () Bool)

(declare-fun res!39775 () Bool)

(declare-fun e!49272 () Bool)

(assert (=> d!17895 (=> res!39775 e!49272)))

(assert (=> d!17895 (= res!39775 (= (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (=> d!17895 (= (arrayContainsKey!0 (_keys!3890 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b00000000000000000000000000000000) e!49272)))

(declare-fun b!75402 () Bool)

(declare-fun e!49273 () Bool)

(assert (=> b!75402 (= e!49272 e!49273)))

(declare-fun res!39776 () Bool)

(assert (=> b!75402 (=> (not res!39776) (not e!49273))))

(assert (=> b!75402 (= res!39776 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2104 (_keys!3890 newMap!16))))))

(declare-fun b!75403 () Bool)

(assert (=> b!75403 (= e!49273 (arrayContainsKey!0 (_keys!3890 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!17895 (not res!39775)) b!75402))

(assert (= (and b!75402 res!39776) b!75403))

(declare-fun m!74945 () Bool)

(assert (=> d!17895 m!74945))

(assert (=> b!75403 m!74557))

(declare-fun m!74947 () Bool)

(assert (=> b!75403 m!74947))

(assert (=> bm!6723 d!17895))

(declare-fun d!17897 () Bool)

(declare-fun e!49275 () Bool)

(assert (=> d!17897 e!49275))

(declare-fun res!39777 () Bool)

(assert (=> d!17897 (=> res!39777 e!49275)))

(declare-fun lt!34090 () Bool)

(assert (=> d!17897 (= res!39777 (not lt!34090))))

(declare-fun lt!34087 () Bool)

(assert (=> d!17897 (= lt!34090 lt!34087)))

(declare-fun lt!34088 () Unit!2157)

(declare-fun e!49274 () Unit!2157)

(assert (=> d!17897 (= lt!34088 e!49274)))

(declare-fun c!11429 () Bool)

(assert (=> d!17897 (= c!11429 lt!34087)))

(assert (=> d!17897 (= lt!34087 (containsKey!138 (toList!727 lt!33937) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17897 (= (contains!727 lt!33937 #b1000000000000000000000000000000000000000000000000000000000000000) lt!34090)))

(declare-fun b!75404 () Bool)

(declare-fun lt!34089 () Unit!2157)

(assert (=> b!75404 (= e!49274 lt!34089)))

(assert (=> b!75404 (= lt!34089 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 lt!33937) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75404 (isDefined!87 (getValueByKey!134 (toList!727 lt!33937) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75405 () Bool)

(declare-fun Unit!2171 () Unit!2157)

(assert (=> b!75405 (= e!49274 Unit!2171)))

(declare-fun b!75406 () Bool)

(assert (=> b!75406 (= e!49275 (isDefined!87 (getValueByKey!134 (toList!727 lt!33937) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17897 c!11429) b!75404))

(assert (= (and d!17897 (not c!11429)) b!75405))

(assert (= (and d!17897 (not res!39777)) b!75406))

(declare-fun m!74949 () Bool)

(assert (=> d!17897 m!74949))

(declare-fun m!74951 () Bool)

(assert (=> b!75404 m!74951))

(declare-fun m!74953 () Bool)

(assert (=> b!75404 m!74953))

(assert (=> b!75404 m!74953))

(declare-fun m!74955 () Bool)

(assert (=> b!75404 m!74955))

(assert (=> b!75406 m!74953))

(assert (=> b!75406 m!74953))

(assert (=> b!75406 m!74955))

(assert (=> b!75178 d!17897))

(declare-fun d!17899 () Bool)

(declare-fun lt!34093 () Bool)

(declare-fun content!80 (List!1483) (InoxSet (_ BitVec 64)))

(assert (=> d!17899 (= lt!34093 (select (content!80 Nil!1480) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun e!49281 () Bool)

(assert (=> d!17899 (= lt!34093 e!49281)))

(declare-fun res!39783 () Bool)

(assert (=> d!17899 (=> (not res!39783) (not e!49281))))

(assert (=> d!17899 (= res!39783 ((_ is Cons!1479) Nil!1480))))

(assert (=> d!17899 (= (contains!730 Nil!1480 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) lt!34093)))

(declare-fun b!75411 () Bool)

(declare-fun e!49280 () Bool)

(assert (=> b!75411 (= e!49281 e!49280)))

(declare-fun res!39782 () Bool)

(assert (=> b!75411 (=> res!39782 e!49280)))

(assert (=> b!75411 (= res!39782 (= (h!2067 Nil!1480) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun b!75412 () Bool)

(assert (=> b!75412 (= e!49280 (contains!730 (t!5061 Nil!1480) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (= (and d!17899 res!39783) b!75411))

(assert (= (and b!75411 (not res!39782)) b!75412))

(declare-fun m!74957 () Bool)

(assert (=> d!17899 m!74957))

(assert (=> d!17899 m!74557))

(declare-fun m!74959 () Bool)

(assert (=> d!17899 m!74959))

(assert (=> b!75412 m!74557))

(declare-fun m!74961 () Bool)

(assert (=> b!75412 m!74961))

(assert (=> b!75373 d!17899))

(declare-fun d!17901 () Bool)

(declare-fun res!39784 () Bool)

(declare-fun e!49282 () Bool)

(assert (=> d!17901 (=> res!39784 e!49282)))

(assert (=> d!17901 (= res!39784 (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (=> d!17901 (= (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!49282)))

(declare-fun b!75413 () Bool)

(declare-fun e!49283 () Bool)

(assert (=> b!75413 (= e!49282 e!49283)))

(declare-fun res!39785 () Bool)

(assert (=> b!75413 (=> (not res!39785) (not e!49283))))

(assert (=> b!75413 (= res!39785 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun b!75414 () Bool)

(assert (=> b!75414 (= e!49283 (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!17901 (not res!39784)) b!75413))

(assert (= (and b!75413 res!39785) b!75414))

(declare-fun m!74963 () Bool)

(assert (=> d!17901 m!74963))

(assert (=> b!75414 m!74557))

(declare-fun m!74965 () Bool)

(assert (=> b!75414 m!74965))

(assert (=> b!75352 d!17901))

(declare-fun d!17903 () Bool)

(declare-fun e!49285 () Bool)

(assert (=> d!17903 e!49285))

(declare-fun res!39786 () Bool)

(assert (=> d!17903 (=> res!39786 e!49285)))

(declare-fun lt!34097 () Bool)

(assert (=> d!17903 (= res!39786 (not lt!34097))))

(declare-fun lt!34094 () Bool)

(assert (=> d!17903 (= lt!34097 lt!34094)))

(declare-fun lt!34095 () Unit!2157)

(declare-fun e!49284 () Unit!2157)

(assert (=> d!17903 (= lt!34095 e!49284)))

(declare-fun c!11430 () Bool)

(assert (=> d!17903 (= c!11430 lt!34094)))

(assert (=> d!17903 (= lt!34094 (containsKey!138 (toList!727 lt!33946) (_1!1077 lt!33813)))))

(assert (=> d!17903 (= (contains!727 lt!33946 (_1!1077 lt!33813)) lt!34097)))

(declare-fun b!75415 () Bool)

(declare-fun lt!34096 () Unit!2157)

(assert (=> b!75415 (= e!49284 lt!34096)))

(assert (=> b!75415 (= lt!34096 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 lt!33946) (_1!1077 lt!33813)))))

(assert (=> b!75415 (isDefined!87 (getValueByKey!134 (toList!727 lt!33946) (_1!1077 lt!33813)))))

(declare-fun b!75416 () Bool)

(declare-fun Unit!2172 () Unit!2157)

(assert (=> b!75416 (= e!49284 Unit!2172)))

(declare-fun b!75417 () Bool)

(assert (=> b!75417 (= e!49285 (isDefined!87 (getValueByKey!134 (toList!727 lt!33946) (_1!1077 lt!33813))))))

(assert (= (and d!17903 c!11430) b!75415))

(assert (= (and d!17903 (not c!11430)) b!75416))

(assert (= (and d!17903 (not res!39786)) b!75417))

(declare-fun m!74967 () Bool)

(assert (=> d!17903 m!74967))

(declare-fun m!74969 () Bool)

(assert (=> b!75415 m!74969))

(assert (=> b!75415 m!74761))

(assert (=> b!75415 m!74761))

(declare-fun m!74971 () Bool)

(assert (=> b!75415 m!74971))

(assert (=> b!75417 m!74761))

(assert (=> b!75417 m!74761))

(assert (=> b!75417 m!74971))

(assert (=> d!17847 d!17903))

(declare-fun b!75428 () Bool)

(declare-fun e!49291 () Option!140)

(assert (=> b!75428 (= e!49291 (getValueByKey!134 (t!5060 lt!33948) (_1!1077 lt!33813)))))

(declare-fun d!17905 () Bool)

(declare-fun c!11435 () Bool)

(assert (=> d!17905 (= c!11435 (and ((_ is Cons!1478) lt!33948) (= (_1!1077 (h!2066 lt!33948)) (_1!1077 lt!33813))))))

(declare-fun e!49290 () Option!140)

(assert (=> d!17905 (= (getValueByKey!134 lt!33948 (_1!1077 lt!33813)) e!49290)))

(declare-fun b!75427 () Bool)

(assert (=> b!75427 (= e!49290 e!49291)))

(declare-fun c!11436 () Bool)

(assert (=> b!75427 (= c!11436 (and ((_ is Cons!1478) lt!33948) (not (= (_1!1077 (h!2066 lt!33948)) (_1!1077 lt!33813)))))))

(declare-fun b!75426 () Bool)

(assert (=> b!75426 (= e!49290 (Some!139 (_2!1077 (h!2066 lt!33948))))))

(declare-fun b!75429 () Bool)

(assert (=> b!75429 (= e!49291 None!138)))

(assert (= (and d!17905 c!11435) b!75426))

(assert (= (and d!17905 (not c!11435)) b!75427))

(assert (= (and b!75427 c!11436) b!75428))

(assert (= (and b!75427 (not c!11436)) b!75429))

(declare-fun m!74973 () Bool)

(assert (=> b!75428 m!74973))

(assert (=> d!17847 d!17905))

(declare-fun d!17907 () Bool)

(assert (=> d!17907 (= (getValueByKey!134 lt!33948 (_1!1077 lt!33813)) (Some!139 (_2!1077 lt!33813)))))

(declare-fun lt!34100 () Unit!2157)

(declare-fun choose!427 (List!1482 (_ BitVec 64) V!2955) Unit!2157)

(assert (=> d!17907 (= lt!34100 (choose!427 lt!33948 (_1!1077 lt!33813) (_2!1077 lt!33813)))))

(declare-fun e!49294 () Bool)

(assert (=> d!17907 e!49294))

(declare-fun res!39791 () Bool)

(assert (=> d!17907 (=> (not res!39791) (not e!49294))))

(declare-fun isStrictlySorted!293 (List!1482) Bool)

(assert (=> d!17907 (= res!39791 (isStrictlySorted!293 lt!33948))))

(assert (=> d!17907 (= (lemmaContainsTupThenGetReturnValue!51 lt!33948 (_1!1077 lt!33813) (_2!1077 lt!33813)) lt!34100)))

(declare-fun b!75434 () Bool)

(declare-fun res!39792 () Bool)

(assert (=> b!75434 (=> (not res!39792) (not e!49294))))

(assert (=> b!75434 (= res!39792 (containsKey!138 lt!33948 (_1!1077 lt!33813)))))

(declare-fun b!75435 () Bool)

(assert (=> b!75435 (= e!49294 (contains!729 lt!33948 (tuple2!2133 (_1!1077 lt!33813) (_2!1077 lt!33813))))))

(assert (= (and d!17907 res!39791) b!75434))

(assert (= (and b!75434 res!39792) b!75435))

(assert (=> d!17907 m!74755))

(declare-fun m!74975 () Bool)

(assert (=> d!17907 m!74975))

(declare-fun m!74977 () Bool)

(assert (=> d!17907 m!74977))

(declare-fun m!74979 () Bool)

(assert (=> b!75434 m!74979))

(declare-fun m!74981 () Bool)

(assert (=> b!75435 m!74981))

(assert (=> d!17847 d!17907))

(declare-fun b!75456 () Bool)

(declare-fun e!49308 () List!1482)

(declare-fun call!6753 () List!1482)

(assert (=> b!75456 (= e!49308 call!6753)))

(declare-fun b!75457 () Bool)

(declare-fun e!49305 () List!1482)

(declare-fun call!6752 () List!1482)

(assert (=> b!75457 (= e!49305 call!6752)))

(declare-fun b!75458 () Bool)

(assert (=> b!75458 (= e!49308 call!6753)))

(declare-fun b!75459 () Bool)

(declare-fun e!49309 () List!1482)

(declare-fun call!6754 () List!1482)

(assert (=> b!75459 (= e!49309 call!6754)))

(declare-fun b!75460 () Bool)

(declare-fun e!49307 () List!1482)

(assert (=> b!75460 (= e!49307 (insertStrictlySorted!54 (t!5060 (toList!727 (+!96 lt!33809 lt!33803))) (_1!1077 lt!33813) (_2!1077 lt!33813)))))

(declare-fun b!75461 () Bool)

(declare-fun e!49306 () Bool)

(declare-fun lt!34103 () List!1482)

(assert (=> b!75461 (= e!49306 (contains!729 lt!34103 (tuple2!2133 (_1!1077 lt!33813) (_2!1077 lt!33813))))))

(declare-fun b!75462 () Bool)

(assert (=> b!75462 (= e!49309 e!49305)))

(declare-fun c!11448 () Bool)

(assert (=> b!75462 (= c!11448 (and ((_ is Cons!1478) (toList!727 (+!96 lt!33809 lt!33803))) (= (_1!1077 (h!2066 (toList!727 (+!96 lt!33809 lt!33803)))) (_1!1077 lt!33813))))))

(declare-fun bm!6749 () Bool)

(assert (=> bm!6749 (= call!6753 call!6752)))

(declare-fun c!11445 () Bool)

(declare-fun b!75463 () Bool)

(assert (=> b!75463 (= c!11445 (and ((_ is Cons!1478) (toList!727 (+!96 lt!33809 lt!33803))) (bvsgt (_1!1077 (h!2066 (toList!727 (+!96 lt!33809 lt!33803)))) (_1!1077 lt!33813))))))

(assert (=> b!75463 (= e!49305 e!49308)))

(declare-fun b!75465 () Bool)

(declare-fun res!39797 () Bool)

(assert (=> b!75465 (=> (not res!39797) (not e!49306))))

(assert (=> b!75465 (= res!39797 (containsKey!138 lt!34103 (_1!1077 lt!33813)))))

(declare-fun c!11446 () Bool)

(declare-fun bm!6750 () Bool)

(declare-fun $colon$colon!67 (List!1482 tuple2!2132) List!1482)

(assert (=> bm!6750 (= call!6754 ($colon$colon!67 e!49307 (ite c!11446 (h!2066 (toList!727 (+!96 lt!33809 lt!33803))) (tuple2!2133 (_1!1077 lt!33813) (_2!1077 lt!33813)))))))

(declare-fun c!11447 () Bool)

(assert (=> bm!6750 (= c!11447 c!11446)))

(declare-fun bm!6751 () Bool)

(assert (=> bm!6751 (= call!6752 call!6754)))

(declare-fun b!75464 () Bool)

(assert (=> b!75464 (= e!49307 (ite c!11448 (t!5060 (toList!727 (+!96 lt!33809 lt!33803))) (ite c!11445 (Cons!1478 (h!2066 (toList!727 (+!96 lt!33809 lt!33803))) (t!5060 (toList!727 (+!96 lt!33809 lt!33803)))) Nil!1479)))))

(declare-fun d!17909 () Bool)

(assert (=> d!17909 e!49306))

(declare-fun res!39798 () Bool)

(assert (=> d!17909 (=> (not res!39798) (not e!49306))))

(assert (=> d!17909 (= res!39798 (isStrictlySorted!293 lt!34103))))

(assert (=> d!17909 (= lt!34103 e!49309)))

(assert (=> d!17909 (= c!11446 (and ((_ is Cons!1478) (toList!727 (+!96 lt!33809 lt!33803))) (bvslt (_1!1077 (h!2066 (toList!727 (+!96 lt!33809 lt!33803)))) (_1!1077 lt!33813))))))

(assert (=> d!17909 (isStrictlySorted!293 (toList!727 (+!96 lt!33809 lt!33803)))))

(assert (=> d!17909 (= (insertStrictlySorted!54 (toList!727 (+!96 lt!33809 lt!33803)) (_1!1077 lt!33813) (_2!1077 lt!33813)) lt!34103)))

(assert (= (and d!17909 c!11446) b!75459))

(assert (= (and d!17909 (not c!11446)) b!75462))

(assert (= (and b!75462 c!11448) b!75457))

(assert (= (and b!75462 (not c!11448)) b!75463))

(assert (= (and b!75463 c!11445) b!75456))

(assert (= (and b!75463 (not c!11445)) b!75458))

(assert (= (or b!75456 b!75458) bm!6749))

(assert (= (or b!75457 bm!6749) bm!6751))

(assert (= (or b!75459 bm!6751) bm!6750))

(assert (= (and bm!6750 c!11447) b!75460))

(assert (= (and bm!6750 (not c!11447)) b!75464))

(assert (= (and d!17909 res!39798) b!75465))

(assert (= (and b!75465 res!39797) b!75461))

(declare-fun m!74983 () Bool)

(assert (=> b!75460 m!74983))

(declare-fun m!74985 () Bool)

(assert (=> b!75461 m!74985))

(declare-fun m!74987 () Bool)

(assert (=> b!75465 m!74987))

(declare-fun m!74989 () Bool)

(assert (=> d!17909 m!74989))

(declare-fun m!74991 () Bool)

(assert (=> d!17909 m!74991))

(declare-fun m!74993 () Bool)

(assert (=> bm!6750 m!74993))

(assert (=> d!17847 d!17909))

(declare-fun d!17911 () Bool)

(declare-fun e!49311 () Bool)

(assert (=> d!17911 e!49311))

(declare-fun res!39799 () Bool)

(assert (=> d!17911 (=> res!39799 e!49311)))

(declare-fun lt!34107 () Bool)

(assert (=> d!17911 (= res!39799 (not lt!34107))))

(declare-fun lt!34104 () Bool)

(assert (=> d!17911 (= lt!34107 lt!34104)))

(declare-fun lt!34105 () Unit!2157)

(declare-fun e!49310 () Unit!2157)

(assert (=> d!17911 (= lt!34105 e!49310)))

(declare-fun c!11449 () Bool)

(assert (=> d!17911 (= c!11449 lt!34104)))

(assert (=> d!17911 (= lt!34104 (containsKey!138 (toList!727 lt!33914) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!17911 (= (contains!727 lt!33914 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!34107)))

(declare-fun b!75466 () Bool)

(declare-fun lt!34106 () Unit!2157)

(assert (=> b!75466 (= e!49310 lt!34106)))

(assert (=> b!75466 (= lt!34106 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 lt!33914) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75466 (isDefined!87 (getValueByKey!134 (toList!727 lt!33914) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!75467 () Bool)

(declare-fun Unit!2173 () Unit!2157)

(assert (=> b!75467 (= e!49310 Unit!2173)))

(declare-fun b!75468 () Bool)

(assert (=> b!75468 (= e!49311 (isDefined!87 (getValueByKey!134 (toList!727 lt!33914) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!17911 c!11449) b!75466))

(assert (= (and d!17911 (not c!11449)) b!75467))

(assert (= (and d!17911 (not res!39799)) b!75468))

(assert (=> d!17911 m!74673))

(declare-fun m!74995 () Bool)

(assert (=> d!17911 m!74995))

(assert (=> b!75466 m!74673))

(declare-fun m!74997 () Bool)

(assert (=> b!75466 m!74997))

(assert (=> b!75466 m!74673))

(declare-fun m!74999 () Bool)

(assert (=> b!75466 m!74999))

(assert (=> b!75466 m!74999))

(declare-fun m!75001 () Bool)

(assert (=> b!75466 m!75001))

(assert (=> b!75468 m!74673))

(assert (=> b!75468 m!74999))

(assert (=> b!75468 m!74999))

(assert (=> b!75468 m!75001))

(assert (=> b!75126 d!17911))

(declare-fun b!75469 () Bool)

(declare-fun e!49312 () Bool)

(assert (=> b!75469 (= e!49312 (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!75469 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!75470 () Bool)

(declare-fun e!49316 () ListLongMap!1423)

(declare-fun e!49314 () ListLongMap!1423)

(assert (=> b!75470 (= e!49316 e!49314)))

(declare-fun c!11453 () Bool)

(assert (=> b!75470 (= c!11453 (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!75471 () Bool)

(declare-fun res!39802 () Bool)

(declare-fun e!49318 () Bool)

(assert (=> b!75471 (=> (not res!39802) (not e!49318))))

(declare-fun lt!34114 () ListLongMap!1423)

(assert (=> b!75471 (= res!39802 (not (contains!727 lt!34114 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!75472 () Bool)

(declare-fun e!49315 () Bool)

(declare-fun e!49313 () Bool)

(assert (=> b!75472 (= e!49315 e!49313)))

(declare-fun c!11452 () Bool)

(assert (=> b!75472 (= c!11452 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun d!17913 () Bool)

(assert (=> d!17913 e!49318))

(declare-fun res!39801 () Bool)

(assert (=> d!17913 (=> (not res!39801) (not e!49318))))

(assert (=> d!17913 (= res!39801 (not (contains!727 lt!34114 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17913 (= lt!34114 e!49316)))

(declare-fun c!11450 () Bool)

(assert (=> d!17913 (= c!11450 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(assert (=> d!17913 (validMask!0 (mask!6211 (v!2546 (underlying!263 thiss!992))))))

(assert (=> d!17913 (= (getCurrentListMapNoExtraKeys!61 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))) lt!34114)))

(declare-fun bm!6752 () Bool)

(declare-fun call!6755 () ListLongMap!1423)

(assert (=> bm!6752 (= call!6755 (getCurrentListMapNoExtraKeys!61 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun b!75473 () Bool)

(assert (=> b!75473 (= e!49313 (isEmpty!319 lt!34114))))

(declare-fun b!75474 () Bool)

(assert (=> b!75474 (= e!49313 (= lt!34114 (getCurrentListMapNoExtraKeys!61 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun b!75475 () Bool)

(assert (=> b!75475 (= e!49316 (ListLongMap!1424 Nil!1479))))

(declare-fun b!75476 () Bool)

(assert (=> b!75476 (= e!49314 call!6755)))

(declare-fun b!75477 () Bool)

(assert (=> b!75477 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(assert (=> b!75477 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2105 (_values!2217 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun e!49317 () Bool)

(assert (=> b!75477 (= e!49317 (= (apply!76 lt!34114 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!75478 () Bool)

(declare-fun lt!34108 () Unit!2157)

(declare-fun lt!34113 () Unit!2157)

(assert (=> b!75478 (= lt!34108 lt!34113)))

(declare-fun lt!34109 () (_ BitVec 64))

(declare-fun lt!34110 () V!2955)

(declare-fun lt!34111 () (_ BitVec 64))

(declare-fun lt!34112 () ListLongMap!1423)

(assert (=> b!75478 (not (contains!727 (+!96 lt!34112 (tuple2!2133 lt!34111 lt!34110)) lt!34109))))

(assert (=> b!75478 (= lt!34113 (addStillNotContains!25 lt!34112 lt!34111 lt!34110 lt!34109))))

(assert (=> b!75478 (= lt!34109 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!75478 (= lt!34110 (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75478 (= lt!34111 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!75478 (= lt!34112 call!6755)))

(assert (=> b!75478 (= e!49314 (+!96 call!6755 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!75479 () Bool)

(assert (=> b!75479 (= e!49315 e!49317)))

(assert (=> b!75479 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun res!39803 () Bool)

(assert (=> b!75479 (= res!39803 (contains!727 lt!34114 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!75479 (=> (not res!39803) (not e!49317))))

(declare-fun b!75480 () Bool)

(assert (=> b!75480 (= e!49318 e!49315)))

(declare-fun c!11451 () Bool)

(assert (=> b!75480 (= c!11451 e!49312)))

(declare-fun res!39800 () Bool)

(assert (=> b!75480 (=> (not res!39800) (not e!49312))))

(assert (=> b!75480 (= res!39800 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(assert (= (and d!17913 c!11450) b!75475))

(assert (= (and d!17913 (not c!11450)) b!75470))

(assert (= (and b!75470 c!11453) b!75478))

(assert (= (and b!75470 (not c!11453)) b!75476))

(assert (= (or b!75478 b!75476) bm!6752))

(assert (= (and d!17913 res!39801) b!75471))

(assert (= (and b!75471 res!39802) b!75480))

(assert (= (and b!75480 res!39800) b!75469))

(assert (= (and b!75480 c!11451) b!75479))

(assert (= (and b!75480 (not c!11451)) b!75472))

(assert (= (and b!75479 res!39803) b!75477))

(assert (= (and b!75472 c!11452) b!75474))

(assert (= (and b!75472 (not c!11452)) b!75473))

(declare-fun b_lambda!3391 () Bool)

(assert (=> (not b_lambda!3391) (not b!75477)))

(assert (=> b!75477 t!5057))

(declare-fun b_and!4619 () Bool)

(assert (= b_and!4615 (and (=> t!5057 result!2707) b_and!4619)))

(assert (=> b!75477 t!5059))

(declare-fun b_and!4621 () Bool)

(assert (= b_and!4617 (and (=> t!5059 result!2711) b_and!4621)))

(declare-fun b_lambda!3393 () Bool)

(assert (=> (not b_lambda!3393) (not b!75478)))

(assert (=> b!75478 t!5057))

(declare-fun b_and!4623 () Bool)

(assert (= b_and!4619 (and (=> t!5057 result!2707) b_and!4623)))

(assert (=> b!75478 t!5059))

(declare-fun b_and!4625 () Bool)

(assert (= b_and!4621 (and (=> t!5059 result!2711) b_and!4625)))

(declare-fun m!75003 () Bool)

(assert (=> b!75471 m!75003))

(declare-fun m!75005 () Bool)

(assert (=> d!17913 m!75005))

(assert (=> d!17913 m!74567))

(declare-fun m!75007 () Bool)

(assert (=> b!75474 m!75007))

(assert (=> b!75477 m!74585))

(declare-fun m!75009 () Bool)

(assert (=> b!75477 m!75009))

(assert (=> b!75477 m!75009))

(assert (=> b!75477 m!74585))

(declare-fun m!75011 () Bool)

(assert (=> b!75477 m!75011))

(assert (=> b!75477 m!74963))

(assert (=> b!75477 m!74963))

(declare-fun m!75013 () Bool)

(assert (=> b!75477 m!75013))

(declare-fun m!75015 () Bool)

(assert (=> b!75473 m!75015))

(assert (=> bm!6752 m!75007))

(assert (=> b!75478 m!74585))

(assert (=> b!75478 m!75009))

(declare-fun m!75017 () Bool)

(assert (=> b!75478 m!75017))

(declare-fun m!75019 () Bool)

(assert (=> b!75478 m!75019))

(assert (=> b!75478 m!75009))

(assert (=> b!75478 m!74585))

(assert (=> b!75478 m!75011))

(assert (=> b!75478 m!74963))

(assert (=> b!75478 m!75017))

(declare-fun m!75021 () Bool)

(assert (=> b!75478 m!75021))

(declare-fun m!75023 () Bool)

(assert (=> b!75478 m!75023))

(assert (=> b!75470 m!74963))

(assert (=> b!75470 m!74963))

(declare-fun m!75025 () Bool)

(assert (=> b!75470 m!75025))

(assert (=> b!75469 m!74963))

(assert (=> b!75469 m!74963))

(assert (=> b!75469 m!75025))

(assert (=> b!75479 m!74963))

(assert (=> b!75479 m!74963))

(declare-fun m!75027 () Bool)

(assert (=> b!75479 m!75027))

(assert (=> bm!6664 d!17913))

(declare-fun d!17915 () Bool)

(declare-fun e!49319 () Bool)

(assert (=> d!17915 e!49319))

(declare-fun res!39804 () Bool)

(assert (=> d!17915 (=> (not res!39804) (not e!49319))))

(declare-fun lt!34115 () ListLongMap!1423)

(assert (=> d!17915 (= res!39804 (contains!727 lt!34115 (_1!1077 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(declare-fun lt!34117 () List!1482)

(assert (=> d!17915 (= lt!34115 (ListLongMap!1424 lt!34117))))

(declare-fun lt!34116 () Unit!2157)

(declare-fun lt!34118 () Unit!2157)

(assert (=> d!17915 (= lt!34116 lt!34118)))

(assert (=> d!17915 (= (getValueByKey!134 lt!34117 (_1!1077 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!17915 (= lt!34118 (lemmaContainsTupThenGetReturnValue!51 lt!34117 (_1!1077 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!17915 (= lt!34117 (insertStrictlySorted!54 (toList!727 lt!33900) (_1!1077 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!17915 (= (+!96 lt!33900 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!34115)))

(declare-fun b!75481 () Bool)

(declare-fun res!39805 () Bool)

(assert (=> b!75481 (=> (not res!39805) (not e!49319))))

(assert (=> b!75481 (= res!39805 (= (getValueByKey!134 (toList!727 lt!34115) (_1!1077 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))))))))

(declare-fun b!75482 () Bool)

(assert (=> b!75482 (= e!49319 (contains!729 (toList!727 lt!34115) (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))))))

(assert (= (and d!17915 res!39804) b!75481))

(assert (= (and b!75481 res!39805) b!75482))

(declare-fun m!75029 () Bool)

(assert (=> d!17915 m!75029))

(declare-fun m!75031 () Bool)

(assert (=> d!17915 m!75031))

(declare-fun m!75033 () Bool)

(assert (=> d!17915 m!75033))

(declare-fun m!75035 () Bool)

(assert (=> d!17915 m!75035))

(declare-fun m!75037 () Bool)

(assert (=> b!75481 m!75037))

(declare-fun m!75039 () Bool)

(assert (=> b!75482 m!75039))

(assert (=> b!75128 d!17915))

(declare-fun d!17917 () Bool)

(assert (=> d!17917 (= (apply!76 (+!96 lt!33906 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!33905) (apply!76 lt!33906 lt!33905))))

(declare-fun lt!34121 () Unit!2157)

(declare-fun choose!428 (ListLongMap!1423 (_ BitVec 64) V!2955 (_ BitVec 64)) Unit!2157)

(assert (=> d!17917 (= lt!34121 (choose!428 lt!33906 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) lt!33905))))

(declare-fun e!49322 () Bool)

(assert (=> d!17917 e!49322))

(declare-fun res!39808 () Bool)

(assert (=> d!17917 (=> (not res!39808) (not e!49322))))

(assert (=> d!17917 (= res!39808 (contains!727 lt!33906 lt!33905))))

(assert (=> d!17917 (= (addApplyDifferent!52 lt!33906 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) lt!33905) lt!34121)))

(declare-fun b!75486 () Bool)

(assert (=> b!75486 (= e!49322 (not (= lt!33905 lt!33895)))))

(assert (= (and d!17917 res!39808) b!75486))

(assert (=> d!17917 m!74685))

(assert (=> d!17917 m!74699))

(declare-fun m!75041 () Bool)

(assert (=> d!17917 m!75041))

(assert (=> d!17917 m!74685))

(assert (=> d!17917 m!74687))

(declare-fun m!75043 () Bool)

(assert (=> d!17917 m!75043))

(assert (=> b!75128 d!17917))

(declare-fun d!17919 () Bool)

(declare-fun get!1150 (Option!140) V!2955)

(assert (=> d!17919 (= (apply!76 (+!96 lt!33906 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!33905) (get!1150 (getValueByKey!134 (toList!727 (+!96 lt!33906 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) lt!33905)))))

(declare-fun bs!3239 () Bool)

(assert (= bs!3239 d!17919))

(declare-fun m!75045 () Bool)

(assert (=> bs!3239 m!75045))

(assert (=> bs!3239 m!75045))

(declare-fun m!75047 () Bool)

(assert (=> bs!3239 m!75047))

(assert (=> b!75128 d!17919))

(declare-fun d!17921 () Bool)

(declare-fun e!49323 () Bool)

(assert (=> d!17921 e!49323))

(declare-fun res!39809 () Bool)

(assert (=> d!17921 (=> (not res!39809) (not e!49323))))

(declare-fun lt!34122 () ListLongMap!1423)

(assert (=> d!17921 (= res!39809 (contains!727 lt!34122 (_1!1077 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(declare-fun lt!34124 () List!1482)

(assert (=> d!17921 (= lt!34122 (ListLongMap!1424 lt!34124))))

(declare-fun lt!34123 () Unit!2157)

(declare-fun lt!34125 () Unit!2157)

(assert (=> d!17921 (= lt!34123 lt!34125)))

(assert (=> d!17921 (= (getValueByKey!134 lt!34124 (_1!1077 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!17921 (= lt!34125 (lemmaContainsTupThenGetReturnValue!51 lt!34124 (_1!1077 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!17921 (= lt!34124 (insertStrictlySorted!54 (toList!727 lt!33911) (_1!1077 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!17921 (= (+!96 lt!33911 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!34122)))

(declare-fun b!75487 () Bool)

(declare-fun res!39810 () Bool)

(assert (=> b!75487 (=> (not res!39810) (not e!49323))))

(assert (=> b!75487 (= res!39810 (= (getValueByKey!134 (toList!727 lt!34122) (_1!1077 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992))))))))))

(declare-fun b!75488 () Bool)

(assert (=> b!75488 (= e!49323 (contains!729 (toList!727 lt!34122) (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992))))))))

(assert (= (and d!17921 res!39809) b!75487))

(assert (= (and b!75487 res!39810) b!75488))

(declare-fun m!75049 () Bool)

(assert (=> d!17921 m!75049))

(declare-fun m!75051 () Bool)

(assert (=> d!17921 m!75051))

(declare-fun m!75053 () Bool)

(assert (=> d!17921 m!75053))

(declare-fun m!75055 () Bool)

(assert (=> d!17921 m!75055))

(declare-fun m!75057 () Bool)

(assert (=> b!75487 m!75057))

(declare-fun m!75059 () Bool)

(assert (=> b!75488 m!75059))

(assert (=> b!75128 d!17921))

(declare-fun d!17923 () Bool)

(assert (=> d!17923 (= (apply!76 lt!33906 lt!33905) (get!1150 (getValueByKey!134 (toList!727 lt!33906) lt!33905)))))

(declare-fun bs!3240 () Bool)

(assert (= bs!3240 d!17923))

(declare-fun m!75061 () Bool)

(assert (=> bs!3240 m!75061))

(assert (=> bs!3240 m!75061))

(declare-fun m!75063 () Bool)

(assert (=> bs!3240 m!75063))

(assert (=> b!75128 d!17923))

(declare-fun d!17925 () Bool)

(declare-fun e!49324 () Bool)

(assert (=> d!17925 e!49324))

(declare-fun res!39811 () Bool)

(assert (=> d!17925 (=> (not res!39811) (not e!49324))))

(declare-fun lt!34126 () ListLongMap!1423)

(assert (=> d!17925 (= res!39811 (contains!727 lt!34126 (_1!1077 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(declare-fun lt!34128 () List!1482)

(assert (=> d!17925 (= lt!34126 (ListLongMap!1424 lt!34128))))

(declare-fun lt!34127 () Unit!2157)

(declare-fun lt!34129 () Unit!2157)

(assert (=> d!17925 (= lt!34127 lt!34129)))

(assert (=> d!17925 (= (getValueByKey!134 lt!34128 (_1!1077 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!17925 (= lt!34129 (lemmaContainsTupThenGetReturnValue!51 lt!34128 (_1!1077 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!17925 (= lt!34128 (insertStrictlySorted!54 (toList!727 lt!33906) (_1!1077 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!17925 (= (+!96 lt!33906 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!34126)))

(declare-fun b!75489 () Bool)

(declare-fun res!39812 () Bool)

(assert (=> b!75489 (=> (not res!39812) (not e!49324))))

(assert (=> b!75489 (= res!39812 (= (getValueByKey!134 (toList!727 lt!34126) (_1!1077 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))))))))

(declare-fun b!75490 () Bool)

(assert (=> b!75490 (= e!49324 (contains!729 (toList!727 lt!34126) (tuple2!2133 lt!33895 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))))))

(assert (= (and d!17925 res!39811) b!75489))

(assert (= (and b!75489 res!39812) b!75490))

(declare-fun m!75065 () Bool)

(assert (=> d!17925 m!75065))

(declare-fun m!75067 () Bool)

(assert (=> d!17925 m!75067))

(declare-fun m!75069 () Bool)

(assert (=> d!17925 m!75069))

(declare-fun m!75071 () Bool)

(assert (=> d!17925 m!75071))

(declare-fun m!75073 () Bool)

(assert (=> b!75489 m!75073))

(declare-fun m!75075 () Bool)

(assert (=> b!75490 m!75075))

(assert (=> b!75128 d!17925))

(declare-fun d!17927 () Bool)

(assert (=> d!17927 (= (apply!76 (+!96 lt!33911 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!33907) (get!1150 (getValueByKey!134 (toList!727 (+!96 lt!33911 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))) lt!33907)))))

(declare-fun bs!3241 () Bool)

(assert (= bs!3241 d!17927))

(declare-fun m!75077 () Bool)

(assert (=> bs!3241 m!75077))

(assert (=> bs!3241 m!75077))

(declare-fun m!75079 () Bool)

(assert (=> bs!3241 m!75079))

(assert (=> b!75128 d!17927))

(declare-fun d!17929 () Bool)

(assert (=> d!17929 (= (apply!76 (+!96 lt!33898 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!33912) (apply!76 lt!33898 lt!33912))))

(declare-fun lt!34130 () Unit!2157)

(assert (=> d!17929 (= lt!34130 (choose!428 lt!33898 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992))) lt!33912))))

(declare-fun e!49325 () Bool)

(assert (=> d!17929 e!49325))

(declare-fun res!39813 () Bool)

(assert (=> d!17929 (=> (not res!39813) (not e!49325))))

(assert (=> d!17929 (= res!39813 (contains!727 lt!33898 lt!33912))))

(assert (=> d!17929 (= (addApplyDifferent!52 lt!33898 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992))) lt!33912) lt!34130)))

(declare-fun b!75491 () Bool)

(assert (=> b!75491 (= e!49325 (not (= lt!33912 lt!33916)))))

(assert (= (and d!17929 res!39813) b!75491))

(assert (=> d!17929 m!74691))

(assert (=> d!17929 m!74703))

(declare-fun m!75081 () Bool)

(assert (=> d!17929 m!75081))

(assert (=> d!17929 m!74691))

(assert (=> d!17929 m!74693))

(declare-fun m!75083 () Bool)

(assert (=> d!17929 m!75083))

(assert (=> b!75128 d!17929))

(declare-fun d!17931 () Bool)

(declare-fun e!49327 () Bool)

(assert (=> d!17931 e!49327))

(declare-fun res!39814 () Bool)

(assert (=> d!17931 (=> res!39814 e!49327)))

(declare-fun lt!34134 () Bool)

(assert (=> d!17931 (= res!39814 (not lt!34134))))

(declare-fun lt!34131 () Bool)

(assert (=> d!17931 (= lt!34134 lt!34131)))

(declare-fun lt!34132 () Unit!2157)

(declare-fun e!49326 () Unit!2157)

(assert (=> d!17931 (= lt!34132 e!49326)))

(declare-fun c!11454 () Bool)

(assert (=> d!17931 (= c!11454 lt!34131)))

(assert (=> d!17931 (= lt!34131 (containsKey!138 (toList!727 (+!96 lt!33900 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) lt!33908))))

(assert (=> d!17931 (= (contains!727 (+!96 lt!33900 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!33908) lt!34134)))

(declare-fun b!75492 () Bool)

(declare-fun lt!34133 () Unit!2157)

(assert (=> b!75492 (= e!49326 lt!34133)))

(assert (=> b!75492 (= lt!34133 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 (+!96 lt!33900 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) lt!33908))))

(assert (=> b!75492 (isDefined!87 (getValueByKey!134 (toList!727 (+!96 lt!33900 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) lt!33908))))

(declare-fun b!75493 () Bool)

(declare-fun Unit!2174 () Unit!2157)

(assert (=> b!75493 (= e!49326 Unit!2174)))

(declare-fun b!75494 () Bool)

(assert (=> b!75494 (= e!49327 (isDefined!87 (getValueByKey!134 (toList!727 (+!96 lt!33900 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) lt!33908)))))

(assert (= (and d!17931 c!11454) b!75492))

(assert (= (and d!17931 (not c!11454)) b!75493))

(assert (= (and d!17931 (not res!39814)) b!75494))

(declare-fun m!75085 () Bool)

(assert (=> d!17931 m!75085))

(declare-fun m!75087 () Bool)

(assert (=> b!75492 m!75087))

(declare-fun m!75089 () Bool)

(assert (=> b!75492 m!75089))

(assert (=> b!75492 m!75089))

(declare-fun m!75091 () Bool)

(assert (=> b!75492 m!75091))

(assert (=> b!75494 m!75089))

(assert (=> b!75494 m!75089))

(assert (=> b!75494 m!75091))

(assert (=> b!75128 d!17931))

(declare-fun d!17933 () Bool)

(assert (=> d!17933 (contains!727 (+!96 lt!33900 (tuple2!2133 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!33908)))

(declare-fun lt!34137 () Unit!2157)

(declare-fun choose!429 (ListLongMap!1423 (_ BitVec 64) V!2955 (_ BitVec 64)) Unit!2157)

(assert (=> d!17933 (= lt!34137 (choose!429 lt!33900 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) lt!33908))))

(assert (=> d!17933 (contains!727 lt!33900 lt!33908)))

(assert (=> d!17933 (= (addStillContains!52 lt!33900 lt!33899 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) lt!33908) lt!34137)))

(declare-fun bs!3242 () Bool)

(assert (= bs!3242 d!17933))

(assert (=> bs!3242 m!74701))

(assert (=> bs!3242 m!74701))

(assert (=> bs!3242 m!74705))

(declare-fun m!75093 () Bool)

(assert (=> bs!3242 m!75093))

(declare-fun m!75095 () Bool)

(assert (=> bs!3242 m!75095))

(assert (=> b!75128 d!17933))

(declare-fun d!17935 () Bool)

(assert (=> d!17935 (= (apply!76 lt!33898 lt!33912) (get!1150 (getValueByKey!134 (toList!727 lt!33898) lt!33912)))))

(declare-fun bs!3243 () Bool)

(assert (= bs!3243 d!17935))

(declare-fun m!75097 () Bool)

(assert (=> bs!3243 m!75097))

(assert (=> bs!3243 m!75097))

(declare-fun m!75099 () Bool)

(assert (=> bs!3243 m!75099))

(assert (=> b!75128 d!17935))

(declare-fun d!17937 () Bool)

(declare-fun e!49328 () Bool)

(assert (=> d!17937 e!49328))

(declare-fun res!39815 () Bool)

(assert (=> d!17937 (=> (not res!39815) (not e!49328))))

(declare-fun lt!34138 () ListLongMap!1423)

(assert (=> d!17937 (= res!39815 (contains!727 lt!34138 (_1!1077 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(declare-fun lt!34140 () List!1482)

(assert (=> d!17937 (= lt!34138 (ListLongMap!1424 lt!34140))))

(declare-fun lt!34139 () Unit!2157)

(declare-fun lt!34141 () Unit!2157)

(assert (=> d!17937 (= lt!34139 lt!34141)))

(assert (=> d!17937 (= (getValueByKey!134 lt!34140 (_1!1077 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!17937 (= lt!34141 (lemmaContainsTupThenGetReturnValue!51 lt!34140 (_1!1077 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!17937 (= lt!34140 (insertStrictlySorted!54 (toList!727 lt!33898) (_1!1077 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!17937 (= (+!96 lt!33898 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!34138)))

(declare-fun b!75496 () Bool)

(declare-fun res!39816 () Bool)

(assert (=> b!75496 (=> (not res!39816) (not e!49328))))

(assert (=> b!75496 (= res!39816 (= (getValueByKey!134 (toList!727 lt!34138) (_1!1077 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992))))))))))

(declare-fun b!75497 () Bool)

(assert (=> b!75497 (= e!49328 (contains!729 (toList!727 lt!34138) (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992))))))))

(assert (= (and d!17937 res!39815) b!75496))

(assert (= (and b!75496 res!39816) b!75497))

(declare-fun m!75101 () Bool)

(assert (=> d!17937 m!75101))

(declare-fun m!75103 () Bool)

(assert (=> d!17937 m!75103))

(declare-fun m!75105 () Bool)

(assert (=> d!17937 m!75105))

(declare-fun m!75107 () Bool)

(assert (=> d!17937 m!75107))

(declare-fun m!75109 () Bool)

(assert (=> b!75496 m!75109))

(declare-fun m!75111 () Bool)

(assert (=> b!75497 m!75111))

(assert (=> b!75128 d!17937))

(declare-fun d!17939 () Bool)

(assert (=> d!17939 (= (apply!76 (+!96 lt!33911 (tuple2!2133 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!33907) (apply!76 lt!33911 lt!33907))))

(declare-fun lt!34142 () Unit!2157)

(assert (=> d!17939 (= lt!34142 (choose!428 lt!33911 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992))) lt!33907))))

(declare-fun e!49329 () Bool)

(assert (=> d!17939 e!49329))

(declare-fun res!39817 () Bool)

(assert (=> d!17939 (=> (not res!39817) (not e!49329))))

(assert (=> d!17939 (= res!39817 (contains!727 lt!33911 lt!33907))))

(assert (=> d!17939 (= (addApplyDifferent!52 lt!33911 lt!33915 (minValue!2134 (v!2546 (underlying!263 thiss!992))) lt!33907) lt!34142)))

(declare-fun b!75498 () Bool)

(assert (=> b!75498 (= e!49329 (not (= lt!33907 lt!33915)))))

(assert (= (and d!17939 res!39817) b!75498))

(assert (=> d!17939 m!74695))

(assert (=> d!17939 m!74679))

(declare-fun m!75113 () Bool)

(assert (=> d!17939 m!75113))

(assert (=> d!17939 m!74695))

(assert (=> d!17939 m!74697))

(declare-fun m!75115 () Bool)

(assert (=> d!17939 m!75115))

(assert (=> b!75128 d!17939))

(assert (=> b!75128 d!17845))

(declare-fun d!17941 () Bool)

(assert (=> d!17941 (= (apply!76 (+!96 lt!33898 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!33912) (get!1150 (getValueByKey!134 (toList!727 (+!96 lt!33898 (tuple2!2133 lt!33916 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))) lt!33912)))))

(declare-fun bs!3244 () Bool)

(assert (= bs!3244 d!17941))

(declare-fun m!75117 () Bool)

(assert (=> bs!3244 m!75117))

(assert (=> bs!3244 m!75117))

(declare-fun m!75119 () Bool)

(assert (=> bs!3244 m!75119))

(assert (=> b!75128 d!17941))

(declare-fun d!17943 () Bool)

(assert (=> d!17943 (= (apply!76 lt!33911 lt!33907) (get!1150 (getValueByKey!134 (toList!727 lt!33911) lt!33907)))))

(declare-fun bs!3245 () Bool)

(assert (= bs!3245 d!17943))

(declare-fun m!75121 () Bool)

(assert (=> bs!3245 m!75121))

(assert (=> bs!3245 m!75121))

(declare-fun m!75123 () Bool)

(assert (=> bs!3245 m!75123))

(assert (=> b!75128 d!17943))

(declare-fun d!17945 () Bool)

(assert (=> d!17945 (= (+!96 (getCurrentListMap!424 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (getCurrentListMap!424 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) lt!34065 (zeroValue!2134 newMap!16) lt!33806 #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34145 () Unit!2157)

(declare-fun choose!430 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 V!2955 Int) Unit!2157)

(assert (=> d!17945 (= lt!34145 (choose!430 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) lt!34065 (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) lt!33806 (defaultEntry!2234 newMap!16)))))

(assert (=> d!17945 (validMask!0 (mask!6211 newMap!16))))

(assert (=> d!17945 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!25 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) lt!34065 (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) lt!33806 (defaultEntry!2234 newMap!16)) lt!34145)))

(declare-fun bs!3246 () Bool)

(assert (= bs!3246 d!17945))

(declare-fun m!75125 () Bool)

(assert (=> bs!3246 m!75125))

(declare-fun m!75127 () Bool)

(assert (=> bs!3246 m!75127))

(assert (=> bs!3246 m!74667))

(declare-fun m!75129 () Bool)

(assert (=> bs!3246 m!75129))

(declare-fun m!75131 () Bool)

(assert (=> bs!3246 m!75131))

(assert (=> bs!3246 m!74667))

(assert (=> b!75320 d!17945))

(assert (=> b!75181 d!17913))

(declare-fun d!17947 () Bool)

(declare-fun e!49331 () Bool)

(assert (=> d!17947 e!49331))

(declare-fun res!39818 () Bool)

(assert (=> d!17947 (=> res!39818 e!49331)))

(declare-fun lt!34149 () Bool)

(assert (=> d!17947 (= res!39818 (not lt!34149))))

(declare-fun lt!34146 () Bool)

(assert (=> d!17947 (= lt!34149 lt!34146)))

(declare-fun lt!34147 () Unit!2157)

(declare-fun e!49330 () Unit!2157)

(assert (=> d!17947 (= lt!34147 e!49330)))

(declare-fun c!11455 () Bool)

(assert (=> d!17947 (= c!11455 lt!34146)))

(assert (=> d!17947 (= lt!34146 (containsKey!138 (toList!727 lt!33954) (_1!1077 lt!33813)))))

(assert (=> d!17947 (= (contains!727 lt!33954 (_1!1077 lt!33813)) lt!34149)))

(declare-fun b!75499 () Bool)

(declare-fun lt!34148 () Unit!2157)

(assert (=> b!75499 (= e!49330 lt!34148)))

(assert (=> b!75499 (= lt!34148 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 lt!33954) (_1!1077 lt!33813)))))

(assert (=> b!75499 (isDefined!87 (getValueByKey!134 (toList!727 lt!33954) (_1!1077 lt!33813)))))

(declare-fun b!75500 () Bool)

(declare-fun Unit!2175 () Unit!2157)

(assert (=> b!75500 (= e!49330 Unit!2175)))

(declare-fun b!75501 () Bool)

(assert (=> b!75501 (= e!49331 (isDefined!87 (getValueByKey!134 (toList!727 lt!33954) (_1!1077 lt!33813))))))

(assert (= (and d!17947 c!11455) b!75499))

(assert (= (and d!17947 (not c!11455)) b!75500))

(assert (= (and d!17947 (not res!39818)) b!75501))

(declare-fun m!75133 () Bool)

(assert (=> d!17947 m!75133))

(declare-fun m!75135 () Bool)

(assert (=> b!75499 m!75135))

(assert (=> b!75499 m!74785))

(assert (=> b!75499 m!74785))

(declare-fun m!75137 () Bool)

(assert (=> b!75499 m!75137))

(assert (=> b!75501 m!74785))

(assert (=> b!75501 m!74785))

(assert (=> b!75501 m!75137))

(assert (=> d!17851 d!17947))

(declare-fun b!75504 () Bool)

(declare-fun e!49333 () Option!140)

(assert (=> b!75504 (= e!49333 (getValueByKey!134 (t!5060 lt!33956) (_1!1077 lt!33813)))))

(declare-fun d!17949 () Bool)

(declare-fun c!11456 () Bool)

(assert (=> d!17949 (= c!11456 (and ((_ is Cons!1478) lt!33956) (= (_1!1077 (h!2066 lt!33956)) (_1!1077 lt!33813))))))

(declare-fun e!49332 () Option!140)

(assert (=> d!17949 (= (getValueByKey!134 lt!33956 (_1!1077 lt!33813)) e!49332)))

(declare-fun b!75503 () Bool)

(assert (=> b!75503 (= e!49332 e!49333)))

(declare-fun c!11457 () Bool)

(assert (=> b!75503 (= c!11457 (and ((_ is Cons!1478) lt!33956) (not (= (_1!1077 (h!2066 lt!33956)) (_1!1077 lt!33813)))))))

(declare-fun b!75502 () Bool)

(assert (=> b!75502 (= e!49332 (Some!139 (_2!1077 (h!2066 lt!33956))))))

(declare-fun b!75505 () Bool)

(assert (=> b!75505 (= e!49333 None!138)))

(assert (= (and d!17949 c!11456) b!75502))

(assert (= (and d!17949 (not c!11456)) b!75503))

(assert (= (and b!75503 c!11457) b!75504))

(assert (= (and b!75503 (not c!11457)) b!75505))

(declare-fun m!75139 () Bool)

(assert (=> b!75504 m!75139))

(assert (=> d!17851 d!17949))

(declare-fun d!17951 () Bool)

(assert (=> d!17951 (= (getValueByKey!134 lt!33956 (_1!1077 lt!33813)) (Some!139 (_2!1077 lt!33813)))))

(declare-fun lt!34150 () Unit!2157)

(assert (=> d!17951 (= lt!34150 (choose!427 lt!33956 (_1!1077 lt!33813) (_2!1077 lt!33813)))))

(declare-fun e!49334 () Bool)

(assert (=> d!17951 e!49334))

(declare-fun res!39819 () Bool)

(assert (=> d!17951 (=> (not res!39819) (not e!49334))))

(assert (=> d!17951 (= res!39819 (isStrictlySorted!293 lt!33956))))

(assert (=> d!17951 (= (lemmaContainsTupThenGetReturnValue!51 lt!33956 (_1!1077 lt!33813) (_2!1077 lt!33813)) lt!34150)))

(declare-fun b!75506 () Bool)

(declare-fun res!39820 () Bool)

(assert (=> b!75506 (=> (not res!39820) (not e!49334))))

(assert (=> b!75506 (= res!39820 (containsKey!138 lt!33956 (_1!1077 lt!33813)))))

(declare-fun b!75507 () Bool)

(assert (=> b!75507 (= e!49334 (contains!729 lt!33956 (tuple2!2133 (_1!1077 lt!33813) (_2!1077 lt!33813))))))

(assert (= (and d!17951 res!39819) b!75506))

(assert (= (and b!75506 res!39820) b!75507))

(assert (=> d!17951 m!74779))

(declare-fun m!75141 () Bool)

(assert (=> d!17951 m!75141))

(declare-fun m!75143 () Bool)

(assert (=> d!17951 m!75143))

(declare-fun m!75145 () Bool)

(assert (=> b!75506 m!75145))

(declare-fun m!75147 () Bool)

(assert (=> b!75507 m!75147))

(assert (=> d!17851 d!17951))

(declare-fun b!75508 () Bool)

(declare-fun e!49338 () List!1482)

(declare-fun call!6757 () List!1482)

(assert (=> b!75508 (= e!49338 call!6757)))

(declare-fun b!75509 () Bool)

(declare-fun e!49335 () List!1482)

(declare-fun call!6756 () List!1482)

(assert (=> b!75509 (= e!49335 call!6756)))

(declare-fun b!75510 () Bool)

(assert (=> b!75510 (= e!49338 call!6757)))

(declare-fun b!75511 () Bool)

(declare-fun e!49339 () List!1482)

(declare-fun call!6758 () List!1482)

(assert (=> b!75511 (= e!49339 call!6758)))

(declare-fun b!75512 () Bool)

(declare-fun e!49337 () List!1482)

(assert (=> b!75512 (= e!49337 (insertStrictlySorted!54 (t!5060 (toList!727 lt!33809)) (_1!1077 lt!33813) (_2!1077 lt!33813)))))

(declare-fun b!75513 () Bool)

(declare-fun e!49336 () Bool)

(declare-fun lt!34151 () List!1482)

(assert (=> b!75513 (= e!49336 (contains!729 lt!34151 (tuple2!2133 (_1!1077 lt!33813) (_2!1077 lt!33813))))))

(declare-fun b!75514 () Bool)

(assert (=> b!75514 (= e!49339 e!49335)))

(declare-fun c!11461 () Bool)

(assert (=> b!75514 (= c!11461 (and ((_ is Cons!1478) (toList!727 lt!33809)) (= (_1!1077 (h!2066 (toList!727 lt!33809))) (_1!1077 lt!33813))))))

(declare-fun bm!6753 () Bool)

(assert (=> bm!6753 (= call!6757 call!6756)))

(declare-fun b!75515 () Bool)

(declare-fun c!11458 () Bool)

(assert (=> b!75515 (= c!11458 (and ((_ is Cons!1478) (toList!727 lt!33809)) (bvsgt (_1!1077 (h!2066 (toList!727 lt!33809))) (_1!1077 lt!33813))))))

(assert (=> b!75515 (= e!49335 e!49338)))

(declare-fun b!75517 () Bool)

(declare-fun res!39821 () Bool)

(assert (=> b!75517 (=> (not res!39821) (not e!49336))))

(assert (=> b!75517 (= res!39821 (containsKey!138 lt!34151 (_1!1077 lt!33813)))))

(declare-fun c!11459 () Bool)

(declare-fun bm!6754 () Bool)

(assert (=> bm!6754 (= call!6758 ($colon$colon!67 e!49337 (ite c!11459 (h!2066 (toList!727 lt!33809)) (tuple2!2133 (_1!1077 lt!33813) (_2!1077 lt!33813)))))))

(declare-fun c!11460 () Bool)

(assert (=> bm!6754 (= c!11460 c!11459)))

(declare-fun bm!6755 () Bool)

(assert (=> bm!6755 (= call!6756 call!6758)))

(declare-fun b!75516 () Bool)

(assert (=> b!75516 (= e!49337 (ite c!11461 (t!5060 (toList!727 lt!33809)) (ite c!11458 (Cons!1478 (h!2066 (toList!727 lt!33809)) (t!5060 (toList!727 lt!33809))) Nil!1479)))))

(declare-fun d!17953 () Bool)

(assert (=> d!17953 e!49336))

(declare-fun res!39822 () Bool)

(assert (=> d!17953 (=> (not res!39822) (not e!49336))))

(assert (=> d!17953 (= res!39822 (isStrictlySorted!293 lt!34151))))

(assert (=> d!17953 (= lt!34151 e!49339)))

(assert (=> d!17953 (= c!11459 (and ((_ is Cons!1478) (toList!727 lt!33809)) (bvslt (_1!1077 (h!2066 (toList!727 lt!33809))) (_1!1077 lt!33813))))))

(assert (=> d!17953 (isStrictlySorted!293 (toList!727 lt!33809))))

(assert (=> d!17953 (= (insertStrictlySorted!54 (toList!727 lt!33809) (_1!1077 lt!33813) (_2!1077 lt!33813)) lt!34151)))

(assert (= (and d!17953 c!11459) b!75511))

(assert (= (and d!17953 (not c!11459)) b!75514))

(assert (= (and b!75514 c!11461) b!75509))

(assert (= (and b!75514 (not c!11461)) b!75515))

(assert (= (and b!75515 c!11458) b!75508))

(assert (= (and b!75515 (not c!11458)) b!75510))

(assert (= (or b!75508 b!75510) bm!6753))

(assert (= (or b!75509 bm!6753) bm!6755))

(assert (= (or b!75511 bm!6755) bm!6754))

(assert (= (and bm!6754 c!11460) b!75512))

(assert (= (and bm!6754 (not c!11460)) b!75516))

(assert (= (and d!17953 res!39822) b!75517))

(assert (= (and b!75517 res!39821) b!75513))

(declare-fun m!75149 () Bool)

(assert (=> b!75512 m!75149))

(declare-fun m!75151 () Bool)

(assert (=> b!75513 m!75151))

(declare-fun m!75153 () Bool)

(assert (=> b!75517 m!75153))

(declare-fun m!75155 () Bool)

(assert (=> d!17953 m!75155))

(declare-fun m!75157 () Bool)

(assert (=> d!17953 m!75157))

(declare-fun m!75159 () Bool)

(assert (=> bm!6754 m!75159))

(assert (=> d!17851 d!17953))

(declare-fun c!11466 () Bool)

(declare-fun call!6764 () ListLongMap!1423)

(declare-fun call!6760 () ListLongMap!1423)

(declare-fun call!6763 () ListLongMap!1423)

(declare-fun call!6765 () ListLongMap!1423)

(declare-fun c!11467 () Bool)

(declare-fun bm!6756 () Bool)

(assert (=> bm!6756 (= call!6765 (+!96 (ite c!11466 call!6763 (ite c!11467 call!6764 call!6760)) (ite (or c!11466 c!11467) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 newMap!16)) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 newMap!16)))))))

(declare-fun b!75518 () Bool)

(declare-fun e!49349 () Bool)

(assert (=> b!75518 (= e!49349 (validKeyInArray!0 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6757 () Bool)

(assert (=> bm!6757 (= call!6760 call!6764)))

(declare-fun b!75519 () Bool)

(declare-fun e!49341 () Bool)

(declare-fun call!6759 () Bool)

(assert (=> b!75519 (= e!49341 (not call!6759))))

(declare-fun b!75520 () Bool)

(declare-fun e!49352 () Bool)

(declare-fun call!6761 () Bool)

(assert (=> b!75520 (= e!49352 (not call!6761))))

(declare-fun b!75521 () Bool)

(declare-fun res!39825 () Bool)

(declare-fun e!49345 () Bool)

(assert (=> b!75521 (=> (not res!39825) (not e!49345))))

(assert (=> b!75521 (= res!39825 e!49352)))

(declare-fun c!11463 () Bool)

(assert (=> b!75521 (= c!11463 (not (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!6758 () Bool)

(assert (=> bm!6758 (= call!6764 call!6763)))

(declare-fun b!75522 () Bool)

(declare-fun e!49343 () Bool)

(declare-fun e!49350 () Bool)

(assert (=> b!75522 (= e!49343 e!49350)))

(declare-fun res!39824 () Bool)

(assert (=> b!75522 (=> (not res!39824) (not e!49350))))

(declare-fun lt!34171 () ListLongMap!1423)

(assert (=> b!75522 (= res!39824 (contains!727 lt!34171 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!75522 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(declare-fun d!17955 () Bool)

(assert (=> d!17955 e!49345))

(declare-fun res!39827 () Bool)

(assert (=> d!17955 (=> (not res!39827) (not e!49345))))

(assert (=> d!17955 (= res!39827 (or (bvsge #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))))

(declare-fun lt!34161 () ListLongMap!1423)

(assert (=> d!17955 (= lt!34171 lt!34161)))

(declare-fun lt!34158 () Unit!2157)

(declare-fun e!49346 () Unit!2157)

(assert (=> d!17955 (= lt!34158 e!49346)))

(declare-fun c!11464 () Bool)

(declare-fun e!49348 () Bool)

(assert (=> d!17955 (= c!11464 e!49348)))

(declare-fun res!39826 () Bool)

(assert (=> d!17955 (=> (not res!39826) (not e!49348))))

(assert (=> d!17955 (= res!39826 (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(declare-fun e!49342 () ListLongMap!1423)

(assert (=> d!17955 (= lt!34161 e!49342)))

(assert (=> d!17955 (= c!11466 (and (not (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!17955 (validMask!0 (mask!6211 newMap!16))))

(assert (=> d!17955 (= (getCurrentListMap!424 (_keys!3890 newMap!16) (ite c!11419 (_values!2217 newMap!16) (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (index!3081 lt!34048) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16)))) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)) lt!34171)))

(declare-fun b!75523 () Bool)

(declare-fun e!49347 () ListLongMap!1423)

(declare-fun call!6762 () ListLongMap!1423)

(assert (=> b!75523 (= e!49347 call!6762)))

(declare-fun b!75524 () Bool)

(declare-fun lt!34167 () Unit!2157)

(assert (=> b!75524 (= e!49346 lt!34167)))

(declare-fun lt!34157 () ListLongMap!1423)

(assert (=> b!75524 (= lt!34157 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (ite c!11419 (_values!2217 newMap!16) (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (index!3081 lt!34048) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16)))) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34156 () (_ BitVec 64))

(assert (=> b!75524 (= lt!34156 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34165 () (_ BitVec 64))

(assert (=> b!75524 (= lt!34165 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34170 () Unit!2157)

(assert (=> b!75524 (= lt!34170 (addStillContains!52 lt!34157 lt!34156 (zeroValue!2134 newMap!16) lt!34165))))

(assert (=> b!75524 (contains!727 (+!96 lt!34157 (tuple2!2133 lt!34156 (zeroValue!2134 newMap!16))) lt!34165)))

(declare-fun lt!34153 () Unit!2157)

(assert (=> b!75524 (= lt!34153 lt!34170)))

(declare-fun lt!34155 () ListLongMap!1423)

(assert (=> b!75524 (= lt!34155 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (ite c!11419 (_values!2217 newMap!16) (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (index!3081 lt!34048) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16)))) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34173 () (_ BitVec 64))

(assert (=> b!75524 (= lt!34173 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34169 () (_ BitVec 64))

(assert (=> b!75524 (= lt!34169 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34154 () Unit!2157)

(assert (=> b!75524 (= lt!34154 (addApplyDifferent!52 lt!34155 lt!34173 (minValue!2134 newMap!16) lt!34169))))

(assert (=> b!75524 (= (apply!76 (+!96 lt!34155 (tuple2!2133 lt!34173 (minValue!2134 newMap!16))) lt!34169) (apply!76 lt!34155 lt!34169))))

(declare-fun lt!34159 () Unit!2157)

(assert (=> b!75524 (= lt!34159 lt!34154)))

(declare-fun lt!34163 () ListLongMap!1423)

(assert (=> b!75524 (= lt!34163 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (ite c!11419 (_values!2217 newMap!16) (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (index!3081 lt!34048) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16)))) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34152 () (_ BitVec 64))

(assert (=> b!75524 (= lt!34152 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34162 () (_ BitVec 64))

(assert (=> b!75524 (= lt!34162 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34160 () Unit!2157)

(assert (=> b!75524 (= lt!34160 (addApplyDifferent!52 lt!34163 lt!34152 (zeroValue!2134 newMap!16) lt!34162))))

(assert (=> b!75524 (= (apply!76 (+!96 lt!34163 (tuple2!2133 lt!34152 (zeroValue!2134 newMap!16))) lt!34162) (apply!76 lt!34163 lt!34162))))

(declare-fun lt!34166 () Unit!2157)

(assert (=> b!75524 (= lt!34166 lt!34160)))

(declare-fun lt!34168 () ListLongMap!1423)

(assert (=> b!75524 (= lt!34168 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (ite c!11419 (_values!2217 newMap!16) (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (index!3081 lt!34048) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16)))) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34172 () (_ BitVec 64))

(assert (=> b!75524 (= lt!34172 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34164 () (_ BitVec 64))

(assert (=> b!75524 (= lt!34164 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75524 (= lt!34167 (addApplyDifferent!52 lt!34168 lt!34172 (minValue!2134 newMap!16) lt!34164))))

(assert (=> b!75524 (= (apply!76 (+!96 lt!34168 (tuple2!2133 lt!34172 (minValue!2134 newMap!16))) lt!34164) (apply!76 lt!34168 lt!34164))))

(declare-fun b!75525 () Bool)

(declare-fun c!11462 () Bool)

(assert (=> b!75525 (= c!11462 (and (not (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!49351 () ListLongMap!1423)

(assert (=> b!75525 (= e!49347 e!49351)))

(declare-fun bm!6759 () Bool)

(assert (=> bm!6759 (= call!6763 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (ite c!11419 (_values!2217 newMap!16) (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (index!3081 lt!34048) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16)))) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun b!75526 () Bool)

(declare-fun res!39823 () Bool)

(assert (=> b!75526 (=> (not res!39823) (not e!49345))))

(assert (=> b!75526 (= res!39823 e!49343)))

(declare-fun res!39831 () Bool)

(assert (=> b!75526 (=> res!39831 e!49343)))

(assert (=> b!75526 (= res!39831 (not e!49349))))

(declare-fun res!39829 () Bool)

(assert (=> b!75526 (=> (not res!39829) (not e!49349))))

(assert (=> b!75526 (= res!39829 (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(declare-fun b!75527 () Bool)

(assert (=> b!75527 (= e!49348 (validKeyInArray!0 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75528 () Bool)

(declare-fun e!49344 () Bool)

(assert (=> b!75528 (= e!49352 e!49344)))

(declare-fun res!39828 () Bool)

(assert (=> b!75528 (= res!39828 call!6761)))

(assert (=> b!75528 (=> (not res!39828) (not e!49344))))

(declare-fun b!75529 () Bool)

(assert (=> b!75529 (= e!49344 (= (apply!76 lt!34171 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2134 newMap!16)))))

(declare-fun b!75530 () Bool)

(assert (=> b!75530 (= e!49351 call!6762)))

(declare-fun b!75531 () Bool)

(declare-fun e!49340 () Bool)

(assert (=> b!75531 (= e!49340 (= (apply!76 lt!34171 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2134 newMap!16)))))

(declare-fun b!75532 () Bool)

(assert (=> b!75532 (= e!49345 e!49341)))

(declare-fun c!11465 () Bool)

(assert (=> b!75532 (= c!11465 (not (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75533 () Bool)

(assert (=> b!75533 (= e!49342 (+!96 call!6765 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 newMap!16))))))

(declare-fun b!75534 () Bool)

(assert (=> b!75534 (= e!49342 e!49347)))

(assert (=> b!75534 (= c!11467 (and (not (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6760 () Bool)

(assert (=> bm!6760 (= call!6759 (contains!727 lt!34171 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6761 () Bool)

(assert (=> bm!6761 (= call!6762 call!6765)))

(declare-fun b!75535 () Bool)

(assert (=> b!75535 (= e!49341 e!49340)))

(declare-fun res!39830 () Bool)

(assert (=> b!75535 (= res!39830 call!6759)))

(assert (=> b!75535 (=> (not res!39830) (not e!49340))))

(declare-fun b!75536 () Bool)

(assert (=> b!75536 (= e!49351 call!6760)))

(declare-fun b!75537 () Bool)

(declare-fun Unit!2176 () Unit!2157)

(assert (=> b!75537 (= e!49346 Unit!2176)))

(declare-fun bm!6762 () Bool)

(assert (=> bm!6762 (= call!6761 (contains!727 lt!34171 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75538 () Bool)

(assert (=> b!75538 (= e!49350 (= (apply!76 lt!34171 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)) (get!1146 (select (arr!1866 (ite c!11419 (_values!2217 newMap!16) (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (index!3081 lt!34048) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!327 (defaultEntry!2234 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2105 (ite c!11419 (_values!2217 newMap!16) (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (index!3081 lt!34048) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16)))))))))

(assert (=> b!75538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(assert (= (and d!17955 c!11466) b!75533))

(assert (= (and d!17955 (not c!11466)) b!75534))

(assert (= (and b!75534 c!11467) b!75523))

(assert (= (and b!75534 (not c!11467)) b!75525))

(assert (= (and b!75525 c!11462) b!75530))

(assert (= (and b!75525 (not c!11462)) b!75536))

(assert (= (or b!75530 b!75536) bm!6757))

(assert (= (or b!75523 bm!6757) bm!6758))

(assert (= (or b!75523 b!75530) bm!6761))

(assert (= (or b!75533 bm!6758) bm!6759))

(assert (= (or b!75533 bm!6761) bm!6756))

(assert (= (and d!17955 res!39826) b!75527))

(assert (= (and d!17955 c!11464) b!75524))

(assert (= (and d!17955 (not c!11464)) b!75537))

(assert (= (and d!17955 res!39827) b!75526))

(assert (= (and b!75526 res!39829) b!75518))

(assert (= (and b!75526 (not res!39831)) b!75522))

(assert (= (and b!75522 res!39824) b!75538))

(assert (= (and b!75526 res!39823) b!75521))

(assert (= (and b!75521 c!11463) b!75528))

(assert (= (and b!75521 (not c!11463)) b!75520))

(assert (= (and b!75528 res!39828) b!75529))

(assert (= (or b!75528 b!75520) bm!6762))

(assert (= (and b!75521 res!39825) b!75532))

(assert (= (and b!75532 c!11465) b!75535))

(assert (= (and b!75532 (not c!11465)) b!75519))

(assert (= (and b!75535 res!39830) b!75531))

(assert (= (or b!75535 b!75519) bm!6760))

(declare-fun b_lambda!3395 () Bool)

(assert (=> (not b_lambda!3395) (not b!75538)))

(declare-fun t!5069 () Bool)

(declare-fun tb!1557 () Bool)

(assert (=> (and b!75012 (= (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) (defaultEntry!2234 newMap!16)) t!5069) tb!1557))

(declare-fun result!2721 () Bool)

(assert (=> tb!1557 (= result!2721 tp_is_empty!2481)))

(assert (=> b!75538 t!5069))

(declare-fun b_and!4627 () Bool)

(assert (= b_and!4623 (and (=> t!5069 result!2721) b_and!4627)))

(declare-fun t!5071 () Bool)

(declare-fun tb!1559 () Bool)

(assert (=> (and b!74998 (= (defaultEntry!2234 newMap!16) (defaultEntry!2234 newMap!16)) t!5071) tb!1559))

(declare-fun result!2723 () Bool)

(assert (= result!2723 result!2721))

(assert (=> b!75538 t!5071))

(declare-fun b_and!4629 () Bool)

(assert (= b_and!4625 (and (=> t!5071 result!2723) b_and!4629)))

(declare-fun m!75161 () Bool)

(assert (=> bm!6760 m!75161))

(declare-fun m!75163 () Bool)

(assert (=> b!75529 m!75163))

(assert (=> b!75518 m!74945))

(assert (=> b!75518 m!74945))

(declare-fun m!75165 () Bool)

(assert (=> b!75518 m!75165))

(declare-fun m!75167 () Bool)

(assert (=> b!75531 m!75167))

(declare-fun m!75169 () Bool)

(assert (=> b!75524 m!75169))

(declare-fun m!75171 () Bool)

(assert (=> b!75524 m!75171))

(declare-fun m!75173 () Bool)

(assert (=> b!75524 m!75173))

(declare-fun m!75175 () Bool)

(assert (=> b!75524 m!75175))

(declare-fun m!75177 () Bool)

(assert (=> b!75524 m!75177))

(declare-fun m!75179 () Bool)

(assert (=> b!75524 m!75179))

(assert (=> b!75524 m!75175))

(declare-fun m!75181 () Bool)

(assert (=> b!75524 m!75181))

(declare-fun m!75183 () Bool)

(assert (=> b!75524 m!75183))

(declare-fun m!75185 () Bool)

(assert (=> b!75524 m!75185))

(assert (=> b!75524 m!75183))

(declare-fun m!75187 () Bool)

(assert (=> b!75524 m!75187))

(declare-fun m!75189 () Bool)

(assert (=> b!75524 m!75189))

(declare-fun m!75191 () Bool)

(assert (=> b!75524 m!75191))

(declare-fun m!75193 () Bool)

(assert (=> b!75524 m!75193))

(declare-fun m!75195 () Bool)

(assert (=> b!75524 m!75195))

(assert (=> b!75524 m!75187))

(assert (=> b!75524 m!74945))

(assert (=> b!75524 m!75193))

(declare-fun m!75197 () Bool)

(assert (=> b!75524 m!75197))

(declare-fun m!75199 () Bool)

(assert (=> b!75524 m!75199))

(declare-fun m!75201 () Bool)

(assert (=> b!75533 m!75201))

(assert (=> b!75522 m!74945))

(assert (=> b!75522 m!74945))

(declare-fun m!75203 () Bool)

(assert (=> b!75522 m!75203))

(declare-fun m!75205 () Bool)

(assert (=> bm!6756 m!75205))

(declare-fun m!75207 () Bool)

(assert (=> b!75538 m!75207))

(assert (=> b!75538 m!74945))

(declare-fun m!75209 () Bool)

(assert (=> b!75538 m!75209))

(declare-fun m!75211 () Bool)

(assert (=> b!75538 m!75211))

(assert (=> b!75538 m!75207))

(declare-fun m!75213 () Bool)

(assert (=> b!75538 m!75213))

(assert (=> b!75538 m!74945))

(assert (=> b!75538 m!75211))

(assert (=> d!17955 m!75125))

(assert (=> bm!6759 m!75179))

(assert (=> b!75527 m!74945))

(assert (=> b!75527 m!74945))

(assert (=> b!75527 m!75165))

(declare-fun m!75215 () Bool)

(assert (=> bm!6762 m!75215))

(assert (=> bm!6726 d!17955))

(declare-fun d!17957 () Bool)

(assert (=> d!17957 (= (apply!76 lt!33937 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1150 (getValueByKey!134 (toList!727 lt!33937) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3247 () Bool)

(assert (= bs!3247 d!17957))

(assert (=> bs!3247 m!74673))

(declare-fun m!75217 () Bool)

(assert (=> bs!3247 m!75217))

(assert (=> bs!3247 m!75217))

(declare-fun m!75219 () Bool)

(assert (=> bs!3247 m!75219))

(assert (=> b!75184 d!17957))

(declare-fun d!17959 () Bool)

(declare-fun c!11468 () Bool)

(assert (=> d!17959 (= c!11468 ((_ is ValueCellFull!897) (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!49353 () V!2955)

(assert (=> d!17959 (= (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!49353)))

(declare-fun b!75539 () Bool)

(assert (=> b!75539 (= e!49353 (get!1148 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!75540 () Bool)

(assert (=> b!75540 (= e!49353 (get!1149 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17959 c!11468) b!75539))

(assert (= (and d!17959 (not c!11468)) b!75540))

(assert (=> b!75539 m!74717))

(assert (=> b!75539 m!74585))

(declare-fun m!75221 () Bool)

(assert (=> b!75539 m!75221))

(assert (=> b!75540 m!74717))

(assert (=> b!75540 m!74585))

(declare-fun m!75223 () Bool)

(assert (=> b!75540 m!75223))

(assert (=> b!75184 d!17959))

(declare-fun bm!6765 () Bool)

(declare-fun call!6768 () (_ BitVec 32))

(assert (=> bm!6765 (= call!6768 (arrayCountValidKeys!0 (_keys!3890 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2104 (_keys!3890 newMap!16))))))

(declare-fun d!17961 () Bool)

(declare-fun lt!34176 () (_ BitVec 32))

(assert (=> d!17961 (and (bvsge lt!34176 #b00000000000000000000000000000000) (bvsle lt!34176 (bvsub (size!2104 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!49359 () (_ BitVec 32))

(assert (=> d!17961 (= lt!34176 e!49359)))

(declare-fun c!11474 () Bool)

(assert (=> d!17961 (= c!11474 (bvsge #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(assert (=> d!17961 (and (bvsle #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2104 (_keys!3890 newMap!16)) (size!2104 (_keys!3890 newMap!16))))))

(assert (=> d!17961 (= (arrayCountValidKeys!0 (_keys!3890 newMap!16) #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))) lt!34176)))

(declare-fun b!75549 () Bool)

(declare-fun e!49358 () (_ BitVec 32))

(assert (=> b!75549 (= e!49358 (bvadd #b00000000000000000000000000000001 call!6768))))

(declare-fun b!75550 () Bool)

(assert (=> b!75550 (= e!49359 e!49358)))

(declare-fun c!11473 () Bool)

(assert (=> b!75550 (= c!11473 (validKeyInArray!0 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75551 () Bool)

(assert (=> b!75551 (= e!49359 #b00000000000000000000000000000000)))

(declare-fun b!75552 () Bool)

(assert (=> b!75552 (= e!49358 call!6768)))

(assert (= (and d!17961 c!11474) b!75551))

(assert (= (and d!17961 (not c!11474)) b!75550))

(assert (= (and b!75550 c!11473) b!75549))

(assert (= (and b!75550 (not c!11473)) b!75552))

(assert (= (or b!75549 b!75552) bm!6765))

(declare-fun m!75225 () Bool)

(assert (=> bm!6765 m!75225))

(assert (=> b!75550 m!74945))

(assert (=> b!75550 m!74945))

(assert (=> b!75550 m!75165))

(assert (=> b!75149 d!17961))

(declare-fun d!17963 () Bool)

(declare-fun e!49362 () Bool)

(assert (=> d!17963 e!49362))

(declare-fun res!39837 () Bool)

(assert (=> d!17963 (=> (not res!39837) (not e!49362))))

(declare-fun lt!34182 () SeekEntryResult!237)

(assert (=> d!17963 (= res!39837 ((_ is Found!237) lt!34182))))

(assert (=> d!17963 (= lt!34182 (seekEntryOrOpen!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (_keys!3890 newMap!16) (mask!6211 newMap!16)))))

(declare-fun lt!34181 () Unit!2157)

(declare-fun choose!431 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 64) Int) Unit!2157)

(assert (=> d!17963 (= lt!34181 (choose!431 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (defaultEntry!2234 newMap!16)))))

(assert (=> d!17963 (validMask!0 (mask!6211 newMap!16))))

(assert (=> d!17963 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!25 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (defaultEntry!2234 newMap!16)) lt!34181)))

(declare-fun b!75557 () Bool)

(declare-fun res!39836 () Bool)

(assert (=> b!75557 (=> (not res!39836) (not e!49362))))

(assert (=> b!75557 (= res!39836 (inRange!0 (index!3081 lt!34182) (mask!6211 newMap!16)))))

(declare-fun b!75558 () Bool)

(assert (=> b!75558 (= e!49362 (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3081 lt!34182)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (=> b!75558 (and (bvsge (index!3081 lt!34182) #b00000000000000000000000000000000) (bvslt (index!3081 lt!34182) (size!2104 (_keys!3890 newMap!16))))))

(assert (= (and d!17963 res!39837) b!75557))

(assert (= (and b!75557 res!39836) b!75558))

(assert (=> d!17963 m!74557))

(assert (=> d!17963 m!74871))

(assert (=> d!17963 m!74557))

(declare-fun m!75227 () Bool)

(assert (=> d!17963 m!75227))

(assert (=> d!17963 m!75125))

(declare-fun m!75229 () Bool)

(assert (=> b!75557 m!75229))

(declare-fun m!75231 () Bool)

(assert (=> b!75558 m!75231))

(assert (=> bm!6734 d!17963))

(declare-fun d!17965 () Bool)

(assert (=> d!17965 (isDefined!87 (getValueByKey!134 (toList!727 lt!33808) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun lt!34185 () Unit!2157)

(declare-fun choose!432 (List!1482 (_ BitVec 64)) Unit!2157)

(assert (=> d!17965 (= lt!34185 (choose!432 (toList!727 lt!33808) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun e!49365 () Bool)

(assert (=> d!17965 e!49365))

(declare-fun res!39840 () Bool)

(assert (=> d!17965 (=> (not res!39840) (not e!49365))))

(assert (=> d!17965 (= res!39840 (isStrictlySorted!293 (toList!727 lt!33808)))))

(assert (=> d!17965 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 lt!33808) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) lt!34185)))

(declare-fun b!75561 () Bool)

(assert (=> b!75561 (= e!49365 (containsKey!138 (toList!727 lt!33808) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (= (and d!17965 res!39840) b!75561))

(assert (=> d!17965 m!74557))

(assert (=> d!17965 m!74831))

(assert (=> d!17965 m!74831))

(assert (=> d!17965 m!74833))

(assert (=> d!17965 m!74557))

(declare-fun m!75233 () Bool)

(assert (=> d!17965 m!75233))

(declare-fun m!75235 () Bool)

(assert (=> d!17965 m!75235))

(assert (=> b!75561 m!74557))

(assert (=> b!75561 m!74827))

(assert (=> b!75224 d!17965))

(declare-fun d!17967 () Bool)

(declare-fun isEmpty!320 (Option!140) Bool)

(assert (=> d!17967 (= (isDefined!87 (getValueByKey!134 (toList!727 lt!33808) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355))) (not (isEmpty!320 (getValueByKey!134 (toList!727 lt!33808) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))))

(declare-fun bs!3248 () Bool)

(assert (= bs!3248 d!17967))

(assert (=> bs!3248 m!74831))

(declare-fun m!75237 () Bool)

(assert (=> bs!3248 m!75237))

(assert (=> b!75224 d!17967))

(declare-fun e!49367 () Option!140)

(declare-fun b!75564 () Bool)

(assert (=> b!75564 (= e!49367 (getValueByKey!134 (t!5060 (toList!727 lt!33808)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun c!11475 () Bool)

(declare-fun d!17969 () Bool)

(assert (=> d!17969 (= c!11475 (and ((_ is Cons!1478) (toList!727 lt!33808)) (= (_1!1077 (h!2066 (toList!727 lt!33808))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355))))))

(declare-fun e!49366 () Option!140)

(assert (=> d!17969 (= (getValueByKey!134 (toList!727 lt!33808) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) e!49366)))

(declare-fun b!75563 () Bool)

(assert (=> b!75563 (= e!49366 e!49367)))

(declare-fun c!11476 () Bool)

(assert (=> b!75563 (= c!11476 (and ((_ is Cons!1478) (toList!727 lt!33808)) (not (= (_1!1077 (h!2066 (toList!727 lt!33808))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))))

(declare-fun b!75562 () Bool)

(assert (=> b!75562 (= e!49366 (Some!139 (_2!1077 (h!2066 (toList!727 lt!33808)))))))

(declare-fun b!75565 () Bool)

(assert (=> b!75565 (= e!49367 None!138)))

(assert (= (and d!17969 c!11475) b!75562))

(assert (= (and d!17969 (not c!11475)) b!75563))

(assert (= (and b!75563 c!11476) b!75564))

(assert (= (and b!75563 (not c!11476)) b!75565))

(assert (=> b!75564 m!74557))

(declare-fun m!75239 () Bool)

(assert (=> b!75564 m!75239))

(assert (=> b!75224 d!17969))

(declare-fun d!17971 () Bool)

(assert (=> d!17971 (= (get!1148 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) from!355) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2545 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (=> b!75216 d!17971))

(declare-fun d!17973 () Bool)

(declare-fun e!49369 () Bool)

(assert (=> d!17973 e!49369))

(declare-fun res!39841 () Bool)

(assert (=> d!17973 (=> res!39841 e!49369)))

(declare-fun lt!34189 () Bool)

(assert (=> d!17973 (= res!39841 (not lt!34189))))

(declare-fun lt!34186 () Bool)

(assert (=> d!17973 (= lt!34189 lt!34186)))

(declare-fun lt!34187 () Unit!2157)

(declare-fun e!49368 () Unit!2157)

(assert (=> d!17973 (= lt!34187 e!49368)))

(declare-fun c!11477 () Bool)

(assert (=> d!17973 (= c!11477 lt!34186)))

(assert (=> d!17973 (= lt!34186 (containsKey!138 (toList!727 lt!33937) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!17973 (= (contains!727 lt!33937 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!34189)))

(declare-fun b!75566 () Bool)

(declare-fun lt!34188 () Unit!2157)

(assert (=> b!75566 (= e!49368 lt!34188)))

(assert (=> b!75566 (= lt!34188 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 lt!33937) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75566 (isDefined!87 (getValueByKey!134 (toList!727 lt!33937) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!75567 () Bool)

(declare-fun Unit!2177 () Unit!2157)

(assert (=> b!75567 (= e!49368 Unit!2177)))

(declare-fun b!75568 () Bool)

(assert (=> b!75568 (= e!49369 (isDefined!87 (getValueByKey!134 (toList!727 lt!33937) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!17973 c!11477) b!75566))

(assert (= (and d!17973 (not c!11477)) b!75567))

(assert (= (and d!17973 (not res!39841)) b!75568))

(assert (=> d!17973 m!74673))

(declare-fun m!75241 () Bool)

(assert (=> d!17973 m!75241))

(assert (=> b!75566 m!74673))

(declare-fun m!75243 () Bool)

(assert (=> b!75566 m!75243))

(assert (=> b!75566 m!74673))

(assert (=> b!75566 m!75217))

(assert (=> b!75566 m!75217))

(declare-fun m!75245 () Bool)

(assert (=> b!75566 m!75245))

(assert (=> b!75568 m!74673))

(assert (=> b!75568 m!75217))

(assert (=> b!75568 m!75217))

(assert (=> b!75568 m!75245))

(assert (=> b!75186 d!17973))

(declare-fun b!75569 () Bool)

(declare-fun e!49370 () Bool)

(declare-fun e!49371 () Bool)

(assert (=> b!75569 (= e!49370 e!49371)))

(declare-fun c!11478 () Bool)

(assert (=> b!75569 (= c!11478 (validKeyInArray!0 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75570 () Bool)

(declare-fun call!6769 () Bool)

(assert (=> b!75570 (= e!49371 call!6769)))

(declare-fun d!17975 () Bool)

(declare-fun res!39844 () Bool)

(declare-fun e!49373 () Bool)

(assert (=> d!17975 (=> res!39844 e!49373)))

(assert (=> d!17975 (= res!39844 (bvsge #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(assert (=> d!17975 (= (arrayNoDuplicates!0 (_keys!3890 newMap!16) #b00000000000000000000000000000000 Nil!1480) e!49373)))

(declare-fun b!75571 () Bool)

(assert (=> b!75571 (= e!49371 call!6769)))

(declare-fun b!75572 () Bool)

(assert (=> b!75572 (= e!49373 e!49370)))

(declare-fun res!39843 () Bool)

(assert (=> b!75572 (=> (not res!39843) (not e!49370))))

(declare-fun e!49372 () Bool)

(assert (=> b!75572 (= res!39843 (not e!49372))))

(declare-fun res!39842 () Bool)

(assert (=> b!75572 (=> (not res!39842) (not e!49372))))

(assert (=> b!75572 (= res!39842 (validKeyInArray!0 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6766 () Bool)

(assert (=> bm!6766 (= call!6769 (arrayNoDuplicates!0 (_keys!3890 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11478 (Cons!1479 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000) Nil!1480) Nil!1480)))))

(declare-fun b!75573 () Bool)

(assert (=> b!75573 (= e!49372 (contains!730 Nil!1480 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!17975 (not res!39844)) b!75572))

(assert (= (and b!75572 res!39842) b!75573))

(assert (= (and b!75572 res!39843) b!75569))

(assert (= (and b!75569 c!11478) b!75570))

(assert (= (and b!75569 (not c!11478)) b!75571))

(assert (= (or b!75570 b!75571) bm!6766))

(assert (=> b!75569 m!74945))

(assert (=> b!75569 m!74945))

(assert (=> b!75569 m!75165))

(assert (=> b!75572 m!74945))

(assert (=> b!75572 m!74945))

(assert (=> b!75572 m!75165))

(assert (=> bm!6766 m!74945))

(declare-fun m!75247 () Bool)

(assert (=> bm!6766 m!75247))

(assert (=> b!75573 m!74945))

(assert (=> b!75573 m!74945))

(declare-fun m!75249 () Bool)

(assert (=> b!75573 m!75249))

(assert (=> b!75151 d!17975))

(declare-fun d!17977 () Bool)

(declare-fun e!49374 () Bool)

(assert (=> d!17977 e!49374))

(declare-fun res!39845 () Bool)

(assert (=> d!17977 (=> (not res!39845) (not e!49374))))

(declare-fun lt!34190 () ListLongMap!1423)

(assert (=> d!17977 (= res!39845 (contains!727 lt!34190 (_1!1077 (ite c!11408 (ite c!11410 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33806) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))))))

(declare-fun lt!34192 () List!1482)

(assert (=> d!17977 (= lt!34190 (ListLongMap!1424 lt!34192))))

(declare-fun lt!34191 () Unit!2157)

(declare-fun lt!34193 () Unit!2157)

(assert (=> d!17977 (= lt!34191 lt!34193)))

(assert (=> d!17977 (= (getValueByKey!134 lt!34192 (_1!1077 (ite c!11408 (ite c!11410 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33806) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))) (Some!139 (_2!1077 (ite c!11408 (ite c!11410 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33806) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))))))

(assert (=> d!17977 (= lt!34193 (lemmaContainsTupThenGetReturnValue!51 lt!34192 (_1!1077 (ite c!11408 (ite c!11410 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33806) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))) (_2!1077 (ite c!11408 (ite c!11410 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33806) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))))))

(assert (=> d!17977 (= lt!34192 (insertStrictlySorted!54 (toList!727 (ite c!11408 call!6724 call!6728)) (_1!1077 (ite c!11408 (ite c!11410 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33806) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))) (_2!1077 (ite c!11408 (ite c!11410 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33806) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))))))

(assert (=> d!17977 (= (+!96 (ite c!11408 call!6724 call!6728) (ite c!11408 (ite c!11410 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33806) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))) lt!34190)))

(declare-fun b!75574 () Bool)

(declare-fun res!39846 () Bool)

(assert (=> b!75574 (=> (not res!39846) (not e!49374))))

(assert (=> b!75574 (= res!39846 (= (getValueByKey!134 (toList!727 lt!34190) (_1!1077 (ite c!11408 (ite c!11410 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33806) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))) (Some!139 (_2!1077 (ite c!11408 (ite c!11410 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33806) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))))

(declare-fun b!75575 () Bool)

(assert (=> b!75575 (= e!49374 (contains!729 (toList!727 lt!34190) (ite c!11408 (ite c!11410 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33806) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(assert (= (and d!17977 res!39845) b!75574))

(assert (= (and b!75574 res!39846) b!75575))

(declare-fun m!75251 () Bool)

(assert (=> d!17977 m!75251))

(declare-fun m!75253 () Bool)

(assert (=> d!17977 m!75253))

(declare-fun m!75255 () Bool)

(assert (=> d!17977 m!75255))

(declare-fun m!75257 () Bool)

(assert (=> d!17977 m!75257))

(declare-fun m!75259 () Bool)

(assert (=> b!75574 m!75259))

(declare-fun m!75261 () Bool)

(assert (=> b!75575 m!75261))

(assert (=> bm!6736 d!17977))

(assert (=> b!75226 d!17967))

(assert (=> b!75226 d!17969))

(declare-fun b!75578 () Bool)

(declare-fun e!49376 () Option!140)

(assert (=> b!75578 (= e!49376 (getValueByKey!134 (t!5060 (toList!727 lt!33946)) (_1!1077 lt!33813)))))

(declare-fun d!17979 () Bool)

(declare-fun c!11479 () Bool)

(assert (=> d!17979 (= c!11479 (and ((_ is Cons!1478) (toList!727 lt!33946)) (= (_1!1077 (h!2066 (toList!727 lt!33946))) (_1!1077 lt!33813))))))

(declare-fun e!49375 () Option!140)

(assert (=> d!17979 (= (getValueByKey!134 (toList!727 lt!33946) (_1!1077 lt!33813)) e!49375)))

(declare-fun b!75577 () Bool)

(assert (=> b!75577 (= e!49375 e!49376)))

(declare-fun c!11480 () Bool)

(assert (=> b!75577 (= c!11480 (and ((_ is Cons!1478) (toList!727 lt!33946)) (not (= (_1!1077 (h!2066 (toList!727 lt!33946))) (_1!1077 lt!33813)))))))

(declare-fun b!75576 () Bool)

(assert (=> b!75576 (= e!49375 (Some!139 (_2!1077 (h!2066 (toList!727 lt!33946)))))))

(declare-fun b!75579 () Bool)

(assert (=> b!75579 (= e!49376 None!138)))

(assert (= (and d!17979 c!11479) b!75576))

(assert (= (and d!17979 (not c!11479)) b!75577))

(assert (= (and b!75577 c!11480) b!75578))

(assert (= (and b!75577 (not c!11480)) b!75579))

(declare-fun m!75263 () Bool)

(assert (=> b!75578 m!75263))

(assert (=> b!75192 d!17979))

(declare-fun b!75582 () Bool)

(declare-fun e!49378 () Option!140)

(assert (=> b!75582 (= e!49378 (getValueByKey!134 (t!5060 (toList!727 lt!33950)) (_1!1077 lt!33803)))))

(declare-fun d!17981 () Bool)

(declare-fun c!11481 () Bool)

(assert (=> d!17981 (= c!11481 (and ((_ is Cons!1478) (toList!727 lt!33950)) (= (_1!1077 (h!2066 (toList!727 lt!33950))) (_1!1077 lt!33803))))))

(declare-fun e!49377 () Option!140)

(assert (=> d!17981 (= (getValueByKey!134 (toList!727 lt!33950) (_1!1077 lt!33803)) e!49377)))

(declare-fun b!75581 () Bool)

(assert (=> b!75581 (= e!49377 e!49378)))

(declare-fun c!11482 () Bool)

(assert (=> b!75581 (= c!11482 (and ((_ is Cons!1478) (toList!727 lt!33950)) (not (= (_1!1077 (h!2066 (toList!727 lt!33950))) (_1!1077 lt!33803)))))))

(declare-fun b!75580 () Bool)

(assert (=> b!75580 (= e!49377 (Some!139 (_2!1077 (h!2066 (toList!727 lt!33950)))))))

(declare-fun b!75583 () Bool)

(assert (=> b!75583 (= e!49378 None!138)))

(assert (= (and d!17981 c!11481) b!75580))

(assert (= (and d!17981 (not c!11481)) b!75581))

(assert (= (and b!75581 c!11482) b!75582))

(assert (= (and b!75581 (not c!11482)) b!75583))

(declare-fun m!75265 () Bool)

(assert (=> b!75582 m!75265))

(assert (=> b!75194 d!17981))

(assert (=> d!17839 d!17853))

(declare-fun b!75586 () Bool)

(declare-fun e!49380 () Option!140)

(assert (=> b!75586 (= e!49380 (getValueByKey!134 (t!5060 (toList!727 lt!33954)) (_1!1077 lt!33813)))))

(declare-fun d!17983 () Bool)

(declare-fun c!11483 () Bool)

(assert (=> d!17983 (= c!11483 (and ((_ is Cons!1478) (toList!727 lt!33954)) (= (_1!1077 (h!2066 (toList!727 lt!33954))) (_1!1077 lt!33813))))))

(declare-fun e!49379 () Option!140)

(assert (=> d!17983 (= (getValueByKey!134 (toList!727 lt!33954) (_1!1077 lt!33813)) e!49379)))

(declare-fun b!75585 () Bool)

(assert (=> b!75585 (= e!49379 e!49380)))

(declare-fun c!11484 () Bool)

(assert (=> b!75585 (= c!11484 (and ((_ is Cons!1478) (toList!727 lt!33954)) (not (= (_1!1077 (h!2066 (toList!727 lt!33954))) (_1!1077 lt!33813)))))))

(declare-fun b!75584 () Bool)

(assert (=> b!75584 (= e!49379 (Some!139 (_2!1077 (h!2066 (toList!727 lt!33954)))))))

(declare-fun b!75587 () Bool)

(assert (=> b!75587 (= e!49380 None!138)))

(assert (= (and d!17983 c!11483) b!75584))

(assert (= (and d!17983 (not c!11483)) b!75585))

(assert (= (and b!75585 c!11484) b!75586))

(assert (= (and b!75585 (not c!11484)) b!75587))

(declare-fun m!75267 () Bool)

(assert (=> b!75586 m!75267))

(assert (=> b!75196 d!17983))

(declare-fun d!17985 () Bool)

(assert (=> d!17985 (= (+!96 (getCurrentListMap!424 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33806)) (getCurrentListMap!424 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) lt!34063 lt!33806 (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34196 () Unit!2157)

(declare-fun choose!433 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 V!2955 Int) Unit!2157)

(assert (=> d!17985 (= lt!34196 (choose!433 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) lt!34063 (zeroValue!2134 newMap!16) lt!33806 (minValue!2134 newMap!16) (defaultEntry!2234 newMap!16)))))

(assert (=> d!17985 (validMask!0 (mask!6211 newMap!16))))

(assert (=> d!17985 (= (lemmaChangeZeroKeyThenAddPairToListMap!25 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) lt!34063 (zeroValue!2134 newMap!16) lt!33806 (minValue!2134 newMap!16) (defaultEntry!2234 newMap!16)) lt!34196)))

(declare-fun bs!3249 () Bool)

(assert (= bs!3249 d!17985))

(assert (=> bs!3249 m!75125))

(declare-fun m!75269 () Bool)

(assert (=> bs!3249 m!75269))

(declare-fun m!75271 () Bool)

(assert (=> bs!3249 m!75271))

(assert (=> bs!3249 m!74667))

(assert (=> bs!3249 m!74667))

(declare-fun m!75273 () Bool)

(assert (=> bs!3249 m!75273))

(assert (=> b!75340 d!17985))

(assert (=> d!17867 d!17871))

(declare-fun d!17987 () Bool)

(assert (=> d!17987 (not (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!17987 true))

(declare-fun _$68!58 () Unit!2157)

(assert (=> d!17987 (= (choose!68 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (Cons!1479 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) Nil!1480)) _$68!58)))

(declare-fun bs!3250 () Bool)

(assert (= bs!3250 d!17987))

(assert (=> bs!3250 m!74557))

(assert (=> bs!3250 m!74597))

(assert (=> d!17867 d!17987))

(declare-fun c!11489 () Bool)

(declare-fun call!6771 () ListLongMap!1423)

(declare-fun c!11490 () Bool)

(declare-fun call!6774 () ListLongMap!1423)

(declare-fun bm!6767 () Bool)

(declare-fun call!6776 () ListLongMap!1423)

(declare-fun call!6775 () ListLongMap!1423)

(assert (=> bm!6767 (= call!6776 (+!96 (ite c!11489 call!6774 (ite c!11490 call!6775 call!6771)) (ite (or c!11489 c!11490) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!11408 c!11410) lt!33806 (zeroValue!2134 newMap!16))) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16))))))))

(declare-fun b!75588 () Bool)

(declare-fun e!49390 () Bool)

(assert (=> b!75588 (= e!49390 (validKeyInArray!0 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6768 () Bool)

(assert (=> bm!6768 (= call!6771 call!6775)))

(declare-fun b!75589 () Bool)

(declare-fun e!49382 () Bool)

(declare-fun call!6770 () Bool)

(assert (=> b!75589 (= e!49382 (not call!6770))))

(declare-fun b!75590 () Bool)

(declare-fun e!49393 () Bool)

(declare-fun call!6772 () Bool)

(assert (=> b!75590 (= e!49393 (not call!6772))))

(declare-fun b!75591 () Bool)

(declare-fun res!39849 () Bool)

(declare-fun e!49386 () Bool)

(assert (=> b!75591 (=> (not res!39849) (not e!49386))))

(assert (=> b!75591 (= res!39849 e!49393)))

(declare-fun c!11486 () Bool)

(assert (=> b!75591 (= c!11486 (not (= (bvand (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!6769 () Bool)

(assert (=> bm!6769 (= call!6775 call!6774)))

(declare-fun b!75592 () Bool)

(declare-fun e!49384 () Bool)

(declare-fun e!49391 () Bool)

(assert (=> b!75592 (= e!49384 e!49391)))

(declare-fun res!39848 () Bool)

(assert (=> b!75592 (=> (not res!39848) (not e!49391))))

(declare-fun lt!34216 () ListLongMap!1423)

(assert (=> b!75592 (= res!39848 (contains!727 lt!34216 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!75592 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(declare-fun d!17989 () Bool)

(assert (=> d!17989 e!49386))

(declare-fun res!39851 () Bool)

(assert (=> d!17989 (=> (not res!39851) (not e!49386))))

(assert (=> d!17989 (= res!39851 (or (bvsge #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))))

(declare-fun lt!34206 () ListLongMap!1423)

(assert (=> d!17989 (= lt!34216 lt!34206)))

(declare-fun lt!34203 () Unit!2157)

(declare-fun e!49387 () Unit!2157)

(assert (=> d!17989 (= lt!34203 e!49387)))

(declare-fun c!11487 () Bool)

(declare-fun e!49389 () Bool)

(assert (=> d!17989 (= c!11487 e!49389)))

(declare-fun res!39850 () Bool)

(assert (=> d!17989 (=> (not res!39850) (not e!49389))))

(assert (=> d!17989 (= res!39850 (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(declare-fun e!49383 () ListLongMap!1423)

(assert (=> d!17989 (= lt!34206 e!49383)))

(assert (=> d!17989 (= c!11489 (and (not (= (bvand (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!17989 (validMask!0 (mask!6211 newMap!16))))

(assert (=> d!17989 (= (getCurrentListMap!424 (_keys!3890 newMap!16) (ite c!11408 (_values!2217 newMap!16) lt!34058) (mask!6211 newMap!16) (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) (ite (and c!11408 c!11410) lt!33806 (zeroValue!2134 newMap!16)) (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)) lt!34216)))

(declare-fun b!75593 () Bool)

(declare-fun e!49388 () ListLongMap!1423)

(declare-fun call!6773 () ListLongMap!1423)

(assert (=> b!75593 (= e!49388 call!6773)))

(declare-fun b!75594 () Bool)

(declare-fun lt!34212 () Unit!2157)

(assert (=> b!75594 (= e!49387 lt!34212)))

(declare-fun lt!34202 () ListLongMap!1423)

(assert (=> b!75594 (= lt!34202 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (ite c!11408 (_values!2217 newMap!16) lt!34058) (mask!6211 newMap!16) (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) (ite (and c!11408 c!11410) lt!33806 (zeroValue!2134 newMap!16)) (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34201 () (_ BitVec 64))

(assert (=> b!75594 (= lt!34201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34210 () (_ BitVec 64))

(assert (=> b!75594 (= lt!34210 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34215 () Unit!2157)

(assert (=> b!75594 (= lt!34215 (addStillContains!52 lt!34202 lt!34201 (ite (and c!11408 c!11410) lt!33806 (zeroValue!2134 newMap!16)) lt!34210))))

(assert (=> b!75594 (contains!727 (+!96 lt!34202 (tuple2!2133 lt!34201 (ite (and c!11408 c!11410) lt!33806 (zeroValue!2134 newMap!16)))) lt!34210)))

(declare-fun lt!34198 () Unit!2157)

(assert (=> b!75594 (= lt!34198 lt!34215)))

(declare-fun lt!34200 () ListLongMap!1423)

(assert (=> b!75594 (= lt!34200 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (ite c!11408 (_values!2217 newMap!16) lt!34058) (mask!6211 newMap!16) (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) (ite (and c!11408 c!11410) lt!33806 (zeroValue!2134 newMap!16)) (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34218 () (_ BitVec 64))

(assert (=> b!75594 (= lt!34218 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34214 () (_ BitVec 64))

(assert (=> b!75594 (= lt!34214 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34199 () Unit!2157)

(assert (=> b!75594 (= lt!34199 (addApplyDifferent!52 lt!34200 lt!34218 (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16)) lt!34214))))

(assert (=> b!75594 (= (apply!76 (+!96 lt!34200 (tuple2!2133 lt!34218 (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16)))) lt!34214) (apply!76 lt!34200 lt!34214))))

(declare-fun lt!34204 () Unit!2157)

(assert (=> b!75594 (= lt!34204 lt!34199)))

(declare-fun lt!34208 () ListLongMap!1423)

(assert (=> b!75594 (= lt!34208 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (ite c!11408 (_values!2217 newMap!16) lt!34058) (mask!6211 newMap!16) (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) (ite (and c!11408 c!11410) lt!33806 (zeroValue!2134 newMap!16)) (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34197 () (_ BitVec 64))

(assert (=> b!75594 (= lt!34197 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34207 () (_ BitVec 64))

(assert (=> b!75594 (= lt!34207 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34205 () Unit!2157)

(assert (=> b!75594 (= lt!34205 (addApplyDifferent!52 lt!34208 lt!34197 (ite (and c!11408 c!11410) lt!33806 (zeroValue!2134 newMap!16)) lt!34207))))

(assert (=> b!75594 (= (apply!76 (+!96 lt!34208 (tuple2!2133 lt!34197 (ite (and c!11408 c!11410) lt!33806 (zeroValue!2134 newMap!16)))) lt!34207) (apply!76 lt!34208 lt!34207))))

(declare-fun lt!34211 () Unit!2157)

(assert (=> b!75594 (= lt!34211 lt!34205)))

(declare-fun lt!34213 () ListLongMap!1423)

(assert (=> b!75594 (= lt!34213 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (ite c!11408 (_values!2217 newMap!16) lt!34058) (mask!6211 newMap!16) (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) (ite (and c!11408 c!11410) lt!33806 (zeroValue!2134 newMap!16)) (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34217 () (_ BitVec 64))

(assert (=> b!75594 (= lt!34217 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34209 () (_ BitVec 64))

(assert (=> b!75594 (= lt!34209 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75594 (= lt!34212 (addApplyDifferent!52 lt!34213 lt!34217 (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16)) lt!34209))))

(assert (=> b!75594 (= (apply!76 (+!96 lt!34213 (tuple2!2133 lt!34217 (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16)))) lt!34209) (apply!76 lt!34213 lt!34209))))

(declare-fun b!75595 () Bool)

(declare-fun c!11485 () Bool)

(assert (=> b!75595 (= c!11485 (and (not (= (bvand (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!49392 () ListLongMap!1423)

(assert (=> b!75595 (= e!49388 e!49392)))

(declare-fun bm!6770 () Bool)

(assert (=> bm!6770 (= call!6774 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (ite c!11408 (_values!2217 newMap!16) lt!34058) (mask!6211 newMap!16) (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) (ite (and c!11408 c!11410) lt!33806 (zeroValue!2134 newMap!16)) (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun b!75596 () Bool)

(declare-fun res!39847 () Bool)

(assert (=> b!75596 (=> (not res!39847) (not e!49386))))

(assert (=> b!75596 (= res!39847 e!49384)))

(declare-fun res!39855 () Bool)

(assert (=> b!75596 (=> res!39855 e!49384)))

(assert (=> b!75596 (= res!39855 (not e!49390))))

(declare-fun res!39853 () Bool)

(assert (=> b!75596 (=> (not res!39853) (not e!49390))))

(assert (=> b!75596 (= res!39853 (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(declare-fun b!75597 () Bool)

(assert (=> b!75597 (= e!49389 (validKeyInArray!0 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75598 () Bool)

(declare-fun e!49385 () Bool)

(assert (=> b!75598 (= e!49393 e!49385)))

(declare-fun res!39852 () Bool)

(assert (=> b!75598 (= res!39852 call!6772)))

(assert (=> b!75598 (=> (not res!39852) (not e!49385))))

(declare-fun b!75599 () Bool)

(assert (=> b!75599 (= e!49385 (= (apply!76 lt!34216 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!11408 c!11410) lt!33806 (zeroValue!2134 newMap!16))))))

(declare-fun b!75600 () Bool)

(assert (=> b!75600 (= e!49392 call!6773)))

(declare-fun b!75601 () Bool)

(declare-fun e!49381 () Bool)

(assert (=> b!75601 (= e!49381 (= (apply!76 lt!34216 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16))))))

(declare-fun b!75602 () Bool)

(assert (=> b!75602 (= e!49386 e!49382)))

(declare-fun c!11488 () Bool)

(assert (=> b!75602 (= c!11488 (not (= (bvand (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75603 () Bool)

(assert (=> b!75603 (= e!49383 (+!96 call!6776 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!11408 (ite c!11410 (minValue!2134 newMap!16) lt!33806) (minValue!2134 newMap!16)))))))

(declare-fun b!75604 () Bool)

(assert (=> b!75604 (= e!49383 e!49388)))

(assert (=> b!75604 (= c!11490 (and (not (= (bvand (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!11408 (ite c!11410 lt!34063 lt!34065) (extraKeys!2089 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6771 () Bool)

(assert (=> bm!6771 (= call!6770 (contains!727 lt!34216 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6772 () Bool)

(assert (=> bm!6772 (= call!6773 call!6776)))

(declare-fun b!75605 () Bool)

(assert (=> b!75605 (= e!49382 e!49381)))

(declare-fun res!39854 () Bool)

(assert (=> b!75605 (= res!39854 call!6770)))

(assert (=> b!75605 (=> (not res!39854) (not e!49381))))

(declare-fun b!75606 () Bool)

(assert (=> b!75606 (= e!49392 call!6771)))

(declare-fun b!75607 () Bool)

(declare-fun Unit!2178 () Unit!2157)

(assert (=> b!75607 (= e!49387 Unit!2178)))

(declare-fun bm!6773 () Bool)

(assert (=> bm!6773 (= call!6772 (contains!727 lt!34216 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75608 () Bool)

(assert (=> b!75608 (= e!49391 (= (apply!76 lt!34216 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)) (get!1146 (select (arr!1866 (ite c!11408 (_values!2217 newMap!16) lt!34058)) #b00000000000000000000000000000000) (dynLambda!327 (defaultEntry!2234 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75608 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2105 (ite c!11408 (_values!2217 newMap!16) lt!34058))))))

(assert (=> b!75608 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(assert (= (and d!17989 c!11489) b!75603))

(assert (= (and d!17989 (not c!11489)) b!75604))

(assert (= (and b!75604 c!11490) b!75593))

(assert (= (and b!75604 (not c!11490)) b!75595))

(assert (= (and b!75595 c!11485) b!75600))

(assert (= (and b!75595 (not c!11485)) b!75606))

(assert (= (or b!75600 b!75606) bm!6768))

(assert (= (or b!75593 bm!6768) bm!6769))

(assert (= (or b!75593 b!75600) bm!6772))

(assert (= (or b!75603 bm!6769) bm!6770))

(assert (= (or b!75603 bm!6772) bm!6767))

(assert (= (and d!17989 res!39850) b!75597))

(assert (= (and d!17989 c!11487) b!75594))

(assert (= (and d!17989 (not c!11487)) b!75607))

(assert (= (and d!17989 res!39851) b!75596))

(assert (= (and b!75596 res!39853) b!75588))

(assert (= (and b!75596 (not res!39855)) b!75592))

(assert (= (and b!75592 res!39848) b!75608))

(assert (= (and b!75596 res!39847) b!75591))

(assert (= (and b!75591 c!11486) b!75598))

(assert (= (and b!75591 (not c!11486)) b!75590))

(assert (= (and b!75598 res!39852) b!75599))

(assert (= (or b!75598 b!75590) bm!6773))

(assert (= (and b!75591 res!39849) b!75602))

(assert (= (and b!75602 c!11488) b!75605))

(assert (= (and b!75602 (not c!11488)) b!75589))

(assert (= (and b!75605 res!39854) b!75601))

(assert (= (or b!75605 b!75589) bm!6771))

(declare-fun b_lambda!3397 () Bool)

(assert (=> (not b_lambda!3397) (not b!75608)))

(assert (=> b!75608 t!5069))

(declare-fun b_and!4631 () Bool)

(assert (= b_and!4627 (and (=> t!5069 result!2721) b_and!4631)))

(assert (=> b!75608 t!5071))

(declare-fun b_and!4633 () Bool)

(assert (= b_and!4629 (and (=> t!5071 result!2723) b_and!4633)))

(declare-fun m!75275 () Bool)

(assert (=> bm!6771 m!75275))

(declare-fun m!75277 () Bool)

(assert (=> b!75599 m!75277))

(assert (=> b!75588 m!74945))

(assert (=> b!75588 m!74945))

(assert (=> b!75588 m!75165))

(declare-fun m!75279 () Bool)

(assert (=> b!75601 m!75279))

(declare-fun m!75281 () Bool)

(assert (=> b!75594 m!75281))

(declare-fun m!75283 () Bool)

(assert (=> b!75594 m!75283))

(declare-fun m!75285 () Bool)

(assert (=> b!75594 m!75285))

(declare-fun m!75287 () Bool)

(assert (=> b!75594 m!75287))

(declare-fun m!75289 () Bool)

(assert (=> b!75594 m!75289))

(declare-fun m!75291 () Bool)

(assert (=> b!75594 m!75291))

(assert (=> b!75594 m!75287))

(declare-fun m!75293 () Bool)

(assert (=> b!75594 m!75293))

(declare-fun m!75295 () Bool)

(assert (=> b!75594 m!75295))

(declare-fun m!75297 () Bool)

(assert (=> b!75594 m!75297))

(assert (=> b!75594 m!75295))

(declare-fun m!75299 () Bool)

(assert (=> b!75594 m!75299))

(declare-fun m!75301 () Bool)

(assert (=> b!75594 m!75301))

(declare-fun m!75303 () Bool)

(assert (=> b!75594 m!75303))

(declare-fun m!75305 () Bool)

(assert (=> b!75594 m!75305))

(declare-fun m!75307 () Bool)

(assert (=> b!75594 m!75307))

(assert (=> b!75594 m!75299))

(assert (=> b!75594 m!74945))

(assert (=> b!75594 m!75305))

(declare-fun m!75309 () Bool)

(assert (=> b!75594 m!75309))

(declare-fun m!75311 () Bool)

(assert (=> b!75594 m!75311))

(declare-fun m!75313 () Bool)

(assert (=> b!75603 m!75313))

(assert (=> b!75592 m!74945))

(assert (=> b!75592 m!74945))

(declare-fun m!75315 () Bool)

(assert (=> b!75592 m!75315))

(declare-fun m!75317 () Bool)

(assert (=> bm!6767 m!75317))

(assert (=> b!75608 m!75207))

(assert (=> b!75608 m!74945))

(declare-fun m!75319 () Bool)

(assert (=> b!75608 m!75319))

(declare-fun m!75321 () Bool)

(assert (=> b!75608 m!75321))

(assert (=> b!75608 m!75207))

(declare-fun m!75323 () Bool)

(assert (=> b!75608 m!75323))

(assert (=> b!75608 m!74945))

(assert (=> b!75608 m!75321))

(assert (=> d!17989 m!75125))

(assert (=> bm!6770 m!75291))

(assert (=> b!75597 m!74945))

(assert (=> b!75597 m!74945))

(assert (=> b!75597 m!75165))

(declare-fun m!75325 () Bool)

(assert (=> bm!6773 m!75325))

(assert (=> bm!6721 d!17989))

(declare-fun d!17991 () Bool)

(declare-fun res!39860 () Bool)

(declare-fun e!49398 () Bool)

(assert (=> d!17991 (=> res!39860 e!49398)))

(assert (=> d!17991 (= res!39860 (and ((_ is Cons!1478) (toList!727 lt!33808)) (= (_1!1077 (h!2066 (toList!727 lt!33808))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355))))))

(assert (=> d!17991 (= (containsKey!138 (toList!727 lt!33808) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) e!49398)))

(declare-fun b!75613 () Bool)

(declare-fun e!49399 () Bool)

(assert (=> b!75613 (= e!49398 e!49399)))

(declare-fun res!39861 () Bool)

(assert (=> b!75613 (=> (not res!39861) (not e!49399))))

(assert (=> b!75613 (= res!39861 (and (or (not ((_ is Cons!1478) (toList!727 lt!33808))) (bvsle (_1!1077 (h!2066 (toList!727 lt!33808))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355))) ((_ is Cons!1478) (toList!727 lt!33808)) (bvslt (_1!1077 (h!2066 (toList!727 lt!33808))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355))))))

(declare-fun b!75614 () Bool)

(assert (=> b!75614 (= e!49399 (containsKey!138 (t!5060 (toList!727 lt!33808)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (= (and d!17991 (not res!39860)) b!75613))

(assert (= (and b!75613 res!39861) b!75614))

(assert (=> b!75614 m!74557))

(declare-fun m!75327 () Bool)

(assert (=> b!75614 m!75327))

(assert (=> d!17863 d!17991))

(declare-fun d!17993 () Bool)

(declare-fun e!49400 () Bool)

(assert (=> d!17993 e!49400))

(declare-fun res!39862 () Bool)

(assert (=> d!17993 (=> (not res!39862) (not e!49400))))

(declare-fun lt!34219 () ListLongMap!1423)

(assert (=> d!17993 (= res!39862 (contains!727 lt!34219 (_1!1077 (ite (or c!11359 c!11360) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992))))))))))

(declare-fun lt!34221 () List!1482)

(assert (=> d!17993 (= lt!34219 (ListLongMap!1424 lt!34221))))

(declare-fun lt!34220 () Unit!2157)

(declare-fun lt!34222 () Unit!2157)

(assert (=> d!17993 (= lt!34220 lt!34222)))

(assert (=> d!17993 (= (getValueByKey!134 lt!34221 (_1!1077 (ite (or c!11359 c!11360) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992))))))) (Some!139 (_2!1077 (ite (or c!11359 c!11360) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992))))))))))

(assert (=> d!17993 (= lt!34222 (lemmaContainsTupThenGetReturnValue!51 lt!34221 (_1!1077 (ite (or c!11359 c!11360) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))) (_2!1077 (ite (or c!11359 c!11360) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992))))))))))

(assert (=> d!17993 (= lt!34221 (insertStrictlySorted!54 (toList!727 (ite c!11359 call!6662 (ite c!11360 call!6663 call!6659))) (_1!1077 (ite (or c!11359 c!11360) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))) (_2!1077 (ite (or c!11359 c!11360) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992))))))))))

(assert (=> d!17993 (= (+!96 (ite c!11359 call!6662 (ite c!11360 call!6663 call!6659)) (ite (or c!11359 c!11360) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))) lt!34219)))

(declare-fun b!75615 () Bool)

(declare-fun res!39863 () Bool)

(assert (=> b!75615 (=> (not res!39863) (not e!49400))))

(assert (=> b!75615 (= res!39863 (= (getValueByKey!134 (toList!727 lt!34219) (_1!1077 (ite (or c!11359 c!11360) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992))))))) (Some!139 (_2!1077 (ite (or c!11359 c!11360) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))))

(declare-fun b!75616 () Bool)

(assert (=> b!75616 (= e!49400 (contains!729 (toList!727 lt!34219) (ite (or c!11359 c!11360) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (= (and d!17993 res!39862) b!75615))

(assert (= (and b!75615 res!39863) b!75616))

(declare-fun m!75329 () Bool)

(assert (=> d!17993 m!75329))

(declare-fun m!75331 () Bool)

(assert (=> d!17993 m!75331))

(declare-fun m!75333 () Bool)

(assert (=> d!17993 m!75333))

(declare-fun m!75335 () Bool)

(assert (=> d!17993 m!75335))

(declare-fun m!75337 () Bool)

(assert (=> b!75615 m!75337))

(declare-fun m!75339 () Bool)

(assert (=> b!75616 m!75339))

(assert (=> bm!6655 d!17993))

(assert (=> b!75369 d!17887))

(declare-fun d!17995 () Bool)

(declare-fun e!49403 () Bool)

(assert (=> d!17995 e!49403))

(declare-fun res!39866 () Bool)

(assert (=> d!17995 (=> (not res!39866) (not e!49403))))

(assert (=> d!17995 (= res!39866 (and (bvsge (index!3081 lt!34048) #b00000000000000000000000000000000) (bvslt (index!3081 lt!34048) (size!2104 (_keys!3890 newMap!16)))))))

(declare-fun lt!34225 () Unit!2157)

(declare-fun choose!434 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 32) Int) Unit!2157)

(assert (=> d!17995 (= lt!34225 (choose!434 (_keys!3890 newMap!16) lt!34058 (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (index!3081 lt!34048) (defaultEntry!2234 newMap!16)))))

(assert (=> d!17995 (validMask!0 (mask!6211 newMap!16))))

(assert (=> d!17995 (= (lemmaValidKeyInArrayIsInListMap!86 (_keys!3890 newMap!16) lt!34058 (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (index!3081 lt!34048) (defaultEntry!2234 newMap!16)) lt!34225)))

(declare-fun b!75619 () Bool)

(assert (=> b!75619 (= e!49403 (contains!727 (getCurrentListMap!424 (_keys!3890 newMap!16) lt!34058 (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)) (select (arr!1865 (_keys!3890 newMap!16)) (index!3081 lt!34048))))))

(assert (= (and d!17995 res!39866) b!75619))

(declare-fun m!75341 () Bool)

(assert (=> d!17995 m!75341))

(assert (=> d!17995 m!75125))

(declare-fun m!75343 () Bool)

(assert (=> b!75619 m!75343))

(assert (=> b!75619 m!74847))

(assert (=> b!75619 m!75343))

(assert (=> b!75619 m!74847))

(declare-fun m!75345 () Bool)

(assert (=> b!75619 m!75345))

(assert (=> b!75342 d!17995))

(declare-fun d!17997 () Bool)

(declare-fun e!49406 () Bool)

(assert (=> d!17997 e!49406))

(declare-fun res!39869 () Bool)

(assert (=> d!17997 (=> (not res!39869) (not e!49406))))

(assert (=> d!17997 (= res!39869 (and (bvsge (index!3081 lt!34048) #b00000000000000000000000000000000) (bvslt (index!3081 lt!34048) (size!2105 (_values!2217 newMap!16)))))))

(declare-fun lt!34228 () Unit!2157)

(declare-fun choose!435 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 32) (_ BitVec 64) V!2955 Int) Unit!2157)

(assert (=> d!17997 (= lt!34228 (choose!435 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (index!3081 lt!34048) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806 (defaultEntry!2234 newMap!16)))))

(assert (=> d!17997 (validMask!0 (mask!6211 newMap!16))))

(assert (=> d!17997 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!25 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (index!3081 lt!34048) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806 (defaultEntry!2234 newMap!16)) lt!34228)))

(declare-fun b!75622 () Bool)

(assert (=> b!75622 (= e!49406 (= (+!96 (getCurrentListMap!424 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) (getCurrentListMap!424 (_keys!3890 newMap!16) (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (index!3081 lt!34048) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16))) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16))))))

(assert (= (and d!17997 res!39869) b!75622))

(assert (=> d!17997 m!74557))

(declare-fun m!75347 () Bool)

(assert (=> d!17997 m!75347))

(assert (=> d!17997 m!75125))

(assert (=> b!75622 m!74667))

(assert (=> b!75622 m!74667))

(declare-fun m!75349 () Bool)

(assert (=> b!75622 m!75349))

(assert (=> b!75622 m!74841))

(declare-fun m!75351 () Bool)

(assert (=> b!75622 m!75351))

(assert (=> b!75342 d!17997))

(declare-fun d!17999 () Bool)

(declare-fun e!49408 () Bool)

(assert (=> d!17999 e!49408))

(declare-fun res!39870 () Bool)

(assert (=> d!17999 (=> res!39870 e!49408)))

(declare-fun lt!34232 () Bool)

(assert (=> d!17999 (= res!39870 (not lt!34232))))

(declare-fun lt!34229 () Bool)

(assert (=> d!17999 (= lt!34232 lt!34229)))

(declare-fun lt!34230 () Unit!2157)

(declare-fun e!49407 () Unit!2157)

(assert (=> d!17999 (= lt!34230 e!49407)))

(declare-fun c!11491 () Bool)

(assert (=> d!17999 (= c!11491 lt!34229)))

(assert (=> d!17999 (= lt!34229 (containsKey!138 (toList!727 call!6728) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (=> d!17999 (= (contains!727 call!6728 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) lt!34232)))

(declare-fun b!75623 () Bool)

(declare-fun lt!34231 () Unit!2157)

(assert (=> b!75623 (= e!49407 lt!34231)))

(assert (=> b!75623 (= lt!34231 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 call!6728) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (=> b!75623 (isDefined!87 (getValueByKey!134 (toList!727 call!6728) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun b!75624 () Bool)

(declare-fun Unit!2179 () Unit!2157)

(assert (=> b!75624 (= e!49407 Unit!2179)))

(declare-fun b!75625 () Bool)

(assert (=> b!75625 (= e!49408 (isDefined!87 (getValueByKey!134 (toList!727 call!6728) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355))))))

(assert (= (and d!17999 c!11491) b!75623))

(assert (= (and d!17999 (not c!11491)) b!75624))

(assert (= (and d!17999 (not res!39870)) b!75625))

(assert (=> d!17999 m!74557))

(declare-fun m!75353 () Bool)

(assert (=> d!17999 m!75353))

(assert (=> b!75623 m!74557))

(declare-fun m!75355 () Bool)

(assert (=> b!75623 m!75355))

(assert (=> b!75623 m!74557))

(declare-fun m!75357 () Bool)

(assert (=> b!75623 m!75357))

(assert (=> b!75623 m!75357))

(declare-fun m!75359 () Bool)

(assert (=> b!75623 m!75359))

(assert (=> b!75625 m!74557))

(assert (=> b!75625 m!75357))

(assert (=> b!75625 m!75357))

(assert (=> b!75625 m!75359))

(assert (=> b!75342 d!17999))

(declare-fun d!18001 () Bool)

(assert (=> d!18001 (= (inRange!0 (ite c!11419 (ite c!11418 (index!3081 lt!34051) (ite c!11420 (index!3080 lt!34066) (index!3083 lt!34066))) (ite c!11415 (index!3081 lt!34045) (ite c!11413 (index!3080 lt!34040) (index!3083 lt!34040)))) (mask!6211 newMap!16)) (and (bvsge (ite c!11419 (ite c!11418 (index!3081 lt!34051) (ite c!11420 (index!3080 lt!34066) (index!3083 lt!34066))) (ite c!11415 (index!3081 lt!34045) (ite c!11413 (index!3080 lt!34040) (index!3083 lt!34040)))) #b00000000000000000000000000000000) (bvslt (ite c!11419 (ite c!11418 (index!3081 lt!34051) (ite c!11420 (index!3080 lt!34066) (index!3083 lt!34066))) (ite c!11415 (index!3081 lt!34045) (ite c!11413 (index!3080 lt!34040) (index!3083 lt!34040)))) (bvadd (mask!6211 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!6722 d!18001))

(declare-fun call!6782 () ListLongMap!1423)

(declare-fun call!6783 () ListLongMap!1423)

(declare-fun c!11497 () Bool)

(declare-fun bm!6774 () Bool)

(declare-fun call!6778 () ListLongMap!1423)

(declare-fun call!6781 () ListLongMap!1423)

(declare-fun c!11496 () Bool)

(assert (=> bm!6774 (= call!6783 (+!96 (ite c!11496 call!6781 (ite c!11497 call!6782 call!6778)) (ite (or c!11496 c!11497) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 newMap!16)) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 newMap!16)))))))

(declare-fun b!75626 () Bool)

(declare-fun e!49418 () Bool)

(assert (=> b!75626 (= e!49418 (validKeyInArray!0 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6775 () Bool)

(assert (=> bm!6775 (= call!6778 call!6782)))

(declare-fun b!75627 () Bool)

(declare-fun e!49410 () Bool)

(declare-fun call!6777 () Bool)

(assert (=> b!75627 (= e!49410 (not call!6777))))

(declare-fun b!75628 () Bool)

(declare-fun e!49421 () Bool)

(declare-fun call!6779 () Bool)

(assert (=> b!75628 (= e!49421 (not call!6779))))

(declare-fun b!75629 () Bool)

(declare-fun res!39873 () Bool)

(declare-fun e!49414 () Bool)

(assert (=> b!75629 (=> (not res!39873) (not e!49414))))

(assert (=> b!75629 (= res!39873 e!49421)))

(declare-fun c!11493 () Bool)

(assert (=> b!75629 (= c!11493 (not (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!6776 () Bool)

(assert (=> bm!6776 (= call!6782 call!6781)))

(declare-fun b!75630 () Bool)

(declare-fun e!49412 () Bool)

(declare-fun e!49419 () Bool)

(assert (=> b!75630 (= e!49412 e!49419)))

(declare-fun res!39872 () Bool)

(assert (=> b!75630 (=> (not res!39872) (not e!49419))))

(declare-fun lt!34252 () ListLongMap!1423)

(assert (=> b!75630 (= res!39872 (contains!727 lt!34252 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!75630 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(declare-fun d!18003 () Bool)

(assert (=> d!18003 e!49414))

(declare-fun res!39875 () Bool)

(assert (=> d!18003 (=> (not res!39875) (not e!49414))))

(assert (=> d!18003 (= res!39875 (or (bvsge #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))))

(declare-fun lt!34242 () ListLongMap!1423)

(assert (=> d!18003 (= lt!34252 lt!34242)))

(declare-fun lt!34239 () Unit!2157)

(declare-fun e!49415 () Unit!2157)

(assert (=> d!18003 (= lt!34239 e!49415)))

(declare-fun c!11494 () Bool)

(declare-fun e!49417 () Bool)

(assert (=> d!18003 (= c!11494 e!49417)))

(declare-fun res!39874 () Bool)

(assert (=> d!18003 (=> (not res!39874) (not e!49417))))

(assert (=> d!18003 (= res!39874 (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(declare-fun e!49411 () ListLongMap!1423)

(assert (=> d!18003 (= lt!34242 e!49411)))

(assert (=> d!18003 (= c!11496 (and (not (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18003 (validMask!0 (mask!6211 newMap!16))))

(assert (=> d!18003 (= (getCurrentListMap!424 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)) lt!34252)))

(declare-fun b!75631 () Bool)

(declare-fun e!49416 () ListLongMap!1423)

(declare-fun call!6780 () ListLongMap!1423)

(assert (=> b!75631 (= e!49416 call!6780)))

(declare-fun b!75632 () Bool)

(declare-fun lt!34248 () Unit!2157)

(assert (=> b!75632 (= e!49415 lt!34248)))

(declare-fun lt!34238 () ListLongMap!1423)

(assert (=> b!75632 (= lt!34238 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34237 () (_ BitVec 64))

(assert (=> b!75632 (= lt!34237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34246 () (_ BitVec 64))

(assert (=> b!75632 (= lt!34246 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34251 () Unit!2157)

(assert (=> b!75632 (= lt!34251 (addStillContains!52 lt!34238 lt!34237 (zeroValue!2134 newMap!16) lt!34246))))

(assert (=> b!75632 (contains!727 (+!96 lt!34238 (tuple2!2133 lt!34237 (zeroValue!2134 newMap!16))) lt!34246)))

(declare-fun lt!34234 () Unit!2157)

(assert (=> b!75632 (= lt!34234 lt!34251)))

(declare-fun lt!34236 () ListLongMap!1423)

(assert (=> b!75632 (= lt!34236 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34254 () (_ BitVec 64))

(assert (=> b!75632 (= lt!34254 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34250 () (_ BitVec 64))

(assert (=> b!75632 (= lt!34250 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34235 () Unit!2157)

(assert (=> b!75632 (= lt!34235 (addApplyDifferent!52 lt!34236 lt!34254 (minValue!2134 newMap!16) lt!34250))))

(assert (=> b!75632 (= (apply!76 (+!96 lt!34236 (tuple2!2133 lt!34254 (minValue!2134 newMap!16))) lt!34250) (apply!76 lt!34236 lt!34250))))

(declare-fun lt!34240 () Unit!2157)

(assert (=> b!75632 (= lt!34240 lt!34235)))

(declare-fun lt!34244 () ListLongMap!1423)

(assert (=> b!75632 (= lt!34244 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34233 () (_ BitVec 64))

(assert (=> b!75632 (= lt!34233 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34243 () (_ BitVec 64))

(assert (=> b!75632 (= lt!34243 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34241 () Unit!2157)

(assert (=> b!75632 (= lt!34241 (addApplyDifferent!52 lt!34244 lt!34233 (zeroValue!2134 newMap!16) lt!34243))))

(assert (=> b!75632 (= (apply!76 (+!96 lt!34244 (tuple2!2133 lt!34233 (zeroValue!2134 newMap!16))) lt!34243) (apply!76 lt!34244 lt!34243))))

(declare-fun lt!34247 () Unit!2157)

(assert (=> b!75632 (= lt!34247 lt!34241)))

(declare-fun lt!34249 () ListLongMap!1423)

(assert (=> b!75632 (= lt!34249 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34253 () (_ BitVec 64))

(assert (=> b!75632 (= lt!34253 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34245 () (_ BitVec 64))

(assert (=> b!75632 (= lt!34245 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75632 (= lt!34248 (addApplyDifferent!52 lt!34249 lt!34253 (minValue!2134 newMap!16) lt!34245))))

(assert (=> b!75632 (= (apply!76 (+!96 lt!34249 (tuple2!2133 lt!34253 (minValue!2134 newMap!16))) lt!34245) (apply!76 lt!34249 lt!34245))))

(declare-fun b!75633 () Bool)

(declare-fun c!11492 () Bool)

(assert (=> b!75633 (= c!11492 (and (not (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!49420 () ListLongMap!1423)

(assert (=> b!75633 (= e!49416 e!49420)))

(declare-fun bm!6777 () Bool)

(assert (=> bm!6777 (= call!6781 (getCurrentListMapNoExtraKeys!61 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun b!75634 () Bool)

(declare-fun res!39871 () Bool)

(assert (=> b!75634 (=> (not res!39871) (not e!49414))))

(assert (=> b!75634 (= res!39871 e!49412)))

(declare-fun res!39879 () Bool)

(assert (=> b!75634 (=> res!39879 e!49412)))

(assert (=> b!75634 (= res!39879 (not e!49418))))

(declare-fun res!39877 () Bool)

(assert (=> b!75634 (=> (not res!39877) (not e!49418))))

(assert (=> b!75634 (= res!39877 (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(declare-fun b!75635 () Bool)

(assert (=> b!75635 (= e!49417 (validKeyInArray!0 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75636 () Bool)

(declare-fun e!49413 () Bool)

(assert (=> b!75636 (= e!49421 e!49413)))

(declare-fun res!39876 () Bool)

(assert (=> b!75636 (= res!39876 call!6779)))

(assert (=> b!75636 (=> (not res!39876) (not e!49413))))

(declare-fun b!75637 () Bool)

(assert (=> b!75637 (= e!49413 (= (apply!76 lt!34252 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2134 newMap!16)))))

(declare-fun b!75638 () Bool)

(assert (=> b!75638 (= e!49420 call!6780)))

(declare-fun b!75639 () Bool)

(declare-fun e!49409 () Bool)

(assert (=> b!75639 (= e!49409 (= (apply!76 lt!34252 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2134 newMap!16)))))

(declare-fun b!75640 () Bool)

(assert (=> b!75640 (= e!49414 e!49410)))

(declare-fun c!11495 () Bool)

(assert (=> b!75640 (= c!11495 (not (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75641 () Bool)

(assert (=> b!75641 (= e!49411 (+!96 call!6783 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 newMap!16))))))

(declare-fun b!75642 () Bool)

(assert (=> b!75642 (= e!49411 e!49416)))

(assert (=> b!75642 (= c!11497 (and (not (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2089 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6778 () Bool)

(assert (=> bm!6778 (= call!6777 (contains!727 lt!34252 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6779 () Bool)

(assert (=> bm!6779 (= call!6780 call!6783)))

(declare-fun b!75643 () Bool)

(assert (=> b!75643 (= e!49410 e!49409)))

(declare-fun res!39878 () Bool)

(assert (=> b!75643 (= res!39878 call!6777)))

(assert (=> b!75643 (=> (not res!39878) (not e!49409))))

(declare-fun b!75644 () Bool)

(assert (=> b!75644 (= e!49420 call!6778)))

(declare-fun b!75645 () Bool)

(declare-fun Unit!2180 () Unit!2157)

(assert (=> b!75645 (= e!49415 Unit!2180)))

(declare-fun bm!6780 () Bool)

(assert (=> bm!6780 (= call!6779 (contains!727 lt!34252 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75646 () Bool)

(assert (=> b!75646 (= e!49419 (= (apply!76 lt!34252 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)) (get!1146 (select (arr!1866 (_values!2217 newMap!16)) #b00000000000000000000000000000000) (dynLambda!327 (defaultEntry!2234 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75646 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2105 (_values!2217 newMap!16))))))

(assert (=> b!75646 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(assert (= (and d!18003 c!11496) b!75641))

(assert (= (and d!18003 (not c!11496)) b!75642))

(assert (= (and b!75642 c!11497) b!75631))

(assert (= (and b!75642 (not c!11497)) b!75633))

(assert (= (and b!75633 c!11492) b!75638))

(assert (= (and b!75633 (not c!11492)) b!75644))

(assert (= (or b!75638 b!75644) bm!6775))

(assert (= (or b!75631 bm!6775) bm!6776))

(assert (= (or b!75631 b!75638) bm!6779))

(assert (= (or b!75641 bm!6776) bm!6777))

(assert (= (or b!75641 bm!6779) bm!6774))

(assert (= (and d!18003 res!39874) b!75635))

(assert (= (and d!18003 c!11494) b!75632))

(assert (= (and d!18003 (not c!11494)) b!75645))

(assert (= (and d!18003 res!39875) b!75634))

(assert (= (and b!75634 res!39877) b!75626))

(assert (= (and b!75634 (not res!39879)) b!75630))

(assert (= (and b!75630 res!39872) b!75646))

(assert (= (and b!75634 res!39871) b!75629))

(assert (= (and b!75629 c!11493) b!75636))

(assert (= (and b!75629 (not c!11493)) b!75628))

(assert (= (and b!75636 res!39876) b!75637))

(assert (= (or b!75636 b!75628) bm!6780))

(assert (= (and b!75629 res!39873) b!75640))

(assert (= (and b!75640 c!11495) b!75643))

(assert (= (and b!75640 (not c!11495)) b!75627))

(assert (= (and b!75643 res!39878) b!75639))

(assert (= (or b!75643 b!75627) bm!6778))

(declare-fun b_lambda!3399 () Bool)

(assert (=> (not b_lambda!3399) (not b!75646)))

(assert (=> b!75646 t!5069))

(declare-fun b_and!4635 () Bool)

(assert (= b_and!4631 (and (=> t!5069 result!2721) b_and!4635)))

(assert (=> b!75646 t!5071))

(declare-fun b_and!4637 () Bool)

(assert (= b_and!4633 (and (=> t!5071 result!2723) b_and!4637)))

(declare-fun m!75361 () Bool)

(assert (=> bm!6778 m!75361))

(declare-fun m!75363 () Bool)

(assert (=> b!75637 m!75363))

(assert (=> b!75626 m!74945))

(assert (=> b!75626 m!74945))

(assert (=> b!75626 m!75165))

(declare-fun m!75365 () Bool)

(assert (=> b!75639 m!75365))

(declare-fun m!75367 () Bool)

(assert (=> b!75632 m!75367))

(declare-fun m!75369 () Bool)

(assert (=> b!75632 m!75369))

(declare-fun m!75371 () Bool)

(assert (=> b!75632 m!75371))

(declare-fun m!75373 () Bool)

(assert (=> b!75632 m!75373))

(declare-fun m!75375 () Bool)

(assert (=> b!75632 m!75375))

(declare-fun m!75377 () Bool)

(assert (=> b!75632 m!75377))

(assert (=> b!75632 m!75373))

(declare-fun m!75379 () Bool)

(assert (=> b!75632 m!75379))

(declare-fun m!75381 () Bool)

(assert (=> b!75632 m!75381))

(declare-fun m!75383 () Bool)

(assert (=> b!75632 m!75383))

(assert (=> b!75632 m!75381))

(declare-fun m!75385 () Bool)

(assert (=> b!75632 m!75385))

(declare-fun m!75387 () Bool)

(assert (=> b!75632 m!75387))

(declare-fun m!75389 () Bool)

(assert (=> b!75632 m!75389))

(declare-fun m!75391 () Bool)

(assert (=> b!75632 m!75391))

(declare-fun m!75393 () Bool)

(assert (=> b!75632 m!75393))

(assert (=> b!75632 m!75385))

(assert (=> b!75632 m!74945))

(assert (=> b!75632 m!75391))

(declare-fun m!75395 () Bool)

(assert (=> b!75632 m!75395))

(declare-fun m!75397 () Bool)

(assert (=> b!75632 m!75397))

(declare-fun m!75399 () Bool)

(assert (=> b!75641 m!75399))

(assert (=> b!75630 m!74945))

(assert (=> b!75630 m!74945))

(declare-fun m!75401 () Bool)

(assert (=> b!75630 m!75401))

(declare-fun m!75403 () Bool)

(assert (=> bm!6774 m!75403))

(assert (=> b!75646 m!75207))

(assert (=> b!75646 m!74945))

(declare-fun m!75405 () Bool)

(assert (=> b!75646 m!75405))

(declare-fun m!75407 () Bool)

(assert (=> b!75646 m!75407))

(assert (=> b!75646 m!75207))

(declare-fun m!75409 () Bool)

(assert (=> b!75646 m!75409))

(assert (=> b!75646 m!74945))

(assert (=> b!75646 m!75407))

(assert (=> d!18003 m!75125))

(assert (=> bm!6777 m!75377))

(assert (=> b!75635 m!74945))

(assert (=> b!75635 m!74945))

(assert (=> b!75635 m!75165))

(declare-fun m!75411 () Bool)

(assert (=> bm!6780 m!75411))

(assert (=> bm!6739 d!18003))

(assert (=> b!75177 d!17877))

(declare-fun b!75649 () Bool)

(declare-fun e!49423 () Option!140)

(assert (=> b!75649 (= e!49423 (getValueByKey!134 (t!5060 (toList!727 lt!33958)) (_1!1077 lt!33803)))))

(declare-fun d!18005 () Bool)

(declare-fun c!11498 () Bool)

(assert (=> d!18005 (= c!11498 (and ((_ is Cons!1478) (toList!727 lt!33958)) (= (_1!1077 (h!2066 (toList!727 lt!33958))) (_1!1077 lt!33803))))))

(declare-fun e!49422 () Option!140)

(assert (=> d!18005 (= (getValueByKey!134 (toList!727 lt!33958) (_1!1077 lt!33803)) e!49422)))

(declare-fun b!75648 () Bool)

(assert (=> b!75648 (= e!49422 e!49423)))

(declare-fun c!11499 () Bool)

(assert (=> b!75648 (= c!11499 (and ((_ is Cons!1478) (toList!727 lt!33958)) (not (= (_1!1077 (h!2066 (toList!727 lt!33958))) (_1!1077 lt!33803)))))))

(declare-fun b!75647 () Bool)

(assert (=> b!75647 (= e!49422 (Some!139 (_2!1077 (h!2066 (toList!727 lt!33958)))))))

(declare-fun b!75650 () Bool)

(assert (=> b!75650 (= e!49423 None!138)))

(assert (= (and d!18005 c!11498) b!75647))

(assert (= (and d!18005 (not c!11498)) b!75648))

(assert (= (and b!75648 c!11499) b!75649))

(assert (= (and b!75648 (not c!11499)) b!75650))

(declare-fun m!75413 () Bool)

(assert (=> b!75649 m!75413))

(assert (=> b!75198 d!18005))

(declare-fun b!75651 () Bool)

(declare-fun e!49424 () Bool)

(declare-fun e!49425 () Bool)

(assert (=> b!75651 (= e!49424 e!49425)))

(declare-fun c!11500 () Bool)

(assert (=> b!75651 (= c!11500 (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!75652 () Bool)

(declare-fun call!6784 () Bool)

(assert (=> b!75652 (= e!49425 call!6784)))

(declare-fun d!18007 () Bool)

(declare-fun res!39882 () Bool)

(declare-fun e!49427 () Bool)

(assert (=> d!18007 (=> res!39882 e!49427)))

(assert (=> d!18007 (= res!39882 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(assert (=> d!18007 (= (arrayNoDuplicates!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11426 (Cons!1479 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) Nil!1480) Nil!1480)) e!49427)))

(declare-fun b!75653 () Bool)

(assert (=> b!75653 (= e!49425 call!6784)))

(declare-fun b!75654 () Bool)

(assert (=> b!75654 (= e!49427 e!49424)))

(declare-fun res!39881 () Bool)

(assert (=> b!75654 (=> (not res!39881) (not e!49424))))

(declare-fun e!49426 () Bool)

(assert (=> b!75654 (= res!39881 (not e!49426))))

(declare-fun res!39880 () Bool)

(assert (=> b!75654 (=> (not res!39880) (not e!49426))))

(assert (=> b!75654 (= res!39880 (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!6781 () Bool)

(assert (=> bm!6781 (= call!6784 (arrayNoDuplicates!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!11500 (Cons!1479 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!11426 (Cons!1479 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) Nil!1480) Nil!1480)) (ite c!11426 (Cons!1479 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) Nil!1480) Nil!1480))))))

(declare-fun b!75655 () Bool)

(assert (=> b!75655 (= e!49426 (contains!730 (ite c!11426 (Cons!1479 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) Nil!1480) Nil!1480) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!18007 (not res!39882)) b!75654))

(assert (= (and b!75654 res!39880) b!75655))

(assert (= (and b!75654 res!39881) b!75651))

(assert (= (and b!75651 c!11500) b!75652))

(assert (= (and b!75651 (not c!11500)) b!75653))

(assert (= (or b!75652 b!75653) bm!6781))

(declare-fun m!75415 () Bool)

(assert (=> b!75651 m!75415))

(assert (=> b!75651 m!75415))

(declare-fun m!75417 () Bool)

(assert (=> b!75651 m!75417))

(assert (=> b!75654 m!75415))

(assert (=> b!75654 m!75415))

(assert (=> b!75654 m!75417))

(assert (=> bm!6781 m!75415))

(declare-fun m!75419 () Bool)

(assert (=> bm!6781 m!75419))

(assert (=> b!75655 m!75415))

(assert (=> b!75655 m!75415))

(declare-fun m!75421 () Bool)

(assert (=> b!75655 m!75421))

(assert (=> bm!6742 d!18007))

(declare-fun b!75657 () Bool)

(declare-fun e!49430 () Bool)

(declare-fun e!49429 () Bool)

(assert (=> b!75657 (= e!49430 e!49429)))

(declare-fun c!11501 () Bool)

(assert (=> b!75657 (= c!11501 (validKeyInArray!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!6782 () Bool)

(declare-fun call!6785 () Bool)

(assert (=> bm!6782 (= call!6785 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3890 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992)))))))

(declare-fun d!18009 () Bool)

(declare-fun res!39883 () Bool)

(assert (=> d!18009 (=> res!39883 e!49430)))

(assert (=> d!18009 (= res!39883 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(assert (=> d!18009 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3890 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992)))) e!49430)))

(declare-fun b!75656 () Bool)

(declare-fun e!49428 () Bool)

(assert (=> b!75656 (= e!49428 call!6785)))

(declare-fun b!75658 () Bool)

(assert (=> b!75658 (= e!49429 call!6785)))

(declare-fun b!75659 () Bool)

(assert (=> b!75659 (= e!49429 e!49428)))

(declare-fun lt!34256 () (_ BitVec 64))

(assert (=> b!75659 (= lt!34256 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!34255 () Unit!2157)

(assert (=> b!75659 (= lt!34255 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) lt!34256 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!75659 (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) lt!34256 #b00000000000000000000000000000000)))

(declare-fun lt!34257 () Unit!2157)

(assert (=> b!75659 (= lt!34257 lt!34255)))

(declare-fun res!39884 () Bool)

(assert (=> b!75659 (= res!39884 (= (seekEntryOrOpen!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3890 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992)))) (Found!237 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!75659 (=> (not res!39884) (not e!49428))))

(assert (= (and d!18009 (not res!39883)) b!75657))

(assert (= (and b!75657 c!11501) b!75659))

(assert (= (and b!75657 (not c!11501)) b!75658))

(assert (= (and b!75659 res!39884) b!75656))

(assert (= (or b!75656 b!75658) bm!6782))

(declare-fun m!75423 () Bool)

(assert (=> b!75657 m!75423))

(assert (=> b!75657 m!75423))

(declare-fun m!75425 () Bool)

(assert (=> b!75657 m!75425))

(declare-fun m!75427 () Bool)

(assert (=> bm!6782 m!75427))

(assert (=> b!75659 m!75423))

(declare-fun m!75429 () Bool)

(assert (=> b!75659 m!75429))

(declare-fun m!75431 () Bool)

(assert (=> b!75659 m!75431))

(assert (=> b!75659 m!75423))

(declare-fun m!75433 () Bool)

(assert (=> b!75659 m!75433))

(assert (=> bm!6667 d!18009))

(declare-fun b!75672 () Bool)

(declare-fun c!11508 () Bool)

(declare-fun lt!34266 () (_ BitVec 64))

(assert (=> b!75672 (= c!11508 (= lt!34266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49438 () SeekEntryResult!237)

(declare-fun e!49439 () SeekEntryResult!237)

(assert (=> b!75672 (= e!49438 e!49439)))

(declare-fun d!18011 () Bool)

(declare-fun lt!34264 () SeekEntryResult!237)

(assert (=> d!18011 (and (or ((_ is Undefined!237) lt!34264) (not ((_ is Found!237) lt!34264)) (and (bvsge (index!3081 lt!34264) #b00000000000000000000000000000000) (bvslt (index!3081 lt!34264) (size!2104 (_keys!3890 newMap!16))))) (or ((_ is Undefined!237) lt!34264) ((_ is Found!237) lt!34264) (not ((_ is MissingZero!237) lt!34264)) (and (bvsge (index!3080 lt!34264) #b00000000000000000000000000000000) (bvslt (index!3080 lt!34264) (size!2104 (_keys!3890 newMap!16))))) (or ((_ is Undefined!237) lt!34264) ((_ is Found!237) lt!34264) ((_ is MissingZero!237) lt!34264) (not ((_ is MissingVacant!237) lt!34264)) (and (bvsge (index!3083 lt!34264) #b00000000000000000000000000000000) (bvslt (index!3083 lt!34264) (size!2104 (_keys!3890 newMap!16))))) (or ((_ is Undefined!237) lt!34264) (ite ((_ is Found!237) lt!34264) (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3081 lt!34264)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) (ite ((_ is MissingZero!237) lt!34264) (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3080 lt!34264)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!237) lt!34264) (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3083 lt!34264)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!49437 () SeekEntryResult!237)

(assert (=> d!18011 (= lt!34264 e!49437)))

(declare-fun c!11510 () Bool)

(declare-fun lt!34265 () SeekEntryResult!237)

(assert (=> d!18011 (= c!11510 (and ((_ is Intermediate!237) lt!34265) (undefined!1049 lt!34265)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3909 (_ BitVec 32)) SeekEntryResult!237)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!18011 (= lt!34265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (mask!6211 newMap!16)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (_keys!3890 newMap!16) (mask!6211 newMap!16)))))

(assert (=> d!18011 (validMask!0 (mask!6211 newMap!16))))

(assert (=> d!18011 (= (seekEntryOrOpen!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (_keys!3890 newMap!16) (mask!6211 newMap!16)) lt!34264)))

(declare-fun b!75673 () Bool)

(assert (=> b!75673 (= e!49437 Undefined!237)))

(declare-fun b!75674 () Bool)

(assert (=> b!75674 (= e!49438 (Found!237 (index!3082 lt!34265)))))

(declare-fun b!75675 () Bool)

(assert (=> b!75675 (= e!49437 e!49438)))

(assert (=> b!75675 (= lt!34266 (select (arr!1865 (_keys!3890 newMap!16)) (index!3082 lt!34265)))))

(declare-fun c!11509 () Bool)

(assert (=> b!75675 (= c!11509 (= lt!34266 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun b!75676 () Bool)

(assert (=> b!75676 (= e!49439 (MissingZero!237 (index!3082 lt!34265)))))

(declare-fun b!75677 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3909 (_ BitVec 32)) SeekEntryResult!237)

(assert (=> b!75677 (= e!49439 (seekKeyOrZeroReturnVacant!0 (x!11297 lt!34265) (index!3082 lt!34265) (index!3082 lt!34265) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (_keys!3890 newMap!16) (mask!6211 newMap!16)))))

(assert (= (and d!18011 c!11510) b!75673))

(assert (= (and d!18011 (not c!11510)) b!75675))

(assert (= (and b!75675 c!11509) b!75674))

(assert (= (and b!75675 (not c!11509)) b!75672))

(assert (= (and b!75672 c!11508) b!75676))

(assert (= (and b!75672 (not c!11508)) b!75677))

(declare-fun m!75435 () Bool)

(assert (=> d!18011 m!75435))

(assert (=> d!18011 m!75125))

(declare-fun m!75437 () Bool)

(assert (=> d!18011 m!75437))

(declare-fun m!75439 () Bool)

(assert (=> d!18011 m!75439))

(assert (=> d!18011 m!74557))

(declare-fun m!75441 () Bool)

(assert (=> d!18011 m!75441))

(assert (=> d!18011 m!74557))

(assert (=> d!18011 m!75439))

(declare-fun m!75443 () Bool)

(assert (=> d!18011 m!75443))

(declare-fun m!75445 () Bool)

(assert (=> b!75675 m!75445))

(assert (=> b!75677 m!74557))

(declare-fun m!75447 () Bool)

(assert (=> b!75677 m!75447))

(assert (=> bm!6724 d!18011))

(declare-fun d!18013 () Bool)

(assert (=> d!18013 (= (apply!76 lt!33914 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1150 (getValueByKey!134 (toList!727 lt!33914) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3251 () Bool)

(assert (= bs!3251 d!18013))

(assert (=> bs!3251 m!74673))

(assert (=> bs!3251 m!74999))

(assert (=> bs!3251 m!74999))

(declare-fun m!75449 () Bool)

(assert (=> bs!3251 m!75449))

(assert (=> b!75142 d!18013))

(assert (=> b!75142 d!17959))

(assert (=> b!75332 d!18011))

(declare-fun d!18015 () Bool)

(assert (=> d!18015 (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) lt!33972 #b00000000000000000000000000000000)))

(declare-fun lt!34269 () Unit!2157)

(declare-fun choose!13 (array!3909 (_ BitVec 64) (_ BitVec 32)) Unit!2157)

(assert (=> d!18015 (= lt!34269 (choose!13 (_keys!3890 (v!2546 (underlying!263 thiss!992))) lt!33972 #b00000000000000000000000000000000))))

(assert (=> d!18015 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!18015 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) lt!33972 #b00000000000000000000000000000000) lt!34269)))

(declare-fun bs!3252 () Bool)

(assert (= bs!3252 d!18015))

(assert (=> bs!3252 m!74819))

(declare-fun m!75451 () Bool)

(assert (=> bs!3252 m!75451))

(assert (=> b!75211 d!18015))

(declare-fun d!18017 () Bool)

(declare-fun res!39885 () Bool)

(declare-fun e!49440 () Bool)

(assert (=> d!18017 (=> res!39885 e!49440)))

(assert (=> d!18017 (= res!39885 (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000) lt!33972))))

(assert (=> d!18017 (= (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) lt!33972 #b00000000000000000000000000000000) e!49440)))

(declare-fun b!75678 () Bool)

(declare-fun e!49441 () Bool)

(assert (=> b!75678 (= e!49440 e!49441)))

(declare-fun res!39886 () Bool)

(assert (=> b!75678 (=> (not res!39886) (not e!49441))))

(assert (=> b!75678 (= res!39886 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))))

(declare-fun b!75679 () Bool)

(assert (=> b!75679 (= e!49441 (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) lt!33972 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!18017 (not res!39885)) b!75678))

(assert (= (and b!75678 res!39886) b!75679))

(assert (=> d!18017 m!74811))

(declare-fun m!75453 () Bool)

(assert (=> b!75679 m!75453))

(assert (=> b!75211 d!18017))

(declare-fun b!75680 () Bool)

(declare-fun c!11511 () Bool)

(declare-fun lt!34272 () (_ BitVec 64))

(assert (=> b!75680 (= c!11511 (= lt!34272 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49443 () SeekEntryResult!237)

(declare-fun e!49444 () SeekEntryResult!237)

(assert (=> b!75680 (= e!49443 e!49444)))

(declare-fun d!18019 () Bool)

(declare-fun lt!34270 () SeekEntryResult!237)

(assert (=> d!18019 (and (or ((_ is Undefined!237) lt!34270) (not ((_ is Found!237) lt!34270)) (and (bvsge (index!3081 lt!34270) #b00000000000000000000000000000000) (bvslt (index!3081 lt!34270) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))) (or ((_ is Undefined!237) lt!34270) ((_ is Found!237) lt!34270) (not ((_ is MissingZero!237) lt!34270)) (and (bvsge (index!3080 lt!34270) #b00000000000000000000000000000000) (bvslt (index!3080 lt!34270) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))) (or ((_ is Undefined!237) lt!34270) ((_ is Found!237) lt!34270) ((_ is MissingZero!237) lt!34270) (not ((_ is MissingVacant!237) lt!34270)) (and (bvsge (index!3083 lt!34270) #b00000000000000000000000000000000) (bvslt (index!3083 lt!34270) (size!2104 (_keys!3890 (v!2546 (underlying!263 thiss!992))))))) (or ((_ is Undefined!237) lt!34270) (ite ((_ is Found!237) lt!34270) (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (index!3081 lt!34270)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!237) lt!34270) (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (index!3080 lt!34270)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!237) lt!34270) (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (index!3083 lt!34270)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!49442 () SeekEntryResult!237)

(assert (=> d!18019 (= lt!34270 e!49442)))

(declare-fun c!11513 () Bool)

(declare-fun lt!34271 () SeekEntryResult!237)

(assert (=> d!18019 (= c!11513 (and ((_ is Intermediate!237) lt!34271) (undefined!1049 lt!34271)))))

(assert (=> d!18019 (= lt!34271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000) (mask!6211 (v!2546 (underlying!263 thiss!992)))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000) (_keys!3890 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992)))))))

(assert (=> d!18019 (validMask!0 (mask!6211 (v!2546 (underlying!263 thiss!992))))))

(assert (=> d!18019 (= (seekEntryOrOpen!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000) (_keys!3890 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992)))) lt!34270)))

(declare-fun b!75681 () Bool)

(assert (=> b!75681 (= e!49442 Undefined!237)))

(declare-fun b!75682 () Bool)

(assert (=> b!75682 (= e!49443 (Found!237 (index!3082 lt!34271)))))

(declare-fun b!75683 () Bool)

(assert (=> b!75683 (= e!49442 e!49443)))

(assert (=> b!75683 (= lt!34272 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (index!3082 lt!34271)))))

(declare-fun c!11512 () Bool)

(assert (=> b!75683 (= c!11512 (= lt!34272 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!75684 () Bool)

(assert (=> b!75684 (= e!49444 (MissingZero!237 (index!3082 lt!34271)))))

(declare-fun b!75685 () Bool)

(assert (=> b!75685 (= e!49444 (seekKeyOrZeroReturnVacant!0 (x!11297 lt!34271) (index!3082 lt!34271) (index!3082 lt!34271) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) #b00000000000000000000000000000000) (_keys!3890 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992)))))))

(assert (= (and d!18019 c!11513) b!75681))

(assert (= (and d!18019 (not c!11513)) b!75683))

(assert (= (and b!75683 c!11512) b!75682))

(assert (= (and b!75683 (not c!11512)) b!75680))

(assert (= (and b!75680 c!11511) b!75684))

(assert (= (and b!75680 (not c!11511)) b!75685))

(declare-fun m!75455 () Bool)

(assert (=> d!18019 m!75455))

(assert (=> d!18019 m!74567))

(declare-fun m!75457 () Bool)

(assert (=> d!18019 m!75457))

(declare-fun m!75459 () Bool)

(assert (=> d!18019 m!75459))

(assert (=> d!18019 m!74811))

(declare-fun m!75461 () Bool)

(assert (=> d!18019 m!75461))

(assert (=> d!18019 m!74811))

(assert (=> d!18019 m!75459))

(declare-fun m!75463 () Bool)

(assert (=> d!18019 m!75463))

(declare-fun m!75465 () Bool)

(assert (=> b!75683 m!75465))

(assert (=> b!75685 m!74811))

(declare-fun m!75467 () Bool)

(assert (=> b!75685 m!75467))

(assert (=> b!75211 d!18019))

(declare-fun d!18021 () Bool)

(declare-fun isEmpty!321 (List!1482) Bool)

(assert (=> d!18021 (= (isEmpty!319 lt!33937) (isEmpty!321 (toList!727 lt!33937)))))

(declare-fun bs!3253 () Bool)

(assert (= bs!3253 d!18021))

(declare-fun m!75469 () Bool)

(assert (=> bs!3253 m!75469))

(assert (=> b!75180 d!18021))

(declare-fun d!18023 () Bool)

(declare-fun e!49446 () Bool)

(assert (=> d!18023 e!49446))

(declare-fun res!39887 () Bool)

(assert (=> d!18023 (=> res!39887 e!49446)))

(declare-fun lt!34276 () Bool)

(assert (=> d!18023 (= res!39887 (not lt!34276))))

(declare-fun lt!34273 () Bool)

(assert (=> d!18023 (= lt!34276 lt!34273)))

(declare-fun lt!34274 () Unit!2157)

(declare-fun e!49445 () Unit!2157)

(assert (=> d!18023 (= lt!34274 e!49445)))

(declare-fun c!11514 () Bool)

(assert (=> d!18023 (= c!11514 lt!34273)))

(assert (=> d!18023 (= lt!34273 (containsKey!138 (toList!727 e!49216) (ite c!11419 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (select (arr!1865 (_keys!3890 newMap!16)) (index!3081 lt!34048)))))))

(assert (=> d!18023 (= (contains!727 e!49216 (ite c!11419 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (select (arr!1865 (_keys!3890 newMap!16)) (index!3081 lt!34048)))) lt!34276)))

(declare-fun b!75686 () Bool)

(declare-fun lt!34275 () Unit!2157)

(assert (=> b!75686 (= e!49445 lt!34275)))

(assert (=> b!75686 (= lt!34275 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 e!49216) (ite c!11419 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (select (arr!1865 (_keys!3890 newMap!16)) (index!3081 lt!34048)))))))

(assert (=> b!75686 (isDefined!87 (getValueByKey!134 (toList!727 e!49216) (ite c!11419 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (select (arr!1865 (_keys!3890 newMap!16)) (index!3081 lt!34048)))))))

(declare-fun b!75687 () Bool)

(declare-fun Unit!2181 () Unit!2157)

(assert (=> b!75687 (= e!49445 Unit!2181)))

(declare-fun b!75688 () Bool)

(assert (=> b!75688 (= e!49446 (isDefined!87 (getValueByKey!134 (toList!727 e!49216) (ite c!11419 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (select (arr!1865 (_keys!3890 newMap!16)) (index!3081 lt!34048))))))))

(assert (= (and d!18023 c!11514) b!75686))

(assert (= (and d!18023 (not c!11514)) b!75687))

(assert (= (and d!18023 (not res!39887)) b!75688))

(declare-fun m!75471 () Bool)

(assert (=> d!18023 m!75471))

(declare-fun m!75473 () Bool)

(assert (=> b!75686 m!75473))

(declare-fun m!75475 () Bool)

(assert (=> b!75686 m!75475))

(assert (=> b!75686 m!75475))

(declare-fun m!75477 () Bool)

(assert (=> b!75686 m!75477))

(assert (=> b!75688 m!75475))

(assert (=> b!75688 m!75475))

(assert (=> b!75688 m!75477))

(assert (=> bm!6731 d!18023))

(declare-fun d!18025 () Bool)

(declare-fun e!49448 () Bool)

(assert (=> d!18025 e!49448))

(declare-fun res!39888 () Bool)

(assert (=> d!18025 (=> res!39888 e!49448)))

(declare-fun lt!34280 () Bool)

(assert (=> d!18025 (= res!39888 (not lt!34280))))

(declare-fun lt!34277 () Bool)

(assert (=> d!18025 (= lt!34280 lt!34277)))

(declare-fun lt!34278 () Unit!2157)

(declare-fun e!49447 () Unit!2157)

(assert (=> d!18025 (= lt!34278 e!49447)))

(declare-fun c!11515 () Bool)

(assert (=> d!18025 (= c!11515 lt!34277)))

(assert (=> d!18025 (= lt!34277 (containsKey!138 (toList!727 lt!33950) (_1!1077 lt!33803)))))

(assert (=> d!18025 (= (contains!727 lt!33950 (_1!1077 lt!33803)) lt!34280)))

(declare-fun b!75689 () Bool)

(declare-fun lt!34279 () Unit!2157)

(assert (=> b!75689 (= e!49447 lt!34279)))

(assert (=> b!75689 (= lt!34279 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 lt!33950) (_1!1077 lt!33803)))))

(assert (=> b!75689 (isDefined!87 (getValueByKey!134 (toList!727 lt!33950) (_1!1077 lt!33803)))))

(declare-fun b!75690 () Bool)

(declare-fun Unit!2182 () Unit!2157)

(assert (=> b!75690 (= e!49447 Unit!2182)))

(declare-fun b!75691 () Bool)

(assert (=> b!75691 (= e!49448 (isDefined!87 (getValueByKey!134 (toList!727 lt!33950) (_1!1077 lt!33803))))))

(assert (= (and d!18025 c!11515) b!75689))

(assert (= (and d!18025 (not c!11515)) b!75690))

(assert (= (and d!18025 (not res!39888)) b!75691))

(declare-fun m!75479 () Bool)

(assert (=> d!18025 m!75479))

(declare-fun m!75481 () Bool)

(assert (=> b!75689 m!75481))

(assert (=> b!75689 m!74773))

(assert (=> b!75689 m!74773))

(declare-fun m!75483 () Bool)

(assert (=> b!75689 m!75483))

(assert (=> b!75691 m!74773))

(assert (=> b!75691 m!74773))

(assert (=> b!75691 m!75483))

(assert (=> d!17849 d!18025))

(declare-fun b!75694 () Bool)

(declare-fun e!49450 () Option!140)

(assert (=> b!75694 (= e!49450 (getValueByKey!134 (t!5060 lt!33952) (_1!1077 lt!33803)))))

(declare-fun d!18027 () Bool)

(declare-fun c!11516 () Bool)

(assert (=> d!18027 (= c!11516 (and ((_ is Cons!1478) lt!33952) (= (_1!1077 (h!2066 lt!33952)) (_1!1077 lt!33803))))))

(declare-fun e!49449 () Option!140)

(assert (=> d!18027 (= (getValueByKey!134 lt!33952 (_1!1077 lt!33803)) e!49449)))

(declare-fun b!75693 () Bool)

(assert (=> b!75693 (= e!49449 e!49450)))

(declare-fun c!11517 () Bool)

(assert (=> b!75693 (= c!11517 (and ((_ is Cons!1478) lt!33952) (not (= (_1!1077 (h!2066 lt!33952)) (_1!1077 lt!33803)))))))

(declare-fun b!75692 () Bool)

(assert (=> b!75692 (= e!49449 (Some!139 (_2!1077 (h!2066 lt!33952))))))

(declare-fun b!75695 () Bool)

(assert (=> b!75695 (= e!49450 None!138)))

(assert (= (and d!18027 c!11516) b!75692))

(assert (= (and d!18027 (not c!11516)) b!75693))

(assert (= (and b!75693 c!11517) b!75694))

(assert (= (and b!75693 (not c!11517)) b!75695))

(declare-fun m!75485 () Bool)

(assert (=> b!75694 m!75485))

(assert (=> d!17849 d!18027))

(declare-fun d!18029 () Bool)

(assert (=> d!18029 (= (getValueByKey!134 lt!33952 (_1!1077 lt!33803)) (Some!139 (_2!1077 lt!33803)))))

(declare-fun lt!34281 () Unit!2157)

(assert (=> d!18029 (= lt!34281 (choose!427 lt!33952 (_1!1077 lt!33803) (_2!1077 lt!33803)))))

(declare-fun e!49451 () Bool)

(assert (=> d!18029 e!49451))

(declare-fun res!39889 () Bool)

(assert (=> d!18029 (=> (not res!39889) (not e!49451))))

(assert (=> d!18029 (= res!39889 (isStrictlySorted!293 lt!33952))))

(assert (=> d!18029 (= (lemmaContainsTupThenGetReturnValue!51 lt!33952 (_1!1077 lt!33803) (_2!1077 lt!33803)) lt!34281)))

(declare-fun b!75696 () Bool)

(declare-fun res!39890 () Bool)

(assert (=> b!75696 (=> (not res!39890) (not e!49451))))

(assert (=> b!75696 (= res!39890 (containsKey!138 lt!33952 (_1!1077 lt!33803)))))

(declare-fun b!75697 () Bool)

(assert (=> b!75697 (= e!49451 (contains!729 lt!33952 (tuple2!2133 (_1!1077 lt!33803) (_2!1077 lt!33803))))))

(assert (= (and d!18029 res!39889) b!75696))

(assert (= (and b!75696 res!39890) b!75697))

(assert (=> d!18029 m!74767))

(declare-fun m!75487 () Bool)

(assert (=> d!18029 m!75487))

(declare-fun m!75489 () Bool)

(assert (=> d!18029 m!75489))

(declare-fun m!75491 () Bool)

(assert (=> b!75696 m!75491))

(declare-fun m!75493 () Bool)

(assert (=> b!75697 m!75493))

(assert (=> d!17849 d!18029))

(declare-fun b!75698 () Bool)

(declare-fun e!49455 () List!1482)

(declare-fun call!6787 () List!1482)

(assert (=> b!75698 (= e!49455 call!6787)))

(declare-fun b!75699 () Bool)

(declare-fun e!49452 () List!1482)

(declare-fun call!6786 () List!1482)

(assert (=> b!75699 (= e!49452 call!6786)))

(declare-fun b!75700 () Bool)

(assert (=> b!75700 (= e!49455 call!6787)))

(declare-fun b!75701 () Bool)

(declare-fun e!49456 () List!1482)

(declare-fun call!6788 () List!1482)

(assert (=> b!75701 (= e!49456 call!6788)))

(declare-fun e!49454 () List!1482)

(declare-fun b!75702 () Bool)

(assert (=> b!75702 (= e!49454 (insertStrictlySorted!54 (t!5060 (toList!727 (+!96 lt!33809 lt!33813))) (_1!1077 lt!33803) (_2!1077 lt!33803)))))

(declare-fun b!75703 () Bool)

(declare-fun e!49453 () Bool)

(declare-fun lt!34282 () List!1482)

(assert (=> b!75703 (= e!49453 (contains!729 lt!34282 (tuple2!2133 (_1!1077 lt!33803) (_2!1077 lt!33803))))))

(declare-fun b!75704 () Bool)

(assert (=> b!75704 (= e!49456 e!49452)))

(declare-fun c!11521 () Bool)

(assert (=> b!75704 (= c!11521 (and ((_ is Cons!1478) (toList!727 (+!96 lt!33809 lt!33813))) (= (_1!1077 (h!2066 (toList!727 (+!96 lt!33809 lt!33813)))) (_1!1077 lt!33803))))))

(declare-fun bm!6783 () Bool)

(assert (=> bm!6783 (= call!6787 call!6786)))

(declare-fun c!11518 () Bool)

(declare-fun b!75705 () Bool)

(assert (=> b!75705 (= c!11518 (and ((_ is Cons!1478) (toList!727 (+!96 lt!33809 lt!33813))) (bvsgt (_1!1077 (h!2066 (toList!727 (+!96 lt!33809 lt!33813)))) (_1!1077 lt!33803))))))

(assert (=> b!75705 (= e!49452 e!49455)))

(declare-fun b!75707 () Bool)

(declare-fun res!39891 () Bool)

(assert (=> b!75707 (=> (not res!39891) (not e!49453))))

(assert (=> b!75707 (= res!39891 (containsKey!138 lt!34282 (_1!1077 lt!33803)))))

(declare-fun bm!6784 () Bool)

(declare-fun c!11519 () Bool)

(assert (=> bm!6784 (= call!6788 ($colon$colon!67 e!49454 (ite c!11519 (h!2066 (toList!727 (+!96 lt!33809 lt!33813))) (tuple2!2133 (_1!1077 lt!33803) (_2!1077 lt!33803)))))))

(declare-fun c!11520 () Bool)

(assert (=> bm!6784 (= c!11520 c!11519)))

(declare-fun bm!6785 () Bool)

(assert (=> bm!6785 (= call!6786 call!6788)))

(declare-fun b!75706 () Bool)

(assert (=> b!75706 (= e!49454 (ite c!11521 (t!5060 (toList!727 (+!96 lt!33809 lt!33813))) (ite c!11518 (Cons!1478 (h!2066 (toList!727 (+!96 lt!33809 lt!33813))) (t!5060 (toList!727 (+!96 lt!33809 lt!33813)))) Nil!1479)))))

(declare-fun d!18031 () Bool)

(assert (=> d!18031 e!49453))

(declare-fun res!39892 () Bool)

(assert (=> d!18031 (=> (not res!39892) (not e!49453))))

(assert (=> d!18031 (= res!39892 (isStrictlySorted!293 lt!34282))))

(assert (=> d!18031 (= lt!34282 e!49456)))

(assert (=> d!18031 (= c!11519 (and ((_ is Cons!1478) (toList!727 (+!96 lt!33809 lt!33813))) (bvslt (_1!1077 (h!2066 (toList!727 (+!96 lt!33809 lt!33813)))) (_1!1077 lt!33803))))))

(assert (=> d!18031 (isStrictlySorted!293 (toList!727 (+!96 lt!33809 lt!33813)))))

(assert (=> d!18031 (= (insertStrictlySorted!54 (toList!727 (+!96 lt!33809 lt!33813)) (_1!1077 lt!33803) (_2!1077 lt!33803)) lt!34282)))

(assert (= (and d!18031 c!11519) b!75701))

(assert (= (and d!18031 (not c!11519)) b!75704))

(assert (= (and b!75704 c!11521) b!75699))

(assert (= (and b!75704 (not c!11521)) b!75705))

(assert (= (and b!75705 c!11518) b!75698))

(assert (= (and b!75705 (not c!11518)) b!75700))

(assert (= (or b!75698 b!75700) bm!6783))

(assert (= (or b!75699 bm!6783) bm!6785))

(assert (= (or b!75701 bm!6785) bm!6784))

(assert (= (and bm!6784 c!11520) b!75702))

(assert (= (and bm!6784 (not c!11520)) b!75706))

(assert (= (and d!18031 res!39892) b!75707))

(assert (= (and b!75707 res!39891) b!75703))

(declare-fun m!75495 () Bool)

(assert (=> b!75702 m!75495))

(declare-fun m!75497 () Bool)

(assert (=> b!75703 m!75497))

(declare-fun m!75499 () Bool)

(assert (=> b!75707 m!75499))

(declare-fun m!75501 () Bool)

(assert (=> d!18031 m!75501))

(declare-fun m!75503 () Bool)

(assert (=> d!18031 m!75503))

(declare-fun m!75505 () Bool)

(assert (=> bm!6784 m!75505))

(assert (=> d!17849 d!18031))

(assert (=> d!17837 d!18003))

(declare-fun b!75724 () Bool)

(declare-fun e!49465 () Bool)

(declare-fun e!49467 () Bool)

(assert (=> b!75724 (= e!49465 e!49467)))

(declare-fun res!39901 () Bool)

(declare-fun call!6794 () Bool)

(assert (=> b!75724 (= res!39901 call!6794)))

(assert (=> b!75724 (=> (not res!39901) (not e!49467))))

(declare-fun b!75725 () Bool)

(declare-fun call!6793 () Bool)

(assert (=> b!75725 (= e!49467 (not call!6793))))

(declare-fun b!75726 () Bool)

(declare-fun e!49466 () Bool)

(declare-fun lt!34288 () SeekEntryResult!237)

(assert (=> b!75726 (= e!49466 ((_ is Undefined!237) lt!34288))))

(declare-fun d!18033 () Bool)

(assert (=> d!18033 e!49465))

(declare-fun c!11526 () Bool)

(assert (=> d!18033 (= c!11526 ((_ is MissingZero!237) lt!34288))))

(assert (=> d!18033 (= lt!34288 (seekEntryOrOpen!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (_keys!3890 newMap!16) (mask!6211 newMap!16)))))

(declare-fun lt!34287 () Unit!2157)

(declare-fun choose!436 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 64) Int) Unit!2157)

(assert (=> d!18033 (= lt!34287 (choose!436 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (defaultEntry!2234 newMap!16)))))

(assert (=> d!18033 (validMask!0 (mask!6211 newMap!16))))

(assert (=> d!18033 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!25 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (defaultEntry!2234 newMap!16)) lt!34287)))

(declare-fun b!75727 () Bool)

(assert (=> b!75727 (= e!49465 e!49466)))

(declare-fun c!11527 () Bool)

(assert (=> b!75727 (= c!11527 ((_ is MissingVacant!237) lt!34288))))

(declare-fun b!75728 () Bool)

(declare-fun res!39903 () Bool)

(declare-fun e!49468 () Bool)

(assert (=> b!75728 (=> (not res!39903) (not e!49468))))

(assert (=> b!75728 (= res!39903 (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3083 lt!34288)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75728 (and (bvsge (index!3083 lt!34288) #b00000000000000000000000000000000) (bvslt (index!3083 lt!34288) (size!2104 (_keys!3890 newMap!16))))))

(declare-fun bm!6790 () Bool)

(assert (=> bm!6790 (= call!6793 (arrayContainsKey!0 (_keys!3890 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!75729 () Bool)

(assert (=> b!75729 (= e!49468 (not call!6793))))

(declare-fun b!75730 () Bool)

(declare-fun res!39904 () Bool)

(assert (=> b!75730 (=> (not res!39904) (not e!49468))))

(assert (=> b!75730 (= res!39904 call!6794)))

(assert (=> b!75730 (= e!49466 e!49468)))

(declare-fun bm!6791 () Bool)

(assert (=> bm!6791 (= call!6794 (inRange!0 (ite c!11526 (index!3080 lt!34288) (index!3083 lt!34288)) (mask!6211 newMap!16)))))

(declare-fun b!75731 () Bool)

(assert (=> b!75731 (and (bvsge (index!3080 lt!34288) #b00000000000000000000000000000000) (bvslt (index!3080 lt!34288) (size!2104 (_keys!3890 newMap!16))))))

(declare-fun res!39902 () Bool)

(assert (=> b!75731 (= res!39902 (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3080 lt!34288)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75731 (=> (not res!39902) (not e!49467))))

(assert (= (and d!18033 c!11526) b!75724))

(assert (= (and d!18033 (not c!11526)) b!75727))

(assert (= (and b!75724 res!39901) b!75731))

(assert (= (and b!75731 res!39902) b!75725))

(assert (= (and b!75727 c!11527) b!75730))

(assert (= (and b!75727 (not c!11527)) b!75726))

(assert (= (and b!75730 res!39904) b!75728))

(assert (= (and b!75728 res!39903) b!75729))

(assert (= (or b!75724 b!75730) bm!6791))

(assert (= (or b!75725 b!75729) bm!6790))

(declare-fun m!75507 () Bool)

(assert (=> b!75728 m!75507))

(assert (=> bm!6790 m!74557))

(assert (=> bm!6790 m!74863))

(assert (=> d!18033 m!74557))

(assert (=> d!18033 m!74871))

(assert (=> d!18033 m!74557))

(declare-fun m!75509 () Bool)

(assert (=> d!18033 m!75509))

(assert (=> d!18033 m!75125))

(declare-fun m!75511 () Bool)

(assert (=> bm!6791 m!75511))

(declare-fun m!75513 () Bool)

(assert (=> b!75731 m!75513))

(assert (=> bm!6733 d!18033))

(declare-fun d!18035 () Bool)

(declare-fun e!49471 () Bool)

(assert (=> d!18035 e!49471))

(declare-fun c!11530 () Bool)

(assert (=> d!18035 (= c!11530 (and (not (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!18035 true))

(declare-fun _$29!93 () Unit!2157)

(assert (=> d!18035 (= (choose!426 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (_values!2217 (v!2546 (underlying!263 thiss!992))) (mask!6211 (v!2546 (underlying!263 thiss!992))) (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) (zeroValue!2134 (v!2546 (underlying!263 thiss!992))) (minValue!2134 (v!2546 (underlying!263 thiss!992))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992)))) _$29!93)))

(declare-fun b!75736 () Bool)

(assert (=> b!75736 (= e!49471 (arrayContainsKey!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!75737 () Bool)

(assert (=> b!75737 (= e!49471 (ite (= (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2089 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!18035 c!11530) b!75736))

(assert (= (and d!18035 (not c!11530)) b!75737))

(assert (=> b!75736 m!74557))

(assert (=> b!75736 m!74597))

(assert (=> d!17873 d!18035))

(assert (=> d!17873 d!17853))

(assert (=> bm!6717 d!17837))

(declare-fun b!75748 () Bool)

(declare-fun res!39914 () Bool)

(declare-fun e!49474 () Bool)

(assert (=> b!75748 (=> (not res!39914) (not e!49474))))

(declare-fun size!2108 (LongMapFixedSize!702) (_ BitVec 32))

(assert (=> b!75748 (= res!39914 (= (size!2108 newMap!16) (bvadd (_size!400 newMap!16) (bvsdiv (bvadd (extraKeys!2089 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!75749 () Bool)

(assert (=> b!75749 (= e!49474 (and (bvsge (extraKeys!2089 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2089 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!400 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!18037 () Bool)

(declare-fun res!39913 () Bool)

(assert (=> d!18037 (=> (not res!39913) (not e!49474))))

(assert (=> d!18037 (= res!39913 (validMask!0 (mask!6211 newMap!16)))))

(assert (=> d!18037 (= (simpleValid!52 newMap!16) e!49474)))

(declare-fun b!75746 () Bool)

(declare-fun res!39916 () Bool)

(assert (=> b!75746 (=> (not res!39916) (not e!49474))))

(assert (=> b!75746 (= res!39916 (and (= (size!2105 (_values!2217 newMap!16)) (bvadd (mask!6211 newMap!16) #b00000000000000000000000000000001)) (= (size!2104 (_keys!3890 newMap!16)) (size!2105 (_values!2217 newMap!16))) (bvsge (_size!400 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!400 newMap!16) (bvadd (mask!6211 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!75747 () Bool)

(declare-fun res!39915 () Bool)

(assert (=> b!75747 (=> (not res!39915) (not e!49474))))

(assert (=> b!75747 (= res!39915 (bvsge (size!2108 newMap!16) (_size!400 newMap!16)))))

(assert (= (and d!18037 res!39913) b!75746))

(assert (= (and b!75746 res!39916) b!75747))

(assert (= (and b!75747 res!39915) b!75748))

(assert (= (and b!75748 res!39914) b!75749))

(declare-fun m!75515 () Bool)

(assert (=> b!75748 m!75515))

(assert (=> d!18037 m!75125))

(assert (=> b!75747 m!75515))

(assert (=> d!17843 d!18037))

(assert (=> bm!6658 d!17845))

(assert (=> b!75131 d!17877))

(assert (=> d!17869 d!17875))

(declare-fun d!18039 () Bool)

(assert (=> d!18039 (arrayNoDuplicates!0 (_keys!3890 (v!2546 (underlying!263 thiss!992))) from!355 Nil!1480)))

(assert (=> d!18039 true))

(declare-fun _$71!99 () Unit!2157)

(assert (=> d!18039 (= (choose!39 (_keys!3890 (v!2546 (underlying!263 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!99)))

(declare-fun bs!3254 () Bool)

(assert (= bs!3254 d!18039))

(assert (=> bs!3254 m!74593))

(assert (=> d!17869 d!18039))

(declare-fun d!18041 () Bool)

(declare-fun e!49475 () Bool)

(assert (=> d!18041 e!49475))

(declare-fun res!39917 () Bool)

(assert (=> d!18041 (=> (not res!39917) (not e!49475))))

(declare-fun lt!34289 () ListLongMap!1423)

(assert (=> d!18041 (= res!39917 (contains!727 lt!34289 (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!34291 () List!1482)

(assert (=> d!18041 (= lt!34289 (ListLongMap!1424 lt!34291))))

(declare-fun lt!34290 () Unit!2157)

(declare-fun lt!34292 () Unit!2157)

(assert (=> d!18041 (= lt!34290 lt!34292)))

(assert (=> d!18041 (= (getValueByKey!134 lt!34291 (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!139 (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18041 (= lt!34292 (lemmaContainsTupThenGetReturnValue!51 lt!34291 (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18041 (= lt!34291 (insertStrictlySorted!54 (toList!727 call!6667) (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18041 (= (+!96 call!6667 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!34289)))

(declare-fun b!75750 () Bool)

(declare-fun res!39918 () Bool)

(assert (=> b!75750 (=> (not res!39918) (not e!49475))))

(assert (=> b!75750 (= res!39918 (= (getValueByKey!134 (toList!727 lt!34289) (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!139 (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!75751 () Bool)

(assert (=> b!75751 (= e!49475 (contains!729 (toList!727 lt!34289) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1146 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!18041 res!39917) b!75750))

(assert (= (and b!75750 res!39918) b!75751))

(declare-fun m!75517 () Bool)

(assert (=> d!18041 m!75517))

(declare-fun m!75519 () Bool)

(assert (=> d!18041 m!75519))

(declare-fun m!75521 () Bool)

(assert (=> d!18041 m!75521))

(declare-fun m!75523 () Bool)

(assert (=> d!18041 m!75523))

(declare-fun m!75525 () Bool)

(assert (=> b!75750 m!75525))

(declare-fun m!75527 () Bool)

(assert (=> b!75751 m!75527))

(assert (=> b!75185 d!18041))

(assert (=> b!75185 d!17959))

(declare-fun d!18043 () Bool)

(declare-fun e!49477 () Bool)

(assert (=> d!18043 e!49477))

(declare-fun res!39919 () Bool)

(assert (=> d!18043 (=> res!39919 e!49477)))

(declare-fun lt!34296 () Bool)

(assert (=> d!18043 (= res!39919 (not lt!34296))))

(declare-fun lt!34293 () Bool)

(assert (=> d!18043 (= lt!34296 lt!34293)))

(declare-fun lt!34294 () Unit!2157)

(declare-fun e!49476 () Unit!2157)

(assert (=> d!18043 (= lt!34294 e!49476)))

(declare-fun c!11531 () Bool)

(assert (=> d!18043 (= c!11531 lt!34293)))

(assert (=> d!18043 (= lt!34293 (containsKey!138 (toList!727 (+!96 lt!33935 (tuple2!2133 lt!33934 lt!33933))) lt!33932))))

(assert (=> d!18043 (= (contains!727 (+!96 lt!33935 (tuple2!2133 lt!33934 lt!33933)) lt!33932) lt!34296)))

(declare-fun b!75752 () Bool)

(declare-fun lt!34295 () Unit!2157)

(assert (=> b!75752 (= e!49476 lt!34295)))

(assert (=> b!75752 (= lt!34295 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 (+!96 lt!33935 (tuple2!2133 lt!33934 lt!33933))) lt!33932))))

(assert (=> b!75752 (isDefined!87 (getValueByKey!134 (toList!727 (+!96 lt!33935 (tuple2!2133 lt!33934 lt!33933))) lt!33932))))

(declare-fun b!75753 () Bool)

(declare-fun Unit!2183 () Unit!2157)

(assert (=> b!75753 (= e!49476 Unit!2183)))

(declare-fun b!75754 () Bool)

(assert (=> b!75754 (= e!49477 (isDefined!87 (getValueByKey!134 (toList!727 (+!96 lt!33935 (tuple2!2133 lt!33934 lt!33933))) lt!33932)))))

(assert (= (and d!18043 c!11531) b!75752))

(assert (= (and d!18043 (not c!11531)) b!75753))

(assert (= (and d!18043 (not res!39919)) b!75754))

(declare-fun m!75529 () Bool)

(assert (=> d!18043 m!75529))

(declare-fun m!75531 () Bool)

(assert (=> b!75752 m!75531))

(declare-fun m!75533 () Bool)

(assert (=> b!75752 m!75533))

(assert (=> b!75752 m!75533))

(declare-fun m!75535 () Bool)

(assert (=> b!75752 m!75535))

(assert (=> b!75754 m!75533))

(assert (=> b!75754 m!75533))

(assert (=> b!75754 m!75535))

(assert (=> b!75185 d!18043))

(declare-fun d!18045 () Bool)

(declare-fun e!49478 () Bool)

(assert (=> d!18045 e!49478))

(declare-fun res!39920 () Bool)

(assert (=> d!18045 (=> (not res!39920) (not e!49478))))

(declare-fun lt!34297 () ListLongMap!1423)

(assert (=> d!18045 (= res!39920 (contains!727 lt!34297 (_1!1077 (tuple2!2133 lt!33934 lt!33933))))))

(declare-fun lt!34299 () List!1482)

(assert (=> d!18045 (= lt!34297 (ListLongMap!1424 lt!34299))))

(declare-fun lt!34298 () Unit!2157)

(declare-fun lt!34300 () Unit!2157)

(assert (=> d!18045 (= lt!34298 lt!34300)))

(assert (=> d!18045 (= (getValueByKey!134 lt!34299 (_1!1077 (tuple2!2133 lt!33934 lt!33933))) (Some!139 (_2!1077 (tuple2!2133 lt!33934 lt!33933))))))

(assert (=> d!18045 (= lt!34300 (lemmaContainsTupThenGetReturnValue!51 lt!34299 (_1!1077 (tuple2!2133 lt!33934 lt!33933)) (_2!1077 (tuple2!2133 lt!33934 lt!33933))))))

(assert (=> d!18045 (= lt!34299 (insertStrictlySorted!54 (toList!727 lt!33935) (_1!1077 (tuple2!2133 lt!33934 lt!33933)) (_2!1077 (tuple2!2133 lt!33934 lt!33933))))))

(assert (=> d!18045 (= (+!96 lt!33935 (tuple2!2133 lt!33934 lt!33933)) lt!34297)))

(declare-fun b!75755 () Bool)

(declare-fun res!39921 () Bool)

(assert (=> b!75755 (=> (not res!39921) (not e!49478))))

(assert (=> b!75755 (= res!39921 (= (getValueByKey!134 (toList!727 lt!34297) (_1!1077 (tuple2!2133 lt!33934 lt!33933))) (Some!139 (_2!1077 (tuple2!2133 lt!33934 lt!33933)))))))

(declare-fun b!75756 () Bool)

(assert (=> b!75756 (= e!49478 (contains!729 (toList!727 lt!34297) (tuple2!2133 lt!33934 lt!33933)))))

(assert (= (and d!18045 res!39920) b!75755))

(assert (= (and b!75755 res!39921) b!75756))

(declare-fun m!75537 () Bool)

(assert (=> d!18045 m!75537))

(declare-fun m!75539 () Bool)

(assert (=> d!18045 m!75539))

(declare-fun m!75541 () Bool)

(assert (=> d!18045 m!75541))

(declare-fun m!75543 () Bool)

(assert (=> d!18045 m!75543))

(declare-fun m!75545 () Bool)

(assert (=> b!75755 m!75545))

(declare-fun m!75547 () Bool)

(assert (=> b!75756 m!75547))

(assert (=> b!75185 d!18045))

(declare-fun d!18047 () Bool)

(assert (=> d!18047 (not (contains!727 (+!96 lt!33935 (tuple2!2133 lt!33934 lt!33933)) lt!33932))))

(declare-fun lt!34303 () Unit!2157)

(declare-fun choose!437 (ListLongMap!1423 (_ BitVec 64) V!2955 (_ BitVec 64)) Unit!2157)

(assert (=> d!18047 (= lt!34303 (choose!437 lt!33935 lt!33934 lt!33933 lt!33932))))

(declare-fun e!49481 () Bool)

(assert (=> d!18047 e!49481))

(declare-fun res!39924 () Bool)

(assert (=> d!18047 (=> (not res!39924) (not e!49481))))

(assert (=> d!18047 (= res!39924 (not (contains!727 lt!33935 lt!33932)))))

(assert (=> d!18047 (= (addStillNotContains!25 lt!33935 lt!33934 lt!33933 lt!33932) lt!34303)))

(declare-fun b!75760 () Bool)

(assert (=> b!75760 (= e!49481 (not (= lt!33934 lt!33932)))))

(assert (= (and d!18047 res!39924) b!75760))

(assert (=> d!18047 m!74743))

(assert (=> d!18047 m!74743))

(assert (=> d!18047 m!74747))

(declare-fun m!75549 () Bool)

(assert (=> d!18047 m!75549))

(declare-fun m!75551 () Bool)

(assert (=> d!18047 m!75551))

(assert (=> b!75185 d!18047))

(declare-fun b!75762 () Bool)

(declare-fun e!49484 () Bool)

(declare-fun e!49483 () Bool)

(assert (=> b!75762 (= e!49484 e!49483)))

(declare-fun c!11532 () Bool)

(assert (=> b!75762 (= c!11532 (validKeyInArray!0 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6792 () Bool)

(declare-fun call!6795 () Bool)

(assert (=> bm!6792 (= call!6795 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3890 newMap!16) (mask!6211 newMap!16)))))

(declare-fun d!18049 () Bool)

(declare-fun res!39925 () Bool)

(assert (=> d!18049 (=> res!39925 e!49484)))

(assert (=> d!18049 (= res!39925 (bvsge #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))))))

(assert (=> d!18049 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3890 newMap!16) (mask!6211 newMap!16)) e!49484)))

(declare-fun b!75761 () Bool)

(declare-fun e!49482 () Bool)

(assert (=> b!75761 (= e!49482 call!6795)))

(declare-fun b!75763 () Bool)

(assert (=> b!75763 (= e!49483 call!6795)))

(declare-fun b!75764 () Bool)

(assert (=> b!75764 (= e!49483 e!49482)))

(declare-fun lt!34305 () (_ BitVec 64))

(assert (=> b!75764 (= lt!34305 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34304 () Unit!2157)

(assert (=> b!75764 (= lt!34304 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3890 newMap!16) lt!34305 #b00000000000000000000000000000000))))

(assert (=> b!75764 (arrayContainsKey!0 (_keys!3890 newMap!16) lt!34305 #b00000000000000000000000000000000)))

(declare-fun lt!34306 () Unit!2157)

(assert (=> b!75764 (= lt!34306 lt!34304)))

(declare-fun res!39926 () Bool)

(assert (=> b!75764 (= res!39926 (= (seekEntryOrOpen!0 (select (arr!1865 (_keys!3890 newMap!16)) #b00000000000000000000000000000000) (_keys!3890 newMap!16) (mask!6211 newMap!16)) (Found!237 #b00000000000000000000000000000000)))))

(assert (=> b!75764 (=> (not res!39926) (not e!49482))))

(assert (= (and d!18049 (not res!39925)) b!75762))

(assert (= (and b!75762 c!11532) b!75764))

(assert (= (and b!75762 (not c!11532)) b!75763))

(assert (= (and b!75764 res!39926) b!75761))

(assert (= (or b!75761 b!75763) bm!6792))

(assert (=> b!75762 m!74945))

(assert (=> b!75762 m!74945))

(assert (=> b!75762 m!75165))

(declare-fun m!75553 () Bool)

(assert (=> bm!6792 m!75553))

(assert (=> b!75764 m!74945))

(declare-fun m!75555 () Bool)

(assert (=> b!75764 m!75555))

(declare-fun m!75557 () Bool)

(assert (=> b!75764 m!75557))

(assert (=> b!75764 m!74945))

(declare-fun m!75559 () Bool)

(assert (=> b!75764 m!75559))

(assert (=> b!75150 d!18049))

(assert (=> b!75357 d!17871))

(declare-fun b!75799 () Bool)

(declare-fun e!49507 () Unit!2157)

(declare-fun Unit!2184 () Unit!2157)

(assert (=> b!75799 (= e!49507 Unit!2184)))

(declare-fun lt!34368 () Unit!2157)

(assert (=> b!75799 (= lt!34368 (lemmaInListMapThenSeekEntryOrOpenFindsIt!25 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34393 () SeekEntryResult!237)

(declare-fun call!6805 () SeekEntryResult!237)

(assert (=> b!75799 (= lt!34393 call!6805)))

(declare-fun res!39952 () Bool)

(assert (=> b!75799 (= res!39952 ((_ is Found!237) lt!34393))))

(declare-fun e!49506 () Bool)

(assert (=> b!75799 (=> (not res!39952) (not e!49506))))

(assert (=> b!75799 e!49506))

(declare-fun lt!34394 () Unit!2157)

(assert (=> b!75799 (= lt!34394 lt!34368)))

(assert (=> b!75799 false))

(declare-fun d!18051 () Bool)

(declare-fun e!49503 () Bool)

(assert (=> d!18051 e!49503))

(declare-fun res!39946 () Bool)

(assert (=> d!18051 (=> (not res!39946) (not e!49503))))

(declare-fun lt!34392 () tuple2!2130)

(assert (=> d!18051 (= res!39946 (_1!1076 lt!34392))))

(assert (=> d!18051 (= lt!34392 (tuple2!2131 true (LongMapFixedSize!703 (defaultEntry!2234 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (bvadd (_size!400 newMap!16) #b00000000000000000000000000000001) (array!3910 (store (arr!1865 (_keys!3890 newMap!16)) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) (size!2104 (_keys!3890 newMap!16))) (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16))) (_vacant!400 newMap!16))))))

(declare-fun lt!34367 () Unit!2157)

(declare-fun lt!34374 () Unit!2157)

(assert (=> d!18051 (= lt!34367 lt!34374)))

(declare-fun lt!34381 () array!3911)

(declare-fun lt!34382 () array!3909)

(assert (=> d!18051 (contains!727 (getCurrentListMap!424 lt!34382 lt!34381 (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)) (select (store (arr!1865 (_keys!3890 newMap!16)) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048))))))

(assert (=> d!18051 (= lt!34374 (lemmaValidKeyInArrayIsInListMap!86 lt!34382 lt!34381 (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (defaultEntry!2234 newMap!16)))))

(assert (=> d!18051 (= lt!34381 (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16))))))

(assert (=> d!18051 (= lt!34382 (array!3910 (store (arr!1865 (_keys!3890 newMap!16)) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) (size!2104 (_keys!3890 newMap!16))))))

(declare-fun lt!34378 () Unit!2157)

(declare-fun lt!34385 () Unit!2157)

(assert (=> d!18051 (= lt!34378 lt!34385)))

(declare-fun lt!34383 () array!3909)

(assert (=> d!18051 (= (arrayCountValidKeys!0 lt!34383 (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (bvadd (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!3909 (_ BitVec 32)) Unit!2157)

(assert (=> d!18051 (= lt!34385 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!34383 (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048))))))

(assert (=> d!18051 (= lt!34383 (array!3910 (store (arr!1865 (_keys!3890 newMap!16)) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) (size!2104 (_keys!3890 newMap!16))))))

(declare-fun lt!34391 () Unit!2157)

(declare-fun lt!34373 () Unit!2157)

(assert (=> d!18051 (= lt!34391 lt!34373)))

(declare-fun lt!34376 () array!3909)

(assert (=> d!18051 (arrayContainsKey!0 lt!34376 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!18051 (= lt!34373 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!34376 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048))))))

(assert (=> d!18051 (= lt!34376 (array!3910 (store (arr!1865 (_keys!3890 newMap!16)) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) (size!2104 (_keys!3890 newMap!16))))))

(declare-fun lt!34396 () Unit!2157)

(declare-fun lt!34377 () Unit!2157)

(assert (=> d!18051 (= lt!34396 lt!34377)))

(assert (=> d!18051 (= (+!96 (getCurrentListMap!424 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) (getCurrentListMap!424 (array!3910 (store (arr!1865 (_keys!3890 newMap!16)) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) (size!2104 (_keys!3890 newMap!16))) (array!3912 (store (arr!1866 (_values!2217 newMap!16)) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (ValueCellFull!897 lt!33806)) (size!2105 (_values!2217 newMap!16))) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!14 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 32) (_ BitVec 64) V!2955 Int) Unit!2157)

(assert (=> d!18051 (= lt!34377 (lemmaAddValidKeyToArrayThenAddPairToListMap!14 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806 (defaultEntry!2234 newMap!16)))))

(declare-fun lt!34386 () Unit!2157)

(declare-fun lt!34371 () Unit!2157)

(assert (=> d!18051 (= lt!34386 lt!34371)))

(assert (=> d!18051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3910 (store (arr!1865 (_keys!3890 newMap!16)) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) (size!2104 (_keys!3890 newMap!16))) (mask!6211 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!3909 (_ BitVec 32) (_ BitVec 32)) Unit!2157)

(assert (=> d!18051 (= lt!34371 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (_keys!3890 newMap!16) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (mask!6211 newMap!16)))))

(declare-fun lt!34380 () Unit!2157)

(declare-fun lt!34372 () Unit!2157)

(assert (=> d!18051 (= lt!34380 lt!34372)))

(assert (=> d!18051 (= (arrayCountValidKeys!0 (array!3910 (store (arr!1865 (_keys!3890 newMap!16)) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) (size!2104 (_keys!3890 newMap!16))) #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3890 newMap!16) #b00000000000000000000000000000000 (size!2104 (_keys!3890 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!3909 (_ BitVec 32) (_ BitVec 64)) Unit!2157)

(assert (=> d!18051 (= lt!34372 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3890 newMap!16) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun lt!34369 () Unit!2157)

(declare-fun lt!34370 () Unit!2157)

(assert (=> d!18051 (= lt!34369 lt!34370)))

(declare-fun lt!34379 () (_ BitVec 32))

(declare-fun lt!34389 () List!1483)

(assert (=> d!18051 (arrayNoDuplicates!0 (array!3910 (store (arr!1865 (_keys!3890 newMap!16)) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) (size!2104 (_keys!3890 newMap!16))) lt!34379 lt!34389)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!3909 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1483) Unit!2157)

(assert (=> d!18051 (= lt!34370 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3890 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048)) lt!34379 lt!34389))))

(assert (=> d!18051 (= lt!34389 Nil!1480)))

(assert (=> d!18051 (= lt!34379 #b00000000000000000000000000000000)))

(declare-fun lt!34375 () Unit!2157)

(declare-fun e!49504 () Unit!2157)

(assert (=> d!18051 (= lt!34375 e!49504)))

(declare-fun c!11544 () Bool)

(assert (=> d!18051 (= c!11544 (arrayContainsKey!0 (_keys!3890 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!34390 () Unit!2157)

(assert (=> d!18051 (= lt!34390 e!49507)))

(declare-fun c!11541 () Bool)

(assert (=> d!18051 (= c!11541 (contains!727 (getCurrentListMap!424 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (=> d!18051 (valid!293 newMap!16)))

(assert (=> d!18051 (= (updateHelperNewKey!25 newMap!16 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806 (ite c!11416 (index!3083 lt!34048) (index!3080 lt!34048))) lt!34392)))

(declare-fun call!6807 () Bool)

(declare-fun bm!6801 () Bool)

(assert (=> bm!6801 (= call!6807 (arrayContainsKey!0 (_keys!3890 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun c!11543 () Bool)

(declare-fun call!6804 () Bool)

(declare-fun bm!6802 () Bool)

(declare-fun lt!34395 () SeekEntryResult!237)

(assert (=> bm!6802 (= call!6804 (inRange!0 (ite c!11541 (index!3081 lt!34393) (ite c!11543 (index!3080 lt!34395) (index!3083 lt!34395))) (mask!6211 newMap!16)))))

(declare-fun b!75800 () Bool)

(declare-fun e!49501 () Bool)

(declare-fun e!49508 () Bool)

(assert (=> b!75800 (= e!49501 e!49508)))

(declare-fun res!39949 () Bool)

(declare-fun call!6806 () Bool)

(assert (=> b!75800 (= res!39949 call!6806)))

(assert (=> b!75800 (=> (not res!39949) (not e!49508))))

(declare-fun b!75801 () Bool)

(declare-fun res!39951 () Bool)

(declare-fun e!49502 () Bool)

(assert (=> b!75801 (=> (not res!39951) (not e!49502))))

(assert (=> b!75801 (= res!39951 (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3080 lt!34395)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75802 () Bool)

(declare-fun res!39948 () Bool)

(assert (=> b!75802 (=> (not res!39948) (not e!49502))))

(assert (=> b!75802 (= res!39948 call!6806)))

(declare-fun e!49505 () Bool)

(assert (=> b!75802 (= e!49505 e!49502)))

(declare-fun bm!6803 () Bool)

(assert (=> bm!6803 (= call!6805 (seekEntryOrOpen!0 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (_keys!3890 newMap!16) (mask!6211 newMap!16)))))

(declare-fun b!75803 () Bool)

(assert (=> b!75803 (= e!49506 (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3081 lt!34393)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun b!75804 () Bool)

(declare-fun Unit!2185 () Unit!2157)

(assert (=> b!75804 (= e!49504 Unit!2185)))

(declare-fun b!75805 () Bool)

(declare-fun c!11542 () Bool)

(assert (=> b!75805 (= c!11542 ((_ is MissingVacant!237) lt!34395))))

(assert (=> b!75805 (= e!49505 e!49501)))

(declare-fun b!75806 () Bool)

(assert (=> b!75806 (= e!49508 (not call!6807))))

(declare-fun bm!6804 () Bool)

(assert (=> bm!6804 (= call!6806 call!6804)))

(declare-fun b!75807 () Bool)

(declare-fun res!39953 () Bool)

(assert (=> b!75807 (= res!39953 (= (select (arr!1865 (_keys!3890 newMap!16)) (index!3083 lt!34395)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75807 (=> (not res!39953) (not e!49508))))

(declare-fun b!75808 () Bool)

(declare-fun Unit!2186 () Unit!2157)

(assert (=> b!75808 (= e!49504 Unit!2186)))

(declare-fun lt!34387 () Unit!2157)

(declare-fun lemmaArrayContainsKeyThenInListMap!14 (array!3909 array!3911 (_ BitVec 32) (_ BitVec 32) V!2955 V!2955 (_ BitVec 64) (_ BitVec 32) Int) Unit!2157)

(assert (=> b!75808 (= lt!34387 (lemmaArrayContainsKeyThenInListMap!14 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)))))

(assert (=> b!75808 (contains!727 (getCurrentListMap!424 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2234 newMap!16)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355))))

(declare-fun lt!34384 () Unit!2157)

(assert (=> b!75808 (= lt!34384 lt!34387)))

(assert (=> b!75808 false))

(declare-fun b!75809 () Bool)

(declare-fun lt!34388 () Unit!2157)

(assert (=> b!75809 (= e!49507 lt!34388)))

(assert (=> b!75809 (= lt!34388 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!25 (_keys!3890 newMap!16) (_values!2217 newMap!16) (mask!6211 newMap!16) (extraKeys!2089 newMap!16) (zeroValue!2134 newMap!16) (minValue!2134 newMap!16) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) (defaultEntry!2234 newMap!16)))))

(assert (=> b!75809 (= lt!34395 call!6805)))

(assert (=> b!75809 (= c!11543 ((_ is MissingZero!237) lt!34395))))

(assert (=> b!75809 e!49505))

(declare-fun b!75810 () Bool)

(declare-fun res!39945 () Bool)

(assert (=> b!75810 (=> (not res!39945) (not e!49503))))

(assert (=> b!75810 (= res!39945 (valid!293 (_2!1076 lt!34392)))))

(declare-fun b!75811 () Bool)

(assert (=> b!75811 (= e!49501 ((_ is Undefined!237) lt!34395))))

(declare-fun b!75812 () Bool)

(assert (=> b!75812 (= e!49502 (not call!6807))))

(declare-fun b!75813 () Bool)

(declare-fun res!39947 () Bool)

(assert (=> b!75813 (= res!39947 call!6804)))

(assert (=> b!75813 (=> (not res!39947) (not e!49506))))

(declare-fun b!75814 () Bool)

(assert (=> b!75814 (= e!49503 (= (map!1155 (_2!1076 lt!34392)) (+!96 (map!1155 newMap!16) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(declare-fun b!75815 () Bool)

(declare-fun res!39950 () Bool)

(assert (=> b!75815 (=> (not res!39950) (not e!49503))))

(assert (=> b!75815 (= res!39950 (contains!727 (map!1155 (_2!1076 lt!34392)) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (= (and d!18051 c!11541) b!75799))

(assert (= (and d!18051 (not c!11541)) b!75809))

(assert (= (and b!75799 res!39952) b!75813))

(assert (= (and b!75813 res!39947) b!75803))

(assert (= (and b!75809 c!11543) b!75802))

(assert (= (and b!75809 (not c!11543)) b!75805))

(assert (= (and b!75802 res!39948) b!75801))

(assert (= (and b!75801 res!39951) b!75812))

(assert (= (and b!75805 c!11542) b!75800))

(assert (= (and b!75805 (not c!11542)) b!75811))

(assert (= (and b!75800 res!39949) b!75807))

(assert (= (and b!75807 res!39953) b!75806))

(assert (= (or b!75802 b!75800) bm!6804))

(assert (= (or b!75812 b!75806) bm!6801))

(assert (= (or b!75813 bm!6804) bm!6802))

(assert (= (or b!75799 b!75809) bm!6803))

(assert (= (and d!18051 c!11544) b!75808))

(assert (= (and d!18051 (not c!11544)) b!75804))

(assert (= (and d!18051 res!39946) b!75810))

(assert (= (and b!75810 res!39945) b!75815))

(assert (= (and b!75815 res!39950) b!75814))

(declare-fun m!75561 () Bool)

(assert (=> b!75815 m!75561))

(assert (=> b!75815 m!75561))

(assert (=> b!75815 m!74557))

(declare-fun m!75563 () Bool)

(assert (=> b!75815 m!75563))

(assert (=> b!75814 m!75561))

(assert (=> b!75814 m!74579))

(assert (=> b!75814 m!74579))

(declare-fun m!75565 () Bool)

(assert (=> b!75814 m!75565))

(assert (=> bm!6803 m!74557))

(assert (=> bm!6803 m!74871))

(declare-fun m!75567 () Bool)

(assert (=> b!75807 m!75567))

(assert (=> bm!6801 m!74557))

(assert (=> bm!6801 m!74863))

(assert (=> b!75799 m!74557))

(assert (=> b!75799 m!74875))

(declare-fun m!75569 () Bool)

(assert (=> b!75810 m!75569))

(assert (=> b!75808 m!74557))

(declare-fun m!75571 () Bool)

(assert (=> b!75808 m!75571))

(assert (=> b!75808 m!74667))

(assert (=> b!75808 m!74667))

(assert (=> b!75808 m!74557))

(declare-fun m!75573 () Bool)

(assert (=> b!75808 m!75573))

(declare-fun m!75575 () Bool)

(assert (=> bm!6802 m!75575))

(declare-fun m!75577 () Bool)

(assert (=> d!18051 m!75577))

(assert (=> d!18051 m!74557))

(assert (=> d!18051 m!74863))

(declare-fun m!75579 () Bool)

(assert (=> d!18051 m!75579))

(assert (=> d!18051 m!74557))

(declare-fun m!75581 () Bool)

(assert (=> d!18051 m!75581))

(assert (=> d!18051 m!74727))

(declare-fun m!75583 () Bool)

(assert (=> d!18051 m!75583))

(declare-fun m!75585 () Bool)

(assert (=> d!18051 m!75585))

(declare-fun m!75587 () Bool)

(assert (=> d!18051 m!75587))

(declare-fun m!75589 () Bool)

(assert (=> d!18051 m!75589))

(declare-fun m!75591 () Bool)

(assert (=> d!18051 m!75591))

(assert (=> d!18051 m!75583))

(declare-fun m!75593 () Bool)

(assert (=> d!18051 m!75593))

(assert (=> d!18051 m!74557))

(declare-fun m!75595 () Bool)

(assert (=> d!18051 m!75595))

(assert (=> d!18051 m!75591))

(assert (=> d!18051 m!74667))

(assert (=> d!18051 m!74557))

(assert (=> d!18051 m!75573))

(assert (=> d!18051 m!74557))

(declare-fun m!75597 () Bool)

(assert (=> d!18051 m!75597))

(declare-fun m!75599 () Bool)

(assert (=> d!18051 m!75599))

(assert (=> d!18051 m!74557))

(declare-fun m!75601 () Bool)

(assert (=> d!18051 m!75601))

(declare-fun m!75603 () Bool)

(assert (=> d!18051 m!75603))

(assert (=> d!18051 m!74557))

(declare-fun m!75605 () Bool)

(assert (=> d!18051 m!75605))

(assert (=> d!18051 m!74667))

(assert (=> d!18051 m!75349))

(declare-fun m!75607 () Bool)

(assert (=> d!18051 m!75607))

(assert (=> d!18051 m!74557))

(declare-fun m!75609 () Bool)

(assert (=> d!18051 m!75609))

(assert (=> d!18051 m!74667))

(assert (=> d!18051 m!74589))

(declare-fun m!75611 () Bool)

(assert (=> d!18051 m!75611))

(declare-fun m!75613 () Bool)

(assert (=> b!75801 m!75613))

(declare-fun m!75615 () Bool)

(assert (=> b!75803 m!75615))

(assert (=> b!75809 m!74557))

(assert (=> b!75809 m!74885))

(assert (=> bm!6719 d!18051))

(declare-fun d!18053 () Bool)

(assert (=> d!18053 (= (apply!76 lt!33914 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1150 (getValueByKey!134 (toList!727 lt!33914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3255 () Bool)

(assert (= bs!3255 d!18053))

(assert (=> bs!3255 m!74927))

(assert (=> bs!3255 m!74927))

(declare-fun m!75617 () Bool)

(assert (=> bs!3255 m!75617))

(assert (=> b!75133 d!18053))

(declare-fun d!18055 () Bool)

(assert (=> d!18055 (= (get!1149 (select (arr!1866 (_values!2217 (v!2546 (underlying!263 thiss!992)))) from!355) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!327 (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75217 d!18055))

(declare-fun d!18057 () Bool)

(declare-fun lt!34397 () Bool)

(assert (=> d!18057 (= lt!34397 (select (content!79 (toList!727 lt!33946)) lt!33813))))

(declare-fun e!49509 () Bool)

(assert (=> d!18057 (= lt!34397 e!49509)))

(declare-fun res!39955 () Bool)

(assert (=> d!18057 (=> (not res!39955) (not e!49509))))

(assert (=> d!18057 (= res!39955 ((_ is Cons!1478) (toList!727 lt!33946)))))

(assert (=> d!18057 (= (contains!729 (toList!727 lt!33946) lt!33813) lt!34397)))

(declare-fun b!75816 () Bool)

(declare-fun e!49510 () Bool)

(assert (=> b!75816 (= e!49509 e!49510)))

(declare-fun res!39954 () Bool)

(assert (=> b!75816 (=> res!39954 e!49510)))

(assert (=> b!75816 (= res!39954 (= (h!2066 (toList!727 lt!33946)) lt!33813))))

(declare-fun b!75817 () Bool)

(assert (=> b!75817 (= e!49510 (contains!729 (t!5060 (toList!727 lt!33946)) lt!33813))))

(assert (= (and d!18057 res!39955) b!75816))

(assert (= (and b!75816 (not res!39954)) b!75817))

(declare-fun m!75619 () Bool)

(assert (=> d!18057 m!75619))

(declare-fun m!75621 () Bool)

(assert (=> d!18057 m!75621))

(declare-fun m!75623 () Bool)

(assert (=> b!75817 m!75623))

(assert (=> b!75193 d!18057))

(declare-fun d!18059 () Bool)

(assert (=> d!18059 (= (apply!76 lt!33914 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1150 (getValueByKey!134 (toList!727 lt!33914) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3256 () Bool)

(assert (= bs!3256 d!18059))

(declare-fun m!75625 () Bool)

(assert (=> bs!3256 m!75625))

(assert (=> bs!3256 m!75625))

(declare-fun m!75627 () Bool)

(assert (=> bs!3256 m!75627))

(assert (=> b!75135 d!18059))

(declare-fun d!18061 () Bool)

(declare-fun e!49511 () Bool)

(assert (=> d!18061 e!49511))

(declare-fun res!39956 () Bool)

(assert (=> d!18061 (=> (not res!39956) (not e!49511))))

(declare-fun lt!34398 () ListLongMap!1423)

(assert (=> d!18061 (= res!39956 (contains!727 lt!34398 (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(declare-fun lt!34400 () List!1482)

(assert (=> d!18061 (= lt!34398 (ListLongMap!1424 lt!34400))))

(declare-fun lt!34399 () Unit!2157)

(declare-fun lt!34401 () Unit!2157)

(assert (=> d!18061 (= lt!34399 lt!34401)))

(assert (=> d!18061 (= (getValueByKey!134 lt!34400 (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))) (Some!139 (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(assert (=> d!18061 (= lt!34401 (lemmaContainsTupThenGetReturnValue!51 lt!34400 (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(assert (=> d!18061 (= lt!34400 (insertStrictlySorted!54 (toList!727 call!6721) (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(assert (=> d!18061 (= (+!96 call!6721 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) lt!34398)))

(declare-fun b!75818 () Bool)

(declare-fun res!39957 () Bool)

(assert (=> b!75818 (=> (not res!39957) (not e!49511))))

(assert (=> b!75818 (= res!39957 (= (getValueByKey!134 (toList!727 lt!34398) (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))) (Some!139 (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))))))

(declare-fun b!75819 () Bool)

(assert (=> b!75819 (= e!49511 (contains!729 (toList!727 lt!34398) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))))

(assert (= (and d!18061 res!39956) b!75818))

(assert (= (and b!75818 res!39957) b!75819))

(declare-fun m!75629 () Bool)

(assert (=> d!18061 m!75629))

(declare-fun m!75631 () Bool)

(assert (=> d!18061 m!75631))

(declare-fun m!75633 () Bool)

(assert (=> d!18061 m!75633))

(declare-fun m!75635 () Bool)

(assert (=> d!18061 m!75635))

(declare-fun m!75637 () Bool)

(assert (=> b!75818 m!75637))

(declare-fun m!75639 () Bool)

(assert (=> b!75819 m!75639))

(assert (=> b!75311 d!18061))

(declare-fun d!18063 () Bool)

(declare-fun e!49513 () Bool)

(assert (=> d!18063 e!49513))

(declare-fun res!39958 () Bool)

(assert (=> d!18063 (=> res!39958 e!49513)))

(declare-fun lt!34405 () Bool)

(assert (=> d!18063 (= res!39958 (not lt!34405))))

(declare-fun lt!34402 () Bool)

(assert (=> d!18063 (= lt!34405 lt!34402)))

(declare-fun lt!34403 () Unit!2157)

(declare-fun e!49512 () Unit!2157)

(assert (=> d!18063 (= lt!34403 e!49512)))

(declare-fun c!11545 () Bool)

(assert (=> d!18063 (= c!11545 lt!34402)))

(assert (=> d!18063 (= lt!34402 (containsKey!138 (toList!727 call!6736) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (=> d!18063 (= (contains!727 call!6736 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)) lt!34405)))

(declare-fun b!75820 () Bool)

(declare-fun lt!34404 () Unit!2157)

(assert (=> b!75820 (= e!49512 lt!34404)))

(assert (=> b!75820 (= lt!34404 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 call!6736) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(assert (=> b!75820 (isDefined!87 (getValueByKey!134 (toList!727 call!6736) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355)))))

(declare-fun b!75821 () Bool)

(declare-fun Unit!2187 () Unit!2157)

(assert (=> b!75821 (= e!49512 Unit!2187)))

(declare-fun b!75822 () Bool)

(assert (=> b!75822 (= e!49513 (isDefined!87 (getValueByKey!134 (toList!727 call!6736) (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355))))))

(assert (= (and d!18063 c!11545) b!75820))

(assert (= (and d!18063 (not c!11545)) b!75821))

(assert (= (and d!18063 (not res!39958)) b!75822))

(assert (=> d!18063 m!74557))

(declare-fun m!75641 () Bool)

(assert (=> d!18063 m!75641))

(assert (=> b!75820 m!74557))

(declare-fun m!75643 () Bool)

(assert (=> b!75820 m!75643))

(assert (=> b!75820 m!74557))

(declare-fun m!75645 () Bool)

(assert (=> b!75820 m!75645))

(assert (=> b!75820 m!75645))

(declare-fun m!75647 () Bool)

(assert (=> b!75820 m!75647))

(assert (=> b!75822 m!74557))

(assert (=> b!75822 m!75645))

(assert (=> b!75822 m!75645))

(assert (=> b!75822 m!75647))

(assert (=> b!75326 d!18063))

(declare-fun d!18065 () Bool)

(declare-fun e!49515 () Bool)

(assert (=> d!18065 e!49515))

(declare-fun res!39959 () Bool)

(assert (=> d!18065 (=> res!39959 e!49515)))

(declare-fun lt!34409 () Bool)

(assert (=> d!18065 (= res!39959 (not lt!34409))))

(declare-fun lt!34406 () Bool)

(assert (=> d!18065 (= lt!34409 lt!34406)))

(declare-fun lt!34407 () Unit!2157)

(declare-fun e!49514 () Unit!2157)

(assert (=> d!18065 (= lt!34407 e!49514)))

(declare-fun c!11546 () Bool)

(assert (=> d!18065 (= c!11546 lt!34406)))

(assert (=> d!18065 (= lt!34406 (containsKey!138 (toList!727 lt!33958) (_1!1077 lt!33803)))))

(assert (=> d!18065 (= (contains!727 lt!33958 (_1!1077 lt!33803)) lt!34409)))

(declare-fun b!75823 () Bool)

(declare-fun lt!34408 () Unit!2157)

(assert (=> b!75823 (= e!49514 lt!34408)))

(assert (=> b!75823 (= lt!34408 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 lt!33958) (_1!1077 lt!33803)))))

(assert (=> b!75823 (isDefined!87 (getValueByKey!134 (toList!727 lt!33958) (_1!1077 lt!33803)))))

(declare-fun b!75824 () Bool)

(declare-fun Unit!2188 () Unit!2157)

(assert (=> b!75824 (= e!49514 Unit!2188)))

(declare-fun b!75825 () Bool)

(assert (=> b!75825 (= e!49515 (isDefined!87 (getValueByKey!134 (toList!727 lt!33958) (_1!1077 lt!33803))))))

(assert (= (and d!18065 c!11546) b!75823))

(assert (= (and d!18065 (not c!11546)) b!75824))

(assert (= (and d!18065 (not res!39959)) b!75825))

(declare-fun m!75649 () Bool)

(assert (=> d!18065 m!75649))

(declare-fun m!75651 () Bool)

(assert (=> b!75823 m!75651))

(assert (=> b!75823 m!74797))

(assert (=> b!75823 m!74797))

(declare-fun m!75653 () Bool)

(assert (=> b!75823 m!75653))

(assert (=> b!75825 m!74797))

(assert (=> b!75825 m!74797))

(assert (=> b!75825 m!75653))

(assert (=> d!17855 d!18065))

(declare-fun b!75828 () Bool)

(declare-fun e!49517 () Option!140)

(assert (=> b!75828 (= e!49517 (getValueByKey!134 (t!5060 lt!33960) (_1!1077 lt!33803)))))

(declare-fun d!18067 () Bool)

(declare-fun c!11547 () Bool)

(assert (=> d!18067 (= c!11547 (and ((_ is Cons!1478) lt!33960) (= (_1!1077 (h!2066 lt!33960)) (_1!1077 lt!33803))))))

(declare-fun e!49516 () Option!140)

(assert (=> d!18067 (= (getValueByKey!134 lt!33960 (_1!1077 lt!33803)) e!49516)))

(declare-fun b!75827 () Bool)

(assert (=> b!75827 (= e!49516 e!49517)))

(declare-fun c!11548 () Bool)

(assert (=> b!75827 (= c!11548 (and ((_ is Cons!1478) lt!33960) (not (= (_1!1077 (h!2066 lt!33960)) (_1!1077 lt!33803)))))))

(declare-fun b!75826 () Bool)

(assert (=> b!75826 (= e!49516 (Some!139 (_2!1077 (h!2066 lt!33960))))))

(declare-fun b!75829 () Bool)

(assert (=> b!75829 (= e!49517 None!138)))

(assert (= (and d!18067 c!11547) b!75826))

(assert (= (and d!18067 (not c!11547)) b!75827))

(assert (= (and b!75827 c!11548) b!75828))

(assert (= (and b!75827 (not c!11548)) b!75829))

(declare-fun m!75655 () Bool)

(assert (=> b!75828 m!75655))

(assert (=> d!17855 d!18067))

(declare-fun d!18069 () Bool)

(assert (=> d!18069 (= (getValueByKey!134 lt!33960 (_1!1077 lt!33803)) (Some!139 (_2!1077 lt!33803)))))

(declare-fun lt!34410 () Unit!2157)

(assert (=> d!18069 (= lt!34410 (choose!427 lt!33960 (_1!1077 lt!33803) (_2!1077 lt!33803)))))

(declare-fun e!49518 () Bool)

(assert (=> d!18069 e!49518))

(declare-fun res!39960 () Bool)

(assert (=> d!18069 (=> (not res!39960) (not e!49518))))

(assert (=> d!18069 (= res!39960 (isStrictlySorted!293 lt!33960))))

(assert (=> d!18069 (= (lemmaContainsTupThenGetReturnValue!51 lt!33960 (_1!1077 lt!33803) (_2!1077 lt!33803)) lt!34410)))

(declare-fun b!75830 () Bool)

(declare-fun res!39961 () Bool)

(assert (=> b!75830 (=> (not res!39961) (not e!49518))))

(assert (=> b!75830 (= res!39961 (containsKey!138 lt!33960 (_1!1077 lt!33803)))))

(declare-fun b!75831 () Bool)

(assert (=> b!75831 (= e!49518 (contains!729 lt!33960 (tuple2!2133 (_1!1077 lt!33803) (_2!1077 lt!33803))))))

(assert (= (and d!18069 res!39960) b!75830))

(assert (= (and b!75830 res!39961) b!75831))

(assert (=> d!18069 m!74791))

(declare-fun m!75657 () Bool)

(assert (=> d!18069 m!75657))

(declare-fun m!75659 () Bool)

(assert (=> d!18069 m!75659))

(declare-fun m!75661 () Bool)

(assert (=> b!75830 m!75661))

(declare-fun m!75663 () Bool)

(assert (=> b!75831 m!75663))

(assert (=> d!17855 d!18069))

(declare-fun b!75832 () Bool)

(declare-fun e!49522 () List!1482)

(declare-fun call!6809 () List!1482)

(assert (=> b!75832 (= e!49522 call!6809)))

(declare-fun b!75833 () Bool)

(declare-fun e!49519 () List!1482)

(declare-fun call!6808 () List!1482)

(assert (=> b!75833 (= e!49519 call!6808)))

(declare-fun b!75834 () Bool)

(assert (=> b!75834 (= e!49522 call!6809)))

(declare-fun b!75835 () Bool)

(declare-fun e!49523 () List!1482)

(declare-fun call!6810 () List!1482)

(assert (=> b!75835 (= e!49523 call!6810)))

(declare-fun b!75836 () Bool)

(declare-fun e!49521 () List!1482)

(assert (=> b!75836 (= e!49521 (insertStrictlySorted!54 (t!5060 (toList!727 lt!33809)) (_1!1077 lt!33803) (_2!1077 lt!33803)))))

(declare-fun b!75837 () Bool)

(declare-fun e!49520 () Bool)

(declare-fun lt!34411 () List!1482)

(assert (=> b!75837 (= e!49520 (contains!729 lt!34411 (tuple2!2133 (_1!1077 lt!33803) (_2!1077 lt!33803))))))

(declare-fun b!75838 () Bool)

(assert (=> b!75838 (= e!49523 e!49519)))

(declare-fun c!11552 () Bool)

(assert (=> b!75838 (= c!11552 (and ((_ is Cons!1478) (toList!727 lt!33809)) (= (_1!1077 (h!2066 (toList!727 lt!33809))) (_1!1077 lt!33803))))))

(declare-fun bm!6805 () Bool)

(assert (=> bm!6805 (= call!6809 call!6808)))

(declare-fun b!75839 () Bool)

(declare-fun c!11549 () Bool)

(assert (=> b!75839 (= c!11549 (and ((_ is Cons!1478) (toList!727 lt!33809)) (bvsgt (_1!1077 (h!2066 (toList!727 lt!33809))) (_1!1077 lt!33803))))))

(assert (=> b!75839 (= e!49519 e!49522)))

(declare-fun b!75841 () Bool)

(declare-fun res!39962 () Bool)

(assert (=> b!75841 (=> (not res!39962) (not e!49520))))

(assert (=> b!75841 (= res!39962 (containsKey!138 lt!34411 (_1!1077 lt!33803)))))

(declare-fun bm!6806 () Bool)

(declare-fun c!11550 () Bool)

(assert (=> bm!6806 (= call!6810 ($colon$colon!67 e!49521 (ite c!11550 (h!2066 (toList!727 lt!33809)) (tuple2!2133 (_1!1077 lt!33803) (_2!1077 lt!33803)))))))

(declare-fun c!11551 () Bool)

(assert (=> bm!6806 (= c!11551 c!11550)))

(declare-fun bm!6807 () Bool)

(assert (=> bm!6807 (= call!6808 call!6810)))

(declare-fun b!75840 () Bool)

(assert (=> b!75840 (= e!49521 (ite c!11552 (t!5060 (toList!727 lt!33809)) (ite c!11549 (Cons!1478 (h!2066 (toList!727 lt!33809)) (t!5060 (toList!727 lt!33809))) Nil!1479)))))

(declare-fun d!18071 () Bool)

(assert (=> d!18071 e!49520))

(declare-fun res!39963 () Bool)

(assert (=> d!18071 (=> (not res!39963) (not e!49520))))

(assert (=> d!18071 (= res!39963 (isStrictlySorted!293 lt!34411))))

(assert (=> d!18071 (= lt!34411 e!49523)))

(assert (=> d!18071 (= c!11550 (and ((_ is Cons!1478) (toList!727 lt!33809)) (bvslt (_1!1077 (h!2066 (toList!727 lt!33809))) (_1!1077 lt!33803))))))

(assert (=> d!18071 (isStrictlySorted!293 (toList!727 lt!33809))))

(assert (=> d!18071 (= (insertStrictlySorted!54 (toList!727 lt!33809) (_1!1077 lt!33803) (_2!1077 lt!33803)) lt!34411)))

(assert (= (and d!18071 c!11550) b!75835))

(assert (= (and d!18071 (not c!11550)) b!75838))

(assert (= (and b!75838 c!11552) b!75833))

(assert (= (and b!75838 (not c!11552)) b!75839))

(assert (= (and b!75839 c!11549) b!75832))

(assert (= (and b!75839 (not c!11549)) b!75834))

(assert (= (or b!75832 b!75834) bm!6805))

(assert (= (or b!75833 bm!6805) bm!6807))

(assert (= (or b!75835 bm!6807) bm!6806))

(assert (= (and bm!6806 c!11551) b!75836))

(assert (= (and bm!6806 (not c!11551)) b!75840))

(assert (= (and d!18071 res!39963) b!75841))

(assert (= (and b!75841 res!39962) b!75837))

(declare-fun m!75665 () Bool)

(assert (=> b!75836 m!75665))

(declare-fun m!75667 () Bool)

(assert (=> b!75837 m!75667))

(declare-fun m!75669 () Bool)

(assert (=> b!75841 m!75669))

(declare-fun m!75671 () Bool)

(assert (=> d!18071 m!75671))

(assert (=> d!18071 m!75157))

(declare-fun m!75673 () Bool)

(assert (=> bm!6806 m!75673))

(assert (=> d!17855 d!18071))

(declare-fun d!18073 () Bool)

(declare-fun lt!34412 () Bool)

(assert (=> d!18073 (= lt!34412 (select (content!79 (toList!727 lt!33950)) lt!33803))))

(declare-fun e!49524 () Bool)

(assert (=> d!18073 (= lt!34412 e!49524)))

(declare-fun res!39965 () Bool)

(assert (=> d!18073 (=> (not res!39965) (not e!49524))))

(assert (=> d!18073 (= res!39965 ((_ is Cons!1478) (toList!727 lt!33950)))))

(assert (=> d!18073 (= (contains!729 (toList!727 lt!33950) lt!33803) lt!34412)))

(declare-fun b!75842 () Bool)

(declare-fun e!49525 () Bool)

(assert (=> b!75842 (= e!49524 e!49525)))

(declare-fun res!39964 () Bool)

(assert (=> b!75842 (=> res!39964 e!49525)))

(assert (=> b!75842 (= res!39964 (= (h!2066 (toList!727 lt!33950)) lt!33803))))

(declare-fun b!75843 () Bool)

(assert (=> b!75843 (= e!49525 (contains!729 (t!5060 (toList!727 lt!33950)) lt!33803))))

(assert (= (and d!18073 res!39965) b!75842))

(assert (= (and b!75842 (not res!39964)) b!75843))

(declare-fun m!75675 () Bool)

(assert (=> d!18073 m!75675))

(declare-fun m!75677 () Bool)

(assert (=> d!18073 m!75677))

(declare-fun m!75679 () Bool)

(assert (=> b!75843 m!75679))

(assert (=> b!75195 d!18073))

(declare-fun d!18075 () Bool)

(declare-fun e!49526 () Bool)

(assert (=> d!18075 e!49526))

(declare-fun res!39966 () Bool)

(assert (=> d!18075 (=> (not res!39966) (not e!49526))))

(declare-fun lt!34413 () ListLongMap!1423)

(assert (=> d!18075 (= res!39966 (contains!727 lt!34413 (_1!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(declare-fun lt!34415 () List!1482)

(assert (=> d!18075 (= lt!34413 (ListLongMap!1424 lt!34415))))

(declare-fun lt!34414 () Unit!2157)

(declare-fun lt!34416 () Unit!2157)

(assert (=> d!18075 (= lt!34414 lt!34416)))

(assert (=> d!18075 (= (getValueByKey!134 lt!34415 (_1!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!18075 (= lt!34416 (lemmaContainsTupThenGetReturnValue!51 lt!34415 (_1!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!18075 (= lt!34415 (insertStrictlySorted!54 (toList!727 (+!96 lt!33809 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))) (_1!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!18075 (= (+!96 (+!96 lt!33809 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!34413)))

(declare-fun b!75844 () Bool)

(declare-fun res!39967 () Bool)

(assert (=> b!75844 (=> (not res!39967) (not e!49526))))

(assert (=> b!75844 (= res!39967 (= (getValueByKey!134 (toList!727 lt!34413) (_1!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))))))))

(declare-fun b!75845 () Bool)

(assert (=> b!75845 (= e!49526 (contains!729 (toList!727 lt!34413) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))))))

(assert (= (and d!18075 res!39966) b!75844))

(assert (= (and b!75844 res!39967) b!75845))

(declare-fun m!75681 () Bool)

(assert (=> d!18075 m!75681))

(declare-fun m!75683 () Bool)

(assert (=> d!18075 m!75683))

(declare-fun m!75685 () Bool)

(assert (=> d!18075 m!75685))

(declare-fun m!75687 () Bool)

(assert (=> d!18075 m!75687))

(declare-fun m!75689 () Bool)

(assert (=> b!75844 m!75689))

(declare-fun m!75691 () Bool)

(assert (=> b!75845 m!75691))

(assert (=> d!17857 d!18075))

(declare-fun d!18077 () Bool)

(declare-fun e!49527 () Bool)

(assert (=> d!18077 e!49527))

(declare-fun res!39968 () Bool)

(assert (=> d!18077 (=> (not res!39968) (not e!49527))))

(declare-fun lt!34417 () ListLongMap!1423)

(assert (=> d!18077 (= res!39968 (contains!727 lt!34417 (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(declare-fun lt!34419 () List!1482)

(assert (=> d!18077 (= lt!34417 (ListLongMap!1424 lt!34419))))

(declare-fun lt!34418 () Unit!2157)

(declare-fun lt!34420 () Unit!2157)

(assert (=> d!18077 (= lt!34418 lt!34420)))

(assert (=> d!18077 (= (getValueByKey!134 lt!34419 (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))) (Some!139 (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(assert (=> d!18077 (= lt!34420 (lemmaContainsTupThenGetReturnValue!51 lt!34419 (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(assert (=> d!18077 (= lt!34419 (insertStrictlySorted!54 (toList!727 (+!96 lt!33809 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(assert (=> d!18077 (= (+!96 (+!96 lt!33809 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) lt!34417)))

(declare-fun b!75846 () Bool)

(declare-fun res!39969 () Bool)

(assert (=> b!75846 (=> (not res!39969) (not e!49527))))

(assert (=> b!75846 (= res!39969 (= (getValueByKey!134 (toList!727 lt!34417) (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))) (Some!139 (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))))))

(declare-fun b!75847 () Bool)

(assert (=> b!75847 (= e!49527 (contains!729 (toList!727 lt!34417) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))))

(assert (= (and d!18077 res!39968) b!75846))

(assert (= (and b!75846 res!39969) b!75847))

(declare-fun m!75693 () Bool)

(assert (=> d!18077 m!75693))

(declare-fun m!75695 () Bool)

(assert (=> d!18077 m!75695))

(declare-fun m!75697 () Bool)

(assert (=> d!18077 m!75697))

(declare-fun m!75699 () Bool)

(assert (=> d!18077 m!75699))

(declare-fun m!75701 () Bool)

(assert (=> b!75846 m!75701))

(declare-fun m!75703 () Bool)

(assert (=> b!75847 m!75703))

(assert (=> d!17857 d!18077))

(declare-fun d!18079 () Bool)

(assert (=> d!18079 (= (+!96 (+!96 lt!33809 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) (+!96 (+!96 lt!33809 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))))

(assert (=> d!18079 true))

(declare-fun _$28!124 () Unit!2157)

(assert (=> d!18079 (= (choose!425 lt!33809 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))) _$28!124)))

(declare-fun bs!3257 () Bool)

(assert (= bs!3257 d!18079))

(assert (=> bs!3257 m!74807))

(assert (=> bs!3257 m!74807))

(assert (=> bs!3257 m!74809))

(assert (=> bs!3257 m!74803))

(assert (=> bs!3257 m!74803))

(assert (=> bs!3257 m!74805))

(assert (=> d!17857 d!18079))

(declare-fun d!18081 () Bool)

(declare-fun e!49528 () Bool)

(assert (=> d!18081 e!49528))

(declare-fun res!39970 () Bool)

(assert (=> d!18081 (=> (not res!39970) (not e!49528))))

(declare-fun lt!34421 () ListLongMap!1423)

(assert (=> d!18081 (= res!39970 (contains!727 lt!34421 (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(declare-fun lt!34423 () List!1482)

(assert (=> d!18081 (= lt!34421 (ListLongMap!1424 lt!34423))))

(declare-fun lt!34422 () Unit!2157)

(declare-fun lt!34424 () Unit!2157)

(assert (=> d!18081 (= lt!34422 lt!34424)))

(assert (=> d!18081 (= (getValueByKey!134 lt!34423 (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))) (Some!139 (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(assert (=> d!18081 (= lt!34424 (lemmaContainsTupThenGetReturnValue!51 lt!34423 (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(assert (=> d!18081 (= lt!34423 (insertStrictlySorted!54 (toList!727 lt!33809) (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))))))

(assert (=> d!18081 (= (+!96 lt!33809 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)) lt!34421)))

(declare-fun b!75848 () Bool)

(declare-fun res!39971 () Bool)

(assert (=> b!75848 (=> (not res!39971) (not e!49528))))

(assert (=> b!75848 (= res!39971 (= (getValueByKey!134 (toList!727 lt!34421) (_1!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806))) (Some!139 (_2!1077 (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))))))

(declare-fun b!75849 () Bool)

(assert (=> b!75849 (= e!49528 (contains!729 (toList!727 lt!34421) (tuple2!2133 (select (arr!1865 (_keys!3890 (v!2546 (underlying!263 thiss!992)))) from!355) lt!33806)))))

(assert (= (and d!18081 res!39970) b!75848))

(assert (= (and b!75848 res!39971) b!75849))

(declare-fun m!75705 () Bool)

(assert (=> d!18081 m!75705))

(declare-fun m!75707 () Bool)

(assert (=> d!18081 m!75707))

(declare-fun m!75709 () Bool)

(assert (=> d!18081 m!75709))

(declare-fun m!75711 () Bool)

(assert (=> d!18081 m!75711))

(declare-fun m!75713 () Bool)

(assert (=> b!75848 m!75713))

(declare-fun m!75715 () Bool)

(assert (=> b!75849 m!75715))

(assert (=> d!17857 d!18081))

(declare-fun d!18083 () Bool)

(declare-fun e!49529 () Bool)

(assert (=> d!18083 e!49529))

(declare-fun res!39972 () Bool)

(assert (=> d!18083 (=> (not res!39972) (not e!49529))))

(declare-fun lt!34425 () ListLongMap!1423)

(assert (=> d!18083 (= res!39972 (contains!727 lt!34425 (_1!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(declare-fun lt!34427 () List!1482)

(assert (=> d!18083 (= lt!34425 (ListLongMap!1424 lt!34427))))

(declare-fun lt!34426 () Unit!2157)

(declare-fun lt!34428 () Unit!2157)

(assert (=> d!18083 (= lt!34426 lt!34428)))

(assert (=> d!18083 (= (getValueByKey!134 lt!34427 (_1!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!18083 (= lt!34428 (lemmaContainsTupThenGetReturnValue!51 lt!34427 (_1!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!18083 (= lt!34427 (insertStrictlySorted!54 (toList!727 lt!33809) (_1!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!18083 (= (+!96 lt!33809 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!34425)))

(declare-fun b!75850 () Bool)

(declare-fun res!39973 () Bool)

(assert (=> b!75850 (=> (not res!39973) (not e!49529))))

(assert (=> b!75850 (= res!39973 (= (getValueByKey!134 (toList!727 lt!34425) (_1!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))))))))

(declare-fun b!75851 () Bool)

(assert (=> b!75851 (= e!49529 (contains!729 (toList!727 lt!34425) (tuple2!2133 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2134 (v!2546 (underlying!263 thiss!992))))))))

(assert (= (and d!18083 res!39972) b!75850))

(assert (= (and b!75850 res!39973) b!75851))

(declare-fun m!75717 () Bool)

(assert (=> d!18083 m!75717))

(declare-fun m!75719 () Bool)

(assert (=> d!18083 m!75719))

(declare-fun m!75721 () Bool)

(assert (=> d!18083 m!75721))

(declare-fun m!75723 () Bool)

(assert (=> d!18083 m!75723))

(declare-fun m!75725 () Bool)

(assert (=> b!75850 m!75725))

(declare-fun m!75727 () Bool)

(assert (=> b!75851 m!75727))

(assert (=> d!17857 d!18083))

(declare-fun d!18085 () Bool)

(declare-fun lt!34429 () Bool)

(assert (=> d!18085 (= lt!34429 (select (content!79 (toList!727 lt!33954)) lt!33813))))

(declare-fun e!49530 () Bool)

(assert (=> d!18085 (= lt!34429 e!49530)))

(declare-fun res!39975 () Bool)

(assert (=> d!18085 (=> (not res!39975) (not e!49530))))

(assert (=> d!18085 (= res!39975 ((_ is Cons!1478) (toList!727 lt!33954)))))

(assert (=> d!18085 (= (contains!729 (toList!727 lt!33954) lt!33813) lt!34429)))

(declare-fun b!75852 () Bool)

(declare-fun e!49531 () Bool)

(assert (=> b!75852 (= e!49530 e!49531)))

(declare-fun res!39974 () Bool)

(assert (=> b!75852 (=> res!39974 e!49531)))

(assert (=> b!75852 (= res!39974 (= (h!2066 (toList!727 lt!33954)) lt!33813))))

(declare-fun b!75853 () Bool)

(assert (=> b!75853 (= e!49531 (contains!729 (t!5060 (toList!727 lt!33954)) lt!33813))))

(assert (= (and d!18085 res!39975) b!75852))

(assert (= (and b!75852 (not res!39974)) b!75853))

(declare-fun m!75729 () Bool)

(assert (=> d!18085 m!75729))

(declare-fun m!75731 () Bool)

(assert (=> d!18085 m!75731))

(declare-fun m!75733 () Bool)

(assert (=> b!75853 m!75733))

(assert (=> b!75197 d!18085))

(declare-fun d!18087 () Bool)

(declare-fun e!49532 () Bool)

(assert (=> d!18087 e!49532))

(declare-fun res!39976 () Bool)

(assert (=> d!18087 (=> (not res!39976) (not e!49532))))

(declare-fun lt!34430 () ListLongMap!1423)

(assert (=> d!18087 (= res!39976 (contains!727 lt!34430 (_1!1077 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(declare-fun lt!34432 () List!1482)

(assert (=> d!18087 (= lt!34430 (ListLongMap!1424 lt!34432))))

(declare-fun lt!34431 () Unit!2157)

(declare-fun lt!34433 () Unit!2157)

(assert (=> d!18087 (= lt!34431 lt!34433)))

(assert (=> d!18087 (= (getValueByKey!134 lt!34432 (_1!1077 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!18087 (= lt!34433 (lemmaContainsTupThenGetReturnValue!51 lt!34432 (_1!1077 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!18087 (= lt!34432 (insertStrictlySorted!54 (toList!727 call!6664) (_1!1077 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) (_2!1077 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))))))

(assert (=> d!18087 (= (+!96 call!6664 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992))))) lt!34430)))

(declare-fun b!75854 () Bool)

(declare-fun res!39977 () Bool)

(assert (=> b!75854 (=> (not res!39977) (not e!49532))))

(assert (=> b!75854 (= res!39977 (= (getValueByKey!134 (toList!727 lt!34430) (_1!1077 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992)))))) (Some!139 (_2!1077 (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992))))))))))

(declare-fun b!75855 () Bool)

(assert (=> b!75855 (= e!49532 (contains!729 (toList!727 lt!34430) (tuple2!2133 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2134 (v!2546 (underlying!263 thiss!992))))))))

(assert (= (and d!18087 res!39976) b!75854))

(assert (= (and b!75854 res!39977) b!75855))

(declare-fun m!75735 () Bool)

(assert (=> d!18087 m!75735))

(declare-fun m!75737 () Bool)

(assert (=> d!18087 m!75737))

(declare-fun m!75739 () Bool)

(assert (=> d!18087 m!75739))

(declare-fun m!75741 () Bool)

(assert (=> d!18087 m!75741))

(declare-fun m!75743 () Bool)

(assert (=> b!75854 m!75743))

(declare-fun m!75745 () Bool)

(assert (=> b!75855 m!75745))

(assert (=> b!75137 d!18087))

(declare-fun d!18089 () Bool)

(declare-fun e!49534 () Bool)

(assert (=> d!18089 e!49534))

(declare-fun res!39978 () Bool)

(assert (=> d!18089 (=> res!39978 e!49534)))

(declare-fun lt!34437 () Bool)

(assert (=> d!18089 (= res!39978 (not lt!34437))))

(declare-fun lt!34434 () Bool)

(assert (=> d!18089 (= lt!34437 lt!34434)))

(declare-fun lt!34435 () Unit!2157)

(declare-fun e!49533 () Unit!2157)

(assert (=> d!18089 (= lt!34435 e!49533)))

(declare-fun c!11553 () Bool)

(assert (=> d!18089 (= c!11553 lt!34434)))

(assert (=> d!18089 (= lt!34434 (containsKey!138 (toList!727 lt!33914) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18089 (= (contains!727 lt!33914 #b1000000000000000000000000000000000000000000000000000000000000000) lt!34437)))

(declare-fun b!75856 () Bool)

(declare-fun lt!34436 () Unit!2157)

(assert (=> b!75856 (= e!49533 lt!34436)))

(assert (=> b!75856 (= lt!34436 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!727 lt!33914) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75856 (isDefined!87 (getValueByKey!134 (toList!727 lt!33914) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75857 () Bool)

(declare-fun Unit!2189 () Unit!2157)

(assert (=> b!75857 (= e!49533 Unit!2189)))

(declare-fun b!75858 () Bool)

(assert (=> b!75858 (= e!49534 (isDefined!87 (getValueByKey!134 (toList!727 lt!33914) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18089 c!11553) b!75856))

(assert (= (and d!18089 (not c!11553)) b!75857))

(assert (= (and d!18089 (not res!39978)) b!75858))

(declare-fun m!75747 () Bool)

(assert (=> d!18089 m!75747))

(declare-fun m!75749 () Bool)

(assert (=> b!75856 m!75749))

(assert (=> b!75856 m!75625))

(assert (=> b!75856 m!75625))

(declare-fun m!75751 () Bool)

(assert (=> b!75856 m!75751))

(assert (=> b!75858 m!75625))

(assert (=> b!75858 m!75625))

(assert (=> b!75858 m!75751))

(assert (=> bm!6659 d!18089))

(declare-fun mapIsEmpty!3209 () Bool)

(declare-fun mapRes!3209 () Bool)

(assert (=> mapIsEmpty!3209 mapRes!3209))

(declare-fun b!75860 () Bool)

(declare-fun e!49535 () Bool)

(assert (=> b!75860 (= e!49535 tp_is_empty!2481)))

(declare-fun mapNonEmpty!3209 () Bool)

(declare-fun tp!8591 () Bool)

(declare-fun e!49536 () Bool)

(assert (=> mapNonEmpty!3209 (= mapRes!3209 (and tp!8591 e!49536))))

(declare-fun mapKey!3209 () (_ BitVec 32))

(declare-fun mapRest!3209 () (Array (_ BitVec 32) ValueCell!897))

(declare-fun mapValue!3209 () ValueCell!897)

(assert (=> mapNonEmpty!3209 (= mapRest!3208 (store mapRest!3209 mapKey!3209 mapValue!3209))))

(declare-fun b!75859 () Bool)

(assert (=> b!75859 (= e!49536 tp_is_empty!2481)))

(declare-fun condMapEmpty!3209 () Bool)

(declare-fun mapDefault!3209 () ValueCell!897)

(assert (=> mapNonEmpty!3208 (= condMapEmpty!3209 (= mapRest!3208 ((as const (Array (_ BitVec 32) ValueCell!897)) mapDefault!3209)))))

(assert (=> mapNonEmpty!3208 (= tp!8590 (and e!49535 mapRes!3209))))

(assert (= (and mapNonEmpty!3208 condMapEmpty!3209) mapIsEmpty!3209))

(assert (= (and mapNonEmpty!3208 (not condMapEmpty!3209)) mapNonEmpty!3209))

(assert (= (and mapNonEmpty!3209 ((_ is ValueCellFull!897) mapValue!3209)) b!75859))

(assert (= (and mapNonEmpty!3208 ((_ is ValueCellFull!897) mapDefault!3209)) b!75860))

(declare-fun m!75753 () Bool)

(assert (=> mapNonEmpty!3209 m!75753))

(declare-fun mapIsEmpty!3210 () Bool)

(declare-fun mapRes!3210 () Bool)

(assert (=> mapIsEmpty!3210 mapRes!3210))

(declare-fun b!75862 () Bool)

(declare-fun e!49537 () Bool)

(assert (=> b!75862 (= e!49537 tp_is_empty!2481)))

(declare-fun mapNonEmpty!3210 () Bool)

(declare-fun tp!8592 () Bool)

(declare-fun e!49538 () Bool)

(assert (=> mapNonEmpty!3210 (= mapRes!3210 (and tp!8592 e!49538))))

(declare-fun mapValue!3210 () ValueCell!897)

(declare-fun mapRest!3210 () (Array (_ BitVec 32) ValueCell!897))

(declare-fun mapKey!3210 () (_ BitVec 32))

(assert (=> mapNonEmpty!3210 (= mapRest!3207 (store mapRest!3210 mapKey!3210 mapValue!3210))))

(declare-fun b!75861 () Bool)

(assert (=> b!75861 (= e!49538 tp_is_empty!2481)))

(declare-fun condMapEmpty!3210 () Bool)

(declare-fun mapDefault!3210 () ValueCell!897)

(assert (=> mapNonEmpty!3207 (= condMapEmpty!3210 (= mapRest!3207 ((as const (Array (_ BitVec 32) ValueCell!897)) mapDefault!3210)))))

(assert (=> mapNonEmpty!3207 (= tp!8589 (and e!49537 mapRes!3210))))

(assert (= (and mapNonEmpty!3207 condMapEmpty!3210) mapIsEmpty!3210))

(assert (= (and mapNonEmpty!3207 (not condMapEmpty!3210)) mapNonEmpty!3210))

(assert (= (and mapNonEmpty!3210 ((_ is ValueCellFull!897) mapValue!3210)) b!75861))

(assert (= (and mapNonEmpty!3207 ((_ is ValueCellFull!897) mapDefault!3210)) b!75862))

(declare-fun m!75755 () Bool)

(assert (=> mapNonEmpty!3210 m!75755))

(declare-fun b_lambda!3401 () Bool)

(assert (= b_lambda!3399 (or (and b!75012 b_free!2129 (= (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) (defaultEntry!2234 newMap!16))) (and b!74998 b_free!2131) b_lambda!3401)))

(declare-fun b_lambda!3403 () Bool)

(assert (= b_lambda!3397 (or (and b!75012 b_free!2129 (= (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) (defaultEntry!2234 newMap!16))) (and b!74998 b_free!2131) b_lambda!3403)))

(declare-fun b_lambda!3405 () Bool)

(assert (= b_lambda!3393 (or (and b!75012 b_free!2129) (and b!74998 b_free!2131 (= (defaultEntry!2234 newMap!16) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))))) b_lambda!3405)))

(declare-fun b_lambda!3407 () Bool)

(assert (= b_lambda!3391 (or (and b!75012 b_free!2129) (and b!74998 b_free!2131 (= (defaultEntry!2234 newMap!16) (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))))) b_lambda!3407)))

(declare-fun b_lambda!3409 () Bool)

(assert (= b_lambda!3395 (or (and b!75012 b_free!2129 (= (defaultEntry!2234 (v!2546 (underlying!263 thiss!992))) (defaultEntry!2234 newMap!16))) (and b!74998 b_free!2131) b_lambda!3409)))

(check-sat (not b!75762) (not b!75754) (not bm!6792) (not b_lambda!3385) (not b!75755) (not d!17963) (not b!75487) (not b!75646) (not b!75614) (not d!18089) (not b!75810) (not d!17931) (not d!18079) (not b!75847) (not b!75469) (not d!17995) (not b!75820) (not bm!6770) (not d!18087) (not b!75756) (not b!75417) (not b!75694) (not d!17879) (not bm!6752) (not b!75540) (not bm!6773) (not b!75512) (not b!75846) (not b!75529) (not d!18061) (not b!75513) (not b!75623) (not d!17929) (not d!17977) (not d!18023) (not b!75626) (not d!18083) (not b!75622) (not b!75527) (not b_lambda!3387) (not b!75649) (not b_next!2129) (not b!75679) (not b_lambda!3401) (not bm!6784) (not b!75586) (not bm!6765) (not b!75522) (not b!75531) (not b!75564) (not b!75841) (not d!18041) (not d!18075) (not d!17893) (not b!75851) (not b!75466) (not b!75808) (not b!75394) (not d!18025) (not b!75603) (not d!17957) (not b!75414) (not d!18013) (not b!75474) (not b!75686) (not b!75855) (not b!75637) (not b!75538) (not b!75659) (not b!75566) (not bm!6801) b_and!4637 (not b_lambda!3409) (not b!75415) (not d!17951) (not b!75488) (not d!17989) (not bm!6762) (not b!75601) (not b!75386) (not b!75578) (not b!75844) (not b!75845) (not b!75492) (not bm!6759) (not b_lambda!3407) (not b_lambda!3389) (not b!75850) (not b!75818) (not b!75477) (not d!17941) (not d!17997) (not d!18071) (not b!75568) (not bm!6771) (not b!75478) (not b!75836) (not b!75435) (not b!75582) (not d!17909) (not b!75748) (not b!75504) (not d!18003) (not d!17881) (not d!18069) (not b!75854) (not d!18043) (not b!75641) (not b!75657) (not b!75412) (not b!75615) (not b!75507) (not b!75707) (not d!18031) (not d!18059) (not d!18037) (not b!75848) (not d!17903) (not d!18045) (not b!75392) (not d!17965) (not mapNonEmpty!3209) (not b!75688) (not b!75630) (not b!75501) (not b!75856) (not b!75625) (not d!17925) (not d!18081) (not b!75809) (not b!75747) (not b!75496) (not bm!6782) (not b!75384) (not b!75518) (not b_lambda!3405) (not d!18057) (not b!75750) (not b!75853) (not b!75655) (not b!75389) (not b!75837) (not d!17999) (not b!75481) (not b!75482) (not b!75550) (not b!75471) (not bm!6806) (not d!17945) (not d!18021) (not b!75654) (not b!75858) (not b!75831) (not d!17987) (not d!18063) (not bm!6778) tp_is_empty!2481 (not b!75468) (not b!75799) (not d!18053) (not d!17927) (not d!17993) (not b!75752) (not d!18065) (not d!18047) (not d!17985) (not d!17899) (not b_lambda!3377) (not d!17935) (not b!75594) (not d!17937) (not b!75388) (not bm!6766) (not b!75819) (not b!75494) (not bm!6774) (not b!75473) (not b!75461) (not d!18033) (not d!17913) (not b!75499) (not bm!6791) (not b!75393) (not bm!6780) (not d!18077) b_and!4635 (not b!75406) (not b!75403) (not bm!6790) (not b!75751) (not b!75434) (not b!75506) (not b!75815) (not b!75825) (not d!17939) (not b!75404) (not d!18085) (not b!75479) (not d!17947) (not b!75470) (not b!75395) (not d!17973) (not bm!6750) (not d!17889) (not b!75817) (not bm!6781) (not d!17917) (not d!17915) (not d!17897) (not b!75533) (not bm!6754) (not b!75697) (not b!75696) (not b!75616) (not d!17955) (not b!75557) (not bm!6777) (not b!75497) (not b!75828) (not bm!6756) (not mapNonEmpty!3210) (not b!75691) (not b!75689) (not d!17907) (not b!75460) (not d!18039) (not b!75465) (not b!75702) (not bm!6803) (not b!75849) (not b!75608) (not b!75428) (not b!75639) (not d!17911) (not b!75387) (not d!17943) (not b!75401) (not d!18029) (not b!75632) (not b!75572) (not b!75574) (not b!75703) (not d!17921) (not d!17953) (not b!75764) (not b!75619) (not b!75635) (not b!75573) (not b!75539) (not d!18015) (not b!75677) (not b!75390) (not b!75489) (not b!75575) (not b!75830) (not b!75490) (not bm!6760) (not b!75588) (not b!75814) (not b!75651) (not b!75823) (not bm!6767) (not b!75597) (not b!75843) (not d!18073) (not b!75592) (not d!17923) (not d!18051) (not d!17933) (not d!18019) (not b!75685) (not b_next!2131) (not bm!6802) (not d!18011) (not b!75569) (not b!75524) (not b!75561) (not b_lambda!3403) (not b!75822) (not d!17883) (not d!17891) (not b!75736) (not d!17919) (not b!75517) (not d!17967) (not b!75599))
(check-sat b_and!4635 b_and!4637 (not b_next!2129) (not b_next!2131))
