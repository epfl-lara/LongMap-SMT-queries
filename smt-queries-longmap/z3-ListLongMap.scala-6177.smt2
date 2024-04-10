; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79172 () Bool)

(assert start!79172)

(declare-fun b_free!17385 () Bool)

(declare-fun b_next!17385 () Bool)

(assert (=> start!79172 (= b_free!17385 (not b_next!17385))))

(declare-fun tp!60596 () Bool)

(declare-fun b_and!28451 () Bool)

(assert (=> start!79172 (= tp!60596 b_and!28451)))

(declare-fun b!929368 () Bool)

(declare-fun res!625837 () Bool)

(declare-fun e!521888 () Bool)

(assert (=> b!929368 (=> (not res!625837) (not e!521888))))

(declare-datatypes ((array!55740 0))(
  ( (array!55741 (arr!26815 (Array (_ BitVec 32) (_ BitVec 64))) (size!27274 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55740)

(declare-datatypes ((List!18863 0))(
  ( (Nil!18860) (Cons!18859 (h!20005 (_ BitVec 64)) (t!26920 List!18863)) )
))
(declare-fun arrayNoDuplicates!0 (array!55740 (_ BitVec 32) List!18863) Bool)

(assert (=> b!929368 (= res!625837 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18860))))

(declare-fun b!929369 () Bool)

(declare-fun res!625835 () Bool)

(assert (=> b!929369 (=> (not res!625835) (not e!521888))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55740 (_ BitVec 32)) Bool)

(assert (=> b!929369 (= res!625835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929370 () Bool)

(declare-fun res!625836 () Bool)

(assert (=> b!929370 (=> (not res!625836) (not e!521888))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31489 0))(
  ( (V!31490 (val!9997 Int)) )
))
(declare-datatypes ((ValueCell!9465 0))(
  ( (ValueCellFull!9465 (v!12515 V!31489)) (EmptyCell!9465) )
))
(declare-datatypes ((array!55742 0))(
  ( (array!55743 (arr!26816 (Array (_ BitVec 32) ValueCell!9465)) (size!27275 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55742)

(assert (=> b!929370 (= res!625836 (and (= (size!27275 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27274 _keys!1487) (size!27275 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929371 () Bool)

(declare-fun res!625830 () Bool)

(declare-fun e!521893 () Bool)

(assert (=> b!929371 (=> (not res!625830) (not e!521893))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31489)

(declare-datatypes ((tuple2!13070 0))(
  ( (tuple2!13071 (_1!6546 (_ BitVec 64)) (_2!6546 V!31489)) )
))
(declare-datatypes ((List!18864 0))(
  ( (Nil!18861) (Cons!18860 (h!20006 tuple2!13070) (t!26921 List!18864)) )
))
(declare-datatypes ((ListLongMap!11767 0))(
  ( (ListLongMap!11768 (toList!5899 List!18864)) )
))
(declare-fun lt!419053 () ListLongMap!11767)

(declare-fun apply!725 (ListLongMap!11767 (_ BitVec 64)) V!31489)

(assert (=> b!929371 (= res!625830 (= (apply!725 lt!419053 k0!1099) v!791))))

(declare-fun b!929372 () Bool)

(assert (=> b!929372 (= e!521893 false)))

(declare-fun lt!419052 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31489)

(declare-fun minValue!1173 () V!31489)

(declare-fun contains!4952 (ListLongMap!11767 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3143 (array!55740 array!55742 (_ BitVec 32) (_ BitVec 32) V!31489 V!31489 (_ BitVec 32) Int) ListLongMap!11767)

(assert (=> b!929372 (= lt!419052 (contains!4952 (getCurrentListMap!3143 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun res!625834 () Bool)

(assert (=> start!79172 (=> (not res!625834) (not e!521888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79172 (= res!625834 (validMask!0 mask!1881))))

(assert (=> start!79172 e!521888))

(assert (=> start!79172 true))

(declare-fun tp_is_empty!19893 () Bool)

(assert (=> start!79172 tp_is_empty!19893))

(declare-fun e!521890 () Bool)

(declare-fun array_inv!20868 (array!55742) Bool)

(assert (=> start!79172 (and (array_inv!20868 _values!1231) e!521890)))

(assert (=> start!79172 tp!60596))

(declare-fun array_inv!20869 (array!55740) Bool)

(assert (=> start!79172 (array_inv!20869 _keys!1487)))

(declare-fun b!929373 () Bool)

(declare-fun e!521892 () Bool)

(assert (=> b!929373 (= e!521892 tp_is_empty!19893)))

(declare-fun mapIsEmpty!31596 () Bool)

(declare-fun mapRes!31596 () Bool)

(assert (=> mapIsEmpty!31596 mapRes!31596))

(declare-fun mapNonEmpty!31596 () Bool)

(declare-fun tp!60595 () Bool)

(assert (=> mapNonEmpty!31596 (= mapRes!31596 (and tp!60595 e!521892))))

(declare-fun mapKey!31596 () (_ BitVec 32))

(declare-fun mapValue!31596 () ValueCell!9465)

(declare-fun mapRest!31596 () (Array (_ BitVec 32) ValueCell!9465))

(assert (=> mapNonEmpty!31596 (= (arr!26816 _values!1231) (store mapRest!31596 mapKey!31596 mapValue!31596))))

(declare-fun b!929374 () Bool)

(declare-fun res!625832 () Bool)

(assert (=> b!929374 (=> (not res!625832) (not e!521888))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929374 (= res!625832 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27274 _keys!1487))))))

(declare-fun b!929375 () Bool)

(assert (=> b!929375 (= e!521888 e!521893)))

(declare-fun res!625833 () Bool)

(assert (=> b!929375 (=> (not res!625833) (not e!521893))))

(assert (=> b!929375 (= res!625833 (contains!4952 lt!419053 k0!1099))))

(assert (=> b!929375 (= lt!419053 (getCurrentListMap!3143 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929376 () Bool)

(declare-fun res!625831 () Bool)

(assert (=> b!929376 (=> (not res!625831) (not e!521893))))

(assert (=> b!929376 (= res!625831 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!929377 () Bool)

(declare-fun e!521891 () Bool)

(assert (=> b!929377 (= e!521890 (and e!521891 mapRes!31596))))

(declare-fun condMapEmpty!31596 () Bool)

(declare-fun mapDefault!31596 () ValueCell!9465)

(assert (=> b!929377 (= condMapEmpty!31596 (= (arr!26816 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9465)) mapDefault!31596)))))

(declare-fun b!929378 () Bool)

(assert (=> b!929378 (= e!521891 tp_is_empty!19893)))

(assert (= (and start!79172 res!625834) b!929370))

(assert (= (and b!929370 res!625836) b!929369))

(assert (= (and b!929369 res!625835) b!929368))

(assert (= (and b!929368 res!625837) b!929374))

(assert (= (and b!929374 res!625832) b!929375))

(assert (= (and b!929375 res!625833) b!929371))

(assert (= (and b!929371 res!625830) b!929376))

(assert (= (and b!929376 res!625831) b!929372))

(assert (= (and b!929377 condMapEmpty!31596) mapIsEmpty!31596))

(assert (= (and b!929377 (not condMapEmpty!31596)) mapNonEmpty!31596))

(get-info :version)

(assert (= (and mapNonEmpty!31596 ((_ is ValueCellFull!9465) mapValue!31596)) b!929373))

(assert (= (and b!929377 ((_ is ValueCellFull!9465) mapDefault!31596)) b!929378))

(assert (= start!79172 b!929377))

(declare-fun m!863953 () Bool)

(assert (=> b!929368 m!863953))

(declare-fun m!863955 () Bool)

(assert (=> b!929371 m!863955))

(declare-fun m!863957 () Bool)

(assert (=> b!929375 m!863957))

(declare-fun m!863959 () Bool)

(assert (=> b!929375 m!863959))

(declare-fun m!863961 () Bool)

(assert (=> mapNonEmpty!31596 m!863961))

(declare-fun m!863963 () Bool)

(assert (=> start!79172 m!863963))

(declare-fun m!863965 () Bool)

(assert (=> start!79172 m!863965))

(declare-fun m!863967 () Bool)

(assert (=> start!79172 m!863967))

(declare-fun m!863969 () Bool)

(assert (=> b!929369 m!863969))

(declare-fun m!863971 () Bool)

(assert (=> b!929372 m!863971))

(assert (=> b!929372 m!863971))

(declare-fun m!863973 () Bool)

(assert (=> b!929372 m!863973))

(check-sat (not start!79172) (not b_next!17385) (not b!929368) b_and!28451 (not b!929372) (not mapNonEmpty!31596) (not b!929369) (not b!929375) (not b!929371) tp_is_empty!19893)
(check-sat b_and!28451 (not b_next!17385))
