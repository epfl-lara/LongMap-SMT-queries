; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72952 () Bool)

(assert start!72952)

(declare-fun b_free!13885 () Bool)

(declare-fun b_next!13885 () Bool)

(assert (=> start!72952 (= b_free!13885 (not b_next!13885))))

(declare-fun tp!49159 () Bool)

(declare-fun b_and!22945 () Bool)

(assert (=> start!72952 (= tp!49159 b_and!22945)))

(declare-fun b!847307 () Bool)

(declare-fun e!472785 () Bool)

(declare-fun e!472787 () Bool)

(declare-fun mapRes!25631 () Bool)

(assert (=> b!847307 (= e!472785 (and e!472787 mapRes!25631))))

(declare-fun condMapEmpty!25631 () Bool)

(declare-datatypes ((V!26409 0))(
  ( (V!26410 (val!8058 Int)) )
))
(declare-datatypes ((ValueCell!7571 0))(
  ( (ValueCellFull!7571 (v!10477 V!26409)) (EmptyCell!7571) )
))
(declare-datatypes ((array!48251 0))(
  ( (array!48252 (arr!23157 (Array (_ BitVec 32) ValueCell!7571)) (size!23599 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48251)

(declare-fun mapDefault!25631 () ValueCell!7571)

(assert (=> b!847307 (= condMapEmpty!25631 (= (arr!23157 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7571)) mapDefault!25631)))))

(declare-fun b!847308 () Bool)

(declare-fun e!472789 () Bool)

(assert (=> b!847308 (= e!472789 (not true))))

(declare-fun e!472788 () Bool)

(assert (=> b!847308 e!472788))

(declare-fun c!91433 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847308 (= c!91433 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28887 0))(
  ( (Unit!28888) )
))
(declare-fun lt!381533 () Unit!28887)

(declare-fun v!557 () V!26409)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48253 0))(
  ( (array!48254 (arr!23158 (Array (_ BitVec 32) (_ BitVec 64))) (size!23600 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48253)

(declare-fun minValue!654 () V!26409)

(declare-fun zeroValue!654 () V!26409)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!318 (array!48253 array!48251 (_ BitVec 32) (_ BitVec 32) V!26409 V!26409 (_ BitVec 32) (_ BitVec 64) V!26409 (_ BitVec 32) Int) Unit!28887)

(assert (=> b!847308 (= lt!381533 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!318 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847309 () Bool)

(declare-fun res!575744 () Bool)

(declare-fun e!472790 () Bool)

(assert (=> b!847309 (=> (not res!575744) (not e!472790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48253 (_ BitVec 32)) Bool)

(assert (=> b!847309 (= res!575744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847310 () Bool)

(declare-fun res!575740 () Bool)

(assert (=> b!847310 (=> (not res!575740) (not e!472790))))

(assert (=> b!847310 (= res!575740 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23600 _keys!868))))))

(declare-fun mapIsEmpty!25631 () Bool)

(assert (=> mapIsEmpty!25631 mapRes!25631))

(declare-fun bm!37481 () Bool)

(declare-datatypes ((tuple2!10554 0))(
  ( (tuple2!10555 (_1!5288 (_ BitVec 64)) (_2!5288 V!26409)) )
))
(declare-datatypes ((List!16410 0))(
  ( (Nil!16407) (Cons!16406 (h!17537 tuple2!10554) (t!22772 List!16410)) )
))
(declare-datatypes ((ListLongMap!9313 0))(
  ( (ListLongMap!9314 (toList!4672 List!16410)) )
))
(declare-fun call!37484 () ListLongMap!9313)

(declare-fun lt!381530 () array!48251)

(declare-fun getCurrentListMapNoExtraKeys!2685 (array!48253 array!48251 (_ BitVec 32) (_ BitVec 32) V!26409 V!26409 (_ BitVec 32) Int) ListLongMap!9313)

(assert (=> bm!37481 (= call!37484 (getCurrentListMapNoExtraKeys!2685 _keys!868 lt!381530 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847312 () Bool)

(declare-fun res!575748 () Bool)

(assert (=> b!847312 (=> (not res!575748) (not e!472790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847312 (= res!575748 (validKeyInArray!0 k0!854))))

(declare-fun b!847313 () Bool)

(declare-fun e!472791 () Bool)

(declare-fun tp_is_empty!16021 () Bool)

(assert (=> b!847313 (= e!472791 tp_is_empty!16021)))

(declare-fun b!847314 () Bool)

(assert (=> b!847314 (= e!472790 e!472789)))

(declare-fun res!575743 () Bool)

(assert (=> b!847314 (=> (not res!575743) (not e!472789))))

(assert (=> b!847314 (= res!575743 (= from!1053 i!612))))

(declare-fun lt!381532 () ListLongMap!9313)

(assert (=> b!847314 (= lt!381532 (getCurrentListMapNoExtraKeys!2685 _keys!868 lt!381530 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!847314 (= lt!381530 (array!48252 (store (arr!23157 _values!688) i!612 (ValueCellFull!7571 v!557)) (size!23599 _values!688)))))

(declare-fun lt!381531 () ListLongMap!9313)

(assert (=> b!847314 (= lt!381531 (getCurrentListMapNoExtraKeys!2685 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun call!37485 () ListLongMap!9313)

(declare-fun b!847315 () Bool)

(declare-fun +!2104 (ListLongMap!9313 tuple2!10554) ListLongMap!9313)

(assert (=> b!847315 (= e!472788 (= call!37484 (+!2104 call!37485 (tuple2!10555 k0!854 v!557))))))

(declare-fun b!847316 () Bool)

(assert (=> b!847316 (= e!472787 tp_is_empty!16021)))

(declare-fun mapNonEmpty!25631 () Bool)

(declare-fun tp!49160 () Bool)

(assert (=> mapNonEmpty!25631 (= mapRes!25631 (and tp!49160 e!472791))))

(declare-fun mapRest!25631 () (Array (_ BitVec 32) ValueCell!7571))

(declare-fun mapKey!25631 () (_ BitVec 32))

(declare-fun mapValue!25631 () ValueCell!7571)

(assert (=> mapNonEmpty!25631 (= (arr!23157 _values!688) (store mapRest!25631 mapKey!25631 mapValue!25631))))

(declare-fun b!847317 () Bool)

(declare-fun res!575746 () Bool)

(assert (=> b!847317 (=> (not res!575746) (not e!472790))))

(declare-datatypes ((List!16411 0))(
  ( (Nil!16408) (Cons!16407 (h!17538 (_ BitVec 64)) (t!22773 List!16411)) )
))
(declare-fun arrayNoDuplicates!0 (array!48253 (_ BitVec 32) List!16411) Bool)

(assert (=> b!847317 (= res!575746 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16408))))

(declare-fun res!575747 () Bool)

(assert (=> start!72952 (=> (not res!575747) (not e!472790))))

(assert (=> start!72952 (= res!575747 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23600 _keys!868))))))

(assert (=> start!72952 e!472790))

(assert (=> start!72952 tp_is_empty!16021))

(assert (=> start!72952 true))

(assert (=> start!72952 tp!49159))

(declare-fun array_inv!18466 (array!48253) Bool)

(assert (=> start!72952 (array_inv!18466 _keys!868)))

(declare-fun array_inv!18467 (array!48251) Bool)

(assert (=> start!72952 (and (array_inv!18467 _values!688) e!472785)))

(declare-fun b!847311 () Bool)

(declare-fun res!575741 () Bool)

(assert (=> b!847311 (=> (not res!575741) (not e!472790))))

(assert (=> b!847311 (= res!575741 (and (= (select (arr!23158 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!37482 () Bool)

(assert (=> bm!37482 (= call!37485 (getCurrentListMapNoExtraKeys!2685 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847318 () Bool)

(declare-fun res!575742 () Bool)

(assert (=> b!847318 (=> (not res!575742) (not e!472790))))

(assert (=> b!847318 (= res!575742 (and (= (size!23599 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23600 _keys!868) (size!23599 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847319 () Bool)

(declare-fun res!575745 () Bool)

(assert (=> b!847319 (=> (not res!575745) (not e!472790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847319 (= res!575745 (validMask!0 mask!1196))))

(declare-fun b!847320 () Bool)

(assert (=> b!847320 (= e!472788 (= call!37484 call!37485))))

(assert (= (and start!72952 res!575747) b!847319))

(assert (= (and b!847319 res!575745) b!847318))

(assert (= (and b!847318 res!575742) b!847309))

(assert (= (and b!847309 res!575744) b!847317))

(assert (= (and b!847317 res!575746) b!847310))

(assert (= (and b!847310 res!575740) b!847312))

(assert (= (and b!847312 res!575748) b!847311))

(assert (= (and b!847311 res!575741) b!847314))

(assert (= (and b!847314 res!575743) b!847308))

(assert (= (and b!847308 c!91433) b!847315))

(assert (= (and b!847308 (not c!91433)) b!847320))

(assert (= (or b!847315 b!847320) bm!37482))

(assert (= (or b!847315 b!847320) bm!37481))

(assert (= (and b!847307 condMapEmpty!25631) mapIsEmpty!25631))

(assert (= (and b!847307 (not condMapEmpty!25631)) mapNonEmpty!25631))

(get-info :version)

(assert (= (and mapNonEmpty!25631 ((_ is ValueCellFull!7571) mapValue!25631)) b!847313))

(assert (= (and b!847307 ((_ is ValueCellFull!7571) mapDefault!25631)) b!847316))

(assert (= start!72952 b!847307))

(declare-fun m!787829 () Bool)

(assert (=> b!847311 m!787829))

(declare-fun m!787831 () Bool)

(assert (=> bm!37482 m!787831))

(declare-fun m!787833 () Bool)

(assert (=> b!847315 m!787833))

(declare-fun m!787835 () Bool)

(assert (=> b!847312 m!787835))

(declare-fun m!787837 () Bool)

(assert (=> b!847317 m!787837))

(declare-fun m!787839 () Bool)

(assert (=> bm!37481 m!787839))

(declare-fun m!787841 () Bool)

(assert (=> b!847309 m!787841))

(declare-fun m!787843 () Bool)

(assert (=> mapNonEmpty!25631 m!787843))

(declare-fun m!787845 () Bool)

(assert (=> b!847308 m!787845))

(declare-fun m!787847 () Bool)

(assert (=> start!72952 m!787847))

(declare-fun m!787849 () Bool)

(assert (=> start!72952 m!787849))

(declare-fun m!787851 () Bool)

(assert (=> b!847314 m!787851))

(declare-fun m!787853 () Bool)

(assert (=> b!847314 m!787853))

(declare-fun m!787855 () Bool)

(assert (=> b!847314 m!787855))

(declare-fun m!787857 () Bool)

(assert (=> b!847319 m!787857))

(check-sat (not bm!37482) b_and!22945 (not bm!37481) (not b_next!13885) (not b!847312) (not b!847308) tp_is_empty!16021 (not mapNonEmpty!25631) (not b!847317) (not b!847314) (not b!847319) (not b!847315) (not start!72952) (not b!847309))
(check-sat b_and!22945 (not b_next!13885))
