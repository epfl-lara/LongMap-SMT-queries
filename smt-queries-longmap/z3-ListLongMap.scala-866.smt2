; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20296 () Bool)

(assert start!20296)

(declare-fun b_free!4951 () Bool)

(declare-fun b_next!4951 () Bool)

(assert (=> start!20296 (= b_free!4951 (not b_next!4951))))

(declare-fun tp!17885 () Bool)

(declare-fun b_and!11671 () Bool)

(assert (=> start!20296 (= tp!17885 b_and!11671)))

(declare-fun b!199667 () Bool)

(declare-fun e!131009 () Bool)

(assert (=> b!199667 (= e!131009 (not true))))

(declare-datatypes ((V!6057 0))(
  ( (V!6058 (val!2448 Int)) )
))
(declare-datatypes ((ValueCell!2060 0))(
  ( (ValueCellFull!2060 (v!4412 V!6057)) (EmptyCell!2060) )
))
(declare-datatypes ((array!8835 0))(
  ( (array!8836 (arr!4167 (Array (_ BitVec 32) ValueCell!2060)) (size!4493 (_ BitVec 32))) )
))
(declare-fun lt!98361 () array!8835)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6057)

(declare-datatypes ((tuple2!3670 0))(
  ( (tuple2!3671 (_1!1846 (_ BitVec 64)) (_2!1846 V!6057)) )
))
(declare-datatypes ((List!2599 0))(
  ( (Nil!2596) (Cons!2595 (h!3237 tuple2!3670) (t!7521 List!2599)) )
))
(declare-datatypes ((ListLongMap!2573 0))(
  ( (ListLongMap!2574 (toList!1302 List!2599)) )
))
(declare-fun lt!98364 () ListLongMap!2573)

