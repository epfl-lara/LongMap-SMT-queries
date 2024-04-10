; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84858 () Bool)

(assert start!84858)

(declare-fun mapIsEmpty!37092 () Bool)

(declare-fun mapRes!37092 () Bool)

(assert (=> mapIsEmpty!37092 mapRes!37092))

(declare-fun b!991763 () Bool)

(declare-fun res!662906 () Bool)

(declare-fun e!559380 () Bool)

(assert (=> b!991763 (=> (not res!662906) (not e!559380))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-datatypes ((V!36115 0))(
  ( (V!36116 (val!11725 Int)) )
))
(declare-datatypes ((ValueCell!11193 0))(
  ( (ValueCellFull!11193 (v!14301 V!36115)) (EmptyCell!11193) )
))
(declare-datatypes ((array!62667 0))(
  ( (array!62668 (arr!30179 (Array (_ BitVec 32) ValueCell!11193)) (size!30658 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62667)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62669 0))(
  ( (array!62670 (arr!30180 (Array (_ BitVec 32) (_ BitVec 64))) (size!30659 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62669)

(assert (=> b!991763 (= res!662906 (and (= (size!30658 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30659 _keys!1945) (size!30658 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991764 () Bool)

(declare-fun e!559377 () Bool)

(declare-fun tp_is_empty!23349 () Bool)

(assert (=> b!991764 (= e!559377 tp_is_empty!23349)))

(declare-fun res!662908 () Bool)

(assert (=> start!84858 (=> (not res!662908) (not e!559380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84858 (= res!662908 (validMask!0 mask!2471))))

(assert (=> start!84858 e!559380))

(assert (=> start!84858 true))

(declare-fun e!559379 () Bool)

(declare-fun array_inv!23307 (array!62667) Bool)

(assert (=> start!84858 (and (array_inv!23307 _values!1551) e!559379)))

(declare-fun array_inv!23308 (array!62669) Bool)

(assert (=> start!84858 (array_inv!23308 _keys!1945)))

(declare-fun b!991765 () Bool)

(declare-fun res!662910 () Bool)

(assert (=> b!991765 (=> (not res!662910) (not e!559380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62669 (_ BitVec 32)) Bool)

(assert (=> b!991765 (= res!662910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!991766 () Bool)

(declare-fun e!559381 () Bool)

(assert (=> b!991766 (= e!559380 e!559381)))

(declare-fun res!662909 () Bool)

(assert (=> b!991766 (=> res!662909 e!559381)))

(declare-datatypes ((List!20862 0))(
  ( (Nil!20859) (Cons!20858 (h!22020 (_ BitVec 64)) (t!29845 List!20862)) )
))
(declare-fun contains!5730 (List!20862 (_ BitVec 64)) Bool)

(assert (=> b!991766 (= res!662909 (contains!5730 Nil!20859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991767 () Bool)

(declare-fun res!662907 () Bool)

(assert (=> b!991767 (=> (not res!662907) (not e!559380))))

(declare-fun noDuplicate!1380 (List!20862) Bool)

(assert (=> b!991767 (= res!662907 (noDuplicate!1380 Nil!20859))))

(declare-fun b!991768 () Bool)

(declare-fun res!662911 () Bool)

(assert (=> b!991768 (=> (not res!662911) (not e!559380))))

(assert (=> b!991768 (= res!662911 (and (bvsle #b00000000000000000000000000000000 (size!30659 _keys!1945)) (bvslt (size!30659 _keys!1945) #b01111111111111111111111111111111)))))

(declare-fun b!991769 () Bool)

(declare-fun e!559378 () Bool)

(assert (=> b!991769 (= e!559379 (and e!559378 mapRes!37092))))

(declare-fun condMapEmpty!37092 () Bool)

(declare-fun mapDefault!37092 () ValueCell!11193)

(assert (=> b!991769 (= condMapEmpty!37092 (= (arr!30179 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11193)) mapDefault!37092)))))

(declare-fun b!991770 () Bool)

(assert (=> b!991770 (= e!559381 (contains!5730 Nil!20859 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37092 () Bool)

(declare-fun tp!70163 () Bool)

(assert (=> mapNonEmpty!37092 (= mapRes!37092 (and tp!70163 e!559377))))

(declare-fun mapKey!37092 () (_ BitVec 32))

(declare-fun mapValue!37092 () ValueCell!11193)

(declare-fun mapRest!37092 () (Array (_ BitVec 32) ValueCell!11193))

(assert (=> mapNonEmpty!37092 (= (arr!30179 _values!1551) (store mapRest!37092 mapKey!37092 mapValue!37092))))

(declare-fun b!991771 () Bool)

(assert (=> b!991771 (= e!559378 tp_is_empty!23349)))

(assert (= (and start!84858 res!662908) b!991763))

(assert (= (and b!991763 res!662906) b!991765))

(assert (= (and b!991765 res!662910) b!991768))

(assert (= (and b!991768 res!662911) b!991767))

(assert (= (and b!991767 res!662907) b!991766))

(assert (= (and b!991766 (not res!662909)) b!991770))

(assert (= (and b!991769 condMapEmpty!37092) mapIsEmpty!37092))

(assert (= (and b!991769 (not condMapEmpty!37092)) mapNonEmpty!37092))

(get-info :version)

(assert (= (and mapNonEmpty!37092 ((_ is ValueCellFull!11193) mapValue!37092)) b!991764))

(assert (= (and b!991769 ((_ is ValueCellFull!11193) mapDefault!37092)) b!991771))

(assert (= start!84858 b!991769))

(declare-fun m!919581 () Bool)

(assert (=> start!84858 m!919581))

(declare-fun m!919583 () Bool)

(assert (=> start!84858 m!919583))

(declare-fun m!919585 () Bool)

(assert (=> start!84858 m!919585))

(declare-fun m!919587 () Bool)

(assert (=> b!991765 m!919587))

(declare-fun m!919589 () Bool)

(assert (=> b!991767 m!919589))

(declare-fun m!919591 () Bool)

(assert (=> b!991770 m!919591))

(declare-fun m!919593 () Bool)

(assert (=> mapNonEmpty!37092 m!919593))

(declare-fun m!919595 () Bool)

(assert (=> b!991766 m!919595))

(check-sat tp_is_empty!23349 (not start!84858) (not b!991770) (not b!991765) (not b!991767) (not mapNonEmpty!37092) (not b!991766))
(check-sat)
(get-model)

(declare-fun d!117979 () Bool)

(declare-fun lt!440013 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!426 (List!20862) (InoxSet (_ BitVec 64)))

(assert (=> d!117979 (= lt!440013 (select (content!426 Nil!20859) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!559405 () Bool)

(assert (=> d!117979 (= lt!440013 e!559405)))

(declare-fun res!662934 () Bool)

(assert (=> d!117979 (=> (not res!662934) (not e!559405))))

(assert (=> d!117979 (= res!662934 ((_ is Cons!20858) Nil!20859))))

(assert (=> d!117979 (= (contains!5730 Nil!20859 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440013)))

(declare-fun b!991803 () Bool)

(declare-fun e!559404 () Bool)

(assert (=> b!991803 (= e!559405 e!559404)))

(declare-fun res!662935 () Bool)

(assert (=> b!991803 (=> res!662935 e!559404)))

(assert (=> b!991803 (= res!662935 (= (h!22020 Nil!20859) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991804 () Bool)

(assert (=> b!991804 (= e!559404 (contains!5730 (t!29845 Nil!20859) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!117979 res!662934) b!991803))

(assert (= (and b!991803 (not res!662935)) b!991804))

(declare-fun m!919613 () Bool)

(assert (=> d!117979 m!919613))

(declare-fun m!919615 () Bool)

(assert (=> d!117979 m!919615))

(declare-fun m!919617 () Bool)

(assert (=> b!991804 m!919617))

(assert (=> b!991770 d!117979))

(declare-fun bm!42082 () Bool)

(declare-fun call!42085 () Bool)

(assert (=> bm!42082 (= call!42085 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(declare-fun b!991813 () Bool)

(declare-fun e!559414 () Bool)

(assert (=> b!991813 (= e!559414 call!42085)))

(declare-fun b!991814 () Bool)

(declare-fun e!559413 () Bool)

(assert (=> b!991814 (= e!559414 e!559413)))

(declare-fun lt!440020 () (_ BitVec 64))

(assert (=> b!991814 (= lt!440020 (select (arr!30180 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32900 0))(
  ( (Unit!32901) )
))
(declare-fun lt!440022 () Unit!32900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62669 (_ BitVec 64) (_ BitVec 32)) Unit!32900)

(assert (=> b!991814 (= lt!440022 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!440020 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!991814 (arrayContainsKey!0 _keys!1945 lt!440020 #b00000000000000000000000000000000)))

(declare-fun lt!440021 () Unit!32900)

(assert (=> b!991814 (= lt!440021 lt!440022)))

(declare-fun res!662941 () Bool)

(declare-datatypes ((SeekEntryResult!9217 0))(
  ( (MissingZero!9217 (index!39239 (_ BitVec 32))) (Found!9217 (index!39240 (_ BitVec 32))) (Intermediate!9217 (undefined!10029 Bool) (index!39241 (_ BitVec 32)) (x!86298 (_ BitVec 32))) (Undefined!9217) (MissingVacant!9217 (index!39242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62669 (_ BitVec 32)) SeekEntryResult!9217)

(assert (=> b!991814 (= res!662941 (= (seekEntryOrOpen!0 (select (arr!30180 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9217 #b00000000000000000000000000000000)))))

(assert (=> b!991814 (=> (not res!662941) (not e!559413))))

(declare-fun b!991815 () Bool)

(assert (=> b!991815 (= e!559413 call!42085)))

(declare-fun d!117981 () Bool)

(declare-fun res!662940 () Bool)

(declare-fun e!559412 () Bool)

(assert (=> d!117981 (=> res!662940 e!559412)))

(assert (=> d!117981 (= res!662940 (bvsge #b00000000000000000000000000000000 (size!30659 _keys!1945)))))

(assert (=> d!117981 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!559412)))

(declare-fun b!991816 () Bool)

(assert (=> b!991816 (= e!559412 e!559414)))

(declare-fun c!100636 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991816 (= c!100636 (validKeyInArray!0 (select (arr!30180 _keys!1945) #b00000000000000000000000000000000)))))

(assert (= (and d!117981 (not res!662940)) b!991816))

(assert (= (and b!991816 c!100636) b!991814))

(assert (= (and b!991816 (not c!100636)) b!991813))

(assert (= (and b!991814 res!662941) b!991815))

(assert (= (or b!991815 b!991813) bm!42082))

(declare-fun m!919619 () Bool)

(assert (=> bm!42082 m!919619))

(declare-fun m!919621 () Bool)

(assert (=> b!991814 m!919621))

(declare-fun m!919623 () Bool)

(assert (=> b!991814 m!919623))

(declare-fun m!919625 () Bool)

(assert (=> b!991814 m!919625))

(assert (=> b!991814 m!919621))

(declare-fun m!919627 () Bool)

(assert (=> b!991814 m!919627))

(assert (=> b!991816 m!919621))

(assert (=> b!991816 m!919621))

(declare-fun m!919629 () Bool)

(assert (=> b!991816 m!919629))

(assert (=> b!991765 d!117981))

(declare-fun d!117983 () Bool)

(assert (=> d!117983 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84858 d!117983))

(declare-fun d!117985 () Bool)

(assert (=> d!117985 (= (array_inv!23307 _values!1551) (bvsge (size!30658 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84858 d!117985))

(declare-fun d!117987 () Bool)

(assert (=> d!117987 (= (array_inv!23308 _keys!1945) (bvsge (size!30659 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84858 d!117987))

(declare-fun d!117989 () Bool)

(declare-fun lt!440023 () Bool)

(assert (=> d!117989 (= lt!440023 (select (content!426 Nil!20859) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!559416 () Bool)

(assert (=> d!117989 (= lt!440023 e!559416)))

(declare-fun res!662942 () Bool)

(assert (=> d!117989 (=> (not res!662942) (not e!559416))))

(assert (=> d!117989 (= res!662942 ((_ is Cons!20858) Nil!20859))))

(assert (=> d!117989 (= (contains!5730 Nil!20859 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440023)))

(declare-fun b!991817 () Bool)

(declare-fun e!559415 () Bool)

(assert (=> b!991817 (= e!559416 e!559415)))

(declare-fun res!662943 () Bool)

(assert (=> b!991817 (=> res!662943 e!559415)))

(assert (=> b!991817 (= res!662943 (= (h!22020 Nil!20859) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991818 () Bool)

(assert (=> b!991818 (= e!559415 (contains!5730 (t!29845 Nil!20859) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!117989 res!662942) b!991817))

(assert (= (and b!991817 (not res!662943)) b!991818))

(assert (=> d!117989 m!919613))

(declare-fun m!919631 () Bool)

(assert (=> d!117989 m!919631))

(declare-fun m!919633 () Bool)

(assert (=> b!991818 m!919633))

(assert (=> b!991766 d!117989))

(declare-fun d!117991 () Bool)

(declare-fun res!662948 () Bool)

(declare-fun e!559421 () Bool)

(assert (=> d!117991 (=> res!662948 e!559421)))

(assert (=> d!117991 (= res!662948 ((_ is Nil!20859) Nil!20859))))

(assert (=> d!117991 (= (noDuplicate!1380 Nil!20859) e!559421)))

(declare-fun b!991823 () Bool)

(declare-fun e!559422 () Bool)

(assert (=> b!991823 (= e!559421 e!559422)))

(declare-fun res!662949 () Bool)

(assert (=> b!991823 (=> (not res!662949) (not e!559422))))

(assert (=> b!991823 (= res!662949 (not (contains!5730 (t!29845 Nil!20859) (h!22020 Nil!20859))))))

(declare-fun b!991824 () Bool)

(assert (=> b!991824 (= e!559422 (noDuplicate!1380 (t!29845 Nil!20859)))))

(assert (= (and d!117991 (not res!662948)) b!991823))

(assert (= (and b!991823 res!662949) b!991824))

(declare-fun m!919635 () Bool)

(assert (=> b!991823 m!919635))

(declare-fun m!919637 () Bool)

(assert (=> b!991824 m!919637))

(assert (=> b!991767 d!117991))

(declare-fun condMapEmpty!37098 () Bool)

(declare-fun mapDefault!37098 () ValueCell!11193)

(assert (=> mapNonEmpty!37092 (= condMapEmpty!37098 (= mapRest!37092 ((as const (Array (_ BitVec 32) ValueCell!11193)) mapDefault!37098)))))

(declare-fun e!559428 () Bool)

(declare-fun mapRes!37098 () Bool)

(assert (=> mapNonEmpty!37092 (= tp!70163 (and e!559428 mapRes!37098))))

(declare-fun b!991832 () Bool)

(assert (=> b!991832 (= e!559428 tp_is_empty!23349)))

(declare-fun mapIsEmpty!37098 () Bool)

(assert (=> mapIsEmpty!37098 mapRes!37098))

(declare-fun b!991831 () Bool)

(declare-fun e!559427 () Bool)

(assert (=> b!991831 (= e!559427 tp_is_empty!23349)))

(declare-fun mapNonEmpty!37098 () Bool)

(declare-fun tp!70169 () Bool)

(assert (=> mapNonEmpty!37098 (= mapRes!37098 (and tp!70169 e!559427))))

(declare-fun mapValue!37098 () ValueCell!11193)

(declare-fun mapRest!37098 () (Array (_ BitVec 32) ValueCell!11193))

(declare-fun mapKey!37098 () (_ BitVec 32))

(assert (=> mapNonEmpty!37098 (= mapRest!37092 (store mapRest!37098 mapKey!37098 mapValue!37098))))

(assert (= (and mapNonEmpty!37092 condMapEmpty!37098) mapIsEmpty!37098))

(assert (= (and mapNonEmpty!37092 (not condMapEmpty!37098)) mapNonEmpty!37098))

(assert (= (and mapNonEmpty!37098 ((_ is ValueCellFull!11193) mapValue!37098)) b!991831))

(assert (= (and mapNonEmpty!37092 ((_ is ValueCellFull!11193) mapDefault!37098)) b!991832))

(declare-fun m!919639 () Bool)

(assert (=> mapNonEmpty!37098 m!919639))

(check-sat (not b!991818) tp_is_empty!23349 (not mapNonEmpty!37098) (not d!117989) (not b!991814) (not b!991816) (not b!991823) (not b!991824) (not b!991804) (not bm!42082) (not d!117979))
(check-sat)
