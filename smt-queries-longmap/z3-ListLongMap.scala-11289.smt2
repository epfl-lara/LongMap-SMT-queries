; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132006 () Bool)

(assert start!132006)

(declare-fun mapIsEmpty!58129 () Bool)

(declare-fun mapRes!58129 () Bool)

(assert (=> mapIsEmpty!58129 mapRes!58129))

(declare-fun b!1544003 () Bool)

(declare-fun e!858925 () Bool)

(declare-fun tp_is_empty!37627 () Bool)

(assert (=> b!1544003 (= e!858925 tp_is_empty!37627)))

(declare-fun mapNonEmpty!58129 () Bool)

(declare-fun tp!110656 () Bool)

(declare-fun e!858926 () Bool)

(assert (=> mapNonEmpty!58129 (= mapRes!58129 (and tp!110656 e!858926))))

(declare-datatypes ((V!58613 0))(
  ( (V!58614 (val!18891 Int)) )
))
(declare-datatypes ((ValueCell!17903 0))(
  ( (ValueCellFull!17903 (v!21683 V!58613)) (EmptyCell!17903) )
))
(declare-fun mapValue!58129 () ValueCell!17903)

(declare-datatypes ((array!102606 0))(
  ( (array!102607 (arr!49503 (Array (_ BitVec 32) ValueCell!17903)) (size!50054 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102606)

(declare-fun mapRest!58129 () (Array (_ BitVec 32) ValueCell!17903))

(declare-fun mapKey!58129 () (_ BitVec 32))

(assert (=> mapNonEmpty!58129 (= (arr!49503 _values!470) (store mapRest!58129 mapKey!58129 mapValue!58129))))

(declare-fun b!1544004 () Bool)

(assert (=> b!1544004 (= e!858926 tp_is_empty!37627)))

(declare-fun res!1058916 () Bool)

(declare-fun e!858924 () Bool)

(assert (=> start!132006 (=> (not res!1058916) (not e!858924))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132006 (= res!1058916 (validMask!0 mask!926))))

(assert (=> start!132006 e!858924))

(assert (=> start!132006 true))

(declare-fun e!858928 () Bool)

(declare-fun array_inv!38781 (array!102606) Bool)

(assert (=> start!132006 (and (array_inv!38781 _values!470) e!858928)))

(declare-datatypes ((array!102608 0))(
  ( (array!102609 (arr!49504 (Array (_ BitVec 32) (_ BitVec 64))) (size!50055 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102608)

(declare-fun array_inv!38782 (array!102608) Bool)

(assert (=> start!132006 (array_inv!38782 _keys!618)))

(declare-fun b!1544005 () Bool)

(assert (=> b!1544005 (= e!858928 (and e!858925 mapRes!58129))))

(declare-fun condMapEmpty!58129 () Bool)

(declare-fun mapDefault!58129 () ValueCell!17903)

(assert (=> b!1544005 (= condMapEmpty!58129 (= (arr!49503 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17903)) mapDefault!58129)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun b!1544006 () Bool)

(assert (=> b!1544006 (= e!858924 (and (= (size!50054 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50055 _keys!618) (size!50054 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011) (= (size!50055 _keys!618) (bvadd #b00000000000000000000000000000001 mask!926)) (bvsgt #b00000000000000000000000000000000 (size!50055 _keys!618))))))

(assert (= (and start!132006 res!1058916) b!1544006))

(assert (= (and b!1544005 condMapEmpty!58129) mapIsEmpty!58129))

(assert (= (and b!1544005 (not condMapEmpty!58129)) mapNonEmpty!58129))

(get-info :version)

(assert (= (and mapNonEmpty!58129 ((_ is ValueCellFull!17903) mapValue!58129)) b!1544004))

(assert (= (and b!1544005 ((_ is ValueCellFull!17903) mapDefault!58129)) b!1544003))

(assert (= start!132006 b!1544005))

(declare-fun m!1425779 () Bool)

(assert (=> mapNonEmpty!58129 m!1425779))

(declare-fun m!1425781 () Bool)

(assert (=> start!132006 m!1425781))

(declare-fun m!1425783 () Bool)

(assert (=> start!132006 m!1425783))

(declare-fun m!1425785 () Bool)

(assert (=> start!132006 m!1425785))

(check-sat (not start!132006) (not mapNonEmpty!58129) tp_is_empty!37627)
(check-sat)
(get-model)

(declare-fun d!161387 () Bool)

(assert (=> d!161387 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132006 d!161387))

(declare-fun d!161389 () Bool)

(assert (=> d!161389 (= (array_inv!38781 _values!470) (bvsge (size!50054 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132006 d!161389))

(declare-fun d!161391 () Bool)

(assert (=> d!161391 (= (array_inv!38782 _keys!618) (bvsge (size!50055 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132006 d!161391))

(declare-fun condMapEmpty!58138 () Bool)

(declare-fun mapDefault!58138 () ValueCell!17903)

(assert (=> mapNonEmpty!58129 (= condMapEmpty!58138 (= mapRest!58129 ((as const (Array (_ BitVec 32) ValueCell!17903)) mapDefault!58138)))))

(declare-fun e!858964 () Bool)

(declare-fun mapRes!58138 () Bool)

(assert (=> mapNonEmpty!58129 (= tp!110656 (and e!858964 mapRes!58138))))

(declare-fun b!1544038 () Bool)

(assert (=> b!1544038 (= e!858964 tp_is_empty!37627)))

(declare-fun mapNonEmpty!58138 () Bool)

(declare-fun tp!110665 () Bool)

(declare-fun e!858963 () Bool)

(assert (=> mapNonEmpty!58138 (= mapRes!58138 (and tp!110665 e!858963))))

(declare-fun mapKey!58138 () (_ BitVec 32))

(declare-fun mapRest!58138 () (Array (_ BitVec 32) ValueCell!17903))

(declare-fun mapValue!58138 () ValueCell!17903)

(assert (=> mapNonEmpty!58138 (= mapRest!58129 (store mapRest!58138 mapKey!58138 mapValue!58138))))

(declare-fun b!1544037 () Bool)

(assert (=> b!1544037 (= e!858963 tp_is_empty!37627)))

(declare-fun mapIsEmpty!58138 () Bool)

(assert (=> mapIsEmpty!58138 mapRes!58138))

(assert (= (and mapNonEmpty!58129 condMapEmpty!58138) mapIsEmpty!58138))

(assert (= (and mapNonEmpty!58129 (not condMapEmpty!58138)) mapNonEmpty!58138))

(assert (= (and mapNonEmpty!58138 ((_ is ValueCellFull!17903) mapValue!58138)) b!1544037))

(assert (= (and mapNonEmpty!58129 ((_ is ValueCellFull!17903) mapDefault!58138)) b!1544038))

(declare-fun m!1425803 () Bool)

(assert (=> mapNonEmpty!58138 m!1425803))

(check-sat (not mapNonEmpty!58138) tp_is_empty!37627)
(check-sat)
