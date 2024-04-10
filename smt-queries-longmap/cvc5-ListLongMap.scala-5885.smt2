; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75840 () Bool)

(assert start!75840)

(declare-fun b!892350 () Bool)

(declare-fun b_free!15811 () Bool)

(declare-fun b_next!15811 () Bool)

(assert (=> b!892350 (= b_free!15811 (not b_next!15811))))

(declare-fun tp!55401 () Bool)

(declare-fun b_and!26051 () Bool)

(assert (=> b!892350 (= tp!55401 b_and!26051)))

(declare-fun b!892339 () Bool)

(declare-fun e!498114 () Bool)

(declare-fun tp_is_empty!18139 () Bool)

(assert (=> b!892339 (= e!498114 tp_is_empty!18139)))

(declare-fun mapNonEmpty!28763 () Bool)

(declare-fun mapRes!28763 () Bool)

(declare-fun tp!55402 () Bool)

(assert (=> mapNonEmpty!28763 (= mapRes!28763 (and tp!55402 e!498114))))

(declare-fun mapKey!28763 () (_ BitVec 32))

(declare-datatypes ((array!52258 0))(
  ( (array!52259 (arr!25135 (Array (_ BitVec 32) (_ BitVec 64))) (size!25579 (_ BitVec 32))) )
))
(declare-datatypes ((V!29151 0))(
  ( (V!29152 (val!9120 Int)) )
))
(declare-datatypes ((ValueCell!8588 0))(
  ( (ValueCellFull!8588 (v!11598 V!29151)) (EmptyCell!8588) )
))
(declare-datatypes ((array!52260 0))(
  ( (array!52261 (arr!25136 (Array (_ BitVec 32) ValueCell!8588)) (size!25580 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4192 0))(
  ( (LongMapFixedSize!4193 (defaultEntry!5293 Int) (mask!25804 (_ BitVec 32)) (extraKeys!4987 (_ BitVec 32)) (zeroValue!5091 V!29151) (minValue!5091 V!29151) (_size!2151 (_ BitVec 32)) (_keys!9976 array!52258) (_values!5278 array!52260) (_vacant!2151 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4192)

(declare-fun mapRest!28763 () (Array (_ BitVec 32) ValueCell!8588))

(declare-fun mapValue!28763 () ValueCell!8588)

(assert (=> mapNonEmpty!28763 (= (arr!25136 (_values!5278 thiss!1181)) (store mapRest!28763 mapKey!28763 mapValue!28763))))

(declare-fun mapIsEmpty!28763 () Bool)

(assert (=> mapIsEmpty!28763 mapRes!28763))

(declare-fun b!892340 () Bool)

(declare-fun e!498113 () Bool)

(declare-fun e!498107 () Bool)

(assert (=> b!892340 (= e!498113 (not e!498107))))

(declare-fun res!604567 () Bool)

(assert (=> b!892340 (=> res!604567 e!498107)))

(declare-datatypes ((SeekEntryResult!8845 0))(
  ( (MissingZero!8845 (index!37751 (_ BitVec 32))) (Found!8845 (index!37752 (_ BitVec 32))) (Intermediate!8845 (undefined!9657 Bool) (index!37753 (_ BitVec 32)) (x!75837 (_ BitVec 32))) (Undefined!8845) (MissingVacant!8845 (index!37754 (_ BitVec 32))) )
))
(declare-fun lt!403144 () SeekEntryResult!8845)

(assert (=> b!892340 (= res!604567 (not (is-Found!8845 lt!403144)))))

(declare-fun e!498112 () Bool)

(assert (=> b!892340 e!498112))

(declare-fun res!604565 () Bool)

(assert (=> b!892340 (=> res!604565 e!498112)))

(assert (=> b!892340 (= res!604565 (not (is-Found!8845 lt!403144)))))

(declare-datatypes ((Unit!30386 0))(
  ( (Unit!30387) )
))
(declare-fun lt!403143 () Unit!30386)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!45 (array!52258 array!52260 (_ BitVec 32) (_ BitVec 32) V!29151 V!29151 (_ BitVec 64)) Unit!30386)

(assert (=> b!892340 (= lt!403143 (lemmaSeekEntryGivesInRangeIndex!45 (_keys!9976 thiss!1181) (_values!5278 thiss!1181) (mask!25804 thiss!1181) (extraKeys!4987 thiss!1181) (zeroValue!5091 thiss!1181) (minValue!5091 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52258 (_ BitVec 32)) SeekEntryResult!8845)

(assert (=> b!892340 (= lt!403144 (seekEntry!0 key!785 (_keys!9976 thiss!1181) (mask!25804 thiss!1181)))))

(declare-fun b!892341 () Bool)

(declare-fun e!498109 () Bool)

(declare-fun e!498110 () Bool)

(assert (=> b!892341 (= e!498109 (and e!498110 mapRes!28763))))

(declare-fun condMapEmpty!28763 () Bool)

(declare-fun mapDefault!28763 () ValueCell!8588)

