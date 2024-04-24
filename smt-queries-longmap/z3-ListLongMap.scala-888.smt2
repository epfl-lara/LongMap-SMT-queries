; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20428 () Bool)

(assert start!20428)

(declare-fun b_free!5083 () Bool)

(declare-fun b_next!5083 () Bool)

(assert (=> start!20428 (= b_free!5083 (not b_next!5083))))

(declare-fun tp!18281 () Bool)

(declare-fun b_and!11843 () Bool)

(assert (=> start!20428 (= tp!18281 b_and!11843)))

(declare-fun b!202169 () Bool)

(declare-fun res!96791 () Bool)

(declare-fun e!132444 () Bool)

(assert (=> b!202169 (=> (not res!96791) (not e!132444))))

(declare-datatypes ((array!9097 0))(
  ( (array!9098 (arr!4299 (Array (_ BitVec 32) (_ BitVec 64))) (size!4624 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9097)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202169 (= res!96791 (= (select (arr!4299 _keys!825) i!601) k0!843))))

(declare-fun res!96785 () Bool)

(assert (=> start!20428 (=> (not res!96785) (not e!132444))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20428 (= res!96785 (validMask!0 mask!1149))))

(assert (=> start!20428 e!132444))

(declare-datatypes ((V!6233 0))(
  ( (V!6234 (val!2514 Int)) )
))
(declare-datatypes ((ValueCell!2126 0))(
  ( (ValueCellFull!2126 (v!4485 V!6233)) (EmptyCell!2126) )
))
(declare-datatypes ((array!9099 0))(
  ( (array!9100 (arr!4300 (Array (_ BitVec 32) ValueCell!2126)) (size!4625 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9099)

(declare-fun e!132448 () Bool)

(declare-fun array_inv!2803 (array!9099) Bool)

(assert (=> start!20428 (and (array_inv!2803 _values!649) e!132448)))

(assert (=> start!20428 true))

(declare-fun tp_is_empty!4939 () Bool)

(assert (=> start!20428 tp_is_empty!4939))

(declare-fun array_inv!2804 (array!9097) Bool)

(assert (=> start!20428 (array_inv!2804 _keys!825)))

(assert (=> start!20428 tp!18281))

(declare-fun mapNonEmpty!8477 () Bool)

(declare-fun mapRes!8477 () Bool)

(declare-fun tp!18280 () Bool)

(declare-fun e!132449 () Bool)

(assert (=> mapNonEmpty!8477 (= mapRes!8477 (and tp!18280 e!132449))))

(declare-fun mapKey!8477 () (_ BitVec 32))

(declare-fun mapRest!8477 () (Array (_ BitVec 32) ValueCell!2126))

(declare-fun mapValue!8477 () ValueCell!2126)

(assert (=> mapNonEmpty!8477 (= (arr!4300 _values!649) (store mapRest!8477 mapKey!8477 mapValue!8477))))

(declare-fun b!202170 () Bool)

(declare-fun res!96788 () Bool)

(assert (=> b!202170 (=> (not res!96788) (not e!132444))))

(assert (=> b!202170 (= res!96788 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4624 _keys!825))))))

(declare-fun b!202171 () Bool)

(declare-fun e!132445 () Bool)

(assert (=> b!202171 (= e!132448 (and e!132445 mapRes!8477))))

(declare-fun condMapEmpty!8477 () Bool)

(declare-fun mapDefault!8477 () ValueCell!2126)

(assert (=> b!202171 (= condMapEmpty!8477 (= (arr!4300 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2126)) mapDefault!8477)))))

(declare-fun b!202172 () Bool)

(declare-fun e!132443 () Bool)

(assert (=> b!202172 (= e!132443 true)))

(declare-datatypes ((tuple2!3746 0))(
  ( (tuple2!3747 (_1!1884 (_ BitVec 64)) (_2!1884 V!6233)) )
))
(declare-fun lt!101354 () tuple2!3746)

(declare-datatypes ((List!2654 0))(
  ( (Nil!2651) (Cons!2650 (h!3292 tuple2!3746) (t!7577 List!2654)) )
))
(declare-datatypes ((ListLongMap!2661 0))(
  ( (ListLongMap!2662 (toList!1346 List!2654)) )
))
(declare-fun lt!101349 () ListLongMap!2661)

(declare-fun lt!101345 () tuple2!3746)

(declare-fun lt!101339 () ListLongMap!2661)

(declare-fun +!400 (ListLongMap!2661 tuple2!3746) ListLongMap!2661)

(assert (=> b!202172 (= (+!400 lt!101349 lt!101345) (+!400 lt!101339 lt!101354))))

(declare-datatypes ((Unit!6084 0))(
  ( (Unit!6085) )
))
(declare-fun lt!101344 () Unit!6084)

(declare-fun minValue!615 () V!6233)

(declare-fun v!520 () V!6233)

(declare-fun lt!101346 () ListLongMap!2661)

(declare-fun addCommutativeForDiffKeys!123 (ListLongMap!2661 (_ BitVec 64) V!6233 (_ BitVec 64) V!6233) Unit!6084)

(assert (=> b!202172 (= lt!101344 (addCommutativeForDiffKeys!123 lt!101346 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!202173 () Bool)

(declare-fun res!96792 () Bool)

(assert (=> b!202173 (=> (not res!96792) (not e!132444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202173 (= res!96792 (validKeyInArray!0 k0!843))))

(declare-fun b!202174 () Bool)

(declare-fun e!132447 () Bool)

(assert (=> b!202174 (= e!132444 (not e!132447))))

(declare-fun res!96793 () Bool)

(assert (=> b!202174 (=> res!96793 e!132447)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202174 (= res!96793 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6233)

(declare-fun defaultEntry!657 () Int)

(declare-fun lt!101341 () ListLongMap!2661)

(declare-fun getCurrentListMap!931 (array!9097 array!9099 (_ BitVec 32) (_ BitVec 32) V!6233 V!6233 (_ BitVec 32) Int) ListLongMap!2661)

(assert (=> b!202174 (= lt!101341 (getCurrentListMap!931 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101342 () array!9099)

(declare-fun lt!101353 () ListLongMap!2661)

(assert (=> b!202174 (= lt!101353 (getCurrentListMap!931 _keys!825 lt!101342 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101347 () ListLongMap!2661)

(declare-fun lt!101348 () ListLongMap!2661)

(assert (=> b!202174 (and (= lt!101347 lt!101348) (= lt!101348 lt!101347))))

(declare-fun lt!101350 () ListLongMap!2661)

(assert (=> b!202174 (= lt!101348 (+!400 lt!101350 lt!101354))))

(assert (=> b!202174 (= lt!101354 (tuple2!3747 k0!843 v!520))))

(declare-fun lt!101340 () Unit!6084)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!67 (array!9097 array!9099 (_ BitVec 32) (_ BitVec 32) V!6233 V!6233 (_ BitVec 32) (_ BitVec 64) V!6233 (_ BitVec 32) Int) Unit!6084)

(assert (=> b!202174 (= lt!101340 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!67 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!324 (array!9097 array!9099 (_ BitVec 32) (_ BitVec 32) V!6233 V!6233 (_ BitVec 32) Int) ListLongMap!2661)

(assert (=> b!202174 (= lt!101347 (getCurrentListMapNoExtraKeys!324 _keys!825 lt!101342 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202174 (= lt!101342 (array!9100 (store (arr!4300 _values!649) i!601 (ValueCellFull!2126 v!520)) (size!4625 _values!649)))))

(assert (=> b!202174 (= lt!101350 (getCurrentListMapNoExtraKeys!324 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202175 () Bool)

(declare-fun res!96787 () Bool)

(assert (=> b!202175 (=> (not res!96787) (not e!132444))))

(assert (=> b!202175 (= res!96787 (and (= (size!4625 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4624 _keys!825) (size!4625 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8477 () Bool)

(assert (=> mapIsEmpty!8477 mapRes!8477))

(declare-fun b!202176 () Bool)

(assert (=> b!202176 (= e!132447 e!132443)))

(declare-fun res!96786 () Bool)

(assert (=> b!202176 (=> res!96786 e!132443)))

(assert (=> b!202176 (= res!96786 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101352 () ListLongMap!2661)

(assert (=> b!202176 (= lt!101352 lt!101349)))

(assert (=> b!202176 (= lt!101349 (+!400 lt!101346 lt!101354))))

(declare-fun lt!101343 () Unit!6084)

(assert (=> b!202176 (= lt!101343 (addCommutativeForDiffKeys!123 lt!101350 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!202176 (= lt!101353 (+!400 lt!101352 lt!101345))))

(declare-fun lt!101351 () tuple2!3746)

(assert (=> b!202176 (= lt!101352 (+!400 lt!101348 lt!101351))))

(assert (=> b!202176 (= lt!101341 lt!101339)))

(assert (=> b!202176 (= lt!101339 (+!400 lt!101346 lt!101345))))

(assert (=> b!202176 (= lt!101346 (+!400 lt!101350 lt!101351))))

(assert (=> b!202176 (= lt!101353 (+!400 (+!400 lt!101347 lt!101351) lt!101345))))

(assert (=> b!202176 (= lt!101345 (tuple2!3747 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!202176 (= lt!101351 (tuple2!3747 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202177 () Bool)

(assert (=> b!202177 (= e!132445 tp_is_empty!4939)))

(declare-fun b!202178 () Bool)

(declare-fun res!96790 () Bool)

(assert (=> b!202178 (=> (not res!96790) (not e!132444))))

(declare-datatypes ((List!2655 0))(
  ( (Nil!2652) (Cons!2651 (h!3293 (_ BitVec 64)) (t!7578 List!2655)) )
))
(declare-fun arrayNoDuplicates!0 (array!9097 (_ BitVec 32) List!2655) Bool)

(assert (=> b!202178 (= res!96790 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2652))))

(declare-fun b!202179 () Bool)

(declare-fun res!96789 () Bool)

(assert (=> b!202179 (=> (not res!96789) (not e!132444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9097 (_ BitVec 32)) Bool)

(assert (=> b!202179 (= res!96789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202180 () Bool)

(assert (=> b!202180 (= e!132449 tp_is_empty!4939)))

(assert (= (and start!20428 res!96785) b!202175))

(assert (= (and b!202175 res!96787) b!202179))

(assert (= (and b!202179 res!96789) b!202178))

(assert (= (and b!202178 res!96790) b!202170))

(assert (= (and b!202170 res!96788) b!202173))

(assert (= (and b!202173 res!96792) b!202169))

(assert (= (and b!202169 res!96791) b!202174))

(assert (= (and b!202174 (not res!96793)) b!202176))

(assert (= (and b!202176 (not res!96786)) b!202172))

(assert (= (and b!202171 condMapEmpty!8477) mapIsEmpty!8477))

(assert (= (and b!202171 (not condMapEmpty!8477)) mapNonEmpty!8477))

(get-info :version)

(assert (= (and mapNonEmpty!8477 ((_ is ValueCellFull!2126) mapValue!8477)) b!202180))

(assert (= (and b!202171 ((_ is ValueCellFull!2126) mapDefault!8477)) b!202177))

(assert (= start!20428 b!202171))

(declare-fun m!229533 () Bool)

(assert (=> mapNonEmpty!8477 m!229533))

(declare-fun m!229535 () Bool)

(assert (=> b!202169 m!229535))

(declare-fun m!229537 () Bool)

(assert (=> b!202172 m!229537))

(declare-fun m!229539 () Bool)

(assert (=> b!202172 m!229539))

(declare-fun m!229541 () Bool)

(assert (=> b!202172 m!229541))

(declare-fun m!229543 () Bool)

(assert (=> b!202176 m!229543))

(declare-fun m!229545 () Bool)

(assert (=> b!202176 m!229545))

(declare-fun m!229547 () Bool)

(assert (=> b!202176 m!229547))

(declare-fun m!229549 () Bool)

(assert (=> b!202176 m!229549))

(declare-fun m!229551 () Bool)

(assert (=> b!202176 m!229551))

(declare-fun m!229553 () Bool)

(assert (=> b!202176 m!229553))

(assert (=> b!202176 m!229549))

(declare-fun m!229555 () Bool)

(assert (=> b!202176 m!229555))

(declare-fun m!229557 () Bool)

(assert (=> b!202176 m!229557))

(declare-fun m!229559 () Bool)

(assert (=> b!202173 m!229559))

(declare-fun m!229561 () Bool)

(assert (=> b!202178 m!229561))

(declare-fun m!229563 () Bool)

(assert (=> start!20428 m!229563))

(declare-fun m!229565 () Bool)

(assert (=> start!20428 m!229565))

(declare-fun m!229567 () Bool)

(assert (=> start!20428 m!229567))

(declare-fun m!229569 () Bool)

(assert (=> b!202174 m!229569))

(declare-fun m!229571 () Bool)

(assert (=> b!202174 m!229571))

(declare-fun m!229573 () Bool)

(assert (=> b!202174 m!229573))

(declare-fun m!229575 () Bool)

(assert (=> b!202174 m!229575))

(declare-fun m!229577 () Bool)

(assert (=> b!202174 m!229577))

(declare-fun m!229579 () Bool)

(assert (=> b!202174 m!229579))

(declare-fun m!229581 () Bool)

(assert (=> b!202174 m!229581))

(declare-fun m!229583 () Bool)

(assert (=> b!202179 m!229583))

(check-sat (not b_next!5083) (not b!202172) (not start!20428) (not b!202176) (not b!202179) (not b!202178) (not b!202173) (not mapNonEmpty!8477) tp_is_empty!4939 b_and!11843 (not b!202174))
(check-sat b_and!11843 (not b_next!5083))
