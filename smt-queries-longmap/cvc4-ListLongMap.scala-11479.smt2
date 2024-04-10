; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133676 () Bool)

(assert start!133676)

(declare-fun res!1068520 () Bool)

(declare-fun e!871032 () Bool)

(assert (=> start!133676 (=> (not res!1068520) (not e!871032))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133676 (= res!1068520 (validMask!0 mask!947))))

(assert (=> start!133676 e!871032))

(assert (=> start!133676 true))

(declare-datatypes ((V!59885 0))(
  ( (V!59886 (val!19463 Int)) )
))
(declare-datatypes ((ValueCell!18349 0))(
  ( (ValueCellFull!18349 (v!22215 V!59885)) (EmptyCell!18349) )
))
(declare-datatypes ((array!104222 0))(
  ( (array!104223 (arr!50303 (Array (_ BitVec 32) ValueCell!18349)) (size!50853 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104222)

(declare-fun e!871030 () Bool)

(declare-fun array_inv!39099 (array!104222) Bool)

(assert (=> start!133676 (and (array_inv!39099 _values!487) e!871030)))

(declare-datatypes ((array!104224 0))(
  ( (array!104225 (arr!50304 (Array (_ BitVec 32) (_ BitVec 64))) (size!50854 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104224)

(declare-fun array_inv!39100 (array!104224) Bool)

(assert (=> start!133676 (array_inv!39100 _keys!637)))

(declare-fun b!1562940 () Bool)

(declare-fun e!871029 () Bool)

(declare-fun mapRes!59514 () Bool)

(assert (=> b!1562940 (= e!871030 (and e!871029 mapRes!59514))))

(declare-fun condMapEmpty!59514 () Bool)

(declare-fun mapDefault!59514 () ValueCell!18349)

