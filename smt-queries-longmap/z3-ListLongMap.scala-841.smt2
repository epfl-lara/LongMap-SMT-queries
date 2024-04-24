; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20146 () Bool)

(assert start!20146)

(declare-fun b_free!4801 () Bool)

(declare-fun b_next!4801 () Bool)

(assert (=> start!20146 (= b_free!4801 (not b_next!4801))))

(declare-fun tp!17435 () Bool)

(declare-fun b_and!11561 () Bool)

(assert (=> start!20146 (= tp!17435 b_and!11561)))

(declare-fun b!197611 () Bool)

(declare-fun res!93497 () Bool)

(declare-fun e!130012 () Bool)

(assert (=> b!197611 (=> (not res!93497) (not e!130012))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8557 0))(
  ( (array!8558 (arr!4029 (Array (_ BitVec 32) (_ BitVec 64))) (size!4354 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8557)

(assert (=> b!197611 (= res!93497 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4354 _keys!825))))))

(declare-fun b!197612 () Bool)

(declare-fun res!93496 () Bool)

(assert (=> b!197612 (=> (not res!93496) (not e!130012))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8557 (_ BitVec 32)) Bool)

(assert (=> b!197612 (= res!93496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197614 () Bool)

(declare-fun res!93502 () Bool)

(assert (=> b!197614 (=> (not res!93502) (not e!130012))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197614 (= res!93502 (validKeyInArray!0 k0!843))))

(declare-fun b!197615 () Bool)

(declare-fun e!130009 () Bool)

(declare-fun e!130010 () Bool)

(declare-fun mapRes!8054 () Bool)

(assert (=> b!197615 (= e!130009 (and e!130010 mapRes!8054))))

(declare-fun condMapEmpty!8054 () Bool)

(declare-datatypes ((V!5857 0))(
  ( (V!5858 (val!2373 Int)) )
))
(declare-datatypes ((ValueCell!1985 0))(
  ( (ValueCellFull!1985 (v!4344 V!5857)) (EmptyCell!1985) )
))
(declare-datatypes ((array!8559 0))(
  ( (array!8560 (arr!4030 (Array (_ BitVec 32) ValueCell!1985)) (size!4355 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8559)

(declare-fun mapDefault!8054 () ValueCell!1985)

(assert (=> b!197615 (= condMapEmpty!8054 (= (arr!4030 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1985)) mapDefault!8054)))))

(declare-fun b!197616 () Bool)

(declare-fun res!93498 () Bool)

(assert (=> b!197616 (=> (not res!93498) (not e!130012))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197616 (= res!93498 (and (= (size!4355 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4354 _keys!825) (size!4355 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8054 () Bool)

(declare-fun tp!17434 () Bool)

(declare-fun e!130011 () Bool)

(assert (=> mapNonEmpty!8054 (= mapRes!8054 (and tp!17434 e!130011))))

(declare-fun mapValue!8054 () ValueCell!1985)

(declare-fun mapRest!8054 () (Array (_ BitVec 32) ValueCell!1985))

(declare-fun mapKey!8054 () (_ BitVec 32))

(assert (=> mapNonEmpty!8054 (= (arr!4030 _values!649) (store mapRest!8054 mapKey!8054 mapValue!8054))))

(declare-fun b!197617 () Bool)

(declare-fun tp_is_empty!4657 () Bool)

(assert (=> b!197617 (= e!130010 tp_is_empty!4657)))

(declare-fun b!197618 () Bool)

(declare-fun res!93499 () Bool)

(assert (=> b!197618 (=> (not res!93499) (not e!130012))))

(declare-datatypes ((List!2473 0))(
  ( (Nil!2470) (Cons!2469 (h!3111 (_ BitVec 64)) (t!7396 List!2473)) )
))
(declare-fun arrayNoDuplicates!0 (array!8557 (_ BitVec 32) List!2473) Bool)

(assert (=> b!197618 (= res!93499 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2470))))

(declare-fun mapIsEmpty!8054 () Bool)

(assert (=> mapIsEmpty!8054 mapRes!8054))

(declare-fun b!197619 () Bool)

(declare-fun res!93501 () Bool)

(assert (=> b!197619 (=> (not res!93501) (not e!130012))))

(assert (=> b!197619 (= res!93501 (= (select (arr!4029 _keys!825) i!601) k0!843))))

(declare-fun b!197620 () Bool)

(assert (=> b!197620 (= e!130012 false)))

(declare-fun v!520 () V!5857)

(declare-fun zeroValue!615 () V!5857)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5857)

(declare-datatypes ((tuple2!3556 0))(
  ( (tuple2!3557 (_1!1789 (_ BitVec 64)) (_2!1789 V!5857)) )
))
(declare-datatypes ((List!2474 0))(
  ( (Nil!2471) (Cons!2470 (h!3112 tuple2!3556) (t!7397 List!2474)) )
))
(declare-datatypes ((ListLongMap!2471 0))(
  ( (ListLongMap!2472 (toList!1251 List!2474)) )
))
(declare-fun lt!97801 () ListLongMap!2471)

(declare-fun getCurrentListMapNoExtraKeys!241 (array!8557 array!8559 (_ BitVec 32) (_ BitVec 32) V!5857 V!5857 (_ BitVec 32) Int) ListLongMap!2471)

(assert (=> b!197620 (= lt!97801 (getCurrentListMapNoExtraKeys!241 _keys!825 (array!8560 (store (arr!4030 _values!649) i!601 (ValueCellFull!1985 v!520)) (size!4355 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97802 () ListLongMap!2471)

(assert (=> b!197620 (= lt!97802 (getCurrentListMapNoExtraKeys!241 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!93500 () Bool)

(assert (=> start!20146 (=> (not res!93500) (not e!130012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20146 (= res!93500 (validMask!0 mask!1149))))

(assert (=> start!20146 e!130012))

(declare-fun array_inv!2625 (array!8559) Bool)

(assert (=> start!20146 (and (array_inv!2625 _values!649) e!130009)))

(assert (=> start!20146 true))

(assert (=> start!20146 tp_is_empty!4657))

(declare-fun array_inv!2626 (array!8557) Bool)

(assert (=> start!20146 (array_inv!2626 _keys!825)))

(assert (=> start!20146 tp!17435))

(declare-fun b!197613 () Bool)

(assert (=> b!197613 (= e!130011 tp_is_empty!4657)))

(assert (= (and start!20146 res!93500) b!197616))

(assert (= (and b!197616 res!93498) b!197612))

(assert (= (and b!197612 res!93496) b!197618))

(assert (= (and b!197618 res!93499) b!197611))

(assert (= (and b!197611 res!93497) b!197614))

(assert (= (and b!197614 res!93502) b!197619))

(assert (= (and b!197619 res!93501) b!197620))

(assert (= (and b!197615 condMapEmpty!8054) mapIsEmpty!8054))

(assert (= (and b!197615 (not condMapEmpty!8054)) mapNonEmpty!8054))

(get-info :version)

(assert (= (and mapNonEmpty!8054 ((_ is ValueCellFull!1985) mapValue!8054)) b!197613))

(assert (= (and b!197615 ((_ is ValueCellFull!1985) mapDefault!8054)) b!197617))

(assert (= start!20146 b!197615))

(declare-fun m!224589 () Bool)

(assert (=> start!20146 m!224589))

(declare-fun m!224591 () Bool)

(assert (=> start!20146 m!224591))

(declare-fun m!224593 () Bool)

(assert (=> start!20146 m!224593))

(declare-fun m!224595 () Bool)

(assert (=> b!197614 m!224595))

(declare-fun m!224597 () Bool)

(assert (=> mapNonEmpty!8054 m!224597))

(declare-fun m!224599 () Bool)

(assert (=> b!197619 m!224599))

(declare-fun m!224601 () Bool)

(assert (=> b!197620 m!224601))

(declare-fun m!224603 () Bool)

(assert (=> b!197620 m!224603))

(declare-fun m!224605 () Bool)

(assert (=> b!197620 m!224605))

(declare-fun m!224607 () Bool)

(assert (=> b!197618 m!224607))

(declare-fun m!224609 () Bool)

(assert (=> b!197612 m!224609))

(check-sat (not b!197620) b_and!11561 (not b!197618) (not mapNonEmpty!8054) (not b!197612) (not start!20146) tp_is_empty!4657 (not b_next!4801) (not b!197614))
(check-sat b_and!11561 (not b_next!4801))
