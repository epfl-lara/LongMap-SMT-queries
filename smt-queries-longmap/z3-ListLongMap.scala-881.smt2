; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20384 () Bool)

(assert start!20384)

(declare-fun b_free!5043 () Bool)

(declare-fun b_next!5043 () Bool)

(assert (=> start!20384 (= b_free!5043 (not b_next!5043))))

(declare-fun tp!18161 () Bool)

(declare-fun b_and!11789 () Bool)

(assert (=> start!20384 (= tp!18161 b_and!11789)))

(declare-fun b!201402 () Bool)

(declare-fun res!96225 () Bool)

(declare-fun e!132004 () Bool)

(assert (=> b!201402 (=> (not res!96225) (not e!132004))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9027 0))(
  ( (array!9028 (arr!4264 (Array (_ BitVec 32) (_ BitVec 64))) (size!4589 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9027)

(assert (=> b!201402 (= res!96225 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4589 _keys!825))))))

(declare-fun b!201403 () Bool)

(declare-fun res!96232 () Bool)

(assert (=> b!201403 (=> (not res!96232) (not e!132004))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201403 (= res!96232 (validKeyInArray!0 k0!843))))

(declare-fun res!96224 () Bool)

(assert (=> start!20384 (=> (not res!96224) (not e!132004))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20384 (= res!96224 (validMask!0 mask!1149))))

(assert (=> start!20384 e!132004))

