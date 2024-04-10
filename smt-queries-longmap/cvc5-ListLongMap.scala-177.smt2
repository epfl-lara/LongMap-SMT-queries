; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3446 () Bool)

(assert start!3446)

(declare-fun b!22249 () Bool)

(declare-fun b_free!739 () Bool)

(declare-fun b_next!739 () Bool)

(assert (=> b!22249 (= b_free!739 (not b_next!739))))

(declare-fun tp!3458 () Bool)

(declare-fun b_and!1451 () Bool)

(assert (=> b!22249 (= tp!3458 b_and!1451)))

(declare-fun b!22244 () Bool)

(declare-fun e!14445 () Bool)

(declare-fun e!14444 () Bool)

(assert (=> b!22244 (= e!14445 e!14444)))

(declare-fun b!22245 () Bool)

(declare-datatypes ((V!1163 0))(
  ( (V!1164 (val!528 Int)) )
))
(declare-datatypes ((array!1239 0))(
  ( (array!1240 (arr!587 (Array (_ BitVec 32) (_ BitVec 64))) (size!683 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!302 0))(
  ( (ValueCellFull!302 (v!1581 V!1163)) (EmptyCell!302) )
))
(declare-datatypes ((array!1241 0))(
  ( (array!1242 (arr!588 (Array (_ BitVec 32) ValueCell!302)) (size!684 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!190 0))(
  ( (LongMapFixedSize!191 (defaultEntry!1731 Int) (mask!4711 (_ BitVec 32)) (extraKeys!1631 (_ BitVec 32)) (zeroValue!1656 V!1163) (minValue!1656 V!1163) (_size!138 (_ BitVec 32)) (_keys!3154 array!1239) (_values!1719 array!1241) (_vacant!138 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!190 0))(
  ( (Cell!191 (v!1582 LongMapFixedSize!190)) )
))
(declare-datatypes ((tuple2!910 0))(
  ( (tuple2!911 (_1!458 Bool) (_2!458 Cell!190)) )
))
(declare-fun e!14447 () tuple2!910)

(declare-fun lt!7459 () LongMapFixedSize!190)

(assert (=> b!22245 (= e!14447 (tuple2!911 true (Cell!191 lt!7459)))))

(declare-fun mapNonEmpty!989 () Bool)

(declare-fun mapRes!989 () Bool)

(declare-fun tp!3457 () Bool)

(declare-fun e!14443 () Bool)

(assert (=> mapNonEmpty!989 (= mapRes!989 (and tp!3457 e!14443))))

(declare-fun mapValue!989 () ValueCell!302)

(declare-fun mapKey!989 () (_ BitVec 32))

(declare-fun mapRest!989 () (Array (_ BitVec 32) ValueCell!302))

(declare-datatypes ((LongMap!190 0))(
  ( (LongMap!191 (underlying!106 Cell!190)) )
))
(declare-fun thiss!938 () LongMap!190)

(assert (=> mapNonEmpty!989 (= (arr!588 (_values!1719 (v!1582 (underlying!106 thiss!938)))) (store mapRest!989 mapKey!989 mapValue!989))))

(declare-fun b!22246 () Bool)

(declare-fun e!14440 () tuple2!910)

(declare-fun e!14451 () tuple2!910)

(assert (=> b!22246 (= e!14440 e!14451)))

(declare-fun c!2683 () Bool)

(declare-fun lt!7456 () Bool)

(assert (=> b!22246 (= c!2683 (and (not lt!7456) (= (bvand (extraKeys!1631 (v!1582 (underlying!106 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!22247 () Bool)

(declare-datatypes ((tuple3!6 0))(
  ( (tuple3!7 (_1!459 Bool) (_2!459 Cell!190) (_3!3 LongMap!190)) )
))
(declare-fun e!14450 () tuple3!6)

(declare-fun lt!7460 () tuple2!910)

(assert (=> b!22247 (= e!14450 (tuple3!7 false (_2!458 lt!7460) thiss!938))))

(declare-fun b!22248 () Bool)

(declare-fun tp_is_empty!1003 () Bool)

(assert (=> b!22248 (= e!14443 tp_is_empty!1003)))

(declare-datatypes ((tuple2!912 0))(
  ( (tuple2!913 (_1!460 Bool) (_2!460 LongMapFixedSize!190)) )
))
(declare-fun call!1564 () tuple2!912)

(declare-fun lt!7452 () tuple2!912)

(declare-fun c!2684 () Bool)

(declare-fun bm!1561 () Bool)

(declare-fun update!25 (LongMapFixedSize!190 (_ BitVec 64) V!1163) tuple2!912)

(assert (=> bm!1561 (= call!1564 (update!25 (ite c!2684 (_2!460 lt!7452) lt!7459) (ite c!2684 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2683 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2684 (minValue!1656 (v!1582 (underlying!106 thiss!938))) (ite c!2683 (zeroValue!1656 (v!1582 (underlying!106 thiss!938))) (minValue!1656 (v!1582 (underlying!106 thiss!938)))))))))

(declare-fun e!14448 () Bool)

(declare-fun e!14446 () Bool)

(declare-fun array_inv!397 (array!1239) Bool)

(declare-fun array_inv!398 (array!1241) Bool)

(assert (=> b!22249 (= e!14446 (and tp!3458 tp_is_empty!1003 (array_inv!397 (_keys!3154 (v!1582 (underlying!106 thiss!938)))) (array_inv!398 (_values!1719 (v!1582 (underlying!106 thiss!938)))) e!14448))))

(declare-fun b!22250 () Bool)

(declare-fun e!14442 () Bool)

(assert (=> b!22250 (= e!14448 (and e!14442 mapRes!989))))

(declare-fun condMapEmpty!989 () Bool)

(declare-fun mapDefault!989 () ValueCell!302)

