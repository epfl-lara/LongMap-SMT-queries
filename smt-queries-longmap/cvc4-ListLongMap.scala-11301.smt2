; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131714 () Bool)

(assert start!131714)

(declare-fun mapNonEmpty!58258 () Bool)

(declare-fun mapRes!58258 () Bool)

(declare-fun tp!110785 () Bool)

(declare-fun e!858083 () Bool)

(assert (=> mapNonEmpty!58258 (= mapRes!58258 (and tp!110785 e!858083))))

(declare-datatypes ((V!58713 0))(
  ( (V!58714 (val!18929 Int)) )
))
(declare-datatypes ((ValueCell!17941 0))(
  ( (ValueCellFull!17941 (v!21730 V!58713)) (EmptyCell!17941) )
))
(declare-fun mapValue!58258 () ValueCell!17941)

(declare-datatypes ((array!102636 0))(
  ( (array!102637 (arr!49520 (Array (_ BitVec 32) ValueCell!17941)) (size!50070 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102636)

(declare-fun mapRest!58258 () (Array (_ BitVec 32) ValueCell!17941))

(declare-fun mapKey!58258 () (_ BitVec 32))

(assert (=> mapNonEmpty!58258 (= (arr!49520 _values!470) (store mapRest!58258 mapKey!58258 mapValue!58258))))

(declare-fun b!1542381 () Bool)

(declare-fun res!1058466 () Bool)

(declare-fun e!858080 () Bool)

(assert (=> b!1542381 (=> (not res!1058466) (not e!858080))))

(declare-datatypes ((array!102638 0))(
  ( (array!102639 (arr!49521 (Array (_ BitVec 32) (_ BitVec 64))) (size!50071 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102638)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102638 (_ BitVec 32)) Bool)

(assert (=> b!1542381 (= res!1058466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058464 () Bool)

(assert (=> start!131714 (=> (not res!1058464) (not e!858080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131714 (= res!1058464 (validMask!0 mask!926))))

(assert (=> start!131714 e!858080))

(assert (=> start!131714 true))

(declare-fun e!858082 () Bool)

(declare-fun array_inv!38529 (array!102636) Bool)

(assert (=> start!131714 (and (array_inv!38529 _values!470) e!858082)))

(declare-fun array_inv!38530 (array!102638) Bool)

(assert (=> start!131714 (array_inv!38530 _keys!618)))

(declare-fun b!1542382 () Bool)

(declare-fun e!858081 () Bool)

(declare-fun tp_is_empty!37703 () Bool)

(assert (=> b!1542382 (= e!858081 tp_is_empty!37703)))

(declare-fun b!1542383 () Bool)

(assert (=> b!1542383 (= e!858083 tp_is_empty!37703)))

(declare-fun b!1542384 () Bool)

(assert (=> b!1542384 (= e!858080 false)))

(declare-fun lt!665807 () Bool)

(declare-datatypes ((List!35873 0))(
  ( (Nil!35870) (Cons!35869 (h!37314 (_ BitVec 64)) (t!50567 List!35873)) )
))
(declare-fun arrayNoDuplicates!0 (array!102638 (_ BitVec 32) List!35873) Bool)

(assert (=> b!1542384 (= lt!665807 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35870))))

(declare-fun mapIsEmpty!58258 () Bool)

(assert (=> mapIsEmpty!58258 mapRes!58258))

(declare-fun b!1542385 () Bool)

(declare-fun res!1058465 () Bool)

(assert (=> b!1542385 (=> (not res!1058465) (not e!858080))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542385 (= res!1058465 (and (= (size!50070 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50071 _keys!618) (size!50070 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542386 () Bool)

(assert (=> b!1542386 (= e!858082 (and e!858081 mapRes!58258))))

(declare-fun condMapEmpty!58258 () Bool)

(declare-fun mapDefault!58258 () ValueCell!17941)

