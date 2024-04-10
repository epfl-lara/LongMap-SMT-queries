; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98534 () Bool)

(assert start!98534)

(declare-fun b_free!24139 () Bool)

(declare-fun b_next!24139 () Bool)

(assert (=> start!98534 (= b_free!24139 (not b_next!24139))))

(declare-fun tp!85127 () Bool)

(declare-fun b_and!39127 () Bool)

(assert (=> start!98534 (= tp!85127 b_and!39127)))

(declare-fun b!1141494 () Bool)

(declare-fun e!649418 () Bool)

(declare-fun e!649427 () Bool)

(declare-fun mapRes!44828 () Bool)

(assert (=> b!1141494 (= e!649418 (and e!649427 mapRes!44828))))

(declare-fun condMapEmpty!44828 () Bool)

(declare-datatypes ((V!43353 0))(
  ( (V!43354 (val!14391 Int)) )
))
(declare-datatypes ((ValueCell!13625 0))(
  ( (ValueCellFull!13625 (v!17028 V!43353)) (EmptyCell!13625) )
))
(declare-datatypes ((array!74195 0))(
  ( (array!74196 (arr!35748 (Array (_ BitVec 32) ValueCell!13625)) (size!36284 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74195)

(declare-fun mapDefault!44828 () ValueCell!13625)

