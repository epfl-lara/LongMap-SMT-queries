; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13436 () Bool)

(assert start!13436)

(declare-fun b!123169 () Bool)

(declare-fun b_free!2797 () Bool)

(declare-fun b_next!2797 () Bool)

(assert (=> b!123169 (= b_free!2797 (not b_next!2797))))

(declare-fun tp!10777 () Bool)

(declare-fun b_and!7545 () Bool)

(assert (=> b!123169 (= tp!10777 b_and!7545)))

(declare-fun b!123172 () Bool)

(declare-fun b_free!2799 () Bool)

(declare-fun b_next!2799 () Bool)

(assert (=> b!123172 (= b_free!2799 (not b_next!2799))))

(declare-fun tp!10780 () Bool)

(declare-fun b_and!7547 () Bool)

(assert (=> b!123172 (= tp!10780 b_and!7547)))

(declare-fun b!123160 () Bool)

(declare-fun e!80445 () Bool)

(declare-fun tp_is_empty!2815 () Bool)

(assert (=> b!123160 (= e!80445 tp_is_empty!2815)))

(declare-fun b!123161 () Bool)

(declare-fun res!59804 () Bool)

(declare-fun e!80455 () Bool)

(assert (=> b!123161 (=> (not res!59804) (not e!80455))))

