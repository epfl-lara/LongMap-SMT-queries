; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19958 () Bool)

(assert start!19958)

(declare-fun mapNonEmpty!7823 () Bool)

(declare-fun mapRes!7823 () Bool)

(declare-fun tp!17111 () Bool)

(declare-fun e!128834 () Bool)

(assert (=> mapNonEmpty!7823 (= mapRes!7823 (and tp!17111 e!128834))))

(declare-fun mapKey!7823 () (_ BitVec 32))

(declare-datatypes ((V!5665 0))(
  ( (V!5666 (val!2301 Int)) )
))
(declare-datatypes ((ValueCell!1913 0))(
  ( (ValueCellFull!1913 (v!4271 V!5665)) (EmptyCell!1913) )
))
(declare-fun mapValue!7823 () ValueCell!1913)

(declare-datatypes ((array!8267 0))(
  ( (array!8268 (arr!3889 (Array (_ BitVec 32) ValueCell!1913)) (size!4214 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8267)

(declare-fun mapRest!7823 () (Array (_ BitVec 32) ValueCell!1913))

(assert (=> mapNonEmpty!7823 (= (arr!3889 _values!649) (store mapRest!7823 mapKey!7823 mapValue!7823))))

(declare-fun b!195790 () Bool)

(declare-fun e!128837 () Bool)

(declare-fun e!128838 () Bool)

(assert (=> b!195790 (= e!128837 (and e!128838 mapRes!7823))))

(declare-fun condMapEmpty!7823 () Bool)

(declare-fun mapDefault!7823 () ValueCell!1913)

(assert (=> b!195790 (= condMapEmpty!7823 (= (arr!3889 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1913)) mapDefault!7823)))))

(declare-fun res!92387 () Bool)

(declare-fun e!128835 () Bool)

(assert (=> start!19958 (=> (not res!92387) (not e!128835))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19958 (= res!92387 (validMask!0 mask!1149))))

(assert (=> start!19958 e!128835))

(assert (=> start!19958 true))

(declare-fun array_inv!2513 (array!8267) Bool)

(assert (=> start!19958 (and (array_inv!2513 _values!649) e!128837)))

(declare-datatypes ((array!8269 0))(
  ( (array!8270 (arr!3890 (Array (_ BitVec 32) (_ BitVec 64))) (size!4215 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8269)

(declare-fun array_inv!2514 (array!8269) Bool)

(assert (=> start!19958 (array_inv!2514 _keys!825)))

(declare-fun mapIsEmpty!7823 () Bool)

(assert (=> mapIsEmpty!7823 mapRes!7823))

(declare-fun b!195791 () Bool)

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!195791 (= e!128835 (and (= (size!4214 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4215 _keys!825) (size!4214 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011) (= (size!4215 _keys!825) (bvadd #b00000000000000000000000000000001 mask!1149)) (bvsgt #b00000000000000000000000000000000 (size!4215 _keys!825))))))

(declare-fun b!195792 () Bool)

(declare-fun tp_is_empty!4513 () Bool)

(assert (=> b!195792 (= e!128834 tp_is_empty!4513)))

(declare-fun b!195793 () Bool)

(assert (=> b!195793 (= e!128838 tp_is_empty!4513)))

(assert (= (and start!19958 res!92387) b!195791))

(assert (= (and b!195790 condMapEmpty!7823) mapIsEmpty!7823))

(assert (= (and b!195790 (not condMapEmpty!7823)) mapNonEmpty!7823))

(get-info :version)

(assert (= (and mapNonEmpty!7823 ((_ is ValueCellFull!1913) mapValue!7823)) b!195792))

(assert (= (and b!195790 ((_ is ValueCellFull!1913) mapDefault!7823)) b!195793))

(assert (= start!19958 b!195790))

(declare-fun m!223457 () Bool)

(assert (=> mapNonEmpty!7823 m!223457))

(declare-fun m!223459 () Bool)

(assert (=> start!19958 m!223459))

(declare-fun m!223461 () Bool)

(assert (=> start!19958 m!223461))

(declare-fun m!223463 () Bool)

(assert (=> start!19958 m!223463))

(check-sat (not start!19958) (not mapNonEmpty!7823) tp_is_empty!4513)
(check-sat)
(get-model)

(declare-fun d!57599 () Bool)

(assert (=> d!57599 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!19958 d!57599))

(declare-fun d!57601 () Bool)

(assert (=> d!57601 (= (array_inv!2513 _values!649) (bvsge (size!4214 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!19958 d!57601))

(declare-fun d!57603 () Bool)

(assert (=> d!57603 (= (array_inv!2514 _keys!825) (bvsge (size!4215 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!19958 d!57603))

(declare-fun mapNonEmpty!7832 () Bool)

(declare-fun mapRes!7832 () Bool)

(declare-fun tp!17120 () Bool)

(declare-fun e!128873 () Bool)

(assert (=> mapNonEmpty!7832 (= mapRes!7832 (and tp!17120 e!128873))))

(declare-fun mapKey!7832 () (_ BitVec 32))

(declare-fun mapRest!7832 () (Array (_ BitVec 32) ValueCell!1913))

(declare-fun mapValue!7832 () ValueCell!1913)

(assert (=> mapNonEmpty!7832 (= mapRest!7823 (store mapRest!7832 mapKey!7832 mapValue!7832))))

(declare-fun mapIsEmpty!7832 () Bool)

(assert (=> mapIsEmpty!7832 mapRes!7832))

(declare-fun condMapEmpty!7832 () Bool)

(declare-fun mapDefault!7832 () ValueCell!1913)

(assert (=> mapNonEmpty!7823 (= condMapEmpty!7832 (= mapRest!7823 ((as const (Array (_ BitVec 32) ValueCell!1913)) mapDefault!7832)))))

(declare-fun e!128874 () Bool)

(assert (=> mapNonEmpty!7823 (= tp!17111 (and e!128874 mapRes!7832))))

(declare-fun b!195824 () Bool)

(assert (=> b!195824 (= e!128873 tp_is_empty!4513)))

(declare-fun b!195825 () Bool)

(assert (=> b!195825 (= e!128874 tp_is_empty!4513)))

(assert (= (and mapNonEmpty!7823 condMapEmpty!7832) mapIsEmpty!7832))

(assert (= (and mapNonEmpty!7823 (not condMapEmpty!7832)) mapNonEmpty!7832))

(assert (= (and mapNonEmpty!7832 ((_ is ValueCellFull!1913) mapValue!7832)) b!195824))

(assert (= (and mapNonEmpty!7823 ((_ is ValueCellFull!1913) mapDefault!7832)) b!195825))

(declare-fun m!223481 () Bool)

(assert (=> mapNonEmpty!7832 m!223481))

(check-sat (not mapNonEmpty!7832) tp_is_empty!4513)
(check-sat)
