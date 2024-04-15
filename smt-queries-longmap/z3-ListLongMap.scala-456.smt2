; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8352 () Bool)

(assert start!8352)

(declare-fun b!55437 () Bool)

(declare-fun b_free!1861 () Bool)

(declare-fun b_next!1861 () Bool)

(assert (=> b!55437 (= b_free!1861 (not b_next!1861))))

(declare-fun tp!7683 () Bool)

(declare-fun b_and!3265 () Bool)

(assert (=> b!55437 (= tp!7683 b_and!3265)))

(declare-fun b!55446 () Bool)

(declare-fun b_free!1863 () Bool)

(declare-fun b_next!1863 () Bool)

(assert (=> b!55446 (= b_free!1863 (not b_next!1863))))

(declare-fun tp!7684 () Bool)

(declare-fun b_and!3267 () Bool)

(assert (=> b!55446 (= tp!7684 b_and!3267)))

(declare-fun b!55434 () Bool)

(declare-fun res!31242 () Bool)

(declare-fun e!36426 () Bool)

(assert (=> b!55434 (=> res!31242 e!36426)))

(declare-datatypes ((List!1402 0))(
  ( (Nil!1399) (Cons!1398 (h!1978 (_ BitVec 64)) (t!4631 List!1402)) )
))
(declare-fun lt!21941 () List!1402)

(declare-fun contains!655 (List!1402 (_ BitVec 64)) Bool)

