; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35850 () Bool)

(assert start!35850)

(declare-fun b!360526 () Bool)

(declare-fun e!220722 () Bool)

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!20164 0))(
  ( (array!20165 (arr!9575 (Array (_ BitVec 32) (_ BitVec 64))) (size!9927 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20164)

(assert (=> b!360526 (= e!220722 (not (and (bvsge (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1805) (size!9927 _keys!1456)))))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20164 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360526 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!12067 0))(
  ( (V!12068 (val!4203 Int)) )
))
(declare-fun minValue!1150 () V!12067)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!11081 0))(
  ( (Unit!11082) )
))
(declare-fun lt!166481 () Unit!11081)

(declare-datatypes ((ValueCell!3815 0))(
  ( (ValueCellFull!3815 (v!6398 V!12067)) (EmptyCell!3815) )
))
(declare-datatypes ((array!20166 0))(
  ( (array!20167 (arr!9576 (Array (_ BitVec 32) ValueCell!3815)) (size!9928 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20166)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12067)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!62 (array!20164 array!20166 (_ BitVec 32) (_ BitVec 32) V!12067 V!12067 (_ BitVec 64) (_ BitVec 32)) Unit!11081)

(assert (=> b!360526 (= lt!166481 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!62 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360527 () Bool)

(declare-fun res!200556 () Bool)

(assert (=> b!360527 (=> (not res!200556) (not e!220722))))

(assert (=> b!360527 (= res!200556 (and (= (size!9928 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9927 _keys!1456) (size!9928 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360528 () Bool)

(declare-fun e!220720 () Bool)

(declare-fun tp_is_empty!8317 () Bool)

(assert (=> b!360528 (= e!220720 tp_is_empty!8317)))

(declare-fun b!360529 () Bool)

(declare-fun e!220719 () Bool)

(assert (=> b!360529 (= e!220719 tp_is_empty!8317)))

(declare-fun b!360530 () Bool)

(declare-fun res!200555 () Bool)

(assert (=> b!360530 (=> (not res!200555) (not e!220722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360530 (= res!200555 (validKeyInArray!0 k0!1077))))

(declare-fun b!360531 () Bool)

(declare-fun res!200553 () Bool)

(assert (=> b!360531 (=> (not res!200553) (not e!220722))))

(assert (=> b!360531 (= res!200553 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9927 _keys!1456))))))

(declare-fun b!360532 () Bool)

(declare-fun res!200554 () Bool)

(assert (=> b!360532 (=> (not res!200554) (not e!220722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20164 (_ BitVec 32)) Bool)

(assert (=> b!360532 (= res!200554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13983 () Bool)

(declare-fun mapRes!13983 () Bool)

(assert (=> mapIsEmpty!13983 mapRes!13983))

(declare-fun b!360533 () Bool)

(declare-fun res!200559 () Bool)

(assert (=> b!360533 (=> (not res!200559) (not e!220722))))

(assert (=> b!360533 (= res!200559 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13983 () Bool)

(declare-fun tp!28050 () Bool)

(assert (=> mapNonEmpty!13983 (= mapRes!13983 (and tp!28050 e!220720))))

(declare-fun mapValue!13983 () ValueCell!3815)

(declare-fun mapKey!13983 () (_ BitVec 32))

(declare-fun mapRest!13983 () (Array (_ BitVec 32) ValueCell!3815))

(assert (=> mapNonEmpty!13983 (= (arr!9576 _values!1208) (store mapRest!13983 mapKey!13983 mapValue!13983))))

(declare-fun b!360534 () Bool)

(declare-fun res!200558 () Bool)

(assert (=> b!360534 (=> (not res!200558) (not e!220722))))

(declare-datatypes ((List!5404 0))(
  ( (Nil!5401) (Cons!5400 (h!6256 (_ BitVec 64)) (t!10546 List!5404)) )
))
(declare-fun arrayNoDuplicates!0 (array!20164 (_ BitVec 32) List!5404) Bool)

(assert (=> b!360534 (= res!200558 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5401))))

(declare-fun res!200557 () Bool)

(assert (=> start!35850 (=> (not res!200557) (not e!220722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35850 (= res!200557 (validMask!0 mask!1842))))

(assert (=> start!35850 e!220722))

(assert (=> start!35850 tp_is_empty!8317))

(assert (=> start!35850 true))

(declare-fun array_inv!7078 (array!20164) Bool)

(assert (=> start!35850 (array_inv!7078 _keys!1456)))

(declare-fun e!220723 () Bool)

(declare-fun array_inv!7079 (array!20166) Bool)

(assert (=> start!35850 (and (array_inv!7079 _values!1208) e!220723)))

(declare-fun b!360535 () Bool)

(declare-fun res!200560 () Bool)

(assert (=> b!360535 (=> (not res!200560) (not e!220722))))

(assert (=> b!360535 (= res!200560 (not (= (select (arr!9575 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360536 () Bool)

(assert (=> b!360536 (= e!220723 (and e!220719 mapRes!13983))))

(declare-fun condMapEmpty!13983 () Bool)

(declare-fun mapDefault!13983 () ValueCell!3815)

(assert (=> b!360536 (= condMapEmpty!13983 (= (arr!9576 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3815)) mapDefault!13983)))))

(assert (= (and start!35850 res!200557) b!360527))

(assert (= (and b!360527 res!200556) b!360532))

(assert (= (and b!360532 res!200554) b!360534))

(assert (= (and b!360534 res!200558) b!360530))

(assert (= (and b!360530 res!200555) b!360531))

(assert (= (and b!360531 res!200553) b!360533))

(assert (= (and b!360533 res!200559) b!360535))

(assert (= (and b!360535 res!200560) b!360526))

(assert (= (and b!360536 condMapEmpty!13983) mapIsEmpty!13983))

(assert (= (and b!360536 (not condMapEmpty!13983)) mapNonEmpty!13983))

(get-info :version)

(assert (= (and mapNonEmpty!13983 ((_ is ValueCellFull!3815) mapValue!13983)) b!360528))

(assert (= (and b!360536 ((_ is ValueCellFull!3815) mapDefault!13983)) b!360529))

(assert (= start!35850 b!360536))

(declare-fun m!357921 () Bool)

(assert (=> mapNonEmpty!13983 m!357921))

(declare-fun m!357923 () Bool)

(assert (=> b!360533 m!357923))

(declare-fun m!357925 () Bool)

(assert (=> b!360526 m!357925))

(declare-fun m!357927 () Bool)

(assert (=> b!360526 m!357927))

(declare-fun m!357929 () Bool)

(assert (=> b!360530 m!357929))

(declare-fun m!357931 () Bool)

(assert (=> start!35850 m!357931))

(declare-fun m!357933 () Bool)

(assert (=> start!35850 m!357933))

(declare-fun m!357935 () Bool)

(assert (=> start!35850 m!357935))

(declare-fun m!357937 () Bool)

(assert (=> b!360534 m!357937))

(declare-fun m!357939 () Bool)

(assert (=> b!360535 m!357939))

(declare-fun m!357941 () Bool)

(assert (=> b!360532 m!357941))

(check-sat (not b!360533) (not b!360532) (not b!360530) (not b!360534) (not start!35850) (not mapNonEmpty!13983) tp_is_empty!8317 (not b!360526))
(check-sat)
(get-model)

(declare-fun d!71881 () Bool)

(assert (=> d!71881 (= (validKeyInArray!0 k0!1077) (and (not (= k0!1077 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1077 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!360530 d!71881))

(declare-fun d!71883 () Bool)

(assert (=> d!71883 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35850 d!71883))

(declare-fun d!71885 () Bool)

(assert (=> d!71885 (= (array_inv!7078 _keys!1456) (bvsge (size!9927 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35850 d!71885))

(declare-fun d!71887 () Bool)

(assert (=> d!71887 (= (array_inv!7079 _values!1208) (bvsge (size!9928 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35850 d!71887))

(declare-fun d!71889 () Bool)

(declare-fun res!200613 () Bool)

(declare-fun e!220758 () Bool)

(assert (=> d!71889 (=> res!200613 e!220758)))

(assert (=> d!71889 (= res!200613 (= (select (arr!9575 _keys!1456) (bvadd #b00000000000000000000000000000001 from!1805)) k0!1077))))

(assert (=> d!71889 (= (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805)) e!220758)))

(declare-fun b!360607 () Bool)

(declare-fun e!220759 () Bool)

(assert (=> b!360607 (= e!220758 e!220759)))

(declare-fun res!200614 () Bool)

(assert (=> b!360607 (=> (not res!200614) (not e!220759))))

(assert (=> b!360607 (= res!200614 (bvslt (bvadd #b00000000000000000000000000000001 from!1805 #b00000000000000000000000000000001) (size!9927 _keys!1456)))))

(declare-fun b!360608 () Bool)

(assert (=> b!360608 (= e!220759 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805 #b00000000000000000000000000000001)))))

(assert (= (and d!71889 (not res!200613)) b!360607))

(assert (= (and b!360607 res!200614) b!360608))

(declare-fun m!357987 () Bool)

(assert (=> d!71889 m!357987))

(declare-fun m!357989 () Bool)

(assert (=> b!360608 m!357989))

(assert (=> b!360526 d!71889))

(declare-fun d!71891 () Bool)

(assert (=> d!71891 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd from!1805 #b00000000000000000000000000000001))))

(declare-fun lt!166490 () Unit!11081)

(declare-fun choose!1317 (array!20164 array!20166 (_ BitVec 32) (_ BitVec 32) V!12067 V!12067 (_ BitVec 64) (_ BitVec 32)) Unit!11081)

(assert (=> d!71891 (= lt!166490 (choose!1317 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(assert (=> d!71891 (validMask!0 mask!1842)))

(assert (=> d!71891 (= (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!62 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805) lt!166490)))

(declare-fun bs!12307 () Bool)

(assert (= bs!12307 d!71891))

(declare-fun m!357991 () Bool)

(assert (=> bs!12307 m!357991))

(declare-fun m!357993 () Bool)

(assert (=> bs!12307 m!357993))

(assert (=> bs!12307 m!357931))

(assert (=> b!360526 d!71891))

(declare-fun d!71893 () Bool)

(declare-fun res!200621 () Bool)

(declare-fun e!220771 () Bool)

(assert (=> d!71893 (=> res!200621 e!220771)))

(assert (=> d!71893 (= res!200621 (bvsge #b00000000000000000000000000000000 (size!9927 _keys!1456)))))

(assert (=> d!71893 (= (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5401) e!220771)))

(declare-fun b!360619 () Bool)

(declare-fun e!220768 () Bool)

(declare-fun e!220769 () Bool)

(assert (=> b!360619 (= e!220768 e!220769)))

(declare-fun c!53687 () Bool)

(assert (=> b!360619 (= c!53687 (validKeyInArray!0 (select (arr!9575 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun bm!27146 () Bool)

(declare-fun call!27149 () Bool)

(assert (=> bm!27146 (= call!27149 (arrayNoDuplicates!0 _keys!1456 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53687 (Cons!5400 (select (arr!9575 _keys!1456) #b00000000000000000000000000000000) Nil!5401) Nil!5401)))))

(declare-fun b!360620 () Bool)

(assert (=> b!360620 (= e!220771 e!220768)))

(declare-fun res!200623 () Bool)

(assert (=> b!360620 (=> (not res!200623) (not e!220768))))

(declare-fun e!220770 () Bool)

(assert (=> b!360620 (= res!200623 (not e!220770))))

(declare-fun res!200622 () Bool)

(assert (=> b!360620 (=> (not res!200622) (not e!220770))))

(assert (=> b!360620 (= res!200622 (validKeyInArray!0 (select (arr!9575 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!360621 () Bool)

(assert (=> b!360621 (= e!220769 call!27149)))

(declare-fun b!360622 () Bool)

(assert (=> b!360622 (= e!220769 call!27149)))

(declare-fun b!360623 () Bool)

(declare-fun contains!2400 (List!5404 (_ BitVec 64)) Bool)

(assert (=> b!360623 (= e!220770 (contains!2400 Nil!5401 (select (arr!9575 _keys!1456) #b00000000000000000000000000000000)))))

(assert (= (and d!71893 (not res!200621)) b!360620))

(assert (= (and b!360620 res!200622) b!360623))

(assert (= (and b!360620 res!200623) b!360619))

(assert (= (and b!360619 c!53687) b!360622))

(assert (= (and b!360619 (not c!53687)) b!360621))

(assert (= (or b!360622 b!360621) bm!27146))

(declare-fun m!357995 () Bool)

(assert (=> b!360619 m!357995))

(assert (=> b!360619 m!357995))

(declare-fun m!357997 () Bool)

(assert (=> b!360619 m!357997))

(assert (=> bm!27146 m!357995))

(declare-fun m!357999 () Bool)

(assert (=> bm!27146 m!357999))

(assert (=> b!360620 m!357995))

(assert (=> b!360620 m!357995))

(assert (=> b!360620 m!357997))

(assert (=> b!360623 m!357995))

(assert (=> b!360623 m!357995))

(declare-fun m!358001 () Bool)

(assert (=> b!360623 m!358001))

(assert (=> b!360534 d!71893))

(declare-fun b!360632 () Bool)

(declare-fun e!220780 () Bool)

(declare-fun call!27152 () Bool)

(assert (=> b!360632 (= e!220780 call!27152)))

(declare-fun d!71895 () Bool)

(declare-fun res!200628 () Bool)

(declare-fun e!220779 () Bool)

(assert (=> d!71895 (=> res!200628 e!220779)))

(assert (=> d!71895 (= res!200628 (bvsge #b00000000000000000000000000000000 (size!9927 _keys!1456)))))

(assert (=> d!71895 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!220779)))

(declare-fun bm!27149 () Bool)

(assert (=> bm!27149 (= call!27152 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!360633 () Bool)

(declare-fun e!220778 () Bool)

(assert (=> b!360633 (= e!220779 e!220778)))

(declare-fun c!53690 () Bool)

(assert (=> b!360633 (= c!53690 (validKeyInArray!0 (select (arr!9575 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!360634 () Bool)

(assert (=> b!360634 (= e!220778 e!220780)))

(declare-fun lt!166497 () (_ BitVec 64))

(assert (=> b!360634 (= lt!166497 (select (arr!9575 _keys!1456) #b00000000000000000000000000000000))))

(declare-fun lt!166499 () Unit!11081)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20164 (_ BitVec 64) (_ BitVec 32)) Unit!11081)

(assert (=> b!360634 (= lt!166499 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!166497 #b00000000000000000000000000000000))))

(assert (=> b!360634 (arrayContainsKey!0 _keys!1456 lt!166497 #b00000000000000000000000000000000)))

(declare-fun lt!166498 () Unit!11081)

(assert (=> b!360634 (= lt!166498 lt!166499)))

(declare-fun res!200629 () Bool)

(declare-datatypes ((SeekEntryResult!3440 0))(
  ( (MissingZero!3440 (index!15939 (_ BitVec 32))) (Found!3440 (index!15940 (_ BitVec 32))) (Intermediate!3440 (undefined!4252 Bool) (index!15941 (_ BitVec 32)) (x!35871 (_ BitVec 32))) (Undefined!3440) (MissingVacant!3440 (index!15942 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20164 (_ BitVec 32)) SeekEntryResult!3440)

(assert (=> b!360634 (= res!200629 (= (seekEntryOrOpen!0 (select (arr!9575 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3440 #b00000000000000000000000000000000)))))

(assert (=> b!360634 (=> (not res!200629) (not e!220780))))

(declare-fun b!360635 () Bool)

(assert (=> b!360635 (= e!220778 call!27152)))

(assert (= (and d!71895 (not res!200628)) b!360633))

(assert (= (and b!360633 c!53690) b!360634))

(assert (= (and b!360633 (not c!53690)) b!360635))

(assert (= (and b!360634 res!200629) b!360632))

(assert (= (or b!360632 b!360635) bm!27149))

(declare-fun m!358003 () Bool)

(assert (=> bm!27149 m!358003))

(assert (=> b!360633 m!357995))

(assert (=> b!360633 m!357995))

(assert (=> b!360633 m!357997))

(assert (=> b!360634 m!357995))

(declare-fun m!358005 () Bool)

(assert (=> b!360634 m!358005))

(declare-fun m!358007 () Bool)

(assert (=> b!360634 m!358007))

(assert (=> b!360634 m!357995))

(declare-fun m!358009 () Bool)

(assert (=> b!360634 m!358009))

(assert (=> b!360532 d!71895))

(declare-fun d!71897 () Bool)

(declare-fun res!200630 () Bool)

(declare-fun e!220781 () Bool)

(assert (=> d!71897 (=> res!200630 e!220781)))

(assert (=> d!71897 (= res!200630 (= (select (arr!9575 _keys!1456) from!1805) k0!1077))))

(assert (=> d!71897 (= (arrayContainsKey!0 _keys!1456 k0!1077 from!1805) e!220781)))

(declare-fun b!360636 () Bool)

(declare-fun e!220782 () Bool)

(assert (=> b!360636 (= e!220781 e!220782)))

(declare-fun res!200631 () Bool)

(assert (=> b!360636 (=> (not res!200631) (not e!220782))))

(assert (=> b!360636 (= res!200631 (bvslt (bvadd from!1805 #b00000000000000000000000000000001) (size!9927 _keys!1456)))))

(declare-fun b!360637 () Bool)

(assert (=> b!360637 (= e!220782 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd from!1805 #b00000000000000000000000000000001)))))

(assert (= (and d!71897 (not res!200630)) b!360636))

(assert (= (and b!360636 res!200631) b!360637))

(assert (=> d!71897 m!357939))

(assert (=> b!360637 m!357991))

(assert (=> b!360533 d!71897))

(declare-fun b!360644 () Bool)

(declare-fun e!220788 () Bool)

(assert (=> b!360644 (= e!220788 tp_is_empty!8317)))

(declare-fun b!360645 () Bool)

(declare-fun e!220787 () Bool)

(assert (=> b!360645 (= e!220787 tp_is_empty!8317)))

(declare-fun condMapEmpty!13992 () Bool)

(declare-fun mapDefault!13992 () ValueCell!3815)

(assert (=> mapNonEmpty!13983 (= condMapEmpty!13992 (= mapRest!13983 ((as const (Array (_ BitVec 32) ValueCell!3815)) mapDefault!13992)))))

(declare-fun mapRes!13992 () Bool)

(assert (=> mapNonEmpty!13983 (= tp!28050 (and e!220787 mapRes!13992))))

(declare-fun mapIsEmpty!13992 () Bool)

(assert (=> mapIsEmpty!13992 mapRes!13992))

(declare-fun mapNonEmpty!13992 () Bool)

(declare-fun tp!28059 () Bool)

(assert (=> mapNonEmpty!13992 (= mapRes!13992 (and tp!28059 e!220788))))

(declare-fun mapValue!13992 () ValueCell!3815)

(declare-fun mapKey!13992 () (_ BitVec 32))

(declare-fun mapRest!13992 () (Array (_ BitVec 32) ValueCell!3815))

(assert (=> mapNonEmpty!13992 (= mapRest!13983 (store mapRest!13992 mapKey!13992 mapValue!13992))))

(assert (= (and mapNonEmpty!13983 condMapEmpty!13992) mapIsEmpty!13992))

(assert (= (and mapNonEmpty!13983 (not condMapEmpty!13992)) mapNonEmpty!13992))

(assert (= (and mapNonEmpty!13992 ((_ is ValueCellFull!3815) mapValue!13992)) b!360644))

(assert (= (and mapNonEmpty!13983 ((_ is ValueCellFull!3815) mapDefault!13992)) b!360645))

(declare-fun m!358011 () Bool)

(assert (=> mapNonEmpty!13992 m!358011))

(check-sat (not b!360620) (not b!360633) (not b!360634) (not d!71891) (not mapNonEmpty!13992) (not b!360637) tp_is_empty!8317 (not b!360623) (not b!360619) (not bm!27149) (not b!360608) (not bm!27146))
(check-sat)
