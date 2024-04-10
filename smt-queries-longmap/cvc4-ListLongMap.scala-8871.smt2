; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107692 () Bool)

(assert start!107692)

(declare-fun b!1274256 () Bool)

(declare-fun b_free!27773 () Bool)

(declare-fun b_next!27773 () Bool)

(assert (=> b!1274256 (= b_free!27773 (not b_next!27773))))

(declare-fun tp!97889 () Bool)

(declare-fun b_and!45829 () Bool)

(assert (=> b!1274256 (= tp!97889 b_and!45829)))

(declare-fun b!1274255 () Bool)

(declare-fun e!727167 () Bool)

(declare-fun e!727166 () Bool)

(assert (=> b!1274255 (= e!727167 e!727166)))

(declare-fun res!847189 () Bool)

(assert (=> b!1274255 (=> res!847189 e!727166)))

(declare-datatypes ((List!28572 0))(
  ( (Nil!28569) (Cons!28568 (h!29777 (_ BitVec 64)) (t!42105 List!28572)) )
))
(declare-fun contains!7678 (List!28572 (_ BitVec 64)) Bool)

(assert (=> b!1274255 (= res!847189 (contains!7678 Nil!28569 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!727164 () Bool)

(declare-fun e!727169 () Bool)

(declare-fun tp_is_empty!33143 () Bool)

(declare-datatypes ((V!49383 0))(
  ( (V!49384 (val!16646 Int)) )
))
(declare-datatypes ((ValueCell!15718 0))(
  ( (ValueCellFull!15718 (v!19283 V!49383)) (EmptyCell!15718) )
))
(declare-datatypes ((array!83572 0))(
  ( (array!83573 (arr!40304 (Array (_ BitVec 32) ValueCell!15718)) (size!40853 (_ BitVec 32))) )
))
(declare-datatypes ((array!83574 0))(
  ( (array!83575 (arr!40305 (Array (_ BitVec 32) (_ BitVec 64))) (size!40854 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6200 0))(
  ( (LongMapFixedSize!6201 (defaultEntry!6746 Int) (mask!34552 (_ BitVec 32)) (extraKeys!6425 (_ BitVec 32)) (zeroValue!6531 V!49383) (minValue!6531 V!49383) (_size!3155 (_ BitVec 32)) (_keys!12164 array!83574) (_values!6769 array!83572) (_vacant!3155 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6200)

(declare-fun array_inv!30637 (array!83574) Bool)

(declare-fun array_inv!30638 (array!83572) Bool)

(assert (=> b!1274256 (= e!727169 (and tp!97889 tp_is_empty!33143 (array_inv!30637 (_keys!12164 thiss!1551)) (array_inv!30638 (_values!6769 thiss!1551)) e!727164))))

(declare-fun b!1274257 () Bool)

(declare-fun e!727165 () Bool)

(declare-fun mapRes!51359 () Bool)

(assert (=> b!1274257 (= e!727164 (and e!727165 mapRes!51359))))

(declare-fun condMapEmpty!51359 () Bool)

(declare-fun mapDefault!51359 () ValueCell!15718)

