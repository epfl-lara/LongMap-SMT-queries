; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20150 () Bool)

(assert start!20150)

(declare-fun b_free!4809 () Bool)

(declare-fun b_next!4809 () Bool)

(assert (=> start!20150 (= b_free!4809 (not b_next!4809))))

(declare-fun tp!17458 () Bool)

(declare-fun b_and!11555 () Bool)

(assert (=> start!20150 (= tp!17458 b_and!11555)))

(declare-fun b!197684 () Bool)

(declare-fun e!130048 () Bool)

(declare-fun tp_is_empty!4665 () Bool)

(assert (=> b!197684 (= e!130048 tp_is_empty!4665)))

(declare-fun mapIsEmpty!8066 () Bool)

(declare-fun mapRes!8066 () Bool)

(assert (=> mapIsEmpty!8066 mapRes!8066))

(declare-fun b!197686 () Bool)

(declare-fun e!130049 () Bool)

(assert (=> b!197686 (= e!130049 false)))

(declare-datatypes ((V!5867 0))(
  ( (V!5868 (val!2377 Int)) )
))
(declare-datatypes ((ValueCell!1989 0))(
  ( (ValueCellFull!1989 (v!4347 V!5867)) (EmptyCell!1989) )
))
(declare-datatypes ((array!8583 0))(
  ( (array!8584 (arr!4042 (Array (_ BitVec 32) ValueCell!1989)) (size!4367 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8583)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!5867)

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8585 0))(
  ( (array!8586 (arr!4043 (Array (_ BitVec 32) (_ BitVec 64))) (size!4368 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8585)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5867)

(declare-fun zeroValue!615 () V!5867)

(declare-datatypes ((tuple2!3610 0))(
  ( (tuple2!3611 (_1!1816 (_ BitVec 64)) (_2!1816 V!5867)) )
))
(declare-datatypes ((List!2524 0))(
  ( (Nil!2521) (Cons!2520 (h!3162 tuple2!3610) (t!7455 List!2524)) )
))
(declare-datatypes ((ListLongMap!2523 0))(
  ( (ListLongMap!2524 (toList!1277 List!2524)) )
))
(declare-fun lt!97767 () ListLongMap!2523)

(declare-fun getCurrentListMapNoExtraKeys!242 (array!8585 array!8583 (_ BitVec 32) (_ BitVec 32) V!5867 V!5867 (_ BitVec 32) Int) ListLongMap!2523)

(assert (=> b!197686 (= lt!97767 (getCurrentListMapNoExtraKeys!242 _keys!825 (array!8584 (store (arr!4042 _values!649) i!601 (ValueCellFull!1989 v!520)) (size!4367 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97766 () ListLongMap!2523)

(assert (=> b!197686 (= lt!97766 (getCurrentListMapNoExtraKeys!242 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197687 () Bool)

(declare-fun e!130045 () Bool)

(assert (=> b!197687 (= e!130045 tp_is_empty!4665)))

(declare-fun mapNonEmpty!8066 () Bool)

(declare-fun tp!17459 () Bool)

(assert (=> mapNonEmpty!8066 (= mapRes!8066 (and tp!17459 e!130045))))

(declare-fun mapKey!8066 () (_ BitVec 32))

(declare-fun mapRest!8066 () (Array (_ BitVec 32) ValueCell!1989))

(declare-fun mapValue!8066 () ValueCell!1989)

(assert (=> mapNonEmpty!8066 (= (arr!4042 _values!649) (store mapRest!8066 mapKey!8066 mapValue!8066))))

(declare-fun b!197688 () Bool)

(declare-fun res!93561 () Bool)

(assert (=> b!197688 (=> (not res!93561) (not e!130049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8585 (_ BitVec 32)) Bool)

(assert (=> b!197688 (= res!93561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197689 () Bool)

(declare-fun res!93562 () Bool)

(assert (=> b!197689 (=> (not res!93562) (not e!130049))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197689 (= res!93562 (validKeyInArray!0 k0!843))))

(declare-fun b!197690 () Bool)

(declare-fun res!93560 () Bool)

(assert (=> b!197690 (=> (not res!93560) (not e!130049))))

(declare-datatypes ((List!2525 0))(
  ( (Nil!2522) (Cons!2521 (h!3163 (_ BitVec 64)) (t!7456 List!2525)) )
))
(declare-fun arrayNoDuplicates!0 (array!8585 (_ BitVec 32) List!2525) Bool)

(assert (=> b!197690 (= res!93560 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2522))))

(declare-fun b!197691 () Bool)

(declare-fun e!130047 () Bool)

(assert (=> b!197691 (= e!130047 (and e!130048 mapRes!8066))))

(declare-fun condMapEmpty!8066 () Bool)

(declare-fun mapDefault!8066 () ValueCell!1989)

(assert (=> b!197691 (= condMapEmpty!8066 (= (arr!4042 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1989)) mapDefault!8066)))))

(declare-fun res!93565 () Bool)

(assert (=> start!20150 (=> (not res!93565) (not e!130049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20150 (= res!93565 (validMask!0 mask!1149))))

(assert (=> start!20150 e!130049))

(declare-fun array_inv!2637 (array!8583) Bool)

(assert (=> start!20150 (and (array_inv!2637 _values!649) e!130047)))

(assert (=> start!20150 true))

(assert (=> start!20150 tp_is_empty!4665))

(declare-fun array_inv!2638 (array!8585) Bool)

(assert (=> start!20150 (array_inv!2638 _keys!825)))

(assert (=> start!20150 tp!17458))

(declare-fun b!197685 () Bool)

(declare-fun res!93563 () Bool)

(assert (=> b!197685 (=> (not res!93563) (not e!130049))))

(assert (=> b!197685 (= res!93563 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4368 _keys!825))))))

(declare-fun b!197692 () Bool)

(declare-fun res!93559 () Bool)

(assert (=> b!197692 (=> (not res!93559) (not e!130049))))

(assert (=> b!197692 (= res!93559 (and (= (size!4367 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4368 _keys!825) (size!4367 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197693 () Bool)

(declare-fun res!93564 () Bool)

(assert (=> b!197693 (=> (not res!93564) (not e!130049))))

(assert (=> b!197693 (= res!93564 (= (select (arr!4043 _keys!825) i!601) k0!843))))

(assert (= (and start!20150 res!93565) b!197692))

(assert (= (and b!197692 res!93559) b!197688))

(assert (= (and b!197688 res!93561) b!197690))

(assert (= (and b!197690 res!93560) b!197685))

(assert (= (and b!197685 res!93563) b!197689))

(assert (= (and b!197689 res!93562) b!197693))

(assert (= (and b!197693 res!93564) b!197686))

(assert (= (and b!197691 condMapEmpty!8066) mapIsEmpty!8066))

(assert (= (and b!197691 (not condMapEmpty!8066)) mapNonEmpty!8066))

(get-info :version)

(assert (= (and mapNonEmpty!8066 ((_ is ValueCellFull!1989) mapValue!8066)) b!197687))

(assert (= (and b!197691 ((_ is ValueCellFull!1989) mapDefault!8066)) b!197684))

(assert (= start!20150 b!197691))

(declare-fun m!224495 () Bool)

(assert (=> b!197690 m!224495))

(declare-fun m!224497 () Bool)

(assert (=> start!20150 m!224497))

(declare-fun m!224499 () Bool)

(assert (=> start!20150 m!224499))

(declare-fun m!224501 () Bool)

(assert (=> start!20150 m!224501))

(declare-fun m!224503 () Bool)

(assert (=> b!197688 m!224503))

(declare-fun m!224505 () Bool)

(assert (=> b!197693 m!224505))

(declare-fun m!224507 () Bool)

(assert (=> b!197689 m!224507))

(declare-fun m!224509 () Bool)

(assert (=> mapNonEmpty!8066 m!224509))

(declare-fun m!224511 () Bool)

(assert (=> b!197686 m!224511))

(declare-fun m!224513 () Bool)

(assert (=> b!197686 m!224513))

(declare-fun m!224515 () Bool)

(assert (=> b!197686 m!224515))

(check-sat (not b!197688) (not b_next!4809) tp_is_empty!4665 (not b!197689) (not mapNonEmpty!8066) (not b!197686) b_and!11555 (not start!20150) (not b!197690))
(check-sat b_and!11555 (not b_next!4809))
