; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131660 () Bool)

(assert start!131660)

(declare-fun mapNonEmpty!58252 () Bool)

(declare-fun mapRes!58252 () Bool)

(declare-fun tp!110780 () Bool)

(declare-fun e!857856 () Bool)

(assert (=> mapNonEmpty!58252 (= mapRes!58252 (and tp!110780 e!857856))))

(declare-datatypes ((V!58709 0))(
  ( (V!58710 (val!18927 Int)) )
))
(declare-datatypes ((ValueCell!17939 0))(
  ( (ValueCellFull!17939 (v!21724 V!58709)) (EmptyCell!17939) )
))
(declare-fun mapValue!58252 () ValueCell!17939)

(declare-datatypes ((array!102570 0))(
  ( (array!102571 (arr!49488 (Array (_ BitVec 32) ValueCell!17939)) (size!50040 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102570)

(declare-fun mapRest!58252 () (Array (_ BitVec 32) ValueCell!17939))

(declare-fun mapKey!58252 () (_ BitVec 32))

(assert (=> mapNonEmpty!58252 (= (arr!49488 _values!470) (store mapRest!58252 mapKey!58252 mapValue!58252))))

(declare-fun res!1058319 () Bool)

(declare-fun e!857854 () Bool)

(assert (=> start!131660 (=> (not res!1058319) (not e!857854))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131660 (= res!1058319 (validMask!0 mask!926))))

(assert (=> start!131660 e!857854))

(assert (=> start!131660 true))

(declare-fun e!857853 () Bool)

(declare-fun array_inv!38701 (array!102570) Bool)

(assert (=> start!131660 (and (array_inv!38701 _values!470) e!857853)))

(declare-datatypes ((array!102572 0))(
  ( (array!102573 (arr!49489 (Array (_ BitVec 32) (_ BitVec 64))) (size!50041 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102572)

(declare-fun array_inv!38702 (array!102572) Bool)

(assert (=> start!131660 (array_inv!38702 _keys!618)))

(declare-fun b!1542032 () Bool)

(declare-fun res!1058317 () Bool)

(assert (=> b!1542032 (=> (not res!1058317) (not e!857854))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542032 (= res!1058317 (and (= (size!50040 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50041 _keys!618) (size!50040 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542033 () Bool)

(declare-fun e!857855 () Bool)

(assert (=> b!1542033 (= e!857853 (and e!857855 mapRes!58252))))

(declare-fun condMapEmpty!58252 () Bool)

(declare-fun mapDefault!58252 () ValueCell!17939)

(assert (=> b!1542033 (= condMapEmpty!58252 (= (arr!49488 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17939)) mapDefault!58252)))))

(declare-fun mapIsEmpty!58252 () Bool)

(assert (=> mapIsEmpty!58252 mapRes!58252))

(declare-fun b!1542034 () Bool)

(assert (=> b!1542034 (= e!857854 false)))

(declare-fun lt!665515 () Bool)

(declare-datatypes ((List!35924 0))(
  ( (Nil!35921) (Cons!35920 (h!37366 (_ BitVec 64)) (t!50610 List!35924)) )
))
(declare-fun arrayNoDuplicates!0 (array!102572 (_ BitVec 32) List!35924) Bool)

(assert (=> b!1542034 (= lt!665515 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35921))))

(declare-fun b!1542035 () Bool)

(declare-fun tp_is_empty!37699 () Bool)

(assert (=> b!1542035 (= e!857856 tp_is_empty!37699)))

(declare-fun b!1542036 () Bool)

(assert (=> b!1542036 (= e!857855 tp_is_empty!37699)))

(declare-fun b!1542037 () Bool)

(declare-fun res!1058318 () Bool)

(assert (=> b!1542037 (=> (not res!1058318) (not e!857854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102572 (_ BitVec 32)) Bool)

(assert (=> b!1542037 (= res!1058318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!131660 res!1058319) b!1542032))

(assert (= (and b!1542032 res!1058317) b!1542037))

(assert (= (and b!1542037 res!1058318) b!1542034))

(assert (= (and b!1542033 condMapEmpty!58252) mapIsEmpty!58252))

(assert (= (and b!1542033 (not condMapEmpty!58252)) mapNonEmpty!58252))

(get-info :version)

(assert (= (and mapNonEmpty!58252 ((_ is ValueCellFull!17939) mapValue!58252)) b!1542035))

(assert (= (and b!1542033 ((_ is ValueCellFull!17939) mapDefault!58252)) b!1542036))

(assert (= start!131660 b!1542033))

(declare-fun m!1423125 () Bool)

(assert (=> mapNonEmpty!58252 m!1423125))

(declare-fun m!1423127 () Bool)

(assert (=> start!131660 m!1423127))

(declare-fun m!1423129 () Bool)

(assert (=> start!131660 m!1423129))

(declare-fun m!1423131 () Bool)

(assert (=> start!131660 m!1423131))

(declare-fun m!1423133 () Bool)

(assert (=> b!1542034 m!1423133))

(declare-fun m!1423135 () Bool)

(assert (=> b!1542037 m!1423135))

(check-sat (not b!1542034) tp_is_empty!37699 (not mapNonEmpty!58252) (not start!131660) (not b!1542037))
(check-sat)
