; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133658 () Bool)

(assert start!133658)

(declare-fun mapNonEmpty!59487 () Bool)

(declare-fun mapRes!59487 () Bool)

(declare-fun tp!113322 () Bool)

(declare-fun e!870896 () Bool)

(assert (=> mapNonEmpty!59487 (= mapRes!59487 (and tp!113322 e!870896))))

(declare-fun mapKey!59487 () (_ BitVec 32))

(declare-datatypes ((V!59861 0))(
  ( (V!59862 (val!19454 Int)) )
))
(declare-datatypes ((ValueCell!18340 0))(
  ( (ValueCellFull!18340 (v!22206 V!59861)) (EmptyCell!18340) )
))
(declare-fun mapRest!59487 () (Array (_ BitVec 32) ValueCell!18340))

(declare-fun mapValue!59487 () ValueCell!18340)

(declare-datatypes ((array!104192 0))(
  ( (array!104193 (arr!50288 (Array (_ BitVec 32) ValueCell!18340)) (size!50838 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104192)

(assert (=> mapNonEmpty!59487 (= (arr!50288 _values!487) (store mapRest!59487 mapKey!59487 mapValue!59487))))

(declare-fun b!1562778 () Bool)

(declare-fun e!870895 () Bool)

(declare-fun tp_is_empty!38741 () Bool)

(assert (=> b!1562778 (= e!870895 tp_is_empty!38741)))

(declare-fun b!1562779 () Bool)

(declare-fun e!870894 () Bool)

(assert (=> b!1562779 (= e!870894 (and e!870895 mapRes!59487))))

(declare-fun condMapEmpty!59487 () Bool)

(declare-fun mapDefault!59487 () ValueCell!18340)

