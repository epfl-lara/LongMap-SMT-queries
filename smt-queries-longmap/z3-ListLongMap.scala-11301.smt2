; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131712 () Bool)

(assert start!131712)

(declare-fun b!1542363 () Bool)

(declare-fun res!1058455 () Bool)

(declare-fun e!858066 () Bool)

(assert (=> b!1542363 (=> (not res!1058455) (not e!858066))))

(declare-datatypes ((array!102632 0))(
  ( (array!102633 (arr!49518 (Array (_ BitVec 32) (_ BitVec 64))) (size!50068 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102632)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102632 (_ BitVec 32)) Bool)

(assert (=> b!1542363 (= res!1058455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542364 () Bool)

(declare-fun e!858068 () Bool)

(declare-fun tp_is_empty!37701 () Bool)

(assert (=> b!1542364 (= e!858068 tp_is_empty!37701)))

(declare-fun b!1542365 () Bool)

(declare-fun e!858065 () Bool)

(declare-fun mapRes!58255 () Bool)

(assert (=> b!1542365 (= e!858065 (and e!858068 mapRes!58255))))

(declare-fun condMapEmpty!58255 () Bool)

(declare-datatypes ((V!58711 0))(
  ( (V!58712 (val!18928 Int)) )
))
(declare-datatypes ((ValueCell!17940 0))(
  ( (ValueCellFull!17940 (v!21729 V!58711)) (EmptyCell!17940) )
))
(declare-datatypes ((array!102634 0))(
  ( (array!102635 (arr!49519 (Array (_ BitVec 32) ValueCell!17940)) (size!50069 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102634)

(declare-fun mapDefault!58255 () ValueCell!17940)

(assert (=> b!1542365 (= condMapEmpty!58255 (= (arr!49519 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17940)) mapDefault!58255)))))

(declare-fun b!1542366 () Bool)

(declare-fun res!1058456 () Bool)

(assert (=> b!1542366 (=> (not res!1058456) (not e!858066))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542366 (= res!1058456 (and (= (size!50069 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50068 _keys!618) (size!50069 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58255 () Bool)

(declare-fun tp!110782 () Bool)

(declare-fun e!858067 () Bool)

(assert (=> mapNonEmpty!58255 (= mapRes!58255 (and tp!110782 e!858067))))

(declare-fun mapValue!58255 () ValueCell!17940)

(declare-fun mapKey!58255 () (_ BitVec 32))

(declare-fun mapRest!58255 () (Array (_ BitVec 32) ValueCell!17940))

(assert (=> mapNonEmpty!58255 (= (arr!49519 _values!470) (store mapRest!58255 mapKey!58255 mapValue!58255))))

(declare-fun b!1542367 () Bool)

(assert (=> b!1542367 (= e!858066 false)))

(declare-fun lt!665804 () Bool)

(declare-datatypes ((List!35872 0))(
  ( (Nil!35869) (Cons!35868 (h!37313 (_ BitVec 64)) (t!50566 List!35872)) )
))
(declare-fun arrayNoDuplicates!0 (array!102632 (_ BitVec 32) List!35872) Bool)

(assert (=> b!1542367 (= lt!665804 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35869))))

(declare-fun mapIsEmpty!58255 () Bool)

(assert (=> mapIsEmpty!58255 mapRes!58255))

(declare-fun b!1542368 () Bool)

(assert (=> b!1542368 (= e!858067 tp_is_empty!37701)))

(declare-fun res!1058457 () Bool)

(assert (=> start!131712 (=> (not res!1058457) (not e!858066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131712 (= res!1058457 (validMask!0 mask!926))))

(assert (=> start!131712 e!858066))

(assert (=> start!131712 true))

(declare-fun array_inv!38527 (array!102634) Bool)

(assert (=> start!131712 (and (array_inv!38527 _values!470) e!858065)))

(declare-fun array_inv!38528 (array!102632) Bool)

(assert (=> start!131712 (array_inv!38528 _keys!618)))

(assert (= (and start!131712 res!1058457) b!1542366))

(assert (= (and b!1542366 res!1058456) b!1542363))

(assert (= (and b!1542363 res!1058455) b!1542367))

(assert (= (and b!1542365 condMapEmpty!58255) mapIsEmpty!58255))

(assert (= (and b!1542365 (not condMapEmpty!58255)) mapNonEmpty!58255))

(get-info :version)

(assert (= (and mapNonEmpty!58255 ((_ is ValueCellFull!17940) mapValue!58255)) b!1542368))

(assert (= (and b!1542365 ((_ is ValueCellFull!17940) mapDefault!58255)) b!1542364))

(assert (= start!131712 b!1542365))

(declare-fun m!1424029 () Bool)

(assert (=> b!1542363 m!1424029))

(declare-fun m!1424031 () Bool)

(assert (=> mapNonEmpty!58255 m!1424031))

(declare-fun m!1424033 () Bool)

(assert (=> b!1542367 m!1424033))

(declare-fun m!1424035 () Bool)

(assert (=> start!131712 m!1424035))

(declare-fun m!1424037 () Bool)

(assert (=> start!131712 m!1424037))

(declare-fun m!1424039 () Bool)

(assert (=> start!131712 m!1424039))

(check-sat (not start!131712) (not b!1542363) tp_is_empty!37701 (not mapNonEmpty!58255) (not b!1542367))
(check-sat)
