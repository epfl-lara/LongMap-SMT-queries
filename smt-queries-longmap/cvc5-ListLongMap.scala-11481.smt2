; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133684 () Bool)

(assert start!133684)

(declare-fun b!1563012 () Bool)

(declare-fun e!871092 () Bool)

(assert (=> b!1563012 (= e!871092 false)))

(declare-fun lt!671820 () Bool)

(declare-datatypes ((array!104236 0))(
  ( (array!104237 (arr!50310 (Array (_ BitVec 32) (_ BitVec 64))) (size!50860 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104236)

(declare-datatypes ((List!36505 0))(
  ( (Nil!36502) (Cons!36501 (h!37947 (_ BitVec 64)) (t!51352 List!36505)) )
))
(declare-fun arrayNoDuplicates!0 (array!104236 (_ BitVec 32) List!36505) Bool)

(assert (=> b!1563012 (= lt!671820 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36502))))

(declare-fun res!1068558 () Bool)

(assert (=> start!133684 (=> (not res!1068558) (not e!871092))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133684 (= res!1068558 (validMask!0 mask!947))))

(assert (=> start!133684 e!871092))

(assert (=> start!133684 true))

(declare-datatypes ((V!59897 0))(
  ( (V!59898 (val!19467 Int)) )
))
(declare-datatypes ((ValueCell!18353 0))(
  ( (ValueCellFull!18353 (v!22219 V!59897)) (EmptyCell!18353) )
))
(declare-datatypes ((array!104238 0))(
  ( (array!104239 (arr!50311 (Array (_ BitVec 32) ValueCell!18353)) (size!50861 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104238)

(declare-fun e!871093 () Bool)

(declare-fun array_inv!39103 (array!104238) Bool)

(assert (=> start!133684 (and (array_inv!39103 _values!487) e!871093)))

(declare-fun array_inv!39104 (array!104236) Bool)

(assert (=> start!133684 (array_inv!39104 _keys!637)))

(declare-fun b!1563013 () Bool)

(declare-fun e!871090 () Bool)

(declare-fun mapRes!59526 () Bool)

(assert (=> b!1563013 (= e!871093 (and e!871090 mapRes!59526))))

(declare-fun condMapEmpty!59526 () Bool)

(declare-fun mapDefault!59526 () ValueCell!18353)

