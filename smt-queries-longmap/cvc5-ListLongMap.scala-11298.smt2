; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131692 () Bool)

(assert start!131692)

(declare-fun mapNonEmpty!58225 () Bool)

(declare-fun mapRes!58225 () Bool)

(declare-fun tp!110752 () Bool)

(declare-fun e!857915 () Bool)

(assert (=> mapNonEmpty!58225 (= mapRes!58225 (and tp!110752 e!857915))))

(declare-datatypes ((V!58685 0))(
  ( (V!58686 (val!18918 Int)) )
))
(declare-datatypes ((ValueCell!17930 0))(
  ( (ValueCellFull!17930 (v!21719 V!58685)) (EmptyCell!17930) )
))
(declare-fun mapValue!58225 () ValueCell!17930)

(declare-fun mapRest!58225 () (Array (_ BitVec 32) ValueCell!17930))

(declare-datatypes ((array!102594 0))(
  ( (array!102595 (arr!49499 (Array (_ BitVec 32) ValueCell!17930)) (size!50049 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102594)

(declare-fun mapKey!58225 () (_ BitVec 32))

(assert (=> mapNonEmpty!58225 (= (arr!49499 _values!470) (store mapRest!58225 mapKey!58225 mapValue!58225))))

(declare-fun b!1542183 () Bool)

(declare-fun e!857919 () Bool)

(assert (=> b!1542183 (= e!857919 false)))

(declare-fun lt!665774 () Bool)

(declare-datatypes ((array!102596 0))(
  ( (array!102597 (arr!49500 (Array (_ BitVec 32) (_ BitVec 64))) (size!50050 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102596)

(declare-datatypes ((List!35865 0))(
  ( (Nil!35862) (Cons!35861 (h!37306 (_ BitVec 64)) (t!50559 List!35865)) )
))
(declare-fun arrayNoDuplicates!0 (array!102596 (_ BitVec 32) List!35865) Bool)

(assert (=> b!1542183 (= lt!665774 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35862))))

(declare-fun mapIsEmpty!58225 () Bool)

(assert (=> mapIsEmpty!58225 mapRes!58225))

(declare-fun b!1542184 () Bool)

(declare-fun e!857917 () Bool)

(declare-fun tp_is_empty!37681 () Bool)

(assert (=> b!1542184 (= e!857917 tp_is_empty!37681)))

(declare-fun res!1058366 () Bool)

(assert (=> start!131692 (=> (not res!1058366) (not e!857919))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131692 (= res!1058366 (validMask!0 mask!926))))

(assert (=> start!131692 e!857919))

(assert (=> start!131692 true))

(declare-fun e!857918 () Bool)

(declare-fun array_inv!38513 (array!102594) Bool)

(assert (=> start!131692 (and (array_inv!38513 _values!470) e!857918)))

(declare-fun array_inv!38514 (array!102596) Bool)

(assert (=> start!131692 (array_inv!38514 _keys!618)))

(declare-fun b!1542185 () Bool)

(declare-fun res!1058365 () Bool)

(assert (=> b!1542185 (=> (not res!1058365) (not e!857919))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542185 (= res!1058365 (and (= (size!50049 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50050 _keys!618) (size!50049 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542186 () Bool)

(assert (=> b!1542186 (= e!857918 (and e!857917 mapRes!58225))))

(declare-fun condMapEmpty!58225 () Bool)

(declare-fun mapDefault!58225 () ValueCell!17930)

