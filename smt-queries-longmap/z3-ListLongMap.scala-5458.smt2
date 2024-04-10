; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72534 () Bool)

(assert start!72534)

(declare-fun b_free!13719 () Bool)

(declare-fun b_next!13719 () Bool)

(assert (=> start!72534 (= b_free!13719 (not b_next!13719))))

(declare-fun tp!48255 () Bool)

(declare-fun b_and!22805 () Bool)

(assert (=> start!72534 (= tp!48255 b_and!22805)))

(declare-fun b!841832 () Bool)

(declare-fun res!572222 () Bool)

(declare-fun e!469585 () Bool)

(assert (=> b!841832 (=> (not res!572222) (not e!469585))))

(declare-datatypes ((array!47444 0))(
  ( (array!47445 (arr!22753 (Array (_ BitVec 32) (_ BitVec 64))) (size!23193 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47444)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47444 (_ BitVec 32)) Bool)

(assert (=> b!841832 (= res!572222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841833 () Bool)

(declare-fun res!572224 () Bool)

(assert (=> b!841833 (=> (not res!572224) (not e!469585))))

(declare-datatypes ((List!16185 0))(
  ( (Nil!16182) (Cons!16181 (h!17312 (_ BitVec 64)) (t!22556 List!16185)) )
))
(declare-fun arrayNoDuplicates!0 (array!47444 (_ BitVec 32) List!16185) Bool)

(assert (=> b!841833 (= res!572224 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16182))))

(declare-fun b!841834 () Bool)

(declare-fun e!469586 () Bool)

(declare-datatypes ((V!25827 0))(
  ( (V!25828 (val!7840 Int)) )
))
(declare-datatypes ((tuple2!10406 0))(
  ( (tuple2!10407 (_1!5214 (_ BitVec 64)) (_2!5214 V!25827)) )
))
(declare-datatypes ((List!16186 0))(
  ( (Nil!16183) (Cons!16182 (h!17313 tuple2!10406) (t!22557 List!16186)) )
))
(declare-datatypes ((ListLongMap!9175 0))(
  ( (ListLongMap!9176 (toList!4603 List!16186)) )
))
(declare-fun call!37391 () ListLongMap!9175)

(declare-fun call!37390 () ListLongMap!9175)

(assert (=> b!841834 (= e!469586 (= call!37391 call!37390))))

(declare-fun b!841835 () Bool)

(declare-fun res!572220 () Bool)

(assert (=> b!841835 (=> (not res!572220) (not e!469585))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841835 (= res!572220 (validKeyInArray!0 k0!854))))

(declare-fun b!841836 () Bool)

(declare-fun e!469588 () Bool)

(declare-fun tp_is_empty!15585 () Bool)

(assert (=> b!841836 (= e!469588 tp_is_empty!15585)))

(declare-fun b!841837 () Bool)

(declare-fun res!572218 () Bool)

(assert (=> b!841837 (=> (not res!572218) (not e!469585))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!841837 (= res!572218 (and (= (select (arr!22753 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23193 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun res!572223 () Bool)

(assert (=> start!72534 (=> (not res!572223) (not e!469585))))

(assert (=> start!72534 (= res!572223 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23193 _keys!868))))))

(assert (=> start!72534 e!469585))

(assert (=> start!72534 tp_is_empty!15585))

(assert (=> start!72534 true))

(assert (=> start!72534 tp!48255))

(declare-fun array_inv!18104 (array!47444) Bool)

(assert (=> start!72534 (array_inv!18104 _keys!868)))

(declare-datatypes ((ValueCell!7353 0))(
  ( (ValueCellFull!7353 (v!10265 V!25827)) (EmptyCell!7353) )
))
(declare-datatypes ((array!47446 0))(
  ( (array!47447 (arr!22754 (Array (_ BitVec 32) ValueCell!7353)) (size!23194 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47446)

(declare-fun e!469583 () Bool)

(declare-fun array_inv!18105 (array!47446) Bool)

(assert (=> start!72534 (and (array_inv!18105 _values!688) e!469583)))

(declare-fun v!557 () V!25827)

(declare-fun b!841838 () Bool)

(declare-fun +!2067 (ListLongMap!9175 tuple2!10406) ListLongMap!9175)

(assert (=> b!841838 (= e!469586 (= call!37391 (+!2067 call!37390 (tuple2!10407 k0!854 v!557))))))

(declare-fun b!841839 () Bool)

(declare-fun res!572221 () Bool)

(assert (=> b!841839 (=> (not res!572221) (not e!469585))))

(assert (=> b!841839 (= res!572221 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23193 _keys!868))))))

(declare-fun mapNonEmpty!24977 () Bool)

(declare-fun mapRes!24977 () Bool)

(declare-fun tp!48256 () Bool)

(declare-fun e!469587 () Bool)

(assert (=> mapNonEmpty!24977 (= mapRes!24977 (and tp!48256 e!469587))))

(declare-fun mapValue!24977 () ValueCell!7353)

(declare-fun mapRest!24977 () (Array (_ BitVec 32) ValueCell!7353))

(declare-fun mapKey!24977 () (_ BitVec 32))

(assert (=> mapNonEmpty!24977 (= (arr!22754 _values!688) (store mapRest!24977 mapKey!24977 mapValue!24977))))

(declare-fun b!841840 () Bool)

(assert (=> b!841840 (= e!469585 (not true))))

(assert (=> b!841840 e!469586))

(declare-fun c!91438 () Bool)

(assert (=> b!841840 (= c!91438 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25827)

(declare-fun zeroValue!654 () V!25827)

(declare-datatypes ((Unit!28911 0))(
  ( (Unit!28912) )
))
(declare-fun lt!380944 () Unit!28911)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!301 (array!47444 array!47446 (_ BitVec 32) (_ BitVec 32) V!25827 V!25827 (_ BitVec 32) (_ BitVec 64) V!25827 (_ BitVec 32) Int) Unit!28911)

(assert (=> b!841840 (= lt!380944 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!301 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37387 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2588 (array!47444 array!47446 (_ BitVec 32) (_ BitVec 32) V!25827 V!25827 (_ BitVec 32) Int) ListLongMap!9175)

(assert (=> bm!37387 (= call!37390 (getCurrentListMapNoExtraKeys!2588 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841841 () Bool)

(declare-fun res!572219 () Bool)

(assert (=> b!841841 (=> (not res!572219) (not e!469585))))

(assert (=> b!841841 (= res!572219 (and (= (size!23194 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23193 _keys!868) (size!23194 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37388 () Bool)

(assert (=> bm!37388 (= call!37391 (getCurrentListMapNoExtraKeys!2588 _keys!868 (array!47447 (store (arr!22754 _values!688) i!612 (ValueCellFull!7353 v!557)) (size!23194 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841842 () Bool)

(assert (=> b!841842 (= e!469587 tp_is_empty!15585)))

(declare-fun mapIsEmpty!24977 () Bool)

(assert (=> mapIsEmpty!24977 mapRes!24977))

(declare-fun b!841843 () Bool)

(declare-fun res!572225 () Bool)

(assert (=> b!841843 (=> (not res!572225) (not e!469585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841843 (= res!572225 (validMask!0 mask!1196))))

(declare-fun b!841844 () Bool)

(assert (=> b!841844 (= e!469583 (and e!469588 mapRes!24977))))

(declare-fun condMapEmpty!24977 () Bool)

(declare-fun mapDefault!24977 () ValueCell!7353)

(assert (=> b!841844 (= condMapEmpty!24977 (= (arr!22754 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7353)) mapDefault!24977)))))

(assert (= (and start!72534 res!572223) b!841843))

(assert (= (and b!841843 res!572225) b!841841))

(assert (= (and b!841841 res!572219) b!841832))

(assert (= (and b!841832 res!572222) b!841833))

(assert (= (and b!841833 res!572224) b!841839))

(assert (= (and b!841839 res!572221) b!841835))

(assert (= (and b!841835 res!572220) b!841837))

(assert (= (and b!841837 res!572218) b!841840))

(assert (= (and b!841840 c!91438) b!841838))

(assert (= (and b!841840 (not c!91438)) b!841834))

(assert (= (or b!841838 b!841834) bm!37388))

(assert (= (or b!841838 b!841834) bm!37387))

(assert (= (and b!841844 condMapEmpty!24977) mapIsEmpty!24977))

(assert (= (and b!841844 (not condMapEmpty!24977)) mapNonEmpty!24977))

(get-info :version)

(assert (= (and mapNonEmpty!24977 ((_ is ValueCellFull!7353) mapValue!24977)) b!841842))

(assert (= (and b!841844 ((_ is ValueCellFull!7353) mapDefault!24977)) b!841836))

(assert (= start!72534 b!841844))

(declare-fun m!785141 () Bool)

(assert (=> b!841840 m!785141))

(declare-fun m!785143 () Bool)

(assert (=> b!841833 m!785143))

(declare-fun m!785145 () Bool)

(assert (=> mapNonEmpty!24977 m!785145))

(declare-fun m!785147 () Bool)

(assert (=> b!841838 m!785147))

(declare-fun m!785149 () Bool)

(assert (=> b!841837 m!785149))

(declare-fun m!785151 () Bool)

(assert (=> bm!37387 m!785151))

(declare-fun m!785153 () Bool)

(assert (=> start!72534 m!785153))

(declare-fun m!785155 () Bool)

(assert (=> start!72534 m!785155))

(declare-fun m!785157 () Bool)

(assert (=> bm!37388 m!785157))

(declare-fun m!785159 () Bool)

(assert (=> bm!37388 m!785159))

(declare-fun m!785161 () Bool)

(assert (=> b!841835 m!785161))

(declare-fun m!785163 () Bool)

(assert (=> b!841843 m!785163))

(declare-fun m!785165 () Bool)

(assert (=> b!841832 m!785165))

(check-sat (not b!841833) (not bm!37387) (not b_next!13719) (not mapNonEmpty!24977) (not b!841840) b_and!22805 (not b!841843) (not b!841835) (not b!841832) tp_is_empty!15585 (not start!72534) (not bm!37388) (not b!841838))
(check-sat b_and!22805 (not b_next!13719))
