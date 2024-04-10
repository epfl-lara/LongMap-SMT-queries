; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89982 () Bool)

(assert start!89982)

(declare-fun b!1030521 () Bool)

(declare-fun b_free!20621 () Bool)

(declare-fun b_next!20621 () Bool)

(assert (=> b!1030521 (= b_free!20621 (not b_next!20621))))

(declare-fun tp!72930 () Bool)

(declare-fun b_and!33003 () Bool)

(assert (=> b!1030521 (= tp!72930 b_and!33003)))

(declare-fun b!1030512 () Bool)

(declare-fun e!581937 () Bool)

(declare-fun e!581935 () Bool)

(declare-fun mapRes!37962 () Bool)

(assert (=> b!1030512 (= e!581937 (and e!581935 mapRes!37962))))

(declare-fun condMapEmpty!37962 () Bool)

(declare-datatypes ((V!37327 0))(
  ( (V!37328 (val!12221 Int)) )
))
(declare-datatypes ((ValueCell!11467 0))(
  ( (ValueCellFull!11467 (v!14798 V!37327)) (EmptyCell!11467) )
))
(declare-datatypes ((array!64744 0))(
  ( (array!64745 (arr!31175 (Array (_ BitVec 32) (_ BitVec 64))) (size!31692 (_ BitVec 32))) )
))
(declare-datatypes ((array!64746 0))(
  ( (array!64747 (arr!31176 (Array (_ BitVec 32) ValueCell!11467)) (size!31693 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5528 0))(
  ( (LongMapFixedSize!5529 (defaultEntry!6136 Int) (mask!29914 (_ BitVec 32)) (extraKeys!5868 (_ BitVec 32)) (zeroValue!5972 V!37327) (minValue!5972 V!37327) (_size!2819 (_ BitVec 32)) (_keys!11307 array!64744) (_values!6159 array!64746) (_vacant!2819 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5528)

(declare-fun mapDefault!37962 () ValueCell!11467)

