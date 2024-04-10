; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39426 () Bool)

(assert start!39426)

(declare-fun b_free!9693 () Bool)

(declare-fun b_next!9693 () Bool)

(assert (=> start!39426 (= b_free!9693 (not b_next!9693))))

(declare-fun tp!34608 () Bool)

(declare-fun b_and!17261 () Bool)

(assert (=> start!39426 (= tp!34608 b_and!17261)))

(declare-datatypes ((V!15565 0))(
  ( (V!15566 (val!5467 Int)) )
))
(declare-datatypes ((tuple2!7158 0))(
  ( (tuple2!7159 (_1!3590 (_ BitVec 64)) (_2!3590 V!15565)) )
))
(declare-datatypes ((List!7166 0))(
  ( (Nil!7163) (Cons!7162 (h!8018 tuple2!7158) (t!12524 List!7166)) )
))
(declare-datatypes ((ListLongMap!6071 0))(
  ( (ListLongMap!6072 (toList!3051 List!7166)) )
))
(declare-fun call!29257 () ListLongMap!6071)

(declare-fun e!250112 () Bool)

(declare-fun call!29258 () ListLongMap!6071)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!419731 () Bool)

(declare-fun v!412 () V!15565)

(declare-fun +!1248 (ListLongMap!6071 tuple2!7158) ListLongMap!6071)

(assert (=> b!419731 (= e!250112 (= call!29257 (+!1248 call!29258 (tuple2!7159 k0!794 v!412))))))

(declare-fun b!419732 () Bool)

(declare-fun e!250106 () Bool)

(declare-fun tp_is_empty!10845 () Bool)

(assert (=> b!419732 (= e!250106 tp_is_empty!10845)))

(declare-fun b!419733 () Bool)

(declare-fun res!244744 () Bool)

(declare-fun e!250105 () Bool)

(assert (=> b!419733 (=> (not res!244744) (not e!250105))))

