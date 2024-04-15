; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39854 () Bool)

(assert start!39854)

(declare-fun b_free!10135 () Bool)

(declare-fun b_next!10135 () Bool)

(assert (=> start!39854 (= b_free!10135 (not b_next!10135))))

(declare-fun tp!35934 () Bool)

(declare-fun b_and!17903 () Bool)

(assert (=> start!39854 (= tp!35934 b_and!17903)))

(declare-fun b!431115 () Bool)

(declare-fun e!255109 () Bool)

(declare-fun tp_is_empty!11287 () Bool)

(assert (=> b!431115 (= e!255109 tp_is_empty!11287)))

(declare-fun b!431116 () Bool)

(declare-fun res!253483 () Bool)

(declare-fun e!255110 () Bool)

(assert (=> b!431116 (=> (not res!253483) (not e!255110))))

(declare-datatypes ((array!26401 0))(
  ( (array!26402 (arr!12650 (Array (_ BitVec 32) (_ BitVec 64))) (size!13003 (_ BitVec 32))) )
))
(declare-fun lt!197312 () array!26401)

(declare-datatypes ((List!7505 0))(
  ( (Nil!7502) (Cons!7501 (h!8357 (_ BitVec 64)) (t!13080 List!7505)) )
))
(declare-fun arrayNoDuplicates!0 (array!26401 (_ BitVec 32) List!7505) Bool)

