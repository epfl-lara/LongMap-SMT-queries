; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39408 () Bool)

(assert start!39408)

(declare-fun b_free!9675 () Bool)

(declare-fun b_next!9675 () Bool)

(assert (=> start!39408 (= b_free!9675 (not b_next!9675))))

(declare-fun tp!34553 () Bool)

(declare-fun b_and!17225 () Bool)

(assert (=> start!39408 (= tp!34553 b_and!17225)))

(declare-fun b!419200 () Bool)

(declare-fun e!249867 () Bool)

(assert (=> b!419200 (= e!249867 true)))

(declare-datatypes ((V!15541 0))(
  ( (V!15542 (val!5458 Int)) )
))
(declare-datatypes ((tuple2!7142 0))(
  ( (tuple2!7143 (_1!3582 (_ BitVec 64)) (_2!3582 V!15541)) )
))
(declare-datatypes ((List!7152 0))(
  ( (Nil!7149) (Cons!7148 (h!8004 tuple2!7142) (t!12492 List!7152)) )
))
(declare-datatypes ((ListLongMap!6055 0))(
  ( (ListLongMap!6056 (toList!3043 List!7152)) )
))
(declare-fun lt!192221 () ListLongMap!6055)

(declare-fun lt!192215 () V!15541)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!192218 () tuple2!7142)

(declare-fun +!1241 (ListLongMap!6055 tuple2!7142) ListLongMap!6055)

(assert (=> b!419200 (= (+!1241 lt!192221 lt!192218) (+!1241 (+!1241 lt!192221 (tuple2!7143 k0!794 lt!192215)) lt!192218))))

(declare-fun lt!192216 () V!15541)

(assert (=> b!419200 (= lt!192218 (tuple2!7143 k0!794 lt!192216))))

(declare-datatypes ((Unit!12388 0))(
  ( (Unit!12389) )
))
(declare-fun lt!192212 () Unit!12388)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!40 (ListLongMap!6055 (_ BitVec 64) V!15541 V!15541) Unit!12388)

