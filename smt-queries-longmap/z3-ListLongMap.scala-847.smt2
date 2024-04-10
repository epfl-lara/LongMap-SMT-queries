; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20180 () Bool)

(assert start!20180)

(declare-fun b_free!4839 () Bool)

(declare-fun b_next!4839 () Bool)

(assert (=> start!20180 (= b_free!4839 (not b_next!4839))))

(declare-fun tp!17549 () Bool)

(declare-fun b_and!11585 () Bool)

(assert (=> start!20180 (= tp!17549 b_and!11585)))

(declare-fun mapIsEmpty!8111 () Bool)

(declare-fun mapRes!8111 () Bool)

(assert (=> mapIsEmpty!8111 mapRes!8111))

(declare-fun mapNonEmpty!8111 () Bool)

(declare-fun tp!17548 () Bool)

(declare-fun e!130274 () Bool)

(assert (=> mapNonEmpty!8111 (= mapRes!8111 (and tp!17548 e!130274))))

(declare-fun mapKey!8111 () (_ BitVec 32))

(declare-datatypes ((V!5907 0))(
  ( (V!5908 (val!2392 Int)) )
))
(declare-datatypes ((ValueCell!2004 0))(
  ( (ValueCellFull!2004 (v!4362 V!5907)) (EmptyCell!2004) )
))
(declare-fun mapRest!8111 () (Array (_ BitVec 32) ValueCell!2004))

