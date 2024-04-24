; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20662 () Bool)

(assert start!20662)

(declare-fun b_free!5317 () Bool)

(declare-fun b_next!5317 () Bool)

(assert (=> start!20662 (= b_free!5317 (not b_next!5317))))

(declare-fun tp!18983 () Bool)

(declare-fun b_and!12077 () Bool)

(assert (=> start!20662 (= tp!18983 b_and!12077)))

(declare-fun b!206399 () Bool)

(declare-fun e!134903 () Bool)

(declare-fun tp_is_empty!5173 () Bool)

(assert (=> b!206399 (= e!134903 tp_is_empty!5173)))

(declare-fun b!206400 () Bool)

(declare-fun res!99964 () Bool)

(declare-fun e!134901 () Bool)

(assert (=> b!206400 (=> (not res!99964) (not e!134901))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6545 0))(
  ( (V!6546 (val!2631 Int)) )
))
(declare-datatypes ((ValueCell!2243 0))(
  ( (ValueCellFull!2243 (v!4602 V!6545)) (EmptyCell!2243) )
))
(declare-datatypes ((array!9551 0))(
  ( (array!9552 (arr!4526 (Array (_ BitVec 32) ValueCell!2243)) (size!4851 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9551)

(declare-datatypes ((array!9553 0))(
  ( (array!9554 (arr!4527 (Array (_ BitVec 32) (_ BitVec 64))) (size!4852 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9553)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!206400 (= res!99964 (and (= (size!4851 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4852 _keys!825) (size!4851 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206401 () Bool)

(declare-fun res!99970 () Bool)

(assert (=> b!206401 (=> (not res!99970) (not e!134901))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206401 (= res!99970 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4852 _keys!825))))))

(declare-fun mapIsEmpty!8828 () Bool)

(declare-fun mapRes!8828 () Bool)

(assert (=> mapIsEmpty!8828 mapRes!8828))

(declare-fun b!206402 () Bool)

(declare-fun e!134906 () Bool)

(assert (=> b!206402 (= e!134906 tp_is_empty!5173)))

(declare-fun b!206403 () Bool)

(declare-fun e!134902 () Bool)

(assert (=> b!206403 (= e!134901 (not e!134902))))

(declare-fun res!99969 () Bool)

(assert (=> b!206403 (=> res!99969 e!134902)))

(assert (=> b!206403 (= res!99969 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3946 0))(
  ( (tuple2!3947 (_1!1984 (_ BitVec 64)) (_2!1984 V!6545)) )
))
(declare-datatypes ((List!2833 0))(
  ( (Nil!2830) (Cons!2829 (h!3471 tuple2!3946) (t!7756 List!2833)) )
))
(declare-datatypes ((ListLongMap!2861 0))(
  ( (ListLongMap!2862 (toList!1446 List!2833)) )
))
(declare-fun lt!105543 () ListLongMap!2861)

(declare-fun zeroValue!615 () V!6545)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6545)

(declare-fun getCurrentListMap!1017 (array!9553 array!9551 (_ BitVec 32) (_ BitVec 32) V!6545 V!6545 (_ BitVec 32) Int) ListLongMap!2861)

(assert (=> b!206403 (= lt!105543 (getCurrentListMap!1017 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105553 () array!9551)

(declare-fun lt!105549 () ListLongMap!2861)

(assert (=> b!206403 (= lt!105549 (getCurrentListMap!1017 _keys!825 lt!105553 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105550 () ListLongMap!2861)

(declare-fun lt!105546 () ListLongMap!2861)

(assert (=> b!206403 (and (= lt!105550 lt!105546) (= lt!105546 lt!105550))))

(declare-fun lt!105548 () ListLongMap!2861)

(declare-fun lt!105554 () tuple2!3946)

(declare-fun +!500 (ListLongMap!2861 tuple2!3946) ListLongMap!2861)

(assert (=> b!206403 (= lt!105546 (+!500 lt!105548 lt!105554))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6545)

(assert (=> b!206403 (= lt!105554 (tuple2!3947 k0!843 v!520))))

(declare-datatypes ((Unit!6276 0))(
  ( (Unit!6277) )
))
(declare-fun lt!105544 () Unit!6276)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!153 (array!9553 array!9551 (_ BitVec 32) (_ BitVec 32) V!6545 V!6545 (_ BitVec 32) (_ BitVec 64) V!6545 (_ BitVec 32) Int) Unit!6276)

(assert (=> b!206403 (= lt!105544 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!153 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!410 (array!9553 array!9551 (_ BitVec 32) (_ BitVec 32) V!6545 V!6545 (_ BitVec 32) Int) ListLongMap!2861)

(assert (=> b!206403 (= lt!105550 (getCurrentListMapNoExtraKeys!410 _keys!825 lt!105553 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206403 (= lt!105553 (array!9552 (store (arr!4526 _values!649) i!601 (ValueCellFull!2243 v!520)) (size!4851 _values!649)))))

(assert (=> b!206403 (= lt!105548 (getCurrentListMapNoExtraKeys!410 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206404 () Bool)

(declare-fun res!99963 () Bool)

(assert (=> b!206404 (=> (not res!99963) (not e!134901))))

(assert (=> b!206404 (= res!99963 (= (select (arr!4527 _keys!825) i!601) k0!843))))

(declare-fun b!206405 () Bool)

(declare-fun e!134900 () Bool)

(assert (=> b!206405 (= e!134902 e!134900)))

(declare-fun res!99965 () Bool)

(assert (=> b!206405 (=> res!99965 e!134900)))

(assert (=> b!206405 (= res!99965 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!105547 () ListLongMap!2861)

(assert (=> b!206405 (= lt!105543 lt!105547)))

(declare-fun lt!105552 () tuple2!3946)

(assert (=> b!206405 (= lt!105547 (+!500 lt!105548 lt!105552))))

(declare-fun lt!105551 () ListLongMap!2861)

(assert (=> b!206405 (= lt!105549 lt!105551)))

(assert (=> b!206405 (= lt!105551 (+!500 lt!105546 lt!105552))))

(assert (=> b!206405 (= lt!105549 (+!500 lt!105550 lt!105552))))

(assert (=> b!206405 (= lt!105552 (tuple2!3947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8828 () Bool)

(declare-fun tp!18982 () Bool)

(assert (=> mapNonEmpty!8828 (= mapRes!8828 (and tp!18982 e!134906))))

(declare-fun mapRest!8828 () (Array (_ BitVec 32) ValueCell!2243))

(declare-fun mapKey!8828 () (_ BitVec 32))

(declare-fun mapValue!8828 () ValueCell!2243)

(assert (=> mapNonEmpty!8828 (= (arr!4526 _values!649) (store mapRest!8828 mapKey!8828 mapValue!8828))))

(declare-fun b!206406 () Bool)

(declare-fun res!99962 () Bool)

(assert (=> b!206406 (=> (not res!99962) (not e!134901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9553 (_ BitVec 32)) Bool)

(assert (=> b!206406 (= res!99962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!99968 () Bool)

(assert (=> start!20662 (=> (not res!99968) (not e!134901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20662 (= res!99968 (validMask!0 mask!1149))))

(assert (=> start!20662 e!134901))

(declare-fun e!134904 () Bool)

(declare-fun array_inv!2965 (array!9551) Bool)

(assert (=> start!20662 (and (array_inv!2965 _values!649) e!134904)))

(assert (=> start!20662 true))

(assert (=> start!20662 tp_is_empty!5173))

(declare-fun array_inv!2966 (array!9553) Bool)

(assert (=> start!20662 (array_inv!2966 _keys!825)))

(assert (=> start!20662 tp!18983))

(declare-fun b!206407 () Bool)

(declare-fun res!99967 () Bool)

(assert (=> b!206407 (=> (not res!99967) (not e!134901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206407 (= res!99967 (validKeyInArray!0 k0!843))))

(declare-fun b!206408 () Bool)

(assert (=> b!206408 (= e!134904 (and e!134903 mapRes!8828))))

(declare-fun condMapEmpty!8828 () Bool)

(declare-fun mapDefault!8828 () ValueCell!2243)

(assert (=> b!206408 (= condMapEmpty!8828 (= (arr!4526 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2243)) mapDefault!8828)))))

(declare-fun b!206409 () Bool)

(assert (=> b!206409 (= e!134900 (bvsle #b00000000000000000000000000000000 (size!4852 _keys!825)))))

(assert (=> b!206409 (= lt!105551 (+!500 lt!105547 lt!105554))))

(declare-fun lt!105545 () Unit!6276)

(declare-fun addCommutativeForDiffKeys!198 (ListLongMap!2861 (_ BitVec 64) V!6545 (_ BitVec 64) V!6545) Unit!6276)

(assert (=> b!206409 (= lt!105545 (addCommutativeForDiffKeys!198 lt!105548 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206410 () Bool)

(declare-fun res!99966 () Bool)

(assert (=> b!206410 (=> (not res!99966) (not e!134901))))

(declare-datatypes ((List!2834 0))(
  ( (Nil!2831) (Cons!2830 (h!3472 (_ BitVec 64)) (t!7757 List!2834)) )
))
(declare-fun arrayNoDuplicates!0 (array!9553 (_ BitVec 32) List!2834) Bool)

(assert (=> b!206410 (= res!99966 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2831))))

(assert (= (and start!20662 res!99968) b!206400))

(assert (= (and b!206400 res!99964) b!206406))

(assert (= (and b!206406 res!99962) b!206410))

(assert (= (and b!206410 res!99966) b!206401))

(assert (= (and b!206401 res!99970) b!206407))

(assert (= (and b!206407 res!99967) b!206404))

(assert (= (and b!206404 res!99963) b!206403))

(assert (= (and b!206403 (not res!99969)) b!206405))

(assert (= (and b!206405 (not res!99965)) b!206409))

(assert (= (and b!206408 condMapEmpty!8828) mapIsEmpty!8828))

(assert (= (and b!206408 (not condMapEmpty!8828)) mapNonEmpty!8828))

(get-info :version)

(assert (= (and mapNonEmpty!8828 ((_ is ValueCellFull!2243) mapValue!8828)) b!206402))

(assert (= (and b!206408 ((_ is ValueCellFull!2243) mapDefault!8828)) b!206399))

(assert (= start!20662 b!206408))

(declare-fun m!234261 () Bool)

(assert (=> b!206404 m!234261))

(declare-fun m!234263 () Bool)

(assert (=> b!206405 m!234263))

(declare-fun m!234265 () Bool)

(assert (=> b!206405 m!234265))

(declare-fun m!234267 () Bool)

(assert (=> b!206405 m!234267))

(declare-fun m!234269 () Bool)

(assert (=> b!206409 m!234269))

(declare-fun m!234271 () Bool)

(assert (=> b!206409 m!234271))

(declare-fun m!234273 () Bool)

(assert (=> b!206403 m!234273))

(declare-fun m!234275 () Bool)

(assert (=> b!206403 m!234275))

(declare-fun m!234277 () Bool)

(assert (=> b!206403 m!234277))

(declare-fun m!234279 () Bool)

(assert (=> b!206403 m!234279))

(declare-fun m!234281 () Bool)

(assert (=> b!206403 m!234281))

(declare-fun m!234283 () Bool)

(assert (=> b!206403 m!234283))

(declare-fun m!234285 () Bool)

(assert (=> b!206403 m!234285))

(declare-fun m!234287 () Bool)

(assert (=> start!20662 m!234287))

(declare-fun m!234289 () Bool)

(assert (=> start!20662 m!234289))

(declare-fun m!234291 () Bool)

(assert (=> start!20662 m!234291))

(declare-fun m!234293 () Bool)

(assert (=> b!206407 m!234293))

(declare-fun m!234295 () Bool)

(assert (=> b!206410 m!234295))

(declare-fun m!234297 () Bool)

(assert (=> mapNonEmpty!8828 m!234297))

(declare-fun m!234299 () Bool)

(assert (=> b!206406 m!234299))

(check-sat (not b!206407) (not b!206406) b_and!12077 (not b!206410) (not b_next!5317) (not start!20662) (not b!206409) tp_is_empty!5173 (not mapNonEmpty!8828) (not b!206403) (not b!206405))
(check-sat b_and!12077 (not b_next!5317))
