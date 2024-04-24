; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9222 () Bool)

(assert start!9222)

(declare-fun b!65764 () Bool)

(declare-fun b_free!2053 () Bool)

(declare-fun b_next!2053 () Bool)

(assert (=> b!65764 (= b_free!2053 (not b_next!2053))))

(declare-fun tp!8308 () Bool)

(declare-fun b_and!4053 () Bool)

(assert (=> b!65764 (= tp!8308 b_and!4053)))

(declare-fun b!65759 () Bool)

(declare-fun b_free!2055 () Bool)

(declare-fun b_next!2055 () Bool)

(assert (=> b!65759 (= b_free!2055 (not b_next!2055))))

(declare-fun tp!8310 () Bool)

(declare-fun b_and!4055 () Bool)

(assert (=> b!65759 (= tp!8310 b_and!4055)))

(declare-fun b!65753 () Bool)

(declare-fun e!43125 () Bool)

(declare-fun e!43128 () Bool)

(assert (=> b!65753 (= e!43125 e!43128)))

(declare-fun res!35702 () Bool)

(assert (=> b!65753 (=> (not res!35702) (not e!43128))))

(declare-datatypes ((V!2905 0))(
  ( (V!2906 (val!1266 Int)) )
))
(declare-datatypes ((tuple2!2074 0))(
  ( (tuple2!2075 (_1!1048 (_ BitVec 64)) (_2!1048 V!2905)) )
))
(declare-datatypes ((List!1450 0))(
  ( (Nil!1447) (Cons!1446 (h!2030 tuple2!2074) (t!4912 List!1450)) )
))
(declare-datatypes ((ListLongMap!1375 0))(
  ( (ListLongMap!1376 (toList!703 List!1450)) )
))
(declare-fun lt!28199 () ListLongMap!1375)

(declare-fun lt!28202 () ListLongMap!1375)

(assert (=> b!65753 (= res!35702 (= lt!28199 lt!28202))))

(declare-datatypes ((array!3809 0))(
  ( (array!3810 (arr!1820 (Array (_ BitVec 32) (_ BitVec 64))) (size!2055 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!878 0))(
  ( (ValueCellFull!878 (v!2470 V!2905)) (EmptyCell!878) )
))
(declare-datatypes ((array!3811 0))(
  ( (array!3812 (arr!1821 (Array (_ BitVec 32) ValueCell!878)) (size!2056 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!664 0))(
  ( (LongMapFixedSize!665 (defaultEntry!2140 Int) (mask!6072 (_ BitVec 32)) (extraKeys!2011 (_ BitVec 32)) (zeroValue!2048 V!2905) (minValue!2048 V!2905) (_size!381 (_ BitVec 32)) (_keys!3780 array!3809) (_values!2123 array!3811) (_vacant!381 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!664)

(declare-fun map!1137 (LongMapFixedSize!664) ListLongMap!1375)

(assert (=> b!65753 (= lt!28202 (map!1137 newMap!16))))

(declare-datatypes ((Cell!474 0))(
  ( (Cell!475 (v!2471 LongMapFixedSize!664)) )
))
(declare-datatypes ((LongMap!474 0))(
  ( (LongMap!475 (underlying!248 Cell!474)) )
))
(declare-fun thiss!992 () LongMap!474)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!401 (array!3809 array!3811 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 32) Int) ListLongMap!1375)

(assert (=> b!65753 (= lt!28199 (getCurrentListMap!401 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))))))

(declare-fun b!65754 () Bool)

(declare-datatypes ((Unit!1812 0))(
  ( (Unit!1813) )
))
(declare-fun e!43122 () Unit!1812)

(declare-fun Unit!1814 () Unit!1812)

(assert (=> b!65754 (= e!43122 Unit!1814)))

(declare-fun b!65755 () Bool)

(declare-fun e!43117 () Bool)

(declare-fun e!43123 () Bool)

(declare-fun mapRes!3048 () Bool)

(assert (=> b!65755 (= e!43117 (and e!43123 mapRes!3048))))

(declare-fun condMapEmpty!3047 () Bool)

(declare-fun mapDefault!3047 () ValueCell!878)

(assert (=> b!65755 (= condMapEmpty!3047 (= (arr!1821 (_values!2123 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!878)) mapDefault!3047)))))

(declare-fun b!65756 () Bool)

(declare-fun tp_is_empty!2443 () Bool)

(assert (=> b!65756 (= e!43123 tp_is_empty!2443)))

(declare-fun b!65757 () Bool)

(declare-fun e!43127 () Bool)

(assert (=> b!65757 (= e!43127 tp_is_empty!2443)))

(declare-fun b!65758 () Bool)

(declare-fun res!35706 () Bool)

(assert (=> b!65758 (=> (not res!35706) (not e!43125))))

(declare-fun valid!286 (LongMapFixedSize!664) Bool)

(assert (=> b!65758 (= res!35706 (valid!286 newMap!16))))

(declare-fun e!43121 () Bool)

(declare-fun array_inv!1117 (array!3809) Bool)

(declare-fun array_inv!1118 (array!3811) Bool)

(assert (=> b!65759 (= e!43121 (and tp!8310 tp_is_empty!2443 (array_inv!1117 (_keys!3780 newMap!16)) (array_inv!1118 (_values!2123 newMap!16)) e!43117))))

(declare-fun b!65760 () Bool)

(declare-fun e!43129 () Bool)

(assert (=> b!65760 (= e!43128 e!43129)))

(declare-fun res!35703 () Bool)

(assert (=> b!65760 (=> (not res!35703) (not e!43129))))

(assert (=> b!65760 (= res!35703 (and (not (= (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!28198 () V!2905)

(declare-fun get!1117 (ValueCell!878 V!2905) V!2905)

(declare-fun dynLambda!318 (Int (_ BitVec 64)) V!2905)

(assert (=> b!65760 (= lt!28198 (get!1117 (select (arr!1821 (_values!2123 (v!2471 (underlying!248 thiss!992)))) from!355) (dynLambda!318 (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!65761 () Bool)

(declare-fun res!35705 () Bool)

(assert (=> b!65761 (=> (not res!35705) (not e!43125))))

(assert (=> b!65761 (= res!35705 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6072 newMap!16)) (_size!381 (v!2471 (underlying!248 thiss!992)))))))

(declare-fun b!65762 () Bool)

(declare-fun e!43124 () Bool)

(declare-fun e!43115 () Bool)

(assert (=> b!65762 (= e!43124 e!43115)))

(declare-fun b!65763 () Bool)

(declare-fun Unit!1815 () Unit!1812)

(assert (=> b!65763 (= e!43122 Unit!1815)))

(declare-fun lt!28196 () Unit!1812)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!34 (array!3809 array!3811 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 64) (_ BitVec 32) Int) Unit!1812)

(assert (=> b!65763 (= lt!28196 (lemmaListMapContainsThenArrayContainsFrom!34 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!65763 (arrayContainsKey!0 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!28194 () Unit!1812)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3809 (_ BitVec 32) (_ BitVec 32)) Unit!1812)

(assert (=> b!65763 (= lt!28194 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3780 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1451 0))(
  ( (Nil!1448) (Cons!1447 (h!2031 (_ BitVec 64)) (t!4913 List!1451)) )
))
(declare-fun arrayNoDuplicates!0 (array!3809 (_ BitVec 32) List!1451) Bool)

(assert (=> b!65763 (arrayNoDuplicates!0 (_keys!3780 (v!2471 (underlying!248 thiss!992))) from!355 Nil!1448)))

(declare-fun lt!28205 () Unit!1812)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3809 (_ BitVec 32) (_ BitVec 64) List!1451) Unit!1812)

(assert (=> b!65763 (= lt!28205 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (Cons!1447 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) Nil!1448)))))

(assert (=> b!65763 false))

(declare-fun mapNonEmpty!3047 () Bool)

(declare-fun tp!8309 () Bool)

(declare-fun e!43118 () Bool)

(assert (=> mapNonEmpty!3047 (= mapRes!3048 (and tp!8309 e!43118))))

(declare-fun mapKey!3048 () (_ BitVec 32))

(declare-fun mapRest!3047 () (Array (_ BitVec 32) ValueCell!878))

(declare-fun mapValue!3048 () ValueCell!878)

(assert (=> mapNonEmpty!3047 (= (arr!1821 (_values!2123 newMap!16)) (store mapRest!3047 mapKey!3048 mapValue!3048))))

(declare-fun e!43116 () Bool)

(declare-fun e!43114 () Bool)

(assert (=> b!65764 (= e!43114 (and tp!8308 tp_is_empty!2443 (array_inv!1117 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (array_inv!1118 (_values!2123 (v!2471 (underlying!248 thiss!992)))) e!43116))))

(declare-fun b!65765 () Bool)

(assert (=> b!65765 (= e!43115 e!43114)))

(declare-fun b!65766 () Bool)

(declare-fun e!43113 () Bool)

(assert (=> b!65766 (= e!43113 tp_is_empty!2443)))

(declare-fun mapIsEmpty!3048 () Bool)

(declare-fun mapRes!3047 () Bool)

(assert (=> mapIsEmpty!3048 mapRes!3047))

(declare-fun mapNonEmpty!3048 () Bool)

(declare-fun tp!8307 () Bool)

(assert (=> mapNonEmpty!3048 (= mapRes!3047 (and tp!8307 e!43113))))

(declare-fun mapRest!3048 () (Array (_ BitVec 32) ValueCell!878))

(declare-fun mapValue!3047 () ValueCell!878)

(declare-fun mapKey!3047 () (_ BitVec 32))

(assert (=> mapNonEmpty!3048 (= (arr!1821 (_values!2123 (v!2471 (underlying!248 thiss!992)))) (store mapRest!3048 mapKey!3047 mapValue!3047))))

(declare-fun b!65767 () Bool)

(declare-fun e!43126 () Bool)

(assert (=> b!65767 (= e!43129 e!43126)))

(declare-fun res!35704 () Bool)

(assert (=> b!65767 (=> (not res!35704) (not e!43126))))

(declare-datatypes ((tuple2!2076 0))(
  ( (tuple2!2077 (_1!1049 Bool) (_2!1049 LongMapFixedSize!664)) )
))
(declare-fun lt!28197 () tuple2!2076)

(assert (=> b!65767 (= res!35704 (and (_1!1049 lt!28197) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!28203 () Unit!1812)

(assert (=> b!65767 (= lt!28203 e!43122)))

(declare-fun c!9023 () Bool)

(declare-fun contains!702 (ListLongMap!1375 (_ BitVec 64)) Bool)

(assert (=> b!65767 (= c!9023 (contains!702 lt!28202 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355)))))

(declare-fun update!100 (LongMapFixedSize!664 (_ BitVec 64) V!2905) tuple2!2076)

(assert (=> b!65767 (= lt!28197 (update!100 newMap!16 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) lt!28198))))

(declare-fun b!65768 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!65768 (= e!43126 (not (validMask!0 (mask!6072 (v!2471 (underlying!248 thiss!992))))))))

(declare-fun lt!28201 () ListLongMap!1375)

(declare-fun lt!28195 () tuple2!2074)

(declare-fun lt!28204 () tuple2!2074)

(declare-fun +!85 (ListLongMap!1375 tuple2!2074) ListLongMap!1375)

(assert (=> b!65768 (= (+!85 (+!85 lt!28201 lt!28195) lt!28204) (+!85 (+!85 lt!28201 lt!28204) lt!28195))))

(assert (=> b!65768 (= lt!28204 (tuple2!2075 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2471 (underlying!248 thiss!992)))))))

(assert (=> b!65768 (= lt!28195 (tuple2!2075 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) lt!28198))))

(declare-fun lt!28200 () Unit!1812)

(declare-fun addCommutativeForDiffKeys!5 (ListLongMap!1375 (_ BitVec 64) V!2905 (_ BitVec 64) V!2905) Unit!1812)

(assert (=> b!65768 (= lt!28200 (addCommutativeForDiffKeys!5 lt!28201 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) lt!28198 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2471 (underlying!248 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!50 (array!3809 array!3811 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 32) Int) ListLongMap!1375)

(assert (=> b!65768 (= lt!28201 (getCurrentListMapNoExtraKeys!50 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))))))

(declare-fun b!65769 () Bool)

(assert (=> b!65769 (= e!43116 (and e!43127 mapRes!3047))))

(declare-fun condMapEmpty!3048 () Bool)

(declare-fun mapDefault!3048 () ValueCell!878)

(assert (=> b!65769 (= condMapEmpty!3048 (= (arr!1821 (_values!2123 (v!2471 (underlying!248 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!878)) mapDefault!3048)))))

(declare-fun res!35707 () Bool)

(assert (=> start!9222 (=> (not res!35707) (not e!43125))))

(declare-fun valid!287 (LongMap!474) Bool)

(assert (=> start!9222 (= res!35707 (valid!287 thiss!992))))

(assert (=> start!9222 e!43125))

(assert (=> start!9222 e!43124))

(assert (=> start!9222 true))

(assert (=> start!9222 e!43121))

(declare-fun mapIsEmpty!3047 () Bool)

(assert (=> mapIsEmpty!3047 mapRes!3048))

(declare-fun b!65770 () Bool)

(assert (=> b!65770 (= e!43118 tp_is_empty!2443)))

(declare-fun b!65771 () Bool)

(declare-fun res!35708 () Bool)

(assert (=> b!65771 (=> (not res!35708) (not e!43125))))

(assert (=> b!65771 (= res!35708 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992)))))))))

(assert (= (and start!9222 res!35707) b!65771))

(assert (= (and b!65771 res!35708) b!65758))

(assert (= (and b!65758 res!35706) b!65761))

(assert (= (and b!65761 res!35705) b!65753))

(assert (= (and b!65753 res!35702) b!65760))

(assert (= (and b!65760 res!35703) b!65767))

(assert (= (and b!65767 c!9023) b!65763))

(assert (= (and b!65767 (not c!9023)) b!65754))

