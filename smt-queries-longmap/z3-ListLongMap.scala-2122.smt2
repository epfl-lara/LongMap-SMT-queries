; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35908 () Bool)

(assert start!35908)

(declare-fun b!360822 () Bool)

(declare-fun res!200757 () Bool)

(declare-fun e!220897 () Bool)

(assert (=> b!360822 (=> (not res!200757) (not e!220897))))

(declare-datatypes ((array!20231 0))(
  ( (array!20232 (arr!9607 (Array (_ BitVec 32) (_ BitVec 64))) (size!9960 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20231)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20231 (_ BitVec 32)) Bool)

(assert (=> b!360822 (= res!200757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!360823 () Bool)

(declare-fun e!220898 () Bool)

(declare-fun tp_is_empty!8353 () Bool)

(assert (=> b!360823 (= e!220898 tp_is_empty!8353)))

(declare-fun mapIsEmpty!14043 () Bool)

(declare-fun mapRes!14043 () Bool)

(assert (=> mapIsEmpty!14043 mapRes!14043))

(declare-fun b!360824 () Bool)

(declare-fun e!220901 () Bool)

(declare-fun e!220899 () Bool)

(assert (=> b!360824 (= e!220901 (and e!220899 mapRes!14043))))

(declare-fun condMapEmpty!14043 () Bool)

(declare-datatypes ((V!12115 0))(
  ( (V!12116 (val!4221 Int)) )
))
(declare-datatypes ((ValueCell!3833 0))(
  ( (ValueCellFull!3833 (v!6409 V!12115)) (EmptyCell!3833) )
))
(declare-datatypes ((array!20233 0))(
  ( (array!20234 (arr!9608 (Array (_ BitVec 32) ValueCell!3833)) (size!9961 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20233)

(declare-fun mapDefault!14043 () ValueCell!3833)

(assert (=> b!360824 (= condMapEmpty!14043 (= (arr!9608 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3833)) mapDefault!14043)))))

(declare-fun b!360825 () Bool)

(assert (=> b!360825 (= e!220897 (bvsgt #b00000000000000000000000000000000 (size!9960 _keys!1541)))))

(declare-fun mapNonEmpty!14043 () Bool)

(declare-fun tp!28119 () Bool)

(assert (=> mapNonEmpty!14043 (= mapRes!14043 (and tp!28119 e!220898))))

(declare-fun mapRest!14043 () (Array (_ BitVec 32) ValueCell!3833))

(declare-fun mapValue!14043 () ValueCell!3833)

(declare-fun mapKey!14043 () (_ BitVec 32))

(assert (=> mapNonEmpty!14043 (= (arr!9608 _values!1277) (store mapRest!14043 mapKey!14043 mapValue!14043))))

(declare-fun res!200756 () Bool)

(assert (=> start!35908 (=> (not res!200756) (not e!220897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35908 (= res!200756 (validMask!0 mask!1943))))

(assert (=> start!35908 e!220897))

(assert (=> start!35908 true))

(declare-fun array_inv!7076 (array!20233) Bool)

(assert (=> start!35908 (and (array_inv!7076 _values!1277) e!220901)))

(declare-fun array_inv!7077 (array!20231) Bool)

(assert (=> start!35908 (array_inv!7077 _keys!1541)))

(declare-fun b!360826 () Bool)

(assert (=> b!360826 (= e!220899 tp_is_empty!8353)))

(declare-fun b!360827 () Bool)

(declare-fun res!200755 () Bool)

(assert (=> b!360827 (=> (not res!200755) (not e!220897))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!360827 (= res!200755 (and (= (size!9961 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9960 _keys!1541) (size!9961 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(assert (= (and start!35908 res!200756) b!360827))

(assert (= (and b!360827 res!200755) b!360822))

(assert (= (and b!360822 res!200757) b!360825))

(assert (= (and b!360824 condMapEmpty!14043) mapIsEmpty!14043))

(assert (= (and b!360824 (not condMapEmpty!14043)) mapNonEmpty!14043))

(get-info :version)

(assert (= (and mapNonEmpty!14043 ((_ is ValueCellFull!3833) mapValue!14043)) b!360823))

(assert (= (and b!360824 ((_ is ValueCellFull!3833) mapDefault!14043)) b!360826))

(assert (= start!35908 b!360824))

(declare-fun m!357325 () Bool)

(assert (=> b!360822 m!357325))

(declare-fun m!357327 () Bool)

(assert (=> mapNonEmpty!14043 m!357327))

(declare-fun m!357329 () Bool)

(assert (=> start!35908 m!357329))

(declare-fun m!357331 () Bool)

(assert (=> start!35908 m!357331))

(declare-fun m!357333 () Bool)

(assert (=> start!35908 m!357333))

(check-sat (not b!360822) (not start!35908) (not mapNonEmpty!14043) tp_is_empty!8353)
(check-sat)
(get-model)

(declare-fun b!360872 () Bool)

(declare-fun e!220939 () Bool)

(declare-fun call!27143 () Bool)

(assert (=> b!360872 (= e!220939 call!27143)))

(declare-fun b!360873 () Bool)

(declare-fun e!220940 () Bool)

(assert (=> b!360873 (= e!220939 e!220940)))

(declare-fun lt!166291 () (_ BitVec 64))

(assert (=> b!360873 (= lt!166291 (select (arr!9607 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11086 0))(
  ( (Unit!11087) )
))
(declare-fun lt!166290 () Unit!11086)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20231 (_ BitVec 64) (_ BitVec 32)) Unit!11086)

(assert (=> b!360873 (= lt!166290 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166291 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360873 (arrayContainsKey!0 _keys!1541 lt!166291 #b00000000000000000000000000000000)))

(declare-fun lt!166289 () Unit!11086)

(assert (=> b!360873 (= lt!166289 lt!166290)))

(declare-fun res!200781 () Bool)

(declare-datatypes ((SeekEntryResult!3487 0))(
  ( (MissingZero!3487 (index!16127 (_ BitVec 32))) (Found!3487 (index!16128 (_ BitVec 32))) (Intermediate!3487 (undefined!4299 Bool) (index!16129 (_ BitVec 32)) (x!35968 (_ BitVec 32))) (Undefined!3487) (MissingVacant!3487 (index!16130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20231 (_ BitVec 32)) SeekEntryResult!3487)

(assert (=> b!360873 (= res!200781 (= (seekEntryOrOpen!0 (select (arr!9607 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3487 #b00000000000000000000000000000000)))))

(assert (=> b!360873 (=> (not res!200781) (not e!220940))))

(declare-fun b!360874 () Bool)

(declare-fun e!220938 () Bool)

(assert (=> b!360874 (= e!220938 e!220939)))

(declare-fun c!53645 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360874 (= c!53645 (validKeyInArray!0 (select (arr!9607 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun d!71683 () Bool)

(declare-fun res!200780 () Bool)

(assert (=> d!71683 (=> res!200780 e!220938)))

(assert (=> d!71683 (= res!200780 (bvsge #b00000000000000000000000000000000 (size!9960 _keys!1541)))))

(assert (=> d!71683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!220938)))

(declare-fun b!360875 () Bool)

(assert (=> b!360875 (= e!220940 call!27143)))

(declare-fun bm!27140 () Bool)

(assert (=> bm!27140 (= call!27143 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(assert (= (and d!71683 (not res!200780)) b!360874))

(assert (= (and b!360874 c!53645) b!360873))

(assert (= (and b!360874 (not c!53645)) b!360872))

(assert (= (and b!360873 res!200781) b!360875))

(assert (= (or b!360875 b!360872) bm!27140))

(declare-fun m!357355 () Bool)

(assert (=> b!360873 m!357355))

(declare-fun m!357357 () Bool)

(assert (=> b!360873 m!357357))

(declare-fun m!357359 () Bool)

(assert (=> b!360873 m!357359))

(assert (=> b!360873 m!357355))

(declare-fun m!357361 () Bool)

(assert (=> b!360873 m!357361))

(assert (=> b!360874 m!357355))

(assert (=> b!360874 m!357355))

(declare-fun m!357363 () Bool)

(assert (=> b!360874 m!357363))

(declare-fun m!357365 () Bool)

(assert (=> bm!27140 m!357365))

(assert (=> b!360822 d!71683))

(declare-fun d!71685 () Bool)

(assert (=> d!71685 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35908 d!71685))

(declare-fun d!71687 () Bool)

(assert (=> d!71687 (= (array_inv!7076 _values!1277) (bvsge (size!9961 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35908 d!71687))

(declare-fun d!71689 () Bool)

(assert (=> d!71689 (= (array_inv!7077 _keys!1541) (bvsge (size!9960 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35908 d!71689))

(declare-fun b!360883 () Bool)

(declare-fun e!220945 () Bool)

(assert (=> b!360883 (= e!220945 tp_is_empty!8353)))

(declare-fun mapNonEmpty!14052 () Bool)

(declare-fun mapRes!14052 () Bool)

(declare-fun tp!28128 () Bool)

(declare-fun e!220946 () Bool)

(assert (=> mapNonEmpty!14052 (= mapRes!14052 (and tp!28128 e!220946))))

(declare-fun mapRest!14052 () (Array (_ BitVec 32) ValueCell!3833))

(declare-fun mapValue!14052 () ValueCell!3833)

(declare-fun mapKey!14052 () (_ BitVec 32))

(assert (=> mapNonEmpty!14052 (= mapRest!14043 (store mapRest!14052 mapKey!14052 mapValue!14052))))

(declare-fun b!360882 () Bool)

(assert (=> b!360882 (= e!220946 tp_is_empty!8353)))

(declare-fun mapIsEmpty!14052 () Bool)

(assert (=> mapIsEmpty!14052 mapRes!14052))

(declare-fun condMapEmpty!14052 () Bool)

(declare-fun mapDefault!14052 () ValueCell!3833)

(assert (=> mapNonEmpty!14043 (= condMapEmpty!14052 (= mapRest!14043 ((as const (Array (_ BitVec 32) ValueCell!3833)) mapDefault!14052)))))

(assert (=> mapNonEmpty!14043 (= tp!28119 (and e!220945 mapRes!14052))))

(assert (= (and mapNonEmpty!14043 condMapEmpty!14052) mapIsEmpty!14052))

(assert (= (and mapNonEmpty!14043 (not condMapEmpty!14052)) mapNonEmpty!14052))

(assert (= (and mapNonEmpty!14052 ((_ is ValueCellFull!3833) mapValue!14052)) b!360882))

(assert (= (and mapNonEmpty!14043 ((_ is ValueCellFull!3833) mapDefault!14052)) b!360883))

(declare-fun m!357367 () Bool)

(assert (=> mapNonEmpty!14052 m!357367))

(check-sat tp_is_empty!8353 (not bm!27140) (not b!360874) (not mapNonEmpty!14052) (not b!360873))
(check-sat)
