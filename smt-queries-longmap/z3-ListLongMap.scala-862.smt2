; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20272 () Bool)

(assert start!20272)

(declare-fun b_free!4927 () Bool)

(declare-fun b_next!4927 () Bool)

(assert (=> start!20272 (= b_free!4927 (not b_next!4927))))

(declare-fun tp!17813 () Bool)

(declare-fun b_and!11647 () Bool)

(assert (=> start!20272 (= tp!17813 b_and!11647)))

(declare-fun b!199307 () Bool)

(declare-fun res!94708 () Bool)

(declare-fun e!130831 () Bool)

(assert (=> b!199307 (=> (not res!94708) (not e!130831))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199307 (= res!94708 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8243 () Bool)

(declare-fun mapRes!8243 () Bool)

(declare-fun tp!17812 () Bool)

(declare-fun e!130833 () Bool)

(assert (=> mapNonEmpty!8243 (= mapRes!8243 (and tp!17812 e!130833))))

(declare-datatypes ((V!6025 0))(
  ( (V!6026 (val!2436 Int)) )
))
(declare-datatypes ((ValueCell!2048 0))(
  ( (ValueCellFull!2048 (v!4400 V!6025)) (EmptyCell!2048) )
))
(declare-fun mapRest!8243 () (Array (_ BitVec 32) ValueCell!2048))

(declare-fun mapKey!8243 () (_ BitVec 32))

(declare-datatypes ((array!8787 0))(
  ( (array!8788 (arr!4143 (Array (_ BitVec 32) ValueCell!2048)) (size!4469 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8787)

(declare-fun mapValue!8243 () ValueCell!2048)

(assert (=> mapNonEmpty!8243 (= (arr!4143 _values!649) (store mapRest!8243 mapKey!8243 mapValue!8243))))

(declare-fun b!199308 () Bool)

(declare-fun res!94707 () Bool)

(assert (=> b!199308 (=> (not res!94707) (not e!130831))))

(declare-datatypes ((array!8789 0))(
  ( (array!8790 (arr!4144 (Array (_ BitVec 32) (_ BitVec 64))) (size!4470 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8789)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199308 (= res!94707 (= (select (arr!4144 _keys!825) i!601) k0!843))))

(declare-fun b!199309 () Bool)

(assert (=> b!199309 (= e!130831 (not true))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6025)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6025)

(declare-fun lt!98146 () array!8787)

(declare-datatypes ((tuple2!3654 0))(
  ( (tuple2!3655 (_1!1838 (_ BitVec 64)) (_2!1838 V!6025)) )
))
(declare-datatypes ((List!2584 0))(
  ( (Nil!2581) (Cons!2580 (h!3222 tuple2!3654) (t!7506 List!2584)) )
))
(declare-datatypes ((ListLongMap!2557 0))(
  ( (ListLongMap!2558 (toList!1294 List!2584)) )
))
(declare-fun lt!98150 () ListLongMap!2557)

(declare-fun getCurrentListMap!864 (array!8789 array!8787 (_ BitVec 32) (_ BitVec 32) V!6025 V!6025 (_ BitVec 32) Int) ListLongMap!2557)

(assert (=> b!199309 (= lt!98150 (getCurrentListMap!864 _keys!825 lt!98146 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98149 () ListLongMap!2557)

(declare-fun lt!98145 () ListLongMap!2557)

(assert (=> b!199309 (and (= lt!98149 lt!98145) (= lt!98145 lt!98149))))

(declare-fun lt!98148 () ListLongMap!2557)

(declare-fun v!520 () V!6025)

(declare-fun +!343 (ListLongMap!2557 tuple2!3654) ListLongMap!2557)

(assert (=> b!199309 (= lt!98145 (+!343 lt!98148 (tuple2!3655 k0!843 v!520)))))

(declare-datatypes ((Unit!5938 0))(
  ( (Unit!5939) )
))
(declare-fun lt!98147 () Unit!5938)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!23 (array!8789 array!8787 (_ BitVec 32) (_ BitVec 32) V!6025 V!6025 (_ BitVec 32) (_ BitVec 64) V!6025 (_ BitVec 32) Int) Unit!5938)

(assert (=> b!199309 (= lt!98147 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!23 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!274 (array!8789 array!8787 (_ BitVec 32) (_ BitVec 32) V!6025 V!6025 (_ BitVec 32) Int) ListLongMap!2557)

(assert (=> b!199309 (= lt!98149 (getCurrentListMapNoExtraKeys!274 _keys!825 lt!98146 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199309 (= lt!98146 (array!8788 (store (arr!4143 _values!649) i!601 (ValueCellFull!2048 v!520)) (size!4469 _values!649)))))

(assert (=> b!199309 (= lt!98148 (getCurrentListMapNoExtraKeys!274 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199310 () Bool)

(declare-fun res!94705 () Bool)

(assert (=> b!199310 (=> (not res!94705) (not e!130831))))

(assert (=> b!199310 (= res!94705 (and (= (size!4469 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4470 _keys!825) (size!4469 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199311 () Bool)

(declare-fun e!130830 () Bool)

(declare-fun tp_is_empty!4783 () Bool)

(assert (=> b!199311 (= e!130830 tp_is_empty!4783)))

(declare-fun b!199312 () Bool)

(declare-fun e!130832 () Bool)

(assert (=> b!199312 (= e!130832 (and e!130830 mapRes!8243))))

(declare-fun condMapEmpty!8243 () Bool)

(declare-fun mapDefault!8243 () ValueCell!2048)

(assert (=> b!199312 (= condMapEmpty!8243 (= (arr!4143 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2048)) mapDefault!8243)))))

(declare-fun b!199313 () Bool)

(declare-fun res!94709 () Bool)

(assert (=> b!199313 (=> (not res!94709) (not e!130831))))

(declare-datatypes ((List!2585 0))(
  ( (Nil!2582) (Cons!2581 (h!3223 (_ BitVec 64)) (t!7507 List!2585)) )
))
(declare-fun arrayNoDuplicates!0 (array!8789 (_ BitVec 32) List!2585) Bool)

(assert (=> b!199313 (= res!94709 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2582))))

(declare-fun b!199315 () Bool)

(declare-fun res!94704 () Bool)

(assert (=> b!199315 (=> (not res!94704) (not e!130831))))

(assert (=> b!199315 (= res!94704 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4470 _keys!825))))))

(declare-fun b!199316 () Bool)

(assert (=> b!199316 (= e!130833 tp_is_empty!4783)))

(declare-fun mapIsEmpty!8243 () Bool)

(assert (=> mapIsEmpty!8243 mapRes!8243))

(declare-fun res!94706 () Bool)

(assert (=> start!20272 (=> (not res!94706) (not e!130831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20272 (= res!94706 (validMask!0 mask!1149))))

(assert (=> start!20272 e!130831))

(declare-fun array_inv!2705 (array!8787) Bool)

(assert (=> start!20272 (and (array_inv!2705 _values!649) e!130832)))

(assert (=> start!20272 true))

(assert (=> start!20272 tp_is_empty!4783))

(declare-fun array_inv!2706 (array!8789) Bool)

(assert (=> start!20272 (array_inv!2706 _keys!825)))

(assert (=> start!20272 tp!17813))

(declare-fun b!199314 () Bool)

(declare-fun res!94703 () Bool)

(assert (=> b!199314 (=> (not res!94703) (not e!130831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8789 (_ BitVec 32)) Bool)

(assert (=> b!199314 (= res!94703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20272 res!94706) b!199310))

(assert (= (and b!199310 res!94705) b!199314))

(assert (= (and b!199314 res!94703) b!199313))

(assert (= (and b!199313 res!94709) b!199315))

(assert (= (and b!199315 res!94704) b!199307))

(assert (= (and b!199307 res!94708) b!199308))

(assert (= (and b!199308 res!94707) b!199309))

(assert (= (and b!199312 condMapEmpty!8243) mapIsEmpty!8243))

(assert (= (and b!199312 (not condMapEmpty!8243)) mapNonEmpty!8243))

(get-info :version)

(assert (= (and mapNonEmpty!8243 ((_ is ValueCellFull!2048) mapValue!8243)) b!199316))

(assert (= (and b!199312 ((_ is ValueCellFull!2048) mapDefault!8243)) b!199311))

(assert (= start!20272 b!199312))

(declare-fun m!225303 () Bool)

(assert (=> b!199313 m!225303))

(declare-fun m!225305 () Bool)

(assert (=> b!199308 m!225305))

(declare-fun m!225307 () Bool)

(assert (=> b!199307 m!225307))

(declare-fun m!225309 () Bool)

(assert (=> start!20272 m!225309))

(declare-fun m!225311 () Bool)

(assert (=> start!20272 m!225311))

(declare-fun m!225313 () Bool)

(assert (=> start!20272 m!225313))

(declare-fun m!225315 () Bool)

(assert (=> b!199314 m!225315))

(declare-fun m!225317 () Bool)

(assert (=> b!199309 m!225317))

(declare-fun m!225319 () Bool)

(assert (=> b!199309 m!225319))

(declare-fun m!225321 () Bool)

(assert (=> b!199309 m!225321))

(declare-fun m!225323 () Bool)

(assert (=> b!199309 m!225323))

(declare-fun m!225325 () Bool)

(assert (=> b!199309 m!225325))

(declare-fun m!225327 () Bool)

(assert (=> b!199309 m!225327))

(declare-fun m!225329 () Bool)

(assert (=> mapNonEmpty!8243 m!225329))

(check-sat (not b!199313) tp_is_empty!4783 (not b_next!4927) b_and!11647 (not b!199309) (not mapNonEmpty!8243) (not start!20272) (not b!199314) (not b!199307))
(check-sat b_and!11647 (not b_next!4927))
