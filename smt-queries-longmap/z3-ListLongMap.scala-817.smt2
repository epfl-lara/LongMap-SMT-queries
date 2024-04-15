; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19958 () Bool)

(assert start!19958)

(declare-fun b!195596 () Bool)

(declare-fun e!128709 () Bool)

(declare-fun tp_is_empty!4513 () Bool)

(assert (=> b!195596 (= e!128709 tp_is_empty!4513)))

(declare-fun res!92271 () Bool)

(declare-fun e!128710 () Bool)

(assert (=> start!19958 (=> (not res!92271) (not e!128710))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19958 (= res!92271 (validMask!0 mask!1149))))

(assert (=> start!19958 e!128710))

(assert (=> start!19958 true))

(declare-datatypes ((V!5665 0))(
  ( (V!5666 (val!2301 Int)) )
))
(declare-datatypes ((ValueCell!1913 0))(
  ( (ValueCellFull!1913 (v!4264 V!5665)) (EmptyCell!1913) )
))
(declare-datatypes ((array!8261 0))(
  ( (array!8262 (arr!3885 (Array (_ BitVec 32) ValueCell!1913)) (size!4211 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8261)

(declare-fun e!128712 () Bool)

(declare-fun array_inv!2519 (array!8261) Bool)

(assert (=> start!19958 (and (array_inv!2519 _values!649) e!128712)))

(declare-datatypes ((array!8263 0))(
  ( (array!8264 (arr!3886 (Array (_ BitVec 32) (_ BitVec 64))) (size!4212 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8263)

(declare-fun array_inv!2520 (array!8263) Bool)

(assert (=> start!19958 (array_inv!2520 _keys!825)))

(declare-fun b!195597 () Bool)

(declare-fun e!128713 () Bool)

(assert (=> b!195597 (= e!128713 tp_is_empty!4513)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun b!195598 () Bool)

(assert (=> b!195598 (= e!128710 (and (= (size!4211 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4212 _keys!825) (size!4211 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011) (= (size!4212 _keys!825) (bvadd #b00000000000000000000000000000001 mask!1149)) (bvsgt #b00000000000000000000000000000000 (size!4212 _keys!825))))))

(declare-fun b!195599 () Bool)

(declare-fun mapRes!7823 () Bool)

(assert (=> b!195599 (= e!128712 (and e!128709 mapRes!7823))))

(declare-fun condMapEmpty!7823 () Bool)

(declare-fun mapDefault!7823 () ValueCell!1913)

(assert (=> b!195599 (= condMapEmpty!7823 (= (arr!3885 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1913)) mapDefault!7823)))))

(declare-fun mapIsEmpty!7823 () Bool)

(assert (=> mapIsEmpty!7823 mapRes!7823))

(declare-fun mapNonEmpty!7823 () Bool)

(declare-fun tp!17111 () Bool)

(assert (=> mapNonEmpty!7823 (= mapRes!7823 (and tp!17111 e!128713))))

(declare-fun mapRest!7823 () (Array (_ BitVec 32) ValueCell!1913))

(declare-fun mapValue!7823 () ValueCell!1913)

(declare-fun mapKey!7823 () (_ BitVec 32))

(assert (=> mapNonEmpty!7823 (= (arr!3885 _values!649) (store mapRest!7823 mapKey!7823 mapValue!7823))))

(assert (= (and start!19958 res!92271) b!195598))

(assert (= (and b!195599 condMapEmpty!7823) mapIsEmpty!7823))

(assert (= (and b!195599 (not condMapEmpty!7823)) mapNonEmpty!7823))

(get-info :version)

(assert (= (and mapNonEmpty!7823 ((_ is ValueCellFull!1913) mapValue!7823)) b!195597))

(assert (= (and b!195599 ((_ is ValueCellFull!1913) mapDefault!7823)) b!195596))

(assert (= start!19958 b!195599))

(declare-fun m!222659 () Bool)

(assert (=> start!19958 m!222659))

(declare-fun m!222661 () Bool)

(assert (=> start!19958 m!222661))

(declare-fun m!222663 () Bool)

(assert (=> start!19958 m!222663))

(declare-fun m!222665 () Bool)

(assert (=> mapNonEmpty!7823 m!222665))

(check-sat (not start!19958) (not mapNonEmpty!7823) tp_is_empty!4513)
(check-sat)
(get-model)

(declare-fun d!57377 () Bool)

(assert (=> d!57377 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!19958 d!57377))

(declare-fun d!57379 () Bool)

(assert (=> d!57379 (= (array_inv!2519 _values!649) (bvsge (size!4211 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!19958 d!57379))

(declare-fun d!57381 () Bool)

(assert (=> d!57381 (= (array_inv!2520 _keys!825) (bvsge (size!4212 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!19958 d!57381))

(declare-fun mapNonEmpty!7832 () Bool)

(declare-fun mapRes!7832 () Bool)

(declare-fun tp!17120 () Bool)

(declare-fun e!128748 () Bool)

(assert (=> mapNonEmpty!7832 (= mapRes!7832 (and tp!17120 e!128748))))

(declare-fun mapKey!7832 () (_ BitVec 32))

(declare-fun mapRest!7832 () (Array (_ BitVec 32) ValueCell!1913))

(declare-fun mapValue!7832 () ValueCell!1913)

(assert (=> mapNonEmpty!7832 (= mapRest!7823 (store mapRest!7832 mapKey!7832 mapValue!7832))))

(declare-fun mapIsEmpty!7832 () Bool)

(assert (=> mapIsEmpty!7832 mapRes!7832))

(declare-fun condMapEmpty!7832 () Bool)

(declare-fun mapDefault!7832 () ValueCell!1913)

(assert (=> mapNonEmpty!7823 (= condMapEmpty!7832 (= mapRest!7823 ((as const (Array (_ BitVec 32) ValueCell!1913)) mapDefault!7832)))))

(declare-fun e!128749 () Bool)

(assert (=> mapNonEmpty!7823 (= tp!17111 (and e!128749 mapRes!7832))))

(declare-fun b!195630 () Bool)

(assert (=> b!195630 (= e!128748 tp_is_empty!4513)))

(declare-fun b!195631 () Bool)

(assert (=> b!195631 (= e!128749 tp_is_empty!4513)))

(assert (= (and mapNonEmpty!7823 condMapEmpty!7832) mapIsEmpty!7832))

(assert (= (and mapNonEmpty!7823 (not condMapEmpty!7832)) mapNonEmpty!7832))

(assert (= (and mapNonEmpty!7832 ((_ is ValueCellFull!1913) mapValue!7832)) b!195630))

(assert (= (and mapNonEmpty!7823 ((_ is ValueCellFull!1913) mapDefault!7832)) b!195631))

(declare-fun m!222683 () Bool)

(assert (=> mapNonEmpty!7832 m!222683))

(check-sat (not mapNonEmpty!7832) tp_is_empty!4513)
(check-sat)
