; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8376 () Bool)

(assert start!8376)

(declare-fun b!56429 () Bool)

(declare-fun b_free!1917 () Bool)

(declare-fun b_next!1917 () Bool)

(assert (=> b!56429 (= b_free!1917 (not b_next!1917))))

(declare-fun tp!7854 () Bool)

(declare-fun b_and!3375 () Bool)

(assert (=> b!56429 (= tp!7854 b_and!3375)))

(declare-fun b!56423 () Bool)

(declare-fun b_free!1919 () Bool)

(declare-fun b_next!1919 () Bool)

(assert (=> b!56423 (= b_free!1919 (not b_next!1919))))

(declare-fun tp!7852 () Bool)

(declare-fun b_and!3377 () Bool)

(assert (=> b!56423 (= tp!7852 b_and!3377)))

(declare-fun mapNonEmpty!2795 () Bool)

(declare-fun mapRes!2796 () Bool)

(declare-fun tp!7851 () Bool)

(declare-fun e!37147 () Bool)

(assert (=> mapNonEmpty!2795 (= mapRes!2796 (and tp!7851 e!37147))))

(declare-fun mapKey!2796 () (_ BitVec 32))

(declare-datatypes ((V!2813 0))(
  ( (V!2814 (val!1232 Int)) )
))
(declare-datatypes ((ValueCell!844 0))(
  ( (ValueCellFull!844 (v!2350 V!2813)) (EmptyCell!844) )
))
(declare-fun mapRest!2795 () (Array (_ BitVec 32) ValueCell!844))

(declare-datatypes ((array!3673 0))(
  ( (array!3674 (arr!1759 (Array (_ BitVec 32) (_ BitVec 64))) (size!1988 (_ BitVec 32))) )
))
(declare-datatypes ((array!3675 0))(
  ( (array!3676 (arr!1760 (Array (_ BitVec 32) ValueCell!844)) (size!1989 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!596 0))(
  ( (LongMapFixedSize!597 (defaultEntry!2012 Int) (mask!5879 (_ BitVec 32)) (extraKeys!1903 (_ BitVec 32)) (zeroValue!1930 V!2813) (minValue!1930 V!2813) (_size!347 (_ BitVec 32)) (_keys!3632 array!3673) (_values!1995 array!3675) (_vacant!347 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!596)

(declare-fun mapValue!2796 () ValueCell!844)

(assert (=> mapNonEmpty!2795 (= (arr!1760 (_values!1995 newMap!16)) (store mapRest!2795 mapKey!2796 mapValue!2796))))

(declare-fun b!56410 () Bool)

(declare-fun e!37145 () Bool)

(declare-fun e!37140 () Bool)

(assert (=> b!56410 (= e!37145 (and e!37140 mapRes!2796))))

(declare-fun condMapEmpty!2795 () Bool)

(declare-fun mapDefault!2795 () ValueCell!844)

