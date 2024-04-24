; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19952 () Bool)

(assert start!19952)

(declare-fun res!92378 () Bool)

(declare-fun e!128791 () Bool)

(assert (=> start!19952 (=> (not res!92378) (not e!128791))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19952 (= res!92378 (validMask!0 mask!1149))))

(assert (=> start!19952 e!128791))

(assert (=> start!19952 true))

(declare-datatypes ((V!5657 0))(
  ( (V!5658 (val!2298 Int)) )
))
(declare-datatypes ((ValueCell!1910 0))(
  ( (ValueCellFull!1910 (v!4268 V!5657)) (EmptyCell!1910) )
))
(declare-datatypes ((array!8257 0))(
  ( (array!8258 (arr!3884 (Array (_ BitVec 32) ValueCell!1910)) (size!4209 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8257)

(declare-fun e!128789 () Bool)

(declare-fun array_inv!2511 (array!8257) Bool)

(assert (=> start!19952 (and (array_inv!2511 _values!649) e!128789)))

(declare-datatypes ((array!8259 0))(
  ( (array!8260 (arr!3885 (Array (_ BitVec 32) (_ BitVec 64))) (size!4210 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8259)

(declare-fun array_inv!2512 (array!8259) Bool)

(assert (=> start!19952 (array_inv!2512 _keys!825)))

(declare-fun mapNonEmpty!7814 () Bool)

(declare-fun mapRes!7814 () Bool)

(declare-fun tp!17102 () Bool)

(declare-fun e!128792 () Bool)

(assert (=> mapNonEmpty!7814 (= mapRes!7814 (and tp!17102 e!128792))))

(declare-fun mapKey!7814 () (_ BitVec 32))

(declare-fun mapRest!7814 () (Array (_ BitVec 32) ValueCell!1910))

(declare-fun mapValue!7814 () ValueCell!1910)

(assert (=> mapNonEmpty!7814 (= (arr!3884 _values!649) (store mapRest!7814 mapKey!7814 mapValue!7814))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun b!195754 () Bool)

(assert (=> b!195754 (= e!128791 (and (= (size!4209 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4210 _keys!825) (size!4209 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011) (not (= (size!4210 _keys!825) (bvadd #b00000000000000000000000000000001 mask!1149)))))))

(declare-fun b!195755 () Bool)

(declare-fun e!128790 () Bool)

(declare-fun tp_is_empty!4507 () Bool)

(assert (=> b!195755 (= e!128790 tp_is_empty!4507)))

(declare-fun mapIsEmpty!7814 () Bool)

(assert (=> mapIsEmpty!7814 mapRes!7814))

(declare-fun b!195756 () Bool)

(assert (=> b!195756 (= e!128789 (and e!128790 mapRes!7814))))

(declare-fun condMapEmpty!7814 () Bool)

(declare-fun mapDefault!7814 () ValueCell!1910)

(assert (=> b!195756 (= condMapEmpty!7814 (= (arr!3884 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1910)) mapDefault!7814)))))

(declare-fun b!195757 () Bool)

(assert (=> b!195757 (= e!128792 tp_is_empty!4507)))

(assert (= (and start!19952 res!92378) b!195754))

(assert (= (and b!195756 condMapEmpty!7814) mapIsEmpty!7814))

(assert (= (and b!195756 (not condMapEmpty!7814)) mapNonEmpty!7814))

(get-info :version)

(assert (= (and mapNonEmpty!7814 ((_ is ValueCellFull!1910) mapValue!7814)) b!195757))

(assert (= (and b!195756 ((_ is ValueCellFull!1910) mapDefault!7814)) b!195755))

(assert (= start!19952 b!195756))

(declare-fun m!223433 () Bool)

(assert (=> start!19952 m!223433))

(declare-fun m!223435 () Bool)

(assert (=> start!19952 m!223435))

(declare-fun m!223437 () Bool)

(assert (=> start!19952 m!223437))

(declare-fun m!223439 () Bool)

(assert (=> mapNonEmpty!7814 m!223439))

(check-sat (not start!19952) (not mapNonEmpty!7814) tp_is_empty!4507)
(check-sat)
