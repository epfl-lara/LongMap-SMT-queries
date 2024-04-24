; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73426 () Bool)

(assert start!73426)

(declare-fun b_free!14173 () Bool)

(declare-fun b_next!14173 () Bool)

(assert (=> start!73426 (= b_free!14173 (not b_next!14173))))

(declare-fun tp!50024 () Bool)

(declare-fun b_and!23515 () Bool)

(assert (=> start!73426 (= tp!50024 b_and!23515)))

(declare-fun b!855123 () Bool)

(declare-fun res!580469 () Bool)

(declare-fun e!476926 () Bool)

(assert (=> b!855123 (=> (not res!580469) (not e!476926))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855123 (= res!580469 (validKeyInArray!0 k0!854))))

(declare-fun b!855124 () Bool)

(declare-fun res!580471 () Bool)

(assert (=> b!855124 (=> (not res!580471) (not e!476926))))

(declare-datatypes ((array!48863 0))(
  ( (array!48864 (arr!23458 (Array (_ BitVec 32) (_ BitVec 64))) (size!23899 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48863)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48863 (_ BitVec 32)) Bool)

(assert (=> b!855124 (= res!580471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!580470 () Bool)

(assert (=> start!73426 (=> (not res!580470) (not e!476926))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73426 (= res!580470 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23899 _keys!868))))))

(assert (=> start!73426 e!476926))

(declare-fun tp_is_empty!16309 () Bool)

(assert (=> start!73426 tp_is_empty!16309))

(assert (=> start!73426 true))

(assert (=> start!73426 tp!50024))

(declare-fun array_inv!18644 (array!48863) Bool)

(assert (=> start!73426 (array_inv!18644 _keys!868)))

(declare-datatypes ((V!26793 0))(
  ( (V!26794 (val!8202 Int)) )
))
(declare-datatypes ((ValueCell!7715 0))(
  ( (ValueCellFull!7715 (v!10627 V!26793)) (EmptyCell!7715) )
))
(declare-datatypes ((array!48865 0))(
  ( (array!48866 (arr!23459 (Array (_ BitVec 32) ValueCell!7715)) (size!23900 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48865)

(declare-fun e!476922 () Bool)

(declare-fun array_inv!18645 (array!48865) Bool)

(assert (=> start!73426 (and (array_inv!18645 _values!688) e!476922)))

(declare-fun mapIsEmpty!26063 () Bool)

(declare-fun mapRes!26063 () Bool)

(assert (=> mapIsEmpty!26063 mapRes!26063))

(declare-fun b!855125 () Bool)

(declare-fun res!580464 () Bool)

(assert (=> b!855125 (=> (not res!580464) (not e!476926))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!855125 (= res!580464 (and (= (size!23900 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23899 _keys!868) (size!23900 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855126 () Bool)

(declare-fun e!476924 () Bool)

(declare-fun e!476919 () Bool)

(assert (=> b!855126 (= e!476924 (not e!476919))))

(declare-fun res!580463 () Bool)

(assert (=> b!855126 (=> res!580463 e!476919)))

(assert (=> b!855126 (= res!580463 (not (validKeyInArray!0 (select (arr!23458 _keys!868) from!1053))))))

(declare-fun e!476921 () Bool)

(assert (=> b!855126 e!476921))

(declare-fun c!92212 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855126 (= c!92212 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26793)

(declare-fun zeroValue!654 () V!26793)

(declare-fun v!557 () V!26793)

(declare-datatypes ((Unit!29164 0))(
  ( (Unit!29165) )
))
(declare-fun lt!385596 () Unit!29164)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!405 (array!48863 array!48865 (_ BitVec 32) (_ BitVec 32) V!26793 V!26793 (_ BitVec 32) (_ BitVec 64) V!26793 (_ BitVec 32) Int) Unit!29164)

(assert (=> b!855126 (= lt!385596 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!405 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855127 () Bool)

(declare-fun res!580465 () Bool)

(assert (=> b!855127 (=> (not res!580465) (not e!476926))))

(assert (=> b!855127 (= res!580465 (and (= (select (arr!23458 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855128 () Bool)

(declare-fun res!580467 () Bool)

(assert (=> b!855128 (=> (not res!580467) (not e!476926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855128 (= res!580467 (validMask!0 mask!1196))))

(declare-fun b!855129 () Bool)

(declare-fun e!476920 () Bool)

(assert (=> b!855129 (= e!476922 (and e!476920 mapRes!26063))))

(declare-fun condMapEmpty!26063 () Bool)

(declare-fun mapDefault!26063 () ValueCell!7715)

(assert (=> b!855129 (= condMapEmpty!26063 (= (arr!23459 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7715)) mapDefault!26063)))))

(declare-fun b!855130 () Bool)

(declare-fun res!580468 () Bool)

(assert (=> b!855130 (=> (not res!580468) (not e!476926))))

(assert (=> b!855130 (= res!580468 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23899 _keys!868))))))

(declare-datatypes ((tuple2!10718 0))(
  ( (tuple2!10719 (_1!5370 (_ BitVec 64)) (_2!5370 V!26793)) )
))
(declare-datatypes ((List!16565 0))(
  ( (Nil!16562) (Cons!16561 (h!17698 tuple2!10718) (t!23176 List!16565)) )
))
(declare-datatypes ((ListLongMap!9489 0))(
  ( (ListLongMap!9490 (toList!4760 List!16565)) )
))
(declare-fun call!38420 () ListLongMap!9489)

(declare-fun bm!38416 () Bool)

(declare-fun lt!385598 () array!48865)

(declare-fun getCurrentListMapNoExtraKeys!2817 (array!48863 array!48865 (_ BitVec 32) (_ BitVec 32) V!26793 V!26793 (_ BitVec 32) Int) ListLongMap!9489)

(assert (=> bm!38416 (= call!38420 (getCurrentListMapNoExtraKeys!2817 _keys!868 (ite c!92212 lt!385598 _values!688) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855131 () Bool)

(declare-fun res!580466 () Bool)

(assert (=> b!855131 (=> (not res!580466) (not e!476926))))

(declare-datatypes ((List!16566 0))(
  ( (Nil!16563) (Cons!16562 (h!17699 (_ BitVec 64)) (t!23177 List!16566)) )
))
(declare-fun arrayNoDuplicates!0 (array!48863 (_ BitVec 32) List!16566) Bool)

(assert (=> b!855131 (= res!580466 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16563))))

(declare-fun mapNonEmpty!26063 () Bool)

(declare-fun tp!50023 () Bool)

(declare-fun e!476923 () Bool)

(assert (=> mapNonEmpty!26063 (= mapRes!26063 (and tp!50023 e!476923))))

(declare-fun mapRest!26063 () (Array (_ BitVec 32) ValueCell!7715))

(declare-fun mapKey!26063 () (_ BitVec 32))

(declare-fun mapValue!26063 () ValueCell!7715)

(assert (=> mapNonEmpty!26063 (= (arr!23459 _values!688) (store mapRest!26063 mapKey!26063 mapValue!26063))))

(declare-fun call!38419 () ListLongMap!9489)

(declare-fun bm!38417 () Bool)

(assert (=> bm!38417 (= call!38419 (getCurrentListMapNoExtraKeys!2817 _keys!868 (ite c!92212 _values!688 lt!385598) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855132 () Bool)

(assert (=> b!855132 (= e!476926 e!476924)))

(declare-fun res!580462 () Bool)

(assert (=> b!855132 (=> (not res!580462) (not e!476924))))

(assert (=> b!855132 (= res!580462 (= from!1053 i!612))))

(declare-fun lt!385602 () ListLongMap!9489)

(assert (=> b!855132 (= lt!385602 (getCurrentListMapNoExtraKeys!2817 _keys!868 lt!385598 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!855132 (= lt!385598 (array!48866 (store (arr!23459 _values!688) i!612 (ValueCellFull!7715 v!557)) (size!23900 _values!688)))))

(declare-fun lt!385595 () ListLongMap!9489)

(assert (=> b!855132 (= lt!385595 (getCurrentListMapNoExtraKeys!2817 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855133 () Bool)

(assert (=> b!855133 (= e!476919 true)))

(declare-fun lt!385599 () ListLongMap!9489)

(declare-fun lt!385600 () tuple2!10718)

(declare-fun lt!385603 () V!26793)

(declare-fun +!2202 (ListLongMap!9489 tuple2!10718) ListLongMap!9489)

(assert (=> b!855133 (= (+!2202 lt!385599 lt!385600) (+!2202 (+!2202 lt!385599 (tuple2!10719 k0!854 lt!385603)) lt!385600))))

(declare-fun lt!385604 () V!26793)

(assert (=> b!855133 (= lt!385600 (tuple2!10719 k0!854 lt!385604))))

(declare-fun lt!385601 () Unit!29164)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!326 (ListLongMap!9489 (_ BitVec 64) V!26793 V!26793) Unit!29164)

(assert (=> b!855133 (= lt!385601 (addSameAsAddTwiceSameKeyDiffValues!326 lt!385599 k0!854 lt!385603 lt!385604))))

(declare-fun lt!385597 () V!26793)

(declare-fun get!12381 (ValueCell!7715 V!26793) V!26793)

(assert (=> b!855133 (= lt!385603 (get!12381 (select (arr!23459 _values!688) from!1053) lt!385597))))

(assert (=> b!855133 (= lt!385602 (+!2202 lt!385599 (tuple2!10719 (select (arr!23458 _keys!868) from!1053) lt!385604)))))

(assert (=> b!855133 (= lt!385604 (get!12381 (select (store (arr!23459 _values!688) i!612 (ValueCellFull!7715 v!557)) from!1053) lt!385597))))

(declare-fun dynLambda!1073 (Int (_ BitVec 64)) V!26793)

(assert (=> b!855133 (= lt!385597 (dynLambda!1073 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!855133 (= lt!385599 (getCurrentListMapNoExtraKeys!2817 _keys!868 lt!385598 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855134 () Bool)

(assert (=> b!855134 (= e!476921 (= call!38420 (+!2202 call!38419 (tuple2!10719 k0!854 v!557))))))

(declare-fun b!855135 () Bool)

(assert (=> b!855135 (= e!476920 tp_is_empty!16309)))

(declare-fun b!855136 () Bool)

(assert (=> b!855136 (= e!476923 tp_is_empty!16309)))

(declare-fun b!855137 () Bool)

(assert (=> b!855137 (= e!476921 (= call!38419 call!38420))))

(assert (= (and start!73426 res!580470) b!855128))

(assert (= (and b!855128 res!580467) b!855125))

(assert (= (and b!855125 res!580464) b!855124))

(assert (= (and b!855124 res!580471) b!855131))

(assert (= (and b!855131 res!580466) b!855130))

(assert (= (and b!855130 res!580468) b!855123))

(assert (= (and b!855123 res!580469) b!855127))

(assert (= (and b!855127 res!580465) b!855132))

(assert (= (and b!855132 res!580462) b!855126))

(assert (= (and b!855126 c!92212) b!855134))

(assert (= (and b!855126 (not c!92212)) b!855137))

(assert (= (or b!855134 b!855137) bm!38417))

(assert (= (or b!855134 b!855137) bm!38416))

(assert (= (and b!855126 (not res!580463)) b!855133))

(assert (= (and b!855129 condMapEmpty!26063) mapIsEmpty!26063))

(assert (= (and b!855129 (not condMapEmpty!26063)) mapNonEmpty!26063))

(get-info :version)

(assert (= (and mapNonEmpty!26063 ((_ is ValueCellFull!7715) mapValue!26063)) b!855136))

(assert (= (and b!855129 ((_ is ValueCellFull!7715) mapDefault!26063)) b!855135))

(assert (= start!73426 b!855129))

(declare-fun b_lambda!11719 () Bool)

(assert (=> (not b_lambda!11719) (not b!855133)))

(declare-fun t!23175 () Bool)

(declare-fun tb!4467 () Bool)

(assert (=> (and start!73426 (= defaultEntry!696 defaultEntry!696) t!23175) tb!4467))

(declare-fun result!8553 () Bool)

(assert (=> tb!4467 (= result!8553 tp_is_empty!16309)))

(assert (=> b!855133 t!23175))

(declare-fun b_and!23517 () Bool)

(assert (= b_and!23515 (and (=> t!23175 result!8553) b_and!23517)))

(declare-fun m!796839 () Bool)

(assert (=> b!855132 m!796839))

(declare-fun m!796841 () Bool)

(assert (=> b!855132 m!796841))

(declare-fun m!796843 () Bool)

(assert (=> b!855132 m!796843))

(declare-fun m!796845 () Bool)

(assert (=> b!855131 m!796845))

(declare-fun m!796847 () Bool)

(assert (=> b!855123 m!796847))

(declare-fun m!796849 () Bool)

(assert (=> bm!38417 m!796849))

(declare-fun m!796851 () Bool)

(assert (=> b!855134 m!796851))

(declare-fun m!796853 () Bool)

(assert (=> b!855128 m!796853))

(declare-fun m!796855 () Bool)

(assert (=> b!855133 m!796855))

(declare-fun m!796857 () Bool)

(assert (=> b!855133 m!796857))

(assert (=> b!855133 m!796855))

(declare-fun m!796859 () Bool)

(assert (=> b!855133 m!796859))

(declare-fun m!796861 () Bool)

(assert (=> b!855133 m!796861))

(declare-fun m!796863 () Bool)

(assert (=> b!855133 m!796863))

(declare-fun m!796865 () Bool)

(assert (=> b!855133 m!796865))

(declare-fun m!796867 () Bool)

(assert (=> b!855133 m!796867))

(declare-fun m!796869 () Bool)

(assert (=> b!855133 m!796869))

(declare-fun m!796871 () Bool)

(assert (=> b!855133 m!796871))

(declare-fun m!796873 () Bool)

(assert (=> b!855133 m!796873))

(declare-fun m!796875 () Bool)

(assert (=> b!855133 m!796875))

(assert (=> b!855133 m!796859))

(assert (=> b!855133 m!796867))

(declare-fun m!796877 () Bool)

(assert (=> b!855133 m!796877))

(assert (=> b!855133 m!796841))

(declare-fun m!796879 () Bool)

(assert (=> mapNonEmpty!26063 m!796879))

(assert (=> b!855126 m!796873))

(assert (=> b!855126 m!796873))

(declare-fun m!796881 () Bool)

(assert (=> b!855126 m!796881))

(declare-fun m!796883 () Bool)

(assert (=> b!855126 m!796883))

(declare-fun m!796885 () Bool)

(assert (=> b!855127 m!796885))

(declare-fun m!796887 () Bool)

(assert (=> start!73426 m!796887))

(declare-fun m!796889 () Bool)

(assert (=> start!73426 m!796889))

(declare-fun m!796891 () Bool)

(assert (=> bm!38416 m!796891))

(declare-fun m!796893 () Bool)

(assert (=> b!855124 m!796893))

(check-sat tp_is_empty!16309 b_and!23517 (not b!855123) (not b!855128) (not b!855124) (not b!855131) (not bm!38417) (not b!855134) (not b!855126) (not start!73426) (not bm!38416) (not b!855133) (not b_lambda!11719) (not b!855132) (not b_next!14173) (not mapNonEmpty!26063))
(check-sat b_and!23517 (not b_next!14173))