(declare-datatypes ((V!3401 0))(
  ( (V!3402 (val!1452 Int)) )
))
(declare-datatypes ((array!4621 0))(
  ( (array!4622 (arr!2188 (Array (_ BitVec 32) (_ BitVec 64))) (size!2451 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1064 0))(
  ( (ValueCellFull!1064 (v!3077 V!3401)) (EmptyCell!1064) )
))
(declare-datatypes ((array!4623 0))(
  ( (array!4624 (arr!2189 (Array (_ BitVec 32) ValueCell!1064)) (size!2452 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1036 0))(
  ( (LongMapFixedSize!1037 (defaultEntry!2751 Int) (mask!6986 (_ BitVec 32)) (extraKeys!2536 (_ BitVec 32)) (zeroValue!2616 V!3401) (minValue!2616 V!3401) (_size!567 (_ BitVec 32)) (_keys!4477 array!4621) (_values!2734 array!4623) (_vacant!567 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1036)

(declare-datatypes ((Cell!824 0))(
  ( (Cell!825 (v!3078 LongMapFixedSize!1036)) )
))
(declare-datatypes ((LongMap!824 0))(
  ( (LongMap!825 (underlying!423 Cell!824)) )
))
(declare-fun thiss!992 () LongMap!824)

(assert (=> b!123161 (= res!59804 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6986 newMap!16)) (_size!567 (v!3078 (underlying!423 thiss!992)))))))

(declare-fun mapNonEmpty!4401 () Bool)

(declare-fun mapRes!4401 () Bool)

(declare-fun tp!10778 () Bool)

(declare-fun e!80453 () Bool)

(assert (=> mapNonEmpty!4401 (= mapRes!4401 (and tp!10778 e!80453))))

(declare-fun mapKey!4402 () (_ BitVec 32))

(declare-fun mapRest!4401 () (Array (_ BitVec 32) ValueCell!1064))

(declare-fun mapValue!4401 () ValueCell!1064)

(assert (=> mapNonEmpty!4401 (= (arr!2189 (_values!2734 (v!3078 (underlying!423 thiss!992)))) (store mapRest!4401 mapKey!4402 mapValue!4401))))

(declare-fun mapIsEmpty!4401 () Bool)

(assert (=> mapIsEmpty!4401 mapRes!4401))

(declare-fun b!123162 () Bool)

(declare-fun e!80444 () Bool)

(declare-fun e!80449 () Bool)

(assert (=> b!123162 (= e!80444 e!80449)))

(declare-fun b!123163 () Bool)

(assert (=> b!123163 (= e!80453 tp_is_empty!2815)))

(declare-fun b!123164 () Bool)

(declare-fun e!80447 () Bool)

(declare-fun e!80443 () Bool)

(assert (=> b!123164 (= e!80447 (and e!80443 mapRes!4401))))

(declare-fun condMapEmpty!4401 () Bool)

(declare-fun mapDefault!4401 () ValueCell!1064)

(assert (=> b!123164 (= condMapEmpty!4401 (= (arr!2189 (_values!2734 (v!3078 (underlying!423 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1064)) mapDefault!4401)))))

(declare-fun b!123165 () Bool)

(declare-fun e!80454 () Bool)

(assert (=> b!123165 (= e!80454 tp_is_empty!2815)))

(declare-fun b!123167 () Bool)

(declare-fun res!59805 () Bool)

(assert (=> b!123167 (=> (not res!59805) (not e!80455))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!123167 (= res!59805 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2451 (_keys!4477 (v!3078 (underlying!423 thiss!992)))))))))

(declare-fun b!123168 () Bool)

(declare-fun e!80451 () Bool)

(declare-fun mapRes!4402 () Bool)

(assert (=> b!123168 (= e!80451 (and e!80445 mapRes!4402))))

(declare-fun condMapEmpty!4402 () Bool)

(declare-fun mapDefault!4402 () ValueCell!1064)

(assert (=> b!123168 (= condMapEmpty!4402 (= (arr!2189 (_values!2734 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1064)) mapDefault!4402)))))

(declare-fun array_inv!1387 (array!4621) Bool)

(declare-fun array_inv!1388 (array!4623) Bool)

(assert (=> b!123169 (= e!80449 (and tp!10777 tp_is_empty!2815 (array_inv!1387 (_keys!4477 (v!3078 (underlying!423 thiss!992)))) (array_inv!1388 (_values!2734 (v!3078 (underlying!423 thiss!992)))) e!80447))))

(declare-fun b!123170 () Bool)

(declare-fun res!59803 () Bool)

(assert (=> b!123170 (=> (not res!59803) (not e!80455))))

(declare-fun valid!495 (LongMapFixedSize!1036) Bool)

(assert (=> b!123170 (= res!59803 (valid!495 newMap!16))))

(declare-fun mapNonEmpty!4402 () Bool)

(declare-fun tp!10779 () Bool)

(assert (=> mapNonEmpty!4402 (= mapRes!4402 (and tp!10779 e!80454))))

(declare-fun mapRest!4402 () (Array (_ BitVec 32) ValueCell!1064))

(declare-fun mapValue!4402 () ValueCell!1064)

(declare-fun mapKey!4401 () (_ BitVec 32))

(assert (=> mapNonEmpty!4402 (= (arr!2189 (_values!2734 newMap!16)) (store mapRest!4402 mapKey!4401 mapValue!4402))))

(declare-fun mapIsEmpty!4402 () Bool)

(assert (=> mapIsEmpty!4402 mapRes!4402))

(declare-fun b!123171 () Bool)

(assert (=> b!123171 (= e!80455 false)))

(declare-datatypes ((tuple2!2518 0))(
  ( (tuple2!2519 (_1!1270 (_ BitVec 64)) (_2!1270 V!3401)) )
))
(declare-datatypes ((List!1681 0))(
  ( (Nil!1678) (Cons!1677 (h!2278 tuple2!2518) (t!5975 List!1681)) )
))
(declare-datatypes ((ListLongMap!1631 0))(
  ( (ListLongMap!1632 (toList!831 List!1681)) )
))
(declare-fun lt!63359 () ListLongMap!1631)

(declare-fun map!1354 (LongMapFixedSize!1036) ListLongMap!1631)

(assert (=> b!123171 (= lt!63359 (map!1354 newMap!16))))

(declare-fun lt!63358 () ListLongMap!1631)

(declare-fun getCurrentListMap!502 (array!4621 array!4623 (_ BitVec 32) (_ BitVec 32) V!3401 V!3401 (_ BitVec 32) Int) ListLongMap!1631)

(assert (=> b!123171 (= lt!63358 (getCurrentListMap!502 (_keys!4477 (v!3078 (underlying!423 thiss!992))) (_values!2734 (v!3078 (underlying!423 thiss!992))) (mask!6986 (v!3078 (underlying!423 thiss!992))) (extraKeys!2536 (v!3078 (underlying!423 thiss!992))) (zeroValue!2616 (v!3078 (underlying!423 thiss!992))) (minValue!2616 (v!3078 (underlying!423 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2751 (v!3078 (underlying!423 thiss!992)))))))

(declare-fun e!80446 () Bool)

(assert (=> b!123172 (= e!80446 (and tp!10780 tp_is_empty!2815 (array_inv!1387 (_keys!4477 newMap!16)) (array_inv!1388 (_values!2734 newMap!16)) e!80451))))

(declare-fun b!123173 () Bool)

(assert (=> b!123173 (= e!80443 tp_is_empty!2815)))

(declare-fun res!59806 () Bool)

(assert (=> start!13436 (=> (not res!59806) (not e!80455))))

(declare-fun valid!496 (LongMap!824) Bool)

(assert (=> start!13436 (= res!59806 (valid!496 thiss!992))))

(assert (=> start!13436 e!80455))

(declare-fun e!80452 () Bool)

(assert (=> start!13436 e!80452))

(assert (=> start!13436 true))

(assert (=> start!13436 e!80446))

(declare-fun b!123166 () Bool)

(assert (=> b!123166 (= e!80452 e!80444)))

(assert (= (and start!13436 res!59806) b!123167))

(assert (= (and b!123167 res!59805) b!123170))

(assert (= (and b!123170 res!59803) b!123161))

(assert (= (and b!123161 res!59804) b!123171))

(assert (= (and b!123164 condMapEmpty!4401) mapIsEmpty!4401))

(assert (= (and b!123164 (not condMapEmpty!4401)) mapNonEmpty!4401))

(get-info :version)

(assert (= (and mapNonEmpty!4401 ((_ is ValueCellFull!1064) mapValue!4401)) b!123163))

(assert (= (and b!123164 ((_ is ValueCellFull!1064) mapDefault!4401)) b!123173))

(assert (= b!123169 b!123164))

(assert (= b!123162 b!123169))

(assert (= b!123166 b!123162))

(assert (= start!13436 b!123166))

(assert (= (and b!123168 condMapEmpty!4402) mapIsEmpty!4402))

(assert (= (and b!123168 (not condMapEmpty!4402)) mapNonEmpty!4402))

(assert (= (and mapNonEmpty!4402 ((_ is ValueCellFull!1064) mapValue!4402)) b!123165))

(assert (= (and b!123168 ((_ is ValueCellFull!1064) mapDefault!4402)) b!123160))

(assert (= b!123172 b!123168))

(assert (= start!13436 b!123172))

(declare-fun m!143079 () Bool)

(assert (=> start!13436 m!143079))

(declare-fun m!143081 () Bool)

(assert (=> mapNonEmpty!4402 m!143081))

(declare-fun m!143083 () Bool)

(assert (=> b!123172 m!143083))

(declare-fun m!143085 () Bool)

(assert (=> b!123172 m!143085))

(declare-fun m!143087 () Bool)

(assert (=> b!123169 m!143087))

(declare-fun m!143089 () Bool)

(assert (=> b!123169 m!143089))

(declare-fun m!143091 () Bool)

(assert (=> mapNonEmpty!4401 m!143091))

(declare-fun m!143093 () Bool)

(assert (=> b!123171 m!143093))

(declare-fun m!143095 () Bool)

(assert (=> b!123171 m!143095))

(declare-fun m!143097 () Bool)

(assert (=> b!123170 m!143097))

(check-sat (not b!123169) (not b_next!2799) (not mapNonEmpty!4401) b_and!7545 b_and!7547 tp_is_empty!2815 (not start!13436) (not b!123170) (not b!123172) (not b_next!2797) (not b!123171) (not mapNonEmpty!4402))
(check-sat b_and!7545 b_and!7547 (not b_next!2797) (not b_next!2799))
