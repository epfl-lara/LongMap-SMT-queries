; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76142 () Bool)

(assert start!76142)

(declare-fun b!894496 () Bool)

(declare-fun b_free!15871 () Bool)

(declare-fun b_next!15871 () Bool)

(assert (=> b!894496 (= b_free!15871 (not b_next!15871))))

(declare-fun tp!55601 () Bool)

(declare-fun b_and!26163 () Bool)

(assert (=> b!894496 (= tp!55601 b_and!26163)))

(declare-fun b!894492 () Bool)

(declare-fun e!499621 () Bool)

(declare-datatypes ((array!52388 0))(
  ( (array!52389 (arr!25195 (Array (_ BitVec 32) (_ BitVec 64))) (size!25641 (_ BitVec 32))) )
))
(declare-datatypes ((V!29231 0))(
  ( (V!29232 (val!9150 Int)) )
))
(declare-datatypes ((ValueCell!8618 0))(
  ( (ValueCellFull!8618 (v!11640 V!29231)) (EmptyCell!8618) )
))
(declare-datatypes ((array!52390 0))(
  ( (array!52391 (arr!25196 (Array (_ BitVec 32) ValueCell!8618)) (size!25642 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4252 0))(
  ( (LongMapFixedSize!4253 (defaultEntry!5338 Int) (mask!25897 (_ BitVec 32)) (extraKeys!5034 (_ BitVec 32)) (zeroValue!5138 V!29231) (minValue!5138 V!29231) (_size!2181 (_ BitVec 32)) (_keys!10035 array!52388) (_values!5325 array!52390) (_vacant!2181 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4252)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!894492 (= e!499621 (not (validMask!0 (mask!25897 thiss!1181))))))

(declare-datatypes ((SeekEntryResult!8866 0))(
  ( (MissingZero!8866 (index!37835 (_ BitVec 32))) (Found!8866 (index!37836 (_ BitVec 32))) (Intermediate!8866 (undefined!9678 Bool) (index!37837 (_ BitVec 32)) (x!76046 (_ BitVec 32))) (Undefined!8866) (MissingVacant!8866 (index!37838 (_ BitVec 32))) )
))
(declare-fun lt!404287 () SeekEntryResult!8866)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52388 (_ BitVec 32)) SeekEntryResult!8866)

(assert (=> b!894492 (= lt!404287 (seekEntry!0 key!785 (_keys!10035 thiss!1181) (mask!25897 thiss!1181)))))

(declare-fun b!894493 () Bool)

(declare-fun e!499623 () Bool)

(declare-fun e!499624 () Bool)

(declare-fun mapRes!28872 () Bool)

(assert (=> b!894493 (= e!499623 (and e!499624 mapRes!28872))))

(declare-fun condMapEmpty!28872 () Bool)

(declare-fun mapDefault!28872 () ValueCell!8618)

