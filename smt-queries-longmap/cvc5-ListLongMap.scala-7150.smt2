; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90908 () Bool)

(assert start!90908)

(declare-fun b!1038815 () Bool)

(declare-fun b_free!20953 () Bool)

(declare-fun b_next!20953 () Bool)

(assert (=> b!1038815 (= b_free!20953 (not b_next!20953))))

(declare-fun tp!74026 () Bool)

(declare-fun b_and!33485 () Bool)

(assert (=> b!1038815 (= tp!74026 b_and!33485)))

(declare-fun b!1038810 () Bool)

(declare-fun e!587838 () Bool)

(declare-fun e!587836 () Bool)

(declare-fun mapRes!38560 () Bool)

(assert (=> b!1038810 (= e!587838 (and e!587836 mapRes!38560))))

(declare-fun condMapEmpty!38560 () Bool)

(declare-datatypes ((V!37771 0))(
  ( (V!37772 (val!12387 Int)) )
))
(declare-datatypes ((ValueCell!11633 0))(
  ( (ValueCellFull!11633 (v!14974 V!37771)) (EmptyCell!11633) )
))
(declare-datatypes ((array!65464 0))(
  ( (array!65465 (arr!31507 (Array (_ BitVec 32) (_ BitVec 64))) (size!32038 (_ BitVec 32))) )
))
(declare-datatypes ((array!65466 0))(
  ( (array!65467 (arr!31508 (Array (_ BitVec 32) ValueCell!11633)) (size!32039 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5860 0))(
  ( (LongMapFixedSize!5861 (defaultEntry!6312 Int) (mask!30262 (_ BitVec 32)) (extraKeys!6040 (_ BitVec 32)) (zeroValue!6146 V!37771) (minValue!6146 V!37771) (_size!2985 (_ BitVec 32)) (_keys!11518 array!65464) (_values!6335 array!65466) (_vacant!2985 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5860)

(declare-fun mapDefault!38560 () ValueCell!11633)

