; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3344 () Bool)

(assert start!3344)

(declare-fun b!21068 () Bool)

(declare-fun b_free!731 () Bool)

(declare-fun b_next!731 () Bool)

(assert (=> b!21068 (= b_free!731 (not b_next!731))))

(declare-fun tp!3427 () Bool)

(declare-fun b_and!1415 () Bool)

(assert (=> b!21068 (= tp!3427 b_and!1415)))

(declare-fun b!21058 () Bool)

(declare-datatypes ((V!1151 0))(
  ( (V!1152 (val!524 Int)) )
))
(declare-datatypes ((array!1219 0))(
  ( (array!1220 (arr!579 (Array (_ BitVec 32) (_ BitVec 64))) (size!672 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!298 0))(
  ( (ValueCellFull!298 (v!1567 V!1151)) (EmptyCell!298) )
))
(declare-datatypes ((array!1221 0))(
  ( (array!1222 (arr!580 (Array (_ BitVec 32) ValueCell!298)) (size!673 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!182 0))(
  ( (LongMapFixedSize!183 (defaultEntry!1716 Int) (mask!4686 (_ BitVec 32)) (extraKeys!1620 (_ BitVec 32)) (zeroValue!1644 V!1151) (minValue!1644 V!1151) (_size!131 (_ BitVec 32)) (_keys!3138 array!1219) (_values!1706 array!1221) (_vacant!131 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!182 0))(
  ( (Cell!183 (v!1568 LongMapFixedSize!182)) )
))
(declare-datatypes ((tuple2!886 0))(
  ( (tuple2!887 (_1!446 Bool) (_2!446 Cell!182)) )
))
(declare-fun e!13749 () tuple2!886)

(declare-datatypes ((tuple2!888 0))(
  ( (tuple2!889 (_1!447 Bool) (_2!447 LongMapFixedSize!182)) )
))
(declare-fun lt!6452 () tuple2!888)

(assert (=> b!21058 (= e!13749 (tuple2!887 (_1!447 lt!6452) (Cell!183 (_2!447 lt!6452))))))

(declare-fun call!1239 () tuple2!888)

(assert (=> b!21058 (= lt!6452 call!1239)))

(declare-fun b!21059 () Bool)

(declare-fun e!13753 () Bool)

(declare-fun tp_is_empty!995 () Bool)

(assert (=> b!21059 (= e!13753 tp_is_empty!995)))

(declare-fun mapNonEmpty!970 () Bool)

(declare-fun mapRes!970 () Bool)

(declare-fun tp!3426 () Bool)

(declare-fun e!13752 () Bool)

(assert (=> mapNonEmpty!970 (= mapRes!970 (and tp!3426 e!13752))))

(declare-fun mapRest!970 () (Array (_ BitVec 32) ValueCell!298))

(declare-fun mapValue!970 () ValueCell!298)

(declare-datatypes ((LongMap!182 0))(
  ( (LongMap!183 (underlying!102 Cell!182)) )
))
(declare-fun thiss!938 () LongMap!182)

(declare-fun mapKey!970 () (_ BitVec 32))

(assert (=> mapNonEmpty!970 (= (arr!580 (_values!1706 (v!1568 (underlying!102 thiss!938)))) (store mapRest!970 mapKey!970 mapValue!970))))

(declare-fun b!21060 () Bool)

(declare-fun res!13657 () Bool)

(declare-fun e!13751 () Bool)

(assert (=> b!21060 (=> (not res!13657) (not e!13751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!21060 (= res!13657 (validMask!0 (mask!4686 (v!1568 (underlying!102 thiss!938)))))))

(declare-fun b!21061 () Bool)

(assert (=> b!21061 (= e!13752 tp_is_empty!995)))

(declare-fun b!21062 () Bool)

(declare-fun e!13757 () Bool)

(assert (=> b!21062 (= e!13757 (and e!13753 mapRes!970))))

(declare-fun condMapEmpty!970 () Bool)

(declare-fun mapDefault!970 () ValueCell!298)

