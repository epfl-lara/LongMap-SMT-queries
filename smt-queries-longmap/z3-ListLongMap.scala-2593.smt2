; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39362 () Bool)

(assert start!39362)

(declare-fun b_free!9643 () Bool)

(declare-fun b_next!9643 () Bool)

(assert (=> start!39362 (= b_free!9643 (not b_next!9643))))

(declare-fun tp!34458 () Bool)

(declare-fun b_and!17135 () Bool)

(assert (=> start!39362 (= tp!34458 b_and!17135)))

(declare-fun res!243564 () Bool)

(declare-fun e!249260 () Bool)

(assert (=> start!39362 (=> (not res!243564) (not e!249260))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25429 0))(
  ( (array!25430 (arr!12164 (Array (_ BitVec 32) (_ BitVec 64))) (size!12517 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25429)

(assert (=> start!39362 (= res!243564 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12517 _keys!709))))))

(assert (=> start!39362 e!249260))

(declare-fun tp_is_empty!10795 () Bool)

(assert (=> start!39362 tp_is_empty!10795))

(assert (=> start!39362 tp!34458))

(assert (=> start!39362 true))

(declare-datatypes ((V!15499 0))(
  ( (V!15500 (val!5442 Int)) )
))
(declare-datatypes ((ValueCell!5054 0))(
  ( (ValueCellFull!5054 (v!7683 V!15499)) (EmptyCell!5054) )
))
(declare-datatypes ((array!25431 0))(
  ( (array!25432 (arr!12165 (Array (_ BitVec 32) ValueCell!5054)) (size!12518 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25431)

(declare-fun e!249259 () Bool)

(declare-fun array_inv!8914 (array!25431) Bool)

(assert (=> start!39362 (and (array_inv!8914 _values!549) e!249259)))

(declare-fun array_inv!8915 (array!25429) Bool)

(assert (=> start!39362 (array_inv!8915 _keys!709)))

(declare-fun b!417985 () Bool)

(declare-fun res!243557 () Bool)

(assert (=> b!417985 (=> (not res!243557) (not e!249260))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!417985 (= res!243557 (and (= (size!12518 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12517 _keys!709) (size!12518 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!417986 () Bool)

(declare-fun res!243560 () Bool)

(assert (=> b!417986 (=> (not res!243560) (not e!249260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25429 (_ BitVec 32)) Bool)

(assert (=> b!417986 (= res!243560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417987 () Bool)

(declare-fun res!243570 () Bool)

(declare-fun e!249264 () Bool)

(assert (=> b!417987 (=> (not res!243570) (not e!249264))))

(declare-fun lt!191451 () array!25429)

(declare-datatypes ((List!7095 0))(
  ( (Nil!7092) (Cons!7091 (h!7947 (_ BitVec 64)) (t!12394 List!7095)) )
))
(declare-fun arrayNoDuplicates!0 (array!25429 (_ BitVec 32) List!7095) Bool)

(assert (=> b!417987 (= res!243570 (arrayNoDuplicates!0 lt!191451 #b00000000000000000000000000000000 Nil!7092))))

(declare-fun b!417988 () Bool)

(declare-fun res!243569 () Bool)

(assert (=> b!417988 (=> (not res!243569) (not e!249260))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417988 (= res!243569 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12517 _keys!709))))))

(declare-fun b!417989 () Bool)

(declare-fun e!249263 () Bool)

(declare-fun e!249257 () Bool)

(assert (=> b!417989 (= e!249263 (not e!249257))))

(declare-fun res!243558 () Bool)

(assert (=> b!417989 (=> res!243558 e!249257)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417989 (= res!243558 (validKeyInArray!0 (select (arr!12164 _keys!709) from!863)))))

(declare-fun e!249256 () Bool)

(assert (=> b!417989 e!249256))

(declare-fun c!55107 () Bool)

(assert (=> b!417989 (= c!55107 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15499)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15499)

(declare-fun v!412 () V!15499)

(declare-datatypes ((Unit!12328 0))(
  ( (Unit!12329) )
))
(declare-fun lt!191459 () Unit!12328)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!420 (array!25429 array!25431 (_ BitVec 32) (_ BitVec 32) V!15499 V!15499 (_ BitVec 32) (_ BitVec 64) V!15499 (_ BitVec 32) Int) Unit!12328)

(assert (=> b!417989 (= lt!191459 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!420 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417990 () Bool)

(declare-fun res!243561 () Bool)

(assert (=> b!417990 (=> (not res!243561) (not e!249264))))

(assert (=> b!417990 (= res!243561 (bvsle from!863 i!563))))

(declare-fun b!417991 () Bool)

(declare-fun e!249258 () Bool)

(declare-fun mapRes!17814 () Bool)

(assert (=> b!417991 (= e!249259 (and e!249258 mapRes!17814))))

(declare-fun condMapEmpty!17814 () Bool)

(declare-fun mapDefault!17814 () ValueCell!5054)

(assert (=> b!417991 (= condMapEmpty!17814 (= (arr!12165 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5054)) mapDefault!17814)))))

(declare-fun b!417992 () Bool)

(declare-fun res!243563 () Bool)

(assert (=> b!417992 (=> (not res!243563) (not e!249260))))

(assert (=> b!417992 (= res!243563 (or (= (select (arr!12164 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12164 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417993 () Bool)

(declare-fun res!243565 () Bool)

(assert (=> b!417993 (=> (not res!243565) (not e!249260))))

(assert (=> b!417993 (= res!243565 (validKeyInArray!0 k0!794))))

(declare-fun b!417994 () Bool)

(declare-datatypes ((tuple2!7096 0))(
  ( (tuple2!7097 (_1!3559 (_ BitVec 64)) (_2!3559 V!15499)) )
))
(declare-datatypes ((List!7096 0))(
  ( (Nil!7093) (Cons!7092 (h!7948 tuple2!7096) (t!12395 List!7096)) )
))
(declare-datatypes ((ListLongMap!5999 0))(
  ( (ListLongMap!6000 (toList!3015 List!7096)) )
))
(declare-fun call!29082 () ListLongMap!5999)

(declare-fun call!29083 () ListLongMap!5999)

(assert (=> b!417994 (= e!249256 (= call!29082 call!29083))))

(declare-fun mapIsEmpty!17814 () Bool)

(assert (=> mapIsEmpty!17814 mapRes!17814))

(declare-fun b!417995 () Bool)

(declare-fun res!243566 () Bool)

(assert (=> b!417995 (=> (not res!243566) (not e!249260))))

(declare-fun arrayContainsKey!0 (array!25429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417995 (= res!243566 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417996 () Bool)

(assert (=> b!417996 (= e!249257 true)))

(declare-fun lt!191449 () tuple2!7096)

(declare-fun lt!191450 () V!15499)

(declare-fun lt!191454 () ListLongMap!5999)

(declare-fun +!1244 (ListLongMap!5999 tuple2!7096) ListLongMap!5999)

(assert (=> b!417996 (= (+!1244 lt!191454 lt!191449) (+!1244 (+!1244 lt!191454 (tuple2!7097 k0!794 lt!191450)) lt!191449))))

(declare-fun lt!191458 () V!15499)

(assert (=> b!417996 (= lt!191449 (tuple2!7097 k0!794 lt!191458))))

(declare-fun lt!191455 () Unit!12328)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!31 (ListLongMap!5999 (_ BitVec 64) V!15499 V!15499) Unit!12328)

(assert (=> b!417996 (= lt!191455 (addSameAsAddTwiceSameKeyDiffValues!31 lt!191454 k0!794 lt!191450 lt!191458))))

(declare-fun lt!191457 () V!15499)

(declare-fun get!6020 (ValueCell!5054 V!15499) V!15499)

(assert (=> b!417996 (= lt!191450 (get!6020 (select (arr!12165 _values!549) from!863) lt!191457))))

(declare-fun lt!191452 () ListLongMap!5999)

(assert (=> b!417996 (= lt!191452 (+!1244 lt!191454 (tuple2!7097 (select (arr!12164 lt!191451) from!863) lt!191458)))))

(assert (=> b!417996 (= lt!191458 (get!6020 (select (store (arr!12165 _values!549) i!563 (ValueCellFull!5054 v!412)) from!863) lt!191457))))

(declare-fun dynLambda!688 (Int (_ BitVec 64)) V!15499)

(assert (=> b!417996 (= lt!191457 (dynLambda!688 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!191453 () array!25431)

(declare-fun getCurrentListMapNoExtraKeys!1226 (array!25429 array!25431 (_ BitVec 32) (_ BitVec 32) V!15499 V!15499 (_ BitVec 32) Int) ListLongMap!5999)

(assert (=> b!417996 (= lt!191454 (getCurrentListMapNoExtraKeys!1226 lt!191451 lt!191453 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417997 () Bool)

(assert (=> b!417997 (= e!249258 tp_is_empty!10795)))

(declare-fun bm!29079 () Bool)

(assert (=> bm!29079 (= call!29082 (getCurrentListMapNoExtraKeys!1226 (ite c!55107 _keys!709 lt!191451) (ite c!55107 _values!549 lt!191453) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417998 () Bool)

(assert (=> b!417998 (= e!249264 e!249263)))

(declare-fun res!243568 () Bool)

(assert (=> b!417998 (=> (not res!243568) (not e!249263))))

(assert (=> b!417998 (= res!243568 (= from!863 i!563))))

(assert (=> b!417998 (= lt!191452 (getCurrentListMapNoExtraKeys!1226 lt!191451 lt!191453 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417998 (= lt!191453 (array!25432 (store (arr!12165 _values!549) i!563 (ValueCellFull!5054 v!412)) (size!12518 _values!549)))))

(declare-fun lt!191456 () ListLongMap!5999)

(assert (=> b!417998 (= lt!191456 (getCurrentListMapNoExtraKeys!1226 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!17814 () Bool)

(declare-fun tp!34457 () Bool)

(declare-fun e!249262 () Bool)

(assert (=> mapNonEmpty!17814 (= mapRes!17814 (and tp!34457 e!249262))))

(declare-fun mapRest!17814 () (Array (_ BitVec 32) ValueCell!5054))

(declare-fun mapKey!17814 () (_ BitVec 32))

(declare-fun mapValue!17814 () ValueCell!5054)

(assert (=> mapNonEmpty!17814 (= (arr!12165 _values!549) (store mapRest!17814 mapKey!17814 mapValue!17814))))

(declare-fun b!417999 () Bool)

(assert (=> b!417999 (= e!249262 tp_is_empty!10795)))

(declare-fun b!418000 () Bool)

(assert (=> b!418000 (= e!249260 e!249264)))

(declare-fun res!243562 () Bool)

(assert (=> b!418000 (=> (not res!243562) (not e!249264))))

(assert (=> b!418000 (= res!243562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191451 mask!1025))))

(assert (=> b!418000 (= lt!191451 (array!25430 (store (arr!12164 _keys!709) i!563 k0!794) (size!12517 _keys!709)))))

(declare-fun b!418001 () Bool)

(declare-fun res!243567 () Bool)

(assert (=> b!418001 (=> (not res!243567) (not e!249260))))

(assert (=> b!418001 (= res!243567 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7092))))

(declare-fun b!418002 () Bool)

(declare-fun res!243559 () Bool)

(assert (=> b!418002 (=> (not res!243559) (not e!249260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418002 (= res!243559 (validMask!0 mask!1025))))

(declare-fun b!418003 () Bool)

(assert (=> b!418003 (= e!249256 (= call!29083 (+!1244 call!29082 (tuple2!7097 k0!794 v!412))))))

(declare-fun bm!29080 () Bool)

(assert (=> bm!29080 (= call!29083 (getCurrentListMapNoExtraKeys!1226 (ite c!55107 lt!191451 _keys!709) (ite c!55107 lt!191453 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39362 res!243564) b!418002))

(assert (= (and b!418002 res!243559) b!417985))

(assert (= (and b!417985 res!243557) b!417986))

(assert (= (and b!417986 res!243560) b!418001))

(assert (= (and b!418001 res!243567) b!417988))

(assert (= (and b!417988 res!243569) b!417993))

(assert (= (and b!417993 res!243565) b!417992))

(assert (= (and b!417992 res!243563) b!417995))

(assert (= (and b!417995 res!243566) b!418000))

(assert (= (and b!418000 res!243562) b!417987))

(assert (= (and b!417987 res!243570) b!417990))

(assert (= (and b!417990 res!243561) b!417998))

(assert (= (and b!417998 res!243568) b!417989))

(assert (= (and b!417989 c!55107) b!418003))

(assert (= (and b!417989 (not c!55107)) b!417994))

(assert (= (or b!418003 b!417994) bm!29080))

(assert (= (or b!418003 b!417994) bm!29079))

(assert (= (and b!417989 (not res!243558)) b!417996))

(assert (= (and b!417991 condMapEmpty!17814) mapIsEmpty!17814))

(assert (= (and b!417991 (not condMapEmpty!17814)) mapNonEmpty!17814))

(get-info :version)

(assert (= (and mapNonEmpty!17814 ((_ is ValueCellFull!5054) mapValue!17814)) b!417999))

(assert (= (and b!417991 ((_ is ValueCellFull!5054) mapDefault!17814)) b!417997))

(assert (= start!39362 b!417991))

(declare-fun b_lambda!8929 () Bool)

(assert (=> (not b_lambda!8929) (not b!417996)))

(declare-fun t!12393 () Bool)

(declare-fun tb!3257 () Bool)

(assert (=> (and start!39362 (= defaultEntry!557 defaultEntry!557) t!12393) tb!3257))

(declare-fun result!6049 () Bool)

(assert (=> tb!3257 (= result!6049 tp_is_empty!10795)))

(assert (=> b!417996 t!12393))

(declare-fun b_and!17137 () Bool)

(assert (= b_and!17135 (and (=> t!12393 result!6049) b_and!17137)))

(declare-fun m!406893 () Bool)

(assert (=> bm!29079 m!406893))

(declare-fun m!406895 () Bool)

(assert (=> b!417993 m!406895))

(declare-fun m!406897 () Bool)

(assert (=> b!417995 m!406897))

(declare-fun m!406899 () Bool)

(assert (=> b!417996 m!406899))

(declare-fun m!406901 () Bool)

(assert (=> b!417996 m!406901))

(declare-fun m!406903 () Bool)

(assert (=> b!417996 m!406903))

(declare-fun m!406905 () Bool)

(assert (=> b!417996 m!406905))

(declare-fun m!406907 () Bool)

(assert (=> b!417996 m!406907))

(declare-fun m!406909 () Bool)

(assert (=> b!417996 m!406909))

(declare-fun m!406911 () Bool)

(assert (=> b!417996 m!406911))

(assert (=> b!417996 m!406909))

(declare-fun m!406913 () Bool)

(assert (=> b!417996 m!406913))

(declare-fun m!406915 () Bool)

(assert (=> b!417996 m!406915))

(assert (=> b!417996 m!406913))

(declare-fun m!406917 () Bool)

(assert (=> b!417996 m!406917))

(declare-fun m!406919 () Bool)

(assert (=> b!417996 m!406919))

(declare-fun m!406921 () Bool)

(assert (=> b!417996 m!406921))

(assert (=> b!417996 m!406921))

(declare-fun m!406923 () Bool)

(assert (=> b!417996 m!406923))

(declare-fun m!406925 () Bool)

(assert (=> start!39362 m!406925))

(declare-fun m!406927 () Bool)

(assert (=> start!39362 m!406927))

(declare-fun m!406929 () Bool)

(assert (=> b!417987 m!406929))

(declare-fun m!406931 () Bool)

(assert (=> b!417998 m!406931))

(assert (=> b!417998 m!406905))

(declare-fun m!406933 () Bool)

(assert (=> b!417998 m!406933))

(declare-fun m!406935 () Bool)

(assert (=> b!417986 m!406935))

(declare-fun m!406937 () Bool)

(assert (=> bm!29080 m!406937))

(declare-fun m!406939 () Bool)

(assert (=> mapNonEmpty!17814 m!406939))

(declare-fun m!406941 () Bool)

(assert (=> b!418000 m!406941))

(declare-fun m!406943 () Bool)

(assert (=> b!418000 m!406943))

(declare-fun m!406945 () Bool)

(assert (=> b!418001 m!406945))

(declare-fun m!406947 () Bool)

(assert (=> b!417989 m!406947))

(assert (=> b!417989 m!406947))

(declare-fun m!406949 () Bool)

(assert (=> b!417989 m!406949))

(declare-fun m!406951 () Bool)

(assert (=> b!417989 m!406951))

(declare-fun m!406953 () Bool)

(assert (=> b!417992 m!406953))

(declare-fun m!406955 () Bool)

(assert (=> b!418003 m!406955))

(declare-fun m!406957 () Bool)

(assert (=> b!418002 m!406957))

(check-sat (not b!418000) (not mapNonEmpty!17814) (not b_lambda!8929) (not start!39362) (not b_next!9643) (not b!417989) (not b!417993) (not bm!29080) (not b!418002) (not b!417998) (not b!417987) (not b!418001) (not bm!29079) (not b!417986) (not b!418003) tp_is_empty!10795 b_and!17137 (not b!417996) (not b!417995))
(check-sat b_and!17137 (not b_next!9643))
