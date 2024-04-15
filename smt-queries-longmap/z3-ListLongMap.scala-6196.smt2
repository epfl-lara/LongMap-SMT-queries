; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79266 () Bool)

(assert start!79266)

(declare-fun b_free!17497 () Bool)

(declare-fun b_next!17497 () Bool)

(assert (=> start!79266 (= b_free!17497 (not b_next!17497))))

(declare-fun tp!60933 () Bool)

(declare-fun b_and!28537 () Bool)

(assert (=> start!79266 (= tp!60933 b_and!28537)))

(declare-fun b!930847 () Bool)

(declare-fun e!522753 () Bool)

(declare-fun tp_is_empty!20005 () Bool)

(assert (=> b!930847 (= e!522753 tp_is_empty!20005)))

(declare-fun b!930848 () Bool)

(declare-fun res!626936 () Bool)

(declare-fun e!522748 () Bool)

(assert (=> b!930848 (=> (not res!626936) (not e!522748))))

(declare-datatypes ((array!55919 0))(
  ( (array!55920 (arr!26905 (Array (_ BitVec 32) (_ BitVec 64))) (size!27366 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55919)

(declare-datatypes ((List!18964 0))(
  ( (Nil!18961) (Cons!18960 (h!20106 (_ BitVec 64)) (t!27012 List!18964)) )
))
(declare-fun arrayNoDuplicates!0 (array!55919 (_ BitVec 32) List!18964) Bool)

(assert (=> b!930848 (= res!626936 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18961))))

(declare-fun b!930849 () Bool)

(declare-fun e!522750 () Bool)

(assert (=> b!930849 (= e!522748 e!522750)))

(declare-fun res!626937 () Bool)

(assert (=> b!930849 (=> (not res!626937) (not e!522750))))

(declare-datatypes ((V!31639 0))(
  ( (V!31640 (val!10053 Int)) )
))
(declare-datatypes ((tuple2!13208 0))(
  ( (tuple2!13209 (_1!6615 (_ BitVec 64)) (_2!6615 V!31639)) )
))
(declare-datatypes ((List!18965 0))(
  ( (Nil!18962) (Cons!18961 (h!20107 tuple2!13208) (t!27013 List!18965)) )
))
(declare-datatypes ((ListLongMap!11895 0))(
  ( (ListLongMap!11896 (toList!5963 List!18965)) )
))
(declare-fun lt!419134 () ListLongMap!11895)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4965 (ListLongMap!11895 (_ BitVec 64)) Bool)

(assert (=> b!930849 (= res!626937 (contains!4965 lt!419134 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9521 0))(
  ( (ValueCellFull!9521 (v!12570 V!31639)) (EmptyCell!9521) )
))
(declare-datatypes ((array!55921 0))(
  ( (array!55922 (arr!26906 (Array (_ BitVec 32) ValueCell!9521)) (size!27367 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55921)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31639)

(declare-fun minValue!1173 () V!31639)

(declare-fun getCurrentListMap!3139 (array!55919 array!55921 (_ BitVec 32) (_ BitVec 32) V!31639 V!31639 (_ BitVec 32) Int) ListLongMap!11895)

(assert (=> b!930849 (= lt!419134 (getCurrentListMap!3139 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930850 () Bool)

(declare-fun e!522751 () Bool)

(assert (=> b!930850 (= e!522751 tp_is_empty!20005)))

(declare-fun mapNonEmpty!31764 () Bool)

(declare-fun mapRes!31764 () Bool)

(declare-fun tp!60932 () Bool)

(assert (=> mapNonEmpty!31764 (= mapRes!31764 (and tp!60932 e!522753))))

(declare-fun mapValue!31764 () ValueCell!9521)

(declare-fun mapRest!31764 () (Array (_ BitVec 32) ValueCell!9521))

(declare-fun mapKey!31764 () (_ BitVec 32))

(assert (=> mapNonEmpty!31764 (= (arr!26906 _values!1231) (store mapRest!31764 mapKey!31764 mapValue!31764))))

(declare-fun b!930851 () Bool)

(declare-fun res!626939 () Bool)

(assert (=> b!930851 (=> (not res!626939) (not e!522748))))

(assert (=> b!930851 (= res!626939 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27366 _keys!1487))))))

(declare-fun b!930852 () Bool)

(declare-fun res!626938 () Bool)

(assert (=> b!930852 (=> (not res!626938) (not e!522748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55919 (_ BitVec 32)) Bool)

(assert (=> b!930852 (= res!626938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930853 () Bool)

(declare-fun e!522749 () Bool)

(assert (=> b!930853 (= e!522749 (and e!522751 mapRes!31764))))

(declare-fun condMapEmpty!31764 () Bool)

(declare-fun mapDefault!31764 () ValueCell!9521)

(assert (=> b!930853 (= condMapEmpty!31764 (= (arr!26906 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9521)) mapDefault!31764)))))

(declare-fun mapIsEmpty!31764 () Bool)

(assert (=> mapIsEmpty!31764 mapRes!31764))

(declare-fun b!930855 () Bool)

(assert (=> b!930855 (= e!522750 false)))

(declare-fun lt!419135 () V!31639)

(declare-fun apply!759 (ListLongMap!11895 (_ BitVec 64)) V!31639)

(assert (=> b!930855 (= lt!419135 (apply!759 lt!419134 k0!1099))))

(declare-fun b!930854 () Bool)

(declare-fun res!626935 () Bool)

(assert (=> b!930854 (=> (not res!626935) (not e!522748))))

(assert (=> b!930854 (= res!626935 (and (= (size!27367 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27366 _keys!1487) (size!27367 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!626934 () Bool)

(assert (=> start!79266 (=> (not res!626934) (not e!522748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79266 (= res!626934 (validMask!0 mask!1881))))

(assert (=> start!79266 e!522748))

(assert (=> start!79266 true))

(declare-fun array_inv!21008 (array!55921) Bool)

(assert (=> start!79266 (and (array_inv!21008 _values!1231) e!522749)))

(assert (=> start!79266 tp!60933))

(declare-fun array_inv!21009 (array!55919) Bool)

(assert (=> start!79266 (array_inv!21009 _keys!1487)))

(assert (=> start!79266 tp_is_empty!20005))

(assert (= (and start!79266 res!626934) b!930854))

(assert (= (and b!930854 res!626935) b!930852))

(assert (= (and b!930852 res!626938) b!930848))

(assert (= (and b!930848 res!626936) b!930851))

(assert (= (and b!930851 res!626939) b!930849))

(assert (= (and b!930849 res!626937) b!930855))

(assert (= (and b!930853 condMapEmpty!31764) mapIsEmpty!31764))

(assert (= (and b!930853 (not condMapEmpty!31764)) mapNonEmpty!31764))

(get-info :version)

(assert (= (and mapNonEmpty!31764 ((_ is ValueCellFull!9521) mapValue!31764)) b!930847))

(assert (= (and b!930853 ((_ is ValueCellFull!9521) mapDefault!31764)) b!930850))

(assert (= start!79266 b!930853))

(declare-fun m!864325 () Bool)

(assert (=> mapNonEmpty!31764 m!864325))

(declare-fun m!864327 () Bool)

(assert (=> b!930848 m!864327))

(declare-fun m!864329 () Bool)

(assert (=> b!930852 m!864329))

(declare-fun m!864331 () Bool)

(assert (=> start!79266 m!864331))

(declare-fun m!864333 () Bool)

(assert (=> start!79266 m!864333))

(declare-fun m!864335 () Bool)

(assert (=> start!79266 m!864335))

(declare-fun m!864337 () Bool)

(assert (=> b!930849 m!864337))

(declare-fun m!864339 () Bool)

(assert (=> b!930849 m!864339))

(declare-fun m!864341 () Bool)

(assert (=> b!930855 m!864341))

(check-sat (not b!930855) tp_is_empty!20005 (not start!79266) (not b!930852) (not b_next!17497) (not b!930848) b_and!28537 (not b!930849) (not mapNonEmpty!31764))
(check-sat b_and!28537 (not b_next!17497))
