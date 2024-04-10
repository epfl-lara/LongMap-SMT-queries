; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89692 () Bool)

(assert start!89692)

(declare-fun b!1028358 () Bool)

(declare-fun b_free!20585 () Bool)

(declare-fun b_next!20585 () Bool)

(assert (=> b!1028358 (= b_free!20585 (not b_next!20585))))

(declare-fun tp!72808 () Bool)

(declare-fun b_and!32871 () Bool)

(assert (=> b!1028358 (= tp!72808 b_and!32871)))

(declare-fun b!1028351 () Bool)

(declare-fun e!580483 () Bool)

(declare-fun e!580489 () Bool)

(declare-fun mapRes!37893 () Bool)

(assert (=> b!1028351 (= e!580483 (and e!580489 mapRes!37893))))

(declare-fun condMapEmpty!37893 () Bool)

(declare-datatypes ((V!37279 0))(
  ( (V!37280 (val!12203 Int)) )
))
(declare-datatypes ((ValueCell!11449 0))(
  ( (ValueCellFull!11449 (v!14774 V!37279)) (EmptyCell!11449) )
))
(declare-datatypes ((array!64664 0))(
  ( (array!64665 (arr!31139 (Array (_ BitVec 32) (_ BitVec 64))) (size!31653 (_ BitVec 32))) )
))
(declare-datatypes ((array!64666 0))(
  ( (array!64667 (arr!31140 (Array (_ BitVec 32) ValueCell!11449)) (size!31654 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5492 0))(
  ( (LongMapFixedSize!5493 (defaultEntry!6104 Int) (mask!29839 (_ BitVec 32)) (extraKeys!5836 (_ BitVec 32)) (zeroValue!5940 V!37279) (minValue!5940 V!37279) (_size!2801 (_ BitVec 32)) (_keys!11258 array!64664) (_values!6127 array!64666) (_vacant!2801 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5492)

(declare-fun mapDefault!37893 () ValueCell!11449)

