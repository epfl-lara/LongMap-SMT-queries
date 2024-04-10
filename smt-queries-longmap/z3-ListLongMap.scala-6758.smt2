; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84802 () Bool)

(assert start!84802)

(declare-fun mapIsEmpty!37044 () Bool)

(declare-fun mapRes!37044 () Bool)

(assert (=> mapIsEmpty!37044 mapRes!37044))

(declare-fun res!662758 () Bool)

(declare-fun e!559137 () Bool)

(assert (=> start!84802 (=> (not res!662758) (not e!559137))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84802 (= res!662758 (validMask!0 mask!2471))))

(assert (=> start!84802 e!559137))

(assert (=> start!84802 true))

(declare-datatypes ((V!36083 0))(
  ( (V!36084 (val!11713 Int)) )
))
(declare-datatypes ((ValueCell!11181 0))(
  ( (ValueCellFull!11181 (v!14289 V!36083)) (EmptyCell!11181) )
))
(declare-datatypes ((array!62611 0))(
  ( (array!62612 (arr!30155 (Array (_ BitVec 32) ValueCell!11181)) (size!30634 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62611)

(declare-fun e!559135 () Bool)

(declare-fun array_inv!23287 (array!62611) Bool)

(assert (=> start!84802 (and (array_inv!23287 _values!1551) e!559135)))

(declare-datatypes ((array!62613 0))(
  ( (array!62614 (arr!30156 (Array (_ BitVec 32) (_ BitVec 64))) (size!30635 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62613)

(declare-fun array_inv!23288 (array!62613) Bool)

(assert (=> start!84802 (array_inv!23288 _keys!1945)))

(declare-fun b!991457 () Bool)

(declare-fun e!559134 () Bool)

(declare-fun tp_is_empty!23325 () Bool)

(assert (=> b!991457 (= e!559134 tp_is_empty!23325)))

(declare-fun b!991458 () Bool)

(declare-fun e!559136 () Bool)

(assert (=> b!991458 (= e!559136 tp_is_empty!23325)))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun b!991459 () Bool)

(assert (=> b!991459 (= e!559137 (and (= (size!30634 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30635 _keys!1945) (size!30634 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011) (= (size!30635 _keys!1945) (bvadd #b00000000000000000000000000000001 mask!2471)) (bvsgt #b00000000000000000000000000000000 (size!30635 _keys!1945))))))

(declare-fun b!991460 () Bool)

(assert (=> b!991460 (= e!559135 (and e!559134 mapRes!37044))))

(declare-fun condMapEmpty!37044 () Bool)

(declare-fun mapDefault!37044 () ValueCell!11181)

(assert (=> b!991460 (= condMapEmpty!37044 (= (arr!30155 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11181)) mapDefault!37044)))))

(declare-fun mapNonEmpty!37044 () Bool)

(declare-fun tp!70115 () Bool)

(assert (=> mapNonEmpty!37044 (= mapRes!37044 (and tp!70115 e!559136))))

(declare-fun mapValue!37044 () ValueCell!11181)

(declare-fun mapRest!37044 () (Array (_ BitVec 32) ValueCell!11181))

(declare-fun mapKey!37044 () (_ BitVec 32))

(assert (=> mapNonEmpty!37044 (= (arr!30155 _values!1551) (store mapRest!37044 mapKey!37044 mapValue!37044))))

(assert (= (and start!84802 res!662758) b!991459))

(assert (= (and b!991460 condMapEmpty!37044) mapIsEmpty!37044))

(assert (= (and b!991460 (not condMapEmpty!37044)) mapNonEmpty!37044))

(get-info :version)

(assert (= (and mapNonEmpty!37044 ((_ is ValueCellFull!11181) mapValue!37044)) b!991458))

(assert (= (and b!991460 ((_ is ValueCellFull!11181) mapDefault!37044)) b!991457))

(assert (= start!84802 b!991460))

(declare-fun m!919405 () Bool)

(assert (=> start!84802 m!919405))

(declare-fun m!919407 () Bool)

(assert (=> start!84802 m!919407))

(declare-fun m!919409 () Bool)

(assert (=> start!84802 m!919409))

(declare-fun m!919411 () Bool)

(assert (=> mapNonEmpty!37044 m!919411))

(check-sat (not start!84802) (not mapNonEmpty!37044) tp_is_empty!23325)
(check-sat)
(get-model)

(declare-fun d!117939 () Bool)

(assert (=> d!117939 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84802 d!117939))

(declare-fun d!117941 () Bool)

(assert (=> d!117941 (= (array_inv!23287 _values!1551) (bvsge (size!30634 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84802 d!117941))

(declare-fun d!117943 () Bool)

(assert (=> d!117943 (= (array_inv!23288 _keys!1945) (bvsge (size!30635 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84802 d!117943))

(declare-fun mapNonEmpty!37050 () Bool)

(declare-fun mapRes!37050 () Bool)

(declare-fun tp!70121 () Bool)

(declare-fun e!559159 () Bool)

(assert (=> mapNonEmpty!37050 (= mapRes!37050 (and tp!70121 e!559159))))

(declare-fun mapRest!37050 () (Array (_ BitVec 32) ValueCell!11181))

(declare-fun mapKey!37050 () (_ BitVec 32))

(declare-fun mapValue!37050 () ValueCell!11181)

(assert (=> mapNonEmpty!37050 (= mapRest!37044 (store mapRest!37050 mapKey!37050 mapValue!37050))))

(declare-fun b!991480 () Bool)

(declare-fun e!559158 () Bool)

(assert (=> b!991480 (= e!559158 tp_is_empty!23325)))

(declare-fun mapIsEmpty!37050 () Bool)

(assert (=> mapIsEmpty!37050 mapRes!37050))

(declare-fun b!991479 () Bool)

(assert (=> b!991479 (= e!559159 tp_is_empty!23325)))

(declare-fun condMapEmpty!37050 () Bool)

(declare-fun mapDefault!37050 () ValueCell!11181)

(assert (=> mapNonEmpty!37044 (= condMapEmpty!37050 (= mapRest!37044 ((as const (Array (_ BitVec 32) ValueCell!11181)) mapDefault!37050)))))

(assert (=> mapNonEmpty!37044 (= tp!70115 (and e!559158 mapRes!37050))))

(assert (= (and mapNonEmpty!37044 condMapEmpty!37050) mapIsEmpty!37050))

(assert (= (and mapNonEmpty!37044 (not condMapEmpty!37050)) mapNonEmpty!37050))

(assert (= (and mapNonEmpty!37050 ((_ is ValueCellFull!11181) mapValue!37050)) b!991479))

(assert (= (and mapNonEmpty!37044 ((_ is ValueCellFull!11181) mapDefault!37050)) b!991480))

(declare-fun m!919421 () Bool)

(assert (=> mapNonEmpty!37050 m!919421))

(check-sat (not mapNonEmpty!37050) tp_is_empty!23325)
(check-sat)
