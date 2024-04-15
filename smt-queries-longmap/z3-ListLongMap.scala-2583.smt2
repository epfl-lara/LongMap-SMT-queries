; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39302 () Bool)

(assert start!39302)

(declare-fun b_free!9583 () Bool)

(declare-fun b_next!9583 () Bool)

(assert (=> start!39302 (= b_free!9583 (not b_next!9583))))

(declare-fun tp!34277 () Bool)

(declare-fun b_and!17015 () Bool)

(assert (=> start!39302 (= tp!34277 b_and!17015)))

(declare-fun mapIsEmpty!17724 () Bool)

(declare-fun mapRes!17724 () Bool)

(assert (=> mapIsEmpty!17724 mapRes!17724))

(declare-fun b!416215 () Bool)

(declare-fun e!248453 () Bool)

(assert (=> b!416215 (= e!248453 true)))

(declare-datatypes ((V!15419 0))(
  ( (V!15420 (val!5412 Int)) )
))
(declare-fun lt!190462 () V!15419)

(declare-datatypes ((tuple2!7042 0))(
  ( (tuple2!7043 (_1!3532 (_ BitVec 64)) (_2!3532 V!15419)) )
))
(declare-fun lt!190461 () tuple2!7042)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((List!7045 0))(
  ( (Nil!7042) (Cons!7041 (h!7897 tuple2!7042) (t!12284 List!7045)) )
))
(declare-datatypes ((ListLongMap!5945 0))(
  ( (ListLongMap!5946 (toList!2988 List!7045)) )
))
(declare-fun lt!190460 () ListLongMap!5945)

(declare-fun +!1219 (ListLongMap!5945 tuple2!7042) ListLongMap!5945)

(assert (=> b!416215 (= (+!1219 lt!190460 lt!190461) (+!1219 (+!1219 lt!190460 (tuple2!7043 k0!794 lt!190462)) lt!190461))))

(declare-fun lt!190468 () V!15419)

(assert (=> b!416215 (= lt!190461 (tuple2!7043 k0!794 lt!190468))))

(declare-datatypes ((Unit!12276 0))(
  ( (Unit!12277) )
))
(declare-fun lt!190459 () Unit!12276)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!8 (ListLongMap!5945 (_ BitVec 64) V!15419 V!15419) Unit!12276)

(assert (=> b!416215 (= lt!190459 (addSameAsAddTwiceSameKeyDiffValues!8 lt!190460 k0!794 lt!190462 lt!190468))))

(declare-fun lt!190467 () V!15419)

