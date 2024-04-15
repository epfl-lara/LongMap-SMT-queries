; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131544 () Bool)

(assert start!131544)

(declare-fun b!1541254 () Bool)

(declare-fun e!857218 () Bool)

(declare-fun tp_is_empty!37627 () Bool)

(assert (=> b!1541254 (= e!857218 tp_is_empty!37627)))

(declare-fun mapIsEmpty!58129 () Bool)

(declare-fun mapRes!58129 () Bool)

(assert (=> mapIsEmpty!58129 mapRes!58129))

(declare-fun b!1541256 () Bool)

(declare-fun e!857221 () Bool)

(assert (=> b!1541256 (= e!857221 (and e!857218 mapRes!58129))))

(declare-fun condMapEmpty!58129 () Bool)

(declare-datatypes ((V!58613 0))(
  ( (V!58614 (val!18891 Int)) )
))
(declare-datatypes ((ValueCell!17903 0))(
  ( (ValueCellFull!17903 (v!21687 V!58613)) (EmptyCell!17903) )
))
(declare-datatypes ((array!102432 0))(
  ( (array!102433 (arr!49424 (Array (_ BitVec 32) ValueCell!17903)) (size!49976 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102432)

(declare-fun mapDefault!58129 () ValueCell!17903)

(assert (=> b!1541256 (= condMapEmpty!58129 (= (arr!49424 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17903)) mapDefault!58129)))))

(declare-fun b!1541255 () Bool)

(declare-fun e!857220 () Bool)

(assert (=> b!1541255 (= e!857220 tp_is_empty!37627)))

(declare-fun res!1057927 () Bool)

(declare-fun e!857219 () Bool)

(assert (=> start!131544 (=> (not res!1057927) (not e!857219))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131544 (= res!1057927 (validMask!0 mask!926))))

(assert (=> start!131544 e!857219))

(assert (=> start!131544 true))

(declare-fun array_inv!38655 (array!102432) Bool)

(assert (=> start!131544 (and (array_inv!38655 _values!470) e!857221)))

(declare-datatypes ((array!102434 0))(
  ( (array!102435 (arr!49425 (Array (_ BitVec 32) (_ BitVec 64))) (size!49977 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102434)

(declare-fun array_inv!38656 (array!102434) Bool)

(assert (=> start!131544 (array_inv!38656 _keys!618)))

(declare-fun mapNonEmpty!58129 () Bool)

(declare-fun tp!110657 () Bool)

(assert (=> mapNonEmpty!58129 (= mapRes!58129 (and tp!110657 e!857220))))

(declare-fun mapRest!58129 () (Array (_ BitVec 32) ValueCell!17903))

(declare-fun mapKey!58129 () (_ BitVec 32))

(declare-fun mapValue!58129 () ValueCell!17903)

(assert (=> mapNonEmpty!58129 (= (arr!49424 _values!470) (store mapRest!58129 mapKey!58129 mapValue!58129))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun b!1541257 () Bool)

(assert (=> b!1541257 (= e!857219 (and (= (size!49976 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!49977 _keys!618) (size!49976 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011) (= (size!49977 _keys!618) (bvadd #b00000000000000000000000000000001 mask!926)) (bvsgt #b00000000000000000000000000000000 (size!49977 _keys!618))))))

(assert (= (and start!131544 res!1057927) b!1541257))

(assert (= (and b!1541256 condMapEmpty!58129) mapIsEmpty!58129))

(assert (= (and b!1541256 (not condMapEmpty!58129)) mapNonEmpty!58129))

(get-info :version)

(assert (= (and mapNonEmpty!58129 ((_ is ValueCellFull!17903) mapValue!58129)) b!1541255))

(assert (= (and b!1541256 ((_ is ValueCellFull!17903) mapDefault!58129)) b!1541254))

(assert (= start!131544 b!1541256))

(declare-fun m!1422629 () Bool)

(assert (=> start!131544 m!1422629))

(declare-fun m!1422631 () Bool)

(assert (=> start!131544 m!1422631))

(declare-fun m!1422633 () Bool)

(assert (=> start!131544 m!1422633))

(declare-fun m!1422635 () Bool)

(assert (=> mapNonEmpty!58129 m!1422635))

(check-sat (not start!131544) (not mapNonEmpty!58129) tp_is_empty!37627)
(check-sat)
(get-model)

(declare-fun d!160433 () Bool)

(assert (=> d!160433 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!131544 d!160433))

(declare-fun d!160435 () Bool)

(assert (=> d!160435 (= (array_inv!38655 _values!470) (bvsge (size!49976 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!131544 d!160435))

(declare-fun d!160437 () Bool)

(assert (=> d!160437 (= (array_inv!38656 _keys!618) (bvsge (size!49977 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!131544 d!160437))

(declare-fun mapIsEmpty!58138 () Bool)

(declare-fun mapRes!58138 () Bool)

(assert (=> mapIsEmpty!58138 mapRes!58138))

(declare-fun b!1541288 () Bool)

(declare-fun e!857257 () Bool)

(assert (=> b!1541288 (= e!857257 tp_is_empty!37627)))

(declare-fun condMapEmpty!58138 () Bool)

(declare-fun mapDefault!58138 () ValueCell!17903)

(assert (=> mapNonEmpty!58129 (= condMapEmpty!58138 (= mapRest!58129 ((as const (Array (_ BitVec 32) ValueCell!17903)) mapDefault!58138)))))

(declare-fun e!857256 () Bool)

(assert (=> mapNonEmpty!58129 (= tp!110657 (and e!857256 mapRes!58138))))

(declare-fun b!1541289 () Bool)

(assert (=> b!1541289 (= e!857256 tp_is_empty!37627)))

(declare-fun mapNonEmpty!58138 () Bool)

(declare-fun tp!110666 () Bool)

(assert (=> mapNonEmpty!58138 (= mapRes!58138 (and tp!110666 e!857257))))

(declare-fun mapValue!58138 () ValueCell!17903)

(declare-fun mapRest!58138 () (Array (_ BitVec 32) ValueCell!17903))

(declare-fun mapKey!58138 () (_ BitVec 32))

(assert (=> mapNonEmpty!58138 (= mapRest!58129 (store mapRest!58138 mapKey!58138 mapValue!58138))))

(assert (= (and mapNonEmpty!58129 condMapEmpty!58138) mapIsEmpty!58138))

(assert (= (and mapNonEmpty!58129 (not condMapEmpty!58138)) mapNonEmpty!58138))

(assert (= (and mapNonEmpty!58138 ((_ is ValueCellFull!17903) mapValue!58138)) b!1541288))

(assert (= (and mapNonEmpty!58129 ((_ is ValueCellFull!17903) mapDefault!58138)) b!1541289))

(declare-fun m!1422653 () Bool)

(assert (=> mapNonEmpty!58138 m!1422653))

(check-sat (not mapNonEmpty!58138) tp_is_empty!37627)
(check-sat)
