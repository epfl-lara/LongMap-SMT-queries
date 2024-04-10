; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39504 () Bool)

(assert start!39504)

(declare-fun b_free!9771 () Bool)

(declare-fun b_next!9771 () Bool)

(assert (=> start!39504 (= b_free!9771 (not b_next!9771))))

(declare-fun tp!34841 () Bool)

(declare-fun b_and!17417 () Bool)

(assert (=> start!39504 (= tp!34841 b_and!17417)))

(declare-fun b!422032 () Bool)

(declare-fun e!251161 () Bool)

(assert (=> b!422032 (= e!251161 true)))

(declare-datatypes ((V!15669 0))(
  ( (V!15670 (val!5506 Int)) )
))
(declare-fun lt!193800 () V!15669)

(declare-datatypes ((tuple2!7226 0))(
  ( (tuple2!7227 (_1!3624 (_ BitVec 64)) (_2!3624 V!15669)) )
))
(declare-datatypes ((List!7231 0))(
  ( (Nil!7228) (Cons!7227 (h!8083 tuple2!7226) (t!12667 List!7231)) )
))
(declare-datatypes ((ListLongMap!6139 0))(
  ( (ListLongMap!6140 (toList!3085 List!7231)) )
))
(declare-fun lt!193805 () ListLongMap!6139)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!193795 () tuple2!7226)

(declare-fun +!1280 (ListLongMap!6139 tuple2!7226) ListLongMap!6139)

(assert (=> b!422032 (= (+!1280 lt!193805 lt!193795) (+!1280 (+!1280 lt!193805 (tuple2!7227 k0!794 lt!193800)) lt!193795))))

(declare-fun lt!193802 () V!15669)

(assert (=> b!422032 (= lt!193795 (tuple2!7227 k0!794 lt!193802))))

(declare-datatypes ((Unit!12462 0))(
  ( (Unit!12463) )
))
(declare-fun lt!193798 () Unit!12462)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!73 (ListLongMap!6139 (_ BitVec 64) V!15669 V!15669) Unit!12462)

(assert (=> b!422032 (= lt!193798 (addSameAsAddTwiceSameKeyDiffValues!73 lt!193805 k0!794 lt!193800 lt!193802))))

(declare-fun lt!193803 () V!15669)

