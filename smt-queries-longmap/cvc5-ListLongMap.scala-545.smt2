; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14422 () Bool)

(assert start!14422)

(declare-fun b!135767 () Bool)

(declare-fun b_free!2929 () Bool)

(declare-fun b_next!2929 () Bool)

(assert (=> b!135767 (= b_free!2929 (not b_next!2929))))

(declare-fun tp!11241 () Bool)

(declare-fun b_and!8387 () Bool)

(assert (=> b!135767 (= tp!11241 b_and!8387)))

(declare-fun b!135761 () Bool)

(declare-fun b_free!2931 () Bool)

(declare-fun b_next!2931 () Bool)

(assert (=> b!135761 (= b_free!2931 (not b_next!2931))))

(declare-fun tp!11239 () Bool)

(declare-fun b_and!8389 () Bool)

(assert (=> b!135761 (= tp!11239 b_and!8389)))

(declare-fun b!135759 () Bool)

(declare-fun res!65167 () Bool)

(declare-fun e!88417 () Bool)

(assert (=> b!135759 (=> (not res!65167) (not e!88417))))

(declare-datatypes ((V!3489 0))(
  ( (V!3490 (val!1485 Int)) )
))
(declare-datatypes ((array!4791 0))(
  ( (array!4792 (arr!2265 (Array (_ BitVec 32) (_ BitVec 64))) (size!2535 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1097 0))(
  ( (ValueCellFull!1097 (v!3213 V!3489)) (EmptyCell!1097) )
))
(declare-datatypes ((array!4793 0))(
  ( (array!4794 (arr!2266 (Array (_ BitVec 32) ValueCell!1097)) (size!2536 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1102 0))(
  ( (LongMapFixedSize!1103 (defaultEntry!2885 Int) (mask!7197 (_ BitVec 32)) (extraKeys!2646 (_ BitVec 32)) (zeroValue!2738 V!3489) (minValue!2738 V!3489) (_size!600 (_ BitVec 32)) (_keys!4638 array!4791) (_values!2868 array!4793) (_vacant!600 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!892 0))(
  ( (Cell!893 (v!3214 LongMapFixedSize!1102)) )
))
(declare-datatypes ((LongMap!892 0))(
  ( (LongMap!893 (underlying!457 Cell!892)) )
))
(declare-fun thiss!992 () LongMap!892)

(assert (=> b!135759 (= res!65167 (and (= (size!2536 (_values!2868 (v!3214 (underlying!457 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7197 (v!3214 (underlying!457 thiss!992))))) (= (size!2535 (_keys!4638 (v!3214 (underlying!457 thiss!992)))) (size!2536 (_values!2868 (v!3214 (underlying!457 thiss!992))))) (bvsge (mask!7197 (v!3214 (underlying!457 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2646 (v!3214 (underlying!457 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2646 (v!3214 (underlying!457 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!135760 () Bool)

(declare-fun e!88411 () Bool)

(declare-fun e!88420 () Bool)

(declare-fun mapRes!4665 () Bool)

(assert (=> b!135760 (= e!88411 (and e!88420 mapRes!4665))))

(declare-fun condMapEmpty!4666 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1102)

(declare-fun mapDefault!4666 () ValueCell!1097)

