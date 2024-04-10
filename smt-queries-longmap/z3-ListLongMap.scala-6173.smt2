; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79148 () Bool)

(assert start!79148)

(declare-fun b_free!17361 () Bool)

(declare-fun b_next!17361 () Bool)

(assert (=> start!79148 (= b_free!17361 (not b_next!17361))))

(declare-fun tp!60524 () Bool)

(declare-fun b_and!28427 () Bool)

(assert (=> start!79148 (= tp!60524 b_and!28427)))

(declare-fun b!929025 () Bool)

(declare-fun res!625600 () Bool)

(declare-fun e!521675 () Bool)

(assert (=> b!929025 (=> (not res!625600) (not e!521675))))

(declare-datatypes ((array!55692 0))(
  ( (array!55693 (arr!26791 (Array (_ BitVec 32) (_ BitVec 64))) (size!27250 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55692)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55692 (_ BitVec 32)) Bool)

(assert (=> b!929025 (= res!625600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929026 () Bool)

(declare-fun res!625595 () Bool)

(assert (=> b!929026 (=> (not res!625595) (not e!521675))))

(declare-datatypes ((List!18847 0))(
  ( (Nil!18844) (Cons!18843 (h!19989 (_ BitVec 64)) (t!26904 List!18847)) )
))
(declare-fun arrayNoDuplicates!0 (array!55692 (_ BitVec 32) List!18847) Bool)

(assert (=> b!929026 (= res!625595 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18844))))

(declare-fun mapNonEmpty!31560 () Bool)

(declare-fun mapRes!31560 () Bool)

(declare-fun tp!60523 () Bool)

(declare-fun e!521673 () Bool)

(assert (=> mapNonEmpty!31560 (= mapRes!31560 (and tp!60523 e!521673))))

(declare-datatypes ((V!31457 0))(
  ( (V!31458 (val!9985 Int)) )
))
(declare-datatypes ((ValueCell!9453 0))(
  ( (ValueCellFull!9453 (v!12503 V!31457)) (EmptyCell!9453) )
))
(declare-fun mapValue!31560 () ValueCell!9453)

(declare-fun mapRest!31560 () (Array (_ BitVec 32) ValueCell!9453))

(declare-datatypes ((array!55694 0))(
  ( (array!55695 (arr!26792 (Array (_ BitVec 32) ValueCell!9453)) (size!27251 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55694)

(declare-fun mapKey!31560 () (_ BitVec 32))

(assert (=> mapNonEmpty!31560 (= (arr!26792 _values!1231) (store mapRest!31560 mapKey!31560 mapValue!31560))))

(declare-fun b!929027 () Bool)

(declare-fun res!625597 () Bool)

(assert (=> b!929027 (=> (not res!625597) (not e!521675))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!929027 (= res!625597 (and (= (size!27251 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27250 _keys!1487) (size!27251 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!625596 () Bool)

(assert (=> start!79148 (=> (not res!625596) (not e!521675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79148 (= res!625596 (validMask!0 mask!1881))))

(assert (=> start!79148 e!521675))

(assert (=> start!79148 true))

(declare-fun e!521677 () Bool)

(declare-fun array_inv!20854 (array!55694) Bool)

(assert (=> start!79148 (and (array_inv!20854 _values!1231) e!521677)))

(assert (=> start!79148 tp!60524))

(declare-fun array_inv!20855 (array!55692) Bool)

(assert (=> start!79148 (array_inv!20855 _keys!1487)))

(declare-fun tp_is_empty!19869 () Bool)

(assert (=> start!79148 tp_is_empty!19869))

(declare-fun b!929028 () Bool)

(declare-fun e!521674 () Bool)

(assert (=> b!929028 (= e!521674 tp_is_empty!19869)))

(declare-fun b!929029 () Bool)

(declare-fun res!625599 () Bool)

(assert (=> b!929029 (=> (not res!625599) (not e!521675))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929029 (= res!625599 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27250 _keys!1487))))))

(declare-fun mapIsEmpty!31560 () Bool)

(assert (=> mapIsEmpty!31560 mapRes!31560))

(declare-fun b!929030 () Bool)

(assert (=> b!929030 (= e!521673 tp_is_empty!19869)))

(declare-fun b!929031 () Bool)

(declare-fun e!521672 () Bool)

(assert (=> b!929031 (= e!521672 false)))

(declare-fun lt!418989 () V!31457)

(declare-datatypes ((tuple2!13050 0))(
  ( (tuple2!13051 (_1!6536 (_ BitVec 64)) (_2!6536 V!31457)) )
))
(declare-datatypes ((List!18848 0))(
  ( (Nil!18845) (Cons!18844 (h!19990 tuple2!13050) (t!26905 List!18848)) )
))
(declare-datatypes ((ListLongMap!11747 0))(
  ( (ListLongMap!11748 (toList!5889 List!18848)) )
))
(declare-fun lt!418990 () ListLongMap!11747)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!717 (ListLongMap!11747 (_ BitVec 64)) V!31457)

(assert (=> b!929031 (= lt!418989 (apply!717 lt!418990 k0!1099))))

(declare-fun b!929032 () Bool)

(assert (=> b!929032 (= e!521677 (and e!521674 mapRes!31560))))

(declare-fun condMapEmpty!31560 () Bool)

(declare-fun mapDefault!31560 () ValueCell!9453)

(assert (=> b!929032 (= condMapEmpty!31560 (= (arr!26792 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9453)) mapDefault!31560)))))

(declare-fun b!929033 () Bool)

(assert (=> b!929033 (= e!521675 e!521672)))

(declare-fun res!625598 () Bool)

(assert (=> b!929033 (=> (not res!625598) (not e!521672))))

(declare-fun contains!4944 (ListLongMap!11747 (_ BitVec 64)) Bool)

(assert (=> b!929033 (= res!625598 (contains!4944 lt!418990 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31457)

(declare-fun minValue!1173 () V!31457)

(declare-fun getCurrentListMap!3135 (array!55692 array!55694 (_ BitVec 32) (_ BitVec 32) V!31457 V!31457 (_ BitVec 32) Int) ListLongMap!11747)

(assert (=> b!929033 (= lt!418990 (getCurrentListMap!3135 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79148 res!625596) b!929027))

(assert (= (and b!929027 res!625597) b!929025))

(assert (= (and b!929025 res!625600) b!929026))

(assert (= (and b!929026 res!625595) b!929029))

(assert (= (and b!929029 res!625599) b!929033))

(assert (= (and b!929033 res!625598) b!929031))

(assert (= (and b!929032 condMapEmpty!31560) mapIsEmpty!31560))

(assert (= (and b!929032 (not condMapEmpty!31560)) mapNonEmpty!31560))

(get-info :version)

(assert (= (and mapNonEmpty!31560 ((_ is ValueCellFull!9453) mapValue!31560)) b!929030))

(assert (= (and b!929032 ((_ is ValueCellFull!9453) mapDefault!31560)) b!929028))

(assert (= start!79148 b!929032))

(declare-fun m!863733 () Bool)

(assert (=> start!79148 m!863733))

(declare-fun m!863735 () Bool)

(assert (=> start!79148 m!863735))

(declare-fun m!863737 () Bool)

(assert (=> start!79148 m!863737))

(declare-fun m!863739 () Bool)

(assert (=> b!929026 m!863739))

(declare-fun m!863741 () Bool)

(assert (=> b!929033 m!863741))

(declare-fun m!863743 () Bool)

(assert (=> b!929033 m!863743))

(declare-fun m!863745 () Bool)

(assert (=> mapNonEmpty!31560 m!863745))

(declare-fun m!863747 () Bool)

(assert (=> b!929031 m!863747))

(declare-fun m!863749 () Bool)

(assert (=> b!929025 m!863749))

(check-sat (not b_next!17361) (not b!929031) tp_is_empty!19869 (not start!79148) (not mapNonEmpty!31560) b_and!28427 (not b!929033) (not b!929025) (not b!929026))
(check-sat b_and!28427 (not b_next!17361))
