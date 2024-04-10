; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109276 () Bool)

(assert start!109276)

(declare-fun b_free!28765 () Bool)

(declare-fun b_next!28765 () Bool)

(assert (=> start!109276 (= b_free!28765 (not b_next!28765))))

(declare-fun tp!101413 () Bool)

(declare-fun b_and!46855 () Bool)

(assert (=> start!109276 (= tp!101413 b_and!46855)))

(declare-fun b!1292972 () Bool)

(declare-fun e!737942 () Bool)

(declare-fun tp_is_empty!34405 () Bool)

(assert (=> b!1292972 (= e!737942 tp_is_empty!34405)))

(declare-fun b!1292973 () Bool)

(declare-fun e!737940 () Bool)

(declare-fun mapRes!53168 () Bool)

(assert (=> b!1292973 (= e!737940 (and e!737942 mapRes!53168))))

(declare-fun condMapEmpty!53168 () Bool)

(declare-datatypes ((V!50977 0))(
  ( (V!50978 (val!17277 Int)) )
))
(declare-datatypes ((ValueCell!16304 0))(
  ( (ValueCellFull!16304 (v!19880 V!50977)) (EmptyCell!16304) )
))
(declare-datatypes ((array!85842 0))(
  ( (array!85843 (arr!41422 (Array (_ BitVec 32) ValueCell!16304)) (size!41972 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85842)

(declare-fun mapDefault!53168 () ValueCell!16304)

