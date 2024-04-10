; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131596 () Bool)

(assert start!131596)

(declare-fun b!1541579 () Bool)

(declare-fun e!857430 () Bool)

(declare-fun tp_is_empty!37629 () Bool)

(assert (=> b!1541579 (= e!857430 tp_is_empty!37629)))

(declare-fun res!1058059 () Bool)

(declare-fun e!857432 () Bool)

(assert (=> start!131596 (=> (not res!1058059) (not e!857432))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131596 (= res!1058059 (validMask!0 mask!926))))

(assert (=> start!131596 e!857432))

(assert (=> start!131596 true))

(declare-datatypes ((V!58615 0))(
  ( (V!58616 (val!18892 Int)) )
))
(declare-datatypes ((ValueCell!17904 0))(
  ( (ValueCellFull!17904 (v!21692 V!58615)) (EmptyCell!17904) )
))
(declare-datatypes ((array!102490 0))(
  ( (array!102491 (arr!49452 (Array (_ BitVec 32) ValueCell!17904)) (size!50002 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102490)

(declare-fun e!857434 () Bool)

(declare-fun array_inv!38477 (array!102490) Bool)

(assert (=> start!131596 (and (array_inv!38477 _values!470) e!857434)))

(declare-datatypes ((array!102492 0))(
  ( (array!102493 (arr!49453 (Array (_ BitVec 32) (_ BitVec 64))) (size!50003 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102492)

(declare-fun array_inv!38478 (array!102492) Bool)

(assert (=> start!131596 (array_inv!38478 _keys!618)))

(declare-fun mapIsEmpty!58132 () Bool)

(declare-fun mapRes!58132 () Bool)

(assert (=> mapIsEmpty!58132 mapRes!58132))

(declare-fun mapNonEmpty!58132 () Bool)

(declare-fun tp!110659 () Bool)

(assert (=> mapNonEmpty!58132 (= mapRes!58132 (and tp!110659 e!857430))))

(declare-fun mapValue!58132 () ValueCell!17904)

(declare-fun mapKey!58132 () (_ BitVec 32))

(declare-fun mapRest!58132 () (Array (_ BitVec 32) ValueCell!17904))

(assert (=> mapNonEmpty!58132 (= (arr!49452 _values!470) (store mapRest!58132 mapKey!58132 mapValue!58132))))

(declare-fun b!1541580 () Bool)

(declare-fun e!857431 () Bool)

(assert (=> b!1541580 (= e!857431 tp_is_empty!37629)))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun b!1541581 () Bool)

(assert (=> b!1541581 (= e!857432 (and (= (size!50002 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50003 _keys!618) (size!50002 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011) (= (size!50003 _keys!618) (bvadd #b00000000000000000000000000000001 mask!926)) (bvsgt #b00000000000000000000000000000000 (size!50003 _keys!618))))))

(declare-fun b!1541582 () Bool)

(assert (=> b!1541582 (= e!857434 (and e!857431 mapRes!58132))))

(declare-fun condMapEmpty!58132 () Bool)

(declare-fun mapDefault!58132 () ValueCell!17904)

(assert (=> b!1541582 (= condMapEmpty!58132 (= (arr!49452 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17904)) mapDefault!58132)))))

(assert (= (and start!131596 res!1058059) b!1541581))

(assert (= (and b!1541582 condMapEmpty!58132) mapIsEmpty!58132))

(assert (= (and b!1541582 (not condMapEmpty!58132)) mapNonEmpty!58132))

(get-info :version)

(assert (= (and mapNonEmpty!58132 ((_ is ValueCellFull!17904) mapValue!58132)) b!1541579))

(assert (= (and b!1541582 ((_ is ValueCellFull!17904) mapDefault!58132)) b!1541580))

(assert (= start!131596 b!1541582))

(declare-fun m!1423529 () Bool)

(assert (=> start!131596 m!1423529))

(declare-fun m!1423531 () Bool)

(assert (=> start!131596 m!1423531))

(declare-fun m!1423533 () Bool)

(assert (=> start!131596 m!1423533))

(declare-fun m!1423535 () Bool)

(assert (=> mapNonEmpty!58132 m!1423535))

(check-sat (not start!131596) (not mapNonEmpty!58132) tp_is_empty!37629)
(check-sat)
(get-model)

(declare-fun d!160687 () Bool)

(assert (=> d!160687 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!131596 d!160687))

(declare-fun d!160689 () Bool)

(assert (=> d!160689 (= (array_inv!38477 _values!470) (bvsge (size!50002 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!131596 d!160689))

(declare-fun d!160691 () Bool)

(assert (=> d!160691 (= (array_inv!38478 _keys!618) (bvsge (size!50003 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!131596 d!160691))

(declare-fun mapNonEmpty!58138 () Bool)

(declare-fun mapRes!58138 () Bool)

(declare-fun tp!110665 () Bool)

(declare-fun e!857455 () Bool)

(assert (=> mapNonEmpty!58138 (= mapRes!58138 (and tp!110665 e!857455))))

(declare-fun mapKey!58138 () (_ BitVec 32))

(declare-fun mapValue!58138 () ValueCell!17904)

(declare-fun mapRest!58138 () (Array (_ BitVec 32) ValueCell!17904))

(assert (=> mapNonEmpty!58138 (= mapRest!58132 (store mapRest!58138 mapKey!58138 mapValue!58138))))

(declare-fun mapIsEmpty!58138 () Bool)

(assert (=> mapIsEmpty!58138 mapRes!58138))

(declare-fun condMapEmpty!58138 () Bool)

(declare-fun mapDefault!58138 () ValueCell!17904)

(assert (=> mapNonEmpty!58132 (= condMapEmpty!58138 (= mapRest!58132 ((as const (Array (_ BitVec 32) ValueCell!17904)) mapDefault!58138)))))

(declare-fun e!857454 () Bool)

(assert (=> mapNonEmpty!58132 (= tp!110659 (and e!857454 mapRes!58138))))

(declare-fun b!1541601 () Bool)

(assert (=> b!1541601 (= e!857455 tp_is_empty!37629)))

(declare-fun b!1541602 () Bool)

(assert (=> b!1541602 (= e!857454 tp_is_empty!37629)))

(assert (= (and mapNonEmpty!58132 condMapEmpty!58138) mapIsEmpty!58138))

(assert (= (and mapNonEmpty!58132 (not condMapEmpty!58138)) mapNonEmpty!58138))

(assert (= (and mapNonEmpty!58138 ((_ is ValueCellFull!17904) mapValue!58138)) b!1541601))

(assert (= (and mapNonEmpty!58132 ((_ is ValueCellFull!17904) mapDefault!58138)) b!1541602))

(declare-fun m!1423545 () Bool)

(assert (=> mapNonEmpty!58138 m!1423545))

(check-sat (not mapNonEmpty!58138) tp_is_empty!37629)
(check-sat)
