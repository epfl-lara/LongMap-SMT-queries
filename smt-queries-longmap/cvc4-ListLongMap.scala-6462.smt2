; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82616 () Bool)

(assert start!82616)

(declare-fun b_free!18749 () Bool)

(declare-fun b_next!18749 () Bool)

(assert (=> start!82616 (= b_free!18749 (not b_next!18749))))

(declare-fun tp!65366 () Bool)

(declare-fun b_and!30237 () Bool)

(assert (=> start!82616 (= tp!65366 b_and!30237)))

(declare-fun res!644431 () Bool)

(declare-fun e!543002 () Bool)

(assert (=> start!82616 (=> (not res!644431) (not e!543002))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82616 (= res!644431 (validMask!0 mask!2110))))

(assert (=> start!82616 e!543002))

(assert (=> start!82616 true))

(declare-datatypes ((V!33717 0))(
  ( (V!33718 (val!10826 Int)) )
))
(declare-datatypes ((ValueCell!10294 0))(
  ( (ValueCellFull!10294 (v!13384 V!33717)) (EmptyCell!10294) )
))
(declare-datatypes ((array!59197 0))(
  ( (array!59198 (arr!28467 (Array (_ BitVec 32) ValueCell!10294)) (size!28946 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59197)

(declare-fun e!543003 () Bool)

(declare-fun array_inv!22059 (array!59197) Bool)

(assert (=> start!82616 (and (array_inv!22059 _values!1400) e!543003)))

(declare-datatypes ((array!59199 0))(
  ( (array!59200 (arr!28468 (Array (_ BitVec 32) (_ BitVec 64))) (size!28947 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59199)

(declare-fun array_inv!22060 (array!59199) Bool)

(assert (=> start!82616 (array_inv!22060 _keys!1686)))

(assert (=> start!82616 tp!65366))

(declare-fun tp_is_empty!21551 () Bool)

(assert (=> start!82616 tp_is_empty!21551))

(declare-fun b!962931 () Bool)

(declare-fun e!543005 () Bool)

(declare-fun mapRes!34321 () Bool)

(assert (=> b!962931 (= e!543003 (and e!543005 mapRes!34321))))

(declare-fun condMapEmpty!34321 () Bool)

(declare-fun mapDefault!34321 () ValueCell!10294)

