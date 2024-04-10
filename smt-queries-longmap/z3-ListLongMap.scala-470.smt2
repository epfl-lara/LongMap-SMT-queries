; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9208 () Bool)

(assert start!9208)

(declare-fun b!65513 () Bool)

(declare-fun b_free!2033 () Bool)

(declare-fun b_next!2033 () Bool)

(assert (=> b!65513 (= b_free!2033 (not b_next!2033))))

(declare-fun tp!8247 () Bool)

(declare-fun b_and!4019 () Bool)

(assert (=> b!65513 (= tp!8247 b_and!4019)))

(declare-fun b!65520 () Bool)

(declare-fun b_free!2035 () Bool)

(declare-fun b_next!2035 () Bool)

(assert (=> b!65520 (= b_free!2035 (not b_next!2035))))

(declare-fun tp!8250 () Bool)

(declare-fun b_and!4021 () Bool)

(assert (=> b!65520 (= tp!8250 b_and!4021)))

(declare-fun b!65512 () Bool)

(declare-fun e!42921 () Bool)

(declare-fun tp_is_empty!2433 () Bool)

(assert (=> b!65512 (= e!42921 tp_is_empty!2433)))

(declare-fun e!42917 () Bool)

(declare-datatypes ((V!2891 0))(
  ( (V!2892 (val!1261 Int)) )
))
(declare-datatypes ((array!3803 0))(
  ( (array!3804 (arr!1817 (Array (_ BitVec 32) (_ BitVec 64))) (size!2052 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!873 0))(
  ( (ValueCellFull!873 (v!2458 V!2891)) (EmptyCell!873) )
))
(declare-datatypes ((array!3805 0))(
  ( (array!3806 (arr!1818 (Array (_ BitVec 32) ValueCell!873)) (size!2053 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!654 0))(
  ( (LongMapFixedSize!655 (defaultEntry!2135 Int) (mask!6063 (_ BitVec 32)) (extraKeys!2006 (_ BitVec 32)) (zeroValue!2043 V!2891) (minValue!2043 V!2891) (_size!376 (_ BitVec 32)) (_keys!3775 array!3803) (_values!2118 array!3805) (_vacant!376 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!462 0))(
  ( (Cell!463 (v!2459 LongMapFixedSize!654)) )
))
(declare-datatypes ((LongMap!462 0))(
  ( (LongMap!463 (underlying!242 Cell!462)) )
))
(declare-fun thiss!992 () LongMap!462)

(declare-fun e!42913 () Bool)

(declare-fun array_inv!1121 (array!3803) Bool)

(declare-fun array_inv!1122 (array!3805) Bool)

(assert (=> b!65513 (= e!42913 (and tp!8247 tp_is_empty!2433 (array_inv!1121 (_keys!3775 (v!2459 (underlying!242 thiss!992)))) (array_inv!1122 (_values!2118 (v!2459 (underlying!242 thiss!992)))) e!42917))))

(declare-fun b!65514 () Bool)

(declare-fun e!42916 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!65514 (= e!42916 (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!3017 () Bool)

(declare-fun mapRes!3017 () Bool)

(assert (=> mapIsEmpty!3017 mapRes!3017))

(declare-fun b!65515 () Bool)

(declare-fun res!35631 () Bool)

(assert (=> b!65515 (=> (not res!35631) (not e!42916))))

(declare-datatypes ((List!1453 0))(
  ( (Nil!1450) (Cons!1449 (h!2033 (_ BitVec 64)) (t!4899 List!1453)) )
))
(declare-fun arrayNoDuplicates!0 (array!3803 (_ BitVec 32) List!1453) Bool)

(assert (=> b!65515 (= res!35631 (arrayNoDuplicates!0 (_keys!3775 (v!2459 (underlying!242 thiss!992))) #b00000000000000000000000000000000 Nil!1450))))

(declare-fun b!65516 () Bool)

(declare-fun res!35634 () Bool)

(declare-fun e!42923 () Bool)

(assert (=> b!65516 (=> (not res!35634) (not e!42923))))

(declare-fun newMap!16 () LongMapFixedSize!654)

(declare-fun valid!271 (LongMapFixedSize!654) Bool)

(assert (=> b!65516 (= res!35634 (valid!271 newMap!16))))

(declare-fun b!65517 () Bool)

(declare-fun e!42925 () Bool)

(assert (=> b!65517 (= e!42925 tp_is_empty!2433)))

(declare-fun b!65518 () Bool)

(declare-fun e!42920 () Bool)

(declare-fun mapRes!3018 () Bool)

(assert (=> b!65518 (= e!42917 (and e!42920 mapRes!3018))))

(declare-fun condMapEmpty!3017 () Bool)

(declare-fun mapDefault!3018 () ValueCell!873)

(assert (=> b!65518 (= condMapEmpty!3017 (= (arr!1818 (_values!2118 (v!2459 (underlying!242 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!873)) mapDefault!3018)))))

(declare-fun b!65519 () Bool)

(assert (=> b!65519 (= e!42920 tp_is_empty!2433)))

(declare-fun e!42922 () Bool)

(declare-fun e!42910 () Bool)

(assert (=> b!65520 (= e!42922 (and tp!8250 tp_is_empty!2433 (array_inv!1121 (_keys!3775 newMap!16)) (array_inv!1122 (_values!2118 newMap!16)) e!42910))))

(declare-fun b!65521 () Bool)

(declare-fun e!42924 () Bool)

(assert (=> b!65521 (= e!42924 e!42916)))

(declare-fun res!35630 () Bool)

(assert (=> b!65521 (=> (not res!35630) (not e!42916))))

(declare-datatypes ((tuple2!2068 0))(
  ( (tuple2!2069 (_1!1045 Bool) (_2!1045 LongMapFixedSize!654)) )
))
(declare-fun lt!28136 () tuple2!2068)

(assert (=> b!65521 (= res!35630 (and (_1!1045 lt!28136) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!1810 0))(
  ( (Unit!1811) )
))
(declare-fun lt!28134 () Unit!1810)

(declare-fun e!42919 () Unit!1810)

(assert (=> b!65521 (= lt!28134 e!42919)))

(declare-fun c!9020 () Bool)

(declare-datatypes ((tuple2!2070 0))(
  ( (tuple2!2071 (_1!1046 (_ BitVec 64)) (_2!1046 V!2891)) )
))
(declare-datatypes ((List!1454 0))(
  ( (Nil!1451) (Cons!1450 (h!2034 tuple2!2070) (t!4900 List!1454)) )
))
(declare-datatypes ((ListLongMap!1389 0))(
  ( (ListLongMap!1390 (toList!710 List!1454)) )
))
(declare-fun lt!28135 () ListLongMap!1389)

(declare-fun contains!703 (ListLongMap!1389 (_ BitVec 64)) Bool)

(assert (=> b!65521 (= c!9020 (contains!703 lt!28135 (select (arr!1817 (_keys!3775 (v!2459 (underlying!242 thiss!992)))) from!355)))))

(declare-fun update!84 (LongMapFixedSize!654 (_ BitVec 64) V!2891) tuple2!2068)

(declare-fun get!1104 (ValueCell!873 V!2891) V!2891)

(declare-fun dynLambda!315 (Int (_ BitVec 64)) V!2891)

(assert (=> b!65521 (= lt!28136 (update!84 newMap!16 (select (arr!1817 (_keys!3775 (v!2459 (underlying!242 thiss!992)))) from!355) (get!1104 (select (arr!1818 (_values!2118 (v!2459 (underlying!242 thiss!992)))) from!355) (dynLambda!315 (defaultEntry!2135 (v!2459 (underlying!242 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!35635 () Bool)

(assert (=> start!9208 (=> (not res!35635) (not e!42923))))

(declare-fun valid!272 (LongMap!462) Bool)

(assert (=> start!9208 (= res!35635 (valid!272 thiss!992))))

(assert (=> start!9208 e!42923))

(declare-fun e!42914 () Bool)

(assert (=> start!9208 e!42914))

(assert (=> start!9208 true))

(assert (=> start!9208 e!42922))

(declare-fun mapNonEmpty!3017 () Bool)

(declare-fun tp!8249 () Bool)

(assert (=> mapNonEmpty!3017 (= mapRes!3018 (and tp!8249 e!42925))))

(declare-fun mapKey!3017 () (_ BitVec 32))

(declare-fun mapValue!3017 () ValueCell!873)

(declare-fun mapRest!3017 () (Array (_ BitVec 32) ValueCell!873))

(assert (=> mapNonEmpty!3017 (= (arr!1818 (_values!2118 (v!2459 (underlying!242 thiss!992)))) (store mapRest!3017 mapKey!3017 mapValue!3017))))

(declare-fun b!65522 () Bool)

(declare-fun e!42911 () Bool)

(assert (=> b!65522 (= e!42910 (and e!42911 mapRes!3017))))

(declare-fun condMapEmpty!3018 () Bool)

(declare-fun mapDefault!3017 () ValueCell!873)

(assert (=> b!65522 (= condMapEmpty!3018 (= (arr!1818 (_values!2118 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!873)) mapDefault!3017)))))

(declare-fun b!65523 () Bool)

(declare-fun Unit!1812 () Unit!1810)

(assert (=> b!65523 (= e!42919 Unit!1812)))

(declare-fun b!65524 () Bool)

(declare-fun e!42915 () Bool)

(assert (=> b!65524 (= e!42914 e!42915)))

(declare-fun b!65525 () Bool)

(assert (=> b!65525 (= e!42923 e!42924)))

(declare-fun res!35629 () Bool)

(assert (=> b!65525 (=> (not res!35629) (not e!42924))))

(declare-fun lt!28132 () ListLongMap!1389)

(assert (=> b!65525 (= res!35629 (and (= lt!28132 lt!28135) (not (= (select (arr!1817 (_keys!3775 (v!2459 (underlying!242 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1817 (_keys!3775 (v!2459 (underlying!242 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1126 (LongMapFixedSize!654) ListLongMap!1389)

(assert (=> b!65525 (= lt!28135 (map!1126 newMap!16))))

(declare-fun getCurrentListMap!411 (array!3803 array!3805 (_ BitVec 32) (_ BitVec 32) V!2891 V!2891 (_ BitVec 32) Int) ListLongMap!1389)

(assert (=> b!65525 (= lt!28132 (getCurrentListMap!411 (_keys!3775 (v!2459 (underlying!242 thiss!992))) (_values!2118 (v!2459 (underlying!242 thiss!992))) (mask!6063 (v!2459 (underlying!242 thiss!992))) (extraKeys!2006 (v!2459 (underlying!242 thiss!992))) (zeroValue!2043 (v!2459 (underlying!242 thiss!992))) (minValue!2043 (v!2459 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2135 (v!2459 (underlying!242 thiss!992)))))))

(declare-fun b!65526 () Bool)

(assert (=> b!65526 (= e!42915 e!42913)))

(declare-fun b!65527 () Bool)

(declare-fun res!35627 () Bool)

(assert (=> b!65527 (=> (not res!35627) (not e!42923))))

(assert (=> b!65527 (= res!35627 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2052 (_keys!3775 (v!2459 (underlying!242 thiss!992)))))))))

(declare-fun b!65528 () Bool)

(declare-fun res!35632 () Bool)

(assert (=> b!65528 (=> (not res!35632) (not e!42916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3803 (_ BitVec 32)) Bool)

(assert (=> b!65528 (= res!35632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3775 (v!2459 (underlying!242 thiss!992))) (mask!6063 (v!2459 (underlying!242 thiss!992)))))))

(declare-fun b!65529 () Bool)

(declare-fun res!35628 () Bool)

(assert (=> b!65529 (=> (not res!35628) (not e!42923))))

(assert (=> b!65529 (= res!35628 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6063 newMap!16)) (_size!376 (v!2459 (underlying!242 thiss!992)))))))

(declare-fun mapNonEmpty!3018 () Bool)

(declare-fun tp!8248 () Bool)

(assert (=> mapNonEmpty!3018 (= mapRes!3017 (and tp!8248 e!42921))))

(declare-fun mapValue!3018 () ValueCell!873)

(declare-fun mapRest!3018 () (Array (_ BitVec 32) ValueCell!873))

(declare-fun mapKey!3018 () (_ BitVec 32))

(assert (=> mapNonEmpty!3018 (= (arr!1818 (_values!2118 newMap!16)) (store mapRest!3018 mapKey!3018 mapValue!3018))))

(declare-fun mapIsEmpty!3018 () Bool)

(assert (=> mapIsEmpty!3018 mapRes!3018))

(declare-fun b!65530 () Bool)

(declare-fun Unit!1813 () Unit!1810)

(assert (=> b!65530 (= e!42919 Unit!1813)))

(declare-fun lt!28133 () Unit!1810)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!40 (array!3803 array!3805 (_ BitVec 32) (_ BitVec 32) V!2891 V!2891 (_ BitVec 64) (_ BitVec 32) Int) Unit!1810)

(assert (=> b!65530 (= lt!28133 (lemmaListMapContainsThenArrayContainsFrom!40 (_keys!3775 (v!2459 (underlying!242 thiss!992))) (_values!2118 (v!2459 (underlying!242 thiss!992))) (mask!6063 (v!2459 (underlying!242 thiss!992))) (extraKeys!2006 (v!2459 (underlying!242 thiss!992))) (zeroValue!2043 (v!2459 (underlying!242 thiss!992))) (minValue!2043 (v!2459 (underlying!242 thiss!992))) (select (arr!1817 (_keys!3775 (v!2459 (underlying!242 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2135 (v!2459 (underlying!242 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!65530 (arrayContainsKey!0 (_keys!3775 (v!2459 (underlying!242 thiss!992))) (select (arr!1817 (_keys!3775 (v!2459 (underlying!242 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!28137 () Unit!1810)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3803 (_ BitVec 32) (_ BitVec 32)) Unit!1810)

(assert (=> b!65530 (= lt!28137 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3775 (v!2459 (underlying!242 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!65530 (arrayNoDuplicates!0 (_keys!3775 (v!2459 (underlying!242 thiss!992))) from!355 Nil!1450)))

(declare-fun lt!28131 () Unit!1810)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3803 (_ BitVec 32) (_ BitVec 64) List!1453) Unit!1810)

(assert (=> b!65530 (= lt!28131 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3775 (v!2459 (underlying!242 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1817 (_keys!3775 (v!2459 (underlying!242 thiss!992)))) from!355) (Cons!1449 (select (arr!1817 (_keys!3775 (v!2459 (underlying!242 thiss!992)))) from!355) Nil!1450)))))

(assert (=> b!65530 false))

(declare-fun b!65531 () Bool)

(declare-fun res!35633 () Bool)

(assert (=> b!65531 (=> (not res!35633) (not e!42916))))

(assert (=> b!65531 (= res!35633 (and (= (size!2053 (_values!2118 (v!2459 (underlying!242 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6063 (v!2459 (underlying!242 thiss!992))))) (= (size!2052 (_keys!3775 (v!2459 (underlying!242 thiss!992)))) (size!2053 (_values!2118 (v!2459 (underlying!242 thiss!992))))) (bvsge (mask!6063 (v!2459 (underlying!242 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2006 (v!2459 (underlying!242 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2006 (v!2459 (underlying!242 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!65532 () Bool)

(assert (=> b!65532 (= e!42911 tp_is_empty!2433)))

(declare-fun b!65533 () Bool)

(declare-fun res!35636 () Bool)

(assert (=> b!65533 (=> (not res!35636) (not e!42916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!65533 (= res!35636 (validMask!0 (mask!6063 (v!2459 (underlying!242 thiss!992)))))))

(assert (= (and start!9208 res!35635) b!65527))

(assert (= (and b!65527 res!35627) b!65516))

(assert (= (and b!65516 res!35634) b!65529))

(assert (= (and b!65529 res!35628) b!65525))

(assert (= (and b!65525 res!35629) b!65521))

(assert (= (and b!65521 c!9020) b!65530))

(assert (= (and b!65521 (not c!9020)) b!65523))

(assert (= (and b!65521 res!35630) b!65533))

(assert (= (and b!65533 res!35636) b!65531))

(assert (= (and b!65531 res!35633) b!65528))

(assert (= (and b!65528 res!35632) b!65515))

(assert (= (and b!65515 res!35631) b!65514))

(assert (= (and b!65518 condMapEmpty!3017) mapIsEmpty!3018))

(assert (= (and b!65518 (not condMapEmpty!3017)) mapNonEmpty!3017))

(get-info :version)

(assert (= (and mapNonEmpty!3017 ((_ is ValueCellFull!873) mapValue!3017)) b!65517))

(assert (= (and b!65518 ((_ is ValueCellFull!873) mapDefault!3018)) b!65519))

(assert (= b!65513 b!65518))

(assert (= b!65526 b!65513))

(assert (= b!65524 b!65526))

(assert (= start!9208 b!65524))

(assert (= (and b!65522 condMapEmpty!3018) mapIsEmpty!3017))

(assert (= (and b!65522 (not condMapEmpty!3018)) mapNonEmpty!3018))

(assert (= (and mapNonEmpty!3018 ((_ is ValueCellFull!873) mapValue!3018)) b!65512))

(assert (= (and b!65522 ((_ is ValueCellFull!873) mapDefault!3017)) b!65532))

(assert (= b!65520 b!65522))

(assert (= start!9208 b!65520))

(declare-fun b_lambda!2943 () Bool)

(assert (=> (not b_lambda!2943) (not b!65521)))

(declare-fun t!4896 () Bool)

(declare-fun tb!1421 () Bool)

(assert (=> (and b!65513 (= (defaultEntry!2135 (v!2459 (underlying!242 thiss!992))) (defaultEntry!2135 (v!2459 (underlying!242 thiss!992)))) t!4896) tb!1421))

(declare-fun result!2521 () Bool)

(assert (=> tb!1421 (= result!2521 tp_is_empty!2433)))

(assert (=> b!65521 t!4896))

(declare-fun b_and!4023 () Bool)

(assert (= b_and!4019 (and (=> t!4896 result!2521) b_and!4023)))

(declare-fun t!4898 () Bool)

(declare-fun tb!1423 () Bool)

(assert (=> (and b!65520 (= (defaultEntry!2135 newMap!16) (defaultEntry!2135 (v!2459 (underlying!242 thiss!992)))) t!4898) tb!1423))

(declare-fun result!2525 () Bool)

(assert (= result!2525 result!2521))

(assert (=> b!65521 t!4898))

(declare-fun b_and!4025 () Bool)

(assert (= b_and!4021 (and (=> t!4898 result!2525) b_and!4025)))

(declare-fun m!60383 () Bool)

(assert (=> b!65520 m!60383))

(declare-fun m!60385 () Bool)

(assert (=> b!65520 m!60385))

(declare-fun m!60387 () Bool)

(assert (=> b!65533 m!60387))

(declare-fun m!60389 () Bool)

(assert (=> start!9208 m!60389))

(declare-fun m!60391 () Bool)

(assert (=> b!65528 m!60391))

(declare-fun m!60393 () Bool)

(assert (=> mapNonEmpty!3018 m!60393))

(declare-fun m!60395 () Bool)

(assert (=> b!65513 m!60395))

(declare-fun m!60397 () Bool)

(assert (=> b!65513 m!60397))

(declare-fun m!60399 () Bool)

(assert (=> b!65521 m!60399))

(declare-fun m!60401 () Bool)

(assert (=> b!65521 m!60401))

(declare-fun m!60403 () Bool)

(assert (=> b!65521 m!60403))

(declare-fun m!60405 () Bool)

(assert (=> b!65521 m!60405))

(declare-fun m!60407 () Bool)

(assert (=> b!65521 m!60407))

(assert (=> b!65521 m!60399))

(assert (=> b!65521 m!60405))

(assert (=> b!65521 m!60399))

(assert (=> b!65521 m!60407))

(declare-fun m!60409 () Bool)

(assert (=> b!65521 m!60409))

(assert (=> b!65521 m!60403))

(declare-fun m!60411 () Bool)

(assert (=> mapNonEmpty!3017 m!60411))

(assert (=> b!65525 m!60399))

(declare-fun m!60413 () Bool)

(assert (=> b!65525 m!60413))

(declare-fun m!60415 () Bool)

(assert (=> b!65525 m!60415))

(declare-fun m!60417 () Bool)

(assert (=> b!65530 m!60417))

(declare-fun m!60419 () Bool)

(assert (=> b!65530 m!60419))

(assert (=> b!65530 m!60399))

(declare-fun m!60421 () Bool)

(assert (=> b!65530 m!60421))

(assert (=> b!65530 m!60399))

(assert (=> b!65530 m!60399))

(declare-fun m!60423 () Bool)

(assert (=> b!65530 m!60423))

(assert (=> b!65530 m!60399))

(declare-fun m!60425 () Bool)

(assert (=> b!65530 m!60425))

(declare-fun m!60427 () Bool)

(assert (=> b!65516 m!60427))

(declare-fun m!60429 () Bool)

(assert (=> b!65515 m!60429))

(check-sat (not b!65513) (not b!65528) tp_is_empty!2433 b_and!4025 (not b!65533) (not b_next!2033) (not start!9208) b_and!4023 (not b!65525) (not mapNonEmpty!3018) (not b!65515) (not b!65521) (not b_lambda!2943) (not b!65516) (not b!65530) (not b!65520) (not mapNonEmpty!3017) (not b_next!2035))
(check-sat b_and!4023 b_and!4025 (not b_next!2033) (not b_next!2035))
