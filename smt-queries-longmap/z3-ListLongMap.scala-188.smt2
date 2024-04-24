; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3732 () Bool)

(assert start!3732)

(declare-fun b!26000 () Bool)

(declare-fun res!15462 () Bool)

(declare-fun e!16876 () Bool)

(assert (=> b!26000 (=> (not res!15462) (not e!16876))))

(declare-datatypes ((V!1251 0))(
  ( (V!1252 (val!561 Int)) )
))
(declare-datatypes ((ValueCell!335 0))(
  ( (ValueCellFull!335 (v!1646 V!1251)) (EmptyCell!335) )
))
(declare-datatypes ((array!1369 0))(
  ( (array!1370 (arr!643 (Array (_ BitVec 32) ValueCell!335)) (size!744 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1369)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1371 0))(
  ( (array!1372 (arr!644 (Array (_ BitVec 32) (_ BitVec 64))) (size!745 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1371)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!26000 (= res!15462 (and (= (size!744 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!745 _keys!1833) (size!744 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26001 () Bool)

(declare-fun res!15461 () Bool)

(assert (=> b!26001 (=> (not res!15461) (not e!16876))))

(declare-datatypes ((List!572 0))(
  ( (Nil!569) (Cons!568 (h!1135 (_ BitVec 64)) (t!3253 List!572)) )
))
(declare-fun noDuplicate!10 (List!572) Bool)

(assert (=> b!26001 (= res!15461 (noDuplicate!10 Nil!569))))

(declare-fun b!26002 () Bool)

(declare-fun e!16875 () Bool)

(declare-fun tp_is_empty!1069 () Bool)

(assert (=> b!26002 (= e!16875 tp_is_empty!1069)))

(declare-fun b!26003 () Bool)

(declare-fun res!15457 () Bool)

(assert (=> b!26003 (=> (not res!15457) (not e!16876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1371 (_ BitVec 32)) Bool)

(assert (=> b!26003 (= res!15457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26004 () Bool)

(declare-fun e!16872 () Bool)

(assert (=> b!26004 (= e!16876 e!16872)))

(declare-fun res!15460 () Bool)

(assert (=> b!26004 (=> res!15460 e!16872)))

(declare-fun contains!235 (List!572 (_ BitVec 64)) Bool)

(assert (=> b!26004 (= res!15460 (contains!235 Nil!569 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26005 () Bool)

(declare-fun res!15459 () Bool)

(assert (=> b!26005 (=> (not res!15459) (not e!16876))))

(assert (=> b!26005 (= res!15459 (and (bvsle #b00000000000000000000000000000000 (size!745 _keys!1833)) (bvslt (size!745 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!1117 () Bool)

(declare-fun mapRes!1117 () Bool)

(declare-fun tp!3637 () Bool)

(assert (=> mapNonEmpty!1117 (= mapRes!1117 (and tp!3637 e!16875))))

(declare-fun mapValue!1117 () ValueCell!335)

(declare-fun mapRest!1117 () (Array (_ BitVec 32) ValueCell!335))

(declare-fun mapKey!1117 () (_ BitVec 32))

(assert (=> mapNonEmpty!1117 (= (arr!643 _values!1501) (store mapRest!1117 mapKey!1117 mapValue!1117))))

(declare-fun b!26006 () Bool)

(assert (=> b!26006 (= e!16872 (contains!235 Nil!569 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!25999 () Bool)

(declare-fun e!16877 () Bool)

(declare-fun e!16874 () Bool)

(assert (=> b!25999 (= e!16877 (and e!16874 mapRes!1117))))

(declare-fun condMapEmpty!1117 () Bool)

(declare-fun mapDefault!1117 () ValueCell!335)

(assert (=> b!25999 (= condMapEmpty!1117 (= (arr!643 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!335)) mapDefault!1117)))))

(declare-fun res!15458 () Bool)

(assert (=> start!3732 (=> (not res!15458) (not e!16876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3732 (= res!15458 (validMask!0 mask!2294))))

(assert (=> start!3732 e!16876))

(assert (=> start!3732 true))

(declare-fun array_inv!453 (array!1369) Bool)

(assert (=> start!3732 (and (array_inv!453 _values!1501) e!16877)))

(declare-fun array_inv!454 (array!1371) Bool)

(assert (=> start!3732 (array_inv!454 _keys!1833)))

(declare-fun b!26007 () Bool)

(assert (=> b!26007 (= e!16874 tp_is_empty!1069)))

(declare-fun mapIsEmpty!1117 () Bool)

(assert (=> mapIsEmpty!1117 mapRes!1117))

(assert (= (and start!3732 res!15458) b!26000))

(assert (= (and b!26000 res!15462) b!26003))

(assert (= (and b!26003 res!15457) b!26005))

(assert (= (and b!26005 res!15459) b!26001))

(assert (= (and b!26001 res!15461) b!26004))

(assert (= (and b!26004 (not res!15460)) b!26006))

(assert (= (and b!25999 condMapEmpty!1117) mapIsEmpty!1117))

(assert (= (and b!25999 (not condMapEmpty!1117)) mapNonEmpty!1117))

(get-info :version)

(assert (= (and mapNonEmpty!1117 ((_ is ValueCellFull!335) mapValue!1117)) b!26002))

(assert (= (and b!25999 ((_ is ValueCellFull!335) mapDefault!1117)) b!26007))

(assert (= start!3732 b!25999))

(declare-fun m!20813 () Bool)

(assert (=> b!26001 m!20813))

(declare-fun m!20815 () Bool)

(assert (=> mapNonEmpty!1117 m!20815))

(declare-fun m!20817 () Bool)

(assert (=> b!26006 m!20817))

(declare-fun m!20819 () Bool)

(assert (=> b!26003 m!20819))

(declare-fun m!20821 () Bool)

(assert (=> b!26004 m!20821))

(declare-fun m!20823 () Bool)

(assert (=> start!3732 m!20823))

(declare-fun m!20825 () Bool)

(assert (=> start!3732 m!20825))

(declare-fun m!20827 () Bool)

(assert (=> start!3732 m!20827))

(check-sat (not b!26006) (not mapNonEmpty!1117) tp_is_empty!1069 (not b!26004) (not b!26001) (not b!26003) (not start!3732))
(check-sat)
(get-model)

(declare-fun d!4827 () Bool)

(declare-fun res!15503 () Bool)

(declare-fun e!16918 () Bool)

(assert (=> d!4827 (=> res!15503 e!16918)))

(assert (=> d!4827 (= res!15503 ((_ is Nil!569) Nil!569))))

(assert (=> d!4827 (= (noDuplicate!10 Nil!569) e!16918)))

(declare-fun b!26066 () Bool)

(declare-fun e!16919 () Bool)

(assert (=> b!26066 (= e!16918 e!16919)))

(declare-fun res!15504 () Bool)

(assert (=> b!26066 (=> (not res!15504) (not e!16919))))

(assert (=> b!26066 (= res!15504 (not (contains!235 (t!3253 Nil!569) (h!1135 Nil!569))))))

(declare-fun b!26067 () Bool)

(assert (=> b!26067 (= e!16919 (noDuplicate!10 (t!3253 Nil!569)))))

(assert (= (and d!4827 (not res!15503)) b!26066))

(assert (= (and b!26066 res!15504) b!26067))

(declare-fun m!20861 () Bool)

(assert (=> b!26066 m!20861))

(declare-fun m!20863 () Bool)

(assert (=> b!26067 m!20863))

(assert (=> b!26001 d!4827))

(declare-fun d!4829 () Bool)

(declare-fun lt!10265 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!17 (List!572) (InoxSet (_ BitVec 64)))

(assert (=> d!4829 (= lt!10265 (select (content!17 Nil!569) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16925 () Bool)

(assert (=> d!4829 (= lt!10265 e!16925)))

(declare-fun res!15509 () Bool)

(assert (=> d!4829 (=> (not res!15509) (not e!16925))))

(assert (=> d!4829 (= res!15509 ((_ is Cons!568) Nil!569))))

(assert (=> d!4829 (= (contains!235 Nil!569 #b1000000000000000000000000000000000000000000000000000000000000000) lt!10265)))

(declare-fun b!26072 () Bool)

(declare-fun e!16924 () Bool)

(assert (=> b!26072 (= e!16925 e!16924)))

(declare-fun res!15510 () Bool)

(assert (=> b!26072 (=> res!15510 e!16924)))

(assert (=> b!26072 (= res!15510 (= (h!1135 Nil!569) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26073 () Bool)

(assert (=> b!26073 (= e!16924 (contains!235 (t!3253 Nil!569) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!4829 res!15509) b!26072))

(assert (= (and b!26072 (not res!15510)) b!26073))

(declare-fun m!20865 () Bool)

(assert (=> d!4829 m!20865))

(declare-fun m!20867 () Bool)

(assert (=> d!4829 m!20867))

(declare-fun m!20869 () Bool)

(assert (=> b!26073 m!20869))

(assert (=> b!26006 d!4829))

(declare-fun d!4831 () Bool)

(assert (=> d!4831 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3732 d!4831))

(declare-fun d!4833 () Bool)

(assert (=> d!4833 (= (array_inv!453 _values!1501) (bvsge (size!744 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3732 d!4833))

(declare-fun d!4835 () Bool)

(assert (=> d!4835 (= (array_inv!454 _keys!1833) (bvsge (size!745 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3732 d!4835))

(declare-fun b!26082 () Bool)

(declare-fun e!16932 () Bool)

(declare-fun call!2487 () Bool)

(assert (=> b!26082 (= e!16932 call!2487)))

(declare-fun bm!2484 () Bool)

(assert (=> bm!2484 (= call!2487 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!26083 () Bool)

(declare-fun e!16933 () Bool)

(assert (=> b!26083 (= e!16933 e!16932)))

(declare-fun c!3634 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26083 (= c!3634 (validKeyInArray!0 (select (arr!644 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!4837 () Bool)

(declare-fun res!15515 () Bool)

(assert (=> d!4837 (=> res!15515 e!16933)))

(assert (=> d!4837 (= res!15515 (bvsge #b00000000000000000000000000000000 (size!745 _keys!1833)))))

(assert (=> d!4837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!16933)))

(declare-fun b!26084 () Bool)

(declare-fun e!16934 () Bool)

(assert (=> b!26084 (= e!16932 e!16934)))

(declare-fun lt!10272 () (_ BitVec 64))

(assert (=> b!26084 (= lt!10272 (select (arr!644 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!631 0))(
  ( (Unit!632) )
))
(declare-fun lt!10273 () Unit!631)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1371 (_ BitVec 64) (_ BitVec 32)) Unit!631)

(assert (=> b!26084 (= lt!10273 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10272 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!26084 (arrayContainsKey!0 _keys!1833 lt!10272 #b00000000000000000000000000000000)))

(declare-fun lt!10274 () Unit!631)

(assert (=> b!26084 (= lt!10274 lt!10273)))

(declare-fun res!15516 () Bool)

(declare-datatypes ((SeekEntryResult!60 0))(
  ( (MissingZero!60 (index!2362 (_ BitVec 32))) (Found!60 (index!2363 (_ BitVec 32))) (Intermediate!60 (undefined!872 Bool) (index!2364 (_ BitVec 32)) (x!6074 (_ BitVec 32))) (Undefined!60) (MissingVacant!60 (index!2365 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1371 (_ BitVec 32)) SeekEntryResult!60)

(assert (=> b!26084 (= res!15516 (= (seekEntryOrOpen!0 (select (arr!644 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!60 #b00000000000000000000000000000000)))))

(assert (=> b!26084 (=> (not res!15516) (not e!16934))))

(declare-fun b!26085 () Bool)

(assert (=> b!26085 (= e!16934 call!2487)))

(assert (= (and d!4837 (not res!15515)) b!26083))

(assert (= (and b!26083 c!3634) b!26084))

(assert (= (and b!26083 (not c!3634)) b!26082))

(assert (= (and b!26084 res!15516) b!26085))

(assert (= (or b!26085 b!26082) bm!2484))

(declare-fun m!20871 () Bool)

(assert (=> bm!2484 m!20871))

(declare-fun m!20873 () Bool)

(assert (=> b!26083 m!20873))

(assert (=> b!26083 m!20873))

(declare-fun m!20875 () Bool)

(assert (=> b!26083 m!20875))

(assert (=> b!26084 m!20873))

(declare-fun m!20877 () Bool)

(assert (=> b!26084 m!20877))

(declare-fun m!20879 () Bool)

(assert (=> b!26084 m!20879))

(assert (=> b!26084 m!20873))

(declare-fun m!20881 () Bool)

(assert (=> b!26084 m!20881))

(assert (=> b!26003 d!4837))

(declare-fun d!4839 () Bool)

(declare-fun lt!10275 () Bool)

(assert (=> d!4839 (= lt!10275 (select (content!17 Nil!569) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16936 () Bool)

(assert (=> d!4839 (= lt!10275 e!16936)))

(declare-fun res!15517 () Bool)

(assert (=> d!4839 (=> (not res!15517) (not e!16936))))

(assert (=> d!4839 (= res!15517 ((_ is Cons!568) Nil!569))))

(assert (=> d!4839 (= (contains!235 Nil!569 #b0000000000000000000000000000000000000000000000000000000000000000) lt!10275)))

(declare-fun b!26086 () Bool)

(declare-fun e!16935 () Bool)

(assert (=> b!26086 (= e!16936 e!16935)))

(declare-fun res!15518 () Bool)

(assert (=> b!26086 (=> res!15518 e!16935)))

(assert (=> b!26086 (= res!15518 (= (h!1135 Nil!569) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26087 () Bool)

(assert (=> b!26087 (= e!16935 (contains!235 (t!3253 Nil!569) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!4839 res!15517) b!26086))

(assert (= (and b!26086 (not res!15518)) b!26087))

(assert (=> d!4839 m!20865))

(declare-fun m!20883 () Bool)

(assert (=> d!4839 m!20883))

(declare-fun m!20885 () Bool)

(assert (=> b!26087 m!20885))

(assert (=> b!26004 d!4839))

(declare-fun mapNonEmpty!1126 () Bool)

(declare-fun mapRes!1126 () Bool)

(declare-fun tp!3646 () Bool)

(declare-fun e!16941 () Bool)

(assert (=> mapNonEmpty!1126 (= mapRes!1126 (and tp!3646 e!16941))))

(declare-fun mapValue!1126 () ValueCell!335)

(declare-fun mapRest!1126 () (Array (_ BitVec 32) ValueCell!335))

(declare-fun mapKey!1126 () (_ BitVec 32))

(assert (=> mapNonEmpty!1126 (= mapRest!1117 (store mapRest!1126 mapKey!1126 mapValue!1126))))

(declare-fun b!26094 () Bool)

(assert (=> b!26094 (= e!16941 tp_is_empty!1069)))

(declare-fun b!26095 () Bool)

(declare-fun e!16942 () Bool)

(assert (=> b!26095 (= e!16942 tp_is_empty!1069)))

(declare-fun condMapEmpty!1126 () Bool)

(declare-fun mapDefault!1126 () ValueCell!335)

(assert (=> mapNonEmpty!1117 (= condMapEmpty!1126 (= mapRest!1117 ((as const (Array (_ BitVec 32) ValueCell!335)) mapDefault!1126)))))

(assert (=> mapNonEmpty!1117 (= tp!3637 (and e!16942 mapRes!1126))))

(declare-fun mapIsEmpty!1126 () Bool)

(assert (=> mapIsEmpty!1126 mapRes!1126))

(assert (= (and mapNonEmpty!1117 condMapEmpty!1126) mapIsEmpty!1126))

(assert (= (and mapNonEmpty!1117 (not condMapEmpty!1126)) mapNonEmpty!1126))

(assert (= (and mapNonEmpty!1126 ((_ is ValueCellFull!335) mapValue!1126)) b!26094))

(assert (= (and mapNonEmpty!1117 ((_ is ValueCellFull!335) mapDefault!1126)) b!26095))

(declare-fun m!20887 () Bool)

(assert (=> mapNonEmpty!1126 m!20887))

(check-sat (not b!26066) (not b!26087) (not d!4829) tp_is_empty!1069 (not b!26084) (not b!26083) (not mapNonEmpty!1126) (not b!26067) (not bm!2484) (not b!26073) (not d!4839))
(check-sat)
