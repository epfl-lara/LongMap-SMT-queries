; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36550 () Bool)

(assert start!36550)

(declare-fun mapIsEmpty!14196 () Bool)

(declare-fun mapRes!14196 () Bool)

(assert (=> mapIsEmpty!14196 mapRes!14196))

(declare-fun b!365157 () Bool)

(declare-fun res!204202 () Bool)

(declare-fun e!223561 () Bool)

(assert (=> b!365157 (=> (not res!204202) (not e!223561))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!20812 0))(
  ( (array!20813 (arr!9882 (Array (_ BitVec 32) (_ BitVec 64))) (size!10234 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20812)

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((V!12355 0))(
  ( (V!12356 (val!4263 Int)) )
))
(declare-datatypes ((ValueCell!3875 0))(
  ( (ValueCellFull!3875 (v!6459 V!12355)) (EmptyCell!3875) )
))
(declare-datatypes ((array!20814 0))(
  ( (array!20815 (arr!9883 (Array (_ BitVec 32) ValueCell!3875)) (size!10235 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20814)

(assert (=> b!365157 (= res!204202 (and (= (size!10235 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10234 _keys!658) (size!10235 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365158 () Bool)

(declare-fun e!223559 () Bool)

(declare-fun tp_is_empty!8437 () Bool)

(assert (=> b!365158 (= e!223559 tp_is_empty!8437)))

(declare-fun b!365159 () Bool)

(assert (=> b!365159 (= e!223561 (bvsgt #b00000000000000000000000000000000 (size!10234 _keys!658)))))

(declare-fun b!365160 () Bool)

(declare-fun e!223560 () Bool)

(assert (=> b!365160 (= e!223560 tp_is_empty!8437)))

(declare-fun res!204200 () Bool)

(assert (=> start!36550 (=> (not res!204200) (not e!223561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36550 (= res!204200 (validMask!0 mask!970))))

(assert (=> start!36550 e!223561))

(assert (=> start!36550 true))

(declare-fun e!223562 () Bool)

(declare-fun array_inv!7352 (array!20814) Bool)

(assert (=> start!36550 (and (array_inv!7352 _values!506) e!223562)))

(declare-fun array_inv!7353 (array!20812) Bool)

(assert (=> start!36550 (array_inv!7353 _keys!658)))

(declare-fun b!365161 () Bool)

(declare-fun res!204201 () Bool)

(assert (=> b!365161 (=> (not res!204201) (not e!223561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20812 (_ BitVec 32)) Bool)

(assert (=> b!365161 (= res!204201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14196 () Bool)

(declare-fun tp!28272 () Bool)

(assert (=> mapNonEmpty!14196 (= mapRes!14196 (and tp!28272 e!223560))))

(declare-fun mapRest!14196 () (Array (_ BitVec 32) ValueCell!3875))

(declare-fun mapKey!14196 () (_ BitVec 32))

(declare-fun mapValue!14196 () ValueCell!3875)

(assert (=> mapNonEmpty!14196 (= (arr!9883 _values!506) (store mapRest!14196 mapKey!14196 mapValue!14196))))

(declare-fun b!365162 () Bool)

(assert (=> b!365162 (= e!223562 (and e!223559 mapRes!14196))))

(declare-fun condMapEmpty!14196 () Bool)

(declare-fun mapDefault!14196 () ValueCell!3875)

(assert (=> b!365162 (= condMapEmpty!14196 (= (arr!9883 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3875)) mapDefault!14196)))))

(assert (= (and start!36550 res!204200) b!365157))

(assert (= (and b!365157 res!204202) b!365161))

(assert (= (and b!365161 res!204201) b!365159))

(assert (= (and b!365162 condMapEmpty!14196) mapIsEmpty!14196))

(assert (= (and b!365162 (not condMapEmpty!14196)) mapNonEmpty!14196))

(get-info :version)

(assert (= (and mapNonEmpty!14196 ((_ is ValueCellFull!3875) mapValue!14196)) b!365160))

(assert (= (and b!365162 ((_ is ValueCellFull!3875) mapDefault!14196)) b!365158))

(assert (= start!36550 b!365162))

(declare-fun m!363243 () Bool)

(assert (=> start!36550 m!363243))

(declare-fun m!363245 () Bool)

(assert (=> start!36550 m!363245))

(declare-fun m!363247 () Bool)

(assert (=> start!36550 m!363247))

(declare-fun m!363249 () Bool)

(assert (=> b!365161 m!363249))

(declare-fun m!363251 () Bool)

(assert (=> mapNonEmpty!14196 m!363251))

(check-sat (not start!36550) (not b!365161) (not mapNonEmpty!14196) tp_is_empty!8437)
(check-sat)
(get-model)

(declare-fun d!72341 () Bool)

(assert (=> d!72341 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36550 d!72341))

(declare-fun d!72343 () Bool)

(assert (=> d!72343 (= (array_inv!7352 _values!506) (bvsge (size!10235 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36550 d!72343))

(declare-fun d!72345 () Bool)

(assert (=> d!72345 (= (array_inv!7353 _keys!658) (bvsge (size!10234 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36550 d!72345))

(declare-fun b!365207 () Bool)

(declare-fun e!223600 () Bool)

(declare-fun call!27259 () Bool)

(assert (=> b!365207 (= e!223600 call!27259)))

(declare-fun b!365208 () Bool)

(declare-fun e!223599 () Bool)

(assert (=> b!365208 (= e!223599 call!27259)))

(declare-fun d!72347 () Bool)

(declare-fun res!204226 () Bool)

(declare-fun e!223601 () Bool)

(assert (=> d!72347 (=> res!204226 e!223601)))

(assert (=> d!72347 (= res!204226 (bvsge #b00000000000000000000000000000000 (size!10234 _keys!658)))))

(assert (=> d!72347 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223601)))

(declare-fun b!365209 () Bool)

(assert (=> b!365209 (= e!223601 e!223600)))

(declare-fun c!53865 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365209 (= c!53865 (validKeyInArray!0 (select (arr!9882 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!365210 () Bool)

(assert (=> b!365210 (= e!223600 e!223599)))

(declare-fun lt!169174 () (_ BitVec 64))

(assert (=> b!365210 (= lt!169174 (select (arr!9882 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11371 0))(
  ( (Unit!11372) )
))
(declare-fun lt!169175 () Unit!11371)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20812 (_ BitVec 64) (_ BitVec 32)) Unit!11371)

(assert (=> b!365210 (= lt!169175 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169174 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365210 (arrayContainsKey!0 _keys!658 lt!169174 #b00000000000000000000000000000000)))

(declare-fun lt!169173 () Unit!11371)

(assert (=> b!365210 (= lt!169173 lt!169175)))

(declare-fun res!204225 () Bool)

(declare-datatypes ((SeekEntryResult!3449 0))(
  ( (MissingZero!3449 (index!15975 (_ BitVec 32))) (Found!3449 (index!15976 (_ BitVec 32))) (Intermediate!3449 (undefined!4261 Bool) (index!15977 (_ BitVec 32)) (x!36574 (_ BitVec 32))) (Undefined!3449) (MissingVacant!3449 (index!15978 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20812 (_ BitVec 32)) SeekEntryResult!3449)

(assert (=> b!365210 (= res!204225 (= (seekEntryOrOpen!0 (select (arr!9882 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3449 #b00000000000000000000000000000000)))))

(assert (=> b!365210 (=> (not res!204225) (not e!223599))))

(declare-fun bm!27256 () Bool)

(assert (=> bm!27256 (= call!27259 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(assert (= (and d!72347 (not res!204226)) b!365209))

(assert (= (and b!365209 c!53865) b!365210))

(assert (= (and b!365209 (not c!53865)) b!365207))

(assert (= (and b!365210 res!204225) b!365208))

(assert (= (or b!365208 b!365207) bm!27256))

(declare-fun m!363273 () Bool)

(assert (=> b!365209 m!363273))

(assert (=> b!365209 m!363273))

(declare-fun m!363275 () Bool)

(assert (=> b!365209 m!363275))

(assert (=> b!365210 m!363273))

(declare-fun m!363277 () Bool)

(assert (=> b!365210 m!363277))

(declare-fun m!363279 () Bool)

(assert (=> b!365210 m!363279))

(assert (=> b!365210 m!363273))

(declare-fun m!363281 () Bool)

(assert (=> b!365210 m!363281))

(declare-fun m!363283 () Bool)

(assert (=> bm!27256 m!363283))

(assert (=> b!365161 d!72347))

(declare-fun mapIsEmpty!14205 () Bool)

(declare-fun mapRes!14205 () Bool)

(assert (=> mapIsEmpty!14205 mapRes!14205))

(declare-fun condMapEmpty!14205 () Bool)

(declare-fun mapDefault!14205 () ValueCell!3875)

(assert (=> mapNonEmpty!14196 (= condMapEmpty!14205 (= mapRest!14196 ((as const (Array (_ BitVec 32) ValueCell!3875)) mapDefault!14205)))))

(declare-fun e!223607 () Bool)

(assert (=> mapNonEmpty!14196 (= tp!28272 (and e!223607 mapRes!14205))))

(declare-fun b!365218 () Bool)

(assert (=> b!365218 (= e!223607 tp_is_empty!8437)))

(declare-fun mapNonEmpty!14205 () Bool)

(declare-fun tp!28281 () Bool)

(declare-fun e!223606 () Bool)

(assert (=> mapNonEmpty!14205 (= mapRes!14205 (and tp!28281 e!223606))))

(declare-fun mapRest!14205 () (Array (_ BitVec 32) ValueCell!3875))

(declare-fun mapKey!14205 () (_ BitVec 32))

(declare-fun mapValue!14205 () ValueCell!3875)

(assert (=> mapNonEmpty!14205 (= mapRest!14196 (store mapRest!14205 mapKey!14205 mapValue!14205))))

(declare-fun b!365217 () Bool)

(assert (=> b!365217 (= e!223606 tp_is_empty!8437)))

(assert (= (and mapNonEmpty!14196 condMapEmpty!14205) mapIsEmpty!14205))

(assert (= (and mapNonEmpty!14196 (not condMapEmpty!14205)) mapNonEmpty!14205))

(assert (= (and mapNonEmpty!14205 ((_ is ValueCellFull!3875) mapValue!14205)) b!365217))

(assert (= (and mapNonEmpty!14196 ((_ is ValueCellFull!3875) mapDefault!14205)) b!365218))

(declare-fun m!363285 () Bool)

(assert (=> mapNonEmpty!14205 m!363285))

(check-sat (not b!365210) (not mapNonEmpty!14205) (not bm!27256) (not b!365209) tp_is_empty!8437)
(check-sat)
