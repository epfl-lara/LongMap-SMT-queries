; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9210 () Bool)

(assert start!9210)

(declare-fun b!65273 () Bool)

(declare-fun b_free!2029 () Bool)

(declare-fun b_next!2029 () Bool)

(assert (=> b!65273 (= b_free!2029 (not b_next!2029))))

(declare-fun tp!8238 () Bool)

(declare-fun b_and!3985 () Bool)

(assert (=> b!65273 (= tp!8238 b_and!3985)))

(declare-fun b!65267 () Bool)

(declare-fun b_free!2031 () Bool)

(declare-fun b_next!2031 () Bool)

(assert (=> b!65267 (= b_free!2031 (not b_next!2031))))

(declare-fun tp!8235 () Bool)

(declare-fun b_and!3987 () Bool)

(assert (=> b!65267 (= tp!8235 b_and!3987)))

(declare-fun mapIsEmpty!3011 () Bool)

(declare-fun mapRes!3012 () Bool)

(assert (=> mapIsEmpty!3011 mapRes!3012))

(declare-fun b!65258 () Bool)

(declare-fun e!42752 () Bool)

(declare-fun e!42750 () Bool)

(assert (=> b!65258 (= e!42752 e!42750)))

(declare-fun mapNonEmpty!3011 () Bool)

(declare-fun tp!8236 () Bool)

(declare-fun e!42747 () Bool)

(assert (=> mapNonEmpty!3011 (= mapRes!3012 (and tp!8236 e!42747))))

(declare-datatypes ((V!2889 0))(
  ( (V!2890 (val!1260 Int)) )
))
(declare-datatypes ((ValueCell!872 0))(
  ( (ValueCellFull!872 (v!2451 V!2889)) (EmptyCell!872) )
))
(declare-fun mapValue!3012 () ValueCell!872)

(declare-fun mapRest!3011 () (Array (_ BitVec 32) ValueCell!872))

(declare-fun mapKey!3011 () (_ BitVec 32))

