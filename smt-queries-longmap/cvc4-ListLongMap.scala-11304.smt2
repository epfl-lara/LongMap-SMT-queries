; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131732 () Bool)

(assert start!131732)

(declare-fun b!1542543 () Bool)

(declare-fun e!858216 () Bool)

(declare-fun tp_is_empty!37721 () Bool)

(assert (=> b!1542543 (= e!858216 tp_is_empty!37721)))

(declare-fun b!1542544 () Bool)

(declare-fun res!1058547 () Bool)

(declare-fun e!858219 () Bool)

(assert (=> b!1542544 (=> (not res!1058547) (not e!858219))))

(declare-datatypes ((array!102672 0))(
  ( (array!102673 (arr!49538 (Array (_ BitVec 32) (_ BitVec 64))) (size!50088 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102672)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58737 0))(
  ( (V!58738 (val!18938 Int)) )
))
(declare-datatypes ((ValueCell!17950 0))(
  ( (ValueCellFull!17950 (v!21739 V!58737)) (EmptyCell!17950) )
))
(declare-datatypes ((array!102674 0))(
  ( (array!102675 (arr!49539 (Array (_ BitVec 32) ValueCell!17950)) (size!50089 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102674)

(assert (=> b!1542544 (= res!1058547 (and (= (size!50089 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50088 _keys!618) (size!50089 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542545 () Bool)

(declare-fun e!858218 () Bool)

(assert (=> b!1542545 (= e!858218 tp_is_empty!37721)))

(declare-fun res!1058545 () Bool)

(assert (=> start!131732 (=> (not res!1058545) (not e!858219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131732 (= res!1058545 (validMask!0 mask!926))))

(assert (=> start!131732 e!858219))

(assert (=> start!131732 true))

(declare-fun e!858215 () Bool)

(declare-fun array_inv!38545 (array!102674) Bool)

(assert (=> start!131732 (and (array_inv!38545 _values!470) e!858215)))

(declare-fun array_inv!38546 (array!102672) Bool)

(assert (=> start!131732 (array_inv!38546 _keys!618)))

(declare-fun mapNonEmpty!58285 () Bool)

(declare-fun mapRes!58285 () Bool)

(declare-fun tp!110812 () Bool)

(assert (=> mapNonEmpty!58285 (= mapRes!58285 (and tp!110812 e!858218))))

(declare-fun mapRest!58285 () (Array (_ BitVec 32) ValueCell!17950))

(declare-fun mapValue!58285 () ValueCell!17950)

(declare-fun mapKey!58285 () (_ BitVec 32))

(assert (=> mapNonEmpty!58285 (= (arr!49539 _values!470) (store mapRest!58285 mapKey!58285 mapValue!58285))))

(declare-fun b!1542546 () Bool)

(assert (=> b!1542546 (= e!858219 false)))

(declare-fun lt!665834 () Bool)

(declare-datatypes ((List!35881 0))(
  ( (Nil!35878) (Cons!35877 (h!37322 (_ BitVec 64)) (t!50575 List!35881)) )
))
(declare-fun arrayNoDuplicates!0 (array!102672 (_ BitVec 32) List!35881) Bool)

(assert (=> b!1542546 (= lt!665834 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35878))))

(declare-fun b!1542547 () Bool)

(declare-fun res!1058546 () Bool)

(assert (=> b!1542547 (=> (not res!1058546) (not e!858219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102672 (_ BitVec 32)) Bool)

(assert (=> b!1542547 (= res!1058546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58285 () Bool)

(assert (=> mapIsEmpty!58285 mapRes!58285))

(declare-fun b!1542548 () Bool)

(assert (=> b!1542548 (= e!858215 (and e!858216 mapRes!58285))))

(declare-fun condMapEmpty!58285 () Bool)

(declare-fun mapDefault!58285 () ValueCell!17950)

