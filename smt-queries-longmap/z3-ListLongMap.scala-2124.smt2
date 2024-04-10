; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35952 () Bool)

(assert start!35952)

(declare-fun b!361268 () Bool)

(declare-fun res!200964 () Bool)

(declare-fun e!221211 () Bool)

(assert (=> b!361268 (=> (not res!200964) (not e!221211))))

(declare-datatypes ((array!20287 0))(
  ( (array!20288 (arr!9633 (Array (_ BitVec 32) (_ BitVec 64))) (size!9985 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20287)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-datatypes ((V!12133 0))(
  ( (V!12134 (val!4228 Int)) )
))
(declare-datatypes ((ValueCell!3840 0))(
  ( (ValueCellFull!3840 (v!6422 V!12133)) (EmptyCell!3840) )
))
(declare-datatypes ((array!20289 0))(
  ( (array!20290 (arr!9634 (Array (_ BitVec 32) ValueCell!3840)) (size!9986 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20289)

(assert (=> b!361268 (= res!200964 (and (= (size!9986 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9985 _keys!1541) (size!9986 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14070 () Bool)

(declare-fun mapRes!14070 () Bool)

(declare-fun tp!28146 () Bool)

(declare-fun e!221212 () Bool)

(assert (=> mapNonEmpty!14070 (= mapRes!14070 (and tp!28146 e!221212))))

(declare-fun mapValue!14070 () ValueCell!3840)

(declare-fun mapKey!14070 () (_ BitVec 32))

(declare-fun mapRest!14070 () (Array (_ BitVec 32) ValueCell!3840))

(assert (=> mapNonEmpty!14070 (= (arr!9634 _values!1277) (store mapRest!14070 mapKey!14070 mapValue!14070))))

(declare-fun b!361269 () Bool)

(declare-fun res!200967 () Bool)

(assert (=> b!361269 (=> (not res!200967) (not e!221211))))

(assert (=> b!361269 (= res!200967 (and (bvsle #b00000000000000000000000000000000 (size!9985 _keys!1541)) (bvslt (size!9985 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361270 () Bool)

(declare-datatypes ((List!5503 0))(
  ( (Nil!5500) (Cons!5499 (h!6355 (_ BitVec 64)) (t!10653 List!5503)) )
))
(declare-fun noDuplicate!181 (List!5503) Bool)

(assert (=> b!361270 (= e!221211 (not (noDuplicate!181 Nil!5500)))))

(declare-fun res!200965 () Bool)

(assert (=> start!35952 (=> (not res!200965) (not e!221211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35952 (= res!200965 (validMask!0 mask!1943))))

(assert (=> start!35952 e!221211))

(assert (=> start!35952 true))

(declare-fun e!221209 () Bool)

(declare-fun array_inv!7084 (array!20289) Bool)

(assert (=> start!35952 (and (array_inv!7084 _values!1277) e!221209)))

(declare-fun array_inv!7085 (array!20287) Bool)

(assert (=> start!35952 (array_inv!7085 _keys!1541)))

(declare-fun b!361271 () Bool)

(declare-fun e!221210 () Bool)

(assert (=> b!361271 (= e!221209 (and e!221210 mapRes!14070))))

(declare-fun condMapEmpty!14070 () Bool)

(declare-fun mapDefault!14070 () ValueCell!3840)

(assert (=> b!361271 (= condMapEmpty!14070 (= (arr!9634 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3840)) mapDefault!14070)))))

(declare-fun b!361272 () Bool)

(declare-fun tp_is_empty!8367 () Bool)

(assert (=> b!361272 (= e!221212 tp_is_empty!8367)))

(declare-fun b!361273 () Bool)

(declare-fun res!200966 () Bool)

(assert (=> b!361273 (=> (not res!200966) (not e!221211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20287 (_ BitVec 32)) Bool)

(assert (=> b!361273 (= res!200966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361274 () Bool)

(assert (=> b!361274 (= e!221210 tp_is_empty!8367)))

(declare-fun mapIsEmpty!14070 () Bool)

(assert (=> mapIsEmpty!14070 mapRes!14070))

(assert (= (and start!35952 res!200965) b!361268))

(assert (= (and b!361268 res!200964) b!361273))

(assert (= (and b!361273 res!200966) b!361269))

(assert (= (and b!361269 res!200967) b!361270))

(assert (= (and b!361271 condMapEmpty!14070) mapIsEmpty!14070))

(assert (= (and b!361271 (not condMapEmpty!14070)) mapNonEmpty!14070))

(get-info :version)

(assert (= (and mapNonEmpty!14070 ((_ is ValueCellFull!3840) mapValue!14070)) b!361272))

(assert (= (and b!361271 ((_ is ValueCellFull!3840) mapDefault!14070)) b!361274))

(assert (= start!35952 b!361271))

(declare-fun m!358155 () Bool)

(assert (=> mapNonEmpty!14070 m!358155))

(declare-fun m!358157 () Bool)

(assert (=> b!361270 m!358157))

(declare-fun m!358159 () Bool)

(assert (=> start!35952 m!358159))

(declare-fun m!358161 () Bool)

(assert (=> start!35952 m!358161))

(declare-fun m!358163 () Bool)

(assert (=> start!35952 m!358163))

(declare-fun m!358165 () Bool)

(assert (=> b!361273 m!358165))

(check-sat (not b!361270) tp_is_empty!8367 (not start!35952) (not b!361273) (not mapNonEmpty!14070))
(check-sat)
(get-model)

(declare-fun d!71909 () Bool)

(declare-fun res!200984 () Bool)

(declare-fun e!221232 () Bool)

(assert (=> d!71909 (=> res!200984 e!221232)))

(assert (=> d!71909 (= res!200984 ((_ is Nil!5500) Nil!5500))))

(assert (=> d!71909 (= (noDuplicate!181 Nil!5500) e!221232)))

(declare-fun b!361300 () Bool)

(declare-fun e!221233 () Bool)

(assert (=> b!361300 (= e!221232 e!221233)))

(declare-fun res!200985 () Bool)

(assert (=> b!361300 (=> (not res!200985) (not e!221233))))

(declare-fun contains!2423 (List!5503 (_ BitVec 64)) Bool)

(assert (=> b!361300 (= res!200985 (not (contains!2423 (t!10653 Nil!5500) (h!6355 Nil!5500))))))

(declare-fun b!361301 () Bool)

(assert (=> b!361301 (= e!221233 (noDuplicate!181 (t!10653 Nil!5500)))))

(assert (= (and d!71909 (not res!200984)) b!361300))

(assert (= (and b!361300 res!200985) b!361301))

(declare-fun m!358179 () Bool)

(assert (=> b!361300 m!358179))

(declare-fun m!358181 () Bool)

(assert (=> b!361301 m!358181))

(assert (=> b!361270 d!71909))

(declare-fun d!71911 () Bool)

(assert (=> d!71911 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35952 d!71911))

(declare-fun d!71913 () Bool)

(assert (=> d!71913 (= (array_inv!7084 _values!1277) (bvsge (size!9986 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35952 d!71913))

(declare-fun d!71915 () Bool)

(assert (=> d!71915 (= (array_inv!7085 _keys!1541) (bvsge (size!9985 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35952 d!71915))

(declare-fun b!361310 () Bool)

(declare-fun e!221240 () Bool)

(declare-fun e!221241 () Bool)

(assert (=> b!361310 (= e!221240 e!221241)))

(declare-fun c!53724 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361310 (= c!53724 (validKeyInArray!0 (select (arr!9633 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361311 () Bool)

(declare-fun e!221242 () Bool)

(assert (=> b!361311 (= e!221241 e!221242)))

(declare-fun lt!166543 () (_ BitVec 64))

(assert (=> b!361311 (= lt!166543 (select (arr!9633 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11112 0))(
  ( (Unit!11113) )
))
(declare-fun lt!166544 () Unit!11112)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20287 (_ BitVec 64) (_ BitVec 32)) Unit!11112)

(assert (=> b!361311 (= lt!166544 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166543 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361311 (arrayContainsKey!0 _keys!1541 lt!166543 #b00000000000000000000000000000000)))

(declare-fun lt!166542 () Unit!11112)

(assert (=> b!361311 (= lt!166542 lt!166544)))

(declare-fun res!200990 () Bool)

(declare-datatypes ((SeekEntryResult!3494 0))(
  ( (MissingZero!3494 (index!16155 (_ BitVec 32))) (Found!3494 (index!16156 (_ BitVec 32))) (Intermediate!3494 (undefined!4306 Bool) (index!16157 (_ BitVec 32)) (x!36000 (_ BitVec 32))) (Undefined!3494) (MissingVacant!3494 (index!16158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20287 (_ BitVec 32)) SeekEntryResult!3494)

(assert (=> b!361311 (= res!200990 (= (seekEntryOrOpen!0 (select (arr!9633 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3494 #b00000000000000000000000000000000)))))

(assert (=> b!361311 (=> (not res!200990) (not e!221242))))

(declare-fun bm!27172 () Bool)

(declare-fun call!27175 () Bool)

(assert (=> bm!27172 (= call!27175 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun d!71917 () Bool)

(declare-fun res!200991 () Bool)

(assert (=> d!71917 (=> res!200991 e!221240)))

(assert (=> d!71917 (= res!200991 (bvsge #b00000000000000000000000000000000 (size!9985 _keys!1541)))))

(assert (=> d!71917 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221240)))

(declare-fun b!361312 () Bool)

(assert (=> b!361312 (= e!221241 call!27175)))

(declare-fun b!361313 () Bool)

(assert (=> b!361313 (= e!221242 call!27175)))

(assert (= (and d!71917 (not res!200991)) b!361310))

(assert (= (and b!361310 c!53724) b!361311))

(assert (= (and b!361310 (not c!53724)) b!361312))

(assert (= (and b!361311 res!200990) b!361313))

(assert (= (or b!361313 b!361312) bm!27172))

(declare-fun m!358183 () Bool)

(assert (=> b!361310 m!358183))

(assert (=> b!361310 m!358183))

(declare-fun m!358185 () Bool)

(assert (=> b!361310 m!358185))

(assert (=> b!361311 m!358183))

(declare-fun m!358187 () Bool)

(assert (=> b!361311 m!358187))

(declare-fun m!358189 () Bool)

(assert (=> b!361311 m!358189))

(assert (=> b!361311 m!358183))

(declare-fun m!358191 () Bool)

(assert (=> b!361311 m!358191))

(declare-fun m!358193 () Bool)

(assert (=> bm!27172 m!358193))

(assert (=> b!361273 d!71917))

(declare-fun mapNonEmpty!14076 () Bool)

(declare-fun mapRes!14076 () Bool)

(declare-fun tp!28152 () Bool)

(declare-fun e!221248 () Bool)

(assert (=> mapNonEmpty!14076 (= mapRes!14076 (and tp!28152 e!221248))))

(declare-fun mapValue!14076 () ValueCell!3840)

(declare-fun mapRest!14076 () (Array (_ BitVec 32) ValueCell!3840))

(declare-fun mapKey!14076 () (_ BitVec 32))

(assert (=> mapNonEmpty!14076 (= mapRest!14070 (store mapRest!14076 mapKey!14076 mapValue!14076))))

(declare-fun condMapEmpty!14076 () Bool)

(declare-fun mapDefault!14076 () ValueCell!3840)

(assert (=> mapNonEmpty!14070 (= condMapEmpty!14076 (= mapRest!14070 ((as const (Array (_ BitVec 32) ValueCell!3840)) mapDefault!14076)))))

(declare-fun e!221247 () Bool)

(assert (=> mapNonEmpty!14070 (= tp!28146 (and e!221247 mapRes!14076))))

(declare-fun b!361321 () Bool)

(assert (=> b!361321 (= e!221247 tp_is_empty!8367)))

(declare-fun b!361320 () Bool)

(assert (=> b!361320 (= e!221248 tp_is_empty!8367)))

(declare-fun mapIsEmpty!14076 () Bool)

(assert (=> mapIsEmpty!14076 mapRes!14076))

(assert (= (and mapNonEmpty!14070 condMapEmpty!14076) mapIsEmpty!14076))

(assert (= (and mapNonEmpty!14070 (not condMapEmpty!14076)) mapNonEmpty!14076))

(assert (= (and mapNonEmpty!14076 ((_ is ValueCellFull!3840) mapValue!14076)) b!361320))

(assert (= (and mapNonEmpty!14070 ((_ is ValueCellFull!3840) mapDefault!14076)) b!361321))

(declare-fun m!358195 () Bool)

(assert (=> mapNonEmpty!14076 m!358195))

(check-sat tp_is_empty!8367 (not b!361310) (not b!361300) (not b!361311) (not b!361301) (not mapNonEmpty!14076) (not bm!27172))
(check-sat)