(declare-datatypes ((array!3779 0))(
  ( (array!3780 (arr!1804 (Array (_ BitVec 32) (_ BitVec 64))) (size!2040 (_ BitVec 32))) )
))
(declare-datatypes ((array!3781 0))(
  ( (array!3782 (arr!1805 (Array (_ BitVec 32) ValueCell!872)) (size!2041 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!652 0))(
  ( (LongMapFixedSize!653 (defaultEntry!2134 Int) (mask!6061 (_ BitVec 32)) (extraKeys!2005 (_ BitVec 32)) (zeroValue!2042 V!2889) (minValue!2042 V!2889) (_size!375 (_ BitVec 32)) (_keys!3773 array!3779) (_values!2117 array!3781) (_vacant!375 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!652)

(assert (=> mapNonEmpty!3011 (= (arr!1805 (_values!2117 newMap!16)) (store mapRest!3011 mapKey!3011 mapValue!3012))))

(declare-fun b!65259 () Bool)

(declare-fun e!42753 () Bool)

(declare-fun e!42757 () Bool)

(assert (=> b!65259 (= e!42753 e!42757)))

(declare-fun res!35510 () Bool)

(assert (=> b!65259 (=> (not res!35510) (not e!42757))))

(declare-datatypes ((Cell!454 0))(
  ( (Cell!455 (v!2452 LongMapFixedSize!652)) )
))
(declare-datatypes ((LongMap!454 0))(
  ( (LongMap!455 (underlying!238 Cell!454)) )
))
(declare-fun thiss!992 () LongMap!454)

(declare-datatypes ((tuple2!2064 0))(
  ( (tuple2!2065 (_1!1043 (_ BitVec 64)) (_2!1043 V!2889)) )
))
(declare-datatypes ((List!1457 0))(
  ( (Nil!1454) (Cons!1453 (h!2037 tuple2!2064) (t!4894 List!1457)) )
))
(declare-datatypes ((ListLongMap!1371 0))(
  ( (ListLongMap!1372 (toList!701 List!1457)) )
))
(declare-fun lt!27930 () ListLongMap!1371)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!27932 () ListLongMap!1371)

(assert (=> b!65259 (= res!35510 (and (= lt!27930 lt!27932) (not (= (select (arr!1804 (_keys!3773 (v!2452 (underlying!238 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1804 (_keys!3773 (v!2452 (underlying!238 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1123 (LongMapFixedSize!652) ListLongMap!1371)

(assert (=> b!65259 (= lt!27932 (map!1123 newMap!16))))

(declare-fun getCurrentListMap!397 (array!3779 array!3781 (_ BitVec 32) (_ BitVec 32) V!2889 V!2889 (_ BitVec 32) Int) ListLongMap!1371)

(assert (=> b!65259 (= lt!27930 (getCurrentListMap!397 (_keys!3773 (v!2452 (underlying!238 thiss!992))) (_values!2117 (v!2452 (underlying!238 thiss!992))) (mask!6061 (v!2452 (underlying!238 thiss!992))) (extraKeys!2005 (v!2452 (underlying!238 thiss!992))) (zeroValue!2042 (v!2452 (underlying!238 thiss!992))) (minValue!2042 (v!2452 (underlying!238 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2134 (v!2452 (underlying!238 thiss!992)))))))

(declare-fun b!65260 () Bool)

(declare-fun res!35511 () Bool)

(assert (=> b!65260 (=> (not res!35511) (not e!42753))))

(assert (=> b!65260 (= res!35511 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6061 newMap!16)) (_size!375 (v!2452 (underlying!238 thiss!992)))))))

(declare-fun b!65261 () Bool)

(declare-fun res!35513 () Bool)

(declare-fun e!42748 () Bool)

(assert (=> b!65261 (=> (not res!35513) (not e!42748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!65261 (= res!35513 (validMask!0 (mask!6061 (v!2452 (underlying!238 thiss!992)))))))

(declare-fun b!65262 () Bool)

(declare-datatypes ((Unit!1793 0))(
  ( (Unit!1794) )
))
(declare-fun e!42744 () Unit!1793)

(declare-fun Unit!1795 () Unit!1793)

(assert (=> b!65262 (= e!42744 Unit!1795)))

(declare-fun b!65263 () Bool)

(declare-fun e!42746 () Bool)

(declare-fun tp_is_empty!2431 () Bool)

(assert (=> b!65263 (= e!42746 tp_is_empty!2431)))

(declare-fun b!65264 () Bool)

(assert (=> b!65264 (= e!42748 (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun b!65265 () Bool)

(declare-fun e!42745 () Bool)

(assert (=> b!65265 (= e!42745 tp_is_empty!2431)))

(declare-fun res!35505 () Bool)

(assert (=> start!9210 (=> (not res!35505) (not e!42753))))

(declare-fun valid!279 (LongMap!454) Bool)

(assert (=> start!9210 (= res!35505 (valid!279 thiss!992))))

(assert (=> start!9210 e!42753))

(declare-fun e!42749 () Bool)

(assert (=> start!9210 e!42749))

(assert (=> start!9210 true))

(declare-fun e!42758 () Bool)

(assert (=> start!9210 e!42758))

(declare-fun b!65266 () Bool)

(assert (=> b!65266 (= e!42757 e!42748)))

(declare-fun res!35512 () Bool)

(assert (=> b!65266 (=> (not res!35512) (not e!42748))))

(declare-datatypes ((tuple2!2066 0))(
  ( (tuple2!2067 (_1!1044 Bool) (_2!1044 LongMapFixedSize!652)) )
))
(declare-fun lt!27935 () tuple2!2066)

(assert (=> b!65266 (= res!35512 (and (_1!1044 lt!27935) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!27936 () Unit!1793)

(assert (=> b!65266 (= lt!27936 e!42744)))

(declare-fun c!8970 () Bool)

(declare-fun contains!699 (ListLongMap!1371 (_ BitVec 64)) Bool)

(assert (=> b!65266 (= c!8970 (contains!699 lt!27932 (select (arr!1804 (_keys!3773 (v!2452 (underlying!238 thiss!992)))) from!355)))))

(declare-fun update!91 (LongMapFixedSize!652 (_ BitVec 64) V!2889) tuple2!2066)

(declare-fun get!1107 (ValueCell!872 V!2889) V!2889)

(declare-fun dynLambda!315 (Int (_ BitVec 64)) V!2889)

(assert (=> b!65266 (= lt!27935 (update!91 newMap!16 (select (arr!1804 (_keys!3773 (v!2452 (underlying!238 thiss!992)))) from!355) (get!1107 (select (arr!1805 (_values!2117 (v!2452 (underlying!238 thiss!992)))) from!355) (dynLambda!315 (defaultEntry!2134 (v!2452 (underlying!238 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!42756 () Bool)

(declare-fun array_inv!1125 (array!3779) Bool)

(declare-fun array_inv!1126 (array!3781) Bool)

(assert (=> b!65267 (= e!42758 (and tp!8235 tp_is_empty!2431 (array_inv!1125 (_keys!3773 newMap!16)) (array_inv!1126 (_values!2117 newMap!16)) e!42756))))

(declare-fun b!65268 () Bool)

(declare-fun res!35514 () Bool)

(assert (=> b!65268 (=> (not res!35514) (not e!42753))))

(declare-fun valid!280 (LongMapFixedSize!652) Bool)

(assert (=> b!65268 (= res!35514 (valid!280 newMap!16))))

(declare-fun mapNonEmpty!3012 () Bool)

(declare-fun mapRes!3011 () Bool)

(declare-fun tp!8237 () Bool)

(assert (=> mapNonEmpty!3012 (= mapRes!3011 (and tp!8237 e!42745))))

(declare-fun mapKey!3012 () (_ BitVec 32))

(declare-fun mapValue!3011 () ValueCell!872)

(declare-fun mapRest!3012 () (Array (_ BitVec 32) ValueCell!872))

(assert (=> mapNonEmpty!3012 (= (arr!1805 (_values!2117 (v!2452 (underlying!238 thiss!992)))) (store mapRest!3012 mapKey!3012 mapValue!3011))))

(declare-fun b!65269 () Bool)

(declare-fun e!42754 () Bool)

(declare-fun e!42755 () Bool)

(assert (=> b!65269 (= e!42754 (and e!42755 mapRes!3011))))

(declare-fun condMapEmpty!3012 () Bool)

(declare-fun mapDefault!3012 () ValueCell!872)

(assert (=> b!65269 (= condMapEmpty!3012 (= (arr!1805 (_values!2117 (v!2452 (underlying!238 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!872)) mapDefault!3012)))))

(declare-fun b!65270 () Bool)

(declare-fun Unit!1796 () Unit!1793)

(assert (=> b!65270 (= e!42744 Unit!1796)))

(declare-fun lt!27931 () Unit!1793)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!39 (array!3779 array!3781 (_ BitVec 32) (_ BitVec 32) V!2889 V!2889 (_ BitVec 64) (_ BitVec 32) Int) Unit!1793)

(assert (=> b!65270 (= lt!27931 (lemmaListMapContainsThenArrayContainsFrom!39 (_keys!3773 (v!2452 (underlying!238 thiss!992))) (_values!2117 (v!2452 (underlying!238 thiss!992))) (mask!6061 (v!2452 (underlying!238 thiss!992))) (extraKeys!2005 (v!2452 (underlying!238 thiss!992))) (zeroValue!2042 (v!2452 (underlying!238 thiss!992))) (minValue!2042 (v!2452 (underlying!238 thiss!992))) (select (arr!1804 (_keys!3773 (v!2452 (underlying!238 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2134 (v!2452 (underlying!238 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!65270 (arrayContainsKey!0 (_keys!3773 (v!2452 (underlying!238 thiss!992))) (select (arr!1804 (_keys!3773 (v!2452 (underlying!238 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!27934 () Unit!1793)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3779 (_ BitVec 32) (_ BitVec 32)) Unit!1793)

(assert (=> b!65270 (= lt!27934 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3773 (v!2452 (underlying!238 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1458 0))(
  ( (Nil!1455) (Cons!1454 (h!2038 (_ BitVec 64)) (t!4895 List!1458)) )
))
(declare-fun arrayNoDuplicates!0 (array!3779 (_ BitVec 32) List!1458) Bool)

(assert (=> b!65270 (arrayNoDuplicates!0 (_keys!3773 (v!2452 (underlying!238 thiss!992))) from!355 Nil!1455)))

(declare-fun lt!27933 () Unit!1793)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3779 (_ BitVec 32) (_ BitVec 64) List!1458) Unit!1793)

(assert (=> b!65270 (= lt!27933 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3773 (v!2452 (underlying!238 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1804 (_keys!3773 (v!2452 (underlying!238 thiss!992)))) from!355) (Cons!1454 (select (arr!1804 (_keys!3773 (v!2452 (underlying!238 thiss!992)))) from!355) Nil!1455)))))

(assert (=> b!65270 false))

(declare-fun b!65271 () Bool)

(assert (=> b!65271 (= e!42755 tp_is_empty!2431)))

(declare-fun b!65272 () Bool)

(declare-fun res!35509 () Bool)

(assert (=> b!65272 (=> (not res!35509) (not e!42753))))

(assert (=> b!65272 (= res!35509 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2040 (_keys!3773 (v!2452 (underlying!238 thiss!992)))))))))

(assert (=> b!65273 (= e!42750 (and tp!8238 tp_is_empty!2431 (array_inv!1125 (_keys!3773 (v!2452 (underlying!238 thiss!992)))) (array_inv!1126 (_values!2117 (v!2452 (underlying!238 thiss!992)))) e!42754))))

(declare-fun b!65274 () Bool)

(declare-fun res!35506 () Bool)

(assert (=> b!65274 (=> (not res!35506) (not e!42748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3779 (_ BitVec 32)) Bool)

(assert (=> b!65274 (= res!35506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3773 (v!2452 (underlying!238 thiss!992))) (mask!6061 (v!2452 (underlying!238 thiss!992)))))))

(declare-fun b!65275 () Bool)

(assert (=> b!65275 (= e!42749 e!42752)))

(declare-fun b!65276 () Bool)

(assert (=> b!65276 (= e!42756 (and e!42746 mapRes!3012))))

(declare-fun condMapEmpty!3011 () Bool)

(declare-fun mapDefault!3011 () ValueCell!872)

(assert (=> b!65276 (= condMapEmpty!3011 (= (arr!1805 (_values!2117 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!872)) mapDefault!3011)))))

(declare-fun b!65277 () Bool)

(declare-fun res!35508 () Bool)

(assert (=> b!65277 (=> (not res!35508) (not e!42748))))

(assert (=> b!65277 (= res!35508 (arrayNoDuplicates!0 (_keys!3773 (v!2452 (underlying!238 thiss!992))) #b00000000000000000000000000000000 Nil!1455))))

(declare-fun mapIsEmpty!3012 () Bool)

(assert (=> mapIsEmpty!3012 mapRes!3011))

(declare-fun b!65278 () Bool)

(assert (=> b!65278 (= e!42747 tp_is_empty!2431)))

(declare-fun b!65279 () Bool)

(declare-fun res!35507 () Bool)

(assert (=> b!65279 (=> (not res!35507) (not e!42748))))

(assert (=> b!65279 (= res!35507 (and (= (size!2041 (_values!2117 (v!2452 (underlying!238 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6061 (v!2452 (underlying!238 thiss!992))))) (= (size!2040 (_keys!3773 (v!2452 (underlying!238 thiss!992)))) (size!2041 (_values!2117 (v!2452 (underlying!238 thiss!992))))) (bvsge (mask!6061 (v!2452 (underlying!238 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2005 (v!2452 (underlying!238 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2005 (v!2452 (underlying!238 thiss!992))) #b00000000000000000000000000000011)))))

(assert (= (and start!9210 res!35505) b!65272))

(assert (= (and b!65272 res!35509) b!65268))

(assert (= (and b!65268 res!35514) b!65260))

(assert (= (and b!65260 res!35511) b!65259))

(assert (= (and b!65259 res!35510) b!65266))

(assert (= (and b!65266 c!8970) b!65270))

(assert (= (and b!65266 (not c!8970)) b!65262))

(assert (= (and b!65266 res!35512) b!65261))

(assert (= (and b!65261 res!35513) b!65279))

(assert (= (and b!65279 res!35507) b!65274))

(assert (= (and b!65274 res!35506) b!65277))

(assert (= (and b!65277 res!35508) b!65264))

(assert (= (and b!65269 condMapEmpty!3012) mapIsEmpty!3012))

(assert (= (and b!65269 (not condMapEmpty!3012)) mapNonEmpty!3012))

(get-info :version)

(assert (= (and mapNonEmpty!3012 ((_ is ValueCellFull!872) mapValue!3011)) b!65265))

(assert (= (and b!65269 ((_ is ValueCellFull!872) mapDefault!3012)) b!65271))

(assert (= b!65273 b!65269))

(assert (= b!65258 b!65273))

(assert (= b!65275 b!65258))

(assert (= start!9210 b!65275))

(assert (= (and b!65276 condMapEmpty!3011) mapIsEmpty!3011))

(assert (= (and b!65276 (not condMapEmpty!3011)) mapNonEmpty!3011))

(assert (= (and mapNonEmpty!3011 ((_ is ValueCellFull!872) mapValue!3012)) b!65278))

(assert (= (and b!65276 ((_ is ValueCellFull!872) mapDefault!3011)) b!65263))

(assert (= b!65267 b!65276))

(assert (= start!9210 b!65267))

(declare-fun b_lambda!2919 () Bool)

(assert (=> (not b_lambda!2919) (not b!65266)))

(declare-fun t!4891 () Bool)

(declare-fun tb!1413 () Bool)

(assert (=> (and b!65273 (= (defaultEntry!2134 (v!2452 (underlying!238 thiss!992))) (defaultEntry!2134 (v!2452 (underlying!238 thiss!992)))) t!4891) tb!1413))

(declare-fun result!2511 () Bool)

(assert (=> tb!1413 (= result!2511 tp_is_empty!2431)))

(assert (=> b!65266 t!4891))

(declare-fun b_and!3989 () Bool)

(assert (= b_and!3985 (and (=> t!4891 result!2511) b_and!3989)))

(declare-fun tb!1415 () Bool)

(declare-fun t!4893 () Bool)

(assert (=> (and b!65267 (= (defaultEntry!2134 newMap!16) (defaultEntry!2134 (v!2452 (underlying!238 thiss!992)))) t!4893) tb!1415))

(declare-fun result!2515 () Bool)

(assert (= result!2515 result!2511))

(assert (=> b!65266 t!4893))

(declare-fun b_and!3991 () Bool)

(assert (= b_and!3987 (and (=> t!4893 result!2515) b_and!3991)))

(declare-fun m!59759 () Bool)

(assert (=> b!65267 m!59759))

(declare-fun m!59761 () Bool)

(assert (=> b!65267 m!59761))

(declare-fun m!59763 () Bool)

(assert (=> start!9210 m!59763))

(declare-fun m!59765 () Bool)

(assert (=> b!65261 m!59765))

(declare-fun m!59767 () Bool)

(assert (=> b!65273 m!59767))

(declare-fun m!59769 () Bool)

(assert (=> b!65273 m!59769))

(declare-fun m!59771 () Bool)

(assert (=> b!65274 m!59771))

(declare-fun m!59773 () Bool)

(assert (=> mapNonEmpty!3011 m!59773))

(declare-fun m!59775 () Bool)

(assert (=> b!65268 m!59775))

(declare-fun m!59777 () Bool)

(assert (=> b!65259 m!59777))

(declare-fun m!59779 () Bool)

(assert (=> b!65259 m!59779))

(declare-fun m!59781 () Bool)

(assert (=> b!65259 m!59781))

(declare-fun m!59783 () Bool)

(assert (=> b!65270 m!59783))

(declare-fun m!59785 () Bool)

(assert (=> b!65270 m!59785))

(assert (=> b!65270 m!59777))

(declare-fun m!59787 () Bool)

(assert (=> b!65270 m!59787))

(assert (=> b!65270 m!59777))

(assert (=> b!65270 m!59777))

(declare-fun m!59789 () Bool)

(assert (=> b!65270 m!59789))

(assert (=> b!65270 m!59777))

(declare-fun m!59791 () Bool)

(assert (=> b!65270 m!59791))

(declare-fun m!59793 () Bool)

(assert (=> b!65266 m!59793))

(declare-fun m!59795 () Bool)

(assert (=> b!65266 m!59795))

(declare-fun m!59797 () Bool)

(assert (=> b!65266 m!59797))

(assert (=> b!65266 m!59777))

(declare-fun m!59799 () Bool)

(assert (=> b!65266 m!59799))

(assert (=> b!65266 m!59777))

(assert (=> b!65266 m!59795))

(assert (=> b!65266 m!59777))

(assert (=> b!65266 m!59797))

(declare-fun m!59801 () Bool)

(assert (=> b!65266 m!59801))

(assert (=> b!65266 m!59793))

(declare-fun m!59803 () Bool)

(assert (=> mapNonEmpty!3012 m!59803))

(declare-fun m!59805 () Bool)

(assert (=> b!65277 m!59805))

(check-sat (not b!65259) (not b!65273) (not b_next!2031) (not b_next!2029) b_and!3989 (not b!65277) b_and!3991 (not b!65266) (not mapNonEmpty!3012) (not mapNonEmpty!3011) (not b_lambda!2919) (not b!65274) (not b!65268) (not b!65261) (not b!65270) tp_is_empty!2431 (not b!65267) (not start!9210))
(check-sat b_and!3989 b_and!3991 (not b_next!2029) (not b_next!2031))
