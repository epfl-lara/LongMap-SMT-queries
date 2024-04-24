; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20898 () Bool)

(assert start!20898)

(declare-fun b_free!5527 () Bool)

(declare-fun b_next!5527 () Bool)

(assert (=> start!20898 (= b_free!5527 (not b_next!5527))))

(declare-fun tp!19624 () Bool)

(declare-fun b_and!12299 () Bool)

(assert (=> start!20898 (= tp!19624 b_and!12299)))

(declare-datatypes ((V!6833 0))(
  ( (V!6834 (val!2739 Int)) )
))
(declare-datatypes ((tuple2!4086 0))(
  ( (tuple2!4087 (_1!2054 (_ BitVec 64)) (_2!2054 V!6833)) )
))
(declare-fun lt!107322 () tuple2!4086)

(declare-datatypes ((List!2972 0))(
  ( (Nil!2969) (Cons!2968 (h!3610 tuple2!4086) (t!7897 List!2972)) )
))
(declare-datatypes ((ListLongMap!3001 0))(
  ( (ListLongMap!3002 (toList!1516 List!2972)) )
))
(declare-fun lt!107320 () ListLongMap!3001)

(declare-fun lt!107317 () tuple2!4086)

(declare-fun b!209816 () Bool)

(declare-fun lt!107314 () ListLongMap!3001)

(declare-fun e!136665 () Bool)

(declare-fun +!545 (ListLongMap!3001 tuple2!4086) ListLongMap!3001)

(assert (=> b!209816 (= e!136665 (= lt!107320 (+!545 (+!545 lt!107314 lt!107317) lt!107322)))))

(declare-fun lt!107316 () ListLongMap!3001)

(declare-fun lt!107321 () ListLongMap!3001)

(assert (=> b!209816 (= lt!107321 (+!545 (+!545 lt!107316 lt!107317) lt!107322))))

(declare-fun minValue!615 () V!6833)

