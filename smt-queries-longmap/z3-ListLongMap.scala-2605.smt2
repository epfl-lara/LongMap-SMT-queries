; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39434 () Bool)

(assert start!39434)

(declare-fun b_free!9715 () Bool)

(declare-fun b_next!9715 () Bool)

(assert (=> start!39434 (= b_free!9715 (not b_next!9715))))

(declare-fun tp!34674 () Bool)

(declare-fun b_and!17279 () Bool)

(assert (=> start!39434 (= tp!34674 b_and!17279)))

(declare-fun b!420109 () Bool)

(declare-fun res!245078 () Bool)

(declare-fun e!250234 () Bool)

(assert (=> b!420109 (=> (not res!245078) (not e!250234))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420109 (= res!245078 (validKeyInArray!0 k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15595 0))(
  ( (V!15596 (val!5478 Int)) )
))
(declare-datatypes ((tuple2!7162 0))(
  ( (tuple2!7163 (_1!3592 (_ BitVec 64)) (_2!3592 V!15595)) )
))
(declare-datatypes ((List!7159 0))(
  ( (Nil!7156) (Cons!7155 (h!8011 tuple2!7162) (t!12530 List!7159)) )
))
(declare-datatypes ((ListLongMap!6065 0))(
  ( (ListLongMap!6066 (toList!3048 List!7159)) )
))
(declare-fun call!29299 () ListLongMap!6065)

(declare-datatypes ((ValueCell!5090 0))(
  ( (ValueCellFull!5090 (v!7719 V!15595)) (EmptyCell!5090) )
))
(declare-datatypes ((array!25567 0))(
  ( (array!25568 (arr!12233 (Array (_ BitVec 32) ValueCell!5090)) (size!12586 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25567)

(declare-fun zeroValue!515 () V!15595)

(declare-fun bm!29295 () Bool)

(declare-datatypes ((array!25569 0))(
  ( (array!25570 (arr!12234 (Array (_ BitVec 32) (_ BitVec 64))) (size!12587 (_ BitVec 32))) )
))
(declare-fun lt!192637 () array!25569)

(declare-fun lt!192647 () array!25567)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25569)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15595)

(declare-fun c!55215 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1258 (array!25569 array!25567 (_ BitVec 32) (_ BitVec 32) V!15595 V!15595 (_ BitVec 32) Int) ListLongMap!6065)

(assert (=> bm!29295 (= call!29299 (getCurrentListMapNoExtraKeys!1258 (ite c!55215 lt!192637 _keys!709) (ite c!55215 lt!192647 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420110 () Bool)

(declare-fun res!245070 () Bool)

(assert (=> b!420110 (=> (not res!245070) (not e!250234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420110 (= res!245070 (validMask!0 mask!1025))))

(declare-fun e!250228 () Bool)

(declare-fun v!412 () V!15595)

(declare-fun call!29298 () ListLongMap!6065)

(declare-fun b!420111 () Bool)

(declare-fun +!1273 (ListLongMap!6065 tuple2!7162) ListLongMap!6065)

(assert (=> b!420111 (= e!250228 (= call!29299 (+!1273 call!29298 (tuple2!7163 k0!794 v!412))))))

(declare-fun res!245080 () Bool)

(assert (=> start!39434 (=> (not res!245080) (not e!250234))))

(assert (=> start!39434 (= res!245080 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12587 _keys!709))))))

(assert (=> start!39434 e!250234))

(declare-fun tp_is_empty!10867 () Bool)

(assert (=> start!39434 tp_is_empty!10867))

(assert (=> start!39434 tp!34674))

(assert (=> start!39434 true))

(declare-fun e!250235 () Bool)

(declare-fun array_inv!8960 (array!25567) Bool)

(assert (=> start!39434 (and (array_inv!8960 _values!549) e!250235)))

(declare-fun array_inv!8961 (array!25569) Bool)

(assert (=> start!39434 (array_inv!8961 _keys!709)))

(declare-fun b!420112 () Bool)

(declare-fun res!245076 () Bool)

(declare-fun e!250231 () Bool)

(assert (=> b!420112 (=> (not res!245076) (not e!250231))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420112 (= res!245076 (bvsle from!863 i!563))))

(declare-fun b!420113 () Bool)

(declare-fun e!250233 () Bool)

(assert (=> b!420113 (= e!250233 tp_is_empty!10867)))

(declare-fun b!420114 () Bool)

(declare-fun res!245071 () Bool)

(assert (=> b!420114 (=> (not res!245071) (not e!250234))))

(declare-datatypes ((List!7160 0))(
  ( (Nil!7157) (Cons!7156 (h!8012 (_ BitVec 64)) (t!12531 List!7160)) )
))
(declare-fun arrayNoDuplicates!0 (array!25569 (_ BitVec 32) List!7160) Bool)

(assert (=> b!420114 (= res!245071 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7157))))

(declare-fun b!420115 () Bool)

(assert (=> b!420115 (= e!250234 e!250231)))

(declare-fun res!245082 () Bool)

(assert (=> b!420115 (=> (not res!245082) (not e!250231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25569 (_ BitVec 32)) Bool)

(assert (=> b!420115 (= res!245082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192637 mask!1025))))

(assert (=> b!420115 (= lt!192637 (array!25570 (store (arr!12234 _keys!709) i!563 k0!794) (size!12587 _keys!709)))))

(declare-fun b!420116 () Bool)

(declare-fun e!250236 () Bool)

(declare-fun e!250232 () Bool)

(assert (=> b!420116 (= e!250236 (not e!250232))))

(declare-fun res!245079 () Bool)

(assert (=> b!420116 (=> res!245079 e!250232)))

(assert (=> b!420116 (= res!245079 (validKeyInArray!0 (select (arr!12234 _keys!709) from!863)))))

(assert (=> b!420116 e!250228))

(assert (=> b!420116 (= c!55215 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12390 0))(
  ( (Unit!12391) )
))
(declare-fun lt!192646 () Unit!12390)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!447 (array!25569 array!25567 (_ BitVec 32) (_ BitVec 32) V!15595 V!15595 (_ BitVec 32) (_ BitVec 64) V!15595 (_ BitVec 32) Int) Unit!12390)

(assert (=> b!420116 (= lt!192646 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!447 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420117 () Bool)

(declare-fun mapRes!17922 () Bool)

(assert (=> b!420117 (= e!250235 (and e!250233 mapRes!17922))))

(declare-fun condMapEmpty!17922 () Bool)

(declare-fun mapDefault!17922 () ValueCell!5090)

(assert (=> b!420117 (= condMapEmpty!17922 (= (arr!12233 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5090)) mapDefault!17922)))))

(declare-fun b!420118 () Bool)

(assert (=> b!420118 (= e!250232 true)))

(declare-fun lt!192644 () ListLongMap!6065)

(declare-fun lt!192645 () V!15595)

(declare-fun lt!192639 () tuple2!7162)

(assert (=> b!420118 (= (+!1273 lt!192644 lt!192639) (+!1273 (+!1273 lt!192644 (tuple2!7163 k0!794 lt!192645)) lt!192639))))

(declare-fun lt!192638 () V!15595)

(assert (=> b!420118 (= lt!192639 (tuple2!7163 k0!794 lt!192638))))

(declare-fun lt!192643 () Unit!12390)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!57 (ListLongMap!6065 (_ BitVec 64) V!15595 V!15595) Unit!12390)

(assert (=> b!420118 (= lt!192643 (addSameAsAddTwiceSameKeyDiffValues!57 lt!192644 k0!794 lt!192645 lt!192638))))

(declare-fun lt!192641 () V!15595)

(declare-fun get!6070 (ValueCell!5090 V!15595) V!15595)

(assert (=> b!420118 (= lt!192645 (get!6070 (select (arr!12233 _values!549) from!863) lt!192641))))

(declare-fun lt!192642 () ListLongMap!6065)

(assert (=> b!420118 (= lt!192642 (+!1273 lt!192644 (tuple2!7163 (select (arr!12234 lt!192637) from!863) lt!192638)))))

(assert (=> b!420118 (= lt!192638 (get!6070 (select (store (arr!12233 _values!549) i!563 (ValueCellFull!5090 v!412)) from!863) lt!192641))))

(declare-fun dynLambda!714 (Int (_ BitVec 64)) V!15595)

(assert (=> b!420118 (= lt!192641 (dynLambda!714 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420118 (= lt!192644 (getCurrentListMapNoExtraKeys!1258 lt!192637 lt!192647 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420119 () Bool)

(declare-fun res!245075 () Bool)

(assert (=> b!420119 (=> (not res!245075) (not e!250234))))

(assert (=> b!420119 (= res!245075 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12587 _keys!709))))))

(declare-fun b!420120 () Bool)

(declare-fun e!250230 () Bool)

(assert (=> b!420120 (= e!250230 tp_is_empty!10867)))

(declare-fun b!420121 () Bool)

(assert (=> b!420121 (= e!250231 e!250236)))

(declare-fun res!245081 () Bool)

(assert (=> b!420121 (=> (not res!245081) (not e!250236))))

(assert (=> b!420121 (= res!245081 (= from!863 i!563))))

(assert (=> b!420121 (= lt!192642 (getCurrentListMapNoExtraKeys!1258 lt!192637 lt!192647 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420121 (= lt!192647 (array!25568 (store (arr!12233 _values!549) i!563 (ValueCellFull!5090 v!412)) (size!12586 _values!549)))))

(declare-fun lt!192640 () ListLongMap!6065)

(assert (=> b!420121 (= lt!192640 (getCurrentListMapNoExtraKeys!1258 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!17922 () Bool)

(declare-fun tp!34673 () Bool)

(assert (=> mapNonEmpty!17922 (= mapRes!17922 (and tp!34673 e!250230))))

(declare-fun mapKey!17922 () (_ BitVec 32))

(declare-fun mapRest!17922 () (Array (_ BitVec 32) ValueCell!5090))

(declare-fun mapValue!17922 () ValueCell!5090)

(assert (=> mapNonEmpty!17922 (= (arr!12233 _values!549) (store mapRest!17922 mapKey!17922 mapValue!17922))))

(declare-fun b!420122 () Bool)

(declare-fun res!245069 () Bool)

(assert (=> b!420122 (=> (not res!245069) (not e!250234))))

(assert (=> b!420122 (= res!245069 (or (= (select (arr!12234 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12234 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29296 () Bool)

(assert (=> bm!29296 (= call!29298 (getCurrentListMapNoExtraKeys!1258 (ite c!55215 _keys!709 lt!192637) (ite c!55215 _values!549 lt!192647) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420123 () Bool)

(declare-fun res!245072 () Bool)

(assert (=> b!420123 (=> (not res!245072) (not e!250234))))

(declare-fun arrayContainsKey!0 (array!25569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420123 (= res!245072 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!420124 () Bool)

(assert (=> b!420124 (= e!250228 (= call!29298 call!29299))))

(declare-fun b!420125 () Bool)

(declare-fun res!245073 () Bool)

(assert (=> b!420125 (=> (not res!245073) (not e!250231))))

(assert (=> b!420125 (= res!245073 (arrayNoDuplicates!0 lt!192637 #b00000000000000000000000000000000 Nil!7157))))

(declare-fun b!420126 () Bool)

(declare-fun res!245074 () Bool)

(assert (=> b!420126 (=> (not res!245074) (not e!250234))))

(assert (=> b!420126 (= res!245074 (and (= (size!12586 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12587 _keys!709) (size!12586 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17922 () Bool)

(assert (=> mapIsEmpty!17922 mapRes!17922))

(declare-fun b!420127 () Bool)

(declare-fun res!245077 () Bool)

(assert (=> b!420127 (=> (not res!245077) (not e!250234))))

(assert (=> b!420127 (= res!245077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39434 res!245080) b!420110))

(assert (= (and b!420110 res!245070) b!420126))

(assert (= (and b!420126 res!245074) b!420127))

(assert (= (and b!420127 res!245077) b!420114))

(assert (= (and b!420114 res!245071) b!420119))

(assert (= (and b!420119 res!245075) b!420109))

(assert (= (and b!420109 res!245078) b!420122))

(assert (= (and b!420122 res!245069) b!420123))

(assert (= (and b!420123 res!245072) b!420115))

(assert (= (and b!420115 res!245082) b!420125))

(assert (= (and b!420125 res!245073) b!420112))

(assert (= (and b!420112 res!245076) b!420121))

(assert (= (and b!420121 res!245081) b!420116))

(assert (= (and b!420116 c!55215) b!420111))

(assert (= (and b!420116 (not c!55215)) b!420124))

(assert (= (or b!420111 b!420124) bm!29295))

(assert (= (or b!420111 b!420124) bm!29296))

(assert (= (and b!420116 (not res!245079)) b!420118))

(assert (= (and b!420117 condMapEmpty!17922) mapIsEmpty!17922))

(assert (= (and b!420117 (not condMapEmpty!17922)) mapNonEmpty!17922))

(get-info :version)

(assert (= (and mapNonEmpty!17922 ((_ is ValueCellFull!5090) mapValue!17922)) b!420120))

(assert (= (and b!420117 ((_ is ValueCellFull!5090) mapDefault!17922)) b!420113))

(assert (= start!39434 b!420117))

(declare-fun b_lambda!9001 () Bool)

(assert (=> (not b_lambda!9001) (not b!420118)))

(declare-fun t!12529 () Bool)

(declare-fun tb!3329 () Bool)

(assert (=> (and start!39434 (= defaultEntry!557 defaultEntry!557) t!12529) tb!3329))

(declare-fun result!6193 () Bool)

(assert (=> tb!3329 (= result!6193 tp_is_empty!10867)))

(assert (=> b!420118 t!12529))

(declare-fun b_and!17281 () Bool)

(assert (= b_and!17279 (and (=> t!12529 result!6193) b_and!17281)))

(declare-fun m!409263 () Bool)

(assert (=> bm!29296 m!409263))

(declare-fun m!409265 () Bool)

(assert (=> start!39434 m!409265))

(declare-fun m!409267 () Bool)

(assert (=> start!39434 m!409267))

(declare-fun m!409269 () Bool)

(assert (=> b!420118 m!409269))

(declare-fun m!409271 () Bool)

(assert (=> b!420118 m!409271))

(declare-fun m!409273 () Bool)

(assert (=> b!420118 m!409273))

(declare-fun m!409275 () Bool)

(assert (=> b!420118 m!409275))

(declare-fun m!409277 () Bool)

(assert (=> b!420118 m!409277))

(declare-fun m!409279 () Bool)

(assert (=> b!420118 m!409279))

(declare-fun m!409281 () Bool)

(assert (=> b!420118 m!409281))

(declare-fun m!409283 () Bool)

(assert (=> b!420118 m!409283))

(declare-fun m!409285 () Bool)

(assert (=> b!420118 m!409285))

(declare-fun m!409287 () Bool)

(assert (=> b!420118 m!409287))

(declare-fun m!409289 () Bool)

(assert (=> b!420118 m!409289))

(declare-fun m!409291 () Bool)

(assert (=> b!420118 m!409291))

(assert (=> b!420118 m!409271))

(assert (=> b!420118 m!409283))

(declare-fun m!409293 () Bool)

(assert (=> b!420118 m!409293))

(assert (=> b!420118 m!409285))

(declare-fun m!409295 () Bool)

(assert (=> b!420110 m!409295))

(declare-fun m!409297 () Bool)

(assert (=> b!420114 m!409297))

(declare-fun m!409299 () Bool)

(assert (=> bm!29295 m!409299))

(declare-fun m!409301 () Bool)

(assert (=> b!420125 m!409301))

(declare-fun m!409303 () Bool)

(assert (=> b!420115 m!409303))

(declare-fun m!409305 () Bool)

(assert (=> b!420115 m!409305))

(declare-fun m!409307 () Bool)

(assert (=> b!420109 m!409307))

(declare-fun m!409309 () Bool)

(assert (=> mapNonEmpty!17922 m!409309))

(declare-fun m!409311 () Bool)

(assert (=> b!420127 m!409311))

(declare-fun m!409313 () Bool)

(assert (=> b!420123 m!409313))

(declare-fun m!409315 () Bool)

(assert (=> b!420111 m!409315))

(declare-fun m!409317 () Bool)

(assert (=> b!420122 m!409317))

(declare-fun m!409319 () Bool)

(assert (=> b!420121 m!409319))

(assert (=> b!420121 m!409289))

(declare-fun m!409321 () Bool)

(assert (=> b!420121 m!409321))

(declare-fun m!409323 () Bool)

(assert (=> b!420116 m!409323))

(assert (=> b!420116 m!409323))

(declare-fun m!409325 () Bool)

(assert (=> b!420116 m!409325))

(declare-fun m!409327 () Bool)

(assert (=> b!420116 m!409327))

(check-sat tp_is_empty!10867 (not b!420111) (not b!420114) (not b_next!9715) (not b!420121) (not b!420110) (not start!39434) (not b!420109) (not b!420127) (not b!420118) (not b!420115) (not mapNonEmpty!17922) (not bm!29296) b_and!17281 (not bm!29295) (not b!420116) (not b_lambda!9001) (not b!420125) (not b!420123))
(check-sat b_and!17281 (not b_next!9715))
