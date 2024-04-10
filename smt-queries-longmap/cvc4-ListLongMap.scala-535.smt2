; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13442 () Bool)

(assert start!13442)

(declare-fun b!123262 () Bool)

(declare-fun b_free!2817 () Bool)

(declare-fun b_next!2817 () Bool)

(assert (=> b!123262 (= b_free!2817 (not b_next!2817))))

(declare-fun tp!10839 () Bool)

(declare-fun b_and!7571 () Bool)

(assert (=> b!123262 (= tp!10839 b_and!7571)))

(declare-fun b!123258 () Bool)

(declare-fun b_free!2819 () Bool)

(declare-fun b_next!2819 () Bool)

(assert (=> b!123258 (= b_free!2819 (not b_next!2819))))

(declare-fun tp!10837 () Bool)

(declare-fun b_and!7573 () Bool)

(assert (=> b!123258 (= tp!10837 b_and!7573)))

(declare-fun b!123251 () Bool)

(declare-fun e!80582 () Bool)

(declare-fun e!80584 () Bool)

(declare-fun mapRes!4432 () Bool)

(assert (=> b!123251 (= e!80582 (and e!80584 mapRes!4432))))

(declare-fun condMapEmpty!4431 () Bool)

(declare-datatypes ((V!3413 0))(
  ( (V!3414 (val!1457 Int)) )
))
(declare-datatypes ((array!4661 0))(
  ( (array!4662 (arr!2209 (Array (_ BitVec 32) (_ BitVec 64))) (size!2471 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1069 0))(
  ( (ValueCellFull!1069 (v!3093 V!3413)) (EmptyCell!1069) )
))
(declare-datatypes ((array!4663 0))(
  ( (array!4664 (arr!2210 (Array (_ BitVec 32) ValueCell!1069)) (size!2472 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1046 0))(
  ( (LongMapFixedSize!1047 (defaultEntry!2756 Int) (mask!6994 (_ BitVec 32)) (extraKeys!2541 (_ BitVec 32)) (zeroValue!2621 V!3413) (minValue!2621 V!3413) (_size!572 (_ BitVec 32)) (_keys!4483 array!4661) (_values!2739 array!4663) (_vacant!572 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1046)

(declare-fun mapDefault!4431 () ValueCell!1069)

