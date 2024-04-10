; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112426 () Bool)

(assert start!112426)

(declare-fun b_free!30821 () Bool)

(declare-fun b_next!30821 () Bool)

(assert (=> start!112426 (= b_free!30821 (not b_next!30821))))

(declare-fun tp!108100 () Bool)

(declare-fun b_and!49663 () Bool)

(assert (=> start!112426 (= tp!108100 b_and!49663)))

(declare-fun b!1332915 () Bool)

(declare-fun e!759358 () Bool)

(declare-fun e!759361 () Bool)

(declare-fun mapRes!56770 () Bool)

(assert (=> b!1332915 (= e!759358 (and e!759361 mapRes!56770))))

(declare-fun condMapEmpty!56770 () Bool)

(declare-datatypes ((V!54077 0))(
  ( (V!54078 (val!18440 Int)) )
))
(declare-datatypes ((ValueCell!17467 0))(
  ( (ValueCellFull!17467 (v!21077 V!54077)) (EmptyCell!17467) )
))
(declare-datatypes ((array!90338 0))(
  ( (array!90339 (arr!43635 (Array (_ BitVec 32) ValueCell!17467)) (size!44185 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90338)

(declare-fun mapDefault!56770 () ValueCell!17467)

