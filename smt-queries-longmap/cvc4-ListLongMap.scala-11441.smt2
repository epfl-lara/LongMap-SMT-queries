; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133448 () Bool)

(assert start!133448)

(declare-fun b!1560114 () Bool)

(declare-fun e!869313 () Bool)

(declare-fun tp_is_empty!38531 () Bool)

(assert (=> b!1560114 (= e!869313 tp_is_empty!38531)))

(declare-fun res!1066834 () Bool)

(declare-fun e!869312 () Bool)

(assert (=> start!133448 (=> (not res!1066834) (not e!869312))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133448 (= res!1066834 (validMask!0 mask!947))))

(assert (=> start!133448 e!869312))

(assert (=> start!133448 true))

(declare-datatypes ((array!103786 0))(
  ( (array!103787 (arr!50085 (Array (_ BitVec 32) (_ BitVec 64))) (size!50635 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103786)

(declare-fun array_inv!38931 (array!103786) Bool)

(assert (=> start!133448 (array_inv!38931 _keys!637)))

(declare-datatypes ((V!59581 0))(
  ( (V!59582 (val!19349 Int)) )
))
(declare-datatypes ((ValueCell!18235 0))(
  ( (ValueCellFull!18235 (v!22101 V!59581)) (EmptyCell!18235) )
))
(declare-datatypes ((array!103788 0))(
  ( (array!103789 (arr!50086 (Array (_ BitVec 32) ValueCell!18235)) (size!50636 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103788)

(declare-fun e!869310 () Bool)

(declare-fun array_inv!38932 (array!103788) Bool)

(assert (=> start!133448 (and (array_inv!38932 _values!487) e!869310)))

(declare-fun mapIsEmpty!59172 () Bool)

(declare-fun mapRes!59172 () Bool)

(assert (=> mapIsEmpty!59172 mapRes!59172))

(declare-fun b!1560115 () Bool)

(declare-fun e!869314 () Bool)

(assert (=> b!1560115 (= e!869314 tp_is_empty!38531)))

(declare-fun b!1560116 () Bool)

(assert (=> b!1560116 (= e!869310 (and e!869313 mapRes!59172))))

(declare-fun condMapEmpty!59172 () Bool)

(declare-fun mapDefault!59172 () ValueCell!18235)

