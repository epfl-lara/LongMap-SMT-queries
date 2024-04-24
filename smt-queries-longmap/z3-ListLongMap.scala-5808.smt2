; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75088 () Bool)

(assert start!75088)

(declare-fun b_free!15439 () Bool)

(declare-fun b_next!15439 () Bool)

(assert (=> start!75088 (= b_free!15439 (not b_next!15439))))

(declare-fun tp!54021 () Bool)

(declare-fun b_and!25587 () Bool)

(assert (=> start!75088 (= tp!54021 b_and!25587)))

(declare-fun b!884411 () Bool)

(declare-fun e!492283 () Bool)

(declare-fun tp_is_empty!17683 () Bool)

(assert (=> b!884411 (= e!492283 tp_is_empty!17683)))

(declare-fun b!884412 () Bool)

(declare-fun res!600579 () Bool)

(declare-fun e!492284 () Bool)

(assert (=> b!884412 (=> (not res!600579) (not e!492284))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51531 0))(
  ( (array!51532 (arr!24780 (Array (_ BitVec 32) (_ BitVec 64))) (size!25221 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51531)

(assert (=> b!884412 (= res!600579 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25221 _keys!868))))))

(declare-fun b!884413 () Bool)

(declare-fun e!492286 () Bool)

(assert (=> b!884413 (= e!492284 e!492286)))

(declare-fun res!600578 () Bool)

(assert (=> b!884413 (=> (not res!600578) (not e!492286))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!884413 (= res!600578 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28625 0))(
  ( (V!28626 (val!8889 Int)) )
))
(declare-datatypes ((ValueCell!8402 0))(
  ( (ValueCellFull!8402 (v!11358 V!28625)) (EmptyCell!8402) )
))
(declare-datatypes ((array!51533 0))(
  ( (array!51534 (arr!24781 (Array (_ BitVec 32) ValueCell!8402)) (size!25222 (_ BitVec 32))) )
))
(declare-fun lt!400257 () array!51533)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11716 0))(
  ( (tuple2!11717 (_1!5869 (_ BitVec 64)) (_2!5869 V!28625)) )
))
(declare-datatypes ((List!17547 0))(
  ( (Nil!17544) (Cons!17543 (h!18680 tuple2!11716) (t!24780 List!17547)) )
))
(declare-datatypes ((ListLongMap!10487 0))(
  ( (ListLongMap!10488 (toList!5259 List!17547)) )
))
(declare-fun lt!400263 () ListLongMap!10487)

(declare-fun minValue!654 () V!28625)

(declare-fun zeroValue!654 () V!28625)

(declare-fun getCurrentListMapNoExtraKeys!3298 (array!51531 array!51533 (_ BitVec 32) (_ BitVec 32) V!28625 V!28625 (_ BitVec 32) Int) ListLongMap!10487)

