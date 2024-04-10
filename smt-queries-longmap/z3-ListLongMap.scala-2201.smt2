; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36580 () Bool)

(assert start!36580)

(declare-fun b!365298 () Bool)

(declare-fun e!223667 () Bool)

(declare-fun e!223666 () Bool)

(declare-fun mapRes!14211 () Bool)

(assert (=> b!365298 (= e!223667 (and e!223666 mapRes!14211))))

(declare-fun condMapEmpty!14211 () Bool)

(declare-datatypes ((V!12365 0))(
  ( (V!12366 (val!4267 Int)) )
))
(declare-datatypes ((ValueCell!3879 0))(
  ( (ValueCellFull!3879 (v!6462 V!12365)) (EmptyCell!3879) )
))
(declare-datatypes ((array!20847 0))(
  ( (array!20848 (arr!9899 (Array (_ BitVec 32) ValueCell!3879)) (size!10251 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20847)

(declare-fun mapDefault!14211 () ValueCell!3879)

(assert (=> b!365298 (= condMapEmpty!14211 (= (arr!9899 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3879)) mapDefault!14211)))))

(declare-fun b!365299 () Bool)

(declare-fun tp_is_empty!8445 () Bool)

(assert (=> b!365299 (= e!223666 tp_is_empty!8445)))

(declare-fun b!365301 () Bool)

(declare-fun e!223669 () Bool)

(assert (=> b!365301 (= e!223669 tp_is_empty!8445)))

(declare-fun b!365302 () Bool)

(declare-fun res!204246 () Bool)

(declare-fun e!223668 () Bool)

(assert (=> b!365302 (=> (not res!204246) (not e!223668))))

(declare-datatypes ((array!20849 0))(
  ( (array!20850 (arr!9900 (Array (_ BitVec 32) (_ BitVec 64))) (size!10252 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20849)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20849 (_ BitVec 32)) Bool)

(assert (=> b!365302 (= res!204246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14211 () Bool)

(assert (=> mapIsEmpty!14211 mapRes!14211))

(declare-fun mapNonEmpty!14211 () Bool)

(declare-fun tp!28287 () Bool)

(assert (=> mapNonEmpty!14211 (= mapRes!14211 (and tp!28287 e!223669))))

(declare-fun mapRest!14211 () (Array (_ BitVec 32) ValueCell!3879))

(declare-fun mapValue!14211 () ValueCell!3879)

(declare-fun mapKey!14211 () (_ BitVec 32))

(assert (=> mapNonEmpty!14211 (= (arr!9899 _values!506) (store mapRest!14211 mapKey!14211 mapValue!14211))))

(declare-fun b!365303 () Bool)

(declare-fun res!204247 () Bool)

(assert (=> b!365303 (=> (not res!204247) (not e!223668))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365303 (= res!204247 (and (= (size!10251 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10252 _keys!658) (size!10251 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365300 () Bool)

(assert (=> b!365300 (= e!223668 (and (bvsle #b00000000000000000000000000000000 (size!10252 _keys!658)) (bvsge (size!10252 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun res!204245 () Bool)

(assert (=> start!36580 (=> (not res!204245) (not e!223668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36580 (= res!204245 (validMask!0 mask!970))))

(assert (=> start!36580 e!223668))

(assert (=> start!36580 true))

(declare-fun array_inv!7332 (array!20847) Bool)

(assert (=> start!36580 (and (array_inv!7332 _values!506) e!223667)))

(declare-fun array_inv!7333 (array!20849) Bool)

(assert (=> start!36580 (array_inv!7333 _keys!658)))

(assert (= (and start!36580 res!204245) b!365303))

(assert (= (and b!365303 res!204247) b!365302))

(assert (= (and b!365302 res!204246) b!365300))

(assert (= (and b!365298 condMapEmpty!14211) mapIsEmpty!14211))

(assert (= (and b!365298 (not condMapEmpty!14211)) mapNonEmpty!14211))

(get-info :version)

(assert (= (and mapNonEmpty!14211 ((_ is ValueCellFull!3879) mapValue!14211)) b!365301))

(assert (= (and b!365298 ((_ is ValueCellFull!3879) mapDefault!14211)) b!365299))

(assert (= start!36580 b!365298))

(declare-fun m!363067 () Bool)

(assert (=> b!365302 m!363067))

(declare-fun m!363069 () Bool)

(assert (=> mapNonEmpty!14211 m!363069))

(declare-fun m!363071 () Bool)

(assert (=> start!36580 m!363071))

(declare-fun m!363073 () Bool)

(assert (=> start!36580 m!363073))

(declare-fun m!363075 () Bool)

(assert (=> start!36580 m!363075))

(check-sat (not b!365302) (not start!36580) (not mapNonEmpty!14211) tp_is_empty!8445)
(check-sat)
(get-model)

(declare-fun bm!27272 () Bool)

(declare-fun call!27275 () Bool)

(assert (=> bm!27272 (= call!27275 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!365330 () Bool)

(declare-fun e!223691 () Bool)

(declare-fun e!223693 () Bool)

(assert (=> b!365330 (= e!223691 e!223693)))

(declare-fun lt!169163 () (_ BitVec 64))

(assert (=> b!365330 (= lt!169163 (select (arr!9900 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11384 0))(
  ( (Unit!11385) )
))
(declare-fun lt!169164 () Unit!11384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20849 (_ BitVec 64) (_ BitVec 32)) Unit!11384)

(assert (=> b!365330 (= lt!169164 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169163 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365330 (arrayContainsKey!0 _keys!658 lt!169163 #b00000000000000000000000000000000)))

(declare-fun lt!169165 () Unit!11384)

(assert (=> b!365330 (= lt!169165 lt!169164)))

(declare-fun res!204262 () Bool)

(declare-datatypes ((SeekEntryResult!3501 0))(
  ( (MissingZero!3501 (index!16183 (_ BitVec 32))) (Found!3501 (index!16184 (_ BitVec 32))) (Intermediate!3501 (undefined!4313 Bool) (index!16185 (_ BitVec 32)) (x!36639 (_ BitVec 32))) (Undefined!3501) (MissingVacant!3501 (index!16186 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20849 (_ BitVec 32)) SeekEntryResult!3501)

(assert (=> b!365330 (= res!204262 (= (seekEntryOrOpen!0 (select (arr!9900 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3501 #b00000000000000000000000000000000)))))

(assert (=> b!365330 (=> (not res!204262) (not e!223693))))

(declare-fun b!365331 () Bool)

(declare-fun e!223692 () Bool)

(assert (=> b!365331 (= e!223692 e!223691)))

(declare-fun c!53891 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365331 (= c!53891 (validKeyInArray!0 (select (arr!9900 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72321 () Bool)

(declare-fun res!204261 () Bool)

(assert (=> d!72321 (=> res!204261 e!223692)))

(assert (=> d!72321 (= res!204261 (bvsge #b00000000000000000000000000000000 (size!10252 _keys!658)))))

(assert (=> d!72321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223692)))

(declare-fun b!365332 () Bool)

(assert (=> b!365332 (= e!223691 call!27275)))

(declare-fun b!365333 () Bool)

(assert (=> b!365333 (= e!223693 call!27275)))

(assert (= (and d!72321 (not res!204261)) b!365331))

(assert (= (and b!365331 c!53891) b!365330))

(assert (= (and b!365331 (not c!53891)) b!365332))

(assert (= (and b!365330 res!204262) b!365333))

(assert (= (or b!365333 b!365332) bm!27272))

(declare-fun m!363087 () Bool)

(assert (=> bm!27272 m!363087))

(declare-fun m!363089 () Bool)

(assert (=> b!365330 m!363089))

(declare-fun m!363091 () Bool)

(assert (=> b!365330 m!363091))

(declare-fun m!363093 () Bool)

(assert (=> b!365330 m!363093))

(assert (=> b!365330 m!363089))

(declare-fun m!363095 () Bool)

(assert (=> b!365330 m!363095))

(assert (=> b!365331 m!363089))

(assert (=> b!365331 m!363089))

(declare-fun m!363097 () Bool)

(assert (=> b!365331 m!363097))

(assert (=> b!365302 d!72321))

(declare-fun d!72323 () Bool)

(assert (=> d!72323 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36580 d!72323))

(declare-fun d!72325 () Bool)

(assert (=> d!72325 (= (array_inv!7332 _values!506) (bvsge (size!10251 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36580 d!72325))

(declare-fun d!72327 () Bool)

(assert (=> d!72327 (= (array_inv!7333 _keys!658) (bvsge (size!10252 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36580 d!72327))

(declare-fun condMapEmpty!14217 () Bool)

(declare-fun mapDefault!14217 () ValueCell!3879)

(assert (=> mapNonEmpty!14211 (= condMapEmpty!14217 (= mapRest!14211 ((as const (Array (_ BitVec 32) ValueCell!3879)) mapDefault!14217)))))

(declare-fun e!223699 () Bool)

(declare-fun mapRes!14217 () Bool)

(assert (=> mapNonEmpty!14211 (= tp!28287 (and e!223699 mapRes!14217))))

(declare-fun mapNonEmpty!14217 () Bool)

(declare-fun tp!28293 () Bool)

(declare-fun e!223698 () Bool)

(assert (=> mapNonEmpty!14217 (= mapRes!14217 (and tp!28293 e!223698))))

(declare-fun mapRest!14217 () (Array (_ BitVec 32) ValueCell!3879))

(declare-fun mapValue!14217 () ValueCell!3879)

(declare-fun mapKey!14217 () (_ BitVec 32))

(assert (=> mapNonEmpty!14217 (= mapRest!14211 (store mapRest!14217 mapKey!14217 mapValue!14217))))

(declare-fun b!365341 () Bool)

(assert (=> b!365341 (= e!223699 tp_is_empty!8445)))

(declare-fun b!365340 () Bool)

(assert (=> b!365340 (= e!223698 tp_is_empty!8445)))

(declare-fun mapIsEmpty!14217 () Bool)

(assert (=> mapIsEmpty!14217 mapRes!14217))

(assert (= (and mapNonEmpty!14211 condMapEmpty!14217) mapIsEmpty!14217))

(assert (= (and mapNonEmpty!14211 (not condMapEmpty!14217)) mapNonEmpty!14217))

(assert (= (and mapNonEmpty!14217 ((_ is ValueCellFull!3879) mapValue!14217)) b!365340))

(assert (= (and mapNonEmpty!14211 ((_ is ValueCellFull!3879) mapDefault!14217)) b!365341))

(declare-fun m!363099 () Bool)

(assert (=> mapNonEmpty!14217 m!363099))

(check-sat (not b!365331) (not b!365330) (not bm!27272) (not mapNonEmpty!14217) tp_is_empty!8445)
(check-sat)
