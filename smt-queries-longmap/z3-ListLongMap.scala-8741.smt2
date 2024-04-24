; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106252 () Bool)

(assert start!106252)

(declare-fun b_free!27481 () Bool)

(declare-fun b_next!27481 () Bool)

(assert (=> start!106252 (= b_free!27481 (not b_next!27481))))

(declare-fun tp!95989 () Bool)

(declare-fun b_and!45445 () Bool)

(assert (=> start!106252 (= tp!95989 b_and!45445)))

(declare-fun b!1263940 () Bool)

(declare-fun e!719608 () Bool)

(declare-datatypes ((V!48543 0))(
  ( (V!48544 (val!16254 Int)) )
))
(declare-datatypes ((tuple2!21050 0))(
  ( (tuple2!21051 (_1!10536 (_ BitVec 64)) (_2!10536 V!48543)) )
))
(declare-datatypes ((List!28273 0))(
  ( (Nil!28270) (Cons!28269 (h!29487 tuple2!21050) (t!41774 List!28273)) )
))
(declare-datatypes ((ListLongMap!18931 0))(
  ( (ListLongMap!18932 (toList!9481 List!28273)) )
))
(declare-fun lt!572876 () ListLongMap!18931)

(declare-fun contains!7621 (ListLongMap!18931 (_ BitVec 64)) Bool)

