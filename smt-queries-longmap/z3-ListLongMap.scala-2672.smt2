; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39836 () Bool)

(assert start!39836)

(declare-fun b_free!10117 () Bool)

(declare-fun b_next!10117 () Bool)

(assert (=> start!39836 (= b_free!10117 (not b_next!10117))))

(declare-fun tp!35879 () Bool)

(declare-fun b_and!17867 () Bool)

(assert (=> start!39836 (= tp!35879 b_and!17867)))

(declare-fun b!430557 () Bool)

(declare-fun e!254845 () Bool)

(assert (=> b!430557 (= e!254845 true)))

(declare-datatypes ((V!16131 0))(
  ( (V!16132 (val!5679 Int)) )
))
(declare-datatypes ((tuple2!7492 0))(
  ( (tuple2!7493 (_1!3757 (_ BitVec 64)) (_2!3757 V!16131)) )
))
(declare-datatypes ((List!7490 0))(
  ( (Nil!7487) (Cons!7486 (h!8342 tuple2!7492) (t!13047 List!7490)) )
))
(declare-datatypes ((ListLongMap!6395 0))(
  ( (ListLongMap!6396 (toList!3213 List!7490)) )
))
(declare-fun lt!196914 () ListLongMap!6395)

(declare-fun lt!196911 () tuple2!7492)

(declare-fun lt!196906 () ListLongMap!6395)

(declare-fun lt!196916 () tuple2!7492)

(declare-fun +!1389 (ListLongMap!6395 tuple2!7492) ListLongMap!6395)

(assert (=> b!430557 (= lt!196906 (+!1389 (+!1389 lt!196914 lt!196916) lt!196911))))

(declare-datatypes ((Unit!12675 0))(
  ( (Unit!12676) )
))
(declare-fun lt!196902 () Unit!12675)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!196912 () V!16131)

(declare-fun v!412 () V!16131)

