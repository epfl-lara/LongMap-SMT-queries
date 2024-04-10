; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90122 () Bool)

(assert start!90122)

(declare-fun b!1032394 () Bool)

(declare-fun b_free!20729 () Bool)

(declare-fun b_next!20729 () Bool)

(assert (=> b!1032394 (= b_free!20729 (not b_next!20729))))

(declare-fun tp!73258 () Bool)

(declare-fun b_and!33197 () Bool)

(assert (=> b!1032394 (= tp!73258 b_and!33197)))

(declare-fun b!1032390 () Bool)

(declare-fun res!690016 () Bool)

(declare-fun e!583347 () Bool)

(assert (=> b!1032390 (=> (not res!690016) (not e!583347))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032390 (= res!690016 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!690017 () Bool)

(assert (=> start!90122 (=> (not res!690017) (not e!583347))))

(declare-datatypes ((V!37471 0))(
  ( (V!37472 (val!12275 Int)) )
))
(declare-datatypes ((ValueCell!11521 0))(
  ( (ValueCellFull!11521 (v!14852 V!37471)) (EmptyCell!11521) )
))
(declare-datatypes ((array!64962 0))(
  ( (array!64963 (arr!31283 (Array (_ BitVec 32) (_ BitVec 64))) (size!31800 (_ BitVec 32))) )
))
(declare-datatypes ((array!64964 0))(
  ( (array!64965 (arr!31284 (Array (_ BitVec 32) ValueCell!11521)) (size!31801 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5636 0))(
  ( (LongMapFixedSize!5637 (defaultEntry!6192 Int) (mask!30010 (_ BitVec 32)) (extraKeys!5924 (_ BitVec 32)) (zeroValue!6028 V!37471) (minValue!6028 V!37471) (_size!2873 (_ BitVec 32)) (_keys!11365 array!64962) (_values!6215 array!64964) (_vacant!2873 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5636)

(declare-fun valid!2133 (LongMapFixedSize!5636) Bool)

(assert (=> start!90122 (= res!690017 (valid!2133 thiss!1427))))

(assert (=> start!90122 e!583347))

(declare-fun e!583346 () Bool)

(assert (=> start!90122 e!583346))

(assert (=> start!90122 true))

(declare-fun b!1032391 () Bool)

(declare-fun e!583342 () Bool)

(declare-fun tp_is_empty!24449 () Bool)

(assert (=> b!1032391 (= e!583342 tp_is_empty!24449)))

(declare-fun b!1032392 () Bool)

(declare-fun e!583344 () Bool)

(declare-fun e!583345 () Bool)

(declare-fun mapRes!38127 () Bool)

(assert (=> b!1032392 (= e!583344 (and e!583345 mapRes!38127))))

(declare-fun condMapEmpty!38127 () Bool)

(declare-fun mapDefault!38127 () ValueCell!11521)

