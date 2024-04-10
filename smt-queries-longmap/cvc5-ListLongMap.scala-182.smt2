; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3652 () Bool)

(assert start!3652)

(declare-fun b!25382 () Bool)

(declare-fun b_free!769 () Bool)

(declare-fun b_next!769 () Bool)

(assert (=> b!25382 (= b_free!769 (not b_next!769))))

(declare-fun tp!3562 () Bool)

(declare-fun b_and!1567 () Bool)

(assert (=> b!25382 (= tp!3562 b_and!1567)))

(declare-fun mapIsEmpty!1048 () Bool)

(declare-fun mapRes!1048 () Bool)

(assert (=> mapIsEmpty!1048 mapRes!1048))

(declare-fun b!25377 () Bool)

(declare-datatypes ((V!1203 0))(
  ( (V!1204 (val!543 Int)) )
))
(declare-datatypes ((array!1307 0))(
  ( (array!1308 (arr!617 (Array (_ BitVec 32) (_ BitVec 64))) (size!718 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!317 0))(
  ( (ValueCellFull!317 (v!1624 V!1203)) (EmptyCell!317) )
))
(declare-datatypes ((array!1309 0))(
  ( (array!1310 (arr!618 (Array (_ BitVec 32) ValueCell!317)) (size!719 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!220 0))(
  ( (LongMapFixedSize!221 (defaultEntry!1768 Int) (mask!4770 (_ BitVec 32)) (extraKeys!1660 (_ BitVec 32)) (zeroValue!1687 V!1203) (minValue!1687 V!1203) (_size!158 (_ BitVec 32)) (_keys!3193 array!1307) (_values!1752 array!1309) (_vacant!158 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!220 0))(
  ( (Cell!221 (v!1625 LongMapFixedSize!220)) )
))
(declare-datatypes ((tuple2!980 0))(
  ( (tuple2!981 (_1!499 Bool) (_2!499 Cell!220)) )
))
(declare-fun e!16409 () tuple2!980)

(declare-fun e!16413 () tuple2!980)

(assert (=> b!25377 (= e!16409 e!16413)))

(declare-fun c!3530 () Bool)

(declare-fun lt!9934 () Bool)

(declare-datatypes ((LongMap!220 0))(
  ( (LongMap!221 (underlying!121 Cell!220)) )
))
(declare-fun thiss!938 () LongMap!220)

(assert (=> b!25377 (= c!3530 (and (not lt!9934) (= (bvand (extraKeys!1660 (v!1625 (underlying!121 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!15269 () Bool)

(declare-fun e!16408 () Bool)

(assert (=> start!3652 (=> (not res!15269) (not e!16408))))

(declare-fun valid!108 (LongMap!220) Bool)

(assert (=> start!3652 (= res!15269 (valid!108 thiss!938))))

(assert (=> start!3652 e!16408))

(declare-fun e!16407 () Bool)

(assert (=> start!3652 e!16407))

(declare-fun b!25378 () Bool)

(declare-fun e!16417 () tuple2!980)

(declare-fun lt!9932 () LongMapFixedSize!220)

(assert (=> b!25378 (= e!16417 (tuple2!981 true (Cell!221 lt!9932)))))

(declare-fun b!25379 () Bool)

(declare-fun c!3531 () Bool)

(assert (=> b!25379 (= c!3531 (and (not (= (bvand (extraKeys!1660 (v!1625 (underlying!121 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!9934))))

(assert (=> b!25379 (= e!16413 e!16417)))

(declare-fun b!25380 () Bool)

(declare-fun e!16418 () Bool)

(declare-fun tp_is_empty!1033 () Bool)

(assert (=> b!25380 (= e!16418 tp_is_empty!1033)))

(declare-fun bm!2338 () Bool)

(declare-datatypes ((tuple2!982 0))(
  ( (tuple2!983 (_1!500 Bool) (_2!500 LongMapFixedSize!220)) )
))
(declare-fun call!2341 () tuple2!982)

(declare-fun call!2342 () tuple2!982)

(assert (=> bm!2338 (= call!2341 call!2342)))

(declare-fun b!25381 () Bool)

(declare-fun e!16415 () Bool)

(assert (=> b!25381 (= e!16407 e!16415)))

(declare-fun e!16411 () Bool)

(declare-fun e!16414 () Bool)

(declare-fun array_inv!415 (array!1307) Bool)

(declare-fun array_inv!416 (array!1309) Bool)

(assert (=> b!25382 (= e!16411 (and tp!3562 tp_is_empty!1033 (array_inv!415 (_keys!3193 (v!1625 (underlying!121 thiss!938)))) (array_inv!416 (_values!1752 (v!1625 (underlying!121 thiss!938)))) e!16414))))

(declare-fun c!3528 () Bool)

(declare-fun bm!2339 () Bool)

(declare-fun update!34 (LongMapFixedSize!220 (_ BitVec 64) V!1203) tuple2!982)

(assert (=> bm!2339 (= call!2342 (update!34 lt!9932 (ite (or c!3528 c!3530) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!3528 c!3530) (zeroValue!1687 (v!1625 (underlying!121 thiss!938))) (minValue!1687 (v!1625 (underlying!121 thiss!938))))))))

(declare-fun mapNonEmpty!1048 () Bool)

(declare-fun tp!3561 () Bool)

(declare-fun e!16410 () Bool)

(assert (=> mapNonEmpty!1048 (= mapRes!1048 (and tp!3561 e!16410))))

(declare-fun mapKey!1048 () (_ BitVec 32))

(declare-fun mapRest!1048 () (Array (_ BitVec 32) ValueCell!317))

(declare-fun mapValue!1048 () ValueCell!317)

(assert (=> mapNonEmpty!1048 (= (arr!618 (_values!1752 (v!1625 (underlying!121 thiss!938)))) (store mapRest!1048 mapKey!1048 mapValue!1048))))

(declare-fun b!25383 () Bool)

(assert (=> b!25383 (= e!16414 (and e!16418 mapRes!1048))))

(declare-fun condMapEmpty!1048 () Bool)

(declare-fun mapDefault!1048 () ValueCell!317)