(declare-datatypes ((array!26367 0))(
  ( (array!26368 (arr!12633 (Array (_ BitVec 32) (_ BitVec 64))) (size!12986 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26367)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!353 (ListLongMap!6395 (_ BitVec 64) V!16131 (_ BitVec 64) V!16131) Unit!12675)

(assert (=> b!430557 (= lt!196902 (addCommutativeForDiffKeys!353 lt!196914 k0!794 v!412 (select (arr!12633 _keys!709) from!863) lt!196912))))

(declare-fun b!430558 () Bool)

(declare-fun res!253076 () Bool)

(declare-fun e!254842 () Bool)

(assert (=> b!430558 (=> (not res!253076) (not e!254842))))

(declare-fun lt!196904 () array!26367)

(declare-datatypes ((List!7491 0))(
  ( (Nil!7488) (Cons!7487 (h!8343 (_ BitVec 64)) (t!13048 List!7491)) )
))
(declare-fun arrayNoDuplicates!0 (array!26367 (_ BitVec 32) List!7491) Bool)

(assert (=> b!430558 (= res!253076 (arrayNoDuplicates!0 lt!196904 #b00000000000000000000000000000000 Nil!7488))))

(declare-fun b!430559 () Bool)

(declare-fun e!254846 () Bool)

(declare-fun tp_is_empty!11269 () Bool)

(assert (=> b!430559 (= e!254846 tp_is_empty!11269)))

(declare-fun mapIsEmpty!18525 () Bool)

(declare-fun mapRes!18525 () Bool)

(assert (=> mapIsEmpty!18525 mapRes!18525))

(declare-fun b!430560 () Bool)

(declare-fun res!253073 () Bool)

(declare-fun e!254838 () Bool)

(assert (=> b!430560 (=> (not res!253073) (not e!254838))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5291 0))(
  ( (ValueCellFull!5291 (v!7920 V!16131)) (EmptyCell!5291) )
))
(declare-datatypes ((array!26369 0))(
  ( (array!26370 (arr!12634 (Array (_ BitVec 32) ValueCell!5291)) (size!12987 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26369)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!430560 (= res!253073 (and (= (size!12987 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12986 _keys!709) (size!12987 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430561 () Bool)

(declare-fun res!253080 () Bool)

(assert (=> b!430561 (=> (not res!253080) (not e!254838))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430561 (= res!253080 (or (= (select (arr!12633 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12633 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430562 () Bool)

(declare-fun res!253075 () Bool)

(assert (=> b!430562 (=> (not res!253075) (not e!254838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430562 (= res!253075 (validMask!0 mask!1025))))

(declare-fun res!253074 () Bool)

(assert (=> start!39836 (=> (not res!253074) (not e!254838))))

(assert (=> start!39836 (= res!253074 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12986 _keys!709))))))

(assert (=> start!39836 e!254838))

(assert (=> start!39836 tp_is_empty!11269))

(assert (=> start!39836 tp!35879))

(assert (=> start!39836 true))

(declare-fun e!254843 () Bool)

(declare-fun array_inv!9228 (array!26369) Bool)

(assert (=> start!39836 (and (array_inv!9228 _values!549) e!254843)))

(declare-fun array_inv!9229 (array!26367) Bool)

(assert (=> start!39836 (array_inv!9229 _keys!709)))

(declare-fun b!430563 () Bool)

(declare-fun res!253077 () Bool)

(assert (=> b!430563 (=> (not res!253077) (not e!254838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430563 (= res!253077 (validKeyInArray!0 k0!794))))

(declare-fun b!430564 () Bool)

(declare-fun res!253084 () Bool)

(assert (=> b!430564 (=> (not res!253084) (not e!254838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26367 (_ BitVec 32)) Bool)

(assert (=> b!430564 (= res!253084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430565 () Bool)

(declare-fun res!253079 () Bool)

(assert (=> b!430565 (=> (not res!253079) (not e!254838))))

(assert (=> b!430565 (= res!253079 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12986 _keys!709))))))

(declare-fun b!430566 () Bool)

(declare-fun e!254840 () Bool)

(assert (=> b!430566 (= e!254843 (and e!254840 mapRes!18525))))

(declare-fun condMapEmpty!18525 () Bool)

(declare-fun mapDefault!18525 () ValueCell!5291)

(assert (=> b!430566 (= condMapEmpty!18525 (= (arr!12634 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5291)) mapDefault!18525)))))

(declare-fun b!430567 () Bool)

(declare-fun e!254847 () Bool)

(assert (=> b!430567 (= e!254847 e!254845)))

(declare-fun res!253085 () Bool)

(assert (=> b!430567 (=> res!253085 e!254845)))

(assert (=> b!430567 (= res!253085 (= k0!794 (select (arr!12633 _keys!709) from!863)))))

(assert (=> b!430567 (not (= (select (arr!12633 _keys!709) from!863) k0!794))))

(declare-fun lt!196910 () Unit!12675)

(declare-fun e!254844 () Unit!12675)

(assert (=> b!430567 (= lt!196910 e!254844)))

(declare-fun c!55440 () Bool)

(assert (=> b!430567 (= c!55440 (= (select (arr!12633 _keys!709) from!863) k0!794))))

(declare-fun lt!196907 () ListLongMap!6395)

(assert (=> b!430567 (= lt!196907 lt!196906)))

(declare-fun lt!196915 () ListLongMap!6395)

(assert (=> b!430567 (= lt!196906 (+!1389 lt!196915 lt!196916))))

(assert (=> b!430567 (= lt!196916 (tuple2!7493 (select (arr!12633 _keys!709) from!863) lt!196912))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6271 (ValueCell!5291 V!16131) V!16131)

(declare-fun dynLambda!781 (Int (_ BitVec 64)) V!16131)

(assert (=> b!430567 (= lt!196912 (get!6271 (select (arr!12634 _values!549) from!863) (dynLambda!781 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430568 () Bool)

(declare-fun res!253086 () Bool)

(assert (=> b!430568 (=> (not res!253086) (not e!254838))))

(assert (=> b!430568 (= res!253086 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7488))))

(declare-fun b!430569 () Bool)

(declare-fun Unit!12677 () Unit!12675)

(assert (=> b!430569 (= e!254844 Unit!12677)))

(declare-fun lt!196908 () Unit!12675)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26367 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12675)

(assert (=> b!430569 (= lt!196908 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430569 false))

(declare-fun b!430570 () Bool)

(declare-fun res!253081 () Bool)

(assert (=> b!430570 (=> (not res!253081) (not e!254842))))

(assert (=> b!430570 (= res!253081 (bvsle from!863 i!563))))

(declare-fun b!430571 () Bool)

(declare-fun Unit!12678 () Unit!12675)

(assert (=> b!430571 (= e!254844 Unit!12678)))

(declare-fun b!430572 () Bool)

(declare-fun e!254839 () Bool)

(assert (=> b!430572 (= e!254839 (not e!254847))))

(declare-fun res!253078 () Bool)

(assert (=> b!430572 (=> res!253078 e!254847)))

(assert (=> b!430572 (= res!253078 (not (validKeyInArray!0 (select (arr!12633 _keys!709) from!863))))))

(declare-fun lt!196903 () ListLongMap!6395)

(assert (=> b!430572 (= lt!196903 lt!196915)))

(assert (=> b!430572 (= lt!196915 (+!1389 lt!196914 lt!196911))))

(declare-fun minValue!515 () V!16131)

(declare-fun zeroValue!515 () V!16131)

(declare-fun lt!196913 () array!26369)

(declare-fun getCurrentListMapNoExtraKeys!1419 (array!26367 array!26369 (_ BitVec 32) (_ BitVec 32) V!16131 V!16131 (_ BitVec 32) Int) ListLongMap!6395)

(assert (=> b!430572 (= lt!196903 (getCurrentListMapNoExtraKeys!1419 lt!196904 lt!196913 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430572 (= lt!196911 (tuple2!7493 k0!794 v!412))))

(assert (=> b!430572 (= lt!196914 (getCurrentListMapNoExtraKeys!1419 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196905 () Unit!12675)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!551 (array!26367 array!26369 (_ BitVec 32) (_ BitVec 32) V!16131 V!16131 (_ BitVec 32) (_ BitVec 64) V!16131 (_ BitVec 32) Int) Unit!12675)

(assert (=> b!430572 (= lt!196905 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!551 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430573 () Bool)

(assert (=> b!430573 (= e!254838 e!254842)))

(declare-fun res!253082 () Bool)

(assert (=> b!430573 (=> (not res!253082) (not e!254842))))

(assert (=> b!430573 (= res!253082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196904 mask!1025))))

(assert (=> b!430573 (= lt!196904 (array!26368 (store (arr!12633 _keys!709) i!563 k0!794) (size!12986 _keys!709)))))

(declare-fun b!430574 () Bool)

(declare-fun res!253083 () Bool)

(assert (=> b!430574 (=> (not res!253083) (not e!254838))))

(declare-fun arrayContainsKey!0 (array!26367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430574 (= res!253083 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430575 () Bool)

(assert (=> b!430575 (= e!254840 tp_is_empty!11269)))

(declare-fun b!430576 () Bool)

(assert (=> b!430576 (= e!254842 e!254839)))

(declare-fun res!253072 () Bool)

(assert (=> b!430576 (=> (not res!253072) (not e!254839))))

(assert (=> b!430576 (= res!253072 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!430576 (= lt!196907 (getCurrentListMapNoExtraKeys!1419 lt!196904 lt!196913 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430576 (= lt!196913 (array!26370 (store (arr!12634 _values!549) i!563 (ValueCellFull!5291 v!412)) (size!12987 _values!549)))))

(declare-fun lt!196909 () ListLongMap!6395)

(assert (=> b!430576 (= lt!196909 (getCurrentListMapNoExtraKeys!1419 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18525 () Bool)

(declare-fun tp!35880 () Bool)

(assert (=> mapNonEmpty!18525 (= mapRes!18525 (and tp!35880 e!254846))))

(declare-fun mapRest!18525 () (Array (_ BitVec 32) ValueCell!5291))

(declare-fun mapKey!18525 () (_ BitVec 32))

(declare-fun mapValue!18525 () ValueCell!5291)

(assert (=> mapNonEmpty!18525 (= (arr!12634 _values!549) (store mapRest!18525 mapKey!18525 mapValue!18525))))

(assert (= (and start!39836 res!253074) b!430562))

(assert (= (and b!430562 res!253075) b!430560))

(assert (= (and b!430560 res!253073) b!430564))

(assert (= (and b!430564 res!253084) b!430568))

(assert (= (and b!430568 res!253086) b!430565))

(assert (= (and b!430565 res!253079) b!430563))

(assert (= (and b!430563 res!253077) b!430561))

(assert (= (and b!430561 res!253080) b!430574))

(assert (= (and b!430574 res!253083) b!430573))

(assert (= (and b!430573 res!253082) b!430558))

(assert (= (and b!430558 res!253076) b!430570))

(assert (= (and b!430570 res!253081) b!430576))

(assert (= (and b!430576 res!253072) b!430572))

(assert (= (and b!430572 (not res!253078)) b!430567))

(assert (= (and b!430567 c!55440) b!430569))

(assert (= (and b!430567 (not c!55440)) b!430571))

(assert (= (and b!430567 (not res!253085)) b!430557))

(assert (= (and b!430566 condMapEmpty!18525) mapIsEmpty!18525))

(assert (= (and b!430566 (not condMapEmpty!18525)) mapNonEmpty!18525))

(get-info :version)

(assert (= (and mapNonEmpty!18525 ((_ is ValueCellFull!5291) mapValue!18525)) b!430559))

(assert (= (and b!430566 ((_ is ValueCellFull!5291) mapDefault!18525)) b!430575))

(assert (= start!39836 b!430566))

(declare-fun b_lambda!9187 () Bool)

(assert (=> (not b_lambda!9187) (not b!430567)))

(declare-fun t!13046 () Bool)

(declare-fun tb!3515 () Bool)

(assert (=> (and start!39836 (= defaultEntry!557 defaultEntry!557) t!13046) tb!3515))

(declare-fun result!6565 () Bool)

(assert (=> tb!3515 (= result!6565 tp_is_empty!11269)))

(assert (=> b!430567 t!13046))

(declare-fun b_and!17869 () Bool)

(assert (= b_and!17867 (and (=> t!13046 result!6565) b_and!17869)))

(declare-fun m!418281 () Bool)

(assert (=> b!430558 m!418281))

(declare-fun m!418283 () Bool)

(assert (=> b!430563 m!418283))

(declare-fun m!418285 () Bool)

(assert (=> mapNonEmpty!18525 m!418285))

(declare-fun m!418287 () Bool)

(assert (=> b!430569 m!418287))

(declare-fun m!418289 () Bool)

(assert (=> b!430574 m!418289))

(declare-fun m!418291 () Bool)

(assert (=> b!430562 m!418291))

(declare-fun m!418293 () Bool)

(assert (=> b!430567 m!418293))

(declare-fun m!418295 () Bool)

(assert (=> b!430567 m!418295))

(declare-fun m!418297 () Bool)

(assert (=> b!430567 m!418297))

(declare-fun m!418299 () Bool)

(assert (=> b!430567 m!418299))

(assert (=> b!430567 m!418299))

(assert (=> b!430567 m!418295))

(declare-fun m!418301 () Bool)

(assert (=> b!430567 m!418301))

(assert (=> b!430572 m!418293))

(declare-fun m!418303 () Bool)

(assert (=> b!430572 m!418303))

(declare-fun m!418305 () Bool)

(assert (=> b!430572 m!418305))

(declare-fun m!418307 () Bool)

(assert (=> b!430572 m!418307))

(assert (=> b!430572 m!418293))

(declare-fun m!418309 () Bool)

(assert (=> b!430572 m!418309))

(declare-fun m!418311 () Bool)

(assert (=> b!430572 m!418311))

(declare-fun m!418313 () Bool)

(assert (=> b!430576 m!418313))

(declare-fun m!418315 () Bool)

(assert (=> b!430576 m!418315))

(declare-fun m!418317 () Bool)

(assert (=> b!430576 m!418317))

(declare-fun m!418319 () Bool)

(assert (=> b!430573 m!418319))

(declare-fun m!418321 () Bool)

(assert (=> b!430573 m!418321))

(declare-fun m!418323 () Bool)

(assert (=> b!430564 m!418323))

(declare-fun m!418325 () Bool)

(assert (=> b!430561 m!418325))

(declare-fun m!418327 () Bool)

(assert (=> b!430568 m!418327))

(declare-fun m!418329 () Bool)

(assert (=> b!430557 m!418329))

(assert (=> b!430557 m!418329))

(declare-fun m!418331 () Bool)

(assert (=> b!430557 m!418331))

(assert (=> b!430557 m!418293))

(assert (=> b!430557 m!418293))

(declare-fun m!418333 () Bool)

(assert (=> b!430557 m!418333))

(declare-fun m!418335 () Bool)

(assert (=> start!39836 m!418335))

(declare-fun m!418337 () Bool)

(assert (=> start!39836 m!418337))

(check-sat (not b!430562) (not b!430576) (not b!430568) (not b!430572) tp_is_empty!11269 (not b!430567) (not b!430557) (not b!430573) (not b!430569) (not b!430574) (not b!430564) (not b!430558) (not b_lambda!9187) (not b!430563) b_and!17869 (not mapNonEmpty!18525) (not start!39836) (not b_next!10117))
(check-sat b_and!17869 (not b_next!10117))
