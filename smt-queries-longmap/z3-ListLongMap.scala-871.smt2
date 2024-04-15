; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20326 () Bool)

(assert start!20326)

(declare-fun b_free!4981 () Bool)

(declare-fun b_next!4981 () Bool)

(assert (=> start!20326 (= b_free!4981 (not b_next!4981))))

(declare-fun tp!17974 () Bool)

(declare-fun b_and!11701 () Bool)

(assert (=> start!20326 (= tp!17974 b_and!11701)))

(declare-fun b!200146 () Bool)

(declare-fun res!95301 () Bool)

(declare-fun e!131255 () Bool)

(assert (=> b!200146 (=> (not res!95301) (not e!131255))))

(declare-datatypes ((array!8891 0))(
  ( (array!8892 (arr!4195 (Array (_ BitVec 32) (_ BitVec 64))) (size!4521 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8891)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8891 (_ BitVec 32)) Bool)

(assert (=> b!200146 (= res!95301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200147 () Bool)

(declare-fun res!95299 () Bool)

(assert (=> b!200147 (=> (not res!95299) (not e!131255))))

(declare-datatypes ((List!2620 0))(
  ( (Nil!2617) (Cons!2616 (h!3258 (_ BitVec 64)) (t!7542 List!2620)) )
))
(declare-fun arrayNoDuplicates!0 (array!8891 (_ BitVec 32) List!2620) Bool)

(assert (=> b!200147 (= res!95299 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2617))))

(declare-fun b!200148 () Bool)

(declare-fun e!131256 () Bool)

(declare-fun e!131259 () Bool)

(declare-fun mapRes!8324 () Bool)

(assert (=> b!200148 (= e!131256 (and e!131259 mapRes!8324))))

(declare-fun condMapEmpty!8324 () Bool)

(declare-datatypes ((V!6097 0))(
  ( (V!6098 (val!2463 Int)) )
))
(declare-datatypes ((ValueCell!2075 0))(
  ( (ValueCellFull!2075 (v!4427 V!6097)) (EmptyCell!2075) )
))
(declare-datatypes ((array!8893 0))(
  ( (array!8894 (arr!4196 (Array (_ BitVec 32) ValueCell!2075)) (size!4522 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8893)

(declare-fun mapDefault!8324 () ValueCell!2075)

(assert (=> b!200148 (= condMapEmpty!8324 (= (arr!4196 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2075)) mapDefault!8324)))))

(declare-fun mapNonEmpty!8324 () Bool)

(declare-fun tp!17975 () Bool)

(declare-fun e!131254 () Bool)

(assert (=> mapNonEmpty!8324 (= mapRes!8324 (and tp!17975 e!131254))))

(declare-fun mapRest!8324 () (Array (_ BitVec 32) ValueCell!2075))

(declare-fun mapKey!8324 () (_ BitVec 32))

(declare-fun mapValue!8324 () ValueCell!2075)

(assert (=> mapNonEmpty!8324 (= (arr!4196 _values!649) (store mapRest!8324 mapKey!8324 mapValue!8324))))

(declare-fun b!200149 () Bool)

(declare-fun res!95304 () Bool)

(assert (=> b!200149 (=> (not res!95304) (not e!131255))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200149 (= res!95304 (validKeyInArray!0 k0!843))))

(declare-fun b!200150 () Bool)

(declare-fun tp_is_empty!4837 () Bool)

(assert (=> b!200150 (= e!131259 tp_is_empty!4837)))

(declare-fun b!200151 () Bool)

(declare-fun res!95305 () Bool)

(assert (=> b!200151 (=> (not res!95305) (not e!131255))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200151 (= res!95305 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4521 _keys!825))))))

(declare-fun b!200152 () Bool)

(declare-fun e!131258 () Bool)

(assert (=> b!200152 (= e!131255 (not e!131258))))

(declare-fun res!95300 () Bool)

(assert (=> b!200152 (=> res!95300 e!131258)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200152 (= res!95300 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6097)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!3694 0))(
  ( (tuple2!3695 (_1!1858 (_ BitVec 64)) (_2!1858 V!6097)) )
))
(declare-datatypes ((List!2621 0))(
  ( (Nil!2618) (Cons!2617 (h!3259 tuple2!3694) (t!7543 List!2621)) )
))
(declare-datatypes ((ListLongMap!2597 0))(
  ( (ListLongMap!2598 (toList!1314 List!2621)) )
))
(declare-fun lt!98674 () ListLongMap!2597)

(declare-fun minValue!615 () V!6097)

(declare-fun getCurrentListMap!884 (array!8891 array!8893 (_ BitVec 32) (_ BitVec 32) V!6097 V!6097 (_ BitVec 32) Int) ListLongMap!2597)

(assert (=> b!200152 (= lt!98674 (getCurrentListMap!884 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98675 () ListLongMap!2597)

(declare-fun lt!98679 () array!8893)

(assert (=> b!200152 (= lt!98675 (getCurrentListMap!884 _keys!825 lt!98679 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98673 () ListLongMap!2597)

(declare-fun lt!98677 () ListLongMap!2597)

(assert (=> b!200152 (and (= lt!98673 lt!98677) (= lt!98677 lt!98673))))

(declare-fun lt!98681 () ListLongMap!2597)

(declare-fun lt!98680 () tuple2!3694)

(declare-fun +!363 (ListLongMap!2597 tuple2!3694) ListLongMap!2597)

(assert (=> b!200152 (= lt!98677 (+!363 lt!98681 lt!98680))))

(declare-fun v!520 () V!6097)

(assert (=> b!200152 (= lt!98680 (tuple2!3695 k0!843 v!520))))

(declare-datatypes ((Unit!5978 0))(
  ( (Unit!5979) )
))
(declare-fun lt!98678 () Unit!5978)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!43 (array!8891 array!8893 (_ BitVec 32) (_ BitVec 32) V!6097 V!6097 (_ BitVec 32) (_ BitVec 64) V!6097 (_ BitVec 32) Int) Unit!5978)

(assert (=> b!200152 (= lt!98678 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!43 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!294 (array!8891 array!8893 (_ BitVec 32) (_ BitVec 32) V!6097 V!6097 (_ BitVec 32) Int) ListLongMap!2597)

(assert (=> b!200152 (= lt!98673 (getCurrentListMapNoExtraKeys!294 _keys!825 lt!98679 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200152 (= lt!98679 (array!8894 (store (arr!4196 _values!649) i!601 (ValueCellFull!2075 v!520)) (size!4522 _values!649)))))

(assert (=> b!200152 (= lt!98681 (getCurrentListMapNoExtraKeys!294 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200153 () Bool)

(assert (=> b!200153 (= e!131254 tp_is_empty!4837)))

(declare-fun res!95303 () Bool)

(assert (=> start!20326 (=> (not res!95303) (not e!131255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20326 (= res!95303 (validMask!0 mask!1149))))

(assert (=> start!20326 e!131255))

(declare-fun array_inv!2737 (array!8893) Bool)

(assert (=> start!20326 (and (array_inv!2737 _values!649) e!131256)))

(assert (=> start!20326 true))

(assert (=> start!20326 tp_is_empty!4837))

(declare-fun array_inv!2738 (array!8891) Bool)

(assert (=> start!20326 (array_inv!2738 _keys!825)))

(assert (=> start!20326 tp!17974))

(declare-fun b!200154 () Bool)

(declare-fun res!95302 () Bool)

(assert (=> b!200154 (=> (not res!95302) (not e!131255))))

(assert (=> b!200154 (= res!95302 (= (select (arr!4195 _keys!825) i!601) k0!843))))

(declare-fun b!200155 () Bool)

(assert (=> b!200155 (= e!131258 true)))

(declare-fun lt!98683 () ListLongMap!2597)

(declare-fun lt!98682 () ListLongMap!2597)

(assert (=> b!200155 (= lt!98683 (+!363 lt!98682 lt!98680))))

(declare-fun lt!98684 () Unit!5978)

(declare-fun addCommutativeForDiffKeys!74 (ListLongMap!2597 (_ BitVec 64) V!6097 (_ BitVec 64) V!6097) Unit!5978)

(assert (=> b!200155 (= lt!98684 (addCommutativeForDiffKeys!74 lt!98681 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!98676 () tuple2!3694)

(assert (=> b!200155 (= lt!98675 (+!363 lt!98683 lt!98676))))

(declare-fun lt!98672 () tuple2!3694)

(assert (=> b!200155 (= lt!98683 (+!363 lt!98677 lt!98672))))

(assert (=> b!200155 (= lt!98674 (+!363 lt!98682 lt!98676))))

(assert (=> b!200155 (= lt!98682 (+!363 lt!98681 lt!98672))))

(assert (=> b!200155 (= lt!98675 (+!363 (+!363 lt!98673 lt!98672) lt!98676))))

(assert (=> b!200155 (= lt!98676 (tuple2!3695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200155 (= lt!98672 (tuple2!3695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!8324 () Bool)

(assert (=> mapIsEmpty!8324 mapRes!8324))

(declare-fun b!200156 () Bool)

(declare-fun res!95306 () Bool)

(assert (=> b!200156 (=> (not res!95306) (not e!131255))))

(assert (=> b!200156 (= res!95306 (and (= (size!4522 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4521 _keys!825) (size!4522 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20326 res!95303) b!200156))

(assert (= (and b!200156 res!95306) b!200146))

(assert (= (and b!200146 res!95301) b!200147))

(assert (= (and b!200147 res!95299) b!200151))

(assert (= (and b!200151 res!95305) b!200149))

(assert (= (and b!200149 res!95304) b!200154))

(assert (= (and b!200154 res!95302) b!200152))

(assert (= (and b!200152 (not res!95300)) b!200155))

(assert (= (and b!200148 condMapEmpty!8324) mapIsEmpty!8324))

(assert (= (and b!200148 (not condMapEmpty!8324)) mapNonEmpty!8324))

(get-info :version)

(assert (= (and mapNonEmpty!8324 ((_ is ValueCellFull!2075) mapValue!8324)) b!200153))

(assert (= (and b!200148 ((_ is ValueCellFull!2075) mapDefault!8324)) b!200150))

(assert (= start!20326 b!200148))

(declare-fun m!226101 () Bool)

(assert (=> b!200154 m!226101))

(declare-fun m!226103 () Bool)

(assert (=> b!200147 m!226103))

(declare-fun m!226105 () Bool)

(assert (=> start!20326 m!226105))

(declare-fun m!226107 () Bool)

(assert (=> start!20326 m!226107))

(declare-fun m!226109 () Bool)

(assert (=> start!20326 m!226109))

(declare-fun m!226111 () Bool)

(assert (=> mapNonEmpty!8324 m!226111))

(declare-fun m!226113 () Bool)

(assert (=> b!200149 m!226113))

(declare-fun m!226115 () Bool)

(assert (=> b!200146 m!226115))

(declare-fun m!226117 () Bool)

(assert (=> b!200155 m!226117))

(declare-fun m!226119 () Bool)

(assert (=> b!200155 m!226119))

(declare-fun m!226121 () Bool)

(assert (=> b!200155 m!226121))

(declare-fun m!226123 () Bool)

(assert (=> b!200155 m!226123))

(declare-fun m!226125 () Bool)

(assert (=> b!200155 m!226125))

(declare-fun m!226127 () Bool)

(assert (=> b!200155 m!226127))

(assert (=> b!200155 m!226121))

(declare-fun m!226129 () Bool)

(assert (=> b!200155 m!226129))

(declare-fun m!226131 () Bool)

(assert (=> b!200155 m!226131))

(declare-fun m!226133 () Bool)

(assert (=> b!200152 m!226133))

(declare-fun m!226135 () Bool)

(assert (=> b!200152 m!226135))

(declare-fun m!226137 () Bool)

(assert (=> b!200152 m!226137))

(declare-fun m!226139 () Bool)

(assert (=> b!200152 m!226139))

(declare-fun m!226141 () Bool)

(assert (=> b!200152 m!226141))

(declare-fun m!226143 () Bool)

(assert (=> b!200152 m!226143))

(declare-fun m!226145 () Bool)

(assert (=> b!200152 m!226145))

(check-sat (not b!200146) b_and!11701 (not b!200147) (not start!20326) tp_is_empty!4837 (not mapNonEmpty!8324) (not b!200149) (not b!200152) (not b_next!4981) (not b!200155))
(check-sat b_and!11701 (not b_next!4981))