(declare-datatypes ((ValueCell!5118 0))(
  ( (ValueCellFull!5118 (v!7753 V!15669)) (EmptyCell!5118) )
))
(declare-datatypes ((array!25693 0))(
  ( (array!25694 (arr!12296 (Array (_ BitVec 32) ValueCell!5118)) (size!12648 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25693)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun get!6115 (ValueCell!5118 V!15669) V!15669)

(assert (=> b!422032 (= lt!193800 (get!6115 (select (arr!12296 _values!549) from!863) lt!193803))))

(declare-fun lt!193799 () ListLongMap!6139)

(declare-datatypes ((array!25695 0))(
  ( (array!25696 (arr!12297 (Array (_ BitVec 32) (_ BitVec 64))) (size!12649 (_ BitVec 32))) )
))
(declare-fun lt!193796 () array!25695)

(assert (=> b!422032 (= lt!193799 (+!1280 lt!193805 (tuple2!7227 (select (arr!12297 lt!193796) from!863) lt!193802)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15669)

(assert (=> b!422032 (= lt!193802 (get!6115 (select (store (arr!12296 _values!549) i!563 (ValueCellFull!5118 v!412)) from!863) lt!193803))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!744 (Int (_ BitVec 64)) V!15669)

(assert (=> b!422032 (= lt!193803 (dynLambda!744 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15669)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15669)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!193804 () array!25693)

(declare-fun getCurrentListMapNoExtraKeys!1289 (array!25695 array!25693 (_ BitVec 32) (_ BitVec 32) V!15669 V!15669 (_ BitVec 32) Int) ListLongMap!6139)

(assert (=> b!422032 (= lt!193805 (getCurrentListMapNoExtraKeys!1289 lt!193796 lt!193804 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422033 () Bool)

(declare-fun e!251158 () Bool)

(assert (=> b!422033 (= e!251158 (not e!251161))))

(declare-fun res!246386 () Bool)

(assert (=> b!422033 (=> res!246386 e!251161)))

(declare-fun _keys!709 () array!25695)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422033 (= res!246386 (validKeyInArray!0 (select (arr!12297 _keys!709) from!863)))))

(declare-fun e!251159 () Bool)

(assert (=> b!422033 e!251159))

(declare-fun c!55370 () Bool)

(assert (=> b!422033 (= c!55370 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193801 () Unit!12462)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!476 (array!25695 array!25693 (_ BitVec 32) (_ BitVec 32) V!15669 V!15669 (_ BitVec 32) (_ BitVec 64) V!15669 (_ BitVec 32) Int) Unit!12462)

(assert (=> b!422033 (= lt!193801 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!476 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422034 () Bool)

(declare-fun e!251160 () Bool)

(declare-fun tp_is_empty!10923 () Bool)

(assert (=> b!422034 (= e!251160 tp_is_empty!10923)))

(declare-fun b!422035 () Bool)

(declare-fun res!246385 () Bool)

(declare-fun e!251165 () Bool)

(assert (=> b!422035 (=> (not res!246385) (not e!251165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25695 (_ BitVec 32)) Bool)

(assert (=> b!422035 (= res!246385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422036 () Bool)

(declare-fun e!251162 () Bool)

(assert (=> b!422036 (= e!251162 e!251158)))

(declare-fun res!246375 () Bool)

(assert (=> b!422036 (=> (not res!246375) (not e!251158))))

(assert (=> b!422036 (= res!246375 (= from!863 i!563))))

(assert (=> b!422036 (= lt!193799 (getCurrentListMapNoExtraKeys!1289 lt!193796 lt!193804 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!422036 (= lt!193804 (array!25694 (store (arr!12296 _values!549) i!563 (ValueCellFull!5118 v!412)) (size!12648 _values!549)))))

(declare-fun lt!193797 () ListLongMap!6139)

(assert (=> b!422036 (= lt!193797 (getCurrentListMapNoExtraKeys!1289 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!246377 () Bool)

(assert (=> start!39504 (=> (not res!246377) (not e!251165))))

(assert (=> start!39504 (= res!246377 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12649 _keys!709))))))

(assert (=> start!39504 e!251165))

(assert (=> start!39504 tp_is_empty!10923))

(assert (=> start!39504 tp!34841))

(assert (=> start!39504 true))

(declare-fun e!251163 () Bool)

(declare-fun array_inv!8958 (array!25693) Bool)

(assert (=> start!39504 (and (array_inv!8958 _values!549) e!251163)))

(declare-fun array_inv!8959 (array!25695) Bool)

(assert (=> start!39504 (array_inv!8959 _keys!709)))

(declare-fun b!422037 () Bool)

(declare-fun res!246382 () Bool)

(assert (=> b!422037 (=> (not res!246382) (not e!251165))))

(assert (=> b!422037 (= res!246382 (validKeyInArray!0 k0!794))))

(declare-fun b!422038 () Bool)

(declare-fun res!246378 () Bool)

(assert (=> b!422038 (=> (not res!246378) (not e!251165))))

(declare-datatypes ((List!7232 0))(
  ( (Nil!7229) (Cons!7228 (h!8084 (_ BitVec 64)) (t!12668 List!7232)) )
))
(declare-fun arrayNoDuplicates!0 (array!25695 (_ BitVec 32) List!7232) Bool)

(assert (=> b!422038 (= res!246378 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7229))))

(declare-fun mapNonEmpty!18006 () Bool)

(declare-fun mapRes!18006 () Bool)

(declare-fun tp!34842 () Bool)

(assert (=> mapNonEmpty!18006 (= mapRes!18006 (and tp!34842 e!251160))))

(declare-fun mapKey!18006 () (_ BitVec 32))

(declare-fun mapRest!18006 () (Array (_ BitVec 32) ValueCell!5118))

(declare-fun mapValue!18006 () ValueCell!5118)

(assert (=> mapNonEmpty!18006 (= (arr!12296 _values!549) (store mapRest!18006 mapKey!18006 mapValue!18006))))

(declare-fun bm!29488 () Bool)

(declare-fun call!29492 () ListLongMap!6139)

(assert (=> bm!29488 (= call!29492 (getCurrentListMapNoExtraKeys!1289 (ite c!55370 _keys!709 lt!193796) (ite c!55370 _values!549 lt!193804) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422039 () Bool)

(declare-fun call!29491 () ListLongMap!6139)

(assert (=> b!422039 (= e!251159 (= call!29492 call!29491))))

(declare-fun b!422040 () Bool)

(declare-fun res!246383 () Bool)

(assert (=> b!422040 (=> (not res!246383) (not e!251165))))

(assert (=> b!422040 (= res!246383 (or (= (select (arr!12297 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12297 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422041 () Bool)

(declare-fun e!251164 () Bool)

(assert (=> b!422041 (= e!251163 (and e!251164 mapRes!18006))))

(declare-fun condMapEmpty!18006 () Bool)

(declare-fun mapDefault!18006 () ValueCell!5118)

(assert (=> b!422041 (= condMapEmpty!18006 (= (arr!12296 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5118)) mapDefault!18006)))))

(declare-fun mapIsEmpty!18006 () Bool)

(assert (=> mapIsEmpty!18006 mapRes!18006))

(declare-fun b!422042 () Bool)

(declare-fun res!246374 () Bool)

(assert (=> b!422042 (=> (not res!246374) (not e!251165))))

(assert (=> b!422042 (= res!246374 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12649 _keys!709))))))

(declare-fun b!422043 () Bool)

(declare-fun res!246379 () Bool)

(assert (=> b!422043 (=> (not res!246379) (not e!251165))))

(assert (=> b!422043 (= res!246379 (and (= (size!12648 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12649 _keys!709) (size!12648 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!29489 () Bool)

(assert (=> bm!29489 (= call!29491 (getCurrentListMapNoExtraKeys!1289 (ite c!55370 lt!193796 _keys!709) (ite c!55370 lt!193804 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422044 () Bool)

(assert (=> b!422044 (= e!251164 tp_is_empty!10923)))

(declare-fun b!422045 () Bool)

(declare-fun res!246384 () Bool)

(assert (=> b!422045 (=> (not res!246384) (not e!251162))))

(assert (=> b!422045 (= res!246384 (arrayNoDuplicates!0 lt!193796 #b00000000000000000000000000000000 Nil!7229))))

(declare-fun b!422046 () Bool)

(declare-fun res!246387 () Bool)

(assert (=> b!422046 (=> (not res!246387) (not e!251165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422046 (= res!246387 (validMask!0 mask!1025))))

(declare-fun b!422047 () Bool)

(assert (=> b!422047 (= e!251159 (= call!29491 (+!1280 call!29492 (tuple2!7227 k0!794 v!412))))))

(declare-fun b!422048 () Bool)

(declare-fun res!246376 () Bool)

(assert (=> b!422048 (=> (not res!246376) (not e!251165))))

(declare-fun arrayContainsKey!0 (array!25695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422048 (= res!246376 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422049 () Bool)

(declare-fun res!246381 () Bool)

(assert (=> b!422049 (=> (not res!246381) (not e!251162))))

(assert (=> b!422049 (= res!246381 (bvsle from!863 i!563))))

(declare-fun b!422050 () Bool)

(assert (=> b!422050 (= e!251165 e!251162)))

(declare-fun res!246380 () Bool)

(assert (=> b!422050 (=> (not res!246380) (not e!251162))))

(assert (=> b!422050 (= res!246380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193796 mask!1025))))

(assert (=> b!422050 (= lt!193796 (array!25696 (store (arr!12297 _keys!709) i!563 k0!794) (size!12649 _keys!709)))))

(assert (= (and start!39504 res!246377) b!422046))

(assert (= (and b!422046 res!246387) b!422043))

(assert (= (and b!422043 res!246379) b!422035))

(assert (= (and b!422035 res!246385) b!422038))

(assert (= (and b!422038 res!246378) b!422042))

(assert (= (and b!422042 res!246374) b!422037))

(assert (= (and b!422037 res!246382) b!422040))

(assert (= (and b!422040 res!246383) b!422048))

(assert (= (and b!422048 res!246376) b!422050))

(assert (= (and b!422050 res!246380) b!422045))

(assert (= (and b!422045 res!246384) b!422049))

(assert (= (and b!422049 res!246381) b!422036))

(assert (= (and b!422036 res!246375) b!422033))

(assert (= (and b!422033 c!55370) b!422047))

(assert (= (and b!422033 (not c!55370)) b!422039))

(assert (= (or b!422047 b!422039) bm!29489))

(assert (= (or b!422047 b!422039) bm!29488))

(assert (= (and b!422033 (not res!246386)) b!422032))

(assert (= (and b!422041 condMapEmpty!18006) mapIsEmpty!18006))

(assert (= (and b!422041 (not condMapEmpty!18006)) mapNonEmpty!18006))

(get-info :version)

(assert (= (and mapNonEmpty!18006 ((_ is ValueCellFull!5118) mapValue!18006)) b!422034))

(assert (= (and b!422041 ((_ is ValueCellFull!5118) mapDefault!18006)) b!422044))

(assert (= start!39504 b!422041))

(declare-fun b_lambda!9075 () Bool)

(assert (=> (not b_lambda!9075) (not b!422032)))

(declare-fun t!12666 () Bool)

(declare-fun tb!3393 () Bool)

(assert (=> (and start!39504 (= defaultEntry!557 defaultEntry!557) t!12666) tb!3393))

(declare-fun result!6313 () Bool)

(assert (=> tb!3393 (= result!6313 tp_is_empty!10923)))

(assert (=> b!422032 t!12666))

(declare-fun b_and!17419 () Bool)

(assert (= b_and!17417 (and (=> t!12666 result!6313) b_and!17419)))

(declare-fun m!411843 () Bool)

(assert (=> bm!29489 m!411843))

(declare-fun m!411845 () Bool)

(assert (=> b!422045 m!411845))

(declare-fun m!411847 () Bool)

(assert (=> b!422040 m!411847))

(declare-fun m!411849 () Bool)

(assert (=> b!422037 m!411849))

(declare-fun m!411851 () Bool)

(assert (=> b!422046 m!411851))

(declare-fun m!411853 () Bool)

(assert (=> start!39504 m!411853))

(declare-fun m!411855 () Bool)

(assert (=> start!39504 m!411855))

(declare-fun m!411857 () Bool)

(assert (=> b!422038 m!411857))

(declare-fun m!411859 () Bool)

(assert (=> mapNonEmpty!18006 m!411859))

(declare-fun m!411861 () Bool)

(assert (=> b!422033 m!411861))

(assert (=> b!422033 m!411861))

(declare-fun m!411863 () Bool)

(assert (=> b!422033 m!411863))

(declare-fun m!411865 () Bool)

(assert (=> b!422033 m!411865))

(declare-fun m!411867 () Bool)

(assert (=> b!422050 m!411867))

(declare-fun m!411869 () Bool)

(assert (=> b!422050 m!411869))

(declare-fun m!411871 () Bool)

(assert (=> b!422047 m!411871))

(declare-fun m!411873 () Bool)

(assert (=> b!422035 m!411873))

(declare-fun m!411875 () Bool)

(assert (=> b!422032 m!411875))

(declare-fun m!411877 () Bool)

(assert (=> b!422032 m!411877))

(declare-fun m!411879 () Bool)

(assert (=> b!422032 m!411879))

(declare-fun m!411881 () Bool)

(assert (=> b!422032 m!411881))

(declare-fun m!411883 () Bool)

(assert (=> b!422032 m!411883))

(declare-fun m!411885 () Bool)

(assert (=> b!422032 m!411885))

(declare-fun m!411887 () Bool)

(assert (=> b!422032 m!411887))

(declare-fun m!411889 () Bool)

(assert (=> b!422032 m!411889))

(assert (=> b!422032 m!411877))

(declare-fun m!411891 () Bool)

(assert (=> b!422032 m!411891))

(assert (=> b!422032 m!411887))

(declare-fun m!411893 () Bool)

(assert (=> b!422032 m!411893))

(declare-fun m!411895 () Bool)

(assert (=> b!422032 m!411895))

(declare-fun m!411897 () Bool)

(assert (=> b!422032 m!411897))

(assert (=> b!422032 m!411891))

(declare-fun m!411899 () Bool)

(assert (=> b!422032 m!411899))

(declare-fun m!411901 () Bool)

(assert (=> b!422048 m!411901))

(declare-fun m!411903 () Bool)

(assert (=> b!422036 m!411903))

(assert (=> b!422036 m!411883))

(declare-fun m!411905 () Bool)

(assert (=> b!422036 m!411905))

(declare-fun m!411907 () Bool)

(assert (=> bm!29488 m!411907))

(check-sat (not bm!29489) (not bm!29488) (not start!39504) (not b!422036) (not b!422033) (not b!422035) (not b!422048) (not b_lambda!9075) b_and!17419 (not b_next!9771) (not b!422047) (not b!422032) (not b!422038) (not mapNonEmpty!18006) (not b!422045) tp_is_empty!10923 (not b!422037) (not b!422046) (not b!422050))
(check-sat b_and!17419 (not b_next!9771))