(assert (=> b!884413 (= lt!400263 (getCurrentListMapNoExtraKeys!3298 _keys!868 lt!400257 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28625)

(declare-fun _values!688 () array!51533)

(assert (=> b!884413 (= lt!400257 (array!51534 (store (arr!24781 _values!688) i!612 (ValueCellFull!8402 v!557)) (size!25222 _values!688)))))

(declare-fun lt!400262 () ListLongMap!10487)

(assert (=> b!884413 (= lt!400262 (getCurrentListMapNoExtraKeys!3298 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884414 () Bool)

(declare-datatypes ((Unit!30125 0))(
  ( (Unit!30126) )
))
(declare-fun e!492281 () Unit!30125)

(declare-fun Unit!30127 () Unit!30125)

(assert (=> b!884414 (= e!492281 Unit!30127)))

(declare-fun lt!400260 () Unit!30125)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51531 (_ BitVec 32) (_ BitVec 32)) Unit!30125)

(assert (=> b!884414 (= lt!400260 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17548 0))(
  ( (Nil!17545) (Cons!17544 (h!18681 (_ BitVec 64)) (t!24781 List!17548)) )
))
(declare-fun arrayNoDuplicates!0 (array!51531 (_ BitVec 32) List!17548) Bool)

(assert (=> b!884414 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17545)))

(declare-fun lt!400259 () Unit!30125)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51531 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30125)

(assert (=> b!884414 (= lt!400259 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884414 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400261 () Unit!30125)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51531 (_ BitVec 64) (_ BitVec 32) List!17548) Unit!30125)

(assert (=> b!884414 (= lt!400261 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17545))))

(assert (=> b!884414 false))

(declare-fun mapIsEmpty!28161 () Bool)

(declare-fun mapRes!28161 () Bool)

(assert (=> mapIsEmpty!28161 mapRes!28161))

(declare-fun b!884415 () Bool)

(declare-fun res!600585 () Bool)

(assert (=> b!884415 (=> (not res!600585) (not e!492284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51531 (_ BitVec 32)) Bool)

(assert (=> b!884415 (= res!600585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884416 () Bool)

(declare-fun e!492288 () Bool)

(assert (=> b!884416 (= e!492288 tp_is_empty!17683)))

(declare-fun b!884417 () Bool)

(declare-fun res!600587 () Bool)

(assert (=> b!884417 (=> (not res!600587) (not e!492284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884417 (= res!600587 (validKeyInArray!0 k0!854))))

(declare-fun res!600583 () Bool)

(assert (=> start!75088 (=> (not res!600583) (not e!492284))))

(assert (=> start!75088 (= res!600583 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25221 _keys!868))))))

(assert (=> start!75088 e!492284))

(assert (=> start!75088 tp_is_empty!17683))

(assert (=> start!75088 true))

(assert (=> start!75088 tp!54021))

(declare-fun array_inv!19552 (array!51531) Bool)

(assert (=> start!75088 (array_inv!19552 _keys!868)))

(declare-fun e!492282 () Bool)

(declare-fun array_inv!19553 (array!51533) Bool)

(assert (=> start!75088 (and (array_inv!19553 _values!688) e!492282)))

(declare-fun b!884418 () Bool)

(declare-fun res!600580 () Bool)

(assert (=> b!884418 (=> (not res!600580) (not e!492284))))

(assert (=> b!884418 (= res!600580 (and (= (size!25222 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25221 _keys!868) (size!25222 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28161 () Bool)

(declare-fun tp!54020 () Bool)

(assert (=> mapNonEmpty!28161 (= mapRes!28161 (and tp!54020 e!492283))))

(declare-fun mapKey!28161 () (_ BitVec 32))

(declare-fun mapRest!28161 () (Array (_ BitVec 32) ValueCell!8402))

(declare-fun mapValue!28161 () ValueCell!8402)

(assert (=> mapNonEmpty!28161 (= (arr!24781 _values!688) (store mapRest!28161 mapKey!28161 mapValue!28161))))

(declare-fun b!884419 () Bool)

(declare-fun res!600582 () Bool)

(assert (=> b!884419 (=> (not res!600582) (not e!492284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884419 (= res!600582 (validMask!0 mask!1196))))

(declare-fun b!884420 () Bool)

(declare-fun e!492287 () Bool)

(assert (=> b!884420 (= e!492287 (bvslt from!1053 (size!25221 _keys!868)))))

(assert (=> b!884420 (not (= (select (arr!24780 _keys!868) from!1053) k0!854))))

(declare-fun lt!400253 () Unit!30125)

(assert (=> b!884420 (= lt!400253 e!492281)))

(declare-fun c!93346 () Bool)

(assert (=> b!884420 (= c!93346 (= (select (arr!24780 _keys!868) from!1053) k0!854))))

(declare-fun lt!400255 () ListLongMap!10487)

(declare-fun +!2571 (ListLongMap!10487 tuple2!11716) ListLongMap!10487)

(declare-fun get!13073 (ValueCell!8402 V!28625) V!28625)

(declare-fun dynLambda!1288 (Int (_ BitVec 64)) V!28625)

(assert (=> b!884420 (= lt!400263 (+!2571 lt!400255 (tuple2!11717 (select (arr!24780 _keys!868) from!1053) (get!13073 (select (arr!24781 _values!688) from!1053) (dynLambda!1288 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884421 () Bool)

(assert (=> b!884421 (= e!492282 (and e!492288 mapRes!28161))))

(declare-fun condMapEmpty!28161 () Bool)

(declare-fun mapDefault!28161 () ValueCell!8402)

(assert (=> b!884421 (= condMapEmpty!28161 (= (arr!24781 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8402)) mapDefault!28161)))))

(declare-fun b!884422 () Bool)

(declare-fun Unit!30128 () Unit!30125)

(assert (=> b!884422 (= e!492281 Unit!30128)))

(declare-fun b!884423 () Bool)

(assert (=> b!884423 (= e!492286 (not e!492287))))

(declare-fun res!600581 () Bool)

(assert (=> b!884423 (=> res!600581 e!492287)))

(assert (=> b!884423 (= res!600581 (not (validKeyInArray!0 (select (arr!24780 _keys!868) from!1053))))))

(declare-fun lt!400254 () ListLongMap!10487)

(assert (=> b!884423 (= lt!400254 lt!400255)))

(declare-fun lt!400258 () ListLongMap!10487)

(assert (=> b!884423 (= lt!400255 (+!2571 lt!400258 (tuple2!11717 k0!854 v!557)))))

(assert (=> b!884423 (= lt!400254 (getCurrentListMapNoExtraKeys!3298 _keys!868 lt!400257 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!884423 (= lt!400258 (getCurrentListMapNoExtraKeys!3298 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400256 () Unit!30125)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!735 (array!51531 array!51533 (_ BitVec 32) (_ BitVec 32) V!28625 V!28625 (_ BitVec 32) (_ BitVec 64) V!28625 (_ BitVec 32) Int) Unit!30125)

(assert (=> b!884423 (= lt!400256 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!735 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884424 () Bool)

(declare-fun res!600584 () Bool)

(assert (=> b!884424 (=> (not res!600584) (not e!492284))))

(assert (=> b!884424 (= res!600584 (and (= (select (arr!24780 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!884425 () Bool)

(declare-fun res!600586 () Bool)

(assert (=> b!884425 (=> (not res!600586) (not e!492284))))

(assert (=> b!884425 (= res!600586 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17545))))

(assert (= (and start!75088 res!600583) b!884419))

(assert (= (and b!884419 res!600582) b!884418))

(assert (= (and b!884418 res!600580) b!884415))

(assert (= (and b!884415 res!600585) b!884425))

(assert (= (and b!884425 res!600586) b!884412))

(assert (= (and b!884412 res!600579) b!884417))

(assert (= (and b!884417 res!600587) b!884424))

(assert (= (and b!884424 res!600584) b!884413))

(assert (= (and b!884413 res!600578) b!884423))

(assert (= (and b!884423 (not res!600581)) b!884420))

(assert (= (and b!884420 c!93346) b!884414))

(assert (= (and b!884420 (not c!93346)) b!884422))

(assert (= (and b!884421 condMapEmpty!28161) mapIsEmpty!28161))

(assert (= (and b!884421 (not condMapEmpty!28161)) mapNonEmpty!28161))

(get-info :version)

(assert (= (and mapNonEmpty!28161 ((_ is ValueCellFull!8402) mapValue!28161)) b!884411))

(assert (= (and b!884421 ((_ is ValueCellFull!8402) mapDefault!28161)) b!884416))

(assert (= start!75088 b!884421))

(declare-fun b_lambda!12731 () Bool)

(assert (=> (not b_lambda!12731) (not b!884420)))

(declare-fun t!24779 () Bool)

(declare-fun tb!5089 () Bool)

(assert (=> (and start!75088 (= defaultEntry!696 defaultEntry!696) t!24779) tb!5089))

(declare-fun result!9821 () Bool)

(assert (=> tb!5089 (= result!9821 tp_is_empty!17683)))

(assert (=> b!884420 t!24779))

(declare-fun b_and!25589 () Bool)

(assert (= b_and!25587 (and (=> t!24779 result!9821) b_and!25589)))

(declare-fun m!824871 () Bool)

(assert (=> b!884425 m!824871))

(declare-fun m!824873 () Bool)

(assert (=> b!884420 m!824873))

(declare-fun m!824875 () Bool)

(assert (=> b!884420 m!824875))

(declare-fun m!824877 () Bool)

(assert (=> b!884420 m!824877))

(declare-fun m!824879 () Bool)

(assert (=> b!884420 m!824879))

(assert (=> b!884420 m!824875))

(declare-fun m!824881 () Bool)

(assert (=> b!884420 m!824881))

(assert (=> b!884420 m!824877))

(declare-fun m!824883 () Bool)

(assert (=> b!884413 m!824883))

(declare-fun m!824885 () Bool)

(assert (=> b!884413 m!824885))

(declare-fun m!824887 () Bool)

(assert (=> b!884413 m!824887))

(declare-fun m!824889 () Bool)

(assert (=> b!884419 m!824889))

(declare-fun m!824891 () Bool)

(assert (=> b!884417 m!824891))

(declare-fun m!824893 () Bool)

(assert (=> b!884414 m!824893))

(declare-fun m!824895 () Bool)

(assert (=> b!884414 m!824895))

(declare-fun m!824897 () Bool)

(assert (=> b!884414 m!824897))

(declare-fun m!824899 () Bool)

(assert (=> b!884414 m!824899))

(declare-fun m!824901 () Bool)

(assert (=> b!884414 m!824901))

(declare-fun m!824903 () Bool)

(assert (=> b!884424 m!824903))

(declare-fun m!824905 () Bool)

(assert (=> start!75088 m!824905))

(declare-fun m!824907 () Bool)

(assert (=> start!75088 m!824907))

(declare-fun m!824909 () Bool)

(assert (=> mapNonEmpty!28161 m!824909))

(declare-fun m!824911 () Bool)

(assert (=> b!884415 m!824911))

(declare-fun m!824913 () Bool)

(assert (=> b!884423 m!824913))

(declare-fun m!824915 () Bool)

(assert (=> b!884423 m!824915))

(assert (=> b!884423 m!824881))

(declare-fun m!824917 () Bool)

(assert (=> b!884423 m!824917))

(assert (=> b!884423 m!824881))

(declare-fun m!824919 () Bool)

(assert (=> b!884423 m!824919))

(declare-fun m!824921 () Bool)

(assert (=> b!884423 m!824921))

(check-sat (not b!884423) (not b!884419) (not b!884415) tp_is_empty!17683 (not b_lambda!12731) (not start!75088) (not b!884425) (not b!884417) (not b_next!15439) b_and!25589 (not mapNonEmpty!28161) (not b!884420) (not b!884414) (not b!884413))
(check-sat b_and!25589 (not b_next!15439))
