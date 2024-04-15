; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73084 () Bool)

(assert start!73084)

(declare-fun b_free!14017 () Bool)

(declare-fun b_next!14017 () Bool)

(assert (=> start!73084 (= b_free!14017 (not b_next!14017))))

(declare-fun tp!49556 () Bool)

(declare-fun b_and!23167 () Bool)

(assert (=> start!73084 (= tp!49556 b_and!23167)))

(declare-fun b!850315 () Bool)

(declare-fun res!577672 () Bool)

(declare-fun e!474324 () Bool)

(assert (=> b!850315 (=> (not res!577672) (not e!474324))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850315 (= res!577672 (validKeyInArray!0 k0!854))))

(declare-fun b!850316 () Bool)

(declare-fun e!474318 () Bool)

(assert (=> b!850316 (= e!474324 e!474318)))

(declare-fun res!577669 () Bool)

(assert (=> b!850316 (=> (not res!577669) (not e!474318))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850316 (= res!577669 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26585 0))(
  ( (V!26586 (val!8124 Int)) )
))
(declare-datatypes ((ValueCell!7637 0))(
  ( (ValueCellFull!7637 (v!10543 V!26585)) (EmptyCell!7637) )
))
(declare-datatypes ((array!48501 0))(
  ( (array!48502 (arr!23282 (Array (_ BitVec 32) ValueCell!7637)) (size!23724 (_ BitVec 32))) )
))
(declare-fun lt!382666 () array!48501)

