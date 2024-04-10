; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19950 () Bool)

(assert start!19950)

(declare-datatypes ((array!8275 0))(
  ( (array!8276 (arr!3893 (Array (_ BitVec 32) (_ BitVec 64))) (size!4218 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8275)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun e!128781 () Bool)

(declare-fun b!195719 () Bool)

(declare-datatypes ((V!5659 0))(
  ( (V!5660 (val!2299 Int)) )
))
(declare-datatypes ((ValueCell!1911 0))(
  ( (ValueCellFull!1911 (v!4268 V!5659)) (EmptyCell!1911) )
))
(declare-datatypes ((array!8277 0))(
  ( (array!8278 (arr!3894 (Array (_ BitVec 32) ValueCell!1911)) (size!4219 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8277)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!195719 (= e!128781 (and (= (size!4219 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4218 _keys!825) (size!4219 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011) (not (= (size!4218 _keys!825) (bvadd #b00000000000000000000000000000001 mask!1149)))))))

(declare-fun mapIsEmpty!7817 () Bool)

(declare-fun mapRes!7817 () Bool)

(assert (=> mapIsEmpty!7817 mapRes!7817))

(declare-fun res!92360 () Bool)

(assert (=> start!19950 (=> (not res!92360) (not e!128781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19950 (= res!92360 (validMask!0 mask!1149))))

(assert (=> start!19950 e!128781))

(assert (=> start!19950 true))

(declare-fun e!128783 () Bool)

(declare-fun array_inv!2527 (array!8277) Bool)

(assert (=> start!19950 (and (array_inv!2527 _values!649) e!128783)))

(declare-fun array_inv!2528 (array!8275) Bool)

(assert (=> start!19950 (array_inv!2528 _keys!825)))

(declare-fun b!195720 () Bool)

(declare-fun e!128780 () Bool)

(assert (=> b!195720 (= e!128783 (and e!128780 mapRes!7817))))

(declare-fun condMapEmpty!7817 () Bool)

(declare-fun mapDefault!7817 () ValueCell!1911)

(assert (=> b!195720 (= condMapEmpty!7817 (= (arr!3894 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1911)) mapDefault!7817)))))

(declare-fun mapNonEmpty!7817 () Bool)

(declare-fun tp!17105 () Bool)

(declare-fun e!128784 () Bool)

(assert (=> mapNonEmpty!7817 (= mapRes!7817 (and tp!17105 e!128784))))

(declare-fun mapValue!7817 () ValueCell!1911)

(declare-fun mapKey!7817 () (_ BitVec 32))

(declare-fun mapRest!7817 () (Array (_ BitVec 32) ValueCell!1911))

(assert (=> mapNonEmpty!7817 (= (arr!3894 _values!649) (store mapRest!7817 mapKey!7817 mapValue!7817))))

(declare-fun b!195721 () Bool)

(declare-fun tp_is_empty!4509 () Bool)

(assert (=> b!195721 (= e!128780 tp_is_empty!4509)))

(declare-fun b!195722 () Bool)

(assert (=> b!195722 (= e!128784 tp_is_empty!4509)))

(assert (= (and start!19950 res!92360) b!195719))

(assert (= (and b!195720 condMapEmpty!7817) mapIsEmpty!7817))

(assert (= (and b!195720 (not condMapEmpty!7817)) mapNonEmpty!7817))

(get-info :version)

(assert (= (and mapNonEmpty!7817 ((_ is ValueCellFull!1911) mapValue!7817)) b!195722))

(assert (= (and b!195720 ((_ is ValueCellFull!1911) mapDefault!7817)) b!195721))

(assert (= start!19950 b!195720))

(declare-fun m!223259 () Bool)

(assert (=> start!19950 m!223259))

(declare-fun m!223261 () Bool)

(assert (=> start!19950 m!223261))

(declare-fun m!223263 () Bool)

(assert (=> start!19950 m!223263))

(declare-fun m!223265 () Bool)

(assert (=> mapNonEmpty!7817 m!223265))

(check-sat (not start!19950) (not mapNonEmpty!7817) tp_is_empty!4509)
(check-sat)
