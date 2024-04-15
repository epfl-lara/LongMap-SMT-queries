; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13442 () Bool)

(assert start!13442)

(declare-fun b!123295 () Bool)

(declare-fun b_free!2809 () Bool)

(declare-fun b_next!2809 () Bool)

(assert (=> b!123295 (= b_free!2809 (not b_next!2809))))

(declare-fun tp!10816 () Bool)

(declare-fun b_and!7557 () Bool)

(assert (=> b!123295 (= tp!10816 b_and!7557)))

(declare-fun b!123290 () Bool)

(declare-fun b_free!2811 () Bool)

(declare-fun b_next!2811 () Bool)

(assert (=> b!123290 (= b_free!2811 (not b_next!2811))))

(declare-fun tp!10815 () Bool)

(declare-fun b_and!7559 () Bool)

(assert (=> b!123290 (= tp!10815 b_and!7559)))

(declare-fun mapIsEmpty!4419 () Bool)

(declare-fun mapRes!4420 () Bool)

(assert (=> mapIsEmpty!4419 mapRes!4420))

(declare-fun b!123288 () Bool)

(declare-fun e!80565 () Bool)

(declare-fun tp_is_empty!2821 () Bool)

(assert (=> b!123288 (= e!80565 tp_is_empty!2821)))

(declare-fun b!123289 () Bool)

(declare-fun e!80561 () Bool)

(declare-fun mapRes!4419 () Bool)

(assert (=> b!123289 (= e!80561 (and e!80565 mapRes!4419))))

(declare-fun condMapEmpty!4419 () Bool)

(declare-datatypes ((V!3409 0))(
  ( (V!3410 (val!1455 Int)) )
))
(declare-datatypes ((array!4633 0))(
  ( (array!4634 (arr!2194 (Array (_ BitVec 32) (_ BitVec 64))) (size!2457 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1067 0))(
  ( (ValueCellFull!1067 (v!3083 V!3409)) (EmptyCell!1067) )
))
(declare-datatypes ((array!4635 0))(
  ( (array!4636 (arr!2195 (Array (_ BitVec 32) ValueCell!1067)) (size!2458 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1042 0))(
  ( (LongMapFixedSize!1043 (defaultEntry!2754 Int) (mask!6991 (_ BitVec 32)) (extraKeys!2539 (_ BitVec 32)) (zeroValue!2619 V!3409) (minValue!2619 V!3409) (_size!570 (_ BitVec 32)) (_keys!4480 array!4633) (_values!2737 array!4635) (_vacant!570 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!830 0))(
  ( (Cell!831 (v!3084 LongMapFixedSize!1042)) )
))
(declare-datatypes ((LongMap!830 0))(
  ( (LongMap!831 (underlying!426 Cell!830)) )
))
(declare-fun thiss!992 () LongMap!830)

(declare-fun mapDefault!4419 () ValueCell!1067)

(assert (=> b!123289 (= condMapEmpty!4419 (= (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4419)))))

(declare-fun e!80564 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1042)

(declare-fun e!80567 () Bool)

(declare-fun array_inv!1393 (array!4633) Bool)

(declare-fun array_inv!1394 (array!4635) Bool)

(assert (=> b!123290 (= e!80564 (and tp!10815 tp_is_empty!2821 (array_inv!1393 (_keys!4480 newMap!16)) (array_inv!1394 (_values!2737 newMap!16)) e!80567))))

(declare-fun b!123291 () Bool)

(declare-fun e!80570 () Bool)

(declare-fun e!80562 () Bool)

(assert (=> b!123291 (= e!80570 e!80562)))

(declare-fun b!123292 () Bool)

(declare-fun res!59844 () Bool)

(declare-fun e!80569 () Bool)

(assert (=> b!123292 (=> (not res!59844) (not e!80569))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2524 0))(
  ( (tuple2!2525 (_1!1273 (_ BitVec 64)) (_2!1273 V!3409)) )
))
(declare-datatypes ((List!1684 0))(
  ( (Nil!1681) (Cons!1680 (h!2281 tuple2!2524) (t!5978 List!1684)) )
))
(declare-datatypes ((ListLongMap!1637 0))(
  ( (ListLongMap!1638 (toList!834 List!1684)) )
))
(declare-fun getCurrentListMap!505 (array!4633 array!4635 (_ BitVec 32) (_ BitVec 32) V!3409 V!3409 (_ BitVec 32) Int) ListLongMap!1637)

(declare-fun map!1359 (LongMapFixedSize!1042) ListLongMap!1637)

(assert (=> b!123292 (= res!59844 (= (getCurrentListMap!505 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (_values!2737 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992))) (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) (minValue!2619 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992)))) (map!1359 newMap!16)))))

(declare-fun b!123293 () Bool)

(declare-fun e!80566 () Bool)

(assert (=> b!123293 (= e!80566 tp_is_empty!2821)))

(declare-fun b!123294 () Bool)

(declare-fun e!80563 () Bool)

(assert (=> b!123294 (= e!80567 (and e!80563 mapRes!4420))))

(declare-fun condMapEmpty!4420 () Bool)

(declare-fun mapDefault!4420 () ValueCell!1067)

(assert (=> b!123294 (= condMapEmpty!4420 (= (arr!2195 (_values!2737 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4420)))))

(assert (=> b!123295 (= e!80562 (and tp!10816 tp_is_empty!2821 (array_inv!1393 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (array_inv!1394 (_values!2737 (v!3084 (underlying!426 thiss!992)))) e!80561))))

(declare-fun b!123296 () Bool)

(assert (=> b!123296 (= e!80569 (bvsge from!355 (size!2458 (_values!2737 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun mapNonEmpty!4419 () Bool)

(declare-fun tp!10814 () Bool)

(declare-fun e!80560 () Bool)

(assert (=> mapNonEmpty!4419 (= mapRes!4420 (and tp!10814 e!80560))))

(declare-fun mapRest!4420 () (Array (_ BitVec 32) ValueCell!1067))

(declare-fun mapKey!4419 () (_ BitVec 32))

(declare-fun mapValue!4420 () ValueCell!1067)

(assert (=> mapNonEmpty!4419 (= (arr!2195 (_values!2737 newMap!16)) (store mapRest!4420 mapKey!4419 mapValue!4420))))

(declare-fun mapNonEmpty!4420 () Bool)

(declare-fun tp!10813 () Bool)

(assert (=> mapNonEmpty!4420 (= mapRes!4419 (and tp!10813 e!80566))))

(declare-fun mapValue!4419 () ValueCell!1067)

(declare-fun mapKey!4420 () (_ BitVec 32))

(declare-fun mapRest!4419 () (Array (_ BitVec 32) ValueCell!1067))

(assert (=> mapNonEmpty!4420 (= (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (store mapRest!4419 mapKey!4420 mapValue!4419))))

(declare-fun b!123297 () Bool)

(assert (=> b!123297 (= e!80560 tp_is_empty!2821)))

(declare-fun res!59843 () Bool)

(assert (=> start!13442 (=> (not res!59843) (not e!80569))))

(declare-fun valid!498 (LongMap!830) Bool)

(assert (=> start!13442 (= res!59843 (valid!498 thiss!992))))

(assert (=> start!13442 e!80569))

(declare-fun e!80571 () Bool)

(assert (=> start!13442 e!80571))

(assert (=> start!13442 true))

(assert (=> start!13442 e!80564))

(declare-fun b!123298 () Bool)

(declare-fun res!59845 () Bool)

(assert (=> b!123298 (=> (not res!59845) (not e!80569))))

(declare-fun valid!499 (LongMapFixedSize!1042) Bool)

(assert (=> b!123298 (= res!59845 (valid!499 newMap!16))))

(declare-fun mapIsEmpty!4420 () Bool)

(assert (=> mapIsEmpty!4420 mapRes!4419))

(declare-fun b!123299 () Bool)

(assert (=> b!123299 (= e!80563 tp_is_empty!2821)))

(declare-fun b!123300 () Bool)

(declare-fun res!59841 () Bool)

(assert (=> b!123300 (=> (not res!59841) (not e!80569))))

(assert (=> b!123300 (= res!59841 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123301 () Bool)

(declare-fun res!59842 () Bool)

(assert (=> b!123301 (=> (not res!59842) (not e!80569))))

(assert (=> b!123301 (= res!59842 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6991 newMap!16)) (_size!570 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun b!123302 () Bool)

(assert (=> b!123302 (= e!80571 e!80570)))

(assert (= (and start!13442 res!59843) b!123300))

(assert (= (and b!123300 res!59841) b!123298))

(assert (= (and b!123298 res!59845) b!123301))

(assert (= (and b!123301 res!59842) b!123292))

(assert (= (and b!123292 res!59844) b!123296))

(assert (= (and b!123289 condMapEmpty!4419) mapIsEmpty!4420))

(assert (= (and b!123289 (not condMapEmpty!4419)) mapNonEmpty!4420))

(get-info :version)

(assert (= (and mapNonEmpty!4420 ((_ is ValueCellFull!1067) mapValue!4419)) b!123293))

(assert (= (and b!123289 ((_ is ValueCellFull!1067) mapDefault!4419)) b!123288))

(assert (= b!123295 b!123289))

(assert (= b!123291 b!123295))

(assert (= b!123302 b!123291))

(assert (= start!13442 b!123302))

(assert (= (and b!123294 condMapEmpty!4420) mapIsEmpty!4419))

(assert (= (and b!123294 (not condMapEmpty!4420)) mapNonEmpty!4419))

(assert (= (and mapNonEmpty!4419 ((_ is ValueCellFull!1067) mapValue!4420)) b!123297))

(assert (= (and b!123294 ((_ is ValueCellFull!1067) mapDefault!4420)) b!123299))

(assert (= b!123290 b!123294))

(assert (= start!13442 b!123290))

(declare-fun m!143139 () Bool)

(assert (=> mapNonEmpty!4420 m!143139))

(declare-fun m!143141 () Bool)

(assert (=> b!123295 m!143141))

(declare-fun m!143143 () Bool)

(assert (=> b!123295 m!143143))

(declare-fun m!143145 () Bool)

(assert (=> b!123292 m!143145))

(declare-fun m!143147 () Bool)

(assert (=> b!123292 m!143147))

(declare-fun m!143149 () Bool)

(assert (=> b!123290 m!143149))

(declare-fun m!143151 () Bool)

(assert (=> b!123290 m!143151))

(declare-fun m!143153 () Bool)

(assert (=> start!13442 m!143153))

(declare-fun m!143155 () Bool)

(assert (=> mapNonEmpty!4419 m!143155))

(declare-fun m!143157 () Bool)

(assert (=> b!123298 m!143157))

(check-sat (not b!123292) (not mapNonEmpty!4419) (not b!123290) (not mapNonEmpty!4420) (not b!123295) (not b!123298) tp_is_empty!2821 b_and!7559 (not start!13442) (not b_next!2809) (not b_next!2811) b_and!7557)
(check-sat b_and!7557 b_and!7559 (not b_next!2809) (not b_next!2811))
(get-model)

(declare-fun bm!13097 () Bool)

(declare-fun call!13105 () ListLongMap!1637)

(declare-fun call!13106 () ListLongMap!1637)

(assert (=> bm!13097 (= call!13105 call!13106)))

(declare-fun b!123435 () Bool)

(declare-fun e!80685 () Bool)

(declare-fun e!80678 () Bool)

(assert (=> b!123435 (= e!80685 e!80678)))

(declare-fun res!59897 () Bool)

(assert (=> b!123435 (=> (not res!59897) (not e!80678))))

(declare-fun lt!63433 () ListLongMap!1637)

(declare-fun contains!858 (ListLongMap!1637 (_ BitVec 64)) Bool)

(assert (=> b!123435 (= res!59897 (contains!858 lt!63433 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123435 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun d!37019 () Bool)

(declare-fun e!80688 () Bool)

(assert (=> d!37019 e!80688))

(declare-fun res!59898 () Bool)

(assert (=> d!37019 (=> (not res!59898) (not e!80688))))

(assert (=> d!37019 (= res!59898 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun lt!63426 () ListLongMap!1637)

(assert (=> d!37019 (= lt!63433 lt!63426)))

(declare-datatypes ((Unit!3833 0))(
  ( (Unit!3834) )
))
(declare-fun lt!63420 () Unit!3833)

(declare-fun e!80681 () Unit!3833)

(assert (=> d!37019 (= lt!63420 e!80681)))

(declare-fun c!22412 () Bool)

(declare-fun e!80679 () Bool)

(assert (=> d!37019 (= c!22412 e!80679)))

(declare-fun res!59900 () Bool)

(assert (=> d!37019 (=> (not res!59900) (not e!80679))))

(assert (=> d!37019 (= res!59900 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun e!80686 () ListLongMap!1637)

(assert (=> d!37019 (= lt!63426 e!80686)))

(declare-fun c!22411 () Bool)

(assert (=> d!37019 (= c!22411 (and (not (= (bvand (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!37019 (validMask!0 (mask!6991 (v!3084 (underlying!426 thiss!992))))))

(assert (=> d!37019 (= (getCurrentListMap!505 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (_values!2737 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992))) (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) (minValue!2619 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992)))) lt!63433)))

(declare-fun b!123436 () Bool)

(declare-fun e!80684 () ListLongMap!1637)

(assert (=> b!123436 (= e!80686 e!80684)))

(declare-fun c!22413 () Bool)

(assert (=> b!123436 (= c!22413 (and (not (= (bvand (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!123437 () Bool)

(declare-fun e!80689 () ListLongMap!1637)

(declare-fun call!13100 () ListLongMap!1637)

(assert (=> b!123437 (= e!80689 call!13100)))

(declare-fun b!123438 () Bool)

(declare-fun lt!63416 () Unit!3833)

(assert (=> b!123438 (= e!80681 lt!63416)))

(declare-fun lt!63437 () ListLongMap!1637)

(declare-fun getCurrentListMapNoExtraKeys!120 (array!4633 array!4635 (_ BitVec 32) (_ BitVec 32) V!3409 V!3409 (_ BitVec 32) Int) ListLongMap!1637)

(assert (=> b!123438 (= lt!63437 (getCurrentListMapNoExtraKeys!120 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (_values!2737 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992))) (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) (minValue!2619 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun lt!63429 () (_ BitVec 64))

(assert (=> b!123438 (= lt!63429 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63417 () (_ BitVec 64))

(assert (=> b!123438 (= lt!63417 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63427 () Unit!3833)

(declare-fun addStillContains!84 (ListLongMap!1637 (_ BitVec 64) V!3409 (_ BitVec 64)) Unit!3833)

(assert (=> b!123438 (= lt!63427 (addStillContains!84 lt!63437 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63417))))

(declare-fun +!155 (ListLongMap!1637 tuple2!2524) ListLongMap!1637)

(assert (=> b!123438 (contains!858 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63417)))

(declare-fun lt!63436 () Unit!3833)

(assert (=> b!123438 (= lt!63436 lt!63427)))

(declare-fun lt!63423 () ListLongMap!1637)

(assert (=> b!123438 (= lt!63423 (getCurrentListMapNoExtraKeys!120 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (_values!2737 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992))) (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) (minValue!2619 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun lt!63430 () (_ BitVec 64))

(assert (=> b!123438 (= lt!63430 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63419 () (_ BitVec 64))

(assert (=> b!123438 (= lt!63419 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63418 () Unit!3833)

(declare-fun addApplyDifferent!84 (ListLongMap!1637 (_ BitVec 64) V!3409 (_ BitVec 64)) Unit!3833)

(assert (=> b!123438 (= lt!63418 (addApplyDifferent!84 lt!63423 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63419))))

(declare-fun apply!108 (ListLongMap!1637 (_ BitVec 64)) V!3409)

(assert (=> b!123438 (= (apply!108 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63419) (apply!108 lt!63423 lt!63419))))

(declare-fun lt!63432 () Unit!3833)

(assert (=> b!123438 (= lt!63432 lt!63418)))

(declare-fun lt!63434 () ListLongMap!1637)

(assert (=> b!123438 (= lt!63434 (getCurrentListMapNoExtraKeys!120 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (_values!2737 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992))) (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) (minValue!2619 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun lt!63422 () (_ BitVec 64))

(assert (=> b!123438 (= lt!63422 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63435 () (_ BitVec 64))

(assert (=> b!123438 (= lt!63435 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!63424 () Unit!3833)

(assert (=> b!123438 (= lt!63424 (addApplyDifferent!84 lt!63434 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63435))))

(assert (=> b!123438 (= (apply!108 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63435) (apply!108 lt!63434 lt!63435))))

(declare-fun lt!63425 () Unit!3833)

(assert (=> b!123438 (= lt!63425 lt!63424)))

(declare-fun lt!63421 () ListLongMap!1637)

(assert (=> b!123438 (= lt!63421 (getCurrentListMapNoExtraKeys!120 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (_values!2737 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992))) (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) (minValue!2619 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun lt!63428 () (_ BitVec 64))

(assert (=> b!123438 (= lt!63428 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63431 () (_ BitVec 64))

(assert (=> b!123438 (= lt!63431 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!123438 (= lt!63416 (addApplyDifferent!84 lt!63421 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63431))))

(assert (=> b!123438 (= (apply!108 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63431) (apply!108 lt!63421 lt!63431))))

(declare-fun b!123439 () Bool)

(declare-fun call!13102 () ListLongMap!1637)

(assert (=> b!123439 (= e!80689 call!13102)))

(declare-fun b!123440 () Bool)

(declare-fun res!59895 () Bool)

(assert (=> b!123440 (=> (not res!59895) (not e!80688))))

(assert (=> b!123440 (= res!59895 e!80685)))

(declare-fun res!59902 () Bool)

(assert (=> b!123440 (=> res!59902 e!80685)))

(declare-fun e!80677 () Bool)

(assert (=> b!123440 (= res!59902 (not e!80677))))

(declare-fun res!59901 () Bool)

(assert (=> b!123440 (=> (not res!59901) (not e!80677))))

(assert (=> b!123440 (= res!59901 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!123441 () Bool)

(declare-fun c!22410 () Bool)

(assert (=> b!123441 (= c!22410 (and (not (= (bvand (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!123441 (= e!80684 e!80689)))

(declare-fun b!123442 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!123442 (= e!80677 (validKeyInArray!0 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123443 () Bool)

(declare-fun e!80683 () Bool)

(assert (=> b!123443 (= e!80688 e!80683)))

(declare-fun c!22415 () Bool)

(assert (=> b!123443 (= c!22415 (not (= (bvand (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!123444 () Bool)

(declare-fun call!13103 () ListLongMap!1637)

(assert (=> b!123444 (= e!80686 (+!155 call!13103 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!123445 () Bool)

(assert (=> b!123445 (= e!80679 (validKeyInArray!0 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!13098 () Bool)

(declare-fun call!13104 () Bool)

(assert (=> bm!13098 (= call!13104 (contains!858 lt!63433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123446 () Bool)

(declare-fun e!80687 () Bool)

(assert (=> b!123446 (= e!80687 (not call!13104))))

(declare-fun b!123447 () Bool)

(declare-fun e!80680 () Bool)

(assert (=> b!123447 (= e!80687 e!80680)))

(declare-fun res!59899 () Bool)

(assert (=> b!123447 (= res!59899 call!13104)))

(assert (=> b!123447 (=> (not res!59899) (not e!80680))))

(declare-fun b!123448 () Bool)

(assert (=> b!123448 (= e!80684 call!13102)))

(declare-fun b!123449 () Bool)

(declare-fun get!1423 (ValueCell!1067 V!3409) V!3409)

(declare-fun dynLambda!404 (Int (_ BitVec 64)) V!3409)

(assert (=> b!123449 (= e!80678 (= (apply!108 lt!63433 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!123449 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2458 (_values!2737 (v!3084 (underlying!426 thiss!992))))))))

(assert (=> b!123449 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun bm!13099 () Bool)

(assert (=> bm!13099 (= call!13103 (+!155 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100)) (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123450 () Bool)

(declare-fun e!80682 () Bool)

(assert (=> b!123450 (= e!80683 e!80682)))

(declare-fun res!59896 () Bool)

(declare-fun call!13101 () Bool)

(assert (=> b!123450 (= res!59896 call!13101)))

(assert (=> b!123450 (=> (not res!59896) (not e!80682))))

(declare-fun b!123451 () Bool)

(assert (=> b!123451 (= e!80682 (= (apply!108 lt!63433 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun bm!13100 () Bool)

(assert (=> bm!13100 (= call!13100 call!13105)))

(declare-fun b!123452 () Bool)

(assert (=> b!123452 (= e!80680 (= (apply!108 lt!63433 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun bm!13101 () Bool)

(assert (=> bm!13101 (= call!13106 (getCurrentListMapNoExtraKeys!120 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (_values!2737 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992))) (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) (minValue!2619 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun bm!13102 () Bool)

(assert (=> bm!13102 (= call!13101 (contains!858 lt!63433 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123453 () Bool)

(assert (=> b!123453 (= e!80683 (not call!13101))))

(declare-fun b!123454 () Bool)

(declare-fun Unit!3835 () Unit!3833)

(assert (=> b!123454 (= e!80681 Unit!3835)))

(declare-fun bm!13103 () Bool)

(assert (=> bm!13103 (= call!13102 call!13103)))

(declare-fun b!123455 () Bool)

(declare-fun res!59894 () Bool)

(assert (=> b!123455 (=> (not res!59894) (not e!80688))))

(assert (=> b!123455 (= res!59894 e!80687)))

(declare-fun c!22414 () Bool)

(assert (=> b!123455 (= c!22414 (not (= (bvand (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!37019 c!22411) b!123444))

(assert (= (and d!37019 (not c!22411)) b!123436))

(assert (= (and b!123436 c!22413) b!123448))

(assert (= (and b!123436 (not c!22413)) b!123441))

(assert (= (and b!123441 c!22410) b!123439))

(assert (= (and b!123441 (not c!22410)) b!123437))

(assert (= (or b!123439 b!123437) bm!13100))

(assert (= (or b!123448 bm!13100) bm!13097))

(assert (= (or b!123448 b!123439) bm!13103))

(assert (= (or b!123444 bm!13097) bm!13101))

(assert (= (or b!123444 bm!13103) bm!13099))

(assert (= (and d!37019 res!59900) b!123445))

(assert (= (and d!37019 c!22412) b!123438))

(assert (= (and d!37019 (not c!22412)) b!123454))

(assert (= (and d!37019 res!59898) b!123440))

(assert (= (and b!123440 res!59901) b!123442))

(assert (= (and b!123440 (not res!59902)) b!123435))

(assert (= (and b!123435 res!59897) b!123449))

(assert (= (and b!123440 res!59895) b!123455))

(assert (= (and b!123455 c!22414) b!123447))

(assert (= (and b!123455 (not c!22414)) b!123446))

(assert (= (and b!123447 res!59899) b!123452))

(assert (= (or b!123447 b!123446) bm!13098))

(assert (= (and b!123455 res!59894) b!123443))

(assert (= (and b!123443 c!22415) b!123450))

(assert (= (and b!123443 (not c!22415)) b!123453))

(assert (= (and b!123450 res!59896) b!123451))

(assert (= (or b!123450 b!123453) bm!13102))

(declare-fun b_lambda!5411 () Bool)

(assert (=> (not b_lambda!5411) (not b!123449)))

(declare-fun t!5980 () Bool)

(declare-fun tb!2261 () Bool)

(assert (=> (and b!123295 (= (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992)))) t!5980) tb!2261))

(declare-fun result!3763 () Bool)

(assert (=> tb!2261 (= result!3763 tp_is_empty!2821)))

(assert (=> b!123449 t!5980))

(declare-fun b_and!7569 () Bool)

(assert (= b_and!7557 (and (=> t!5980 result!3763) b_and!7569)))

(declare-fun t!5982 () Bool)

(declare-fun tb!2263 () Bool)

(assert (=> (and b!123290 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992)))) t!5982) tb!2263))

(declare-fun result!3767 () Bool)

(assert (= result!3767 result!3763))

(assert (=> b!123449 t!5982))

(declare-fun b_and!7571 () Bool)

(assert (= b_and!7559 (and (=> t!5982 result!3767) b_and!7571)))

(declare-fun m!143199 () Bool)

(assert (=> bm!13099 m!143199))

(declare-fun m!143201 () Bool)

(assert (=> b!123449 m!143201))

(declare-fun m!143203 () Bool)

(assert (=> b!123449 m!143203))

(declare-fun m!143205 () Bool)

(assert (=> b!123449 m!143205))

(assert (=> b!123449 m!143201))

(assert (=> b!123449 m!143203))

(declare-fun m!143207 () Bool)

(assert (=> b!123449 m!143207))

(assert (=> b!123449 m!143205))

(declare-fun m!143209 () Bool)

(assert (=> b!123449 m!143209))

(declare-fun m!143211 () Bool)

(assert (=> b!123444 m!143211))

(declare-fun m!143213 () Bool)

(assert (=> b!123451 m!143213))

(declare-fun m!143215 () Bool)

(assert (=> bm!13102 m!143215))

(assert (=> b!123442 m!143205))

(assert (=> b!123442 m!143205))

(declare-fun m!143217 () Bool)

(assert (=> b!123442 m!143217))

(declare-fun m!143219 () Bool)

(assert (=> d!37019 m!143219))

(assert (=> b!123445 m!143205))

(assert (=> b!123445 m!143205))

(assert (=> b!123445 m!143217))

(declare-fun m!143221 () Bool)

(assert (=> b!123452 m!143221))

(declare-fun m!143223 () Bool)

(assert (=> bm!13098 m!143223))

(assert (=> b!123435 m!143205))

(assert (=> b!123435 m!143205))

(declare-fun m!143225 () Bool)

(assert (=> b!123435 m!143225))

(declare-fun m!143227 () Bool)

(assert (=> bm!13101 m!143227))

(declare-fun m!143229 () Bool)

(assert (=> b!123438 m!143229))

(declare-fun m!143231 () Bool)

(assert (=> b!123438 m!143231))

(declare-fun m!143233 () Bool)

(assert (=> b!123438 m!143233))

(declare-fun m!143235 () Bool)

(assert (=> b!123438 m!143235))

(declare-fun m!143237 () Bool)

(assert (=> b!123438 m!143237))

(assert (=> b!123438 m!143205))

(declare-fun m!143239 () Bool)

(assert (=> b!123438 m!143239))

(declare-fun m!143241 () Bool)

(assert (=> b!123438 m!143241))

(declare-fun m!143243 () Bool)

(assert (=> b!123438 m!143243))

(declare-fun m!143245 () Bool)

(assert (=> b!123438 m!143245))

(assert (=> b!123438 m!143227))

(assert (=> b!123438 m!143235))

(declare-fun m!143247 () Bool)

(assert (=> b!123438 m!143247))

(assert (=> b!123438 m!143243))

(declare-fun m!143249 () Bool)

(assert (=> b!123438 m!143249))

(declare-fun m!143251 () Bool)

(assert (=> b!123438 m!143251))

(assert (=> b!123438 m!143239))

(declare-fun m!143253 () Bool)

(assert (=> b!123438 m!143253))

(assert (=> b!123438 m!143229))

(declare-fun m!143255 () Bool)

(assert (=> b!123438 m!143255))

(declare-fun m!143257 () Bool)

(assert (=> b!123438 m!143257))

(assert (=> b!123292 d!37019))

(declare-fun d!37021 () Bool)

(assert (=> d!37021 (= (map!1359 newMap!16) (getCurrentListMap!505 (_keys!4480 newMap!16) (_values!2737 newMap!16) (mask!6991 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)))))

(declare-fun bs!5104 () Bool)

(assert (= bs!5104 d!37021))

(declare-fun m!143259 () Bool)

(assert (=> bs!5104 m!143259))

(assert (=> b!123292 d!37021))

(declare-fun d!37023 () Bool)

(assert (=> d!37023 (= (valid!498 thiss!992) (valid!499 (v!3084 (underlying!426 thiss!992))))))

(declare-fun bs!5105 () Bool)

(assert (= bs!5105 d!37023))

(declare-fun m!143261 () Bool)

(assert (=> bs!5105 m!143261))

(assert (=> start!13442 d!37023))

(declare-fun d!37025 () Bool)

(assert (=> d!37025 (= (array_inv!1393 (_keys!4480 newMap!16)) (bvsge (size!2457 (_keys!4480 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!123290 d!37025))

(declare-fun d!37027 () Bool)

(assert (=> d!37027 (= (array_inv!1394 (_values!2737 newMap!16)) (bvsge (size!2458 (_values!2737 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!123290 d!37027))

(declare-fun d!37029 () Bool)

(assert (=> d!37029 (= (array_inv!1393 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvsge (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!123295 d!37029))

(declare-fun d!37031 () Bool)

(assert (=> d!37031 (= (array_inv!1394 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvsge (size!2458 (_values!2737 (v!3084 (underlying!426 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!123295 d!37031))

(declare-fun d!37033 () Bool)

(declare-fun res!59909 () Bool)

(declare-fun e!80692 () Bool)

(assert (=> d!37033 (=> (not res!59909) (not e!80692))))

(declare-fun simpleValid!84 (LongMapFixedSize!1042) Bool)

(assert (=> d!37033 (= res!59909 (simpleValid!84 newMap!16))))

(assert (=> d!37033 (= (valid!499 newMap!16) e!80692)))

(declare-fun b!123464 () Bool)

(declare-fun res!59910 () Bool)

(assert (=> b!123464 (=> (not res!59910) (not e!80692))))

(declare-fun arrayCountValidKeys!0 (array!4633 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!123464 (= res!59910 (= (arrayCountValidKeys!0 (_keys!4480 newMap!16) #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))) (_size!570 newMap!16)))))

(declare-fun b!123465 () Bool)

(declare-fun res!59911 () Bool)

(assert (=> b!123465 (=> (not res!59911) (not e!80692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4633 (_ BitVec 32)) Bool)

(assert (=> b!123465 (= res!59911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4480 newMap!16) (mask!6991 newMap!16)))))

(declare-fun b!123466 () Bool)

(declare-datatypes ((List!1685 0))(
  ( (Nil!1682) (Cons!1681 (h!2282 (_ BitVec 64)) (t!5983 List!1685)) )
))
(declare-fun arrayNoDuplicates!0 (array!4633 (_ BitVec 32) List!1685) Bool)

(assert (=> b!123466 (= e!80692 (arrayNoDuplicates!0 (_keys!4480 newMap!16) #b00000000000000000000000000000000 Nil!1682))))

(assert (= (and d!37033 res!59909) b!123464))

(assert (= (and b!123464 res!59910) b!123465))

(assert (= (and b!123465 res!59911) b!123466))

(declare-fun m!143263 () Bool)

(assert (=> d!37033 m!143263))

(declare-fun m!143265 () Bool)

(assert (=> b!123464 m!143265))

(declare-fun m!143267 () Bool)

(assert (=> b!123465 m!143267))

(declare-fun m!143269 () Bool)

(assert (=> b!123466 m!143269))

(assert (=> b!123298 d!37033))

(declare-fun mapNonEmpty!4435 () Bool)

(declare-fun mapRes!4435 () Bool)

(declare-fun tp!10843 () Bool)

(declare-fun e!80697 () Bool)

(assert (=> mapNonEmpty!4435 (= mapRes!4435 (and tp!10843 e!80697))))

(declare-fun mapKey!4435 () (_ BitVec 32))

(declare-fun mapValue!4435 () ValueCell!1067)

(declare-fun mapRest!4435 () (Array (_ BitVec 32) ValueCell!1067))

(assert (=> mapNonEmpty!4435 (= mapRest!4419 (store mapRest!4435 mapKey!4435 mapValue!4435))))

(declare-fun b!123474 () Bool)

(declare-fun e!80698 () Bool)

(assert (=> b!123474 (= e!80698 tp_is_empty!2821)))

(declare-fun mapIsEmpty!4435 () Bool)

(assert (=> mapIsEmpty!4435 mapRes!4435))

(declare-fun b!123473 () Bool)

(assert (=> b!123473 (= e!80697 tp_is_empty!2821)))

(declare-fun condMapEmpty!4435 () Bool)

(declare-fun mapDefault!4435 () ValueCell!1067)

(assert (=> mapNonEmpty!4420 (= condMapEmpty!4435 (= mapRest!4419 ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4435)))))

(assert (=> mapNonEmpty!4420 (= tp!10813 (and e!80698 mapRes!4435))))

(assert (= (and mapNonEmpty!4420 condMapEmpty!4435) mapIsEmpty!4435))

(assert (= (and mapNonEmpty!4420 (not condMapEmpty!4435)) mapNonEmpty!4435))

(assert (= (and mapNonEmpty!4435 ((_ is ValueCellFull!1067) mapValue!4435)) b!123473))

(assert (= (and mapNonEmpty!4420 ((_ is ValueCellFull!1067) mapDefault!4435)) b!123474))

(declare-fun m!143271 () Bool)

(assert (=> mapNonEmpty!4435 m!143271))

(declare-fun mapNonEmpty!4436 () Bool)

(declare-fun mapRes!4436 () Bool)

(declare-fun tp!10844 () Bool)

(declare-fun e!80699 () Bool)

(assert (=> mapNonEmpty!4436 (= mapRes!4436 (and tp!10844 e!80699))))

(declare-fun mapRest!4436 () (Array (_ BitVec 32) ValueCell!1067))

(declare-fun mapValue!4436 () ValueCell!1067)

(declare-fun mapKey!4436 () (_ BitVec 32))

(assert (=> mapNonEmpty!4436 (= mapRest!4420 (store mapRest!4436 mapKey!4436 mapValue!4436))))

(declare-fun b!123476 () Bool)

(declare-fun e!80700 () Bool)

(assert (=> b!123476 (= e!80700 tp_is_empty!2821)))

(declare-fun mapIsEmpty!4436 () Bool)

(assert (=> mapIsEmpty!4436 mapRes!4436))

(declare-fun b!123475 () Bool)

(assert (=> b!123475 (= e!80699 tp_is_empty!2821)))

(declare-fun condMapEmpty!4436 () Bool)

(declare-fun mapDefault!4436 () ValueCell!1067)

(assert (=> mapNonEmpty!4419 (= condMapEmpty!4436 (= mapRest!4420 ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4436)))))

(assert (=> mapNonEmpty!4419 (= tp!10814 (and e!80700 mapRes!4436))))

(assert (= (and mapNonEmpty!4419 condMapEmpty!4436) mapIsEmpty!4436))

(assert (= (and mapNonEmpty!4419 (not condMapEmpty!4436)) mapNonEmpty!4436))

(assert (= (and mapNonEmpty!4436 ((_ is ValueCellFull!1067) mapValue!4436)) b!123475))

(assert (= (and mapNonEmpty!4419 ((_ is ValueCellFull!1067) mapDefault!4436)) b!123476))

(declare-fun m!143273 () Bool)

(assert (=> mapNonEmpty!4436 m!143273))

(declare-fun b_lambda!5413 () Bool)

(assert (= b_lambda!5411 (or (and b!123295 b_free!2809) (and b!123290 b_free!2811 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))))) b_lambda!5413)))

(check-sat (not b!123442) (not d!37033) (not b_next!2811) (not bm!13101) (not b!123466) (not b!123465) (not b!123445) (not bm!13098) b_and!7569 (not mapNonEmpty!4435) (not d!37021) (not mapNonEmpty!4436) (not d!37023) (not b!123444) (not b!123452) (not b!123449) (not bm!13099) (not b!123438) (not b!123451) b_and!7571 tp_is_empty!2821 (not bm!13102) (not b_lambda!5413) (not b!123435) (not d!37019) (not b!123464) (not b_next!2809))
(check-sat b_and!7569 b_and!7571 (not b_next!2809) (not b_next!2811))
(get-model)

(declare-fun d!37035 () Bool)

(declare-datatypes ((Option!168 0))(
  ( (Some!167 (v!3089 V!3409)) (None!166) )
))
(declare-fun get!1424 (Option!168) V!3409)

(declare-fun getValueByKey!162 (List!1684 (_ BitVec 64)) Option!168)

(assert (=> d!37035 (= (apply!108 lt!63433 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1424 (getValueByKey!162 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5106 () Bool)

(assert (= bs!5106 d!37035))

(declare-fun m!143275 () Bool)

(assert (=> bs!5106 m!143275))

(assert (=> bs!5106 m!143275))

(declare-fun m!143277 () Bool)

(assert (=> bs!5106 m!143277))

(assert (=> b!123451 d!37035))

(declare-fun d!37037 () Bool)

(assert (=> d!37037 (= (validKeyInArray!0 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!123442 d!37037))

(declare-fun d!37039 () Bool)

(assert (=> d!37039 (= (validMask!0 (mask!6991 (v!3084 (underlying!426 thiss!992)))) (and (or (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000001111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000011111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000001111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000011111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000001111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000011111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000001111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000011111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000001111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000011111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000111111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000001111111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000011111111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000111111111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000001111111111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000011111111111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000111111111111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000001111111111111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000011111111111111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000111111111111111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00001111111111111111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00011111111111111111111111111111) (= (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!37019 d!37039))

(declare-fun d!37041 () Bool)

(assert (=> d!37041 (= (apply!108 lt!63433 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1424 (getValueByKey!162 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5107 () Bool)

(assert (= bs!5107 d!37041))

(assert (=> bs!5107 m!143205))

(declare-fun m!143279 () Bool)

(assert (=> bs!5107 m!143279))

(assert (=> bs!5107 m!143279))

(declare-fun m!143281 () Bool)

(assert (=> bs!5107 m!143281))

(assert (=> b!123449 d!37041))

(declare-fun d!37043 () Bool)

(declare-fun c!22418 () Bool)

(assert (=> d!37043 (= c!22418 ((_ is ValueCellFull!1067) (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!80703 () V!3409)

(assert (=> d!37043 (= (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!80703)))

(declare-fun b!123481 () Bool)

(declare-fun get!1425 (ValueCell!1067 V!3409) V!3409)

(assert (=> b!123481 (= e!80703 (get!1425 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123482 () Bool)

(declare-fun get!1426 (ValueCell!1067 V!3409) V!3409)

(assert (=> b!123482 (= e!80703 (get!1426 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37043 c!22418) b!123481))

(assert (= (and d!37043 (not c!22418)) b!123482))

(assert (=> b!123481 m!143201))

(assert (=> b!123481 m!143203))

(declare-fun m!143283 () Bool)

(assert (=> b!123481 m!143283))

(assert (=> b!123482 m!143201))

(assert (=> b!123482 m!143203))

(declare-fun m!143285 () Bool)

(assert (=> b!123482 m!143285))

(assert (=> b!123449 d!37043))

(declare-fun d!37045 () Bool)

(declare-fun lt!63440 () (_ BitVec 32))

(assert (=> d!37045 (and (bvsge lt!63440 #b00000000000000000000000000000000) (bvsle lt!63440 (bvsub (size!2457 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!80708 () (_ BitVec 32))

(assert (=> d!37045 (= lt!63440 e!80708)))

(declare-fun c!22424 () Bool)

(assert (=> d!37045 (= c!22424 (bvsge #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))))))

(assert (=> d!37045 (and (bvsle #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2457 (_keys!4480 newMap!16)) (size!2457 (_keys!4480 newMap!16))))))

(assert (=> d!37045 (= (arrayCountValidKeys!0 (_keys!4480 newMap!16) #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))) lt!63440)))

(declare-fun b!123491 () Bool)

(assert (=> b!123491 (= e!80708 #b00000000000000000000000000000000)))

(declare-fun b!123492 () Bool)

(declare-fun e!80709 () (_ BitVec 32))

(assert (=> b!123492 (= e!80708 e!80709)))

(declare-fun c!22423 () Bool)

(assert (=> b!123492 (= c!22423 (validKeyInArray!0 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123493 () Bool)

(declare-fun call!13109 () (_ BitVec 32))

(assert (=> b!123493 (= e!80709 (bvadd #b00000000000000000000000000000001 call!13109))))

(declare-fun bm!13106 () Bool)

(assert (=> bm!13106 (= call!13109 (arrayCountValidKeys!0 (_keys!4480 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2457 (_keys!4480 newMap!16))))))

(declare-fun b!123494 () Bool)

(assert (=> b!123494 (= e!80709 call!13109)))

(assert (= (and d!37045 c!22424) b!123491))

(assert (= (and d!37045 (not c!22424)) b!123492))

(assert (= (and b!123492 c!22423) b!123493))

(assert (= (and b!123492 (not c!22423)) b!123494))

(assert (= (or b!123493 b!123494) bm!13106))

(declare-fun m!143287 () Bool)

(assert (=> b!123492 m!143287))

(assert (=> b!123492 m!143287))

(declare-fun m!143289 () Bool)

(assert (=> b!123492 m!143289))

(declare-fun m!143291 () Bool)

(assert (=> bm!13106 m!143291))

(assert (=> b!123464 d!37045))

(declare-fun b!123505 () Bool)

(declare-fun e!80720 () Bool)

(declare-fun call!13112 () Bool)

(assert (=> b!123505 (= e!80720 call!13112)))

(declare-fun b!123506 () Bool)

(declare-fun e!80718 () Bool)

(declare-fun e!80721 () Bool)

(assert (=> b!123506 (= e!80718 e!80721)))

(declare-fun res!59918 () Bool)

(assert (=> b!123506 (=> (not res!59918) (not e!80721))))

(declare-fun e!80719 () Bool)

(assert (=> b!123506 (= res!59918 (not e!80719))))

(declare-fun res!59919 () Bool)

(assert (=> b!123506 (=> (not res!59919) (not e!80719))))

(assert (=> b!123506 (= res!59919 (validKeyInArray!0 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123507 () Bool)

(assert (=> b!123507 (= e!80721 e!80720)))

(declare-fun c!22427 () Bool)

(assert (=> b!123507 (= c!22427 (validKeyInArray!0 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!37047 () Bool)

(declare-fun res!59920 () Bool)

(assert (=> d!37047 (=> res!59920 e!80718)))

(assert (=> d!37047 (= res!59920 (bvsge #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))))))

(assert (=> d!37047 (= (arrayNoDuplicates!0 (_keys!4480 newMap!16) #b00000000000000000000000000000000 Nil!1682) e!80718)))

(declare-fun b!123508 () Bool)

(assert (=> b!123508 (= e!80720 call!13112)))

(declare-fun bm!13109 () Bool)

(assert (=> bm!13109 (= call!13112 (arrayNoDuplicates!0 (_keys!4480 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22427 (Cons!1681 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) Nil!1682) Nil!1682)))))

(declare-fun b!123509 () Bool)

(declare-fun contains!859 (List!1685 (_ BitVec 64)) Bool)

(assert (=> b!123509 (= e!80719 (contains!859 Nil!1682 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!37047 (not res!59920)) b!123506))

(assert (= (and b!123506 res!59919) b!123509))

(assert (= (and b!123506 res!59918) b!123507))

(assert (= (and b!123507 c!22427) b!123505))

(assert (= (and b!123507 (not c!22427)) b!123508))

(assert (= (or b!123505 b!123508) bm!13109))

(assert (=> b!123506 m!143287))

(assert (=> b!123506 m!143287))

(assert (=> b!123506 m!143289))

(assert (=> b!123507 m!143287))

(assert (=> b!123507 m!143287))

(assert (=> b!123507 m!143289))

(assert (=> bm!13109 m!143287))

(declare-fun m!143293 () Bool)

(assert (=> bm!13109 m!143293))

(assert (=> b!123509 m!143287))

(assert (=> b!123509 m!143287))

(declare-fun m!143295 () Bool)

(assert (=> b!123509 m!143295))

(assert (=> b!123466 d!37047))

(declare-fun d!37049 () Bool)

(declare-fun e!80724 () Bool)

(assert (=> d!37049 e!80724))

(declare-fun res!59925 () Bool)

(assert (=> d!37049 (=> (not res!59925) (not e!80724))))

(declare-fun lt!63451 () ListLongMap!1637)

(assert (=> d!37049 (= res!59925 (contains!858 lt!63451 (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun lt!63449 () List!1684)

(assert (=> d!37049 (= lt!63451 (ListLongMap!1638 lt!63449))))

(declare-fun lt!63452 () Unit!3833)

(declare-fun lt!63450 () Unit!3833)

(assert (=> d!37049 (= lt!63452 lt!63450)))

(assert (=> d!37049 (= (getValueByKey!162 lt!63449 (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) (Some!167 (_2!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!81 (List!1684 (_ BitVec 64) V!3409) Unit!3833)

(assert (=> d!37049 (= lt!63450 (lemmaContainsTupThenGetReturnValue!81 lt!63449 (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (_2!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun insertStrictlySorted!84 (List!1684 (_ BitVec 64) V!3409) List!1684)

(assert (=> d!37049 (= lt!63449 (insertStrictlySorted!84 (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100))) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (_2!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37049 (= (+!155 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100)) (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63451)))

(declare-fun b!123514 () Bool)

(declare-fun res!59926 () Bool)

(assert (=> b!123514 (=> (not res!59926) (not e!80724))))

(assert (=> b!123514 (= res!59926 (= (getValueByKey!162 (toList!834 lt!63451) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) (Some!167 (_2!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun b!123515 () Bool)

(declare-fun contains!860 (List!1684 tuple2!2524) Bool)

(assert (=> b!123515 (= e!80724 (contains!860 (toList!834 lt!63451) (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (= (and d!37049 res!59925) b!123514))

(assert (= (and b!123514 res!59926) b!123515))

(declare-fun m!143297 () Bool)

(assert (=> d!37049 m!143297))

(declare-fun m!143299 () Bool)

(assert (=> d!37049 m!143299))

(declare-fun m!143301 () Bool)

(assert (=> d!37049 m!143301))

(declare-fun m!143303 () Bool)

(assert (=> d!37049 m!143303))

(declare-fun m!143305 () Bool)

(assert (=> b!123514 m!143305))

(declare-fun m!143307 () Bool)

(assert (=> b!123515 m!143307))

(assert (=> bm!13099 d!37049))

(declare-fun b!123524 () Bool)

(declare-fun e!80733 () Bool)

(declare-fun e!80732 () Bool)

(assert (=> b!123524 (= e!80733 e!80732)))

(declare-fun lt!63460 () (_ BitVec 64))

(assert (=> b!123524 (= lt!63460 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!63459 () Unit!3833)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4633 (_ BitVec 64) (_ BitVec 32)) Unit!3833)

(assert (=> b!123524 (= lt!63459 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4480 newMap!16) lt!63460 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!4633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!123524 (arrayContainsKey!0 (_keys!4480 newMap!16) lt!63460 #b00000000000000000000000000000000)))

(declare-fun lt!63461 () Unit!3833)

(assert (=> b!123524 (= lt!63461 lt!63459)))

(declare-fun res!59931 () Bool)

(declare-datatypes ((SeekEntryResult!270 0))(
  ( (MissingZero!270 (index!3234 (_ BitVec 32))) (Found!270 (index!3235 (_ BitVec 32))) (Intermediate!270 (undefined!1082 Bool) (index!3236 (_ BitVec 32)) (x!14730 (_ BitVec 32))) (Undefined!270) (MissingVacant!270 (index!3237 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4633 (_ BitVec 32)) SeekEntryResult!270)

(assert (=> b!123524 (= res!59931 (= (seekEntryOrOpen!0 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) (_keys!4480 newMap!16) (mask!6991 newMap!16)) (Found!270 #b00000000000000000000000000000000)))))

(assert (=> b!123524 (=> (not res!59931) (not e!80732))))

(declare-fun b!123525 () Bool)

(declare-fun call!13115 () Bool)

(assert (=> b!123525 (= e!80732 call!13115)))

(declare-fun b!123526 () Bool)

(assert (=> b!123526 (= e!80733 call!13115)))

(declare-fun b!123527 () Bool)

(declare-fun e!80731 () Bool)

(assert (=> b!123527 (= e!80731 e!80733)))

(declare-fun c!22430 () Bool)

(assert (=> b!123527 (= c!22430 (validKeyInArray!0 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13112 () Bool)

(assert (=> bm!13112 (= call!13115 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4480 newMap!16) (mask!6991 newMap!16)))))

(declare-fun d!37051 () Bool)

(declare-fun res!59932 () Bool)

(assert (=> d!37051 (=> res!59932 e!80731)))

(assert (=> d!37051 (= res!59932 (bvsge #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))))))

(assert (=> d!37051 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4480 newMap!16) (mask!6991 newMap!16)) e!80731)))

(assert (= (and d!37051 (not res!59932)) b!123527))

(assert (= (and b!123527 c!22430) b!123524))

(assert (= (and b!123527 (not c!22430)) b!123526))

(assert (= (and b!123524 res!59931) b!123525))

(assert (= (or b!123525 b!123526) bm!13112))

(assert (=> b!123524 m!143287))

(declare-fun m!143309 () Bool)

(assert (=> b!123524 m!143309))

(declare-fun m!143311 () Bool)

(assert (=> b!123524 m!143311))

(assert (=> b!123524 m!143287))

(declare-fun m!143313 () Bool)

(assert (=> b!123524 m!143313))

(assert (=> b!123527 m!143287))

(assert (=> b!123527 m!143287))

(assert (=> b!123527 m!143289))

(declare-fun m!143315 () Bool)

(assert (=> bm!13112 m!143315))

(assert (=> b!123465 d!37051))

(declare-fun bm!13113 () Bool)

(declare-fun call!13121 () ListLongMap!1637)

(declare-fun call!13122 () ListLongMap!1637)

(assert (=> bm!13113 (= call!13121 call!13122)))

(declare-fun b!123528 () Bool)

(declare-fun e!80742 () Bool)

(declare-fun e!80735 () Bool)

(assert (=> b!123528 (= e!80742 e!80735)))

(declare-fun res!59936 () Bool)

(assert (=> b!123528 (=> (not res!59936) (not e!80735))))

(declare-fun lt!63479 () ListLongMap!1637)

(assert (=> b!123528 (= res!59936 (contains!858 lt!63479 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!123528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))))))

(declare-fun d!37053 () Bool)

(declare-fun e!80745 () Bool)

(assert (=> d!37053 e!80745))

(declare-fun res!59937 () Bool)

(assert (=> d!37053 (=> (not res!59937) (not e!80745))))

(assert (=> d!37053 (= res!59937 (or (bvsge #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))))))))

(declare-fun lt!63472 () ListLongMap!1637)

(assert (=> d!37053 (= lt!63479 lt!63472)))

(declare-fun lt!63466 () Unit!3833)

(declare-fun e!80738 () Unit!3833)

(assert (=> d!37053 (= lt!63466 e!80738)))

(declare-fun c!22433 () Bool)

(declare-fun e!80736 () Bool)

(assert (=> d!37053 (= c!22433 e!80736)))

(declare-fun res!59939 () Bool)

(assert (=> d!37053 (=> (not res!59939) (not e!80736))))

(assert (=> d!37053 (= res!59939 (bvslt #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))))))

(declare-fun e!80743 () ListLongMap!1637)

(assert (=> d!37053 (= lt!63472 e!80743)))

(declare-fun c!22432 () Bool)

(assert (=> d!37053 (= c!22432 (and (not (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37053 (validMask!0 (mask!6991 newMap!16))))

(assert (=> d!37053 (= (getCurrentListMap!505 (_keys!4480 newMap!16) (_values!2737 newMap!16) (mask!6991 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)) lt!63479)))

(declare-fun b!123529 () Bool)

(declare-fun e!80741 () ListLongMap!1637)

(assert (=> b!123529 (= e!80743 e!80741)))

(declare-fun c!22434 () Bool)

(assert (=> b!123529 (= c!22434 (and (not (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!123530 () Bool)

(declare-fun e!80746 () ListLongMap!1637)

(declare-fun call!13116 () ListLongMap!1637)

(assert (=> b!123530 (= e!80746 call!13116)))

(declare-fun b!123531 () Bool)

(declare-fun lt!63462 () Unit!3833)

(assert (=> b!123531 (= e!80738 lt!63462)))

(declare-fun lt!63483 () ListLongMap!1637)

(assert (=> b!123531 (= lt!63483 (getCurrentListMapNoExtraKeys!120 (_keys!4480 newMap!16) (_values!2737 newMap!16) (mask!6991 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)))))

(declare-fun lt!63475 () (_ BitVec 64))

(assert (=> b!123531 (= lt!63475 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63463 () (_ BitVec 64))

(assert (=> b!123531 (= lt!63463 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!63473 () Unit!3833)

(assert (=> b!123531 (= lt!63473 (addStillContains!84 lt!63483 lt!63475 (zeroValue!2619 newMap!16) lt!63463))))

(assert (=> b!123531 (contains!858 (+!155 lt!63483 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16))) lt!63463)))

(declare-fun lt!63482 () Unit!3833)

(assert (=> b!123531 (= lt!63482 lt!63473)))

(declare-fun lt!63469 () ListLongMap!1637)

(assert (=> b!123531 (= lt!63469 (getCurrentListMapNoExtraKeys!120 (_keys!4480 newMap!16) (_values!2737 newMap!16) (mask!6991 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)))))

(declare-fun lt!63476 () (_ BitVec 64))

(assert (=> b!123531 (= lt!63476 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63465 () (_ BitVec 64))

(assert (=> b!123531 (= lt!63465 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!63464 () Unit!3833)

(assert (=> b!123531 (= lt!63464 (addApplyDifferent!84 lt!63469 lt!63476 (minValue!2619 newMap!16) lt!63465))))

(assert (=> b!123531 (= (apply!108 (+!155 lt!63469 (tuple2!2525 lt!63476 (minValue!2619 newMap!16))) lt!63465) (apply!108 lt!63469 lt!63465))))

(declare-fun lt!63478 () Unit!3833)

(assert (=> b!123531 (= lt!63478 lt!63464)))

(declare-fun lt!63480 () ListLongMap!1637)

(assert (=> b!123531 (= lt!63480 (getCurrentListMapNoExtraKeys!120 (_keys!4480 newMap!16) (_values!2737 newMap!16) (mask!6991 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)))))

(declare-fun lt!63468 () (_ BitVec 64))

(assert (=> b!123531 (= lt!63468 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63481 () (_ BitVec 64))

(assert (=> b!123531 (= lt!63481 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!63470 () Unit!3833)

(assert (=> b!123531 (= lt!63470 (addApplyDifferent!84 lt!63480 lt!63468 (zeroValue!2619 newMap!16) lt!63481))))

(assert (=> b!123531 (= (apply!108 (+!155 lt!63480 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16))) lt!63481) (apply!108 lt!63480 lt!63481))))

(declare-fun lt!63471 () Unit!3833)

(assert (=> b!123531 (= lt!63471 lt!63470)))

(declare-fun lt!63467 () ListLongMap!1637)

(assert (=> b!123531 (= lt!63467 (getCurrentListMapNoExtraKeys!120 (_keys!4480 newMap!16) (_values!2737 newMap!16) (mask!6991 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)))))

(declare-fun lt!63474 () (_ BitVec 64))

(assert (=> b!123531 (= lt!63474 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!63477 () (_ BitVec 64))

(assert (=> b!123531 (= lt!63477 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!123531 (= lt!63462 (addApplyDifferent!84 lt!63467 lt!63474 (minValue!2619 newMap!16) lt!63477))))

(assert (=> b!123531 (= (apply!108 (+!155 lt!63467 (tuple2!2525 lt!63474 (minValue!2619 newMap!16))) lt!63477) (apply!108 lt!63467 lt!63477))))

(declare-fun b!123532 () Bool)

(declare-fun call!13118 () ListLongMap!1637)

(assert (=> b!123532 (= e!80746 call!13118)))

(declare-fun b!123533 () Bool)

(declare-fun res!59934 () Bool)

(assert (=> b!123533 (=> (not res!59934) (not e!80745))))

(assert (=> b!123533 (= res!59934 e!80742)))

(declare-fun res!59941 () Bool)

(assert (=> b!123533 (=> res!59941 e!80742)))

(declare-fun e!80734 () Bool)

(assert (=> b!123533 (= res!59941 (not e!80734))))

(declare-fun res!59940 () Bool)

(assert (=> b!123533 (=> (not res!59940) (not e!80734))))

(assert (=> b!123533 (= res!59940 (bvslt #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))))))

(declare-fun b!123534 () Bool)

(declare-fun c!22431 () Bool)

(assert (=> b!123534 (= c!22431 (and (not (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!123534 (= e!80741 e!80746)))

(declare-fun b!123535 () Bool)

(assert (=> b!123535 (= e!80734 (validKeyInArray!0 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123536 () Bool)

(declare-fun e!80740 () Bool)

(assert (=> b!123536 (= e!80745 e!80740)))

(declare-fun c!22436 () Bool)

(assert (=> b!123536 (= c!22436 (not (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!123537 () Bool)

(declare-fun call!13119 () ListLongMap!1637)

(assert (=> b!123537 (= e!80743 (+!155 call!13119 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))

(declare-fun b!123538 () Bool)

(assert (=> b!123538 (= e!80736 (validKeyInArray!0 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13114 () Bool)

(declare-fun call!13120 () Bool)

(assert (=> bm!13114 (= call!13120 (contains!858 lt!63479 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123539 () Bool)

(declare-fun e!80744 () Bool)

(assert (=> b!123539 (= e!80744 (not call!13120))))

(declare-fun b!123540 () Bool)

(declare-fun e!80737 () Bool)

(assert (=> b!123540 (= e!80744 e!80737)))

(declare-fun res!59938 () Bool)

(assert (=> b!123540 (= res!59938 call!13120)))

(assert (=> b!123540 (=> (not res!59938) (not e!80737))))

(declare-fun b!123541 () Bool)

(assert (=> b!123541 (= e!80741 call!13118)))

(declare-fun b!123542 () Bool)

(assert (=> b!123542 (= e!80735 (= (apply!108 lt!63479 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)) (get!1423 (select (arr!2195 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!404 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!123542 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2458 (_values!2737 newMap!16))))))

(assert (=> b!123542 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))))))

(declare-fun bm!13115 () Bool)

(assert (=> bm!13115 (= call!13119 (+!155 (ite c!22432 call!13122 (ite c!22434 call!13121 call!13116)) (ite (or c!22432 c!22434) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))

(declare-fun b!123543 () Bool)

(declare-fun e!80739 () Bool)

(assert (=> b!123543 (= e!80740 e!80739)))

(declare-fun res!59935 () Bool)

(declare-fun call!13117 () Bool)

(assert (=> b!123543 (= res!59935 call!13117)))

(assert (=> b!123543 (=> (not res!59935) (not e!80739))))

(declare-fun b!123544 () Bool)

(assert (=> b!123544 (= e!80739 (= (apply!108 lt!63479 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2619 newMap!16)))))

(declare-fun bm!13116 () Bool)

(assert (=> bm!13116 (= call!13116 call!13121)))

(declare-fun b!123545 () Bool)

(assert (=> b!123545 (= e!80737 (= (apply!108 lt!63479 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2619 newMap!16)))))

(declare-fun bm!13117 () Bool)

(assert (=> bm!13117 (= call!13122 (getCurrentListMapNoExtraKeys!120 (_keys!4480 newMap!16) (_values!2737 newMap!16) (mask!6991 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)))))

(declare-fun bm!13118 () Bool)

(assert (=> bm!13118 (= call!13117 (contains!858 lt!63479 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123546 () Bool)

(assert (=> b!123546 (= e!80740 (not call!13117))))

(declare-fun b!123547 () Bool)

(declare-fun Unit!3836 () Unit!3833)

(assert (=> b!123547 (= e!80738 Unit!3836)))

(declare-fun bm!13119 () Bool)

(assert (=> bm!13119 (= call!13118 call!13119)))

(declare-fun b!123548 () Bool)

(declare-fun res!59933 () Bool)

(assert (=> b!123548 (=> (not res!59933) (not e!80745))))

(assert (=> b!123548 (= res!59933 e!80744)))

(declare-fun c!22435 () Bool)

(assert (=> b!123548 (= c!22435 (not (= (bvand (extraKeys!2539 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!37053 c!22432) b!123537))

(assert (= (and d!37053 (not c!22432)) b!123529))

(assert (= (and b!123529 c!22434) b!123541))

(assert (= (and b!123529 (not c!22434)) b!123534))

(assert (= (and b!123534 c!22431) b!123532))

(assert (= (and b!123534 (not c!22431)) b!123530))

(assert (= (or b!123532 b!123530) bm!13116))

(assert (= (or b!123541 bm!13116) bm!13113))

(assert (= (or b!123541 b!123532) bm!13119))

(assert (= (or b!123537 bm!13113) bm!13117))

(assert (= (or b!123537 bm!13119) bm!13115))

(assert (= (and d!37053 res!59939) b!123538))

(assert (= (and d!37053 c!22433) b!123531))

(assert (= (and d!37053 (not c!22433)) b!123547))

(assert (= (and d!37053 res!59937) b!123533))

(assert (= (and b!123533 res!59940) b!123535))

(assert (= (and b!123533 (not res!59941)) b!123528))

(assert (= (and b!123528 res!59936) b!123542))

(assert (= (and b!123533 res!59934) b!123548))

(assert (= (and b!123548 c!22435) b!123540))

(assert (= (and b!123548 (not c!22435)) b!123539))

(assert (= (and b!123540 res!59938) b!123545))

(assert (= (or b!123540 b!123539) bm!13114))

(assert (= (and b!123548 res!59933) b!123536))

(assert (= (and b!123536 c!22436) b!123543))

(assert (= (and b!123536 (not c!22436)) b!123546))

(assert (= (and b!123543 res!59935) b!123544))

(assert (= (or b!123543 b!123546) bm!13118))

(declare-fun b_lambda!5415 () Bool)

(assert (=> (not b_lambda!5415) (not b!123542)))

(declare-fun t!5985 () Bool)

(declare-fun tb!2265 () Bool)

(assert (=> (and b!123295 (= (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) (defaultEntry!2754 newMap!16)) t!5985) tb!2265))

(declare-fun result!3771 () Bool)

(assert (=> tb!2265 (= result!3771 tp_is_empty!2821)))

(assert (=> b!123542 t!5985))

(declare-fun b_and!7573 () Bool)

(assert (= b_and!7569 (and (=> t!5985 result!3771) b_and!7573)))

(declare-fun t!5987 () Bool)

(declare-fun tb!2267 () Bool)

(assert (=> (and b!123290 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 newMap!16)) t!5987) tb!2267))

(declare-fun result!3773 () Bool)

(assert (= result!3773 result!3771))

(assert (=> b!123542 t!5987))

(declare-fun b_and!7575 () Bool)

(assert (= b_and!7571 (and (=> t!5987 result!3773) b_and!7575)))

(declare-fun m!143317 () Bool)

(assert (=> bm!13115 m!143317))

(declare-fun m!143319 () Bool)

(assert (=> b!123542 m!143319))

(declare-fun m!143321 () Bool)

(assert (=> b!123542 m!143321))

(assert (=> b!123542 m!143287))

(assert (=> b!123542 m!143319))

(assert (=> b!123542 m!143321))

(declare-fun m!143323 () Bool)

(assert (=> b!123542 m!143323))

(assert (=> b!123542 m!143287))

(declare-fun m!143325 () Bool)

(assert (=> b!123542 m!143325))

(declare-fun m!143327 () Bool)

(assert (=> b!123537 m!143327))

(declare-fun m!143329 () Bool)

(assert (=> b!123544 m!143329))

(declare-fun m!143331 () Bool)

(assert (=> bm!13118 m!143331))

(assert (=> b!123535 m!143287))

(assert (=> b!123535 m!143287))

(assert (=> b!123535 m!143289))

(declare-fun m!143333 () Bool)

(assert (=> d!37053 m!143333))

(assert (=> b!123538 m!143287))

(assert (=> b!123538 m!143287))

(assert (=> b!123538 m!143289))

(declare-fun m!143335 () Bool)

(assert (=> b!123545 m!143335))

(declare-fun m!143337 () Bool)

(assert (=> bm!13114 m!143337))

(assert (=> b!123528 m!143287))

(assert (=> b!123528 m!143287))

(declare-fun m!143339 () Bool)

(assert (=> b!123528 m!143339))

(declare-fun m!143341 () Bool)

(assert (=> bm!13117 m!143341))

(declare-fun m!143343 () Bool)

(assert (=> b!123531 m!143343))

(declare-fun m!143345 () Bool)

(assert (=> b!123531 m!143345))

(declare-fun m!143347 () Bool)

(assert (=> b!123531 m!143347))

(declare-fun m!143349 () Bool)

(assert (=> b!123531 m!143349))

(declare-fun m!143351 () Bool)

(assert (=> b!123531 m!143351))

(assert (=> b!123531 m!143287))

(declare-fun m!143353 () Bool)

(assert (=> b!123531 m!143353))

(declare-fun m!143355 () Bool)

(assert (=> b!123531 m!143355))

(declare-fun m!143357 () Bool)

(assert (=> b!123531 m!143357))

(declare-fun m!143359 () Bool)

(assert (=> b!123531 m!143359))

(assert (=> b!123531 m!143341))

(assert (=> b!123531 m!143349))

(declare-fun m!143361 () Bool)

(assert (=> b!123531 m!143361))

(assert (=> b!123531 m!143357))

(declare-fun m!143363 () Bool)

(assert (=> b!123531 m!143363))

(declare-fun m!143365 () Bool)

(assert (=> b!123531 m!143365))

(assert (=> b!123531 m!143353))

(declare-fun m!143367 () Bool)

(assert (=> b!123531 m!143367))

(assert (=> b!123531 m!143343))

(declare-fun m!143369 () Bool)

(assert (=> b!123531 m!143369))

(declare-fun m!143371 () Bool)

(assert (=> b!123531 m!143371))

(assert (=> d!37021 d!37053))

(declare-fun d!37055 () Bool)

(assert (=> d!37055 (= (apply!108 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63431) (apply!108 lt!63421 lt!63431))))

(declare-fun lt!63486 () Unit!3833)

(declare-fun choose!749 (ListLongMap!1637 (_ BitVec 64) V!3409 (_ BitVec 64)) Unit!3833)

(assert (=> d!37055 (= lt!63486 (choose!749 lt!63421 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63431))))

(declare-fun e!80749 () Bool)

(assert (=> d!37055 e!80749))

(declare-fun res!59944 () Bool)

(assert (=> d!37055 (=> (not res!59944) (not e!80749))))

(assert (=> d!37055 (= res!59944 (contains!858 lt!63421 lt!63431))))

(assert (=> d!37055 (= (addApplyDifferent!84 lt!63421 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63431) lt!63486)))

(declare-fun b!123552 () Bool)

(assert (=> b!123552 (= e!80749 (not (= lt!63431 lt!63428)))))

(assert (= (and d!37055 res!59944) b!123552))

(declare-fun m!143373 () Bool)

(assert (=> d!37055 m!143373))

(assert (=> d!37055 m!143239))

(assert (=> d!37055 m!143239))

(assert (=> d!37055 m!143253))

(declare-fun m!143375 () Bool)

(assert (=> d!37055 m!143375))

(assert (=> d!37055 m!143231))

(assert (=> b!123438 d!37055))

(declare-fun d!37057 () Bool)

(declare-fun e!80750 () Bool)

(assert (=> d!37057 e!80750))

(declare-fun res!59945 () Bool)

(assert (=> d!37057 (=> (not res!59945) (not e!80750))))

(declare-fun lt!63489 () ListLongMap!1637)

(assert (=> d!37057 (= res!59945 (contains!858 lt!63489 (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun lt!63487 () List!1684)

(assert (=> d!37057 (= lt!63489 (ListLongMap!1638 lt!63487))))

(declare-fun lt!63490 () Unit!3833)

(declare-fun lt!63488 () Unit!3833)

(assert (=> d!37057 (= lt!63490 lt!63488)))

(assert (=> d!37057 (= (getValueByKey!162 lt!63487 (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37057 (= lt!63488 (lemmaContainsTupThenGetReturnValue!81 lt!63487 (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37057 (= lt!63487 (insertStrictlySorted!84 (toList!834 lt!63423) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37057 (= (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63489)))

(declare-fun b!123553 () Bool)

(declare-fun res!59946 () Bool)

(assert (=> b!123553 (=> (not res!59946) (not e!80750))))

(assert (=> b!123553 (= res!59946 (= (getValueByKey!162 (toList!834 lt!63489) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!123554 () Bool)

(assert (=> b!123554 (= e!80750 (contains!860 (toList!834 lt!63489) (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(assert (= (and d!37057 res!59945) b!123553))

(assert (= (and b!123553 res!59946) b!123554))

(declare-fun m!143377 () Bool)

(assert (=> d!37057 m!143377))

(declare-fun m!143379 () Bool)

(assert (=> d!37057 m!143379))

(declare-fun m!143381 () Bool)

(assert (=> d!37057 m!143381))

(declare-fun m!143383 () Bool)

(assert (=> d!37057 m!143383))

(declare-fun m!143385 () Bool)

(assert (=> b!123553 m!143385))

(declare-fun m!143387 () Bool)

(assert (=> b!123554 m!143387))

(assert (=> b!123438 d!37057))

(declare-fun d!37059 () Bool)

(assert (=> d!37059 (= (apply!108 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63435) (apply!108 lt!63434 lt!63435))))

(declare-fun lt!63491 () Unit!3833)

(assert (=> d!37059 (= lt!63491 (choose!749 lt!63434 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63435))))

(declare-fun e!80751 () Bool)

(assert (=> d!37059 e!80751))

(declare-fun res!59947 () Bool)

(assert (=> d!37059 (=> (not res!59947) (not e!80751))))

(assert (=> d!37059 (= res!59947 (contains!858 lt!63434 lt!63435))))

(assert (=> d!37059 (= (addApplyDifferent!84 lt!63434 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63435) lt!63491)))

(declare-fun b!123555 () Bool)

(assert (=> b!123555 (= e!80751 (not (= lt!63435 lt!63422)))))

(assert (= (and d!37059 res!59947) b!123555))

(declare-fun m!143389 () Bool)

(assert (=> d!37059 m!143389))

(assert (=> d!37059 m!143243))

(assert (=> d!37059 m!143243))

(assert (=> d!37059 m!143245))

(declare-fun m!143391 () Bool)

(assert (=> d!37059 m!143391))

(assert (=> d!37059 m!143249))

(assert (=> b!123438 d!37059))

(declare-fun d!37061 () Bool)

(assert (=> d!37061 (= (apply!108 lt!63421 lt!63431) (get!1424 (getValueByKey!162 (toList!834 lt!63421) lt!63431)))))

(declare-fun bs!5108 () Bool)

(assert (= bs!5108 d!37061))

(declare-fun m!143393 () Bool)

(assert (=> bs!5108 m!143393))

(assert (=> bs!5108 m!143393))

(declare-fun m!143395 () Bool)

(assert (=> bs!5108 m!143395))

(assert (=> b!123438 d!37061))

(declare-fun d!37063 () Bool)

(declare-fun e!80752 () Bool)

(assert (=> d!37063 e!80752))

(declare-fun res!59948 () Bool)

(assert (=> d!37063 (=> (not res!59948) (not e!80752))))

(declare-fun lt!63494 () ListLongMap!1637)

(assert (=> d!37063 (= res!59948 (contains!858 lt!63494 (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun lt!63492 () List!1684)

(assert (=> d!37063 (= lt!63494 (ListLongMap!1638 lt!63492))))

(declare-fun lt!63495 () Unit!3833)

(declare-fun lt!63493 () Unit!3833)

(assert (=> d!37063 (= lt!63495 lt!63493)))

(assert (=> d!37063 (= (getValueByKey!162 lt!63492 (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37063 (= lt!63493 (lemmaContainsTupThenGetReturnValue!81 lt!63492 (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37063 (= lt!63492 (insertStrictlySorted!84 (toList!834 lt!63421) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37063 (= (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63494)))

(declare-fun b!123556 () Bool)

(declare-fun res!59949 () Bool)

(assert (=> b!123556 (=> (not res!59949) (not e!80752))))

(assert (=> b!123556 (= res!59949 (= (getValueByKey!162 (toList!834 lt!63494) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!123557 () Bool)

(assert (=> b!123557 (= e!80752 (contains!860 (toList!834 lt!63494) (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(assert (= (and d!37063 res!59948) b!123556))

(assert (= (and b!123556 res!59949) b!123557))

(declare-fun m!143397 () Bool)

(assert (=> d!37063 m!143397))

(declare-fun m!143399 () Bool)

(assert (=> d!37063 m!143399))

(declare-fun m!143401 () Bool)

(assert (=> d!37063 m!143401))

(declare-fun m!143403 () Bool)

(assert (=> d!37063 m!143403))

(declare-fun m!143405 () Bool)

(assert (=> b!123556 m!143405))

(declare-fun m!143407 () Bool)

(assert (=> b!123557 m!143407))

(assert (=> b!123438 d!37063))

(declare-fun d!37065 () Bool)

(assert (=> d!37065 (= (apply!108 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63419) (apply!108 lt!63423 lt!63419))))

(declare-fun lt!63496 () Unit!3833)

(assert (=> d!37065 (= lt!63496 (choose!749 lt!63423 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63419))))

(declare-fun e!80753 () Bool)

(assert (=> d!37065 e!80753))

(declare-fun res!59950 () Bool)

(assert (=> d!37065 (=> (not res!59950) (not e!80753))))

(assert (=> d!37065 (= res!59950 (contains!858 lt!63423 lt!63419))))

(assert (=> d!37065 (= (addApplyDifferent!84 lt!63423 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63419) lt!63496)))

(declare-fun b!123558 () Bool)

(assert (=> b!123558 (= e!80753 (not (= lt!63419 lt!63430)))))

(assert (= (and d!37065 res!59950) b!123558))

(declare-fun m!143409 () Bool)

(assert (=> d!37065 m!143409))

(assert (=> d!37065 m!143229))

(assert (=> d!37065 m!143229))

(assert (=> d!37065 m!143255))

(declare-fun m!143411 () Bool)

(assert (=> d!37065 m!143411))

(assert (=> d!37065 m!143257))

(assert (=> b!123438 d!37065))

(declare-fun d!37067 () Bool)

(declare-fun e!80754 () Bool)

(assert (=> d!37067 e!80754))

(declare-fun res!59951 () Bool)

(assert (=> d!37067 (=> (not res!59951) (not e!80754))))

(declare-fun lt!63499 () ListLongMap!1637)

(assert (=> d!37067 (= res!59951 (contains!858 lt!63499 (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun lt!63497 () List!1684)

(assert (=> d!37067 (= lt!63499 (ListLongMap!1638 lt!63497))))

(declare-fun lt!63500 () Unit!3833)

(declare-fun lt!63498 () Unit!3833)

(assert (=> d!37067 (= lt!63500 lt!63498)))

(assert (=> d!37067 (= (getValueByKey!162 lt!63497 (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37067 (= lt!63498 (lemmaContainsTupThenGetReturnValue!81 lt!63497 (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37067 (= lt!63497 (insertStrictlySorted!84 (toList!834 lt!63437) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37067 (= (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63499)))

(declare-fun b!123559 () Bool)

(declare-fun res!59952 () Bool)

(assert (=> b!123559 (=> (not res!59952) (not e!80754))))

(assert (=> b!123559 (= res!59952 (= (getValueByKey!162 (toList!834 lt!63499) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!123560 () Bool)

(assert (=> b!123560 (= e!80754 (contains!860 (toList!834 lt!63499) (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(assert (= (and d!37067 res!59951) b!123559))

(assert (= (and b!123559 res!59952) b!123560))

(declare-fun m!143413 () Bool)

(assert (=> d!37067 m!143413))

(declare-fun m!143415 () Bool)

(assert (=> d!37067 m!143415))

(declare-fun m!143417 () Bool)

(assert (=> d!37067 m!143417))

(declare-fun m!143419 () Bool)

(assert (=> d!37067 m!143419))

(declare-fun m!143421 () Bool)

(assert (=> b!123559 m!143421))

(declare-fun m!143423 () Bool)

(assert (=> b!123560 m!143423))

(assert (=> b!123438 d!37067))

(declare-fun d!37069 () Bool)

(assert (=> d!37069 (= (apply!108 lt!63423 lt!63419) (get!1424 (getValueByKey!162 (toList!834 lt!63423) lt!63419)))))

(declare-fun bs!5109 () Bool)

(assert (= bs!5109 d!37069))

(declare-fun m!143425 () Bool)

(assert (=> bs!5109 m!143425))

(assert (=> bs!5109 m!143425))

(declare-fun m!143427 () Bool)

(assert (=> bs!5109 m!143427))

(assert (=> b!123438 d!37069))

(declare-fun d!37071 () Bool)

(declare-fun e!80759 () Bool)

(assert (=> d!37071 e!80759))

(declare-fun res!59955 () Bool)

(assert (=> d!37071 (=> res!59955 e!80759)))

(declare-fun lt!63510 () Bool)

(assert (=> d!37071 (= res!59955 (not lt!63510))))

(declare-fun lt!63512 () Bool)

(assert (=> d!37071 (= lt!63510 lt!63512)))

(declare-fun lt!63511 () Unit!3833)

(declare-fun e!80760 () Unit!3833)

(assert (=> d!37071 (= lt!63511 e!80760)))

(declare-fun c!22439 () Bool)

(assert (=> d!37071 (= c!22439 lt!63512)))

(declare-fun containsKey!166 (List!1684 (_ BitVec 64)) Bool)

(assert (=> d!37071 (= lt!63512 (containsKey!166 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63417))))

(assert (=> d!37071 (= (contains!858 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63417) lt!63510)))

(declare-fun b!123567 () Bool)

(declare-fun lt!63509 () Unit!3833)

(assert (=> b!123567 (= e!80760 lt!63509)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!115 (List!1684 (_ BitVec 64)) Unit!3833)

(assert (=> b!123567 (= lt!63509 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63417))))

(declare-fun isDefined!116 (Option!168) Bool)

(assert (=> b!123567 (isDefined!116 (getValueByKey!162 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63417))))

(declare-fun b!123568 () Bool)

(declare-fun Unit!3837 () Unit!3833)

(assert (=> b!123568 (= e!80760 Unit!3837)))

(declare-fun b!123569 () Bool)

(assert (=> b!123569 (= e!80759 (isDefined!116 (getValueByKey!162 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63417)))))

(assert (= (and d!37071 c!22439) b!123567))

(assert (= (and d!37071 (not c!22439)) b!123568))

(assert (= (and d!37071 (not res!59955)) b!123569))

(declare-fun m!143429 () Bool)

(assert (=> d!37071 m!143429))

(declare-fun m!143431 () Bool)

(assert (=> b!123567 m!143431))

(declare-fun m!143433 () Bool)

(assert (=> b!123567 m!143433))

(assert (=> b!123567 m!143433))

(declare-fun m!143435 () Bool)

(assert (=> b!123567 m!143435))

(assert (=> b!123569 m!143433))

(assert (=> b!123569 m!143433))

(assert (=> b!123569 m!143435))

(assert (=> b!123438 d!37071))

(declare-fun d!37073 () Bool)

(assert (=> d!37073 (contains!858 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63417)))

(declare-fun lt!63515 () Unit!3833)

(declare-fun choose!750 (ListLongMap!1637 (_ BitVec 64) V!3409 (_ BitVec 64)) Unit!3833)

(assert (=> d!37073 (= lt!63515 (choose!750 lt!63437 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63417))))

(assert (=> d!37073 (contains!858 lt!63437 lt!63417)))

(assert (=> d!37073 (= (addStillContains!84 lt!63437 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63417) lt!63515)))

(declare-fun bs!5110 () Bool)

(assert (= bs!5110 d!37073))

(assert (=> bs!5110 m!143235))

(assert (=> bs!5110 m!143235))

(assert (=> bs!5110 m!143247))

(declare-fun m!143437 () Bool)

(assert (=> bs!5110 m!143437))

(declare-fun m!143439 () Bool)

(assert (=> bs!5110 m!143439))

(assert (=> b!123438 d!37073))

(declare-fun d!37075 () Bool)

(assert (=> d!37075 (= (apply!108 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63435) (get!1424 (getValueByKey!162 (toList!834 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63435)))))

(declare-fun bs!5111 () Bool)

(assert (= bs!5111 d!37075))

(declare-fun m!143441 () Bool)

(assert (=> bs!5111 m!143441))

(assert (=> bs!5111 m!143441))

(declare-fun m!143443 () Bool)

(assert (=> bs!5111 m!143443))

(assert (=> b!123438 d!37075))

(declare-fun d!37077 () Bool)

(declare-fun e!80761 () Bool)

(assert (=> d!37077 e!80761))

(declare-fun res!59956 () Bool)

(assert (=> d!37077 (=> (not res!59956) (not e!80761))))

(declare-fun lt!63518 () ListLongMap!1637)

(assert (=> d!37077 (= res!59956 (contains!858 lt!63518 (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun lt!63516 () List!1684)

(assert (=> d!37077 (= lt!63518 (ListLongMap!1638 lt!63516))))

(declare-fun lt!63519 () Unit!3833)

(declare-fun lt!63517 () Unit!3833)

(assert (=> d!37077 (= lt!63519 lt!63517)))

(assert (=> d!37077 (= (getValueByKey!162 lt!63516 (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37077 (= lt!63517 (lemmaContainsTupThenGetReturnValue!81 lt!63516 (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37077 (= lt!63516 (insertStrictlySorted!84 (toList!834 lt!63434) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37077 (= (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63518)))

(declare-fun b!123571 () Bool)

(declare-fun res!59957 () Bool)

(assert (=> b!123571 (=> (not res!59957) (not e!80761))))

(assert (=> b!123571 (= res!59957 (= (getValueByKey!162 (toList!834 lt!63518) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!123572 () Bool)

(assert (=> b!123572 (= e!80761 (contains!860 (toList!834 lt!63518) (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(assert (= (and d!37077 res!59956) b!123571))

(assert (= (and b!123571 res!59957) b!123572))

(declare-fun m!143445 () Bool)

(assert (=> d!37077 m!143445))

(declare-fun m!143447 () Bool)

(assert (=> d!37077 m!143447))

(declare-fun m!143449 () Bool)

(assert (=> d!37077 m!143449))

(declare-fun m!143451 () Bool)

(assert (=> d!37077 m!143451))

(declare-fun m!143453 () Bool)

(assert (=> b!123571 m!143453))

(declare-fun m!143455 () Bool)

(assert (=> b!123572 m!143455))

(assert (=> b!123438 d!37077))

(declare-fun d!37079 () Bool)

(assert (=> d!37079 (= (apply!108 lt!63434 lt!63435) (get!1424 (getValueByKey!162 (toList!834 lt!63434) lt!63435)))))

(declare-fun bs!5112 () Bool)

(assert (= bs!5112 d!37079))

(declare-fun m!143457 () Bool)

(assert (=> bs!5112 m!143457))

(assert (=> bs!5112 m!143457))

(declare-fun m!143459 () Bool)

(assert (=> bs!5112 m!143459))

(assert (=> b!123438 d!37079))

(declare-fun b!123597 () Bool)

(declare-fun e!80777 () Bool)

(declare-fun e!80779 () Bool)

(assert (=> b!123597 (= e!80777 e!80779)))

(assert (=> b!123597 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun lt!63539 () ListLongMap!1637)

(declare-fun res!59969 () Bool)

(assert (=> b!123597 (= res!59969 (contains!858 lt!63539 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123597 (=> (not res!59969) (not e!80779))))

(declare-fun b!123598 () Bool)

(declare-fun e!80781 () Bool)

(assert (=> b!123598 (= e!80781 e!80777)))

(declare-fun c!22448 () Bool)

(declare-fun e!80776 () Bool)

(assert (=> b!123598 (= c!22448 e!80776)))

(declare-fun res!59967 () Bool)

(assert (=> b!123598 (=> (not res!59967) (not e!80776))))

(assert (=> b!123598 (= res!59967 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!123599 () Bool)

(declare-fun e!80778 () ListLongMap!1637)

(declare-fun call!13125 () ListLongMap!1637)

(assert (=> b!123599 (= e!80778 call!13125)))

(declare-fun bm!13122 () Bool)

(assert (=> bm!13122 (= call!13125 (getCurrentListMapNoExtraKeys!120 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (_values!2737 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992))) (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) (minValue!2619 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun b!123600 () Bool)

(assert (=> b!123600 (= e!80776 (validKeyInArray!0 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123600 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!123601 () Bool)

(assert (=> b!123601 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(assert (=> b!123601 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2458 (_values!2737 (v!3084 (underlying!426 thiss!992))))))))

(assert (=> b!123601 (= e!80779 (= (apply!108 lt!63539 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123602 () Bool)

(declare-fun e!80780 () Bool)

(assert (=> b!123602 (= e!80777 e!80780)))

(declare-fun c!22449 () Bool)

(assert (=> b!123602 (= c!22449 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!123604 () Bool)

(declare-fun res!59966 () Bool)

(assert (=> b!123604 (=> (not res!59966) (not e!80781))))

(assert (=> b!123604 (= res!59966 (not (contains!858 lt!63539 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123605 () Bool)

(declare-fun isEmpty!394 (ListLongMap!1637) Bool)

(assert (=> b!123605 (= e!80780 (isEmpty!394 lt!63539))))

(declare-fun b!123606 () Bool)

(assert (=> b!123606 (= e!80780 (= lt!63539 (getCurrentListMapNoExtraKeys!120 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (_values!2737 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992))) (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) (minValue!2619 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!123607 () Bool)

(declare-fun e!80782 () ListLongMap!1637)

(assert (=> b!123607 (= e!80782 e!80778)))

(declare-fun c!22450 () Bool)

(assert (=> b!123607 (= c!22450 (validKeyInArray!0 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123608 () Bool)

(declare-fun lt!63540 () Unit!3833)

(declare-fun lt!63535 () Unit!3833)

(assert (=> b!123608 (= lt!63540 lt!63535)))

(declare-fun lt!63538 () ListLongMap!1637)

(declare-fun lt!63534 () (_ BitVec 64))

(declare-fun lt!63536 () V!3409)

(declare-fun lt!63537 () (_ BitVec 64))

(assert (=> b!123608 (not (contains!858 (+!155 lt!63538 (tuple2!2525 lt!63534 lt!63536)) lt!63537))))

(declare-fun addStillNotContains!55 (ListLongMap!1637 (_ BitVec 64) V!3409 (_ BitVec 64)) Unit!3833)

(assert (=> b!123608 (= lt!63535 (addStillNotContains!55 lt!63538 lt!63534 lt!63536 lt!63537))))

(assert (=> b!123608 (= lt!63537 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!123608 (= lt!63536 (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123608 (= lt!63534 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!123608 (= lt!63538 call!13125)))

(assert (=> b!123608 (= e!80778 (+!155 call!13125 (tuple2!2525 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!37081 () Bool)

(assert (=> d!37081 e!80781))

(declare-fun res!59968 () Bool)

(assert (=> d!37081 (=> (not res!59968) (not e!80781))))

(assert (=> d!37081 (= res!59968 (not (contains!858 lt!63539 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37081 (= lt!63539 e!80782)))

(declare-fun c!22451 () Bool)

(assert (=> d!37081 (= c!22451 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(assert (=> d!37081 (validMask!0 (mask!6991 (v!3084 (underlying!426 thiss!992))))))

(assert (=> d!37081 (= (getCurrentListMapNoExtraKeys!120 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (_values!2737 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992))) (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) (minValue!2619 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992)))) lt!63539)))

(declare-fun b!123603 () Bool)

(assert (=> b!123603 (= e!80782 (ListLongMap!1638 Nil!1681))))

(assert (= (and d!37081 c!22451) b!123603))

(assert (= (and d!37081 (not c!22451)) b!123607))

(assert (= (and b!123607 c!22450) b!123608))

(assert (= (and b!123607 (not c!22450)) b!123599))

(assert (= (or b!123608 b!123599) bm!13122))

(assert (= (and d!37081 res!59968) b!123604))

(assert (= (and b!123604 res!59966) b!123598))

(assert (= (and b!123598 res!59967) b!123600))

(assert (= (and b!123598 c!22448) b!123597))

(assert (= (and b!123598 (not c!22448)) b!123602))

(assert (= (and b!123597 res!59969) b!123601))

(assert (= (and b!123602 c!22449) b!123606))

(assert (= (and b!123602 (not c!22449)) b!123605))

(declare-fun b_lambda!5417 () Bool)

(assert (=> (not b_lambda!5417) (not b!123601)))

(assert (=> b!123601 t!5980))

(declare-fun b_and!7577 () Bool)

(assert (= b_and!7573 (and (=> t!5980 result!3763) b_and!7577)))

(assert (=> b!123601 t!5982))

(declare-fun b_and!7579 () Bool)

(assert (= b_and!7575 (and (=> t!5982 result!3767) b_and!7579)))

(declare-fun b_lambda!5419 () Bool)

(assert (=> (not b_lambda!5419) (not b!123608)))

(assert (=> b!123608 t!5980))

(declare-fun b_and!7581 () Bool)

(assert (= b_and!7577 (and (=> t!5980 result!3763) b_and!7581)))

(assert (=> b!123608 t!5982))

(declare-fun b_and!7583 () Bool)

(assert (= b_and!7579 (and (=> t!5982 result!3767) b_and!7583)))

(declare-fun m!143461 () Bool)

(assert (=> bm!13122 m!143461))

(assert (=> b!123597 m!143205))

(assert (=> b!123597 m!143205))

(declare-fun m!143463 () Bool)

(assert (=> b!123597 m!143463))

(declare-fun m!143465 () Bool)

(assert (=> b!123608 m!143465))

(assert (=> b!123608 m!143201))

(declare-fun m!143467 () Bool)

(assert (=> b!123608 m!143467))

(assert (=> b!123608 m!143205))

(assert (=> b!123608 m!143467))

(declare-fun m!143469 () Bool)

(assert (=> b!123608 m!143469))

(assert (=> b!123608 m!143201))

(assert (=> b!123608 m!143203))

(assert (=> b!123608 m!143207))

(declare-fun m!143471 () Bool)

(assert (=> b!123608 m!143471))

(assert (=> b!123608 m!143203))

(assert (=> b!123607 m!143205))

(assert (=> b!123607 m!143205))

(assert (=> b!123607 m!143217))

(assert (=> b!123601 m!143203))

(assert (=> b!123601 m!143201))

(assert (=> b!123601 m!143205))

(declare-fun m!143473 () Bool)

(assert (=> b!123601 m!143473))

(assert (=> b!123601 m!143205))

(assert (=> b!123601 m!143201))

(assert (=> b!123601 m!143203))

(assert (=> b!123601 m!143207))

(assert (=> b!123606 m!143461))

(declare-fun m!143475 () Bool)

(assert (=> b!123604 m!143475))

(declare-fun m!143477 () Bool)

(assert (=> b!123605 m!143477))

(assert (=> b!123600 m!143205))

(assert (=> b!123600 m!143205))

(assert (=> b!123600 m!143217))

(declare-fun m!143479 () Bool)

(assert (=> d!37081 m!143479))

(assert (=> d!37081 m!143219))

(assert (=> b!123438 d!37081))

(declare-fun d!37083 () Bool)

(assert (=> d!37083 (= (apply!108 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63419) (get!1424 (getValueByKey!162 (toList!834 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63419)))))

(declare-fun bs!5113 () Bool)

(assert (= bs!5113 d!37083))

(declare-fun m!143481 () Bool)

(assert (=> bs!5113 m!143481))

(assert (=> bs!5113 m!143481))

(declare-fun m!143483 () Bool)

(assert (=> bs!5113 m!143483))

(assert (=> b!123438 d!37083))

(declare-fun d!37085 () Bool)

(assert (=> d!37085 (= (apply!108 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63431) (get!1424 (getValueByKey!162 (toList!834 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63431)))))

(declare-fun bs!5114 () Bool)

(assert (= bs!5114 d!37085))

(declare-fun m!143485 () Bool)

(assert (=> bs!5114 m!143485))

(assert (=> bs!5114 m!143485))

(declare-fun m!143487 () Bool)

(assert (=> bs!5114 m!143487))

(assert (=> b!123438 d!37085))

(declare-fun d!37087 () Bool)

(declare-fun res!59978 () Bool)

(declare-fun e!80785 () Bool)

(assert (=> d!37087 (=> (not res!59978) (not e!80785))))

(assert (=> d!37087 (= res!59978 (validMask!0 (mask!6991 newMap!16)))))

(assert (=> d!37087 (= (simpleValid!84 newMap!16) e!80785)))

(declare-fun b!123617 () Bool)

(declare-fun res!59980 () Bool)

(assert (=> b!123617 (=> (not res!59980) (not e!80785))))

(assert (=> b!123617 (= res!59980 (and (= (size!2458 (_values!2737 newMap!16)) (bvadd (mask!6991 newMap!16) #b00000000000000000000000000000001)) (= (size!2457 (_keys!4480 newMap!16)) (size!2458 (_values!2737 newMap!16))) (bvsge (_size!570 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!570 newMap!16) (bvadd (mask!6991 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!123619 () Bool)

(declare-fun res!59981 () Bool)

(assert (=> b!123619 (=> (not res!59981) (not e!80785))))

(declare-fun size!2463 (LongMapFixedSize!1042) (_ BitVec 32))

(assert (=> b!123619 (= res!59981 (= (size!2463 newMap!16) (bvadd (_size!570 newMap!16) (bvsdiv (bvadd (extraKeys!2539 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!123618 () Bool)

(declare-fun res!59979 () Bool)

(assert (=> b!123618 (=> (not res!59979) (not e!80785))))

(assert (=> b!123618 (= res!59979 (bvsge (size!2463 newMap!16) (_size!570 newMap!16)))))

(declare-fun b!123620 () Bool)

(assert (=> b!123620 (= e!80785 (and (bvsge (extraKeys!2539 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2539 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!570 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!37087 res!59978) b!123617))

(assert (= (and b!123617 res!59980) b!123618))

(assert (= (and b!123618 res!59979) b!123619))

(assert (= (and b!123619 res!59981) b!123620))

(assert (=> d!37087 m!143333))

(declare-fun m!143489 () Bool)

(assert (=> b!123619 m!143489))

(assert (=> b!123618 m!143489))

(assert (=> d!37033 d!37087))

(declare-fun d!37089 () Bool)

(declare-fun res!59982 () Bool)

(declare-fun e!80786 () Bool)

(assert (=> d!37089 (=> (not res!59982) (not e!80786))))

(assert (=> d!37089 (= res!59982 (simpleValid!84 (v!3084 (underlying!426 thiss!992))))))

(assert (=> d!37089 (= (valid!499 (v!3084 (underlying!426 thiss!992))) e!80786)))

(declare-fun b!123621 () Bool)

(declare-fun res!59983 () Bool)

(assert (=> b!123621 (=> (not res!59983) (not e!80786))))

(assert (=> b!123621 (= res!59983 (= (arrayCountValidKeys!0 (_keys!4480 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000000 (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))) (_size!570 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun b!123622 () Bool)

(declare-fun res!59984 () Bool)

(assert (=> b!123622 (=> (not res!59984) (not e!80786))))

(assert (=> b!123622 (= res!59984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun b!123623 () Bool)

(assert (=> b!123623 (= e!80786 (arrayNoDuplicates!0 (_keys!4480 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000000 Nil!1682))))

(assert (= (and d!37089 res!59982) b!123621))

(assert (= (and b!123621 res!59983) b!123622))

(assert (= (and b!123622 res!59984) b!123623))

(declare-fun m!143491 () Bool)

(assert (=> d!37089 m!143491))

(declare-fun m!143493 () Bool)

(assert (=> b!123621 m!143493))

(declare-fun m!143495 () Bool)

(assert (=> b!123622 m!143495))

(declare-fun m!143497 () Bool)

(assert (=> b!123623 m!143497))

(assert (=> d!37023 d!37089))

(assert (=> b!123445 d!37037))

(declare-fun d!37091 () Bool)

(assert (=> d!37091 (= (apply!108 lt!63433 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1424 (getValueByKey!162 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5115 () Bool)

(assert (= bs!5115 d!37091))

(declare-fun m!143499 () Bool)

(assert (=> bs!5115 m!143499))

(assert (=> bs!5115 m!143499))

(declare-fun m!143501 () Bool)

(assert (=> bs!5115 m!143501))

(assert (=> b!123452 d!37091))

(declare-fun d!37093 () Bool)

(declare-fun e!80787 () Bool)

(assert (=> d!37093 e!80787))

(declare-fun res!59985 () Bool)

(assert (=> d!37093 (=> (not res!59985) (not e!80787))))

(declare-fun lt!63543 () ListLongMap!1637)

(assert (=> d!37093 (= res!59985 (contains!858 lt!63543 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun lt!63541 () List!1684)

(assert (=> d!37093 (= lt!63543 (ListLongMap!1638 lt!63541))))

(declare-fun lt!63544 () Unit!3833)

(declare-fun lt!63542 () Unit!3833)

(assert (=> d!37093 (= lt!63544 lt!63542)))

(assert (=> d!37093 (= (getValueByKey!162 lt!63541 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37093 (= lt!63542 (lemmaContainsTupThenGetReturnValue!81 lt!63541 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37093 (= lt!63541 (insertStrictlySorted!84 (toList!834 call!13103) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37093 (= (+!155 call!13103 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63543)))

(declare-fun b!123624 () Bool)

(declare-fun res!59986 () Bool)

(assert (=> b!123624 (=> (not res!59986) (not e!80787))))

(assert (=> b!123624 (= res!59986 (= (getValueByKey!162 (toList!834 lt!63543) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!123625 () Bool)

(assert (=> b!123625 (= e!80787 (contains!860 (toList!834 lt!63543) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(assert (= (and d!37093 res!59985) b!123624))

(assert (= (and b!123624 res!59986) b!123625))

(declare-fun m!143503 () Bool)

(assert (=> d!37093 m!143503))

(declare-fun m!143505 () Bool)

(assert (=> d!37093 m!143505))

(declare-fun m!143507 () Bool)

(assert (=> d!37093 m!143507))

(declare-fun m!143509 () Bool)

(assert (=> d!37093 m!143509))

(declare-fun m!143511 () Bool)

(assert (=> b!123624 m!143511))

(declare-fun m!143513 () Bool)

(assert (=> b!123625 m!143513))

(assert (=> b!123444 d!37093))

(declare-fun d!37095 () Bool)

(declare-fun e!80788 () Bool)

(assert (=> d!37095 e!80788))

(declare-fun res!59987 () Bool)

(assert (=> d!37095 (=> res!59987 e!80788)))

(declare-fun lt!63546 () Bool)

(assert (=> d!37095 (= res!59987 (not lt!63546))))

(declare-fun lt!63548 () Bool)

(assert (=> d!37095 (= lt!63546 lt!63548)))

(declare-fun lt!63547 () Unit!3833)

(declare-fun e!80789 () Unit!3833)

(assert (=> d!37095 (= lt!63547 e!80789)))

(declare-fun c!22452 () Bool)

(assert (=> d!37095 (= c!22452 lt!63548)))

(assert (=> d!37095 (= lt!63548 (containsKey!166 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37095 (= (contains!858 lt!63433 #b1000000000000000000000000000000000000000000000000000000000000000) lt!63546)))

(declare-fun b!123626 () Bool)

(declare-fun lt!63545 () Unit!3833)

(assert (=> b!123626 (= e!80789 lt!63545)))

(assert (=> b!123626 (= lt!63545 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123626 (isDefined!116 (getValueByKey!162 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123627 () Bool)

(declare-fun Unit!3838 () Unit!3833)

(assert (=> b!123627 (= e!80789 Unit!3838)))

(declare-fun b!123628 () Bool)

(assert (=> b!123628 (= e!80788 (isDefined!116 (getValueByKey!162 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37095 c!22452) b!123626))

(assert (= (and d!37095 (not c!22452)) b!123627))

(assert (= (and d!37095 (not res!59987)) b!123628))

(declare-fun m!143515 () Bool)

(assert (=> d!37095 m!143515))

(declare-fun m!143517 () Bool)

(assert (=> b!123626 m!143517))

(assert (=> b!123626 m!143275))

(assert (=> b!123626 m!143275))

(declare-fun m!143519 () Bool)

(assert (=> b!123626 m!143519))

(assert (=> b!123628 m!143275))

(assert (=> b!123628 m!143275))

(assert (=> b!123628 m!143519))

(assert (=> bm!13102 d!37095))

(declare-fun d!37097 () Bool)

(declare-fun e!80790 () Bool)

(assert (=> d!37097 e!80790))

(declare-fun res!59988 () Bool)

(assert (=> d!37097 (=> res!59988 e!80790)))

(declare-fun lt!63550 () Bool)

(assert (=> d!37097 (= res!59988 (not lt!63550))))

(declare-fun lt!63552 () Bool)

(assert (=> d!37097 (= lt!63550 lt!63552)))

(declare-fun lt!63551 () Unit!3833)

(declare-fun e!80791 () Unit!3833)

(assert (=> d!37097 (= lt!63551 e!80791)))

(declare-fun c!22453 () Bool)

(assert (=> d!37097 (= c!22453 lt!63552)))

(assert (=> d!37097 (= lt!63552 (containsKey!166 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37097 (= (contains!858 lt!63433 #b0000000000000000000000000000000000000000000000000000000000000000) lt!63550)))

(declare-fun b!123629 () Bool)

(declare-fun lt!63549 () Unit!3833)

(assert (=> b!123629 (= e!80791 lt!63549)))

(assert (=> b!123629 (= lt!63549 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123629 (isDefined!116 (getValueByKey!162 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123630 () Bool)

(declare-fun Unit!3839 () Unit!3833)

(assert (=> b!123630 (= e!80791 Unit!3839)))

(declare-fun b!123631 () Bool)

(assert (=> b!123631 (= e!80790 (isDefined!116 (getValueByKey!162 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37097 c!22453) b!123629))

(assert (= (and d!37097 (not c!22453)) b!123630))

(assert (= (and d!37097 (not res!59988)) b!123631))

(declare-fun m!143521 () Bool)

(assert (=> d!37097 m!143521))

(declare-fun m!143523 () Bool)

(assert (=> b!123629 m!143523))

(assert (=> b!123629 m!143499))

(assert (=> b!123629 m!143499))

(declare-fun m!143525 () Bool)

(assert (=> b!123629 m!143525))

(assert (=> b!123631 m!143499))

(assert (=> b!123631 m!143499))

(assert (=> b!123631 m!143525))

(assert (=> bm!13098 d!37097))

(declare-fun d!37099 () Bool)

(declare-fun e!80792 () Bool)

(assert (=> d!37099 e!80792))

(declare-fun res!59989 () Bool)

(assert (=> d!37099 (=> res!59989 e!80792)))

(declare-fun lt!63554 () Bool)

(assert (=> d!37099 (= res!59989 (not lt!63554))))

(declare-fun lt!63556 () Bool)

(assert (=> d!37099 (= lt!63554 lt!63556)))

(declare-fun lt!63555 () Unit!3833)

(declare-fun e!80793 () Unit!3833)

(assert (=> d!37099 (= lt!63555 e!80793)))

(declare-fun c!22454 () Bool)

(assert (=> d!37099 (= c!22454 lt!63556)))

(assert (=> d!37099 (= lt!63556 (containsKey!166 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!37099 (= (contains!858 lt!63433 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!63554)))

(declare-fun b!123632 () Bool)

(declare-fun lt!63553 () Unit!3833)

(assert (=> b!123632 (= e!80793 lt!63553)))

(assert (=> b!123632 (= lt!63553 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123632 (isDefined!116 (getValueByKey!162 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123633 () Bool)

(declare-fun Unit!3840 () Unit!3833)

(assert (=> b!123633 (= e!80793 Unit!3840)))

(declare-fun b!123634 () Bool)

(assert (=> b!123634 (= e!80792 (isDefined!116 (getValueByKey!162 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!37099 c!22454) b!123632))

(assert (= (and d!37099 (not c!22454)) b!123633))

(assert (= (and d!37099 (not res!59989)) b!123634))

(assert (=> d!37099 m!143205))

(declare-fun m!143527 () Bool)

(assert (=> d!37099 m!143527))

(assert (=> b!123632 m!143205))

(declare-fun m!143529 () Bool)

(assert (=> b!123632 m!143529))

(assert (=> b!123632 m!143205))

(assert (=> b!123632 m!143279))

(assert (=> b!123632 m!143279))

(declare-fun m!143531 () Bool)

(assert (=> b!123632 m!143531))

(assert (=> b!123634 m!143205))

(assert (=> b!123634 m!143279))

(assert (=> b!123634 m!143279))

(assert (=> b!123634 m!143531))

(assert (=> b!123435 d!37099))

(assert (=> bm!13101 d!37081))

(declare-fun mapNonEmpty!4437 () Bool)

(declare-fun mapRes!4437 () Bool)

(declare-fun tp!10845 () Bool)

(declare-fun e!80794 () Bool)

(assert (=> mapNonEmpty!4437 (= mapRes!4437 (and tp!10845 e!80794))))

(declare-fun mapKey!4437 () (_ BitVec 32))

(declare-fun mapRest!4437 () (Array (_ BitVec 32) ValueCell!1067))

(declare-fun mapValue!4437 () ValueCell!1067)

(assert (=> mapNonEmpty!4437 (= mapRest!4436 (store mapRest!4437 mapKey!4437 mapValue!4437))))

(declare-fun b!123636 () Bool)

(declare-fun e!80795 () Bool)

(assert (=> b!123636 (= e!80795 tp_is_empty!2821)))

(declare-fun mapIsEmpty!4437 () Bool)

(assert (=> mapIsEmpty!4437 mapRes!4437))

(declare-fun b!123635 () Bool)

(assert (=> b!123635 (= e!80794 tp_is_empty!2821)))

(declare-fun condMapEmpty!4437 () Bool)

(declare-fun mapDefault!4437 () ValueCell!1067)

(assert (=> mapNonEmpty!4436 (= condMapEmpty!4437 (= mapRest!4436 ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4437)))))

(assert (=> mapNonEmpty!4436 (= tp!10844 (and e!80795 mapRes!4437))))

(assert (= (and mapNonEmpty!4436 condMapEmpty!4437) mapIsEmpty!4437))

(assert (= (and mapNonEmpty!4436 (not condMapEmpty!4437)) mapNonEmpty!4437))

(assert (= (and mapNonEmpty!4437 ((_ is ValueCellFull!1067) mapValue!4437)) b!123635))

(assert (= (and mapNonEmpty!4436 ((_ is ValueCellFull!1067) mapDefault!4437)) b!123636))

(declare-fun m!143533 () Bool)

(assert (=> mapNonEmpty!4437 m!143533))

(declare-fun mapNonEmpty!4438 () Bool)

(declare-fun mapRes!4438 () Bool)

(declare-fun tp!10846 () Bool)

(declare-fun e!80796 () Bool)

(assert (=> mapNonEmpty!4438 (= mapRes!4438 (and tp!10846 e!80796))))

(declare-fun mapValue!4438 () ValueCell!1067)

(declare-fun mapKey!4438 () (_ BitVec 32))

(declare-fun mapRest!4438 () (Array (_ BitVec 32) ValueCell!1067))

(assert (=> mapNonEmpty!4438 (= mapRest!4435 (store mapRest!4438 mapKey!4438 mapValue!4438))))

(declare-fun b!123638 () Bool)

(declare-fun e!80797 () Bool)

(assert (=> b!123638 (= e!80797 tp_is_empty!2821)))

(declare-fun mapIsEmpty!4438 () Bool)

(assert (=> mapIsEmpty!4438 mapRes!4438))

(declare-fun b!123637 () Bool)

(assert (=> b!123637 (= e!80796 tp_is_empty!2821)))

(declare-fun condMapEmpty!4438 () Bool)

(declare-fun mapDefault!4438 () ValueCell!1067)

(assert (=> mapNonEmpty!4435 (= condMapEmpty!4438 (= mapRest!4435 ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4438)))))

(assert (=> mapNonEmpty!4435 (= tp!10843 (and e!80797 mapRes!4438))))

(assert (= (and mapNonEmpty!4435 condMapEmpty!4438) mapIsEmpty!4438))

(assert (= (and mapNonEmpty!4435 (not condMapEmpty!4438)) mapNonEmpty!4438))

(assert (= (and mapNonEmpty!4438 ((_ is ValueCellFull!1067) mapValue!4438)) b!123637))

(assert (= (and mapNonEmpty!4435 ((_ is ValueCellFull!1067) mapDefault!4438)) b!123638))

(declare-fun m!143535 () Bool)

(assert (=> mapNonEmpty!4438 m!143535))

(declare-fun b_lambda!5421 () Bool)

(assert (= b_lambda!5417 (or (and b!123295 b_free!2809) (and b!123290 b_free!2811 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))))) b_lambda!5421)))

(declare-fun b_lambda!5423 () Bool)

(assert (= b_lambda!5415 (or (and b!123295 b_free!2809 (= (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) (defaultEntry!2754 newMap!16))) (and b!123290 b_free!2811) b_lambda!5423)))

(declare-fun b_lambda!5425 () Bool)

(assert (= b_lambda!5419 (or (and b!123295 b_free!2809) (and b!123290 b_free!2811 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))))) b_lambda!5425)))

(check-sat (not d!37083) (not b!123572) (not b!123559) (not b!123515) (not b!123507) (not d!37099) (not b!123597) (not b!123621) (not bm!13114) (not b!123628) (not b!123556) (not d!37069) (not b!123538) (not b!123618) (not bm!13122) (not b!123607) (not mapNonEmpty!4438) (not b!123506) (not b!123514) (not d!37085) (not b!123605) (not d!37095) (not d!37053) (not b_next!2811) (not b!123629) (not b!123492) (not b!123569) (not d!37075) (not b!123608) (not mapNonEmpty!4437) (not b!123524) (not b!123544) (not d!37079) (not d!37097) (not b!123535) (not b!123606) (not d!37049) (not b!123527) (not d!37071) (not b!123553) (not d!37065) (not d!37093) (not d!37067) (not bm!13109) (not b!123626) (not b!123622) (not d!37081) (not bm!13112) (not b!123545) b_and!7581 (not d!37087) (not b!123619) (not d!37055) (not b!123632) (not b!123623) (not b!123624) (not b!123537) (not b!123604) tp_is_empty!2821 (not d!37059) (not b!123509) (not d!37077) (not bm!13118) (not b!123601) (not b!123634) (not b_lambda!5425) (not b!123542) (not b_lambda!5421) (not bm!13115) (not b!123531) (not b!123600) (not b!123625) (not b!123571) (not d!37063) (not bm!13106) (not b!123481) (not d!37073) (not bm!13117) (not b!123631) (not b!123567) (not b_lambda!5413) (not b!123528) (not d!37041) (not d!37091) (not d!37035) (not b_lambda!5423) (not d!37089) (not d!37057) (not d!37061) (not b!123482) (not b!123557) b_and!7583 (not b_next!2809) (not b!123560) (not b!123554))
(check-sat b_and!7581 b_and!7583 (not b_next!2809) (not b_next!2811))
(get-model)

(declare-fun d!37101 () Bool)

(assert (=> d!37101 (= (get!1425 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3083 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123481 d!37101))

(declare-fun b!123649 () Bool)

(declare-fun e!80803 () Option!168)

(assert (=> b!123649 (= e!80803 (getValueByKey!162 (t!5978 (toList!834 lt!63494)) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123648 () Bool)

(declare-fun e!80802 () Option!168)

(assert (=> b!123648 (= e!80802 e!80803)))

(declare-fun c!22460 () Bool)

(assert (=> b!123648 (= c!22460 (and ((_ is Cons!1680) (toList!834 lt!63494)) (not (= (_1!1273 (h!2281 (toList!834 lt!63494))) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun b!123647 () Bool)

(assert (=> b!123647 (= e!80802 (Some!167 (_2!1273 (h!2281 (toList!834 lt!63494)))))))

(declare-fun b!123650 () Bool)

(assert (=> b!123650 (= e!80803 None!166)))

(declare-fun d!37103 () Bool)

(declare-fun c!22459 () Bool)

(assert (=> d!37103 (= c!22459 (and ((_ is Cons!1680) (toList!834 lt!63494)) (= (_1!1273 (h!2281 (toList!834 lt!63494))) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37103 (= (getValueByKey!162 (toList!834 lt!63494) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) e!80802)))

(assert (= (and d!37103 c!22459) b!123647))

(assert (= (and d!37103 (not c!22459)) b!123648))

(assert (= (and b!123648 c!22460) b!123649))

(assert (= (and b!123648 (not c!22460)) b!123650))

(declare-fun m!143537 () Bool)

(assert (=> b!123649 m!143537))

(assert (=> b!123556 d!37103))

(declare-fun b!123651 () Bool)

(declare-fun e!80806 () Bool)

(declare-fun call!13126 () Bool)

(assert (=> b!123651 (= e!80806 call!13126)))

(declare-fun b!123652 () Bool)

(declare-fun e!80804 () Bool)

(declare-fun e!80807 () Bool)

(assert (=> b!123652 (= e!80804 e!80807)))

(declare-fun res!59990 () Bool)

(assert (=> b!123652 (=> (not res!59990) (not e!80807))))

(declare-fun e!80805 () Bool)

(assert (=> b!123652 (= res!59990 (not e!80805))))

(declare-fun res!59991 () Bool)

(assert (=> b!123652 (=> (not res!59991) (not e!80805))))

(assert (=> b!123652 (= res!59991 (validKeyInArray!0 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!123653 () Bool)

(assert (=> b!123653 (= e!80807 e!80806)))

(declare-fun c!22461 () Bool)

(assert (=> b!123653 (= c!22461 (validKeyInArray!0 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!37105 () Bool)

(declare-fun res!59992 () Bool)

(assert (=> d!37105 (=> res!59992 e!80804)))

(assert (=> d!37105 (= res!59992 (bvsge #b00000000000000000000000000000000 (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(assert (=> d!37105 (= (arrayNoDuplicates!0 (_keys!4480 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000000 Nil!1682) e!80804)))

(declare-fun b!123654 () Bool)

(assert (=> b!123654 (= e!80806 call!13126)))

(declare-fun bm!13123 () Bool)

(assert (=> bm!13123 (= call!13126 (arrayNoDuplicates!0 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22461 (Cons!1681 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) #b00000000000000000000000000000000) Nil!1682) Nil!1682)))))

(declare-fun b!123655 () Bool)

(assert (=> b!123655 (= e!80805 (contains!859 Nil!1682 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!37105 (not res!59992)) b!123652))

(assert (= (and b!123652 res!59991) b!123655))

(assert (= (and b!123652 res!59990) b!123653))

(assert (= (and b!123653 c!22461) b!123651))

(assert (= (and b!123653 (not c!22461)) b!123654))

(assert (= (or b!123651 b!123654) bm!13123))

(declare-fun m!143539 () Bool)

(assert (=> b!123652 m!143539))

(assert (=> b!123652 m!143539))

(declare-fun m!143541 () Bool)

(assert (=> b!123652 m!143541))

(assert (=> b!123653 m!143539))

(assert (=> b!123653 m!143539))

(assert (=> b!123653 m!143541))

(assert (=> bm!13123 m!143539))

(declare-fun m!143543 () Bool)

(assert (=> bm!13123 m!143543))

(assert (=> b!123655 m!143539))

(assert (=> b!123655 m!143539))

(declare-fun m!143545 () Bool)

(assert (=> b!123655 m!143545))

(assert (=> b!123623 d!37105))

(declare-fun d!37107 () Bool)

(assert (=> d!37107 (= (validKeyInArray!0 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!123492 d!37107))

(declare-fun d!37109 () Bool)

(declare-fun e!80808 () Bool)

(assert (=> d!37109 e!80808))

(declare-fun res!59993 () Bool)

(assert (=> d!37109 (=> res!59993 e!80808)))

(declare-fun lt!63558 () Bool)

(assert (=> d!37109 (= res!59993 (not lt!63558))))

(declare-fun lt!63560 () Bool)

(assert (=> d!37109 (= lt!63558 lt!63560)))

(declare-fun lt!63559 () Unit!3833)

(declare-fun e!80809 () Unit!3833)

(assert (=> d!37109 (= lt!63559 e!80809)))

(declare-fun c!22462 () Bool)

(assert (=> d!37109 (= c!22462 lt!63560)))

(assert (=> d!37109 (= lt!63560 (containsKey!166 (toList!834 lt!63479) (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37109 (= (contains!858 lt!63479 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)) lt!63558)))

(declare-fun b!123656 () Bool)

(declare-fun lt!63557 () Unit!3833)

(assert (=> b!123656 (= e!80809 lt!63557)))

(assert (=> b!123656 (= lt!63557 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63479) (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!123656 (isDefined!116 (getValueByKey!162 (toList!834 lt!63479) (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123657 () Bool)

(declare-fun Unit!3841 () Unit!3833)

(assert (=> b!123657 (= e!80809 Unit!3841)))

(declare-fun b!123658 () Bool)

(assert (=> b!123658 (= e!80808 (isDefined!116 (getValueByKey!162 (toList!834 lt!63479) (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!37109 c!22462) b!123656))

(assert (= (and d!37109 (not c!22462)) b!123657))

(assert (= (and d!37109 (not res!59993)) b!123658))

(assert (=> d!37109 m!143287))

(declare-fun m!143547 () Bool)

(assert (=> d!37109 m!143547))

(assert (=> b!123656 m!143287))

(declare-fun m!143549 () Bool)

(assert (=> b!123656 m!143549))

(assert (=> b!123656 m!143287))

(declare-fun m!143551 () Bool)

(assert (=> b!123656 m!143551))

(assert (=> b!123656 m!143551))

(declare-fun m!143553 () Bool)

(assert (=> b!123656 m!143553))

(assert (=> b!123658 m!143287))

(assert (=> b!123658 m!143551))

(assert (=> b!123658 m!143551))

(assert (=> b!123658 m!143553))

(assert (=> b!123528 d!37109))

(declare-fun d!37111 () Bool)

(declare-fun e!80810 () Bool)

(assert (=> d!37111 e!80810))

(declare-fun res!59994 () Bool)

(assert (=> d!37111 (=> res!59994 e!80810)))

(declare-fun lt!63562 () Bool)

(assert (=> d!37111 (= res!59994 (not lt!63562))))

(declare-fun lt!63564 () Bool)

(assert (=> d!37111 (= lt!63562 lt!63564)))

(declare-fun lt!63563 () Unit!3833)

(declare-fun e!80811 () Unit!3833)

(assert (=> d!37111 (= lt!63563 e!80811)))

(declare-fun c!22463 () Bool)

(assert (=> d!37111 (= c!22463 lt!63564)))

(assert (=> d!37111 (= lt!63564 (containsKey!166 (toList!834 lt!63543) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37111 (= (contains!858 lt!63543 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63562)))

(declare-fun b!123659 () Bool)

(declare-fun lt!63561 () Unit!3833)

(assert (=> b!123659 (= e!80811 lt!63561)))

(assert (=> b!123659 (= lt!63561 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63543) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> b!123659 (isDefined!116 (getValueByKey!162 (toList!834 lt!63543) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123660 () Bool)

(declare-fun Unit!3842 () Unit!3833)

(assert (=> b!123660 (= e!80811 Unit!3842)))

(declare-fun b!123661 () Bool)

(assert (=> b!123661 (= e!80810 (isDefined!116 (getValueByKey!162 (toList!834 lt!63543) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (= (and d!37111 c!22463) b!123659))

(assert (= (and d!37111 (not c!22463)) b!123660))

(assert (= (and d!37111 (not res!59994)) b!123661))

(declare-fun m!143555 () Bool)

(assert (=> d!37111 m!143555))

(declare-fun m!143557 () Bool)

(assert (=> b!123659 m!143557))

(assert (=> b!123659 m!143511))

(assert (=> b!123659 m!143511))

(declare-fun m!143559 () Bool)

(assert (=> b!123659 m!143559))

(assert (=> b!123661 m!143511))

(assert (=> b!123661 m!143511))

(assert (=> b!123661 m!143559))

(assert (=> d!37093 d!37111))

(declare-fun b!123664 () Bool)

(declare-fun e!80813 () Option!168)

(assert (=> b!123664 (= e!80813 (getValueByKey!162 (t!5978 lt!63541) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123663 () Bool)

(declare-fun e!80812 () Option!168)

(assert (=> b!123663 (= e!80812 e!80813)))

(declare-fun c!22465 () Bool)

(assert (=> b!123663 (= c!22465 (and ((_ is Cons!1680) lt!63541) (not (= (_1!1273 (h!2281 lt!63541)) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun b!123662 () Bool)

(assert (=> b!123662 (= e!80812 (Some!167 (_2!1273 (h!2281 lt!63541))))))

(declare-fun b!123665 () Bool)

(assert (=> b!123665 (= e!80813 None!166)))

(declare-fun d!37113 () Bool)

(declare-fun c!22464 () Bool)

(assert (=> d!37113 (= c!22464 (and ((_ is Cons!1680) lt!63541) (= (_1!1273 (h!2281 lt!63541)) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37113 (= (getValueByKey!162 lt!63541 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) e!80812)))

(assert (= (and d!37113 c!22464) b!123662))

(assert (= (and d!37113 (not c!22464)) b!123663))

(assert (= (and b!123663 c!22465) b!123664))

(assert (= (and b!123663 (not c!22465)) b!123665))

(declare-fun m!143561 () Bool)

(assert (=> b!123664 m!143561))

(assert (=> d!37093 d!37113))

(declare-fun d!37115 () Bool)

(assert (=> d!37115 (= (getValueByKey!162 lt!63541 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun lt!63567 () Unit!3833)

(declare-fun choose!751 (List!1684 (_ BitVec 64) V!3409) Unit!3833)

(assert (=> d!37115 (= lt!63567 (choose!751 lt!63541 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun e!80816 () Bool)

(assert (=> d!37115 e!80816))

(declare-fun res!59999 () Bool)

(assert (=> d!37115 (=> (not res!59999) (not e!80816))))

(declare-fun isStrictlySorted!310 (List!1684) Bool)

(assert (=> d!37115 (= res!59999 (isStrictlySorted!310 lt!63541))))

(assert (=> d!37115 (= (lemmaContainsTupThenGetReturnValue!81 lt!63541 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63567)))

(declare-fun b!123670 () Bool)

(declare-fun res!60000 () Bool)

(assert (=> b!123670 (=> (not res!60000) (not e!80816))))

(assert (=> b!123670 (= res!60000 (containsKey!166 lt!63541 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123671 () Bool)

(assert (=> b!123671 (= e!80816 (contains!860 lt!63541 (tuple2!2525 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (= (and d!37115 res!59999) b!123670))

(assert (= (and b!123670 res!60000) b!123671))

(assert (=> d!37115 m!143505))

(declare-fun m!143563 () Bool)

(assert (=> d!37115 m!143563))

(declare-fun m!143565 () Bool)

(assert (=> d!37115 m!143565))

(declare-fun m!143567 () Bool)

(assert (=> b!123670 m!143567))

(declare-fun m!143569 () Bool)

(assert (=> b!123671 m!143569))

(assert (=> d!37093 d!37115))

(declare-fun b!123692 () Bool)

(declare-fun e!80831 () List!1684)

(declare-fun call!13135 () List!1684)

(assert (=> b!123692 (= e!80831 call!13135)))

(declare-fun b!123693 () Bool)

(declare-fun e!80830 () List!1684)

(assert (=> b!123693 (= e!80830 e!80831)))

(declare-fun c!22475 () Bool)

(assert (=> b!123693 (= c!22475 (and ((_ is Cons!1680) (toList!834 call!13103)) (= (_1!1273 (h!2281 (toList!834 call!13103))) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun bm!13130 () Bool)

(declare-fun call!13133 () List!1684)

(assert (=> bm!13130 (= call!13133 call!13135)))

(declare-fun c!22476 () Bool)

(declare-fun e!80828 () List!1684)

(declare-fun b!123695 () Bool)

(assert (=> b!123695 (= e!80828 (ite c!22475 (t!5978 (toList!834 call!13103)) (ite c!22476 (Cons!1680 (h!2281 (toList!834 call!13103)) (t!5978 (toList!834 call!13103))) Nil!1681)))))

(declare-fun b!123696 () Bool)

(declare-fun res!60006 () Bool)

(declare-fun e!80827 () Bool)

(assert (=> b!123696 (=> (not res!60006) (not e!80827))))

(declare-fun lt!63570 () List!1684)

(assert (=> b!123696 (= res!60006 (containsKey!166 lt!63570 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun bm!13131 () Bool)

(declare-fun call!13134 () List!1684)

(assert (=> bm!13131 (= call!13135 call!13134)))

(declare-fun c!22477 () Bool)

(declare-fun bm!13132 () Bool)

(declare-fun $colon$colon!86 (List!1684 tuple2!2524) List!1684)

(assert (=> bm!13132 (= call!13134 ($colon$colon!86 e!80828 (ite c!22477 (h!2281 (toList!834 call!13103)) (tuple2!2525 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun c!22474 () Bool)

(assert (=> bm!13132 (= c!22474 c!22477)))

(declare-fun b!123697 () Bool)

(declare-fun e!80829 () List!1684)

(assert (=> b!123697 (= e!80829 call!13133)))

(declare-fun b!123698 () Bool)

(assert (=> b!123698 (= e!80828 (insertStrictlySorted!84 (t!5978 (toList!834 call!13103)) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123699 () Bool)

(assert (=> b!123699 (= e!80829 call!13133)))

(declare-fun d!37117 () Bool)

(assert (=> d!37117 e!80827))

(declare-fun res!60005 () Bool)

(assert (=> d!37117 (=> (not res!60005) (not e!80827))))

(assert (=> d!37117 (= res!60005 (isStrictlySorted!310 lt!63570))))

(assert (=> d!37117 (= lt!63570 e!80830)))

(assert (=> d!37117 (= c!22477 (and ((_ is Cons!1680) (toList!834 call!13103)) (bvslt (_1!1273 (h!2281 (toList!834 call!13103))) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37117 (isStrictlySorted!310 (toList!834 call!13103))))

(assert (=> d!37117 (= (insertStrictlySorted!84 (toList!834 call!13103) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63570)))

(declare-fun b!123694 () Bool)

(assert (=> b!123694 (= e!80827 (contains!860 lt!63570 (tuple2!2525 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!123700 () Bool)

(assert (=> b!123700 (= c!22476 (and ((_ is Cons!1680) (toList!834 call!13103)) (bvsgt (_1!1273 (h!2281 (toList!834 call!13103))) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> b!123700 (= e!80831 e!80829)))

(declare-fun b!123701 () Bool)

(assert (=> b!123701 (= e!80830 call!13134)))

(assert (= (and d!37117 c!22477) b!123701))

(assert (= (and d!37117 (not c!22477)) b!123693))

(assert (= (and b!123693 c!22475) b!123692))

(assert (= (and b!123693 (not c!22475)) b!123700))

(assert (= (and b!123700 c!22476) b!123697))

(assert (= (and b!123700 (not c!22476)) b!123699))

(assert (= (or b!123697 b!123699) bm!13130))

(assert (= (or b!123692 bm!13130) bm!13131))

(assert (= (or b!123701 bm!13131) bm!13132))

(assert (= (and bm!13132 c!22474) b!123698))

(assert (= (and bm!13132 (not c!22474)) b!123695))

(assert (= (and d!37117 res!60005) b!123696))

(assert (= (and b!123696 res!60006) b!123694))

(declare-fun m!143571 () Bool)

(assert (=> bm!13132 m!143571))

(declare-fun m!143573 () Bool)

(assert (=> b!123696 m!143573))

(declare-fun m!143575 () Bool)

(assert (=> b!123698 m!143575))

(declare-fun m!143577 () Bool)

(assert (=> b!123694 m!143577))

(declare-fun m!143579 () Bool)

(assert (=> d!37117 m!143579))

(declare-fun m!143581 () Bool)

(assert (=> d!37117 m!143581))

(assert (=> d!37093 d!37117))

(declare-fun d!37119 () Bool)

(assert (=> d!37119 (= (apply!108 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63435) (apply!108 lt!63434 lt!63435))))

(assert (=> d!37119 true))

(declare-fun _$34!937 () Unit!3833)

(assert (=> d!37119 (= (choose!749 lt!63434 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63435) _$34!937)))

(declare-fun bs!5116 () Bool)

(assert (= bs!5116 d!37119))

(assert (=> bs!5116 m!143243))

(assert (=> bs!5116 m!143243))

(assert (=> bs!5116 m!143245))

(assert (=> bs!5116 m!143249))

(assert (=> d!37059 d!37119))

(declare-fun d!37121 () Bool)

(declare-fun e!80832 () Bool)

(assert (=> d!37121 e!80832))

(declare-fun res!60007 () Bool)

(assert (=> d!37121 (=> res!60007 e!80832)))

(declare-fun lt!63572 () Bool)

(assert (=> d!37121 (= res!60007 (not lt!63572))))

(declare-fun lt!63574 () Bool)

(assert (=> d!37121 (= lt!63572 lt!63574)))

(declare-fun lt!63573 () Unit!3833)

(declare-fun e!80833 () Unit!3833)

(assert (=> d!37121 (= lt!63573 e!80833)))

(declare-fun c!22478 () Bool)

(assert (=> d!37121 (= c!22478 lt!63574)))

(assert (=> d!37121 (= lt!63574 (containsKey!166 (toList!834 lt!63434) lt!63435))))

(assert (=> d!37121 (= (contains!858 lt!63434 lt!63435) lt!63572)))

(declare-fun b!123703 () Bool)

(declare-fun lt!63571 () Unit!3833)

(assert (=> b!123703 (= e!80833 lt!63571)))

(assert (=> b!123703 (= lt!63571 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63434) lt!63435))))

(assert (=> b!123703 (isDefined!116 (getValueByKey!162 (toList!834 lt!63434) lt!63435))))

(declare-fun b!123704 () Bool)

(declare-fun Unit!3843 () Unit!3833)

(assert (=> b!123704 (= e!80833 Unit!3843)))

(declare-fun b!123705 () Bool)

(assert (=> b!123705 (= e!80832 (isDefined!116 (getValueByKey!162 (toList!834 lt!63434) lt!63435)))))

(assert (= (and d!37121 c!22478) b!123703))

(assert (= (and d!37121 (not c!22478)) b!123704))

(assert (= (and d!37121 (not res!60007)) b!123705))

(declare-fun m!143583 () Bool)

(assert (=> d!37121 m!143583))

(declare-fun m!143585 () Bool)

(assert (=> b!123703 m!143585))

(assert (=> b!123703 m!143457))

(assert (=> b!123703 m!143457))

(declare-fun m!143587 () Bool)

(assert (=> b!123703 m!143587))

(assert (=> b!123705 m!143457))

(assert (=> b!123705 m!143457))

(assert (=> b!123705 m!143587))

(assert (=> d!37059 d!37121))

(assert (=> d!37059 d!37075))

(assert (=> d!37059 d!37077))

(assert (=> d!37059 d!37079))

(declare-fun b!123706 () Bool)

(declare-fun e!80835 () Bool)

(declare-fun e!80837 () Bool)

(assert (=> b!123706 (= e!80835 e!80837)))

(assert (=> b!123706 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))))))

(declare-fun res!60011 () Bool)

(declare-fun lt!63580 () ListLongMap!1637)

(assert (=> b!123706 (= res!60011 (contains!858 lt!63580 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!123706 (=> (not res!60011) (not e!80837))))

(declare-fun b!123707 () Bool)

(declare-fun e!80839 () Bool)

(assert (=> b!123707 (= e!80839 e!80835)))

(declare-fun c!22479 () Bool)

(declare-fun e!80834 () Bool)

(assert (=> b!123707 (= c!22479 e!80834)))

(declare-fun res!60009 () Bool)

(assert (=> b!123707 (=> (not res!60009) (not e!80834))))

(assert (=> b!123707 (= res!60009 (bvslt #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))))))

(declare-fun b!123708 () Bool)

(declare-fun e!80836 () ListLongMap!1637)

(declare-fun call!13136 () ListLongMap!1637)

(assert (=> b!123708 (= e!80836 call!13136)))

(declare-fun bm!13133 () Bool)

(assert (=> bm!13133 (= call!13136 (getCurrentListMapNoExtraKeys!120 (_keys!4480 newMap!16) (_values!2737 newMap!16) (mask!6991 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2754 newMap!16)))))

(declare-fun b!123709 () Bool)

(assert (=> b!123709 (= e!80834 (validKeyInArray!0 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!123709 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!123710 () Bool)

(assert (=> b!123710 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))))))

(assert (=> b!123710 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2458 (_values!2737 newMap!16))))))

(assert (=> b!123710 (= e!80837 (= (apply!108 lt!63580 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)) (get!1423 (select (arr!2195 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!404 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123711 () Bool)

(declare-fun e!80838 () Bool)

(assert (=> b!123711 (= e!80835 e!80838)))

(declare-fun c!22480 () Bool)

(assert (=> b!123711 (= c!22480 (bvslt #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))))))

(declare-fun b!123713 () Bool)

(declare-fun res!60008 () Bool)

(assert (=> b!123713 (=> (not res!60008) (not e!80839))))

(assert (=> b!123713 (= res!60008 (not (contains!858 lt!63580 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123714 () Bool)

(assert (=> b!123714 (= e!80838 (isEmpty!394 lt!63580))))

(declare-fun b!123715 () Bool)

(assert (=> b!123715 (= e!80838 (= lt!63580 (getCurrentListMapNoExtraKeys!120 (_keys!4480 newMap!16) (_values!2737 newMap!16) (mask!6991 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2754 newMap!16))))))

(declare-fun b!123716 () Bool)

(declare-fun e!80840 () ListLongMap!1637)

(assert (=> b!123716 (= e!80840 e!80836)))

(declare-fun c!22481 () Bool)

(assert (=> b!123716 (= c!22481 (validKeyInArray!0 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123717 () Bool)

(declare-fun lt!63581 () Unit!3833)

(declare-fun lt!63576 () Unit!3833)

(assert (=> b!123717 (= lt!63581 lt!63576)))

(declare-fun lt!63577 () V!3409)

(declare-fun lt!63575 () (_ BitVec 64))

(declare-fun lt!63579 () ListLongMap!1637)

(declare-fun lt!63578 () (_ BitVec 64))

(assert (=> b!123717 (not (contains!858 (+!155 lt!63579 (tuple2!2525 lt!63575 lt!63577)) lt!63578))))

(assert (=> b!123717 (= lt!63576 (addStillNotContains!55 lt!63579 lt!63575 lt!63577 lt!63578))))

(assert (=> b!123717 (= lt!63578 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!123717 (= lt!63577 (get!1423 (select (arr!2195 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!404 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123717 (= lt!63575 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!123717 (= lt!63579 call!13136)))

(assert (=> b!123717 (= e!80836 (+!155 call!13136 (tuple2!2525 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) (get!1423 (select (arr!2195 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!404 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!37123 () Bool)

(assert (=> d!37123 e!80839))

(declare-fun res!60010 () Bool)

(assert (=> d!37123 (=> (not res!60010) (not e!80839))))

(assert (=> d!37123 (= res!60010 (not (contains!858 lt!63580 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37123 (= lt!63580 e!80840)))

(declare-fun c!22482 () Bool)

(assert (=> d!37123 (= c!22482 (bvsge #b00000000000000000000000000000000 (size!2457 (_keys!4480 newMap!16))))))

(assert (=> d!37123 (validMask!0 (mask!6991 newMap!16))))

(assert (=> d!37123 (= (getCurrentListMapNoExtraKeys!120 (_keys!4480 newMap!16) (_values!2737 newMap!16) (mask!6991 newMap!16) (extraKeys!2539 newMap!16) (zeroValue!2619 newMap!16) (minValue!2619 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2754 newMap!16)) lt!63580)))

(declare-fun b!123712 () Bool)

(assert (=> b!123712 (= e!80840 (ListLongMap!1638 Nil!1681))))

(assert (= (and d!37123 c!22482) b!123712))

(assert (= (and d!37123 (not c!22482)) b!123716))

(assert (= (and b!123716 c!22481) b!123717))

(assert (= (and b!123716 (not c!22481)) b!123708))

(assert (= (or b!123717 b!123708) bm!13133))

(assert (= (and d!37123 res!60010) b!123713))

(assert (= (and b!123713 res!60008) b!123707))

(assert (= (and b!123707 res!60009) b!123709))

(assert (= (and b!123707 c!22479) b!123706))

(assert (= (and b!123707 (not c!22479)) b!123711))

(assert (= (and b!123706 res!60011) b!123710))

(assert (= (and b!123711 c!22480) b!123715))

(assert (= (and b!123711 (not c!22480)) b!123714))

(declare-fun b_lambda!5427 () Bool)

(assert (=> (not b_lambda!5427) (not b!123710)))

(assert (=> b!123710 t!5985))

(declare-fun b_and!7585 () Bool)

(assert (= b_and!7581 (and (=> t!5985 result!3771) b_and!7585)))

(assert (=> b!123710 t!5987))

(declare-fun b_and!7587 () Bool)

(assert (= b_and!7583 (and (=> t!5987 result!3773) b_and!7587)))

(declare-fun b_lambda!5429 () Bool)

(assert (=> (not b_lambda!5429) (not b!123717)))

(assert (=> b!123717 t!5985))

(declare-fun b_and!7589 () Bool)

(assert (= b_and!7585 (and (=> t!5985 result!3771) b_and!7589)))

(assert (=> b!123717 t!5987))

(declare-fun b_and!7591 () Bool)

(assert (= b_and!7587 (and (=> t!5987 result!3773) b_and!7591)))

(declare-fun m!143589 () Bool)

(assert (=> bm!13133 m!143589))

(assert (=> b!123706 m!143287))

(assert (=> b!123706 m!143287))

(declare-fun m!143591 () Bool)

(assert (=> b!123706 m!143591))

(declare-fun m!143593 () Bool)

(assert (=> b!123717 m!143593))

(assert (=> b!123717 m!143319))

(declare-fun m!143595 () Bool)

(assert (=> b!123717 m!143595))

(assert (=> b!123717 m!143287))

(assert (=> b!123717 m!143595))

(declare-fun m!143597 () Bool)

(assert (=> b!123717 m!143597))

(assert (=> b!123717 m!143319))

(assert (=> b!123717 m!143321))

(assert (=> b!123717 m!143323))

(declare-fun m!143599 () Bool)

(assert (=> b!123717 m!143599))

(assert (=> b!123717 m!143321))

(assert (=> b!123716 m!143287))

(assert (=> b!123716 m!143287))

(assert (=> b!123716 m!143289))

(assert (=> b!123710 m!143321))

(assert (=> b!123710 m!143319))

(assert (=> b!123710 m!143287))

(declare-fun m!143601 () Bool)

(assert (=> b!123710 m!143601))

(assert (=> b!123710 m!143287))

(assert (=> b!123710 m!143319))

(assert (=> b!123710 m!143321))

(assert (=> b!123710 m!143323))

(assert (=> b!123715 m!143589))

(declare-fun m!143603 () Bool)

(assert (=> b!123713 m!143603))

(declare-fun m!143605 () Bool)

(assert (=> b!123714 m!143605))

(assert (=> b!123709 m!143287))

(assert (=> b!123709 m!143287))

(assert (=> b!123709 m!143289))

(declare-fun m!143607 () Bool)

(assert (=> d!37123 m!143607))

(assert (=> d!37123 m!143333))

(assert (=> bm!13117 d!37123))

(declare-fun d!37125 () Bool)

(declare-fun res!60016 () Bool)

(declare-fun e!80845 () Bool)

(assert (=> d!37125 (=> res!60016 e!80845)))

(assert (=> d!37125 (= res!60016 (and ((_ is Cons!1680) (toList!834 lt!63433)) (= (_1!1273 (h!2281 (toList!834 lt!63433))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37125 (= (containsKey!166 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000) e!80845)))

(declare-fun b!123722 () Bool)

(declare-fun e!80846 () Bool)

(assert (=> b!123722 (= e!80845 e!80846)))

(declare-fun res!60017 () Bool)

(assert (=> b!123722 (=> (not res!60017) (not e!80846))))

(assert (=> b!123722 (= res!60017 (and (or (not ((_ is Cons!1680) (toList!834 lt!63433))) (bvsle (_1!1273 (h!2281 (toList!834 lt!63433))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1680) (toList!834 lt!63433)) (bvslt (_1!1273 (h!2281 (toList!834 lt!63433))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123723 () Bool)

(assert (=> b!123723 (= e!80846 (containsKey!166 (t!5978 (toList!834 lt!63433)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37125 (not res!60016)) b!123722))

(assert (= (and b!123722 res!60017) b!123723))

(declare-fun m!143609 () Bool)

(assert (=> b!123723 m!143609))

(assert (=> d!37095 d!37125))

(declare-fun d!37127 () Bool)

(declare-fun lt!63582 () (_ BitVec 32))

(assert (=> d!37127 (and (bvsge lt!63582 #b00000000000000000000000000000000) (bvsle lt!63582 (bvsub (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!80847 () (_ BitVec 32))

(assert (=> d!37127 (= lt!63582 e!80847)))

(declare-fun c!22484 () Bool)

(assert (=> d!37127 (= c!22484 (bvsge #b00000000000000000000000000000000 (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(assert (=> d!37127 (and (bvsle #b00000000000000000000000000000000 (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(assert (=> d!37127 (= (arrayCountValidKeys!0 (_keys!4480 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000000 (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))) lt!63582)))

(declare-fun b!123724 () Bool)

(assert (=> b!123724 (= e!80847 #b00000000000000000000000000000000)))

(declare-fun b!123725 () Bool)

(declare-fun e!80848 () (_ BitVec 32))

(assert (=> b!123725 (= e!80847 e!80848)))

(declare-fun c!22483 () Bool)

(assert (=> b!123725 (= c!22483 (validKeyInArray!0 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!123726 () Bool)

(declare-fun call!13137 () (_ BitVec 32))

(assert (=> b!123726 (= e!80848 (bvadd #b00000000000000000000000000000001 call!13137))))

(declare-fun bm!13134 () Bool)

(assert (=> bm!13134 (= call!13137 (arrayCountValidKeys!0 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!123727 () Bool)

(assert (=> b!123727 (= e!80848 call!13137)))

(assert (= (and d!37127 c!22484) b!123724))

(assert (= (and d!37127 (not c!22484)) b!123725))

(assert (= (and b!123725 c!22483) b!123726))

(assert (= (and b!123725 (not c!22483)) b!123727))

(assert (= (or b!123726 b!123727) bm!13134))

(assert (=> b!123725 m!143539))

(assert (=> b!123725 m!143539))

(assert (=> b!123725 m!143541))

(declare-fun m!143611 () Bool)

(assert (=> bm!13134 m!143611))

(assert (=> b!123621 d!37127))

(declare-fun d!37129 () Bool)

(declare-fun lt!63585 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!121 (List!1685) (InoxSet (_ BitVec 64)))

(assert (=> d!37129 (= lt!63585 (select (content!121 Nil!1682) (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!80853 () Bool)

(assert (=> d!37129 (= lt!63585 e!80853)))

(declare-fun res!60022 () Bool)

(assert (=> d!37129 (=> (not res!60022) (not e!80853))))

(assert (=> d!37129 (= res!60022 ((_ is Cons!1681) Nil!1682))))

(assert (=> d!37129 (= (contains!859 Nil!1682 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)) lt!63585)))

(declare-fun b!123732 () Bool)

(declare-fun e!80854 () Bool)

(assert (=> b!123732 (= e!80853 e!80854)))

(declare-fun res!60023 () Bool)

(assert (=> b!123732 (=> res!60023 e!80854)))

(assert (=> b!123732 (= res!60023 (= (h!2282 Nil!1682) (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123733 () Bool)

(assert (=> b!123733 (= e!80854 (contains!859 (t!5983 Nil!1682) (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!37129 res!60022) b!123732))

(assert (= (and b!123732 (not res!60023)) b!123733))

(declare-fun m!143613 () Bool)

(assert (=> d!37129 m!143613))

(assert (=> d!37129 m!143287))

(declare-fun m!143615 () Bool)

(assert (=> d!37129 m!143615))

(assert (=> b!123733 m!143287))

(declare-fun m!143617 () Bool)

(assert (=> b!123733 m!143617))

(assert (=> b!123509 d!37129))

(declare-fun d!37131 () Bool)

(assert (=> d!37131 (isDefined!116 (getValueByKey!162 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63417))))

(declare-fun lt!63588 () Unit!3833)

(declare-fun choose!752 (List!1684 (_ BitVec 64)) Unit!3833)

(assert (=> d!37131 (= lt!63588 (choose!752 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63417))))

(declare-fun e!80857 () Bool)

(assert (=> d!37131 e!80857))

(declare-fun res!60026 () Bool)

(assert (=> d!37131 (=> (not res!60026) (not e!80857))))

(assert (=> d!37131 (= res!60026 (isStrictlySorted!310 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37131 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63417) lt!63588)))

(declare-fun b!123736 () Bool)

(assert (=> b!123736 (= e!80857 (containsKey!166 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63417))))

(assert (= (and d!37131 res!60026) b!123736))

(assert (=> d!37131 m!143433))

(assert (=> d!37131 m!143433))

(assert (=> d!37131 m!143435))

(declare-fun m!143619 () Bool)

(assert (=> d!37131 m!143619))

(declare-fun m!143621 () Bool)

(assert (=> d!37131 m!143621))

(assert (=> b!123736 m!143429))

(assert (=> b!123567 d!37131))

(declare-fun d!37133 () Bool)

(declare-fun isEmpty!395 (Option!168) Bool)

(assert (=> d!37133 (= (isDefined!116 (getValueByKey!162 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63417)) (not (isEmpty!395 (getValueByKey!162 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63417))))))

(declare-fun bs!5117 () Bool)

(assert (= bs!5117 d!37133))

(assert (=> bs!5117 m!143433))

(declare-fun m!143623 () Bool)

(assert (=> bs!5117 m!143623))

(assert (=> b!123567 d!37133))

(declare-fun b!123739 () Bool)

(declare-fun e!80859 () Option!168)

(assert (=> b!123739 (= e!80859 (getValueByKey!162 (t!5978 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))) lt!63417))))

(declare-fun b!123738 () Bool)

(declare-fun e!80858 () Option!168)

(assert (=> b!123738 (= e!80858 e!80859)))

(declare-fun c!22486 () Bool)

(assert (=> b!123738 (= c!22486 (and ((_ is Cons!1680) (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))) (not (= (_1!1273 (h!2281 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))) lt!63417))))))

(declare-fun b!123737 () Bool)

(assert (=> b!123737 (= e!80858 (Some!167 (_2!1273 (h!2281 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))))

(declare-fun b!123740 () Bool)

(assert (=> b!123740 (= e!80859 None!166)))

(declare-fun d!37135 () Bool)

(declare-fun c!22485 () Bool)

(assert (=> d!37135 (= c!22485 (and ((_ is Cons!1680) (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))) (= (_1!1273 (h!2281 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))) lt!63417)))))

(assert (=> d!37135 (= (getValueByKey!162 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63417) e!80858)))

(assert (= (and d!37135 c!22485) b!123737))

(assert (= (and d!37135 (not c!22485)) b!123738))

(assert (= (and b!123738 c!22486) b!123739))

(assert (= (and b!123738 (not c!22486)) b!123740))

(declare-fun m!143625 () Bool)

(assert (=> b!123739 m!143625))

(assert (=> b!123567 d!37135))

(declare-fun b!123743 () Bool)

(declare-fun e!80861 () Option!168)

(assert (=> b!123743 (= e!80861 (getValueByKey!162 (t!5978 (toList!834 lt!63543)) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123742 () Bool)

(declare-fun e!80860 () Option!168)

(assert (=> b!123742 (= e!80860 e!80861)))

(declare-fun c!22488 () Bool)

(assert (=> b!123742 (= c!22488 (and ((_ is Cons!1680) (toList!834 lt!63543)) (not (= (_1!1273 (h!2281 (toList!834 lt!63543))) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun b!123741 () Bool)

(assert (=> b!123741 (= e!80860 (Some!167 (_2!1273 (h!2281 (toList!834 lt!63543)))))))

(declare-fun b!123744 () Bool)

(assert (=> b!123744 (= e!80861 None!166)))

(declare-fun d!37137 () Bool)

(declare-fun c!22487 () Bool)

(assert (=> d!37137 (= c!22487 (and ((_ is Cons!1680) (toList!834 lt!63543)) (= (_1!1273 (h!2281 (toList!834 lt!63543))) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37137 (= (getValueByKey!162 (toList!834 lt!63543) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) e!80860)))

(assert (= (and d!37137 c!22487) b!123741))

(assert (= (and d!37137 (not c!22487)) b!123742))

(assert (= (and b!123742 c!22488) b!123743))

(assert (= (and b!123742 (not c!22488)) b!123744))

(declare-fun m!143627 () Bool)

(assert (=> b!123743 m!143627))

(assert (=> b!123624 d!37137))

(declare-fun d!37139 () Bool)

(declare-fun e!80862 () Bool)

(assert (=> d!37139 e!80862))

(declare-fun res!60027 () Bool)

(assert (=> d!37139 (=> res!60027 e!80862)))

(declare-fun lt!63590 () Bool)

(assert (=> d!37139 (= res!60027 (not lt!63590))))

(declare-fun lt!63592 () Bool)

(assert (=> d!37139 (= lt!63590 lt!63592)))

(declare-fun lt!63591 () Unit!3833)

(declare-fun e!80863 () Unit!3833)

(assert (=> d!37139 (= lt!63591 e!80863)))

(declare-fun c!22489 () Bool)

(assert (=> d!37139 (= c!22489 lt!63592)))

(assert (=> d!37139 (= lt!63592 (containsKey!166 (toList!834 lt!63539) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!37139 (= (contains!858 lt!63539 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!63590)))

(declare-fun b!123745 () Bool)

(declare-fun lt!63589 () Unit!3833)

(assert (=> b!123745 (= e!80863 lt!63589)))

(assert (=> b!123745 (= lt!63589 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63539) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!123745 (isDefined!116 (getValueByKey!162 (toList!834 lt!63539) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123746 () Bool)

(declare-fun Unit!3844 () Unit!3833)

(assert (=> b!123746 (= e!80863 Unit!3844)))

(declare-fun b!123747 () Bool)

(assert (=> b!123747 (= e!80862 (isDefined!116 (getValueByKey!162 (toList!834 lt!63539) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!37139 c!22489) b!123745))

(assert (= (and d!37139 (not c!22489)) b!123746))

(assert (= (and d!37139 (not res!60027)) b!123747))

(assert (=> d!37139 m!143205))

(declare-fun m!143629 () Bool)

(assert (=> d!37139 m!143629))

(assert (=> b!123745 m!143205))

(declare-fun m!143631 () Bool)

(assert (=> b!123745 m!143631))

(assert (=> b!123745 m!143205))

(declare-fun m!143633 () Bool)

(assert (=> b!123745 m!143633))

(assert (=> b!123745 m!143633))

(declare-fun m!143635 () Bool)

(assert (=> b!123745 m!143635))

(assert (=> b!123747 m!143205))

(assert (=> b!123747 m!143633))

(assert (=> b!123747 m!143633))

(assert (=> b!123747 m!143635))

(assert (=> b!123597 d!37139))

(declare-fun lt!63595 () Bool)

(declare-fun d!37141 () Bool)

(declare-fun content!122 (List!1684) (InoxSet tuple2!2524))

(assert (=> d!37141 (= lt!63595 (select (content!122 (toList!834 lt!63518)) (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun e!80868 () Bool)

(assert (=> d!37141 (= lt!63595 e!80868)))

(declare-fun res!60032 () Bool)

(assert (=> d!37141 (=> (not res!60032) (not e!80868))))

(assert (=> d!37141 (= res!60032 ((_ is Cons!1680) (toList!834 lt!63518)))))

(assert (=> d!37141 (= (contains!860 (toList!834 lt!63518) (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63595)))

(declare-fun b!123752 () Bool)

(declare-fun e!80869 () Bool)

(assert (=> b!123752 (= e!80868 e!80869)))

(declare-fun res!60033 () Bool)

(assert (=> b!123752 (=> res!60033 e!80869)))

(assert (=> b!123752 (= res!60033 (= (h!2281 (toList!834 lt!63518)) (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!123753 () Bool)

(assert (=> b!123753 (= e!80869 (contains!860 (t!5978 (toList!834 lt!63518)) (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(assert (= (and d!37141 res!60032) b!123752))

(assert (= (and b!123752 (not res!60033)) b!123753))

(declare-fun m!143637 () Bool)

(assert (=> d!37141 m!143637))

(declare-fun m!143639 () Bool)

(assert (=> d!37141 m!143639))

(declare-fun m!143641 () Bool)

(assert (=> b!123753 m!143641))

(assert (=> b!123572 d!37141))

(declare-fun d!37143 () Bool)

(assert (=> d!37143 (= (get!1424 (getValueByKey!162 (toList!834 lt!63421) lt!63431)) (v!3089 (getValueByKey!162 (toList!834 lt!63421) lt!63431)))))

(assert (=> d!37061 d!37143))

(declare-fun b!123756 () Bool)

(declare-fun e!80871 () Option!168)

(assert (=> b!123756 (= e!80871 (getValueByKey!162 (t!5978 (toList!834 lt!63421)) lt!63431))))

(declare-fun b!123755 () Bool)

(declare-fun e!80870 () Option!168)

(assert (=> b!123755 (= e!80870 e!80871)))

(declare-fun c!22491 () Bool)

(assert (=> b!123755 (= c!22491 (and ((_ is Cons!1680) (toList!834 lt!63421)) (not (= (_1!1273 (h!2281 (toList!834 lt!63421))) lt!63431))))))

(declare-fun b!123754 () Bool)

(assert (=> b!123754 (= e!80870 (Some!167 (_2!1273 (h!2281 (toList!834 lt!63421)))))))

(declare-fun b!123757 () Bool)

(assert (=> b!123757 (= e!80871 None!166)))

(declare-fun d!37145 () Bool)

(declare-fun c!22490 () Bool)

(assert (=> d!37145 (= c!22490 (and ((_ is Cons!1680) (toList!834 lt!63421)) (= (_1!1273 (h!2281 (toList!834 lt!63421))) lt!63431)))))

(assert (=> d!37145 (= (getValueByKey!162 (toList!834 lt!63421) lt!63431) e!80870)))

(assert (= (and d!37145 c!22490) b!123754))

(assert (= (and d!37145 (not c!22490)) b!123755))

(assert (= (and b!123755 c!22491) b!123756))

(assert (= (and b!123755 (not c!22491)) b!123757))

(declare-fun m!143643 () Bool)

(assert (=> b!123756 m!143643))

(assert (=> d!37061 d!37145))

(declare-fun d!37147 () Bool)

(assert (=> d!37147 (= (get!1424 (getValueByKey!162 (toList!834 lt!63423) lt!63419)) (v!3089 (getValueByKey!162 (toList!834 lt!63423) lt!63419)))))

(assert (=> d!37069 d!37147))

(declare-fun b!123760 () Bool)

(declare-fun e!80873 () Option!168)

(assert (=> b!123760 (= e!80873 (getValueByKey!162 (t!5978 (toList!834 lt!63423)) lt!63419))))

(declare-fun b!123759 () Bool)

(declare-fun e!80872 () Option!168)

(assert (=> b!123759 (= e!80872 e!80873)))

(declare-fun c!22493 () Bool)

(assert (=> b!123759 (= c!22493 (and ((_ is Cons!1680) (toList!834 lt!63423)) (not (= (_1!1273 (h!2281 (toList!834 lt!63423))) lt!63419))))))

(declare-fun b!123758 () Bool)

(assert (=> b!123758 (= e!80872 (Some!167 (_2!1273 (h!2281 (toList!834 lt!63423)))))))

(declare-fun b!123761 () Bool)

(assert (=> b!123761 (= e!80873 None!166)))

(declare-fun d!37149 () Bool)

(declare-fun c!22492 () Bool)

(assert (=> d!37149 (= c!22492 (and ((_ is Cons!1680) (toList!834 lt!63423)) (= (_1!1273 (h!2281 (toList!834 lt!63423))) lt!63419)))))

(assert (=> d!37149 (= (getValueByKey!162 (toList!834 lt!63423) lt!63419) e!80872)))

(assert (= (and d!37149 c!22492) b!123758))

(assert (= (and d!37149 (not c!22492)) b!123759))

(assert (= (and b!123759 c!22493) b!123760))

(assert (= (and b!123759 (not c!22493)) b!123761))

(declare-fun m!143645 () Bool)

(assert (=> b!123760 m!143645))

(assert (=> d!37069 d!37149))

(declare-fun d!37151 () Bool)

(declare-fun e!80874 () Bool)

(assert (=> d!37151 e!80874))

(declare-fun res!60034 () Bool)

(assert (=> d!37151 (=> res!60034 e!80874)))

(declare-fun lt!63597 () Bool)

(assert (=> d!37151 (= res!60034 (not lt!63597))))

(declare-fun lt!63599 () Bool)

(assert (=> d!37151 (= lt!63597 lt!63599)))

(declare-fun lt!63598 () Unit!3833)

(declare-fun e!80875 () Unit!3833)

(assert (=> d!37151 (= lt!63598 e!80875)))

(declare-fun c!22494 () Bool)

(assert (=> d!37151 (= c!22494 lt!63599)))

(assert (=> d!37151 (= lt!63599 (containsKey!166 (toList!834 lt!63539) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37151 (= (contains!858 lt!63539 #b0000000000000000000000000000000000000000000000000000000000000000) lt!63597)))

(declare-fun b!123762 () Bool)

(declare-fun lt!63596 () Unit!3833)

(assert (=> b!123762 (= e!80875 lt!63596)))

(assert (=> b!123762 (= lt!63596 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63539) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123762 (isDefined!116 (getValueByKey!162 (toList!834 lt!63539) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123763 () Bool)

(declare-fun Unit!3845 () Unit!3833)

(assert (=> b!123763 (= e!80875 Unit!3845)))

(declare-fun b!123764 () Bool)

(assert (=> b!123764 (= e!80874 (isDefined!116 (getValueByKey!162 (toList!834 lt!63539) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37151 c!22494) b!123762))

(assert (= (and d!37151 (not c!22494)) b!123763))

(assert (= (and d!37151 (not res!60034)) b!123764))

(declare-fun m!143647 () Bool)

(assert (=> d!37151 m!143647))

(declare-fun m!143649 () Bool)

(assert (=> b!123762 m!143649))

(declare-fun m!143651 () Bool)

(assert (=> b!123762 m!143651))

(assert (=> b!123762 m!143651))

(declare-fun m!143653 () Bool)

(assert (=> b!123762 m!143653))

(assert (=> b!123764 m!143651))

(assert (=> b!123764 m!143651))

(assert (=> b!123764 m!143653))

(assert (=> d!37081 d!37151))

(assert (=> d!37081 d!37039))

(declare-fun d!37153 () Bool)

(declare-fun lt!63600 () (_ BitVec 32))

(assert (=> d!37153 (and (bvsge lt!63600 #b00000000000000000000000000000000) (bvsle lt!63600 (bvsub (size!2457 (_keys!4480 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!80876 () (_ BitVec 32))

(assert (=> d!37153 (= lt!63600 e!80876)))

(declare-fun c!22496 () Bool)

(assert (=> d!37153 (= c!22496 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2457 (_keys!4480 newMap!16))))))

(assert (=> d!37153 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2457 (_keys!4480 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2457 (_keys!4480 newMap!16)) (size!2457 (_keys!4480 newMap!16))))))

(assert (=> d!37153 (= (arrayCountValidKeys!0 (_keys!4480 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2457 (_keys!4480 newMap!16))) lt!63600)))

(declare-fun b!123765 () Bool)

(assert (=> b!123765 (= e!80876 #b00000000000000000000000000000000)))

(declare-fun b!123766 () Bool)

(declare-fun e!80877 () (_ BitVec 32))

(assert (=> b!123766 (= e!80876 e!80877)))

(declare-fun c!22495 () Bool)

(assert (=> b!123766 (= c!22495 (validKeyInArray!0 (select (arr!2194 (_keys!4480 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!123767 () Bool)

(declare-fun call!13138 () (_ BitVec 32))

(assert (=> b!123767 (= e!80877 (bvadd #b00000000000000000000000000000001 call!13138))))

(declare-fun bm!13135 () Bool)

(assert (=> bm!13135 (= call!13138 (arrayCountValidKeys!0 (_keys!4480 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2457 (_keys!4480 newMap!16))))))

(declare-fun b!123768 () Bool)

(assert (=> b!123768 (= e!80877 call!13138)))

(assert (= (and d!37153 c!22496) b!123765))

(assert (= (and d!37153 (not c!22496)) b!123766))

(assert (= (and b!123766 c!22495) b!123767))

(assert (= (and b!123766 (not c!22495)) b!123768))

(assert (= (or b!123767 b!123768) bm!13135))

(declare-fun m!143655 () Bool)

(assert (=> b!123766 m!143655))

(assert (=> b!123766 m!143655))

(declare-fun m!143657 () Bool)

(assert (=> b!123766 m!143657))

(declare-fun m!143659 () Bool)

(assert (=> bm!13135 m!143659))

(assert (=> bm!13106 d!37153))

(declare-fun d!37155 () Bool)

(assert (=> d!37155 (= (validMask!0 (mask!6991 newMap!16)) (and (or (= (mask!6991 newMap!16) #b00000000000000000000000000000111) (= (mask!6991 newMap!16) #b00000000000000000000000000001111) (= (mask!6991 newMap!16) #b00000000000000000000000000011111) (= (mask!6991 newMap!16) #b00000000000000000000000000111111) (= (mask!6991 newMap!16) #b00000000000000000000000001111111) (= (mask!6991 newMap!16) #b00000000000000000000000011111111) (= (mask!6991 newMap!16) #b00000000000000000000000111111111) (= (mask!6991 newMap!16) #b00000000000000000000001111111111) (= (mask!6991 newMap!16) #b00000000000000000000011111111111) (= (mask!6991 newMap!16) #b00000000000000000000111111111111) (= (mask!6991 newMap!16) #b00000000000000000001111111111111) (= (mask!6991 newMap!16) #b00000000000000000011111111111111) (= (mask!6991 newMap!16) #b00000000000000000111111111111111) (= (mask!6991 newMap!16) #b00000000000000001111111111111111) (= (mask!6991 newMap!16) #b00000000000000011111111111111111) (= (mask!6991 newMap!16) #b00000000000000111111111111111111) (= (mask!6991 newMap!16) #b00000000000001111111111111111111) (= (mask!6991 newMap!16) #b00000000000011111111111111111111) (= (mask!6991 newMap!16) #b00000000000111111111111111111111) (= (mask!6991 newMap!16) #b00000000001111111111111111111111) (= (mask!6991 newMap!16) #b00000000011111111111111111111111) (= (mask!6991 newMap!16) #b00000000111111111111111111111111) (= (mask!6991 newMap!16) #b00000001111111111111111111111111) (= (mask!6991 newMap!16) #b00000011111111111111111111111111) (= (mask!6991 newMap!16) #b00000111111111111111111111111111) (= (mask!6991 newMap!16) #b00001111111111111111111111111111) (= (mask!6991 newMap!16) #b00011111111111111111111111111111) (= (mask!6991 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!6991 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!37053 d!37155))

(declare-fun d!37157 () Bool)

(declare-fun e!80878 () Bool)

(assert (=> d!37157 e!80878))

(declare-fun res!60035 () Bool)

(assert (=> d!37157 (=> res!60035 e!80878)))

(declare-fun lt!63602 () Bool)

(assert (=> d!37157 (= res!60035 (not lt!63602))))

(declare-fun lt!63604 () Bool)

(assert (=> d!37157 (= lt!63602 lt!63604)))

(declare-fun lt!63603 () Unit!3833)

(declare-fun e!80879 () Unit!3833)

(assert (=> d!37157 (= lt!63603 e!80879)))

(declare-fun c!22497 () Bool)

(assert (=> d!37157 (= c!22497 lt!63604)))

(assert (=> d!37157 (= lt!63604 (containsKey!166 (toList!834 lt!63451) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37157 (= (contains!858 lt!63451 (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) lt!63602)))

(declare-fun b!123769 () Bool)

(declare-fun lt!63601 () Unit!3833)

(assert (=> b!123769 (= e!80879 lt!63601)))

(assert (=> b!123769 (= lt!63601 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63451) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> b!123769 (isDefined!116 (getValueByKey!162 (toList!834 lt!63451) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!123770 () Bool)

(declare-fun Unit!3846 () Unit!3833)

(assert (=> b!123770 (= e!80879 Unit!3846)))

(declare-fun b!123771 () Bool)

(assert (=> b!123771 (= e!80878 (isDefined!116 (getValueByKey!162 (toList!834 lt!63451) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(assert (= (and d!37157 c!22497) b!123769))

(assert (= (and d!37157 (not c!22497)) b!123770))

(assert (= (and d!37157 (not res!60035)) b!123771))

(declare-fun m!143661 () Bool)

(assert (=> d!37157 m!143661))

(declare-fun m!143663 () Bool)

(assert (=> b!123769 m!143663))

(assert (=> b!123769 m!143305))

(assert (=> b!123769 m!143305))

(declare-fun m!143665 () Bool)

(assert (=> b!123769 m!143665))

(assert (=> b!123771 m!143305))

(assert (=> b!123771 m!143305))

(assert (=> b!123771 m!143665))

(assert (=> d!37049 d!37157))

(declare-fun e!80881 () Option!168)

(declare-fun b!123774 () Bool)

(assert (=> b!123774 (= e!80881 (getValueByKey!162 (t!5978 lt!63449) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!123773 () Bool)

(declare-fun e!80880 () Option!168)

(assert (=> b!123773 (= e!80880 e!80881)))

(declare-fun c!22499 () Bool)

(assert (=> b!123773 (= c!22499 (and ((_ is Cons!1680) lt!63449) (not (= (_1!1273 (h!2281 lt!63449)) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))))

(declare-fun b!123772 () Bool)

(assert (=> b!123772 (= e!80880 (Some!167 (_2!1273 (h!2281 lt!63449))))))

(declare-fun b!123775 () Bool)

(assert (=> b!123775 (= e!80881 None!166)))

(declare-fun d!37159 () Bool)

(declare-fun c!22498 () Bool)

(assert (=> d!37159 (= c!22498 (and ((_ is Cons!1680) lt!63449) (= (_1!1273 (h!2281 lt!63449)) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(assert (=> d!37159 (= (getValueByKey!162 lt!63449 (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) e!80880)))

(assert (= (and d!37159 c!22498) b!123772))

(assert (= (and d!37159 (not c!22498)) b!123773))

(assert (= (and b!123773 c!22499) b!123774))

(assert (= (and b!123773 (not c!22499)) b!123775))

(declare-fun m!143667 () Bool)

(assert (=> b!123774 m!143667))

(assert (=> d!37049 d!37159))

(declare-fun d!37161 () Bool)

(assert (=> d!37161 (= (getValueByKey!162 lt!63449 (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) (Some!167 (_2!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun lt!63605 () Unit!3833)

(assert (=> d!37161 (= lt!63605 (choose!751 lt!63449 (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (_2!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun e!80882 () Bool)

(assert (=> d!37161 e!80882))

(declare-fun res!60036 () Bool)

(assert (=> d!37161 (=> (not res!60036) (not e!80882))))

(assert (=> d!37161 (= res!60036 (isStrictlySorted!310 lt!63449))))

(assert (=> d!37161 (= (lemmaContainsTupThenGetReturnValue!81 lt!63449 (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (_2!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) lt!63605)))

(declare-fun b!123776 () Bool)

(declare-fun res!60037 () Bool)

(assert (=> b!123776 (=> (not res!60037) (not e!80882))))

(assert (=> b!123776 (= res!60037 (containsKey!166 lt!63449 (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!123777 () Bool)

(assert (=> b!123777 (= e!80882 (contains!860 lt!63449 (tuple2!2525 (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (_2!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(assert (= (and d!37161 res!60036) b!123776))

(assert (= (and b!123776 res!60037) b!123777))

(assert (=> d!37161 m!143299))

(declare-fun m!143669 () Bool)

(assert (=> d!37161 m!143669))

(declare-fun m!143671 () Bool)

(assert (=> d!37161 m!143671))

(declare-fun m!143673 () Bool)

(assert (=> b!123776 m!143673))

(declare-fun m!143675 () Bool)

(assert (=> b!123777 m!143675))

(assert (=> d!37049 d!37161))

(declare-fun b!123778 () Bool)

(declare-fun e!80887 () List!1684)

(declare-fun call!13141 () List!1684)

(assert (=> b!123778 (= e!80887 call!13141)))

(declare-fun b!123779 () Bool)

(declare-fun e!80886 () List!1684)

(assert (=> b!123779 (= e!80886 e!80887)))

(declare-fun c!22501 () Bool)

(assert (=> b!123779 (= c!22501 (and ((_ is Cons!1680) (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100)))) (= (_1!1273 (h!2281 (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100))))) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun bm!13136 () Bool)

(declare-fun call!13139 () List!1684)

(assert (=> bm!13136 (= call!13139 call!13141)))

(declare-fun b!123781 () Bool)

(declare-fun c!22502 () Bool)

(declare-fun e!80884 () List!1684)

(assert (=> b!123781 (= e!80884 (ite c!22501 (t!5978 (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100)))) (ite c!22502 (Cons!1680 (h!2281 (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100)))) (t!5978 (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100))))) Nil!1681)))))

(declare-fun b!123782 () Bool)

(declare-fun res!60039 () Bool)

(declare-fun e!80883 () Bool)

(assert (=> b!123782 (=> (not res!60039) (not e!80883))))

(declare-fun lt!63606 () List!1684)

(assert (=> b!123782 (= res!60039 (containsKey!166 lt!63606 (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun bm!13137 () Bool)

(declare-fun call!13140 () List!1684)

(assert (=> bm!13137 (= call!13141 call!13140)))

(declare-fun bm!13138 () Bool)

(declare-fun c!22503 () Bool)

(assert (=> bm!13138 (= call!13140 ($colon$colon!86 e!80884 (ite c!22503 (h!2281 (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100)))) (tuple2!2525 (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (_2!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))))

(declare-fun c!22500 () Bool)

(assert (=> bm!13138 (= c!22500 c!22503)))

(declare-fun b!123783 () Bool)

(declare-fun e!80885 () List!1684)

(assert (=> b!123783 (= e!80885 call!13139)))

(declare-fun b!123784 () Bool)

(assert (=> b!123784 (= e!80884 (insertStrictlySorted!84 (t!5978 (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100)))) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (_2!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!123785 () Bool)

(assert (=> b!123785 (= e!80885 call!13139)))

(declare-fun d!37163 () Bool)

(assert (=> d!37163 e!80883))

(declare-fun res!60038 () Bool)

(assert (=> d!37163 (=> (not res!60038) (not e!80883))))

(assert (=> d!37163 (= res!60038 (isStrictlySorted!310 lt!63606))))

(assert (=> d!37163 (= lt!63606 e!80886)))

(assert (=> d!37163 (= c!22503 (and ((_ is Cons!1680) (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100)))) (bvslt (_1!1273 (h!2281 (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100))))) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(assert (=> d!37163 (isStrictlySorted!310 (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100))))))

(assert (=> d!37163 (= (insertStrictlySorted!84 (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100))) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (_2!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) lt!63606)))

(declare-fun b!123780 () Bool)

(assert (=> b!123780 (= e!80883 (contains!860 lt!63606 (tuple2!2525 (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (_2!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun b!123786 () Bool)

(assert (=> b!123786 (= c!22502 (and ((_ is Cons!1680) (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100)))) (bvsgt (_1!1273 (h!2281 (toList!834 (ite c!22411 call!13106 (ite c!22413 call!13105 call!13100))))) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(assert (=> b!123786 (= e!80887 e!80885)))

(declare-fun b!123787 () Bool)

(assert (=> b!123787 (= e!80886 call!13140)))

(assert (= (and d!37163 c!22503) b!123787))

(assert (= (and d!37163 (not c!22503)) b!123779))

(assert (= (and b!123779 c!22501) b!123778))

(assert (= (and b!123779 (not c!22501)) b!123786))

(assert (= (and b!123786 c!22502) b!123783))

(assert (= (and b!123786 (not c!22502)) b!123785))

(assert (= (or b!123783 b!123785) bm!13136))

(assert (= (or b!123778 bm!13136) bm!13137))

(assert (= (or b!123787 bm!13137) bm!13138))

(assert (= (and bm!13138 c!22500) b!123784))

(assert (= (and bm!13138 (not c!22500)) b!123781))

(assert (= (and d!37163 res!60038) b!123782))

(assert (= (and b!123782 res!60039) b!123780))

(declare-fun m!143677 () Bool)

(assert (=> bm!13138 m!143677))

(declare-fun m!143679 () Bool)

(assert (=> b!123782 m!143679))

(declare-fun m!143681 () Bool)

(assert (=> b!123784 m!143681))

(declare-fun m!143683 () Bool)

(assert (=> b!123780 m!143683))

(declare-fun m!143685 () Bool)

(assert (=> d!37163 m!143685))

(declare-fun m!143687 () Bool)

(assert (=> d!37163 m!143687))

(assert (=> d!37049 d!37163))

(declare-fun d!37165 () Bool)

(declare-fun e!80888 () Bool)

(assert (=> d!37165 e!80888))

(declare-fun res!60040 () Bool)

(assert (=> d!37165 (=> res!60040 e!80888)))

(declare-fun lt!63608 () Bool)

(assert (=> d!37165 (= res!60040 (not lt!63608))))

(declare-fun lt!63610 () Bool)

(assert (=> d!37165 (= lt!63608 lt!63610)))

(declare-fun lt!63609 () Unit!3833)

(declare-fun e!80889 () Unit!3833)

(assert (=> d!37165 (= lt!63609 e!80889)))

(declare-fun c!22504 () Bool)

(assert (=> d!37165 (= c!22504 lt!63610)))

(assert (=> d!37165 (= lt!63610 (containsKey!166 (toList!834 lt!63499) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37165 (= (contains!858 lt!63499 (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63608)))

(declare-fun b!123788 () Bool)

(declare-fun lt!63607 () Unit!3833)

(assert (=> b!123788 (= e!80889 lt!63607)))

(assert (=> b!123788 (= lt!63607 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63499) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> b!123788 (isDefined!116 (getValueByKey!162 (toList!834 lt!63499) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123789 () Bool)

(declare-fun Unit!3847 () Unit!3833)

(assert (=> b!123789 (= e!80889 Unit!3847)))

(declare-fun b!123790 () Bool)

(assert (=> b!123790 (= e!80888 (isDefined!116 (getValueByKey!162 (toList!834 lt!63499) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (= (and d!37165 c!22504) b!123788))

(assert (= (and d!37165 (not c!22504)) b!123789))

(assert (= (and d!37165 (not res!60040)) b!123790))

(declare-fun m!143689 () Bool)

(assert (=> d!37165 m!143689))

(declare-fun m!143691 () Bool)

(assert (=> b!123788 m!143691))

(assert (=> b!123788 m!143421))

(assert (=> b!123788 m!143421))

(declare-fun m!143693 () Bool)

(assert (=> b!123788 m!143693))

(assert (=> b!123790 m!143421))

(assert (=> b!123790 m!143421))

(assert (=> b!123790 m!143693))

(assert (=> d!37067 d!37165))

(declare-fun b!123793 () Bool)

(declare-fun e!80891 () Option!168)

(assert (=> b!123793 (= e!80891 (getValueByKey!162 (t!5978 lt!63497) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123792 () Bool)

(declare-fun e!80890 () Option!168)

(assert (=> b!123792 (= e!80890 e!80891)))

(declare-fun c!22506 () Bool)

(assert (=> b!123792 (= c!22506 (and ((_ is Cons!1680) lt!63497) (not (= (_1!1273 (h!2281 lt!63497)) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun b!123791 () Bool)

(assert (=> b!123791 (= e!80890 (Some!167 (_2!1273 (h!2281 lt!63497))))))

(declare-fun b!123794 () Bool)

(assert (=> b!123794 (= e!80891 None!166)))

(declare-fun d!37167 () Bool)

(declare-fun c!22505 () Bool)

(assert (=> d!37167 (= c!22505 (and ((_ is Cons!1680) lt!63497) (= (_1!1273 (h!2281 lt!63497)) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37167 (= (getValueByKey!162 lt!63497 (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) e!80890)))

(assert (= (and d!37167 c!22505) b!123791))

(assert (= (and d!37167 (not c!22505)) b!123792))

(assert (= (and b!123792 c!22506) b!123793))

(assert (= (and b!123792 (not c!22506)) b!123794))

(declare-fun m!143695 () Bool)

(assert (=> b!123793 m!143695))

(assert (=> d!37067 d!37167))

(declare-fun d!37169 () Bool)

(assert (=> d!37169 (= (getValueByKey!162 lt!63497 (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun lt!63611 () Unit!3833)

(assert (=> d!37169 (= lt!63611 (choose!751 lt!63497 (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun e!80892 () Bool)

(assert (=> d!37169 e!80892))

(declare-fun res!60041 () Bool)

(assert (=> d!37169 (=> (not res!60041) (not e!80892))))

(assert (=> d!37169 (= res!60041 (isStrictlySorted!310 lt!63497))))

(assert (=> d!37169 (= (lemmaContainsTupThenGetReturnValue!81 lt!63497 (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63611)))

(declare-fun b!123795 () Bool)

(declare-fun res!60042 () Bool)

(assert (=> b!123795 (=> (not res!60042) (not e!80892))))

(assert (=> b!123795 (= res!60042 (containsKey!166 lt!63497 (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123796 () Bool)

(assert (=> b!123796 (= e!80892 (contains!860 lt!63497 (tuple2!2525 (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (= (and d!37169 res!60041) b!123795))

(assert (= (and b!123795 res!60042) b!123796))

(assert (=> d!37169 m!143415))

(declare-fun m!143697 () Bool)

(assert (=> d!37169 m!143697))

(declare-fun m!143699 () Bool)

(assert (=> d!37169 m!143699))

(declare-fun m!143701 () Bool)

(assert (=> b!123795 m!143701))

(declare-fun m!143703 () Bool)

(assert (=> b!123796 m!143703))

(assert (=> d!37067 d!37169))

(declare-fun b!123797 () Bool)

(declare-fun e!80897 () List!1684)

(declare-fun call!13144 () List!1684)

(assert (=> b!123797 (= e!80897 call!13144)))

(declare-fun b!123798 () Bool)

(declare-fun e!80896 () List!1684)

(assert (=> b!123798 (= e!80896 e!80897)))

(declare-fun c!22508 () Bool)

(assert (=> b!123798 (= c!22508 (and ((_ is Cons!1680) (toList!834 lt!63437)) (= (_1!1273 (h!2281 (toList!834 lt!63437))) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun bm!13139 () Bool)

(declare-fun call!13142 () List!1684)

(assert (=> bm!13139 (= call!13142 call!13144)))

(declare-fun b!123800 () Bool)

(declare-fun e!80894 () List!1684)

(declare-fun c!22509 () Bool)

(assert (=> b!123800 (= e!80894 (ite c!22508 (t!5978 (toList!834 lt!63437)) (ite c!22509 (Cons!1680 (h!2281 (toList!834 lt!63437)) (t!5978 (toList!834 lt!63437))) Nil!1681)))))

(declare-fun b!123801 () Bool)

(declare-fun res!60044 () Bool)

(declare-fun e!80893 () Bool)

(assert (=> b!123801 (=> (not res!60044) (not e!80893))))

(declare-fun lt!63612 () List!1684)

(assert (=> b!123801 (= res!60044 (containsKey!166 lt!63612 (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun bm!13140 () Bool)

(declare-fun call!13143 () List!1684)

(assert (=> bm!13140 (= call!13144 call!13143)))

(declare-fun c!22510 () Bool)

(declare-fun bm!13141 () Bool)

(assert (=> bm!13141 (= call!13143 ($colon$colon!86 e!80894 (ite c!22510 (h!2281 (toList!834 lt!63437)) (tuple2!2525 (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun c!22507 () Bool)

(assert (=> bm!13141 (= c!22507 c!22510)))

(declare-fun b!123802 () Bool)

(declare-fun e!80895 () List!1684)

(assert (=> b!123802 (= e!80895 call!13142)))

(declare-fun b!123803 () Bool)

(assert (=> b!123803 (= e!80894 (insertStrictlySorted!84 (t!5978 (toList!834 lt!63437)) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123804 () Bool)

(assert (=> b!123804 (= e!80895 call!13142)))

(declare-fun d!37171 () Bool)

(assert (=> d!37171 e!80893))

(declare-fun res!60043 () Bool)

(assert (=> d!37171 (=> (not res!60043) (not e!80893))))

(assert (=> d!37171 (= res!60043 (isStrictlySorted!310 lt!63612))))

(assert (=> d!37171 (= lt!63612 e!80896)))

(assert (=> d!37171 (= c!22510 (and ((_ is Cons!1680) (toList!834 lt!63437)) (bvslt (_1!1273 (h!2281 (toList!834 lt!63437))) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37171 (isStrictlySorted!310 (toList!834 lt!63437))))

(assert (=> d!37171 (= (insertStrictlySorted!84 (toList!834 lt!63437) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63612)))

(declare-fun b!123799 () Bool)

(assert (=> b!123799 (= e!80893 (contains!860 lt!63612 (tuple2!2525 (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!123805 () Bool)

(assert (=> b!123805 (= c!22509 (and ((_ is Cons!1680) (toList!834 lt!63437)) (bvsgt (_1!1273 (h!2281 (toList!834 lt!63437))) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> b!123805 (= e!80897 e!80895)))

(declare-fun b!123806 () Bool)

(assert (=> b!123806 (= e!80896 call!13143)))

(assert (= (and d!37171 c!22510) b!123806))

(assert (= (and d!37171 (not c!22510)) b!123798))

(assert (= (and b!123798 c!22508) b!123797))

(assert (= (and b!123798 (not c!22508)) b!123805))

(assert (= (and b!123805 c!22509) b!123802))

(assert (= (and b!123805 (not c!22509)) b!123804))

(assert (= (or b!123802 b!123804) bm!13139))

(assert (= (or b!123797 bm!13139) bm!13140))

(assert (= (or b!123806 bm!13140) bm!13141))

(assert (= (and bm!13141 c!22507) b!123803))

(assert (= (and bm!13141 (not c!22507)) b!123800))

(assert (= (and d!37171 res!60043) b!123801))

(assert (= (and b!123801 res!60044) b!123799))

(declare-fun m!143705 () Bool)

(assert (=> bm!13141 m!143705))

(declare-fun m!143707 () Bool)

(assert (=> b!123801 m!143707))

(declare-fun m!143709 () Bool)

(assert (=> b!123803 m!143709))

(declare-fun m!143711 () Bool)

(assert (=> b!123799 m!143711))

(declare-fun m!143713 () Bool)

(assert (=> d!37171 m!143713))

(declare-fun m!143715 () Bool)

(assert (=> d!37171 m!143715))

(assert (=> d!37067 d!37171))

(declare-fun b!123809 () Bool)

(declare-fun e!80899 () Option!168)

(assert (=> b!123809 (= e!80899 (getValueByKey!162 (t!5978 (toList!834 lt!63489)) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123808 () Bool)

(declare-fun e!80898 () Option!168)

(assert (=> b!123808 (= e!80898 e!80899)))

(declare-fun c!22512 () Bool)

(assert (=> b!123808 (= c!22512 (and ((_ is Cons!1680) (toList!834 lt!63489)) (not (= (_1!1273 (h!2281 (toList!834 lt!63489))) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun b!123807 () Bool)

(assert (=> b!123807 (= e!80898 (Some!167 (_2!1273 (h!2281 (toList!834 lt!63489)))))))

(declare-fun b!123810 () Bool)

(assert (=> b!123810 (= e!80899 None!166)))

(declare-fun d!37173 () Bool)

(declare-fun c!22511 () Bool)

(assert (=> d!37173 (= c!22511 (and ((_ is Cons!1680) (toList!834 lt!63489)) (= (_1!1273 (h!2281 (toList!834 lt!63489))) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37173 (= (getValueByKey!162 (toList!834 lt!63489) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) e!80898)))

(assert (= (and d!37173 c!22511) b!123807))

(assert (= (and d!37173 (not c!22511)) b!123808))

(assert (= (and b!123808 c!22512) b!123809))

(assert (= (and b!123808 (not c!22512)) b!123810))

(declare-fun m!143717 () Bool)

(assert (=> b!123809 m!143717))

(assert (=> b!123553 d!37173))

(assert (=> b!123600 d!37037))

(declare-fun d!37175 () Bool)

(assert (=> d!37175 (= (get!1424 (getValueByKey!162 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3089 (getValueByKey!162 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37091 d!37175))

(declare-fun b!123813 () Bool)

(declare-fun e!80901 () Option!168)

(assert (=> b!123813 (= e!80901 (getValueByKey!162 (t!5978 (toList!834 lt!63433)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123812 () Bool)

(declare-fun e!80900 () Option!168)

(assert (=> b!123812 (= e!80900 e!80901)))

(declare-fun c!22514 () Bool)

(assert (=> b!123812 (= c!22514 (and ((_ is Cons!1680) (toList!834 lt!63433)) (not (= (_1!1273 (h!2281 (toList!834 lt!63433))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123811 () Bool)

(assert (=> b!123811 (= e!80900 (Some!167 (_2!1273 (h!2281 (toList!834 lt!63433)))))))

(declare-fun b!123814 () Bool)

(assert (=> b!123814 (= e!80901 None!166)))

(declare-fun d!37177 () Bool)

(declare-fun c!22513 () Bool)

(assert (=> d!37177 (= c!22513 (and ((_ is Cons!1680) (toList!834 lt!63433)) (= (_1!1273 (h!2281 (toList!834 lt!63433))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37177 (= (getValueByKey!162 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000) e!80900)))

(assert (= (and d!37177 c!22513) b!123811))

(assert (= (and d!37177 (not c!22513)) b!123812))

(assert (= (and b!123812 c!22514) b!123813))

(assert (= (and b!123812 (not c!22514)) b!123814))

(declare-fun m!143719 () Bool)

(assert (=> b!123813 m!143719))

(assert (=> d!37091 d!37177))

(declare-fun d!37179 () Bool)

(assert (=> d!37179 (= (get!1424 (getValueByKey!162 (toList!834 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63419)) (v!3089 (getValueByKey!162 (toList!834 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63419)))))

(assert (=> d!37083 d!37179))

(declare-fun e!80903 () Option!168)

(declare-fun b!123817 () Bool)

(assert (=> b!123817 (= e!80903 (getValueByKey!162 (t!5978 (toList!834 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) lt!63419))))

(declare-fun b!123816 () Bool)

(declare-fun e!80902 () Option!168)

(assert (=> b!123816 (= e!80902 e!80903)))

(declare-fun c!22516 () Bool)

(assert (=> b!123816 (= c!22516 (and ((_ is Cons!1680) (toList!834 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) (not (= (_1!1273 (h!2281 (toList!834 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))) lt!63419))))))

(declare-fun b!123815 () Bool)

(assert (=> b!123815 (= e!80902 (Some!167 (_2!1273 (h!2281 (toList!834 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))))

(declare-fun b!123818 () Bool)

(assert (=> b!123818 (= e!80903 None!166)))

(declare-fun d!37181 () Bool)

(declare-fun c!22515 () Bool)

(assert (=> d!37181 (= c!22515 (and ((_ is Cons!1680) (toList!834 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) (= (_1!1273 (h!2281 (toList!834 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))) lt!63419)))))

(assert (=> d!37181 (= (getValueByKey!162 (toList!834 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63419) e!80902)))

(assert (= (and d!37181 c!22515) b!123815))

(assert (= (and d!37181 (not c!22515)) b!123816))

(assert (= (and b!123816 c!22516) b!123817))

(assert (= (and b!123816 (not c!22516)) b!123818))

(declare-fun m!143721 () Bool)

(assert (=> b!123817 m!143721))

(assert (=> d!37083 d!37181))

(declare-fun b!123821 () Bool)

(declare-fun e!80905 () Option!168)

(assert (=> b!123821 (= e!80905 (getValueByKey!162 (t!5978 (toList!834 lt!63499)) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123820 () Bool)

(declare-fun e!80904 () Option!168)

(assert (=> b!123820 (= e!80904 e!80905)))

(declare-fun c!22518 () Bool)

(assert (=> b!123820 (= c!22518 (and ((_ is Cons!1680) (toList!834 lt!63499)) (not (= (_1!1273 (h!2281 (toList!834 lt!63499))) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun b!123819 () Bool)

(assert (=> b!123819 (= e!80904 (Some!167 (_2!1273 (h!2281 (toList!834 lt!63499)))))))

(declare-fun b!123822 () Bool)

(assert (=> b!123822 (= e!80905 None!166)))

(declare-fun d!37183 () Bool)

(declare-fun c!22517 () Bool)

(assert (=> d!37183 (= c!22517 (and ((_ is Cons!1680) (toList!834 lt!63499)) (= (_1!1273 (h!2281 (toList!834 lt!63499))) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37183 (= (getValueByKey!162 (toList!834 lt!63499) (_1!1273 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) e!80904)))

(assert (= (and d!37183 c!22517) b!123819))

(assert (= (and d!37183 (not c!22517)) b!123820))

(assert (= (and b!123820 c!22518) b!123821))

(assert (= (and b!123820 (not c!22518)) b!123822))

(declare-fun m!143723 () Bool)

(assert (=> b!123821 m!143723))

(assert (=> b!123559 d!37183))

(assert (=> b!123569 d!37133))

(assert (=> b!123569 d!37135))

(assert (=> b!123538 d!37107))

(declare-fun d!37185 () Bool)

(assert (=> d!37185 (= (size!2463 newMap!16) (bvadd (_size!570 newMap!16) (bvsdiv (bvadd (extraKeys!2539 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!123618 d!37185))

(assert (=> b!123507 d!37107))

(declare-fun d!37187 () Bool)

(declare-fun res!60045 () Bool)

(declare-fun e!80906 () Bool)

(assert (=> d!37187 (=> (not res!60045) (not e!80906))))

(assert (=> d!37187 (= res!60045 (validMask!0 (mask!6991 (v!3084 (underlying!426 thiss!992)))))))

(assert (=> d!37187 (= (simpleValid!84 (v!3084 (underlying!426 thiss!992))) e!80906)))

(declare-fun b!123823 () Bool)

(declare-fun res!60047 () Bool)

(assert (=> b!123823 (=> (not res!60047) (not e!80906))))

(assert (=> b!123823 (= res!60047 (and (= (size!2458 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000001)) (= (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (size!2458 (_values!2737 (v!3084 (underlying!426 thiss!992))))) (bvsge (_size!570 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!570 (v!3084 (underlying!426 thiss!992))) (bvadd (mask!6991 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!123825 () Bool)

(declare-fun res!60048 () Bool)

(assert (=> b!123825 (=> (not res!60048) (not e!80906))))

(assert (=> b!123825 (= res!60048 (= (size!2463 (v!3084 (underlying!426 thiss!992))) (bvadd (_size!570 (v!3084 (underlying!426 thiss!992))) (bvsdiv (bvadd (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!123824 () Bool)

(declare-fun res!60046 () Bool)

(assert (=> b!123824 (=> (not res!60046) (not e!80906))))

(assert (=> b!123824 (= res!60046 (bvsge (size!2463 (v!3084 (underlying!426 thiss!992))) (_size!570 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun b!123826 () Bool)

(assert (=> b!123826 (= e!80906 (and (bvsge (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!570 (v!3084 (underlying!426 thiss!992))) #b00000000000000000000000000000000)))))

(assert (= (and d!37187 res!60045) b!123823))

(assert (= (and b!123823 res!60047) b!123824))

(assert (= (and b!123824 res!60046) b!123825))

(assert (= (and b!123825 res!60048) b!123826))

(assert (=> d!37187 m!143219))

(declare-fun m!143725 () Bool)

(assert (=> b!123825 m!143725))

(assert (=> b!123824 m!143725))

(assert (=> d!37089 d!37187))

(declare-fun d!37189 () Bool)

(assert (=> d!37189 (= (apply!108 lt!63479 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1424 (getValueByKey!162 (toList!834 lt!63479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5118 () Bool)

(assert (= bs!5118 d!37189))

(declare-fun m!143727 () Bool)

(assert (=> bs!5118 m!143727))

(assert (=> bs!5118 m!143727))

(declare-fun m!143729 () Bool)

(assert (=> bs!5118 m!143729))

(assert (=> b!123544 d!37189))

(assert (=> d!37073 d!37071))

(assert (=> d!37073 d!37067))

(declare-fun d!37191 () Bool)

(assert (=> d!37191 (contains!858 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63417)))

(assert (=> d!37191 true))

(declare-fun _$35!366 () Unit!3833)

(assert (=> d!37191 (= (choose!750 lt!63437 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63417) _$35!366)))

(declare-fun bs!5119 () Bool)

(assert (= bs!5119 d!37191))

(assert (=> bs!5119 m!143235))

(assert (=> bs!5119 m!143235))

(assert (=> bs!5119 m!143247))

(assert (=> d!37073 d!37191))

(declare-fun d!37193 () Bool)

(declare-fun e!80907 () Bool)

(assert (=> d!37193 e!80907))

(declare-fun res!60049 () Bool)

(assert (=> d!37193 (=> res!60049 e!80907)))

(declare-fun lt!63614 () Bool)

(assert (=> d!37193 (= res!60049 (not lt!63614))))

(declare-fun lt!63616 () Bool)

(assert (=> d!37193 (= lt!63614 lt!63616)))

(declare-fun lt!63615 () Unit!3833)

(declare-fun e!80908 () Unit!3833)

(assert (=> d!37193 (= lt!63615 e!80908)))

(declare-fun c!22519 () Bool)

(assert (=> d!37193 (= c!22519 lt!63616)))

(assert (=> d!37193 (= lt!63616 (containsKey!166 (toList!834 lt!63437) lt!63417))))

(assert (=> d!37193 (= (contains!858 lt!63437 lt!63417) lt!63614)))

(declare-fun b!123828 () Bool)

(declare-fun lt!63613 () Unit!3833)

(assert (=> b!123828 (= e!80908 lt!63613)))

(assert (=> b!123828 (= lt!63613 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63437) lt!63417))))

(assert (=> b!123828 (isDefined!116 (getValueByKey!162 (toList!834 lt!63437) lt!63417))))

(declare-fun b!123829 () Bool)

(declare-fun Unit!3848 () Unit!3833)

(assert (=> b!123829 (= e!80908 Unit!3848)))

(declare-fun b!123830 () Bool)

(assert (=> b!123830 (= e!80907 (isDefined!116 (getValueByKey!162 (toList!834 lt!63437) lt!63417)))))

(assert (= (and d!37193 c!22519) b!123828))

(assert (= (and d!37193 (not c!22519)) b!123829))

(assert (= (and d!37193 (not res!60049)) b!123830))

(declare-fun m!143731 () Bool)

(assert (=> d!37193 m!143731))

(declare-fun m!143733 () Bool)

(assert (=> b!123828 m!143733))

(declare-fun m!143735 () Bool)

(assert (=> b!123828 m!143735))

(assert (=> b!123828 m!143735))

(declare-fun m!143737 () Bool)

(assert (=> b!123828 m!143737))

(assert (=> b!123830 m!143735))

(assert (=> b!123830 m!143735))

(assert (=> b!123830 m!143737))

(assert (=> d!37073 d!37193))

(declare-fun d!37195 () Bool)

(assert (=> d!37195 (= (apply!108 lt!63479 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1424 (getValueByKey!162 (toList!834 lt!63479) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5120 () Bool)

(assert (= bs!5120 d!37195))

(declare-fun m!143739 () Bool)

(assert (=> bs!5120 m!143739))

(assert (=> bs!5120 m!143739))

(declare-fun m!143741 () Bool)

(assert (=> bs!5120 m!143741))

(assert (=> b!123545 d!37195))

(declare-fun b!123831 () Bool)

(declare-fun e!80910 () Bool)

(declare-fun e!80912 () Bool)

(assert (=> b!123831 (= e!80910 e!80912)))

(assert (=> b!123831 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun res!60053 () Bool)

(declare-fun lt!63622 () ListLongMap!1637)

(assert (=> b!123831 (= res!60053 (contains!858 lt!63622 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!123831 (=> (not res!60053) (not e!80912))))

(declare-fun b!123832 () Bool)

(declare-fun e!80914 () Bool)

(assert (=> b!123832 (= e!80914 e!80910)))

(declare-fun c!22520 () Bool)

(declare-fun e!80909 () Bool)

(assert (=> b!123832 (= c!22520 e!80909)))

(declare-fun res!60051 () Bool)

(assert (=> b!123832 (=> (not res!60051) (not e!80909))))

(assert (=> b!123832 (= res!60051 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!123833 () Bool)

(declare-fun e!80911 () ListLongMap!1637)

(declare-fun call!13145 () ListLongMap!1637)

(assert (=> b!123833 (= e!80911 call!13145)))

(declare-fun bm!13142 () Bool)

(assert (=> bm!13142 (= call!13145 (getCurrentListMapNoExtraKeys!120 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (_values!2737 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992))) (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) (minValue!2619 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun b!123834 () Bool)

(assert (=> b!123834 (= e!80909 (validKeyInArray!0 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!123834 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!123835 () Bool)

(assert (=> b!123835 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(assert (=> b!123835 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2458 (_values!2737 (v!3084 (underlying!426 thiss!992))))))))

(assert (=> b!123835 (= e!80912 (= (apply!108 lt!63622 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123836 () Bool)

(declare-fun e!80913 () Bool)

(assert (=> b!123836 (= e!80910 e!80913)))

(declare-fun c!22521 () Bool)

(assert (=> b!123836 (= c!22521 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!123838 () Bool)

(declare-fun res!60050 () Bool)

(assert (=> b!123838 (=> (not res!60050) (not e!80914))))

(assert (=> b!123838 (= res!60050 (not (contains!858 lt!63622 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123839 () Bool)

(assert (=> b!123839 (= e!80913 (isEmpty!394 lt!63622))))

(declare-fun b!123840 () Bool)

(assert (=> b!123840 (= e!80913 (= lt!63622 (getCurrentListMapNoExtraKeys!120 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (_values!2737 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992))) (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) (minValue!2619 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!123841 () Bool)

(declare-fun e!80915 () ListLongMap!1637)

(assert (=> b!123841 (= e!80915 e!80911)))

(declare-fun c!22522 () Bool)

(assert (=> b!123841 (= c!22522 (validKeyInArray!0 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!123842 () Bool)

(declare-fun lt!63623 () Unit!3833)

(declare-fun lt!63618 () Unit!3833)

(assert (=> b!123842 (= lt!63623 lt!63618)))

(declare-fun lt!63617 () (_ BitVec 64))

(declare-fun lt!63620 () (_ BitVec 64))

(declare-fun lt!63619 () V!3409)

(declare-fun lt!63621 () ListLongMap!1637)

(assert (=> b!123842 (not (contains!858 (+!155 lt!63621 (tuple2!2525 lt!63617 lt!63619)) lt!63620))))

(assert (=> b!123842 (= lt!63618 (addStillNotContains!55 lt!63621 lt!63617 lt!63619 lt!63620))))

(assert (=> b!123842 (= lt!63620 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!123842 (= lt!63619 (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123842 (= lt!63617 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!123842 (= lt!63621 call!13145)))

(assert (=> b!123842 (= e!80911 (+!155 call!13145 (tuple2!2525 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!37197 () Bool)

(assert (=> d!37197 e!80914))

(declare-fun res!60052 () Bool)

(assert (=> d!37197 (=> (not res!60052) (not e!80914))))

(assert (=> d!37197 (= res!60052 (not (contains!858 lt!63622 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37197 (= lt!63622 e!80915)))

(declare-fun c!22523 () Bool)

(assert (=> d!37197 (= c!22523 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(assert (=> d!37197 (validMask!0 (mask!6991 (v!3084 (underlying!426 thiss!992))))))

(assert (=> d!37197 (= (getCurrentListMapNoExtraKeys!120 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (_values!2737 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992))) (extraKeys!2539 (v!3084 (underlying!426 thiss!992))) (zeroValue!2619 (v!3084 (underlying!426 thiss!992))) (minValue!2619 (v!3084 (underlying!426 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992)))) lt!63622)))

(declare-fun b!123837 () Bool)

(assert (=> b!123837 (= e!80915 (ListLongMap!1638 Nil!1681))))

(assert (= (and d!37197 c!22523) b!123837))

(assert (= (and d!37197 (not c!22523)) b!123841))

(assert (= (and b!123841 c!22522) b!123842))

(assert (= (and b!123841 (not c!22522)) b!123833))

(assert (= (or b!123842 b!123833) bm!13142))

(assert (= (and d!37197 res!60052) b!123838))

(assert (= (and b!123838 res!60050) b!123832))

(assert (= (and b!123832 res!60051) b!123834))

(assert (= (and b!123832 c!22520) b!123831))

(assert (= (and b!123832 (not c!22520)) b!123836))

(assert (= (and b!123831 res!60053) b!123835))

(assert (= (and b!123836 c!22521) b!123840))

(assert (= (and b!123836 (not c!22521)) b!123839))

(declare-fun b_lambda!5431 () Bool)

(assert (=> (not b_lambda!5431) (not b!123835)))

(assert (=> b!123835 t!5980))

(declare-fun b_and!7593 () Bool)

(assert (= b_and!7589 (and (=> t!5980 result!3763) b_and!7593)))

(assert (=> b!123835 t!5982))

(declare-fun b_and!7595 () Bool)

(assert (= b_and!7591 (and (=> t!5982 result!3767) b_and!7595)))

(declare-fun b_lambda!5433 () Bool)

(assert (=> (not b_lambda!5433) (not b!123842)))

(assert (=> b!123842 t!5980))

(declare-fun b_and!7597 () Bool)

(assert (= b_and!7593 (and (=> t!5980 result!3763) b_and!7597)))

(assert (=> b!123842 t!5982))

(declare-fun b_and!7599 () Bool)

(assert (= b_and!7595 (and (=> t!5982 result!3767) b_and!7599)))

(declare-fun m!143743 () Bool)

(assert (=> bm!13142 m!143743))

(declare-fun m!143745 () Bool)

(assert (=> b!123831 m!143745))

(assert (=> b!123831 m!143745))

(declare-fun m!143747 () Bool)

(assert (=> b!123831 m!143747))

(declare-fun m!143749 () Bool)

(assert (=> b!123842 m!143749))

(declare-fun m!143751 () Bool)

(assert (=> b!123842 m!143751))

(declare-fun m!143753 () Bool)

(assert (=> b!123842 m!143753))

(assert (=> b!123842 m!143745))

(assert (=> b!123842 m!143753))

(declare-fun m!143755 () Bool)

(assert (=> b!123842 m!143755))

(assert (=> b!123842 m!143751))

(assert (=> b!123842 m!143203))

(declare-fun m!143757 () Bool)

(assert (=> b!123842 m!143757))

(declare-fun m!143759 () Bool)

(assert (=> b!123842 m!143759))

(assert (=> b!123842 m!143203))

(assert (=> b!123841 m!143745))

(assert (=> b!123841 m!143745))

(declare-fun m!143761 () Bool)

(assert (=> b!123841 m!143761))

(assert (=> b!123835 m!143203))

(assert (=> b!123835 m!143751))

(assert (=> b!123835 m!143745))

(declare-fun m!143763 () Bool)

(assert (=> b!123835 m!143763))

(assert (=> b!123835 m!143745))

(assert (=> b!123835 m!143751))

(assert (=> b!123835 m!143203))

(assert (=> b!123835 m!143757))

(assert (=> b!123840 m!143743))

(declare-fun m!143765 () Bool)

(assert (=> b!123838 m!143765))

(declare-fun m!143767 () Bool)

(assert (=> b!123839 m!143767))

(assert (=> b!123834 m!143745))

(assert (=> b!123834 m!143745))

(assert (=> b!123834 m!143761))

(declare-fun m!143769 () Bool)

(assert (=> d!37197 m!143769))

(assert (=> d!37197 m!143219))

(assert (=> b!123606 d!37197))

(declare-fun d!37199 () Bool)

(declare-fun e!80916 () Bool)

(assert (=> d!37199 e!80916))

(declare-fun res!60054 () Bool)

(assert (=> d!37199 (=> (not res!60054) (not e!80916))))

(declare-fun lt!63626 () ListLongMap!1637)

(assert (=> d!37199 (= res!60054 (contains!858 lt!63626 (_1!1273 (ite (or c!22432 c!22434) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))))

(declare-fun lt!63624 () List!1684)

(assert (=> d!37199 (= lt!63626 (ListLongMap!1638 lt!63624))))

(declare-fun lt!63627 () Unit!3833)

(declare-fun lt!63625 () Unit!3833)

(assert (=> d!37199 (= lt!63627 lt!63625)))

(assert (=> d!37199 (= (getValueByKey!162 lt!63624 (_1!1273 (ite (or c!22432 c!22434) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))) (Some!167 (_2!1273 (ite (or c!22432 c!22434) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))))

(assert (=> d!37199 (= lt!63625 (lemmaContainsTupThenGetReturnValue!81 lt!63624 (_1!1273 (ite (or c!22432 c!22434) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))) (_2!1273 (ite (or c!22432 c!22434) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))))

(assert (=> d!37199 (= lt!63624 (insertStrictlySorted!84 (toList!834 (ite c!22432 call!13122 (ite c!22434 call!13121 call!13116))) (_1!1273 (ite (or c!22432 c!22434) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))) (_2!1273 (ite (or c!22432 c!22434) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))))

(assert (=> d!37199 (= (+!155 (ite c!22432 call!13122 (ite c!22434 call!13121 call!13116)) (ite (or c!22432 c!22434) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))) lt!63626)))

(declare-fun b!123843 () Bool)

(declare-fun res!60055 () Bool)

(assert (=> b!123843 (=> (not res!60055) (not e!80916))))

(assert (=> b!123843 (= res!60055 (= (getValueByKey!162 (toList!834 lt!63626) (_1!1273 (ite (or c!22432 c!22434) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))) (Some!167 (_2!1273 (ite (or c!22432 c!22434) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))))

(declare-fun b!123844 () Bool)

(assert (=> b!123844 (= e!80916 (contains!860 (toList!834 lt!63626) (ite (or c!22432 c!22434) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 newMap!16)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))

(assert (= (and d!37199 res!60054) b!123843))

(assert (= (and b!123843 res!60055) b!123844))

(declare-fun m!143771 () Bool)

(assert (=> d!37199 m!143771))

(declare-fun m!143773 () Bool)

(assert (=> d!37199 m!143773))

(declare-fun m!143775 () Bool)

(assert (=> d!37199 m!143775))

(declare-fun m!143777 () Bool)

(assert (=> d!37199 m!143777))

(declare-fun m!143779 () Bool)

(assert (=> b!123843 m!143779))

(declare-fun m!143781 () Bool)

(assert (=> b!123844 m!143781))

(assert (=> bm!13115 d!37199))

(declare-fun lt!63628 () Bool)

(declare-fun d!37201 () Bool)

(assert (=> d!37201 (= lt!63628 (select (content!122 (toList!834 lt!63451)) (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun e!80917 () Bool)

(assert (=> d!37201 (= lt!63628 e!80917)))

(declare-fun res!60056 () Bool)

(assert (=> d!37201 (=> (not res!60056) (not e!80917))))

(assert (=> d!37201 (= res!60056 ((_ is Cons!1680) (toList!834 lt!63451)))))

(assert (=> d!37201 (= (contains!860 (toList!834 lt!63451) (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63628)))

(declare-fun b!123845 () Bool)

(declare-fun e!80918 () Bool)

(assert (=> b!123845 (= e!80917 e!80918)))

(declare-fun res!60057 () Bool)

(assert (=> b!123845 (=> res!60057 e!80918)))

(assert (=> b!123845 (= res!60057 (= (h!2281 (toList!834 lt!63451)) (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123846 () Bool)

(assert (=> b!123846 (= e!80918 (contains!860 (t!5978 (toList!834 lt!63451)) (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (= (and d!37201 res!60056) b!123845))

(assert (= (and b!123845 (not res!60057)) b!123846))

(declare-fun m!143783 () Bool)

(assert (=> d!37201 m!143783))

(declare-fun m!143785 () Bool)

(assert (=> d!37201 m!143785))

(declare-fun m!143787 () Bool)

(assert (=> b!123846 m!143787))

(assert (=> b!123515 d!37201))

(declare-fun b!123847 () Bool)

(declare-fun e!80921 () Bool)

(declare-fun e!80920 () Bool)

(assert (=> b!123847 (= e!80921 e!80920)))

(declare-fun lt!63630 () (_ BitVec 64))

(assert (=> b!123847 (= lt!63630 (select (arr!2194 (_keys!4480 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!63629 () Unit!3833)

(assert (=> b!123847 (= lt!63629 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4480 newMap!16) lt!63630 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!123847 (arrayContainsKey!0 (_keys!4480 newMap!16) lt!63630 #b00000000000000000000000000000000)))

(declare-fun lt!63631 () Unit!3833)

(assert (=> b!123847 (= lt!63631 lt!63629)))

(declare-fun res!60058 () Bool)

(assert (=> b!123847 (= res!60058 (= (seekEntryOrOpen!0 (select (arr!2194 (_keys!4480 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4480 newMap!16) (mask!6991 newMap!16)) (Found!270 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!123847 (=> (not res!60058) (not e!80920))))

(declare-fun b!123848 () Bool)

(declare-fun call!13146 () Bool)

(assert (=> b!123848 (= e!80920 call!13146)))

(declare-fun b!123849 () Bool)

(assert (=> b!123849 (= e!80921 call!13146)))

(declare-fun b!123850 () Bool)

(declare-fun e!80919 () Bool)

(assert (=> b!123850 (= e!80919 e!80921)))

(declare-fun c!22524 () Bool)

(assert (=> b!123850 (= c!22524 (validKeyInArray!0 (select (arr!2194 (_keys!4480 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!13143 () Bool)

(assert (=> bm!13143 (= call!13146 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4480 newMap!16) (mask!6991 newMap!16)))))

(declare-fun d!37203 () Bool)

(declare-fun res!60059 () Bool)

(assert (=> d!37203 (=> res!60059 e!80919)))

(assert (=> d!37203 (= res!60059 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2457 (_keys!4480 newMap!16))))))

(assert (=> d!37203 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4480 newMap!16) (mask!6991 newMap!16)) e!80919)))

(assert (= (and d!37203 (not res!60059)) b!123850))

(assert (= (and b!123850 c!22524) b!123847))

(assert (= (and b!123850 (not c!22524)) b!123849))

(assert (= (and b!123847 res!60058) b!123848))

(assert (= (or b!123848 b!123849) bm!13143))

(assert (=> b!123847 m!143655))

(declare-fun m!143789 () Bool)

(assert (=> b!123847 m!143789))

(declare-fun m!143791 () Bool)

(assert (=> b!123847 m!143791))

(assert (=> b!123847 m!143655))

(declare-fun m!143793 () Bool)

(assert (=> b!123847 m!143793))

(assert (=> b!123850 m!143655))

(assert (=> b!123850 m!143655))

(assert (=> b!123850 m!143657))

(declare-fun m!143795 () Bool)

(assert (=> bm!13143 m!143795))

(assert (=> bm!13112 d!37203))

(declare-fun d!37205 () Bool)

(declare-fun e!80922 () Bool)

(assert (=> d!37205 e!80922))

(declare-fun res!60060 () Bool)

(assert (=> d!37205 (=> res!60060 e!80922)))

(declare-fun lt!63633 () Bool)

(assert (=> d!37205 (= res!60060 (not lt!63633))))

(declare-fun lt!63635 () Bool)

(assert (=> d!37205 (= lt!63633 lt!63635)))

(declare-fun lt!63634 () Unit!3833)

(declare-fun e!80923 () Unit!3833)

(assert (=> d!37205 (= lt!63634 e!80923)))

(declare-fun c!22525 () Bool)

(assert (=> d!37205 (= c!22525 lt!63635)))

(assert (=> d!37205 (= lt!63635 (containsKey!166 (toList!834 lt!63539) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37205 (= (contains!858 lt!63539 #b1000000000000000000000000000000000000000000000000000000000000000) lt!63633)))

(declare-fun b!123851 () Bool)

(declare-fun lt!63632 () Unit!3833)

(assert (=> b!123851 (= e!80923 lt!63632)))

(assert (=> b!123851 (= lt!63632 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63539) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123851 (isDefined!116 (getValueByKey!162 (toList!834 lt!63539) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123852 () Bool)

(declare-fun Unit!3849 () Unit!3833)

(assert (=> b!123852 (= e!80923 Unit!3849)))

(declare-fun b!123853 () Bool)

(assert (=> b!123853 (= e!80922 (isDefined!116 (getValueByKey!162 (toList!834 lt!63539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37205 c!22525) b!123851))

(assert (= (and d!37205 (not c!22525)) b!123852))

(assert (= (and d!37205 (not res!60060)) b!123853))

(declare-fun m!143797 () Bool)

(assert (=> d!37205 m!143797))

(declare-fun m!143799 () Bool)

(assert (=> b!123851 m!143799))

(declare-fun m!143801 () Bool)

(assert (=> b!123851 m!143801))

(assert (=> b!123851 m!143801))

(declare-fun m!143803 () Bool)

(assert (=> b!123851 m!143803))

(assert (=> b!123853 m!143801))

(assert (=> b!123853 m!143801))

(assert (=> b!123853 m!143803))

(assert (=> b!123604 d!37205))

(assert (=> d!37055 d!37085))

(declare-fun d!37207 () Bool)

(declare-fun e!80924 () Bool)

(assert (=> d!37207 e!80924))

(declare-fun res!60061 () Bool)

(assert (=> d!37207 (=> res!60061 e!80924)))

(declare-fun lt!63637 () Bool)

(assert (=> d!37207 (= res!60061 (not lt!63637))))

(declare-fun lt!63639 () Bool)

(assert (=> d!37207 (= lt!63637 lt!63639)))

(declare-fun lt!63638 () Unit!3833)

(declare-fun e!80925 () Unit!3833)

(assert (=> d!37207 (= lt!63638 e!80925)))

(declare-fun c!22526 () Bool)

(assert (=> d!37207 (= c!22526 lt!63639)))

(assert (=> d!37207 (= lt!63639 (containsKey!166 (toList!834 lt!63421) lt!63431))))

(assert (=> d!37207 (= (contains!858 lt!63421 lt!63431) lt!63637)))

(declare-fun b!123854 () Bool)

(declare-fun lt!63636 () Unit!3833)

(assert (=> b!123854 (= e!80925 lt!63636)))

(assert (=> b!123854 (= lt!63636 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63421) lt!63431))))

(assert (=> b!123854 (isDefined!116 (getValueByKey!162 (toList!834 lt!63421) lt!63431))))

(declare-fun b!123855 () Bool)

(declare-fun Unit!3850 () Unit!3833)

(assert (=> b!123855 (= e!80925 Unit!3850)))

(declare-fun b!123856 () Bool)

(assert (=> b!123856 (= e!80924 (isDefined!116 (getValueByKey!162 (toList!834 lt!63421) lt!63431)))))

(assert (= (and d!37207 c!22526) b!123854))

(assert (= (and d!37207 (not c!22526)) b!123855))

(assert (= (and d!37207 (not res!60061)) b!123856))

(declare-fun m!143805 () Bool)

(assert (=> d!37207 m!143805))

(declare-fun m!143807 () Bool)

(assert (=> b!123854 m!143807))

(assert (=> b!123854 m!143393))

(assert (=> b!123854 m!143393))

(declare-fun m!143809 () Bool)

(assert (=> b!123854 m!143809))

(assert (=> b!123856 m!143393))

(assert (=> b!123856 m!143393))

(assert (=> b!123856 m!143809))

(assert (=> d!37055 d!37207))

(assert (=> d!37055 d!37063))

(assert (=> d!37055 d!37061))

(declare-fun d!37209 () Bool)

(assert (=> d!37209 (= (apply!108 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63431) (apply!108 lt!63421 lt!63431))))

(assert (=> d!37209 true))

(declare-fun _$34!938 () Unit!3833)

(assert (=> d!37209 (= (choose!749 lt!63421 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63431) _$34!938)))

(declare-fun bs!5121 () Bool)

(assert (= bs!5121 d!37209))

(assert (=> bs!5121 m!143239))

(assert (=> bs!5121 m!143239))

(assert (=> bs!5121 m!143253))

(assert (=> bs!5121 m!143231))

(assert (=> d!37055 d!37209))

(declare-fun b!123857 () Bool)

(declare-fun e!80928 () Bool)

(declare-fun e!80927 () Bool)

(assert (=> b!123857 (= e!80928 e!80927)))

(declare-fun lt!63641 () (_ BitVec 64))

(assert (=> b!123857 (= lt!63641 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!63640 () Unit!3833)

(assert (=> b!123857 (= lt!63640 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4480 (v!3084 (underlying!426 thiss!992))) lt!63641 #b00000000000000000000000000000000))))

(assert (=> b!123857 (arrayContainsKey!0 (_keys!4480 (v!3084 (underlying!426 thiss!992))) lt!63641 #b00000000000000000000000000000000)))

(declare-fun lt!63642 () Unit!3833)

(assert (=> b!123857 (= lt!63642 lt!63640)))

(declare-fun res!60062 () Bool)

(assert (=> b!123857 (= res!60062 (= (seekEntryOrOpen!0 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) #b00000000000000000000000000000000) (_keys!4480 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992)))) (Found!270 #b00000000000000000000000000000000)))))

(assert (=> b!123857 (=> (not res!60062) (not e!80927))))

(declare-fun b!123858 () Bool)

(declare-fun call!13147 () Bool)

(assert (=> b!123858 (= e!80927 call!13147)))

(declare-fun b!123859 () Bool)

(assert (=> b!123859 (= e!80928 call!13147)))

(declare-fun b!123860 () Bool)

(declare-fun e!80926 () Bool)

(assert (=> b!123860 (= e!80926 e!80928)))

(declare-fun c!22527 () Bool)

(assert (=> b!123860 (= c!22527 (validKeyInArray!0 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!13144 () Bool)

(assert (=> bm!13144 (= call!13147 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4480 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992)))))))

(declare-fun d!37211 () Bool)

(declare-fun res!60063 () Bool)

(assert (=> d!37211 (=> res!60063 e!80926)))

(assert (=> d!37211 (= res!60063 (bvsge #b00000000000000000000000000000000 (size!2457 (_keys!4480 (v!3084 (underlying!426 thiss!992))))))))

(assert (=> d!37211 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4480 (v!3084 (underlying!426 thiss!992))) (mask!6991 (v!3084 (underlying!426 thiss!992)))) e!80926)))

(assert (= (and d!37211 (not res!60063)) b!123860))

(assert (= (and b!123860 c!22527) b!123857))

(assert (= (and b!123860 (not c!22527)) b!123859))

(assert (= (and b!123857 res!60062) b!123858))

(assert (= (or b!123858 b!123859) bm!13144))

(assert (=> b!123857 m!143539))

(declare-fun m!143811 () Bool)

(assert (=> b!123857 m!143811))

(declare-fun m!143813 () Bool)

(assert (=> b!123857 m!143813))

(assert (=> b!123857 m!143539))

(declare-fun m!143815 () Bool)

(assert (=> b!123857 m!143815))

(assert (=> b!123860 m!143539))

(assert (=> b!123860 m!143539))

(assert (=> b!123860 m!143541))

(declare-fun m!143817 () Bool)

(assert (=> bm!13144 m!143817))

(assert (=> b!123622 d!37211))

(declare-fun d!37213 () Bool)

(declare-fun e!80929 () Bool)

(assert (=> d!37213 e!80929))

(declare-fun res!60064 () Bool)

(assert (=> d!37213 (=> (not res!60064) (not e!80929))))

(declare-fun lt!63645 () ListLongMap!1637)

(assert (=> d!37213 (= res!60064 (contains!858 lt!63645 (_1!1273 (tuple2!2525 lt!63474 (minValue!2619 newMap!16)))))))

(declare-fun lt!63643 () List!1684)

(assert (=> d!37213 (= lt!63645 (ListLongMap!1638 lt!63643))))

(declare-fun lt!63646 () Unit!3833)

(declare-fun lt!63644 () Unit!3833)

(assert (=> d!37213 (= lt!63646 lt!63644)))

(assert (=> d!37213 (= (getValueByKey!162 lt!63643 (_1!1273 (tuple2!2525 lt!63474 (minValue!2619 newMap!16)))) (Some!167 (_2!1273 (tuple2!2525 lt!63474 (minValue!2619 newMap!16)))))))

(assert (=> d!37213 (= lt!63644 (lemmaContainsTupThenGetReturnValue!81 lt!63643 (_1!1273 (tuple2!2525 lt!63474 (minValue!2619 newMap!16))) (_2!1273 (tuple2!2525 lt!63474 (minValue!2619 newMap!16)))))))

(assert (=> d!37213 (= lt!63643 (insertStrictlySorted!84 (toList!834 lt!63467) (_1!1273 (tuple2!2525 lt!63474 (minValue!2619 newMap!16))) (_2!1273 (tuple2!2525 lt!63474 (minValue!2619 newMap!16)))))))

(assert (=> d!37213 (= (+!155 lt!63467 (tuple2!2525 lt!63474 (minValue!2619 newMap!16))) lt!63645)))

(declare-fun b!123861 () Bool)

(declare-fun res!60065 () Bool)

(assert (=> b!123861 (=> (not res!60065) (not e!80929))))

(assert (=> b!123861 (= res!60065 (= (getValueByKey!162 (toList!834 lt!63645) (_1!1273 (tuple2!2525 lt!63474 (minValue!2619 newMap!16)))) (Some!167 (_2!1273 (tuple2!2525 lt!63474 (minValue!2619 newMap!16))))))))

(declare-fun b!123862 () Bool)

(assert (=> b!123862 (= e!80929 (contains!860 (toList!834 lt!63645) (tuple2!2525 lt!63474 (minValue!2619 newMap!16))))))

(assert (= (and d!37213 res!60064) b!123861))

(assert (= (and b!123861 res!60065) b!123862))

(declare-fun m!143819 () Bool)

(assert (=> d!37213 m!143819))

(declare-fun m!143821 () Bool)

(assert (=> d!37213 m!143821))

(declare-fun m!143823 () Bool)

(assert (=> d!37213 m!143823))

(declare-fun m!143825 () Bool)

(assert (=> d!37213 m!143825))

(declare-fun m!143827 () Bool)

(assert (=> b!123861 m!143827))

(declare-fun m!143829 () Bool)

(assert (=> b!123862 m!143829))

(assert (=> b!123531 d!37213))

(declare-fun d!37215 () Bool)

(assert (=> d!37215 (= (apply!108 (+!155 lt!63480 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16))) lt!63481) (apply!108 lt!63480 lt!63481))))

(declare-fun lt!63647 () Unit!3833)

(assert (=> d!37215 (= lt!63647 (choose!749 lt!63480 lt!63468 (zeroValue!2619 newMap!16) lt!63481))))

(declare-fun e!80930 () Bool)

(assert (=> d!37215 e!80930))

(declare-fun res!60066 () Bool)

(assert (=> d!37215 (=> (not res!60066) (not e!80930))))

(assert (=> d!37215 (= res!60066 (contains!858 lt!63480 lt!63481))))

(assert (=> d!37215 (= (addApplyDifferent!84 lt!63480 lt!63468 (zeroValue!2619 newMap!16) lt!63481) lt!63647)))

(declare-fun b!123863 () Bool)

(assert (=> b!123863 (= e!80930 (not (= lt!63481 lt!63468)))))

(assert (= (and d!37215 res!60066) b!123863))

(declare-fun m!143831 () Bool)

(assert (=> d!37215 m!143831))

(assert (=> d!37215 m!143357))

(assert (=> d!37215 m!143357))

(assert (=> d!37215 m!143359))

(declare-fun m!143833 () Bool)

(assert (=> d!37215 m!143833))

(assert (=> d!37215 m!143363))

(assert (=> b!123531 d!37215))

(declare-fun d!37217 () Bool)

(assert (=> d!37217 (= (apply!108 lt!63467 lt!63477) (get!1424 (getValueByKey!162 (toList!834 lt!63467) lt!63477)))))

(declare-fun bs!5122 () Bool)

(assert (= bs!5122 d!37217))

(declare-fun m!143835 () Bool)

(assert (=> bs!5122 m!143835))

(assert (=> bs!5122 m!143835))

(declare-fun m!143837 () Bool)

(assert (=> bs!5122 m!143837))

(assert (=> b!123531 d!37217))

(declare-fun d!37219 () Bool)

(assert (=> d!37219 (= (apply!108 (+!155 lt!63467 (tuple2!2525 lt!63474 (minValue!2619 newMap!16))) lt!63477) (apply!108 lt!63467 lt!63477))))

(declare-fun lt!63648 () Unit!3833)

(assert (=> d!37219 (= lt!63648 (choose!749 lt!63467 lt!63474 (minValue!2619 newMap!16) lt!63477))))

(declare-fun e!80931 () Bool)

(assert (=> d!37219 e!80931))

(declare-fun res!60067 () Bool)

(assert (=> d!37219 (=> (not res!60067) (not e!80931))))

(assert (=> d!37219 (= res!60067 (contains!858 lt!63467 lt!63477))))

(assert (=> d!37219 (= (addApplyDifferent!84 lt!63467 lt!63474 (minValue!2619 newMap!16) lt!63477) lt!63648)))

(declare-fun b!123864 () Bool)

(assert (=> b!123864 (= e!80931 (not (= lt!63477 lt!63474)))))

(assert (= (and d!37219 res!60067) b!123864))

(declare-fun m!143839 () Bool)

(assert (=> d!37219 m!143839))

(assert (=> d!37219 m!143353))

(assert (=> d!37219 m!143353))

(assert (=> d!37219 m!143367))

(declare-fun m!143841 () Bool)

(assert (=> d!37219 m!143841))

(assert (=> d!37219 m!143345))

(assert (=> b!123531 d!37219))

(declare-fun d!37221 () Bool)

(assert (=> d!37221 (= (apply!108 lt!63469 lt!63465) (get!1424 (getValueByKey!162 (toList!834 lt!63469) lt!63465)))))

(declare-fun bs!5123 () Bool)

(assert (= bs!5123 d!37221))

(declare-fun m!143843 () Bool)

(assert (=> bs!5123 m!143843))

(assert (=> bs!5123 m!143843))

(declare-fun m!143845 () Bool)

(assert (=> bs!5123 m!143845))

(assert (=> b!123531 d!37221))

(declare-fun d!37223 () Bool)

(assert (=> d!37223 (= (apply!108 lt!63480 lt!63481) (get!1424 (getValueByKey!162 (toList!834 lt!63480) lt!63481)))))

(declare-fun bs!5124 () Bool)

(assert (= bs!5124 d!37223))

(declare-fun m!143847 () Bool)

(assert (=> bs!5124 m!143847))

(assert (=> bs!5124 m!143847))

(declare-fun m!143849 () Bool)

(assert (=> bs!5124 m!143849))

(assert (=> b!123531 d!37223))

(declare-fun d!37225 () Bool)

(declare-fun e!80932 () Bool)

(assert (=> d!37225 e!80932))

(declare-fun res!60068 () Bool)

(assert (=> d!37225 (=> res!60068 e!80932)))

(declare-fun lt!63650 () Bool)

(assert (=> d!37225 (= res!60068 (not lt!63650))))

(declare-fun lt!63652 () Bool)

(assert (=> d!37225 (= lt!63650 lt!63652)))

(declare-fun lt!63651 () Unit!3833)

(declare-fun e!80933 () Unit!3833)

(assert (=> d!37225 (= lt!63651 e!80933)))

(declare-fun c!22528 () Bool)

(assert (=> d!37225 (= c!22528 lt!63652)))

(assert (=> d!37225 (= lt!63652 (containsKey!166 (toList!834 (+!155 lt!63483 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16)))) lt!63463))))

(assert (=> d!37225 (= (contains!858 (+!155 lt!63483 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16))) lt!63463) lt!63650)))

(declare-fun b!123865 () Bool)

(declare-fun lt!63649 () Unit!3833)

(assert (=> b!123865 (= e!80933 lt!63649)))

(assert (=> b!123865 (= lt!63649 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 (+!155 lt!63483 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16)))) lt!63463))))

(assert (=> b!123865 (isDefined!116 (getValueByKey!162 (toList!834 (+!155 lt!63483 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16)))) lt!63463))))

(declare-fun b!123866 () Bool)

(declare-fun Unit!3851 () Unit!3833)

(assert (=> b!123866 (= e!80933 Unit!3851)))

(declare-fun b!123867 () Bool)

(assert (=> b!123867 (= e!80932 (isDefined!116 (getValueByKey!162 (toList!834 (+!155 lt!63483 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16)))) lt!63463)))))

(assert (= (and d!37225 c!22528) b!123865))

(assert (= (and d!37225 (not c!22528)) b!123866))

(assert (= (and d!37225 (not res!60068)) b!123867))

(declare-fun m!143851 () Bool)

(assert (=> d!37225 m!143851))

(declare-fun m!143853 () Bool)

(assert (=> b!123865 m!143853))

(declare-fun m!143855 () Bool)

(assert (=> b!123865 m!143855))

(assert (=> b!123865 m!143855))

(declare-fun m!143857 () Bool)

(assert (=> b!123865 m!143857))

(assert (=> b!123867 m!143855))

(assert (=> b!123867 m!143855))

(assert (=> b!123867 m!143857))

(assert (=> b!123531 d!37225))

(declare-fun d!37227 () Bool)

(assert (=> d!37227 (= (apply!108 (+!155 lt!63480 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16))) lt!63481) (get!1424 (getValueByKey!162 (toList!834 (+!155 lt!63480 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16)))) lt!63481)))))

(declare-fun bs!5125 () Bool)

(assert (= bs!5125 d!37227))

(declare-fun m!143859 () Bool)

(assert (=> bs!5125 m!143859))

(assert (=> bs!5125 m!143859))

(declare-fun m!143861 () Bool)

(assert (=> bs!5125 m!143861))

(assert (=> b!123531 d!37227))

(assert (=> b!123531 d!37123))

(declare-fun d!37229 () Bool)

(declare-fun e!80934 () Bool)

(assert (=> d!37229 e!80934))

(declare-fun res!60069 () Bool)

(assert (=> d!37229 (=> (not res!60069) (not e!80934))))

(declare-fun lt!63655 () ListLongMap!1637)

(assert (=> d!37229 (= res!60069 (contains!858 lt!63655 (_1!1273 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16)))))))

(declare-fun lt!63653 () List!1684)

(assert (=> d!37229 (= lt!63655 (ListLongMap!1638 lt!63653))))

(declare-fun lt!63656 () Unit!3833)

(declare-fun lt!63654 () Unit!3833)

(assert (=> d!37229 (= lt!63656 lt!63654)))

(assert (=> d!37229 (= (getValueByKey!162 lt!63653 (_1!1273 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16)))) (Some!167 (_2!1273 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16)))))))

(assert (=> d!37229 (= lt!63654 (lemmaContainsTupThenGetReturnValue!81 lt!63653 (_1!1273 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16))) (_2!1273 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16)))))))

(assert (=> d!37229 (= lt!63653 (insertStrictlySorted!84 (toList!834 lt!63483) (_1!1273 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16))) (_2!1273 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16)))))))

(assert (=> d!37229 (= (+!155 lt!63483 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16))) lt!63655)))

(declare-fun b!123868 () Bool)

(declare-fun res!60070 () Bool)

(assert (=> b!123868 (=> (not res!60070) (not e!80934))))

(assert (=> b!123868 (= res!60070 (= (getValueByKey!162 (toList!834 lt!63655) (_1!1273 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16)))) (Some!167 (_2!1273 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16))))))))

(declare-fun b!123869 () Bool)

(assert (=> b!123869 (= e!80934 (contains!860 (toList!834 lt!63655) (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16))))))

(assert (= (and d!37229 res!60069) b!123868))

(assert (= (and b!123868 res!60070) b!123869))

(declare-fun m!143863 () Bool)

(assert (=> d!37229 m!143863))

(declare-fun m!143865 () Bool)

(assert (=> d!37229 m!143865))

(declare-fun m!143867 () Bool)

(assert (=> d!37229 m!143867))

(declare-fun m!143869 () Bool)

(assert (=> d!37229 m!143869))

(declare-fun m!143871 () Bool)

(assert (=> b!123868 m!143871))

(declare-fun m!143873 () Bool)

(assert (=> b!123869 m!143873))

(assert (=> b!123531 d!37229))

(declare-fun d!37231 () Bool)

(declare-fun e!80935 () Bool)

(assert (=> d!37231 e!80935))

(declare-fun res!60071 () Bool)

(assert (=> d!37231 (=> (not res!60071) (not e!80935))))

(declare-fun lt!63659 () ListLongMap!1637)

(assert (=> d!37231 (= res!60071 (contains!858 lt!63659 (_1!1273 (tuple2!2525 lt!63476 (minValue!2619 newMap!16)))))))

(declare-fun lt!63657 () List!1684)

(assert (=> d!37231 (= lt!63659 (ListLongMap!1638 lt!63657))))

(declare-fun lt!63660 () Unit!3833)

(declare-fun lt!63658 () Unit!3833)

(assert (=> d!37231 (= lt!63660 lt!63658)))

(assert (=> d!37231 (= (getValueByKey!162 lt!63657 (_1!1273 (tuple2!2525 lt!63476 (minValue!2619 newMap!16)))) (Some!167 (_2!1273 (tuple2!2525 lt!63476 (minValue!2619 newMap!16)))))))

(assert (=> d!37231 (= lt!63658 (lemmaContainsTupThenGetReturnValue!81 lt!63657 (_1!1273 (tuple2!2525 lt!63476 (minValue!2619 newMap!16))) (_2!1273 (tuple2!2525 lt!63476 (minValue!2619 newMap!16)))))))

(assert (=> d!37231 (= lt!63657 (insertStrictlySorted!84 (toList!834 lt!63469) (_1!1273 (tuple2!2525 lt!63476 (minValue!2619 newMap!16))) (_2!1273 (tuple2!2525 lt!63476 (minValue!2619 newMap!16)))))))

(assert (=> d!37231 (= (+!155 lt!63469 (tuple2!2525 lt!63476 (minValue!2619 newMap!16))) lt!63659)))

(declare-fun b!123870 () Bool)

(declare-fun res!60072 () Bool)

(assert (=> b!123870 (=> (not res!60072) (not e!80935))))

(assert (=> b!123870 (= res!60072 (= (getValueByKey!162 (toList!834 lt!63659) (_1!1273 (tuple2!2525 lt!63476 (minValue!2619 newMap!16)))) (Some!167 (_2!1273 (tuple2!2525 lt!63476 (minValue!2619 newMap!16))))))))

(declare-fun b!123871 () Bool)

(assert (=> b!123871 (= e!80935 (contains!860 (toList!834 lt!63659) (tuple2!2525 lt!63476 (minValue!2619 newMap!16))))))

(assert (= (and d!37231 res!60071) b!123870))

(assert (= (and b!123870 res!60072) b!123871))

(declare-fun m!143875 () Bool)

(assert (=> d!37231 m!143875))

(declare-fun m!143877 () Bool)

(assert (=> d!37231 m!143877))

(declare-fun m!143879 () Bool)

(assert (=> d!37231 m!143879))

(declare-fun m!143881 () Bool)

(assert (=> d!37231 m!143881))

(declare-fun m!143883 () Bool)

(assert (=> b!123870 m!143883))

(declare-fun m!143885 () Bool)

(assert (=> b!123871 m!143885))

(assert (=> b!123531 d!37231))

(declare-fun d!37233 () Bool)

(assert (=> d!37233 (contains!858 (+!155 lt!63483 (tuple2!2525 lt!63475 (zeroValue!2619 newMap!16))) lt!63463)))

(declare-fun lt!63661 () Unit!3833)

(assert (=> d!37233 (= lt!63661 (choose!750 lt!63483 lt!63475 (zeroValue!2619 newMap!16) lt!63463))))

(assert (=> d!37233 (contains!858 lt!63483 lt!63463)))

(assert (=> d!37233 (= (addStillContains!84 lt!63483 lt!63475 (zeroValue!2619 newMap!16) lt!63463) lt!63661)))

(declare-fun bs!5126 () Bool)

(assert (= bs!5126 d!37233))

(assert (=> bs!5126 m!143349))

(assert (=> bs!5126 m!143349))

(assert (=> bs!5126 m!143361))

(declare-fun m!143887 () Bool)

(assert (=> bs!5126 m!143887))

(declare-fun m!143889 () Bool)

(assert (=> bs!5126 m!143889))

(assert (=> b!123531 d!37233))

(declare-fun d!37235 () Bool)

(assert (=> d!37235 (= (apply!108 (+!155 lt!63467 (tuple2!2525 lt!63474 (minValue!2619 newMap!16))) lt!63477) (get!1424 (getValueByKey!162 (toList!834 (+!155 lt!63467 (tuple2!2525 lt!63474 (minValue!2619 newMap!16)))) lt!63477)))))

(declare-fun bs!5127 () Bool)

(assert (= bs!5127 d!37235))

(declare-fun m!143891 () Bool)

(assert (=> bs!5127 m!143891))

(assert (=> bs!5127 m!143891))

(declare-fun m!143893 () Bool)

(assert (=> bs!5127 m!143893))

(assert (=> b!123531 d!37235))

(declare-fun d!37237 () Bool)

(assert (=> d!37237 (= (apply!108 (+!155 lt!63469 (tuple2!2525 lt!63476 (minValue!2619 newMap!16))) lt!63465) (apply!108 lt!63469 lt!63465))))

(declare-fun lt!63662 () Unit!3833)

(assert (=> d!37237 (= lt!63662 (choose!749 lt!63469 lt!63476 (minValue!2619 newMap!16) lt!63465))))

(declare-fun e!80936 () Bool)

(assert (=> d!37237 e!80936))

(declare-fun res!60073 () Bool)

(assert (=> d!37237 (=> (not res!60073) (not e!80936))))

(assert (=> d!37237 (= res!60073 (contains!858 lt!63469 lt!63465))))

(assert (=> d!37237 (= (addApplyDifferent!84 lt!63469 lt!63476 (minValue!2619 newMap!16) lt!63465) lt!63662)))

(declare-fun b!123872 () Bool)

(assert (=> b!123872 (= e!80936 (not (= lt!63465 lt!63476)))))

(assert (= (and d!37237 res!60073) b!123872))

(declare-fun m!143895 () Bool)

(assert (=> d!37237 m!143895))

(assert (=> d!37237 m!143343))

(assert (=> d!37237 m!143343))

(assert (=> d!37237 m!143369))

(declare-fun m!143897 () Bool)

(assert (=> d!37237 m!143897))

(assert (=> d!37237 m!143371))

(assert (=> b!123531 d!37237))

(declare-fun d!37239 () Bool)

(assert (=> d!37239 (= (apply!108 (+!155 lt!63469 (tuple2!2525 lt!63476 (minValue!2619 newMap!16))) lt!63465) (get!1424 (getValueByKey!162 (toList!834 (+!155 lt!63469 (tuple2!2525 lt!63476 (minValue!2619 newMap!16)))) lt!63465)))))

(declare-fun bs!5128 () Bool)

(assert (= bs!5128 d!37239))

(declare-fun m!143899 () Bool)

(assert (=> bs!5128 m!143899))

(assert (=> bs!5128 m!143899))

(declare-fun m!143901 () Bool)

(assert (=> bs!5128 m!143901))

(assert (=> b!123531 d!37239))

(declare-fun d!37241 () Bool)

(declare-fun e!80937 () Bool)

(assert (=> d!37241 e!80937))

(declare-fun res!60074 () Bool)

(assert (=> d!37241 (=> (not res!60074) (not e!80937))))

(declare-fun lt!63665 () ListLongMap!1637)

(assert (=> d!37241 (= res!60074 (contains!858 lt!63665 (_1!1273 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16)))))))

(declare-fun lt!63663 () List!1684)

(assert (=> d!37241 (= lt!63665 (ListLongMap!1638 lt!63663))))

(declare-fun lt!63666 () Unit!3833)

(declare-fun lt!63664 () Unit!3833)

(assert (=> d!37241 (= lt!63666 lt!63664)))

(assert (=> d!37241 (= (getValueByKey!162 lt!63663 (_1!1273 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16)))) (Some!167 (_2!1273 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16)))))))

(assert (=> d!37241 (= lt!63664 (lemmaContainsTupThenGetReturnValue!81 lt!63663 (_1!1273 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16))) (_2!1273 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16)))))))

(assert (=> d!37241 (= lt!63663 (insertStrictlySorted!84 (toList!834 lt!63480) (_1!1273 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16))) (_2!1273 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16)))))))

(assert (=> d!37241 (= (+!155 lt!63480 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16))) lt!63665)))

(declare-fun b!123873 () Bool)

(declare-fun res!60075 () Bool)

(assert (=> b!123873 (=> (not res!60075) (not e!80937))))

(assert (=> b!123873 (= res!60075 (= (getValueByKey!162 (toList!834 lt!63665) (_1!1273 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16)))) (Some!167 (_2!1273 (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16))))))))

(declare-fun b!123874 () Bool)

(assert (=> b!123874 (= e!80937 (contains!860 (toList!834 lt!63665) (tuple2!2525 lt!63468 (zeroValue!2619 newMap!16))))))

(assert (= (and d!37241 res!60074) b!123873))

(assert (= (and b!123873 res!60075) b!123874))

(declare-fun m!143903 () Bool)

(assert (=> d!37241 m!143903))

(declare-fun m!143905 () Bool)

(assert (=> d!37241 m!143905))

(declare-fun m!143907 () Bool)

(assert (=> d!37241 m!143907))

(declare-fun m!143909 () Bool)

(assert (=> d!37241 m!143909))

(declare-fun m!143911 () Bool)

(assert (=> b!123873 m!143911))

(declare-fun m!143913 () Bool)

(assert (=> b!123874 m!143913))

(assert (=> b!123531 d!37241))

(declare-fun d!37243 () Bool)

(assert (=> d!37243 (= (get!1424 (getValueByKey!162 (toList!834 lt!63434) lt!63435)) (v!3089 (getValueByKey!162 (toList!834 lt!63434) lt!63435)))))

(assert (=> d!37079 d!37243))

(declare-fun b!123877 () Bool)

(declare-fun e!80939 () Option!168)

(assert (=> b!123877 (= e!80939 (getValueByKey!162 (t!5978 (toList!834 lt!63434)) lt!63435))))

(declare-fun b!123876 () Bool)

(declare-fun e!80938 () Option!168)

(assert (=> b!123876 (= e!80938 e!80939)))

(declare-fun c!22530 () Bool)

(assert (=> b!123876 (= c!22530 (and ((_ is Cons!1680) (toList!834 lt!63434)) (not (= (_1!1273 (h!2281 (toList!834 lt!63434))) lt!63435))))))

(declare-fun b!123875 () Bool)

(assert (=> b!123875 (= e!80938 (Some!167 (_2!1273 (h!2281 (toList!834 lt!63434)))))))

(declare-fun b!123878 () Bool)

(assert (=> b!123878 (= e!80939 None!166)))

(declare-fun d!37245 () Bool)

(declare-fun c!22529 () Bool)

(assert (=> d!37245 (= c!22529 (and ((_ is Cons!1680) (toList!834 lt!63434)) (= (_1!1273 (h!2281 (toList!834 lt!63434))) lt!63435)))))

(assert (=> d!37245 (= (getValueByKey!162 (toList!834 lt!63434) lt!63435) e!80938)))

(assert (= (and d!37245 c!22529) b!123875))

(assert (= (and d!37245 (not c!22529)) b!123876))

(assert (= (and b!123876 c!22530) b!123877))

(assert (= (and b!123876 (not c!22530)) b!123878))

(declare-fun m!143915 () Bool)

(assert (=> b!123877 m!143915))

(assert (=> d!37079 d!37245))

(declare-fun d!37247 () Bool)

(assert (=> d!37247 (= (get!1424 (getValueByKey!162 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3089 (getValueByKey!162 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37035 d!37247))

(declare-fun b!123881 () Bool)

(declare-fun e!80941 () Option!168)

(assert (=> b!123881 (= e!80941 (getValueByKey!162 (t!5978 (toList!834 lt!63433)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123880 () Bool)

(declare-fun e!80940 () Option!168)

(assert (=> b!123880 (= e!80940 e!80941)))

(declare-fun c!22532 () Bool)

(assert (=> b!123880 (= c!22532 (and ((_ is Cons!1680) (toList!834 lt!63433)) (not (= (_1!1273 (h!2281 (toList!834 lt!63433))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!123879 () Bool)

(assert (=> b!123879 (= e!80940 (Some!167 (_2!1273 (h!2281 (toList!834 lt!63433)))))))

(declare-fun b!123882 () Bool)

(assert (=> b!123882 (= e!80941 None!166)))

(declare-fun d!37249 () Bool)

(declare-fun c!22531 () Bool)

(assert (=> d!37249 (= c!22531 (and ((_ is Cons!1680) (toList!834 lt!63433)) (= (_1!1273 (h!2281 (toList!834 lt!63433))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37249 (= (getValueByKey!162 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000) e!80940)))

(assert (= (and d!37249 c!22531) b!123879))

(assert (= (and d!37249 (not c!22531)) b!123880))

(assert (= (and b!123880 c!22532) b!123881))

(assert (= (and b!123880 (not c!22532)) b!123882))

(declare-fun m!143917 () Bool)

(assert (=> b!123881 m!143917))

(assert (=> d!37035 d!37249))

(declare-fun lt!63667 () Bool)

(declare-fun d!37251 () Bool)

(assert (=> d!37251 (= lt!63667 (select (content!122 (toList!834 lt!63494)) (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun e!80942 () Bool)

(assert (=> d!37251 (= lt!63667 e!80942)))

(declare-fun res!60076 () Bool)

(assert (=> d!37251 (=> (not res!60076) (not e!80942))))

(assert (=> d!37251 (= res!60076 ((_ is Cons!1680) (toList!834 lt!63494)))))

(assert (=> d!37251 (= (contains!860 (toList!834 lt!63494) (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63667)))

(declare-fun b!123883 () Bool)

(declare-fun e!80943 () Bool)

(assert (=> b!123883 (= e!80942 e!80943)))

(declare-fun res!60077 () Bool)

(assert (=> b!123883 (=> res!60077 e!80943)))

(assert (=> b!123883 (= res!60077 (= (h!2281 (toList!834 lt!63494)) (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!123884 () Bool)

(assert (=> b!123884 (= e!80943 (contains!860 (t!5978 (toList!834 lt!63494)) (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(assert (= (and d!37251 res!60076) b!123883))

(assert (= (and b!123883 (not res!60077)) b!123884))

(declare-fun m!143919 () Bool)

(assert (=> d!37251 m!143919))

(declare-fun m!143921 () Bool)

(assert (=> d!37251 m!143921))

(declare-fun m!143923 () Bool)

(assert (=> b!123884 m!143923))

(assert (=> b!123557 d!37251))

(declare-fun d!37253 () Bool)

(assert (=> d!37253 (= (get!1424 (getValueByKey!162 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3089 (getValueByKey!162 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37041 d!37253))

(declare-fun e!80945 () Option!168)

(declare-fun b!123887 () Bool)

(assert (=> b!123887 (= e!80945 (getValueByKey!162 (t!5978 (toList!834 lt!63433)) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!123886 () Bool)

(declare-fun e!80944 () Option!168)

(assert (=> b!123886 (= e!80944 e!80945)))

(declare-fun c!22534 () Bool)

(assert (=> b!123886 (= c!22534 (and ((_ is Cons!1680) (toList!834 lt!63433)) (not (= (_1!1273 (h!2281 (toList!834 lt!63433))) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun b!123885 () Bool)

(assert (=> b!123885 (= e!80944 (Some!167 (_2!1273 (h!2281 (toList!834 lt!63433)))))))

(declare-fun b!123888 () Bool)

(assert (=> b!123888 (= e!80945 None!166)))

(declare-fun c!22533 () Bool)

(declare-fun d!37255 () Bool)

(assert (=> d!37255 (= c!22533 (and ((_ is Cons!1680) (toList!834 lt!63433)) (= (_1!1273 (h!2281 (toList!834 lt!63433))) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37255 (= (getValueByKey!162 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!80944)))

(assert (= (and d!37255 c!22533) b!123885))

(assert (= (and d!37255 (not c!22533)) b!123886))

(assert (= (and b!123886 c!22534) b!123887))

(assert (= (and b!123886 (not c!22534)) b!123888))

(assert (=> b!123887 m!143205))

(declare-fun m!143925 () Bool)

(assert (=> b!123887 m!143925))

(assert (=> d!37041 d!37255))

(declare-fun d!37257 () Bool)

(declare-fun e!80946 () Bool)

(assert (=> d!37257 e!80946))

(declare-fun res!60078 () Bool)

(assert (=> d!37257 (=> (not res!60078) (not e!80946))))

(declare-fun lt!63670 () ListLongMap!1637)

(assert (=> d!37257 (= res!60078 (contains!858 lt!63670 (_1!1273 (tuple2!2525 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!63668 () List!1684)

(assert (=> d!37257 (= lt!63670 (ListLongMap!1638 lt!63668))))

(declare-fun lt!63671 () Unit!3833)

(declare-fun lt!63669 () Unit!3833)

(assert (=> d!37257 (= lt!63671 lt!63669)))

(assert (=> d!37257 (= (getValueByKey!162 lt!63668 (_1!1273 (tuple2!2525 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!167 (_2!1273 (tuple2!2525 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37257 (= lt!63669 (lemmaContainsTupThenGetReturnValue!81 lt!63668 (_1!1273 (tuple2!2525 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37257 (= lt!63668 (insertStrictlySorted!84 (toList!834 call!13125) (_1!1273 (tuple2!2525 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1273 (tuple2!2525 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37257 (= (+!155 call!13125 (tuple2!2525 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!63670)))

(declare-fun b!123889 () Bool)

(declare-fun res!60079 () Bool)

(assert (=> b!123889 (=> (not res!60079) (not e!80946))))

(assert (=> b!123889 (= res!60079 (= (getValueByKey!162 (toList!834 lt!63670) (_1!1273 (tuple2!2525 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!167 (_2!1273 (tuple2!2525 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!123890 () Bool)

(assert (=> b!123890 (= e!80946 (contains!860 (toList!834 lt!63670) (tuple2!2525 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1423 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37257 res!60078) b!123889))

(assert (= (and b!123889 res!60079) b!123890))

(declare-fun m!143927 () Bool)

(assert (=> d!37257 m!143927))

(declare-fun m!143929 () Bool)

(assert (=> d!37257 m!143929))

(declare-fun m!143931 () Bool)

(assert (=> d!37257 m!143931))

(declare-fun m!143933 () Bool)

(assert (=> d!37257 m!143933))

(declare-fun m!143935 () Bool)

(assert (=> b!123889 m!143935))

(declare-fun m!143937 () Bool)

(assert (=> b!123890 m!143937))

(assert (=> b!123608 d!37257))

(assert (=> b!123608 d!37043))

(declare-fun d!37259 () Bool)

(declare-fun e!80947 () Bool)

(assert (=> d!37259 e!80947))

(declare-fun res!60080 () Bool)

(assert (=> d!37259 (=> (not res!60080) (not e!80947))))

(declare-fun lt!63674 () ListLongMap!1637)

(assert (=> d!37259 (= res!60080 (contains!858 lt!63674 (_1!1273 (tuple2!2525 lt!63534 lt!63536))))))

(declare-fun lt!63672 () List!1684)

(assert (=> d!37259 (= lt!63674 (ListLongMap!1638 lt!63672))))

(declare-fun lt!63675 () Unit!3833)

(declare-fun lt!63673 () Unit!3833)

(assert (=> d!37259 (= lt!63675 lt!63673)))

(assert (=> d!37259 (= (getValueByKey!162 lt!63672 (_1!1273 (tuple2!2525 lt!63534 lt!63536))) (Some!167 (_2!1273 (tuple2!2525 lt!63534 lt!63536))))))

(assert (=> d!37259 (= lt!63673 (lemmaContainsTupThenGetReturnValue!81 lt!63672 (_1!1273 (tuple2!2525 lt!63534 lt!63536)) (_2!1273 (tuple2!2525 lt!63534 lt!63536))))))

(assert (=> d!37259 (= lt!63672 (insertStrictlySorted!84 (toList!834 lt!63538) (_1!1273 (tuple2!2525 lt!63534 lt!63536)) (_2!1273 (tuple2!2525 lt!63534 lt!63536))))))

(assert (=> d!37259 (= (+!155 lt!63538 (tuple2!2525 lt!63534 lt!63536)) lt!63674)))

(declare-fun b!123891 () Bool)

(declare-fun res!60081 () Bool)

(assert (=> b!123891 (=> (not res!60081) (not e!80947))))

(assert (=> b!123891 (= res!60081 (= (getValueByKey!162 (toList!834 lt!63674) (_1!1273 (tuple2!2525 lt!63534 lt!63536))) (Some!167 (_2!1273 (tuple2!2525 lt!63534 lt!63536)))))))

(declare-fun b!123892 () Bool)

(assert (=> b!123892 (= e!80947 (contains!860 (toList!834 lt!63674) (tuple2!2525 lt!63534 lt!63536)))))

(assert (= (and d!37259 res!60080) b!123891))

(assert (= (and b!123891 res!60081) b!123892))

(declare-fun m!143939 () Bool)

(assert (=> d!37259 m!143939))

(declare-fun m!143941 () Bool)

(assert (=> d!37259 m!143941))

(declare-fun m!143943 () Bool)

(assert (=> d!37259 m!143943))

(declare-fun m!143945 () Bool)

(assert (=> d!37259 m!143945))

(declare-fun m!143947 () Bool)

(assert (=> b!123891 m!143947))

(declare-fun m!143949 () Bool)

(assert (=> b!123892 m!143949))

(assert (=> b!123608 d!37259))

(declare-fun d!37261 () Bool)

(declare-fun e!80948 () Bool)

(assert (=> d!37261 e!80948))

(declare-fun res!60082 () Bool)

(assert (=> d!37261 (=> res!60082 e!80948)))

(declare-fun lt!63677 () Bool)

(assert (=> d!37261 (= res!60082 (not lt!63677))))

(declare-fun lt!63679 () Bool)

(assert (=> d!37261 (= lt!63677 lt!63679)))

(declare-fun lt!63678 () Unit!3833)

(declare-fun e!80949 () Unit!3833)

(assert (=> d!37261 (= lt!63678 e!80949)))

(declare-fun c!22535 () Bool)

(assert (=> d!37261 (= c!22535 lt!63679)))

(assert (=> d!37261 (= lt!63679 (containsKey!166 (toList!834 (+!155 lt!63538 (tuple2!2525 lt!63534 lt!63536))) lt!63537))))

(assert (=> d!37261 (= (contains!858 (+!155 lt!63538 (tuple2!2525 lt!63534 lt!63536)) lt!63537) lt!63677)))

(declare-fun b!123893 () Bool)

(declare-fun lt!63676 () Unit!3833)

(assert (=> b!123893 (= e!80949 lt!63676)))

(assert (=> b!123893 (= lt!63676 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 (+!155 lt!63538 (tuple2!2525 lt!63534 lt!63536))) lt!63537))))

(assert (=> b!123893 (isDefined!116 (getValueByKey!162 (toList!834 (+!155 lt!63538 (tuple2!2525 lt!63534 lt!63536))) lt!63537))))

(declare-fun b!123894 () Bool)

(declare-fun Unit!3852 () Unit!3833)

(assert (=> b!123894 (= e!80949 Unit!3852)))

(declare-fun b!123895 () Bool)

(assert (=> b!123895 (= e!80948 (isDefined!116 (getValueByKey!162 (toList!834 (+!155 lt!63538 (tuple2!2525 lt!63534 lt!63536))) lt!63537)))))

(assert (= (and d!37261 c!22535) b!123893))

(assert (= (and d!37261 (not c!22535)) b!123894))

(assert (= (and d!37261 (not res!60082)) b!123895))

(declare-fun m!143951 () Bool)

(assert (=> d!37261 m!143951))

(declare-fun m!143953 () Bool)

(assert (=> b!123893 m!143953))

(declare-fun m!143955 () Bool)

(assert (=> b!123893 m!143955))

(assert (=> b!123893 m!143955))

(declare-fun m!143957 () Bool)

(assert (=> b!123893 m!143957))

(assert (=> b!123895 m!143955))

(assert (=> b!123895 m!143955))

(assert (=> b!123895 m!143957))

(assert (=> b!123608 d!37261))

(declare-fun d!37263 () Bool)

(assert (=> d!37263 (not (contains!858 (+!155 lt!63538 (tuple2!2525 lt!63534 lt!63536)) lt!63537))))

(declare-fun lt!63682 () Unit!3833)

(declare-fun choose!753 (ListLongMap!1637 (_ BitVec 64) V!3409 (_ BitVec 64)) Unit!3833)

(assert (=> d!37263 (= lt!63682 (choose!753 lt!63538 lt!63534 lt!63536 lt!63537))))

(declare-fun e!80952 () Bool)

(assert (=> d!37263 e!80952))

(declare-fun res!60085 () Bool)

(assert (=> d!37263 (=> (not res!60085) (not e!80952))))

(assert (=> d!37263 (= res!60085 (not (contains!858 lt!63538 lt!63537)))))

(assert (=> d!37263 (= (addStillNotContains!55 lt!63538 lt!63534 lt!63536 lt!63537) lt!63682)))

(declare-fun b!123899 () Bool)

(assert (=> b!123899 (= e!80952 (not (= lt!63534 lt!63537)))))

(assert (= (and d!37263 res!60085) b!123899))

(assert (=> d!37263 m!143467))

(assert (=> d!37263 m!143467))

(assert (=> d!37263 m!143469))

(declare-fun m!143959 () Bool)

(assert (=> d!37263 m!143959))

(declare-fun m!143961 () Bool)

(assert (=> d!37263 m!143961))

(assert (=> b!123608 d!37263))

(declare-fun d!37265 () Bool)

(declare-fun e!80953 () Bool)

(assert (=> d!37265 e!80953))

(declare-fun res!60086 () Bool)

(assert (=> d!37265 (=> res!60086 e!80953)))

(declare-fun lt!63684 () Bool)

(assert (=> d!37265 (= res!60086 (not lt!63684))))

(declare-fun lt!63686 () Bool)

(assert (=> d!37265 (= lt!63684 lt!63686)))

(declare-fun lt!63685 () Unit!3833)

(declare-fun e!80954 () Unit!3833)

(assert (=> d!37265 (= lt!63685 e!80954)))

(declare-fun c!22536 () Bool)

(assert (=> d!37265 (= c!22536 lt!63686)))

(assert (=> d!37265 (= lt!63686 (containsKey!166 (toList!834 lt!63518) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37265 (= (contains!858 lt!63518 (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63684)))

(declare-fun b!123900 () Bool)

(declare-fun lt!63683 () Unit!3833)

(assert (=> b!123900 (= e!80954 lt!63683)))

(assert (=> b!123900 (= lt!63683 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63518) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> b!123900 (isDefined!116 (getValueByKey!162 (toList!834 lt!63518) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123901 () Bool)

(declare-fun Unit!3853 () Unit!3833)

(assert (=> b!123901 (= e!80954 Unit!3853)))

(declare-fun b!123902 () Bool)

(assert (=> b!123902 (= e!80953 (isDefined!116 (getValueByKey!162 (toList!834 lt!63518) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (= (and d!37265 c!22536) b!123900))

(assert (= (and d!37265 (not c!22536)) b!123901))

(assert (= (and d!37265 (not res!60086)) b!123902))

(declare-fun m!143963 () Bool)

(assert (=> d!37265 m!143963))

(declare-fun m!143965 () Bool)

(assert (=> b!123900 m!143965))

(assert (=> b!123900 m!143453))

(assert (=> b!123900 m!143453))

(declare-fun m!143967 () Bool)

(assert (=> b!123900 m!143967))

(assert (=> b!123902 m!143453))

(assert (=> b!123902 m!143453))

(assert (=> b!123902 m!143967))

(assert (=> d!37077 d!37265))

(declare-fun e!80956 () Option!168)

(declare-fun b!123905 () Bool)

(assert (=> b!123905 (= e!80956 (getValueByKey!162 (t!5978 lt!63516) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123904 () Bool)

(declare-fun e!80955 () Option!168)

(assert (=> b!123904 (= e!80955 e!80956)))

(declare-fun c!22538 () Bool)

(assert (=> b!123904 (= c!22538 (and ((_ is Cons!1680) lt!63516) (not (= (_1!1273 (h!2281 lt!63516)) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun b!123903 () Bool)

(assert (=> b!123903 (= e!80955 (Some!167 (_2!1273 (h!2281 lt!63516))))))

(declare-fun b!123906 () Bool)

(assert (=> b!123906 (= e!80956 None!166)))

(declare-fun c!22537 () Bool)

(declare-fun d!37267 () Bool)

(assert (=> d!37267 (= c!22537 (and ((_ is Cons!1680) lt!63516) (= (_1!1273 (h!2281 lt!63516)) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37267 (= (getValueByKey!162 lt!63516 (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) e!80955)))

(assert (= (and d!37267 c!22537) b!123903))

(assert (= (and d!37267 (not c!22537)) b!123904))

(assert (= (and b!123904 c!22538) b!123905))

(assert (= (and b!123904 (not c!22538)) b!123906))

(declare-fun m!143969 () Bool)

(assert (=> b!123905 m!143969))

(assert (=> d!37077 d!37267))

(declare-fun d!37269 () Bool)

(assert (=> d!37269 (= (getValueByKey!162 lt!63516 (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun lt!63687 () Unit!3833)

(assert (=> d!37269 (= lt!63687 (choose!751 lt!63516 (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun e!80957 () Bool)

(assert (=> d!37269 e!80957))

(declare-fun res!60087 () Bool)

(assert (=> d!37269 (=> (not res!60087) (not e!80957))))

(assert (=> d!37269 (= res!60087 (isStrictlySorted!310 lt!63516))))

(assert (=> d!37269 (= (lemmaContainsTupThenGetReturnValue!81 lt!63516 (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63687)))

(declare-fun b!123907 () Bool)

(declare-fun res!60088 () Bool)

(assert (=> b!123907 (=> (not res!60088) (not e!80957))))

(assert (=> b!123907 (= res!60088 (containsKey!166 lt!63516 (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123908 () Bool)

(assert (=> b!123908 (= e!80957 (contains!860 lt!63516 (tuple2!2525 (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (= (and d!37269 res!60087) b!123907))

(assert (= (and b!123907 res!60088) b!123908))

(assert (=> d!37269 m!143447))

(declare-fun m!143971 () Bool)

(assert (=> d!37269 m!143971))

(declare-fun m!143973 () Bool)

(assert (=> d!37269 m!143973))

(declare-fun m!143975 () Bool)

(assert (=> b!123907 m!143975))

(declare-fun m!143977 () Bool)

(assert (=> b!123908 m!143977))

(assert (=> d!37077 d!37269))

(declare-fun b!123909 () Bool)

(declare-fun e!80962 () List!1684)

(declare-fun call!13150 () List!1684)

(assert (=> b!123909 (= e!80962 call!13150)))

(declare-fun b!123910 () Bool)

(declare-fun e!80961 () List!1684)

(assert (=> b!123910 (= e!80961 e!80962)))

(declare-fun c!22540 () Bool)

(assert (=> b!123910 (= c!22540 (and ((_ is Cons!1680) (toList!834 lt!63434)) (= (_1!1273 (h!2281 (toList!834 lt!63434))) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun bm!13145 () Bool)

(declare-fun call!13148 () List!1684)

(assert (=> bm!13145 (= call!13148 call!13150)))

(declare-fun b!123912 () Bool)

(declare-fun e!80959 () List!1684)

(declare-fun c!22541 () Bool)

(assert (=> b!123912 (= e!80959 (ite c!22540 (t!5978 (toList!834 lt!63434)) (ite c!22541 (Cons!1680 (h!2281 (toList!834 lt!63434)) (t!5978 (toList!834 lt!63434))) Nil!1681)))))

(declare-fun b!123913 () Bool)

(declare-fun res!60090 () Bool)

(declare-fun e!80958 () Bool)

(assert (=> b!123913 (=> (not res!60090) (not e!80958))))

(declare-fun lt!63688 () List!1684)

(assert (=> b!123913 (= res!60090 (containsKey!166 lt!63688 (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun bm!13146 () Bool)

(declare-fun call!13149 () List!1684)

(assert (=> bm!13146 (= call!13150 call!13149)))

(declare-fun bm!13147 () Bool)

(declare-fun c!22542 () Bool)

(assert (=> bm!13147 (= call!13149 ($colon$colon!86 e!80959 (ite c!22542 (h!2281 (toList!834 lt!63434)) (tuple2!2525 (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun c!22539 () Bool)

(assert (=> bm!13147 (= c!22539 c!22542)))

(declare-fun b!123914 () Bool)

(declare-fun e!80960 () List!1684)

(assert (=> b!123914 (= e!80960 call!13148)))

(declare-fun b!123915 () Bool)

(assert (=> b!123915 (= e!80959 (insertStrictlySorted!84 (t!5978 (toList!834 lt!63434)) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123916 () Bool)

(assert (=> b!123916 (= e!80960 call!13148)))

(declare-fun d!37271 () Bool)

(assert (=> d!37271 e!80958))

(declare-fun res!60089 () Bool)

(assert (=> d!37271 (=> (not res!60089) (not e!80958))))

(assert (=> d!37271 (= res!60089 (isStrictlySorted!310 lt!63688))))

(assert (=> d!37271 (= lt!63688 e!80961)))

(assert (=> d!37271 (= c!22542 (and ((_ is Cons!1680) (toList!834 lt!63434)) (bvslt (_1!1273 (h!2281 (toList!834 lt!63434))) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37271 (isStrictlySorted!310 (toList!834 lt!63434))))

(assert (=> d!37271 (= (insertStrictlySorted!84 (toList!834 lt!63434) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63688)))

(declare-fun b!123911 () Bool)

(assert (=> b!123911 (= e!80958 (contains!860 lt!63688 (tuple2!2525 (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!123917 () Bool)

(assert (=> b!123917 (= c!22541 (and ((_ is Cons!1680) (toList!834 lt!63434)) (bvsgt (_1!1273 (h!2281 (toList!834 lt!63434))) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> b!123917 (= e!80962 e!80960)))

(declare-fun b!123918 () Bool)

(assert (=> b!123918 (= e!80961 call!13149)))

(assert (= (and d!37271 c!22542) b!123918))

(assert (= (and d!37271 (not c!22542)) b!123910))

(assert (= (and b!123910 c!22540) b!123909))

(assert (= (and b!123910 (not c!22540)) b!123917))

(assert (= (and b!123917 c!22541) b!123914))

(assert (= (and b!123917 (not c!22541)) b!123916))

(assert (= (or b!123914 b!123916) bm!13145))

(assert (= (or b!123909 bm!13145) bm!13146))

(assert (= (or b!123918 bm!13146) bm!13147))

(assert (= (and bm!13147 c!22539) b!123915))

(assert (= (and bm!13147 (not c!22539)) b!123912))

(assert (= (and d!37271 res!60089) b!123913))

(assert (= (and b!123913 res!60090) b!123911))

(declare-fun m!143979 () Bool)

(assert (=> bm!13147 m!143979))

(declare-fun m!143981 () Bool)

(assert (=> b!123913 m!143981))

(declare-fun m!143983 () Bool)

(assert (=> b!123915 m!143983))

(declare-fun m!143985 () Bool)

(assert (=> b!123911 m!143985))

(declare-fun m!143987 () Bool)

(assert (=> d!37271 m!143987))

(declare-fun m!143989 () Bool)

(assert (=> d!37271 m!143989))

(assert (=> d!37077 d!37271))

(declare-fun b!123919 () Bool)

(declare-fun e!80965 () Bool)

(declare-fun call!13151 () Bool)

(assert (=> b!123919 (= e!80965 call!13151)))

(declare-fun b!123920 () Bool)

(declare-fun e!80963 () Bool)

(declare-fun e!80966 () Bool)

(assert (=> b!123920 (= e!80963 e!80966)))

(declare-fun res!60091 () Bool)

(assert (=> b!123920 (=> (not res!60091) (not e!80966))))

(declare-fun e!80964 () Bool)

(assert (=> b!123920 (= res!60091 (not e!80964))))

(declare-fun res!60092 () Bool)

(assert (=> b!123920 (=> (not res!60092) (not e!80964))))

(assert (=> b!123920 (= res!60092 (validKeyInArray!0 (select (arr!2194 (_keys!4480 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!123921 () Bool)

(assert (=> b!123921 (= e!80966 e!80965)))

(declare-fun c!22543 () Bool)

(assert (=> b!123921 (= c!22543 (validKeyInArray!0 (select (arr!2194 (_keys!4480 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!37273 () Bool)

(declare-fun res!60093 () Bool)

(assert (=> d!37273 (=> res!60093 e!80963)))

(assert (=> d!37273 (= res!60093 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2457 (_keys!4480 newMap!16))))))

(assert (=> d!37273 (= (arrayNoDuplicates!0 (_keys!4480 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22427 (Cons!1681 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) Nil!1682) Nil!1682)) e!80963)))

(declare-fun b!123922 () Bool)

(assert (=> b!123922 (= e!80965 call!13151)))

(declare-fun bm!13148 () Bool)

(assert (=> bm!13148 (= call!13151 (arrayNoDuplicates!0 (_keys!4480 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!22543 (Cons!1681 (select (arr!2194 (_keys!4480 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!22427 (Cons!1681 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) Nil!1682) Nil!1682)) (ite c!22427 (Cons!1681 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) Nil!1682) Nil!1682))))))

(declare-fun b!123923 () Bool)

(assert (=> b!123923 (= e!80964 (contains!859 (ite c!22427 (Cons!1681 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) Nil!1682) Nil!1682) (select (arr!2194 (_keys!4480 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!37273 (not res!60093)) b!123920))

(assert (= (and b!123920 res!60092) b!123923))

(assert (= (and b!123920 res!60091) b!123921))

(assert (= (and b!123921 c!22543) b!123919))

(assert (= (and b!123921 (not c!22543)) b!123922))

(assert (= (or b!123919 b!123922) bm!13148))

(assert (=> b!123920 m!143655))

(assert (=> b!123920 m!143655))

(assert (=> b!123920 m!143657))

(assert (=> b!123921 m!143655))

(assert (=> b!123921 m!143655))

(assert (=> b!123921 m!143657))

(assert (=> bm!13148 m!143655))

(declare-fun m!143991 () Bool)

(assert (=> bm!13148 m!143991))

(assert (=> b!123923 m!143655))

(assert (=> b!123923 m!143655))

(declare-fun m!143993 () Bool)

(assert (=> b!123923 m!143993))

(assert (=> bm!13109 d!37273))

(declare-fun d!37275 () Bool)

(declare-fun e!80967 () Bool)

(assert (=> d!37275 e!80967))

(declare-fun res!60094 () Bool)

(assert (=> d!37275 (=> res!60094 e!80967)))

(declare-fun lt!63690 () Bool)

(assert (=> d!37275 (= res!60094 (not lt!63690))))

(declare-fun lt!63692 () Bool)

(assert (=> d!37275 (= lt!63690 lt!63692)))

(declare-fun lt!63691 () Unit!3833)

(declare-fun e!80968 () Unit!3833)

(assert (=> d!37275 (= lt!63691 e!80968)))

(declare-fun c!22544 () Bool)

(assert (=> d!37275 (= c!22544 lt!63692)))

(assert (=> d!37275 (= lt!63692 (containsKey!166 (toList!834 lt!63479) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37275 (= (contains!858 lt!63479 #b1000000000000000000000000000000000000000000000000000000000000000) lt!63690)))

(declare-fun b!123924 () Bool)

(declare-fun lt!63689 () Unit!3833)

(assert (=> b!123924 (= e!80968 lt!63689)))

(assert (=> b!123924 (= lt!63689 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63479) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123924 (isDefined!116 (getValueByKey!162 (toList!834 lt!63479) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123925 () Bool)

(declare-fun Unit!3854 () Unit!3833)

(assert (=> b!123925 (= e!80968 Unit!3854)))

(declare-fun b!123926 () Bool)

(assert (=> b!123926 (= e!80967 (isDefined!116 (getValueByKey!162 (toList!834 lt!63479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37275 c!22544) b!123924))

(assert (= (and d!37275 (not c!22544)) b!123925))

(assert (= (and d!37275 (not res!60094)) b!123926))

(declare-fun m!143995 () Bool)

(assert (=> d!37275 m!143995))

(declare-fun m!143997 () Bool)

(assert (=> b!123924 m!143997))

(assert (=> b!123924 m!143727))

(assert (=> b!123924 m!143727))

(declare-fun m!143999 () Bool)

(assert (=> b!123924 m!143999))

(assert (=> b!123926 m!143727))

(assert (=> b!123926 m!143727))

(assert (=> b!123926 m!143999))

(assert (=> bm!13118 d!37275))

(declare-fun d!37277 () Bool)

(assert (=> d!37277 (isDefined!116 (getValueByKey!162 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!63693 () Unit!3833)

(assert (=> d!37277 (= lt!63693 (choose!752 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!80969 () Bool)

(assert (=> d!37277 e!80969))

(declare-fun res!60095 () Bool)

(assert (=> d!37277 (=> (not res!60095) (not e!80969))))

(assert (=> d!37277 (= res!60095 (isStrictlySorted!310 (toList!834 lt!63433)))))

(assert (=> d!37277 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000) lt!63693)))

(declare-fun b!123927 () Bool)

(assert (=> b!123927 (= e!80969 (containsKey!166 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37277 res!60095) b!123927))

(assert (=> d!37277 m!143499))

(assert (=> d!37277 m!143499))

(assert (=> d!37277 m!143525))

(declare-fun m!144001 () Bool)

(assert (=> d!37277 m!144001))

(declare-fun m!144003 () Bool)

(assert (=> d!37277 m!144003))

(assert (=> b!123927 m!143521))

(assert (=> b!123629 d!37277))

(declare-fun d!37279 () Bool)

(assert (=> d!37279 (= (isDefined!116 (getValueByKey!162 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!395 (getValueByKey!162 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5129 () Bool)

(assert (= bs!5129 d!37279))

(assert (=> bs!5129 m!143499))

(declare-fun m!144005 () Bool)

(assert (=> bs!5129 m!144005))

(assert (=> b!123629 d!37279))

(assert (=> b!123629 d!37177))

(declare-fun d!37281 () Bool)

(declare-fun lt!63694 () Bool)

(assert (=> d!37281 (= lt!63694 (select (content!122 (toList!834 lt!63543)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun e!80970 () Bool)

(assert (=> d!37281 (= lt!63694 e!80970)))

(declare-fun res!60096 () Bool)

(assert (=> d!37281 (=> (not res!60096) (not e!80970))))

(assert (=> d!37281 (= res!60096 ((_ is Cons!1680) (toList!834 lt!63543)))))

(assert (=> d!37281 (= (contains!860 (toList!834 lt!63543) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63694)))

(declare-fun b!123928 () Bool)

(declare-fun e!80971 () Bool)

(assert (=> b!123928 (= e!80970 e!80971)))

(declare-fun res!60097 () Bool)

(assert (=> b!123928 (=> res!60097 e!80971)))

(assert (=> b!123928 (= res!60097 (= (h!2281 (toList!834 lt!63543)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!123929 () Bool)

(assert (=> b!123929 (= e!80971 (contains!860 (t!5978 (toList!834 lt!63543)) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(assert (= (and d!37281 res!60096) b!123928))

(assert (= (and b!123928 (not res!60097)) b!123929))

(declare-fun m!144007 () Bool)

(assert (=> d!37281 m!144007))

(declare-fun m!144009 () Bool)

(assert (=> d!37281 m!144009))

(declare-fun m!144011 () Bool)

(assert (=> b!123929 m!144011))

(assert (=> b!123625 d!37281))

(declare-fun b!123932 () Bool)

(declare-fun e!80973 () Option!168)

(assert (=> b!123932 (= e!80973 (getValueByKey!162 (t!5978 (toList!834 lt!63518)) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123931 () Bool)

(declare-fun e!80972 () Option!168)

(assert (=> b!123931 (= e!80972 e!80973)))

(declare-fun c!22546 () Bool)

(assert (=> b!123931 (= c!22546 (and ((_ is Cons!1680) (toList!834 lt!63518)) (not (= (_1!1273 (h!2281 (toList!834 lt!63518))) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun b!123930 () Bool)

(assert (=> b!123930 (= e!80972 (Some!167 (_2!1273 (h!2281 (toList!834 lt!63518)))))))

(declare-fun b!123933 () Bool)

(assert (=> b!123933 (= e!80973 None!166)))

(declare-fun d!37283 () Bool)

(declare-fun c!22545 () Bool)

(assert (=> d!37283 (= c!22545 (and ((_ is Cons!1680) (toList!834 lt!63518)) (= (_1!1273 (h!2281 (toList!834 lt!63518))) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37283 (= (getValueByKey!162 (toList!834 lt!63518) (_1!1273 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) e!80972)))

(assert (= (and d!37283 c!22545) b!123930))

(assert (= (and d!37283 (not c!22545)) b!123931))

(assert (= (and b!123931 c!22546) b!123932))

(assert (= (and b!123931 (not c!22546)) b!123933))

(declare-fun m!144013 () Bool)

(assert (=> b!123932 m!144013))

(assert (=> b!123571 d!37283))

(declare-fun d!37285 () Bool)

(assert (=> d!37285 (= (isDefined!116 (getValueByKey!162 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!395 (getValueByKey!162 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5130 () Bool)

(assert (= bs!5130 d!37285))

(assert (=> bs!5130 m!143279))

(declare-fun m!144015 () Bool)

(assert (=> bs!5130 m!144015))

(assert (=> b!123634 d!37285))

(assert (=> b!123634 d!37255))

(assert (=> b!123631 d!37279))

(assert (=> b!123631 d!37177))

(declare-fun d!37287 () Bool)

(declare-fun e!80974 () Bool)

(assert (=> d!37287 e!80974))

(declare-fun res!60098 () Bool)

(assert (=> d!37287 (=> (not res!60098) (not e!80974))))

(declare-fun lt!63697 () ListLongMap!1637)

(assert (=> d!37287 (= res!60098 (contains!858 lt!63697 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))

(declare-fun lt!63695 () List!1684)

(assert (=> d!37287 (= lt!63697 (ListLongMap!1638 lt!63695))))

(declare-fun lt!63698 () Unit!3833)

(declare-fun lt!63696 () Unit!3833)

(assert (=> d!37287 (= lt!63698 lt!63696)))

(assert (=> d!37287 (= (getValueByKey!162 lt!63695 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))) (Some!167 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))

(assert (=> d!37287 (= lt!63696 (lemmaContainsTupThenGetReturnValue!81 lt!63695 (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))

(assert (=> d!37287 (= lt!63695 (insertStrictlySorted!84 (toList!834 call!13119) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))) (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))))))

(assert (=> d!37287 (= (+!155 call!13119 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))) lt!63697)))

(declare-fun b!123934 () Bool)

(declare-fun res!60099 () Bool)

(assert (=> b!123934 (=> (not res!60099) (not e!80974))))

(assert (=> b!123934 (= res!60099 (= (getValueByKey!162 (toList!834 lt!63697) (_1!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16)))) (Some!167 (_2!1273 (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))))

(declare-fun b!123935 () Bool)

(assert (=> b!123935 (= e!80974 (contains!860 (toList!834 lt!63697) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 newMap!16))))))

(assert (= (and d!37287 res!60098) b!123934))

(assert (= (and b!123934 res!60099) b!123935))

(declare-fun m!144017 () Bool)

(assert (=> d!37287 m!144017))

(declare-fun m!144019 () Bool)

(assert (=> d!37287 m!144019))

(declare-fun m!144021 () Bool)

(assert (=> d!37287 m!144021))

(declare-fun m!144023 () Bool)

(assert (=> d!37287 m!144023))

(declare-fun m!144025 () Bool)

(assert (=> b!123934 m!144025))

(declare-fun m!144027 () Bool)

(assert (=> b!123935 m!144027))

(assert (=> b!123537 d!37287))

(assert (=> d!37087 d!37155))

(declare-fun d!37289 () Bool)

(assert (=> d!37289 (= (get!1426 (select (arr!2195 (_values!2737 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!404 (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123482 d!37289))

(declare-fun d!37291 () Bool)

(assert (=> d!37291 (isDefined!116 (getValueByKey!162 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!63699 () Unit!3833)

(assert (=> d!37291 (= lt!63699 (choose!752 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!80975 () Bool)

(assert (=> d!37291 e!80975))

(declare-fun res!60100 () Bool)

(assert (=> d!37291 (=> (not res!60100) (not e!80975))))

(assert (=> d!37291 (= res!60100 (isStrictlySorted!310 (toList!834 lt!63433)))))

(assert (=> d!37291 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!63699)))

(declare-fun b!123936 () Bool)

(assert (=> b!123936 (= e!80975 (containsKey!166 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!37291 res!60100) b!123936))

(assert (=> d!37291 m!143205))

(assert (=> d!37291 m!143279))

(assert (=> d!37291 m!143279))

(assert (=> d!37291 m!143531))

(assert (=> d!37291 m!143205))

(declare-fun m!144029 () Bool)

(assert (=> d!37291 m!144029))

(assert (=> d!37291 m!144003))

(assert (=> b!123936 m!143205))

(assert (=> b!123936 m!143527))

(assert (=> b!123632 d!37291))

(assert (=> b!123632 d!37285))

(assert (=> b!123632 d!37255))

(declare-fun lt!63700 () Bool)

(declare-fun d!37293 () Bool)

(assert (=> d!37293 (= lt!63700 (select (content!122 (toList!834 lt!63489)) (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun e!80976 () Bool)

(assert (=> d!37293 (= lt!63700 e!80976)))

(declare-fun res!60101 () Bool)

(assert (=> d!37293 (=> (not res!60101) (not e!80976))))

(assert (=> d!37293 (= res!60101 ((_ is Cons!1680) (toList!834 lt!63489)))))

(assert (=> d!37293 (= (contains!860 (toList!834 lt!63489) (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63700)))

(declare-fun b!123937 () Bool)

(declare-fun e!80977 () Bool)

(assert (=> b!123937 (= e!80976 e!80977)))

(declare-fun res!60102 () Bool)

(assert (=> b!123937 (=> res!60102 e!80977)))

(assert (=> b!123937 (= res!60102 (= (h!2281 (toList!834 lt!63489)) (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!123938 () Bool)

(assert (=> b!123938 (= e!80977 (contains!860 (t!5978 (toList!834 lt!63489)) (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(assert (= (and d!37293 res!60101) b!123937))

(assert (= (and b!123937 (not res!60102)) b!123938))

(declare-fun m!144031 () Bool)

(assert (=> d!37293 m!144031))

(declare-fun m!144033 () Bool)

(assert (=> d!37293 m!144033))

(declare-fun m!144035 () Bool)

(assert (=> b!123938 m!144035))

(assert (=> b!123554 d!37293))

(assert (=> b!123535 d!37107))

(assert (=> b!123619 d!37185))

(declare-fun d!37295 () Bool)

(assert (=> d!37295 (= (get!1424 (getValueByKey!162 (toList!834 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63435)) (v!3089 (getValueByKey!162 (toList!834 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63435)))))

(assert (=> d!37075 d!37295))

(declare-fun e!80979 () Option!168)

(declare-fun b!123941 () Bool)

(assert (=> b!123941 (= e!80979 (getValueByKey!162 (t!5978 (toList!834 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))) lt!63435))))

(declare-fun b!123940 () Bool)

(declare-fun e!80978 () Option!168)

(assert (=> b!123940 (= e!80978 e!80979)))

(declare-fun c!22548 () Bool)

(assert (=> b!123940 (= c!22548 (and ((_ is Cons!1680) (toList!834 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))) (not (= (_1!1273 (h!2281 (toList!834 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))) lt!63435))))))

(declare-fun b!123939 () Bool)

(assert (=> b!123939 (= e!80978 (Some!167 (_2!1273 (h!2281 (toList!834 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))))))

(declare-fun b!123942 () Bool)

(assert (=> b!123942 (= e!80979 None!166)))

(declare-fun d!37297 () Bool)

(declare-fun c!22547 () Bool)

(assert (=> d!37297 (= c!22547 (and ((_ is Cons!1680) (toList!834 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))) (= (_1!1273 (h!2281 (toList!834 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))) lt!63435)))))

(assert (=> d!37297 (= (getValueByKey!162 (toList!834 (+!155 lt!63434 (tuple2!2525 lt!63422 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63435) e!80978)))

(assert (= (and d!37297 c!22547) b!123939))

(assert (= (and d!37297 (not c!22547)) b!123940))

(assert (= (and b!123940 c!22548) b!123941))

(assert (= (and b!123940 (not c!22548)) b!123942))

(declare-fun m!144037 () Bool)

(assert (=> b!123941 m!144037))

(assert (=> d!37075 d!37297))

(declare-fun d!37299 () Bool)

(assert (=> d!37299 (= (apply!108 lt!63479 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)) (get!1424 (getValueByKey!162 (toList!834 lt!63479) (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5131 () Bool)

(assert (= bs!5131 d!37299))

(assert (=> bs!5131 m!143287))

(assert (=> bs!5131 m!143551))

(assert (=> bs!5131 m!143551))

(declare-fun m!144039 () Bool)

(assert (=> bs!5131 m!144039))

(assert (=> b!123542 d!37299))

(declare-fun d!37301 () Bool)

(declare-fun c!22549 () Bool)

(assert (=> d!37301 (= c!22549 ((_ is ValueCellFull!1067) (select (arr!2195 (_values!2737 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!80980 () V!3409)

(assert (=> d!37301 (= (get!1423 (select (arr!2195 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!404 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!80980)))

(declare-fun b!123943 () Bool)

(assert (=> b!123943 (= e!80980 (get!1425 (select (arr!2195 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!404 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!123944 () Bool)

(assert (=> b!123944 (= e!80980 (get!1426 (select (arr!2195 (_values!2737 newMap!16)) #b00000000000000000000000000000000) (dynLambda!404 (defaultEntry!2754 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37301 c!22549) b!123943))

(assert (= (and d!37301 (not c!22549)) b!123944))

(assert (=> b!123943 m!143319))

(assert (=> b!123943 m!143321))

(declare-fun m!144041 () Bool)

(assert (=> b!123943 m!144041))

(assert (=> b!123944 m!143319))

(assert (=> b!123944 m!143321))

(declare-fun m!144043 () Bool)

(assert (=> b!123944 m!144043))

(assert (=> b!123542 d!37301))

(declare-fun d!37303 () Bool)

(assert (=> d!37303 (= (apply!108 lt!63539 (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1424 (getValueByKey!162 (toList!834 lt!63539) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5132 () Bool)

(assert (= bs!5132 d!37303))

(assert (=> bs!5132 m!143205))

(assert (=> bs!5132 m!143633))

(assert (=> bs!5132 m!143633))

(declare-fun m!144045 () Bool)

(assert (=> bs!5132 m!144045))

(assert (=> b!123601 d!37303))

(assert (=> b!123601 d!37043))

(declare-fun d!37305 () Bool)

(declare-fun e!80981 () Bool)

(assert (=> d!37305 e!80981))

(declare-fun res!60103 () Bool)

(assert (=> d!37305 (=> res!60103 e!80981)))

(declare-fun lt!63702 () Bool)

(assert (=> d!37305 (= res!60103 (not lt!63702))))

(declare-fun lt!63704 () Bool)

(assert (=> d!37305 (= lt!63702 lt!63704)))

(declare-fun lt!63703 () Unit!3833)

(declare-fun e!80982 () Unit!3833)

(assert (=> d!37305 (= lt!63703 e!80982)))

(declare-fun c!22550 () Bool)

(assert (=> d!37305 (= c!22550 lt!63704)))

(assert (=> d!37305 (= lt!63704 (containsKey!166 (toList!834 lt!63479) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37305 (= (contains!858 lt!63479 #b0000000000000000000000000000000000000000000000000000000000000000) lt!63702)))

(declare-fun b!123945 () Bool)

(declare-fun lt!63701 () Unit!3833)

(assert (=> b!123945 (= e!80982 lt!63701)))

(assert (=> b!123945 (= lt!63701 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63479) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!123945 (isDefined!116 (getValueByKey!162 (toList!834 lt!63479) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!123946 () Bool)

(declare-fun Unit!3855 () Unit!3833)

(assert (=> b!123946 (= e!80982 Unit!3855)))

(declare-fun b!123947 () Bool)

(assert (=> b!123947 (= e!80981 (isDefined!116 (getValueByKey!162 (toList!834 lt!63479) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37305 c!22550) b!123945))

(assert (= (and d!37305 (not c!22550)) b!123946))

(assert (= (and d!37305 (not res!60103)) b!123947))

(declare-fun m!144047 () Bool)

(assert (=> d!37305 m!144047))

(declare-fun m!144049 () Bool)

(assert (=> b!123945 m!144049))

(assert (=> b!123945 m!143739))

(assert (=> b!123945 m!143739))

(declare-fun m!144051 () Bool)

(assert (=> b!123945 m!144051))

(assert (=> b!123947 m!143739))

(assert (=> b!123947 m!143739))

(assert (=> b!123947 m!144051))

(assert (=> bm!13114 d!37305))

(declare-fun d!37307 () Bool)

(assert (=> d!37307 (isDefined!116 (getValueByKey!162 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!63705 () Unit!3833)

(assert (=> d!37307 (= lt!63705 (choose!752 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!80983 () Bool)

(assert (=> d!37307 e!80983))

(declare-fun res!60104 () Bool)

(assert (=> d!37307 (=> (not res!60104) (not e!80983))))

(assert (=> d!37307 (= res!60104 (isStrictlySorted!310 (toList!834 lt!63433)))))

(assert (=> d!37307 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000) lt!63705)))

(declare-fun b!123948 () Bool)

(assert (=> b!123948 (= e!80983 (containsKey!166 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37307 res!60104) b!123948))

(assert (=> d!37307 m!143275))

(assert (=> d!37307 m!143275))

(assert (=> d!37307 m!143519))

(declare-fun m!144053 () Bool)

(assert (=> d!37307 m!144053))

(assert (=> d!37307 m!144003))

(assert (=> b!123948 m!143515))

(assert (=> b!123626 d!37307))

(declare-fun d!37309 () Bool)

(assert (=> d!37309 (= (isDefined!116 (getValueByKey!162 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!395 (getValueByKey!162 (toList!834 lt!63433) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5133 () Bool)

(assert (= bs!5133 d!37309))

(assert (=> bs!5133 m!143275))

(declare-fun m!144055 () Bool)

(assert (=> bs!5133 m!144055))

(assert (=> b!123626 d!37309))

(assert (=> b!123626 d!37249))

(assert (=> bm!13122 d!37197))

(declare-fun d!37311 () Bool)

(assert (=> d!37311 (arrayContainsKey!0 (_keys!4480 newMap!16) lt!63460 #b00000000000000000000000000000000)))

(declare-fun lt!63708 () Unit!3833)

(declare-fun choose!13 (array!4633 (_ BitVec 64) (_ BitVec 32)) Unit!3833)

(assert (=> d!37311 (= lt!63708 (choose!13 (_keys!4480 newMap!16) lt!63460 #b00000000000000000000000000000000))))

(assert (=> d!37311 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!37311 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4480 newMap!16) lt!63460 #b00000000000000000000000000000000) lt!63708)))

(declare-fun bs!5134 () Bool)

(assert (= bs!5134 d!37311))

(assert (=> bs!5134 m!143311))

(declare-fun m!144057 () Bool)

(assert (=> bs!5134 m!144057))

(assert (=> b!123524 d!37311))

(declare-fun d!37313 () Bool)

(declare-fun res!60109 () Bool)

(declare-fun e!80988 () Bool)

(assert (=> d!37313 (=> res!60109 e!80988)))

(assert (=> d!37313 (= res!60109 (= (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) lt!63460))))

(assert (=> d!37313 (= (arrayContainsKey!0 (_keys!4480 newMap!16) lt!63460 #b00000000000000000000000000000000) e!80988)))

(declare-fun b!123953 () Bool)

(declare-fun e!80989 () Bool)

(assert (=> b!123953 (= e!80988 e!80989)))

(declare-fun res!60110 () Bool)

(assert (=> b!123953 (=> (not res!60110) (not e!80989))))

(assert (=> b!123953 (= res!60110 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2457 (_keys!4480 newMap!16))))))

(declare-fun b!123954 () Bool)

(assert (=> b!123954 (= e!80989 (arrayContainsKey!0 (_keys!4480 newMap!16) lt!63460 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!37313 (not res!60109)) b!123953))

(assert (= (and b!123953 res!60110) b!123954))

(assert (=> d!37313 m!143287))

(declare-fun m!144059 () Bool)

(assert (=> b!123954 m!144059))

(assert (=> b!123524 d!37313))

(declare-fun b!123967 () Bool)

(declare-fun c!22559 () Bool)

(declare-fun lt!63715 () (_ BitVec 64))

(assert (=> b!123967 (= c!22559 (= lt!63715 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!80996 () SeekEntryResult!270)

(declare-fun e!80998 () SeekEntryResult!270)

(assert (=> b!123967 (= e!80996 e!80998)))

(declare-fun d!37315 () Bool)

(declare-fun lt!63716 () SeekEntryResult!270)

(assert (=> d!37315 (and (or ((_ is Undefined!270) lt!63716) (not ((_ is Found!270) lt!63716)) (and (bvsge (index!3235 lt!63716) #b00000000000000000000000000000000) (bvslt (index!3235 lt!63716) (size!2457 (_keys!4480 newMap!16))))) (or ((_ is Undefined!270) lt!63716) ((_ is Found!270) lt!63716) (not ((_ is MissingZero!270) lt!63716)) (and (bvsge (index!3234 lt!63716) #b00000000000000000000000000000000) (bvslt (index!3234 lt!63716) (size!2457 (_keys!4480 newMap!16))))) (or ((_ is Undefined!270) lt!63716) ((_ is Found!270) lt!63716) ((_ is MissingZero!270) lt!63716) (not ((_ is MissingVacant!270) lt!63716)) (and (bvsge (index!3237 lt!63716) #b00000000000000000000000000000000) (bvslt (index!3237 lt!63716) (size!2457 (_keys!4480 newMap!16))))) (or ((_ is Undefined!270) lt!63716) (ite ((_ is Found!270) lt!63716) (= (select (arr!2194 (_keys!4480 newMap!16)) (index!3235 lt!63716)) (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!270) lt!63716) (= (select (arr!2194 (_keys!4480 newMap!16)) (index!3234 lt!63716)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!270) lt!63716) (= (select (arr!2194 (_keys!4480 newMap!16)) (index!3237 lt!63716)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!80997 () SeekEntryResult!270)

(assert (=> d!37315 (= lt!63716 e!80997)))

(declare-fun c!22558 () Bool)

(declare-fun lt!63717 () SeekEntryResult!270)

(assert (=> d!37315 (= c!22558 (and ((_ is Intermediate!270) lt!63717) (undefined!1082 lt!63717)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4633 (_ BitVec 32)) SeekEntryResult!270)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!37315 (= lt!63717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) (mask!6991 newMap!16)) (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) (_keys!4480 newMap!16) (mask!6991 newMap!16)))))

(assert (=> d!37315 (validMask!0 (mask!6991 newMap!16))))

(assert (=> d!37315 (= (seekEntryOrOpen!0 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) (_keys!4480 newMap!16) (mask!6991 newMap!16)) lt!63716)))

(declare-fun b!123968 () Bool)

(assert (=> b!123968 (= e!80997 Undefined!270)))

(declare-fun b!123969 () Bool)

(assert (=> b!123969 (= e!80997 e!80996)))

(assert (=> b!123969 (= lt!63715 (select (arr!2194 (_keys!4480 newMap!16)) (index!3236 lt!63717)))))

(declare-fun c!22557 () Bool)

(assert (=> b!123969 (= c!22557 (= lt!63715 (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!123970 () Bool)

(assert (=> b!123970 (= e!80996 (Found!270 (index!3236 lt!63717)))))

(declare-fun b!123971 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4633 (_ BitVec 32)) SeekEntryResult!270)

(assert (=> b!123971 (= e!80998 (seekKeyOrZeroReturnVacant!0 (x!14730 lt!63717) (index!3236 lt!63717) (index!3236 lt!63717) (select (arr!2194 (_keys!4480 newMap!16)) #b00000000000000000000000000000000) (_keys!4480 newMap!16) (mask!6991 newMap!16)))))

(declare-fun b!123972 () Bool)

(assert (=> b!123972 (= e!80998 (MissingZero!270 (index!3236 lt!63717)))))

(assert (= (and d!37315 c!22558) b!123968))

(assert (= (and d!37315 (not c!22558)) b!123969))

(assert (= (and b!123969 c!22557) b!123970))

(assert (= (and b!123969 (not c!22557)) b!123967))

(assert (= (and b!123967 c!22559) b!123972))

(assert (= (and b!123967 (not c!22559)) b!123971))

(declare-fun m!144061 () Bool)

(assert (=> d!37315 m!144061))

(declare-fun m!144063 () Bool)

(assert (=> d!37315 m!144063))

(assert (=> d!37315 m!143287))

(declare-fun m!144065 () Bool)

(assert (=> d!37315 m!144065))

(declare-fun m!144067 () Bool)

(assert (=> d!37315 m!144067))

(assert (=> d!37315 m!143333))

(declare-fun m!144069 () Bool)

(assert (=> d!37315 m!144069))

(assert (=> d!37315 m!143287))

(assert (=> d!37315 m!144063))

(declare-fun m!144071 () Bool)

(assert (=> b!123969 m!144071))

(assert (=> b!123971 m!143287))

(declare-fun m!144073 () Bool)

(assert (=> b!123971 m!144073))

(assert (=> b!123524 d!37315))

(assert (=> b!123628 d!37309))

(assert (=> b!123628 d!37249))

(assert (=> b!123506 d!37107))

(declare-fun d!37317 () Bool)

(declare-fun isEmpty!396 (List!1684) Bool)

(assert (=> d!37317 (= (isEmpty!394 lt!63539) (isEmpty!396 (toList!834 lt!63539)))))

(declare-fun bs!5135 () Bool)

(assert (= bs!5135 d!37317))

(declare-fun m!144075 () Bool)

(assert (=> bs!5135 m!144075))

(assert (=> b!123605 d!37317))

(declare-fun d!37319 () Bool)

(declare-fun e!80999 () Bool)

(assert (=> d!37319 e!80999))

(declare-fun res!60111 () Bool)

(assert (=> d!37319 (=> res!60111 e!80999)))

(declare-fun lt!63719 () Bool)

(assert (=> d!37319 (= res!60111 (not lt!63719))))

(declare-fun lt!63721 () Bool)

(assert (=> d!37319 (= lt!63719 lt!63721)))

(declare-fun lt!63720 () Unit!3833)

(declare-fun e!81000 () Unit!3833)

(assert (=> d!37319 (= lt!63720 e!81000)))

(declare-fun c!22560 () Bool)

(assert (=> d!37319 (= c!22560 lt!63721)))

(assert (=> d!37319 (= lt!63721 (containsKey!166 (toList!834 lt!63423) lt!63419))))

(assert (=> d!37319 (= (contains!858 lt!63423 lt!63419) lt!63719)))

(declare-fun b!123973 () Bool)

(declare-fun lt!63718 () Unit!3833)

(assert (=> b!123973 (= e!81000 lt!63718)))

(assert (=> b!123973 (= lt!63718 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63423) lt!63419))))

(assert (=> b!123973 (isDefined!116 (getValueByKey!162 (toList!834 lt!63423) lt!63419))))

(declare-fun b!123974 () Bool)

(declare-fun Unit!3856 () Unit!3833)

(assert (=> b!123974 (= e!81000 Unit!3856)))

(declare-fun b!123975 () Bool)

(assert (=> b!123975 (= e!80999 (isDefined!116 (getValueByKey!162 (toList!834 lt!63423) lt!63419)))))

(assert (= (and d!37319 c!22560) b!123973))

(assert (= (and d!37319 (not c!22560)) b!123974))

(assert (= (and d!37319 (not res!60111)) b!123975))

(declare-fun m!144077 () Bool)

(assert (=> d!37319 m!144077))

(declare-fun m!144079 () Bool)

(assert (=> b!123973 m!144079))

(assert (=> b!123973 m!143425))

(assert (=> b!123973 m!143425))

(declare-fun m!144081 () Bool)

(assert (=> b!123973 m!144081))

(assert (=> b!123975 m!143425))

(assert (=> b!123975 m!143425))

(assert (=> b!123975 m!144081))

(assert (=> d!37065 d!37319))

(assert (=> d!37065 d!37057))

(assert (=> d!37065 d!37083))

(declare-fun d!37321 () Bool)

(assert (=> d!37321 (= (apply!108 (+!155 lt!63423 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63419) (apply!108 lt!63423 lt!63419))))

(assert (=> d!37321 true))

(declare-fun _$34!939 () Unit!3833)

(assert (=> d!37321 (= (choose!749 lt!63423 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))) lt!63419) _$34!939)))

(declare-fun bs!5136 () Bool)

(assert (= bs!5136 d!37321))

(assert (=> bs!5136 m!143229))

(assert (=> bs!5136 m!143229))

(assert (=> bs!5136 m!143255))

(assert (=> bs!5136 m!143257))

(assert (=> d!37065 d!37321))

(assert (=> d!37065 d!37069))

(assert (=> b!123607 d!37037))

(declare-fun d!37323 () Bool)

(declare-fun e!81001 () Bool)

(assert (=> d!37323 e!81001))

(declare-fun res!60112 () Bool)

(assert (=> d!37323 (=> res!60112 e!81001)))

(declare-fun lt!63723 () Bool)

(assert (=> d!37323 (= res!60112 (not lt!63723))))

(declare-fun lt!63725 () Bool)

(assert (=> d!37323 (= lt!63723 lt!63725)))

(declare-fun lt!63724 () Unit!3833)

(declare-fun e!81002 () Unit!3833)

(assert (=> d!37323 (= lt!63724 e!81002)))

(declare-fun c!22561 () Bool)

(assert (=> d!37323 (= c!22561 lt!63725)))

(assert (=> d!37323 (= lt!63725 (containsKey!166 (toList!834 lt!63489) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37323 (= (contains!858 lt!63489 (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63723)))

(declare-fun b!123976 () Bool)

(declare-fun lt!63722 () Unit!3833)

(assert (=> b!123976 (= e!81002 lt!63722)))

(assert (=> b!123976 (= lt!63722 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63489) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> b!123976 (isDefined!116 (getValueByKey!162 (toList!834 lt!63489) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123977 () Bool)

(declare-fun Unit!3857 () Unit!3833)

(assert (=> b!123977 (= e!81002 Unit!3857)))

(declare-fun b!123978 () Bool)

(assert (=> b!123978 (= e!81001 (isDefined!116 (getValueByKey!162 (toList!834 lt!63489) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (= (and d!37323 c!22561) b!123976))

(assert (= (and d!37323 (not c!22561)) b!123977))

(assert (= (and d!37323 (not res!60112)) b!123978))

(declare-fun m!144083 () Bool)

(assert (=> d!37323 m!144083))

(declare-fun m!144085 () Bool)

(assert (=> b!123976 m!144085))

(assert (=> b!123976 m!143385))

(assert (=> b!123976 m!143385))

(declare-fun m!144087 () Bool)

(assert (=> b!123976 m!144087))

(assert (=> b!123978 m!143385))

(assert (=> b!123978 m!143385))

(assert (=> b!123978 m!144087))

(assert (=> d!37057 d!37323))

(declare-fun b!123981 () Bool)

(declare-fun e!81004 () Option!168)

(assert (=> b!123981 (= e!81004 (getValueByKey!162 (t!5978 lt!63487) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123980 () Bool)

(declare-fun e!81003 () Option!168)

(assert (=> b!123980 (= e!81003 e!81004)))

(declare-fun c!22563 () Bool)

(assert (=> b!123980 (= c!22563 (and ((_ is Cons!1680) lt!63487) (not (= (_1!1273 (h!2281 lt!63487)) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun b!123979 () Bool)

(assert (=> b!123979 (= e!81003 (Some!167 (_2!1273 (h!2281 lt!63487))))))

(declare-fun b!123982 () Bool)

(assert (=> b!123982 (= e!81004 None!166)))

(declare-fun d!37325 () Bool)

(declare-fun c!22562 () Bool)

(assert (=> d!37325 (= c!22562 (and ((_ is Cons!1680) lt!63487) (= (_1!1273 (h!2281 lt!63487)) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37325 (= (getValueByKey!162 lt!63487 (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) e!81003)))

(assert (= (and d!37325 c!22562) b!123979))

(assert (= (and d!37325 (not c!22562)) b!123980))

(assert (= (and b!123980 c!22563) b!123981))

(assert (= (and b!123980 (not c!22563)) b!123982))

(declare-fun m!144089 () Bool)

(assert (=> b!123981 m!144089))

(assert (=> d!37057 d!37325))

(declare-fun d!37327 () Bool)

(assert (=> d!37327 (= (getValueByKey!162 lt!63487 (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun lt!63726 () Unit!3833)

(assert (=> d!37327 (= lt!63726 (choose!751 lt!63487 (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun e!81005 () Bool)

(assert (=> d!37327 e!81005))

(declare-fun res!60113 () Bool)

(assert (=> d!37327 (=> (not res!60113) (not e!81005))))

(assert (=> d!37327 (= res!60113 (isStrictlySorted!310 lt!63487))))

(assert (=> d!37327 (= (lemmaContainsTupThenGetReturnValue!81 lt!63487 (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63726)))

(declare-fun b!123983 () Bool)

(declare-fun res!60114 () Bool)

(assert (=> b!123983 (=> (not res!60114) (not e!81005))))

(assert (=> b!123983 (= res!60114 (containsKey!166 lt!63487 (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123984 () Bool)

(assert (=> b!123984 (= e!81005 (contains!860 lt!63487 (tuple2!2525 (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (= (and d!37327 res!60113) b!123983))

(assert (= (and b!123983 res!60114) b!123984))

(assert (=> d!37327 m!143379))

(declare-fun m!144091 () Bool)

(assert (=> d!37327 m!144091))

(declare-fun m!144093 () Bool)

(assert (=> d!37327 m!144093))

(declare-fun m!144095 () Bool)

(assert (=> b!123983 m!144095))

(declare-fun m!144097 () Bool)

(assert (=> b!123984 m!144097))

(assert (=> d!37057 d!37327))

(declare-fun b!123985 () Bool)

(declare-fun e!81010 () List!1684)

(declare-fun call!13154 () List!1684)

(assert (=> b!123985 (= e!81010 call!13154)))

(declare-fun b!123986 () Bool)

(declare-fun e!81009 () List!1684)

(assert (=> b!123986 (= e!81009 e!81010)))

(declare-fun c!22565 () Bool)

(assert (=> b!123986 (= c!22565 (and ((_ is Cons!1680) (toList!834 lt!63423)) (= (_1!1273 (h!2281 (toList!834 lt!63423))) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun bm!13149 () Bool)

(declare-fun call!13152 () List!1684)

(assert (=> bm!13149 (= call!13152 call!13154)))

(declare-fun e!81007 () List!1684)

(declare-fun c!22566 () Bool)

(declare-fun b!123988 () Bool)

(assert (=> b!123988 (= e!81007 (ite c!22565 (t!5978 (toList!834 lt!63423)) (ite c!22566 (Cons!1680 (h!2281 (toList!834 lt!63423)) (t!5978 (toList!834 lt!63423))) Nil!1681)))))

(declare-fun b!123989 () Bool)

(declare-fun res!60116 () Bool)

(declare-fun e!81006 () Bool)

(assert (=> b!123989 (=> (not res!60116) (not e!81006))))

(declare-fun lt!63727 () List!1684)

(assert (=> b!123989 (= res!60116 (containsKey!166 lt!63727 (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun bm!13150 () Bool)

(declare-fun call!13153 () List!1684)

(assert (=> bm!13150 (= call!13154 call!13153)))

(declare-fun c!22567 () Bool)

(declare-fun bm!13151 () Bool)

(assert (=> bm!13151 (= call!13153 ($colon$colon!86 e!81007 (ite c!22567 (h!2281 (toList!834 lt!63423)) (tuple2!2525 (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun c!22564 () Bool)

(assert (=> bm!13151 (= c!22564 c!22567)))

(declare-fun b!123990 () Bool)

(declare-fun e!81008 () List!1684)

(assert (=> b!123990 (= e!81008 call!13152)))

(declare-fun b!123991 () Bool)

(assert (=> b!123991 (= e!81007 (insertStrictlySorted!84 (t!5978 (toList!834 lt!63423)) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!123992 () Bool)

(assert (=> b!123992 (= e!81008 call!13152)))

(declare-fun d!37329 () Bool)

(assert (=> d!37329 e!81006))

(declare-fun res!60115 () Bool)

(assert (=> d!37329 (=> (not res!60115) (not e!81006))))

(assert (=> d!37329 (= res!60115 (isStrictlySorted!310 lt!63727))))

(assert (=> d!37329 (= lt!63727 e!81009)))

(assert (=> d!37329 (= c!22567 (and ((_ is Cons!1680) (toList!834 lt!63423)) (bvslt (_1!1273 (h!2281 (toList!834 lt!63423))) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37329 (isStrictlySorted!310 (toList!834 lt!63423))))

(assert (=> d!37329 (= (insertStrictlySorted!84 (toList!834 lt!63423) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63727)))

(declare-fun b!123987 () Bool)

(assert (=> b!123987 (= e!81006 (contains!860 lt!63727 (tuple2!2525 (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!123993 () Bool)

(assert (=> b!123993 (= c!22566 (and ((_ is Cons!1680) (toList!834 lt!63423)) (bvsgt (_1!1273 (h!2281 (toList!834 lt!63423))) (_1!1273 (tuple2!2525 lt!63430 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> b!123993 (= e!81010 e!81008)))

(declare-fun b!123994 () Bool)

(assert (=> b!123994 (= e!81009 call!13153)))

(assert (= (and d!37329 c!22567) b!123994))

(assert (= (and d!37329 (not c!22567)) b!123986))

(assert (= (and b!123986 c!22565) b!123985))

(assert (= (and b!123986 (not c!22565)) b!123993))

(assert (= (and b!123993 c!22566) b!123990))

(assert (= (and b!123993 (not c!22566)) b!123992))

(assert (= (or b!123990 b!123992) bm!13149))

(assert (= (or b!123985 bm!13149) bm!13150))

(assert (= (or b!123994 bm!13150) bm!13151))

(assert (= (and bm!13151 c!22564) b!123991))

(assert (= (and bm!13151 (not c!22564)) b!123988))

(assert (= (and d!37329 res!60115) b!123989))

(assert (= (and b!123989 res!60116) b!123987))

(declare-fun m!144099 () Bool)

(assert (=> bm!13151 m!144099))

(declare-fun m!144101 () Bool)

(assert (=> b!123989 m!144101))

(declare-fun m!144103 () Bool)

(assert (=> b!123991 m!144103))

(declare-fun m!144105 () Bool)

(assert (=> b!123987 m!144105))

(declare-fun m!144107 () Bool)

(assert (=> d!37329 m!144107))

(declare-fun m!144109 () Bool)

(assert (=> d!37329 m!144109))

(assert (=> d!37057 d!37329))

(declare-fun d!37331 () Bool)

(assert (=> d!37331 (= (get!1424 (getValueByKey!162 (toList!834 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63431)) (v!3089 (getValueByKey!162 (toList!834 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63431)))))

(assert (=> d!37085 d!37331))

(declare-fun b!123997 () Bool)

(declare-fun e!81012 () Option!168)

(assert (=> b!123997 (= e!81012 (getValueByKey!162 (t!5978 (toList!834 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) lt!63431))))

(declare-fun b!123996 () Bool)

(declare-fun e!81011 () Option!168)

(assert (=> b!123996 (= e!81011 e!81012)))

(declare-fun c!22569 () Bool)

(assert (=> b!123996 (= c!22569 (and ((_ is Cons!1680) (toList!834 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) (not (= (_1!1273 (h!2281 (toList!834 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))) lt!63431))))))

(declare-fun b!123995 () Bool)

(assert (=> b!123995 (= e!81011 (Some!167 (_2!1273 (h!2281 (toList!834 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))))

(declare-fun b!123998 () Bool)

(assert (=> b!123998 (= e!81012 None!166)))

(declare-fun d!37333 () Bool)

(declare-fun c!22568 () Bool)

(assert (=> d!37333 (= c!22568 (and ((_ is Cons!1680) (toList!834 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) (= (_1!1273 (h!2281 (toList!834 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))) lt!63431)))))

(assert (=> d!37333 (= (getValueByKey!162 (toList!834 (+!155 lt!63421 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63431) e!81011)))

(assert (= (and d!37333 c!22568) b!123995))

(assert (= (and d!37333 (not c!22568)) b!123996))

(assert (= (and b!123996 c!22569) b!123997))

(assert (= (and b!123996 (not c!22569)) b!123998))

(declare-fun m!144111 () Bool)

(assert (=> b!123997 m!144111))

(assert (=> d!37085 d!37333))

(declare-fun d!37335 () Bool)

(declare-fun res!60117 () Bool)

(declare-fun e!81013 () Bool)

(assert (=> d!37335 (=> res!60117 e!81013)))

(assert (=> d!37335 (= res!60117 (and ((_ is Cons!1680) (toList!834 lt!63433)) (= (_1!1273 (h!2281 (toList!834 lt!63433))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37335 (= (containsKey!166 (toList!834 lt!63433) #b0000000000000000000000000000000000000000000000000000000000000000) e!81013)))

(declare-fun b!123999 () Bool)

(declare-fun e!81014 () Bool)

(assert (=> b!123999 (= e!81013 e!81014)))

(declare-fun res!60118 () Bool)

(assert (=> b!123999 (=> (not res!60118) (not e!81014))))

(assert (=> b!123999 (= res!60118 (and (or (not ((_ is Cons!1680) (toList!834 lt!63433))) (bvsle (_1!1273 (h!2281 (toList!834 lt!63433))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1680) (toList!834 lt!63433)) (bvslt (_1!1273 (h!2281 (toList!834 lt!63433))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!124000 () Bool)

(assert (=> b!124000 (= e!81014 (containsKey!166 (t!5978 (toList!834 lt!63433)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37335 (not res!60117)) b!123999))

(assert (= (and b!123999 res!60118) b!124000))

(declare-fun m!144113 () Bool)

(assert (=> b!124000 m!144113))

(assert (=> d!37097 d!37335))

(declare-fun d!37337 () Bool)

(declare-fun lt!63728 () Bool)

(assert (=> d!37337 (= lt!63728 (select (content!122 (toList!834 lt!63499)) (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun e!81015 () Bool)

(assert (=> d!37337 (= lt!63728 e!81015)))

(declare-fun res!60119 () Bool)

(assert (=> d!37337 (=> (not res!60119) (not e!81015))))

(assert (=> d!37337 (= res!60119 ((_ is Cons!1680) (toList!834 lt!63499)))))

(assert (=> d!37337 (= (contains!860 (toList!834 lt!63499) (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))) lt!63728)))

(declare-fun b!124001 () Bool)

(declare-fun e!81016 () Bool)

(assert (=> b!124001 (= e!81015 e!81016)))

(declare-fun res!60120 () Bool)

(assert (=> b!124001 (=> res!60120 e!81016)))

(assert (=> b!124001 (= res!60120 (= (h!2281 (toList!834 lt!63499)) (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(declare-fun b!124002 () Bool)

(assert (=> b!124002 (= e!81016 (contains!860 (t!5978 (toList!834 lt!63499)) (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))))

(assert (= (and d!37337 res!60119) b!124001))

(assert (= (and b!124001 (not res!60120)) b!124002))

(declare-fun m!144115 () Bool)

(assert (=> d!37337 m!144115))

(declare-fun m!144117 () Bool)

(assert (=> d!37337 m!144117))

(declare-fun m!144119 () Bool)

(assert (=> b!124002 m!144119))

(assert (=> b!123560 d!37337))

(assert (=> b!123527 d!37107))

(declare-fun b!124005 () Bool)

(declare-fun e!81018 () Option!168)

(assert (=> b!124005 (= e!81018 (getValueByKey!162 (t!5978 (toList!834 lt!63451)) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!124004 () Bool)

(declare-fun e!81017 () Option!168)

(assert (=> b!124004 (= e!81017 e!81018)))

(declare-fun c!22571 () Bool)

(assert (=> b!124004 (= c!22571 (and ((_ is Cons!1680) (toList!834 lt!63451)) (not (= (_1!1273 (h!2281 (toList!834 lt!63451))) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))))

(declare-fun b!124003 () Bool)

(assert (=> b!124003 (= e!81017 (Some!167 (_2!1273 (h!2281 (toList!834 lt!63451)))))))

(declare-fun b!124006 () Bool)

(assert (=> b!124006 (= e!81018 None!166)))

(declare-fun c!22570 () Bool)

(declare-fun d!37339 () Bool)

(assert (=> d!37339 (= c!22570 (and ((_ is Cons!1680) (toList!834 lt!63451)) (= (_1!1273 (h!2281 (toList!834 lt!63451))) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(assert (=> d!37339 (= (getValueByKey!162 (toList!834 lt!63451) (_1!1273 (ite (or c!22411 c!22413) (tuple2!2525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))) (tuple2!2525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))) e!81017)))

(assert (= (and d!37339 c!22570) b!124003))

(assert (= (and d!37339 (not c!22570)) b!124004))

(assert (= (and b!124004 c!22571) b!124005))

(assert (= (and b!124004 (not c!22571)) b!124006))

(declare-fun m!144121 () Bool)

(assert (=> b!124005 m!144121))

(assert (=> b!123514 d!37339))

(declare-fun d!37341 () Bool)

(declare-fun res!60121 () Bool)

(declare-fun e!81019 () Bool)

(assert (=> d!37341 (=> res!60121 e!81019)))

(assert (=> d!37341 (= res!60121 (and ((_ is Cons!1680) (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))) (= (_1!1273 (h!2281 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))) lt!63417)))))

(assert (=> d!37341 (= (containsKey!166 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63417) e!81019)))

(declare-fun b!124007 () Bool)

(declare-fun e!81020 () Bool)

(assert (=> b!124007 (= e!81019 e!81020)))

(declare-fun res!60122 () Bool)

(assert (=> b!124007 (=> (not res!60122) (not e!81020))))

(assert (=> b!124007 (= res!60122 (and (or (not ((_ is Cons!1680) (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))) (bvsle (_1!1273 (h!2281 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))) lt!63417)) ((_ is Cons!1680) (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))) (bvslt (_1!1273 (h!2281 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992)))))))) lt!63417)))))

(declare-fun b!124008 () Bool)

(assert (=> b!124008 (= e!81020 (containsKey!166 (t!5978 (toList!834 (+!155 lt!63437 (tuple2!2525 lt!63429 (zeroValue!2619 (v!3084 (underlying!426 thiss!992))))))) lt!63417))))

(assert (= (and d!37341 (not res!60121)) b!124007))

(assert (= (and b!124007 res!60122) b!124008))

(declare-fun m!144123 () Bool)

(assert (=> b!124008 m!144123))

(assert (=> d!37071 d!37341))

(declare-fun d!37343 () Bool)

(declare-fun e!81021 () Bool)

(assert (=> d!37343 e!81021))

(declare-fun res!60123 () Bool)

(assert (=> d!37343 (=> res!60123 e!81021)))

(declare-fun lt!63730 () Bool)

(assert (=> d!37343 (= res!60123 (not lt!63730))))

(declare-fun lt!63732 () Bool)

(assert (=> d!37343 (= lt!63730 lt!63732)))

(declare-fun lt!63731 () Unit!3833)

(declare-fun e!81022 () Unit!3833)

(assert (=> d!37343 (= lt!63731 e!81022)))

(declare-fun c!22572 () Bool)

(assert (=> d!37343 (= c!22572 lt!63732)))

(assert (=> d!37343 (= lt!63732 (containsKey!166 (toList!834 lt!63494) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> d!37343 (= (contains!858 lt!63494 (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63730)))

(declare-fun b!124009 () Bool)

(declare-fun lt!63729 () Unit!3833)

(assert (=> b!124009 (= e!81022 lt!63729)))

(assert (=> b!124009 (= lt!63729 (lemmaContainsKeyImpliesGetValueByKeyDefined!115 (toList!834 lt!63494) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(assert (=> b!124009 (isDefined!116 (getValueByKey!162 (toList!834 lt!63494) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!124010 () Bool)

(declare-fun Unit!3858 () Unit!3833)

(assert (=> b!124010 (= e!81022 Unit!3858)))

(declare-fun b!124011 () Bool)

(assert (=> b!124011 (= e!81021 (isDefined!116 (getValueByKey!162 (toList!834 lt!63494) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (= (and d!37343 c!22572) b!124009))

(assert (= (and d!37343 (not c!22572)) b!124010))

(assert (= (and d!37343 (not res!60123)) b!124011))

(declare-fun m!144125 () Bool)

(assert (=> d!37343 m!144125))

(declare-fun m!144127 () Bool)

(assert (=> b!124009 m!144127))

(assert (=> b!124009 m!143405))

(assert (=> b!124009 m!143405))

(declare-fun m!144129 () Bool)

(assert (=> b!124009 m!144129))

(assert (=> b!124011 m!143405))

(assert (=> b!124011 m!143405))

(assert (=> b!124011 m!144129))

(assert (=> d!37063 d!37343))

(declare-fun b!124014 () Bool)

(declare-fun e!81024 () Option!168)

(assert (=> b!124014 (= e!81024 (getValueByKey!162 (t!5978 lt!63492) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!124013 () Bool)

(declare-fun e!81023 () Option!168)

(assert (=> b!124013 (= e!81023 e!81024)))

(declare-fun c!22574 () Bool)

(assert (=> b!124013 (= c!22574 (and ((_ is Cons!1680) lt!63492) (not (= (_1!1273 (h!2281 lt!63492)) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun b!124012 () Bool)

(assert (=> b!124012 (= e!81023 (Some!167 (_2!1273 (h!2281 lt!63492))))))

(declare-fun b!124015 () Bool)

(assert (=> b!124015 (= e!81024 None!166)))

(declare-fun c!22573 () Bool)

(declare-fun d!37345 () Bool)

(assert (=> d!37345 (= c!22573 (and ((_ is Cons!1680) lt!63492) (= (_1!1273 (h!2281 lt!63492)) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37345 (= (getValueByKey!162 lt!63492 (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) e!81023)))

(assert (= (and d!37345 c!22573) b!124012))

(assert (= (and d!37345 (not c!22573)) b!124013))

(assert (= (and b!124013 c!22574) b!124014))

(assert (= (and b!124013 (not c!22574)) b!124015))

(declare-fun m!144131 () Bool)

(assert (=> b!124014 m!144131))

(assert (=> d!37063 d!37345))

(declare-fun d!37347 () Bool)

(assert (=> d!37347 (= (getValueByKey!162 lt!63492 (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) (Some!167 (_2!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun lt!63733 () Unit!3833)

(assert (=> d!37347 (= lt!63733 (choose!751 lt!63492 (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun e!81025 () Bool)

(assert (=> d!37347 e!81025))

(declare-fun res!60124 () Bool)

(assert (=> d!37347 (=> (not res!60124) (not e!81025))))

(assert (=> d!37347 (= res!60124 (isStrictlySorted!310 lt!63492))))

(assert (=> d!37347 (= (lemmaContainsTupThenGetReturnValue!81 lt!63492 (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63733)))

(declare-fun b!124016 () Bool)

(declare-fun res!60125 () Bool)

(assert (=> b!124016 (=> (not res!60125) (not e!81025))))

(assert (=> b!124016 (= res!60125 (containsKey!166 lt!63492 (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!124017 () Bool)

(assert (=> b!124017 (= e!81025 (contains!860 lt!63492 (tuple2!2525 (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (= (and d!37347 res!60124) b!124016))

(assert (= (and b!124016 res!60125) b!124017))

(assert (=> d!37347 m!143399))

(declare-fun m!144133 () Bool)

(assert (=> d!37347 m!144133))

(declare-fun m!144135 () Bool)

(assert (=> d!37347 m!144135))

(declare-fun m!144137 () Bool)

(assert (=> b!124016 m!144137))

(declare-fun m!144139 () Bool)

(assert (=> b!124017 m!144139))

(assert (=> d!37063 d!37347))

(declare-fun b!124018 () Bool)

(declare-fun e!81030 () List!1684)

(declare-fun call!13157 () List!1684)

(assert (=> b!124018 (= e!81030 call!13157)))

(declare-fun b!124019 () Bool)

(declare-fun e!81029 () List!1684)

(assert (=> b!124019 (= e!81029 e!81030)))

(declare-fun c!22576 () Bool)

(assert (=> b!124019 (= c!22576 (and ((_ is Cons!1680) (toList!834 lt!63421)) (= (_1!1273 (h!2281 (toList!834 lt!63421))) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun bm!13152 () Bool)

(declare-fun call!13155 () List!1684)

(assert (=> bm!13152 (= call!13155 call!13157)))

(declare-fun b!124021 () Bool)

(declare-fun e!81027 () List!1684)

(declare-fun c!22577 () Bool)

(assert (=> b!124021 (= e!81027 (ite c!22576 (t!5978 (toList!834 lt!63421)) (ite c!22577 (Cons!1680 (h!2281 (toList!834 lt!63421)) (t!5978 (toList!834 lt!63421))) Nil!1681)))))

(declare-fun b!124022 () Bool)

(declare-fun res!60127 () Bool)

(declare-fun e!81026 () Bool)

(assert (=> b!124022 (=> (not res!60127) (not e!81026))))

(declare-fun lt!63734 () List!1684)

(assert (=> b!124022 (= res!60127 (containsKey!166 lt!63734 (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun bm!13153 () Bool)

(declare-fun call!13156 () List!1684)

(assert (=> bm!13153 (= call!13157 call!13156)))

(declare-fun c!22578 () Bool)

(declare-fun bm!13154 () Bool)

(assert (=> bm!13154 (= call!13156 ($colon$colon!86 e!81027 (ite c!22578 (h!2281 (toList!834 lt!63421)) (tuple2!2525 (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))))

(declare-fun c!22575 () Bool)

(assert (=> bm!13154 (= c!22575 c!22578)))

(declare-fun b!124023 () Bool)

(declare-fun e!81028 () List!1684)

(assert (=> b!124023 (= e!81028 call!13155)))

(declare-fun b!124024 () Bool)

(assert (=> b!124024 (= e!81027 (insertStrictlySorted!84 (t!5978 (toList!834 lt!63421)) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))))))

(declare-fun b!124025 () Bool)

(assert (=> b!124025 (= e!81028 call!13155)))

(declare-fun d!37349 () Bool)

(assert (=> d!37349 e!81026))

(declare-fun res!60126 () Bool)

(assert (=> d!37349 (=> (not res!60126) (not e!81026))))

(assert (=> d!37349 (= res!60126 (isStrictlySorted!310 lt!63734))))

(assert (=> d!37349 (= lt!63734 e!81029)))

(assert (=> d!37349 (= c!22578 (and ((_ is Cons!1680) (toList!834 lt!63421)) (bvslt (_1!1273 (h!2281 (toList!834 lt!63421))) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> d!37349 (isStrictlySorted!310 (toList!834 lt!63421))))

(assert (=> d!37349 (= (insertStrictlySorted!84 (toList!834 lt!63421) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992)))))) lt!63734)))

(declare-fun b!124020 () Bool)

(assert (=> b!124020 (= e!81026 (contains!860 lt!63734 (tuple2!2525 (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))) (_2!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(declare-fun b!124026 () Bool)

(assert (=> b!124026 (= c!22577 (and ((_ is Cons!1680) (toList!834 lt!63421)) (bvsgt (_1!1273 (h!2281 (toList!834 lt!63421))) (_1!1273 (tuple2!2525 lt!63428 (minValue!2619 (v!3084 (underlying!426 thiss!992))))))))))

(assert (=> b!124026 (= e!81030 e!81028)))

(declare-fun b!124027 () Bool)

(assert (=> b!124027 (= e!81029 call!13156)))

(assert (= (and d!37349 c!22578) b!124027))

(assert (= (and d!37349 (not c!22578)) b!124019))

(assert (= (and b!124019 c!22576) b!124018))

(assert (= (and b!124019 (not c!22576)) b!124026))

(assert (= (and b!124026 c!22577) b!124023))

(assert (= (and b!124026 (not c!22577)) b!124025))

(assert (= (or b!124023 b!124025) bm!13152))

(assert (= (or b!124018 bm!13152) bm!13153))

(assert (= (or b!124027 bm!13153) bm!13154))

(assert (= (and bm!13154 c!22575) b!124024))

(assert (= (and bm!13154 (not c!22575)) b!124021))

(assert (= (and d!37349 res!60126) b!124022))

(assert (= (and b!124022 res!60127) b!124020))

(declare-fun m!144141 () Bool)

(assert (=> bm!13154 m!144141))

(declare-fun m!144143 () Bool)

(assert (=> b!124022 m!144143))

(declare-fun m!144145 () Bool)

(assert (=> b!124024 m!144145))

(declare-fun m!144147 () Bool)

(assert (=> b!124020 m!144147))

(declare-fun m!144149 () Bool)

(assert (=> d!37349 m!144149))

(declare-fun m!144151 () Bool)

(assert (=> d!37349 m!144151))

(assert (=> d!37063 d!37349))

(declare-fun d!37351 () Bool)

(declare-fun res!60128 () Bool)

(declare-fun e!81031 () Bool)

(assert (=> d!37351 (=> res!60128 e!81031)))

(assert (=> d!37351 (= res!60128 (and ((_ is Cons!1680) (toList!834 lt!63433)) (= (_1!1273 (h!2281 (toList!834 lt!63433))) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37351 (= (containsKey!166 (toList!834 lt!63433) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!81031)))

(declare-fun b!124028 () Bool)

(declare-fun e!81032 () Bool)

(assert (=> b!124028 (= e!81031 e!81032)))

(declare-fun res!60129 () Bool)

(assert (=> b!124028 (=> (not res!60129) (not e!81032))))

(assert (=> b!124028 (= res!60129 (and (or (not ((_ is Cons!1680) (toList!834 lt!63433))) (bvsle (_1!1273 (h!2281 (toList!834 lt!63433))) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1680) (toList!834 lt!63433)) (bvslt (_1!1273 (h!2281 (toList!834 lt!63433))) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!124029 () Bool)

(assert (=> b!124029 (= e!81032 (containsKey!166 (t!5978 (toList!834 lt!63433)) (select (arr!2194 (_keys!4480 (v!3084 (underlying!426 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!37351 (not res!60128)) b!124028))

(assert (= (and b!124028 res!60129) b!124029))

(assert (=> b!124029 m!143205))

(declare-fun m!144153 () Bool)

(assert (=> b!124029 m!144153))

(assert (=> d!37099 d!37351))

(declare-fun mapNonEmpty!4439 () Bool)

(declare-fun mapRes!4439 () Bool)

(declare-fun tp!10847 () Bool)

(declare-fun e!81033 () Bool)

(assert (=> mapNonEmpty!4439 (= mapRes!4439 (and tp!10847 e!81033))))

(declare-fun mapValue!4439 () ValueCell!1067)

(declare-fun mapRest!4439 () (Array (_ BitVec 32) ValueCell!1067))

(declare-fun mapKey!4439 () (_ BitVec 32))

(assert (=> mapNonEmpty!4439 (= mapRest!4438 (store mapRest!4439 mapKey!4439 mapValue!4439))))

(declare-fun b!124031 () Bool)

(declare-fun e!81034 () Bool)

(assert (=> b!124031 (= e!81034 tp_is_empty!2821)))

(declare-fun mapIsEmpty!4439 () Bool)

(assert (=> mapIsEmpty!4439 mapRes!4439))

(declare-fun b!124030 () Bool)

(assert (=> b!124030 (= e!81033 tp_is_empty!2821)))

(declare-fun condMapEmpty!4439 () Bool)

(declare-fun mapDefault!4439 () ValueCell!1067)

(assert (=> mapNonEmpty!4438 (= condMapEmpty!4439 (= mapRest!4438 ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4439)))))

(assert (=> mapNonEmpty!4438 (= tp!10846 (and e!81034 mapRes!4439))))

(assert (= (and mapNonEmpty!4438 condMapEmpty!4439) mapIsEmpty!4439))

(assert (= (and mapNonEmpty!4438 (not condMapEmpty!4439)) mapNonEmpty!4439))

(assert (= (and mapNonEmpty!4439 ((_ is ValueCellFull!1067) mapValue!4439)) b!124030))

(assert (= (and mapNonEmpty!4438 ((_ is ValueCellFull!1067) mapDefault!4439)) b!124031))

(declare-fun m!144155 () Bool)

(assert (=> mapNonEmpty!4439 m!144155))

(declare-fun mapNonEmpty!4440 () Bool)

(declare-fun mapRes!4440 () Bool)

(declare-fun tp!10848 () Bool)

(declare-fun e!81035 () Bool)

(assert (=> mapNonEmpty!4440 (= mapRes!4440 (and tp!10848 e!81035))))

(declare-fun mapRest!4440 () (Array (_ BitVec 32) ValueCell!1067))

(declare-fun mapKey!4440 () (_ BitVec 32))

(declare-fun mapValue!4440 () ValueCell!1067)

(assert (=> mapNonEmpty!4440 (= mapRest!4437 (store mapRest!4440 mapKey!4440 mapValue!4440))))

(declare-fun b!124033 () Bool)

(declare-fun e!81036 () Bool)

(assert (=> b!124033 (= e!81036 tp_is_empty!2821)))

(declare-fun mapIsEmpty!4440 () Bool)

(assert (=> mapIsEmpty!4440 mapRes!4440))

(declare-fun b!124032 () Bool)

(assert (=> b!124032 (= e!81035 tp_is_empty!2821)))

(declare-fun condMapEmpty!4440 () Bool)

(declare-fun mapDefault!4440 () ValueCell!1067)

(assert (=> mapNonEmpty!4437 (= condMapEmpty!4440 (= mapRest!4437 ((as const (Array (_ BitVec 32) ValueCell!1067)) mapDefault!4440)))))

(assert (=> mapNonEmpty!4437 (= tp!10845 (and e!81036 mapRes!4440))))

(assert (= (and mapNonEmpty!4437 condMapEmpty!4440) mapIsEmpty!4440))

(assert (= (and mapNonEmpty!4437 (not condMapEmpty!4440)) mapNonEmpty!4440))

(assert (= (and mapNonEmpty!4440 ((_ is ValueCellFull!1067) mapValue!4440)) b!124032))

(assert (= (and mapNonEmpty!4437 ((_ is ValueCellFull!1067) mapDefault!4440)) b!124033))

(declare-fun m!144157 () Bool)

(assert (=> mapNonEmpty!4440 m!144157))

(declare-fun b_lambda!5435 () Bool)

(assert (= b_lambda!5433 (or (and b!123295 b_free!2809) (and b!123290 b_free!2811 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))))) b_lambda!5435)))

(declare-fun b_lambda!5437 () Bool)

(assert (= b_lambda!5427 (or (and b!123295 b_free!2809 (= (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) (defaultEntry!2754 newMap!16))) (and b!123290 b_free!2811) b_lambda!5437)))

(declare-fun b_lambda!5439 () Bool)

(assert (= b_lambda!5431 (or (and b!123295 b_free!2809) (and b!123290 b_free!2811 (= (defaultEntry!2754 newMap!16) (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))))) b_lambda!5439)))

(declare-fun b_lambda!5441 () Bool)

(assert (= b_lambda!5429 (or (and b!123295 b_free!2809 (= (defaultEntry!2754 (v!3084 (underlying!426 thiss!992))) (defaultEntry!2754 newMap!16))) (and b!123290 b_free!2811) b_lambda!5441)))

(check-sat (not d!37315) (not d!37281) (not b!123774) (not b!123915) (not d!37277) (not b!123891) (not b!123828) b_and!7599 (not b!124014) (not d!37319) (not b!123851) (not b!123659) (not d!37121) (not b!123944) (not d!37219) (not d!37271) (not b!123893) (not d!37165) (not b!123920) (not b!123847) (not b!124016) (not b!123884) (not d!37187) (not b!123908) (not d!37317) (not b_next!2811) (not b!123871) (not d!37307) (not d!37115) (not b_lambda!5441) (not b!123764) (not b!123766) (not d!37287) (not b!123813) (not b!123838) (not d!37233) (not bm!13138) b_and!7597 (not b!123745) (not b!123658) (not b!123841) (not b!123907) (not d!37235) (not d!37139) (not b!123760) (not d!37163) (not d!37303) (not b!123671) (not d!37109) (not b!123869) (not d!37305) (not b!123839) (not b!123753) (not b!123948) (not b!124029) (not d!37111) (not d!37349) (not d!37141) (not b!123943) (not d!37213) (not b!123776) (not b!123714) (not b!123856) (not d!37123) (not b!123991) (not b!123892) (not b!123997) (not d!37321) (not b!123793) (not d!37231) (not b!123777) (not d!37327) (not b!123824) (not d!37309) (not b!123971) (not d!37207) (not b!123656) (not bm!13141) (not d!37291) (not b!123976) (not b!123874) (not b!123661) (not b!123984) (not d!37223) (not b!123782) (not b!123867) (not b!123846) (not b!123978) (not b!123716) (not d!37261) (not b!123850) (not d!37129) (not b!123784) (not b!123788) (not b!124008) (not b!123844) (not b!124022) (not d!37161) (not b!123725) (not b!123709) (not bm!13147) (not d!37329) (not b!123895) (not bm!13142) (not d!37193) (not b!123905) (not d!37239) (not b!123842) (not b!123860) (not bm!13143) (not b!123947) (not b!123954) (not d!37263) (not d!37241) (not b!123868) (not d!37251) (not d!37133) (not b!124024) (not b!123809) (not d!37151) (not b!123825) (not b!123862) (not b!123934) (not d!37197) (not b!123710) (not b!124005) (not b!124020) (not d!37117) (not bm!13154) (not b!123975) (not b!123989) tp_is_empty!2821 (not b!123649) (not b_lambda!5439) (not b!123694) (not d!37265) (not d!37293) (not b!123887) (not b!123854) (not b_lambda!5435) (not b!124000) (not d!37337) (not d!37323) (not b_lambda!5425) (not b!123929) (not d!37299) (not bm!13132) (not b!123902) (not b!123698) (not b!123913) (not b_lambda!5421) (not b!123843) (not b!123796) (not b!123857) (not b!123739) (not b!123853) (not b!123945) (not d!37169) (not b!123923) (not b!123713) (not b!123840) (not b!123987) (not bm!13135) (not d!37217) (not b!123780) (not b!124017) (not bm!13151) (not d!37279) (not mapNonEmpty!4439) (not b!123756) (not b!123653) (not b!123865) (not d!37221) (not b!123747) (not b!123921) (not d!37189) (not d!37131) (not b!123717) (not d!37237) (not b!123911) (not b!123771) (not b!123830) (not b!123861) (not d!37347) (not b!123715) (not b!123870) (not b!123799) (not b!123835) (not b!123935) (not b!123762) (not b_lambda!5413) (not b!123926) (not d!37257) (not b!123881) (not b!123795) (not d!37311) (not d!37201) (not b!123889) (not b!123900) (not d!37229) (not b!123817) (not b!123821) (not b!123790) (not d!37343) (not b!123938) (not b_lambda!5423) (not d!37227) (not b_lambda!5437) (not b!123873) (not d!37119) (not b!123801) (not b!123834) (not b!123743) (not bm!13134) (not d!37199) (not d!37225) (not b!124011) (not b!123924) (not b!123932) (not d!37259) (not b!123696) (not b!123703) (not bm!13148) (not b!123981) (not bm!13123) (not b!123831) (not d!37195) (not mapNonEmpty!4440) (not b!123655) (not b!124009) (not d!37157) (not b!124002) (not b!123723) (not d!37215) (not b!123803) (not b!123705) (not b!123941) (not d!37171) (not b_next!2809) (not b!123706) (not d!37269) (not d!37275) (not b!123733) (not b!123736) (not b!123652) (not b!123890) (not d!37209) (not b!123983) (not bm!13144) (not b!123769) (not d!37205) (not d!37191) (not d!37285) (not b!123927) (not b!123670) (not b!123877) (not b!123973) (not b!123664) (not b!123936) (not bm!13133))
(check-sat b_and!7597 b_and!7599 (not b_next!2809) (not b_next!2811))