(assert (= (and b!65767 res!35704) b!65768))

(assert (= (and b!65769 condMapEmpty!3048) mapIsEmpty!3048))

(assert (= (and b!65769 (not condMapEmpty!3048)) mapNonEmpty!3048))

(get-info :version)

(assert (= (and mapNonEmpty!3048 ((_ is ValueCellFull!878) mapValue!3047)) b!65766))

(assert (= (and b!65769 ((_ is ValueCellFull!878) mapDefault!3048)) b!65757))

(assert (= b!65764 b!65769))

(assert (= b!65765 b!65764))

(assert (= b!65762 b!65765))

(assert (= start!9222 b!65762))

(assert (= (and b!65755 condMapEmpty!3047) mapIsEmpty!3047))

(assert (= (and b!65755 (not condMapEmpty!3047)) mapNonEmpty!3047))

(assert (= (and mapNonEmpty!3047 ((_ is ValueCellFull!878) mapValue!3048)) b!65770))

(assert (= (and b!65755 ((_ is ValueCellFull!878) mapDefault!3047)) b!65756))

(assert (= b!65759 b!65755))

(assert (= start!9222 b!65759))

(declare-fun b_lambda!2951 () Bool)

(assert (=> (not b_lambda!2951) (not b!65760)))

(declare-fun t!4909 () Bool)

(declare-fun tb!1437 () Bool)

(assert (=> (and b!65764 (= (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))) t!4909) tb!1437))

(declare-fun result!2547 () Bool)

(assert (=> tb!1437 (= result!2547 tp_is_empty!2443)))

(assert (=> b!65760 t!4909))

(declare-fun b_and!4057 () Bool)

(assert (= b_and!4053 (and (=> t!4909 result!2547) b_and!4057)))

(declare-fun t!4911 () Bool)

(declare-fun tb!1439 () Bool)

(assert (=> (and b!65759 (= (defaultEntry!2140 newMap!16) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))) t!4911) tb!1439))

(declare-fun result!2551 () Bool)

(assert (= result!2551 result!2547))

(assert (=> b!65760 t!4911))

(declare-fun b_and!4059 () Bool)

(assert (= b_and!4055 (and (=> t!4911 result!2551) b_and!4059)))

(declare-fun m!60431 () Bool)

(assert (=> start!9222 m!60431))

(declare-fun m!60433 () Bool)

(assert (=> b!65760 m!60433))

(declare-fun m!60435 () Bool)

(assert (=> b!65760 m!60435))

(declare-fun m!60437 () Bool)

(assert (=> b!65760 m!60437))

(assert (=> b!65760 m!60435))

(assert (=> b!65760 m!60437))

(declare-fun m!60439 () Bool)

(assert (=> b!65760 m!60439))

(declare-fun m!60441 () Bool)

(assert (=> mapNonEmpty!3048 m!60441))

(declare-fun m!60443 () Bool)

(assert (=> b!65759 m!60443))

(declare-fun m!60445 () Bool)

(assert (=> b!65759 m!60445))

(declare-fun m!60447 () Bool)

(assert (=> b!65758 m!60447))

(declare-fun m!60449 () Bool)

(assert (=> b!65768 m!60449))

(declare-fun m!60451 () Bool)

(assert (=> b!65768 m!60451))

(assert (=> b!65768 m!60449))

(declare-fun m!60453 () Bool)

(assert (=> b!65768 m!60453))

(assert (=> b!65768 m!60433))

(declare-fun m!60455 () Bool)

(assert (=> b!65768 m!60455))

(assert (=> b!65768 m!60433))

(declare-fun m!60457 () Bool)

(assert (=> b!65768 m!60457))

(assert (=> b!65768 m!60457))

(declare-fun m!60459 () Bool)

(assert (=> b!65768 m!60459))

(declare-fun m!60461 () Bool)

(assert (=> b!65768 m!60461))

(declare-fun m!60463 () Bool)

(assert (=> b!65764 m!60463))

(declare-fun m!60465 () Bool)

(assert (=> b!65764 m!60465))

(declare-fun m!60467 () Bool)

(assert (=> mapNonEmpty!3047 m!60467))

(assert (=> b!65767 m!60433))

(assert (=> b!65767 m!60433))

(declare-fun m!60469 () Bool)

(assert (=> b!65767 m!60469))

(assert (=> b!65767 m!60433))

(declare-fun m!60471 () Bool)

(assert (=> b!65767 m!60471))

(declare-fun m!60473 () Bool)

(assert (=> b!65753 m!60473))

(declare-fun m!60475 () Bool)

(assert (=> b!65753 m!60475))

(declare-fun m!60477 () Bool)

(assert (=> b!65763 m!60477))

(declare-fun m!60479 () Bool)

(assert (=> b!65763 m!60479))

(assert (=> b!65763 m!60433))

(declare-fun m!60481 () Bool)

(assert (=> b!65763 m!60481))

(assert (=> b!65763 m!60433))

(assert (=> b!65763 m!60433))

(declare-fun m!60483 () Bool)

(assert (=> b!65763 m!60483))

(assert (=> b!65763 m!60433))

(declare-fun m!60485 () Bool)

(assert (=> b!65763 m!60485))

(check-sat (not b_next!2055) (not b!65767) (not b!65759) b_and!4059 b_and!4057 (not start!9222) (not b!65764) (not b!65768) (not b!65753) (not b!65760) (not b_lambda!2951) tp_is_empty!2443 (not b!65758) (not b!65763) (not b_next!2053) (not mapNonEmpty!3047) (not mapNonEmpty!3048))
(check-sat b_and!4057 b_and!4059 (not b_next!2053) (not b_next!2055))
(get-model)

(declare-fun b_lambda!2957 () Bool)

(assert (= b_lambda!2951 (or (and b!65764 b_free!2053) (and b!65759 b_free!2055 (= (defaultEntry!2140 newMap!16) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))))) b_lambda!2957)))

(check-sat (not b!65760) (not b_next!2055) (not b!65767) (not b!65759) (not b_lambda!2957) b_and!4059 b_and!4057 (not start!9222) (not b!65764) (not b!65768) (not b!65753) tp_is_empty!2443 (not b!65758) (not b!65763) (not b_next!2053) (not mapNonEmpty!3047) (not mapNonEmpty!3048))
(check-sat b_and!4057 b_and!4059 (not b_next!2053) (not b_next!2055))
(get-model)

(declare-fun d!13695 () Bool)

(assert (=> d!13695 (= (valid!287 thiss!992) (valid!286 (v!2471 (underlying!248 thiss!992))))))

(declare-fun bs!2853 () Bool)

(assert (= bs!2853 d!13695))

(declare-fun m!60599 () Bool)

(assert (=> bs!2853 m!60599))

(assert (=> start!9222 d!13695))

(declare-fun d!13697 () Bool)

(declare-fun e!43234 () Bool)

(assert (=> d!13697 e!43234))

(declare-fun res!35755 () Bool)

(assert (=> d!13697 (=> (not res!35755) (not e!43234))))

(declare-fun lt!28287 () ListLongMap!1375)

(assert (=> d!13697 (= res!35755 (contains!702 lt!28287 (_1!1048 lt!28195)))))

(declare-fun lt!28289 () List!1450)

(assert (=> d!13697 (= lt!28287 (ListLongMap!1376 lt!28289))))

(declare-fun lt!28286 () Unit!1812)

(declare-fun lt!28288 () Unit!1812)

(assert (=> d!13697 (= lt!28286 lt!28288)))

(declare-datatypes ((Option!136 0))(
  ( (Some!135 (v!2476 V!2905)) (None!134) )
))
(declare-fun getValueByKey!130 (List!1450 (_ BitVec 64)) Option!136)

(assert (=> d!13697 (= (getValueByKey!130 lt!28289 (_1!1048 lt!28195)) (Some!135 (_2!1048 lt!28195)))))

(declare-fun lemmaContainsTupThenGetReturnValue!47 (List!1450 (_ BitVec 64) V!2905) Unit!1812)

(assert (=> d!13697 (= lt!28288 (lemmaContainsTupThenGetReturnValue!47 lt!28289 (_1!1048 lt!28195) (_2!1048 lt!28195)))))

(declare-fun insertStrictlySorted!50 (List!1450 (_ BitVec 64) V!2905) List!1450)

(assert (=> d!13697 (= lt!28289 (insertStrictlySorted!50 (toList!703 lt!28201) (_1!1048 lt!28195) (_2!1048 lt!28195)))))

(assert (=> d!13697 (= (+!85 lt!28201 lt!28195) lt!28287)))

(declare-fun b!65896 () Bool)

(declare-fun res!35756 () Bool)

(assert (=> b!65896 (=> (not res!35756) (not e!43234))))

(assert (=> b!65896 (= res!35756 (= (getValueByKey!130 (toList!703 lt!28287) (_1!1048 lt!28195)) (Some!135 (_2!1048 lt!28195))))))

(declare-fun b!65897 () Bool)

(declare-fun contains!703 (List!1450 tuple2!2074) Bool)

(assert (=> b!65897 (= e!43234 (contains!703 (toList!703 lt!28287) lt!28195))))

(assert (= (and d!13697 res!35755) b!65896))

(assert (= (and b!65896 res!35756) b!65897))

(declare-fun m!60601 () Bool)

(assert (=> d!13697 m!60601))

(declare-fun m!60603 () Bool)

(assert (=> d!13697 m!60603))

(declare-fun m!60605 () Bool)

(assert (=> d!13697 m!60605))

(declare-fun m!60607 () Bool)

(assert (=> d!13697 m!60607))

(declare-fun m!60609 () Bool)

(assert (=> b!65896 m!60609))

(declare-fun m!60611 () Bool)

(assert (=> b!65897 m!60611))

(assert (=> b!65768 d!13697))

(declare-fun d!13699 () Bool)

(declare-fun e!43255 () Bool)

(assert (=> d!13699 e!43255))

(declare-fun res!35768 () Bool)

(assert (=> d!13699 (=> (not res!35768) (not e!43255))))

(declare-fun lt!28307 () ListLongMap!1375)

(assert (=> d!13699 (= res!35768 (not (contains!702 lt!28307 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!43251 () ListLongMap!1375)

(assert (=> d!13699 (= lt!28307 e!43251)))

(declare-fun c!9039 () Bool)

(assert (=> d!13699 (= c!9039 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992))))))))

(assert (=> d!13699 (validMask!0 (mask!6072 (v!2471 (underlying!248 thiss!992))))))

(assert (=> d!13699 (= (getCurrentListMapNoExtraKeys!50 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))) lt!28307)))

(declare-fun b!65922 () Bool)

(declare-fun res!35765 () Bool)

(assert (=> b!65922 (=> (not res!35765) (not e!43255))))

(assert (=> b!65922 (= res!35765 (not (contains!702 lt!28307 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!65923 () Bool)

(declare-fun e!43253 () Bool)

(declare-fun e!43252 () Bool)

(assert (=> b!65923 (= e!43253 e!43252)))

(declare-fun c!9040 () Bool)

(assert (=> b!65923 (= c!9040 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992))))))))

(declare-fun b!65924 () Bool)

(declare-fun e!43254 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!65924 (= e!43254 (validKeyInArray!0 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!65924 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!65925 () Bool)

(assert (=> b!65925 (= e!43251 (ListLongMap!1376 Nil!1447))))

(declare-fun b!65926 () Bool)

(declare-fun e!43250 () Bool)

(assert (=> b!65926 (= e!43253 e!43250)))

(assert (=> b!65926 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992))))))))

(declare-fun res!35766 () Bool)

(assert (=> b!65926 (= res!35766 (contains!702 lt!28307 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!65926 (=> (not res!35766) (not e!43250))))

(declare-fun b!65927 () Bool)

(declare-fun e!43249 () ListLongMap!1375)

(declare-fun call!5358 () ListLongMap!1375)

(assert (=> b!65927 (= e!43249 call!5358)))

(declare-fun b!65928 () Bool)

(assert (=> b!65928 (= e!43255 e!43253)))

(declare-fun c!9041 () Bool)

(assert (=> b!65928 (= c!9041 e!43254)))

(declare-fun res!35767 () Bool)

(assert (=> b!65928 (=> (not res!35767) (not e!43254))))

(assert (=> b!65928 (= res!35767 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992))))))))

(declare-fun b!65929 () Bool)

(declare-fun lt!28309 () Unit!1812)

(declare-fun lt!28305 () Unit!1812)

(assert (=> b!65929 (= lt!28309 lt!28305)))

(declare-fun lt!28308 () V!2905)

(declare-fun lt!28306 () ListLongMap!1375)

(declare-fun lt!28310 () (_ BitVec 64))

(declare-fun lt!28304 () (_ BitVec 64))

(assert (=> b!65929 (not (contains!702 (+!85 lt!28306 (tuple2!2075 lt!28310 lt!28308)) lt!28304))))

(declare-fun addStillNotContains!22 (ListLongMap!1375 (_ BitVec 64) V!2905 (_ BitVec 64)) Unit!1812)

(assert (=> b!65929 (= lt!28305 (addStillNotContains!22 lt!28306 lt!28310 lt!28308 lt!28304))))

