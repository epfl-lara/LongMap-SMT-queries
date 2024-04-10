; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34950 () Bool)

(assert start!34950)

(declare-fun b_free!7665 () Bool)

(declare-fun b_next!7665 () Bool)

(assert (=> start!34950 (= b_free!7665 (not b_next!7665))))

(declare-fun tp!26571 () Bool)

(declare-fun b_and!14893 () Bool)

(assert (=> start!34950 (= tp!26571 b_and!14893)))

(declare-fun b!350001 () Bool)

(declare-fun e!214392 () Bool)

(declare-fun e!214393 () Bool)

(declare-fun mapRes!12894 () Bool)

(assert (=> b!350001 (= e!214392 (and e!214393 mapRes!12894))))

(declare-fun condMapEmpty!12894 () Bool)

(declare-datatypes ((V!11133 0))(
  ( (V!11134 (val!3853 Int)) )
))
(declare-datatypes ((ValueCell!3465 0))(
  ( (ValueCellFull!3465 (v!6039 V!11133)) (EmptyCell!3465) )
))
(declare-datatypes ((array!18819 0))(
  ( (array!18820 (arr!8916 (Array (_ BitVec 32) ValueCell!3465)) (size!9268 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18819)

(declare-fun mapDefault!12894 () ValueCell!3465)

(assert (=> b!350001 (= condMapEmpty!12894 (= (arr!8916 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3465)) mapDefault!12894)))))

(declare-fun b!350003 () Bool)

(declare-fun e!214390 () Bool)

(declare-fun tp_is_empty!7617 () Bool)

(assert (=> b!350003 (= e!214390 tp_is_empty!7617)))

(declare-fun b!350004 () Bool)

(declare-datatypes ((Unit!10843 0))(
  ( (Unit!10844) )
))
(declare-fun e!214396 () Unit!10843)

(declare-fun Unit!10845 () Unit!10843)

(assert (=> b!350004 (= e!214396 Unit!10845)))

(declare-fun b!350005 () Bool)

(declare-fun e!214395 () Bool)

(declare-fun e!214391 () Bool)

(assert (=> b!350005 (= e!214395 e!214391)))

(declare-fun res!193968 () Bool)

(assert (=> b!350005 (=> (not res!193968) (not e!214391))))

(declare-datatypes ((SeekEntryResult!3435 0))(
  ( (MissingZero!3435 (index!15919 (_ BitVec 32))) (Found!3435 (index!15920 (_ BitVec 32))) (Intermediate!3435 (undefined!4247 Bool) (index!15921 (_ BitVec 32)) (x!34849 (_ BitVec 32))) (Undefined!3435) (MissingVacant!3435 (index!15922 (_ BitVec 32))) )
))
(declare-fun lt!164419 () SeekEntryResult!3435)

(get-info :version)

(assert (=> b!350005 (= res!193968 (and (not ((_ is Found!3435) lt!164419)) ((_ is MissingZero!3435) lt!164419)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18821 0))(
  ( (array!18822 (arr!8917 (Array (_ BitVec 32) (_ BitVec 64))) (size!9269 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18821)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18821 (_ BitVec 32)) SeekEntryResult!3435)

(assert (=> b!350005 (= lt!164419 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350006 () Bool)

(declare-fun res!193971 () Bool)

(assert (=> b!350006 (=> (not res!193971) (not e!214395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350006 (= res!193971 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12894 () Bool)

(declare-fun tp!26570 () Bool)

(assert (=> mapNonEmpty!12894 (= mapRes!12894 (and tp!26570 e!214390))))

(declare-fun mapValue!12894 () ValueCell!3465)

(declare-fun mapKey!12894 () (_ BitVec 32))

(declare-fun mapRest!12894 () (Array (_ BitVec 32) ValueCell!3465))

(assert (=> mapNonEmpty!12894 (= (arr!8916 _values!1525) (store mapRest!12894 mapKey!12894 mapValue!12894))))

(declare-fun b!350007 () Bool)

(declare-fun Unit!10846 () Unit!10843)

(assert (=> b!350007 (= e!214396 Unit!10846)))

(declare-fun lt!164418 () Unit!10843)

(declare-fun zeroValue!1467 () V!11133)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11133)

(declare-fun lemmaArrayContainsKeyThenInListMap!323 (array!18821 array!18819 (_ BitVec 32) (_ BitVec 32) V!11133 V!11133 (_ BitVec 64) (_ BitVec 32) Int) Unit!10843)

(declare-fun arrayScanForKey!0 (array!18821 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350007 (= lt!164418 (lemmaArrayContainsKeyThenInListMap!323 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!350007 false))

(declare-fun b!350008 () Bool)

(assert (=> b!350008 (= e!214393 tp_is_empty!7617)))

(declare-fun mapIsEmpty!12894 () Bool)

(assert (=> mapIsEmpty!12894 mapRes!12894))

(declare-fun b!350002 () Bool)

(declare-fun res!193969 () Bool)

(assert (=> b!350002 (=> (not res!193969) (not e!214395))))

(assert (=> b!350002 (= res!193969 (and (= (size!9268 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9269 _keys!1895) (size!9268 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!193973 () Bool)

(assert (=> start!34950 (=> (not res!193973) (not e!214395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34950 (= res!193973 (validMask!0 mask!2385))))

(assert (=> start!34950 e!214395))

(assert (=> start!34950 true))

(assert (=> start!34950 tp_is_empty!7617))

(assert (=> start!34950 tp!26571))

(declare-fun array_inv!6588 (array!18819) Bool)

(assert (=> start!34950 (and (array_inv!6588 _values!1525) e!214392)))

(declare-fun array_inv!6589 (array!18821) Bool)

(assert (=> start!34950 (array_inv!6589 _keys!1895)))

(declare-fun b!350009 () Bool)

(assert (=> b!350009 (= e!214391 false)))

(declare-fun lt!164417 () Unit!10843)

(assert (=> b!350009 (= lt!164417 e!214396)))

(declare-fun c!53349 () Bool)

(declare-fun arrayContainsKey!0 (array!18821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350009 (= c!53349 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350010 () Bool)

(declare-fun res!193970 () Bool)

(assert (=> b!350010 (=> (not res!193970) (not e!214395))))

(declare-datatypes ((List!5185 0))(
  ( (Nil!5182) (Cons!5181 (h!6037 (_ BitVec 64)) (t!10321 List!5185)) )
))
(declare-fun arrayNoDuplicates!0 (array!18821 (_ BitVec 32) List!5185) Bool)

(assert (=> b!350010 (= res!193970 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5182))))

(declare-fun b!350011 () Bool)

(declare-fun res!193974 () Bool)

(assert (=> b!350011 (=> (not res!193974) (not e!214395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18821 (_ BitVec 32)) Bool)

(assert (=> b!350011 (= res!193974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350012 () Bool)

(declare-fun res!193972 () Bool)

(assert (=> b!350012 (=> (not res!193972) (not e!214395))))

(declare-datatypes ((tuple2!5564 0))(
  ( (tuple2!5565 (_1!2793 (_ BitVec 64)) (_2!2793 V!11133)) )
))
(declare-datatypes ((List!5186 0))(
  ( (Nil!5183) (Cons!5182 (h!6038 tuple2!5564) (t!10322 List!5186)) )
))
(declare-datatypes ((ListLongMap!4477 0))(
  ( (ListLongMap!4478 (toList!2254 List!5186)) )
))
(declare-fun contains!2322 (ListLongMap!4477 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1775 (array!18821 array!18819 (_ BitVec 32) (_ BitVec 32) V!11133 V!11133 (_ BitVec 32) Int) ListLongMap!4477)

(assert (=> b!350012 (= res!193972 (not (contains!2322 (getCurrentListMap!1775 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34950 res!193973) b!350002))

(assert (= (and b!350002 res!193969) b!350011))

(assert (= (and b!350011 res!193974) b!350010))

(assert (= (and b!350010 res!193970) b!350006))

(assert (= (and b!350006 res!193971) b!350012))

(assert (= (and b!350012 res!193972) b!350005))

(assert (= (and b!350005 res!193968) b!350009))

(assert (= (and b!350009 c!53349) b!350007))

(assert (= (and b!350009 (not c!53349)) b!350004))

(assert (= (and b!350001 condMapEmpty!12894) mapIsEmpty!12894))

(assert (= (and b!350001 (not condMapEmpty!12894)) mapNonEmpty!12894))

(assert (= (and mapNonEmpty!12894 ((_ is ValueCellFull!3465) mapValue!12894)) b!350003))

(assert (= (and b!350001 ((_ is ValueCellFull!3465) mapDefault!12894)) b!350008))

(assert (= start!34950 b!350001))

(declare-fun m!350343 () Bool)

(assert (=> b!350006 m!350343))

(declare-fun m!350345 () Bool)

(assert (=> b!350012 m!350345))

(assert (=> b!350012 m!350345))

(declare-fun m!350347 () Bool)

(assert (=> b!350012 m!350347))

(declare-fun m!350349 () Bool)

(assert (=> b!350010 m!350349))

(declare-fun m!350351 () Bool)

(assert (=> b!350011 m!350351))

(declare-fun m!350353 () Bool)

(assert (=> mapNonEmpty!12894 m!350353))

(declare-fun m!350355 () Bool)

(assert (=> b!350007 m!350355))

(assert (=> b!350007 m!350355))

(declare-fun m!350357 () Bool)

(assert (=> b!350007 m!350357))

(declare-fun m!350359 () Bool)

(assert (=> b!350005 m!350359))

(declare-fun m!350361 () Bool)

(assert (=> b!350009 m!350361))

(declare-fun m!350363 () Bool)

(assert (=> start!34950 m!350363))

(declare-fun m!350365 () Bool)

(assert (=> start!34950 m!350365))

(declare-fun m!350367 () Bool)

(assert (=> start!34950 m!350367))

(check-sat (not b_next!7665) (not b!350011) (not mapNonEmpty!12894) (not b!350007) tp_is_empty!7617 (not b!350005) b_and!14893 (not b!350006) (not start!34950) (not b!350010) (not b!350009) (not b!350012))
(check-sat b_and!14893 (not b_next!7665))
