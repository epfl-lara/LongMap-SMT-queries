; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35908 () Bool)

(assert start!35908)

(declare-fun res!200882 () Bool)

(declare-fun e!221041 () Bool)

(assert (=> start!35908 (=> (not res!200882) (not e!221041))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35908 (= res!200882 (validMask!0 mask!1943))))

(assert (=> start!35908 e!221041))

(assert (=> start!35908 true))

(declare-datatypes ((V!12115 0))(
  ( (V!12116 (val!4221 Int)) )
))
(declare-datatypes ((ValueCell!3833 0))(
  ( (ValueCellFull!3833 (v!6416 V!12115)) (EmptyCell!3833) )
))
(declare-datatypes ((array!20236 0))(
  ( (array!20237 (arr!9609 (Array (_ BitVec 32) ValueCell!3833)) (size!9961 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20236)

(declare-fun e!221043 () Bool)

(declare-fun array_inv!7100 (array!20236) Bool)

(assert (=> start!35908 (and (array_inv!7100 _values!1277) e!221043)))

(declare-datatypes ((array!20238 0))(
  ( (array!20239 (arr!9610 (Array (_ BitVec 32) (_ BitVec 64))) (size!9962 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20238)

(declare-fun array_inv!7101 (array!20238) Bool)

(assert (=> start!35908 (array_inv!7101 _keys!1541)))

(declare-fun mapIsEmpty!14043 () Bool)

(declare-fun mapRes!14043 () Bool)

(assert (=> mapIsEmpty!14043 mapRes!14043))

(declare-fun b!361044 () Bool)

(declare-fun res!200881 () Bool)

(assert (=> b!361044 (=> (not res!200881) (not e!221041))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361044 (= res!200881 (and (= (size!9961 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9962 _keys!1541) (size!9961 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361045 () Bool)

(declare-fun e!221039 () Bool)

(assert (=> b!361045 (= e!221043 (and e!221039 mapRes!14043))))

(declare-fun condMapEmpty!14043 () Bool)

(declare-fun mapDefault!14043 () ValueCell!3833)

(assert (=> b!361045 (= condMapEmpty!14043 (= (arr!9609 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3833)) mapDefault!14043)))))

(declare-fun b!361046 () Bool)

(declare-fun res!200883 () Bool)

(assert (=> b!361046 (=> (not res!200883) (not e!221041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20238 (_ BitVec 32)) Bool)

(assert (=> b!361046 (= res!200883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361047 () Bool)

(declare-fun tp_is_empty!8353 () Bool)

(assert (=> b!361047 (= e!221039 tp_is_empty!8353)))

(declare-fun mapNonEmpty!14043 () Bool)

(declare-fun tp!28119 () Bool)

(declare-fun e!221042 () Bool)

(assert (=> mapNonEmpty!14043 (= mapRes!14043 (and tp!28119 e!221042))))

(declare-fun mapValue!14043 () ValueCell!3833)

(declare-fun mapRest!14043 () (Array (_ BitVec 32) ValueCell!3833))

(declare-fun mapKey!14043 () (_ BitVec 32))

(assert (=> mapNonEmpty!14043 (= (arr!9609 _values!1277) (store mapRest!14043 mapKey!14043 mapValue!14043))))

(declare-fun b!361048 () Bool)

(assert (=> b!361048 (= e!221041 (bvsgt #b00000000000000000000000000000000 (size!9962 _keys!1541)))))

(declare-fun b!361049 () Bool)

(assert (=> b!361049 (= e!221042 tp_is_empty!8353)))

(assert (= (and start!35908 res!200882) b!361044))

(assert (= (and b!361044 res!200881) b!361046))

(assert (= (and b!361046 res!200883) b!361048))

(assert (= (and b!361045 condMapEmpty!14043) mapIsEmpty!14043))

(assert (= (and b!361045 (not condMapEmpty!14043)) mapNonEmpty!14043))

(get-info :version)

(assert (= (and mapNonEmpty!14043 ((_ is ValueCellFull!3833) mapValue!14043)) b!361049))

(assert (= (and b!361045 ((_ is ValueCellFull!3833) mapDefault!14043)) b!361047))

(assert (= start!35908 b!361045))

(declare-fun m!358279 () Bool)

(assert (=> start!35908 m!358279))

(declare-fun m!358281 () Bool)

(assert (=> start!35908 m!358281))

(declare-fun m!358283 () Bool)

(assert (=> start!35908 m!358283))

(declare-fun m!358285 () Bool)

(assert (=> b!361046 m!358285))

(declare-fun m!358287 () Bool)

(assert (=> mapNonEmpty!14043 m!358287))

(check-sat (not b!361046) (not start!35908) (not mapNonEmpty!14043) tp_is_empty!8353)
(check-sat)
(get-model)

(declare-fun bm!27152 () Bool)

(declare-fun call!27155 () Bool)

(assert (=> bm!27152 (= call!27155 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361094 () Bool)

(declare-fun e!221081 () Bool)

(assert (=> b!361094 (= e!221081 call!27155)))

(declare-fun d!71917 () Bool)

(declare-fun res!200906 () Bool)

(declare-fun e!221082 () Bool)

(assert (=> d!71917 (=> res!200906 e!221082)))

(assert (=> d!71917 (= res!200906 (bvsge #b00000000000000000000000000000000 (size!9962 _keys!1541)))))

(assert (=> d!71917 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221082)))

(declare-fun b!361095 () Bool)

(declare-fun e!221080 () Bool)

(assert (=> b!361095 (= e!221080 e!221081)))

(declare-fun lt!166544 () (_ BitVec 64))

(assert (=> b!361095 (= lt!166544 (select (arr!9610 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11097 0))(
  ( (Unit!11098) )
))
(declare-fun lt!166542 () Unit!11097)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20238 (_ BitVec 64) (_ BitVec 32)) Unit!11097)

(assert (=> b!361095 (= lt!166542 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166544 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361095 (arrayContainsKey!0 _keys!1541 lt!166544 #b00000000000000000000000000000000)))

(declare-fun lt!166543 () Unit!11097)

(assert (=> b!361095 (= lt!166543 lt!166542)))

(declare-fun res!200907 () Bool)

(declare-datatypes ((SeekEntryResult!3441 0))(
  ( (MissingZero!3441 (index!15943 (_ BitVec 32))) (Found!3441 (index!15944 (_ BitVec 32))) (Intermediate!3441 (undefined!4253 Bool) (index!15945 (_ BitVec 32)) (x!35924 (_ BitVec 32))) (Undefined!3441) (MissingVacant!3441 (index!15946 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20238 (_ BitVec 32)) SeekEntryResult!3441)

(assert (=> b!361095 (= res!200907 (= (seekEntryOrOpen!0 (select (arr!9610 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3441 #b00000000000000000000000000000000)))))

(assert (=> b!361095 (=> (not res!200907) (not e!221081))))

(declare-fun b!361096 () Bool)

(assert (=> b!361096 (= e!221082 e!221080)))

(declare-fun c!53693 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361096 (= c!53693 (validKeyInArray!0 (select (arr!9610 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361097 () Bool)

(assert (=> b!361097 (= e!221080 call!27155)))

(assert (= (and d!71917 (not res!200906)) b!361096))

(assert (= (and b!361096 c!53693) b!361095))

(assert (= (and b!361096 (not c!53693)) b!361097))

(assert (= (and b!361095 res!200907) b!361094))

(assert (= (or b!361094 b!361097) bm!27152))

(declare-fun m!358309 () Bool)

(assert (=> bm!27152 m!358309))

(declare-fun m!358311 () Bool)

(assert (=> b!361095 m!358311))

(declare-fun m!358313 () Bool)

(assert (=> b!361095 m!358313))

(declare-fun m!358315 () Bool)

(assert (=> b!361095 m!358315))

(assert (=> b!361095 m!358311))

(declare-fun m!358317 () Bool)

(assert (=> b!361095 m!358317))

(assert (=> b!361096 m!358311))

(assert (=> b!361096 m!358311))

(declare-fun m!358319 () Bool)

(assert (=> b!361096 m!358319))

(assert (=> b!361046 d!71917))

(declare-fun d!71919 () Bool)

(assert (=> d!71919 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35908 d!71919))

(declare-fun d!71921 () Bool)

(assert (=> d!71921 (= (array_inv!7100 _values!1277) (bvsge (size!9961 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35908 d!71921))

(declare-fun d!71923 () Bool)

(assert (=> d!71923 (= (array_inv!7101 _keys!1541) (bvsge (size!9962 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35908 d!71923))

(declare-fun mapNonEmpty!14052 () Bool)

(declare-fun mapRes!14052 () Bool)

(declare-fun tp!28128 () Bool)

(declare-fun e!221087 () Bool)

(assert (=> mapNonEmpty!14052 (= mapRes!14052 (and tp!28128 e!221087))))

(declare-fun mapRest!14052 () (Array (_ BitVec 32) ValueCell!3833))

(declare-fun mapValue!14052 () ValueCell!3833)

(declare-fun mapKey!14052 () (_ BitVec 32))

(assert (=> mapNonEmpty!14052 (= mapRest!14043 (store mapRest!14052 mapKey!14052 mapValue!14052))))

(declare-fun b!361104 () Bool)

(assert (=> b!361104 (= e!221087 tp_is_empty!8353)))

(declare-fun b!361105 () Bool)

(declare-fun e!221088 () Bool)

(assert (=> b!361105 (= e!221088 tp_is_empty!8353)))

(declare-fun condMapEmpty!14052 () Bool)

(declare-fun mapDefault!14052 () ValueCell!3833)

(assert (=> mapNonEmpty!14043 (= condMapEmpty!14052 (= mapRest!14043 ((as const (Array (_ BitVec 32) ValueCell!3833)) mapDefault!14052)))))

(assert (=> mapNonEmpty!14043 (= tp!28119 (and e!221088 mapRes!14052))))

(declare-fun mapIsEmpty!14052 () Bool)

(assert (=> mapIsEmpty!14052 mapRes!14052))

(assert (= (and mapNonEmpty!14043 condMapEmpty!14052) mapIsEmpty!14052))

(assert (= (and mapNonEmpty!14043 (not condMapEmpty!14052)) mapNonEmpty!14052))

(assert (= (and mapNonEmpty!14052 ((_ is ValueCellFull!3833) mapValue!14052)) b!361104))

(assert (= (and mapNonEmpty!14043 ((_ is ValueCellFull!3833) mapDefault!14052)) b!361105))

(declare-fun m!358321 () Bool)

(assert (=> mapNonEmpty!14052 m!358321))

(check-sat (not mapNonEmpty!14052) tp_is_empty!8353 (not b!361095) (not bm!27152) (not b!361096))
(check-sat)
