; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20656 () Bool)

(assert start!20656)

(declare-fun b_free!5311 () Bool)

(declare-fun b_next!5311 () Bool)

(assert (=> start!20656 (= b_free!5311 (not b_next!5311))))

(declare-fun tp!18965 () Bool)

(declare-fun b_and!12031 () Bool)

(assert (=> start!20656 (= tp!18965 b_and!12031)))

(declare-fun mapIsEmpty!8819 () Bool)

(declare-fun mapRes!8819 () Bool)

(assert (=> mapIsEmpty!8819 mapRes!8819))

(declare-fun b!206097 () Bool)

(declare-fun res!99768 () Bool)

(declare-fun e!134717 () Bool)

(assert (=> b!206097 (=> (not res!99768) (not e!134717))))

(declare-datatypes ((array!9531 0))(
  ( (array!9532 (arr!4515 (Array (_ BitVec 32) (_ BitVec 64))) (size!4841 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9531)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9531 (_ BitVec 32)) Bool)

(assert (=> b!206097 (= res!99768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206098 () Bool)

(declare-fun e!134713 () Bool)

(declare-fun e!134718 () Bool)

(assert (=> b!206098 (= e!134713 (and e!134718 mapRes!8819))))

(declare-fun condMapEmpty!8819 () Bool)

(declare-datatypes ((V!6537 0))(
  ( (V!6538 (val!2628 Int)) )
))
(declare-datatypes ((ValueCell!2240 0))(
  ( (ValueCellFull!2240 (v!4592 V!6537)) (EmptyCell!2240) )
))
(declare-datatypes ((array!9533 0))(
  ( (array!9534 (arr!4516 (Array (_ BitVec 32) ValueCell!2240)) (size!4842 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9533)

(declare-fun mapDefault!8819 () ValueCell!2240)

(assert (=> b!206098 (= condMapEmpty!8819 (= (arr!4516 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2240)) mapDefault!8819)))))

(declare-fun b!206099 () Bool)

(declare-fun e!134712 () Bool)

(declare-fun tp_is_empty!5167 () Bool)

(assert (=> b!206099 (= e!134712 tp_is_empty!5167)))

(declare-fun res!99766 () Bool)

(assert (=> start!20656 (=> (not res!99766) (not e!134717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20656 (= res!99766 (validMask!0 mask!1149))))

(assert (=> start!20656 e!134717))

(declare-fun array_inv!2965 (array!9533) Bool)

(assert (=> start!20656 (and (array_inv!2965 _values!649) e!134713)))

(assert (=> start!20656 true))

(assert (=> start!20656 tp_is_empty!5167))

(declare-fun array_inv!2966 (array!9531) Bool)

(assert (=> start!20656 (array_inv!2966 _keys!825)))

(assert (=> start!20656 tp!18965))

(declare-fun mapNonEmpty!8819 () Bool)

(declare-fun tp!18964 () Bool)

(assert (=> mapNonEmpty!8819 (= mapRes!8819 (and tp!18964 e!134712))))

(declare-fun mapValue!8819 () ValueCell!2240)

(declare-fun mapRest!8819 () (Array (_ BitVec 32) ValueCell!2240))

(declare-fun mapKey!8819 () (_ BitVec 32))

(assert (=> mapNonEmpty!8819 (= (arr!4516 _values!649) (store mapRest!8819 mapKey!8819 mapValue!8819))))

(declare-fun b!206100 () Bool)

(declare-fun res!99773 () Bool)

(assert (=> b!206100 (=> (not res!99773) (not e!134717))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206100 (= res!99773 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4841 _keys!825))))))

(declare-fun b!206101 () Bool)

(assert (=> b!206101 (= e!134718 tp_is_empty!5167)))

(declare-fun b!206102 () Bool)

(declare-fun e!134714 () Bool)

(declare-fun e!134715 () Bool)

(assert (=> b!206102 (= e!134714 e!134715)))

(declare-fun res!99770 () Bool)

(assert (=> b!206102 (=> res!99770 e!134715)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!206102 (= res!99770 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3974 0))(
  ( (tuple2!3975 (_1!1998 (_ BitVec 64)) (_2!1998 V!6537)) )
))
(declare-datatypes ((List!2875 0))(
  ( (Nil!2872) (Cons!2871 (h!3513 tuple2!3974) (t!7797 List!2875)) )
))
(declare-datatypes ((ListLongMap!2877 0))(
  ( (ListLongMap!2878 (toList!1454 List!2875)) )
))
(declare-fun lt!105204 () ListLongMap!2877)

(declare-fun lt!105198 () ListLongMap!2877)

(assert (=> b!206102 (= lt!105204 lt!105198)))

(declare-fun lt!105199 () ListLongMap!2877)

(declare-fun lt!105206 () tuple2!3974)

(declare-fun +!503 (ListLongMap!2877 tuple2!3974) ListLongMap!2877)

(assert (=> b!206102 (= lt!105198 (+!503 lt!105199 lt!105206))))

(declare-fun lt!105195 () ListLongMap!2877)

(declare-fun lt!105196 () ListLongMap!2877)

(assert (=> b!206102 (= lt!105195 lt!105196)))

(declare-fun lt!105197 () ListLongMap!2877)

(assert (=> b!206102 (= lt!105196 (+!503 lt!105197 lt!105206))))

(declare-fun lt!105202 () ListLongMap!2877)

(assert (=> b!206102 (= lt!105195 (+!503 lt!105202 lt!105206))))

(declare-fun minValue!615 () V!6537)

(assert (=> b!206102 (= lt!105206 (tuple2!3975 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206103 () Bool)

(declare-fun res!99767 () Bool)

(assert (=> b!206103 (=> (not res!99767) (not e!134717))))

(declare-datatypes ((List!2876 0))(
  ( (Nil!2873) (Cons!2872 (h!3514 (_ BitVec 64)) (t!7798 List!2876)) )
))
(declare-fun arrayNoDuplicates!0 (array!9531 (_ BitVec 32) List!2876) Bool)

(assert (=> b!206103 (= res!99767 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2873))))

(declare-fun b!206104 () Bool)

(declare-fun res!99769 () Bool)

(assert (=> b!206104 (=> (not res!99769) (not e!134717))))

(assert (=> b!206104 (= res!99769 (= (select (arr!4515 _keys!825) i!601) k0!843))))

(declare-fun b!206105 () Bool)

(assert (=> b!206105 (= e!134715 true)))

(declare-fun lt!105203 () tuple2!3974)

(assert (=> b!206105 (= lt!105196 (+!503 lt!105198 lt!105203))))

(declare-datatypes ((Unit!6246 0))(
  ( (Unit!6247) )
))
(declare-fun lt!105205 () Unit!6246)

(declare-fun v!520 () V!6537)

(declare-fun addCommutativeForDiffKeys!187 (ListLongMap!2877 (_ BitVec 64) V!6537 (_ BitVec 64) V!6537) Unit!6246)

(assert (=> b!206105 (= lt!105205 (addCommutativeForDiffKeys!187 lt!105199 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206106 () Bool)

(declare-fun res!99765 () Bool)

(assert (=> b!206106 (=> (not res!99765) (not e!134717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206106 (= res!99765 (validKeyInArray!0 k0!843))))

(declare-fun b!206107 () Bool)

(assert (=> b!206107 (= e!134717 (not e!134714))))

(declare-fun res!99771 () Bool)

(assert (=> b!206107 (=> res!99771 e!134714)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206107 (= res!99771 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6537)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!995 (array!9531 array!9533 (_ BitVec 32) (_ BitVec 32) V!6537 V!6537 (_ BitVec 32) Int) ListLongMap!2877)

(assert (=> b!206107 (= lt!105204 (getCurrentListMap!995 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105201 () array!9533)

(assert (=> b!206107 (= lt!105195 (getCurrentListMap!995 _keys!825 lt!105201 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206107 (and (= lt!105202 lt!105197) (= lt!105197 lt!105202))))

(assert (=> b!206107 (= lt!105197 (+!503 lt!105199 lt!105203))))

(assert (=> b!206107 (= lt!105203 (tuple2!3975 k0!843 v!520))))

(declare-fun lt!105200 () Unit!6246)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!154 (array!9531 array!9533 (_ BitVec 32) (_ BitVec 32) V!6537 V!6537 (_ BitVec 32) (_ BitVec 64) V!6537 (_ BitVec 32) Int) Unit!6246)

(assert (=> b!206107 (= lt!105200 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!154 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!405 (array!9531 array!9533 (_ BitVec 32) (_ BitVec 32) V!6537 V!6537 (_ BitVec 32) Int) ListLongMap!2877)

(assert (=> b!206107 (= lt!105202 (getCurrentListMapNoExtraKeys!405 _keys!825 lt!105201 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206107 (= lt!105201 (array!9534 (store (arr!4516 _values!649) i!601 (ValueCellFull!2240 v!520)) (size!4842 _values!649)))))

(assert (=> b!206107 (= lt!105199 (getCurrentListMapNoExtraKeys!405 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206108 () Bool)

(declare-fun res!99772 () Bool)

(assert (=> b!206108 (=> (not res!99772) (not e!134717))))

(assert (=> b!206108 (= res!99772 (and (= (size!4842 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4841 _keys!825) (size!4842 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20656 res!99766) b!206108))

(assert (= (and b!206108 res!99772) b!206097))

(assert (= (and b!206097 res!99768) b!206103))

(assert (= (and b!206103 res!99767) b!206100))

(assert (= (and b!206100 res!99773) b!206106))

(assert (= (and b!206106 res!99765) b!206104))

(assert (= (and b!206104 res!99769) b!206107))

(assert (= (and b!206107 (not res!99771)) b!206102))

(assert (= (and b!206102 (not res!99770)) b!206105))

(assert (= (and b!206098 condMapEmpty!8819) mapIsEmpty!8819))

(assert (= (and b!206098 (not condMapEmpty!8819)) mapNonEmpty!8819))

(get-info :version)

(assert (= (and mapNonEmpty!8819 ((_ is ValueCellFull!2240) mapValue!8819)) b!206099))

(assert (= (and b!206098 ((_ is ValueCellFull!2240) mapDefault!8819)) b!206101))

(assert (= start!20656 b!206098))

(declare-fun m!233343 () Bool)

(assert (=> b!206102 m!233343))

(declare-fun m!233345 () Bool)

(assert (=> b!206102 m!233345))

(declare-fun m!233347 () Bool)

(assert (=> b!206102 m!233347))

(declare-fun m!233349 () Bool)

(assert (=> b!206107 m!233349))

(declare-fun m!233351 () Bool)

(assert (=> b!206107 m!233351))

(declare-fun m!233353 () Bool)

(assert (=> b!206107 m!233353))

(declare-fun m!233355 () Bool)

(assert (=> b!206107 m!233355))

(declare-fun m!233357 () Bool)

(assert (=> b!206107 m!233357))

(declare-fun m!233359 () Bool)

(assert (=> b!206107 m!233359))

(declare-fun m!233361 () Bool)

(assert (=> b!206107 m!233361))

(declare-fun m!233363 () Bool)

(assert (=> mapNonEmpty!8819 m!233363))

(declare-fun m!233365 () Bool)

(assert (=> b!206097 m!233365))

(declare-fun m!233367 () Bool)

(assert (=> b!206104 m!233367))

(declare-fun m!233369 () Bool)

(assert (=> b!206105 m!233369))

(declare-fun m!233371 () Bool)

(assert (=> b!206105 m!233371))

(declare-fun m!233373 () Bool)

(assert (=> b!206106 m!233373))

(declare-fun m!233375 () Bool)

(assert (=> b!206103 m!233375))

(declare-fun m!233377 () Bool)

(assert (=> start!20656 m!233377))

(declare-fun m!233379 () Bool)

(assert (=> start!20656 m!233379))

(declare-fun m!233381 () Bool)

(assert (=> start!20656 m!233381))

(check-sat (not b_next!5311) (not b!206107) (not b!206102) (not start!20656) tp_is_empty!5167 (not b!206106) (not b!206097) b_and!12031 (not mapNonEmpty!8819) (not b!206103) (not b!206105))
(check-sat b_and!12031 (not b_next!5311))
