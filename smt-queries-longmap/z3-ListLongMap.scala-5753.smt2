; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74514 () Bool)

(assert start!74514)

(declare-fun b_free!15109 () Bool)

(declare-fun b_next!15109 () Bool)

(assert (=> start!74514 (= b_free!15109 (not b_next!15109))))

(declare-fun tp!53002 () Bool)

(declare-fun b_and!24895 () Bool)

(assert (=> start!74514 (= tp!53002 b_and!24895)))

(declare-fun b!875882 () Bool)

(declare-fun e!487701 () Bool)

(declare-datatypes ((V!28185 0))(
  ( (V!28186 (val!8724 Int)) )
))
(declare-datatypes ((tuple2!11458 0))(
  ( (tuple2!11459 (_1!5740 (_ BitVec 64)) (_2!5740 V!28185)) )
))
(declare-datatypes ((List!17303 0))(
  ( (Nil!17300) (Cons!17299 (h!18436 tuple2!11458) (t!24336 List!17303)) )
))
(declare-datatypes ((ListLongMap!10229 0))(
  ( (ListLongMap!10230 (toList!5130 List!17303)) )
))
(declare-fun call!38597 () ListLongMap!10229)

(declare-fun call!38598 () ListLongMap!10229)

(assert (=> b!875882 (= e!487701 (= call!38597 call!38598))))

(declare-fun b!875883 () Bool)

(declare-fun res!594989 () Bool)

(declare-fun e!487699 () Bool)

