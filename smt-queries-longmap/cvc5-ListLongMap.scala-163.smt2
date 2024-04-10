; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3112 () Bool)

(assert start!3112)

(declare-fun b!18932 () Bool)

(declare-fun b_free!655 () Bool)

(declare-fun b_next!655 () Bool)

(assert (=> b!18932 (= b_free!655 (not b_next!655))))

(declare-fun tp!3159 () Bool)

(declare-fun b_and!1315 () Bool)

(assert (=> b!18932 (= tp!3159 b_and!1315)))

(declare-fun mapNonEmpty!817 () Bool)

(declare-fun mapRes!817 () Bool)

(declare-fun tp!3160 () Bool)

(declare-fun e!12124 () Bool)

(assert (=> mapNonEmpty!817 (= mapRes!817 (and tp!3160 e!12124))))

(declare-datatypes ((V!1051 0))(
  ( (V!1052 (val!486 Int)) )
))
(declare-datatypes ((ValueCell!260 0))(
  ( (ValueCellFull!260 (v!1485 V!1051)) (EmptyCell!260) )
))
(declare-fun mapValue!817 () ValueCell!260)

(declare-datatypes ((array!1045 0))(
  ( (array!1046 (arr!503 (Array (_ BitVec 32) ValueCell!260)) (size!593 (_ BitVec 32))) )
))
(declare-datatypes ((array!1047 0))(
  ( (array!1048 (arr!504 (Array (_ BitVec 32) (_ BitVec 64))) (size!594 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!106 0))(
  ( (LongMapFixedSize!107 (defaultEntry!1672 Int) (mask!4609 (_ BitVec 32)) (extraKeys!1582 (_ BitVec 32)) (zeroValue!1606 V!1051) (minValue!1606 V!1051) (_size!86 (_ BitVec 32)) (_keys!3097 array!1047) (_values!1668 array!1045) (_vacant!86 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!106 0))(
  ( (Cell!107 (v!1486 LongMapFixedSize!106)) )
))
(declare-datatypes ((LongMap!106 0))(
  ( (LongMap!107 (underlying!64 Cell!106)) )
))
(declare-fun thiss!848 () LongMap!106)

(declare-fun mapKey!817 () (_ BitVec 32))

(declare-fun mapRest!817 () (Array (_ BitVec 32) ValueCell!260))

(assert (=> mapNonEmpty!817 (= (arr!503 (_values!1668 (v!1486 (underlying!64 thiss!848)))) (store mapRest!817 mapKey!817 mapValue!817))))

(declare-fun b!18930 () Bool)

(declare-datatypes ((tuple2!804 0))(
  ( (tuple2!805 (_1!404 Bool) (_2!404 LongMap!106)) )
))
(declare-fun e!12126 () tuple2!804)

(declare-fun repack!25 (LongMap!106) tuple2!804)

(assert (=> b!18930 (= e!12126 (repack!25 thiss!848))))

(declare-fun b!18931 () Bool)

(assert (=> b!18931 (= e!12126 (tuple2!805 true thiss!848))))

(declare-fun tp_is_empty!919 () Bool)

(declare-fun e!12130 () Bool)

(declare-fun e!12127 () Bool)

(declare-fun array_inv!347 (array!1047) Bool)

(declare-fun array_inv!348 (array!1045) Bool)

(assert (=> b!18932 (= e!12130 (and tp!3159 tp_is_empty!919 (array_inv!347 (_keys!3097 (v!1486 (underlying!64 thiss!848)))) (array_inv!348 (_values!1668 (v!1486 (underlying!64 thiss!848)))) e!12127))))

(declare-fun b!18933 () Bool)

(declare-fun e!12129 () Bool)

(declare-fun e!12122 () Bool)

(assert (=> b!18933 (= e!12129 e!12122)))

(declare-fun mapIsEmpty!817 () Bool)

(assert (=> mapIsEmpty!817 mapRes!817))

(declare-fun b!18935 () Bool)

(declare-fun e!12131 () Bool)

(assert (=> b!18935 (= e!12131 tp_is_empty!919)))

(declare-fun b!18936 () Bool)

(assert (=> b!18936 (= e!12122 e!12130)))

(declare-fun b!18937 () Bool)

(assert (=> b!18937 (= e!12124 tp_is_empty!919)))

(declare-fun b!18938 () Bool)

(assert (=> b!18938 (= e!12127 (and e!12131 mapRes!817))))

(declare-fun condMapEmpty!817 () Bool)

(declare-fun mapDefault!817 () ValueCell!260)

