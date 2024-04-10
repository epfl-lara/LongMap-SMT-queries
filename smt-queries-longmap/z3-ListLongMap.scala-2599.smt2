; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39414 () Bool)

(assert start!39414)

(declare-fun b_free!9681 () Bool)

(declare-fun b_next!9681 () Bool)

(assert (=> start!39414 (= b_free!9681 (not b_next!9681))))

(declare-fun tp!34571 () Bool)

(declare-fun b_and!17237 () Bool)

(assert (=> start!39414 (= tp!34571 b_and!17237)))

(declare-fun b!419377 () Bool)

(declare-fun res!244491 () Bool)

(declare-fun e!249945 () Bool)

(assert (=> b!419377 (=> (not res!244491) (not e!249945))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419377 (= res!244491 (validMask!0 mask!1025))))

(declare-fun b!419378 () Bool)

(declare-fun e!249943 () Bool)

(assert (=> b!419378 (= e!249945 e!249943)))

(declare-fun res!244488 () Bool)

(assert (=> b!419378 (=> (not res!244488) (not e!249943))))

(declare-datatypes ((array!25515 0))(
  ( (array!25516 (arr!12207 (Array (_ BitVec 32) (_ BitVec 64))) (size!12559 (_ BitVec 32))) )
))
(declare-fun lt!192311 () array!25515)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25515 (_ BitVec 32)) Bool)

(assert (=> b!419378 (= res!244488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192311 mask!1025))))

(declare-fun _keys!709 () array!25515)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419378 (= lt!192311 (array!25516 (store (arr!12207 _keys!709) i!563 k0!794) (size!12559 _keys!709)))))

(declare-fun b!419379 () Bool)

(declare-fun res!244486 () Bool)

(assert (=> b!419379 (=> (not res!244486) (not e!249945))))

(declare-fun arrayContainsKey!0 (array!25515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419379 (= res!244486 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!419380 () Bool)

(declare-fun res!244495 () Bool)

(assert (=> b!419380 (=> (not res!244495) (not e!249945))))

(declare-datatypes ((List!7157 0))(
  ( (Nil!7154) (Cons!7153 (h!8009 (_ BitVec 64)) (t!12503 List!7157)) )
))
(declare-fun arrayNoDuplicates!0 (array!25515 (_ BitVec 32) List!7157) Bool)

(assert (=> b!419380 (= res!244495 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7154))))

(declare-fun b!419381 () Bool)

(declare-fun res!244489 () Bool)

(assert (=> b!419381 (=> (not res!244489) (not e!249945))))

(assert (=> b!419381 (= res!244489 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12559 _keys!709))))))

(declare-fun b!419382 () Bool)

(declare-fun e!249951 () Bool)

(assert (=> b!419382 (= e!249951 true)))

(declare-datatypes ((V!15549 0))(
  ( (V!15550 (val!5461 Int)) )
))
(declare-datatypes ((tuple2!7148 0))(
  ( (tuple2!7149 (_1!3585 (_ BitVec 64)) (_2!3585 V!15549)) )
))
(declare-datatypes ((List!7158 0))(
  ( (Nil!7155) (Cons!7154 (h!8010 tuple2!7148) (t!12504 List!7158)) )
))
(declare-datatypes ((ListLongMap!6061 0))(
  ( (ListLongMap!6062 (toList!3046 List!7158)) )
))
(declare-fun lt!192313 () ListLongMap!6061)

(declare-fun lt!192315 () V!15549)

(declare-fun lt!192312 () tuple2!7148)

(declare-fun +!1243 (ListLongMap!6061 tuple2!7148) ListLongMap!6061)

(assert (=> b!419382 (= (+!1243 lt!192313 lt!192312) (+!1243 (+!1243 lt!192313 (tuple2!7149 k0!794 lt!192315)) lt!192312))))

(declare-fun lt!192319 () V!15549)

(assert (=> b!419382 (= lt!192312 (tuple2!7149 k0!794 lt!192319))))

(declare-datatypes ((Unit!12394 0))(
  ( (Unit!12395) )
))
(declare-fun lt!192318 () Unit!12394)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!42 (ListLongMap!6061 (_ BitVec 64) V!15549 V!15549) Unit!12394)

