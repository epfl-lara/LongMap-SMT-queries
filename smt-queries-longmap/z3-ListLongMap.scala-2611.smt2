; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39486 () Bool)

(assert start!39486)

(declare-fun b_free!9753 () Bool)

(declare-fun b_next!9753 () Bool)

(assert (=> start!39486 (= b_free!9753 (not b_next!9753))))

(declare-fun tp!34788 () Bool)

(declare-fun b_and!17381 () Bool)

(assert (=> start!39486 (= tp!34788 b_and!17381)))

(declare-fun b!421501 () Bool)

(declare-fun e!250915 () Bool)

(declare-fun tp_is_empty!10905 () Bool)

(assert (=> b!421501 (= e!250915 tp_is_empty!10905)))

(declare-fun b!421502 () Bool)

(declare-fun e!250918 () Bool)

(declare-fun mapRes!17979 () Bool)

(assert (=> b!421502 (= e!250918 (and e!250915 mapRes!17979))))

(declare-fun condMapEmpty!17979 () Bool)

(declare-datatypes ((V!15645 0))(
  ( (V!15646 (val!5497 Int)) )
))
(declare-datatypes ((ValueCell!5109 0))(
  ( (ValueCellFull!5109 (v!7744 V!15645)) (EmptyCell!5109) )
))
(declare-datatypes ((array!25657 0))(
  ( (array!25658 (arr!12278 (Array (_ BitVec 32) ValueCell!5109)) (size!12630 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25657)

(declare-fun mapDefault!17979 () ValueCell!5109)

(assert (=> b!421502 (= condMapEmpty!17979 (= (arr!12278 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5109)) mapDefault!17979)))))

(declare-fun b!421503 () Bool)

(declare-fun res!246007 () Bool)

(declare-fun e!250921 () Bool)

(assert (=> b!421503 (=> (not res!246007) (not e!250921))))

(declare-datatypes ((array!25659 0))(
  ( (array!25660 (arr!12279 (Array (_ BitVec 32) (_ BitVec 64))) (size!12631 (_ BitVec 32))) )
))
(declare-fun lt!193506 () array!25659)

(declare-datatypes ((List!7214 0))(
  ( (Nil!7211) (Cons!7210 (h!8066 (_ BitVec 64)) (t!12632 List!7214)) )
))
(declare-fun arrayNoDuplicates!0 (array!25659 (_ BitVec 32) List!7214) Bool)

(assert (=> b!421503 (= res!246007 (arrayNoDuplicates!0 lt!193506 #b00000000000000000000000000000000 Nil!7211))))

(declare-fun b!421504 () Bool)

(declare-fun e!250917 () Bool)

(assert (=> b!421504 (= e!250917 e!250921)))

(declare-fun res!246002 () Bool)

(assert (=> b!421504 (=> (not res!246002) (not e!250921))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25659 (_ BitVec 32)) Bool)

(assert (=> b!421504 (= res!246002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193506 mask!1025))))

(declare-fun _keys!709 () array!25659)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421504 (= lt!193506 (array!25660 (store (arr!12279 _keys!709) i!563 k0!794) (size!12631 _keys!709)))))

(declare-fun mapNonEmpty!17979 () Bool)

(declare-fun tp!34787 () Bool)

(declare-fun e!250920 () Bool)

(assert (=> mapNonEmpty!17979 (= mapRes!17979 (and tp!34787 e!250920))))

(declare-fun mapValue!17979 () ValueCell!5109)

(declare-fun mapKey!17979 () (_ BitVec 32))

(declare-fun mapRest!17979 () (Array (_ BitVec 32) ValueCell!5109))

(assert (=> mapNonEmpty!17979 (= (arr!12278 _values!549) (store mapRest!17979 mapKey!17979 mapValue!17979))))

(declare-fun b!421505 () Bool)

(declare-fun e!250922 () Bool)

(declare-fun e!250923 () Bool)

(assert (=> b!421505 (= e!250922 (not e!250923))))

(declare-fun res!246003 () Bool)

(assert (=> b!421505 (=> res!246003 e!250923)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421505 (= res!246003 (validKeyInArray!0 (select (arr!12279 _keys!709) from!863)))))

(declare-fun e!250916 () Bool)

(assert (=> b!421505 e!250916))

(declare-fun c!55343 () Bool)

(assert (=> b!421505 (= c!55343 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15645)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15645)

(declare-datatypes ((Unit!12444 0))(
  ( (Unit!12445) )
))
(declare-fun lt!193503 () Unit!12444)

(declare-fun v!412 () V!15645)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!468 (array!25659 array!25657 (_ BitVec 32) (_ BitVec 32) V!15645 V!15645 (_ BitVec 32) (_ BitVec 64) V!15645 (_ BitVec 32) Int) Unit!12444)

(assert (=> b!421505 (= lt!193503 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!468 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421506 () Bool)

(declare-datatypes ((tuple2!7208 0))(
  ( (tuple2!7209 (_1!3615 (_ BitVec 64)) (_2!3615 V!15645)) )
))
(declare-datatypes ((List!7215 0))(
  ( (Nil!7212) (Cons!7211 (h!8067 tuple2!7208) (t!12633 List!7215)) )
))
(declare-datatypes ((ListLongMap!6121 0))(
  ( (ListLongMap!6122 (toList!3076 List!7215)) )
))
(declare-fun call!29438 () ListLongMap!6121)

(declare-fun call!29437 () ListLongMap!6121)

(assert (=> b!421506 (= e!250916 (= call!29438 call!29437))))

(declare-fun b!421507 () Bool)

(declare-fun res!245999 () Bool)

(assert (=> b!421507 (=> (not res!245999) (not e!250917))))

(assert (=> b!421507 (= res!245999 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7211))))

(declare-fun mapIsEmpty!17979 () Bool)

(assert (=> mapIsEmpty!17979 mapRes!17979))

(declare-fun b!421508 () Bool)

(declare-fun res!246008 () Bool)

(assert (=> b!421508 (=> (not res!246008) (not e!250917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421508 (= res!246008 (validMask!0 mask!1025))))

(declare-fun b!421509 () Bool)

(declare-fun res!245996 () Bool)

(assert (=> b!421509 (=> (not res!245996) (not e!250917))))

(assert (=> b!421509 (= res!245996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421510 () Bool)

(declare-fun +!1271 (ListLongMap!6121 tuple2!7208) ListLongMap!6121)

(assert (=> b!421510 (= e!250916 (= call!29437 (+!1271 call!29438 (tuple2!7209 k0!794 v!412))))))

(declare-fun b!421511 () Bool)

(declare-fun res!246001 () Bool)

(assert (=> b!421511 (=> (not res!246001) (not e!250917))))

(assert (=> b!421511 (= res!246001 (or (= (select (arr!12279 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12279 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421512 () Bool)

(assert (=> b!421512 (= e!250920 tp_is_empty!10905)))

(declare-fun res!245998 () Bool)

(assert (=> start!39486 (=> (not res!245998) (not e!250917))))

(assert (=> start!39486 (= res!245998 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12631 _keys!709))))))

(assert (=> start!39486 e!250917))

(assert (=> start!39486 tp_is_empty!10905))

(assert (=> start!39486 tp!34788))

(assert (=> start!39486 true))

(declare-fun array_inv!8944 (array!25657) Bool)

(assert (=> start!39486 (and (array_inv!8944 _values!549) e!250918)))

(declare-fun array_inv!8945 (array!25659) Bool)

(assert (=> start!39486 (array_inv!8945 _keys!709)))

(declare-fun b!421513 () Bool)

(assert (=> b!421513 (= e!250921 e!250922)))

(declare-fun res!246005 () Bool)

(assert (=> b!421513 (=> (not res!246005) (not e!250922))))

(assert (=> b!421513 (= res!246005 (= from!863 i!563))))

(declare-fun lt!193498 () array!25657)

(declare-fun lt!193499 () ListLongMap!6121)

(declare-fun getCurrentListMapNoExtraKeys!1280 (array!25659 array!25657 (_ BitVec 32) (_ BitVec 32) V!15645 V!15645 (_ BitVec 32) Int) ListLongMap!6121)

(assert (=> b!421513 (= lt!193499 (getCurrentListMapNoExtraKeys!1280 lt!193506 lt!193498 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421513 (= lt!193498 (array!25658 (store (arr!12278 _values!549) i!563 (ValueCellFull!5109 v!412)) (size!12630 _values!549)))))

(declare-fun lt!193505 () ListLongMap!6121)

(assert (=> b!421513 (= lt!193505 (getCurrentListMapNoExtraKeys!1280 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!29434 () Bool)

(assert (=> bm!29434 (= call!29437 (getCurrentListMapNoExtraKeys!1280 (ite c!55343 lt!193506 _keys!709) (ite c!55343 lt!193498 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421514 () Bool)

(declare-fun res!246004 () Bool)

(assert (=> b!421514 (=> (not res!246004) (not e!250917))))

(assert (=> b!421514 (= res!246004 (and (= (size!12630 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12631 _keys!709) (size!12630 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421515 () Bool)

(declare-fun res!246006 () Bool)

(assert (=> b!421515 (=> (not res!246006) (not e!250917))))

(declare-fun arrayContainsKey!0 (array!25659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421515 (= res!246006 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421516 () Bool)

(declare-fun res!245997 () Bool)

(assert (=> b!421516 (=> (not res!245997) (not e!250917))))

(assert (=> b!421516 (= res!245997 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12631 _keys!709))))))

(declare-fun b!421517 () Bool)

(declare-fun res!246000 () Bool)

(assert (=> b!421517 (=> (not res!246000) (not e!250917))))

(assert (=> b!421517 (= res!246000 (validKeyInArray!0 k0!794))))

(declare-fun b!421518 () Bool)

(declare-fun res!246009 () Bool)

(assert (=> b!421518 (=> (not res!246009) (not e!250921))))

(assert (=> b!421518 (= res!246009 (bvsle from!863 i!563))))

(declare-fun bm!29435 () Bool)

(assert (=> bm!29435 (= call!29438 (getCurrentListMapNoExtraKeys!1280 (ite c!55343 _keys!709 lt!193506) (ite c!55343 _values!549 lt!193498) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421519 () Bool)

(assert (=> b!421519 (= e!250923 true)))

(declare-fun lt!193508 () V!15645)

(declare-fun lt!193504 () ListLongMap!6121)

(declare-fun lt!193507 () tuple2!7208)

(assert (=> b!421519 (= (+!1271 lt!193504 lt!193507) (+!1271 (+!1271 lt!193504 (tuple2!7209 k0!794 lt!193508)) lt!193507))))

(declare-fun lt!193502 () V!15645)

(assert (=> b!421519 (= lt!193507 (tuple2!7209 k0!794 lt!193502))))

(declare-fun lt!193501 () Unit!12444)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!65 (ListLongMap!6121 (_ BitVec 64) V!15645 V!15645) Unit!12444)

(assert (=> b!421519 (= lt!193501 (addSameAsAddTwiceSameKeyDiffValues!65 lt!193504 k0!794 lt!193508 lt!193502))))

(declare-fun lt!193500 () V!15645)

(declare-fun get!6101 (ValueCell!5109 V!15645) V!15645)

(assert (=> b!421519 (= lt!193508 (get!6101 (select (arr!12278 _values!549) from!863) lt!193500))))

(assert (=> b!421519 (= lt!193499 (+!1271 lt!193504 (tuple2!7209 (select (arr!12279 lt!193506) from!863) lt!193502)))))

(assert (=> b!421519 (= lt!193502 (get!6101 (select (store (arr!12278 _values!549) i!563 (ValueCellFull!5109 v!412)) from!863) lt!193500))))

(declare-fun dynLambda!736 (Int (_ BitVec 64)) V!15645)

(assert (=> b!421519 (= lt!193500 (dynLambda!736 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!421519 (= lt!193504 (getCurrentListMapNoExtraKeys!1280 lt!193506 lt!193498 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39486 res!245998) b!421508))

(assert (= (and b!421508 res!246008) b!421514))

(assert (= (and b!421514 res!246004) b!421509))

(assert (= (and b!421509 res!245996) b!421507))

(assert (= (and b!421507 res!245999) b!421516))

(assert (= (and b!421516 res!245997) b!421517))

(assert (= (and b!421517 res!246000) b!421511))

(assert (= (and b!421511 res!246001) b!421515))

(assert (= (and b!421515 res!246006) b!421504))

(assert (= (and b!421504 res!246002) b!421503))

(assert (= (and b!421503 res!246007) b!421518))

(assert (= (and b!421518 res!246009) b!421513))

(assert (= (and b!421513 res!246005) b!421505))

(assert (= (and b!421505 c!55343) b!421510))

(assert (= (and b!421505 (not c!55343)) b!421506))

(assert (= (or b!421510 b!421506) bm!29434))

(assert (= (or b!421510 b!421506) bm!29435))

(assert (= (and b!421505 (not res!246003)) b!421519))

(assert (= (and b!421502 condMapEmpty!17979) mapIsEmpty!17979))

(assert (= (and b!421502 (not condMapEmpty!17979)) mapNonEmpty!17979))

(get-info :version)

(assert (= (and mapNonEmpty!17979 ((_ is ValueCellFull!5109) mapValue!17979)) b!421512))

(assert (= (and b!421502 ((_ is ValueCellFull!5109) mapDefault!17979)) b!421501))

(assert (= start!39486 b!421502))

(declare-fun b_lambda!9057 () Bool)

(assert (=> (not b_lambda!9057) (not b!421519)))

(declare-fun t!12631 () Bool)

(declare-fun tb!3375 () Bool)

(assert (=> (and start!39486 (= defaultEntry!557 defaultEntry!557) t!12631) tb!3375))

(declare-fun result!6277 () Bool)

(assert (=> tb!3375 (= result!6277 tp_is_empty!10905)))

(assert (=> b!421519 t!12631))

(declare-fun b_and!17383 () Bool)

(assert (= b_and!17381 (and (=> t!12631 result!6277) b_and!17383)))

(declare-fun m!411251 () Bool)

(assert (=> b!421505 m!411251))

(assert (=> b!421505 m!411251))

(declare-fun m!411253 () Bool)

(assert (=> b!421505 m!411253))

(declare-fun m!411255 () Bool)

(assert (=> b!421505 m!411255))

(declare-fun m!411257 () Bool)

(assert (=> b!421503 m!411257))

(declare-fun m!411259 () Bool)

(assert (=> mapNonEmpty!17979 m!411259))

(declare-fun m!411261 () Bool)

(assert (=> b!421510 m!411261))

(declare-fun m!411263 () Bool)

(assert (=> b!421507 m!411263))

(declare-fun m!411265 () Bool)

(assert (=> start!39486 m!411265))

(declare-fun m!411267 () Bool)

(assert (=> start!39486 m!411267))

(declare-fun m!411269 () Bool)

(assert (=> bm!29434 m!411269))

(declare-fun m!411271 () Bool)

(assert (=> b!421515 m!411271))

(declare-fun m!411273 () Bool)

(assert (=> b!421504 m!411273))

(declare-fun m!411275 () Bool)

(assert (=> b!421504 m!411275))

(declare-fun m!411277 () Bool)

(assert (=> b!421517 m!411277))

(declare-fun m!411279 () Bool)

(assert (=> b!421509 m!411279))

(declare-fun m!411281 () Bool)

(assert (=> b!421513 m!411281))

(declare-fun m!411283 () Bool)

(assert (=> b!421513 m!411283))

(declare-fun m!411285 () Bool)

(assert (=> b!421513 m!411285))

(declare-fun m!411287 () Bool)

(assert (=> bm!29435 m!411287))

(declare-fun m!411289 () Bool)

(assert (=> b!421508 m!411289))

(declare-fun m!411291 () Bool)

(assert (=> b!421511 m!411291))

(declare-fun m!411293 () Bool)

(assert (=> b!421519 m!411293))

(declare-fun m!411295 () Bool)

(assert (=> b!421519 m!411295))

(declare-fun m!411297 () Bool)

(assert (=> b!421519 m!411297))

(declare-fun m!411299 () Bool)

(assert (=> b!421519 m!411299))

(declare-fun m!411301 () Bool)

(assert (=> b!421519 m!411301))

(declare-fun m!411303 () Bool)

(assert (=> b!421519 m!411303))

(declare-fun m!411305 () Bool)

(assert (=> b!421519 m!411305))

(assert (=> b!421519 m!411283))

(declare-fun m!411307 () Bool)

(assert (=> b!421519 m!411307))

(declare-fun m!411309 () Bool)

(assert (=> b!421519 m!411309))

(declare-fun m!411311 () Bool)

(assert (=> b!421519 m!411311))

(assert (=> b!421519 m!411299))

(declare-fun m!411313 () Bool)

(assert (=> b!421519 m!411313))

(assert (=> b!421519 m!411307))

(declare-fun m!411315 () Bool)

(assert (=> b!421519 m!411315))

(assert (=> b!421519 m!411295))

(check-sat (not b_lambda!9057) (not b!421510) (not start!39486) (not b!421509) (not bm!29434) (not bm!29435) b_and!17383 (not b!421503) (not b!421504) (not b!421507) (not b!421515) (not b!421517) tp_is_empty!10905 (not b!421508) (not b!421505) (not b!421519) (not mapNonEmpty!17979) (not b!421513) (not b_next!9753))
(check-sat b_and!17383 (not b_next!9753))
