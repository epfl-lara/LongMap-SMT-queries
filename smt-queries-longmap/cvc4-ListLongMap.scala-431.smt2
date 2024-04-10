; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8088 () Bool)

(assert start!8088)

(declare-fun b!50909 () Bool)

(declare-fun b_free!1569 () Bool)

(declare-fun b_next!1569 () Bool)

(assert (=> b!50909 (= b_free!1569 (not b_next!1569))))

(declare-fun tp!6779 () Bool)

(declare-fun b_and!2779 () Bool)

(assert (=> b!50909 (= tp!6779 b_and!2779)))

(declare-fun b!50902 () Bool)

(declare-fun b_free!1571 () Bool)

(declare-fun b_next!1571 () Bool)

(assert (=> b!50902 (= b_free!1571 (not b_next!1571))))

(declare-fun tp!6781 () Bool)

(declare-fun b_and!2781 () Bool)

(assert (=> b!50902 (= tp!6781 b_and!2781)))

(declare-fun b!50898 () Bool)

(declare-fun e!32951 () Bool)

(declare-fun e!32947 () Bool)

(declare-fun mapRes!2246 () Bool)

(assert (=> b!50898 (= e!32951 (and e!32947 mapRes!2246))))

(declare-fun condMapEmpty!2245 () Bool)

(declare-datatypes ((V!2581 0))(
  ( (V!2582 (val!1145 Int)) )
))
(declare-datatypes ((array!3317 0))(
  ( (array!3318 (arr!1585 (Array (_ BitVec 32) (_ BitVec 64))) (size!1810 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!757 0))(
  ( (ValueCellFull!757 (v!2178 V!2581)) (EmptyCell!757) )
))
(declare-datatypes ((array!3319 0))(
  ( (array!3320 (arr!1586 (Array (_ BitVec 32) ValueCell!757)) (size!1811 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!422 0))(
  ( (LongMapFixedSize!423 (defaultEntry!1925 Int) (mask!5722 (_ BitVec 32)) (extraKeys!1816 (_ BitVec 32)) (zeroValue!1843 V!2581) (minValue!1843 V!2581) (_size!260 (_ BitVec 32)) (_keys!3537 array!3317) (_values!1908 array!3319) (_vacant!260 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!422)

(declare-fun mapDefault!2246 () ValueCell!757)

