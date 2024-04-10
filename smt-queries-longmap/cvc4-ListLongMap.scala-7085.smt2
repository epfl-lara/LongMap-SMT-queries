; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89568 () Bool)

(assert start!89568)

(declare-fun b!1027455 () Bool)

(declare-fun b_free!20567 () Bool)

(declare-fun b_next!20567 () Bool)

(assert (=> b!1027455 (= b_free!20567 (not b_next!20567))))

(declare-fun tp!72746 () Bool)

(declare-fun b_and!32813 () Bool)

(assert (=> b!1027455 (= tp!72746 b_and!32813)))

(declare-fun b!1027451 () Bool)

(declare-fun e!579855 () Bool)

(declare-fun e!579857 () Bool)

(declare-fun mapRes!37859 () Bool)

(assert (=> b!1027451 (= e!579855 (and e!579857 mapRes!37859))))

(declare-fun condMapEmpty!37859 () Bool)

(declare-datatypes ((V!37255 0))(
  ( (V!37256 (val!12194 Int)) )
))
(declare-datatypes ((ValueCell!11440 0))(
  ( (ValueCellFull!11440 (v!14763 V!37255)) (EmptyCell!11440) )
))
(declare-datatypes ((array!64624 0))(
  ( (array!64625 (arr!31121 (Array (_ BitVec 32) (_ BitVec 64))) (size!31634 (_ BitVec 32))) )
))
(declare-datatypes ((array!64626 0))(
  ( (array!64627 (arr!31122 (Array (_ BitVec 32) ValueCell!11440)) (size!31635 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5474 0))(
  ( (LongMapFixedSize!5475 (defaultEntry!6089 Int) (mask!29805 (_ BitVec 32)) (extraKeys!5821 (_ BitVec 32)) (zeroValue!5925 V!37255) (minValue!5925 V!37255) (_size!2792 (_ BitVec 32)) (_keys!11236 array!64624) (_values!6112 array!64626) (_vacant!2792 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5474)

(declare-fun mapDefault!37859 () ValueCell!11440)

