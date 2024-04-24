; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8352 () Bool)

(assert start!8352)

(declare-fun b!55453 () Bool)

(declare-fun b_free!1861 () Bool)

(declare-fun b_next!1861 () Bool)

(assert (=> b!55453 (= b_free!1861 (not b_next!1861))))

(declare-fun tp!7684 () Bool)

(declare-fun b_and!3261 () Bool)

(assert (=> b!55453 (= tp!7684 b_and!3261)))

(declare-fun b!55447 () Bool)

(declare-fun b_free!1863 () Bool)

(declare-fun b_next!1863 () Bool)

(assert (=> b!55447 (= b_free!1863 (not b_next!1863))))

(declare-fun tp!7686 () Bool)

(declare-fun b_and!3263 () Bool)

(assert (=> b!55447 (= tp!7686 b_and!3263)))

(declare-fun b!55443 () Bool)

(declare-fun res!31235 () Bool)

(declare-fun e!36433 () Bool)

(assert (=> b!55443 (=> res!31235 e!36433)))

(declare-datatypes ((V!2777 0))(
  ( (V!2778 (val!1218 Int)) )
))
(declare-datatypes ((array!3603 0))(
  ( (array!3604 (arr!1724 (Array (_ BitVec 32) (_ BitVec 64))) (size!1953 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!830 0))(
  ( (ValueCellFull!830 (v!2324 V!2777)) (EmptyCell!830) )
))
(declare-datatypes ((array!3605 0))(
  ( (array!3606 (arr!1725 (Array (_ BitVec 32) ValueCell!830)) (size!1954 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!568 0))(
  ( (LongMapFixedSize!569 (defaultEntry!1998 Int) (mask!5857 (_ BitVec 32)) (extraKeys!1889 (_ BitVec 32)) (zeroValue!1916 V!2777) (minValue!1916 V!2777) (_size!333 (_ BitVec 32)) (_keys!3618 array!3603) (_values!1981 array!3605) (_vacant!333 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!386 0))(
  ( (Cell!387 (v!2325 LongMapFixedSize!568)) )
))
(declare-datatypes ((LongMap!386 0))(
  ( (LongMap!387 (underlying!204 Cell!386)) )
))
(declare-fun thiss!992 () LongMap!386)

(declare-datatypes ((List!1389 0))(
  ( (Nil!1386) (Cons!1385 (h!1965 (_ BitVec 64)) (t!4619 List!1389)) )
))
(declare-fun lt!21918 () List!1389)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!3603 (_ BitVec 32) List!1389) Bool)

(assert (=> b!55443 (= res!31235 (not (arrayNoDuplicates!0 (_keys!3618 (v!2325 (underlying!204 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!21918)))))

(declare-fun b!55444 () Bool)

(declare-fun e!36428 () Bool)

(declare-fun e!36435 () Bool)

(declare-fun mapRes!2712 () Bool)

(assert (=> b!55444 (= e!36428 (and e!36435 mapRes!2712))))

(declare-fun condMapEmpty!2712 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!568)

(declare-fun mapDefault!2712 () ValueCell!830)

(assert (=> b!55444 (= condMapEmpty!2712 (= (arr!1725 (_values!1981 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!830)) mapDefault!2712)))))

(declare-fun b!55445 () Bool)

(declare-fun e!36436 () Bool)

(declare-fun e!36434 () Bool)

(assert (=> b!55445 (= e!36436 e!36434)))

(declare-fun res!31231 () Bool)

(assert (=> b!55445 (=> (not res!31231) (not e!36434))))

(declare-datatypes ((tuple2!1962 0))(
  ( (tuple2!1963 (_1!992 (_ BitVec 64)) (_2!992 V!2777)) )
))
(declare-datatypes ((List!1390 0))(
  ( (Nil!1387) (Cons!1386 (h!1966 tuple2!1962) (t!4620 List!1390)) )
))
(declare-datatypes ((ListLongMap!1313 0))(
  ( (ListLongMap!1314 (toList!672 List!1390)) )
))
(declare-fun lt!21914 () ListLongMap!1313)

(declare-fun contains!650 (ListLongMap!1313 (_ BitVec 64)) Bool)

(assert (=> b!55445 (= res!31231 (contains!650 lt!21914 (select (arr!1724 (_keys!3618 (v!2325 (underlying!204 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1964 0))(
  ( (tuple2!1965 (_1!993 Bool) (_2!993 LongMapFixedSize!568)) )
))
(declare-fun lt!21916 () tuple2!1964)

(declare-fun update!75 (LongMapFixedSize!568 (_ BitVec 64) V!2777) tuple2!1964)

(declare-fun get!1040 (ValueCell!830 V!2777) V!2777)

(declare-fun dynLambda!293 (Int (_ BitVec 64)) V!2777)

(assert (=> b!55445 (= lt!21916 (update!75 newMap!16 (select (arr!1724 (_keys!3618 (v!2325 (underlying!204 thiss!992)))) from!355) (get!1040 (select (arr!1725 (_values!1981 (v!2325 (underlying!204 thiss!992)))) from!355) (dynLambda!293 (defaultEntry!1998 (v!2325 (underlying!204 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55446 () Bool)

(assert (=> b!55446 (= e!36434 (not e!36433))))

(declare-fun res!31230 () Bool)

(assert (=> b!55446 (=> res!31230 e!36433)))

(assert (=> b!55446 (= res!31230 (or (bvsge (size!1953 (_keys!3618 (v!2325 (underlying!204 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1953 (_keys!3618 (v!2325 (underlying!204 thiss!992)))))))))

(assert (=> b!55446 (= lt!21918 (Cons!1385 (select (arr!1724 (_keys!3618 (v!2325 (underlying!204 thiss!992)))) from!355) Nil!1386))))

(assert (=> b!55446 (arrayNoDuplicates!0 (_keys!3618 (v!2325 (underlying!204 thiss!992))) from!355 Nil!1386)))

(declare-datatypes ((Unit!1460 0))(
  ( (Unit!1461) )
))
(declare-fun lt!21919 () Unit!1460)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3603 (_ BitVec 32) (_ BitVec 32)) Unit!1460)

(assert (=> b!55446 (= lt!21919 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3618 (v!2325 (underlying!204 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55446 (arrayContainsKey!0 (_keys!3618 (v!2325 (underlying!204 thiss!992))) (select (arr!1724 (_keys!3618 (v!2325 (underlying!204 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!21920 () Unit!1460)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!14 (array!3603 array!3605 (_ BitVec 32) (_ BitVec 32) V!2777 V!2777 (_ BitVec 64) (_ BitVec 32) Int) Unit!1460)

(assert (=> b!55446 (= lt!21920 (lemmaListMapContainsThenArrayContainsFrom!14 (_keys!3618 (v!2325 (underlying!204 thiss!992))) (_values!1981 (v!2325 (underlying!204 thiss!992))) (mask!5857 (v!2325 (underlying!204 thiss!992))) (extraKeys!1889 (v!2325 (underlying!204 thiss!992))) (zeroValue!1916 (v!2325 (underlying!204 thiss!992))) (minValue!1916 (v!2325 (underlying!204 thiss!992))) (select (arr!1724 (_keys!3618 (v!2325 (underlying!204 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1998 (v!2325 (underlying!204 thiss!992)))))))

(declare-fun res!31238 () Bool)

(declare-fun e!36442 () Bool)

(assert (=> start!8352 (=> (not res!31238) (not e!36442))))

(declare-fun valid!239 (LongMap!386) Bool)

(assert (=> start!8352 (= res!31238 (valid!239 thiss!992))))

(assert (=> start!8352 e!36442))

(declare-fun e!36439 () Bool)

(assert (=> start!8352 e!36439))

(assert (=> start!8352 true))

(declare-fun e!36430 () Bool)

(assert (=> start!8352 e!36430))

(declare-fun tp_is_empty!2347 () Bool)

(declare-fun array_inv!1063 (array!3603) Bool)

(declare-fun array_inv!1064 (array!3605) Bool)

(assert (=> b!55447 (= e!36430 (and tp!7686 tp_is_empty!2347 (array_inv!1063 (_keys!3618 newMap!16)) (array_inv!1064 (_values!1981 newMap!16)) e!36428))))

(declare-fun b!55448 () Bool)

(assert (=> b!55448 (= e!36442 e!36436)))

(declare-fun res!31240 () Bool)

(assert (=> b!55448 (=> (not res!31240) (not e!36436))))

(declare-fun lt!21915 () ListLongMap!1313)

(assert (=> b!55448 (= res!31240 (and (= lt!21915 lt!21914) (not (= (select (arr!1724 (_keys!3618 (v!2325 (underlying!204 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1724 (_keys!3618 (v!2325 (underlying!204 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1079 (LongMapFixedSize!568) ListLongMap!1313)

(assert (=> b!55448 (= lt!21914 (map!1079 newMap!16))))

(declare-fun getCurrentListMap!375 (array!3603 array!3605 (_ BitVec 32) (_ BitVec 32) V!2777 V!2777 (_ BitVec 32) Int) ListLongMap!1313)

(assert (=> b!55448 (= lt!21915 (getCurrentListMap!375 (_keys!3618 (v!2325 (underlying!204 thiss!992))) (_values!1981 (v!2325 (underlying!204 thiss!992))) (mask!5857 (v!2325 (underlying!204 thiss!992))) (extraKeys!1889 (v!2325 (underlying!204 thiss!992))) (zeroValue!1916 (v!2325 (underlying!204 thiss!992))) (minValue!1916 (v!2325 (underlying!204 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1998 (v!2325 (underlying!204 thiss!992)))))))

(declare-fun b!55449 () Bool)

(declare-fun res!31236 () Bool)

(assert (=> b!55449 (=> res!31236 e!36433)))

(declare-fun contains!651 (List!1389 (_ BitVec 64)) Bool)

(assert (=> b!55449 (= res!31236 (contains!651 lt!21918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55450 () Bool)

(declare-fun e!36427 () Bool)

(assert (=> b!55450 (= e!36427 tp_is_empty!2347)))

(declare-fun b!55451 () Bool)

(declare-fun res!31232 () Bool)

(assert (=> b!55451 (=> (not res!31232) (not e!36442))))

(assert (=> b!55451 (= res!31232 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5857 newMap!16)) (_size!333 (v!2325 (underlying!204 thiss!992)))))))

(declare-fun mapIsEmpty!2711 () Bool)

(declare-fun mapRes!2711 () Bool)

(assert (=> mapIsEmpty!2711 mapRes!2711))

(declare-fun b!55452 () Bool)

(assert (=> b!55452 (= e!36433 true)))

(declare-fun lt!21917 () Bool)

(assert (=> b!55452 (= lt!21917 (contains!651 lt!21918 (select (arr!1724 (_keys!3618 (v!2325 (underlying!204 thiss!992)))) from!355)))))

(declare-fun e!36438 () Bool)

(declare-fun e!36429 () Bool)

(assert (=> b!55453 (= e!36429 (and tp!7684 tp_is_empty!2347 (array_inv!1063 (_keys!3618 (v!2325 (underlying!204 thiss!992)))) (array_inv!1064 (_values!1981 (v!2325 (underlying!204 thiss!992)))) e!36438))))

(declare-fun b!55454 () Bool)

(declare-fun e!36432 () Bool)

(assert (=> b!55454 (= e!36439 e!36432)))

(declare-fun mapNonEmpty!2711 () Bool)

(declare-fun tp!7685 () Bool)

(assert (=> mapNonEmpty!2711 (= mapRes!2711 (and tp!7685 e!36427))))

(declare-fun mapKey!2712 () (_ BitVec 32))

(declare-fun mapValue!2711 () ValueCell!830)

(declare-fun mapRest!2711 () (Array (_ BitVec 32) ValueCell!830))

(assert (=> mapNonEmpty!2711 (= (arr!1725 (_values!1981 (v!2325 (underlying!204 thiss!992)))) (store mapRest!2711 mapKey!2712 mapValue!2711))))

(declare-fun b!55455 () Bool)

(assert (=> b!55455 (= e!36432 e!36429)))

(declare-fun b!55456 () Bool)

(declare-fun e!36441 () Bool)

(assert (=> b!55456 (= e!36441 tp_is_empty!2347)))

(declare-fun b!55457 () Bool)

(assert (=> b!55457 (= e!36438 (and e!36441 mapRes!2711))))

(declare-fun condMapEmpty!2711 () Bool)

(declare-fun mapDefault!2711 () ValueCell!830)

(assert (=> b!55457 (= condMapEmpty!2711 (= (arr!1725 (_values!1981 (v!2325 (underlying!204 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!830)) mapDefault!2711)))))

(declare-fun mapIsEmpty!2712 () Bool)

(assert (=> mapIsEmpty!2712 mapRes!2712))

(declare-fun b!55458 () Bool)

(declare-fun res!31233 () Bool)

(assert (=> b!55458 (=> (not res!31233) (not e!36442))))

(declare-fun valid!240 (LongMapFixedSize!568) Bool)

(assert (=> b!55458 (= res!31233 (valid!240 newMap!16))))

(declare-fun b!55459 () Bool)

(declare-fun res!31239 () Bool)

(assert (=> b!55459 (=> res!31239 e!36433)))

(declare-fun noDuplicate!39 (List!1389) Bool)

(assert (=> b!55459 (= res!31239 (not (noDuplicate!39 lt!21918)))))

(declare-fun mapNonEmpty!2712 () Bool)

(declare-fun tp!7683 () Bool)

(declare-fun e!36431 () Bool)

(assert (=> mapNonEmpty!2712 (= mapRes!2712 (and tp!7683 e!36431))))

(declare-fun mapValue!2712 () ValueCell!830)

(declare-fun mapRest!2712 () (Array (_ BitVec 32) ValueCell!830))

(declare-fun mapKey!2711 () (_ BitVec 32))

(assert (=> mapNonEmpty!2712 (= (arr!1725 (_values!1981 newMap!16)) (store mapRest!2712 mapKey!2711 mapValue!2712))))

(declare-fun b!55460 () Bool)

(assert (=> b!55460 (= e!36435 tp_is_empty!2347)))

(declare-fun b!55461 () Bool)

(declare-fun res!31234 () Bool)

(assert (=> b!55461 (=> (not res!31234) (not e!36442))))

(assert (=> b!55461 (= res!31234 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1953 (_keys!3618 (v!2325 (underlying!204 thiss!992)))))))))

(declare-fun b!55462 () Bool)

(declare-fun res!31237 () Bool)

(assert (=> b!55462 (=> res!31237 e!36433)))

(assert (=> b!55462 (= res!31237 (contains!651 lt!21918 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55463 () Bool)

(assert (=> b!55463 (= e!36431 tp_is_empty!2347)))

(assert (= (and start!8352 res!31238) b!55461))

(assert (= (and b!55461 res!31234) b!55458))

(assert (= (and b!55458 res!31233) b!55451))

(assert (= (and b!55451 res!31232) b!55448))

(assert (= (and b!55448 res!31240) b!55445))

(assert (= (and b!55445 res!31231) b!55446))

(assert (= (and b!55446 (not res!31230)) b!55459))

(assert (= (and b!55459 (not res!31239)) b!55449))

(assert (= (and b!55449 (not res!31236)) b!55462))

(assert (= (and b!55462 (not res!31237)) b!55443))

(assert (= (and b!55443 (not res!31235)) b!55452))

(assert (= (and b!55457 condMapEmpty!2711) mapIsEmpty!2711))

(assert (= (and b!55457 (not condMapEmpty!2711)) mapNonEmpty!2711))

(get-info :version)

(assert (= (and mapNonEmpty!2711 ((_ is ValueCellFull!830) mapValue!2711)) b!55450))

(assert (= (and b!55457 ((_ is ValueCellFull!830) mapDefault!2711)) b!55456))

(assert (= b!55453 b!55457))

(assert (= b!55455 b!55453))

(assert (= b!55454 b!55455))

(assert (= start!8352 b!55454))

(assert (= (and b!55444 condMapEmpty!2712) mapIsEmpty!2712))

(assert (= (and b!55444 (not condMapEmpty!2712)) mapNonEmpty!2712))

(assert (= (and mapNonEmpty!2712 ((_ is ValueCellFull!830) mapValue!2712)) b!55463))

(assert (= (and b!55444 ((_ is ValueCellFull!830) mapDefault!2712)) b!55460))

(assert (= b!55447 b!55444))

(assert (= start!8352 b!55447))

(declare-fun b_lambda!2441 () Bool)

(assert (=> (not b_lambda!2441) (not b!55445)))

(declare-fun t!4616 () Bool)

(declare-fun tb!1205 () Bool)

(assert (=> (and b!55453 (= (defaultEntry!1998 (v!2325 (underlying!204 thiss!992))) (defaultEntry!1998 (v!2325 (underlying!204 thiss!992)))) t!4616) tb!1205))

(declare-fun result!2205 () Bool)

(assert (=> tb!1205 (= result!2205 tp_is_empty!2347)))

(assert (=> b!55445 t!4616))

(declare-fun b_and!3265 () Bool)

(assert (= b_and!3261 (and (=> t!4616 result!2205) b_and!3265)))

(declare-fun tb!1207 () Bool)

(declare-fun t!4618 () Bool)

(assert (=> (and b!55447 (= (defaultEntry!1998 newMap!16) (defaultEntry!1998 (v!2325 (underlying!204 thiss!992)))) t!4618) tb!1207))

(declare-fun result!2209 () Bool)

(assert (= result!2209 result!2205))

(assert (=> b!55445 t!4618))

(declare-fun b_and!3267 () Bool)

(assert (= b_and!3263 (and (=> t!4618 result!2209) b_and!3267)))

(declare-fun m!46681 () Bool)

(assert (=> b!55453 m!46681))

(declare-fun m!46683 () Bool)

(assert (=> b!55453 m!46683))

(declare-fun m!46685 () Bool)

(assert (=> b!55443 m!46685))

(declare-fun m!46687 () Bool)

(assert (=> b!55458 m!46687))

(declare-fun m!46689 () Bool)

(assert (=> b!55452 m!46689))

(assert (=> b!55452 m!46689))

(declare-fun m!46691 () Bool)

(assert (=> b!55452 m!46691))

(declare-fun m!46693 () Bool)

(assert (=> b!55445 m!46693))

(declare-fun m!46695 () Bool)

(assert (=> b!55445 m!46695))

(declare-fun m!46697 () Bool)

(assert (=> b!55445 m!46697))

(assert (=> b!55445 m!46689))

(assert (=> b!55445 m!46695))

(assert (=> b!55445 m!46689))

(declare-fun m!46699 () Bool)

(assert (=> b!55445 m!46699))

(assert (=> b!55445 m!46689))

(assert (=> b!55445 m!46697))

(declare-fun m!46701 () Bool)

(assert (=> b!55445 m!46701))

(assert (=> b!55445 m!46693))

(declare-fun m!46703 () Bool)

(assert (=> mapNonEmpty!2712 m!46703))

(assert (=> b!55448 m!46689))

(declare-fun m!46705 () Bool)

(assert (=> b!55448 m!46705))

(declare-fun m!46707 () Bool)

(assert (=> b!55448 m!46707))

(declare-fun m!46709 () Bool)

(assert (=> start!8352 m!46709))

(declare-fun m!46711 () Bool)

(assert (=> mapNonEmpty!2711 m!46711))

(declare-fun m!46713 () Bool)

(assert (=> b!55459 m!46713))

(declare-fun m!46715 () Bool)

(assert (=> b!55446 m!46715))

(declare-fun m!46717 () Bool)

(assert (=> b!55446 m!46717))

(assert (=> b!55446 m!46689))

(declare-fun m!46719 () Bool)

(assert (=> b!55446 m!46719))

(assert (=> b!55446 m!46689))

(assert (=> b!55446 m!46689))

(declare-fun m!46721 () Bool)

(assert (=> b!55446 m!46721))

(declare-fun m!46723 () Bool)

(assert (=> b!55449 m!46723))

(declare-fun m!46725 () Bool)

(assert (=> b!55447 m!46725))

(declare-fun m!46727 () Bool)

(assert (=> b!55447 m!46727))

(declare-fun m!46729 () Bool)

(assert (=> b!55462 m!46729))

(check-sat (not b!55452) (not b_next!1863) b_and!3267 (not b!55449) b_and!3265 (not b!55458) tp_is_empty!2347 (not mapNonEmpty!2712) (not b!55443) (not mapNonEmpty!2711) (not b!55462) (not b!55445) (not b_lambda!2441) (not b!55447) (not b!55446) (not b!55453) (not b!55448) (not b_next!1861) (not start!8352) (not b!55459))
(check-sat b_and!3265 b_and!3267 (not b_next!1861) (not b_next!1863))
