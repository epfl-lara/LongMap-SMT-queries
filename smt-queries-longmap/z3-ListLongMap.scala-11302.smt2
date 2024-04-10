; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131718 () Bool)

(assert start!131718)

(declare-fun b!1542417 () Bool)

(declare-fun res!1058484 () Bool)

(declare-fun e!858114 () Bool)

(assert (=> b!1542417 (=> (not res!1058484) (not e!858114))))

(declare-datatypes ((array!102644 0))(
  ( (array!102645 (arr!49524 (Array (_ BitVec 32) (_ BitVec 64))) (size!50074 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102644)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102644 (_ BitVec 32)) Bool)

(assert (=> b!1542417 (= res!1058484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542418 () Bool)

(declare-fun res!1058483 () Bool)

(assert (=> b!1542418 (=> (not res!1058483) (not e!858114))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((V!58719 0))(
  ( (V!58720 (val!18931 Int)) )
))
(declare-datatypes ((ValueCell!17943 0))(
  ( (ValueCellFull!17943 (v!21732 V!58719)) (EmptyCell!17943) )
))
(declare-datatypes ((array!102646 0))(
  ( (array!102647 (arr!49525 (Array (_ BitVec 32) ValueCell!17943)) (size!50075 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102646)

(assert (=> b!1542418 (= res!1058483 (and (= (size!50075 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50074 _keys!618) (size!50075 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542419 () Bool)

(declare-fun e!858112 () Bool)

(declare-fun tp_is_empty!37707 () Bool)

(assert (=> b!1542419 (= e!858112 tp_is_empty!37707)))

(declare-fun mapNonEmpty!58264 () Bool)

(declare-fun mapRes!58264 () Bool)

(declare-fun tp!110791 () Bool)

(declare-fun e!858110 () Bool)

(assert (=> mapNonEmpty!58264 (= mapRes!58264 (and tp!110791 e!858110))))

(declare-fun mapValue!58264 () ValueCell!17943)

(declare-fun mapRest!58264 () (Array (_ BitVec 32) ValueCell!17943))

(declare-fun mapKey!58264 () (_ BitVec 32))

(assert (=> mapNonEmpty!58264 (= (arr!49525 _values!470) (store mapRest!58264 mapKey!58264 mapValue!58264))))

(declare-fun b!1542420 () Bool)

(assert (=> b!1542420 (= e!858110 tp_is_empty!37707)))

(declare-fun b!1542421 () Bool)

(declare-fun e!858113 () Bool)

(assert (=> b!1542421 (= e!858113 (and e!858112 mapRes!58264))))

(declare-fun condMapEmpty!58264 () Bool)

(declare-fun mapDefault!58264 () ValueCell!17943)

(assert (=> b!1542421 (= condMapEmpty!58264 (= (arr!49525 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17943)) mapDefault!58264)))))

(declare-fun res!1058482 () Bool)

(assert (=> start!131718 (=> (not res!1058482) (not e!858114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131718 (= res!1058482 (validMask!0 mask!926))))

(assert (=> start!131718 e!858114))

(assert (=> start!131718 true))

(declare-fun array_inv!38533 (array!102646) Bool)

(assert (=> start!131718 (and (array_inv!38533 _values!470) e!858113)))

(declare-fun array_inv!38534 (array!102644) Bool)

(assert (=> start!131718 (array_inv!38534 _keys!618)))

(declare-fun b!1542422 () Bool)

(assert (=> b!1542422 (= e!858114 false)))

(declare-fun lt!665813 () Bool)

(declare-datatypes ((List!35875 0))(
  ( (Nil!35872) (Cons!35871 (h!37316 (_ BitVec 64)) (t!50569 List!35875)) )
))
(declare-fun arrayNoDuplicates!0 (array!102644 (_ BitVec 32) List!35875) Bool)

(assert (=> b!1542422 (= lt!665813 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35872))))

(declare-fun mapIsEmpty!58264 () Bool)

(assert (=> mapIsEmpty!58264 mapRes!58264))

(assert (= (and start!131718 res!1058482) b!1542418))

(assert (= (and b!1542418 res!1058483) b!1542417))

(assert (= (and b!1542417 res!1058484) b!1542422))

(assert (= (and b!1542421 condMapEmpty!58264) mapIsEmpty!58264))

(assert (= (and b!1542421 (not condMapEmpty!58264)) mapNonEmpty!58264))

(get-info :version)

(assert (= (and mapNonEmpty!58264 ((_ is ValueCellFull!17943) mapValue!58264)) b!1542420))

(assert (= (and b!1542421 ((_ is ValueCellFull!17943) mapDefault!58264)) b!1542419))

(assert (= start!131718 b!1542421))

(declare-fun m!1424065 () Bool)

(assert (=> b!1542417 m!1424065))

(declare-fun m!1424067 () Bool)

(assert (=> mapNonEmpty!58264 m!1424067))

(declare-fun m!1424069 () Bool)

(assert (=> start!131718 m!1424069))

(declare-fun m!1424071 () Bool)

(assert (=> start!131718 m!1424071))

(declare-fun m!1424073 () Bool)

(assert (=> start!131718 m!1424073))

(declare-fun m!1424075 () Bool)

(assert (=> b!1542422 m!1424075))

(check-sat (not mapNonEmpty!58264) tp_is_empty!37707 (not start!131718) (not b!1542422) (not b!1542417))
(check-sat)
