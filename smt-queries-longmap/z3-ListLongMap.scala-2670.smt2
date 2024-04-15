; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39824 () Bool)

(assert start!39824)

(declare-fun b_free!10105 () Bool)

(declare-fun b_next!10105 () Bool)

(assert (=> start!39824 (= b_free!10105 (not b_next!10105))))

(declare-fun tp!35843 () Bool)

(declare-fun b_and!17843 () Bool)

(assert (=> start!39824 (= tp!35843 b_and!17843)))

(declare-fun b!430185 () Bool)

(declare-fun e!254659 () Bool)

(declare-fun e!254663 () Bool)

(assert (=> b!430185 (= e!254659 e!254663)))

(declare-fun res!252806 () Bool)

(assert (=> b!430185 (=> res!252806 e!254663)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26343 0))(
  ( (array!26344 (arr!12621 (Array (_ BitVec 32) (_ BitVec 64))) (size!12974 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26343)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!430185 (= res!252806 (= k0!794 (select (arr!12621 _keys!709) from!863)))))

(assert (=> b!430185 (not (= (select (arr!12621 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12661 0))(
  ( (Unit!12662) )
))
(declare-fun lt!196639 () Unit!12661)

(declare-fun e!254661 () Unit!12661)

(assert (=> b!430185 (= lt!196639 e!254661)))

(declare-fun c!55422 () Bool)

(assert (=> b!430185 (= c!55422 (= (select (arr!12621 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16115 0))(
  ( (V!16116 (val!5673 Int)) )
))
(declare-datatypes ((tuple2!7482 0))(
  ( (tuple2!7483 (_1!3752 (_ BitVec 64)) (_2!3752 V!16115)) )
))
(declare-datatypes ((List!7480 0))(
  ( (Nil!7477) (Cons!7476 (h!8332 tuple2!7482) (t!13025 List!7480)) )
))
(declare-datatypes ((ListLongMap!6385 0))(
  ( (ListLongMap!6386 (toList!3208 List!7480)) )
))
(declare-fun lt!196642 () ListLongMap!6385)

(declare-fun lt!196634 () ListLongMap!6385)

(assert (=> b!430185 (= lt!196642 lt!196634)))

(declare-fun lt!196635 () ListLongMap!6385)

(declare-fun lt!196638 () tuple2!7482)

(declare-fun +!1385 (ListLongMap!6385 tuple2!7482) ListLongMap!6385)

(assert (=> b!430185 (= lt!196634 (+!1385 lt!196635 lt!196638))))

(declare-fun lt!196644 () V!16115)

(assert (=> b!430185 (= lt!196638 (tuple2!7483 (select (arr!12621 _keys!709) from!863) lt!196644))))

(declare-datatypes ((ValueCell!5285 0))(
  ( (ValueCellFull!5285 (v!7914 V!16115)) (EmptyCell!5285) )
))
(declare-datatypes ((array!26345 0))(
  ( (array!26346 (arr!12622 (Array (_ BitVec 32) ValueCell!5285)) (size!12975 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26345)

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6264 (ValueCell!5285 V!16115) V!16115)

(declare-fun dynLambda!778 (Int (_ BitVec 64)) V!16115)

(assert (=> b!430185 (= lt!196644 (get!6264 (select (arr!12622 _values!549) from!863) (dynLambda!778 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430186 () Bool)

(declare-fun res!252811 () Bool)

(declare-fun e!254660 () Bool)

(assert (=> b!430186 (=> (not res!252811) (not e!254660))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430186 (= res!252811 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12974 _keys!709))))))

(declare-fun b!430187 () Bool)

(declare-fun e!254662 () Bool)

(declare-fun tp_is_empty!11257 () Bool)

(assert (=> b!430187 (= e!254662 tp_is_empty!11257)))

(declare-fun b!430188 () Bool)

(declare-fun res!252816 () Bool)

(declare-fun e!254658 () Bool)

(assert (=> b!430188 (=> (not res!252816) (not e!254658))))

(assert (=> b!430188 (= res!252816 (bvsle from!863 i!563))))

(declare-fun b!430189 () Bool)

(declare-fun e!254667 () Bool)

(assert (=> b!430189 (= e!254667 tp_is_empty!11257)))

(declare-fun mapNonEmpty!18507 () Bool)

(declare-fun mapRes!18507 () Bool)

(declare-fun tp!35844 () Bool)

(assert (=> mapNonEmpty!18507 (= mapRes!18507 (and tp!35844 e!254667))))

(declare-fun mapKey!18507 () (_ BitVec 32))

(declare-fun mapValue!18507 () ValueCell!5285)

(declare-fun mapRest!18507 () (Array (_ BitVec 32) ValueCell!5285))

(assert (=> mapNonEmpty!18507 (= (arr!12622 _values!549) (store mapRest!18507 mapKey!18507 mapValue!18507))))

(declare-fun b!430190 () Bool)

(declare-fun res!252803 () Bool)

(assert (=> b!430190 (=> (not res!252803) (not e!254660))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!430190 (= res!252803 (and (= (size!12975 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12974 _keys!709) (size!12975 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430191 () Bool)

(declare-fun res!252802 () Bool)

(assert (=> b!430191 (=> (not res!252802) (not e!254658))))

(declare-fun lt!196641 () array!26343)

(declare-datatypes ((List!7481 0))(
  ( (Nil!7478) (Cons!7477 (h!8333 (_ BitVec 64)) (t!13026 List!7481)) )
))
(declare-fun arrayNoDuplicates!0 (array!26343 (_ BitVec 32) List!7481) Bool)

(assert (=> b!430191 (= res!252802 (arrayNoDuplicates!0 lt!196641 #b00000000000000000000000000000000 Nil!7478))))

(declare-fun b!430192 () Bool)

(declare-fun Unit!12663 () Unit!12661)

(assert (=> b!430192 (= e!254661 Unit!12663)))

(declare-fun lt!196645 () Unit!12661)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26343 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12661)

(assert (=> b!430192 (= lt!196645 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430192 false))

(declare-fun b!430193 () Bool)

(assert (=> b!430193 (= e!254660 e!254658)))

(declare-fun res!252805 () Bool)

(assert (=> b!430193 (=> (not res!252805) (not e!254658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26343 (_ BitVec 32)) Bool)

(assert (=> b!430193 (= res!252805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196641 mask!1025))))

(assert (=> b!430193 (= lt!196641 (array!26344 (store (arr!12621 _keys!709) i!563 k0!794) (size!12974 _keys!709)))))

(declare-fun b!430194 () Bool)

(declare-fun res!252809 () Bool)

(assert (=> b!430194 (=> (not res!252809) (not e!254660))))

(assert (=> b!430194 (= res!252809 (or (= (select (arr!12621 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12621 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430195 () Bool)

(declare-fun res!252813 () Bool)

(assert (=> b!430195 (=> (not res!252813) (not e!254660))))

(declare-fun arrayContainsKey!0 (array!26343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430195 (= res!252813 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18507 () Bool)

(assert (=> mapIsEmpty!18507 mapRes!18507))

(declare-fun b!430196 () Bool)

(declare-fun res!252814 () Bool)

(assert (=> b!430196 (=> (not res!252814) (not e!254660))))

(assert (=> b!430196 (= res!252814 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7478))))

(declare-fun b!430197 () Bool)

(assert (=> b!430197 (= e!254663 true)))

(declare-fun lt!196640 () ListLongMap!6385)

(declare-fun lt!196636 () tuple2!7482)

(assert (=> b!430197 (= lt!196634 (+!1385 (+!1385 lt!196640 lt!196638) lt!196636))))

(declare-fun lt!196646 () Unit!12661)

(declare-fun v!412 () V!16115)

(declare-fun addCommutativeForDiffKeys!350 (ListLongMap!6385 (_ BitVec 64) V!16115 (_ BitVec 64) V!16115) Unit!12661)

(assert (=> b!430197 (= lt!196646 (addCommutativeForDiffKeys!350 lt!196640 k0!794 v!412 (select (arr!12621 _keys!709) from!863) lt!196644))))

(declare-fun res!252807 () Bool)

(assert (=> start!39824 (=> (not res!252807) (not e!254660))))

(assert (=> start!39824 (= res!252807 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12974 _keys!709))))))

(assert (=> start!39824 e!254660))

(assert (=> start!39824 tp_is_empty!11257))

(assert (=> start!39824 tp!35843))

(assert (=> start!39824 true))

(declare-fun e!254666 () Bool)

(declare-fun array_inv!9220 (array!26345) Bool)

(assert (=> start!39824 (and (array_inv!9220 _values!549) e!254666)))

(declare-fun array_inv!9221 (array!26343) Bool)

(assert (=> start!39824 (array_inv!9221 _keys!709)))

(declare-fun b!430198 () Bool)

(declare-fun res!252808 () Bool)

(assert (=> b!430198 (=> (not res!252808) (not e!254660))))

(assert (=> b!430198 (= res!252808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430199 () Bool)

(assert (=> b!430199 (= e!254666 (and e!254662 mapRes!18507))))

(declare-fun condMapEmpty!18507 () Bool)

(declare-fun mapDefault!18507 () ValueCell!5285)

(assert (=> b!430199 (= condMapEmpty!18507 (= (arr!12622 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5285)) mapDefault!18507)))))

(declare-fun b!430200 () Bool)

(declare-fun e!254665 () Bool)

(assert (=> b!430200 (= e!254665 (not e!254659))))

(declare-fun res!252815 () Bool)

(assert (=> b!430200 (=> res!252815 e!254659)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430200 (= res!252815 (not (validKeyInArray!0 (select (arr!12621 _keys!709) from!863))))))

(declare-fun lt!196632 () ListLongMap!6385)

(assert (=> b!430200 (= lt!196632 lt!196635)))

(assert (=> b!430200 (= lt!196635 (+!1385 lt!196640 lt!196636))))

(declare-fun minValue!515 () V!16115)

(declare-fun zeroValue!515 () V!16115)

(declare-fun lt!196637 () array!26345)

(declare-fun getCurrentListMapNoExtraKeys!1415 (array!26343 array!26345 (_ BitVec 32) (_ BitVec 32) V!16115 V!16115 (_ BitVec 32) Int) ListLongMap!6385)

(assert (=> b!430200 (= lt!196632 (getCurrentListMapNoExtraKeys!1415 lt!196641 lt!196637 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430200 (= lt!196636 (tuple2!7483 k0!794 v!412))))

(assert (=> b!430200 (= lt!196640 (getCurrentListMapNoExtraKeys!1415 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196643 () Unit!12661)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!549 (array!26343 array!26345 (_ BitVec 32) (_ BitVec 32) V!16115 V!16115 (_ BitVec 32) (_ BitVec 64) V!16115 (_ BitVec 32) Int) Unit!12661)

(assert (=> b!430200 (= lt!196643 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!549 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430201 () Bool)

(declare-fun res!252804 () Bool)

(assert (=> b!430201 (=> (not res!252804) (not e!254660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430201 (= res!252804 (validMask!0 mask!1025))))

(declare-fun b!430202 () Bool)

(assert (=> b!430202 (= e!254658 e!254665)))

(declare-fun res!252810 () Bool)

(assert (=> b!430202 (=> (not res!252810) (not e!254665))))

(assert (=> b!430202 (= res!252810 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!430202 (= lt!196642 (getCurrentListMapNoExtraKeys!1415 lt!196641 lt!196637 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430202 (= lt!196637 (array!26346 (store (arr!12622 _values!549) i!563 (ValueCellFull!5285 v!412)) (size!12975 _values!549)))))

(declare-fun lt!196633 () ListLongMap!6385)

(assert (=> b!430202 (= lt!196633 (getCurrentListMapNoExtraKeys!1415 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430203 () Bool)

(declare-fun Unit!12664 () Unit!12661)

(assert (=> b!430203 (= e!254661 Unit!12664)))

(declare-fun b!430204 () Bool)

(declare-fun res!252812 () Bool)

(assert (=> b!430204 (=> (not res!252812) (not e!254660))))

(assert (=> b!430204 (= res!252812 (validKeyInArray!0 k0!794))))

(assert (= (and start!39824 res!252807) b!430201))

(assert (= (and b!430201 res!252804) b!430190))

(assert (= (and b!430190 res!252803) b!430198))

(assert (= (and b!430198 res!252808) b!430196))

(assert (= (and b!430196 res!252814) b!430186))

(assert (= (and b!430186 res!252811) b!430204))

(assert (= (and b!430204 res!252812) b!430194))

(assert (= (and b!430194 res!252809) b!430195))

(assert (= (and b!430195 res!252813) b!430193))

(assert (= (and b!430193 res!252805) b!430191))

(assert (= (and b!430191 res!252802) b!430188))

(assert (= (and b!430188 res!252816) b!430202))

(assert (= (and b!430202 res!252810) b!430200))

(assert (= (and b!430200 (not res!252815)) b!430185))

(assert (= (and b!430185 c!55422) b!430192))

(assert (= (and b!430185 (not c!55422)) b!430203))

(assert (= (and b!430185 (not res!252806)) b!430197))

(assert (= (and b!430199 condMapEmpty!18507) mapIsEmpty!18507))

(assert (= (and b!430199 (not condMapEmpty!18507)) mapNonEmpty!18507))

(get-info :version)

(assert (= (and mapNonEmpty!18507 ((_ is ValueCellFull!5285) mapValue!18507)) b!430189))

(assert (= (and b!430199 ((_ is ValueCellFull!5285) mapDefault!18507)) b!430187))

(assert (= start!39824 b!430199))

(declare-fun b_lambda!9175 () Bool)

(assert (=> (not b_lambda!9175) (not b!430185)))

(declare-fun t!13024 () Bool)

(declare-fun tb!3503 () Bool)

(assert (=> (and start!39824 (= defaultEntry!557 defaultEntry!557) t!13024) tb!3503))

(declare-fun result!6541 () Bool)

(assert (=> tb!3503 (= result!6541 tp_is_empty!11257)))

(assert (=> b!430185 t!13024))

(declare-fun b_and!17845 () Bool)

(assert (= b_and!17843 (and (=> t!13024 result!6541) b_and!17845)))

(declare-fun m!417933 () Bool)

(assert (=> b!430200 m!417933))

(declare-fun m!417935 () Bool)

(assert (=> b!430200 m!417935))

(declare-fun m!417937 () Bool)

(assert (=> b!430200 m!417937))

(declare-fun m!417939 () Bool)

(assert (=> b!430200 m!417939))

(assert (=> b!430200 m!417933))

(declare-fun m!417941 () Bool)

(assert (=> b!430200 m!417941))

(declare-fun m!417943 () Bool)

(assert (=> b!430200 m!417943))

(declare-fun m!417945 () Bool)

(assert (=> b!430191 m!417945))

(declare-fun m!417947 () Bool)

(assert (=> b!430197 m!417947))

(assert (=> b!430197 m!417947))

(declare-fun m!417949 () Bool)

(assert (=> b!430197 m!417949))

(assert (=> b!430197 m!417933))

(assert (=> b!430197 m!417933))

(declare-fun m!417951 () Bool)

(assert (=> b!430197 m!417951))

(declare-fun m!417953 () Bool)

(assert (=> b!430202 m!417953))

(declare-fun m!417955 () Bool)

(assert (=> b!430202 m!417955))

(declare-fun m!417957 () Bool)

(assert (=> b!430202 m!417957))

(declare-fun m!417959 () Bool)

(assert (=> mapNonEmpty!18507 m!417959))

(declare-fun m!417961 () Bool)

(assert (=> b!430196 m!417961))

(declare-fun m!417963 () Bool)

(assert (=> b!430201 m!417963))

(declare-fun m!417965 () Bool)

(assert (=> b!430194 m!417965))

(declare-fun m!417967 () Bool)

(assert (=> start!39824 m!417967))

(declare-fun m!417969 () Bool)

(assert (=> start!39824 m!417969))

(declare-fun m!417971 () Bool)

(assert (=> b!430195 m!417971))

(declare-fun m!417973 () Bool)

(assert (=> b!430192 m!417973))

(declare-fun m!417975 () Bool)

(assert (=> b!430193 m!417975))

(declare-fun m!417977 () Bool)

(assert (=> b!430193 m!417977))

(assert (=> b!430185 m!417933))

(declare-fun m!417979 () Bool)

(assert (=> b!430185 m!417979))

(declare-fun m!417981 () Bool)

(assert (=> b!430185 m!417981))

(assert (=> b!430185 m!417981))

(assert (=> b!430185 m!417979))

(declare-fun m!417983 () Bool)

(assert (=> b!430185 m!417983))

(declare-fun m!417985 () Bool)

(assert (=> b!430185 m!417985))

(declare-fun m!417987 () Bool)

(assert (=> b!430198 m!417987))

(declare-fun m!417989 () Bool)

(assert (=> b!430204 m!417989))

(check-sat (not b!430192) (not b!430204) (not b!430198) (not mapNonEmpty!18507) (not b!430201) (not b!430202) (not b_next!10105) (not b!430191) (not b!430193) b_and!17845 (not b_lambda!9175) (not b!430197) (not start!39824) tp_is_empty!11257 (not b!430185) (not b!430195) (not b!430196) (not b!430200))
(check-sat b_and!17845 (not b_next!10105))
