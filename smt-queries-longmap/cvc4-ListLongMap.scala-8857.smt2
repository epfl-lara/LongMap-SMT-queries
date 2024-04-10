; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107452 () Bool)

(assert start!107452)

(declare-fun b!1272823 () Bool)

(declare-fun b_free!27689 () Bool)

(declare-fun b_next!27689 () Bool)

(assert (=> b!1272823 (= b_free!27689 (not b_next!27689))))

(declare-fun tp!97593 () Bool)

(declare-fun b_and!45745 () Bool)

(assert (=> b!1272823 (= tp!97593 b_and!45745)))

(declare-fun res!846558 () Bool)

(declare-fun e!726079 () Bool)

(assert (=> start!107452 (=> (not res!846558) (not e!726079))))

(declare-datatypes ((V!49271 0))(
  ( (V!49272 (val!16604 Int)) )
))
(declare-datatypes ((ValueCell!15676 0))(
  ( (ValueCellFull!15676 (v!19241 V!49271)) (EmptyCell!15676) )
))
(declare-datatypes ((array!83378 0))(
  ( (array!83379 (arr!40220 (Array (_ BitVec 32) ValueCell!15676)) (size!40759 (_ BitVec 32))) )
))
(declare-datatypes ((array!83380 0))(
  ( (array!83381 (arr!40221 (Array (_ BitVec 32) (_ BitVec 64))) (size!40760 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6116 0))(
  ( (LongMapFixedSize!6117 (defaultEntry!6704 Int) (mask!34463 (_ BitVec 32)) (extraKeys!6383 (_ BitVec 32)) (zeroValue!6489 V!49271) (minValue!6489 V!49271) (_size!3113 (_ BitVec 32)) (_keys!12113 array!83380) (_values!6727 array!83378) (_vacant!3113 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6116)

(declare-fun valid!2295 (LongMapFixedSize!6116) Bool)

(assert (=> start!107452 (= res!846558 (valid!2295 thiss!1559))))

(assert (=> start!107452 e!726079))

(declare-fun e!726075 () Bool)

(assert (=> start!107452 e!726075))

(declare-fun mapIsEmpty!51190 () Bool)

(declare-fun mapRes!51190 () Bool)

(assert (=> mapIsEmpty!51190 mapRes!51190))

(declare-fun b!1272819 () Bool)

(declare-fun e!726076 () Bool)

(declare-fun tp_is_empty!33059 () Bool)

(assert (=> b!1272819 (= e!726076 tp_is_empty!33059)))

(declare-fun b!1272820 () Bool)

(declare-fun e!726078 () Bool)

(assert (=> b!1272820 (= e!726078 (and e!726076 mapRes!51190))))

(declare-fun condMapEmpty!51190 () Bool)

(declare-fun mapDefault!51190 () ValueCell!15676)

