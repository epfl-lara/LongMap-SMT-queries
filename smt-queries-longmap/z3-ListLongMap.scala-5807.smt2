; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74916 () Bool)

(assert start!74916)

(declare-fun b_free!15435 () Bool)

(declare-fun b_next!15435 () Bool)

(assert (=> start!74916 (= b_free!15435 (not b_next!15435))))

(declare-fun tp!54007 () Bool)

(declare-fun b_and!25569 () Bool)

(assert (=> start!74916 (= tp!54007 b_and!25569)))

(declare-fun b!883414 () Bool)

(declare-fun res!600182 () Bool)

(declare-fun e!491652 () Bool)

(assert (=> b!883414 (=> (not res!600182) (not e!491652))))

(declare-datatypes ((array!51484 0))(
  ( (array!51485 (arr!24761 (Array (_ BitVec 32) (_ BitVec 64))) (size!25201 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51484)

(declare-datatypes ((List!17584 0))(
  ( (Nil!17581) (Cons!17580 (h!18711 (_ BitVec 64)) (t!24821 List!17584)) )
))
(declare-fun arrayNoDuplicates!0 (array!51484 (_ BitVec 32) List!17584) Bool)

(assert (=> b!883414 (= res!600182 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17581))))

(declare-fun b!883415 () Bool)

(declare-fun res!600181 () Bool)

(assert (=> b!883415 (=> (not res!600181) (not e!491652))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883415 (= res!600181 (validKeyInArray!0 k0!854))))

(declare-fun b!883416 () Bool)

(declare-fun e!491657 () Bool)

(assert (=> b!883416 (= e!491652 e!491657)))

(declare-fun res!600174 () Bool)

(assert (=> b!883416 (=> (not res!600174) (not e!491657))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!883416 (= res!600174 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28619 0))(
  ( (V!28620 (val!8887 Int)) )
))
(declare-datatypes ((ValueCell!8400 0))(
  ( (ValueCellFull!8400 (v!11356 V!28619)) (EmptyCell!8400) )
))
(declare-datatypes ((array!51486 0))(
  ( (array!51487 (arr!24762 (Array (_ BitVec 32) ValueCell!8400)) (size!25202 (_ BitVec 32))) )
))
(declare-fun lt!399827 () array!51486)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28619)

(declare-fun zeroValue!654 () V!28619)

(declare-datatypes ((tuple2!11776 0))(
  ( (tuple2!11777 (_1!5899 (_ BitVec 64)) (_2!5899 V!28619)) )
))
(declare-datatypes ((List!17585 0))(
  ( (Nil!17582) (Cons!17581 (h!18712 tuple2!11776) (t!24822 List!17585)) )
))
(declare-datatypes ((ListLongMap!10545 0))(
  ( (ListLongMap!10546 (toList!5288 List!17585)) )
))
(declare-fun lt!399831 () ListLongMap!10545)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3247 (array!51484 array!51486 (_ BitVec 32) (_ BitVec 32) V!28619 V!28619 (_ BitVec 32) Int) ListLongMap!10545)

(assert (=> b!883416 (= lt!399831 (getCurrentListMapNoExtraKeys!3247 _keys!868 lt!399827 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28619)

(declare-fun _values!688 () array!51486)

(assert (=> b!883416 (= lt!399827 (array!51487 (store (arr!24762 _values!688) i!612 (ValueCellFull!8400 v!557)) (size!25202 _values!688)))))

(declare-fun lt!399829 () ListLongMap!10545)

(assert (=> b!883416 (= lt!399829 (getCurrentListMapNoExtraKeys!3247 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883417 () Bool)

(declare-fun res!600179 () Bool)

(assert (=> b!883417 (=> (not res!600179) (not e!491652))))

(assert (=> b!883417 (= res!600179 (and (= (size!25202 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25201 _keys!868) (size!25202 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883418 () Bool)

(declare-datatypes ((Unit!30135 0))(
  ( (Unit!30136) )
))
(declare-fun e!491651 () Unit!30135)

(declare-fun Unit!30137 () Unit!30135)

(assert (=> b!883418 (= e!491651 Unit!30137)))

(declare-fun b!883419 () Bool)

(declare-fun res!600177 () Bool)

(assert (=> b!883419 (=> (not res!600177) (not e!491652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883419 (= res!600177 (validMask!0 mask!1196))))

(declare-fun b!883420 () Bool)

(declare-fun e!491654 () Bool)

(declare-fun e!491658 () Bool)

(declare-fun mapRes!28155 () Bool)

(assert (=> b!883420 (= e!491654 (and e!491658 mapRes!28155))))

(declare-fun condMapEmpty!28155 () Bool)

(declare-fun mapDefault!28155 () ValueCell!8400)

(assert (=> b!883420 (= condMapEmpty!28155 (= (arr!24762 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8400)) mapDefault!28155)))))

(declare-fun mapNonEmpty!28155 () Bool)

(declare-fun tp!54008 () Bool)

(declare-fun e!491653 () Bool)

(assert (=> mapNonEmpty!28155 (= mapRes!28155 (and tp!54008 e!491653))))

(declare-fun mapKey!28155 () (_ BitVec 32))

(declare-fun mapValue!28155 () ValueCell!8400)

(declare-fun mapRest!28155 () (Array (_ BitVec 32) ValueCell!8400))

(assert (=> mapNonEmpty!28155 (= (arr!24762 _values!688) (store mapRest!28155 mapKey!28155 mapValue!28155))))

(declare-fun b!883421 () Bool)

(declare-fun res!600183 () Bool)

(assert (=> b!883421 (=> (not res!600183) (not e!491652))))

(assert (=> b!883421 (= res!600183 (and (= (select (arr!24761 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!600178 () Bool)

(assert (=> start!74916 (=> (not res!600178) (not e!491652))))

(assert (=> start!74916 (= res!600178 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25201 _keys!868))))))

(assert (=> start!74916 e!491652))

(declare-fun tp_is_empty!17679 () Bool)

(assert (=> start!74916 tp_is_empty!17679))

(assert (=> start!74916 true))

(assert (=> start!74916 tp!54007))

(declare-fun array_inv!19496 (array!51484) Bool)

(assert (=> start!74916 (array_inv!19496 _keys!868)))

(declare-fun array_inv!19497 (array!51486) Bool)

(assert (=> start!74916 (and (array_inv!19497 _values!688) e!491654)))

(declare-fun b!883422 () Bool)

(assert (=> b!883422 (= e!491653 tp_is_empty!17679)))

(declare-fun b!883423 () Bool)

(declare-fun e!491655 () Bool)

(assert (=> b!883423 (= e!491655 (not (= (select (arr!24761 _keys!868) from!1053) k0!854)))))

(declare-fun lt!399834 () Unit!30135)

(assert (=> b!883423 (= lt!399834 e!491651)))

(declare-fun c!93058 () Bool)

(assert (=> b!883423 (= c!93058 (= (select (arr!24761 _keys!868) from!1053) k0!854))))

(declare-fun lt!399826 () ListLongMap!10545)

(declare-fun +!2557 (ListLongMap!10545 tuple2!11776) ListLongMap!10545)

(declare-fun get!13047 (ValueCell!8400 V!28619) V!28619)

(declare-fun dynLambda!1270 (Int (_ BitVec 64)) V!28619)

(assert (=> b!883423 (= lt!399831 (+!2557 lt!399826 (tuple2!11777 (select (arr!24761 _keys!868) from!1053) (get!13047 (select (arr!24762 _values!688) from!1053) (dynLambda!1270 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883424 () Bool)

(declare-fun res!600175 () Bool)

(assert (=> b!883424 (=> (not res!600175) (not e!491652))))

(assert (=> b!883424 (= res!600175 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25201 _keys!868))))))

(declare-fun b!883425 () Bool)

(assert (=> b!883425 (= e!491658 tp_is_empty!17679)))

(declare-fun mapIsEmpty!28155 () Bool)

(assert (=> mapIsEmpty!28155 mapRes!28155))

(declare-fun b!883426 () Bool)

(declare-fun res!600176 () Bool)

(assert (=> b!883426 (=> (not res!600176) (not e!491652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51484 (_ BitVec 32)) Bool)

(assert (=> b!883426 (= res!600176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883427 () Bool)

(declare-fun Unit!30138 () Unit!30135)

(assert (=> b!883427 (= e!491651 Unit!30138)))

(declare-fun lt!399836 () Unit!30135)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51484 (_ BitVec 32) (_ BitVec 32)) Unit!30135)

(assert (=> b!883427 (= lt!399836 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!883427 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17581)))

(declare-fun lt!399835 () Unit!30135)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51484 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30135)

(assert (=> b!883427 (= lt!399835 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883427 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399828 () Unit!30135)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51484 (_ BitVec 64) (_ BitVec 32) List!17584) Unit!30135)

(assert (=> b!883427 (= lt!399828 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17581))))

(assert (=> b!883427 false))

(declare-fun b!883428 () Bool)

(assert (=> b!883428 (= e!491657 (not e!491655))))

(declare-fun res!600180 () Bool)

(assert (=> b!883428 (=> res!600180 e!491655)))

(assert (=> b!883428 (= res!600180 (not (validKeyInArray!0 (select (arr!24761 _keys!868) from!1053))))))

(declare-fun lt!399833 () ListLongMap!10545)

(assert (=> b!883428 (= lt!399833 lt!399826)))

(declare-fun lt!399830 () ListLongMap!10545)

(assert (=> b!883428 (= lt!399826 (+!2557 lt!399830 (tuple2!11777 k0!854 v!557)))))

(assert (=> b!883428 (= lt!399833 (getCurrentListMapNoExtraKeys!3247 _keys!868 lt!399827 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883428 (= lt!399830 (getCurrentListMapNoExtraKeys!3247 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399832 () Unit!30135)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!741 (array!51484 array!51486 (_ BitVec 32) (_ BitVec 32) V!28619 V!28619 (_ BitVec 32) (_ BitVec 64) V!28619 (_ BitVec 32) Int) Unit!30135)

(assert (=> b!883428 (= lt!399832 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!741 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74916 res!600178) b!883419))

(assert (= (and b!883419 res!600177) b!883417))

(assert (= (and b!883417 res!600179) b!883426))

(assert (= (and b!883426 res!600176) b!883414))

(assert (= (and b!883414 res!600182) b!883424))

(assert (= (and b!883424 res!600175) b!883415))

(assert (= (and b!883415 res!600181) b!883421))

(assert (= (and b!883421 res!600183) b!883416))

(assert (= (and b!883416 res!600174) b!883428))

(assert (= (and b!883428 (not res!600180)) b!883423))

(assert (= (and b!883423 c!93058) b!883427))

(assert (= (and b!883423 (not c!93058)) b!883418))

(assert (= (and b!883420 condMapEmpty!28155) mapIsEmpty!28155))

(assert (= (and b!883420 (not condMapEmpty!28155)) mapNonEmpty!28155))

(get-info :version)

(assert (= (and mapNonEmpty!28155 ((_ is ValueCellFull!8400) mapValue!28155)) b!883422))

(assert (= (and b!883420 ((_ is ValueCellFull!8400) mapDefault!28155)) b!883425))

(assert (= start!74916 b!883420))

(declare-fun b_lambda!12713 () Bool)

(assert (=> (not b_lambda!12713) (not b!883423)))

(declare-fun t!24820 () Bool)

(declare-fun tb!5093 () Bool)

(assert (=> (and start!74916 (= defaultEntry!696 defaultEntry!696) t!24820) tb!5093))

(declare-fun result!9821 () Bool)

(assert (=> tb!5093 (= result!9821 tp_is_empty!17679)))

(assert (=> b!883423 t!24820))

(declare-fun b_and!25571 () Bool)

(assert (= b_and!25569 (and (=> t!24820 result!9821) b_and!25571)))

(declare-fun m!823473 () Bool)

(assert (=> b!883415 m!823473))

(declare-fun m!823475 () Bool)

(assert (=> b!883427 m!823475))

(declare-fun m!823477 () Bool)

(assert (=> b!883427 m!823477))

(declare-fun m!823479 () Bool)

(assert (=> b!883427 m!823479))

(declare-fun m!823481 () Bool)

(assert (=> b!883427 m!823481))

(declare-fun m!823483 () Bool)

(assert (=> b!883427 m!823483))

(declare-fun m!823485 () Bool)

(assert (=> b!883428 m!823485))

(declare-fun m!823487 () Bool)

(assert (=> b!883428 m!823487))

(declare-fun m!823489 () Bool)

(assert (=> b!883428 m!823489))

(assert (=> b!883428 m!823487))

(declare-fun m!823491 () Bool)

(assert (=> b!883428 m!823491))

(declare-fun m!823493 () Bool)

(assert (=> b!883428 m!823493))

(declare-fun m!823495 () Bool)

(assert (=> b!883428 m!823495))

(declare-fun m!823497 () Bool)

(assert (=> b!883419 m!823497))

(declare-fun m!823499 () Bool)

(assert (=> b!883426 m!823499))

(declare-fun m!823501 () Bool)

(assert (=> start!74916 m!823501))

(declare-fun m!823503 () Bool)

(assert (=> start!74916 m!823503))

(declare-fun m!823505 () Bool)

(assert (=> mapNonEmpty!28155 m!823505))

(declare-fun m!823507 () Bool)

(assert (=> b!883421 m!823507))

(declare-fun m!823509 () Bool)

(assert (=> b!883423 m!823509))

(declare-fun m!823511 () Bool)

(assert (=> b!883423 m!823511))

(declare-fun m!823513 () Bool)

(assert (=> b!883423 m!823513))

(declare-fun m!823515 () Bool)

(assert (=> b!883423 m!823515))

(assert (=> b!883423 m!823511))

(assert (=> b!883423 m!823487))

(assert (=> b!883423 m!823513))

(declare-fun m!823517 () Bool)

(assert (=> b!883414 m!823517))

(declare-fun m!823519 () Bool)

(assert (=> b!883416 m!823519))

(declare-fun m!823521 () Bool)

(assert (=> b!883416 m!823521))

(declare-fun m!823523 () Bool)

(assert (=> b!883416 m!823523))

(check-sat (not b!883416) (not b!883423) (not b_next!15435) (not b!883427) (not b!883414) (not b!883419) tp_is_empty!17679 (not start!74916) b_and!25571 (not b_lambda!12713) (not b!883415) (not b!883426) (not b!883428) (not mapNonEmpty!28155))
(check-sat b_and!25571 (not b_next!15435))
