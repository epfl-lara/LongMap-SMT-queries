; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75862 () Bool)

(assert start!75862)

(declare-fun b!892820 () Bool)

(declare-fun b_free!15833 () Bool)

(declare-fun b_next!15833 () Bool)

(assert (=> b!892820 (= b_free!15833 (not b_next!15833))))

(declare-fun tp!55467 () Bool)

(declare-fun b_and!26089 () Bool)

(assert (=> b!892820 (= tp!55467 b_and!26089)))

(declare-fun b!892811 () Bool)

(declare-fun e!498489 () Bool)

(declare-fun e!498498 () Bool)

(declare-fun mapRes!28796 () Bool)

(assert (=> b!892811 (= e!498489 (and e!498498 mapRes!28796))))

(declare-fun condMapEmpty!28796 () Bool)

(declare-datatypes ((array!52302 0))(
  ( (array!52303 (arr!25157 (Array (_ BitVec 32) (_ BitVec 64))) (size!25601 (_ BitVec 32))) )
))
(declare-datatypes ((V!29179 0))(
  ( (V!29180 (val!9131 Int)) )
))
(declare-datatypes ((ValueCell!8599 0))(
  ( (ValueCellFull!8599 (v!11610 V!29179)) (EmptyCell!8599) )
))
(declare-datatypes ((array!52304 0))(
  ( (array!52305 (arr!25158 (Array (_ BitVec 32) ValueCell!8599)) (size!25602 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4214 0))(
  ( (LongMapFixedSize!4215 (defaultEntry!5304 Int) (mask!25821 (_ BitVec 32)) (extraKeys!4998 (_ BitVec 32)) (zeroValue!5102 V!29179) (minValue!5102 V!29179) (_size!2162 (_ BitVec 32)) (_keys!9987 array!52302) (_values!5289 array!52304) (_vacant!2162 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4214)

(declare-fun mapDefault!28796 () ValueCell!8599)

