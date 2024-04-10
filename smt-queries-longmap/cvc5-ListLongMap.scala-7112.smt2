; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90118 () Bool)

(assert start!90118)

(declare-fun b!1032355 () Bool)

(declare-fun b_free!20725 () Bool)

(declare-fun b_next!20725 () Bool)

(assert (=> b!1032355 (= b_free!20725 (not b_next!20725))))

(declare-fun tp!73245 () Bool)

(declare-fun b_and!33193 () Bool)

(assert (=> b!1032355 (= tp!73245 b_and!33193)))

(declare-fun mapIsEmpty!38121 () Bool)

(declare-fun mapRes!38121 () Bool)

(assert (=> mapIsEmpty!38121 mapRes!38121))

(declare-fun res!690004 () Bool)

(declare-fun e!583311 () Bool)

(assert (=> start!90118 (=> (not res!690004) (not e!583311))))

(declare-datatypes ((V!37467 0))(
  ( (V!37468 (val!12273 Int)) )
))
(declare-datatypes ((ValueCell!11519 0))(
  ( (ValueCellFull!11519 (v!14850 V!37467)) (EmptyCell!11519) )
))
(declare-datatypes ((array!64954 0))(
  ( (array!64955 (arr!31279 (Array (_ BitVec 32) (_ BitVec 64))) (size!31796 (_ BitVec 32))) )
))
(declare-datatypes ((array!64956 0))(
  ( (array!64957 (arr!31280 (Array (_ BitVec 32) ValueCell!11519)) (size!31797 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5632 0))(
  ( (LongMapFixedSize!5633 (defaultEntry!6190 Int) (mask!30008 (_ BitVec 32)) (extraKeys!5922 (_ BitVec 32)) (zeroValue!6026 V!37467) (minValue!6026 V!37467) (_size!2871 (_ BitVec 32)) (_keys!11363 array!64954) (_values!6213 array!64956) (_vacant!2871 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5632)

(declare-fun valid!2131 (LongMapFixedSize!5632) Bool)

(assert (=> start!90118 (= res!690004 (valid!2131 thiss!1427))))

(assert (=> start!90118 e!583311))

(declare-fun e!583308 () Bool)

(assert (=> start!90118 e!583308))

(assert (=> start!90118 true))

(declare-fun b!1032354 () Bool)

(declare-fun e!583309 () Bool)

(declare-fun e!583306 () Bool)

(assert (=> b!1032354 (= e!583309 (and e!583306 mapRes!38121))))

(declare-fun condMapEmpty!38121 () Bool)

(declare-fun mapDefault!38121 () ValueCell!11519)

