; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89486 () Bool)

(assert start!89486)

(declare-fun b!1026236 () Bool)

(declare-fun b_free!20485 () Bool)

(declare-fun b_next!20485 () Bool)

(assert (=> b!1026236 (= b_free!20485 (not b_next!20485))))

(declare-fun tp!72500 () Bool)

(declare-fun b_and!32731 () Bool)

(assert (=> b!1026236 (= tp!72500 b_and!32731)))

(declare-fun res!686989 () Bool)

(declare-fun e!578874 () Bool)

(assert (=> start!89486 (=> (not res!686989) (not e!578874))))

(declare-datatypes ((V!37147 0))(
  ( (V!37148 (val!12153 Int)) )
))
(declare-datatypes ((ValueCell!11399 0))(
  ( (ValueCellFull!11399 (v!14722 V!37147)) (EmptyCell!11399) )
))
(declare-datatypes ((array!64460 0))(
  ( (array!64461 (arr!31039 (Array (_ BitVec 32) (_ BitVec 64))) (size!31552 (_ BitVec 32))) )
))
(declare-datatypes ((array!64462 0))(
  ( (array!64463 (arr!31040 (Array (_ BitVec 32) ValueCell!11399)) (size!31553 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5392 0))(
  ( (LongMapFixedSize!5393 (defaultEntry!6048 Int) (mask!29738 (_ BitVec 32)) (extraKeys!5780 (_ BitVec 32)) (zeroValue!5884 V!37147) (minValue!5884 V!37147) (_size!2751 (_ BitVec 32)) (_keys!11195 array!64460) (_values!6071 array!64462) (_vacant!2751 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5392)

(declare-fun valid!2048 (LongMapFixedSize!5392) Bool)

(assert (=> start!89486 (= res!686989 (valid!2048 thiss!1427))))

(assert (=> start!89486 e!578874))

(declare-fun e!578875 () Bool)

(assert (=> start!89486 e!578875))

(assert (=> start!89486 true))

(declare-fun b!1026235 () Bool)

(declare-fun e!578878 () Bool)

(declare-fun e!578876 () Bool)

(declare-fun mapRes!37736 () Bool)

(assert (=> b!1026235 (= e!578878 (and e!578876 mapRes!37736))))

(declare-fun condMapEmpty!37736 () Bool)

(declare-fun mapDefault!37736 () ValueCell!11399)

