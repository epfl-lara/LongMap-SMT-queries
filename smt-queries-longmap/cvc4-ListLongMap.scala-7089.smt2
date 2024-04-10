; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89772 () Bool)

(assert start!89772)

(declare-fun b!1028912 () Bool)

(declare-fun b_free!20591 () Bool)

(declare-fun b_next!20591 () Bool)

(assert (=> b!1028912 (= b_free!20591 (not b_next!20591))))

(declare-fun tp!72830 () Bool)

(declare-fun b_and!32901 () Bool)

(assert (=> b!1028912 (= tp!72830 b_and!32901)))

(declare-datatypes ((V!37287 0))(
  ( (V!37288 (val!12206 Int)) )
))
(declare-datatypes ((ValueCell!11452 0))(
  ( (ValueCellFull!11452 (v!14779 V!37287)) (EmptyCell!11452) )
))
(declare-datatypes ((array!64678 0))(
  ( (array!64679 (arr!31145 (Array (_ BitVec 32) (_ BitVec 64))) (size!31660 (_ BitVec 32))) )
))
(declare-datatypes ((array!64680 0))(
  ( (array!64681 (arr!31146 (Array (_ BitVec 32) ValueCell!11452)) (size!31661 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5498 0))(
  ( (LongMapFixedSize!5499 (defaultEntry!6111 Int) (mask!29857 (_ BitVec 32)) (extraKeys!5843 (_ BitVec 32)) (zeroValue!5947 V!37287) (minValue!5947 V!37287) (_size!2804 (_ BitVec 32)) (_keys!11270 array!64678) (_values!6134 array!64680) (_vacant!2804 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5498)

(declare-fun e!580859 () Bool)

(declare-fun tp_is_empty!24311 () Bool)

(declare-fun e!580858 () Bool)

(declare-fun array_inv!24109 (array!64678) Bool)

(declare-fun array_inv!24110 (array!64680) Bool)

(assert (=> b!1028912 (= e!580858 (and tp!72830 tp_is_empty!24311 (array_inv!24109 (_keys!11270 thiss!1427)) (array_inv!24110 (_values!6134 thiss!1427)) e!580859))))

(declare-fun b!1028913 () Bool)

(declare-fun res!688369 () Bool)

(declare-fun e!580857 () Bool)

(assert (=> b!1028913 (=> (not res!688369) (not e!580857))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1028913 (= res!688369 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37906 () Bool)

(declare-fun mapRes!37906 () Bool)

(assert (=> mapIsEmpty!37906 mapRes!37906))

(declare-fun b!1028914 () Bool)

(declare-fun e!580856 () Bool)

(assert (=> b!1028914 (= e!580859 (and e!580856 mapRes!37906))))

(declare-fun condMapEmpty!37906 () Bool)

(declare-fun mapDefault!37906 () ValueCell!11452)

