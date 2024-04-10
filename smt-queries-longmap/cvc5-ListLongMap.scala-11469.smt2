; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133612 () Bool)

(assert start!133612)

(declare-fun b_free!32029 () Bool)

(declare-fun b_next!32029 () Bool)

(assert (=> start!133612 (= b_free!32029 (not b_next!32029))))

(declare-fun tp!113210 () Bool)

(declare-fun b_and!51569 () Bool)

(assert (=> start!133612 (= tp!113210 b_and!51569)))

(declare-fun b!1562205 () Bool)

(declare-fun e!870552 () Bool)

(declare-fun e!870553 () Bool)

(declare-fun mapRes!59418 () Bool)

(assert (=> b!1562205 (= e!870552 (and e!870553 mapRes!59418))))

(declare-fun condMapEmpty!59418 () Bool)

(declare-datatypes ((V!59801 0))(
  ( (V!59802 (val!19431 Int)) )
))
(declare-datatypes ((ValueCell!18317 0))(
  ( (ValueCellFull!18317 (v!22183 V!59801)) (EmptyCell!18317) )
))
(declare-datatypes ((array!104108 0))(
  ( (array!104109 (arr!50246 (Array (_ BitVec 32) ValueCell!18317)) (size!50796 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104108)

(declare-fun mapDefault!59418 () ValueCell!18317)

