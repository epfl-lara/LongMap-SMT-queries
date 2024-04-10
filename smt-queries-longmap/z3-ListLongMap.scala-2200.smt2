; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36566 () Bool)

(assert start!36566)

(declare-fun mapNonEmpty!14199 () Bool)

(declare-fun mapRes!14199 () Bool)

(declare-fun tp!28275 () Bool)

(declare-fun e!223606 () Bool)

(assert (=> mapNonEmpty!14199 (= mapRes!14199 (and tp!28275 e!223606))))

(declare-datatypes ((V!12357 0))(
  ( (V!12358 (val!4264 Int)) )
))
(declare-datatypes ((ValueCell!3876 0))(
  ( (ValueCellFull!3876 (v!6459 V!12357)) (EmptyCell!3876) )
))
(declare-datatypes ((array!20835 0))(
  ( (array!20836 (arr!9894 (Array (_ BitVec 32) ValueCell!3876)) (size!10246 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20835)

(declare-fun mapValue!14199 () ValueCell!3876)

(declare-fun mapKey!14199 () (_ BitVec 32))

(declare-fun mapRest!14199 () (Array (_ BitVec 32) ValueCell!3876))

(assert (=> mapNonEmpty!14199 (= (arr!9894 _values!506) (store mapRest!14199 mapKey!14199 mapValue!14199))))

(declare-fun mapIsEmpty!14199 () Bool)

(assert (=> mapIsEmpty!14199 mapRes!14199))

(declare-fun b!365224 () Bool)

(declare-fun e!223607 () Bool)

(declare-fun e!223609 () Bool)

(assert (=> b!365224 (= e!223607 (and e!223609 mapRes!14199))))

(declare-fun condMapEmpty!14199 () Bool)

(declare-fun mapDefault!14199 () ValueCell!3876)

(assert (=> b!365224 (= condMapEmpty!14199 (= (arr!9894 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3876)) mapDefault!14199)))))

(declare-fun b!365225 () Bool)

(declare-fun tp_is_empty!8439 () Bool)

(assert (=> b!365225 (= e!223606 tp_is_empty!8439)))

(declare-fun res!204214 () Bool)

(declare-fun e!223605 () Bool)

(assert (=> start!36566 (=> (not res!204214) (not e!223605))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36566 (= res!204214 (validMask!0 mask!970))))

(assert (=> start!36566 e!223605))

(assert (=> start!36566 true))

(declare-fun array_inv!7330 (array!20835) Bool)

(assert (=> start!36566 (and (array_inv!7330 _values!506) e!223607)))

(declare-datatypes ((array!20837 0))(
  ( (array!20838 (arr!9895 (Array (_ BitVec 32) (_ BitVec 64))) (size!10247 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20837)

(declare-fun array_inv!7331 (array!20837) Bool)

(assert (=> start!36566 (array_inv!7331 _keys!658)))

(declare-fun b!365226 () Bool)

(declare-fun res!204212 () Bool)

(assert (=> b!365226 (=> (not res!204212) (not e!223605))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365226 (= res!204212 (and (= (size!10246 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10247 _keys!658) (size!10246 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365227 () Bool)

(declare-fun res!204213 () Bool)

(assert (=> b!365227 (=> (not res!204213) (not e!223605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20837 (_ BitVec 32)) Bool)

(assert (=> b!365227 (= res!204213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365228 () Bool)

(assert (=> b!365228 (= e!223609 tp_is_empty!8439)))

(declare-fun b!365229 () Bool)

(assert (=> b!365229 (= e!223605 (bvsgt #b00000000000000000000000000000000 (size!10247 _keys!658)))))

(assert (= (and start!36566 res!204214) b!365226))

(assert (= (and b!365226 res!204212) b!365227))

(assert (= (and b!365227 res!204213) b!365229))

(assert (= (and b!365224 condMapEmpty!14199) mapIsEmpty!14199))

(assert (= (and b!365224 (not condMapEmpty!14199)) mapNonEmpty!14199))

(get-info :version)

(assert (= (and mapNonEmpty!14199 ((_ is ValueCellFull!3876) mapValue!14199)) b!365225))

(assert (= (and b!365224 ((_ is ValueCellFull!3876) mapDefault!14199)) b!365228))

(assert (= start!36566 b!365224))

(declare-fun m!363023 () Bool)

(assert (=> mapNonEmpty!14199 m!363023))

(declare-fun m!363025 () Bool)

(assert (=> start!36566 m!363025))

(declare-fun m!363027 () Bool)

(assert (=> start!36566 m!363027))

(declare-fun m!363029 () Bool)

(assert (=> start!36566 m!363029))

(declare-fun m!363031 () Bool)

(assert (=> b!365227 m!363031))

(check-sat (not start!36566) (not b!365227) (not mapNonEmpty!14199) tp_is_empty!8439)
(check-sat)
(get-model)

(declare-fun d!72311 () Bool)

(assert (=> d!72311 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36566 d!72311))

(declare-fun d!72313 () Bool)

(assert (=> d!72313 (= (array_inv!7330 _values!506) (bvsge (size!10246 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36566 d!72313))

(declare-fun d!72315 () Bool)

(assert (=> d!72315 (= (array_inv!7331 _keys!658) (bvsge (size!10247 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36566 d!72315))

(declare-fun b!365256 () Bool)

(declare-fun e!223633 () Bool)

(declare-fun e!223631 () Bool)

(assert (=> b!365256 (= e!223633 e!223631)))

(declare-fun c!53888 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365256 (= c!53888 (validKeyInArray!0 (select (arr!9895 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!365257 () Bool)

(declare-fun e!223632 () Bool)

(declare-fun call!27272 () Bool)

(assert (=> b!365257 (= e!223632 call!27272)))

(declare-fun b!365258 () Bool)

(assert (=> b!365258 (= e!223631 call!27272)))

(declare-fun b!365259 () Bool)

(assert (=> b!365259 (= e!223631 e!223632)))

(declare-fun lt!169154 () (_ BitVec 64))

(assert (=> b!365259 (= lt!169154 (select (arr!9895 _keys!658) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11382 0))(
  ( (Unit!11383) )
))
(declare-fun lt!169155 () Unit!11382)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20837 (_ BitVec 64) (_ BitVec 32)) Unit!11382)

(assert (=> b!365259 (= lt!169155 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!169154 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365259 (arrayContainsKey!0 _keys!658 lt!169154 #b00000000000000000000000000000000)))

(declare-fun lt!169156 () Unit!11382)

(assert (=> b!365259 (= lt!169156 lt!169155)))

(declare-fun res!204229 () Bool)

(declare-datatypes ((SeekEntryResult!3500 0))(
  ( (MissingZero!3500 (index!16179 (_ BitVec 32))) (Found!3500 (index!16180 (_ BitVec 32))) (Intermediate!3500 (undefined!4312 Bool) (index!16181 (_ BitVec 32)) (x!36628 (_ BitVec 32))) (Undefined!3500) (MissingVacant!3500 (index!16182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20837 (_ BitVec 32)) SeekEntryResult!3500)

(assert (=> b!365259 (= res!204229 (= (seekEntryOrOpen!0 (select (arr!9895 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3500 #b00000000000000000000000000000000)))))

(assert (=> b!365259 (=> (not res!204229) (not e!223632))))

(declare-fun bm!27269 () Bool)

(assert (=> bm!27269 (= call!27272 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun d!72317 () Bool)

(declare-fun res!204228 () Bool)

(assert (=> d!72317 (=> res!204228 e!223633)))

(assert (=> d!72317 (= res!204228 (bvsge #b00000000000000000000000000000000 (size!10247 _keys!658)))))

(assert (=> d!72317 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!223633)))

(assert (= (and d!72317 (not res!204228)) b!365256))

(assert (= (and b!365256 c!53888) b!365259))

(assert (= (and b!365256 (not c!53888)) b!365258))

(assert (= (and b!365259 res!204229) b!365257))

(assert (= (or b!365257 b!365258) bm!27269))

(declare-fun m!363043 () Bool)

(assert (=> b!365256 m!363043))

(assert (=> b!365256 m!363043))

(declare-fun m!363045 () Bool)

(assert (=> b!365256 m!363045))

(assert (=> b!365259 m!363043))

(declare-fun m!363047 () Bool)

(assert (=> b!365259 m!363047))

(declare-fun m!363049 () Bool)

(assert (=> b!365259 m!363049))

(assert (=> b!365259 m!363043))

(declare-fun m!363051 () Bool)

(assert (=> b!365259 m!363051))

(declare-fun m!363053 () Bool)

(assert (=> bm!27269 m!363053))

(assert (=> b!365227 d!72317))

(declare-fun mapNonEmpty!14205 () Bool)

(declare-fun mapRes!14205 () Bool)

(declare-fun tp!28281 () Bool)

(declare-fun e!223639 () Bool)

(assert (=> mapNonEmpty!14205 (= mapRes!14205 (and tp!28281 e!223639))))

(declare-fun mapRest!14205 () (Array (_ BitVec 32) ValueCell!3876))

(declare-fun mapKey!14205 () (_ BitVec 32))

(declare-fun mapValue!14205 () ValueCell!3876)

(assert (=> mapNonEmpty!14205 (= mapRest!14199 (store mapRest!14205 mapKey!14205 mapValue!14205))))

(declare-fun b!365266 () Bool)

(assert (=> b!365266 (= e!223639 tp_is_empty!8439)))

(declare-fun condMapEmpty!14205 () Bool)

(declare-fun mapDefault!14205 () ValueCell!3876)

(assert (=> mapNonEmpty!14199 (= condMapEmpty!14205 (= mapRest!14199 ((as const (Array (_ BitVec 32) ValueCell!3876)) mapDefault!14205)))))

(declare-fun e!223638 () Bool)

(assert (=> mapNonEmpty!14199 (= tp!28275 (and e!223638 mapRes!14205))))

(declare-fun mapIsEmpty!14205 () Bool)

(assert (=> mapIsEmpty!14205 mapRes!14205))

(declare-fun b!365267 () Bool)

(assert (=> b!365267 (= e!223638 tp_is_empty!8439)))

(assert (= (and mapNonEmpty!14199 condMapEmpty!14205) mapIsEmpty!14205))

(assert (= (and mapNonEmpty!14199 (not condMapEmpty!14205)) mapNonEmpty!14205))

(assert (= (and mapNonEmpty!14205 ((_ is ValueCellFull!3876) mapValue!14205)) b!365266))

(assert (= (and mapNonEmpty!14199 ((_ is ValueCellFull!3876) mapDefault!14205)) b!365267))

(declare-fun m!363055 () Bool)

(assert (=> mapNonEmpty!14205 m!363055))

(check-sat tp_is_empty!8439 (not b!365256) (not bm!27269) (not b!365259) (not mapNonEmpty!14205))
(check-sat)