(assert (=> b!55434 (= res!31242 (contains!655 lt!21941 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55435 () Bool)

(declare-fun e!36430 () Bool)

(declare-fun e!36425 () Bool)

(assert (=> b!55435 (= e!36430 e!36425)))

(declare-fun res!31239 () Bool)

(assert (=> b!55435 (=> (not res!31239) (not e!36425))))

(declare-datatypes ((V!2777 0))(
  ( (V!2778 (val!1218 Int)) )
))
(declare-datatypes ((array!3597 0))(
  ( (array!3598 (arr!1720 (Array (_ BitVec 32) (_ BitVec 64))) (size!1950 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!830 0))(
  ( (ValueCellFull!830 (v!2317 V!2777)) (EmptyCell!830) )
))
(declare-datatypes ((array!3599 0))(
  ( (array!3600 (arr!1721 (Array (_ BitVec 32) ValueCell!830)) (size!1951 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!568 0))(
  ( (LongMapFixedSize!569 (defaultEntry!1998 Int) (mask!5856 (_ BitVec 32)) (extraKeys!1889 (_ BitVec 32)) (zeroValue!1916 V!2777) (minValue!1916 V!2777) (_size!333 (_ BitVec 32)) (_keys!3617 array!3597) (_values!1981 array!3599) (_vacant!333 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!378 0))(
  ( (Cell!379 (v!2318 LongMapFixedSize!568)) )
))
(declare-datatypes ((LongMap!378 0))(
  ( (LongMap!379 (underlying!200 Cell!378)) )
))
(declare-fun thiss!992 () LongMap!378)

(declare-datatypes ((tuple2!1982 0))(
  ( (tuple2!1983 (_1!1002 (_ BitVec 64)) (_2!1002 V!2777)) )
))
(declare-datatypes ((List!1403 0))(
  ( (Nil!1400) (Cons!1399 (h!1979 tuple2!1982) (t!4632 List!1403)) )
))
(declare-datatypes ((ListLongMap!1327 0))(
  ( (ListLongMap!1328 (toList!679 List!1403)) )
))
(declare-fun lt!21943 () ListLongMap!1327)

(declare-fun lt!21946 () ListLongMap!1327)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!55435 (= res!31239 (and (= lt!21946 lt!21943) (not (= (select (arr!1720 (_keys!3617 (v!2318 (underlying!200 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1720 (_keys!3617 (v!2318 (underlying!200 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!568)

(declare-fun map!1076 (LongMapFixedSize!568) ListLongMap!1327)

(assert (=> b!55435 (= lt!21943 (map!1076 newMap!16))))

(declare-fun getCurrentListMap!378 (array!3597 array!3599 (_ BitVec 32) (_ BitVec 32) V!2777 V!2777 (_ BitVec 32) Int) ListLongMap!1327)

(assert (=> b!55435 (= lt!21946 (getCurrentListMap!378 (_keys!3617 (v!2318 (underlying!200 thiss!992))) (_values!1981 (v!2318 (underlying!200 thiss!992))) (mask!5856 (v!2318 (underlying!200 thiss!992))) (extraKeys!1889 (v!2318 (underlying!200 thiss!992))) (zeroValue!1916 (v!2318 (underlying!200 thiss!992))) (minValue!1916 (v!2318 (underlying!200 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1998 (v!2318 (underlying!200 thiss!992)))))))

(declare-fun b!55436 () Bool)

(declare-fun res!31244 () Bool)

(assert (=> b!55436 (=> res!31244 e!36426)))

(declare-fun arrayNoDuplicates!0 (array!3597 (_ BitVec 32) List!1402) Bool)

(assert (=> b!55436 (= res!31244 (not (arrayNoDuplicates!0 (_keys!3617 (v!2318 (underlying!200 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!21941)))))

(declare-fun mapNonEmpty!2711 () Bool)

(declare-fun mapRes!2711 () Bool)

(declare-fun tp!7686 () Bool)

(declare-fun e!36424 () Bool)

(assert (=> mapNonEmpty!2711 (= mapRes!2711 (and tp!7686 e!36424))))

(declare-fun mapValue!2712 () ValueCell!830)

(declare-fun mapRest!2712 () (Array (_ BitVec 32) ValueCell!830))

(declare-fun mapKey!2711 () (_ BitVec 32))

(assert (=> mapNonEmpty!2711 (= (arr!1721 (_values!1981 (v!2318 (underlying!200 thiss!992)))) (store mapRest!2712 mapKey!2711 mapValue!2712))))

(declare-fun mapIsEmpty!2711 () Bool)

(assert (=> mapIsEmpty!2711 mapRes!2711))

(declare-fun e!36427 () Bool)

(declare-fun tp_is_empty!2347 () Bool)

(declare-fun e!36428 () Bool)

(declare-fun array_inv!1057 (array!3597) Bool)

(declare-fun array_inv!1058 (array!3599) Bool)

(assert (=> b!55437 (= e!36428 (and tp!7683 tp_is_empty!2347 (array_inv!1057 (_keys!3617 (v!2318 (underlying!200 thiss!992)))) (array_inv!1058 (_values!1981 (v!2318 (underlying!200 thiss!992)))) e!36427))))

(declare-fun b!55438 () Bool)

(declare-fun e!36433 () Bool)

(assert (=> b!55438 (= e!36433 tp_is_empty!2347)))

(declare-fun b!55440 () Bool)

(declare-fun res!31240 () Bool)

(assert (=> b!55440 (=> (not res!31240) (not e!36430))))

(assert (=> b!55440 (= res!31240 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5856 newMap!16)) (_size!333 (v!2318 (underlying!200 thiss!992)))))))

(declare-fun b!55441 () Bool)

(declare-fun e!36435 () Bool)

(assert (=> b!55441 (= e!36435 e!36428)))

(declare-fun b!55442 () Bool)

(declare-fun e!36431 () Bool)

(assert (=> b!55442 (= e!36427 (and e!36431 mapRes!2711))))

(declare-fun condMapEmpty!2711 () Bool)

(declare-fun mapDefault!2711 () ValueCell!830)

(assert (=> b!55442 (= condMapEmpty!2711 (= (arr!1721 (_values!1981 (v!2318 (underlying!200 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!830)) mapDefault!2711)))))

(declare-fun b!55443 () Bool)

(declare-fun res!31235 () Bool)

(assert (=> b!55443 (=> res!31235 e!36426)))

(assert (=> b!55443 (= res!31235 (contains!655 lt!21941 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55444 () Bool)

(assert (=> b!55444 (= e!36431 tp_is_empty!2347)))

(declare-fun b!55445 () Bool)

(declare-fun e!36421 () Bool)

(assert (=> b!55445 (= e!36425 e!36421)))

(declare-fun res!31241 () Bool)

(assert (=> b!55445 (=> (not res!31241) (not e!36421))))

(declare-fun contains!656 (ListLongMap!1327 (_ BitVec 64)) Bool)

(assert (=> b!55445 (= res!31241 (contains!656 lt!21943 (select (arr!1720 (_keys!3617 (v!2318 (underlying!200 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1984 0))(
  ( (tuple2!1985 (_1!1003 Bool) (_2!1003 LongMapFixedSize!568)) )
))
(declare-fun lt!21945 () tuple2!1984)

(declare-fun update!72 (LongMapFixedSize!568 (_ BitVec 64) V!2777) tuple2!1984)

(declare-fun get!1040 (ValueCell!830 V!2777) V!2777)

(declare-fun dynLambda!296 (Int (_ BitVec 64)) V!2777)

(assert (=> b!55445 (= lt!21945 (update!72 newMap!16 (select (arr!1720 (_keys!3617 (v!2318 (underlying!200 thiss!992)))) from!355) (get!1040 (select (arr!1721 (_values!1981 (v!2318 (underlying!200 thiss!992)))) from!355) (dynLambda!296 (defaultEntry!1998 (v!2318 (underlying!200 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!36423 () Bool)

(declare-fun e!36429 () Bool)

(assert (=> b!55446 (= e!36423 (and tp!7684 tp_is_empty!2347 (array_inv!1057 (_keys!3617 newMap!16)) (array_inv!1058 (_values!1981 newMap!16)) e!36429))))

(declare-fun b!55447 () Bool)

(declare-fun res!31245 () Bool)

(assert (=> b!55447 (=> (not res!31245) (not e!36430))))

(declare-fun valid!226 (LongMapFixedSize!568) Bool)

(assert (=> b!55447 (= res!31245 (valid!226 newMap!16))))

(declare-fun mapNonEmpty!2712 () Bool)

(declare-fun mapRes!2712 () Bool)

(declare-fun tp!7685 () Bool)

(assert (=> mapNonEmpty!2712 (= mapRes!2712 (and tp!7685 e!36433))))

(declare-fun mapValue!2711 () ValueCell!830)

(declare-fun mapRest!2711 () (Array (_ BitVec 32) ValueCell!830))

(declare-fun mapKey!2712 () (_ BitVec 32))

(assert (=> mapNonEmpty!2712 (= (arr!1721 (_values!1981 newMap!16)) (store mapRest!2711 mapKey!2712 mapValue!2711))))

(declare-fun b!55448 () Bool)

(declare-fun res!31237 () Bool)

(assert (=> b!55448 (=> (not res!31237) (not e!36430))))

(assert (=> b!55448 (= res!31237 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1950 (_keys!3617 (v!2318 (underlying!200 thiss!992)))))))))

(declare-fun b!55449 () Bool)

(assert (=> b!55449 (= e!36424 tp_is_empty!2347)))

(declare-fun b!55450 () Bool)

(declare-fun e!36422 () Bool)

(assert (=> b!55450 (= e!36422 e!36435)))

(declare-fun b!55451 () Bool)

(declare-fun e!36434 () Bool)

(assert (=> b!55451 (= e!36429 (and e!36434 mapRes!2712))))

(declare-fun condMapEmpty!2712 () Bool)

(declare-fun mapDefault!2712 () ValueCell!830)

(assert (=> b!55451 (= condMapEmpty!2712 (= (arr!1721 (_values!1981 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!830)) mapDefault!2712)))))

(declare-fun b!55439 () Bool)

(assert (=> b!55439 (= e!36426 true)))

(declare-fun lt!21944 () Bool)

(assert (=> b!55439 (= lt!21944 (contains!655 lt!21941 (select (arr!1720 (_keys!3617 (v!2318 (underlying!200 thiss!992)))) from!355)))))

(declare-fun res!31238 () Bool)

(assert (=> start!8352 (=> (not res!31238) (not e!36430))))

(declare-fun valid!227 (LongMap!378) Bool)

(assert (=> start!8352 (= res!31238 (valid!227 thiss!992))))

(assert (=> start!8352 e!36430))

(assert (=> start!8352 e!36422))

(assert (=> start!8352 true))

(assert (=> start!8352 e!36423))

(declare-fun b!55452 () Bool)

(declare-fun res!31236 () Bool)

(assert (=> b!55452 (=> res!31236 e!36426)))

(declare-fun noDuplicate!41 (List!1402) Bool)

(assert (=> b!55452 (= res!31236 (not (noDuplicate!41 lt!21941)))))

(declare-fun b!55453 () Bool)

(assert (=> b!55453 (= e!36421 (not e!36426))))

(declare-fun res!31243 () Bool)

(assert (=> b!55453 (=> res!31243 e!36426)))

(assert (=> b!55453 (= res!31243 (or (bvsge (size!1950 (_keys!3617 (v!2318 (underlying!200 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1950 (_keys!3617 (v!2318 (underlying!200 thiss!992)))))))))

(assert (=> b!55453 (= lt!21941 (Cons!1398 (select (arr!1720 (_keys!3617 (v!2318 (underlying!200 thiss!992)))) from!355) Nil!1399))))

(assert (=> b!55453 (arrayNoDuplicates!0 (_keys!3617 (v!2318 (underlying!200 thiss!992))) from!355 Nil!1399)))

(declare-datatypes ((Unit!1450 0))(
  ( (Unit!1451) )
))
(declare-fun lt!21947 () Unit!1450)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3597 (_ BitVec 32) (_ BitVec 32)) Unit!1450)

(assert (=> b!55453 (= lt!21947 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3617 (v!2318 (underlying!200 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55453 (arrayContainsKey!0 (_keys!3617 (v!2318 (underlying!200 thiss!992))) (select (arr!1720 (_keys!3617 (v!2318 (underlying!200 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!21942 () Unit!1450)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!12 (array!3597 array!3599 (_ BitVec 32) (_ BitVec 32) V!2777 V!2777 (_ BitVec 64) (_ BitVec 32) Int) Unit!1450)

(assert (=> b!55453 (= lt!21942 (lemmaListMapContainsThenArrayContainsFrom!12 (_keys!3617 (v!2318 (underlying!200 thiss!992))) (_values!1981 (v!2318 (underlying!200 thiss!992))) (mask!5856 (v!2318 (underlying!200 thiss!992))) (extraKeys!1889 (v!2318 (underlying!200 thiss!992))) (zeroValue!1916 (v!2318 (underlying!200 thiss!992))) (minValue!1916 (v!2318 (underlying!200 thiss!992))) (select (arr!1720 (_keys!3617 (v!2318 (underlying!200 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1998 (v!2318 (underlying!200 thiss!992)))))))

(declare-fun mapIsEmpty!2712 () Bool)

(assert (=> mapIsEmpty!2712 mapRes!2712))

(declare-fun b!55454 () Bool)

(assert (=> b!55454 (= e!36434 tp_is_empty!2347)))

(assert (= (and start!8352 res!31238) b!55448))

(assert (= (and b!55448 res!31237) b!55447))

(assert (= (and b!55447 res!31245) b!55440))

(assert (= (and b!55440 res!31240) b!55435))

(assert (= (and b!55435 res!31239) b!55445))

(assert (= (and b!55445 res!31241) b!55453))

(assert (= (and b!55453 (not res!31243)) b!55452))

(assert (= (and b!55452 (not res!31236)) b!55434))

(assert (= (and b!55434 (not res!31242)) b!55443))

(assert (= (and b!55443 (not res!31235)) b!55436))

(assert (= (and b!55436 (not res!31244)) b!55439))

(assert (= (and b!55442 condMapEmpty!2711) mapIsEmpty!2711))

(assert (= (and b!55442 (not condMapEmpty!2711)) mapNonEmpty!2711))

(get-info :version)

(assert (= (and mapNonEmpty!2711 ((_ is ValueCellFull!830) mapValue!2712)) b!55449))

(assert (= (and b!55442 ((_ is ValueCellFull!830) mapDefault!2711)) b!55444))

(assert (= b!55437 b!55442))

(assert (= b!55441 b!55437))

(assert (= b!55450 b!55441))

(assert (= start!8352 b!55450))

(assert (= (and b!55451 condMapEmpty!2712) mapIsEmpty!2712))

(assert (= (and b!55451 (not condMapEmpty!2712)) mapNonEmpty!2712))

(assert (= (and mapNonEmpty!2712 ((_ is ValueCellFull!830) mapValue!2711)) b!55438))

(assert (= (and b!55451 ((_ is ValueCellFull!830) mapDefault!2712)) b!55454))

(assert (= b!55446 b!55451))

(assert (= start!8352 b!55446))

(declare-fun b_lambda!2445 () Bool)

(assert (=> (not b_lambda!2445) (not b!55445)))

(declare-fun t!4628 () Bool)

(declare-fun tb!1205 () Bool)

(assert (=> (and b!55437 (= (defaultEntry!1998 (v!2318 (underlying!200 thiss!992))) (defaultEntry!1998 (v!2318 (underlying!200 thiss!992)))) t!4628) tb!1205))

(declare-fun result!2205 () Bool)

(assert (=> tb!1205 (= result!2205 tp_is_empty!2347)))

(assert (=> b!55445 t!4628))

(declare-fun b_and!3269 () Bool)

(assert (= b_and!3265 (and (=> t!4628 result!2205) b_and!3269)))

(declare-fun t!4630 () Bool)

(declare-fun tb!1207 () Bool)

(assert (=> (and b!55446 (= (defaultEntry!1998 newMap!16) (defaultEntry!1998 (v!2318 (underlying!200 thiss!992)))) t!4630) tb!1207))

(declare-fun result!2209 () Bool)

(assert (= result!2209 result!2205))

(assert (=> b!55445 t!4630))

(declare-fun b_and!3271 () Bool)

(assert (= b_and!3267 (and (=> t!4630 result!2209) b_and!3271)))

(declare-fun m!46723 () Bool)

(assert (=> start!8352 m!46723))

(declare-fun m!46725 () Bool)

(assert (=> mapNonEmpty!2712 m!46725))

(declare-fun m!46727 () Bool)

(assert (=> b!55453 m!46727))

(declare-fun m!46729 () Bool)

(assert (=> b!55453 m!46729))

(declare-fun m!46731 () Bool)

(assert (=> b!55453 m!46731))

(declare-fun m!46733 () Bool)

(assert (=> b!55453 m!46733))

(assert (=> b!55453 m!46731))

(assert (=> b!55453 m!46731))

(declare-fun m!46735 () Bool)

(assert (=> b!55453 m!46735))

(declare-fun m!46737 () Bool)

(assert (=> mapNonEmpty!2711 m!46737))

(declare-fun m!46739 () Bool)

(assert (=> b!55452 m!46739))

(declare-fun m!46741 () Bool)

(assert (=> b!55434 m!46741))

(declare-fun m!46743 () Bool)

(assert (=> b!55447 m!46743))

(assert (=> b!55435 m!46731))

(declare-fun m!46745 () Bool)

(assert (=> b!55435 m!46745))

(declare-fun m!46747 () Bool)

(assert (=> b!55435 m!46747))

(declare-fun m!46749 () Bool)

(assert (=> b!55445 m!46749))

(declare-fun m!46751 () Bool)

(assert (=> b!55445 m!46751))

(declare-fun m!46753 () Bool)

(assert (=> b!55445 m!46753))

(assert (=> b!55445 m!46731))

(declare-fun m!46755 () Bool)

(assert (=> b!55445 m!46755))

(assert (=> b!55445 m!46731))

(assert (=> b!55445 m!46751))

(assert (=> b!55445 m!46731))

(assert (=> b!55445 m!46753))

(declare-fun m!46757 () Bool)

(assert (=> b!55445 m!46757))

(assert (=> b!55445 m!46749))

(declare-fun m!46759 () Bool)

(assert (=> b!55436 m!46759))

(declare-fun m!46761 () Bool)

(assert (=> b!55446 m!46761))

(declare-fun m!46763 () Bool)

(assert (=> b!55446 m!46763))

(declare-fun m!46765 () Bool)

(assert (=> b!55443 m!46765))

(declare-fun m!46767 () Bool)

(assert (=> b!55437 m!46767))

(declare-fun m!46769 () Bool)

(assert (=> b!55437 m!46769))

(assert (=> b!55439 m!46731))

(assert (=> b!55439 m!46731))

(declare-fun m!46771 () Bool)

(assert (=> b!55439 m!46771))

(check-sat (not b!55434) (not b!55436) (not b!55437) (not b!55445) (not b_next!1861) (not b!55435) (not b!55447) (not b_next!1863) (not b!55446) tp_is_empty!2347 (not b!55443) b_and!3271 (not mapNonEmpty!2712) b_and!3269 (not b!55453) (not b!55452) (not b!55439) (not start!8352) (not b_lambda!2445) (not mapNonEmpty!2711))
(check-sat b_and!3269 b_and!3271 (not b_next!1861) (not b_next!1863))
