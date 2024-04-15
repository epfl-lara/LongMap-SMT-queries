; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79110 () Bool)

(assert start!79110)

(declare-fun b_free!17341 () Bool)

(declare-fun b_next!17341 () Bool)

(assert (=> start!79110 (= b_free!17341 (not b_next!17341))))

(declare-fun tp!60465 () Bool)

(declare-fun b_and!28381 () Bool)

(assert (=> start!79110 (= tp!60465 b_and!28381)))

(declare-fun mapNonEmpty!31530 () Bool)

(declare-fun mapRes!31530 () Bool)

(declare-fun tp!60464 () Bool)

(declare-fun e!521347 () Bool)

(assert (=> mapNonEmpty!31530 (= mapRes!31530 (and tp!60464 e!521347))))

(declare-datatypes ((V!31431 0))(
  ( (V!31432 (val!9975 Int)) )
))
(declare-datatypes ((ValueCell!9443 0))(
  ( (ValueCellFull!9443 (v!12492 V!31431)) (EmptyCell!9443) )
))
(declare-datatypes ((array!55627 0))(
  ( (array!55628 (arr!26759 (Array (_ BitVec 32) ValueCell!9443)) (size!27220 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55627)

(declare-fun mapRest!31530 () (Array (_ BitVec 32) ValueCell!9443))

(declare-fun mapKey!31530 () (_ BitVec 32))

(declare-fun mapValue!31530 () ValueCell!9443)

(assert (=> mapNonEmpty!31530 (= (arr!26759 _values!1231) (store mapRest!31530 mapKey!31530 mapValue!31530))))

(declare-fun b!928516 () Bool)

(declare-fun e!521348 () Bool)

(declare-fun tp_is_empty!19849 () Bool)

(assert (=> b!928516 (= e!521348 tp_is_empty!19849)))

(declare-fun b!928517 () Bool)

(declare-fun e!521349 () Bool)

(declare-fun e!521344 () Bool)

(assert (=> b!928517 (= e!521349 e!521344)))

(declare-fun res!625306 () Bool)

(assert (=> b!928517 (=> (not res!625306) (not e!521344))))

(declare-datatypes ((tuple2!13090 0))(
  ( (tuple2!13091 (_1!6556 (_ BitVec 64)) (_2!6556 V!31431)) )
))
(declare-datatypes ((List!18857 0))(
  ( (Nil!18854) (Cons!18853 (h!19999 tuple2!13090) (t!26905 List!18857)) )
))
(declare-datatypes ((ListLongMap!11777 0))(
  ( (ListLongMap!11778 (toList!5904 List!18857)) )
))
(declare-fun lt!418694 () ListLongMap!11777)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4914 (ListLongMap!11777 (_ BitVec 64)) Bool)

(assert (=> b!928517 (= res!625306 (contains!4914 lt!418694 k0!1099))))

(declare-datatypes ((array!55629 0))(
  ( (array!55630 (arr!26760 (Array (_ BitVec 32) (_ BitVec 64))) (size!27221 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55629)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31431)

(declare-fun minValue!1173 () V!31431)

(declare-fun getCurrentListMap!3088 (array!55629 array!55627 (_ BitVec 32) (_ BitVec 32) V!31431 V!31431 (_ BitVec 32) Int) ListLongMap!11777)

(assert (=> b!928517 (= lt!418694 (getCurrentListMap!3088 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!625308 () Bool)

(assert (=> start!79110 (=> (not res!625308) (not e!521349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79110 (= res!625308 (validMask!0 mask!1881))))

(assert (=> start!79110 e!521349))

(assert (=> start!79110 true))

(declare-fun e!521346 () Bool)

(declare-fun array_inv!20922 (array!55627) Bool)

(assert (=> start!79110 (and (array_inv!20922 _values!1231) e!521346)))

(assert (=> start!79110 tp!60465))

(declare-fun array_inv!20923 (array!55629) Bool)

(assert (=> start!79110 (array_inv!20923 _keys!1487)))

(assert (=> start!79110 tp_is_empty!19849))

(declare-fun b!928518 () Bool)

(assert (=> b!928518 (= e!521347 tp_is_empty!19849)))

(declare-fun b!928519 () Bool)

(declare-fun res!625310 () Bool)

(assert (=> b!928519 (=> (not res!625310) (not e!521349))))

(assert (=> b!928519 (= res!625310 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27221 _keys!1487))))))

(declare-fun b!928520 () Bool)

(assert (=> b!928520 (= e!521346 (and e!521348 mapRes!31530))))

(declare-fun condMapEmpty!31530 () Bool)

(declare-fun mapDefault!31530 () ValueCell!9443)

(assert (=> b!928520 (= condMapEmpty!31530 (= (arr!26759 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9443)) mapDefault!31530)))))

(declare-fun b!928521 () Bool)

(declare-fun res!625307 () Bool)

(assert (=> b!928521 (=> (not res!625307) (not e!521349))))

(assert (=> b!928521 (= res!625307 (and (= (size!27220 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27221 _keys!1487) (size!27220 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928522 () Bool)

(assert (=> b!928522 (= e!521344 false)))

(declare-fun lt!418693 () V!31431)

(declare-fun apply!712 (ListLongMap!11777 (_ BitVec 64)) V!31431)

(assert (=> b!928522 (= lt!418693 (apply!712 lt!418694 k0!1099))))

(declare-fun mapIsEmpty!31530 () Bool)

(assert (=> mapIsEmpty!31530 mapRes!31530))

(declare-fun b!928523 () Bool)

(declare-fun res!625305 () Bool)

(assert (=> b!928523 (=> (not res!625305) (not e!521349))))

(declare-datatypes ((List!18858 0))(
  ( (Nil!18855) (Cons!18854 (h!20000 (_ BitVec 64)) (t!26906 List!18858)) )
))
(declare-fun arrayNoDuplicates!0 (array!55629 (_ BitVec 32) List!18858) Bool)

(assert (=> b!928523 (= res!625305 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18855))))

(declare-fun b!928524 () Bool)

(declare-fun res!625309 () Bool)

(assert (=> b!928524 (=> (not res!625309) (not e!521349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55629 (_ BitVec 32)) Bool)

(assert (=> b!928524 (= res!625309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79110 res!625308) b!928521))

(assert (= (and b!928521 res!625307) b!928524))

(assert (= (and b!928524 res!625309) b!928523))

(assert (= (and b!928523 res!625305) b!928519))

(assert (= (and b!928519 res!625310) b!928517))

(assert (= (and b!928517 res!625306) b!928522))

(assert (= (and b!928520 condMapEmpty!31530) mapIsEmpty!31530))

(assert (= (and b!928520 (not condMapEmpty!31530)) mapNonEmpty!31530))

(get-info :version)

(assert (= (and mapNonEmpty!31530 ((_ is ValueCellFull!9443) mapValue!31530)) b!928518))

(assert (= (and b!928520 ((_ is ValueCellFull!9443) mapDefault!31530)) b!928516))

(assert (= start!79110 b!928520))

(declare-fun m!862795 () Bool)

(assert (=> b!928522 m!862795))

(declare-fun m!862797 () Bool)

(assert (=> b!928524 m!862797))

(declare-fun m!862799 () Bool)

(assert (=> start!79110 m!862799))

(declare-fun m!862801 () Bool)

(assert (=> start!79110 m!862801))

(declare-fun m!862803 () Bool)

(assert (=> start!79110 m!862803))

(declare-fun m!862805 () Bool)

(assert (=> b!928523 m!862805))

(declare-fun m!862807 () Bool)

(assert (=> b!928517 m!862807))

(declare-fun m!862809 () Bool)

(assert (=> b!928517 m!862809))

(declare-fun m!862811 () Bool)

(assert (=> mapNonEmpty!31530 m!862811))

(check-sat (not b_next!17341) (not b!928522) (not start!79110) (not mapNonEmpty!31530) b_and!28381 tp_is_empty!19849 (not b!928524) (not b!928523) (not b!928517))
(check-sat b_and!28381 (not b_next!17341))
