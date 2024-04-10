; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131720 () Bool)

(assert start!131720)

(declare-fun b!1542435 () Bool)

(declare-fun res!1058493 () Bool)

(declare-fun e!858125 () Bool)

(assert (=> b!1542435 (=> (not res!1058493) (not e!858125))))

(declare-datatypes ((array!102648 0))(
  ( (array!102649 (arr!49526 (Array (_ BitVec 32) (_ BitVec 64))) (size!50076 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102648)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102648 (_ BitVec 32)) Bool)

(assert (=> b!1542435 (= res!1058493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058492 () Bool)

(assert (=> start!131720 (=> (not res!1058492) (not e!858125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131720 (= res!1058492 (validMask!0 mask!926))))

(assert (=> start!131720 e!858125))

(assert (=> start!131720 true))

(declare-datatypes ((V!58721 0))(
  ( (V!58722 (val!18932 Int)) )
))
(declare-datatypes ((ValueCell!17944 0))(
  ( (ValueCellFull!17944 (v!21733 V!58721)) (EmptyCell!17944) )
))
(declare-datatypes ((array!102650 0))(
  ( (array!102651 (arr!49527 (Array (_ BitVec 32) ValueCell!17944)) (size!50077 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102650)

(declare-fun e!858129 () Bool)

(declare-fun array_inv!38535 (array!102650) Bool)

(assert (=> start!131720 (and (array_inv!38535 _values!470) e!858129)))

(declare-fun array_inv!38536 (array!102648) Bool)

(assert (=> start!131720 (array_inv!38536 _keys!618)))

(declare-fun b!1542436 () Bool)

(assert (=> b!1542436 (= e!858125 false)))

(declare-fun lt!665816 () Bool)

(declare-datatypes ((List!35876 0))(
  ( (Nil!35873) (Cons!35872 (h!37317 (_ BitVec 64)) (t!50570 List!35876)) )
))
(declare-fun arrayNoDuplicates!0 (array!102648 (_ BitVec 32) List!35876) Bool)

(assert (=> b!1542436 (= lt!665816 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35873))))

(declare-fun b!1542437 () Bool)

(declare-fun e!858127 () Bool)

(declare-fun tp_is_empty!37709 () Bool)

(assert (=> b!1542437 (= e!858127 tp_is_empty!37709)))

(declare-fun b!1542438 () Bool)

(declare-fun res!1058491 () Bool)

(assert (=> b!1542438 (=> (not res!1058491) (not e!858125))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542438 (= res!1058491 (and (= (size!50077 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50076 _keys!618) (size!50077 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542439 () Bool)

(declare-fun mapRes!58267 () Bool)

(assert (=> b!1542439 (= e!858129 (and e!858127 mapRes!58267))))

(declare-fun condMapEmpty!58267 () Bool)

(declare-fun mapDefault!58267 () ValueCell!17944)

