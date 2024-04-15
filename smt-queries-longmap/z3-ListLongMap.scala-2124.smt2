; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35936 () Bool)

(assert start!35936)

(declare-fun b!360972 () Bool)

(declare-fun e!221017 () Bool)

(declare-fun tp_is_empty!8365 () Bool)

(assert (=> b!360972 (= e!221017 tp_is_empty!8365)))

(declare-fun mapIsEmpty!14067 () Bool)

(declare-fun mapRes!14067 () Bool)

(assert (=> mapIsEmpty!14067 mapRes!14067))

(declare-fun b!360973 () Bool)

(declare-fun res!200825 () Bool)

(declare-fun e!221018 () Bool)

(assert (=> b!360973 (=> (not res!200825) (not e!221018))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-datatypes ((array!20259 0))(
  ( (array!20260 (arr!9619 (Array (_ BitVec 32) (_ BitVec 64))) (size!9972 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20259)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-datatypes ((V!12131 0))(
  ( (V!12132 (val!4227 Int)) )
))
(declare-datatypes ((ValueCell!3839 0))(
  ( (ValueCellFull!3839 (v!6415 V!12131)) (EmptyCell!3839) )
))
(declare-datatypes ((array!20261 0))(
  ( (array!20262 (arr!9620 (Array (_ BitVec 32) ValueCell!3839)) (size!9973 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20261)

(assert (=> b!360973 (= res!200825 (and (= (size!9973 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9972 _keys!1541) (size!9973 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!360974 () Bool)

(declare-fun e!221020 () Bool)

(assert (=> b!360974 (= e!221020 (and e!221017 mapRes!14067))))

(declare-fun condMapEmpty!14067 () Bool)

(declare-fun mapDefault!14067 () ValueCell!3839)

(assert (=> b!360974 (= condMapEmpty!14067 (= (arr!9620 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3839)) mapDefault!14067)))))

(declare-fun b!360975 () Bool)

(declare-datatypes ((List!5468 0))(
  ( (Nil!5465) (Cons!5464 (h!6320 (_ BitVec 64)) (t!10609 List!5468)) )
))
(declare-fun noDuplicate!182 (List!5468) Bool)

(assert (=> b!360975 (= e!221018 (not (noDuplicate!182 Nil!5465)))))

(declare-fun b!360976 () Bool)

(declare-fun res!200824 () Bool)

(assert (=> b!360976 (=> (not res!200824) (not e!221018))))

(assert (=> b!360976 (= res!200824 (and (bvsle #b00000000000000000000000000000000 (size!9972 _keys!1541)) (bvslt (size!9972 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!360977 () Bool)

(declare-fun e!221021 () Bool)

(assert (=> b!360977 (= e!221021 tp_is_empty!8365)))

(declare-fun b!360978 () Bool)

(declare-fun res!200826 () Bool)

(assert (=> b!360978 (=> (not res!200826) (not e!221018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20259 (_ BitVec 32)) Bool)

(assert (=> b!360978 (= res!200826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun res!200823 () Bool)

(assert (=> start!35936 (=> (not res!200823) (not e!221018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35936 (= res!200823 (validMask!0 mask!1943))))

(assert (=> start!35936 e!221018))

(assert (=> start!35936 true))

(declare-fun array_inv!7086 (array!20261) Bool)

(assert (=> start!35936 (and (array_inv!7086 _values!1277) e!221020)))

(declare-fun array_inv!7087 (array!20259) Bool)

(assert (=> start!35936 (array_inv!7087 _keys!1541)))

(declare-fun mapNonEmpty!14067 () Bool)

(declare-fun tp!28143 () Bool)

(assert (=> mapNonEmpty!14067 (= mapRes!14067 (and tp!28143 e!221021))))

(declare-fun mapKey!14067 () (_ BitVec 32))

(declare-fun mapValue!14067 () ValueCell!3839)

(declare-fun mapRest!14067 () (Array (_ BitVec 32) ValueCell!3839))

(assert (=> mapNonEmpty!14067 (= (arr!9620 _values!1277) (store mapRest!14067 mapKey!14067 mapValue!14067))))

(assert (= (and start!35936 res!200823) b!360973))

(assert (= (and b!360973 res!200825) b!360978))

(assert (= (and b!360978 res!200826) b!360976))

(assert (= (and b!360976 res!200824) b!360975))

(assert (= (and b!360974 condMapEmpty!14067) mapIsEmpty!14067))

(assert (= (and b!360974 (not condMapEmpty!14067)) mapNonEmpty!14067))

(get-info :version)

(assert (= (and mapNonEmpty!14067 ((_ is ValueCellFull!3839) mapValue!14067)) b!360977))

(assert (= (and b!360974 ((_ is ValueCellFull!3839) mapDefault!14067)) b!360972))

(assert (= start!35936 b!360974))

(declare-fun m!357413 () Bool)

(assert (=> b!360975 m!357413))

(declare-fun m!357415 () Bool)

(assert (=> b!360978 m!357415))

(declare-fun m!357417 () Bool)

(assert (=> start!35936 m!357417))

(declare-fun m!357419 () Bool)

(assert (=> start!35936 m!357419))

(declare-fun m!357421 () Bool)

(assert (=> start!35936 m!357421))

(declare-fun m!357423 () Bool)

(assert (=> mapNonEmpty!14067 m!357423))

(check-sat (not b!360975) (not start!35936) (not b!360978) (not mapNonEmpty!14067) tp_is_empty!8365)
(check-sat)
(get-model)

(declare-fun d!71703 () Bool)

(assert (=> d!71703 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35936 d!71703))

(declare-fun d!71705 () Bool)

(assert (=> d!71705 (= (array_inv!7086 _values!1277) (bvsge (size!9973 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35936 d!71705))

(declare-fun d!71707 () Bool)

(assert (=> d!71707 (= (array_inv!7087 _keys!1541) (bvsge (size!9972 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35936 d!71707))

(declare-fun b!361029 () Bool)

(declare-fun e!221059 () Bool)

(declare-fun e!221058 () Bool)

(assert (=> b!361029 (= e!221059 e!221058)))

(declare-fun lt!166308 () (_ BitVec 64))

(assert (=> b!361029 (= lt!166308 (select (arr!9619 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11090 0))(
  ( (Unit!11091) )
))
(declare-fun lt!166307 () Unit!11090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20259 (_ BitVec 64) (_ BitVec 32)) Unit!11090)

(assert (=> b!361029 (= lt!166307 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166308 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361029 (arrayContainsKey!0 _keys!1541 lt!166308 #b00000000000000000000000000000000)))

(declare-fun lt!166309 () Unit!11090)

(assert (=> b!361029 (= lt!166309 lt!166307)))

(declare-fun res!200855 () Bool)

(declare-datatypes ((SeekEntryResult!3489 0))(
  ( (MissingZero!3489 (index!16135 (_ BitVec 32))) (Found!3489 (index!16136 (_ BitVec 32))) (Intermediate!3489 (undefined!4301 Bool) (index!16137 (_ BitVec 32)) (x!35990 (_ BitVec 32))) (Undefined!3489) (MissingVacant!3489 (index!16138 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20259 (_ BitVec 32)) SeekEntryResult!3489)

(assert (=> b!361029 (= res!200855 (= (seekEntryOrOpen!0 (select (arr!9619 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3489 #b00000000000000000000000000000000)))))

(assert (=> b!361029 (=> (not res!200855) (not e!221058))))

(declare-fun bm!27146 () Bool)

(declare-fun call!27149 () Bool)

(assert (=> bm!27146 (= call!27149 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361030 () Bool)

(assert (=> b!361030 (= e!221058 call!27149)))

(declare-fun b!361031 () Bool)

(declare-fun e!221060 () Bool)

(assert (=> b!361031 (= e!221060 e!221059)))

(declare-fun c!53651 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361031 (= c!53651 (validKeyInArray!0 (select (arr!9619 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun d!71709 () Bool)

(declare-fun res!200856 () Bool)

(assert (=> d!71709 (=> res!200856 e!221060)))

(assert (=> d!71709 (= res!200856 (bvsge #b00000000000000000000000000000000 (size!9972 _keys!1541)))))

(assert (=> d!71709 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221060)))

(declare-fun b!361032 () Bool)

(assert (=> b!361032 (= e!221059 call!27149)))

(assert (= (and d!71709 (not res!200856)) b!361031))

(assert (= (and b!361031 c!53651) b!361029))

(assert (= (and b!361031 (not c!53651)) b!361032))

(assert (= (and b!361029 res!200855) b!361030))

(assert (= (or b!361030 b!361032) bm!27146))

(declare-fun m!357449 () Bool)

(assert (=> b!361029 m!357449))

(declare-fun m!357451 () Bool)

(assert (=> b!361029 m!357451))

(declare-fun m!357453 () Bool)

(assert (=> b!361029 m!357453))

(assert (=> b!361029 m!357449))

(declare-fun m!357455 () Bool)

(assert (=> b!361029 m!357455))

(declare-fun m!357457 () Bool)

(assert (=> bm!27146 m!357457))

(assert (=> b!361031 m!357449))

(assert (=> b!361031 m!357449))

(declare-fun m!357459 () Bool)

(assert (=> b!361031 m!357459))

(assert (=> b!360978 d!71709))

(declare-fun d!71711 () Bool)

(declare-fun res!200861 () Bool)

(declare-fun e!221065 () Bool)

(assert (=> d!71711 (=> res!200861 e!221065)))

(assert (=> d!71711 (= res!200861 ((_ is Nil!5465) Nil!5465))))

(assert (=> d!71711 (= (noDuplicate!182 Nil!5465) e!221065)))

(declare-fun b!361037 () Bool)

(declare-fun e!221066 () Bool)

(assert (=> b!361037 (= e!221065 e!221066)))

(declare-fun res!200862 () Bool)

(assert (=> b!361037 (=> (not res!200862) (not e!221066))))

(declare-fun contains!2413 (List!5468 (_ BitVec 64)) Bool)

(assert (=> b!361037 (= res!200862 (not (contains!2413 (t!10609 Nil!5465) (h!6320 Nil!5465))))))

(declare-fun b!361038 () Bool)

(assert (=> b!361038 (= e!221066 (noDuplicate!182 (t!10609 Nil!5465)))))

(assert (= (and d!71711 (not res!200861)) b!361037))

(assert (= (and b!361037 res!200862) b!361038))

(declare-fun m!357461 () Bool)

(assert (=> b!361037 m!357461))

(declare-fun m!357463 () Bool)

(assert (=> b!361038 m!357463))

(assert (=> b!360975 d!71711))

(declare-fun mapNonEmpty!14076 () Bool)

(declare-fun mapRes!14076 () Bool)

(declare-fun tp!28152 () Bool)

(declare-fun e!221072 () Bool)

(assert (=> mapNonEmpty!14076 (= mapRes!14076 (and tp!28152 e!221072))))

(declare-fun mapKey!14076 () (_ BitVec 32))

(declare-fun mapRest!14076 () (Array (_ BitVec 32) ValueCell!3839))

(declare-fun mapValue!14076 () ValueCell!3839)

(assert (=> mapNonEmpty!14076 (= mapRest!14067 (store mapRest!14076 mapKey!14076 mapValue!14076))))

(declare-fun mapIsEmpty!14076 () Bool)

(assert (=> mapIsEmpty!14076 mapRes!14076))

(declare-fun b!361046 () Bool)

(declare-fun e!221071 () Bool)

(assert (=> b!361046 (= e!221071 tp_is_empty!8365)))

(declare-fun condMapEmpty!14076 () Bool)

(declare-fun mapDefault!14076 () ValueCell!3839)

(assert (=> mapNonEmpty!14067 (= condMapEmpty!14076 (= mapRest!14067 ((as const (Array (_ BitVec 32) ValueCell!3839)) mapDefault!14076)))))

(assert (=> mapNonEmpty!14067 (= tp!28143 (and e!221071 mapRes!14076))))

(declare-fun b!361045 () Bool)

(assert (=> b!361045 (= e!221072 tp_is_empty!8365)))

(assert (= (and mapNonEmpty!14067 condMapEmpty!14076) mapIsEmpty!14076))

(assert (= (and mapNonEmpty!14067 (not condMapEmpty!14076)) mapNonEmpty!14076))

(assert (= (and mapNonEmpty!14076 ((_ is ValueCellFull!3839) mapValue!14076)) b!361045))

(assert (= (and mapNonEmpty!14067 ((_ is ValueCellFull!3839) mapDefault!14076)) b!361046))

(declare-fun m!357465 () Bool)

(assert (=> mapNonEmpty!14076 m!357465))

(check-sat (not b!361037) tp_is_empty!8365 (not b!361031) (not bm!27146) (not b!361038) (not mapNonEmpty!14076) (not b!361029))
(check-sat)
