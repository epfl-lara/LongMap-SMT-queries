; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40020 () Bool)

(assert start!40020)

(declare-fun b_free!10287 () Bool)

(declare-fun b_next!10287 () Bool)

(assert (=> start!40020 (= b_free!10287 (not b_next!10287))))

(declare-fun tp!36389 () Bool)

(declare-fun b_and!18233 () Bool)

(assert (=> start!40020 (= tp!36389 b_and!18233)))

(declare-fun b!436098 () Bool)

(declare-fun res!257033 () Bool)

(declare-fun e!257567 () Bool)

(assert (=> b!436098 (=> (not res!257033) (not e!257567))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436098 (= res!257033 (bvsle from!863 i!563))))

(declare-fun b!436099 () Bool)

(declare-fun e!257564 () Bool)

(declare-fun tp_is_empty!11439 () Bool)

(assert (=> b!436099 (= e!257564 tp_is_empty!11439)))

(declare-fun b!436100 () Bool)

(declare-fun res!257035 () Bool)

(declare-fun e!257569 () Bool)

(assert (=> b!436100 (=> (not res!257035) (not e!257569))))

(declare-datatypes ((array!26703 0))(
  ( (array!26704 (arr!12801 (Array (_ BitVec 32) (_ BitVec 64))) (size!13153 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26703)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436100 (= res!257035 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436101 () Bool)

(declare-fun e!257570 () Bool)

(assert (=> b!436101 (= e!257570 true)))

(declare-datatypes ((V!16357 0))(
  ( (V!16358 (val!5764 Int)) )
))
(declare-datatypes ((tuple2!7634 0))(
  ( (tuple2!7635 (_1!3828 (_ BitVec 64)) (_2!3828 V!16357)) )
))
(declare-fun lt!200970 () tuple2!7634)

(declare-fun lt!200969 () tuple2!7634)

(declare-datatypes ((List!7635 0))(
  ( (Nil!7632) (Cons!7631 (h!8487 tuple2!7634) (t!13371 List!7635)) )
))
(declare-datatypes ((ListLongMap!6547 0))(
  ( (ListLongMap!6548 (toList!3289 List!7635)) )
))
(declare-fun lt!200966 () ListLongMap!6547)

(declare-fun lt!200971 () ListLongMap!6547)

(declare-fun +!1437 (ListLongMap!6547 tuple2!7634) ListLongMap!6547)

(assert (=> b!436101 (= lt!200971 (+!1437 (+!1437 lt!200966 lt!200970) lt!200969))))

(declare-datatypes ((Unit!12961 0))(
  ( (Unit!12962) )
))
(declare-fun lt!200963 () Unit!12961)

(declare-fun lt!200975 () V!16357)

(declare-fun v!412 () V!16357)

(declare-fun addCommutativeForDiffKeys!419 (ListLongMap!6547 (_ BitVec 64) V!16357 (_ BitVec 64) V!16357) Unit!12961)

(assert (=> b!436101 (= lt!200963 (addCommutativeForDiffKeys!419 lt!200966 k0!794 v!412 (select (arr!12801 _keys!709) from!863) lt!200975))))

(declare-fun b!436102 () Bool)

(declare-fun e!257571 () Bool)

(declare-fun e!257566 () Bool)

(assert (=> b!436102 (= e!257571 (not e!257566))))

(declare-fun res!257032 () Bool)

(assert (=> b!436102 (=> res!257032 e!257566)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436102 (= res!257032 (not (validKeyInArray!0 (select (arr!12801 _keys!709) from!863))))))

(declare-fun lt!200967 () ListLongMap!6547)

(declare-fun lt!200961 () ListLongMap!6547)

(assert (=> b!436102 (= lt!200967 lt!200961)))

(assert (=> b!436102 (= lt!200961 (+!1437 lt!200966 lt!200969))))

(declare-fun minValue!515 () V!16357)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16357)

(declare-fun lt!200972 () array!26703)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5376 0))(
  ( (ValueCellFull!5376 (v!8011 V!16357)) (EmptyCell!5376) )
))
(declare-datatypes ((array!26705 0))(
  ( (array!26706 (arr!12802 (Array (_ BitVec 32) ValueCell!5376)) (size!13154 (_ BitVec 32))) )
))
(declare-fun lt!200974 () array!26705)

(declare-fun getCurrentListMapNoExtraKeys!1479 (array!26703 array!26705 (_ BitVec 32) (_ BitVec 32) V!16357 V!16357 (_ BitVec 32) Int) ListLongMap!6547)