(assert (=> b!1263940 (= e!719608 (not (contains!7621 lt!572876 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719605 () Bool)

(assert (=> b!1263940 e!719605))

(declare-fun res!841675 () Bool)

(assert (=> b!1263940 (=> (not res!841675) (not e!719605))))

(declare-fun minValueBefore!43 () V!48543)

(declare-fun lt!572873 () ListLongMap!18931)

(declare-fun +!4293 (ListLongMap!18931 tuple2!21050) ListLongMap!18931)

(assert (=> b!1263940 (= res!841675 (= lt!572873 (+!4293 lt!572876 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun lt!572875 () ListLongMap!18931)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48543)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48543)

(declare-datatypes ((array!82431 0))(
  ( (array!82432 (arr!39759 (Array (_ BitVec 32) (_ BitVec 64))) (size!40296 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82431)

(declare-datatypes ((ValueCell!15428 0))(
  ( (ValueCellFull!15428 (v!18958 V!48543)) (EmptyCell!15428) )
))
(declare-datatypes ((array!82433 0))(
  ( (array!82434 (arr!39760 (Array (_ BitVec 32) ValueCell!15428)) (size!40297 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82433)

(declare-fun getCurrentListMap!4634 (array!82431 array!82433 (_ BitVec 32) (_ BitVec 32) V!48543 V!48543 (_ BitVec 32) Int) ListLongMap!18931)

(assert (=> b!1263940 (= lt!572875 (getCurrentListMap!4634 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1263940 (= lt!572873 (getCurrentListMap!4634 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263941 () Bool)

(declare-fun lt!572877 () ListLongMap!18931)

(assert (=> b!1263941 (= e!719605 (= lt!572875 lt!572877))))

(declare-fun b!1263942 () Bool)

(declare-fun e!719603 () Bool)

(assert (=> b!1263942 (= e!719603 (not e!719608))))

(declare-fun res!841677 () Bool)

(assert (=> b!1263942 (=> res!841677 e!719608)))

(assert (=> b!1263942 (= res!841677 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1263942 (= lt!572876 lt!572877)))

(declare-datatypes ((Unit!42061 0))(
  ( (Unit!42062) )
))
(declare-fun lt!572874 () Unit!42061)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1175 (array!82431 array!82433 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48543 V!48543 V!48543 V!48543 (_ BitVec 32) Int) Unit!42061)

(assert (=> b!1263942 (= lt!572874 (lemmaNoChangeToArrayThenSameMapNoExtras!1175 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5885 (array!82431 array!82433 (_ BitVec 32) (_ BitVec 32) V!48543 V!48543 (_ BitVec 32) Int) ListLongMap!18931)

(assert (=> b!1263942 (= lt!572877 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263942 (= lt!572876 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50392 () Bool)

(declare-fun mapRes!50392 () Bool)

(declare-fun tp!95990 () Bool)

(declare-fun e!719607 () Bool)

(assert (=> mapNonEmpty!50392 (= mapRes!50392 (and tp!95990 e!719607))))

(declare-fun mapValue!50392 () ValueCell!15428)

(declare-fun mapRest!50392 () (Array (_ BitVec 32) ValueCell!15428))

(declare-fun mapKey!50392 () (_ BitVec 32))

(assert (=> mapNonEmpty!50392 (= (arr!39760 _values!914) (store mapRest!50392 mapKey!50392 mapValue!50392))))

(declare-fun b!1263943 () Bool)

(declare-fun e!719604 () Bool)

(declare-fun e!719609 () Bool)

(assert (=> b!1263943 (= e!719604 (and e!719609 mapRes!50392))))

(declare-fun condMapEmpty!50392 () Bool)

(declare-fun mapDefault!50392 () ValueCell!15428)

(assert (=> b!1263943 (= condMapEmpty!50392 (= (arr!39760 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15428)) mapDefault!50392)))))

(declare-fun b!1263944 () Bool)

(declare-fun res!841674 () Bool)

(assert (=> b!1263944 (=> (not res!841674) (not e!719603))))

(assert (=> b!1263944 (= res!841674 (and (= (size!40297 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40296 _keys!1118) (size!40297 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50392 () Bool)

(assert (=> mapIsEmpty!50392 mapRes!50392))

(declare-fun b!1263945 () Bool)

(declare-fun res!841678 () Bool)

(assert (=> b!1263945 (=> (not res!841678) (not e!719603))))

(declare-datatypes ((List!28274 0))(
  ( (Nil!28271) (Cons!28270 (h!29488 (_ BitVec 64)) (t!41775 List!28274)) )
))
(declare-fun arrayNoDuplicates!0 (array!82431 (_ BitVec 32) List!28274) Bool)

(assert (=> b!1263945 (= res!841678 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28271))))

(declare-fun b!1263947 () Bool)

(declare-fun tp_is_empty!32383 () Bool)

(assert (=> b!1263947 (= e!719609 tp_is_empty!32383)))

(declare-fun b!1263948 () Bool)

(declare-fun res!841676 () Bool)

(assert (=> b!1263948 (=> (not res!841676) (not e!719603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82431 (_ BitVec 32)) Bool)

(assert (=> b!1263948 (= res!841676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1263946 () Bool)

(assert (=> b!1263946 (= e!719607 tp_is_empty!32383)))

(declare-fun res!841673 () Bool)

(assert (=> start!106252 (=> (not res!841673) (not e!719603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106252 (= res!841673 (validMask!0 mask!1466))))

(assert (=> start!106252 e!719603))

(assert (=> start!106252 true))

(assert (=> start!106252 tp!95989))

(assert (=> start!106252 tp_is_empty!32383))

(declare-fun array_inv!30421 (array!82431) Bool)

(assert (=> start!106252 (array_inv!30421 _keys!1118)))

(declare-fun array_inv!30422 (array!82433) Bool)

(assert (=> start!106252 (and (array_inv!30422 _values!914) e!719604)))

(assert (= (and start!106252 res!841673) b!1263944))

(assert (= (and b!1263944 res!841674) b!1263948))

(assert (= (and b!1263948 res!841676) b!1263945))

(assert (= (and b!1263945 res!841678) b!1263942))

(assert (= (and b!1263942 (not res!841677)) b!1263940))

(assert (= (and b!1263940 res!841675) b!1263941))

(assert (= (and b!1263943 condMapEmpty!50392) mapIsEmpty!50392))

(assert (= (and b!1263943 (not condMapEmpty!50392)) mapNonEmpty!50392))

(get-info :version)

(assert (= (and mapNonEmpty!50392 ((_ is ValueCellFull!15428) mapValue!50392)) b!1263946))

(assert (= (and b!1263943 ((_ is ValueCellFull!15428) mapDefault!50392)) b!1263947))

(assert (= start!106252 b!1263943))

(declare-fun m!1164747 () Bool)

(assert (=> b!1263945 m!1164747))

(declare-fun m!1164749 () Bool)

(assert (=> mapNonEmpty!50392 m!1164749))

(declare-fun m!1164751 () Bool)

(assert (=> b!1263942 m!1164751))

(declare-fun m!1164753 () Bool)

(assert (=> b!1263942 m!1164753))

(declare-fun m!1164755 () Bool)

(assert (=> b!1263942 m!1164755))

(declare-fun m!1164757 () Bool)

(assert (=> b!1263940 m!1164757))

(declare-fun m!1164759 () Bool)

(assert (=> b!1263940 m!1164759))

(declare-fun m!1164761 () Bool)

(assert (=> b!1263940 m!1164761))

(declare-fun m!1164763 () Bool)

(assert (=> b!1263940 m!1164763))

(declare-fun m!1164765 () Bool)

(assert (=> b!1263948 m!1164765))

(declare-fun m!1164767 () Bool)

(assert (=> start!106252 m!1164767))

(declare-fun m!1164769 () Bool)

(assert (=> start!106252 m!1164769))

(declare-fun m!1164771 () Bool)

(assert (=> start!106252 m!1164771))

(check-sat (not b_next!27481) (not mapNonEmpty!50392) (not start!106252) b_and!45445 (not b!1263948) (not b!1263940) (not b!1263945) tp_is_empty!32383 (not b!1263942))
(check-sat b_and!45445 (not b_next!27481))
(get-model)

(declare-fun d!139009 () Bool)

(declare-fun e!719656 () Bool)

(assert (=> d!139009 e!719656))

(declare-fun res!841717 () Bool)

(assert (=> d!139009 (=> res!841717 e!719656)))

(declare-fun lt!572917 () Bool)

(assert (=> d!139009 (= res!841717 (not lt!572917))))

(declare-fun lt!572919 () Bool)

(assert (=> d!139009 (= lt!572917 lt!572919)))

(declare-fun lt!572916 () Unit!42061)

(declare-fun e!719657 () Unit!42061)

(assert (=> d!139009 (= lt!572916 e!719657)))

(declare-fun c!123257 () Bool)

(assert (=> d!139009 (= c!123257 lt!572919)))

(declare-fun containsKey!624 (List!28273 (_ BitVec 64)) Bool)

(assert (=> d!139009 (= lt!572919 (containsKey!624 (toList!9481 lt!572876) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!139009 (= (contains!7621 lt!572876 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572917)))

(declare-fun b!1264009 () Bool)

(declare-fun lt!572918 () Unit!42061)

(assert (=> b!1264009 (= e!719657 lt!572918)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!433 (List!28273 (_ BitVec 64)) Unit!42061)

(assert (=> b!1264009 (= lt!572918 (lemmaContainsKeyImpliesGetValueByKeyDefined!433 (toList!9481 lt!572876) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!711 0))(
  ( (Some!710 (v!18961 V!48543)) (None!709) )
))
(declare-fun isDefined!471 (Option!711) Bool)

(declare-fun getValueByKey!660 (List!28273 (_ BitVec 64)) Option!711)

(assert (=> b!1264009 (isDefined!471 (getValueByKey!660 (toList!9481 lt!572876) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264010 () Bool)

(declare-fun Unit!42065 () Unit!42061)

(assert (=> b!1264010 (= e!719657 Unit!42065)))

(declare-fun b!1264011 () Bool)

(assert (=> b!1264011 (= e!719656 (isDefined!471 (getValueByKey!660 (toList!9481 lt!572876) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!139009 c!123257) b!1264009))

(assert (= (and d!139009 (not c!123257)) b!1264010))

(assert (= (and d!139009 (not res!841717)) b!1264011))

(declare-fun m!1164825 () Bool)

(assert (=> d!139009 m!1164825))

(declare-fun m!1164827 () Bool)

(assert (=> b!1264009 m!1164827))

(declare-fun m!1164829 () Bool)

(assert (=> b!1264009 m!1164829))

(assert (=> b!1264009 m!1164829))

(declare-fun m!1164831 () Bool)

(assert (=> b!1264009 m!1164831))

(assert (=> b!1264011 m!1164829))

(assert (=> b!1264011 m!1164829))

(assert (=> b!1264011 m!1164831))

(assert (=> b!1263940 d!139009))

(declare-fun d!139011 () Bool)

(declare-fun e!719660 () Bool)

(assert (=> d!139011 e!719660))

(declare-fun res!841722 () Bool)

(assert (=> d!139011 (=> (not res!841722) (not e!719660))))

(declare-fun lt!572931 () ListLongMap!18931)

(assert (=> d!139011 (= res!841722 (contains!7621 lt!572931 (_1!10536 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!572929 () List!28273)

(assert (=> d!139011 (= lt!572931 (ListLongMap!18932 lt!572929))))

(declare-fun lt!572930 () Unit!42061)

(declare-fun lt!572928 () Unit!42061)

(assert (=> d!139011 (= lt!572930 lt!572928)))

(assert (=> d!139011 (= (getValueByKey!660 lt!572929 (_1!10536 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!710 (_2!10536 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!336 (List!28273 (_ BitVec 64) V!48543) Unit!42061)

(assert (=> d!139011 (= lt!572928 (lemmaContainsTupThenGetReturnValue!336 lt!572929 (_1!10536 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10536 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!450 (List!28273 (_ BitVec 64) V!48543) List!28273)

(assert (=> d!139011 (= lt!572929 (insertStrictlySorted!450 (toList!9481 lt!572876) (_1!10536 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10536 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!139011 (= (+!4293 lt!572876 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!572931)))

(declare-fun b!1264016 () Bool)

(declare-fun res!841723 () Bool)

(assert (=> b!1264016 (=> (not res!841723) (not e!719660))))

(assert (=> b!1264016 (= res!841723 (= (getValueByKey!660 (toList!9481 lt!572931) (_1!10536 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!710 (_2!10536 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1264017 () Bool)

(declare-fun contains!7623 (List!28273 tuple2!21050) Bool)

(assert (=> b!1264017 (= e!719660 (contains!7623 (toList!9481 lt!572931) (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!139011 res!841722) b!1264016))

(assert (= (and b!1264016 res!841723) b!1264017))

(declare-fun m!1164833 () Bool)

(assert (=> d!139011 m!1164833))

(declare-fun m!1164835 () Bool)

(assert (=> d!139011 m!1164835))

(declare-fun m!1164837 () Bool)

(assert (=> d!139011 m!1164837))

(declare-fun m!1164839 () Bool)

(assert (=> d!139011 m!1164839))

(declare-fun m!1164841 () Bool)

(assert (=> b!1264016 m!1164841))

(declare-fun m!1164843 () Bool)

(assert (=> b!1264017 m!1164843))

(assert (=> b!1263940 d!139011))

(declare-fun b!1264060 () Bool)

(declare-fun e!719696 () ListLongMap!18931)

(declare-fun call!62194 () ListLongMap!18931)

(assert (=> b!1264060 (= e!719696 (+!4293 call!62194 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun bm!62188 () Bool)

(declare-fun call!62192 () Bool)

(declare-fun lt!572994 () ListLongMap!18931)

(assert (=> bm!62188 (= call!62192 (contains!7621 lt!572994 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264061 () Bool)

(declare-fun e!719698 () ListLongMap!18931)

(declare-fun call!62195 () ListLongMap!18931)

(assert (=> b!1264061 (= e!719698 call!62195)))

(declare-fun b!1264062 () Bool)

(declare-fun e!719694 () Unit!42061)

(declare-fun Unit!42066 () Unit!42061)

(assert (=> b!1264062 (= e!719694 Unit!42066)))

(declare-fun b!1264063 () Bool)

(declare-fun e!719691 () Bool)

(declare-fun apply!1008 (ListLongMap!18931 (_ BitVec 64)) V!48543)

(declare-fun get!20329 (ValueCell!15428 V!48543) V!48543)

(declare-fun dynLambda!3460 (Int (_ BitVec 64)) V!48543)

(assert (=> b!1264063 (= e!719691 (= (apply!1008 lt!572994 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)) (get!20329 (select (arr!39760 _values!914) #b00000000000000000000000000000000) (dynLambda!3460 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1264063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40297 _values!914)))))

(assert (=> b!1264063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1264064 () Bool)

(declare-fun e!719689 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1264064 (= e!719689 (validKeyInArray!0 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264065 () Bool)

(declare-fun e!719692 () Bool)

(assert (=> b!1264065 (= e!719692 (not call!62192))))

(declare-fun b!1264066 () Bool)

(declare-fun e!719699 () Bool)

(assert (=> b!1264066 (= e!719699 e!719692)))

(declare-fun c!123275 () Bool)

(assert (=> b!1264066 (= c!123275 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264067 () Bool)

(declare-fun e!719690 () Bool)

(assert (=> b!1264067 (= e!719690 e!719691)))

(declare-fun res!841746 () Bool)

(assert (=> b!1264067 (=> (not res!841746) (not e!719691))))

(assert (=> b!1264067 (= res!841746 (contains!7621 lt!572994 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun bm!62189 () Bool)

(declare-fun call!62197 () Bool)

(assert (=> bm!62189 (= call!62197 (contains!7621 lt!572994 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62190 () Bool)

(declare-fun call!62193 () ListLongMap!18931)

(declare-fun call!62196 () ListLongMap!18931)

(assert (=> bm!62190 (= call!62193 call!62196)))

(declare-fun d!139013 () Bool)

(assert (=> d!139013 e!719699))

(declare-fun res!841748 () Bool)

(assert (=> d!139013 (=> (not res!841748) (not e!719699))))

(assert (=> d!139013 (= res!841748 (or (bvsge #b00000000000000000000000000000000 (size!40296 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))))

(declare-fun lt!572988 () ListLongMap!18931)

(assert (=> d!139013 (= lt!572994 lt!572988)))

(declare-fun lt!572984 () Unit!42061)

(assert (=> d!139013 (= lt!572984 e!719694)))

(declare-fun c!123272 () Bool)

(assert (=> d!139013 (= c!123272 e!719689)))

(declare-fun res!841747 () Bool)

(assert (=> d!139013 (=> (not res!841747) (not e!719689))))

(assert (=> d!139013 (= res!841747 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> d!139013 (= lt!572988 e!719696)))

(declare-fun c!123274 () Bool)

(assert (=> d!139013 (= c!123274 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!139013 (validMask!0 mask!1466)))

(assert (=> d!139013 (= (getCurrentListMap!4634 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572994)))

(declare-fun b!1264068 () Bool)

(declare-fun res!841745 () Bool)

(assert (=> b!1264068 (=> (not res!841745) (not e!719699))))

(declare-fun e!719697 () Bool)

(assert (=> b!1264068 (= res!841745 e!719697)))

(declare-fun c!123273 () Bool)

(assert (=> b!1264068 (= c!123273 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1264069 () Bool)

(declare-fun lt!572990 () Unit!42061)

(assert (=> b!1264069 (= e!719694 lt!572990)))

(declare-fun lt!572979 () ListLongMap!18931)

(assert (=> b!1264069 (= lt!572979 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572981 () (_ BitVec 64))

(assert (=> b!1264069 (= lt!572981 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572985 () (_ BitVec 64))

(assert (=> b!1264069 (= lt!572985 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572995 () Unit!42061)

(declare-fun addStillContains!1097 (ListLongMap!18931 (_ BitVec 64) V!48543 (_ BitVec 64)) Unit!42061)

(assert (=> b!1264069 (= lt!572995 (addStillContains!1097 lt!572979 lt!572981 zeroValue!871 lt!572985))))

(assert (=> b!1264069 (contains!7621 (+!4293 lt!572979 (tuple2!21051 lt!572981 zeroValue!871)) lt!572985)))

(declare-fun lt!572993 () Unit!42061)

(assert (=> b!1264069 (= lt!572993 lt!572995)))

(declare-fun lt!572991 () ListLongMap!18931)

(assert (=> b!1264069 (= lt!572991 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572976 () (_ BitVec 64))

(assert (=> b!1264069 (= lt!572976 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572980 () (_ BitVec 64))

(assert (=> b!1264069 (= lt!572980 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572986 () Unit!42061)

(declare-fun addApplyDifferent!539 (ListLongMap!18931 (_ BitVec 64) V!48543 (_ BitVec 64)) Unit!42061)

(assert (=> b!1264069 (= lt!572986 (addApplyDifferent!539 lt!572991 lt!572976 minValueAfter!43 lt!572980))))

(assert (=> b!1264069 (= (apply!1008 (+!4293 lt!572991 (tuple2!21051 lt!572976 minValueAfter!43)) lt!572980) (apply!1008 lt!572991 lt!572980))))

(declare-fun lt!572992 () Unit!42061)

(assert (=> b!1264069 (= lt!572992 lt!572986)))

(declare-fun lt!572978 () ListLongMap!18931)

(assert (=> b!1264069 (= lt!572978 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572987 () (_ BitVec 64))

(assert (=> b!1264069 (= lt!572987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572983 () (_ BitVec 64))

(assert (=> b!1264069 (= lt!572983 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572982 () Unit!42061)

(assert (=> b!1264069 (= lt!572982 (addApplyDifferent!539 lt!572978 lt!572987 zeroValue!871 lt!572983))))

(assert (=> b!1264069 (= (apply!1008 (+!4293 lt!572978 (tuple2!21051 lt!572987 zeroValue!871)) lt!572983) (apply!1008 lt!572978 lt!572983))))

(declare-fun lt!572997 () Unit!42061)

(assert (=> b!1264069 (= lt!572997 lt!572982)))

(declare-fun lt!572989 () ListLongMap!18931)

(assert (=> b!1264069 (= lt!572989 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572996 () (_ BitVec 64))

(assert (=> b!1264069 (= lt!572996 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572977 () (_ BitVec 64))

(assert (=> b!1264069 (= lt!572977 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264069 (= lt!572990 (addApplyDifferent!539 lt!572989 lt!572996 minValueAfter!43 lt!572977))))

(assert (=> b!1264069 (= (apply!1008 (+!4293 lt!572989 (tuple2!21051 lt!572996 minValueAfter!43)) lt!572977) (apply!1008 lt!572989 lt!572977))))

(declare-fun bm!62191 () Bool)

(declare-fun call!62191 () ListLongMap!18931)

(assert (=> bm!62191 (= call!62191 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264070 () Bool)

(assert (=> b!1264070 (= e!719698 call!62193)))

(declare-fun bm!62192 () Bool)

(assert (=> bm!62192 (= call!62196 call!62191)))

(declare-fun b!1264071 () Bool)

(declare-fun res!841742 () Bool)

(assert (=> b!1264071 (=> (not res!841742) (not e!719699))))

(assert (=> b!1264071 (= res!841742 e!719690)))

(declare-fun res!841749 () Bool)

(assert (=> b!1264071 (=> res!841749 e!719690)))

(declare-fun e!719687 () Bool)

(assert (=> b!1264071 (= res!841749 (not e!719687))))

(declare-fun res!841744 () Bool)

(assert (=> b!1264071 (=> (not res!841744) (not e!719687))))

(assert (=> b!1264071 (= res!841744 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1264072 () Bool)

(declare-fun c!123270 () Bool)

(assert (=> b!1264072 (= c!123270 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!719693 () ListLongMap!18931)

(assert (=> b!1264072 (= e!719693 e!719698)))

(declare-fun b!1264073 () Bool)

(assert (=> b!1264073 (= e!719696 e!719693)))

(declare-fun c!123271 () Bool)

(assert (=> b!1264073 (= c!123271 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264074 () Bool)

(assert (=> b!1264074 (= e!719693 call!62195)))

(declare-fun bm!62193 () Bool)

(assert (=> bm!62193 (= call!62195 call!62194)))

(declare-fun b!1264075 () Bool)

(assert (=> b!1264075 (= e!719697 (not call!62197))))

(declare-fun b!1264076 () Bool)

(assert (=> b!1264076 (= e!719687 (validKeyInArray!0 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62194 () Bool)

(assert (=> bm!62194 (= call!62194 (+!4293 (ite c!123274 call!62191 (ite c!123271 call!62196 call!62193)) (ite (or c!123274 c!123271) (tuple2!21051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1264077 () Bool)

(declare-fun e!719695 () Bool)

(assert (=> b!1264077 (= e!719695 (= (apply!1008 lt!572994 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1264078 () Bool)

(assert (=> b!1264078 (= e!719697 e!719695)))

(declare-fun res!841750 () Bool)

(assert (=> b!1264078 (= res!841750 call!62197)))

(assert (=> b!1264078 (=> (not res!841750) (not e!719695))))

(declare-fun b!1264079 () Bool)

(declare-fun e!719688 () Bool)

(assert (=> b!1264079 (= e!719692 e!719688)))

(declare-fun res!841743 () Bool)

(assert (=> b!1264079 (= res!841743 call!62192)))

(assert (=> b!1264079 (=> (not res!841743) (not e!719688))))

(declare-fun b!1264080 () Bool)

(assert (=> b!1264080 (= e!719688 (= (apply!1008 lt!572994 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(assert (= (and d!139013 c!123274) b!1264060))

(assert (= (and d!139013 (not c!123274)) b!1264073))

(assert (= (and b!1264073 c!123271) b!1264074))

(assert (= (and b!1264073 (not c!123271)) b!1264072))

(assert (= (and b!1264072 c!123270) b!1264061))

(assert (= (and b!1264072 (not c!123270)) b!1264070))

(assert (= (or b!1264061 b!1264070) bm!62190))

(assert (= (or b!1264074 bm!62190) bm!62192))

(assert (= (or b!1264074 b!1264061) bm!62193))

(assert (= (or b!1264060 bm!62192) bm!62191))

(assert (= (or b!1264060 bm!62193) bm!62194))

(assert (= (and d!139013 res!841747) b!1264064))

(assert (= (and d!139013 c!123272) b!1264069))

(assert (= (and d!139013 (not c!123272)) b!1264062))

(assert (= (and d!139013 res!841748) b!1264071))

(assert (= (and b!1264071 res!841744) b!1264076))

(assert (= (and b!1264071 (not res!841749)) b!1264067))

(assert (= (and b!1264067 res!841746) b!1264063))

(assert (= (and b!1264071 res!841742) b!1264068))

(assert (= (and b!1264068 c!123273) b!1264078))

(assert (= (and b!1264068 (not c!123273)) b!1264075))

(assert (= (and b!1264078 res!841750) b!1264077))

(assert (= (or b!1264078 b!1264075) bm!62189))

(assert (= (and b!1264068 res!841745) b!1264066))

(assert (= (and b!1264066 c!123275) b!1264079))

(assert (= (and b!1264066 (not c!123275)) b!1264065))

(assert (= (and b!1264079 res!841743) b!1264080))

(assert (= (or b!1264079 b!1264065) bm!62188))

(declare-fun b_lambda!22893 () Bool)

(assert (=> (not b_lambda!22893) (not b!1264063)))

(declare-fun t!41780 () Bool)

(declare-fun tb!11317 () Bool)

(assert (=> (and start!106252 (= defaultEntry!922 defaultEntry!922) t!41780) tb!11317))

(declare-fun result!23375 () Bool)

(assert (=> tb!11317 (= result!23375 tp_is_empty!32383)))

(assert (=> b!1264063 t!41780))

(declare-fun b_and!45451 () Bool)

(assert (= b_and!45445 (and (=> t!41780 result!23375) b_and!45451)))

(declare-fun m!1164845 () Bool)

(assert (=> b!1264076 m!1164845))

(assert (=> b!1264076 m!1164845))

(declare-fun m!1164847 () Bool)

(assert (=> b!1264076 m!1164847))

(assert (=> d!139013 m!1164767))

(assert (=> b!1264067 m!1164845))

(assert (=> b!1264067 m!1164845))

(declare-fun m!1164849 () Bool)

(assert (=> b!1264067 m!1164849))

(declare-fun m!1164851 () Bool)

(assert (=> b!1264069 m!1164851))

(declare-fun m!1164853 () Bool)

(assert (=> b!1264069 m!1164853))

(declare-fun m!1164855 () Bool)

(assert (=> b!1264069 m!1164855))

(declare-fun m!1164857 () Bool)

(assert (=> b!1264069 m!1164857))

(declare-fun m!1164859 () Bool)

(assert (=> b!1264069 m!1164859))

(declare-fun m!1164861 () Bool)

(assert (=> b!1264069 m!1164861))

(declare-fun m!1164863 () Bool)

(assert (=> b!1264069 m!1164863))

(assert (=> b!1264069 m!1164851))

(declare-fun m!1164865 () Bool)

(assert (=> b!1264069 m!1164865))

(declare-fun m!1164867 () Bool)

(assert (=> b!1264069 m!1164867))

(assert (=> b!1264069 m!1164853))

(declare-fun m!1164869 () Bool)

(assert (=> b!1264069 m!1164869))

(declare-fun m!1164871 () Bool)

(assert (=> b!1264069 m!1164871))

(declare-fun m!1164873 () Bool)

(assert (=> b!1264069 m!1164873))

(assert (=> b!1264069 m!1164845))

(declare-fun m!1164875 () Bool)

(assert (=> b!1264069 m!1164875))

(assert (=> b!1264069 m!1164861))

(declare-fun m!1164877 () Bool)

(assert (=> b!1264069 m!1164877))

(assert (=> b!1264069 m!1164873))

(declare-fun m!1164879 () Bool)

(assert (=> b!1264069 m!1164879))

(assert (=> b!1264069 m!1164753))

(declare-fun m!1164881 () Bool)

(assert (=> b!1264060 m!1164881))

(declare-fun m!1164883 () Bool)

(assert (=> b!1264077 m!1164883))

(declare-fun m!1164885 () Bool)

(assert (=> bm!62188 m!1164885))

(declare-fun m!1164887 () Bool)

(assert (=> b!1264080 m!1164887))

(declare-fun m!1164889 () Bool)

(assert (=> bm!62194 m!1164889))

(assert (=> bm!62191 m!1164753))

(assert (=> b!1264064 m!1164845))

(assert (=> b!1264064 m!1164845))

(assert (=> b!1264064 m!1164847))

(assert (=> b!1264063 m!1164845))

(declare-fun m!1164891 () Bool)

(assert (=> b!1264063 m!1164891))

(declare-fun m!1164893 () Bool)

(assert (=> b!1264063 m!1164893))

(declare-fun m!1164895 () Bool)

(assert (=> b!1264063 m!1164895))

(assert (=> b!1264063 m!1164845))

(declare-fun m!1164897 () Bool)

(assert (=> b!1264063 m!1164897))

(assert (=> b!1264063 m!1164893))

(assert (=> b!1264063 m!1164891))

(declare-fun m!1164899 () Bool)

(assert (=> bm!62189 m!1164899))

(assert (=> b!1263940 d!139013))

(declare-fun b!1264083 () Bool)

(declare-fun e!719709 () ListLongMap!18931)

(declare-fun call!62201 () ListLongMap!18931)

(assert (=> b!1264083 (= e!719709 (+!4293 call!62201 (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun bm!62195 () Bool)

(declare-fun call!62199 () Bool)

(declare-fun lt!573016 () ListLongMap!18931)

(assert (=> bm!62195 (= call!62199 (contains!7621 lt!573016 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1264084 () Bool)

(declare-fun e!719711 () ListLongMap!18931)

(declare-fun call!62202 () ListLongMap!18931)

(assert (=> b!1264084 (= e!719711 call!62202)))

(declare-fun b!1264085 () Bool)

(declare-fun e!719707 () Unit!42061)

(declare-fun Unit!42067 () Unit!42061)

(assert (=> b!1264085 (= e!719707 Unit!42067)))

(declare-fun b!1264086 () Bool)

(declare-fun e!719704 () Bool)

(assert (=> b!1264086 (= e!719704 (= (apply!1008 lt!573016 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)) (get!20329 (select (arr!39760 _values!914) #b00000000000000000000000000000000) (dynLambda!3460 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1264086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40297 _values!914)))))

(assert (=> b!1264086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1264087 () Bool)

(declare-fun e!719702 () Bool)

(assert (=> b!1264087 (= e!719702 (validKeyInArray!0 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264088 () Bool)

(declare-fun e!719705 () Bool)

(assert (=> b!1264088 (= e!719705 (not call!62199))))

(declare-fun b!1264089 () Bool)

(declare-fun e!719712 () Bool)

(assert (=> b!1264089 (= e!719712 e!719705)))

(declare-fun c!123281 () Bool)

(assert (=> b!1264089 (= c!123281 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264090 () Bool)

(declare-fun e!719703 () Bool)

(assert (=> b!1264090 (= e!719703 e!719704)))

(declare-fun res!841755 () Bool)

(assert (=> b!1264090 (=> (not res!841755) (not e!719704))))

(assert (=> b!1264090 (= res!841755 (contains!7621 lt!573016 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264090 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun bm!62196 () Bool)

(declare-fun call!62204 () Bool)

(assert (=> bm!62196 (= call!62204 (contains!7621 lt!573016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62197 () Bool)

(declare-fun call!62200 () ListLongMap!18931)

(declare-fun call!62203 () ListLongMap!18931)

(assert (=> bm!62197 (= call!62200 call!62203)))

(declare-fun d!139015 () Bool)

(assert (=> d!139015 e!719712))

(declare-fun res!841757 () Bool)

(assert (=> d!139015 (=> (not res!841757) (not e!719712))))

(assert (=> d!139015 (= res!841757 (or (bvsge #b00000000000000000000000000000000 (size!40296 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))))

(declare-fun lt!573010 () ListLongMap!18931)

(assert (=> d!139015 (= lt!573016 lt!573010)))

(declare-fun lt!573006 () Unit!42061)

(assert (=> d!139015 (= lt!573006 e!719707)))

(declare-fun c!123278 () Bool)

(assert (=> d!139015 (= c!123278 e!719702)))

(declare-fun res!841756 () Bool)

(assert (=> d!139015 (=> (not res!841756) (not e!719702))))

(assert (=> d!139015 (= res!841756 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> d!139015 (= lt!573010 e!719709)))

(declare-fun c!123280 () Bool)

(assert (=> d!139015 (= c!123280 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!139015 (validMask!0 mask!1466)))

(assert (=> d!139015 (= (getCurrentListMap!4634 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573016)))

(declare-fun b!1264091 () Bool)

(declare-fun res!841754 () Bool)

(assert (=> b!1264091 (=> (not res!841754) (not e!719712))))

(declare-fun e!719710 () Bool)

(assert (=> b!1264091 (= res!841754 e!719710)))

(declare-fun c!123279 () Bool)

(assert (=> b!1264091 (= c!123279 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1264092 () Bool)

(declare-fun lt!573012 () Unit!42061)

(assert (=> b!1264092 (= e!719707 lt!573012)))

(declare-fun lt!573001 () ListLongMap!18931)

(assert (=> b!1264092 (= lt!573001 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573003 () (_ BitVec 64))

(assert (=> b!1264092 (= lt!573003 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573007 () (_ BitVec 64))

(assert (=> b!1264092 (= lt!573007 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573017 () Unit!42061)

(assert (=> b!1264092 (= lt!573017 (addStillContains!1097 lt!573001 lt!573003 zeroValue!871 lt!573007))))

(assert (=> b!1264092 (contains!7621 (+!4293 lt!573001 (tuple2!21051 lt!573003 zeroValue!871)) lt!573007)))

(declare-fun lt!573015 () Unit!42061)

(assert (=> b!1264092 (= lt!573015 lt!573017)))

(declare-fun lt!573013 () ListLongMap!18931)

(assert (=> b!1264092 (= lt!573013 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572998 () (_ BitVec 64))

(assert (=> b!1264092 (= lt!572998 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573002 () (_ BitVec 64))

(assert (=> b!1264092 (= lt!573002 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573008 () Unit!42061)

(assert (=> b!1264092 (= lt!573008 (addApplyDifferent!539 lt!573013 lt!572998 minValueBefore!43 lt!573002))))

(assert (=> b!1264092 (= (apply!1008 (+!4293 lt!573013 (tuple2!21051 lt!572998 minValueBefore!43)) lt!573002) (apply!1008 lt!573013 lt!573002))))

(declare-fun lt!573014 () Unit!42061)

(assert (=> b!1264092 (= lt!573014 lt!573008)))

(declare-fun lt!573000 () ListLongMap!18931)

(assert (=> b!1264092 (= lt!573000 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573009 () (_ BitVec 64))

(assert (=> b!1264092 (= lt!573009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573005 () (_ BitVec 64))

(assert (=> b!1264092 (= lt!573005 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573004 () Unit!42061)

(assert (=> b!1264092 (= lt!573004 (addApplyDifferent!539 lt!573000 lt!573009 zeroValue!871 lt!573005))))

(assert (=> b!1264092 (= (apply!1008 (+!4293 lt!573000 (tuple2!21051 lt!573009 zeroValue!871)) lt!573005) (apply!1008 lt!573000 lt!573005))))

(declare-fun lt!573019 () Unit!42061)

(assert (=> b!1264092 (= lt!573019 lt!573004)))

(declare-fun lt!573011 () ListLongMap!18931)

(assert (=> b!1264092 (= lt!573011 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573018 () (_ BitVec 64))

(assert (=> b!1264092 (= lt!573018 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572999 () (_ BitVec 64))

(assert (=> b!1264092 (= lt!572999 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264092 (= lt!573012 (addApplyDifferent!539 lt!573011 lt!573018 minValueBefore!43 lt!572999))))

(assert (=> b!1264092 (= (apply!1008 (+!4293 lt!573011 (tuple2!21051 lt!573018 minValueBefore!43)) lt!572999) (apply!1008 lt!573011 lt!572999))))

(declare-fun call!62198 () ListLongMap!18931)

(declare-fun bm!62198 () Bool)

(assert (=> bm!62198 (= call!62198 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264093 () Bool)

(assert (=> b!1264093 (= e!719711 call!62200)))

(declare-fun bm!62199 () Bool)

(assert (=> bm!62199 (= call!62203 call!62198)))

(declare-fun b!1264094 () Bool)

(declare-fun res!841751 () Bool)

(assert (=> b!1264094 (=> (not res!841751) (not e!719712))))

(assert (=> b!1264094 (= res!841751 e!719703)))

(declare-fun res!841758 () Bool)

(assert (=> b!1264094 (=> res!841758 e!719703)))

(declare-fun e!719700 () Bool)

(assert (=> b!1264094 (= res!841758 (not e!719700))))

(declare-fun res!841753 () Bool)

(assert (=> b!1264094 (=> (not res!841753) (not e!719700))))

(assert (=> b!1264094 (= res!841753 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1264095 () Bool)

(declare-fun c!123276 () Bool)

(assert (=> b!1264095 (= c!123276 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!719706 () ListLongMap!18931)

(assert (=> b!1264095 (= e!719706 e!719711)))

(declare-fun b!1264096 () Bool)

(assert (=> b!1264096 (= e!719709 e!719706)))

(declare-fun c!123277 () Bool)

(assert (=> b!1264096 (= c!123277 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264097 () Bool)

(assert (=> b!1264097 (= e!719706 call!62202)))

(declare-fun bm!62200 () Bool)

(assert (=> bm!62200 (= call!62202 call!62201)))

(declare-fun b!1264098 () Bool)

(assert (=> b!1264098 (= e!719710 (not call!62204))))

(declare-fun b!1264099 () Bool)

(assert (=> b!1264099 (= e!719700 (validKeyInArray!0 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62201 () Bool)

(assert (=> bm!62201 (= call!62201 (+!4293 (ite c!123280 call!62198 (ite c!123277 call!62203 call!62200)) (ite (or c!123280 c!123277) (tuple2!21051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21051 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1264100 () Bool)

(declare-fun e!719708 () Bool)

(assert (=> b!1264100 (= e!719708 (= (apply!1008 lt!573016 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1264101 () Bool)

(assert (=> b!1264101 (= e!719710 e!719708)))

(declare-fun res!841759 () Bool)

(assert (=> b!1264101 (= res!841759 call!62204)))

(assert (=> b!1264101 (=> (not res!841759) (not e!719708))))

(declare-fun b!1264102 () Bool)

(declare-fun e!719701 () Bool)

(assert (=> b!1264102 (= e!719705 e!719701)))

(declare-fun res!841752 () Bool)

(assert (=> b!1264102 (= res!841752 call!62199)))

(assert (=> b!1264102 (=> (not res!841752) (not e!719701))))

(declare-fun b!1264103 () Bool)

(assert (=> b!1264103 (= e!719701 (= (apply!1008 lt!573016 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(assert (= (and d!139015 c!123280) b!1264083))

(assert (= (and d!139015 (not c!123280)) b!1264096))

(assert (= (and b!1264096 c!123277) b!1264097))

(assert (= (and b!1264096 (not c!123277)) b!1264095))

(assert (= (and b!1264095 c!123276) b!1264084))

(assert (= (and b!1264095 (not c!123276)) b!1264093))

(assert (= (or b!1264084 b!1264093) bm!62197))

(assert (= (or b!1264097 bm!62197) bm!62199))

(assert (= (or b!1264097 b!1264084) bm!62200))

(assert (= (or b!1264083 bm!62199) bm!62198))

(assert (= (or b!1264083 bm!62200) bm!62201))

(assert (= (and d!139015 res!841756) b!1264087))

(assert (= (and d!139015 c!123278) b!1264092))

(assert (= (and d!139015 (not c!123278)) b!1264085))

(assert (= (and d!139015 res!841757) b!1264094))

(assert (= (and b!1264094 res!841753) b!1264099))

(assert (= (and b!1264094 (not res!841758)) b!1264090))

(assert (= (and b!1264090 res!841755) b!1264086))

(assert (= (and b!1264094 res!841751) b!1264091))

(assert (= (and b!1264091 c!123279) b!1264101))

(assert (= (and b!1264091 (not c!123279)) b!1264098))

(assert (= (and b!1264101 res!841759) b!1264100))

(assert (= (or b!1264101 b!1264098) bm!62196))

(assert (= (and b!1264091 res!841754) b!1264089))

(assert (= (and b!1264089 c!123281) b!1264102))

(assert (= (and b!1264089 (not c!123281)) b!1264088))

(assert (= (and b!1264102 res!841752) b!1264103))

(assert (= (or b!1264102 b!1264088) bm!62195))

(declare-fun b_lambda!22895 () Bool)

(assert (=> (not b_lambda!22895) (not b!1264086)))

(assert (=> b!1264086 t!41780))

(declare-fun b_and!45453 () Bool)

(assert (= b_and!45451 (and (=> t!41780 result!23375) b_and!45453)))

(assert (=> b!1264099 m!1164845))

(assert (=> b!1264099 m!1164845))

(assert (=> b!1264099 m!1164847))

(assert (=> d!139015 m!1164767))

(assert (=> b!1264090 m!1164845))

(assert (=> b!1264090 m!1164845))

(declare-fun m!1164901 () Bool)

(assert (=> b!1264090 m!1164901))

(declare-fun m!1164903 () Bool)

(assert (=> b!1264092 m!1164903))

(declare-fun m!1164905 () Bool)

(assert (=> b!1264092 m!1164905))

(declare-fun m!1164907 () Bool)

(assert (=> b!1264092 m!1164907))

(declare-fun m!1164909 () Bool)

(assert (=> b!1264092 m!1164909))

(declare-fun m!1164911 () Bool)

(assert (=> b!1264092 m!1164911))

(declare-fun m!1164913 () Bool)

(assert (=> b!1264092 m!1164913))

(declare-fun m!1164915 () Bool)

(assert (=> b!1264092 m!1164915))

(assert (=> b!1264092 m!1164903))

(declare-fun m!1164917 () Bool)

(assert (=> b!1264092 m!1164917))

(declare-fun m!1164919 () Bool)

(assert (=> b!1264092 m!1164919))

(assert (=> b!1264092 m!1164905))

(declare-fun m!1164921 () Bool)

(assert (=> b!1264092 m!1164921))

(declare-fun m!1164923 () Bool)

(assert (=> b!1264092 m!1164923))

(declare-fun m!1164925 () Bool)

(assert (=> b!1264092 m!1164925))

(assert (=> b!1264092 m!1164845))

(declare-fun m!1164927 () Bool)

(assert (=> b!1264092 m!1164927))

(assert (=> b!1264092 m!1164913))

(declare-fun m!1164929 () Bool)

(assert (=> b!1264092 m!1164929))

(assert (=> b!1264092 m!1164925))

(declare-fun m!1164931 () Bool)

(assert (=> b!1264092 m!1164931))

(assert (=> b!1264092 m!1164755))

(declare-fun m!1164933 () Bool)

(assert (=> b!1264083 m!1164933))

(declare-fun m!1164935 () Bool)

(assert (=> b!1264100 m!1164935))

(declare-fun m!1164937 () Bool)

(assert (=> bm!62195 m!1164937))

(declare-fun m!1164939 () Bool)

(assert (=> b!1264103 m!1164939))

(declare-fun m!1164941 () Bool)

(assert (=> bm!62201 m!1164941))

(assert (=> bm!62198 m!1164755))

(assert (=> b!1264087 m!1164845))

(assert (=> b!1264087 m!1164845))

(assert (=> b!1264087 m!1164847))

(assert (=> b!1264086 m!1164845))

(assert (=> b!1264086 m!1164891))

(assert (=> b!1264086 m!1164893))

(assert (=> b!1264086 m!1164895))

(assert (=> b!1264086 m!1164845))

(declare-fun m!1164943 () Bool)

(assert (=> b!1264086 m!1164943))

(assert (=> b!1264086 m!1164893))

(assert (=> b!1264086 m!1164891))

(declare-fun m!1164945 () Bool)

(assert (=> bm!62196 m!1164945))

(assert (=> b!1263940 d!139015))

(declare-fun bm!62204 () Bool)

(declare-fun call!62207 () Bool)

(assert (=> bm!62204 (= call!62207 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!139017 () Bool)

(declare-fun res!841765 () Bool)

(declare-fun e!719719 () Bool)

(assert (=> d!139017 (=> res!841765 e!719719)))

(assert (=> d!139017 (= res!841765 (bvsge #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> d!139017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719719)))

(declare-fun b!1264112 () Bool)

(declare-fun e!719721 () Bool)

(assert (=> b!1264112 (= e!719719 e!719721)))

(declare-fun c!123284 () Bool)

(assert (=> b!1264112 (= c!123284 (validKeyInArray!0 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264113 () Bool)

(declare-fun e!719720 () Bool)

(assert (=> b!1264113 (= e!719720 call!62207)))

(declare-fun b!1264114 () Bool)

(assert (=> b!1264114 (= e!719721 e!719720)))

(declare-fun lt!573026 () (_ BitVec 64))

(assert (=> b!1264114 (= lt!573026 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573027 () Unit!42061)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82431 (_ BitVec 64) (_ BitVec 32)) Unit!42061)

(assert (=> b!1264114 (= lt!573027 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!573026 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1264114 (arrayContainsKey!0 _keys!1118 lt!573026 #b00000000000000000000000000000000)))

(declare-fun lt!573028 () Unit!42061)

(assert (=> b!1264114 (= lt!573028 lt!573027)))

(declare-fun res!841764 () Bool)

(declare-datatypes ((SeekEntryResult!9933 0))(
  ( (MissingZero!9933 (index!42103 (_ BitVec 32))) (Found!9933 (index!42104 (_ BitVec 32))) (Intermediate!9933 (undefined!10745 Bool) (index!42105 (_ BitVec 32)) (x!111247 (_ BitVec 32))) (Undefined!9933) (MissingVacant!9933 (index!42106 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82431 (_ BitVec 32)) SeekEntryResult!9933)

(assert (=> b!1264114 (= res!841764 (= (seekEntryOrOpen!0 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9933 #b00000000000000000000000000000000)))))

(assert (=> b!1264114 (=> (not res!841764) (not e!719720))))

(declare-fun b!1264115 () Bool)

(assert (=> b!1264115 (= e!719721 call!62207)))

(assert (= (and d!139017 (not res!841765)) b!1264112))

(assert (= (and b!1264112 c!123284) b!1264114))

(assert (= (and b!1264112 (not c!123284)) b!1264115))

(assert (= (and b!1264114 res!841764) b!1264113))

(assert (= (or b!1264113 b!1264115) bm!62204))

(declare-fun m!1164947 () Bool)

(assert (=> bm!62204 m!1164947))

(assert (=> b!1264112 m!1164845))

(assert (=> b!1264112 m!1164845))

(assert (=> b!1264112 m!1164847))

(assert (=> b!1264114 m!1164845))

(declare-fun m!1164949 () Bool)

(assert (=> b!1264114 m!1164949))

(declare-fun m!1164951 () Bool)

(assert (=> b!1264114 m!1164951))

(assert (=> b!1264114 m!1164845))

(declare-fun m!1164953 () Bool)

(assert (=> b!1264114 m!1164953))

(assert (=> b!1263948 d!139017))

(declare-fun d!139019 () Bool)

(assert (=> d!139019 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106252 d!139019))

(declare-fun d!139021 () Bool)

(assert (=> d!139021 (= (array_inv!30421 _keys!1118) (bvsge (size!40296 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106252 d!139021))

(declare-fun d!139023 () Bool)

(assert (=> d!139023 (= (array_inv!30422 _values!914) (bvsge (size!40297 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106252 d!139023))

(declare-fun d!139025 () Bool)

(assert (=> d!139025 (= (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573031 () Unit!42061)

(declare-fun choose!1877 (array!82431 array!82433 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48543 V!48543 V!48543 V!48543 (_ BitVec 32) Int) Unit!42061)

(assert (=> d!139025 (= lt!573031 (choose!1877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!139025 (validMask!0 mask!1466)))

(assert (=> d!139025 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1175 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573031)))

(declare-fun bs!35746 () Bool)

(assert (= bs!35746 d!139025))

(assert (=> bs!35746 m!1164755))

(assert (=> bs!35746 m!1164753))

(declare-fun m!1164955 () Bool)

(assert (=> bs!35746 m!1164955))

(assert (=> bs!35746 m!1164767))

(assert (=> b!1263942 d!139025))

(declare-fun d!139027 () Bool)

(declare-fun e!719742 () Bool)

(assert (=> d!139027 e!719742))

(declare-fun res!841775 () Bool)

(assert (=> d!139027 (=> (not res!841775) (not e!719742))))

(declare-fun lt!573046 () ListLongMap!18931)

(assert (=> d!139027 (= res!841775 (not (contains!7621 lt!573046 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719736 () ListLongMap!18931)

(assert (=> d!139027 (= lt!573046 e!719736)))

(declare-fun c!123294 () Bool)

(assert (=> d!139027 (= c!123294 (bvsge #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> d!139027 (validMask!0 mask!1466)))

(assert (=> d!139027 (= (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573046)))

(declare-fun b!1264140 () Bool)

(declare-fun e!719737 () ListLongMap!18931)

(declare-fun call!62210 () ListLongMap!18931)

(assert (=> b!1264140 (= e!719737 call!62210)))

(declare-fun b!1264141 () Bool)

(assert (=> b!1264141 (= e!719736 e!719737)))

(declare-fun c!123296 () Bool)

(assert (=> b!1264141 (= c!123296 (validKeyInArray!0 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264142 () Bool)

(declare-fun e!719738 () Bool)

(declare-fun e!719739 () Bool)

(assert (=> b!1264142 (= e!719738 e!719739)))

(assert (=> b!1264142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun res!841774 () Bool)

(assert (=> b!1264142 (= res!841774 (contains!7621 lt!573046 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264142 (=> (not res!841774) (not e!719739))))

(declare-fun b!1264143 () Bool)

(assert (=> b!1264143 (= e!719736 (ListLongMap!18932 Nil!28270))))

(declare-fun b!1264144 () Bool)

(declare-fun res!841777 () Bool)

(assert (=> b!1264144 (=> (not res!841777) (not e!719742))))

(assert (=> b!1264144 (= res!841777 (not (contains!7621 lt!573046 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1264145 () Bool)

(assert (=> b!1264145 (= e!719742 e!719738)))

(declare-fun c!123295 () Bool)

(declare-fun e!719740 () Bool)

(assert (=> b!1264145 (= c!123295 e!719740)))

(declare-fun res!841776 () Bool)

(assert (=> b!1264145 (=> (not res!841776) (not e!719740))))

(assert (=> b!1264145 (= res!841776 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1264146 () Bool)

(assert (=> b!1264146 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> b!1264146 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40297 _values!914)))))

(assert (=> b!1264146 (= e!719739 (= (apply!1008 lt!573046 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)) (get!20329 (select (arr!39760 _values!914) #b00000000000000000000000000000000) (dynLambda!3460 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!719741 () Bool)

(declare-fun b!1264147 () Bool)

(assert (=> b!1264147 (= e!719741 (= lt!573046 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!62207 () Bool)

(assert (=> bm!62207 (= call!62210 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1264148 () Bool)

(declare-fun isEmpty!1045 (ListLongMap!18931) Bool)

(assert (=> b!1264148 (= e!719741 (isEmpty!1045 lt!573046))))

(declare-fun b!1264149 () Bool)

(assert (=> b!1264149 (= e!719738 e!719741)))

(declare-fun c!123293 () Bool)

(assert (=> b!1264149 (= c!123293 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1264150 () Bool)

(declare-fun lt!573052 () Unit!42061)

(declare-fun lt!573051 () Unit!42061)

(assert (=> b!1264150 (= lt!573052 lt!573051)))

(declare-fun lt!573049 () ListLongMap!18931)

(declare-fun lt!573048 () (_ BitVec 64))

(declare-fun lt!573050 () (_ BitVec 64))

(declare-fun lt!573047 () V!48543)

(assert (=> b!1264150 (not (contains!7621 (+!4293 lt!573049 (tuple2!21051 lt!573048 lt!573047)) lt!573050))))

(declare-fun addStillNotContains!329 (ListLongMap!18931 (_ BitVec 64) V!48543 (_ BitVec 64)) Unit!42061)

(assert (=> b!1264150 (= lt!573051 (addStillNotContains!329 lt!573049 lt!573048 lt!573047 lt!573050))))

(assert (=> b!1264150 (= lt!573050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1264150 (= lt!573047 (get!20329 (select (arr!39760 _values!914) #b00000000000000000000000000000000) (dynLambda!3460 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1264150 (= lt!573048 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264150 (= lt!573049 call!62210)))

(assert (=> b!1264150 (= e!719737 (+!4293 call!62210 (tuple2!21051 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000) (get!20329 (select (arr!39760 _values!914) #b00000000000000000000000000000000) (dynLambda!3460 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1264151 () Bool)

(assert (=> b!1264151 (= e!719740 (validKeyInArray!0 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264151 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!139027 c!123294) b!1264143))

(assert (= (and d!139027 (not c!123294)) b!1264141))

(assert (= (and b!1264141 c!123296) b!1264150))

(assert (= (and b!1264141 (not c!123296)) b!1264140))

(assert (= (or b!1264150 b!1264140) bm!62207))

(assert (= (and d!139027 res!841775) b!1264144))

(assert (= (and b!1264144 res!841777) b!1264145))

(assert (= (and b!1264145 res!841776) b!1264151))

(assert (= (and b!1264145 c!123295) b!1264142))

(assert (= (and b!1264145 (not c!123295)) b!1264149))

(assert (= (and b!1264142 res!841774) b!1264146))

(assert (= (and b!1264149 c!123293) b!1264147))

(assert (= (and b!1264149 (not c!123293)) b!1264148))

(declare-fun b_lambda!22897 () Bool)

(assert (=> (not b_lambda!22897) (not b!1264146)))

(assert (=> b!1264146 t!41780))

(declare-fun b_and!45455 () Bool)

(assert (= b_and!45453 (and (=> t!41780 result!23375) b_and!45455)))

(declare-fun b_lambda!22899 () Bool)

(assert (=> (not b_lambda!22899) (not b!1264150)))

(assert (=> b!1264150 t!41780))

(declare-fun b_and!45457 () Bool)

(assert (= b_and!45455 (and (=> t!41780 result!23375) b_and!45457)))

(assert (=> b!1264151 m!1164845))

(assert (=> b!1264151 m!1164845))

(assert (=> b!1264151 m!1164847))

(declare-fun m!1164957 () Bool)

(assert (=> bm!62207 m!1164957))

(assert (=> b!1264146 m!1164893))

(assert (=> b!1264146 m!1164891))

(assert (=> b!1264146 m!1164891))

(assert (=> b!1264146 m!1164893))

(assert (=> b!1264146 m!1164895))

(assert (=> b!1264146 m!1164845))

(assert (=> b!1264146 m!1164845))

(declare-fun m!1164959 () Bool)

(assert (=> b!1264146 m!1164959))

(declare-fun m!1164961 () Bool)

(assert (=> b!1264150 m!1164961))

(declare-fun m!1164963 () Bool)

(assert (=> b!1264150 m!1164963))

(declare-fun m!1164965 () Bool)

(assert (=> b!1264150 m!1164965))

(assert (=> b!1264150 m!1164893))

(assert (=> b!1264150 m!1164963))

(declare-fun m!1164967 () Bool)

(assert (=> b!1264150 m!1164967))

(assert (=> b!1264150 m!1164891))

(assert (=> b!1264150 m!1164891))

(assert (=> b!1264150 m!1164893))

(assert (=> b!1264150 m!1164895))

(assert (=> b!1264150 m!1164845))

(assert (=> b!1264142 m!1164845))

(assert (=> b!1264142 m!1164845))

(declare-fun m!1164969 () Bool)

(assert (=> b!1264142 m!1164969))

(declare-fun m!1164971 () Bool)

(assert (=> b!1264144 m!1164971))

(declare-fun m!1164973 () Bool)

(assert (=> d!139027 m!1164973))

(assert (=> d!139027 m!1164767))

(declare-fun m!1164975 () Bool)

(assert (=> b!1264148 m!1164975))

(assert (=> b!1264141 m!1164845))

(assert (=> b!1264141 m!1164845))

(assert (=> b!1264141 m!1164847))

(assert (=> b!1264147 m!1164957))

(assert (=> b!1263942 d!139027))

(declare-fun d!139029 () Bool)

(declare-fun e!719749 () Bool)

(assert (=> d!139029 e!719749))

(declare-fun res!841779 () Bool)

(assert (=> d!139029 (=> (not res!841779) (not e!719749))))

(declare-fun lt!573053 () ListLongMap!18931)

(assert (=> d!139029 (= res!841779 (not (contains!7621 lt!573053 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719743 () ListLongMap!18931)

(assert (=> d!139029 (= lt!573053 e!719743)))

(declare-fun c!123298 () Bool)

(assert (=> d!139029 (= c!123298 (bvsge #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> d!139029 (validMask!0 mask!1466)))

(assert (=> d!139029 (= (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573053)))

(declare-fun b!1264152 () Bool)

(declare-fun e!719744 () ListLongMap!18931)

(declare-fun call!62211 () ListLongMap!18931)

(assert (=> b!1264152 (= e!719744 call!62211)))

(declare-fun b!1264153 () Bool)

(assert (=> b!1264153 (= e!719743 e!719744)))

(declare-fun c!123300 () Bool)

(assert (=> b!1264153 (= c!123300 (validKeyInArray!0 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264154 () Bool)

(declare-fun e!719745 () Bool)

(declare-fun e!719746 () Bool)

(assert (=> b!1264154 (= e!719745 e!719746)))

(assert (=> b!1264154 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun res!841778 () Bool)

(assert (=> b!1264154 (= res!841778 (contains!7621 lt!573053 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264154 (=> (not res!841778) (not e!719746))))

(declare-fun b!1264155 () Bool)

(assert (=> b!1264155 (= e!719743 (ListLongMap!18932 Nil!28270))))

(declare-fun b!1264156 () Bool)

(declare-fun res!841781 () Bool)

(assert (=> b!1264156 (=> (not res!841781) (not e!719749))))

(assert (=> b!1264156 (= res!841781 (not (contains!7621 lt!573053 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1264157 () Bool)

(assert (=> b!1264157 (= e!719749 e!719745)))

(declare-fun c!123299 () Bool)

(declare-fun e!719747 () Bool)

(assert (=> b!1264157 (= c!123299 e!719747)))

(declare-fun res!841780 () Bool)

(assert (=> b!1264157 (=> (not res!841780) (not e!719747))))

(assert (=> b!1264157 (= res!841780 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1264158 () Bool)

(assert (=> b!1264158 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> b!1264158 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40297 _values!914)))))

(assert (=> b!1264158 (= e!719746 (= (apply!1008 lt!573053 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)) (get!20329 (select (arr!39760 _values!914) #b00000000000000000000000000000000) (dynLambda!3460 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!719748 () Bool)

(declare-fun b!1264159 () Bool)

(assert (=> b!1264159 (= e!719748 (= lt!573053 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun bm!62208 () Bool)

(assert (=> bm!62208 (= call!62211 (getCurrentListMapNoExtraKeys!5885 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1264160 () Bool)

(assert (=> b!1264160 (= e!719748 (isEmpty!1045 lt!573053))))

(declare-fun b!1264161 () Bool)

(assert (=> b!1264161 (= e!719745 e!719748)))

(declare-fun c!123297 () Bool)

(assert (=> b!1264161 (= c!123297 (bvslt #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(declare-fun b!1264162 () Bool)

(declare-fun lt!573059 () Unit!42061)

(declare-fun lt!573058 () Unit!42061)

(assert (=> b!1264162 (= lt!573059 lt!573058)))

(declare-fun lt!573056 () ListLongMap!18931)

(declare-fun lt!573057 () (_ BitVec 64))

(declare-fun lt!573055 () (_ BitVec 64))

(declare-fun lt!573054 () V!48543)

(assert (=> b!1264162 (not (contains!7621 (+!4293 lt!573056 (tuple2!21051 lt!573055 lt!573054)) lt!573057))))

(assert (=> b!1264162 (= lt!573058 (addStillNotContains!329 lt!573056 lt!573055 lt!573054 lt!573057))))

(assert (=> b!1264162 (= lt!573057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1264162 (= lt!573054 (get!20329 (select (arr!39760 _values!914) #b00000000000000000000000000000000) (dynLambda!3460 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1264162 (= lt!573055 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1264162 (= lt!573056 call!62211)))

(assert (=> b!1264162 (= e!719744 (+!4293 call!62211 (tuple2!21051 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000) (get!20329 (select (arr!39760 _values!914) #b00000000000000000000000000000000) (dynLambda!3460 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1264163 () Bool)

(assert (=> b!1264163 (= e!719747 (validKeyInArray!0 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264163 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!139029 c!123298) b!1264155))

(assert (= (and d!139029 (not c!123298)) b!1264153))

(assert (= (and b!1264153 c!123300) b!1264162))

(assert (= (and b!1264153 (not c!123300)) b!1264152))

(assert (= (or b!1264162 b!1264152) bm!62208))

(assert (= (and d!139029 res!841779) b!1264156))

(assert (= (and b!1264156 res!841781) b!1264157))

(assert (= (and b!1264157 res!841780) b!1264163))

(assert (= (and b!1264157 c!123299) b!1264154))

(assert (= (and b!1264157 (not c!123299)) b!1264161))

(assert (= (and b!1264154 res!841778) b!1264158))

(assert (= (and b!1264161 c!123297) b!1264159))

(assert (= (and b!1264161 (not c!123297)) b!1264160))

(declare-fun b_lambda!22901 () Bool)

(assert (=> (not b_lambda!22901) (not b!1264158)))

(assert (=> b!1264158 t!41780))

(declare-fun b_and!45459 () Bool)

(assert (= b_and!45457 (and (=> t!41780 result!23375) b_and!45459)))

(declare-fun b_lambda!22903 () Bool)

(assert (=> (not b_lambda!22903) (not b!1264162)))

(assert (=> b!1264162 t!41780))

(declare-fun b_and!45461 () Bool)

(assert (= b_and!45459 (and (=> t!41780 result!23375) b_and!45461)))

(assert (=> b!1264163 m!1164845))

(assert (=> b!1264163 m!1164845))

(assert (=> b!1264163 m!1164847))

(declare-fun m!1164977 () Bool)

(assert (=> bm!62208 m!1164977))

(assert (=> b!1264158 m!1164893))

(assert (=> b!1264158 m!1164891))

(assert (=> b!1264158 m!1164891))

(assert (=> b!1264158 m!1164893))

(assert (=> b!1264158 m!1164895))

(assert (=> b!1264158 m!1164845))

(assert (=> b!1264158 m!1164845))

(declare-fun m!1164979 () Bool)

(assert (=> b!1264158 m!1164979))

(declare-fun m!1164981 () Bool)

(assert (=> b!1264162 m!1164981))

(declare-fun m!1164983 () Bool)

(assert (=> b!1264162 m!1164983))

(declare-fun m!1164985 () Bool)

(assert (=> b!1264162 m!1164985))

(assert (=> b!1264162 m!1164893))

(assert (=> b!1264162 m!1164983))

(declare-fun m!1164987 () Bool)

(assert (=> b!1264162 m!1164987))

(assert (=> b!1264162 m!1164891))

(assert (=> b!1264162 m!1164891))

(assert (=> b!1264162 m!1164893))

(assert (=> b!1264162 m!1164895))

(assert (=> b!1264162 m!1164845))

(assert (=> b!1264154 m!1164845))

(assert (=> b!1264154 m!1164845))

(declare-fun m!1164989 () Bool)

(assert (=> b!1264154 m!1164989))

(declare-fun m!1164991 () Bool)

(assert (=> b!1264156 m!1164991))

(declare-fun m!1164993 () Bool)

(assert (=> d!139029 m!1164993))

(assert (=> d!139029 m!1164767))

(declare-fun m!1164995 () Bool)

(assert (=> b!1264160 m!1164995))

(assert (=> b!1264153 m!1164845))

(assert (=> b!1264153 m!1164845))

(assert (=> b!1264153 m!1164847))

(assert (=> b!1264159 m!1164977))

(assert (=> b!1263942 d!139029))

(declare-fun b!1264174 () Bool)

(declare-fun e!719758 () Bool)

(declare-fun e!719761 () Bool)

(assert (=> b!1264174 (= e!719758 e!719761)))

(declare-fun c!123303 () Bool)

(assert (=> b!1264174 (= c!123303 (validKeyInArray!0 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62211 () Bool)

(declare-fun call!62214 () Bool)

(assert (=> bm!62211 (= call!62214 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123303 (Cons!28270 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000) Nil!28271) Nil!28271)))))

(declare-fun b!1264175 () Bool)

(declare-fun e!719760 () Bool)

(declare-fun contains!7624 (List!28274 (_ BitVec 64)) Bool)

(assert (=> b!1264175 (= e!719760 (contains!7624 Nil!28271 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264176 () Bool)

(declare-fun e!719759 () Bool)

(assert (=> b!1264176 (= e!719759 e!719758)))

(declare-fun res!841789 () Bool)

(assert (=> b!1264176 (=> (not res!841789) (not e!719758))))

(assert (=> b!1264176 (= res!841789 (not e!719760))))

(declare-fun res!841788 () Bool)

(assert (=> b!1264176 (=> (not res!841788) (not e!719760))))

(assert (=> b!1264176 (= res!841788 (validKeyInArray!0 (select (arr!39759 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264177 () Bool)

(assert (=> b!1264177 (= e!719761 call!62214)))

(declare-fun b!1264178 () Bool)

(assert (=> b!1264178 (= e!719761 call!62214)))

(declare-fun d!139031 () Bool)

(declare-fun res!841790 () Bool)

(assert (=> d!139031 (=> res!841790 e!719759)))

(assert (=> d!139031 (= res!841790 (bvsge #b00000000000000000000000000000000 (size!40296 _keys!1118)))))

(assert (=> d!139031 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28271) e!719759)))

(assert (= (and d!139031 (not res!841790)) b!1264176))

(assert (= (and b!1264176 res!841788) b!1264175))

(assert (= (and b!1264176 res!841789) b!1264174))

(assert (= (and b!1264174 c!123303) b!1264178))

(assert (= (and b!1264174 (not c!123303)) b!1264177))

(assert (= (or b!1264178 b!1264177) bm!62211))

(assert (=> b!1264174 m!1164845))

(assert (=> b!1264174 m!1164845))

(assert (=> b!1264174 m!1164847))

(assert (=> bm!62211 m!1164845))

(declare-fun m!1164997 () Bool)

(assert (=> bm!62211 m!1164997))

(assert (=> b!1264175 m!1164845))

(assert (=> b!1264175 m!1164845))

(declare-fun m!1164999 () Bool)

(assert (=> b!1264175 m!1164999))

(assert (=> b!1264176 m!1164845))

(assert (=> b!1264176 m!1164845))

(assert (=> b!1264176 m!1164847))

(assert (=> b!1263945 d!139031))

(declare-fun mapIsEmpty!50401 () Bool)

(declare-fun mapRes!50401 () Bool)

(assert (=> mapIsEmpty!50401 mapRes!50401))

(declare-fun condMapEmpty!50401 () Bool)

(declare-fun mapDefault!50401 () ValueCell!15428)

(assert (=> mapNonEmpty!50392 (= condMapEmpty!50401 (= mapRest!50392 ((as const (Array (_ BitVec 32) ValueCell!15428)) mapDefault!50401)))))

(declare-fun e!719766 () Bool)

(assert (=> mapNonEmpty!50392 (= tp!95990 (and e!719766 mapRes!50401))))

(declare-fun b!1264185 () Bool)

(declare-fun e!719767 () Bool)

(assert (=> b!1264185 (= e!719767 tp_is_empty!32383)))

(declare-fun b!1264186 () Bool)

(assert (=> b!1264186 (= e!719766 tp_is_empty!32383)))

(declare-fun mapNonEmpty!50401 () Bool)

(declare-fun tp!96005 () Bool)

(assert (=> mapNonEmpty!50401 (= mapRes!50401 (and tp!96005 e!719767))))

(declare-fun mapRest!50401 () (Array (_ BitVec 32) ValueCell!15428))

(declare-fun mapValue!50401 () ValueCell!15428)

(declare-fun mapKey!50401 () (_ BitVec 32))

(assert (=> mapNonEmpty!50401 (= mapRest!50392 (store mapRest!50401 mapKey!50401 mapValue!50401))))

(assert (= (and mapNonEmpty!50392 condMapEmpty!50401) mapIsEmpty!50401))

(assert (= (and mapNonEmpty!50392 (not condMapEmpty!50401)) mapNonEmpty!50401))

(assert (= (and mapNonEmpty!50401 ((_ is ValueCellFull!15428) mapValue!50401)) b!1264185))

(assert (= (and mapNonEmpty!50392 ((_ is ValueCellFull!15428) mapDefault!50401)) b!1264186))

(declare-fun m!1165001 () Bool)

(assert (=> mapNonEmpty!50401 m!1165001))

(declare-fun b_lambda!22905 () Bool)

(assert (= b_lambda!22901 (or (and start!106252 b_free!27481) b_lambda!22905)))

(declare-fun b_lambda!22907 () Bool)

(assert (= b_lambda!22903 (or (and start!106252 b_free!27481) b_lambda!22907)))

(declare-fun b_lambda!22909 () Bool)

(assert (= b_lambda!22899 (or (and start!106252 b_free!27481) b_lambda!22909)))

(declare-fun b_lambda!22911 () Bool)

(assert (= b_lambda!22897 (or (and start!106252 b_free!27481) b_lambda!22911)))

(declare-fun b_lambda!22913 () Bool)

(assert (= b_lambda!22895 (or (and start!106252 b_free!27481) b_lambda!22913)))

(declare-fun b_lambda!22915 () Bool)

(assert (= b_lambda!22893 (or (and start!106252 b_free!27481) b_lambda!22915)))

(check-sat (not b!1264060) (not b_lambda!22915) (not b!1264146) (not b!1264151) (not b!1264160) (not b!1264063) (not b!1264076) (not b!1264142) (not b!1264154) (not d!139015) (not b!1264174) (not b!1264100) (not b!1264162) (not b!1264064) (not b!1264099) (not mapNonEmpty!50401) (not b_next!27481) (not b!1264114) (not b!1264147) (not b!1264144) (not d!139025) (not b!1264159) (not d!139011) (not bm!62195) (not b!1264090) (not bm!62211) (not bm!62188) (not b!1264017) (not d!139029) (not bm!62196) (not b!1264103) (not bm!62189) (not b!1264150) (not b!1264175) (not d!139009) tp_is_empty!32383 (not b_lambda!22905) (not bm!62194) b_and!45461 (not b!1264176) (not bm!62191) (not b!1264112) (not b_lambda!22909) (not bm!62204) (not b!1264087) (not b_lambda!22913) (not d!139013) (not b!1264153) (not b!1264086) (not b!1264156) (not b!1264016) (not b!1264069) (not bm!62198) (not b!1264158) (not bm!62208) (not b!1264011) (not b_lambda!22907) (not d!139027) (not b_lambda!22911) (not b!1264141) (not b!1264080) (not bm!62201) (not b!1264009) (not b!1264083) (not b!1264163) (not b!1264148) (not bm!62207) (not b!1264092) (not b!1264077) (not b!1264067))
(check-sat b_and!45461 (not b_next!27481))
