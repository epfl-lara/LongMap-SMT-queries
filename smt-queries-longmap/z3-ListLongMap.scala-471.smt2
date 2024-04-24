; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9216 () Bool)

(assert start!9216)

(declare-fun b!65589 () Bool)

(declare-fun b_free!2041 () Bool)

(declare-fun b_next!2041 () Bool)

(assert (=> b!65589 (= b_free!2041 (not b_next!2041))))

(declare-fun tp!8273 () Bool)

(declare-fun b_and!4029 () Bool)

(assert (=> b!65589 (= tp!8273 b_and!4029)))

(declare-fun b!65590 () Bool)

(declare-fun b_free!2043 () Bool)

(declare-fun b_next!2043 () Bool)

(assert (=> b!65590 (= b_free!2043 (not b_next!2043))))

(declare-fun tp!8274 () Bool)

(declare-fun b_and!4031 () Bool)

(assert (=> b!65590 (= tp!8274 b_and!4031)))

(declare-fun b!65583 () Bool)

(declare-fun e!42973 () Bool)

(declare-fun e!42971 () Bool)

(declare-fun mapRes!3029 () Bool)

(assert (=> b!65583 (= e!42973 (and e!42971 mapRes!3029))))

(declare-fun condMapEmpty!3030 () Bool)

