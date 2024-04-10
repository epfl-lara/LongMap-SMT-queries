; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75708 () Bool)

(assert start!75708)

(declare-fun b!890137 () Bool)

(declare-fun b_free!15679 () Bool)

(declare-fun b_next!15679 () Bool)

(assert (=> b!890137 (= b_free!15679 (not b_next!15679))))

(declare-fun tp!55006 () Bool)

(declare-fun b_and!25919 () Bool)

(assert (=> b!890137 (= tp!55006 b_and!25919)))

(declare-fun mapNonEmpty!28565 () Bool)

(declare-fun mapRes!28565 () Bool)

(declare-fun tp!55005 () Bool)

(declare-fun e!496362 () Bool)

(assert (=> mapNonEmpty!28565 (= mapRes!28565 (and tp!55005 e!496362))))

(declare-datatypes ((V!28975 0))(
  ( (V!28976 (val!9054 Int)) )
))
(declare-datatypes ((ValueCell!8522 0))(
  ( (ValueCellFull!8522 (v!11532 V!28975)) (EmptyCell!8522) )
))
(declare-fun mapValue!28565 () ValueCell!8522)

(declare-fun mapKey!28565 () (_ BitVec 32))

(declare-datatypes ((array!51994 0))(
  ( (array!51995 (arr!25003 (Array (_ BitVec 32) (_ BitVec 64))) (size!25447 (_ BitVec 32))) )
))
(declare-datatypes ((array!51996 0))(
  ( (array!51997 (arr!25004 (Array (_ BitVec 32) ValueCell!8522)) (size!25448 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4060 0))(
  ( (LongMapFixedSize!4061 (defaultEntry!5227 Int) (mask!25694 (_ BitVec 32)) (extraKeys!4921 (_ BitVec 32)) (zeroValue!5025 V!28975) (minValue!5025 V!28975) (_size!2085 (_ BitVec 32)) (_keys!9910 array!51994) (_values!5212 array!51996) (_vacant!2085 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4060)

(declare-fun mapRest!28565 () (Array (_ BitVec 32) ValueCell!8522))

(assert (=> mapNonEmpty!28565 (= (arr!25004 (_values!5212 thiss!1181)) (store mapRest!28565 mapKey!28565 mapValue!28565))))

(declare-fun mapIsEmpty!28565 () Bool)

(assert (=> mapIsEmpty!28565 mapRes!28565))

(declare-fun b!890133 () Bool)

(declare-fun e!496361 () Bool)

(declare-fun tp_is_empty!18007 () Bool)

(assert (=> b!890133 (= e!496361 tp_is_empty!18007)))

(declare-fun b!890134 () Bool)

(declare-fun e!496358 () Bool)

(assert (=> b!890134 (= e!496358 (and e!496361 mapRes!28565))))

(declare-fun condMapEmpty!28565 () Bool)

(declare-fun mapDefault!28565 () ValueCell!8522)

