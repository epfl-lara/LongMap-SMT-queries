; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131816 () Bool)

(assert start!131816)

(declare-fun b!1543436 () Bool)

(declare-fun e!859023 () Bool)

(assert (=> b!1543436 (= e!859023 false)))

(declare-fun lt!665749 () Bool)

(declare-datatypes ((array!102858 0))(
  ( (array!102859 (arr!49632 (Array (_ BitVec 32) (_ BitVec 64))) (size!50184 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102858)

(declare-datatypes ((List!35978 0))(
  ( (Nil!35975) (Cons!35974 (h!37420 (_ BitVec 64)) (t!50664 List!35978)) )
))
(declare-fun arrayNoDuplicates!0 (array!102858 (_ BitVec 32) List!35978) Bool)

(assert (=> b!1543436 (= lt!665749 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35975))))

(declare-fun mapIsEmpty!58486 () Bool)

(declare-fun mapRes!58486 () Bool)

(assert (=> mapIsEmpty!58486 mapRes!58486))

(declare-fun res!1059019 () Bool)

(assert (=> start!131816 (=> (not res!1059019) (not e!859023))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131816 (= res!1059019 (validMask!0 mask!926))))

(assert (=> start!131816 e!859023))

(assert (=> start!131816 true))

(declare-datatypes ((V!58917 0))(
  ( (V!58918 (val!19005 Int)) )
))
(declare-datatypes ((ValueCell!18017 0))(
  ( (ValueCellFull!18017 (v!21802 V!58917)) (EmptyCell!18017) )
))
(declare-datatypes ((array!102860 0))(
  ( (array!102861 (arr!49633 (Array (_ BitVec 32) ValueCell!18017)) (size!50185 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102860)

(declare-fun e!859024 () Bool)

(declare-fun array_inv!38805 (array!102860) Bool)

(assert (=> start!131816 (and (array_inv!38805 _values!470) e!859024)))

(declare-fun array_inv!38806 (array!102858) Bool)

(assert (=> start!131816 (array_inv!38806 _keys!618)))

(declare-fun b!1543437 () Bool)

(declare-fun e!859025 () Bool)

(declare-fun tp_is_empty!37855 () Bool)

(assert (=> b!1543437 (= e!859025 tp_is_empty!37855)))

(declare-fun b!1543438 () Bool)

(assert (=> b!1543438 (= e!859024 (and e!859025 mapRes!58486))))

(declare-fun condMapEmpty!58486 () Bool)

(declare-fun mapDefault!58486 () ValueCell!18017)

(assert (=> b!1543438 (= condMapEmpty!58486 (= (arr!49633 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18017)) mapDefault!58486)))))

(declare-fun mapNonEmpty!58486 () Bool)

(declare-fun tp!111014 () Bool)

(declare-fun e!859022 () Bool)

(assert (=> mapNonEmpty!58486 (= mapRes!58486 (and tp!111014 e!859022))))

(declare-fun mapKey!58486 () (_ BitVec 32))

(declare-fun mapRest!58486 () (Array (_ BitVec 32) ValueCell!18017))

(declare-fun mapValue!58486 () ValueCell!18017)

(assert (=> mapNonEmpty!58486 (= (arr!49633 _values!470) (store mapRest!58486 mapKey!58486 mapValue!58486))))

(declare-fun b!1543439 () Bool)

(assert (=> b!1543439 (= e!859022 tp_is_empty!37855)))

(declare-fun b!1543440 () Bool)

(declare-fun res!1059021 () Bool)

(assert (=> b!1543440 (=> (not res!1059021) (not e!859023))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543440 (= res!1059021 (and (= (size!50185 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50184 _keys!618) (size!50185 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543441 () Bool)

(declare-fun res!1059020 () Bool)

(assert (=> b!1543441 (=> (not res!1059020) (not e!859023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102858 (_ BitVec 32)) Bool)

(assert (=> b!1543441 (= res!1059020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!131816 res!1059019) b!1543440))

(assert (= (and b!1543440 res!1059021) b!1543441))

(assert (= (and b!1543441 res!1059020) b!1543436))

(assert (= (and b!1543438 condMapEmpty!58486) mapIsEmpty!58486))

(assert (= (and b!1543438 (not condMapEmpty!58486)) mapNonEmpty!58486))

(get-info :version)

(assert (= (and mapNonEmpty!58486 ((_ is ValueCellFull!18017) mapValue!58486)) b!1543439))

(assert (= (and b!1543438 ((_ is ValueCellFull!18017) mapDefault!58486)) b!1543437))

(assert (= start!131816 b!1543438))

(declare-fun m!1424061 () Bool)

(assert (=> b!1543436 m!1424061))

(declare-fun m!1424063 () Bool)

(assert (=> start!131816 m!1424063))

(declare-fun m!1424065 () Bool)

(assert (=> start!131816 m!1424065))

(declare-fun m!1424067 () Bool)

(assert (=> start!131816 m!1424067))

(declare-fun m!1424069 () Bool)

(assert (=> mapNonEmpty!58486 m!1424069))

(declare-fun m!1424071 () Bool)

(assert (=> b!1543441 m!1424071))

(check-sat (not mapNonEmpty!58486) (not b!1543441) tp_is_empty!37855 (not start!131816) (not b!1543436))
(check-sat)
