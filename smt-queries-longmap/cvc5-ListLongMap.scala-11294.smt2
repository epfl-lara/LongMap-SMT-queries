; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131668 () Bool)

(assert start!131668)

(declare-fun b!1541967 () Bool)

(declare-fun e!857738 () Bool)

(assert (=> b!1541967 (= e!857738 false)))

(declare-fun lt!665738 () Bool)

(declare-datatypes ((array!102548 0))(
  ( (array!102549 (arr!49476 (Array (_ BitVec 32) (_ BitVec 64))) (size!50026 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102548)

(declare-datatypes ((List!35857 0))(
  ( (Nil!35854) (Cons!35853 (h!37298 (_ BitVec 64)) (t!50551 List!35857)) )
))
(declare-fun arrayNoDuplicates!0 (array!102548 (_ BitVec 32) List!35857) Bool)

(assert (=> b!1541967 (= lt!665738 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35854))))

(declare-fun mapIsEmpty!58189 () Bool)

(declare-fun mapRes!58189 () Bool)

(assert (=> mapIsEmpty!58189 mapRes!58189))

(declare-fun b!1541968 () Bool)

(declare-fun res!1058258 () Bool)

(assert (=> b!1541968 (=> (not res!1058258) (not e!857738))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58653 0))(
  ( (V!58654 (val!18906 Int)) )
))
(declare-datatypes ((ValueCell!17918 0))(
  ( (ValueCellFull!17918 (v!21707 V!58653)) (EmptyCell!17918) )
))
(declare-datatypes ((array!102550 0))(
  ( (array!102551 (arr!49477 (Array (_ BitVec 32) ValueCell!17918)) (size!50027 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102550)

(assert (=> b!1541968 (= res!1058258 (and (= (size!50027 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50026 _keys!618) (size!50027 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1541969 () Bool)

(declare-fun e!857739 () Bool)

(declare-fun tp_is_empty!37657 () Bool)

(assert (=> b!1541969 (= e!857739 tp_is_empty!37657)))

(declare-fun mapNonEmpty!58189 () Bool)

(declare-fun tp!110716 () Bool)

(declare-fun e!857737 () Bool)

(assert (=> mapNonEmpty!58189 (= mapRes!58189 (and tp!110716 e!857737))))

(declare-fun mapValue!58189 () ValueCell!17918)

(declare-fun mapKey!58189 () (_ BitVec 32))

(declare-fun mapRest!58189 () (Array (_ BitVec 32) ValueCell!17918))

(assert (=> mapNonEmpty!58189 (= (arr!49477 _values!470) (store mapRest!58189 mapKey!58189 mapValue!58189))))

(declare-fun b!1541970 () Bool)

(declare-fun res!1058259 () Bool)

(assert (=> b!1541970 (=> (not res!1058259) (not e!857738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102548 (_ BitVec 32)) Bool)

(assert (=> b!1541970 (= res!1058259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1541971 () Bool)

(declare-fun e!857735 () Bool)

(assert (=> b!1541971 (= e!857735 (and e!857739 mapRes!58189))))

(declare-fun condMapEmpty!58189 () Bool)

(declare-fun mapDefault!58189 () ValueCell!17918)

