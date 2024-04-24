; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8244 () Bool)

(assert start!8244)

(declare-fun b!52248 () Bool)

(declare-fun b_free!1645 () Bool)

(declare-fun b_next!1645 () Bool)

(assert (=> b!52248 (= b_free!1645 (not b_next!1645))))

(declare-fun tp!7036 () Bool)

(declare-fun b_and!2853 () Bool)

(assert (=> b!52248 (= tp!7036 b_and!2853)))

(declare-fun b!52244 () Bool)

(declare-fun b_free!1647 () Bool)

(declare-fun b_next!1647 () Bool)

(assert (=> b!52244 (= b_free!1647 (not b_next!1647))))

(declare-fun tp!7035 () Bool)

(declare-fun b_and!2855 () Bool)

(assert (=> b!52244 (= tp!7035 b_and!2855)))

(declare-fun mapNonEmpty!2387 () Bool)

(declare-fun mapRes!2388 () Bool)

(declare-fun tp!7038 () Bool)

(declare-fun e!33985 () Bool)

(assert (=> mapNonEmpty!2387 (= mapRes!2388 (and tp!7038 e!33985))))

(declare-datatypes ((V!2633 0))(
  ( (V!2634 (val!1164 Int)) )
))
(declare-datatypes ((ValueCell!776 0))(
  ( (ValueCellFull!776 (v!2217 V!2633)) (EmptyCell!776) )
))
(declare-fun mapValue!2387 () ValueCell!776)

