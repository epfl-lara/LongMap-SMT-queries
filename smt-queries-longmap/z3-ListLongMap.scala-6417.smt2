; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82466 () Bool)

(assert start!82466)

(declare-fun b_free!18571 () Bool)

(declare-fun b_next!18571 () Bool)

(assert (=> start!82466 (= b_free!18571 (not b_next!18571))))

(declare-fun tp!64674 () Bool)

(declare-fun b_and!30069 () Bool)

(assert (=> start!82466 (= tp!64674 b_and!30069)))

(declare-fun b!960355 () Bool)

(declare-fun res!642590 () Bool)

(declare-fun e!541433 () Bool)

(assert (=> b!960355 (=> (not res!642590) (not e!541433))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33353 0))(
  ( (V!33354 (val!10689 Int)) )
))
(declare-datatypes ((ValueCell!10157 0))(
  ( (ValueCellFull!10157 (v!13243 V!33353)) (EmptyCell!10157) )
))
(declare-datatypes ((array!58682 0))(
  ( (array!58683 (arr!28210 (Array (_ BitVec 32) ValueCell!10157)) (size!28690 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58682)

(declare-datatypes ((array!58684 0))(
  ( (array!58685 (arr!28211 (Array (_ BitVec 32) (_ BitVec 64))) (size!28691 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58684)

(assert (=> b!960355 (= res!642590 (and (= (size!28690 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28691 _keys!1668) (size!28690 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960356 () Bool)

(declare-fun e!541434 () Bool)

(declare-fun tp_is_empty!21277 () Bool)

(assert (=> b!960356 (= e!541434 tp_is_empty!21277)))

(declare-fun b!960357 () Bool)

(declare-fun e!541436 () Bool)

(assert (=> b!960357 (= e!541436 tp_is_empty!21277)))

(declare-fun b!960358 () Bool)

(declare-fun e!541435 () Bool)

(declare-fun mapRes!33895 () Bool)

(assert (=> b!960358 (= e!541435 (and e!541434 mapRes!33895))))

(declare-fun condMapEmpty!33895 () Bool)

(declare-fun mapDefault!33895 () ValueCell!10157)

(assert (=> b!960358 (= condMapEmpty!33895 (= (arr!28210 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10157)) mapDefault!33895)))))

(declare-fun b!960359 () Bool)

(declare-fun res!642588 () Bool)

(assert (=> b!960359 (=> (not res!642588) (not e!541433))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960359 (= res!642588 (validKeyInArray!0 (select (arr!28211 _keys!1668) i!793)))))

(declare-fun b!960360 () Bool)

(declare-fun res!642591 () Bool)

(assert (=> b!960360 (=> (not res!642591) (not e!541433))))

(declare-fun minValue!1328 () V!33353)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33353)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13772 0))(
  ( (tuple2!13773 (_1!6897 (_ BitVec 64)) (_2!6897 V!33353)) )
))
(declare-datatypes ((List!19602 0))(
  ( (Nil!19599) (Cons!19598 (h!20766 tuple2!13772) (t!27957 List!19602)) )
))
(declare-datatypes ((ListLongMap!12471 0))(
  ( (ListLongMap!12472 (toList!6251 List!19602)) )
))
(declare-fun contains!5365 (ListLongMap!12471 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3484 (array!58684 array!58682 (_ BitVec 32) (_ BitVec 32) V!33353 V!33353 (_ BitVec 32) Int) ListLongMap!12471)

(assert (=> b!960360 (= res!642591 (contains!5365 (getCurrentListMap!3484 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28211 _keys!1668) i!793)))))

(declare-fun b!960361 () Bool)

(declare-fun res!642592 () Bool)

(assert (=> b!960361 (=> (not res!642592) (not e!541433))))

(declare-datatypes ((List!19603 0))(
  ( (Nil!19600) (Cons!19599 (h!20767 (_ BitVec 64)) (t!27958 List!19603)) )
))
(declare-fun arrayNoDuplicates!0 (array!58684 (_ BitVec 32) List!19603) Bool)

(assert (=> b!960361 (= res!642592 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19600))))

(declare-fun b!960362 () Bool)

(declare-fun res!642589 () Bool)

(assert (=> b!960362 (=> (not res!642589) (not e!541433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58684 (_ BitVec 32)) Bool)

(assert (=> b!960362 (= res!642589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33895 () Bool)

(assert (=> mapIsEmpty!33895 mapRes!33895))

(declare-fun b!960363 () Bool)

(assert (=> b!960363 (= e!541433 (not true))))

(assert (=> b!960363 (contains!5365 (getCurrentListMap!3484 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28211 _keys!1668) i!793))))

(declare-datatypes ((Unit!32152 0))(
  ( (Unit!32153) )
))
(declare-fun lt!430909 () Unit!32152)

(declare-fun lemmaInListMapFromThenInFromSmaller!14 (array!58684 array!58682 (_ BitVec 32) (_ BitVec 32) V!33353 V!33353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32152)

(assert (=> b!960363 (= lt!430909 (lemmaInListMapFromThenInFromSmaller!14 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!960364 () Bool)

(declare-fun res!642587 () Bool)

(assert (=> b!960364 (=> (not res!642587) (not e!541433))))

(assert (=> b!960364 (= res!642587 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28691 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28691 _keys!1668))))))

(declare-fun res!642586 () Bool)

(assert (=> start!82466 (=> (not res!642586) (not e!541433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82466 (= res!642586 (validMask!0 mask!2088))))

(assert (=> start!82466 e!541433))

(assert (=> start!82466 true))

(assert (=> start!82466 tp_is_empty!21277))

(declare-fun array_inv!21945 (array!58684) Bool)

(assert (=> start!82466 (array_inv!21945 _keys!1668)))

(declare-fun array_inv!21946 (array!58682) Bool)

(assert (=> start!82466 (and (array_inv!21946 _values!1386) e!541435)))

(assert (=> start!82466 tp!64674))

(declare-fun mapNonEmpty!33895 () Bool)

(declare-fun tp!64675 () Bool)

(assert (=> mapNonEmpty!33895 (= mapRes!33895 (and tp!64675 e!541436))))

(declare-fun mapRest!33895 () (Array (_ BitVec 32) ValueCell!10157))

(declare-fun mapValue!33895 () ValueCell!10157)

(declare-fun mapKey!33895 () (_ BitVec 32))

(assert (=> mapNonEmpty!33895 (= (arr!28210 _values!1386) (store mapRest!33895 mapKey!33895 mapValue!33895))))

(assert (= (and start!82466 res!642586) b!960355))

(assert (= (and b!960355 res!642590) b!960362))

(assert (= (and b!960362 res!642589) b!960361))

(assert (= (and b!960361 res!642592) b!960364))

(assert (= (and b!960364 res!642587) b!960359))

(assert (= (and b!960359 res!642588) b!960360))

(assert (= (and b!960360 res!642591) b!960363))

(assert (= (and b!960358 condMapEmpty!33895) mapIsEmpty!33895))

(assert (= (and b!960358 (not condMapEmpty!33895)) mapNonEmpty!33895))

(get-info :version)

(assert (= (and mapNonEmpty!33895 ((_ is ValueCellFull!10157) mapValue!33895)) b!960357))

(assert (= (and b!960358 ((_ is ValueCellFull!10157) mapDefault!33895)) b!960356))

(assert (= start!82466 b!960358))

(declare-fun m!891237 () Bool)

(assert (=> mapNonEmpty!33895 m!891237))

(declare-fun m!891239 () Bool)

(assert (=> b!960361 m!891239))

(declare-fun m!891241 () Bool)

(assert (=> b!960363 m!891241))

(declare-fun m!891243 () Bool)

(assert (=> b!960363 m!891243))

(assert (=> b!960363 m!891241))

(assert (=> b!960363 m!891243))

(declare-fun m!891245 () Bool)

(assert (=> b!960363 m!891245))

(declare-fun m!891247 () Bool)

(assert (=> b!960363 m!891247))

(declare-fun m!891249 () Bool)

(assert (=> start!82466 m!891249))

(declare-fun m!891251 () Bool)

(assert (=> start!82466 m!891251))

(declare-fun m!891253 () Bool)

(assert (=> start!82466 m!891253))

(declare-fun m!891255 () Bool)

(assert (=> b!960362 m!891255))

(assert (=> b!960359 m!891243))

(assert (=> b!960359 m!891243))

(declare-fun m!891257 () Bool)

(assert (=> b!960359 m!891257))

(declare-fun m!891259 () Bool)

(assert (=> b!960360 m!891259))

(assert (=> b!960360 m!891243))

(assert (=> b!960360 m!891259))

(assert (=> b!960360 m!891243))

(declare-fun m!891261 () Bool)

(assert (=> b!960360 m!891261))

(check-sat (not b!960362) (not b!960360) (not b!960359) (not b_next!18571) b_and!30069 (not b!960361) tp_is_empty!21277 (not start!82466) (not b!960363) (not mapNonEmpty!33895))
(check-sat b_and!30069 (not b_next!18571))