(assert (=> b!431116 (= res!253483 (arrayNoDuplicates!0 lt!197312 #b00000000000000000000000000000000 Nil!7502))))

(declare-fun res!253477 () Bool)

(declare-fun e!255108 () Bool)

(assert (=> start!39854 (=> (not res!253477) (not e!255108))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!26401)

(assert (=> start!39854 (= res!253477 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13003 _keys!709))))))

(assert (=> start!39854 e!255108))

(assert (=> start!39854 tp_is_empty!11287))

(assert (=> start!39854 tp!35934))

(assert (=> start!39854 true))

(declare-datatypes ((V!16155 0))(
  ( (V!16156 (val!5688 Int)) )
))
(declare-datatypes ((ValueCell!5300 0))(
  ( (ValueCellFull!5300 (v!7929 V!16155)) (EmptyCell!5300) )
))
(declare-datatypes ((array!26403 0))(
  ( (array!26404 (arr!12651 (Array (_ BitVec 32) ValueCell!5300)) (size!13004 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26403)

(declare-fun e!255115 () Bool)

(declare-fun array_inv!9242 (array!26403) Bool)

(assert (=> start!39854 (and (array_inv!9242 _values!549) e!255115)))

(declare-fun array_inv!9243 (array!26401) Bool)

(assert (=> start!39854 (array_inv!9243 _keys!709)))

(declare-fun b!431117 () Bool)

(declare-fun res!253478 () Bool)

(assert (=> b!431117 (=> (not res!253478) (not e!255108))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431117 (= res!253478 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!431118 () Bool)

(declare-fun res!253491 () Bool)

(assert (=> b!431118 (=> (not res!253491) (not e!255110))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431118 (= res!253491 (bvsle from!863 i!563))))

(declare-fun b!431119 () Bool)

(declare-fun res!253486 () Bool)

(assert (=> b!431119 (=> (not res!253486) (not e!255108))))

(assert (=> b!431119 (= res!253486 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7502))))

(declare-fun b!431120 () Bool)

(declare-fun res!253485 () Bool)

(assert (=> b!431120 (=> (not res!253485) (not e!255108))))

(assert (=> b!431120 (= res!253485 (or (= (select (arr!12650 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12650 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431121 () Bool)

(declare-fun e!255112 () Bool)

(assert (=> b!431121 (= e!255110 e!255112)))

(declare-fun res!253484 () Bool)

(assert (=> b!431121 (=> (not res!253484) (not e!255112))))

(assert (=> b!431121 (= res!253484 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16155)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!197307 () array!26403)

(declare-fun zeroValue!515 () V!16155)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7508 0))(
  ( (tuple2!7509 (_1!3765 (_ BitVec 64)) (_2!3765 V!16155)) )
))
(declare-datatypes ((List!7506 0))(
  ( (Nil!7503) (Cons!7502 (h!8358 tuple2!7508) (t!13081 List!7506)) )
))
(declare-datatypes ((ListLongMap!6411 0))(
  ( (ListLongMap!6412 (toList!3221 List!7506)) )
))
(declare-fun lt!197319 () ListLongMap!6411)

(declare-fun getCurrentListMapNoExtraKeys!1427 (array!26401 array!26403 (_ BitVec 32) (_ BitVec 32) V!16155 V!16155 (_ BitVec 32) Int) ListLongMap!6411)

(assert (=> b!431121 (= lt!197319 (getCurrentListMapNoExtraKeys!1427 lt!197312 lt!197307 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16155)

(assert (=> b!431121 (= lt!197307 (array!26404 (store (arr!12651 _values!549) i!563 (ValueCellFull!5300 v!412)) (size!13004 _values!549)))))

(declare-fun lt!197308 () ListLongMap!6411)

(assert (=> b!431121 (= lt!197308 (getCurrentListMapNoExtraKeys!1427 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431122 () Bool)

(declare-fun e!255116 () Bool)

(assert (=> b!431122 (= e!255116 tp_is_empty!11287)))

(declare-fun mapNonEmpty!18552 () Bool)

(declare-fun mapRes!18552 () Bool)

(declare-fun tp!35933 () Bool)

(assert (=> mapNonEmpty!18552 (= mapRes!18552 (and tp!35933 e!255116))))

(declare-fun mapValue!18552 () ValueCell!5300)

(declare-fun mapKey!18552 () (_ BitVec 32))

(declare-fun mapRest!18552 () (Array (_ BitVec 32) ValueCell!5300))

(assert (=> mapNonEmpty!18552 (= (arr!12651 _values!549) (store mapRest!18552 mapKey!18552 mapValue!18552))))

(declare-fun b!431123 () Bool)

(declare-fun res!253481 () Bool)

(assert (=> b!431123 (=> (not res!253481) (not e!255108))))

(assert (=> b!431123 (= res!253481 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13003 _keys!709))))))

(declare-fun b!431124 () Bool)

(declare-fun e!255114 () Bool)

(declare-fun e!255113 () Bool)

(assert (=> b!431124 (= e!255114 e!255113)))

(declare-fun res!253482 () Bool)

(assert (=> b!431124 (=> res!253482 e!255113)))

(assert (=> b!431124 (= res!253482 (= k0!794 (select (arr!12650 _keys!709) from!863)))))

(assert (=> b!431124 (not (= (select (arr!12650 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12701 0))(
  ( (Unit!12702) )
))
(declare-fun lt!197314 () Unit!12701)

(declare-fun e!255117 () Unit!12701)

(assert (=> b!431124 (= lt!197314 e!255117)))

(declare-fun c!55467 () Bool)

(assert (=> b!431124 (= c!55467 (= (select (arr!12650 _keys!709) from!863) k0!794))))

(declare-fun lt!197315 () ListLongMap!6411)

(assert (=> b!431124 (= lt!197319 lt!197315)))

(declare-fun lt!197320 () ListLongMap!6411)

(declare-fun lt!197321 () tuple2!7508)

(declare-fun +!1397 (ListLongMap!6411 tuple2!7508) ListLongMap!6411)

(assert (=> b!431124 (= lt!197315 (+!1397 lt!197320 lt!197321))))

(declare-fun lt!197316 () V!16155)

(assert (=> b!431124 (= lt!197321 (tuple2!7509 (select (arr!12650 _keys!709) from!863) lt!197316))))

(declare-fun get!6282 (ValueCell!5300 V!16155) V!16155)

(declare-fun dynLambda!786 (Int (_ BitVec 64)) V!16155)

(assert (=> b!431124 (= lt!197316 (get!6282 (select (arr!12651 _values!549) from!863) (dynLambda!786 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431125 () Bool)

(declare-fun Unit!12703 () Unit!12701)

(assert (=> b!431125 (= e!255117 Unit!12703)))

(declare-fun b!431126 () Bool)

(declare-fun res!253489 () Bool)

(assert (=> b!431126 (=> (not res!253489) (not e!255108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26401 (_ BitVec 32)) Bool)

(assert (=> b!431126 (= res!253489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18552 () Bool)

(assert (=> mapIsEmpty!18552 mapRes!18552))

(declare-fun b!431127 () Bool)

(declare-fun Unit!12704 () Unit!12701)

(assert (=> b!431127 (= e!255117 Unit!12704)))

(declare-fun lt!197309 () Unit!12701)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26401 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12701)

(assert (=> b!431127 (= lt!197309 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431127 false))

(declare-fun b!431128 () Bool)

(assert (=> b!431128 (= e!255112 (not e!255114))))

(declare-fun res!253488 () Bool)

(assert (=> b!431128 (=> res!253488 e!255114)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431128 (= res!253488 (not (validKeyInArray!0 (select (arr!12650 _keys!709) from!863))))))

(declare-fun lt!197313 () ListLongMap!6411)

(assert (=> b!431128 (= lt!197313 lt!197320)))

(declare-fun lt!197318 () ListLongMap!6411)

(declare-fun lt!197317 () tuple2!7508)

(assert (=> b!431128 (= lt!197320 (+!1397 lt!197318 lt!197317))))

(assert (=> b!431128 (= lt!197313 (getCurrentListMapNoExtraKeys!1427 lt!197312 lt!197307 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!431128 (= lt!197317 (tuple2!7509 k0!794 v!412))))

(assert (=> b!431128 (= lt!197318 (getCurrentListMapNoExtraKeys!1427 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197311 () Unit!12701)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!558 (array!26401 array!26403 (_ BitVec 32) (_ BitVec 32) V!16155 V!16155 (_ BitVec 32) (_ BitVec 64) V!16155 (_ BitVec 32) Int) Unit!12701)

(assert (=> b!431128 (= lt!197311 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!558 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431129 () Bool)

(assert (=> b!431129 (= e!255108 e!255110)))

(declare-fun res!253480 () Bool)

(assert (=> b!431129 (=> (not res!253480) (not e!255110))))

(assert (=> b!431129 (= res!253480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197312 mask!1025))))

(assert (=> b!431129 (= lt!197312 (array!26402 (store (arr!12650 _keys!709) i!563 k0!794) (size!13003 _keys!709)))))

(declare-fun b!431130 () Bool)

(declare-fun res!253490 () Bool)

(assert (=> b!431130 (=> (not res!253490) (not e!255108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431130 (= res!253490 (validMask!0 mask!1025))))

(declare-fun b!431131 () Bool)

(assert (=> b!431131 (= e!255113 true)))

(assert (=> b!431131 (= lt!197315 (+!1397 (+!1397 lt!197318 lt!197321) lt!197317))))

(declare-fun lt!197310 () Unit!12701)

(declare-fun addCommutativeForDiffKeys!359 (ListLongMap!6411 (_ BitVec 64) V!16155 (_ BitVec 64) V!16155) Unit!12701)

(assert (=> b!431131 (= lt!197310 (addCommutativeForDiffKeys!359 lt!197318 k0!794 v!412 (select (arr!12650 _keys!709) from!863) lt!197316))))

(declare-fun b!431132 () Bool)

(declare-fun res!253487 () Bool)

(assert (=> b!431132 (=> (not res!253487) (not e!255108))))

(assert (=> b!431132 (= res!253487 (validKeyInArray!0 k0!794))))

(declare-fun b!431133 () Bool)

(declare-fun res!253479 () Bool)

(assert (=> b!431133 (=> (not res!253479) (not e!255108))))

(assert (=> b!431133 (= res!253479 (and (= (size!13004 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13003 _keys!709) (size!13004 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431134 () Bool)

(assert (=> b!431134 (= e!255115 (and e!255109 mapRes!18552))))

(declare-fun condMapEmpty!18552 () Bool)

(declare-fun mapDefault!18552 () ValueCell!5300)

(assert (=> b!431134 (= condMapEmpty!18552 (= (arr!12651 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5300)) mapDefault!18552)))))

(assert (= (and start!39854 res!253477) b!431130))

(assert (= (and b!431130 res!253490) b!431133))

(assert (= (and b!431133 res!253479) b!431126))

(assert (= (and b!431126 res!253489) b!431119))

(assert (= (and b!431119 res!253486) b!431123))

(assert (= (and b!431123 res!253481) b!431132))

(assert (= (and b!431132 res!253487) b!431120))

(assert (= (and b!431120 res!253485) b!431117))

(assert (= (and b!431117 res!253478) b!431129))

(assert (= (and b!431129 res!253480) b!431116))

(assert (= (and b!431116 res!253483) b!431118))

(assert (= (and b!431118 res!253491) b!431121))

(assert (= (and b!431121 res!253484) b!431128))

(assert (= (and b!431128 (not res!253488)) b!431124))

(assert (= (and b!431124 c!55467) b!431127))

(assert (= (and b!431124 (not c!55467)) b!431125))

(assert (= (and b!431124 (not res!253482)) b!431131))

(assert (= (and b!431134 condMapEmpty!18552) mapIsEmpty!18552))

(assert (= (and b!431134 (not condMapEmpty!18552)) mapNonEmpty!18552))

(get-info :version)

(assert (= (and mapNonEmpty!18552 ((_ is ValueCellFull!5300) mapValue!18552)) b!431122))

(assert (= (and b!431134 ((_ is ValueCellFull!5300) mapDefault!18552)) b!431115))

(assert (= start!39854 b!431134))

(declare-fun b_lambda!9205 () Bool)

(assert (=> (not b_lambda!9205) (not b!431124)))

(declare-fun t!13079 () Bool)

(declare-fun tb!3533 () Bool)

(assert (=> (and start!39854 (= defaultEntry!557 defaultEntry!557) t!13079) tb!3533))

(declare-fun result!6601 () Bool)

(assert (=> tb!3533 (= result!6601 tp_is_empty!11287)))

(assert (=> b!431124 t!13079))

(declare-fun b_and!17905 () Bool)

(assert (= b_and!17903 (and (=> t!13079 result!6601) b_and!17905)))

(declare-fun m!418803 () Bool)

(assert (=> b!431119 m!418803))

(declare-fun m!418805 () Bool)

(assert (=> b!431116 m!418805))

(declare-fun m!418807 () Bool)

(assert (=> mapNonEmpty!18552 m!418807))

(declare-fun m!418809 () Bool)

(assert (=> b!431127 m!418809))

(declare-fun m!418811 () Bool)

(assert (=> b!431129 m!418811))

(declare-fun m!418813 () Bool)

(assert (=> b!431129 m!418813))

(declare-fun m!418815 () Bool)

(assert (=> b!431126 m!418815))

(declare-fun m!418817 () Bool)

(assert (=> b!431117 m!418817))

(declare-fun m!418819 () Bool)

(assert (=> b!431131 m!418819))

(assert (=> b!431131 m!418819))

(declare-fun m!418821 () Bool)

(assert (=> b!431131 m!418821))

(declare-fun m!418823 () Bool)

(assert (=> b!431131 m!418823))

(assert (=> b!431131 m!418823))

(declare-fun m!418825 () Bool)

(assert (=> b!431131 m!418825))

(assert (=> b!431128 m!418823))

(declare-fun m!418827 () Bool)

(assert (=> b!431128 m!418827))

(declare-fun m!418829 () Bool)

(assert (=> b!431128 m!418829))

(declare-fun m!418831 () Bool)

(assert (=> b!431128 m!418831))

(assert (=> b!431128 m!418823))

(declare-fun m!418833 () Bool)

(assert (=> b!431128 m!418833))

(declare-fun m!418835 () Bool)

(assert (=> b!431128 m!418835))

(declare-fun m!418837 () Bool)

(assert (=> b!431132 m!418837))

(declare-fun m!418839 () Bool)

(assert (=> b!431130 m!418839))

(declare-fun m!418841 () Bool)

(assert (=> b!431121 m!418841))

(declare-fun m!418843 () Bool)

(assert (=> b!431121 m!418843))

(declare-fun m!418845 () Bool)

(assert (=> b!431121 m!418845))

(declare-fun m!418847 () Bool)

(assert (=> b!431120 m!418847))

(assert (=> b!431124 m!418823))

(declare-fun m!418849 () Bool)

(assert (=> b!431124 m!418849))

(declare-fun m!418851 () Bool)

(assert (=> b!431124 m!418851))

(declare-fun m!418853 () Bool)

(assert (=> b!431124 m!418853))

(assert (=> b!431124 m!418851))

(assert (=> b!431124 m!418849))

(declare-fun m!418855 () Bool)

(assert (=> b!431124 m!418855))

(declare-fun m!418857 () Bool)

(assert (=> start!39854 m!418857))

(declare-fun m!418859 () Bool)

(assert (=> start!39854 m!418859))

(check-sat (not b!431132) tp_is_empty!11287 (not b!431129) (not b_lambda!9205) (not b!431126) (not b!431124) (not b!431116) (not mapNonEmpty!18552) (not b_next!10135) (not b!431121) (not b!431127) b_and!17905 (not b!431128) (not b!431117) (not start!39854) (not b!431131) (not b!431130) (not b!431119))
(check-sat b_and!17905 (not b_next!10135))
