; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39348 () Bool)

(assert start!39348)

(declare-fun b_free!9615 () Bool)

(declare-fun b_next!9615 () Bool)

(assert (=> start!39348 (= b_free!9615 (not b_next!9615))))

(declare-fun tp!34374 () Bool)

(declare-fun b_and!17105 () Bool)

(assert (=> start!39348 (= tp!34374 b_and!17105)))

(declare-fun mapIsEmpty!17772 () Bool)

(declare-fun mapRes!17772 () Bool)

(assert (=> mapIsEmpty!17772 mapRes!17772))

(declare-fun b!417430 () Bool)

(declare-fun e!249053 () Bool)

(assert (=> b!417430 (= e!249053 true)))

(declare-datatypes ((V!15461 0))(
  ( (V!15462 (val!5428 Int)) )
))
(declare-fun lt!191221 () V!15461)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((tuple2!7086 0))(
  ( (tuple2!7087 (_1!3554 (_ BitVec 64)) (_2!3554 V!15461)) )
))
(declare-fun lt!191224 () tuple2!7086)

(declare-datatypes ((List!7104 0))(
  ( (Nil!7101) (Cons!7100 (h!7956 tuple2!7086) (t!12384 List!7104)) )
))
(declare-datatypes ((ListLongMap!5999 0))(
  ( (ListLongMap!6000 (toList!3015 List!7104)) )
))
(declare-fun lt!191227 () ListLongMap!5999)

(declare-fun +!1217 (ListLongMap!5999 tuple2!7086) ListLongMap!5999)

(assert (=> b!417430 (= (+!1217 lt!191227 lt!191224) (+!1217 (+!1217 lt!191227 (tuple2!7087 k0!794 lt!191221)) lt!191224))))

(declare-fun lt!191225 () V!15461)

(assert (=> b!417430 (= lt!191224 (tuple2!7087 k0!794 lt!191225))))

(declare-datatypes ((Unit!12336 0))(
  ( (Unit!12337) )
))
(declare-fun lt!191230 () Unit!12336)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!18 (ListLongMap!5999 (_ BitVec 64) V!15461 V!15461) Unit!12336)

