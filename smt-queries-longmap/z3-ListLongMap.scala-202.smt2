; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3896 () Bool)

(assert start!3896)

(declare-fun b_free!801 () Bool)

(declare-fun b_next!801 () Bool)

(assert (=> start!3896 (= b_free!801 (not b_next!801))))

(declare-fun tp!3822 () Bool)

(declare-fun b_and!1611 () Bool)

(assert (=> start!3896 (= tp!3822 b_and!1611)))

(declare-fun b!27404 () Bool)

(declare-fun res!16219 () Bool)

(declare-fun e!17855 () Bool)

(assert (=> b!27404 (=> (not res!16219) (not e!17855))))

(declare-datatypes ((array!1553 0))(
  ( (array!1554 (arr!730 (Array (_ BitVec 32) (_ BitVec 64))) (size!831 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1553)

(declare-datatypes ((List!616 0))(
  ( (Nil!613) (Cons!612 (h!1179 (_ BitVec 64)) (t!3309 List!616)) )
))
(declare-fun arrayNoDuplicates!0 (array!1553 (_ BitVec 32) List!616) Bool)

(assert (=> b!27404 (= res!16219 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!613))))

(declare-fun b!27405 () Bool)

(declare-fun e!17858 () Bool)

(declare-fun tp_is_empty!1155 () Bool)

(assert (=> b!27405 (= e!17858 tp_is_empty!1155)))

(declare-fun b!27406 () Bool)

(declare-fun e!17857 () Bool)

(assert (=> b!27406 (= e!17857 tp_is_empty!1155)))

(declare-fun b!27407 () Bool)

(declare-fun res!16218 () Bool)

(assert (=> b!27407 (=> (not res!16218) (not e!17855))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27407 (= res!16218 (validKeyInArray!0 k0!1304))))

(declare-fun b!27408 () Bool)

(declare-fun res!16221 () Bool)

(assert (=> b!27408 (=> (not res!16221) (not e!17855))))

(declare-datatypes ((V!1365 0))(
  ( (V!1366 (val!604 Int)) )
))
(declare-datatypes ((ValueCell!378 0))(
  ( (ValueCellFull!378 (v!1693 V!1365)) (EmptyCell!378) )
))
(declare-datatypes ((array!1555 0))(
  ( (array!1556 (arr!731 (Array (_ BitVec 32) ValueCell!378)) (size!832 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1555)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!27408 (= res!16221 (and (= (size!832 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!831 _keys!1833) (size!832 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!16220 () Bool)

(assert (=> start!3896 (=> (not res!16220) (not e!17855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3896 (= res!16220 (validMask!0 mask!2294))))

(assert (=> start!3896 e!17855))

(assert (=> start!3896 true))

(assert (=> start!3896 tp!3822))

(declare-fun e!17854 () Bool)

(declare-fun array_inv!503 (array!1555) Bool)

(assert (=> start!3896 (and (array_inv!503 _values!1501) e!17854)))

(declare-fun array_inv!504 (array!1553) Bool)

(assert (=> start!3896 (array_inv!504 _keys!1833)))

(assert (=> start!3896 tp_is_empty!1155))

(declare-fun b!27409 () Bool)

(assert (=> b!27409 (= e!17855 false)))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1365)

(declare-fun minValue!1443 () V!1365)

(declare-fun lt!10676 () Bool)

(declare-datatypes ((tuple2!1016 0))(
  ( (tuple2!1017 (_1!519 (_ BitVec 64)) (_2!519 V!1365)) )
))
(declare-datatypes ((List!617 0))(
  ( (Nil!614) (Cons!613 (h!1180 tuple2!1016) (t!3310 List!617)) )
))
(declare-datatypes ((ListLongMap!593 0))(
  ( (ListLongMap!594 (toList!312 List!617)) )
))
(declare-fun contains!252 (ListLongMap!593 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!142 (array!1553 array!1555 (_ BitVec 32) (_ BitVec 32) V!1365 V!1365 (_ BitVec 32) Int) ListLongMap!593)

(assert (=> b!27409 (= lt!10676 (contains!252 (getCurrentListMap!142 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!27410 () Bool)

(declare-fun mapRes!1261 () Bool)

(assert (=> b!27410 (= e!17854 (and e!17857 mapRes!1261))))

(declare-fun condMapEmpty!1261 () Bool)

(declare-fun mapDefault!1261 () ValueCell!378)

(assert (=> b!27410 (= condMapEmpty!1261 (= (arr!731 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!378)) mapDefault!1261)))))

(declare-fun mapNonEmpty!1261 () Bool)

(declare-fun tp!3823 () Bool)

(assert (=> mapNonEmpty!1261 (= mapRes!1261 (and tp!3823 e!17858))))

(declare-fun mapRest!1261 () (Array (_ BitVec 32) ValueCell!378))

(declare-fun mapKey!1261 () (_ BitVec 32))

(declare-fun mapValue!1261 () ValueCell!378)

(assert (=> mapNonEmpty!1261 (= (arr!731 _values!1501) (store mapRest!1261 mapKey!1261 mapValue!1261))))

(declare-fun b!27411 () Bool)

(declare-fun res!16217 () Bool)

(assert (=> b!27411 (=> (not res!16217) (not e!17855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1553 (_ BitVec 32)) Bool)

(assert (=> b!27411 (= res!16217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1261 () Bool)

(assert (=> mapIsEmpty!1261 mapRes!1261))

(assert (= (and start!3896 res!16220) b!27408))

(assert (= (and b!27408 res!16221) b!27411))

(assert (= (and b!27411 res!16217) b!27404))

(assert (= (and b!27404 res!16219) b!27407))

(assert (= (and b!27407 res!16218) b!27409))

(assert (= (and b!27410 condMapEmpty!1261) mapIsEmpty!1261))

(assert (= (and b!27410 (not condMapEmpty!1261)) mapNonEmpty!1261))

(get-info :version)

(assert (= (and mapNonEmpty!1261 ((_ is ValueCellFull!378) mapValue!1261)) b!27405))

(assert (= (and b!27410 ((_ is ValueCellFull!378) mapDefault!1261)) b!27406))

(assert (= start!3896 b!27410))

(declare-fun m!21871 () Bool)

(assert (=> b!27404 m!21871))

(declare-fun m!21873 () Bool)

(assert (=> start!3896 m!21873))

(declare-fun m!21875 () Bool)

(assert (=> start!3896 m!21875))

(declare-fun m!21877 () Bool)

(assert (=> start!3896 m!21877))

(declare-fun m!21879 () Bool)

(assert (=> b!27409 m!21879))

(assert (=> b!27409 m!21879))

(declare-fun m!21881 () Bool)

(assert (=> b!27409 m!21881))

(declare-fun m!21883 () Bool)

(assert (=> mapNonEmpty!1261 m!21883))

(declare-fun m!21885 () Bool)

(assert (=> b!27407 m!21885))

(declare-fun m!21887 () Bool)

(assert (=> b!27411 m!21887))

(check-sat (not b!27407) b_and!1611 (not b!27409) (not b_next!801) (not mapNonEmpty!1261) (not b!27411) tp_is_empty!1155 (not start!3896) (not b!27404))
(check-sat b_and!1611 (not b_next!801))
