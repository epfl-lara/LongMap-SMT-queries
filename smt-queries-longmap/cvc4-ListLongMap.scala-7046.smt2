; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89292 () Bool)

(assert start!89292)

(declare-fun b!1023869 () Bool)

(declare-fun b_free!20333 () Bool)

(declare-fun b_next!20333 () Bool)

(assert (=> b!1023869 (= b_free!20333 (not b_next!20333))))

(declare-fun tp!72033 () Bool)

(declare-fun b_and!32577 () Bool)

(assert (=> b!1023869 (= tp!72033 b_and!32577)))

(declare-fun b!1023867 () Bool)

(declare-fun e!577032 () Bool)

(declare-fun e!577030 () Bool)

(declare-fun mapRes!37497 () Bool)

(assert (=> b!1023867 (= e!577032 (and e!577030 mapRes!37497))))

(declare-fun condMapEmpty!37497 () Bool)

(declare-datatypes ((V!36943 0))(
  ( (V!36944 (val!12077 Int)) )
))
(declare-datatypes ((ValueCell!11323 0))(
  ( (ValueCellFull!11323 (v!14646 V!36943)) (EmptyCell!11323) )
))
(declare-datatypes ((array!64150 0))(
  ( (array!64151 (arr!30887 (Array (_ BitVec 32) (_ BitVec 64))) (size!31398 (_ BitVec 32))) )
))
(declare-datatypes ((array!64152 0))(
  ( (array!64153 (arr!30888 (Array (_ BitVec 32) ValueCell!11323)) (size!31399 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5240 0))(
  ( (LongMapFixedSize!5241 (defaultEntry!5972 Int) (mask!29605 (_ BitVec 32)) (extraKeys!5704 (_ BitVec 32)) (zeroValue!5808 V!36943) (minValue!5808 V!36943) (_size!2675 (_ BitVec 32)) (_keys!11117 array!64150) (_values!5995 array!64152) (_vacant!2675 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5240)

(declare-fun mapDefault!37497 () ValueCell!11323)

