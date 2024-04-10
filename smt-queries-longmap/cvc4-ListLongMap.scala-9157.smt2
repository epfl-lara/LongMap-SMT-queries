; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109826 () Bool)

(assert start!109826)

(declare-fun b_free!29219 () Bool)

(declare-fun b_next!29219 () Bool)

(assert (=> start!109826 (= b_free!29219 (not b_next!29219))))

(declare-fun tp!102790 () Bool)

(declare-fun b_and!47337 () Bool)

(assert (=> start!109826 (= tp!102790 b_and!47337)))

(declare-fun b!1301328 () Bool)

(declare-datatypes ((Unit!43070 0))(
  ( (Unit!43071) )
))
(declare-fun e!742237 () Unit!43070)

(declare-fun Unit!43072 () Unit!43070)

(assert (=> b!1301328 (= e!742237 Unit!43072)))

(declare-fun b!1301329 () Bool)

(declare-fun e!742235 () Bool)

(declare-fun e!742234 () Bool)

(declare-fun mapRes!53864 () Bool)

(assert (=> b!1301329 (= e!742235 (and e!742234 mapRes!53864))))

(declare-fun condMapEmpty!53864 () Bool)

(declare-datatypes ((V!51581 0))(
  ( (V!51582 (val!17504 Int)) )
))
(declare-datatypes ((ValueCell!16531 0))(
  ( (ValueCellFull!16531 (v!20112 V!51581)) (EmptyCell!16531) )
))
(declare-datatypes ((array!86728 0))(
  ( (array!86729 (arr!41860 (Array (_ BitVec 32) ValueCell!16531)) (size!42410 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86728)

(declare-fun mapDefault!53864 () ValueCell!16531)