(assert (=> b!875883 (=> (not res!594989) (not e!487699))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50885 0))(
  ( (array!50886 (arr!24466 (Array (_ BitVec 32) (_ BitVec 64))) (size!24907 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50885)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!875883 (= res!594989 (and (= (select (arr!24466 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!875884 () Bool)

(declare-fun e!487697 () Bool)

(declare-fun tp_is_empty!17353 () Bool)

(assert (=> b!875884 (= e!487697 tp_is_empty!17353)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8237 0))(
  ( (ValueCellFull!8237 (v!11153 V!28185)) (EmptyCell!8237) )
))
(declare-datatypes ((array!50887 0))(
  ( (array!50888 (arr!24467 (Array (_ BitVec 32) ValueCell!8237)) (size!24908 (_ BitVec 32))) )
))
(declare-fun lt!396408 () array!50887)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28185)

(declare-fun zeroValue!654 () V!28185)

(declare-fun bm!38594 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3173 (array!50885 array!50887 (_ BitVec 32) (_ BitVec 32) V!28185 V!28185 (_ BitVec 32) Int) ListLongMap!10229)

(assert (=> bm!38594 (= call!38597 (getCurrentListMapNoExtraKeys!3173 _keys!868 lt!396408 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!594987 () Bool)

(assert (=> start!74514 (=> (not res!594987) (not e!487699))))

(assert (=> start!74514 (= res!594987 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24907 _keys!868))))))

(assert (=> start!74514 e!487699))

(assert (=> start!74514 tp_is_empty!17353))

(assert (=> start!74514 true))

(assert (=> start!74514 tp!53002))

(declare-fun array_inv!19346 (array!50885) Bool)

(assert (=> start!74514 (array_inv!19346 _keys!868)))

(declare-fun _values!688 () array!50887)

(declare-fun e!487700 () Bool)

(declare-fun array_inv!19347 (array!50887) Bool)

(assert (=> start!74514 (and (array_inv!19347 _values!688) e!487700)))

(declare-fun b!875885 () Bool)

(declare-fun res!594984 () Bool)

(assert (=> b!875885 (=> (not res!594984) (not e!487699))))

(declare-datatypes ((List!17304 0))(
  ( (Nil!17301) (Cons!17300 (h!18437 (_ BitVec 64)) (t!24337 List!17304)) )
))
(declare-fun arrayNoDuplicates!0 (array!50885 (_ BitVec 32) List!17304) Bool)

(assert (=> b!875885 (= res!594984 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17301))))

(declare-fun b!875886 () Bool)

(declare-fun mapRes!27638 () Bool)

(assert (=> b!875886 (= e!487700 (and e!487697 mapRes!27638))))

(declare-fun condMapEmpty!27638 () Bool)

(declare-fun mapDefault!27638 () ValueCell!8237)

(assert (=> b!875886 (= condMapEmpty!27638 (= (arr!24467 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8237)) mapDefault!27638)))))

(declare-fun b!875887 () Bool)

(declare-fun res!594982 () Bool)

(assert (=> b!875887 (=> (not res!594982) (not e!487699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50885 (_ BitVec 32)) Bool)

(assert (=> b!875887 (= res!594982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!38595 () Bool)

(assert (=> bm!38595 (= call!38598 (getCurrentListMapNoExtraKeys!3173 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875888 () Bool)

(declare-fun res!594981 () Bool)

(assert (=> b!875888 (=> (not res!594981) (not e!487699))))

(assert (=> b!875888 (= res!594981 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24907 _keys!868))))))

(declare-fun b!875889 () Bool)

(declare-fun res!594985 () Bool)

(assert (=> b!875889 (=> (not res!594985) (not e!487699))))

(assert (=> b!875889 (= res!594985 (and (= (size!24908 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24907 _keys!868) (size!24908 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27638 () Bool)

(declare-fun tp!53003 () Bool)

(declare-fun e!487703 () Bool)

(assert (=> mapNonEmpty!27638 (= mapRes!27638 (and tp!53003 e!487703))))

(declare-fun mapRest!27638 () (Array (_ BitVec 32) ValueCell!8237))

(declare-fun mapKey!27638 () (_ BitVec 32))

(declare-fun mapValue!27638 () ValueCell!8237)

(assert (=> mapNonEmpty!27638 (= (arr!24467 _values!688) (store mapRest!27638 mapKey!27638 mapValue!27638))))

(declare-fun b!875890 () Bool)

(declare-fun res!594983 () Bool)

(assert (=> b!875890 (=> (not res!594983) (not e!487699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875890 (= res!594983 (validKeyInArray!0 k0!854))))

(declare-fun b!875891 () Bool)

(declare-fun res!594986 () Bool)

(assert (=> b!875891 (=> (not res!594986) (not e!487699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875891 (= res!594986 (validMask!0 mask!1196))))

(declare-fun v!557 () V!28185)

(declare-fun b!875892 () Bool)

(declare-fun +!2481 (ListLongMap!10229 tuple2!11458) ListLongMap!10229)

(assert (=> b!875892 (= e!487701 (= call!38597 (+!2481 call!38598 (tuple2!11459 k0!854 v!557))))))

(declare-fun b!875893 () Bool)

(assert (=> b!875893 (= e!487703 tp_is_empty!17353)))

(declare-fun b!875894 () Bool)

(declare-fun e!487702 () Bool)

(assert (=> b!875894 (= e!487699 e!487702)))

(declare-fun res!594988 () Bool)

(assert (=> b!875894 (=> (not res!594988) (not e!487702))))

(assert (=> b!875894 (= res!594988 (= from!1053 i!612))))

(declare-fun lt!396406 () ListLongMap!10229)

(assert (=> b!875894 (= lt!396406 (getCurrentListMapNoExtraKeys!3173 _keys!868 lt!396408 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!875894 (= lt!396408 (array!50888 (store (arr!24467 _values!688) i!612 (ValueCellFull!8237 v!557)) (size!24908 _values!688)))))

(declare-fun lt!396405 () ListLongMap!10229)

(assert (=> b!875894 (= lt!396405 (getCurrentListMapNoExtraKeys!3173 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875895 () Bool)

(assert (=> b!875895 (= e!487702 (not (bvslt from!1053 (size!24907 _keys!868))))))

(assert (=> b!875895 e!487701))

(declare-fun c!92759 () Bool)

(assert (=> b!875895 (= c!92759 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29910 0))(
  ( (Unit!29911) )
))
(declare-fun lt!396407 () Unit!29910)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!649 (array!50885 array!50887 (_ BitVec 32) (_ BitVec 32) V!28185 V!28185 (_ BitVec 32) (_ BitVec 64) V!28185 (_ BitVec 32) Int) Unit!29910)

(assert (=> b!875895 (= lt!396407 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!649 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27638 () Bool)

(assert (=> mapIsEmpty!27638 mapRes!27638))

(assert (= (and start!74514 res!594987) b!875891))

(assert (= (and b!875891 res!594986) b!875889))

(assert (= (and b!875889 res!594985) b!875887))

(assert (= (and b!875887 res!594982) b!875885))

(assert (= (and b!875885 res!594984) b!875888))

(assert (= (and b!875888 res!594981) b!875890))

(assert (= (and b!875890 res!594983) b!875883))

(assert (= (and b!875883 res!594989) b!875894))

(assert (= (and b!875894 res!594988) b!875895))

(assert (= (and b!875895 c!92759) b!875892))

(assert (= (and b!875895 (not c!92759)) b!875882))

(assert (= (or b!875892 b!875882) bm!38594))

(assert (= (or b!875892 b!875882) bm!38595))

(assert (= (and b!875886 condMapEmpty!27638) mapIsEmpty!27638))

(assert (= (and b!875886 (not condMapEmpty!27638)) mapNonEmpty!27638))

(get-info :version)

(assert (= (and mapNonEmpty!27638 ((_ is ValueCellFull!8237) mapValue!27638)) b!875893))

(assert (= (and b!875886 ((_ is ValueCellFull!8237) mapDefault!27638)) b!875884))

(assert (= start!74514 b!875886))

(declare-fun m!816253 () Bool)

(assert (=> b!875887 m!816253))

(declare-fun m!816255 () Bool)

(assert (=> b!875890 m!816255))

(declare-fun m!816257 () Bool)

(assert (=> bm!38595 m!816257))

(declare-fun m!816259 () Bool)

(assert (=> start!74514 m!816259))

(declare-fun m!816261 () Bool)

(assert (=> start!74514 m!816261))

(declare-fun m!816263 () Bool)

(assert (=> b!875883 m!816263))

(declare-fun m!816265 () Bool)

(assert (=> bm!38594 m!816265))

(declare-fun m!816267 () Bool)

(assert (=> b!875894 m!816267))

(declare-fun m!816269 () Bool)

(assert (=> b!875894 m!816269))

(declare-fun m!816271 () Bool)

(assert (=> b!875894 m!816271))

(declare-fun m!816273 () Bool)

(assert (=> b!875885 m!816273))

(declare-fun m!816275 () Bool)

(assert (=> b!875895 m!816275))

(declare-fun m!816277 () Bool)

(assert (=> mapNonEmpty!27638 m!816277))

(declare-fun m!816279 () Bool)

(assert (=> b!875892 m!816279))

(declare-fun m!816281 () Bool)

(assert (=> b!875891 m!816281))

(check-sat (not b!875887) (not b!875894) (not bm!38594) b_and!24895 tp_is_empty!17353 (not start!74514) (not bm!38595) (not b!875895) (not b_next!15109) (not b!875892) (not b!875885) (not mapNonEmpty!27638) (not b!875890) (not b!875891))
(check-sat b_and!24895 (not b_next!15109))
