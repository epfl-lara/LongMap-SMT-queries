; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39420 () Bool)

(assert start!39420)

(declare-fun b_free!9687 () Bool)

(declare-fun b_next!9687 () Bool)

(assert (=> start!39420 (= b_free!9687 (not b_next!9687))))

(declare-fun tp!34590 () Bool)

(declare-fun b_and!17249 () Bool)

(assert (=> start!39420 (= tp!34590 b_and!17249)))

(declare-fun b!419554 () Bool)

(declare-fun res!244617 () Bool)

(declare-fun e!250028 () Bool)

(assert (=> b!419554 (=> (not res!244617) (not e!250028))))

(declare-datatypes ((array!25527 0))(
  ( (array!25528 (arr!12213 (Array (_ BitVec 32) (_ BitVec 64))) (size!12565 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25527)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419554 (= res!244617 (or (= (select (arr!12213 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12213 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17880 () Bool)

(declare-fun mapRes!17880 () Bool)

(declare-fun tp!34589 () Bool)

(declare-fun e!250029 () Bool)

(assert (=> mapNonEmpty!17880 (= mapRes!17880 (and tp!34589 e!250029))))

(declare-datatypes ((V!15557 0))(
  ( (V!15558 (val!5464 Int)) )
))
(declare-datatypes ((ValueCell!5076 0))(
  ( (ValueCellFull!5076 (v!7711 V!15557)) (EmptyCell!5076) )
))
(declare-datatypes ((array!25529 0))(
  ( (array!25530 (arr!12214 (Array (_ BitVec 32) ValueCell!5076)) (size!12566 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25529)

(declare-fun mapRest!17880 () (Array (_ BitVec 32) ValueCell!5076))

(declare-fun mapValue!17880 () ValueCell!5076)

(declare-fun mapKey!17880 () (_ BitVec 32))

(assert (=> mapNonEmpty!17880 (= (arr!12214 _values!549) (store mapRest!17880 mapKey!17880 mapValue!17880))))

(declare-fun b!419555 () Bool)

(declare-fun res!244612 () Bool)

(assert (=> b!419555 (=> (not res!244612) (not e!250028))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419555 (= res!244612 (validMask!0 mask!1025))))

(declare-fun lt!192409 () array!25529)

(declare-fun minValue!515 () V!15557)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!192410 () array!25527)

(declare-fun zeroValue!515 () V!15557)

(declare-fun bm!29236 () Bool)

(declare-fun c!55244 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7152 0))(
  ( (tuple2!7153 (_1!3587 (_ BitVec 64)) (_2!3587 V!15557)) )
))
(declare-datatypes ((List!7161 0))(
  ( (Nil!7158) (Cons!7157 (h!8013 tuple2!7152) (t!12513 List!7161)) )
))
(declare-datatypes ((ListLongMap!6065 0))(
  ( (ListLongMap!6066 (toList!3048 List!7161)) )
))
(declare-fun call!29240 () ListLongMap!6065)

(declare-fun getCurrentListMapNoExtraKeys!1253 (array!25527 array!25529 (_ BitVec 32) (_ BitVec 32) V!15557 V!15557 (_ BitVec 32) Int) ListLongMap!6065)

(assert (=> bm!29236 (= call!29240 (getCurrentListMapNoExtraKeys!1253 (ite c!55244 lt!192410 _keys!709) (ite c!55244 lt!192409 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419556 () Bool)

(declare-fun e!250026 () Bool)

(assert (=> b!419556 (= e!250028 e!250026)))

(declare-fun res!244613 () Bool)

(assert (=> b!419556 (=> (not res!244613) (not e!250026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25527 (_ BitVec 32)) Bool)

(assert (=> b!419556 (= res!244613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192410 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!419556 (= lt!192410 (array!25528 (store (arr!12213 _keys!709) i!563 k0!794) (size!12565 _keys!709)))))

(declare-fun b!419557 () Bool)

(declare-fun res!244620 () Bool)

(assert (=> b!419557 (=> (not res!244620) (not e!250026))))

(declare-datatypes ((List!7162 0))(
  ( (Nil!7159) (Cons!7158 (h!8014 (_ BitVec 64)) (t!12514 List!7162)) )
))
(declare-fun arrayNoDuplicates!0 (array!25527 (_ BitVec 32) List!7162) Bool)

(assert (=> b!419557 (= res!244620 (arrayNoDuplicates!0 lt!192410 #b00000000000000000000000000000000 Nil!7159))))

(declare-fun res!244622 () Bool)

(assert (=> start!39420 (=> (not res!244622) (not e!250028))))

(assert (=> start!39420 (= res!244622 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12565 _keys!709))))))

(assert (=> start!39420 e!250028))

(declare-fun tp_is_empty!10839 () Bool)

(assert (=> start!39420 tp_is_empty!10839))

(assert (=> start!39420 tp!34590))

(assert (=> start!39420 true))

(declare-fun e!250031 () Bool)

(declare-fun array_inv!8906 (array!25529) Bool)

(assert (=> start!39420 (and (array_inv!8906 _values!549) e!250031)))

(declare-fun array_inv!8907 (array!25527) Bool)

(assert (=> start!39420 (array_inv!8907 _keys!709)))

(declare-fun e!250032 () Bool)

(declare-fun call!29239 () ListLongMap!6065)

(declare-fun v!412 () V!15557)

(declare-fun b!419558 () Bool)

(declare-fun +!1245 (ListLongMap!6065 tuple2!7152) ListLongMap!6065)

(assert (=> b!419558 (= e!250032 (= call!29240 (+!1245 call!29239 (tuple2!7153 k0!794 v!412))))))

(declare-fun b!419559 () Bool)

(declare-fun e!250027 () Bool)

(assert (=> b!419559 (= e!250026 e!250027)))

(declare-fun res!244616 () Bool)

(assert (=> b!419559 (=> (not res!244616) (not e!250027))))

(assert (=> b!419559 (= res!244616 (= from!863 i!563))))

(declare-fun lt!192414 () ListLongMap!6065)

(assert (=> b!419559 (= lt!192414 (getCurrentListMapNoExtraKeys!1253 lt!192410 lt!192409 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419559 (= lt!192409 (array!25530 (store (arr!12214 _values!549) i!563 (ValueCellFull!5076 v!412)) (size!12566 _values!549)))))

(declare-fun lt!192411 () ListLongMap!6065)

(assert (=> b!419559 (= lt!192411 (getCurrentListMapNoExtraKeys!1253 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419560 () Bool)

(declare-fun e!250024 () Bool)

(assert (=> b!419560 (= e!250024 tp_is_empty!10839)))

(declare-fun b!419561 () Bool)

(declare-fun e!250030 () Bool)

(assert (=> b!419561 (= e!250030 true)))

(declare-fun lt!192415 () V!15557)

(declare-fun lt!192417 () ListLongMap!6065)

(declare-fun lt!192418 () tuple2!7152)

(assert (=> b!419561 (= (+!1245 lt!192417 lt!192418) (+!1245 (+!1245 lt!192417 (tuple2!7153 k0!794 lt!192415)) lt!192418))))

(declare-fun lt!192419 () V!15557)

(assert (=> b!419561 (= lt!192418 (tuple2!7153 k0!794 lt!192419))))

(declare-datatypes ((Unit!12398 0))(
  ( (Unit!12399) )
))
(declare-fun lt!192416 () Unit!12398)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!44 (ListLongMap!6065 (_ BitVec 64) V!15557 V!15557) Unit!12398)

(assert (=> b!419561 (= lt!192416 (addSameAsAddTwiceSameKeyDiffValues!44 lt!192417 k0!794 lt!192415 lt!192419))))

(declare-fun lt!192413 () V!15557)

(declare-fun get!6058 (ValueCell!5076 V!15557) V!15557)

(assert (=> b!419561 (= lt!192415 (get!6058 (select (arr!12214 _values!549) from!863) lt!192413))))

(assert (=> b!419561 (= lt!192414 (+!1245 lt!192417 (tuple2!7153 (select (arr!12213 lt!192410) from!863) lt!192419)))))

(assert (=> b!419561 (= lt!192419 (get!6058 (select (store (arr!12214 _values!549) i!563 (ValueCellFull!5076 v!412)) from!863) lt!192413))))

(declare-fun dynLambda!715 (Int (_ BitVec 64)) V!15557)

(assert (=> b!419561 (= lt!192413 (dynLambda!715 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419561 (= lt!192417 (getCurrentListMapNoExtraKeys!1253 lt!192410 lt!192409 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419562 () Bool)

(declare-fun res!244611 () Bool)

(assert (=> b!419562 (=> (not res!244611) (not e!250028))))

(assert (=> b!419562 (= res!244611 (and (= (size!12566 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12565 _keys!709) (size!12566 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419563 () Bool)

(declare-fun res!244621 () Bool)

(assert (=> b!419563 (=> (not res!244621) (not e!250028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419563 (= res!244621 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17880 () Bool)

(assert (=> mapIsEmpty!17880 mapRes!17880))

(declare-fun b!419564 () Bool)

(declare-fun res!244610 () Bool)

(assert (=> b!419564 (=> (not res!244610) (not e!250028))))

(assert (=> b!419564 (= res!244610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419565 () Bool)

(assert (=> b!419565 (= e!250032 (= call!29239 call!29240))))

(declare-fun b!419566 () Bool)

(assert (=> b!419566 (= e!250029 tp_is_empty!10839)))

(declare-fun b!419567 () Bool)

(declare-fun res!244618 () Bool)

(assert (=> b!419567 (=> (not res!244618) (not e!250028))))

(assert (=> b!419567 (= res!244618 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7159))))

(declare-fun b!419568 () Bool)

(declare-fun res!244615 () Bool)

(assert (=> b!419568 (=> (not res!244615) (not e!250028))))

(declare-fun arrayContainsKey!0 (array!25527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419568 (= res!244615 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!419569 () Bool)

(assert (=> b!419569 (= e!250031 (and e!250024 mapRes!17880))))

(declare-fun condMapEmpty!17880 () Bool)

(declare-fun mapDefault!17880 () ValueCell!5076)

(assert (=> b!419569 (= condMapEmpty!17880 (= (arr!12214 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5076)) mapDefault!17880)))))

(declare-fun bm!29237 () Bool)

(assert (=> bm!29237 (= call!29239 (getCurrentListMapNoExtraKeys!1253 (ite c!55244 _keys!709 lt!192410) (ite c!55244 _values!549 lt!192409) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419570 () Bool)

(assert (=> b!419570 (= e!250027 (not e!250030))))

(declare-fun res!244623 () Bool)

(assert (=> b!419570 (=> res!244623 e!250030)))

(assert (=> b!419570 (= res!244623 (validKeyInArray!0 (select (arr!12213 _keys!709) from!863)))))

(assert (=> b!419570 e!250032))

(assert (=> b!419570 (= c!55244 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!192412 () Unit!12398)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!449 (array!25527 array!25529 (_ BitVec 32) (_ BitVec 32) V!15557 V!15557 (_ BitVec 32) (_ BitVec 64) V!15557 (_ BitVec 32) Int) Unit!12398)

(assert (=> b!419570 (= lt!192412 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!449 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419571 () Bool)

(declare-fun res!244614 () Bool)

(assert (=> b!419571 (=> (not res!244614) (not e!250028))))

(assert (=> b!419571 (= res!244614 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12565 _keys!709))))))

(declare-fun b!419572 () Bool)

(declare-fun res!244619 () Bool)

(assert (=> b!419572 (=> (not res!244619) (not e!250026))))

(assert (=> b!419572 (= res!244619 (bvsle from!863 i!563))))

(assert (= (and start!39420 res!244622) b!419555))

(assert (= (and b!419555 res!244612) b!419562))

(assert (= (and b!419562 res!244611) b!419564))

(assert (= (and b!419564 res!244610) b!419567))

(assert (= (and b!419567 res!244618) b!419571))

(assert (= (and b!419571 res!244614) b!419563))

(assert (= (and b!419563 res!244621) b!419554))

(assert (= (and b!419554 res!244617) b!419568))

(assert (= (and b!419568 res!244615) b!419556))

(assert (= (and b!419556 res!244613) b!419557))

(assert (= (and b!419557 res!244620) b!419572))

(assert (= (and b!419572 res!244619) b!419559))

(assert (= (and b!419559 res!244616) b!419570))

(assert (= (and b!419570 c!55244) b!419558))

(assert (= (and b!419570 (not c!55244)) b!419565))

(assert (= (or b!419558 b!419565) bm!29236))

(assert (= (or b!419558 b!419565) bm!29237))

(assert (= (and b!419570 (not res!244623)) b!419561))

(assert (= (and b!419569 condMapEmpty!17880) mapIsEmpty!17880))

(assert (= (and b!419569 (not condMapEmpty!17880)) mapNonEmpty!17880))

(get-info :version)

(assert (= (and mapNonEmpty!17880 ((_ is ValueCellFull!5076) mapValue!17880)) b!419566))

(assert (= (and b!419569 ((_ is ValueCellFull!5076) mapDefault!17880)) b!419560))

(assert (= start!39420 b!419569))

(declare-fun b_lambda!8991 () Bool)

(assert (=> (not b_lambda!8991) (not b!419561)))

(declare-fun t!12512 () Bool)

(declare-fun tb!3309 () Bool)

(assert (=> (and start!39420 (= defaultEntry!557 defaultEntry!557) t!12512) tb!3309))

(declare-fun result!6145 () Bool)

(assert (=> tb!3309 (= result!6145 tp_is_empty!10839)))

(assert (=> b!419561 t!12512))

(declare-fun b_and!17251 () Bool)

(assert (= b_and!17249 (and (=> t!12512 result!6145) b_and!17251)))

(declare-fun m!409073 () Bool)

(assert (=> b!419563 m!409073))

(declare-fun m!409075 () Bool)

(assert (=> bm!29237 m!409075))

(declare-fun m!409077 () Bool)

(assert (=> b!419561 m!409077))

(declare-fun m!409079 () Bool)

(assert (=> b!419561 m!409079))

(declare-fun m!409081 () Bool)

(assert (=> b!419561 m!409081))

(declare-fun m!409083 () Bool)

(assert (=> b!419561 m!409083))

(declare-fun m!409085 () Bool)

(assert (=> b!419561 m!409085))

(declare-fun m!409087 () Bool)

(assert (=> b!419561 m!409087))

(assert (=> b!419561 m!409079))

(declare-fun m!409089 () Bool)

(assert (=> b!419561 m!409089))

(declare-fun m!409091 () Bool)

(assert (=> b!419561 m!409091))

(declare-fun m!409093 () Bool)

(assert (=> b!419561 m!409093))

(assert (=> b!419561 m!409087))

(declare-fun m!409095 () Bool)

(assert (=> b!419561 m!409095))

(declare-fun m!409097 () Bool)

(assert (=> b!419561 m!409097))

(declare-fun m!409099 () Bool)

(assert (=> b!419561 m!409099))

(assert (=> b!419561 m!409093))

(declare-fun m!409101 () Bool)

(assert (=> b!419561 m!409101))

(declare-fun m!409103 () Bool)

(assert (=> b!419557 m!409103))

(declare-fun m!409105 () Bool)

(assert (=> bm!29236 m!409105))

(declare-fun m!409107 () Bool)

(assert (=> b!419567 m!409107))

(declare-fun m!409109 () Bool)

(assert (=> b!419568 m!409109))

(declare-fun m!409111 () Bool)

(assert (=> b!419554 m!409111))

(declare-fun m!409113 () Bool)

(assert (=> mapNonEmpty!17880 m!409113))

(declare-fun m!409115 () Bool)

(assert (=> start!39420 m!409115))

(declare-fun m!409117 () Bool)

(assert (=> start!39420 m!409117))

(declare-fun m!409119 () Bool)

(assert (=> b!419559 m!409119))

(assert (=> b!419559 m!409097))

(declare-fun m!409121 () Bool)

(assert (=> b!419559 m!409121))

(declare-fun m!409123 () Bool)

(assert (=> b!419570 m!409123))

(assert (=> b!419570 m!409123))

(declare-fun m!409125 () Bool)

(assert (=> b!419570 m!409125))

(declare-fun m!409127 () Bool)

(assert (=> b!419570 m!409127))

(declare-fun m!409129 () Bool)

(assert (=> b!419556 m!409129))

(declare-fun m!409131 () Bool)

(assert (=> b!419556 m!409131))

(declare-fun m!409133 () Bool)

(assert (=> b!419558 m!409133))

(declare-fun m!409135 () Bool)

(assert (=> b!419564 m!409135))

(declare-fun m!409137 () Bool)

(assert (=> b!419555 m!409137))

(check-sat (not b_next!9687) tp_is_empty!10839 (not b_lambda!8991) (not b!419567) (not b!419559) (not b!419557) (not b!419561) (not b!419568) b_and!17251 (not b!419558) (not bm!29236) (not b!419564) (not mapNonEmpty!17880) (not b!419555) (not b!419563) (not bm!29237) (not b!419570) (not b!419556) (not start!39420))
(check-sat b_and!17251 (not b_next!9687))
