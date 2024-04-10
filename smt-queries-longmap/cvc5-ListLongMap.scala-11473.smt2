; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133636 () Bool)

(assert start!133636)

(declare-fun b_free!32053 () Bool)

(declare-fun b_next!32053 () Bool)

(assert (=> start!133636 (= b_free!32053 (not b_next!32053))))

(declare-fun tp!113283 () Bool)

(declare-fun b_and!51617 () Bool)

(assert (=> start!133636 (= tp!113283 b_and!51617)))

(declare-fun b!1562553 () Bool)

(declare-fun e!870730 () Bool)

(declare-fun e!870729 () Bool)

(declare-fun mapRes!59454 () Bool)

(assert (=> b!1562553 (= e!870730 (and e!870729 mapRes!59454))))

(declare-fun condMapEmpty!59454 () Bool)

(declare-datatypes ((V!59833 0))(
  ( (V!59834 (val!19443 Int)) )
))
(declare-datatypes ((ValueCell!18329 0))(
  ( (ValueCellFull!18329 (v!22195 V!59833)) (EmptyCell!18329) )
))
(declare-datatypes ((array!104154 0))(
  ( (array!104155 (arr!50269 (Array (_ BitVec 32) ValueCell!18329)) (size!50819 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104154)

(declare-fun mapDefault!59454 () ValueCell!18329)

