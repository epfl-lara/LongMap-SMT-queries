; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74676 () Bool)

(assert start!74676)

(declare-fun b_free!15343 () Bool)

(declare-fun b_next!15343 () Bool)

(assert (=> start!74676 (= b_free!15343 (not b_next!15343))))

(declare-fun tp!53718 () Bool)

(declare-fun b_and!25279 () Bool)

(assert (=> start!74676 (= tp!53718 b_and!25279)))

(declare-fun b!880319 () Bool)

(declare-fun e!489873 () Bool)

(declare-fun e!489872 () Bool)

(declare-fun mapRes!28002 () Bool)

(assert (=> b!880319 (= e!489873 (and e!489872 mapRes!28002))))

(declare-fun condMapEmpty!28002 () Bool)

(declare-datatypes ((V!28497 0))(
  ( (V!28498 (val!8841 Int)) )
))
(declare-datatypes ((ValueCell!8354 0))(
  ( (ValueCellFull!8354 (v!11283 V!28497)) (EmptyCell!8354) )
))
(declare-datatypes ((array!51279 0))(
  ( (array!51280 (arr!24664 (Array (_ BitVec 32) ValueCell!8354)) (size!25106 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51279)

(declare-fun mapDefault!28002 () ValueCell!8354)

(assert (=> b!880319 (= condMapEmpty!28002 (= (arr!24664 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8354)) mapDefault!28002)))))

(declare-fun b!880320 () Bool)

(declare-fun res!598162 () Bool)

(declare-fun e!489877 () Bool)

(assert (=> b!880320 (=> (not res!598162) (not e!489877))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51281 0))(
  ( (array!51282 (arr!24665 (Array (_ BitVec 32) (_ BitVec 64))) (size!25107 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51281)

(assert (=> b!880320 (= res!598162 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25107 _keys!868))))))

(declare-fun b!880321 () Bool)

(declare-fun res!598156 () Bool)

(assert (=> b!880321 (=> (not res!598156) (not e!489877))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880321 (= res!598156 (validMask!0 mask!1196))))

(declare-fun b!880322 () Bool)

(declare-fun res!598160 () Bool)

(assert (=> b!880322 (=> (not res!598160) (not e!489877))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!880322 (= res!598160 (and (= (size!25106 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25107 _keys!868) (size!25106 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880323 () Bool)

(declare-fun tp_is_empty!17587 () Bool)

(assert (=> b!880323 (= e!489872 tp_is_empty!17587)))

(declare-fun res!598153 () Bool)

(assert (=> start!74676 (=> (not res!598153) (not e!489877))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74676 (= res!598153 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25107 _keys!868))))))

(assert (=> start!74676 e!489877))

(assert (=> start!74676 tp_is_empty!17587))

(assert (=> start!74676 true))

(assert (=> start!74676 tp!53718))

(declare-fun array_inv!19474 (array!51281) Bool)

(assert (=> start!74676 (array_inv!19474 _keys!868)))

(declare-fun array_inv!19475 (array!51279) Bool)

(assert (=> start!74676 (and (array_inv!19475 _values!688) e!489873)))

(declare-fun mapNonEmpty!28002 () Bool)

(declare-fun tp!53717 () Bool)

(declare-fun e!489875 () Bool)

(assert (=> mapNonEmpty!28002 (= mapRes!28002 (and tp!53717 e!489875))))

(declare-fun mapRest!28002 () (Array (_ BitVec 32) ValueCell!8354))

(declare-fun mapKey!28002 () (_ BitVec 32))

(declare-fun mapValue!28002 () ValueCell!8354)

(assert (=> mapNonEmpty!28002 (= (arr!24664 _values!688) (store mapRest!28002 mapKey!28002 mapValue!28002))))

(declare-fun b!880324 () Bool)

(assert (=> b!880324 (= e!489875 tp_is_empty!17587)))

(declare-fun b!880325 () Bool)

(declare-fun e!489876 () Bool)

(declare-fun e!489878 () Bool)

(assert (=> b!880325 (= e!489876 (not e!489878))))

(declare-fun res!598154 () Bool)

(assert (=> b!880325 (=> res!598154 e!489878)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880325 (= res!598154 (not (validKeyInArray!0 (select (arr!24665 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11720 0))(
  ( (tuple2!11721 (_1!5871 (_ BitVec 64)) (_2!5871 V!28497)) )
))
(declare-datatypes ((List!17516 0))(
  ( (Nil!17513) (Cons!17512 (h!18643 tuple2!11720) (t!24652 List!17516)) )
))
(declare-datatypes ((ListLongMap!10479 0))(
  ( (ListLongMap!10480 (toList!5255 List!17516)) )
))
(declare-fun lt!397953 () ListLongMap!10479)

(declare-fun lt!397955 () ListLongMap!10479)

(assert (=> b!880325 (= lt!397953 lt!397955)))

(declare-fun v!557 () V!28497)

(declare-fun lt!397951 () ListLongMap!10479)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2550 (ListLongMap!10479 tuple2!11720) ListLongMap!10479)

(assert (=> b!880325 (= lt!397955 (+!2550 lt!397951 (tuple2!11721 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!397956 () array!51279)

(declare-fun minValue!654 () V!28497)

(declare-fun zeroValue!654 () V!28497)

(declare-fun getCurrentListMapNoExtraKeys!3246 (array!51281 array!51279 (_ BitVec 32) (_ BitVec 32) V!28497 V!28497 (_ BitVec 32) Int) ListLongMap!10479)

(assert (=> b!880325 (= lt!397953 (getCurrentListMapNoExtraKeys!3246 _keys!868 lt!397956 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880325 (= lt!397951 (getCurrentListMapNoExtraKeys!3246 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30007 0))(
  ( (Unit!30008) )
))
(declare-fun lt!397952 () Unit!30007)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!715 (array!51281 array!51279 (_ BitVec 32) (_ BitVec 32) V!28497 V!28497 (_ BitVec 32) (_ BitVec 64) V!28497 (_ BitVec 32) Int) Unit!30007)

(assert (=> b!880325 (= lt!397952 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!715 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880326 () Bool)

(declare-fun res!598158 () Bool)

(assert (=> b!880326 (=> (not res!598158) (not e!489877))))

(declare-datatypes ((List!17517 0))(
  ( (Nil!17514) (Cons!17513 (h!18644 (_ BitVec 64)) (t!24653 List!17517)) )
))
(declare-fun arrayNoDuplicates!0 (array!51281 (_ BitVec 32) List!17517) Bool)

(assert (=> b!880326 (= res!598158 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17514))))

(declare-fun b!880327 () Bool)

(declare-fun res!598152 () Bool)

(assert (=> b!880327 (=> (not res!598152) (not e!489877))))

(assert (=> b!880327 (= res!598152 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!28002 () Bool)

(assert (=> mapIsEmpty!28002 mapRes!28002))

(declare-fun b!880328 () Bool)

(declare-fun res!598159 () Bool)

(assert (=> b!880328 (=> (not res!598159) (not e!489877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51281 (_ BitVec 32)) Bool)

(assert (=> b!880328 (= res!598159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880329 () Bool)

(declare-fun res!598155 () Bool)

(assert (=> b!880329 (=> (not res!598155) (not e!489877))))

(assert (=> b!880329 (= res!598155 (and (= (select (arr!24665 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!880330 () Bool)

(assert (=> b!880330 (= e!489877 e!489876)))

(declare-fun res!598161 () Bool)

(assert (=> b!880330 (=> (not res!598161) (not e!489876))))

(assert (=> b!880330 (= res!598161 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397949 () ListLongMap!10479)

(assert (=> b!880330 (= lt!397949 (getCurrentListMapNoExtraKeys!3246 _keys!868 lt!397956 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880330 (= lt!397956 (array!51280 (store (arr!24664 _values!688) i!612 (ValueCellFull!8354 v!557)) (size!25106 _values!688)))))

(declare-fun lt!397950 () ListLongMap!10479)

(assert (=> b!880330 (= lt!397950 (getCurrentListMapNoExtraKeys!3246 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880331 () Bool)

(declare-fun e!489871 () Bool)

(assert (=> b!880331 (= e!489878 e!489871)))

(declare-fun res!598157 () Bool)

(assert (=> b!880331 (=> res!598157 e!489871)))

(assert (=> b!880331 (= res!598157 (not (= (select (arr!24665 _keys!868) from!1053) k0!854)))))

(declare-fun get!12981 (ValueCell!8354 V!28497) V!28497)

(declare-fun dynLambda!1241 (Int (_ BitVec 64)) V!28497)

(assert (=> b!880331 (= lt!397949 (+!2550 lt!397955 (tuple2!11721 (select (arr!24665 _keys!868) from!1053) (get!12981 (select (arr!24664 _values!688) from!1053) (dynLambda!1241 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880332 () Bool)

(assert (=> b!880332 (= e!489871 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000))))

(assert (=> b!880332 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17514)))

(declare-fun lt!397954 () Unit!30007)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51281 (_ BitVec 32) (_ BitVec 32)) Unit!30007)

(assert (=> b!880332 (= lt!397954 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (= (and start!74676 res!598153) b!880321))

(assert (= (and b!880321 res!598156) b!880322))

(assert (= (and b!880322 res!598160) b!880328))

(assert (= (and b!880328 res!598159) b!880326))

(assert (= (and b!880326 res!598158) b!880320))

(assert (= (and b!880320 res!598162) b!880327))

(assert (= (and b!880327 res!598152) b!880329))

(assert (= (and b!880329 res!598155) b!880330))

(assert (= (and b!880330 res!598161) b!880325))

(assert (= (and b!880325 (not res!598154)) b!880331))

(assert (= (and b!880331 (not res!598157)) b!880332))

(assert (= (and b!880319 condMapEmpty!28002) mapIsEmpty!28002))

(assert (= (and b!880319 (not condMapEmpty!28002)) mapNonEmpty!28002))

(get-info :version)

(assert (= (and mapNonEmpty!28002 ((_ is ValueCellFull!8354) mapValue!28002)) b!880324))

(assert (= (and b!880319 ((_ is ValueCellFull!8354) mapDefault!28002)) b!880323))

(assert (= start!74676 b!880319))

(declare-fun b_lambda!12433 () Bool)

(assert (=> (not b_lambda!12433) (not b!880331)))

(declare-fun t!24651 () Bool)

(declare-fun tb!4993 () Bool)

(assert (=> (and start!74676 (= defaultEntry!696 defaultEntry!696) t!24651) tb!4993))

(declare-fun result!9619 () Bool)

(assert (=> tb!4993 (= result!9619 tp_is_empty!17587)))

(assert (=> b!880331 t!24651))

(declare-fun b_and!25281 () Bool)

(assert (= b_and!25279 (and (=> t!24651 result!9619) b_and!25281)))

(declare-fun m!819581 () Bool)

(assert (=> b!880325 m!819581))

(declare-fun m!819583 () Bool)

(assert (=> b!880325 m!819583))

(declare-fun m!819585 () Bool)

(assert (=> b!880325 m!819585))

(declare-fun m!819587 () Bool)

(assert (=> b!880325 m!819587))

(assert (=> b!880325 m!819585))

(declare-fun m!819589 () Bool)

(assert (=> b!880325 m!819589))

(declare-fun m!819591 () Bool)

(assert (=> b!880325 m!819591))

(declare-fun m!819593 () Bool)

(assert (=> b!880326 m!819593))

(declare-fun m!819595 () Bool)

(assert (=> b!880332 m!819595))

(declare-fun m!819597 () Bool)

(assert (=> b!880332 m!819597))

(declare-fun m!819599 () Bool)

(assert (=> b!880328 m!819599))

(declare-fun m!819601 () Bool)

(assert (=> b!880329 m!819601))

(declare-fun m!819603 () Bool)

(assert (=> b!880327 m!819603))

(declare-fun m!819605 () Bool)

(assert (=> mapNonEmpty!28002 m!819605))

(declare-fun m!819607 () Bool)

(assert (=> b!880321 m!819607))

(declare-fun m!819609 () Bool)

(assert (=> start!74676 m!819609))

(declare-fun m!819611 () Bool)

(assert (=> start!74676 m!819611))

(declare-fun m!819613 () Bool)

(assert (=> b!880331 m!819613))

(declare-fun m!819615 () Bool)

(assert (=> b!880331 m!819615))

(declare-fun m!819617 () Bool)

(assert (=> b!880331 m!819617))

(declare-fun m!819619 () Bool)

(assert (=> b!880331 m!819619))

(assert (=> b!880331 m!819615))

(assert (=> b!880331 m!819585))

(assert (=> b!880331 m!819617))

(declare-fun m!819621 () Bool)

(assert (=> b!880330 m!819621))

(declare-fun m!819623 () Bool)

(assert (=> b!880330 m!819623))

(declare-fun m!819625 () Bool)

(assert (=> b!880330 m!819625))

(check-sat (not b!880326) (not b!880330) (not b!880331) (not b!880328) (not mapNonEmpty!28002) tp_is_empty!17587 (not b_next!15343) (not start!74676) (not b!880327) (not b!880321) (not b!880332) (not b_lambda!12433) (not b!880325) b_and!25281)
(check-sat b_and!25281 (not b_next!15343))
