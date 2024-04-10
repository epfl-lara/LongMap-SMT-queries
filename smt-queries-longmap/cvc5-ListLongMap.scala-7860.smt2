; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97904 () Bool)

(assert start!97904)

(declare-fun b_free!23605 () Bool)

(declare-fun b_next!23605 () Bool)

(assert (=> start!97904 (= b_free!23605 (not b_next!23605))))

(declare-fun tp!83519 () Bool)

(declare-fun b_and!37993 () Bool)

(assert (=> start!97904 (= tp!83519 b_and!37993)))

(declare-fun mapNonEmpty!44020 () Bool)

(declare-fun mapRes!44020 () Bool)

(declare-fun tp!83518 () Bool)

(declare-fun e!638482 () Bool)

(assert (=> mapNonEmpty!44020 (= mapRes!44020 (and tp!83518 e!638482))))

(declare-fun mapKey!44020 () (_ BitVec 32))

(declare-datatypes ((V!42641 0))(
  ( (V!42642 (val!14124 Int)) )
))
(declare-datatypes ((ValueCell!13358 0))(
  ( (ValueCellFull!13358 (v!16757 V!42641)) (EmptyCell!13358) )
))
(declare-fun mapRest!44020 () (Array (_ BitVec 32) ValueCell!13358))

(declare-datatypes ((array!73151 0))(
  ( (array!73152 (arr!35228 (Array (_ BitVec 32) ValueCell!13358)) (size!35764 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73151)

(declare-fun mapValue!44020 () ValueCell!13358)

(assert (=> mapNonEmpty!44020 (= (arr!35228 _values!996) (store mapRest!44020 mapKey!44020 mapValue!44020))))

(declare-fun b!1121375 () Bool)

(declare-fun res!749153 () Bool)

(declare-fun e!638488 () Bool)

(assert (=> b!1121375 (=> (not res!749153) (not e!638488))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73153 0))(
  ( (array!73154 (arr!35229 (Array (_ BitVec 32) (_ BitVec 64))) (size!35765 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73153)

(assert (=> b!1121375 (= res!749153 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35765 _keys!1208))))))

(declare-fun b!1121376 () Bool)

(declare-fun e!638486 () Bool)

(declare-fun e!638484 () Bool)

(assert (=> b!1121376 (= e!638486 (and e!638484 mapRes!44020))))

(declare-fun condMapEmpty!44020 () Bool)

(declare-fun mapDefault!44020 () ValueCell!13358)

