; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93616 () Bool)

(assert start!93616)

(declare-fun b!1059275 () Bool)

(declare-fun e!602848 () Bool)

(declare-fun tp_is_empty!24933 () Bool)

(assert (=> b!1059275 (= e!602848 tp_is_empty!24933)))

(declare-fun b!1059276 () Bool)

(declare-fun e!602846 () Bool)

(declare-fun mapRes!39061 () Bool)

(assert (=> b!1059276 (= e!602846 (and e!602848 mapRes!39061))))

(declare-fun condMapEmpty!39061 () Bool)

(declare-datatypes ((V!38379 0))(
  ( (V!38380 (val!12517 Int)) )
))
(declare-datatypes ((ValueCell!11763 0))(
  ( (ValueCellFull!11763 (v!15126 V!38379)) (EmptyCell!11763) )
))
(declare-datatypes ((array!66895 0))(
  ( (array!66896 (arr!32158 (Array (_ BitVec 32) ValueCell!11763)) (size!32694 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66895)

(declare-fun mapDefault!39061 () ValueCell!11763)

(assert (=> b!1059276 (= condMapEmpty!39061 (= (arr!32158 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11763)) mapDefault!39061)))))

(declare-fun b!1059277 () Bool)

(declare-fun res!707633 () Bool)

(declare-fun e!602847 () Bool)

(assert (=> b!1059277 (=> (not res!707633) (not e!602847))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66897 0))(
  ( (array!66898 (arr!32159 (Array (_ BitVec 32) (_ BitVec 64))) (size!32695 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66897)

(assert (=> b!1059277 (= res!707633 (and (= (size!32694 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32695 _keys!1163) (size!32694 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39061 () Bool)

(assert (=> mapIsEmpty!39061 mapRes!39061))

(declare-fun b!1059278 () Bool)

(declare-fun res!707636 () Bool)

(assert (=> b!1059278 (=> (not res!707636) (not e!602847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66897 (_ BitVec 32)) Bool)

(assert (=> b!1059278 (= res!707636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!707634 () Bool)

(assert (=> start!93616 (=> (not res!707634) (not e!602847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93616 (= res!707634 (validMask!0 mask!1515))))

(assert (=> start!93616 e!602847))

(assert (=> start!93616 true))

(declare-fun array_inv!24930 (array!66895) Bool)

(assert (=> start!93616 (and (array_inv!24930 _values!955) e!602846)))

(declare-fun array_inv!24931 (array!66897) Bool)

(assert (=> start!93616 (array_inv!24931 _keys!1163)))

(declare-fun mapNonEmpty!39061 () Bool)

(declare-fun tp!74867 () Bool)

(declare-fun e!602851 () Bool)

(assert (=> mapNonEmpty!39061 (= mapRes!39061 (and tp!74867 e!602851))))

(declare-fun mapKey!39061 () (_ BitVec 32))

(declare-fun mapRest!39061 () (Array (_ BitVec 32) ValueCell!11763))

(declare-fun mapValue!39061 () ValueCell!11763)

(assert (=> mapNonEmpty!39061 (= (arr!32158 _values!955) (store mapRest!39061 mapKey!39061 mapValue!39061))))

(declare-fun b!1059279 () Bool)

(declare-fun e!602850 () Bool)

(assert (=> b!1059279 (= e!602847 e!602850)))

(declare-fun res!707631 () Bool)

(assert (=> b!1059279 (=> res!707631 e!602850)))

(declare-datatypes ((List!22424 0))(
  ( (Nil!22421) (Cons!22420 (h!23629 (_ BitVec 64)) (t!31731 List!22424)) )
))
(declare-fun contains!6215 (List!22424 (_ BitVec 64)) Bool)

(assert (=> b!1059279 (= res!707631 (contains!6215 Nil!22421 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059280 () Bool)

(declare-fun res!707635 () Bool)

(assert (=> b!1059280 (=> (not res!707635) (not e!602847))))

(assert (=> b!1059280 (= res!707635 (and (bvsle #b00000000000000000000000000000000 (size!32695 _keys!1163)) (bvslt (size!32695 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun b!1059281 () Bool)

(assert (=> b!1059281 (= e!602850 (contains!6215 Nil!22421 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059282 () Bool)

(declare-fun res!707632 () Bool)

(assert (=> b!1059282 (=> (not res!707632) (not e!602847))))

(declare-fun noDuplicate!1571 (List!22424) Bool)

(assert (=> b!1059282 (= res!707632 (noDuplicate!1571 Nil!22421))))

(declare-fun b!1059283 () Bool)

(assert (=> b!1059283 (= e!602851 tp_is_empty!24933)))

(assert (= (and start!93616 res!707634) b!1059277))

(assert (= (and b!1059277 res!707633) b!1059278))

(assert (= (and b!1059278 res!707636) b!1059280))

(assert (= (and b!1059280 res!707635) b!1059282))

(assert (= (and b!1059282 res!707632) b!1059279))

(assert (= (and b!1059279 (not res!707631)) b!1059281))

(assert (= (and b!1059276 condMapEmpty!39061) mapIsEmpty!39061))

(assert (= (and b!1059276 (not condMapEmpty!39061)) mapNonEmpty!39061))

(get-info :version)

(assert (= (and mapNonEmpty!39061 ((_ is ValueCellFull!11763) mapValue!39061)) b!1059283))

(assert (= (and b!1059276 ((_ is ValueCellFull!11763) mapDefault!39061)) b!1059275))

(assert (= start!93616 b!1059276))

(declare-fun m!978751 () Bool)

(assert (=> b!1059281 m!978751))

(declare-fun m!978753 () Bool)

(assert (=> b!1059282 m!978753))

(declare-fun m!978755 () Bool)

(assert (=> b!1059278 m!978755))

(declare-fun m!978757 () Bool)

(assert (=> b!1059279 m!978757))

(declare-fun m!978759 () Bool)

(assert (=> mapNonEmpty!39061 m!978759))

(declare-fun m!978761 () Bool)

(assert (=> start!93616 m!978761))

(declare-fun m!978763 () Bool)

(assert (=> start!93616 m!978763))

(declare-fun m!978765 () Bool)

(assert (=> start!93616 m!978765))

(check-sat (not start!93616) (not b!1059281) (not b!1059282) (not mapNonEmpty!39061) (not b!1059278) tp_is_empty!24933 (not b!1059279))
(check-sat)
(get-model)

(declare-fun d!128715 () Bool)

(assert (=> d!128715 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93616 d!128715))

(declare-fun d!128717 () Bool)

(assert (=> d!128717 (= (array_inv!24930 _values!955) (bvsge (size!32694 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93616 d!128717))

(declare-fun d!128719 () Bool)

(assert (=> d!128719 (= (array_inv!24931 _keys!1163) (bvsge (size!32695 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93616 d!128719))

(declare-fun b!1059319 () Bool)

(declare-fun e!602877 () Bool)

(declare-fun e!602876 () Bool)

(assert (=> b!1059319 (= e!602877 e!602876)))

(declare-fun lt!467103 () (_ BitVec 64))

(assert (=> b!1059319 (= lt!467103 (select (arr!32159 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34724 0))(
  ( (Unit!34725) )
))
(declare-fun lt!467102 () Unit!34724)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66897 (_ BitVec 64) (_ BitVec 32)) Unit!34724)

(assert (=> b!1059319 (= lt!467102 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467103 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059319 (arrayContainsKey!0 _keys!1163 lt!467103 #b00000000000000000000000000000000)))

(declare-fun lt!467101 () Unit!34724)

(assert (=> b!1059319 (= lt!467101 lt!467102)))

(declare-fun res!707660 () Bool)

(declare-datatypes ((SeekEntryResult!9868 0))(
  ( (MissingZero!9868 (index!41843 (_ BitVec 32))) (Found!9868 (index!41844 (_ BitVec 32))) (Intermediate!9868 (undefined!10680 Bool) (index!41845 (_ BitVec 32)) (x!94655 (_ BitVec 32))) (Undefined!9868) (MissingVacant!9868 (index!41846 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66897 (_ BitVec 32)) SeekEntryResult!9868)

(assert (=> b!1059319 (= res!707660 (= (seekEntryOrOpen!0 (select (arr!32159 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9868 #b00000000000000000000000000000000)))))

(assert (=> b!1059319 (=> (not res!707660) (not e!602876))))

(declare-fun b!1059320 () Bool)

(declare-fun call!44884 () Bool)

(assert (=> b!1059320 (= e!602876 call!44884)))

(declare-fun bm!44881 () Bool)

(assert (=> bm!44881 (= call!44884 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1059322 () Bool)

(declare-fun e!602878 () Bool)

(assert (=> b!1059322 (= e!602878 e!602877)))

(declare-fun c!107193 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059322 (= c!107193 (validKeyInArray!0 (select (arr!32159 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1059321 () Bool)

(assert (=> b!1059321 (= e!602877 call!44884)))

(declare-fun d!128721 () Bool)

(declare-fun res!707659 () Bool)

(assert (=> d!128721 (=> res!707659 e!602878)))

(assert (=> d!128721 (= res!707659 (bvsge #b00000000000000000000000000000000 (size!32695 _keys!1163)))))

(assert (=> d!128721 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!602878)))

(assert (= (and d!128721 (not res!707659)) b!1059322))

(assert (= (and b!1059322 c!107193) b!1059319))

(assert (= (and b!1059322 (not c!107193)) b!1059321))

(assert (= (and b!1059319 res!707660) b!1059320))

(assert (= (or b!1059320 b!1059321) bm!44881))

(declare-fun m!978783 () Bool)

(assert (=> b!1059319 m!978783))

(declare-fun m!978785 () Bool)

(assert (=> b!1059319 m!978785))

(declare-fun m!978787 () Bool)

(assert (=> b!1059319 m!978787))

(assert (=> b!1059319 m!978783))

(declare-fun m!978789 () Bool)

(assert (=> b!1059319 m!978789))

(declare-fun m!978791 () Bool)

(assert (=> bm!44881 m!978791))

(assert (=> b!1059322 m!978783))

(assert (=> b!1059322 m!978783))

(declare-fun m!978793 () Bool)

(assert (=> b!1059322 m!978793))

(assert (=> b!1059278 d!128721))

(declare-fun d!128723 () Bool)

(declare-fun res!707665 () Bool)

(declare-fun e!602883 () Bool)

(assert (=> d!128723 (=> res!707665 e!602883)))

(assert (=> d!128723 (= res!707665 ((_ is Nil!22421) Nil!22421))))

(assert (=> d!128723 (= (noDuplicate!1571 Nil!22421) e!602883)))

(declare-fun b!1059327 () Bool)

(declare-fun e!602884 () Bool)

(assert (=> b!1059327 (= e!602883 e!602884)))

(declare-fun res!707666 () Bool)

(assert (=> b!1059327 (=> (not res!707666) (not e!602884))))

(assert (=> b!1059327 (= res!707666 (not (contains!6215 (t!31731 Nil!22421) (h!23629 Nil!22421))))))

(declare-fun b!1059328 () Bool)

(assert (=> b!1059328 (= e!602884 (noDuplicate!1571 (t!31731 Nil!22421)))))

(assert (= (and d!128723 (not res!707665)) b!1059327))

(assert (= (and b!1059327 res!707666) b!1059328))

(declare-fun m!978795 () Bool)

(assert (=> b!1059327 m!978795))

(declare-fun m!978797 () Bool)

(assert (=> b!1059328 m!978797))

(assert (=> b!1059282 d!128723))

(declare-fun d!128725 () Bool)

(declare-fun lt!467106 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!534 (List!22424) (InoxSet (_ BitVec 64)))

(assert (=> d!128725 (= lt!467106 (select (content!534 Nil!22421) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!602889 () Bool)

(assert (=> d!128725 (= lt!467106 e!602889)))

(declare-fun res!707671 () Bool)

(assert (=> d!128725 (=> (not res!707671) (not e!602889))))

(assert (=> d!128725 (= res!707671 ((_ is Cons!22420) Nil!22421))))

(assert (=> d!128725 (= (contains!6215 Nil!22421 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467106)))

(declare-fun b!1059333 () Bool)

(declare-fun e!602890 () Bool)

(assert (=> b!1059333 (= e!602889 e!602890)))

(declare-fun res!707672 () Bool)

(assert (=> b!1059333 (=> res!707672 e!602890)))

(assert (=> b!1059333 (= res!707672 (= (h!23629 Nil!22421) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059334 () Bool)

(assert (=> b!1059334 (= e!602890 (contains!6215 (t!31731 Nil!22421) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128725 res!707671) b!1059333))

(assert (= (and b!1059333 (not res!707672)) b!1059334))

(declare-fun m!978799 () Bool)

(assert (=> d!128725 m!978799))

(declare-fun m!978801 () Bool)

(assert (=> d!128725 m!978801))

(declare-fun m!978803 () Bool)

(assert (=> b!1059334 m!978803))

(assert (=> b!1059279 d!128725))

(declare-fun d!128727 () Bool)

(declare-fun lt!467107 () Bool)

(assert (=> d!128727 (= lt!467107 (select (content!534 Nil!22421) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!602891 () Bool)

(assert (=> d!128727 (= lt!467107 e!602891)))

(declare-fun res!707673 () Bool)

(assert (=> d!128727 (=> (not res!707673) (not e!602891))))

(assert (=> d!128727 (= res!707673 ((_ is Cons!22420) Nil!22421))))

(assert (=> d!128727 (= (contains!6215 Nil!22421 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467107)))

(declare-fun b!1059335 () Bool)

(declare-fun e!602892 () Bool)

(assert (=> b!1059335 (= e!602891 e!602892)))

(declare-fun res!707674 () Bool)

(assert (=> b!1059335 (=> res!707674 e!602892)))

(assert (=> b!1059335 (= res!707674 (= (h!23629 Nil!22421) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059336 () Bool)

(assert (=> b!1059336 (= e!602892 (contains!6215 (t!31731 Nil!22421) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128727 res!707673) b!1059335))

(assert (= (and b!1059335 (not res!707674)) b!1059336))

(assert (=> d!128727 m!978799))

(declare-fun m!978805 () Bool)

(assert (=> d!128727 m!978805))

(declare-fun m!978807 () Bool)

(assert (=> b!1059336 m!978807))

(assert (=> b!1059281 d!128727))

(declare-fun condMapEmpty!39067 () Bool)

(declare-fun mapDefault!39067 () ValueCell!11763)

(assert (=> mapNonEmpty!39061 (= condMapEmpty!39067 (= mapRest!39061 ((as const (Array (_ BitVec 32) ValueCell!11763)) mapDefault!39067)))))

(declare-fun e!602898 () Bool)

(declare-fun mapRes!39067 () Bool)

(assert (=> mapNonEmpty!39061 (= tp!74867 (and e!602898 mapRes!39067))))

(declare-fun mapIsEmpty!39067 () Bool)

(assert (=> mapIsEmpty!39067 mapRes!39067))

(declare-fun b!1059343 () Bool)

(declare-fun e!602897 () Bool)

(assert (=> b!1059343 (= e!602897 tp_is_empty!24933)))

(declare-fun b!1059344 () Bool)

(assert (=> b!1059344 (= e!602898 tp_is_empty!24933)))

(declare-fun mapNonEmpty!39067 () Bool)

(declare-fun tp!74873 () Bool)

(assert (=> mapNonEmpty!39067 (= mapRes!39067 (and tp!74873 e!602897))))

(declare-fun mapRest!39067 () (Array (_ BitVec 32) ValueCell!11763))

(declare-fun mapValue!39067 () ValueCell!11763)

(declare-fun mapKey!39067 () (_ BitVec 32))

(assert (=> mapNonEmpty!39067 (= mapRest!39061 (store mapRest!39067 mapKey!39067 mapValue!39067))))

(assert (= (and mapNonEmpty!39061 condMapEmpty!39067) mapIsEmpty!39067))

(assert (= (and mapNonEmpty!39061 (not condMapEmpty!39067)) mapNonEmpty!39067))

(assert (= (and mapNonEmpty!39067 ((_ is ValueCellFull!11763) mapValue!39067)) b!1059343))

(assert (= (and mapNonEmpty!39061 ((_ is ValueCellFull!11763) mapDefault!39067)) b!1059344))

(declare-fun m!978809 () Bool)

(assert (=> mapNonEmpty!39067 m!978809))

(check-sat (not b!1059336) (not bm!44881) (not b!1059319) (not b!1059327) (not d!128727) (not b!1059334) (not b!1059322) (not b!1059328) (not d!128725) (not mapNonEmpty!39067) tp_is_empty!24933)
(check-sat)
