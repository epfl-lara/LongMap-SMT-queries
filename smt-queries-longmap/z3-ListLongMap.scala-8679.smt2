; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105696 () Bool)

(assert start!105696)

(declare-fun b_free!27109 () Bool)

(declare-fun b_next!27109 () Bool)

(assert (=> start!105696 (= b_free!27109 (not b_next!27109))))

(declare-fun tp!94843 () Bool)

(declare-fun b_and!44967 () Bool)

(assert (=> start!105696 (= tp!94843 b_and!44967)))

(declare-fun b!1257850 () Bool)

(declare-fun res!838167 () Bool)

(declare-fun e!715188 () Bool)

(assert (=> b!1257850 (=> (not res!838167) (not e!715188))))

(declare-datatypes ((array!81711 0))(
  ( (array!81712 (arr!39409 (Array (_ BitVec 32) (_ BitVec 64))) (size!39946 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81711)

(declare-datatypes ((List!28011 0))(
  ( (Nil!28008) (Cons!28007 (h!29225 (_ BitVec 64)) (t!41492 List!28011)) )
))
(declare-fun arrayNoDuplicates!0 (array!81711 (_ BitVec 32) List!28011) Bool)

(assert (=> b!1257850 (= res!838167 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28008))))

(declare-fun res!838163 () Bool)

(assert (=> start!105696 (=> (not res!838163) (not e!715188))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105696 (= res!838163 (validMask!0 mask!1466))))

(assert (=> start!105696 e!715188))

(assert (=> start!105696 true))

(assert (=> start!105696 tp!94843))

(declare-fun tp_is_empty!32011 () Bool)

(assert (=> start!105696 tp_is_empty!32011))

(declare-fun array_inv!30157 (array!81711) Bool)

(assert (=> start!105696 (array_inv!30157 _keys!1118)))

(declare-datatypes ((V!48047 0))(
  ( (V!48048 (val!16068 Int)) )
))
(declare-datatypes ((ValueCell!15242 0))(
  ( (ValueCellFull!15242 (v!18765 V!48047)) (EmptyCell!15242) )
))
(declare-datatypes ((array!81713 0))(
  ( (array!81714 (arr!39410 (Array (_ BitVec 32) ValueCell!15242)) (size!39947 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81713)

(declare-fun e!715187 () Bool)

(declare-fun array_inv!30158 (array!81713) Bool)

(assert (=> start!105696 (and (array_inv!30158 _values!914) e!715187)))

(declare-fun b!1257851 () Bool)

(declare-fun e!715192 () Bool)

(assert (=> b!1257851 (= e!715192 tp_is_empty!32011)))

(declare-fun b!1257852 () Bool)

(declare-fun res!838164 () Bool)

(assert (=> b!1257852 (=> (not res!838164) (not e!715188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81711 (_ BitVec 32)) Bool)

(assert (=> b!1257852 (= res!838164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257853 () Bool)

(declare-fun e!715186 () Bool)

(assert (=> b!1257853 (= e!715188 (not e!715186))))

(declare-fun res!838165 () Bool)

(assert (=> b!1257853 (=> res!838165 e!715186)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1257853 (= res!838165 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20780 0))(
  ( (tuple2!20781 (_1!10401 (_ BitVec 64)) (_2!10401 V!48047)) )
))
(declare-datatypes ((List!28012 0))(
  ( (Nil!28009) (Cons!28008 (h!29226 tuple2!20780) (t!41493 List!28012)) )
))
(declare-datatypes ((ListLongMap!18661 0))(
  ( (ListLongMap!18662 (toList!9346 List!28012)) )
))
(declare-fun lt!568699 () ListLongMap!18661)

(declare-fun lt!568698 () ListLongMap!18661)

(assert (=> b!1257853 (= lt!568699 lt!568698)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48047)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48047)

(declare-datatypes ((Unit!41833 0))(
  ( (Unit!41834) )
))
(declare-fun lt!568700 () Unit!41833)

(declare-fun minValueBefore!43 () V!48047)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1078 (array!81711 array!81713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48047 V!48047 V!48047 V!48047 (_ BitVec 32) Int) Unit!41833)

(assert (=> b!1257853 (= lt!568700 (lemmaNoChangeToArrayThenSameMapNoExtras!1078 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5764 (array!81711 array!81713 (_ BitVec 32) (_ BitVec 32) V!48047 V!48047 (_ BitVec 32) Int) ListLongMap!18661)

(assert (=> b!1257853 (= lt!568698 (getCurrentListMapNoExtraKeys!5764 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257853 (= lt!568699 (getCurrentListMapNoExtraKeys!5764 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49804 () Bool)

(declare-fun mapRes!49804 () Bool)

(declare-fun tp!94844 () Bool)

(assert (=> mapNonEmpty!49804 (= mapRes!49804 (and tp!94844 e!715192))))

(declare-fun mapKey!49804 () (_ BitVec 32))

(declare-fun mapRest!49804 () (Array (_ BitVec 32) ValueCell!15242))

(declare-fun mapValue!49804 () ValueCell!15242)

(assert (=> mapNonEmpty!49804 (= (arr!39410 _values!914) (store mapRest!49804 mapKey!49804 mapValue!49804))))

(declare-fun b!1257854 () Bool)

(declare-fun res!838168 () Bool)

(assert (=> b!1257854 (=> (not res!838168) (not e!715188))))

(assert (=> b!1257854 (= res!838168 (and (= (size!39947 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39946 _keys!1118) (size!39947 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257855 () Bool)

(declare-fun e!715191 () Bool)

(assert (=> b!1257855 (= e!715191 tp_is_empty!32011)))

(declare-fun b!1257856 () Bool)

(assert (=> b!1257856 (= e!715187 (and e!715191 mapRes!49804))))

(declare-fun condMapEmpty!49804 () Bool)

(declare-fun mapDefault!49804 () ValueCell!15242)

(assert (=> b!1257856 (= condMapEmpty!49804 (= (arr!39410 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15242)) mapDefault!49804)))))

(declare-fun mapIsEmpty!49804 () Bool)

(assert (=> mapIsEmpty!49804 mapRes!49804))

(declare-fun b!1257857 () Bool)

(declare-fun e!715189 () Bool)

(assert (=> b!1257857 (= e!715189 true)))

(declare-fun lt!568697 () ListLongMap!18661)

(declare-fun -!2061 (ListLongMap!18661 (_ BitVec 64)) ListLongMap!18661)

(assert (=> b!1257857 (= (-!2061 lt!568697 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568697)))

(declare-fun lt!568701 () Unit!41833)

(declare-fun removeNotPresentStillSame!133 (ListLongMap!18661 (_ BitVec 64)) Unit!41833)

(assert (=> b!1257857 (= lt!568701 (removeNotPresentStillSame!133 lt!568697 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257858 () Bool)

(assert (=> b!1257858 (= e!715186 e!715189)))

(declare-fun res!838166 () Bool)

(assert (=> b!1257858 (=> res!838166 e!715189)))

(declare-fun contains!7577 (ListLongMap!18661 (_ BitVec 64)) Bool)

(assert (=> b!1257858 (= res!838166 (contains!7577 lt!568697 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4554 (array!81711 array!81713 (_ BitVec 32) (_ BitVec 32) V!48047 V!48047 (_ BitVec 32) Int) ListLongMap!18661)

(assert (=> b!1257858 (= lt!568697 (getCurrentListMap!4554 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105696 res!838163) b!1257854))

(assert (= (and b!1257854 res!838168) b!1257852))

(assert (= (and b!1257852 res!838164) b!1257850))

(assert (= (and b!1257850 res!838167) b!1257853))

(assert (= (and b!1257853 (not res!838165)) b!1257858))

(assert (= (and b!1257858 (not res!838166)) b!1257857))

(assert (= (and b!1257856 condMapEmpty!49804) mapIsEmpty!49804))

(assert (= (and b!1257856 (not condMapEmpty!49804)) mapNonEmpty!49804))

(get-info :version)

(assert (= (and mapNonEmpty!49804 ((_ is ValueCellFull!15242) mapValue!49804)) b!1257851))

(assert (= (and b!1257856 ((_ is ValueCellFull!15242) mapDefault!49804)) b!1257855))

(assert (= start!105696 b!1257856))

(declare-fun m!1158801 () Bool)

(assert (=> mapNonEmpty!49804 m!1158801))

(declare-fun m!1158803 () Bool)

(assert (=> start!105696 m!1158803))

(declare-fun m!1158805 () Bool)

(assert (=> start!105696 m!1158805))

(declare-fun m!1158807 () Bool)

(assert (=> start!105696 m!1158807))

(declare-fun m!1158809 () Bool)

(assert (=> b!1257857 m!1158809))

(declare-fun m!1158811 () Bool)

(assert (=> b!1257857 m!1158811))

(declare-fun m!1158813 () Bool)

(assert (=> b!1257858 m!1158813))

(declare-fun m!1158815 () Bool)

(assert (=> b!1257858 m!1158815))

(declare-fun m!1158817 () Bool)

(assert (=> b!1257850 m!1158817))

(declare-fun m!1158819 () Bool)

(assert (=> b!1257852 m!1158819))

(declare-fun m!1158821 () Bool)

(assert (=> b!1257853 m!1158821))

(declare-fun m!1158823 () Bool)

(assert (=> b!1257853 m!1158823))

(declare-fun m!1158825 () Bool)

(assert (=> b!1257853 m!1158825))

(check-sat (not b!1257857) (not start!105696) (not b!1257853) (not b!1257850) (not b_next!27109) tp_is_empty!32011 (not b!1257852) b_and!44967 (not b!1257858) (not mapNonEmpty!49804))
(check-sat b_and!44967 (not b_next!27109))
