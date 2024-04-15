; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39428 () Bool)

(assert start!39428)

(declare-fun b_free!9709 () Bool)

(declare-fun b_next!9709 () Bool)

(assert (=> start!39428 (= b_free!9709 (not b_next!9709))))

(declare-fun tp!34655 () Bool)

(declare-fun b_and!17267 () Bool)

(assert (=> start!39428 (= tp!34655 b_and!17267)))

(declare-fun b!419932 () Bool)

(declare-fun res!244953 () Bool)

(declare-fun e!250147 () Bool)

(assert (=> b!419932 (=> (not res!244953) (not e!250147))))

(declare-datatypes ((array!25555 0))(
  ( (array!25556 (arr!12227 (Array (_ BitVec 32) (_ BitVec 64))) (size!12580 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25555)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419932 (= res!244953 (or (= (select (arr!12227 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12227 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17913 () Bool)

(declare-fun mapRes!17913 () Bool)

(declare-fun tp!34656 () Bool)

(declare-fun e!250153 () Bool)

(assert (=> mapNonEmpty!17913 (= mapRes!17913 (and tp!34656 e!250153))))

(declare-datatypes ((V!15587 0))(
  ( (V!15588 (val!5475 Int)) )
))
(declare-datatypes ((ValueCell!5087 0))(
  ( (ValueCellFull!5087 (v!7716 V!15587)) (EmptyCell!5087) )
))
(declare-fun mapValue!17913 () ValueCell!5087)

(declare-fun mapRest!17913 () (Array (_ BitVec 32) ValueCell!5087))

(declare-datatypes ((array!25557 0))(
  ( (array!25558 (arr!12228 (Array (_ BitVec 32) ValueCell!5087)) (size!12581 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25557)

(declare-fun mapKey!17913 () (_ BitVec 32))

(assert (=> mapNonEmpty!17913 (= (arr!12228 _values!549) (store mapRest!17913 mapKey!17913 mapValue!17913))))

(declare-fun minValue!515 () V!15587)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15587)

(declare-fun bm!29277 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!192538 () array!25555)

(declare-fun lt!192542 () array!25557)

(declare-fun c!55206 () Bool)

(declare-datatypes ((tuple2!7156 0))(
  ( (tuple2!7157 (_1!3589 (_ BitVec 64)) (_2!3589 V!15587)) )
))
(declare-datatypes ((List!7153 0))(
  ( (Nil!7150) (Cons!7149 (h!8005 tuple2!7156) (t!12518 List!7153)) )
))
(declare-datatypes ((ListLongMap!6059 0))(
  ( (ListLongMap!6060 (toList!3045 List!7153)) )
))
(declare-fun call!29281 () ListLongMap!6059)

(declare-fun getCurrentListMapNoExtraKeys!1255 (array!25555 array!25557 (_ BitVec 32) (_ BitVec 32) V!15587 V!15587 (_ BitVec 32) Int) ListLongMap!6059)

(assert (=> bm!29277 (= call!29281 (getCurrentListMapNoExtraKeys!1255 (ite c!55206 _keys!709 lt!192538) (ite c!55206 _values!549 lt!192542) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419934 () Bool)

(declare-fun e!250155 () Bool)

(declare-fun e!250150 () Bool)

(assert (=> b!419934 (= e!250155 (and e!250150 mapRes!17913))))

(declare-fun condMapEmpty!17913 () Bool)

(declare-fun mapDefault!17913 () ValueCell!5087)

(assert (=> b!419934 (= condMapEmpty!17913 (= (arr!12228 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5087)) mapDefault!17913)))))

(declare-fun b!419935 () Bool)

(declare-fun res!244956 () Bool)

(assert (=> b!419935 (=> (not res!244956) (not e!250147))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419935 (= res!244956 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!419936 () Bool)

(declare-fun res!244952 () Bool)

(assert (=> b!419936 (=> (not res!244952) (not e!250147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419936 (= res!244952 (validMask!0 mask!1025))))

(declare-fun b!419937 () Bool)

(declare-fun res!244948 () Bool)

(assert (=> b!419937 (=> (not res!244948) (not e!250147))))

(declare-datatypes ((List!7154 0))(
  ( (Nil!7151) (Cons!7150 (h!8006 (_ BitVec 64)) (t!12519 List!7154)) )
))
(declare-fun arrayNoDuplicates!0 (array!25555 (_ BitVec 32) List!7154) Bool)

(assert (=> b!419937 (= res!244948 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7151))))

(declare-fun b!419938 () Bool)

(declare-fun res!244944 () Bool)

(assert (=> b!419938 (=> (not res!244944) (not e!250147))))

(assert (=> b!419938 (= res!244944 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12580 _keys!709))))))

(declare-fun b!419939 () Bool)

(declare-fun e!250152 () Bool)

(declare-fun e!250148 () Bool)

(assert (=> b!419939 (= e!250152 e!250148)))

(declare-fun res!244954 () Bool)

(assert (=> b!419939 (=> (not res!244954) (not e!250148))))

(assert (=> b!419939 (= res!244954 (= from!863 i!563))))

(declare-fun lt!192539 () ListLongMap!6059)

(assert (=> b!419939 (= lt!192539 (getCurrentListMapNoExtraKeys!1255 lt!192538 lt!192542 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15587)

(assert (=> b!419939 (= lt!192542 (array!25558 (store (arr!12228 _values!549) i!563 (ValueCellFull!5087 v!412)) (size!12581 _values!549)))))

(declare-fun lt!192544 () ListLongMap!6059)

(assert (=> b!419939 (= lt!192544 (getCurrentListMapNoExtraKeys!1255 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!29278 () Bool)

(declare-fun call!29280 () ListLongMap!6059)

(assert (=> bm!29278 (= call!29280 (getCurrentListMapNoExtraKeys!1255 (ite c!55206 lt!192538 _keys!709) (ite c!55206 lt!192542 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419940 () Bool)

(declare-fun e!250149 () Bool)

(assert (=> b!419940 (= e!250148 (not e!250149))))

(declare-fun res!244945 () Bool)

(assert (=> b!419940 (=> res!244945 e!250149)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419940 (= res!244945 (validKeyInArray!0 (select (arr!12227 _keys!709) from!863)))))

(declare-fun e!250151 () Bool)

(assert (=> b!419940 e!250151))

(assert (=> b!419940 (= c!55206 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12384 0))(
  ( (Unit!12385) )
))
(declare-fun lt!192543 () Unit!12384)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!444 (array!25555 array!25557 (_ BitVec 32) (_ BitVec 32) V!15587 V!15587 (_ BitVec 32) (_ BitVec 64) V!15587 (_ BitVec 32) Int) Unit!12384)

(assert (=> b!419940 (= lt!192543 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!444 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17913 () Bool)

(assert (=> mapIsEmpty!17913 mapRes!17913))

(declare-fun b!419941 () Bool)

(assert (=> b!419941 (= e!250151 (= call!29281 call!29280))))

(declare-fun b!419942 () Bool)

(assert (=> b!419942 (= e!250147 e!250152)))

(declare-fun res!244946 () Bool)

(assert (=> b!419942 (=> (not res!244946) (not e!250152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25555 (_ BitVec 32)) Bool)

(assert (=> b!419942 (= res!244946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192538 mask!1025))))

(assert (=> b!419942 (= lt!192538 (array!25556 (store (arr!12227 _keys!709) i!563 k0!794) (size!12580 _keys!709)))))

(declare-fun b!419943 () Bool)

(declare-fun +!1270 (ListLongMap!6059 tuple2!7156) ListLongMap!6059)

(assert (=> b!419943 (= e!250151 (= call!29280 (+!1270 call!29281 (tuple2!7157 k0!794 v!412))))))

(declare-fun b!419944 () Bool)

(declare-fun res!244951 () Bool)

(assert (=> b!419944 (=> (not res!244951) (not e!250147))))

(assert (=> b!419944 (= res!244951 (and (= (size!12581 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12580 _keys!709) (size!12581 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419933 () Bool)

(declare-fun res!244955 () Bool)

(assert (=> b!419933 (=> (not res!244955) (not e!250147))))

(assert (=> b!419933 (= res!244955 (validKeyInArray!0 k0!794))))

(declare-fun res!244949 () Bool)

(assert (=> start!39428 (=> (not res!244949) (not e!250147))))

(assert (=> start!39428 (= res!244949 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12580 _keys!709))))))

(assert (=> start!39428 e!250147))

(declare-fun tp_is_empty!10861 () Bool)

(assert (=> start!39428 tp_is_empty!10861))

(assert (=> start!39428 tp!34655))

(assert (=> start!39428 true))

(declare-fun array_inv!8956 (array!25557) Bool)

(assert (=> start!39428 (and (array_inv!8956 _values!549) e!250155)))

(declare-fun array_inv!8957 (array!25555) Bool)

(assert (=> start!39428 (array_inv!8957 _keys!709)))

(declare-fun b!419945 () Bool)

(declare-fun res!244947 () Bool)

(assert (=> b!419945 (=> (not res!244947) (not e!250147))))

(assert (=> b!419945 (= res!244947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419946 () Bool)

(assert (=> b!419946 (= e!250153 tp_is_empty!10861)))

(declare-fun b!419947 () Bool)

(declare-fun res!244950 () Bool)

(assert (=> b!419947 (=> (not res!244950) (not e!250152))))

(assert (=> b!419947 (= res!244950 (bvsle from!863 i!563))))

(declare-fun b!419948 () Bool)

(assert (=> b!419948 (= e!250149 true)))

(declare-fun lt!192545 () V!15587)

(declare-fun lt!192541 () ListLongMap!6059)

(declare-fun lt!192547 () tuple2!7156)

(assert (=> b!419948 (= (+!1270 lt!192541 lt!192547) (+!1270 (+!1270 lt!192541 (tuple2!7157 k0!794 lt!192545)) lt!192547))))

(declare-fun lt!192546 () V!15587)

(assert (=> b!419948 (= lt!192547 (tuple2!7157 k0!794 lt!192546))))

(declare-fun lt!192548 () Unit!12384)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!54 (ListLongMap!6059 (_ BitVec 64) V!15587 V!15587) Unit!12384)

(assert (=> b!419948 (= lt!192548 (addSameAsAddTwiceSameKeyDiffValues!54 lt!192541 k0!794 lt!192545 lt!192546))))

(declare-fun lt!192540 () V!15587)

(declare-fun get!6065 (ValueCell!5087 V!15587) V!15587)

(assert (=> b!419948 (= lt!192545 (get!6065 (select (arr!12228 _values!549) from!863) lt!192540))))

(assert (=> b!419948 (= lt!192539 (+!1270 lt!192541 (tuple2!7157 (select (arr!12227 lt!192538) from!863) lt!192546)))))

(assert (=> b!419948 (= lt!192546 (get!6065 (select (store (arr!12228 _values!549) i!563 (ValueCellFull!5087 v!412)) from!863) lt!192540))))

(declare-fun dynLambda!711 (Int (_ BitVec 64)) V!15587)

(assert (=> b!419948 (= lt!192540 (dynLambda!711 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419948 (= lt!192541 (getCurrentListMapNoExtraKeys!1255 lt!192538 lt!192542 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419949 () Bool)

(assert (=> b!419949 (= e!250150 tp_is_empty!10861)))

(declare-fun b!419950 () Bool)

(declare-fun res!244943 () Bool)

(assert (=> b!419950 (=> (not res!244943) (not e!250152))))

(assert (=> b!419950 (= res!244943 (arrayNoDuplicates!0 lt!192538 #b00000000000000000000000000000000 Nil!7151))))

(assert (= (and start!39428 res!244949) b!419936))

(assert (= (and b!419936 res!244952) b!419944))

(assert (= (and b!419944 res!244951) b!419945))

(assert (= (and b!419945 res!244947) b!419937))

(assert (= (and b!419937 res!244948) b!419938))

(assert (= (and b!419938 res!244944) b!419933))

(assert (= (and b!419933 res!244955) b!419932))

(assert (= (and b!419932 res!244953) b!419935))

(assert (= (and b!419935 res!244956) b!419942))

(assert (= (and b!419942 res!244946) b!419950))

(assert (= (and b!419950 res!244943) b!419947))

(assert (= (and b!419947 res!244950) b!419939))

(assert (= (and b!419939 res!244954) b!419940))

(assert (= (and b!419940 c!55206) b!419943))

(assert (= (and b!419940 (not c!55206)) b!419941))

(assert (= (or b!419943 b!419941) bm!29278))

(assert (= (or b!419943 b!419941) bm!29277))

(assert (= (and b!419940 (not res!244945)) b!419948))

(assert (= (and b!419934 condMapEmpty!17913) mapIsEmpty!17913))

(assert (= (and b!419934 (not condMapEmpty!17913)) mapNonEmpty!17913))

(get-info :version)

(assert (= (and mapNonEmpty!17913 ((_ is ValueCellFull!5087) mapValue!17913)) b!419946))

(assert (= (and b!419934 ((_ is ValueCellFull!5087) mapDefault!17913)) b!419949))

(assert (= start!39428 b!419934))

(declare-fun b_lambda!8995 () Bool)

(assert (=> (not b_lambda!8995) (not b!419948)))

(declare-fun t!12517 () Bool)

(declare-fun tb!3323 () Bool)

(assert (=> (and start!39428 (= defaultEntry!557 defaultEntry!557) t!12517) tb!3323))

(declare-fun result!6181 () Bool)

(assert (=> tb!3323 (= result!6181 tp_is_empty!10861)))

(assert (=> b!419948 t!12517))

(declare-fun b_and!17269 () Bool)

(assert (= b_and!17267 (and (=> t!12517 result!6181) b_and!17269)))

(declare-fun m!409065 () Bool)

(assert (=> b!419945 m!409065))

(declare-fun m!409067 () Bool)

(assert (=> b!419936 m!409067))

(declare-fun m!409069 () Bool)

(assert (=> b!419939 m!409069))

(declare-fun m!409071 () Bool)

(assert (=> b!419939 m!409071))

(declare-fun m!409073 () Bool)

(assert (=> b!419939 m!409073))

(declare-fun m!409075 () Bool)

(assert (=> start!39428 m!409075))

(declare-fun m!409077 () Bool)

(assert (=> start!39428 m!409077))

(declare-fun m!409079 () Bool)

(assert (=> bm!29278 m!409079))

(declare-fun m!409081 () Bool)

(assert (=> b!419940 m!409081))

(assert (=> b!419940 m!409081))

(declare-fun m!409083 () Bool)

(assert (=> b!419940 m!409083))

(declare-fun m!409085 () Bool)

(assert (=> b!419940 m!409085))

(declare-fun m!409087 () Bool)

(assert (=> b!419942 m!409087))

(declare-fun m!409089 () Bool)

(assert (=> b!419942 m!409089))

(declare-fun m!409091 () Bool)

(assert (=> mapNonEmpty!17913 m!409091))

(declare-fun m!409093 () Bool)

(assert (=> bm!29277 m!409093))

(declare-fun m!409095 () Bool)

(assert (=> b!419932 m!409095))

(declare-fun m!409097 () Bool)

(assert (=> b!419943 m!409097))

(declare-fun m!409099 () Bool)

(assert (=> b!419950 m!409099))

(declare-fun m!409101 () Bool)

(assert (=> b!419933 m!409101))

(declare-fun m!409103 () Bool)

(assert (=> b!419937 m!409103))

(declare-fun m!409105 () Bool)

(assert (=> b!419935 m!409105))

(declare-fun m!409107 () Bool)

(assert (=> b!419948 m!409107))

(declare-fun m!409109 () Bool)

(assert (=> b!419948 m!409109))

(declare-fun m!409111 () Bool)

(assert (=> b!419948 m!409111))

(assert (=> b!419948 m!409071))

(declare-fun m!409113 () Bool)

(assert (=> b!419948 m!409113))

(declare-fun m!409115 () Bool)

(assert (=> b!419948 m!409115))

(declare-fun m!409117 () Bool)

(assert (=> b!419948 m!409117))

(declare-fun m!409119 () Bool)

(assert (=> b!419948 m!409119))

(declare-fun m!409121 () Bool)

(assert (=> b!419948 m!409121))

(declare-fun m!409123 () Bool)

(assert (=> b!419948 m!409123))

(declare-fun m!409125 () Bool)

(assert (=> b!419948 m!409125))

(assert (=> b!419948 m!409107))

(declare-fun m!409127 () Bool)

(assert (=> b!419948 m!409127))

(assert (=> b!419948 m!409123))

(declare-fun m!409129 () Bool)

(assert (=> b!419948 m!409129))

(assert (=> b!419948 m!409115))

(check-sat (not b!419937) (not b!419942) b_and!17269 (not b!419936) tp_is_empty!10861 (not bm!29278) (not start!39428) (not b!419948) (not b_next!9709) (not bm!29277) (not mapNonEmpty!17913) (not b!419935) (not b!419943) (not b_lambda!8995) (not b!419933) (not b!419950) (not b!419945) (not b!419940) (not b!419939))
(check-sat b_and!17269 (not b_next!9709))
