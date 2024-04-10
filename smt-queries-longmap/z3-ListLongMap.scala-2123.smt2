; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35938 () Bool)

(assert start!35938)

(declare-fun b!361189 () Bool)

(declare-fun res!200926 () Bool)

(declare-fun e!221148 () Bool)

(assert (=> b!361189 (=> (not res!200926) (not e!221148))))

(declare-datatypes ((array!20273 0))(
  ( (array!20274 (arr!9627 (Array (_ BitVec 32) (_ BitVec 64))) (size!9979 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20273)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20273 (_ BitVec 32)) Bool)

(assert (=> b!361189 (= res!200926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361190 () Bool)

(declare-fun e!221149 () Bool)

(declare-fun e!221150 () Bool)

(declare-fun mapRes!14058 () Bool)

(assert (=> b!361190 (= e!221149 (and e!221150 mapRes!14058))))

(declare-fun condMapEmpty!14058 () Bool)

(declare-datatypes ((V!12125 0))(
  ( (V!12126 (val!4225 Int)) )
))
(declare-datatypes ((ValueCell!3837 0))(
  ( (ValueCellFull!3837 (v!6419 V!12125)) (EmptyCell!3837) )
))
(declare-datatypes ((array!20275 0))(
  ( (array!20276 (arr!9628 (Array (_ BitVec 32) ValueCell!3837)) (size!9980 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20275)

(declare-fun mapDefault!14058 () ValueCell!3837)

(assert (=> b!361190 (= condMapEmpty!14058 (= (arr!9628 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3837)) mapDefault!14058)))))

(declare-fun mapNonEmpty!14058 () Bool)

(declare-fun tp!28134 () Bool)

(declare-fun e!221151 () Bool)

(assert (=> mapNonEmpty!14058 (= mapRes!14058 (and tp!28134 e!221151))))

(declare-fun mapRest!14058 () (Array (_ BitVec 32) ValueCell!3837))

(declare-fun mapKey!14058 () (_ BitVec 32))

(declare-fun mapValue!14058 () ValueCell!3837)

(assert (=> mapNonEmpty!14058 (= (arr!9628 _values!1277) (store mapRest!14058 mapKey!14058 mapValue!14058))))

(declare-fun res!200928 () Bool)

(assert (=> start!35938 (=> (not res!200928) (not e!221148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35938 (= res!200928 (validMask!0 mask!1943))))

(assert (=> start!35938 e!221148))

(assert (=> start!35938 true))

(declare-fun array_inv!7078 (array!20275) Bool)

(assert (=> start!35938 (and (array_inv!7078 _values!1277) e!221149)))

(declare-fun array_inv!7079 (array!20273) Bool)

(assert (=> start!35938 (array_inv!7079 _keys!1541)))

(declare-fun b!361191 () Bool)

(declare-fun res!200927 () Bool)

(assert (=> b!361191 (=> (not res!200927) (not e!221148))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361191 (= res!200927 (and (= (size!9980 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9979 _keys!1541) (size!9980 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361192 () Bool)

(declare-fun tp_is_empty!8361 () Bool)

(assert (=> b!361192 (= e!221151 tp_is_empty!8361)))

(declare-fun b!361193 () Bool)

(assert (=> b!361193 (= e!221150 tp_is_empty!8361)))

(declare-fun b!361194 () Bool)

(assert (=> b!361194 (= e!221148 (and (bvsle #b00000000000000000000000000000000 (size!9979 _keys!1541)) (bvsge (size!9979 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!14058 () Bool)

(assert (=> mapIsEmpty!14058 mapRes!14058))

(assert (= (and start!35938 res!200928) b!361191))

(assert (= (and b!361191 res!200927) b!361189))

(assert (= (and b!361189 res!200926) b!361194))

(assert (= (and b!361190 condMapEmpty!14058) mapIsEmpty!14058))

(assert (= (and b!361190 (not condMapEmpty!14058)) mapNonEmpty!14058))

(get-info :version)

(assert (= (and mapNonEmpty!14058 ((_ is ValueCellFull!3837) mapValue!14058)) b!361192))

(assert (= (and b!361190 ((_ is ValueCellFull!3837) mapDefault!14058)) b!361193))

(assert (= start!35938 b!361190))

(declare-fun m!358109 () Bool)

(assert (=> b!361189 m!358109))

(declare-fun m!358111 () Bool)

(assert (=> mapNonEmpty!14058 m!358111))

(declare-fun m!358113 () Bool)

(assert (=> start!35938 m!358113))

(declare-fun m!358115 () Bool)

(assert (=> start!35938 m!358115))

(declare-fun m!358117 () Bool)

(assert (=> start!35938 m!358117))

(check-sat (not b!361189) (not start!35938) (not mapNonEmpty!14058) tp_is_empty!8361)
(check-sat)
(get-model)

(declare-fun bm!27169 () Bool)

(declare-fun call!27172 () Bool)

(assert (=> bm!27169 (= call!27172 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361221 () Bool)

(declare-fun e!221175 () Bool)

(declare-fun e!221174 () Bool)

(assert (=> b!361221 (= e!221175 e!221174)))

(declare-fun lt!166534 () (_ BitVec 64))

(assert (=> b!361221 (= lt!166534 (select (arr!9627 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11110 0))(
  ( (Unit!11111) )
))
(declare-fun lt!166533 () Unit!11110)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20273 (_ BitVec 64) (_ BitVec 32)) Unit!11110)

(assert (=> b!361221 (= lt!166533 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166534 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361221 (arrayContainsKey!0 _keys!1541 lt!166534 #b00000000000000000000000000000000)))

(declare-fun lt!166535 () Unit!11110)

(assert (=> b!361221 (= lt!166535 lt!166533)))

(declare-fun res!200942 () Bool)

(declare-datatypes ((SeekEntryResult!3493 0))(
  ( (MissingZero!3493 (index!16151 (_ BitVec 32))) (Found!3493 (index!16152 (_ BitVec 32))) (Intermediate!3493 (undefined!4305 Bool) (index!16153 (_ BitVec 32)) (x!35989 (_ BitVec 32))) (Undefined!3493) (MissingVacant!3493 (index!16154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20273 (_ BitVec 32)) SeekEntryResult!3493)

(assert (=> b!361221 (= res!200942 (= (seekEntryOrOpen!0 (select (arr!9627 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3493 #b00000000000000000000000000000000)))))

(assert (=> b!361221 (=> (not res!200942) (not e!221174))))

(declare-fun b!361222 () Bool)

(assert (=> b!361222 (= e!221174 call!27172)))

(declare-fun d!71899 () Bool)

(declare-fun res!200943 () Bool)

(declare-fun e!221176 () Bool)

(assert (=> d!71899 (=> res!200943 e!221176)))

(assert (=> d!71899 (= res!200943 (bvsge #b00000000000000000000000000000000 (size!9979 _keys!1541)))))

(assert (=> d!71899 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221176)))

(declare-fun b!361223 () Bool)

(assert (=> b!361223 (= e!221175 call!27172)))

(declare-fun b!361224 () Bool)

(assert (=> b!361224 (= e!221176 e!221175)))

(declare-fun c!53721 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361224 (= c!53721 (validKeyInArray!0 (select (arr!9627 _keys!1541) #b00000000000000000000000000000000)))))

(assert (= (and d!71899 (not res!200943)) b!361224))

(assert (= (and b!361224 c!53721) b!361221))

(assert (= (and b!361224 (not c!53721)) b!361223))

(assert (= (and b!361221 res!200942) b!361222))

(assert (= (or b!361222 b!361223) bm!27169))

(declare-fun m!358129 () Bool)

(assert (=> bm!27169 m!358129))

(declare-fun m!358131 () Bool)

(assert (=> b!361221 m!358131))

(declare-fun m!358133 () Bool)

(assert (=> b!361221 m!358133))

(declare-fun m!358135 () Bool)

(assert (=> b!361221 m!358135))

(assert (=> b!361221 m!358131))

(declare-fun m!358137 () Bool)

(assert (=> b!361221 m!358137))

(assert (=> b!361224 m!358131))

(assert (=> b!361224 m!358131))

(declare-fun m!358139 () Bool)

(assert (=> b!361224 m!358139))

(assert (=> b!361189 d!71899))

(declare-fun d!71901 () Bool)

(assert (=> d!71901 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35938 d!71901))

(declare-fun d!71903 () Bool)

(assert (=> d!71903 (= (array_inv!7078 _values!1277) (bvsge (size!9980 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35938 d!71903))

(declare-fun d!71905 () Bool)

(assert (=> d!71905 (= (array_inv!7079 _keys!1541) (bvsge (size!9979 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35938 d!71905))

(declare-fun b!361231 () Bool)

(declare-fun e!221182 () Bool)

(assert (=> b!361231 (= e!221182 tp_is_empty!8361)))

(declare-fun mapIsEmpty!14064 () Bool)

(declare-fun mapRes!14064 () Bool)

(assert (=> mapIsEmpty!14064 mapRes!14064))

(declare-fun condMapEmpty!14064 () Bool)

(declare-fun mapDefault!14064 () ValueCell!3837)

(assert (=> mapNonEmpty!14058 (= condMapEmpty!14064 (= mapRest!14058 ((as const (Array (_ BitVec 32) ValueCell!3837)) mapDefault!14064)))))

(declare-fun e!221181 () Bool)

(assert (=> mapNonEmpty!14058 (= tp!28134 (and e!221181 mapRes!14064))))

(declare-fun b!361232 () Bool)

(assert (=> b!361232 (= e!221181 tp_is_empty!8361)))

(declare-fun mapNonEmpty!14064 () Bool)

(declare-fun tp!28140 () Bool)

(assert (=> mapNonEmpty!14064 (= mapRes!14064 (and tp!28140 e!221182))))

(declare-fun mapValue!14064 () ValueCell!3837)

(declare-fun mapKey!14064 () (_ BitVec 32))

(declare-fun mapRest!14064 () (Array (_ BitVec 32) ValueCell!3837))

(assert (=> mapNonEmpty!14064 (= mapRest!14058 (store mapRest!14064 mapKey!14064 mapValue!14064))))

(assert (= (and mapNonEmpty!14058 condMapEmpty!14064) mapIsEmpty!14064))

(assert (= (and mapNonEmpty!14058 (not condMapEmpty!14064)) mapNonEmpty!14064))

(assert (= (and mapNonEmpty!14064 ((_ is ValueCellFull!3837) mapValue!14064)) b!361231))

(assert (= (and mapNonEmpty!14058 ((_ is ValueCellFull!3837) mapDefault!14064)) b!361232))

(declare-fun m!358141 () Bool)

(assert (=> mapNonEmpty!14064 m!358141))

(check-sat (not b!361224) (not bm!27169) (not mapNonEmpty!14064) tp_is_empty!8361 (not b!361221))
(check-sat)
