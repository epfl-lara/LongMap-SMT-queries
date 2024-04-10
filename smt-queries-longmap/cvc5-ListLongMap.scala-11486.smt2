; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133714 () Bool)

(assert start!133714)

(declare-fun b_free!32077 () Bool)

(declare-fun b_next!32077 () Bool)

(assert (=> start!133714 (= b_free!32077 (not b_next!32077))))

(declare-fun tp!113435 () Bool)

(declare-fun b_and!51647 () Bool)

(assert (=> start!133714 (= tp!113435 b_and!51647)))

(declare-fun b!1563425 () Bool)

(declare-fun e!871347 () Bool)

(declare-fun tp_is_empty!38797 () Bool)

(assert (=> b!1563425 (= e!871347 tp_is_empty!38797)))

(declare-fun b!1563426 () Bool)

(declare-fun res!1068839 () Bool)

(declare-fun e!871348 () Bool)

(assert (=> b!1563426 (=> (not res!1068839) (not e!871348))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104290 0))(
  ( (array!104291 (arr!50337 (Array (_ BitVec 32) (_ BitVec 64))) (size!50887 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104290)

(declare-datatypes ((V!59937 0))(
  ( (V!59938 (val!19482 Int)) )
))
(declare-datatypes ((ValueCell!18368 0))(
  ( (ValueCellFull!18368 (v!22234 V!59937)) (EmptyCell!18368) )
))
(declare-datatypes ((array!104292 0))(
  ( (array!104293 (arr!50338 (Array (_ BitVec 32) ValueCell!18368)) (size!50888 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104292)

(assert (=> b!1563426 (= res!1068839 (and (= (size!50888 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50887 _keys!637) (size!50888 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563428 () Bool)

(declare-fun e!871346 () Bool)

(declare-fun mapRes!59571 () Bool)

(assert (=> b!1563428 (= e!871346 (and e!871347 mapRes!59571))))

(declare-fun condMapEmpty!59571 () Bool)

(declare-fun mapDefault!59571 () ValueCell!18368)

