; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74350 () Bool)

(assert start!74350)

(declare-fun b_free!15113 () Bool)

(declare-fun b_next!15113 () Bool)

(assert (=> start!74350 (= b_free!15113 (not b_next!15113))))

(declare-fun tp!53014 () Bool)

(declare-fun b_and!24889 () Bool)

(assert (=> start!74350 (= tp!53014 b_and!24889)))

(declare-fun b!875063 () Bool)

(declare-fun res!594692 () Bool)

(declare-fun e!487157 () Bool)

(assert (=> b!875063 (=> (not res!594692) (not e!487157))))

(declare-datatypes ((array!50840 0))(
  ( (array!50841 (arr!24448 (Array (_ BitVec 32) (_ BitVec 64))) (size!24888 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50840)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50840 (_ BitVec 32)) Bool)

(assert (=> b!875063 (= res!594692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875064 () Bool)

(declare-fun e!487162 () Bool)

(declare-fun e!487160 () Bool)

(declare-fun mapRes!27644 () Bool)

(assert (=> b!875064 (= e!487162 (and e!487160 mapRes!27644))))

(declare-fun condMapEmpty!27644 () Bool)

(declare-datatypes ((V!28189 0))(
  ( (V!28190 (val!8726 Int)) )
))
(declare-datatypes ((ValueCell!8239 0))(
  ( (ValueCellFull!8239 (v!11155 V!28189)) (EmptyCell!8239) )
))
(declare-datatypes ((array!50842 0))(
  ( (array!50843 (arr!24449 (Array (_ BitVec 32) ValueCell!8239)) (size!24889 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50842)

(declare-fun mapDefault!27644 () ValueCell!8239)

