; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131738 () Bool)

(assert start!131738)

(declare-fun res!1058573 () Bool)

(declare-fun e!858262 () Bool)

(assert (=> start!131738 (=> (not res!1058573) (not e!858262))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131738 (= res!1058573 (validMask!0 mask!926))))

(assert (=> start!131738 e!858262))

(assert (=> start!131738 true))

(declare-datatypes ((V!58745 0))(
  ( (V!58746 (val!18941 Int)) )
))
(declare-datatypes ((ValueCell!17953 0))(
  ( (ValueCellFull!17953 (v!21742 V!58745)) (EmptyCell!17953) )
))
(declare-datatypes ((array!102684 0))(
  ( (array!102685 (arr!49544 (Array (_ BitVec 32) ValueCell!17953)) (size!50094 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102684)

(declare-fun e!858264 () Bool)

(declare-fun array_inv!38551 (array!102684) Bool)

(assert (=> start!131738 (and (array_inv!38551 _values!470) e!858264)))

(declare-datatypes ((array!102686 0))(
  ( (array!102687 (arr!49545 (Array (_ BitVec 32) (_ BitVec 64))) (size!50095 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102686)

(declare-fun array_inv!38552 (array!102686) Bool)

(assert (=> start!131738 (array_inv!38552 _keys!618)))

(declare-fun b!1542597 () Bool)

(declare-fun e!858260 () Bool)

(declare-fun tp_is_empty!37727 () Bool)

(assert (=> b!1542597 (= e!858260 tp_is_empty!37727)))

(declare-fun b!1542598 () Bool)

(declare-fun res!1058574 () Bool)

(assert (=> b!1542598 (=> (not res!1058574) (not e!858262))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542598 (= res!1058574 (and (= (size!50094 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50095 _keys!618) (size!50094 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542599 () Bool)

(declare-fun res!1058572 () Bool)

(assert (=> b!1542599 (=> (not res!1058572) (not e!858262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102686 (_ BitVec 32)) Bool)

(assert (=> b!1542599 (= res!1058572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542600 () Bool)

(assert (=> b!1542600 (= e!858262 false)))

(declare-fun lt!665843 () Bool)

(declare-datatypes ((List!35884 0))(
  ( (Nil!35881) (Cons!35880 (h!37325 (_ BitVec 64)) (t!50578 List!35884)) )
))
(declare-fun arrayNoDuplicates!0 (array!102686 (_ BitVec 32) List!35884) Bool)

(assert (=> b!1542600 (= lt!665843 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35881))))

(declare-fun b!1542601 () Bool)

(declare-fun mapRes!58294 () Bool)

(assert (=> b!1542601 (= e!858264 (and e!858260 mapRes!58294))))

(declare-fun condMapEmpty!58294 () Bool)

(declare-fun mapDefault!58294 () ValueCell!17953)

