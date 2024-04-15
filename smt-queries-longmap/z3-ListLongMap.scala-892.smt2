; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20452 () Bool)

(assert start!20452)

(declare-fun b_free!5107 () Bool)

(declare-fun b_next!5107 () Bool)

(assert (=> start!20452 (= b_free!5107 (not b_next!5107))))

(declare-fun tp!18353 () Bool)

(declare-fun b_and!11827 () Bool)

(assert (=> start!20452 (= tp!18353 b_and!11827)))

(declare-fun res!97003 () Bool)

(declare-fun e!132575 () Bool)

(assert (=> start!20452 (=> (not res!97003) (not e!132575))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20452 (= res!97003 (validMask!0 mask!1149))))

(assert (=> start!20452 e!132575))

(declare-datatypes ((V!6265 0))(
  ( (V!6266 (val!2526 Int)) )
))
(declare-datatypes ((ValueCell!2138 0))(
  ( (ValueCellFull!2138 (v!4490 V!6265)) (EmptyCell!2138) )
))
(declare-datatypes ((array!9137 0))(
  ( (array!9138 (arr!4318 (Array (_ BitVec 32) ValueCell!2138)) (size!4644 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9137)

(declare-fun e!132572 () Bool)

(declare-fun array_inv!2833 (array!9137) Bool)

(assert (=> start!20452 (and (array_inv!2833 _values!649) e!132572)))

(assert (=> start!20452 true))

(declare-fun tp_is_empty!4963 () Bool)

(assert (=> start!20452 tp_is_empty!4963))

(declare-datatypes ((array!9139 0))(
  ( (array!9140 (arr!4319 (Array (_ BitVec 32) (_ BitVec 64))) (size!4645 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9139)

(declare-fun array_inv!2834 (array!9139) Bool)

(assert (=> start!20452 (array_inv!2834 _keys!825)))

(assert (=> start!20452 tp!18353))

(declare-fun b!202416 () Bool)

(declare-fun res!97008 () Bool)

(assert (=> b!202416 (=> (not res!97008) (not e!132575))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202416 (= res!97008 (and (= (size!4644 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4645 _keys!825) (size!4644 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202417 () Bool)

(declare-fun e!132573 () Bool)

(declare-fun mapRes!8513 () Bool)

(assert (=> b!202417 (= e!132572 (and e!132573 mapRes!8513))))

(declare-fun condMapEmpty!8513 () Bool)

(declare-fun mapDefault!8513 () ValueCell!2138)

(assert (=> b!202417 (= condMapEmpty!8513 (= (arr!4318 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2138)) mapDefault!8513)))))

(declare-fun b!202418 () Bool)

(assert (=> b!202418 (= e!132573 tp_is_empty!4963)))

(declare-fun b!202419 () Bool)

(declare-fun e!132570 () Bool)

(assert (=> b!202419 (= e!132570 tp_is_empty!4963)))

(declare-fun b!202420 () Bool)

(declare-fun res!97007 () Bool)

(assert (=> b!202420 (=> (not res!97007) (not e!132575))))

(declare-datatypes ((List!2717 0))(
  ( (Nil!2714) (Cons!2713 (h!3355 (_ BitVec 64)) (t!7639 List!2717)) )
))
(declare-fun arrayNoDuplicates!0 (array!9139 (_ BitVec 32) List!2717) Bool)

(assert (=> b!202420 (= res!97007 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2714))))

(declare-fun b!202421 () Bool)

(declare-fun res!97004 () Bool)

(assert (=> b!202421 (=> (not res!97004) (not e!132575))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202421 (= res!97004 (= (select (arr!4319 _keys!825) i!601) k0!843))))

(declare-fun b!202422 () Bool)

(declare-fun res!97005 () Bool)

(assert (=> b!202422 (=> (not res!97005) (not e!132575))))

(assert (=> b!202422 (= res!97005 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4645 _keys!825))))))

(declare-fun b!202423 () Bool)

(declare-fun e!132571 () Bool)

(declare-fun e!132574 () Bool)

(assert (=> b!202423 (= e!132571 e!132574)))

(declare-fun res!97006 () Bool)

(assert (=> b!202423 (=> res!97006 e!132574)))

(assert (=> b!202423 (= res!97006 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3804 0))(
  ( (tuple2!3805 (_1!1913 (_ BitVec 64)) (_2!1913 V!6265)) )
))
(declare-datatypes ((List!2718 0))(
  ( (Nil!2715) (Cons!2714 (h!3356 tuple2!3804) (t!7640 List!2718)) )
))
(declare-datatypes ((ListLongMap!2707 0))(
  ( (ListLongMap!2708 (toList!1369 List!2718)) )
))
(declare-fun lt!101562 () ListLongMap!2707)

(declare-fun lt!101561 () ListLongMap!2707)

(assert (=> b!202423 (= lt!101562 lt!101561)))

(declare-fun lt!101569 () ListLongMap!2707)

(declare-fun lt!101567 () tuple2!3804)

(declare-fun +!418 (ListLongMap!2707 tuple2!3804) ListLongMap!2707)

(assert (=> b!202423 (= lt!101561 (+!418 lt!101569 lt!101567))))

(declare-fun lt!101560 () ListLongMap!2707)

(declare-fun lt!101566 () ListLongMap!2707)

(assert (=> b!202423 (= lt!101560 lt!101566)))

(declare-fun lt!101563 () ListLongMap!2707)

(assert (=> b!202423 (= lt!101566 (+!418 lt!101563 lt!101567))))

(declare-fun lt!101559 () ListLongMap!2707)

(assert (=> b!202423 (= lt!101562 (+!418 lt!101559 lt!101567))))

(declare-fun zeroValue!615 () V!6265)

(assert (=> b!202423 (= lt!101567 (tuple2!3805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202424 () Bool)

(declare-fun res!97002 () Bool)

(assert (=> b!202424 (=> (not res!97002) (not e!132575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202424 (= res!97002 (validKeyInArray!0 k0!843))))

(declare-fun b!202425 () Bool)

(declare-fun res!97010 () Bool)

(assert (=> b!202425 (=> (not res!97010) (not e!132575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9139 (_ BitVec 32)) Bool)

(assert (=> b!202425 (= res!97010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8513 () Bool)

(declare-fun tp!18352 () Bool)

(assert (=> mapNonEmpty!8513 (= mapRes!8513 (and tp!18352 e!132570))))

(declare-fun mapKey!8513 () (_ BitVec 32))

(declare-fun mapRest!8513 () (Array (_ BitVec 32) ValueCell!2138))

(declare-fun mapValue!8513 () ValueCell!2138)

(assert (=> mapNonEmpty!8513 (= (arr!4318 _values!649) (store mapRest!8513 mapKey!8513 mapValue!8513))))

(declare-fun b!202426 () Bool)

(assert (=> b!202426 (= e!132574 true)))

(declare-fun lt!101568 () tuple2!3804)

(assert (=> b!202426 (= lt!101561 (+!418 lt!101566 lt!101568))))

(declare-datatypes ((Unit!6088 0))(
  ( (Unit!6089) )
))
(declare-fun lt!101565 () Unit!6088)

(declare-fun v!520 () V!6265)

(declare-fun addCommutativeForDiffKeys!124 (ListLongMap!2707 (_ BitVec 64) V!6265 (_ BitVec 64) V!6265) Unit!6088)

(assert (=> b!202426 (= lt!101565 (addCommutativeForDiffKeys!124 lt!101563 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202427 () Bool)

(assert (=> b!202427 (= e!132575 (not e!132571))))

(declare-fun res!97009 () Bool)

(assert (=> b!202427 (=> res!97009 e!132571)))

(assert (=> b!202427 (= res!97009 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6265)

(declare-fun getCurrentListMap!924 (array!9139 array!9137 (_ BitVec 32) (_ BitVec 32) V!6265 V!6265 (_ BitVec 32) Int) ListLongMap!2707)

(assert (=> b!202427 (= lt!101560 (getCurrentListMap!924 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101564 () array!9137)

(assert (=> b!202427 (= lt!101562 (getCurrentListMap!924 _keys!825 lt!101564 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202427 (and (= lt!101559 lt!101569) (= lt!101569 lt!101559))))

(assert (=> b!202427 (= lt!101569 (+!418 lt!101563 lt!101568))))

(assert (=> b!202427 (= lt!101568 (tuple2!3805 k0!843 v!520))))

(declare-fun lt!101570 () Unit!6088)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!83 (array!9139 array!9137 (_ BitVec 32) (_ BitVec 32) V!6265 V!6265 (_ BitVec 32) (_ BitVec 64) V!6265 (_ BitVec 32) Int) Unit!6088)

(assert (=> b!202427 (= lt!101570 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!83 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!334 (array!9139 array!9137 (_ BitVec 32) (_ BitVec 32) V!6265 V!6265 (_ BitVec 32) Int) ListLongMap!2707)

(assert (=> b!202427 (= lt!101559 (getCurrentListMapNoExtraKeys!334 _keys!825 lt!101564 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202427 (= lt!101564 (array!9138 (store (arr!4318 _values!649) i!601 (ValueCellFull!2138 v!520)) (size!4644 _values!649)))))

(assert (=> b!202427 (= lt!101563 (getCurrentListMapNoExtraKeys!334 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8513 () Bool)

(assert (=> mapIsEmpty!8513 mapRes!8513))

(assert (= (and start!20452 res!97003) b!202416))

(assert (= (and b!202416 res!97008) b!202425))

(assert (= (and b!202425 res!97010) b!202420))

(assert (= (and b!202420 res!97007) b!202422))

(assert (= (and b!202422 res!97005) b!202424))

(assert (= (and b!202424 res!97002) b!202421))

(assert (= (and b!202421 res!97004) b!202427))

(assert (= (and b!202427 (not res!97009)) b!202423))

(assert (= (and b!202423 (not res!97006)) b!202426))

(assert (= (and b!202417 condMapEmpty!8513) mapIsEmpty!8513))

(assert (= (and b!202417 (not condMapEmpty!8513)) mapNonEmpty!8513))

(get-info :version)

(assert (= (and mapNonEmpty!8513 ((_ is ValueCellFull!2138) mapValue!8513)) b!202419))

(assert (= (and b!202417 ((_ is ValueCellFull!2138) mapDefault!8513)) b!202418))

(assert (= start!20452 b!202417))

(declare-fun m!229275 () Bool)

(assert (=> start!20452 m!229275))

(declare-fun m!229277 () Bool)

(assert (=> start!20452 m!229277))

(declare-fun m!229279 () Bool)

(assert (=> start!20452 m!229279))

(declare-fun m!229281 () Bool)

(assert (=> b!202426 m!229281))

(declare-fun m!229283 () Bool)

(assert (=> b!202426 m!229283))

(declare-fun m!229285 () Bool)

(assert (=> b!202424 m!229285))

(declare-fun m!229287 () Bool)

(assert (=> b!202425 m!229287))

(declare-fun m!229289 () Bool)

(assert (=> b!202427 m!229289))

(declare-fun m!229291 () Bool)

(assert (=> b!202427 m!229291))

(declare-fun m!229293 () Bool)

(assert (=> b!202427 m!229293))

(declare-fun m!229295 () Bool)

(assert (=> b!202427 m!229295))

(declare-fun m!229297 () Bool)

(assert (=> b!202427 m!229297))

(declare-fun m!229299 () Bool)

(assert (=> b!202427 m!229299))

(declare-fun m!229301 () Bool)

(assert (=> b!202427 m!229301))

(declare-fun m!229303 () Bool)

(assert (=> b!202423 m!229303))

(declare-fun m!229305 () Bool)

(assert (=> b!202423 m!229305))

(declare-fun m!229307 () Bool)

(assert (=> b!202423 m!229307))

(declare-fun m!229309 () Bool)

(assert (=> b!202421 m!229309))

(declare-fun m!229311 () Bool)

(assert (=> mapNonEmpty!8513 m!229311))

(declare-fun m!229313 () Bool)

(assert (=> b!202420 m!229313))

(check-sat (not b!202427) (not b!202420) (not mapNonEmpty!8513) b_and!11827 (not start!20452) (not b_next!5107) (not b!202423) tp_is_empty!4963 (not b!202424) (not b!202426) (not b!202425))
(check-sat b_and!11827 (not b_next!5107))
