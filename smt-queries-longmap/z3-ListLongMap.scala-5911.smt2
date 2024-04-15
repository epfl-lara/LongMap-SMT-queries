; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76536 () Bool)

(assert start!76536)

(declare-fun b!896739 () Bool)

(declare-fun b_free!15967 () Bool)

(declare-fun b_next!15967 () Bool)

(assert (=> b!896739 (= b_free!15967 (not b_next!15967))))

(declare-fun tp!55945 () Bool)

(declare-fun b_and!26233 () Bool)

(assert (=> b!896739 (= tp!55945 b_and!26233)))

(declare-fun res!606288 () Bool)

(declare-fun e!501326 () Bool)

(assert (=> start!76536 (=> (not res!606288) (not e!501326))))

(declare-datatypes ((array!52595 0))(
  ( (array!52596 (arr!25283 (Array (_ BitVec 32) (_ BitVec 64))) (size!25738 (_ BitVec 32))) )
))
(declare-datatypes ((V!29359 0))(
  ( (V!29360 (val!9198 Int)) )
))
(declare-datatypes ((ValueCell!8666 0))(
  ( (ValueCellFull!8666 (v!11685 V!29359)) (EmptyCell!8666) )
))
(declare-datatypes ((array!52597 0))(
  ( (array!52598 (arr!25284 (Array (_ BitVec 32) ValueCell!8666)) (size!25739 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4348 0))(
  ( (LongMapFixedSize!4349 (defaultEntry!5386 Int) (mask!26047 (_ BitVec 32)) (extraKeys!5092 (_ BitVec 32)) (zeroValue!5196 V!29359) (minValue!5196 V!29359) (_size!2229 (_ BitVec 32)) (_keys!10128 array!52595) (_values!5383 array!52597) (_vacant!2229 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4348)

(declare-fun valid!1681 (LongMapFixedSize!4348) Bool)

(assert (=> start!76536 (= res!606288 (valid!1681 thiss!1181))))

(assert (=> start!76536 e!501326))

(declare-fun e!501324 () Bool)

(assert (=> start!76536 e!501324))

(assert (=> start!76536 true))

(declare-fun mapNonEmpty!29071 () Bool)

(declare-fun mapRes!29071 () Bool)

(declare-fun tp!55944 () Bool)

(declare-fun e!501329 () Bool)

(assert (=> mapNonEmpty!29071 (= mapRes!29071 (and tp!55944 e!501329))))

(declare-fun mapRest!29071 () (Array (_ BitVec 32) ValueCell!8666))

(declare-fun mapValue!29071 () ValueCell!8666)

(declare-fun mapKey!29071 () (_ BitVec 32))

(assert (=> mapNonEmpty!29071 (= (arr!25284 (_values!5383 thiss!1181)) (store mapRest!29071 mapKey!29071 mapValue!29071))))

(declare-fun b!896736 () Bool)

(declare-fun e!501322 () Bool)

(declare-fun tp_is_empty!18295 () Bool)

(assert (=> b!896736 (= e!501322 tp_is_empty!18295)))

(declare-fun b!896737 () Bool)

(declare-fun e!501327 () Bool)

(assert (=> b!896737 (= e!501327 (and e!501322 mapRes!29071))))

(declare-fun condMapEmpty!29071 () Bool)

(declare-fun mapDefault!29071 () ValueCell!8666)

(assert (=> b!896737 (= condMapEmpty!29071 (= (arr!25284 (_values!5383 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8666)) mapDefault!29071)))))

(declare-fun b!896738 () Bool)

(declare-fun e!501323 () Bool)

(declare-datatypes ((SeekEntryResult!8907 0))(
  ( (MissingZero!8907 (index!37999 (_ BitVec 32))) (Found!8907 (index!38000 (_ BitVec 32))) (Intermediate!8907 (undefined!9719 Bool) (index!38001 (_ BitVec 32)) (x!76401 (_ BitVec 32))) (Undefined!8907) (MissingVacant!8907 (index!38002 (_ BitVec 32))) )
))
(declare-fun lt!404779 () SeekEntryResult!8907)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896738 (= e!501323 (inRange!0 (index!38000 lt!404779) (mask!26047 thiss!1181)))))

(declare-fun array_inv!19898 (array!52595) Bool)

(declare-fun array_inv!19899 (array!52597) Bool)

(assert (=> b!896739 (= e!501324 (and tp!55945 tp_is_empty!18295 (array_inv!19898 (_keys!10128 thiss!1181)) (array_inv!19899 (_values!5383 thiss!1181)) e!501327))))

(declare-fun b!896740 () Bool)

(declare-fun e!501325 () Bool)

(assert (=> b!896740 (= e!501326 (not e!501325))))

(declare-fun res!606285 () Bool)

(assert (=> b!896740 (=> res!606285 e!501325)))

(get-info :version)

(assert (=> b!896740 (= res!606285 (not ((_ is Found!8907) lt!404779)))))

(assert (=> b!896740 e!501323))

(declare-fun res!606289 () Bool)

(assert (=> b!896740 (=> res!606289 e!501323)))

(assert (=> b!896740 (= res!606289 (not ((_ is Found!8907) lt!404779)))))

(declare-datatypes ((Unit!30438 0))(
  ( (Unit!30439) )
))
(declare-fun lt!404778 () Unit!30438)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!77 (array!52595 array!52597 (_ BitVec 32) (_ BitVec 32) V!29359 V!29359 (_ BitVec 64)) Unit!30438)

(assert (=> b!896740 (= lt!404778 (lemmaSeekEntryGivesInRangeIndex!77 (_keys!10128 thiss!1181) (_values!5383 thiss!1181) (mask!26047 thiss!1181) (extraKeys!5092 thiss!1181) (zeroValue!5196 thiss!1181) (minValue!5196 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52595 (_ BitVec 32)) SeekEntryResult!8907)

(assert (=> b!896740 (= lt!404779 (seekEntry!0 key!785 (_keys!10128 thiss!1181) (mask!26047 thiss!1181)))))

(declare-fun b!896741 () Bool)

(declare-fun e!501321 () Bool)

(assert (=> b!896741 (= e!501321 (or (not (= (size!25739 (_values!5383 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26047 thiss!1181)))) (not (= (size!25738 (_keys!10128 thiss!1181)) (size!25739 (_values!5383 thiss!1181)))) (bvsge (mask!26047 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!896742 () Bool)

(assert (=> b!896742 (= e!501329 tp_is_empty!18295)))

(declare-fun b!896743 () Bool)

(declare-fun res!606287 () Bool)

(assert (=> b!896743 (=> (not res!606287) (not e!501326))))

(assert (=> b!896743 (= res!606287 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!29071 () Bool)

(assert (=> mapIsEmpty!29071 mapRes!29071))

(declare-fun b!896744 () Bool)

(assert (=> b!896744 (= e!501325 e!501321)))

(declare-fun res!606286 () Bool)

(assert (=> b!896744 (=> res!606286 e!501321)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896744 (= res!606286 (not (validMask!0 (mask!26047 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896744 (arrayContainsKey!0 (_keys!10128 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404780 () Unit!30438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52595 (_ BitVec 64) (_ BitVec 32)) Unit!30438)

(assert (=> b!896744 (= lt!404780 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10128 thiss!1181) key!785 (index!38000 lt!404779)))))

(assert (= (and start!76536 res!606288) b!896743))

(assert (= (and b!896743 res!606287) b!896740))

(assert (= (and b!896740 (not res!606289)) b!896738))

(assert (= (and b!896740 (not res!606285)) b!896744))

(assert (= (and b!896744 (not res!606286)) b!896741))

(assert (= (and b!896737 condMapEmpty!29071) mapIsEmpty!29071))

(assert (= (and b!896737 (not condMapEmpty!29071)) mapNonEmpty!29071))

(assert (= (and mapNonEmpty!29071 ((_ is ValueCellFull!8666) mapValue!29071)) b!896742))

(assert (= (and b!896737 ((_ is ValueCellFull!8666) mapDefault!29071)) b!896736))

(assert (= b!896739 b!896737))

(assert (= start!76536 b!896739))

(declare-fun m!833185 () Bool)

(assert (=> b!896740 m!833185))

(declare-fun m!833187 () Bool)

(assert (=> b!896740 m!833187))

(declare-fun m!833189 () Bool)

(assert (=> b!896744 m!833189))

(declare-fun m!833191 () Bool)

(assert (=> b!896744 m!833191))

(declare-fun m!833193 () Bool)

(assert (=> b!896744 m!833193))

(declare-fun m!833195 () Bool)

(assert (=> b!896738 m!833195))

(declare-fun m!833197 () Bool)

(assert (=> mapNonEmpty!29071 m!833197))

(declare-fun m!833199 () Bool)

(assert (=> start!76536 m!833199))

(declare-fun m!833201 () Bool)

(assert (=> b!896739 m!833201))

(declare-fun m!833203 () Bool)

(assert (=> b!896739 m!833203))

(check-sat tp_is_empty!18295 (not b!896740) (not mapNonEmpty!29071) (not b_next!15967) (not b!896738) (not b!896744) (not start!76536) (not b!896739) b_and!26233)
(check-sat b_and!26233 (not b_next!15967))
(get-model)

(declare-fun d!110815 () Bool)

(declare-fun res!606326 () Bool)

(declare-fun e!501386 () Bool)

(assert (=> d!110815 (=> (not res!606326) (not e!501386))))

(declare-fun simpleValid!316 (LongMapFixedSize!4348) Bool)

(assert (=> d!110815 (= res!606326 (simpleValid!316 thiss!1181))))

(assert (=> d!110815 (= (valid!1681 thiss!1181) e!501386)))

(declare-fun b!896805 () Bool)

(declare-fun res!606327 () Bool)

(assert (=> b!896805 (=> (not res!606327) (not e!501386))))

(declare-fun arrayCountValidKeys!0 (array!52595 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896805 (= res!606327 (= (arrayCountValidKeys!0 (_keys!10128 thiss!1181) #b00000000000000000000000000000000 (size!25738 (_keys!10128 thiss!1181))) (_size!2229 thiss!1181)))))

(declare-fun b!896806 () Bool)

(declare-fun res!606328 () Bool)

(assert (=> b!896806 (=> (not res!606328) (not e!501386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52595 (_ BitVec 32)) Bool)

(assert (=> b!896806 (= res!606328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10128 thiss!1181) (mask!26047 thiss!1181)))))

(declare-fun b!896807 () Bool)

(declare-datatypes ((List!17834 0))(
  ( (Nil!17831) (Cons!17830 (h!18970 (_ BitVec 64)) (t!25164 List!17834)) )
))
(declare-fun arrayNoDuplicates!0 (array!52595 (_ BitVec 32) List!17834) Bool)

(assert (=> b!896807 (= e!501386 (arrayNoDuplicates!0 (_keys!10128 thiss!1181) #b00000000000000000000000000000000 Nil!17831))))

(assert (= (and d!110815 res!606326) b!896805))

(assert (= (and b!896805 res!606327) b!896806))

(assert (= (and b!896806 res!606328) b!896807))

(declare-fun m!833245 () Bool)

(assert (=> d!110815 m!833245))

(declare-fun m!833247 () Bool)

(assert (=> b!896805 m!833247))

(declare-fun m!833249 () Bool)

(assert (=> b!896806 m!833249))

(declare-fun m!833251 () Bool)

(assert (=> b!896807 m!833251))

(assert (=> start!76536 d!110815))

(declare-fun d!110817 () Bool)

(assert (=> d!110817 (= (validMask!0 (mask!26047 thiss!1181)) (and (or (= (mask!26047 thiss!1181) #b00000000000000000000000000000111) (= (mask!26047 thiss!1181) #b00000000000000000000000000001111) (= (mask!26047 thiss!1181) #b00000000000000000000000000011111) (= (mask!26047 thiss!1181) #b00000000000000000000000000111111) (= (mask!26047 thiss!1181) #b00000000000000000000000001111111) (= (mask!26047 thiss!1181) #b00000000000000000000000011111111) (= (mask!26047 thiss!1181) #b00000000000000000000000111111111) (= (mask!26047 thiss!1181) #b00000000000000000000001111111111) (= (mask!26047 thiss!1181) #b00000000000000000000011111111111) (= (mask!26047 thiss!1181) #b00000000000000000000111111111111) (= (mask!26047 thiss!1181) #b00000000000000000001111111111111) (= (mask!26047 thiss!1181) #b00000000000000000011111111111111) (= (mask!26047 thiss!1181) #b00000000000000000111111111111111) (= (mask!26047 thiss!1181) #b00000000000000001111111111111111) (= (mask!26047 thiss!1181) #b00000000000000011111111111111111) (= (mask!26047 thiss!1181) #b00000000000000111111111111111111) (= (mask!26047 thiss!1181) #b00000000000001111111111111111111) (= (mask!26047 thiss!1181) #b00000000000011111111111111111111) (= (mask!26047 thiss!1181) #b00000000000111111111111111111111) (= (mask!26047 thiss!1181) #b00000000001111111111111111111111) (= (mask!26047 thiss!1181) #b00000000011111111111111111111111) (= (mask!26047 thiss!1181) #b00000000111111111111111111111111) (= (mask!26047 thiss!1181) #b00000001111111111111111111111111) (= (mask!26047 thiss!1181) #b00000011111111111111111111111111) (= (mask!26047 thiss!1181) #b00000111111111111111111111111111) (= (mask!26047 thiss!1181) #b00001111111111111111111111111111) (= (mask!26047 thiss!1181) #b00011111111111111111111111111111) (= (mask!26047 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26047 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!896744 d!110817))

(declare-fun d!110819 () Bool)

(declare-fun res!606333 () Bool)

(declare-fun e!501391 () Bool)

(assert (=> d!110819 (=> res!606333 e!501391)))

(assert (=> d!110819 (= res!606333 (= (select (arr!25283 (_keys!10128 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110819 (= (arrayContainsKey!0 (_keys!10128 thiss!1181) key!785 #b00000000000000000000000000000000) e!501391)))

(declare-fun b!896812 () Bool)

(declare-fun e!501392 () Bool)

(assert (=> b!896812 (= e!501391 e!501392)))

(declare-fun res!606334 () Bool)

(assert (=> b!896812 (=> (not res!606334) (not e!501392))))

(assert (=> b!896812 (= res!606334 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25738 (_keys!10128 thiss!1181))))))

(declare-fun b!896813 () Bool)

(assert (=> b!896813 (= e!501392 (arrayContainsKey!0 (_keys!10128 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110819 (not res!606333)) b!896812))

(assert (= (and b!896812 res!606334) b!896813))

(declare-fun m!833253 () Bool)

(assert (=> d!110819 m!833253))

(declare-fun m!833255 () Bool)

(assert (=> b!896813 m!833255))

(assert (=> b!896744 d!110819))

(declare-fun d!110821 () Bool)

(assert (=> d!110821 (arrayContainsKey!0 (_keys!10128 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404801 () Unit!30438)

(declare-fun choose!13 (array!52595 (_ BitVec 64) (_ BitVec 32)) Unit!30438)

(assert (=> d!110821 (= lt!404801 (choose!13 (_keys!10128 thiss!1181) key!785 (index!38000 lt!404779)))))

(assert (=> d!110821 (bvsge (index!38000 lt!404779) #b00000000000000000000000000000000)))

(assert (=> d!110821 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10128 thiss!1181) key!785 (index!38000 lt!404779)) lt!404801)))

(declare-fun bs!25147 () Bool)

(assert (= bs!25147 d!110821))

(assert (=> bs!25147 m!833191))

(declare-fun m!833257 () Bool)

(assert (=> bs!25147 m!833257))

(assert (=> b!896744 d!110821))

(declare-fun d!110823 () Bool)

(declare-fun e!501395 () Bool)

(assert (=> d!110823 e!501395))

(declare-fun res!606337 () Bool)

(assert (=> d!110823 (=> res!606337 e!501395)))

(declare-fun lt!404807 () SeekEntryResult!8907)

(assert (=> d!110823 (= res!606337 (not ((_ is Found!8907) lt!404807)))))

(assert (=> d!110823 (= lt!404807 (seekEntry!0 key!785 (_keys!10128 thiss!1181) (mask!26047 thiss!1181)))))

(declare-fun lt!404806 () Unit!30438)

(declare-fun choose!1490 (array!52595 array!52597 (_ BitVec 32) (_ BitVec 32) V!29359 V!29359 (_ BitVec 64)) Unit!30438)

(assert (=> d!110823 (= lt!404806 (choose!1490 (_keys!10128 thiss!1181) (_values!5383 thiss!1181) (mask!26047 thiss!1181) (extraKeys!5092 thiss!1181) (zeroValue!5196 thiss!1181) (minValue!5196 thiss!1181) key!785))))

(assert (=> d!110823 (validMask!0 (mask!26047 thiss!1181))))

(assert (=> d!110823 (= (lemmaSeekEntryGivesInRangeIndex!77 (_keys!10128 thiss!1181) (_values!5383 thiss!1181) (mask!26047 thiss!1181) (extraKeys!5092 thiss!1181) (zeroValue!5196 thiss!1181) (minValue!5196 thiss!1181) key!785) lt!404806)))

(declare-fun b!896816 () Bool)

(assert (=> b!896816 (= e!501395 (inRange!0 (index!38000 lt!404807) (mask!26047 thiss!1181)))))

(assert (= (and d!110823 (not res!606337)) b!896816))

(assert (=> d!110823 m!833187))

(declare-fun m!833259 () Bool)

(assert (=> d!110823 m!833259))

(assert (=> d!110823 m!833189))

(declare-fun m!833261 () Bool)

(assert (=> b!896816 m!833261))

(assert (=> b!896740 d!110823))

(declare-fun b!896829 () Bool)

(declare-fun e!501403 () SeekEntryResult!8907)

(declare-fun lt!404819 () SeekEntryResult!8907)

(assert (=> b!896829 (= e!501403 (ite ((_ is MissingVacant!8907) lt!404819) (MissingZero!8907 (index!38002 lt!404819)) lt!404819))))

(declare-fun lt!404818 () SeekEntryResult!8907)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52595 (_ BitVec 32)) SeekEntryResult!8907)

(assert (=> b!896829 (= lt!404819 (seekKeyOrZeroReturnVacant!0 (x!76401 lt!404818) (index!38001 lt!404818) (index!38001 lt!404818) key!785 (_keys!10128 thiss!1181) (mask!26047 thiss!1181)))))

(declare-fun b!896830 () Bool)

(assert (=> b!896830 (= e!501403 (MissingZero!8907 (index!38001 lt!404818)))))

(declare-fun b!896831 () Bool)

(declare-fun e!501404 () SeekEntryResult!8907)

(declare-fun e!501402 () SeekEntryResult!8907)

(assert (=> b!896831 (= e!501404 e!501402)))

(declare-fun lt!404817 () (_ BitVec 64))

(assert (=> b!896831 (= lt!404817 (select (arr!25283 (_keys!10128 thiss!1181)) (index!38001 lt!404818)))))

(declare-fun c!94712 () Bool)

(assert (=> b!896831 (= c!94712 (= lt!404817 key!785))))

(declare-fun b!896832 () Bool)

(assert (=> b!896832 (= e!501402 (Found!8907 (index!38001 lt!404818)))))

(declare-fun b!896833 () Bool)

(declare-fun c!94713 () Bool)

(assert (=> b!896833 (= c!94713 (= lt!404817 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896833 (= e!501402 e!501403)))

(declare-fun b!896834 () Bool)

(assert (=> b!896834 (= e!501404 Undefined!8907)))

(declare-fun d!110825 () Bool)

(declare-fun lt!404816 () SeekEntryResult!8907)

(assert (=> d!110825 (and (or ((_ is MissingVacant!8907) lt!404816) (not ((_ is Found!8907) lt!404816)) (and (bvsge (index!38000 lt!404816) #b00000000000000000000000000000000) (bvslt (index!38000 lt!404816) (size!25738 (_keys!10128 thiss!1181))))) (not ((_ is MissingVacant!8907) lt!404816)) (or (not ((_ is Found!8907) lt!404816)) (= (select (arr!25283 (_keys!10128 thiss!1181)) (index!38000 lt!404816)) key!785)))))

(assert (=> d!110825 (= lt!404816 e!501404)))

(declare-fun c!94711 () Bool)

(assert (=> d!110825 (= c!94711 (and ((_ is Intermediate!8907) lt!404818) (undefined!9719 lt!404818)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52595 (_ BitVec 32)) SeekEntryResult!8907)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110825 (= lt!404818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26047 thiss!1181)) key!785 (_keys!10128 thiss!1181) (mask!26047 thiss!1181)))))

(assert (=> d!110825 (validMask!0 (mask!26047 thiss!1181))))

(assert (=> d!110825 (= (seekEntry!0 key!785 (_keys!10128 thiss!1181) (mask!26047 thiss!1181)) lt!404816)))

(assert (= (and d!110825 c!94711) b!896834))

(assert (= (and d!110825 (not c!94711)) b!896831))

(assert (= (and b!896831 c!94712) b!896832))

(assert (= (and b!896831 (not c!94712)) b!896833))

(assert (= (and b!896833 c!94713) b!896830))

(assert (= (and b!896833 (not c!94713)) b!896829))

(declare-fun m!833263 () Bool)

(assert (=> b!896829 m!833263))

(declare-fun m!833265 () Bool)

(assert (=> b!896831 m!833265))

(declare-fun m!833267 () Bool)

(assert (=> d!110825 m!833267))

(declare-fun m!833269 () Bool)

(assert (=> d!110825 m!833269))

(assert (=> d!110825 m!833269))

(declare-fun m!833271 () Bool)

(assert (=> d!110825 m!833271))

(assert (=> d!110825 m!833189))

(assert (=> b!896740 d!110825))

(declare-fun d!110827 () Bool)

(assert (=> d!110827 (= (inRange!0 (index!38000 lt!404779) (mask!26047 thiss!1181)) (and (bvsge (index!38000 lt!404779) #b00000000000000000000000000000000) (bvslt (index!38000 lt!404779) (bvadd (mask!26047 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896738 d!110827))

(declare-fun d!110829 () Bool)

(assert (=> d!110829 (= (array_inv!19898 (_keys!10128 thiss!1181)) (bvsge (size!25738 (_keys!10128 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896739 d!110829))

(declare-fun d!110831 () Bool)

(assert (=> d!110831 (= (array_inv!19899 (_values!5383 thiss!1181)) (bvsge (size!25739 (_values!5383 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896739 d!110831))

(declare-fun condMapEmpty!29080 () Bool)

(declare-fun mapDefault!29080 () ValueCell!8666)

(assert (=> mapNonEmpty!29071 (= condMapEmpty!29080 (= mapRest!29071 ((as const (Array (_ BitVec 32) ValueCell!8666)) mapDefault!29080)))))

(declare-fun e!501410 () Bool)

(declare-fun mapRes!29080 () Bool)

(assert (=> mapNonEmpty!29071 (= tp!55944 (and e!501410 mapRes!29080))))

(declare-fun b!896842 () Bool)

(assert (=> b!896842 (= e!501410 tp_is_empty!18295)))

(declare-fun mapNonEmpty!29080 () Bool)

(declare-fun tp!55960 () Bool)

(declare-fun e!501409 () Bool)

(assert (=> mapNonEmpty!29080 (= mapRes!29080 (and tp!55960 e!501409))))

(declare-fun mapKey!29080 () (_ BitVec 32))

(declare-fun mapValue!29080 () ValueCell!8666)

(declare-fun mapRest!29080 () (Array (_ BitVec 32) ValueCell!8666))

(assert (=> mapNonEmpty!29080 (= mapRest!29071 (store mapRest!29080 mapKey!29080 mapValue!29080))))

(declare-fun mapIsEmpty!29080 () Bool)

(assert (=> mapIsEmpty!29080 mapRes!29080))

(declare-fun b!896841 () Bool)

(assert (=> b!896841 (= e!501409 tp_is_empty!18295)))

(assert (= (and mapNonEmpty!29071 condMapEmpty!29080) mapIsEmpty!29080))

(assert (= (and mapNonEmpty!29071 (not condMapEmpty!29080)) mapNonEmpty!29080))

(assert (= (and mapNonEmpty!29080 ((_ is ValueCellFull!8666) mapValue!29080)) b!896841))

(assert (= (and mapNonEmpty!29071 ((_ is ValueCellFull!8666) mapDefault!29080)) b!896842))

(declare-fun m!833273 () Bool)

(assert (=> mapNonEmpty!29080 m!833273))

(check-sat (not d!110825) (not mapNonEmpty!29080) (not b!896816) (not b!896807) (not d!110815) (not b_next!15967) (not b!896806) b_and!26233 (not b!896829) tp_is_empty!18295 (not b!896813) (not d!110823) (not d!110821) (not b!896805))
(check-sat b_and!26233 (not b_next!15967))