(assert (=> b!209816 (= lt!107322 (tuple2!4087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun zeroValue!615 () V!6833)

(assert (=> b!209816 (= lt!107317 (tuple2!4087 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!209817 () Bool)

(declare-fun res!102302 () Bool)

(declare-fun e!136664 () Bool)

(assert (=> b!209817 (=> (not res!102302) (not e!136664))))

(declare-datatypes ((array!9973 0))(
  ( (array!9974 (arr!4736 (Array (_ BitVec 32) (_ BitVec 64))) (size!5061 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9973)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!209817 (= res!102302 (= (select (arr!4736 _keys!825) i!601) k0!843))))

(declare-fun b!209818 () Bool)

(declare-fun e!136663 () Bool)

(declare-fun e!136666 () Bool)

(declare-fun mapRes!9155 () Bool)

(assert (=> b!209818 (= e!136663 (and e!136666 mapRes!9155))))

(declare-fun condMapEmpty!9155 () Bool)

(declare-datatypes ((ValueCell!2351 0))(
  ( (ValueCellFull!2351 (v!4714 V!6833)) (EmptyCell!2351) )
))
(declare-datatypes ((array!9975 0))(
  ( (array!9976 (arr!4737 (Array (_ BitVec 32) ValueCell!2351)) (size!5062 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9975)

(declare-fun mapDefault!9155 () ValueCell!2351)

(assert (=> b!209818 (= condMapEmpty!9155 (= (arr!4737 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2351)) mapDefault!9155)))))

(declare-fun mapNonEmpty!9155 () Bool)

(declare-fun tp!19625 () Bool)

(declare-fun e!136667 () Bool)

(assert (=> mapNonEmpty!9155 (= mapRes!9155 (and tp!19625 e!136667))))

(declare-fun mapRest!9155 () (Array (_ BitVec 32) ValueCell!2351))

(declare-fun mapValue!9155 () ValueCell!2351)

(declare-fun mapKey!9155 () (_ BitVec 32))

(assert (=> mapNonEmpty!9155 (= (arr!4737 _values!649) (store mapRest!9155 mapKey!9155 mapValue!9155))))

(declare-fun mapIsEmpty!9155 () Bool)

(assert (=> mapIsEmpty!9155 mapRes!9155))

(declare-fun b!209819 () Bool)

(declare-fun res!102304 () Bool)

(assert (=> b!209819 (=> (not res!102304) (not e!136664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209819 (= res!102304 (validKeyInArray!0 k0!843))))

(declare-fun b!209820 () Bool)

(declare-fun res!102300 () Bool)

(assert (=> b!209820 (=> (not res!102300) (not e!136664))))

(assert (=> b!209820 (= res!102300 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5061 _keys!825))))))

(declare-fun b!209821 () Bool)

(declare-fun res!102303 () Bool)

(assert (=> b!209821 (=> (not res!102303) (not e!136664))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!209821 (= res!102303 (and (= (size!5062 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5061 _keys!825) (size!5062 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209822 () Bool)

(declare-fun tp_is_empty!5389 () Bool)

(assert (=> b!209822 (= e!136667 tp_is_empty!5389)))

(declare-fun res!102306 () Bool)

(assert (=> start!20898 (=> (not res!102306) (not e!136664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20898 (= res!102306 (validMask!0 mask!1149))))

(assert (=> start!20898 e!136664))

(declare-fun array_inv!3109 (array!9975) Bool)

(assert (=> start!20898 (and (array_inv!3109 _values!649) e!136663)))

(assert (=> start!20898 true))

(assert (=> start!20898 tp_is_empty!5389))

(declare-fun array_inv!3110 (array!9973) Bool)

(assert (=> start!20898 (array_inv!3110 _keys!825)))

(assert (=> start!20898 tp!19624))

(declare-fun b!209823 () Bool)

(assert (=> b!209823 (= e!136664 (not e!136665))))

(declare-fun res!102305 () Bool)

(assert (=> b!209823 (=> res!102305 e!136665)))

(assert (=> b!209823 (= res!102305 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1056 (array!9973 array!9975 (_ BitVec 32) (_ BitVec 32) V!6833 V!6833 (_ BitVec 32) Int) ListLongMap!3001)

(assert (=> b!209823 (= lt!107320 (getCurrentListMap!1056 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107319 () array!9975)

(assert (=> b!209823 (= lt!107321 (getCurrentListMap!1056 _keys!825 lt!107319 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107315 () ListLongMap!3001)

(assert (=> b!209823 (and (= lt!107316 lt!107315) (= lt!107315 lt!107316))))

(declare-fun v!520 () V!6833)

(assert (=> b!209823 (= lt!107315 (+!545 lt!107314 (tuple2!4087 k0!843 v!520)))))

(declare-datatypes ((Unit!6368 0))(
  ( (Unit!6369) )
))
(declare-fun lt!107318 () Unit!6368)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!197 (array!9973 array!9975 (_ BitVec 32) (_ BitVec 32) V!6833 V!6833 (_ BitVec 32) (_ BitVec 64) V!6833 (_ BitVec 32) Int) Unit!6368)

(assert (=> b!209823 (= lt!107318 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!197 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!479 (array!9973 array!9975 (_ BitVec 32) (_ BitVec 32) V!6833 V!6833 (_ BitVec 32) Int) ListLongMap!3001)

(assert (=> b!209823 (= lt!107316 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107319 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209823 (= lt!107319 (array!9976 (store (arr!4737 _values!649) i!601 (ValueCellFull!2351 v!520)) (size!5062 _values!649)))))

(assert (=> b!209823 (= lt!107314 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209824 () Bool)

(assert (=> b!209824 (= e!136666 tp_is_empty!5389)))

(declare-fun b!209825 () Bool)

(declare-fun res!102301 () Bool)

(assert (=> b!209825 (=> (not res!102301) (not e!136664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9973 (_ BitVec 32)) Bool)

(assert (=> b!209825 (= res!102301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209826 () Bool)

(declare-fun res!102299 () Bool)

(assert (=> b!209826 (=> (not res!102299) (not e!136664))))

(declare-datatypes ((List!2973 0))(
  ( (Nil!2970) (Cons!2969 (h!3611 (_ BitVec 64)) (t!7898 List!2973)) )
))
(declare-fun arrayNoDuplicates!0 (array!9973 (_ BitVec 32) List!2973) Bool)

(assert (=> b!209826 (= res!102299 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2970))))

(assert (= (and start!20898 res!102306) b!209821))

(assert (= (and b!209821 res!102303) b!209825))

(assert (= (and b!209825 res!102301) b!209826))

(assert (= (and b!209826 res!102299) b!209820))

(assert (= (and b!209820 res!102300) b!209819))

(assert (= (and b!209819 res!102304) b!209817))

(assert (= (and b!209817 res!102302) b!209823))

(assert (= (and b!209823 (not res!102305)) b!209816))

(assert (= (and b!209818 condMapEmpty!9155) mapIsEmpty!9155))

(assert (= (and b!209818 (not condMapEmpty!9155)) mapNonEmpty!9155))

(get-info :version)

(assert (= (and mapNonEmpty!9155 ((_ is ValueCellFull!2351) mapValue!9155)) b!209822))

(assert (= (and b!209818 ((_ is ValueCellFull!2351) mapDefault!9155)) b!209824))

(assert (= start!20898 b!209818))

(declare-fun m!237343 () Bool)

(assert (=> start!20898 m!237343))

(declare-fun m!237345 () Bool)

(assert (=> start!20898 m!237345))

(declare-fun m!237347 () Bool)

(assert (=> start!20898 m!237347))

(declare-fun m!237349 () Bool)

(assert (=> b!209819 m!237349))

(declare-fun m!237351 () Bool)

(assert (=> b!209826 m!237351))

(declare-fun m!237353 () Bool)

(assert (=> mapNonEmpty!9155 m!237353))

(declare-fun m!237355 () Bool)

(assert (=> b!209823 m!237355))

(declare-fun m!237357 () Bool)

(assert (=> b!209823 m!237357))

(declare-fun m!237359 () Bool)

(assert (=> b!209823 m!237359))

(declare-fun m!237361 () Bool)

(assert (=> b!209823 m!237361))

(declare-fun m!237363 () Bool)

(assert (=> b!209823 m!237363))

(declare-fun m!237365 () Bool)

(assert (=> b!209823 m!237365))

(declare-fun m!237367 () Bool)

(assert (=> b!209823 m!237367))

(declare-fun m!237369 () Bool)

(assert (=> b!209816 m!237369))

(assert (=> b!209816 m!237369))

(declare-fun m!237371 () Bool)

(assert (=> b!209816 m!237371))

(declare-fun m!237373 () Bool)

(assert (=> b!209816 m!237373))

(assert (=> b!209816 m!237373))

(declare-fun m!237375 () Bool)

(assert (=> b!209816 m!237375))

(declare-fun m!237377 () Bool)

(assert (=> b!209817 m!237377))

(declare-fun m!237379 () Bool)

(assert (=> b!209825 m!237379))

(check-sat (not b!209819) (not b!209826) (not start!20898) tp_is_empty!5389 (not b!209825) (not b!209816) (not b_next!5527) (not b!209823) b_and!12299 (not mapNonEmpty!9155))
(check-sat b_and!12299 (not b_next!5527))
(get-model)

(declare-fun d!57965 () Bool)

(assert (=> d!57965 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20898 d!57965))

(declare-fun d!57967 () Bool)

(assert (=> d!57967 (= (array_inv!3109 _values!649) (bvsge (size!5062 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20898 d!57967))

(declare-fun d!57969 () Bool)

(assert (=> d!57969 (= (array_inv!3110 _keys!825) (bvsge (size!5061 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20898 d!57969))

(declare-fun d!57971 () Bool)

(declare-fun res!102363 () Bool)

(declare-fun e!136715 () Bool)

(assert (=> d!57971 (=> res!102363 e!136715)))

(assert (=> d!57971 (= res!102363 (bvsge #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(assert (=> d!57971 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2970) e!136715)))

(declare-fun b!209903 () Bool)

(declare-fun e!136714 () Bool)

(declare-fun e!136716 () Bool)

(assert (=> b!209903 (= e!136714 e!136716)))

(declare-fun c!35500 () Bool)

(assert (=> b!209903 (= c!35500 (validKeyInArray!0 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209904 () Bool)

(assert (=> b!209904 (= e!136715 e!136714)))

(declare-fun res!102362 () Bool)

(assert (=> b!209904 (=> (not res!102362) (not e!136714))))

(declare-fun e!136713 () Bool)

(assert (=> b!209904 (= res!102362 (not e!136713))))

(declare-fun res!102361 () Bool)

(assert (=> b!209904 (=> (not res!102361) (not e!136713))))

(assert (=> b!209904 (= res!102361 (validKeyInArray!0 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209905 () Bool)

(declare-fun call!19811 () Bool)

(assert (=> b!209905 (= e!136716 call!19811)))

(declare-fun b!209906 () Bool)

(assert (=> b!209906 (= e!136716 call!19811)))

(declare-fun bm!19808 () Bool)

(assert (=> bm!19808 (= call!19811 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35500 (Cons!2969 (select (arr!4736 _keys!825) #b00000000000000000000000000000000) Nil!2970) Nil!2970)))))

(declare-fun b!209907 () Bool)

(declare-fun contains!1375 (List!2973 (_ BitVec 64)) Bool)

(assert (=> b!209907 (= e!136713 (contains!1375 Nil!2970 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57971 (not res!102363)) b!209904))

(assert (= (and b!209904 res!102361) b!209907))

(assert (= (and b!209904 res!102362) b!209903))

(assert (= (and b!209903 c!35500) b!209906))

(assert (= (and b!209903 (not c!35500)) b!209905))

(assert (= (or b!209906 b!209905) bm!19808))

(declare-fun m!237457 () Bool)

(assert (=> b!209903 m!237457))

(assert (=> b!209903 m!237457))

(declare-fun m!237459 () Bool)

(assert (=> b!209903 m!237459))

(assert (=> b!209904 m!237457))

(assert (=> b!209904 m!237457))

(assert (=> b!209904 m!237459))

(assert (=> bm!19808 m!237457))

(declare-fun m!237461 () Bool)

(assert (=> bm!19808 m!237461))

(assert (=> b!209907 m!237457))

(assert (=> b!209907 m!237457))

(declare-fun m!237463 () Bool)

(assert (=> b!209907 m!237463))

(assert (=> b!209826 d!57971))

(declare-fun d!57973 () Bool)

(assert (=> d!57973 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209819 d!57973))

(declare-fun b!209917 () Bool)

(declare-fun e!136725 () Bool)

(declare-fun call!19814 () Bool)

(assert (=> b!209917 (= e!136725 call!19814)))

(declare-fun b!209918 () Bool)

(declare-fun e!136723 () Bool)

(assert (=> b!209918 (= e!136725 e!136723)))

(declare-fun lt!107383 () (_ BitVec 64))

(assert (=> b!209918 (= lt!107383 (select (arr!4736 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107384 () Unit!6368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!9973 (_ BitVec 64) (_ BitVec 32)) Unit!6368)

(assert (=> b!209918 (= lt!107384 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!107383 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!9973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!209918 (arrayContainsKey!0 _keys!825 lt!107383 #b00000000000000000000000000000000)))

(declare-fun lt!107385 () Unit!6368)

(assert (=> b!209918 (= lt!107385 lt!107384)))

(declare-fun res!102368 () Bool)

(declare-datatypes ((SeekEntryResult!694 0))(
  ( (MissingZero!694 (index!4946 (_ BitVec 32))) (Found!694 (index!4947 (_ BitVec 32))) (Intermediate!694 (undefined!1506 Bool) (index!4948 (_ BitVec 32)) (x!21983 (_ BitVec 32))) (Undefined!694) (MissingVacant!694 (index!4949 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!9973 (_ BitVec 32)) SeekEntryResult!694)

(assert (=> b!209918 (= res!102368 (= (seekEntryOrOpen!0 (select (arr!4736 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!694 #b00000000000000000000000000000000)))))

(assert (=> b!209918 (=> (not res!102368) (not e!136723))))

(declare-fun bm!19811 () Bool)

(assert (=> bm!19811 (= call!19814 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!209919 () Bool)

(declare-fun e!136724 () Bool)

(assert (=> b!209919 (= e!136724 e!136725)))

(declare-fun c!35503 () Bool)

(assert (=> b!209919 (= c!35503 (validKeyInArray!0 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57975 () Bool)

(declare-fun res!102369 () Bool)

(assert (=> d!57975 (=> res!102369 e!136724)))

(assert (=> d!57975 (= res!102369 (bvsge #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(assert (=> d!57975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!136724)))

(declare-fun b!209916 () Bool)

(assert (=> b!209916 (= e!136723 call!19814)))

(assert (= (and d!57975 (not res!102369)) b!209919))

(assert (= (and b!209919 c!35503) b!209918))

(assert (= (and b!209919 (not c!35503)) b!209917))

(assert (= (and b!209918 res!102368) b!209916))

(assert (= (or b!209916 b!209917) bm!19811))

(assert (=> b!209918 m!237457))

(declare-fun m!237465 () Bool)

(assert (=> b!209918 m!237465))

(declare-fun m!237467 () Bool)

(assert (=> b!209918 m!237467))

(assert (=> b!209918 m!237457))

(declare-fun m!237469 () Bool)

(assert (=> b!209918 m!237469))

(declare-fun m!237471 () Bool)

(assert (=> bm!19811 m!237471))

(assert (=> b!209919 m!237457))

(assert (=> b!209919 m!237457))

(assert (=> b!209919 m!237459))

(assert (=> b!209825 d!57975))

(declare-fun d!57977 () Bool)

(declare-fun e!136728 () Bool)

(assert (=> d!57977 e!136728))

(declare-fun res!102374 () Bool)

(assert (=> d!57977 (=> (not res!102374) (not e!136728))))

(declare-fun lt!107397 () ListLongMap!3001)

(declare-fun contains!1376 (ListLongMap!3001 (_ BitVec 64)) Bool)

(assert (=> d!57977 (= res!102374 (contains!1376 lt!107397 (_1!2054 lt!107322)))))

(declare-fun lt!107395 () List!2972)

(assert (=> d!57977 (= lt!107397 (ListLongMap!3002 lt!107395))))

(declare-fun lt!107396 () Unit!6368)

(declare-fun lt!107394 () Unit!6368)

(assert (=> d!57977 (= lt!107396 lt!107394)))

(declare-datatypes ((Option!255 0))(
  ( (Some!254 (v!4720 V!6833)) (None!253) )
))
(declare-fun getValueByKey!249 (List!2972 (_ BitVec 64)) Option!255)

(assert (=> d!57977 (= (getValueByKey!249 lt!107395 (_1!2054 lt!107322)) (Some!254 (_2!2054 lt!107322)))))

(declare-fun lemmaContainsTupThenGetReturnValue!136 (List!2972 (_ BitVec 64) V!6833) Unit!6368)

(assert (=> d!57977 (= lt!107394 (lemmaContainsTupThenGetReturnValue!136 lt!107395 (_1!2054 lt!107322) (_2!2054 lt!107322)))))

(declare-fun insertStrictlySorted!139 (List!2972 (_ BitVec 64) V!6833) List!2972)

(assert (=> d!57977 (= lt!107395 (insertStrictlySorted!139 (toList!1516 (+!545 lt!107314 lt!107317)) (_1!2054 lt!107322) (_2!2054 lt!107322)))))

(assert (=> d!57977 (= (+!545 (+!545 lt!107314 lt!107317) lt!107322) lt!107397)))

(declare-fun b!209924 () Bool)

(declare-fun res!102375 () Bool)

(assert (=> b!209924 (=> (not res!102375) (not e!136728))))

(assert (=> b!209924 (= res!102375 (= (getValueByKey!249 (toList!1516 lt!107397) (_1!2054 lt!107322)) (Some!254 (_2!2054 lt!107322))))))

(declare-fun b!209925 () Bool)

(declare-fun contains!1377 (List!2972 tuple2!4086) Bool)

(assert (=> b!209925 (= e!136728 (contains!1377 (toList!1516 lt!107397) lt!107322))))

(assert (= (and d!57977 res!102374) b!209924))

(assert (= (and b!209924 res!102375) b!209925))

(declare-fun m!237473 () Bool)

(assert (=> d!57977 m!237473))

(declare-fun m!237475 () Bool)

(assert (=> d!57977 m!237475))

(declare-fun m!237477 () Bool)

(assert (=> d!57977 m!237477))

(declare-fun m!237479 () Bool)

(assert (=> d!57977 m!237479))

(declare-fun m!237481 () Bool)

(assert (=> b!209924 m!237481))

(declare-fun m!237483 () Bool)

(assert (=> b!209925 m!237483))

(assert (=> b!209816 d!57977))

(declare-fun d!57979 () Bool)

(declare-fun e!136729 () Bool)

(assert (=> d!57979 e!136729))

(declare-fun res!102376 () Bool)

(assert (=> d!57979 (=> (not res!102376) (not e!136729))))

(declare-fun lt!107401 () ListLongMap!3001)

(assert (=> d!57979 (= res!102376 (contains!1376 lt!107401 (_1!2054 lt!107317)))))

(declare-fun lt!107399 () List!2972)

(assert (=> d!57979 (= lt!107401 (ListLongMap!3002 lt!107399))))

(declare-fun lt!107400 () Unit!6368)

(declare-fun lt!107398 () Unit!6368)

(assert (=> d!57979 (= lt!107400 lt!107398)))

(assert (=> d!57979 (= (getValueByKey!249 lt!107399 (_1!2054 lt!107317)) (Some!254 (_2!2054 lt!107317)))))

(assert (=> d!57979 (= lt!107398 (lemmaContainsTupThenGetReturnValue!136 lt!107399 (_1!2054 lt!107317) (_2!2054 lt!107317)))))

(assert (=> d!57979 (= lt!107399 (insertStrictlySorted!139 (toList!1516 lt!107314) (_1!2054 lt!107317) (_2!2054 lt!107317)))))

(assert (=> d!57979 (= (+!545 lt!107314 lt!107317) lt!107401)))

(declare-fun b!209926 () Bool)

(declare-fun res!102377 () Bool)

(assert (=> b!209926 (=> (not res!102377) (not e!136729))))

(assert (=> b!209926 (= res!102377 (= (getValueByKey!249 (toList!1516 lt!107401) (_1!2054 lt!107317)) (Some!254 (_2!2054 lt!107317))))))

(declare-fun b!209927 () Bool)

(assert (=> b!209927 (= e!136729 (contains!1377 (toList!1516 lt!107401) lt!107317))))

(assert (= (and d!57979 res!102376) b!209926))

(assert (= (and b!209926 res!102377) b!209927))

(declare-fun m!237485 () Bool)

(assert (=> d!57979 m!237485))

(declare-fun m!237487 () Bool)

(assert (=> d!57979 m!237487))

(declare-fun m!237489 () Bool)

(assert (=> d!57979 m!237489))

(declare-fun m!237491 () Bool)

(assert (=> d!57979 m!237491))

(declare-fun m!237493 () Bool)

(assert (=> b!209926 m!237493))

(declare-fun m!237495 () Bool)

(assert (=> b!209927 m!237495))

(assert (=> b!209816 d!57979))

(declare-fun d!57981 () Bool)

(declare-fun e!136730 () Bool)

(assert (=> d!57981 e!136730))

(declare-fun res!102378 () Bool)

(assert (=> d!57981 (=> (not res!102378) (not e!136730))))

(declare-fun lt!107405 () ListLongMap!3001)

(assert (=> d!57981 (= res!102378 (contains!1376 lt!107405 (_1!2054 lt!107322)))))

(declare-fun lt!107403 () List!2972)

(assert (=> d!57981 (= lt!107405 (ListLongMap!3002 lt!107403))))

(declare-fun lt!107404 () Unit!6368)

(declare-fun lt!107402 () Unit!6368)

(assert (=> d!57981 (= lt!107404 lt!107402)))

(assert (=> d!57981 (= (getValueByKey!249 lt!107403 (_1!2054 lt!107322)) (Some!254 (_2!2054 lt!107322)))))

(assert (=> d!57981 (= lt!107402 (lemmaContainsTupThenGetReturnValue!136 lt!107403 (_1!2054 lt!107322) (_2!2054 lt!107322)))))

(assert (=> d!57981 (= lt!107403 (insertStrictlySorted!139 (toList!1516 (+!545 lt!107316 lt!107317)) (_1!2054 lt!107322) (_2!2054 lt!107322)))))

(assert (=> d!57981 (= (+!545 (+!545 lt!107316 lt!107317) lt!107322) lt!107405)))

(declare-fun b!209928 () Bool)

(declare-fun res!102379 () Bool)

(assert (=> b!209928 (=> (not res!102379) (not e!136730))))

(assert (=> b!209928 (= res!102379 (= (getValueByKey!249 (toList!1516 lt!107405) (_1!2054 lt!107322)) (Some!254 (_2!2054 lt!107322))))))

(declare-fun b!209929 () Bool)

(assert (=> b!209929 (= e!136730 (contains!1377 (toList!1516 lt!107405) lt!107322))))

(assert (= (and d!57981 res!102378) b!209928))

(assert (= (and b!209928 res!102379) b!209929))

(declare-fun m!237497 () Bool)

(assert (=> d!57981 m!237497))

(declare-fun m!237499 () Bool)

(assert (=> d!57981 m!237499))

(declare-fun m!237501 () Bool)

(assert (=> d!57981 m!237501))

(declare-fun m!237503 () Bool)

(assert (=> d!57981 m!237503))

(declare-fun m!237505 () Bool)

(assert (=> b!209928 m!237505))

(declare-fun m!237507 () Bool)

(assert (=> b!209929 m!237507))

(assert (=> b!209816 d!57981))

(declare-fun d!57983 () Bool)

(declare-fun e!136731 () Bool)

(assert (=> d!57983 e!136731))

(declare-fun res!102380 () Bool)

(assert (=> d!57983 (=> (not res!102380) (not e!136731))))

(declare-fun lt!107409 () ListLongMap!3001)

(assert (=> d!57983 (= res!102380 (contains!1376 lt!107409 (_1!2054 lt!107317)))))

(declare-fun lt!107407 () List!2972)

(assert (=> d!57983 (= lt!107409 (ListLongMap!3002 lt!107407))))

(declare-fun lt!107408 () Unit!6368)

(declare-fun lt!107406 () Unit!6368)

(assert (=> d!57983 (= lt!107408 lt!107406)))

(assert (=> d!57983 (= (getValueByKey!249 lt!107407 (_1!2054 lt!107317)) (Some!254 (_2!2054 lt!107317)))))

(assert (=> d!57983 (= lt!107406 (lemmaContainsTupThenGetReturnValue!136 lt!107407 (_1!2054 lt!107317) (_2!2054 lt!107317)))))

(assert (=> d!57983 (= lt!107407 (insertStrictlySorted!139 (toList!1516 lt!107316) (_1!2054 lt!107317) (_2!2054 lt!107317)))))

(assert (=> d!57983 (= (+!545 lt!107316 lt!107317) lt!107409)))

(declare-fun b!209930 () Bool)

(declare-fun res!102381 () Bool)

(assert (=> b!209930 (=> (not res!102381) (not e!136731))))

(assert (=> b!209930 (= res!102381 (= (getValueByKey!249 (toList!1516 lt!107409) (_1!2054 lt!107317)) (Some!254 (_2!2054 lt!107317))))))

(declare-fun b!209931 () Bool)

(assert (=> b!209931 (= e!136731 (contains!1377 (toList!1516 lt!107409) lt!107317))))

(assert (= (and d!57983 res!102380) b!209930))

(assert (= (and b!209930 res!102381) b!209931))

(declare-fun m!237509 () Bool)

(assert (=> d!57983 m!237509))

(declare-fun m!237511 () Bool)

(assert (=> d!57983 m!237511))

(declare-fun m!237513 () Bool)

(assert (=> d!57983 m!237513))

(declare-fun m!237515 () Bool)

(assert (=> d!57983 m!237515))

(declare-fun m!237517 () Bool)

(assert (=> b!209930 m!237517))

(declare-fun m!237519 () Bool)

(assert (=> b!209931 m!237519))

(assert (=> b!209816 d!57983))

(declare-fun b!209956 () Bool)

(declare-fun res!102392 () Bool)

(declare-fun e!136751 () Bool)

(assert (=> b!209956 (=> (not res!102392) (not e!136751))))

(declare-fun lt!107428 () ListLongMap!3001)

(assert (=> b!209956 (= res!102392 (not (contains!1376 lt!107428 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!209957 () Bool)

(declare-fun e!136749 () Bool)

(assert (=> b!209957 (= e!136749 (validKeyInArray!0 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209957 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun e!136746 () Bool)

(declare-fun b!209958 () Bool)

(assert (=> b!209958 (= e!136746 (= lt!107428 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107319 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun d!57985 () Bool)

(assert (=> d!57985 e!136751))

(declare-fun res!102390 () Bool)

(assert (=> d!57985 (=> (not res!102390) (not e!136751))))

(assert (=> d!57985 (= res!102390 (not (contains!1376 lt!107428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!136752 () ListLongMap!3001)

(assert (=> d!57985 (= lt!107428 e!136752)))

(declare-fun c!35515 () Bool)

(assert (=> d!57985 (= c!35515 (bvsge #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(assert (=> d!57985 (validMask!0 mask!1149)))

(assert (=> d!57985 (= (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107319 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107428)))

(declare-fun b!209959 () Bool)

(assert (=> b!209959 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(assert (=> b!209959 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5062 lt!107319)))))

(declare-fun e!136748 () Bool)

(declare-fun apply!190 (ListLongMap!3001 (_ BitVec 64)) V!6833)

(declare-fun get!2548 (ValueCell!2351 V!6833) V!6833)

(declare-fun dynLambda!533 (Int (_ BitVec 64)) V!6833)

(assert (=> b!209959 (= e!136748 (= (apply!190 lt!107428 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)) (get!2548 (select (arr!4737 lt!107319) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!209960 () Bool)

(declare-fun e!136747 () Bool)

(assert (=> b!209960 (= e!136747 e!136748)))

(assert (=> b!209960 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(declare-fun res!102391 () Bool)

(assert (=> b!209960 (= res!102391 (contains!1376 lt!107428 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209960 (=> (not res!102391) (not e!136748))))

(declare-fun b!209961 () Bool)

(assert (=> b!209961 (= e!136751 e!136747)))

(declare-fun c!35512 () Bool)

(assert (=> b!209961 (= c!35512 e!136749)))

(declare-fun res!102393 () Bool)

(assert (=> b!209961 (=> (not res!102393) (not e!136749))))

(assert (=> b!209961 (= res!102393 (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(declare-fun b!209962 () Bool)

(declare-fun e!136750 () ListLongMap!3001)

(declare-fun call!19817 () ListLongMap!3001)

(assert (=> b!209962 (= e!136750 call!19817)))

(declare-fun b!209963 () Bool)

(assert (=> b!209963 (= e!136747 e!136746)))

(declare-fun c!35514 () Bool)

(assert (=> b!209963 (= c!35514 (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(declare-fun bm!19814 () Bool)

(assert (=> bm!19814 (= call!19817 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107319 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!209964 () Bool)

(declare-fun lt!107427 () Unit!6368)

(declare-fun lt!107426 () Unit!6368)

(assert (=> b!209964 (= lt!107427 lt!107426)))

(declare-fun lt!107424 () ListLongMap!3001)

(declare-fun lt!107425 () (_ BitVec 64))

(declare-fun lt!107430 () V!6833)

(declare-fun lt!107429 () (_ BitVec 64))

(assert (=> b!209964 (not (contains!1376 (+!545 lt!107424 (tuple2!4087 lt!107429 lt!107430)) lt!107425))))

(declare-fun addStillNotContains!101 (ListLongMap!3001 (_ BitVec 64) V!6833 (_ BitVec 64)) Unit!6368)

(assert (=> b!209964 (= lt!107426 (addStillNotContains!101 lt!107424 lt!107429 lt!107430 lt!107425))))

(assert (=> b!209964 (= lt!107425 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!209964 (= lt!107430 (get!2548 (select (arr!4737 lt!107319) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209964 (= lt!107429 (select (arr!4736 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209964 (= lt!107424 call!19817)))

(assert (=> b!209964 (= e!136750 (+!545 call!19817 (tuple2!4087 (select (arr!4736 _keys!825) #b00000000000000000000000000000000) (get!2548 (select (arr!4737 lt!107319) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!209965 () Bool)

(assert (=> b!209965 (= e!136752 e!136750)))

(declare-fun c!35513 () Bool)

(assert (=> b!209965 (= c!35513 (validKeyInArray!0 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209966 () Bool)

(declare-fun isEmpty!497 (ListLongMap!3001) Bool)

(assert (=> b!209966 (= e!136746 (isEmpty!497 lt!107428))))

(declare-fun b!209967 () Bool)

(assert (=> b!209967 (= e!136752 (ListLongMap!3002 Nil!2969))))

(assert (= (and d!57985 c!35515) b!209967))

(assert (= (and d!57985 (not c!35515)) b!209965))

(assert (= (and b!209965 c!35513) b!209964))

(assert (= (and b!209965 (not c!35513)) b!209962))

(assert (= (or b!209964 b!209962) bm!19814))

(assert (= (and d!57985 res!102390) b!209956))

(assert (= (and b!209956 res!102392) b!209961))

(assert (= (and b!209961 res!102393) b!209957))

(assert (= (and b!209961 c!35512) b!209960))

(assert (= (and b!209961 (not c!35512)) b!209963))

(assert (= (and b!209960 res!102391) b!209959))

(assert (= (and b!209963 c!35514) b!209958))

(assert (= (and b!209963 (not c!35514)) b!209966))

(declare-fun b_lambda!7585 () Bool)

(assert (=> (not b_lambda!7585) (not b!209959)))

(declare-fun t!7902 () Bool)

(declare-fun tb!2885 () Bool)

(assert (=> (and start!20898 (= defaultEntry!657 defaultEntry!657) t!7902) tb!2885))

(declare-fun result!4959 () Bool)

(assert (=> tb!2885 (= result!4959 tp_is_empty!5389)))

(assert (=> b!209959 t!7902))

(declare-fun b_and!12305 () Bool)

(assert (= b_and!12299 (and (=> t!7902 result!4959) b_and!12305)))

(declare-fun b_lambda!7587 () Bool)

(assert (=> (not b_lambda!7587) (not b!209964)))

(assert (=> b!209964 t!7902))

(declare-fun b_and!12307 () Bool)

(assert (= b_and!12305 (and (=> t!7902 result!4959) b_and!12307)))

(declare-fun m!237521 () Bool)

(assert (=> b!209958 m!237521))

(declare-fun m!237523 () Bool)

(assert (=> b!209959 m!237523))

(declare-fun m!237525 () Bool)

(assert (=> b!209959 m!237525))

(declare-fun m!237527 () Bool)

(assert (=> b!209959 m!237527))

(assert (=> b!209959 m!237457))

(declare-fun m!237529 () Bool)

(assert (=> b!209959 m!237529))

(assert (=> b!209959 m!237457))

(assert (=> b!209959 m!237523))

(assert (=> b!209959 m!237525))

(assert (=> bm!19814 m!237521))

(declare-fun m!237531 () Bool)

(assert (=> b!209956 m!237531))

(assert (=> b!209960 m!237457))

(assert (=> b!209960 m!237457))

(declare-fun m!237533 () Bool)

(assert (=> b!209960 m!237533))

(assert (=> b!209957 m!237457))

(assert (=> b!209957 m!237457))

(assert (=> b!209957 m!237459))

(assert (=> b!209965 m!237457))

(assert (=> b!209965 m!237457))

(assert (=> b!209965 m!237459))

(declare-fun m!237535 () Bool)

(assert (=> d!57985 m!237535))

(assert (=> d!57985 m!237343))

(assert (=> b!209964 m!237523))

(assert (=> b!209964 m!237525))

(assert (=> b!209964 m!237527))

(declare-fun m!237537 () Bool)

(assert (=> b!209964 m!237537))

(declare-fun m!237539 () Bool)

(assert (=> b!209964 m!237539))

(assert (=> b!209964 m!237457))

(declare-fun m!237541 () Bool)

(assert (=> b!209964 m!237541))

(assert (=> b!209964 m!237523))

(assert (=> b!209964 m!237541))

(declare-fun m!237543 () Bool)

(assert (=> b!209964 m!237543))

(assert (=> b!209964 m!237525))

(declare-fun m!237545 () Bool)

(assert (=> b!209966 m!237545))

(assert (=> b!209823 d!57985))

(declare-fun b!209970 () Bool)

(declare-fun res!102396 () Bool)

(declare-fun e!136758 () Bool)

(assert (=> b!209970 (=> (not res!102396) (not e!136758))))

(declare-fun lt!107435 () ListLongMap!3001)

(assert (=> b!209970 (= res!102396 (not (contains!1376 lt!107435 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!209971 () Bool)

(declare-fun e!136756 () Bool)

(assert (=> b!209971 (= e!136756 (validKeyInArray!0 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209971 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!209972 () Bool)

(declare-fun e!136753 () Bool)

(assert (=> b!209972 (= e!136753 (= lt!107435 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun d!57987 () Bool)

(assert (=> d!57987 e!136758))

(declare-fun res!102394 () Bool)

(assert (=> d!57987 (=> (not res!102394) (not e!136758))))

(assert (=> d!57987 (= res!102394 (not (contains!1376 lt!107435 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!136759 () ListLongMap!3001)

(assert (=> d!57987 (= lt!107435 e!136759)))

(declare-fun c!35519 () Bool)

(assert (=> d!57987 (= c!35519 (bvsge #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(assert (=> d!57987 (validMask!0 mask!1149)))

(assert (=> d!57987 (= (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107435)))

(declare-fun b!209973 () Bool)

(assert (=> b!209973 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(assert (=> b!209973 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5062 _values!649)))))

(declare-fun e!136755 () Bool)

(assert (=> b!209973 (= e!136755 (= (apply!190 lt!107435 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)) (get!2548 (select (arr!4737 _values!649) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!209974 () Bool)

(declare-fun e!136754 () Bool)

(assert (=> b!209974 (= e!136754 e!136755)))

(assert (=> b!209974 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(declare-fun res!102395 () Bool)

(assert (=> b!209974 (= res!102395 (contains!1376 lt!107435 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!209974 (=> (not res!102395) (not e!136755))))

(declare-fun b!209975 () Bool)

(assert (=> b!209975 (= e!136758 e!136754)))

(declare-fun c!35516 () Bool)

(assert (=> b!209975 (= c!35516 e!136756)))

(declare-fun res!102397 () Bool)

(assert (=> b!209975 (=> (not res!102397) (not e!136756))))

(assert (=> b!209975 (= res!102397 (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(declare-fun b!209976 () Bool)

(declare-fun e!136757 () ListLongMap!3001)

(declare-fun call!19818 () ListLongMap!3001)

(assert (=> b!209976 (= e!136757 call!19818)))

(declare-fun b!209977 () Bool)

(assert (=> b!209977 (= e!136754 e!136753)))

(declare-fun c!35518 () Bool)

(assert (=> b!209977 (= c!35518 (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(declare-fun bm!19815 () Bool)

(assert (=> bm!19815 (= call!19818 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!209978 () Bool)

(declare-fun lt!107434 () Unit!6368)

(declare-fun lt!107433 () Unit!6368)

(assert (=> b!209978 (= lt!107434 lt!107433)))

(declare-fun lt!107431 () ListLongMap!3001)

(declare-fun lt!107432 () (_ BitVec 64))

(declare-fun lt!107436 () (_ BitVec 64))

(declare-fun lt!107437 () V!6833)

(assert (=> b!209978 (not (contains!1376 (+!545 lt!107431 (tuple2!4087 lt!107436 lt!107437)) lt!107432))))

(assert (=> b!209978 (= lt!107433 (addStillNotContains!101 lt!107431 lt!107436 lt!107437 lt!107432))))

(assert (=> b!209978 (= lt!107432 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!209978 (= lt!107437 (get!2548 (select (arr!4737 _values!649) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209978 (= lt!107436 (select (arr!4736 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!209978 (= lt!107431 call!19818)))

(assert (=> b!209978 (= e!136757 (+!545 call!19818 (tuple2!4087 (select (arr!4736 _keys!825) #b00000000000000000000000000000000) (get!2548 (select (arr!4737 _values!649) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!209979 () Bool)

(assert (=> b!209979 (= e!136759 e!136757)))

(declare-fun c!35517 () Bool)

(assert (=> b!209979 (= c!35517 (validKeyInArray!0 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!209980 () Bool)

(assert (=> b!209980 (= e!136753 (isEmpty!497 lt!107435))))

(declare-fun b!209981 () Bool)

(assert (=> b!209981 (= e!136759 (ListLongMap!3002 Nil!2969))))

(assert (= (and d!57987 c!35519) b!209981))

(assert (= (and d!57987 (not c!35519)) b!209979))

(assert (= (and b!209979 c!35517) b!209978))

(assert (= (and b!209979 (not c!35517)) b!209976))

(assert (= (or b!209978 b!209976) bm!19815))

(assert (= (and d!57987 res!102394) b!209970))

(assert (= (and b!209970 res!102396) b!209975))

(assert (= (and b!209975 res!102397) b!209971))

(assert (= (and b!209975 c!35516) b!209974))

(assert (= (and b!209975 (not c!35516)) b!209977))

(assert (= (and b!209974 res!102395) b!209973))

(assert (= (and b!209977 c!35518) b!209972))

(assert (= (and b!209977 (not c!35518)) b!209980))

(declare-fun b_lambda!7589 () Bool)

(assert (=> (not b_lambda!7589) (not b!209973)))

(assert (=> b!209973 t!7902))

(declare-fun b_and!12309 () Bool)

(assert (= b_and!12307 (and (=> t!7902 result!4959) b_and!12309)))

(declare-fun b_lambda!7591 () Bool)

(assert (=> (not b_lambda!7591) (not b!209978)))

(assert (=> b!209978 t!7902))

(declare-fun b_and!12311 () Bool)

(assert (= b_and!12309 (and (=> t!7902 result!4959) b_and!12311)))

(declare-fun m!237547 () Bool)

(assert (=> b!209972 m!237547))

(declare-fun m!237549 () Bool)

(assert (=> b!209973 m!237549))

(assert (=> b!209973 m!237525))

(declare-fun m!237551 () Bool)

(assert (=> b!209973 m!237551))

(assert (=> b!209973 m!237457))

(declare-fun m!237553 () Bool)

(assert (=> b!209973 m!237553))

(assert (=> b!209973 m!237457))

(assert (=> b!209973 m!237549))

(assert (=> b!209973 m!237525))

(assert (=> bm!19815 m!237547))

(declare-fun m!237555 () Bool)

(assert (=> b!209970 m!237555))

(assert (=> b!209974 m!237457))

(assert (=> b!209974 m!237457))

(declare-fun m!237557 () Bool)

(assert (=> b!209974 m!237557))

(assert (=> b!209971 m!237457))

(assert (=> b!209971 m!237457))

(assert (=> b!209971 m!237459))

(assert (=> b!209979 m!237457))

(assert (=> b!209979 m!237457))

(assert (=> b!209979 m!237459))

(declare-fun m!237559 () Bool)

(assert (=> d!57987 m!237559))

(assert (=> d!57987 m!237343))

(assert (=> b!209978 m!237549))

(assert (=> b!209978 m!237525))

(assert (=> b!209978 m!237551))

(declare-fun m!237561 () Bool)

(assert (=> b!209978 m!237561))

(declare-fun m!237563 () Bool)

(assert (=> b!209978 m!237563))

(assert (=> b!209978 m!237457))

(declare-fun m!237565 () Bool)

(assert (=> b!209978 m!237565))

(assert (=> b!209978 m!237549))

(assert (=> b!209978 m!237565))

(declare-fun m!237567 () Bool)

(assert (=> b!209978 m!237567))

(assert (=> b!209978 m!237525))

(declare-fun m!237569 () Bool)

(assert (=> b!209980 m!237569))

(assert (=> b!209823 d!57987))

(declare-fun d!57989 () Bool)

(declare-fun e!136760 () Bool)

(assert (=> d!57989 e!136760))

(declare-fun res!102398 () Bool)

(assert (=> d!57989 (=> (not res!102398) (not e!136760))))

(declare-fun lt!107441 () ListLongMap!3001)

(assert (=> d!57989 (= res!102398 (contains!1376 lt!107441 (_1!2054 (tuple2!4087 k0!843 v!520))))))

(declare-fun lt!107439 () List!2972)

(assert (=> d!57989 (= lt!107441 (ListLongMap!3002 lt!107439))))

(declare-fun lt!107440 () Unit!6368)

(declare-fun lt!107438 () Unit!6368)

(assert (=> d!57989 (= lt!107440 lt!107438)))

(assert (=> d!57989 (= (getValueByKey!249 lt!107439 (_1!2054 (tuple2!4087 k0!843 v!520))) (Some!254 (_2!2054 (tuple2!4087 k0!843 v!520))))))

(assert (=> d!57989 (= lt!107438 (lemmaContainsTupThenGetReturnValue!136 lt!107439 (_1!2054 (tuple2!4087 k0!843 v!520)) (_2!2054 (tuple2!4087 k0!843 v!520))))))

(assert (=> d!57989 (= lt!107439 (insertStrictlySorted!139 (toList!1516 lt!107314) (_1!2054 (tuple2!4087 k0!843 v!520)) (_2!2054 (tuple2!4087 k0!843 v!520))))))

(assert (=> d!57989 (= (+!545 lt!107314 (tuple2!4087 k0!843 v!520)) lt!107441)))

(declare-fun b!209982 () Bool)

(declare-fun res!102399 () Bool)

(assert (=> b!209982 (=> (not res!102399) (not e!136760))))

(assert (=> b!209982 (= res!102399 (= (getValueByKey!249 (toList!1516 lt!107441) (_1!2054 (tuple2!4087 k0!843 v!520))) (Some!254 (_2!2054 (tuple2!4087 k0!843 v!520)))))))

(declare-fun b!209983 () Bool)

(assert (=> b!209983 (= e!136760 (contains!1377 (toList!1516 lt!107441) (tuple2!4087 k0!843 v!520)))))

(assert (= (and d!57989 res!102398) b!209982))

(assert (= (and b!209982 res!102399) b!209983))

(declare-fun m!237571 () Bool)

(assert (=> d!57989 m!237571))

(declare-fun m!237573 () Bool)

(assert (=> d!57989 m!237573))

(declare-fun m!237575 () Bool)

(assert (=> d!57989 m!237575))

(declare-fun m!237577 () Bool)

(assert (=> d!57989 m!237577))

(declare-fun m!237579 () Bool)

(assert (=> b!209982 m!237579))

(declare-fun m!237581 () Bool)

(assert (=> b!209983 m!237581))

(assert (=> b!209823 d!57989))

(declare-fun b!210026 () Bool)

(declare-fun e!136794 () Bool)

(declare-fun e!136788 () Bool)

(assert (=> b!210026 (= e!136794 e!136788)))

(declare-fun res!102421 () Bool)

(assert (=> b!210026 (=> (not res!102421) (not e!136788))))

(declare-fun lt!107490 () ListLongMap!3001)

(assert (=> b!210026 (= res!102421 (contains!1376 lt!107490 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(declare-fun b!210027 () Bool)

(declare-fun e!136787 () Bool)

(assert (=> b!210027 (= e!136787 (validKeyInArray!0 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210028 () Bool)

(declare-fun e!136795 () Bool)

(assert (=> b!210028 (= e!136795 (validKeyInArray!0 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210029 () Bool)

(declare-fun c!35534 () Bool)

(assert (=> b!210029 (= c!35534 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!136792 () ListLongMap!3001)

(declare-fun e!136790 () ListLongMap!3001)

(assert (=> b!210029 (= e!136792 e!136790)))

(declare-fun b!210030 () Bool)

(declare-fun call!19839 () ListLongMap!3001)

(assert (=> b!210030 (= e!136790 call!19839)))

(declare-fun b!210031 () Bool)

(declare-fun e!136798 () Bool)

(assert (=> b!210031 (= e!136798 (= (apply!190 lt!107490 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!210032 () Bool)

(declare-fun res!102419 () Bool)

(declare-fun e!136797 () Bool)

(assert (=> b!210032 (=> (not res!102419) (not e!136797))))

(assert (=> b!210032 (= res!102419 e!136794)))

(declare-fun res!102420 () Bool)

(assert (=> b!210032 (=> res!102420 e!136794)))

(assert (=> b!210032 (= res!102420 (not e!136795))))

(declare-fun res!102418 () Bool)

(assert (=> b!210032 (=> (not res!102418) (not e!136795))))

(assert (=> b!210032 (= res!102418 (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(declare-fun b!210033 () Bool)

(assert (=> b!210033 (= e!136788 (= (apply!190 lt!107490 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)) (get!2548 (select (arr!4737 lt!107319) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210033 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5062 lt!107319)))))

(assert (=> b!210033 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(declare-fun bm!19830 () Bool)

(declare-fun call!19837 () ListLongMap!3001)

(declare-fun call!19836 () ListLongMap!3001)

(assert (=> bm!19830 (= call!19837 call!19836)))

(declare-fun b!210034 () Bool)

(declare-fun res!102424 () Bool)

(assert (=> b!210034 (=> (not res!102424) (not e!136797))))

(declare-fun e!136789 () Bool)

(assert (=> b!210034 (= res!102424 e!136789)))

(declare-fun c!35537 () Bool)

(assert (=> b!210034 (= c!35537 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!210035 () Bool)

(assert (=> b!210035 (= e!136792 call!19839)))

(declare-fun b!210036 () Bool)

(declare-fun e!136793 () ListLongMap!3001)

(assert (=> b!210036 (= e!136793 e!136792)))

(declare-fun c!35533 () Bool)

(assert (=> b!210036 (= c!35533 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210037 () Bool)

(declare-fun call!19838 () Bool)

(assert (=> b!210037 (= e!136789 (not call!19838))))

(declare-fun bm!19831 () Bool)

(assert (=> bm!19831 (= call!19838 (contains!1376 lt!107490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!57991 () Bool)

(assert (=> d!57991 e!136797))

(declare-fun res!102425 () Bool)

(assert (=> d!57991 (=> (not res!102425) (not e!136797))))

(assert (=> d!57991 (= res!102425 (or (bvsge #b00000000000000000000000000000000 (size!5061 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))))

(declare-fun lt!107494 () ListLongMap!3001)

(assert (=> d!57991 (= lt!107490 lt!107494)))

(declare-fun lt!107507 () Unit!6368)

(declare-fun e!136791 () Unit!6368)

(assert (=> d!57991 (= lt!107507 e!136791)))

(declare-fun c!35535 () Bool)

(assert (=> d!57991 (= c!35535 e!136787)))

(declare-fun res!102422 () Bool)

(assert (=> d!57991 (=> (not res!102422) (not e!136787))))

(assert (=> d!57991 (= res!102422 (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(assert (=> d!57991 (= lt!107494 e!136793)))

(declare-fun c!35532 () Bool)

(assert (=> d!57991 (= c!35532 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57991 (validMask!0 mask!1149)))

(assert (=> d!57991 (= (getCurrentListMap!1056 _keys!825 lt!107319 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107490)))

(declare-fun bm!19832 () Bool)

(declare-fun call!19835 () ListLongMap!3001)

(assert (=> bm!19832 (= call!19836 call!19835)))

(declare-fun b!210038 () Bool)

(declare-fun e!136799 () Bool)

(assert (=> b!210038 (= e!136799 (= (apply!190 lt!107490 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!19833 () Bool)

(declare-fun call!19833 () ListLongMap!3001)

(assert (=> bm!19833 (= call!19833 (+!545 (ite c!35532 call!19835 (ite c!35533 call!19836 call!19837)) (ite (or c!35532 c!35533) (tuple2!4087 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!210039 () Bool)

(assert (=> b!210039 (= e!136790 call!19837)))

(declare-fun b!210040 () Bool)

(assert (=> b!210040 (= e!136789 e!136798)))

(declare-fun res!102423 () Bool)

(assert (=> b!210040 (= res!102423 call!19838)))

(assert (=> b!210040 (=> (not res!102423) (not e!136798))))

(declare-fun b!210041 () Bool)

(declare-fun e!136796 () Bool)

(assert (=> b!210041 (= e!136797 e!136796)))

(declare-fun c!35536 () Bool)

(assert (=> b!210041 (= c!35536 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210042 () Bool)

(declare-fun Unit!6372 () Unit!6368)

(assert (=> b!210042 (= e!136791 Unit!6372)))

(declare-fun b!210043 () Bool)

(assert (=> b!210043 (= e!136793 (+!545 call!19833 (tuple2!4087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!210044 () Bool)

(assert (=> b!210044 (= e!136796 e!136799)))

(declare-fun res!102426 () Bool)

(declare-fun call!19834 () Bool)

(assert (=> b!210044 (= res!102426 call!19834)))

(assert (=> b!210044 (=> (not res!102426) (not e!136799))))

(declare-fun bm!19834 () Bool)

(assert (=> bm!19834 (= call!19835 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107319 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210045 () Bool)

(declare-fun lt!107499 () Unit!6368)

(assert (=> b!210045 (= e!136791 lt!107499)))

(declare-fun lt!107489 () ListLongMap!3001)

(assert (=> b!210045 (= lt!107489 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107319 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107497 () (_ BitVec 64))

(assert (=> b!210045 (= lt!107497 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107503 () (_ BitVec 64))

(assert (=> b!210045 (= lt!107503 (select (arr!4736 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107491 () Unit!6368)

(declare-fun addStillContains!166 (ListLongMap!3001 (_ BitVec 64) V!6833 (_ BitVec 64)) Unit!6368)

(assert (=> b!210045 (= lt!107491 (addStillContains!166 lt!107489 lt!107497 zeroValue!615 lt!107503))))

(assert (=> b!210045 (contains!1376 (+!545 lt!107489 (tuple2!4087 lt!107497 zeroValue!615)) lt!107503)))

(declare-fun lt!107495 () Unit!6368)

(assert (=> b!210045 (= lt!107495 lt!107491)))

(declare-fun lt!107493 () ListLongMap!3001)

(assert (=> b!210045 (= lt!107493 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107319 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107504 () (_ BitVec 64))

(assert (=> b!210045 (= lt!107504 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107486 () (_ BitVec 64))

(assert (=> b!210045 (= lt!107486 (select (arr!4736 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107487 () Unit!6368)

(declare-fun addApplyDifferent!166 (ListLongMap!3001 (_ BitVec 64) V!6833 (_ BitVec 64)) Unit!6368)

(assert (=> b!210045 (= lt!107487 (addApplyDifferent!166 lt!107493 lt!107504 minValue!615 lt!107486))))

(assert (=> b!210045 (= (apply!190 (+!545 lt!107493 (tuple2!4087 lt!107504 minValue!615)) lt!107486) (apply!190 lt!107493 lt!107486))))

(declare-fun lt!107506 () Unit!6368)

(assert (=> b!210045 (= lt!107506 lt!107487)))

(declare-fun lt!107501 () ListLongMap!3001)

(assert (=> b!210045 (= lt!107501 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107319 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107498 () (_ BitVec 64))

(assert (=> b!210045 (= lt!107498 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107488 () (_ BitVec 64))

(assert (=> b!210045 (= lt!107488 (select (arr!4736 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107496 () Unit!6368)

(assert (=> b!210045 (= lt!107496 (addApplyDifferent!166 lt!107501 lt!107498 zeroValue!615 lt!107488))))

(assert (=> b!210045 (= (apply!190 (+!545 lt!107501 (tuple2!4087 lt!107498 zeroValue!615)) lt!107488) (apply!190 lt!107501 lt!107488))))

(declare-fun lt!107492 () Unit!6368)

(assert (=> b!210045 (= lt!107492 lt!107496)))

(declare-fun lt!107500 () ListLongMap!3001)

(assert (=> b!210045 (= lt!107500 (getCurrentListMapNoExtraKeys!479 _keys!825 lt!107319 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107505 () (_ BitVec 64))

(assert (=> b!210045 (= lt!107505 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107502 () (_ BitVec 64))

(assert (=> b!210045 (= lt!107502 (select (arr!4736 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210045 (= lt!107499 (addApplyDifferent!166 lt!107500 lt!107505 minValue!615 lt!107502))))

(assert (=> b!210045 (= (apply!190 (+!545 lt!107500 (tuple2!4087 lt!107505 minValue!615)) lt!107502) (apply!190 lt!107500 lt!107502))))

(declare-fun bm!19835 () Bool)

(assert (=> bm!19835 (= call!19834 (contains!1376 lt!107490 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210046 () Bool)

(assert (=> b!210046 (= e!136796 (not call!19834))))

(declare-fun bm!19836 () Bool)

(assert (=> bm!19836 (= call!19839 call!19833)))

(assert (= (and d!57991 c!35532) b!210043))

(assert (= (and d!57991 (not c!35532)) b!210036))

(assert (= (and b!210036 c!35533) b!210035))

(assert (= (and b!210036 (not c!35533)) b!210029))

(assert (= (and b!210029 c!35534) b!210030))

(assert (= (and b!210029 (not c!35534)) b!210039))

(assert (= (or b!210030 b!210039) bm!19830))

(assert (= (or b!210035 bm!19830) bm!19832))

(assert (= (or b!210035 b!210030) bm!19836))

(assert (= (or b!210043 bm!19832) bm!19834))

(assert (= (or b!210043 bm!19836) bm!19833))

(assert (= (and d!57991 res!102422) b!210027))

(assert (= (and d!57991 c!35535) b!210045))

(assert (= (and d!57991 (not c!35535)) b!210042))

(assert (= (and d!57991 res!102425) b!210032))

(assert (= (and b!210032 res!102418) b!210028))

(assert (= (and b!210032 (not res!102420)) b!210026))

(assert (= (and b!210026 res!102421) b!210033))

(assert (= (and b!210032 res!102419) b!210034))

(assert (= (and b!210034 c!35537) b!210040))

(assert (= (and b!210034 (not c!35537)) b!210037))

(assert (= (and b!210040 res!102423) b!210031))

(assert (= (or b!210040 b!210037) bm!19831))

(assert (= (and b!210034 res!102424) b!210041))

(assert (= (and b!210041 c!35536) b!210044))

(assert (= (and b!210041 (not c!35536)) b!210046))

(assert (= (and b!210044 res!102426) b!210038))

(assert (= (or b!210044 b!210046) bm!19835))

(declare-fun b_lambda!7593 () Bool)

(assert (=> (not b_lambda!7593) (not b!210033)))

(assert (=> b!210033 t!7902))

(declare-fun b_and!12313 () Bool)

(assert (= b_and!12311 (and (=> t!7902 result!4959) b_and!12313)))

(assert (=> b!210027 m!237457))

(assert (=> b!210027 m!237457))

(assert (=> b!210027 m!237459))

(declare-fun m!237583 () Bool)

(assert (=> b!210045 m!237583))

(declare-fun m!237585 () Bool)

(assert (=> b!210045 m!237585))

(declare-fun m!237587 () Bool)

(assert (=> b!210045 m!237587))

(declare-fun m!237589 () Bool)

(assert (=> b!210045 m!237589))

(declare-fun m!237591 () Bool)

(assert (=> b!210045 m!237591))

(declare-fun m!237593 () Bool)

(assert (=> b!210045 m!237593))

(declare-fun m!237595 () Bool)

(assert (=> b!210045 m!237595))

(declare-fun m!237597 () Bool)

(assert (=> b!210045 m!237597))

(declare-fun m!237599 () Bool)

(assert (=> b!210045 m!237599))

(assert (=> b!210045 m!237361))

(declare-fun m!237601 () Bool)

(assert (=> b!210045 m!237601))

(declare-fun m!237603 () Bool)

(assert (=> b!210045 m!237603))

(assert (=> b!210045 m!237601))

(assert (=> b!210045 m!237591))

(assert (=> b!210045 m!237587))

(declare-fun m!237605 () Bool)

(assert (=> b!210045 m!237605))

(assert (=> b!210045 m!237457))

(declare-fun m!237607 () Bool)

(assert (=> b!210045 m!237607))

(declare-fun m!237609 () Bool)

(assert (=> b!210045 m!237609))

(assert (=> b!210045 m!237585))

(declare-fun m!237611 () Bool)

(assert (=> b!210045 m!237611))

(declare-fun m!237613 () Bool)

(assert (=> b!210043 m!237613))

(declare-fun m!237615 () Bool)

(assert (=> bm!19835 m!237615))

(assert (=> d!57991 m!237343))

(assert (=> bm!19834 m!237361))

(assert (=> b!210026 m!237457))

(assert (=> b!210026 m!237457))

(declare-fun m!237617 () Bool)

(assert (=> b!210026 m!237617))

(declare-fun m!237619 () Bool)

(assert (=> b!210038 m!237619))

(declare-fun m!237621 () Bool)

(assert (=> bm!19831 m!237621))

(assert (=> b!210033 m!237523))

(assert (=> b!210033 m!237525))

(assert (=> b!210033 m!237527))

(assert (=> b!210033 m!237523))

(assert (=> b!210033 m!237457))

(declare-fun m!237623 () Bool)

(assert (=> b!210033 m!237623))

(assert (=> b!210033 m!237525))

(assert (=> b!210033 m!237457))

(declare-fun m!237625 () Bool)

(assert (=> bm!19833 m!237625))

(assert (=> b!210028 m!237457))

(assert (=> b!210028 m!237457))

(assert (=> b!210028 m!237459))

(declare-fun m!237627 () Bool)

(assert (=> b!210031 m!237627))

(assert (=> b!209823 d!57991))

(declare-fun bm!19841 () Bool)

(declare-fun call!19844 () ListLongMap!3001)

(assert (=> bm!19841 (= call!19844 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210053 () Bool)

(declare-fun e!136804 () Bool)

(declare-fun call!19845 () ListLongMap!3001)

(assert (=> b!210053 (= e!136804 (= call!19845 call!19844))))

(declare-fun bm!19842 () Bool)

(assert (=> bm!19842 (= call!19845 (getCurrentListMapNoExtraKeys!479 _keys!825 (array!9976 (store (arr!4737 _values!649) i!601 (ValueCellFull!2351 v!520)) (size!5062 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!57993 () Bool)

(declare-fun e!136805 () Bool)

(assert (=> d!57993 e!136805))

(declare-fun res!102429 () Bool)

(assert (=> d!57993 (=> (not res!102429) (not e!136805))))

(assert (=> d!57993 (= res!102429 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5062 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5062 _values!649))))))))

(declare-fun lt!107510 () Unit!6368)

(declare-fun choose!1080 (array!9973 array!9975 (_ BitVec 32) (_ BitVec 32) V!6833 V!6833 (_ BitVec 32) (_ BitVec 64) V!6833 (_ BitVec 32) Int) Unit!6368)

(assert (=> d!57993 (= lt!107510 (choose!1080 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57993 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(assert (=> d!57993 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!197 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!107510)))

(declare-fun b!210054 () Bool)

(assert (=> b!210054 (= e!136805 e!136804)))

(declare-fun c!35540 () Bool)

(assert (=> b!210054 (= c!35540 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun b!210055 () Bool)

(assert (=> b!210055 (= e!136804 (= call!19845 (+!545 call!19844 (tuple2!4087 k0!843 v!520))))))

(assert (= (and d!57993 res!102429) b!210054))

(assert (= (and b!210054 c!35540) b!210055))

(assert (= (and b!210054 (not c!35540)) b!210053))

(assert (= (or b!210055 b!210053) bm!19842))

(assert (= (or b!210055 b!210053) bm!19841))

(assert (=> bm!19841 m!237363))

(assert (=> bm!19842 m!237355))

(declare-fun m!237629 () Bool)

(assert (=> bm!19842 m!237629))

(declare-fun m!237631 () Bool)

(assert (=> d!57993 m!237631))

(declare-fun m!237633 () Bool)

(assert (=> b!210055 m!237633))

(assert (=> b!209823 d!57993))

(declare-fun b!210056 () Bool)

(declare-fun e!136813 () Bool)

(declare-fun e!136807 () Bool)

(assert (=> b!210056 (= e!136813 e!136807)))

(declare-fun res!102433 () Bool)

(assert (=> b!210056 (=> (not res!102433) (not e!136807))))

(declare-fun lt!107515 () ListLongMap!3001)

(assert (=> b!210056 (= res!102433 (contains!1376 lt!107515 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210056 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(declare-fun b!210057 () Bool)

(declare-fun e!136806 () Bool)

(assert (=> b!210057 (= e!136806 (validKeyInArray!0 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210058 () Bool)

(declare-fun e!136814 () Bool)

(assert (=> b!210058 (= e!136814 (validKeyInArray!0 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210059 () Bool)

(declare-fun c!35543 () Bool)

(assert (=> b!210059 (= c!35543 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!136811 () ListLongMap!3001)

(declare-fun e!136809 () ListLongMap!3001)

(assert (=> b!210059 (= e!136811 e!136809)))

(declare-fun b!210060 () Bool)

(declare-fun call!19852 () ListLongMap!3001)

(assert (=> b!210060 (= e!136809 call!19852)))

(declare-fun b!210061 () Bool)

(declare-fun e!136817 () Bool)

(assert (=> b!210061 (= e!136817 (= (apply!190 lt!107515 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!210062 () Bool)

(declare-fun res!102431 () Bool)

(declare-fun e!136816 () Bool)

(assert (=> b!210062 (=> (not res!102431) (not e!136816))))

(assert (=> b!210062 (= res!102431 e!136813)))

(declare-fun res!102432 () Bool)

(assert (=> b!210062 (=> res!102432 e!136813)))

(assert (=> b!210062 (= res!102432 (not e!136814))))

(declare-fun res!102430 () Bool)

(assert (=> b!210062 (=> (not res!102430) (not e!136814))))

(assert (=> b!210062 (= res!102430 (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(declare-fun b!210063 () Bool)

(assert (=> b!210063 (= e!136807 (= (apply!190 lt!107515 (select (arr!4736 _keys!825) #b00000000000000000000000000000000)) (get!2548 (select (arr!4737 _values!649) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5062 _values!649)))))

(assert (=> b!210063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(declare-fun bm!19843 () Bool)

(declare-fun call!19850 () ListLongMap!3001)

(declare-fun call!19849 () ListLongMap!3001)

(assert (=> bm!19843 (= call!19850 call!19849)))

(declare-fun b!210064 () Bool)

(declare-fun res!102436 () Bool)

(assert (=> b!210064 (=> (not res!102436) (not e!136816))))

(declare-fun e!136808 () Bool)

(assert (=> b!210064 (= res!102436 e!136808)))

(declare-fun c!35546 () Bool)

(assert (=> b!210064 (= c!35546 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!210065 () Bool)

(assert (=> b!210065 (= e!136811 call!19852)))

(declare-fun b!210066 () Bool)

(declare-fun e!136812 () ListLongMap!3001)

(assert (=> b!210066 (= e!136812 e!136811)))

(declare-fun c!35542 () Bool)

(assert (=> b!210066 (= c!35542 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210067 () Bool)

(declare-fun call!19851 () Bool)

(assert (=> b!210067 (= e!136808 (not call!19851))))

(declare-fun bm!19844 () Bool)

(assert (=> bm!19844 (= call!19851 (contains!1376 lt!107515 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!57995 () Bool)

(assert (=> d!57995 e!136816))

(declare-fun res!102437 () Bool)

(assert (=> d!57995 (=> (not res!102437) (not e!136816))))

(assert (=> d!57995 (= res!102437 (or (bvsge #b00000000000000000000000000000000 (size!5061 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))))

(declare-fun lt!107519 () ListLongMap!3001)

(assert (=> d!57995 (= lt!107515 lt!107519)))

(declare-fun lt!107532 () Unit!6368)

(declare-fun e!136810 () Unit!6368)

(assert (=> d!57995 (= lt!107532 e!136810)))

(declare-fun c!35544 () Bool)

(assert (=> d!57995 (= c!35544 e!136806)))

(declare-fun res!102434 () Bool)

(assert (=> d!57995 (=> (not res!102434) (not e!136806))))

(assert (=> d!57995 (= res!102434 (bvslt #b00000000000000000000000000000000 (size!5061 _keys!825)))))

(assert (=> d!57995 (= lt!107519 e!136812)))

(declare-fun c!35541 () Bool)

(assert (=> d!57995 (= c!35541 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57995 (validMask!0 mask!1149)))

(assert (=> d!57995 (= (getCurrentListMap!1056 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107515)))

(declare-fun bm!19845 () Bool)

(declare-fun call!19848 () ListLongMap!3001)

(assert (=> bm!19845 (= call!19849 call!19848)))

(declare-fun b!210068 () Bool)

(declare-fun e!136818 () Bool)

(assert (=> b!210068 (= e!136818 (= (apply!190 lt!107515 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!19846 () Bool)

(declare-fun call!19846 () ListLongMap!3001)

(assert (=> bm!19846 (= call!19846 (+!545 (ite c!35541 call!19848 (ite c!35542 call!19849 call!19850)) (ite (or c!35541 c!35542) (tuple2!4087 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!210069 () Bool)

(assert (=> b!210069 (= e!136809 call!19850)))

(declare-fun b!210070 () Bool)

(assert (=> b!210070 (= e!136808 e!136817)))

(declare-fun res!102435 () Bool)

(assert (=> b!210070 (= res!102435 call!19851)))

(assert (=> b!210070 (=> (not res!102435) (not e!136817))))

(declare-fun b!210071 () Bool)

(declare-fun e!136815 () Bool)

(assert (=> b!210071 (= e!136816 e!136815)))

(declare-fun c!35545 () Bool)

(assert (=> b!210071 (= c!35545 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210072 () Bool)

(declare-fun Unit!6373 () Unit!6368)

(assert (=> b!210072 (= e!136810 Unit!6373)))

(declare-fun b!210073 () Bool)

(assert (=> b!210073 (= e!136812 (+!545 call!19846 (tuple2!4087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!210074 () Bool)

(assert (=> b!210074 (= e!136815 e!136818)))

(declare-fun res!102438 () Bool)

(declare-fun call!19847 () Bool)

(assert (=> b!210074 (= res!102438 call!19847)))

(assert (=> b!210074 (=> (not res!102438) (not e!136818))))

(declare-fun bm!19847 () Bool)

(assert (=> bm!19847 (= call!19848 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210075 () Bool)

(declare-fun lt!107524 () Unit!6368)

(assert (=> b!210075 (= e!136810 lt!107524)))

(declare-fun lt!107514 () ListLongMap!3001)

(assert (=> b!210075 (= lt!107514 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107522 () (_ BitVec 64))

(assert (=> b!210075 (= lt!107522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107528 () (_ BitVec 64))

(assert (=> b!210075 (= lt!107528 (select (arr!4736 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107516 () Unit!6368)

(assert (=> b!210075 (= lt!107516 (addStillContains!166 lt!107514 lt!107522 zeroValue!615 lt!107528))))

(assert (=> b!210075 (contains!1376 (+!545 lt!107514 (tuple2!4087 lt!107522 zeroValue!615)) lt!107528)))

(declare-fun lt!107520 () Unit!6368)

(assert (=> b!210075 (= lt!107520 lt!107516)))

(declare-fun lt!107518 () ListLongMap!3001)

(assert (=> b!210075 (= lt!107518 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107529 () (_ BitVec 64))

(assert (=> b!210075 (= lt!107529 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107511 () (_ BitVec 64))

(assert (=> b!210075 (= lt!107511 (select (arr!4736 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107512 () Unit!6368)

(assert (=> b!210075 (= lt!107512 (addApplyDifferent!166 lt!107518 lt!107529 minValue!615 lt!107511))))

(assert (=> b!210075 (= (apply!190 (+!545 lt!107518 (tuple2!4087 lt!107529 minValue!615)) lt!107511) (apply!190 lt!107518 lt!107511))))

(declare-fun lt!107531 () Unit!6368)

(assert (=> b!210075 (= lt!107531 lt!107512)))

(declare-fun lt!107526 () ListLongMap!3001)

(assert (=> b!210075 (= lt!107526 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107523 () (_ BitVec 64))

(assert (=> b!210075 (= lt!107523 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107513 () (_ BitVec 64))

(assert (=> b!210075 (= lt!107513 (select (arr!4736 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107521 () Unit!6368)

(assert (=> b!210075 (= lt!107521 (addApplyDifferent!166 lt!107526 lt!107523 zeroValue!615 lt!107513))))

(assert (=> b!210075 (= (apply!190 (+!545 lt!107526 (tuple2!4087 lt!107523 zeroValue!615)) lt!107513) (apply!190 lt!107526 lt!107513))))

(declare-fun lt!107517 () Unit!6368)

(assert (=> b!210075 (= lt!107517 lt!107521)))

(declare-fun lt!107525 () ListLongMap!3001)

(assert (=> b!210075 (= lt!107525 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107530 () (_ BitVec 64))

(assert (=> b!210075 (= lt!107530 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107527 () (_ BitVec 64))

(assert (=> b!210075 (= lt!107527 (select (arr!4736 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210075 (= lt!107524 (addApplyDifferent!166 lt!107525 lt!107530 minValue!615 lt!107527))))

(assert (=> b!210075 (= (apply!190 (+!545 lt!107525 (tuple2!4087 lt!107530 minValue!615)) lt!107527) (apply!190 lt!107525 lt!107527))))

(declare-fun bm!19848 () Bool)

(assert (=> bm!19848 (= call!19847 (contains!1376 lt!107515 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210076 () Bool)

(assert (=> b!210076 (= e!136815 (not call!19847))))

(declare-fun bm!19849 () Bool)

(assert (=> bm!19849 (= call!19852 call!19846)))

(assert (= (and d!57995 c!35541) b!210073))

(assert (= (and d!57995 (not c!35541)) b!210066))

(assert (= (and b!210066 c!35542) b!210065))

(assert (= (and b!210066 (not c!35542)) b!210059))

(assert (= (and b!210059 c!35543) b!210060))

(assert (= (and b!210059 (not c!35543)) b!210069))

(assert (= (or b!210060 b!210069) bm!19843))

(assert (= (or b!210065 bm!19843) bm!19845))

(assert (= (or b!210065 b!210060) bm!19849))

(assert (= (or b!210073 bm!19845) bm!19847))

(assert (= (or b!210073 bm!19849) bm!19846))

(assert (= (and d!57995 res!102434) b!210057))

(assert (= (and d!57995 c!35544) b!210075))

(assert (= (and d!57995 (not c!35544)) b!210072))

(assert (= (and d!57995 res!102437) b!210062))

(assert (= (and b!210062 res!102430) b!210058))

(assert (= (and b!210062 (not res!102432)) b!210056))

(assert (= (and b!210056 res!102433) b!210063))

(assert (= (and b!210062 res!102431) b!210064))

(assert (= (and b!210064 c!35546) b!210070))

(assert (= (and b!210064 (not c!35546)) b!210067))

(assert (= (and b!210070 res!102435) b!210061))

(assert (= (or b!210070 b!210067) bm!19844))

(assert (= (and b!210064 res!102436) b!210071))

(assert (= (and b!210071 c!35545) b!210074))

(assert (= (and b!210071 (not c!35545)) b!210076))

(assert (= (and b!210074 res!102438) b!210068))

(assert (= (or b!210074 b!210076) bm!19848))

(declare-fun b_lambda!7595 () Bool)

(assert (=> (not b_lambda!7595) (not b!210063)))

(assert (=> b!210063 t!7902))

(declare-fun b_and!12315 () Bool)

(assert (= b_and!12313 (and (=> t!7902 result!4959) b_and!12315)))

(assert (=> b!210057 m!237457))

(assert (=> b!210057 m!237457))

(assert (=> b!210057 m!237459))

(declare-fun m!237635 () Bool)

(assert (=> b!210075 m!237635))

(declare-fun m!237637 () Bool)

(assert (=> b!210075 m!237637))

(declare-fun m!237639 () Bool)

(assert (=> b!210075 m!237639))

(declare-fun m!237641 () Bool)

(assert (=> b!210075 m!237641))

(declare-fun m!237643 () Bool)

(assert (=> b!210075 m!237643))

(declare-fun m!237645 () Bool)

(assert (=> b!210075 m!237645))

(declare-fun m!237647 () Bool)

(assert (=> b!210075 m!237647))

(declare-fun m!237649 () Bool)

(assert (=> b!210075 m!237649))

(declare-fun m!237651 () Bool)

(assert (=> b!210075 m!237651))

(assert (=> b!210075 m!237363))

(declare-fun m!237653 () Bool)

(assert (=> b!210075 m!237653))

(declare-fun m!237655 () Bool)

(assert (=> b!210075 m!237655))

(assert (=> b!210075 m!237653))

(assert (=> b!210075 m!237643))

(assert (=> b!210075 m!237639))

(declare-fun m!237657 () Bool)

(assert (=> b!210075 m!237657))

(assert (=> b!210075 m!237457))

(declare-fun m!237659 () Bool)

(assert (=> b!210075 m!237659))

(declare-fun m!237661 () Bool)

(assert (=> b!210075 m!237661))

(assert (=> b!210075 m!237637))

(declare-fun m!237663 () Bool)

(assert (=> b!210075 m!237663))

(declare-fun m!237665 () Bool)

(assert (=> b!210073 m!237665))

(declare-fun m!237667 () Bool)

(assert (=> bm!19848 m!237667))

(assert (=> d!57995 m!237343))

(assert (=> bm!19847 m!237363))

(assert (=> b!210056 m!237457))

(assert (=> b!210056 m!237457))

(declare-fun m!237669 () Bool)

(assert (=> b!210056 m!237669))

(declare-fun m!237671 () Bool)

(assert (=> b!210068 m!237671))

(declare-fun m!237673 () Bool)

(assert (=> bm!19844 m!237673))

(assert (=> b!210063 m!237549))

(assert (=> b!210063 m!237525))

(assert (=> b!210063 m!237551))

(assert (=> b!210063 m!237549))

(assert (=> b!210063 m!237457))

(declare-fun m!237675 () Bool)

(assert (=> b!210063 m!237675))

(assert (=> b!210063 m!237525))

(assert (=> b!210063 m!237457))

(declare-fun m!237677 () Bool)

(assert (=> bm!19846 m!237677))

(assert (=> b!210058 m!237457))

(assert (=> b!210058 m!237457))

(assert (=> b!210058 m!237459))

(declare-fun m!237679 () Bool)

(assert (=> b!210061 m!237679))

(assert (=> b!209823 d!57995))

(declare-fun mapIsEmpty!9164 () Bool)

(declare-fun mapRes!9164 () Bool)

(assert (=> mapIsEmpty!9164 mapRes!9164))

(declare-fun b!210084 () Bool)

(declare-fun e!136823 () Bool)

(assert (=> b!210084 (= e!136823 tp_is_empty!5389)))

(declare-fun condMapEmpty!9164 () Bool)

(declare-fun mapDefault!9164 () ValueCell!2351)

(assert (=> mapNonEmpty!9155 (= condMapEmpty!9164 (= mapRest!9155 ((as const (Array (_ BitVec 32) ValueCell!2351)) mapDefault!9164)))))

(assert (=> mapNonEmpty!9155 (= tp!19625 (and e!136823 mapRes!9164))))

(declare-fun mapNonEmpty!9164 () Bool)

(declare-fun tp!19640 () Bool)

(declare-fun e!136824 () Bool)

(assert (=> mapNonEmpty!9164 (= mapRes!9164 (and tp!19640 e!136824))))

(declare-fun mapValue!9164 () ValueCell!2351)

(declare-fun mapKey!9164 () (_ BitVec 32))

(declare-fun mapRest!9164 () (Array (_ BitVec 32) ValueCell!2351))

(assert (=> mapNonEmpty!9164 (= mapRest!9155 (store mapRest!9164 mapKey!9164 mapValue!9164))))

(declare-fun b!210083 () Bool)

(assert (=> b!210083 (= e!136824 tp_is_empty!5389)))

(assert (= (and mapNonEmpty!9155 condMapEmpty!9164) mapIsEmpty!9164))

(assert (= (and mapNonEmpty!9155 (not condMapEmpty!9164)) mapNonEmpty!9164))

(assert (= (and mapNonEmpty!9164 ((_ is ValueCellFull!2351) mapValue!9164)) b!210083))

(assert (= (and mapNonEmpty!9155 ((_ is ValueCellFull!2351) mapDefault!9164)) b!210084))

(declare-fun m!237681 () Bool)

(assert (=> mapNonEmpty!9164 m!237681))

(declare-fun b_lambda!7597 () Bool)

(assert (= b_lambda!7593 (or (and start!20898 b_free!5527) b_lambda!7597)))

(declare-fun b_lambda!7599 () Bool)

(assert (= b_lambda!7595 (or (and start!20898 b_free!5527) b_lambda!7599)))

(declare-fun b_lambda!7601 () Bool)

(assert (= b_lambda!7589 (or (and start!20898 b_free!5527) b_lambda!7601)))

(declare-fun b_lambda!7603 () Bool)

(assert (= b_lambda!7591 (or (and start!20898 b_free!5527) b_lambda!7603)))

(declare-fun b_lambda!7605 () Bool)

(assert (= b_lambda!7587 (or (and start!20898 b_free!5527) b_lambda!7605)))

(declare-fun b_lambda!7607 () Bool)

(assert (= b_lambda!7585 (or (and start!20898 b_free!5527) b_lambda!7607)))

(check-sat (not b!210073) (not b!209959) (not b!210043) (not b!209973) (not d!57987) (not b!210027) (not b!209907) (not d!57995) (not b!209930) (not b!210038) (not d!57991) (not b!210068) (not b!209974) (not bm!19808) (not b!210061) (not b!210028) (not b!209927) (not bm!19842) (not b!210063) (not d!57983) (not bm!19848) (not b!209926) (not d!57977) (not mapNonEmpty!9164) (not d!57981) (not b!209928) (not bm!19815) (not b!209982) (not b!209978) (not b!209971) (not b!209972) (not b!209983) (not b!209970) (not d!57989) (not b!210045) (not b!209929) (not b!209925) (not b!210056) (not b_lambda!7599) (not bm!19814) (not bm!19844) (not bm!19811) (not b!210075) (not b_next!5527) (not b!209957) (not b!209958) (not b!210058) (not bm!19846) (not b!209919) (not bm!19835) b_and!12315 (not b!209924) (not bm!19841) (not b_lambda!7597) (not bm!19833) (not d!57985) (not d!57993) (not b!210026) (not b!209979) (not b!209904) (not bm!19834) (not b!209918) (not b!209956) (not bm!19847) (not b!209903) (not d!57979) (not b!209966) tp_is_empty!5389 (not b!210033) (not b_lambda!7601) (not bm!19831) (not b!210055) (not b_lambda!7607) (not b_lambda!7603) (not b_lambda!7605) (not b!209964) (not b!210031) (not b!209965) (not b!209960) (not b!210057) (not b!209931) (not b!209980))
(check-sat b_and!12315 (not b_next!5527))
