; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73090 () Bool)

(assert start!73090)

(declare-fun b_free!13837 () Bool)

(declare-fun b_next!13837 () Bool)

(assert (=> start!73090 (= b_free!13837 (not b_next!13837))))

(declare-fun tp!49016 () Bool)

(declare-fun b_and!22933 () Bool)

(assert (=> start!73090 (= tp!49016 b_and!22933)))

(declare-fun b!847597 () Bool)

(declare-fun res!575599 () Bool)

(declare-fun e!473115 () Bool)

(assert (=> b!847597 (=> (not res!575599) (not e!473115))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48209 0))(
  ( (array!48210 (arr!23131 (Array (_ BitVec 32) (_ BitVec 64))) (size!23572 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48209)

(assert (=> b!847597 (= res!575599 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23572 _keys!868))))))

(declare-fun b!847598 () Bool)

(assert (=> b!847598 (= e!473115 false)))

(declare-datatypes ((V!26345 0))(
  ( (V!26346 (val!8034 Int)) )
))
(declare-fun v!557 () V!26345)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10416 0))(
  ( (tuple2!10417 (_1!5219 (_ BitVec 64)) (_2!5219 V!26345)) )
))
(declare-datatypes ((List!16288 0))(
  ( (Nil!16285) (Cons!16284 (h!17421 tuple2!10416) (t!22651 List!16288)) )
))
(declare-datatypes ((ListLongMap!9187 0))(
  ( (ListLongMap!9188 (toList!4609 List!16288)) )
))
(declare-fun lt!381944 () ListLongMap!9187)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7547 0))(
  ( (ValueCellFull!7547 (v!10459 V!26345)) (EmptyCell!7547) )
))
(declare-datatypes ((array!48211 0))(
  ( (array!48212 (arr!23132 (Array (_ BitVec 32) ValueCell!7547)) (size!23573 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48211)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26345)

(declare-fun zeroValue!654 () V!26345)

(declare-fun getCurrentListMapNoExtraKeys!2667 (array!48209 array!48211 (_ BitVec 32) (_ BitVec 32) V!26345 V!26345 (_ BitVec 32) Int) ListLongMap!9187)

(assert (=> b!847598 (= lt!381944 (getCurrentListMapNoExtraKeys!2667 _keys!868 (array!48212 (store (arr!23132 _values!688) i!612 (ValueCellFull!7547 v!557)) (size!23573 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381943 () ListLongMap!9187)

(assert (=> b!847598 (= lt!381943 (getCurrentListMapNoExtraKeys!2667 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847599 () Bool)

(declare-fun e!473118 () Bool)

(declare-fun e!473119 () Bool)

(declare-fun mapRes!25559 () Bool)

(assert (=> b!847599 (= e!473118 (and e!473119 mapRes!25559))))

(declare-fun condMapEmpty!25559 () Bool)

(declare-fun mapDefault!25559 () ValueCell!7547)

(assert (=> b!847599 (= condMapEmpty!25559 (= (arr!23132 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7547)) mapDefault!25559)))))

(declare-fun mapIsEmpty!25559 () Bool)

(assert (=> mapIsEmpty!25559 mapRes!25559))

(declare-fun b!847600 () Bool)

(declare-fun res!575602 () Bool)

(assert (=> b!847600 (=> (not res!575602) (not e!473115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847600 (= res!575602 (validMask!0 mask!1196))))

(declare-fun b!847601 () Bool)

(declare-fun res!575603 () Bool)

(assert (=> b!847601 (=> (not res!575603) (not e!473115))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48209 (_ BitVec 32)) Bool)

(assert (=> b!847601 (= res!575603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!575600 () Bool)

(assert (=> start!73090 (=> (not res!575600) (not e!473115))))

(assert (=> start!73090 (= res!575600 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23572 _keys!868))))))

(assert (=> start!73090 e!473115))

(declare-fun tp_is_empty!15973 () Bool)

(assert (=> start!73090 tp_is_empty!15973))

(assert (=> start!73090 true))

(assert (=> start!73090 tp!49016))

(declare-fun array_inv!18428 (array!48209) Bool)

(assert (=> start!73090 (array_inv!18428 _keys!868)))

(declare-fun array_inv!18429 (array!48211) Bool)

(assert (=> start!73090 (and (array_inv!18429 _values!688) e!473118)))

(declare-fun b!847602 () Bool)

(declare-fun res!575598 () Bool)

(assert (=> b!847602 (=> (not res!575598) (not e!473115))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847602 (= res!575598 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!25559 () Bool)

(declare-fun tp!49015 () Bool)

(declare-fun e!473116 () Bool)

(assert (=> mapNonEmpty!25559 (= mapRes!25559 (and tp!49015 e!473116))))

(declare-fun mapRest!25559 () (Array (_ BitVec 32) ValueCell!7547))

(declare-fun mapValue!25559 () ValueCell!7547)

(declare-fun mapKey!25559 () (_ BitVec 32))

(assert (=> mapNonEmpty!25559 (= (arr!23132 _values!688) (store mapRest!25559 mapKey!25559 mapValue!25559))))

(declare-fun b!847603 () Bool)

(declare-fun res!575601 () Bool)

(assert (=> b!847603 (=> (not res!575601) (not e!473115))))

(assert (=> b!847603 (= res!575601 (and (= (select (arr!23131 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847604 () Bool)

(assert (=> b!847604 (= e!473116 tp_is_empty!15973)))

(declare-fun b!847605 () Bool)

(declare-fun res!575604 () Bool)

(assert (=> b!847605 (=> (not res!575604) (not e!473115))))

(assert (=> b!847605 (= res!575604 (and (= (size!23573 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23572 _keys!868) (size!23573 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847606 () Bool)

(assert (=> b!847606 (= e!473119 tp_is_empty!15973)))

(declare-fun b!847607 () Bool)

(declare-fun res!575605 () Bool)

(assert (=> b!847607 (=> (not res!575605) (not e!473115))))

(declare-datatypes ((List!16289 0))(
  ( (Nil!16286) (Cons!16285 (h!17422 (_ BitVec 64)) (t!22652 List!16289)) )
))
(declare-fun arrayNoDuplicates!0 (array!48209 (_ BitVec 32) List!16289) Bool)

(assert (=> b!847607 (= res!575605 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16286))))

(assert (= (and start!73090 res!575600) b!847600))

(assert (= (and b!847600 res!575602) b!847605))

(assert (= (and b!847605 res!575604) b!847601))

(assert (= (and b!847601 res!575603) b!847607))

(assert (= (and b!847607 res!575605) b!847597))

(assert (= (and b!847597 res!575599) b!847602))

(assert (= (and b!847602 res!575598) b!847603))

(assert (= (and b!847603 res!575601) b!847598))

(assert (= (and b!847599 condMapEmpty!25559) mapIsEmpty!25559))

(assert (= (and b!847599 (not condMapEmpty!25559)) mapNonEmpty!25559))

(get-info :version)

(assert (= (and mapNonEmpty!25559 ((_ is ValueCellFull!7547) mapValue!25559)) b!847604))

(assert (= (and b!847599 ((_ is ValueCellFull!7547) mapDefault!25559)) b!847606))

(assert (= start!73090 b!847599))

(declare-fun m!789299 () Bool)

(assert (=> mapNonEmpty!25559 m!789299))

(declare-fun m!789301 () Bool)

(assert (=> b!847598 m!789301))

(declare-fun m!789303 () Bool)

(assert (=> b!847598 m!789303))

(declare-fun m!789305 () Bool)

(assert (=> b!847598 m!789305))

(declare-fun m!789307 () Bool)

(assert (=> b!847607 m!789307))

(declare-fun m!789309 () Bool)

(assert (=> b!847601 m!789309))

(declare-fun m!789311 () Bool)

(assert (=> b!847602 m!789311))

(declare-fun m!789313 () Bool)

(assert (=> start!73090 m!789313))

(declare-fun m!789315 () Bool)

(assert (=> start!73090 m!789315))

(declare-fun m!789317 () Bool)

(assert (=> b!847603 m!789317))

(declare-fun m!789319 () Bool)

(assert (=> b!847600 m!789319))

(check-sat (not start!73090) (not b!847600) (not mapNonEmpty!25559) tp_is_empty!15973 (not b!847601) (not b_next!13837) (not b!847598) (not b!847602) (not b!847607) b_and!22933)
(check-sat b_and!22933 (not b_next!13837))
