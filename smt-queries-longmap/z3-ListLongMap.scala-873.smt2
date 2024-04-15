; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20338 () Bool)

(assert start!20338)

(declare-fun b_free!4993 () Bool)

(declare-fun b_next!4993 () Bool)

(assert (=> start!20338 (= b_free!4993 (not b_next!4993))))

(declare-fun tp!18010 () Bool)

(declare-fun b_and!11713 () Bool)

(assert (=> start!20338 (= tp!18010 b_and!11713)))

(declare-fun b!200355 () Bool)

(declare-fun res!95456 () Bool)

(declare-fun e!131375 () Bool)

(assert (=> b!200355 (=> (not res!95456) (not e!131375))))

(declare-datatypes ((array!8915 0))(
  ( (array!8916 (arr!4207 (Array (_ BitVec 32) (_ BitVec 64))) (size!4533 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8915)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6113 0))(
  ( (V!6114 (val!2469 Int)) )
))
(declare-datatypes ((ValueCell!2081 0))(
  ( (ValueCellFull!2081 (v!4433 V!6113)) (EmptyCell!2081) )
))
(declare-datatypes ((array!8917 0))(
  ( (array!8918 (arr!4208 (Array (_ BitVec 32) ValueCell!2081)) (size!4534 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8917)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!200355 (= res!95456 (and (= (size!4534 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4533 _keys!825) (size!4534 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200357 () Bool)

(declare-fun res!95461 () Bool)

(assert (=> b!200357 (=> (not res!95461) (not e!131375))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200357 (= res!95461 (validKeyInArray!0 k0!843))))

(declare-fun b!200358 () Bool)

(declare-fun e!131376 () Bool)

(declare-fun e!131377 () Bool)

(assert (=> b!200358 (= e!131376 e!131377)))

(declare-fun res!95460 () Bool)

(assert (=> b!200358 (=> res!95460 e!131377)))

(assert (=> b!200358 (= res!95460 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3706 0))(
  ( (tuple2!3707 (_1!1864 (_ BitVec 64)) (_2!1864 V!6113)) )
))
(declare-datatypes ((List!2630 0))(
  ( (Nil!2627) (Cons!2626 (h!3268 tuple2!3706) (t!7552 List!2630)) )
))
(declare-datatypes ((ListLongMap!2609 0))(
  ( (ListLongMap!2610 (toList!1320 List!2630)) )
))
(declare-fun lt!98950 () ListLongMap!2609)

(declare-fun lt!98941 () ListLongMap!2609)

(assert (=> b!200358 (= lt!98950 lt!98941)))

(declare-fun lt!98952 () ListLongMap!2609)

(declare-fun lt!98942 () tuple2!3706)

(declare-fun +!369 (ListLongMap!2609 tuple2!3706) ListLongMap!2609)

(assert (=> b!200358 (= lt!98941 (+!369 lt!98952 lt!98942))))

(declare-fun lt!98940 () ListLongMap!2609)

(declare-datatypes ((Unit!5990 0))(
  ( (Unit!5991) )
))
(declare-fun lt!98946 () Unit!5990)

(declare-fun v!520 () V!6113)

(declare-fun zeroValue!615 () V!6113)

(declare-fun addCommutativeForDiffKeys!79 (ListLongMap!2609 (_ BitVec 64) V!6113 (_ BitVec 64) V!6113) Unit!5990)

(assert (=> b!200358 (= lt!98946 (addCommutativeForDiffKeys!79 lt!98940 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!98943 () ListLongMap!2609)

(declare-fun lt!98944 () tuple2!3706)

(assert (=> b!200358 (= lt!98943 (+!369 lt!98950 lt!98944))))

(declare-fun lt!98949 () ListLongMap!2609)

(declare-fun lt!98951 () tuple2!3706)

(assert (=> b!200358 (= lt!98950 (+!369 lt!98949 lt!98951))))

(declare-fun lt!98947 () ListLongMap!2609)

(declare-fun lt!98939 () ListLongMap!2609)

(assert (=> b!200358 (= lt!98947 lt!98939)))

(assert (=> b!200358 (= lt!98939 (+!369 lt!98952 lt!98944))))

(assert (=> b!200358 (= lt!98952 (+!369 lt!98940 lt!98951))))

(declare-fun lt!98948 () ListLongMap!2609)

(assert (=> b!200358 (= lt!98943 (+!369 (+!369 lt!98948 lt!98951) lt!98944))))

(declare-fun minValue!615 () V!6113)

(assert (=> b!200358 (= lt!98944 (tuple2!3707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200358 (= lt!98951 (tuple2!3707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!8342 () Bool)

(declare-fun mapRes!8342 () Bool)

(assert (=> mapIsEmpty!8342 mapRes!8342))

(declare-fun b!200359 () Bool)

(declare-fun res!95458 () Bool)

(assert (=> b!200359 (=> (not res!95458) (not e!131375))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200359 (= res!95458 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4533 _keys!825))))))

(declare-fun b!200360 () Bool)

(declare-fun e!131374 () Bool)

(declare-fun tp_is_empty!4849 () Bool)

(assert (=> b!200360 (= e!131374 tp_is_empty!4849)))

(declare-fun b!200361 () Bool)

(declare-fun res!95457 () Bool)

(assert (=> b!200361 (=> (not res!95457) (not e!131375))))

(declare-datatypes ((List!2631 0))(
  ( (Nil!2628) (Cons!2627 (h!3269 (_ BitVec 64)) (t!7553 List!2631)) )
))
(declare-fun arrayNoDuplicates!0 (array!8915 (_ BitVec 32) List!2631) Bool)

(assert (=> b!200361 (= res!95457 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2628))))

(declare-fun b!200362 () Bool)

(assert (=> b!200362 (= e!131377 true)))

(assert (=> b!200362 (= (+!369 lt!98941 lt!98944) (+!369 lt!98939 lt!98942))))

(declare-fun lt!98945 () Unit!5990)

(assert (=> b!200362 (= lt!98945 (addCommutativeForDiffKeys!79 lt!98952 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200363 () Bool)

(declare-fun res!95454 () Bool)

(assert (=> b!200363 (=> (not res!95454) (not e!131375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8915 (_ BitVec 32)) Bool)

(assert (=> b!200363 (= res!95454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8342 () Bool)

(declare-fun tp!18011 () Bool)

(assert (=> mapNonEmpty!8342 (= mapRes!8342 (and tp!18011 e!131374))))

(declare-fun mapRest!8342 () (Array (_ BitVec 32) ValueCell!2081))

(declare-fun mapKey!8342 () (_ BitVec 32))

(declare-fun mapValue!8342 () ValueCell!2081)

(assert (=> mapNonEmpty!8342 (= (arr!4208 _values!649) (store mapRest!8342 mapKey!8342 mapValue!8342))))

(declare-fun b!200364 () Bool)

(declare-fun res!95459 () Bool)

(assert (=> b!200364 (=> (not res!95459) (not e!131375))))

(assert (=> b!200364 (= res!95459 (= (select (arr!4207 _keys!825) i!601) k0!843))))

(declare-fun b!200356 () Bool)

(declare-fun e!131378 () Bool)

(declare-fun e!131379 () Bool)

(assert (=> b!200356 (= e!131378 (and e!131379 mapRes!8342))))

(declare-fun condMapEmpty!8342 () Bool)

(declare-fun mapDefault!8342 () ValueCell!2081)

(assert (=> b!200356 (= condMapEmpty!8342 (= (arr!4208 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2081)) mapDefault!8342)))))

(declare-fun res!95455 () Bool)

(assert (=> start!20338 (=> (not res!95455) (not e!131375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20338 (= res!95455 (validMask!0 mask!1149))))

(assert (=> start!20338 e!131375))

(declare-fun array_inv!2745 (array!8917) Bool)

(assert (=> start!20338 (and (array_inv!2745 _values!649) e!131378)))

(assert (=> start!20338 true))

(assert (=> start!20338 tp_is_empty!4849))

(declare-fun array_inv!2746 (array!8915) Bool)

(assert (=> start!20338 (array_inv!2746 _keys!825)))

(assert (=> start!20338 tp!18010))

(declare-fun b!200365 () Bool)

(assert (=> b!200365 (= e!131375 (not e!131376))))

(declare-fun res!95462 () Bool)

(assert (=> b!200365 (=> res!95462 e!131376)))

(assert (=> b!200365 (= res!95462 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!888 (array!8915 array!8917 (_ BitVec 32) (_ BitVec 32) V!6113 V!6113 (_ BitVec 32) Int) ListLongMap!2609)

(assert (=> b!200365 (= lt!98947 (getCurrentListMap!888 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98954 () array!8917)

(assert (=> b!200365 (= lt!98943 (getCurrentListMap!888 _keys!825 lt!98954 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200365 (and (= lt!98948 lt!98949) (= lt!98949 lt!98948))))

(assert (=> b!200365 (= lt!98949 (+!369 lt!98940 lt!98942))))

(assert (=> b!200365 (= lt!98942 (tuple2!3707 k0!843 v!520))))

(declare-fun lt!98953 () Unit!5990)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!47 (array!8915 array!8917 (_ BitVec 32) (_ BitVec 32) V!6113 V!6113 (_ BitVec 32) (_ BitVec 64) V!6113 (_ BitVec 32) Int) Unit!5990)

(assert (=> b!200365 (= lt!98953 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!47 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!298 (array!8915 array!8917 (_ BitVec 32) (_ BitVec 32) V!6113 V!6113 (_ BitVec 32) Int) ListLongMap!2609)

(assert (=> b!200365 (= lt!98948 (getCurrentListMapNoExtraKeys!298 _keys!825 lt!98954 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200365 (= lt!98954 (array!8918 (store (arr!4208 _values!649) i!601 (ValueCellFull!2081 v!520)) (size!4534 _values!649)))))

(assert (=> b!200365 (= lt!98940 (getCurrentListMapNoExtraKeys!298 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200366 () Bool)

(assert (=> b!200366 (= e!131379 tp_is_empty!4849)))

(assert (= (and start!20338 res!95455) b!200355))

(assert (= (and b!200355 res!95456) b!200363))

(assert (= (and b!200363 res!95454) b!200361))

(assert (= (and b!200361 res!95457) b!200359))

(assert (= (and b!200359 res!95458) b!200357))

(assert (= (and b!200357 res!95461) b!200364))

(assert (= (and b!200364 res!95459) b!200365))

(assert (= (and b!200365 (not res!95462)) b!200358))

(assert (= (and b!200358 (not res!95460)) b!200362))

(assert (= (and b!200356 condMapEmpty!8342) mapIsEmpty!8342))

(assert (= (and b!200356 (not condMapEmpty!8342)) mapNonEmpty!8342))

(get-info :version)

(assert (= (and mapNonEmpty!8342 ((_ is ValueCellFull!2081) mapValue!8342)) b!200360))

(assert (= (and b!200356 ((_ is ValueCellFull!2081) mapDefault!8342)) b!200366))

(assert (= start!20338 b!200356))

(declare-fun m!226395 () Bool)

(assert (=> mapNonEmpty!8342 m!226395))

(declare-fun m!226397 () Bool)

(assert (=> b!200364 m!226397))

(declare-fun m!226399 () Bool)

(assert (=> b!200358 m!226399))

(declare-fun m!226401 () Bool)

(assert (=> b!200358 m!226401))

(declare-fun m!226403 () Bool)

(assert (=> b!200358 m!226403))

(assert (=> b!200358 m!226401))

(declare-fun m!226405 () Bool)

(assert (=> b!200358 m!226405))

(declare-fun m!226407 () Bool)

(assert (=> b!200358 m!226407))

(declare-fun m!226409 () Bool)

(assert (=> b!200358 m!226409))

(declare-fun m!226411 () Bool)

(assert (=> b!200358 m!226411))

(declare-fun m!226413 () Bool)

(assert (=> b!200358 m!226413))

(declare-fun m!226415 () Bool)

(assert (=> b!200362 m!226415))

(declare-fun m!226417 () Bool)

(assert (=> b!200362 m!226417))

(declare-fun m!226419 () Bool)

(assert (=> b!200362 m!226419))

(declare-fun m!226421 () Bool)

(assert (=> start!20338 m!226421))

(declare-fun m!226423 () Bool)

(assert (=> start!20338 m!226423))

(declare-fun m!226425 () Bool)

(assert (=> start!20338 m!226425))

(declare-fun m!226427 () Bool)

(assert (=> b!200365 m!226427))

(declare-fun m!226429 () Bool)

(assert (=> b!200365 m!226429))

(declare-fun m!226431 () Bool)

(assert (=> b!200365 m!226431))

(declare-fun m!226433 () Bool)

(assert (=> b!200365 m!226433))

(declare-fun m!226435 () Bool)

(assert (=> b!200365 m!226435))

(declare-fun m!226437 () Bool)

(assert (=> b!200365 m!226437))

(declare-fun m!226439 () Bool)

(assert (=> b!200365 m!226439))

(declare-fun m!226441 () Bool)

(assert (=> b!200361 m!226441))

(declare-fun m!226443 () Bool)

(assert (=> b!200357 m!226443))

(declare-fun m!226445 () Bool)

(assert (=> b!200363 m!226445))

(check-sat (not b_next!4993) (not b!200362) (not start!20338) (not b!200358) (not b!200365) (not b!200357) b_and!11713 tp_is_empty!4849 (not b!200361) (not mapNonEmpty!8342) (not b!200363))
(check-sat b_and!11713 (not b_next!4993))
