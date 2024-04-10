; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20174 () Bool)

(assert start!20174)

(declare-fun b_free!4833 () Bool)

(declare-fun b_next!4833 () Bool)

(assert (=> start!20174 (= b_free!4833 (not b_next!4833))))

(declare-fun tp!17530 () Bool)

(declare-fun b_and!11579 () Bool)

(assert (=> start!20174 (= tp!17530 b_and!11579)))

(declare-fun b!198044 () Bool)

(declare-fun res!93816 () Bool)

(declare-fun e!130228 () Bool)

(assert (=> b!198044 (=> (not res!93816) (not e!130228))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8629 0))(
  ( (array!8630 (arr!4065 (Array (_ BitVec 32) (_ BitVec 64))) (size!4390 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8629)

(assert (=> b!198044 (= res!93816 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4390 _keys!825))))))

(declare-fun b!198045 () Bool)

(declare-fun e!130225 () Bool)

(declare-fun tp_is_empty!4689 () Bool)

(assert (=> b!198045 (= e!130225 tp_is_empty!4689)))

(declare-fun b!198046 () Bool)

(declare-fun e!130227 () Bool)

(declare-fun e!130229 () Bool)

(declare-fun mapRes!8102 () Bool)

(assert (=> b!198046 (= e!130227 (and e!130229 mapRes!8102))))

(declare-fun condMapEmpty!8102 () Bool)

