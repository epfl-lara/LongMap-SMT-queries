; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79256 () Bool)

(assert start!79256)

(declare-fun b_free!17469 () Bool)

(declare-fun b_next!17469 () Bool)

(assert (=> start!79256 (= b_free!17469 (not b_next!17469))))

(declare-fun tp!60847 () Bool)

(declare-fun b_and!28535 () Bool)

(assert (=> start!79256 (= tp!60847 b_and!28535)))

(declare-fun b!930708 () Bool)

(declare-fun e!522646 () Bool)

(declare-fun tp_is_empty!19977 () Bool)

(assert (=> b!930708 (= e!522646 tp_is_empty!19977)))

(declare-fun b!930709 () Bool)

(declare-fun e!522644 () Bool)

(declare-fun e!522647 () Bool)

(declare-fun mapRes!31722 () Bool)

(assert (=> b!930709 (= e!522644 (and e!522647 mapRes!31722))))

(declare-fun condMapEmpty!31722 () Bool)

(declare-datatypes ((V!31601 0))(
  ( (V!31602 (val!10039 Int)) )
))
(declare-datatypes ((ValueCell!9507 0))(
  ( (ValueCellFull!9507 (v!12557 V!31601)) (EmptyCell!9507) )
))
(declare-datatypes ((array!55898 0))(
  ( (array!55899 (arr!26894 (Array (_ BitVec 32) ValueCell!9507)) (size!27353 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55898)

(declare-fun mapDefault!31722 () ValueCell!9507)

(assert (=> b!930709 (= condMapEmpty!31722 (= (arr!26894 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9507)) mapDefault!31722)))))

(declare-fun mapNonEmpty!31722 () Bool)

(declare-fun tp!60848 () Bool)

(assert (=> mapNonEmpty!31722 (= mapRes!31722 (and tp!60848 e!522646))))

(declare-fun mapKey!31722 () (_ BitVec 32))

(declare-fun mapRest!31722 () (Array (_ BitVec 32) ValueCell!9507))

(declare-fun mapValue!31722 () ValueCell!9507)

(assert (=> mapNonEmpty!31722 (= (arr!26894 _values!1231) (store mapRest!31722 mapKey!31722 mapValue!31722))))

(declare-fun b!930711 () Bool)

(declare-fun res!626795 () Bool)

(declare-fun e!522645 () Bool)

(assert (=> b!930711 (=> (not res!626795) (not e!522645))))

(declare-datatypes ((array!55900 0))(
  ( (array!55901 (arr!26895 (Array (_ BitVec 32) (_ BitVec 64))) (size!27354 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55900)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930711 (= res!626795 (and (= (size!27353 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27354 _keys!1487) (size!27353 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930712 () Bool)

(declare-fun e!522648 () Bool)

(assert (=> b!930712 (= e!522645 e!522648)))

(declare-fun res!626796 () Bool)

(assert (=> b!930712 (=> (not res!626796) (not e!522648))))

(declare-datatypes ((tuple2!13140 0))(
  ( (tuple2!13141 (_1!6581 (_ BitVec 64)) (_2!6581 V!31601)) )
))
(declare-datatypes ((List!18930 0))(
  ( (Nil!18927) (Cons!18926 (h!20072 tuple2!13140) (t!26987 List!18930)) )
))
(declare-datatypes ((ListLongMap!11837 0))(
  ( (ListLongMap!11838 (toList!5934 List!18930)) )
))
(declare-fun lt!419287 () ListLongMap!11837)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4983 (ListLongMap!11837 (_ BitVec 64)) Bool)

(assert (=> b!930712 (= res!626796 (contains!4983 lt!419287 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31601)

(declare-fun minValue!1173 () V!31601)

(declare-fun getCurrentListMap!3174 (array!55900 array!55898 (_ BitVec 32) (_ BitVec 32) V!31601 V!31601 (_ BitVec 32) Int) ListLongMap!11837)

(assert (=> b!930712 (= lt!419287 (getCurrentListMap!3174 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930713 () Bool)

(declare-fun res!626797 () Bool)

(assert (=> b!930713 (=> (not res!626797) (not e!522645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55900 (_ BitVec 32)) Bool)

(assert (=> b!930713 (= res!626797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930714 () Bool)

(assert (=> b!930714 (= e!522648 false)))

(declare-fun lt!419286 () V!31601)

(declare-fun apply!756 (ListLongMap!11837 (_ BitVec 64)) V!31601)

(assert (=> b!930714 (= lt!419286 (apply!756 lt!419287 k0!1099))))

(declare-fun mapIsEmpty!31722 () Bool)

(assert (=> mapIsEmpty!31722 mapRes!31722))

(declare-fun b!930710 () Bool)

(assert (=> b!930710 (= e!522647 tp_is_empty!19977)))

(declare-fun res!626792 () Bool)

(assert (=> start!79256 (=> (not res!626792) (not e!522645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79256 (= res!626792 (validMask!0 mask!1881))))

(assert (=> start!79256 e!522645))

(assert (=> start!79256 true))

(declare-fun array_inv!20932 (array!55898) Bool)

(assert (=> start!79256 (and (array_inv!20932 _values!1231) e!522644)))

(assert (=> start!79256 tp!60847))

(declare-fun array_inv!20933 (array!55900) Bool)

(assert (=> start!79256 (array_inv!20933 _keys!1487)))

(assert (=> start!79256 tp_is_empty!19977))

(declare-fun b!930715 () Bool)

(declare-fun res!626794 () Bool)

(assert (=> b!930715 (=> (not res!626794) (not e!522645))))

(declare-datatypes ((List!18931 0))(
  ( (Nil!18928) (Cons!18927 (h!20073 (_ BitVec 64)) (t!26988 List!18931)) )
))
(declare-fun arrayNoDuplicates!0 (array!55900 (_ BitVec 32) List!18931) Bool)

(assert (=> b!930715 (= res!626794 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18928))))

(declare-fun b!930716 () Bool)

(declare-fun res!626793 () Bool)

(assert (=> b!930716 (=> (not res!626793) (not e!522645))))

(assert (=> b!930716 (= res!626793 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27354 _keys!1487))))))

(assert (= (and start!79256 res!626792) b!930711))

(assert (= (and b!930711 res!626795) b!930713))

(assert (= (and b!930713 res!626797) b!930715))

(assert (= (and b!930715 res!626794) b!930716))

(assert (= (and b!930716 res!626793) b!930712))

(assert (= (and b!930712 res!626796) b!930714))

(assert (= (and b!930709 condMapEmpty!31722) mapIsEmpty!31722))

(assert (= (and b!930709 (not condMapEmpty!31722)) mapNonEmpty!31722))

(get-info :version)

(assert (= (and mapNonEmpty!31722 ((_ is ValueCellFull!9507) mapValue!31722)) b!930708))

(assert (= (and b!930709 ((_ is ValueCellFull!9507) mapDefault!31722)) b!930710))

(assert (= start!79256 b!930709))

(declare-fun m!864831 () Bool)

(assert (=> b!930714 m!864831))

(declare-fun m!864833 () Bool)

(assert (=> b!930712 m!864833))

(declare-fun m!864835 () Bool)

(assert (=> b!930712 m!864835))

(declare-fun m!864837 () Bool)

(assert (=> mapNonEmpty!31722 m!864837))

(declare-fun m!864839 () Bool)

(assert (=> start!79256 m!864839))

(declare-fun m!864841 () Bool)

(assert (=> start!79256 m!864841))

(declare-fun m!864843 () Bool)

(assert (=> start!79256 m!864843))

(declare-fun m!864845 () Bool)

(assert (=> b!930713 m!864845))

(declare-fun m!864847 () Bool)

(assert (=> b!930715 m!864847))

(check-sat (not b!930713) (not b!930712) (not start!79256) (not b!930714) (not b_next!17469) b_and!28535 (not mapNonEmpty!31722) (not b!930715) tp_is_empty!19977)
(check-sat b_and!28535 (not b_next!17469))
