; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82064 () Bool)

(assert start!82064)

(declare-fun b!956812 () Bool)

(declare-fun e!539237 () Bool)

(declare-datatypes ((array!58222 0))(
  ( (array!58223 (arr!27988 (Array (_ BitVec 32) (_ BitVec 64))) (size!28469 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58222)

(assert (=> b!956812 (= e!539237 (and (bvsle #b00000000000000000000000000000000 (size!28469 _keys!1668)) (bvsge (size!28469 _keys!1668) #b01111111111111111111111111111111)))))

(declare-fun b!956813 () Bool)

(declare-fun e!539234 () Bool)

(declare-fun tp_is_empty!21091 () Bool)

(assert (=> b!956813 (= e!539234 tp_is_empty!21091)))

(declare-fun b!956814 () Bool)

(declare-fun res!640611 () Bool)

(assert (=> b!956814 (=> (not res!640611) (not e!539237))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58222 (_ BitVec 32)) Bool)

(assert (=> b!956814 (= res!640611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!33607 () Bool)

(declare-fun mapRes!33607 () Bool)

(declare-fun tp!64213 () Bool)

(assert (=> mapNonEmpty!33607 (= mapRes!33607 (and tp!64213 e!539234))))

(declare-datatypes ((V!33105 0))(
  ( (V!33106 (val!10596 Int)) )
))
(declare-datatypes ((ValueCell!10064 0))(
  ( (ValueCellFull!10064 (v!13151 V!33105)) (EmptyCell!10064) )
))
(declare-fun mapRest!33607 () (Array (_ BitVec 32) ValueCell!10064))

(declare-fun mapValue!33607 () ValueCell!10064)

(declare-fun mapKey!33607 () (_ BitVec 32))

(declare-datatypes ((array!58224 0))(
  ( (array!58225 (arr!27989 (Array (_ BitVec 32) ValueCell!10064)) (size!28470 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58224)

(assert (=> mapNonEmpty!33607 (= (arr!27989 _values!1386) (store mapRest!33607 mapKey!33607 mapValue!33607))))

(declare-fun b!956816 () Bool)

(declare-fun res!640612 () Bool)

(assert (=> b!956816 (=> (not res!640612) (not e!539237))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!956816 (= res!640612 (and (= (size!28470 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28469 _keys!1668) (size!28470 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!956817 () Bool)

(declare-fun e!539238 () Bool)

(declare-fun e!539235 () Bool)

(assert (=> b!956817 (= e!539238 (and e!539235 mapRes!33607))))

(declare-fun condMapEmpty!33607 () Bool)

(declare-fun mapDefault!33607 () ValueCell!10064)

(assert (=> b!956817 (= condMapEmpty!33607 (= (arr!27989 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10064)) mapDefault!33607)))))

(declare-fun mapIsEmpty!33607 () Bool)

(assert (=> mapIsEmpty!33607 mapRes!33607))

(declare-fun b!956815 () Bool)

(assert (=> b!956815 (= e!539235 tp_is_empty!21091)))

(declare-fun res!640610 () Bool)

(assert (=> start!82064 (=> (not res!640610) (not e!539237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82064 (= res!640610 (validMask!0 mask!2088))))

(assert (=> start!82064 e!539237))

(assert (=> start!82064 true))

(declare-fun array_inv!21773 (array!58224) Bool)

(assert (=> start!82064 (and (array_inv!21773 _values!1386) e!539238)))

(declare-fun array_inv!21774 (array!58222) Bool)

(assert (=> start!82064 (array_inv!21774 _keys!1668)))

(assert (= (and start!82064 res!640610) b!956816))

(assert (= (and b!956816 res!640612) b!956814))

(assert (= (and b!956814 res!640611) b!956812))

(assert (= (and b!956817 condMapEmpty!33607) mapIsEmpty!33607))

(assert (= (and b!956817 (not condMapEmpty!33607)) mapNonEmpty!33607))

(get-info :version)

(assert (= (and mapNonEmpty!33607 ((_ is ValueCellFull!10064) mapValue!33607)) b!956813))

(assert (= (and b!956817 ((_ is ValueCellFull!10064) mapDefault!33607)) b!956815))

(assert (= start!82064 b!956817))

(declare-fun m!887409 () Bool)

(assert (=> b!956814 m!887409))

(declare-fun m!887411 () Bool)

(assert (=> mapNonEmpty!33607 m!887411))

(declare-fun m!887413 () Bool)

(assert (=> start!82064 m!887413))

(declare-fun m!887415 () Bool)

(assert (=> start!82064 m!887415))

(declare-fun m!887417 () Bool)

(assert (=> start!82064 m!887417))

(check-sat (not start!82064) (not b!956814) (not mapNonEmpty!33607) tp_is_empty!21091)
(check-sat)
(get-model)

(declare-fun d!115683 () Bool)

(assert (=> d!115683 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82064 d!115683))

(declare-fun d!115685 () Bool)

(assert (=> d!115685 (= (array_inv!21773 _values!1386) (bvsge (size!28470 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82064 d!115685))

(declare-fun d!115687 () Bool)

(assert (=> d!115687 (= (array_inv!21774 _keys!1668) (bvsge (size!28469 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82064 d!115687))

(declare-fun b!956862 () Bool)

(declare-fun e!539276 () Bool)

(declare-fun call!41685 () Bool)

(assert (=> b!956862 (= e!539276 call!41685)))

(declare-fun b!956863 () Bool)

(declare-fun e!539275 () Bool)

(declare-fun e!539277 () Bool)

(assert (=> b!956863 (= e!539275 e!539277)))

(declare-fun c!99834 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956863 (= c!99834 (validKeyInArray!0 (select (arr!27988 _keys!1668) #b00000000000000000000000000000000)))))

(declare-fun d!115689 () Bool)

(declare-fun res!640636 () Bool)

(assert (=> d!115689 (=> res!640636 e!539275)))

(assert (=> d!115689 (= res!640636 (bvsge #b00000000000000000000000000000000 (size!28469 _keys!1668)))))

(assert (=> d!115689 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088) e!539275)))

(declare-fun b!956864 () Bool)

(assert (=> b!956864 (= e!539277 e!539276)))

(declare-fun lt!430043 () (_ BitVec 64))

(assert (=> b!956864 (= lt!430043 (select (arr!27988 _keys!1668) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32014 0))(
  ( (Unit!32015) )
))
(declare-fun lt!430042 () Unit!32014)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58222 (_ BitVec 64) (_ BitVec 32)) Unit!32014)

(assert (=> b!956864 (= lt!430042 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1668 lt!430043 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!956864 (arrayContainsKey!0 _keys!1668 lt!430043 #b00000000000000000000000000000000)))

(declare-fun lt!430044 () Unit!32014)

(assert (=> b!956864 (= lt!430044 lt!430042)))

(declare-fun res!640635 () Bool)

(declare-datatypes ((SeekEntryResult!9185 0))(
  ( (MissingZero!9185 (index!39111 (_ BitVec 32))) (Found!9185 (index!39112 (_ BitVec 32))) (Intermediate!9185 (undefined!9997 Bool) (index!39113 (_ BitVec 32)) (x!82478 (_ BitVec 32))) (Undefined!9185) (MissingVacant!9185 (index!39114 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58222 (_ BitVec 32)) SeekEntryResult!9185)

(assert (=> b!956864 (= res!640635 (= (seekEntryOrOpen!0 (select (arr!27988 _keys!1668) #b00000000000000000000000000000000) _keys!1668 mask!2088) (Found!9185 #b00000000000000000000000000000000)))))

(assert (=> b!956864 (=> (not res!640635) (not e!539276))))

(declare-fun bm!41682 () Bool)

(assert (=> bm!41682 (= call!41685 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1668 mask!2088))))

(declare-fun b!956865 () Bool)

(assert (=> b!956865 (= e!539277 call!41685)))

(assert (= (and d!115689 (not res!640636)) b!956863))

(assert (= (and b!956863 c!99834) b!956864))

(assert (= (and b!956863 (not c!99834)) b!956865))

(assert (= (and b!956864 res!640635) b!956862))

(assert (= (or b!956862 b!956865) bm!41682))

(declare-fun m!887439 () Bool)

(assert (=> b!956863 m!887439))

(assert (=> b!956863 m!887439))

(declare-fun m!887441 () Bool)

(assert (=> b!956863 m!887441))

(assert (=> b!956864 m!887439))

(declare-fun m!887443 () Bool)

(assert (=> b!956864 m!887443))

(declare-fun m!887445 () Bool)

(assert (=> b!956864 m!887445))

(assert (=> b!956864 m!887439))

(declare-fun m!887447 () Bool)

(assert (=> b!956864 m!887447))

(declare-fun m!887449 () Bool)

(assert (=> bm!41682 m!887449))

(assert (=> b!956814 d!115689))

(declare-fun b!956873 () Bool)

(declare-fun e!539282 () Bool)

(assert (=> b!956873 (= e!539282 tp_is_empty!21091)))

(declare-fun mapNonEmpty!33616 () Bool)

(declare-fun mapRes!33616 () Bool)

(declare-fun tp!64222 () Bool)

(declare-fun e!539283 () Bool)

(assert (=> mapNonEmpty!33616 (= mapRes!33616 (and tp!64222 e!539283))))

(declare-fun mapKey!33616 () (_ BitVec 32))

(declare-fun mapRest!33616 () (Array (_ BitVec 32) ValueCell!10064))

(declare-fun mapValue!33616 () ValueCell!10064)

(assert (=> mapNonEmpty!33616 (= mapRest!33607 (store mapRest!33616 mapKey!33616 mapValue!33616))))

(declare-fun mapIsEmpty!33616 () Bool)

(assert (=> mapIsEmpty!33616 mapRes!33616))

(declare-fun condMapEmpty!33616 () Bool)

(declare-fun mapDefault!33616 () ValueCell!10064)

(assert (=> mapNonEmpty!33607 (= condMapEmpty!33616 (= mapRest!33607 ((as const (Array (_ BitVec 32) ValueCell!10064)) mapDefault!33616)))))

(assert (=> mapNonEmpty!33607 (= tp!64213 (and e!539282 mapRes!33616))))

(declare-fun b!956872 () Bool)

(assert (=> b!956872 (= e!539283 tp_is_empty!21091)))

(assert (= (and mapNonEmpty!33607 condMapEmpty!33616) mapIsEmpty!33616))

(assert (= (and mapNonEmpty!33607 (not condMapEmpty!33616)) mapNonEmpty!33616))

(assert (= (and mapNonEmpty!33616 ((_ is ValueCellFull!10064) mapValue!33616)) b!956872))

(assert (= (and mapNonEmpty!33607 ((_ is ValueCellFull!10064) mapDefault!33616)) b!956873))

(declare-fun m!887451 () Bool)

(assert (=> mapNonEmpty!33616 m!887451))

(check-sat (not b!956864) (not b!956863) (not bm!41682) tp_is_empty!21091 (not mapNonEmpty!33616))
(check-sat)
