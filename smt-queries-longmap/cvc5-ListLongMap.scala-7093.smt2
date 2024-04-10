; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89972 () Bool)

(assert start!89972)

(declare-fun b!1030348 () Bool)

(declare-fun b_free!20611 () Bool)

(declare-fun b_next!20611 () Bool)

(assert (=> b!1030348 (= b_free!20611 (not b_next!20611))))

(declare-fun tp!72901 () Bool)

(declare-fun b_and!32983 () Bool)

(assert (=> b!1030348 (= tp!72901 b_and!32983)))

(declare-fun b!1030343 () Bool)

(declare-fun e!581819 () Bool)

(declare-fun e!581817 () Bool)

(declare-fun mapRes!37947 () Bool)

(assert (=> b!1030343 (= e!581819 (and e!581817 mapRes!37947))))

(declare-fun condMapEmpty!37947 () Bool)

(declare-datatypes ((V!37315 0))(
  ( (V!37316 (val!12216 Int)) )
))
(declare-datatypes ((ValueCell!11462 0))(
  ( (ValueCellFull!11462 (v!14793 V!37315)) (EmptyCell!11462) )
))
(declare-datatypes ((array!64724 0))(
  ( (array!64725 (arr!31165 (Array (_ BitVec 32) (_ BitVec 64))) (size!31682 (_ BitVec 32))) )
))
(declare-datatypes ((array!64726 0))(
  ( (array!64727 (arr!31166 (Array (_ BitVec 32) ValueCell!11462)) (size!31683 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5518 0))(
  ( (LongMapFixedSize!5519 (defaultEntry!6131 Int) (mask!29907 (_ BitVec 32)) (extraKeys!5863 (_ BitVec 32)) (zeroValue!5967 V!37315) (minValue!5967 V!37315) (_size!2814 (_ BitVec 32)) (_keys!11302 array!64724) (_values!6154 array!64726) (_vacant!2814 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5518)

(declare-fun mapDefault!37947 () ValueCell!11462)

