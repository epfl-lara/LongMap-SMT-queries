; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20246 () Bool)

(assert start!20246)

(declare-fun b_free!4905 () Bool)

(declare-fun b_next!4905 () Bool)

(assert (=> start!20246 (= b_free!4905 (not b_next!4905))))

(declare-fun tp!17747 () Bool)

(declare-fun b_and!11651 () Bool)

(assert (=> start!20246 (= tp!17747 b_and!11651)))

(declare-fun b!199124 () Bool)

(declare-fun e!130765 () Bool)

(assert (=> b!199124 (= e!130765 (not true))))

(declare-datatypes ((V!5995 0))(
  ( (V!5996 (val!2425 Int)) )
))
(declare-datatypes ((tuple2!3672 0))(
  ( (tuple2!3673 (_1!1847 (_ BitVec 64)) (_2!1847 V!5995)) )
))
(declare-datatypes ((List!2588 0))(
  ( (Nil!2585) (Cons!2584 (h!3226 tuple2!3672) (t!7519 List!2588)) )
))
(declare-datatypes ((ListLongMap!2585 0))(
  ( (ListLongMap!2586 (toList!1308 List!2588)) )
))
(declare-fun lt!98174 () ListLongMap!2585)

(declare-fun lt!98175 () ListLongMap!2585)

(assert (=> b!199124 (and (= lt!98174 lt!98175) (= lt!98175 lt!98174))))

(declare-fun lt!98173 () ListLongMap!2585)

(declare-fun v!520 () V!5995)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!335 (ListLongMap!2585 tuple2!3672) ListLongMap!2585)

(assert (=> b!199124 (= lt!98175 (+!335 lt!98173 (tuple2!3673 k0!843 v!520)))))

(declare-datatypes ((Unit!5972 0))(
  ( (Unit!5973) )
))
(declare-fun lt!98172 () Unit!5972)

