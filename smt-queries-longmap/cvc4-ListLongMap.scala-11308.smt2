; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131756 () Bool)

(assert start!131756)

(declare-fun res!1058654 () Bool)

(declare-fun e!858395 () Bool)

(assert (=> start!131756 (=> (not res!1058654) (not e!858395))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131756 (= res!1058654 (validMask!0 mask!926))))

(assert (=> start!131756 e!858395))

(assert (=> start!131756 true))

(declare-datatypes ((V!58769 0))(
  ( (V!58770 (val!18950 Int)) )
))
(declare-datatypes ((ValueCell!17962 0))(
  ( (ValueCellFull!17962 (v!21751 V!58769)) (EmptyCell!17962) )
))
(declare-datatypes ((array!102718 0))(
  ( (array!102719 (arr!49561 (Array (_ BitVec 32) ValueCell!17962)) (size!50111 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102718)

(declare-fun e!858398 () Bool)

(declare-fun array_inv!38563 (array!102718) Bool)

(assert (=> start!131756 (and (array_inv!38563 _values!470) e!858398)))

(declare-datatypes ((array!102720 0))(
  ( (array!102721 (arr!49562 (Array (_ BitVec 32) (_ BitVec 64))) (size!50112 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102720)

(declare-fun array_inv!38564 (array!102720) Bool)

(assert (=> start!131756 (array_inv!38564 _keys!618)))

(declare-fun b!1542759 () Bool)

(declare-fun e!858397 () Bool)

(declare-fun tp_is_empty!37745 () Bool)

(assert (=> b!1542759 (= e!858397 tp_is_empty!37745)))

(declare-fun b!1542760 () Bool)

(declare-fun e!858396 () Bool)

(assert (=> b!1542760 (= e!858396 tp_is_empty!37745)))

(declare-fun b!1542761 () Bool)

(declare-fun res!1058653 () Bool)

(assert (=> b!1542761 (=> (not res!1058653) (not e!858395))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542761 (= res!1058653 (and (= (size!50111 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50112 _keys!618) (size!50111 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542762 () Bool)

(assert (=> b!1542762 (= e!858395 false)))

(declare-fun lt!665870 () Bool)

(declare-datatypes ((List!35891 0))(
  ( (Nil!35888) (Cons!35887 (h!37332 (_ BitVec 64)) (t!50585 List!35891)) )
))
(declare-fun arrayNoDuplicates!0 (array!102720 (_ BitVec 32) List!35891) Bool)

(assert (=> b!1542762 (= lt!665870 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35888))))

(declare-fun b!1542763 () Bool)

(declare-fun res!1058655 () Bool)

(assert (=> b!1542763 (=> (not res!1058655) (not e!858395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102720 (_ BitVec 32)) Bool)

(assert (=> b!1542763 (= res!1058655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542764 () Bool)

(declare-fun mapRes!58321 () Bool)

(assert (=> b!1542764 (= e!858398 (and e!858397 mapRes!58321))))

(declare-fun condMapEmpty!58321 () Bool)

(declare-fun mapDefault!58321 () ValueCell!17962)

