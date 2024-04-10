; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39792 () Bool)

(assert start!39792)

(declare-fun b_free!10059 () Bool)

(declare-fun b_next!10059 () Bool)

(assert (=> start!39792 (= b_free!10059 (not b_next!10059))))

(declare-fun tp!35705 () Bool)

(declare-fun b_and!17777 () Bool)

(assert (=> start!39792 (= tp!35705 b_and!17777)))

(declare-fun b!429079 () Bool)

(declare-fun res!251950 () Bool)

(declare-fun e!254197 () Bool)

(assert (=> b!429079 (=> (not res!251950) (not e!254197))))

(declare-datatypes ((array!26259 0))(
  ( (array!26260 (arr!12579 (Array (_ BitVec 32) (_ BitVec 64))) (size!12931 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26259)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26259 (_ BitVec 32)) Bool)

(assert (=> b!429079 (= res!251950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429080 () Bool)

(declare-fun res!251952 () Bool)

(assert (=> b!429080 (=> (not res!251952) (not e!254197))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429080 (= res!251952 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18438 () Bool)

(declare-fun mapRes!18438 () Bool)

(assert (=> mapIsEmpty!18438 mapRes!18438))

(declare-fun mapNonEmpty!18438 () Bool)

(declare-fun tp!35706 () Bool)

(declare-fun e!254192 () Bool)

(assert (=> mapNonEmpty!18438 (= mapRes!18438 (and tp!35706 e!254192))))

(declare-datatypes ((V!16053 0))(
  ( (V!16054 (val!5650 Int)) )
))
(declare-datatypes ((ValueCell!5262 0))(
  ( (ValueCellFull!5262 (v!7897 V!16053)) (EmptyCell!5262) )
))
(declare-datatypes ((array!26261 0))(
  ( (array!26262 (arr!12580 (Array (_ BitVec 32) ValueCell!5262)) (size!12932 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26261)

(declare-fun mapValue!18438 () ValueCell!5262)

(declare-fun mapKey!18438 () (_ BitVec 32))

(declare-fun mapRest!18438 () (Array (_ BitVec 32) ValueCell!5262))

(assert (=> mapNonEmpty!18438 (= (arr!12580 _values!549) (store mapRest!18438 mapKey!18438 mapValue!18438))))

(declare-fun b!429081 () Bool)

(declare-fun res!251945 () Bool)

(assert (=> b!429081 (=> (not res!251945) (not e!254197))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429081 (= res!251945 (or (= (select (arr!12579 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12579 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429082 () Bool)

(declare-fun res!251957 () Bool)

(assert (=> b!429082 (=> (not res!251957) (not e!254197))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!429082 (= res!251957 (and (= (size!12932 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12931 _keys!709) (size!12932 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429083 () Bool)

(declare-fun res!251951 () Bool)

(assert (=> b!429083 (=> (not res!251951) (not e!254197))))

(assert (=> b!429083 (= res!251951 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12931 _keys!709))))))

(declare-fun b!429084 () Bool)

(declare-fun e!254199 () Bool)

(assert (=> b!429084 (= e!254199 true)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!429084 (not (= (select (arr!12579 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12605 0))(
  ( (Unit!12606) )
))
(declare-fun lt!196081 () Unit!12605)

(declare-fun e!254191 () Unit!12605)

(assert (=> b!429084 (= lt!196081 e!254191)))

(declare-fun c!55424 () Bool)

(assert (=> b!429084 (= c!55424 (= (select (arr!12579 _keys!709) from!863) k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7442 0))(
  ( (tuple2!7443 (_1!3732 (_ BitVec 64)) (_2!3732 V!16053)) )
))
(declare-datatypes ((List!7456 0))(
  ( (Nil!7453) (Cons!7452 (h!8308 tuple2!7442) (t!12964 List!7456)) )
))
(declare-datatypes ((ListLongMap!6355 0))(
  ( (ListLongMap!6356 (toList!3193 List!7456)) )
))
(declare-fun lt!196079 () ListLongMap!6355)

(declare-fun lt!196078 () ListLongMap!6355)

(declare-fun +!1343 (ListLongMap!6355 tuple2!7442) ListLongMap!6355)

(declare-fun get!6237 (ValueCell!5262 V!16053) V!16053)

(declare-fun dynLambda!770 (Int (_ BitVec 64)) V!16053)

(assert (=> b!429084 (= lt!196079 (+!1343 lt!196078 (tuple2!7443 (select (arr!12579 _keys!709) from!863) (get!6237 (select (arr!12580 _values!549) from!863) (dynLambda!770 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429085 () Bool)

(declare-fun res!251949 () Bool)

(assert (=> b!429085 (=> (not res!251949) (not e!254197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429085 (= res!251949 (validMask!0 mask!1025))))

(declare-fun b!429086 () Bool)

(declare-fun Unit!12607 () Unit!12605)

(assert (=> b!429086 (= e!254191 Unit!12607)))

(declare-fun lt!196084 () Unit!12605)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26259 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12605)

(assert (=> b!429086 (= lt!196084 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429086 false))

(declare-fun b!429087 () Bool)

(declare-fun e!254198 () Bool)

(assert (=> b!429087 (= e!254197 e!254198)))

(declare-fun res!251948 () Bool)

(assert (=> b!429087 (=> (not res!251948) (not e!254198))))

(declare-fun lt!196085 () array!26259)

(assert (=> b!429087 (= res!251948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196085 mask!1025))))

(assert (=> b!429087 (= lt!196085 (array!26260 (store (arr!12579 _keys!709) i!563 k0!794) (size!12931 _keys!709)))))

(declare-fun b!429088 () Bool)

(declare-fun res!251947 () Bool)

(assert (=> b!429088 (=> (not res!251947) (not e!254197))))

(declare-datatypes ((List!7457 0))(
  ( (Nil!7454) (Cons!7453 (h!8309 (_ BitVec 64)) (t!12965 List!7457)) )
))
(declare-fun arrayNoDuplicates!0 (array!26259 (_ BitVec 32) List!7457) Bool)

(assert (=> b!429088 (= res!251947 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7454))))

(declare-fun b!429089 () Bool)

(declare-fun e!254193 () Bool)

(assert (=> b!429089 (= e!254198 e!254193)))

(declare-fun res!251956 () Bool)

(assert (=> b!429089 (=> (not res!251956) (not e!254193))))

(assert (=> b!429089 (= res!251956 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16053)

(declare-fun zeroValue!515 () V!16053)

(declare-fun lt!196076 () array!26261)

(declare-fun getCurrentListMapNoExtraKeys!1395 (array!26259 array!26261 (_ BitVec 32) (_ BitVec 32) V!16053 V!16053 (_ BitVec 32) Int) ListLongMap!6355)

(assert (=> b!429089 (= lt!196079 (getCurrentListMapNoExtraKeys!1395 lt!196085 lt!196076 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16053)

(assert (=> b!429089 (= lt!196076 (array!26262 (store (arr!12580 _values!549) i!563 (ValueCellFull!5262 v!412)) (size!12932 _values!549)))))

(declare-fun lt!196083 () ListLongMap!6355)

(assert (=> b!429089 (= lt!196083 (getCurrentListMapNoExtraKeys!1395 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429090 () Bool)

(declare-fun res!251954 () Bool)

(assert (=> b!429090 (=> (not res!251954) (not e!254197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429090 (= res!251954 (validKeyInArray!0 k0!794))))

(declare-fun b!429091 () Bool)

(declare-fun e!254195 () Bool)

(declare-fun tp_is_empty!11211 () Bool)

(assert (=> b!429091 (= e!254195 tp_is_empty!11211)))

(declare-fun b!429092 () Bool)

(assert (=> b!429092 (= e!254192 tp_is_empty!11211)))

(declare-fun res!251955 () Bool)

(assert (=> start!39792 (=> (not res!251955) (not e!254197))))

(assert (=> start!39792 (= res!251955 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12931 _keys!709))))))

(assert (=> start!39792 e!254197))

(assert (=> start!39792 tp_is_empty!11211))

(assert (=> start!39792 tp!35705))

(assert (=> start!39792 true))

(declare-fun e!254196 () Bool)

(declare-fun array_inv!9168 (array!26261) Bool)

(assert (=> start!39792 (and (array_inv!9168 _values!549) e!254196)))

(declare-fun array_inv!9169 (array!26259) Bool)

(assert (=> start!39792 (array_inv!9169 _keys!709)))

(declare-fun b!429093 () Bool)

(assert (=> b!429093 (= e!254196 (and e!254195 mapRes!18438))))

(declare-fun condMapEmpty!18438 () Bool)

(declare-fun mapDefault!18438 () ValueCell!5262)

(assert (=> b!429093 (= condMapEmpty!18438 (= (arr!12580 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5262)) mapDefault!18438)))))

(declare-fun b!429094 () Bool)

(assert (=> b!429094 (= e!254193 (not e!254199))))

(declare-fun res!251946 () Bool)

(assert (=> b!429094 (=> res!251946 e!254199)))

(assert (=> b!429094 (= res!251946 (not (validKeyInArray!0 (select (arr!12579 _keys!709) from!863))))))

(declare-fun lt!196077 () ListLongMap!6355)

(assert (=> b!429094 (= lt!196077 lt!196078)))

(declare-fun lt!196082 () ListLongMap!6355)

(assert (=> b!429094 (= lt!196078 (+!1343 lt!196082 (tuple2!7443 k0!794 v!412)))))

(assert (=> b!429094 (= lt!196077 (getCurrentListMapNoExtraKeys!1395 lt!196085 lt!196076 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!429094 (= lt!196082 (getCurrentListMapNoExtraKeys!1395 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196080 () Unit!12605)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!532 (array!26259 array!26261 (_ BitVec 32) (_ BitVec 32) V!16053 V!16053 (_ BitVec 32) (_ BitVec 64) V!16053 (_ BitVec 32) Int) Unit!12605)

(assert (=> b!429094 (= lt!196080 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!532 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429095 () Bool)

(declare-fun res!251958 () Bool)

(assert (=> b!429095 (=> (not res!251958) (not e!254198))))

(assert (=> b!429095 (= res!251958 (bvsle from!863 i!563))))

(declare-fun b!429096 () Bool)

(declare-fun res!251953 () Bool)

(assert (=> b!429096 (=> (not res!251953) (not e!254198))))

(assert (=> b!429096 (= res!251953 (arrayNoDuplicates!0 lt!196085 #b00000000000000000000000000000000 Nil!7454))))

(declare-fun b!429097 () Bool)

(declare-fun Unit!12608 () Unit!12605)

(assert (=> b!429097 (= e!254191 Unit!12608)))

(assert (= (and start!39792 res!251955) b!429085))

(assert (= (and b!429085 res!251949) b!429082))

(assert (= (and b!429082 res!251957) b!429079))

(assert (= (and b!429079 res!251950) b!429088))

(assert (= (and b!429088 res!251947) b!429083))

(assert (= (and b!429083 res!251951) b!429090))

(assert (= (and b!429090 res!251954) b!429081))

(assert (= (and b!429081 res!251945) b!429080))

(assert (= (and b!429080 res!251952) b!429087))

(assert (= (and b!429087 res!251948) b!429096))

(assert (= (and b!429096 res!251953) b!429095))

(assert (= (and b!429095 res!251958) b!429089))

(assert (= (and b!429089 res!251956) b!429094))

(assert (= (and b!429094 (not res!251946)) b!429084))

(assert (= (and b!429084 c!55424) b!429086))

(assert (= (and b!429084 (not c!55424)) b!429097))

(assert (= (and b!429093 condMapEmpty!18438) mapIsEmpty!18438))

(assert (= (and b!429093 (not condMapEmpty!18438)) mapNonEmpty!18438))

(get-info :version)

(assert (= (and mapNonEmpty!18438 ((_ is ValueCellFull!5262) mapValue!18438)) b!429092))

(assert (= (and b!429093 ((_ is ValueCellFull!5262) mapDefault!18438)) b!429091))

(assert (= start!39792 b!429093))

(declare-fun b_lambda!9147 () Bool)

(assert (=> (not b_lambda!9147) (not b!429084)))

(declare-fun t!12963 () Bool)

(declare-fun tb!3465 () Bool)

(assert (=> (and start!39792 (= defaultEntry!557 defaultEntry!557) t!12963) tb!3465))

(declare-fun result!6457 () Bool)

(assert (=> tb!3465 (= result!6457 tp_is_empty!11211)))

(assert (=> b!429084 t!12963))

(declare-fun b_and!17779 () Bool)

(assert (= b_and!17777 (and (=> t!12963 result!6457) b_and!17779)))

(declare-fun m!417433 () Bool)

(assert (=> b!429081 m!417433))

(declare-fun m!417435 () Bool)

(assert (=> start!39792 m!417435))

(declare-fun m!417437 () Bool)

(assert (=> start!39792 m!417437))

(declare-fun m!417439 () Bool)

(assert (=> b!429087 m!417439))

(declare-fun m!417441 () Bool)

(assert (=> b!429087 m!417441))

(declare-fun m!417443 () Bool)

(assert (=> b!429090 m!417443))

(declare-fun m!417445 () Bool)

(assert (=> b!429080 m!417445))

(declare-fun m!417447 () Bool)

(assert (=> b!429084 m!417447))

(declare-fun m!417449 () Bool)

(assert (=> b!429084 m!417449))

(declare-fun m!417451 () Bool)

(assert (=> b!429084 m!417451))

(declare-fun m!417453 () Bool)

(assert (=> b!429084 m!417453))

(assert (=> b!429084 m!417453))

(assert (=> b!429084 m!417449))

(declare-fun m!417455 () Bool)

(assert (=> b!429084 m!417455))

(declare-fun m!417457 () Bool)

(assert (=> b!429089 m!417457))

(declare-fun m!417459 () Bool)

(assert (=> b!429089 m!417459))

(declare-fun m!417461 () Bool)

(assert (=> b!429089 m!417461))

(declare-fun m!417463 () Bool)

(assert (=> b!429088 m!417463))

(declare-fun m!417465 () Bool)

(assert (=> b!429096 m!417465))

(declare-fun m!417467 () Bool)

(assert (=> mapNonEmpty!18438 m!417467))

(declare-fun m!417469 () Bool)

(assert (=> b!429079 m!417469))

(declare-fun m!417471 () Bool)

(assert (=> b!429086 m!417471))

(declare-fun m!417473 () Bool)

(assert (=> b!429085 m!417473))

(assert (=> b!429094 m!417447))

(declare-fun m!417475 () Bool)

(assert (=> b!429094 m!417475))

(declare-fun m!417477 () Bool)

(assert (=> b!429094 m!417477))

(declare-fun m!417479 () Bool)

(assert (=> b!429094 m!417479))

(assert (=> b!429094 m!417447))

(declare-fun m!417481 () Bool)

(assert (=> b!429094 m!417481))

(declare-fun m!417483 () Bool)

(assert (=> b!429094 m!417483))

(check-sat tp_is_empty!11211 (not start!39792) (not mapNonEmpty!18438) b_and!17779 (not b!429084) (not b_next!10059) (not b!429096) (not b!429079) (not b!429080) (not b!429085) (not b!429087) (not b!429086) (not b!429094) (not b!429088) (not b!429090) (not b!429089) (not b_lambda!9147))
(check-sat b_and!17779 (not b_next!10059))
