; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82966 () Bool)

(assert start!82966)

(declare-fun b_free!19093 () Bool)

(declare-fun b_next!19093 () Bool)

(assert (=> start!82966 (= b_free!19093 (not b_next!19093))))

(declare-fun tp!66407 () Bool)

(declare-fun b_and!30581 () Bool)

(assert (=> start!82966 (= tp!66407 b_and!30581)))

(declare-fun b!968391 () Bool)

(declare-fun res!648312 () Bool)

(declare-fun e!545729 () Bool)

(assert (=> b!968391 (=> (not res!648312) (not e!545729))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34185 0))(
  ( (V!34186 (val!11001 Int)) )
))
(declare-datatypes ((ValueCell!10469 0))(
  ( (ValueCellFull!10469 (v!13559 V!34185)) (EmptyCell!10469) )
))
(declare-datatypes ((array!59871 0))(
  ( (array!59872 (arr!28804 (Array (_ BitVec 32) ValueCell!10469)) (size!29283 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59871)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-datatypes ((array!59873 0))(
  ( (array!59874 (arr!28805 (Array (_ BitVec 32) (_ BitVec 64))) (size!29284 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59873)

(assert (=> b!968391 (= res!648312 (and (= (size!29283 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29284 _keys!1686) (size!29283 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968392 () Bool)

(declare-fun e!545728 () Bool)

(declare-fun e!545725 () Bool)

(declare-fun mapRes!34846 () Bool)

(assert (=> b!968392 (= e!545728 (and e!545725 mapRes!34846))))

(declare-fun condMapEmpty!34846 () Bool)

(declare-fun mapDefault!34846 () ValueCell!10469)

