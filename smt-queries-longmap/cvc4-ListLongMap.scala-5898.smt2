; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76222 () Bool)

(assert start!76222)

(declare-fun b!895023 () Bool)

(declare-fun b_free!15893 () Bool)

(declare-fun b_next!15893 () Bool)

(assert (=> b!895023 (= b_free!15893 (not b_next!15893))))

(declare-fun tp!55677 () Bool)

(declare-fun b_and!26185 () Bool)

(assert (=> b!895023 (= tp!55677 b_and!26185)))

(declare-fun b!895017 () Bool)

(declare-fun e!500011 () Bool)

(declare-fun e!500012 () Bool)

(declare-fun mapRes!28916 () Bool)

(assert (=> b!895017 (= e!500011 (and e!500012 mapRes!28916))))

(declare-fun condMapEmpty!28916 () Bool)

(declare-datatypes ((array!52438 0))(
  ( (array!52439 (arr!25217 (Array (_ BitVec 32) (_ BitVec 64))) (size!25665 (_ BitVec 32))) )
))
(declare-datatypes ((V!29259 0))(
  ( (V!29260 (val!9161 Int)) )
))
(declare-datatypes ((ValueCell!8629 0))(
  ( (ValueCellFull!8629 (v!11651 V!29259)) (EmptyCell!8629) )
))
(declare-datatypes ((array!52440 0))(
  ( (array!52441 (arr!25218 (Array (_ BitVec 32) ValueCell!8629)) (size!25666 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4274 0))(
  ( (LongMapFixedSize!4275 (defaultEntry!5349 Int) (mask!25928 (_ BitVec 32)) (extraKeys!5045 (_ BitVec 32)) (zeroValue!5149 V!29259) (minValue!5149 V!29259) (_size!2192 (_ BitVec 32)) (_keys!10055 array!52438) (_values!5336 array!52440) (_vacant!2192 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4274)

(declare-fun mapDefault!28916 () ValueCell!8629)

