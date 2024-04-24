; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84968 () Bool)

(assert start!84968)

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun b!992348 () Bool)

(declare-datatypes ((V!36081 0))(
  ( (V!36082 (val!11712 Int)) )
))
(declare-datatypes ((ValueCell!11180 0))(
  ( (ValueCellFull!11180 (v!14285 V!36081)) (EmptyCell!11180) )
))
(declare-datatypes ((array!62656 0))(
  ( (array!62657 (arr!30173 (Array (_ BitVec 32) ValueCell!11180)) (size!30653 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62656)

(declare-fun e!559702 () Bool)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62658 0))(
  ( (array!62659 (arr!30174 (Array (_ BitVec 32) (_ BitVec 64))) (size!30654 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62658)

(assert (=> b!992348 (= e!559702 (and (= (size!30653 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30654 _keys!1945) (size!30653 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011) (= (size!30654 _keys!1945) (bvadd #b00000000000000000000000000000001 mask!2471)) (bvsgt #b00000000000000000000000000000000 (size!30654 _keys!1945))))))

(declare-fun mapNonEmpty!37041 () Bool)

(declare-fun mapRes!37041 () Bool)

(declare-fun tp!70113 () Bool)

(declare-fun e!559704 () Bool)

(assert (=> mapNonEmpty!37041 (= mapRes!37041 (and tp!70113 e!559704))))

(declare-fun mapValue!37041 () ValueCell!11180)

(declare-fun mapRest!37041 () (Array (_ BitVec 32) ValueCell!11180))

(declare-fun mapKey!37041 () (_ BitVec 32))

(assert (=> mapNonEmpty!37041 (= (arr!30173 _values!1551) (store mapRest!37041 mapKey!37041 mapValue!37041))))

(declare-fun res!663099 () Bool)

(assert (=> start!84968 (=> (not res!663099) (not e!559702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84968 (= res!663099 (validMask!0 mask!2471))))

(assert (=> start!84968 e!559702))

(assert (=> start!84968 true))

(declare-fun e!559701 () Bool)

(declare-fun array_inv!23327 (array!62656) Bool)

(assert (=> start!84968 (and (array_inv!23327 _values!1551) e!559701)))

(declare-fun array_inv!23328 (array!62658) Bool)

(assert (=> start!84968 (array_inv!23328 _keys!1945)))

(declare-fun b!992349 () Bool)

(declare-fun e!559705 () Bool)

(declare-fun tp_is_empty!23323 () Bool)

(assert (=> b!992349 (= e!559705 tp_is_empty!23323)))

(declare-fun mapIsEmpty!37041 () Bool)

(assert (=> mapIsEmpty!37041 mapRes!37041))

(declare-fun b!992350 () Bool)

(assert (=> b!992350 (= e!559704 tp_is_empty!23323)))

(declare-fun b!992351 () Bool)

(assert (=> b!992351 (= e!559701 (and e!559705 mapRes!37041))))

(declare-fun condMapEmpty!37041 () Bool)

(declare-fun mapDefault!37041 () ValueCell!11180)

(assert (=> b!992351 (= condMapEmpty!37041 (= (arr!30173 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11180)) mapDefault!37041)))))

(assert (= (and start!84968 res!663099) b!992348))

(assert (= (and b!992351 condMapEmpty!37041) mapIsEmpty!37041))

(assert (= (and b!992351 (not condMapEmpty!37041)) mapNonEmpty!37041))

(get-info :version)

(assert (= (and mapNonEmpty!37041 ((_ is ValueCellFull!11180) mapValue!37041)) b!992350))

(assert (= (and b!992351 ((_ is ValueCellFull!11180) mapDefault!37041)) b!992349))

(assert (= start!84968 b!992351))

(declare-fun m!920691 () Bool)

(assert (=> mapNonEmpty!37041 m!920691))

(declare-fun m!920693 () Bool)

(assert (=> start!84968 m!920693))

(declare-fun m!920695 () Bool)

(assert (=> start!84968 m!920695))

(declare-fun m!920697 () Bool)

(assert (=> start!84968 m!920697))

(check-sat (not start!84968) (not mapNonEmpty!37041) tp_is_empty!23323)
(check-sat)
(get-model)

(declare-fun d!118261 () Bool)

(assert (=> d!118261 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84968 d!118261))

(declare-fun d!118263 () Bool)

(assert (=> d!118263 (= (array_inv!23327 _values!1551) (bvsge (size!30653 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84968 d!118263))

(declare-fun d!118265 () Bool)

(assert (=> d!118265 (= (array_inv!23328 _keys!1945) (bvsge (size!30654 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84968 d!118265))

(declare-fun b!992382 () Bool)

(declare-fun e!559741 () Bool)

(assert (=> b!992382 (= e!559741 tp_is_empty!23323)))

(declare-fun mapIsEmpty!37050 () Bool)

(declare-fun mapRes!37050 () Bool)

(assert (=> mapIsEmpty!37050 mapRes!37050))

(declare-fun b!992383 () Bool)

(declare-fun e!559740 () Bool)

(assert (=> b!992383 (= e!559740 tp_is_empty!23323)))

(declare-fun condMapEmpty!37050 () Bool)

(declare-fun mapDefault!37050 () ValueCell!11180)

(assert (=> mapNonEmpty!37041 (= condMapEmpty!37050 (= mapRest!37041 ((as const (Array (_ BitVec 32) ValueCell!11180)) mapDefault!37050)))))

(assert (=> mapNonEmpty!37041 (= tp!70113 (and e!559740 mapRes!37050))))

(declare-fun mapNonEmpty!37050 () Bool)

(declare-fun tp!70122 () Bool)

(assert (=> mapNonEmpty!37050 (= mapRes!37050 (and tp!70122 e!559741))))

(declare-fun mapKey!37050 () (_ BitVec 32))

(declare-fun mapRest!37050 () (Array (_ BitVec 32) ValueCell!11180))

(declare-fun mapValue!37050 () ValueCell!11180)

(assert (=> mapNonEmpty!37050 (= mapRest!37041 (store mapRest!37050 mapKey!37050 mapValue!37050))))

(assert (= (and mapNonEmpty!37041 condMapEmpty!37050) mapIsEmpty!37050))

(assert (= (and mapNonEmpty!37041 (not condMapEmpty!37050)) mapNonEmpty!37050))

(assert (= (and mapNonEmpty!37050 ((_ is ValueCellFull!11180) mapValue!37050)) b!992382))

(assert (= (and mapNonEmpty!37041 ((_ is ValueCellFull!11180) mapDefault!37050)) b!992383))

(declare-fun m!920715 () Bool)

(assert (=> mapNonEmpty!37050 m!920715))

(check-sat (not mapNonEmpty!37050) tp_is_empty!23323)
(check-sat)
