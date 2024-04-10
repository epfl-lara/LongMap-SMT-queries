; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73296 () Bool)

(assert start!73296)

(declare-fun b_free!14211 () Bool)

(declare-fun b_next!14211 () Bool)

(assert (=> start!73296 (= b_free!14211 (not b_next!14211))))

(declare-fun tp!50136 () Bool)

(declare-fun b_and!23567 () Bool)

(assert (=> start!73296 (= tp!50136 b_and!23567)))

(declare-fun b!855007 () Bool)

(declare-fun res!580647 () Bool)

(declare-fun e!476724 () Bool)

(assert (=> b!855007 (=> (not res!580647) (not e!476724))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48890 0))(
  ( (array!48891 (arr!23476 (Array (_ BitVec 32) (_ BitVec 64))) (size!23916 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48890)

(assert (=> b!855007 (= res!580647 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23916 _keys!868))))))

(declare-fun b!855008 () Bool)

(assert (=> b!855008 (= e!476724 false)))

(declare-datatypes ((V!26843 0))(
  ( (V!26844 (val!8221 Int)) )
))
(declare-fun v!557 () V!26843)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10830 0))(
  ( (tuple2!10831 (_1!5426 (_ BitVec 64)) (_2!5426 V!26843)) )
))
(declare-datatypes ((List!16644 0))(
  ( (Nil!16641) (Cons!16640 (h!17771 tuple2!10830) (t!23285 List!16644)) )
))
(declare-datatypes ((ListLongMap!9599 0))(
  ( (ListLongMap!9600 (toList!4815 List!16644)) )
))
(declare-fun lt!385621 () ListLongMap!9599)

