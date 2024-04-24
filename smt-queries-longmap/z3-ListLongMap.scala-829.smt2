; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20074 () Bool)

(assert start!20074)

(declare-fun b!196568 () Bool)

(declare-fun res!92779 () Bool)

(declare-fun e!129470 () Bool)

(assert (=> b!196568 (=> (not res!92779) (not e!129470))))

(declare-datatypes ((array!8417 0))(
  ( (array!8418 (arr!3959 (Array (_ BitVec 32) (_ BitVec 64))) (size!4284 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8417)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5761 0))(
  ( (V!5762 (val!2337 Int)) )
))
(declare-datatypes ((ValueCell!1949 0))(
  ( (ValueCellFull!1949 (v!4308 V!5761)) (EmptyCell!1949) )
))
(declare-datatypes ((array!8419 0))(
  ( (array!8420 (arr!3960 (Array (_ BitVec 32) ValueCell!1949)) (size!4285 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8419)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!196568 (= res!92779 (and (= (size!4285 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4284 _keys!825) (size!4285 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!92778 () Bool)

(assert (=> start!20074 (=> (not res!92778) (not e!129470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20074 (= res!92778 (validMask!0 mask!1149))))

(assert (=> start!20074 e!129470))

(assert (=> start!20074 true))

(declare-fun e!129469 () Bool)

(declare-fun array_inv!2569 (array!8419) Bool)

(assert (=> start!20074 (and (array_inv!2569 _values!649) e!129469)))

(declare-fun array_inv!2570 (array!8417) Bool)

(assert (=> start!20074 (array_inv!2570 _keys!825)))

(declare-fun mapNonEmpty!7946 () Bool)

(declare-fun mapRes!7946 () Bool)

(declare-fun tp!17234 () Bool)

(declare-fun e!129471 () Bool)

(assert (=> mapNonEmpty!7946 (= mapRes!7946 (and tp!17234 e!129471))))

(declare-fun mapValue!7946 () ValueCell!1949)

(declare-fun mapRest!7946 () (Array (_ BitVec 32) ValueCell!1949))

(declare-fun mapKey!7946 () (_ BitVec 32))

(assert (=> mapNonEmpty!7946 (= (arr!3960 _values!649) (store mapRest!7946 mapKey!7946 mapValue!7946))))

(declare-fun b!196569 () Bool)

(declare-fun tp_is_empty!4585 () Bool)

(assert (=> b!196569 (= e!129471 tp_is_empty!4585)))

(declare-fun b!196570 () Bool)

(declare-fun e!129473 () Bool)

(assert (=> b!196570 (= e!129473 tp_is_empty!4585)))

(declare-fun b!196571 () Bool)

(assert (=> b!196571 (= e!129469 (and e!129473 mapRes!7946))))

(declare-fun condMapEmpty!7946 () Bool)

(declare-fun mapDefault!7946 () ValueCell!1949)

(assert (=> b!196571 (= condMapEmpty!7946 (= (arr!3960 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1949)) mapDefault!7946)))))

(declare-fun b!196572 () Bool)

(declare-fun res!92777 () Bool)

(assert (=> b!196572 (=> (not res!92777) (not e!129470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8417 (_ BitVec 32)) Bool)

(assert (=> b!196572 (= res!92777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!7946 () Bool)

(assert (=> mapIsEmpty!7946 mapRes!7946))

(declare-fun b!196573 () Bool)

(assert (=> b!196573 (= e!129470 false)))

(declare-fun lt!97691 () Bool)

(declare-datatypes ((List!2430 0))(
  ( (Nil!2427) (Cons!2426 (h!3068 (_ BitVec 64)) (t!7353 List!2430)) )
))
(declare-fun arrayNoDuplicates!0 (array!8417 (_ BitVec 32) List!2430) Bool)

(assert (=> b!196573 (= lt!97691 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2427))))

(assert (= (and start!20074 res!92778) b!196568))

(assert (= (and b!196568 res!92779) b!196572))

(assert (= (and b!196572 res!92777) b!196573))

(assert (= (and b!196571 condMapEmpty!7946) mapIsEmpty!7946))

(assert (= (and b!196571 (not condMapEmpty!7946)) mapNonEmpty!7946))

(get-info :version)

(assert (= (and mapNonEmpty!7946 ((_ is ValueCellFull!1949) mapValue!7946)) b!196569))

(assert (= (and b!196571 ((_ is ValueCellFull!1949) mapDefault!7946)) b!196570))

(assert (= start!20074 b!196571))

(declare-fun m!223953 () Bool)

(assert (=> start!20074 m!223953))

(declare-fun m!223955 () Bool)

(assert (=> start!20074 m!223955))

(declare-fun m!223957 () Bool)

(assert (=> start!20074 m!223957))

(declare-fun m!223959 () Bool)

(assert (=> mapNonEmpty!7946 m!223959))

(declare-fun m!223961 () Bool)

(assert (=> b!196572 m!223961))

(declare-fun m!223963 () Bool)

(assert (=> b!196573 m!223963))

(check-sat (not b!196573) tp_is_empty!4585 (not mapNonEmpty!7946) (not b!196572) (not start!20074))
(check-sat)