(declare-datatypes ((array!48503 0))(
  ( (array!48504 (arr!23283 (Array (_ BitVec 32) (_ BitVec 64))) (size!23725 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48503)

(declare-fun minValue!654 () V!26585)

(declare-datatypes ((tuple2!10670 0))(
  ( (tuple2!10671 (_1!5346 (_ BitVec 64)) (_2!5346 V!26585)) )
))
(declare-datatypes ((List!16509 0))(
  ( (Nil!16506) (Cons!16505 (h!17636 tuple2!10670) (t!22963 List!16509)) )
))
(declare-datatypes ((ListLongMap!9429 0))(
  ( (ListLongMap!9430 (toList!4730 List!16509)) )
))
(declare-fun lt!382661 () ListLongMap!9429)

(declare-fun zeroValue!654 () V!26585)

(declare-fun getCurrentListMapNoExtraKeys!2738 (array!48503 array!48501 (_ BitVec 32) (_ BitVec 32) V!26585 V!26585 (_ BitVec 32) Int) ListLongMap!9429)

(assert (=> b!850316 (= lt!382661 (getCurrentListMapNoExtraKeys!2738 _keys!868 lt!382666 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26585)

(declare-fun _values!688 () array!48501)

(assert (=> b!850316 (= lt!382666 (array!48502 (store (arr!23282 _values!688) i!612 (ValueCellFull!7637 v!557)) (size!23724 _values!688)))))

(declare-fun lt!382659 () ListLongMap!9429)

(assert (=> b!850316 (= lt!382659 (getCurrentListMapNoExtraKeys!2738 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850317 () Bool)

(declare-fun res!577677 () Bool)

(assert (=> b!850317 (=> (not res!577677) (not e!474324))))

(assert (=> b!850317 (= res!577677 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23725 _keys!868))))))

(declare-fun b!850319 () Bool)

(declare-fun e!474323 () Bool)

(assert (=> b!850319 (= e!474318 (not e!474323))))

(declare-fun res!577676 () Bool)

(assert (=> b!850319 (=> res!577676 e!474323)))

(assert (=> b!850319 (= res!577676 (not (validKeyInArray!0 (select (arr!23283 _keys!868) from!1053))))))

(declare-fun e!474319 () Bool)

(assert (=> b!850319 e!474319))

(declare-fun c!91631 () Bool)

(assert (=> b!850319 (= c!91631 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28975 0))(
  ( (Unit!28976) )
))
(declare-fun lt!382665 () Unit!28975)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!361 (array!48503 array!48501 (_ BitVec 32) (_ BitVec 32) V!26585 V!26585 (_ BitVec 32) (_ BitVec 64) V!26585 (_ BitVec 32) Int) Unit!28975)

(assert (=> b!850319 (= lt!382665 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!361 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850320 () Bool)

(declare-fun res!577673 () Bool)

(assert (=> b!850320 (=> (not res!577673) (not e!474324))))

(assert (=> b!850320 (= res!577673 (and (= (size!23724 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23725 _keys!868) (size!23724 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850321 () Bool)

(assert (=> b!850321 (= e!474323 true)))

(declare-fun lt!382663 () tuple2!10670)

(declare-fun lt!382667 () ListLongMap!9429)

(declare-fun lt!382660 () V!26585)

(declare-fun +!2152 (ListLongMap!9429 tuple2!10670) ListLongMap!9429)

(assert (=> b!850321 (= (+!2152 lt!382667 lt!382663) (+!2152 (+!2152 lt!382667 (tuple2!10671 k0!854 lt!382660)) lt!382663))))

(declare-fun lt!382664 () V!26585)

(assert (=> b!850321 (= lt!382663 (tuple2!10671 k0!854 lt!382664))))

(declare-fun lt!382662 () Unit!28975)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!266 (ListLongMap!9429 (_ BitVec 64) V!26585 V!26585) Unit!28975)

(assert (=> b!850321 (= lt!382662 (addSameAsAddTwiceSameKeyDiffValues!266 lt!382667 k0!854 lt!382660 lt!382664))))

(declare-fun lt!382658 () V!26585)

(declare-fun get!12269 (ValueCell!7637 V!26585) V!26585)

(assert (=> b!850321 (= lt!382660 (get!12269 (select (arr!23282 _values!688) from!1053) lt!382658))))

(assert (=> b!850321 (= lt!382661 (+!2152 lt!382667 (tuple2!10671 (select (arr!23283 _keys!868) from!1053) lt!382664)))))

(assert (=> b!850321 (= lt!382664 (get!12269 (select (store (arr!23282 _values!688) i!612 (ValueCellFull!7637 v!557)) from!1053) lt!382658))))

(declare-fun dynLambda!1016 (Int (_ BitVec 64)) V!26585)

(assert (=> b!850321 (= lt!382658 (dynLambda!1016 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!850321 (= lt!382667 (getCurrentListMapNoExtraKeys!2738 _keys!868 lt!382666 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37881 () ListLongMap!9429)

(declare-fun b!850322 () Bool)

(declare-fun call!37880 () ListLongMap!9429)

(assert (=> b!850322 (= e!474319 (= call!37881 (+!2152 call!37880 (tuple2!10671 k0!854 v!557))))))

(declare-fun b!850323 () Bool)

(declare-fun res!577674 () Bool)

(assert (=> b!850323 (=> (not res!577674) (not e!474324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48503 (_ BitVec 32)) Bool)

(assert (=> b!850323 (= res!577674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850324 () Bool)

(declare-fun e!474322 () Bool)

(declare-fun tp_is_empty!16153 () Bool)

(assert (=> b!850324 (= e!474322 tp_is_empty!16153)))

(declare-fun b!850325 () Bool)

(declare-fun res!577668 () Bool)

(assert (=> b!850325 (=> (not res!577668) (not e!474324))))

(declare-datatypes ((List!16510 0))(
  ( (Nil!16507) (Cons!16506 (h!17637 (_ BitVec 64)) (t!22964 List!16510)) )
))
(declare-fun arrayNoDuplicates!0 (array!48503 (_ BitVec 32) List!16510) Bool)

(assert (=> b!850325 (= res!577668 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16507))))

(declare-fun res!577675 () Bool)

(assert (=> start!73084 (=> (not res!577675) (not e!474324))))

(assert (=> start!73084 (= res!577675 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23725 _keys!868))))))

(assert (=> start!73084 e!474324))

(assert (=> start!73084 tp_is_empty!16153))

(assert (=> start!73084 true))

(assert (=> start!73084 tp!49556))

(declare-fun array_inv!18554 (array!48503) Bool)

(assert (=> start!73084 (array_inv!18554 _keys!868)))

(declare-fun e!474317 () Bool)

(declare-fun array_inv!18555 (array!48501) Bool)

(assert (=> start!73084 (and (array_inv!18555 _values!688) e!474317)))

(declare-fun b!850318 () Bool)

(declare-fun e!474320 () Bool)

(assert (=> b!850318 (= e!474320 tp_is_empty!16153)))

(declare-fun bm!37877 () Bool)

(assert (=> bm!37877 (= call!37880 (getCurrentListMapNoExtraKeys!2738 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850326 () Bool)

(assert (=> b!850326 (= e!474319 (= call!37881 call!37880))))

(declare-fun b!850327 () Bool)

(declare-fun mapRes!25829 () Bool)

(assert (=> b!850327 (= e!474317 (and e!474322 mapRes!25829))))

(declare-fun condMapEmpty!25829 () Bool)

(declare-fun mapDefault!25829 () ValueCell!7637)

(assert (=> b!850327 (= condMapEmpty!25829 (= (arr!23282 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7637)) mapDefault!25829)))))

(declare-fun bm!37878 () Bool)

(assert (=> bm!37878 (= call!37881 (getCurrentListMapNoExtraKeys!2738 _keys!868 lt!382666 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25829 () Bool)

(assert (=> mapIsEmpty!25829 mapRes!25829))

(declare-fun b!850328 () Bool)

(declare-fun res!577671 () Bool)

(assert (=> b!850328 (=> (not res!577671) (not e!474324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850328 (= res!577671 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25829 () Bool)

(declare-fun tp!49555 () Bool)

(assert (=> mapNonEmpty!25829 (= mapRes!25829 (and tp!49555 e!474320))))

(declare-fun mapRest!25829 () (Array (_ BitVec 32) ValueCell!7637))

(declare-fun mapValue!25829 () ValueCell!7637)

(declare-fun mapKey!25829 () (_ BitVec 32))

(assert (=> mapNonEmpty!25829 (= (arr!23282 _values!688) (store mapRest!25829 mapKey!25829 mapValue!25829))))

(declare-fun b!850329 () Bool)

(declare-fun res!577670 () Bool)

(assert (=> b!850329 (=> (not res!577670) (not e!474324))))

(assert (=> b!850329 (= res!577670 (and (= (select (arr!23283 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73084 res!577675) b!850328))

(assert (= (and b!850328 res!577671) b!850320))

(assert (= (and b!850320 res!577673) b!850323))

(assert (= (and b!850323 res!577674) b!850325))

(assert (= (and b!850325 res!577668) b!850317))

(assert (= (and b!850317 res!577677) b!850315))

(assert (= (and b!850315 res!577672) b!850329))

(assert (= (and b!850329 res!577670) b!850316))

(assert (= (and b!850316 res!577669) b!850319))

(assert (= (and b!850319 c!91631) b!850322))

(assert (= (and b!850319 (not c!91631)) b!850326))

(assert (= (or b!850322 b!850326) bm!37878))

(assert (= (or b!850322 b!850326) bm!37877))

(assert (= (and b!850319 (not res!577676)) b!850321))

(assert (= (and b!850327 condMapEmpty!25829) mapIsEmpty!25829))

(assert (= (and b!850327 (not condMapEmpty!25829)) mapNonEmpty!25829))

(get-info :version)

(assert (= (and mapNonEmpty!25829 ((_ is ValueCellFull!7637) mapValue!25829)) b!850318))

(assert (= (and b!850327 ((_ is ValueCellFull!7637) mapDefault!25829)) b!850324))

(assert (= start!73084 b!850327))

(declare-fun b_lambda!11531 () Bool)

(assert (=> (not b_lambda!11531) (not b!850321)))

(declare-fun t!22962 () Bool)

(declare-fun tb!4311 () Bool)

(assert (=> (and start!73084 (= defaultEntry!696 defaultEntry!696) t!22962) tb!4311))

(declare-fun result!8241 () Bool)

(assert (=> tb!4311 (= result!8241 tp_is_empty!16153)))

(assert (=> b!850321 t!22962))

(declare-fun b_and!23169 () Bool)

(assert (= b_and!23167 (and (=> t!22962 result!8241) b_and!23169)))

(declare-fun m!790579 () Bool)

(assert (=> mapNonEmpty!25829 m!790579))

(declare-fun m!790581 () Bool)

(assert (=> b!850323 m!790581))

(declare-fun m!790583 () Bool)

(assert (=> b!850328 m!790583))

(declare-fun m!790585 () Bool)

(assert (=> b!850315 m!790585))

(declare-fun m!790587 () Bool)

(assert (=> b!850325 m!790587))

(declare-fun m!790589 () Bool)

(assert (=> b!850319 m!790589))

(assert (=> b!850319 m!790589))

(declare-fun m!790591 () Bool)

(assert (=> b!850319 m!790591))

(declare-fun m!790593 () Bool)

(assert (=> b!850319 m!790593))

(declare-fun m!790595 () Bool)

(assert (=> b!850322 m!790595))

(declare-fun m!790597 () Bool)

(assert (=> bm!37877 m!790597))

(declare-fun m!790599 () Bool)

(assert (=> b!850329 m!790599))

(declare-fun m!790601 () Bool)

(assert (=> bm!37878 m!790601))

(declare-fun m!790603 () Bool)

(assert (=> b!850321 m!790603))

(declare-fun m!790605 () Bool)

(assert (=> b!850321 m!790605))

(declare-fun m!790607 () Bool)

(assert (=> b!850321 m!790607))

(assert (=> b!850321 m!790607))

(declare-fun m!790609 () Bool)

(assert (=> b!850321 m!790609))

(assert (=> b!850321 m!790603))

(declare-fun m!790611 () Bool)

(assert (=> b!850321 m!790611))

(assert (=> b!850321 m!790601))

(declare-fun m!790613 () Bool)

(assert (=> b!850321 m!790613))

(declare-fun m!790615 () Bool)

(assert (=> b!850321 m!790615))

(assert (=> b!850321 m!790613))

(declare-fun m!790617 () Bool)

(assert (=> b!850321 m!790617))

(declare-fun m!790619 () Bool)

(assert (=> b!850321 m!790619))

(assert (=> b!850321 m!790589))

(declare-fun m!790621 () Bool)

(assert (=> b!850321 m!790621))

(declare-fun m!790623 () Bool)

(assert (=> b!850321 m!790623))

(declare-fun m!790625 () Bool)

(assert (=> start!73084 m!790625))

(declare-fun m!790627 () Bool)

(assert (=> start!73084 m!790627))

(declare-fun m!790629 () Bool)

(assert (=> b!850316 m!790629))

(assert (=> b!850316 m!790615))

(declare-fun m!790631 () Bool)

(assert (=> b!850316 m!790631))

(check-sat b_and!23169 (not b!850316) (not b!850319) (not b!850321) (not start!73084) tp_is_empty!16153 (not b_lambda!11531) (not bm!37877) (not b!850315) (not b!850325) (not bm!37878) (not b!850323) (not b_next!14017) (not mapNonEmpty!25829) (not b!850328) (not b!850322))
(check-sat b_and!23169 (not b_next!14017))
