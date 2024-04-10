; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107394 () Bool)

(assert start!107394)

(declare-fun b!1272505 () Bool)

(declare-fun b_free!27671 () Bool)

(declare-fun b_next!27671 () Bool)

(assert (=> b!1272505 (= b_free!27671 (not b_next!27671))))

(declare-fun tp!97528 () Bool)

(declare-fun b_and!45727 () Bool)

(assert (=> b!1272505 (= tp!97528 b_and!45727)))

(declare-fun b!1272500 () Bool)

(declare-fun e!725826 () Bool)

(declare-fun e!725822 () Bool)

(declare-fun mapRes!51152 () Bool)

(assert (=> b!1272500 (= e!725826 (and e!725822 mapRes!51152))))

(declare-fun condMapEmpty!51152 () Bool)

(declare-datatypes ((V!49247 0))(
  ( (V!49248 (val!16595 Int)) )
))
(declare-datatypes ((ValueCell!15667 0))(
  ( (ValueCellFull!15667 (v!19232 V!49247)) (EmptyCell!15667) )
))
(declare-datatypes ((array!83336 0))(
  ( (array!83337 (arr!40202 (Array (_ BitVec 32) ValueCell!15667)) (size!40739 (_ BitVec 32))) )
))
(declare-datatypes ((array!83338 0))(
  ( (array!83339 (arr!40203 (Array (_ BitVec 32) (_ BitVec 64))) (size!40740 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6098 0))(
  ( (LongMapFixedSize!6099 (defaultEntry!6695 Int) (mask!34443 (_ BitVec 32)) (extraKeys!6374 (_ BitVec 32)) (zeroValue!6480 V!49247) (minValue!6480 V!49247) (_size!3104 (_ BitVec 32)) (_keys!12102 array!83338) (_values!6718 array!83336) (_vacant!3104 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6098)

(declare-fun mapDefault!51152 () ValueCell!15667)

