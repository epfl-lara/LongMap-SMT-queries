; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74338 () Bool)

(assert start!74338)

(declare-fun b_free!15101 () Bool)

(declare-fun b_next!15101 () Bool)

(assert (=> start!74338 (= b_free!15101 (not b_next!15101))))

(declare-fun tp!52978 () Bool)

(declare-fun b_and!24877 () Bool)

(assert (=> start!74338 (= tp!52978 b_and!24877)))

(declare-fun b!874841 () Bool)

(declare-fun res!594539 () Bool)

(declare-fun e!487051 () Bool)

(assert (=> b!874841 (=> (not res!594539) (not e!487051))))

(declare-datatypes ((array!50818 0))(
  ( (array!50819 (arr!24437 (Array (_ BitVec 32) (_ BitVec 64))) (size!24877 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50818)

(declare-datatypes ((List!17344 0))(
  ( (Nil!17341) (Cons!17340 (h!18471 (_ BitVec 64)) (t!24385 List!17344)) )
))
(declare-fun arrayNoDuplicates!0 (array!50818 (_ BitVec 32) List!17344) Bool)

(assert (=> b!874841 (= res!594539 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17341))))

(declare-fun b!874842 () Bool)

(declare-fun e!487055 () Bool)

(declare-fun e!487052 () Bool)

(declare-fun mapRes!27626 () Bool)

(assert (=> b!874842 (= e!487055 (and e!487052 mapRes!27626))))

(declare-fun condMapEmpty!27626 () Bool)

(declare-datatypes ((V!28173 0))(
  ( (V!28174 (val!8720 Int)) )
))
(declare-datatypes ((ValueCell!8233 0))(
  ( (ValueCellFull!8233 (v!11149 V!28173)) (EmptyCell!8233) )
))
(declare-datatypes ((array!50820 0))(
  ( (array!50821 (arr!24438 (Array (_ BitVec 32) ValueCell!8233)) (size!24878 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50820)

(declare-fun mapDefault!27626 () ValueCell!8233)

