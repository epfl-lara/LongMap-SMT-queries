; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82098 () Bool)

(assert start!82098)

(declare-fun res!640770 () Bool)

(declare-fun e!539461 () Bool)

(assert (=> start!82098 (=> (not res!640770) (not e!539461))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82098 (= res!640770 (validMask!0 mask!2088))))

(assert (=> start!82098 e!539461))

(assert (=> start!82098 true))

(declare-datatypes ((V!33115 0))(
  ( (V!33116 (val!10600 Int)) )
))
(declare-datatypes ((ValueCell!10068 0))(
  ( (ValueCellFull!10068 (v!13156 V!33115)) (EmptyCell!10068) )
))
(declare-datatypes ((array!58301 0))(
  ( (array!58302 (arr!28026 (Array (_ BitVec 32) ValueCell!10068)) (size!28505 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58301)

(declare-fun e!539460 () Bool)

(declare-fun array_inv!21745 (array!58301) Bool)

(assert (=> start!82098 (and (array_inv!21745 _values!1386) e!539460)))

(declare-datatypes ((array!58303 0))(
  ( (array!58304 (arr!28027 (Array (_ BitVec 32) (_ BitVec 64))) (size!28506 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58303)

(declare-fun array_inv!21746 (array!58303) Bool)

(assert (=> start!82098 (array_inv!21746 _keys!1668)))

(declare-fun b!957148 () Bool)

(declare-fun res!640768 () Bool)

(assert (=> b!957148 (=> (not res!640768) (not e!539461))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957148 (= res!640768 (and (= (size!28505 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28506 _keys!1668) (size!28505 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33622 () Bool)

(declare-fun mapRes!33622 () Bool)

(assert (=> mapIsEmpty!33622 mapRes!33622))

(declare-fun b!957149 () Bool)

(declare-fun e!539457 () Bool)

(declare-fun tp_is_empty!21099 () Bool)

(assert (=> b!957149 (= e!539457 tp_is_empty!21099)))

(declare-fun b!957150 () Bool)

(declare-fun res!640767 () Bool)

(assert (=> b!957150 (=> (not res!640767) (not e!539461))))

(assert (=> b!957150 (= res!640767 (and (bvsle #b00000000000000000000000000000000 (size!28506 _keys!1668)) (bvslt (size!28506 _keys!1668) #b01111111111111111111111111111111)))))

(declare-fun b!957151 () Bool)

(assert (=> b!957151 (= e!539460 (and e!539457 mapRes!33622))))

(declare-fun condMapEmpty!33622 () Bool)

(declare-fun mapDefault!33622 () ValueCell!10068)

(assert (=> b!957151 (= condMapEmpty!33622 (= (arr!28026 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10068)) mapDefault!33622)))))

(declare-fun b!957152 () Bool)

(declare-datatypes ((List!19502 0))(
  ( (Nil!19499) (Cons!19498 (h!20660 (_ BitVec 64)) (t!27865 List!19502)) )
))
(declare-fun noDuplicate!1362 (List!19502) Bool)

(assert (=> b!957152 (= e!539461 (not (noDuplicate!1362 Nil!19499)))))

(declare-fun b!957153 () Bool)

(declare-fun res!640769 () Bool)

(assert (=> b!957153 (=> (not res!640769) (not e!539461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58303 (_ BitVec 32)) Bool)

(assert (=> b!957153 (= res!640769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!33622 () Bool)

(declare-fun tp!64227 () Bool)

(declare-fun e!539458 () Bool)

(assert (=> mapNonEmpty!33622 (= mapRes!33622 (and tp!64227 e!539458))))

(declare-fun mapRest!33622 () (Array (_ BitVec 32) ValueCell!10068))

(declare-fun mapValue!33622 () ValueCell!10068)

(declare-fun mapKey!33622 () (_ BitVec 32))

(assert (=> mapNonEmpty!33622 (= (arr!28026 _values!1386) (store mapRest!33622 mapKey!33622 mapValue!33622))))

(declare-fun b!957154 () Bool)

(assert (=> b!957154 (= e!539458 tp_is_empty!21099)))

(assert (= (and start!82098 res!640770) b!957148))

(assert (= (and b!957148 res!640768) b!957153))

(assert (= (and b!957153 res!640769) b!957150))

(assert (= (and b!957150 res!640767) b!957152))

(assert (= (and b!957151 condMapEmpty!33622) mapIsEmpty!33622))

(assert (= (and b!957151 (not condMapEmpty!33622)) mapNonEmpty!33622))

(get-info :version)

(assert (= (and mapNonEmpty!33622 ((_ is ValueCellFull!10068) mapValue!33622)) b!957154))

(assert (= (and b!957151 ((_ is ValueCellFull!10068) mapDefault!33622)) b!957149))

(assert (= start!82098 b!957151))

(declare-fun m!888223 () Bool)

(assert (=> start!82098 m!888223))

(declare-fun m!888225 () Bool)

(assert (=> start!82098 m!888225))

(declare-fun m!888227 () Bool)

(assert (=> start!82098 m!888227))

(declare-fun m!888229 () Bool)

(assert (=> b!957152 m!888229))

(declare-fun m!888231 () Bool)

(assert (=> b!957153 m!888231))

(declare-fun m!888233 () Bool)

(assert (=> mapNonEmpty!33622 m!888233))

(check-sat (not b!957153) tp_is_empty!21099 (not start!82098) (not b!957152) (not mapNonEmpty!33622))
(check-sat)
(get-model)

(declare-fun b!957184 () Bool)

(declare-fun e!539484 () Bool)

(declare-fun call!41714 () Bool)

(assert (=> b!957184 (= e!539484 call!41714)))

(declare-fun bm!41711 () Bool)

(assert (=> bm!41711 (= call!41714 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1668 mask!2088))))

(declare-fun d!115891 () Bool)

(declare-fun res!640788 () Bool)

(declare-fun e!539483 () Bool)

(assert (=> d!115891 (=> res!640788 e!539483)))

(assert (=> d!115891 (= res!640788 (bvsge #b00000000000000000000000000000000 (size!28506 _keys!1668)))))

(assert (=> d!115891 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088) e!539483)))

(declare-fun b!957185 () Bool)

(declare-fun e!539485 () Bool)

(assert (=> b!957185 (= e!539485 e!539484)))

(declare-fun lt!430289 () (_ BitVec 64))

(assert (=> b!957185 (= lt!430289 (select (arr!28027 _keys!1668) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32155 0))(
  ( (Unit!32156) )
))
(declare-fun lt!430287 () Unit!32155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58303 (_ BitVec 64) (_ BitVec 32)) Unit!32155)

(assert (=> b!957185 (= lt!430287 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1668 lt!430289 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!957185 (arrayContainsKey!0 _keys!1668 lt!430289 #b00000000000000000000000000000000)))

(declare-fun lt!430288 () Unit!32155)

(assert (=> b!957185 (= lt!430288 lt!430287)))

(declare-fun res!640787 () Bool)

(declare-datatypes ((SeekEntryResult!9191 0))(
  ( (MissingZero!9191 (index!39135 (_ BitVec 32))) (Found!9191 (index!39136 (_ BitVec 32))) (Intermediate!9191 (undefined!10003 Bool) (index!39137 (_ BitVec 32)) (x!82499 (_ BitVec 32))) (Undefined!9191) (MissingVacant!9191 (index!39138 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58303 (_ BitVec 32)) SeekEntryResult!9191)

(assert (=> b!957185 (= res!640787 (= (seekEntryOrOpen!0 (select (arr!28027 _keys!1668) #b00000000000000000000000000000000) _keys!1668 mask!2088) (Found!9191 #b00000000000000000000000000000000)))))

(assert (=> b!957185 (=> (not res!640787) (not e!539484))))

(declare-fun b!957186 () Bool)

(assert (=> b!957186 (= e!539485 call!41714)))

(declare-fun b!957187 () Bool)

(assert (=> b!957187 (= e!539483 e!539485)))

(declare-fun c!99902 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957187 (= c!99902 (validKeyInArray!0 (select (arr!28027 _keys!1668) #b00000000000000000000000000000000)))))

(assert (= (and d!115891 (not res!640788)) b!957187))

(assert (= (and b!957187 c!99902) b!957185))

(assert (= (and b!957187 (not c!99902)) b!957186))

(assert (= (and b!957185 res!640787) b!957184))

(assert (= (or b!957184 b!957186) bm!41711))

(declare-fun m!888247 () Bool)

(assert (=> bm!41711 m!888247))

(declare-fun m!888249 () Bool)

(assert (=> b!957185 m!888249))

(declare-fun m!888251 () Bool)

(assert (=> b!957185 m!888251))

(declare-fun m!888253 () Bool)

(assert (=> b!957185 m!888253))

(assert (=> b!957185 m!888249))

(declare-fun m!888255 () Bool)

(assert (=> b!957185 m!888255))

(assert (=> b!957187 m!888249))

(assert (=> b!957187 m!888249))

(declare-fun m!888257 () Bool)

(assert (=> b!957187 m!888257))

(assert (=> b!957153 d!115891))

(declare-fun d!115893 () Bool)

(assert (=> d!115893 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82098 d!115893))

(declare-fun d!115895 () Bool)

(assert (=> d!115895 (= (array_inv!21745 _values!1386) (bvsge (size!28505 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82098 d!115895))

(declare-fun d!115897 () Bool)

(assert (=> d!115897 (= (array_inv!21746 _keys!1668) (bvsge (size!28506 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82098 d!115897))

(declare-fun d!115899 () Bool)

(declare-fun res!640793 () Bool)

(declare-fun e!539490 () Bool)

(assert (=> d!115899 (=> res!640793 e!539490)))

(assert (=> d!115899 (= res!640793 ((_ is Nil!19499) Nil!19499))))

(assert (=> d!115899 (= (noDuplicate!1362 Nil!19499) e!539490)))

(declare-fun b!957192 () Bool)

(declare-fun e!539491 () Bool)

(assert (=> b!957192 (= e!539490 e!539491)))

(declare-fun res!640794 () Bool)

(assert (=> b!957192 (=> (not res!640794) (not e!539491))))

(declare-fun contains!5315 (List!19502 (_ BitVec 64)) Bool)

(assert (=> b!957192 (= res!640794 (not (contains!5315 (t!27865 Nil!19499) (h!20660 Nil!19499))))))

(declare-fun b!957193 () Bool)

(assert (=> b!957193 (= e!539491 (noDuplicate!1362 (t!27865 Nil!19499)))))

(assert (= (and d!115899 (not res!640793)) b!957192))

(assert (= (and b!957192 res!640794) b!957193))

(declare-fun m!888259 () Bool)

(assert (=> b!957192 m!888259))

(declare-fun m!888261 () Bool)

(assert (=> b!957193 m!888261))

(assert (=> b!957152 d!115899))

(declare-fun condMapEmpty!33628 () Bool)

(declare-fun mapDefault!33628 () ValueCell!10068)

(assert (=> mapNonEmpty!33622 (= condMapEmpty!33628 (= mapRest!33622 ((as const (Array (_ BitVec 32) ValueCell!10068)) mapDefault!33628)))))

(declare-fun e!539497 () Bool)

(declare-fun mapRes!33628 () Bool)

(assert (=> mapNonEmpty!33622 (= tp!64227 (and e!539497 mapRes!33628))))

(declare-fun b!957200 () Bool)

(declare-fun e!539496 () Bool)

(assert (=> b!957200 (= e!539496 tp_is_empty!21099)))

(declare-fun mapNonEmpty!33628 () Bool)

(declare-fun tp!64233 () Bool)

(assert (=> mapNonEmpty!33628 (= mapRes!33628 (and tp!64233 e!539496))))

(declare-fun mapRest!33628 () (Array (_ BitVec 32) ValueCell!10068))

(declare-fun mapKey!33628 () (_ BitVec 32))

(declare-fun mapValue!33628 () ValueCell!10068)

(assert (=> mapNonEmpty!33628 (= mapRest!33622 (store mapRest!33628 mapKey!33628 mapValue!33628))))

(declare-fun b!957201 () Bool)

(assert (=> b!957201 (= e!539497 tp_is_empty!21099)))

(declare-fun mapIsEmpty!33628 () Bool)

(assert (=> mapIsEmpty!33628 mapRes!33628))

(assert (= (and mapNonEmpty!33622 condMapEmpty!33628) mapIsEmpty!33628))

(assert (= (and mapNonEmpty!33622 (not condMapEmpty!33628)) mapNonEmpty!33628))

(assert (= (and mapNonEmpty!33628 ((_ is ValueCellFull!10068) mapValue!33628)) b!957200))

(assert (= (and mapNonEmpty!33622 ((_ is ValueCellFull!10068) mapDefault!33628)) b!957201))

(declare-fun m!888263 () Bool)

(assert (=> mapNonEmpty!33628 m!888263))

(check-sat (not b!957193) (not bm!41711) (not b!957185) tp_is_empty!21099 (not mapNonEmpty!33628) (not b!957187) (not b!957192))
(check-sat)