(assert (=> b!417430 (= lt!191230 (addSameAsAddTwiceSameKeyDiffValues!18 lt!191227 k0!794 lt!191221 lt!191225))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5040 0))(
  ( (ValueCellFull!5040 (v!7675 V!15461)) (EmptyCell!5040) )
))
(declare-datatypes ((array!25385 0))(
  ( (array!25386 (arr!12142 (Array (_ BitVec 32) ValueCell!5040)) (size!12494 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25385)

(declare-fun lt!191226 () V!15461)

(declare-fun get!6008 (ValueCell!5040 V!15461) V!15461)

(assert (=> b!417430 (= lt!191221 (get!6008 (select (arr!12142 _values!549) from!863) lt!191226))))

(declare-datatypes ((array!25387 0))(
  ( (array!25388 (arr!12143 (Array (_ BitVec 32) (_ BitVec 64))) (size!12495 (_ BitVec 32))) )
))
(declare-fun lt!191223 () array!25387)

(declare-fun lt!191222 () ListLongMap!5999)

(assert (=> b!417430 (= lt!191222 (+!1217 lt!191227 (tuple2!7087 (select (arr!12143 lt!191223) from!863) lt!191225)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15461)

(assert (=> b!417430 (= lt!191225 (get!6008 (select (store (arr!12142 _values!549) i!563 (ValueCellFull!5040 v!412)) from!863) lt!191226))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!689 (Int (_ BitVec 64)) V!15461)

(assert (=> b!417430 (= lt!191226 (dynLambda!689 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15461)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15461)

(declare-fun lt!191229 () array!25385)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1220 (array!25387 array!25385 (_ BitVec 32) (_ BitVec 32) V!15461 V!15461 (_ BitVec 32) Int) ListLongMap!5999)

(assert (=> b!417430 (= lt!191227 (getCurrentListMapNoExtraKeys!1220 lt!191223 lt!191229 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417431 () Bool)

(declare-fun res!243103 () Bool)

(declare-fun e!249060 () Bool)

(assert (=> b!417431 (=> (not res!243103) (not e!249060))))

(declare-fun _keys!709 () array!25387)

(assert (=> b!417431 (= res!243103 (and (= (size!12494 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12495 _keys!709) (size!12494 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun call!29024 () ListLongMap!5999)

(declare-fun c!55136 () Bool)

(declare-fun bm!29021 () Bool)

(assert (=> bm!29021 (= call!29024 (getCurrentListMapNoExtraKeys!1220 (ite c!55136 _keys!709 lt!191223) (ite c!55136 _values!549 lt!191229) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417432 () Bool)

(declare-fun e!249058 () Bool)

(assert (=> b!417432 (= e!249060 e!249058)))

(declare-fun res!243100 () Bool)

(assert (=> b!417432 (=> (not res!243100) (not e!249058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25387 (_ BitVec 32)) Bool)

(assert (=> b!417432 (= res!243100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191223 mask!1025))))

(assert (=> b!417432 (= lt!191223 (array!25388 (store (arr!12143 _keys!709) i!563 k0!794) (size!12495 _keys!709)))))

(declare-fun b!417433 () Bool)

(declare-fun e!249056 () Bool)

(declare-fun e!249054 () Bool)

(assert (=> b!417433 (= e!249056 (and e!249054 mapRes!17772))))

(declare-fun condMapEmpty!17772 () Bool)

(declare-fun mapDefault!17772 () ValueCell!5040)

(assert (=> b!417433 (= condMapEmpty!17772 (= (arr!12142 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5040)) mapDefault!17772)))))

(declare-fun b!417434 () Bool)

(declare-fun res!243109 () Bool)

(assert (=> b!417434 (=> (not res!243109) (not e!249058))))

(declare-datatypes ((List!7105 0))(
  ( (Nil!7102) (Cons!7101 (h!7957 (_ BitVec 64)) (t!12385 List!7105)) )
))
(declare-fun arrayNoDuplicates!0 (array!25387 (_ BitVec 32) List!7105) Bool)

(assert (=> b!417434 (= res!243109 (arrayNoDuplicates!0 lt!191223 #b00000000000000000000000000000000 Nil!7102))))

(declare-fun b!417435 () Bool)

(declare-fun res!243108 () Bool)

(assert (=> b!417435 (=> (not res!243108) (not e!249060))))

(assert (=> b!417435 (= res!243108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417436 () Bool)

(declare-fun res!243110 () Bool)

(assert (=> b!417436 (=> (not res!243110) (not e!249060))))

(assert (=> b!417436 (= res!243110 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7102))))

(declare-fun b!417437 () Bool)

(declare-fun e!249055 () Bool)

(declare-fun tp_is_empty!10767 () Bool)

(assert (=> b!417437 (= e!249055 tp_is_empty!10767)))

(declare-fun b!417438 () Bool)

(declare-fun res!243104 () Bool)

(assert (=> b!417438 (=> (not res!243104) (not e!249058))))

(assert (=> b!417438 (= res!243104 (bvsle from!863 i!563))))

(declare-fun b!417439 () Bool)

(declare-fun res!243106 () Bool)

(assert (=> b!417439 (=> (not res!243106) (not e!249060))))

(assert (=> b!417439 (= res!243106 (or (= (select (arr!12143 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12143 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417440 () Bool)

(declare-fun e!249052 () Bool)

(assert (=> b!417440 (= e!249052 (not e!249053))))

(declare-fun res!243107 () Bool)

(assert (=> b!417440 (=> res!243107 e!249053)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417440 (= res!243107 (validKeyInArray!0 (select (arr!12143 _keys!709) from!863)))))

(declare-fun e!249057 () Bool)

(assert (=> b!417440 e!249057))

(assert (=> b!417440 (= c!55136 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191231 () Unit!12336)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!424 (array!25387 array!25385 (_ BitVec 32) (_ BitVec 32) V!15461 V!15461 (_ BitVec 32) (_ BitVec 64) V!15461 (_ BitVec 32) Int) Unit!12336)

(assert (=> b!417440 (= lt!191231 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!424 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417441 () Bool)

(declare-fun res!243098 () Bool)

(assert (=> b!417441 (=> (not res!243098) (not e!249060))))

(assert (=> b!417441 (= res!243098 (validKeyInArray!0 k0!794))))

(declare-fun call!29023 () ListLongMap!5999)

(declare-fun bm!29020 () Bool)

(assert (=> bm!29020 (= call!29023 (getCurrentListMapNoExtraKeys!1220 (ite c!55136 lt!191223 _keys!709) (ite c!55136 lt!191229 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!243102 () Bool)

(assert (=> start!39348 (=> (not res!243102) (not e!249060))))

(assert (=> start!39348 (= res!243102 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12495 _keys!709))))))

(assert (=> start!39348 e!249060))

(assert (=> start!39348 tp_is_empty!10767))

(assert (=> start!39348 tp!34374))

(assert (=> start!39348 true))

(declare-fun array_inv!8856 (array!25385) Bool)

(assert (=> start!39348 (and (array_inv!8856 _values!549) e!249056)))

(declare-fun array_inv!8857 (array!25387) Bool)

(assert (=> start!39348 (array_inv!8857 _keys!709)))

(declare-fun b!417442 () Bool)

(assert (=> b!417442 (= e!249058 e!249052)))

(declare-fun res!243105 () Bool)

(assert (=> b!417442 (=> (not res!243105) (not e!249052))))

(assert (=> b!417442 (= res!243105 (= from!863 i!563))))

(assert (=> b!417442 (= lt!191222 (getCurrentListMapNoExtraKeys!1220 lt!191223 lt!191229 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417442 (= lt!191229 (array!25386 (store (arr!12142 _values!549) i!563 (ValueCellFull!5040 v!412)) (size!12494 _values!549)))))

(declare-fun lt!191228 () ListLongMap!5999)

(assert (=> b!417442 (= lt!191228 (getCurrentListMapNoExtraKeys!1220 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!17772 () Bool)

(declare-fun tp!34373 () Bool)

(assert (=> mapNonEmpty!17772 (= mapRes!17772 (and tp!34373 e!249055))))

(declare-fun mapKey!17772 () (_ BitVec 32))

(declare-fun mapValue!17772 () ValueCell!5040)

(declare-fun mapRest!17772 () (Array (_ BitVec 32) ValueCell!5040))

(assert (=> mapNonEmpty!17772 (= (arr!12142 _values!549) (store mapRest!17772 mapKey!17772 mapValue!17772))))

(declare-fun b!417443 () Bool)

(assert (=> b!417443 (= e!249054 tp_is_empty!10767)))

(declare-fun b!417444 () Bool)

(assert (=> b!417444 (= e!249057 (= call!29023 (+!1217 call!29024 (tuple2!7087 k0!794 v!412))))))

(declare-fun b!417445 () Bool)

(declare-fun res!243099 () Bool)

(assert (=> b!417445 (=> (not res!243099) (not e!249060))))

(assert (=> b!417445 (= res!243099 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12495 _keys!709))))))

(declare-fun b!417446 () Bool)

(assert (=> b!417446 (= e!249057 (= call!29024 call!29023))))

(declare-fun b!417447 () Bool)

(declare-fun res!243111 () Bool)

(assert (=> b!417447 (=> (not res!243111) (not e!249060))))

(declare-fun arrayContainsKey!0 (array!25387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417447 (= res!243111 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417448 () Bool)

(declare-fun res!243101 () Bool)

(assert (=> b!417448 (=> (not res!243101) (not e!249060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417448 (= res!243101 (validMask!0 mask!1025))))

(assert (= (and start!39348 res!243102) b!417448))

(assert (= (and b!417448 res!243101) b!417431))

(assert (= (and b!417431 res!243103) b!417435))

(assert (= (and b!417435 res!243108) b!417436))

(assert (= (and b!417436 res!243110) b!417445))

(assert (= (and b!417445 res!243099) b!417441))

(assert (= (and b!417441 res!243098) b!417439))

(assert (= (and b!417439 res!243106) b!417447))

(assert (= (and b!417447 res!243111) b!417432))

(assert (= (and b!417432 res!243100) b!417434))

(assert (= (and b!417434 res!243109) b!417438))

(assert (= (and b!417438 res!243104) b!417442))

(assert (= (and b!417442 res!243105) b!417440))

(assert (= (and b!417440 c!55136) b!417444))

(assert (= (and b!417440 (not c!55136)) b!417446))

(assert (= (or b!417444 b!417446) bm!29020))

(assert (= (or b!417444 b!417446) bm!29021))

(assert (= (and b!417440 (not res!243107)) b!417430))

(assert (= (and b!417433 condMapEmpty!17772) mapIsEmpty!17772))

(assert (= (and b!417433 (not condMapEmpty!17772)) mapNonEmpty!17772))

(get-info :version)

(assert (= (and mapNonEmpty!17772 ((_ is ValueCellFull!5040) mapValue!17772)) b!417437))

(assert (= (and b!417433 ((_ is ValueCellFull!5040) mapDefault!17772)) b!417443))

(assert (= start!39348 b!417433))

(declare-fun b_lambda!8919 () Bool)

(assert (=> (not b_lambda!8919) (not b!417430)))

(declare-fun t!12383 () Bool)

(declare-fun tb!3237 () Bool)

(assert (=> (and start!39348 (= defaultEntry!557 defaultEntry!557) t!12383) tb!3237))

(declare-fun result!6001 () Bool)

(assert (=> tb!3237 (= result!6001 tp_is_empty!10767)))

(assert (=> b!417430 t!12383))

(declare-fun b_and!17107 () Bool)

(assert (= b_and!17105 (and (=> t!12383 result!6001) b_and!17107)))

(declare-fun m!406697 () Bool)

(assert (=> bm!29020 m!406697))

(declare-fun m!406699 () Bool)

(assert (=> b!417440 m!406699))

(assert (=> b!417440 m!406699))

(declare-fun m!406701 () Bool)

(assert (=> b!417440 m!406701))

(declare-fun m!406703 () Bool)

(assert (=> b!417440 m!406703))

(declare-fun m!406705 () Bool)

(assert (=> b!417447 m!406705))

(declare-fun m!406707 () Bool)

(assert (=> b!417430 m!406707))

(declare-fun m!406709 () Bool)

(assert (=> b!417430 m!406709))

(declare-fun m!406711 () Bool)

(assert (=> b!417430 m!406711))

(declare-fun m!406713 () Bool)

(assert (=> b!417430 m!406713))

(declare-fun m!406715 () Bool)

(assert (=> b!417430 m!406715))

(declare-fun m!406717 () Bool)

(assert (=> b!417430 m!406717))

(declare-fun m!406719 () Bool)

(assert (=> b!417430 m!406719))

(assert (=> b!417430 m!406719))

(declare-fun m!406721 () Bool)

(assert (=> b!417430 m!406721))

(declare-fun m!406723 () Bool)

(assert (=> b!417430 m!406723))

(declare-fun m!406725 () Bool)

(assert (=> b!417430 m!406725))

(declare-fun m!406727 () Bool)

(assert (=> b!417430 m!406727))

(declare-fun m!406729 () Bool)

(assert (=> b!417430 m!406729))

(assert (=> b!417430 m!406723))

(declare-fun m!406731 () Bool)

(assert (=> b!417430 m!406731))

(assert (=> b!417430 m!406727))

(declare-fun m!406733 () Bool)

(assert (=> b!417434 m!406733))

(declare-fun m!406735 () Bool)

(assert (=> b!417442 m!406735))

(assert (=> b!417442 m!406717))

(declare-fun m!406737 () Bool)

(assert (=> b!417442 m!406737))

(declare-fun m!406739 () Bool)

(assert (=> mapNonEmpty!17772 m!406739))

(declare-fun m!406741 () Bool)

(assert (=> b!417432 m!406741))

(declare-fun m!406743 () Bool)

(assert (=> b!417432 m!406743))

(declare-fun m!406745 () Bool)

(assert (=> b!417444 m!406745))

(declare-fun m!406747 () Bool)

(assert (=> b!417441 m!406747))

(declare-fun m!406749 () Bool)

(assert (=> b!417436 m!406749))

(declare-fun m!406751 () Bool)

(assert (=> b!417439 m!406751))

(declare-fun m!406753 () Bool)

(assert (=> bm!29021 m!406753))

(declare-fun m!406755 () Bool)

(assert (=> b!417435 m!406755))

(declare-fun m!406757 () Bool)

(assert (=> b!417448 m!406757))

(declare-fun m!406759 () Bool)

(assert (=> start!39348 m!406759))

(declare-fun m!406761 () Bool)

(assert (=> start!39348 m!406761))

(check-sat (not b!417448) tp_is_empty!10767 (not b!417436) (not b!417435) (not b!417442) (not b!417441) (not bm!29021) (not mapNonEmpty!17772) (not b!417430) (not start!39348) (not b!417434) (not b!417444) b_and!17107 (not b!417440) (not b_next!9615) (not bm!29020) (not b!417432) (not b_lambda!8919) (not b!417447))
(check-sat b_and!17107 (not b_next!9615))
