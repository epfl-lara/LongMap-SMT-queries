; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39932 () Bool)

(assert start!39932)

(declare-fun b_free!10213 () Bool)

(declare-fun b_next!10213 () Bool)

(assert (=> start!39932 (= b_free!10213 (not b_next!10213))))

(declare-fun tp!36167 () Bool)

(declare-fun b_and!18059 () Bool)

(assert (=> start!39932 (= tp!36167 b_and!18059)))

(declare-fun b!433533 () Bool)

(declare-fun e!256283 () Bool)

(declare-fun e!256279 () Bool)

(assert (=> b!433533 (= e!256283 e!256279)))

(declare-fun res!255233 () Bool)

(assert (=> b!433533 (=> (not res!255233) (not e!256279))))

(declare-datatypes ((array!26555 0))(
  ( (array!26556 (arr!12727 (Array (_ BitVec 32) (_ BitVec 64))) (size!13080 (_ BitVec 32))) )
))
(declare-fun lt!199064 () array!26555)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26555 (_ BitVec 32)) Bool)

(assert (=> b!433533 (= res!255233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199064 mask!1025))))

(declare-fun _keys!709 () array!26555)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433533 (= lt!199064 (array!26556 (store (arr!12727 _keys!709) i!563 k0!794) (size!13080 _keys!709)))))

(declare-fun b!433534 () Bool)

(declare-fun res!255243 () Bool)

(assert (=> b!433534 (=> (not res!255243) (not e!256283))))

(declare-datatypes ((List!7569 0))(
  ( (Nil!7566) (Cons!7565 (h!8421 (_ BitVec 64)) (t!13222 List!7569)) )
))
(declare-fun arrayNoDuplicates!0 (array!26555 (_ BitVec 32) List!7569) Bool)

(assert (=> b!433534 (= res!255243 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7566))))

(declare-fun b!433535 () Bool)

(declare-fun e!256278 () Bool)

(assert (=> b!433535 (= e!256279 e!256278)))

(declare-fun res!255239 () Bool)

(assert (=> b!433535 (=> (not res!255239) (not e!256278))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433535 (= res!255239 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16259 0))(
  ( (V!16260 (val!5727 Int)) )
))
(declare-fun minValue!515 () V!16259)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5339 0))(
  ( (ValueCellFull!5339 (v!7968 V!16259)) (EmptyCell!5339) )
))
(declare-datatypes ((array!26557 0))(
  ( (array!26558 (arr!12728 (Array (_ BitVec 32) ValueCell!5339)) (size!13081 (_ BitVec 32))) )
))
(declare-fun lt!199075 () array!26557)

(declare-fun zeroValue!515 () V!16259)

(declare-datatypes ((tuple2!7578 0))(
  ( (tuple2!7579 (_1!3800 (_ BitVec 64)) (_2!3800 V!16259)) )
))
(declare-datatypes ((List!7570 0))(
  ( (Nil!7567) (Cons!7566 (h!8422 tuple2!7578) (t!13223 List!7570)) )
))
(declare-datatypes ((ListLongMap!6481 0))(
  ( (ListLongMap!6482 (toList!3256 List!7570)) )
))
(declare-fun lt!199062 () ListLongMap!6481)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1459 (array!26555 array!26557 (_ BitVec 32) (_ BitVec 32) V!16259 V!16259 (_ BitVec 32) Int) ListLongMap!6481)

