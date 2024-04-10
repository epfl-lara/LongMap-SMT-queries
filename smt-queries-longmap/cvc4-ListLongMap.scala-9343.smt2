; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111498 () Bool)

(assert start!111498)

(declare-fun b_free!30155 () Bool)

(declare-fun b_next!30155 () Bool)

(assert (=> start!111498 (= b_free!30155 (not b_next!30155))))

(declare-fun tp!105941 () Bool)

(declare-fun b_and!48469 () Bool)

(assert (=> start!111498 (= tp!105941 b_and!48469)))

(declare-fun b!1319930 () Bool)

(declare-fun e!753001 () Bool)

(declare-fun e!753000 () Bool)

(declare-fun mapRes!55610 () Bool)

(assert (=> b!1319930 (= e!753001 (and e!753000 mapRes!55610))))

(declare-fun condMapEmpty!55610 () Bool)

(declare-datatypes ((V!53069 0))(
  ( (V!53070 (val!18062 Int)) )
))
(declare-datatypes ((ValueCell!17089 0))(
  ( (ValueCellFull!17089 (v!20692 V!53069)) (EmptyCell!17089) )
))
(declare-datatypes ((array!88886 0))(
  ( (array!88887 (arr!42917 (Array (_ BitVec 32) ValueCell!17089)) (size!43467 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88886)

(declare-fun mapDefault!55610 () ValueCell!17089)

