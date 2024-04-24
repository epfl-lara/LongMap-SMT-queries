; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4240 () Bool)

(assert start!4240)

(declare-fun b_free!1129 () Bool)

(declare-fun b_next!1129 () Bool)

(assert (=> start!4240 (= b_free!1129 (not b_next!1129))))

(declare-fun tp!4809 () Bool)

(declare-fun b_and!1931 () Bool)

(assert (=> start!4240 (= tp!4809 b_and!1931)))

(declare-fun res!19662 () Bool)

(declare-fun e!20561 () Bool)

(assert (=> start!4240 (=> (not res!19662) (not e!20561))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4240 (= res!19662 (validMask!0 mask!2294))))

(assert (=> start!4240 e!20561))

(assert (=> start!4240 true))

(assert (=> start!4240 tp!4809))

(declare-datatypes ((V!1803 0))(
  ( (V!1804 (val!768 Int)) )
))
(declare-datatypes ((ValueCell!542 0))(
  ( (ValueCellFull!542 (v!1858 V!1803)) (EmptyCell!542) )
))
(declare-datatypes ((array!2165 0))(
  ( (array!2166 (arr!1035 (Array (_ BitVec 32) ValueCell!542)) (size!1136 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2165)

(declare-fun e!20562 () Bool)

(declare-fun array_inv!711 (array!2165) Bool)

(assert (=> start!4240 (and (array_inv!711 _values!1501) e!20562)))

(declare-datatypes ((array!2167 0))(
  ( (array!2168 (arr!1036 (Array (_ BitVec 32) (_ BitVec 64))) (size!1137 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2167)

(declare-fun array_inv!712 (array!2167) Bool)

(assert (=> start!4240 (array_inv!712 _keys!1833)))

(declare-fun tp_is_empty!1483 () Bool)

(assert (=> start!4240 tp_is_empty!1483))

(declare-fun b!32358 () Bool)

(declare-fun e!20564 () Bool)

(declare-fun mapRes!1756 () Bool)

(assert (=> b!32358 (= e!20562 (and e!20564 mapRes!1756))))

(declare-fun condMapEmpty!1756 () Bool)

(declare-fun mapDefault!1756 () ValueCell!542)

(assert (=> b!32358 (= condMapEmpty!1756 (= (arr!1035 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!542)) mapDefault!1756)))))

(declare-fun b!32359 () Bool)

(declare-fun res!19660 () Bool)

(assert (=> b!32359 (=> (not res!19660) (not e!20561))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!32359 (= res!19660 (and (= (size!1136 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1137 _keys!1833) (size!1136 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32360 () Bool)

(declare-fun e!20565 () Bool)

(assert (=> b!32360 (= e!20565 tp_is_empty!1483)))

(declare-fun b!32361 () Bool)

(declare-fun res!19663 () Bool)

(assert (=> b!32361 (=> (not res!19663) (not e!20561))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1803)

(declare-fun minValue!1443 () V!1803)

(declare-datatypes ((tuple2!1238 0))(
  ( (tuple2!1239 (_1!630 (_ BitVec 64)) (_2!630 V!1803)) )
))
(declare-datatypes ((List!834 0))(
  ( (Nil!831) (Cons!830 (h!1397 tuple2!1238) (t!3523 List!834)) )
))
(declare-datatypes ((ListLongMap!809 0))(
  ( (ListLongMap!810 (toList!420 List!834)) )
))
(declare-fun contains!363 (ListLongMap!809 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!245 (array!2167 array!2165 (_ BitVec 32) (_ BitVec 32) V!1803 V!1803 (_ BitVec 32) Int) ListLongMap!809)

(assert (=> b!32361 (= res!19663 (not (contains!363 (getCurrentListMap!245 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!32362 () Bool)

(declare-fun res!19664 () Bool)

(assert (=> b!32362 (=> (not res!19664) (not e!20561))))

(declare-datatypes ((List!835 0))(
  ( (Nil!832) (Cons!831 (h!1398 (_ BitVec 64)) (t!3524 List!835)) )
))
(declare-fun arrayNoDuplicates!0 (array!2167 (_ BitVec 32) List!835) Bool)

(assert (=> b!32362 (= res!19664 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!832))))

(declare-fun mapIsEmpty!1756 () Bool)

(assert (=> mapIsEmpty!1756 mapRes!1756))

(declare-fun b!32363 () Bool)

(assert (=> b!32363 (= e!20564 tp_is_empty!1483)))

(declare-fun b!32364 () Bool)

(declare-fun res!19658 () Bool)

(assert (=> b!32364 (=> (not res!19658) (not e!20561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2167 (_ BitVec 32)) Bool)

(assert (=> b!32364 (= res!19658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1756 () Bool)

(declare-fun tp!4810 () Bool)

(assert (=> mapNonEmpty!1756 (= mapRes!1756 (and tp!4810 e!20565))))

(declare-fun mapValue!1756 () ValueCell!542)

(declare-fun mapKey!1756 () (_ BitVec 32))

(declare-fun mapRest!1756 () (Array (_ BitVec 32) ValueCell!542))

(assert (=> mapNonEmpty!1756 (= (arr!1035 _values!1501) (store mapRest!1756 mapKey!1756 mapValue!1756))))

(declare-fun b!32365 () Bool)

(declare-fun e!20563 () Bool)

(assert (=> b!32365 (= e!20561 e!20563)))

(declare-fun res!19657 () Bool)

(assert (=> b!32365 (=> (not res!19657) (not e!20563))))

(declare-fun lt!11700 () (_ BitVec 32))

(assert (=> b!32365 (= res!19657 (and (bvsge lt!11700 #b00000000000000000000000000000000) (bvslt lt!11700 (size!1137 _keys!1833))))))

(declare-fun arrayScanForKey!0 (array!2167 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32365 (= lt!11700 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32366 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32366 (= e!20563 (not (validKeyInArray!0 (select (arr!1036 _keys!1833) lt!11700))))))

(declare-fun b!32367 () Bool)

(declare-fun res!19659 () Bool)

(assert (=> b!32367 (=> (not res!19659) (not e!20561))))

(declare-fun arrayContainsKey!0 (array!2167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32367 (= res!19659 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32368 () Bool)

(declare-fun res!19661 () Bool)

(assert (=> b!32368 (=> (not res!19661) (not e!20561))))

(assert (=> b!32368 (= res!19661 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4240 res!19662) b!32359))

(assert (= (and b!32359 res!19660) b!32364))

(assert (= (and b!32364 res!19658) b!32362))

(assert (= (and b!32362 res!19664) b!32368))

(assert (= (and b!32368 res!19661) b!32361))

(assert (= (and b!32361 res!19663) b!32367))

(assert (= (and b!32367 res!19659) b!32365))

(assert (= (and b!32365 res!19657) b!32366))

(assert (= (and b!32358 condMapEmpty!1756) mapIsEmpty!1756))

(assert (= (and b!32358 (not condMapEmpty!1756)) mapNonEmpty!1756))

(get-info :version)

(assert (= (and mapNonEmpty!1756 ((_ is ValueCellFull!542) mapValue!1756)) b!32360))

(assert (= (and b!32358 ((_ is ValueCellFull!542) mapDefault!1756)) b!32363))

(assert (= start!4240 b!32358))

(declare-fun m!25789 () Bool)

(assert (=> b!32366 m!25789))

(assert (=> b!32366 m!25789))

(declare-fun m!25791 () Bool)

(assert (=> b!32366 m!25791))

(declare-fun m!25793 () Bool)

(assert (=> b!32361 m!25793))

(assert (=> b!32361 m!25793))

(declare-fun m!25795 () Bool)

(assert (=> b!32361 m!25795))

(declare-fun m!25797 () Bool)

(assert (=> b!32362 m!25797))

(declare-fun m!25799 () Bool)

(assert (=> start!4240 m!25799))

(declare-fun m!25801 () Bool)

(assert (=> start!4240 m!25801))

(declare-fun m!25803 () Bool)

(assert (=> start!4240 m!25803))

(declare-fun m!25805 () Bool)

(assert (=> b!32365 m!25805))

(declare-fun m!25807 () Bool)

(assert (=> b!32364 m!25807))

(declare-fun m!25809 () Bool)

(assert (=> b!32367 m!25809))

(declare-fun m!25811 () Bool)

(assert (=> mapNonEmpty!1756 m!25811))

(declare-fun m!25813 () Bool)

(assert (=> b!32368 m!25813))

(check-sat (not mapNonEmpty!1756) (not start!4240) (not b!32362) (not b!32361) (not b!32365) (not b_next!1129) (not b!32364) (not b!32368) tp_is_empty!1483 (not b!32367) (not b!32366) b_and!1931)
(check-sat b_and!1931 (not b_next!1129))
(get-model)

(declare-fun d!5061 () Bool)

(declare-fun res!19717 () Bool)

(declare-fun e!20607 () Bool)

(assert (=> d!5061 (=> res!19717 e!20607)))

(assert (=> d!5061 (= res!19717 (= (select (arr!1036 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5061 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!20607)))

(declare-fun b!32439 () Bool)

(declare-fun e!20608 () Bool)

(assert (=> b!32439 (= e!20607 e!20608)))

(declare-fun res!19718 () Bool)

(assert (=> b!32439 (=> (not res!19718) (not e!20608))))

(assert (=> b!32439 (= res!19718 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1137 _keys!1833)))))

(declare-fun b!32440 () Bool)

(assert (=> b!32440 (= e!20608 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5061 (not res!19717)) b!32439))

(assert (= (and b!32439 res!19718) b!32440))

(declare-fun m!25867 () Bool)

(assert (=> d!5061 m!25867))

(declare-fun m!25869 () Bool)

(assert (=> b!32440 m!25869))

(assert (=> b!32367 d!5061))

(declare-fun d!5063 () Bool)

(assert (=> d!5063 (= (validKeyInArray!0 (select (arr!1036 _keys!1833) lt!11700)) (and (not (= (select (arr!1036 _keys!1833) lt!11700) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1036 _keys!1833) lt!11700) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32366 d!5063))

(declare-fun d!5065 () Bool)

(declare-fun res!19726 () Bool)

(declare-fun e!20617 () Bool)

(assert (=> d!5065 (=> res!19726 e!20617)))

(assert (=> d!5065 (= res!19726 (bvsge #b00000000000000000000000000000000 (size!1137 _keys!1833)))))

(assert (=> d!5065 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!832) e!20617)))

(declare-fun b!32451 () Bool)

(declare-fun e!20620 () Bool)

(assert (=> b!32451 (= e!20617 e!20620)))

(declare-fun res!19727 () Bool)

(assert (=> b!32451 (=> (not res!19727) (not e!20620))))

(declare-fun e!20618 () Bool)

(assert (=> b!32451 (= res!19727 (not e!20618))))

(declare-fun res!19725 () Bool)

(assert (=> b!32451 (=> (not res!19725) (not e!20618))))

(assert (=> b!32451 (= res!19725 (validKeyInArray!0 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32452 () Bool)

(declare-fun e!20619 () Bool)

(declare-fun call!2604 () Bool)

(assert (=> b!32452 (= e!20619 call!2604)))

(declare-fun b!32453 () Bool)

(declare-fun contains!365 (List!835 (_ BitVec 64)) Bool)

(assert (=> b!32453 (= e!20618 (contains!365 Nil!832 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32454 () Bool)

(assert (=> b!32454 (= e!20619 call!2604)))

(declare-fun bm!2601 () Bool)

(declare-fun c!3754 () Bool)

(assert (=> bm!2601 (= call!2604 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3754 (Cons!831 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000) Nil!832) Nil!832)))))

(declare-fun b!32455 () Bool)

(assert (=> b!32455 (= e!20620 e!20619)))

(assert (=> b!32455 (= c!3754 (validKeyInArray!0 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5065 (not res!19726)) b!32451))

(assert (= (and b!32451 res!19725) b!32453))

(assert (= (and b!32451 res!19727) b!32455))

(assert (= (and b!32455 c!3754) b!32454))

(assert (= (and b!32455 (not c!3754)) b!32452))

(assert (= (or b!32454 b!32452) bm!2601))

(assert (=> b!32451 m!25867))

(assert (=> b!32451 m!25867))

(declare-fun m!25871 () Bool)

(assert (=> b!32451 m!25871))

(assert (=> b!32453 m!25867))

(assert (=> b!32453 m!25867))

(declare-fun m!25873 () Bool)

(assert (=> b!32453 m!25873))

(assert (=> bm!2601 m!25867))

(declare-fun m!25875 () Bool)

(assert (=> bm!2601 m!25875))

(assert (=> b!32455 m!25867))

(assert (=> b!32455 m!25867))

(assert (=> b!32455 m!25871))

(assert (=> b!32362 d!5065))

(declare-fun d!5067 () Bool)

(assert (=> d!5067 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4240 d!5067))

(declare-fun d!5069 () Bool)

(assert (=> d!5069 (= (array_inv!711 _values!1501) (bvsge (size!1136 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4240 d!5069))

(declare-fun d!5071 () Bool)

(assert (=> d!5071 (= (array_inv!712 _keys!1833) (bvsge (size!1137 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4240 d!5071))

(declare-fun d!5073 () Bool)

(declare-fun lt!11709 () (_ BitVec 32))

(assert (=> d!5073 (and (or (bvslt lt!11709 #b00000000000000000000000000000000) (bvsge lt!11709 (size!1137 _keys!1833)) (and (bvsge lt!11709 #b00000000000000000000000000000000) (bvslt lt!11709 (size!1137 _keys!1833)))) (bvsge lt!11709 #b00000000000000000000000000000000) (bvslt lt!11709 (size!1137 _keys!1833)) (= (select (arr!1036 _keys!1833) lt!11709) k0!1304))))

(declare-fun e!20623 () (_ BitVec 32))

(assert (=> d!5073 (= lt!11709 e!20623)))

(declare-fun c!3757 () Bool)

(assert (=> d!5073 (= c!3757 (= (select (arr!1036 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5073 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1137 _keys!1833)) (bvslt (size!1137 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5073 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!11709)))

(declare-fun b!32460 () Bool)

(assert (=> b!32460 (= e!20623 #b00000000000000000000000000000000)))

(declare-fun b!32461 () Bool)

(assert (=> b!32461 (= e!20623 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5073 c!3757) b!32460))

(assert (= (and d!5073 (not c!3757)) b!32461))

(declare-fun m!25877 () Bool)

(assert (=> d!5073 m!25877))

(assert (=> d!5073 m!25867))

(declare-fun m!25879 () Bool)

(assert (=> b!32461 m!25879))

(assert (=> b!32365 d!5073))

(declare-fun d!5075 () Bool)

(declare-fun e!20629 () Bool)

(assert (=> d!5075 e!20629))

(declare-fun res!19730 () Bool)

(assert (=> d!5075 (=> res!19730 e!20629)))

(declare-fun lt!11718 () Bool)

(assert (=> d!5075 (= res!19730 (not lt!11718))))

(declare-fun lt!11720 () Bool)

(assert (=> d!5075 (= lt!11718 lt!11720)))

(declare-datatypes ((Unit!721 0))(
  ( (Unit!722) )
))
(declare-fun lt!11721 () Unit!721)

(declare-fun e!20628 () Unit!721)

(assert (=> d!5075 (= lt!11721 e!20628)))

(declare-fun c!3760 () Bool)

(assert (=> d!5075 (= c!3760 lt!11720)))

(declare-fun containsKey!30 (List!834 (_ BitVec 64)) Bool)

(assert (=> d!5075 (= lt!11720 (containsKey!30 (toList!420 (getCurrentListMap!245 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5075 (= (contains!363 (getCurrentListMap!245 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!11718)))

(declare-fun b!32468 () Bool)

(declare-fun lt!11719 () Unit!721)

(assert (=> b!32468 (= e!20628 lt!11719)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!27 (List!834 (_ BitVec 64)) Unit!721)

(assert (=> b!32468 (= lt!11719 (lemmaContainsKeyImpliesGetValueByKeyDefined!27 (toList!420 (getCurrentListMap!245 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!72 0))(
  ( (Some!71 (v!1861 V!1803)) (None!70) )
))
(declare-fun isDefined!28 (Option!72) Bool)

(declare-fun getValueByKey!66 (List!834 (_ BitVec 64)) Option!72)

(assert (=> b!32468 (isDefined!28 (getValueByKey!66 (toList!420 (getCurrentListMap!245 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!32469 () Bool)

(declare-fun Unit!723 () Unit!721)

(assert (=> b!32469 (= e!20628 Unit!723)))

(declare-fun b!32470 () Bool)

(assert (=> b!32470 (= e!20629 (isDefined!28 (getValueByKey!66 (toList!420 (getCurrentListMap!245 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5075 c!3760) b!32468))

(assert (= (and d!5075 (not c!3760)) b!32469))

(assert (= (and d!5075 (not res!19730)) b!32470))

(declare-fun m!25881 () Bool)

(assert (=> d!5075 m!25881))

(declare-fun m!25883 () Bool)

(assert (=> b!32468 m!25883))

(declare-fun m!25885 () Bool)

(assert (=> b!32468 m!25885))

(assert (=> b!32468 m!25885))

(declare-fun m!25887 () Bool)

(assert (=> b!32468 m!25887))

(assert (=> b!32470 m!25885))

(assert (=> b!32470 m!25885))

(assert (=> b!32470 m!25887))

(assert (=> b!32361 d!5075))

(declare-fun bm!2616 () Bool)

(declare-fun call!2619 () Bool)

(declare-fun lt!11778 () ListLongMap!809)

(assert (=> bm!2616 (= call!2619 (contains!363 lt!11778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!32513 () Bool)

(declare-fun e!20662 () Bool)

(assert (=> b!32513 (= e!20662 (validKeyInArray!0 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32514 () Bool)

(declare-fun res!19757 () Bool)

(declare-fun e!20656 () Bool)

(assert (=> b!32514 (=> (not res!19757) (not e!20656))))

(declare-fun e!20666 () Bool)

(assert (=> b!32514 (= res!19757 e!20666)))

(declare-fun c!3778 () Bool)

(assert (=> b!32514 (= c!3778 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!32515 () Bool)

(declare-fun res!19752 () Bool)

(assert (=> b!32515 (=> (not res!19752) (not e!20656))))

(declare-fun e!20659 () Bool)

(assert (=> b!32515 (= res!19752 e!20659)))

(declare-fun res!19749 () Bool)

(assert (=> b!32515 (=> res!19749 e!20659)))

(assert (=> b!32515 (= res!19749 (not e!20662))))

(declare-fun res!19754 () Bool)

(assert (=> b!32515 (=> (not res!19754) (not e!20662))))

(assert (=> b!32515 (= res!19754 (bvslt #b00000000000000000000000000000000 (size!1137 _keys!1833)))))

(declare-fun b!32516 () Bool)

(declare-fun e!20667 () Unit!721)

(declare-fun lt!11773 () Unit!721)

(assert (=> b!32516 (= e!20667 lt!11773)))

(declare-fun lt!11780 () ListLongMap!809)

(declare-fun getCurrentListMapNoExtraKeys!21 (array!2167 array!2165 (_ BitVec 32) (_ BitVec 32) V!1803 V!1803 (_ BitVec 32) Int) ListLongMap!809)

(assert (=> b!32516 (= lt!11780 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11771 () (_ BitVec 64))

(assert (=> b!32516 (= lt!11771 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11768 () (_ BitVec 64))

(assert (=> b!32516 (= lt!11768 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11777 () Unit!721)

(declare-fun addStillContains!19 (ListLongMap!809 (_ BitVec 64) V!1803 (_ BitVec 64)) Unit!721)

(assert (=> b!32516 (= lt!11777 (addStillContains!19 lt!11780 lt!11771 zeroValue!1443 lt!11768))))

(declare-fun +!51 (ListLongMap!809 tuple2!1238) ListLongMap!809)

(assert (=> b!32516 (contains!363 (+!51 lt!11780 (tuple2!1239 lt!11771 zeroValue!1443)) lt!11768)))

(declare-fun lt!11775 () Unit!721)

(assert (=> b!32516 (= lt!11775 lt!11777)))

(declare-fun lt!11784 () ListLongMap!809)

(assert (=> b!32516 (= lt!11784 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11769 () (_ BitVec 64))

(assert (=> b!32516 (= lt!11769 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11786 () (_ BitVec 64))

(assert (=> b!32516 (= lt!11786 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11774 () Unit!721)

(declare-fun addApplyDifferent!19 (ListLongMap!809 (_ BitVec 64) V!1803 (_ BitVec 64)) Unit!721)

(assert (=> b!32516 (= lt!11774 (addApplyDifferent!19 lt!11784 lt!11769 minValue!1443 lt!11786))))

(declare-fun apply!34 (ListLongMap!809 (_ BitVec 64)) V!1803)

(assert (=> b!32516 (= (apply!34 (+!51 lt!11784 (tuple2!1239 lt!11769 minValue!1443)) lt!11786) (apply!34 lt!11784 lt!11786))))

(declare-fun lt!11772 () Unit!721)

(assert (=> b!32516 (= lt!11772 lt!11774)))

(declare-fun lt!11779 () ListLongMap!809)

(assert (=> b!32516 (= lt!11779 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11781 () (_ BitVec 64))

(assert (=> b!32516 (= lt!11781 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11766 () (_ BitVec 64))

(assert (=> b!32516 (= lt!11766 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11776 () Unit!721)

(assert (=> b!32516 (= lt!11776 (addApplyDifferent!19 lt!11779 lt!11781 zeroValue!1443 lt!11766))))

(assert (=> b!32516 (= (apply!34 (+!51 lt!11779 (tuple2!1239 lt!11781 zeroValue!1443)) lt!11766) (apply!34 lt!11779 lt!11766))))

(declare-fun lt!11785 () Unit!721)

(assert (=> b!32516 (= lt!11785 lt!11776)))

(declare-fun lt!11770 () ListLongMap!809)

(assert (=> b!32516 (= lt!11770 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11787 () (_ BitVec 64))

(assert (=> b!32516 (= lt!11787 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11783 () (_ BitVec 64))

(assert (=> b!32516 (= lt!11783 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!32516 (= lt!11773 (addApplyDifferent!19 lt!11770 lt!11787 minValue!1443 lt!11783))))

(assert (=> b!32516 (= (apply!34 (+!51 lt!11770 (tuple2!1239 lt!11787 minValue!1443)) lt!11783) (apply!34 lt!11770 lt!11783))))

(declare-fun b!32517 () Bool)

(declare-fun e!20668 () Bool)

(assert (=> b!32517 (= e!20668 (= (apply!34 lt!11778 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!32518 () Bool)

(declare-fun e!20661 () Bool)

(declare-fun e!20665 () Bool)

(assert (=> b!32518 (= e!20661 e!20665)))

(declare-fun res!19756 () Bool)

(assert (=> b!32518 (= res!19756 call!2619)))

(assert (=> b!32518 (=> (not res!19756) (not e!20665))))

(declare-fun b!32519 () Bool)

(declare-fun e!20663 () ListLongMap!809)

(declare-fun call!2622 () ListLongMap!809)

(assert (=> b!32519 (= e!20663 call!2622)))

(declare-fun bm!2617 () Bool)

(declare-fun call!2624 () ListLongMap!809)

(declare-fun call!2623 () ListLongMap!809)

(assert (=> bm!2617 (= call!2624 call!2623)))

(declare-fun b!32520 () Bool)

(declare-fun Unit!724 () Unit!721)

(assert (=> b!32520 (= e!20667 Unit!724)))

(declare-fun bm!2618 () Bool)

(assert (=> bm!2618 (= call!2623 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32521 () Bool)

(assert (=> b!32521 (= e!20656 e!20661)))

(declare-fun c!3776 () Bool)

(assert (=> b!32521 (= c!3776 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!32522 () Bool)

(assert (=> b!32522 (= e!20666 e!20668)))

(declare-fun res!19751 () Bool)

(declare-fun call!2621 () Bool)

(assert (=> b!32522 (= res!19751 call!2621)))

(assert (=> b!32522 (=> (not res!19751) (not e!20668))))

(declare-fun b!32523 () Bool)

(declare-fun e!20658 () Bool)

(assert (=> b!32523 (= e!20659 e!20658)))

(declare-fun res!19750 () Bool)

(assert (=> b!32523 (=> (not res!19750) (not e!20658))))

(assert (=> b!32523 (= res!19750 (contains!363 lt!11778 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!32523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1137 _keys!1833)))))

(declare-fun bm!2619 () Bool)

(declare-fun c!3777 () Bool)

(declare-fun c!3774 () Bool)

(declare-fun call!2625 () ListLongMap!809)

(assert (=> bm!2619 (= call!2625 (+!51 (ite c!3774 call!2623 (ite c!3777 call!2624 call!2622)) (ite (or c!3774 c!3777) (tuple2!1239 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!32525 () Bool)

(declare-fun e!20657 () ListLongMap!809)

(declare-fun call!2620 () ListLongMap!809)

(assert (=> b!32525 (= e!20657 call!2620)))

(declare-fun b!32526 () Bool)

(assert (=> b!32526 (= e!20665 (= (apply!34 lt!11778 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun bm!2620 () Bool)

(assert (=> bm!2620 (= call!2622 call!2624)))

(declare-fun bm!2621 () Bool)

(assert (=> bm!2621 (= call!2621 (contains!363 lt!11778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!32527 () Bool)

(assert (=> b!32527 (= e!20666 (not call!2621))))

(declare-fun bm!2622 () Bool)

(assert (=> bm!2622 (= call!2620 call!2625)))

(declare-fun b!32528 () Bool)

(declare-fun e!20660 () ListLongMap!809)

(assert (=> b!32528 (= e!20660 (+!51 call!2625 (tuple2!1239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!32529 () Bool)

(assert (=> b!32529 (= e!20660 e!20657)))

(assert (=> b!32529 (= c!3777 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!32530 () Bool)

(declare-fun c!3775 () Bool)

(assert (=> b!32530 (= c!3775 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!32530 (= e!20657 e!20663)))

(declare-fun b!32531 () Bool)

(assert (=> b!32531 (= e!20661 (not call!2619))))

(declare-fun b!32532 () Bool)

(assert (=> b!32532 (= e!20663 call!2620)))

(declare-fun b!32533 () Bool)

(declare-fun e!20664 () Bool)

(assert (=> b!32533 (= e!20664 (validKeyInArray!0 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32524 () Bool)

(declare-fun get!553 (ValueCell!542 V!1803) V!1803)

(declare-fun dynLambda!147 (Int (_ BitVec 64)) V!1803)

(assert (=> b!32524 (= e!20658 (= (apply!34 lt!11778 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000)) (get!553 (select (arr!1035 _values!1501) #b00000000000000000000000000000000) (dynLambda!147 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32524 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1136 _values!1501)))))

(assert (=> b!32524 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1137 _keys!1833)))))

(declare-fun d!5077 () Bool)

(assert (=> d!5077 e!20656))

(declare-fun res!19755 () Bool)

(assert (=> d!5077 (=> (not res!19755) (not e!20656))))

(assert (=> d!5077 (= res!19755 (or (bvsge #b00000000000000000000000000000000 (size!1137 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1137 _keys!1833)))))))

(declare-fun lt!11782 () ListLongMap!809)

(assert (=> d!5077 (= lt!11778 lt!11782)))

(declare-fun lt!11767 () Unit!721)

(assert (=> d!5077 (= lt!11767 e!20667)))

(declare-fun c!3773 () Bool)

(assert (=> d!5077 (= c!3773 e!20664)))

(declare-fun res!19753 () Bool)

(assert (=> d!5077 (=> (not res!19753) (not e!20664))))

(assert (=> d!5077 (= res!19753 (bvslt #b00000000000000000000000000000000 (size!1137 _keys!1833)))))

(assert (=> d!5077 (= lt!11782 e!20660)))

(assert (=> d!5077 (= c!3774 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5077 (validMask!0 mask!2294)))

(assert (=> d!5077 (= (getCurrentListMap!245 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!11778)))

(assert (= (and d!5077 c!3774) b!32528))

(assert (= (and d!5077 (not c!3774)) b!32529))

(assert (= (and b!32529 c!3777) b!32525))

(assert (= (and b!32529 (not c!3777)) b!32530))

(assert (= (and b!32530 c!3775) b!32532))

(assert (= (and b!32530 (not c!3775)) b!32519))

(assert (= (or b!32532 b!32519) bm!2620))

(assert (= (or b!32525 bm!2620) bm!2617))

(assert (= (or b!32525 b!32532) bm!2622))

(assert (= (or b!32528 bm!2617) bm!2618))

(assert (= (or b!32528 bm!2622) bm!2619))

(assert (= (and d!5077 res!19753) b!32533))

(assert (= (and d!5077 c!3773) b!32516))

(assert (= (and d!5077 (not c!3773)) b!32520))

(assert (= (and d!5077 res!19755) b!32515))

(assert (= (and b!32515 res!19754) b!32513))

(assert (= (and b!32515 (not res!19749)) b!32523))

(assert (= (and b!32523 res!19750) b!32524))

(assert (= (and b!32515 res!19752) b!32514))

(assert (= (and b!32514 c!3778) b!32522))

(assert (= (and b!32514 (not c!3778)) b!32527))

(assert (= (and b!32522 res!19751) b!32517))

(assert (= (or b!32522 b!32527) bm!2621))

(assert (= (and b!32514 res!19757) b!32521))

(assert (= (and b!32521 c!3776) b!32518))

(assert (= (and b!32521 (not c!3776)) b!32531))

(assert (= (and b!32518 res!19756) b!32526))

(assert (= (or b!32518 b!32531) bm!2616))

(declare-fun b_lambda!1683 () Bool)

(assert (=> (not b_lambda!1683) (not b!32524)))

(declare-fun t!3528 () Bool)

(declare-fun tb!677 () Bool)

(assert (=> (and start!4240 (= defaultEntry!1504 defaultEntry!1504) t!3528) tb!677))

(declare-fun result!1153 () Bool)

(assert (=> tb!677 (= result!1153 tp_is_empty!1483)))

(assert (=> b!32524 t!3528))

(declare-fun b_and!1937 () Bool)

(assert (= b_and!1931 (and (=> t!3528 result!1153) b_and!1937)))

(declare-fun m!25889 () Bool)

(assert (=> b!32516 m!25889))

(declare-fun m!25891 () Bool)

(assert (=> b!32516 m!25891))

(assert (=> b!32516 m!25889))

(assert (=> b!32516 m!25867))

(declare-fun m!25893 () Bool)

(assert (=> b!32516 m!25893))

(declare-fun m!25895 () Bool)

(assert (=> b!32516 m!25895))

(declare-fun m!25897 () Bool)

(assert (=> b!32516 m!25897))

(declare-fun m!25899 () Bool)

(assert (=> b!32516 m!25899))

(declare-fun m!25901 () Bool)

(assert (=> b!32516 m!25901))

(assert (=> b!32516 m!25893))

(declare-fun m!25903 () Bool)

(assert (=> b!32516 m!25903))

(declare-fun m!25905 () Bool)

(assert (=> b!32516 m!25905))

(declare-fun m!25907 () Bool)

(assert (=> b!32516 m!25907))

(declare-fun m!25909 () Bool)

(assert (=> b!32516 m!25909))

(declare-fun m!25911 () Bool)

(assert (=> b!32516 m!25911))

(declare-fun m!25913 () Bool)

(assert (=> b!32516 m!25913))

(declare-fun m!25915 () Bool)

(assert (=> b!32516 m!25915))

(assert (=> b!32516 m!25913))

(declare-fun m!25917 () Bool)

(assert (=> b!32516 m!25917))

(declare-fun m!25919 () Bool)

(assert (=> b!32516 m!25919))

(assert (=> b!32516 m!25909))

(declare-fun m!25921 () Bool)

(assert (=> b!32528 m!25921))

(assert (=> b!32524 m!25867))

(declare-fun m!25923 () Bool)

(assert (=> b!32524 m!25923))

(assert (=> b!32524 m!25867))

(declare-fun m!25925 () Bool)

(assert (=> b!32524 m!25925))

(declare-fun m!25927 () Bool)

(assert (=> b!32524 m!25927))

(declare-fun m!25929 () Bool)

(assert (=> b!32524 m!25929))

(assert (=> b!32524 m!25925))

(assert (=> b!32524 m!25927))

(assert (=> d!5077 m!25799))

(assert (=> b!32523 m!25867))

(assert (=> b!32523 m!25867))

(declare-fun m!25931 () Bool)

(assert (=> b!32523 m!25931))

(declare-fun m!25933 () Bool)

(assert (=> bm!2619 m!25933))

(declare-fun m!25935 () Bool)

(assert (=> bm!2621 m!25935))

(assert (=> b!32513 m!25867))

(assert (=> b!32513 m!25867))

(assert (=> b!32513 m!25871))

(declare-fun m!25937 () Bool)

(assert (=> bm!2616 m!25937))

(assert (=> bm!2618 m!25901))

(assert (=> b!32533 m!25867))

(assert (=> b!32533 m!25867))

(assert (=> b!32533 m!25871))

(declare-fun m!25939 () Bool)

(assert (=> b!32517 m!25939))

(declare-fun m!25941 () Bool)

(assert (=> b!32526 m!25941))

(assert (=> b!32361 d!5077))

(declare-fun d!5079 () Bool)

(assert (=> d!5079 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32368 d!5079))

(declare-fun b!32544 () Bool)

(declare-fun e!20677 () Bool)

(declare-fun e!20676 () Bool)

(assert (=> b!32544 (= e!20677 e!20676)))

(declare-fun c!3781 () Bool)

(assert (=> b!32544 (= c!3781 (validKeyInArray!0 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5081 () Bool)

(declare-fun res!19762 () Bool)

(assert (=> d!5081 (=> res!19762 e!20677)))

(assert (=> d!5081 (= res!19762 (bvsge #b00000000000000000000000000000000 (size!1137 _keys!1833)))))

(assert (=> d!5081 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!20677)))

(declare-fun b!32545 () Bool)

(declare-fun call!2628 () Bool)

(assert (=> b!32545 (= e!20676 call!2628)))

(declare-fun bm!2625 () Bool)

(assert (=> bm!2625 (= call!2628 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!32546 () Bool)

(declare-fun e!20675 () Bool)

(assert (=> b!32546 (= e!20676 e!20675)))

(declare-fun lt!11796 () (_ BitVec 64))

(assert (=> b!32546 (= lt!11796 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11795 () Unit!721)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2167 (_ BitVec 64) (_ BitVec 32)) Unit!721)

(assert (=> b!32546 (= lt!11795 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!11796 #b00000000000000000000000000000000))))

(assert (=> b!32546 (arrayContainsKey!0 _keys!1833 lt!11796 #b00000000000000000000000000000000)))

(declare-fun lt!11794 () Unit!721)

(assert (=> b!32546 (= lt!11794 lt!11795)))

(declare-fun res!19763 () Bool)

(declare-datatypes ((SeekEntryResult!121 0))(
  ( (MissingZero!121 (index!2606 (_ BitVec 32))) (Found!121 (index!2607 (_ BitVec 32))) (Intermediate!121 (undefined!933 Bool) (index!2608 (_ BitVec 32)) (x!6739 (_ BitVec 32))) (Undefined!121) (MissingVacant!121 (index!2609 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2167 (_ BitVec 32)) SeekEntryResult!121)

(assert (=> b!32546 (= res!19763 (= (seekEntryOrOpen!0 (select (arr!1036 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!121 #b00000000000000000000000000000000)))))

(assert (=> b!32546 (=> (not res!19763) (not e!20675))))

(declare-fun b!32547 () Bool)

(assert (=> b!32547 (= e!20675 call!2628)))

(assert (= (and d!5081 (not res!19762)) b!32544))

(assert (= (and b!32544 c!3781) b!32546))

(assert (= (and b!32544 (not c!3781)) b!32545))

(assert (= (and b!32546 res!19763) b!32547))

(assert (= (or b!32547 b!32545) bm!2625))

(assert (=> b!32544 m!25867))

(assert (=> b!32544 m!25867))

(assert (=> b!32544 m!25871))

(declare-fun m!25943 () Bool)

(assert (=> bm!2625 m!25943))

(assert (=> b!32546 m!25867))

(declare-fun m!25945 () Bool)

(assert (=> b!32546 m!25945))

(declare-fun m!25947 () Bool)

(assert (=> b!32546 m!25947))

(assert (=> b!32546 m!25867))

(declare-fun m!25949 () Bool)

(assert (=> b!32546 m!25949))

(assert (=> b!32364 d!5081))

(declare-fun b!32554 () Bool)

(declare-fun e!20683 () Bool)

(assert (=> b!32554 (= e!20683 tp_is_empty!1483)))

(declare-fun b!32555 () Bool)

(declare-fun e!20682 () Bool)

(assert (=> b!32555 (= e!20682 tp_is_empty!1483)))

(declare-fun mapIsEmpty!1765 () Bool)

(declare-fun mapRes!1765 () Bool)

(assert (=> mapIsEmpty!1765 mapRes!1765))

(declare-fun condMapEmpty!1765 () Bool)

(declare-fun mapDefault!1765 () ValueCell!542)

(assert (=> mapNonEmpty!1756 (= condMapEmpty!1765 (= mapRest!1756 ((as const (Array (_ BitVec 32) ValueCell!542)) mapDefault!1765)))))

(assert (=> mapNonEmpty!1756 (= tp!4810 (and e!20682 mapRes!1765))))

(declare-fun mapNonEmpty!1765 () Bool)

(declare-fun tp!4825 () Bool)

(assert (=> mapNonEmpty!1765 (= mapRes!1765 (and tp!4825 e!20683))))

(declare-fun mapKey!1765 () (_ BitVec 32))

(declare-fun mapRest!1765 () (Array (_ BitVec 32) ValueCell!542))

(declare-fun mapValue!1765 () ValueCell!542)

(assert (=> mapNonEmpty!1765 (= mapRest!1756 (store mapRest!1765 mapKey!1765 mapValue!1765))))

(assert (= (and mapNonEmpty!1756 condMapEmpty!1765) mapIsEmpty!1765))

(assert (= (and mapNonEmpty!1756 (not condMapEmpty!1765)) mapNonEmpty!1765))

(assert (= (and mapNonEmpty!1765 ((_ is ValueCellFull!542) mapValue!1765)) b!32554))

(assert (= (and mapNonEmpty!1756 ((_ is ValueCellFull!542) mapDefault!1765)) b!32555))

(declare-fun m!25951 () Bool)

(assert (=> mapNonEmpty!1765 m!25951))

(declare-fun b_lambda!1685 () Bool)

(assert (= b_lambda!1683 (or (and start!4240 b_free!1129) b_lambda!1685)))

(check-sat b_and!1937 (not b!32517) (not b!32453) (not mapNonEmpty!1765) (not b!32533) (not d!5075) (not b_lambda!1685) (not bm!2619) (not b!32544) (not bm!2625) (not b!32513) (not b!32461) (not bm!2618) (not d!5077) (not b!32546) (not bm!2601) (not b!32526) (not b!32528) (not bm!2616) (not b!32524) tp_is_empty!1483 (not b!32455) (not b!32468) (not b!32470) (not bm!2621) (not b_next!1129) (not b!32440) (not b!32516) (not b!32451) (not b!32523))
(check-sat b_and!1937 (not b_next!1129))