(assert (=> b!433535 (= lt!199062 (getCurrentListMapNoExtraKeys!1459 lt!199064 lt!199075 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26557)

(declare-fun v!412 () V!16259)

(assert (=> b!433535 (= lt!199075 (array!26558 (store (arr!12728 _values!549) i!563 (ValueCellFull!5339 v!412)) (size!13081 _values!549)))))

(declare-fun lt!199069 () ListLongMap!6481)

(assert (=> b!433535 (= lt!199069 (getCurrentListMapNoExtraKeys!1459 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433537 () Bool)

(declare-fun res!255242 () Bool)

(assert (=> b!433537 (=> (not res!255242) (not e!256283))))

(assert (=> b!433537 (= res!255242 (or (= (select (arr!12727 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12727 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18669 () Bool)

(declare-fun mapRes!18669 () Bool)

(assert (=> mapIsEmpty!18669 mapRes!18669))

(declare-fun mapNonEmpty!18669 () Bool)

(declare-fun tp!36168 () Bool)

(declare-fun e!256284 () Bool)

(assert (=> mapNonEmpty!18669 (= mapRes!18669 (and tp!36168 e!256284))))

(declare-fun mapKey!18669 () (_ BitVec 32))

(declare-fun mapRest!18669 () (Array (_ BitVec 32) ValueCell!5339))

(declare-fun mapValue!18669 () ValueCell!5339)

(assert (=> mapNonEmpty!18669 (= (arr!12728 _values!549) (store mapRest!18669 mapKey!18669 mapValue!18669))))

(declare-fun b!433538 () Bool)

(declare-fun res!255238 () Bool)

(assert (=> b!433538 (=> (not res!255238) (not e!256283))))

(assert (=> b!433538 (= res!255238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433539 () Bool)

(declare-fun e!256287 () Bool)

(declare-fun e!256285 () Bool)

(assert (=> b!433539 (= e!256287 e!256285)))

(declare-fun res!255240 () Bool)

(assert (=> b!433539 (=> res!255240 e!256285)))

(assert (=> b!433539 (= res!255240 (= k0!794 (select (arr!12727 _keys!709) from!863)))))

(assert (=> b!433539 (not (= (select (arr!12727 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12812 0))(
  ( (Unit!12813) )
))
(declare-fun lt!199063 () Unit!12812)

(declare-fun e!256282 () Unit!12812)

(assert (=> b!433539 (= lt!199063 e!256282)))

(declare-fun c!55584 () Bool)

(assert (=> b!433539 (= c!55584 (= (select (arr!12727 _keys!709) from!863) k0!794))))

(declare-fun lt!199074 () ListLongMap!6481)

(assert (=> b!433539 (= lt!199062 lt!199074)))

(declare-fun lt!199067 () ListLongMap!6481)

(declare-fun lt!199065 () tuple2!7578)

(declare-fun +!1431 (ListLongMap!6481 tuple2!7578) ListLongMap!6481)

(assert (=> b!433539 (= lt!199074 (+!1431 lt!199067 lt!199065))))

(declare-fun lt!199070 () V!16259)

(assert (=> b!433539 (= lt!199065 (tuple2!7579 (select (arr!12727 _keys!709) from!863) lt!199070))))

(declare-fun get!6335 (ValueCell!5339 V!16259) V!16259)

(declare-fun dynLambda!813 (Int (_ BitVec 64)) V!16259)

(assert (=> b!433539 (= lt!199070 (get!6335 (select (arr!12728 _values!549) from!863) (dynLambda!813 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433540 () Bool)

(declare-fun e!256286 () Bool)

(declare-fun e!256280 () Bool)

(assert (=> b!433540 (= e!256286 (and e!256280 mapRes!18669))))

(declare-fun condMapEmpty!18669 () Bool)

(declare-fun mapDefault!18669 () ValueCell!5339)

(assert (=> b!433540 (= condMapEmpty!18669 (= (arr!12728 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5339)) mapDefault!18669)))))

(declare-fun b!433541 () Bool)

(assert (=> b!433541 (= e!256278 (not e!256287))))

(declare-fun res!255234 () Bool)

(assert (=> b!433541 (=> res!255234 e!256287)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433541 (= res!255234 (not (validKeyInArray!0 (select (arr!12727 _keys!709) from!863))))))

(declare-fun lt!199066 () ListLongMap!6481)

(assert (=> b!433541 (= lt!199066 lt!199067)))

(declare-fun lt!199073 () ListLongMap!6481)

(declare-fun lt!199071 () tuple2!7578)

(assert (=> b!433541 (= lt!199067 (+!1431 lt!199073 lt!199071))))

(assert (=> b!433541 (= lt!199066 (getCurrentListMapNoExtraKeys!1459 lt!199064 lt!199075 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433541 (= lt!199071 (tuple2!7579 k0!794 v!412))))

(assert (=> b!433541 (= lt!199073 (getCurrentListMapNoExtraKeys!1459 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199076 () Unit!12812)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!581 (array!26555 array!26557 (_ BitVec 32) (_ BitVec 32) V!16259 V!16259 (_ BitVec 32) (_ BitVec 64) V!16259 (_ BitVec 32) Int) Unit!12812)

(assert (=> b!433541 (= lt!199076 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!581 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433542 () Bool)

(declare-fun res!255245 () Bool)

(assert (=> b!433542 (=> (not res!255245) (not e!256283))))

(assert (=> b!433542 (= res!255245 (validKeyInArray!0 k0!794))))

(declare-fun b!433543 () Bool)

(declare-fun res!255236 () Bool)

(assert (=> b!433543 (=> (not res!255236) (not e!256283))))

(declare-fun arrayContainsKey!0 (array!26555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433543 (= res!255236 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!433544 () Bool)

(declare-fun Unit!12814 () Unit!12812)

(assert (=> b!433544 (= e!256282 Unit!12814)))

(declare-fun b!433545 () Bool)

(declare-fun res!255235 () Bool)

(assert (=> b!433545 (=> (not res!255235) (not e!256283))))

(assert (=> b!433545 (= res!255235 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13080 _keys!709))))))

(declare-fun res!255237 () Bool)

(assert (=> start!39932 (=> (not res!255237) (not e!256283))))

(assert (=> start!39932 (= res!255237 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13080 _keys!709))))))

(assert (=> start!39932 e!256283))

(declare-fun tp_is_empty!11365 () Bool)

(assert (=> start!39932 tp_is_empty!11365))

(assert (=> start!39932 tp!36167))

(assert (=> start!39932 true))

(declare-fun array_inv!9290 (array!26557) Bool)

(assert (=> start!39932 (and (array_inv!9290 _values!549) e!256286)))

(declare-fun array_inv!9291 (array!26555) Bool)

(assert (=> start!39932 (array_inv!9291 _keys!709)))

(declare-fun b!433536 () Bool)

(declare-fun res!255241 () Bool)

(assert (=> b!433536 (=> (not res!255241) (not e!256279))))

(assert (=> b!433536 (= res!255241 (arrayNoDuplicates!0 lt!199064 #b00000000000000000000000000000000 Nil!7566))))

(declare-fun b!433546 () Bool)

(declare-fun Unit!12815 () Unit!12812)

(assert (=> b!433546 (= e!256282 Unit!12815)))

(declare-fun lt!199068 () Unit!12812)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26555 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12812)

(assert (=> b!433546 (= lt!199068 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433546 false))

(declare-fun b!433547 () Bool)

(declare-fun res!255244 () Bool)

(assert (=> b!433547 (=> (not res!255244) (not e!256283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433547 (= res!255244 (validMask!0 mask!1025))))

(declare-fun b!433548 () Bool)

(assert (=> b!433548 (= e!256280 tp_is_empty!11365)))

(declare-fun b!433549 () Bool)

(declare-fun res!255246 () Bool)

(assert (=> b!433549 (=> (not res!255246) (not e!256283))))

(assert (=> b!433549 (= res!255246 (and (= (size!13081 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13080 _keys!709) (size!13081 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433550 () Bool)

(assert (=> b!433550 (= e!256284 tp_is_empty!11365)))

(declare-fun b!433551 () Bool)

(assert (=> b!433551 (= e!256285 true)))

(assert (=> b!433551 (= lt!199074 (+!1431 (+!1431 lt!199073 lt!199065) lt!199071))))

(declare-fun lt!199072 () Unit!12812)

(declare-fun addCommutativeForDiffKeys!387 (ListLongMap!6481 (_ BitVec 64) V!16259 (_ BitVec 64) V!16259) Unit!12812)

(assert (=> b!433551 (= lt!199072 (addCommutativeForDiffKeys!387 lt!199073 k0!794 v!412 (select (arr!12727 _keys!709) from!863) lt!199070))))

(declare-fun b!433552 () Bool)

(declare-fun res!255232 () Bool)

(assert (=> b!433552 (=> (not res!255232) (not e!256279))))

(assert (=> b!433552 (= res!255232 (bvsle from!863 i!563))))

(assert (= (and start!39932 res!255237) b!433547))

(assert (= (and b!433547 res!255244) b!433549))

(assert (= (and b!433549 res!255246) b!433538))

(assert (= (and b!433538 res!255238) b!433534))

(assert (= (and b!433534 res!255243) b!433545))

(assert (= (and b!433545 res!255235) b!433542))

(assert (= (and b!433542 res!255245) b!433537))

(assert (= (and b!433537 res!255242) b!433543))

(assert (= (and b!433543 res!255236) b!433533))

(assert (= (and b!433533 res!255233) b!433536))

(assert (= (and b!433536 res!255241) b!433552))

(assert (= (and b!433552 res!255232) b!433535))

(assert (= (and b!433535 res!255239) b!433541))

(assert (= (and b!433541 (not res!255234)) b!433539))

(assert (= (and b!433539 c!55584) b!433546))

(assert (= (and b!433539 (not c!55584)) b!433544))

(assert (= (and b!433539 (not res!255240)) b!433551))

(assert (= (and b!433540 condMapEmpty!18669) mapIsEmpty!18669))

(assert (= (and b!433540 (not condMapEmpty!18669)) mapNonEmpty!18669))

(get-info :version)

(assert (= (and mapNonEmpty!18669 ((_ is ValueCellFull!5339) mapValue!18669)) b!433550))

(assert (= (and b!433540 ((_ is ValueCellFull!5339) mapDefault!18669)) b!433548))

(assert (= start!39932 b!433540))

(declare-fun b_lambda!9283 () Bool)

(assert (=> (not b_lambda!9283) (not b!433539)))

(declare-fun t!13221 () Bool)

(declare-fun tb!3611 () Bool)

(assert (=> (and start!39932 (= defaultEntry!557 defaultEntry!557) t!13221) tb!3611))

(declare-fun result!6757 () Bool)

(assert (=> tb!3611 (= result!6757 tp_is_empty!11365)))

(assert (=> b!433539 t!13221))

(declare-fun b_and!18061 () Bool)

(assert (= b_and!18059 (and (=> t!13221 result!6757) b_and!18061)))

(declare-fun m!421065 () Bool)

(assert (=> b!433535 m!421065))

(declare-fun m!421067 () Bool)

(assert (=> b!433535 m!421067))

(declare-fun m!421069 () Bool)

(assert (=> b!433535 m!421069))

(declare-fun m!421071 () Bool)

(assert (=> b!433543 m!421071))

(declare-fun m!421073 () Bool)

(assert (=> mapNonEmpty!18669 m!421073))

(declare-fun m!421075 () Bool)

(assert (=> b!433546 m!421075))

(declare-fun m!421077 () Bool)

(assert (=> b!433551 m!421077))

(assert (=> b!433551 m!421077))

(declare-fun m!421079 () Bool)

(assert (=> b!433551 m!421079))

(declare-fun m!421081 () Bool)

(assert (=> b!433551 m!421081))

(assert (=> b!433551 m!421081))

(declare-fun m!421083 () Bool)

(assert (=> b!433551 m!421083))

(declare-fun m!421085 () Bool)

(assert (=> start!39932 m!421085))

(declare-fun m!421087 () Bool)

(assert (=> start!39932 m!421087))

(declare-fun m!421089 () Bool)

(assert (=> b!433536 m!421089))

(assert (=> b!433539 m!421081))

(declare-fun m!421091 () Bool)

(assert (=> b!433539 m!421091))

(declare-fun m!421093 () Bool)

(assert (=> b!433539 m!421093))

(declare-fun m!421095 () Bool)

(assert (=> b!433539 m!421095))

(assert (=> b!433539 m!421095))

(assert (=> b!433539 m!421091))

(declare-fun m!421097 () Bool)

(assert (=> b!433539 m!421097))

(declare-fun m!421099 () Bool)

(assert (=> b!433547 m!421099))

(declare-fun m!421101 () Bool)

(assert (=> b!433533 m!421101))

(declare-fun m!421103 () Bool)

(assert (=> b!433533 m!421103))

(assert (=> b!433541 m!421081))

(declare-fun m!421105 () Bool)

(assert (=> b!433541 m!421105))

(declare-fun m!421107 () Bool)

(assert (=> b!433541 m!421107))

(declare-fun m!421109 () Bool)

(assert (=> b!433541 m!421109))

(assert (=> b!433541 m!421081))

(declare-fun m!421111 () Bool)

(assert (=> b!433541 m!421111))

(declare-fun m!421113 () Bool)

(assert (=> b!433541 m!421113))

(declare-fun m!421115 () Bool)

(assert (=> b!433542 m!421115))

(declare-fun m!421117 () Bool)

(assert (=> b!433534 m!421117))

(declare-fun m!421119 () Bool)

(assert (=> b!433538 m!421119))

(declare-fun m!421121 () Bool)

(assert (=> b!433537 m!421121))

(check-sat (not b!433541) (not b_next!10213) (not b!433534) (not b!433533) b_and!18061 (not b!433539) (not mapNonEmpty!18669) (not b!433543) tp_is_empty!11365 (not b!433551) (not b!433542) (not b!433535) (not b!433536) (not b!433546) (not b!433547) (not b_lambda!9283) (not start!39932) (not b!433538))
(check-sat b_and!18061 (not b_next!10213))
