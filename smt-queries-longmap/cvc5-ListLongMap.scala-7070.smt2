; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89474 () Bool)

(assert start!89474)

(declare-fun b!1026097 () Bool)

(declare-fun b_free!20473 () Bool)

(declare-fun b_next!20473 () Bool)

(assert (=> b!1026097 (= b_free!20473 (not b_next!20473))))

(declare-fun tp!72464 () Bool)

(declare-fun b_and!32719 () Bool)

(assert (=> b!1026097 (= tp!72464 b_and!32719)))

(declare-fun b!1026091 () Bool)

(declare-fun e!578727 () Bool)

(declare-fun e!578730 () Bool)

(declare-fun mapRes!37718 () Bool)

(assert (=> b!1026091 (= e!578727 (and e!578730 mapRes!37718))))

(declare-fun condMapEmpty!37718 () Bool)

(declare-datatypes ((V!37131 0))(
  ( (V!37132 (val!12147 Int)) )
))
(declare-datatypes ((ValueCell!11393 0))(
  ( (ValueCellFull!11393 (v!14716 V!37131)) (EmptyCell!11393) )
))
(declare-datatypes ((array!64436 0))(
  ( (array!64437 (arr!31027 (Array (_ BitVec 32) (_ BitVec 64))) (size!31540 (_ BitVec 32))) )
))
(declare-datatypes ((array!64438 0))(
  ( (array!64439 (arr!31028 (Array (_ BitVec 32) ValueCell!11393)) (size!31541 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5380 0))(
  ( (LongMapFixedSize!5381 (defaultEntry!6042 Int) (mask!29728 (_ BitVec 32)) (extraKeys!5774 (_ BitVec 32)) (zeroValue!5878 V!37131) (minValue!5878 V!37131) (_size!2745 (_ BitVec 32)) (_keys!11189 array!64436) (_values!6065 array!64438) (_vacant!2745 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5380)

(declare-fun mapDefault!37718 () ValueCell!11393)