(declare-datatypes ((array!25539 0))(
  ( (array!25540 (arr!12219 (Array (_ BitVec 32) (_ BitVec 64))) (size!12571 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25539)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25539 (_ BitVec 32)) Bool)

(assert (=> b!419733 (= res!244744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419734 () Bool)

(declare-fun res!244745 () Bool)

(assert (=> b!419734 (=> (not res!244745) (not e!250105))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5079 0))(
  ( (ValueCellFull!5079 (v!7714 V!15565)) (EmptyCell!5079) )
))
(declare-datatypes ((array!25541 0))(
  ( (array!25542 (arr!12220 (Array (_ BitVec 32) ValueCell!5079)) (size!12572 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25541)

(assert (=> b!419734 (= res!244745 (and (= (size!12572 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12571 _keys!709) (size!12572 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419735 () Bool)

(declare-fun e!250111 () Bool)

(assert (=> b!419735 (= e!250105 e!250111)))

(declare-fun res!244736 () Bool)

(assert (=> b!419735 (=> (not res!244736) (not e!250111))))

(declare-fun lt!192511 () array!25539)

(assert (=> b!419735 (= res!244736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192511 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419735 (= lt!192511 (array!25540 (store (arr!12219 _keys!709) i!563 k0!794) (size!12571 _keys!709)))))

(declare-fun minValue!515 () V!15565)

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!29254 () Bool)

(declare-fun zeroValue!515 () V!15565)

(declare-fun lt!192515 () array!25541)

(declare-fun c!55253 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1256 (array!25539 array!25541 (_ BitVec 32) (_ BitVec 32) V!15565 V!15565 (_ BitVec 32) Int) ListLongMap!6071)

(assert (=> bm!29254 (= call!29258 (getCurrentListMapNoExtraKeys!1256 (ite c!55253 _keys!709 lt!192511) (ite c!55253 _values!549 lt!192515) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17889 () Bool)

(declare-fun mapRes!17889 () Bool)

(declare-fun tp!34607 () Bool)

(assert (=> mapNonEmpty!17889 (= mapRes!17889 (and tp!34607 e!250106))))

(declare-fun mapKey!17889 () (_ BitVec 32))

(declare-fun mapValue!17889 () ValueCell!5079)

(declare-fun mapRest!17889 () (Array (_ BitVec 32) ValueCell!5079))

(assert (=> mapNonEmpty!17889 (= (arr!12220 _values!549) (store mapRest!17889 mapKey!17889 mapValue!17889))))

(declare-fun b!419736 () Bool)

(declare-fun res!244741 () Bool)

(assert (=> b!419736 (=> (not res!244741) (not e!250105))))

(declare-fun arrayContainsKey!0 (array!25539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419736 (= res!244741 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun bm!29255 () Bool)

(assert (=> bm!29255 (= call!29257 (getCurrentListMapNoExtraKeys!1256 (ite c!55253 lt!192511 _keys!709) (ite c!55253 lt!192515 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419737 () Bool)

(declare-fun e!250107 () Bool)

(assert (=> b!419737 (= e!250111 e!250107)))

(declare-fun res!244740 () Bool)

(assert (=> b!419737 (=> (not res!244740) (not e!250107))))

(assert (=> b!419737 (= res!244740 (= from!863 i!563))))

(declare-fun lt!192508 () ListLongMap!6071)

(assert (=> b!419737 (= lt!192508 (getCurrentListMapNoExtraKeys!1256 lt!192511 lt!192515 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419737 (= lt!192515 (array!25542 (store (arr!12220 _values!549) i!563 (ValueCellFull!5079 v!412)) (size!12572 _values!549)))))

(declare-fun lt!192516 () ListLongMap!6071)

(assert (=> b!419737 (= lt!192516 (getCurrentListMapNoExtraKeys!1256 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419738 () Bool)

(declare-fun res!244749 () Bool)

(assert (=> b!419738 (=> (not res!244749) (not e!250105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419738 (= res!244749 (validMask!0 mask!1025))))

(declare-fun b!419739 () Bool)

(declare-fun e!250113 () Bool)

(assert (=> b!419739 (= e!250107 (not e!250113))))

(declare-fun res!244742 () Bool)

(assert (=> b!419739 (=> res!244742 e!250113)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419739 (= res!244742 (validKeyInArray!0 (select (arr!12219 _keys!709) from!863)))))

(assert (=> b!419739 e!250112))

(assert (=> b!419739 (= c!55253 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12402 0))(
  ( (Unit!12403) )
))
(declare-fun lt!192512 () Unit!12402)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!451 (array!25539 array!25541 (_ BitVec 32) (_ BitVec 32) V!15565 V!15565 (_ BitVec 32) (_ BitVec 64) V!15565 (_ BitVec 32) Int) Unit!12402)

(assert (=> b!419739 (= lt!192512 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!451 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419740 () Bool)

(declare-fun res!244739 () Bool)

(assert (=> b!419740 (=> (not res!244739) (not e!250111))))

(assert (=> b!419740 (= res!244739 (bvsle from!863 i!563))))

(declare-fun b!419741 () Bool)

(declare-fun res!244747 () Bool)

(assert (=> b!419741 (=> (not res!244747) (not e!250105))))

(assert (=> b!419741 (= res!244747 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12571 _keys!709))))))

(declare-fun b!419742 () Bool)

(assert (=> b!419742 (= e!250113 true)))

(declare-fun lt!192509 () ListLongMap!6071)

(declare-fun lt!192518 () tuple2!7158)

(declare-fun lt!192513 () V!15565)

(assert (=> b!419742 (= (+!1248 lt!192509 lt!192518) (+!1248 (+!1248 lt!192509 (tuple2!7159 k0!794 lt!192513)) lt!192518))))

(declare-fun lt!192514 () V!15565)

(assert (=> b!419742 (= lt!192518 (tuple2!7159 k0!794 lt!192514))))

(declare-fun lt!192510 () Unit!12402)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!46 (ListLongMap!6071 (_ BitVec 64) V!15565 V!15565) Unit!12402)

(assert (=> b!419742 (= lt!192510 (addSameAsAddTwiceSameKeyDiffValues!46 lt!192509 k0!794 lt!192513 lt!192514))))

(declare-fun lt!192517 () V!15565)

(declare-fun get!6062 (ValueCell!5079 V!15565) V!15565)

(assert (=> b!419742 (= lt!192513 (get!6062 (select (arr!12220 _values!549) from!863) lt!192517))))

(assert (=> b!419742 (= lt!192508 (+!1248 lt!192509 (tuple2!7159 (select (arr!12219 lt!192511) from!863) lt!192514)))))

(assert (=> b!419742 (= lt!192514 (get!6062 (select (store (arr!12220 _values!549) i!563 (ValueCellFull!5079 v!412)) from!863) lt!192517))))

(declare-fun dynLambda!717 (Int (_ BitVec 64)) V!15565)

(assert (=> b!419742 (= lt!192517 (dynLambda!717 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!419742 (= lt!192509 (getCurrentListMapNoExtraKeys!1256 lt!192511 lt!192515 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419743 () Bool)

(declare-fun res!244748 () Bool)

(assert (=> b!419743 (=> (not res!244748) (not e!250105))))

(assert (=> b!419743 (= res!244748 (or (= (select (arr!12219 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12219 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419744 () Bool)

(declare-fun res!244737 () Bool)

(assert (=> b!419744 (=> (not res!244737) (not e!250105))))

(assert (=> b!419744 (= res!244737 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17889 () Bool)

(assert (=> mapIsEmpty!17889 mapRes!17889))

(declare-fun b!419745 () Bool)

(declare-fun res!244738 () Bool)

(assert (=> b!419745 (=> (not res!244738) (not e!250111))))

(declare-datatypes ((List!7167 0))(
  ( (Nil!7164) (Cons!7163 (h!8019 (_ BitVec 64)) (t!12525 List!7167)) )
))
(declare-fun arrayNoDuplicates!0 (array!25539 (_ BitVec 32) List!7167) Bool)

(assert (=> b!419745 (= res!244738 (arrayNoDuplicates!0 lt!192511 #b00000000000000000000000000000000 Nil!7164))))

(declare-fun b!419746 () Bool)

(declare-fun e!250110 () Bool)

(assert (=> b!419746 (= e!250110 tp_is_empty!10845)))

(declare-fun b!419747 () Bool)

(assert (=> b!419747 (= e!250112 (= call!29258 call!29257))))

(declare-fun b!419748 () Bool)

(declare-fun e!250108 () Bool)

(assert (=> b!419748 (= e!250108 (and e!250110 mapRes!17889))))

(declare-fun condMapEmpty!17889 () Bool)

(declare-fun mapDefault!17889 () ValueCell!5079)

(assert (=> b!419748 (= condMapEmpty!17889 (= (arr!12220 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5079)) mapDefault!17889)))))

(declare-fun b!419749 () Bool)

(declare-fun res!244746 () Bool)

(assert (=> b!419749 (=> (not res!244746) (not e!250105))))

(assert (=> b!419749 (= res!244746 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7164))))

(declare-fun res!244743 () Bool)

(assert (=> start!39426 (=> (not res!244743) (not e!250105))))

(assert (=> start!39426 (= res!244743 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12571 _keys!709))))))

(assert (=> start!39426 e!250105))

(assert (=> start!39426 tp_is_empty!10845))

(assert (=> start!39426 tp!34608))

(assert (=> start!39426 true))

(declare-fun array_inv!8910 (array!25541) Bool)

(assert (=> start!39426 (and (array_inv!8910 _values!549) e!250108)))

(declare-fun array_inv!8911 (array!25539) Bool)

(assert (=> start!39426 (array_inv!8911 _keys!709)))

(assert (= (and start!39426 res!244743) b!419738))

(assert (= (and b!419738 res!244749) b!419734))

(assert (= (and b!419734 res!244745) b!419733))

(assert (= (and b!419733 res!244744) b!419749))

(assert (= (and b!419749 res!244746) b!419741))

(assert (= (and b!419741 res!244747) b!419744))

(assert (= (and b!419744 res!244737) b!419743))

(assert (= (and b!419743 res!244748) b!419736))

(assert (= (and b!419736 res!244741) b!419735))

(assert (= (and b!419735 res!244736) b!419745))

(assert (= (and b!419745 res!244738) b!419740))

(assert (= (and b!419740 res!244739) b!419737))

(assert (= (and b!419737 res!244740) b!419739))

(assert (= (and b!419739 c!55253) b!419731))

(assert (= (and b!419739 (not c!55253)) b!419747))

(assert (= (or b!419731 b!419747) bm!29255))

(assert (= (or b!419731 b!419747) bm!29254))

(assert (= (and b!419739 (not res!244742)) b!419742))

(assert (= (and b!419748 condMapEmpty!17889) mapIsEmpty!17889))

(assert (= (and b!419748 (not condMapEmpty!17889)) mapNonEmpty!17889))

(get-info :version)

(assert (= (and mapNonEmpty!17889 ((_ is ValueCellFull!5079) mapValue!17889)) b!419732))

(assert (= (and b!419748 ((_ is ValueCellFull!5079) mapDefault!17889)) b!419746))

(assert (= start!39426 b!419748))

(declare-fun b_lambda!8997 () Bool)

(assert (=> (not b_lambda!8997) (not b!419742)))

(declare-fun t!12523 () Bool)

(declare-fun tb!3315 () Bool)

(assert (=> (and start!39426 (= defaultEntry!557 defaultEntry!557) t!12523) tb!3315))

(declare-fun result!6157 () Bool)

(assert (=> tb!3315 (= result!6157 tp_is_empty!10845)))

(assert (=> b!419742 t!12523))

(declare-fun b_and!17263 () Bool)

(assert (= b_and!17261 (and (=> t!12523 result!6157) b_and!17263)))

(declare-fun m!409271 () Bool)

(assert (=> start!39426 m!409271))

(declare-fun m!409273 () Bool)

(assert (=> start!39426 m!409273))

(declare-fun m!409275 () Bool)

(assert (=> b!419735 m!409275))

(declare-fun m!409277 () Bool)

(assert (=> b!419735 m!409277))

(declare-fun m!409279 () Bool)

(assert (=> b!419739 m!409279))

(assert (=> b!419739 m!409279))

(declare-fun m!409281 () Bool)

(assert (=> b!419739 m!409281))

(declare-fun m!409283 () Bool)

(assert (=> b!419739 m!409283))

(declare-fun m!409285 () Bool)

(assert (=> b!419744 m!409285))

(declare-fun m!409287 () Bool)

(assert (=> b!419749 m!409287))

(declare-fun m!409289 () Bool)

(assert (=> b!419743 m!409289))

(declare-fun m!409291 () Bool)

(assert (=> b!419731 m!409291))

(declare-fun m!409293 () Bool)

(assert (=> bm!29255 m!409293))

(declare-fun m!409295 () Bool)

(assert (=> b!419733 m!409295))

(declare-fun m!409297 () Bool)

(assert (=> b!419738 m!409297))

(declare-fun m!409299 () Bool)

(assert (=> b!419745 m!409299))

(declare-fun m!409301 () Bool)

(assert (=> b!419736 m!409301))

(declare-fun m!409303 () Bool)

(assert (=> bm!29254 m!409303))

(declare-fun m!409305 () Bool)

(assert (=> b!419737 m!409305))

(declare-fun m!409307 () Bool)

(assert (=> b!419737 m!409307))

(declare-fun m!409309 () Bool)

(assert (=> b!419737 m!409309))

(declare-fun m!409311 () Bool)

(assert (=> mapNonEmpty!17889 m!409311))

(declare-fun m!409313 () Bool)

(assert (=> b!419742 m!409313))

(declare-fun m!409315 () Bool)

(assert (=> b!419742 m!409315))

(declare-fun m!409317 () Bool)

(assert (=> b!419742 m!409317))

(declare-fun m!409319 () Bool)

(assert (=> b!419742 m!409319))

(assert (=> b!419742 m!409307))

(assert (=> b!419742 m!409313))

(declare-fun m!409321 () Bool)

(assert (=> b!419742 m!409321))

(declare-fun m!409323 () Bool)

(assert (=> b!419742 m!409323))

(declare-fun m!409325 () Bool)

(assert (=> b!419742 m!409325))

(declare-fun m!409327 () Bool)

(assert (=> b!419742 m!409327))

(assert (=> b!419742 m!409317))

(declare-fun m!409329 () Bool)

(assert (=> b!419742 m!409329))

(declare-fun m!409331 () Bool)

(assert (=> b!419742 m!409331))

(declare-fun m!409333 () Bool)

(assert (=> b!419742 m!409333))

(declare-fun m!409335 () Bool)

(assert (=> b!419742 m!409335))

(assert (=> b!419742 m!409325))

(check-sat (not bm!29254) tp_is_empty!10845 (not b!419737) (not mapNonEmpty!17889) (not b!419739) (not b!419736) (not bm!29255) (not b!419735) b_and!17263 (not b!419733) (not start!39426) (not b!419742) (not b!419745) (not b_lambda!8997) (not b!419738) (not b!419731) (not b!419744) (not b_next!9693) (not b!419749))
(check-sat b_and!17263 (not b_next!9693))
