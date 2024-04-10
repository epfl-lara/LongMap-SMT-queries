; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98018 () Bool)

(assert start!98018)

(declare-fun b_free!23719 () Bool)

(declare-fun b_next!23719 () Bool)

(assert (=> start!98018 (= b_free!23719 (not b_next!23719))))

(declare-fun tp!83861 () Bool)

(declare-fun b_and!38221 () Bool)

(assert (=> start!98018 (= tp!83861 b_and!38221)))

(declare-fun b!1124636 () Bool)

(declare-fun res!751436 () Bool)

(declare-fun e!640205 () Bool)

(assert (=> b!1124636 (=> (not res!751436) (not e!640205))))

(declare-datatypes ((array!73365 0))(
  ( (array!73366 (arr!35335 (Array (_ BitVec 32) (_ BitVec 64))) (size!35871 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73365)

(declare-datatypes ((List!24595 0))(
  ( (Nil!24592) (Cons!24591 (h!25800 (_ BitVec 64)) (t!35306 List!24595)) )
))
(declare-fun arrayNoDuplicates!0 (array!73365 (_ BitVec 32) List!24595) Bool)

(assert (=> b!1124636 (= res!751436 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24592))))

(declare-fun b!1124637 () Bool)

(declare-fun e!640208 () Bool)

(declare-fun e!640214 () Bool)

(declare-fun mapRes!44191 () Bool)

(assert (=> b!1124637 (= e!640208 (and e!640214 mapRes!44191))))

(declare-fun condMapEmpty!44191 () Bool)

(declare-datatypes ((V!42793 0))(
  ( (V!42794 (val!14181 Int)) )
))
(declare-datatypes ((ValueCell!13415 0))(
  ( (ValueCellFull!13415 (v!16814 V!42793)) (EmptyCell!13415) )
))
(declare-datatypes ((array!73367 0))(
  ( (array!73368 (arr!35336 (Array (_ BitVec 32) ValueCell!13415)) (size!35872 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73367)

(declare-fun mapDefault!44191 () ValueCell!13415)

