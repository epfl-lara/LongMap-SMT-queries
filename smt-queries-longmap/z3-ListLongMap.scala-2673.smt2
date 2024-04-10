; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39858 () Bool)

(assert start!39858)

(declare-fun b_free!10125 () Bool)

(declare-fun b_next!10125 () Bool)

(assert (=> start!39858 (= b_free!10125 (not b_next!10125))))

(declare-fun tp!35904 () Bool)

(declare-fun b_and!17909 () Bool)

(assert (=> start!39858 (= tp!35904 b_and!17909)))

(declare-fun b!431076 () Bool)

(declare-fun res!253391 () Bool)

(declare-fun e!255132 () Bool)

(assert (=> b!431076 (=> (not res!253391) (not e!255132))))

(declare-datatypes ((array!26389 0))(
  ( (array!26390 (arr!12644 (Array (_ BitVec 32) (_ BitVec 64))) (size!12996 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26389)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26389 (_ BitVec 32)) Bool)

(assert (=> b!431076 (= res!253391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431077 () Bool)

(declare-fun e!255135 () Bool)

(declare-fun e!255141 () Bool)

(declare-fun mapRes!18537 () Bool)

(assert (=> b!431077 (= e!255135 (and e!255141 mapRes!18537))))

(declare-fun condMapEmpty!18537 () Bool)

(declare-datatypes ((V!16141 0))(
  ( (V!16142 (val!5683 Int)) )
))
(declare-datatypes ((ValueCell!5295 0))(
  ( (ValueCellFull!5295 (v!7930 V!16141)) (EmptyCell!5295) )
))
(declare-datatypes ((array!26391 0))(
  ( (array!26392 (arr!12645 (Array (_ BitVec 32) ValueCell!5295)) (size!12997 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26391)

(declare-fun mapDefault!18537 () ValueCell!5295)

(assert (=> b!431077 (= condMapEmpty!18537 (= (arr!12645 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5295)) mapDefault!18537)))))

(declare-fun b!431078 () Bool)

(declare-fun res!253383 () Bool)

(assert (=> b!431078 (=> (not res!253383) (not e!255132))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!431078 (= res!253383 (and (= (size!12997 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12996 _keys!709) (size!12997 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431079 () Bool)

(declare-fun e!255139 () Bool)

(declare-fun tp_is_empty!11277 () Bool)

(assert (=> b!431079 (= e!255139 tp_is_empty!11277)))

(declare-fun b!431080 () Bool)

(declare-datatypes ((Unit!12700 0))(
  ( (Unit!12701) )
))
(declare-fun e!255133 () Unit!12700)

(declare-fun Unit!12702 () Unit!12700)

(assert (=> b!431080 (= e!255133 Unit!12702)))

(declare-fun mapIsEmpty!18537 () Bool)

(assert (=> mapIsEmpty!18537 mapRes!18537))

(declare-fun b!431081 () Bool)

(declare-fun res!253388 () Bool)

(declare-fun e!255138 () Bool)

(assert (=> b!431081 (=> (not res!253388) (not e!255138))))

(declare-fun lt!197324 () array!26389)

(declare-datatypes ((List!7506 0))(
  ( (Nil!7503) (Cons!7502 (h!8358 (_ BitVec 64)) (t!13080 List!7506)) )
))
(declare-fun arrayNoDuplicates!0 (array!26389 (_ BitVec 32) List!7506) Bool)

(assert (=> b!431081 (= res!253388 (arrayNoDuplicates!0 lt!197324 #b00000000000000000000000000000000 Nil!7503))))

(declare-fun b!431082 () Bool)

(declare-fun res!253392 () Bool)

(assert (=> b!431082 (=> (not res!253392) (not e!255132))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431082 (= res!253392 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!431083 () Bool)

(assert (=> b!431083 (= e!255132 e!255138)))

(declare-fun res!253389 () Bool)

(assert (=> b!431083 (=> (not res!253389) (not e!255138))))

(assert (=> b!431083 (= res!253389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197324 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431083 (= lt!197324 (array!26390 (store (arr!12644 _keys!709) i!563 k0!794) (size!12996 _keys!709)))))

(declare-fun b!431084 () Bool)

(declare-fun e!255136 () Bool)

(declare-fun e!255140 () Bool)

(assert (=> b!431084 (= e!255136 (not e!255140))))

(declare-fun res!253394 () Bool)

(assert (=> b!431084 (=> res!253394 e!255140)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431084 (= res!253394 (not (validKeyInArray!0 (select (arr!12644 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7490 0))(
  ( (tuple2!7491 (_1!3756 (_ BitVec 64)) (_2!3756 V!16141)) )
))
(declare-datatypes ((List!7507 0))(
  ( (Nil!7504) (Cons!7503 (h!8359 tuple2!7490) (t!13081 List!7507)) )
))
(declare-datatypes ((ListLongMap!6403 0))(
  ( (ListLongMap!6404 (toList!3217 List!7507)) )
))
(declare-fun lt!197328 () ListLongMap!6403)

(declare-fun lt!197318 () ListLongMap!6403)

(assert (=> b!431084 (= lt!197328 lt!197318)))

(declare-fun lt!197319 () ListLongMap!6403)

(declare-fun lt!197323 () tuple2!7490)

(declare-fun +!1366 (ListLongMap!6403 tuple2!7490) ListLongMap!6403)

(assert (=> b!431084 (= lt!197318 (+!1366 lt!197319 lt!197323))))

(declare-fun minValue!515 () V!16141)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16141)

(declare-fun lt!197325 () array!26391)

(declare-fun getCurrentListMapNoExtraKeys!1418 (array!26389 array!26391 (_ BitVec 32) (_ BitVec 32) V!16141 V!16141 (_ BitVec 32) Int) ListLongMap!6403)

(assert (=> b!431084 (= lt!197328 (getCurrentListMapNoExtraKeys!1418 lt!197324 lt!197325 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16141)

(assert (=> b!431084 (= lt!197323 (tuple2!7491 k0!794 v!412))))

(assert (=> b!431084 (= lt!197319 (getCurrentListMapNoExtraKeys!1418 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197320 () Unit!12700)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!554 (array!26389 array!26391 (_ BitVec 32) (_ BitVec 32) V!16141 V!16141 (_ BitVec 32) (_ BitVec 64) V!16141 (_ BitVec 32) Int) Unit!12700)

(assert (=> b!431084 (= lt!197320 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!554 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431085 () Bool)

(declare-fun res!253382 () Bool)

(assert (=> b!431085 (=> (not res!253382) (not e!255132))))

(assert (=> b!431085 (= res!253382 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7503))))

(declare-fun b!431086 () Bool)

(declare-fun res!253393 () Bool)

(assert (=> b!431086 (=> (not res!253393) (not e!255132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431086 (= res!253393 (validMask!0 mask!1025))))

(declare-fun b!431087 () Bool)

(declare-fun res!253386 () Bool)

(assert (=> b!431087 (=> (not res!253386) (not e!255132))))

(assert (=> b!431087 (= res!253386 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12996 _keys!709))))))

(declare-fun b!431088 () Bool)

(declare-fun Unit!12703 () Unit!12700)

(assert (=> b!431088 (= e!255133 Unit!12703)))

(declare-fun lt!197316 () Unit!12700)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12700)

(assert (=> b!431088 (= lt!197316 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431088 false))

(declare-fun b!431089 () Bool)

(declare-fun e!255137 () Bool)

(assert (=> b!431089 (= e!255140 e!255137)))

(declare-fun res!253387 () Bool)

(assert (=> b!431089 (=> res!253387 e!255137)))

(assert (=> b!431089 (= res!253387 (= k0!794 (select (arr!12644 _keys!709) from!863)))))

(assert (=> b!431089 (not (= (select (arr!12644 _keys!709) from!863) k0!794))))

(declare-fun lt!197330 () Unit!12700)

(assert (=> b!431089 (= lt!197330 e!255133)))

(declare-fun c!55523 () Bool)

(assert (=> b!431089 (= c!55523 (= (select (arr!12644 _keys!709) from!863) k0!794))))

(declare-fun lt!197322 () ListLongMap!6403)

(declare-fun lt!197326 () ListLongMap!6403)

(assert (=> b!431089 (= lt!197322 lt!197326)))

(declare-fun lt!197321 () tuple2!7490)

(assert (=> b!431089 (= lt!197326 (+!1366 lt!197318 lt!197321))))

(declare-fun lt!197327 () V!16141)

(assert (=> b!431089 (= lt!197321 (tuple2!7491 (select (arr!12644 _keys!709) from!863) lt!197327))))

(declare-fun get!6278 (ValueCell!5295 V!16141) V!16141)

(declare-fun dynLambda!789 (Int (_ BitVec 64)) V!16141)

(assert (=> b!431089 (= lt!197327 (get!6278 (select (arr!12645 _values!549) from!863) (dynLambda!789 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431090 () Bool)

(assert (=> b!431090 (= e!255141 tp_is_empty!11277)))

(declare-fun b!431091 () Bool)

(declare-fun res!253390 () Bool)

(assert (=> b!431091 (=> (not res!253390) (not e!255138))))

(assert (=> b!431091 (= res!253390 (bvsle from!863 i!563))))

(declare-fun b!431092 () Bool)

(declare-fun res!253384 () Bool)

(assert (=> b!431092 (=> (not res!253384) (not e!255132))))

(assert (=> b!431092 (= res!253384 (or (= (select (arr!12644 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12644 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431093 () Bool)

(assert (=> b!431093 (= e!255137 true)))

(assert (=> b!431093 (= lt!197326 (+!1366 (+!1366 lt!197319 lt!197321) lt!197323))))

(declare-fun lt!197329 () Unit!12700)

(declare-fun addCommutativeForDiffKeys!360 (ListLongMap!6403 (_ BitVec 64) V!16141 (_ BitVec 64) V!16141) Unit!12700)

(assert (=> b!431093 (= lt!197329 (addCommutativeForDiffKeys!360 lt!197319 k0!794 v!412 (select (arr!12644 _keys!709) from!863) lt!197327))))

(declare-fun mapNonEmpty!18537 () Bool)

(declare-fun tp!35903 () Bool)

(assert (=> mapNonEmpty!18537 (= mapRes!18537 (and tp!35903 e!255139))))

(declare-fun mapKey!18537 () (_ BitVec 32))

(declare-fun mapValue!18537 () ValueCell!5295)

(declare-fun mapRest!18537 () (Array (_ BitVec 32) ValueCell!5295))

(assert (=> mapNonEmpty!18537 (= (arr!12645 _values!549) (store mapRest!18537 mapKey!18537 mapValue!18537))))

(declare-fun res!253395 () Bool)

(assert (=> start!39858 (=> (not res!253395) (not e!255132))))

(assert (=> start!39858 (= res!253395 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12996 _keys!709))))))

(assert (=> start!39858 e!255132))

(assert (=> start!39858 tp_is_empty!11277))

(assert (=> start!39858 tp!35904))

(assert (=> start!39858 true))

(declare-fun array_inv!9206 (array!26391) Bool)

(assert (=> start!39858 (and (array_inv!9206 _values!549) e!255135)))

(declare-fun array_inv!9207 (array!26389) Bool)

(assert (=> start!39858 (array_inv!9207 _keys!709)))

(declare-fun b!431094 () Bool)

(assert (=> b!431094 (= e!255138 e!255136)))

(declare-fun res!253381 () Bool)

(assert (=> b!431094 (=> (not res!253381) (not e!255136))))

(assert (=> b!431094 (= res!253381 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!431094 (= lt!197322 (getCurrentListMapNoExtraKeys!1418 lt!197324 lt!197325 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!431094 (= lt!197325 (array!26392 (store (arr!12645 _values!549) i!563 (ValueCellFull!5295 v!412)) (size!12997 _values!549)))))

(declare-fun lt!197317 () ListLongMap!6403)

(assert (=> b!431094 (= lt!197317 (getCurrentListMapNoExtraKeys!1418 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431095 () Bool)

(declare-fun res!253385 () Bool)

(assert (=> b!431095 (=> (not res!253385) (not e!255132))))

(assert (=> b!431095 (= res!253385 (validKeyInArray!0 k0!794))))

(assert (= (and start!39858 res!253395) b!431086))

(assert (= (and b!431086 res!253393) b!431078))

(assert (= (and b!431078 res!253383) b!431076))

(assert (= (and b!431076 res!253391) b!431085))

(assert (= (and b!431085 res!253382) b!431087))

(assert (= (and b!431087 res!253386) b!431095))

(assert (= (and b!431095 res!253385) b!431092))

(assert (= (and b!431092 res!253384) b!431082))

(assert (= (and b!431082 res!253392) b!431083))

(assert (= (and b!431083 res!253389) b!431081))

(assert (= (and b!431081 res!253388) b!431091))

(assert (= (and b!431091 res!253390) b!431094))

(assert (= (and b!431094 res!253381) b!431084))

(assert (= (and b!431084 (not res!253394)) b!431089))

(assert (= (and b!431089 c!55523) b!431088))

(assert (= (and b!431089 (not c!55523)) b!431080))

(assert (= (and b!431089 (not res!253387)) b!431093))

(assert (= (and b!431077 condMapEmpty!18537) mapIsEmpty!18537))

(assert (= (and b!431077 (not condMapEmpty!18537)) mapNonEmpty!18537))

(get-info :version)

(assert (= (and mapNonEmpty!18537 ((_ is ValueCellFull!5295) mapValue!18537)) b!431079))

(assert (= (and b!431077 ((_ is ValueCellFull!5295) mapDefault!18537)) b!431090))

(assert (= start!39858 b!431077))

(declare-fun b_lambda!9213 () Bool)

(assert (=> (not b_lambda!9213) (not b!431089)))

(declare-fun t!13079 () Bool)

(declare-fun tb!3531 () Bool)

(assert (=> (and start!39858 (= defaultEntry!557 defaultEntry!557) t!13079) tb!3531))

(declare-fun result!6589 () Bool)

(assert (=> tb!3531 (= result!6589 tp_is_empty!11277)))

(assert (=> b!431089 t!13079))

(declare-fun b_and!17911 () Bool)

(assert (= b_and!17909 (and (=> t!13079 result!6589) b_and!17911)))

(declare-fun m!419245 () Bool)

(assert (=> b!431094 m!419245))

(declare-fun m!419247 () Bool)

(assert (=> b!431094 m!419247))

(declare-fun m!419249 () Bool)

(assert (=> b!431094 m!419249))

(declare-fun m!419251 () Bool)

(assert (=> b!431093 m!419251))

(assert (=> b!431093 m!419251))

(declare-fun m!419253 () Bool)

(assert (=> b!431093 m!419253))

(declare-fun m!419255 () Bool)

(assert (=> b!431093 m!419255))

(assert (=> b!431093 m!419255))

(declare-fun m!419257 () Bool)

(assert (=> b!431093 m!419257))

(declare-fun m!419259 () Bool)

(assert (=> mapNonEmpty!18537 m!419259))

(declare-fun m!419261 () Bool)

(assert (=> b!431076 m!419261))

(assert (=> b!431084 m!419255))

(declare-fun m!419263 () Bool)

(assert (=> b!431084 m!419263))

(declare-fun m!419265 () Bool)

(assert (=> b!431084 m!419265))

(assert (=> b!431084 m!419255))

(declare-fun m!419267 () Bool)

(assert (=> b!431084 m!419267))

(declare-fun m!419269 () Bool)

(assert (=> b!431084 m!419269))

(declare-fun m!419271 () Bool)

(assert (=> b!431084 m!419271))

(declare-fun m!419273 () Bool)

(assert (=> b!431095 m!419273))

(declare-fun m!419275 () Bool)

(assert (=> b!431082 m!419275))

(declare-fun m!419277 () Bool)

(assert (=> b!431083 m!419277))

(declare-fun m!419279 () Bool)

(assert (=> b!431083 m!419279))

(assert (=> b!431089 m!419255))

(declare-fun m!419281 () Bool)

(assert (=> b!431089 m!419281))

(declare-fun m!419283 () Bool)

(assert (=> b!431089 m!419283))

(declare-fun m!419285 () Bool)

(assert (=> b!431089 m!419285))

(assert (=> b!431089 m!419285))

(assert (=> b!431089 m!419283))

(declare-fun m!419287 () Bool)

(assert (=> b!431089 m!419287))

(declare-fun m!419289 () Bool)

(assert (=> b!431092 m!419289))

(declare-fun m!419291 () Bool)

(assert (=> b!431086 m!419291))

(declare-fun m!419293 () Bool)

(assert (=> b!431088 m!419293))

(declare-fun m!419295 () Bool)

(assert (=> start!39858 m!419295))

(declare-fun m!419297 () Bool)

(assert (=> start!39858 m!419297))

(declare-fun m!419299 () Bool)

(assert (=> b!431081 m!419299))

(declare-fun m!419301 () Bool)

(assert (=> b!431085 m!419301))

(check-sat (not b!431084) (not b!431089) (not b!431086) (not b!431076) (not b_next!10125) tp_is_empty!11277 b_and!17911 (not b!431081) (not b!431082) (not b!431095) (not b!431093) (not b_lambda!9213) (not mapNonEmpty!18537) (not b!431085) (not b!431094) (not b!431088) (not b!431083) (not start!39858))
(check-sat b_and!17911 (not b_next!10125))
