; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113172 () Bool)

(assert start!113172)

(declare-fun b_free!31223 () Bool)

(declare-fun b_next!31223 () Bool)

(assert (=> start!113172 (= b_free!31223 (not b_next!31223))))

(declare-fun tp!109474 () Bool)

(declare-fun b_and!50353 () Bool)

(assert (=> start!113172 (= tp!109474 b_and!50353)))

(declare-fun b!1342131 () Bool)

(declare-fun e!764149 () Bool)

(declare-fun e!764151 () Bool)

(declare-fun mapRes!57541 () Bool)

(assert (=> b!1342131 (= e!764149 (and e!764151 mapRes!57541))))

(declare-fun condMapEmpty!57541 () Bool)

(declare-datatypes ((V!54733 0))(
  ( (V!54734 (val!18686 Int)) )
))
(declare-datatypes ((ValueCell!17713 0))(
  ( (ValueCellFull!17713 (v!21334 V!54733)) (EmptyCell!17713) )
))
(declare-datatypes ((array!91298 0))(
  ( (array!91299 (arr!44105 (Array (_ BitVec 32) ValueCell!17713)) (size!44655 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91298)

(declare-fun mapDefault!57541 () ValueCell!17713)