(assert (=> b!419382 (= lt!192318 (addSameAsAddTwiceSameKeyDiffValues!42 lt!192313 k0!794 lt!192315 lt!192319))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5073 0))(
  ( (ValueCellFull!5073 (v!7708 V!15549)) (EmptyCell!5073) )
))
(declare-datatypes ((array!25517 0))(
  ( (array!25518 (arr!12208 (Array (_ BitVec 32) ValueCell!5073)) (size!12560 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25517)

(declare-fun lt!192314 () V!15549)

(declare-fun get!6054 (ValueCell!5073 V!15549) V!15549)

(assert (=> b!419382 (= lt!192315 (get!6054 (select (arr!12208 _values!549) from!863) lt!192314))))

(declare-fun lt!192317 () ListLongMap!6061)

(assert (=> b!419382 (= lt!192317 (+!1243 lt!192313 (tuple2!7149 (select (arr!12207 lt!192311) from!863) lt!192319)))))

(declare-fun v!412 () V!15549)

(assert (=> b!419382 (= lt!192319 (get!6054 (select (store (arr!12208 _values!549) i!563 (ValueCellFull!5073 v!412)) from!863) lt!192314))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!713 (Int (_ BitVec 64)) V!15549)

(assert (=> b!419382 (= lt!192314 (dynLambda!713 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15549)

(declare-fun zeroValue!515 () V!15549)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!192320 () array!25517)

(declare-fun getCurrentListMapNoExtraKeys!1251 (array!25515 array!25517 (_ BitVec 32) (_ BitVec 32) V!15549 V!15549 (_ BitVec 32) Int) ListLongMap!6061)

(assert (=> b!419382 (= lt!192313 (getCurrentListMapNoExtraKeys!1251 lt!192311 lt!192320 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419383 () Bool)

(declare-fun res!244494 () Bool)

(assert (=> b!419383 (=> (not res!244494) (not e!249945))))

(assert (=> b!419383 (= res!244494 (and (= (size!12560 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12559 _keys!709) (size!12560 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419384 () Bool)

(declare-fun res!244485 () Bool)

(assert (=> b!419384 (=> (not res!244485) (not e!249945))))

(assert (=> b!419384 (= res!244485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419385 () Bool)

(declare-fun res!244493 () Bool)

(assert (=> b!419385 (=> (not res!244493) (not e!249945))))

(assert (=> b!419385 (= res!244493 (or (= (select (arr!12207 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12207 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419386 () Bool)

(declare-fun res!244487 () Bool)

(assert (=> b!419386 (=> (not res!244487) (not e!249943))))

(assert (=> b!419386 (= res!244487 (arrayNoDuplicates!0 lt!192311 #b00000000000000000000000000000000 Nil!7154))))

(declare-fun b!419387 () Bool)

(declare-fun e!249946 () Bool)

(declare-fun call!29221 () ListLongMap!6061)

(declare-fun call!29222 () ListLongMap!6061)

(assert (=> b!419387 (= e!249946 (= call!29221 (+!1243 call!29222 (tuple2!7149 k0!794 v!412))))))

(declare-fun mapIsEmpty!17871 () Bool)

(declare-fun mapRes!17871 () Bool)

(assert (=> mapIsEmpty!17871 mapRes!17871))

(declare-fun b!419389 () Bool)

(assert (=> b!419389 (= e!249946 (= call!29222 call!29221))))

(declare-fun bm!29218 () Bool)

(declare-fun c!55235 () Bool)

(assert (=> bm!29218 (= call!29221 (getCurrentListMapNoExtraKeys!1251 (ite c!55235 lt!192311 _keys!709) (ite c!55235 lt!192320 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29219 () Bool)

(assert (=> bm!29219 (= call!29222 (getCurrentListMapNoExtraKeys!1251 (ite c!55235 _keys!709 lt!192311) (ite c!55235 _values!549 lt!192320) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419390 () Bool)

(declare-fun e!249948 () Bool)

(assert (=> b!419390 (= e!249948 (not e!249951))))

(declare-fun res!244490 () Bool)

(assert (=> b!419390 (=> res!244490 e!249951)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419390 (= res!244490 (validKeyInArray!0 (select (arr!12207 _keys!709) from!863)))))

(assert (=> b!419390 e!249946))

(assert (=> b!419390 (= c!55235 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!192316 () Unit!12394)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!447 (array!25515 array!25517 (_ BitVec 32) (_ BitVec 32) V!15549 V!15549 (_ BitVec 32) (_ BitVec 64) V!15549 (_ BitVec 32) Int) Unit!12394)

(assert (=> b!419390 (= lt!192316 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!447 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419391 () Bool)

(declare-fun e!249944 () Bool)

(declare-fun e!249949 () Bool)

(assert (=> b!419391 (= e!249944 (and e!249949 mapRes!17871))))

(declare-fun condMapEmpty!17871 () Bool)

(declare-fun mapDefault!17871 () ValueCell!5073)

(assert (=> b!419391 (= condMapEmpty!17871 (= (arr!12208 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5073)) mapDefault!17871)))))

(declare-fun b!419392 () Bool)

(declare-fun res!244484 () Bool)

(assert (=> b!419392 (=> (not res!244484) (not e!249943))))

(assert (=> b!419392 (= res!244484 (bvsle from!863 i!563))))

(declare-fun b!419393 () Bool)

(declare-fun e!249947 () Bool)

(declare-fun tp_is_empty!10833 () Bool)

(assert (=> b!419393 (= e!249947 tp_is_empty!10833)))

(declare-fun mapNonEmpty!17871 () Bool)

(declare-fun tp!34572 () Bool)

(assert (=> mapNonEmpty!17871 (= mapRes!17871 (and tp!34572 e!249947))))

(declare-fun mapKey!17871 () (_ BitVec 32))

(declare-fun mapRest!17871 () (Array (_ BitVec 32) ValueCell!5073))

(declare-fun mapValue!17871 () ValueCell!5073)

(assert (=> mapNonEmpty!17871 (= (arr!12208 _values!549) (store mapRest!17871 mapKey!17871 mapValue!17871))))

(declare-fun res!244497 () Bool)

(assert (=> start!39414 (=> (not res!244497) (not e!249945))))

(assert (=> start!39414 (= res!244497 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12559 _keys!709))))))

(assert (=> start!39414 e!249945))

(assert (=> start!39414 tp_is_empty!10833))

(assert (=> start!39414 tp!34571))

(assert (=> start!39414 true))

(declare-fun array_inv!8902 (array!25517) Bool)

(assert (=> start!39414 (and (array_inv!8902 _values!549) e!249944)))

(declare-fun array_inv!8903 (array!25515) Bool)

(assert (=> start!39414 (array_inv!8903 _keys!709)))

(declare-fun b!419388 () Bool)

(assert (=> b!419388 (= e!249949 tp_is_empty!10833)))

(declare-fun b!419394 () Bool)

(declare-fun res!244492 () Bool)

(assert (=> b!419394 (=> (not res!244492) (not e!249945))))

(assert (=> b!419394 (= res!244492 (validKeyInArray!0 k0!794))))

(declare-fun b!419395 () Bool)

(assert (=> b!419395 (= e!249943 e!249948)))

(declare-fun res!244496 () Bool)

(assert (=> b!419395 (=> (not res!244496) (not e!249948))))

(assert (=> b!419395 (= res!244496 (= from!863 i!563))))

(assert (=> b!419395 (= lt!192317 (getCurrentListMapNoExtraKeys!1251 lt!192311 lt!192320 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419395 (= lt!192320 (array!25518 (store (arr!12208 _values!549) i!563 (ValueCellFull!5073 v!412)) (size!12560 _values!549)))))

(declare-fun lt!192310 () ListLongMap!6061)

(assert (=> b!419395 (= lt!192310 (getCurrentListMapNoExtraKeys!1251 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39414 res!244497) b!419377))

(assert (= (and b!419377 res!244491) b!419383))

(assert (= (and b!419383 res!244494) b!419384))

(assert (= (and b!419384 res!244485) b!419380))

(assert (= (and b!419380 res!244495) b!419381))

(assert (= (and b!419381 res!244489) b!419394))

(assert (= (and b!419394 res!244492) b!419385))

(assert (= (and b!419385 res!244493) b!419379))

(assert (= (and b!419379 res!244486) b!419378))

(assert (= (and b!419378 res!244488) b!419386))

(assert (= (and b!419386 res!244487) b!419392))

(assert (= (and b!419392 res!244484) b!419395))

(assert (= (and b!419395 res!244496) b!419390))

(assert (= (and b!419390 c!55235) b!419387))

(assert (= (and b!419390 (not c!55235)) b!419389))

(assert (= (or b!419387 b!419389) bm!29218))

(assert (= (or b!419387 b!419389) bm!29219))

(assert (= (and b!419390 (not res!244490)) b!419382))

(assert (= (and b!419391 condMapEmpty!17871) mapIsEmpty!17871))

(assert (= (and b!419391 (not condMapEmpty!17871)) mapNonEmpty!17871))

(get-info :version)

(assert (= (and mapNonEmpty!17871 ((_ is ValueCellFull!5073) mapValue!17871)) b!419393))

(assert (= (and b!419391 ((_ is ValueCellFull!5073) mapDefault!17871)) b!419388))

(assert (= start!39414 b!419391))

(declare-fun b_lambda!8985 () Bool)

(assert (=> (not b_lambda!8985) (not b!419382)))

(declare-fun t!12502 () Bool)

(declare-fun tb!3303 () Bool)

(assert (=> (and start!39414 (= defaultEntry!557 defaultEntry!557) t!12502) tb!3303))

(declare-fun result!6133 () Bool)

(assert (=> tb!3303 (= result!6133 tp_is_empty!10833)))

(assert (=> b!419382 t!12502))

(declare-fun b_and!17239 () Bool)

(assert (= b_and!17237 (and (=> t!12502 result!6133) b_and!17239)))

(declare-fun m!408875 () Bool)

(assert (=> b!419382 m!408875))

(declare-fun m!408877 () Bool)

(assert (=> b!419382 m!408877))

(declare-fun m!408879 () Bool)

(assert (=> b!419382 m!408879))

(declare-fun m!408881 () Bool)

(assert (=> b!419382 m!408881))

(declare-fun m!408883 () Bool)

(assert (=> b!419382 m!408883))

(declare-fun m!408885 () Bool)

(assert (=> b!419382 m!408885))

(declare-fun m!408887 () Bool)

(assert (=> b!419382 m!408887))

(declare-fun m!408889 () Bool)

(assert (=> b!419382 m!408889))

(assert (=> b!419382 m!408881))

(assert (=> b!419382 m!408875))

(declare-fun m!408891 () Bool)

(assert (=> b!419382 m!408891))

(assert (=> b!419382 m!408887))

(declare-fun m!408893 () Bool)

(assert (=> b!419382 m!408893))

(declare-fun m!408895 () Bool)

(assert (=> b!419382 m!408895))

(declare-fun m!408897 () Bool)

(assert (=> b!419382 m!408897))

(declare-fun m!408899 () Bool)

(assert (=> b!419382 m!408899))

(declare-fun m!408901 () Bool)

(assert (=> b!419379 m!408901))

(declare-fun m!408903 () Bool)

(assert (=> b!419395 m!408903))

(assert (=> b!419395 m!408879))

(declare-fun m!408905 () Bool)

(assert (=> b!419395 m!408905))

(declare-fun m!408907 () Bool)

(assert (=> b!419377 m!408907))

(declare-fun m!408909 () Bool)

(assert (=> b!419384 m!408909))

(declare-fun m!408911 () Bool)

(assert (=> bm!29218 m!408911))

(declare-fun m!408913 () Bool)

(assert (=> b!419380 m!408913))

(declare-fun m!408915 () Bool)

(assert (=> start!39414 m!408915))

(declare-fun m!408917 () Bool)

(assert (=> start!39414 m!408917))

(declare-fun m!408919 () Bool)

(assert (=> b!419394 m!408919))

(declare-fun m!408921 () Bool)

(assert (=> b!419386 m!408921))

(declare-fun m!408923 () Bool)

(assert (=> b!419385 m!408923))

(declare-fun m!408925 () Bool)

(assert (=> b!419387 m!408925))

(declare-fun m!408927 () Bool)

(assert (=> b!419378 m!408927))

(declare-fun m!408929 () Bool)

(assert (=> b!419378 m!408929))

(declare-fun m!408931 () Bool)

(assert (=> bm!29219 m!408931))

(declare-fun m!408933 () Bool)

(assert (=> b!419390 m!408933))

(assert (=> b!419390 m!408933))

(declare-fun m!408935 () Bool)

(assert (=> b!419390 m!408935))

(declare-fun m!408937 () Bool)

(assert (=> b!419390 m!408937))

(declare-fun m!408939 () Bool)

(assert (=> mapNonEmpty!17871 m!408939))

(check-sat tp_is_empty!10833 (not b!419384) (not b!419382) (not b!419394) b_and!17239 (not b!419377) (not b!419378) (not b_lambda!8985) (not b!419390) (not bm!29218) (not b!419386) (not b!419395) (not bm!29219) (not start!39414) (not b!419379) (not mapNonEmpty!17871) (not b!419380) (not b_next!9681) (not b!419387))
(check-sat b_and!17239 (not b_next!9681))
