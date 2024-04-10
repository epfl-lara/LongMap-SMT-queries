; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9214 () Bool)

(assert start!9214)

(declare-fun b!65704 () Bool)

(declare-fun b_free!2045 () Bool)

(declare-fun b_next!2045 () Bool)

(assert (=> b!65704 (= b_free!2045 (not b_next!2045))))

(declare-fun tp!8286 () Bool)

(declare-fun b_and!4043 () Bool)

(assert (=> b!65704 (= tp!8286 b_and!4043)))

(declare-fun b!65708 () Bool)

(declare-fun b_free!2047 () Bool)

(declare-fun b_next!2047 () Bool)

(assert (=> b!65708 (= b_free!2047 (not b_next!2047))))

(declare-fun tp!8284 () Bool)

(declare-fun b_and!4045 () Bool)

(assert (=> b!65708 (= tp!8284 b_and!4045)))

(declare-fun b!65696 () Bool)

(declare-fun e!43063 () Bool)

(declare-fun e!43068 () Bool)

(assert (=> b!65696 (= e!43063 e!43068)))

(declare-fun b!65697 () Bool)

(declare-datatypes ((Unit!1817 0))(
  ( (Unit!1818) )
))
(declare-fun e!43064 () Unit!1817)

(declare-fun Unit!1819 () Unit!1817)

(assert (=> b!65697 (= e!43064 Unit!1819)))

(declare-fun mapNonEmpty!3035 () Bool)

(declare-fun mapRes!3036 () Bool)

(declare-fun tp!8283 () Bool)

(declare-fun e!43066 () Bool)

(assert (=> mapNonEmpty!3035 (= mapRes!3036 (and tp!8283 e!43066))))

(declare-datatypes ((V!2899 0))(
  ( (V!2900 (val!1264 Int)) )
))
(declare-datatypes ((ValueCell!876 0))(
  ( (ValueCellFull!876 (v!2464 V!2899)) (EmptyCell!876) )
))
(declare-fun mapValue!3036 () ValueCell!876)

