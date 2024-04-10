; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131860 () Bool)

(assert start!131860)

(declare-fun b!1543695 () Bool)

(declare-fun res!1059123 () Bool)

(declare-fun e!859179 () Bool)

(assert (=> b!1543695 (=> (not res!1059123) (not e!859179))))

(declare-datatypes ((array!102918 0))(
  ( (array!102919 (arr!49661 (Array (_ BitVec 32) (_ BitVec 64))) (size!50211 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102918)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58909 0))(
  ( (V!58910 (val!19002 Int)) )
))
(declare-datatypes ((ValueCell!18014 0))(
  ( (ValueCellFull!18014 (v!21803 V!58909)) (EmptyCell!18014) )
))
(declare-datatypes ((array!102920 0))(
  ( (array!102921 (arr!49662 (Array (_ BitVec 32) ValueCell!18014)) (size!50212 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102920)

(assert (=> b!1543695 (= res!1059123 (and (= (size!50212 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50211 _keys!618) (size!50212 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543696 () Bool)

(declare-fun e!859177 () Bool)

(declare-fun e!859176 () Bool)

(declare-fun mapRes!58477 () Bool)

(assert (=> b!1543696 (= e!859177 (and e!859176 mapRes!58477))))

(declare-fun condMapEmpty!58477 () Bool)

(declare-fun mapDefault!58477 () ValueCell!18014)

