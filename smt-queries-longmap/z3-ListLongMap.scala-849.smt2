; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20194 () Bool)

(assert start!20194)

(declare-fun b_free!4849 () Bool)

(declare-fun b_next!4849 () Bool)

(assert (=> start!20194 (= b_free!4849 (not b_next!4849))))

(declare-fun tp!17579 () Bool)

(declare-fun b_and!11609 () Bool)

(assert (=> start!20194 (= tp!17579 b_and!11609)))

(declare-fun res!94006 () Bool)

(declare-fun e!130373 () Bool)

(assert (=> start!20194 (=> (not res!94006) (not e!130373))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20194 (= res!94006 (validMask!0 mask!1149))))

(assert (=> start!20194 e!130373))

(declare-datatypes ((V!5921 0))(
  ( (V!5922 (val!2397 Int)) )
))
(declare-datatypes ((ValueCell!2009 0))(
  ( (ValueCellFull!2009 (v!4368 V!5921)) (EmptyCell!2009) )
))
(declare-datatypes ((array!8649 0))(
  ( (array!8650 (arr!4075 (Array (_ BitVec 32) ValueCell!2009)) (size!4400 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8649)

(declare-fun e!130372 () Bool)

(declare-fun array_inv!2657 (array!8649) Bool)

(assert (=> start!20194 (and (array_inv!2657 _values!649) e!130372)))

(assert (=> start!20194 true))

(declare-fun tp_is_empty!4705 () Bool)

(assert (=> start!20194 tp_is_empty!4705))

(declare-datatypes ((array!8651 0))(
  ( (array!8652 (arr!4076 (Array (_ BitVec 32) (_ BitVec 64))) (size!4401 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8651)

(declare-fun array_inv!2658 (array!8651) Bool)

(assert (=> start!20194 (array_inv!2658 _keys!825)))

(assert (=> start!20194 tp!17579))

(declare-fun mapIsEmpty!8126 () Bool)

(declare-fun mapRes!8126 () Bool)

(assert (=> mapIsEmpty!8126 mapRes!8126))

(declare-fun b!198331 () Bool)

(declare-fun res!94004 () Bool)

(assert (=> b!198331 (=> (not res!94004) (not e!130373))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198331 (= res!94004 (validKeyInArray!0 k0!843))))

(declare-fun b!198332 () Bool)

(declare-fun res!94000 () Bool)

(assert (=> b!198332 (=> (not res!94000) (not e!130373))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198332 (= res!94000 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4401 _keys!825))))))

(declare-fun mapNonEmpty!8126 () Bool)

(declare-fun tp!17578 () Bool)

(declare-fun e!130370 () Bool)

(assert (=> mapNonEmpty!8126 (= mapRes!8126 (and tp!17578 e!130370))))

(declare-fun mapValue!8126 () ValueCell!2009)

(declare-fun mapKey!8126 () (_ BitVec 32))

(declare-fun mapRest!8126 () (Array (_ BitVec 32) ValueCell!2009))

(assert (=> mapNonEmpty!8126 (= (arr!4075 _values!649) (store mapRest!8126 mapKey!8126 mapValue!8126))))

(declare-fun b!198333 () Bool)

(declare-fun res!94002 () Bool)

(assert (=> b!198333 (=> (not res!94002) (not e!130373))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!198333 (= res!94002 (and (= (size!4400 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4401 _keys!825) (size!4400 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198334 () Bool)

(declare-fun e!130369 () Bool)

(assert (=> b!198334 (= e!130369 tp_is_empty!4705)))

(declare-fun b!198335 () Bool)

(declare-fun res!94005 () Bool)

(assert (=> b!198335 (=> (not res!94005) (not e!130373))))

(assert (=> b!198335 (= res!94005 (= (select (arr!4076 _keys!825) i!601) k0!843))))

(declare-fun b!198336 () Bool)

(assert (=> b!198336 (= e!130372 (and e!130369 mapRes!8126))))

(declare-fun condMapEmpty!8126 () Bool)

(declare-fun mapDefault!8126 () ValueCell!2009)

(assert (=> b!198336 (= condMapEmpty!8126 (= (arr!4075 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2009)) mapDefault!8126)))))

(declare-fun b!198337 () Bool)

(declare-fun res!94003 () Bool)

(assert (=> b!198337 (=> (not res!94003) (not e!130373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8651 (_ BitVec 32)) Bool)

(assert (=> b!198337 (= res!94003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198338 () Bool)

(declare-fun res!94001 () Bool)

(assert (=> b!198338 (=> (not res!94001) (not e!130373))))

(declare-datatypes ((List!2502 0))(
  ( (Nil!2499) (Cons!2498 (h!3140 (_ BitVec 64)) (t!7425 List!2502)) )
))
(declare-fun arrayNoDuplicates!0 (array!8651 (_ BitVec 32) List!2502) Bool)

(assert (=> b!198338 (= res!94001 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2499))))

(declare-fun b!198339 () Bool)

(assert (=> b!198339 (= e!130373 false)))

(declare-datatypes ((tuple2!3582 0))(
  ( (tuple2!3583 (_1!1802 (_ BitVec 64)) (_2!1802 V!5921)) )
))
(declare-datatypes ((List!2503 0))(
  ( (Nil!2500) (Cons!2499 (h!3141 tuple2!3582) (t!7426 List!2503)) )
))
(declare-datatypes ((ListLongMap!2497 0))(
  ( (ListLongMap!2498 (toList!1264 List!2503)) )
))
(declare-fun lt!97946 () ListLongMap!2497)

(declare-fun v!520 () V!5921)

(declare-fun zeroValue!615 () V!5921)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5921)

(declare-fun getCurrentListMapNoExtraKeys!254 (array!8651 array!8649 (_ BitVec 32) (_ BitVec 32) V!5921 V!5921 (_ BitVec 32) Int) ListLongMap!2497)

(assert (=> b!198339 (= lt!97946 (getCurrentListMapNoExtraKeys!254 _keys!825 (array!8650 (store (arr!4075 _values!649) i!601 (ValueCellFull!2009 v!520)) (size!4400 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97945 () ListLongMap!2497)

(assert (=> b!198339 (= lt!97945 (getCurrentListMapNoExtraKeys!254 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198340 () Bool)

(assert (=> b!198340 (= e!130370 tp_is_empty!4705)))

(assert (= (and start!20194 res!94006) b!198333))

(assert (= (and b!198333 res!94002) b!198337))

(assert (= (and b!198337 res!94003) b!198338))

(assert (= (and b!198338 res!94001) b!198332))

(assert (= (and b!198332 res!94000) b!198331))

(assert (= (and b!198331 res!94004) b!198335))

(assert (= (and b!198335 res!94005) b!198339))

(assert (= (and b!198336 condMapEmpty!8126) mapIsEmpty!8126))

(assert (= (and b!198336 (not condMapEmpty!8126)) mapNonEmpty!8126))

(get-info :version)

(assert (= (and mapNonEmpty!8126 ((_ is ValueCellFull!2009) mapValue!8126)) b!198340))

(assert (= (and b!198336 ((_ is ValueCellFull!2009) mapDefault!8126)) b!198334))

(assert (= start!20194 b!198336))

(declare-fun m!225117 () Bool)

(assert (=> b!198337 m!225117))

(declare-fun m!225119 () Bool)

(assert (=> b!198335 m!225119))

(declare-fun m!225121 () Bool)

(assert (=> mapNonEmpty!8126 m!225121))

(declare-fun m!225123 () Bool)

(assert (=> b!198339 m!225123))

(declare-fun m!225125 () Bool)

(assert (=> b!198339 m!225125))

(declare-fun m!225127 () Bool)

(assert (=> b!198339 m!225127))

(declare-fun m!225129 () Bool)

(assert (=> start!20194 m!225129))

(declare-fun m!225131 () Bool)

(assert (=> start!20194 m!225131))

(declare-fun m!225133 () Bool)

(assert (=> start!20194 m!225133))

(declare-fun m!225135 () Bool)

(assert (=> b!198338 m!225135))

(declare-fun m!225137 () Bool)

(assert (=> b!198331 m!225137))

(check-sat (not b!198339) (not b!198331) (not b_next!4849) (not b!198337) (not mapNonEmpty!8126) (not start!20194) tp_is_empty!4705 b_and!11609 (not b!198338))
(check-sat b_and!11609 (not b_next!4849))
