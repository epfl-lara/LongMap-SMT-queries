; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79184 () Bool)

(assert start!79184)

(declare-fun b_free!17397 () Bool)

(declare-fun b_next!17397 () Bool)

(assert (=> start!79184 (= b_free!17397 (not b_next!17397))))

(declare-fun tp!60632 () Bool)

(declare-fun b_and!28463 () Bool)

(assert (=> start!79184 (= tp!60632 b_and!28463)))

(declare-fun b!929566 () Bool)

(declare-fun res!625977 () Bool)

(declare-fun e!522000 () Bool)

(assert (=> b!929566 (=> (not res!625977) (not e!522000))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31505 0))(
  ( (V!31506 (val!10003 Int)) )
))
(declare-fun v!791 () V!31505)

(declare-datatypes ((tuple2!13080 0))(
  ( (tuple2!13081 (_1!6551 (_ BitVec 64)) (_2!6551 V!31505)) )
))
(declare-datatypes ((List!18874 0))(
  ( (Nil!18871) (Cons!18870 (h!20016 tuple2!13080) (t!26931 List!18874)) )
))
(declare-datatypes ((ListLongMap!11777 0))(
  ( (ListLongMap!11778 (toList!5904 List!18874)) )
))
(declare-fun lt!419088 () ListLongMap!11777)

(declare-fun apply!729 (ListLongMap!11777 (_ BitVec 64)) V!31505)

(assert (=> b!929566 (= res!625977 (= (apply!729 lt!419088 k0!1099) v!791))))

(declare-fun b!929567 () Bool)

(declare-fun res!625979 () Bool)

(declare-fun e!521998 () Bool)

(assert (=> b!929567 (=> (not res!625979) (not e!521998))))

