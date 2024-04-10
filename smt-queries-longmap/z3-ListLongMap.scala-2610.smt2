; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39480 () Bool)

(assert start!39480)

(declare-fun b_free!9747 () Bool)

(declare-fun b_next!9747 () Bool)

(assert (=> start!39480 (= b_free!9747 (not b_next!9747))))

(declare-fun tp!34769 () Bool)

(declare-fun b_and!17369 () Bool)

(assert (=> start!39480 (= tp!34769 b_and!17369)))

(declare-fun b!421324 () Bool)

(declare-fun res!245871 () Bool)

(declare-fun e!250837 () Bool)

(assert (=> b!421324 (=> (not res!245871) (not e!250837))))

(declare-datatypes ((array!25647 0))(
  ( (array!25648 (arr!12273 (Array (_ BitVec 32) (_ BitVec 64))) (size!12625 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25647)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421324 (= res!245871 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421325 () Bool)

(declare-fun e!250839 () Bool)

(declare-fun e!250840 () Bool)

(declare-fun mapRes!17970 () Bool)

(assert (=> b!421325 (= e!250839 (and e!250840 mapRes!17970))))

(declare-fun condMapEmpty!17970 () Bool)

(declare-datatypes ((V!15637 0))(
  ( (V!15638 (val!5494 Int)) )
))
(declare-datatypes ((ValueCell!5106 0))(
  ( (ValueCellFull!5106 (v!7741 V!15637)) (EmptyCell!5106) )
))
(declare-datatypes ((array!25649 0))(
  ( (array!25650 (arr!12274 (Array (_ BitVec 32) ValueCell!5106)) (size!12626 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25649)

(declare-fun mapDefault!17970 () ValueCell!5106)

(assert (=> b!421325 (= condMapEmpty!17970 (= (arr!12274 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5106)) mapDefault!17970)))))

(declare-fun b!421326 () Bool)

(declare-fun res!245882 () Bool)

(assert (=> b!421326 (=> (not res!245882) (not e!250837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421326 (= res!245882 (validKeyInArray!0 k0!794))))

(declare-fun b!421327 () Bool)

(declare-fun e!250834 () Bool)

(declare-fun tp_is_empty!10899 () Bool)

(assert (=> b!421327 (= e!250834 tp_is_empty!10899)))

(declare-fun res!245878 () Bool)

(assert (=> start!39480 (=> (not res!245878) (not e!250837))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39480 (= res!245878 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12625 _keys!709))))))

(assert (=> start!39480 e!250837))

(assert (=> start!39480 tp_is_empty!10899))

(assert (=> start!39480 tp!34769))

(assert (=> start!39480 true))

(declare-fun array_inv!8942 (array!25649) Bool)

(assert (=> start!39480 (and (array_inv!8942 _values!549) e!250839)))

(declare-fun array_inv!8943 (array!25647) Bool)

(assert (=> start!39480 (array_inv!8943 _keys!709)))

(declare-fun b!421328 () Bool)

(declare-fun res!245876 () Bool)

(declare-fun e!250842 () Bool)

(assert (=> b!421328 (=> (not res!245876) (not e!250842))))

(declare-fun lt!193404 () array!25647)

(declare-datatypes ((List!7210 0))(
  ( (Nil!7207) (Cons!7206 (h!8062 (_ BitVec 64)) (t!12622 List!7210)) )
))
(declare-fun arrayNoDuplicates!0 (array!25647 (_ BitVec 32) List!7210) Bool)

(assert (=> b!421328 (= res!245876 (arrayNoDuplicates!0 lt!193404 #b00000000000000000000000000000000 Nil!7207))))

(declare-fun b!421329 () Bool)

(declare-fun res!245873 () Bool)

(assert (=> b!421329 (=> (not res!245873) (not e!250837))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421329 (= res!245873 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12625 _keys!709))))))

(declare-fun b!421330 () Bool)

(declare-fun e!250835 () Bool)

(assert (=> b!421330 (= e!250835 true)))

(declare-datatypes ((tuple2!7204 0))(
  ( (tuple2!7205 (_1!3613 (_ BitVec 64)) (_2!3613 V!15637)) )
))
(declare-fun lt!193400 () tuple2!7204)

(declare-fun lt!193405 () V!15637)

(declare-datatypes ((List!7211 0))(
  ( (Nil!7208) (Cons!7207 (h!8063 tuple2!7204) (t!12623 List!7211)) )
))
(declare-datatypes ((ListLongMap!6117 0))(
  ( (ListLongMap!6118 (toList!3074 List!7211)) )
))
(declare-fun lt!193399 () ListLongMap!6117)

(declare-fun +!1269 (ListLongMap!6117 tuple2!7204) ListLongMap!6117)

(assert (=> b!421330 (= (+!1269 lt!193399 lt!193400) (+!1269 (+!1269 lt!193399 (tuple2!7205 k0!794 lt!193405)) lt!193400))))

(declare-fun lt!193403 () V!15637)

(assert (=> b!421330 (= lt!193400 (tuple2!7205 k0!794 lt!193403))))

(declare-datatypes ((Unit!12442 0))(
  ( (Unit!12443) )
))
(declare-fun lt!193407 () Unit!12442)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!64 (ListLongMap!6117 (_ BitVec 64) V!15637 V!15637) Unit!12442)

(assert (=> b!421330 (= lt!193407 (addSameAsAddTwiceSameKeyDiffValues!64 lt!193399 k0!794 lt!193405 lt!193403))))

(declare-fun lt!193401 () V!15637)

(declare-fun get!6098 (ValueCell!5106 V!15637) V!15637)

(assert (=> b!421330 (= lt!193405 (get!6098 (select (arr!12274 _values!549) from!863) lt!193401))))

(declare-fun lt!193408 () ListLongMap!6117)

(assert (=> b!421330 (= lt!193408 (+!1269 lt!193399 (tuple2!7205 (select (arr!12273 lt!193404) from!863) lt!193403)))))

(declare-fun v!412 () V!15637)

(assert (=> b!421330 (= lt!193403 (get!6098 (select (store (arr!12274 _values!549) i!563 (ValueCellFull!5106 v!412)) from!863) lt!193401))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!735 (Int (_ BitVec 64)) V!15637)

(assert (=> b!421330 (= lt!193401 (dynLambda!735 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15637)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15637)

(declare-fun lt!193402 () array!25649)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1278 (array!25647 array!25649 (_ BitVec 32) (_ BitVec 32) V!15637 V!15637 (_ BitVec 32) Int) ListLongMap!6117)

(assert (=> b!421330 (= lt!193399 (getCurrentListMapNoExtraKeys!1278 lt!193404 lt!193402 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421331 () Bool)

(declare-fun res!245879 () Bool)

(assert (=> b!421331 (=> (not res!245879) (not e!250837))))

(assert (=> b!421331 (= res!245879 (or (= (select (arr!12273 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12273 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17970 () Bool)

(declare-fun tp!34770 () Bool)

(assert (=> mapNonEmpty!17970 (= mapRes!17970 (and tp!34770 e!250834))))

(declare-fun mapRest!17970 () (Array (_ BitVec 32) ValueCell!5106))

(declare-fun mapValue!17970 () ValueCell!5106)

(declare-fun mapKey!17970 () (_ BitVec 32))

(assert (=> mapNonEmpty!17970 (= (arr!12274 _values!549) (store mapRest!17970 mapKey!17970 mapValue!17970))))

(declare-fun b!421332 () Bool)

(declare-fun res!245872 () Bool)

(assert (=> b!421332 (=> (not res!245872) (not e!250837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421332 (= res!245872 (validMask!0 mask!1025))))

(declare-fun b!421333 () Bool)

(declare-fun res!245883 () Bool)

(assert (=> b!421333 (=> (not res!245883) (not e!250842))))

(assert (=> b!421333 (= res!245883 (bvsle from!863 i!563))))

(declare-fun bm!29416 () Bool)

(declare-fun c!55334 () Bool)

(declare-fun call!29420 () ListLongMap!6117)

(assert (=> bm!29416 (= call!29420 (getCurrentListMapNoExtraKeys!1278 (ite c!55334 lt!193404 _keys!709) (ite c!55334 lt!193402 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421334 () Bool)

(declare-fun e!250836 () Bool)

(assert (=> b!421334 (= e!250836 (not e!250835))))

(declare-fun res!245870 () Bool)

(assert (=> b!421334 (=> res!245870 e!250835)))

(assert (=> b!421334 (= res!245870 (validKeyInArray!0 (select (arr!12273 _keys!709) from!863)))))

(declare-fun e!250838 () Bool)

(assert (=> b!421334 e!250838))

(assert (=> b!421334 (= c!55334 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193406 () Unit!12442)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!467 (array!25647 array!25649 (_ BitVec 32) (_ BitVec 32) V!15637 V!15637 (_ BitVec 32) (_ BitVec 64) V!15637 (_ BitVec 32) Int) Unit!12442)

(assert (=> b!421334 (= lt!193406 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!467 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421335 () Bool)

(assert (=> b!421335 (= e!250840 tp_is_empty!10899)))

(declare-fun b!421336 () Bool)

(assert (=> b!421336 (= e!250837 e!250842)))

(declare-fun res!245875 () Bool)

(assert (=> b!421336 (=> (not res!245875) (not e!250842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25647 (_ BitVec 32)) Bool)

(assert (=> b!421336 (= res!245875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193404 mask!1025))))

(assert (=> b!421336 (= lt!193404 (array!25648 (store (arr!12273 _keys!709) i!563 k0!794) (size!12625 _keys!709)))))

(declare-fun b!421337 () Bool)

(assert (=> b!421337 (= e!250842 e!250836)))

(declare-fun res!245881 () Bool)

(assert (=> b!421337 (=> (not res!245881) (not e!250836))))

(assert (=> b!421337 (= res!245881 (= from!863 i!563))))

(assert (=> b!421337 (= lt!193408 (getCurrentListMapNoExtraKeys!1278 lt!193404 lt!193402 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421337 (= lt!193402 (array!25650 (store (arr!12274 _values!549) i!563 (ValueCellFull!5106 v!412)) (size!12626 _values!549)))))

(declare-fun lt!193409 () ListLongMap!6117)

(assert (=> b!421337 (= lt!193409 (getCurrentListMapNoExtraKeys!1278 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421338 () Bool)

(declare-fun res!245880 () Bool)

(assert (=> b!421338 (=> (not res!245880) (not e!250837))))

(assert (=> b!421338 (= res!245880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421339 () Bool)

(declare-fun res!245874 () Bool)

(assert (=> b!421339 (=> (not res!245874) (not e!250837))))

(assert (=> b!421339 (= res!245874 (and (= (size!12626 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12625 _keys!709) (size!12626 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!29417 () Bool)

(declare-fun call!29419 () ListLongMap!6117)

(assert (=> bm!29417 (= call!29419 (getCurrentListMapNoExtraKeys!1278 (ite c!55334 _keys!709 lt!193404) (ite c!55334 _values!549 lt!193402) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421340 () Bool)

(assert (=> b!421340 (= e!250838 (= call!29420 (+!1269 call!29419 (tuple2!7205 k0!794 v!412))))))

(declare-fun mapIsEmpty!17970 () Bool)

(assert (=> mapIsEmpty!17970 mapRes!17970))

(declare-fun b!421341 () Bool)

(declare-fun res!245877 () Bool)

(assert (=> b!421341 (=> (not res!245877) (not e!250837))))

(assert (=> b!421341 (= res!245877 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7207))))

(declare-fun b!421342 () Bool)

(assert (=> b!421342 (= e!250838 (= call!29419 call!29420))))

(assert (= (and start!39480 res!245878) b!421332))

(assert (= (and b!421332 res!245872) b!421339))

(assert (= (and b!421339 res!245874) b!421338))

(assert (= (and b!421338 res!245880) b!421341))

(assert (= (and b!421341 res!245877) b!421329))

(assert (= (and b!421329 res!245873) b!421326))

(assert (= (and b!421326 res!245882) b!421331))

(assert (= (and b!421331 res!245879) b!421324))

(assert (= (and b!421324 res!245871) b!421336))

(assert (= (and b!421336 res!245875) b!421328))

(assert (= (and b!421328 res!245876) b!421333))

(assert (= (and b!421333 res!245883) b!421337))

(assert (= (and b!421337 res!245881) b!421334))

(assert (= (and b!421334 c!55334) b!421340))

(assert (= (and b!421334 (not c!55334)) b!421342))

(assert (= (or b!421340 b!421342) bm!29416))

(assert (= (or b!421340 b!421342) bm!29417))

(assert (= (and b!421334 (not res!245870)) b!421330))

(assert (= (and b!421325 condMapEmpty!17970) mapIsEmpty!17970))

(assert (= (and b!421325 (not condMapEmpty!17970)) mapNonEmpty!17970))

(get-info :version)

(assert (= (and mapNonEmpty!17970 ((_ is ValueCellFull!5106) mapValue!17970)) b!421327))

(assert (= (and b!421325 ((_ is ValueCellFull!5106) mapDefault!17970)) b!421335))

(assert (= start!39480 b!421325))

(declare-fun b_lambda!9051 () Bool)

(assert (=> (not b_lambda!9051) (not b!421330)))

(declare-fun t!12621 () Bool)

(declare-fun tb!3369 () Bool)

(assert (=> (and start!39480 (= defaultEntry!557 defaultEntry!557) t!12621) tb!3369))

(declare-fun result!6265 () Bool)

(assert (=> tb!3369 (= result!6265 tp_is_empty!10899)))

(assert (=> b!421330 t!12621))

(declare-fun b_and!17371 () Bool)

(assert (= b_and!17369 (and (=> t!12621 result!6265) b_and!17371)))

(declare-fun m!411053 () Bool)

(assert (=> b!421338 m!411053))

(declare-fun m!411055 () Bool)

(assert (=> mapNonEmpty!17970 m!411055))

(declare-fun m!411057 () Bool)

(assert (=> b!421331 m!411057))

(declare-fun m!411059 () Bool)

(assert (=> b!421341 m!411059))

(declare-fun m!411061 () Bool)

(assert (=> b!421324 m!411061))

(declare-fun m!411063 () Bool)

(assert (=> b!421340 m!411063))

(declare-fun m!411065 () Bool)

(assert (=> bm!29416 m!411065))

(declare-fun m!411067 () Bool)

(assert (=> b!421334 m!411067))

(assert (=> b!421334 m!411067))

(declare-fun m!411069 () Bool)

(assert (=> b!421334 m!411069))

(declare-fun m!411071 () Bool)

(assert (=> b!421334 m!411071))

(declare-fun m!411073 () Bool)

(assert (=> b!421332 m!411073))

(declare-fun m!411075 () Bool)

(assert (=> b!421336 m!411075))

(declare-fun m!411077 () Bool)

(assert (=> b!421336 m!411077))

(declare-fun m!411079 () Bool)

(assert (=> start!39480 m!411079))

(declare-fun m!411081 () Bool)

(assert (=> start!39480 m!411081))

(declare-fun m!411083 () Bool)

(assert (=> b!421328 m!411083))

(declare-fun m!411085 () Bool)

(assert (=> bm!29417 m!411085))

(declare-fun m!411087 () Bool)

(assert (=> b!421330 m!411087))

(declare-fun m!411089 () Bool)

(assert (=> b!421330 m!411089))

(declare-fun m!411091 () Bool)

(assert (=> b!421330 m!411091))

(declare-fun m!411093 () Bool)

(assert (=> b!421330 m!411093))

(declare-fun m!411095 () Bool)

(assert (=> b!421330 m!411095))

(declare-fun m!411097 () Bool)

(assert (=> b!421330 m!411097))

(declare-fun m!411099 () Bool)

(assert (=> b!421330 m!411099))

(assert (=> b!421330 m!411099))

(declare-fun m!411101 () Bool)

(assert (=> b!421330 m!411101))

(assert (=> b!421330 m!411095))

(declare-fun m!411103 () Bool)

(assert (=> b!421330 m!411103))

(declare-fun m!411105 () Bool)

(assert (=> b!421330 m!411105))

(declare-fun m!411107 () Bool)

(assert (=> b!421330 m!411107))

(declare-fun m!411109 () Bool)

(assert (=> b!421330 m!411109))

(assert (=> b!421330 m!411091))

(declare-fun m!411111 () Bool)

(assert (=> b!421330 m!411111))

(declare-fun m!411113 () Bool)

(assert (=> b!421337 m!411113))

(assert (=> b!421337 m!411089))

(declare-fun m!411115 () Bool)

(assert (=> b!421337 m!411115))

(declare-fun m!411117 () Bool)

(assert (=> b!421326 m!411117))

(check-sat (not b!421326) (not bm!29417) (not bm!29416) tp_is_empty!10899 (not b!421338) (not b_next!9747) (not b!421324) (not b!421332) (not b_lambda!9051) (not b!421336) (not start!39480) (not b!421337) b_and!17371 (not b!421341) (not b!421340) (not mapNonEmpty!17970) (not b!421330) (not b!421334) (not b!421328))
(check-sat b_and!17371 (not b_next!9747))
