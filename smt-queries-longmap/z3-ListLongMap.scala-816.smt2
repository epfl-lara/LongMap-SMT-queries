; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19952 () Bool)

(assert start!19952)

(declare-fun b!195560 () Bool)

(declare-fun e!128668 () Bool)

(declare-fun e!128667 () Bool)

(declare-fun mapRes!7814 () Bool)

(assert (=> b!195560 (= e!128668 (and e!128667 mapRes!7814))))

(declare-fun condMapEmpty!7814 () Bool)

(declare-datatypes ((V!5657 0))(
  ( (V!5658 (val!2298 Int)) )
))
(declare-datatypes ((ValueCell!1910 0))(
  ( (ValueCellFull!1910 (v!4261 V!5657)) (EmptyCell!1910) )
))
(declare-datatypes ((array!8251 0))(
  ( (array!8252 (arr!3880 (Array (_ BitVec 32) ValueCell!1910)) (size!4206 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8251)

(declare-fun mapDefault!7814 () ValueCell!1910)

(assert (=> b!195560 (= condMapEmpty!7814 (= (arr!3880 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1910)) mapDefault!7814)))))

(declare-fun b!195561 () Bool)

(declare-fun e!128666 () Bool)

(declare-fun tp_is_empty!4507 () Bool)

(assert (=> b!195561 (= e!128666 tp_is_empty!4507)))

(declare-fun mapIsEmpty!7814 () Bool)

(assert (=> mapIsEmpty!7814 mapRes!7814))

(declare-fun mapNonEmpty!7814 () Bool)

(declare-fun tp!17102 () Bool)

(assert (=> mapNonEmpty!7814 (= mapRes!7814 (and tp!17102 e!128666))))

(declare-fun mapRest!7814 () (Array (_ BitVec 32) ValueCell!1910))

(declare-fun mapKey!7814 () (_ BitVec 32))

(declare-fun mapValue!7814 () ValueCell!1910)

(assert (=> mapNonEmpty!7814 (= (arr!3880 _values!649) (store mapRest!7814 mapKey!7814 mapValue!7814))))

(declare-fun b!195563 () Bool)

(assert (=> b!195563 (= e!128667 tp_is_empty!4507)))

(declare-fun res!92262 () Bool)

(declare-fun e!128664 () Bool)

(assert (=> start!19952 (=> (not res!92262) (not e!128664))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19952 (= res!92262 (validMask!0 mask!1149))))

(assert (=> start!19952 e!128664))

(assert (=> start!19952 true))

(declare-fun array_inv!2515 (array!8251) Bool)

(assert (=> start!19952 (and (array_inv!2515 _values!649) e!128668)))

(declare-datatypes ((array!8253 0))(
  ( (array!8254 (arr!3881 (Array (_ BitVec 32) (_ BitVec 64))) (size!4207 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8253)

(declare-fun array_inv!2516 (array!8253) Bool)

(assert (=> start!19952 (array_inv!2516 _keys!825)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun b!195562 () Bool)

(assert (=> b!195562 (= e!128664 (and (= (size!4206 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4207 _keys!825) (size!4206 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011) (not (= (size!4207 _keys!825) (bvadd #b00000000000000000000000000000001 mask!1149)))))))

(assert (= (and start!19952 res!92262) b!195562))

(assert (= (and b!195560 condMapEmpty!7814) mapIsEmpty!7814))

(assert (= (and b!195560 (not condMapEmpty!7814)) mapNonEmpty!7814))

(get-info :version)

(assert (= (and mapNonEmpty!7814 ((_ is ValueCellFull!1910) mapValue!7814)) b!195561))

(assert (= (and b!195560 ((_ is ValueCellFull!1910) mapDefault!7814)) b!195563))

(assert (= start!19952 b!195560))

(declare-fun m!222635 () Bool)

(assert (=> mapNonEmpty!7814 m!222635))

(declare-fun m!222637 () Bool)

(assert (=> start!19952 m!222637))

(declare-fun m!222639 () Bool)

(assert (=> start!19952 m!222639))

(declare-fun m!222641 () Bool)

(assert (=> start!19952 m!222641))

(check-sat (not start!19952) (not mapNonEmpty!7814) tp_is_empty!4507)
(check-sat)
