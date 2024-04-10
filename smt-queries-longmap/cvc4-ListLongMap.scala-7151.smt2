; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90936 () Bool)

(assert start!90936)

(declare-fun b!1039018 () Bool)

(declare-fun b_free!20963 () Bool)

(declare-fun b_next!20963 () Bool)

(assert (=> b!1039018 (= b_free!20963 (not b_next!20963))))

(declare-fun tp!74059 () Bool)

(declare-fun b_and!33495 () Bool)

(assert (=> b!1039018 (= tp!74059 b_and!33495)))

(declare-fun mapNonEmpty!38578 () Bool)

(declare-fun mapRes!38578 () Bool)

(declare-fun tp!74060 () Bool)

(declare-fun e!588001 () Bool)

(assert (=> mapNonEmpty!38578 (= mapRes!38578 (and tp!74060 e!588001))))

(declare-datatypes ((V!37783 0))(
  ( (V!37784 (val!12392 Int)) )
))
(declare-datatypes ((ValueCell!11638 0))(
  ( (ValueCellFull!11638 (v!14979 V!37783)) (EmptyCell!11638) )
))
(declare-fun mapRest!38578 () (Array (_ BitVec 32) ValueCell!11638))

(declare-fun mapValue!38578 () ValueCell!11638)

(declare-datatypes ((array!65486 0))(
  ( (array!65487 (arr!31517 (Array (_ BitVec 32) (_ BitVec 64))) (size!32048 (_ BitVec 32))) )
))
(declare-datatypes ((array!65488 0))(
  ( (array!65489 (arr!31518 (Array (_ BitVec 32) ValueCell!11638)) (size!32049 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5870 0))(
  ( (LongMapFixedSize!5871 (defaultEntry!6317 Int) (mask!30271 (_ BitVec 32)) (extraKeys!6045 (_ BitVec 32)) (zeroValue!6151 V!37783) (minValue!6151 V!37783) (_size!2990 (_ BitVec 32)) (_keys!11524 array!65486) (_values!6340 array!65488) (_vacant!2990 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5870)

(declare-fun mapKey!38578 () (_ BitVec 32))

(assert (=> mapNonEmpty!38578 (= (arr!31518 (_values!6340 thiss!1427)) (store mapRest!38578 mapKey!38578 mapValue!38578))))

(declare-fun b!1039011 () Bool)

(declare-fun e!588006 () Bool)

(declare-fun e!588000 () Bool)

(assert (=> b!1039011 (= e!588006 (and e!588000 mapRes!38578))))

(declare-fun condMapEmpty!38578 () Bool)

(declare-fun mapDefault!38578 () ValueCell!11638)

