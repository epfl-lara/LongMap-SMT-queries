; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4234 () Bool)

(assert start!4234)

(declare-fun b_free!1129 () Bool)

(declare-fun b_next!1129 () Bool)

(assert (=> start!4234 (= b_free!1129 (not b_next!1129))))

(declare-fun tp!4810 () Bool)

(declare-fun b_and!1935 () Bool)

(assert (=> start!4234 (= tp!4810 b_and!1935)))

(declare-fun b!32376 () Bool)

(declare-fun res!19669 () Bool)

(declare-fun e!20573 () Bool)

(assert (=> b!32376 (=> (not res!19669) (not e!20573))))

(declare-datatypes ((array!2151 0))(
  ( (array!2152 (arr!1028 (Array (_ BitVec 32) (_ BitVec 64))) (size!1129 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2151)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2151 (_ BitVec 32)) Bool)

(assert (=> b!32376 (= res!19669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32377 () Bool)

(declare-fun e!20570 () Bool)

(declare-fun lt!11740 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32377 (= e!20570 (not (validKeyInArray!0 (select (arr!1028 _keys!1833) lt!11740))))))

(declare-fun b!32379 () Bool)

(declare-fun res!19668 () Bool)

(assert (=> b!32379 (=> (not res!19668) (not e!20573))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32379 (= res!19668 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1756 () Bool)

(declare-fun mapRes!1756 () Bool)

(assert (=> mapIsEmpty!1756 mapRes!1756))

(declare-fun b!32380 () Bool)

(declare-fun res!19670 () Bool)

(assert (=> b!32380 (=> (not res!19670) (not e!20573))))

(declare-datatypes ((List!832 0))(
  ( (Nil!829) (Cons!828 (h!1395 (_ BitVec 64)) (t!3520 List!832)) )
))
(declare-fun arrayNoDuplicates!0 (array!2151 (_ BitVec 32) List!832) Bool)

(assert (=> b!32380 (= res!19670 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!829))))

(declare-fun b!32381 () Bool)

(declare-fun res!19672 () Bool)

(assert (=> b!32381 (=> (not res!19672) (not e!20573))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1803 0))(
  ( (V!1804 (val!768 Int)) )
))
(declare-datatypes ((ValueCell!542 0))(
  ( (ValueCellFull!542 (v!1857 V!1803)) (EmptyCell!542) )
))
(declare-datatypes ((array!2153 0))(
  ( (array!2154 (arr!1029 (Array (_ BitVec 32) ValueCell!542)) (size!1130 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2153)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1803)

(declare-fun minValue!1443 () V!1803)

(declare-datatypes ((tuple2!1250 0))(
  ( (tuple2!1251 (_1!636 (_ BitVec 64)) (_2!636 V!1803)) )
))
(declare-datatypes ((List!833 0))(
  ( (Nil!830) (Cons!829 (h!1396 tuple2!1250) (t!3521 List!833)) )
))
(declare-datatypes ((ListLongMap!815 0))(
  ( (ListLongMap!816 (toList!423 List!833)) )
))
(declare-fun contains!365 (ListLongMap!815 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!246 (array!2151 array!2153 (_ BitVec 32) (_ BitVec 32) V!1803 V!1803 (_ BitVec 32) Int) ListLongMap!815)

(assert (=> b!32381 (= res!19672 (not (contains!365 (getCurrentListMap!246 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!32382 () Bool)

(assert (=> b!32382 (= e!20573 e!20570)))

(declare-fun res!19667 () Bool)

(assert (=> b!32382 (=> (not res!19667) (not e!20570))))

(assert (=> b!32382 (= res!19667 (and (bvsge lt!11740 #b00000000000000000000000000000000) (bvslt lt!11740 (size!1129 _keys!1833))))))

(declare-fun arrayScanForKey!0 (array!2151 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32382 (= lt!11740 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32383 () Bool)

(declare-fun e!20571 () Bool)

(declare-fun tp_is_empty!1483 () Bool)

(assert (=> b!32383 (= e!20571 tp_is_empty!1483)))

(declare-fun res!19665 () Bool)

(assert (=> start!4234 (=> (not res!19665) (not e!20573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4234 (= res!19665 (validMask!0 mask!2294))))

(assert (=> start!4234 e!20573))

(assert (=> start!4234 true))

(assert (=> start!4234 tp!4810))

(declare-fun e!20575 () Bool)

(declare-fun array_inv!723 (array!2153) Bool)

(assert (=> start!4234 (and (array_inv!723 _values!1501) e!20575)))

(declare-fun array_inv!724 (array!2151) Bool)

(assert (=> start!4234 (array_inv!724 _keys!1833)))

(assert (=> start!4234 tp_is_empty!1483))

(declare-fun b!32378 () Bool)

(declare-fun e!20574 () Bool)

(assert (=> b!32378 (= e!20574 tp_is_empty!1483)))

(declare-fun mapNonEmpty!1756 () Bool)

(declare-fun tp!4809 () Bool)

(assert (=> mapNonEmpty!1756 (= mapRes!1756 (and tp!4809 e!20574))))

(declare-fun mapRest!1756 () (Array (_ BitVec 32) ValueCell!542))

(declare-fun mapValue!1756 () ValueCell!542)

(declare-fun mapKey!1756 () (_ BitVec 32))

(assert (=> mapNonEmpty!1756 (= (arr!1029 _values!1501) (store mapRest!1756 mapKey!1756 mapValue!1756))))

(declare-fun b!32384 () Bool)

(declare-fun res!19666 () Bool)

(assert (=> b!32384 (=> (not res!19666) (not e!20573))))

(assert (=> b!32384 (= res!19666 (and (= (size!1130 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1129 _keys!1833) (size!1130 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32385 () Bool)

(declare-fun res!19671 () Bool)

(assert (=> b!32385 (=> (not res!19671) (not e!20573))))

(assert (=> b!32385 (= res!19671 (validKeyInArray!0 k0!1304))))

(declare-fun b!32386 () Bool)

(assert (=> b!32386 (= e!20575 (and e!20571 mapRes!1756))))

(declare-fun condMapEmpty!1756 () Bool)

(declare-fun mapDefault!1756 () ValueCell!542)

(assert (=> b!32386 (= condMapEmpty!1756 (= (arr!1029 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!542)) mapDefault!1756)))))

(assert (= (and start!4234 res!19665) b!32384))

(assert (= (and b!32384 res!19666) b!32376))

(assert (= (and b!32376 res!19669) b!32380))

(assert (= (and b!32380 res!19670) b!32385))

(assert (= (and b!32385 res!19671) b!32381))

(assert (= (and b!32381 res!19672) b!32379))

(assert (= (and b!32379 res!19668) b!32382))

(assert (= (and b!32382 res!19667) b!32377))

(assert (= (and b!32386 condMapEmpty!1756) mapIsEmpty!1756))

(assert (= (and b!32386 (not condMapEmpty!1756)) mapNonEmpty!1756))

(get-info :version)

(assert (= (and mapNonEmpty!1756 ((_ is ValueCellFull!542) mapValue!1756)) b!32378))

(assert (= (and b!32386 ((_ is ValueCellFull!542) mapDefault!1756)) b!32383))

(assert (= start!4234 b!32386))

(declare-fun m!25871 () Bool)

(assert (=> b!32376 m!25871))

(declare-fun m!25873 () Bool)

(assert (=> b!32382 m!25873))

(declare-fun m!25875 () Bool)

(assert (=> b!32385 m!25875))

(declare-fun m!25877 () Bool)

(assert (=> b!32379 m!25877))

(declare-fun m!25879 () Bool)

(assert (=> start!4234 m!25879))

(declare-fun m!25881 () Bool)

(assert (=> start!4234 m!25881))

(declare-fun m!25883 () Bool)

(assert (=> start!4234 m!25883))

(declare-fun m!25885 () Bool)

(assert (=> b!32381 m!25885))

(assert (=> b!32381 m!25885))

(declare-fun m!25887 () Bool)

(assert (=> b!32381 m!25887))

(declare-fun m!25889 () Bool)

(assert (=> mapNonEmpty!1756 m!25889))

(declare-fun m!25891 () Bool)

(assert (=> b!32380 m!25891))

(declare-fun m!25893 () Bool)

(assert (=> b!32377 m!25893))

(assert (=> b!32377 m!25893))

(declare-fun m!25895 () Bool)

(assert (=> b!32377 m!25895))

(check-sat (not b!32381) (not b!32379) (not b!32380) (not b_next!1129) (not b!32382) b_and!1935 (not mapNonEmpty!1756) (not start!4234) tp_is_empty!1483 (not b!32385) (not b!32376) (not b!32377))
(check-sat b_and!1935 (not b_next!1129))
(get-model)

(declare-fun d!5059 () Bool)

(declare-fun res!19725 () Bool)

(declare-fun e!20616 () Bool)

(assert (=> d!5059 (=> res!19725 e!20616)))

(assert (=> d!5059 (= res!19725 (= (select (arr!1028 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5059 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!20616)))

(declare-fun b!32457 () Bool)

(declare-fun e!20617 () Bool)

(assert (=> b!32457 (= e!20616 e!20617)))

(declare-fun res!19726 () Bool)

(assert (=> b!32457 (=> (not res!19726) (not e!20617))))

(assert (=> b!32457 (= res!19726 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1129 _keys!1833)))))

(declare-fun b!32458 () Bool)

(assert (=> b!32458 (= e!20617 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5059 (not res!19725)) b!32457))

(assert (= (and b!32457 res!19726) b!32458))

(declare-fun m!25949 () Bool)

(assert (=> d!5059 m!25949))

(declare-fun m!25951 () Bool)

(assert (=> b!32458 m!25951))

(assert (=> b!32379 d!5059))

(declare-fun d!5061 () Bool)

(assert (=> d!5061 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4234 d!5061))

(declare-fun d!5063 () Bool)

(assert (=> d!5063 (= (array_inv!723 _values!1501) (bvsge (size!1130 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4234 d!5063))

(declare-fun d!5065 () Bool)

(assert (=> d!5065 (= (array_inv!724 _keys!1833) (bvsge (size!1129 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4234 d!5065))

(declare-fun d!5067 () Bool)

(declare-fun lt!11749 () (_ BitVec 32))

(assert (=> d!5067 (and (or (bvslt lt!11749 #b00000000000000000000000000000000) (bvsge lt!11749 (size!1129 _keys!1833)) (and (bvsge lt!11749 #b00000000000000000000000000000000) (bvslt lt!11749 (size!1129 _keys!1833)))) (bvsge lt!11749 #b00000000000000000000000000000000) (bvslt lt!11749 (size!1129 _keys!1833)) (= (select (arr!1028 _keys!1833) lt!11749) k0!1304))))

(declare-fun e!20620 () (_ BitVec 32))

(assert (=> d!5067 (= lt!11749 e!20620)))

(declare-fun c!3759 () Bool)

(assert (=> d!5067 (= c!3759 (= (select (arr!1028 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1129 _keys!1833)) (bvslt (size!1129 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5067 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!11749)))

(declare-fun b!32463 () Bool)

(assert (=> b!32463 (= e!20620 #b00000000000000000000000000000000)))

(declare-fun b!32464 () Bool)

(assert (=> b!32464 (= e!20620 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5067 c!3759) b!32463))

(assert (= (and d!5067 (not c!3759)) b!32464))

(declare-fun m!25953 () Bool)

(assert (=> d!5067 m!25953))

(assert (=> d!5067 m!25949))

(declare-fun m!25955 () Bool)

(assert (=> b!32464 m!25955))

(assert (=> b!32382 d!5067))

(declare-fun d!5069 () Bool)

(assert (=> d!5069 (= (validKeyInArray!0 (select (arr!1028 _keys!1833) lt!11740)) (and (not (= (select (arr!1028 _keys!1833) lt!11740) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1028 _keys!1833) lt!11740) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32377 d!5069))

(declare-fun d!5071 () Bool)

(assert (=> d!5071 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32385 d!5071))

(declare-fun d!5073 () Bool)

(declare-fun e!20626 () Bool)

(assert (=> d!5073 e!20626))

(declare-fun res!19729 () Bool)

(assert (=> d!5073 (=> res!19729 e!20626)))

(declare-fun lt!11759 () Bool)

(assert (=> d!5073 (= res!19729 (not lt!11759))))

(declare-fun lt!11760 () Bool)

(assert (=> d!5073 (= lt!11759 lt!11760)))

(declare-datatypes ((Unit!710 0))(
  ( (Unit!711) )
))
(declare-fun lt!11758 () Unit!710)

(declare-fun e!20625 () Unit!710)

(assert (=> d!5073 (= lt!11758 e!20625)))

(declare-fun c!3762 () Bool)

(assert (=> d!5073 (= c!3762 lt!11760)))

(declare-fun containsKey!29 (List!833 (_ BitVec 64)) Bool)

(assert (=> d!5073 (= lt!11760 (containsKey!29 (toList!423 (getCurrentListMap!246 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5073 (= (contains!365 (getCurrentListMap!246 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!11759)))

(declare-fun b!32471 () Bool)

(declare-fun lt!11761 () Unit!710)

(assert (=> b!32471 (= e!20625 lt!11761)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!26 (List!833 (_ BitVec 64)) Unit!710)

(assert (=> b!32471 (= lt!11761 (lemmaContainsKeyImpliesGetValueByKeyDefined!26 (toList!423 (getCurrentListMap!246 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!71 0))(
  ( (Some!70 (v!1860 V!1803)) (None!69) )
))
(declare-fun isDefined!27 (Option!71) Bool)

(declare-fun getValueByKey!65 (List!833 (_ BitVec 64)) Option!71)

(assert (=> b!32471 (isDefined!27 (getValueByKey!65 (toList!423 (getCurrentListMap!246 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!32472 () Bool)

(declare-fun Unit!712 () Unit!710)

(assert (=> b!32472 (= e!20625 Unit!712)))

(declare-fun b!32473 () Bool)

(assert (=> b!32473 (= e!20626 (isDefined!27 (getValueByKey!65 (toList!423 (getCurrentListMap!246 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5073 c!3762) b!32471))

(assert (= (and d!5073 (not c!3762)) b!32472))

(assert (= (and d!5073 (not res!19729)) b!32473))

(declare-fun m!25957 () Bool)

(assert (=> d!5073 m!25957))

(declare-fun m!25959 () Bool)

(assert (=> b!32471 m!25959))

(declare-fun m!25961 () Bool)

(assert (=> b!32471 m!25961))

(assert (=> b!32471 m!25961))

(declare-fun m!25963 () Bool)

(assert (=> b!32471 m!25963))

(assert (=> b!32473 m!25961))

(assert (=> b!32473 m!25961))

(assert (=> b!32473 m!25963))

(assert (=> b!32381 d!5073))

(declare-fun d!5075 () Bool)

(declare-fun e!20658 () Bool)

(assert (=> d!5075 e!20658))

(declare-fun res!19753 () Bool)

(assert (=> d!5075 (=> (not res!19753) (not e!20658))))

(assert (=> d!5075 (= res!19753 (or (bvsge #b00000000000000000000000000000000 (size!1129 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1129 _keys!1833)))))))

(declare-fun lt!11813 () ListLongMap!815)

(declare-fun lt!11820 () ListLongMap!815)

(assert (=> d!5075 (= lt!11813 lt!11820)))

(declare-fun lt!11825 () Unit!710)

(declare-fun e!20665 () Unit!710)

(assert (=> d!5075 (= lt!11825 e!20665)))

(declare-fun c!3780 () Bool)

(declare-fun e!20654 () Bool)

(assert (=> d!5075 (= c!3780 e!20654)))

(declare-fun res!19750 () Bool)

(assert (=> d!5075 (=> (not res!19750) (not e!20654))))

(assert (=> d!5075 (= res!19750 (bvslt #b00000000000000000000000000000000 (size!1129 _keys!1833)))))

(declare-fun e!20662 () ListLongMap!815)

(assert (=> d!5075 (= lt!11820 e!20662)))

(declare-fun c!3778 () Bool)

(assert (=> d!5075 (= c!3778 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5075 (validMask!0 mask!2294)))

(assert (=> d!5075 (= (getCurrentListMap!246 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!11813)))

(declare-fun b!32516 () Bool)

(declare-fun e!20653 () Bool)

(declare-fun call!2632 () Bool)

(assert (=> b!32516 (= e!20653 (not call!2632))))

(declare-fun bm!2627 () Bool)

(assert (=> bm!2627 (= call!2632 (contains!365 lt!11813 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!32517 () Bool)

(declare-fun res!19756 () Bool)

(assert (=> b!32517 (=> (not res!19756) (not e!20658))))

(assert (=> b!32517 (= res!19756 e!20653)))

(declare-fun c!3775 () Bool)

(assert (=> b!32517 (= c!3775 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!32518 () Bool)

(declare-fun lt!11811 () Unit!710)

(assert (=> b!32518 (= e!20665 lt!11811)))

(declare-fun lt!11824 () ListLongMap!815)

(declare-fun getCurrentListMapNoExtraKeys!21 (array!2151 array!2153 (_ BitVec 32) (_ BitVec 32) V!1803 V!1803 (_ BitVec 32) Int) ListLongMap!815)

(assert (=> b!32518 (= lt!11824 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11810 () (_ BitVec 64))

(assert (=> b!32518 (= lt!11810 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11812 () (_ BitVec 64))

(assert (=> b!32518 (= lt!11812 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11826 () Unit!710)

(declare-fun addStillContains!19 (ListLongMap!815 (_ BitVec 64) V!1803 (_ BitVec 64)) Unit!710)

(assert (=> b!32518 (= lt!11826 (addStillContains!19 lt!11824 lt!11810 zeroValue!1443 lt!11812))))

(declare-fun +!52 (ListLongMap!815 tuple2!1250) ListLongMap!815)

(assert (=> b!32518 (contains!365 (+!52 lt!11824 (tuple2!1251 lt!11810 zeroValue!1443)) lt!11812)))

(declare-fun lt!11806 () Unit!710)

(assert (=> b!32518 (= lt!11806 lt!11826)))

(declare-fun lt!11822 () ListLongMap!815)

(assert (=> b!32518 (= lt!11822 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11821 () (_ BitVec 64))

(assert (=> b!32518 (= lt!11821 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11827 () (_ BitVec 64))

(assert (=> b!32518 (= lt!11827 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11809 () Unit!710)

(declare-fun addApplyDifferent!19 (ListLongMap!815 (_ BitVec 64) V!1803 (_ BitVec 64)) Unit!710)

(assert (=> b!32518 (= lt!11809 (addApplyDifferent!19 lt!11822 lt!11821 minValue!1443 lt!11827))))

(declare-fun apply!34 (ListLongMap!815 (_ BitVec 64)) V!1803)

(assert (=> b!32518 (= (apply!34 (+!52 lt!11822 (tuple2!1251 lt!11821 minValue!1443)) lt!11827) (apply!34 lt!11822 lt!11827))))

(declare-fun lt!11808 () Unit!710)

(assert (=> b!32518 (= lt!11808 lt!11809)))

(declare-fun lt!11815 () ListLongMap!815)

(assert (=> b!32518 (= lt!11815 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11814 () (_ BitVec 64))

(assert (=> b!32518 (= lt!11814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11818 () (_ BitVec 64))

(assert (=> b!32518 (= lt!11818 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11817 () Unit!710)

(assert (=> b!32518 (= lt!11817 (addApplyDifferent!19 lt!11815 lt!11814 zeroValue!1443 lt!11818))))

(assert (=> b!32518 (= (apply!34 (+!52 lt!11815 (tuple2!1251 lt!11814 zeroValue!1443)) lt!11818) (apply!34 lt!11815 lt!11818))))

(declare-fun lt!11823 () Unit!710)

(assert (=> b!32518 (= lt!11823 lt!11817)))

(declare-fun lt!11816 () ListLongMap!815)

(assert (=> b!32518 (= lt!11816 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!11807 () (_ BitVec 64))

(assert (=> b!32518 (= lt!11807 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!11819 () (_ BitVec 64))

(assert (=> b!32518 (= lt!11819 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!32518 (= lt!11811 (addApplyDifferent!19 lt!11816 lt!11807 minValue!1443 lt!11819))))

(assert (=> b!32518 (= (apply!34 (+!52 lt!11816 (tuple2!1251 lt!11807 minValue!1443)) lt!11819) (apply!34 lt!11816 lt!11819))))

(declare-fun b!32519 () Bool)

(declare-fun e!20664 () Bool)

(declare-fun call!2631 () Bool)

(assert (=> b!32519 (= e!20664 (not call!2631))))

(declare-fun b!32520 () Bool)

(declare-fun e!20661 () Bool)

(assert (=> b!32520 (= e!20661 (= (apply!34 lt!11813 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun bm!2628 () Bool)

(declare-fun call!2636 () ListLongMap!815)

(declare-fun call!2634 () ListLongMap!815)

(assert (=> bm!2628 (= call!2636 call!2634)))

(declare-fun b!32521 () Bool)

(declare-fun e!20659 () Bool)

(assert (=> b!32521 (= e!20664 e!20659)))

(declare-fun res!19755 () Bool)

(assert (=> b!32521 (= res!19755 call!2631)))

(assert (=> b!32521 (=> (not res!19755) (not e!20659))))

(declare-fun b!32522 () Bool)

(assert (=> b!32522 (= e!20662 (+!52 call!2634 (tuple2!1251 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!32523 () Bool)

(declare-fun e!20655 () ListLongMap!815)

(assert (=> b!32523 (= e!20655 call!2636)))

(declare-fun b!32524 () Bool)

(assert (=> b!32524 (= e!20654 (validKeyInArray!0 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32525 () Bool)

(declare-fun c!3777 () Bool)

(assert (=> b!32525 (= c!3777 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!20663 () ListLongMap!815)

(assert (=> b!32525 (= e!20655 e!20663)))

(declare-fun bm!2629 () Bool)

(assert (=> bm!2629 (= call!2631 (contains!365 lt!11813 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!2630 () Bool)

(declare-fun call!2630 () ListLongMap!815)

(declare-fun call!2635 () ListLongMap!815)

(assert (=> bm!2630 (= call!2630 call!2635)))

(declare-fun b!32526 () Bool)

(assert (=> b!32526 (= e!20653 e!20661)))

(declare-fun res!19754 () Bool)

(assert (=> b!32526 (= res!19754 call!2632)))

(assert (=> b!32526 (=> (not res!19754) (not e!20661))))

(declare-fun c!3776 () Bool)

(declare-fun call!2633 () ListLongMap!815)

(declare-fun bm!2631 () Bool)

(assert (=> bm!2631 (= call!2634 (+!52 (ite c!3778 call!2635 (ite c!3776 call!2630 call!2633)) (ite (or c!3778 c!3776) (tuple2!1251 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1251 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!32527 () Bool)

(declare-fun e!20660 () Bool)

(assert (=> b!32527 (= e!20660 (validKeyInArray!0 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32528 () Bool)

(assert (=> b!32528 (= e!20663 call!2633)))

(declare-fun bm!2632 () Bool)

(assert (=> bm!2632 (= call!2635 (getCurrentListMapNoExtraKeys!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun e!20656 () Bool)

(declare-fun b!32529 () Bool)

(declare-fun get!553 (ValueCell!542 V!1803) V!1803)

(declare-fun dynLambda!150 (Int (_ BitVec 64)) V!1803)

(assert (=> b!32529 (= e!20656 (= (apply!34 lt!11813 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000)) (get!553 (select (arr!1029 _values!1501) #b00000000000000000000000000000000) (dynLambda!150 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!32529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1130 _values!1501)))))

(assert (=> b!32529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1129 _keys!1833)))))

(declare-fun b!32530 () Bool)

(assert (=> b!32530 (= e!20662 e!20655)))

(assert (=> b!32530 (= c!3776 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!32531 () Bool)

(declare-fun Unit!713 () Unit!710)

(assert (=> b!32531 (= e!20665 Unit!713)))

(declare-fun b!32532 () Bool)

(assert (=> b!32532 (= e!20663 call!2636)))

(declare-fun b!32533 () Bool)

(declare-fun e!20657 () Bool)

(assert (=> b!32533 (= e!20657 e!20656)))

(declare-fun res!19749 () Bool)

(assert (=> b!32533 (=> (not res!19749) (not e!20656))))

(assert (=> b!32533 (= res!19749 (contains!365 lt!11813 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!32533 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1129 _keys!1833)))))

(declare-fun b!32534 () Bool)

(assert (=> b!32534 (= e!20659 (= (apply!34 lt!11813 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!32535 () Bool)

(declare-fun res!19748 () Bool)

(assert (=> b!32535 (=> (not res!19748) (not e!20658))))

(assert (=> b!32535 (= res!19748 e!20657)))

(declare-fun res!19752 () Bool)

(assert (=> b!32535 (=> res!19752 e!20657)))

(assert (=> b!32535 (= res!19752 (not e!20660))))

(declare-fun res!19751 () Bool)

(assert (=> b!32535 (=> (not res!19751) (not e!20660))))

(assert (=> b!32535 (= res!19751 (bvslt #b00000000000000000000000000000000 (size!1129 _keys!1833)))))

(declare-fun b!32536 () Bool)

(assert (=> b!32536 (= e!20658 e!20664)))

(declare-fun c!3779 () Bool)

(assert (=> b!32536 (= c!3779 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2633 () Bool)

(assert (=> bm!2633 (= call!2633 call!2630)))

(assert (= (and d!5075 c!3778) b!32522))

(assert (= (and d!5075 (not c!3778)) b!32530))

(assert (= (and b!32530 c!3776) b!32523))

(assert (= (and b!32530 (not c!3776)) b!32525))

(assert (= (and b!32525 c!3777) b!32532))

(assert (= (and b!32525 (not c!3777)) b!32528))

(assert (= (or b!32532 b!32528) bm!2633))

(assert (= (or b!32523 bm!2633) bm!2630))

(assert (= (or b!32523 b!32532) bm!2628))

(assert (= (or b!32522 bm!2630) bm!2632))

(assert (= (or b!32522 bm!2628) bm!2631))

(assert (= (and d!5075 res!19750) b!32524))

(assert (= (and d!5075 c!3780) b!32518))

(assert (= (and d!5075 (not c!3780)) b!32531))

(assert (= (and d!5075 res!19753) b!32535))

(assert (= (and b!32535 res!19751) b!32527))

(assert (= (and b!32535 (not res!19752)) b!32533))

(assert (= (and b!32533 res!19749) b!32529))

(assert (= (and b!32535 res!19748) b!32517))

(assert (= (and b!32517 c!3775) b!32526))

(assert (= (and b!32517 (not c!3775)) b!32516))

(assert (= (and b!32526 res!19754) b!32520))

(assert (= (or b!32526 b!32516) bm!2627))

(assert (= (and b!32517 res!19756) b!32536))

(assert (= (and b!32536 c!3779) b!32521))

(assert (= (and b!32536 (not c!3779)) b!32519))

(assert (= (and b!32521 res!19755) b!32534))

(assert (= (or b!32521 b!32519) bm!2629))

(declare-fun b_lambda!1687 () Bool)

(assert (=> (not b_lambda!1687) (not b!32529)))

(declare-fun t!3526 () Bool)

(declare-fun tb!677 () Bool)

(assert (=> (and start!4234 (= defaultEntry!1504 defaultEntry!1504) t!3526) tb!677))

(declare-fun result!1153 () Bool)

(assert (=> tb!677 (= result!1153 tp_is_empty!1483)))

(assert (=> b!32529 t!3526))

(declare-fun b_and!1941 () Bool)

(assert (= b_and!1935 (and (=> t!3526 result!1153) b_and!1941)))

(declare-fun m!25965 () Bool)

(assert (=> b!32522 m!25965))

(assert (=> b!32527 m!25949))

(assert (=> b!32527 m!25949))

(declare-fun m!25967 () Bool)

(assert (=> b!32527 m!25967))

(declare-fun m!25969 () Bool)

(assert (=> bm!2627 m!25969))

(assert (=> b!32524 m!25949))

(assert (=> b!32524 m!25949))

(assert (=> b!32524 m!25967))

(declare-fun m!25971 () Bool)

(assert (=> b!32534 m!25971))

(declare-fun m!25973 () Bool)

(assert (=> b!32518 m!25973))

(declare-fun m!25975 () Bool)

(assert (=> b!32518 m!25975))

(declare-fun m!25977 () Bool)

(assert (=> b!32518 m!25977))

(declare-fun m!25979 () Bool)

(assert (=> b!32518 m!25979))

(declare-fun m!25981 () Bool)

(assert (=> b!32518 m!25981))

(declare-fun m!25983 () Bool)

(assert (=> b!32518 m!25983))

(declare-fun m!25985 () Bool)

(assert (=> b!32518 m!25985))

(declare-fun m!25987 () Bool)

(assert (=> b!32518 m!25987))

(declare-fun m!25989 () Bool)

(assert (=> b!32518 m!25989))

(declare-fun m!25991 () Bool)

(assert (=> b!32518 m!25991))

(declare-fun m!25993 () Bool)

(assert (=> b!32518 m!25993))

(assert (=> b!32518 m!25973))

(declare-fun m!25995 () Bool)

(assert (=> b!32518 m!25995))

(declare-fun m!25997 () Bool)

(assert (=> b!32518 m!25997))

(declare-fun m!25999 () Bool)

(assert (=> b!32518 m!25999))

(assert (=> b!32518 m!25991))

(assert (=> b!32518 m!25985))

(declare-fun m!26001 () Bool)

(assert (=> b!32518 m!26001))

(assert (=> b!32518 m!25949))

(assert (=> b!32518 m!25997))

(declare-fun m!26003 () Bool)

(assert (=> b!32518 m!26003))

(declare-fun m!26005 () Bool)

(assert (=> bm!2629 m!26005))

(assert (=> d!5075 m!25879))

(declare-fun m!26007 () Bool)

(assert (=> bm!2631 m!26007))

(declare-fun m!26009 () Bool)

(assert (=> b!32520 m!26009))

(assert (=> b!32533 m!25949))

(assert (=> b!32533 m!25949))

(declare-fun m!26011 () Bool)

(assert (=> b!32533 m!26011))

(declare-fun m!26013 () Bool)

(assert (=> b!32529 m!26013))

(assert (=> b!32529 m!25949))

(declare-fun m!26015 () Bool)

(assert (=> b!32529 m!26015))

(declare-fun m!26017 () Bool)

(assert (=> b!32529 m!26017))

(assert (=> b!32529 m!26013))

(declare-fun m!26019 () Bool)

(assert (=> b!32529 m!26019))

(assert (=> b!32529 m!26017))

(assert (=> b!32529 m!25949))

(assert (=> bm!2632 m!25999))

(assert (=> b!32381 d!5075))

(declare-fun d!5077 () Bool)

(declare-fun res!19763 () Bool)

(declare-fun e!20676 () Bool)

(assert (=> d!5077 (=> res!19763 e!20676)))

(assert (=> d!5077 (= res!19763 (bvsge #b00000000000000000000000000000000 (size!1129 _keys!1833)))))

(assert (=> d!5077 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!829) e!20676)))

(declare-fun b!32549 () Bool)

(declare-fun e!20674 () Bool)

(declare-fun call!2639 () Bool)

(assert (=> b!32549 (= e!20674 call!2639)))

(declare-fun b!32550 () Bool)

(declare-fun e!20677 () Bool)

(assert (=> b!32550 (= e!20677 e!20674)))

(declare-fun c!3783 () Bool)

(assert (=> b!32550 (= c!3783 (validKeyInArray!0 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32551 () Bool)

(declare-fun e!20675 () Bool)

(declare-fun contains!367 (List!832 (_ BitVec 64)) Bool)

(assert (=> b!32551 (= e!20675 (contains!367 Nil!829 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32552 () Bool)

(assert (=> b!32552 (= e!20674 call!2639)))

(declare-fun bm!2636 () Bool)

(assert (=> bm!2636 (= call!2639 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3783 (Cons!828 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000) Nil!829) Nil!829)))))

(declare-fun b!32553 () Bool)

(assert (=> b!32553 (= e!20676 e!20677)))

(declare-fun res!19764 () Bool)

(assert (=> b!32553 (=> (not res!19764) (not e!20677))))

(assert (=> b!32553 (= res!19764 (not e!20675))))

(declare-fun res!19765 () Bool)

(assert (=> b!32553 (=> (not res!19765) (not e!20675))))

(assert (=> b!32553 (= res!19765 (validKeyInArray!0 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5077 (not res!19763)) b!32553))

(assert (= (and b!32553 res!19765) b!32551))

(assert (= (and b!32553 res!19764) b!32550))

(assert (= (and b!32550 c!3783) b!32552))

(assert (= (and b!32550 (not c!3783)) b!32549))

(assert (= (or b!32552 b!32549) bm!2636))

(assert (=> b!32550 m!25949))

(assert (=> b!32550 m!25949))

(assert (=> b!32550 m!25967))

(assert (=> b!32551 m!25949))

(assert (=> b!32551 m!25949))

(declare-fun m!26021 () Bool)

(assert (=> b!32551 m!26021))

(assert (=> bm!2636 m!25949))

(declare-fun m!26023 () Bool)

(assert (=> bm!2636 m!26023))

(assert (=> b!32553 m!25949))

(assert (=> b!32553 m!25949))

(assert (=> b!32553 m!25967))

(assert (=> b!32380 d!5077))

(declare-fun d!5079 () Bool)

(declare-fun res!19770 () Bool)

(declare-fun e!20685 () Bool)

(assert (=> d!5079 (=> res!19770 e!20685)))

(assert (=> d!5079 (= res!19770 (bvsge #b00000000000000000000000000000000 (size!1129 _keys!1833)))))

(assert (=> d!5079 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!20685)))

(declare-fun bm!2639 () Bool)

(declare-fun call!2642 () Bool)

(assert (=> bm!2639 (= call!2642 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!32562 () Bool)

(declare-fun e!20686 () Bool)

(assert (=> b!32562 (= e!20686 call!2642)))

(declare-fun b!32563 () Bool)

(declare-fun e!20684 () Bool)

(assert (=> b!32563 (= e!20684 call!2642)))

(declare-fun b!32564 () Bool)

(assert (=> b!32564 (= e!20685 e!20686)))

(declare-fun c!3786 () Bool)

(assert (=> b!32564 (= c!3786 (validKeyInArray!0 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!32565 () Bool)

(assert (=> b!32565 (= e!20686 e!20684)))

(declare-fun lt!11834 () (_ BitVec 64))

(assert (=> b!32565 (= lt!11834 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!11835 () Unit!710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2151 (_ BitVec 64) (_ BitVec 32)) Unit!710)

(assert (=> b!32565 (= lt!11835 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!11834 #b00000000000000000000000000000000))))

(assert (=> b!32565 (arrayContainsKey!0 _keys!1833 lt!11834 #b00000000000000000000000000000000)))

(declare-fun lt!11836 () Unit!710)

(assert (=> b!32565 (= lt!11836 lt!11835)))

(declare-fun res!19771 () Bool)

(declare-datatypes ((SeekEntryResult!128 0))(
  ( (MissingZero!128 (index!2634 (_ BitVec 32))) (Found!128 (index!2635 (_ BitVec 32))) (Intermediate!128 (undefined!940 Bool) (index!2636 (_ BitVec 32)) (x!6746 (_ BitVec 32))) (Undefined!128) (MissingVacant!128 (index!2637 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2151 (_ BitVec 32)) SeekEntryResult!128)

(assert (=> b!32565 (= res!19771 (= (seekEntryOrOpen!0 (select (arr!1028 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!128 #b00000000000000000000000000000000)))))

(assert (=> b!32565 (=> (not res!19771) (not e!20684))))

(assert (= (and d!5079 (not res!19770)) b!32564))

(assert (= (and b!32564 c!3786) b!32565))

(assert (= (and b!32564 (not c!3786)) b!32562))

(assert (= (and b!32565 res!19771) b!32563))

(assert (= (or b!32563 b!32562) bm!2639))

(declare-fun m!26025 () Bool)

(assert (=> bm!2639 m!26025))

(assert (=> b!32564 m!25949))

(assert (=> b!32564 m!25949))

(assert (=> b!32564 m!25967))

(assert (=> b!32565 m!25949))

(declare-fun m!26027 () Bool)

(assert (=> b!32565 m!26027))

(declare-fun m!26029 () Bool)

(assert (=> b!32565 m!26029))

(assert (=> b!32565 m!25949))

(declare-fun m!26031 () Bool)

(assert (=> b!32565 m!26031))

(assert (=> b!32376 d!5079))

(declare-fun mapNonEmpty!1765 () Bool)

(declare-fun mapRes!1765 () Bool)

(declare-fun tp!4825 () Bool)

(declare-fun e!20692 () Bool)

(assert (=> mapNonEmpty!1765 (= mapRes!1765 (and tp!4825 e!20692))))

(declare-fun mapRest!1765 () (Array (_ BitVec 32) ValueCell!542))

(declare-fun mapValue!1765 () ValueCell!542)

(declare-fun mapKey!1765 () (_ BitVec 32))

(assert (=> mapNonEmpty!1765 (= mapRest!1756 (store mapRest!1765 mapKey!1765 mapValue!1765))))

(declare-fun condMapEmpty!1765 () Bool)

(declare-fun mapDefault!1765 () ValueCell!542)

(assert (=> mapNonEmpty!1756 (= condMapEmpty!1765 (= mapRest!1756 ((as const (Array (_ BitVec 32) ValueCell!542)) mapDefault!1765)))))

(declare-fun e!20691 () Bool)

(assert (=> mapNonEmpty!1756 (= tp!4809 (and e!20691 mapRes!1765))))

(declare-fun b!32573 () Bool)

(assert (=> b!32573 (= e!20691 tp_is_empty!1483)))

(declare-fun mapIsEmpty!1765 () Bool)

(assert (=> mapIsEmpty!1765 mapRes!1765))

(declare-fun b!32572 () Bool)

(assert (=> b!32572 (= e!20692 tp_is_empty!1483)))

(assert (= (and mapNonEmpty!1756 condMapEmpty!1765) mapIsEmpty!1765))

(assert (= (and mapNonEmpty!1756 (not condMapEmpty!1765)) mapNonEmpty!1765))

(assert (= (and mapNonEmpty!1765 ((_ is ValueCellFull!542) mapValue!1765)) b!32572))

(assert (= (and mapNonEmpty!1756 ((_ is ValueCellFull!542) mapDefault!1765)) b!32573))

(declare-fun m!26033 () Bool)

(assert (=> mapNonEmpty!1765 m!26033))

(declare-fun b_lambda!1689 () Bool)

(assert (= b_lambda!1687 (or (and start!4234 b_free!1129) b_lambda!1689)))

(check-sat (not bm!2639) (not b!32464) (not b!32518) (not b!32565) (not d!5075) (not bm!2629) (not b!32471) (not d!5073) (not b!32564) (not bm!2631) (not b!32524) (not bm!2632) (not bm!2636) (not bm!2627) (not b_next!1129) (not b!32520) (not b!32534) (not b!32527) (not b!32553) (not b!32458) (not b!32473) (not mapNonEmpty!1765) (not b!32533) (not b!32529) (not b!32550) b_and!1941 (not b_lambda!1689) (not b!32551) (not b!32522) tp_is_empty!1483)
(check-sat b_and!1941 (not b_next!1129))