(declare-datatypes ((array!8639 0))(
  ( (array!8640 (arr!4070 (Array (_ BitVec 32) ValueCell!2004)) (size!4395 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8639)

(declare-fun mapValue!8111 () ValueCell!2004)

(assert (=> mapNonEmpty!8111 (= (arr!4070 _values!649) (store mapRest!8111 mapKey!8111 mapValue!8111))))

(declare-fun b!198134 () Bool)

(declare-fun res!93877 () Bool)

(declare-fun e!130273 () Bool)

(assert (=> b!198134 (=> (not res!93877) (not e!130273))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198134 (= res!93877 (validKeyInArray!0 k0!843))))

(declare-fun b!198135 () Bool)

(declare-fun res!93874 () Bool)

(assert (=> b!198135 (=> (not res!93874) (not e!130273))))

(declare-datatypes ((array!8641 0))(
  ( (array!8642 (arr!4071 (Array (_ BitVec 32) (_ BitVec 64))) (size!4396 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8641)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!198135 (= res!93874 (and (= (size!4395 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4396 _keys!825) (size!4395 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198136 () Bool)

(declare-fun e!130270 () Bool)

(declare-fun tp_is_empty!4695 () Bool)

(assert (=> b!198136 (= e!130270 tp_is_empty!4695)))

(declare-fun res!93880 () Bool)

(assert (=> start!20180 (=> (not res!93880) (not e!130273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20180 (= res!93880 (validMask!0 mask!1149))))

(assert (=> start!20180 e!130273))

(declare-fun e!130271 () Bool)

(declare-fun array_inv!2661 (array!8639) Bool)

(assert (=> start!20180 (and (array_inv!2661 _values!649) e!130271)))

(assert (=> start!20180 true))

(assert (=> start!20180 tp_is_empty!4695))

(declare-fun array_inv!2662 (array!8641) Bool)

(assert (=> start!20180 (array_inv!2662 _keys!825)))

(assert (=> start!20180 tp!17549))

(declare-fun b!198137 () Bool)

(declare-fun res!93876 () Bool)

(assert (=> b!198137 (=> (not res!93876) (not e!130273))))

(declare-datatypes ((List!2542 0))(
  ( (Nil!2539) (Cons!2538 (h!3180 (_ BitVec 64)) (t!7473 List!2542)) )
))
(declare-fun arrayNoDuplicates!0 (array!8641 (_ BitVec 32) List!2542) Bool)

(assert (=> b!198137 (= res!93876 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2539))))

(declare-fun b!198138 () Bool)

(assert (=> b!198138 (= e!130274 tp_is_empty!4695)))

(declare-fun b!198139 () Bool)

(assert (=> b!198139 (= e!130271 (and e!130270 mapRes!8111))))

(declare-fun condMapEmpty!8111 () Bool)

(declare-fun mapDefault!8111 () ValueCell!2004)

(assert (=> b!198139 (= condMapEmpty!8111 (= (arr!4070 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2004)) mapDefault!8111)))))

(declare-fun b!198140 () Bool)

(declare-fun res!93878 () Bool)

(assert (=> b!198140 (=> (not res!93878) (not e!130273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8641 (_ BitVec 32)) Bool)

(assert (=> b!198140 (= res!93878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198141 () Bool)

(declare-fun res!93879 () Bool)

(assert (=> b!198141 (=> (not res!93879) (not e!130273))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198141 (= res!93879 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4396 _keys!825))))))

(declare-fun b!198142 () Bool)

(declare-fun res!93875 () Bool)

(assert (=> b!198142 (=> (not res!93875) (not e!130273))))

(assert (=> b!198142 (= res!93875 (= (select (arr!4071 _keys!825) i!601) k0!843))))

(declare-fun b!198143 () Bool)

(assert (=> b!198143 (= e!130273 false)))

(declare-datatypes ((tuple2!3626 0))(
  ( (tuple2!3627 (_1!1824 (_ BitVec 64)) (_2!1824 V!5907)) )
))
(declare-datatypes ((List!2543 0))(
  ( (Nil!2540) (Cons!2539 (h!3181 tuple2!3626) (t!7474 List!2543)) )
))
(declare-datatypes ((ListLongMap!2539 0))(
  ( (ListLongMap!2540 (toList!1285 List!2543)) )
))
(declare-fun lt!97857 () ListLongMap!2539)

(declare-fun v!520 () V!5907)

(declare-fun zeroValue!615 () V!5907)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5907)

(declare-fun getCurrentListMapNoExtraKeys!250 (array!8641 array!8639 (_ BitVec 32) (_ BitVec 32) V!5907 V!5907 (_ BitVec 32) Int) ListLongMap!2539)

(assert (=> b!198143 (= lt!97857 (getCurrentListMapNoExtraKeys!250 _keys!825 (array!8640 (store (arr!4070 _values!649) i!601 (ValueCellFull!2004 v!520)) (size!4395 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97856 () ListLongMap!2539)

(assert (=> b!198143 (= lt!97856 (getCurrentListMapNoExtraKeys!250 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20180 res!93880) b!198135))

(assert (= (and b!198135 res!93874) b!198140))

(assert (= (and b!198140 res!93878) b!198137))

(assert (= (and b!198137 res!93876) b!198141))

(assert (= (and b!198141 res!93879) b!198134))

(assert (= (and b!198134 res!93877) b!198142))

(assert (= (and b!198142 res!93875) b!198143))

(assert (= (and b!198139 condMapEmpty!8111) mapIsEmpty!8111))

(assert (= (and b!198139 (not condMapEmpty!8111)) mapNonEmpty!8111))

(get-info :version)

(assert (= (and mapNonEmpty!8111 ((_ is ValueCellFull!2004) mapValue!8111)) b!198138))

(assert (= (and b!198139 ((_ is ValueCellFull!2004) mapDefault!8111)) b!198136))

(assert (= start!20180 b!198139))

(declare-fun m!224825 () Bool)

(assert (=> b!198140 m!224825))

(declare-fun m!224827 () Bool)

(assert (=> start!20180 m!224827))

(declare-fun m!224829 () Bool)

(assert (=> start!20180 m!224829))

(declare-fun m!224831 () Bool)

(assert (=> start!20180 m!224831))

(declare-fun m!224833 () Bool)

(assert (=> mapNonEmpty!8111 m!224833))

(declare-fun m!224835 () Bool)

(assert (=> b!198134 m!224835))

(declare-fun m!224837 () Bool)

(assert (=> b!198137 m!224837))

(declare-fun m!224839 () Bool)

(assert (=> b!198142 m!224839))

(declare-fun m!224841 () Bool)

(assert (=> b!198143 m!224841))

(declare-fun m!224843 () Bool)

(assert (=> b!198143 m!224843))

(declare-fun m!224845 () Bool)

(assert (=> b!198143 m!224845))

(check-sat (not b!198134) (not b_next!4839) b_and!11585 (not b!198137) (not b!198143) (not mapNonEmpty!8111) (not start!20180) tp_is_empty!4695 (not b!198140))
(check-sat b_and!11585 (not b_next!4839))
