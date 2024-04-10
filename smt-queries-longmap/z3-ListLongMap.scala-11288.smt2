; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131590 () Bool)

(assert start!131590)

(declare-fun e!857389 () Bool)

(declare-datatypes ((array!102480 0))(
  ( (array!102481 (arr!49447 (Array (_ BitVec 32) (_ BitVec 64))) (size!49997 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102480)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58607 0))(
  ( (V!58608 (val!18889 Int)) )
))
(declare-datatypes ((ValueCell!17901 0))(
  ( (ValueCellFull!17901 (v!21689 V!58607)) (EmptyCell!17901) )
))
(declare-datatypes ((array!102482 0))(
  ( (array!102483 (arr!49448 (Array (_ BitVec 32) ValueCell!17901)) (size!49998 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102482)

(declare-fun b!1541543 () Bool)

(assert (=> b!1541543 (= e!857389 (and (= (size!49998 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!49997 _keys!618) (size!49998 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011) (not (= (size!49997 _keys!618) (bvadd #b00000000000000000000000000000001 mask!926)))))))

(declare-fun b!1541544 () Bool)

(declare-fun e!857385 () Bool)

(declare-fun tp_is_empty!37623 () Bool)

(assert (=> b!1541544 (= e!857385 tp_is_empty!37623)))

(declare-fun mapIsEmpty!58123 () Bool)

(declare-fun mapRes!58123 () Bool)

(assert (=> mapIsEmpty!58123 mapRes!58123))

(declare-fun res!1058050 () Bool)

(assert (=> start!131590 (=> (not res!1058050) (not e!857389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131590 (= res!1058050 (validMask!0 mask!926))))

(assert (=> start!131590 e!857389))

(assert (=> start!131590 true))

(declare-fun e!857388 () Bool)

(declare-fun array_inv!38473 (array!102482) Bool)

(assert (=> start!131590 (and (array_inv!38473 _values!470) e!857388)))

(declare-fun array_inv!38474 (array!102480) Bool)

(assert (=> start!131590 (array_inv!38474 _keys!618)))

(declare-fun b!1541545 () Bool)

(declare-fun e!857387 () Bool)

(assert (=> b!1541545 (= e!857388 (and e!857387 mapRes!58123))))

(declare-fun condMapEmpty!58123 () Bool)

(declare-fun mapDefault!58123 () ValueCell!17901)

(assert (=> b!1541545 (= condMapEmpty!58123 (= (arr!49448 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17901)) mapDefault!58123)))))

(declare-fun b!1541546 () Bool)

(assert (=> b!1541546 (= e!857387 tp_is_empty!37623)))

(declare-fun mapNonEmpty!58123 () Bool)

(declare-fun tp!110650 () Bool)

(assert (=> mapNonEmpty!58123 (= mapRes!58123 (and tp!110650 e!857385))))

(declare-fun mapKey!58123 () (_ BitVec 32))

(declare-fun mapValue!58123 () ValueCell!17901)

(declare-fun mapRest!58123 () (Array (_ BitVec 32) ValueCell!17901))

(assert (=> mapNonEmpty!58123 (= (arr!49448 _values!470) (store mapRest!58123 mapKey!58123 mapValue!58123))))

(assert (= (and start!131590 res!1058050) b!1541543))

(assert (= (and b!1541545 condMapEmpty!58123) mapIsEmpty!58123))

(assert (= (and b!1541545 (not condMapEmpty!58123)) mapNonEmpty!58123))

(get-info :version)

(assert (= (and mapNonEmpty!58123 ((_ is ValueCellFull!17901) mapValue!58123)) b!1541544))

(assert (= (and b!1541545 ((_ is ValueCellFull!17901) mapDefault!58123)) b!1541546))

(assert (= start!131590 b!1541545))

(declare-fun m!1423505 () Bool)

(assert (=> start!131590 m!1423505))

(declare-fun m!1423507 () Bool)

(assert (=> start!131590 m!1423507))

(declare-fun m!1423509 () Bool)

(assert (=> start!131590 m!1423509))

(declare-fun m!1423511 () Bool)

(assert (=> mapNonEmpty!58123 m!1423511))

(check-sat (not start!131590) (not mapNonEmpty!58123) tp_is_empty!37623)
(check-sat)
