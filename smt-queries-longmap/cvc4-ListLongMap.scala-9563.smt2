; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113244 () Bool)

(assert start!113244)

(declare-fun b_free!31295 () Bool)

(declare-fun b_next!31295 () Bool)

(assert (=> start!113244 (= b_free!31295 (not b_next!31295))))

(declare-fun tp!109690 () Bool)

(declare-fun b_and!50497 () Bool)

(assert (=> start!113244 (= tp!109690 b_and!50497)))

(declare-fun mapNonEmpty!57649 () Bool)

(declare-fun mapRes!57649 () Bool)

(declare-fun tp!109689 () Bool)

(declare-fun e!764689 () Bool)

(assert (=> mapNonEmpty!57649 (= mapRes!57649 (and tp!109689 e!764689))))

(declare-datatypes ((V!54829 0))(
  ( (V!54830 (val!18722 Int)) )
))
(declare-datatypes ((ValueCell!17749 0))(
  ( (ValueCellFull!17749 (v!21370 V!54829)) (EmptyCell!17749) )
))
(declare-fun mapValue!57649 () ValueCell!17749)

(declare-fun mapKey!57649 () (_ BitVec 32))

(declare-fun mapRest!57649 () (Array (_ BitVec 32) ValueCell!17749))

(declare-datatypes ((array!91436 0))(
  ( (array!91437 (arr!44174 (Array (_ BitVec 32) ValueCell!17749)) (size!44724 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91436)

(assert (=> mapNonEmpty!57649 (= (arr!44174 _values!1303) (store mapRest!57649 mapKey!57649 mapValue!57649))))

(declare-fun b!1343499 () Bool)

(declare-fun e!764692 () Bool)

(declare-fun e!764691 () Bool)

(assert (=> b!1343499 (= e!764692 (and e!764691 mapRes!57649))))

(declare-fun condMapEmpty!57649 () Bool)

(declare-fun mapDefault!57649 () ValueCell!17749)

