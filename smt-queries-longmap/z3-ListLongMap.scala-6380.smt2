; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82018 () Bool)

(assert start!82018)

(declare-fun b_free!18441 () Bool)

(declare-fun b_next!18441 () Bool)

(assert (=> start!82018 (= b_free!18441 (not b_next!18441))))

(declare-fun tp!64130 () Bool)

(declare-fun b_and!29927 () Bool)

(assert (=> start!82018 (= tp!64130 b_and!29927)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!33059 0))(
  ( (V!33060 (val!10579 Int)) )
))
(declare-fun zeroValue!1139 () V!33059)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58211 0))(
  ( (array!58212 (arr!27985 (Array (_ BitVec 32) (_ BitVec 64))) (size!28464 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58211)

(declare-datatypes ((ValueCell!10047 0))(
  ( (ValueCellFull!10047 (v!13134 V!33059)) (EmptyCell!10047) )
))
(declare-datatypes ((array!58213 0))(
  ( (array!58214 (arr!27986 (Array (_ BitVec 32) ValueCell!10047)) (size!28465 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58213)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun b!956561 () Bool)

(declare-fun e!539034 () Bool)

(declare-fun minValue!1139 () V!33059)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13688 0))(
  ( (tuple2!13689 (_1!6855 (_ BitVec 64)) (_2!6855 V!33059)) )
))
(declare-datatypes ((List!19487 0))(
  ( (Nil!19484) (Cons!19483 (h!20645 tuple2!13688) (t!27848 List!19487)) )
))
(declare-datatypes ((ListLongMap!12385 0))(
  ( (ListLongMap!12386 (toList!6208 List!19487)) )
))
(declare-fun contains!5306 (ListLongMap!12385 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3441 (array!58211 array!58213 (_ BitVec 32) (_ BitVec 32) V!33059 V!33059 (_ BitVec 32) Int) ListLongMap!12385)

(assert (=> b!956561 (= e!539034 (not (contains!5306 (getCurrentListMap!3441 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27985 _keys!1441) i!735))))))

(declare-fun b!956562 () Bool)

(declare-fun e!539038 () Bool)

(declare-fun e!539035 () Bool)

(declare-fun mapRes!33547 () Bool)

(assert (=> b!956562 (= e!539038 (and e!539035 mapRes!33547))))

(declare-fun condMapEmpty!33547 () Bool)

(declare-fun mapDefault!33547 () ValueCell!10047)

(assert (=> b!956562 (= condMapEmpty!33547 (= (arr!27986 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10047)) mapDefault!33547)))))

(declare-fun mapIsEmpty!33547 () Bool)

(assert (=> mapIsEmpty!33547 mapRes!33547))

(declare-fun mapNonEmpty!33547 () Bool)

(declare-fun tp!64131 () Bool)

(declare-fun e!539037 () Bool)

(assert (=> mapNonEmpty!33547 (= mapRes!33547 (and tp!64131 e!539037))))

(declare-fun mapValue!33547 () ValueCell!10047)

(declare-fun mapKey!33547 () (_ BitVec 32))

(declare-fun mapRest!33547 () (Array (_ BitVec 32) ValueCell!10047))

(assert (=> mapNonEmpty!33547 (= (arr!27986 _values!1197) (store mapRest!33547 mapKey!33547 mapValue!33547))))

(declare-fun b!956563 () Bool)

(declare-fun tp_is_empty!21057 () Bool)

(assert (=> b!956563 (= e!539037 tp_is_empty!21057)))

(declare-fun b!956564 () Bool)

(declare-fun res!640471 () Bool)

(assert (=> b!956564 (=> (not res!640471) (not e!539034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956564 (= res!640471 (validKeyInArray!0 (select (arr!27985 _keys!1441) i!735)))))

(declare-fun b!956565 () Bool)

(declare-fun res!640472 () Bool)

(assert (=> b!956565 (=> (not res!640472) (not e!539034))))

(declare-datatypes ((List!19488 0))(
  ( (Nil!19485) (Cons!19484 (h!20646 (_ BitVec 64)) (t!27849 List!19488)) )
))
(declare-fun arrayNoDuplicates!0 (array!58211 (_ BitVec 32) List!19488) Bool)

(assert (=> b!956565 (= res!640472 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19485))))

(declare-fun b!956566 () Bool)

(declare-fun res!640473 () Bool)

(assert (=> b!956566 (=> (not res!640473) (not e!539034))))

(assert (=> b!956566 (= res!640473 (and (= (size!28465 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28464 _keys!1441) (size!28465 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956560 () Bool)

(declare-fun res!640468 () Bool)

(assert (=> b!956560 (=> (not res!640468) (not e!539034))))

(assert (=> b!956560 (= res!640468 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28464 _keys!1441))))))

(declare-fun res!640470 () Bool)

(assert (=> start!82018 (=> (not res!640470) (not e!539034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82018 (= res!640470 (validMask!0 mask!1823))))

(assert (=> start!82018 e!539034))

(assert (=> start!82018 true))

(assert (=> start!82018 tp_is_empty!21057))

(declare-fun array_inv!21711 (array!58211) Bool)

(assert (=> start!82018 (array_inv!21711 _keys!1441)))

(declare-fun array_inv!21712 (array!58213) Bool)

(assert (=> start!82018 (and (array_inv!21712 _values!1197) e!539038)))

(assert (=> start!82018 tp!64130))

(declare-fun b!956567 () Bool)

(assert (=> b!956567 (= e!539035 tp_is_empty!21057)))

(declare-fun b!956568 () Bool)

(declare-fun res!640469 () Bool)

(assert (=> b!956568 (=> (not res!640469) (not e!539034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58211 (_ BitVec 32)) Bool)

(assert (=> b!956568 (= res!640469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(assert (= (and start!82018 res!640470) b!956566))

(assert (= (and b!956566 res!640473) b!956568))

(assert (= (and b!956568 res!640469) b!956565))

(assert (= (and b!956565 res!640472) b!956560))

(assert (= (and b!956560 res!640468) b!956564))

(assert (= (and b!956564 res!640471) b!956561))

(assert (= (and b!956562 condMapEmpty!33547) mapIsEmpty!33547))

(assert (= (and b!956562 (not condMapEmpty!33547)) mapNonEmpty!33547))

(get-info :version)

(assert (= (and mapNonEmpty!33547 ((_ is ValueCellFull!10047) mapValue!33547)) b!956563))

(assert (= (and b!956562 ((_ is ValueCellFull!10047) mapDefault!33547)) b!956567))

(assert (= start!82018 b!956562))

(declare-fun m!887797 () Bool)

(assert (=> start!82018 m!887797))

(declare-fun m!887799 () Bool)

(assert (=> start!82018 m!887799))

(declare-fun m!887801 () Bool)

(assert (=> start!82018 m!887801))

(declare-fun m!887803 () Bool)

(assert (=> b!956564 m!887803))

(assert (=> b!956564 m!887803))

(declare-fun m!887805 () Bool)

(assert (=> b!956564 m!887805))

(declare-fun m!887807 () Bool)

(assert (=> mapNonEmpty!33547 m!887807))

(declare-fun m!887809 () Bool)

(assert (=> b!956568 m!887809))

(declare-fun m!887811 () Bool)

(assert (=> b!956561 m!887811))

(assert (=> b!956561 m!887803))

(assert (=> b!956561 m!887811))

(assert (=> b!956561 m!887803))

(declare-fun m!887813 () Bool)

(assert (=> b!956561 m!887813))

(declare-fun m!887815 () Bool)

(assert (=> b!956565 m!887815))

(check-sat (not start!82018) (not b_next!18441) (not b!956561) tp_is_empty!21057 (not b!956564) (not mapNonEmpty!33547) (not b!956568) b_and!29927 (not b!956565))
(check-sat b_and!29927 (not b_next!18441))
(get-model)

(declare-fun d!115839 () Bool)

(assert (=> d!115839 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!82018 d!115839))

(declare-fun d!115841 () Bool)

(assert (=> d!115841 (= (array_inv!21711 _keys!1441) (bvsge (size!28464 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!82018 d!115841))

(declare-fun d!115843 () Bool)

(assert (=> d!115843 (= (array_inv!21712 _values!1197) (bvsge (size!28465 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!82018 d!115843))

(declare-fun b!956604 () Bool)

(declare-fun e!539062 () Bool)

(declare-fun call!41681 () Bool)

(assert (=> b!956604 (= e!539062 call!41681)))

(declare-fun d!115845 () Bool)

(declare-fun res!640496 () Bool)

(declare-fun e!539060 () Bool)

(assert (=> d!115845 (=> res!640496 e!539060)))

(assert (=> d!115845 (= res!640496 (bvsge #b00000000000000000000000000000000 (size!28464 _keys!1441)))))

(assert (=> d!115845 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!539060)))

(declare-fun b!956605 () Bool)

(declare-fun e!539061 () Bool)

(assert (=> b!956605 (= e!539060 e!539061)))

(declare-fun c!99869 () Bool)

(assert (=> b!956605 (= c!99869 (validKeyInArray!0 (select (arr!27985 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun bm!41678 () Bool)

(assert (=> bm!41678 (= call!41681 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(declare-fun b!956606 () Bool)

(assert (=> b!956606 (= e!539061 e!539062)))

(declare-fun lt!430164 () (_ BitVec 64))

(assert (=> b!956606 (= lt!430164 (select (arr!27985 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32135 0))(
  ( (Unit!32136) )
))
(declare-fun lt!430165 () Unit!32135)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58211 (_ BitVec 64) (_ BitVec 32)) Unit!32135)

(assert (=> b!956606 (= lt!430165 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!430164 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!956606 (arrayContainsKey!0 _keys!1441 lt!430164 #b00000000000000000000000000000000)))

(declare-fun lt!430166 () Unit!32135)

(assert (=> b!956606 (= lt!430166 lt!430165)))

(declare-fun res!640497 () Bool)

(declare-datatypes ((SeekEntryResult!9188 0))(
  ( (MissingZero!9188 (index!39123 (_ BitVec 32))) (Found!9188 (index!39124 (_ BitVec 32))) (Intermediate!9188 (undefined!10000 Bool) (index!39125 (_ BitVec 32)) (x!82432 (_ BitVec 32))) (Undefined!9188) (MissingVacant!9188 (index!39126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58211 (_ BitVec 32)) SeekEntryResult!9188)

(assert (=> b!956606 (= res!640497 (= (seekEntryOrOpen!0 (select (arr!27985 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9188 #b00000000000000000000000000000000)))))

(assert (=> b!956606 (=> (not res!640497) (not e!539062))))

(declare-fun b!956607 () Bool)

(assert (=> b!956607 (= e!539061 call!41681)))

(assert (= (and d!115845 (not res!640496)) b!956605))

(assert (= (and b!956605 c!99869) b!956606))

(assert (= (and b!956605 (not c!99869)) b!956607))

(assert (= (and b!956606 res!640497) b!956604))

(assert (= (or b!956604 b!956607) bm!41678))

(declare-fun m!887837 () Bool)

(assert (=> b!956605 m!887837))

(assert (=> b!956605 m!887837))

(declare-fun m!887839 () Bool)

(assert (=> b!956605 m!887839))

(declare-fun m!887841 () Bool)

(assert (=> bm!41678 m!887841))

(assert (=> b!956606 m!887837))

(declare-fun m!887843 () Bool)

(assert (=> b!956606 m!887843))

(declare-fun m!887845 () Bool)

(assert (=> b!956606 m!887845))

(assert (=> b!956606 m!887837))

(declare-fun m!887847 () Bool)

(assert (=> b!956606 m!887847))

(assert (=> b!956568 d!115845))

(declare-fun d!115847 () Bool)

(assert (=> d!115847 (= (validKeyInArray!0 (select (arr!27985 _keys!1441) i!735)) (and (not (= (select (arr!27985 _keys!1441) i!735) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27985 _keys!1441) i!735) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!956564 d!115847))

(declare-fun d!115849 () Bool)

(declare-fun e!539067 () Bool)

(assert (=> d!115849 e!539067))

(declare-fun res!640500 () Bool)

(assert (=> d!115849 (=> res!640500 e!539067)))

(declare-fun lt!430177 () Bool)

(assert (=> d!115849 (= res!640500 (not lt!430177))))

(declare-fun lt!430176 () Bool)

(assert (=> d!115849 (= lt!430177 lt!430176)))

(declare-fun lt!430178 () Unit!32135)

(declare-fun e!539068 () Unit!32135)

(assert (=> d!115849 (= lt!430178 e!539068)))

(declare-fun c!99872 () Bool)

(assert (=> d!115849 (= c!99872 lt!430176)))

(declare-fun containsKey!475 (List!19487 (_ BitVec 64)) Bool)

(assert (=> d!115849 (= lt!430176 (containsKey!475 (toList!6208 (getCurrentListMap!3441 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205)) (select (arr!27985 _keys!1441) i!735)))))

(assert (=> d!115849 (= (contains!5306 (getCurrentListMap!3441 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27985 _keys!1441) i!735)) lt!430177)))

(declare-fun b!956614 () Bool)

(declare-fun lt!430175 () Unit!32135)

(assert (=> b!956614 (= e!539068 lt!430175)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!371 (List!19487 (_ BitVec 64)) Unit!32135)

(assert (=> b!956614 (= lt!430175 (lemmaContainsKeyImpliesGetValueByKeyDefined!371 (toList!6208 (getCurrentListMap!3441 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205)) (select (arr!27985 _keys!1441) i!735)))))

(declare-datatypes ((Option!514 0))(
  ( (Some!513 (v!13136 V!33059)) (None!512) )
))
(declare-fun isDefined!380 (Option!514) Bool)

(declare-fun getValueByKey!508 (List!19487 (_ BitVec 64)) Option!514)

(assert (=> b!956614 (isDefined!380 (getValueByKey!508 (toList!6208 (getCurrentListMap!3441 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205)) (select (arr!27985 _keys!1441) i!735)))))

(declare-fun b!956615 () Bool)

(declare-fun Unit!32137 () Unit!32135)

(assert (=> b!956615 (= e!539068 Unit!32137)))

(declare-fun b!956616 () Bool)

(assert (=> b!956616 (= e!539067 (isDefined!380 (getValueByKey!508 (toList!6208 (getCurrentListMap!3441 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205)) (select (arr!27985 _keys!1441) i!735))))))

(assert (= (and d!115849 c!99872) b!956614))

(assert (= (and d!115849 (not c!99872)) b!956615))

(assert (= (and d!115849 (not res!640500)) b!956616))

(assert (=> d!115849 m!887803))

(declare-fun m!887849 () Bool)

(assert (=> d!115849 m!887849))

(assert (=> b!956614 m!887803))

(declare-fun m!887851 () Bool)

(assert (=> b!956614 m!887851))

(assert (=> b!956614 m!887803))

(declare-fun m!887853 () Bool)

(assert (=> b!956614 m!887853))

(assert (=> b!956614 m!887853))

(declare-fun m!887855 () Bool)

(assert (=> b!956614 m!887855))

(assert (=> b!956616 m!887803))

(assert (=> b!956616 m!887853))

(assert (=> b!956616 m!887853))

(assert (=> b!956616 m!887855))

(assert (=> b!956561 d!115849))

(declare-fun b!956659 () Bool)

(declare-fun e!539104 () Bool)

(declare-fun e!539102 () Bool)

(assert (=> b!956659 (= e!539104 e!539102)))

(declare-fun c!99886 () Bool)

(assert (=> b!956659 (= c!99886 (not (= (bvand extraKeys!1118 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!956660 () Bool)

(declare-fun e!539096 () Bool)

(assert (=> b!956660 (= e!539102 e!539096)))

(declare-fun res!640526 () Bool)

(declare-fun call!41699 () Bool)

(assert (=> b!956660 (= res!640526 call!41699)))

(assert (=> b!956660 (=> (not res!640526) (not e!539096))))

(declare-fun b!956661 () Bool)

(declare-fun lt!430227 () ListLongMap!12385)

(declare-fun apply!889 (ListLongMap!12385 (_ BitVec 64)) V!33059)

(assert (=> b!956661 (= e!539096 (= (apply!889 lt!430227 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1139))))

(declare-fun b!956662 () Bool)

(declare-fun e!539100 () Unit!32135)

(declare-fun Unit!32138 () Unit!32135)

(assert (=> b!956662 (= e!539100 Unit!32138)))

(declare-fun b!956663 () Bool)

(declare-fun e!539103 () ListLongMap!12385)

(declare-fun call!41698 () ListLongMap!12385)

(declare-fun +!2873 (ListLongMap!12385 tuple2!13688) ListLongMap!12385)

(assert (=> b!956663 (= e!539103 (+!2873 call!41698 (tuple2!13689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1139)))))

(declare-fun b!956664 () Bool)

(declare-fun lt!430233 () Unit!32135)

(assert (=> b!956664 (= e!539100 lt!430233)))

(declare-fun lt!430236 () ListLongMap!12385)

(declare-fun getCurrentListMapNoExtraKeys!3328 (array!58211 array!58213 (_ BitVec 32) (_ BitVec 32) V!33059 V!33059 (_ BitVec 32) Int) ListLongMap!12385)

(assert (=> b!956664 (= lt!430236 (getCurrentListMapNoExtraKeys!3328 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun lt!430228 () (_ BitVec 64))

(assert (=> b!956664 (= lt!430228 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430224 () (_ BitVec 64))

(assert (=> b!956664 (= lt!430224 (select (arr!27985 _keys!1441) i!735))))

(declare-fun lt!430235 () Unit!32135)

(declare-fun addStillContains!592 (ListLongMap!12385 (_ BitVec 64) V!33059 (_ BitVec 64)) Unit!32135)

(assert (=> b!956664 (= lt!430235 (addStillContains!592 lt!430236 lt!430228 zeroValue!1139 lt!430224))))

(assert (=> b!956664 (contains!5306 (+!2873 lt!430236 (tuple2!13689 lt!430228 zeroValue!1139)) lt!430224)))

(declare-fun lt!430237 () Unit!32135)

(assert (=> b!956664 (= lt!430237 lt!430235)))

(declare-fun lt!430239 () ListLongMap!12385)

(assert (=> b!956664 (= lt!430239 (getCurrentListMapNoExtraKeys!3328 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun lt!430244 () (_ BitVec 64))

(assert (=> b!956664 (= lt!430244 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430238 () (_ BitVec 64))

(assert (=> b!956664 (= lt!430238 (select (arr!27985 _keys!1441) i!735))))

(declare-fun lt!430225 () Unit!32135)

(declare-fun addApplyDifferent!472 (ListLongMap!12385 (_ BitVec 64) V!33059 (_ BitVec 64)) Unit!32135)

(assert (=> b!956664 (= lt!430225 (addApplyDifferent!472 lt!430239 lt!430244 minValue!1139 lt!430238))))

(assert (=> b!956664 (= (apply!889 (+!2873 lt!430239 (tuple2!13689 lt!430244 minValue!1139)) lt!430238) (apply!889 lt!430239 lt!430238))))

(declare-fun lt!430241 () Unit!32135)

(assert (=> b!956664 (= lt!430241 lt!430225)))

(declare-fun lt!430243 () ListLongMap!12385)

(assert (=> b!956664 (= lt!430243 (getCurrentListMapNoExtraKeys!3328 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun lt!430242 () (_ BitVec 64))

(assert (=> b!956664 (= lt!430242 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430229 () (_ BitVec 64))

(assert (=> b!956664 (= lt!430229 (select (arr!27985 _keys!1441) i!735))))

(declare-fun lt!430223 () Unit!32135)

(assert (=> b!956664 (= lt!430223 (addApplyDifferent!472 lt!430243 lt!430242 zeroValue!1139 lt!430229))))

(assert (=> b!956664 (= (apply!889 (+!2873 lt!430243 (tuple2!13689 lt!430242 zeroValue!1139)) lt!430229) (apply!889 lt!430243 lt!430229))))

(declare-fun lt!430231 () Unit!32135)

(assert (=> b!956664 (= lt!430231 lt!430223)))

(declare-fun lt!430230 () ListLongMap!12385)

(assert (=> b!956664 (= lt!430230 (getCurrentListMapNoExtraKeys!3328 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun lt!430240 () (_ BitVec 64))

(assert (=> b!956664 (= lt!430240 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430226 () (_ BitVec 64))

(assert (=> b!956664 (= lt!430226 (select (arr!27985 _keys!1441) i!735))))

(assert (=> b!956664 (= lt!430233 (addApplyDifferent!472 lt!430230 lt!430240 minValue!1139 lt!430226))))

(assert (=> b!956664 (= (apply!889 (+!2873 lt!430230 (tuple2!13689 lt!430240 minValue!1139)) lt!430226) (apply!889 lt!430230 lt!430226))))

(declare-fun bm!41693 () Bool)

(assert (=> bm!41693 (= call!41699 (contains!5306 lt!430227 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!956665 () Bool)

(declare-fun e!539107 () ListLongMap!12385)

(declare-fun call!41697 () ListLongMap!12385)

(assert (=> b!956665 (= e!539107 call!41697)))

(declare-fun d!115851 () Bool)

(assert (=> d!115851 e!539104))

(declare-fun res!640522 () Bool)

(assert (=> d!115851 (=> (not res!640522) (not e!539104))))

(assert (=> d!115851 (= res!640522 (or (bvsge i!735 (size!28464 _keys!1441)) (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28464 _keys!1441)))))))

(declare-fun lt!430232 () ListLongMap!12385)

(assert (=> d!115851 (= lt!430227 lt!430232)))

(declare-fun lt!430234 () Unit!32135)

(assert (=> d!115851 (= lt!430234 e!539100)))

(declare-fun c!99887 () Bool)

(declare-fun e!539101 () Bool)

(assert (=> d!115851 (= c!99887 e!539101)))

(declare-fun res!640523 () Bool)

(assert (=> d!115851 (=> (not res!640523) (not e!539101))))

(assert (=> d!115851 (= res!640523 (bvslt i!735 (size!28464 _keys!1441)))))

(assert (=> d!115851 (= lt!430232 e!539103)))

(declare-fun c!99888 () Bool)

(assert (=> d!115851 (= c!99888 (and (not (= (bvand extraKeys!1118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1118 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115851 (validMask!0 mask!1823)))

(assert (=> d!115851 (= (getCurrentListMap!3441 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) lt!430227)))

(declare-fun b!956666 () Bool)

(declare-fun e!539105 () Bool)

(declare-fun get!14672 (ValueCell!10047 V!33059) V!33059)

(declare-fun dynLambda!1662 (Int (_ BitVec 64)) V!33059)

(assert (=> b!956666 (= e!539105 (= (apply!889 lt!430227 (select (arr!27985 _keys!1441) i!735)) (get!14672 (select (arr!27986 _values!1197) i!735) (dynLambda!1662 defaultEntry!1205 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!956666 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28465 _values!1197)))))

(assert (=> b!956666 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28464 _keys!1441)))))

(declare-fun b!956667 () Bool)

(assert (=> b!956667 (= e!539101 (validKeyInArray!0 (select (arr!27985 _keys!1441) i!735)))))

(declare-fun b!956668 () Bool)

(assert (=> b!956668 (= e!539103 e!539107)))

(declare-fun c!99889 () Bool)

(assert (=> b!956668 (= c!99889 (and (not (= (bvand extraKeys!1118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1118 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41694 () Bool)

(declare-fun call!41700 () Bool)

(assert (=> bm!41694 (= call!41700 (contains!5306 lt!430227 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41695 () Bool)

(declare-fun call!41702 () ListLongMap!12385)

(declare-fun call!41701 () ListLongMap!12385)

(assert (=> bm!41695 (= call!41702 call!41701)))

(declare-fun call!41696 () ListLongMap!12385)

(declare-fun bm!41696 () Bool)

(assert (=> bm!41696 (= call!41696 (getCurrentListMapNoExtraKeys!3328 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205))))

(declare-fun bm!41697 () Bool)

(assert (=> bm!41697 (= call!41698 (+!2873 (ite c!99888 call!41696 (ite c!99889 call!41701 call!41702)) (ite (or c!99888 c!99889) (tuple2!13689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1139) (tuple2!13689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1139))))))

(declare-fun b!956669 () Bool)

(declare-fun e!539098 () Bool)

(declare-fun e!539099 () Bool)

(assert (=> b!956669 (= e!539098 e!539099)))

(declare-fun res!640520 () Bool)

(assert (=> b!956669 (= res!640520 call!41700)))

(assert (=> b!956669 (=> (not res!640520) (not e!539099))))

(declare-fun b!956670 () Bool)

(declare-fun e!539097 () Bool)

(assert (=> b!956670 (= e!539097 e!539105)))

(declare-fun res!640519 () Bool)

(assert (=> b!956670 (=> (not res!640519) (not e!539105))))

(assert (=> b!956670 (= res!640519 (contains!5306 lt!430227 (select (arr!27985 _keys!1441) i!735)))))

(assert (=> b!956670 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28464 _keys!1441)))))

(declare-fun b!956671 () Bool)

(declare-fun e!539095 () ListLongMap!12385)

(assert (=> b!956671 (= e!539095 call!41697)))

(declare-fun b!956672 () Bool)

(declare-fun res!640521 () Bool)

(assert (=> b!956672 (=> (not res!640521) (not e!539104))))

(assert (=> b!956672 (= res!640521 e!539097)))

(declare-fun res!640524 () Bool)

(assert (=> b!956672 (=> res!640524 e!539097)))

(declare-fun e!539106 () Bool)

(assert (=> b!956672 (= res!640524 (not e!539106))))

(declare-fun res!640527 () Bool)

(assert (=> b!956672 (=> (not res!640527) (not e!539106))))

(assert (=> b!956672 (= res!640527 (bvslt i!735 (size!28464 _keys!1441)))))

(declare-fun b!956673 () Bool)

(declare-fun res!640525 () Bool)

(assert (=> b!956673 (=> (not res!640525) (not e!539104))))

(assert (=> b!956673 (= res!640525 e!539098)))

(declare-fun c!99890 () Bool)

(assert (=> b!956673 (= c!99890 (not (= (bvand extraKeys!1118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41698 () Bool)

(assert (=> bm!41698 (= call!41701 call!41696)))

(declare-fun bm!41699 () Bool)

(assert (=> bm!41699 (= call!41697 call!41698)))

(declare-fun b!956674 () Bool)

(assert (=> b!956674 (= e!539106 (validKeyInArray!0 (select (arr!27985 _keys!1441) i!735)))))

(declare-fun b!956675 () Bool)

(assert (=> b!956675 (= e!539102 (not call!41699))))

(declare-fun b!956676 () Bool)

(declare-fun c!99885 () Bool)

(assert (=> b!956676 (= c!99885 (and (not (= (bvand extraKeys!1118 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!956676 (= e!539107 e!539095)))

(declare-fun b!956677 () Bool)

(assert (=> b!956677 (= e!539095 call!41702)))

(declare-fun b!956678 () Bool)

(assert (=> b!956678 (= e!539099 (= (apply!889 lt!430227 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1139))))

(declare-fun b!956679 () Bool)

(assert (=> b!956679 (= e!539098 (not call!41700))))

(assert (= (and d!115851 c!99888) b!956663))

(assert (= (and d!115851 (not c!99888)) b!956668))

(assert (= (and b!956668 c!99889) b!956665))

(assert (= (and b!956668 (not c!99889)) b!956676))

(assert (= (and b!956676 c!99885) b!956671))

(assert (= (and b!956676 (not c!99885)) b!956677))

(assert (= (or b!956671 b!956677) bm!41695))

(assert (= (or b!956665 bm!41695) bm!41698))

(assert (= (or b!956665 b!956671) bm!41699))

(assert (= (or b!956663 bm!41698) bm!41696))

(assert (= (or b!956663 bm!41699) bm!41697))

(assert (= (and d!115851 res!640523) b!956667))

(assert (= (and d!115851 c!99887) b!956664))

(assert (= (and d!115851 (not c!99887)) b!956662))

(assert (= (and d!115851 res!640522) b!956672))

(assert (= (and b!956672 res!640527) b!956674))

(assert (= (and b!956672 (not res!640524)) b!956670))

(assert (= (and b!956670 res!640519) b!956666))

(assert (= (and b!956672 res!640521) b!956673))

(assert (= (and b!956673 c!99890) b!956669))

(assert (= (and b!956673 (not c!99890)) b!956679))

(assert (= (and b!956669 res!640520) b!956678))

(assert (= (or b!956669 b!956679) bm!41694))

(assert (= (and b!956673 res!640525) b!956659))

(assert (= (and b!956659 c!99886) b!956660))

(assert (= (and b!956659 (not c!99886)) b!956675))

(assert (= (and b!956660 res!640526) b!956661))

(assert (= (or b!956660 b!956675) bm!41693))

(declare-fun b_lambda!14427 () Bool)

(assert (=> (not b_lambda!14427) (not b!956666)))

(declare-fun t!27853 () Bool)

(declare-fun tb!6213 () Bool)

(assert (=> (and start!82018 (= defaultEntry!1205 defaultEntry!1205) t!27853) tb!6213))

(declare-fun result!12371 () Bool)

(assert (=> tb!6213 (= result!12371 tp_is_empty!21057)))

(assert (=> b!956666 t!27853))

(declare-fun b_and!29931 () Bool)

(assert (= b_and!29927 (and (=> t!27853 result!12371) b_and!29931)))

(assert (=> d!115851 m!887797))

(declare-fun m!887857 () Bool)

(assert (=> bm!41694 m!887857))

(assert (=> b!956667 m!887803))

(assert (=> b!956667 m!887803))

(assert (=> b!956667 m!887805))

(declare-fun m!887859 () Bool)

(assert (=> b!956664 m!887859))

(declare-fun m!887861 () Bool)

(assert (=> b!956664 m!887861))

(declare-fun m!887863 () Bool)

(assert (=> b!956664 m!887863))

(declare-fun m!887865 () Bool)

(assert (=> b!956664 m!887865))

(assert (=> b!956664 m!887859))

(declare-fun m!887867 () Bool)

(assert (=> b!956664 m!887867))

(declare-fun m!887869 () Bool)

(assert (=> b!956664 m!887869))

(declare-fun m!887871 () Bool)

(assert (=> b!956664 m!887871))

(declare-fun m!887873 () Bool)

(assert (=> b!956664 m!887873))

(declare-fun m!887875 () Bool)

(assert (=> b!956664 m!887875))

(declare-fun m!887877 () Bool)

(assert (=> b!956664 m!887877))

(declare-fun m!887879 () Bool)

(assert (=> b!956664 m!887879))

(assert (=> b!956664 m!887803))

(assert (=> b!956664 m!887867))

(declare-fun m!887881 () Bool)

(assert (=> b!956664 m!887881))

(declare-fun m!887883 () Bool)

(assert (=> b!956664 m!887883))

(declare-fun m!887885 () Bool)

(assert (=> b!956664 m!887885))

(assert (=> b!956664 m!887871))

(declare-fun m!887887 () Bool)

(assert (=> b!956664 m!887887))

(assert (=> b!956664 m!887863))

(declare-fun m!887889 () Bool)

(assert (=> b!956664 m!887889))

(assert (=> b!956670 m!887803))

(assert (=> b!956670 m!887803))

(declare-fun m!887891 () Bool)

(assert (=> b!956670 m!887891))

(assert (=> bm!41696 m!887877))

(declare-fun m!887893 () Bool)

(assert (=> b!956666 m!887893))

(assert (=> b!956666 m!887803))

(declare-fun m!887895 () Bool)

(assert (=> b!956666 m!887895))

(assert (=> b!956666 m!887803))

(declare-fun m!887897 () Bool)

(assert (=> b!956666 m!887897))

(assert (=> b!956666 m!887893))

(declare-fun m!887899 () Bool)

(assert (=> b!956666 m!887899))

(assert (=> b!956666 m!887897))

(declare-fun m!887901 () Bool)

(assert (=> b!956663 m!887901))

(declare-fun m!887903 () Bool)

(assert (=> b!956678 m!887903))

(declare-fun m!887905 () Bool)

(assert (=> bm!41697 m!887905))

(assert (=> b!956674 m!887803))

(assert (=> b!956674 m!887803))

(assert (=> b!956674 m!887805))

(declare-fun m!887907 () Bool)

(assert (=> b!956661 m!887907))

(declare-fun m!887909 () Bool)

(assert (=> bm!41693 m!887909))

(assert (=> b!956561 d!115851))

(declare-fun b!956692 () Bool)

(declare-fun e!539119 () Bool)

(declare-fun call!41705 () Bool)

(assert (=> b!956692 (= e!539119 call!41705)))

(declare-fun d!115853 () Bool)

(declare-fun res!640534 () Bool)

(declare-fun e!539116 () Bool)

(assert (=> d!115853 (=> res!640534 e!539116)))

(assert (=> d!115853 (= res!640534 (bvsge #b00000000000000000000000000000000 (size!28464 _keys!1441)))))

(assert (=> d!115853 (= (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19485) e!539116)))

(declare-fun b!956693 () Bool)

(declare-fun e!539118 () Bool)

(assert (=> b!956693 (= e!539118 e!539119)))

(declare-fun c!99893 () Bool)

(assert (=> b!956693 (= c!99893 (validKeyInArray!0 (select (arr!27985 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!956694 () Bool)

(declare-fun e!539117 () Bool)

(declare-fun contains!5308 (List!19488 (_ BitVec 64)) Bool)

(assert (=> b!956694 (= e!539117 (contains!5308 Nil!19485 (select (arr!27985 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!956695 () Bool)

(assert (=> b!956695 (= e!539119 call!41705)))

(declare-fun bm!41702 () Bool)

(assert (=> bm!41702 (= call!41705 (arrayNoDuplicates!0 _keys!1441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99893 (Cons!19484 (select (arr!27985 _keys!1441) #b00000000000000000000000000000000) Nil!19485) Nil!19485)))))

(declare-fun b!956696 () Bool)

(assert (=> b!956696 (= e!539116 e!539118)))

(declare-fun res!640535 () Bool)

(assert (=> b!956696 (=> (not res!640535) (not e!539118))))

(assert (=> b!956696 (= res!640535 (not e!539117))))

(declare-fun res!640536 () Bool)

(assert (=> b!956696 (=> (not res!640536) (not e!539117))))

(assert (=> b!956696 (= res!640536 (validKeyInArray!0 (select (arr!27985 _keys!1441) #b00000000000000000000000000000000)))))

(assert (= (and d!115853 (not res!640534)) b!956696))

(assert (= (and b!956696 res!640536) b!956694))

(assert (= (and b!956696 res!640535) b!956693))

(assert (= (and b!956693 c!99893) b!956695))

(assert (= (and b!956693 (not c!99893)) b!956692))

(assert (= (or b!956695 b!956692) bm!41702))

(assert (=> b!956693 m!887837))

(assert (=> b!956693 m!887837))

(assert (=> b!956693 m!887839))

(assert (=> b!956694 m!887837))

(assert (=> b!956694 m!887837))

(declare-fun m!887911 () Bool)

(assert (=> b!956694 m!887911))

(assert (=> bm!41702 m!887837))

(declare-fun m!887913 () Bool)

(assert (=> bm!41702 m!887913))

(assert (=> b!956696 m!887837))

(assert (=> b!956696 m!887837))

(assert (=> b!956696 m!887839))

(assert (=> b!956565 d!115853))

(declare-fun b!956704 () Bool)

(declare-fun e!539125 () Bool)

(assert (=> b!956704 (= e!539125 tp_is_empty!21057)))

(declare-fun mapNonEmpty!33553 () Bool)

(declare-fun mapRes!33553 () Bool)

(declare-fun tp!64140 () Bool)

(declare-fun e!539124 () Bool)

(assert (=> mapNonEmpty!33553 (= mapRes!33553 (and tp!64140 e!539124))))

(declare-fun mapKey!33553 () (_ BitVec 32))

(declare-fun mapValue!33553 () ValueCell!10047)

(declare-fun mapRest!33553 () (Array (_ BitVec 32) ValueCell!10047))

(assert (=> mapNonEmpty!33553 (= mapRest!33547 (store mapRest!33553 mapKey!33553 mapValue!33553))))

(declare-fun condMapEmpty!33553 () Bool)

(declare-fun mapDefault!33553 () ValueCell!10047)

(assert (=> mapNonEmpty!33547 (= condMapEmpty!33553 (= mapRest!33547 ((as const (Array (_ BitVec 32) ValueCell!10047)) mapDefault!33553)))))

(assert (=> mapNonEmpty!33547 (= tp!64131 (and e!539125 mapRes!33553))))

(declare-fun mapIsEmpty!33553 () Bool)

(assert (=> mapIsEmpty!33553 mapRes!33553))

(declare-fun b!956703 () Bool)

(assert (=> b!956703 (= e!539124 tp_is_empty!21057)))

(assert (= (and mapNonEmpty!33547 condMapEmpty!33553) mapIsEmpty!33553))

(assert (= (and mapNonEmpty!33547 (not condMapEmpty!33553)) mapNonEmpty!33553))

(assert (= (and mapNonEmpty!33553 ((_ is ValueCellFull!10047) mapValue!33553)) b!956703))

(assert (= (and mapNonEmpty!33547 ((_ is ValueCellFull!10047) mapDefault!33553)) b!956704))

(declare-fun m!887915 () Bool)

(assert (=> mapNonEmpty!33553 m!887915))

(declare-fun b_lambda!14429 () Bool)

(assert (= b_lambda!14427 (or (and start!82018 b_free!18441) b_lambda!14429)))

(check-sat (not bm!41696) (not bm!41693) (not b!956606) (not d!115851) b_and!29931 (not b!956674) (not b!956696) (not b!956694) (not bm!41697) (not b_next!18441) (not b_lambda!14429) (not bm!41694) (not b!956667) (not b!956670) (not b!956666) (not b!956614) (not b!956616) (not b!956693) (not b!956678) (not bm!41702) (not b!956663) (not d!115849) (not bm!41678) (not b!956661) (not b!956664) (not b!956605) (not mapNonEmpty!33553) tp_is_empty!21057)
(check-sat b_and!29931 (not b_next!18441))
