; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13428 () Bool)

(assert start!13428)

(declare-fun b!122950 () Bool)

(declare-fun b_free!2789 () Bool)

(declare-fun b_next!2789 () Bool)

(assert (=> b!122950 (= b_free!2789 (not b_next!2789))))

(declare-fun tp!10756 () Bool)

(declare-fun b_and!7543 () Bool)

(assert (=> b!122950 (= tp!10756 b_and!7543)))

(declare-fun b!122951 () Bool)

(declare-fun b_free!2791 () Bool)

(declare-fun b_next!2791 () Bool)

(assert (=> b!122951 (= b_free!2791 (not b_next!2791))))

(declare-fun tp!10754 () Bool)

(declare-fun b_and!7545 () Bool)

(assert (=> b!122951 (= tp!10754 b_and!7545)))

(declare-fun mapIsEmpty!4389 () Bool)

(declare-fun mapRes!4389 () Bool)

(assert (=> mapIsEmpty!4389 mapRes!4389))

(declare-fun b!122949 () Bool)

(declare-fun res!59767 () Bool)

(declare-fun e!80301 () Bool)

(assert (=> b!122949 (=> (not res!59767) (not e!80301))))

(declare-datatypes ((V!3395 0))(
  ( (V!3396 (val!1450 Int)) )
))
(declare-datatypes ((array!4633 0))(
  ( (array!4634 (arr!2195 (Array (_ BitVec 32) (_ BitVec 64))) (size!2457 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1062 0))(
  ( (ValueCellFull!1062 (v!3079 V!3395)) (EmptyCell!1062) )
))
(declare-datatypes ((array!4635 0))(
  ( (array!4636 (arr!2196 (Array (_ BitVec 32) ValueCell!1062)) (size!2458 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1032 0))(
  ( (LongMapFixedSize!1033 (defaultEntry!2749 Int) (mask!6983 (_ BitVec 32)) (extraKeys!2534 (_ BitVec 32)) (zeroValue!2614 V!3395) (minValue!2614 V!3395) (_size!565 (_ BitVec 32)) (_keys!4476 array!4633) (_values!2732 array!4635) (_vacant!565 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1032)

(declare-datatypes ((Cell!828 0))(
  ( (Cell!829 (v!3080 LongMapFixedSize!1032)) )
))
(declare-datatypes ((LongMap!828 0))(
  ( (LongMap!829 (underlying!425 Cell!828)) )
))
(declare-fun thiss!992 () LongMap!828)

(assert (=> b!122949 (= res!59767 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6983 newMap!16)) (_size!565 (v!3080 (underlying!425 thiss!992)))))))

(declare-fun res!59768 () Bool)

(assert (=> start!13428 (=> (not res!59768) (not e!80301))))

(declare-fun valid!490 (LongMap!828) Bool)

(assert (=> start!13428 (= res!59768 (valid!490 thiss!992))))

(assert (=> start!13428 e!80301))

(declare-fun e!80306 () Bool)

(assert (=> start!13428 e!80306))

(assert (=> start!13428 true))

(declare-fun e!80310 () Bool)

(assert (=> start!13428 e!80310))

(declare-fun tp_is_empty!2811 () Bool)

(declare-fun e!80309 () Bool)

(declare-fun e!80305 () Bool)

(declare-fun array_inv!1381 (array!4633) Bool)

(declare-fun array_inv!1382 (array!4635) Bool)

(assert (=> b!122950 (= e!80305 (and tp!10756 tp_is_empty!2811 (array_inv!1381 (_keys!4476 (v!3080 (underlying!425 thiss!992)))) (array_inv!1382 (_values!2732 (v!3080 (underlying!425 thiss!992)))) e!80309))))

(declare-fun e!80304 () Bool)

(assert (=> b!122951 (= e!80310 (and tp!10754 tp_is_empty!2811 (array_inv!1381 (_keys!4476 newMap!16)) (array_inv!1382 (_values!2732 newMap!16)) e!80304))))

(declare-fun b!122952 () Bool)

(declare-fun e!80299 () Bool)

(assert (=> b!122952 (= e!80299 tp_is_empty!2811)))

(declare-fun b!122953 () Bool)

(assert (=> b!122953 (= e!80301 false)))

(declare-datatypes ((tuple2!2556 0))(
  ( (tuple2!2557 (_1!1289 (_ BitVec 64)) (_2!1289 V!3395)) )
))
(declare-datatypes ((List!1688 0))(
  ( (Nil!1685) (Cons!1684 (h!2285 tuple2!2556) (t!5987 List!1688)) )
))
(declare-datatypes ((ListLongMap!1667 0))(
  ( (ListLongMap!1668 (toList!849 List!1688)) )
))
(declare-fun lt!63351 () ListLongMap!1667)

(declare-fun map!1371 (LongMapFixedSize!1032) ListLongMap!1667)

(assert (=> b!122953 (= lt!63351 (map!1371 newMap!16))))

(declare-fun lt!63352 () ListLongMap!1667)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!530 (array!4633 array!4635 (_ BitVec 32) (_ BitVec 32) V!3395 V!3395 (_ BitVec 32) Int) ListLongMap!1667)

(assert (=> b!122953 (= lt!63352 (getCurrentListMap!530 (_keys!4476 (v!3080 (underlying!425 thiss!992))) (_values!2732 (v!3080 (underlying!425 thiss!992))) (mask!6983 (v!3080 (underlying!425 thiss!992))) (extraKeys!2534 (v!3080 (underlying!425 thiss!992))) (zeroValue!2614 (v!3080 (underlying!425 thiss!992))) (minValue!2614 (v!3080 (underlying!425 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2749 (v!3080 (underlying!425 thiss!992)))))))

(declare-fun mapNonEmpty!4389 () Bool)

(declare-fun mapRes!4390 () Bool)

(declare-fun tp!10755 () Bool)

(declare-fun e!80302 () Bool)

(assert (=> mapNonEmpty!4389 (= mapRes!4390 (and tp!10755 e!80302))))

(declare-fun mapRest!4390 () (Array (_ BitVec 32) ValueCell!1062))

(declare-fun mapValue!4389 () ValueCell!1062)

(declare-fun mapKey!4390 () (_ BitVec 32))

(assert (=> mapNonEmpty!4389 (= (arr!2196 (_values!2732 newMap!16)) (store mapRest!4390 mapKey!4390 mapValue!4389))))

(declare-fun mapIsEmpty!4390 () Bool)

(assert (=> mapIsEmpty!4390 mapRes!4390))

(declare-fun b!122954 () Bool)

(declare-fun e!80307 () Bool)

(assert (=> b!122954 (= e!80309 (and e!80307 mapRes!4389))))

(declare-fun condMapEmpty!4390 () Bool)

(declare-fun mapDefault!4390 () ValueCell!1062)

(assert (=> b!122954 (= condMapEmpty!4390 (= (arr!2196 (_values!2732 (v!3080 (underlying!425 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1062)) mapDefault!4390)))))

(declare-fun mapNonEmpty!4390 () Bool)

(declare-fun tp!10753 () Bool)

(assert (=> mapNonEmpty!4390 (= mapRes!4389 (and tp!10753 e!80299))))

(declare-fun mapKey!4389 () (_ BitVec 32))

(declare-fun mapValue!4390 () ValueCell!1062)

(declare-fun mapRest!4389 () (Array (_ BitVec 32) ValueCell!1062))

(assert (=> mapNonEmpty!4390 (= (arr!2196 (_values!2732 (v!3080 (underlying!425 thiss!992)))) (store mapRest!4389 mapKey!4389 mapValue!4390))))

(declare-fun b!122955 () Bool)

(declare-fun res!59769 () Bool)

(assert (=> b!122955 (=> (not res!59769) (not e!80301))))

(assert (=> b!122955 (= res!59769 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2457 (_keys!4476 (v!3080 (underlying!425 thiss!992)))))))))

(declare-fun b!122956 () Bool)

(declare-fun e!80300 () Bool)

(assert (=> b!122956 (= e!80300 e!80305)))

(declare-fun b!122957 () Bool)

(assert (=> b!122957 (= e!80302 tp_is_empty!2811)))

(declare-fun b!122958 () Bool)

(assert (=> b!122958 (= e!80307 tp_is_empty!2811)))

(declare-fun b!122959 () Bool)

(assert (=> b!122959 (= e!80306 e!80300)))

(declare-fun b!122960 () Bool)

(declare-fun e!80311 () Bool)

(assert (=> b!122960 (= e!80311 tp_is_empty!2811)))

(declare-fun b!122961 () Bool)

(declare-fun res!59766 () Bool)

(assert (=> b!122961 (=> (not res!59766) (not e!80301))))

(declare-fun valid!491 (LongMapFixedSize!1032) Bool)

(assert (=> b!122961 (= res!59766 (valid!491 newMap!16))))

(declare-fun b!122962 () Bool)

(assert (=> b!122962 (= e!80304 (and e!80311 mapRes!4390))))

(declare-fun condMapEmpty!4389 () Bool)

(declare-fun mapDefault!4389 () ValueCell!1062)

(assert (=> b!122962 (= condMapEmpty!4389 (= (arr!2196 (_values!2732 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1062)) mapDefault!4389)))))

(assert (= (and start!13428 res!59768) b!122955))

(assert (= (and b!122955 res!59769) b!122961))

(assert (= (and b!122961 res!59766) b!122949))

(assert (= (and b!122949 res!59767) b!122953))

(assert (= (and b!122954 condMapEmpty!4390) mapIsEmpty!4389))

(assert (= (and b!122954 (not condMapEmpty!4390)) mapNonEmpty!4390))

(get-info :version)

(assert (= (and mapNonEmpty!4390 ((_ is ValueCellFull!1062) mapValue!4390)) b!122952))

(assert (= (and b!122954 ((_ is ValueCellFull!1062) mapDefault!4390)) b!122958))

(assert (= b!122950 b!122954))

(assert (= b!122956 b!122950))

(assert (= b!122959 b!122956))

(assert (= start!13428 b!122959))

(assert (= (and b!122962 condMapEmpty!4389) mapIsEmpty!4390))

(assert (= (and b!122962 (not condMapEmpty!4389)) mapNonEmpty!4389))

(assert (= (and mapNonEmpty!4389 ((_ is ValueCellFull!1062) mapValue!4389)) b!122957))

(assert (= (and b!122962 ((_ is ValueCellFull!1062) mapDefault!4389)) b!122960))

(assert (= b!122951 b!122962))

(assert (= start!13428 b!122951))

(declare-fun m!143019 () Bool)

(assert (=> mapNonEmpty!4389 m!143019))

(declare-fun m!143021 () Bool)

(assert (=> start!13428 m!143021))

(declare-fun m!143023 () Bool)

(assert (=> b!122951 m!143023))

(declare-fun m!143025 () Bool)

(assert (=> b!122951 m!143025))

(declare-fun m!143027 () Bool)

(assert (=> b!122953 m!143027))

(declare-fun m!143029 () Bool)

(assert (=> b!122953 m!143029))

(declare-fun m!143031 () Bool)

(assert (=> mapNonEmpty!4390 m!143031))

(declare-fun m!143033 () Bool)

(assert (=> b!122950 m!143033))

(declare-fun m!143035 () Bool)

(assert (=> b!122950 m!143035))

(declare-fun m!143037 () Bool)

(assert (=> b!122961 m!143037))

(check-sat (not b!122961) tp_is_empty!2811 (not b_next!2791) (not b!122953) b_and!7545 (not mapNonEmpty!4389) (not b!122951) b_and!7543 (not start!13428) (not b_next!2789) (not mapNonEmpty!4390) (not b!122950))
(check-sat b_and!7543 b_and!7545 (not b_next!2789) (not b_next!2791))
