; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39476 () Bool)

(assert start!39476)

(declare-fun b_free!9757 () Bool)

(declare-fun b_next!9757 () Bool)

(assert (=> start!39476 (= b_free!9757 (not b_next!9757))))

(declare-fun tp!34799 () Bool)

(declare-fun b_and!17363 () Bool)

(assert (=> start!39476 (= tp!34799 b_and!17363)))

(declare-fun b!421348 () Bool)

(declare-fun res!245962 () Bool)

(declare-fun e!250796 () Bool)

(assert (=> b!421348 (=> (not res!245962) (not e!250796))))

(declare-datatypes ((array!25651 0))(
  ( (array!25652 (arr!12275 (Array (_ BitVec 32) (_ BitVec 64))) (size!12628 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25651)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421348 (= res!245962 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421349 () Bool)

(declare-fun res!245953 () Bool)

(assert (=> b!421349 (=> (not res!245953) (not e!250796))))

(declare-datatypes ((List!7193 0))(
  ( (Nil!7190) (Cons!7189 (h!8045 (_ BitVec 64)) (t!12606 List!7193)) )
))
(declare-fun arrayNoDuplicates!0 (array!25651 (_ BitVec 32) List!7193) Bool)

(assert (=> b!421349 (= res!245953 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7190))))

(declare-fun b!421350 () Bool)

(declare-fun res!245956 () Bool)

(assert (=> b!421350 (=> (not res!245956) (not e!250796))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421350 (= res!245956 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12628 _keys!709))))))

(declare-fun b!421351 () Bool)

(declare-fun e!250803 () Bool)

(declare-fun e!250799 () Bool)

(assert (=> b!421351 (= e!250803 e!250799)))

(declare-fun res!245964 () Bool)

(assert (=> b!421351 (=> (not res!245964) (not e!250799))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!421351 (= res!245964 (= from!863 i!563))))

(declare-datatypes ((V!15651 0))(
  ( (V!15652 (val!5499 Int)) )
))
(declare-datatypes ((ValueCell!5111 0))(
  ( (ValueCellFull!5111 (v!7740 V!15651)) (EmptyCell!5111) )
))
(declare-datatypes ((array!25653 0))(
  ( (array!25654 (arr!12276 (Array (_ BitVec 32) ValueCell!5111)) (size!12629 (_ BitVec 32))) )
))
(declare-fun lt!193338 () array!25653)

(declare-fun minValue!515 () V!15651)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7200 0))(
  ( (tuple2!7201 (_1!3611 (_ BitVec 64)) (_2!3611 V!15651)) )
))
(declare-datatypes ((List!7194 0))(
  ( (Nil!7191) (Cons!7190 (h!8046 tuple2!7200) (t!12607 List!7194)) )
))
(declare-datatypes ((ListLongMap!6103 0))(
  ( (ListLongMap!6104 (toList!3067 List!7194)) )
))
(declare-fun lt!193331 () ListLongMap!6103)

(declare-fun zeroValue!515 () V!15651)

(declare-fun lt!193340 () array!25651)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1277 (array!25651 array!25653 (_ BitVec 32) (_ BitVec 32) V!15651 V!15651 (_ BitVec 32) Int) ListLongMap!6103)

