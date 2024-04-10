; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3362 () Bool)

(assert start!3362)

(declare-fun b!21317 () Bool)

(declare-fun b_free!733 () Bool)

(declare-fun b_next!733 () Bool)

(assert (=> b!21317 (= b_free!733 (not b_next!733))))

(declare-fun tp!3436 () Bool)

(declare-fun b_and!1421 () Bool)

(assert (=> b!21317 (= tp!3436 b_and!1421)))

(declare-fun b!21309 () Bool)

(declare-datatypes ((V!1155 0))(
  ( (V!1156 (val!525 Int)) )
))
(declare-datatypes ((array!1225 0))(
  ( (array!1226 (arr!581 (Array (_ BitVec 32) (_ BitVec 64))) (size!674 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!299 0))(
  ( (ValueCellFull!299 (v!1570 V!1155)) (EmptyCell!299) )
))
(declare-datatypes ((array!1227 0))(
  ( (array!1228 (arr!582 (Array (_ BitVec 32) ValueCell!299)) (size!675 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!184 0))(
  ( (LongMapFixedSize!185 (defaultEntry!1718 Int) (mask!4691 (_ BitVec 32)) (extraKeys!1621 (_ BitVec 32)) (zeroValue!1645 V!1155) (minValue!1645 V!1155) (_size!133 (_ BitVec 32)) (_keys!3139 array!1225) (_values!1707 array!1227) (_vacant!133 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!184 0))(
  ( (Cell!185 (v!1571 LongMapFixedSize!184)) )
))
(declare-datatypes ((tuple2!894 0))(
  ( (tuple2!895 (_1!450 Bool) (_2!450 Cell!184)) )
))
(declare-fun e!13888 () tuple2!894)

(declare-fun e!13898 () tuple2!894)

(assert (=> b!21309 (= e!13888 e!13898)))

(declare-fun c!2445 () Bool)

(declare-fun lt!6659 () Bool)

(declare-datatypes ((LongMap!184 0))(
  ( (LongMap!185 (underlying!103 Cell!184)) )
))
(declare-fun thiss!938 () LongMap!184)

(assert (=> b!21309 (= c!2445 (and (not lt!6659) (= (bvand (extraKeys!1621 (v!1571 (underlying!103 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!21310 () Bool)

(declare-fun e!13891 () Bool)

(declare-fun e!13897 () Bool)

(declare-fun mapRes!976 () Bool)

(assert (=> b!21310 (= e!13891 (and e!13897 mapRes!976))))

(declare-fun condMapEmpty!976 () Bool)

(declare-fun mapDefault!976 () ValueCell!299)