(assert (=> b!65929 (= lt!28304 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!65929 (= lt!28308 (get!1117 (select (arr!1821 (_values!2123 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!318 (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65929 (= lt!28310 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!65929 (= lt!28306 call!5358)))

(assert (=> b!65929 (= e!43249 (+!85 call!5358 (tuple2!2075 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1117 (select (arr!1821 (_values!2123 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!318 (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!65930 () Bool)

(assert (=> b!65930 (= e!43251 e!43249)))

(declare-fun c!9038 () Bool)

(assert (=> b!65930 (= c!9038 (validKeyInArray!0 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!5355 () Bool)

(assert (=> bm!5355 (= call!5358 (getCurrentListMapNoExtraKeys!50 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))))))

(declare-fun b!65931 () Bool)

(assert (=> b!65931 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992))))))))

(assert (=> b!65931 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2056 (_values!2123 (v!2471 (underlying!248 thiss!992))))))))

(declare-fun apply!71 (ListLongMap!1375 (_ BitVec 64)) V!2905)

(assert (=> b!65931 (= e!43250 (= (apply!71 lt!28307 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1117 (select (arr!1821 (_values!2123 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!318 (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!65932 () Bool)

(assert (=> b!65932 (= e!43252 (= lt!28307 (getCurrentListMapNoExtraKeys!50 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))))))))

(declare-fun b!65933 () Bool)

(declare-fun isEmpty!312 (ListLongMap!1375) Bool)

(assert (=> b!65933 (= e!43252 (isEmpty!312 lt!28307))))

(assert (= (and d!13699 c!9039) b!65925))

(assert (= (and d!13699 (not c!9039)) b!65930))

(assert (= (and b!65930 c!9038) b!65929))

(assert (= (and b!65930 (not c!9038)) b!65927))

(assert (= (or b!65929 b!65927) bm!5355))

(assert (= (and d!13699 res!35768) b!65922))

(assert (= (and b!65922 res!35765) b!65928))

(assert (= (and b!65928 res!35767) b!65924))

(assert (= (and b!65928 c!9041) b!65926))

(assert (= (and b!65928 (not c!9041)) b!65923))

(assert (= (and b!65926 res!35766) b!65931))

(assert (= (and b!65923 c!9040) b!65932))

(assert (= (and b!65923 (not c!9040)) b!65933))

(declare-fun b_lambda!2959 () Bool)

(assert (=> (not b_lambda!2959) (not b!65929)))

(assert (=> b!65929 t!4909))

(declare-fun b_and!4077 () Bool)

(assert (= b_and!4057 (and (=> t!4909 result!2547) b_and!4077)))

(assert (=> b!65929 t!4911))

(declare-fun b_and!4079 () Bool)

(assert (= b_and!4059 (and (=> t!4911 result!2551) b_and!4079)))

(declare-fun b_lambda!2961 () Bool)

(assert (=> (not b_lambda!2961) (not b!65931)))

(assert (=> b!65931 t!4909))

(declare-fun b_and!4081 () Bool)

(assert (= b_and!4077 (and (=> t!4909 result!2547) b_and!4081)))

(assert (=> b!65931 t!4911))

(declare-fun b_and!4083 () Bool)

(assert (= b_and!4079 (and (=> t!4911 result!2551) b_and!4083)))

(declare-fun m!60613 () Bool)

(assert (=> b!65932 m!60613))

(assert (=> bm!5355 m!60613))

(declare-fun m!60615 () Bool)

(assert (=> b!65931 m!60615))

(declare-fun m!60617 () Bool)

(assert (=> b!65931 m!60617))

(declare-fun m!60619 () Bool)

(assert (=> b!65931 m!60619))

(assert (=> b!65931 m!60437))

(assert (=> b!65931 m!60615))

(assert (=> b!65931 m!60437))

(declare-fun m!60621 () Bool)

(assert (=> b!65931 m!60621))

(assert (=> b!65931 m!60617))

(assert (=> b!65930 m!60617))

(assert (=> b!65930 m!60617))

(declare-fun m!60623 () Bool)

(assert (=> b!65930 m!60623))

(assert (=> b!65926 m!60617))

(assert (=> b!65926 m!60617))

(declare-fun m!60625 () Bool)

(assert (=> b!65926 m!60625))

(declare-fun m!60627 () Bool)

(assert (=> b!65933 m!60627))

(assert (=> b!65924 m!60617))

(assert (=> b!65924 m!60617))

(assert (=> b!65924 m!60623))

(declare-fun m!60629 () Bool)

(assert (=> b!65922 m!60629))

(declare-fun m!60631 () Bool)

(assert (=> d!13699 m!60631))

(assert (=> d!13699 m!60451))

(assert (=> b!65929 m!60615))

(declare-fun m!60633 () Bool)

(assert (=> b!65929 m!60633))

(declare-fun m!60635 () Bool)

(assert (=> b!65929 m!60635))

(assert (=> b!65929 m!60617))

(assert (=> b!65929 m!60633))

(assert (=> b!65929 m!60437))

(declare-fun m!60637 () Bool)

(assert (=> b!65929 m!60637))

(assert (=> b!65929 m!60615))

(assert (=> b!65929 m!60437))

(assert (=> b!65929 m!60621))

(declare-fun m!60639 () Bool)

(assert (=> b!65929 m!60639))

(assert (=> b!65768 d!13699))

(declare-fun d!13701 () Bool)

(declare-fun e!43256 () Bool)

(assert (=> d!13701 e!43256))

(declare-fun res!35769 () Bool)

(assert (=> d!13701 (=> (not res!35769) (not e!43256))))

(declare-fun lt!28312 () ListLongMap!1375)

(assert (=> d!13701 (= res!35769 (contains!702 lt!28312 (_1!1048 lt!28195)))))

(declare-fun lt!28314 () List!1450)

(assert (=> d!13701 (= lt!28312 (ListLongMap!1376 lt!28314))))

(declare-fun lt!28311 () Unit!1812)

(declare-fun lt!28313 () Unit!1812)

(assert (=> d!13701 (= lt!28311 lt!28313)))

(assert (=> d!13701 (= (getValueByKey!130 lt!28314 (_1!1048 lt!28195)) (Some!135 (_2!1048 lt!28195)))))

(assert (=> d!13701 (= lt!28313 (lemmaContainsTupThenGetReturnValue!47 lt!28314 (_1!1048 lt!28195) (_2!1048 lt!28195)))))

(assert (=> d!13701 (= lt!28314 (insertStrictlySorted!50 (toList!703 (+!85 lt!28201 lt!28204)) (_1!1048 lt!28195) (_2!1048 lt!28195)))))

(assert (=> d!13701 (= (+!85 (+!85 lt!28201 lt!28204) lt!28195) lt!28312)))

(declare-fun b!65934 () Bool)

(declare-fun res!35770 () Bool)

(assert (=> b!65934 (=> (not res!35770) (not e!43256))))

(assert (=> b!65934 (= res!35770 (= (getValueByKey!130 (toList!703 lt!28312) (_1!1048 lt!28195)) (Some!135 (_2!1048 lt!28195))))))

(declare-fun b!65935 () Bool)

(assert (=> b!65935 (= e!43256 (contains!703 (toList!703 lt!28312) lt!28195))))

(assert (= (and d!13701 res!35769) b!65934))

(assert (= (and b!65934 res!35770) b!65935))

(declare-fun m!60641 () Bool)

(assert (=> d!13701 m!60641))

(declare-fun m!60643 () Bool)

(assert (=> d!13701 m!60643))

(declare-fun m!60645 () Bool)

(assert (=> d!13701 m!60645))

(declare-fun m!60647 () Bool)

(assert (=> d!13701 m!60647))

(declare-fun m!60649 () Bool)

(assert (=> b!65934 m!60649))

(declare-fun m!60651 () Bool)

(assert (=> b!65935 m!60651))

(assert (=> b!65768 d!13701))

(declare-fun d!13703 () Bool)

(assert (=> d!13703 (= (+!85 (+!85 lt!28201 (tuple2!2075 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) lt!28198)) (tuple2!2075 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2471 (underlying!248 thiss!992))))) (+!85 (+!85 lt!28201 (tuple2!2075 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2471 (underlying!248 thiss!992))))) (tuple2!2075 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) lt!28198)))))

(declare-fun lt!28317 () Unit!1812)

(declare-fun choose!370 (ListLongMap!1375 (_ BitVec 64) V!2905 (_ BitVec 64) V!2905) Unit!1812)

(assert (=> d!13703 (= lt!28317 (choose!370 lt!28201 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) lt!28198 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2471 (underlying!248 thiss!992)))))))

(assert (=> d!13703 (not (= (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13703 (= (addCommutativeForDiffKeys!5 lt!28201 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) lt!28198 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2471 (underlying!248 thiss!992)))) lt!28317)))

(declare-fun bs!2854 () Bool)

(assert (= bs!2854 d!13703))

(declare-fun m!60653 () Bool)

(assert (=> bs!2854 m!60653))

(assert (=> bs!2854 m!60653))

(declare-fun m!60655 () Bool)

(assert (=> bs!2854 m!60655))

(declare-fun m!60657 () Bool)

(assert (=> bs!2854 m!60657))

(assert (=> bs!2854 m!60657))

(declare-fun m!60659 () Bool)

(assert (=> bs!2854 m!60659))

(assert (=> bs!2854 m!60433))

(declare-fun m!60661 () Bool)

(assert (=> bs!2854 m!60661))

(assert (=> b!65768 d!13703))

(declare-fun d!13705 () Bool)

(declare-fun e!43257 () Bool)

(assert (=> d!13705 e!43257))

(declare-fun res!35771 () Bool)

(assert (=> d!13705 (=> (not res!35771) (not e!43257))))

(declare-fun lt!28319 () ListLongMap!1375)

(assert (=> d!13705 (= res!35771 (contains!702 lt!28319 (_1!1048 lt!28204)))))

(declare-fun lt!28321 () List!1450)

(assert (=> d!13705 (= lt!28319 (ListLongMap!1376 lt!28321))))

(declare-fun lt!28318 () Unit!1812)

(declare-fun lt!28320 () Unit!1812)

(assert (=> d!13705 (= lt!28318 lt!28320)))

(assert (=> d!13705 (= (getValueByKey!130 lt!28321 (_1!1048 lt!28204)) (Some!135 (_2!1048 lt!28204)))))

(assert (=> d!13705 (= lt!28320 (lemmaContainsTupThenGetReturnValue!47 lt!28321 (_1!1048 lt!28204) (_2!1048 lt!28204)))))

(assert (=> d!13705 (= lt!28321 (insertStrictlySorted!50 (toList!703 lt!28201) (_1!1048 lt!28204) (_2!1048 lt!28204)))))

(assert (=> d!13705 (= (+!85 lt!28201 lt!28204) lt!28319)))

(declare-fun b!65936 () Bool)

(declare-fun res!35772 () Bool)

(assert (=> b!65936 (=> (not res!35772) (not e!43257))))

(assert (=> b!65936 (= res!35772 (= (getValueByKey!130 (toList!703 lt!28319) (_1!1048 lt!28204)) (Some!135 (_2!1048 lt!28204))))))

(declare-fun b!65937 () Bool)

(assert (=> b!65937 (= e!43257 (contains!703 (toList!703 lt!28319) lt!28204))))

(assert (= (and d!13705 res!35771) b!65936))

(assert (= (and b!65936 res!35772) b!65937))

(declare-fun m!60663 () Bool)

(assert (=> d!13705 m!60663))

(declare-fun m!60665 () Bool)

(assert (=> d!13705 m!60665))

(declare-fun m!60667 () Bool)

(assert (=> d!13705 m!60667))

(declare-fun m!60669 () Bool)

(assert (=> d!13705 m!60669))

(declare-fun m!60671 () Bool)

(assert (=> b!65936 m!60671))

(declare-fun m!60673 () Bool)

(assert (=> b!65937 m!60673))

(assert (=> b!65768 d!13705))

(declare-fun d!13707 () Bool)

(declare-fun e!43258 () Bool)

(assert (=> d!13707 e!43258))

(declare-fun res!35773 () Bool)

(assert (=> d!13707 (=> (not res!35773) (not e!43258))))

(declare-fun lt!28323 () ListLongMap!1375)

(assert (=> d!13707 (= res!35773 (contains!702 lt!28323 (_1!1048 lt!28204)))))

(declare-fun lt!28325 () List!1450)

(assert (=> d!13707 (= lt!28323 (ListLongMap!1376 lt!28325))))

(declare-fun lt!28322 () Unit!1812)

(declare-fun lt!28324 () Unit!1812)

(assert (=> d!13707 (= lt!28322 lt!28324)))

(assert (=> d!13707 (= (getValueByKey!130 lt!28325 (_1!1048 lt!28204)) (Some!135 (_2!1048 lt!28204)))))

(assert (=> d!13707 (= lt!28324 (lemmaContainsTupThenGetReturnValue!47 lt!28325 (_1!1048 lt!28204) (_2!1048 lt!28204)))))

(assert (=> d!13707 (= lt!28325 (insertStrictlySorted!50 (toList!703 (+!85 lt!28201 lt!28195)) (_1!1048 lt!28204) (_2!1048 lt!28204)))))

(assert (=> d!13707 (= (+!85 (+!85 lt!28201 lt!28195) lt!28204) lt!28323)))

(declare-fun b!65938 () Bool)

(declare-fun res!35774 () Bool)

(assert (=> b!65938 (=> (not res!35774) (not e!43258))))

(assert (=> b!65938 (= res!35774 (= (getValueByKey!130 (toList!703 lt!28323) (_1!1048 lt!28204)) (Some!135 (_2!1048 lt!28204))))))

(declare-fun b!65939 () Bool)

(assert (=> b!65939 (= e!43258 (contains!703 (toList!703 lt!28323) lt!28204))))

(assert (= (and d!13707 res!35773) b!65938))

(assert (= (and b!65938 res!35774) b!65939))

(declare-fun m!60675 () Bool)

(assert (=> d!13707 m!60675))

(declare-fun m!60677 () Bool)

(assert (=> d!13707 m!60677))

(declare-fun m!60679 () Bool)

(assert (=> d!13707 m!60679))

(declare-fun m!60681 () Bool)

(assert (=> d!13707 m!60681))

(declare-fun m!60683 () Bool)

(assert (=> b!65938 m!60683))

(declare-fun m!60685 () Bool)

(assert (=> b!65939 m!60685))

(assert (=> b!65768 d!13707))

(declare-fun d!13709 () Bool)

(assert (=> d!13709 (= (validMask!0 (mask!6072 (v!2471 (underlying!248 thiss!992)))) (and (or (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000001111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000011111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000001111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000011111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000001111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000011111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000000001111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000000011111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000000111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000001111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000011111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000000111111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000001111111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000011111111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000000111111111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000001111111111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000011111111111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000000111111111111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000001111111111111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000011111111111111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00000111111111111111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00001111111111111111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00011111111111111111111111111111) (= (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6072 (v!2471 (underlying!248 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!65768 d!13709))

(declare-fun d!13711 () Bool)

(assert (=> d!13711 (= (array_inv!1117 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvsge (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!65764 d!13711))

(declare-fun d!13713 () Bool)

(assert (=> d!13713 (= (array_inv!1118 (_values!2123 (v!2471 (underlying!248 thiss!992)))) (bvsge (size!2056 (_values!2123 (v!2471 (underlying!248 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!65764 d!13713))

(declare-fun d!13715 () Bool)

(declare-fun e!43263 () Bool)

(assert (=> d!13715 e!43263))

(declare-fun res!35777 () Bool)

(assert (=> d!13715 (=> res!35777 e!43263)))

(declare-fun lt!28337 () Bool)

(assert (=> d!13715 (= res!35777 (not lt!28337))))

(declare-fun lt!28336 () Bool)

(assert (=> d!13715 (= lt!28337 lt!28336)))

(declare-fun lt!28335 () Unit!1812)

(declare-fun e!43264 () Unit!1812)

(assert (=> d!13715 (= lt!28335 e!43264)))

(declare-fun c!9044 () Bool)

(assert (=> d!13715 (= c!9044 lt!28336)))

(declare-fun containsKey!133 (List!1450 (_ BitVec 64)) Bool)

(assert (=> d!13715 (= lt!28336 (containsKey!133 (toList!703 lt!28202) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355)))))

(assert (=> d!13715 (= (contains!702 lt!28202 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355)) lt!28337)))

(declare-fun b!65946 () Bool)

(declare-fun lt!28334 () Unit!1812)

(assert (=> b!65946 (= e!43264 lt!28334)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!81 (List!1450 (_ BitVec 64)) Unit!1812)

(assert (=> b!65946 (= lt!28334 (lemmaContainsKeyImpliesGetValueByKeyDefined!81 (toList!703 lt!28202) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355)))))

(declare-fun isDefined!82 (Option!136) Bool)

(assert (=> b!65946 (isDefined!82 (getValueByKey!130 (toList!703 lt!28202) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355)))))

(declare-fun b!65947 () Bool)

(declare-fun Unit!1820 () Unit!1812)

(assert (=> b!65947 (= e!43264 Unit!1820)))

(declare-fun b!65948 () Bool)

(assert (=> b!65948 (= e!43263 (isDefined!82 (getValueByKey!130 (toList!703 lt!28202) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355))))))

(assert (= (and d!13715 c!9044) b!65946))

(assert (= (and d!13715 (not c!9044)) b!65947))

(assert (= (and d!13715 (not res!35777)) b!65948))

(assert (=> d!13715 m!60433))

(declare-fun m!60687 () Bool)

(assert (=> d!13715 m!60687))

(assert (=> b!65946 m!60433))

(declare-fun m!60689 () Bool)

(assert (=> b!65946 m!60689))

(assert (=> b!65946 m!60433))

(declare-fun m!60691 () Bool)

(assert (=> b!65946 m!60691))

(assert (=> b!65946 m!60691))

(declare-fun m!60693 () Bool)

(assert (=> b!65946 m!60693))

(assert (=> b!65948 m!60433))

(assert (=> b!65948 m!60691))

(assert (=> b!65948 m!60691))

(assert (=> b!65948 m!60693))

(assert (=> b!65767 d!13715))

(declare-fun b!66033 () Bool)

(declare-fun e!43325 () tuple2!2076)

(declare-fun e!43315 () tuple2!2076)

(assert (=> b!66033 (= e!43325 e!43315)))

(declare-datatypes ((SeekEntryResult!226 0))(
  ( (MissingZero!226 (index!3032 (_ BitVec 32))) (Found!226 (index!3033 (_ BitVec 32))) (Intermediate!226 (undefined!1038 Bool) (index!3034 (_ BitVec 32)) (x!10655 (_ BitVec 32))) (Undefined!226) (MissingVacant!226 (index!3035 (_ BitVec 32))) )
))
(declare-fun lt!28394 () SeekEntryResult!226)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3809 (_ BitVec 32)) SeekEntryResult!226)

(assert (=> b!66033 (= lt!28394 (seekEntryOrOpen!0 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (_keys!3780 newMap!16) (mask!6072 newMap!16)))))

(declare-fun c!9076 () Bool)

(assert (=> b!66033 (= c!9076 ((_ is Undefined!226) lt!28394))))

(declare-fun b!66034 () Bool)

(declare-fun e!43313 () Bool)

(declare-fun call!5411 () Bool)

(assert (=> b!66034 (= e!43313 (not call!5411))))

(declare-fun b!66035 () Bool)

(declare-fun res!35806 () Bool)

(assert (=> b!66035 (=> (not res!35806) (not e!43313))))

(declare-fun lt!28412 () SeekEntryResult!226)

(assert (=> b!66035 (= res!35806 (= (select (arr!1820 (_keys!3780 newMap!16)) (index!3032 lt!28412)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!66036 () Bool)

(declare-fun e!43322 () Unit!1812)

(declare-fun Unit!1821 () Unit!1812)

(assert (=> b!66036 (= e!43322 Unit!1821)))

(declare-fun lt!28413 () Unit!1812)

(declare-fun call!5418 () Unit!1812)

(assert (=> b!66036 (= lt!28413 call!5418)))

(declare-fun call!5420 () SeekEntryResult!226)

(assert (=> b!66036 (= lt!28412 call!5420)))

(declare-fun c!9084 () Bool)

(assert (=> b!66036 (= c!9084 ((_ is MissingZero!226) lt!28412))))

(declare-fun e!43312 () Bool)

(assert (=> b!66036 e!43312))

(declare-fun lt!28406 () Unit!1812)

(assert (=> b!66036 (= lt!28406 lt!28413)))

(assert (=> b!66036 false))

(declare-fun b!66037 () Bool)

(declare-fun res!35819 () Bool)

(declare-fun e!43321 () Bool)

(assert (=> b!66037 (=> (not res!35819) (not e!43321))))

(declare-fun call!5426 () Bool)

(assert (=> b!66037 (= res!35819 call!5426)))

(declare-fun e!43309 () Bool)

(assert (=> b!66037 (= e!43309 e!43321)))

(declare-fun b!66038 () Bool)

(declare-fun e!43327 () Bool)

(declare-fun call!5428 () Bool)

(assert (=> b!66038 (= e!43327 (not call!5428))))

(declare-fun b!66039 () Bool)

(declare-fun res!35813 () Bool)

(declare-fun call!5407 () Bool)

(assert (=> b!66039 (= res!35813 call!5407)))

(declare-fun e!43324 () Bool)

(assert (=> b!66039 (=> (not res!35813) (not e!43324))))

(declare-fun b!66040 () Bool)

(declare-fun c!9074 () Bool)

(assert (=> b!66040 (= c!9074 ((_ is MissingVacant!226) lt!28394))))

(declare-fun e!43314 () tuple2!2076)

(assert (=> b!66040 (= e!43315 e!43314)))

(declare-fun d!13717 () Bool)

(declare-fun e!43320 () Bool)

(assert (=> d!13717 e!43320))

(declare-fun res!35810 () Bool)

(assert (=> d!13717 (=> (not res!35810) (not e!43320))))

(declare-fun lt!28400 () tuple2!2076)

(assert (=> d!13717 (= res!35810 (valid!286 (_2!1049 lt!28400)))))

(assert (=> d!13717 (= lt!28400 e!43325)))

(declare-fun c!9082 () Bool)

(assert (=> d!13717 (= c!9082 (= (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (bvneg (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355))))))

(assert (=> d!13717 (valid!286 newMap!16)))

(assert (=> d!13717 (= (update!100 newMap!16 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) lt!28198) lt!28400)))

(declare-fun b!66041 () Bool)

(declare-fun e!43329 () Unit!1812)

(declare-fun lt!28397 () Unit!1812)

(assert (=> b!66041 (= e!43329 lt!28397)))

(assert (=> b!66041 (= lt!28397 call!5418)))

(declare-fun lt!28414 () SeekEntryResult!226)

(declare-fun call!5419 () SeekEntryResult!226)

(assert (=> b!66041 (= lt!28414 call!5419)))

(declare-fun c!9083 () Bool)

(assert (=> b!66041 (= c!9083 ((_ is MissingZero!226) lt!28414))))

(assert (=> b!66041 e!43309))

(declare-fun b!66042 () Bool)

(assert (=> b!66042 (= e!43321 (not call!5428))))

(declare-fun b!66043 () Bool)

(declare-fun lt!28409 () Unit!1812)

(declare-fun lt!28411 () Unit!1812)

(assert (=> b!66043 (= lt!28409 lt!28411)))

(declare-fun call!5423 () ListLongMap!1375)

(declare-fun call!5414 () ListLongMap!1375)

(assert (=> b!66043 (= call!5423 call!5414)))

(declare-fun lt!28405 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!20 (array!3809 array!3811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 V!2905 Int) Unit!1812)

(assert (=> b!66043 (= lt!28411 (lemmaChangeZeroKeyThenAddPairToListMap!20 (_keys!3780 newMap!16) (_values!2123 newMap!16) (mask!6072 newMap!16) (extraKeys!2011 newMap!16) lt!28405 (zeroValue!2048 newMap!16) lt!28198 (minValue!2048 newMap!16) (defaultEntry!2140 newMap!16)))))

(assert (=> b!66043 (= lt!28405 (bvor (extraKeys!2011 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!43311 () tuple2!2076)

(assert (=> b!66043 (= e!43311 (tuple2!2077 true (LongMapFixedSize!665 (defaultEntry!2140 newMap!16) (mask!6072 newMap!16) (bvor (extraKeys!2011 newMap!16) #b00000000000000000000000000000001) lt!28198 (minValue!2048 newMap!16) (_size!381 newMap!16) (_keys!3780 newMap!16) (_values!2123 newMap!16) (_vacant!381 newMap!16))))))

(declare-fun call!5422 () tuple2!2076)

(declare-fun bm!5404 () Bool)

(declare-fun updateHelperNewKey!20 (LongMapFixedSize!664 (_ BitVec 64) V!2905 (_ BitVec 32)) tuple2!2076)

(assert (=> bm!5404 (= call!5422 (updateHelperNewKey!20 newMap!16 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) lt!28198 (ite c!9074 (index!3035 lt!28394) (index!3032 lt!28394))))))

(declare-fun bm!5405 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!20 (array!3809 array!3811 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 64) Int) Unit!1812)

(assert (=> bm!5405 (= call!5418 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!20 (_keys!3780 newMap!16) (_values!2123 newMap!16) (mask!6072 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (defaultEntry!2140 newMap!16)))))

(declare-fun b!66044 () Bool)

(declare-fun lt!28415 () SeekEntryResult!226)

(assert (=> b!66044 (= e!43324 (= (select (arr!1820 (_keys!3780 newMap!16)) (index!3033 lt!28415)) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355)))))

(declare-fun b!66045 () Bool)

(declare-fun e!43330 () Bool)

(declare-fun e!43328 () Bool)

(assert (=> b!66045 (= e!43330 e!43328)))

(declare-fun res!35808 () Bool)

(declare-fun call!5410 () Bool)

(assert (=> b!66045 (= res!35808 call!5410)))

(assert (=> b!66045 (=> (not res!35808) (not e!43328))))

(declare-fun b!66046 () Bool)

(declare-fun lt!28392 () Unit!1812)

(declare-fun lt!28401 () Unit!1812)

(assert (=> b!66046 (= lt!28392 lt!28401)))

(declare-fun call!5421 () Bool)

(assert (=> b!66046 call!5421))

(declare-fun lt!28402 () array!3811)

(declare-fun lemmaValidKeyInArrayIsInListMap!80 (array!3809 array!3811 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 32) Int) Unit!1812)

(assert (=> b!66046 (= lt!28401 (lemmaValidKeyInArrayIsInListMap!80 (_keys!3780 newMap!16) lt!28402 (mask!6072 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) (index!3033 lt!28394) (defaultEntry!2140 newMap!16)))))

(assert (=> b!66046 (= lt!28402 (array!3812 (store (arr!1821 (_values!2123 newMap!16)) (index!3033 lt!28394) (ValueCellFull!878 lt!28198)) (size!2056 (_values!2123 newMap!16))))))

(declare-fun lt!28396 () Unit!1812)

(declare-fun lt!28395 () Unit!1812)

(assert (=> b!66046 (= lt!28396 lt!28395)))

(declare-fun call!5427 () ListLongMap!1375)

(declare-fun call!5429 () ListLongMap!1375)

(assert (=> b!66046 (= call!5427 call!5429)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!20 (array!3809 array!3811 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 32) (_ BitVec 64) V!2905 Int) Unit!1812)

(assert (=> b!66046 (= lt!28395 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!20 (_keys!3780 newMap!16) (_values!2123 newMap!16) (mask!6072 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) (index!3033 lt!28394) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) lt!28198 (defaultEntry!2140 newMap!16)))))

(declare-fun lt!28398 () Unit!1812)

(assert (=> b!66046 (= lt!28398 e!43322)))

(declare-fun c!9081 () Bool)

(assert (=> b!66046 (= c!9081 (contains!702 (getCurrentListMap!401 (_keys!3780 newMap!16) (_values!2123 newMap!16) (mask!6072 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2140 newMap!16)) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355)))))

(declare-fun e!43319 () tuple2!2076)

(assert (=> b!66046 (= e!43319 (tuple2!2077 true (LongMapFixedSize!665 (defaultEntry!2140 newMap!16) (mask!6072 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) (_size!381 newMap!16) (_keys!3780 newMap!16) (array!3812 (store (arr!1821 (_values!2123 newMap!16)) (index!3033 lt!28394) (ValueCellFull!878 lt!28198)) (size!2056 (_values!2123 newMap!16))) (_vacant!381 newMap!16))))))

(declare-fun bm!5406 () Bool)

(declare-fun call!5409 () ListLongMap!1375)

(assert (=> bm!5406 (= call!5414 call!5409)))

(declare-fun b!66047 () Bool)

(declare-fun c!9073 () Bool)

(assert (=> b!66047 (= c!9073 ((_ is MissingVacant!226) lt!28414))))

(declare-fun e!43317 () Bool)

(assert (=> b!66047 (= e!43309 e!43317)))

(declare-fun bm!5407 () Bool)

(declare-fun call!5430 () Bool)

(declare-fun lt!28393 () SeekEntryResult!226)

(declare-fun c!9086 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5407 (= call!5430 (inRange!0 (ite c!9076 (ite c!9086 (index!3033 lt!28393) (ite c!9083 (index!3032 lt!28414) (index!3035 lt!28414))) (ite c!9081 (index!3033 lt!28415) (ite c!9084 (index!3032 lt!28412) (index!3035 lt!28412)))) (mask!6072 newMap!16)))))

(declare-fun b!66048 () Bool)

(declare-fun res!35814 () Bool)

(assert (=> b!66048 (= res!35814 (= (select (arr!1820 (_keys!3780 newMap!16)) (index!3035 lt!28414)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!66048 (=> (not res!35814) (not e!43327))))

(declare-fun b!66049 () Bool)

(assert (=> b!66049 (= e!43328 (not call!5411))))

(declare-fun bm!5408 () Bool)

(declare-fun call!5416 () Bool)

(assert (=> bm!5408 (= call!5426 call!5416)))

(declare-fun b!66050 () Bool)

(declare-fun lt!28417 () Unit!1812)

(declare-fun lt!28418 () Unit!1812)

(assert (=> b!66050 (= lt!28417 lt!28418)))

(assert (=> b!66050 (= call!5423 call!5414)))

(declare-fun lt!28407 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!20 (array!3809 array!3811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 V!2905 Int) Unit!1812)

(assert (=> b!66050 (= lt!28418 (lemmaChangeLongMinValueKeyThenAddPairToListMap!20 (_keys!3780 newMap!16) (_values!2123 newMap!16) (mask!6072 newMap!16) (extraKeys!2011 newMap!16) lt!28407 (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) lt!28198 (defaultEntry!2140 newMap!16)))))

(assert (=> b!66050 (= lt!28407 (bvor (extraKeys!2011 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!66050 (= e!43311 (tuple2!2077 true (LongMapFixedSize!665 (defaultEntry!2140 newMap!16) (mask!6072 newMap!16) (bvor (extraKeys!2011 newMap!16) #b00000000000000000000000000000010) (zeroValue!2048 newMap!16) lt!28198 (_size!381 newMap!16) (_keys!3780 newMap!16) (_values!2123 newMap!16) (_vacant!381 newMap!16))))))

(declare-fun bm!5409 () Bool)

(assert (=> bm!5409 (= call!5429 call!5409)))

(declare-fun bm!5410 () Bool)

(assert (=> bm!5410 (= call!5423 call!5427)))

(declare-fun b!66051 () Bool)

(assert (=> b!66051 (= e!43314 e!43319)))

(declare-fun c!9075 () Bool)

(assert (=> b!66051 (= c!9075 ((_ is MissingZero!226) lt!28394))))

(declare-fun b!66052 () Bool)

(declare-fun e!43310 () Bool)

(declare-fun e!43318 () Bool)

(assert (=> b!66052 (= e!43310 e!43318)))

(declare-fun res!35817 () Bool)

(declare-fun call!5408 () ListLongMap!1375)

(assert (=> b!66052 (= res!35817 (contains!702 call!5408 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355)))))

(assert (=> b!66052 (=> (not res!35817) (not e!43318))))

(declare-fun b!66053 () Bool)

(assert (=> b!66053 (= e!43317 e!43327)))

(declare-fun res!35818 () Bool)

(assert (=> b!66053 (= res!35818 call!5426)))

(assert (=> b!66053 (=> (not res!35818) (not e!43327))))

(declare-fun b!66054 () Bool)

(declare-fun lt!28408 () tuple2!2076)

(assert (=> b!66054 (= lt!28408 call!5422)))

(assert (=> b!66054 (= e!43319 (tuple2!2077 (_1!1049 lt!28408) (_2!1049 lt!28408)))))

(declare-fun b!66055 () Bool)

(declare-fun res!35811 () Bool)

(assert (=> b!66055 (= res!35811 (= (select (arr!1820 (_keys!3780 newMap!16)) (index!3035 lt!28412)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!66055 (=> (not res!35811) (not e!43328))))

(declare-fun b!66056 () Bool)

(declare-fun res!35809 () Bool)

(assert (=> b!66056 (= res!35809 call!5416)))

(declare-fun e!43323 () Bool)

(assert (=> b!66056 (=> (not res!35809) (not e!43323))))

(declare-fun b!66057 () Bool)

(declare-fun c!9079 () Bool)

(assert (=> b!66057 (= c!9079 ((_ is MissingVacant!226) lt!28412))))

(assert (=> b!66057 (= e!43312 e!43330)))

(declare-fun bm!5411 () Bool)

(declare-fun call!5412 () ListLongMap!1375)

(declare-fun call!5424 () ListLongMap!1375)

(assert (=> bm!5411 (= call!5412 call!5424)))

(declare-fun bm!5412 () Bool)

(declare-fun call!5425 () ListLongMap!1375)

(assert (=> bm!5412 (= call!5425 (map!1137 newMap!16))))

(declare-fun b!66058 () Bool)

(declare-fun e!43316 () ListLongMap!1375)

(assert (=> b!66058 (= e!43316 (getCurrentListMap!401 (_keys!3780 newMap!16) (_values!2123 newMap!16) (mask!6072 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2140 newMap!16)))))

(declare-fun bm!5413 () Bool)

(assert (=> bm!5413 (= call!5424 (getCurrentListMap!401 (_keys!3780 newMap!16) (ite c!9082 (_values!2123 newMap!16) lt!28402) (mask!6072 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2140 newMap!16)))))

(declare-fun bm!5414 () Bool)

(declare-fun c!9078 () Bool)

(assert (=> bm!5414 (= call!5409 (getCurrentListMap!401 (_keys!3780 newMap!16) (ite (or c!9082 c!9076) (_values!2123 newMap!16) (array!3812 (store (arr!1821 (_values!2123 newMap!16)) (index!3033 lt!28394) (ValueCellFull!878 lt!28198)) (size!2056 (_values!2123 newMap!16)))) (mask!6072 newMap!16) (ite c!9082 (ite c!9078 lt!28405 lt!28407) (extraKeys!2011 newMap!16)) (ite (and c!9082 c!9078) lt!28198 (zeroValue!2048 newMap!16)) (ite c!9082 (ite c!9078 (minValue!2048 newMap!16) lt!28198) (minValue!2048 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2140 newMap!16)))))

(declare-fun bm!5415 () Bool)

(assert (=> bm!5415 (= call!5407 call!5430)))

(declare-fun b!66059 () Bool)

(declare-fun e!43326 () ListLongMap!1375)

(assert (=> b!66059 (= e!43326 call!5429)))

(declare-fun b!66060 () Bool)

(assert (=> b!66060 (= e!43325 e!43311)))

(assert (=> b!66060 (= c!9078 (= (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5416 () Bool)

(assert (=> bm!5416 (= call!5427 (+!85 e!43316 (ite c!9082 (ite c!9078 (tuple2!2075 #b0000000000000000000000000000000000000000000000000000000000000000 lt!28198) (tuple2!2075 #b1000000000000000000000000000000000000000000000000000000000000000 lt!28198)) (tuple2!2075 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) lt!28198))))))

(declare-fun c!9077 () Bool)

(assert (=> bm!5416 (= c!9077 c!9082)))

(declare-fun b!66061 () Bool)

(declare-fun res!35807 () Bool)

(assert (=> b!66061 (=> (not res!35807) (not e!43321))))

(assert (=> b!66061 (= res!35807 (= (select (arr!1820 (_keys!3780 newMap!16)) (index!3032 lt!28414)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!66062 () Bool)

(assert (=> b!66062 (= e!43330 ((_ is Undefined!226) lt!28412))))

(declare-fun bm!5417 () Bool)

(declare-fun call!5415 () Bool)

(assert (=> bm!5417 (= call!5411 call!5415)))

(declare-fun call!5417 () Unit!1812)

(declare-fun bm!5418 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!20 (array!3809 array!3811 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 64) Int) Unit!1812)

(assert (=> bm!5418 (= call!5417 (lemmaInListMapThenSeekEntryOrOpenFindsIt!20 (_keys!3780 newMap!16) (_values!2123 newMap!16) (mask!6072 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (defaultEntry!2140 newMap!16)))))

(declare-fun bm!5419 () Bool)

(declare-fun call!5413 () SeekEntryResult!226)

(assert (=> bm!5419 (= call!5419 call!5413)))

(declare-fun bm!5420 () Bool)

(assert (=> bm!5420 (= call!5410 call!5407)))

(declare-fun b!66063 () Bool)

(declare-fun lt!28404 () tuple2!2076)

(assert (=> b!66063 (= e!43314 (tuple2!2077 (_1!1049 lt!28404) (_2!1049 lt!28404)))))

(assert (=> b!66063 (= lt!28404 call!5422)))

(declare-fun bm!5421 () Bool)

(assert (=> bm!5421 (= call!5416 call!5430)))

(declare-fun b!66064 () Bool)

(assert (=> b!66064 (= e!43316 call!5412)))

(declare-fun bm!5422 () Bool)

(assert (=> bm!5422 (= call!5415 (arrayContainsKey!0 (_keys!3780 newMap!16) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!66065 () Bool)

(declare-fun res!35815 () Bool)

(assert (=> b!66065 (=> (not res!35815) (not e!43313))))

(assert (=> b!66065 (= res!35815 call!5410)))

(assert (=> b!66065 (= e!43312 e!43313)))

(declare-fun b!66066 () Bool)

(assert (=> b!66066 (= e!43326 call!5424)))

(declare-fun bm!5423 () Bool)

(declare-fun c!9080 () Bool)

(assert (=> bm!5423 (= c!9080 c!9076)))

(assert (=> bm!5423 (= call!5421 (contains!702 e!43326 (ite c!9076 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (select (arr!1820 (_keys!3780 newMap!16)) (index!3033 lt!28394)))))))

(declare-fun b!66067 () Bool)

(declare-fun lt!28416 () Unit!1812)

(assert (=> b!66067 (= e!43322 lt!28416)))

(assert (=> b!66067 (= lt!28416 call!5417)))

(assert (=> b!66067 (= lt!28415 call!5420)))

(declare-fun res!35816 () Bool)

(assert (=> b!66067 (= res!35816 ((_ is Found!226) lt!28415))))

(assert (=> b!66067 (=> (not res!35816) (not e!43324))))

(assert (=> b!66067 e!43324))

(declare-fun bm!5424 () Bool)

(assert (=> bm!5424 (= call!5408 (map!1137 (_2!1049 lt!28400)))))

(declare-fun b!66068 () Bool)

(declare-fun lt!28410 () Unit!1812)

(assert (=> b!66068 (= lt!28410 e!43329)))

(assert (=> b!66068 (= c!9086 call!5421)))

(assert (=> b!66068 (= e!43315 (tuple2!2077 false newMap!16))))

(declare-fun b!66069 () Bool)

(declare-fun Unit!1822 () Unit!1812)

(assert (=> b!66069 (= e!43329 Unit!1822)))

(declare-fun lt!28403 () Unit!1812)

(assert (=> b!66069 (= lt!28403 call!5417)))

(assert (=> b!66069 (= lt!28393 call!5419)))

(declare-fun res!35812 () Bool)

(assert (=> b!66069 (= res!35812 ((_ is Found!226) lt!28393))))

(assert (=> b!66069 (=> (not res!35812) (not e!43323))))

(assert (=> b!66069 e!43323))

(declare-fun lt!28399 () Unit!1812)

(assert (=> b!66069 (= lt!28399 lt!28403)))

(assert (=> b!66069 false))

(declare-fun bm!5425 () Bool)

(assert (=> bm!5425 (= call!5413 (seekEntryOrOpen!0 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (_keys!3780 newMap!16) (mask!6072 newMap!16)))))

(declare-fun b!66070 () Bool)

(assert (=> b!66070 (= e!43318 (= call!5408 (+!85 call!5425 (tuple2!2075 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) lt!28198))))))

(declare-fun b!66071 () Bool)

(assert (=> b!66071 (= e!43323 (= (select (arr!1820 (_keys!3780 newMap!16)) (index!3033 lt!28393)) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355)))))

(declare-fun b!66072 () Bool)

(assert (=> b!66072 (= e!43310 (= call!5408 call!5425))))

(declare-fun bm!5426 () Bool)

(assert (=> bm!5426 (= call!5420 call!5413)))

(declare-fun bm!5427 () Bool)

(assert (=> bm!5427 (= call!5428 call!5415)))

(declare-fun b!66073 () Bool)

(assert (=> b!66073 (= e!43320 e!43310)))

(declare-fun c!9085 () Bool)

(assert (=> b!66073 (= c!9085 (_1!1049 lt!28400))))

(declare-fun b!66074 () Bool)

(assert (=> b!66074 (= e!43317 ((_ is Undefined!226) lt!28414))))

(assert (= (and d!13717 c!9082) b!66060))

(assert (= (and d!13717 (not c!9082)) b!66033))

(assert (= (and b!66060 c!9078) b!66043))

(assert (= (and b!66060 (not c!9078)) b!66050))

(assert (= (or b!66043 b!66050) bm!5411))

(assert (= (or b!66043 b!66050) bm!5406))

(assert (= (or b!66043 b!66050) bm!5410))

(assert (= (and b!66033 c!9076) b!66068))

(assert (= (and b!66033 (not c!9076)) b!66040))

(assert (= (and b!66068 c!9086) b!66069))

(assert (= (and b!66068 (not c!9086)) b!66041))

(assert (= (and b!66069 res!35812) b!66056))

(assert (= (and b!66056 res!35809) b!66071))

(assert (= (and b!66041 c!9083) b!66037))

(assert (= (and b!66041 (not c!9083)) b!66047))

(assert (= (and b!66037 res!35819) b!66061))

(assert (= (and b!66061 res!35807) b!66042))

(assert (= (and b!66047 c!9073) b!66053))

(assert (= (and b!66047 (not c!9073)) b!66074))

(assert (= (and b!66053 res!35818) b!66048))

(assert (= (and b!66048 res!35814) b!66038))

(assert (= (or b!66037 b!66053) bm!5408))

(assert (= (or b!66042 b!66038) bm!5427))

(assert (= (or b!66056 bm!5408) bm!5421))

(assert (= (or b!66069 b!66041) bm!5419))

(assert (= (and b!66040 c!9074) b!66063))

(assert (= (and b!66040 (not c!9074)) b!66051))

(assert (= (and b!66051 c!9075) b!66054))

(assert (= (and b!66051 (not c!9075)) b!66046))

(assert (= (and b!66046 c!9081) b!66067))

(assert (= (and b!66046 (not c!9081)) b!66036))

(assert (= (and b!66067 res!35816) b!66039))

(assert (= (and b!66039 res!35813) b!66044))

(assert (= (and b!66036 c!9084) b!66065))

(assert (= (and b!66036 (not c!9084)) b!66057))

(assert (= (and b!66065 res!35815) b!66035))

(assert (= (and b!66035 res!35806) b!66034))

(assert (= (and b!66057 c!9079) b!66045))

(assert (= (and b!66057 (not c!9079)) b!66062))

(assert (= (and b!66045 res!35808) b!66055))

(assert (= (and b!66055 res!35811) b!66049))

(assert (= (or b!66065 b!66045) bm!5420))

(assert (= (or b!66034 b!66049) bm!5417))

(assert (= (or b!66039 bm!5420) bm!5415))

(assert (= (or b!66067 b!66036) bm!5426))

(assert (= (or b!66063 b!66054) bm!5404))

(assert (= (or b!66069 b!66067) bm!5418))

(assert (= (or b!66041 b!66036) bm!5405))

(assert (= (or bm!5419 bm!5426) bm!5425))

(assert (= (or b!66068 b!66046) bm!5409))

(assert (= (or bm!5421 bm!5415) bm!5407))

(assert (= (or bm!5427 bm!5417) bm!5422))

(assert (= (or b!66068 b!66046) bm!5423))

(assert (= (and bm!5423 c!9080) b!66059))

(assert (= (and bm!5423 (not c!9080)) b!66066))

(assert (= (or bm!5411 b!66066) bm!5413))

(assert (= (or bm!5406 bm!5409) bm!5414))

(assert (= (or bm!5410 b!66046) bm!5416))

(assert (= (and bm!5416 c!9077) b!66064))

(assert (= (and bm!5416 (not c!9077)) b!66058))

(assert (= (and d!13717 res!35810) b!66073))

(assert (= (and b!66073 c!9085) b!66052))

(assert (= (and b!66073 (not c!9085)) b!66072))

(assert (= (and b!66052 res!35817) b!66070))

(assert (= (or b!66070 b!66072) bm!5412))

(assert (= (or b!66052 b!66070 b!66072) bm!5424))

(declare-fun m!60695 () Bool)

(assert (=> bm!5416 m!60695))

(assert (=> b!66052 m!60433))

(declare-fun m!60697 () Bool)

(assert (=> b!66052 m!60697))

(declare-fun m!60699 () Bool)

(assert (=> b!66043 m!60699))

(declare-fun m!60701 () Bool)

(assert (=> b!66044 m!60701))

(declare-fun m!60703 () Bool)

(assert (=> bm!5424 m!60703))

(assert (=> bm!5404 m!60433))

(declare-fun m!60705 () Bool)

(assert (=> bm!5404 m!60705))

(assert (=> bm!5412 m!60473))

(declare-fun m!60707 () Bool)

(assert (=> b!66071 m!60707))

(declare-fun m!60709 () Bool)

(assert (=> b!66061 m!60709))

(declare-fun m!60711 () Bool)

(assert (=> bm!5413 m!60711))

(declare-fun m!60713 () Bool)

(assert (=> b!66070 m!60713))

(declare-fun m!60715 () Bool)

(assert (=> bm!5414 m!60715))

(declare-fun m!60717 () Bool)

(assert (=> bm!5414 m!60717))

(declare-fun m!60719 () Bool)

(assert (=> bm!5407 m!60719))

(declare-fun m!60721 () Bool)

(assert (=> d!13717 m!60721))

(assert (=> d!13717 m!60447))

(assert (=> b!66033 m!60433))

(declare-fun m!60723 () Bool)

(assert (=> b!66033 m!60723))

(declare-fun m!60725 () Bool)

(assert (=> b!66048 m!60725))

(assert (=> bm!5422 m!60433))

(declare-fun m!60727 () Bool)

(assert (=> bm!5422 m!60727))

(declare-fun m!60729 () Bool)

(assert (=> b!66035 m!60729))

(assert (=> bm!5425 m!60433))

(assert (=> bm!5425 m!60723))

(declare-fun m!60731 () Bool)

(assert (=> b!66058 m!60731))

(declare-fun m!60733 () Bool)

(assert (=> bm!5423 m!60733))

(declare-fun m!60735 () Bool)

(assert (=> bm!5423 m!60735))

(assert (=> b!66046 m!60715))

(declare-fun m!60737 () Bool)

(assert (=> b!66046 m!60737))

(assert (=> b!66046 m!60731))

(assert (=> b!66046 m!60731))

(assert (=> b!66046 m!60433))

(declare-fun m!60739 () Bool)

(assert (=> b!66046 m!60739))

(assert (=> b!66046 m!60433))

(declare-fun m!60741 () Bool)

(assert (=> b!66046 m!60741))

(declare-fun m!60743 () Bool)

(assert (=> b!66050 m!60743))

(assert (=> bm!5418 m!60433))

(declare-fun m!60745 () Bool)

(assert (=> bm!5418 m!60745))

(assert (=> bm!5405 m!60433))

(declare-fun m!60747 () Bool)

(assert (=> bm!5405 m!60747))

(declare-fun m!60749 () Bool)

(assert (=> b!66055 m!60749))

(assert (=> b!65767 d!13717))

(declare-fun d!13719 () Bool)

(declare-fun c!9089 () Bool)

(assert (=> d!13719 (= c!9089 ((_ is ValueCellFull!878) (select (arr!1821 (_values!2123 (v!2471 (underlying!248 thiss!992)))) from!355)))))

(declare-fun e!43333 () V!2905)

(assert (=> d!13719 (= (get!1117 (select (arr!1821 (_values!2123 (v!2471 (underlying!248 thiss!992)))) from!355) (dynLambda!318 (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!43333)))

(declare-fun b!66079 () Bool)

(declare-fun get!1118 (ValueCell!878 V!2905) V!2905)

(assert (=> b!66079 (= e!43333 (get!1118 (select (arr!1821 (_values!2123 (v!2471 (underlying!248 thiss!992)))) from!355) (dynLambda!318 (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!66080 () Bool)

(declare-fun get!1119 (ValueCell!878 V!2905) V!2905)

(assert (=> b!66080 (= e!43333 (get!1119 (select (arr!1821 (_values!2123 (v!2471 (underlying!248 thiss!992)))) from!355) (dynLambda!318 (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13719 c!9089) b!66079))

(assert (= (and d!13719 (not c!9089)) b!66080))

(assert (=> b!66079 m!60435))

(assert (=> b!66079 m!60437))

(declare-fun m!60751 () Bool)

(assert (=> b!66079 m!60751))

(assert (=> b!66080 m!60435))

(assert (=> b!66080 m!60437))

(declare-fun m!60753 () Bool)

(assert (=> b!66080 m!60753))

(assert (=> b!65760 d!13719))

(declare-fun d!13721 () Bool)

(assert (=> d!13721 (= (array_inv!1117 (_keys!3780 newMap!16)) (bvsge (size!2055 (_keys!3780 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65759 d!13721))

(declare-fun d!13723 () Bool)

(assert (=> d!13723 (= (array_inv!1118 (_values!2123 newMap!16)) (bvsge (size!2056 (_values!2123 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!65759 d!13723))

(declare-fun d!13725 () Bool)

(assert (=> d!13725 (not (arrayContainsKey!0 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!28421 () Unit!1812)

(declare-fun choose!68 (array!3809 (_ BitVec 32) (_ BitVec 64) List!1451) Unit!1812)

(assert (=> d!13725 (= lt!28421 (choose!68 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (Cons!1447 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) Nil!1448)))))

(assert (=> d!13725 (bvslt (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13725 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (Cons!1447 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) Nil!1448)) lt!28421)))

(declare-fun bs!2855 () Bool)

(assert (= bs!2855 d!13725))

(assert (=> bs!2855 m!60433))

(assert (=> bs!2855 m!60483))

(assert (=> bs!2855 m!60433))

(declare-fun m!60755 () Bool)

(assert (=> bs!2855 m!60755))

(assert (=> b!65763 d!13725))

(declare-fun d!13727 () Bool)

(assert (=> d!13727 (arrayNoDuplicates!0 (_keys!3780 (v!2471 (underlying!248 thiss!992))) from!355 Nil!1448)))

(declare-fun lt!28424 () Unit!1812)

(declare-fun choose!39 (array!3809 (_ BitVec 32) (_ BitVec 32)) Unit!1812)

(assert (=> d!13727 (= lt!28424 (choose!39 (_keys!3780 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!13727 (bvslt (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13727 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3780 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000000 from!355) lt!28424)))

(declare-fun bs!2856 () Bool)

(assert (= bs!2856 d!13727))

(assert (=> bs!2856 m!60479))

(declare-fun m!60757 () Bool)

(assert (=> bs!2856 m!60757))

(assert (=> b!65763 d!13727))

(declare-fun d!13729 () Bool)

(declare-fun res!35824 () Bool)

(declare-fun e!43338 () Bool)

(assert (=> d!13729 (=> res!35824 e!43338)))

(assert (=> d!13729 (= res!35824 (= (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355)))))

(assert (=> d!13729 (= (arrayContainsKey!0 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!43338)))

(declare-fun b!66085 () Bool)

(declare-fun e!43339 () Bool)

(assert (=> b!66085 (= e!43338 e!43339)))

(declare-fun res!35825 () Bool)

(assert (=> b!66085 (=> (not res!35825) (not e!43339))))

(assert (=> b!66085 (= res!35825 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992))))))))

(declare-fun b!66086 () Bool)

(assert (=> b!66086 (= e!43339 (arrayContainsKey!0 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!13729 (not res!35824)) b!66085))

(assert (= (and b!66085 res!35825) b!66086))

(assert (=> d!13729 m!60617))

(assert (=> b!66086 m!60433))

(declare-fun m!60759 () Bool)

(assert (=> b!66086 m!60759))

(assert (=> b!65763 d!13729))

(declare-fun d!13731 () Bool)

(declare-fun e!43342 () Bool)

(assert (=> d!13731 e!43342))

(declare-fun c!9092 () Bool)

(assert (=> d!13731 (= c!9092 (and (not (= (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!28427 () Unit!1812)

(declare-fun choose!371 (array!3809 array!3811 (_ BitVec 32) (_ BitVec 32) V!2905 V!2905 (_ BitVec 64) (_ BitVec 32) Int) Unit!1812)

(assert (=> d!13731 (= lt!28427 (choose!371 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))))))

(assert (=> d!13731 (validMask!0 (mask!6072 (v!2471 (underlying!248 thiss!992))))))

(assert (=> d!13731 (= (lemmaListMapContainsThenArrayContainsFrom!34 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))) lt!28427)))

(declare-fun b!66091 () Bool)

(assert (=> b!66091 (= e!43342 (arrayContainsKey!0 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!66092 () Bool)

(assert (=> b!66092 (= e!43342 (ite (= (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13731 c!9092) b!66091))

(assert (= (and d!13731 (not c!9092)) b!66092))

(assert (=> d!13731 m!60433))

(declare-fun m!60761 () Bool)

(assert (=> d!13731 m!60761))

(assert (=> d!13731 m!60451))

(assert (=> b!66091 m!60433))

(assert (=> b!66091 m!60483))

(assert (=> b!65763 d!13731))

(declare-fun bm!5430 () Bool)

(declare-fun call!5433 () Bool)

(declare-fun c!9095 () Bool)

(assert (=> bm!5430 (= call!5433 (arrayNoDuplicates!0 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!9095 (Cons!1447 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355) Nil!1448) Nil!1448)))))

(declare-fun b!66103 () Bool)

(declare-fun e!43353 () Bool)

(assert (=> b!66103 (= e!43353 call!5433)))

(declare-fun b!66104 () Bool)

(declare-fun e!43352 () Bool)

(declare-fun e!43354 () Bool)

(assert (=> b!66104 (= e!43352 e!43354)))

(declare-fun res!35833 () Bool)

(assert (=> b!66104 (=> (not res!35833) (not e!43354))))

(declare-fun e!43351 () Bool)

(assert (=> b!66104 (= res!35833 (not e!43351))))

(declare-fun res!35832 () Bool)

(assert (=> b!66104 (=> (not res!35832) (not e!43351))))

(assert (=> b!66104 (= res!35832 (validKeyInArray!0 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355)))))

(declare-fun b!66106 () Bool)

(assert (=> b!66106 (= e!43353 call!5433)))

(declare-fun b!66107 () Bool)

(declare-fun contains!704 (List!1451 (_ BitVec 64)) Bool)

(assert (=> b!66107 (= e!43351 (contains!704 Nil!1448 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355)))))

(declare-fun d!13733 () Bool)

(declare-fun res!35834 () Bool)

(assert (=> d!13733 (=> res!35834 e!43352)))

(assert (=> d!13733 (= res!35834 (bvsge from!355 (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992))))))))

(assert (=> d!13733 (= (arrayNoDuplicates!0 (_keys!3780 (v!2471 (underlying!248 thiss!992))) from!355 Nil!1448) e!43352)))

(declare-fun b!66105 () Bool)

(assert (=> b!66105 (= e!43354 e!43353)))

(assert (=> b!66105 (= c!9095 (validKeyInArray!0 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) from!355)))))

(assert (= (and d!13733 (not res!35834)) b!66104))

(assert (= (and b!66104 res!35832) b!66107))

(assert (= (and b!66104 res!35833) b!66105))

(assert (= (and b!66105 c!9095) b!66106))

(assert (= (and b!66105 (not c!9095)) b!66103))

(assert (= (or b!66106 b!66103) bm!5430))

(assert (=> bm!5430 m!60433))

(declare-fun m!60763 () Bool)

(assert (=> bm!5430 m!60763))

(assert (=> b!66104 m!60433))

(assert (=> b!66104 m!60433))

(declare-fun m!60765 () Bool)

(assert (=> b!66104 m!60765))

(assert (=> b!66107 m!60433))

(assert (=> b!66107 m!60433))

(declare-fun m!60767 () Bool)

(assert (=> b!66107 m!60767))

(assert (=> b!66105 m!60433))

(assert (=> b!66105 m!60433))

(assert (=> b!66105 m!60765))

(assert (=> b!65763 d!13733))

(declare-fun d!13735 () Bool)

(assert (=> d!13735 (= (map!1137 newMap!16) (getCurrentListMap!401 (_keys!3780 newMap!16) (_values!2123 newMap!16) (mask!6072 newMap!16) (extraKeys!2011 newMap!16) (zeroValue!2048 newMap!16) (minValue!2048 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2140 newMap!16)))))

(declare-fun bs!2857 () Bool)

(assert (= bs!2857 d!13735))

(assert (=> bs!2857 m!60731))

(assert (=> b!65753 d!13735))

(declare-fun b!66150 () Bool)

(declare-fun e!43386 () Bool)

(declare-fun lt!28493 () ListLongMap!1375)

(assert (=> b!66150 (= e!43386 (= (apply!71 lt!28493 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2048 (v!2471 (underlying!248 thiss!992)))))))

(declare-fun bm!5445 () Bool)

(declare-fun call!5450 () Bool)

(assert (=> bm!5445 (= call!5450 (contains!702 lt!28493 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!66151 () Bool)

(declare-fun e!43383 () ListLongMap!1375)

(declare-fun e!43390 () ListLongMap!1375)

(assert (=> b!66151 (= e!43383 e!43390)))

(declare-fun c!9109 () Bool)

(assert (=> b!66151 (= c!9109 (and (not (= (bvand (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!13737 () Bool)

(declare-fun e!43385 () Bool)

(assert (=> d!13737 e!43385))

(declare-fun res!35859 () Bool)

(assert (=> d!13737 (=> (not res!35859) (not e!43385))))

(assert (=> d!13737 (= res!35859 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992))))))))))

(declare-fun lt!28489 () ListLongMap!1375)

(assert (=> d!13737 (= lt!28493 lt!28489)))

(declare-fun lt!28490 () Unit!1812)

(declare-fun e!43392 () Unit!1812)

(assert (=> d!13737 (= lt!28490 e!43392)))

(declare-fun c!9112 () Bool)

(declare-fun e!43388 () Bool)

(assert (=> d!13737 (= c!9112 e!43388)))

(declare-fun res!35854 () Bool)

(assert (=> d!13737 (=> (not res!35854) (not e!43388))))

(assert (=> d!13737 (= res!35854 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992))))))))

(assert (=> d!13737 (= lt!28489 e!43383)))

(declare-fun c!9111 () Bool)

(assert (=> d!13737 (= c!9111 (and (not (= (bvand (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13737 (validMask!0 (mask!6072 (v!2471 (underlying!248 thiss!992))))))

(assert (=> d!13737 (= (getCurrentListMap!401 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))) lt!28493)))

(declare-fun b!66152 () Bool)

(declare-fun Unit!1823 () Unit!1812)

(assert (=> b!66152 (= e!43392 Unit!1823)))

(declare-fun bm!5446 () Bool)

(declare-fun call!5454 () ListLongMap!1375)

(declare-fun call!5451 () ListLongMap!1375)

(assert (=> bm!5446 (= call!5454 call!5451)))

(declare-fun bm!5447 () Bool)

(declare-fun call!5452 () ListLongMap!1375)

(declare-fun call!5449 () ListLongMap!1375)

(assert (=> bm!5447 (= call!5452 call!5449)))

(declare-fun b!66153 () Bool)

(declare-fun e!43381 () Bool)

(assert (=> b!66153 (= e!43381 (not call!5450))))

(declare-fun bm!5448 () Bool)

(declare-fun call!5448 () ListLongMap!1375)

(assert (=> bm!5448 (= call!5451 (+!85 (ite c!9111 call!5449 (ite c!9109 call!5452 call!5448)) (ite (or c!9111 c!9109) (tuple2!2075 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2048 (v!2471 (underlying!248 thiss!992)))) (tuple2!2075 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2048 (v!2471 (underlying!248 thiss!992)))))))))

(declare-fun b!66154 () Bool)

(assert (=> b!66154 (= e!43383 (+!85 call!5451 (tuple2!2075 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2048 (v!2471 (underlying!248 thiss!992))))))))

(declare-fun e!43382 () Bool)

(declare-fun b!66155 () Bool)

(assert (=> b!66155 (= e!43382 (= (apply!71 lt!28493 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1117 (select (arr!1821 (_values!2123 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!318 (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!66155 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2056 (_values!2123 (v!2471 (underlying!248 thiss!992))))))))

(assert (=> b!66155 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992))))))))

(declare-fun b!66156 () Bool)

(declare-fun e!43387 () Bool)

(assert (=> b!66156 (= e!43387 e!43382)))

(declare-fun res!35858 () Bool)

(assert (=> b!66156 (=> (not res!35858) (not e!43382))))

(assert (=> b!66156 (= res!35858 (contains!702 lt!28493 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!66156 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992))))))))

(declare-fun b!66157 () Bool)

(assert (=> b!66157 (= e!43381 e!43386)))

(declare-fun res!35856 () Bool)

(assert (=> b!66157 (= res!35856 call!5450)))

(assert (=> b!66157 (=> (not res!35856) (not e!43386))))

(declare-fun bm!5449 () Bool)

(declare-fun call!5453 () Bool)

(assert (=> bm!5449 (= call!5453 (contains!702 lt!28493 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!66158 () Bool)

(declare-fun e!43391 () Bool)

(assert (=> b!66158 (= e!43391 (not call!5453))))

(declare-fun bm!5450 () Bool)

(assert (=> bm!5450 (= call!5449 (getCurrentListMapNoExtraKeys!50 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))))))

(declare-fun bm!5451 () Bool)

(assert (=> bm!5451 (= call!5448 call!5452)))

(declare-fun b!66159 () Bool)

(assert (=> b!66159 (= e!43385 e!43391)))

(declare-fun c!9110 () Bool)

(assert (=> b!66159 (= c!9110 (not (= (bvand (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!66160 () Bool)

(declare-fun res!35857 () Bool)

(assert (=> b!66160 (=> (not res!35857) (not e!43385))))

(assert (=> b!66160 (= res!35857 e!43381)))

(declare-fun c!9108 () Bool)

(assert (=> b!66160 (= c!9108 (not (= (bvand (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!66161 () Bool)

(declare-fun e!43393 () Bool)

(assert (=> b!66161 (= e!43393 (validKeyInArray!0 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!66162 () Bool)

(declare-fun e!43384 () Bool)

(assert (=> b!66162 (= e!43384 (= (apply!71 lt!28493 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2048 (v!2471 (underlying!248 thiss!992)))))))

(declare-fun b!66163 () Bool)

(declare-fun res!35861 () Bool)

(assert (=> b!66163 (=> (not res!35861) (not e!43385))))

(assert (=> b!66163 (= res!35861 e!43387)))

(declare-fun res!35853 () Bool)

(assert (=> b!66163 (=> res!35853 e!43387)))

(assert (=> b!66163 (= res!35853 (not e!43393))))

(declare-fun res!35860 () Bool)

(assert (=> b!66163 (=> (not res!35860) (not e!43393))))

(assert (=> b!66163 (= res!35860 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2055 (_keys!3780 (v!2471 (underlying!248 thiss!992))))))))

(declare-fun b!66164 () Bool)

(declare-fun e!43389 () ListLongMap!1375)

(assert (=> b!66164 (= e!43389 call!5454)))

(declare-fun b!66165 () Bool)

(assert (=> b!66165 (= e!43389 call!5448)))

(declare-fun b!66166 () Bool)

(declare-fun lt!28477 () Unit!1812)

(assert (=> b!66166 (= e!43392 lt!28477)))

(declare-fun lt!28487 () ListLongMap!1375)

(assert (=> b!66166 (= lt!28487 (getCurrentListMapNoExtraKeys!50 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))))))

(declare-fun lt!28481 () (_ BitVec 64))

(assert (=> b!66166 (= lt!28481 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28492 () (_ BitVec 64))

(assert (=> b!66166 (= lt!28492 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!28478 () Unit!1812)

(declare-fun addStillContains!47 (ListLongMap!1375 (_ BitVec 64) V!2905 (_ BitVec 64)) Unit!1812)

(assert (=> b!66166 (= lt!28478 (addStillContains!47 lt!28487 lt!28481 (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) lt!28492))))

(assert (=> b!66166 (contains!702 (+!85 lt!28487 (tuple2!2075 lt!28481 (zeroValue!2048 (v!2471 (underlying!248 thiss!992))))) lt!28492)))

(declare-fun lt!28484 () Unit!1812)

(assert (=> b!66166 (= lt!28484 lt!28478)))

(declare-fun lt!28474 () ListLongMap!1375)

(assert (=> b!66166 (= lt!28474 (getCurrentListMapNoExtraKeys!50 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))))))

(declare-fun lt!28483 () (_ BitVec 64))

(assert (=> b!66166 (= lt!28483 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28473 () (_ BitVec 64))

(assert (=> b!66166 (= lt!28473 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!28479 () Unit!1812)

(declare-fun addApplyDifferent!47 (ListLongMap!1375 (_ BitVec 64) V!2905 (_ BitVec 64)) Unit!1812)

(assert (=> b!66166 (= lt!28479 (addApplyDifferent!47 lt!28474 lt!28483 (minValue!2048 (v!2471 (underlying!248 thiss!992))) lt!28473))))

(assert (=> b!66166 (= (apply!71 (+!85 lt!28474 (tuple2!2075 lt!28483 (minValue!2048 (v!2471 (underlying!248 thiss!992))))) lt!28473) (apply!71 lt!28474 lt!28473))))

(declare-fun lt!28472 () Unit!1812)

(assert (=> b!66166 (= lt!28472 lt!28479)))

(declare-fun lt!28475 () ListLongMap!1375)

(assert (=> b!66166 (= lt!28475 (getCurrentListMapNoExtraKeys!50 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))))))

(declare-fun lt!28482 () (_ BitVec 64))

(assert (=> b!66166 (= lt!28482 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28488 () (_ BitVec 64))

(assert (=> b!66166 (= lt!28488 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!28476 () Unit!1812)

(assert (=> b!66166 (= lt!28476 (addApplyDifferent!47 lt!28475 lt!28482 (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) lt!28488))))

(assert (=> b!66166 (= (apply!71 (+!85 lt!28475 (tuple2!2075 lt!28482 (zeroValue!2048 (v!2471 (underlying!248 thiss!992))))) lt!28488) (apply!71 lt!28475 lt!28488))))

(declare-fun lt!28480 () Unit!1812)

(assert (=> b!66166 (= lt!28480 lt!28476)))

(declare-fun lt!28486 () ListLongMap!1375)

(assert (=> b!66166 (= lt!28486 (getCurrentListMapNoExtraKeys!50 (_keys!3780 (v!2471 (underlying!248 thiss!992))) (_values!2123 (v!2471 (underlying!248 thiss!992))) (mask!6072 (v!2471 (underlying!248 thiss!992))) (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) (zeroValue!2048 (v!2471 (underlying!248 thiss!992))) (minValue!2048 (v!2471 (underlying!248 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992)))))))

(declare-fun lt!28491 () (_ BitVec 64))

(assert (=> b!66166 (= lt!28491 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28485 () (_ BitVec 64))

(assert (=> b!66166 (= lt!28485 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!66166 (= lt!28477 (addApplyDifferent!47 lt!28486 lt!28491 (minValue!2048 (v!2471 (underlying!248 thiss!992))) lt!28485))))

(assert (=> b!66166 (= (apply!71 (+!85 lt!28486 (tuple2!2075 lt!28491 (minValue!2048 (v!2471 (underlying!248 thiss!992))))) lt!28485) (apply!71 lt!28486 lt!28485))))

(declare-fun b!66167 () Bool)

(assert (=> b!66167 (= e!43388 (validKeyInArray!0 (select (arr!1820 (_keys!3780 (v!2471 (underlying!248 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!66168 () Bool)

(assert (=> b!66168 (= e!43391 e!43384)))

(declare-fun res!35855 () Bool)

(assert (=> b!66168 (= res!35855 call!5453)))

(assert (=> b!66168 (=> (not res!35855) (not e!43384))))

(declare-fun b!66169 () Bool)

(declare-fun c!9113 () Bool)

(assert (=> b!66169 (= c!9113 (and (not (= (bvand (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2011 (v!2471 (underlying!248 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!66169 (= e!43390 e!43389)))

(declare-fun b!66170 () Bool)

(assert (=> b!66170 (= e!43390 call!5454)))

(assert (= (and d!13737 c!9111) b!66154))

(assert (= (and d!13737 (not c!9111)) b!66151))

(assert (= (and b!66151 c!9109) b!66170))

(assert (= (and b!66151 (not c!9109)) b!66169))

(assert (= (and b!66169 c!9113) b!66164))

(assert (= (and b!66169 (not c!9113)) b!66165))

(assert (= (or b!66164 b!66165) bm!5451))

(assert (= (or b!66170 bm!5451) bm!5447))

(assert (= (or b!66170 b!66164) bm!5446))

(assert (= (or b!66154 bm!5447) bm!5450))

(assert (= (or b!66154 bm!5446) bm!5448))

(assert (= (and d!13737 res!35854) b!66167))

(assert (= (and d!13737 c!9112) b!66166))

(assert (= (and d!13737 (not c!9112)) b!66152))

(assert (= (and d!13737 res!35859) b!66163))

(assert (= (and b!66163 res!35860) b!66161))

(assert (= (and b!66163 (not res!35853)) b!66156))

(assert (= (and b!66156 res!35858) b!66155))

(assert (= (and b!66163 res!35861) b!66160))

(assert (= (and b!66160 c!9108) b!66157))

(assert (= (and b!66160 (not c!9108)) b!66153))

(assert (= (and b!66157 res!35856) b!66150))

(assert (= (or b!66157 b!66153) bm!5445))

(assert (= (and b!66160 res!35857) b!66159))

(assert (= (and b!66159 c!9110) b!66168))

(assert (= (and b!66159 (not c!9110)) b!66158))

(assert (= (and b!66168 res!35855) b!66162))

(assert (= (or b!66168 b!66158) bm!5449))

(declare-fun b_lambda!2963 () Bool)

(assert (=> (not b_lambda!2963) (not b!66155)))

(assert (=> b!66155 t!4909))

(declare-fun b_and!4085 () Bool)

(assert (= b_and!4081 (and (=> t!4909 result!2547) b_and!4085)))

(assert (=> b!66155 t!4911))

(declare-fun b_and!4087 () Bool)

(assert (= b_and!4083 (and (=> t!4911 result!2551) b_and!4087)))

(declare-fun m!60769 () Bool)

(assert (=> bm!5448 m!60769))

(assert (=> d!13737 m!60451))

(declare-fun m!60771 () Bool)

(assert (=> b!66166 m!60771))

(declare-fun m!60773 () Bool)

(assert (=> b!66166 m!60773))

(declare-fun m!60775 () Bool)

(assert (=> b!66166 m!60775))

(declare-fun m!60777 () Bool)

(assert (=> b!66166 m!60777))

(declare-fun m!60779 () Bool)

(assert (=> b!66166 m!60779))

(declare-fun m!60781 () Bool)

(assert (=> b!66166 m!60781))

(assert (=> b!66166 m!60461))

(assert (=> b!66166 m!60771))

(declare-fun m!60783 () Bool)

(assert (=> b!66166 m!60783))

(assert (=> b!66166 m!60773))

(declare-fun m!60785 () Bool)

(assert (=> b!66166 m!60785))

(declare-fun m!60787 () Bool)

(assert (=> b!66166 m!60787))

(declare-fun m!60789 () Bool)

(assert (=> b!66166 m!60789))

(declare-fun m!60791 () Bool)

(assert (=> b!66166 m!60791))

(assert (=> b!66166 m!60785))

(declare-fun m!60793 () Bool)

(assert (=> b!66166 m!60793))

(declare-fun m!60795 () Bool)

(assert (=> b!66166 m!60795))

(assert (=> b!66166 m!60617))

(assert (=> b!66166 m!60777))

(declare-fun m!60797 () Bool)

(assert (=> b!66166 m!60797))

(declare-fun m!60799 () Bool)

(assert (=> b!66166 m!60799))

(declare-fun m!60801 () Bool)

(assert (=> bm!5449 m!60801))

(assert (=> b!66156 m!60617))

(assert (=> b!66156 m!60617))

(declare-fun m!60803 () Bool)

(assert (=> b!66156 m!60803))

(assert (=> b!66167 m!60617))

(assert (=> b!66167 m!60617))

(assert (=> b!66167 m!60623))

(assert (=> b!66155 m!60615))

(assert (=> b!66155 m!60617))

(assert (=> b!66155 m!60617))

(declare-fun m!60805 () Bool)

(assert (=> b!66155 m!60805))

(assert (=> b!66155 m!60615))

(assert (=> b!66155 m!60437))

(assert (=> b!66155 m!60621))

(assert (=> b!66155 m!60437))

(assert (=> bm!5450 m!60461))

(declare-fun m!60807 () Bool)

(assert (=> b!66162 m!60807))

(declare-fun m!60809 () Bool)

(assert (=> b!66154 m!60809))

(declare-fun m!60811 () Bool)

(assert (=> bm!5445 m!60811))

(declare-fun m!60813 () Bool)

(assert (=> b!66150 m!60813))

(assert (=> b!66161 m!60617))

(assert (=> b!66161 m!60617))

(assert (=> b!66161 m!60623))

(assert (=> b!65753 d!13737))

(declare-fun d!13739 () Bool)

(declare-fun res!35868 () Bool)

(declare-fun e!43396 () Bool)

(assert (=> d!13739 (=> (not res!35868) (not e!43396))))

(declare-fun simpleValid!47 (LongMapFixedSize!664) Bool)

(assert (=> d!13739 (= res!35868 (simpleValid!47 newMap!16))))

(assert (=> d!13739 (= (valid!286 newMap!16) e!43396)))

(declare-fun b!66177 () Bool)

(declare-fun res!35869 () Bool)

(assert (=> b!66177 (=> (not res!35869) (not e!43396))))

(declare-fun arrayCountValidKeys!0 (array!3809 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!66177 (= res!35869 (= (arrayCountValidKeys!0 (_keys!3780 newMap!16) #b00000000000000000000000000000000 (size!2055 (_keys!3780 newMap!16))) (_size!381 newMap!16)))))

(declare-fun b!66178 () Bool)

(declare-fun res!35870 () Bool)

(assert (=> b!66178 (=> (not res!35870) (not e!43396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3809 (_ BitVec 32)) Bool)

(assert (=> b!66178 (= res!35870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3780 newMap!16) (mask!6072 newMap!16)))))

(declare-fun b!66179 () Bool)

(assert (=> b!66179 (= e!43396 (arrayNoDuplicates!0 (_keys!3780 newMap!16) #b00000000000000000000000000000000 Nil!1448))))

(assert (= (and d!13739 res!35868) b!66177))

(assert (= (and b!66177 res!35869) b!66178))

(assert (= (and b!66178 res!35870) b!66179))

(declare-fun m!60815 () Bool)

(assert (=> d!13739 m!60815))

(declare-fun m!60817 () Bool)

(assert (=> b!66177 m!60817))

(declare-fun m!60819 () Bool)

(assert (=> b!66178 m!60819))

(declare-fun m!60821 () Bool)

(assert (=> b!66179 m!60821))

(assert (=> b!65758 d!13739))

(declare-fun b!66186 () Bool)

(declare-fun e!43401 () Bool)

(assert (=> b!66186 (= e!43401 tp_is_empty!2443)))

(declare-fun b!66187 () Bool)

(declare-fun e!43402 () Bool)

(assert (=> b!66187 (= e!43402 tp_is_empty!2443)))

(declare-fun mapIsEmpty!3063 () Bool)

(declare-fun mapRes!3063 () Bool)

(assert (=> mapIsEmpty!3063 mapRes!3063))

(declare-fun mapNonEmpty!3063 () Bool)

(declare-fun tp!8337 () Bool)

(assert (=> mapNonEmpty!3063 (= mapRes!3063 (and tp!8337 e!43401))))

(declare-fun mapValue!3063 () ValueCell!878)

(declare-fun mapRest!3063 () (Array (_ BitVec 32) ValueCell!878))

(declare-fun mapKey!3063 () (_ BitVec 32))

(assert (=> mapNonEmpty!3063 (= mapRest!3047 (store mapRest!3063 mapKey!3063 mapValue!3063))))

(declare-fun condMapEmpty!3063 () Bool)

(declare-fun mapDefault!3063 () ValueCell!878)

(assert (=> mapNonEmpty!3047 (= condMapEmpty!3063 (= mapRest!3047 ((as const (Array (_ BitVec 32) ValueCell!878)) mapDefault!3063)))))

(assert (=> mapNonEmpty!3047 (= tp!8309 (and e!43402 mapRes!3063))))

(assert (= (and mapNonEmpty!3047 condMapEmpty!3063) mapIsEmpty!3063))

(assert (= (and mapNonEmpty!3047 (not condMapEmpty!3063)) mapNonEmpty!3063))

(assert (= (and mapNonEmpty!3063 ((_ is ValueCellFull!878) mapValue!3063)) b!66186))

(assert (= (and mapNonEmpty!3047 ((_ is ValueCellFull!878) mapDefault!3063)) b!66187))

(declare-fun m!60823 () Bool)

(assert (=> mapNonEmpty!3063 m!60823))

(declare-fun b!66188 () Bool)

(declare-fun e!43403 () Bool)

(assert (=> b!66188 (= e!43403 tp_is_empty!2443)))

(declare-fun b!66189 () Bool)

(declare-fun e!43404 () Bool)

(assert (=> b!66189 (= e!43404 tp_is_empty!2443)))

(declare-fun mapIsEmpty!3064 () Bool)

(declare-fun mapRes!3064 () Bool)

(assert (=> mapIsEmpty!3064 mapRes!3064))

(declare-fun mapNonEmpty!3064 () Bool)

(declare-fun tp!8338 () Bool)

(assert (=> mapNonEmpty!3064 (= mapRes!3064 (and tp!8338 e!43403))))

(declare-fun mapRest!3064 () (Array (_ BitVec 32) ValueCell!878))

(declare-fun mapKey!3064 () (_ BitVec 32))

(declare-fun mapValue!3064 () ValueCell!878)

(assert (=> mapNonEmpty!3064 (= mapRest!3048 (store mapRest!3064 mapKey!3064 mapValue!3064))))

(declare-fun condMapEmpty!3064 () Bool)

(declare-fun mapDefault!3064 () ValueCell!878)

(assert (=> mapNonEmpty!3048 (= condMapEmpty!3064 (= mapRest!3048 ((as const (Array (_ BitVec 32) ValueCell!878)) mapDefault!3064)))))

(assert (=> mapNonEmpty!3048 (= tp!8307 (and e!43404 mapRes!3064))))

(assert (= (and mapNonEmpty!3048 condMapEmpty!3064) mapIsEmpty!3064))

(assert (= (and mapNonEmpty!3048 (not condMapEmpty!3064)) mapNonEmpty!3064))

(assert (= (and mapNonEmpty!3064 ((_ is ValueCellFull!878) mapValue!3064)) b!66188))

(assert (= (and mapNonEmpty!3048 ((_ is ValueCellFull!878) mapDefault!3064)) b!66189))

(declare-fun m!60825 () Bool)

(assert (=> mapNonEmpty!3064 m!60825))

(declare-fun b_lambda!2965 () Bool)

(assert (= b_lambda!2963 (or (and b!65764 b_free!2053) (and b!65759 b_free!2055 (= (defaultEntry!2140 newMap!16) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))))) b_lambda!2965)))

(declare-fun b_lambda!2967 () Bool)

(assert (= b_lambda!2959 (or (and b!65764 b_free!2053) (and b!65759 b_free!2055 (= (defaultEntry!2140 newMap!16) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))))) b_lambda!2967)))

(declare-fun b_lambda!2969 () Bool)

(assert (= b_lambda!2961 (or (and b!65764 b_free!2053) (and b!65759 b_free!2055 (= (defaultEntry!2140 newMap!16) (defaultEntry!2140 (v!2471 (underlying!248 thiss!992))))) b_lambda!2969)))

(check-sat (not b!66080) (not b!66167) (not bm!5405) (not b!66177) (not b!66178) (not b!65938) (not b!65922) (not d!13701) (not d!13735) (not b!65932) (not b_next!2055) (not b!65930) (not d!13739) (not b_lambda!2967) (not bm!5355) (not d!13737) (not d!13695) (not b!66105) (not bm!5404) (not bm!5445) tp_is_empty!2443 (not b!66166) (not b!65934) (not d!13697) (not d!13707) (not b!65897) (not b!65924) (not b_lambda!2957) (not b!65929) (not d!13725) (not bm!5413) (not b!65946) (not b!66150) (not d!13717) (not mapNonEmpty!3064) (not b_next!2053) (not b_lambda!2969) (not b!65948) (not d!13703) (not b!66058) (not b!65935) (not b!65896) (not b!65939) (not bm!5449) b_and!4087 (not b!65931) (not b!66050) (not bm!5422) (not bm!5416) (not d!13727) (not b!66155) (not b!66161) (not bm!5412) (not b_lambda!2965) (not bm!5425) b_and!4085 (not bm!5423) (not b!66162) (not bm!5450) (not b!66156) (not b!66086) (not b!66033) (not bm!5407) (not b!66070) (not b!66107) (not b!66079) (not d!13715) (not b!66104) (not b!66154) (not bm!5448) (not bm!5424) (not b!66046) (not d!13699) (not d!13705) (not b!66179) (not b!65936) (not b!66091) (not b!65933) (not d!13731) (not b!65926) (not b!66043) (not mapNonEmpty!3063) (not b!65937) (not b!66052) (not bm!5418) (not bm!5414) (not bm!5430))
(check-sat b_and!4085 b_and!4087 (not b_next!2053) (not b_next!2055))
