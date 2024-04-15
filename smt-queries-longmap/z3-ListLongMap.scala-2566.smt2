; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39200 () Bool)

(assert start!39200)

(declare-fun b_free!9481 () Bool)

(declare-fun b_next!9481 () Bool)

(assert (=> start!39200 (= b_free!9481 (not b_next!9481))))

(declare-fun tp!33972 () Bool)

(declare-fun b_and!16841 () Bool)

(assert (=> start!39200 (= tp!33972 b_and!16841)))

(declare-fun b!413270 () Bool)

(declare-fun e!247106 () Bool)

(declare-fun e!247107 () Bool)

(assert (=> b!413270 (= e!247106 e!247107)))

(declare-fun res!240193 () Bool)

(assert (=> b!413270 (=> (not res!240193) (not e!247107))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413270 (= res!240193 (= from!863 i!563))))

(declare-datatypes ((V!15283 0))(
  ( (V!15284 (val!5361 Int)) )
))
(declare-fun minValue!515 () V!15283)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15283)

(declare-datatypes ((tuple2!6948 0))(
  ( (tuple2!6949 (_1!3485 (_ BitVec 64)) (_2!3485 V!15283)) )
))
(declare-datatypes ((List!6965 0))(
  ( (Nil!6962) (Cons!6961 (h!7817 tuple2!6948) (t!12130 List!6965)) )
))
(declare-datatypes ((ListLongMap!5851 0))(
  ( (ListLongMap!5852 (toList!2941 List!6965)) )
))
(declare-fun lt!189521 () ListLongMap!5851)

(declare-datatypes ((ValueCell!4973 0))(
  ( (ValueCellFull!4973 (v!7602 V!15283)) (EmptyCell!4973) )
))
(declare-datatypes ((array!25115 0))(
  ( (array!25116 (arr!12007 (Array (_ BitVec 32) ValueCell!4973)) (size!12360 (_ BitVec 32))) )
))
(declare-fun lt!189523 () array!25115)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!25117 0))(
  ( (array!25118 (arr!12008 (Array (_ BitVec 32) (_ BitVec 64))) (size!12361 (_ BitVec 32))) )
))
(declare-fun lt!189524 () array!25117)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1154 (array!25117 array!25115 (_ BitVec 32) (_ BitVec 32) V!15283 V!15283 (_ BitVec 32) Int) ListLongMap!5851)

(assert (=> b!413270 (= lt!189521 (getCurrentListMapNoExtraKeys!1154 lt!189524 lt!189523 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25115)

(declare-fun v!412 () V!15283)

(assert (=> b!413270 (= lt!189523 (array!25116 (store (arr!12007 _values!549) i!563 (ValueCellFull!4973 v!412)) (size!12360 _values!549)))))

(declare-fun lt!189522 () ListLongMap!5851)

(declare-fun _keys!709 () array!25117)

(assert (=> b!413270 (= lt!189522 (getCurrentListMapNoExtraKeys!1154 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413271 () Bool)

(declare-fun e!247108 () Bool)

(declare-fun tp_is_empty!10633 () Bool)

(assert (=> b!413271 (= e!247108 tp_is_empty!10633)))

(declare-fun mapIsEmpty!17571 () Bool)

(declare-fun mapRes!17571 () Bool)

(assert (=> mapIsEmpty!17571 mapRes!17571))

(declare-fun b!413273 () Bool)

(declare-fun res!240200 () Bool)

(assert (=> b!413273 (=> (not res!240200) (not e!247106))))

(assert (=> b!413273 (= res!240200 (bvsle from!863 i!563))))

(declare-fun b!413274 () Bool)

(declare-fun e!247109 () Bool)

(assert (=> b!413274 (= e!247109 tp_is_empty!10633)))

(declare-fun b!413275 () Bool)

(declare-fun res!240194 () Bool)

(declare-fun e!247110 () Bool)

(assert (=> b!413275 (=> (not res!240194) (not e!247110))))

(declare-datatypes ((List!6966 0))(
  ( (Nil!6963) (Cons!6962 (h!7818 (_ BitVec 64)) (t!12131 List!6966)) )
))
(declare-fun arrayNoDuplicates!0 (array!25117 (_ BitVec 32) List!6966) Bool)

(assert (=> b!413275 (= res!240194 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6963))))

(declare-fun b!413276 () Bool)

(declare-fun res!240198 () Bool)

(assert (=> b!413276 (=> (not res!240198) (not e!247110))))

(assert (=> b!413276 (= res!240198 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12361 _keys!709))))))

(declare-fun b!413277 () Bool)

(declare-fun e!247104 () Bool)

(assert (=> b!413277 (= e!247104 (and e!247108 mapRes!17571))))

(declare-fun condMapEmpty!17571 () Bool)

(declare-fun mapDefault!17571 () ValueCell!4973)

(assert (=> b!413277 (= condMapEmpty!17571 (= (arr!12007 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4973)) mapDefault!17571)))))

