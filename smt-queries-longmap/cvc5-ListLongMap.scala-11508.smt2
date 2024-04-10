; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133932 () Bool)

(assert start!133932)

(declare-fun b_free!32155 () Bool)

(declare-fun b_next!32155 () Bool)

(assert (=> start!133932 (= b_free!32155 (not b_next!32155))))

(declare-fun tp!113766 () Bool)

(declare-fun b_and!51751 () Bool)

(assert (=> start!133932 (= tp!113766 b_and!51751)))

(declare-fun b!1565608 () Bool)

(declare-fun res!1070207 () Bool)

(declare-fun e!872656 () Bool)

(assert (=> b!1565608 (=> (not res!1070207) (not e!872656))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104548 0))(
  ( (array!104549 (arr!50461 (Array (_ BitVec 32) (_ BitVec 64))) (size!51011 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104548)

(assert (=> b!1565608 (= res!1070207 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51011 _keys!637)) (bvslt from!782 (size!51011 _keys!637))))))

(declare-fun mapNonEmpty!59785 () Bool)

(declare-fun mapRes!59785 () Bool)

(declare-fun tp!113767 () Bool)

(declare-fun e!872654 () Bool)

(assert (=> mapNonEmpty!59785 (= mapRes!59785 (and tp!113767 e!872654))))

(declare-datatypes ((V!60113 0))(
  ( (V!60114 (val!19548 Int)) )
))
(declare-datatypes ((ValueCell!18434 0))(
  ( (ValueCellFull!18434 (v!22304 V!60113)) (EmptyCell!18434) )
))
(declare-datatypes ((array!104550 0))(
  ( (array!104551 (arr!50462 (Array (_ BitVec 32) ValueCell!18434)) (size!51012 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104550)

(declare-fun mapRest!59785 () (Array (_ BitVec 32) ValueCell!18434))

(declare-fun mapValue!59785 () ValueCell!18434)

(declare-fun mapKey!59785 () (_ BitVec 32))

(assert (=> mapNonEmpty!59785 (= (arr!50462 _values!487) (store mapRest!59785 mapKey!59785 mapValue!59785))))

(declare-fun b!1565609 () Bool)

(declare-fun e!872652 () Bool)

(declare-fun e!872653 () Bool)

(assert (=> b!1565609 (= e!872652 (and e!872653 mapRes!59785))))

(declare-fun condMapEmpty!59785 () Bool)

(declare-fun mapDefault!59785 () ValueCell!18434)

