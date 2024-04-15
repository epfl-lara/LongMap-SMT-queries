; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36672 () Bool)

(assert start!36672)

(declare-fun b!365964 () Bool)

(declare-fun e!224074 () Bool)

(declare-fun e!224072 () Bool)

(declare-fun mapRes!14319 () Bool)

(assert (=> b!365964 (= e!224074 (and e!224072 mapRes!14319))))

(declare-fun condMapEmpty!14319 () Bool)

(declare-datatypes ((V!12451 0))(
  ( (V!12452 (val!4299 Int)) )
))
(declare-datatypes ((ValueCell!3911 0))(
  ( (ValueCellFull!3911 (v!6489 V!12451)) (EmptyCell!3911) )
))
(declare-datatypes ((array!20957 0))(
  ( (array!20958 (arr!9950 (Array (_ BitVec 32) ValueCell!3911)) (size!10303 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20957)

(declare-fun mapDefault!14319 () ValueCell!3911)

(assert (=> b!365964 (= condMapEmpty!14319 (= (arr!9950 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3911)) mapDefault!14319)))))

(declare-fun b!365965 () Bool)

(declare-fun tp_is_empty!8509 () Bool)

(assert (=> b!365965 (= e!224072 tp_is_empty!8509)))

(declare-fun b!365966 () Bool)

(declare-fun res!204711 () Bool)

(declare-fun e!224073 () Bool)

(assert (=> b!365966 (=> (not res!204711) (not e!224073))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-datatypes ((array!20959 0))(
  ( (array!20960 (arr!9951 (Array (_ BitVec 32) (_ BitVec 64))) (size!10304 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20959)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20959 (_ BitVec 32)) Bool)

(assert (=> b!365966 (= res!204711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20960 (store (arr!9951 _keys!658) i!548 k0!778) (size!10304 _keys!658)) mask!970))))

(declare-fun b!365967 () Bool)

(declare-fun res!204703 () Bool)

(assert (=> b!365967 (=> (not res!204703) (not e!224073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365967 (= res!204703 (validKeyInArray!0 k0!778))))

(declare-fun b!365968 () Bool)

(declare-fun res!204704 () Bool)

(assert (=> b!365968 (=> (not res!204704) (not e!224073))))

(declare-datatypes ((List!5510 0))(
  ( (Nil!5507) (Cons!5506 (h!6362 (_ BitVec 64)) (t!10651 List!5510)) )
))
(declare-fun arrayNoDuplicates!0 (array!20959 (_ BitVec 32) List!5510) Bool)

(assert (=> b!365968 (= res!204704 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5507))))

(declare-fun b!365969 () Bool)

(declare-fun res!204708 () Bool)

(assert (=> b!365969 (=> (not res!204708) (not e!224073))))

(assert (=> b!365969 (= res!204708 (or (= (select (arr!9951 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9951 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14319 () Bool)

(assert (=> mapIsEmpty!14319 mapRes!14319))

(declare-fun b!365970 () Bool)

(declare-fun e!224076 () Bool)

(assert (=> b!365970 (= e!224076 tp_is_empty!8509)))

(declare-fun b!365971 () Bool)

(declare-fun res!204710 () Bool)

(assert (=> b!365971 (=> (not res!204710) (not e!224073))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365971 (= res!204710 (and (= (size!10303 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10304 _keys!658) (size!10303 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365972 () Bool)

(assert (=> b!365972 (= e!224073 (and (bvsle #b00000000000000000000000000000000 (size!10304 _keys!658)) (bvsge (size!10304 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!365973 () Bool)

(declare-fun res!204706 () Bool)

(assert (=> b!365973 (=> (not res!204706) (not e!224073))))

(assert (=> b!365973 (= res!204706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365974 () Bool)

(declare-fun res!204705 () Bool)

(assert (=> b!365974 (=> (not res!204705) (not e!224073))))

(assert (=> b!365974 (= res!204705 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10304 _keys!658))))))

(declare-fun res!204707 () Bool)

(assert (=> start!36672 (=> (not res!204707) (not e!224073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36672 (= res!204707 (validMask!0 mask!970))))

(assert (=> start!36672 e!224073))

(assert (=> start!36672 true))

(declare-fun array_inv!7376 (array!20957) Bool)

(assert (=> start!36672 (and (array_inv!7376 _values!506) e!224074)))

(declare-fun array_inv!7377 (array!20959) Bool)

(assert (=> start!36672 (array_inv!7377 _keys!658)))

(declare-fun mapNonEmpty!14319 () Bool)

(declare-fun tp!28395 () Bool)

(assert (=> mapNonEmpty!14319 (= mapRes!14319 (and tp!28395 e!224076))))

(declare-fun mapValue!14319 () ValueCell!3911)

(declare-fun mapRest!14319 () (Array (_ BitVec 32) ValueCell!3911))

(declare-fun mapKey!14319 () (_ BitVec 32))

(assert (=> mapNonEmpty!14319 (= (arr!9950 _values!506) (store mapRest!14319 mapKey!14319 mapValue!14319))))

(declare-fun b!365975 () Bool)

(declare-fun res!204709 () Bool)

(assert (=> b!365975 (=> (not res!204709) (not e!224073))))

(declare-fun arrayContainsKey!0 (array!20959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365975 (= res!204709 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!36672 res!204707) b!365971))

(assert (= (and b!365971 res!204710) b!365973))

(assert (= (and b!365973 res!204706) b!365968))

(assert (= (and b!365968 res!204704) b!365974))

(assert (= (and b!365974 res!204705) b!365967))

(assert (= (and b!365967 res!204703) b!365969))

(assert (= (and b!365969 res!204708) b!365975))

(assert (= (and b!365975 res!204709) b!365966))

(assert (= (and b!365966 res!204711) b!365972))

(assert (= (and b!365964 condMapEmpty!14319) mapIsEmpty!14319))

(assert (= (and b!365964 (not condMapEmpty!14319)) mapNonEmpty!14319))

(get-info :version)

(assert (= (and mapNonEmpty!14319 ((_ is ValueCellFull!3911) mapValue!14319)) b!365970))

(assert (= (and b!365964 ((_ is ValueCellFull!3911) mapDefault!14319)) b!365965))

(assert (= start!36672 b!365964))

(declare-fun m!362903 () Bool)

(assert (=> mapNonEmpty!14319 m!362903))

(declare-fun m!362905 () Bool)

(assert (=> b!365975 m!362905))

(declare-fun m!362907 () Bool)

(assert (=> b!365968 m!362907))

(declare-fun m!362909 () Bool)

(assert (=> start!36672 m!362909))

(declare-fun m!362911 () Bool)

(assert (=> start!36672 m!362911))

(declare-fun m!362913 () Bool)

(assert (=> start!36672 m!362913))

(declare-fun m!362915 () Bool)

(assert (=> b!365969 m!362915))

(declare-fun m!362917 () Bool)

(assert (=> b!365973 m!362917))

(declare-fun m!362919 () Bool)

(assert (=> b!365967 m!362919))

(declare-fun m!362921 () Bool)

(assert (=> b!365966 m!362921))

(declare-fun m!362923 () Bool)

(assert (=> b!365966 m!362923))

(check-sat (not b!365966) (not b!365968) (not b!365967) (not start!36672) (not b!365973) tp_is_empty!8509 (not b!365975) (not mapNonEmpty!14319))
(check-sat)
(get-model)

(declare-fun b!366056 () Bool)

(declare-fun e!224113 () Bool)

(declare-fun call!27265 () Bool)

(assert (=> b!366056 (= e!224113 call!27265)))

(declare-fun b!366057 () Bool)

(declare-fun e!224114 () Bool)

(assert (=> b!366057 (= e!224113 e!224114)))

(declare-fun lt!168997 () (_ BitVec 64))

(assert (=> b!366057 (= lt!168997 (select (arr!9951 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11370 0))(
  ( (Unit!11371) )
))
(declare-fun lt!168998 () Unit!11370)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20959 (_ BitVec 64) (_ BitVec 32)) Unit!11370)

(assert (=> b!366057 (= lt!168998 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!168997 #b00000000000000000000000000000000))))

(assert (=> b!366057 (arrayContainsKey!0 _keys!658 lt!168997 #b00000000000000000000000000000000)))

(declare-fun lt!168996 () Unit!11370)

(assert (=> b!366057 (= lt!168996 lt!168998)))

(declare-fun res!204771 () Bool)

(declare-datatypes ((SeekEntryResult!3500 0))(
  ( (MissingZero!3500 (index!16179 (_ BitVec 32))) (Found!3500 (index!16180 (_ BitVec 32))) (Intermediate!3500 (undefined!4312 Bool) (index!16181 (_ BitVec 32)) (x!36729 (_ BitVec 32))) (Undefined!3500) (MissingVacant!3500 (index!16182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20959 (_ BitVec 32)) SeekEntryResult!3500)

(assert (=> b!366057 (= res!204771 (= (seekEntryOrOpen!0 (select (arr!9951 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3500 #b00000000000000000000000000000000)))))

(assert (=> b!366057 (=> (not res!204771) (not e!224114))))

(declare-fun b!366058 () Bool)

(assert (=> b!366058 (= e!224114 call!27265)))

(declare-fun b!366059 () Bool)

(declare-fun e!224115 () Bool)

(assert (=> b!366059 (= e!224115 e!224113)))

(declare-fun c!53835 () Bool)

(assert (=> b!366059 (= c!53835 (validKeyInArray!0 (select (arr!9951 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72183 () Bool)

(declare-fun res!204770 () Bool)

(assert (=> d!72183 (=> res!204770 e!224115)))

(assert (=> d!72183 (= res!204770 (bvsge #b00000000000000000000000000000000 (size!10304 _keys!658)))))

(assert (=> d!72183 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!224115)))

(declare-fun bm!27262 () Bool)

(assert (=> bm!27262 (= call!27265 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(assert (= (and d!72183 (not res!204770)) b!366059))

(assert (= (and b!366059 c!53835) b!366057))

(assert (= (and b!366059 (not c!53835)) b!366056))

(assert (= (and b!366057 res!204771) b!366058))

(assert (= (or b!366058 b!366056) bm!27262))

(declare-fun m!362969 () Bool)

(assert (=> b!366057 m!362969))

(declare-fun m!362971 () Bool)

(assert (=> b!366057 m!362971))

(declare-fun m!362973 () Bool)

(assert (=> b!366057 m!362973))

(assert (=> b!366057 m!362969))

(declare-fun m!362975 () Bool)

(assert (=> b!366057 m!362975))

(assert (=> b!366059 m!362969))

(assert (=> b!366059 m!362969))

(declare-fun m!362977 () Bool)

(assert (=> b!366059 m!362977))

(declare-fun m!362979 () Bool)

(assert (=> bm!27262 m!362979))

(assert (=> b!365973 d!72183))

(declare-fun d!72185 () Bool)

(assert (=> d!72185 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!365967 d!72185))

(declare-fun d!72187 () Bool)

(declare-fun res!204776 () Bool)

(declare-fun e!224120 () Bool)

(assert (=> d!72187 (=> res!204776 e!224120)))

(assert (=> d!72187 (= res!204776 (= (select (arr!9951 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72187 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!224120)))

(declare-fun b!366064 () Bool)

(declare-fun e!224121 () Bool)

(assert (=> b!366064 (= e!224120 e!224121)))

(declare-fun res!204777 () Bool)

(assert (=> b!366064 (=> (not res!204777) (not e!224121))))

(assert (=> b!366064 (= res!204777 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!10304 _keys!658)))))

(declare-fun b!366065 () Bool)

(assert (=> b!366065 (= e!224121 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72187 (not res!204776)) b!366064))

(assert (= (and b!366064 res!204777) b!366065))

(assert (=> d!72187 m!362969))

(declare-fun m!362981 () Bool)

(assert (=> b!366065 m!362981))

(assert (=> b!365975 d!72187))

(declare-fun b!366066 () Bool)

(declare-fun e!224122 () Bool)

(declare-fun call!27266 () Bool)

(assert (=> b!366066 (= e!224122 call!27266)))

(declare-fun b!366067 () Bool)

(declare-fun e!224123 () Bool)

(assert (=> b!366067 (= e!224122 e!224123)))

(declare-fun lt!169000 () (_ BitVec 64))

(assert (=> b!366067 (= lt!169000 (select (arr!9951 (array!20960 (store (arr!9951 _keys!658) i!548 k0!778) (size!10304 _keys!658))) #b00000000000000000000000000000000))))

(declare-fun lt!169001 () Unit!11370)

(assert (=> b!366067 (= lt!169001 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20960 (store (arr!9951 _keys!658) i!548 k0!778) (size!10304 _keys!658)) lt!169000 #b00000000000000000000000000000000))))

(assert (=> b!366067 (arrayContainsKey!0 (array!20960 (store (arr!9951 _keys!658) i!548 k0!778) (size!10304 _keys!658)) lt!169000 #b00000000000000000000000000000000)))

(declare-fun lt!168999 () Unit!11370)

(assert (=> b!366067 (= lt!168999 lt!169001)))

(declare-fun res!204779 () Bool)

(assert (=> b!366067 (= res!204779 (= (seekEntryOrOpen!0 (select (arr!9951 (array!20960 (store (arr!9951 _keys!658) i!548 k0!778) (size!10304 _keys!658))) #b00000000000000000000000000000000) (array!20960 (store (arr!9951 _keys!658) i!548 k0!778) (size!10304 _keys!658)) mask!970) (Found!3500 #b00000000000000000000000000000000)))))

(assert (=> b!366067 (=> (not res!204779) (not e!224123))))

(declare-fun b!366068 () Bool)

(assert (=> b!366068 (= e!224123 call!27266)))

(declare-fun b!366069 () Bool)

(declare-fun e!224124 () Bool)

(assert (=> b!366069 (= e!224124 e!224122)))

(declare-fun c!53836 () Bool)

(assert (=> b!366069 (= c!53836 (validKeyInArray!0 (select (arr!9951 (array!20960 (store (arr!9951 _keys!658) i!548 k0!778) (size!10304 _keys!658))) #b00000000000000000000000000000000)))))

(declare-fun d!72189 () Bool)

(declare-fun res!204778 () Bool)

(assert (=> d!72189 (=> res!204778 e!224124)))

(assert (=> d!72189 (= res!204778 (bvsge #b00000000000000000000000000000000 (size!10304 (array!20960 (store (arr!9951 _keys!658) i!548 k0!778) (size!10304 _keys!658)))))))

(assert (=> d!72189 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20960 (store (arr!9951 _keys!658) i!548 k0!778) (size!10304 _keys!658)) mask!970) e!224124)))

(declare-fun bm!27263 () Bool)

(assert (=> bm!27263 (= call!27266 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!20960 (store (arr!9951 _keys!658) i!548 k0!778) (size!10304 _keys!658)) mask!970))))

(assert (= (and d!72189 (not res!204778)) b!366069))

(assert (= (and b!366069 c!53836) b!366067))

(assert (= (and b!366069 (not c!53836)) b!366066))

(assert (= (and b!366067 res!204779) b!366068))

(assert (= (or b!366068 b!366066) bm!27263))

(declare-fun m!362983 () Bool)

(assert (=> b!366067 m!362983))

(declare-fun m!362985 () Bool)

(assert (=> b!366067 m!362985))

(declare-fun m!362987 () Bool)

(assert (=> b!366067 m!362987))

(assert (=> b!366067 m!362983))

(declare-fun m!362989 () Bool)

(assert (=> b!366067 m!362989))

(assert (=> b!366069 m!362983))

(assert (=> b!366069 m!362983))

(declare-fun m!362991 () Bool)

(assert (=> b!366069 m!362991))

(declare-fun m!362993 () Bool)

(assert (=> bm!27263 m!362993))

(assert (=> b!365966 d!72189))

(declare-fun d!72191 () Bool)

(assert (=> d!72191 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36672 d!72191))

(declare-fun d!72193 () Bool)

(assert (=> d!72193 (= (array_inv!7376 _values!506) (bvsge (size!10303 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36672 d!72193))

(declare-fun d!72195 () Bool)

(assert (=> d!72195 (= (array_inv!7377 _keys!658) (bvsge (size!10304 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36672 d!72195))

(declare-fun bm!27266 () Bool)

(declare-fun call!27269 () Bool)

(declare-fun c!53839 () Bool)

(assert (=> bm!27266 (= call!27269 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53839 (Cons!5506 (select (arr!9951 _keys!658) #b00000000000000000000000000000000) Nil!5507) Nil!5507)))))

(declare-fun b!366080 () Bool)

(declare-fun e!224134 () Bool)

(declare-fun contains!2425 (List!5510 (_ BitVec 64)) Bool)

(assert (=> b!366080 (= e!224134 (contains!2425 Nil!5507 (select (arr!9951 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366081 () Bool)

(declare-fun e!224135 () Bool)

(assert (=> b!366081 (= e!224135 call!27269)))

(declare-fun b!366083 () Bool)

(declare-fun e!224136 () Bool)

(assert (=> b!366083 (= e!224136 e!224135)))

(assert (=> b!366083 (= c!53839 (validKeyInArray!0 (select (arr!9951 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366084 () Bool)

(declare-fun e!224133 () Bool)

(assert (=> b!366084 (= e!224133 e!224136)))

(declare-fun res!204788 () Bool)

(assert (=> b!366084 (=> (not res!204788) (not e!224136))))

(assert (=> b!366084 (= res!204788 (not e!224134))))

(declare-fun res!204786 () Bool)

(assert (=> b!366084 (=> (not res!204786) (not e!224134))))

(assert (=> b!366084 (= res!204786 (validKeyInArray!0 (select (arr!9951 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!366082 () Bool)

(assert (=> b!366082 (= e!224135 call!27269)))

(declare-fun d!72197 () Bool)

(declare-fun res!204787 () Bool)

(assert (=> d!72197 (=> res!204787 e!224133)))

(assert (=> d!72197 (= res!204787 (bvsge #b00000000000000000000000000000000 (size!10304 _keys!658)))))

(assert (=> d!72197 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5507) e!224133)))

(assert (= (and d!72197 (not res!204787)) b!366084))

(assert (= (and b!366084 res!204786) b!366080))

(assert (= (and b!366084 res!204788) b!366083))

(assert (= (and b!366083 c!53839) b!366082))

(assert (= (and b!366083 (not c!53839)) b!366081))

(assert (= (or b!366082 b!366081) bm!27266))

(assert (=> bm!27266 m!362969))

(declare-fun m!362995 () Bool)

(assert (=> bm!27266 m!362995))

(assert (=> b!366080 m!362969))

(assert (=> b!366080 m!362969))

(declare-fun m!362997 () Bool)

(assert (=> b!366080 m!362997))

(assert (=> b!366083 m!362969))

(assert (=> b!366083 m!362969))

(assert (=> b!366083 m!362977))

(assert (=> b!366084 m!362969))

(assert (=> b!366084 m!362969))

(assert (=> b!366084 m!362977))

(assert (=> b!365968 d!72197))

(declare-fun mapNonEmpty!14328 () Bool)

(declare-fun mapRes!14328 () Bool)

(declare-fun tp!28404 () Bool)

(declare-fun e!224141 () Bool)

(assert (=> mapNonEmpty!14328 (= mapRes!14328 (and tp!28404 e!224141))))

(declare-fun mapRest!14328 () (Array (_ BitVec 32) ValueCell!3911))

(declare-fun mapValue!14328 () ValueCell!3911)

(declare-fun mapKey!14328 () (_ BitVec 32))

(assert (=> mapNonEmpty!14328 (= mapRest!14319 (store mapRest!14328 mapKey!14328 mapValue!14328))))

(declare-fun condMapEmpty!14328 () Bool)

(declare-fun mapDefault!14328 () ValueCell!3911)

(assert (=> mapNonEmpty!14319 (= condMapEmpty!14328 (= mapRest!14319 ((as const (Array (_ BitVec 32) ValueCell!3911)) mapDefault!14328)))))

(declare-fun e!224142 () Bool)

(assert (=> mapNonEmpty!14319 (= tp!28395 (and e!224142 mapRes!14328))))

(declare-fun b!366092 () Bool)

(assert (=> b!366092 (= e!224142 tp_is_empty!8509)))

(declare-fun b!366091 () Bool)

(assert (=> b!366091 (= e!224141 tp_is_empty!8509)))

(declare-fun mapIsEmpty!14328 () Bool)

(assert (=> mapIsEmpty!14328 mapRes!14328))

(assert (= (and mapNonEmpty!14319 condMapEmpty!14328) mapIsEmpty!14328))

(assert (= (and mapNonEmpty!14319 (not condMapEmpty!14328)) mapNonEmpty!14328))

(assert (= (and mapNonEmpty!14328 ((_ is ValueCellFull!3911) mapValue!14328)) b!366091))

(assert (= (and mapNonEmpty!14319 ((_ is ValueCellFull!3911) mapDefault!14328)) b!366092))

(declare-fun m!362999 () Bool)

(assert (=> mapNonEmpty!14328 m!362999))

(check-sat (not b!366080) (not b!366069) (not b!366067) (not b!366059) (not b!366084) (not b!366065) (not bm!27262) (not bm!27263) (not bm!27266) (not b!366057) (not b!366083) (not mapNonEmpty!14328) tp_is_empty!8509)
(check-sat)
