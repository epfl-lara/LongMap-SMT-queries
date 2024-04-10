; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4550 () Bool)

(assert start!4550)

(declare-fun b_free!1271 () Bool)

(declare-fun b_next!1271 () Bool)

(assert (=> start!4550 (= b_free!1271 (not b_next!1271))))

(declare-fun tp!5257 () Bool)

(declare-fun b_and!2097 () Bool)

(assert (=> start!4550 (= tp!5257 b_and!2097)))

(declare-fun b!35564 () Bool)

(declare-fun e!22465 () Bool)

(declare-fun e!22469 () Bool)

(declare-fun mapRes!1990 () Bool)

(assert (=> b!35564 (= e!22465 (and e!22469 mapRes!1990))))

(declare-fun condMapEmpty!1990 () Bool)

(declare-datatypes ((V!1991 0))(
  ( (V!1992 (val!839 Int)) )
))
(declare-datatypes ((ValueCell!613 0))(
  ( (ValueCellFull!613 (v!1936 V!1991)) (EmptyCell!613) )
))
(declare-datatypes ((array!2467 0))(
  ( (array!2468 (arr!1179 (Array (_ BitVec 32) ValueCell!613)) (size!1280 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2467)

(declare-fun mapDefault!1990 () ValueCell!613)

