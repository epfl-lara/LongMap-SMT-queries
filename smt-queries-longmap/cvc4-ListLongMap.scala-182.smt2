; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3656 () Bool)

(assert start!3656)

(declare-fun b!25475 () Bool)

(declare-fun b_free!773 () Bool)

(declare-fun b_next!773 () Bool)

(assert (=> b!25475 (= b_free!773 (not b_next!773))))

(declare-fun tp!3573 () Bool)

(declare-fun b_and!1571 () Bool)

(assert (=> b!25475 (= tp!3573 b_and!1571)))

(declare-fun mapNonEmpty!1054 () Bool)

(declare-fun mapRes!1054 () Bool)

(declare-fun tp!3574 () Bool)

(declare-fun e!16485 () Bool)

(assert (=> mapNonEmpty!1054 (= mapRes!1054 (and tp!3574 e!16485))))

(declare-datatypes ((V!1207 0))(
  ( (V!1208 (val!545 Int)) )
))
(declare-datatypes ((ValueCell!319 0))(
  ( (ValueCellFull!319 (v!1628 V!1207)) (EmptyCell!319) )
))
(declare-fun mapRest!1054 () (Array (_ BitVec 32) ValueCell!319))

(declare-fun mapKey!1054 () (_ BitVec 32))

(declare-fun mapValue!1054 () ValueCell!319)

(declare-datatypes ((array!1315 0))(
  ( (array!1316 (arr!621 (Array (_ BitVec 32) ValueCell!319)) (size!722 (_ BitVec 32))) )
))
(declare-datatypes ((array!1317 0))(
  ( (array!1318 (arr!622 (Array (_ BitVec 32) (_ BitVec 64))) (size!723 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!224 0))(
  ( (LongMapFixedSize!225 (defaultEntry!1770 Int) (mask!4772 (_ BitVec 32)) (extraKeys!1662 (_ BitVec 32)) (zeroValue!1689 V!1207) (minValue!1689 V!1207) (_size!160 (_ BitVec 32)) (_keys!3195 array!1317) (_values!1754 array!1315) (_vacant!160 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!224 0))(
  ( (Cell!225 (v!1629 LongMapFixedSize!224)) )
))
(declare-datatypes ((LongMap!224 0))(
  ( (LongMap!225 (underlying!123 Cell!224)) )
))
(declare-fun thiss!938 () LongMap!224)

(assert (=> mapNonEmpty!1054 (= (arr!621 (_values!1754 (v!1629 (underlying!123 thiss!938)))) (store mapRest!1054 mapKey!1054 mapValue!1054))))

(declare-fun b!25473 () Bool)

(declare-fun e!16489 () Bool)

(declare-fun tp_is_empty!1037 () Bool)

(assert (=> b!25473 (= e!16489 tp_is_empty!1037)))

(declare-fun b!25474 () Bool)

(declare-fun e!16486 () Bool)

(declare-datatypes ((tuple3!20 0))(
  ( (tuple3!21 (_1!505 Bool) (_2!505 Cell!224) (_3!10 LongMap!224)) )
))
(declare-fun lt!9994 () tuple3!20)

(declare-datatypes ((tuple2!990 0))(
  ( (tuple2!991 (_1!506 (_ BitVec 64)) (_2!506 V!1207)) )
))
(declare-datatypes ((List!573 0))(
  ( (Nil!570) (Cons!569 (h!1136 tuple2!990) (t!3258 List!573)) )
))
(declare-datatypes ((ListLongMap!573 0))(
  ( (ListLongMap!574 (toList!302 List!573)) )
))
(declare-fun map!414 (LongMap!224) ListLongMap!573)

(assert (=> b!25474 (= e!16486 (not (= (map!414 (_3!10 lt!9994)) (map!414 thiss!938))))))

(declare-fun e!16492 () Bool)

(declare-fun e!16496 () Bool)

(declare-fun array_inv!419 (array!1317) Bool)

(declare-fun array_inv!420 (array!1315) Bool)

(assert (=> b!25475 (= e!16496 (and tp!3573 tp_is_empty!1037 (array_inv!419 (_keys!3195 (v!1629 (underlying!123 thiss!938)))) (array_inv!420 (_values!1754 (v!1629 (underlying!123 thiss!938)))) e!16492))))

(declare-datatypes ((tuple2!992 0))(
  ( (tuple2!993 (_1!507 Bool) (_2!507 LongMapFixedSize!224)) )
))
(declare-fun lt!9992 () tuple2!992)

(declare-fun bm!2350 () Bool)

(declare-fun c!3553 () Bool)

(declare-fun call!2354 () tuple2!992)

(declare-fun lt!9996 () LongMapFixedSize!224)

(declare-fun c!3552 () Bool)

(declare-fun update!36 (LongMapFixedSize!224 (_ BitVec 64) V!1207) tuple2!992)

(assert (=> bm!2350 (= call!2354 (update!36 (ite c!3553 (_2!507 lt!9992) lt!9996) (ite c!3553 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!3552 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!3553 (minValue!1689 (v!1629 (underlying!123 thiss!938))) (ite c!3552 (zeroValue!1689 (v!1629 (underlying!123 thiss!938))) (minValue!1689 (v!1629 (underlying!123 thiss!938)))))))))

(declare-fun b!25476 () Bool)

(declare-fun lt!10000 () tuple2!992)

(declare-fun call!2353 () tuple2!992)

(assert (=> b!25476 (= lt!10000 call!2353)))

(declare-datatypes ((tuple2!994 0))(
  ( (tuple2!995 (_1!508 Bool) (_2!508 Cell!224)) )
))
(declare-fun e!16484 () tuple2!994)

(assert (=> b!25476 (= e!16484 (tuple2!995 (_1!507 lt!10000) (Cell!225 (_2!507 lt!10000))))))

(declare-fun res!15281 () Bool)

(declare-fun e!16493 () Bool)

(assert (=> start!3656 (=> (not res!15281) (not e!16493))))

(declare-fun valid!110 (LongMap!224) Bool)

(assert (=> start!3656 (= res!15281 (valid!110 thiss!938))))

(assert (=> start!3656 e!16493))

(declare-fun e!16495 () Bool)

(assert (=> start!3656 e!16495))

(declare-fun b!25477 () Bool)

(declare-fun e!16488 () tuple2!994)

(declare-fun lt!9998 () tuple2!992)

(assert (=> b!25477 (= e!16488 (tuple2!995 (_1!507 lt!9998) (Cell!225 (_2!507 lt!9998))))))

(assert (=> b!25477 (= lt!9998 call!2353)))

(declare-fun mapIsEmpty!1054 () Bool)

(assert (=> mapIsEmpty!1054 mapRes!1054))

(declare-fun b!25478 () Bool)

(declare-fun e!16487 () tuple2!994)

(assert (=> b!25478 (= e!16487 e!16484)))

(declare-fun lt!9999 () Bool)

(assert (=> b!25478 (= c!3552 (and (not lt!9999) (= (bvand (extraKeys!1662 (v!1629 (underlying!123 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2351 () Bool)

(assert (=> bm!2351 (= call!2353 call!2354)))

(declare-fun b!25479 () Bool)

(assert (=> b!25479 (= e!16485 tp_is_empty!1037)))

(declare-fun b!25480 () Bool)

(assert (=> b!25480 (= e!16492 (and e!16489 mapRes!1054))))

(declare-fun condMapEmpty!1054 () Bool)

(declare-fun mapDefault!1054 () ValueCell!319)

