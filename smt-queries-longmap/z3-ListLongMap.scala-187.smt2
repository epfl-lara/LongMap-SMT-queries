; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3722 () Bool)

(assert start!3722)

(declare-fun res!15459 () Bool)

(declare-fun e!16871 () Bool)

(assert (=> start!3722 (=> (not res!15459) (not e!16871))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3722 (= res!15459 (validMask!0 mask!2294))))

(assert (=> start!3722 e!16871))

(assert (=> start!3722 true))

(declare-datatypes ((V!1245 0))(
  ( (V!1246 (val!559 Int)) )
))
(declare-datatypes ((ValueCell!333 0))(
  ( (ValueCellFull!333 (v!1644 V!1245)) (EmptyCell!333) )
))
(declare-datatypes ((array!1373 0))(
  ( (array!1374 (arr!646 (Array (_ BitVec 32) ValueCell!333)) (size!747 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1373)

(declare-fun e!16872 () Bool)

(declare-fun array_inv!435 (array!1373) Bool)

(assert (=> start!3722 (and (array_inv!435 _values!1501) e!16872)))

(declare-datatypes ((array!1375 0))(
  ( (array!1376 (arr!647 (Array (_ BitVec 32) (_ BitVec 64))) (size!748 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1375)

(declare-fun array_inv!436 (array!1375) Bool)

(assert (=> start!3722 (array_inv!436 _keys!1833)))

(declare-fun b!25999 () Bool)

(declare-fun res!15457 () Bool)

(assert (=> b!25999 (=> (not res!15457) (not e!16871))))

(assert (=> b!25999 (= res!15457 (and (bvsle #b00000000000000000000000000000000 (size!748 _keys!1833)) (bvslt (size!748 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun b!26000 () Bool)

(declare-fun e!16875 () Bool)

(declare-fun tp_is_empty!1065 () Bool)

(assert (=> b!26000 (= e!16875 tp_is_empty!1065)))

(declare-fun b!26001 () Bool)

(declare-fun res!15458 () Bool)

(assert (=> b!26001 (=> (not res!15458) (not e!16871))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26001 (= res!15458 (and (= (size!747 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!748 _keys!1833) (size!747 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26002 () Bool)

(declare-datatypes ((List!576 0))(
  ( (Nil!573) (Cons!572 (h!1139 (_ BitVec 64)) (t!3263 List!576)) )
))
(declare-fun noDuplicate!11 (List!576) Bool)

(assert (=> b!26002 (= e!16871 (not (noDuplicate!11 Nil!573)))))

(declare-fun b!26003 () Bool)

(declare-fun res!15460 () Bool)

(assert (=> b!26003 (=> (not res!15460) (not e!16871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1375 (_ BitVec 32)) Bool)

(assert (=> b!26003 (= res!15460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26004 () Bool)

(declare-fun mapRes!1108 () Bool)

(assert (=> b!26004 (= e!16872 (and e!16875 mapRes!1108))))

(declare-fun condMapEmpty!1108 () Bool)

(declare-fun mapDefault!1108 () ValueCell!333)

(assert (=> b!26004 (= condMapEmpty!1108 (= (arr!646 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!333)) mapDefault!1108)))))

(declare-fun mapIsEmpty!1108 () Bool)

(assert (=> mapIsEmpty!1108 mapRes!1108))

(declare-fun b!26005 () Bool)

(declare-fun e!16873 () Bool)

(assert (=> b!26005 (= e!16873 tp_is_empty!1065)))

(declare-fun mapNonEmpty!1108 () Bool)

(declare-fun tp!3628 () Bool)

(assert (=> mapNonEmpty!1108 (= mapRes!1108 (and tp!3628 e!16873))))

(declare-fun mapValue!1108 () ValueCell!333)

(declare-fun mapKey!1108 () (_ BitVec 32))

(declare-fun mapRest!1108 () (Array (_ BitVec 32) ValueCell!333))

(assert (=> mapNonEmpty!1108 (= (arr!646 _values!1501) (store mapRest!1108 mapKey!1108 mapValue!1108))))

(assert (= (and start!3722 res!15459) b!26001))

(assert (= (and b!26001 res!15458) b!26003))

(assert (= (and b!26003 res!15460) b!25999))

(assert (= (and b!25999 res!15457) b!26002))

(assert (= (and b!26004 condMapEmpty!1108) mapIsEmpty!1108))

(assert (= (and b!26004 (not condMapEmpty!1108)) mapNonEmpty!1108))

(get-info :version)

(assert (= (and mapNonEmpty!1108 ((_ is ValueCellFull!333) mapValue!1108)) b!26005))

(assert (= (and b!26004 ((_ is ValueCellFull!333) mapDefault!1108)) b!26000))

(assert (= start!3722 b!26004))

(declare-fun m!20923 () Bool)

(assert (=> start!3722 m!20923))

(declare-fun m!20925 () Bool)

(assert (=> start!3722 m!20925))

(declare-fun m!20927 () Bool)

(assert (=> start!3722 m!20927))

(declare-fun m!20929 () Bool)

(assert (=> b!26002 m!20929))

(declare-fun m!20931 () Bool)

(assert (=> b!26003 m!20931))

(declare-fun m!20933 () Bool)

(assert (=> mapNonEmpty!1108 m!20933))

(check-sat (not start!3722) (not b!26003) (not mapNonEmpty!1108) (not b!26002) tp_is_empty!1065)
(check-sat)
(get-model)

(declare-fun d!4851 () Bool)

(assert (=> d!4851 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3722 d!4851))

(declare-fun d!4853 () Bool)

(assert (=> d!4853 (= (array_inv!435 _values!1501) (bvsge (size!747 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3722 d!4853))

(declare-fun d!4855 () Bool)

(assert (=> d!4855 (= (array_inv!436 _keys!1833) (bvsge (size!748 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3722 d!4855))

(declare-fun d!4857 () Bool)

(declare-fun res!15477 () Bool)

(declare-fun e!16895 () Bool)

(assert (=> d!4857 (=> res!15477 e!16895)))

(assert (=> d!4857 (= res!15477 ((_ is Nil!573) Nil!573))))

(assert (=> d!4857 (= (noDuplicate!11 Nil!573) e!16895)))

(declare-fun b!26031 () Bool)

(declare-fun e!16896 () Bool)

(assert (=> b!26031 (= e!16895 e!16896)))

(declare-fun res!15478 () Bool)

(assert (=> b!26031 (=> (not res!15478) (not e!16896))))

(declare-fun contains!235 (List!576 (_ BitVec 64)) Bool)

(assert (=> b!26031 (= res!15478 (not (contains!235 (t!3263 Nil!573) (h!1139 Nil!573))))))

(declare-fun b!26032 () Bool)

(assert (=> b!26032 (= e!16896 (noDuplicate!11 (t!3263 Nil!573)))))

(assert (= (and d!4857 (not res!15477)) b!26031))

(assert (= (and b!26031 res!15478) b!26032))

(declare-fun m!20947 () Bool)

(assert (=> b!26031 m!20947))

(declare-fun m!20949 () Bool)

(assert (=> b!26032 m!20949))

(assert (=> b!26002 d!4857))

(declare-fun d!4859 () Bool)

(declare-fun res!15484 () Bool)

(declare-fun e!16903 () Bool)

(assert (=> d!4859 (=> res!15484 e!16903)))

(assert (=> d!4859 (= res!15484 (bvsge #b00000000000000000000000000000000 (size!748 _keys!1833)))))

(assert (=> d!4859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!16903)))

(declare-fun b!26041 () Bool)

(declare-fun e!16904 () Bool)

(assert (=> b!26041 (= e!16903 e!16904)))

(declare-fun c!3647 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26041 (= c!3647 (validKeyInArray!0 (select (arr!647 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!26042 () Bool)

(declare-fun e!16905 () Bool)

(declare-fun call!2498 () Bool)

(assert (=> b!26042 (= e!16905 call!2498)))

(declare-fun bm!2495 () Bool)

(assert (=> bm!2495 (= call!2498 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!26043 () Bool)

(assert (=> b!26043 (= e!16904 call!2498)))

(declare-fun b!26044 () Bool)

(assert (=> b!26044 (= e!16904 e!16905)))

(declare-fun lt!10305 () (_ BitVec 64))

(assert (=> b!26044 (= lt!10305 (select (arr!647 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!621 0))(
  ( (Unit!622) )
))
(declare-fun lt!10304 () Unit!621)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1375 (_ BitVec 64) (_ BitVec 32)) Unit!621)

(assert (=> b!26044 (= lt!10304 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10305 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!26044 (arrayContainsKey!0 _keys!1833 lt!10305 #b00000000000000000000000000000000)))

(declare-fun lt!10306 () Unit!621)

(assert (=> b!26044 (= lt!10306 lt!10304)))

(declare-fun res!15483 () Bool)

(declare-datatypes ((SeekEntryResult!59 0))(
  ( (MissingZero!59 (index!2358 (_ BitVec 32))) (Found!59 (index!2359 (_ BitVec 32))) (Intermediate!59 (undefined!871 Bool) (index!2360 (_ BitVec 32)) (x!6063 (_ BitVec 32))) (Undefined!59) (MissingVacant!59 (index!2361 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1375 (_ BitVec 32)) SeekEntryResult!59)

(assert (=> b!26044 (= res!15483 (= (seekEntryOrOpen!0 (select (arr!647 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!59 #b00000000000000000000000000000000)))))

(assert (=> b!26044 (=> (not res!15483) (not e!16905))))

(assert (= (and d!4859 (not res!15484)) b!26041))

(assert (= (and b!26041 c!3647) b!26044))

(assert (= (and b!26041 (not c!3647)) b!26043))

(assert (= (and b!26044 res!15483) b!26042))

(assert (= (or b!26042 b!26043) bm!2495))

(declare-fun m!20951 () Bool)

(assert (=> b!26041 m!20951))

(assert (=> b!26041 m!20951))

(declare-fun m!20953 () Bool)

(assert (=> b!26041 m!20953))

(declare-fun m!20955 () Bool)

(assert (=> bm!2495 m!20955))

(assert (=> b!26044 m!20951))

(declare-fun m!20957 () Bool)

(assert (=> b!26044 m!20957))

(declare-fun m!20959 () Bool)

(assert (=> b!26044 m!20959))

(assert (=> b!26044 m!20951))

(declare-fun m!20961 () Bool)

(assert (=> b!26044 m!20961))

(assert (=> b!26003 d!4859))

(declare-fun b!26052 () Bool)

(declare-fun e!16911 () Bool)

(assert (=> b!26052 (= e!16911 tp_is_empty!1065)))

(declare-fun mapIsEmpty!1114 () Bool)

(declare-fun mapRes!1114 () Bool)

(assert (=> mapIsEmpty!1114 mapRes!1114))

(declare-fun mapNonEmpty!1114 () Bool)

(declare-fun tp!3634 () Bool)

(declare-fun e!16910 () Bool)

(assert (=> mapNonEmpty!1114 (= mapRes!1114 (and tp!3634 e!16910))))

(declare-fun mapRest!1114 () (Array (_ BitVec 32) ValueCell!333))

(declare-fun mapKey!1114 () (_ BitVec 32))

(declare-fun mapValue!1114 () ValueCell!333)

(assert (=> mapNonEmpty!1114 (= mapRest!1108 (store mapRest!1114 mapKey!1114 mapValue!1114))))

(declare-fun condMapEmpty!1114 () Bool)

(declare-fun mapDefault!1114 () ValueCell!333)

(assert (=> mapNonEmpty!1108 (= condMapEmpty!1114 (= mapRest!1108 ((as const (Array (_ BitVec 32) ValueCell!333)) mapDefault!1114)))))

(assert (=> mapNonEmpty!1108 (= tp!3628 (and e!16911 mapRes!1114))))

(declare-fun b!26051 () Bool)

(assert (=> b!26051 (= e!16910 tp_is_empty!1065)))

(assert (= (and mapNonEmpty!1108 condMapEmpty!1114) mapIsEmpty!1114))

(assert (= (and mapNonEmpty!1108 (not condMapEmpty!1114)) mapNonEmpty!1114))

(assert (= (and mapNonEmpty!1114 ((_ is ValueCellFull!333) mapValue!1114)) b!26051))

(assert (= (and mapNonEmpty!1108 ((_ is ValueCellFull!333) mapDefault!1114)) b!26052))

(declare-fun m!20963 () Bool)

(assert (=> mapNonEmpty!1114 m!20963))

(check-sat (not b!26041) (not b!26031) (not mapNonEmpty!1114) (not b!26032) (not bm!2495) (not b!26044) tp_is_empty!1065)
(check-sat)
