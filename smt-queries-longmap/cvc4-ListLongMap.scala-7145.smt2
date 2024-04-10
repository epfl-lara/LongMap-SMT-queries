; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90810 () Bool)

(assert start!90810)

(declare-fun b!1038081 () Bool)

(declare-fun b_free!20927 () Bool)

(declare-fun b_next!20927 () Bool)

(assert (=> b!1038081 (= b_free!20927 (not b_next!20927))))

(declare-fun tp!73939 () Bool)

(declare-fun b_and!33459 () Bool)

(assert (=> b!1038081 (= tp!73939 b_and!33459)))

(declare-fun b!1038074 () Bool)

(declare-fun e!587320 () Bool)

(declare-fun e!587317 () Bool)

(declare-fun mapRes!38511 () Bool)

(assert (=> b!1038074 (= e!587320 (and e!587317 mapRes!38511))))

(declare-fun condMapEmpty!38511 () Bool)

(declare-datatypes ((V!37735 0))(
  ( (V!37736 (val!12374 Int)) )
))
(declare-datatypes ((ValueCell!11620 0))(
  ( (ValueCellFull!11620 (v!14959 V!37735)) (EmptyCell!11620) )
))
(declare-datatypes ((array!65406 0))(
  ( (array!65407 (arr!31481 (Array (_ BitVec 32) (_ BitVec 64))) (size!32011 (_ BitVec 32))) )
))
(declare-datatypes ((array!65408 0))(
  ( (array!65409 (arr!31482 (Array (_ BitVec 32) ValueCell!11620)) (size!32012 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5834 0))(
  ( (LongMapFixedSize!5835 (defaultEntry!6299 Int) (mask!30230 (_ BitVec 32)) (extraKeys!6027 (_ BitVec 32)) (zeroValue!6133 V!37735) (minValue!6133 V!37735) (_size!2972 (_ BitVec 32)) (_keys!11499 array!65406) (_values!6322 array!65408) (_vacant!2972 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5834)

(declare-fun mapDefault!38511 () ValueCell!11620)

