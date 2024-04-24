; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20158 () Bool)

(assert start!20158)

(declare-fun b_free!4813 () Bool)

(declare-fun b_next!4813 () Bool)

(assert (=> start!20158 (= b_free!4813 (not b_next!4813))))

(declare-fun tp!17471 () Bool)

(declare-fun b_and!11573 () Bool)

(assert (=> start!20158 (= tp!17471 b_and!11573)))

(declare-fun mapIsEmpty!8072 () Bool)

(declare-fun mapRes!8072 () Bool)

(assert (=> mapIsEmpty!8072 mapRes!8072))

(declare-fun b!197791 () Bool)

(declare-fun res!93623 () Bool)

(declare-fun e!130103 () Bool)

(assert (=> b!197791 (=> (not res!93623) (not e!130103))))

(declare-datatypes ((array!8579 0))(
  ( (array!8580 (arr!4040 (Array (_ BitVec 32) (_ BitVec 64))) (size!4365 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8579)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197791 (= res!93623 (= (select (arr!4040 _keys!825) i!601) k0!843))))

(declare-fun b!197793 () Bool)

(declare-fun res!93625 () Bool)

(assert (=> b!197793 (=> (not res!93625) (not e!130103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197793 (= res!93625 (validKeyInArray!0 k0!843))))

(declare-fun b!197794 () Bool)

(declare-fun res!93622 () Bool)

(assert (=> b!197794 (=> (not res!93622) (not e!130103))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8579 (_ BitVec 32)) Bool)

(assert (=> b!197794 (= res!93622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197795 () Bool)

(declare-fun e!130101 () Bool)

(declare-fun tp_is_empty!4669 () Bool)

(assert (=> b!197795 (= e!130101 tp_is_empty!4669)))

(declare-fun b!197796 () Bool)

(declare-fun e!130102 () Bool)

(declare-fun e!130100 () Bool)

(assert (=> b!197796 (= e!130102 (and e!130100 mapRes!8072))))

(declare-fun condMapEmpty!8072 () Bool)

(declare-datatypes ((V!5873 0))(
  ( (V!5874 (val!2379 Int)) )
))
(declare-datatypes ((ValueCell!1991 0))(
  ( (ValueCellFull!1991 (v!4350 V!5873)) (EmptyCell!1991) )
))
(declare-datatypes ((array!8581 0))(
  ( (array!8582 (arr!4041 (Array (_ BitVec 32) ValueCell!1991)) (size!4366 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8581)

(declare-fun mapDefault!8072 () ValueCell!1991)

(assert (=> b!197796 (= condMapEmpty!8072 (= (arr!4041 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1991)) mapDefault!8072)))))

(declare-fun mapNonEmpty!8072 () Bool)

(declare-fun tp!17470 () Bool)

(assert (=> mapNonEmpty!8072 (= mapRes!8072 (and tp!17470 e!130101))))

(declare-fun mapKey!8072 () (_ BitVec 32))

(declare-fun mapRest!8072 () (Array (_ BitVec 32) ValueCell!1991))

(declare-fun mapValue!8072 () ValueCell!1991)

(assert (=> mapNonEmpty!8072 (= (arr!4041 _values!649) (store mapRest!8072 mapKey!8072 mapValue!8072))))

(declare-fun b!197792 () Bool)

(declare-fun res!93624 () Bool)

(assert (=> b!197792 (=> (not res!93624) (not e!130103))))

(declare-datatypes ((List!2478 0))(
  ( (Nil!2475) (Cons!2474 (h!3116 (_ BitVec 64)) (t!7401 List!2478)) )
))
(declare-fun arrayNoDuplicates!0 (array!8579 (_ BitVec 32) List!2478) Bool)

(assert (=> b!197792 (= res!93624 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2475))))

(declare-fun res!93626 () Bool)

(assert (=> start!20158 (=> (not res!93626) (not e!130103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20158 (= res!93626 (validMask!0 mask!1149))))

(assert (=> start!20158 e!130103))

(declare-fun array_inv!2631 (array!8581) Bool)

(assert (=> start!20158 (and (array_inv!2631 _values!649) e!130102)))

(assert (=> start!20158 true))

(assert (=> start!20158 tp_is_empty!4669))

(declare-fun array_inv!2632 (array!8579) Bool)

(assert (=> start!20158 (array_inv!2632 _keys!825)))

(assert (=> start!20158 tp!17471))

(declare-fun b!197797 () Bool)

(declare-fun res!93628 () Bool)

(assert (=> b!197797 (=> (not res!93628) (not e!130103))))

(assert (=> b!197797 (= res!93628 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4365 _keys!825))))))

(declare-fun b!197798 () Bool)

(assert (=> b!197798 (= e!130103 false)))

(declare-datatypes ((tuple2!3560 0))(
  ( (tuple2!3561 (_1!1791 (_ BitVec 64)) (_2!1791 V!5873)) )
))
(declare-datatypes ((List!2479 0))(
  ( (Nil!2476) (Cons!2475 (h!3117 tuple2!3560) (t!7402 List!2479)) )
))
(declare-datatypes ((ListLongMap!2475 0))(
  ( (ListLongMap!2476 (toList!1253 List!2479)) )
))
(declare-fun lt!97838 () ListLongMap!2475)

(declare-fun v!520 () V!5873)

(declare-fun zeroValue!615 () V!5873)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5873)

(declare-fun getCurrentListMapNoExtraKeys!243 (array!8579 array!8581 (_ BitVec 32) (_ BitVec 32) V!5873 V!5873 (_ BitVec 32) Int) ListLongMap!2475)

(assert (=> b!197798 (= lt!97838 (getCurrentListMapNoExtraKeys!243 _keys!825 (array!8582 (store (arr!4041 _values!649) i!601 (ValueCellFull!1991 v!520)) (size!4366 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97837 () ListLongMap!2475)

(assert (=> b!197798 (= lt!97837 (getCurrentListMapNoExtraKeys!243 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197799 () Bool)

(declare-fun res!93627 () Bool)

(assert (=> b!197799 (=> (not res!93627) (not e!130103))))

(assert (=> b!197799 (= res!93627 (and (= (size!4366 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4365 _keys!825) (size!4366 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197800 () Bool)

(assert (=> b!197800 (= e!130100 tp_is_empty!4669)))

(assert (= (and start!20158 res!93626) b!197799))

(assert (= (and b!197799 res!93627) b!197794))

(assert (= (and b!197794 res!93622) b!197792))

(assert (= (and b!197792 res!93624) b!197797))

(assert (= (and b!197797 res!93628) b!197793))

(assert (= (and b!197793 res!93625) b!197791))

(assert (= (and b!197791 res!93623) b!197798))

(assert (= (and b!197796 condMapEmpty!8072) mapIsEmpty!8072))

(assert (= (and b!197796 (not condMapEmpty!8072)) mapNonEmpty!8072))

(get-info :version)

(assert (= (and mapNonEmpty!8072 ((_ is ValueCellFull!1991) mapValue!8072)) b!197795))

(assert (= (and b!197796 ((_ is ValueCellFull!1991) mapDefault!8072)) b!197800))

(assert (= start!20158 b!197796))

(declare-fun m!224721 () Bool)

(assert (=> b!197793 m!224721))

(declare-fun m!224723 () Bool)

(assert (=> b!197794 m!224723))

(declare-fun m!224725 () Bool)

(assert (=> start!20158 m!224725))

(declare-fun m!224727 () Bool)

(assert (=> start!20158 m!224727))

(declare-fun m!224729 () Bool)

(assert (=> start!20158 m!224729))

(declare-fun m!224731 () Bool)

(assert (=> b!197791 m!224731))

(declare-fun m!224733 () Bool)

(assert (=> mapNonEmpty!8072 m!224733))

(declare-fun m!224735 () Bool)

(assert (=> b!197792 m!224735))

(declare-fun m!224737 () Bool)

(assert (=> b!197798 m!224737))

(declare-fun m!224739 () Bool)

(assert (=> b!197798 m!224739))

(declare-fun m!224741 () Bool)

(assert (=> b!197798 m!224741))

(check-sat (not b!197798) (not b!197792) (not b_next!4813) (not b!197793) (not mapNonEmpty!8072) (not start!20158) tp_is_empty!4669 b_and!11573 (not b!197794))
(check-sat b_and!11573 (not b_next!4813))
