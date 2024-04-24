; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43538 () Bool)

(assert start!43538)

(declare-fun b_free!12331 () Bool)

(declare-fun b_next!12331 () Bool)

(assert (=> start!43538 (= b_free!12331 (not b_next!12331))))

(declare-fun tp!43276 () Bool)

(declare-fun b_and!21101 () Bool)

(assert (=> start!43538 (= tp!43276 b_and!21101)))

(declare-fun b!482550 () Bool)

(declare-fun e!283967 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!482550 (= e!283967 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!482551 () Bool)

(declare-datatypes ((array!31332 0))(
  ( (array!31333 (arr!15068 (Array (_ BitVec 32) (_ BitVec 64))) (size!15426 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31332)

(declare-fun arrayContainsKey!0 (array!31332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482551 (= e!283967 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482552 () Bool)

(declare-fun res!287671 () Bool)

(declare-fun e!283966 () Bool)

(assert (=> b!482552 (=> (not res!287671) (not e!283966))))

(declare-datatypes ((List!9130 0))(
  ( (Nil!9127) (Cons!9126 (h!9982 (_ BitVec 64)) (t!15336 List!9130)) )
))
(declare-fun arrayNoDuplicates!0 (array!31332 (_ BitVec 32) List!9130) Bool)

(assert (=> b!482552 (= res!287671 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9127))))

(declare-fun b!482553 () Bool)

(declare-fun mask!2352 () (_ BitVec 32))

(assert (=> b!482553 (= e!283966 (not (or (not (= (size!15426 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvsle #b00000000000000000000000000000000 (size!15426 _keys!1874)))))))

(declare-fun lt!218767 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31332 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482553 (= lt!218767 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!482553 e!283967))

(declare-fun c!57942 () Bool)

(assert (=> b!482553 (= c!57942 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((V!19529 0))(
  ( (V!19530 (val!6969 Int)) )
))
(declare-fun minValue!1458 () V!19529)

(declare-fun zeroValue!1458 () V!19529)

(declare-datatypes ((ValueCell!6560 0))(
  ( (ValueCellFull!6560 (v!9263 V!19529)) (EmptyCell!6560) )
))
(declare-datatypes ((array!31334 0))(
  ( (array!31335 (arr!15069 (Array (_ BitVec 32) ValueCell!6560)) (size!15427 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31334)

(declare-datatypes ((Unit!14111 0))(
  ( (Unit!14112) )
))
(declare-fun lt!218766 () Unit!14111)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!147 (array!31332 array!31334 (_ BitVec 32) (_ BitVec 32) V!19529 V!19529 (_ BitVec 64) Int) Unit!14111)

(assert (=> b!482553 (= lt!218766 (lemmaKeyInListMapIsInArray!147 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!482554 () Bool)

(declare-fun res!287676 () Bool)

(assert (=> b!482554 (=> (not res!287676) (not e!283966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482554 (= res!287676 (validKeyInArray!0 k0!1332))))

(declare-fun b!482555 () Bool)

(declare-fun e!283969 () Bool)

(declare-fun tp_is_empty!13843 () Bool)

(assert (=> b!482555 (= e!283969 tp_is_empty!13843)))

(declare-fun res!287673 () Bool)

(assert (=> start!43538 (=> (not res!287673) (not e!283966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43538 (= res!287673 (validMask!0 mask!2352))))

(assert (=> start!43538 e!283966))

(assert (=> start!43538 true))

(assert (=> start!43538 tp_is_empty!13843))

(declare-fun e!283970 () Bool)

(declare-fun array_inv!10938 (array!31334) Bool)

(assert (=> start!43538 (and (array_inv!10938 _values!1516) e!283970)))

(assert (=> start!43538 tp!43276))

(declare-fun array_inv!10939 (array!31332) Bool)

(assert (=> start!43538 (array_inv!10939 _keys!1874)))

(declare-fun b!482556 () Bool)

(declare-fun res!287672 () Bool)

(assert (=> b!482556 (=> (not res!287672) (not e!283966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31332 (_ BitVec 32)) Bool)

(assert (=> b!482556 (= res!287672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482557 () Bool)

(declare-fun res!287675 () Bool)

(assert (=> b!482557 (=> (not res!287675) (not e!283966))))

(assert (=> b!482557 (= res!287675 (and (= (size!15427 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15426 _keys!1874) (size!15427 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482558 () Bool)

(declare-fun mapRes!22474 () Bool)

(assert (=> b!482558 (= e!283970 (and e!283969 mapRes!22474))))

(declare-fun condMapEmpty!22474 () Bool)

(declare-fun mapDefault!22474 () ValueCell!6560)

(assert (=> b!482558 (= condMapEmpty!22474 (= (arr!15069 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6560)) mapDefault!22474)))))

(declare-fun mapIsEmpty!22474 () Bool)

(assert (=> mapIsEmpty!22474 mapRes!22474))

(declare-fun mapNonEmpty!22474 () Bool)

(declare-fun tp!43275 () Bool)

(declare-fun e!283971 () Bool)

(assert (=> mapNonEmpty!22474 (= mapRes!22474 (and tp!43275 e!283971))))

(declare-fun mapRest!22474 () (Array (_ BitVec 32) ValueCell!6560))

(declare-fun mapValue!22474 () ValueCell!6560)

(declare-fun mapKey!22474 () (_ BitVec 32))

(assert (=> mapNonEmpty!22474 (= (arr!15069 _values!1516) (store mapRest!22474 mapKey!22474 mapValue!22474))))

(declare-fun b!482559 () Bool)

(declare-fun res!287674 () Bool)

(assert (=> b!482559 (=> (not res!287674) (not e!283966))))

(declare-datatypes ((tuple2!9062 0))(
  ( (tuple2!9063 (_1!4542 (_ BitVec 64)) (_2!4542 V!19529)) )
))
(declare-datatypes ((List!9131 0))(
  ( (Nil!9128) (Cons!9127 (h!9983 tuple2!9062) (t!15337 List!9131)) )
))
(declare-datatypes ((ListLongMap!7977 0))(
  ( (ListLongMap!7978 (toList!4004 List!9131)) )
))
(declare-fun contains!2636 (ListLongMap!7977 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2318 (array!31332 array!31334 (_ BitVec 32) (_ BitVec 32) V!19529 V!19529 (_ BitVec 32) Int) ListLongMap!7977)

(assert (=> b!482559 (= res!287674 (contains!2636 (getCurrentListMap!2318 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482560 () Bool)

(assert (=> b!482560 (= e!283971 tp_is_empty!13843)))

(assert (= (and start!43538 res!287673) b!482557))

(assert (= (and b!482557 res!287675) b!482556))

(assert (= (and b!482556 res!287672) b!482552))

(assert (= (and b!482552 res!287671) b!482559))

(assert (= (and b!482559 res!287674) b!482554))

(assert (= (and b!482554 res!287676) b!482553))

(assert (= (and b!482553 c!57942) b!482551))

(assert (= (and b!482553 (not c!57942)) b!482550))

(assert (= (and b!482558 condMapEmpty!22474) mapIsEmpty!22474))

(assert (= (and b!482558 (not condMapEmpty!22474)) mapNonEmpty!22474))

(get-info :version)

(assert (= (and mapNonEmpty!22474 ((_ is ValueCellFull!6560) mapValue!22474)) b!482560))

(assert (= (and b!482558 ((_ is ValueCellFull!6560) mapDefault!22474)) b!482555))

(assert (= start!43538 b!482558))

(declare-fun m!463993 () Bool)

(assert (=> b!482553 m!463993))

(declare-fun m!463995 () Bool)

(assert (=> b!482553 m!463995))

(declare-fun m!463997 () Bool)

(assert (=> b!482552 m!463997))

(declare-fun m!463999 () Bool)

(assert (=> b!482556 m!463999))

(declare-fun m!464001 () Bool)

(assert (=> b!482551 m!464001))

(declare-fun m!464003 () Bool)

(assert (=> start!43538 m!464003))

(declare-fun m!464005 () Bool)

(assert (=> start!43538 m!464005))

(declare-fun m!464007 () Bool)

(assert (=> start!43538 m!464007))

(declare-fun m!464009 () Bool)

(assert (=> mapNonEmpty!22474 m!464009))

(declare-fun m!464011 () Bool)

(assert (=> b!482559 m!464011))

(assert (=> b!482559 m!464011))

(declare-fun m!464013 () Bool)

(assert (=> b!482559 m!464013))

(declare-fun m!464015 () Bool)

(assert (=> b!482554 m!464015))

(check-sat (not start!43538) (not b!482551) (not b!482552) (not b!482556) tp_is_empty!13843 b_and!21101 (not b!482559) (not mapNonEmpty!22474) (not b!482553) (not b!482554) (not b_next!12331))
(check-sat b_and!21101 (not b_next!12331))
(get-model)

(declare-fun d!76857 () Bool)

(declare-fun e!284012 () Bool)

(assert (=> d!76857 e!284012))

(declare-fun res!287715 () Bool)

(assert (=> d!76857 (=> res!287715 e!284012)))

(declare-fun lt!218790 () Bool)

(assert (=> d!76857 (= res!287715 (not lt!218790))))

(declare-fun lt!218788 () Bool)

(assert (=> d!76857 (= lt!218790 lt!218788)))

(declare-fun lt!218789 () Unit!14111)

(declare-fun e!284013 () Unit!14111)

(assert (=> d!76857 (= lt!218789 e!284013)))

(declare-fun c!57951 () Bool)

(assert (=> d!76857 (= c!57951 lt!218788)))

(declare-fun containsKey!358 (List!9131 (_ BitVec 64)) Bool)

(assert (=> d!76857 (= lt!218788 (containsKey!358 (toList!4004 (getCurrentListMap!2318 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76857 (= (contains!2636 (getCurrentListMap!2318 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218790)))

(declare-fun b!482633 () Bool)

(declare-fun lt!218791 () Unit!14111)

(assert (=> b!482633 (= e!284013 lt!218791)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!306 (List!9131 (_ BitVec 64)) Unit!14111)

(assert (=> b!482633 (= lt!218791 (lemmaContainsKeyImpliesGetValueByKeyDefined!306 (toList!4004 (getCurrentListMap!2318 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!403 0))(
  ( (Some!402 (v!9266 V!19529)) (None!401) )
))
(declare-fun isDefined!307 (Option!403) Bool)

(declare-fun getValueByKey!397 (List!9131 (_ BitVec 64)) Option!403)

(assert (=> b!482633 (isDefined!307 (getValueByKey!397 (toList!4004 (getCurrentListMap!2318 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!482634 () Bool)

(declare-fun Unit!14115 () Unit!14111)

(assert (=> b!482634 (= e!284013 Unit!14115)))

(declare-fun b!482635 () Bool)

(assert (=> b!482635 (= e!284012 (isDefined!307 (getValueByKey!397 (toList!4004 (getCurrentListMap!2318 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76857 c!57951) b!482633))

(assert (= (and d!76857 (not c!57951)) b!482634))

(assert (= (and d!76857 (not res!287715)) b!482635))

(declare-fun m!464065 () Bool)

(assert (=> d!76857 m!464065))

(declare-fun m!464067 () Bool)

(assert (=> b!482633 m!464067))

(declare-fun m!464069 () Bool)

(assert (=> b!482633 m!464069))

(assert (=> b!482633 m!464069))

(declare-fun m!464071 () Bool)

(assert (=> b!482633 m!464071))

(assert (=> b!482635 m!464069))

(assert (=> b!482635 m!464069))

(assert (=> b!482635 m!464071))

(assert (=> b!482559 d!76857))

(declare-fun b!482678 () Bool)

(declare-fun e!284047 () Bool)

(declare-fun e!284040 () Bool)

(assert (=> b!482678 (= e!284047 e!284040)))

(declare-fun c!57967 () Bool)

(assert (=> b!482678 (= c!57967 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!482679 () Bool)

(declare-fun e!284048 () Bool)

(declare-fun call!30961 () Bool)

(assert (=> b!482679 (= e!284048 (not call!30961))))

(declare-fun b!482680 () Bool)

(declare-fun e!284043 () Bool)

(assert (=> b!482680 (= e!284043 (validKeyInArray!0 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482681 () Bool)

(declare-fun e!284052 () ListLongMap!7977)

(declare-fun call!30958 () ListLongMap!7977)

(declare-fun +!1782 (ListLongMap!7977 tuple2!9062) ListLongMap!7977)

(assert (=> b!482681 (= e!284052 (+!1782 call!30958 (tuple2!9063 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!482682 () Bool)

(declare-fun e!284051 () Bool)

(assert (=> b!482682 (= e!284040 e!284051)))

(declare-fun res!287738 () Bool)

(declare-fun call!30963 () Bool)

(assert (=> b!482682 (= res!287738 call!30963)))

(assert (=> b!482682 (=> (not res!287738) (not e!284051))))

(declare-fun b!482683 () Bool)

(declare-fun e!284041 () ListLongMap!7977)

(declare-fun call!30962 () ListLongMap!7977)

(assert (=> b!482683 (= e!284041 call!30962)))

(declare-fun b!482684 () Bool)

(declare-fun c!57969 () Bool)

(assert (=> b!482684 (= c!57969 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!284050 () ListLongMap!7977)

(assert (=> b!482684 (= e!284050 e!284041)))

(declare-fun bm!30955 () Bool)

(assert (=> bm!30955 (= call!30962 call!30958)))

(declare-fun b!482685 () Bool)

(declare-fun lt!218837 () ListLongMap!7977)

(declare-fun apply!343 (ListLongMap!7977 (_ BitVec 64)) V!19529)

(assert (=> b!482685 (= e!284051 (= (apply!343 lt!218837 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!482686 () Bool)

(declare-fun e!284046 () Bool)

(declare-fun e!284044 () Bool)

(assert (=> b!482686 (= e!284046 e!284044)))

(declare-fun res!287734 () Bool)

(assert (=> b!482686 (=> (not res!287734) (not e!284044))))

(assert (=> b!482686 (= res!287734 (contains!2636 lt!218837 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!482686 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15426 _keys!1874)))))

(declare-fun b!482687 () Bool)

(declare-fun e!284042 () Unit!14111)

(declare-fun Unit!14116 () Unit!14111)

(assert (=> b!482687 (= e!284042 Unit!14116)))

(declare-fun b!482688 () Bool)

(declare-fun lt!218855 () Unit!14111)

(assert (=> b!482688 (= e!284042 lt!218855)))

(declare-fun lt!218845 () ListLongMap!7977)

(declare-fun getCurrentListMapNoExtraKeys!2127 (array!31332 array!31334 (_ BitVec 32) (_ BitVec 32) V!19529 V!19529 (_ BitVec 32) Int) ListLongMap!7977)

(assert (=> b!482688 (= lt!218845 (getCurrentListMapNoExtraKeys!2127 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218851 () (_ BitVec 64))

(assert (=> b!482688 (= lt!218851 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218841 () (_ BitVec 64))

(assert (=> b!482688 (= lt!218841 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218844 () Unit!14111)

(declare-fun addStillContains!301 (ListLongMap!7977 (_ BitVec 64) V!19529 (_ BitVec 64)) Unit!14111)

(assert (=> b!482688 (= lt!218844 (addStillContains!301 lt!218845 lt!218851 zeroValue!1458 lt!218841))))

(assert (=> b!482688 (contains!2636 (+!1782 lt!218845 (tuple2!9063 lt!218851 zeroValue!1458)) lt!218841)))

(declare-fun lt!218846 () Unit!14111)

(assert (=> b!482688 (= lt!218846 lt!218844)))

(declare-fun lt!218852 () ListLongMap!7977)

(assert (=> b!482688 (= lt!218852 (getCurrentListMapNoExtraKeys!2127 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218843 () (_ BitVec 64))

(assert (=> b!482688 (= lt!218843 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218847 () (_ BitVec 64))

(assert (=> b!482688 (= lt!218847 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218850 () Unit!14111)

(declare-fun addApplyDifferent!301 (ListLongMap!7977 (_ BitVec 64) V!19529 (_ BitVec 64)) Unit!14111)

(assert (=> b!482688 (= lt!218850 (addApplyDifferent!301 lt!218852 lt!218843 minValue!1458 lt!218847))))

(assert (=> b!482688 (= (apply!343 (+!1782 lt!218852 (tuple2!9063 lt!218843 minValue!1458)) lt!218847) (apply!343 lt!218852 lt!218847))))

(declare-fun lt!218839 () Unit!14111)

(assert (=> b!482688 (= lt!218839 lt!218850)))

(declare-fun lt!218842 () ListLongMap!7977)

(assert (=> b!482688 (= lt!218842 (getCurrentListMapNoExtraKeys!2127 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218840 () (_ BitVec 64))

(assert (=> b!482688 (= lt!218840 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218848 () (_ BitVec 64))

(assert (=> b!482688 (= lt!218848 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218854 () Unit!14111)

(assert (=> b!482688 (= lt!218854 (addApplyDifferent!301 lt!218842 lt!218840 zeroValue!1458 lt!218848))))

(assert (=> b!482688 (= (apply!343 (+!1782 lt!218842 (tuple2!9063 lt!218840 zeroValue!1458)) lt!218848) (apply!343 lt!218842 lt!218848))))

(declare-fun lt!218836 () Unit!14111)

(assert (=> b!482688 (= lt!218836 lt!218854)))

(declare-fun lt!218857 () ListLongMap!7977)

(assert (=> b!482688 (= lt!218857 (getCurrentListMapNoExtraKeys!2127 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218853 () (_ BitVec 64))

(assert (=> b!482688 (= lt!218853 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218856 () (_ BitVec 64))

(assert (=> b!482688 (= lt!218856 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!482688 (= lt!218855 (addApplyDifferent!301 lt!218857 lt!218853 minValue!1458 lt!218856))))

(assert (=> b!482688 (= (apply!343 (+!1782 lt!218857 (tuple2!9063 lt!218853 minValue!1458)) lt!218856) (apply!343 lt!218857 lt!218856))))

(declare-fun b!482689 () Bool)

(assert (=> b!482689 (= e!284052 e!284050)))

(declare-fun c!57966 () Bool)

(assert (=> b!482689 (= c!57966 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!482690 () Bool)

(declare-fun e!284045 () Bool)

(assert (=> b!482690 (= e!284048 e!284045)))

(declare-fun res!287736 () Bool)

(assert (=> b!482690 (= res!287736 call!30961)))

(assert (=> b!482690 (=> (not res!287736) (not e!284045))))

(declare-fun bm!30956 () Bool)

(declare-fun call!30959 () ListLongMap!7977)

(assert (=> bm!30956 (= call!30959 (getCurrentListMapNoExtraKeys!2127 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!482691 () Bool)

(declare-fun call!30964 () ListLongMap!7977)

(assert (=> b!482691 (= e!284041 call!30964)))

(declare-fun bm!30957 () Bool)

(declare-fun call!30960 () ListLongMap!7977)

(assert (=> bm!30957 (= call!30964 call!30960)))

(declare-fun b!482692 () Bool)

(declare-fun res!287735 () Bool)

(assert (=> b!482692 (=> (not res!287735) (not e!284047))))

(assert (=> b!482692 (= res!287735 e!284046)))

(declare-fun res!287739 () Bool)

(assert (=> b!482692 (=> res!287739 e!284046)))

(assert (=> b!482692 (= res!287739 (not e!284043))))

(declare-fun res!287737 () Bool)

(assert (=> b!482692 (=> (not res!287737) (not e!284043))))

(assert (=> b!482692 (= res!287737 (bvslt #b00000000000000000000000000000000 (size!15426 _keys!1874)))))

(declare-fun bm!30958 () Bool)

(assert (=> bm!30958 (= call!30961 (contains!2636 lt!218837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30959 () Bool)

(assert (=> bm!30959 (= call!30963 (contains!2636 lt!218837 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!482693 () Bool)

(declare-fun res!287742 () Bool)

(assert (=> b!482693 (=> (not res!287742) (not e!284047))))

(assert (=> b!482693 (= res!287742 e!284048)))

(declare-fun c!57968 () Bool)

(assert (=> b!482693 (= c!57968 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!482694 () Bool)

(declare-fun get!7299 (ValueCell!6560 V!19529) V!19529)

(declare-fun dynLambda!951 (Int (_ BitVec 64)) V!19529)

(assert (=> b!482694 (= e!284044 (= (apply!343 lt!218837 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000)) (get!7299 (select (arr!15069 _values!1516) #b00000000000000000000000000000000) (dynLambda!951 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!482694 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15427 _values!1516)))))

(assert (=> b!482694 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15426 _keys!1874)))))

(declare-fun bm!30960 () Bool)

(assert (=> bm!30960 (= call!30960 call!30959)))

(declare-fun b!482695 () Bool)

(declare-fun e!284049 () Bool)

(assert (=> b!482695 (= e!284049 (validKeyInArray!0 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482696 () Bool)

(assert (=> b!482696 (= e!284040 (not call!30963))))

(declare-fun b!482697 () Bool)

(assert (=> b!482697 (= e!284045 (= (apply!343 lt!218837 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun bm!30961 () Bool)

(declare-fun c!57965 () Bool)

(assert (=> bm!30961 (= call!30958 (+!1782 (ite c!57965 call!30959 (ite c!57966 call!30960 call!30964)) (ite (or c!57965 c!57966) (tuple2!9063 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9063 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!482698 () Bool)

(assert (=> b!482698 (= e!284050 call!30962)))

(declare-fun d!76859 () Bool)

(assert (=> d!76859 e!284047))

(declare-fun res!287741 () Bool)

(assert (=> d!76859 (=> (not res!287741) (not e!284047))))

(assert (=> d!76859 (= res!287741 (or (bvsge #b00000000000000000000000000000000 (size!15426 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15426 _keys!1874)))))))

(declare-fun lt!218838 () ListLongMap!7977)

(assert (=> d!76859 (= lt!218837 lt!218838)))

(declare-fun lt!218849 () Unit!14111)

(assert (=> d!76859 (= lt!218849 e!284042)))

(declare-fun c!57964 () Bool)

(assert (=> d!76859 (= c!57964 e!284049)))

(declare-fun res!287740 () Bool)

(assert (=> d!76859 (=> (not res!287740) (not e!284049))))

(assert (=> d!76859 (= res!287740 (bvslt #b00000000000000000000000000000000 (size!15426 _keys!1874)))))

(assert (=> d!76859 (= lt!218838 e!284052)))

(assert (=> d!76859 (= c!57965 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76859 (validMask!0 mask!2352)))

(assert (=> d!76859 (= (getCurrentListMap!2318 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218837)))

(assert (= (and d!76859 c!57965) b!482681))

(assert (= (and d!76859 (not c!57965)) b!482689))

(assert (= (and b!482689 c!57966) b!482698))

(assert (= (and b!482689 (not c!57966)) b!482684))

(assert (= (and b!482684 c!57969) b!482683))

(assert (= (and b!482684 (not c!57969)) b!482691))

(assert (= (or b!482683 b!482691) bm!30957))

(assert (= (or b!482698 bm!30957) bm!30960))

(assert (= (or b!482698 b!482683) bm!30955))

(assert (= (or b!482681 bm!30960) bm!30956))

(assert (= (or b!482681 bm!30955) bm!30961))

(assert (= (and d!76859 res!287740) b!482695))

(assert (= (and d!76859 c!57964) b!482688))

(assert (= (and d!76859 (not c!57964)) b!482687))

(assert (= (and d!76859 res!287741) b!482692))

(assert (= (and b!482692 res!287737) b!482680))

(assert (= (and b!482692 (not res!287739)) b!482686))

(assert (= (and b!482686 res!287734) b!482694))

(assert (= (and b!482692 res!287735) b!482693))

(assert (= (and b!482693 c!57968) b!482690))

(assert (= (and b!482693 (not c!57968)) b!482679))

(assert (= (and b!482690 res!287736) b!482697))

(assert (= (or b!482690 b!482679) bm!30958))

(assert (= (and b!482693 res!287742) b!482678))

(assert (= (and b!482678 c!57967) b!482682))

(assert (= (and b!482678 (not c!57967)) b!482696))

(assert (= (and b!482682 res!287738) b!482685))

(assert (= (or b!482682 b!482696) bm!30959))

(declare-fun b_lambda!10821 () Bool)

(assert (=> (not b_lambda!10821) (not b!482694)))

(declare-fun t!15340 () Bool)

(declare-fun tb!4159 () Bool)

(assert (=> (and start!43538 (= defaultEntry!1519 defaultEntry!1519) t!15340) tb!4159))

(declare-fun result!7761 () Bool)

(assert (=> tb!4159 (= result!7761 tp_is_empty!13843)))

(assert (=> b!482694 t!15340))

(declare-fun b_and!21107 () Bool)

(assert (= b_and!21101 (and (=> t!15340 result!7761) b_and!21107)))

(declare-fun m!464073 () Bool)

(assert (=> b!482697 m!464073))

(declare-fun m!464075 () Bool)

(assert (=> bm!30956 m!464075))

(declare-fun m!464077 () Bool)

(assert (=> b!482680 m!464077))

(assert (=> b!482680 m!464077))

(declare-fun m!464079 () Bool)

(assert (=> b!482680 m!464079))

(declare-fun m!464081 () Bool)

(assert (=> bm!30961 m!464081))

(assert (=> b!482695 m!464077))

(assert (=> b!482695 m!464077))

(assert (=> b!482695 m!464079))

(declare-fun m!464083 () Bool)

(assert (=> b!482694 m!464083))

(declare-fun m!464085 () Bool)

(assert (=> b!482694 m!464085))

(assert (=> b!482694 m!464083))

(declare-fun m!464087 () Bool)

(assert (=> b!482694 m!464087))

(assert (=> b!482694 m!464085))

(assert (=> b!482694 m!464077))

(assert (=> b!482694 m!464077))

(declare-fun m!464089 () Bool)

(assert (=> b!482694 m!464089))

(declare-fun m!464091 () Bool)

(assert (=> b!482685 m!464091))

(declare-fun m!464093 () Bool)

(assert (=> b!482681 m!464093))

(declare-fun m!464095 () Bool)

(assert (=> bm!30959 m!464095))

(assert (=> d!76859 m!464003))

(declare-fun m!464097 () Bool)

(assert (=> b!482688 m!464097))

(declare-fun m!464099 () Bool)

(assert (=> b!482688 m!464099))

(declare-fun m!464101 () Bool)

(assert (=> b!482688 m!464101))

(assert (=> b!482688 m!464097))

(declare-fun m!464103 () Bool)

(assert (=> b!482688 m!464103))

(assert (=> b!482688 m!464077))

(declare-fun m!464105 () Bool)

(assert (=> b!482688 m!464105))

(declare-fun m!464107 () Bool)

(assert (=> b!482688 m!464107))

(declare-fun m!464109 () Bool)

(assert (=> b!482688 m!464109))

(assert (=> b!482688 m!464107))

(declare-fun m!464111 () Bool)

(assert (=> b!482688 m!464111))

(declare-fun m!464113 () Bool)

(assert (=> b!482688 m!464113))

(declare-fun m!464115 () Bool)

(assert (=> b!482688 m!464115))

(declare-fun m!464117 () Bool)

(assert (=> b!482688 m!464117))

(declare-fun m!464119 () Bool)

(assert (=> b!482688 m!464119))

(declare-fun m!464121 () Bool)

(assert (=> b!482688 m!464121))

(assert (=> b!482688 m!464113))

(declare-fun m!464123 () Bool)

(assert (=> b!482688 m!464123))

(declare-fun m!464125 () Bool)

(assert (=> b!482688 m!464125))

(assert (=> b!482688 m!464117))

(assert (=> b!482688 m!464075))

(declare-fun m!464127 () Bool)

(assert (=> bm!30958 m!464127))

(assert (=> b!482686 m!464077))

(assert (=> b!482686 m!464077))

(declare-fun m!464129 () Bool)

(assert (=> b!482686 m!464129))

(assert (=> b!482559 d!76859))

(declare-fun bm!30964 () Bool)

(declare-fun call!30967 () Bool)

(assert (=> bm!30964 (= call!30967 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!482709 () Bool)

(declare-fun e!284059 () Bool)

(declare-fun e!284061 () Bool)

(assert (=> b!482709 (= e!284059 e!284061)))

(declare-fun lt!218865 () (_ BitVec 64))

(assert (=> b!482709 (= lt!218865 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218866 () Unit!14111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31332 (_ BitVec 64) (_ BitVec 32)) Unit!14111)

(assert (=> b!482709 (= lt!218866 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218865 #b00000000000000000000000000000000))))

(assert (=> b!482709 (arrayContainsKey!0 _keys!1874 lt!218865 #b00000000000000000000000000000000)))

(declare-fun lt!218864 () Unit!14111)

(assert (=> b!482709 (= lt!218864 lt!218866)))

(declare-fun res!287747 () Bool)

(declare-datatypes ((SeekEntryResult!3521 0))(
  ( (MissingZero!3521 (index!16263 (_ BitVec 32))) (Found!3521 (index!16264 (_ BitVec 32))) (Intermediate!3521 (undefined!4333 Bool) (index!16265 (_ BitVec 32)) (x!45288 (_ BitVec 32))) (Undefined!3521) (MissingVacant!3521 (index!16266 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31332 (_ BitVec 32)) SeekEntryResult!3521)

(assert (=> b!482709 (= res!287747 (= (seekEntryOrOpen!0 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3521 #b00000000000000000000000000000000)))))

(assert (=> b!482709 (=> (not res!287747) (not e!284061))))

(declare-fun b!482710 () Bool)

(declare-fun e!284060 () Bool)

(assert (=> b!482710 (= e!284060 e!284059)))

(declare-fun c!57972 () Bool)

(assert (=> b!482710 (= c!57972 (validKeyInArray!0 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482712 () Bool)

(assert (=> b!482712 (= e!284059 call!30967)))

(declare-fun b!482711 () Bool)

(assert (=> b!482711 (= e!284061 call!30967)))

(declare-fun d!76861 () Bool)

(declare-fun res!287748 () Bool)

(assert (=> d!76861 (=> res!287748 e!284060)))

(assert (=> d!76861 (= res!287748 (bvsge #b00000000000000000000000000000000 (size!15426 _keys!1874)))))

(assert (=> d!76861 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!284060)))

(assert (= (and d!76861 (not res!287748)) b!482710))

(assert (= (and b!482710 c!57972) b!482709))

(assert (= (and b!482710 (not c!57972)) b!482712))

(assert (= (and b!482709 res!287747) b!482711))

(assert (= (or b!482711 b!482712) bm!30964))

(declare-fun m!464131 () Bool)

(assert (=> bm!30964 m!464131))

(assert (=> b!482709 m!464077))

(declare-fun m!464133 () Bool)

(assert (=> b!482709 m!464133))

(declare-fun m!464135 () Bool)

(assert (=> b!482709 m!464135))

(assert (=> b!482709 m!464077))

(declare-fun m!464137 () Bool)

(assert (=> b!482709 m!464137))

(assert (=> b!482710 m!464077))

(assert (=> b!482710 m!464077))

(assert (=> b!482710 m!464079))

(assert (=> b!482556 d!76861))

(declare-fun d!76863 () Bool)

(declare-fun res!287753 () Bool)

(declare-fun e!284066 () Bool)

(assert (=> d!76863 (=> res!287753 e!284066)))

(assert (=> d!76863 (= res!287753 (= (select (arr!15068 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76863 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!284066)))

(declare-fun b!482717 () Bool)

(declare-fun e!284067 () Bool)

(assert (=> b!482717 (= e!284066 e!284067)))

(declare-fun res!287754 () Bool)

(assert (=> b!482717 (=> (not res!287754) (not e!284067))))

(assert (=> b!482717 (= res!287754 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15426 _keys!1874)))))

(declare-fun b!482718 () Bool)

(assert (=> b!482718 (= e!284067 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76863 (not res!287753)) b!482717))

(assert (= (and b!482717 res!287754) b!482718))

(assert (=> d!76863 m!464077))

(declare-fun m!464139 () Bool)

(assert (=> b!482718 m!464139))

(assert (=> b!482551 d!76863))

(declare-fun b!482729 () Bool)

(declare-fun e!284079 () Bool)

(declare-fun contains!2638 (List!9130 (_ BitVec 64)) Bool)

(assert (=> b!482729 (= e!284079 (contains!2638 Nil!9127 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30967 () Bool)

(declare-fun call!30970 () Bool)

(declare-fun c!57975 () Bool)

(assert (=> bm!30967 (= call!30970 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57975 (Cons!9126 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000) Nil!9127) Nil!9127)))))

(declare-fun b!482730 () Bool)

(declare-fun e!284078 () Bool)

(declare-fun e!284076 () Bool)

(assert (=> b!482730 (= e!284078 e!284076)))

(assert (=> b!482730 (= c!57975 (validKeyInArray!0 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76865 () Bool)

(declare-fun res!287762 () Bool)

(declare-fun e!284077 () Bool)

(assert (=> d!76865 (=> res!287762 e!284077)))

(assert (=> d!76865 (= res!287762 (bvsge #b00000000000000000000000000000000 (size!15426 _keys!1874)))))

(assert (=> d!76865 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9127) e!284077)))

(declare-fun b!482731 () Bool)

(assert (=> b!482731 (= e!284077 e!284078)))

(declare-fun res!287761 () Bool)

(assert (=> b!482731 (=> (not res!287761) (not e!284078))))

(assert (=> b!482731 (= res!287761 (not e!284079))))

(declare-fun res!287763 () Bool)

(assert (=> b!482731 (=> (not res!287763) (not e!284079))))

(assert (=> b!482731 (= res!287763 (validKeyInArray!0 (select (arr!15068 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482732 () Bool)

(assert (=> b!482732 (= e!284076 call!30970)))

(declare-fun b!482733 () Bool)

(assert (=> b!482733 (= e!284076 call!30970)))

(assert (= (and d!76865 (not res!287762)) b!482731))

(assert (= (and b!482731 res!287763) b!482729))

(assert (= (and b!482731 res!287761) b!482730))

(assert (= (and b!482730 c!57975) b!482732))

(assert (= (and b!482730 (not c!57975)) b!482733))

(assert (= (or b!482732 b!482733) bm!30967))

(assert (=> b!482729 m!464077))

(assert (=> b!482729 m!464077))

(declare-fun m!464141 () Bool)

(assert (=> b!482729 m!464141))

(assert (=> bm!30967 m!464077))

(declare-fun m!464143 () Bool)

(assert (=> bm!30967 m!464143))

(assert (=> b!482730 m!464077))

(assert (=> b!482730 m!464077))

(assert (=> b!482730 m!464079))

(assert (=> b!482731 m!464077))

(assert (=> b!482731 m!464077))

(assert (=> b!482731 m!464079))

(assert (=> b!482552 d!76865))

(declare-fun d!76867 () Bool)

(declare-fun lt!218869 () (_ BitVec 32))

(assert (=> d!76867 (and (or (bvslt lt!218869 #b00000000000000000000000000000000) (bvsge lt!218869 (size!15426 _keys!1874)) (and (bvsge lt!218869 #b00000000000000000000000000000000) (bvslt lt!218869 (size!15426 _keys!1874)))) (bvsge lt!218869 #b00000000000000000000000000000000) (bvslt lt!218869 (size!15426 _keys!1874)) (= (select (arr!15068 _keys!1874) lt!218869) k0!1332))))

(declare-fun e!284082 () (_ BitVec 32))

(assert (=> d!76867 (= lt!218869 e!284082)))

(declare-fun c!57978 () Bool)

(assert (=> d!76867 (= c!57978 (= (select (arr!15068 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76867 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15426 _keys!1874)) (bvslt (size!15426 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76867 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218869)))

(declare-fun b!482738 () Bool)

(assert (=> b!482738 (= e!284082 #b00000000000000000000000000000000)))

(declare-fun b!482739 () Bool)

(assert (=> b!482739 (= e!284082 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76867 c!57978) b!482738))

(assert (= (and d!76867 (not c!57978)) b!482739))

(declare-fun m!464145 () Bool)

(assert (=> d!76867 m!464145))

(assert (=> d!76867 m!464077))

(declare-fun m!464147 () Bool)

(assert (=> b!482739 m!464147))

(assert (=> b!482553 d!76867))

(declare-fun d!76869 () Bool)

(declare-fun e!284085 () Bool)

(assert (=> d!76869 e!284085))

(declare-fun c!57981 () Bool)

(assert (=> d!76869 (= c!57981 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218872 () Unit!14111)

(declare-fun choose!1384 (array!31332 array!31334 (_ BitVec 32) (_ BitVec 32) V!19529 V!19529 (_ BitVec 64) Int) Unit!14111)

(assert (=> d!76869 (= lt!218872 (choose!1384 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76869 (validMask!0 mask!2352)))

(assert (=> d!76869 (= (lemmaKeyInListMapIsInArray!147 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218872)))

(declare-fun b!482744 () Bool)

(assert (=> b!482744 (= e!284085 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482745 () Bool)

(assert (=> b!482745 (= e!284085 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76869 c!57981) b!482744))

(assert (= (and d!76869 (not c!57981)) b!482745))

(declare-fun m!464149 () Bool)

(assert (=> d!76869 m!464149))

(assert (=> d!76869 m!464003))

(assert (=> b!482744 m!464001))

(assert (=> b!482553 d!76869))

(declare-fun d!76871 () Bool)

(assert (=> d!76871 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43538 d!76871))

(declare-fun d!76873 () Bool)

(assert (=> d!76873 (= (array_inv!10938 _values!1516) (bvsge (size!15427 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43538 d!76873))

(declare-fun d!76875 () Bool)

(assert (=> d!76875 (= (array_inv!10939 _keys!1874) (bvsge (size!15426 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43538 d!76875))

(declare-fun d!76877 () Bool)

(assert (=> d!76877 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!482554 d!76877))

(declare-fun mapIsEmpty!22483 () Bool)

(declare-fun mapRes!22483 () Bool)

(assert (=> mapIsEmpty!22483 mapRes!22483))

(declare-fun b!482753 () Bool)

(declare-fun e!284090 () Bool)

(assert (=> b!482753 (= e!284090 tp_is_empty!13843)))

(declare-fun condMapEmpty!22483 () Bool)

(declare-fun mapDefault!22483 () ValueCell!6560)

(assert (=> mapNonEmpty!22474 (= condMapEmpty!22483 (= mapRest!22474 ((as const (Array (_ BitVec 32) ValueCell!6560)) mapDefault!22483)))))

(assert (=> mapNonEmpty!22474 (= tp!43275 (and e!284090 mapRes!22483))))

(declare-fun mapNonEmpty!22483 () Bool)

(declare-fun tp!43291 () Bool)

(declare-fun e!284091 () Bool)

(assert (=> mapNonEmpty!22483 (= mapRes!22483 (and tp!43291 e!284091))))

(declare-fun mapRest!22483 () (Array (_ BitVec 32) ValueCell!6560))

(declare-fun mapValue!22483 () ValueCell!6560)

(declare-fun mapKey!22483 () (_ BitVec 32))

(assert (=> mapNonEmpty!22483 (= mapRest!22474 (store mapRest!22483 mapKey!22483 mapValue!22483))))

(declare-fun b!482752 () Bool)

(assert (=> b!482752 (= e!284091 tp_is_empty!13843)))

(assert (= (and mapNonEmpty!22474 condMapEmpty!22483) mapIsEmpty!22483))

(assert (= (and mapNonEmpty!22474 (not condMapEmpty!22483)) mapNonEmpty!22483))

(assert (= (and mapNonEmpty!22483 ((_ is ValueCellFull!6560) mapValue!22483)) b!482752))

(assert (= (and mapNonEmpty!22474 ((_ is ValueCellFull!6560) mapDefault!22483)) b!482753))

(declare-fun m!464151 () Bool)

(assert (=> mapNonEmpty!22483 m!464151))

(declare-fun b_lambda!10823 () Bool)

(assert (= b_lambda!10821 (or (and start!43538 b_free!12331) b_lambda!10823)))

(check-sat (not d!76869) (not b_lambda!10823) (not bm!30961) (not b!482739) (not b!482730) (not bm!30958) (not b!482686) (not b!482633) (not b!482635) (not b!482744) (not b!482710) (not b!482731) (not bm!30967) (not b!482685) (not bm!30964) (not b!482697) (not b!482688) (not mapNonEmpty!22483) (not bm!30959) (not b!482681) (not d!76859) (not b!482729) (not b_next!12331) (not b!482709) (not b!482695) (not b!482694) b_and!21107 (not bm!30956) (not b!482680) tp_is_empty!13843 (not b!482718) (not d!76857))
(check-sat b_and!21107 (not b_next!12331))
