; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76470 () Bool)

(assert start!76470)

(declare-fun b!896524 () Bool)

(declare-fun b_free!15955 () Bool)

(declare-fun b_next!15955 () Bool)

(assert (=> b!896524 (= b_free!15955 (not b_next!15955))))

(declare-fun tp!55900 () Bool)

(declare-fun b_and!26247 () Bool)

(assert (=> b!896524 (= tp!55900 b_and!26247)))

(declare-fun b!896519 () Bool)

(declare-fun e!501131 () Bool)

(declare-fun e!501137 () Bool)

(assert (=> b!896519 (= e!501131 e!501137)))

(declare-fun res!606187 () Bool)

(assert (=> b!896519 (=> res!606187 e!501137)))

(declare-datatypes ((array!52584 0))(
  ( (array!52585 (arr!25279 (Array (_ BitVec 32) (_ BitVec 64))) (size!25730 (_ BitVec 32))) )
))
(declare-datatypes ((V!29343 0))(
  ( (V!29344 (val!9192 Int)) )
))
(declare-datatypes ((ValueCell!8660 0))(
  ( (ValueCellFull!8660 (v!11682 V!29343)) (EmptyCell!8660) )
))
(declare-datatypes ((array!52586 0))(
  ( (array!52587 (arr!25280 (Array (_ BitVec 32) ValueCell!8660)) (size!25731 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4336 0))(
  ( (LongMapFixedSize!4337 (defaultEntry!5380 Int) (mask!26026 (_ BitVec 32)) (extraKeys!5082 (_ BitVec 32)) (zeroValue!5186 V!29343) (minValue!5186 V!29343) (_size!2223 (_ BitVec 32)) (_keys!10115 array!52584) (_values!5373 array!52586) (_vacant!2223 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4336)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896519 (= res!606187 (not (validMask!0 (mask!26026 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896519 (arrayContainsKey!0 (_keys!10115 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30488 0))(
  ( (Unit!30489) )
))
(declare-fun lt!404852 () Unit!30488)

(declare-datatypes ((SeekEntryResult!8899 0))(
  ( (MissingZero!8899 (index!37967 (_ BitVec 32))) (Found!8899 (index!37968 (_ BitVec 32))) (Intermediate!8899 (undefined!9711 Bool) (index!37969 (_ BitVec 32)) (x!76348 (_ BitVec 32))) (Undefined!8899) (MissingVacant!8899 (index!37970 (_ BitVec 32))) )
))
(declare-fun lt!404853 () SeekEntryResult!8899)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52584 (_ BitVec 64) (_ BitVec 32)) Unit!30488)

(assert (=> b!896519 (= lt!404852 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10115 thiss!1181) key!785 (index!37968 lt!404853)))))

(declare-fun mapNonEmpty!29045 () Bool)

(declare-fun mapRes!29045 () Bool)

(declare-fun tp!55899 () Bool)

(declare-fun e!501139 () Bool)

(assert (=> mapNonEmpty!29045 (= mapRes!29045 (and tp!55899 e!501139))))

(declare-fun mapRest!29045 () (Array (_ BitVec 32) ValueCell!8660))

(declare-fun mapValue!29045 () ValueCell!8660)

(declare-fun mapKey!29045 () (_ BitVec 32))

(assert (=> mapNonEmpty!29045 (= (arr!25280 (_values!5373 thiss!1181)) (store mapRest!29045 mapKey!29045 mapValue!29045))))

(declare-fun res!606188 () Bool)

(declare-fun e!501136 () Bool)

(assert (=> start!76470 (=> (not res!606188) (not e!501136))))

(declare-fun valid!1673 (LongMapFixedSize!4336) Bool)

(assert (=> start!76470 (= res!606188 (valid!1673 thiss!1181))))

(assert (=> start!76470 e!501136))

(declare-fun e!501135 () Bool)

(assert (=> start!76470 e!501135))

(assert (=> start!76470 true))

(declare-fun mapIsEmpty!29045 () Bool)

(assert (=> mapIsEmpty!29045 mapRes!29045))

(declare-fun b!896520 () Bool)

(assert (=> b!896520 (= e!501137 (= (size!25731 (_values!5373 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26026 thiss!1181))))))

(declare-fun b!896521 () Bool)

(declare-fun e!501132 () Bool)

(declare-fun e!501138 () Bool)

(assert (=> b!896521 (= e!501132 (and e!501138 mapRes!29045))))

(declare-fun condMapEmpty!29045 () Bool)

(declare-fun mapDefault!29045 () ValueCell!8660)

