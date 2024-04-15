; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84782 () Bool)

(assert start!84782)

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun e!558974 () Bool)

(declare-datatypes ((V!36081 0))(
  ( (V!36082 (val!11712 Int)) )
))
(declare-datatypes ((ValueCell!11180 0))(
  ( (ValueCellFull!11180 (v!14287 V!36081)) (EmptyCell!11180) )
))
(declare-datatypes ((array!62540 0))(
  ( (array!62541 (arr!30120 (Array (_ BitVec 32) ValueCell!11180)) (size!30601 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62540)

(declare-fun b!991206 () Bool)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62542 0))(
  ( (array!62543 (arr!30121 (Array (_ BitVec 32) (_ BitVec 64))) (size!30602 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62542)

(assert (=> b!991206 (= e!558974 (and (= (size!30601 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30602 _keys!1945) (size!30601 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011) (= (size!30602 _keys!1945) (bvadd #b00000000000000000000000000000001 mask!2471)) (bvsgt #b00000000000000000000000000000000 (size!30602 _keys!1945))))))

(declare-fun mapIsEmpty!37041 () Bool)

(declare-fun mapRes!37041 () Bool)

(assert (=> mapIsEmpty!37041 mapRes!37041))

(declare-fun mapNonEmpty!37041 () Bool)

(declare-fun tp!70113 () Bool)

(declare-fun e!558975 () Bool)

(assert (=> mapNonEmpty!37041 (= mapRes!37041 (and tp!70113 e!558975))))

(declare-fun mapKey!37041 () (_ BitVec 32))

(declare-fun mapValue!37041 () ValueCell!11180)

(declare-fun mapRest!37041 () (Array (_ BitVec 32) ValueCell!11180))

(assert (=> mapNonEmpty!37041 (= (arr!30120 _values!1551) (store mapRest!37041 mapKey!37041 mapValue!37041))))

(declare-fun res!662645 () Bool)

(assert (=> start!84782 (=> (not res!662645) (not e!558974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84782 (= res!662645 (validMask!0 mask!2471))))

(assert (=> start!84782 e!558974))

(assert (=> start!84782 true))

(declare-fun e!558972 () Bool)

(declare-fun array_inv!23275 (array!62540) Bool)

(assert (=> start!84782 (and (array_inv!23275 _values!1551) e!558972)))

(declare-fun array_inv!23276 (array!62542) Bool)

(assert (=> start!84782 (array_inv!23276 _keys!1945)))

(declare-fun b!991207 () Bool)

(declare-fun e!558971 () Bool)

(assert (=> b!991207 (= e!558972 (and e!558971 mapRes!37041))))

(declare-fun condMapEmpty!37041 () Bool)

(declare-fun mapDefault!37041 () ValueCell!11180)

(assert (=> b!991207 (= condMapEmpty!37041 (= (arr!30120 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11180)) mapDefault!37041)))))

(declare-fun b!991208 () Bool)

(declare-fun tp_is_empty!23323 () Bool)

(assert (=> b!991208 (= e!558975 tp_is_empty!23323)))

(declare-fun b!991209 () Bool)

(assert (=> b!991209 (= e!558971 tp_is_empty!23323)))

(assert (= (and start!84782 res!662645) b!991206))

(assert (= (and b!991207 condMapEmpty!37041) mapIsEmpty!37041))

(assert (= (and b!991207 (not condMapEmpty!37041)) mapNonEmpty!37041))

(get-info :version)

(assert (= (and mapNonEmpty!37041 ((_ is ValueCellFull!11180) mapValue!37041)) b!991208))

(assert (= (and b!991207 ((_ is ValueCellFull!11180) mapDefault!37041)) b!991209))

(assert (= start!84782 b!991207))

(declare-fun m!918639 () Bool)

(assert (=> mapNonEmpty!37041 m!918639))

(declare-fun m!918641 () Bool)

(assert (=> start!84782 m!918641))

(declare-fun m!918643 () Bool)

(assert (=> start!84782 m!918643))

(declare-fun m!918645 () Bool)

(assert (=> start!84782 m!918645))

(check-sat (not start!84782) (not mapNonEmpty!37041) tp_is_empty!23323)
(check-sat)
(get-model)

(declare-fun d!117741 () Bool)

(assert (=> d!117741 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84782 d!117741))

(declare-fun d!117743 () Bool)

(assert (=> d!117743 (= (array_inv!23275 _values!1551) (bvsge (size!30601 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84782 d!117743))

(declare-fun d!117745 () Bool)

(assert (=> d!117745 (= (array_inv!23276 _keys!1945) (bvsge (size!30602 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84782 d!117745))

(declare-fun b!991240 () Bool)

(declare-fun e!559011 () Bool)

(assert (=> b!991240 (= e!559011 tp_is_empty!23323)))

(declare-fun mapNonEmpty!37050 () Bool)

(declare-fun mapRes!37050 () Bool)

(declare-fun tp!70122 () Bool)

(assert (=> mapNonEmpty!37050 (= mapRes!37050 (and tp!70122 e!559011))))

(declare-fun mapValue!37050 () ValueCell!11180)

(declare-fun mapRest!37050 () (Array (_ BitVec 32) ValueCell!11180))

(declare-fun mapKey!37050 () (_ BitVec 32))

(assert (=> mapNonEmpty!37050 (= mapRest!37041 (store mapRest!37050 mapKey!37050 mapValue!37050))))

(declare-fun b!991241 () Bool)

(declare-fun e!559010 () Bool)

(assert (=> b!991241 (= e!559010 tp_is_empty!23323)))

(declare-fun condMapEmpty!37050 () Bool)

(declare-fun mapDefault!37050 () ValueCell!11180)

(assert (=> mapNonEmpty!37041 (= condMapEmpty!37050 (= mapRest!37041 ((as const (Array (_ BitVec 32) ValueCell!11180)) mapDefault!37050)))))

(assert (=> mapNonEmpty!37041 (= tp!70113 (and e!559010 mapRes!37050))))

(declare-fun mapIsEmpty!37050 () Bool)

(assert (=> mapIsEmpty!37050 mapRes!37050))

(assert (= (and mapNonEmpty!37041 condMapEmpty!37050) mapIsEmpty!37050))

(assert (= (and mapNonEmpty!37041 (not condMapEmpty!37050)) mapNonEmpty!37050))

(assert (= (and mapNonEmpty!37050 ((_ is ValueCellFull!11180) mapValue!37050)) b!991240))

(assert (= (and mapNonEmpty!37041 ((_ is ValueCellFull!11180) mapDefault!37050)) b!991241))

(declare-fun m!918663 () Bool)

(assert (=> mapNonEmpty!37050 m!918663))

(check-sat (not mapNonEmpty!37050) tp_is_empty!23323)
(check-sat)
