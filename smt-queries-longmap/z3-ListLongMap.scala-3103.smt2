; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43566 () Bool)

(assert start!43566)

(declare-fun b_free!12337 () Bool)

(declare-fun b_next!12337 () Bool)

(assert (=> start!43566 (= b_free!12337 (not b_next!12337))))

(declare-fun tp!43296 () Bool)

(declare-fun b_and!21109 () Bool)

(assert (=> start!43566 (= tp!43296 b_and!21109)))

(declare-fun b!482776 () Bool)

(declare-fun e!284109 () Bool)

(declare-fun tp_is_empty!13849 () Bool)

(assert (=> b!482776 (= e!284109 tp_is_empty!13849)))

(declare-fun b!482777 () Bool)

(declare-fun e!284104 () Bool)

(declare-fun mapRes!22486 () Bool)

(assert (=> b!482777 (= e!284104 (and e!284109 mapRes!22486))))

(declare-fun condMapEmpty!22486 () Bool)

(declare-datatypes ((V!19537 0))(
  ( (V!19538 (val!6972 Int)) )
))
(declare-datatypes ((ValueCell!6563 0))(
  ( (ValueCellFull!6563 (v!9267 V!19537)) (EmptyCell!6563) )
))
(declare-datatypes ((array!31344 0))(
  ( (array!31345 (arr!15073 (Array (_ BitVec 32) ValueCell!6563)) (size!15431 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31344)

(declare-fun mapDefault!22486 () ValueCell!6563)

(assert (=> b!482777 (= condMapEmpty!22486 (= (arr!15073 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6563)) mapDefault!22486)))))

(declare-fun mapNonEmpty!22486 () Bool)

(declare-fun tp!43297 () Bool)

(declare-fun e!284105 () Bool)

(assert (=> mapNonEmpty!22486 (= mapRes!22486 (and tp!43297 e!284105))))

(declare-fun mapKey!22486 () (_ BitVec 32))

(declare-fun mapRest!22486 () (Array (_ BitVec 32) ValueCell!6563))

(declare-fun mapValue!22486 () ValueCell!6563)

(assert (=> mapNonEmpty!22486 (= (arr!15073 _values!1516) (store mapRest!22486 mapKey!22486 mapValue!22486))))

(declare-fun b!482778 () Bool)

(declare-fun res!287778 () Bool)

(declare-fun e!284106 () Bool)

(assert (=> b!482778 (=> (not res!287778) (not e!284106))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31346 0))(
  ( (array!31347 (arr!15074 (Array (_ BitVec 32) (_ BitVec 64))) (size!15432 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31346)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!482778 (= res!287778 (and (= (size!15431 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15432 _keys!1874) (size!15431 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!287780 () Bool)

(assert (=> start!43566 (=> (not res!287780) (not e!284106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43566 (= res!287780 (validMask!0 mask!2352))))

(assert (=> start!43566 e!284106))

(assert (=> start!43566 true))

(assert (=> start!43566 tp_is_empty!13849))

(declare-fun array_inv!10942 (array!31344) Bool)

(assert (=> start!43566 (and (array_inv!10942 _values!1516) e!284104)))

(assert (=> start!43566 tp!43296))

(declare-fun array_inv!10943 (array!31346) Bool)

(assert (=> start!43566 (array_inv!10943 _keys!1874)))

(declare-fun b!482779 () Bool)

(declare-fun e!284107 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482779 (= e!284107 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482780 () Bool)

(assert (=> b!482780 (= e!284105 tp_is_empty!13849)))

(declare-fun b!482781 () Bool)

(declare-fun res!287781 () Bool)

(assert (=> b!482781 (=> (not res!287781) (not e!284106))))

(declare-fun minValue!1458 () V!19537)

(declare-fun zeroValue!1458 () V!19537)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9066 0))(
  ( (tuple2!9067 (_1!4544 (_ BitVec 64)) (_2!4544 V!19537)) )
))
(declare-datatypes ((List!9133 0))(
  ( (Nil!9130) (Cons!9129 (h!9985 tuple2!9066) (t!15341 List!9133)) )
))
(declare-datatypes ((ListLongMap!7981 0))(
  ( (ListLongMap!7982 (toList!4006 List!9133)) )
))
(declare-fun contains!2639 (ListLongMap!7981 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2320 (array!31346 array!31344 (_ BitVec 32) (_ BitVec 32) V!19537 V!19537 (_ BitVec 32) Int) ListLongMap!7981)

(assert (=> b!482781 (= res!287781 (contains!2639 (getCurrentListMap!2320 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482782 () Bool)

(declare-fun res!287777 () Bool)

(assert (=> b!482782 (=> (not res!287777) (not e!284106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482782 (= res!287777 (validKeyInArray!0 k0!1332))))

(declare-fun b!482783 () Bool)

(assert (=> b!482783 (= e!284107 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!482784 () Bool)

(declare-fun res!287776 () Bool)

(assert (=> b!482784 (=> (not res!287776) (not e!284106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31346 (_ BitVec 32)) Bool)

(assert (=> b!482784 (= res!287776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22486 () Bool)

(assert (=> mapIsEmpty!22486 mapRes!22486))

(declare-fun b!482785 () Bool)

(declare-fun lt!218877 () (_ BitVec 32))

(assert (=> b!482785 (= e!284106 (not (or (not (= (size!15432 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvsgt #b00000000000000000000000000000000 (size!15432 _keys!1874)) (and (bvsge lt!218877 #b00000000000000000000000000000000) (bvsle lt!218877 (size!15432 _keys!1874))))))))

(declare-fun arrayScanForKey!0 (array!31346 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482785 (= lt!218877 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!482785 e!284107))

(declare-fun c!57984 () Bool)

(assert (=> b!482785 (= c!57984 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14117 0))(
  ( (Unit!14118) )
))
(declare-fun lt!218878 () Unit!14117)

(declare-fun lemmaKeyInListMapIsInArray!149 (array!31346 array!31344 (_ BitVec 32) (_ BitVec 32) V!19537 V!19537 (_ BitVec 64) Int) Unit!14117)

(assert (=> b!482785 (= lt!218878 (lemmaKeyInListMapIsInArray!149 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!482786 () Bool)

(declare-fun res!287779 () Bool)

(assert (=> b!482786 (=> (not res!287779) (not e!284106))))

(declare-datatypes ((List!9134 0))(
  ( (Nil!9131) (Cons!9130 (h!9986 (_ BitVec 64)) (t!15342 List!9134)) )
))
(declare-fun arrayNoDuplicates!0 (array!31346 (_ BitVec 32) List!9134) Bool)

(assert (=> b!482786 (= res!287779 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9131))))

(assert (= (and start!43566 res!287780) b!482778))

(assert (= (and b!482778 res!287778) b!482784))

(assert (= (and b!482784 res!287776) b!482786))

(assert (= (and b!482786 res!287779) b!482781))

(assert (= (and b!482781 res!287781) b!482782))

(assert (= (and b!482782 res!287777) b!482785))

(assert (= (and b!482785 c!57984) b!482779))

(assert (= (and b!482785 (not c!57984)) b!482783))

(assert (= (and b!482777 condMapEmpty!22486) mapIsEmpty!22486))

(assert (= (and b!482777 (not condMapEmpty!22486)) mapNonEmpty!22486))

(get-info :version)

(assert (= (and mapNonEmpty!22486 ((_ is ValueCellFull!6563) mapValue!22486)) b!482780))

(assert (= (and b!482777 ((_ is ValueCellFull!6563) mapDefault!22486)) b!482776))

(assert (= start!43566 b!482777))

(declare-fun m!464153 () Bool)

(assert (=> start!43566 m!464153))

(declare-fun m!464155 () Bool)

(assert (=> start!43566 m!464155))

(declare-fun m!464157 () Bool)

(assert (=> start!43566 m!464157))

(declare-fun m!464159 () Bool)

(assert (=> b!482784 m!464159))

(declare-fun m!464161 () Bool)

(assert (=> b!482785 m!464161))

(declare-fun m!464163 () Bool)

(assert (=> b!482785 m!464163))

(declare-fun m!464165 () Bool)

(assert (=> b!482782 m!464165))

(declare-fun m!464167 () Bool)

(assert (=> mapNonEmpty!22486 m!464167))

(declare-fun m!464169 () Bool)

(assert (=> b!482781 m!464169))

(assert (=> b!482781 m!464169))

(declare-fun m!464171 () Bool)

(assert (=> b!482781 m!464171))

(declare-fun m!464173 () Bool)

(assert (=> b!482779 m!464173))

(declare-fun m!464175 () Bool)

(assert (=> b!482786 m!464175))

(check-sat (not mapNonEmpty!22486) (not b!482782) (not b!482784) (not b!482779) (not b!482781) (not b!482785) (not b!482786) (not start!43566) tp_is_empty!13849 (not b_next!12337) b_and!21109)
(check-sat b_and!21109 (not b_next!12337))
(get-model)

(declare-fun d!76881 () Bool)

(declare-fun res!287822 () Bool)

(declare-fun e!284154 () Bool)

(assert (=> d!76881 (=> res!287822 e!284154)))

(assert (=> d!76881 (= res!287822 (bvsge #b00000000000000000000000000000000 (size!15432 _keys!1874)))))

(assert (=> d!76881 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!284154)))

(declare-fun b!482861 () Bool)

(declare-fun e!284152 () Bool)

(assert (=> b!482861 (= e!284154 e!284152)))

(declare-fun c!57993 () Bool)

(assert (=> b!482861 (= c!57993 (validKeyInArray!0 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30970 () Bool)

(declare-fun call!30973 () Bool)

(assert (=> bm!30970 (= call!30973 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!482862 () Bool)

(declare-fun e!284153 () Bool)

(assert (=> b!482862 (= e!284152 e!284153)))

(declare-fun lt!218897 () (_ BitVec 64))

(assert (=> b!482862 (= lt!218897 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218899 () Unit!14117)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31346 (_ BitVec 64) (_ BitVec 32)) Unit!14117)

(assert (=> b!482862 (= lt!218899 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218897 #b00000000000000000000000000000000))))

(assert (=> b!482862 (arrayContainsKey!0 _keys!1874 lt!218897 #b00000000000000000000000000000000)))

(declare-fun lt!218898 () Unit!14117)

(assert (=> b!482862 (= lt!218898 lt!218899)))

(declare-fun res!287823 () Bool)

(declare-datatypes ((SeekEntryResult!3522 0))(
  ( (MissingZero!3522 (index!16267 (_ BitVec 32))) (Found!3522 (index!16268 (_ BitVec 32))) (Intermediate!3522 (undefined!4334 Bool) (index!16269 (_ BitVec 32)) (x!45307 (_ BitVec 32))) (Undefined!3522) (MissingVacant!3522 (index!16270 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31346 (_ BitVec 32)) SeekEntryResult!3522)

(assert (=> b!482862 (= res!287823 (= (seekEntryOrOpen!0 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3522 #b00000000000000000000000000000000)))))

(assert (=> b!482862 (=> (not res!287823) (not e!284153))))

(declare-fun b!482863 () Bool)

(assert (=> b!482863 (= e!284152 call!30973)))

(declare-fun b!482864 () Bool)

(assert (=> b!482864 (= e!284153 call!30973)))

(assert (= (and d!76881 (not res!287822)) b!482861))

(assert (= (and b!482861 c!57993) b!482862))

(assert (= (and b!482861 (not c!57993)) b!482863))

(assert (= (and b!482862 res!287823) b!482864))

(assert (= (or b!482864 b!482863) bm!30970))

(declare-fun m!464225 () Bool)

(assert (=> b!482861 m!464225))

(assert (=> b!482861 m!464225))

(declare-fun m!464227 () Bool)

(assert (=> b!482861 m!464227))

(declare-fun m!464229 () Bool)

(assert (=> bm!30970 m!464229))

(assert (=> b!482862 m!464225))

(declare-fun m!464231 () Bool)

(assert (=> b!482862 m!464231))

(declare-fun m!464233 () Bool)

(assert (=> b!482862 m!464233))

(assert (=> b!482862 m!464225))

(declare-fun m!464235 () Bool)

(assert (=> b!482862 m!464235))

(assert (=> b!482784 d!76881))

(declare-fun d!76883 () Bool)

(declare-fun res!287828 () Bool)

(declare-fun e!284159 () Bool)

(assert (=> d!76883 (=> res!287828 e!284159)))

(assert (=> d!76883 (= res!287828 (= (select (arr!15074 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76883 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!284159)))

(declare-fun b!482869 () Bool)

(declare-fun e!284160 () Bool)

(assert (=> b!482869 (= e!284159 e!284160)))

(declare-fun res!287829 () Bool)

(assert (=> b!482869 (=> (not res!287829) (not e!284160))))

(assert (=> b!482869 (= res!287829 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15432 _keys!1874)))))

(declare-fun b!482870 () Bool)

(assert (=> b!482870 (= e!284160 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76883 (not res!287828)) b!482869))

(assert (= (and b!482869 res!287829) b!482870))

(assert (=> d!76883 m!464225))

(declare-fun m!464237 () Bool)

(assert (=> b!482870 m!464237))

(assert (=> b!482779 d!76883))

(declare-fun d!76885 () Bool)

(assert (=> d!76885 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43566 d!76885))

(declare-fun d!76887 () Bool)

(assert (=> d!76887 (= (array_inv!10942 _values!1516) (bvsge (size!15431 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43566 d!76887))

(declare-fun d!76889 () Bool)

(assert (=> d!76889 (= (array_inv!10943 _keys!1874) (bvsge (size!15432 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43566 d!76889))

(declare-fun d!76891 () Bool)

(assert (=> d!76891 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!482782 d!76891))

(declare-fun bm!30973 () Bool)

(declare-fun call!30976 () Bool)

(declare-fun c!57996 () Bool)

(assert (=> bm!30973 (= call!30976 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57996 (Cons!9130 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000) Nil!9131) Nil!9131)))))

(declare-fun d!76893 () Bool)

(declare-fun res!287837 () Bool)

(declare-fun e!284169 () Bool)

(assert (=> d!76893 (=> res!287837 e!284169)))

(assert (=> d!76893 (= res!287837 (bvsge #b00000000000000000000000000000000 (size!15432 _keys!1874)))))

(assert (=> d!76893 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9131) e!284169)))

(declare-fun b!482881 () Bool)

(declare-fun e!284172 () Bool)

(declare-fun contains!2642 (List!9134 (_ BitVec 64)) Bool)

(assert (=> b!482881 (= e!284172 (contains!2642 Nil!9131 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482882 () Bool)

(declare-fun e!284171 () Bool)

(assert (=> b!482882 (= e!284169 e!284171)))

(declare-fun res!287838 () Bool)

(assert (=> b!482882 (=> (not res!287838) (not e!284171))))

(assert (=> b!482882 (= res!287838 (not e!284172))))

(declare-fun res!287836 () Bool)

(assert (=> b!482882 (=> (not res!287836) (not e!284172))))

(assert (=> b!482882 (= res!287836 (validKeyInArray!0 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482883 () Bool)

(declare-fun e!284170 () Bool)

(assert (=> b!482883 (= e!284170 call!30976)))

(declare-fun b!482884 () Bool)

(assert (=> b!482884 (= e!284171 e!284170)))

(assert (=> b!482884 (= c!57996 (validKeyInArray!0 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482885 () Bool)

(assert (=> b!482885 (= e!284170 call!30976)))

(assert (= (and d!76893 (not res!287837)) b!482882))

(assert (= (and b!482882 res!287836) b!482881))

(assert (= (and b!482882 res!287838) b!482884))

(assert (= (and b!482884 c!57996) b!482885))

(assert (= (and b!482884 (not c!57996)) b!482883))

(assert (= (or b!482885 b!482883) bm!30973))

(assert (=> bm!30973 m!464225))

(declare-fun m!464239 () Bool)

(assert (=> bm!30973 m!464239))

(assert (=> b!482881 m!464225))

(assert (=> b!482881 m!464225))

(declare-fun m!464241 () Bool)

(assert (=> b!482881 m!464241))

(assert (=> b!482882 m!464225))

(assert (=> b!482882 m!464225))

(assert (=> b!482882 m!464227))

(assert (=> b!482884 m!464225))

(assert (=> b!482884 m!464225))

(assert (=> b!482884 m!464227))

(assert (=> b!482786 d!76893))

(declare-fun d!76895 () Bool)

(declare-fun lt!218902 () (_ BitVec 32))

(assert (=> d!76895 (and (or (bvslt lt!218902 #b00000000000000000000000000000000) (bvsge lt!218902 (size!15432 _keys!1874)) (and (bvsge lt!218902 #b00000000000000000000000000000000) (bvslt lt!218902 (size!15432 _keys!1874)))) (bvsge lt!218902 #b00000000000000000000000000000000) (bvslt lt!218902 (size!15432 _keys!1874)) (= (select (arr!15074 _keys!1874) lt!218902) k0!1332))))

(declare-fun e!284175 () (_ BitVec 32))

(assert (=> d!76895 (= lt!218902 e!284175)))

(declare-fun c!57999 () Bool)

(assert (=> d!76895 (= c!57999 (= (select (arr!15074 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76895 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15432 _keys!1874)) (bvslt (size!15432 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76895 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218902)))

(declare-fun b!482890 () Bool)

(assert (=> b!482890 (= e!284175 #b00000000000000000000000000000000)))

(declare-fun b!482891 () Bool)

(assert (=> b!482891 (= e!284175 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76895 c!57999) b!482890))

(assert (= (and d!76895 (not c!57999)) b!482891))

(declare-fun m!464243 () Bool)

(assert (=> d!76895 m!464243))

(assert (=> d!76895 m!464225))

(declare-fun m!464245 () Bool)

(assert (=> b!482891 m!464245))

(assert (=> b!482785 d!76895))

(declare-fun d!76897 () Bool)

(declare-fun e!284178 () Bool)

(assert (=> d!76897 e!284178))

(declare-fun c!58002 () Bool)

(assert (=> d!76897 (= c!58002 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218905 () Unit!14117)

(declare-fun choose!1385 (array!31346 array!31344 (_ BitVec 32) (_ BitVec 32) V!19537 V!19537 (_ BitVec 64) Int) Unit!14117)

(assert (=> d!76897 (= lt!218905 (choose!1385 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76897 (validMask!0 mask!2352)))

(assert (=> d!76897 (= (lemmaKeyInListMapIsInArray!149 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218905)))

(declare-fun b!482896 () Bool)

(assert (=> b!482896 (= e!284178 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482897 () Bool)

(assert (=> b!482897 (= e!284178 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76897 c!58002) b!482896))

(assert (= (and d!76897 (not c!58002)) b!482897))

(declare-fun m!464247 () Bool)

(assert (=> d!76897 m!464247))

(assert (=> d!76897 m!464153))

(assert (=> b!482896 m!464173))

(assert (=> b!482785 d!76897))

(declare-fun d!76899 () Bool)

(declare-fun e!284183 () Bool)

(assert (=> d!76899 e!284183))

(declare-fun res!287841 () Bool)

(assert (=> d!76899 (=> res!287841 e!284183)))

(declare-fun lt!218914 () Bool)

(assert (=> d!76899 (= res!287841 (not lt!218914))))

(declare-fun lt!218916 () Bool)

(assert (=> d!76899 (= lt!218914 lt!218916)))

(declare-fun lt!218917 () Unit!14117)

(declare-fun e!284184 () Unit!14117)

(assert (=> d!76899 (= lt!218917 e!284184)))

(declare-fun c!58005 () Bool)

(assert (=> d!76899 (= c!58005 lt!218916)))

(declare-fun containsKey!359 (List!9133 (_ BitVec 64)) Bool)

(assert (=> d!76899 (= lt!218916 (containsKey!359 (toList!4006 (getCurrentListMap!2320 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76899 (= (contains!2639 (getCurrentListMap!2320 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218914)))

(declare-fun b!482904 () Bool)

(declare-fun lt!218915 () Unit!14117)

(assert (=> b!482904 (= e!284184 lt!218915)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!307 (List!9133 (_ BitVec 64)) Unit!14117)

(assert (=> b!482904 (= lt!218915 (lemmaContainsKeyImpliesGetValueByKeyDefined!307 (toList!4006 (getCurrentListMap!2320 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!404 0))(
  ( (Some!403 (v!9270 V!19537)) (None!402) )
))
(declare-fun isDefined!308 (Option!404) Bool)

(declare-fun getValueByKey!398 (List!9133 (_ BitVec 64)) Option!404)

(assert (=> b!482904 (isDefined!308 (getValueByKey!398 (toList!4006 (getCurrentListMap!2320 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!482905 () Bool)

(declare-fun Unit!14119 () Unit!14117)

(assert (=> b!482905 (= e!284184 Unit!14119)))

(declare-fun b!482906 () Bool)

(assert (=> b!482906 (= e!284183 (isDefined!308 (getValueByKey!398 (toList!4006 (getCurrentListMap!2320 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76899 c!58005) b!482904))

(assert (= (and d!76899 (not c!58005)) b!482905))

(assert (= (and d!76899 (not res!287841)) b!482906))

(declare-fun m!464249 () Bool)

(assert (=> d!76899 m!464249))

(declare-fun m!464251 () Bool)

(assert (=> b!482904 m!464251))

(declare-fun m!464253 () Bool)

(assert (=> b!482904 m!464253))

(assert (=> b!482904 m!464253))

(declare-fun m!464255 () Bool)

(assert (=> b!482904 m!464255))

(assert (=> b!482906 m!464253))

(assert (=> b!482906 m!464253))

(assert (=> b!482906 m!464255))

(assert (=> b!482781 d!76899))

(declare-fun b!482949 () Bool)

(declare-fun e!284216 () ListLongMap!7981)

(declare-fun call!30993 () ListLongMap!7981)

(assert (=> b!482949 (= e!284216 call!30993)))

(declare-fun b!482950 () Bool)

(declare-fun c!58019 () Bool)

(assert (=> b!482950 (= c!58019 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!284211 () ListLongMap!7981)

(assert (=> b!482950 (= e!284216 e!284211)))

(declare-fun bm!30988 () Bool)

(declare-fun call!30997 () ListLongMap!7981)

(assert (=> bm!30988 (= call!30993 call!30997)))

(declare-fun b!482951 () Bool)

(declare-fun e!284212 () Bool)

(assert (=> b!482951 (= e!284212 (validKeyInArray!0 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482952 () Bool)

(declare-fun e!284219 () Bool)

(declare-fun call!30994 () Bool)

(assert (=> b!482952 (= e!284219 (not call!30994))))

(declare-fun b!482953 () Bool)

(declare-fun e!284223 () Bool)

(declare-fun e!284222 () Bool)

(assert (=> b!482953 (= e!284223 e!284222)))

(declare-fun res!287865 () Bool)

(assert (=> b!482953 (=> (not res!287865) (not e!284222))))

(declare-fun lt!218964 () ListLongMap!7981)

(assert (=> b!482953 (= res!287865 (contains!2639 lt!218964 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!482953 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15432 _keys!1874)))))

(declare-fun bm!30989 () Bool)

(assert (=> bm!30989 (= call!30994 (contains!2639 lt!218964 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!482954 () Bool)

(declare-fun res!287866 () Bool)

(declare-fun e!284218 () Bool)

(assert (=> b!482954 (=> (not res!287866) (not e!284218))))

(declare-fun e!284215 () Bool)

(assert (=> b!482954 (= res!287866 e!284215)))

(declare-fun c!58021 () Bool)

(assert (=> b!482954 (= c!58021 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!482955 () Bool)

(declare-fun e!284220 () ListLongMap!7981)

(declare-fun +!1783 (ListLongMap!7981 tuple2!9066) ListLongMap!7981)

(assert (=> b!482955 (= e!284220 (+!1783 call!30997 (tuple2!9067 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!482956 () Bool)

(declare-fun e!284213 () Unit!14117)

(declare-fun Unit!14120 () Unit!14117)

(assert (=> b!482956 (= e!284213 Unit!14120)))

(declare-fun b!482957 () Bool)

(declare-fun res!287861 () Bool)

(assert (=> b!482957 (=> (not res!287861) (not e!284218))))

(assert (=> b!482957 (= res!287861 e!284223)))

(declare-fun res!287864 () Bool)

(assert (=> b!482957 (=> res!287864 e!284223)))

(assert (=> b!482957 (= res!287864 (not e!284212))))

(declare-fun res!287863 () Bool)

(assert (=> b!482957 (=> (not res!287863) (not e!284212))))

(assert (=> b!482957 (= res!287863 (bvslt #b00000000000000000000000000000000 (size!15432 _keys!1874)))))

(declare-fun b!482958 () Bool)

(declare-fun e!284221 () Bool)

(assert (=> b!482958 (= e!284219 e!284221)))

(declare-fun res!287862 () Bool)

(assert (=> b!482958 (= res!287862 call!30994)))

(assert (=> b!482958 (=> (not res!287862) (not e!284221))))

(declare-fun d!76901 () Bool)

(assert (=> d!76901 e!284218))

(declare-fun res!287860 () Bool)

(assert (=> d!76901 (=> (not res!287860) (not e!284218))))

(assert (=> d!76901 (= res!287860 (or (bvsge #b00000000000000000000000000000000 (size!15432 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15432 _keys!1874)))))))

(declare-fun lt!218982 () ListLongMap!7981)

(assert (=> d!76901 (= lt!218964 lt!218982)))

(declare-fun lt!218976 () Unit!14117)

(assert (=> d!76901 (= lt!218976 e!284213)))

(declare-fun c!58018 () Bool)

(declare-fun e!284217 () Bool)

(assert (=> d!76901 (= c!58018 e!284217)))

(declare-fun res!287867 () Bool)

(assert (=> d!76901 (=> (not res!287867) (not e!284217))))

(assert (=> d!76901 (= res!287867 (bvslt #b00000000000000000000000000000000 (size!15432 _keys!1874)))))

(assert (=> d!76901 (= lt!218982 e!284220)))

(declare-fun c!58023 () Bool)

(assert (=> d!76901 (= c!58023 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76901 (validMask!0 mask!2352)))

(assert (=> d!76901 (= (getCurrentListMap!2320 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218964)))

(declare-fun bm!30990 () Bool)

(declare-fun call!30995 () ListLongMap!7981)

(declare-fun call!30992 () ListLongMap!7981)

(assert (=> bm!30990 (= call!30995 call!30992)))

(declare-fun bm!30991 () Bool)

(declare-fun call!30996 () Bool)

(assert (=> bm!30991 (= call!30996 (contains!2639 lt!218964 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!482959 () Bool)

(declare-fun call!30991 () ListLongMap!7981)

(assert (=> b!482959 (= e!284211 call!30991)))

(declare-fun b!482960 () Bool)

(assert (=> b!482960 (= e!284215 (not call!30996))))

(declare-fun b!482961 () Bool)

(declare-fun lt!218963 () Unit!14117)

(assert (=> b!482961 (= e!284213 lt!218963)))

(declare-fun lt!218970 () ListLongMap!7981)

(declare-fun getCurrentListMapNoExtraKeys!2128 (array!31346 array!31344 (_ BitVec 32) (_ BitVec 32) V!19537 V!19537 (_ BitVec 32) Int) ListLongMap!7981)

(assert (=> b!482961 (= lt!218970 (getCurrentListMapNoExtraKeys!2128 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218971 () (_ BitVec 64))

(assert (=> b!482961 (= lt!218971 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218977 () (_ BitVec 64))

(assert (=> b!482961 (= lt!218977 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218975 () Unit!14117)

(declare-fun addStillContains!302 (ListLongMap!7981 (_ BitVec 64) V!19537 (_ BitVec 64)) Unit!14117)

(assert (=> b!482961 (= lt!218975 (addStillContains!302 lt!218970 lt!218971 zeroValue!1458 lt!218977))))

(assert (=> b!482961 (contains!2639 (+!1783 lt!218970 (tuple2!9067 lt!218971 zeroValue!1458)) lt!218977)))

(declare-fun lt!218980 () Unit!14117)

(assert (=> b!482961 (= lt!218980 lt!218975)))

(declare-fun lt!218967 () ListLongMap!7981)

(assert (=> b!482961 (= lt!218967 (getCurrentListMapNoExtraKeys!2128 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218973 () (_ BitVec 64))

(assert (=> b!482961 (= lt!218973 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218972 () (_ BitVec 64))

(assert (=> b!482961 (= lt!218972 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218974 () Unit!14117)

(declare-fun addApplyDifferent!302 (ListLongMap!7981 (_ BitVec 64) V!19537 (_ BitVec 64)) Unit!14117)

(assert (=> b!482961 (= lt!218974 (addApplyDifferent!302 lt!218967 lt!218973 minValue!1458 lt!218972))))

(declare-fun apply!344 (ListLongMap!7981 (_ BitVec 64)) V!19537)

(assert (=> b!482961 (= (apply!344 (+!1783 lt!218967 (tuple2!9067 lt!218973 minValue!1458)) lt!218972) (apply!344 lt!218967 lt!218972))))

(declare-fun lt!218979 () Unit!14117)

(assert (=> b!482961 (= lt!218979 lt!218974)))

(declare-fun lt!218981 () ListLongMap!7981)

(assert (=> b!482961 (= lt!218981 (getCurrentListMapNoExtraKeys!2128 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218983 () (_ BitVec 64))

(assert (=> b!482961 (= lt!218983 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218962 () (_ BitVec 64))

(assert (=> b!482961 (= lt!218962 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218968 () Unit!14117)

(assert (=> b!482961 (= lt!218968 (addApplyDifferent!302 lt!218981 lt!218983 zeroValue!1458 lt!218962))))

(assert (=> b!482961 (= (apply!344 (+!1783 lt!218981 (tuple2!9067 lt!218983 zeroValue!1458)) lt!218962) (apply!344 lt!218981 lt!218962))))

(declare-fun lt!218965 () Unit!14117)

(assert (=> b!482961 (= lt!218965 lt!218968)))

(declare-fun lt!218966 () ListLongMap!7981)

(assert (=> b!482961 (= lt!218966 (getCurrentListMapNoExtraKeys!2128 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218969 () (_ BitVec 64))

(assert (=> b!482961 (= lt!218969 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218978 () (_ BitVec 64))

(assert (=> b!482961 (= lt!218978 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!482961 (= lt!218963 (addApplyDifferent!302 lt!218966 lt!218969 minValue!1458 lt!218978))))

(assert (=> b!482961 (= (apply!344 (+!1783 lt!218966 (tuple2!9067 lt!218969 minValue!1458)) lt!218978) (apply!344 lt!218966 lt!218978))))

(declare-fun bm!30992 () Bool)

(assert (=> bm!30992 (= call!30991 call!30995)))

(declare-fun b!482962 () Bool)

(declare-fun get!7302 (ValueCell!6563 V!19537) V!19537)

(declare-fun dynLambda!952 (Int (_ BitVec 64)) V!19537)

(assert (=> b!482962 (= e!284222 (= (apply!344 lt!218964 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000)) (get!7302 (select (arr!15073 _values!1516) #b00000000000000000000000000000000) (dynLambda!952 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!482962 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15431 _values!1516)))))

(assert (=> b!482962 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15432 _keys!1874)))))

(declare-fun b!482963 () Bool)

(declare-fun e!284214 () Bool)

(assert (=> b!482963 (= e!284215 e!284214)))

(declare-fun res!287868 () Bool)

(assert (=> b!482963 (= res!287868 call!30996)))

(assert (=> b!482963 (=> (not res!287868) (not e!284214))))

(declare-fun b!482964 () Bool)

(assert (=> b!482964 (= e!284211 call!30993)))

(declare-fun b!482965 () Bool)

(assert (=> b!482965 (= e!284217 (validKeyInArray!0 (select (arr!15074 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482966 () Bool)

(assert (=> b!482966 (= e!284218 e!284219)))

(declare-fun c!58020 () Bool)

(assert (=> b!482966 (= c!58020 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!58022 () Bool)

(declare-fun bm!30993 () Bool)

(assert (=> bm!30993 (= call!30997 (+!1783 (ite c!58023 call!30992 (ite c!58022 call!30995 call!30991)) (ite (or c!58023 c!58022) (tuple2!9067 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9067 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!482967 () Bool)

(assert (=> b!482967 (= e!284214 (= (apply!344 lt!218964 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun bm!30994 () Bool)

(assert (=> bm!30994 (= call!30992 (getCurrentListMapNoExtraKeys!2128 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!482968 () Bool)

(assert (=> b!482968 (= e!284221 (= (apply!344 lt!218964 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!482969 () Bool)

(assert (=> b!482969 (= e!284220 e!284216)))

(assert (=> b!482969 (= c!58022 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!76901 c!58023) b!482955))

(assert (= (and d!76901 (not c!58023)) b!482969))

(assert (= (and b!482969 c!58022) b!482949))

(assert (= (and b!482969 (not c!58022)) b!482950))

(assert (= (and b!482950 c!58019) b!482964))

(assert (= (and b!482950 (not c!58019)) b!482959))

(assert (= (or b!482964 b!482959) bm!30992))

(assert (= (or b!482949 bm!30992) bm!30990))

(assert (= (or b!482949 b!482964) bm!30988))

(assert (= (or b!482955 bm!30990) bm!30994))

(assert (= (or b!482955 bm!30988) bm!30993))

(assert (= (and d!76901 res!287867) b!482965))

(assert (= (and d!76901 c!58018) b!482961))

(assert (= (and d!76901 (not c!58018)) b!482956))

(assert (= (and d!76901 res!287860) b!482957))

(assert (= (and b!482957 res!287863) b!482951))

(assert (= (and b!482957 (not res!287864)) b!482953))

(assert (= (and b!482953 res!287865) b!482962))

(assert (= (and b!482957 res!287861) b!482954))

(assert (= (and b!482954 c!58021) b!482963))

(assert (= (and b!482954 (not c!58021)) b!482960))

(assert (= (and b!482963 res!287868) b!482967))

(assert (= (or b!482963 b!482960) bm!30991))

(assert (= (and b!482954 res!287866) b!482966))

(assert (= (and b!482966 c!58020) b!482958))

(assert (= (and b!482966 (not c!58020)) b!482952))

(assert (= (and b!482958 res!287862) b!482968))

(assert (= (or b!482958 b!482952) bm!30989))

(declare-fun b_lambda!10825 () Bool)

(assert (=> (not b_lambda!10825) (not b!482962)))

(declare-fun t!15346 () Bool)

(declare-fun tb!4161 () Bool)

(assert (=> (and start!43566 (= defaultEntry!1519 defaultEntry!1519) t!15346) tb!4161))

(declare-fun result!7767 () Bool)

(assert (=> tb!4161 (= result!7767 tp_is_empty!13849)))

(assert (=> b!482962 t!15346))

(declare-fun b_and!21115 () Bool)

(assert (= b_and!21109 (and (=> t!15346 result!7767) b_and!21115)))

(declare-fun m!464257 () Bool)

(assert (=> b!482968 m!464257))

(declare-fun m!464259 () Bool)

(assert (=> bm!30989 m!464259))

(declare-fun m!464261 () Bool)

(assert (=> bm!30994 m!464261))

(declare-fun m!464263 () Bool)

(assert (=> bm!30991 m!464263))

(assert (=> b!482965 m!464225))

(assert (=> b!482965 m!464225))

(assert (=> b!482965 m!464227))

(assert (=> d!76901 m!464153))

(assert (=> b!482962 m!464225))

(declare-fun m!464265 () Bool)

(assert (=> b!482962 m!464265))

(declare-fun m!464267 () Bool)

(assert (=> b!482962 m!464267))

(declare-fun m!464269 () Bool)

(assert (=> b!482962 m!464269))

(assert (=> b!482962 m!464225))

(declare-fun m!464271 () Bool)

(assert (=> b!482962 m!464271))

(assert (=> b!482962 m!464265))

(assert (=> b!482962 m!464267))

(declare-fun m!464273 () Bool)

(assert (=> b!482955 m!464273))

(assert (=> b!482953 m!464225))

(assert (=> b!482953 m!464225))

(declare-fun m!464275 () Bool)

(assert (=> b!482953 m!464275))

(declare-fun m!464277 () Bool)

(assert (=> b!482961 m!464277))

(declare-fun m!464279 () Bool)

(assert (=> b!482961 m!464279))

(declare-fun m!464281 () Bool)

(assert (=> b!482961 m!464281))

(declare-fun m!464283 () Bool)

(assert (=> b!482961 m!464283))

(declare-fun m!464285 () Bool)

(assert (=> b!482961 m!464285))

(declare-fun m!464287 () Bool)

(assert (=> b!482961 m!464287))

(assert (=> b!482961 m!464279))

(declare-fun m!464289 () Bool)

(assert (=> b!482961 m!464289))

(declare-fun m!464291 () Bool)

(assert (=> b!482961 m!464291))

(declare-fun m!464293 () Bool)

(assert (=> b!482961 m!464293))

(declare-fun m!464295 () Bool)

(assert (=> b!482961 m!464295))

(assert (=> b!482961 m!464261))

(assert (=> b!482961 m!464225))

(assert (=> b!482961 m!464295))

(declare-fun m!464297 () Bool)

(assert (=> b!482961 m!464297))

(declare-fun m!464299 () Bool)

(assert (=> b!482961 m!464299))

(assert (=> b!482961 m!464287))

(declare-fun m!464301 () Bool)

(assert (=> b!482961 m!464301))

(declare-fun m!464303 () Bool)

(assert (=> b!482961 m!464303))

(assert (=> b!482961 m!464289))

(declare-fun m!464305 () Bool)

(assert (=> b!482961 m!464305))

(assert (=> b!482951 m!464225))

(assert (=> b!482951 m!464225))

(assert (=> b!482951 m!464227))

(declare-fun m!464307 () Bool)

(assert (=> b!482967 m!464307))

(declare-fun m!464309 () Bool)

(assert (=> bm!30993 m!464309))

(assert (=> b!482781 d!76901))

(declare-fun mapIsEmpty!22495 () Bool)

(declare-fun mapRes!22495 () Bool)

(assert (=> mapIsEmpty!22495 mapRes!22495))

(declare-fun mapNonEmpty!22495 () Bool)

(declare-fun tp!43312 () Bool)

(declare-fun e!284228 () Bool)

(assert (=> mapNonEmpty!22495 (= mapRes!22495 (and tp!43312 e!284228))))

(declare-fun mapValue!22495 () ValueCell!6563)

(declare-fun mapKey!22495 () (_ BitVec 32))

(declare-fun mapRest!22495 () (Array (_ BitVec 32) ValueCell!6563))

(assert (=> mapNonEmpty!22495 (= mapRest!22486 (store mapRest!22495 mapKey!22495 mapValue!22495))))

(declare-fun b!482978 () Bool)

(assert (=> b!482978 (= e!284228 tp_is_empty!13849)))

(declare-fun condMapEmpty!22495 () Bool)

(declare-fun mapDefault!22495 () ValueCell!6563)

(assert (=> mapNonEmpty!22486 (= condMapEmpty!22495 (= mapRest!22486 ((as const (Array (_ BitVec 32) ValueCell!6563)) mapDefault!22495)))))

(declare-fun e!284229 () Bool)

(assert (=> mapNonEmpty!22486 (= tp!43297 (and e!284229 mapRes!22495))))

(declare-fun b!482979 () Bool)

(assert (=> b!482979 (= e!284229 tp_is_empty!13849)))

(assert (= (and mapNonEmpty!22486 condMapEmpty!22495) mapIsEmpty!22495))

(assert (= (and mapNonEmpty!22486 (not condMapEmpty!22495)) mapNonEmpty!22495))

(assert (= (and mapNonEmpty!22495 ((_ is ValueCellFull!6563) mapValue!22495)) b!482978))

(assert (= (and mapNonEmpty!22486 ((_ is ValueCellFull!6563) mapDefault!22495)) b!482979))

(declare-fun m!464311 () Bool)

(assert (=> mapNonEmpty!22495 m!464311))

(declare-fun b_lambda!10827 () Bool)

(assert (= b_lambda!10825 (or (and start!43566 b_free!12337) b_lambda!10827)))

(check-sat (not b!482881) (not b!482882) tp_is_empty!13849 (not b!482953) (not b!482896) (not b!482967) (not bm!30994) (not b!482961) (not d!76901) (not b!482955) (not b_next!12337) (not mapNonEmpty!22495) (not bm!30993) (not b_lambda!10827) (not bm!30991) (not b!482951) (not bm!30973) (not bm!30970) (not d!76899) (not b!482861) (not b!482904) (not b!482965) (not d!76897) (not b!482962) (not b!482870) (not b!482884) (not b!482968) (not bm!30989) (not b!482862) (not b!482906) b_and!21115 (not b!482891))
(check-sat b_and!21115 (not b_next!12337))
