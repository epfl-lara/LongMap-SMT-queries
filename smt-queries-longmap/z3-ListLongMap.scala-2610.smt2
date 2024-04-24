; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39464 () Bool)

(assert start!39464)

(declare-fun b_free!9745 () Bool)

(declare-fun b_next!9745 () Bool)

(assert (=> start!39464 (= b_free!9745 (not b_next!9745))))

(declare-fun tp!34763 () Bool)

(declare-fun b_and!17379 () Bool)

(assert (=> start!39464 (= tp!34763 b_and!17379)))

(declare-fun b!421216 () Bool)

(declare-fun res!245825 () Bool)

(declare-fun e!250783 () Bool)

(assert (=> b!421216 (=> (not res!245825) (not e!250783))))

(declare-datatypes ((array!25648 0))(
  ( (array!25649 (arr!12273 (Array (_ BitVec 32) (_ BitVec 64))) (size!12625 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25648)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25648 (_ BitVec 32)) Bool)

(assert (=> b!421216 (= res!245825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17967 () Bool)

(declare-fun mapRes!17967 () Bool)

(assert (=> mapIsEmpty!17967 mapRes!17967))

(declare-fun b!421217 () Bool)

(declare-fun e!250775 () Bool)

(declare-fun tp_is_empty!10897 () Bool)

(assert (=> b!421217 (= e!250775 tp_is_empty!10897)))

(declare-fun mapNonEmpty!17967 () Bool)

(declare-fun tp!34764 () Bool)

(assert (=> mapNonEmpty!17967 (= mapRes!17967 (and tp!34764 e!250775))))

(declare-datatypes ((V!15635 0))(
  ( (V!15636 (val!5493 Int)) )
))
(declare-datatypes ((ValueCell!5105 0))(
  ( (ValueCellFull!5105 (v!7741 V!15635)) (EmptyCell!5105) )
))
(declare-datatypes ((array!25650 0))(
  ( (array!25651 (arr!12274 (Array (_ BitVec 32) ValueCell!5105)) (size!12626 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25650)

(declare-fun mapRest!17967 () (Array (_ BitVec 32) ValueCell!5105))

(declare-fun mapKey!17967 () (_ BitVec 32))

(declare-fun mapValue!17967 () ValueCell!5105)

(assert (=> mapNonEmpty!17967 (= (arr!12274 _values!549) (store mapRest!17967 mapKey!17967 mapValue!17967))))

(declare-fun b!421218 () Bool)

(declare-fun res!245830 () Bool)

(assert (=> b!421218 (=> (not res!245830) (not e!250783))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421218 (= res!245830 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12625 _keys!709))))))

(declare-fun b!421219 () Bool)

(declare-fun res!245829 () Bool)

(declare-fun e!250778 () Bool)

(assert (=> b!421219 (=> (not res!245829) (not e!250778))))

(declare-fun lt!193392 () array!25648)

(declare-datatypes ((List!7090 0))(
  ( (Nil!7087) (Cons!7086 (h!7942 (_ BitVec 64)) (t!12492 List!7090)) )
))
(declare-fun arrayNoDuplicates!0 (array!25648 (_ BitVec 32) List!7090) Bool)

(assert (=> b!421219 (= res!245829 (arrayNoDuplicates!0 lt!193392 #b00000000000000000000000000000000 Nil!7087))))

(declare-fun b!421220 () Bool)

(declare-fun e!250779 () Bool)

(assert (=> b!421220 (= e!250779 true)))

(declare-fun lt!193390 () V!15635)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((tuple2!7086 0))(
  ( (tuple2!7087 (_1!3554 (_ BitVec 64)) (_2!3554 V!15635)) )
))
(declare-datatypes ((List!7091 0))(
  ( (Nil!7088) (Cons!7087 (h!7943 tuple2!7086) (t!12493 List!7091)) )
))
(declare-datatypes ((ListLongMap!6001 0))(
  ( (ListLongMap!6002 (toList!3016 List!7091)) )
))
(declare-fun lt!193386 () ListLongMap!6001)

(declare-fun lt!193385 () tuple2!7086)

(declare-fun +!1278 (ListLongMap!6001 tuple2!7086) ListLongMap!6001)

(assert (=> b!421220 (= (+!1278 lt!193386 lt!193385) (+!1278 (+!1278 lt!193386 (tuple2!7087 k0!794 lt!193390)) lt!193385))))

(declare-fun lt!193388 () V!15635)

(assert (=> b!421220 (= lt!193385 (tuple2!7087 k0!794 lt!193388))))

(declare-datatypes ((Unit!12431 0))(
  ( (Unit!12432) )
))
(declare-fun lt!193389 () Unit!12431)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!68 (ListLongMap!6001 (_ BitVec 64) V!15635 V!15635) Unit!12431)

(assert (=> b!421220 (= lt!193389 (addSameAsAddTwiceSameKeyDiffValues!68 lt!193386 k0!794 lt!193390 lt!193388))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!193393 () V!15635)

(declare-fun get!6104 (ValueCell!5105 V!15635) V!15635)

(assert (=> b!421220 (= lt!193390 (get!6104 (select (arr!12274 _values!549) from!863) lt!193393))))

(declare-fun lt!193394 () ListLongMap!6001)

(assert (=> b!421220 (= lt!193394 (+!1278 lt!193386 (tuple2!7087 (select (arr!12273 lt!193392) from!863) lt!193388)))))

(declare-fun v!412 () V!15635)

(assert (=> b!421220 (= lt!193388 (get!6104 (select (store (arr!12274 _values!549) i!563 (ValueCellFull!5105 v!412)) from!863) lt!193393))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!735 (Int (_ BitVec 64)) V!15635)

(assert (=> b!421220 (= lt!193393 (dynLambda!735 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15635)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!193395 () array!25650)

(declare-fun zeroValue!515 () V!15635)

(declare-fun getCurrentListMapNoExtraKeys!1262 (array!25648 array!25650 (_ BitVec 32) (_ BitVec 32) V!15635 V!15635 (_ BitVec 32) Int) ListLongMap!6001)

(assert (=> b!421220 (= lt!193386 (getCurrentListMapNoExtraKeys!1262 lt!193392 lt!193395 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29397 () Bool)

(declare-fun call!29401 () ListLongMap!6001)

(assert (=> bm!29397 (= call!29401 (getCurrentListMapNoExtraKeys!1262 lt!193392 lt!193395 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421221 () Bool)

(declare-fun e!250782 () Bool)

(assert (=> b!421221 (= e!250782 (not e!250779))))

(declare-fun res!245827 () Bool)

(assert (=> b!421221 (=> res!245827 e!250779)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421221 (= res!245827 (validKeyInArray!0 (select (arr!12273 _keys!709) from!863)))))

(declare-fun e!250781 () Bool)

(assert (=> b!421221 e!250781))

(declare-fun c!55308 () Bool)

(assert (=> b!421221 (= c!55308 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193387 () Unit!12431)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!465 (array!25648 array!25650 (_ BitVec 32) (_ BitVec 32) V!15635 V!15635 (_ BitVec 32) (_ BitVec 64) V!15635 (_ BitVec 32) Int) Unit!12431)

(assert (=> b!421221 (= lt!193387 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!465 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421223 () Bool)

(declare-fun res!245837 () Bool)

(assert (=> b!421223 (=> (not res!245837) (not e!250783))))

(declare-fun arrayContainsKey!0 (array!25648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421223 (= res!245837 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421224 () Bool)

(assert (=> b!421224 (= e!250783 e!250778)))

(declare-fun res!245831 () Bool)

(assert (=> b!421224 (=> (not res!245831) (not e!250778))))

(assert (=> b!421224 (= res!245831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193392 mask!1025))))

(assert (=> b!421224 (= lt!193392 (array!25649 (store (arr!12273 _keys!709) i!563 k0!794) (size!12625 _keys!709)))))

(declare-fun b!421225 () Bool)

(assert (=> b!421225 (= e!250778 e!250782)))

(declare-fun res!245828 () Bool)

(assert (=> b!421225 (=> (not res!245828) (not e!250782))))

(assert (=> b!421225 (= res!245828 (= from!863 i!563))))

(assert (=> b!421225 (= lt!193394 (getCurrentListMapNoExtraKeys!1262 lt!193392 lt!193395 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421225 (= lt!193395 (array!25651 (store (arr!12274 _values!549) i!563 (ValueCellFull!5105 v!412)) (size!12626 _values!549)))))

(declare-fun lt!193391 () ListLongMap!6001)

(assert (=> b!421225 (= lt!193391 (getCurrentListMapNoExtraKeys!1262 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421226 () Bool)

(declare-fun res!245836 () Bool)

(assert (=> b!421226 (=> (not res!245836) (not e!250783))))

(assert (=> b!421226 (= res!245836 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7087))))

(declare-fun b!421227 () Bool)

(declare-fun call!29400 () ListLongMap!6001)

(assert (=> b!421227 (= e!250781 (= call!29401 call!29400))))

(declare-fun b!421228 () Bool)

(declare-fun e!250777 () Bool)

(declare-fun e!250776 () Bool)

(assert (=> b!421228 (= e!250777 (and e!250776 mapRes!17967))))

(declare-fun condMapEmpty!17967 () Bool)

(declare-fun mapDefault!17967 () ValueCell!5105)

(assert (=> b!421228 (= condMapEmpty!17967 (= (arr!12274 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5105)) mapDefault!17967)))))

(declare-fun b!421229 () Bool)

(declare-fun res!245832 () Bool)

(assert (=> b!421229 (=> (not res!245832) (not e!250783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421229 (= res!245832 (validMask!0 mask!1025))))

(declare-fun b!421222 () Bool)

(declare-fun res!245835 () Bool)

(assert (=> b!421222 (=> (not res!245835) (not e!250778))))

(assert (=> b!421222 (= res!245835 (bvsle from!863 i!563))))

(declare-fun res!245838 () Bool)

(assert (=> start!39464 (=> (not res!245838) (not e!250783))))

(assert (=> start!39464 (= res!245838 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12625 _keys!709))))))

(assert (=> start!39464 e!250783))

(assert (=> start!39464 tp_is_empty!10897))

(assert (=> start!39464 tp!34763))

(assert (=> start!39464 true))

(declare-fun array_inv!9022 (array!25650) Bool)

(assert (=> start!39464 (and (array_inv!9022 _values!549) e!250777)))

(declare-fun array_inv!9023 (array!25648) Bool)

(assert (=> start!39464 (array_inv!9023 _keys!709)))

(declare-fun b!421230 () Bool)

(declare-fun res!245826 () Bool)

(assert (=> b!421230 (=> (not res!245826) (not e!250783))))

(assert (=> b!421230 (= res!245826 (and (= (size!12626 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12625 _keys!709) (size!12626 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421231 () Bool)

(assert (=> b!421231 (= e!250781 (= call!29401 (+!1278 call!29400 (tuple2!7087 k0!794 v!412))))))

(declare-fun b!421232 () Bool)

(declare-fun res!245833 () Bool)

(assert (=> b!421232 (=> (not res!245833) (not e!250783))))

(assert (=> b!421232 (= res!245833 (validKeyInArray!0 k0!794))))

(declare-fun bm!29398 () Bool)

(assert (=> bm!29398 (= call!29400 (getCurrentListMapNoExtraKeys!1262 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421233 () Bool)

(assert (=> b!421233 (= e!250776 tp_is_empty!10897)))

(declare-fun b!421234 () Bool)

(declare-fun res!245834 () Bool)

(assert (=> b!421234 (=> (not res!245834) (not e!250783))))

(assert (=> b!421234 (= res!245834 (or (= (select (arr!12273 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12273 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39464 res!245838) b!421229))

(assert (= (and b!421229 res!245832) b!421230))

(assert (= (and b!421230 res!245826) b!421216))

(assert (= (and b!421216 res!245825) b!421226))

(assert (= (and b!421226 res!245836) b!421218))

(assert (= (and b!421218 res!245830) b!421232))

(assert (= (and b!421232 res!245833) b!421234))

(assert (= (and b!421234 res!245834) b!421223))

(assert (= (and b!421223 res!245837) b!421224))

(assert (= (and b!421224 res!245831) b!421219))

(assert (= (and b!421219 res!245829) b!421222))

(assert (= (and b!421222 res!245835) b!421225))

(assert (= (and b!421225 res!245828) b!421221))

(assert (= (and b!421221 c!55308) b!421231))

(assert (= (and b!421221 (not c!55308)) b!421227))

(assert (= (or b!421231 b!421227) bm!29398))

(assert (= (or b!421231 b!421227) bm!29397))

(assert (= (and b!421221 (not res!245827)) b!421220))

(assert (= (and b!421228 condMapEmpty!17967) mapIsEmpty!17967))

(assert (= (and b!421228 (not condMapEmpty!17967)) mapNonEmpty!17967))

(get-info :version)

(assert (= (and mapNonEmpty!17967 ((_ is ValueCellFull!5105) mapValue!17967)) b!421217))

(assert (= (and b!421228 ((_ is ValueCellFull!5105) mapDefault!17967)) b!421233))

(assert (= start!39464 b!421228))

(declare-fun b_lambda!9071 () Bool)

(assert (=> (not b_lambda!9071) (not b!421220)))

(declare-fun t!12491 () Bool)

(declare-fun tb!3359 () Bool)

(assert (=> (and start!39464 (= defaultEntry!557 defaultEntry!557) t!12491) tb!3359))

(declare-fun result!6253 () Bool)

(assert (=> tb!3359 (= result!6253 tp_is_empty!10897)))

(assert (=> b!421220 t!12491))

(declare-fun b_and!17381 () Bool)

(assert (= b_and!17379 (and (=> t!12491 result!6253) b_and!17381)))

(declare-fun m!411205 () Bool)

(assert (=> b!421219 m!411205))

(declare-fun m!411207 () Bool)

(assert (=> b!421231 m!411207))

(declare-fun m!411209 () Bool)

(assert (=> b!421234 m!411209))

(declare-fun m!411211 () Bool)

(assert (=> start!39464 m!411211))

(declare-fun m!411213 () Bool)

(assert (=> start!39464 m!411213))

(declare-fun m!411215 () Bool)

(assert (=> b!421229 m!411215))

(declare-fun m!411217 () Bool)

(assert (=> b!421225 m!411217))

(declare-fun m!411219 () Bool)

(assert (=> b!421225 m!411219))

(declare-fun m!411221 () Bool)

(assert (=> b!421225 m!411221))

(declare-fun m!411223 () Bool)

(assert (=> b!421232 m!411223))

(declare-fun m!411225 () Bool)

(assert (=> bm!29398 m!411225))

(declare-fun m!411227 () Bool)

(assert (=> b!421223 m!411227))

(declare-fun m!411229 () Bool)

(assert (=> b!421224 m!411229))

(declare-fun m!411231 () Bool)

(assert (=> b!421224 m!411231))

(declare-fun m!411233 () Bool)

(assert (=> b!421220 m!411233))

(declare-fun m!411235 () Bool)

(assert (=> b!421220 m!411235))

(declare-fun m!411237 () Bool)

(assert (=> b!421220 m!411237))

(assert (=> b!421220 m!411219))

(declare-fun m!411239 () Bool)

(assert (=> b!421220 m!411239))

(declare-fun m!411241 () Bool)

(assert (=> b!421220 m!411241))

(declare-fun m!411243 () Bool)

(assert (=> b!421220 m!411243))

(declare-fun m!411245 () Bool)

(assert (=> b!421220 m!411245))

(declare-fun m!411247 () Bool)

(assert (=> b!421220 m!411247))

(assert (=> b!421220 m!411233))

(declare-fun m!411249 () Bool)

(assert (=> b!421220 m!411249))

(assert (=> b!421220 m!411241))

(declare-fun m!411251 () Bool)

(assert (=> b!421220 m!411251))

(declare-fun m!411253 () Bool)

(assert (=> b!421220 m!411253))

(assert (=> b!421220 m!411249))

(declare-fun m!411255 () Bool)

(assert (=> b!421220 m!411255))

(declare-fun m!411257 () Bool)

(assert (=> b!421226 m!411257))

(declare-fun m!411259 () Bool)

(assert (=> b!421216 m!411259))

(declare-fun m!411261 () Bool)

(assert (=> mapNonEmpty!17967 m!411261))

(assert (=> bm!29397 m!411245))

(declare-fun m!411263 () Bool)

(assert (=> b!421221 m!411263))

(assert (=> b!421221 m!411263))

(declare-fun m!411265 () Bool)

(assert (=> b!421221 m!411265))

(declare-fun m!411267 () Bool)

(assert (=> b!421221 m!411267))

(check-sat (not b!421219) tp_is_empty!10897 (not b_lambda!9071) (not b!421224) (not b!421223) (not b!421216) (not b!421220) b_and!17381 (not start!39464) (not b!421225) (not bm!29398) (not b!421229) (not b!421226) (not b!421221) (not b!421231) (not b!421232) (not mapNonEmpty!17967) (not b_next!9745) (not bm!29397))
(check-sat b_and!17381 (not b_next!9745))
