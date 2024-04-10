; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80608 () Bool)

(assert start!80608)

(declare-fun b!946098 () Bool)

(declare-fun b_free!18131 () Bool)

(declare-fun b_next!18131 () Bool)

(assert (=> b!946098 (= b_free!18131 (not b_next!18131))))

(declare-fun tp!62927 () Bool)

(declare-fun b_and!29553 () Bool)

(assert (=> b!946098 (= tp!62927 b_and!29553)))

(declare-fun b!946091 () Bool)

(declare-fun e!532279 () Bool)

(declare-fun e!532278 () Bool)

(declare-fun mapRes!32808 () Bool)

(assert (=> b!946091 (= e!532279 (and e!532278 mapRes!32808))))

(declare-fun condMapEmpty!32808 () Bool)

(declare-datatypes ((V!32483 0))(
  ( (V!32484 (val!10370 Int)) )
))
(declare-datatypes ((ValueCell!9838 0))(
  ( (ValueCellFull!9838 (v!12904 V!32483)) (EmptyCell!9838) )
))
(declare-datatypes ((array!57260 0))(
  ( (array!57261 (arr!27548 (Array (_ BitVec 32) ValueCell!9838)) (size!28017 (_ BitVec 32))) )
))
(declare-datatypes ((array!57262 0))(
  ( (array!57263 (arr!27549 (Array (_ BitVec 32) (_ BitVec 64))) (size!28018 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4826 0))(
  ( (LongMapFixedSize!4827 (defaultEntry!5710 Int) (mask!27399 (_ BitVec 32)) (extraKeys!5442 (_ BitVec 32)) (zeroValue!5546 V!32483) (minValue!5546 V!32483) (_size!2468 (_ BitVec 32)) (_keys!10598 array!57262) (_values!5733 array!57260) (_vacant!2468 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4826)

(declare-fun mapDefault!32808 () ValueCell!9838)

