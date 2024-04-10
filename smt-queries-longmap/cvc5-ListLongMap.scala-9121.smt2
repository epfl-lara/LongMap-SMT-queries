; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109510 () Bool)

(assert start!109510)

(declare-fun b_free!28999 () Bool)

(declare-fun b_next!28999 () Bool)

(assert (=> start!109510 (= b_free!28999 (not b_next!28999))))

(declare-fun tp!102115 () Bool)

(declare-fun b_and!47089 () Bool)

(assert (=> start!109510 (= tp!102115 b_and!47089)))

(declare-fun mapIsEmpty!53519 () Bool)

(declare-fun mapRes!53519 () Bool)

(assert (=> mapIsEmpty!53519 mapRes!53519))

(declare-fun b!1297023 () Bool)

(declare-fun e!739967 () Bool)

(declare-fun e!739965 () Bool)

(assert (=> b!1297023 (= e!739967 (and e!739965 mapRes!53519))))

(declare-fun condMapEmpty!53519 () Bool)

(declare-datatypes ((V!51289 0))(
  ( (V!51290 (val!17394 Int)) )
))
(declare-datatypes ((ValueCell!16421 0))(
  ( (ValueCellFull!16421 (v!19997 V!51289)) (EmptyCell!16421) )
))
(declare-datatypes ((array!86294 0))(
  ( (array!86295 (arr!41648 (Array (_ BitVec 32) ValueCell!16421)) (size!42198 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86294)

(declare-fun mapDefault!53519 () ValueCell!16421)

