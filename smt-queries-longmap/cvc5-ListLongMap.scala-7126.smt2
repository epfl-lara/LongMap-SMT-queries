; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90414 () Bool)

(assert start!90414)

(declare-fun b!1034794 () Bool)

(declare-fun b_free!20809 () Bool)

(declare-fun b_next!20809 () Bool)

(assert (=> b!1034794 (= b_free!20809 (not b_next!20809))))

(declare-fun tp!73536 () Bool)

(declare-fun b_and!33309 () Bool)

(assert (=> b!1034794 (= tp!73536 b_and!33309)))

(declare-fun mapNonEmpty!38285 () Bool)

(declare-fun mapRes!38285 () Bool)

(declare-fun tp!73535 () Bool)

(declare-fun e!585002 () Bool)

(assert (=> mapNonEmpty!38285 (= mapRes!38285 (and tp!73535 e!585002))))

(declare-datatypes ((V!37579 0))(
  ( (V!37580 (val!12315 Int)) )
))
(declare-datatypes ((ValueCell!11561 0))(
  ( (ValueCellFull!11561 (v!14895 V!37579)) (EmptyCell!11561) )
))
(declare-fun mapValue!38285 () ValueCell!11561)

(declare-fun mapRest!38285 () (Array (_ BitVec 32) ValueCell!11561))

(declare-datatypes ((array!65142 0))(
  ( (array!65143 (arr!31363 (Array (_ BitVec 32) (_ BitVec 64))) (size!31887 (_ BitVec 32))) )
))
(declare-datatypes ((array!65144 0))(
  ( (array!65145 (arr!31364 (Array (_ BitVec 32) ValueCell!11561)) (size!31888 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5716 0))(
  ( (LongMapFixedSize!5717 (defaultEntry!6236 Int) (mask!30102 (_ BitVec 32)) (extraKeys!5966 (_ BitVec 32)) (zeroValue!6070 V!37579) (minValue!6072 V!37579) (_size!2913 (_ BitVec 32)) (_keys!11419 array!65142) (_values!6259 array!65144) (_vacant!2913 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5716)

(declare-fun mapKey!38285 () (_ BitVec 32))

(assert (=> mapNonEmpty!38285 (= (arr!31364 (_values!6259 thiss!1427)) (store mapRest!38285 mapKey!38285 mapValue!38285))))

(declare-fun b!1034788 () Bool)

(declare-fun e!584999 () Bool)

(assert (=> b!1034788 (= e!584999 (not (= (size!31888 (_values!6259 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30102 thiss!1427)))))))

(declare-fun b!1034790 () Bool)

(declare-fun res!691053 () Bool)

(assert (=> b!1034790 (=> (not res!691053) (not e!584999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034790 (= res!691053 (validMask!0 (mask!30102 thiss!1427)))))

(declare-fun b!1034791 () Bool)

(declare-fun e!584998 () Bool)

(declare-fun e!585001 () Bool)

(assert (=> b!1034791 (= e!584998 (and e!585001 mapRes!38285))))

(declare-fun condMapEmpty!38285 () Bool)

(declare-fun mapDefault!38285 () ValueCell!11561)

