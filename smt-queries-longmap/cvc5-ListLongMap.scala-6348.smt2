; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81824 () Bool)

(assert start!81824)

(declare-fun b_free!18319 () Bool)

(declare-fun b_next!18319 () Bool)

(assert (=> start!81824 (= b_free!18319 (not b_next!18319))))

(declare-fun tp!63656 () Bool)

(declare-fun b_and!29805 () Bool)

(assert (=> start!81824 (= tp!63656 b_and!29805)))

(declare-fun b!954184 () Bool)

(declare-fun res!638966 () Bool)

(declare-fun e!537583 () Bool)

(assert (=> b!954184 (=> (not res!638966) (not e!537583))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!57839 0))(
  ( (array!57840 (arr!27799 (Array (_ BitVec 32) (_ BitVec 64))) (size!28278 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57839)

(declare-datatypes ((V!32801 0))(
  ( (V!32802 (val!10482 Int)) )
))
(declare-datatypes ((ValueCell!9950 0))(
  ( (ValueCellFull!9950 (v!13037 V!32801)) (EmptyCell!9950) )
))
(declare-datatypes ((array!57841 0))(
  ( (array!57842 (arr!27800 (Array (_ BitVec 32) ValueCell!9950)) (size!28279 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57841)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!954184 (= res!638966 (and (= (size!28279 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28278 _keys!1441) (size!28279 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954185 () Bool)

(declare-fun e!537581 () Bool)

(declare-fun e!537582 () Bool)

(declare-fun mapRes!33256 () Bool)

(assert (=> b!954185 (= e!537581 (and e!537582 mapRes!33256))))

(declare-fun condMapEmpty!33256 () Bool)

(declare-fun mapDefault!33256 () ValueCell!9950)

