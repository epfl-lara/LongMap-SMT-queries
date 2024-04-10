; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39378 () Bool)

(assert start!39378)

(declare-fun b_free!9645 () Bool)

(declare-fun b_next!9645 () Bool)

(assert (=> start!39378 (= b_free!9645 (not b_next!9645))))

(declare-fun tp!34464 () Bool)

(declare-fun b_and!17165 () Bool)

(assert (=> start!39378 (= tp!34464 b_and!17165)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15501 0))(
  ( (V!15502 (val!5443 Int)) )
))
(declare-datatypes ((ValueCell!5055 0))(
  ( (ValueCellFull!5055 (v!7690 V!15501)) (EmptyCell!5055) )
))
(declare-datatypes ((array!25445 0))(
  ( (array!25446 (arr!12172 (Array (_ BitVec 32) ValueCell!5055)) (size!12524 (_ BitVec 32))) )
))
(declare-fun lt!191719 () array!25445)

(declare-fun _values!549 () array!25445)

(declare-datatypes ((array!25447 0))(
  ( (array!25448 (arr!12173 (Array (_ BitVec 32) (_ BitVec 64))) (size!12525 (_ BitVec 32))) )
))
(declare-fun lt!191726 () array!25447)

(declare-datatypes ((tuple2!7116 0))(
  ( (tuple2!7117 (_1!3569 (_ BitVec 64)) (_2!3569 V!15501)) )
))
(declare-datatypes ((List!7129 0))(
  ( (Nil!7126) (Cons!7125 (h!7981 tuple2!7116) (t!12439 List!7129)) )
))
(declare-datatypes ((ListLongMap!6029 0))(
  ( (ListLongMap!6030 (toList!3030 List!7129)) )
))
(declare-fun call!29114 () ListLongMap!6029)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25447)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15501)

(declare-fun bm!29110 () Bool)

(declare-fun c!55181 () Bool)

(declare-fun zeroValue!515 () V!15501)

(declare-fun getCurrentListMapNoExtraKeys!1235 (array!25447 array!25445 (_ BitVec 32) (_ BitVec 32) V!15501 V!15501 (_ BitVec 32) Int) ListLongMap!6029)

