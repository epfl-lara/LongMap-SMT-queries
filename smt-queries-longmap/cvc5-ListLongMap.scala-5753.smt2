; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74346 () Bool)

(assert start!74346)

(declare-fun b_free!15109 () Bool)

(declare-fun b_next!15109 () Bool)

(assert (=> start!74346 (= b_free!15109 (not b_next!15109))))

(declare-fun tp!53001 () Bool)

(declare-fun b_and!24885 () Bool)

(assert (=> start!74346 (= tp!53001 b_and!24885)))

(declare-fun b!874979 () Bool)

(declare-fun e!487121 () Bool)

(declare-fun e!487117 () Bool)

(declare-fun mapRes!27638 () Bool)

(assert (=> b!874979 (= e!487121 (and e!487117 mapRes!27638))))

(declare-fun condMapEmpty!27638 () Bool)

(declare-datatypes ((V!28185 0))(
  ( (V!28186 (val!8724 Int)) )
))
(declare-datatypes ((ValueCell!8237 0))(
  ( (ValueCellFull!8237 (v!11153 V!28185)) (EmptyCell!8237) )
))
(declare-datatypes ((array!50834 0))(
  ( (array!50835 (arr!24445 (Array (_ BitVec 32) ValueCell!8237)) (size!24885 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50834)

(declare-fun mapDefault!27638 () ValueCell!8237)

