; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99538 () Bool)

(assert start!99538)

(declare-fun b_free!25117 () Bool)

(declare-fun b_next!25117 () Bool)

(assert (=> start!99538 (= b_free!25117 (not b_next!25117))))

(declare-fun tp!88065 () Bool)

(declare-fun b_and!41101 () Bool)

(assert (=> start!99538 (= tp!88065 b_and!41101)))

(declare-fun b!1177645 () Bool)

(declare-fun res!782274 () Bool)

(declare-fun e!669463 () Bool)

(assert (=> b!1177645 (=> (not res!782274) (not e!669463))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76101 0))(
  ( (array!76102 (arr!36700 (Array (_ BitVec 32) (_ BitVec 64))) (size!37236 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76101)

(assert (=> b!1177645 (= res!782274 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37236 _keys!1208))))))

(declare-fun mapIsEmpty!46298 () Bool)

(declare-fun mapRes!46298 () Bool)

(assert (=> mapIsEmpty!46298 mapRes!46298))

(declare-fun b!1177646 () Bool)

(declare-fun res!782277 () Bool)

(assert (=> b!1177646 (=> (not res!782277) (not e!669463))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1177646 (= res!782277 (= (select (arr!36700 _keys!1208) i!673) k!934))))

(declare-fun b!1177647 () Bool)

(declare-fun res!782275 () Bool)

(assert (=> b!1177647 (=> (not res!782275) (not e!669463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177647 (= res!782275 (validKeyInArray!0 k!934))))

(declare-fun b!1177648 () Bool)

(declare-fun e!669467 () Bool)

(declare-fun e!669458 () Bool)

(assert (=> b!1177648 (= e!669467 (and e!669458 mapRes!46298))))

(declare-fun condMapEmpty!46298 () Bool)

(declare-datatypes ((V!44657 0))(
  ( (V!44658 (val!14880 Int)) )
))
(declare-datatypes ((ValueCell!14114 0))(
  ( (ValueCellFull!14114 (v!17518 V!44657)) (EmptyCell!14114) )
))
(declare-datatypes ((array!76103 0))(
  ( (array!76104 (arr!36701 (Array (_ BitVec 32) ValueCell!14114)) (size!37237 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76103)

(declare-fun mapDefault!46298 () ValueCell!14114)

