; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79374 () Bool)

(assert start!79374)

(declare-fun b_free!17419 () Bool)

(declare-fun b_next!17419 () Bool)

(assert (=> start!79374 (= b_free!17419 (not b_next!17419))))

(declare-fun tp!60699 () Bool)

(declare-fun b_and!28495 () Bool)

(assert (=> start!79374 (= tp!60699 b_and!28495)))

(declare-fun b!930832 () Bool)

(declare-fun e!522778 () Bool)

(declare-fun e!522780 () Bool)

(declare-fun mapRes!31647 () Bool)

(assert (=> b!930832 (= e!522778 (and e!522780 mapRes!31647))))

(declare-fun condMapEmpty!31647 () Bool)

(declare-datatypes ((V!31535 0))(
  ( (V!31536 (val!10014 Int)) )
))
(declare-datatypes ((ValueCell!9482 0))(
  ( (ValueCellFull!9482 (v!12529 V!31535)) (EmptyCell!9482) )
))
(declare-datatypes ((array!55861 0))(
  ( (array!55862 (arr!26871 (Array (_ BitVec 32) ValueCell!9482)) (size!27331 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55861)

(declare-fun mapDefault!31647 () ValueCell!9482)

(assert (=> b!930832 (= condMapEmpty!31647 (= (arr!26871 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9482)) mapDefault!31647)))))

(declare-fun b!930833 () Bool)

(declare-fun res!626584 () Bool)

(declare-fun e!522781 () Bool)

(assert (=> b!930833 (=> (not res!626584) (not e!522781))))

(declare-datatypes ((array!55863 0))(
  ( (array!55864 (arr!26872 (Array (_ BitVec 32) (_ BitVec 64))) (size!27332 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55863)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55863 (_ BitVec 32)) Bool)

(assert (=> b!930833 (= res!626584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930834 () Bool)

(declare-fun res!626589 () Bool)

(declare-fun e!522776 () Bool)

(assert (=> b!930834 (=> (not res!626589) (not e!522776))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930834 (= res!626589 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930835 () Bool)

(declare-fun res!626586 () Bool)

(assert (=> b!930835 (=> (not res!626586) (not e!522781))))

(declare-datatypes ((List!18886 0))(
  ( (Nil!18883) (Cons!18882 (h!20034 (_ BitVec 64)) (t!26935 List!18886)) )
))
(declare-fun arrayNoDuplicates!0 (array!55863 (_ BitVec 32) List!18886) Bool)

(assert (=> b!930835 (= res!626586 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18883))))

(declare-fun b!930836 () Bool)

(declare-fun res!626588 () Bool)

(assert (=> b!930836 (=> (not res!626588) (not e!522776))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31535)

(declare-datatypes ((tuple2!13092 0))(
  ( (tuple2!13093 (_1!6557 (_ BitVec 64)) (_2!6557 V!31535)) )
))
(declare-datatypes ((List!18887 0))(
  ( (Nil!18884) (Cons!18883 (h!20035 tuple2!13092) (t!26936 List!18887)) )
))
(declare-datatypes ((ListLongMap!11791 0))(
  ( (ListLongMap!11792 (toList!5911 List!18887)) )
))
(declare-fun lt!419516 () ListLongMap!11791)

(declare-fun apply!752 (ListLongMap!11791 (_ BitVec 64)) V!31535)

(assert (=> b!930836 (= res!626588 (= (apply!752 lt!419516 k0!1099) v!791))))

(declare-fun b!930837 () Bool)

(declare-fun res!626583 () Bool)

(assert (=> b!930837 (=> (not res!626583) (not e!522781))))

(assert (=> b!930837 (= res!626583 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27332 _keys!1487))))))

(declare-fun mapIsEmpty!31647 () Bool)

(assert (=> mapIsEmpty!31647 mapRes!31647))

(declare-fun b!930838 () Bool)

(declare-fun e!522779 () Bool)

(declare-fun tp_is_empty!19927 () Bool)

(assert (=> b!930838 (= e!522779 tp_is_empty!19927)))

(declare-fun mapNonEmpty!31647 () Bool)

(declare-fun tp!60698 () Bool)

(assert (=> mapNonEmpty!31647 (= mapRes!31647 (and tp!60698 e!522779))))

(declare-fun mapKey!31647 () (_ BitVec 32))

(declare-fun mapRest!31647 () (Array (_ BitVec 32) ValueCell!9482))

(declare-fun mapValue!31647 () ValueCell!9482)

(assert (=> mapNonEmpty!31647 (= (arr!26871 _values!1231) (store mapRest!31647 mapKey!31647 mapValue!31647))))

(declare-fun res!626587 () Bool)

(assert (=> start!79374 (=> (not res!626587) (not e!522781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79374 (= res!626587 (validMask!0 mask!1881))))

(assert (=> start!79374 e!522781))

(assert (=> start!79374 true))

(assert (=> start!79374 tp_is_empty!19927))

(declare-fun array_inv!21016 (array!55861) Bool)

(assert (=> start!79374 (and (array_inv!21016 _values!1231) e!522778)))

(assert (=> start!79374 tp!60699))

(declare-fun array_inv!21017 (array!55863) Bool)

(assert (=> start!79374 (array_inv!21017 _keys!1487)))

(declare-fun b!930839 () Bool)

(assert (=> b!930839 (= e!522780 tp_is_empty!19927)))

(declare-fun b!930840 () Bool)

(assert (=> b!930840 (= e!522781 e!522776)))

(declare-fun res!626582 () Bool)

(assert (=> b!930840 (=> (not res!626582) (not e!522776))))

(declare-fun contains!4980 (ListLongMap!11791 (_ BitVec 64)) Bool)

(assert (=> b!930840 (= res!626582 (contains!4980 lt!419516 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31535)

(declare-fun minValue!1173 () V!31535)

(declare-fun getCurrentListMap!3158 (array!55863 array!55861 (_ BitVec 32) (_ BitVec 32) V!31535 V!31535 (_ BitVec 32) Int) ListLongMap!11791)

(assert (=> b!930840 (= lt!419516 (getCurrentListMap!3158 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930841 () Bool)

(declare-fun res!626585 () Bool)

(assert (=> b!930841 (=> (not res!626585) (not e!522781))))

(assert (=> b!930841 (= res!626585 (and (= (size!27331 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27332 _keys!1487) (size!27331 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930842 () Bool)

(assert (=> b!930842 (= e!522776 false)))

(declare-fun lt!419515 () Bool)

(assert (=> b!930842 (= lt!419515 (contains!4980 (getCurrentListMap!3158 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(assert (= (and start!79374 res!626587) b!930841))

(assert (= (and b!930841 res!626585) b!930833))

(assert (= (and b!930833 res!626584) b!930835))

(assert (= (and b!930835 res!626586) b!930837))

(assert (= (and b!930837 res!626583) b!930840))

(assert (= (and b!930840 res!626582) b!930836))

(assert (= (and b!930836 res!626588) b!930834))

(assert (= (and b!930834 res!626589) b!930842))

(assert (= (and b!930832 condMapEmpty!31647) mapIsEmpty!31647))

(assert (= (and b!930832 (not condMapEmpty!31647)) mapNonEmpty!31647))

(get-info :version)

(assert (= (and mapNonEmpty!31647 ((_ is ValueCellFull!9482) mapValue!31647)) b!930838))

(assert (= (and b!930832 ((_ is ValueCellFull!9482) mapDefault!31647)) b!930839))

(assert (= start!79374 b!930832))

(declare-fun m!865621 () Bool)

(assert (=> b!930836 m!865621))

(declare-fun m!865623 () Bool)

(assert (=> start!79374 m!865623))

(declare-fun m!865625 () Bool)

(assert (=> start!79374 m!865625))

(declare-fun m!865627 () Bool)

(assert (=> start!79374 m!865627))

(declare-fun m!865629 () Bool)

(assert (=> b!930842 m!865629))

(assert (=> b!930842 m!865629))

(declare-fun m!865631 () Bool)

(assert (=> b!930842 m!865631))

(declare-fun m!865633 () Bool)

(assert (=> b!930835 m!865633))

(declare-fun m!865635 () Bool)

(assert (=> b!930840 m!865635))

(declare-fun m!865637 () Bool)

(assert (=> b!930840 m!865637))

(declare-fun m!865639 () Bool)

(assert (=> b!930833 m!865639))

(declare-fun m!865641 () Bool)

(assert (=> mapNonEmpty!31647 m!865641))

(check-sat (not b!930840) (not mapNonEmpty!31647) (not b!930836) (not start!79374) tp_is_empty!19927 b_and!28495 (not b!930842) (not b_next!17419) (not b!930835) (not b!930833))
(check-sat b_and!28495 (not b_next!17419))