(declare-datatypes ((array!3815 0))(
  ( (array!3816 (arr!1823 (Array (_ BitVec 32) (_ BitVec 64))) (size!2058 (_ BitVec 32))) )
))
(declare-datatypes ((array!3817 0))(
  ( (array!3818 (arr!1824 (Array (_ BitVec 32) ValueCell!876)) (size!2059 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!660 0))(
  ( (LongMapFixedSize!661 (defaultEntry!2138 Int) (mask!6068 (_ BitVec 32)) (extraKeys!2009 (_ BitVec 32)) (zeroValue!2046 V!2899) (minValue!2046 V!2899) (_size!379 (_ BitVec 32)) (_keys!3778 array!3815) (_values!2121 array!3817) (_vacant!379 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!468 0))(
  ( (Cell!469 (v!2465 LongMapFixedSize!660)) )
))
(declare-datatypes ((LongMap!468 0))(
  ( (LongMap!469 (underlying!245 Cell!468)) )
))
(declare-fun thiss!992 () LongMap!468)

(declare-fun mapKey!3036 () (_ BitVec 32))

(declare-fun mapRest!3035 () (Array (_ BitVec 32) ValueCell!876))

(assert (=> mapNonEmpty!3035 (= (arr!1824 (_values!2121 (v!2465 (underlying!245 thiss!992)))) (store mapRest!3035 mapKey!3036 mapValue!3036))))

(declare-fun b!65698 () Bool)

(declare-fun e!43065 () Bool)

(declare-fun tp_is_empty!2439 () Bool)

(assert (=> b!65698 (= e!43065 tp_is_empty!2439)))

(declare-fun b!65699 () Bool)

(declare-fun res!35698 () Bool)

(declare-fun e!43067 () Bool)

(assert (=> b!65699 (=> (not res!35698) (not e!43067))))

(declare-fun newMap!16 () LongMapFixedSize!660)

(declare-fun valid!273 (LongMapFixedSize!660) Bool)

(assert (=> b!65699 (= res!35698 (valid!273 newMap!16))))

(declare-fun b!65700 () Bool)

(declare-fun e!43056 () Bool)

(assert (=> b!65700 (= e!43056 false)))

(declare-datatypes ((tuple2!2074 0))(
  ( (tuple2!2075 (_1!1048 (_ BitVec 64)) (_2!1048 V!2899)) )
))
(declare-datatypes ((List!1457 0))(
  ( (Nil!1454) (Cons!1453 (h!2037 tuple2!2074) (t!4915 List!1457)) )
))
(declare-datatypes ((ListLongMap!1393 0))(
  ( (ListLongMap!1394 (toList!712 List!1457)) )
))
(declare-fun lt!28206 () ListLongMap!1393)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!50 (array!3815 array!3817 (_ BitVec 32) (_ BitVec 32) V!2899 V!2899 (_ BitVec 32) Int) ListLongMap!1393)

(assert (=> b!65700 (= lt!28206 (getCurrentListMapNoExtraKeys!50 (_keys!3778 (v!2465 (underlying!245 thiss!992))) (_values!2121 (v!2465 (underlying!245 thiss!992))) (mask!6068 (v!2465 (underlying!245 thiss!992))) (extraKeys!2009 (v!2465 (underlying!245 thiss!992))) (zeroValue!2046 (v!2465 (underlying!245 thiss!992))) (minValue!2046 (v!2465 (underlying!245 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2138 (v!2465 (underlying!245 thiss!992)))))))

(declare-fun b!65701 () Bool)

(declare-fun e!43059 () Bool)

(assert (=> b!65701 (= e!43068 e!43059)))

(declare-fun b!65702 () Bool)

(declare-fun e!43057 () Bool)

(assert (=> b!65702 (= e!43057 e!43056)))

(declare-fun res!35701 () Bool)

(assert (=> b!65702 (=> (not res!35701) (not e!43056))))

(declare-datatypes ((tuple2!2076 0))(
  ( (tuple2!2077 (_1!1049 Bool) (_2!1049 LongMapFixedSize!660)) )
))
(declare-fun lt!28205 () tuple2!2076)

(assert (=> b!65702 (= res!35701 (and (_1!1049 lt!28205) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!28204 () Unit!1817)

(assert (=> b!65702 (= lt!28204 e!43064)))

(declare-fun lt!28199 () ListLongMap!1393)

(declare-fun c!9029 () Bool)

(declare-fun contains!704 (ListLongMap!1393 (_ BitVec 64)) Bool)

(assert (=> b!65702 (= c!9029 (contains!704 lt!28199 (select (arr!1823 (_keys!3778 (v!2465 (underlying!245 thiss!992)))) from!355)))))

(declare-fun update!85 (LongMapFixedSize!660 (_ BitVec 64) V!2899) tuple2!2076)

(declare-fun get!1107 (ValueCell!876 V!2899) V!2899)

(declare-fun dynLambda!316 (Int (_ BitVec 64)) V!2899)

(assert (=> b!65702 (= lt!28205 (update!85 newMap!16 (select (arr!1823 (_keys!3778 (v!2465 (underlying!245 thiss!992)))) from!355) (get!1107 (select (arr!1824 (_values!2121 (v!2465 (underlying!245 thiss!992)))) from!355) (dynLambda!316 (defaultEntry!2138 (v!2465 (underlying!245 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!65703 () Bool)

(declare-fun res!35699 () Bool)

(assert (=> b!65703 (=> (not res!35699) (not e!43067))))

(assert (=> b!65703 (= res!35699 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6068 newMap!16)) (_size!379 (v!2465 (underlying!245 thiss!992)))))))

(declare-fun mapIsEmpty!3035 () Bool)

(assert (=> mapIsEmpty!3035 mapRes!3036))

(declare-fun e!43058 () Bool)

(declare-fun array_inv!1123 (array!3815) Bool)

(declare-fun array_inv!1124 (array!3817) Bool)

(assert (=> b!65704 (= e!43059 (and tp!8286 tp_is_empty!2439 (array_inv!1123 (_keys!3778 (v!2465 (underlying!245 thiss!992)))) (array_inv!1124 (_values!2121 (v!2465 (underlying!245 thiss!992)))) e!43058))))

(declare-fun b!65705 () Bool)

(assert (=> b!65705 (= e!43066 tp_is_empty!2439)))

(declare-fun b!65706 () Bool)

(declare-fun Unit!1820 () Unit!1817)

(assert (=> b!65706 (= e!43064 Unit!1820)))

(declare-fun lt!28202 () Unit!1817)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!41 (array!3815 array!3817 (_ BitVec 32) (_ BitVec 32) V!2899 V!2899 (_ BitVec 64) (_ BitVec 32) Int) Unit!1817)

(assert (=> b!65706 (= lt!28202 (lemmaListMapContainsThenArrayContainsFrom!41 (_keys!3778 (v!2465 (underlying!245 thiss!992))) (_values!2121 (v!2465 (underlying!245 thiss!992))) (mask!6068 (v!2465 (underlying!245 thiss!992))) (extraKeys!2009 (v!2465 (underlying!245 thiss!992))) (zeroValue!2046 (v!2465 (underlying!245 thiss!992))) (minValue!2046 (v!2465 (underlying!245 thiss!992))) (select (arr!1823 (_keys!3778 (v!2465 (underlying!245 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2138 (v!2465 (underlying!245 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!65706 (arrayContainsKey!0 (_keys!3778 (v!2465 (underlying!245 thiss!992))) (select (arr!1823 (_keys!3778 (v!2465 (underlying!245 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!28203 () Unit!1817)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3815 (_ BitVec 32) (_ BitVec 32)) Unit!1817)

(assert (=> b!65706 (= lt!28203 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3778 (v!2465 (underlying!245 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1458 0))(
  ( (Nil!1455) (Cons!1454 (h!2038 (_ BitVec 64)) (t!4916 List!1458)) )
))
(declare-fun arrayNoDuplicates!0 (array!3815 (_ BitVec 32) List!1458) Bool)

(assert (=> b!65706 (arrayNoDuplicates!0 (_keys!3778 (v!2465 (underlying!245 thiss!992))) from!355 Nil!1455)))

(declare-fun lt!28200 () Unit!1817)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3815 (_ BitVec 32) (_ BitVec 64) List!1458) Unit!1817)

(assert (=> b!65706 (= lt!28200 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3778 (v!2465 (underlying!245 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1823 (_keys!3778 (v!2465 (underlying!245 thiss!992)))) from!355) (Cons!1454 (select (arr!1823 (_keys!3778 (v!2465 (underlying!245 thiss!992)))) from!355) Nil!1455)))))

(assert (=> b!65706 false))

(declare-fun b!65707 () Bool)

(declare-fun e!43060 () Bool)

(assert (=> b!65707 (= e!43058 (and e!43060 mapRes!3036))))

(declare-fun condMapEmpty!3035 () Bool)

(declare-fun mapDefault!3036 () ValueCell!876)

(assert (=> b!65707 (= condMapEmpty!3035 (= (arr!1824 (_values!2121 (v!2465 (underlying!245 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!876)) mapDefault!3036)))))

(declare-fun res!35700 () Bool)

(assert (=> start!9214 (=> (not res!35700) (not e!43067))))

(declare-fun valid!274 (LongMap!468) Bool)

(assert (=> start!9214 (= res!35700 (valid!274 thiss!992))))

(assert (=> start!9214 e!43067))

(assert (=> start!9214 e!43063))

(assert (=> start!9214 true))

(declare-fun e!43054 () Bool)

(assert (=> start!9214 e!43054))

(declare-fun mapNonEmpty!3036 () Bool)

(declare-fun mapRes!3035 () Bool)

(declare-fun tp!8285 () Bool)

(declare-fun e!43062 () Bool)

(assert (=> mapNonEmpty!3036 (= mapRes!3035 (and tp!8285 e!43062))))

(declare-fun mapRest!3036 () (Array (_ BitVec 32) ValueCell!876))

(declare-fun mapValue!3035 () ValueCell!876)

(declare-fun mapKey!3035 () (_ BitVec 32))

(assert (=> mapNonEmpty!3036 (= (arr!1824 (_values!2121 newMap!16)) (store mapRest!3036 mapKey!3035 mapValue!3035))))

(declare-fun e!43061 () Bool)

(assert (=> b!65708 (= e!43054 (and tp!8284 tp_is_empty!2439 (array_inv!1123 (_keys!3778 newMap!16)) (array_inv!1124 (_values!2121 newMap!16)) e!43061))))

(declare-fun mapIsEmpty!3036 () Bool)

(assert (=> mapIsEmpty!3036 mapRes!3035))

(declare-fun b!65709 () Bool)

(assert (=> b!65709 (= e!43060 tp_is_empty!2439)))

(declare-fun b!65710 () Bool)

(assert (=> b!65710 (= e!43061 (and e!43065 mapRes!3035))))

(declare-fun condMapEmpty!3036 () Bool)

(declare-fun mapDefault!3035 () ValueCell!876)

(assert (=> b!65710 (= condMapEmpty!3036 (= (arr!1824 (_values!2121 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!876)) mapDefault!3035)))))

(declare-fun b!65711 () Bool)

(assert (=> b!65711 (= e!43062 tp_is_empty!2439)))

(declare-fun b!65712 () Bool)

(assert (=> b!65712 (= e!43067 e!43057)))

(declare-fun res!35697 () Bool)

(assert (=> b!65712 (=> (not res!35697) (not e!43057))))

(declare-fun lt!28201 () ListLongMap!1393)

(assert (=> b!65712 (= res!35697 (and (= lt!28201 lt!28199) (not (= (select (arr!1823 (_keys!3778 (v!2465 (underlying!245 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1823 (_keys!3778 (v!2465 (underlying!245 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1129 (LongMapFixedSize!660) ListLongMap!1393)

(assert (=> b!65712 (= lt!28199 (map!1129 newMap!16))))

(declare-fun getCurrentListMap!412 (array!3815 array!3817 (_ BitVec 32) (_ BitVec 32) V!2899 V!2899 (_ BitVec 32) Int) ListLongMap!1393)

(assert (=> b!65712 (= lt!28201 (getCurrentListMap!412 (_keys!3778 (v!2465 (underlying!245 thiss!992))) (_values!2121 (v!2465 (underlying!245 thiss!992))) (mask!6068 (v!2465 (underlying!245 thiss!992))) (extraKeys!2009 (v!2465 (underlying!245 thiss!992))) (zeroValue!2046 (v!2465 (underlying!245 thiss!992))) (minValue!2046 (v!2465 (underlying!245 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2138 (v!2465 (underlying!245 thiss!992)))))))

(declare-fun b!65713 () Bool)

(declare-fun res!35702 () Bool)

(assert (=> b!65713 (=> (not res!35702) (not e!43067))))

(assert (=> b!65713 (= res!35702 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2058 (_keys!3778 (v!2465 (underlying!245 thiss!992)))))))))

(assert (= (and start!9214 res!35700) b!65713))

(assert (= (and b!65713 res!35702) b!65699))

(assert (= (and b!65699 res!35698) b!65703))

(assert (= (and b!65703 res!35699) b!65712))

(assert (= (and b!65712 res!35697) b!65702))

(assert (= (and b!65702 c!9029) b!65706))

(assert (= (and b!65702 (not c!9029)) b!65697))

(assert (= (and b!65702 res!35701) b!65700))

(assert (= (and b!65707 condMapEmpty!3035) mapIsEmpty!3035))

(assert (= (and b!65707 (not condMapEmpty!3035)) mapNonEmpty!3035))

(get-info :version)

(assert (= (and mapNonEmpty!3035 ((_ is ValueCellFull!876) mapValue!3036)) b!65705))

(assert (= (and b!65707 ((_ is ValueCellFull!876) mapDefault!3036)) b!65709))

(assert (= b!65704 b!65707))

(assert (= b!65701 b!65704))

(assert (= b!65696 b!65701))

(assert (= start!9214 b!65696))

(assert (= (and b!65710 condMapEmpty!3036) mapIsEmpty!3036))

(assert (= (and b!65710 (not condMapEmpty!3036)) mapNonEmpty!3036))

(assert (= (and mapNonEmpty!3036 ((_ is ValueCellFull!876) mapValue!3035)) b!65711))

(assert (= (and b!65710 ((_ is ValueCellFull!876) mapDefault!3035)) b!65698))

(assert (= b!65708 b!65710))

(assert (= start!9214 b!65708))

(declare-fun b_lambda!2949 () Bool)

(assert (=> (not b_lambda!2949) (not b!65702)))

(declare-fun t!4912 () Bool)

(declare-fun tb!1433 () Bool)

(assert (=> (and b!65704 (= (defaultEntry!2138 (v!2465 (underlying!245 thiss!992))) (defaultEntry!2138 (v!2465 (underlying!245 thiss!992)))) t!4912) tb!1433))

(declare-fun result!2539 () Bool)

(assert (=> tb!1433 (= result!2539 tp_is_empty!2439)))

(assert (=> b!65702 t!4912))

(declare-fun b_and!4047 () Bool)

(assert (= b_and!4043 (and (=> t!4912 result!2539) b_and!4047)))

(declare-fun t!4914 () Bool)

(declare-fun tb!1435 () Bool)

(assert (=> (and b!65708 (= (defaultEntry!2138 newMap!16) (defaultEntry!2138 (v!2465 (underlying!245 thiss!992)))) t!4914) tb!1435))

(declare-fun result!2543 () Bool)

(assert (= result!2543 result!2539))

(assert (=> b!65702 t!4914))

(declare-fun b_and!4049 () Bool)

(assert (= b_and!4045 (and (=> t!4914 result!2543) b_and!4049)))

(declare-fun m!60523 () Bool)

(assert (=> mapNonEmpty!3035 m!60523))

(declare-fun m!60525 () Bool)

(assert (=> b!65704 m!60525))

(declare-fun m!60527 () Bool)

(assert (=> b!65704 m!60527))

(declare-fun m!60529 () Bool)

(assert (=> b!65700 m!60529))

(declare-fun m!60531 () Bool)

(assert (=> start!9214 m!60531))

(declare-fun m!60533 () Bool)

(assert (=> mapNonEmpty!3036 m!60533))

(declare-fun m!60535 () Bool)

(assert (=> b!65706 m!60535))

(declare-fun m!60537 () Bool)

(assert (=> b!65706 m!60537))

(declare-fun m!60539 () Bool)

(assert (=> b!65706 m!60539))

(declare-fun m!60541 () Bool)

(assert (=> b!65706 m!60541))

(assert (=> b!65706 m!60539))

(assert (=> b!65706 m!60539))

(declare-fun m!60543 () Bool)

(assert (=> b!65706 m!60543))

(assert (=> b!65706 m!60539))

(declare-fun m!60545 () Bool)

(assert (=> b!65706 m!60545))

(declare-fun m!60547 () Bool)

(assert (=> b!65699 m!60547))

(assert (=> b!65712 m!60539))

(declare-fun m!60549 () Bool)

(assert (=> b!65712 m!60549))

(declare-fun m!60551 () Bool)

(assert (=> b!65712 m!60551))

(declare-fun m!60553 () Bool)

(assert (=> b!65708 m!60553))

(declare-fun m!60555 () Bool)

(assert (=> b!65708 m!60555))

(declare-fun m!60557 () Bool)

(assert (=> b!65702 m!60557))

(declare-fun m!60559 () Bool)

(assert (=> b!65702 m!60559))

(declare-fun m!60561 () Bool)

(assert (=> b!65702 m!60561))

(assert (=> b!65702 m!60539))

(assert (=> b!65702 m!60539))

(assert (=> b!65702 m!60561))

(declare-fun m!60563 () Bool)

(assert (=> b!65702 m!60563))

(assert (=> b!65702 m!60557))

(assert (=> b!65702 m!60539))

(declare-fun m!60565 () Bool)

(assert (=> b!65702 m!60565))

(assert (=> b!65702 m!60559))

(check-sat (not b!65699) (not b!65708) (not mapNonEmpty!3036) (not b!65712) (not start!9214) tp_is_empty!2439 b_and!4049 (not mapNonEmpty!3035) (not b!65704) (not b!65700) (not b_next!2045) (not b_lambda!2949) (not b!65706) (not b_next!2047) b_and!4047 (not b!65702))
(check-sat b_and!4047 b_and!4049 (not b_next!2045) (not b_next!2047))
