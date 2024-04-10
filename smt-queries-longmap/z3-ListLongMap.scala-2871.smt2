; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41336 () Bool)

(assert start!41336)

(declare-fun b!462157 () Bool)

(declare-fun res!276418 () Bool)

(declare-fun e!269618 () Bool)

(assert (=> b!462157 (=> (not res!276418) (not e!269618))))

(declare-datatypes ((array!28731 0))(
  ( (array!28732 (arr!13800 (Array (_ BitVec 32) (_ BitVec 64))) (size!14152 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28731)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28731 (_ BitVec 32)) Bool)

(assert (=> b!462157 (= res!276418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462158 () Bool)

(declare-fun res!276415 () Bool)

(assert (=> b!462158 (=> (not res!276415) (not e!269618))))

(assert (=> b!462158 (= res!276415 (and (bvsle #b00000000000000000000000000000000 (size!14152 _keys!1025)) (bvslt (size!14152 _keys!1025) #b01111111111111111111111111111111)))))

(declare-fun b!462159 () Bool)

(declare-fun res!276417 () Bool)

(assert (=> b!462159 (=> (not res!276417) (not e!269618))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!17725 0))(
  ( (V!17726 (val!6277 Int)) )
))
(declare-datatypes ((ValueCell!5889 0))(
  ( (ValueCellFull!5889 (v!8563 V!17725)) (EmptyCell!5889) )
))
(declare-datatypes ((array!28733 0))(
  ( (array!28734 (arr!13801 (Array (_ BitVec 32) ValueCell!5889)) (size!14153 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28733)

(assert (=> b!462159 (= res!276417 (and (= (size!14153 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14152 _keys!1025) (size!14153 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20365 () Bool)

(declare-fun mapRes!20365 () Bool)

(declare-fun tp!39184 () Bool)

(declare-fun e!269616 () Bool)

(assert (=> mapNonEmpty!20365 (= mapRes!20365 (and tp!39184 e!269616))))

(declare-fun mapKey!20365 () (_ BitVec 32))

(declare-fun mapValue!20365 () ValueCell!5889)

(declare-fun mapRest!20365 () (Array (_ BitVec 32) ValueCell!5889))

(assert (=> mapNonEmpty!20365 (= (arr!13801 _values!833) (store mapRest!20365 mapKey!20365 mapValue!20365))))

(declare-fun b!462160 () Bool)

(declare-fun e!269619 () Bool)

(declare-fun tp_is_empty!12465 () Bool)

(assert (=> b!462160 (= e!269619 tp_is_empty!12465)))

(declare-fun b!462162 () Bool)

(declare-fun res!276420 () Bool)

(assert (=> b!462162 (=> (not res!276420) (not e!269618))))

(declare-datatypes ((List!8334 0))(
  ( (Nil!8331) (Cons!8330 (h!9186 (_ BitVec 64)) (t!14278 List!8334)) )
))
(declare-fun noDuplicate!202 (List!8334) Bool)

(assert (=> b!462162 (= res!276420 (noDuplicate!202 Nil!8331))))

(declare-fun b!462163 () Bool)

(assert (=> b!462163 (= e!269616 tp_is_empty!12465)))

(declare-fun mapIsEmpty!20365 () Bool)

(assert (=> mapIsEmpty!20365 mapRes!20365))

(declare-fun b!462164 () Bool)

(declare-fun e!269615 () Bool)

(assert (=> b!462164 (= e!269615 (and e!269619 mapRes!20365))))

(declare-fun condMapEmpty!20365 () Bool)

(declare-fun mapDefault!20365 () ValueCell!5889)

(assert (=> b!462164 (= condMapEmpty!20365 (= (arr!13801 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5889)) mapDefault!20365)))))

(declare-fun b!462165 () Bool)

(declare-fun e!269617 () Bool)

(declare-fun contains!2516 (List!8334 (_ BitVec 64)) Bool)

(assert (=> b!462165 (= e!269617 (contains!2516 Nil!8331 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!462161 () Bool)

(assert (=> b!462161 (= e!269618 e!269617)))

(declare-fun res!276416 () Bool)

(assert (=> b!462161 (=> res!276416 e!269617)))

(assert (=> b!462161 (= res!276416 (contains!2516 Nil!8331 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!276419 () Bool)

(assert (=> start!41336 (=> (not res!276419) (not e!269618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41336 (= res!276419 (validMask!0 mask!1365))))

(assert (=> start!41336 e!269618))

(assert (=> start!41336 true))

(declare-fun array_inv!9978 (array!28731) Bool)

(assert (=> start!41336 (array_inv!9978 _keys!1025)))

(declare-fun array_inv!9979 (array!28733) Bool)

(assert (=> start!41336 (and (array_inv!9979 _values!833) e!269615)))

(assert (= (and start!41336 res!276419) b!462159))

(assert (= (and b!462159 res!276417) b!462157))

(assert (= (and b!462157 res!276418) b!462158))

(assert (= (and b!462158 res!276415) b!462162))

(assert (= (and b!462162 res!276420) b!462161))

(assert (= (and b!462161 (not res!276416)) b!462165))

(assert (= (and b!462164 condMapEmpty!20365) mapIsEmpty!20365))

(assert (= (and b!462164 (not condMapEmpty!20365)) mapNonEmpty!20365))

(get-info :version)

(assert (= (and mapNonEmpty!20365 ((_ is ValueCellFull!5889) mapValue!20365)) b!462163))

(assert (= (and b!462164 ((_ is ValueCellFull!5889) mapDefault!20365)) b!462160))

(assert (= start!41336 b!462164))

(declare-fun m!445185 () Bool)

(assert (=> b!462162 m!445185))

(declare-fun m!445187 () Bool)

(assert (=> start!41336 m!445187))

(declare-fun m!445189 () Bool)

(assert (=> start!41336 m!445189))

(declare-fun m!445191 () Bool)

(assert (=> start!41336 m!445191))

(declare-fun m!445193 () Bool)

(assert (=> b!462157 m!445193))

(declare-fun m!445195 () Bool)

(assert (=> b!462161 m!445195))

(declare-fun m!445197 () Bool)

(assert (=> mapNonEmpty!20365 m!445197))

(declare-fun m!445199 () Bool)

(assert (=> b!462165 m!445199))

(check-sat (not start!41336) (not b!462157) (not b!462162) (not b!462161) (not mapNonEmpty!20365) (not b!462165) tp_is_empty!12465)
(check-sat)
(get-model)

(declare-fun d!74943 () Bool)

(declare-fun res!276443 () Bool)

(declare-fun e!269643 () Bool)

(assert (=> d!74943 (=> res!276443 e!269643)))

(assert (=> d!74943 (= res!276443 ((_ is Nil!8331) Nil!8331))))

(assert (=> d!74943 (= (noDuplicate!202 Nil!8331) e!269643)))

(declare-fun b!462197 () Bool)

(declare-fun e!269644 () Bool)

(assert (=> b!462197 (= e!269643 e!269644)))

(declare-fun res!276444 () Bool)

(assert (=> b!462197 (=> (not res!276444) (not e!269644))))

(assert (=> b!462197 (= res!276444 (not (contains!2516 (t!14278 Nil!8331) (h!9186 Nil!8331))))))

(declare-fun b!462198 () Bool)

(assert (=> b!462198 (= e!269644 (noDuplicate!202 (t!14278 Nil!8331)))))

(assert (= (and d!74943 (not res!276443)) b!462197))

(assert (= (and b!462197 res!276444) b!462198))

(declare-fun m!445217 () Bool)

(assert (=> b!462197 m!445217))

(declare-fun m!445219 () Bool)

(assert (=> b!462198 m!445219))

(assert (=> b!462162 d!74943))

(declare-fun d!74945 () Bool)

(assert (=> d!74945 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41336 d!74945))

(declare-fun d!74947 () Bool)

(assert (=> d!74947 (= (array_inv!9978 _keys!1025) (bvsge (size!14152 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41336 d!74947))

(declare-fun d!74949 () Bool)

(assert (=> d!74949 (= (array_inv!9979 _values!833) (bvsge (size!14153 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41336 d!74949))

(declare-fun d!74951 () Bool)

(declare-fun lt!209164 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!205 (List!8334) (InoxSet (_ BitVec 64)))

(assert (=> d!74951 (= lt!209164 (select (content!205 Nil!8331) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!269650 () Bool)

(assert (=> d!74951 (= lt!209164 e!269650)))

(declare-fun res!276449 () Bool)

(assert (=> d!74951 (=> (not res!276449) (not e!269650))))

(assert (=> d!74951 (= res!276449 ((_ is Cons!8330) Nil!8331))))

(assert (=> d!74951 (= (contains!2516 Nil!8331 #b1000000000000000000000000000000000000000000000000000000000000000) lt!209164)))

(declare-fun b!462203 () Bool)

(declare-fun e!269649 () Bool)

(assert (=> b!462203 (= e!269650 e!269649)))

(declare-fun res!276450 () Bool)

(assert (=> b!462203 (=> res!276450 e!269649)))

(assert (=> b!462203 (= res!276450 (= (h!9186 Nil!8331) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!462204 () Bool)

(assert (=> b!462204 (= e!269649 (contains!2516 (t!14278 Nil!8331) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!74951 res!276449) b!462203))

(assert (= (and b!462203 (not res!276450)) b!462204))

(declare-fun m!445221 () Bool)

(assert (=> d!74951 m!445221))

(declare-fun m!445223 () Bool)

(assert (=> d!74951 m!445223))

(declare-fun m!445225 () Bool)

(assert (=> b!462204 m!445225))

(assert (=> b!462165 d!74951))

(declare-fun d!74953 () Bool)

(declare-fun lt!209165 () Bool)

(assert (=> d!74953 (= lt!209165 (select (content!205 Nil!8331) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!269652 () Bool)

(assert (=> d!74953 (= lt!209165 e!269652)))

(declare-fun res!276451 () Bool)

(assert (=> d!74953 (=> (not res!276451) (not e!269652))))

(assert (=> d!74953 (= res!276451 ((_ is Cons!8330) Nil!8331))))

(assert (=> d!74953 (= (contains!2516 Nil!8331 #b0000000000000000000000000000000000000000000000000000000000000000) lt!209165)))

(declare-fun b!462205 () Bool)

(declare-fun e!269651 () Bool)

(assert (=> b!462205 (= e!269652 e!269651)))

(declare-fun res!276452 () Bool)

(assert (=> b!462205 (=> res!276452 e!269651)))

(assert (=> b!462205 (= res!276452 (= (h!9186 Nil!8331) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!462206 () Bool)

(assert (=> b!462206 (= e!269651 (contains!2516 (t!14278 Nil!8331) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!74953 res!276451) b!462205))

(assert (= (and b!462205 (not res!276452)) b!462206))

(assert (=> d!74953 m!445221))

(declare-fun m!445227 () Bool)

(assert (=> d!74953 m!445227))

(declare-fun m!445229 () Bool)

(assert (=> b!462206 m!445229))

(assert (=> b!462161 d!74953))

(declare-fun b!462215 () Bool)

(declare-fun e!269661 () Bool)

(declare-fun e!269659 () Bool)

(assert (=> b!462215 (= e!269661 e!269659)))

(declare-fun lt!209172 () (_ BitVec 64))

(assert (=> b!462215 (= lt!209172 (select (arr!13800 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13444 0))(
  ( (Unit!13445) )
))
(declare-fun lt!209174 () Unit!13444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28731 (_ BitVec 64) (_ BitVec 32)) Unit!13444)

(assert (=> b!462215 (= lt!209174 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209172 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!462215 (arrayContainsKey!0 _keys!1025 lt!209172 #b00000000000000000000000000000000)))

(declare-fun lt!209173 () Unit!13444)

(assert (=> b!462215 (= lt!209173 lt!209174)))

(declare-fun res!276458 () Bool)

(declare-datatypes ((SeekEntryResult!3541 0))(
  ( (MissingZero!3541 (index!16343 (_ BitVec 32))) (Found!3541 (index!16344 (_ BitVec 32))) (Intermediate!3541 (undefined!4353 Bool) (index!16345 (_ BitVec 32)) (x!43085 (_ BitVec 32))) (Undefined!3541) (MissingVacant!3541 (index!16346 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28731 (_ BitVec 32)) SeekEntryResult!3541)

(assert (=> b!462215 (= res!276458 (= (seekEntryOrOpen!0 (select (arr!13800 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3541 #b00000000000000000000000000000000)))))

(assert (=> b!462215 (=> (not res!276458) (not e!269659))))

(declare-fun b!462216 () Bool)

(declare-fun e!269660 () Bool)

(assert (=> b!462216 (= e!269660 e!269661)))

(declare-fun c!56628 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!462216 (= c!56628 (validKeyInArray!0 (select (arr!13800 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30200 () Bool)

(declare-fun call!30203 () Bool)

(assert (=> bm!30200 (= call!30203 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!462217 () Bool)

(assert (=> b!462217 (= e!269659 call!30203)))

(declare-fun d!74955 () Bool)

(declare-fun res!276457 () Bool)

(assert (=> d!74955 (=> res!276457 e!269660)))

(assert (=> d!74955 (= res!276457 (bvsge #b00000000000000000000000000000000 (size!14152 _keys!1025)))))

(assert (=> d!74955 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!269660)))

(declare-fun b!462218 () Bool)

(assert (=> b!462218 (= e!269661 call!30203)))

(assert (= (and d!74955 (not res!276457)) b!462216))

(assert (= (and b!462216 c!56628) b!462215))

(assert (= (and b!462216 (not c!56628)) b!462218))

(assert (= (and b!462215 res!276458) b!462217))

(assert (= (or b!462217 b!462218) bm!30200))

(declare-fun m!445231 () Bool)

(assert (=> b!462215 m!445231))

(declare-fun m!445233 () Bool)

(assert (=> b!462215 m!445233))

(declare-fun m!445235 () Bool)

(assert (=> b!462215 m!445235))

(assert (=> b!462215 m!445231))

(declare-fun m!445237 () Bool)

(assert (=> b!462215 m!445237))

(assert (=> b!462216 m!445231))

(assert (=> b!462216 m!445231))

(declare-fun m!445239 () Bool)

(assert (=> b!462216 m!445239))

(declare-fun m!445241 () Bool)

(assert (=> bm!30200 m!445241))

(assert (=> b!462157 d!74955))

(declare-fun b!462225 () Bool)

(declare-fun e!269666 () Bool)

(assert (=> b!462225 (= e!269666 tp_is_empty!12465)))

(declare-fun condMapEmpty!20371 () Bool)

(declare-fun mapDefault!20371 () ValueCell!5889)

(assert (=> mapNonEmpty!20365 (= condMapEmpty!20371 (= mapRest!20365 ((as const (Array (_ BitVec 32) ValueCell!5889)) mapDefault!20371)))))

(declare-fun e!269667 () Bool)

(declare-fun mapRes!20371 () Bool)

(assert (=> mapNonEmpty!20365 (= tp!39184 (and e!269667 mapRes!20371))))

(declare-fun mapIsEmpty!20371 () Bool)

(assert (=> mapIsEmpty!20371 mapRes!20371))

(declare-fun b!462226 () Bool)

(assert (=> b!462226 (= e!269667 tp_is_empty!12465)))

(declare-fun mapNonEmpty!20371 () Bool)

(declare-fun tp!39190 () Bool)

(assert (=> mapNonEmpty!20371 (= mapRes!20371 (and tp!39190 e!269666))))

(declare-fun mapRest!20371 () (Array (_ BitVec 32) ValueCell!5889))

(declare-fun mapKey!20371 () (_ BitVec 32))

(declare-fun mapValue!20371 () ValueCell!5889)

(assert (=> mapNonEmpty!20371 (= mapRest!20365 (store mapRest!20371 mapKey!20371 mapValue!20371))))

(assert (= (and mapNonEmpty!20365 condMapEmpty!20371) mapIsEmpty!20371))

(assert (= (and mapNonEmpty!20365 (not condMapEmpty!20371)) mapNonEmpty!20371))

(assert (= (and mapNonEmpty!20371 ((_ is ValueCellFull!5889) mapValue!20371)) b!462225))

(assert (= (and mapNonEmpty!20365 ((_ is ValueCellFull!5889) mapDefault!20371)) b!462226))

(declare-fun m!445243 () Bool)

(assert (=> mapNonEmpty!20371 m!445243))

(check-sat (not b!462197) (not mapNonEmpty!20371) (not b!462206) (not d!74951) (not b!462198) (not b!462216) (not d!74953) (not b!462215) (not bm!30200) tp_is_empty!12465 (not b!462204))
(check-sat)
