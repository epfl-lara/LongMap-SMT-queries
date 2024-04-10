; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39510 () Bool)

(assert start!39510)

(declare-fun b_free!9777 () Bool)

(declare-fun b_next!9777 () Bool)

(assert (=> start!39510 (= b_free!9777 (not b_next!9777))))

(declare-fun tp!34860 () Bool)

(declare-fun b_and!17429 () Bool)

(assert (=> start!39510 (= tp!34860 b_and!17429)))

(declare-fun b!422209 () Bool)

(declare-fun e!251246 () Bool)

(declare-fun tp_is_empty!10929 () Bool)

(assert (=> b!422209 (= e!251246 tp_is_empty!10929)))

(declare-fun res!246509 () Bool)

(declare-fun e!251242 () Bool)

(assert (=> start!39510 (=> (not res!246509) (not e!251242))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25705 0))(
  ( (array!25706 (arr!12302 (Array (_ BitVec 32) (_ BitVec 64))) (size!12654 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25705)

(assert (=> start!39510 (= res!246509 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12654 _keys!709))))))

(assert (=> start!39510 e!251242))

(assert (=> start!39510 tp_is_empty!10929))

(assert (=> start!39510 tp!34860))

(assert (=> start!39510 true))

(declare-datatypes ((V!15677 0))(
  ( (V!15678 (val!5509 Int)) )
))
(declare-datatypes ((ValueCell!5121 0))(
  ( (ValueCellFull!5121 (v!7756 V!15677)) (EmptyCell!5121) )
))
(declare-datatypes ((array!25707 0))(
  ( (array!25708 (arr!12303 (Array (_ BitVec 32) ValueCell!5121)) (size!12655 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25707)

(declare-fun e!251239 () Bool)

(declare-fun array_inv!8962 (array!25707) Bool)

(assert (=> start!39510 (and (array_inv!8962 _values!549) e!251239)))

(declare-fun array_inv!8963 (array!25705) Bool)

(assert (=> start!39510 (array_inv!8963 _keys!709)))

(declare-fun b!422210 () Bool)

(declare-fun e!251241 () Bool)

(declare-fun e!251245 () Bool)

(assert (=> b!422210 (= e!251241 (not e!251245))))

(declare-fun res!246512 () Bool)

(assert (=> b!422210 (=> res!246512 e!251245)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422210 (= res!246512 (validKeyInArray!0 (select (arr!12302 _keys!709) from!863)))))

(declare-fun e!251243 () Bool)

(assert (=> b!422210 e!251243))

(declare-fun c!55379 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422210 (= c!55379 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15677)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15677)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12468 0))(
  ( (Unit!12469) )
))
(declare-fun lt!193896 () Unit!12468)

(declare-fun v!412 () V!15677)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!478 (array!25705 array!25707 (_ BitVec 32) (_ BitVec 32) V!15677 V!15677 (_ BitVec 32) (_ BitVec 64) V!15677 (_ BitVec 32) Int) Unit!12468)