(declare-datatypes ((array!3387 0))(
  ( (array!3388 (arr!1616 (Array (_ BitVec 32) (_ BitVec 64))) (size!1845 (_ BitVec 32))) )
))
(declare-datatypes ((array!3389 0))(
  ( (array!3390 (arr!1617 (Array (_ BitVec 32) ValueCell!776)) (size!1846 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!460 0))(
  ( (LongMapFixedSize!461 (defaultEntry!1944 Int) (mask!5767 (_ BitVec 32)) (extraKeys!1835 (_ BitVec 32)) (zeroValue!1862 V!2633) (minValue!1862 V!2633) (_size!279 (_ BitVec 32)) (_keys!3564 array!3387) (_values!1927 array!3389) (_vacant!279 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!460)

(declare-fun mapRest!2388 () (Array (_ BitVec 32) ValueCell!776))

(declare-fun mapKey!2387 () (_ BitVec 32))

(assert (=> mapNonEmpty!2387 (= (arr!1617 (_values!1927 newMap!16)) (store mapRest!2388 mapKey!2387 mapValue!2387))))

(declare-fun res!29741 () Bool)

(declare-fun e!33979 () Bool)

(assert (=> start!8244 (=> (not res!29741) (not e!33979))))

(declare-datatypes ((Cell!280 0))(
  ( (Cell!281 (v!2218 LongMapFixedSize!460)) )
))
(declare-datatypes ((LongMap!280 0))(
  ( (LongMap!281 (underlying!151 Cell!280)) )
))
(declare-fun thiss!992 () LongMap!280)

(declare-fun valid!173 (LongMap!280) Bool)

(assert (=> start!8244 (= res!29741 (valid!173 thiss!992))))

(assert (=> start!8244 e!33979))

(declare-fun e!33980 () Bool)

(assert (=> start!8244 e!33980))

(assert (=> start!8244 true))

(declare-fun e!33983 () Bool)

(assert (=> start!8244 e!33983))

(declare-fun b!52237 () Bool)

(assert (=> b!52237 (= e!33979 false)))

(declare-datatypes ((tuple2!1826 0))(
  ( (tuple2!1827 (_1!924 (_ BitVec 64)) (_2!924 V!2633)) )
))
(declare-datatypes ((List!1322 0))(
  ( (Nil!1319) (Cons!1318 (h!1898 tuple2!1826) (t!4356 List!1322)) )
))
(declare-datatypes ((ListLongMap!1235 0))(
  ( (ListLongMap!1236 (toList!633 List!1322)) )
))
(declare-fun lt!21221 () ListLongMap!1235)

(declare-fun map!1009 (LongMapFixedSize!460) ListLongMap!1235)

(assert (=> b!52237 (= lt!21221 (map!1009 newMap!16))))

(declare-fun lt!21220 () ListLongMap!1235)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!341 (array!3387 array!3389 (_ BitVec 32) (_ BitVec 32) V!2633 V!2633 (_ BitVec 32) Int) ListLongMap!1235)

(assert (=> b!52237 (= lt!21220 (getCurrentListMap!341 (_keys!3564 (v!2218 (underlying!151 thiss!992))) (_values!1927 (v!2218 (underlying!151 thiss!992))) (mask!5767 (v!2218 (underlying!151 thiss!992))) (extraKeys!1835 (v!2218 (underlying!151 thiss!992))) (zeroValue!1862 (v!2218 (underlying!151 thiss!992))) (minValue!1862 (v!2218 (underlying!151 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1944 (v!2218 (underlying!151 thiss!992)))))))

(declare-fun b!52238 () Bool)

(declare-fun res!29740 () Bool)

(assert (=> b!52238 (=> (not res!29740) (not e!33979))))

(assert (=> b!52238 (= res!29740 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1845 (_keys!3564 (v!2218 (underlying!151 thiss!992)))))))))

(declare-fun mapNonEmpty!2388 () Bool)

(declare-fun mapRes!2387 () Bool)

(declare-fun tp!7037 () Bool)

(declare-fun e!33973 () Bool)

(assert (=> mapNonEmpty!2388 (= mapRes!2387 (and tp!7037 e!33973))))

(declare-fun mapRest!2387 () (Array (_ BitVec 32) ValueCell!776))

(declare-fun mapValue!2388 () ValueCell!776)

(declare-fun mapKey!2388 () (_ BitVec 32))

(assert (=> mapNonEmpty!2388 (= (arr!1617 (_values!1927 (v!2218 (underlying!151 thiss!992)))) (store mapRest!2387 mapKey!2388 mapValue!2388))))

(declare-fun b!52239 () Bool)

(declare-fun e!33981 () Bool)

(declare-fun tp_is_empty!2239 () Bool)

(assert (=> b!52239 (= e!33981 tp_is_empty!2239)))

(declare-fun b!52240 () Bool)

(declare-fun e!33975 () Bool)

(assert (=> b!52240 (= e!33980 e!33975)))

(declare-fun mapIsEmpty!2387 () Bool)

(assert (=> mapIsEmpty!2387 mapRes!2388))

(declare-fun b!52241 () Bool)

(declare-fun e!33974 () Bool)

(assert (=> b!52241 (= e!33975 e!33974)))

(declare-fun b!52242 () Bool)

(declare-fun e!33976 () Bool)

(assert (=> b!52242 (= e!33976 (and e!33981 mapRes!2387))))

(declare-fun condMapEmpty!2388 () Bool)

(declare-fun mapDefault!2387 () ValueCell!776)

(assert (=> b!52242 (= condMapEmpty!2388 (= (arr!1617 (_values!1927 (v!2218 (underlying!151 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!776)) mapDefault!2387)))))

(declare-fun b!52243 () Bool)

(assert (=> b!52243 (= e!33973 tp_is_empty!2239)))

(declare-fun e!33984 () Bool)

(declare-fun array_inv!975 (array!3387) Bool)

(declare-fun array_inv!976 (array!3389) Bool)

(assert (=> b!52244 (= e!33983 (and tp!7035 tp_is_empty!2239 (array_inv!975 (_keys!3564 newMap!16)) (array_inv!976 (_values!1927 newMap!16)) e!33984))))

(declare-fun b!52245 () Bool)

(declare-fun res!29742 () Bool)

(assert (=> b!52245 (=> (not res!29742) (not e!33979))))

(declare-fun valid!174 (LongMapFixedSize!460) Bool)

(assert (=> b!52245 (= res!29742 (valid!174 newMap!16))))

(declare-fun b!52246 () Bool)

(declare-fun e!33977 () Bool)

(assert (=> b!52246 (= e!33977 tp_is_empty!2239)))

(declare-fun b!52247 () Bool)

(assert (=> b!52247 (= e!33985 tp_is_empty!2239)))

(assert (=> b!52248 (= e!33974 (and tp!7036 tp_is_empty!2239 (array_inv!975 (_keys!3564 (v!2218 (underlying!151 thiss!992)))) (array_inv!976 (_values!1927 (v!2218 (underlying!151 thiss!992)))) e!33976))))

(declare-fun mapIsEmpty!2388 () Bool)

(assert (=> mapIsEmpty!2388 mapRes!2387))

(declare-fun b!52249 () Bool)

(assert (=> b!52249 (= e!33984 (and e!33977 mapRes!2388))))

(declare-fun condMapEmpty!2387 () Bool)

(declare-fun mapDefault!2388 () ValueCell!776)

(assert (=> b!52249 (= condMapEmpty!2387 (= (arr!1617 (_values!1927 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!776)) mapDefault!2388)))))

(declare-fun b!52250 () Bool)

(declare-fun res!29743 () Bool)

(assert (=> b!52250 (=> (not res!29743) (not e!33979))))

(assert (=> b!52250 (= res!29743 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5767 newMap!16)) (_size!279 (v!2218 (underlying!151 thiss!992)))))))

(assert (= (and start!8244 res!29741) b!52238))

(assert (= (and b!52238 res!29740) b!52245))

(assert (= (and b!52245 res!29742) b!52250))

(assert (= (and b!52250 res!29743) b!52237))

(assert (= (and b!52242 condMapEmpty!2388) mapIsEmpty!2388))

(assert (= (and b!52242 (not condMapEmpty!2388)) mapNonEmpty!2388))

(get-info :version)

(assert (= (and mapNonEmpty!2388 ((_ is ValueCellFull!776) mapValue!2388)) b!52243))

(assert (= (and b!52242 ((_ is ValueCellFull!776) mapDefault!2387)) b!52239))

(assert (= b!52248 b!52242))

(assert (= b!52241 b!52248))

(assert (= b!52240 b!52241))

(assert (= start!8244 b!52240))

(assert (= (and b!52249 condMapEmpty!2387) mapIsEmpty!2387))

(assert (= (and b!52249 (not condMapEmpty!2387)) mapNonEmpty!2387))

(assert (= (and mapNonEmpty!2387 ((_ is ValueCellFull!776) mapValue!2387)) b!52247))

(assert (= (and b!52249 ((_ is ValueCellFull!776) mapDefault!2388)) b!52246))

(assert (= b!52244 b!52249))

(assert (= start!8244 b!52244))

(declare-fun m!44641 () Bool)

(assert (=> b!52245 m!44641))

(declare-fun m!44643 () Bool)

(assert (=> b!52244 m!44643))

(declare-fun m!44645 () Bool)

(assert (=> b!52244 m!44645))

(declare-fun m!44647 () Bool)

(assert (=> start!8244 m!44647))

(declare-fun m!44649 () Bool)

(assert (=> b!52248 m!44649))

(declare-fun m!44651 () Bool)

(assert (=> b!52248 m!44651))

(declare-fun m!44653 () Bool)

(assert (=> mapNonEmpty!2387 m!44653))

(declare-fun m!44655 () Bool)

(assert (=> b!52237 m!44655))

(declare-fun m!44657 () Bool)

(assert (=> b!52237 m!44657))

(declare-fun m!44659 () Bool)

(assert (=> mapNonEmpty!2388 m!44659))

(check-sat (not b!52248) b_and!2855 (not b_next!1645) (not b!52245) (not b!52244) (not start!8244) tp_is_empty!2239 (not mapNonEmpty!2387) (not mapNonEmpty!2388) (not b_next!1647) (not b!52237) b_and!2853)
(check-sat b_and!2853 b_and!2855 (not b_next!1645) (not b_next!1647))
