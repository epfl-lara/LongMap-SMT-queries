; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72384 () Bool)

(assert start!72384)

(declare-fun b_free!13569 () Bool)

(declare-fun b_next!13569 () Bool)

(assert (=> start!72384 (= b_free!13569 (not b_next!13569))))

(declare-fun tp!47805 () Bool)

(declare-fun b_and!22655 () Bool)

(assert (=> start!72384 (= tp!47805 b_and!22655)))

(declare-fun res!570418 () Bool)

(declare-fun e!468234 () Bool)

(assert (=> start!72384 (=> (not res!570418) (not e!468234))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47156 0))(
  ( (array!47157 (arr!22609 (Array (_ BitVec 32) (_ BitVec 64))) (size!23049 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47156)

(assert (=> start!72384 (= res!570418 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23049 _keys!868))))))

(assert (=> start!72384 e!468234))

(declare-fun tp_is_empty!15435 () Bool)

(assert (=> start!72384 tp_is_empty!15435))

(assert (=> start!72384 true))

(assert (=> start!72384 tp!47805))

(declare-fun array_inv!18012 (array!47156) Bool)

(assert (=> start!72384 (array_inv!18012 _keys!868)))

(declare-datatypes ((V!25627 0))(
  ( (V!25628 (val!7765 Int)) )
))
(declare-datatypes ((ValueCell!7278 0))(
  ( (ValueCellFull!7278 (v!10190 V!25627)) (EmptyCell!7278) )
))
(declare-datatypes ((array!47158 0))(
  ( (array!47159 (arr!22610 (Array (_ BitVec 32) ValueCell!7278)) (size!23050 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47158)

(declare-fun e!468235 () Bool)

(declare-fun array_inv!18013 (array!47158) Bool)

(assert (=> start!72384 (and (array_inv!18013 _values!688) e!468235)))

(declare-datatypes ((tuple2!10274 0))(
  ( (tuple2!10275 (_1!5148 (_ BitVec 64)) (_2!5148 V!25627)) )
))
(declare-datatypes ((List!16074 0))(
  ( (Nil!16071) (Cons!16070 (h!17201 tuple2!10274) (t!22445 List!16074)) )
))
(declare-datatypes ((ListLongMap!9043 0))(
  ( (ListLongMap!9044 (toList!4537 List!16074)) )
))
(declare-fun call!36940 () ListLongMap!9043)

(declare-fun e!468236 () Bool)

(declare-fun v!557 () V!25627)

(declare-fun call!36941 () ListLongMap!9043)

(declare-fun b!838907 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2010 (ListLongMap!9043 tuple2!10274) ListLongMap!9043)

(assert (=> b!838907 (= e!468236 (= call!36941 (+!2010 call!36940 (tuple2!10275 k0!854 v!557))))))

(declare-fun bm!36937 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!25627)

(declare-fun zeroValue!654 () V!25627)

(declare-fun getCurrentListMapNoExtraKeys!2529 (array!47156 array!47158 (_ BitVec 32) (_ BitVec 32) V!25627 V!25627 (_ BitVec 32) Int) ListLongMap!9043)

(assert (=> bm!36937 (= call!36940 (getCurrentListMapNoExtraKeys!2529 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24752 () Bool)

(declare-fun mapRes!24752 () Bool)

(assert (=> mapIsEmpty!24752 mapRes!24752))

(declare-fun b!838908 () Bool)

(assert (=> b!838908 (= e!468236 (= call!36941 call!36940))))

(declare-fun b!838909 () Bool)

(declare-fun res!570421 () Bool)

(assert (=> b!838909 (=> (not res!570421) (not e!468234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838909 (= res!570421 (validMask!0 mask!1196))))

(declare-fun b!838910 () Bool)

(declare-fun res!570419 () Bool)

(assert (=> b!838910 (=> (not res!570419) (not e!468234))))

(assert (=> b!838910 (= res!570419 (and (= (size!23050 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23049 _keys!868) (size!23050 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838911 () Bool)

(declare-fun e!468237 () Bool)

(assert (=> b!838911 (= e!468237 tp_is_empty!15435)))

(declare-fun b!838912 () Bool)

(declare-fun res!570424 () Bool)

(assert (=> b!838912 (=> (not res!570424) (not e!468234))))

(declare-datatypes ((List!16075 0))(
  ( (Nil!16072) (Cons!16071 (h!17202 (_ BitVec 64)) (t!22446 List!16075)) )
))
(declare-fun arrayNoDuplicates!0 (array!47156 (_ BitVec 32) List!16075) Bool)

(assert (=> b!838912 (= res!570424 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16072))))

(declare-fun b!838913 () Bool)

(declare-fun res!570422 () Bool)

(assert (=> b!838913 (=> (not res!570422) (not e!468234))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!838913 (= res!570422 (and (= (select (arr!22609 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23049 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun bm!36938 () Bool)

(assert (=> bm!36938 (= call!36941 (getCurrentListMapNoExtraKeys!2529 _keys!868 (array!47159 (store (arr!22610 _values!688) i!612 (ValueCellFull!7278 v!557)) (size!23050 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838914 () Bool)

(declare-fun res!570420 () Bool)

(assert (=> b!838914 (=> (not res!570420) (not e!468234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838914 (= res!570420 (validKeyInArray!0 k0!854))))

(declare-fun b!838915 () Bool)

(declare-fun res!570423 () Bool)

(assert (=> b!838915 (=> (not res!570423) (not e!468234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47156 (_ BitVec 32)) Bool)

(assert (=> b!838915 (= res!570423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838916 () Bool)

(assert (=> b!838916 (= e!468235 (and e!468237 mapRes!24752))))

(declare-fun condMapEmpty!24752 () Bool)

(declare-fun mapDefault!24752 () ValueCell!7278)

(assert (=> b!838916 (= condMapEmpty!24752 (= (arr!22610 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7278)) mapDefault!24752)))))

(declare-fun b!838917 () Bool)

(assert (=> b!838917 (= e!468234 (not true))))

(assert (=> b!838917 e!468236))

(declare-fun c!91213 () Bool)

(assert (=> b!838917 (= c!91213 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28811 0))(
  ( (Unit!28812) )
))
(declare-fun lt!380719 () Unit!28811)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!251 (array!47156 array!47158 (_ BitVec 32) (_ BitVec 32) V!25627 V!25627 (_ BitVec 32) (_ BitVec 64) V!25627 (_ BitVec 32) Int) Unit!28811)

(assert (=> b!838917 (= lt!380719 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!251 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838918 () Bool)

(declare-fun res!570425 () Bool)

(assert (=> b!838918 (=> (not res!570425) (not e!468234))))

(assert (=> b!838918 (= res!570425 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23049 _keys!868))))))

(declare-fun b!838919 () Bool)

(declare-fun e!468238 () Bool)

(assert (=> b!838919 (= e!468238 tp_is_empty!15435)))

(declare-fun mapNonEmpty!24752 () Bool)

(declare-fun tp!47806 () Bool)

(assert (=> mapNonEmpty!24752 (= mapRes!24752 (and tp!47806 e!468238))))

(declare-fun mapRest!24752 () (Array (_ BitVec 32) ValueCell!7278))

(declare-fun mapValue!24752 () ValueCell!7278)

(declare-fun mapKey!24752 () (_ BitVec 32))

(assert (=> mapNonEmpty!24752 (= (arr!22610 _values!688) (store mapRest!24752 mapKey!24752 mapValue!24752))))

(assert (= (and start!72384 res!570418) b!838909))

(assert (= (and b!838909 res!570421) b!838910))

(assert (= (and b!838910 res!570419) b!838915))

(assert (= (and b!838915 res!570423) b!838912))

(assert (= (and b!838912 res!570424) b!838918))

(assert (= (and b!838918 res!570425) b!838914))

(assert (= (and b!838914 res!570420) b!838913))

(assert (= (and b!838913 res!570422) b!838917))

(assert (= (and b!838917 c!91213) b!838907))

(assert (= (and b!838917 (not c!91213)) b!838908))

(assert (= (or b!838907 b!838908) bm!36938))

(assert (= (or b!838907 b!838908) bm!36937))

(assert (= (and b!838916 condMapEmpty!24752) mapIsEmpty!24752))

(assert (= (and b!838916 (not condMapEmpty!24752)) mapNonEmpty!24752))

(get-info :version)

(assert (= (and mapNonEmpty!24752 ((_ is ValueCellFull!7278) mapValue!24752)) b!838919))

(assert (= (and b!838916 ((_ is ValueCellFull!7278) mapDefault!24752)) b!838911))

(assert (= start!72384 b!838916))

(declare-fun m!783191 () Bool)

(assert (=> mapNonEmpty!24752 m!783191))

(declare-fun m!783193 () Bool)

(assert (=> start!72384 m!783193))

(declare-fun m!783195 () Bool)

(assert (=> start!72384 m!783195))

(declare-fun m!783197 () Bool)

(assert (=> b!838915 m!783197))

(declare-fun m!783199 () Bool)

(assert (=> b!838907 m!783199))

(declare-fun m!783201 () Bool)

(assert (=> b!838914 m!783201))

(declare-fun m!783203 () Bool)

(assert (=> b!838913 m!783203))

(declare-fun m!783205 () Bool)

(assert (=> bm!36938 m!783205))

(declare-fun m!783207 () Bool)

(assert (=> bm!36938 m!783207))

(declare-fun m!783209 () Bool)

(assert (=> bm!36937 m!783209))

(declare-fun m!783211 () Bool)

(assert (=> b!838909 m!783211))

(declare-fun m!783213 () Bool)

(assert (=> b!838917 m!783213))

(declare-fun m!783215 () Bool)

(assert (=> b!838912 m!783215))

(check-sat (not b!838907) (not b!838917) (not b!838912) (not b!838915) (not b!838909) (not b!838914) (not mapNonEmpty!24752) (not bm!36938) (not start!72384) tp_is_empty!15435 b_and!22655 (not b_next!13569) (not bm!36937))
(check-sat b_and!22655 (not b_next!13569))