(declare-datatypes ((array!8837 0))(
  ( (array!8838 (arr!4168 (Array (_ BitVec 32) (_ BitVec 64))) (size!4494 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8837)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6057)

(declare-fun getCurrentListMap!872 (array!8837 array!8835 (_ BitVec 32) (_ BitVec 32) V!6057 V!6057 (_ BitVec 32) Int) ListLongMap!2573)

(assert (=> b!199667 (= lt!98364 (getCurrentListMap!872 _keys!825 lt!98361 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98366 () ListLongMap!2573)

(declare-fun lt!98363 () ListLongMap!2573)

(assert (=> b!199667 (and (= lt!98366 lt!98363) (= lt!98363 lt!98366))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!98365 () ListLongMap!2573)

(declare-fun v!520 () V!6057)

(declare-fun +!351 (ListLongMap!2573 tuple2!3670) ListLongMap!2573)

(assert (=> b!199667 (= lt!98363 (+!351 lt!98365 (tuple2!3671 k0!843 v!520)))))

(declare-fun _values!649 () array!8835)

(declare-datatypes ((Unit!5954 0))(
  ( (Unit!5955) )
))
(declare-fun lt!98362 () Unit!5954)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!31 (array!8837 array!8835 (_ BitVec 32) (_ BitVec 32) V!6057 V!6057 (_ BitVec 32) (_ BitVec 64) V!6057 (_ BitVec 32) Int) Unit!5954)

(assert (=> b!199667 (= lt!98362 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!31 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!282 (array!8837 array!8835 (_ BitVec 32) (_ BitVec 32) V!6057 V!6057 (_ BitVec 32) Int) ListLongMap!2573)

(assert (=> b!199667 (= lt!98366 (getCurrentListMapNoExtraKeys!282 _keys!825 lt!98361 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199667 (= lt!98361 (array!8836 (store (arr!4167 _values!649) i!601 (ValueCellFull!2060 v!520)) (size!4493 _values!649)))))

(assert (=> b!199667 (= lt!98365 (getCurrentListMapNoExtraKeys!282 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199668 () Bool)

(declare-fun res!94955 () Bool)

(assert (=> b!199668 (=> (not res!94955) (not e!131009))))

(assert (=> b!199668 (= res!94955 (= (select (arr!4168 _keys!825) i!601) k0!843))))

(declare-fun b!199669 () Bool)

(declare-fun e!131010 () Bool)

(declare-fun e!131013 () Bool)

(declare-fun mapRes!8279 () Bool)

(assert (=> b!199669 (= e!131010 (and e!131013 mapRes!8279))))

(declare-fun condMapEmpty!8279 () Bool)

(declare-fun mapDefault!8279 () ValueCell!2060)

(assert (=> b!199669 (= condMapEmpty!8279 (= (arr!4167 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2060)) mapDefault!8279)))))

(declare-fun b!199671 () Bool)

(declare-fun res!94956 () Bool)

(assert (=> b!199671 (=> (not res!94956) (not e!131009))))

(declare-datatypes ((List!2600 0))(
  ( (Nil!2597) (Cons!2596 (h!3238 (_ BitVec 64)) (t!7522 List!2600)) )
))
(declare-fun arrayNoDuplicates!0 (array!8837 (_ BitVec 32) List!2600) Bool)

(assert (=> b!199671 (= res!94956 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2597))))

(declare-fun mapNonEmpty!8279 () Bool)

(declare-fun tp!17884 () Bool)

(declare-fun e!131011 () Bool)

(assert (=> mapNonEmpty!8279 (= mapRes!8279 (and tp!17884 e!131011))))

(declare-fun mapValue!8279 () ValueCell!2060)

(declare-fun mapRest!8279 () (Array (_ BitVec 32) ValueCell!2060))

(declare-fun mapKey!8279 () (_ BitVec 32))

(assert (=> mapNonEmpty!8279 (= (arr!4167 _values!649) (store mapRest!8279 mapKey!8279 mapValue!8279))))

(declare-fun b!199672 () Bool)

(declare-fun res!94957 () Bool)

(assert (=> b!199672 (=> (not res!94957) (not e!131009))))

(assert (=> b!199672 (= res!94957 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4494 _keys!825))))))

(declare-fun b!199673 () Bool)

(declare-fun tp_is_empty!4807 () Bool)

(assert (=> b!199673 (= e!131013 tp_is_empty!4807)))

(declare-fun b!199674 () Bool)

(declare-fun res!94961 () Bool)

(assert (=> b!199674 (=> (not res!94961) (not e!131009))))

(assert (=> b!199674 (= res!94961 (and (= (size!4493 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4494 _keys!825) (size!4493 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8279 () Bool)

(assert (=> mapIsEmpty!8279 mapRes!8279))

(declare-fun b!199670 () Bool)

(declare-fun res!94959 () Bool)

(assert (=> b!199670 (=> (not res!94959) (not e!131009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8837 (_ BitVec 32)) Bool)

(assert (=> b!199670 (= res!94959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!94960 () Bool)

(assert (=> start!20296 (=> (not res!94960) (not e!131009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20296 (= res!94960 (validMask!0 mask!1149))))

(assert (=> start!20296 e!131009))

(declare-fun array_inv!2719 (array!8835) Bool)

(assert (=> start!20296 (and (array_inv!2719 _values!649) e!131010)))

(assert (=> start!20296 true))

(assert (=> start!20296 tp_is_empty!4807))

(declare-fun array_inv!2720 (array!8837) Bool)

(assert (=> start!20296 (array_inv!2720 _keys!825)))

(assert (=> start!20296 tp!17885))

(declare-fun b!199675 () Bool)

(assert (=> b!199675 (= e!131011 tp_is_empty!4807)))

(declare-fun b!199676 () Bool)

(declare-fun res!94958 () Bool)

(assert (=> b!199676 (=> (not res!94958) (not e!131009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199676 (= res!94958 (validKeyInArray!0 k0!843))))

(assert (= (and start!20296 res!94960) b!199674))

(assert (= (and b!199674 res!94961) b!199670))

(assert (= (and b!199670 res!94959) b!199671))

(assert (= (and b!199671 res!94956) b!199672))

(assert (= (and b!199672 res!94957) b!199676))

(assert (= (and b!199676 res!94958) b!199668))

(assert (= (and b!199668 res!94955) b!199667))

(assert (= (and b!199669 condMapEmpty!8279) mapIsEmpty!8279))

(assert (= (and b!199669 (not condMapEmpty!8279)) mapNonEmpty!8279))

(get-info :version)

(assert (= (and mapNonEmpty!8279 ((_ is ValueCellFull!2060) mapValue!8279)) b!199675))

(assert (= (and b!199669 ((_ is ValueCellFull!2060) mapDefault!8279)) b!199673))

(assert (= start!20296 b!199669))

(declare-fun m!225639 () Bool)

(assert (=> b!199667 m!225639))

(declare-fun m!225641 () Bool)

(assert (=> b!199667 m!225641))

(declare-fun m!225643 () Bool)

(assert (=> b!199667 m!225643))

(declare-fun m!225645 () Bool)

(assert (=> b!199667 m!225645))

(declare-fun m!225647 () Bool)

(assert (=> b!199667 m!225647))

(declare-fun m!225649 () Bool)

(assert (=> b!199667 m!225649))

(declare-fun m!225651 () Bool)

(assert (=> start!20296 m!225651))

(declare-fun m!225653 () Bool)

(assert (=> start!20296 m!225653))

(declare-fun m!225655 () Bool)

(assert (=> start!20296 m!225655))

(declare-fun m!225657 () Bool)

(assert (=> b!199670 m!225657))

(declare-fun m!225659 () Bool)

(assert (=> b!199676 m!225659))

(declare-fun m!225661 () Bool)

(assert (=> b!199668 m!225661))

(declare-fun m!225663 () Bool)

(assert (=> mapNonEmpty!8279 m!225663))

(declare-fun m!225665 () Bool)

(assert (=> b!199671 m!225665))

(check-sat (not start!20296) b_and!11671 (not b!199676) tp_is_empty!4807 (not b!199671) (not b_next!4951) (not mapNonEmpty!8279) (not b!199670) (not b!199667))
(check-sat b_and!11671 (not b_next!4951))
