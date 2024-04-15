; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20542 () Bool)

(assert start!20542)

(declare-fun b_free!5197 () Bool)

(declare-fun b_next!5197 () Bool)

(assert (=> start!20542 (= b_free!5197 (not b_next!5197))))

(declare-fun tp!18623 () Bool)

(declare-fun b_and!11917 () Bool)

(assert (=> start!20542 (= tp!18623 b_and!11917)))

(declare-fun b!204036 () Bool)

(declare-fun res!98223 () Bool)

(declare-fun e!133516 () Bool)

(assert (=> b!204036 (=> (not res!98223) (not e!133516))))

(declare-datatypes ((array!9311 0))(
  ( (array!9312 (arr!4405 (Array (_ BitVec 32) (_ BitVec 64))) (size!4731 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9311)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9311 (_ BitVec 32)) Bool)

(assert (=> b!204036 (= res!98223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204037 () Bool)

(declare-fun e!133518 () Bool)

(declare-fun tp_is_empty!5053 () Bool)

(assert (=> b!204037 (= e!133518 tp_is_empty!5053)))

(declare-fun b!204038 () Bool)

(declare-fun res!98217 () Bool)

(assert (=> b!204038 (=> (not res!98217) (not e!133516))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6385 0))(
  ( (V!6386 (val!2571 Int)) )
))
(declare-datatypes ((ValueCell!2183 0))(
  ( (ValueCellFull!2183 (v!4535 V!6385)) (EmptyCell!2183) )
))
(declare-datatypes ((array!9313 0))(
  ( (array!9314 (arr!4406 (Array (_ BitVec 32) ValueCell!2183)) (size!4732 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9313)

(assert (=> b!204038 (= res!98217 (and (= (size!4732 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4731 _keys!825) (size!4732 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204039 () Bool)

(declare-fun e!133517 () Bool)

(assert (=> b!204039 (= e!133516 (not e!133517))))

(declare-fun res!98219 () Bool)

(assert (=> b!204039 (=> res!98219 e!133517)))

(assert (=> b!204039 (= res!98219 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3880 0))(
  ( (tuple2!3881 (_1!1951 (_ BitVec 64)) (_2!1951 V!6385)) )
))
(declare-datatypes ((List!2787 0))(
  ( (Nil!2784) (Cons!2783 (h!3425 tuple2!3880) (t!7709 List!2787)) )
))
(declare-datatypes ((ListLongMap!2783 0))(
  ( (ListLongMap!2784 (toList!1407 List!2787)) )
))
(declare-fun lt!103187 () ListLongMap!2783)

(declare-fun zeroValue!615 () V!6385)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6385)

(declare-fun getCurrentListMap!956 (array!9311 array!9313 (_ BitVec 32) (_ BitVec 32) V!6385 V!6385 (_ BitVec 32) Int) ListLongMap!2783)

(assert (=> b!204039 (= lt!103187 (getCurrentListMap!956 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103179 () ListLongMap!2783)

(declare-fun lt!103180 () array!9313)

(assert (=> b!204039 (= lt!103179 (getCurrentListMap!956 _keys!825 lt!103180 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103186 () ListLongMap!2783)

(declare-fun lt!103183 () ListLongMap!2783)

(assert (=> b!204039 (and (= lt!103186 lt!103183) (= lt!103183 lt!103186))))

(declare-fun lt!103189 () ListLongMap!2783)

(declare-fun lt!103185 () tuple2!3880)

(declare-fun +!456 (ListLongMap!2783 tuple2!3880) ListLongMap!2783)

(assert (=> b!204039 (= lt!103183 (+!456 lt!103189 lt!103185))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6385)

(assert (=> b!204039 (= lt!103185 (tuple2!3881 k0!843 v!520))))

(declare-datatypes ((Unit!6156 0))(
  ( (Unit!6157) )
))
(declare-fun lt!103188 () Unit!6156)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!115 (array!9311 array!9313 (_ BitVec 32) (_ BitVec 32) V!6385 V!6385 (_ BitVec 32) (_ BitVec 64) V!6385 (_ BitVec 32) Int) Unit!6156)

(assert (=> b!204039 (= lt!103188 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!115 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!366 (array!9311 array!9313 (_ BitVec 32) (_ BitVec 32) V!6385 V!6385 (_ BitVec 32) Int) ListLongMap!2783)

(assert (=> b!204039 (= lt!103186 (getCurrentListMapNoExtraKeys!366 _keys!825 lt!103180 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204039 (= lt!103180 (array!9314 (store (arr!4406 _values!649) i!601 (ValueCellFull!2183 v!520)) (size!4732 _values!649)))))

(assert (=> b!204039 (= lt!103189 (getCurrentListMapNoExtraKeys!366 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204040 () Bool)

(declare-fun e!133521 () Bool)

(declare-fun e!133515 () Bool)

(declare-fun mapRes!8648 () Bool)

(assert (=> b!204040 (= e!133521 (and e!133515 mapRes!8648))))

(declare-fun condMapEmpty!8648 () Bool)

(declare-fun mapDefault!8648 () ValueCell!2183)

(assert (=> b!204040 (= condMapEmpty!8648 (= (arr!4406 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2183)) mapDefault!8648)))))

(declare-fun b!204041 () Bool)

(declare-fun res!98220 () Bool)

(assert (=> b!204041 (=> (not res!98220) (not e!133516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204041 (= res!98220 (validKeyInArray!0 k0!843))))

(declare-fun b!204042 () Bool)

(assert (=> b!204042 (= e!133515 tp_is_empty!5053)))

(declare-fun mapNonEmpty!8648 () Bool)

(declare-fun tp!18622 () Bool)

(assert (=> mapNonEmpty!8648 (= mapRes!8648 (and tp!18622 e!133518))))

(declare-fun mapKey!8648 () (_ BitVec 32))

(declare-fun mapRest!8648 () (Array (_ BitVec 32) ValueCell!2183))

(declare-fun mapValue!8648 () ValueCell!2183)

(assert (=> mapNonEmpty!8648 (= (arr!4406 _values!649) (store mapRest!8648 mapKey!8648 mapValue!8648))))

(declare-fun b!204043 () Bool)

(declare-fun res!98222 () Bool)

(assert (=> b!204043 (=> (not res!98222) (not e!133516))))

(declare-datatypes ((List!2788 0))(
  ( (Nil!2785) (Cons!2784 (h!3426 (_ BitVec 64)) (t!7710 List!2788)) )
))
(declare-fun arrayNoDuplicates!0 (array!9311 (_ BitVec 32) List!2788) Bool)

(assert (=> b!204043 (= res!98222 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2785))))

(declare-fun b!204044 () Bool)

(declare-fun res!98221 () Bool)

(assert (=> b!204044 (=> (not res!98221) (not e!133516))))

(assert (=> b!204044 (= res!98221 (= (select (arr!4405 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8648 () Bool)

(assert (=> mapIsEmpty!8648 mapRes!8648))

(declare-fun b!204045 () Bool)

(declare-fun e!133520 () Bool)

(assert (=> b!204045 (= e!133517 e!133520)))

(declare-fun res!98225 () Bool)

(assert (=> b!204045 (=> res!98225 e!133520)))

(assert (=> b!204045 (= res!98225 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103181 () ListLongMap!2783)

(assert (=> b!204045 (= lt!103179 lt!103181)))

(declare-fun lt!103184 () tuple2!3880)

(assert (=> b!204045 (= lt!103181 (+!456 lt!103183 lt!103184))))

(declare-fun lt!103190 () ListLongMap!2783)

(assert (=> b!204045 (= lt!103187 lt!103190)))

(assert (=> b!204045 (= lt!103190 (+!456 lt!103189 lt!103184))))

(assert (=> b!204045 (= lt!103179 (+!456 lt!103186 lt!103184))))

(assert (=> b!204045 (= lt!103184 (tuple2!3881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!98218 () Bool)

(assert (=> start!20542 (=> (not res!98218) (not e!133516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20542 (= res!98218 (validMask!0 mask!1149))))

(assert (=> start!20542 e!133516))

(declare-fun array_inv!2891 (array!9313) Bool)

(assert (=> start!20542 (and (array_inv!2891 _values!649) e!133521)))

(assert (=> start!20542 true))

(assert (=> start!20542 tp_is_empty!5053))

(declare-fun array_inv!2892 (array!9311) Bool)

(assert (=> start!20542 (array_inv!2892 _keys!825)))

(assert (=> start!20542 tp!18623))

(declare-fun b!204046 () Bool)

(declare-fun res!98224 () Bool)

(assert (=> b!204046 (=> (not res!98224) (not e!133516))))

(assert (=> b!204046 (= res!98224 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4731 _keys!825))))))

(declare-fun b!204047 () Bool)

(assert (=> b!204047 (= e!133520 true)))

(assert (=> b!204047 (= lt!103181 (+!456 lt!103190 lt!103185))))

(declare-fun lt!103182 () Unit!6156)

(declare-fun addCommutativeForDiffKeys!149 (ListLongMap!2783 (_ BitVec 64) V!6385 (_ BitVec 64) V!6385) Unit!6156)

(assert (=> b!204047 (= lt!103182 (addCommutativeForDiffKeys!149 lt!103189 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (= (and start!20542 res!98218) b!204038))

(assert (= (and b!204038 res!98217) b!204036))

(assert (= (and b!204036 res!98223) b!204043))

(assert (= (and b!204043 res!98222) b!204046))

(assert (= (and b!204046 res!98224) b!204041))

(assert (= (and b!204041 res!98220) b!204044))

(assert (= (and b!204044 res!98221) b!204039))

(assert (= (and b!204039 (not res!98219)) b!204045))

(assert (= (and b!204045 (not res!98225)) b!204047))

(assert (= (and b!204040 condMapEmpty!8648) mapIsEmpty!8648))

(assert (= (and b!204040 (not condMapEmpty!8648)) mapNonEmpty!8648))

(get-info :version)

(assert (= (and mapNonEmpty!8648 ((_ is ValueCellFull!2183) mapValue!8648)) b!204037))

(assert (= (and b!204040 ((_ is ValueCellFull!2183) mapDefault!8648)) b!204042))

(assert (= start!20542 b!204040))

(declare-fun m!231075 () Bool)

(assert (=> b!204047 m!231075))

(declare-fun m!231077 () Bool)

(assert (=> b!204047 m!231077))

(declare-fun m!231079 () Bool)

(assert (=> b!204043 m!231079))

(declare-fun m!231081 () Bool)

(assert (=> b!204044 m!231081))

(declare-fun m!231083 () Bool)

(assert (=> b!204036 m!231083))

(declare-fun m!231085 () Bool)

(assert (=> start!20542 m!231085))

(declare-fun m!231087 () Bool)

(assert (=> start!20542 m!231087))

(declare-fun m!231089 () Bool)

(assert (=> start!20542 m!231089))

(declare-fun m!231091 () Bool)

(assert (=> b!204039 m!231091))

(declare-fun m!231093 () Bool)

(assert (=> b!204039 m!231093))

(declare-fun m!231095 () Bool)

(assert (=> b!204039 m!231095))

(declare-fun m!231097 () Bool)

(assert (=> b!204039 m!231097))

(declare-fun m!231099 () Bool)

(assert (=> b!204039 m!231099))

(declare-fun m!231101 () Bool)

(assert (=> b!204039 m!231101))

(declare-fun m!231103 () Bool)

(assert (=> b!204039 m!231103))

(declare-fun m!231105 () Bool)

(assert (=> b!204041 m!231105))

(declare-fun m!231107 () Bool)

(assert (=> mapNonEmpty!8648 m!231107))

(declare-fun m!231109 () Bool)

(assert (=> b!204045 m!231109))

(declare-fun m!231111 () Bool)

(assert (=> b!204045 m!231111))

(declare-fun m!231113 () Bool)

(assert (=> b!204045 m!231113))

(check-sat (not start!20542) (not b!204039) b_and!11917 (not b!204036) (not b!204043) (not b!204047) (not mapNonEmpty!8648) (not b!204045) tp_is_empty!5053 (not b_next!5197) (not b!204041))
(check-sat b_and!11917 (not b_next!5197))