(declare-datatypes ((array!55764 0))(
  ( (array!55765 (arr!26827 (Array (_ BitVec 32) (_ BitVec 64))) (size!27286 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55764)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55764 (_ BitVec 32)) Bool)

(assert (=> b!929567 (= res!625979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31614 () Bool)

(declare-fun mapRes!31614 () Bool)

(assert (=> mapIsEmpty!31614 mapRes!31614))

(declare-fun b!929568 () Bool)

(assert (=> b!929568 (= e!522000 false)))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun lt!419089 () Bool)

(declare-datatypes ((ValueCell!9471 0))(
  ( (ValueCellFull!9471 (v!12521 V!31505)) (EmptyCell!9471) )
))
(declare-datatypes ((array!55766 0))(
  ( (array!55767 (arr!26828 (Array (_ BitVec 32) ValueCell!9471)) (size!27287 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55766)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31505)

(declare-fun minValue!1173 () V!31505)

(declare-fun contains!4956 (ListLongMap!11777 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3147 (array!55764 array!55766 (_ BitVec 32) (_ BitVec 32) V!31505 V!31505 (_ BitVec 32) Int) ListLongMap!11777)

(assert (=> b!929568 (= lt!419089 (contains!4956 (getCurrentListMap!3147 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!929569 () Bool)

(declare-fun e!521997 () Bool)

(declare-fun tp_is_empty!19905 () Bool)

(assert (=> b!929569 (= e!521997 tp_is_empty!19905)))

(declare-fun b!929570 () Bool)

(declare-fun res!625978 () Bool)

(assert (=> b!929570 (=> (not res!625978) (not e!521998))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929570 (= res!625978 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27286 _keys!1487))))))

(declare-fun mapNonEmpty!31614 () Bool)

(declare-fun tp!60631 () Bool)

(declare-fun e!522001 () Bool)

(assert (=> mapNonEmpty!31614 (= mapRes!31614 (and tp!60631 e!522001))))

(declare-fun mapRest!31614 () (Array (_ BitVec 32) ValueCell!9471))

(declare-fun mapKey!31614 () (_ BitVec 32))

(declare-fun mapValue!31614 () ValueCell!9471)

(assert (=> mapNonEmpty!31614 (= (arr!26828 _values!1231) (store mapRest!31614 mapKey!31614 mapValue!31614))))

(declare-fun b!929572 () Bool)

(declare-fun res!625976 () Bool)

(assert (=> b!929572 (=> (not res!625976) (not e!521998))))

(assert (=> b!929572 (= res!625976 (and (= (size!27287 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27286 _keys!1487) (size!27287 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929573 () Bool)

(declare-fun res!625975 () Bool)

(assert (=> b!929573 (=> (not res!625975) (not e!521998))))

(declare-datatypes ((List!18875 0))(
  ( (Nil!18872) (Cons!18871 (h!20017 (_ BitVec 64)) (t!26932 List!18875)) )
))
(declare-fun arrayNoDuplicates!0 (array!55764 (_ BitVec 32) List!18875) Bool)

(assert (=> b!929573 (= res!625975 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18872))))

(declare-fun b!929574 () Bool)

(declare-fun e!521996 () Bool)

(assert (=> b!929574 (= e!521996 (and e!521997 mapRes!31614))))

(declare-fun condMapEmpty!31614 () Bool)

(declare-fun mapDefault!31614 () ValueCell!9471)

(assert (=> b!929574 (= condMapEmpty!31614 (= (arr!26828 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9471)) mapDefault!31614)))))

(declare-fun b!929575 () Bool)

(assert (=> b!929575 (= e!521998 e!522000)))

(declare-fun res!625974 () Bool)

(assert (=> b!929575 (=> (not res!625974) (not e!522000))))

(assert (=> b!929575 (= res!625974 (contains!4956 lt!419088 k0!1099))))

(assert (=> b!929575 (= lt!419088 (getCurrentListMap!3147 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929576 () Bool)

(assert (=> b!929576 (= e!522001 tp_is_empty!19905)))

(declare-fun res!625981 () Bool)

(assert (=> start!79184 (=> (not res!625981) (not e!521998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79184 (= res!625981 (validMask!0 mask!1881))))

(assert (=> start!79184 e!521998))

(assert (=> start!79184 true))

(assert (=> start!79184 tp_is_empty!19905))

(declare-fun array_inv!20874 (array!55766) Bool)

(assert (=> start!79184 (and (array_inv!20874 _values!1231) e!521996)))

(assert (=> start!79184 tp!60632))

(declare-fun array_inv!20875 (array!55764) Bool)

(assert (=> start!79184 (array_inv!20875 _keys!1487)))

(declare-fun b!929571 () Bool)

(declare-fun res!625980 () Bool)

(assert (=> b!929571 (=> (not res!625980) (not e!522000))))

(assert (=> b!929571 (= res!625980 (bvsle from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!79184 res!625981) b!929572))

(assert (= (and b!929572 res!625976) b!929567))

(assert (= (and b!929567 res!625979) b!929573))

(assert (= (and b!929573 res!625975) b!929570))

(assert (= (and b!929570 res!625978) b!929575))

(assert (= (and b!929575 res!625974) b!929566))

(assert (= (and b!929566 res!625977) b!929571))

(assert (= (and b!929571 res!625980) b!929568))

(assert (= (and b!929574 condMapEmpty!31614) mapIsEmpty!31614))

(assert (= (and b!929574 (not condMapEmpty!31614)) mapNonEmpty!31614))

(get-info :version)

(assert (= (and mapNonEmpty!31614 ((_ is ValueCellFull!9471) mapValue!31614)) b!929576))

(assert (= (and b!929574 ((_ is ValueCellFull!9471) mapDefault!31614)) b!929569))

(assert (= start!79184 b!929574))

(declare-fun m!864085 () Bool)

(assert (=> start!79184 m!864085))

(declare-fun m!864087 () Bool)

(assert (=> start!79184 m!864087))

(declare-fun m!864089 () Bool)

(assert (=> start!79184 m!864089))

(declare-fun m!864091 () Bool)

(assert (=> b!929566 m!864091))

(declare-fun m!864093 () Bool)

(assert (=> b!929575 m!864093))

(declare-fun m!864095 () Bool)

(assert (=> b!929575 m!864095))

(declare-fun m!864097 () Bool)

(assert (=> mapNonEmpty!31614 m!864097))

(declare-fun m!864099 () Bool)

(assert (=> b!929573 m!864099))

(declare-fun m!864101 () Bool)

(assert (=> b!929567 m!864101))

(declare-fun m!864103 () Bool)

(assert (=> b!929568 m!864103))

(assert (=> b!929568 m!864103))

(declare-fun m!864105 () Bool)

(assert (=> b!929568 m!864105))

(check-sat (not start!79184) b_and!28463 (not b!929575) (not b_next!17397) (not b!929567) (not mapNonEmpty!31614) (not b!929566) tp_is_empty!19905 (not b!929568) (not b!929573))
(check-sat b_and!28463 (not b_next!17397))
