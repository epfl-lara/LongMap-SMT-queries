; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84838 () Bool)

(assert start!84838)

(declare-fun mapNonEmpty!37089 () Bool)

(declare-fun mapRes!37089 () Bool)

(declare-fun tp!70161 () Bool)

(declare-fun e!559213 () Bool)

(assert (=> mapNonEmpty!37089 (= mapRes!37089 (and tp!70161 e!559213))))

(declare-datatypes ((V!36113 0))(
  ( (V!36114 (val!11724 Int)) )
))
(declare-datatypes ((ValueCell!11192 0))(
  ( (ValueCellFull!11192 (v!14299 V!36113)) (EmptyCell!11192) )
))
(declare-fun mapValue!37089 () ValueCell!11192)

(declare-fun mapRest!37089 () (Array (_ BitVec 32) ValueCell!11192))

(declare-datatypes ((array!62596 0))(
  ( (array!62597 (arr!30144 (Array (_ BitVec 32) ValueCell!11192)) (size!30625 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62596)

(declare-fun mapKey!37089 () (_ BitVec 32))

(assert (=> mapNonEmpty!37089 (= (arr!30144 _values!1551) (store mapRest!37089 mapKey!37089 mapValue!37089))))

(declare-fun b!991497 () Bool)

(declare-fun res!662780 () Bool)

(declare-fun e!559210 () Bool)

(assert (=> b!991497 (=> (not res!662780) (not e!559210))))

(declare-datatypes ((array!62598 0))(
  ( (array!62599 (arr!30145 (Array (_ BitVec 32) (_ BitVec 64))) (size!30626 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62598)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62598 (_ BitVec 32)) Bool)

(assert (=> b!991497 (= res!662780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun mapIsEmpty!37089 () Bool)

(assert (=> mapIsEmpty!37089 mapRes!37089))

(declare-fun b!991498 () Bool)

(declare-fun res!662783 () Bool)

(assert (=> b!991498 (=> (not res!662783) (not e!559210))))

(assert (=> b!991498 (= res!662783 (and (bvsle #b00000000000000000000000000000000 (size!30626 _keys!1945)) (bvslt (size!30626 _keys!1945) #b01111111111111111111111111111111)))))

(declare-fun b!991499 () Bool)

(declare-fun e!559211 () Bool)

(declare-fun e!559215 () Bool)

(assert (=> b!991499 (= e!559211 (and e!559215 mapRes!37089))))

(declare-fun condMapEmpty!37089 () Bool)

(declare-fun mapDefault!37089 () ValueCell!11192)

(assert (=> b!991499 (= condMapEmpty!37089 (= (arr!30144 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11192)) mapDefault!37089)))))

(declare-fun b!991500 () Bool)

(declare-fun e!559212 () Bool)

(assert (=> b!991500 (= e!559210 e!559212)))

(declare-fun res!662781 () Bool)

(assert (=> b!991500 (=> res!662781 e!559212)))

(declare-datatypes ((List!20897 0))(
  ( (Nil!20894) (Cons!20893 (h!22055 (_ BitVec 64)) (t!29871 List!20897)) )
))
(declare-fun contains!5702 (List!20897 (_ BitVec 64)) Bool)

(assert (=> b!991500 (= res!662781 (contains!5702 Nil!20894 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991501 () Bool)

(declare-fun tp_is_empty!23347 () Bool)

(assert (=> b!991501 (= e!559215 tp_is_empty!23347)))

(declare-fun b!991502 () Bool)

(declare-fun res!662779 () Bool)

(assert (=> b!991502 (=> (not res!662779) (not e!559210))))

(declare-fun noDuplicate!1389 (List!20897) Bool)

(assert (=> b!991502 (= res!662779 (noDuplicate!1389 Nil!20894))))

(declare-fun b!991503 () Bool)

(assert (=> b!991503 (= e!559213 tp_is_empty!23347)))

(declare-fun res!662782 () Bool)

(assert (=> start!84838 (=> (not res!662782) (not e!559210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84838 (= res!662782 (validMask!0 mask!2471))))

(assert (=> start!84838 e!559210))

(assert (=> start!84838 true))

(declare-fun array_inv!23295 (array!62596) Bool)

(assert (=> start!84838 (and (array_inv!23295 _values!1551) e!559211)))

(declare-fun array_inv!23296 (array!62598) Bool)

(assert (=> start!84838 (array_inv!23296 _keys!1945)))

(declare-fun b!991504 () Bool)

(declare-fun res!662778 () Bool)

(assert (=> b!991504 (=> (not res!662778) (not e!559210))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!991504 (= res!662778 (and (= (size!30625 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30626 _keys!1945) (size!30625 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991505 () Bool)

(assert (=> b!991505 (= e!559212 (contains!5702 Nil!20894 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!84838 res!662782) b!991504))

(assert (= (and b!991504 res!662778) b!991497))

(assert (= (and b!991497 res!662780) b!991498))

(assert (= (and b!991498 res!662783) b!991502))

(assert (= (and b!991502 res!662779) b!991500))

(assert (= (and b!991500 (not res!662781)) b!991505))

(assert (= (and b!991499 condMapEmpty!37089) mapIsEmpty!37089))

(assert (= (and b!991499 (not condMapEmpty!37089)) mapNonEmpty!37089))

(get-info :version)

(assert (= (and mapNonEmpty!37089 ((_ is ValueCellFull!11192) mapValue!37089)) b!991503))

(assert (= (and b!991499 ((_ is ValueCellFull!11192) mapDefault!37089)) b!991501))

(assert (= start!84838 b!991499))

(declare-fun m!918807 () Bool)

(assert (=> b!991497 m!918807))

(declare-fun m!918809 () Bool)

(assert (=> start!84838 m!918809))

(declare-fun m!918811 () Bool)

(assert (=> start!84838 m!918811))

(declare-fun m!918813 () Bool)

(assert (=> start!84838 m!918813))

(declare-fun m!918815 () Bool)

(assert (=> b!991500 m!918815))

(declare-fun m!918817 () Bool)

(assert (=> b!991505 m!918817))

(declare-fun m!918819 () Bool)

(assert (=> b!991502 m!918819))

(declare-fun m!918821 () Bool)

(assert (=> mapNonEmpty!37089 m!918821))

(check-sat (not b!991502) (not b!991500) (not start!84838) (not b!991505) (not mapNonEmpty!37089) tp_is_empty!23347 (not b!991497))
(check-sat)
(get-model)

(declare-fun d!117781 () Bool)

(declare-fun lt!439777 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!424 (List!20897) (InoxSet (_ BitVec 64)))

(assert (=> d!117781 (= lt!439777 (select (content!424 Nil!20894) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!559257 () Bool)

(assert (=> d!117781 (= lt!439777 e!559257)))

(declare-fun res!662824 () Bool)

(assert (=> d!117781 (=> (not res!662824) (not e!559257))))

(assert (=> d!117781 (= res!662824 ((_ is Cons!20893) Nil!20894))))

(assert (=> d!117781 (= (contains!5702 Nil!20894 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439777)))

(declare-fun b!991564 () Bool)

(declare-fun e!559256 () Bool)

(assert (=> b!991564 (= e!559257 e!559256)))

(declare-fun res!662825 () Bool)

(assert (=> b!991564 (=> res!662825 e!559256)))

(assert (=> b!991564 (= res!662825 (= (h!22055 Nil!20894) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991565 () Bool)

(assert (=> b!991565 (= e!559256 (contains!5702 (t!29871 Nil!20894) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!117781 res!662824) b!991564))

(assert (= (and b!991564 (not res!662825)) b!991565))

(declare-fun m!918855 () Bool)

(assert (=> d!117781 m!918855))

(declare-fun m!918857 () Bool)

(assert (=> d!117781 m!918857))

(declare-fun m!918859 () Bool)

(assert (=> b!991565 m!918859))

(assert (=> b!991505 d!117781))

(declare-fun d!117783 () Bool)

(declare-fun lt!439778 () Bool)

(assert (=> d!117783 (= lt!439778 (select (content!424 Nil!20894) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!559259 () Bool)

(assert (=> d!117783 (= lt!439778 e!559259)))

(declare-fun res!662826 () Bool)

(assert (=> d!117783 (=> (not res!662826) (not e!559259))))

(assert (=> d!117783 (= res!662826 ((_ is Cons!20893) Nil!20894))))

(assert (=> d!117783 (= (contains!5702 Nil!20894 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439778)))

(declare-fun b!991566 () Bool)

(declare-fun e!559258 () Bool)

(assert (=> b!991566 (= e!559259 e!559258)))

(declare-fun res!662827 () Bool)

(assert (=> b!991566 (=> res!662827 e!559258)))

(assert (=> b!991566 (= res!662827 (= (h!22055 Nil!20894) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!991567 () Bool)

(assert (=> b!991567 (= e!559258 (contains!5702 (t!29871 Nil!20894) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!117783 res!662826) b!991566))

(assert (= (and b!991566 (not res!662827)) b!991567))

(assert (=> d!117783 m!918855))

(declare-fun m!918861 () Bool)

(assert (=> d!117783 m!918861))

(declare-fun m!918863 () Bool)

(assert (=> b!991567 m!918863))

(assert (=> b!991500 d!117783))

(declare-fun b!991576 () Bool)

(declare-fun e!559268 () Bool)

(declare-fun call!42059 () Bool)

(assert (=> b!991576 (= e!559268 call!42059)))

(declare-fun b!991577 () Bool)

(declare-fun e!559267 () Bool)

(assert (=> b!991577 (= e!559267 call!42059)))

(declare-fun b!991578 () Bool)

(assert (=> b!991578 (= e!559267 e!559268)))

(declare-fun lt!439786 () (_ BitVec 64))

(assert (=> b!991578 (= lt!439786 (select (arr!30145 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32773 0))(
  ( (Unit!32774) )
))
(declare-fun lt!439785 () Unit!32773)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62598 (_ BitVec 64) (_ BitVec 32)) Unit!32773)

(assert (=> b!991578 (= lt!439785 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!439786 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!991578 (arrayContainsKey!0 _keys!1945 lt!439786 #b00000000000000000000000000000000)))

(declare-fun lt!439787 () Unit!32773)

(assert (=> b!991578 (= lt!439787 lt!439785)))

(declare-fun res!662833 () Bool)

(declare-datatypes ((SeekEntryResult!9212 0))(
  ( (MissingZero!9212 (index!39219 (_ BitVec 32))) (Found!9212 (index!39220 (_ BitVec 32))) (Intermediate!9212 (undefined!10024 Bool) (index!39221 (_ BitVec 32)) (x!86288 (_ BitVec 32))) (Undefined!9212) (MissingVacant!9212 (index!39222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62598 (_ BitVec 32)) SeekEntryResult!9212)

(assert (=> b!991578 (= res!662833 (= (seekEntryOrOpen!0 (select (arr!30145 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9212 #b00000000000000000000000000000000)))))

(assert (=> b!991578 (=> (not res!662833) (not e!559268))))

(declare-fun d!117785 () Bool)

(declare-fun res!662832 () Bool)

(declare-fun e!559266 () Bool)

(assert (=> d!117785 (=> res!662832 e!559266)))

(assert (=> d!117785 (= res!662832 (bvsge #b00000000000000000000000000000000 (size!30626 _keys!1945)))))

(assert (=> d!117785 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!559266)))

(declare-fun b!991579 () Bool)

(assert (=> b!991579 (= e!559266 e!559267)))

(declare-fun c!100571 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991579 (= c!100571 (validKeyInArray!0 (select (arr!30145 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun bm!42056 () Bool)

(assert (=> bm!42056 (= call!42059 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(assert (= (and d!117785 (not res!662832)) b!991579))

(assert (= (and b!991579 c!100571) b!991578))

(assert (= (and b!991579 (not c!100571)) b!991577))

(assert (= (and b!991578 res!662833) b!991576))

(assert (= (or b!991576 b!991577) bm!42056))

(declare-fun m!918865 () Bool)

(assert (=> b!991578 m!918865))

(declare-fun m!918867 () Bool)

(assert (=> b!991578 m!918867))

(declare-fun m!918869 () Bool)

(assert (=> b!991578 m!918869))

(assert (=> b!991578 m!918865))

(declare-fun m!918871 () Bool)

(assert (=> b!991578 m!918871))

(assert (=> b!991579 m!918865))

(assert (=> b!991579 m!918865))

(declare-fun m!918873 () Bool)

(assert (=> b!991579 m!918873))

(declare-fun m!918875 () Bool)

(assert (=> bm!42056 m!918875))

(assert (=> b!991497 d!117785))

(declare-fun d!117787 () Bool)

(declare-fun res!662838 () Bool)

(declare-fun e!559273 () Bool)

(assert (=> d!117787 (=> res!662838 e!559273)))

(assert (=> d!117787 (= res!662838 ((_ is Nil!20894) Nil!20894))))

(assert (=> d!117787 (= (noDuplicate!1389 Nil!20894) e!559273)))

(declare-fun b!991584 () Bool)

(declare-fun e!559274 () Bool)

(assert (=> b!991584 (= e!559273 e!559274)))

(declare-fun res!662839 () Bool)

(assert (=> b!991584 (=> (not res!662839) (not e!559274))))

(assert (=> b!991584 (= res!662839 (not (contains!5702 (t!29871 Nil!20894) (h!22055 Nil!20894))))))

(declare-fun b!991585 () Bool)

(assert (=> b!991585 (= e!559274 (noDuplicate!1389 (t!29871 Nil!20894)))))

(assert (= (and d!117787 (not res!662838)) b!991584))

(assert (= (and b!991584 res!662839) b!991585))

(declare-fun m!918877 () Bool)

(assert (=> b!991584 m!918877))

(declare-fun m!918879 () Bool)

(assert (=> b!991585 m!918879))

(assert (=> b!991502 d!117787))

(declare-fun d!117789 () Bool)

(assert (=> d!117789 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84838 d!117789))

(declare-fun d!117791 () Bool)

(assert (=> d!117791 (= (array_inv!23295 _values!1551) (bvsge (size!30625 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84838 d!117791))

(declare-fun d!117793 () Bool)

(assert (=> d!117793 (= (array_inv!23296 _keys!1945) (bvsge (size!30626 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84838 d!117793))

(declare-fun b!991592 () Bool)

(declare-fun e!559280 () Bool)

(assert (=> b!991592 (= e!559280 tp_is_empty!23347)))

(declare-fun b!991593 () Bool)

(declare-fun e!559279 () Bool)

(assert (=> b!991593 (= e!559279 tp_is_empty!23347)))

(declare-fun mapNonEmpty!37098 () Bool)

(declare-fun mapRes!37098 () Bool)

(declare-fun tp!70170 () Bool)

(assert (=> mapNonEmpty!37098 (= mapRes!37098 (and tp!70170 e!559280))))

(declare-fun mapRest!37098 () (Array (_ BitVec 32) ValueCell!11192))

(declare-fun mapValue!37098 () ValueCell!11192)

(declare-fun mapKey!37098 () (_ BitVec 32))

(assert (=> mapNonEmpty!37098 (= mapRest!37089 (store mapRest!37098 mapKey!37098 mapValue!37098))))

(declare-fun condMapEmpty!37098 () Bool)

(declare-fun mapDefault!37098 () ValueCell!11192)

(assert (=> mapNonEmpty!37089 (= condMapEmpty!37098 (= mapRest!37089 ((as const (Array (_ BitVec 32) ValueCell!11192)) mapDefault!37098)))))

(assert (=> mapNonEmpty!37089 (= tp!70161 (and e!559279 mapRes!37098))))

(declare-fun mapIsEmpty!37098 () Bool)

(assert (=> mapIsEmpty!37098 mapRes!37098))

(assert (= (and mapNonEmpty!37089 condMapEmpty!37098) mapIsEmpty!37098))

(assert (= (and mapNonEmpty!37089 (not condMapEmpty!37098)) mapNonEmpty!37098))

(assert (= (and mapNonEmpty!37098 ((_ is ValueCellFull!11192) mapValue!37098)) b!991592))

(assert (= (and mapNonEmpty!37089 ((_ is ValueCellFull!11192) mapDefault!37098)) b!991593))

(declare-fun m!918881 () Bool)

(assert (=> mapNonEmpty!37098 m!918881))

(check-sat (not b!991585) (not d!117783) (not b!991567) (not b!991584) (not d!117781) (not mapNonEmpty!37098) (not b!991578) (not b!991565) tp_is_empty!23347 (not b!991579) (not bm!42056))
(check-sat)
