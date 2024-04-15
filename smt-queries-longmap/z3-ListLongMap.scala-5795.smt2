; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74716 () Bool)

(assert start!74716)

(declare-fun b_free!15361 () Bool)

(declare-fun b_next!15361 () Bool)

(assert (=> start!74716 (= b_free!15361 (not b_next!15361))))

(declare-fun tp!53775 () Bool)

(declare-fun b_and!25331 () Bool)

(assert (=> start!74716 (= tp!53775 b_and!25331)))

(declare-fun b!880852 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun e!490179 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51317 0))(
  ( (array!51318 (arr!24682 (Array (_ BitVec 32) (_ BitVec 64))) (size!25124 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51317)

(declare-fun arrayContainsKey!0 (array!51317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!880852 (= e!490179 (arrayContainsKey!0 _keys!868 k0!854 i!612))))

(declare-fun mapNonEmpty!28032 () Bool)

(declare-fun mapRes!28032 () Bool)

(declare-fun tp!53774 () Bool)

(declare-fun e!490178 () Bool)

(assert (=> mapNonEmpty!28032 (= mapRes!28032 (and tp!53774 e!490178))))

(declare-fun mapKey!28032 () (_ BitVec 32))

(declare-datatypes ((V!28521 0))(
  ( (V!28522 (val!8850 Int)) )
))
(declare-datatypes ((ValueCell!8363 0))(
  ( (ValueCellFull!8363 (v!11296 V!28521)) (EmptyCell!8363) )
))
(declare-fun mapRest!28032 () (Array (_ BitVec 32) ValueCell!8363))

(declare-fun mapValue!28032 () ValueCell!8363)

(declare-datatypes ((array!51319 0))(
  ( (array!51320 (arr!24683 (Array (_ BitVec 32) ValueCell!8363)) (size!25125 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51319)

(assert (=> mapNonEmpty!28032 (= (arr!24683 _values!688) (store mapRest!28032 mapKey!28032 mapValue!28032))))

(declare-fun mapIsEmpty!28032 () Bool)

(assert (=> mapIsEmpty!28032 mapRes!28032))

(declare-fun b!880853 () Bool)

(declare-fun res!598504 () Bool)

(declare-fun e!490181 () Bool)

(assert (=> b!880853 (=> (not res!598504) (not e!490181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880853 (= res!598504 (validKeyInArray!0 k0!854))))

(declare-fun b!880854 () Bool)

(declare-fun res!598508 () Bool)

(assert (=> b!880854 (=> (not res!598508) (not e!490181))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51317 (_ BitVec 32)) Bool)

(assert (=> b!880854 (= res!598508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880855 () Bool)

(declare-fun res!598514 () Bool)

(assert (=> b!880855 (=> (not res!598514) (not e!490181))))

(declare-datatypes ((List!17532 0))(
  ( (Nil!17529) (Cons!17528 (h!18659 (_ BitVec 64)) (t!24686 List!17532)) )
))
(declare-fun arrayNoDuplicates!0 (array!51317 (_ BitVec 32) List!17532) Bool)

(assert (=> b!880855 (= res!598514 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17529))))

(declare-fun b!880856 () Bool)

(declare-fun res!598510 () Bool)

(assert (=> b!880856 (=> (not res!598510) (not e!490181))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!880856 (= res!598510 (and (= (size!25125 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25124 _keys!868) (size!25125 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880857 () Bool)

(declare-fun e!490182 () Bool)

(assert (=> b!880857 (= e!490181 e!490182)))

(declare-fun res!598506 () Bool)

(assert (=> b!880857 (=> (not res!598506) (not e!490182))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!880857 (= res!598506 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11736 0))(
  ( (tuple2!11737 (_1!5879 (_ BitVec 64)) (_2!5879 V!28521)) )
))
(declare-datatypes ((List!17533 0))(
  ( (Nil!17530) (Cons!17529 (h!18660 tuple2!11736) (t!24687 List!17533)) )
))
(declare-datatypes ((ListLongMap!10495 0))(
  ( (ListLongMap!10496 (toList!5263 List!17533)) )
))
(declare-fun lt!398242 () ListLongMap!10495)

(declare-fun lt!398239 () array!51319)

(declare-fun minValue!654 () V!28521)

(declare-fun zeroValue!654 () V!28521)

(declare-fun getCurrentListMapNoExtraKeys!3254 (array!51317 array!51319 (_ BitVec 32) (_ BitVec 32) V!28521 V!28521 (_ BitVec 32) Int) ListLongMap!10495)

(assert (=> b!880857 (= lt!398242 (getCurrentListMapNoExtraKeys!3254 _keys!868 lt!398239 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28521)

(assert (=> b!880857 (= lt!398239 (array!51320 (store (arr!24683 _values!688) i!612 (ValueCellFull!8363 v!557)) (size!25125 _values!688)))))

(declare-fun lt!398240 () ListLongMap!10495)

(assert (=> b!880857 (= lt!398240 (getCurrentListMapNoExtraKeys!3254 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880859 () Bool)

(declare-fun res!598505 () Bool)

(assert (=> b!880859 (=> (not res!598505) (not e!490181))))

(assert (=> b!880859 (= res!598505 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25124 _keys!868))))))

(declare-fun b!880860 () Bool)

(declare-fun e!490176 () Bool)

(assert (=> b!880860 (= e!490182 (not e!490176))))

(declare-fun res!598509 () Bool)

(assert (=> b!880860 (=> res!598509 e!490176)))

(assert (=> b!880860 (= res!598509 (not (validKeyInArray!0 (select (arr!24682 _keys!868) from!1053))))))

(declare-fun lt!398243 () ListLongMap!10495)

(declare-fun lt!398241 () ListLongMap!10495)

(assert (=> b!880860 (= lt!398243 lt!398241)))

(declare-fun lt!398245 () ListLongMap!10495)

(declare-fun +!2557 (ListLongMap!10495 tuple2!11736) ListLongMap!10495)

(assert (=> b!880860 (= lt!398241 (+!2557 lt!398245 (tuple2!11737 k0!854 v!557)))))

(assert (=> b!880860 (= lt!398243 (getCurrentListMapNoExtraKeys!3254 _keys!868 lt!398239 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880860 (= lt!398245 (getCurrentListMapNoExtraKeys!3254 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30025 0))(
  ( (Unit!30026) )
))
(declare-fun lt!398238 () Unit!30025)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!722 (array!51317 array!51319 (_ BitVec 32) (_ BitVec 32) V!28521 V!28521 (_ BitVec 32) (_ BitVec 64) V!28521 (_ BitVec 32) Int) Unit!30025)

(assert (=> b!880860 (= lt!398238 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!722 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880861 () Bool)

(declare-fun e!490175 () Bool)

(assert (=> b!880861 (= e!490175 e!490179)))

(declare-fun res!598513 () Bool)

(assert (=> b!880861 (=> res!598513 e!490179)))

(assert (=> b!880861 (= res!598513 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsge (size!25124 _keys!868) #b01111111111111111111111111111111)))))

(assert (=> b!880861 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17529)))

(declare-fun lt!398244 () Unit!30025)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51317 (_ BitVec 32) (_ BitVec 32)) Unit!30025)

(assert (=> b!880861 (= lt!398244 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!880862 () Bool)

(declare-fun tp_is_empty!17605 () Bool)

(assert (=> b!880862 (= e!490178 tp_is_empty!17605)))

(declare-fun res!598511 () Bool)

(assert (=> start!74716 (=> (not res!598511) (not e!490181))))

(assert (=> start!74716 (= res!598511 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25124 _keys!868))))))

(assert (=> start!74716 e!490181))

(assert (=> start!74716 tp_is_empty!17605))

(assert (=> start!74716 true))

(assert (=> start!74716 tp!53775))

(declare-fun array_inv!19488 (array!51317) Bool)

(assert (=> start!74716 (array_inv!19488 _keys!868)))

(declare-fun e!490183 () Bool)

(declare-fun array_inv!19489 (array!51319) Bool)

(assert (=> start!74716 (and (array_inv!19489 _values!688) e!490183)))

(declare-fun b!880858 () Bool)

(declare-fun res!598512 () Bool)

(assert (=> b!880858 (=> (not res!598512) (not e!490181))))

(assert (=> b!880858 (= res!598512 (and (= (select (arr!24682 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!880863 () Bool)

(declare-fun e!490180 () Bool)

(assert (=> b!880863 (= e!490183 (and e!490180 mapRes!28032))))

(declare-fun condMapEmpty!28032 () Bool)

(declare-fun mapDefault!28032 () ValueCell!8363)

(assert (=> b!880863 (= condMapEmpty!28032 (= (arr!24683 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8363)) mapDefault!28032)))))

(declare-fun b!880864 () Bool)

(assert (=> b!880864 (= e!490180 tp_is_empty!17605)))

(declare-fun b!880865 () Bool)

(assert (=> b!880865 (= e!490176 e!490175)))

(declare-fun res!598515 () Bool)

(assert (=> b!880865 (=> res!598515 e!490175)))

(assert (=> b!880865 (= res!598515 (not (= (select (arr!24682 _keys!868) from!1053) k0!854)))))

(declare-fun get!12994 (ValueCell!8363 V!28521) V!28521)

(declare-fun dynLambda!1246 (Int (_ BitVec 64)) V!28521)

(assert (=> b!880865 (= lt!398242 (+!2557 lt!398241 (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880866 () Bool)

(declare-fun res!598507 () Bool)

(assert (=> b!880866 (=> (not res!598507) (not e!490181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880866 (= res!598507 (validMask!0 mask!1196))))

(assert (= (and start!74716 res!598511) b!880866))

(assert (= (and b!880866 res!598507) b!880856))

(assert (= (and b!880856 res!598510) b!880854))

(assert (= (and b!880854 res!598508) b!880855))

(assert (= (and b!880855 res!598514) b!880859))

(assert (= (and b!880859 res!598505) b!880853))

(assert (= (and b!880853 res!598504) b!880858))

(assert (= (and b!880858 res!598512) b!880857))

(assert (= (and b!880857 res!598506) b!880860))

(assert (= (and b!880860 (not res!598509)) b!880865))

(assert (= (and b!880865 (not res!598515)) b!880861))

(assert (= (and b!880861 (not res!598513)) b!880852))

(assert (= (and b!880863 condMapEmpty!28032) mapIsEmpty!28032))

(assert (= (and b!880863 (not condMapEmpty!28032)) mapNonEmpty!28032))

(get-info :version)

(assert (= (and mapNonEmpty!28032 ((_ is ValueCellFull!8363) mapValue!28032)) b!880862))

(assert (= (and b!880863 ((_ is ValueCellFull!8363) mapDefault!28032)) b!880864))

(assert (= start!74716 b!880863))

(declare-fun b_lambda!12485 () Bool)

(assert (=> (not b_lambda!12485) (not b!880865)))

(declare-fun t!24685 () Bool)

(declare-fun tb!5011 () Bool)

(assert (=> (and start!74716 (= defaultEntry!696 defaultEntry!696) t!24685) tb!5011))

(declare-fun result!9657 () Bool)

(assert (=> tb!5011 (= result!9657 tp_is_empty!17605)))

(assert (=> b!880865 t!24685))

(declare-fun b_and!25333 () Bool)

(assert (= b_and!25331 (and (=> t!24685 result!9657) b_and!25333)))

(declare-fun m!820149 () Bool)

(assert (=> b!880853 m!820149))

(declare-fun m!820151 () Bool)

(assert (=> b!880852 m!820151))

(declare-fun m!820153 () Bool)

(assert (=> b!880860 m!820153))

(declare-fun m!820155 () Bool)

(assert (=> b!880860 m!820155))

(declare-fun m!820157 () Bool)

(assert (=> b!880860 m!820157))

(declare-fun m!820159 () Bool)

(assert (=> b!880860 m!820159))

(assert (=> b!880860 m!820157))

(declare-fun m!820161 () Bool)

(assert (=> b!880860 m!820161))

(declare-fun m!820163 () Bool)

(assert (=> b!880860 m!820163))

(declare-fun m!820165 () Bool)

(assert (=> b!880858 m!820165))

(declare-fun m!820167 () Bool)

(assert (=> b!880857 m!820167))

(declare-fun m!820169 () Bool)

(assert (=> b!880857 m!820169))

(declare-fun m!820171 () Bool)

(assert (=> b!880857 m!820171))

(declare-fun m!820173 () Bool)

(assert (=> b!880854 m!820173))

(declare-fun m!820175 () Bool)

(assert (=> b!880865 m!820175))

(declare-fun m!820177 () Bool)

(assert (=> b!880865 m!820177))

(declare-fun m!820179 () Bool)

(assert (=> b!880865 m!820179))

(declare-fun m!820181 () Bool)

(assert (=> b!880865 m!820181))

(assert (=> b!880865 m!820177))

(assert (=> b!880865 m!820157))

(assert (=> b!880865 m!820179))

(declare-fun m!820183 () Bool)

(assert (=> b!880861 m!820183))

(declare-fun m!820185 () Bool)

(assert (=> b!880861 m!820185))

(declare-fun m!820187 () Bool)

(assert (=> b!880866 m!820187))

(declare-fun m!820189 () Bool)

(assert (=> start!74716 m!820189))

(declare-fun m!820191 () Bool)

(assert (=> start!74716 m!820191))

(declare-fun m!820193 () Bool)

(assert (=> b!880855 m!820193))

(declare-fun m!820195 () Bool)

(assert (=> mapNonEmpty!28032 m!820195))

(check-sat (not start!74716) (not b!880857) b_and!25333 (not b_lambda!12485) tp_is_empty!17605 (not b!880865) (not b!880860) (not b!880855) (not b!880866) (not b!880861) (not mapNonEmpty!28032) (not b!880852) (not b_next!15361) (not b!880853) (not b!880854))
(check-sat b_and!25333 (not b_next!15361))
(get-model)

(declare-fun b_lambda!12491 () Bool)

(assert (= b_lambda!12485 (or (and start!74716 b_free!15361) b_lambda!12491)))

(check-sat (not start!74716) (not b!880857) tp_is_empty!17605 (not b!880865) (not b!880860) (not b!880855) (not b!880866) (not b!880861) (not mapNonEmpty!28032) (not b!880852) (not b_next!15361) b_and!25333 (not b_lambda!12491) (not b!880853) (not b!880854))
(check-sat b_and!25333 (not b_next!15361))
(get-model)

(declare-fun b!880987 () Bool)

(declare-fun e!490252 () Bool)

(declare-fun e!490258 () Bool)

(assert (=> b!880987 (= e!490252 e!490258)))

(assert (=> b!880987 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25124 _keys!868)))))

(declare-fun lt!398314 () ListLongMap!10495)

(declare-fun res!598599 () Bool)

(declare-fun contains!4234 (ListLongMap!10495 (_ BitVec 64)) Bool)

(assert (=> b!880987 (= res!598599 (contains!4234 lt!398314 (select (arr!24682 _keys!868) from!1053)))))

(assert (=> b!880987 (=> (not res!598599) (not e!490258))))

(declare-fun b!880989 () Bool)

(declare-fun res!598597 () Bool)

(declare-fun e!490256 () Bool)

(assert (=> b!880989 (=> (not res!598597) (not e!490256))))

(assert (=> b!880989 (= res!598597 (not (contains!4234 lt!398314 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880990 () Bool)

(declare-fun e!490254 () ListLongMap!10495)

(assert (=> b!880990 (= e!490254 (ListLongMap!10496 Nil!17530))))

(declare-fun b!880991 () Bool)

(declare-fun e!490255 () Bool)

(assert (=> b!880991 (= e!490252 e!490255)))

(declare-fun c!92841 () Bool)

(assert (=> b!880991 (= c!92841 (bvslt from!1053 (size!25124 _keys!868)))))

(declare-fun b!880992 () Bool)

(assert (=> b!880992 (= e!490256 e!490252)))

(declare-fun c!92839 () Bool)

(declare-fun e!490257 () Bool)

(assert (=> b!880992 (= c!92839 e!490257)))

(declare-fun res!598596 () Bool)

(assert (=> b!880992 (=> (not res!598596) (not e!490257))))

(assert (=> b!880992 (= res!598596 (bvslt from!1053 (size!25124 _keys!868)))))

(declare-fun b!880993 () Bool)

(declare-fun lt!398313 () Unit!30025)

(declare-fun lt!398308 () Unit!30025)

(assert (=> b!880993 (= lt!398313 lt!398308)))

(declare-fun lt!398312 () (_ BitVec 64))

(declare-fun lt!398311 () (_ BitVec 64))

(declare-fun lt!398310 () V!28521)

(declare-fun lt!398309 () ListLongMap!10495)

(assert (=> b!880993 (not (contains!4234 (+!2557 lt!398309 (tuple2!11737 lt!398312 lt!398310)) lt!398311))))

(declare-fun addStillNotContains!207 (ListLongMap!10495 (_ BitVec 64) V!28521 (_ BitVec 64)) Unit!30025)

(assert (=> b!880993 (= lt!398308 (addStillNotContains!207 lt!398309 lt!398312 lt!398310 lt!398311))))

(assert (=> b!880993 (= lt!398311 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880993 (= lt!398310 (get!12994 (select (arr!24683 lt!398239) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880993 (= lt!398312 (select (arr!24682 _keys!868) from!1053))))

(declare-fun call!38886 () ListLongMap!10495)

(assert (=> b!880993 (= lt!398309 call!38886)))

(declare-fun e!490253 () ListLongMap!10495)

(assert (=> b!880993 (= e!490253 (+!2557 call!38886 (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 lt!398239) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880994 () Bool)

(assert (=> b!880994 (= e!490254 e!490253)))

(declare-fun c!92840 () Bool)

(assert (=> b!880994 (= c!92840 (validKeyInArray!0 (select (arr!24682 _keys!868) from!1053)))))

(declare-fun b!880995 () Bool)

(declare-fun isEmpty!673 (ListLongMap!10495) Bool)

(assert (=> b!880995 (= e!490255 (isEmpty!673 lt!398314))))

(declare-fun bm!38883 () Bool)

(assert (=> bm!38883 (= call!38886 (getCurrentListMapNoExtraKeys!3254 _keys!868 lt!398239 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!880996 () Bool)

(assert (=> b!880996 (= e!490255 (= lt!398314 (getCurrentListMapNoExtraKeys!3254 _keys!868 lt!398239 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!880997 () Bool)

(assert (=> b!880997 (= e!490257 (validKeyInArray!0 (select (arr!24682 _keys!868) from!1053)))))

(assert (=> b!880997 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!880998 () Bool)

(assert (=> b!880998 (= e!490253 call!38886)))

(declare-fun b!880988 () Bool)

(assert (=> b!880988 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25124 _keys!868)))))

(assert (=> b!880988 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25125 lt!398239)))))

(declare-fun apply!381 (ListLongMap!10495 (_ BitVec 64)) V!28521)

(assert (=> b!880988 (= e!490258 (= (apply!381 lt!398314 (select (arr!24682 _keys!868) from!1053)) (get!12994 (select (arr!24683 lt!398239) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!108815 () Bool)

(assert (=> d!108815 e!490256))

(declare-fun res!598598 () Bool)

(assert (=> d!108815 (=> (not res!598598) (not e!490256))))

(assert (=> d!108815 (= res!598598 (not (contains!4234 lt!398314 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108815 (= lt!398314 e!490254)))

(declare-fun c!92842 () Bool)

(assert (=> d!108815 (= c!92842 (bvsge from!1053 (size!25124 _keys!868)))))

(assert (=> d!108815 (validMask!0 mask!1196)))

(assert (=> d!108815 (= (getCurrentListMapNoExtraKeys!3254 _keys!868 lt!398239 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398314)))

(assert (= (and d!108815 c!92842) b!880990))

(assert (= (and d!108815 (not c!92842)) b!880994))

(assert (= (and b!880994 c!92840) b!880993))

(assert (= (and b!880994 (not c!92840)) b!880998))

(assert (= (or b!880993 b!880998) bm!38883))

(assert (= (and d!108815 res!598598) b!880989))

(assert (= (and b!880989 res!598597) b!880992))

(assert (= (and b!880992 res!598596) b!880997))

(assert (= (and b!880992 c!92839) b!880987))

(assert (= (and b!880992 (not c!92839)) b!880991))

(assert (= (and b!880987 res!598599) b!880988))

(assert (= (and b!880991 c!92841) b!880996))

(assert (= (and b!880991 (not c!92841)) b!880995))

(declare-fun b_lambda!12493 () Bool)

(assert (=> (not b_lambda!12493) (not b!880993)))

(assert (=> b!880993 t!24685))

(declare-fun b_and!25343 () Bool)

(assert (= b_and!25333 (and (=> t!24685 result!9657) b_and!25343)))

(declare-fun b_lambda!12495 () Bool)

(assert (=> (not b_lambda!12495) (not b!880988)))

(assert (=> b!880988 t!24685))

(declare-fun b_and!25345 () Bool)

(assert (= b_and!25343 (and (=> t!24685 result!9657) b_and!25345)))

(assert (=> b!880987 m!820157))

(assert (=> b!880987 m!820157))

(declare-fun m!820293 () Bool)

(assert (=> b!880987 m!820293))

(assert (=> b!880988 m!820157))

(assert (=> b!880988 m!820157))

(declare-fun m!820295 () Bool)

(assert (=> b!880988 m!820295))

(declare-fun m!820297 () Bool)

(assert (=> b!880988 m!820297))

(assert (=> b!880988 m!820179))

(assert (=> b!880988 m!820297))

(assert (=> b!880988 m!820179))

(declare-fun m!820299 () Bool)

(assert (=> b!880988 m!820299))

(assert (=> b!880997 m!820157))

(assert (=> b!880997 m!820157))

(assert (=> b!880997 m!820159))

(declare-fun m!820301 () Bool)

(assert (=> b!880996 m!820301))

(declare-fun m!820303 () Bool)

(assert (=> b!880989 m!820303))

(assert (=> b!880993 m!820297))

(assert (=> b!880993 m!820179))

(declare-fun m!820305 () Bool)

(assert (=> b!880993 m!820305))

(assert (=> b!880993 m!820305))

(declare-fun m!820307 () Bool)

(assert (=> b!880993 m!820307))

(declare-fun m!820309 () Bool)

(assert (=> b!880993 m!820309))

(assert (=> b!880993 m!820157))

(assert (=> b!880993 m!820297))

(assert (=> b!880993 m!820179))

(assert (=> b!880993 m!820299))

(declare-fun m!820311 () Bool)

(assert (=> b!880993 m!820311))

(declare-fun m!820313 () Bool)

(assert (=> d!108815 m!820313))

(assert (=> d!108815 m!820187))

(assert (=> b!880994 m!820157))

(assert (=> b!880994 m!820157))

(assert (=> b!880994 m!820159))

(assert (=> bm!38883 m!820301))

(declare-fun m!820315 () Bool)

(assert (=> b!880995 m!820315))

(assert (=> b!880857 d!108815))

(declare-fun b!880999 () Bool)

(declare-fun e!490259 () Bool)

(declare-fun e!490265 () Bool)

(assert (=> b!880999 (= e!490259 e!490265)))

(assert (=> b!880999 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25124 _keys!868)))))

(declare-fun lt!398321 () ListLongMap!10495)

(declare-fun res!598603 () Bool)

(assert (=> b!880999 (= res!598603 (contains!4234 lt!398321 (select (arr!24682 _keys!868) from!1053)))))

(assert (=> b!880999 (=> (not res!598603) (not e!490265))))

(declare-fun b!881001 () Bool)

(declare-fun res!598601 () Bool)

(declare-fun e!490263 () Bool)

(assert (=> b!881001 (=> (not res!598601) (not e!490263))))

(assert (=> b!881001 (= res!598601 (not (contains!4234 lt!398321 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881002 () Bool)

(declare-fun e!490261 () ListLongMap!10495)

(assert (=> b!881002 (= e!490261 (ListLongMap!10496 Nil!17530))))

(declare-fun b!881003 () Bool)

(declare-fun e!490262 () Bool)

(assert (=> b!881003 (= e!490259 e!490262)))

(declare-fun c!92845 () Bool)

(assert (=> b!881003 (= c!92845 (bvslt from!1053 (size!25124 _keys!868)))))

(declare-fun b!881004 () Bool)

(assert (=> b!881004 (= e!490263 e!490259)))

(declare-fun c!92843 () Bool)

(declare-fun e!490264 () Bool)

(assert (=> b!881004 (= c!92843 e!490264)))

(declare-fun res!598600 () Bool)

(assert (=> b!881004 (=> (not res!598600) (not e!490264))))

(assert (=> b!881004 (= res!598600 (bvslt from!1053 (size!25124 _keys!868)))))

(declare-fun b!881005 () Bool)

(declare-fun lt!398320 () Unit!30025)

(declare-fun lt!398315 () Unit!30025)

(assert (=> b!881005 (= lt!398320 lt!398315)))

(declare-fun lt!398318 () (_ BitVec 64))

(declare-fun lt!398319 () (_ BitVec 64))

(declare-fun lt!398317 () V!28521)

(declare-fun lt!398316 () ListLongMap!10495)

(assert (=> b!881005 (not (contains!4234 (+!2557 lt!398316 (tuple2!11737 lt!398319 lt!398317)) lt!398318))))

(assert (=> b!881005 (= lt!398315 (addStillNotContains!207 lt!398316 lt!398319 lt!398317 lt!398318))))

(assert (=> b!881005 (= lt!398318 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881005 (= lt!398317 (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881005 (= lt!398319 (select (arr!24682 _keys!868) from!1053))))

(declare-fun call!38887 () ListLongMap!10495)

(assert (=> b!881005 (= lt!398316 call!38887)))

(declare-fun e!490260 () ListLongMap!10495)

(assert (=> b!881005 (= e!490260 (+!2557 call!38887 (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881006 () Bool)

(assert (=> b!881006 (= e!490261 e!490260)))

(declare-fun c!92844 () Bool)

(assert (=> b!881006 (= c!92844 (validKeyInArray!0 (select (arr!24682 _keys!868) from!1053)))))

(declare-fun b!881007 () Bool)

(assert (=> b!881007 (= e!490262 (isEmpty!673 lt!398321))))

(declare-fun bm!38884 () Bool)

(assert (=> bm!38884 (= call!38887 (getCurrentListMapNoExtraKeys!3254 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!881008 () Bool)

(assert (=> b!881008 (= e!490262 (= lt!398321 (getCurrentListMapNoExtraKeys!3254 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881009 () Bool)

(assert (=> b!881009 (= e!490264 (validKeyInArray!0 (select (arr!24682 _keys!868) from!1053)))))

(assert (=> b!881009 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!881010 () Bool)

(assert (=> b!881010 (= e!490260 call!38887)))

(declare-fun b!881000 () Bool)

(assert (=> b!881000 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25124 _keys!868)))))

(assert (=> b!881000 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25125 _values!688)))))

(assert (=> b!881000 (= e!490265 (= (apply!381 lt!398321 (select (arr!24682 _keys!868) from!1053)) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!108817 () Bool)

(assert (=> d!108817 e!490263))

(declare-fun res!598602 () Bool)

(assert (=> d!108817 (=> (not res!598602) (not e!490263))))

(assert (=> d!108817 (= res!598602 (not (contains!4234 lt!398321 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108817 (= lt!398321 e!490261)))

(declare-fun c!92846 () Bool)

(assert (=> d!108817 (= c!92846 (bvsge from!1053 (size!25124 _keys!868)))))

(assert (=> d!108817 (validMask!0 mask!1196)))

(assert (=> d!108817 (= (getCurrentListMapNoExtraKeys!3254 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398321)))

(assert (= (and d!108817 c!92846) b!881002))

(assert (= (and d!108817 (not c!92846)) b!881006))

(assert (= (and b!881006 c!92844) b!881005))

(assert (= (and b!881006 (not c!92844)) b!881010))

(assert (= (or b!881005 b!881010) bm!38884))

(assert (= (and d!108817 res!598602) b!881001))

(assert (= (and b!881001 res!598601) b!881004))

(assert (= (and b!881004 res!598600) b!881009))

(assert (= (and b!881004 c!92843) b!880999))

(assert (= (and b!881004 (not c!92843)) b!881003))

(assert (= (and b!880999 res!598603) b!881000))

(assert (= (and b!881003 c!92845) b!881008))

(assert (= (and b!881003 (not c!92845)) b!881007))

(declare-fun b_lambda!12497 () Bool)

(assert (=> (not b_lambda!12497) (not b!881005)))

(assert (=> b!881005 t!24685))

(declare-fun b_and!25347 () Bool)

(assert (= b_and!25345 (and (=> t!24685 result!9657) b_and!25347)))

(declare-fun b_lambda!12499 () Bool)

(assert (=> (not b_lambda!12499) (not b!881000)))

(assert (=> b!881000 t!24685))

(declare-fun b_and!25349 () Bool)

(assert (= b_and!25347 (and (=> t!24685 result!9657) b_and!25349)))

(assert (=> b!880999 m!820157))

(assert (=> b!880999 m!820157))

(declare-fun m!820317 () Bool)

(assert (=> b!880999 m!820317))

(assert (=> b!881000 m!820157))

(assert (=> b!881000 m!820157))

(declare-fun m!820319 () Bool)

(assert (=> b!881000 m!820319))

(assert (=> b!881000 m!820177))

(assert (=> b!881000 m!820179))

(assert (=> b!881000 m!820177))

(assert (=> b!881000 m!820179))

(assert (=> b!881000 m!820181))

(assert (=> b!881009 m!820157))

(assert (=> b!881009 m!820157))

(assert (=> b!881009 m!820159))

(declare-fun m!820321 () Bool)

(assert (=> b!881008 m!820321))

(declare-fun m!820323 () Bool)

(assert (=> b!881001 m!820323))

(assert (=> b!881005 m!820177))

(assert (=> b!881005 m!820179))

(declare-fun m!820325 () Bool)

(assert (=> b!881005 m!820325))

(assert (=> b!881005 m!820325))

(declare-fun m!820327 () Bool)

(assert (=> b!881005 m!820327))

(declare-fun m!820329 () Bool)

(assert (=> b!881005 m!820329))

(assert (=> b!881005 m!820157))

(assert (=> b!881005 m!820177))

(assert (=> b!881005 m!820179))

(assert (=> b!881005 m!820181))

(declare-fun m!820331 () Bool)

(assert (=> b!881005 m!820331))

(declare-fun m!820333 () Bool)

(assert (=> d!108817 m!820333))

(assert (=> d!108817 m!820187))

(assert (=> b!881006 m!820157))

(assert (=> b!881006 m!820157))

(assert (=> b!881006 m!820159))

(assert (=> bm!38884 m!820321))

(declare-fun m!820335 () Bool)

(assert (=> b!881007 m!820335))

(assert (=> b!880857 d!108817))

(declare-fun d!108819 () Bool)

(assert (=> d!108819 (= (array_inv!19488 _keys!868) (bvsge (size!25124 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74716 d!108819))

(declare-fun d!108821 () Bool)

(assert (=> d!108821 (= (array_inv!19489 _values!688) (bvsge (size!25125 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74716 d!108821))

(declare-fun d!108823 () Bool)

(assert (=> d!108823 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!880853 d!108823))

(declare-fun d!108825 () Bool)

(declare-fun e!490268 () Bool)

(assert (=> d!108825 e!490268))

(declare-fun res!598609 () Bool)

(assert (=> d!108825 (=> (not res!598609) (not e!490268))))

(declare-fun lt!398331 () ListLongMap!10495)

(assert (=> d!108825 (= res!598609 (contains!4234 lt!398331 (_1!5879 (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!398332 () List!17533)

(assert (=> d!108825 (= lt!398331 (ListLongMap!10496 lt!398332))))

(declare-fun lt!398330 () Unit!30025)

(declare-fun lt!398333 () Unit!30025)

(assert (=> d!108825 (= lt!398330 lt!398333)))

(declare-datatypes ((Option!427 0))(
  ( (Some!426 (v!11302 V!28521)) (None!425) )
))
(declare-fun getValueByKey!421 (List!17533 (_ BitVec 64)) Option!427)

(assert (=> d!108825 (= (getValueByKey!421 lt!398332 (_1!5879 (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!426 (_2!5879 (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!238 (List!17533 (_ BitVec 64) V!28521) Unit!30025)

(assert (=> d!108825 (= lt!398333 (lemmaContainsTupThenGetReturnValue!238 lt!398332 (_1!5879 (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5879 (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!277 (List!17533 (_ BitVec 64) V!28521) List!17533)

(assert (=> d!108825 (= lt!398332 (insertStrictlySorted!277 (toList!5263 lt!398241) (_1!5879 (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5879 (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108825 (= (+!2557 lt!398241 (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!398331)))

(declare-fun b!881015 () Bool)

(declare-fun res!598608 () Bool)

(assert (=> b!881015 (=> (not res!598608) (not e!490268))))

(assert (=> b!881015 (= res!598608 (= (getValueByKey!421 (toList!5263 lt!398331) (_1!5879 (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!426 (_2!5879 (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!881016 () Bool)

(declare-fun contains!4235 (List!17533 tuple2!11736) Bool)

(assert (=> b!881016 (= e!490268 (contains!4235 (toList!5263 lt!398331) (tuple2!11737 (select (arr!24682 _keys!868) from!1053) (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108825 res!598609) b!881015))

(assert (= (and b!881015 res!598608) b!881016))

(declare-fun m!820337 () Bool)

(assert (=> d!108825 m!820337))

(declare-fun m!820339 () Bool)

(assert (=> d!108825 m!820339))

(declare-fun m!820341 () Bool)

(assert (=> d!108825 m!820341))

(declare-fun m!820343 () Bool)

(assert (=> d!108825 m!820343))

(declare-fun m!820345 () Bool)

(assert (=> b!881015 m!820345))

(declare-fun m!820347 () Bool)

(assert (=> b!881016 m!820347))

(assert (=> b!880865 d!108825))

(declare-fun d!108827 () Bool)

(declare-fun c!92849 () Bool)

(assert (=> d!108827 (= c!92849 ((_ is ValueCellFull!8363) (select (arr!24683 _values!688) from!1053)))))

(declare-fun e!490271 () V!28521)

(assert (=> d!108827 (= (get!12994 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!490271)))

(declare-fun b!881021 () Bool)

(declare-fun get!12996 (ValueCell!8363 V!28521) V!28521)

(assert (=> b!881021 (= e!490271 (get!12996 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881022 () Bool)

(declare-fun get!12997 (ValueCell!8363 V!28521) V!28521)

(assert (=> b!881022 (= e!490271 (get!12997 (select (arr!24683 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108827 c!92849) b!881021))

(assert (= (and d!108827 (not c!92849)) b!881022))

(assert (=> b!881021 m!820177))

(assert (=> b!881021 m!820179))

(declare-fun m!820349 () Bool)

(assert (=> b!881021 m!820349))

(assert (=> b!881022 m!820177))

(assert (=> b!881022 m!820179))

(declare-fun m!820351 () Bool)

(assert (=> b!881022 m!820351))

(assert (=> b!880865 d!108827))

(declare-fun b!881023 () Bool)

(declare-fun e!490272 () Bool)

(declare-fun e!490278 () Bool)

(assert (=> b!881023 (= e!490272 e!490278)))

(assert (=> b!881023 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25124 _keys!868)))))

(declare-fun lt!398340 () ListLongMap!10495)

(declare-fun res!598613 () Bool)

(assert (=> b!881023 (= res!598613 (contains!4234 lt!398340 (select (arr!24682 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881023 (=> (not res!598613) (not e!490278))))

(declare-fun b!881025 () Bool)

(declare-fun res!598611 () Bool)

(declare-fun e!490276 () Bool)

(assert (=> b!881025 (=> (not res!598611) (not e!490276))))

(assert (=> b!881025 (= res!598611 (not (contains!4234 lt!398340 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881026 () Bool)

(declare-fun e!490274 () ListLongMap!10495)

(assert (=> b!881026 (= e!490274 (ListLongMap!10496 Nil!17530))))

(declare-fun b!881027 () Bool)

(declare-fun e!490275 () Bool)

(assert (=> b!881027 (= e!490272 e!490275)))

(declare-fun c!92852 () Bool)

(assert (=> b!881027 (= c!92852 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25124 _keys!868)))))

(declare-fun b!881028 () Bool)

(assert (=> b!881028 (= e!490276 e!490272)))

(declare-fun c!92850 () Bool)

(declare-fun e!490277 () Bool)

(assert (=> b!881028 (= c!92850 e!490277)))

(declare-fun res!598610 () Bool)

(assert (=> b!881028 (=> (not res!598610) (not e!490277))))

(assert (=> b!881028 (= res!598610 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25124 _keys!868)))))

(declare-fun b!881029 () Bool)

(declare-fun lt!398339 () Unit!30025)

(declare-fun lt!398334 () Unit!30025)

(assert (=> b!881029 (= lt!398339 lt!398334)))

(declare-fun lt!398336 () V!28521)

(declare-fun lt!398338 () (_ BitVec 64))

(declare-fun lt!398335 () ListLongMap!10495)

(declare-fun lt!398337 () (_ BitVec 64))

(assert (=> b!881029 (not (contains!4234 (+!2557 lt!398335 (tuple2!11737 lt!398338 lt!398336)) lt!398337))))

(assert (=> b!881029 (= lt!398334 (addStillNotContains!207 lt!398335 lt!398338 lt!398336 lt!398337))))

(assert (=> b!881029 (= lt!398337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881029 (= lt!398336 (get!12994 (select (arr!24683 lt!398239) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881029 (= lt!398338 (select (arr!24682 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38888 () ListLongMap!10495)

(assert (=> b!881029 (= lt!398335 call!38888)))

(declare-fun e!490273 () ListLongMap!10495)

(assert (=> b!881029 (= e!490273 (+!2557 call!38888 (tuple2!11737 (select (arr!24682 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12994 (select (arr!24683 lt!398239) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881030 () Bool)

(assert (=> b!881030 (= e!490274 e!490273)))

(declare-fun c!92851 () Bool)

(assert (=> b!881030 (= c!92851 (validKeyInArray!0 (select (arr!24682 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!881031 () Bool)

(assert (=> b!881031 (= e!490275 (isEmpty!673 lt!398340))))

(declare-fun bm!38885 () Bool)

(assert (=> bm!38885 (= call!38888 (getCurrentListMapNoExtraKeys!3254 _keys!868 lt!398239 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!881032 () Bool)

(assert (=> b!881032 (= e!490275 (= lt!398340 (getCurrentListMapNoExtraKeys!3254 _keys!868 lt!398239 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881033 () Bool)

(assert (=> b!881033 (= e!490277 (validKeyInArray!0 (select (arr!24682 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881033 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!881034 () Bool)

(assert (=> b!881034 (= e!490273 call!38888)))

(declare-fun b!881024 () Bool)

(assert (=> b!881024 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25124 _keys!868)))))

(assert (=> b!881024 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25125 lt!398239)))))

(assert (=> b!881024 (= e!490278 (= (apply!381 lt!398340 (select (arr!24682 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12994 (select (arr!24683 lt!398239) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!108829 () Bool)

(assert (=> d!108829 e!490276))

(declare-fun res!598612 () Bool)

(assert (=> d!108829 (=> (not res!598612) (not e!490276))))

(assert (=> d!108829 (= res!598612 (not (contains!4234 lt!398340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108829 (= lt!398340 e!490274)))

(declare-fun c!92853 () Bool)

(assert (=> d!108829 (= c!92853 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25124 _keys!868)))))

(assert (=> d!108829 (validMask!0 mask!1196)))

(assert (=> d!108829 (= (getCurrentListMapNoExtraKeys!3254 _keys!868 lt!398239 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398340)))

(assert (= (and d!108829 c!92853) b!881026))

(assert (= (and d!108829 (not c!92853)) b!881030))

(assert (= (and b!881030 c!92851) b!881029))

(assert (= (and b!881030 (not c!92851)) b!881034))

(assert (= (or b!881029 b!881034) bm!38885))

(assert (= (and d!108829 res!598612) b!881025))

(assert (= (and b!881025 res!598611) b!881028))

(assert (= (and b!881028 res!598610) b!881033))

(assert (= (and b!881028 c!92850) b!881023))

(assert (= (and b!881028 (not c!92850)) b!881027))

(assert (= (and b!881023 res!598613) b!881024))

(assert (= (and b!881027 c!92852) b!881032))

(assert (= (and b!881027 (not c!92852)) b!881031))

(declare-fun b_lambda!12501 () Bool)

(assert (=> (not b_lambda!12501) (not b!881029)))

(assert (=> b!881029 t!24685))

(declare-fun b_and!25351 () Bool)

(assert (= b_and!25349 (and (=> t!24685 result!9657) b_and!25351)))

(declare-fun b_lambda!12503 () Bool)

(assert (=> (not b_lambda!12503) (not b!881024)))

(assert (=> b!881024 t!24685))

(declare-fun b_and!25353 () Bool)

(assert (= b_and!25351 (and (=> t!24685 result!9657) b_and!25353)))

(declare-fun m!820353 () Bool)

(assert (=> b!881023 m!820353))

(assert (=> b!881023 m!820353))

(declare-fun m!820355 () Bool)

(assert (=> b!881023 m!820355))

(assert (=> b!881024 m!820353))

(assert (=> b!881024 m!820353))

(declare-fun m!820357 () Bool)

(assert (=> b!881024 m!820357))

(declare-fun m!820359 () Bool)

(assert (=> b!881024 m!820359))

(assert (=> b!881024 m!820179))

(assert (=> b!881024 m!820359))

(assert (=> b!881024 m!820179))

(declare-fun m!820361 () Bool)

(assert (=> b!881024 m!820361))

(assert (=> b!881033 m!820353))

(assert (=> b!881033 m!820353))

(declare-fun m!820363 () Bool)

(assert (=> b!881033 m!820363))

(declare-fun m!820365 () Bool)

(assert (=> b!881032 m!820365))

(declare-fun m!820367 () Bool)

(assert (=> b!881025 m!820367))

(assert (=> b!881029 m!820359))

(assert (=> b!881029 m!820179))

(declare-fun m!820369 () Bool)

(assert (=> b!881029 m!820369))

(assert (=> b!881029 m!820369))

(declare-fun m!820371 () Bool)

(assert (=> b!881029 m!820371))

(declare-fun m!820373 () Bool)

(assert (=> b!881029 m!820373))

(assert (=> b!881029 m!820353))

(assert (=> b!881029 m!820359))

(assert (=> b!881029 m!820179))

(assert (=> b!881029 m!820361))

(declare-fun m!820375 () Bool)

(assert (=> b!881029 m!820375))

(declare-fun m!820377 () Bool)

(assert (=> d!108829 m!820377))

(assert (=> d!108829 m!820187))

(assert (=> b!881030 m!820353))

(assert (=> b!881030 m!820353))

(assert (=> b!881030 m!820363))

(assert (=> bm!38885 m!820365))

(declare-fun m!820379 () Bool)

(assert (=> b!881031 m!820379))

(assert (=> b!880860 d!108829))

(declare-fun b!881035 () Bool)

(declare-fun e!490279 () Bool)

(declare-fun e!490285 () Bool)

(assert (=> b!881035 (= e!490279 e!490285)))

(assert (=> b!881035 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25124 _keys!868)))))

(declare-fun lt!398347 () ListLongMap!10495)

(declare-fun res!598617 () Bool)

(assert (=> b!881035 (= res!598617 (contains!4234 lt!398347 (select (arr!24682 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881035 (=> (not res!598617) (not e!490285))))

(declare-fun b!881037 () Bool)

(declare-fun res!598615 () Bool)

(declare-fun e!490283 () Bool)

(assert (=> b!881037 (=> (not res!598615) (not e!490283))))

(assert (=> b!881037 (= res!598615 (not (contains!4234 lt!398347 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881038 () Bool)

(declare-fun e!490281 () ListLongMap!10495)

(assert (=> b!881038 (= e!490281 (ListLongMap!10496 Nil!17530))))

(declare-fun b!881039 () Bool)

(declare-fun e!490282 () Bool)

(assert (=> b!881039 (= e!490279 e!490282)))

(declare-fun c!92856 () Bool)

(assert (=> b!881039 (= c!92856 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25124 _keys!868)))))

(declare-fun b!881040 () Bool)

(assert (=> b!881040 (= e!490283 e!490279)))

(declare-fun c!92854 () Bool)

(declare-fun e!490284 () Bool)

(assert (=> b!881040 (= c!92854 e!490284)))

(declare-fun res!598614 () Bool)

(assert (=> b!881040 (=> (not res!598614) (not e!490284))))

(assert (=> b!881040 (= res!598614 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25124 _keys!868)))))

(declare-fun b!881041 () Bool)

(declare-fun lt!398346 () Unit!30025)

(declare-fun lt!398341 () Unit!30025)

(assert (=> b!881041 (= lt!398346 lt!398341)))

(declare-fun lt!398345 () (_ BitVec 64))

(declare-fun lt!398343 () V!28521)

(declare-fun lt!398342 () ListLongMap!10495)

(declare-fun lt!398344 () (_ BitVec 64))

(assert (=> b!881041 (not (contains!4234 (+!2557 lt!398342 (tuple2!11737 lt!398345 lt!398343)) lt!398344))))

(assert (=> b!881041 (= lt!398341 (addStillNotContains!207 lt!398342 lt!398345 lt!398343 lt!398344))))

(assert (=> b!881041 (= lt!398344 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881041 (= lt!398343 (get!12994 (select (arr!24683 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881041 (= lt!398345 (select (arr!24682 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38889 () ListLongMap!10495)

(assert (=> b!881041 (= lt!398342 call!38889)))

(declare-fun e!490280 () ListLongMap!10495)

(assert (=> b!881041 (= e!490280 (+!2557 call!38889 (tuple2!11737 (select (arr!24682 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12994 (select (arr!24683 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881042 () Bool)

(assert (=> b!881042 (= e!490281 e!490280)))

(declare-fun c!92855 () Bool)

(assert (=> b!881042 (= c!92855 (validKeyInArray!0 (select (arr!24682 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!881043 () Bool)

(assert (=> b!881043 (= e!490282 (isEmpty!673 lt!398347))))

(declare-fun bm!38886 () Bool)

(assert (=> bm!38886 (= call!38889 (getCurrentListMapNoExtraKeys!3254 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!881044 () Bool)

(assert (=> b!881044 (= e!490282 (= lt!398347 (getCurrentListMapNoExtraKeys!3254 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881045 () Bool)

(assert (=> b!881045 (= e!490284 (validKeyInArray!0 (select (arr!24682 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881045 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!881046 () Bool)

(assert (=> b!881046 (= e!490280 call!38889)))

(declare-fun b!881036 () Bool)

(assert (=> b!881036 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25124 _keys!868)))))

(assert (=> b!881036 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25125 _values!688)))))

(assert (=> b!881036 (= e!490285 (= (apply!381 lt!398347 (select (arr!24682 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12994 (select (arr!24683 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!108831 () Bool)

(assert (=> d!108831 e!490283))

(declare-fun res!598616 () Bool)

(assert (=> d!108831 (=> (not res!598616) (not e!490283))))

(assert (=> d!108831 (= res!598616 (not (contains!4234 lt!398347 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108831 (= lt!398347 e!490281)))

(declare-fun c!92857 () Bool)

(assert (=> d!108831 (= c!92857 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25124 _keys!868)))))

(assert (=> d!108831 (validMask!0 mask!1196)))

(assert (=> d!108831 (= (getCurrentListMapNoExtraKeys!3254 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398347)))

(assert (= (and d!108831 c!92857) b!881038))

(assert (= (and d!108831 (not c!92857)) b!881042))

(assert (= (and b!881042 c!92855) b!881041))

(assert (= (and b!881042 (not c!92855)) b!881046))

(assert (= (or b!881041 b!881046) bm!38886))

(assert (= (and d!108831 res!598616) b!881037))

(assert (= (and b!881037 res!598615) b!881040))

(assert (= (and b!881040 res!598614) b!881045))

(assert (= (and b!881040 c!92854) b!881035))

(assert (= (and b!881040 (not c!92854)) b!881039))

(assert (= (and b!881035 res!598617) b!881036))

(assert (= (and b!881039 c!92856) b!881044))

(assert (= (and b!881039 (not c!92856)) b!881043))

(declare-fun b_lambda!12505 () Bool)

(assert (=> (not b_lambda!12505) (not b!881041)))

(assert (=> b!881041 t!24685))

(declare-fun b_and!25355 () Bool)

(assert (= b_and!25353 (and (=> t!24685 result!9657) b_and!25355)))

(declare-fun b_lambda!12507 () Bool)

(assert (=> (not b_lambda!12507) (not b!881036)))

(assert (=> b!881036 t!24685))

(declare-fun b_and!25357 () Bool)

(assert (= b_and!25355 (and (=> t!24685 result!9657) b_and!25357)))

(assert (=> b!881035 m!820353))

(assert (=> b!881035 m!820353))

(declare-fun m!820381 () Bool)

(assert (=> b!881035 m!820381))

(assert (=> b!881036 m!820353))

(assert (=> b!881036 m!820353))

(declare-fun m!820383 () Bool)

(assert (=> b!881036 m!820383))

(declare-fun m!820385 () Bool)

(assert (=> b!881036 m!820385))

(assert (=> b!881036 m!820179))

(assert (=> b!881036 m!820385))

(assert (=> b!881036 m!820179))

(declare-fun m!820387 () Bool)

(assert (=> b!881036 m!820387))

(assert (=> b!881045 m!820353))

(assert (=> b!881045 m!820353))

(assert (=> b!881045 m!820363))

(declare-fun m!820389 () Bool)

(assert (=> b!881044 m!820389))

(declare-fun m!820391 () Bool)

(assert (=> b!881037 m!820391))

(assert (=> b!881041 m!820385))

(assert (=> b!881041 m!820179))

(declare-fun m!820393 () Bool)

(assert (=> b!881041 m!820393))

(assert (=> b!881041 m!820393))

(declare-fun m!820395 () Bool)

(assert (=> b!881041 m!820395))

(declare-fun m!820397 () Bool)

(assert (=> b!881041 m!820397))

(assert (=> b!881041 m!820353))

(assert (=> b!881041 m!820385))

(assert (=> b!881041 m!820179))

(assert (=> b!881041 m!820387))

(declare-fun m!820399 () Bool)

(assert (=> b!881041 m!820399))

(declare-fun m!820401 () Bool)

(assert (=> d!108831 m!820401))

(assert (=> d!108831 m!820187))

(assert (=> b!881042 m!820353))

(assert (=> b!881042 m!820353))

(assert (=> b!881042 m!820363))

(assert (=> bm!38886 m!820389))

(declare-fun m!820403 () Bool)

(assert (=> b!881043 m!820403))

(assert (=> b!880860 d!108831))

(declare-fun d!108833 () Bool)

(assert (=> d!108833 (= (validKeyInArray!0 (select (arr!24682 _keys!868) from!1053)) (and (not (= (select (arr!24682 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24682 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!880860 d!108833))

(declare-fun b!881053 () Bool)

(declare-fun e!490290 () Bool)

(declare-fun e!490291 () Bool)

(assert (=> b!881053 (= e!490290 e!490291)))

(declare-fun c!92860 () Bool)

(assert (=> b!881053 (= c!92860 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun d!108835 () Bool)

(assert (=> d!108835 e!490290))

(declare-fun res!598620 () Bool)

(assert (=> d!108835 (=> (not res!598620) (not e!490290))))

(assert (=> d!108835 (= res!598620 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25125 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25125 _values!688))))))))

(declare-fun lt!398350 () Unit!30025)

(declare-fun choose!1446 (array!51317 array!51319 (_ BitVec 32) (_ BitVec 32) V!28521 V!28521 (_ BitVec 32) (_ BitVec 64) V!28521 (_ BitVec 32) Int) Unit!30025)

(assert (=> d!108835 (= lt!398350 (choose!1446 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108835 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25124 _keys!868)))))

(assert (=> d!108835 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!722 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398350)))

(declare-fun call!38894 () ListLongMap!10495)

(declare-fun bm!38891 () Bool)

(assert (=> bm!38891 (= call!38894 (getCurrentListMapNoExtraKeys!3254 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881054 () Bool)

(declare-fun call!38895 () ListLongMap!10495)

(assert (=> b!881054 (= e!490291 (= call!38895 call!38894))))

(declare-fun bm!38892 () Bool)

(assert (=> bm!38892 (= call!38895 (getCurrentListMapNoExtraKeys!3254 _keys!868 (array!51320 (store (arr!24683 _values!688) i!612 (ValueCellFull!8363 v!557)) (size!25125 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881055 () Bool)

(assert (=> b!881055 (= e!490291 (= call!38895 (+!2557 call!38894 (tuple2!11737 k0!854 v!557))))))

(assert (= (and d!108835 res!598620) b!881053))

(assert (= (and b!881053 c!92860) b!881055))

(assert (= (and b!881053 (not c!92860)) b!881054))

(assert (= (or b!881055 b!881054) bm!38891))

(assert (= (or b!881055 b!881054) bm!38892))

(declare-fun m!820405 () Bool)

(assert (=> d!108835 m!820405))

(assert (=> bm!38891 m!820153))

(assert (=> bm!38892 m!820169))

(declare-fun m!820407 () Bool)

(assert (=> bm!38892 m!820407))

(declare-fun m!820409 () Bool)

(assert (=> b!881055 m!820409))

(assert (=> b!880860 d!108835))

(declare-fun d!108837 () Bool)

(declare-fun e!490292 () Bool)

(assert (=> d!108837 e!490292))

(declare-fun res!598622 () Bool)

(assert (=> d!108837 (=> (not res!598622) (not e!490292))))

(declare-fun lt!398352 () ListLongMap!10495)

(assert (=> d!108837 (= res!598622 (contains!4234 lt!398352 (_1!5879 (tuple2!11737 k0!854 v!557))))))

(declare-fun lt!398353 () List!17533)

(assert (=> d!108837 (= lt!398352 (ListLongMap!10496 lt!398353))))

(declare-fun lt!398351 () Unit!30025)

(declare-fun lt!398354 () Unit!30025)

(assert (=> d!108837 (= lt!398351 lt!398354)))

(assert (=> d!108837 (= (getValueByKey!421 lt!398353 (_1!5879 (tuple2!11737 k0!854 v!557))) (Some!426 (_2!5879 (tuple2!11737 k0!854 v!557))))))

(assert (=> d!108837 (= lt!398354 (lemmaContainsTupThenGetReturnValue!238 lt!398353 (_1!5879 (tuple2!11737 k0!854 v!557)) (_2!5879 (tuple2!11737 k0!854 v!557))))))

(assert (=> d!108837 (= lt!398353 (insertStrictlySorted!277 (toList!5263 lt!398245) (_1!5879 (tuple2!11737 k0!854 v!557)) (_2!5879 (tuple2!11737 k0!854 v!557))))))

(assert (=> d!108837 (= (+!2557 lt!398245 (tuple2!11737 k0!854 v!557)) lt!398352)))

(declare-fun b!881056 () Bool)

(declare-fun res!598621 () Bool)

(assert (=> b!881056 (=> (not res!598621) (not e!490292))))

(assert (=> b!881056 (= res!598621 (= (getValueByKey!421 (toList!5263 lt!398352) (_1!5879 (tuple2!11737 k0!854 v!557))) (Some!426 (_2!5879 (tuple2!11737 k0!854 v!557)))))))

(declare-fun b!881057 () Bool)

(assert (=> b!881057 (= e!490292 (contains!4235 (toList!5263 lt!398352) (tuple2!11737 k0!854 v!557)))))

(assert (= (and d!108837 res!598622) b!881056))

(assert (= (and b!881056 res!598621) b!881057))

(declare-fun m!820411 () Bool)

(assert (=> d!108837 m!820411))

(declare-fun m!820413 () Bool)

(assert (=> d!108837 m!820413))

(declare-fun m!820415 () Bool)

(assert (=> d!108837 m!820415))

(declare-fun m!820417 () Bool)

(assert (=> d!108837 m!820417))

(declare-fun m!820419 () Bool)

(assert (=> b!881056 m!820419))

(declare-fun m!820421 () Bool)

(assert (=> b!881057 m!820421))

(assert (=> b!880860 d!108837))

(declare-fun b!881066 () Bool)

(declare-fun e!490301 () Bool)

(declare-fun e!490299 () Bool)

(assert (=> b!881066 (= e!490301 e!490299)))

(declare-fun c!92863 () Bool)

(assert (=> b!881066 (= c!92863 (validKeyInArray!0 (select (arr!24682 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!881067 () Bool)

(declare-fun call!38898 () Bool)

(assert (=> b!881067 (= e!490299 call!38898)))

(declare-fun d!108839 () Bool)

(declare-fun res!598628 () Bool)

(assert (=> d!108839 (=> res!598628 e!490301)))

(assert (=> d!108839 (= res!598628 (bvsge #b00000000000000000000000000000000 (size!25124 _keys!868)))))

(assert (=> d!108839 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!490301)))

(declare-fun b!881068 () Bool)

(declare-fun e!490300 () Bool)

(assert (=> b!881068 (= e!490299 e!490300)))

(declare-fun lt!398363 () (_ BitVec 64))

(assert (=> b!881068 (= lt!398363 (select (arr!24682 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!398362 () Unit!30025)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51317 (_ BitVec 64) (_ BitVec 32)) Unit!30025)

(assert (=> b!881068 (= lt!398362 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!398363 #b00000000000000000000000000000000))))

(assert (=> b!881068 (arrayContainsKey!0 _keys!868 lt!398363 #b00000000000000000000000000000000)))

(declare-fun lt!398361 () Unit!30025)

(assert (=> b!881068 (= lt!398361 lt!398362)))

(declare-fun res!598627 () Bool)

(declare-datatypes ((SeekEntryResult!8753 0))(
  ( (MissingZero!8753 (index!37383 (_ BitVec 32))) (Found!8753 (index!37384 (_ BitVec 32))) (Intermediate!8753 (undefined!9565 Bool) (index!37385 (_ BitVec 32)) (x!74667 (_ BitVec 32))) (Undefined!8753) (MissingVacant!8753 (index!37386 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51317 (_ BitVec 32)) SeekEntryResult!8753)

(assert (=> b!881068 (= res!598627 (= (seekEntryOrOpen!0 (select (arr!24682 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8753 #b00000000000000000000000000000000)))))

(assert (=> b!881068 (=> (not res!598627) (not e!490300))))

(declare-fun b!881069 () Bool)

(assert (=> b!881069 (= e!490300 call!38898)))

(declare-fun bm!38895 () Bool)

(assert (=> bm!38895 (= call!38898 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(assert (= (and d!108839 (not res!598628)) b!881066))

(assert (= (and b!881066 c!92863) b!881068))

(assert (= (and b!881066 (not c!92863)) b!881067))

(assert (= (and b!881068 res!598627) b!881069))

(assert (= (or b!881069 b!881067) bm!38895))

(declare-fun m!820423 () Bool)

(assert (=> b!881066 m!820423))

(assert (=> b!881066 m!820423))

(declare-fun m!820425 () Bool)

(assert (=> b!881066 m!820425))

(assert (=> b!881068 m!820423))

(declare-fun m!820427 () Bool)

(assert (=> b!881068 m!820427))

(declare-fun m!820429 () Bool)

(assert (=> b!881068 m!820429))

(assert (=> b!881068 m!820423))

(declare-fun m!820431 () Bool)

(assert (=> b!881068 m!820431))

(declare-fun m!820433 () Bool)

(assert (=> bm!38895 m!820433))

(assert (=> b!880854 d!108839))

(declare-fun b!881080 () Bool)

(declare-fun e!490312 () Bool)

(declare-fun call!38901 () Bool)

(assert (=> b!881080 (= e!490312 call!38901)))

(declare-fun b!881081 () Bool)

(declare-fun e!490313 () Bool)

(assert (=> b!881081 (= e!490313 e!490312)))

(declare-fun c!92866 () Bool)

(assert (=> b!881081 (= c!92866 (validKeyInArray!0 (select (arr!24682 _keys!868) from!1053)))))

(declare-fun b!881082 () Bool)

(declare-fun e!490310 () Bool)

(assert (=> b!881082 (= e!490310 e!490313)))

(declare-fun res!598637 () Bool)

(assert (=> b!881082 (=> (not res!598637) (not e!490313))))

(declare-fun e!490311 () Bool)

(assert (=> b!881082 (= res!598637 (not e!490311))))

(declare-fun res!598636 () Bool)

(assert (=> b!881082 (=> (not res!598636) (not e!490311))))

(assert (=> b!881082 (= res!598636 (validKeyInArray!0 (select (arr!24682 _keys!868) from!1053)))))

(declare-fun bm!38898 () Bool)

(assert (=> bm!38898 (= call!38901 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!92866 (Cons!17528 (select (arr!24682 _keys!868) from!1053) Nil!17529) Nil!17529)))))

(declare-fun d!108841 () Bool)

(declare-fun res!598635 () Bool)

(assert (=> d!108841 (=> res!598635 e!490310)))

(assert (=> d!108841 (= res!598635 (bvsge from!1053 (size!25124 _keys!868)))))

(assert (=> d!108841 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17529) e!490310)))

(declare-fun b!881083 () Bool)

(declare-fun contains!4236 (List!17532 (_ BitVec 64)) Bool)

(assert (=> b!881083 (= e!490311 (contains!4236 Nil!17529 (select (arr!24682 _keys!868) from!1053)))))

(declare-fun b!881084 () Bool)

(assert (=> b!881084 (= e!490312 call!38901)))

(assert (= (and d!108841 (not res!598635)) b!881082))

(assert (= (and b!881082 res!598636) b!881083))

(assert (= (and b!881082 res!598637) b!881081))

(assert (= (and b!881081 c!92866) b!881084))

(assert (= (and b!881081 (not c!92866)) b!881080))

(assert (= (or b!881084 b!881080) bm!38898))

(assert (=> b!881081 m!820157))

(assert (=> b!881081 m!820157))

(assert (=> b!881081 m!820159))

(assert (=> b!881082 m!820157))

(assert (=> b!881082 m!820157))

(assert (=> b!881082 m!820159))

(assert (=> bm!38898 m!820157))

(declare-fun m!820435 () Bool)

(assert (=> bm!38898 m!820435))

(assert (=> b!881083 m!820157))

(assert (=> b!881083 m!820157))

(declare-fun m!820437 () Bool)

(assert (=> b!881083 m!820437))

(assert (=> b!880861 d!108841))

(declare-fun d!108843 () Bool)

(assert (=> d!108843 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17529)))

(declare-fun lt!398366 () Unit!30025)

(declare-fun choose!39 (array!51317 (_ BitVec 32) (_ BitVec 32)) Unit!30025)

(assert (=> d!108843 (= lt!398366 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!108843 (bvslt (size!25124 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!108843 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!398366)))

(declare-fun bs!24688 () Bool)

(assert (= bs!24688 d!108843))

(assert (=> bs!24688 m!820183))

(declare-fun m!820439 () Bool)

(assert (=> bs!24688 m!820439))

(assert (=> b!880861 d!108843))

(declare-fun b!881085 () Bool)

(declare-fun e!490316 () Bool)

(declare-fun call!38902 () Bool)

(assert (=> b!881085 (= e!490316 call!38902)))

(declare-fun b!881086 () Bool)

(declare-fun e!490317 () Bool)

(assert (=> b!881086 (= e!490317 e!490316)))

(declare-fun c!92867 () Bool)

(assert (=> b!881086 (= c!92867 (validKeyInArray!0 (select (arr!24682 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!881087 () Bool)

(declare-fun e!490314 () Bool)

(assert (=> b!881087 (= e!490314 e!490317)))

(declare-fun res!598640 () Bool)

(assert (=> b!881087 (=> (not res!598640) (not e!490317))))

(declare-fun e!490315 () Bool)

(assert (=> b!881087 (= res!598640 (not e!490315))))

(declare-fun res!598639 () Bool)

(assert (=> b!881087 (=> (not res!598639) (not e!490315))))

(assert (=> b!881087 (= res!598639 (validKeyInArray!0 (select (arr!24682 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38899 () Bool)

(assert (=> bm!38899 (= call!38902 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92867 (Cons!17528 (select (arr!24682 _keys!868) #b00000000000000000000000000000000) Nil!17529) Nil!17529)))))

(declare-fun d!108845 () Bool)

(declare-fun res!598638 () Bool)

(assert (=> d!108845 (=> res!598638 e!490314)))

(assert (=> d!108845 (= res!598638 (bvsge #b00000000000000000000000000000000 (size!25124 _keys!868)))))

(assert (=> d!108845 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17529) e!490314)))

(declare-fun b!881088 () Bool)

(assert (=> b!881088 (= e!490315 (contains!4236 Nil!17529 (select (arr!24682 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!881089 () Bool)

(assert (=> b!881089 (= e!490316 call!38902)))

(assert (= (and d!108845 (not res!598638)) b!881087))

(assert (= (and b!881087 res!598639) b!881088))

(assert (= (and b!881087 res!598640) b!881086))

(assert (= (and b!881086 c!92867) b!881089))

(assert (= (and b!881086 (not c!92867)) b!881085))

(assert (= (or b!881089 b!881085) bm!38899))

(assert (=> b!881086 m!820423))

(assert (=> b!881086 m!820423))

(assert (=> b!881086 m!820425))

(assert (=> b!881087 m!820423))

(assert (=> b!881087 m!820423))

(assert (=> b!881087 m!820425))

(assert (=> bm!38899 m!820423))

(declare-fun m!820441 () Bool)

(assert (=> bm!38899 m!820441))

(assert (=> b!881088 m!820423))

(assert (=> b!881088 m!820423))

(declare-fun m!820443 () Bool)

(assert (=> b!881088 m!820443))

(assert (=> b!880855 d!108845))

(declare-fun d!108847 () Bool)

(declare-fun res!598645 () Bool)

(declare-fun e!490322 () Bool)

(assert (=> d!108847 (=> res!598645 e!490322)))

(assert (=> d!108847 (= res!598645 (= (select (arr!24682 _keys!868) i!612) k0!854))))

(assert (=> d!108847 (= (arrayContainsKey!0 _keys!868 k0!854 i!612) e!490322)))

(declare-fun b!881094 () Bool)

(declare-fun e!490323 () Bool)

(assert (=> b!881094 (= e!490322 e!490323)))

(declare-fun res!598646 () Bool)

(assert (=> b!881094 (=> (not res!598646) (not e!490323))))

(assert (=> b!881094 (= res!598646 (bvslt (bvadd i!612 #b00000000000000000000000000000001) (size!25124 _keys!868)))))

(declare-fun b!881095 () Bool)

(assert (=> b!881095 (= e!490323 (arrayContainsKey!0 _keys!868 k0!854 (bvadd i!612 #b00000000000000000000000000000001)))))

(assert (= (and d!108847 (not res!598645)) b!881094))

(assert (= (and b!881094 res!598646) b!881095))

(assert (=> d!108847 m!820165))

(declare-fun m!820445 () Bool)

(assert (=> b!881095 m!820445))

(assert (=> b!880852 d!108847))

(declare-fun d!108849 () Bool)

(assert (=> d!108849 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!880866 d!108849))

(declare-fun mapNonEmpty!28041 () Bool)

(declare-fun mapRes!28041 () Bool)

(declare-fun tp!53790 () Bool)

(declare-fun e!490329 () Bool)

(assert (=> mapNonEmpty!28041 (= mapRes!28041 (and tp!53790 e!490329))))

(declare-fun mapRest!28041 () (Array (_ BitVec 32) ValueCell!8363))

(declare-fun mapValue!28041 () ValueCell!8363)

(declare-fun mapKey!28041 () (_ BitVec 32))

(assert (=> mapNonEmpty!28041 (= mapRest!28032 (store mapRest!28041 mapKey!28041 mapValue!28041))))

(declare-fun mapIsEmpty!28041 () Bool)

(assert (=> mapIsEmpty!28041 mapRes!28041))

(declare-fun b!881102 () Bool)

(assert (=> b!881102 (= e!490329 tp_is_empty!17605)))

(declare-fun condMapEmpty!28041 () Bool)

(declare-fun mapDefault!28041 () ValueCell!8363)

(assert (=> mapNonEmpty!28032 (= condMapEmpty!28041 (= mapRest!28032 ((as const (Array (_ BitVec 32) ValueCell!8363)) mapDefault!28041)))))

(declare-fun e!490328 () Bool)

(assert (=> mapNonEmpty!28032 (= tp!53774 (and e!490328 mapRes!28041))))

(declare-fun b!881103 () Bool)

(assert (=> b!881103 (= e!490328 tp_is_empty!17605)))

(assert (= (and mapNonEmpty!28032 condMapEmpty!28041) mapIsEmpty!28041))

(assert (= (and mapNonEmpty!28032 (not condMapEmpty!28041)) mapNonEmpty!28041))

(assert (= (and mapNonEmpty!28041 ((_ is ValueCellFull!8363) mapValue!28041)) b!881102))

(assert (= (and mapNonEmpty!28032 ((_ is ValueCellFull!8363) mapDefault!28041)) b!881103))

(declare-fun m!820447 () Bool)

(assert (=> mapNonEmpty!28041 m!820447))

(declare-fun b_lambda!12509 () Bool)

(assert (= b_lambda!12505 (or (and start!74716 b_free!15361) b_lambda!12509)))

(declare-fun b_lambda!12511 () Bool)

(assert (= b_lambda!12499 (or (and start!74716 b_free!15361) b_lambda!12511)))

(declare-fun b_lambda!12513 () Bool)

(assert (= b_lambda!12497 (or (and start!74716 b_free!15361) b_lambda!12513)))

(declare-fun b_lambda!12515 () Bool)

(assert (= b_lambda!12503 (or (and start!74716 b_free!15361) b_lambda!12515)))

(declare-fun b_lambda!12517 () Bool)

(assert (= b_lambda!12501 (or (and start!74716 b_free!15361) b_lambda!12517)))

(declare-fun b_lambda!12519 () Bool)

(assert (= b_lambda!12495 (or (and start!74716 b_free!15361) b_lambda!12519)))

(declare-fun b_lambda!12521 () Bool)

(assert (= b_lambda!12507 (or (and start!74716 b_free!15361) b_lambda!12521)))

(declare-fun b_lambda!12523 () Bool)

(assert (= b_lambda!12493 (or (and start!74716 b_free!15361) b_lambda!12523)))

(check-sat (not b!881066) (not b!881083) (not b!880993) (not bm!38883) (not mapNonEmpty!28041) (not bm!38886) (not b!881025) (not d!108837) (not b!881086) (not bm!38885) (not b_lambda!12513) (not b_lambda!12519) (not b!881087) (not bm!38899) (not b_lambda!12491) (not b!881068) (not b!881031) tp_is_empty!17605 (not d!108815) (not bm!38898) (not b!881009) (not b!881023) (not b!881088) (not b!881030) (not b!880996) (not b!881095) (not d!108835) (not b!881043) (not b!881032) (not b!881029) (not bm!38884) (not b!881015) (not d!108829) (not b!881000) (not b_lambda!12515) (not b_lambda!12523) (not b!881037) (not b!881006) (not b!881024) (not b!881007) (not b!881016) (not b!880995) (not b!881082) (not b!881022) (not b!881041) (not d!108825) (not b!880997) (not b!881044) (not b!881035) (not bm!38892) (not b_lambda!12509) (not b!881057) (not b!881056) (not b!880999) (not bm!38891) (not d!108831) (not b!881045) (not b_lambda!12511) (not b_lambda!12517) (not b!881042) (not b_next!15361) (not b!880987) (not b!880989) (not b!881005) (not b!881021) b_and!25357 (not b_lambda!12521) (not b!881033) (not b!881036) (not b!881008) (not b!880988) (not bm!38895) (not d!108817) (not b!881055) (not b!880994) (not d!108843) (not b!881081) (not b!881001))
(check-sat b_and!25357 (not b_next!15361))
