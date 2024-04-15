; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8244 () Bool)

(assert start!8244)

(declare-fun b!52241 () Bool)

(declare-fun b_free!1645 () Bool)

(declare-fun b_next!1645 () Bool)

(assert (=> b!52241 (= b_free!1645 (not b_next!1645))))

(declare-fun tp!7035 () Bool)

(declare-fun b_and!2857 () Bool)

(assert (=> b!52241 (= tp!7035 b_and!2857)))

(declare-fun b!52238 () Bool)

(declare-fun b_free!1647 () Bool)

(declare-fun b_next!1647 () Bool)

(assert (=> b!52238 (= b_free!1647 (not b_next!1647))))

(declare-fun tp!7037 () Bool)

(declare-fun b_and!2859 () Bool)

(assert (=> b!52238 (= tp!7037 b_and!2859)))

(declare-fun mapIsEmpty!2387 () Bool)

(declare-fun mapRes!2387 () Bool)

(assert (=> mapIsEmpty!2387 mapRes!2387))

(declare-fun b!52228 () Bool)

(declare-fun e!33974 () Bool)

(assert (=> b!52228 (= e!33974 false)))

(declare-datatypes ((V!2633 0))(
  ( (V!2634 (val!1164 Int)) )
))
(declare-datatypes ((tuple2!1848 0))(
  ( (tuple2!1849 (_1!935 (_ BitVec 64)) (_2!935 V!2633)) )
))
(declare-datatypes ((List!1334 0))(
  ( (Nil!1331) (Cons!1330 (h!1910 tuple2!1848) (t!4367 List!1334)) )
))
(declare-datatypes ((ListLongMap!1251 0))(
  ( (ListLongMap!1252 (toList!641 List!1334)) )
))
(declare-fun lt!21248 () ListLongMap!1251)