(declare-datatypes ((V!2897 0))(
  ( (V!2898 (val!1263 Int)) )
))
(declare-datatypes ((array!3797 0))(
  ( (array!3798 (arr!1814 (Array (_ BitVec 32) (_ BitVec 64))) (size!2049 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!875 0))(
  ( (ValueCellFull!875 (v!2464 V!2897)) (EmptyCell!875) )
))
(declare-datatypes ((array!3799 0))(
  ( (array!3800 (arr!1815 (Array (_ BitVec 32) ValueCell!875)) (size!2050 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!658 0))(
  ( (LongMapFixedSize!659 (defaultEntry!2137 Int) (mask!6067 (_ BitVec 32)) (extraKeys!2008 (_ BitVec 32)) (zeroValue!2045 V!2897) (minValue!2045 V!2897) (_size!378 (_ BitVec 32)) (_keys!3777 array!3797) (_values!2120 array!3799) (_vacant!378 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!658)

(declare-fun mapDefault!3029 () ValueCell!875)

(assert (=> b!65583 (= condMapEmpty!3030 (= (arr!1815 (_values!2120 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!875)) mapDefault!3029)))))

(declare-fun b!65584 () Bool)

(declare-fun res!35649 () Bool)

(declare-fun e!42977 () Bool)

(assert (=> b!65584 (=> (not res!35649) (not e!42977))))

(declare-fun valid!282 (LongMapFixedSize!658) Bool)

(assert (=> b!65584 (= res!35649 (valid!282 newMap!16))))

(declare-fun mapIsEmpty!3029 () Bool)

(assert (=> mapIsEmpty!3029 mapRes!3029))

(declare-fun b!65585 () Bool)

(declare-fun e!42970 () Bool)

(declare-fun tp_is_empty!2437 () Bool)

(assert (=> b!65585 (= e!42970 tp_is_empty!2437)))

(declare-fun res!35650 () Bool)

(assert (=> start!9216 (=> (not res!35650) (not e!42977))))

(declare-datatypes ((Cell!468 0))(
  ( (Cell!469 (v!2465 LongMapFixedSize!658)) )
))
(declare-datatypes ((LongMap!468 0))(
  ( (LongMap!469 (underlying!245 Cell!468)) )
))
(declare-fun thiss!992 () LongMap!468)

(declare-fun valid!283 (LongMap!468) Bool)

(assert (=> start!9216 (= res!35650 (valid!283 thiss!992))))

(assert (=> start!9216 e!42977))

(declare-fun e!42968 () Bool)

(assert (=> start!9216 e!42968))

(assert (=> start!9216 true))

(declare-fun e!42976 () Bool)

(assert (=> start!9216 e!42976))

(declare-fun b!65586 () Bool)

(declare-datatypes ((Unit!1806 0))(
  ( (Unit!1807) )
))
(declare-fun e!42969 () Unit!1806)

(declare-fun Unit!1808 () Unit!1806)

(assert (=> b!65586 (= e!42969 Unit!1808)))

(declare-fun b!65587 () Bool)

(declare-fun e!42972 () Bool)

(assert (=> b!65587 (= e!42972 false)))

(declare-datatypes ((tuple2!2064 0))(
  ( (tuple2!2065 (_1!1043 (_ BitVec 64)) (_2!1043 V!2897)) )
))
(declare-datatypes ((List!1446 0))(
  ( (Nil!1443) (Cons!1442 (h!2026 tuple2!2064) (t!4896 List!1446)) )
))
(declare-datatypes ((ListLongMap!1369 0))(
  ( (ListLongMap!1370 (toList!700 List!1446)) )
))
(declare-fun lt!28120 () ListLongMap!1369)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!49 (array!3797 array!3799 (_ BitVec 32) (_ BitVec 32) V!2897 V!2897 (_ BitVec 32) Int) ListLongMap!1369)

(assert (=> b!65587 (= lt!28120 (getCurrentListMapNoExtraKeys!49 (_keys!3777 (v!2465 (underlying!245 thiss!992))) (_values!2120 (v!2465 (underlying!245 thiss!992))) (mask!6067 (v!2465 (underlying!245 thiss!992))) (extraKeys!2008 (v!2465 (underlying!245 thiss!992))) (zeroValue!2045 (v!2465 (underlying!245 thiss!992))) (minValue!2045 (v!2465 (underlying!245 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2137 (v!2465 (underlying!245 thiss!992)))))))

(declare-fun b!65588 () Bool)

(declare-fun e!42974 () Bool)

(declare-fun e!42967 () Bool)

(assert (=> b!65588 (= e!42974 e!42967)))

(declare-fun e!42982 () Bool)

(declare-fun array_inv!1111 (array!3797) Bool)

(declare-fun array_inv!1112 (array!3799) Bool)

(assert (=> b!65589 (= e!42967 (and tp!8273 tp_is_empty!2437 (array_inv!1111 (_keys!3777 (v!2465 (underlying!245 thiss!992)))) (array_inv!1112 (_values!2120 (v!2465 (underlying!245 thiss!992)))) e!42982))))

(assert (=> b!65590 (= e!42976 (and tp!8274 tp_is_empty!2437 (array_inv!1111 (_keys!3777 newMap!16)) (array_inv!1112 (_values!2120 newMap!16)) e!42973))))

(declare-fun b!65591 () Bool)

(assert (=> b!65591 (= e!42971 tp_is_empty!2437)))

(declare-fun mapIsEmpty!3030 () Bool)

(declare-fun mapRes!3030 () Bool)

(assert (=> mapIsEmpty!3030 mapRes!3030))

(declare-fun b!65592 () Bool)

(declare-fun e!42975 () Bool)

(assert (=> b!65592 (= e!42975 e!42972)))

(declare-fun res!35646 () Bool)

(assert (=> b!65592 (=> (not res!35646) (not e!42972))))

(declare-datatypes ((tuple2!2066 0))(
  ( (tuple2!2067 (_1!1044 Bool) (_2!1044 LongMapFixedSize!658)) )
))
(declare-fun lt!28119 () tuple2!2066)

(assert (=> b!65592 (= res!35646 (and (_1!1044 lt!28119) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!28121 () Unit!1806)

(assert (=> b!65592 (= lt!28121 e!42969)))

(declare-fun lt!28114 () ListLongMap!1369)

(declare-fun c!9014 () Bool)

(declare-fun contains!700 (ListLongMap!1369 (_ BitVec 64)) Bool)

(assert (=> b!65592 (= c!9014 (contains!700 lt!28114 (select (arr!1814 (_keys!3777 (v!2465 (underlying!245 thiss!992)))) from!355)))))

(declare-fun update!98 (LongMapFixedSize!658 (_ BitVec 64) V!2897) tuple2!2066)

(declare-fun get!1113 (ValueCell!875 V!2897) V!2897)

(declare-fun dynLambda!316 (Int (_ BitVec 64)) V!2897)

(assert (=> b!65592 (= lt!28119 (update!98 newMap!16 (select (arr!1814 (_keys!3777 (v!2465 (underlying!245 thiss!992)))) from!355) (get!1113 (select (arr!1815 (_values!2120 (v!2465 (underlying!245 thiss!992)))) from!355) (dynLambda!316 (defaultEntry!2137 (v!2465 (underlying!245 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!65593 () Bool)

(declare-fun e!42981 () Bool)

(assert (=> b!65593 (= e!42982 (and e!42981 mapRes!3030))))

(declare-fun condMapEmpty!3029 () Bool)

(declare-fun mapDefault!3030 () ValueCell!875)

(assert (=> b!65593 (= condMapEmpty!3029 (= (arr!1815 (_values!2120 (v!2465 (underlying!245 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!875)) mapDefault!3030)))))

(declare-fun b!65594 () Bool)

(assert (=> b!65594 (= e!42968 e!42974)))

(declare-fun b!65595 () Bool)

(declare-fun res!35651 () Bool)

(assert (=> b!65595 (=> (not res!35651) (not e!42977))))

(assert (=> b!65595 (= res!35651 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2049 (_keys!3777 (v!2465 (underlying!245 thiss!992)))))))))

(declare-fun b!65596 () Bool)

(assert (=> b!65596 (= e!42977 e!42975)))

(declare-fun res!35648 () Bool)

(assert (=> b!65596 (=> (not res!35648) (not e!42975))))

(declare-fun lt!28117 () ListLongMap!1369)

(assert (=> b!65596 (= res!35648 (and (= lt!28117 lt!28114) (not (= (select (arr!1814 (_keys!3777 (v!2465 (underlying!245 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1814 (_keys!3777 (v!2465 (underlying!245 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1133 (LongMapFixedSize!658) ListLongMap!1369)

(assert (=> b!65596 (= lt!28114 (map!1133 newMap!16))))

(declare-fun getCurrentListMap!399 (array!3797 array!3799 (_ BitVec 32) (_ BitVec 32) V!2897 V!2897 (_ BitVec 32) Int) ListLongMap!1369)

(assert (=> b!65596 (= lt!28117 (getCurrentListMap!399 (_keys!3777 (v!2465 (underlying!245 thiss!992))) (_values!2120 (v!2465 (underlying!245 thiss!992))) (mask!6067 (v!2465 (underlying!245 thiss!992))) (extraKeys!2008 (v!2465 (underlying!245 thiss!992))) (zeroValue!2045 (v!2465 (underlying!245 thiss!992))) (minValue!2045 (v!2465 (underlying!245 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2137 (v!2465 (underlying!245 thiss!992)))))))

(declare-fun b!65597 () Bool)

(declare-fun res!35647 () Bool)

(assert (=> b!65597 (=> (not res!35647) (not e!42977))))

(assert (=> b!65597 (= res!35647 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6067 newMap!16)) (_size!378 (v!2465 (underlying!245 thiss!992)))))))

(declare-fun b!65598 () Bool)

(assert (=> b!65598 (= e!42981 tp_is_empty!2437)))

(declare-fun b!65599 () Bool)

(declare-fun Unit!1809 () Unit!1806)

(assert (=> b!65599 (= e!42969 Unit!1809)))

(declare-fun lt!28118 () Unit!1806)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!33 (array!3797 array!3799 (_ BitVec 32) (_ BitVec 32) V!2897 V!2897 (_ BitVec 64) (_ BitVec 32) Int) Unit!1806)

(assert (=> b!65599 (= lt!28118 (lemmaListMapContainsThenArrayContainsFrom!33 (_keys!3777 (v!2465 (underlying!245 thiss!992))) (_values!2120 (v!2465 (underlying!245 thiss!992))) (mask!6067 (v!2465 (underlying!245 thiss!992))) (extraKeys!2008 (v!2465 (underlying!245 thiss!992))) (zeroValue!2045 (v!2465 (underlying!245 thiss!992))) (minValue!2045 (v!2465 (underlying!245 thiss!992))) (select (arr!1814 (_keys!3777 (v!2465 (underlying!245 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2137 (v!2465 (underlying!245 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!65599 (arrayContainsKey!0 (_keys!3777 (v!2465 (underlying!245 thiss!992))) (select (arr!1814 (_keys!3777 (v!2465 (underlying!245 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!28116 () Unit!1806)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3797 (_ BitVec 32) (_ BitVec 32)) Unit!1806)

(assert (=> b!65599 (= lt!28116 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3777 (v!2465 (underlying!245 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1447 0))(
  ( (Nil!1444) (Cons!1443 (h!2027 (_ BitVec 64)) (t!4897 List!1447)) )
))
(declare-fun arrayNoDuplicates!0 (array!3797 (_ BitVec 32) List!1447) Bool)

(assert (=> b!65599 (arrayNoDuplicates!0 (_keys!3777 (v!2465 (underlying!245 thiss!992))) from!355 Nil!1444)))

(declare-fun lt!28115 () Unit!1806)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3797 (_ BitVec 32) (_ BitVec 64) List!1447) Unit!1806)

(assert (=> b!65599 (= lt!28115 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3777 (v!2465 (underlying!245 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1814 (_keys!3777 (v!2465 (underlying!245 thiss!992)))) from!355) (Cons!1443 (select (arr!1814 (_keys!3777 (v!2465 (underlying!245 thiss!992)))) from!355) Nil!1444)))))

(assert (=> b!65599 false))

(declare-fun mapNonEmpty!3029 () Bool)

(declare-fun tp!8271 () Bool)

(declare-fun e!42980 () Bool)

(assert (=> mapNonEmpty!3029 (= mapRes!3029 (and tp!8271 e!42980))))

(declare-fun mapKey!3030 () (_ BitVec 32))

(declare-fun mapRest!3029 () (Array (_ BitVec 32) ValueCell!875))

(declare-fun mapValue!3030 () ValueCell!875)

(assert (=> mapNonEmpty!3029 (= (arr!1815 (_values!2120 newMap!16)) (store mapRest!3029 mapKey!3030 mapValue!3030))))

(declare-fun b!65600 () Bool)

(assert (=> b!65600 (= e!42980 tp_is_empty!2437)))

(declare-fun mapNonEmpty!3030 () Bool)

(declare-fun tp!8272 () Bool)

(assert (=> mapNonEmpty!3030 (= mapRes!3030 (and tp!8272 e!42970))))

(declare-fun mapKey!3029 () (_ BitVec 32))

(declare-fun mapValue!3029 () ValueCell!875)

(declare-fun mapRest!3030 () (Array (_ BitVec 32) ValueCell!875))

(assert (=> mapNonEmpty!3030 (= (arr!1815 (_values!2120 (v!2465 (underlying!245 thiss!992)))) (store mapRest!3030 mapKey!3029 mapValue!3029))))

(assert (= (and start!9216 res!35650) b!65595))

(assert (= (and b!65595 res!35651) b!65584))

(assert (= (and b!65584 res!35649) b!65597))

(assert (= (and b!65597 res!35647) b!65596))

(assert (= (and b!65596 res!35648) b!65592))

(assert (= (and b!65592 c!9014) b!65599))

(assert (= (and b!65592 (not c!9014)) b!65586))

(assert (= (and b!65592 res!35646) b!65587))

(assert (= (and b!65593 condMapEmpty!3029) mapIsEmpty!3030))

(assert (= (and b!65593 (not condMapEmpty!3029)) mapNonEmpty!3030))

(get-info :version)

(assert (= (and mapNonEmpty!3030 ((_ is ValueCellFull!875) mapValue!3029)) b!65585))

(assert (= (and b!65593 ((_ is ValueCellFull!875) mapDefault!3030)) b!65598))

(assert (= b!65589 b!65593))

(assert (= b!65588 b!65589))

(assert (= b!65594 b!65588))

(assert (= start!9216 b!65594))

(assert (= (and b!65583 condMapEmpty!3030) mapIsEmpty!3029))

(assert (= (and b!65583 (not condMapEmpty!3030)) mapNonEmpty!3029))

(assert (= (and mapNonEmpty!3029 ((_ is ValueCellFull!875) mapValue!3030)) b!65600))

(assert (= (and b!65583 ((_ is ValueCellFull!875) mapDefault!3029)) b!65591))

(assert (= b!65590 b!65583))

(assert (= start!9216 b!65590))

(declare-fun b_lambda!2945 () Bool)

(assert (=> (not b_lambda!2945) (not b!65592)))

(declare-fun t!4893 () Bool)

(declare-fun tb!1425 () Bool)

(assert (=> (and b!65589 (= (defaultEntry!2137 (v!2465 (underlying!245 thiss!992))) (defaultEntry!2137 (v!2465 (underlying!245 thiss!992)))) t!4893) tb!1425))

(declare-fun result!2529 () Bool)

(assert (=> tb!1425 (= result!2529 tp_is_empty!2437)))

(assert (=> b!65592 t!4893))

(declare-fun b_and!4033 () Bool)

(assert (= b_and!4029 (and (=> t!4893 result!2529) b_and!4033)))

(declare-fun tb!1427 () Bool)

(declare-fun t!4895 () Bool)

(assert (=> (and b!65590 (= (defaultEntry!2137 newMap!16) (defaultEntry!2137 (v!2465 (underlying!245 thiss!992)))) t!4895) tb!1427))

(declare-fun result!2533 () Bool)

(assert (= result!2533 result!2529))

(assert (=> b!65592 t!4895))

(declare-fun b_and!4035 () Bool)

(assert (= b_and!4031 (and (=> t!4895 result!2533) b_and!4035)))

(declare-fun m!60299 () Bool)

(assert (=> b!65599 m!60299))

(declare-fun m!60301 () Bool)

(assert (=> b!65599 m!60301))

(declare-fun m!60303 () Bool)

(assert (=> b!65599 m!60303))

(declare-fun m!60305 () Bool)

(assert (=> b!65599 m!60305))

(assert (=> b!65599 m!60303))

(assert (=> b!65599 m!60303))

(declare-fun m!60307 () Bool)

(assert (=> b!65599 m!60307))

(assert (=> b!65599 m!60303))

(declare-fun m!60309 () Bool)

(assert (=> b!65599 m!60309))

(declare-fun m!60311 () Bool)

(assert (=> b!65587 m!60311))

(assert (=> b!65592 m!60303))

(declare-fun m!60313 () Bool)

(assert (=> b!65592 m!60313))

(assert (=> b!65592 m!60303))

(declare-fun m!60315 () Bool)

(assert (=> b!65592 m!60315))

(declare-fun m!60317 () Bool)

(assert (=> b!65592 m!60317))

(declare-fun m!60319 () Bool)

(assert (=> b!65592 m!60319))

(assert (=> b!65592 m!60319))

(assert (=> b!65592 m!60313))

(assert (=> b!65592 m!60315))

(assert (=> b!65592 m!60303))

(declare-fun m!60321 () Bool)

(assert (=> b!65592 m!60321))

(declare-fun m!60323 () Bool)

(assert (=> mapNonEmpty!3030 m!60323))

(declare-fun m!60325 () Bool)

(assert (=> b!65589 m!60325))

(declare-fun m!60327 () Bool)

(assert (=> b!65589 m!60327))

(assert (=> b!65596 m!60303))

(declare-fun m!60329 () Bool)

(assert (=> b!65596 m!60329))

(declare-fun m!60331 () Bool)

(assert (=> b!65596 m!60331))

(declare-fun m!60333 () Bool)

(assert (=> mapNonEmpty!3029 m!60333))

(declare-fun m!60335 () Bool)

(assert (=> b!65590 m!60335))

(declare-fun m!60337 () Bool)

(assert (=> b!65590 m!60337))

(declare-fun m!60339 () Bool)

(assert (=> start!9216 m!60339))

(declare-fun m!60341 () Bool)

(assert (=> b!65584 m!60341))

(check-sat (not mapNonEmpty!3030) (not b!65590) (not b!65596) (not mapNonEmpty!3029) (not b_lambda!2945) (not start!9216) (not b!65599) (not b!65592) (not b!65587) (not b!65589) b_and!4033 (not b_next!2041) tp_is_empty!2437 b_and!4035 (not b_next!2043) (not b!65584))
(check-sat b_and!4033 b_and!4035 (not b_next!2041) (not b_next!2043))
