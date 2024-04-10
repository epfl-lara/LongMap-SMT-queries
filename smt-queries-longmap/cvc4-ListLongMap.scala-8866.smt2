; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107608 () Bool)

(assert start!107608)

(declare-fun b!1273706 () Bool)

(declare-fun b_free!27743 () Bool)

(declare-fun b_next!27743 () Bool)

(assert (=> b!1273706 (= b_free!27743 (not b_next!27743))))

(declare-fun tp!97786 () Bool)

(declare-fun b_and!45799 () Bool)

(assert (=> b!1273706 (= tp!97786 b_and!45799)))

(declare-fun b!1273705 () Bool)

(declare-fun e!726774 () Bool)

(declare-fun e!726771 () Bool)

(declare-fun mapRes!51301 () Bool)

(assert (=> b!1273705 (= e!726774 (and e!726771 mapRes!51301))))

(declare-fun condMapEmpty!51301 () Bool)

(declare-datatypes ((V!49343 0))(
  ( (V!49344 (val!16631 Int)) )
))
(declare-datatypes ((ValueCell!15703 0))(
  ( (ValueCellFull!15703 (v!19268 V!49343)) (EmptyCell!15703) )
))
(declare-datatypes ((array!83504 0))(
  ( (array!83505 (arr!40274 (Array (_ BitVec 32) ValueCell!15703)) (size!40819 (_ BitVec 32))) )
))
(declare-datatypes ((array!83506 0))(
  ( (array!83507 (arr!40275 (Array (_ BitVec 32) (_ BitVec 64))) (size!40820 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6170 0))(
  ( (LongMapFixedSize!6171 (defaultEntry!6731 Int) (mask!34521 (_ BitVec 32)) (extraKeys!6410 (_ BitVec 32)) (zeroValue!6516 V!49343) (minValue!6516 V!49343) (_size!3140 (_ BitVec 32)) (_keys!12145 array!83506) (_values!6754 array!83504) (_vacant!3140 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6170)

(declare-fun mapDefault!51301 () ValueCell!15703)

