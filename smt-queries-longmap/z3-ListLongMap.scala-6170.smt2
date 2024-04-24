; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79296 () Bool)

(assert start!79296)

(declare-fun b_free!17341 () Bool)

(declare-fun b_next!17341 () Bool)

(assert (=> start!79296 (= b_free!17341 (not b_next!17341))))

(declare-fun tp!60465 () Bool)

(declare-fun b_and!28417 () Bool)

(assert (=> start!79296 (= tp!60465 b_and!28417)))

(declare-fun mapIsEmpty!31530 () Bool)

(declare-fun mapRes!31530 () Bool)

(assert (=> mapIsEmpty!31530 mapRes!31530))

(declare-fun mapNonEmpty!31530 () Bool)

(declare-fun tp!60464 () Bool)

(declare-fun e!522077 () Bool)

(assert (=> mapNonEmpty!31530 (= mapRes!31530 (and tp!60464 e!522077))))

(declare-fun mapKey!31530 () (_ BitVec 32))

(declare-datatypes ((V!31431 0))(
  ( (V!31432 (val!9975 Int)) )
))
(declare-datatypes ((ValueCell!9443 0))(
  ( (ValueCellFull!9443 (v!12490 V!31431)) (EmptyCell!9443) )
))
(declare-fun mapRest!31530 () (Array (_ BitVec 32) ValueCell!9443))

(declare-fun mapValue!31530 () ValueCell!9443)

