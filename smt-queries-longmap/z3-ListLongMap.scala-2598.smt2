; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39392 () Bool)

(assert start!39392)

(declare-fun b_free!9673 () Bool)

(declare-fun b_next!9673 () Bool)

(assert (=> start!39392 (= b_free!9673 (not b_next!9673))))

(declare-fun tp!34547 () Bool)

(declare-fun b_and!17235 () Bool)

(assert (=> start!39392 (= tp!34547 b_and!17235)))

(declare-fun mapIsEmpty!17859 () Bool)

(declare-fun mapRes!17859 () Bool)

(assert (=> mapIsEmpty!17859 mapRes!17859))

(declare-fun b!419092 () Bool)

(declare-fun res!244322 () Bool)

(declare-fun e!249810 () Bool)

(assert (=> b!419092 (=> (not res!244322) (not e!249810))))

(declare-datatypes ((array!25508 0))(
  ( (array!25509 (arr!12203 (Array (_ BitVec 32) (_ BitVec 64))) (size!12555 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25508)

(declare-datatypes ((List!7030 0))(
  ( (Nil!7027) (Cons!7026 (h!7882 (_ BitVec 64)) (t!12360 List!7030)) )
))
(declare-fun arrayNoDuplicates!0 (array!25508 (_ BitVec 32) List!7030) Bool)

(assert (=> b!419092 (= res!244322 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7027))))

(declare-fun b!419093 () Bool)

(declare-fun res!244320 () Bool)

(assert (=> b!419093 (=> (not res!244320) (not e!249810))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15539 0))(
  ( (V!15540 (val!5457 Int)) )
))
(declare-datatypes ((ValueCell!5069 0))(
  ( (ValueCellFull!5069 (v!7705 V!15539)) (EmptyCell!5069) )
))
(declare-datatypes ((array!25510 0))(
  ( (array!25511 (arr!12204 (Array (_ BitVec 32) ValueCell!5069)) (size!12556 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25510)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!419093 (= res!244320 (and (= (size!12556 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12555 _keys!709) (size!12556 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419094 () Bool)

(declare-fun e!249809 () Bool)

(declare-fun e!249806 () Bool)

(assert (=> b!419094 (= e!249809 e!249806)))

(declare-fun res!244321 () Bool)

(assert (=> b!419094 (=> (not res!244321) (not e!249806))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419094 (= res!244321 (= from!863 i!563))))

(declare-fun lt!192206 () array!25508)

(declare-fun minValue!515 () V!15539)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7018 0))(
  ( (tuple2!7019 (_1!3520 (_ BitVec 64)) (_2!3520 V!15539)) )
))
(declare-datatypes ((List!7031 0))(
  ( (Nil!7028) (Cons!7027 (h!7883 tuple2!7018) (t!12361 List!7031)) )
))
(declare-datatypes ((ListLongMap!5933 0))(
  ( (ListLongMap!5934 (toList!2982 List!7031)) )
))
(declare-fun lt!192200 () ListLongMap!5933)

(declare-fun zeroValue!515 () V!15539)

(declare-fun lt!192204 () array!25510)

(declare-fun getCurrentListMapNoExtraKeys!1228 (array!25508 array!25510 (_ BitVec 32) (_ BitVec 32) V!15539 V!15539 (_ BitVec 32) Int) ListLongMap!5933)

(assert (=> b!419094 (= lt!192200 (getCurrentListMapNoExtraKeys!1228 lt!192206 lt!192204 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15539)

(assert (=> b!419094 (= lt!192204 (array!25511 (store (arr!12204 _values!549) i!563 (ValueCellFull!5069 v!412)) (size!12556 _values!549)))))

(declare-fun lt!192202 () ListLongMap!5933)

(assert (=> b!419094 (= lt!192202 (getCurrentListMapNoExtraKeys!1228 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419095 () Bool)

(declare-fun res!244325 () Bool)

(assert (=> b!419095 (=> (not res!244325) (not e!249810))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419095 (= res!244325 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun call!29185 () ListLongMap!5933)

(declare-fun c!55200 () Bool)

(declare-fun bm!29181 () Bool)

(assert (=> bm!29181 (= call!29185 (getCurrentListMapNoExtraKeys!1228 (ite c!55200 _keys!709 lt!192206) (ite c!55200 _values!549 lt!192204) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!244317 () Bool)

(assert (=> start!39392 (=> (not res!244317) (not e!249810))))

(assert (=> start!39392 (= res!244317 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12555 _keys!709))))))

(assert (=> start!39392 e!249810))

(declare-fun tp_is_empty!10825 () Bool)

(assert (=> start!39392 tp_is_empty!10825))

(assert (=> start!39392 tp!34547))

(assert (=> start!39392 true))

(declare-fun e!249811 () Bool)

(declare-fun array_inv!8972 (array!25510) Bool)

(assert (=> start!39392 (and (array_inv!8972 _values!549) e!249811)))

(declare-fun array_inv!8973 (array!25508) Bool)

(assert (=> start!39392 (array_inv!8973 _keys!709)))

(declare-fun b!419096 () Bool)

(declare-fun res!244324 () Bool)

(assert (=> b!419096 (=> (not res!244324) (not e!249809))))

(assert (=> b!419096 (= res!244324 (arrayNoDuplicates!0 lt!192206 #b00000000000000000000000000000000 Nil!7027))))

(declare-fun b!419097 () Bool)

(declare-fun res!244326 () Bool)

(assert (=> b!419097 (=> (not res!244326) (not e!249809))))

(assert (=> b!419097 (= res!244326 (bvsle from!863 i!563))))

(declare-fun b!419098 () Bool)

(declare-fun e!249805 () Bool)

(assert (=> b!419098 (= e!249805 true)))

(declare-fun lt!192203 () ListLongMap!5933)

(declare-fun lt!192198 () V!15539)

(declare-fun lt!192197 () tuple2!7018)

(declare-fun +!1247 (ListLongMap!5933 tuple2!7018) ListLongMap!5933)

(assert (=> b!419098 (= (+!1247 lt!192203 lt!192197) (+!1247 (+!1247 lt!192203 (tuple2!7019 k0!794 lt!192198)) lt!192197))))

(declare-fun lt!192201 () V!15539)

(assert (=> b!419098 (= lt!192197 (tuple2!7019 k0!794 lt!192201))))

(declare-datatypes ((Unit!12365 0))(
  ( (Unit!12366) )
))
(declare-fun lt!192199 () Unit!12365)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!37 (ListLongMap!5933 (_ BitVec 64) V!15539 V!15539) Unit!12365)

(assert (=> b!419098 (= lt!192199 (addSameAsAddTwiceSameKeyDiffValues!37 lt!192203 k0!794 lt!192198 lt!192201))))

(declare-fun lt!192207 () V!15539)

(declare-fun get!6049 (ValueCell!5069 V!15539) V!15539)

(assert (=> b!419098 (= lt!192198 (get!6049 (select (arr!12204 _values!549) from!863) lt!192207))))

(assert (=> b!419098 (= lt!192200 (+!1247 lt!192203 (tuple2!7019 (select (arr!12203 lt!192206) from!863) lt!192201)))))

(assert (=> b!419098 (= lt!192201 (get!6049 (select (store (arr!12204 _values!549) i!563 (ValueCellFull!5069 v!412)) from!863) lt!192207))))

(declare-fun dynLambda!704 (Int (_ BitVec 64)) V!15539)

(assert (=> b!419098 (= lt!192207 (dynLambda!704 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419098 (= lt!192203 (getCurrentListMapNoExtraKeys!1228 lt!192206 lt!192204 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419099 () Bool)

(declare-fun res!244314 () Bool)

(assert (=> b!419099 (=> (not res!244314) (not e!249810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419099 (= res!244314 (validMask!0 mask!1025))))

(declare-fun b!419100 () Bool)

(declare-fun e!249808 () Bool)

(assert (=> b!419100 (= e!249808 tp_is_empty!10825)))

(declare-fun b!419101 () Bool)

(declare-fun e!249803 () Bool)

(declare-fun call!29184 () ListLongMap!5933)

(assert (=> b!419101 (= e!249803 (= call!29185 call!29184))))

(declare-fun b!419102 () Bool)

(assert (=> b!419102 (= e!249806 (not e!249805))))

(declare-fun res!244319 () Bool)

(assert (=> b!419102 (=> res!244319 e!249805)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419102 (= res!244319 (validKeyInArray!0 (select (arr!12203 _keys!709) from!863)))))

(assert (=> b!419102 e!249803))

(assert (=> b!419102 (= c!55200 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!192205 () Unit!12365)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!439 (array!25508 array!25510 (_ BitVec 32) (_ BitVec 32) V!15539 V!15539 (_ BitVec 32) (_ BitVec 64) V!15539 (_ BitVec 32) Int) Unit!12365)

(assert (=> b!419102 (= lt!192205 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!439 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419103 () Bool)

(declare-fun e!249807 () Bool)

(assert (=> b!419103 (= e!249807 tp_is_empty!10825)))

(declare-fun bm!29182 () Bool)

(assert (=> bm!29182 (= call!29184 (getCurrentListMapNoExtraKeys!1228 (ite c!55200 lt!192206 _keys!709) (ite c!55200 lt!192204 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17859 () Bool)

(declare-fun tp!34548 () Bool)

(assert (=> mapNonEmpty!17859 (= mapRes!17859 (and tp!34548 e!249808))))

(declare-fun mapValue!17859 () ValueCell!5069)

(declare-fun mapRest!17859 () (Array (_ BitVec 32) ValueCell!5069))

(declare-fun mapKey!17859 () (_ BitVec 32))

(assert (=> mapNonEmpty!17859 (= (arr!12204 _values!549) (store mapRest!17859 mapKey!17859 mapValue!17859))))

(declare-fun b!419104 () Bool)

(assert (=> b!419104 (= e!249811 (and e!249807 mapRes!17859))))

(declare-fun condMapEmpty!17859 () Bool)

(declare-fun mapDefault!17859 () ValueCell!5069)

(assert (=> b!419104 (= condMapEmpty!17859 (= (arr!12204 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5069)) mapDefault!17859)))))

(declare-fun b!419105 () Bool)

(declare-fun res!244316 () Bool)

(assert (=> b!419105 (=> (not res!244316) (not e!249810))))

(assert (=> b!419105 (= res!244316 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12555 _keys!709))))))

(declare-fun b!419106 () Bool)

(declare-fun res!244323 () Bool)

(assert (=> b!419106 (=> (not res!244323) (not e!249810))))

(assert (=> b!419106 (= res!244323 (or (= (select (arr!12203 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12203 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419107 () Bool)

(assert (=> b!419107 (= e!249803 (= call!29184 (+!1247 call!29185 (tuple2!7019 k0!794 v!412))))))

(declare-fun b!419108 () Bool)

(declare-fun res!244318 () Bool)

(assert (=> b!419108 (=> (not res!244318) (not e!249810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25508 (_ BitVec 32)) Bool)

(assert (=> b!419108 (= res!244318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419109 () Bool)

(assert (=> b!419109 (= e!249810 e!249809)))

(declare-fun res!244313 () Bool)

(assert (=> b!419109 (=> (not res!244313) (not e!249809))))

(assert (=> b!419109 (= res!244313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192206 mask!1025))))

(assert (=> b!419109 (= lt!192206 (array!25509 (store (arr!12203 _keys!709) i!563 k0!794) (size!12555 _keys!709)))))

(declare-fun b!419110 () Bool)

(declare-fun res!244315 () Bool)

(assert (=> b!419110 (=> (not res!244315) (not e!249810))))

(assert (=> b!419110 (= res!244315 (validKeyInArray!0 k0!794))))

(assert (= (and start!39392 res!244317) b!419099))

(assert (= (and b!419099 res!244314) b!419093))

(assert (= (and b!419093 res!244320) b!419108))

(assert (= (and b!419108 res!244318) b!419092))

(assert (= (and b!419092 res!244322) b!419105))

(assert (= (and b!419105 res!244316) b!419110))

(assert (= (and b!419110 res!244315) b!419106))

(assert (= (and b!419106 res!244323) b!419095))

(assert (= (and b!419095 res!244325) b!419109))

(assert (= (and b!419109 res!244313) b!419096))

(assert (= (and b!419096 res!244324) b!419097))

(assert (= (and b!419097 res!244326) b!419094))

(assert (= (and b!419094 res!244321) b!419102))

(assert (= (and b!419102 c!55200) b!419107))

(assert (= (and b!419102 (not c!55200)) b!419101))

(assert (= (or b!419107 b!419101) bm!29182))

(assert (= (or b!419107 b!419101) bm!29181))

(assert (= (and b!419102 (not res!244319)) b!419098))

(assert (= (and b!419104 condMapEmpty!17859) mapIsEmpty!17859))

(assert (= (and b!419104 (not condMapEmpty!17859)) mapNonEmpty!17859))

(get-info :version)

(assert (= (and mapNonEmpty!17859 ((_ is ValueCellFull!5069) mapValue!17859)) b!419100))

(assert (= (and b!419104 ((_ is ValueCellFull!5069) mapDefault!17859)) b!419103))

(assert (= start!39392 b!419104))

(declare-fun b_lambda!8999 () Bool)

(assert (=> (not b_lambda!8999) (not b!419098)))

(declare-fun t!12359 () Bool)

(declare-fun tb!3287 () Bool)

(assert (=> (and start!39392 (= defaultEntry!557 defaultEntry!557) t!12359) tb!3287))

(declare-fun result!6109 () Bool)

(assert (=> tb!3287 (= result!6109 tp_is_empty!10825)))

(assert (=> b!419098 t!12359))

(declare-fun b_and!17237 () Bool)

(assert (= b_and!17235 (and (=> t!12359 result!6109) b_and!17237)))

(declare-fun m!408833 () Bool)

(assert (=> bm!29181 m!408833))

(declare-fun m!408835 () Bool)

(assert (=> b!419094 m!408835))

(declare-fun m!408837 () Bool)

(assert (=> b!419094 m!408837))

(declare-fun m!408839 () Bool)

(assert (=> b!419094 m!408839))

(declare-fun m!408841 () Bool)

(assert (=> b!419096 m!408841))

(declare-fun m!408843 () Bool)

(assert (=> b!419107 m!408843))

(declare-fun m!408845 () Bool)

(assert (=> bm!29182 m!408845))

(declare-fun m!408847 () Bool)

(assert (=> b!419098 m!408847))

(declare-fun m!408849 () Bool)

(assert (=> b!419098 m!408849))

(declare-fun m!408851 () Bool)

(assert (=> b!419098 m!408851))

(declare-fun m!408853 () Bool)

(assert (=> b!419098 m!408853))

(declare-fun m!408855 () Bool)

(assert (=> b!419098 m!408855))

(assert (=> b!419098 m!408851))

(declare-fun m!408857 () Bool)

(assert (=> b!419098 m!408857))

(declare-fun m!408859 () Bool)

(assert (=> b!419098 m!408859))

(assert (=> b!419098 m!408837))

(declare-fun m!408861 () Bool)

(assert (=> b!419098 m!408861))

(assert (=> b!419098 m!408853))

(declare-fun m!408863 () Bool)

(assert (=> b!419098 m!408863))

(declare-fun m!408865 () Bool)

(assert (=> b!419098 m!408865))

(declare-fun m!408867 () Bool)

(assert (=> b!419098 m!408867))

(assert (=> b!419098 m!408865))

(declare-fun m!408869 () Bool)

(assert (=> b!419098 m!408869))

(declare-fun m!408871 () Bool)

(assert (=> b!419092 m!408871))

(declare-fun m!408873 () Bool)

(assert (=> b!419108 m!408873))

(declare-fun m!408875 () Bool)

(assert (=> b!419106 m!408875))

(declare-fun m!408877 () Bool)

(assert (=> start!39392 m!408877))

(declare-fun m!408879 () Bool)

(assert (=> start!39392 m!408879))

(declare-fun m!408881 () Bool)

(assert (=> b!419102 m!408881))

(assert (=> b!419102 m!408881))

(declare-fun m!408883 () Bool)

(assert (=> b!419102 m!408883))

(declare-fun m!408885 () Bool)

(assert (=> b!419102 m!408885))

(declare-fun m!408887 () Bool)

(assert (=> mapNonEmpty!17859 m!408887))

(declare-fun m!408889 () Bool)

(assert (=> b!419109 m!408889))

(declare-fun m!408891 () Bool)

(assert (=> b!419109 m!408891))

(declare-fun m!408893 () Bool)

(assert (=> b!419110 m!408893))

(declare-fun m!408895 () Bool)

(assert (=> b!419099 m!408895))

(declare-fun m!408897 () Bool)

(assert (=> b!419095 m!408897))

(check-sat (not b!419110) (not b!419107) (not b!419102) (not b!419092) (not b!419099) (not b!419108) (not bm!29181) b_and!17237 (not bm!29182) tp_is_empty!10825 (not b!419096) (not b_next!9673) (not b!419098) (not b!419109) (not start!39392) (not mapNonEmpty!17859) (not b!419094) (not b_lambda!8999) (not b!419095))
(check-sat b_and!17237 (not b_next!9673))
