; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36538 () Bool)

(assert start!36538)

(declare-fun b!364887 () Bool)

(declare-fun e!223366 () Bool)

(declare-fun tp_is_empty!8431 () Bool)

(assert (=> b!364887 (= e!223366 tp_is_empty!8431)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun e!223369 () Bool)

(declare-datatypes ((array!20795 0))(
  ( (array!20796 (arr!9875 (Array (_ BitVec 32) (_ BitVec 64))) (size!10228 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20795)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun b!364888 () Bool)

(declare-datatypes ((V!12347 0))(
  ( (V!12348 (val!4260 Int)) )
))
(declare-datatypes ((ValueCell!3872 0))(
  ( (ValueCellFull!3872 (v!6449 V!12347)) (EmptyCell!3872) )
))
(declare-datatypes ((array!20797 0))(
  ( (array!20798 (arr!9876 (Array (_ BitVec 32) ValueCell!3872)) (size!10229 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20797)

(assert (=> b!364888 (= e!223369 (and (= (size!10229 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10228 _keys!658) (size!10229 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011) (= (size!10228 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970)) (bvsgt #b00000000000000000000000000000000 (size!10228 _keys!658))))))

(declare-fun mapNonEmpty!14184 () Bool)

(declare-fun mapRes!14184 () Bool)

(declare-fun tp!28260 () Bool)

(assert (=> mapNonEmpty!14184 (= mapRes!14184 (and tp!28260 e!223366))))

(declare-fun mapRest!14184 () (Array (_ BitVec 32) ValueCell!3872))

(declare-fun mapKey!14184 () (_ BitVec 32))

(declare-fun mapValue!14184 () ValueCell!3872)

(assert (=> mapNonEmpty!14184 (= (arr!9876 _values!506) (store mapRest!14184 mapKey!14184 mapValue!14184))))

(declare-fun b!364889 () Bool)

(declare-fun e!223368 () Bool)

(declare-fun e!223367 () Bool)

(assert (=> b!364889 (= e!223368 (and e!223367 mapRes!14184))))

(declare-fun condMapEmpty!14184 () Bool)

(declare-fun mapDefault!14184 () ValueCell!3872)

(assert (=> b!364889 (= condMapEmpty!14184 (= (arr!9876 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3872)) mapDefault!14184)))))

(declare-fun res!204061 () Bool)

(assert (=> start!36538 (=> (not res!204061) (not e!223369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36538 (= res!204061 (validMask!0 mask!970))))

(assert (=> start!36538 e!223369))

(assert (=> start!36538 true))

(declare-fun array_inv!7322 (array!20797) Bool)

(assert (=> start!36538 (and (array_inv!7322 _values!506) e!223368)))

(declare-fun array_inv!7323 (array!20795) Bool)

(assert (=> start!36538 (array_inv!7323 _keys!658)))

(declare-fun mapIsEmpty!14184 () Bool)

(assert (=> mapIsEmpty!14184 mapRes!14184))

(declare-fun b!364890 () Bool)

(assert (=> b!364890 (= e!223367 tp_is_empty!8431)))

(assert (= (and start!36538 res!204061) b!364888))

(assert (= (and b!364889 condMapEmpty!14184) mapIsEmpty!14184))

(assert (= (and b!364889 (not condMapEmpty!14184)) mapNonEmpty!14184))

(get-info :version)

(assert (= (and mapNonEmpty!14184 ((_ is ValueCellFull!3872) mapValue!14184)) b!364887))

(assert (= (and b!364889 ((_ is ValueCellFull!3872) mapDefault!14184)) b!364890))

(assert (= start!36538 b!364889))

(declare-fun m!362263 () Bool)

(assert (=> mapNonEmpty!14184 m!362263))

(declare-fun m!362265 () Bool)

(assert (=> start!36538 m!362265))

(declare-fun m!362267 () Bool)

(assert (=> start!36538 m!362267))

(declare-fun m!362269 () Bool)

(assert (=> start!36538 m!362269))

(check-sat (not start!36538) (not mapNonEmpty!14184) tp_is_empty!8431)
(check-sat)
(get-model)

(declare-fun d!72099 () Bool)

(assert (=> d!72099 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!36538 d!72099))

(declare-fun d!72101 () Bool)

(assert (=> d!72101 (= (array_inv!7322 _values!506) (bvsge (size!10229 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!36538 d!72101))

(declare-fun d!72103 () Bool)

(assert (=> d!72103 (= (array_inv!7323 _keys!658) (bvsge (size!10228 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!36538 d!72103))

(declare-fun mapNonEmpty!14193 () Bool)

(declare-fun mapRes!14193 () Bool)

(declare-fun tp!28269 () Bool)

(declare-fun e!223404 () Bool)

(assert (=> mapNonEmpty!14193 (= mapRes!14193 (and tp!28269 e!223404))))

(declare-fun mapKey!14193 () (_ BitVec 32))

(declare-fun mapValue!14193 () ValueCell!3872)

(declare-fun mapRest!14193 () (Array (_ BitVec 32) ValueCell!3872))

(assert (=> mapNonEmpty!14193 (= mapRest!14184 (store mapRest!14193 mapKey!14193 mapValue!14193))))

(declare-fun mapIsEmpty!14193 () Bool)

(assert (=> mapIsEmpty!14193 mapRes!14193))

(declare-fun condMapEmpty!14193 () Bool)

(declare-fun mapDefault!14193 () ValueCell!3872)

(assert (=> mapNonEmpty!14184 (= condMapEmpty!14193 (= mapRest!14184 ((as const (Array (_ BitVec 32) ValueCell!3872)) mapDefault!14193)))))

(declare-fun e!223405 () Bool)

(assert (=> mapNonEmpty!14184 (= tp!28260 (and e!223405 mapRes!14193))))

(declare-fun b!364922 () Bool)

(assert (=> b!364922 (= e!223405 tp_is_empty!8431)))

(declare-fun b!364921 () Bool)

(assert (=> b!364921 (= e!223404 tp_is_empty!8431)))

(assert (= (and mapNonEmpty!14184 condMapEmpty!14193) mapIsEmpty!14193))

(assert (= (and mapNonEmpty!14184 (not condMapEmpty!14193)) mapNonEmpty!14193))

(assert (= (and mapNonEmpty!14193 ((_ is ValueCellFull!3872) mapValue!14193)) b!364921))

(assert (= (and mapNonEmpty!14184 ((_ is ValueCellFull!3872) mapDefault!14193)) b!364922))

(declare-fun m!362287 () Bool)

(assert (=> mapNonEmpty!14193 m!362287))

(check-sat (not mapNonEmpty!14193) tp_is_empty!8431)
(check-sat)
