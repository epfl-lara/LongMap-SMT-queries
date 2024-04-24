; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35922 () Bool)

(assert start!35922)

(declare-fun b!361118 () Bool)

(declare-fun res!200915 () Bool)

(declare-fun e!221099 () Bool)

(assert (=> b!361118 (=> (not res!200915) (not e!221099))))

(declare-datatypes ((array!20250 0))(
  ( (array!20251 (arr!9615 (Array (_ BitVec 32) (_ BitVec 64))) (size!9967 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20250)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20250 (_ BitVec 32)) Bool)

(assert (=> b!361118 (= res!200915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361119 () Bool)

(declare-fun e!221100 () Bool)

(declare-fun e!221103 () Bool)

(declare-fun mapRes!14055 () Bool)

(assert (=> b!361119 (= e!221100 (and e!221103 mapRes!14055))))

(declare-fun condMapEmpty!14055 () Bool)

(declare-datatypes ((V!12123 0))(
  ( (V!12124 (val!4224 Int)) )
))
(declare-datatypes ((ValueCell!3836 0))(
  ( (ValueCellFull!3836 (v!6419 V!12123)) (EmptyCell!3836) )
))
(declare-datatypes ((array!20252 0))(
  ( (array!20253 (arr!9616 (Array (_ BitVec 32) ValueCell!3836)) (size!9968 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20252)

(declare-fun mapDefault!14055 () ValueCell!3836)

(assert (=> b!361119 (= condMapEmpty!14055 (= (arr!9616 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3836)) mapDefault!14055)))))

(declare-fun res!200914 () Bool)

(assert (=> start!35922 (=> (not res!200914) (not e!221099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35922 (= res!200914 (validMask!0 mask!1943))))

(assert (=> start!35922 e!221099))

(assert (=> start!35922 true))

(declare-fun array_inv!7104 (array!20252) Bool)

(assert (=> start!35922 (and (array_inv!7104 _values!1277) e!221100)))

(declare-fun array_inv!7105 (array!20250) Bool)

(assert (=> start!35922 (array_inv!7105 _keys!1541)))

(declare-fun b!361120 () Bool)

(declare-fun res!200916 () Bool)

(assert (=> b!361120 (=> (not res!200916) (not e!221099))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361120 (= res!200916 (and (= (size!9968 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9967 _keys!1541) (size!9968 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14055 () Bool)

(assert (=> mapIsEmpty!14055 mapRes!14055))

(declare-fun b!361121 () Bool)

(assert (=> b!361121 (= e!221099 (and (bvsle #b00000000000000000000000000000000 (size!9967 _keys!1541)) (bvsge (size!9967 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!14055 () Bool)

(declare-fun tp!28131 () Bool)

(declare-fun e!221102 () Bool)

(assert (=> mapNonEmpty!14055 (= mapRes!14055 (and tp!28131 e!221102))))

(declare-fun mapRest!14055 () (Array (_ BitVec 32) ValueCell!3836))

(declare-fun mapValue!14055 () ValueCell!3836)

(declare-fun mapKey!14055 () (_ BitVec 32))

(assert (=> mapNonEmpty!14055 (= (arr!9616 _values!1277) (store mapRest!14055 mapKey!14055 mapValue!14055))))

(declare-fun b!361122 () Bool)

(declare-fun tp_is_empty!8359 () Bool)

(assert (=> b!361122 (= e!221103 tp_is_empty!8359)))

(declare-fun b!361123 () Bool)

(assert (=> b!361123 (= e!221102 tp_is_empty!8359)))

(assert (= (and start!35922 res!200914) b!361120))

(assert (= (and b!361120 res!200916) b!361118))

(assert (= (and b!361118 res!200915) b!361121))

(assert (= (and b!361119 condMapEmpty!14055) mapIsEmpty!14055))

(assert (= (and b!361119 (not condMapEmpty!14055)) mapNonEmpty!14055))

(get-info :version)

(assert (= (and mapNonEmpty!14055 ((_ is ValueCellFull!3836) mapValue!14055)) b!361123))

(assert (= (and b!361119 ((_ is ValueCellFull!3836) mapDefault!14055)) b!361122))

(assert (= start!35922 b!361119))

(declare-fun m!358323 () Bool)

(assert (=> b!361118 m!358323))

(declare-fun m!358325 () Bool)

(assert (=> start!35922 m!358325))

(declare-fun m!358327 () Bool)

(assert (=> start!35922 m!358327))

(declare-fun m!358329 () Bool)

(assert (=> start!35922 m!358329))

(declare-fun m!358331 () Bool)

(assert (=> mapNonEmpty!14055 m!358331))

(check-sat (not b!361118) (not start!35922) (not mapNonEmpty!14055) tp_is_empty!8359)
(check-sat)
(get-model)

(declare-fun d!71927 () Bool)

(declare-fun res!200939 () Bool)

(declare-fun e!221140 () Bool)

(assert (=> d!71927 (=> res!200939 e!221140)))

(assert (=> d!71927 (= res!200939 (bvsge #b00000000000000000000000000000000 (size!9967 _keys!1541)))))

(assert (=> d!71927 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221140)))

(declare-fun b!361168 () Bool)

(declare-fun e!221142 () Bool)

(declare-fun call!27158 () Bool)

(assert (=> b!361168 (= e!221142 call!27158)))

(declare-fun bm!27155 () Bool)

(assert (=> bm!27155 (= call!27158 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361169 () Bool)

(declare-fun e!221141 () Bool)

(assert (=> b!361169 (= e!221141 call!27158)))

(declare-fun b!361170 () Bool)

(assert (=> b!361170 (= e!221140 e!221141)))

(declare-fun c!53696 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361170 (= c!53696 (validKeyInArray!0 (select (arr!9615 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361171 () Bool)

(assert (=> b!361171 (= e!221141 e!221142)))

(declare-fun lt!166553 () (_ BitVec 64))

(assert (=> b!361171 (= lt!166553 (select (arr!9615 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11099 0))(
  ( (Unit!11100) )
))
(declare-fun lt!166552 () Unit!11099)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20250 (_ BitVec 64) (_ BitVec 32)) Unit!11099)

(assert (=> b!361171 (= lt!166552 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166553 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361171 (arrayContainsKey!0 _keys!1541 lt!166553 #b00000000000000000000000000000000)))

(declare-fun lt!166551 () Unit!11099)

(assert (=> b!361171 (= lt!166551 lt!166552)))

(declare-fun res!200940 () Bool)

(declare-datatypes ((SeekEntryResult!3442 0))(
  ( (MissingZero!3442 (index!15947 (_ BitVec 32))) (Found!3442 (index!15948 (_ BitVec 32))) (Intermediate!3442 (undefined!4254 Bool) (index!15949 (_ BitVec 32)) (x!35935 (_ BitVec 32))) (Undefined!3442) (MissingVacant!3442 (index!15950 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20250 (_ BitVec 32)) SeekEntryResult!3442)

(assert (=> b!361171 (= res!200940 (= (seekEntryOrOpen!0 (select (arr!9615 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3442 #b00000000000000000000000000000000)))))

(assert (=> b!361171 (=> (not res!200940) (not e!221142))))

(assert (= (and d!71927 (not res!200939)) b!361170))

(assert (= (and b!361170 c!53696) b!361171))

(assert (= (and b!361170 (not c!53696)) b!361169))

(assert (= (and b!361171 res!200940) b!361168))

(assert (= (or b!361168 b!361169) bm!27155))

(declare-fun m!358353 () Bool)

(assert (=> bm!27155 m!358353))

(declare-fun m!358355 () Bool)

(assert (=> b!361170 m!358355))

(assert (=> b!361170 m!358355))

(declare-fun m!358357 () Bool)

(assert (=> b!361170 m!358357))

(assert (=> b!361171 m!358355))

(declare-fun m!358359 () Bool)

(assert (=> b!361171 m!358359))

(declare-fun m!358361 () Bool)

(assert (=> b!361171 m!358361))

(assert (=> b!361171 m!358355))

(declare-fun m!358363 () Bool)

(assert (=> b!361171 m!358363))

(assert (=> b!361118 d!71927))

(declare-fun d!71929 () Bool)

(assert (=> d!71929 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35922 d!71929))

(declare-fun d!71931 () Bool)

(assert (=> d!71931 (= (array_inv!7104 _values!1277) (bvsge (size!9968 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35922 d!71931))

(declare-fun d!71933 () Bool)

(assert (=> d!71933 (= (array_inv!7105 _keys!1541) (bvsge (size!9967 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35922 d!71933))

(declare-fun mapIsEmpty!14064 () Bool)

(declare-fun mapRes!14064 () Bool)

(assert (=> mapIsEmpty!14064 mapRes!14064))

(declare-fun mapNonEmpty!14064 () Bool)

(declare-fun tp!28140 () Bool)

(declare-fun e!221147 () Bool)

(assert (=> mapNonEmpty!14064 (= mapRes!14064 (and tp!28140 e!221147))))

(declare-fun mapRest!14064 () (Array (_ BitVec 32) ValueCell!3836))

(declare-fun mapValue!14064 () ValueCell!3836)

(declare-fun mapKey!14064 () (_ BitVec 32))

(assert (=> mapNonEmpty!14064 (= mapRest!14055 (store mapRest!14064 mapKey!14064 mapValue!14064))))

(declare-fun condMapEmpty!14064 () Bool)

(declare-fun mapDefault!14064 () ValueCell!3836)

(assert (=> mapNonEmpty!14055 (= condMapEmpty!14064 (= mapRest!14055 ((as const (Array (_ BitVec 32) ValueCell!3836)) mapDefault!14064)))))

(declare-fun e!221148 () Bool)

(assert (=> mapNonEmpty!14055 (= tp!28131 (and e!221148 mapRes!14064))))

(declare-fun b!361179 () Bool)

(assert (=> b!361179 (= e!221148 tp_is_empty!8359)))

(declare-fun b!361178 () Bool)

(assert (=> b!361178 (= e!221147 tp_is_empty!8359)))

(assert (= (and mapNonEmpty!14055 condMapEmpty!14064) mapIsEmpty!14064))

(assert (= (and mapNonEmpty!14055 (not condMapEmpty!14064)) mapNonEmpty!14064))

(assert (= (and mapNonEmpty!14064 ((_ is ValueCellFull!3836) mapValue!14064)) b!361178))

(assert (= (and mapNonEmpty!14055 ((_ is ValueCellFull!3836) mapDefault!14064)) b!361179))

(declare-fun m!358365 () Bool)

(assert (=> mapNonEmpty!14064 m!358365))

(check-sat (not mapNonEmpty!14064) (not b!361171) (not b!361170) tp_is_empty!8359 (not bm!27155))
(check-sat)
