; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108880 () Bool)

(assert start!108880)

(declare-fun b_free!28393 () Bool)

(declare-fun b_next!28393 () Bool)

(assert (=> start!108880 (= b_free!28393 (not b_next!28393))))

(declare-fun tp!100295 () Bool)

(declare-fun b_and!46459 () Bool)

(assert (=> start!108880 (= tp!100295 b_and!46459)))

(declare-fun mapNonEmpty!52607 () Bool)

(declare-fun mapRes!52607 () Bool)

(declare-fun tp!100294 () Bool)

(declare-fun e!734506 () Bool)

(assert (=> mapNonEmpty!52607 (= mapRes!52607 (and tp!100294 e!734506))))

(declare-datatypes ((V!50481 0))(
  ( (V!50482 (val!17091 Int)) )
))
(declare-datatypes ((ValueCell!16118 0))(
  ( (ValueCellFull!16118 (v!19693 V!50481)) (EmptyCell!16118) )
))
(declare-fun mapValue!52607 () ValueCell!16118)

(declare-fun mapKey!52607 () (_ BitVec 32))

(declare-datatypes ((array!85120 0))(
  ( (array!85121 (arr!41062 (Array (_ BitVec 32) ValueCell!16118)) (size!41612 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85120)

(declare-fun mapRest!52607 () (Array (_ BitVec 32) ValueCell!16118))

(assert (=> mapNonEmpty!52607 (= (arr!41062 _values!1445) (store mapRest!52607 mapKey!52607 mapValue!52607))))

(declare-fun b!1285918 () Bool)

(declare-fun e!734510 () Bool)

(declare-fun e!734507 () Bool)

(assert (=> b!1285918 (= e!734510 (and e!734507 mapRes!52607))))

(declare-fun condMapEmpty!52607 () Bool)

(declare-fun mapDefault!52607 () ValueCell!16118)