(assert (=> b!419200 (= lt!192212 (addSameAsAddTwiceSameKeyDiffValues!40 lt!192221 k0!794 lt!192215 lt!192216))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!192211 () V!15541)

(declare-datatypes ((ValueCell!5070 0))(
  ( (ValueCellFull!5070 (v!7705 V!15541)) (EmptyCell!5070) )
))
(declare-datatypes ((array!25503 0))(
  ( (array!25504 (arr!12201 (Array (_ BitVec 32) ValueCell!5070)) (size!12553 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25503)

(declare-fun get!6050 (ValueCell!5070 V!15541) V!15541)

(assert (=> b!419200 (= lt!192215 (get!6050 (select (arr!12201 _values!549) from!863) lt!192211))))

(declare-fun lt!192214 () ListLongMap!6055)

(declare-datatypes ((array!25505 0))(
  ( (array!25506 (arr!12202 (Array (_ BitVec 32) (_ BitVec 64))) (size!12554 (_ BitVec 32))) )
))
(declare-fun lt!192219 () array!25505)

(assert (=> b!419200 (= lt!192214 (+!1241 lt!192221 (tuple2!7143 (select (arr!12202 lt!192219) from!863) lt!192216)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15541)

(assert (=> b!419200 (= lt!192216 (get!6050 (select (store (arr!12201 _values!549) i!563 (ValueCellFull!5070 v!412)) from!863) lt!192211))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!711 (Int (_ BitVec 64)) V!15541)

(assert (=> b!419200 (= lt!192211 (dynLambda!711 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15541)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15541)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!192217 () array!25503)

(declare-fun getCurrentListMapNoExtraKeys!1248 (array!25505 array!25503 (_ BitVec 32) (_ BitVec 32) V!15541 V!15541 (_ BitVec 32) Int) ListLongMap!6055)

(assert (=> b!419200 (= lt!192221 (getCurrentListMapNoExtraKeys!1248 lt!192219 lt!192217 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419201 () Bool)

(declare-fun res!244362 () Bool)

(declare-fun e!249866 () Bool)

(assert (=> b!419201 (=> (not res!244362) (not e!249866))))

(declare-fun _keys!709 () array!25505)

(assert (=> b!419201 (= res!244362 (or (= (select (arr!12202 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12202 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419202 () Bool)

(declare-fun res!244363 () Bool)

(declare-fun e!249868 () Bool)

(assert (=> b!419202 (=> (not res!244363) (not e!249868))))

(declare-datatypes ((List!7153 0))(
  ( (Nil!7150) (Cons!7149 (h!8005 (_ BitVec 64)) (t!12493 List!7153)) )
))
(declare-fun arrayNoDuplicates!0 (array!25505 (_ BitVec 32) List!7153) Bool)

(assert (=> b!419202 (= res!244363 (arrayNoDuplicates!0 lt!192219 #b00000000000000000000000000000000 Nil!7150))))

(declare-fun b!419203 () Bool)

(declare-fun e!249864 () Bool)

(declare-fun tp_is_empty!10827 () Bool)

(assert (=> b!419203 (= e!249864 tp_is_empty!10827)))

(declare-fun b!419204 () Bool)

(declare-fun res!244364 () Bool)

(assert (=> b!419204 (=> (not res!244364) (not e!249866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!419204 (= res!244364 (validKeyInArray!0 k0!794))))

(declare-fun res!244367 () Bool)

(assert (=> start!39408 (=> (not res!244367) (not e!249866))))

(assert (=> start!39408 (= res!244367 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12554 _keys!709))))))

(assert (=> start!39408 e!249866))

(assert (=> start!39408 tp_is_empty!10827))

(assert (=> start!39408 tp!34553))

(assert (=> start!39408 true))

(declare-fun e!249869 () Bool)

(declare-fun array_inv!8898 (array!25503) Bool)

(assert (=> start!39408 (and (array_inv!8898 _values!549) e!249869)))

(declare-fun array_inv!8899 (array!25505) Bool)

(assert (=> start!39408 (array_inv!8899 _keys!709)))

(declare-fun b!419205 () Bool)

(declare-fun res!244370 () Bool)

(assert (=> b!419205 (=> (not res!244370) (not e!249868))))

(assert (=> b!419205 (= res!244370 (bvsle from!863 i!563))))

(declare-fun b!419206 () Bool)

(declare-fun e!249865 () Bool)

(declare-fun mapRes!17862 () Bool)

(assert (=> b!419206 (= e!249869 (and e!249865 mapRes!17862))))

(declare-fun condMapEmpty!17862 () Bool)

(declare-fun mapDefault!17862 () ValueCell!5070)

(assert (=> b!419206 (= condMapEmpty!17862 (= (arr!12201 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5070)) mapDefault!17862)))))

(declare-fun b!419207 () Bool)

(declare-fun res!244360 () Bool)

(assert (=> b!419207 (=> (not res!244360) (not e!249866))))

(assert (=> b!419207 (= res!244360 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7150))))

(declare-fun bm!29200 () Bool)

(declare-fun call!29204 () ListLongMap!6055)

(declare-fun c!55226 () Bool)

(assert (=> bm!29200 (= call!29204 (getCurrentListMapNoExtraKeys!1248 (ite c!55226 _keys!709 lt!192219) (ite c!55226 _values!549 lt!192217) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419208 () Bool)

(declare-fun e!249863 () Bool)

(declare-fun call!29203 () ListLongMap!6055)

(assert (=> b!419208 (= e!249863 (= call!29204 call!29203))))

(declare-fun b!419209 () Bool)

(declare-fun e!249862 () Bool)

(assert (=> b!419209 (= e!249868 e!249862)))

(declare-fun res!244361 () Bool)

(assert (=> b!419209 (=> (not res!244361) (not e!249862))))

(assert (=> b!419209 (= res!244361 (= from!863 i!563))))

(assert (=> b!419209 (= lt!192214 (getCurrentListMapNoExtraKeys!1248 lt!192219 lt!192217 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419209 (= lt!192217 (array!25504 (store (arr!12201 _values!549) i!563 (ValueCellFull!5070 v!412)) (size!12553 _values!549)))))

(declare-fun lt!192220 () ListLongMap!6055)

(assert (=> b!419209 (= lt!192220 (getCurrentListMapNoExtraKeys!1248 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419210 () Bool)

(assert (=> b!419210 (= e!249865 tp_is_empty!10827)))

(declare-fun b!419211 () Bool)

(assert (=> b!419211 (= e!249863 (= call!29203 (+!1241 call!29204 (tuple2!7143 k0!794 v!412))))))

(declare-fun mapNonEmpty!17862 () Bool)

(declare-fun tp!34554 () Bool)

(assert (=> mapNonEmpty!17862 (= mapRes!17862 (and tp!34554 e!249864))))

(declare-fun mapRest!17862 () (Array (_ BitVec 32) ValueCell!5070))

(declare-fun mapKey!17862 () (_ BitVec 32))

(declare-fun mapValue!17862 () ValueCell!5070)

(assert (=> mapNonEmpty!17862 (= (arr!12201 _values!549) (store mapRest!17862 mapKey!17862 mapValue!17862))))

(declare-fun b!419212 () Bool)

(declare-fun res!244366 () Bool)

(assert (=> b!419212 (=> (not res!244366) (not e!249866))))

(declare-fun arrayContainsKey!0 (array!25505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!419212 (= res!244366 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!419213 () Bool)

(declare-fun res!244371 () Bool)

(assert (=> b!419213 (=> (not res!244371) (not e!249866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25505 (_ BitVec 32)) Bool)

(assert (=> b!419213 (= res!244371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419214 () Bool)

(declare-fun res!244368 () Bool)

(assert (=> b!419214 (=> (not res!244368) (not e!249866))))

(assert (=> b!419214 (= res!244368 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12554 _keys!709))))))

(declare-fun mapIsEmpty!17862 () Bool)

(assert (=> mapIsEmpty!17862 mapRes!17862))

(declare-fun b!419215 () Bool)

(declare-fun res!244365 () Bool)

(assert (=> b!419215 (=> (not res!244365) (not e!249866))))

(assert (=> b!419215 (= res!244365 (and (= (size!12553 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12554 _keys!709) (size!12553 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!419216 () Bool)

(assert (=> b!419216 (= e!249862 (not e!249867))))

(declare-fun res!244358 () Bool)

(assert (=> b!419216 (=> res!244358 e!249867)))

(assert (=> b!419216 (= res!244358 (validKeyInArray!0 (select (arr!12202 _keys!709) from!863)))))

(assert (=> b!419216 e!249863))

(assert (=> b!419216 (= c!55226 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!192213 () Unit!12388)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!445 (array!25505 array!25503 (_ BitVec 32) (_ BitVec 32) V!15541 V!15541 (_ BitVec 32) (_ BitVec 64) V!15541 (_ BitVec 32) Int) Unit!12388)

(assert (=> b!419216 (= lt!192213 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!445 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29201 () Bool)

(assert (=> bm!29201 (= call!29203 (getCurrentListMapNoExtraKeys!1248 (ite c!55226 lt!192219 _keys!709) (ite c!55226 lt!192217 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419217 () Bool)

(declare-fun res!244369 () Bool)

(assert (=> b!419217 (=> (not res!244369) (not e!249866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419217 (= res!244369 (validMask!0 mask!1025))))

(declare-fun b!419218 () Bool)

(assert (=> b!419218 (= e!249866 e!249868)))

(declare-fun res!244359 () Bool)

(assert (=> b!419218 (=> (not res!244359) (not e!249868))))

(assert (=> b!419218 (= res!244359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192219 mask!1025))))

(assert (=> b!419218 (= lt!192219 (array!25506 (store (arr!12202 _keys!709) i!563 k0!794) (size!12554 _keys!709)))))

(assert (= (and start!39408 res!244367) b!419217))

(assert (= (and b!419217 res!244369) b!419215))

(assert (= (and b!419215 res!244365) b!419213))

(assert (= (and b!419213 res!244371) b!419207))

(assert (= (and b!419207 res!244360) b!419214))

(assert (= (and b!419214 res!244368) b!419204))

(assert (= (and b!419204 res!244364) b!419201))

(assert (= (and b!419201 res!244362) b!419212))

(assert (= (and b!419212 res!244366) b!419218))

(assert (= (and b!419218 res!244359) b!419202))

(assert (= (and b!419202 res!244363) b!419205))

(assert (= (and b!419205 res!244370) b!419209))

(assert (= (and b!419209 res!244361) b!419216))

(assert (= (and b!419216 c!55226) b!419211))

(assert (= (and b!419216 (not c!55226)) b!419208))

(assert (= (or b!419211 b!419208) bm!29201))

(assert (= (or b!419211 b!419208) bm!29200))

(assert (= (and b!419216 (not res!244358)) b!419200))

(assert (= (and b!419206 condMapEmpty!17862) mapIsEmpty!17862))

(assert (= (and b!419206 (not condMapEmpty!17862)) mapNonEmpty!17862))

(get-info :version)

(assert (= (and mapNonEmpty!17862 ((_ is ValueCellFull!5070) mapValue!17862)) b!419203))

(assert (= (and b!419206 ((_ is ValueCellFull!5070) mapDefault!17862)) b!419210))

(assert (= start!39408 b!419206))

(declare-fun b_lambda!8979 () Bool)

(assert (=> (not b_lambda!8979) (not b!419200)))

(declare-fun t!12491 () Bool)

(declare-fun tb!3297 () Bool)

(assert (=> (and start!39408 (= defaultEntry!557 defaultEntry!557) t!12491) tb!3297))

(declare-fun result!6121 () Bool)

(assert (=> tb!3297 (= result!6121 tp_is_empty!10827)))

(assert (=> b!419200 t!12491))

(declare-fun b_and!17227 () Bool)

(assert (= b_and!17225 (and (=> t!12491 result!6121) b_and!17227)))

(declare-fun m!408677 () Bool)

(assert (=> b!419213 m!408677))

(declare-fun m!408679 () Bool)

(assert (=> bm!29201 m!408679))

(declare-fun m!408681 () Bool)

(assert (=> b!419209 m!408681))

(declare-fun m!408683 () Bool)

(assert (=> b!419209 m!408683))

(declare-fun m!408685 () Bool)

(assert (=> b!419209 m!408685))

(declare-fun m!408687 () Bool)

(assert (=> bm!29200 m!408687))

(declare-fun m!408689 () Bool)

(assert (=> b!419204 m!408689))

(declare-fun m!408691 () Bool)

(assert (=> b!419211 m!408691))

(declare-fun m!408693 () Bool)

(assert (=> b!419200 m!408693))

(declare-fun m!408695 () Bool)

(assert (=> b!419200 m!408695))

(declare-fun m!408697 () Bool)

(assert (=> b!419200 m!408697))

(declare-fun m!408699 () Bool)

(assert (=> b!419200 m!408699))

(declare-fun m!408701 () Bool)

(assert (=> b!419200 m!408701))

(assert (=> b!419200 m!408683))

(declare-fun m!408703 () Bool)

(assert (=> b!419200 m!408703))

(declare-fun m!408705 () Bool)

(assert (=> b!419200 m!408705))

(assert (=> b!419200 m!408699))

(declare-fun m!408707 () Bool)

(assert (=> b!419200 m!408707))

(declare-fun m!408709 () Bool)

(assert (=> b!419200 m!408709))

(declare-fun m!408711 () Bool)

(assert (=> b!419200 m!408711))

(assert (=> b!419200 m!408703))

(declare-fun m!408713 () Bool)

(assert (=> b!419200 m!408713))

(assert (=> b!419200 m!408693))

(declare-fun m!408715 () Bool)

(assert (=> b!419200 m!408715))

(declare-fun m!408717 () Bool)

(assert (=> b!419212 m!408717))

(declare-fun m!408719 () Bool)

(assert (=> b!419217 m!408719))

(declare-fun m!408721 () Bool)

(assert (=> b!419207 m!408721))

(declare-fun m!408723 () Bool)

(assert (=> b!419202 m!408723))

(declare-fun m!408725 () Bool)

(assert (=> b!419216 m!408725))

(assert (=> b!419216 m!408725))

(declare-fun m!408727 () Bool)

(assert (=> b!419216 m!408727))

(declare-fun m!408729 () Bool)

(assert (=> b!419216 m!408729))

(declare-fun m!408731 () Bool)

(assert (=> b!419218 m!408731))

(declare-fun m!408733 () Bool)

(assert (=> b!419218 m!408733))

(declare-fun m!408735 () Bool)

(assert (=> start!39408 m!408735))

(declare-fun m!408737 () Bool)

(assert (=> start!39408 m!408737))

(declare-fun m!408739 () Bool)

(assert (=> mapNonEmpty!17862 m!408739))

(declare-fun m!408741 () Bool)

(assert (=> b!419201 m!408741))

(check-sat (not b!419200) (not b!419211) (not b!419213) (not b!419207) (not mapNonEmpty!17862) (not bm!29201) (not b!419216) (not b_lambda!8979) (not b!419204) (not b!419209) (not bm!29200) (not b!419212) (not start!39408) (not b!419202) b_and!17227 (not b_next!9675) (not b!419217) tp_is_empty!10827 (not b!419218))
(check-sat b_and!17227 (not b_next!9675))