(declare-datatypes ((array!3381 0))(
  ( (array!3382 (arr!1612 (Array (_ BitVec 32) (_ BitVec 64))) (size!1842 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!776 0))(
  ( (ValueCellFull!776 (v!2215 V!2633)) (EmptyCell!776) )
))
(declare-datatypes ((array!3383 0))(
  ( (array!3384 (arr!1613 (Array (_ BitVec 32) ValueCell!776)) (size!1843 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!460 0))(
  ( (LongMapFixedSize!461 (defaultEntry!1944 Int) (mask!5766 (_ BitVec 32)) (extraKeys!1835 (_ BitVec 32)) (zeroValue!1862 V!2633) (minValue!1862 V!2633) (_size!279 (_ BitVec 32)) (_keys!3563 array!3381) (_values!1927 array!3383) (_vacant!279 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!460)

(declare-fun map!1010 (LongMapFixedSize!460) ListLongMap!1251)

(assert (=> b!52228 (= lt!21248 (map!1010 newMap!16))))

(declare-fun lt!21247 () ListLongMap!1251)

(declare-datatypes ((Cell!282 0))(
  ( (Cell!283 (v!2216 LongMapFixedSize!460)) )
))
(declare-datatypes ((LongMap!282 0))(
  ( (LongMap!283 (underlying!152 Cell!282)) )
))
(declare-fun thiss!992 () LongMap!282)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!348 (array!3381 array!3383 (_ BitVec 32) (_ BitVec 32) V!2633 V!2633 (_ BitVec 32) Int) ListLongMap!1251)

(assert (=> b!52228 (= lt!21247 (getCurrentListMap!348 (_keys!3563 (v!2216 (underlying!152 thiss!992))) (_values!1927 (v!2216 (underlying!152 thiss!992))) (mask!5766 (v!2216 (underlying!152 thiss!992))) (extraKeys!1835 (v!2216 (underlying!152 thiss!992))) (zeroValue!1862 (v!2216 (underlying!152 thiss!992))) (minValue!1862 (v!2216 (underlying!152 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1944 (v!2216 (underlying!152 thiss!992)))))))

(declare-fun mapIsEmpty!2388 () Bool)

(declare-fun mapRes!2388 () Bool)

(assert (=> mapIsEmpty!2388 mapRes!2388))

(declare-fun b!52229 () Bool)

(declare-fun e!33977 () Bool)

(declare-fun tp_is_empty!2239 () Bool)

(assert (=> b!52229 (= e!33977 tp_is_empty!2239)))

(declare-fun b!52230 () Bool)

(declare-fun e!33973 () Bool)

(declare-fun e!33976 () Bool)

(assert (=> b!52230 (= e!33973 (and e!33976 mapRes!2388))))

(declare-fun condMapEmpty!2387 () Bool)

(declare-fun mapDefault!2387 () ValueCell!776)

(assert (=> b!52230 (= condMapEmpty!2387 (= (arr!1613 (_values!1927 (v!2216 (underlying!152 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!776)) mapDefault!2387)))))

(declare-fun res!29745 () Bool)

(assert (=> start!8244 (=> (not res!29745) (not e!33974))))

(declare-fun valid!173 (LongMap!282) Bool)

(assert (=> start!8244 (= res!29745 (valid!173 thiss!992))))

(assert (=> start!8244 e!33974))

(declare-fun e!33975 () Bool)

(assert (=> start!8244 e!33975))

(assert (=> start!8244 true))

(declare-fun e!33969 () Bool)

(assert (=> start!8244 e!33969))

(declare-fun b!52231 () Bool)

(assert (=> b!52231 (= e!33976 tp_is_empty!2239)))

(declare-fun mapNonEmpty!2387 () Bool)

(declare-fun tp!7036 () Bool)

(assert (=> mapNonEmpty!2387 (= mapRes!2388 (and tp!7036 e!33977))))

(declare-fun mapValue!2387 () ValueCell!776)

(declare-fun mapRest!2387 () (Array (_ BitVec 32) ValueCell!776))

(declare-fun mapKey!2387 () (_ BitVec 32))

(assert (=> mapNonEmpty!2387 (= (arr!1613 (_values!1927 (v!2216 (underlying!152 thiss!992)))) (store mapRest!2387 mapKey!2387 mapValue!2387))))

(declare-fun b!52232 () Bool)

(declare-fun e!33979 () Bool)

(declare-fun e!33968 () Bool)

(assert (=> b!52232 (= e!33979 (and e!33968 mapRes!2387))))

(declare-fun condMapEmpty!2388 () Bool)

(declare-fun mapDefault!2388 () ValueCell!776)

(assert (=> b!52232 (= condMapEmpty!2388 (= (arr!1613 (_values!1927 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!776)) mapDefault!2388)))))

(declare-fun b!52233 () Bool)

(declare-fun e!33972 () Bool)

(assert (=> b!52233 (= e!33972 tp_is_empty!2239)))

(declare-fun b!52234 () Bool)

(declare-fun res!29746 () Bool)

(assert (=> b!52234 (=> (not res!29746) (not e!33974))))

(assert (=> b!52234 (= res!29746 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1842 (_keys!3563 (v!2216 (underlying!152 thiss!992)))))))))

(declare-fun b!52235 () Bool)

(declare-fun e!33971 () Bool)

(declare-fun e!33978 () Bool)

(assert (=> b!52235 (= e!33971 e!33978)))

(declare-fun mapNonEmpty!2388 () Bool)

(declare-fun tp!7038 () Bool)

(assert (=> mapNonEmpty!2388 (= mapRes!2387 (and tp!7038 e!33972))))

(declare-fun mapValue!2388 () ValueCell!776)

(declare-fun mapKey!2388 () (_ BitVec 32))

(declare-fun mapRest!2388 () (Array (_ BitVec 32) ValueCell!776))

(assert (=> mapNonEmpty!2388 (= (arr!1613 (_values!1927 newMap!16)) (store mapRest!2388 mapKey!2388 mapValue!2388))))

(declare-fun b!52236 () Bool)

(assert (=> b!52236 (= e!33968 tp_is_empty!2239)))

(declare-fun b!52237 () Bool)

(declare-fun res!29747 () Bool)

(assert (=> b!52237 (=> (not res!29747) (not e!33974))))

(declare-fun valid!174 (LongMapFixedSize!460) Bool)

(assert (=> b!52237 (= res!29747 (valid!174 newMap!16))))

(declare-fun array_inv!985 (array!3381) Bool)

(declare-fun array_inv!986 (array!3383) Bool)

(assert (=> b!52238 (= e!33969 (and tp!7037 tp_is_empty!2239 (array_inv!985 (_keys!3563 newMap!16)) (array_inv!986 (_values!1927 newMap!16)) e!33979))))

(declare-fun b!52239 () Bool)

(assert (=> b!52239 (= e!33975 e!33971)))

(declare-fun b!52240 () Bool)

(declare-fun res!29748 () Bool)

(assert (=> b!52240 (=> (not res!29748) (not e!33974))))

(assert (=> b!52240 (= res!29748 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5766 newMap!16)) (_size!279 (v!2216 (underlying!152 thiss!992)))))))

(assert (=> b!52241 (= e!33978 (and tp!7035 tp_is_empty!2239 (array_inv!985 (_keys!3563 (v!2216 (underlying!152 thiss!992)))) (array_inv!986 (_values!1927 (v!2216 (underlying!152 thiss!992)))) e!33973))))

(assert (= (and start!8244 res!29745) b!52234))

(assert (= (and b!52234 res!29746) b!52237))

(assert (= (and b!52237 res!29747) b!52240))

(assert (= (and b!52240 res!29748) b!52228))

(assert (= (and b!52230 condMapEmpty!2387) mapIsEmpty!2388))

(assert (= (and b!52230 (not condMapEmpty!2387)) mapNonEmpty!2387))

(get-info :version)

(assert (= (and mapNonEmpty!2387 ((_ is ValueCellFull!776) mapValue!2387)) b!52229))

(assert (= (and b!52230 ((_ is ValueCellFull!776) mapDefault!2387)) b!52231))

(assert (= b!52241 b!52230))

(assert (= b!52235 b!52241))

(assert (= b!52239 b!52235))

(assert (= start!8244 b!52239))

(assert (= (and b!52232 condMapEmpty!2388) mapIsEmpty!2387))

(assert (= (and b!52232 (not condMapEmpty!2388)) mapNonEmpty!2388))

(assert (= (and mapNonEmpty!2388 ((_ is ValueCellFull!776) mapValue!2388)) b!52233))

(assert (= (and b!52232 ((_ is ValueCellFull!776) mapDefault!2388)) b!52236))

(assert (= b!52238 b!52232))

(assert (= start!8244 b!52238))

(declare-fun m!44683 () Bool)

(assert (=> mapNonEmpty!2388 m!44683))

(declare-fun m!44685 () Bool)

(assert (=> b!52238 m!44685))

(declare-fun m!44687 () Bool)

(assert (=> b!52238 m!44687))

(declare-fun m!44689 () Bool)

(assert (=> b!52237 m!44689))

(declare-fun m!44691 () Bool)

(assert (=> start!8244 m!44691))

(declare-fun m!44693 () Bool)

(assert (=> mapNonEmpty!2387 m!44693))

(declare-fun m!44695 () Bool)

(assert (=> b!52241 m!44695))

(declare-fun m!44697 () Bool)

(assert (=> b!52241 m!44697))

(declare-fun m!44699 () Bool)

(assert (=> b!52228 m!44699))

(declare-fun m!44701 () Bool)

(assert (=> b!52228 m!44701))

(check-sat (not mapNonEmpty!2387) (not b!52241) tp_is_empty!2239 (not b!52228) b_and!2859 (not b_next!1645) (not b!52237) b_and!2857 (not mapNonEmpty!2388) (not start!8244) (not b_next!1647) (not b!52238))
(check-sat b_and!2857 b_and!2859 (not b_next!1645) (not b_next!1647))
