; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72676 () Bool)

(assert start!72676)

(declare-fun res!573230 () Bool)

(declare-fun e!470675 () Bool)

(assert (=> start!72676 (=> (not res!573230) (not e!470675))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47729 0))(
  ( (array!47730 (arr!22896 (Array (_ BitVec 32) (_ BitVec 64))) (size!23338 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47729)

(assert (=> start!72676 (= res!573230 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23338 _keys!868))))))

(assert (=> start!72676 e!470675))

(assert (=> start!72676 true))

(declare-fun array_inv!18286 (array!47729) Bool)

(assert (=> start!72676 (array_inv!18286 _keys!868)))

(declare-datatypes ((V!26041 0))(
  ( (V!26042 (val!7920 Int)) )
))
(declare-datatypes ((ValueCell!7433 0))(
  ( (ValueCellFull!7433 (v!10339 V!26041)) (EmptyCell!7433) )
))
(declare-datatypes ((array!47731 0))(
  ( (array!47732 (arr!22897 (Array (_ BitVec 32) ValueCell!7433)) (size!23339 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47731)

(declare-fun e!470676 () Bool)

(declare-fun array_inv!18287 (array!47731) Bool)

(assert (=> start!72676 (and (array_inv!18287 _values!688) e!470676)))

(declare-fun b!843513 () Bool)

(declare-fun res!573231 () Bool)

(assert (=> b!843513 (=> (not res!573231) (not e!470675))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47729 (_ BitVec 32)) Bool)

(assert (=> b!843513 (= res!573231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843514 () Bool)

(declare-fun e!470678 () Bool)

(declare-fun tp_is_empty!15745 () Bool)

(assert (=> b!843514 (= e!470678 tp_is_empty!15745)))

(declare-fun mapNonEmpty!25217 () Bool)

(declare-fun mapRes!25217 () Bool)

(declare-fun tp!48536 () Bool)

(assert (=> mapNonEmpty!25217 (= mapRes!25217 (and tp!48536 e!470678))))

(declare-fun mapKey!25217 () (_ BitVec 32))

(declare-fun mapValue!25217 () ValueCell!7433)

(declare-fun mapRest!25217 () (Array (_ BitVec 32) ValueCell!7433))

(assert (=> mapNonEmpty!25217 (= (arr!22897 _values!688) (store mapRest!25217 mapKey!25217 mapValue!25217))))

(declare-fun b!843515 () Bool)

(declare-fun e!470677 () Bool)

(assert (=> b!843515 (= e!470677 tp_is_empty!15745)))

(declare-fun mapIsEmpty!25217 () Bool)

(assert (=> mapIsEmpty!25217 mapRes!25217))

(declare-fun b!843516 () Bool)

(declare-fun res!573229 () Bool)

(assert (=> b!843516 (=> (not res!573229) (not e!470675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843516 (= res!573229 (validMask!0 mask!1196))))

(declare-fun b!843517 () Bool)

(assert (=> b!843517 (= e!470675 false)))

(declare-fun lt!380948 () Bool)

(declare-datatypes ((List!16268 0))(
  ( (Nil!16265) (Cons!16264 (h!17395 (_ BitVec 64)) (t!22630 List!16268)) )
))
(declare-fun arrayNoDuplicates!0 (array!47729 (_ BitVec 32) List!16268) Bool)

(assert (=> b!843517 (= lt!380948 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16265))))

(declare-fun b!843518 () Bool)

(declare-fun res!573228 () Bool)

(assert (=> b!843518 (=> (not res!573228) (not e!470675))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843518 (= res!573228 (and (= (size!23339 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23338 _keys!868) (size!23339 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843519 () Bool)

(assert (=> b!843519 (= e!470676 (and e!470677 mapRes!25217))))

(declare-fun condMapEmpty!25217 () Bool)

(declare-fun mapDefault!25217 () ValueCell!7433)

(assert (=> b!843519 (= condMapEmpty!25217 (= (arr!22897 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7433)) mapDefault!25217)))))

(assert (= (and start!72676 res!573230) b!843516))

(assert (= (and b!843516 res!573229) b!843518))

(assert (= (and b!843518 res!573228) b!843513))

(assert (= (and b!843513 res!573231) b!843517))

(assert (= (and b!843519 condMapEmpty!25217) mapIsEmpty!25217))

(assert (= (and b!843519 (not condMapEmpty!25217)) mapNonEmpty!25217))

(get-info :version)

(assert (= (and mapNonEmpty!25217 ((_ is ValueCellFull!7433) mapValue!25217)) b!843514))

(assert (= (and b!843519 ((_ is ValueCellFull!7433) mapDefault!25217)) b!843515))

(assert (= start!72676 b!843519))

(declare-fun m!785543 () Bool)

(assert (=> mapNonEmpty!25217 m!785543))

(declare-fun m!785545 () Bool)

(assert (=> start!72676 m!785545))

(declare-fun m!785547 () Bool)

(assert (=> start!72676 m!785547))

(declare-fun m!785549 () Bool)

(assert (=> b!843513 m!785549))

(declare-fun m!785551 () Bool)

(assert (=> b!843516 m!785551))

(declare-fun m!785553 () Bool)

(assert (=> b!843517 m!785553))

(check-sat (not b!843517) (not b!843513) (not b!843516) tp_is_empty!15745 (not mapNonEmpty!25217) (not start!72676))
(check-sat)
