; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35952 () Bool)

(assert start!35952)

(declare-fun b!361065 () Bool)

(declare-fun e!221087 () Bool)

(declare-fun tp_is_empty!8371 () Bool)

(assert (=> b!361065 (= e!221087 tp_is_empty!8371)))

(declare-fun b!361066 () Bool)

(declare-fun e!221086 () Bool)

(declare-fun mapRes!14079 () Bool)

(assert (=> b!361066 (= e!221086 (and e!221087 mapRes!14079))))

(declare-fun condMapEmpty!14079 () Bool)

(declare-datatypes ((V!12139 0))(
  ( (V!12140 (val!4230 Int)) )
))
(declare-datatypes ((ValueCell!3842 0))(
  ( (ValueCellFull!3842 (v!6418 V!12139)) (EmptyCell!3842) )
))
(declare-datatypes ((array!20273 0))(
  ( (array!20274 (arr!9625 (Array (_ BitVec 32) ValueCell!3842)) (size!9978 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20273)

(declare-fun mapDefault!14079 () ValueCell!3842)

(assert (=> b!361066 (= condMapEmpty!14079 (= (arr!9625 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3842)) mapDefault!14079)))))

(declare-fun mapIsEmpty!14079 () Bool)

(assert (=> mapIsEmpty!14079 mapRes!14079))

(declare-fun b!361067 () Bool)

(declare-fun res!200880 () Bool)

(declare-fun e!221085 () Bool)

(assert (=> b!361067 (=> (not res!200880) (not e!221085))))

(declare-datatypes ((array!20275 0))(
  ( (array!20276 (arr!9626 (Array (_ BitVec 32) (_ BitVec 64))) (size!9979 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20275)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20275 (_ BitVec 32)) Bool)

(assert (=> b!361067 (= res!200880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun res!200879 () Bool)

(assert (=> start!35952 (=> (not res!200879) (not e!221085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35952 (= res!200879 (validMask!0 mask!1943))))

(assert (=> start!35952 e!221085))

(assert (=> start!35952 true))

(declare-fun array_inv!7090 (array!20273) Bool)

(assert (=> start!35952 (and (array_inv!7090 _values!1277) e!221086)))

(declare-fun array_inv!7091 (array!20275) Bool)

(assert (=> start!35952 (array_inv!7091 _keys!1541)))

(declare-fun b!361068 () Bool)

(declare-fun e!221090 () Bool)

(assert (=> b!361068 (= e!221085 e!221090)))

(declare-fun res!200876 () Bool)

(assert (=> b!361068 (=> res!200876 e!221090)))

(declare-datatypes ((List!5470 0))(
  ( (Nil!5467) (Cons!5466 (h!6322 (_ BitVec 64)) (t!10611 List!5470)) )
))
(declare-fun contains!2414 (List!5470 (_ BitVec 64)) Bool)

(assert (=> b!361068 (= res!200876 (contains!2414 Nil!5467 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!361069 () Bool)

(declare-fun res!200878 () Bool)

(assert (=> b!361069 (=> (not res!200878) (not e!221085))))

(assert (=> b!361069 (= res!200878 (and (bvsle #b00000000000000000000000000000000 (size!9979 _keys!1541)) (bvslt (size!9979 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361070 () Bool)

(declare-fun e!221088 () Bool)

(assert (=> b!361070 (= e!221088 tp_is_empty!8371)))

(declare-fun b!361071 () Bool)

(assert (=> b!361071 (= e!221090 (contains!2414 Nil!5467 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!14079 () Bool)

(declare-fun tp!28155 () Bool)

(assert (=> mapNonEmpty!14079 (= mapRes!14079 (and tp!28155 e!221088))))

(declare-fun mapRest!14079 () (Array (_ BitVec 32) ValueCell!3842))

(declare-fun mapValue!14079 () ValueCell!3842)

(declare-fun mapKey!14079 () (_ BitVec 32))

(assert (=> mapNonEmpty!14079 (= (arr!9625 _values!1277) (store mapRest!14079 mapKey!14079 mapValue!14079))))

(declare-fun b!361072 () Bool)

(declare-fun res!200875 () Bool)

(assert (=> b!361072 (=> (not res!200875) (not e!221085))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361072 (= res!200875 (and (= (size!9978 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9979 _keys!1541) (size!9978 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361073 () Bool)

(declare-fun res!200877 () Bool)

(assert (=> b!361073 (=> (not res!200877) (not e!221085))))

(declare-fun noDuplicate!184 (List!5470) Bool)

(assert (=> b!361073 (= res!200877 (noDuplicate!184 Nil!5467))))

(assert (= (and start!35952 res!200879) b!361072))

(assert (= (and b!361072 res!200875) b!361067))

(assert (= (and b!361067 res!200880) b!361069))

(assert (= (and b!361069 res!200878) b!361073))

(assert (= (and b!361073 res!200877) b!361068))

(assert (= (and b!361068 (not res!200876)) b!361071))

(assert (= (and b!361066 condMapEmpty!14079) mapIsEmpty!14079))

(assert (= (and b!361066 (not condMapEmpty!14079)) mapNonEmpty!14079))

(get-info :version)

(assert (= (and mapNonEmpty!14079 ((_ is ValueCellFull!3842) mapValue!14079)) b!361070))

(assert (= (and b!361066 ((_ is ValueCellFull!3842) mapDefault!14079)) b!361065))

(assert (= start!35952 b!361066))

(declare-fun m!357467 () Bool)

(assert (=> start!35952 m!357467))

(declare-fun m!357469 () Bool)

(assert (=> start!35952 m!357469))

(declare-fun m!357471 () Bool)

(assert (=> start!35952 m!357471))

(declare-fun m!357473 () Bool)

(assert (=> b!361068 m!357473))

(declare-fun m!357475 () Bool)

(assert (=> b!361071 m!357475))

(declare-fun m!357477 () Bool)

(assert (=> mapNonEmpty!14079 m!357477))

(declare-fun m!357479 () Bool)

(assert (=> b!361073 m!357479))

(declare-fun m!357481 () Bool)

(assert (=> b!361067 m!357481))

(check-sat (not mapNonEmpty!14079) (not start!35952) (not b!361067) (not b!361073) (not b!361068) tp_is_empty!8371 (not b!361071))
(check-sat)
(get-model)

(declare-fun b!361136 () Bool)

(declare-fun e!221134 () Bool)

(declare-fun call!27152 () Bool)

(assert (=> b!361136 (= e!221134 call!27152)))

(declare-fun d!71715 () Bool)

(declare-fun res!200921 () Bool)

(declare-fun e!221133 () Bool)

(assert (=> d!71715 (=> res!200921 e!221133)))

(assert (=> d!71715 (= res!200921 (bvsge #b00000000000000000000000000000000 (size!9979 _keys!1541)))))

(assert (=> d!71715 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221133)))

(declare-fun b!361137 () Bool)

(declare-fun e!221135 () Bool)

(assert (=> b!361137 (= e!221134 e!221135)))

(declare-fun lt!166316 () (_ BitVec 64))

(assert (=> b!361137 (= lt!166316 (select (arr!9626 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11092 0))(
  ( (Unit!11093) )
))
(declare-fun lt!166317 () Unit!11092)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20275 (_ BitVec 64) (_ BitVec 32)) Unit!11092)

(assert (=> b!361137 (= lt!166317 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166316 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361137 (arrayContainsKey!0 _keys!1541 lt!166316 #b00000000000000000000000000000000)))

(declare-fun lt!166318 () Unit!11092)

(assert (=> b!361137 (= lt!166318 lt!166317)))

(declare-fun res!200922 () Bool)

(declare-datatypes ((SeekEntryResult!3490 0))(
  ( (MissingZero!3490 (index!16139 (_ BitVec 32))) (Found!3490 (index!16140 (_ BitVec 32))) (Intermediate!3490 (undefined!4302 Bool) (index!16141 (_ BitVec 32)) (x!36001 (_ BitVec 32))) (Undefined!3490) (MissingVacant!3490 (index!16142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20275 (_ BitVec 32)) SeekEntryResult!3490)

(assert (=> b!361137 (= res!200922 (= (seekEntryOrOpen!0 (select (arr!9626 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3490 #b00000000000000000000000000000000)))))

(assert (=> b!361137 (=> (not res!200922) (not e!221135))))

(declare-fun bm!27149 () Bool)

(assert (=> bm!27149 (= call!27152 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361138 () Bool)

(assert (=> b!361138 (= e!221135 call!27152)))

(declare-fun b!361139 () Bool)

(assert (=> b!361139 (= e!221133 e!221134)))

(declare-fun c!53654 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361139 (= c!53654 (validKeyInArray!0 (select (arr!9626 _keys!1541) #b00000000000000000000000000000000)))))

(assert (= (and d!71715 (not res!200921)) b!361139))

(assert (= (and b!361139 c!53654) b!361137))

(assert (= (and b!361139 (not c!53654)) b!361136))

(assert (= (and b!361137 res!200922) b!361138))

(assert (= (or b!361138 b!361136) bm!27149))

(declare-fun m!357515 () Bool)

(assert (=> b!361137 m!357515))

(declare-fun m!357517 () Bool)

(assert (=> b!361137 m!357517))

(declare-fun m!357519 () Bool)

(assert (=> b!361137 m!357519))

(assert (=> b!361137 m!357515))

(declare-fun m!357521 () Bool)

(assert (=> b!361137 m!357521))

(declare-fun m!357523 () Bool)

(assert (=> bm!27149 m!357523))

(assert (=> b!361139 m!357515))

(assert (=> b!361139 m!357515))

(declare-fun m!357525 () Bool)

(assert (=> b!361139 m!357525))

(assert (=> b!361067 d!71715))

(declare-fun d!71717 () Bool)

(declare-fun lt!166321 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!199 (List!5470) (InoxSet (_ BitVec 64)))

(assert (=> d!71717 (= lt!166321 (select (content!199 Nil!5467) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!221140 () Bool)

(assert (=> d!71717 (= lt!166321 e!221140)))

(declare-fun res!200927 () Bool)

(assert (=> d!71717 (=> (not res!200927) (not e!221140))))

(assert (=> d!71717 (= res!200927 ((_ is Cons!5466) Nil!5467))))

(assert (=> d!71717 (= (contains!2414 Nil!5467 #b1000000000000000000000000000000000000000000000000000000000000000) lt!166321)))

(declare-fun b!361144 () Bool)

(declare-fun e!221141 () Bool)

(assert (=> b!361144 (= e!221140 e!221141)))

(declare-fun res!200928 () Bool)

(assert (=> b!361144 (=> res!200928 e!221141)))

(assert (=> b!361144 (= res!200928 (= (h!6322 Nil!5467) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!361145 () Bool)

(assert (=> b!361145 (= e!221141 (contains!2414 (t!10611 Nil!5467) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71717 res!200927) b!361144))

(assert (= (and b!361144 (not res!200928)) b!361145))

(declare-fun m!357527 () Bool)

(assert (=> d!71717 m!357527))

(declare-fun m!357529 () Bool)

(assert (=> d!71717 m!357529))

(declare-fun m!357531 () Bool)

(assert (=> b!361145 m!357531))

(assert (=> b!361071 d!71717))

(declare-fun d!71719 () Bool)

(declare-fun res!200933 () Bool)

(declare-fun e!221146 () Bool)

(assert (=> d!71719 (=> res!200933 e!221146)))

(assert (=> d!71719 (= res!200933 ((_ is Nil!5467) Nil!5467))))

(assert (=> d!71719 (= (noDuplicate!184 Nil!5467) e!221146)))

(declare-fun b!361150 () Bool)

(declare-fun e!221147 () Bool)

(assert (=> b!361150 (= e!221146 e!221147)))

(declare-fun res!200934 () Bool)

(assert (=> b!361150 (=> (not res!200934) (not e!221147))))

(assert (=> b!361150 (= res!200934 (not (contains!2414 (t!10611 Nil!5467) (h!6322 Nil!5467))))))

(declare-fun b!361151 () Bool)

(assert (=> b!361151 (= e!221147 (noDuplicate!184 (t!10611 Nil!5467)))))

(assert (= (and d!71719 (not res!200933)) b!361150))

(assert (= (and b!361150 res!200934) b!361151))

(declare-fun m!357533 () Bool)

(assert (=> b!361150 m!357533))

(declare-fun m!357535 () Bool)

(assert (=> b!361151 m!357535))

(assert (=> b!361073 d!71719))

(declare-fun d!71721 () Bool)

(declare-fun lt!166322 () Bool)

(assert (=> d!71721 (= lt!166322 (select (content!199 Nil!5467) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!221148 () Bool)

(assert (=> d!71721 (= lt!166322 e!221148)))

(declare-fun res!200935 () Bool)

(assert (=> d!71721 (=> (not res!200935) (not e!221148))))

(assert (=> d!71721 (= res!200935 ((_ is Cons!5466) Nil!5467))))

(assert (=> d!71721 (= (contains!2414 Nil!5467 #b0000000000000000000000000000000000000000000000000000000000000000) lt!166322)))

(declare-fun b!361152 () Bool)

(declare-fun e!221149 () Bool)

(assert (=> b!361152 (= e!221148 e!221149)))

(declare-fun res!200936 () Bool)

(assert (=> b!361152 (=> res!200936 e!221149)))

(assert (=> b!361152 (= res!200936 (= (h!6322 Nil!5467) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!361153 () Bool)

(assert (=> b!361153 (= e!221149 (contains!2414 (t!10611 Nil!5467) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71721 res!200935) b!361152))

(assert (= (and b!361152 (not res!200936)) b!361153))

(assert (=> d!71721 m!357527))

(declare-fun m!357537 () Bool)

(assert (=> d!71721 m!357537))

(declare-fun m!357539 () Bool)

(assert (=> b!361153 m!357539))

(assert (=> b!361068 d!71721))

(declare-fun d!71723 () Bool)

(assert (=> d!71723 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35952 d!71723))

(declare-fun d!71725 () Bool)

(assert (=> d!71725 (= (array_inv!7090 _values!1277) (bvsge (size!9978 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35952 d!71725))

(declare-fun d!71727 () Bool)

(assert (=> d!71727 (= (array_inv!7091 _keys!1541) (bvsge (size!9979 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35952 d!71727))

(declare-fun mapIsEmpty!14088 () Bool)

(declare-fun mapRes!14088 () Bool)

(assert (=> mapIsEmpty!14088 mapRes!14088))

(declare-fun mapNonEmpty!14088 () Bool)

(declare-fun tp!28164 () Bool)

(declare-fun e!221154 () Bool)

(assert (=> mapNonEmpty!14088 (= mapRes!14088 (and tp!28164 e!221154))))

(declare-fun mapKey!14088 () (_ BitVec 32))

(declare-fun mapValue!14088 () ValueCell!3842)

(declare-fun mapRest!14088 () (Array (_ BitVec 32) ValueCell!3842))

(assert (=> mapNonEmpty!14088 (= mapRest!14079 (store mapRest!14088 mapKey!14088 mapValue!14088))))

(declare-fun condMapEmpty!14088 () Bool)

(declare-fun mapDefault!14088 () ValueCell!3842)

(assert (=> mapNonEmpty!14079 (= condMapEmpty!14088 (= mapRest!14079 ((as const (Array (_ BitVec 32) ValueCell!3842)) mapDefault!14088)))))

(declare-fun e!221155 () Bool)

(assert (=> mapNonEmpty!14079 (= tp!28155 (and e!221155 mapRes!14088))))

(declare-fun b!361160 () Bool)

(assert (=> b!361160 (= e!221154 tp_is_empty!8371)))

(declare-fun b!361161 () Bool)

(assert (=> b!361161 (= e!221155 tp_is_empty!8371)))

(assert (= (and mapNonEmpty!14079 condMapEmpty!14088) mapIsEmpty!14088))

(assert (= (and mapNonEmpty!14079 (not condMapEmpty!14088)) mapNonEmpty!14088))

(assert (= (and mapNonEmpty!14088 ((_ is ValueCellFull!3842) mapValue!14088)) b!361160))

(assert (= (and mapNonEmpty!14079 ((_ is ValueCellFull!3842) mapDefault!14088)) b!361161))

(declare-fun m!357541 () Bool)

(assert (=> mapNonEmpty!14088 m!357541))

(check-sat (not mapNonEmpty!14088) (not bm!27149) (not b!361150) (not d!71717) (not b!361137) tp_is_empty!8371 (not d!71721) (not b!361145) (not b!361153) (not b!361151) (not b!361139))
(check-sat)
