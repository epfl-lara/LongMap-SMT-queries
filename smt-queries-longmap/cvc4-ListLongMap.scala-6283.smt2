; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80380 () Bool)

(assert start!80380)

(declare-fun b!944031 () Bool)

(declare-fun b_free!18023 () Bool)

(declare-fun b_next!18023 () Bool)

(assert (=> b!944031 (= b_free!18023 (not b_next!18023))))

(declare-fun tp!62578 () Bool)

(declare-fun b_and!29441 () Bool)

(assert (=> b!944031 (= tp!62578 b_and!29441)))

(declare-fun b!944025 () Bool)

(declare-fun e!530822 () Bool)

(declare-fun e!530820 () Bool)

(declare-fun mapRes!32622 () Bool)

(assert (=> b!944025 (= e!530822 (and e!530820 mapRes!32622))))

(declare-fun condMapEmpty!32622 () Bool)

(declare-datatypes ((V!32339 0))(
  ( (V!32340 (val!10316 Int)) )
))
(declare-datatypes ((ValueCell!9784 0))(
  ( (ValueCellFull!9784 (v!12848 V!32339)) (EmptyCell!9784) )
))
(declare-datatypes ((array!57030 0))(
  ( (array!57031 (arr!27440 (Array (_ BitVec 32) ValueCell!9784)) (size!27906 (_ BitVec 32))) )
))
(declare-datatypes ((array!57032 0))(
  ( (array!57033 (arr!27441 (Array (_ BitVec 32) (_ BitVec 64))) (size!27907 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4718 0))(
  ( (LongMapFixedSize!4719 (defaultEntry!5654 Int) (mask!27294 (_ BitVec 32)) (extraKeys!5386 (_ BitVec 32)) (zeroValue!5490 V!32339) (minValue!5490 V!32339) (_size!2414 (_ BitVec 32)) (_keys!10532 array!57032) (_values!5677 array!57030) (_vacant!2414 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4718)

(declare-fun mapDefault!32622 () ValueCell!9784)