(declare-datatypes ((ValueCell!2037 0))(
  ( (ValueCellFull!2037 (v!4395 V!5995)) (EmptyCell!2037) )
))
(declare-datatypes ((array!8763 0))(
  ( (array!8764 (arr!4132 (Array (_ BitVec 32) ValueCell!2037)) (size!4457 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8763)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5995)

(declare-datatypes ((array!8765 0))(
  ( (array!8766 (arr!4133 (Array (_ BitVec 32) (_ BitVec 64))) (size!4458 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8765)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5995)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!12 (array!8765 array!8763 (_ BitVec 32) (_ BitVec 32) V!5995 V!5995 (_ BitVec 32) (_ BitVec 64) V!5995 (_ BitVec 32) Int) Unit!5972)

(assert (=> b!199124 (= lt!98172 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!12 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!273 (array!8765 array!8763 (_ BitVec 32) (_ BitVec 32) V!5995 V!5995 (_ BitVec 32) Int) ListLongMap!2585)

(assert (=> b!199124 (= lt!98174 (getCurrentListMapNoExtraKeys!273 _keys!825 (array!8764 (store (arr!4132 _values!649) i!601 (ValueCellFull!2037 v!520)) (size!4457 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199124 (= lt!98173 (getCurrentListMapNoExtraKeys!273 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199125 () Bool)

(declare-fun res!94567 () Bool)

(assert (=> b!199125 (=> (not res!94567) (not e!130765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199125 (= res!94567 (validKeyInArray!0 k0!843))))

(declare-fun b!199126 () Bool)

(declare-fun res!94570 () Bool)

(assert (=> b!199126 (=> (not res!94570) (not e!130765))))

(assert (=> b!199126 (= res!94570 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4458 _keys!825))))))

(declare-fun b!199127 () Bool)

(declare-fun res!94569 () Bool)

(assert (=> b!199127 (=> (not res!94569) (not e!130765))))

(declare-datatypes ((List!2589 0))(
  ( (Nil!2586) (Cons!2585 (h!3227 (_ BitVec 64)) (t!7520 List!2589)) )
))
(declare-fun arrayNoDuplicates!0 (array!8765 (_ BitVec 32) List!2589) Bool)

(assert (=> b!199127 (= res!94569 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2586))))

(declare-fun b!199128 () Bool)

(declare-fun e!130769 () Bool)

(declare-fun tp_is_empty!4761 () Bool)

(assert (=> b!199128 (= e!130769 tp_is_empty!4761)))

(declare-fun b!199129 () Bool)

(declare-fun res!94573 () Bool)

(assert (=> b!199129 (=> (not res!94573) (not e!130765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8765 (_ BitVec 32)) Bool)

(assert (=> b!199129 (= res!94573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199130 () Bool)

(declare-fun e!130766 () Bool)

(assert (=> b!199130 (= e!130766 tp_is_empty!4761)))

(declare-fun res!94568 () Bool)

(assert (=> start!20246 (=> (not res!94568) (not e!130765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20246 (= res!94568 (validMask!0 mask!1149))))

(assert (=> start!20246 e!130765))

(declare-fun e!130768 () Bool)

(declare-fun array_inv!2709 (array!8763) Bool)

(assert (=> start!20246 (and (array_inv!2709 _values!649) e!130768)))

(assert (=> start!20246 true))

(assert (=> start!20246 tp_is_empty!4761))

(declare-fun array_inv!2710 (array!8765) Bool)

(assert (=> start!20246 (array_inv!2710 _keys!825)))

(assert (=> start!20246 tp!17747))

(declare-fun b!199131 () Bool)

(declare-fun res!94571 () Bool)

(assert (=> b!199131 (=> (not res!94571) (not e!130765))))

(assert (=> b!199131 (= res!94571 (= (select (arr!4133 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8210 () Bool)

(declare-fun mapRes!8210 () Bool)

(declare-fun tp!17746 () Bool)

(assert (=> mapNonEmpty!8210 (= mapRes!8210 (and tp!17746 e!130766))))

(declare-fun mapKey!8210 () (_ BitVec 32))

(declare-fun mapValue!8210 () ValueCell!2037)

(declare-fun mapRest!8210 () (Array (_ BitVec 32) ValueCell!2037))

(assert (=> mapNonEmpty!8210 (= (arr!4132 _values!649) (store mapRest!8210 mapKey!8210 mapValue!8210))))

(declare-fun mapIsEmpty!8210 () Bool)

(assert (=> mapIsEmpty!8210 mapRes!8210))

(declare-fun b!199132 () Bool)

(declare-fun res!94572 () Bool)

(assert (=> b!199132 (=> (not res!94572) (not e!130765))))

(assert (=> b!199132 (= res!94572 (and (= (size!4457 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4458 _keys!825) (size!4457 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199133 () Bool)

(assert (=> b!199133 (= e!130768 (and e!130769 mapRes!8210))))

(declare-fun condMapEmpty!8210 () Bool)

(declare-fun mapDefault!8210 () ValueCell!2037)

(assert (=> b!199133 (= condMapEmpty!8210 (= (arr!4132 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2037)) mapDefault!8210)))))

(assert (= (and start!20246 res!94568) b!199132))

(assert (= (and b!199132 res!94572) b!199129))

(assert (= (and b!199129 res!94573) b!199127))

(assert (= (and b!199127 res!94569) b!199126))

(assert (= (and b!199126 res!94570) b!199125))

(assert (= (and b!199125 res!94567) b!199131))

(assert (= (and b!199131 res!94571) b!199124))

(assert (= (and b!199133 condMapEmpty!8210) mapIsEmpty!8210))

(assert (= (and b!199133 (not condMapEmpty!8210)) mapNonEmpty!8210))

(get-info :version)

(assert (= (and mapNonEmpty!8210 ((_ is ValueCellFull!2037) mapValue!8210)) b!199130))

(assert (= (and b!199133 ((_ is ValueCellFull!2037) mapDefault!8210)) b!199128))

(assert (= start!20246 b!199133))

(declare-fun m!225627 () Bool)

(assert (=> b!199131 m!225627))

(declare-fun m!225629 () Bool)

(assert (=> b!199129 m!225629))

(declare-fun m!225631 () Bool)

(assert (=> mapNonEmpty!8210 m!225631))

(declare-fun m!225633 () Bool)

(assert (=> start!20246 m!225633))

(declare-fun m!225635 () Bool)

(assert (=> start!20246 m!225635))

(declare-fun m!225637 () Bool)

(assert (=> start!20246 m!225637))

(declare-fun m!225639 () Bool)

(assert (=> b!199127 m!225639))

(declare-fun m!225641 () Bool)

(assert (=> b!199125 m!225641))

(declare-fun m!225643 () Bool)

(assert (=> b!199124 m!225643))

(declare-fun m!225645 () Bool)

(assert (=> b!199124 m!225645))

(declare-fun m!225647 () Bool)

(assert (=> b!199124 m!225647))

(declare-fun m!225649 () Bool)

(assert (=> b!199124 m!225649))

(declare-fun m!225651 () Bool)

(assert (=> b!199124 m!225651))

(check-sat (not start!20246) tp_is_empty!4761 (not b!199124) (not b!199125) (not b!199129) (not mapNonEmpty!8210) (not b!199127) b_and!11651 (not b_next!4905))
(check-sat b_and!11651 (not b_next!4905))