(assert (=> bm!29110 (= call!29114 (getCurrentListMapNoExtraKeys!1235 (ite c!55181 _keys!709 lt!191726) (ite c!55181 _values!549 lt!191719) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun e!249465 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun call!29113 () ListLongMap!6029)

(declare-fun b!418315 () Bool)

(declare-fun v!412 () V!15501)

(declare-fun +!1230 (ListLongMap!6029 tuple2!7116) ListLongMap!6029)

(assert (=> b!418315 (= e!249465 (= call!29113 (+!1230 call!29114 (tuple2!7117 k0!794 v!412))))))

(declare-fun b!418316 () Bool)

(declare-fun e!249460 () Bool)

(declare-fun e!249462 () Bool)

(assert (=> b!418316 (= e!249460 e!249462)))

(declare-fun res!243728 () Bool)

(assert (=> b!418316 (=> (not res!243728) (not e!249462))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418316 (= res!243728 (= from!863 i!563))))

(declare-fun lt!191720 () ListLongMap!6029)

(assert (=> b!418316 (= lt!191720 (getCurrentListMapNoExtraKeys!1235 lt!191726 lt!191719 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!418316 (= lt!191719 (array!25446 (store (arr!12172 _values!549) i!563 (ValueCellFull!5055 v!412)) (size!12524 _values!549)))))

(declare-fun lt!191724 () ListLongMap!6029)

(assert (=> b!418316 (= lt!191724 (getCurrentListMapNoExtraKeys!1235 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418317 () Bool)

(declare-fun res!243735 () Bool)

(declare-fun e!249461 () Bool)

(assert (=> b!418317 (=> (not res!243735) (not e!249461))))

(declare-datatypes ((List!7130 0))(
  ( (Nil!7127) (Cons!7126 (h!7982 (_ BitVec 64)) (t!12440 List!7130)) )
))
(declare-fun arrayNoDuplicates!0 (array!25447 (_ BitVec 32) List!7130) Bool)

(assert (=> b!418317 (= res!243735 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7127))))

(declare-fun b!418318 () Bool)

(declare-fun res!243738 () Bool)

(assert (=> b!418318 (=> (not res!243738) (not e!249460))))

(assert (=> b!418318 (= res!243738 (arrayNoDuplicates!0 lt!191726 #b00000000000000000000000000000000 Nil!7127))))

(declare-fun b!418319 () Bool)

(declare-fun res!243733 () Bool)

(assert (=> b!418319 (=> (not res!243733) (not e!249460))))

(assert (=> b!418319 (= res!243733 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17817 () Bool)

(declare-fun mapRes!17817 () Bool)

(declare-fun tp!34463 () Bool)

(declare-fun e!249459 () Bool)

(assert (=> mapNonEmpty!17817 (= mapRes!17817 (and tp!34463 e!249459))))

(declare-fun mapRest!17817 () (Array (_ BitVec 32) ValueCell!5055))

(declare-fun mapKey!17817 () (_ BitVec 32))

(declare-fun mapValue!17817 () ValueCell!5055)

(assert (=> mapNonEmpty!17817 (= (arr!12172 _values!549) (store mapRest!17817 mapKey!17817 mapValue!17817))))

(declare-fun b!418320 () Bool)

(declare-fun res!243731 () Bool)

(assert (=> b!418320 (=> (not res!243731) (not e!249461))))

(assert (=> b!418320 (= res!243731 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12525 _keys!709))))))

(declare-fun b!418321 () Bool)

(assert (=> b!418321 (= e!249465 (= call!29114 call!29113))))

(declare-fun b!418322 () Bool)

(declare-fun res!243730 () Bool)

(assert (=> b!418322 (=> (not res!243730) (not e!249461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418322 (= res!243730 (validKeyInArray!0 k0!794))))

(declare-fun bm!29111 () Bool)

(assert (=> bm!29111 (= call!29113 (getCurrentListMapNoExtraKeys!1235 (ite c!55181 lt!191726 _keys!709) (ite c!55181 lt!191719 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418323 () Bool)

(declare-fun e!249458 () Bool)

(declare-fun tp_is_empty!10797 () Bool)

(assert (=> b!418323 (= e!249458 tp_is_empty!10797)))

(declare-fun b!418324 () Bool)

(declare-fun e!249457 () Bool)

(assert (=> b!418324 (= e!249457 (and e!249458 mapRes!17817))))

(declare-fun condMapEmpty!17817 () Bool)

(declare-fun mapDefault!17817 () ValueCell!5055)

(assert (=> b!418324 (= condMapEmpty!17817 (= (arr!12172 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5055)) mapDefault!17817)))))

(declare-fun res!243732 () Bool)

(assert (=> start!39378 (=> (not res!243732) (not e!249461))))

(assert (=> start!39378 (= res!243732 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12525 _keys!709))))))

(assert (=> start!39378 e!249461))

(assert (=> start!39378 tp_is_empty!10797))

(assert (=> start!39378 tp!34464))

(assert (=> start!39378 true))

(declare-fun array_inv!8872 (array!25445) Bool)

(assert (=> start!39378 (and (array_inv!8872 _values!549) e!249457)))

(declare-fun array_inv!8873 (array!25447) Bool)

(assert (=> start!39378 (array_inv!8873 _keys!709)))

(declare-fun b!418325 () Bool)

(declare-fun res!243740 () Bool)

(assert (=> b!418325 (=> (not res!243740) (not e!249461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418325 (= res!243740 (validMask!0 mask!1025))))

(declare-fun b!418326 () Bool)

(assert (=> b!418326 (= e!249461 e!249460)))

(declare-fun res!243734 () Bool)

(assert (=> b!418326 (=> (not res!243734) (not e!249460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25447 (_ BitVec 32)) Bool)

(assert (=> b!418326 (= res!243734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191726 mask!1025))))

(assert (=> b!418326 (= lt!191726 (array!25448 (store (arr!12173 _keys!709) i!563 k0!794) (size!12525 _keys!709)))))

(declare-fun b!418327 () Bool)

(declare-fun e!249463 () Bool)

(assert (=> b!418327 (= e!249462 (not e!249463))))

(declare-fun res!243737 () Bool)

(assert (=> b!418327 (=> res!243737 e!249463)))

(assert (=> b!418327 (= res!243737 (validKeyInArray!0 (select (arr!12173 _keys!709) from!863)))))

(assert (=> b!418327 e!249465))

(assert (=> b!418327 (= c!55181 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12364 0))(
  ( (Unit!12365) )
))
(declare-fun lt!191718 () Unit!12364)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!434 (array!25447 array!25445 (_ BitVec 32) (_ BitVec 32) V!15501 V!15501 (_ BitVec 32) (_ BitVec 64) V!15501 (_ BitVec 32) Int) Unit!12364)

(assert (=> b!418327 (= lt!191718 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!434 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418328 () Bool)

(declare-fun res!243741 () Bool)

(assert (=> b!418328 (=> (not res!243741) (not e!249461))))

(declare-fun arrayContainsKey!0 (array!25447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418328 (= res!243741 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!418329 () Bool)

(assert (=> b!418329 (= e!249459 tp_is_empty!10797)))

(declare-fun mapIsEmpty!17817 () Bool)

(assert (=> mapIsEmpty!17817 mapRes!17817))

(declare-fun b!418330 () Bool)

(assert (=> b!418330 (= e!249463 true)))

(declare-fun lt!191723 () tuple2!7116)

(declare-fun lt!191722 () ListLongMap!6029)

(declare-fun lt!191725 () V!15501)

(assert (=> b!418330 (= (+!1230 lt!191722 lt!191723) (+!1230 (+!1230 lt!191722 (tuple2!7117 k0!794 lt!191725)) lt!191723))))

(declare-fun lt!191717 () V!15501)

(assert (=> b!418330 (= lt!191723 (tuple2!7117 k0!794 lt!191717))))

(declare-fun lt!191716 () Unit!12364)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!30 (ListLongMap!6029 (_ BitVec 64) V!15501 V!15501) Unit!12364)

(assert (=> b!418330 (= lt!191716 (addSameAsAddTwiceSameKeyDiffValues!30 lt!191722 k0!794 lt!191725 lt!191717))))

(declare-fun lt!191721 () V!15501)

(declare-fun get!6030 (ValueCell!5055 V!15501) V!15501)

(assert (=> b!418330 (= lt!191725 (get!6030 (select (arr!12172 _values!549) from!863) lt!191721))))

(assert (=> b!418330 (= lt!191720 (+!1230 lt!191722 (tuple2!7117 (select (arr!12173 lt!191726) from!863) lt!191717)))))

(assert (=> b!418330 (= lt!191717 (get!6030 (select (store (arr!12172 _values!549) i!563 (ValueCellFull!5055 v!412)) from!863) lt!191721))))

(declare-fun dynLambda!701 (Int (_ BitVec 64)) V!15501)

(assert (=> b!418330 (= lt!191721 (dynLambda!701 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418330 (= lt!191722 (getCurrentListMapNoExtraKeys!1235 lt!191726 lt!191719 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418331 () Bool)

(declare-fun res!243739 () Bool)

(assert (=> b!418331 (=> (not res!243739) (not e!249461))))

(assert (=> b!418331 (= res!243739 (and (= (size!12524 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12525 _keys!709) (size!12524 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418332 () Bool)

(declare-fun res!243729 () Bool)

(assert (=> b!418332 (=> (not res!243729) (not e!249461))))

(assert (=> b!418332 (= res!243729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418333 () Bool)

(declare-fun res!243736 () Bool)

(assert (=> b!418333 (=> (not res!243736) (not e!249461))))

(assert (=> b!418333 (= res!243736 (or (= (select (arr!12173 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12173 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39378 res!243732) b!418325))

(assert (= (and b!418325 res!243740) b!418331))

(assert (= (and b!418331 res!243739) b!418332))

(assert (= (and b!418332 res!243729) b!418317))

(assert (= (and b!418317 res!243735) b!418320))

(assert (= (and b!418320 res!243731) b!418322))

(assert (= (and b!418322 res!243730) b!418333))

(assert (= (and b!418333 res!243736) b!418328))

(assert (= (and b!418328 res!243741) b!418326))

(assert (= (and b!418326 res!243734) b!418318))

(assert (= (and b!418318 res!243738) b!418319))

(assert (= (and b!418319 res!243733) b!418316))

(assert (= (and b!418316 res!243728) b!418327))

(assert (= (and b!418327 c!55181) b!418315))

(assert (= (and b!418327 (not c!55181)) b!418321))

(assert (= (or b!418315 b!418321) bm!29111))

(assert (= (or b!418315 b!418321) bm!29110))

(assert (= (and b!418327 (not res!243737)) b!418330))

(assert (= (and b!418324 condMapEmpty!17817) mapIsEmpty!17817))

(assert (= (and b!418324 (not condMapEmpty!17817)) mapNonEmpty!17817))

(get-info :version)

(assert (= (and mapNonEmpty!17817 ((_ is ValueCellFull!5055) mapValue!17817)) b!418329))

(assert (= (and b!418324 ((_ is ValueCellFull!5055) mapDefault!17817)) b!418323))

(assert (= start!39378 b!418324))

(declare-fun b_lambda!8949 () Bool)

(assert (=> (not b_lambda!8949) (not b!418330)))

(declare-fun t!12438 () Bool)

(declare-fun tb!3267 () Bool)

(assert (=> (and start!39378 (= defaultEntry!557 defaultEntry!557) t!12438) tb!3267))

(declare-fun result!6061 () Bool)

(assert (=> tb!3267 (= result!6061 tp_is_empty!10797)))

(assert (=> b!418330 t!12438))

(declare-fun b_and!17167 () Bool)

(assert (= b_and!17165 (and (=> t!12438 result!6061) b_and!17167)))

(declare-fun m!407687 () Bool)

(assert (=> b!418332 m!407687))

(declare-fun m!407689 () Bool)

(assert (=> b!418326 m!407689))

(declare-fun m!407691 () Bool)

(assert (=> b!418326 m!407691))

(declare-fun m!407693 () Bool)

(assert (=> b!418322 m!407693))

(declare-fun m!407695 () Bool)

(assert (=> b!418315 m!407695))

(declare-fun m!407697 () Bool)

(assert (=> b!418316 m!407697))

(declare-fun m!407699 () Bool)

(assert (=> b!418316 m!407699))

(declare-fun m!407701 () Bool)

(assert (=> b!418316 m!407701))

(declare-fun m!407703 () Bool)

(assert (=> b!418327 m!407703))

(assert (=> b!418327 m!407703))

(declare-fun m!407705 () Bool)

(assert (=> b!418327 m!407705))

(declare-fun m!407707 () Bool)

(assert (=> b!418327 m!407707))

(declare-fun m!407709 () Bool)

(assert (=> mapNonEmpty!17817 m!407709))

(declare-fun m!407711 () Bool)

(assert (=> b!418317 m!407711))

(declare-fun m!407713 () Bool)

(assert (=> b!418333 m!407713))

(declare-fun m!407715 () Bool)

(assert (=> b!418330 m!407715))

(declare-fun m!407717 () Bool)

(assert (=> b!418330 m!407717))

(declare-fun m!407719 () Bool)

(assert (=> b!418330 m!407719))

(assert (=> b!418330 m!407699))

(declare-fun m!407721 () Bool)

(assert (=> b!418330 m!407721))

(declare-fun m!407723 () Bool)

(assert (=> b!418330 m!407723))

(assert (=> b!418330 m!407719))

(declare-fun m!407725 () Bool)

(assert (=> b!418330 m!407725))

(declare-fun m!407727 () Bool)

(assert (=> b!418330 m!407727))

(assert (=> b!418330 m!407721))

(declare-fun m!407729 () Bool)

(assert (=> b!418330 m!407729))

(declare-fun m!407731 () Bool)

(assert (=> b!418330 m!407731))

(declare-fun m!407733 () Bool)

(assert (=> b!418330 m!407733))

(declare-fun m!407735 () Bool)

(assert (=> b!418330 m!407735))

(assert (=> b!418330 m!407735))

(declare-fun m!407737 () Bool)

(assert (=> b!418330 m!407737))

(declare-fun m!407739 () Bool)

(assert (=> bm!29110 m!407739))

(declare-fun m!407741 () Bool)

(assert (=> bm!29111 m!407741))

(declare-fun m!407743 () Bool)

(assert (=> b!418328 m!407743))

(declare-fun m!407745 () Bool)

(assert (=> b!418318 m!407745))

(declare-fun m!407747 () Bool)

(assert (=> start!39378 m!407747))

(declare-fun m!407749 () Bool)

(assert (=> start!39378 m!407749))

(declare-fun m!407751 () Bool)

(assert (=> b!418325 m!407751))

(check-sat (not b!418316) (not b!418318) (not b_lambda!8949) (not b!418332) (not b_next!9645) (not b!418327) (not b!418315) (not bm!29110) (not b!418325) (not b!418330) (not b!418326) (not bm!29111) b_and!17167 tp_is_empty!10797 (not b!418317) (not b!418322) (not b!418328) (not mapNonEmpty!17817) (not start!39378))
(check-sat b_and!17167 (not b_next!9645))
