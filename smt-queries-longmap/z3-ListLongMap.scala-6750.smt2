; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84802 () Bool)

(assert start!84802)

(declare-fun b_free!20059 () Bool)

(declare-fun b_next!20059 () Bool)

(assert (=> start!84802 (= b_free!20059 (not b_next!20059))))

(declare-fun tp!69970 () Bool)

(declare-fun b_and!32201 () Bool)

(assert (=> start!84802 (= tp!69970 b_and!32201)))

(declare-fun b!990728 () Bool)

(declare-fun res!662249 () Bool)

(declare-fun e!558721 () Bool)

(assert (=> b!990728 (=> (not res!662249) (not e!558721))))

(declare-datatypes ((array!62556 0))(
  ( (array!62557 (arr!30126 (Array (_ BitVec 32) (_ BitVec 64))) (size!30606 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62556)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62556 (_ BitVec 32)) Bool)

(assert (=> b!990728 (= res!662249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!662247 () Bool)

(assert (=> start!84802 (=> (not res!662247) (not e!558721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84802 (= res!662247 (validMask!0 mask!1948))))

(assert (=> start!84802 e!558721))

(assert (=> start!84802 true))

(declare-fun tp_is_empty!23275 () Bool)

(assert (=> start!84802 tp_is_empty!23275))

(declare-datatypes ((V!36017 0))(
  ( (V!36018 (val!11688 Int)) )
))
(declare-datatypes ((ValueCell!11156 0))(
  ( (ValueCellFull!11156 (v!14255 V!36017)) (EmptyCell!11156) )
))
(declare-datatypes ((array!62558 0))(
  ( (array!62559 (arr!30127 (Array (_ BitVec 32) ValueCell!11156)) (size!30607 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62558)

(declare-fun e!558720 () Bool)

(declare-fun array_inv!23301 (array!62558) Bool)

(assert (=> start!84802 (and (array_inv!23301 _values!1278) e!558720)))

(assert (=> start!84802 tp!69970))

(declare-fun array_inv!23302 (array!62556) Bool)

(assert (=> start!84802 (array_inv!23302 _keys!1544)))

(declare-fun b!990729 () Bool)

(declare-fun e!558723 () Bool)

(assert (=> b!990729 (= e!558723 tp_is_empty!23275)))

(declare-fun b!990730 () Bool)

(declare-fun res!662246 () Bool)

(assert (=> b!990730 (=> (not res!662246) (not e!558721))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!990730 (= res!662246 (and (= (size!30607 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30606 _keys!1544) (size!30607 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!990731 () Bool)

(declare-fun e!558719 () Bool)

(assert (=> b!990731 (= e!558719 tp_is_empty!23275)))

(declare-fun b!990732 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!990732 (= e!558721 (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30126 _keys!1544) from!1932)))))

(declare-fun minValue!1220 () V!36017)

(declare-datatypes ((tuple2!14920 0))(
  ( (tuple2!14921 (_1!7471 (_ BitVec 64)) (_2!7471 V!36017)) )
))
(declare-datatypes ((List!20827 0))(
  ( (Nil!20824) (Cons!20823 (h!21991 tuple2!14920) (t!29776 List!20827)) )
))
(declare-datatypes ((ListLongMap!13619 0))(
  ( (ListLongMap!13620 (toList!6825 List!20827)) )
))
(declare-fun lt!439477 () ListLongMap!13619)

(declare-fun zeroValue!1220 () V!36017)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3553 (array!62556 array!62558 (_ BitVec 32) (_ BitVec 32) V!36017 V!36017 (_ BitVec 32) Int) ListLongMap!13619)

(assert (=> b!990732 (= lt!439477 (getCurrentListMapNoExtraKeys!3553 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!990733 () Bool)

(declare-fun res!662252 () Bool)

(assert (=> b!990733 (=> (not res!662252) (not e!558721))))

(assert (=> b!990733 (= res!662252 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30606 _keys!1544))))))

(declare-fun b!990734 () Bool)

(declare-fun res!662251 () Bool)

(assert (=> b!990734 (=> (not res!662251) (not e!558721))))

(assert (=> b!990734 (= res!662251 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!990735 () Bool)

(declare-fun mapRes!36958 () Bool)

(assert (=> b!990735 (= e!558720 (and e!558719 mapRes!36958))))

(declare-fun condMapEmpty!36958 () Bool)

(declare-fun mapDefault!36958 () ValueCell!11156)

(assert (=> b!990735 (= condMapEmpty!36958 (= (arr!30127 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11156)) mapDefault!36958)))))

(declare-fun b!990736 () Bool)

(declare-fun res!662248 () Bool)

(assert (=> b!990736 (=> (not res!662248) (not e!558721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990736 (= res!662248 (validKeyInArray!0 (select (arr!30126 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36958 () Bool)

(declare-fun tp!69969 () Bool)

(assert (=> mapNonEmpty!36958 (= mapRes!36958 (and tp!69969 e!558723))))

(declare-fun mapRest!36958 () (Array (_ BitVec 32) ValueCell!11156))

(declare-fun mapKey!36958 () (_ BitVec 32))

(declare-fun mapValue!36958 () ValueCell!11156)

(assert (=> mapNonEmpty!36958 (= (arr!30127 _values!1278) (store mapRest!36958 mapKey!36958 mapValue!36958))))

(declare-fun mapIsEmpty!36958 () Bool)

(assert (=> mapIsEmpty!36958 mapRes!36958))

(declare-fun b!990737 () Bool)

(declare-fun res!662250 () Bool)

(assert (=> b!990737 (=> (not res!662250) (not e!558721))))

(declare-datatypes ((List!20828 0))(
  ( (Nil!20825) (Cons!20824 (h!21992 (_ BitVec 64)) (t!29777 List!20828)) )
))
(declare-fun arrayNoDuplicates!0 (array!62556 (_ BitVec 32) List!20828) Bool)

(assert (=> b!990737 (= res!662250 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20825))))

(assert (= (and start!84802 res!662247) b!990730))

(assert (= (and b!990730 res!662246) b!990728))

(assert (= (and b!990728 res!662249) b!990737))

(assert (= (and b!990737 res!662250) b!990733))

(assert (= (and b!990733 res!662252) b!990736))

(assert (= (and b!990736 res!662248) b!990734))

(assert (= (and b!990734 res!662251) b!990732))

(assert (= (and b!990735 condMapEmpty!36958) mapIsEmpty!36958))

(assert (= (and b!990735 (not condMapEmpty!36958)) mapNonEmpty!36958))

(get-info :version)

(assert (= (and mapNonEmpty!36958 ((_ is ValueCellFull!11156) mapValue!36958)) b!990729))

(assert (= (and b!990735 ((_ is ValueCellFull!11156) mapDefault!36958)) b!990731))

(assert (= start!84802 b!990735))

(declare-fun m!918579 () Bool)

(assert (=> mapNonEmpty!36958 m!918579))

(declare-fun m!918581 () Bool)

(assert (=> b!990737 m!918581))

(declare-fun m!918583 () Bool)

(assert (=> b!990728 m!918583))

(declare-fun m!918585 () Bool)

(assert (=> b!990732 m!918585))

(declare-fun m!918587 () Bool)

(assert (=> b!990732 m!918587))

(assert (=> b!990736 m!918585))

(assert (=> b!990736 m!918585))

(declare-fun m!918589 () Bool)

(assert (=> b!990736 m!918589))

(declare-fun m!918591 () Bool)

(assert (=> start!84802 m!918591))

(declare-fun m!918593 () Bool)

(assert (=> start!84802 m!918593))

(declare-fun m!918595 () Bool)

(assert (=> start!84802 m!918595))

(check-sat (not start!84802) (not b!990737) (not b!990732) (not b!990736) (not b!990728) tp_is_empty!23275 b_and!32201 (not b_next!20059) (not mapNonEmpty!36958))
(check-sat b_and!32201 (not b_next!20059))
(get-model)

(declare-fun b!990808 () Bool)

(declare-fun e!558764 () Bool)

(declare-fun call!42001 () Bool)

(assert (=> b!990808 (= e!558764 call!42001)))

(declare-fun b!990809 () Bool)

(declare-fun e!558763 () Bool)

(assert (=> b!990809 (= e!558763 e!558764)))

(declare-fun c!100663 () Bool)

(assert (=> b!990809 (= c!100663 (validKeyInArray!0 (select (arr!30126 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990810 () Bool)

(declare-fun e!558762 () Bool)

(assert (=> b!990810 (= e!558762 e!558763)))

(declare-fun res!662302 () Bool)

(assert (=> b!990810 (=> (not res!662302) (not e!558763))))

(declare-fun e!558765 () Bool)

(assert (=> b!990810 (= res!662302 (not e!558765))))

(declare-fun res!662303 () Bool)

(assert (=> b!990810 (=> (not res!662303) (not e!558765))))

(assert (=> b!990810 (= res!662303 (validKeyInArray!0 (select (arr!30126 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117843 () Bool)

(declare-fun res!662301 () Bool)

(assert (=> d!117843 (=> res!662301 e!558762)))

(assert (=> d!117843 (= res!662301 (bvsge #b00000000000000000000000000000000 (size!30606 _keys!1544)))))

(assert (=> d!117843 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20825) e!558762)))

(declare-fun b!990811 () Bool)

(assert (=> b!990811 (= e!558764 call!42001)))

(declare-fun b!990812 () Bool)

(declare-fun contains!5743 (List!20828 (_ BitVec 64)) Bool)

(assert (=> b!990812 (= e!558765 (contains!5743 Nil!20825 (select (arr!30126 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41998 () Bool)

(assert (=> bm!41998 (= call!42001 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100663 (Cons!20824 (select (arr!30126 _keys!1544) #b00000000000000000000000000000000) Nil!20825) Nil!20825)))))

(assert (= (and d!117843 (not res!662301)) b!990810))

(assert (= (and b!990810 res!662303) b!990812))

(assert (= (and b!990810 res!662302) b!990809))

(assert (= (and b!990809 c!100663) b!990811))

(assert (= (and b!990809 (not c!100663)) b!990808))

(assert (= (or b!990811 b!990808) bm!41998))

(declare-fun m!918633 () Bool)

(assert (=> b!990809 m!918633))

(assert (=> b!990809 m!918633))

(declare-fun m!918635 () Bool)

(assert (=> b!990809 m!918635))

(assert (=> b!990810 m!918633))

(assert (=> b!990810 m!918633))

(assert (=> b!990810 m!918635))

(assert (=> b!990812 m!918633))

(assert (=> b!990812 m!918633))

(declare-fun m!918637 () Bool)

(assert (=> b!990812 m!918637))

(assert (=> bm!41998 m!918633))

(declare-fun m!918639 () Bool)

(assert (=> bm!41998 m!918639))

(assert (=> b!990737 d!117843))

(declare-fun b!990821 () Bool)

(declare-fun e!558772 () Bool)

(declare-fun call!42004 () Bool)

(assert (=> b!990821 (= e!558772 call!42004)))

(declare-fun d!117845 () Bool)

(declare-fun res!662309 () Bool)

(declare-fun e!558774 () Bool)

(assert (=> d!117845 (=> res!662309 e!558774)))

(assert (=> d!117845 (= res!662309 (bvsge #b00000000000000000000000000000000 (size!30606 _keys!1544)))))

(assert (=> d!117845 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!558774)))

(declare-fun b!990822 () Bool)

(declare-fun e!558773 () Bool)

(assert (=> b!990822 (= e!558773 call!42004)))

(declare-fun bm!42001 () Bool)

(assert (=> bm!42001 (= call!42004 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!990823 () Bool)

(assert (=> b!990823 (= e!558773 e!558772)))

(declare-fun lt!439491 () (_ BitVec 64))

(assert (=> b!990823 (= lt!439491 (select (arr!30126 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32843 0))(
  ( (Unit!32844) )
))
(declare-fun lt!439490 () Unit!32843)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62556 (_ BitVec 64) (_ BitVec 32)) Unit!32843)

(assert (=> b!990823 (= lt!439490 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439491 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!990823 (arrayContainsKey!0 _keys!1544 lt!439491 #b00000000000000000000000000000000)))

(declare-fun lt!439492 () Unit!32843)

(assert (=> b!990823 (= lt!439492 lt!439490)))

(declare-fun res!662308 () Bool)

(declare-datatypes ((SeekEntryResult!9166 0))(
  ( (MissingZero!9166 (index!39035 (_ BitVec 32))) (Found!9166 (index!39036 (_ BitVec 32))) (Intermediate!9166 (undefined!9978 Bool) (index!39037 (_ BitVec 32)) (x!86101 (_ BitVec 32))) (Undefined!9166) (MissingVacant!9166 (index!39038 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62556 (_ BitVec 32)) SeekEntryResult!9166)

(assert (=> b!990823 (= res!662308 (= (seekEntryOrOpen!0 (select (arr!30126 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9166 #b00000000000000000000000000000000)))))

(assert (=> b!990823 (=> (not res!662308) (not e!558772))))

(declare-fun b!990824 () Bool)

(assert (=> b!990824 (= e!558774 e!558773)))

(declare-fun c!100666 () Bool)

(assert (=> b!990824 (= c!100666 (validKeyInArray!0 (select (arr!30126 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117845 (not res!662309)) b!990824))

(assert (= (and b!990824 c!100666) b!990823))

(assert (= (and b!990824 (not c!100666)) b!990822))

(assert (= (and b!990823 res!662308) b!990821))

(assert (= (or b!990821 b!990822) bm!42001))

(declare-fun m!918641 () Bool)

(assert (=> bm!42001 m!918641))

(assert (=> b!990823 m!918633))

(declare-fun m!918643 () Bool)

(assert (=> b!990823 m!918643))

(declare-fun m!918645 () Bool)

(assert (=> b!990823 m!918645))

(assert (=> b!990823 m!918633))

(declare-fun m!918647 () Bool)

(assert (=> b!990823 m!918647))

(assert (=> b!990824 m!918633))

(assert (=> b!990824 m!918633))

(assert (=> b!990824 m!918635))

(assert (=> b!990728 d!117845))

(declare-fun d!117847 () Bool)

(assert (=> d!117847 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84802 d!117847))

(declare-fun d!117849 () Bool)

(assert (=> d!117849 (= (array_inv!23301 _values!1278) (bvsge (size!30607 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84802 d!117849))

(declare-fun d!117851 () Bool)

(assert (=> d!117851 (= (array_inv!23302 _keys!1544) (bvsge (size!30606 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84802 d!117851))

(declare-fun d!117853 () Bool)

(assert (=> d!117853 (= (validKeyInArray!0 (select (arr!30126 _keys!1544) from!1932)) (and (not (= (select (arr!30126 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30126 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990736 d!117853))

(declare-fun b!990849 () Bool)

(declare-fun lt!439510 () Unit!32843)

(declare-fun lt!439511 () Unit!32843)

(assert (=> b!990849 (= lt!439510 lt!439511)))

(declare-fun lt!439513 () (_ BitVec 64))

(declare-fun lt!439512 () ListLongMap!13619)

(declare-fun lt!439507 () (_ BitVec 64))

(declare-fun lt!439509 () V!36017)

(declare-fun contains!5744 (ListLongMap!13619 (_ BitVec 64)) Bool)

(declare-fun +!3114 (ListLongMap!13619 tuple2!14920) ListLongMap!13619)

(assert (=> b!990849 (not (contains!5744 (+!3114 lt!439512 (tuple2!14921 lt!439507 lt!439509)) lt!439513))))

(declare-fun addStillNotContains!237 (ListLongMap!13619 (_ BitVec 64) V!36017 (_ BitVec 64)) Unit!32843)

(assert (=> b!990849 (= lt!439511 (addStillNotContains!237 lt!439512 lt!439507 lt!439509 lt!439513))))

(assert (=> b!990849 (= lt!439513 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!15662 (ValueCell!11156 V!36017) V!36017)

(declare-fun dynLambda!1897 (Int (_ BitVec 64)) V!36017)

(assert (=> b!990849 (= lt!439509 (get!15662 (select (arr!30127 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1897 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!990849 (= lt!439507 (select (arr!30126 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun call!42007 () ListLongMap!13619)

(assert (=> b!990849 (= lt!439512 call!42007)))

(declare-fun e!558795 () ListLongMap!13619)

(assert (=> b!990849 (= e!558795 (+!3114 call!42007 (tuple2!14921 (select (arr!30126 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15662 (select (arr!30127 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1897 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!990850 () Bool)

(assert (=> b!990850 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(assert (=> b!990850 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30607 _values!1278)))))

(declare-fun lt!439508 () ListLongMap!13619)

(declare-fun e!558790 () Bool)

(declare-fun apply!905 (ListLongMap!13619 (_ BitVec 64)) V!36017)

(assert (=> b!990850 (= e!558790 (= (apply!905 lt!439508 (select (arr!30126 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15662 (select (arr!30127 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1897 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!990851 () Bool)

(declare-fun e!558791 () ListLongMap!13619)

(assert (=> b!990851 (= e!558791 e!558795)))

(declare-fun c!100676 () Bool)

(assert (=> b!990851 (= c!100676 (validKeyInArray!0 (select (arr!30126 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun bm!42004 () Bool)

(assert (=> bm!42004 (= call!42007 (getCurrentListMapNoExtraKeys!3553 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!990852 () Bool)

(declare-fun e!558789 () Bool)

(assert (=> b!990852 (= e!558789 e!558790)))

(assert (=> b!990852 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(declare-fun res!662321 () Bool)

(assert (=> b!990852 (= res!662321 (contains!5744 lt!439508 (select (arr!30126 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990852 (=> (not res!662321) (not e!558790))))

(declare-fun b!990853 () Bool)

(declare-fun e!558792 () Bool)

(assert (=> b!990853 (= e!558792 (= lt!439508 (getCurrentListMapNoExtraKeys!3553 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun d!117855 () Bool)

(declare-fun e!558794 () Bool)

(assert (=> d!117855 e!558794))

(declare-fun res!662318 () Bool)

(assert (=> d!117855 (=> (not res!662318) (not e!558794))))

(assert (=> d!117855 (= res!662318 (not (contains!5744 lt!439508 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117855 (= lt!439508 e!558791)))

(declare-fun c!100675 () Bool)

(assert (=> d!117855 (= c!100675 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(assert (=> d!117855 (validMask!0 mask!1948)))

(assert (=> d!117855 (= (getCurrentListMapNoExtraKeys!3553 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439508)))

(declare-fun b!990854 () Bool)

(assert (=> b!990854 (= e!558791 (ListLongMap!13620 Nil!20824))))

(declare-fun b!990855 () Bool)

(declare-fun isEmpty!731 (ListLongMap!13619) Bool)

(assert (=> b!990855 (= e!558792 (isEmpty!731 lt!439508))))

(declare-fun b!990856 () Bool)

(assert (=> b!990856 (= e!558789 e!558792)))

(declare-fun c!100677 () Bool)

(assert (=> b!990856 (= c!100677 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(declare-fun b!990857 () Bool)

(declare-fun e!558793 () Bool)

(assert (=> b!990857 (= e!558793 (validKeyInArray!0 (select (arr!30126 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990857 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!990858 () Bool)

(assert (=> b!990858 (= e!558794 e!558789)))

(declare-fun c!100678 () Bool)

(assert (=> b!990858 (= c!100678 e!558793)))

(declare-fun res!662320 () Bool)

(assert (=> b!990858 (=> (not res!662320) (not e!558793))))

(assert (=> b!990858 (= res!662320 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30606 _keys!1544)))))

(declare-fun b!990859 () Bool)

(declare-fun res!662319 () Bool)

(assert (=> b!990859 (=> (not res!662319) (not e!558794))))

(assert (=> b!990859 (= res!662319 (not (contains!5744 lt!439508 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990860 () Bool)

(assert (=> b!990860 (= e!558795 call!42007)))

(assert (= (and d!117855 c!100675) b!990854))

(assert (= (and d!117855 (not c!100675)) b!990851))

(assert (= (and b!990851 c!100676) b!990849))

(assert (= (and b!990851 (not c!100676)) b!990860))

(assert (= (or b!990849 b!990860) bm!42004))

(assert (= (and d!117855 res!662318) b!990859))

(assert (= (and b!990859 res!662319) b!990858))

(assert (= (and b!990858 res!662320) b!990857))

(assert (= (and b!990858 c!100678) b!990852))

(assert (= (and b!990858 (not c!100678)) b!990856))

(assert (= (and b!990852 res!662321) b!990850))

(assert (= (and b!990856 c!100677) b!990853))

(assert (= (and b!990856 (not c!100677)) b!990855))

(declare-fun b_lambda!15151 () Bool)

(assert (=> (not b_lambda!15151) (not b!990849)))

(declare-fun t!29780 () Bool)

(declare-fun tb!6801 () Bool)

(assert (=> (and start!84802 (= defaultEntry!1281 defaultEntry!1281) t!29780) tb!6801))

(declare-fun result!13609 () Bool)

(assert (=> tb!6801 (= result!13609 tp_is_empty!23275)))

(assert (=> b!990849 t!29780))

(declare-fun b_and!32207 () Bool)

(assert (= b_and!32201 (and (=> t!29780 result!13609) b_and!32207)))

(declare-fun b_lambda!15153 () Bool)

(assert (=> (not b_lambda!15153) (not b!990850)))

(assert (=> b!990850 t!29780))

(declare-fun b_and!32209 () Bool)

(assert (= b_and!32207 (and (=> t!29780 result!13609) b_and!32209)))

(declare-fun m!918649 () Bool)

(assert (=> b!990849 m!918649))

(declare-fun m!918651 () Bool)

(assert (=> b!990849 m!918651))

(declare-fun m!918653 () Bool)

(assert (=> b!990849 m!918653))

(declare-fun m!918655 () Bool)

(assert (=> b!990849 m!918655))

(assert (=> b!990849 m!918651))

(declare-fun m!918657 () Bool)

(assert (=> b!990849 m!918657))

(declare-fun m!918659 () Bool)

(assert (=> b!990849 m!918659))

(assert (=> b!990849 m!918649))

(declare-fun m!918661 () Bool)

(assert (=> b!990849 m!918661))

(assert (=> b!990849 m!918653))

(declare-fun m!918663 () Bool)

(assert (=> b!990849 m!918663))

(assert (=> b!990857 m!918657))

(assert (=> b!990857 m!918657))

(declare-fun m!918665 () Bool)

(assert (=> b!990857 m!918665))

(declare-fun m!918667 () Bool)

(assert (=> bm!42004 m!918667))

(declare-fun m!918669 () Bool)

(assert (=> b!990855 m!918669))

(declare-fun m!918671 () Bool)

(assert (=> d!117855 m!918671))

(assert (=> d!117855 m!918591))

(assert (=> b!990850 m!918651))

(assert (=> b!990850 m!918653))

(assert (=> b!990850 m!918655))

(assert (=> b!990850 m!918651))

(assert (=> b!990850 m!918657))

(assert (=> b!990850 m!918657))

(declare-fun m!918673 () Bool)

(assert (=> b!990850 m!918673))

(assert (=> b!990850 m!918653))

(assert (=> b!990852 m!918657))

(assert (=> b!990852 m!918657))

(declare-fun m!918675 () Bool)

(assert (=> b!990852 m!918675))

(assert (=> b!990853 m!918667))

(declare-fun m!918677 () Bool)

(assert (=> b!990859 m!918677))

(assert (=> b!990851 m!918657))

(assert (=> b!990851 m!918657))

(assert (=> b!990851 m!918665))

(assert (=> b!990732 d!117855))

(declare-fun mapIsEmpty!36967 () Bool)

(declare-fun mapRes!36967 () Bool)

(assert (=> mapIsEmpty!36967 mapRes!36967))

(declare-fun condMapEmpty!36967 () Bool)

(declare-fun mapDefault!36967 () ValueCell!11156)

(assert (=> mapNonEmpty!36958 (= condMapEmpty!36967 (= mapRest!36958 ((as const (Array (_ BitVec 32) ValueCell!11156)) mapDefault!36967)))))

(declare-fun e!558801 () Bool)

(assert (=> mapNonEmpty!36958 (= tp!69969 (and e!558801 mapRes!36967))))

(declare-fun mapNonEmpty!36967 () Bool)

(declare-fun tp!69985 () Bool)

(declare-fun e!558800 () Bool)

(assert (=> mapNonEmpty!36967 (= mapRes!36967 (and tp!69985 e!558800))))

(declare-fun mapRest!36967 () (Array (_ BitVec 32) ValueCell!11156))

(declare-fun mapKey!36967 () (_ BitVec 32))

(declare-fun mapValue!36967 () ValueCell!11156)

(assert (=> mapNonEmpty!36967 (= mapRest!36958 (store mapRest!36967 mapKey!36967 mapValue!36967))))

(declare-fun b!990870 () Bool)

(assert (=> b!990870 (= e!558801 tp_is_empty!23275)))

(declare-fun b!990869 () Bool)

(assert (=> b!990869 (= e!558800 tp_is_empty!23275)))

(assert (= (and mapNonEmpty!36958 condMapEmpty!36967) mapIsEmpty!36967))

(assert (= (and mapNonEmpty!36958 (not condMapEmpty!36967)) mapNonEmpty!36967))

(assert (= (and mapNonEmpty!36967 ((_ is ValueCellFull!11156) mapValue!36967)) b!990869))

(assert (= (and mapNonEmpty!36958 ((_ is ValueCellFull!11156) mapDefault!36967)) b!990870))

(declare-fun m!918679 () Bool)

(assert (=> mapNonEmpty!36967 m!918679))

(declare-fun b_lambda!15155 () Bool)

(assert (= b_lambda!15153 (or (and start!84802 b_free!20059) b_lambda!15155)))

(declare-fun b_lambda!15157 () Bool)

(assert (= b_lambda!15151 (or (and start!84802 b_free!20059) b_lambda!15157)))

(check-sat (not d!117855) (not b!990809) (not bm!42004) (not b_next!20059) (not b!990857) (not b!990852) (not b!990853) (not b!990812) (not bm!42001) (not b!990823) (not b_lambda!15155) (not b!990851) b_and!32209 (not b!990810) tp_is_empty!23275 (not b!990855) (not b!990824) (not b_lambda!15157) (not b!990849) (not mapNonEmpty!36967) (not bm!41998) (not b!990850) (not b!990859))
(check-sat b_and!32209 (not b_next!20059))
