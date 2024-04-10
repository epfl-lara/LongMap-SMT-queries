; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108908 () Bool)

(assert start!108908)

(declare-fun b_free!28421 () Bool)

(declare-fun b_next!28421 () Bool)

(assert (=> start!108908 (= b_free!28421 (not b_next!28421))))

(declare-fun tp!100379 () Bool)

(declare-fun b_and!46503 () Bool)

(assert (=> start!108908 (= tp!100379 b_and!46503)))

(declare-fun b!1286639 () Bool)

(declare-datatypes ((Unit!42538 0))(
  ( (Unit!42539) )
))
(declare-fun e!734855 () Unit!42538)

(declare-fun Unit!42540 () Unit!42538)

(assert (=> b!1286639 (= e!734855 Unit!42540)))

(declare-fun b!1286640 () Bool)

(declare-fun res!854627 () Bool)

(declare-fun e!734850 () Bool)

(assert (=> b!1286640 (=> (not res!854627) (not e!734850))))

(declare-datatypes ((array!85170 0))(
  ( (array!85171 (arr!41087 (Array (_ BitVec 32) (_ BitVec 64))) (size!41637 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85170)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286640 (= res!854627 (validKeyInArray!0 (select (arr!41087 _keys!1741) from!2144)))))

(declare-fun b!1286641 () Bool)

(declare-fun e!734847 () Bool)

(declare-fun e!734849 () Bool)

(declare-fun mapRes!52649 () Bool)

(assert (=> b!1286641 (= e!734847 (and e!734849 mapRes!52649))))

(declare-fun condMapEmpty!52649 () Bool)

(declare-datatypes ((V!50517 0))(
  ( (V!50518 (val!17105 Int)) )
))
(declare-datatypes ((ValueCell!16132 0))(
  ( (ValueCellFull!16132 (v!19707 V!50517)) (EmptyCell!16132) )
))
(declare-datatypes ((array!85172 0))(
  ( (array!85173 (arr!41088 (Array (_ BitVec 32) ValueCell!16132)) (size!41638 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85172)

(declare-fun mapDefault!52649 () ValueCell!16132)

