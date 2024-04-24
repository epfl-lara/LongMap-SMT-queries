; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36538 () Bool)

(assert start!36538)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12347 0))(
  ( (V!12348 (val!4260 Int)) )
))
(declare-datatypes ((ValueCell!3872 0))(
  ( (ValueCellFull!3872 (v!6456 V!12347)) (EmptyCell!3872) )
))
(declare-datatypes ((array!20798 0))(
  ( (array!20799 (arr!9876 (Array (_ BitVec 32) ValueCell!3872)) (size!10228 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20798)

(declare-fun b!365109 () Bool)

(declare-fun e!223511 () Bool)

(declare-datatypes ((array!20800 0))(
  ( (array!20801 (arr!9877 (Array (_ BitVec 32) (_ BitVec 64))) (size!10229 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20800)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365109 (= e!223511 (and (= (size!10228 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10229 _keys!658) (size!10228 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011) (= (size!10229 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970)) (bvsgt #b00000000000000000000000000000000 (size!10229 _keys!658))))))

(declare-fun mapNonEmpty!14184 () Bool)

(declare-fun mapRes!14184 () Bool)

(declare-fun tp!28260 () Bool)

(declare-fun e!223508 () Bool)

(assert (=> mapNonEmpty!14184 (= mapRes!14184 (and tp!28260 e!223508))))

(declare-fun mapKey!14184 () (_ BitVec 32))

(declare-fun mapRest!14184 () (Array (_ BitVec 32) ValueCell!3872))

(declare-fun mapValue!14184 () ValueCell!3872)

(assert (=> mapNonEmpty!14184 (= (arr!9876 _values!506) (store mapRest!14184 mapKey!14184 mapValue!14184))))

(declare-fun b!365110 () Bool)

(declare-fun e!223507 () Bool)

(declare-fun e!223509 () Bool)

(assert (=> b!365110 (= e!223507 (and e!223509 mapRes!14184))))

(declare-fun condMapEmpty!14184 () Bool)

(declare-fun mapDefault!14184 () ValueCell!3872)

(assert (=> b!365110 (= condMapEmpty!14184 (= (arr!9876 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3872)) mapDefault!14184)))))

(declare-fun b!365111 () Bool)

(declare-fun tp_is_empty!8431 () Bool)

(assert (=> b!365111 (= e!223509 tp_is_empty!8431)))

(declare-fun mapIsEmpty!14184 () Bool)

(assert (=> mapIsEmpty!14184 mapRes!14184))

(declare-fun res!204187 () Bool)

(assert (=> start!36538 (=> (not res!204187) (not e!223511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36538 (= res!204187 (validMask!0 mask!970))))

(assert (=> start!36538 e!223511))

(assert (=> start!36538 true))

(declare-fun array_inv!7348 (array!20798) Bool)

(assert (=> start!36538 (and (array_inv!7348 _values!506) e!223507)))

(declare-fun array_inv!7349 (array!20800) Bool)

(assert (=> start!36538 (array_inv!7349 _keys!658)))

(declare-fun b!365112 () Bool)

(assert (=> b!365112 (= e!223508 tp_is_empty!8431)))

(assert (= (and start!36538 res!204187) b!365109))

(assert (= (and b!365110 condMapEmpty!14184) mapIsEmpty!14184))

(assert (= (and b!365110 (not condMapEmpty!14184)) mapNonEmpty!14184))

(get-info :version)

(assert (= (and mapNonEmpty!14184 ((_ is ValueCellFull!3872) mapValue!14184)) b!365112))

(assert (= (and b!365110 ((_ is ValueCellFull!3872) mapDefault!14184)) b!365111))

(assert (= start!36538 b!365110))

(declare-fun m!363217 () Bool)

(assert (=> mapNonEmpty!14184 m!363217))

(declare-fun m!363219 () Bool)

(assert (=> start!36538 m!363219))

(declare-fun m!363221 () Bool)

(assert (=> start!36538 m!363221))

(declare-fun m!363223 () Bool)

(assert (=> start!36538 m!363223))

(check-sat (not start!36538) (not mapNonEmpty!14184) tp_is_empty!8431)
(check-sat)
(get-model)

(declare-fun d!72333 () Bool)

(assert (=> d!72333 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36538 d!72333))

(declare-fun d!72335 () Bool)

(assert (=> d!72335 (= (array_inv!7348 _values!506) (bvsge (size!10228 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36538 d!72335))

(declare-fun d!72337 () Bool)

(assert (=> d!72337 (= (array_inv!7349 _keys!658) (bvsge (size!10229 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36538 d!72337))

(declare-fun mapNonEmpty!14193 () Bool)

(declare-fun mapRes!14193 () Bool)

(declare-fun tp!28269 () Bool)

(declare-fun e!223547 () Bool)

(assert (=> mapNonEmpty!14193 (= mapRes!14193 (and tp!28269 e!223547))))

(declare-fun mapKey!14193 () (_ BitVec 32))

(declare-fun mapValue!14193 () ValueCell!3872)

(declare-fun mapRest!14193 () (Array (_ BitVec 32) ValueCell!3872))

(assert (=> mapNonEmpty!14193 (= mapRest!14184 (store mapRest!14193 mapKey!14193 mapValue!14193))))

(declare-fun b!365143 () Bool)

(assert (=> b!365143 (= e!223547 tp_is_empty!8431)))

(declare-fun b!365144 () Bool)

(declare-fun e!223546 () Bool)

(assert (=> b!365144 (= e!223546 tp_is_empty!8431)))

(declare-fun mapIsEmpty!14193 () Bool)

(assert (=> mapIsEmpty!14193 mapRes!14193))

(declare-fun condMapEmpty!14193 () Bool)

(declare-fun mapDefault!14193 () ValueCell!3872)

(assert (=> mapNonEmpty!14184 (= condMapEmpty!14193 (= mapRest!14184 ((as const (Array (_ BitVec 32) ValueCell!3872)) mapDefault!14193)))))

(assert (=> mapNonEmpty!14184 (= tp!28260 (and e!223546 mapRes!14193))))

(assert (= (and mapNonEmpty!14184 condMapEmpty!14193) mapIsEmpty!14193))

(assert (= (and mapNonEmpty!14184 (not condMapEmpty!14193)) mapNonEmpty!14193))

(assert (= (and mapNonEmpty!14193 ((_ is ValueCellFull!3872) mapValue!14193)) b!365143))

(assert (= (and mapNonEmpty!14184 ((_ is ValueCellFull!3872) mapDefault!14193)) b!365144))

(declare-fun m!363241 () Bool)

(assert (=> mapNonEmpty!14193 m!363241))

(check-sat (not mapNonEmpty!14193) tp_is_empty!8431)
(check-sat)
