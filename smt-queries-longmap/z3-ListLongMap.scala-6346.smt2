; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81802 () Bool)

(assert start!81802)

(declare-fun mapIsEmpty!33238 () Bool)

(declare-fun mapRes!33238 () Bool)

(assert (=> mapIsEmpty!33238 mapRes!33238))

(declare-fun b!954015 () Bool)

(declare-fun e!537474 () Bool)

(declare-fun tp_is_empty!20853 () Bool)

(assert (=> b!954015 (= e!537474 tp_is_empty!20853)))

(declare-fun b!954016 () Bool)

(declare-fun e!537476 () Bool)

(assert (=> b!954016 (= e!537476 (and e!537474 mapRes!33238))))

(declare-fun condMapEmpty!33238 () Bool)

(declare-datatypes ((V!32787 0))(
  ( (V!32788 (val!10477 Int)) )
))
(declare-datatypes ((ValueCell!9945 0))(
  ( (ValueCellFull!9945 (v!13031 V!32787)) (EmptyCell!9945) )
))
(declare-datatypes ((array!57817 0))(
  ( (array!57818 (arr!27789 (Array (_ BitVec 32) ValueCell!9945)) (size!28268 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57817)

(declare-fun mapDefault!33238 () ValueCell!9945)

(assert (=> b!954016 (= condMapEmpty!33238 (= (arr!27789 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9945)) mapDefault!33238)))))

(declare-fun b!954017 () Bool)

(declare-fun res!638857 () Bool)

(declare-fun e!537471 () Bool)

(assert (=> b!954017 (=> (not res!638857) (not e!537471))))

(declare-datatypes ((array!57819 0))(
  ( (array!57820 (arr!27790 (Array (_ BitVec 32) (_ BitVec 64))) (size!28269 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57819)

(assert (=> b!954017 (= res!638857 (and (bvsle #b00000000000000000000000000000000 (size!28269 _keys!1441)) (bvslt (size!28269 _keys!1441) #b01111111111111111111111111111111)))))

(declare-fun b!954019 () Bool)

(declare-fun e!537472 () Bool)

(assert (=> b!954019 (= e!537471 e!537472)))

(declare-fun res!638858 () Bool)

(assert (=> b!954019 (=> res!638858 e!537472)))

(declare-datatypes ((List!19380 0))(
  ( (Nil!19377) (Cons!19376 (h!20538 (_ BitVec 64)) (t!27741 List!19380)) )
))
(declare-fun contains!5262 (List!19380 (_ BitVec 64)) Bool)

(assert (=> b!954019 (= res!638858 (contains!5262 Nil!19377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!954020 () Bool)

(declare-fun res!638855 () Bool)

(assert (=> b!954020 (=> (not res!638855) (not e!537471))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57819 (_ BitVec 32)) Bool)

(assert (=> b!954020 (= res!638855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33238 () Bool)

(declare-fun tp!63627 () Bool)

(declare-fun e!537473 () Bool)

(assert (=> mapNonEmpty!33238 (= mapRes!33238 (and tp!63627 e!537473))))

(declare-fun mapRest!33238 () (Array (_ BitVec 32) ValueCell!9945))

(declare-fun mapValue!33238 () ValueCell!9945)

(declare-fun mapKey!33238 () (_ BitVec 32))

(assert (=> mapNonEmpty!33238 (= (arr!27789 _values!1197) (store mapRest!33238 mapKey!33238 mapValue!33238))))

(declare-fun b!954021 () Bool)

(assert (=> b!954021 (= e!537472 (contains!5262 Nil!19377 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!954022 () Bool)

(declare-fun res!638860 () Bool)

(assert (=> b!954022 (=> (not res!638860) (not e!537471))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!954022 (= res!638860 (and (= (size!28268 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28269 _keys!1441) (size!28268 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954023 () Bool)

(declare-fun res!638859 () Bool)

(assert (=> b!954023 (=> (not res!638859) (not e!537471))))

(declare-fun noDuplicate!1360 (List!19380) Bool)

(assert (=> b!954023 (= res!638859 (noDuplicate!1360 Nil!19377))))

(declare-fun res!638856 () Bool)

(assert (=> start!81802 (=> (not res!638856) (not e!537471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81802 (= res!638856 (validMask!0 mask!1823))))

(assert (=> start!81802 e!537471))

(assert (=> start!81802 true))

(declare-fun array_inv!21573 (array!57817) Bool)

(assert (=> start!81802 (and (array_inv!21573 _values!1197) e!537476)))

(declare-fun array_inv!21574 (array!57819) Bool)

(assert (=> start!81802 (array_inv!21574 _keys!1441)))

(declare-fun b!954018 () Bool)

(assert (=> b!954018 (= e!537473 tp_is_empty!20853)))

(assert (= (and start!81802 res!638856) b!954022))

(assert (= (and b!954022 res!638860) b!954020))

(assert (= (and b!954020 res!638855) b!954017))

(assert (= (and b!954017 res!638857) b!954023))

(assert (= (and b!954023 res!638859) b!954019))

(assert (= (and b!954019 (not res!638858)) b!954021))

(assert (= (and b!954016 condMapEmpty!33238) mapIsEmpty!33238))

(assert (= (and b!954016 (not condMapEmpty!33238)) mapNonEmpty!33238))

(get-info :version)

(assert (= (and mapNonEmpty!33238 ((_ is ValueCellFull!9945) mapValue!33238)) b!954018))

(assert (= (and b!954016 ((_ is ValueCellFull!9945) mapDefault!33238)) b!954015))

(assert (= start!81802 b!954016))

(declare-fun m!885863 () Bool)

(assert (=> b!954021 m!885863))

(declare-fun m!885865 () Bool)

(assert (=> mapNonEmpty!33238 m!885865))

(declare-fun m!885867 () Bool)

(assert (=> start!81802 m!885867))

(declare-fun m!885869 () Bool)

(assert (=> start!81802 m!885869))

(declare-fun m!885871 () Bool)

(assert (=> start!81802 m!885871))

(declare-fun m!885873 () Bool)

(assert (=> b!954019 m!885873))

(declare-fun m!885875 () Bool)

(assert (=> b!954023 m!885875))

(declare-fun m!885877 () Bool)

(assert (=> b!954020 m!885877))

(check-sat (not b!954019) (not b!954021) (not mapNonEmpty!33238) (not start!81802) (not b!954023) (not b!954020) tp_is_empty!20853)
(check-sat)
(get-model)

(declare-fun b!954059 () Bool)

(declare-fun e!537501 () Bool)

(declare-fun e!537502 () Bool)

(assert (=> b!954059 (= e!537501 e!537502)))

(declare-fun c!99866 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954059 (= c!99866 (validKeyInArray!0 (select (arr!27790 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!954060 () Bool)

(declare-fun e!537503 () Bool)

(assert (=> b!954060 (= e!537502 e!537503)))

(declare-fun lt!429856 () (_ BitVec 64))

(assert (=> b!954060 (= lt!429856 (select (arr!27790 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32091 0))(
  ( (Unit!32092) )
))
(declare-fun lt!429855 () Unit!32091)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57819 (_ BitVec 64) (_ BitVec 32)) Unit!32091)

(assert (=> b!954060 (= lt!429855 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!429856 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!954060 (arrayContainsKey!0 _keys!1441 lt!429856 #b00000000000000000000000000000000)))

(declare-fun lt!429854 () Unit!32091)

(assert (=> b!954060 (= lt!429854 lt!429855)))

(declare-fun res!638883 () Bool)

(declare-datatypes ((SeekEntryResult!9187 0))(
  ( (MissingZero!9187 (index!39119 (_ BitVec 32))) (Found!9187 (index!39120 (_ BitVec 32))) (Intermediate!9187 (undefined!9999 Bool) (index!39121 (_ BitVec 32)) (x!82149 (_ BitVec 32))) (Undefined!9187) (MissingVacant!9187 (index!39122 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57819 (_ BitVec 32)) SeekEntryResult!9187)

(assert (=> b!954060 (= res!638883 (= (seekEntryOrOpen!0 (select (arr!27790 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9187 #b00000000000000000000000000000000)))))

(assert (=> b!954060 (=> (not res!638883) (not e!537503))))

(declare-fun b!954061 () Bool)

(declare-fun call!41678 () Bool)

(assert (=> b!954061 (= e!537503 call!41678)))

(declare-fun b!954062 () Bool)

(assert (=> b!954062 (= e!537502 call!41678)))

(declare-fun d!115757 () Bool)

(declare-fun res!638884 () Bool)

(assert (=> d!115757 (=> res!638884 e!537501)))

(assert (=> d!115757 (= res!638884 (bvsge #b00000000000000000000000000000000 (size!28269 _keys!1441)))))

(assert (=> d!115757 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!537501)))

(declare-fun bm!41675 () Bool)

(assert (=> bm!41675 (= call!41678 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(assert (= (and d!115757 (not res!638884)) b!954059))

(assert (= (and b!954059 c!99866) b!954060))

(assert (= (and b!954059 (not c!99866)) b!954062))

(assert (= (and b!954060 res!638883) b!954061))

(assert (= (or b!954061 b!954062) bm!41675))

(declare-fun m!885895 () Bool)

(assert (=> b!954059 m!885895))

(assert (=> b!954059 m!885895))

(declare-fun m!885897 () Bool)

(assert (=> b!954059 m!885897))

(assert (=> b!954060 m!885895))

(declare-fun m!885899 () Bool)

(assert (=> b!954060 m!885899))

(declare-fun m!885901 () Bool)

(assert (=> b!954060 m!885901))

(assert (=> b!954060 m!885895))

(declare-fun m!885903 () Bool)

(assert (=> b!954060 m!885903))

(declare-fun m!885905 () Bool)

(assert (=> bm!41675 m!885905))

(assert (=> b!954020 d!115757))

(declare-fun d!115759 () Bool)

(declare-fun res!638889 () Bool)

(declare-fun e!537508 () Bool)

(assert (=> d!115759 (=> res!638889 e!537508)))

(assert (=> d!115759 (= res!638889 ((_ is Nil!19377) Nil!19377))))

(assert (=> d!115759 (= (noDuplicate!1360 Nil!19377) e!537508)))

(declare-fun b!954067 () Bool)

(declare-fun e!537509 () Bool)

(assert (=> b!954067 (= e!537508 e!537509)))

(declare-fun res!638890 () Bool)

(assert (=> b!954067 (=> (not res!638890) (not e!537509))))

(assert (=> b!954067 (= res!638890 (not (contains!5262 (t!27741 Nil!19377) (h!20538 Nil!19377))))))

(declare-fun b!954068 () Bool)

(assert (=> b!954068 (= e!537509 (noDuplicate!1360 (t!27741 Nil!19377)))))

(assert (= (and d!115759 (not res!638889)) b!954067))

(assert (= (and b!954067 res!638890) b!954068))

(declare-fun m!885907 () Bool)

(assert (=> b!954067 m!885907))

(declare-fun m!885909 () Bool)

(assert (=> b!954068 m!885909))

(assert (=> b!954023 d!115759))

(declare-fun d!115761 () Bool)

(declare-fun lt!429859 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!412 (List!19380) (InoxSet (_ BitVec 64)))

(assert (=> d!115761 (= lt!429859 (select (content!412 Nil!19377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!537515 () Bool)

(assert (=> d!115761 (= lt!429859 e!537515)))

(declare-fun res!638895 () Bool)

(assert (=> d!115761 (=> (not res!638895) (not e!537515))))

(assert (=> d!115761 (= res!638895 ((_ is Cons!19376) Nil!19377))))

(assert (=> d!115761 (= (contains!5262 Nil!19377 #b0000000000000000000000000000000000000000000000000000000000000000) lt!429859)))

(declare-fun b!954073 () Bool)

(declare-fun e!537514 () Bool)

(assert (=> b!954073 (= e!537515 e!537514)))

(declare-fun res!638896 () Bool)

(assert (=> b!954073 (=> res!638896 e!537514)))

(assert (=> b!954073 (= res!638896 (= (h!20538 Nil!19377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!954074 () Bool)

(assert (=> b!954074 (= e!537514 (contains!5262 (t!27741 Nil!19377) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115761 res!638895) b!954073))

(assert (= (and b!954073 (not res!638896)) b!954074))

(declare-fun m!885911 () Bool)

(assert (=> d!115761 m!885911))

(declare-fun m!885913 () Bool)

(assert (=> d!115761 m!885913))

(declare-fun m!885915 () Bool)

(assert (=> b!954074 m!885915))

(assert (=> b!954019 d!115761))

(declare-fun d!115763 () Bool)

(assert (=> d!115763 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81802 d!115763))

(declare-fun d!115765 () Bool)

(assert (=> d!115765 (= (array_inv!21573 _values!1197) (bvsge (size!28268 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81802 d!115765))

(declare-fun d!115767 () Bool)

(assert (=> d!115767 (= (array_inv!21574 _keys!1441) (bvsge (size!28269 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81802 d!115767))

(declare-fun d!115769 () Bool)

(declare-fun lt!429860 () Bool)

(assert (=> d!115769 (= lt!429860 (select (content!412 Nil!19377) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!537517 () Bool)

(assert (=> d!115769 (= lt!429860 e!537517)))

(declare-fun res!638897 () Bool)

(assert (=> d!115769 (=> (not res!638897) (not e!537517))))

(assert (=> d!115769 (= res!638897 ((_ is Cons!19376) Nil!19377))))

(assert (=> d!115769 (= (contains!5262 Nil!19377 #b1000000000000000000000000000000000000000000000000000000000000000) lt!429860)))

(declare-fun b!954075 () Bool)

(declare-fun e!537516 () Bool)

(assert (=> b!954075 (= e!537517 e!537516)))

(declare-fun res!638898 () Bool)

(assert (=> b!954075 (=> res!638898 e!537516)))

(assert (=> b!954075 (= res!638898 (= (h!20538 Nil!19377) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!954076 () Bool)

(assert (=> b!954076 (= e!537516 (contains!5262 (t!27741 Nil!19377) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115769 res!638897) b!954075))

(assert (= (and b!954075 (not res!638898)) b!954076))

(assert (=> d!115769 m!885911))

(declare-fun m!885917 () Bool)

(assert (=> d!115769 m!885917))

(declare-fun m!885919 () Bool)

(assert (=> b!954076 m!885919))

(assert (=> b!954021 d!115769))

(declare-fun b!954084 () Bool)

(declare-fun e!537522 () Bool)

(assert (=> b!954084 (= e!537522 tp_is_empty!20853)))

(declare-fun b!954083 () Bool)

(declare-fun e!537523 () Bool)

(assert (=> b!954083 (= e!537523 tp_is_empty!20853)))

(declare-fun mapNonEmpty!33244 () Bool)

(declare-fun mapRes!33244 () Bool)

(declare-fun tp!63633 () Bool)

(assert (=> mapNonEmpty!33244 (= mapRes!33244 (and tp!63633 e!537523))))

(declare-fun mapValue!33244 () ValueCell!9945)

(declare-fun mapKey!33244 () (_ BitVec 32))

(declare-fun mapRest!33244 () (Array (_ BitVec 32) ValueCell!9945))

(assert (=> mapNonEmpty!33244 (= mapRest!33238 (store mapRest!33244 mapKey!33244 mapValue!33244))))

(declare-fun condMapEmpty!33244 () Bool)

(declare-fun mapDefault!33244 () ValueCell!9945)

(assert (=> mapNonEmpty!33238 (= condMapEmpty!33244 (= mapRest!33238 ((as const (Array (_ BitVec 32) ValueCell!9945)) mapDefault!33244)))))

(assert (=> mapNonEmpty!33238 (= tp!63627 (and e!537522 mapRes!33244))))

(declare-fun mapIsEmpty!33244 () Bool)

(assert (=> mapIsEmpty!33244 mapRes!33244))

(assert (= (and mapNonEmpty!33238 condMapEmpty!33244) mapIsEmpty!33244))

(assert (= (and mapNonEmpty!33238 (not condMapEmpty!33244)) mapNonEmpty!33244))

(assert (= (and mapNonEmpty!33244 ((_ is ValueCellFull!9945) mapValue!33244)) b!954083))

(assert (= (and mapNonEmpty!33238 ((_ is ValueCellFull!9945) mapDefault!33244)) b!954084))

(declare-fun m!885921 () Bool)

(assert (=> mapNonEmpty!33244 m!885921))

(check-sat (not d!115761) (not b!954074) (not b!954076) (not b!954060) tp_is_empty!20853 (not b!954059) (not d!115769) (not b!954068) (not bm!41675) (not mapNonEmpty!33244) (not b!954067))
(check-sat)
