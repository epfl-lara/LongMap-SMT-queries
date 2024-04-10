; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20156 () Bool)

(assert start!20156)

(declare-fun b_free!4815 () Bool)

(declare-fun b_next!4815 () Bool)

(assert (=> start!20156 (= b_free!4815 (not b_next!4815))))

(declare-fun tp!17477 () Bool)

(declare-fun b_and!11561 () Bool)

(assert (=> start!20156 (= tp!17477 b_and!11561)))

(declare-fun b!197774 () Bool)

(declare-fun res!93623 () Bool)

(declare-fun e!130092 () Bool)

(assert (=> b!197774 (=> (not res!93623) (not e!130092))))

(declare-datatypes ((array!8595 0))(
  ( (array!8596 (arr!4048 (Array (_ BitVec 32) (_ BitVec 64))) (size!4373 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8595)

(declare-datatypes ((List!2528 0))(
  ( (Nil!2525) (Cons!2524 (h!3166 (_ BitVec 64)) (t!7459 List!2528)) )
))
(declare-fun arrayNoDuplicates!0 (array!8595 (_ BitVec 32) List!2528) Bool)

(assert (=> b!197774 (= res!93623 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2525))))

(declare-fun b!197775 () Bool)

(declare-fun e!130091 () Bool)

(declare-fun e!130094 () Bool)

(declare-fun mapRes!8075 () Bool)

(assert (=> b!197775 (= e!130091 (and e!130094 mapRes!8075))))

(declare-fun condMapEmpty!8075 () Bool)

(declare-datatypes ((V!5875 0))(
  ( (V!5876 (val!2380 Int)) )
))
(declare-datatypes ((ValueCell!1992 0))(
  ( (ValueCellFull!1992 (v!4350 V!5875)) (EmptyCell!1992) )
))
(declare-datatypes ((array!8597 0))(
  ( (array!8598 (arr!4049 (Array (_ BitVec 32) ValueCell!1992)) (size!4374 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8597)

(declare-fun mapDefault!8075 () ValueCell!1992)

(assert (=> b!197775 (= condMapEmpty!8075 (= (arr!4049 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1992)) mapDefault!8075)))))

(declare-fun mapIsEmpty!8075 () Bool)

(assert (=> mapIsEmpty!8075 mapRes!8075))

(declare-fun b!197777 () Bool)

(declare-fun tp_is_empty!4671 () Bool)

(assert (=> b!197777 (= e!130094 tp_is_empty!4671)))

(declare-fun b!197778 () Bool)

(declare-fun res!93627 () Bool)

(assert (=> b!197778 (=> (not res!93627) (not e!130092))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197778 (= res!93627 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4373 _keys!825))))))

(declare-fun b!197779 () Bool)

(declare-fun res!93622 () Bool)

(assert (=> b!197779 (=> (not res!93622) (not e!130092))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8595 (_ BitVec 32)) Bool)

(assert (=> b!197779 (= res!93622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8075 () Bool)

(declare-fun tp!17476 () Bool)

(declare-fun e!130093 () Bool)

(assert (=> mapNonEmpty!8075 (= mapRes!8075 (and tp!17476 e!130093))))

(declare-fun mapValue!8075 () ValueCell!1992)

(declare-fun mapRest!8075 () (Array (_ BitVec 32) ValueCell!1992))

(declare-fun mapKey!8075 () (_ BitVec 32))

(assert (=> mapNonEmpty!8075 (= (arr!4049 _values!649) (store mapRest!8075 mapKey!8075 mapValue!8075))))

(declare-fun b!197780 () Bool)

(declare-fun res!93626 () Bool)

(assert (=> b!197780 (=> (not res!93626) (not e!130092))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197780 (= res!93626 (and (= (size!4374 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4373 _keys!825) (size!4374 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197781 () Bool)

(assert (=> b!197781 (= e!130092 false)))

(declare-fun v!520 () V!5875)

(declare-fun zeroValue!615 () V!5875)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5875)

(declare-datatypes ((tuple2!3614 0))(
  ( (tuple2!3615 (_1!1818 (_ BitVec 64)) (_2!1818 V!5875)) )
))
(declare-datatypes ((List!2529 0))(
  ( (Nil!2526) (Cons!2525 (h!3167 tuple2!3614) (t!7460 List!2529)) )
))
(declare-datatypes ((ListLongMap!2527 0))(
  ( (ListLongMap!2528 (toList!1279 List!2529)) )
))
(declare-fun lt!97784 () ListLongMap!2527)

(declare-fun getCurrentListMapNoExtraKeys!244 (array!8595 array!8597 (_ BitVec 32) (_ BitVec 32) V!5875 V!5875 (_ BitVec 32) Int) ListLongMap!2527)

(assert (=> b!197781 (= lt!97784 (getCurrentListMapNoExtraKeys!244 _keys!825 (array!8598 (store (arr!4049 _values!649) i!601 (ValueCellFull!1992 v!520)) (size!4374 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97785 () ListLongMap!2527)

(assert (=> b!197781 (= lt!97785 (getCurrentListMapNoExtraKeys!244 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197776 () Bool)

(declare-fun res!93625 () Bool)

(assert (=> b!197776 (=> (not res!93625) (not e!130092))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197776 (= res!93625 (validKeyInArray!0 k0!843))))

(declare-fun res!93624 () Bool)

(assert (=> start!20156 (=> (not res!93624) (not e!130092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20156 (= res!93624 (validMask!0 mask!1149))))

(assert (=> start!20156 e!130092))

(declare-fun array_inv!2643 (array!8597) Bool)

(assert (=> start!20156 (and (array_inv!2643 _values!649) e!130091)))

(assert (=> start!20156 true))

(assert (=> start!20156 tp_is_empty!4671))

(declare-fun array_inv!2644 (array!8595) Bool)

(assert (=> start!20156 (array_inv!2644 _keys!825)))

(assert (=> start!20156 tp!17477))

(declare-fun b!197782 () Bool)

(declare-fun res!93628 () Bool)

(assert (=> b!197782 (=> (not res!93628) (not e!130092))))

(assert (=> b!197782 (= res!93628 (= (select (arr!4048 _keys!825) i!601) k0!843))))

(declare-fun b!197783 () Bool)

(assert (=> b!197783 (= e!130093 tp_is_empty!4671)))

(assert (= (and start!20156 res!93624) b!197780))

(assert (= (and b!197780 res!93626) b!197779))

(assert (= (and b!197779 res!93622) b!197774))

(assert (= (and b!197774 res!93623) b!197778))

(assert (= (and b!197778 res!93627) b!197776))

(assert (= (and b!197776 res!93625) b!197782))

(assert (= (and b!197782 res!93628) b!197781))

(assert (= (and b!197775 condMapEmpty!8075) mapIsEmpty!8075))

(assert (= (and b!197775 (not condMapEmpty!8075)) mapNonEmpty!8075))

(get-info :version)

(assert (= (and mapNonEmpty!8075 ((_ is ValueCellFull!1992) mapValue!8075)) b!197783))

(assert (= (and b!197775 ((_ is ValueCellFull!1992) mapDefault!8075)) b!197777))

(assert (= start!20156 b!197775))

(declare-fun m!224561 () Bool)

(assert (=> b!197781 m!224561))

(declare-fun m!224563 () Bool)

(assert (=> b!197781 m!224563))

(declare-fun m!224565 () Bool)

(assert (=> b!197781 m!224565))

(declare-fun m!224567 () Bool)

(assert (=> b!197774 m!224567))

(declare-fun m!224569 () Bool)

(assert (=> b!197782 m!224569))

(declare-fun m!224571 () Bool)

(assert (=> b!197776 m!224571))

(declare-fun m!224573 () Bool)

(assert (=> b!197779 m!224573))

(declare-fun m!224575 () Bool)

(assert (=> mapNonEmpty!8075 m!224575))

(declare-fun m!224577 () Bool)

(assert (=> start!20156 m!224577))

(declare-fun m!224579 () Bool)

(assert (=> start!20156 m!224579))

(declare-fun m!224581 () Bool)

(assert (=> start!20156 m!224581))

(check-sat (not b!197781) (not mapNonEmpty!8075) (not b!197779) (not b!197774) (not b!197776) (not start!20156) (not b_next!4815) b_and!11561 tp_is_empty!4671)
(check-sat b_and!11561 (not b_next!4815))