(assert (=> b!422210 (= lt!193896 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!478 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29506 () Bool)

(declare-datatypes ((tuple2!7232 0))(
  ( (tuple2!7233 (_1!3627 (_ BitVec 64)) (_2!3627 V!15677)) )
))
(declare-datatypes ((List!7237 0))(
  ( (Nil!7234) (Cons!7233 (h!8089 tuple2!7232) (t!12679 List!7237)) )
))
(declare-datatypes ((ListLongMap!6145 0))(
  ( (ListLongMap!6146 (toList!3088 List!7237)) )
))
(declare-fun call!29509 () ListLongMap!6145)

(declare-fun lt!193898 () array!25705)

(declare-fun lt!193902 () array!25707)

(declare-fun getCurrentListMapNoExtraKeys!1292 (array!25705 array!25707 (_ BitVec 32) (_ BitVec 32) V!15677 V!15677 (_ BitVec 32) Int) ListLongMap!6145)

(assert (=> bm!29506 (= call!29509 (getCurrentListMapNoExtraKeys!1292 (ite c!55379 _keys!709 lt!193898) (ite c!55379 _values!549 lt!193902) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422211 () Bool)

(declare-fun res!246500 () Bool)

(assert (=> b!422211 (=> (not res!246500) (not e!251242))))

(assert (=> b!422211 (= res!246500 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12654 _keys!709))))))

(declare-fun mapIsEmpty!18015 () Bool)

(declare-fun mapRes!18015 () Bool)

(assert (=> mapIsEmpty!18015 mapRes!18015))

(declare-fun b!422212 () Bool)

(declare-fun res!246510 () Bool)

(declare-fun e!251247 () Bool)

(assert (=> b!422212 (=> (not res!246510) (not e!251247))))

(declare-datatypes ((List!7238 0))(
  ( (Nil!7235) (Cons!7234 (h!8090 (_ BitVec 64)) (t!12680 List!7238)) )
))
(declare-fun arrayNoDuplicates!0 (array!25705 (_ BitVec 32) List!7238) Bool)

(assert (=> b!422212 (= res!246510 (arrayNoDuplicates!0 lt!193898 #b00000000000000000000000000000000 Nil!7235))))

(declare-fun b!422213 () Bool)

(declare-fun res!246506 () Bool)

(assert (=> b!422213 (=> (not res!246506) (not e!251242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422213 (= res!246506 (validMask!0 mask!1025))))

(declare-fun b!422214 () Bool)

(declare-fun res!246507 () Bool)

(assert (=> b!422214 (=> (not res!246507) (not e!251242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25705 (_ BitVec 32)) Bool)

(assert (=> b!422214 (= res!246507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422215 () Bool)

(assert (=> b!422215 (= e!251245 true)))

(declare-fun lt!193904 () V!15677)

(declare-fun lt!193903 () ListLongMap!6145)

(declare-fun lt!193900 () tuple2!7232)

(declare-fun +!1283 (ListLongMap!6145 tuple2!7232) ListLongMap!6145)

(assert (=> b!422215 (= (+!1283 lt!193903 lt!193900) (+!1283 (+!1283 lt!193903 (tuple2!7233 k0!794 lt!193904)) lt!193900))))

(declare-fun lt!193901 () V!15677)

(assert (=> b!422215 (= lt!193900 (tuple2!7233 k0!794 lt!193901))))

(declare-fun lt!193897 () Unit!12468)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!75 (ListLongMap!6145 (_ BitVec 64) V!15677 V!15677) Unit!12468)

(assert (=> b!422215 (= lt!193897 (addSameAsAddTwiceSameKeyDiffValues!75 lt!193903 k0!794 lt!193904 lt!193901))))

(declare-fun lt!193895 () V!15677)

(declare-fun get!6119 (ValueCell!5121 V!15677) V!15677)

(assert (=> b!422215 (= lt!193904 (get!6119 (select (arr!12303 _values!549) from!863) lt!193895))))

(declare-fun lt!193894 () ListLongMap!6145)

(assert (=> b!422215 (= lt!193894 (+!1283 lt!193903 (tuple2!7233 (select (arr!12302 lt!193898) from!863) lt!193901)))))

(assert (=> b!422215 (= lt!193901 (get!6119 (select (store (arr!12303 _values!549) i!563 (ValueCellFull!5121 v!412)) from!863) lt!193895))))

(declare-fun dynLambda!746 (Int (_ BitVec 64)) V!15677)

(assert (=> b!422215 (= lt!193895 (dynLambda!746 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!422215 (= lt!193903 (getCurrentListMapNoExtraKeys!1292 lt!193898 lt!193902 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29510 () ListLongMap!6145)

(declare-fun bm!29507 () Bool)

(assert (=> bm!29507 (= call!29510 (getCurrentListMapNoExtraKeys!1292 (ite c!55379 lt!193898 _keys!709) (ite c!55379 lt!193902 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!422216 () Bool)

(assert (=> b!422216 (= e!251243 (= call!29510 (+!1283 call!29509 (tuple2!7233 k0!794 v!412))))))

(declare-fun b!422217 () Bool)

(declare-fun res!246505 () Bool)

(assert (=> b!422217 (=> (not res!246505) (not e!251242))))

(assert (=> b!422217 (= res!246505 (validKeyInArray!0 k0!794))))

(declare-fun b!422218 () Bool)

(declare-fun e!251244 () Bool)

(assert (=> b!422218 (= e!251239 (and e!251244 mapRes!18015))))

(declare-fun condMapEmpty!18015 () Bool)

(declare-fun mapDefault!18015 () ValueCell!5121)

(assert (=> b!422218 (= condMapEmpty!18015 (= (arr!12303 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5121)) mapDefault!18015)))))

(declare-fun b!422219 () Bool)

(declare-fun res!246511 () Bool)

(assert (=> b!422219 (=> (not res!246511) (not e!251242))))

(declare-fun arrayContainsKey!0 (array!25705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422219 (= res!246511 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422220 () Bool)

(declare-fun res!246502 () Bool)

(assert (=> b!422220 (=> (not res!246502) (not e!251242))))

(assert (=> b!422220 (= res!246502 (and (= (size!12655 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12654 _keys!709) (size!12655 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422221 () Bool)

(assert (=> b!422221 (= e!251242 e!251247)))

(declare-fun res!246513 () Bool)

(assert (=> b!422221 (=> (not res!246513) (not e!251247))))

(assert (=> b!422221 (= res!246513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193898 mask!1025))))

(assert (=> b!422221 (= lt!193898 (array!25706 (store (arr!12302 _keys!709) i!563 k0!794) (size!12654 _keys!709)))))

(declare-fun b!422222 () Bool)

(assert (=> b!422222 (= e!251243 (= call!29509 call!29510))))

(declare-fun b!422223 () Bool)

(declare-fun res!246501 () Bool)

(assert (=> b!422223 (=> (not res!246501) (not e!251242))))

(assert (=> b!422223 (= res!246501 (or (= (select (arr!12302 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12302 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422224 () Bool)

(declare-fun res!246504 () Bool)

(assert (=> b!422224 (=> (not res!246504) (not e!251242))))

(assert (=> b!422224 (= res!246504 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7235))))

(declare-fun mapNonEmpty!18015 () Bool)

(declare-fun tp!34859 () Bool)

(assert (=> mapNonEmpty!18015 (= mapRes!18015 (and tp!34859 e!251246))))

(declare-fun mapValue!18015 () ValueCell!5121)

(declare-fun mapKey!18015 () (_ BitVec 32))

(declare-fun mapRest!18015 () (Array (_ BitVec 32) ValueCell!5121))

(assert (=> mapNonEmpty!18015 (= (arr!12303 _values!549) (store mapRest!18015 mapKey!18015 mapValue!18015))))

(declare-fun b!422225 () Bool)

(assert (=> b!422225 (= e!251247 e!251241)))

(declare-fun res!246508 () Bool)

(assert (=> b!422225 (=> (not res!246508) (not e!251241))))

(assert (=> b!422225 (= res!246508 (= from!863 i!563))))

(assert (=> b!422225 (= lt!193894 (getCurrentListMapNoExtraKeys!1292 lt!193898 lt!193902 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!422225 (= lt!193902 (array!25708 (store (arr!12303 _values!549) i!563 (ValueCellFull!5121 v!412)) (size!12655 _values!549)))))

(declare-fun lt!193899 () ListLongMap!6145)

(assert (=> b!422225 (= lt!193899 (getCurrentListMapNoExtraKeys!1292 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422226 () Bool)

(assert (=> b!422226 (= e!251244 tp_is_empty!10929)))

(declare-fun b!422227 () Bool)

(declare-fun res!246503 () Bool)

(assert (=> b!422227 (=> (not res!246503) (not e!251247))))

(assert (=> b!422227 (= res!246503 (bvsle from!863 i!563))))

(assert (= (and start!39510 res!246509) b!422213))

(assert (= (and b!422213 res!246506) b!422220))

(assert (= (and b!422220 res!246502) b!422214))

(assert (= (and b!422214 res!246507) b!422224))

(assert (= (and b!422224 res!246504) b!422211))

(assert (= (and b!422211 res!246500) b!422217))

(assert (= (and b!422217 res!246505) b!422223))

(assert (= (and b!422223 res!246501) b!422219))

(assert (= (and b!422219 res!246511) b!422221))

(assert (= (and b!422221 res!246513) b!422212))

(assert (= (and b!422212 res!246510) b!422227))

(assert (= (and b!422227 res!246503) b!422225))

(assert (= (and b!422225 res!246508) b!422210))

(assert (= (and b!422210 c!55379) b!422216))

(assert (= (and b!422210 (not c!55379)) b!422222))

(assert (= (or b!422216 b!422222) bm!29507))

(assert (= (or b!422216 b!422222) bm!29506))

(assert (= (and b!422210 (not res!246512)) b!422215))

(assert (= (and b!422218 condMapEmpty!18015) mapIsEmpty!18015))

(assert (= (and b!422218 (not condMapEmpty!18015)) mapNonEmpty!18015))

(get-info :version)

(assert (= (and mapNonEmpty!18015 ((_ is ValueCellFull!5121) mapValue!18015)) b!422209))

(assert (= (and b!422218 ((_ is ValueCellFull!5121) mapDefault!18015)) b!422226))

(assert (= start!39510 b!422218))

(declare-fun b_lambda!9081 () Bool)

(assert (=> (not b_lambda!9081) (not b!422215)))

(declare-fun t!12678 () Bool)

(declare-fun tb!3399 () Bool)

(assert (=> (and start!39510 (= defaultEntry!557 defaultEntry!557) t!12678) tb!3399))

(declare-fun result!6325 () Bool)

(assert (=> tb!3399 (= result!6325 tp_is_empty!10929)))

(assert (=> b!422215 t!12678))

(declare-fun b_and!17431 () Bool)

(assert (= b_and!17429 (and (=> t!12678 result!6325) b_and!17431)))

(declare-fun m!412041 () Bool)

(assert (=> mapNonEmpty!18015 m!412041))

(declare-fun m!412043 () Bool)

(assert (=> b!422216 m!412043))

(declare-fun m!412045 () Bool)

(assert (=> b!422219 m!412045))

(declare-fun m!412047 () Bool)

(assert (=> b!422225 m!412047))

(declare-fun m!412049 () Bool)

(assert (=> b!422225 m!412049))

(declare-fun m!412051 () Bool)

(assert (=> b!422225 m!412051))

(declare-fun m!412053 () Bool)

(assert (=> b!422212 m!412053))

(declare-fun m!412055 () Bool)

(assert (=> b!422213 m!412055))

(declare-fun m!412057 () Bool)

(assert (=> b!422221 m!412057))

(declare-fun m!412059 () Bool)

(assert (=> b!422221 m!412059))

(declare-fun m!412061 () Bool)

(assert (=> bm!29507 m!412061))

(declare-fun m!412063 () Bool)

(assert (=> start!39510 m!412063))

(declare-fun m!412065 () Bool)

(assert (=> start!39510 m!412065))

(declare-fun m!412067 () Bool)

(assert (=> b!422210 m!412067))

(assert (=> b!422210 m!412067))

(declare-fun m!412069 () Bool)

(assert (=> b!422210 m!412069))

(declare-fun m!412071 () Bool)

(assert (=> b!422210 m!412071))

(declare-fun m!412073 () Bool)

(assert (=> bm!29506 m!412073))

(declare-fun m!412075 () Bool)

(assert (=> b!422223 m!412075))

(declare-fun m!412077 () Bool)

(assert (=> b!422224 m!412077))

(declare-fun m!412079 () Bool)

(assert (=> b!422214 m!412079))

(declare-fun m!412081 () Bool)

(assert (=> b!422217 m!412081))

(declare-fun m!412083 () Bool)

(assert (=> b!422215 m!412083))

(declare-fun m!412085 () Bool)

(assert (=> b!422215 m!412085))

(declare-fun m!412087 () Bool)

(assert (=> b!422215 m!412087))

(declare-fun m!412089 () Bool)

(assert (=> b!422215 m!412089))

(declare-fun m!412091 () Bool)

(assert (=> b!422215 m!412091))

(assert (=> b!422215 m!412049))

(declare-fun m!412093 () Bool)

(assert (=> b!422215 m!412093))

(declare-fun m!412095 () Bool)

(assert (=> b!422215 m!412095))

(declare-fun m!412097 () Bool)

(assert (=> b!422215 m!412097))

(assert (=> b!422215 m!412095))

(declare-fun m!412099 () Bool)

(assert (=> b!422215 m!412099))

(assert (=> b!422215 m!412085))

(declare-fun m!412101 () Bool)

(assert (=> b!422215 m!412101))

(declare-fun m!412103 () Bool)

(assert (=> b!422215 m!412103))

(declare-fun m!412105 () Bool)

(assert (=> b!422215 m!412105))

(assert (=> b!422215 m!412103))

(check-sat (not start!39510) (not b!422214) (not b!422212) (not mapNonEmpty!18015) (not b!422219) (not b!422213) (not b_next!9777) (not b!422216) (not b!422221) tp_is_empty!10929 (not b!422224) (not b_lambda!9081) b_and!17431 (not b!422215) (not bm!29507) (not b!422217) (not b!422210) (not b!422225) (not bm!29506))
(check-sat b_and!17431 (not b_next!9777))
