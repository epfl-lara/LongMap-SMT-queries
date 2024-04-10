; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131932 () Bool)

(assert start!131932)

(declare-fun b_free!31645 () Bool)

(declare-fun b_next!31645 () Bool)

(assert (=> start!131932 (= b_free!31645 (not b_next!31645))))

(declare-fun tp!111187 () Bool)

(declare-fun b_and!51055 () Bool)

(assert (=> start!131932 (= tp!111187 b_and!51055)))

(declare-fun b!1544935 () Bool)

(declare-fun res!1059597 () Bool)

(declare-fun e!859938 () Bool)

(assert (=> b!1544935 (=> (not res!1059597) (not e!859938))))

(declare-datatypes ((array!103050 0))(
  ( (array!103051 (arr!49727 (Array (_ BitVec 32) (_ BitVec 64))) (size!50277 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103050)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!59005 0))(
  ( (V!59006 (val!19038 Int)) )
))
(declare-datatypes ((ValueCell!18050 0))(
  ( (ValueCellFull!18050 (v!21839 V!59005)) (EmptyCell!18050) )
))
(declare-datatypes ((array!103052 0))(
  ( (array!103053 (arr!49728 (Array (_ BitVec 32) ValueCell!18050)) (size!50278 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103052)

(assert (=> b!1544935 (= res!1059597 (and (= (size!50278 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50277 _keys!618) (size!50278 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544936 () Bool)

(declare-fun e!859941 () Bool)

(declare-fun tp_is_empty!37921 () Bool)

(assert (=> b!1544936 (= e!859941 tp_is_empty!37921)))

(declare-fun b!1544937 () Bool)

(declare-fun e!859940 () Bool)

(declare-fun mapRes!58585 () Bool)

(assert (=> b!1544937 (= e!859940 (and e!859941 mapRes!58585))))

(declare-fun condMapEmpty!58585 () Bool)

(declare-fun mapDefault!58585 () ValueCell!18050)

