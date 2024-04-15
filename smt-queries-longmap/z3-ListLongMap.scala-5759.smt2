; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74384 () Bool)

(assert start!74384)

(declare-fun b_free!15145 () Bool)

(declare-fun b_next!15145 () Bool)

(assert (=> start!74384 (= b_free!15145 (not b_next!15145))))

(declare-fun tp!53113 () Bool)

(declare-fun b_and!24917 () Bool)

(assert (=> start!74384 (= tp!53113 b_and!24917)))

(declare-fun b!875680 () Bool)

(declare-fun e!487474 () Bool)

(declare-datatypes ((V!28233 0))(
  ( (V!28234 (val!8742 Int)) )
))
(declare-datatypes ((tuple2!11560 0))(
  ( (tuple2!11561 (_1!5791 (_ BitVec 64)) (_2!5791 V!28233)) )
))
(declare-datatypes ((List!17369 0))(
  ( (Nil!17366) (Cons!17365 (h!18496 tuple2!11560) (t!24409 List!17369)) )
))
(declare-datatypes ((ListLongMap!10319 0))(
  ( (ListLongMap!10320 (toList!5175 List!17369)) )
))
(declare-fun call!38653 () ListLongMap!10319)

(declare-fun call!38652 () ListLongMap!10319)

(assert (=> b!875680 (= e!487474 (= call!38653 call!38652))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50883 0))(
  ( (array!50884 (arr!24469 (Array (_ BitVec 32) (_ BitVec 64))) (size!24911 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50883)

(declare-datatypes ((ValueCell!8255 0))(
  ( (ValueCellFull!8255 (v!11169 V!28233)) (EmptyCell!8255) )
))
(declare-datatypes ((array!50885 0))(
  ( (array!50886 (arr!24470 (Array (_ BitVec 32) ValueCell!8255)) (size!24912 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50885)

(declare-fun minValue!654 () V!28233)

(declare-fun zeroValue!654 () V!28233)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun bm!38649 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3168 (array!50883 array!50885 (_ BitVec 32) (_ BitVec 32) V!28233 V!28233 (_ BitVec 32) Int) ListLongMap!10319)

(assert (=> bm!38649 (= call!38652 (getCurrentListMapNoExtraKeys!3168 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875681 () Bool)

(declare-fun res!595116 () Bool)

(declare-fun e!487476 () Bool)

(assert (=> b!875681 (=> (not res!595116) (not e!487476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875681 (= res!595116 (validMask!0 mask!1196))))

(declare-fun b!875682 () Bool)

(declare-fun e!487478 () Bool)

(declare-fun tp_is_empty!17389 () Bool)

(assert (=> b!875682 (= e!487478 tp_is_empty!17389)))

(declare-fun b!875683 () Bool)

(declare-fun e!487481 () Bool)

(assert (=> b!875683 (= e!487481 tp_is_empty!17389)))

(declare-fun b!875684 () Bool)

(declare-fun res!595113 () Bool)

(assert (=> b!875684 (=> (not res!595113) (not e!487476))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!875684 (= res!595113 (and (= (select (arr!24469 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun v!557 () V!28233)

(declare-fun b!875685 () Bool)

(declare-fun +!2502 (ListLongMap!10319 tuple2!11560) ListLongMap!10319)

(assert (=> b!875685 (= e!487474 (= call!38653 (+!2502 call!38652 (tuple2!11561 k0!854 v!557))))))

(declare-fun mapIsEmpty!27695 () Bool)

(declare-fun mapRes!27695 () Bool)

(assert (=> mapIsEmpty!27695 mapRes!27695))

(declare-fun b!875686 () Bool)

(declare-fun res!595110 () Bool)

(assert (=> b!875686 (=> (not res!595110) (not e!487476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875686 (= res!595110 (validKeyInArray!0 k0!854))))

(declare-fun b!875687 () Bool)

(declare-fun e!487479 () Bool)

(assert (=> b!875687 (= e!487479 (and e!487478 mapRes!27695))))

(declare-fun condMapEmpty!27695 () Bool)

(declare-fun mapDefault!27695 () ValueCell!8255)

(assert (=> b!875687 (= condMapEmpty!27695 (= (arr!24470 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8255)) mapDefault!27695)))))

(declare-fun bm!38650 () Bool)

(declare-fun lt!396113 () array!50885)

(assert (=> bm!38650 (= call!38653 (getCurrentListMapNoExtraKeys!3168 _keys!868 lt!396113 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875688 () Bool)

(declare-fun e!487477 () Bool)

(assert (=> b!875688 (= e!487476 e!487477)))

(declare-fun res!595115 () Bool)

(assert (=> b!875688 (=> (not res!595115) (not e!487477))))

(assert (=> b!875688 (= res!595115 (= from!1053 i!612))))

(declare-fun lt!396114 () ListLongMap!10319)

(assert (=> b!875688 (= lt!396114 (getCurrentListMapNoExtraKeys!3168 _keys!868 lt!396113 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!875688 (= lt!396113 (array!50886 (store (arr!24470 _values!688) i!612 (ValueCellFull!8255 v!557)) (size!24912 _values!688)))))

(declare-fun lt!396112 () ListLongMap!10319)

(assert (=> b!875688 (= lt!396112 (getCurrentListMapNoExtraKeys!3168 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875689 () Bool)

(declare-fun res!595118 () Bool)

(assert (=> b!875689 (=> (not res!595118) (not e!487476))))

(assert (=> b!875689 (= res!595118 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24911 _keys!868))))))

(declare-fun b!875690 () Bool)

(declare-fun res!595111 () Bool)

(assert (=> b!875690 (=> (not res!595111) (not e!487476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50883 (_ BitVec 32)) Bool)

(assert (=> b!875690 (= res!595111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875679 () Bool)

(declare-fun res!595114 () Bool)

(assert (=> b!875679 (=> (not res!595114) (not e!487476))))

(declare-datatypes ((List!17370 0))(
  ( (Nil!17367) (Cons!17366 (h!18497 (_ BitVec 64)) (t!24410 List!17370)) )
))
(declare-fun arrayNoDuplicates!0 (array!50883 (_ BitVec 32) List!17370) Bool)

(assert (=> b!875679 (= res!595114 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17367))))

(declare-fun res!595117 () Bool)

(assert (=> start!74384 (=> (not res!595117) (not e!487476))))

(assert (=> start!74384 (= res!595117 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24911 _keys!868))))))

(assert (=> start!74384 e!487476))

(assert (=> start!74384 tp_is_empty!17389))

(assert (=> start!74384 true))

(assert (=> start!74384 tp!53113))

(declare-fun array_inv!19338 (array!50883) Bool)

(assert (=> start!74384 (array_inv!19338 _keys!868)))

(declare-fun array_inv!19339 (array!50885) Bool)

(assert (=> start!74384 (and (array_inv!19339 _values!688) e!487479)))

(declare-fun b!875691 () Bool)

(declare-fun res!595112 () Bool)

(assert (=> b!875691 (=> (not res!595112) (not e!487476))))

(assert (=> b!875691 (= res!595112 (and (= (size!24912 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24911 _keys!868) (size!24912 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875692 () Bool)

(declare-fun e!487480 () Bool)

(assert (=> b!875692 (= e!487480 (bvslt i!612 (size!24912 _values!688)))))

(declare-fun get!12873 (ValueCell!8255 V!28233) V!28233)

(declare-fun dynLambda!1206 (Int (_ BitVec 64)) V!28233)

(assert (=> b!875692 (= lt!396114 (+!2502 (getCurrentListMapNoExtraKeys!3168 _keys!868 lt!396113 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11561 (select (arr!24469 _keys!868) from!1053) (get!12873 (select (arr!24470 lt!396113) from!1053) (dynLambda!1206 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!27695 () Bool)

(declare-fun tp!53114 () Bool)

(assert (=> mapNonEmpty!27695 (= mapRes!27695 (and tp!53114 e!487481))))

(declare-fun mapValue!27695 () ValueCell!8255)

(declare-fun mapKey!27695 () (_ BitVec 32))

(declare-fun mapRest!27695 () (Array (_ BitVec 32) ValueCell!8255))

(assert (=> mapNonEmpty!27695 (= (arr!24470 _values!688) (store mapRest!27695 mapKey!27695 mapValue!27695))))

(declare-fun b!875693 () Bool)

(assert (=> b!875693 (= e!487477 (not e!487480))))

(declare-fun res!595119 () Bool)

(assert (=> b!875693 (=> res!595119 e!487480)))

(assert (=> b!875693 (= res!595119 (not (validKeyInArray!0 (select (arr!24469 _keys!868) from!1053))))))

(assert (=> b!875693 e!487474))

(declare-fun c!92502 () Bool)

(assert (=> b!875693 (= c!92502 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29897 0))(
  ( (Unit!29898) )
))
(declare-fun lt!396115 () Unit!29897)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!671 (array!50883 array!50885 (_ BitVec 32) (_ BitVec 32) V!28233 V!28233 (_ BitVec 32) (_ BitVec 64) V!28233 (_ BitVec 32) Int) Unit!29897)

(assert (=> b!875693 (= lt!396115 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!671 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74384 res!595117) b!875681))

(assert (= (and b!875681 res!595116) b!875691))

(assert (= (and b!875691 res!595112) b!875690))

(assert (= (and b!875690 res!595111) b!875679))

(assert (= (and b!875679 res!595114) b!875689))

(assert (= (and b!875689 res!595118) b!875686))

(assert (= (and b!875686 res!595110) b!875684))

(assert (= (and b!875684 res!595113) b!875688))

(assert (= (and b!875688 res!595115) b!875693))

(assert (= (and b!875693 c!92502) b!875685))

(assert (= (and b!875693 (not c!92502)) b!875680))

(assert (= (or b!875685 b!875680) bm!38650))

(assert (= (or b!875685 b!875680) bm!38649))

(assert (= (and b!875693 (not res!595119)) b!875692))

(assert (= (and b!875687 condMapEmpty!27695) mapIsEmpty!27695))

(assert (= (and b!875687 (not condMapEmpty!27695)) mapNonEmpty!27695))

(get-info :version)

(assert (= (and mapNonEmpty!27695 ((_ is ValueCellFull!8255) mapValue!27695)) b!875683))

(assert (= (and b!875687 ((_ is ValueCellFull!8255) mapDefault!27695)) b!875682))

(assert (= start!74384 b!875687))

(declare-fun b_lambda!12195 () Bool)

(assert (=> (not b_lambda!12195) (not b!875692)))

(declare-fun t!24408 () Bool)

(declare-fun tb!4897 () Bool)

(assert (=> (and start!74384 (= defaultEntry!696 defaultEntry!696) t!24408) tb!4897))

(declare-fun result!9421 () Bool)

(assert (=> tb!4897 (= result!9421 tp_is_empty!17389)))

(assert (=> b!875692 t!24408))

(declare-fun b_and!24919 () Bool)

(assert (= b_and!24917 (and (=> t!24408 result!9421) b_and!24919)))

(declare-fun m!814977 () Bool)

(assert (=> mapNonEmpty!27695 m!814977))

(declare-fun m!814979 () Bool)

(assert (=> b!875681 m!814979))

(declare-fun m!814981 () Bool)

(assert (=> bm!38649 m!814981))

(declare-fun m!814983 () Bool)

(assert (=> b!875693 m!814983))

(assert (=> b!875693 m!814983))

(declare-fun m!814985 () Bool)

(assert (=> b!875693 m!814985))

(declare-fun m!814987 () Bool)

(assert (=> b!875693 m!814987))

(declare-fun m!814989 () Bool)

(assert (=> b!875690 m!814989))

(declare-fun m!814991 () Bool)

(assert (=> b!875679 m!814991))

(declare-fun m!814993 () Bool)

(assert (=> b!875692 m!814993))

(declare-fun m!814995 () Bool)

(assert (=> b!875692 m!814995))

(declare-fun m!814997 () Bool)

(assert (=> b!875692 m!814997))

(assert (=> b!875692 m!814993))

(assert (=> b!875692 m!814997))

(declare-fun m!814999 () Bool)

(assert (=> b!875692 m!814999))

(declare-fun m!815001 () Bool)

(assert (=> b!875692 m!815001))

(assert (=> b!875692 m!814983))

(assert (=> b!875692 m!814999))

(declare-fun m!815003 () Bool)

(assert (=> b!875684 m!815003))

(declare-fun m!815005 () Bool)

(assert (=> b!875688 m!815005))

(declare-fun m!815007 () Bool)

(assert (=> b!875688 m!815007))

(declare-fun m!815009 () Bool)

(assert (=> b!875688 m!815009))

(declare-fun m!815011 () Bool)

(assert (=> start!74384 m!815011))

(declare-fun m!815013 () Bool)

(assert (=> start!74384 m!815013))

(declare-fun m!815015 () Bool)

(assert (=> b!875685 m!815015))

(assert (=> bm!38650 m!814993))

(declare-fun m!815017 () Bool)

(assert (=> b!875686 m!815017))

(check-sat (not b!875681) (not b!875686) (not bm!38650) (not b!875679) tp_is_empty!17389 (not b!875688) (not b_next!15145) (not b_lambda!12195) (not start!74384) b_and!24919 (not b!875692) (not b!875693) (not b!875685) (not mapNonEmpty!27695) (not bm!38649) (not b!875690))
(check-sat b_and!24919 (not b_next!15145))
