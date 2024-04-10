; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76876 () Bool)

(assert start!76876)

(declare-fun b!898839 () Bool)

(declare-fun b_free!16021 () Bool)

(declare-fun b_next!16021 () Bool)

(assert (=> b!898839 (= b_free!16021 (not b_next!16021))))

(declare-fun tp!56135 () Bool)

(declare-fun b_and!26321 () Bool)

(assert (=> b!898839 (= tp!56135 b_and!26321)))

(declare-fun mapIsEmpty!29182 () Bool)

(declare-fun mapRes!29182 () Bool)

(assert (=> mapIsEmpty!29182 mapRes!29182))

(declare-fun b!898835 () Bool)

(declare-fun e!502848 () Bool)

(declare-fun e!502843 () Bool)

(assert (=> b!898835 (= e!502848 (and e!502843 mapRes!29182))))

(declare-fun condMapEmpty!29182 () Bool)

(declare-datatypes ((array!52738 0))(
  ( (array!52739 (arr!25345 (Array (_ BitVec 32) (_ BitVec 64))) (size!25801 (_ BitVec 32))) )
))
(declare-datatypes ((V!29431 0))(
  ( (V!29432 (val!9225 Int)) )
))
(declare-datatypes ((ValueCell!8693 0))(
  ( (ValueCellFull!8693 (v!11717 V!29431)) (EmptyCell!8693) )
))
(declare-datatypes ((array!52740 0))(
  ( (array!52741 (arr!25346 (Array (_ BitVec 32) ValueCell!8693)) (size!25802 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4402 0))(
  ( (LongMapFixedSize!4403 (defaultEntry!5419 Int) (mask!26160 (_ BitVec 32)) (extraKeys!5137 (_ BitVec 32)) (zeroValue!5241 V!29431) (minValue!5241 V!29431) (_size!2256 (_ BitVec 32)) (_keys!10200 array!52738) (_values!5428 array!52740) (_vacant!2256 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4402)

(declare-fun mapDefault!29182 () ValueCell!8693)

