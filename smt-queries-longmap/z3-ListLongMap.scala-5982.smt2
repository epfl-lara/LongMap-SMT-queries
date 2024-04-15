; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77700 () Bool)

(assert start!77700)

(declare-fun b_free!16303 () Bool)

(declare-fun b_next!16303 () Bool)

(assert (=> start!77700 (= b_free!16303 (not b_next!16303))))

(declare-fun tp!57171 () Bool)

(declare-fun b_and!26733 () Bool)

(assert (=> start!77700 (= tp!57171 b_and!26733)))

(declare-fun b!906483 () Bool)

(declare-fun res!611825 () Bool)

(declare-fun e!507988 () Bool)

(assert (=> b!906483 (=> (not res!611825) (not e!507988))))

(declare-datatypes ((array!53457 0))(
  ( (array!53458 (arr!25688 (Array (_ BitVec 32) (_ BitVec 64))) (size!26149 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53457)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53457 (_ BitVec 32)) Bool)

(assert (=> b!906483 (= res!611825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29794 () Bool)

(declare-fun mapRes!29794 () Bool)

(declare-fun tp!57172 () Bool)

(declare-fun e!507986 () Bool)

(assert (=> mapNonEmpty!29794 (= mapRes!29794 (and tp!57172 e!507986))))

(declare-datatypes ((V!29927 0))(
  ( (V!29928 (val!9411 Int)) )
))
(declare-datatypes ((ValueCell!8879 0))(
  ( (ValueCellFull!8879 (v!11915 V!29927)) (EmptyCell!8879) )
))
(declare-datatypes ((array!53459 0))(
  ( (array!53460 (arr!25689 (Array (_ BitVec 32) ValueCell!8879)) (size!26150 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53459)

(declare-fun mapValue!29794 () ValueCell!8879)

(declare-fun mapKey!29794 () (_ BitVec 32))

(declare-fun mapRest!29794 () (Array (_ BitVec 32) ValueCell!8879))

(assert (=> mapNonEmpty!29794 (= (arr!25689 _values!1152) (store mapRest!29794 mapKey!29794 mapValue!29794))))

(declare-fun b!906484 () Bool)

(declare-fun e!507987 () Bool)

(declare-fun e!507983 () Bool)

(assert (=> b!906484 (= e!507987 (and e!507983 mapRes!29794))))

(declare-fun condMapEmpty!29794 () Bool)

(declare-fun mapDefault!29794 () ValueCell!8879)

(assert (=> b!906484 (= condMapEmpty!29794 (= (arr!25689 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8879)) mapDefault!29794)))))

(declare-fun b!906485 () Bool)

(declare-fun e!507989 () Bool)

(assert (=> b!906485 (= e!507989 true)))

(declare-datatypes ((tuple2!12272 0))(
  ( (tuple2!12273 (_1!6147 (_ BitVec 64)) (_2!6147 V!29927)) )
))
(declare-datatypes ((List!18059 0))(
  ( (Nil!18056) (Cons!18055 (h!19201 tuple2!12272) (t!25525 List!18059)) )
))
(declare-datatypes ((ListLongMap!10959 0))(
  ( (ListLongMap!10960 (toList!5495 List!18059)) )
))
(declare-fun lt!408790 () ListLongMap!10959)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408786 () V!29927)

(declare-fun apply!471 (ListLongMap!10959 (_ BitVec 64)) V!29927)

(assert (=> b!906485 (= (apply!471 lt!408790 k0!1033) lt!408786)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29927)

(declare-datatypes ((Unit!30690 0))(
  ( (Unit!30691) )
))
(declare-fun lt!408787 () Unit!30690)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29927)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun lemmaListMapApplyFromThenApplyFromZero!32 (array!53457 array!53459 (_ BitVec 32) (_ BitVec 32) V!29927 V!29927 (_ BitVec 64) V!29927 (_ BitVec 32) Int) Unit!30690)

(assert (=> b!906485 (= lt!408787 (lemmaListMapApplyFromThenApplyFromZero!32 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408786 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29794 () Bool)

(assert (=> mapIsEmpty!29794 mapRes!29794))

(declare-fun b!906486 () Bool)

(declare-fun tp_is_empty!18721 () Bool)

(assert (=> b!906486 (= e!507983 tp_is_empty!18721)))

(declare-fun b!906487 () Bool)

(declare-fun res!611829 () Bool)

(declare-fun e!507985 () Bool)

(assert (=> b!906487 (=> (not res!611829) (not e!507985))))

(assert (=> b!906487 (= res!611829 (and (= (select (arr!25688 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906488 () Bool)

(declare-fun res!611826 () Bool)

(assert (=> b!906488 (=> (not res!611826) (not e!507988))))

(assert (=> b!906488 (= res!611826 (and (= (size!26150 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26149 _keys!1386) (size!26150 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!611823 () Bool)

(assert (=> start!77700 (=> (not res!611823) (not e!507988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77700 (= res!611823 (validMask!0 mask!1756))))

(assert (=> start!77700 e!507988))

(declare-fun array_inv!20160 (array!53459) Bool)

(assert (=> start!77700 (and (array_inv!20160 _values!1152) e!507987)))

(assert (=> start!77700 tp!57171))

(assert (=> start!77700 true))

(assert (=> start!77700 tp_is_empty!18721))

(declare-fun array_inv!20161 (array!53457) Bool)

(assert (=> start!77700 (array_inv!20161 _keys!1386)))

(declare-fun b!906489 () Bool)

(declare-fun res!611824 () Bool)

(assert (=> b!906489 (=> (not res!611824) (not e!507988))))

(declare-datatypes ((List!18060 0))(
  ( (Nil!18057) (Cons!18056 (h!19202 (_ BitVec 64)) (t!25526 List!18060)) )
))
(declare-fun arrayNoDuplicates!0 (array!53457 (_ BitVec 32) List!18060) Bool)

(assert (=> b!906489 (= res!611824 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18057))))

(declare-fun b!906490 () Bool)

(assert (=> b!906490 (= e!507986 tp_is_empty!18721)))

(declare-fun b!906491 () Bool)

(declare-fun res!611828 () Bool)

(assert (=> b!906491 (=> res!611828 e!507989)))

(declare-fun lt!408788 () ListLongMap!10959)

(assert (=> b!906491 (= res!611828 (not (= (apply!471 lt!408788 k0!1033) lt!408786)))))

(declare-fun b!906492 () Bool)

(declare-fun e!507984 () Bool)

(assert (=> b!906492 (= e!507985 (not e!507984))))

(declare-fun res!611827 () Bool)

(assert (=> b!906492 (=> res!611827 e!507984)))

(assert (=> b!906492 (= res!611827 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26149 _keys!1386))))))

(declare-fun get!13511 (ValueCell!8879 V!29927) V!29927)

(declare-fun dynLambda!1344 (Int (_ BitVec 64)) V!29927)

(assert (=> b!906492 (= lt!408786 (get!13511 (select (arr!25689 _values!1152) i!717) (dynLambda!1344 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906492 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408789 () Unit!30690)

(declare-fun lemmaKeyInListMapIsInArray!220 (array!53457 array!53459 (_ BitVec 32) (_ BitVec 32) V!29927 V!29927 (_ BitVec 64) Int) Unit!30690)

(assert (=> b!906492 (= lt!408789 (lemmaKeyInListMapIsInArray!220 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906493 () Bool)

(assert (=> b!906493 (= e!507984 e!507989)))

(declare-fun res!611822 () Bool)

(assert (=> b!906493 (=> res!611822 e!507989)))

(declare-fun contains!4501 (ListLongMap!10959 (_ BitVec 64)) Bool)

(assert (=> b!906493 (= res!611822 (not (contains!4501 lt!408788 k0!1033)))))

(declare-fun getCurrentListMap!2705 (array!53457 array!53459 (_ BitVec 32) (_ BitVec 32) V!29927 V!29927 (_ BitVec 32) Int) ListLongMap!10959)

(assert (=> b!906493 (= lt!408788 (getCurrentListMap!2705 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906494 () Bool)

(declare-fun res!611821 () Bool)

(assert (=> b!906494 (=> (not res!611821) (not e!507985))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906494 (= res!611821 (inRange!0 i!717 mask!1756))))

(declare-fun b!906495 () Bool)

(assert (=> b!906495 (= e!507988 e!507985)))

(declare-fun res!611820 () Bool)

(assert (=> b!906495 (=> (not res!611820) (not e!507985))))

(assert (=> b!906495 (= res!611820 (contains!4501 lt!408790 k0!1033))))

(assert (=> b!906495 (= lt!408790 (getCurrentListMap!2705 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(assert (= (and start!77700 res!611823) b!906488))

(assert (= (and b!906488 res!611826) b!906483))

(assert (= (and b!906483 res!611825) b!906489))

(assert (= (and b!906489 res!611824) b!906495))

(assert (= (and b!906495 res!611820) b!906494))

(assert (= (and b!906494 res!611821) b!906487))

(assert (= (and b!906487 res!611829) b!906492))

(assert (= (and b!906492 (not res!611827)) b!906493))

(assert (= (and b!906493 (not res!611822)) b!906491))

(assert (= (and b!906491 (not res!611828)) b!906485))

(assert (= (and b!906484 condMapEmpty!29794) mapIsEmpty!29794))

(assert (= (and b!906484 (not condMapEmpty!29794)) mapNonEmpty!29794))

(get-info :version)

(assert (= (and mapNonEmpty!29794 ((_ is ValueCellFull!8879) mapValue!29794)) b!906490))

(assert (= (and b!906484 ((_ is ValueCellFull!8879) mapDefault!29794)) b!906486))

(assert (= start!77700 b!906484))

(declare-fun b_lambda!13159 () Bool)

(assert (=> (not b_lambda!13159) (not b!906492)))

(declare-fun t!25524 () Bool)

(declare-fun tb!5317 () Bool)

(assert (=> (and start!77700 (= defaultEntry!1160 defaultEntry!1160) t!25524) tb!5317))

(declare-fun result!10437 () Bool)

(assert (=> tb!5317 (= result!10437 tp_is_empty!18721)))

(assert (=> b!906492 t!25524))

(declare-fun b_and!26735 () Bool)

(assert (= b_and!26733 (and (=> t!25524 result!10437) b_and!26735)))

(declare-fun m!841337 () Bool)

(assert (=> b!906493 m!841337))

(declare-fun m!841339 () Bool)

(assert (=> b!906493 m!841339))

(declare-fun m!841341 () Bool)

(assert (=> b!906492 m!841341))

(declare-fun m!841343 () Bool)

(assert (=> b!906492 m!841343))

(declare-fun m!841345 () Bool)

(assert (=> b!906492 m!841345))

(declare-fun m!841347 () Bool)

(assert (=> b!906492 m!841347))

(assert (=> b!906492 m!841341))

(assert (=> b!906492 m!841345))

(declare-fun m!841349 () Bool)

(assert (=> b!906492 m!841349))

(declare-fun m!841351 () Bool)

(assert (=> b!906483 m!841351))

(declare-fun m!841353 () Bool)

(assert (=> b!906491 m!841353))

(declare-fun m!841355 () Bool)

(assert (=> b!906489 m!841355))

(declare-fun m!841357 () Bool)

(assert (=> start!77700 m!841357))

(declare-fun m!841359 () Bool)

(assert (=> start!77700 m!841359))

(declare-fun m!841361 () Bool)

(assert (=> start!77700 m!841361))

(declare-fun m!841363 () Bool)

(assert (=> b!906487 m!841363))

(declare-fun m!841365 () Bool)

(assert (=> b!906485 m!841365))

(declare-fun m!841367 () Bool)

(assert (=> b!906485 m!841367))

(declare-fun m!841369 () Bool)

(assert (=> b!906495 m!841369))

(declare-fun m!841371 () Bool)

(assert (=> b!906495 m!841371))

(declare-fun m!841373 () Bool)

(assert (=> b!906494 m!841373))

(declare-fun m!841375 () Bool)

(assert (=> mapNonEmpty!29794 m!841375))

(check-sat (not b_next!16303) (not b!906492) (not b_lambda!13159) (not b!906491) tp_is_empty!18721 b_and!26735 (not b!906494) (not b!906489) (not b!906485) (not b!906483) (not b!906495) (not start!77700) (not mapNonEmpty!29794) (not b!906493))
(check-sat b_and!26735 (not b_next!16303))
