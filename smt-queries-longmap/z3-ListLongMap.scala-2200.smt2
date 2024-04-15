; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36550 () Bool)

(assert start!36550)

(declare-fun mapNonEmpty!14196 () Bool)

(declare-fun mapRes!14196 () Bool)

(declare-fun tp!28272 () Bool)

(declare-fun e!223418 () Bool)

(assert (=> mapNonEmpty!14196 (= mapRes!14196 (and tp!28272 e!223418))))

(declare-datatypes ((V!12355 0))(
  ( (V!12356 (val!4263 Int)) )
))
(declare-datatypes ((ValueCell!3875 0))(
  ( (ValueCellFull!3875 (v!6452 V!12355)) (EmptyCell!3875) )
))
(declare-fun mapValue!14196 () ValueCell!3875)

(declare-datatypes ((array!20809 0))(
  ( (array!20810 (arr!9881 (Array (_ BitVec 32) ValueCell!3875)) (size!10234 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20809)

(declare-fun mapKey!14196 () (_ BitVec 32))

(declare-fun mapRest!14196 () (Array (_ BitVec 32) ValueCell!3875))

(assert (=> mapNonEmpty!14196 (= (arr!9881 _values!506) (store mapRest!14196 mapKey!14196 mapValue!14196))))

(declare-fun b!364935 () Bool)

(declare-fun e!223416 () Bool)

(declare-fun e!223420 () Bool)

(assert (=> b!364935 (= e!223416 (and e!223420 mapRes!14196))))

(declare-fun condMapEmpty!14196 () Bool)

(declare-fun mapDefault!14196 () ValueCell!3875)

(assert (=> b!364935 (= condMapEmpty!14196 (= (arr!9881 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3875)) mapDefault!14196)))))

(declare-fun b!364936 () Bool)

(declare-fun res!204074 () Bool)

(declare-fun e!223417 () Bool)

(assert (=> b!364936 (=> (not res!204074) (not e!223417))))

(declare-datatypes ((array!20811 0))(
  ( (array!20812 (arr!9882 (Array (_ BitVec 32) (_ BitVec 64))) (size!10235 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20811)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20811 (_ BitVec 32)) Bool)

(assert (=> b!364936 (= res!204074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!364937 () Bool)

(assert (=> b!364937 (= e!223417 (bvsgt #b00000000000000000000000000000000 (size!10235 _keys!658)))))

(declare-fun b!364938 () Bool)

(declare-fun tp_is_empty!8437 () Bool)

(assert (=> b!364938 (= e!223418 tp_is_empty!8437)))

(declare-fun b!364939 () Bool)

(declare-fun res!204076 () Bool)

(assert (=> b!364939 (=> (not res!204076) (not e!223417))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!364939 (= res!204076 (and (= (size!10234 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10235 _keys!658) (size!10234 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!204075 () Bool)

(assert (=> start!36550 (=> (not res!204075) (not e!223417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36550 (= res!204075 (validMask!0 mask!970))))

(assert (=> start!36550 e!223417))

(assert (=> start!36550 true))

(declare-fun array_inv!7328 (array!20809) Bool)

(assert (=> start!36550 (and (array_inv!7328 _values!506) e!223416)))

(declare-fun array_inv!7329 (array!20811) Bool)

(assert (=> start!36550 (array_inv!7329 _keys!658)))

(declare-fun b!364940 () Bool)

(assert (=> b!364940 (= e!223420 tp_is_empty!8437)))

(declare-fun mapIsEmpty!14196 () Bool)

(assert (=> mapIsEmpty!14196 mapRes!14196))

(assert (= (and start!36550 res!204075) b!364939))

(assert (= (and b!364939 res!204076) b!364936))

(assert (= (and b!364936 res!204074) b!364937))

(assert (= (and b!364935 condMapEmpty!14196) mapIsEmpty!14196))

(assert (= (and b!364935 (not condMapEmpty!14196)) mapNonEmpty!14196))

(get-info :version)

(assert (= (and mapNonEmpty!14196 ((_ is ValueCellFull!3875) mapValue!14196)) b!364938))

(assert (= (and b!364935 ((_ is ValueCellFull!3875) mapDefault!14196)) b!364940))

(assert (= start!36550 b!364935))

(declare-fun m!362289 () Bool)

(assert (=> mapNonEmpty!14196 m!362289))

(declare-fun m!362291 () Bool)

(assert (=> b!364936 m!362291))

(declare-fun m!362293 () Bool)

(assert (=> start!36550 m!362293))

(declare-fun m!362295 () Bool)

(assert (=> start!36550 m!362295))

(declare-fun m!362297 () Bool)

(assert (=> start!36550 m!362297))

(check-sat (not b!364936) (not start!36550) (not mapNonEmpty!14196) tp_is_empty!8437)
(check-sat)
(get-model)

(declare-fun bm!27244 () Bool)

(declare-fun call!27247 () Bool)

(assert (=> bm!27244 (= call!27247 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!364985 () Bool)

(declare-fun e!223459 () Bool)

(assert (=> b!364985 (= e!223459 call!27247)))

(declare-fun b!364986 () Bool)

(declare-fun e!223457 () Bool)

(assert (=> b!364986 (= e!223457 call!27247)))

(declare-fun d!72107 () Bool)

(declare-fun res!204099 () Bool)

(declare-fun e!223458 () Bool)

(assert (=> d!72107 (=> res!204099 e!223458)))

(assert (=> d!72107 (= res!204099 (bvsge #b00000000000000000000000000000000 (size!10235 _keys!658)))))

(assert (=> d!72107 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223458)))

(declare-fun b!364987 () Bool)

(assert (=> b!364987 (= e!223458 e!223457)))

(declare-fun c!53817 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364987 (= c!53817 (validKeyInArray!0 (select (arr!9882 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!364988 () Bool)

(assert (=> b!364988 (= e!223457 e!223459)))

(declare-fun lt!168920 () (_ BitVec 64))

(assert (=> b!364988 (= lt!168920 (select (arr!9882 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11360 0))(
  ( (Unit!11361) )
))
(declare-fun lt!168922 () Unit!11360)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20811 (_ BitVec 64) (_ BitVec 32)) Unit!11360)

(assert (=> b!364988 (= lt!168922 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!168920 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!364988 (arrayContainsKey!0 _keys!658 lt!168920 #b00000000000000000000000000000000)))

(declare-fun lt!168921 () Unit!11360)

(assert (=> b!364988 (= lt!168921 lt!168922)))

(declare-fun res!204100 () Bool)

(declare-datatypes ((SeekEntryResult!3495 0))(
  ( (MissingZero!3495 (index!16159 (_ BitVec 32))) (Found!3495 (index!16160 (_ BitVec 32))) (Intermediate!3495 (undefined!4307 Bool) (index!16161 (_ BitVec 32)) (x!36618 (_ BitVec 32))) (Undefined!3495) (MissingVacant!3495 (index!16162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20811 (_ BitVec 32)) SeekEntryResult!3495)

(assert (=> b!364988 (= res!204100 (= (seekEntryOrOpen!0 (select (arr!9882 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3495 #b00000000000000000000000000000000)))))

(assert (=> b!364988 (=> (not res!204100) (not e!223459))))

(assert (= (and d!72107 (not res!204099)) b!364987))

(assert (= (and b!364987 c!53817) b!364988))

(assert (= (and b!364987 (not c!53817)) b!364986))

(assert (= (and b!364988 res!204100) b!364985))

(assert (= (or b!364985 b!364986) bm!27244))

(declare-fun m!362319 () Bool)

(assert (=> bm!27244 m!362319))

(declare-fun m!362321 () Bool)

(assert (=> b!364987 m!362321))

(assert (=> b!364987 m!362321))

(declare-fun m!362323 () Bool)

(assert (=> b!364987 m!362323))

(assert (=> b!364988 m!362321))

(declare-fun m!362325 () Bool)

(assert (=> b!364988 m!362325))

(declare-fun m!362327 () Bool)

(assert (=> b!364988 m!362327))

(assert (=> b!364988 m!362321))

(declare-fun m!362329 () Bool)

(assert (=> b!364988 m!362329))

(assert (=> b!364936 d!72107))

(declare-fun d!72109 () Bool)

(assert (=> d!72109 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36550 d!72109))

(declare-fun d!72111 () Bool)

(assert (=> d!72111 (= (array_inv!7328 _values!506) (bvsge (size!10234 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36550 d!72111))

(declare-fun d!72113 () Bool)

(assert (=> d!72113 (= (array_inv!7329 _keys!658) (bvsge (size!10235 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36550 d!72113))

(declare-fun b!364995 () Bool)

(declare-fun e!223465 () Bool)

(assert (=> b!364995 (= e!223465 tp_is_empty!8437)))

(declare-fun mapIsEmpty!14205 () Bool)

(declare-fun mapRes!14205 () Bool)

(assert (=> mapIsEmpty!14205 mapRes!14205))

(declare-fun condMapEmpty!14205 () Bool)

(declare-fun mapDefault!14205 () ValueCell!3875)

(assert (=> mapNonEmpty!14196 (= condMapEmpty!14205 (= mapRest!14196 ((as const (Array (_ BitVec 32) ValueCell!3875)) mapDefault!14205)))))

(declare-fun e!223464 () Bool)

(assert (=> mapNonEmpty!14196 (= tp!28272 (and e!223464 mapRes!14205))))

(declare-fun b!364996 () Bool)

(assert (=> b!364996 (= e!223464 tp_is_empty!8437)))

(declare-fun mapNonEmpty!14205 () Bool)

(declare-fun tp!28281 () Bool)

(assert (=> mapNonEmpty!14205 (= mapRes!14205 (and tp!28281 e!223465))))

(declare-fun mapValue!14205 () ValueCell!3875)

(declare-fun mapKey!14205 () (_ BitVec 32))

(declare-fun mapRest!14205 () (Array (_ BitVec 32) ValueCell!3875))

(assert (=> mapNonEmpty!14205 (= mapRest!14196 (store mapRest!14205 mapKey!14205 mapValue!14205))))

(assert (= (and mapNonEmpty!14196 condMapEmpty!14205) mapIsEmpty!14205))

(assert (= (and mapNonEmpty!14196 (not condMapEmpty!14205)) mapNonEmpty!14205))

(assert (= (and mapNonEmpty!14205 ((_ is ValueCellFull!3875) mapValue!14205)) b!364995))

(assert (= (and mapNonEmpty!14196 ((_ is ValueCellFull!3875) mapDefault!14205)) b!364996))

(declare-fun m!362331 () Bool)

(assert (=> mapNonEmpty!14205 m!362331))

(check-sat (not bm!27244) tp_is_empty!8437 (not b!364987) (not mapNonEmpty!14205) (not b!364988))
(check-sat)