(assert (=> b!421351 (= lt!193331 (getCurrentListMapNoExtraKeys!1277 lt!193340 lt!193338 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25653)

(declare-fun v!412 () V!15651)

(assert (=> b!421351 (= lt!193338 (array!25654 (store (arr!12276 _values!549) i!563 (ValueCellFull!5111 v!412)) (size!12629 _values!549)))))

(declare-fun lt!193330 () ListLongMap!6103)

(assert (=> b!421351 (= lt!193330 (getCurrentListMapNoExtraKeys!1277 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421352 () Bool)

(declare-fun e!250801 () Bool)

(assert (=> b!421352 (= e!250799 (not e!250801))))

(declare-fun res!245952 () Bool)

(assert (=> b!421352 (=> res!245952 e!250801)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421352 (= res!245952 (validKeyInArray!0 (select (arr!12275 _keys!709) from!863)))))

(declare-fun e!250797 () Bool)

(assert (=> b!421352 e!250797))

(declare-fun c!55278 () Bool)

(assert (=> b!421352 (= c!55278 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12424 0))(
  ( (Unit!12425) )
))
(declare-fun lt!193339 () Unit!12424)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!460 (array!25651 array!25653 (_ BitVec 32) (_ BitVec 32) V!15651 V!15651 (_ BitVec 32) (_ BitVec 64) V!15651 (_ BitVec 32) Int) Unit!12424)

(assert (=> b!421352 (= lt!193339 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!460 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421353 () Bool)

(declare-fun res!245958 () Bool)

(assert (=> b!421353 (=> (not res!245958) (not e!250796))))

(assert (=> b!421353 (= res!245958 (or (= (select (arr!12275 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12275 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421354 () Bool)

(declare-fun res!245960 () Bool)

(assert (=> b!421354 (=> (not res!245960) (not e!250803))))

(assert (=> b!421354 (= res!245960 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17985 () Bool)

(declare-fun mapRes!17985 () Bool)

(declare-fun tp!34800 () Bool)

(declare-fun e!250798 () Bool)

(assert (=> mapNonEmpty!17985 (= mapRes!17985 (and tp!34800 e!250798))))

(declare-fun mapValue!17985 () ValueCell!5111)

(declare-fun mapKey!17985 () (_ BitVec 32))

(declare-fun mapRest!17985 () (Array (_ BitVec 32) ValueCell!5111))

(assert (=> mapNonEmpty!17985 (= (arr!12276 _values!549) (store mapRest!17985 mapKey!17985 mapValue!17985))))

(declare-fun b!421355 () Bool)

(declare-fun res!245963 () Bool)

(assert (=> b!421355 (=> (not res!245963) (not e!250796))))

(assert (=> b!421355 (= res!245963 (and (= (size!12629 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12628 _keys!709) (size!12629 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421356 () Bool)

(declare-fun e!250795 () Bool)

(declare-fun e!250802 () Bool)

(assert (=> b!421356 (= e!250795 (and e!250802 mapRes!17985))))

(declare-fun condMapEmpty!17985 () Bool)

(declare-fun mapDefault!17985 () ValueCell!5111)

(assert (=> b!421356 (= condMapEmpty!17985 (= (arr!12276 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5111)) mapDefault!17985)))))

(declare-fun b!421357 () Bool)

(assert (=> b!421357 (= e!250801 true)))

(declare-fun lt!193336 () V!15651)

(declare-fun lt!193332 () ListLongMap!6103)

(declare-fun lt!193335 () tuple2!7200)

(declare-fun +!1287 (ListLongMap!6103 tuple2!7200) ListLongMap!6103)

(assert (=> b!421357 (= (+!1287 lt!193332 lt!193335) (+!1287 (+!1287 lt!193332 (tuple2!7201 k0!794 lt!193336)) lt!193335))))

(declare-fun lt!193334 () V!15651)

(assert (=> b!421357 (= lt!193335 (tuple2!7201 k0!794 lt!193334))))

(declare-fun lt!193337 () Unit!12424)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!71 (ListLongMap!6103 (_ BitVec 64) V!15651 V!15651) Unit!12424)

(assert (=> b!421357 (= lt!193337 (addSameAsAddTwiceSameKeyDiffValues!71 lt!193332 k0!794 lt!193336 lt!193334))))

(declare-fun lt!193333 () V!15651)

(declare-fun get!6098 (ValueCell!5111 V!15651) V!15651)

(assert (=> b!421357 (= lt!193336 (get!6098 (select (arr!12276 _values!549) from!863) lt!193333))))

(assert (=> b!421357 (= lt!193331 (+!1287 lt!193332 (tuple2!7201 (select (arr!12275 lt!193340) from!863) lt!193334)))))

(assert (=> b!421357 (= lt!193334 (get!6098 (select (store (arr!12276 _values!549) i!563 (ValueCellFull!5111 v!412)) from!863) lt!193333))))

(declare-fun dynLambda!728 (Int (_ BitVec 64)) V!15651)

(assert (=> b!421357 (= lt!193333 (dynLambda!728 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!421357 (= lt!193332 (getCurrentListMapNoExtraKeys!1277 lt!193340 lt!193338 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29422 () Bool)

(declare-fun call!29425 () ListLongMap!6103)

(assert (=> bm!29422 (= call!29425 (getCurrentListMapNoExtraKeys!1277 (ite c!55278 _keys!709 lt!193340) (ite c!55278 _values!549 lt!193338) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17985 () Bool)

(assert (=> mapIsEmpty!17985 mapRes!17985))

(declare-fun b!421358 () Bool)

(declare-fun res!245951 () Bool)

(assert (=> b!421358 (=> (not res!245951) (not e!250803))))

(assert (=> b!421358 (= res!245951 (arrayNoDuplicates!0 lt!193340 #b00000000000000000000000000000000 Nil!7190))))

(declare-fun res!245955 () Bool)

(assert (=> start!39476 (=> (not res!245955) (not e!250796))))

(assert (=> start!39476 (= res!245955 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12628 _keys!709))))))

(assert (=> start!39476 e!250796))

(declare-fun tp_is_empty!10909 () Bool)

(assert (=> start!39476 tp_is_empty!10909))

(assert (=> start!39476 tp!34799))

(assert (=> start!39476 true))

(declare-fun array_inv!8984 (array!25653) Bool)

(assert (=> start!39476 (and (array_inv!8984 _values!549) e!250795)))

(declare-fun array_inv!8985 (array!25651) Bool)

(assert (=> start!39476 (array_inv!8985 _keys!709)))

(declare-fun call!29424 () ListLongMap!6103)

(declare-fun bm!29421 () Bool)

(assert (=> bm!29421 (= call!29424 (getCurrentListMapNoExtraKeys!1277 (ite c!55278 lt!193340 _keys!709) (ite c!55278 lt!193338 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421359 () Bool)

(declare-fun res!245954 () Bool)

(assert (=> b!421359 (=> (not res!245954) (not e!250796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25651 (_ BitVec 32)) Bool)

(assert (=> b!421359 (= res!245954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421360 () Bool)

(declare-fun res!245961 () Bool)

(assert (=> b!421360 (=> (not res!245961) (not e!250796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421360 (= res!245961 (validMask!0 mask!1025))))

(declare-fun b!421361 () Bool)

(assert (=> b!421361 (= e!250802 tp_is_empty!10909)))

(declare-fun b!421362 () Bool)

(declare-fun res!245957 () Bool)

(assert (=> b!421362 (=> (not res!245957) (not e!250796))))

(assert (=> b!421362 (= res!245957 (validKeyInArray!0 k0!794))))

(declare-fun b!421363 () Bool)

(assert (=> b!421363 (= e!250798 tp_is_empty!10909)))

(declare-fun b!421364 () Bool)

(assert (=> b!421364 (= e!250797 (= call!29425 call!29424))))

(declare-fun b!421365 () Bool)

(assert (=> b!421365 (= e!250796 e!250803)))

(declare-fun res!245959 () Bool)

(assert (=> b!421365 (=> (not res!245959) (not e!250803))))

(assert (=> b!421365 (= res!245959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193340 mask!1025))))

(assert (=> b!421365 (= lt!193340 (array!25652 (store (arr!12275 _keys!709) i!563 k0!794) (size!12628 _keys!709)))))

(declare-fun b!421366 () Bool)

(assert (=> b!421366 (= e!250797 (= call!29424 (+!1287 call!29425 (tuple2!7201 k0!794 v!412))))))

(assert (= (and start!39476 res!245955) b!421360))

(assert (= (and b!421360 res!245961) b!421355))

(assert (= (and b!421355 res!245963) b!421359))

(assert (= (and b!421359 res!245954) b!421349))

(assert (= (and b!421349 res!245953) b!421350))

(assert (= (and b!421350 res!245956) b!421362))

(assert (= (and b!421362 res!245957) b!421353))

(assert (= (and b!421353 res!245958) b!421348))

(assert (= (and b!421348 res!245962) b!421365))

(assert (= (and b!421365 res!245959) b!421358))

(assert (= (and b!421358 res!245951) b!421354))

(assert (= (and b!421354 res!245960) b!421351))

(assert (= (and b!421351 res!245964) b!421352))

(assert (= (and b!421352 c!55278) b!421366))

(assert (= (and b!421352 (not c!55278)) b!421364))

(assert (= (or b!421366 b!421364) bm!29421))

(assert (= (or b!421366 b!421364) bm!29422))

(assert (= (and b!421352 (not res!245952)) b!421357))

(assert (= (and b!421356 condMapEmpty!17985) mapIsEmpty!17985))

(assert (= (and b!421356 (not condMapEmpty!17985)) mapNonEmpty!17985))

(get-info :version)

(assert (= (and mapNonEmpty!17985 ((_ is ValueCellFull!5111) mapValue!17985)) b!421363))

(assert (= (and b!421356 ((_ is ValueCellFull!5111) mapDefault!17985)) b!421361))

(assert (= start!39476 b!421356))

(declare-fun b_lambda!9043 () Bool)

(assert (=> (not b_lambda!9043) (not b!421357)))

(declare-fun t!12605 () Bool)

(declare-fun tb!3371 () Bool)

(assert (=> (and start!39476 (= defaultEntry!557 defaultEntry!557) t!12605) tb!3371))

(declare-fun result!6277 () Bool)

(assert (=> tb!3371 (= result!6277 tp_is_empty!10909)))

(assert (=> b!421357 t!12605))

(declare-fun b_and!17365 () Bool)

(assert (= b_and!17363 (and (=> t!12605 result!6277) b_and!17365)))

(declare-fun m!410649 () Bool)

(assert (=> b!421365 m!410649))

(declare-fun m!410651 () Bool)

(assert (=> b!421365 m!410651))

(declare-fun m!410653 () Bool)

(assert (=> b!421349 m!410653))

(declare-fun m!410655 () Bool)

(assert (=> b!421357 m!410655))

(declare-fun m!410657 () Bool)

(assert (=> b!421357 m!410657))

(declare-fun m!410659 () Bool)

(assert (=> b!421357 m!410659))

(declare-fun m!410661 () Bool)

(assert (=> b!421357 m!410661))

(declare-fun m!410663 () Bool)

(assert (=> b!421357 m!410663))

(assert (=> b!421357 m!410657))

(declare-fun m!410665 () Bool)

(assert (=> b!421357 m!410665))

(declare-fun m!410667 () Bool)

(assert (=> b!421357 m!410667))

(declare-fun m!410669 () Bool)

(assert (=> b!421357 m!410669))

(declare-fun m!410671 () Bool)

(assert (=> b!421357 m!410671))

(assert (=> b!421357 m!410661))

(declare-fun m!410673 () Bool)

(assert (=> b!421357 m!410673))

(declare-fun m!410675 () Bool)

(assert (=> b!421357 m!410675))

(declare-fun m!410677 () Bool)

(assert (=> b!421357 m!410677))

(declare-fun m!410679 () Bool)

(assert (=> b!421357 m!410679))

(assert (=> b!421357 m!410677))

(declare-fun m!410681 () Bool)

(assert (=> b!421360 m!410681))

(declare-fun m!410683 () Bool)

(assert (=> b!421353 m!410683))

(declare-fun m!410685 () Bool)

(assert (=> b!421352 m!410685))

(assert (=> b!421352 m!410685))

(declare-fun m!410687 () Bool)

(assert (=> b!421352 m!410687))

(declare-fun m!410689 () Bool)

(assert (=> b!421352 m!410689))

(declare-fun m!410691 () Bool)

(assert (=> b!421348 m!410691))

(declare-fun m!410693 () Bool)

(assert (=> b!421358 m!410693))

(declare-fun m!410695 () Bool)

(assert (=> mapNonEmpty!17985 m!410695))

(declare-fun m!410697 () Bool)

(assert (=> b!421362 m!410697))

(declare-fun m!410699 () Bool)

(assert (=> bm!29421 m!410699))

(declare-fun m!410701 () Bool)

(assert (=> start!39476 m!410701))

(declare-fun m!410703 () Bool)

(assert (=> start!39476 m!410703))

(declare-fun m!410705 () Bool)

(assert (=> bm!29422 m!410705))

(declare-fun m!410707 () Bool)

(assert (=> b!421359 m!410707))

(declare-fun m!410709 () Bool)

(assert (=> b!421366 m!410709))

(declare-fun m!410711 () Bool)

(assert (=> b!421351 m!410711))

(assert (=> b!421351 m!410671))

(declare-fun m!410713 () Bool)

(assert (=> b!421351 m!410713))

(check-sat tp_is_empty!10909 (not b!421360) (not b!421358) (not b!421351) (not bm!29421) (not b!421366) (not b!421357) (not b_next!9757) (not b!421362) (not b!421349) (not b!421348) (not bm!29422) (not b!421365) b_and!17365 (not b!421352) (not start!39476) (not b!421359) (not mapNonEmpty!17985) (not b_lambda!9043))
(check-sat b_and!17365 (not b_next!9757))
