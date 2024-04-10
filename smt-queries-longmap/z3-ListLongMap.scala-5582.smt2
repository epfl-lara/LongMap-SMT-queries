; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73278 () Bool)

(assert start!73278)

(declare-fun b_free!14193 () Bool)

(declare-fun b_next!14193 () Bool)

(assert (=> start!73278 (= b_free!14193 (not b_next!14193))))

(declare-fun tp!50082 () Bool)

(declare-fun b_and!23545 () Bool)

(assert (=> start!73278 (= tp!50082 b_and!23545)))

(declare-fun b!854690 () Bool)

(declare-fun res!580422 () Bool)

(declare-fun e!476584 () Bool)

(assert (=> b!854690 (=> (not res!580422) (not e!476584))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48856 0))(
  ( (array!48857 (arr!23459 (Array (_ BitVec 32) (_ BitVec 64))) (size!23899 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48856)

(declare-datatypes ((V!26819 0))(
  ( (V!26820 (val!8212 Int)) )
))
(declare-datatypes ((ValueCell!7725 0))(
  ( (ValueCellFull!7725 (v!10637 V!26819)) (EmptyCell!7725) )
))
(declare-datatypes ((array!48858 0))(
  ( (array!48859 (arr!23460 (Array (_ BitVec 32) ValueCell!7725)) (size!23900 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48858)

(assert (=> b!854690 (= res!580422 (and (= (size!23900 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23899 _keys!868) (size!23900 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854691 () Bool)

(declare-fun res!580420 () Bool)

(assert (=> b!854691 (=> (not res!580420) (not e!476584))))

(declare-datatypes ((List!16629 0))(
  ( (Nil!16626) (Cons!16625 (h!17756 (_ BitVec 64)) (t!23268 List!16629)) )
))
(declare-fun arrayNoDuplicates!0 (array!48856 (_ BitVec 32) List!16629) Bool)

(assert (=> b!854691 (= res!580420 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16626))))

(declare-fun b!854692 () Bool)

(declare-fun res!580419 () Bool)

(assert (=> b!854692 (=> (not res!580419) (not e!476584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48856 (_ BitVec 32)) Bool)

(assert (=> b!854692 (= res!580419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854693 () Bool)

(declare-fun e!476579 () Bool)

(assert (=> b!854693 (= e!476584 e!476579)))

(declare-fun res!580425 () Bool)

(assert (=> b!854693 (=> (not res!580425) (not e!476579))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854693 (= res!580425 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!385543 () array!48858)

(declare-datatypes ((tuple2!10814 0))(
  ( (tuple2!10815 (_1!5418 (_ BitVec 64)) (_2!5418 V!26819)) )
))
(declare-datatypes ((List!16630 0))(
  ( (Nil!16627) (Cons!16626 (h!17757 tuple2!10814) (t!23269 List!16630)) )
))
(declare-datatypes ((ListLongMap!9583 0))(
  ( (ListLongMap!9584 (toList!4807 List!16630)) )
))
(declare-fun lt!385541 () ListLongMap!9583)

(declare-fun minValue!654 () V!26819)

(declare-fun zeroValue!654 () V!26819)

(declare-fun getCurrentListMapNoExtraKeys!2788 (array!48856 array!48858 (_ BitVec 32) (_ BitVec 32) V!26819 V!26819 (_ BitVec 32) Int) ListLongMap!9583)

(assert (=> b!854693 (= lt!385541 (getCurrentListMapNoExtraKeys!2788 _keys!868 lt!385543 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26819)

(assert (=> b!854693 (= lt!385543 (array!48859 (store (arr!23460 _values!688) i!612 (ValueCellFull!7725 v!557)) (size!23900 _values!688)))))

(declare-fun lt!385540 () ListLongMap!9583)

(assert (=> b!854693 (= lt!385540 (getCurrentListMapNoExtraKeys!2788 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun e!476582 () Bool)

(declare-fun call!38435 () ListLongMap!9583)

(declare-fun b!854694 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun call!38434 () ListLongMap!9583)

(declare-fun +!2194 (ListLongMap!9583 tuple2!10814) ListLongMap!9583)

(assert (=> b!854694 (= e!476582 (= call!38434 (+!2194 call!38435 (tuple2!10815 k0!854 v!557))))))

(declare-fun b!854695 () Bool)

(declare-fun e!476578 () Bool)

(assert (=> b!854695 (= e!476579 (not e!476578))))

(declare-fun res!580418 () Bool)

(assert (=> b!854695 (=> res!580418 e!476578)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854695 (= res!580418 (not (validKeyInArray!0 (select (arr!23459 _keys!868) from!1053))))))

(assert (=> b!854695 e!476582))

(declare-fun c!91960 () Bool)

(assert (=> b!854695 (= c!91960 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29175 0))(
  ( (Unit!29176) )
))
(declare-fun lt!385539 () Unit!29175)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!416 (array!48856 array!48858 (_ BitVec 32) (_ BitVec 32) V!26819 V!26819 (_ BitVec 32) (_ BitVec 64) V!26819 (_ BitVec 32) Int) Unit!29175)

(assert (=> b!854695 (= lt!385539 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!416 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854696 () Bool)

(declare-fun res!580423 () Bool)

(assert (=> b!854696 (=> (not res!580423) (not e!476584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854696 (= res!580423 (validMask!0 mask!1196))))

(declare-fun bm!38431 () Bool)

(assert (=> bm!38431 (= call!38435 (getCurrentListMapNoExtraKeys!2788 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854697 () Bool)

(declare-fun e!476583 () Bool)

(declare-fun tp_is_empty!16329 () Bool)

(assert (=> b!854697 (= e!476583 tp_is_empty!16329)))

(declare-fun bm!38432 () Bool)

(assert (=> bm!38432 (= call!38434 (getCurrentListMapNoExtraKeys!2788 _keys!868 lt!385543 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26093 () Bool)

(declare-fun mapRes!26093 () Bool)

(declare-fun tp!50083 () Bool)

(declare-fun e!476581 () Bool)

(assert (=> mapNonEmpty!26093 (= mapRes!26093 (and tp!50083 e!476581))))

(declare-fun mapRest!26093 () (Array (_ BitVec 32) ValueCell!7725))

(declare-fun mapValue!26093 () ValueCell!7725)

(declare-fun mapKey!26093 () (_ BitVec 32))

(assert (=> mapNonEmpty!26093 (= (arr!23460 _values!688) (store mapRest!26093 mapKey!26093 mapValue!26093))))

(declare-fun b!854698 () Bool)

(declare-fun res!580427 () Bool)

(assert (=> b!854698 (=> (not res!580427) (not e!476584))))

(assert (=> b!854698 (= res!580427 (and (= (select (arr!23459 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!580421 () Bool)

(assert (=> start!73278 (=> (not res!580421) (not e!476584))))

(assert (=> start!73278 (= res!580421 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23899 _keys!868))))))

(assert (=> start!73278 e!476584))

(assert (=> start!73278 tp_is_empty!16329))

(assert (=> start!73278 true))

(assert (=> start!73278 tp!50082))

(declare-fun array_inv!18590 (array!48856) Bool)

(assert (=> start!73278 (array_inv!18590 _keys!868)))

(declare-fun e!476577 () Bool)

(declare-fun array_inv!18591 (array!48858) Bool)

(assert (=> start!73278 (and (array_inv!18591 _values!688) e!476577)))

(declare-fun b!854699 () Bool)

(assert (=> b!854699 (= e!476582 (= call!38434 call!38435))))

(declare-fun mapIsEmpty!26093 () Bool)

(assert (=> mapIsEmpty!26093 mapRes!26093))

(declare-fun b!854700 () Bool)

(assert (=> b!854700 (= e!476581 tp_is_empty!16329)))

(declare-fun b!854701 () Bool)

(assert (=> b!854701 (= e!476578 true)))

(declare-fun lt!385535 () ListLongMap!9583)

(declare-fun lt!385537 () V!26819)

(declare-fun lt!385538 () tuple2!10814)

(assert (=> b!854701 (= (+!2194 lt!385535 lt!385538) (+!2194 (+!2194 lt!385535 (tuple2!10815 k0!854 lt!385537)) lt!385538))))

(declare-fun lt!385536 () V!26819)

(assert (=> b!854701 (= lt!385538 (tuple2!10815 k0!854 lt!385536))))

(declare-fun lt!385542 () Unit!29175)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!318 (ListLongMap!9583 (_ BitVec 64) V!26819 V!26819) Unit!29175)

(assert (=> b!854701 (= lt!385542 (addSameAsAddTwiceSameKeyDiffValues!318 lt!385535 k0!854 lt!385537 lt!385536))))

(declare-fun lt!385534 () V!26819)

(declare-fun get!12380 (ValueCell!7725 V!26819) V!26819)

(assert (=> b!854701 (= lt!385537 (get!12380 (select (arr!23460 _values!688) from!1053) lt!385534))))

(assert (=> b!854701 (= lt!385541 (+!2194 lt!385535 (tuple2!10815 (select (arr!23459 _keys!868) from!1053) lt!385536)))))

(assert (=> b!854701 (= lt!385536 (get!12380 (select (store (arr!23460 _values!688) i!612 (ValueCellFull!7725 v!557)) from!1053) lt!385534))))

(declare-fun dynLambda!1072 (Int (_ BitVec 64)) V!26819)

(assert (=> b!854701 (= lt!385534 (dynLambda!1072 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854701 (= lt!385535 (getCurrentListMapNoExtraKeys!2788 _keys!868 lt!385543 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854702 () Bool)

(declare-fun res!580426 () Bool)

(assert (=> b!854702 (=> (not res!580426) (not e!476584))))

(assert (=> b!854702 (= res!580426 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23899 _keys!868))))))

(declare-fun b!854703 () Bool)

(declare-fun res!580424 () Bool)

(assert (=> b!854703 (=> (not res!580424) (not e!476584))))

(assert (=> b!854703 (= res!580424 (validKeyInArray!0 k0!854))))

(declare-fun b!854704 () Bool)

(assert (=> b!854704 (= e!476577 (and e!476583 mapRes!26093))))

(declare-fun condMapEmpty!26093 () Bool)

(declare-fun mapDefault!26093 () ValueCell!7725)

(assert (=> b!854704 (= condMapEmpty!26093 (= (arr!23460 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7725)) mapDefault!26093)))))

(assert (= (and start!73278 res!580421) b!854696))

(assert (= (and b!854696 res!580423) b!854690))

(assert (= (and b!854690 res!580422) b!854692))

(assert (= (and b!854692 res!580419) b!854691))

(assert (= (and b!854691 res!580420) b!854702))

(assert (= (and b!854702 res!580426) b!854703))

(assert (= (and b!854703 res!580424) b!854698))

(assert (= (and b!854698 res!580427) b!854693))

(assert (= (and b!854693 res!580425) b!854695))

(assert (= (and b!854695 c!91960) b!854694))

(assert (= (and b!854695 (not c!91960)) b!854699))

(assert (= (or b!854694 b!854699) bm!38431))

(assert (= (or b!854694 b!854699) bm!38432))

(assert (= (and b!854695 (not res!580418)) b!854701))

(assert (= (and b!854704 condMapEmpty!26093) mapIsEmpty!26093))

(assert (= (and b!854704 (not condMapEmpty!26093)) mapNonEmpty!26093))

(get-info :version)

(assert (= (and mapNonEmpty!26093 ((_ is ValueCellFull!7725) mapValue!26093)) b!854700))

(assert (= (and b!854704 ((_ is ValueCellFull!7725) mapDefault!26093)) b!854697))

(assert (= start!73278 b!854704))

(declare-fun b_lambda!11725 () Bool)

(assert (=> (not b_lambda!11725) (not b!854701)))

(declare-fun t!23267 () Bool)

(declare-fun tb!4495 () Bool)

(assert (=> (and start!73278 (= defaultEntry!696 defaultEntry!696) t!23267) tb!4495))

(declare-fun result!8601 () Bool)

(assert (=> tb!4495 (= result!8601 tp_is_empty!16329)))

(assert (=> b!854701 t!23267))

(declare-fun b_and!23547 () Bool)

(assert (= b_and!23545 (and (=> t!23267 result!8601) b_and!23547)))

(declare-fun m!796091 () Bool)

(assert (=> b!854695 m!796091))

(assert (=> b!854695 m!796091))

(declare-fun m!796093 () Bool)

(assert (=> b!854695 m!796093))

(declare-fun m!796095 () Bool)

(assert (=> b!854695 m!796095))

(declare-fun m!796097 () Bool)

(assert (=> b!854698 m!796097))

(declare-fun m!796099 () Bool)

(assert (=> b!854696 m!796099))

(declare-fun m!796101 () Bool)

(assert (=> b!854693 m!796101))

(declare-fun m!796103 () Bool)

(assert (=> b!854693 m!796103))

(declare-fun m!796105 () Bool)

(assert (=> b!854693 m!796105))

(declare-fun m!796107 () Bool)

(assert (=> b!854692 m!796107))

(declare-fun m!796109 () Bool)

(assert (=> bm!38432 m!796109))

(declare-fun m!796111 () Bool)

(assert (=> start!73278 m!796111))

(declare-fun m!796113 () Bool)

(assert (=> start!73278 m!796113))

(declare-fun m!796115 () Bool)

(assert (=> mapNonEmpty!26093 m!796115))

(assert (=> b!854701 m!796109))

(declare-fun m!796117 () Bool)

(assert (=> b!854701 m!796117))

(declare-fun m!796119 () Bool)

(assert (=> b!854701 m!796119))

(declare-fun m!796121 () Bool)

(assert (=> b!854701 m!796121))

(declare-fun m!796123 () Bool)

(assert (=> b!854701 m!796123))

(declare-fun m!796125 () Bool)

(assert (=> b!854701 m!796125))

(declare-fun m!796127 () Bool)

(assert (=> b!854701 m!796127))

(declare-fun m!796129 () Bool)

(assert (=> b!854701 m!796129))

(assert (=> b!854701 m!796119))

(declare-fun m!796131 () Bool)

(assert (=> b!854701 m!796131))

(assert (=> b!854701 m!796103))

(assert (=> b!854701 m!796091))

(declare-fun m!796133 () Bool)

(assert (=> b!854701 m!796133))

(assert (=> b!854701 m!796129))

(declare-fun m!796135 () Bool)

(assert (=> b!854701 m!796135))

(assert (=> b!854701 m!796125))

(declare-fun m!796137 () Bool)

(assert (=> b!854703 m!796137))

(declare-fun m!796139 () Bool)

(assert (=> bm!38431 m!796139))

(declare-fun m!796141 () Bool)

(assert (=> b!854691 m!796141))

(declare-fun m!796143 () Bool)

(assert (=> b!854694 m!796143))

(check-sat (not b_lambda!11725) (not b!854694) (not b!854693) (not b!854696) (not mapNonEmpty!26093) (not b!854703) (not start!73278) (not b!854692) (not bm!38432) b_and!23547 (not b!854695) tp_is_empty!16329 (not b!854701) (not b_next!14193) (not bm!38431) (not b!854691))
(check-sat b_and!23547 (not b_next!14193))
