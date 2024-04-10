; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78426 () Bool)

(assert start!78426)

(declare-fun mapNonEmpty!30528 () Bool)

(declare-fun mapRes!30528 () Bool)

(declare-fun tp!58595 () Bool)

(declare-fun e!513248 () Bool)

(assert (=> mapNonEmpty!30528 (= mapRes!30528 (and tp!58595 e!513248))))

(declare-fun mapKey!30528 () (_ BitVec 32))

(declare-datatypes ((V!30553 0))(
  ( (V!30554 (val!9646 Int)) )
))
(declare-datatypes ((ValueCell!9114 0))(
  ( (ValueCellFull!9114 (v!12163 V!30553)) (EmptyCell!9114) )
))
(declare-fun mapRest!30528 () (Array (_ BitVec 32) ValueCell!9114))

(declare-datatypes ((array!54374 0))(
  ( (array!54375 (arr!26137 (Array (_ BitVec 32) ValueCell!9114)) (size!26596 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54374)

(declare-fun mapValue!30528 () ValueCell!9114)

(assert (=> mapNonEmpty!30528 (= (arr!26137 _values!1231) (store mapRest!30528 mapKey!30528 mapValue!30528))))

(declare-fun b!914786 () Bool)

(declare-fun e!513247 () Bool)

(declare-fun tp_is_empty!19191 () Bool)

(assert (=> b!914786 (= e!513247 tp_is_empty!19191)))

(declare-fun mapIsEmpty!30528 () Bool)

(assert (=> mapIsEmpty!30528 mapRes!30528))

(declare-fun b!914787 () Bool)

(assert (=> b!914787 (= e!513248 tp_is_empty!19191)))

(declare-fun res!616877 () Bool)

(declare-fun e!513251 () Bool)

(assert (=> start!78426 (=> (not res!616877) (not e!513251))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78426 (= res!616877 (validMask!0 mask!1881))))

(assert (=> start!78426 e!513251))

(assert (=> start!78426 true))

(declare-fun e!513250 () Bool)

(declare-fun array_inv!20412 (array!54374) Bool)

(assert (=> start!78426 (and (array_inv!20412 _values!1231) e!513250)))

(declare-datatypes ((array!54376 0))(
  ( (array!54377 (arr!26138 (Array (_ BitVec 32) (_ BitVec 64))) (size!26597 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54376)

(declare-fun array_inv!20413 (array!54376) Bool)

(assert (=> start!78426 (array_inv!20413 _keys!1487)))

(declare-fun b!914788 () Bool)

(assert (=> b!914788 (= e!513250 (and e!513247 mapRes!30528))))

(declare-fun condMapEmpty!30528 () Bool)

(declare-fun mapDefault!30528 () ValueCell!9114)

(assert (=> b!914788 (= condMapEmpty!30528 (= (arr!26137 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9114)) mapDefault!30528)))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun b!914789 () Bool)

(assert (=> b!914789 (= e!513251 (and (= (size!26596 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26597 _keys!1487) (size!26596 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011) (= (size!26597 _keys!1487) (bvadd #b00000000000000000000000000000001 mask!1881)) (bvsgt #b00000000000000000000000000000000 (size!26597 _keys!1487))))))

(assert (= (and start!78426 res!616877) b!914789))

(assert (= (and b!914788 condMapEmpty!30528) mapIsEmpty!30528))

(assert (= (and b!914788 (not condMapEmpty!30528)) mapNonEmpty!30528))

(get-info :version)

(assert (= (and mapNonEmpty!30528 ((_ is ValueCellFull!9114) mapValue!30528)) b!914787))

(assert (= (and b!914788 ((_ is ValueCellFull!9114) mapDefault!30528)) b!914786))

(assert (= start!78426 b!914788))

(declare-fun m!849403 () Bool)

(assert (=> mapNonEmpty!30528 m!849403))

(declare-fun m!849405 () Bool)

(assert (=> start!78426 m!849405))

(declare-fun m!849407 () Bool)

(assert (=> start!78426 m!849407))

(declare-fun m!849409 () Bool)

(assert (=> start!78426 m!849409))

(check-sat (not start!78426) (not mapNonEmpty!30528) tp_is_empty!19191)
(check-sat)
(get-model)

(declare-fun d!112697 () Bool)

(assert (=> d!112697 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78426 d!112697))

(declare-fun d!112699 () Bool)

(assert (=> d!112699 (= (array_inv!20412 _values!1231) (bvsge (size!26596 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78426 d!112699))

(declare-fun d!112701 () Bool)

(assert (=> d!112701 (= (array_inv!20413 _keys!1487) (bvsge (size!26597 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78426 d!112701))

(declare-fun condMapEmpty!30534 () Bool)

(declare-fun mapDefault!30534 () ValueCell!9114)

(assert (=> mapNonEmpty!30528 (= condMapEmpty!30534 (= mapRest!30528 ((as const (Array (_ BitVec 32) ValueCell!9114)) mapDefault!30534)))))

(declare-fun e!513271 () Bool)

(declare-fun mapRes!30534 () Bool)

(assert (=> mapNonEmpty!30528 (= tp!58595 (and e!513271 mapRes!30534))))

(declare-fun b!914809 () Bool)

(assert (=> b!914809 (= e!513271 tp_is_empty!19191)))

(declare-fun mapIsEmpty!30534 () Bool)

(assert (=> mapIsEmpty!30534 mapRes!30534))

(declare-fun b!914808 () Bool)

(declare-fun e!513272 () Bool)

(assert (=> b!914808 (= e!513272 tp_is_empty!19191)))

(declare-fun mapNonEmpty!30534 () Bool)

(declare-fun tp!58601 () Bool)

(assert (=> mapNonEmpty!30534 (= mapRes!30534 (and tp!58601 e!513272))))

(declare-fun mapValue!30534 () ValueCell!9114)

(declare-fun mapRest!30534 () (Array (_ BitVec 32) ValueCell!9114))

(declare-fun mapKey!30534 () (_ BitVec 32))

(assert (=> mapNonEmpty!30534 (= mapRest!30528 (store mapRest!30534 mapKey!30534 mapValue!30534))))

(assert (= (and mapNonEmpty!30528 condMapEmpty!30534) mapIsEmpty!30534))

(assert (= (and mapNonEmpty!30528 (not condMapEmpty!30534)) mapNonEmpty!30534))

(assert (= (and mapNonEmpty!30534 ((_ is ValueCellFull!9114) mapValue!30534)) b!914808))

(assert (= (and mapNonEmpty!30528 ((_ is ValueCellFull!9114) mapDefault!30534)) b!914809))

(declare-fun m!849419 () Bool)

(assert (=> mapNonEmpty!30534 m!849419))

(check-sat (not mapNonEmpty!30534) tp_is_empty!19191)
(check-sat)