(declare-datatypes ((ValueCell!7734 0))(
  ( (ValueCellFull!7734 (v!10646 V!26843)) (EmptyCell!7734) )
))
(declare-datatypes ((array!48892 0))(
  ( (array!48893 (arr!23477 (Array (_ BitVec 32) ValueCell!7734)) (size!23917 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48892)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26843)

(declare-fun zeroValue!654 () V!26843)

(declare-fun getCurrentListMapNoExtraKeys!2796 (array!48890 array!48892 (_ BitVec 32) (_ BitVec 32) V!26843 V!26843 (_ BitVec 32) Int) ListLongMap!9599)

(assert (=> b!855008 (= lt!385621 (getCurrentListMapNoExtraKeys!2796 _keys!868 (array!48893 (store (arr!23477 _values!688) i!612 (ValueCellFull!7734 v!557)) (size!23917 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385620 () ListLongMap!9599)

(assert (=> b!855008 (= lt!385620 (getCurrentListMapNoExtraKeys!2796 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855009 () Bool)

(declare-fun res!580646 () Bool)

(assert (=> b!855009 (=> (not res!580646) (not e!476724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48890 (_ BitVec 32)) Bool)

(assert (=> b!855009 (= res!580646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855010 () Bool)

(declare-fun res!580642 () Bool)

(assert (=> b!855010 (=> (not res!580642) (not e!476724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855010 (= res!580642 (validMask!0 mask!1196))))

(declare-fun b!855012 () Bool)

(declare-fun e!476725 () Bool)

(declare-fun tp_is_empty!16347 () Bool)

(assert (=> b!855012 (= e!476725 tp_is_empty!16347)))

(declare-fun b!855013 () Bool)

(declare-fun res!580649 () Bool)

(assert (=> b!855013 (=> (not res!580649) (not e!476724))))

(assert (=> b!855013 (= res!580649 (and (= (size!23917 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23916 _keys!868) (size!23917 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26120 () Bool)

(declare-fun mapRes!26120 () Bool)

(assert (=> mapIsEmpty!26120 mapRes!26120))

(declare-fun b!855014 () Bool)

(declare-fun res!580645 () Bool)

(assert (=> b!855014 (=> (not res!580645) (not e!476724))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!855014 (= res!580645 (and (= (select (arr!23476 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855015 () Bool)

(declare-fun res!580643 () Bool)

(assert (=> b!855015 (=> (not res!580643) (not e!476724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855015 (= res!580643 (validKeyInArray!0 k0!854))))

(declare-fun res!580644 () Bool)

(assert (=> start!73296 (=> (not res!580644) (not e!476724))))

(assert (=> start!73296 (= res!580644 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23916 _keys!868))))))

(assert (=> start!73296 e!476724))

(assert (=> start!73296 tp_is_empty!16347))

(assert (=> start!73296 true))

(assert (=> start!73296 tp!50136))

(declare-fun array_inv!18602 (array!48890) Bool)

(assert (=> start!73296 (array_inv!18602 _keys!868)))

(declare-fun e!476726 () Bool)

(declare-fun array_inv!18603 (array!48892) Bool)

(assert (=> start!73296 (and (array_inv!18603 _values!688) e!476726)))

(declare-fun b!855011 () Bool)

(declare-fun e!476727 () Bool)

(assert (=> b!855011 (= e!476727 tp_is_empty!16347)))

(declare-fun b!855016 () Bool)

(assert (=> b!855016 (= e!476726 (and e!476727 mapRes!26120))))

(declare-fun condMapEmpty!26120 () Bool)

(declare-fun mapDefault!26120 () ValueCell!7734)

(assert (=> b!855016 (= condMapEmpty!26120 (= (arr!23477 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7734)) mapDefault!26120)))))

(declare-fun b!855017 () Bool)

(declare-fun res!580648 () Bool)

(assert (=> b!855017 (=> (not res!580648) (not e!476724))))

(declare-datatypes ((List!16645 0))(
  ( (Nil!16642) (Cons!16641 (h!17772 (_ BitVec 64)) (t!23286 List!16645)) )
))
(declare-fun arrayNoDuplicates!0 (array!48890 (_ BitVec 32) List!16645) Bool)

(assert (=> b!855017 (= res!580648 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16642))))

(declare-fun mapNonEmpty!26120 () Bool)

(declare-fun tp!50137 () Bool)

(assert (=> mapNonEmpty!26120 (= mapRes!26120 (and tp!50137 e!476725))))

(declare-fun mapRest!26120 () (Array (_ BitVec 32) ValueCell!7734))

(declare-fun mapKey!26120 () (_ BitVec 32))

(declare-fun mapValue!26120 () ValueCell!7734)

(assert (=> mapNonEmpty!26120 (= (arr!23477 _values!688) (store mapRest!26120 mapKey!26120 mapValue!26120))))

(assert (= (and start!73296 res!580644) b!855010))

(assert (= (and b!855010 res!580642) b!855013))

(assert (= (and b!855013 res!580649) b!855009))

(assert (= (and b!855009 res!580646) b!855017))

(assert (= (and b!855017 res!580648) b!855007))

(assert (= (and b!855007 res!580647) b!855015))

(assert (= (and b!855015 res!580643) b!855014))

(assert (= (and b!855014 res!580645) b!855008))

(assert (= (and b!855016 condMapEmpty!26120) mapIsEmpty!26120))

(assert (= (and b!855016 (not condMapEmpty!26120)) mapNonEmpty!26120))

(get-info :version)

(assert (= (and mapNonEmpty!26120 ((_ is ValueCellFull!7734) mapValue!26120)) b!855012))

(assert (= (and b!855016 ((_ is ValueCellFull!7734) mapDefault!26120)) b!855011))

(assert (= start!73296 b!855016))

(declare-fun m!796353 () Bool)

(assert (=> b!855008 m!796353))

(declare-fun m!796355 () Bool)

(assert (=> b!855008 m!796355))

(declare-fun m!796357 () Bool)

(assert (=> b!855008 m!796357))

(declare-fun m!796359 () Bool)

(assert (=> b!855015 m!796359))

(declare-fun m!796361 () Bool)

(assert (=> start!73296 m!796361))

(declare-fun m!796363 () Bool)

(assert (=> start!73296 m!796363))

(declare-fun m!796365 () Bool)

(assert (=> b!855010 m!796365))

(declare-fun m!796367 () Bool)

(assert (=> b!855017 m!796367))

(declare-fun m!796369 () Bool)

(assert (=> mapNonEmpty!26120 m!796369))

(declare-fun m!796371 () Bool)

(assert (=> b!855014 m!796371))

(declare-fun m!796373 () Bool)

(assert (=> b!855009 m!796373))

(check-sat b_and!23567 (not start!73296) (not b_next!14211) (not b!855009) (not b!855010) (not b!855017) tp_is_empty!16347 (not mapNonEmpty!26120) (not b!855008) (not b!855015))
(check-sat b_and!23567 (not b_next!14211))
