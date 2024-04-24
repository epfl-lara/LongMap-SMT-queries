; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79580 () Bool)

(assert start!79580)

(declare-fun b_free!17599 () Bool)

(declare-fun b_next!17599 () Bool)

(assert (=> start!79580 (= b_free!17599 (not b_next!17599))))

(declare-fun tp!61241 () Bool)

(declare-fun b_and!28767 () Bool)

(assert (=> start!79580 (= tp!61241 b_and!28767)))

(declare-fun res!628929 () Bool)

(declare-fun e!524638 () Bool)

(assert (=> start!79580 (=> (not res!628929) (not e!524638))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79580 (= res!628929 (validMask!0 mask!1881))))

(assert (=> start!79580 e!524638))

(assert (=> start!79580 true))

(declare-fun tp_is_empty!20107 () Bool)

(assert (=> start!79580 tp_is_empty!20107))

(declare-datatypes ((V!31775 0))(
  ( (V!31776 (val!10104 Int)) )
))
(declare-datatypes ((ValueCell!9572 0))(
  ( (ValueCellFull!9572 (v!12620 V!31775)) (EmptyCell!9572) )
))
(declare-datatypes ((array!56205 0))(
  ( (array!56206 (arr!27042 (Array (_ BitVec 32) ValueCell!9572)) (size!27502 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56205)

(declare-fun e!524634 () Bool)

(declare-fun array_inv!21138 (array!56205) Bool)

(assert (=> start!79580 (and (array_inv!21138 _values!1231) e!524634)))

(assert (=> start!79580 tp!61241))

(declare-datatypes ((array!56207 0))(
  ( (array!56208 (arr!27043 (Array (_ BitVec 32) (_ BitVec 64))) (size!27503 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56207)

(declare-fun array_inv!21139 (array!56207) Bool)

(assert (=> start!79580 (array_inv!21139 _keys!1487)))

(declare-fun b!934168 () Bool)

(declare-fun e!524636 () Bool)

(assert (=> b!934168 (= e!524636 tp_is_empty!20107)))

(declare-fun b!934169 () Bool)

(declare-fun e!524637 () Bool)

(assert (=> b!934169 (= e!524638 e!524637)))

(declare-fun res!628930 () Bool)

(assert (=> b!934169 (=> (not res!628930) (not e!524637))))

(declare-datatypes ((tuple2!13232 0))(
  ( (tuple2!13233 (_1!6627 (_ BitVec 64)) (_2!6627 V!31775)) )
))
(declare-datatypes ((List!19016 0))(
  ( (Nil!19013) (Cons!19012 (h!20164 tuple2!13232) (t!27151 List!19016)) )
))
(declare-datatypes ((ListLongMap!11931 0))(
  ( (ListLongMap!11932 (toList!5981 List!19016)) )
))
(declare-fun lt!420674 () ListLongMap!11931)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5046 (ListLongMap!11931 (_ BitVec 64)) Bool)

(assert (=> b!934169 (= res!628930 (contains!5046 lt!420674 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31775)

(declare-fun minValue!1173 () V!31775)

(declare-fun getCurrentListMap!3223 (array!56207 array!56205 (_ BitVec 32) (_ BitVec 32) V!31775 V!31775 (_ BitVec 32) Int) ListLongMap!11931)

(assert (=> b!934169 (= lt!420674 (getCurrentListMap!3223 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!934170 () Bool)

(declare-fun mapRes!31920 () Bool)

(assert (=> b!934170 (= e!524634 (and e!524636 mapRes!31920))))

(declare-fun condMapEmpty!31920 () Bool)

(declare-fun mapDefault!31920 () ValueCell!9572)

(assert (=> b!934170 (= condMapEmpty!31920 (= (arr!27042 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9572)) mapDefault!31920)))))

(declare-fun mapIsEmpty!31920 () Bool)

(assert (=> mapIsEmpty!31920 mapRes!31920))

(declare-fun b!934171 () Bool)

(declare-fun res!628935 () Bool)

(assert (=> b!934171 (=> (not res!628935) (not e!524637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934171 (= res!628935 (validKeyInArray!0 k0!1099))))

(declare-fun b!934172 () Bool)

(declare-fun e!524635 () Bool)

(assert (=> b!934172 (= e!524635 tp_is_empty!20107)))

(declare-fun b!934173 () Bool)

(declare-fun res!628937 () Bool)

(assert (=> b!934173 (=> (not res!628937) (not e!524638))))

(assert (=> b!934173 (= res!628937 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27503 _keys!1487))))))

(declare-fun b!934174 () Bool)

(declare-fun res!628934 () Bool)

(assert (=> b!934174 (=> (not res!628934) (not e!524637))))

(declare-fun v!791 () V!31775)

(declare-fun apply!807 (ListLongMap!11931 (_ BitVec 64)) V!31775)

(assert (=> b!934174 (= res!628934 (= (apply!807 lt!420674 k0!1099) v!791))))

(declare-fun b!934175 () Bool)

(declare-fun res!628933 () Bool)

(assert (=> b!934175 (=> (not res!628933) (not e!524638))))

(declare-datatypes ((List!19017 0))(
  ( (Nil!19014) (Cons!19013 (h!20165 (_ BitVec 64)) (t!27152 List!19017)) )
))
(declare-fun arrayNoDuplicates!0 (array!56207 (_ BitVec 32) List!19017) Bool)

(assert (=> b!934175 (= res!628933 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19014))))

(declare-fun mapNonEmpty!31920 () Bool)

(declare-fun tp!61242 () Bool)

(assert (=> mapNonEmpty!31920 (= mapRes!31920 (and tp!61242 e!524635))))

(declare-fun mapValue!31920 () ValueCell!9572)

(declare-fun mapRest!31920 () (Array (_ BitVec 32) ValueCell!9572))

(declare-fun mapKey!31920 () (_ BitVec 32))

(assert (=> mapNonEmpty!31920 (= (arr!27042 _values!1231) (store mapRest!31920 mapKey!31920 mapValue!31920))))

(declare-fun b!934176 () Bool)

(declare-fun res!628931 () Bool)

(assert (=> b!934176 (=> (not res!628931) (not e!524638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56207 (_ BitVec 32)) Bool)

(assert (=> b!934176 (= res!628931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934177 () Bool)

(declare-fun res!628932 () Bool)

(assert (=> b!934177 (=> (not res!628932) (not e!524637))))

(assert (=> b!934177 (= res!628932 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934178 () Bool)

(declare-fun res!628936 () Bool)

(assert (=> b!934178 (=> (not res!628936) (not e!524638))))

(assert (=> b!934178 (= res!628936 (and (= (size!27502 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27503 _keys!1487) (size!27502 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!934179 () Bool)

(declare-fun e!524640 () Bool)

(assert (=> b!934179 (= e!524640 (not true))))

(assert (=> b!934179 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19014)))

(declare-datatypes ((Unit!31488 0))(
  ( (Unit!31489) )
))
(declare-fun lt!420676 () Unit!31488)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56207 (_ BitVec 32) (_ BitVec 32)) Unit!31488)

(assert (=> b!934179 (= lt!420676 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420678 () tuple2!13232)

(declare-fun +!2809 (ListLongMap!11931 tuple2!13232) ListLongMap!11931)

(assert (=> b!934179 (contains!5046 (+!2809 lt!420674 lt!420678) k0!1099)))

(declare-fun lt!420672 () (_ BitVec 64))

(declare-fun lt!420677 () V!31775)

(declare-fun lt!420675 () Unit!31488)

(declare-fun addStillContains!512 (ListLongMap!11931 (_ BitVec 64) V!31775 (_ BitVec 64)) Unit!31488)

(assert (=> b!934179 (= lt!420675 (addStillContains!512 lt!420674 lt!420672 lt!420677 k0!1099))))

(assert (=> b!934179 (= (getCurrentListMap!3223 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2809 (getCurrentListMap!3223 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420678))))

(assert (=> b!934179 (= lt!420678 (tuple2!13233 lt!420672 lt!420677))))

(declare-fun get!14247 (ValueCell!9572 V!31775) V!31775)

(declare-fun dynLambda!1606 (Int (_ BitVec 64)) V!31775)

(assert (=> b!934179 (= lt!420677 (get!14247 (select (arr!27042 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1606 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420673 () Unit!31488)

(declare-fun lemmaListMapRecursiveValidKeyArray!189 (array!56207 array!56205 (_ BitVec 32) (_ BitVec 32) V!31775 V!31775 (_ BitVec 32) Int) Unit!31488)

(assert (=> b!934179 (= lt!420673 (lemmaListMapRecursiveValidKeyArray!189 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!934180 () Bool)

(assert (=> b!934180 (= e!524637 e!524640)))

(declare-fun res!628938 () Bool)

(assert (=> b!934180 (=> (not res!628938) (not e!524640))))

(assert (=> b!934180 (= res!628938 (validKeyInArray!0 lt!420672))))

(assert (=> b!934180 (= lt!420672 (select (arr!27043 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (= (and start!79580 res!628929) b!934178))

(assert (= (and b!934178 res!628936) b!934176))

(assert (= (and b!934176 res!628931) b!934175))

(assert (= (and b!934175 res!628933) b!934173))

(assert (= (and b!934173 res!628937) b!934169))

(assert (= (and b!934169 res!628930) b!934174))

(assert (= (and b!934174 res!628934) b!934177))

(assert (= (and b!934177 res!628932) b!934171))

(assert (= (and b!934171 res!628935) b!934180))

(assert (= (and b!934180 res!628938) b!934179))

(assert (= (and b!934170 condMapEmpty!31920) mapIsEmpty!31920))

(assert (= (and b!934170 (not condMapEmpty!31920)) mapNonEmpty!31920))

(get-info :version)

(assert (= (and mapNonEmpty!31920 ((_ is ValueCellFull!9572) mapValue!31920)) b!934172))

(assert (= (and b!934170 ((_ is ValueCellFull!9572) mapDefault!31920)) b!934168))

(assert (= start!79580 b!934170))

(declare-fun b_lambda!13947 () Bool)

(assert (=> (not b_lambda!13947) (not b!934179)))

(declare-fun t!27150 () Bool)

(declare-fun tb!5985 () Bool)

(assert (=> (and start!79580 (= defaultEntry!1235 defaultEntry!1235) t!27150) tb!5985))

(declare-fun result!11803 () Bool)

(assert (=> tb!5985 (= result!11803 tp_is_empty!20107)))

(assert (=> b!934179 t!27150))

(declare-fun b_and!28769 () Bool)

(assert (= b_and!28767 (and (=> t!27150 result!11803) b_and!28769)))

(declare-fun m!868661 () Bool)

(assert (=> b!934169 m!868661))

(declare-fun m!868663 () Bool)

(assert (=> b!934169 m!868663))

(declare-fun m!868665 () Bool)

(assert (=> b!934180 m!868665))

(declare-fun m!868667 () Bool)

(assert (=> b!934180 m!868667))

(declare-fun m!868669 () Bool)

(assert (=> b!934171 m!868669))

(declare-fun m!868671 () Bool)

(assert (=> b!934174 m!868671))

(declare-fun m!868673 () Bool)

(assert (=> mapNonEmpty!31920 m!868673))

(declare-fun m!868675 () Bool)

(assert (=> b!934179 m!868675))

(declare-fun m!868677 () Bool)

(assert (=> b!934179 m!868677))

(assert (=> b!934179 m!868675))

(assert (=> b!934179 m!868677))

(declare-fun m!868679 () Bool)

(assert (=> b!934179 m!868679))

(declare-fun m!868681 () Bool)

(assert (=> b!934179 m!868681))

(declare-fun m!868683 () Bool)

(assert (=> b!934179 m!868683))

(declare-fun m!868685 () Bool)

(assert (=> b!934179 m!868685))

(declare-fun m!868687 () Bool)

(assert (=> b!934179 m!868687))

(declare-fun m!868689 () Bool)

(assert (=> b!934179 m!868689))

(declare-fun m!868691 () Bool)

(assert (=> b!934179 m!868691))

(assert (=> b!934179 m!868689))

(declare-fun m!868693 () Bool)

(assert (=> b!934179 m!868693))

(assert (=> b!934179 m!868685))

(declare-fun m!868695 () Bool)

(assert (=> b!934179 m!868695))

(declare-fun m!868697 () Bool)

(assert (=> b!934179 m!868697))

(declare-fun m!868699 () Bool)

(assert (=> start!79580 m!868699))

(declare-fun m!868701 () Bool)

(assert (=> start!79580 m!868701))

(declare-fun m!868703 () Bool)

(assert (=> start!79580 m!868703))

(declare-fun m!868705 () Bool)

(assert (=> b!934175 m!868705))

(declare-fun m!868707 () Bool)

(assert (=> b!934176 m!868707))

(check-sat (not b!934169) b_and!28769 (not b!934174) tp_is_empty!20107 (not b_lambda!13947) (not b_next!17599) (not b!934171) (not b!934180) (not mapNonEmpty!31920) (not b!934175) (not b!934179) (not b!934176) (not start!79580))
(check-sat b_and!28769 (not b_next!17599))
