; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133336 () Bool)

(assert start!133336)

(declare-fun b!1559180 () Bool)

(declare-fun e!868707 () Bool)

(declare-fun tp_is_empty!38463 () Bool)

(assert (=> b!1559180 (= e!868707 tp_is_empty!38463)))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun b!1559181 () Bool)

(declare-datatypes ((array!103648 0))(
  ( (array!103649 (arr!50021 (Array (_ BitVec 32) (_ BitVec 64))) (size!50571 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103648)

(declare-datatypes ((V!59491 0))(
  ( (V!59492 (val!19315 Int)) )
))
(declare-datatypes ((ValueCell!18201 0))(
  ( (ValueCellFull!18201 (v!22066 V!59491)) (EmptyCell!18201) )
))
(declare-datatypes ((array!103650 0))(
  ( (array!103651 (arr!50022 (Array (_ BitVec 32) ValueCell!18201)) (size!50572 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103650)

(declare-fun e!868709 () Bool)

(assert (=> b!1559181 (= e!868709 (and (= (size!50572 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50571 _keys!637) (size!50572 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011) (= (size!50571 _keys!637) (bvadd #b00000000000000000000000000000001 mask!947)) (bvsgt #b00000000000000000000000000000000 (size!50571 _keys!637))))))

(declare-fun res!1066270 () Bool)

(assert (=> start!133336 (=> (not res!1066270) (not e!868709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133336 (= res!1066270 (validMask!0 mask!947))))

(assert (=> start!133336 e!868709))

(assert (=> start!133336 true))

(declare-fun e!868706 () Bool)

(declare-fun array_inv!38885 (array!103650) Bool)

(assert (=> start!133336 (and (array_inv!38885 _values!487) e!868706)))

(declare-fun array_inv!38886 (array!103648) Bool)

(assert (=> start!133336 (array_inv!38886 _keys!637)))

(declare-fun b!1559182 () Bool)

(declare-fun mapRes!59055 () Bool)

(assert (=> b!1559182 (= e!868706 (and e!868707 mapRes!59055))))

(declare-fun condMapEmpty!59055 () Bool)

(declare-fun mapDefault!59055 () ValueCell!18201)

(assert (=> b!1559182 (= condMapEmpty!59055 (= (arr!50022 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18201)) mapDefault!59055)))))

(declare-fun b!1559183 () Bool)

(declare-fun e!868708 () Bool)

(assert (=> b!1559183 (= e!868708 tp_is_empty!38463)))

(declare-fun mapIsEmpty!59055 () Bool)

(assert (=> mapIsEmpty!59055 mapRes!59055))

(declare-fun mapNonEmpty!59055 () Bool)

(declare-fun tp!112710 () Bool)

(assert (=> mapNonEmpty!59055 (= mapRes!59055 (and tp!112710 e!868708))))

(declare-fun mapKey!59055 () (_ BitVec 32))

(declare-fun mapValue!59055 () ValueCell!18201)

(declare-fun mapRest!59055 () (Array (_ BitVec 32) ValueCell!18201))

(assert (=> mapNonEmpty!59055 (= (arr!50022 _values!487) (store mapRest!59055 mapKey!59055 mapValue!59055))))

(assert (= (and start!133336 res!1066270) b!1559181))

(assert (= (and b!1559182 condMapEmpty!59055) mapIsEmpty!59055))

(assert (= (and b!1559182 (not condMapEmpty!59055)) mapNonEmpty!59055))

(get-info :version)

(assert (= (and mapNonEmpty!59055 ((_ is ValueCellFull!18201) mapValue!59055)) b!1559183))

(assert (= (and b!1559182 ((_ is ValueCellFull!18201) mapDefault!59055)) b!1559180))

(assert (= start!133336 b!1559182))

(declare-fun m!1435529 () Bool)

(assert (=> start!133336 m!1435529))

(declare-fun m!1435531 () Bool)

(assert (=> start!133336 m!1435531))

(declare-fun m!1435533 () Bool)

(assert (=> start!133336 m!1435533))

(declare-fun m!1435535 () Bool)

(assert (=> mapNonEmpty!59055 m!1435535))

(check-sat (not start!133336) (not mapNonEmpty!59055) tp_is_empty!38463)
(check-sat)
(get-model)

(declare-fun d!162895 () Bool)

(assert (=> d!162895 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133336 d!162895))

(declare-fun d!162897 () Bool)

(assert (=> d!162897 (= (array_inv!38885 _values!487) (bvsge (size!50572 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133336 d!162897))

(declare-fun d!162899 () Bool)

(assert (=> d!162899 (= (array_inv!38886 _keys!637) (bvsge (size!50571 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133336 d!162899))

(declare-fun b!1559202 () Bool)

(declare-fun e!868729 () Bool)

(assert (=> b!1559202 (= e!868729 tp_is_empty!38463)))

(declare-fun condMapEmpty!59061 () Bool)

(declare-fun mapDefault!59061 () ValueCell!18201)

(assert (=> mapNonEmpty!59055 (= condMapEmpty!59061 (= mapRest!59055 ((as const (Array (_ BitVec 32) ValueCell!18201)) mapDefault!59061)))))

(declare-fun e!868730 () Bool)

(declare-fun mapRes!59061 () Bool)

(assert (=> mapNonEmpty!59055 (= tp!112710 (and e!868730 mapRes!59061))))

(declare-fun mapIsEmpty!59061 () Bool)

(assert (=> mapIsEmpty!59061 mapRes!59061))

(declare-fun b!1559203 () Bool)

(assert (=> b!1559203 (= e!868730 tp_is_empty!38463)))

(declare-fun mapNonEmpty!59061 () Bool)

(declare-fun tp!112716 () Bool)

(assert (=> mapNonEmpty!59061 (= mapRes!59061 (and tp!112716 e!868729))))

(declare-fun mapValue!59061 () ValueCell!18201)

(declare-fun mapRest!59061 () (Array (_ BitVec 32) ValueCell!18201))

(declare-fun mapKey!59061 () (_ BitVec 32))

(assert (=> mapNonEmpty!59061 (= mapRest!59055 (store mapRest!59061 mapKey!59061 mapValue!59061))))

(assert (= (and mapNonEmpty!59055 condMapEmpty!59061) mapIsEmpty!59061))

(assert (= (and mapNonEmpty!59055 (not condMapEmpty!59061)) mapNonEmpty!59061))

(assert (= (and mapNonEmpty!59061 ((_ is ValueCellFull!18201) mapValue!59061)) b!1559202))

(assert (= (and mapNonEmpty!59055 ((_ is ValueCellFull!18201) mapDefault!59061)) b!1559203))

(declare-fun m!1435545 () Bool)

(assert (=> mapNonEmpty!59061 m!1435545))

(check-sat (not mapNonEmpty!59061) tp_is_empty!38463)
(check-sat)