(declare-datatypes ((V!6179 0))(
  ( (V!6180 (val!2494 Int)) )
))
(declare-datatypes ((ValueCell!2106 0))(
  ( (ValueCellFull!2106 (v!4464 V!6179)) (EmptyCell!2106) )
))
(declare-datatypes ((array!9029 0))(
  ( (array!9030 (arr!4265 (Array (_ BitVec 32) ValueCell!2106)) (size!4590 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9029)

(declare-fun e!132000 () Bool)

(declare-fun array_inv!2811 (array!9029) Bool)

(assert (=> start!20384 (and (array_inv!2811 _values!649) e!132000)))

(assert (=> start!20384 true))

(declare-fun tp_is_empty!4899 () Bool)

(assert (=> start!20384 tp_is_empty!4899))

(declare-fun array_inv!2812 (array!9027) Bool)

(assert (=> start!20384 (array_inv!2812 _keys!825)))

(assert (=> start!20384 tp!18161))

(declare-fun b!201404 () Bool)

(declare-fun e!132003 () Bool)

(assert (=> b!201404 (= e!132003 tp_is_empty!4899)))

(declare-fun b!201405 () Bool)

(declare-fun res!96230 () Bool)

(assert (=> b!201405 (=> (not res!96230) (not e!132004))))

(declare-datatypes ((List!2689 0))(
  ( (Nil!2686) (Cons!2685 (h!3327 (_ BitVec 64)) (t!7620 List!2689)) )
))
(declare-fun arrayNoDuplicates!0 (array!9027 (_ BitVec 32) List!2689) Bool)

(assert (=> b!201405 (= res!96230 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2686))))

(declare-fun b!201406 () Bool)

(declare-fun e!132002 () Bool)

(assert (=> b!201406 (= e!132002 true)))

(declare-datatypes ((tuple2!3776 0))(
  ( (tuple2!3777 (_1!1899 (_ BitVec 64)) (_2!1899 V!6179)) )
))
(declare-fun lt!100332 () tuple2!3776)

(declare-datatypes ((List!2690 0))(
  ( (Nil!2687) (Cons!2686 (h!3328 tuple2!3776) (t!7621 List!2690)) )
))
(declare-datatypes ((ListLongMap!2689 0))(
  ( (ListLongMap!2690 (toList!1360 List!2690)) )
))
(declare-fun lt!100321 () ListLongMap!2689)

(declare-fun lt!100325 () tuple2!3776)

(declare-fun lt!100322 () ListLongMap!2689)

(declare-fun +!387 (ListLongMap!2689 tuple2!3776) ListLongMap!2689)

(assert (=> b!201406 (= (+!387 lt!100321 lt!100332) (+!387 lt!100322 lt!100325))))

(declare-fun lt!100320 () ListLongMap!2689)

(declare-fun minValue!615 () V!6179)

(declare-datatypes ((Unit!6074 0))(
  ( (Unit!6075) )
))
(declare-fun lt!100331 () Unit!6074)

(declare-fun v!520 () V!6179)

(declare-fun addCommutativeForDiffKeys!108 (ListLongMap!2689 (_ BitVec 64) V!6179 (_ BitVec 64) V!6179) Unit!6074)

(assert (=> b!201406 (= lt!100331 (addCommutativeForDiffKeys!108 lt!100320 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201407 () Bool)

(declare-fun e!131999 () Bool)

(assert (=> b!201407 (= e!132004 (not e!131999))))

(declare-fun res!96228 () Bool)

(assert (=> b!201407 (=> res!96228 e!131999)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201407 (= res!96228 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!100329 () ListLongMap!2689)

(declare-fun zeroValue!615 () V!6179)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!949 (array!9027 array!9029 (_ BitVec 32) (_ BitVec 32) V!6179 V!6179 (_ BitVec 32) Int) ListLongMap!2689)

(assert (=> b!201407 (= lt!100329 (getCurrentListMap!949 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100328 () array!9029)

(declare-fun lt!100324 () ListLongMap!2689)

(assert (=> b!201407 (= lt!100324 (getCurrentListMap!949 _keys!825 lt!100328 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100333 () ListLongMap!2689)

(declare-fun lt!100323 () ListLongMap!2689)

(assert (=> b!201407 (and (= lt!100333 lt!100323) (= lt!100323 lt!100333))))

(declare-fun lt!100330 () ListLongMap!2689)

(assert (=> b!201407 (= lt!100323 (+!387 lt!100330 lt!100325))))

(assert (=> b!201407 (= lt!100325 (tuple2!3777 k0!843 v!520))))

(declare-fun lt!100334 () Unit!6074)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!62 (array!9027 array!9029 (_ BitVec 32) (_ BitVec 32) V!6179 V!6179 (_ BitVec 32) (_ BitVec 64) V!6179 (_ BitVec 32) Int) Unit!6074)

(assert (=> b!201407 (= lt!100334 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!62 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!323 (array!9027 array!9029 (_ BitVec 32) (_ BitVec 32) V!6179 V!6179 (_ BitVec 32) Int) ListLongMap!2689)

(assert (=> b!201407 (= lt!100333 (getCurrentListMapNoExtraKeys!323 _keys!825 lt!100328 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201407 (= lt!100328 (array!9030 (store (arr!4265 _values!649) i!601 (ValueCellFull!2106 v!520)) (size!4590 _values!649)))))

(assert (=> b!201407 (= lt!100330 (getCurrentListMapNoExtraKeys!323 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8417 () Bool)

(declare-fun mapRes!8417 () Bool)

(declare-fun tp!18160 () Bool)

(declare-fun e!132001 () Bool)

(assert (=> mapNonEmpty!8417 (= mapRes!8417 (and tp!18160 e!132001))))

(declare-fun mapKey!8417 () (_ BitVec 32))

(declare-fun mapRest!8417 () (Array (_ BitVec 32) ValueCell!2106))

(declare-fun mapValue!8417 () ValueCell!2106)

(assert (=> mapNonEmpty!8417 (= (arr!4265 _values!649) (store mapRest!8417 mapKey!8417 mapValue!8417))))

(declare-fun b!201408 () Bool)

(declare-fun res!96226 () Bool)

(assert (=> b!201408 (=> (not res!96226) (not e!132004))))

(assert (=> b!201408 (= res!96226 (and (= (size!4590 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4589 _keys!825) (size!4590 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201409 () Bool)

(declare-fun res!96231 () Bool)

(assert (=> b!201409 (=> (not res!96231) (not e!132004))))

(assert (=> b!201409 (= res!96231 (= (select (arr!4264 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8417 () Bool)

(assert (=> mapIsEmpty!8417 mapRes!8417))

(declare-fun b!201410 () Bool)

(assert (=> b!201410 (= e!131999 e!132002)))

(declare-fun res!96227 () Bool)

(assert (=> b!201410 (=> res!96227 e!132002)))

(assert (=> b!201410 (= res!96227 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100335 () ListLongMap!2689)

(assert (=> b!201410 (= lt!100335 lt!100321)))

(assert (=> b!201410 (= lt!100321 (+!387 lt!100320 lt!100325))))

(declare-fun lt!100326 () Unit!6074)

(assert (=> b!201410 (= lt!100326 (addCommutativeForDiffKeys!108 lt!100330 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!201410 (= lt!100324 (+!387 lt!100335 lt!100332))))

(declare-fun lt!100327 () tuple2!3776)

(assert (=> b!201410 (= lt!100335 (+!387 lt!100323 lt!100327))))

(assert (=> b!201410 (= lt!100329 lt!100322)))

(assert (=> b!201410 (= lt!100322 (+!387 lt!100320 lt!100332))))

(assert (=> b!201410 (= lt!100320 (+!387 lt!100330 lt!100327))))

(assert (=> b!201410 (= lt!100324 (+!387 (+!387 lt!100333 lt!100327) lt!100332))))

(assert (=> b!201410 (= lt!100332 (tuple2!3777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201410 (= lt!100327 (tuple2!3777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201411 () Bool)

(declare-fun res!96229 () Bool)

(assert (=> b!201411 (=> (not res!96229) (not e!132004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9027 (_ BitVec 32)) Bool)

(assert (=> b!201411 (= res!96229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201412 () Bool)

(assert (=> b!201412 (= e!132001 tp_is_empty!4899)))

(declare-fun b!201413 () Bool)

(assert (=> b!201413 (= e!132000 (and e!132003 mapRes!8417))))

(declare-fun condMapEmpty!8417 () Bool)

(declare-fun mapDefault!8417 () ValueCell!2106)

(assert (=> b!201413 (= condMapEmpty!8417 (= (arr!4265 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2106)) mapDefault!8417)))))

(assert (= (and start!20384 res!96224) b!201408))

(assert (= (and b!201408 res!96226) b!201411))

(assert (= (and b!201411 res!96229) b!201405))

(assert (= (and b!201405 res!96230) b!201402))

(assert (= (and b!201402 res!96225) b!201403))

(assert (= (and b!201403 res!96232) b!201409))

(assert (= (and b!201409 res!96231) b!201407))

(assert (= (and b!201407 (not res!96228)) b!201410))

(assert (= (and b!201410 (not res!96227)) b!201406))

(assert (= (and b!201413 condMapEmpty!8417) mapIsEmpty!8417))

(assert (= (and b!201413 (not condMapEmpty!8417)) mapNonEmpty!8417))

(get-info :version)

(assert (= (and mapNonEmpty!8417 ((_ is ValueCellFull!2106) mapValue!8417)) b!201412))

(assert (= (and b!201413 ((_ is ValueCellFull!2106) mapDefault!8417)) b!201404))

(assert (= start!20384 b!201413))

(declare-fun m!228311 () Bool)

(assert (=> b!201406 m!228311))

(declare-fun m!228313 () Bool)

(assert (=> b!201406 m!228313))

(declare-fun m!228315 () Bool)

(assert (=> b!201406 m!228315))

(declare-fun m!228317 () Bool)

(assert (=> b!201405 m!228317))

(declare-fun m!228319 () Bool)

(assert (=> mapNonEmpty!8417 m!228319))

(declare-fun m!228321 () Bool)

(assert (=> b!201407 m!228321))

(declare-fun m!228323 () Bool)

(assert (=> b!201407 m!228323))

(declare-fun m!228325 () Bool)

(assert (=> b!201407 m!228325))

(declare-fun m!228327 () Bool)

(assert (=> b!201407 m!228327))

(declare-fun m!228329 () Bool)

(assert (=> b!201407 m!228329))

(declare-fun m!228331 () Bool)

(assert (=> b!201407 m!228331))

(declare-fun m!228333 () Bool)

(assert (=> b!201407 m!228333))

(declare-fun m!228335 () Bool)

(assert (=> b!201411 m!228335))

(declare-fun m!228337 () Bool)

(assert (=> b!201410 m!228337))

(declare-fun m!228339 () Bool)

(assert (=> b!201410 m!228339))

(declare-fun m!228341 () Bool)

(assert (=> b!201410 m!228341))

(declare-fun m!228343 () Bool)

(assert (=> b!201410 m!228343))

(declare-fun m!228345 () Bool)

(assert (=> b!201410 m!228345))

(declare-fun m!228347 () Bool)

(assert (=> b!201410 m!228347))

(assert (=> b!201410 m!228343))

(declare-fun m!228349 () Bool)

(assert (=> b!201410 m!228349))

(declare-fun m!228351 () Bool)

(assert (=> b!201410 m!228351))

(declare-fun m!228353 () Bool)

(assert (=> b!201403 m!228353))

(declare-fun m!228355 () Bool)

(assert (=> start!20384 m!228355))

(declare-fun m!228357 () Bool)

(assert (=> start!20384 m!228357))

(declare-fun m!228359 () Bool)

(assert (=> start!20384 m!228359))

(declare-fun m!228361 () Bool)

(assert (=> b!201409 m!228361))

(check-sat (not b!201403) b_and!11789 (not b!201411) (not mapNonEmpty!8417) tp_is_empty!4899 (not b_next!5043) (not b!201410) (not b!201406) (not b!201405) (not start!20384) (not b!201407))
(check-sat b_and!11789 (not b_next!5043))
