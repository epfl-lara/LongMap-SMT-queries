; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20278 () Bool)

(assert start!20278)

(declare-fun b_free!4933 () Bool)

(declare-fun b_next!4933 () Bool)

(assert (=> start!20278 (= b_free!4933 (not b_next!4933))))

(declare-fun tp!17830 () Bool)

(declare-fun b_and!11653 () Bool)

(assert (=> start!20278 (= tp!17830 b_and!11653)))

(declare-fun res!94769 () Bool)

(declare-fun e!130874 () Bool)

(assert (=> start!20278 (=> (not res!94769) (not e!130874))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20278 (= res!94769 (validMask!0 mask!1149))))

(assert (=> start!20278 e!130874))

(declare-datatypes ((V!6033 0))(
  ( (V!6034 (val!2439 Int)) )
))
(declare-datatypes ((ValueCell!2051 0))(
  ( (ValueCellFull!2051 (v!4403 V!6033)) (EmptyCell!2051) )
))
(declare-datatypes ((array!8799 0))(
  ( (array!8800 (arr!4149 (Array (_ BitVec 32) ValueCell!2051)) (size!4475 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8799)

(declare-fun e!130876 () Bool)

(declare-fun array_inv!2711 (array!8799) Bool)

(assert (=> start!20278 (and (array_inv!2711 _values!649) e!130876)))

(assert (=> start!20278 true))

(declare-fun tp_is_empty!4789 () Bool)

(assert (=> start!20278 tp_is_empty!4789))

(declare-datatypes ((array!8801 0))(
  ( (array!8802 (arr!4150 (Array (_ BitVec 32) (_ BitVec 64))) (size!4476 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8801)

(declare-fun array_inv!2712 (array!8801) Bool)

(assert (=> start!20278 (array_inv!2712 _keys!825)))

(assert (=> start!20278 tp!17830))

(declare-fun b!199397 () Bool)

(declare-fun res!94771 () Bool)

(assert (=> b!199397 (=> (not res!94771) (not e!130874))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199397 (= res!94771 (= (select (arr!4150 _keys!825) i!601) k0!843))))

(declare-fun b!199398 () Bool)

(declare-fun res!94772 () Bool)

(assert (=> b!199398 (=> (not res!94772) (not e!130874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199398 (= res!94772 (validKeyInArray!0 k0!843))))

(declare-fun b!199399 () Bool)

(declare-fun e!130875 () Bool)

(declare-fun mapRes!8252 () Bool)

(assert (=> b!199399 (= e!130876 (and e!130875 mapRes!8252))))

(declare-fun condMapEmpty!8252 () Bool)

(declare-fun mapDefault!8252 () ValueCell!2051)

(assert (=> b!199399 (= condMapEmpty!8252 (= (arr!4149 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2051)) mapDefault!8252)))))

(declare-fun b!199400 () Bool)

(declare-fun res!94768 () Bool)

(assert (=> b!199400 (=> (not res!94768) (not e!130874))))

(assert (=> b!199400 (= res!94768 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4476 _keys!825))))))

(declare-fun b!199401 () Bool)

(declare-fun res!94767 () Bool)

(assert (=> b!199401 (=> (not res!94767) (not e!130874))))

(declare-datatypes ((List!2589 0))(
  ( (Nil!2586) (Cons!2585 (h!3227 (_ BitVec 64)) (t!7511 List!2589)) )
))
(declare-fun arrayNoDuplicates!0 (array!8801 (_ BitVec 32) List!2589) Bool)

(assert (=> b!199401 (= res!94767 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2586))))

(declare-fun b!199402 () Bool)

(declare-fun res!94770 () Bool)

(assert (=> b!199402 (=> (not res!94770) (not e!130874))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!199402 (= res!94770 (and (= (size!4475 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4476 _keys!825) (size!4475 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199403 () Bool)

(declare-fun res!94766 () Bool)

(assert (=> b!199403 (=> (not res!94766) (not e!130874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8801 (_ BitVec 32)) Bool)

(assert (=> b!199403 (= res!94766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199404 () Bool)

(declare-fun e!130878 () Bool)

(assert (=> b!199404 (= e!130878 tp_is_empty!4789)))

(declare-fun b!199405 () Bool)

(assert (=> b!199405 (= e!130874 (not true))))

(declare-datatypes ((tuple2!3660 0))(
  ( (tuple2!3661 (_1!1841 (_ BitVec 64)) (_2!1841 V!6033)) )
))
(declare-datatypes ((List!2590 0))(
  ( (Nil!2587) (Cons!2586 (h!3228 tuple2!3660) (t!7512 List!2590)) )
))
(declare-datatypes ((ListLongMap!2563 0))(
  ( (ListLongMap!2564 (toList!1297 List!2590)) )
))
(declare-fun lt!98199 () ListLongMap!2563)

(declare-fun lt!98203 () array!8799)

(declare-fun zeroValue!615 () V!6033)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6033)

(declare-fun getCurrentListMap!867 (array!8801 array!8799 (_ BitVec 32) (_ BitVec 32) V!6033 V!6033 (_ BitVec 32) Int) ListLongMap!2563)

(assert (=> b!199405 (= lt!98199 (getCurrentListMap!867 _keys!825 lt!98203 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98200 () ListLongMap!2563)

(declare-fun lt!98204 () ListLongMap!2563)

(assert (=> b!199405 (and (= lt!98200 lt!98204) (= lt!98204 lt!98200))))

(declare-fun lt!98201 () ListLongMap!2563)

(declare-fun v!520 () V!6033)

(declare-fun +!346 (ListLongMap!2563 tuple2!3660) ListLongMap!2563)

(assert (=> b!199405 (= lt!98204 (+!346 lt!98201 (tuple2!3661 k0!843 v!520)))))

(declare-datatypes ((Unit!5944 0))(
  ( (Unit!5945) )
))
(declare-fun lt!98202 () Unit!5944)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!26 (array!8801 array!8799 (_ BitVec 32) (_ BitVec 32) V!6033 V!6033 (_ BitVec 32) (_ BitVec 64) V!6033 (_ BitVec 32) Int) Unit!5944)

(assert (=> b!199405 (= lt!98202 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!26 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!277 (array!8801 array!8799 (_ BitVec 32) (_ BitVec 32) V!6033 V!6033 (_ BitVec 32) Int) ListLongMap!2563)

(assert (=> b!199405 (= lt!98200 (getCurrentListMapNoExtraKeys!277 _keys!825 lt!98203 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199405 (= lt!98203 (array!8800 (store (arr!4149 _values!649) i!601 (ValueCellFull!2051 v!520)) (size!4475 _values!649)))))

(assert (=> b!199405 (= lt!98201 (getCurrentListMapNoExtraKeys!277 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199406 () Bool)

(assert (=> b!199406 (= e!130875 tp_is_empty!4789)))

(declare-fun mapNonEmpty!8252 () Bool)

(declare-fun tp!17831 () Bool)

(assert (=> mapNonEmpty!8252 (= mapRes!8252 (and tp!17831 e!130878))))

(declare-fun mapValue!8252 () ValueCell!2051)

(declare-fun mapKey!8252 () (_ BitVec 32))

(declare-fun mapRest!8252 () (Array (_ BitVec 32) ValueCell!2051))

(assert (=> mapNonEmpty!8252 (= (arr!4149 _values!649) (store mapRest!8252 mapKey!8252 mapValue!8252))))

(declare-fun mapIsEmpty!8252 () Bool)

(assert (=> mapIsEmpty!8252 mapRes!8252))

(assert (= (and start!20278 res!94769) b!199402))

(assert (= (and b!199402 res!94770) b!199403))

(assert (= (and b!199403 res!94766) b!199401))

(assert (= (and b!199401 res!94767) b!199400))

(assert (= (and b!199400 res!94768) b!199398))

(assert (= (and b!199398 res!94772) b!199397))

(assert (= (and b!199397 res!94771) b!199405))

(assert (= (and b!199399 condMapEmpty!8252) mapIsEmpty!8252))

(assert (= (and b!199399 (not condMapEmpty!8252)) mapNonEmpty!8252))

(get-info :version)

(assert (= (and mapNonEmpty!8252 ((_ is ValueCellFull!2051) mapValue!8252)) b!199404))

(assert (= (and b!199399 ((_ is ValueCellFull!2051) mapDefault!8252)) b!199406))

(assert (= start!20278 b!199399))

(declare-fun m!225387 () Bool)

(assert (=> b!199398 m!225387))

(declare-fun m!225389 () Bool)

(assert (=> start!20278 m!225389))

(declare-fun m!225391 () Bool)

(assert (=> start!20278 m!225391))

(declare-fun m!225393 () Bool)

(assert (=> start!20278 m!225393))

(declare-fun m!225395 () Bool)

(assert (=> b!199403 m!225395))

(declare-fun m!225397 () Bool)

(assert (=> b!199401 m!225397))

(declare-fun m!225399 () Bool)

(assert (=> b!199405 m!225399))

(declare-fun m!225401 () Bool)

(assert (=> b!199405 m!225401))

(declare-fun m!225403 () Bool)

(assert (=> b!199405 m!225403))

(declare-fun m!225405 () Bool)

(assert (=> b!199405 m!225405))

(declare-fun m!225407 () Bool)

(assert (=> b!199405 m!225407))

(declare-fun m!225409 () Bool)

(assert (=> b!199405 m!225409))

(declare-fun m!225411 () Bool)

(assert (=> mapNonEmpty!8252 m!225411))

(declare-fun m!225413 () Bool)

(assert (=> b!199397 m!225413))

(check-sat (not b!199405) (not start!20278) (not b_next!4933) b_and!11653 (not mapNonEmpty!8252) (not b!199401) (not b!199403) tp_is_empty!4789 (not b!199398))
(check-sat b_and!11653 (not b_next!4933))
