; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107372 () Bool)

(assert start!107372)

(declare-fun b!1272379 () Bool)

(declare-fun b_free!27665 () Bool)

(declare-fun b_next!27665 () Bool)

(assert (=> b!1272379 (= b_free!27665 (not b_next!27665))))

(declare-fun tp!97506 () Bool)

(declare-fun b_and!45721 () Bool)

(assert (=> b!1272379 (= tp!97506 b_and!45721)))

(declare-fun res!846369 () Bool)

(declare-fun e!725729 () Bool)

(assert (=> start!107372 (=> (not res!846369) (not e!725729))))

(declare-datatypes ((V!49239 0))(
  ( (V!49240 (val!16592 Int)) )
))
(declare-datatypes ((ValueCell!15664 0))(
  ( (ValueCellFull!15664 (v!19229 V!49239)) (EmptyCell!15664) )
))
(declare-datatypes ((array!83322 0))(
  ( (array!83323 (arr!40196 (Array (_ BitVec 32) ValueCell!15664)) (size!40732 (_ BitVec 32))) )
))
(declare-datatypes ((array!83324 0))(
  ( (array!83325 (arr!40197 (Array (_ BitVec 32) (_ BitVec 64))) (size!40733 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6092 0))(
  ( (LongMapFixedSize!6093 (defaultEntry!6692 Int) (mask!34436 (_ BitVec 32)) (extraKeys!6371 (_ BitVec 32)) (zeroValue!6477 V!49239) (minValue!6477 V!49239) (_size!3101 (_ BitVec 32)) (_keys!12098 array!83324) (_values!6715 array!83322) (_vacant!3101 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6092)

(declare-fun valid!2287 (LongMapFixedSize!6092) Bool)

(assert (=> start!107372 (= res!846369 (valid!2287 thiss!1559))))

(assert (=> start!107372 e!725729))

(declare-fun e!725728 () Bool)

(assert (=> start!107372 e!725728))

(declare-fun b!1272377 () Bool)

(declare-fun e!725730 () Bool)

(declare-fun e!725727 () Bool)

(declare-fun mapRes!51139 () Bool)

(assert (=> b!1272377 (= e!725730 (and e!725727 mapRes!51139))))

(declare-fun condMapEmpty!51139 () Bool)

(declare-fun mapDefault!51139 () ValueCell!15664)