(assert (=> b!436102 (= lt!200967 (getCurrentListMapNoExtraKeys!1479 lt!200972 lt!200974 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!436102 (= lt!200969 (tuple2!7635 k0!794 v!412))))

(declare-fun _values!549 () array!26705)

(assert (=> b!436102 (= lt!200966 (getCurrentListMapNoExtraKeys!1479 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200964 () Unit!12961)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!608 (array!26703 array!26705 (_ BitVec 32) (_ BitVec 32) V!16357 V!16357 (_ BitVec 32) (_ BitVec 64) V!16357 (_ BitVec 32) Int) Unit!12961)

(assert (=> b!436102 (= lt!200964 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!608 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436103 () Bool)

(declare-fun res!257028 () Bool)

(assert (=> b!436103 (=> (not res!257028) (not e!257569))))

(declare-datatypes ((List!7636 0))(
  ( (Nil!7633) (Cons!7632 (h!8488 (_ BitVec 64)) (t!13372 List!7636)) )
))
(declare-fun arrayNoDuplicates!0 (array!26703 (_ BitVec 32) List!7636) Bool)

(assert (=> b!436103 (= res!257028 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7633))))

(declare-fun mapIsEmpty!18780 () Bool)

(declare-fun mapRes!18780 () Bool)

(assert (=> mapIsEmpty!18780 mapRes!18780))

(declare-fun b!436104 () Bool)

(declare-fun res!257031 () Bool)

(assert (=> b!436104 (=> (not res!257031) (not e!257569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436104 (= res!257031 (validMask!0 mask!1025))))

(declare-fun b!436105 () Bool)

(declare-fun res!257026 () Bool)

(assert (=> b!436105 (=> (not res!257026) (not e!257569))))

(assert (=> b!436105 (= res!257026 (or (= (select (arr!12801 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12801 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436106 () Bool)

(declare-fun e!257568 () Unit!12961)

(declare-fun Unit!12963 () Unit!12961)

(assert (=> b!436106 (= e!257568 Unit!12963)))

(declare-fun b!436107 () Bool)

(declare-fun res!257037 () Bool)

(assert (=> b!436107 (=> (not res!257037) (not e!257569))))

(assert (=> b!436107 (= res!257037 (validKeyInArray!0 k0!794))))

(declare-fun b!436108 () Bool)

(declare-fun res!257036 () Bool)

(assert (=> b!436108 (=> (not res!257036) (not e!257569))))

(assert (=> b!436108 (= res!257036 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13153 _keys!709))))))

(declare-fun b!436109 () Bool)

(declare-fun res!257040 () Bool)

(assert (=> b!436109 (=> (not res!257040) (not e!257567))))

(assert (=> b!436109 (= res!257040 (arrayNoDuplicates!0 lt!200972 #b00000000000000000000000000000000 Nil!7633))))

(declare-fun b!436110 () Bool)

(declare-fun Unit!12964 () Unit!12961)

(assert (=> b!436110 (= e!257568 Unit!12964)))

(declare-fun lt!200965 () Unit!12961)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26703 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12961)

(assert (=> b!436110 (= lt!200965 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!436110 false))

(declare-fun b!436111 () Bool)

(assert (=> b!436111 (= e!257569 e!257567)))

(declare-fun res!257038 () Bool)

(assert (=> b!436111 (=> (not res!257038) (not e!257567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26703 (_ BitVec 32)) Bool)

(assert (=> b!436111 (= res!257038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200972 mask!1025))))

(assert (=> b!436111 (= lt!200972 (array!26704 (store (arr!12801 _keys!709) i!563 k0!794) (size!13153 _keys!709)))))

(declare-fun res!257030 () Bool)

(assert (=> start!40020 (=> (not res!257030) (not e!257569))))

(assert (=> start!40020 (= res!257030 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13153 _keys!709))))))

(assert (=> start!40020 e!257569))

(assert (=> start!40020 tp_is_empty!11439))

(assert (=> start!40020 tp!36389))

(assert (=> start!40020 true))

(declare-fun e!257563 () Bool)

(declare-fun array_inv!9304 (array!26705) Bool)

(assert (=> start!40020 (and (array_inv!9304 _values!549) e!257563)))

(declare-fun array_inv!9305 (array!26703) Bool)

(assert (=> start!40020 (array_inv!9305 _keys!709)))

(declare-fun b!436112 () Bool)

(assert (=> b!436112 (= e!257567 e!257571)))

(declare-fun res!257029 () Bool)

(assert (=> b!436112 (=> (not res!257029) (not e!257571))))

(assert (=> b!436112 (= res!257029 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!200968 () ListLongMap!6547)

(assert (=> b!436112 (= lt!200968 (getCurrentListMapNoExtraKeys!1479 lt!200972 lt!200974 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436112 (= lt!200974 (array!26706 (store (arr!12802 _values!549) i!563 (ValueCellFull!5376 v!412)) (size!13154 _values!549)))))

(declare-fun lt!200962 () ListLongMap!6547)

(assert (=> b!436112 (= lt!200962 (getCurrentListMapNoExtraKeys!1479 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436113 () Bool)

(declare-fun res!257027 () Bool)

(assert (=> b!436113 (=> (not res!257027) (not e!257569))))

(assert (=> b!436113 (= res!257027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436114 () Bool)

(assert (=> b!436114 (= e!257566 e!257570)))

(declare-fun res!257034 () Bool)

(assert (=> b!436114 (=> res!257034 e!257570)))

(assert (=> b!436114 (= res!257034 (= k0!794 (select (arr!12801 _keys!709) from!863)))))

(assert (=> b!436114 (not (= (select (arr!12801 _keys!709) from!863) k0!794))))

(declare-fun lt!200973 () Unit!12961)

(assert (=> b!436114 (= lt!200973 e!257568)))

(declare-fun c!55766 () Bool)

(assert (=> b!436114 (= c!55766 (= (select (arr!12801 _keys!709) from!863) k0!794))))

(assert (=> b!436114 (= lt!200968 lt!200971)))

(assert (=> b!436114 (= lt!200971 (+!1437 lt!200961 lt!200970))))

(assert (=> b!436114 (= lt!200970 (tuple2!7635 (select (arr!12801 _keys!709) from!863) lt!200975))))

(declare-fun get!6385 (ValueCell!5376 V!16357) V!16357)

(declare-fun dynLambda!842 (Int (_ BitVec 64)) V!16357)

(assert (=> b!436114 (= lt!200975 (get!6385 (select (arr!12802 _values!549) from!863) (dynLambda!842 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436115 () Bool)

(declare-fun res!257039 () Bool)

(assert (=> b!436115 (=> (not res!257039) (not e!257569))))

(assert (=> b!436115 (= res!257039 (and (= (size!13154 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13153 _keys!709) (size!13154 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436116 () Bool)

(declare-fun e!257562 () Bool)

(assert (=> b!436116 (= e!257562 tp_is_empty!11439)))

(declare-fun b!436117 () Bool)

(assert (=> b!436117 (= e!257563 (and e!257562 mapRes!18780))))

(declare-fun condMapEmpty!18780 () Bool)

(declare-fun mapDefault!18780 () ValueCell!5376)

(assert (=> b!436117 (= condMapEmpty!18780 (= (arr!12802 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5376)) mapDefault!18780)))))

(declare-fun mapNonEmpty!18780 () Bool)

(declare-fun tp!36390 () Bool)

(assert (=> mapNonEmpty!18780 (= mapRes!18780 (and tp!36390 e!257564))))

(declare-fun mapValue!18780 () ValueCell!5376)

(declare-fun mapRest!18780 () (Array (_ BitVec 32) ValueCell!5376))

(declare-fun mapKey!18780 () (_ BitVec 32))

(assert (=> mapNonEmpty!18780 (= (arr!12802 _values!549) (store mapRest!18780 mapKey!18780 mapValue!18780))))

(assert (= (and start!40020 res!257030) b!436104))

(assert (= (and b!436104 res!257031) b!436115))

(assert (= (and b!436115 res!257039) b!436113))

(assert (= (and b!436113 res!257027) b!436103))

(assert (= (and b!436103 res!257028) b!436108))

(assert (= (and b!436108 res!257036) b!436107))

(assert (= (and b!436107 res!257037) b!436105))

(assert (= (and b!436105 res!257026) b!436100))

(assert (= (and b!436100 res!257035) b!436111))

(assert (= (and b!436111 res!257038) b!436109))

(assert (= (and b!436109 res!257040) b!436098))

(assert (= (and b!436098 res!257033) b!436112))

(assert (= (and b!436112 res!257029) b!436102))

(assert (= (and b!436102 (not res!257032)) b!436114))

(assert (= (and b!436114 c!55766) b!436110))

(assert (= (and b!436114 (not c!55766)) b!436106))

(assert (= (and b!436114 (not res!257034)) b!436101))

(assert (= (and b!436117 condMapEmpty!18780) mapIsEmpty!18780))

(assert (= (and b!436117 (not condMapEmpty!18780)) mapNonEmpty!18780))

(get-info :version)

(assert (= (and mapNonEmpty!18780 ((_ is ValueCellFull!5376) mapValue!18780)) b!436099))

(assert (= (and b!436117 ((_ is ValueCellFull!5376) mapDefault!18780)) b!436116))

(assert (= start!40020 b!436117))

(declare-fun b_lambda!9375 () Bool)

(assert (=> (not b_lambda!9375) (not b!436114)))

(declare-fun t!13370 () Bool)

(declare-fun tb!3693 () Bool)

(assert (=> (and start!40020 (= defaultEntry!557 defaultEntry!557) t!13370) tb!3693))

(declare-fun result!6913 () Bool)

(assert (=> tb!3693 (= result!6913 tp_is_empty!11439)))

(assert (=> b!436114 t!13370))

(declare-fun b_and!18235 () Bool)

(assert (= b_and!18233 (and (=> t!13370 result!6913) b_and!18235)))

(declare-fun m!423943 () Bool)

(assert (=> b!436110 m!423943))

(declare-fun m!423945 () Bool)

(assert (=> b!436113 m!423945))

(declare-fun m!423947 () Bool)

(assert (=> b!436100 m!423947))

(declare-fun m!423949 () Bool)

(assert (=> b!436104 m!423949))

(declare-fun m!423951 () Bool)

(assert (=> b!436112 m!423951))

(declare-fun m!423953 () Bool)

(assert (=> b!436112 m!423953))

(declare-fun m!423955 () Bool)

(assert (=> b!436112 m!423955))

(declare-fun m!423957 () Bool)

(assert (=> mapNonEmpty!18780 m!423957))

(declare-fun m!423959 () Bool)

(assert (=> b!436101 m!423959))

(assert (=> b!436101 m!423959))

(declare-fun m!423961 () Bool)

(assert (=> b!436101 m!423961))

(declare-fun m!423963 () Bool)

(assert (=> b!436101 m!423963))

(assert (=> b!436101 m!423963))

(declare-fun m!423965 () Bool)

(assert (=> b!436101 m!423965))

(declare-fun m!423967 () Bool)

(assert (=> start!40020 m!423967))

(declare-fun m!423969 () Bool)

(assert (=> start!40020 m!423969))

(assert (=> b!436102 m!423963))

(declare-fun m!423971 () Bool)

(assert (=> b!436102 m!423971))

(declare-fun m!423973 () Bool)

(assert (=> b!436102 m!423973))

(declare-fun m!423975 () Bool)

(assert (=> b!436102 m!423975))

(assert (=> b!436102 m!423963))

(declare-fun m!423977 () Bool)

(assert (=> b!436102 m!423977))

(declare-fun m!423979 () Bool)

(assert (=> b!436102 m!423979))

(declare-fun m!423981 () Bool)

(assert (=> b!436107 m!423981))

(declare-fun m!423983 () Bool)

(assert (=> b!436111 m!423983))

(declare-fun m!423985 () Bool)

(assert (=> b!436111 m!423985))

(declare-fun m!423987 () Bool)

(assert (=> b!436109 m!423987))

(declare-fun m!423989 () Bool)

(assert (=> b!436103 m!423989))

(declare-fun m!423991 () Bool)

(assert (=> b!436105 m!423991))

(assert (=> b!436114 m!423963))

(declare-fun m!423993 () Bool)

(assert (=> b!436114 m!423993))

(declare-fun m!423995 () Bool)

(assert (=> b!436114 m!423995))

(assert (=> b!436114 m!423995))

(assert (=> b!436114 m!423993))

(declare-fun m!423997 () Bool)

(assert (=> b!436114 m!423997))

(declare-fun m!423999 () Bool)

(assert (=> b!436114 m!423999))

(check-sat (not b!436100) (not b!436101) (not b!436104) (not b_lambda!9375) (not b!436111) (not start!40020) (not b!436103) b_and!18235 (not b!436114) (not b!436109) (not b_next!10287) (not b!436102) tp_is_empty!11439 (not b!436112) (not b!436110) (not b!436113) (not b!436107) (not mapNonEmpty!18780))
(check-sat b_and!18235 (not b_next!10287))