(declare-datatypes ((V!5899 0))(
  ( (V!5900 (val!2389 Int)) )
))
(declare-datatypes ((ValueCell!2001 0))(
  ( (ValueCellFull!2001 (v!4359 V!5899)) (EmptyCell!2001) )
))
(declare-datatypes ((array!8631 0))(
  ( (array!8632 (arr!4066 (Array (_ BitVec 32) ValueCell!2001)) (size!4391 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8631)

(declare-fun mapDefault!8102 () ValueCell!2001)

(assert (=> b!198046 (= condMapEmpty!8102 (= (arr!4066 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2001)) mapDefault!8102)))))

(declare-fun b!198047 () Bool)

(declare-fun res!93811 () Bool)

(assert (=> b!198047 (=> (not res!93811) (not e!130228))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!198047 (= res!93811 (and (= (size!4391 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4390 _keys!825) (size!4391 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8102 () Bool)

(declare-fun tp!17531 () Bool)

(assert (=> mapNonEmpty!8102 (= mapRes!8102 (and tp!17531 e!130225))))

(declare-fun mapRest!8102 () (Array (_ BitVec 32) ValueCell!2001))

(declare-fun mapKey!8102 () (_ BitVec 32))

(declare-fun mapValue!8102 () ValueCell!2001)

(assert (=> mapNonEmpty!8102 (= (arr!4066 _values!649) (store mapRest!8102 mapKey!8102 mapValue!8102))))

(declare-fun b!198048 () Bool)

(declare-fun res!93813 () Bool)

(assert (=> b!198048 (=> (not res!93813) (not e!130228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8629 (_ BitVec 32)) Bool)

(assert (=> b!198048 (= res!93813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!93815 () Bool)

(assert (=> start!20174 (=> (not res!93815) (not e!130228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20174 (= res!93815 (validMask!0 mask!1149))))

(assert (=> start!20174 e!130228))

(declare-fun array_inv!2657 (array!8631) Bool)

(assert (=> start!20174 (and (array_inv!2657 _values!649) e!130227)))

(assert (=> start!20174 true))

(assert (=> start!20174 tp_is_empty!4689))

(declare-fun array_inv!2658 (array!8629) Bool)

(assert (=> start!20174 (array_inv!2658 _keys!825)))

(assert (=> start!20174 tp!17530))

(declare-fun b!198049 () Bool)

(declare-fun res!93814 () Bool)

(assert (=> b!198049 (=> (not res!93814) (not e!130228))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198049 (= res!93814 (validKeyInArray!0 k0!843))))

(declare-fun b!198050 () Bool)

(declare-fun res!93817 () Bool)

(assert (=> b!198050 (=> (not res!93817) (not e!130228))))

(declare-datatypes ((List!2539 0))(
  ( (Nil!2536) (Cons!2535 (h!3177 (_ BitVec 64)) (t!7470 List!2539)) )
))
(declare-fun arrayNoDuplicates!0 (array!8629 (_ BitVec 32) List!2539) Bool)

(assert (=> b!198050 (= res!93817 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2536))))

(declare-fun b!198051 () Bool)

(assert (=> b!198051 (= e!130228 false)))

(declare-datatypes ((tuple2!3624 0))(
  ( (tuple2!3625 (_1!1823 (_ BitVec 64)) (_2!1823 V!5899)) )
))
(declare-datatypes ((List!2540 0))(
  ( (Nil!2537) (Cons!2536 (h!3178 tuple2!3624) (t!7471 List!2540)) )
))
(declare-datatypes ((ListLongMap!2537 0))(
  ( (ListLongMap!2538 (toList!1284 List!2540)) )
))
(declare-fun lt!97838 () ListLongMap!2537)

(declare-fun v!520 () V!5899)

(declare-fun zeroValue!615 () V!5899)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5899)

(declare-fun getCurrentListMapNoExtraKeys!249 (array!8629 array!8631 (_ BitVec 32) (_ BitVec 32) V!5899 V!5899 (_ BitVec 32) Int) ListLongMap!2537)

(assert (=> b!198051 (= lt!97838 (getCurrentListMapNoExtraKeys!249 _keys!825 (array!8632 (store (arr!4066 _values!649) i!601 (ValueCellFull!2001 v!520)) (size!4391 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97839 () ListLongMap!2537)

(assert (=> b!198051 (= lt!97839 (getCurrentListMapNoExtraKeys!249 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198052 () Bool)

(assert (=> b!198052 (= e!130229 tp_is_empty!4689)))

(declare-fun mapIsEmpty!8102 () Bool)

(assert (=> mapIsEmpty!8102 mapRes!8102))

(declare-fun b!198053 () Bool)

(declare-fun res!93812 () Bool)

(assert (=> b!198053 (=> (not res!93812) (not e!130228))))

(assert (=> b!198053 (= res!93812 (= (select (arr!4065 _keys!825) i!601) k0!843))))

(assert (= (and start!20174 res!93815) b!198047))

(assert (= (and b!198047 res!93811) b!198048))

(assert (= (and b!198048 res!93813) b!198050))

(assert (= (and b!198050 res!93817) b!198044))

(assert (= (and b!198044 res!93816) b!198049))

(assert (= (and b!198049 res!93814) b!198053))

(assert (= (and b!198053 res!93812) b!198051))

(assert (= (and b!198046 condMapEmpty!8102) mapIsEmpty!8102))

(assert (= (and b!198046 (not condMapEmpty!8102)) mapNonEmpty!8102))

(get-info :version)

(assert (= (and mapNonEmpty!8102 ((_ is ValueCellFull!2001) mapValue!8102)) b!198045))

(assert (= (and b!198046 ((_ is ValueCellFull!2001) mapDefault!8102)) b!198052))

(assert (= start!20174 b!198046))

(declare-fun m!224759 () Bool)

(assert (=> start!20174 m!224759))

(declare-fun m!224761 () Bool)

(assert (=> start!20174 m!224761))

(declare-fun m!224763 () Bool)

(assert (=> start!20174 m!224763))

(declare-fun m!224765 () Bool)

(assert (=> mapNonEmpty!8102 m!224765))

(declare-fun m!224767 () Bool)

(assert (=> b!198049 m!224767))

(declare-fun m!224769 () Bool)

(assert (=> b!198053 m!224769))

(declare-fun m!224771 () Bool)

(assert (=> b!198048 m!224771))

(declare-fun m!224773 () Bool)

(assert (=> b!198050 m!224773))

(declare-fun m!224775 () Bool)

(assert (=> b!198051 m!224775))

(declare-fun m!224777 () Bool)

(assert (=> b!198051 m!224777))

(declare-fun m!224779 () Bool)

(assert (=> b!198051 m!224779))

(check-sat (not b_next!4833) (not mapNonEmpty!8102) b_and!11579 (not start!20174) (not b!198048) (not b!198050) tp_is_empty!4689 (not b!198049) (not b!198051))
(check-sat b_and!11579 (not b_next!4833))
