; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20234 () Bool)

(assert start!20234)

(declare-fun b_free!4893 () Bool)

(declare-fun b_next!4893 () Bool)

(assert (=> start!20234 (= b_free!4893 (not b_next!4893))))

(declare-fun tp!17710 () Bool)

(declare-fun b_and!11639 () Bool)

(assert (=> start!20234 (= tp!17710 b_and!11639)))

(declare-fun b!198944 () Bool)

(declare-fun res!94444 () Bool)

(declare-fun e!130675 () Bool)

(assert (=> b!198944 (=> (not res!94444) (not e!130675))))

(declare-datatypes ((array!8739 0))(
  ( (array!8740 (arr!4120 (Array (_ BitVec 32) (_ BitVec 64))) (size!4445 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8739)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198944 (= res!94444 (= (select (arr!4120 _keys!825) i!601) k0!843))))

(declare-fun b!198945 () Bool)

(declare-fun res!94442 () Bool)

(assert (=> b!198945 (=> (not res!94442) (not e!130675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198945 (= res!94442 (validKeyInArray!0 k0!843))))

(declare-fun b!198946 () Bool)

(assert (=> b!198946 (= e!130675 (not true))))

(declare-datatypes ((V!5979 0))(
  ( (V!5980 (val!2419 Int)) )
))
(declare-datatypes ((tuple2!3666 0))(
  ( (tuple2!3667 (_1!1844 (_ BitVec 64)) (_2!1844 V!5979)) )
))
(declare-datatypes ((List!2581 0))(
  ( (Nil!2578) (Cons!2577 (h!3219 tuple2!3666) (t!7512 List!2581)) )
))
(declare-datatypes ((ListLongMap!2579 0))(
  ( (ListLongMap!2580 (toList!1305 List!2581)) )
))
(declare-fun lt!98101 () ListLongMap!2579)

(declare-fun lt!98102 () ListLongMap!2579)

(assert (=> b!198946 (and (= lt!98101 lt!98102) (= lt!98102 lt!98101))))

(declare-fun lt!98103 () ListLongMap!2579)

(declare-fun v!520 () V!5979)

(declare-fun +!332 (ListLongMap!2579 tuple2!3666) ListLongMap!2579)

(assert (=> b!198946 (= lt!98102 (+!332 lt!98103 (tuple2!3667 k0!843 v!520)))))

(declare-datatypes ((ValueCell!2031 0))(
  ( (ValueCellFull!2031 (v!4389 V!5979)) (EmptyCell!2031) )
))
(declare-datatypes ((array!8741 0))(
  ( (array!8742 (arr!4121 (Array (_ BitVec 32) ValueCell!2031)) (size!4446 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8741)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5979)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5979)

(declare-datatypes ((Unit!5966 0))(
  ( (Unit!5967) )
))
(declare-fun lt!98100 () Unit!5966)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!9 (array!8739 array!8741 (_ BitVec 32) (_ BitVec 32) V!5979 V!5979 (_ BitVec 32) (_ BitVec 64) V!5979 (_ BitVec 32) Int) Unit!5966)

(assert (=> b!198946 (= lt!98100 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!9 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!270 (array!8739 array!8741 (_ BitVec 32) (_ BitVec 32) V!5979 V!5979 (_ BitVec 32) Int) ListLongMap!2579)

(assert (=> b!198946 (= lt!98101 (getCurrentListMapNoExtraKeys!270 _keys!825 (array!8742 (store (arr!4121 _values!649) i!601 (ValueCellFull!2031 v!520)) (size!4446 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198946 (= lt!98103 (getCurrentListMapNoExtraKeys!270 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198947 () Bool)

(declare-fun e!130679 () Bool)

(declare-fun tp_is_empty!4749 () Bool)

(assert (=> b!198947 (= e!130679 tp_is_empty!4749)))

(declare-fun b!198948 () Bool)

(declare-fun res!94441 () Bool)

(assert (=> b!198948 (=> (not res!94441) (not e!130675))))

(assert (=> b!198948 (= res!94441 (and (= (size!4446 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4445 _keys!825) (size!4446 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!94447 () Bool)

(assert (=> start!20234 (=> (not res!94447) (not e!130675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20234 (= res!94447 (validMask!0 mask!1149))))

(assert (=> start!20234 e!130675))

(declare-fun e!130677 () Bool)

(declare-fun array_inv!2697 (array!8741) Bool)

(assert (=> start!20234 (and (array_inv!2697 _values!649) e!130677)))

(assert (=> start!20234 true))

(assert (=> start!20234 tp_is_empty!4749))

(declare-fun array_inv!2698 (array!8739) Bool)

(assert (=> start!20234 (array_inv!2698 _keys!825)))

(assert (=> start!20234 tp!17710))

(declare-fun b!198949 () Bool)

(declare-fun e!130676 () Bool)

(assert (=> b!198949 (= e!130676 tp_is_empty!4749)))

(declare-fun b!198950 () Bool)

(declare-fun res!94443 () Bool)

(assert (=> b!198950 (=> (not res!94443) (not e!130675))))

(declare-datatypes ((List!2582 0))(
  ( (Nil!2579) (Cons!2578 (h!3220 (_ BitVec 64)) (t!7513 List!2582)) )
))
(declare-fun arrayNoDuplicates!0 (array!8739 (_ BitVec 32) List!2582) Bool)

(assert (=> b!198950 (= res!94443 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2579))))

(declare-fun b!198951 () Bool)

(declare-fun mapRes!8192 () Bool)

(assert (=> b!198951 (= e!130677 (and e!130676 mapRes!8192))))

(declare-fun condMapEmpty!8192 () Bool)

(declare-fun mapDefault!8192 () ValueCell!2031)

(assert (=> b!198951 (= condMapEmpty!8192 (= (arr!4121 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2031)) mapDefault!8192)))))

(declare-fun b!198952 () Bool)

(declare-fun res!94446 () Bool)

(assert (=> b!198952 (=> (not res!94446) (not e!130675))))

(assert (=> b!198952 (= res!94446 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4445 _keys!825))))))

(declare-fun b!198953 () Bool)

(declare-fun res!94445 () Bool)

(assert (=> b!198953 (=> (not res!94445) (not e!130675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8739 (_ BitVec 32)) Bool)

(assert (=> b!198953 (= res!94445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8192 () Bool)

(declare-fun tp!17711 () Bool)

(assert (=> mapNonEmpty!8192 (= mapRes!8192 (and tp!17711 e!130679))))

(declare-fun mapValue!8192 () ValueCell!2031)

(declare-fun mapRest!8192 () (Array (_ BitVec 32) ValueCell!2031))

(declare-fun mapKey!8192 () (_ BitVec 32))

(assert (=> mapNonEmpty!8192 (= (arr!4121 _values!649) (store mapRest!8192 mapKey!8192 mapValue!8192))))

(declare-fun mapIsEmpty!8192 () Bool)

(assert (=> mapIsEmpty!8192 mapRes!8192))

(assert (= (and start!20234 res!94447) b!198948))

(assert (= (and b!198948 res!94441) b!198953))

(assert (= (and b!198953 res!94445) b!198950))

(assert (= (and b!198950 res!94443) b!198952))

(assert (= (and b!198952 res!94446) b!198945))

(assert (= (and b!198945 res!94442) b!198944))

(assert (= (and b!198944 res!94444) b!198946))

(assert (= (and b!198951 condMapEmpty!8192) mapIsEmpty!8192))

(assert (= (and b!198951 (not condMapEmpty!8192)) mapNonEmpty!8192))

(get-info :version)

(assert (= (and mapNonEmpty!8192 ((_ is ValueCellFull!2031) mapValue!8192)) b!198947))

(assert (= (and b!198951 ((_ is ValueCellFull!2031) mapDefault!8192)) b!198949))

(assert (= start!20234 b!198951))

(declare-fun m!225471 () Bool)

(assert (=> b!198953 m!225471))

(declare-fun m!225473 () Bool)

(assert (=> b!198944 m!225473))

(declare-fun m!225475 () Bool)

(assert (=> b!198950 m!225475))

(declare-fun m!225477 () Bool)

(assert (=> start!20234 m!225477))

(declare-fun m!225479 () Bool)

(assert (=> start!20234 m!225479))

(declare-fun m!225481 () Bool)

(assert (=> start!20234 m!225481))

(declare-fun m!225483 () Bool)

(assert (=> mapNonEmpty!8192 m!225483))

(declare-fun m!225485 () Bool)

(assert (=> b!198945 m!225485))

(declare-fun m!225487 () Bool)

(assert (=> b!198946 m!225487))

(declare-fun m!225489 () Bool)

(assert (=> b!198946 m!225489))

(declare-fun m!225491 () Bool)

(assert (=> b!198946 m!225491))

(declare-fun m!225493 () Bool)

(assert (=> b!198946 m!225493))

(declare-fun m!225495 () Bool)

(assert (=> b!198946 m!225495))

(check-sat (not b!198950) (not b_next!4893) (not b!198953) (not start!20234) b_and!11639 (not b!198946) tp_is_empty!4749 (not mapNonEmpty!8192) (not b!198945))
(check-sat b_and!11639 (not b_next!4893))