(declare-datatypes ((ValueCell!5024 0))(
  ( (ValueCellFull!5024 (v!7653 V!15419)) (EmptyCell!5024) )
))
(declare-datatypes ((array!25315 0))(
  ( (array!25316 (arr!12107 (Array (_ BitVec 32) ValueCell!5024)) (size!12460 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25315)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun get!5977 (ValueCell!5024 V!15419) V!15419)

(assert (=> b!416215 (= lt!190462 (get!5977 (select (arr!12107 _values!549) from!863) lt!190467))))

(declare-fun lt!190463 () ListLongMap!5945)

(declare-datatypes ((array!25317 0))(
  ( (array!25318 (arr!12108 (Array (_ BitVec 32) (_ BitVec 64))) (size!12461 (_ BitVec 32))) )
))
(declare-fun lt!190465 () array!25317)

(assert (=> b!416215 (= lt!190463 (+!1219 lt!190460 (tuple2!7043 (select (arr!12108 lt!190465) from!863) lt!190468)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15419)

(assert (=> b!416215 (= lt!190468 (get!5977 (select (store (arr!12107 _values!549) i!563 (ValueCellFull!5024 v!412)) from!863) lt!190467))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!665 (Int (_ BitVec 64)) V!15419)

(assert (=> b!416215 (= lt!190467 (dynLambda!665 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15419)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15419)

(declare-fun lt!190469 () array!25315)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1199 (array!25317 array!25315 (_ BitVec 32) (_ BitVec 32) V!15419 V!15419 (_ BitVec 32) Int) ListLongMap!5945)

(assert (=> b!416215 (= lt!190460 (getCurrentListMapNoExtraKeys!1199 lt!190465 lt!190469 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416216 () Bool)

(declare-fun res!242310 () Bool)

(declare-fun e!248449 () Bool)

(assert (=> b!416216 (=> (not res!242310) (not e!248449))))

(declare-datatypes ((List!7046 0))(
  ( (Nil!7043) (Cons!7042 (h!7898 (_ BitVec 64)) (t!12285 List!7046)) )
))
(declare-fun arrayNoDuplicates!0 (array!25317 (_ BitVec 32) List!7046) Bool)

(assert (=> b!416216 (= res!242310 (arrayNoDuplicates!0 lt!190465 #b00000000000000000000000000000000 Nil!7043))))

(declare-fun b!416217 () Bool)

(declare-fun e!248451 () Bool)

(declare-fun tp_is_empty!10735 () Bool)

(assert (=> b!416217 (= e!248451 tp_is_empty!10735)))

(declare-fun b!416218 () Bool)

(declare-fun res!242298 () Bool)

(declare-fun e!248447 () Bool)

(assert (=> b!416218 (=> (not res!242298) (not e!248447))))

(declare-fun _keys!709 () array!25317)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25317 (_ BitVec 32)) Bool)

(assert (=> b!416218 (= res!242298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416219 () Bool)

(declare-fun res!242307 () Bool)

(assert (=> b!416219 (=> (not res!242307) (not e!248447))))

(declare-fun arrayContainsKey!0 (array!25317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416219 (= res!242307 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416220 () Bool)

(declare-fun e!248446 () Bool)

(assert (=> b!416220 (= e!248449 e!248446)))

(declare-fun res!242306 () Bool)

(assert (=> b!416220 (=> (not res!242306) (not e!248446))))

(assert (=> b!416220 (= res!242306 (= from!863 i!563))))

(assert (=> b!416220 (= lt!190463 (getCurrentListMapNoExtraKeys!1199 lt!190465 lt!190469 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416220 (= lt!190469 (array!25316 (store (arr!12107 _values!549) i!563 (ValueCellFull!5024 v!412)) (size!12460 _values!549)))))

(declare-fun lt!190466 () ListLongMap!5945)

(assert (=> b!416220 (= lt!190466 (getCurrentListMapNoExtraKeys!1199 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416221 () Bool)

(declare-fun res!242304 () Bool)

(assert (=> b!416221 (=> (not res!242304) (not e!248449))))

(assert (=> b!416221 (= res!242304 (bvsle from!863 i!563))))

(declare-fun b!416222 () Bool)

(declare-fun e!248448 () Bool)

(declare-fun call!28902 () ListLongMap!5945)

(declare-fun call!28903 () ListLongMap!5945)

(assert (=> b!416222 (= e!248448 (= call!28902 call!28903))))

(declare-fun b!416223 () Bool)

(declare-fun res!242303 () Bool)

(assert (=> b!416223 (=> (not res!242303) (not e!248447))))

(assert (=> b!416223 (= res!242303 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12461 _keys!709))))))

(declare-fun mapNonEmpty!17724 () Bool)

(declare-fun tp!34278 () Bool)

(assert (=> mapNonEmpty!17724 (= mapRes!17724 (and tp!34278 e!248451))))

(declare-fun mapValue!17724 () ValueCell!5024)

(declare-fun mapKey!17724 () (_ BitVec 32))

(declare-fun mapRest!17724 () (Array (_ BitVec 32) ValueCell!5024))

(assert (=> mapNonEmpty!17724 (= (arr!12107 _values!549) (store mapRest!17724 mapKey!17724 mapValue!17724))))

(declare-fun res!242297 () Bool)

(assert (=> start!39302 (=> (not res!242297) (not e!248447))))

(assert (=> start!39302 (= res!242297 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12461 _keys!709))))))

(assert (=> start!39302 e!248447))

(assert (=> start!39302 tp_is_empty!10735))

(assert (=> start!39302 tp!34277))

(assert (=> start!39302 true))

(declare-fun e!248454 () Bool)

(declare-fun array_inv!8870 (array!25315) Bool)

(assert (=> start!39302 (and (array_inv!8870 _values!549) e!248454)))

(declare-fun array_inv!8871 (array!25317) Bool)

(assert (=> start!39302 (array_inv!8871 _keys!709)))

(declare-fun b!416224 () Bool)

(declare-fun res!242302 () Bool)

(assert (=> b!416224 (=> (not res!242302) (not e!248447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416224 (= res!242302 (validKeyInArray!0 k0!794))))

(declare-fun b!416225 () Bool)

(declare-fun res!242308 () Bool)

(assert (=> b!416225 (=> (not res!242308) (not e!248447))))

(assert (=> b!416225 (= res!242308 (or (= (select (arr!12108 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12108 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!416226 () Bool)

(declare-fun e!248450 () Bool)

(assert (=> b!416226 (= e!248450 tp_is_empty!10735)))

(declare-fun c!55017 () Bool)

(declare-fun bm!28899 () Bool)

(assert (=> bm!28899 (= call!28903 (getCurrentListMapNoExtraKeys!1199 (ite c!55017 lt!190465 _keys!709) (ite c!55017 lt!190469 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416227 () Bool)

(assert (=> b!416227 (= e!248446 (not e!248453))))

(declare-fun res!242300 () Bool)

(assert (=> b!416227 (=> res!242300 e!248453)))

(assert (=> b!416227 (= res!242300 (validKeyInArray!0 (select (arr!12108 _keys!709) from!863)))))

(assert (=> b!416227 e!248448))

(assert (=> b!416227 (= c!55017 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!190464 () Unit!12276)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!400 (array!25317 array!25315 (_ BitVec 32) (_ BitVec 32) V!15419 V!15419 (_ BitVec 32) (_ BitVec 64) V!15419 (_ BitVec 32) Int) Unit!12276)

(assert (=> b!416227 (= lt!190464 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!400 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416228 () Bool)

(assert (=> b!416228 (= e!248447 e!248449)))

(declare-fun res!242309 () Bool)

(assert (=> b!416228 (=> (not res!242309) (not e!248449))))

(assert (=> b!416228 (= res!242309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190465 mask!1025))))

(assert (=> b!416228 (= lt!190465 (array!25318 (store (arr!12108 _keys!709) i!563 k0!794) (size!12461 _keys!709)))))

(declare-fun b!416229 () Bool)

(declare-fun res!242301 () Bool)

(assert (=> b!416229 (=> (not res!242301) (not e!248447))))

(assert (=> b!416229 (= res!242301 (and (= (size!12460 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12461 _keys!709) (size!12460 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416230 () Bool)

(declare-fun res!242299 () Bool)

(assert (=> b!416230 (=> (not res!242299) (not e!248447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416230 (= res!242299 (validMask!0 mask!1025))))

(declare-fun bm!28900 () Bool)

(assert (=> bm!28900 (= call!28902 (getCurrentListMapNoExtraKeys!1199 (ite c!55017 _keys!709 lt!190465) (ite c!55017 _values!549 lt!190469) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416231 () Bool)

(assert (=> b!416231 (= e!248448 (= call!28903 (+!1219 call!28902 (tuple2!7043 k0!794 v!412))))))

(declare-fun b!416232 () Bool)

(declare-fun res!242305 () Bool)

(assert (=> b!416232 (=> (not res!242305) (not e!248447))))

(assert (=> b!416232 (= res!242305 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7043))))

(declare-fun b!416233 () Bool)

(assert (=> b!416233 (= e!248454 (and e!248450 mapRes!17724))))

(declare-fun condMapEmpty!17724 () Bool)

(declare-fun mapDefault!17724 () ValueCell!5024)

(assert (=> b!416233 (= condMapEmpty!17724 (= (arr!12107 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5024)) mapDefault!17724)))))

(assert (= (and start!39302 res!242297) b!416230))

(assert (= (and b!416230 res!242299) b!416229))

(assert (= (and b!416229 res!242301) b!416218))

(assert (= (and b!416218 res!242298) b!416232))

(assert (= (and b!416232 res!242305) b!416223))

(assert (= (and b!416223 res!242303) b!416224))

(assert (= (and b!416224 res!242302) b!416225))

(assert (= (and b!416225 res!242308) b!416219))

(assert (= (and b!416219 res!242307) b!416228))

(assert (= (and b!416228 res!242309) b!416216))

(assert (= (and b!416216 res!242310) b!416221))

(assert (= (and b!416221 res!242304) b!416220))

(assert (= (and b!416220 res!242306) b!416227))

(assert (= (and b!416227 c!55017) b!416231))

(assert (= (and b!416227 (not c!55017)) b!416222))

(assert (= (or b!416231 b!416222) bm!28899))

(assert (= (or b!416231 b!416222) bm!28900))

(assert (= (and b!416227 (not res!242300)) b!416215))

(assert (= (and b!416233 condMapEmpty!17724) mapIsEmpty!17724))

(assert (= (and b!416233 (not condMapEmpty!17724)) mapNonEmpty!17724))

(get-info :version)

(assert (= (and mapNonEmpty!17724 ((_ is ValueCellFull!5024) mapValue!17724)) b!416217))

(assert (= (and b!416233 ((_ is ValueCellFull!5024) mapDefault!17724)) b!416226))

(assert (= start!39302 b!416233))

(declare-fun b_lambda!8869 () Bool)

(assert (=> (not b_lambda!8869) (not b!416215)))

(declare-fun t!12283 () Bool)

(declare-fun tb!3197 () Bool)

(assert (=> (and start!39302 (= defaultEntry!557 defaultEntry!557) t!12283) tb!3197))

(declare-fun result!5929 () Bool)

(assert (=> tb!3197 (= result!5929 tp_is_empty!10735)))

(assert (=> b!416215 t!12283))

(declare-fun b_and!17017 () Bool)

(assert (= b_and!17015 (and (=> t!12283 result!5929) b_and!17017)))

(declare-fun m!404913 () Bool)

(assert (=> b!416228 m!404913))

(declare-fun m!404915 () Bool)

(assert (=> b!416228 m!404915))

(declare-fun m!404917 () Bool)

(assert (=> b!416220 m!404917))

(declare-fun m!404919 () Bool)

(assert (=> b!416220 m!404919))

(declare-fun m!404921 () Bool)

(assert (=> b!416220 m!404921))

(declare-fun m!404923 () Bool)

(assert (=> b!416225 m!404923))

(declare-fun m!404925 () Bool)

(assert (=> b!416224 m!404925))

(declare-fun m!404927 () Bool)

(assert (=> start!39302 m!404927))

(declare-fun m!404929 () Bool)

(assert (=> start!39302 m!404929))

(declare-fun m!404931 () Bool)

(assert (=> b!416230 m!404931))

(declare-fun m!404933 () Bool)

(assert (=> mapNonEmpty!17724 m!404933))

(declare-fun m!404935 () Bool)

(assert (=> b!416216 m!404935))

(declare-fun m!404937 () Bool)

(assert (=> b!416231 m!404937))

(declare-fun m!404939 () Bool)

(assert (=> b!416227 m!404939))

(assert (=> b!416227 m!404939))

(declare-fun m!404941 () Bool)

(assert (=> b!416227 m!404941))

(declare-fun m!404943 () Bool)

(assert (=> b!416227 m!404943))

(declare-fun m!404945 () Bool)

(assert (=> bm!28899 m!404945))

(declare-fun m!404947 () Bool)

(assert (=> b!416218 m!404947))

(declare-fun m!404949 () Bool)

(assert (=> b!416219 m!404949))

(declare-fun m!404951 () Bool)

(assert (=> b!416232 m!404951))

(declare-fun m!404953 () Bool)

(assert (=> bm!28900 m!404953))

(declare-fun m!404955 () Bool)

(assert (=> b!416215 m!404955))

(declare-fun m!404957 () Bool)

(assert (=> b!416215 m!404957))

(assert (=> b!416215 m!404919))

(declare-fun m!404959 () Bool)

(assert (=> b!416215 m!404959))

(declare-fun m!404961 () Bool)

(assert (=> b!416215 m!404961))

(declare-fun m!404963 () Bool)

(assert (=> b!416215 m!404963))

(declare-fun m!404965 () Bool)

(assert (=> b!416215 m!404965))

(declare-fun m!404967 () Bool)

(assert (=> b!416215 m!404967))

(assert (=> b!416215 m!404963))

(declare-fun m!404969 () Bool)

(assert (=> b!416215 m!404969))

(declare-fun m!404971 () Bool)

(assert (=> b!416215 m!404971))

(assert (=> b!416215 m!404965))

(declare-fun m!404973 () Bool)

(assert (=> b!416215 m!404973))

(declare-fun m!404975 () Bool)

(assert (=> b!416215 m!404975))

(assert (=> b!416215 m!404955))

(declare-fun m!404977 () Bool)

(assert (=> b!416215 m!404977))

(check-sat (not b!416220) (not b!416219) (not b!416215) (not b_lambda!8869) b_and!17017 (not b!416224) (not b!416232) tp_is_empty!10735 (not b!416227) (not bm!28900) (not start!39302) (not b!416218) (not b!416230) (not b!416231) (not mapNonEmpty!17724) (not bm!28899) (not b!416228) (not b!416216) (not b_next!9583))
(check-sat b_and!17017 (not b_next!9583))
