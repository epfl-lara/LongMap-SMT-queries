; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98864 () Bool)

(assert start!98864)

(declare-fun b_free!24469 () Bool)

(declare-fun b_next!24469 () Bool)

(assert (=> start!98864 (= b_free!24469 (not b_next!24469))))

(declare-fun tp!86118 () Bool)

(declare-fun b_and!39787 () Bool)

(assert (=> start!98864 (= tp!86118 b_and!39787)))

(declare-fun b!1156586 () Bool)

(declare-fun e!657759 () Bool)

(declare-fun e!657751 () Bool)

(declare-fun mapRes!45323 () Bool)

(assert (=> b!1156586 (= e!657759 (and e!657751 mapRes!45323))))

(declare-fun condMapEmpty!45323 () Bool)

(declare-datatypes ((V!43793 0))(
  ( (V!43794 (val!14556 Int)) )
))
(declare-datatypes ((ValueCell!13790 0))(
  ( (ValueCellFull!13790 (v!17193 V!43793)) (EmptyCell!13790) )
))
(declare-datatypes ((array!74845 0))(
  ( (array!74846 (arr!36073 (Array (_ BitVec 32) ValueCell!13790)) (size!36609 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74845)

(declare-fun mapDefault!45323 () ValueCell!13790)

