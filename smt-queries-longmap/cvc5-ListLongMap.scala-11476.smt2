; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133654 () Bool)

(assert start!133654)

(declare-fun mapNonEmpty!59481 () Bool)

(declare-fun mapRes!59481 () Bool)

(declare-fun tp!113316 () Bool)

(declare-fun e!870867 () Bool)

(assert (=> mapNonEmpty!59481 (= mapRes!59481 (and tp!113316 e!870867))))

(declare-datatypes ((V!59857 0))(
  ( (V!59858 (val!19452 Int)) )
))
(declare-datatypes ((ValueCell!18338 0))(
  ( (ValueCellFull!18338 (v!22204 V!59857)) (EmptyCell!18338) )
))
(declare-fun mapValue!59481 () ValueCell!18338)

(declare-fun mapRest!59481 () (Array (_ BitVec 32) ValueCell!18338))

(declare-datatypes ((array!104186 0))(
  ( (array!104187 (arr!50285 (Array (_ BitVec 32) ValueCell!18338)) (size!50835 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104186)

(declare-fun mapKey!59481 () (_ BitVec 32))

(assert (=> mapNonEmpty!59481 (= (arr!50285 _values!487) (store mapRest!59481 mapKey!59481 mapValue!59481))))

(declare-fun b!1562742 () Bool)

(declare-fun e!870866 () Bool)

(declare-fun e!870865 () Bool)

(assert (=> b!1562742 (= e!870866 (and e!870865 mapRes!59481))))

(declare-fun condMapEmpty!59481 () Bool)

(declare-fun mapDefault!59481 () ValueCell!18338)

