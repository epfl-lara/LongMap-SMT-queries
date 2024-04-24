; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105518 () Bool)

(assert start!105518)

(declare-fun b_free!26989 () Bool)

(declare-fun b_next!26989 () Bool)

(assert (=> start!105518 (= b_free!26989 (not b_next!26989))))

(declare-fun tp!94474 () Bool)

(declare-fun b_and!44817 () Bool)

(assert (=> start!105518 (= tp!94474 b_and!44817)))

(declare-fun b!1255984 () Bool)

(declare-fun e!713834 () Bool)

(declare-fun tp_is_empty!31891 () Bool)

(assert (=> b!1255984 (= e!713834 tp_is_empty!31891)))

(declare-fun b!1255985 () Bool)

(declare-fun res!837091 () Bool)

(declare-fun e!713833 () Bool)

(assert (=> b!1255985 (=> (not res!837091) (not e!713833))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81481 0))(
  ( (array!81482 (arr!39297 (Array (_ BitVec 32) (_ BitVec 64))) (size!39834 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81481)

(declare-datatypes ((V!47887 0))(
  ( (V!47888 (val!16008 Int)) )
))
(declare-datatypes ((ValueCell!15182 0))(
  ( (ValueCellFull!15182 (v!18703 V!47887)) (EmptyCell!15182) )
))
(declare-datatypes ((array!81483 0))(
  ( (array!81484 (arr!39298 (Array (_ BitVec 32) ValueCell!15182)) (size!39835 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81483)

(assert (=> b!1255985 (= res!837091 (and (= (size!39835 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39834 _keys!1118) (size!39835 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255986 () Bool)

(declare-fun e!713837 () Bool)

(assert (=> b!1255986 (= e!713833 (not e!713837))))

(declare-fun res!837092 () Bool)

(assert (=> b!1255986 (=> res!837092 e!713837)))

(assert (=> b!1255986 (= res!837092 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20690 0))(
  ( (tuple2!20691 (_1!10356 (_ BitVec 64)) (_2!10356 V!47887)) )
))
(declare-datatypes ((List!27926 0))(
  ( (Nil!27923) (Cons!27922 (h!29140 tuple2!20690) (t!41401 List!27926)) )
))
(declare-datatypes ((ListLongMap!18571 0))(
  ( (ListLongMap!18572 (toList!9301 List!27926)) )
))
(declare-fun lt!567646 () ListLongMap!18571)

(declare-fun lt!567647 () ListLongMap!18571)

(assert (=> b!1255986 (= lt!567646 lt!567647)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47887)

(declare-fun zeroValue!871 () V!47887)

(declare-fun minValueBefore!43 () V!47887)

(declare-datatypes ((Unit!41741 0))(
  ( (Unit!41742) )
))
(declare-fun lt!567643 () Unit!41741)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1038 (array!81481 array!81483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47887 V!47887 V!47887 V!47887 (_ BitVec 32) Int) Unit!41741)

(assert (=> b!1255986 (= lt!567643 (lemmaNoChangeToArrayThenSameMapNoExtras!1038 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5724 (array!81481 array!81483 (_ BitVec 32) (_ BitVec 32) V!47887 V!47887 (_ BitVec 32) Int) ListLongMap!18571)

(assert (=> b!1255986 (= lt!567647 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255986 (= lt!567646 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255987 () Bool)

(declare-fun e!713835 () Bool)

(assert (=> b!1255987 (= e!713835 (bvsle #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(declare-fun res!837090 () Bool)

(assert (=> start!105518 (=> (not res!837090) (not e!713833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105518 (= res!837090 (validMask!0 mask!1466))))

(assert (=> start!105518 e!713833))

(assert (=> start!105518 true))

(assert (=> start!105518 tp!94474))

(assert (=> start!105518 tp_is_empty!31891))

(declare-fun array_inv!30075 (array!81481) Bool)

(assert (=> start!105518 (array_inv!30075 _keys!1118)))

(declare-fun e!713836 () Bool)

(declare-fun array_inv!30076 (array!81483) Bool)

(assert (=> start!105518 (and (array_inv!30076 _values!914) e!713836)))

(declare-fun b!1255988 () Bool)

(assert (=> b!1255988 (= e!713837 e!713835)))

(declare-fun res!837089 () Bool)

(assert (=> b!1255988 (=> res!837089 e!713835)))

(declare-fun lt!567644 () ListLongMap!18571)

(declare-fun lt!567649 () ListLongMap!18571)

(declare-fun -!2038 (ListLongMap!18571 (_ BitVec 64)) ListLongMap!18571)

(assert (=> b!1255988 (= res!837089 (not (= (-!2038 lt!567644 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567649)))))

(declare-fun lt!567648 () ListLongMap!18571)

(assert (=> b!1255988 (= (-!2038 lt!567648 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567646)))

(declare-fun lt!567645 () Unit!41741)

(declare-fun addThenRemoveForNewKeyIsSame!328 (ListLongMap!18571 (_ BitVec 64) V!47887) Unit!41741)

(assert (=> b!1255988 (= lt!567645 (addThenRemoveForNewKeyIsSame!328 lt!567646 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1255988 (and (= lt!567644 lt!567648) (= lt!567649 lt!567647))))

(declare-fun +!4234 (ListLongMap!18571 tuple2!20690) ListLongMap!18571)

(assert (=> b!1255988 (= lt!567648 (+!4234 lt!567646 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4531 (array!81481 array!81483 (_ BitVec 32) (_ BitVec 32) V!47887 V!47887 (_ BitVec 32) Int) ListLongMap!18571)

(assert (=> b!1255988 (= lt!567649 (getCurrentListMap!4531 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255988 (= lt!567644 (getCurrentListMap!4531 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255989 () Bool)

(declare-fun e!713838 () Bool)

(assert (=> b!1255989 (= e!713838 tp_is_empty!31891)))

(declare-fun mapNonEmpty!49615 () Bool)

(declare-fun mapRes!49615 () Bool)

(declare-fun tp!94475 () Bool)

(assert (=> mapNonEmpty!49615 (= mapRes!49615 (and tp!94475 e!713838))))

(declare-fun mapKey!49615 () (_ BitVec 32))

(declare-fun mapRest!49615 () (Array (_ BitVec 32) ValueCell!15182))

(declare-fun mapValue!49615 () ValueCell!15182)

(assert (=> mapNonEmpty!49615 (= (arr!39298 _values!914) (store mapRest!49615 mapKey!49615 mapValue!49615))))

(declare-fun b!1255990 () Bool)

(declare-fun res!837093 () Bool)

(assert (=> b!1255990 (=> (not res!837093) (not e!713833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81481 (_ BitVec 32)) Bool)

(assert (=> b!1255990 (= res!837093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255991 () Bool)

(declare-fun res!837094 () Bool)

(assert (=> b!1255991 (=> (not res!837094) (not e!713833))))

(declare-datatypes ((List!27927 0))(
  ( (Nil!27924) (Cons!27923 (h!29141 (_ BitVec 64)) (t!41402 List!27927)) )
))
(declare-fun arrayNoDuplicates!0 (array!81481 (_ BitVec 32) List!27927) Bool)

(assert (=> b!1255991 (= res!837094 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27924))))

(declare-fun b!1255992 () Bool)

(assert (=> b!1255992 (= e!713836 (and e!713834 mapRes!49615))))

(declare-fun condMapEmpty!49615 () Bool)

(declare-fun mapDefault!49615 () ValueCell!15182)

(assert (=> b!1255992 (= condMapEmpty!49615 (= (arr!39298 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15182)) mapDefault!49615)))))

(declare-fun mapIsEmpty!49615 () Bool)

(assert (=> mapIsEmpty!49615 mapRes!49615))

(assert (= (and start!105518 res!837090) b!1255985))

(assert (= (and b!1255985 res!837091) b!1255990))

(assert (= (and b!1255990 res!837093) b!1255991))

(assert (= (and b!1255991 res!837094) b!1255986))

(assert (= (and b!1255986 (not res!837092)) b!1255988))

(assert (= (and b!1255988 (not res!837089)) b!1255987))

(assert (= (and b!1255992 condMapEmpty!49615) mapIsEmpty!49615))

(assert (= (and b!1255992 (not condMapEmpty!49615)) mapNonEmpty!49615))

(get-info :version)

(assert (= (and mapNonEmpty!49615 ((_ is ValueCellFull!15182) mapValue!49615)) b!1255989))

(assert (= (and b!1255992 ((_ is ValueCellFull!15182) mapDefault!49615)) b!1255984))

(assert (= start!105518 b!1255992))

(declare-fun m!1157081 () Bool)

(assert (=> b!1255988 m!1157081))

(declare-fun m!1157083 () Bool)

(assert (=> b!1255988 m!1157083))

(declare-fun m!1157085 () Bool)

(assert (=> b!1255988 m!1157085))

(declare-fun m!1157087 () Bool)

(assert (=> b!1255988 m!1157087))

(declare-fun m!1157089 () Bool)

(assert (=> b!1255988 m!1157089))

(declare-fun m!1157091 () Bool)

(assert (=> b!1255988 m!1157091))

(declare-fun m!1157093 () Bool)

(assert (=> start!105518 m!1157093))

(declare-fun m!1157095 () Bool)

(assert (=> start!105518 m!1157095))

(declare-fun m!1157097 () Bool)

(assert (=> start!105518 m!1157097))

(declare-fun m!1157099 () Bool)

(assert (=> b!1255986 m!1157099))

(declare-fun m!1157101 () Bool)

(assert (=> b!1255986 m!1157101))

(declare-fun m!1157103 () Bool)

(assert (=> b!1255986 m!1157103))

(declare-fun m!1157105 () Bool)

(assert (=> b!1255990 m!1157105))

(declare-fun m!1157107 () Bool)

(assert (=> b!1255991 m!1157107))

(declare-fun m!1157109 () Bool)

(assert (=> mapNonEmpty!49615 m!1157109))

(check-sat (not b!1255988) tp_is_empty!31891 b_and!44817 (not b!1255986) (not b!1255991) (not mapNonEmpty!49615) (not b_next!26989) (not b!1255990) (not start!105518))
(check-sat b_and!44817 (not b_next!26989))
(get-model)

(declare-fun d!138551 () Bool)

(declare-fun e!713883 () Bool)

(assert (=> d!138551 e!713883))

(declare-fun res!837136 () Bool)

(assert (=> d!138551 (=> (not res!837136) (not e!713883))))

(declare-fun lt!567702 () ListLongMap!18571)

(declare-fun contains!7551 (ListLongMap!18571 (_ BitVec 64)) Bool)

(assert (=> d!138551 (= res!837136 (contains!7551 lt!567702 (_1!10356 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!567703 () List!27926)

(assert (=> d!138551 (= lt!567702 (ListLongMap!18572 lt!567703))))

(declare-fun lt!567701 () Unit!41741)

(declare-fun lt!567700 () Unit!41741)

(assert (=> d!138551 (= lt!567701 lt!567700)))

(declare-datatypes ((Option!702 0))(
  ( (Some!701 (v!18706 V!47887)) (None!700) )
))
(declare-fun getValueByKey!651 (List!27926 (_ BitVec 64)) Option!702)

(assert (=> d!138551 (= (getValueByKey!651 lt!567703 (_1!10356 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!701 (_2!10356 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!331 (List!27926 (_ BitVec 64) V!47887) Unit!41741)

(assert (=> d!138551 (= lt!567700 (lemmaContainsTupThenGetReturnValue!331 lt!567703 (_1!10356 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10356 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!445 (List!27926 (_ BitVec 64) V!47887) List!27926)

(assert (=> d!138551 (= lt!567703 (insertStrictlySorted!445 (toList!9301 lt!567646) (_1!10356 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10356 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138551 (= (+!4234 lt!567646 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!567702)))

(declare-fun b!1256051 () Bool)

(declare-fun res!837135 () Bool)

(assert (=> b!1256051 (=> (not res!837135) (not e!713883))))

(assert (=> b!1256051 (= res!837135 (= (getValueByKey!651 (toList!9301 lt!567702) (_1!10356 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!701 (_2!10356 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1256052 () Bool)

(declare-fun contains!7552 (List!27926 tuple2!20690) Bool)

(assert (=> b!1256052 (= e!713883 (contains!7552 (toList!9301 lt!567702) (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138551 res!837136) b!1256051))

(assert (= (and b!1256051 res!837135) b!1256052))

(declare-fun m!1157171 () Bool)

(assert (=> d!138551 m!1157171))

(declare-fun m!1157173 () Bool)

(assert (=> d!138551 m!1157173))

(declare-fun m!1157175 () Bool)

(assert (=> d!138551 m!1157175))

(declare-fun m!1157177 () Bool)

(assert (=> d!138551 m!1157177))

(declare-fun m!1157179 () Bool)

(assert (=> b!1256051 m!1157179))

(declare-fun m!1157181 () Bool)

(assert (=> b!1256052 m!1157181))

(assert (=> b!1255988 d!138551))

(declare-fun b!1256095 () Bool)

(declare-fun e!713920 () Bool)

(declare-fun e!713914 () Bool)

(assert (=> b!1256095 (= e!713920 e!713914)))

(declare-fun res!837156 () Bool)

(declare-fun call!61811 () Bool)

(assert (=> b!1256095 (= res!837156 call!61811)))

(assert (=> b!1256095 (=> (not res!837156) (not e!713914))))

(declare-fun b!1256096 () Bool)

(declare-fun e!713913 () Bool)

(assert (=> b!1256096 (= e!713913 e!713920)))

(declare-fun c!122756 () Bool)

(assert (=> b!1256096 (= c!122756 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256097 () Bool)

(declare-fun e!713922 () Bool)

(declare-fun e!713911 () Bool)

(assert (=> b!1256097 (= e!713922 e!713911)))

(declare-fun res!837162 () Bool)

(assert (=> b!1256097 (=> (not res!837162) (not e!713911))))

(declare-fun lt!567754 () ListLongMap!18571)

(assert (=> b!1256097 (= res!837162 (contains!7551 lt!567754 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(declare-fun b!1256098 () Bool)

(declare-fun e!713910 () ListLongMap!18571)

(declare-fun e!713921 () ListLongMap!18571)

(assert (=> b!1256098 (= e!713910 e!713921)))

(declare-fun c!122757 () Bool)

(assert (=> b!1256098 (= c!122757 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!138553 () Bool)

(assert (=> d!138553 e!713913))

(declare-fun res!837157 () Bool)

(assert (=> d!138553 (=> (not res!837157) (not e!713913))))

(assert (=> d!138553 (= res!837157 (or (bvsge #b00000000000000000000000000000000 (size!39834 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))))

(declare-fun lt!567750 () ListLongMap!18571)

(assert (=> d!138553 (= lt!567754 lt!567750)))

(declare-fun lt!567764 () Unit!41741)

(declare-fun e!713915 () Unit!41741)

(assert (=> d!138553 (= lt!567764 e!713915)))

(declare-fun c!122755 () Bool)

(declare-fun e!713919 () Bool)

(assert (=> d!138553 (= c!122755 e!713919)))

(declare-fun res!837159 () Bool)

(assert (=> d!138553 (=> (not res!837159) (not e!713919))))

(assert (=> d!138553 (= res!837159 (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(assert (=> d!138553 (= lt!567750 e!713910)))

(declare-fun c!122753 () Bool)

(assert (=> d!138553 (= c!122753 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138553 (validMask!0 mask!1466)))

(assert (=> d!138553 (= (getCurrentListMap!4531 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567754)))

(declare-fun b!1256099 () Bool)

(declare-fun e!713916 () ListLongMap!18571)

(declare-fun call!61813 () ListLongMap!18571)

(assert (=> b!1256099 (= e!713916 call!61813)))

(declare-fun b!1256100 () Bool)

(declare-fun e!713918 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1256100 (= e!713918 (validKeyInArray!0 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256101 () Bool)

(declare-fun Unit!41747 () Unit!41741)

(assert (=> b!1256101 (= e!713915 Unit!41747)))

(declare-fun b!1256102 () Bool)

(declare-fun apply!995 (ListLongMap!18571 (_ BitVec 64)) V!47887)

(declare-fun get!20152 (ValueCell!15182 V!47887) V!47887)

(declare-fun dynLambda!3447 (Int (_ BitVec 64)) V!47887)

(assert (=> b!1256102 (= e!713911 (= (apply!995 lt!567754 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)) (get!20152 (select (arr!39298 _values!914) #b00000000000000000000000000000000) (dynLambda!3447 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1256102 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39835 _values!914)))))

(assert (=> b!1256102 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(declare-fun b!1256103 () Bool)

(declare-fun res!837160 () Bool)

(assert (=> b!1256103 (=> (not res!837160) (not e!713913))))

(assert (=> b!1256103 (= res!837160 e!713922)))

(declare-fun res!837161 () Bool)

(assert (=> b!1256103 (=> res!837161 e!713922)))

(assert (=> b!1256103 (= res!837161 (not e!713918))))

(declare-fun res!837163 () Bool)

(assert (=> b!1256103 (=> (not res!837163) (not e!713918))))

(assert (=> b!1256103 (= res!837163 (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(declare-fun b!1256104 () Bool)

(declare-fun call!61815 () ListLongMap!18571)

(assert (=> b!1256104 (= e!713916 call!61815)))

(declare-fun b!1256105 () Bool)

(assert (=> b!1256105 (= e!713921 call!61813)))

(declare-fun b!1256106 () Bool)

(declare-fun c!122754 () Bool)

(assert (=> b!1256106 (= c!122754 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1256106 (= e!713921 e!713916)))

(declare-fun b!1256107 () Bool)

(declare-fun lt!567755 () Unit!41741)

(assert (=> b!1256107 (= e!713915 lt!567755)))

(declare-fun lt!567753 () ListLongMap!18571)

(assert (=> b!1256107 (= lt!567753 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567756 () (_ BitVec 64))

(assert (=> b!1256107 (= lt!567756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567760 () (_ BitVec 64))

(assert (=> b!1256107 (= lt!567760 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567758 () Unit!41741)

(declare-fun addStillContains!1087 (ListLongMap!18571 (_ BitVec 64) V!47887 (_ BitVec 64)) Unit!41741)

(assert (=> b!1256107 (= lt!567758 (addStillContains!1087 lt!567753 lt!567756 zeroValue!871 lt!567760))))

(assert (=> b!1256107 (contains!7551 (+!4234 lt!567753 (tuple2!20691 lt!567756 zeroValue!871)) lt!567760)))

(declare-fun lt!567751 () Unit!41741)

(assert (=> b!1256107 (= lt!567751 lt!567758)))

(declare-fun lt!567761 () ListLongMap!18571)

(assert (=> b!1256107 (= lt!567761 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567768 () (_ BitVec 64))

(assert (=> b!1256107 (= lt!567768 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567748 () (_ BitVec 64))

(assert (=> b!1256107 (= lt!567748 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567759 () Unit!41741)

(declare-fun addApplyDifferent!529 (ListLongMap!18571 (_ BitVec 64) V!47887 (_ BitVec 64)) Unit!41741)

(assert (=> b!1256107 (= lt!567759 (addApplyDifferent!529 lt!567761 lt!567768 minValueAfter!43 lt!567748))))

(assert (=> b!1256107 (= (apply!995 (+!4234 lt!567761 (tuple2!20691 lt!567768 minValueAfter!43)) lt!567748) (apply!995 lt!567761 lt!567748))))

(declare-fun lt!567749 () Unit!41741)

(assert (=> b!1256107 (= lt!567749 lt!567759)))

(declare-fun lt!567762 () ListLongMap!18571)

(assert (=> b!1256107 (= lt!567762 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567752 () (_ BitVec 64))

(assert (=> b!1256107 (= lt!567752 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567767 () (_ BitVec 64))

(assert (=> b!1256107 (= lt!567767 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567763 () Unit!41741)

(assert (=> b!1256107 (= lt!567763 (addApplyDifferent!529 lt!567762 lt!567752 zeroValue!871 lt!567767))))

(assert (=> b!1256107 (= (apply!995 (+!4234 lt!567762 (tuple2!20691 lt!567752 zeroValue!871)) lt!567767) (apply!995 lt!567762 lt!567767))))

(declare-fun lt!567769 () Unit!41741)

(assert (=> b!1256107 (= lt!567769 lt!567763)))

(declare-fun lt!567765 () ListLongMap!18571)

(assert (=> b!1256107 (= lt!567765 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567766 () (_ BitVec 64))

(assert (=> b!1256107 (= lt!567766 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567757 () (_ BitVec 64))

(assert (=> b!1256107 (= lt!567757 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1256107 (= lt!567755 (addApplyDifferent!529 lt!567765 lt!567766 minValueAfter!43 lt!567757))))

(assert (=> b!1256107 (= (apply!995 (+!4234 lt!567765 (tuple2!20691 lt!567766 minValueAfter!43)) lt!567757) (apply!995 lt!567765 lt!567757))))

(declare-fun bm!61806 () Bool)

(declare-fun call!61810 () Bool)

(assert (=> bm!61806 (= call!61810 (contains!7551 lt!567754 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!61807 () Bool)

(declare-fun call!61812 () ListLongMap!18571)

(declare-fun call!61809 () ListLongMap!18571)

(assert (=> bm!61807 (= call!61812 call!61809)))

(declare-fun b!1256108 () Bool)

(declare-fun res!837155 () Bool)

(assert (=> b!1256108 (=> (not res!837155) (not e!713913))))

(declare-fun e!713917 () Bool)

(assert (=> b!1256108 (= res!837155 e!713917)))

(declare-fun c!122758 () Bool)

(assert (=> b!1256108 (= c!122758 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1256109 () Bool)

(declare-fun e!713912 () Bool)

(assert (=> b!1256109 (= e!713912 (= (apply!995 lt!567754 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1256110 () Bool)

(assert (=> b!1256110 (= e!713917 e!713912)))

(declare-fun res!837158 () Bool)

(assert (=> b!1256110 (= res!837158 call!61810)))

(assert (=> b!1256110 (=> (not res!837158) (not e!713912))))

(declare-fun b!1256111 () Bool)

(assert (=> b!1256111 (= e!713914 (= (apply!995 lt!567754 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun bm!61808 () Bool)

(declare-fun call!61814 () ListLongMap!18571)

(assert (=> bm!61808 (= call!61814 (+!4234 (ite c!122753 call!61809 (ite c!122757 call!61812 call!61815)) (ite (or c!122753 c!122757) (tuple2!20691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun bm!61809 () Bool)

(assert (=> bm!61809 (= call!61813 call!61814)))

(declare-fun bm!61810 () Bool)

(assert (=> bm!61810 (= call!61809 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61811 () Bool)

(assert (=> bm!61811 (= call!61815 call!61812)))

(declare-fun b!1256112 () Bool)

(assert (=> b!1256112 (= e!713919 (validKeyInArray!0 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256113 () Bool)

(assert (=> b!1256113 (= e!713910 (+!4234 call!61814 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1256114 () Bool)

(assert (=> b!1256114 (= e!713917 (not call!61810))))

(declare-fun bm!61812 () Bool)

(assert (=> bm!61812 (= call!61811 (contains!7551 lt!567754 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256115 () Bool)

(assert (=> b!1256115 (= e!713920 (not call!61811))))

(assert (= (and d!138553 c!122753) b!1256113))

(assert (= (and d!138553 (not c!122753)) b!1256098))

(assert (= (and b!1256098 c!122757) b!1256105))

(assert (= (and b!1256098 (not c!122757)) b!1256106))

(assert (= (and b!1256106 c!122754) b!1256099))

(assert (= (and b!1256106 (not c!122754)) b!1256104))

(assert (= (or b!1256099 b!1256104) bm!61811))

(assert (= (or b!1256105 bm!61811) bm!61807))

(assert (= (or b!1256105 b!1256099) bm!61809))

(assert (= (or b!1256113 bm!61807) bm!61810))

(assert (= (or b!1256113 bm!61809) bm!61808))

(assert (= (and d!138553 res!837159) b!1256112))

(assert (= (and d!138553 c!122755) b!1256107))

(assert (= (and d!138553 (not c!122755)) b!1256101))

(assert (= (and d!138553 res!837157) b!1256103))

(assert (= (and b!1256103 res!837163) b!1256100))

(assert (= (and b!1256103 (not res!837161)) b!1256097))

(assert (= (and b!1256097 res!837162) b!1256102))

(assert (= (and b!1256103 res!837160) b!1256108))

(assert (= (and b!1256108 c!122758) b!1256110))

(assert (= (and b!1256108 (not c!122758)) b!1256114))

(assert (= (and b!1256110 res!837158) b!1256109))

(assert (= (or b!1256110 b!1256114) bm!61806))

(assert (= (and b!1256108 res!837155) b!1256096))

(assert (= (and b!1256096 c!122756) b!1256095))

(assert (= (and b!1256096 (not c!122756)) b!1256115))

(assert (= (and b!1256095 res!837156) b!1256111))

(assert (= (or b!1256095 b!1256115) bm!61812))

(declare-fun b_lambda!22621 () Bool)

(assert (=> (not b_lambda!22621) (not b!1256102)))

(declare-fun t!41407 () Bool)

(declare-fun tb!11291 () Bool)

(assert (=> (and start!105518 (= defaultEntry!922 defaultEntry!922) t!41407) tb!11291))

(declare-fun result!23297 () Bool)

(assert (=> tb!11291 (= result!23297 tp_is_empty!31891)))

(assert (=> b!1256102 t!41407))

(declare-fun b_and!44823 () Bool)

(assert (= b_and!44817 (and (=> t!41407 result!23297) b_and!44823)))

(declare-fun m!1157183 () Bool)

(assert (=> b!1256107 m!1157183))

(declare-fun m!1157185 () Bool)

(assert (=> b!1256107 m!1157185))

(declare-fun m!1157187 () Bool)

(assert (=> b!1256107 m!1157187))

(declare-fun m!1157189 () Bool)

(assert (=> b!1256107 m!1157189))

(declare-fun m!1157191 () Bool)

(assert (=> b!1256107 m!1157191))

(declare-fun m!1157193 () Bool)

(assert (=> b!1256107 m!1157193))

(declare-fun m!1157195 () Bool)

(assert (=> b!1256107 m!1157195))

(declare-fun m!1157197 () Bool)

(assert (=> b!1256107 m!1157197))

(declare-fun m!1157199 () Bool)

(assert (=> b!1256107 m!1157199))

(assert (=> b!1256107 m!1157197))

(declare-fun m!1157201 () Bool)

(assert (=> b!1256107 m!1157201))

(declare-fun m!1157203 () Bool)

(assert (=> b!1256107 m!1157203))

(assert (=> b!1256107 m!1157201))

(declare-fun m!1157205 () Bool)

(assert (=> b!1256107 m!1157205))

(declare-fun m!1157207 () Bool)

(assert (=> b!1256107 m!1157207))

(assert (=> b!1256107 m!1157101))

(declare-fun m!1157209 () Bool)

(assert (=> b!1256107 m!1157209))

(declare-fun m!1157211 () Bool)

(assert (=> b!1256107 m!1157211))

(declare-fun m!1157213 () Bool)

(assert (=> b!1256107 m!1157213))

(assert (=> b!1256107 m!1157185))

(assert (=> b!1256107 m!1157189))

(declare-fun m!1157215 () Bool)

(assert (=> b!1256102 m!1157215))

(declare-fun m!1157217 () Bool)

(assert (=> b!1256102 m!1157217))

(declare-fun m!1157219 () Bool)

(assert (=> b!1256102 m!1157219))

(assert (=> b!1256102 m!1157215))

(assert (=> b!1256102 m!1157217))

(assert (=> b!1256102 m!1157205))

(assert (=> b!1256102 m!1157205))

(declare-fun m!1157221 () Bool)

(assert (=> b!1256102 m!1157221))

(declare-fun m!1157223 () Bool)

(assert (=> bm!61812 m!1157223))

(declare-fun m!1157225 () Bool)

(assert (=> bm!61806 m!1157225))

(declare-fun m!1157227 () Bool)

(assert (=> b!1256111 m!1157227))

(assert (=> b!1256097 m!1157205))

(assert (=> b!1256097 m!1157205))

(declare-fun m!1157229 () Bool)

(assert (=> b!1256097 m!1157229))

(declare-fun m!1157231 () Bool)

(assert (=> b!1256109 m!1157231))

(declare-fun m!1157233 () Bool)

(assert (=> b!1256113 m!1157233))

(assert (=> b!1256100 m!1157205))

(assert (=> b!1256100 m!1157205))

(declare-fun m!1157235 () Bool)

(assert (=> b!1256100 m!1157235))

(declare-fun m!1157237 () Bool)

(assert (=> bm!61808 m!1157237))

(assert (=> bm!61810 m!1157101))

(assert (=> b!1256112 m!1157205))

(assert (=> b!1256112 m!1157205))

(assert (=> b!1256112 m!1157235))

(assert (=> d!138553 m!1157093))

(assert (=> b!1255988 d!138553))

(declare-fun d!138555 () Bool)

(declare-fun lt!567772 () ListLongMap!18571)

(assert (=> d!138555 (not (contains!7551 lt!567772 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!138 (List!27926 (_ BitVec 64)) List!27926)

(assert (=> d!138555 (= lt!567772 (ListLongMap!18572 (removeStrictlySorted!138 (toList!9301 lt!567644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138555 (= (-!2038 lt!567644 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567772)))

(declare-fun bs!35473 () Bool)

(assert (= bs!35473 d!138555))

(declare-fun m!1157239 () Bool)

(assert (=> bs!35473 m!1157239))

(declare-fun m!1157241 () Bool)

(assert (=> bs!35473 m!1157241))

(assert (=> b!1255988 d!138555))

(declare-fun b!1256118 () Bool)

(declare-fun e!713933 () Bool)

(declare-fun e!713927 () Bool)

(assert (=> b!1256118 (= e!713933 e!713927)))

(declare-fun res!837165 () Bool)

(declare-fun call!61818 () Bool)

(assert (=> b!1256118 (= res!837165 call!61818)))

(assert (=> b!1256118 (=> (not res!837165) (not e!713927))))

(declare-fun b!1256119 () Bool)

(declare-fun e!713926 () Bool)

(assert (=> b!1256119 (= e!713926 e!713933)))

(declare-fun c!122762 () Bool)

(assert (=> b!1256119 (= c!122762 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256120 () Bool)

(declare-fun e!713935 () Bool)

(declare-fun e!713924 () Bool)

(assert (=> b!1256120 (= e!713935 e!713924)))

(declare-fun res!837171 () Bool)

(assert (=> b!1256120 (=> (not res!837171) (not e!713924))))

(declare-fun lt!567779 () ListLongMap!18571)

(assert (=> b!1256120 (= res!837171 (contains!7551 lt!567779 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256120 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(declare-fun b!1256121 () Bool)

(declare-fun e!713923 () ListLongMap!18571)

(declare-fun e!713934 () ListLongMap!18571)

(assert (=> b!1256121 (= e!713923 e!713934)))

(declare-fun c!122763 () Bool)

(assert (=> b!1256121 (= c!122763 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!138557 () Bool)

(assert (=> d!138557 e!713926))

(declare-fun res!837166 () Bool)

(assert (=> d!138557 (=> (not res!837166) (not e!713926))))

(assert (=> d!138557 (= res!837166 (or (bvsge #b00000000000000000000000000000000 (size!39834 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))))

(declare-fun lt!567775 () ListLongMap!18571)

(assert (=> d!138557 (= lt!567779 lt!567775)))

(declare-fun lt!567789 () Unit!41741)

(declare-fun e!713928 () Unit!41741)

(assert (=> d!138557 (= lt!567789 e!713928)))

(declare-fun c!122761 () Bool)

(declare-fun e!713932 () Bool)

(assert (=> d!138557 (= c!122761 e!713932)))

(declare-fun res!837168 () Bool)

(assert (=> d!138557 (=> (not res!837168) (not e!713932))))

(assert (=> d!138557 (= res!837168 (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(assert (=> d!138557 (= lt!567775 e!713923)))

(declare-fun c!122759 () Bool)

(assert (=> d!138557 (= c!122759 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138557 (validMask!0 mask!1466)))

(assert (=> d!138557 (= (getCurrentListMap!4531 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567779)))

(declare-fun b!1256122 () Bool)

(declare-fun e!713929 () ListLongMap!18571)

(declare-fun call!61820 () ListLongMap!18571)

(assert (=> b!1256122 (= e!713929 call!61820)))

(declare-fun b!1256123 () Bool)

(declare-fun e!713931 () Bool)

(assert (=> b!1256123 (= e!713931 (validKeyInArray!0 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256124 () Bool)

(declare-fun Unit!41748 () Unit!41741)

(assert (=> b!1256124 (= e!713928 Unit!41748)))

(declare-fun b!1256125 () Bool)

(assert (=> b!1256125 (= e!713924 (= (apply!995 lt!567779 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)) (get!20152 (select (arr!39298 _values!914) #b00000000000000000000000000000000) (dynLambda!3447 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1256125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39835 _values!914)))))

(assert (=> b!1256125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(declare-fun b!1256126 () Bool)

(declare-fun res!837169 () Bool)

(assert (=> b!1256126 (=> (not res!837169) (not e!713926))))

(assert (=> b!1256126 (= res!837169 e!713935)))

(declare-fun res!837170 () Bool)

(assert (=> b!1256126 (=> res!837170 e!713935)))

(assert (=> b!1256126 (= res!837170 (not e!713931))))

(declare-fun res!837172 () Bool)

(assert (=> b!1256126 (=> (not res!837172) (not e!713931))))

(assert (=> b!1256126 (= res!837172 (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(declare-fun b!1256127 () Bool)

(declare-fun call!61822 () ListLongMap!18571)

(assert (=> b!1256127 (= e!713929 call!61822)))

(declare-fun b!1256128 () Bool)

(assert (=> b!1256128 (= e!713934 call!61820)))

(declare-fun b!1256129 () Bool)

(declare-fun c!122760 () Bool)

(assert (=> b!1256129 (= c!122760 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1256129 (= e!713934 e!713929)))

(declare-fun b!1256130 () Bool)

(declare-fun lt!567780 () Unit!41741)

(assert (=> b!1256130 (= e!713928 lt!567780)))

(declare-fun lt!567778 () ListLongMap!18571)

(assert (=> b!1256130 (= lt!567778 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567781 () (_ BitVec 64))

(assert (=> b!1256130 (= lt!567781 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567785 () (_ BitVec 64))

(assert (=> b!1256130 (= lt!567785 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567783 () Unit!41741)

(assert (=> b!1256130 (= lt!567783 (addStillContains!1087 lt!567778 lt!567781 zeroValue!871 lt!567785))))

(assert (=> b!1256130 (contains!7551 (+!4234 lt!567778 (tuple2!20691 lt!567781 zeroValue!871)) lt!567785)))

(declare-fun lt!567776 () Unit!41741)

(assert (=> b!1256130 (= lt!567776 lt!567783)))

(declare-fun lt!567786 () ListLongMap!18571)

(assert (=> b!1256130 (= lt!567786 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567793 () (_ BitVec 64))

(assert (=> b!1256130 (= lt!567793 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567773 () (_ BitVec 64))

(assert (=> b!1256130 (= lt!567773 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567784 () Unit!41741)

(assert (=> b!1256130 (= lt!567784 (addApplyDifferent!529 lt!567786 lt!567793 minValueBefore!43 lt!567773))))

(assert (=> b!1256130 (= (apply!995 (+!4234 lt!567786 (tuple2!20691 lt!567793 minValueBefore!43)) lt!567773) (apply!995 lt!567786 lt!567773))))

(declare-fun lt!567774 () Unit!41741)

(assert (=> b!1256130 (= lt!567774 lt!567784)))

(declare-fun lt!567787 () ListLongMap!18571)

(assert (=> b!1256130 (= lt!567787 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567777 () (_ BitVec 64))

(assert (=> b!1256130 (= lt!567777 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567792 () (_ BitVec 64))

(assert (=> b!1256130 (= lt!567792 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567788 () Unit!41741)

(assert (=> b!1256130 (= lt!567788 (addApplyDifferent!529 lt!567787 lt!567777 zeroValue!871 lt!567792))))

(assert (=> b!1256130 (= (apply!995 (+!4234 lt!567787 (tuple2!20691 lt!567777 zeroValue!871)) lt!567792) (apply!995 lt!567787 lt!567792))))

(declare-fun lt!567794 () Unit!41741)

(assert (=> b!1256130 (= lt!567794 lt!567788)))

(declare-fun lt!567790 () ListLongMap!18571)

(assert (=> b!1256130 (= lt!567790 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567791 () (_ BitVec 64))

(assert (=> b!1256130 (= lt!567791 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!567782 () (_ BitVec 64))

(assert (=> b!1256130 (= lt!567782 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1256130 (= lt!567780 (addApplyDifferent!529 lt!567790 lt!567791 minValueBefore!43 lt!567782))))

(assert (=> b!1256130 (= (apply!995 (+!4234 lt!567790 (tuple2!20691 lt!567791 minValueBefore!43)) lt!567782) (apply!995 lt!567790 lt!567782))))

(declare-fun bm!61813 () Bool)

(declare-fun call!61817 () Bool)

(assert (=> bm!61813 (= call!61817 (contains!7551 lt!567779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!61814 () Bool)

(declare-fun call!61819 () ListLongMap!18571)

(declare-fun call!61816 () ListLongMap!18571)

(assert (=> bm!61814 (= call!61819 call!61816)))

(declare-fun b!1256131 () Bool)

(declare-fun res!837164 () Bool)

(assert (=> b!1256131 (=> (not res!837164) (not e!713926))))

(declare-fun e!713930 () Bool)

(assert (=> b!1256131 (= res!837164 e!713930)))

(declare-fun c!122764 () Bool)

(assert (=> b!1256131 (= c!122764 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1256132 () Bool)

(declare-fun e!713925 () Bool)

(assert (=> b!1256132 (= e!713925 (= (apply!995 lt!567779 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1256133 () Bool)

(assert (=> b!1256133 (= e!713930 e!713925)))

(declare-fun res!837167 () Bool)

(assert (=> b!1256133 (= res!837167 call!61817)))

(assert (=> b!1256133 (=> (not res!837167) (not e!713925))))

(declare-fun b!1256134 () Bool)

(assert (=> b!1256134 (= e!713927 (= (apply!995 lt!567779 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun bm!61815 () Bool)

(declare-fun call!61821 () ListLongMap!18571)

(assert (=> bm!61815 (= call!61821 (+!4234 (ite c!122759 call!61816 (ite c!122763 call!61819 call!61822)) (ite (or c!122759 c!122763) (tuple2!20691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!61816 () Bool)

(assert (=> bm!61816 (= call!61820 call!61821)))

(declare-fun bm!61817 () Bool)

(assert (=> bm!61817 (= call!61816 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun bm!61818 () Bool)

(assert (=> bm!61818 (= call!61822 call!61819)))

(declare-fun b!1256135 () Bool)

(assert (=> b!1256135 (= e!713932 (validKeyInArray!0 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256136 () Bool)

(assert (=> b!1256136 (= e!713923 (+!4234 call!61821 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1256137 () Bool)

(assert (=> b!1256137 (= e!713930 (not call!61817))))

(declare-fun bm!61819 () Bool)

(assert (=> bm!61819 (= call!61818 (contains!7551 lt!567779 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256138 () Bool)

(assert (=> b!1256138 (= e!713933 (not call!61818))))

(assert (= (and d!138557 c!122759) b!1256136))

(assert (= (and d!138557 (not c!122759)) b!1256121))

(assert (= (and b!1256121 c!122763) b!1256128))

(assert (= (and b!1256121 (not c!122763)) b!1256129))

(assert (= (and b!1256129 c!122760) b!1256122))

(assert (= (and b!1256129 (not c!122760)) b!1256127))

(assert (= (or b!1256122 b!1256127) bm!61818))

(assert (= (or b!1256128 bm!61818) bm!61814))

(assert (= (or b!1256128 b!1256122) bm!61816))

(assert (= (or b!1256136 bm!61814) bm!61817))

(assert (= (or b!1256136 bm!61816) bm!61815))

(assert (= (and d!138557 res!837168) b!1256135))

(assert (= (and d!138557 c!122761) b!1256130))

(assert (= (and d!138557 (not c!122761)) b!1256124))

(assert (= (and d!138557 res!837166) b!1256126))

(assert (= (and b!1256126 res!837172) b!1256123))

(assert (= (and b!1256126 (not res!837170)) b!1256120))

(assert (= (and b!1256120 res!837171) b!1256125))

(assert (= (and b!1256126 res!837169) b!1256131))

(assert (= (and b!1256131 c!122764) b!1256133))

(assert (= (and b!1256131 (not c!122764)) b!1256137))

(assert (= (and b!1256133 res!837167) b!1256132))

(assert (= (or b!1256133 b!1256137) bm!61813))

(assert (= (and b!1256131 res!837164) b!1256119))

(assert (= (and b!1256119 c!122762) b!1256118))

(assert (= (and b!1256119 (not c!122762)) b!1256138))

(assert (= (and b!1256118 res!837165) b!1256134))

(assert (= (or b!1256118 b!1256138) bm!61819))

(declare-fun b_lambda!22623 () Bool)

(assert (=> (not b_lambda!22623) (not b!1256125)))

(assert (=> b!1256125 t!41407))

(declare-fun b_and!44825 () Bool)

(assert (= b_and!44823 (and (=> t!41407 result!23297) b_and!44825)))

(declare-fun m!1157243 () Bool)

(assert (=> b!1256130 m!1157243))

(declare-fun m!1157245 () Bool)

(assert (=> b!1256130 m!1157245))

(declare-fun m!1157247 () Bool)

(assert (=> b!1256130 m!1157247))

(declare-fun m!1157249 () Bool)

(assert (=> b!1256130 m!1157249))

(declare-fun m!1157251 () Bool)

(assert (=> b!1256130 m!1157251))

(declare-fun m!1157253 () Bool)

(assert (=> b!1256130 m!1157253))

(declare-fun m!1157255 () Bool)

(assert (=> b!1256130 m!1157255))

(declare-fun m!1157257 () Bool)

(assert (=> b!1256130 m!1157257))

(declare-fun m!1157259 () Bool)

(assert (=> b!1256130 m!1157259))

(assert (=> b!1256130 m!1157257))

(declare-fun m!1157261 () Bool)

(assert (=> b!1256130 m!1157261))

(declare-fun m!1157263 () Bool)

(assert (=> b!1256130 m!1157263))

(assert (=> b!1256130 m!1157261))

(assert (=> b!1256130 m!1157205))

(declare-fun m!1157265 () Bool)

(assert (=> b!1256130 m!1157265))

(assert (=> b!1256130 m!1157103))

(declare-fun m!1157267 () Bool)

(assert (=> b!1256130 m!1157267))

(declare-fun m!1157269 () Bool)

(assert (=> b!1256130 m!1157269))

(declare-fun m!1157271 () Bool)

(assert (=> b!1256130 m!1157271))

(assert (=> b!1256130 m!1157245))

(assert (=> b!1256130 m!1157249))

(assert (=> b!1256125 m!1157215))

(assert (=> b!1256125 m!1157217))

(assert (=> b!1256125 m!1157219))

(assert (=> b!1256125 m!1157215))

(assert (=> b!1256125 m!1157217))

(assert (=> b!1256125 m!1157205))

(assert (=> b!1256125 m!1157205))

(declare-fun m!1157273 () Bool)

(assert (=> b!1256125 m!1157273))

(declare-fun m!1157275 () Bool)

(assert (=> bm!61819 m!1157275))

(declare-fun m!1157277 () Bool)

(assert (=> bm!61813 m!1157277))

(declare-fun m!1157279 () Bool)

(assert (=> b!1256134 m!1157279))

(assert (=> b!1256120 m!1157205))

(assert (=> b!1256120 m!1157205))

(declare-fun m!1157281 () Bool)

(assert (=> b!1256120 m!1157281))

(declare-fun m!1157283 () Bool)

(assert (=> b!1256132 m!1157283))

(declare-fun m!1157285 () Bool)

(assert (=> b!1256136 m!1157285))

(assert (=> b!1256123 m!1157205))

(assert (=> b!1256123 m!1157205))

(assert (=> b!1256123 m!1157235))

(declare-fun m!1157287 () Bool)

(assert (=> bm!61815 m!1157287))

(assert (=> bm!61817 m!1157103))

(assert (=> b!1256135 m!1157205))

(assert (=> b!1256135 m!1157205))

(assert (=> b!1256135 m!1157235))

(assert (=> d!138557 m!1157093))

(assert (=> b!1255988 d!138557))

(declare-fun d!138559 () Bool)

(declare-fun lt!567795 () ListLongMap!18571)

(assert (=> d!138559 (not (contains!7551 lt!567795 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138559 (= lt!567795 (ListLongMap!18572 (removeStrictlySorted!138 (toList!9301 lt!567648) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138559 (= (-!2038 lt!567648 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567795)))

(declare-fun bs!35474 () Bool)

(assert (= bs!35474 d!138559))

(declare-fun m!1157289 () Bool)

(assert (=> bs!35474 m!1157289))

(declare-fun m!1157291 () Bool)

(assert (=> bs!35474 m!1157291))

(assert (=> b!1255988 d!138559))

(declare-fun d!138561 () Bool)

(assert (=> d!138561 (= (-!2038 (+!4234 lt!567646 (tuple2!20691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!567646)))

(declare-fun lt!567798 () Unit!41741)

(declare-fun choose!1859 (ListLongMap!18571 (_ BitVec 64) V!47887) Unit!41741)

(assert (=> d!138561 (= lt!567798 (choose!1859 lt!567646 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> d!138561 (not (contains!7551 lt!567646 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138561 (= (addThenRemoveForNewKeyIsSame!328 lt!567646 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43) lt!567798)))

(declare-fun bs!35475 () Bool)

(assert (= bs!35475 d!138561))

(assert (=> bs!35475 m!1157089))

(assert (=> bs!35475 m!1157089))

(declare-fun m!1157293 () Bool)

(assert (=> bs!35475 m!1157293))

(declare-fun m!1157295 () Bool)

(assert (=> bs!35475 m!1157295))

(declare-fun m!1157297 () Bool)

(assert (=> bs!35475 m!1157297))

(assert (=> b!1255988 d!138561))

(declare-fun b!1256147 () Bool)

(declare-fun e!713944 () Bool)

(declare-fun call!61825 () Bool)

(assert (=> b!1256147 (= e!713944 call!61825)))

(declare-fun bm!61822 () Bool)

(assert (=> bm!61822 (= call!61825 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1256148 () Bool)

(declare-fun e!713942 () Bool)

(declare-fun e!713943 () Bool)

(assert (=> b!1256148 (= e!713942 e!713943)))

(declare-fun c!122767 () Bool)

(assert (=> b!1256148 (= c!122767 (validKeyInArray!0 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256149 () Bool)

(assert (=> b!1256149 (= e!713943 call!61825)))

(declare-fun d!138563 () Bool)

(declare-fun res!837177 () Bool)

(assert (=> d!138563 (=> res!837177 e!713942)))

(assert (=> d!138563 (= res!837177 (bvsge #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(assert (=> d!138563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!713942)))

(declare-fun b!1256150 () Bool)

(assert (=> b!1256150 (= e!713943 e!713944)))

(declare-fun lt!567807 () (_ BitVec 64))

(assert (=> b!1256150 (= lt!567807 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!567806 () Unit!41741)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81481 (_ BitVec 64) (_ BitVec 32)) Unit!41741)

(assert (=> b!1256150 (= lt!567806 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!567807 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1256150 (arrayContainsKey!0 _keys!1118 lt!567807 #b00000000000000000000000000000000)))

(declare-fun lt!567805 () Unit!41741)

(assert (=> b!1256150 (= lt!567805 lt!567806)))

(declare-fun res!837178 () Bool)

(declare-datatypes ((SeekEntryResult!9920 0))(
  ( (MissingZero!9920 (index!42051 (_ BitVec 32))) (Found!9920 (index!42052 (_ BitVec 32))) (Intermediate!9920 (undefined!10732 Bool) (index!42053 (_ BitVec 32)) (x!110435 (_ BitVec 32))) (Undefined!9920) (MissingVacant!9920 (index!42054 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81481 (_ BitVec 32)) SeekEntryResult!9920)

(assert (=> b!1256150 (= res!837178 (= (seekEntryOrOpen!0 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9920 #b00000000000000000000000000000000)))))

(assert (=> b!1256150 (=> (not res!837178) (not e!713944))))

(assert (= (and d!138563 (not res!837177)) b!1256148))

(assert (= (and b!1256148 c!122767) b!1256150))

(assert (= (and b!1256148 (not c!122767)) b!1256149))

(assert (= (and b!1256150 res!837178) b!1256147))

(assert (= (or b!1256147 b!1256149) bm!61822))

(declare-fun m!1157299 () Bool)

(assert (=> bm!61822 m!1157299))

(assert (=> b!1256148 m!1157205))

(assert (=> b!1256148 m!1157205))

(assert (=> b!1256148 m!1157235))

(assert (=> b!1256150 m!1157205))

(declare-fun m!1157301 () Bool)

(assert (=> b!1256150 m!1157301))

(declare-fun m!1157303 () Bool)

(assert (=> b!1256150 m!1157303))

(assert (=> b!1256150 m!1157205))

(declare-fun m!1157305 () Bool)

(assert (=> b!1256150 m!1157305))

(assert (=> b!1255990 d!138563))

(declare-fun d!138565 () Bool)

(assert (=> d!138565 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105518 d!138565))

(declare-fun d!138567 () Bool)

(assert (=> d!138567 (= (array_inv!30075 _keys!1118) (bvsge (size!39834 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105518 d!138567))

(declare-fun d!138569 () Bool)

(assert (=> d!138569 (= (array_inv!30076 _values!914) (bvsge (size!39835 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105518 d!138569))

(declare-fun b!1256161 () Bool)

(declare-fun e!713953 () Bool)

(declare-fun e!713956 () Bool)

(assert (=> b!1256161 (= e!713953 e!713956)))

(declare-fun res!837187 () Bool)

(assert (=> b!1256161 (=> (not res!837187) (not e!713956))))

(declare-fun e!713954 () Bool)

(assert (=> b!1256161 (= res!837187 (not e!713954))))

(declare-fun res!837185 () Bool)

(assert (=> b!1256161 (=> (not res!837185) (not e!713954))))

(assert (=> b!1256161 (= res!837185 (validKeyInArray!0 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256162 () Bool)

(declare-fun e!713955 () Bool)

(declare-fun call!61828 () Bool)

(assert (=> b!1256162 (= e!713955 call!61828)))

(declare-fun b!1256163 () Bool)

(declare-fun contains!7553 (List!27927 (_ BitVec 64)) Bool)

(assert (=> b!1256163 (= e!713954 (contains!7553 Nil!27924 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61825 () Bool)

(declare-fun c!122770 () Bool)

(assert (=> bm!61825 (= call!61828 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122770 (Cons!27923 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000) Nil!27924) Nil!27924)))))

(declare-fun d!138571 () Bool)

(declare-fun res!837186 () Bool)

(assert (=> d!138571 (=> res!837186 e!713953)))

(assert (=> d!138571 (= res!837186 (bvsge #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(assert (=> d!138571 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27924) e!713953)))

(declare-fun b!1256164 () Bool)

(assert (=> b!1256164 (= e!713955 call!61828)))

(declare-fun b!1256165 () Bool)

(assert (=> b!1256165 (= e!713956 e!713955)))

(assert (=> b!1256165 (= c!122770 (validKeyInArray!0 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138571 (not res!837186)) b!1256161))

(assert (= (and b!1256161 res!837185) b!1256163))

(assert (= (and b!1256161 res!837187) b!1256165))

(assert (= (and b!1256165 c!122770) b!1256162))

(assert (= (and b!1256165 (not c!122770)) b!1256164))

(assert (= (or b!1256162 b!1256164) bm!61825))

(assert (=> b!1256161 m!1157205))

(assert (=> b!1256161 m!1157205))

(assert (=> b!1256161 m!1157235))

(assert (=> b!1256163 m!1157205))

(assert (=> b!1256163 m!1157205))

(declare-fun m!1157307 () Bool)

(assert (=> b!1256163 m!1157307))

(assert (=> bm!61825 m!1157205))

(declare-fun m!1157309 () Bool)

(assert (=> bm!61825 m!1157309))

(assert (=> b!1256165 m!1157205))

(assert (=> b!1256165 m!1157205))

(assert (=> b!1256165 m!1157235))

(assert (=> b!1255991 d!138571))

(declare-fun d!138573 () Bool)

(assert (=> d!138573 (= (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!567810 () Unit!41741)

(declare-fun choose!1860 (array!81481 array!81483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47887 V!47887 V!47887 V!47887 (_ BitVec 32) Int) Unit!41741)

(assert (=> d!138573 (= lt!567810 (choose!1860 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138573 (validMask!0 mask!1466)))

(assert (=> d!138573 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1038 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567810)))

(declare-fun bs!35476 () Bool)

(assert (= bs!35476 d!138573))

(assert (=> bs!35476 m!1157103))

(assert (=> bs!35476 m!1157101))

(declare-fun m!1157311 () Bool)

(assert (=> bs!35476 m!1157311))

(assert (=> bs!35476 m!1157093))

(assert (=> b!1255986 d!138573))

(declare-fun b!1256190 () Bool)

(declare-fun e!713973 () Bool)

(declare-fun e!713975 () Bool)

(assert (=> b!1256190 (= e!713973 e!713975)))

(assert (=> b!1256190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(declare-fun res!837197 () Bool)

(declare-fun lt!567826 () ListLongMap!18571)

(assert (=> b!1256190 (= res!837197 (contains!7551 lt!567826 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256190 (=> (not res!837197) (not e!713975))))

(declare-fun b!1256191 () Bool)

(declare-fun lt!567828 () Unit!41741)

(declare-fun lt!567831 () Unit!41741)

(assert (=> b!1256191 (= lt!567828 lt!567831)))

(declare-fun lt!567829 () ListLongMap!18571)

(declare-fun lt!567825 () (_ BitVec 64))

(declare-fun lt!567827 () V!47887)

(declare-fun lt!567830 () (_ BitVec 64))

(assert (=> b!1256191 (not (contains!7551 (+!4234 lt!567829 (tuple2!20691 lt!567830 lt!567827)) lt!567825))))

(declare-fun addStillNotContains!316 (ListLongMap!18571 (_ BitVec 64) V!47887 (_ BitVec 64)) Unit!41741)

(assert (=> b!1256191 (= lt!567831 (addStillNotContains!316 lt!567829 lt!567830 lt!567827 lt!567825))))

(assert (=> b!1256191 (= lt!567825 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1256191 (= lt!567827 (get!20152 (select (arr!39298 _values!914) #b00000000000000000000000000000000) (dynLambda!3447 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1256191 (= lt!567830 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61831 () ListLongMap!18571)

(assert (=> b!1256191 (= lt!567829 call!61831)))

(declare-fun e!713971 () ListLongMap!18571)

(assert (=> b!1256191 (= e!713971 (+!4234 call!61831 (tuple2!20691 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000) (get!20152 (select (arr!39298 _values!914) #b00000000000000000000000000000000) (dynLambda!3447 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1256192 () Bool)

(declare-fun e!713972 () Bool)

(assert (=> b!1256192 (= e!713972 e!713973)))

(declare-fun c!122780 () Bool)

(declare-fun e!713977 () Bool)

(assert (=> b!1256192 (= c!122780 e!713977)))

(declare-fun res!837199 () Bool)

(assert (=> b!1256192 (=> (not res!837199) (not e!713977))))

(assert (=> b!1256192 (= res!837199 (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(declare-fun b!1256193 () Bool)

(assert (=> b!1256193 (= e!713971 call!61831)))

(declare-fun b!1256194 () Bool)

(assert (=> b!1256194 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(assert (=> b!1256194 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39835 _values!914)))))

(assert (=> b!1256194 (= e!713975 (= (apply!995 lt!567826 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)) (get!20152 (select (arr!39298 _values!914) #b00000000000000000000000000000000) (dynLambda!3447 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1256195 () Bool)

(declare-fun e!713974 () Bool)

(declare-fun isEmpty!1032 (ListLongMap!18571) Bool)

(assert (=> b!1256195 (= e!713974 (isEmpty!1032 lt!567826))))

(declare-fun b!1256196 () Bool)

(declare-fun res!837196 () Bool)

(assert (=> b!1256196 (=> (not res!837196) (not e!713972))))

(assert (=> b!1256196 (= res!837196 (not (contains!7551 lt!567826 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1256197 () Bool)

(assert (=> b!1256197 (= e!713974 (= lt!567826 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138575 () Bool)

(assert (=> d!138575 e!713972))

(declare-fun res!837198 () Bool)

(assert (=> d!138575 (=> (not res!837198) (not e!713972))))

(assert (=> d!138575 (= res!837198 (not (contains!7551 lt!567826 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!713976 () ListLongMap!18571)

(assert (=> d!138575 (= lt!567826 e!713976)))

(declare-fun c!122781 () Bool)

(assert (=> d!138575 (= c!122781 (bvsge #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(assert (=> d!138575 (validMask!0 mask!1466)))

(assert (=> d!138575 (= (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567826)))

(declare-fun bm!61828 () Bool)

(assert (=> bm!61828 (= call!61831 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1256198 () Bool)

(assert (=> b!1256198 (= e!713977 (validKeyInArray!0 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256198 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1256199 () Bool)

(assert (=> b!1256199 (= e!713976 e!713971)))

(declare-fun c!122782 () Bool)

(assert (=> b!1256199 (= c!122782 (validKeyInArray!0 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256200 () Bool)

(assert (=> b!1256200 (= e!713973 e!713974)))

(declare-fun c!122779 () Bool)

(assert (=> b!1256200 (= c!122779 (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(declare-fun b!1256201 () Bool)

(assert (=> b!1256201 (= e!713976 (ListLongMap!18572 Nil!27923))))

(assert (= (and d!138575 c!122781) b!1256201))

(assert (= (and d!138575 (not c!122781)) b!1256199))

(assert (= (and b!1256199 c!122782) b!1256191))

(assert (= (and b!1256199 (not c!122782)) b!1256193))

(assert (= (or b!1256191 b!1256193) bm!61828))

(assert (= (and d!138575 res!837198) b!1256196))

(assert (= (and b!1256196 res!837196) b!1256192))

(assert (= (and b!1256192 res!837199) b!1256198))

(assert (= (and b!1256192 c!122780) b!1256190))

(assert (= (and b!1256192 (not c!122780)) b!1256200))

(assert (= (and b!1256190 res!837197) b!1256194))

(assert (= (and b!1256200 c!122779) b!1256197))

(assert (= (and b!1256200 (not c!122779)) b!1256195))

(declare-fun b_lambda!22625 () Bool)

(assert (=> (not b_lambda!22625) (not b!1256191)))

(assert (=> b!1256191 t!41407))

(declare-fun b_and!44827 () Bool)

(assert (= b_and!44825 (and (=> t!41407 result!23297) b_and!44827)))

(declare-fun b_lambda!22627 () Bool)

(assert (=> (not b_lambda!22627) (not b!1256194)))

(assert (=> b!1256194 t!41407))

(declare-fun b_and!44829 () Bool)

(assert (= b_and!44827 (and (=> t!41407 result!23297) b_and!44829)))

(declare-fun m!1157313 () Bool)

(assert (=> b!1256195 m!1157313))

(assert (=> b!1256198 m!1157205))

(assert (=> b!1256198 m!1157205))

(assert (=> b!1256198 m!1157235))

(declare-fun m!1157315 () Bool)

(assert (=> b!1256191 m!1157315))

(assert (=> b!1256191 m!1157215))

(declare-fun m!1157317 () Bool)

(assert (=> b!1256191 m!1157317))

(assert (=> b!1256191 m!1157217))

(declare-fun m!1157319 () Bool)

(assert (=> b!1256191 m!1157319))

(assert (=> b!1256191 m!1157317))

(declare-fun m!1157321 () Bool)

(assert (=> b!1256191 m!1157321))

(assert (=> b!1256191 m!1157215))

(assert (=> b!1256191 m!1157217))

(assert (=> b!1256191 m!1157219))

(assert (=> b!1256191 m!1157205))

(declare-fun m!1157323 () Bool)

(assert (=> b!1256197 m!1157323))

(declare-fun m!1157325 () Bool)

(assert (=> b!1256196 m!1157325))

(assert (=> b!1256199 m!1157205))

(assert (=> b!1256199 m!1157205))

(assert (=> b!1256199 m!1157235))

(assert (=> b!1256194 m!1157215))

(assert (=> b!1256194 m!1157217))

(assert (=> b!1256194 m!1157205))

(declare-fun m!1157327 () Bool)

(assert (=> b!1256194 m!1157327))

(assert (=> b!1256194 m!1157215))

(assert (=> b!1256194 m!1157217))

(assert (=> b!1256194 m!1157219))

(assert (=> b!1256194 m!1157205))

(declare-fun m!1157329 () Bool)

(assert (=> d!138575 m!1157329))

(assert (=> d!138575 m!1157093))

(assert (=> b!1256190 m!1157205))

(assert (=> b!1256190 m!1157205))

(declare-fun m!1157331 () Bool)

(assert (=> b!1256190 m!1157331))

(assert (=> bm!61828 m!1157323))

(assert (=> b!1255986 d!138575))

(declare-fun b!1256202 () Bool)

(declare-fun e!713980 () Bool)

(declare-fun e!713982 () Bool)

(assert (=> b!1256202 (= e!713980 e!713982)))

(assert (=> b!1256202 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(declare-fun res!837201 () Bool)

(declare-fun lt!567833 () ListLongMap!18571)

(assert (=> b!1256202 (= res!837201 (contains!7551 lt!567833 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256202 (=> (not res!837201) (not e!713982))))

(declare-fun b!1256203 () Bool)

(declare-fun lt!567835 () Unit!41741)

(declare-fun lt!567838 () Unit!41741)

(assert (=> b!1256203 (= lt!567835 lt!567838)))

(declare-fun lt!567832 () (_ BitVec 64))

(declare-fun lt!567834 () V!47887)

(declare-fun lt!567837 () (_ BitVec 64))

(declare-fun lt!567836 () ListLongMap!18571)

(assert (=> b!1256203 (not (contains!7551 (+!4234 lt!567836 (tuple2!20691 lt!567837 lt!567834)) lt!567832))))

(assert (=> b!1256203 (= lt!567838 (addStillNotContains!316 lt!567836 lt!567837 lt!567834 lt!567832))))

(assert (=> b!1256203 (= lt!567832 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1256203 (= lt!567834 (get!20152 (select (arr!39298 _values!914) #b00000000000000000000000000000000) (dynLambda!3447 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1256203 (= lt!567837 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61832 () ListLongMap!18571)

(assert (=> b!1256203 (= lt!567836 call!61832)))

(declare-fun e!713978 () ListLongMap!18571)

(assert (=> b!1256203 (= e!713978 (+!4234 call!61832 (tuple2!20691 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000) (get!20152 (select (arr!39298 _values!914) #b00000000000000000000000000000000) (dynLambda!3447 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1256204 () Bool)

(declare-fun e!713979 () Bool)

(assert (=> b!1256204 (= e!713979 e!713980)))

(declare-fun c!122784 () Bool)

(declare-fun e!713984 () Bool)

(assert (=> b!1256204 (= c!122784 e!713984)))

(declare-fun res!837203 () Bool)

(assert (=> b!1256204 (=> (not res!837203) (not e!713984))))

(assert (=> b!1256204 (= res!837203 (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(declare-fun b!1256205 () Bool)

(assert (=> b!1256205 (= e!713978 call!61832)))

(declare-fun b!1256206 () Bool)

(assert (=> b!1256206 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(assert (=> b!1256206 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39835 _values!914)))))

(assert (=> b!1256206 (= e!713982 (= (apply!995 lt!567833 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)) (get!20152 (select (arr!39298 _values!914) #b00000000000000000000000000000000) (dynLambda!3447 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1256207 () Bool)

(declare-fun e!713981 () Bool)

(assert (=> b!1256207 (= e!713981 (isEmpty!1032 lt!567833))))

(declare-fun b!1256208 () Bool)

(declare-fun res!837200 () Bool)

(assert (=> b!1256208 (=> (not res!837200) (not e!713979))))

(assert (=> b!1256208 (= res!837200 (not (contains!7551 lt!567833 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1256209 () Bool)

(assert (=> b!1256209 (= e!713981 (= lt!567833 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138577 () Bool)

(assert (=> d!138577 e!713979))

(declare-fun res!837202 () Bool)

(assert (=> d!138577 (=> (not res!837202) (not e!713979))))

(assert (=> d!138577 (= res!837202 (not (contains!7551 lt!567833 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!713983 () ListLongMap!18571)

(assert (=> d!138577 (= lt!567833 e!713983)))

(declare-fun c!122785 () Bool)

(assert (=> d!138577 (= c!122785 (bvsge #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(assert (=> d!138577 (validMask!0 mask!1466)))

(assert (=> d!138577 (= (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!567833)))

(declare-fun bm!61829 () Bool)

(assert (=> bm!61829 (= call!61832 (getCurrentListMapNoExtraKeys!5724 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1256210 () Bool)

(assert (=> b!1256210 (= e!713984 (validKeyInArray!0 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1256210 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1256211 () Bool)

(assert (=> b!1256211 (= e!713983 e!713978)))

(declare-fun c!122786 () Bool)

(assert (=> b!1256211 (= c!122786 (validKeyInArray!0 (select (arr!39297 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1256212 () Bool)

(assert (=> b!1256212 (= e!713980 e!713981)))

(declare-fun c!122783 () Bool)

(assert (=> b!1256212 (= c!122783 (bvslt #b00000000000000000000000000000000 (size!39834 _keys!1118)))))

(declare-fun b!1256213 () Bool)

(assert (=> b!1256213 (= e!713983 (ListLongMap!18572 Nil!27923))))

(assert (= (and d!138577 c!122785) b!1256213))

(assert (= (and d!138577 (not c!122785)) b!1256211))

(assert (= (and b!1256211 c!122786) b!1256203))

(assert (= (and b!1256211 (not c!122786)) b!1256205))

(assert (= (or b!1256203 b!1256205) bm!61829))

(assert (= (and d!138577 res!837202) b!1256208))

(assert (= (and b!1256208 res!837200) b!1256204))

(assert (= (and b!1256204 res!837203) b!1256210))

(assert (= (and b!1256204 c!122784) b!1256202))

(assert (= (and b!1256204 (not c!122784)) b!1256212))

(assert (= (and b!1256202 res!837201) b!1256206))

(assert (= (and b!1256212 c!122783) b!1256209))

(assert (= (and b!1256212 (not c!122783)) b!1256207))

(declare-fun b_lambda!22629 () Bool)

(assert (=> (not b_lambda!22629) (not b!1256203)))

(assert (=> b!1256203 t!41407))

(declare-fun b_and!44831 () Bool)

(assert (= b_and!44829 (and (=> t!41407 result!23297) b_and!44831)))

(declare-fun b_lambda!22631 () Bool)

(assert (=> (not b_lambda!22631) (not b!1256206)))

(assert (=> b!1256206 t!41407))

(declare-fun b_and!44833 () Bool)

(assert (= b_and!44831 (and (=> t!41407 result!23297) b_and!44833)))

(declare-fun m!1157333 () Bool)

(assert (=> b!1256207 m!1157333))

(assert (=> b!1256210 m!1157205))

(assert (=> b!1256210 m!1157205))

(assert (=> b!1256210 m!1157235))

(declare-fun m!1157335 () Bool)

(assert (=> b!1256203 m!1157335))

(assert (=> b!1256203 m!1157215))

(declare-fun m!1157337 () Bool)

(assert (=> b!1256203 m!1157337))

(assert (=> b!1256203 m!1157217))

(declare-fun m!1157339 () Bool)

(assert (=> b!1256203 m!1157339))

(assert (=> b!1256203 m!1157337))

(declare-fun m!1157341 () Bool)

(assert (=> b!1256203 m!1157341))

(assert (=> b!1256203 m!1157215))

(assert (=> b!1256203 m!1157217))

(assert (=> b!1256203 m!1157219))

(assert (=> b!1256203 m!1157205))

(declare-fun m!1157343 () Bool)

(assert (=> b!1256209 m!1157343))

(declare-fun m!1157345 () Bool)

(assert (=> b!1256208 m!1157345))

(assert (=> b!1256211 m!1157205))

(assert (=> b!1256211 m!1157205))

(assert (=> b!1256211 m!1157235))

(assert (=> b!1256206 m!1157215))

(assert (=> b!1256206 m!1157217))

(assert (=> b!1256206 m!1157205))

(declare-fun m!1157347 () Bool)

(assert (=> b!1256206 m!1157347))

(assert (=> b!1256206 m!1157215))

(assert (=> b!1256206 m!1157217))

(assert (=> b!1256206 m!1157219))

(assert (=> b!1256206 m!1157205))

(declare-fun m!1157349 () Bool)

(assert (=> d!138577 m!1157349))

(assert (=> d!138577 m!1157093))

(assert (=> b!1256202 m!1157205))

(assert (=> b!1256202 m!1157205))

(declare-fun m!1157351 () Bool)

(assert (=> b!1256202 m!1157351))

(assert (=> bm!61829 m!1157343))

(assert (=> b!1255986 d!138577))

(declare-fun mapIsEmpty!49624 () Bool)

(declare-fun mapRes!49624 () Bool)

(assert (=> mapIsEmpty!49624 mapRes!49624))

(declare-fun condMapEmpty!49624 () Bool)

(declare-fun mapDefault!49624 () ValueCell!15182)

(assert (=> mapNonEmpty!49615 (= condMapEmpty!49624 (= mapRest!49615 ((as const (Array (_ BitVec 32) ValueCell!15182)) mapDefault!49624)))))

(declare-fun e!713989 () Bool)

(assert (=> mapNonEmpty!49615 (= tp!94475 (and e!713989 mapRes!49624))))

(declare-fun b!1256221 () Bool)

(assert (=> b!1256221 (= e!713989 tp_is_empty!31891)))

(declare-fun mapNonEmpty!49624 () Bool)

(declare-fun tp!94490 () Bool)

(declare-fun e!713990 () Bool)

(assert (=> mapNonEmpty!49624 (= mapRes!49624 (and tp!94490 e!713990))))

(declare-fun mapValue!49624 () ValueCell!15182)

(declare-fun mapKey!49624 () (_ BitVec 32))

(declare-fun mapRest!49624 () (Array (_ BitVec 32) ValueCell!15182))

(assert (=> mapNonEmpty!49624 (= mapRest!49615 (store mapRest!49624 mapKey!49624 mapValue!49624))))

(declare-fun b!1256220 () Bool)

(assert (=> b!1256220 (= e!713990 tp_is_empty!31891)))

(assert (= (and mapNonEmpty!49615 condMapEmpty!49624) mapIsEmpty!49624))

(assert (= (and mapNonEmpty!49615 (not condMapEmpty!49624)) mapNonEmpty!49624))

(assert (= (and mapNonEmpty!49624 ((_ is ValueCellFull!15182) mapValue!49624)) b!1256220))

(assert (= (and mapNonEmpty!49615 ((_ is ValueCellFull!15182) mapDefault!49624)) b!1256221))

(declare-fun m!1157353 () Bool)

(assert (=> mapNonEmpty!49624 m!1157353))

(declare-fun b_lambda!22633 () Bool)

(assert (= b_lambda!22629 (or (and start!105518 b_free!26989) b_lambda!22633)))

(declare-fun b_lambda!22635 () Bool)

(assert (= b_lambda!22625 (or (and start!105518 b_free!26989) b_lambda!22635)))

(declare-fun b_lambda!22637 () Bool)

(assert (= b_lambda!22631 (or (and start!105518 b_free!26989) b_lambda!22637)))

(declare-fun b_lambda!22639 () Bool)

(assert (= b_lambda!22623 (or (and start!105518 b_free!26989) b_lambda!22639)))

(declare-fun b_lambda!22641 () Bool)

(assert (= b_lambda!22621 (or (and start!105518 b_free!26989) b_lambda!22641)))

(declare-fun b_lambda!22643 () Bool)

(assert (= b_lambda!22627 (or (and start!105518 b_free!26989) b_lambda!22643)))

(check-sat (not b!1256196) (not bm!61806) (not b!1256102) (not b!1256135) (not b!1256165) (not b!1256150) (not bm!61812) (not bm!61825) (not b!1256161) (not b!1256132) (not b!1256203) (not bm!61813) (not bm!61819) (not b!1256194) (not b!1256134) (not d!138551) (not b!1256123) (not b!1256136) (not b!1256197) (not bm!61829) (not b!1256125) (not b_lambda!22641) (not d!138573) (not b!1256191) (not b!1256190) b_and!44833 tp_is_empty!31891 (not bm!61817) (not b_lambda!22635) (not b!1256148) (not b!1256052) (not d!138577) (not b!1256207) (not b_lambda!22643) (not b!1256208) (not bm!61808) (not bm!61828) (not b!1256111) (not b!1256206) (not b!1256097) (not b!1256198) (not b!1256209) (not b!1256113) (not b!1256210) (not b!1256195) (not b!1256202) (not b_lambda!22637) (not b!1256120) (not d!138553) (not b_lambda!22633) (not b!1256100) (not b!1256199) (not d!138559) (not bm!61822) (not d!138575) (not b!1256051) (not b!1256130) (not b_next!26989) (not bm!61815) (not b!1256163) (not b!1256107) (not d!138555) (not mapNonEmpty!49624) (not b!1256211) (not b_lambda!22639) (not bm!61810) (not d!138557) (not b!1256109) (not d!138561) (not b!1256112))
(check-sat b_and!44833 (not b_next!26989))
