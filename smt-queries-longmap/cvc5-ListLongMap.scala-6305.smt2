; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80732 () Bool)

(assert start!80732)

(declare-fun b!946797 () Bool)

(declare-fun b_free!18151 () Bool)

(declare-fun b_next!18151 () Bool)

(assert (=> b!946797 (= b_free!18151 (not b_next!18151))))

(declare-fun tp!63002 () Bool)

(declare-fun b_and!29573 () Bool)

(assert (=> b!946797 (= tp!63002 b_and!29573)))

(declare-fun res!635524 () Bool)

(declare-fun e!532785 () Bool)

(assert (=> start!80732 (=> (not res!635524) (not e!532785))))

(declare-datatypes ((V!32511 0))(
  ( (V!32512 (val!10380 Int)) )
))
(declare-datatypes ((ValueCell!9848 0))(
  ( (ValueCellFull!9848 (v!12914 V!32511)) (EmptyCell!9848) )
))
(declare-datatypes ((array!57308 0))(
  ( (array!57309 (arr!27568 (Array (_ BitVec 32) ValueCell!9848)) (size!28040 (_ BitVec 32))) )
))
(declare-datatypes ((array!57310 0))(
  ( (array!57311 (arr!27569 (Array (_ BitVec 32) (_ BitVec 64))) (size!28041 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4846 0))(
  ( (LongMapFixedSize!4847 (defaultEntry!5720 Int) (mask!27437 (_ BitVec 32)) (extraKeys!5452 (_ BitVec 32)) (zeroValue!5556 V!32511) (minValue!5556 V!32511) (_size!2478 (_ BitVec 32)) (_keys!10621 array!57310) (_values!5743 array!57308) (_vacant!2478 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4846)

(declare-fun valid!1846 (LongMapFixedSize!4846) Bool)

(assert (=> start!80732 (= res!635524 (valid!1846 thiss!1141))))

(assert (=> start!80732 e!532785))

(declare-fun e!532786 () Bool)

(assert (=> start!80732 e!532786))

(assert (=> start!80732 true))

(declare-fun b!946795 () Bool)

(declare-fun e!532791 () Bool)

(declare-fun e!532789 () Bool)

(declare-fun mapRes!32853 () Bool)

(assert (=> b!946795 (= e!532791 (and e!532789 mapRes!32853))))

(declare-fun condMapEmpty!32853 () Bool)

(declare-fun mapDefault!32853 () ValueCell!9848)

