; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15272 () Bool)

(assert start!15272)

(declare-fun b!147581 () Bool)

(declare-fun b_free!3177 () Bool)

(declare-fun b_next!3177 () Bool)

(assert (=> b!147581 (= b_free!3177 (not b_next!3177))))

(declare-fun tp!12038 () Bool)

(declare-fun b_and!9291 () Bool)

(assert (=> b!147581 (= tp!12038 b_and!9291)))

(declare-fun b!147578 () Bool)

(declare-fun b_free!3179 () Bool)

(declare-fun b_next!3179 () Bool)

(assert (=> b!147578 (= b_free!3179 (not b_next!3179))))

(declare-fun tp!12040 () Bool)

(declare-fun b_and!9293 () Bool)

(assert (=> b!147578 (= tp!12040 b_and!9293)))

(declare-fun b!147575 () Bool)

(declare-fun res!70106 () Bool)

(declare-fun e!96450 () Bool)

(assert (=> b!147575 (=> (not res!70106) (not e!96450))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3653 0))(
  ( (V!3654 (val!1547 Int)) )
))
(declare-datatypes ((array!5057 0))(
  ( (array!5058 (arr!2389 (Array (_ BitVec 32) (_ BitVec 64))) (size!2665 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1159 0))(
  ( (ValueCellFull!1159 (v!3385 V!3653)) (EmptyCell!1159) )
))
(declare-datatypes ((array!5059 0))(
  ( (array!5060 (arr!2390 (Array (_ BitVec 32) ValueCell!1159)) (size!2666 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1226 0))(
  ( (LongMapFixedSize!1227 (defaultEntry!3032 Int) (mask!7418 (_ BitVec 32)) (extraKeys!2777 (_ BitVec 32)) (zeroValue!2877 V!3653) (minValue!2877 V!3653) (_size!662 (_ BitVec 32)) (_keys!4801 array!5057) (_values!3015 array!5059) (_vacant!662 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1008 0))(
  ( (Cell!1009 (v!3386 LongMapFixedSize!1226)) )
))
(declare-datatypes ((LongMap!1008 0))(
  ( (LongMap!1009 (underlying!515 Cell!1008)) )
))
(declare-fun thiss!992 () LongMap!1008)

(assert (=> b!147575 (= res!70106 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2665 (_keys!4801 (v!3386 (underlying!515 thiss!992)))))))))

(declare-fun b!147576 () Bool)

(declare-fun res!70109 () Bool)

(assert (=> b!147576 (=> (not res!70109) (not e!96450))))

(declare-fun newMap!16 () LongMapFixedSize!1226)

(assert (=> b!147576 (= res!70109 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7418 newMap!16)) (_size!662 (v!3386 (underlying!515 thiss!992)))))))

(declare-fun res!70108 () Bool)

(assert (=> start!15272 (=> (not res!70108) (not e!96450))))

(declare-fun valid!601 (LongMap!1008) Bool)

(assert (=> start!15272 (= res!70108 (valid!601 thiss!992))))

(assert (=> start!15272 e!96450))

(declare-fun e!96454 () Bool)

(assert (=> start!15272 e!96454))

(assert (=> start!15272 true))

(declare-fun e!96451 () Bool)

(assert (=> start!15272 e!96451))

(declare-fun b!147577 () Bool)

(declare-fun e!96441 () Bool)

(declare-fun tp_is_empty!3005 () Bool)

(assert (=> b!147577 (= e!96441 tp_is_empty!3005)))

(declare-fun mapIsEmpty!5091 () Bool)

(declare-fun mapRes!5091 () Bool)

(assert (=> mapIsEmpty!5091 mapRes!5091))

(declare-fun e!96444 () Bool)

(declare-fun array_inv!1505 (array!5057) Bool)

(declare-fun array_inv!1506 (array!5059) Bool)

(assert (=> b!147578 (= e!96451 (and tp!12040 tp_is_empty!3005 (array_inv!1505 (_keys!4801 newMap!16)) (array_inv!1506 (_values!3015 newMap!16)) e!96444))))

(declare-fun b!147579 () Bool)

(declare-fun e!96448 () Bool)

(declare-fun e!96442 () Bool)

(assert (=> b!147579 (= e!96448 e!96442)))

(declare-fun b!147580 () Bool)

(declare-fun e!96457 () Bool)

(declare-fun e!96453 () Bool)

(assert (=> b!147580 (= e!96457 e!96453)))

(declare-fun res!70103 () Bool)

(assert (=> b!147580 (=> (not res!70103) (not e!96453))))

(declare-datatypes ((tuple2!2802 0))(
  ( (tuple2!2803 (_1!1412 Bool) (_2!1412 LongMapFixedSize!1226)) )
))
(declare-fun lt!77951 () tuple2!2802)

(assert (=> b!147580 (= res!70103 (and (_1!1412 lt!77951) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!4671 0))(
  ( (Unit!4672) )
))
(declare-fun lt!77939 () Unit!4671)

(declare-fun e!96455 () Unit!4671)

(assert (=> b!147580 (= lt!77939 e!96455)))

(declare-datatypes ((tuple2!2804 0))(
  ( (tuple2!2805 (_1!1413 (_ BitVec 64)) (_2!1413 V!3653)) )
))
(declare-datatypes ((List!1797 0))(
  ( (Nil!1794) (Cons!1793 (h!2401 tuple2!2804) (t!6558 List!1797)) )
))
(declare-datatypes ((ListLongMap!1801 0))(
  ( (ListLongMap!1802 (toList!916 List!1797)) )
))
(declare-fun lt!77945 () ListLongMap!1801)

(declare-fun c!27779 () Bool)

(declare-fun contains!961 (ListLongMap!1801 (_ BitVec 64)) Bool)

(assert (=> b!147580 (= c!27779 (contains!961 lt!77945 (select (arr!2389 (_keys!4801 (v!3386 (underlying!515 thiss!992)))) from!355)))))

(declare-fun lt!77947 () V!3653)

(declare-fun update!234 (LongMapFixedSize!1226 (_ BitVec 64) V!3653) tuple2!2802)

(assert (=> b!147580 (= lt!77951 (update!234 newMap!16 (select (arr!2389 (_keys!4801 (v!3386 (underlying!515 thiss!992)))) from!355) lt!77947))))

(declare-fun mapNonEmpty!5091 () Bool)

(declare-fun tp!12039 () Bool)

(declare-fun e!96445 () Bool)

(assert (=> mapNonEmpty!5091 (= mapRes!5091 (and tp!12039 e!96445))))

(declare-fun mapRest!5091 () (Array (_ BitVec 32) ValueCell!1159))

(declare-fun mapValue!5091 () ValueCell!1159)

(declare-fun mapKey!5091 () (_ BitVec 32))

(assert (=> mapNonEmpty!5091 (= (arr!2390 (_values!3015 newMap!16)) (store mapRest!5091 mapKey!5091 mapValue!5091))))

(declare-fun e!96443 () Bool)

(assert (=> b!147581 (= e!96442 (and tp!12038 tp_is_empty!3005 (array_inv!1505 (_keys!4801 (v!3386 (underlying!515 thiss!992)))) (array_inv!1506 (_values!3015 (v!3386 (underlying!515 thiss!992)))) e!96443))))

(declare-fun b!147582 () Bool)

(declare-fun e!96456 () Bool)

(assert (=> b!147582 (= e!96444 (and e!96456 mapRes!5091))))

(declare-fun condMapEmpty!5092 () Bool)

(declare-fun mapDefault!5092 () ValueCell!1159)

