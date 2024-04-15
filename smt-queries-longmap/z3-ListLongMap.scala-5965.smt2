; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77598 () Bool)

(assert start!77598)

(declare-fun b_free!16201 () Bool)

(declare-fun b_next!16201 () Bool)

(assert (=> start!77598 (= b_free!16201 (not b_next!16201))))

(declare-fun tp!56865 () Bool)

(declare-fun b_and!26541 () Bool)

(assert (=> start!77598 (= tp!56865 b_and!26541)))

(declare-fun b!904420 () Bool)

(declare-fun res!610311 () Bool)

(declare-fun e!506774 () Bool)

(assert (=> b!904420 (=> (not res!610311) (not e!506774))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904420 (= res!610311 (inRange!0 i!717 mask!1756))))

(declare-fun b!904421 () Bool)

(declare-fun res!610314 () Bool)

(assert (=> b!904421 (=> (not res!610314) (not e!506774))))

(declare-datatypes ((array!53263 0))(
  ( (array!53264 (arr!25591 (Array (_ BitVec 32) (_ BitVec 64))) (size!26052 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53263)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!904421 (= res!610314 (and (= (select (arr!25591 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904422 () Bool)

(declare-fun e!506777 () Bool)

(declare-fun tp_is_empty!18619 () Bool)

(assert (=> b!904422 (= e!506777 tp_is_empty!18619)))

(declare-fun b!904423 () Bool)

(declare-fun res!610307 () Bool)

(assert (=> b!904423 (=> (not res!610307) (not e!506774))))

(declare-datatypes ((V!29791 0))(
  ( (V!29792 (val!9360 Int)) )
))
(declare-datatypes ((ValueCell!8828 0))(
  ( (ValueCellFull!8828 (v!11864 V!29791)) (EmptyCell!8828) )
))
(declare-datatypes ((array!53265 0))(
  ( (array!53266 (arr!25592 (Array (_ BitVec 32) ValueCell!8828)) (size!26053 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53265)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!904423 (= res!610307 (and (= (size!26053 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26052 _keys!1386) (size!26053 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904424 () Bool)

(declare-fun e!506779 () Bool)

(declare-fun e!506776 () Bool)

(assert (=> b!904424 (= e!506779 e!506776)))

(declare-fun res!610308 () Bool)

(assert (=> b!904424 (=> res!610308 e!506776)))

(declare-datatypes ((tuple2!12188 0))(
  ( (tuple2!12189 (_1!6105 (_ BitVec 64)) (_2!6105 V!29791)) )
))
(declare-datatypes ((List!17990 0))(
  ( (Nil!17987) (Cons!17986 (h!19132 tuple2!12188) (t!25364 List!17990)) )
))
(declare-datatypes ((ListLongMap!10875 0))(
  ( (ListLongMap!10876 (toList!5453 List!17990)) )
))
(declare-fun lt!408055 () ListLongMap!10875)

(declare-fun contains!4463 (ListLongMap!10875 (_ BitVec 64)) Bool)

(assert (=> b!904424 (= res!610308 (not (contains!4463 lt!408055 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29791)

(declare-fun minValue!1094 () V!29791)

(declare-fun getCurrentListMap!2667 (array!53263 array!53265 (_ BitVec 32) (_ BitVec 32) V!29791 V!29791 (_ BitVec 32) Int) ListLongMap!10875)

(assert (=> b!904424 (= lt!408055 (getCurrentListMap!2667 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904425 () Bool)

(declare-fun e!506775 () Bool)

(declare-fun mapRes!29641 () Bool)

(assert (=> b!904425 (= e!506775 (and e!506777 mapRes!29641))))

(declare-fun condMapEmpty!29641 () Bool)

(declare-fun mapDefault!29641 () ValueCell!8828)

(assert (=> b!904425 (= condMapEmpty!29641 (= (arr!25592 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8828)) mapDefault!29641)))))

(declare-fun b!904426 () Bool)

(assert (=> b!904426 (= e!506774 (not e!506779))))

(declare-fun res!610313 () Bool)

(assert (=> b!904426 (=> res!610313 e!506779)))

(assert (=> b!904426 (= res!610313 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26052 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904426 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30614 0))(
  ( (Unit!30615) )
))
(declare-fun lt!408054 () Unit!30614)

(declare-fun lemmaKeyInListMapIsInArray!189 (array!53263 array!53265 (_ BitVec 32) (_ BitVec 32) V!29791 V!29791 (_ BitVec 64) Int) Unit!30614)

(assert (=> b!904426 (= lt!408054 (lemmaKeyInListMapIsInArray!189 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904427 () Bool)

(declare-fun e!506778 () Bool)

(assert (=> b!904427 (= e!506778 tp_is_empty!18619)))

(declare-fun res!610312 () Bool)

(assert (=> start!77598 (=> (not res!610312) (not e!506774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77598 (= res!610312 (validMask!0 mask!1756))))

(assert (=> start!77598 e!506774))

(declare-fun array_inv!20110 (array!53265) Bool)

(assert (=> start!77598 (and (array_inv!20110 _values!1152) e!506775)))

(assert (=> start!77598 tp!56865))

(assert (=> start!77598 true))

(assert (=> start!77598 tp_is_empty!18619))

(declare-fun array_inv!20111 (array!53263) Bool)

(assert (=> start!77598 (array_inv!20111 _keys!1386)))

(declare-fun b!904428 () Bool)

(declare-fun res!610306 () Bool)

(assert (=> b!904428 (=> (not res!610306) (not e!506774))))

(declare-datatypes ((List!17991 0))(
  ( (Nil!17988) (Cons!17987 (h!19133 (_ BitVec 64)) (t!25365 List!17991)) )
))
(declare-fun arrayNoDuplicates!0 (array!53263 (_ BitVec 32) List!17991) Bool)

(assert (=> b!904428 (= res!610306 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17988))))

(declare-fun mapNonEmpty!29641 () Bool)

(declare-fun tp!56866 () Bool)

(assert (=> mapNonEmpty!29641 (= mapRes!29641 (and tp!56866 e!506778))))

(declare-fun mapValue!29641 () ValueCell!8828)

(declare-fun mapRest!29641 () (Array (_ BitVec 32) ValueCell!8828))

(declare-fun mapKey!29641 () (_ BitVec 32))

(assert (=> mapNonEmpty!29641 (= (arr!25592 _values!1152) (store mapRest!29641 mapKey!29641 mapValue!29641))))

(declare-fun b!904429 () Bool)

(declare-fun res!610310 () Bool)

(assert (=> b!904429 (=> (not res!610310) (not e!506774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53263 (_ BitVec 32)) Bool)

(assert (=> b!904429 (= res!610310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904430 () Bool)

(declare-fun res!610309 () Bool)

(assert (=> b!904430 (=> (not res!610309) (not e!506774))))

(assert (=> b!904430 (= res!610309 (contains!4463 (getCurrentListMap!2667 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904431 () Bool)

(assert (=> b!904431 (= e!506776 true)))

(declare-fun lt!408053 () V!29791)

(declare-fun apply!435 (ListLongMap!10875 (_ BitVec 64)) V!29791)

(assert (=> b!904431 (= lt!408053 (apply!435 lt!408055 k0!1033))))

(declare-fun mapIsEmpty!29641 () Bool)

(assert (=> mapIsEmpty!29641 mapRes!29641))

(assert (= (and start!77598 res!610312) b!904423))

(assert (= (and b!904423 res!610307) b!904429))

(assert (= (and b!904429 res!610310) b!904428))

(assert (= (and b!904428 res!610306) b!904430))

(assert (= (and b!904430 res!610309) b!904420))

(assert (= (and b!904420 res!610311) b!904421))

(assert (= (and b!904421 res!610314) b!904426))

(assert (= (and b!904426 (not res!610313)) b!904424))

(assert (= (and b!904424 (not res!610308)) b!904431))

(assert (= (and b!904425 condMapEmpty!29641) mapIsEmpty!29641))

(assert (= (and b!904425 (not condMapEmpty!29641)) mapNonEmpty!29641))

(get-info :version)

(assert (= (and mapNonEmpty!29641 ((_ is ValueCellFull!8828) mapValue!29641)) b!904427))

(assert (= (and b!904425 ((_ is ValueCellFull!8828) mapDefault!29641)) b!904422))

(assert (= start!77598 b!904425))

(declare-fun m!839357 () Bool)

(assert (=> b!904428 m!839357))

(declare-fun m!839359 () Bool)

(assert (=> mapNonEmpty!29641 m!839359))

(declare-fun m!839361 () Bool)

(assert (=> b!904431 m!839361))

(declare-fun m!839363 () Bool)

(assert (=> start!77598 m!839363))

(declare-fun m!839365 () Bool)

(assert (=> start!77598 m!839365))

(declare-fun m!839367 () Bool)

(assert (=> start!77598 m!839367))

(declare-fun m!839369 () Bool)

(assert (=> b!904420 m!839369))

(declare-fun m!839371 () Bool)

(assert (=> b!904421 m!839371))

(declare-fun m!839373 () Bool)

(assert (=> b!904426 m!839373))

(declare-fun m!839375 () Bool)

(assert (=> b!904426 m!839375))

(declare-fun m!839377 () Bool)

(assert (=> b!904429 m!839377))

(declare-fun m!839379 () Bool)

(assert (=> b!904430 m!839379))

(assert (=> b!904430 m!839379))

(declare-fun m!839381 () Bool)

(assert (=> b!904430 m!839381))

(declare-fun m!839383 () Bool)

(assert (=> b!904424 m!839383))

(declare-fun m!839385 () Bool)

(assert (=> b!904424 m!839385))

(check-sat (not mapNonEmpty!29641) (not b!904420) b_and!26541 (not b!904428) (not b_next!16201) tp_is_empty!18619 (not start!77598) (not b!904426) (not b!904429) (not b!904431) (not b!904424) (not b!904430))
(check-sat b_and!26541 (not b_next!16201))
