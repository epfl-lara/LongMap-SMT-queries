; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85024 () Bool)

(assert start!85024)

(declare-fun b!992639 () Bool)

(declare-fun e!559940 () Bool)

(declare-fun e!559945 () Bool)

(assert (=> b!992639 (= e!559940 e!559945)))

(declare-fun res!663236 () Bool)

(assert (=> b!992639 (=> res!663236 e!559945)))

(declare-datatypes ((List!20850 0))(
  ( (Nil!20847) (Cons!20846 (h!22014 (_ BitVec 64)) (t!29825 List!20850)) )
))
(declare-fun contains!5752 (List!20850 (_ BitVec 64)) Bool)

(assert (=> b!992639 (= res!663236 (contains!5752 Nil!20847 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37089 () Bool)

(declare-fun mapRes!37089 () Bool)

(declare-fun tp!70161 () Bool)

(declare-fun e!559944 () Bool)

(assert (=> mapNonEmpty!37089 (= mapRes!37089 (and tp!70161 e!559944))))

(declare-datatypes ((V!36113 0))(
  ( (V!36114 (val!11724 Int)) )
))
(declare-datatypes ((ValueCell!11192 0))(
  ( (ValueCellFull!11192 (v!14297 V!36113)) (EmptyCell!11192) )
))
(declare-fun mapValue!37089 () ValueCell!11192)

(declare-fun mapRest!37089 () (Array (_ BitVec 32) ValueCell!11192))

(declare-fun mapKey!37089 () (_ BitVec 32))

(declare-datatypes ((array!62708 0))(
  ( (array!62709 (arr!30195 (Array (_ BitVec 32) ValueCell!11192)) (size!30675 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62708)

(assert (=> mapNonEmpty!37089 (= (arr!30195 _values!1551) (store mapRest!37089 mapKey!37089 mapValue!37089))))

(declare-fun b!992640 () Bool)

(declare-fun e!559943 () Bool)

(declare-fun e!559942 () Bool)

(assert (=> b!992640 (= e!559943 (and e!559942 mapRes!37089))))

(declare-fun condMapEmpty!37089 () Bool)

(declare-fun mapDefault!37089 () ValueCell!11192)

(assert (=> b!992640 (= condMapEmpty!37089 (= (arr!30195 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11192)) mapDefault!37089)))))

(declare-fun b!992641 () Bool)

(declare-fun res!663235 () Bool)

(assert (=> b!992641 (=> (not res!663235) (not e!559940))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62710 0))(
  ( (array!62711 (arr!30196 (Array (_ BitVec 32) (_ BitVec 64))) (size!30676 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62710)

(assert (=> b!992641 (= res!663235 (and (= (size!30675 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30676 _keys!1945) (size!30675 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!992642 () Bool)

(declare-fun tp_is_empty!23347 () Bool)

(assert (=> b!992642 (= e!559944 tp_is_empty!23347)))

(declare-fun b!992643 () Bool)

(assert (=> b!992643 (= e!559945 (contains!5752 Nil!20847 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37089 () Bool)

(assert (=> mapIsEmpty!37089 mapRes!37089))

(declare-fun res!663234 () Bool)

(assert (=> start!85024 (=> (not res!663234) (not e!559940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85024 (= res!663234 (validMask!0 mask!2471))))

(assert (=> start!85024 e!559940))

(assert (=> start!85024 true))

(declare-fun array_inv!23343 (array!62708) Bool)

(assert (=> start!85024 (and (array_inv!23343 _values!1551) e!559943)))

(declare-fun array_inv!23344 (array!62710) Bool)

(assert (=> start!85024 (array_inv!23344 _keys!1945)))

(declare-fun b!992644 () Bool)

(declare-fun res!663232 () Bool)

(assert (=> b!992644 (=> (not res!663232) (not e!559940))))

(declare-fun noDuplicate!1390 (List!20850) Bool)

(assert (=> b!992644 (= res!663232 (noDuplicate!1390 Nil!20847))))

(declare-fun b!992645 () Bool)

(assert (=> b!992645 (= e!559942 tp_is_empty!23347)))

(declare-fun b!992646 () Bool)

(declare-fun res!663233 () Bool)

(assert (=> b!992646 (=> (not res!663233) (not e!559940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62710 (_ BitVec 32)) Bool)

(assert (=> b!992646 (= res!663233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!992647 () Bool)

(declare-fun res!663237 () Bool)

(assert (=> b!992647 (=> (not res!663237) (not e!559940))))

(assert (=> b!992647 (= res!663237 (and (bvsle #b00000000000000000000000000000000 (size!30676 _keys!1945)) (bvslt (size!30676 _keys!1945) #b01111111111111111111111111111111)))))

(assert (= (and start!85024 res!663234) b!992641))

(assert (= (and b!992641 res!663235) b!992646))

(assert (= (and b!992646 res!663233) b!992647))

(assert (= (and b!992647 res!663237) b!992644))

(assert (= (and b!992644 res!663232) b!992639))

(assert (= (and b!992639 (not res!663236)) b!992643))

(assert (= (and b!992640 condMapEmpty!37089) mapIsEmpty!37089))

(assert (= (and b!992640 (not condMapEmpty!37089)) mapNonEmpty!37089))

(get-info :version)

(assert (= (and mapNonEmpty!37089 ((_ is ValueCellFull!11192) mapValue!37089)) b!992642))

(assert (= (and b!992640 ((_ is ValueCellFull!11192) mapDefault!37089)) b!992645))

(assert (= start!85024 b!992640))

(declare-fun m!920859 () Bool)

(assert (=> b!992639 m!920859))

(declare-fun m!920861 () Bool)

(assert (=> b!992643 m!920861))

(declare-fun m!920863 () Bool)

(assert (=> mapNonEmpty!37089 m!920863))

(declare-fun m!920865 () Bool)

(assert (=> b!992644 m!920865))

(declare-fun m!920867 () Bool)

(assert (=> start!85024 m!920867))

(declare-fun m!920869 () Bool)

(assert (=> start!85024 m!920869))

(declare-fun m!920871 () Bool)

(assert (=> start!85024 m!920871))

(declare-fun m!920873 () Bool)

(assert (=> b!992646 m!920873))

(check-sat (not start!85024) (not mapNonEmpty!37089) (not b!992644) (not b!992639) tp_is_empty!23347 (not b!992646) (not b!992643))
(check-sat)
(get-model)

(declare-fun d!118301 () Bool)

(declare-fun lt!440374 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!426 (List!20850) (InoxSet (_ BitVec 64)))

(assert (=> d!118301 (= lt!440374 (select (content!426 Nil!20847) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!559987 () Bool)

(assert (=> d!118301 (= lt!440374 e!559987)))

(declare-fun res!663278 () Bool)

(assert (=> d!118301 (=> (not res!663278) (not e!559987))))

(assert (=> d!118301 (= res!663278 ((_ is Cons!20846) Nil!20847))))

(assert (=> d!118301 (= (contains!5752 Nil!20847 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440374)))

(declare-fun b!992706 () Bool)

(declare-fun e!559986 () Bool)

(assert (=> b!992706 (= e!559987 e!559986)))

(declare-fun res!663279 () Bool)

(assert (=> b!992706 (=> res!663279 e!559986)))

(assert (=> b!992706 (= res!663279 (= (h!22014 Nil!20847) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!992707 () Bool)

(assert (=> b!992707 (= e!559986 (contains!5752 (t!29825 Nil!20847) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118301 res!663278) b!992706))

(assert (= (and b!992706 (not res!663279)) b!992707))

(declare-fun m!920907 () Bool)

(assert (=> d!118301 m!920907))

(declare-fun m!920909 () Bool)

(assert (=> d!118301 m!920909))

(declare-fun m!920911 () Bool)

(assert (=> b!992707 m!920911))

(assert (=> b!992643 d!118301))

(declare-fun d!118303 () Bool)

(declare-fun lt!440375 () Bool)

(assert (=> d!118303 (= lt!440375 (select (content!426 Nil!20847) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!559989 () Bool)

(assert (=> d!118303 (= lt!440375 e!559989)))

(declare-fun res!663280 () Bool)

(assert (=> d!118303 (=> (not res!663280) (not e!559989))))

(assert (=> d!118303 (= res!663280 ((_ is Cons!20846) Nil!20847))))

(assert (=> d!118303 (= (contains!5752 Nil!20847 #b0000000000000000000000000000000000000000000000000000000000000000) lt!440375)))

(declare-fun b!992708 () Bool)

(declare-fun e!559988 () Bool)

(assert (=> b!992708 (= e!559989 e!559988)))

(declare-fun res!663281 () Bool)

(assert (=> b!992708 (=> res!663281 e!559988)))

(assert (=> b!992708 (= res!663281 (= (h!22014 Nil!20847) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!992709 () Bool)

(assert (=> b!992709 (= e!559988 (contains!5752 (t!29825 Nil!20847) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118303 res!663280) b!992708))

(assert (= (and b!992708 (not res!663281)) b!992709))

(assert (=> d!118303 m!920907))

(declare-fun m!920913 () Bool)

(assert (=> d!118303 m!920913))

(declare-fun m!920915 () Bool)

(assert (=> b!992709 m!920915))

(assert (=> b!992639 d!118303))

(declare-fun d!118305 () Bool)

(declare-fun res!663286 () Bool)

(declare-fun e!559994 () Bool)

(assert (=> d!118305 (=> res!663286 e!559994)))

(assert (=> d!118305 (= res!663286 ((_ is Nil!20847) Nil!20847))))

(assert (=> d!118305 (= (noDuplicate!1390 Nil!20847) e!559994)))

(declare-fun b!992714 () Bool)

(declare-fun e!559995 () Bool)

(assert (=> b!992714 (= e!559994 e!559995)))

(declare-fun res!663287 () Bool)

(assert (=> b!992714 (=> (not res!663287) (not e!559995))))

(assert (=> b!992714 (= res!663287 (not (contains!5752 (t!29825 Nil!20847) (h!22014 Nil!20847))))))

(declare-fun b!992715 () Bool)

(assert (=> b!992715 (= e!559995 (noDuplicate!1390 (t!29825 Nil!20847)))))

(assert (= (and d!118305 (not res!663286)) b!992714))

(assert (= (and b!992714 res!663287) b!992715))

(declare-fun m!920917 () Bool)

(assert (=> b!992714 m!920917))

(declare-fun m!920919 () Bool)

(assert (=> b!992715 m!920919))

(assert (=> b!992644 d!118305))

(declare-fun d!118307 () Bool)

(assert (=> d!118307 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!85024 d!118307))

(declare-fun d!118309 () Bool)

(assert (=> d!118309 (= (array_inv!23343 _values!1551) (bvsge (size!30675 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!85024 d!118309))

(declare-fun d!118311 () Bool)

(assert (=> d!118311 (= (array_inv!23344 _keys!1945) (bvsge (size!30676 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!85024 d!118311))

(declare-fun b!992724 () Bool)

(declare-fun e!560003 () Bool)

(declare-fun call!42130 () Bool)

(assert (=> b!992724 (= e!560003 call!42130)))

(declare-fun b!992725 () Bool)

(declare-fun e!560002 () Bool)

(assert (=> b!992725 (= e!560002 call!42130)))

(declare-fun b!992727 () Bool)

(declare-fun e!560004 () Bool)

(assert (=> b!992727 (= e!560004 e!560002)))

(declare-fun c!100918 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!992727 (= c!100918 (validKeyInArray!0 (select (arr!30196 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun bm!42127 () Bool)

(assert (=> bm!42127 (= call!42130 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(declare-fun d!118313 () Bool)

(declare-fun res!663292 () Bool)

(assert (=> d!118313 (=> res!663292 e!560004)))

(assert (=> d!118313 (= res!663292 (bvsge #b00000000000000000000000000000000 (size!30676 _keys!1945)))))

(assert (=> d!118313 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!560004)))

(declare-fun b!992726 () Bool)

(assert (=> b!992726 (= e!560002 e!560003)))

(declare-fun lt!440384 () (_ BitVec 64))

(assert (=> b!992726 (= lt!440384 (select (arr!30196 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32889 0))(
  ( (Unit!32890) )
))
(declare-fun lt!440383 () Unit!32889)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62710 (_ BitVec 64) (_ BitVec 32)) Unit!32889)

(assert (=> b!992726 (= lt!440383 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!440384 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!992726 (arrayContainsKey!0 _keys!1945 lt!440384 #b00000000000000000000000000000000)))

(declare-fun lt!440382 () Unit!32889)

(assert (=> b!992726 (= lt!440382 lt!440383)))

(declare-fun res!663293 () Bool)

(declare-datatypes ((SeekEntryResult!9172 0))(
  ( (MissingZero!9172 (index!39059 (_ BitVec 32))) (Found!9172 (index!39060 (_ BitVec 32))) (Intermediate!9172 (undefined!9984 Bool) (index!39061 (_ BitVec 32)) (x!86267 (_ BitVec 32))) (Undefined!9172) (MissingVacant!9172 (index!39062 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62710 (_ BitVec 32)) SeekEntryResult!9172)

(assert (=> b!992726 (= res!663293 (= (seekEntryOrOpen!0 (select (arr!30196 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9172 #b00000000000000000000000000000000)))))

(assert (=> b!992726 (=> (not res!663293) (not e!560003))))

(assert (= (and d!118313 (not res!663292)) b!992727))

(assert (= (and b!992727 c!100918) b!992726))

(assert (= (and b!992727 (not c!100918)) b!992725))

(assert (= (and b!992726 res!663293) b!992724))

(assert (= (or b!992724 b!992725) bm!42127))

(declare-fun m!920921 () Bool)

(assert (=> b!992727 m!920921))

(assert (=> b!992727 m!920921))

(declare-fun m!920923 () Bool)

(assert (=> b!992727 m!920923))

(declare-fun m!920925 () Bool)

(assert (=> bm!42127 m!920925))

(assert (=> b!992726 m!920921))

(declare-fun m!920927 () Bool)

(assert (=> b!992726 m!920927))

(declare-fun m!920929 () Bool)

(assert (=> b!992726 m!920929))

(assert (=> b!992726 m!920921))

(declare-fun m!920931 () Bool)

(assert (=> b!992726 m!920931))

(assert (=> b!992646 d!118313))

(declare-fun condMapEmpty!37098 () Bool)

(declare-fun mapDefault!37098 () ValueCell!11192)

(assert (=> mapNonEmpty!37089 (= condMapEmpty!37098 (= mapRest!37089 ((as const (Array (_ BitVec 32) ValueCell!11192)) mapDefault!37098)))))

(declare-fun e!560009 () Bool)

(declare-fun mapRes!37098 () Bool)

(assert (=> mapNonEmpty!37089 (= tp!70161 (and e!560009 mapRes!37098))))

(declare-fun b!992735 () Bool)

(assert (=> b!992735 (= e!560009 tp_is_empty!23347)))

(declare-fun mapNonEmpty!37098 () Bool)

(declare-fun tp!70170 () Bool)

(declare-fun e!560010 () Bool)

(assert (=> mapNonEmpty!37098 (= mapRes!37098 (and tp!70170 e!560010))))

(declare-fun mapValue!37098 () ValueCell!11192)

(declare-fun mapRest!37098 () (Array (_ BitVec 32) ValueCell!11192))

(declare-fun mapKey!37098 () (_ BitVec 32))

(assert (=> mapNonEmpty!37098 (= mapRest!37089 (store mapRest!37098 mapKey!37098 mapValue!37098))))

(declare-fun b!992734 () Bool)

(assert (=> b!992734 (= e!560010 tp_is_empty!23347)))

(declare-fun mapIsEmpty!37098 () Bool)

(assert (=> mapIsEmpty!37098 mapRes!37098))

(assert (= (and mapNonEmpty!37089 condMapEmpty!37098) mapIsEmpty!37098))

(assert (= (and mapNonEmpty!37089 (not condMapEmpty!37098)) mapNonEmpty!37098))

(assert (= (and mapNonEmpty!37098 ((_ is ValueCellFull!11192) mapValue!37098)) b!992734))

(assert (= (and mapNonEmpty!37089 ((_ is ValueCellFull!11192) mapDefault!37098)) b!992735))

(declare-fun m!920933 () Bool)

(assert (=> mapNonEmpty!37098 m!920933))

(check-sat (not d!118303) (not d!118301) (not b!992727) (not b!992715) tp_is_empty!23347 (not bm!42127) (not b!992709) (not mapNonEmpty!37098) (not b!992714) (not b!992707) (not b!992726))
(check-sat)
