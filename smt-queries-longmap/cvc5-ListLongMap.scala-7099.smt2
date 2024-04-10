; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90040 () Bool)

(assert start!90040)

(declare-fun b!1031168 () Bool)

(declare-fun b_free!20647 () Bool)

(declare-fun b_next!20647 () Bool)

(assert (=> b!1031168 (= b_free!20647 (not b_next!20647))))

(declare-fun tp!73012 () Bool)

(declare-fun b_and!33061 () Bool)

(assert (=> b!1031168 (= tp!73012 b_and!33061)))

(declare-fun b!1031167 () Bool)

(declare-fun res!689487 () Bool)

(declare-fun e!582375 () Bool)

(assert (=> b!1031167 (=> res!689487 e!582375)))

(declare-datatypes ((V!37363 0))(
  ( (V!37364 (val!12234 Int)) )
))
(declare-datatypes ((ValueCell!11480 0))(
  ( (ValueCellFull!11480 (v!14811 V!37363)) (EmptyCell!11480) )
))
(declare-datatypes ((Unit!33707 0))(
  ( (Unit!33708) )
))
(declare-datatypes ((array!64798 0))(
  ( (array!64799 (arr!31201 (Array (_ BitVec 32) (_ BitVec 64))) (size!31718 (_ BitVec 32))) )
))
(declare-datatypes ((array!64800 0))(
  ( (array!64801 (arr!31202 (Array (_ BitVec 32) ValueCell!11480)) (size!31719 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5554 0))(
  ( (LongMapFixedSize!5555 (defaultEntry!6151 Int) (mask!29943 (_ BitVec 32)) (extraKeys!5883 (_ BitVec 32)) (zeroValue!5987 V!37363) (minValue!5987 V!37363) (_size!2832 (_ BitVec 32)) (_keys!11324 array!64798) (_values!6174 array!64800) (_vacant!2832 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15634 0))(
  ( (tuple2!15635 (_1!7828 Unit!33707) (_2!7828 LongMapFixedSize!5554)) )
))
(declare-fun lt!455138 () tuple2!15634)

(assert (=> b!1031167 (= res!689487 (or (not (= (size!31719 (_values!6174 (_2!7828 lt!455138))) (bvadd #b00000000000000000000000000000001 (mask!29943 (_2!7828 lt!455138))))) (not (= (size!31718 (_keys!11324 (_2!7828 lt!455138))) (size!31719 (_values!6174 (_2!7828 lt!455138))))) (bvslt (mask!29943 (_2!7828 lt!455138)) #b00000000000000000000000000000000) (bvslt (extraKeys!5883 (_2!7828 lt!455138)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5883 (_2!7828 lt!455138)) #b00000000000000000000000000000011)))))

(declare-fun e!582374 () Bool)

(declare-fun tp_is_empty!24367 () Bool)

(declare-fun e!582381 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!5554)

(declare-fun array_inv!24151 (array!64798) Bool)

(declare-fun array_inv!24152 (array!64800) Bool)

(assert (=> b!1031168 (= e!582374 (and tp!73012 tp_is_empty!24367 (array_inv!24151 (_keys!11324 thiss!1427)) (array_inv!24152 (_values!6174 thiss!1427)) e!582381))))

(declare-fun b!1031169 () Bool)

(declare-fun res!689484 () Bool)

(assert (=> b!1031169 (=> res!689484 e!582375)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031169 (= res!689484 (not (validMask!0 (mask!29943 (_2!7828 lt!455138)))))))

(declare-fun b!1031170 () Bool)

(declare-fun e!582380 () Bool)

(declare-fun mapRes!38004 () Bool)

(assert (=> b!1031170 (= e!582381 (and e!582380 mapRes!38004))))

(declare-fun condMapEmpty!38004 () Bool)

(declare-fun mapDefault!38004 () ValueCell!11480)

