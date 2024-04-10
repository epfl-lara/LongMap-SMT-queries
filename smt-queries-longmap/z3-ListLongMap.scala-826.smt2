; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20054 () Bool)

(assert start!20054)

(declare-fun mapIsEmpty!7922 () Bool)

(declare-fun mapRes!7922 () Bool)

(assert (=> mapIsEmpty!7922 mapRes!7922))

(declare-fun b!196377 () Bool)

(declare-fun e!129328 () Bool)

(declare-fun e!129326 () Bool)

(assert (=> b!196377 (= e!129328 (and e!129326 mapRes!7922))))

(declare-fun condMapEmpty!7922 () Bool)

(declare-datatypes ((V!5739 0))(
  ( (V!5740 (val!2329 Int)) )
))
(declare-datatypes ((ValueCell!1941 0))(
  ( (ValueCellFull!1941 (v!4299 V!5739)) (EmptyCell!1941) )
))
(declare-datatypes ((array!8395 0))(
  ( (array!8396 (arr!3948 (Array (_ BitVec 32) ValueCell!1941)) (size!4273 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8395)

(declare-fun mapDefault!7922 () ValueCell!1941)

(assert (=> b!196377 (= condMapEmpty!7922 (= (arr!3948 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1941)) mapDefault!7922)))))

(declare-fun b!196378 () Bool)

(declare-fun res!92684 () Bool)

(declare-fun e!129329 () Bool)

(assert (=> b!196378 (=> (not res!92684) (not e!129329))))

(declare-datatypes ((array!8397 0))(
  ( (array!8398 (arr!3949 (Array (_ BitVec 32) (_ BitVec 64))) (size!4274 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8397)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!196378 (= res!92684 (and (= (size!4273 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4274 _keys!825) (size!4273 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196379 () Bool)

(declare-fun tp_is_empty!4569 () Bool)

(assert (=> b!196379 (= e!129326 tp_is_empty!4569)))

(declare-fun res!92685 () Bool)

(assert (=> start!20054 (=> (not res!92685) (not e!129329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20054 (= res!92685 (validMask!0 mask!1149))))

(assert (=> start!20054 e!129329))

(assert (=> start!20054 true))

(declare-fun array_inv!2567 (array!8395) Bool)

(assert (=> start!20054 (and (array_inv!2567 _values!649) e!129328)))

(declare-fun array_inv!2568 (array!8397) Bool)

(assert (=> start!20054 (array_inv!2568 _keys!825)))

(declare-fun b!196380 () Bool)

(assert (=> b!196380 (= e!129329 false)))

(declare-fun lt!97608 () Bool)

(declare-datatypes ((List!2469 0))(
  ( (Nil!2466) (Cons!2465 (h!3107 (_ BitVec 64)) (t!7400 List!2469)) )
))
(declare-fun arrayNoDuplicates!0 (array!8397 (_ BitVec 32) List!2469) Bool)

(assert (=> b!196380 (= lt!97608 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2466))))

(declare-fun b!196381 () Bool)

(declare-fun res!92686 () Bool)

(assert (=> b!196381 (=> (not res!92686) (not e!129329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8397 (_ BitVec 32)) Bool)

(assert (=> b!196381 (= res!92686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196382 () Bool)

(declare-fun e!129325 () Bool)

(assert (=> b!196382 (= e!129325 tp_is_empty!4569)))

(declare-fun mapNonEmpty!7922 () Bool)

(declare-fun tp!17210 () Bool)

(assert (=> mapNonEmpty!7922 (= mapRes!7922 (and tp!17210 e!129325))))

(declare-fun mapRest!7922 () (Array (_ BitVec 32) ValueCell!1941))

(declare-fun mapKey!7922 () (_ BitVec 32))

(declare-fun mapValue!7922 () ValueCell!1941)

(assert (=> mapNonEmpty!7922 (= (arr!3948 _values!649) (store mapRest!7922 mapKey!7922 mapValue!7922))))

(assert (= (and start!20054 res!92685) b!196378))

(assert (= (and b!196378 res!92684) b!196381))

(assert (= (and b!196381 res!92686) b!196380))

(assert (= (and b!196377 condMapEmpty!7922) mapIsEmpty!7922))

(assert (= (and b!196377 (not condMapEmpty!7922)) mapNonEmpty!7922))

(get-info :version)

(assert (= (and mapNonEmpty!7922 ((_ is ValueCellFull!1941) mapValue!7922)) b!196382))

(assert (= (and b!196377 ((_ is ValueCellFull!1941) mapDefault!7922)) b!196379))

(assert (= start!20054 b!196377))

(declare-fun m!223675 () Bool)

(assert (=> start!20054 m!223675))

(declare-fun m!223677 () Bool)

(assert (=> start!20054 m!223677))

(declare-fun m!223679 () Bool)

(assert (=> start!20054 m!223679))

(declare-fun m!223681 () Bool)

(assert (=> b!196380 m!223681))

(declare-fun m!223683 () Bool)

(assert (=> b!196381 m!223683))

(declare-fun m!223685 () Bool)

(assert (=> mapNonEmpty!7922 m!223685))

(check-sat (not mapNonEmpty!7922) (not start!20054) (not b!196380) (not b!196381) tp_is_empty!4569)
(check-sat)
