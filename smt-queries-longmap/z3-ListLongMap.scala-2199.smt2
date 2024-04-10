; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36554 () Bool)

(assert start!36554)

(declare-fun mapIsEmpty!14187 () Bool)

(declare-fun mapRes!14187 () Bool)

(assert (=> mapIsEmpty!14187 mapRes!14187))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12349 0))(
  ( (V!12350 (val!4261 Int)) )
))
(declare-datatypes ((ValueCell!3873 0))(
  ( (ValueCellFull!3873 (v!6456 V!12349)) (EmptyCell!3873) )
))
(declare-datatypes ((array!20821 0))(
  ( (array!20822 (arr!9888 (Array (_ BitVec 32) ValueCell!3873)) (size!10240 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20821)

(declare-fun b!365170 () Bool)

(declare-fun e!223557 () Bool)

(declare-datatypes ((array!20823 0))(
  ( (array!20824 (arr!9889 (Array (_ BitVec 32) (_ BitVec 64))) (size!10241 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20823)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!365170 (= e!223557 (and (= (size!10240 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10241 _keys!658) (size!10240 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011) (= (size!10241 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970)) (bvsgt #b00000000000000000000000000000000 (size!10241 _keys!658))))))

(declare-fun b!365171 () Bool)

(declare-fun e!223554 () Bool)

(declare-fun tp_is_empty!8433 () Bool)

(assert (=> b!365171 (= e!223554 tp_is_empty!8433)))

(declare-fun mapNonEmpty!14187 () Bool)

(declare-fun tp!28263 () Bool)

(assert (=> mapNonEmpty!14187 (= mapRes!14187 (and tp!28263 e!223554))))

(declare-fun mapKey!14187 () (_ BitVec 32))

(declare-fun mapRest!14187 () (Array (_ BitVec 32) ValueCell!3873))

(declare-fun mapValue!14187 () ValueCell!3873)

(assert (=> mapNonEmpty!14187 (= (arr!9888 _values!506) (store mapRest!14187 mapKey!14187 mapValue!14187))))

(declare-fun res!204193 () Bool)

(assert (=> start!36554 (=> (not res!204193) (not e!223557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36554 (= res!204193 (validMask!0 mask!970))))

(assert (=> start!36554 e!223557))

(assert (=> start!36554 true))

(declare-fun e!223555 () Bool)

(declare-fun array_inv!7328 (array!20821) Bool)

(assert (=> start!36554 (and (array_inv!7328 _values!506) e!223555)))

(declare-fun array_inv!7329 (array!20823) Bool)

(assert (=> start!36554 (array_inv!7329 _keys!658)))

(declare-fun b!365172 () Bool)

(declare-fun e!223558 () Bool)

(assert (=> b!365172 (= e!223555 (and e!223558 mapRes!14187))))

(declare-fun condMapEmpty!14187 () Bool)

(declare-fun mapDefault!14187 () ValueCell!3873)

(assert (=> b!365172 (= condMapEmpty!14187 (= (arr!9888 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3873)) mapDefault!14187)))))

(declare-fun b!365173 () Bool)

(assert (=> b!365173 (= e!223558 tp_is_empty!8433)))

(assert (= (and start!36554 res!204193) b!365170))

(assert (= (and b!365172 condMapEmpty!14187) mapIsEmpty!14187))

(assert (= (and b!365172 (not condMapEmpty!14187)) mapNonEmpty!14187))

(get-info :version)

(assert (= (and mapNonEmpty!14187 ((_ is ValueCellFull!3873) mapValue!14187)) b!365171))

(assert (= (and b!365172 ((_ is ValueCellFull!3873) mapDefault!14187)) b!365173))

(assert (= start!36554 b!365172))

(declare-fun m!362995 () Bool)

(assert (=> mapNonEmpty!14187 m!362995))

(declare-fun m!362997 () Bool)

(assert (=> start!36554 m!362997))

(declare-fun m!362999 () Bool)

(assert (=> start!36554 m!362999))

(declare-fun m!363001 () Bool)

(assert (=> start!36554 m!363001))

(check-sat (not start!36554) (not mapNonEmpty!14187) tp_is_empty!8433)
(check-sat)
(get-model)

(declare-fun d!72303 () Bool)

(assert (=> d!72303 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36554 d!72303))

(declare-fun d!72305 () Bool)

(assert (=> d!72305 (= (array_inv!7328 _values!506) (bvsge (size!10240 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36554 d!72305))

(declare-fun d!72307 () Bool)

(assert (=> d!72307 (= (array_inv!7329 _keys!658) (bvsge (size!10241 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36554 d!72307))

(declare-fun b!365193 () Bool)

(declare-fun e!223579 () Bool)

(assert (=> b!365193 (= e!223579 tp_is_empty!8433)))

(declare-fun b!365192 () Bool)

(declare-fun e!223578 () Bool)

(assert (=> b!365192 (= e!223578 tp_is_empty!8433)))

(declare-fun condMapEmpty!14193 () Bool)

(declare-fun mapDefault!14193 () ValueCell!3873)

(assert (=> mapNonEmpty!14187 (= condMapEmpty!14193 (= mapRest!14187 ((as const (Array (_ BitVec 32) ValueCell!3873)) mapDefault!14193)))))

(declare-fun mapRes!14193 () Bool)

(assert (=> mapNonEmpty!14187 (= tp!28263 (and e!223579 mapRes!14193))))

(declare-fun mapNonEmpty!14193 () Bool)

(declare-fun tp!28269 () Bool)

(assert (=> mapNonEmpty!14193 (= mapRes!14193 (and tp!28269 e!223578))))

(declare-fun mapRest!14193 () (Array (_ BitVec 32) ValueCell!3873))

(declare-fun mapValue!14193 () ValueCell!3873)

(declare-fun mapKey!14193 () (_ BitVec 32))

(assert (=> mapNonEmpty!14193 (= mapRest!14187 (store mapRest!14193 mapKey!14193 mapValue!14193))))

(declare-fun mapIsEmpty!14193 () Bool)

(assert (=> mapIsEmpty!14193 mapRes!14193))

(assert (= (and mapNonEmpty!14187 condMapEmpty!14193) mapIsEmpty!14193))

(assert (= (and mapNonEmpty!14187 (not condMapEmpty!14193)) mapNonEmpty!14193))

(assert (= (and mapNonEmpty!14193 ((_ is ValueCellFull!3873) mapValue!14193)) b!365192))

(assert (= (and mapNonEmpty!14187 ((_ is ValueCellFull!3873) mapDefault!14193)) b!365193))

(declare-fun m!363011 () Bool)

(assert (=> mapNonEmpty!14193 m!363011))

(check-sat (not mapNonEmpty!14193) tp_is_empty!8433)
(check-sat)
