; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73120 () Bool)

(assert start!73120)

(declare-fun b_free!13867 () Bool)

(declare-fun b_next!13867 () Bool)

(assert (=> start!73120 (= b_free!13867 (not b_next!13867))))

(declare-fun tp!49106 () Bool)

(declare-fun b_and!22963 () Bool)

(assert (=> start!73120 (= tp!49106 b_and!22963)))

(declare-fun b!848092 () Bool)

(declare-fun res!575961 () Bool)

(declare-fun e!473342 () Bool)

(assert (=> b!848092 (=> (not res!575961) (not e!473342))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48269 0))(
  ( (array!48270 (arr!23161 (Array (_ BitVec 32) (_ BitVec 64))) (size!23602 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48269)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!848092 (= res!575961 (and (= (select (arr!23161 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848093 () Bool)

(declare-fun res!575964 () Bool)

(assert (=> b!848093 (=> (not res!575964) (not e!473342))))

(assert (=> b!848093 (= res!575964 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23602 _keys!868))))))

(declare-fun b!848094 () Bool)

(declare-fun res!575958 () Bool)

(assert (=> b!848094 (=> (not res!575958) (not e!473342))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848094 (= res!575958 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25604 () Bool)

(declare-fun mapRes!25604 () Bool)

(assert (=> mapIsEmpty!25604 mapRes!25604))

(declare-fun b!848095 () Bool)

(declare-fun res!575965 () Bool)

(assert (=> b!848095 (=> (not res!575965) (not e!473342))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26385 0))(
  ( (V!26386 (val!8049 Int)) )
))
(declare-datatypes ((ValueCell!7562 0))(
  ( (ValueCellFull!7562 (v!10474 V!26385)) (EmptyCell!7562) )
))
(declare-datatypes ((array!48271 0))(
  ( (array!48272 (arr!23162 (Array (_ BitVec 32) ValueCell!7562)) (size!23603 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48271)

(assert (=> b!848095 (= res!575965 (and (= (size!23603 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23602 _keys!868) (size!23603 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848096 () Bool)

(declare-fun e!473344 () Bool)

(declare-fun tp_is_empty!16003 () Bool)

(assert (=> b!848096 (= e!473344 tp_is_empty!16003)))

(declare-fun b!848097 () Bool)

(assert (=> b!848097 (= e!473342 false)))

(declare-fun v!557 () V!26385)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10438 0))(
  ( (tuple2!10439 (_1!5230 (_ BitVec 64)) (_2!5230 V!26385)) )
))
(declare-datatypes ((List!16310 0))(
  ( (Nil!16307) (Cons!16306 (h!17443 tuple2!10438) (t!22673 List!16310)) )
))
(declare-datatypes ((ListLongMap!9209 0))(
  ( (ListLongMap!9210 (toList!4620 List!16310)) )
))
(declare-fun lt!382033 () ListLongMap!9209)

(declare-fun minValue!654 () V!26385)

(declare-fun zeroValue!654 () V!26385)

(declare-fun getCurrentListMapNoExtraKeys!2678 (array!48269 array!48271 (_ BitVec 32) (_ BitVec 32) V!26385 V!26385 (_ BitVec 32) Int) ListLongMap!9209)

(assert (=> b!848097 (= lt!382033 (getCurrentListMapNoExtraKeys!2678 _keys!868 (array!48272 (store (arr!23162 _values!688) i!612 (ValueCellFull!7562 v!557)) (size!23603 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!382034 () ListLongMap!9209)

(assert (=> b!848097 (= lt!382034 (getCurrentListMapNoExtraKeys!2678 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848098 () Bool)

(declare-fun e!473341 () Bool)

(assert (=> b!848098 (= e!473341 tp_is_empty!16003)))

(declare-fun b!848099 () Bool)

(declare-fun res!575962 () Bool)

(assert (=> b!848099 (=> (not res!575962) (not e!473342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848099 (= res!575962 (validKeyInArray!0 k0!854))))

(declare-fun b!848100 () Bool)

(declare-fun res!575960 () Bool)

(assert (=> b!848100 (=> (not res!575960) (not e!473342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48269 (_ BitVec 32)) Bool)

(assert (=> b!848100 (= res!575960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848101 () Bool)

(declare-fun e!473340 () Bool)

(assert (=> b!848101 (= e!473340 (and e!473341 mapRes!25604))))

(declare-fun condMapEmpty!25604 () Bool)

(declare-fun mapDefault!25604 () ValueCell!7562)

(assert (=> b!848101 (= condMapEmpty!25604 (= (arr!23162 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7562)) mapDefault!25604)))))

(declare-fun b!848102 () Bool)

(declare-fun res!575963 () Bool)

(assert (=> b!848102 (=> (not res!575963) (not e!473342))))

(declare-datatypes ((List!16311 0))(
  ( (Nil!16308) (Cons!16307 (h!17444 (_ BitVec 64)) (t!22674 List!16311)) )
))
(declare-fun arrayNoDuplicates!0 (array!48269 (_ BitVec 32) List!16311) Bool)

(assert (=> b!848102 (= res!575963 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16308))))

(declare-fun mapNonEmpty!25604 () Bool)

(declare-fun tp!49105 () Bool)

(assert (=> mapNonEmpty!25604 (= mapRes!25604 (and tp!49105 e!473344))))

(declare-fun mapKey!25604 () (_ BitVec 32))

(declare-fun mapValue!25604 () ValueCell!7562)

(declare-fun mapRest!25604 () (Array (_ BitVec 32) ValueCell!7562))

(assert (=> mapNonEmpty!25604 (= (arr!23162 _values!688) (store mapRest!25604 mapKey!25604 mapValue!25604))))

(declare-fun res!575959 () Bool)

(assert (=> start!73120 (=> (not res!575959) (not e!473342))))

(assert (=> start!73120 (= res!575959 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23602 _keys!868))))))

(assert (=> start!73120 e!473342))

(assert (=> start!73120 tp_is_empty!16003))

(assert (=> start!73120 true))

(assert (=> start!73120 tp!49106))

(declare-fun array_inv!18448 (array!48269) Bool)

(assert (=> start!73120 (array_inv!18448 _keys!868)))

(declare-fun array_inv!18449 (array!48271) Bool)

(assert (=> start!73120 (and (array_inv!18449 _values!688) e!473340)))

(assert (= (and start!73120 res!575959) b!848094))

(assert (= (and b!848094 res!575958) b!848095))

(assert (= (and b!848095 res!575965) b!848100))

(assert (= (and b!848100 res!575960) b!848102))

(assert (= (and b!848102 res!575963) b!848093))

(assert (= (and b!848093 res!575964) b!848099))

(assert (= (and b!848099 res!575962) b!848092))

(assert (= (and b!848092 res!575961) b!848097))

(assert (= (and b!848101 condMapEmpty!25604) mapIsEmpty!25604))

(assert (= (and b!848101 (not condMapEmpty!25604)) mapNonEmpty!25604))

(get-info :version)

(assert (= (and mapNonEmpty!25604 ((_ is ValueCellFull!7562) mapValue!25604)) b!848096))

(assert (= (and b!848101 ((_ is ValueCellFull!7562) mapDefault!25604)) b!848098))

(assert (= start!73120 b!848101))

(declare-fun m!789629 () Bool)

(assert (=> mapNonEmpty!25604 m!789629))

(declare-fun m!789631 () Bool)

(assert (=> b!848094 m!789631))

(declare-fun m!789633 () Bool)

(assert (=> b!848102 m!789633))

(declare-fun m!789635 () Bool)

(assert (=> b!848092 m!789635))

(declare-fun m!789637 () Bool)

(assert (=> start!73120 m!789637))

(declare-fun m!789639 () Bool)

(assert (=> start!73120 m!789639))

(declare-fun m!789641 () Bool)

(assert (=> b!848099 m!789641))

(declare-fun m!789643 () Bool)

(assert (=> b!848100 m!789643))

(declare-fun m!789645 () Bool)

(assert (=> b!848097 m!789645))

(declare-fun m!789647 () Bool)

(assert (=> b!848097 m!789647))

(declare-fun m!789649 () Bool)

(assert (=> b!848097 m!789649))

(check-sat (not b!848100) (not b!848094) (not b_next!13867) b_and!22963 (not b!848097) (not start!73120) (not b!848102) (not mapNonEmpty!25604) tp_is_empty!16003 (not b!848099))
(check-sat b_and!22963 (not b_next!13867))
