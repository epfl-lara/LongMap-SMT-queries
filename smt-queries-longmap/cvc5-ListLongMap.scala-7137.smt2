; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90574 () Bool)

(assert start!90574)

(declare-fun b!1035883 () Bool)

(declare-fun b_free!20875 () Bool)

(declare-fun b_next!20875 () Bool)

(assert (=> b!1035883 (= b_free!20875 (not b_next!20875))))

(declare-fun tp!73758 () Bool)

(declare-fun b_and!33375 () Bool)

(assert (=> b!1035883 (= tp!73758 b_and!33375)))

(declare-fun mapNonEmpty!38409 () Bool)

(declare-fun mapRes!38409 () Bool)

(declare-fun tp!73759 () Bool)

(declare-fun e!585816 () Bool)

(assert (=> mapNonEmpty!38409 (= mapRes!38409 (and tp!73759 e!585816))))

(declare-datatypes ((V!37667 0))(
  ( (V!37668 (val!12348 Int)) )
))
(declare-datatypes ((ValueCell!11594 0))(
  ( (ValueCellFull!11594 (v!14928 V!37667)) (EmptyCell!11594) )
))
(declare-fun mapRest!38409 () (Array (_ BitVec 32) ValueCell!11594))

(declare-fun mapValue!38409 () ValueCell!11594)

(declare-datatypes ((array!65288 0))(
  ( (array!65289 (arr!31429 (Array (_ BitVec 32) (_ BitVec 64))) (size!31957 (_ BitVec 32))) )
))
(declare-datatypes ((array!65290 0))(
  ( (array!65291 (arr!31430 (Array (_ BitVec 32) ValueCell!11594)) (size!31958 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5782 0))(
  ( (LongMapFixedSize!5783 (defaultEntry!6269 Int) (mask!30170 (_ BitVec 32)) (extraKeys!5999 (_ BitVec 32)) (zeroValue!6103 V!37667) (minValue!6105 V!37667) (_size!2946 (_ BitVec 32)) (_keys!11458 array!65288) (_values!6292 array!65290) (_vacant!2946 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5782)

(declare-fun mapKey!38409 () (_ BitVec 32))

(assert (=> mapNonEmpty!38409 (= (arr!31430 (_values!6292 thiss!1427)) (store mapRest!38409 mapKey!38409 mapValue!38409))))

(declare-fun b!1035878 () Bool)

(declare-fun e!585815 () Bool)

(declare-fun e!585820 () Bool)

(assert (=> b!1035878 (= e!585815 (and e!585820 mapRes!38409))))

(declare-fun condMapEmpty!38409 () Bool)

(declare-fun mapDefault!38409 () ValueCell!11594)

