; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73228 () Bool)

(assert start!73228)

(declare-fun b_free!14161 () Bool)

(declare-fun b_next!14161 () Bool)

(assert (=> start!73228 (= b_free!14161 (not b_next!14161))))

(declare-fun tp!49988 () Bool)

(declare-fun b_and!23455 () Bool)

(assert (=> start!73228 (= tp!49988 b_and!23455)))

(declare-fun b!853699 () Bool)

(declare-fun e!476051 () Bool)

(declare-fun tp_is_empty!16297 () Bool)

(assert (=> b!853699 (= e!476051 tp_is_empty!16297)))

(declare-fun b!853700 () Bool)

(declare-fun res!579828 () Bool)

(declare-fun e!476049 () Bool)

(assert (=> b!853700 (=> (not res!579828) (not e!476049))))

(declare-datatypes ((array!48777 0))(
  ( (array!48778 (arr!23420 (Array (_ BitVec 32) (_ BitVec 64))) (size!23862 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48777)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48777 (_ BitVec 32)) Bool)

(assert (=> b!853700 (= res!579828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853701 () Bool)

(declare-fun res!579831 () Bool)

(assert (=> b!853701 (=> (not res!579831) (not e!476049))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26777 0))(
  ( (V!26778 (val!8196 Int)) )
))
(declare-datatypes ((ValueCell!7709 0))(
  ( (ValueCellFull!7709 (v!10615 V!26777)) (EmptyCell!7709) )
))
(declare-datatypes ((array!48779 0))(
  ( (array!48780 (arr!23421 (Array (_ BitVec 32) ValueCell!7709)) (size!23863 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48779)

(assert (=> b!853701 (= res!579831 (and (= (size!23863 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23862 _keys!868) (size!23863 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853702 () Bool)

(declare-fun e!476046 () Bool)

(assert (=> b!853702 (= e!476046 tp_is_empty!16297)))

(declare-fun b!853703 () Bool)

(declare-fun e!476047 () Bool)

(declare-datatypes ((tuple2!10798 0))(
  ( (tuple2!10799 (_1!5410 (_ BitVec 64)) (_2!5410 V!26777)) )
))
(declare-datatypes ((List!16617 0))(
  ( (Nil!16614) (Cons!16613 (h!17744 tuple2!10798) (t!23215 List!16617)) )
))
(declare-datatypes ((ListLongMap!9557 0))(
  ( (ListLongMap!9558 (toList!4794 List!16617)) )
))
(declare-fun call!38313 () ListLongMap!9557)

(declare-fun call!38312 () ListLongMap!9557)

(assert (=> b!853703 (= e!476047 (= call!38313 call!38312))))

(declare-fun res!579830 () Bool)

(assert (=> start!73228 (=> (not res!579830) (not e!476049))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73228 (= res!579830 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23862 _keys!868))))))

(assert (=> start!73228 e!476049))

(assert (=> start!73228 tp_is_empty!16297))

(assert (=> start!73228 true))

(assert (=> start!73228 tp!49988))

(declare-fun array_inv!18646 (array!48777) Bool)

(assert (=> start!73228 (array_inv!18646 _keys!868)))

(declare-fun e!476048 () Bool)

(declare-fun array_inv!18647 (array!48779) Bool)

(assert (=> start!73228 (and (array_inv!18647 _values!688) e!476048)))

(declare-fun v!557 () V!26777)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!853704 () Bool)

(declare-fun +!2204 (ListLongMap!9557 tuple2!10798) ListLongMap!9557)

(assert (=> b!853704 (= e!476047 (= call!38313 (+!2204 call!38312 (tuple2!10799 k0!854 v!557))))))

(declare-fun b!853705 () Bool)

(declare-fun res!579836 () Bool)

(assert (=> b!853705 (=> (not res!579836) (not e!476049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853705 (= res!579836 (validMask!0 mask!1196))))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!38309 () Bool)

(declare-fun minValue!654 () V!26777)

(declare-fun zeroValue!654 () V!26777)

(declare-fun getCurrentListMapNoExtraKeys!2801 (array!48777 array!48779 (_ BitVec 32) (_ BitVec 32) V!26777 V!26777 (_ BitVec 32) Int) ListLongMap!9557)

(assert (=> bm!38309 (= call!38312 (getCurrentListMapNoExtraKeys!2801 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853706 () Bool)

(declare-fun mapRes!26045 () Bool)

(assert (=> b!853706 (= e!476048 (and e!476046 mapRes!26045))))

(declare-fun condMapEmpty!26045 () Bool)

(declare-fun mapDefault!26045 () ValueCell!7709)

(assert (=> b!853706 (= condMapEmpty!26045 (= (arr!23421 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7709)) mapDefault!26045)))))

(declare-fun b!853707 () Bool)

(declare-fun res!579833 () Bool)

(assert (=> b!853707 (=> (not res!579833) (not e!476049))))

(declare-datatypes ((List!16618 0))(
  ( (Nil!16615) (Cons!16614 (h!17745 (_ BitVec 64)) (t!23216 List!16618)) )
))
(declare-fun arrayNoDuplicates!0 (array!48777 (_ BitVec 32) List!16618) Bool)

(assert (=> b!853707 (= res!579833 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16615))))

(declare-fun b!853708 () Bool)

(declare-fun res!579832 () Bool)

(assert (=> b!853708 (=> (not res!579832) (not e!476049))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853708 (= res!579832 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23862 _keys!868))))))

(declare-fun b!853709 () Bool)

(declare-fun e!476052 () Bool)

(declare-fun e!476050 () Bool)

(assert (=> b!853709 (= e!476052 (not e!476050))))

(declare-fun res!579837 () Bool)

(assert (=> b!853709 (=> res!579837 e!476050)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853709 (= res!579837 (not (validKeyInArray!0 (select (arr!23420 _keys!868) from!1053))))))

(assert (=> b!853709 e!476047))

(declare-fun c!91847 () Bool)

(assert (=> b!853709 (= c!91847 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29081 0))(
  ( (Unit!29082) )
))
(declare-fun lt!384820 () Unit!29081)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!406 (array!48777 array!48779 (_ BitVec 32) (_ BitVec 32) V!26777 V!26777 (_ BitVec 32) (_ BitVec 64) V!26777 (_ BitVec 32) Int) Unit!29081)

(assert (=> b!853709 (= lt!384820 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!406 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853710 () Bool)

(declare-fun res!579835 () Bool)

(assert (=> b!853710 (=> (not res!579835) (not e!476049))))

(assert (=> b!853710 (= res!579835 (validKeyInArray!0 k0!854))))

(declare-fun b!853711 () Bool)

(declare-fun res!579834 () Bool)

(assert (=> b!853711 (=> (not res!579834) (not e!476049))))

(assert (=> b!853711 (= res!579834 (and (= (select (arr!23420 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!853712 () Bool)

(assert (=> b!853712 (= e!476049 e!476052)))

(declare-fun res!579829 () Bool)

(assert (=> b!853712 (=> (not res!579829) (not e!476052))))

(assert (=> b!853712 (= res!579829 (= from!1053 i!612))))

(declare-fun lt!384825 () array!48779)

(declare-fun lt!384827 () ListLongMap!9557)

(assert (=> b!853712 (= lt!384827 (getCurrentListMapNoExtraKeys!2801 _keys!868 lt!384825 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853712 (= lt!384825 (array!48780 (store (arr!23421 _values!688) i!612 (ValueCellFull!7709 v!557)) (size!23863 _values!688)))))

(declare-fun lt!384819 () ListLongMap!9557)

(assert (=> b!853712 (= lt!384819 (getCurrentListMapNoExtraKeys!2801 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853713 () Bool)

(assert (=> b!853713 (= e!476050 true)))

(declare-fun lt!384826 () ListLongMap!9557)

(declare-fun lt!384818 () tuple2!10798)

(declare-fun lt!384824 () V!26777)

(assert (=> b!853713 (= (+!2204 lt!384826 lt!384818) (+!2204 (+!2204 lt!384826 (tuple2!10799 k0!854 lt!384824)) lt!384818))))

(declare-fun lt!384821 () V!26777)

(assert (=> b!853713 (= lt!384818 (tuple2!10799 k0!854 lt!384821))))

(declare-fun lt!384822 () Unit!29081)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!312 (ListLongMap!9557 (_ BitVec 64) V!26777 V!26777) Unit!29081)

(assert (=> b!853713 (= lt!384822 (addSameAsAddTwiceSameKeyDiffValues!312 lt!384826 k0!854 lt!384824 lt!384821))))

(declare-fun lt!384823 () V!26777)

(declare-fun get!12363 (ValueCell!7709 V!26777) V!26777)

(assert (=> b!853713 (= lt!384824 (get!12363 (select (arr!23421 _values!688) from!1053) lt!384823))))

(assert (=> b!853713 (= lt!384827 (+!2204 lt!384826 (tuple2!10799 (select (arr!23420 _keys!868) from!1053) lt!384821)))))

(assert (=> b!853713 (= lt!384821 (get!12363 (select (store (arr!23421 _values!688) i!612 (ValueCellFull!7709 v!557)) from!1053) lt!384823))))

(declare-fun dynLambda!1062 (Int (_ BitVec 64)) V!26777)

(assert (=> b!853713 (= lt!384823 (dynLambda!1062 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853713 (= lt!384826 (getCurrentListMapNoExtraKeys!2801 _keys!868 lt!384825 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26045 () Bool)

(declare-fun tp!49987 () Bool)

(assert (=> mapNonEmpty!26045 (= mapRes!26045 (and tp!49987 e!476051))))

(declare-fun mapKey!26045 () (_ BitVec 32))

(declare-fun mapRest!26045 () (Array (_ BitVec 32) ValueCell!7709))

(declare-fun mapValue!26045 () ValueCell!7709)

(assert (=> mapNonEmpty!26045 (= (arr!23421 _values!688) (store mapRest!26045 mapKey!26045 mapValue!26045))))

(declare-fun bm!38310 () Bool)

(assert (=> bm!38310 (= call!38313 (getCurrentListMapNoExtraKeys!2801 _keys!868 lt!384825 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26045 () Bool)

(assert (=> mapIsEmpty!26045 mapRes!26045))

(assert (= (and start!73228 res!579830) b!853705))

(assert (= (and b!853705 res!579836) b!853701))

(assert (= (and b!853701 res!579831) b!853700))

(assert (= (and b!853700 res!579828) b!853707))

(assert (= (and b!853707 res!579833) b!853708))

(assert (= (and b!853708 res!579832) b!853710))

(assert (= (and b!853710 res!579835) b!853711))

(assert (= (and b!853711 res!579834) b!853712))

(assert (= (and b!853712 res!579829) b!853709))

(assert (= (and b!853709 c!91847) b!853704))

(assert (= (and b!853709 (not c!91847)) b!853703))

(assert (= (or b!853704 b!853703) bm!38310))

(assert (= (or b!853704 b!853703) bm!38309))

(assert (= (and b!853709 (not res!579837)) b!853713))

(assert (= (and b!853706 condMapEmpty!26045) mapIsEmpty!26045))

(assert (= (and b!853706 (not condMapEmpty!26045)) mapNonEmpty!26045))

(get-info :version)

(assert (= (and mapNonEmpty!26045 ((_ is ValueCellFull!7709) mapValue!26045)) b!853699))

(assert (= (and b!853706 ((_ is ValueCellFull!7709) mapDefault!26045)) b!853702))

(assert (= start!73228 b!853706))

(declare-fun b_lambda!11675 () Bool)

(assert (=> (not b_lambda!11675) (not b!853713)))

(declare-fun t!23214 () Bool)

(declare-fun tb!4455 () Bool)

(assert (=> (and start!73228 (= defaultEntry!696 defaultEntry!696) t!23214) tb!4455))

(declare-fun result!8529 () Bool)

(assert (=> tb!4455 (= result!8529 tp_is_empty!16297)))

(assert (=> b!853713 t!23214))

(declare-fun b_and!23457 () Bool)

(assert (= b_and!23455 (and (=> t!23214 result!8529) b_and!23457)))

(declare-fun m!794469 () Bool)

(assert (=> b!853713 m!794469))

(declare-fun m!794471 () Bool)

(assert (=> b!853713 m!794471))

(declare-fun m!794473 () Bool)

(assert (=> b!853713 m!794473))

(declare-fun m!794475 () Bool)

(assert (=> b!853713 m!794475))

(declare-fun m!794477 () Bool)

(assert (=> b!853713 m!794477))

(declare-fun m!794479 () Bool)

(assert (=> b!853713 m!794479))

(assert (=> b!853713 m!794473))

(declare-fun m!794481 () Bool)

(assert (=> b!853713 m!794481))

(assert (=> b!853713 m!794477))

(declare-fun m!794483 () Bool)

(assert (=> b!853713 m!794483))

(declare-fun m!794485 () Bool)

(assert (=> b!853713 m!794485))

(declare-fun m!794487 () Bool)

(assert (=> b!853713 m!794487))

(declare-fun m!794489 () Bool)

(assert (=> b!853713 m!794489))

(assert (=> b!853713 m!794471))

(declare-fun m!794491 () Bool)

(assert (=> b!853713 m!794491))

(declare-fun m!794493 () Bool)

(assert (=> b!853713 m!794493))

(assert (=> b!853709 m!794487))

(assert (=> b!853709 m!794487))

(declare-fun m!794495 () Bool)

(assert (=> b!853709 m!794495))

(declare-fun m!794497 () Bool)

(assert (=> b!853709 m!794497))

(declare-fun m!794499 () Bool)

(assert (=> b!853707 m!794499))

(declare-fun m!794501 () Bool)

(assert (=> b!853710 m!794501))

(declare-fun m!794503 () Bool)

(assert (=> b!853705 m!794503))

(declare-fun m!794505 () Bool)

(assert (=> start!73228 m!794505))

(declare-fun m!794507 () Bool)

(assert (=> start!73228 m!794507))

(declare-fun m!794509 () Bool)

(assert (=> b!853711 m!794509))

(assert (=> bm!38310 m!794493))

(declare-fun m!794511 () Bool)

(assert (=> b!853712 m!794511))

(assert (=> b!853712 m!794485))

(declare-fun m!794513 () Bool)

(assert (=> b!853712 m!794513))

(declare-fun m!794515 () Bool)

(assert (=> bm!38309 m!794515))

(declare-fun m!794517 () Bool)

(assert (=> mapNonEmpty!26045 m!794517))

(declare-fun m!794519 () Bool)

(assert (=> b!853700 m!794519))

(declare-fun m!794521 () Bool)

(assert (=> b!853704 m!794521))

(check-sat (not b_next!14161) (not mapNonEmpty!26045) (not b!853700) (not b_lambda!11675) b_and!23457 (not b!853709) tp_is_empty!16297 (not b!853712) (not b!853705) (not start!73228) (not b!853707) (not b!853704) (not b!853710) (not bm!38309) (not bm!38310) (not b!853713))
(check-sat b_and!23457 (not b_next!14161))