(declare-datatypes ((array!55711 0))(
  ( (array!55712 (arr!26796 (Array (_ BitVec 32) ValueCell!9443)) (size!27256 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55711)

(assert (=> mapNonEmpty!31530 (= (arr!26796 _values!1231) (store mapRest!31530 mapKey!31530 mapValue!31530))))

(declare-fun b!929658 () Bool)

(declare-fun tp_is_empty!19849 () Bool)

(assert (=> b!929658 (= e!522077 tp_is_empty!19849)))

(declare-fun b!929659 () Bool)

(declare-fun e!522079 () Bool)

(declare-fun e!522078 () Bool)

(assert (=> b!929659 (= e!522079 (and e!522078 mapRes!31530))))

(declare-fun condMapEmpty!31530 () Bool)

(declare-fun mapDefault!31530 () ValueCell!9443)

(assert (=> b!929659 (= condMapEmpty!31530 (= (arr!26796 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9443)) mapDefault!31530)))))

(declare-fun res!625762 () Bool)

(declare-fun e!522075 () Bool)

(assert (=> start!79296 (=> (not res!625762) (not e!522075))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79296 (= res!625762 (validMask!0 mask!1881))))

(assert (=> start!79296 e!522075))

(assert (=> start!79296 true))

(declare-fun array_inv!20968 (array!55711) Bool)

(assert (=> start!79296 (and (array_inv!20968 _values!1231) e!522079)))

(assert (=> start!79296 tp!60465))

(declare-datatypes ((array!55713 0))(
  ( (array!55714 (arr!26797 (Array (_ BitVec 32) (_ BitVec 64))) (size!27257 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55713)

(declare-fun array_inv!20969 (array!55713) Bool)

(assert (=> start!79296 (array_inv!20969 _keys!1487)))

(assert (=> start!79296 tp_is_empty!19849))

(declare-fun b!929660 () Bool)

(declare-fun res!625761 () Bool)

(assert (=> b!929660 (=> (not res!625761) (not e!522075))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929660 (= res!625761 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27257 _keys!1487))))))

(declare-fun b!929661 () Bool)

(declare-fun res!625760 () Bool)

(assert (=> b!929661 (=> (not res!625760) (not e!522075))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!929661 (= res!625760 (and (= (size!27256 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27257 _keys!1487) (size!27256 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929662 () Bool)

(declare-fun res!625759 () Bool)

(assert (=> b!929662 (=> (not res!625759) (not e!522075))))

(declare-datatypes ((List!18831 0))(
  ( (Nil!18828) (Cons!18827 (h!19979 (_ BitVec 64)) (t!26880 List!18831)) )
))
(declare-fun arrayNoDuplicates!0 (array!55713 (_ BitVec 32) List!18831) Bool)

(assert (=> b!929662 (= res!625759 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18828))))

(declare-fun b!929663 () Bool)

(declare-fun e!522076 () Bool)

(assert (=> b!929663 (= e!522075 e!522076)))

(declare-fun res!625763 () Bool)

(assert (=> b!929663 (=> (not res!625763) (not e!522076))))

(declare-datatypes ((tuple2!13026 0))(
  ( (tuple2!13027 (_1!6524 (_ BitVec 64)) (_2!6524 V!31431)) )
))
(declare-datatypes ((List!18832 0))(
  ( (Nil!18829) (Cons!18828 (h!19980 tuple2!13026) (t!26881 List!18832)) )
))
(declare-datatypes ((ListLongMap!11725 0))(
  ( (ListLongMap!11726 (toList!5878 List!18832)) )
))
(declare-fun lt!419291 () ListLongMap!11725)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4948 (ListLongMap!11725 (_ BitVec 64)) Bool)

(assert (=> b!929663 (= res!625763 (contains!4948 lt!419291 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31431)

(declare-fun minValue!1173 () V!31431)

(declare-fun getCurrentListMap!3126 (array!55713 array!55711 (_ BitVec 32) (_ BitVec 32) V!31431 V!31431 (_ BitVec 32) Int) ListLongMap!11725)

(assert (=> b!929663 (= lt!419291 (getCurrentListMap!3126 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929664 () Bool)

(assert (=> b!929664 (= e!522076 false)))

(declare-fun lt!419290 () V!31431)

(declare-fun apply!728 (ListLongMap!11725 (_ BitVec 64)) V!31431)

(assert (=> b!929664 (= lt!419290 (apply!728 lt!419291 k0!1099))))

(declare-fun b!929665 () Bool)

(assert (=> b!929665 (= e!522078 tp_is_empty!19849)))

(declare-fun b!929666 () Bool)

(declare-fun res!625764 () Bool)

(assert (=> b!929666 (=> (not res!625764) (not e!522075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55713 (_ BitVec 32)) Bool)

(assert (=> b!929666 (= res!625764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79296 res!625762) b!929661))

(assert (= (and b!929661 res!625760) b!929666))

(assert (= (and b!929666 res!625764) b!929662))

(assert (= (and b!929662 res!625759) b!929660))

(assert (= (and b!929660 res!625761) b!929663))

(assert (= (and b!929663 res!625763) b!929664))

(assert (= (and b!929659 condMapEmpty!31530) mapIsEmpty!31530))

(assert (= (and b!929659 (not condMapEmpty!31530)) mapNonEmpty!31530))

(get-info :version)

(assert (= (and mapNonEmpty!31530 ((_ is ValueCellFull!9443) mapValue!31530)) b!929658))

(assert (= (and b!929659 ((_ is ValueCellFull!9443) mapDefault!31530)) b!929665))

(assert (= start!79296 b!929659))

(declare-fun m!864847 () Bool)

(assert (=> b!929666 m!864847))

(declare-fun m!864849 () Bool)

(assert (=> b!929664 m!864849))

(declare-fun m!864851 () Bool)

(assert (=> start!79296 m!864851))

(declare-fun m!864853 () Bool)

(assert (=> start!79296 m!864853))

(declare-fun m!864855 () Bool)

(assert (=> start!79296 m!864855))

(declare-fun m!864857 () Bool)

(assert (=> mapNonEmpty!31530 m!864857))

(declare-fun m!864859 () Bool)

(assert (=> b!929663 m!864859))

(declare-fun m!864861 () Bool)

(assert (=> b!929663 m!864861))

(declare-fun m!864863 () Bool)

(assert (=> b!929662 m!864863))

(check-sat b_and!28417 (not b!929664) (not start!79296) (not b!929663) (not b!929666) (not mapNonEmpty!31530) (not b!929662) (not b_next!17341) tp_is_empty!19849)
(check-sat b_and!28417 (not b_next!17341))