(declare-fun b!413278 () Bool)

(declare-fun res!240189 () Bool)

(assert (=> b!413278 (=> (not res!240189) (not e!247110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25117 (_ BitVec 32)) Bool)

(assert (=> b!413278 (= res!240189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun call!28596 () ListLongMap!5851)

(declare-fun bm!28593 () Bool)

(declare-fun c!54864 () Bool)

(assert (=> bm!28593 (= call!28596 (getCurrentListMapNoExtraKeys!1154 (ite c!54864 _keys!709 lt!189524) (ite c!54864 _values!549 lt!189523) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413279 () Bool)

(declare-fun res!240197 () Bool)

(assert (=> b!413279 (=> (not res!240197) (not e!247110))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413279 (= res!240197 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413280 () Bool)

(declare-fun res!240191 () Bool)

(assert (=> b!413280 (=> (not res!240191) (not e!247110))))

(assert (=> b!413280 (= res!240191 (and (= (size!12360 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12361 _keys!709) (size!12360 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413281 () Bool)

(assert (=> b!413281 (= e!247110 e!247106)))

(declare-fun res!240190 () Bool)

(assert (=> b!413281 (=> (not res!240190) (not e!247106))))

(assert (=> b!413281 (= res!240190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189524 mask!1025))))

(assert (=> b!413281 (= lt!189524 (array!25118 (store (arr!12008 _keys!709) i!563 k0!794) (size!12361 _keys!709)))))

(declare-fun b!413282 () Bool)

(declare-fun e!247105 () Bool)

(declare-fun call!28597 () ListLongMap!5851)

(assert (=> b!413282 (= e!247105 (= call!28596 call!28597))))

(declare-fun res!240199 () Bool)

(assert (=> start!39200 (=> (not res!240199) (not e!247110))))

(assert (=> start!39200 (= res!240199 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12361 _keys!709))))))

(assert (=> start!39200 e!247110))

(assert (=> start!39200 tp_is_empty!10633))

(assert (=> start!39200 tp!33972))

(assert (=> start!39200 true))

(declare-fun array_inv!8812 (array!25115) Bool)

(assert (=> start!39200 (and (array_inv!8812 _values!549) e!247104)))

(declare-fun array_inv!8813 (array!25117) Bool)

(assert (=> start!39200 (array_inv!8813 _keys!709)))

(declare-fun b!413272 () Bool)

(declare-fun res!240195 () Bool)

(assert (=> b!413272 (=> (not res!240195) (not e!247106))))

(assert (=> b!413272 (= res!240195 (arrayNoDuplicates!0 lt!189524 #b00000000000000000000000000000000 Nil!6963))))

(declare-fun b!413283 () Bool)

(declare-fun res!240196 () Bool)

(assert (=> b!413283 (=> (not res!240196) (not e!247110))))

(assert (=> b!413283 (= res!240196 (or (= (select (arr!12008 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12008 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413284 () Bool)

(declare-fun +!1182 (ListLongMap!5851 tuple2!6948) ListLongMap!5851)

(assert (=> b!413284 (= e!247105 (= call!28597 (+!1182 call!28596 (tuple2!6949 k0!794 v!412))))))

(declare-fun mapNonEmpty!17571 () Bool)

(declare-fun tp!33971 () Bool)

(assert (=> mapNonEmpty!17571 (= mapRes!17571 (and tp!33971 e!247109))))

(declare-fun mapRest!17571 () (Array (_ BitVec 32) ValueCell!4973))

(declare-fun mapKey!17571 () (_ BitVec 32))

(declare-fun mapValue!17571 () ValueCell!4973)

(assert (=> mapNonEmpty!17571 (= (arr!12007 _values!549) (store mapRest!17571 mapKey!17571 mapValue!17571))))

(declare-fun b!413285 () Bool)

(declare-fun res!240192 () Bool)

(assert (=> b!413285 (=> (not res!240192) (not e!247110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413285 (= res!240192 (validKeyInArray!0 k0!794))))

(declare-fun b!413286 () Bool)

(declare-fun res!240201 () Bool)

(assert (=> b!413286 (=> (not res!240201) (not e!247110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413286 (= res!240201 (validMask!0 mask!1025))))

(declare-fun b!413287 () Bool)

(assert (=> b!413287 (= e!247107 (not true))))

(assert (=> b!413287 e!247105))

(assert (=> b!413287 (= c!54864 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12204 0))(
  ( (Unit!12205) )
))
(declare-fun lt!189520 () Unit!12204)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!365 (array!25117 array!25115 (_ BitVec 32) (_ BitVec 32) V!15283 V!15283 (_ BitVec 32) (_ BitVec 64) V!15283 (_ BitVec 32) Int) Unit!12204)

(assert (=> b!413287 (= lt!189520 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!365 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28594 () Bool)

(assert (=> bm!28594 (= call!28597 (getCurrentListMapNoExtraKeys!1154 (ite c!54864 lt!189524 _keys!709) (ite c!54864 lt!189523 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39200 res!240199) b!413286))

(assert (= (and b!413286 res!240201) b!413280))

(assert (= (and b!413280 res!240191) b!413278))

(assert (= (and b!413278 res!240189) b!413275))

(assert (= (and b!413275 res!240194) b!413276))

(assert (= (and b!413276 res!240198) b!413285))

(assert (= (and b!413285 res!240192) b!413283))

(assert (= (and b!413283 res!240196) b!413279))

(assert (= (and b!413279 res!240197) b!413281))

(assert (= (and b!413281 res!240190) b!413272))

(assert (= (and b!413272 res!240195) b!413273))

(assert (= (and b!413273 res!240200) b!413270))

(assert (= (and b!413270 res!240193) b!413287))

(assert (= (and b!413287 c!54864) b!413284))

(assert (= (and b!413287 (not c!54864)) b!413282))

(assert (= (or b!413284 b!413282) bm!28594))

(assert (= (or b!413284 b!413282) bm!28593))

(assert (= (and b!413277 condMapEmpty!17571) mapIsEmpty!17571))

(assert (= (and b!413277 (not condMapEmpty!17571)) mapNonEmpty!17571))

(get-info :version)

(assert (= (and mapNonEmpty!17571 ((_ is ValueCellFull!4973) mapValue!17571)) b!413274))

(assert (= (and b!413277 ((_ is ValueCellFull!4973) mapDefault!17571)) b!413271))

(assert (= start!39200 b!413277))

(declare-fun m!402285 () Bool)

(assert (=> b!413281 m!402285))

(declare-fun m!402287 () Bool)

(assert (=> b!413281 m!402287))

(declare-fun m!402289 () Bool)

(assert (=> b!413285 m!402289))

(declare-fun m!402291 () Bool)

(assert (=> b!413279 m!402291))

(declare-fun m!402293 () Bool)

(assert (=> b!413275 m!402293))

(declare-fun m!402295 () Bool)

(assert (=> b!413278 m!402295))

(declare-fun m!402297 () Bool)

(assert (=> mapNonEmpty!17571 m!402297))

(declare-fun m!402299 () Bool)

(assert (=> b!413286 m!402299))

(declare-fun m!402301 () Bool)

(assert (=> bm!28594 m!402301))

(declare-fun m!402303 () Bool)

(assert (=> b!413283 m!402303))

(declare-fun m!402305 () Bool)

(assert (=> b!413270 m!402305))

(declare-fun m!402307 () Bool)

(assert (=> b!413270 m!402307))

(declare-fun m!402309 () Bool)

(assert (=> b!413270 m!402309))

(declare-fun m!402311 () Bool)

(assert (=> bm!28593 m!402311))

(declare-fun m!402313 () Bool)

(assert (=> b!413287 m!402313))

(declare-fun m!402315 () Bool)

(assert (=> b!413272 m!402315))

(declare-fun m!402317 () Bool)

(assert (=> start!39200 m!402317))

(declare-fun m!402319 () Bool)

(assert (=> start!39200 m!402319))

(declare-fun m!402321 () Bool)

(assert (=> b!413284 m!402321))

(check-sat (not b!413279) tp_is_empty!10633 (not start!39200) (not b!413272) (not b!413275) b_and!16841 (not b!413278) (not b!413285) (not b!413286) (not bm!28593) (not b!413287) (not mapNonEmpty!17571) (not bm!28594) (not b!413270) (not b_next!9481) (not b!413284) (not b!413281))
(check-sat b_and!16841 (not b_next!9481))
