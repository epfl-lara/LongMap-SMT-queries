; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112974 () Bool)

(assert start!112974)

(declare-fun b!1339139 () Bool)

(declare-fun e!762664 () Bool)

(declare-fun tp_is_empty!37025 () Bool)

(assert (=> b!1339139 (= e!762664 tp_is_empty!37025)))

(declare-fun b!1339140 () Bool)

(declare-fun e!762666 () Bool)

(declare-fun e!762665 () Bool)

(declare-fun mapRes!57244 () Bool)

(assert (=> b!1339140 (= e!762666 (and e!762665 mapRes!57244))))

(declare-fun condMapEmpty!57244 () Bool)

(declare-datatypes ((V!54469 0))(
  ( (V!54470 (val!18587 Int)) )
))
(declare-datatypes ((ValueCell!17614 0))(
  ( (ValueCellFull!17614 (v!21235 V!54469)) (EmptyCell!17614) )
))
(declare-datatypes ((array!90914 0))(
  ( (array!90915 (arr!43913 (Array (_ BitVec 32) ValueCell!17614)) (size!44463 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90914)

(declare-fun mapDefault!57244 () ValueCell!17614)

