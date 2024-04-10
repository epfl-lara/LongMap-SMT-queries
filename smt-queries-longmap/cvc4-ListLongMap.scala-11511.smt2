; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133954 () Bool)

(assert start!133954)

(declare-fun b_free!32177 () Bool)

(declare-fun b_next!32177 () Bool)

(assert (=> start!133954 (= b_free!32177 (not b_next!32177))))

(declare-fun tp!113833 () Bool)

(declare-fun b_and!51795 () Bool)

(assert (=> start!133954 (= tp!113833 b_and!51795)))

(declare-fun b!1565952 () Bool)

(declare-fun e!872835 () Bool)

(declare-fun e!872839 () Bool)

(declare-fun mapRes!59818 () Bool)

(assert (=> b!1565952 (= e!872835 (and e!872839 mapRes!59818))))

(declare-fun condMapEmpty!59818 () Bool)

(declare-datatypes ((V!60141 0))(
  ( (V!60142 (val!19559 Int)) )
))
(declare-datatypes ((ValueCell!18445 0))(
  ( (ValueCellFull!18445 (v!22315 V!60141)) (EmptyCell!18445) )
))
(declare-datatypes ((array!104590 0))(
  ( (array!104591 (arr!50482 (Array (_ BitVec 32) ValueCell!18445)) (size!51032 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104590)

(declare-fun mapDefault!59818 () ValueCell!18445)

