; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131650 () Bool)

(assert start!131650)

(declare-fun b!1541858 () Bool)

(declare-fun e!857654 () Bool)

(declare-fun tp_is_empty!37651 () Bool)

(assert (=> b!1541858 (= e!857654 tp_is_empty!37651)))

(declare-fun b!1541859 () Bool)

(declare-fun e!857657 () Bool)

(declare-fun e!857655 () Bool)

(assert (=> b!1541859 (= e!857657 e!857655)))

(declare-fun res!1058192 () Bool)

(assert (=> b!1541859 (=> res!1058192 e!857655)))

(declare-datatypes ((List!35854 0))(
  ( (Nil!35851) (Cons!35850 (h!37295 (_ BitVec 64)) (t!50548 List!35854)) )
))
(declare-fun contains!10023 (List!35854 (_ BitVec 64)) Bool)

(assert (=> b!1541859 (= res!1058192 (contains!10023 Nil!35851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1541860 () Bool)

(declare-fun res!1058189 () Bool)

(assert (=> b!1541860 (=> (not res!1058189) (not e!857657))))

(declare-datatypes ((array!102534 0))(
  ( (array!102535 (arr!49470 (Array (_ BitVec 32) (_ BitVec 64))) (size!50020 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102534)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58645 0))(
  ( (V!58646 (val!18903 Int)) )
))
(declare-datatypes ((ValueCell!17915 0))(
  ( (ValueCellFull!17915 (v!21703 V!58645)) (EmptyCell!17915) )
))
(declare-datatypes ((array!102536 0))(
  ( (array!102537 (arr!49471 (Array (_ BitVec 32) ValueCell!17915)) (size!50021 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102536)

(assert (=> b!1541860 (= res!1058189 (and (= (size!50021 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50020 _keys!618) (size!50021 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1541862 () Bool)

(declare-fun res!1058190 () Bool)

(assert (=> b!1541862 (=> (not res!1058190) (not e!857657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102534 (_ BitVec 32)) Bool)

(assert (=> b!1541862 (= res!1058190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58177 () Bool)

(declare-fun mapRes!58177 () Bool)

(declare-fun tp!110704 () Bool)

(assert (=> mapNonEmpty!58177 (= mapRes!58177 (and tp!110704 e!857654))))

(declare-fun mapRest!58177 () (Array (_ BitVec 32) ValueCell!17915))

(declare-fun mapKey!58177 () (_ BitVec 32))

(declare-fun mapValue!58177 () ValueCell!17915)

(assert (=> mapNonEmpty!58177 (= (arr!49471 _values!470) (store mapRest!58177 mapKey!58177 mapValue!58177))))

(declare-fun b!1541863 () Bool)

(assert (=> b!1541863 (= e!857655 (contains!10023 Nil!35851 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1541864 () Bool)

(declare-fun res!1058193 () Bool)

(assert (=> b!1541864 (=> (not res!1058193) (not e!857657))))

(assert (=> b!1541864 (= res!1058193 (and (bvsle #b00000000000000000000000000000000 (size!50020 _keys!618)) (bvslt (size!50020 _keys!618) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!58177 () Bool)

(assert (=> mapIsEmpty!58177 mapRes!58177))

(declare-fun res!1058191 () Bool)

(assert (=> start!131650 (=> (not res!1058191) (not e!857657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131650 (= res!1058191 (validMask!0 mask!926))))

(assert (=> start!131650 e!857657))

(assert (=> start!131650 true))

(declare-fun e!857656 () Bool)

(declare-fun array_inv!38491 (array!102536) Bool)

(assert (=> start!131650 (and (array_inv!38491 _values!470) e!857656)))

(declare-fun array_inv!38492 (array!102534) Bool)

(assert (=> start!131650 (array_inv!38492 _keys!618)))

(declare-fun b!1541861 () Bool)

(declare-fun res!1058194 () Bool)

(assert (=> b!1541861 (=> (not res!1058194) (not e!857657))))

(declare-fun noDuplicate!2637 (List!35854) Bool)

(assert (=> b!1541861 (= res!1058194 (noDuplicate!2637 Nil!35851))))

(declare-fun b!1541865 () Bool)

(declare-fun e!857659 () Bool)

(assert (=> b!1541865 (= e!857659 tp_is_empty!37651)))

(declare-fun b!1541866 () Bool)

(assert (=> b!1541866 (= e!857656 (and e!857659 mapRes!58177))))

(declare-fun condMapEmpty!58177 () Bool)

(declare-fun mapDefault!58177 () ValueCell!17915)

