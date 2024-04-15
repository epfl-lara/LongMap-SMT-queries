; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20332 () Bool)

(assert start!20332)

(declare-fun b_free!4987 () Bool)

(declare-fun b_next!4987 () Bool)

(assert (=> start!20332 (= b_free!4987 (not b_next!4987))))

(declare-fun tp!17993 () Bool)

(declare-fun b_and!11707 () Bool)

(assert (=> start!20332 (= tp!17993 b_and!11707)))

(declare-fun b!200248 () Bool)

(declare-fun res!95381 () Bool)

(declare-fun e!131316 () Bool)

(assert (=> b!200248 (=> (not res!95381) (not e!131316))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8903 0))(
  ( (array!8904 (arr!4201 (Array (_ BitVec 32) (_ BitVec 64))) (size!4527 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8903)

(assert (=> b!200248 (= res!95381 (= (select (arr!4201 _keys!825) i!601) k0!843))))

(declare-fun b!200249 () Bool)

(declare-fun e!131311 () Bool)

(declare-fun e!131310 () Bool)

(assert (=> b!200249 (= e!131311 e!131310)))

(declare-fun res!95374 () Bool)

(assert (=> b!200249 (=> res!95374 e!131310)))

(assert (=> b!200249 (= res!95374 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6105 0))(
  ( (V!6106 (val!2466 Int)) )
))
(declare-datatypes ((tuple2!3700 0))(
  ( (tuple2!3701 (_1!1861 (_ BitVec 64)) (_2!1861 V!6105)) )
))
(declare-datatypes ((List!2625 0))(
  ( (Nil!2622) (Cons!2621 (h!3263 tuple2!3700) (t!7547 List!2625)) )
))
(declare-datatypes ((ListLongMap!2603 0))(
  ( (ListLongMap!2604 (toList!1317 List!2625)) )
))
(declare-fun lt!98810 () ListLongMap!2603)

(declare-fun lt!98808 () ListLongMap!2603)

(assert (=> b!200249 (= lt!98810 lt!98808)))

(declare-fun lt!98807 () ListLongMap!2603)

(declare-fun lt!98801 () tuple2!3700)

(declare-fun +!366 (ListLongMap!2603 tuple2!3700) ListLongMap!2603)

(assert (=> b!200249 (= lt!98808 (+!366 lt!98807 lt!98801))))

(declare-datatypes ((Unit!5984 0))(
  ( (Unit!5985) )
))
(declare-fun lt!98805 () Unit!5984)

(declare-fun lt!98804 () ListLongMap!2603)

(declare-fun v!520 () V!6105)

(declare-fun zeroValue!615 () V!6105)

(declare-fun addCommutativeForDiffKeys!76 (ListLongMap!2603 (_ BitVec 64) V!6105 (_ BitVec 64) V!6105) Unit!5984)

(assert (=> b!200249 (= lt!98805 (addCommutativeForDiffKeys!76 lt!98804 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!98803 () ListLongMap!2603)

(declare-fun lt!98796 () tuple2!3700)

(assert (=> b!200249 (= lt!98803 (+!366 lt!98810 lt!98796))))

(declare-fun lt!98797 () ListLongMap!2603)

(declare-fun lt!98802 () tuple2!3700)

(assert (=> b!200249 (= lt!98810 (+!366 lt!98797 lt!98802))))

(declare-fun lt!98806 () ListLongMap!2603)

(declare-fun lt!98798 () ListLongMap!2603)

(assert (=> b!200249 (= lt!98806 lt!98798)))

(assert (=> b!200249 (= lt!98798 (+!366 lt!98807 lt!98796))))

(assert (=> b!200249 (= lt!98807 (+!366 lt!98804 lt!98802))))

(declare-fun lt!98809 () ListLongMap!2603)

(assert (=> b!200249 (= lt!98803 (+!366 (+!366 lt!98809 lt!98802) lt!98796))))

(declare-fun minValue!615 () V!6105)

(assert (=> b!200249 (= lt!98796 (tuple2!3701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200249 (= lt!98802 (tuple2!3701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!8333 () Bool)

(declare-fun mapRes!8333 () Bool)

(assert (=> mapIsEmpty!8333 mapRes!8333))

(declare-fun b!200250 () Bool)

(declare-fun e!131312 () Bool)

(declare-fun e!131314 () Bool)

(assert (=> b!200250 (= e!131312 (and e!131314 mapRes!8333))))

(declare-fun condMapEmpty!8333 () Bool)

(declare-datatypes ((ValueCell!2078 0))(
  ( (ValueCellFull!2078 (v!4430 V!6105)) (EmptyCell!2078) )
))
(declare-datatypes ((array!8905 0))(
  ( (array!8906 (arr!4202 (Array (_ BitVec 32) ValueCell!2078)) (size!4528 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8905)

(declare-fun mapDefault!8333 () ValueCell!2078)

(assert (=> b!200250 (= condMapEmpty!8333 (= (arr!4202 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2078)) mapDefault!8333)))))

(declare-fun b!200251 () Bool)

(declare-fun res!95378 () Bool)

(assert (=> b!200251 (=> (not res!95378) (not e!131316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200251 (= res!95378 (validKeyInArray!0 k0!843))))

(declare-fun b!200252 () Bool)

(assert (=> b!200252 (= e!131310 true)))

(assert (=> b!200252 (= (+!366 lt!98808 lt!98796) (+!366 lt!98798 lt!98801))))

(declare-fun lt!98800 () Unit!5984)

(assert (=> b!200252 (= lt!98800 (addCommutativeForDiffKeys!76 lt!98807 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200253 () Bool)

(declare-fun res!95376 () Bool)

(assert (=> b!200253 (=> (not res!95376) (not e!131316))))

(assert (=> b!200253 (= res!95376 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4527 _keys!825))))))

(declare-fun b!200254 () Bool)

(declare-fun e!131315 () Bool)

(declare-fun tp_is_empty!4843 () Bool)

(assert (=> b!200254 (= e!131315 tp_is_empty!4843)))

(declare-fun b!200255 () Bool)

(declare-fun res!95379 () Bool)

(assert (=> b!200255 (=> (not res!95379) (not e!131316))))

(declare-datatypes ((List!2626 0))(
  ( (Nil!2623) (Cons!2622 (h!3264 (_ BitVec 64)) (t!7548 List!2626)) )
))
(declare-fun arrayNoDuplicates!0 (array!8903 (_ BitVec 32) List!2626) Bool)

(assert (=> b!200255 (= res!95379 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2623))))

(declare-fun b!200256 () Bool)

(declare-fun res!95375 () Bool)

(assert (=> b!200256 (=> (not res!95375) (not e!131316))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8903 (_ BitVec 32)) Bool)

(assert (=> b!200256 (= res!95375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200257 () Bool)

(declare-fun res!95373 () Bool)

(assert (=> b!200257 (=> (not res!95373) (not e!131316))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200257 (= res!95373 (and (= (size!4528 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4527 _keys!825) (size!4528 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!95377 () Bool)

(assert (=> start!20332 (=> (not res!95377) (not e!131316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20332 (= res!95377 (validMask!0 mask!1149))))

(assert (=> start!20332 e!131316))

(declare-fun array_inv!2741 (array!8905) Bool)

(assert (=> start!20332 (and (array_inv!2741 _values!649) e!131312)))

(assert (=> start!20332 true))

(assert (=> start!20332 tp_is_empty!4843))

(declare-fun array_inv!2742 (array!8903) Bool)

(assert (=> start!20332 (array_inv!2742 _keys!825)))

(assert (=> start!20332 tp!17993))

(declare-fun b!200247 () Bool)

(assert (=> b!200247 (= e!131314 tp_is_empty!4843)))

(declare-fun mapNonEmpty!8333 () Bool)

(declare-fun tp!17992 () Bool)

(assert (=> mapNonEmpty!8333 (= mapRes!8333 (and tp!17992 e!131315))))

(declare-fun mapKey!8333 () (_ BitVec 32))

(declare-fun mapRest!8333 () (Array (_ BitVec 32) ValueCell!2078))

(declare-fun mapValue!8333 () ValueCell!2078)

(assert (=> mapNonEmpty!8333 (= (arr!4202 _values!649) (store mapRest!8333 mapKey!8333 mapValue!8333))))

(declare-fun b!200258 () Bool)

(assert (=> b!200258 (= e!131316 (not e!131311))))

(declare-fun res!95380 () Bool)

(assert (=> b!200258 (=> res!95380 e!131311)))

(assert (=> b!200258 (= res!95380 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!887 (array!8903 array!8905 (_ BitVec 32) (_ BitVec 32) V!6105 V!6105 (_ BitVec 32) Int) ListLongMap!2603)

(assert (=> b!200258 (= lt!98806 (getCurrentListMap!887 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98799 () array!8905)

(assert (=> b!200258 (= lt!98803 (getCurrentListMap!887 _keys!825 lt!98799 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200258 (and (= lt!98809 lt!98797) (= lt!98797 lt!98809))))

(assert (=> b!200258 (= lt!98797 (+!366 lt!98804 lt!98801))))

(assert (=> b!200258 (= lt!98801 (tuple2!3701 k0!843 v!520))))

(declare-fun lt!98795 () Unit!5984)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!46 (array!8903 array!8905 (_ BitVec 32) (_ BitVec 32) V!6105 V!6105 (_ BitVec 32) (_ BitVec 64) V!6105 (_ BitVec 32) Int) Unit!5984)

(assert (=> b!200258 (= lt!98795 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!46 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!297 (array!8903 array!8905 (_ BitVec 32) (_ BitVec 32) V!6105 V!6105 (_ BitVec 32) Int) ListLongMap!2603)

(assert (=> b!200258 (= lt!98809 (getCurrentListMapNoExtraKeys!297 _keys!825 lt!98799 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200258 (= lt!98799 (array!8906 (store (arr!4202 _values!649) i!601 (ValueCellFull!2078 v!520)) (size!4528 _values!649)))))

(assert (=> b!200258 (= lt!98804 (getCurrentListMapNoExtraKeys!297 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20332 res!95377) b!200257))

(assert (= (and b!200257 res!95373) b!200256))

(assert (= (and b!200256 res!95375) b!200255))

(assert (= (and b!200255 res!95379) b!200253))

(assert (= (and b!200253 res!95376) b!200251))

(assert (= (and b!200251 res!95378) b!200248))

(assert (= (and b!200248 res!95381) b!200258))

(assert (= (and b!200258 (not res!95380)) b!200249))

(assert (= (and b!200249 (not res!95374)) b!200252))

(assert (= (and b!200250 condMapEmpty!8333) mapIsEmpty!8333))

(assert (= (and b!200250 (not condMapEmpty!8333)) mapNonEmpty!8333))

(get-info :version)

(assert (= (and mapNonEmpty!8333 ((_ is ValueCellFull!2078) mapValue!8333)) b!200254))

(assert (= (and b!200250 ((_ is ValueCellFull!2078) mapDefault!8333)) b!200247))

(assert (= start!20332 b!200250))

(declare-fun m!226239 () Bool)

(assert (=> mapNonEmpty!8333 m!226239))

(declare-fun m!226241 () Bool)

(assert (=> b!200255 m!226241))

(declare-fun m!226243 () Bool)

(assert (=> b!200256 m!226243))

(declare-fun m!226245 () Bool)

(assert (=> b!200248 m!226245))

(declare-fun m!226247 () Bool)

(assert (=> b!200252 m!226247))

(declare-fun m!226249 () Bool)

(assert (=> b!200252 m!226249))

(declare-fun m!226251 () Bool)

(assert (=> b!200252 m!226251))

(declare-fun m!226253 () Bool)

(assert (=> b!200258 m!226253))

(declare-fun m!226255 () Bool)

(assert (=> b!200258 m!226255))

(declare-fun m!226257 () Bool)

(assert (=> b!200258 m!226257))

(declare-fun m!226259 () Bool)

(assert (=> b!200258 m!226259))

(declare-fun m!226261 () Bool)

(assert (=> b!200258 m!226261))

(declare-fun m!226263 () Bool)

(assert (=> b!200258 m!226263))

(declare-fun m!226265 () Bool)

(assert (=> b!200258 m!226265))

(declare-fun m!226267 () Bool)

(assert (=> start!20332 m!226267))

(declare-fun m!226269 () Bool)

(assert (=> start!20332 m!226269))

(declare-fun m!226271 () Bool)

(assert (=> start!20332 m!226271))

(declare-fun m!226273 () Bool)

(assert (=> b!200249 m!226273))

(declare-fun m!226275 () Bool)

(assert (=> b!200249 m!226275))

(declare-fun m!226277 () Bool)

(assert (=> b!200249 m!226277))

(declare-fun m!226279 () Bool)

(assert (=> b!200249 m!226279))

(assert (=> b!200249 m!226277))

(declare-fun m!226281 () Bool)

(assert (=> b!200249 m!226281))

(declare-fun m!226283 () Bool)

(assert (=> b!200249 m!226283))

(declare-fun m!226285 () Bool)

(assert (=> b!200249 m!226285))

(declare-fun m!226287 () Bool)

(assert (=> b!200249 m!226287))

(declare-fun m!226289 () Bool)

(assert (=> b!200251 m!226289))

(check-sat (not b!200249) (not b!200255) tp_is_empty!4843 (not b!200251) (not start!20332) (not b!200252) (not b!200256) (not mapNonEmpty!8333) (not b!200258) b_and!11707 (not b_next!4987))
(check-sat b_and!11707 (not b_next!4987))
