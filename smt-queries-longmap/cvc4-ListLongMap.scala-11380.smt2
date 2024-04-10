; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132250 () Bool)

(assert start!132250)

(declare-fun b_free!31901 () Bool)

(declare-fun b_next!31901 () Bool)

(assert (=> start!132250 (= b_free!31901 (not b_next!31901))))

(declare-fun tp!111964 () Bool)

(declare-fun b_and!51335 () Bool)

(assert (=> start!132250 (= tp!111964 b_and!51335)))

(declare-fun b!1551509 () Bool)

(declare-fun res!1062469 () Bool)

(declare-fun e!863693 () Bool)

(assert (=> b!1551509 (=> (not res!1062469) (not e!863693))))

(declare-datatypes ((array!103556 0))(
  ( (array!103557 (arr!49977 (Array (_ BitVec 32) (_ BitVec 64))) (size!50527 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103556)

(declare-datatypes ((List!36187 0))(
  ( (Nil!36184) (Cons!36183 (h!37628 (_ BitVec 64)) (t!50899 List!36187)) )
))
(declare-fun arrayNoDuplicates!0 (array!103556 (_ BitVec 32) List!36187) Bool)

(assert (=> b!1551509 (= res!1062469 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36184))))

(declare-fun b!1551510 () Bool)

(declare-fun e!863689 () Bool)

(declare-fun e!863695 () Bool)

(declare-fun mapRes!58978 () Bool)

(assert (=> b!1551510 (= e!863689 (and e!863695 mapRes!58978))))

(declare-fun condMapEmpty!58978 () Bool)

(declare-datatypes ((V!59345 0))(
  ( (V!59346 (val!19166 Int)) )
))
(declare-datatypes ((ValueCell!18178 0))(
  ( (ValueCellFull!18178 (v!21970 V!59345)) (EmptyCell!18178) )
))
(declare-datatypes ((array!103558 0))(
  ( (array!103559 (arr!49978 (Array (_ BitVec 32) ValueCell!18178)) (size!50528 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103558)

(declare-fun mapDefault!58978 () ValueCell!18178)

