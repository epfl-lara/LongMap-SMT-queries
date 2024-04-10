; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3472 () Bool)

(assert start!3472)

(declare-fun b!22773 () Bool)

(declare-fun b_free!751 () Bool)

(declare-fun b_next!751 () Bool)

(assert (=> b!22773 (= b_free!751 (not b_next!751))))

(declare-fun tp!3497 () Bool)

(declare-fun b_and!1469 () Bool)

(assert (=> b!22773 (= tp!3497 b_and!1469)))

(declare-fun b!22766 () Bool)

(declare-datatypes ((V!1179 0))(
  ( (V!1180 (val!534 Int)) )
))
(declare-datatypes ((ValueCell!308 0))(
  ( (ValueCellFull!308 (v!1594 V!1179)) (EmptyCell!308) )
))
(declare-datatypes ((array!1265 0))(
  ( (array!1266 (arr!599 (Array (_ BitVec 32) ValueCell!308)) (size!695 (_ BitVec 32))) )
))
(declare-datatypes ((array!1267 0))(
  ( (array!1268 (arr!600 (Array (_ BitVec 32) (_ BitVec 64))) (size!696 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!202 0))(
  ( (LongMapFixedSize!203 (defaultEntry!1738 Int) (mask!4722 (_ BitVec 32)) (extraKeys!1637 (_ BitVec 32)) (zeroValue!1662 V!1179) (minValue!1662 V!1179) (_size!145 (_ BitVec 32)) (_keys!3160 array!1267) (_values!1725 array!1265) (_vacant!145 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!938 0))(
  ( (tuple2!939 (_1!478 Bool) (_2!478 LongMapFixedSize!202)) )
))
(declare-fun lt!7908 () tuple2!938)

(declare-fun call!1735 () tuple2!938)

(assert (=> b!22766 (= lt!7908 call!1735)))

(declare-datatypes ((Cell!202 0))(
  ( (Cell!203 (v!1595 LongMapFixedSize!202)) )
))
(declare-datatypes ((tuple2!940 0))(
  ( (tuple2!941 (_1!479 Bool) (_2!479 Cell!202)) )
))
(declare-fun e!14802 () tuple2!940)

(assert (=> b!22766 (= e!14802 (tuple2!941 (_1!478 lt!7908) (Cell!203 (_2!478 lt!7908))))))

(declare-fun b!22768 () Bool)

(declare-fun e!14803 () Bool)

(declare-fun e!14798 () Bool)

(assert (=> b!22768 (= e!14803 e!14798)))

(declare-fun b!22769 () Bool)

(declare-fun e!14799 () tuple2!940)

(declare-fun lt!7906 () LongMapFixedSize!202)

(assert (=> b!22769 (= e!14799 (tuple2!941 true (Cell!203 lt!7906)))))

(declare-fun mapNonEmpty!1010 () Bool)

(declare-fun mapRes!1010 () Bool)

(declare-fun tp!3496 () Bool)

(declare-fun e!14797 () Bool)

(assert (=> mapNonEmpty!1010 (= mapRes!1010 (and tp!3496 e!14797))))

(declare-fun mapKey!1010 () (_ BitVec 32))

(declare-fun mapValue!1010 () ValueCell!308)

(declare-fun mapRest!1010 () (Array (_ BitVec 32) ValueCell!308))

(declare-datatypes ((LongMap!202 0))(
  ( (LongMap!203 (underlying!112 Cell!202)) )
))
(declare-fun thiss!938 () LongMap!202)

(assert (=> mapNonEmpty!1010 (= (arr!599 (_values!1725 (v!1595 (underlying!112 thiss!938)))) (store mapRest!1010 mapKey!1010 mapValue!1010))))

(declare-fun b!22770 () Bool)

(declare-fun e!14800 () Bool)

(declare-fun e!14806 () Bool)

(assert (=> b!22770 (= e!14800 (and e!14806 mapRes!1010))))

(declare-fun condMapEmpty!1010 () Bool)

(declare-fun mapDefault!1010 () ValueCell!308)

