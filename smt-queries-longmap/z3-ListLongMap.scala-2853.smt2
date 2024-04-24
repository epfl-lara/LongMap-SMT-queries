; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41134 () Bool)

(assert start!41134)

(declare-fun b_free!11017 () Bool)

(declare-fun b_next!11017 () Bool)

(assert (=> start!41134 (= b_free!11017 (not b_next!11017))))

(declare-fun tp!38887 () Bool)

(declare-fun b_and!19283 () Bool)

(assert (=> start!41134 (= tp!38887 b_and!19283)))

(declare-fun b!459281 () Bool)

(declare-fun res!274498 () Bool)

(declare-fun e!268072 () Bool)

(assert (=> b!459281 (=> (not res!274498) (not e!268072))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459281 (= res!274498 (validKeyInArray!0 k0!794))))

(declare-fun b!459282 () Bool)

(declare-fun e!268068 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28504 0))(
  ( (array!28505 (arr!13692 (Array (_ BitVec 32) (_ BitVec 64))) (size!14044 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28504)

(assert (=> b!459282 (= e!268068 (bvslt from!863 (size!14044 _keys!709)))))

(assert (=> b!459282 (not (= (select (arr!13692 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!13335 0))(
  ( (Unit!13336) )
))
(declare-fun lt!207830 () Unit!13335)

(declare-fun e!268066 () Unit!13335)

(assert (=> b!459282 (= lt!207830 e!268066)))

(declare-fun c!56447 () Bool)

(assert (=> b!459282 (= c!56447 (= (select (arr!13692 _keys!709) from!863) k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!17579 0))(
  ( (V!17580 (val!6222 Int)) )
))
(declare-datatypes ((ValueCell!5834 0))(
  ( (ValueCellFull!5834 (v!8501 V!17579)) (EmptyCell!5834) )
))
(declare-datatypes ((array!28506 0))(
  ( (array!28507 (arr!13693 (Array (_ BitVec 32) ValueCell!5834)) (size!14045 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28506)

(declare-datatypes ((tuple2!8122 0))(
  ( (tuple2!8123 (_1!4072 (_ BitVec 64)) (_2!4072 V!17579)) )
))
(declare-datatypes ((List!8192 0))(
  ( (Nil!8189) (Cons!8188 (h!9044 tuple2!8122) (t!14080 List!8192)) )
))
(declare-datatypes ((ListLongMap!7037 0))(
  ( (ListLongMap!7038 (toList!3534 List!8192)) )
))
(declare-fun lt!207825 () ListLongMap!7037)

(declare-fun lt!207829 () ListLongMap!7037)

(declare-fun +!1612 (ListLongMap!7037 tuple2!8122) ListLongMap!7037)

(declare-fun get!6759 (ValueCell!5834 V!17579) V!17579)

(declare-fun dynLambda!893 (Int (_ BitVec 64)) V!17579)

(assert (=> b!459282 (= lt!207829 (+!1612 lt!207825 (tuple2!8123 (select (arr!13692 _keys!709) from!863) (get!6759 (select (arr!13693 _values!549) from!863) (dynLambda!893 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!459283 () Bool)

(declare-fun e!268073 () Bool)

(declare-fun e!268067 () Bool)

(declare-fun mapRes!20182 () Bool)

(assert (=> b!459283 (= e!268073 (and e!268067 mapRes!20182))))

(declare-fun condMapEmpty!20182 () Bool)

(declare-fun mapDefault!20182 () ValueCell!5834)

(assert (=> b!459283 (= condMapEmpty!20182 (= (arr!13693 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5834)) mapDefault!20182)))))

(declare-fun b!459284 () Bool)

(declare-fun tp_is_empty!12355 () Bool)

(assert (=> b!459284 (= e!268067 tp_is_empty!12355)))

(declare-fun b!459285 () Bool)

(declare-fun res!274502 () Bool)

(assert (=> b!459285 (=> (not res!274502) (not e!268072))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!459285 (= res!274502 (and (= (size!14045 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14044 _keys!709) (size!14045 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459286 () Bool)

(declare-fun res!274490 () Bool)

(assert (=> b!459286 (=> (not res!274490) (not e!268072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459286 (= res!274490 (validMask!0 mask!1025))))

(declare-fun b!459287 () Bool)

(declare-fun res!274497 () Bool)

(assert (=> b!459287 (=> (not res!274497) (not e!268072))))

(declare-fun arrayContainsKey!0 (array!28504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459287 (= res!274497 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20182 () Bool)

(assert (=> mapIsEmpty!20182 mapRes!20182))

(declare-fun b!459288 () Bool)

(declare-fun e!268074 () Bool)

(assert (=> b!459288 (= e!268074 tp_is_empty!12355)))

(declare-fun b!459289 () Bool)

(declare-fun res!274492 () Bool)

(assert (=> b!459289 (=> (not res!274492) (not e!268072))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459289 (= res!274492 (or (= (select (arr!13692 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13692 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459290 () Bool)

(declare-fun e!268071 () Bool)

(declare-fun e!268070 () Bool)

(assert (=> b!459290 (= e!268071 e!268070)))

(declare-fun res!274499 () Bool)

(assert (=> b!459290 (=> (not res!274499) (not e!268070))))

(assert (=> b!459290 (= res!274499 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207824 () array!28504)

(declare-fun minValue!515 () V!17579)

(declare-fun zeroValue!515 () V!17579)

(declare-fun lt!207831 () array!28506)

(declare-fun getCurrentListMapNoExtraKeys!1763 (array!28504 array!28506 (_ BitVec 32) (_ BitVec 32) V!17579 V!17579 (_ BitVec 32) Int) ListLongMap!7037)

(assert (=> b!459290 (= lt!207829 (getCurrentListMapNoExtraKeys!1763 lt!207824 lt!207831 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17579)

(assert (=> b!459290 (= lt!207831 (array!28507 (store (arr!13693 _values!549) i!563 (ValueCellFull!5834 v!412)) (size!14045 _values!549)))))

(declare-fun lt!207833 () ListLongMap!7037)

(assert (=> b!459290 (= lt!207833 (getCurrentListMapNoExtraKeys!1763 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459291 () Bool)

(declare-fun Unit!13337 () Unit!13335)

(assert (=> b!459291 (= e!268066 Unit!13337)))

(declare-fun lt!207828 () Unit!13335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28504 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13335)

(assert (=> b!459291 (= lt!207828 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459291 false))

(declare-fun b!459292 () Bool)

(declare-fun Unit!13338 () Unit!13335)

(assert (=> b!459292 (= e!268066 Unit!13338)))

(declare-fun b!459293 () Bool)

(assert (=> b!459293 (= e!268072 e!268071)))

(declare-fun res!274496 () Bool)

(assert (=> b!459293 (=> (not res!274496) (not e!268071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28504 (_ BitVec 32)) Bool)

(assert (=> b!459293 (= res!274496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207824 mask!1025))))

(assert (=> b!459293 (= lt!207824 (array!28505 (store (arr!13692 _keys!709) i!563 k0!794) (size!14044 _keys!709)))))

(declare-fun b!459294 () Bool)

(declare-fun res!274500 () Bool)

(assert (=> b!459294 (=> (not res!274500) (not e!268071))))

(assert (=> b!459294 (= res!274500 (bvsle from!863 i!563))))

(declare-fun b!459295 () Bool)

(declare-fun res!274495 () Bool)

(assert (=> b!459295 (=> (not res!274495) (not e!268072))))

(assert (=> b!459295 (= res!274495 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14044 _keys!709))))))

(declare-fun mapNonEmpty!20182 () Bool)

(declare-fun tp!38886 () Bool)

(assert (=> mapNonEmpty!20182 (= mapRes!20182 (and tp!38886 e!268074))))

(declare-fun mapValue!20182 () ValueCell!5834)

(declare-fun mapRest!20182 () (Array (_ BitVec 32) ValueCell!5834))

(declare-fun mapKey!20182 () (_ BitVec 32))

(assert (=> mapNonEmpty!20182 (= (arr!13693 _values!549) (store mapRest!20182 mapKey!20182 mapValue!20182))))

(declare-fun res!274493 () Bool)

(assert (=> start!41134 (=> (not res!274493) (not e!268072))))

(assert (=> start!41134 (= res!274493 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14044 _keys!709))))))

(assert (=> start!41134 e!268072))

(assert (=> start!41134 tp_is_empty!12355))

(assert (=> start!41134 tp!38887))

(assert (=> start!41134 true))

(declare-fun array_inv!9984 (array!28506) Bool)

(assert (=> start!41134 (and (array_inv!9984 _values!549) e!268073)))

(declare-fun array_inv!9985 (array!28504) Bool)

(assert (=> start!41134 (array_inv!9985 _keys!709)))

(declare-fun b!459296 () Bool)

(declare-fun res!274494 () Bool)

(assert (=> b!459296 (=> (not res!274494) (not e!268072))))

(assert (=> b!459296 (= res!274494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459297 () Bool)

(declare-fun res!274501 () Bool)

(assert (=> b!459297 (=> (not res!274501) (not e!268071))))

(declare-datatypes ((List!8193 0))(
  ( (Nil!8190) (Cons!8189 (h!9045 (_ BitVec 64)) (t!14081 List!8193)) )
))
(declare-fun arrayNoDuplicates!0 (array!28504 (_ BitVec 32) List!8193) Bool)

(assert (=> b!459297 (= res!274501 (arrayNoDuplicates!0 lt!207824 #b00000000000000000000000000000000 Nil!8190))))

(declare-fun b!459298 () Bool)

(assert (=> b!459298 (= e!268070 (not e!268068))))

(declare-fun res!274503 () Bool)

(assert (=> b!459298 (=> res!274503 e!268068)))

(assert (=> b!459298 (= res!274503 (not (validKeyInArray!0 (select (arr!13692 _keys!709) from!863))))))

(declare-fun lt!207827 () ListLongMap!7037)

(assert (=> b!459298 (= lt!207827 lt!207825)))

(declare-fun lt!207826 () ListLongMap!7037)

(assert (=> b!459298 (= lt!207825 (+!1612 lt!207826 (tuple2!8123 k0!794 v!412)))))

(assert (=> b!459298 (= lt!207827 (getCurrentListMapNoExtraKeys!1763 lt!207824 lt!207831 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!459298 (= lt!207826 (getCurrentListMapNoExtraKeys!1763 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!207832 () Unit!13335)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!769 (array!28504 array!28506 (_ BitVec 32) (_ BitVec 32) V!17579 V!17579 (_ BitVec 32) (_ BitVec 64) V!17579 (_ BitVec 32) Int) Unit!13335)

(assert (=> b!459298 (= lt!207832 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!769 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459299 () Bool)

(declare-fun res!274491 () Bool)

(assert (=> b!459299 (=> (not res!274491) (not e!268072))))

(assert (=> b!459299 (= res!274491 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8190))))

(assert (= (and start!41134 res!274493) b!459286))

(assert (= (and b!459286 res!274490) b!459285))

(assert (= (and b!459285 res!274502) b!459296))

(assert (= (and b!459296 res!274494) b!459299))

(assert (= (and b!459299 res!274491) b!459295))

(assert (= (and b!459295 res!274495) b!459281))

(assert (= (and b!459281 res!274498) b!459289))

(assert (= (and b!459289 res!274492) b!459287))

(assert (= (and b!459287 res!274497) b!459293))

(assert (= (and b!459293 res!274496) b!459297))

(assert (= (and b!459297 res!274501) b!459294))

(assert (= (and b!459294 res!274500) b!459290))

(assert (= (and b!459290 res!274499) b!459298))

(assert (= (and b!459298 (not res!274503)) b!459282))

(assert (= (and b!459282 c!56447) b!459291))

(assert (= (and b!459282 (not c!56447)) b!459292))

(assert (= (and b!459283 condMapEmpty!20182) mapIsEmpty!20182))

(assert (= (and b!459283 (not condMapEmpty!20182)) mapNonEmpty!20182))

(get-info :version)

(assert (= (and mapNonEmpty!20182 ((_ is ValueCellFull!5834) mapValue!20182)) b!459288))

(assert (= (and b!459283 ((_ is ValueCellFull!5834) mapDefault!20182)) b!459284))

(assert (= start!41134 b!459283))

(declare-fun b_lambda!9865 () Bool)

(assert (=> (not b_lambda!9865) (not b!459282)))

(declare-fun t!14079 () Bool)

(declare-fun tb!3845 () Bool)

(assert (=> (and start!41134 (= defaultEntry!557 defaultEntry!557) t!14079) tb!3845))

(declare-fun result!7243 () Bool)

(assert (=> tb!3845 (= result!7243 tp_is_empty!12355)))

(assert (=> b!459282 t!14079))

(declare-fun b_and!19285 () Bool)

(assert (= b_and!19283 (and (=> t!14079 result!7243) b_and!19285)))

(declare-fun m!442817 () Bool)

(assert (=> b!459298 m!442817))

(declare-fun m!442819 () Bool)

(assert (=> b!459298 m!442819))

(declare-fun m!442821 () Bool)

(assert (=> b!459298 m!442821))

(declare-fun m!442823 () Bool)

(assert (=> b!459298 m!442823))

(assert (=> b!459298 m!442817))

(declare-fun m!442825 () Bool)

(assert (=> b!459298 m!442825))

(declare-fun m!442827 () Bool)

(assert (=> b!459298 m!442827))

(declare-fun m!442829 () Bool)

(assert (=> b!459290 m!442829))

(declare-fun m!442831 () Bool)

(assert (=> b!459290 m!442831))

(declare-fun m!442833 () Bool)

(assert (=> b!459290 m!442833))

(declare-fun m!442835 () Bool)

(assert (=> b!459297 m!442835))

(declare-fun m!442837 () Bool)

(assert (=> b!459286 m!442837))

(declare-fun m!442839 () Bool)

(assert (=> b!459293 m!442839))

(declare-fun m!442841 () Bool)

(assert (=> b!459293 m!442841))

(declare-fun m!442843 () Bool)

(assert (=> b!459287 m!442843))

(declare-fun m!442845 () Bool)

(assert (=> b!459296 m!442845))

(declare-fun m!442847 () Bool)

(assert (=> start!41134 m!442847))

(declare-fun m!442849 () Bool)

(assert (=> start!41134 m!442849))

(declare-fun m!442851 () Bool)

(assert (=> b!459291 m!442851))

(assert (=> b!459282 m!442817))

(declare-fun m!442853 () Bool)

(assert (=> b!459282 m!442853))

(declare-fun m!442855 () Bool)

(assert (=> b!459282 m!442855))

(declare-fun m!442857 () Bool)

(assert (=> b!459282 m!442857))

(assert (=> b!459282 m!442857))

(assert (=> b!459282 m!442853))

(declare-fun m!442859 () Bool)

(assert (=> b!459282 m!442859))

(declare-fun m!442861 () Bool)

(assert (=> b!459289 m!442861))

(declare-fun m!442863 () Bool)

(assert (=> b!459281 m!442863))

(declare-fun m!442865 () Bool)

(assert (=> mapNonEmpty!20182 m!442865))

(declare-fun m!442867 () Bool)

(assert (=> b!459299 m!442867))

(check-sat (not b!459293) (not b!459296) (not b!459287) (not b!459299) (not b!459290) (not b!459286) (not b_lambda!9865) b_and!19285 (not b!459291) (not start!41134) (not b!459281) (not b!459297) (not mapNonEmpty!20182) (not b!459282) tp_is_empty!12355 (not b!459298) (not b_next!11017))
(check-sat b_and!19285 (not b_next!11017))
