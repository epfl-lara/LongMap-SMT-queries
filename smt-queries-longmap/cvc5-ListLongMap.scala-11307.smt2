; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131746 () Bool)

(assert start!131746)

(declare-fun b!1542669 () Bool)

(declare-fun e!858324 () Bool)

(declare-fun tp_is_empty!37735 () Bool)

(assert (=> b!1542669 (= e!858324 tp_is_empty!37735)))

(declare-fun mapIsEmpty!58306 () Bool)

(declare-fun mapRes!58306 () Bool)

(assert (=> mapIsEmpty!58306 mapRes!58306))

(declare-fun b!1542670 () Bool)

(declare-fun res!1058608 () Bool)

(declare-fun e!858321 () Bool)

(assert (=> b!1542670 (=> (not res!1058608) (not e!858321))))

(declare-datatypes ((array!102698 0))(
  ( (array!102699 (arr!49551 (Array (_ BitVec 32) (_ BitVec 64))) (size!50101 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102698)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58757 0))(
  ( (V!58758 (val!18945 Int)) )
))
(declare-datatypes ((ValueCell!17957 0))(
  ( (ValueCellFull!17957 (v!21746 V!58757)) (EmptyCell!17957) )
))
(declare-datatypes ((array!102700 0))(
  ( (array!102701 (arr!49552 (Array (_ BitVec 32) ValueCell!17957)) (size!50102 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102700)

(assert (=> b!1542670 (= res!1058608 (and (= (size!50102 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50101 _keys!618) (size!50102 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542671 () Bool)

(declare-fun e!858322 () Bool)

(assert (=> b!1542671 (= e!858322 tp_is_empty!37735)))

(declare-fun res!1058609 () Bool)

(assert (=> start!131746 (=> (not res!1058609) (not e!858321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131746 (= res!1058609 (validMask!0 mask!926))))

(assert (=> start!131746 e!858321))

(assert (=> start!131746 true))

(declare-fun e!858323 () Bool)

(declare-fun array_inv!38557 (array!102700) Bool)

(assert (=> start!131746 (and (array_inv!38557 _values!470) e!858323)))

(declare-fun array_inv!38558 (array!102698) Bool)

(assert (=> start!131746 (array_inv!38558 _keys!618)))

(declare-fun b!1542672 () Bool)

(assert (=> b!1542672 (= e!858321 false)))

(declare-fun lt!665855 () Bool)

(declare-datatypes ((List!35886 0))(
  ( (Nil!35883) (Cons!35882 (h!37327 (_ BitVec 64)) (t!50580 List!35886)) )
))
(declare-fun arrayNoDuplicates!0 (array!102698 (_ BitVec 32) List!35886) Bool)

(assert (=> b!1542672 (= lt!665855 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35883))))

(declare-fun b!1542673 () Bool)

(declare-fun res!1058610 () Bool)

(assert (=> b!1542673 (=> (not res!1058610) (not e!858321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102698 (_ BitVec 32)) Bool)

(assert (=> b!1542673 (= res!1058610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542674 () Bool)

(assert (=> b!1542674 (= e!858323 (and e!858322 mapRes!58306))))

(declare-fun condMapEmpty!58306 () Bool)

(declare-fun mapDefault!58306 () ValueCell!17957)

