; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79314 () Bool)

(assert start!79314)

(declare-fun b_free!17359 () Bool)

(declare-fun b_next!17359 () Bool)

(assert (=> start!79314 (= b_free!17359 (not b_next!17359))))

(declare-fun tp!60519 () Bool)

(declare-fun b_and!28435 () Bool)

(assert (=> start!79314 (= tp!60519 b_and!28435)))

(declare-fun res!625921 () Bool)

(declare-fun e!522241 () Bool)

(assert (=> start!79314 (=> (not res!625921) (not e!522241))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79314 (= res!625921 (validMask!0 mask!1881))))

(assert (=> start!79314 e!522241))

(assert (=> start!79314 true))

(declare-datatypes ((V!31455 0))(
  ( (V!31456 (val!9984 Int)) )
))
(declare-datatypes ((ValueCell!9452 0))(
  ( (ValueCellFull!9452 (v!12499 V!31455)) (EmptyCell!9452) )
))
(declare-datatypes ((array!55743 0))(
  ( (array!55744 (arr!26812 (Array (_ BitVec 32) ValueCell!9452)) (size!27272 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55743)

(declare-fun e!522238 () Bool)

(declare-fun array_inv!20980 (array!55743) Bool)

(assert (=> start!79314 (and (array_inv!20980 _values!1231) e!522238)))

(assert (=> start!79314 tp!60519))

(declare-datatypes ((array!55745 0))(
  ( (array!55746 (arr!26813 (Array (_ BitVec 32) (_ BitVec 64))) (size!27273 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55745)

(declare-fun array_inv!20981 (array!55745) Bool)

(assert (=> start!79314 (array_inv!20981 _keys!1487)))

(declare-fun tp_is_empty!19867 () Bool)

(assert (=> start!79314 tp_is_empty!19867))

(declare-fun b!929901 () Bool)

(declare-fun e!522236 () Bool)

(declare-fun mapRes!31557 () Bool)

(assert (=> b!929901 (= e!522238 (and e!522236 mapRes!31557))))

(declare-fun condMapEmpty!31557 () Bool)

(declare-fun mapDefault!31557 () ValueCell!9452)

(assert (=> b!929901 (= condMapEmpty!31557 (= (arr!26812 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9452)) mapDefault!31557)))))

(declare-fun mapIsEmpty!31557 () Bool)

(assert (=> mapIsEmpty!31557 mapRes!31557))

(declare-fun b!929902 () Bool)

(declare-fun res!625923 () Bool)

(assert (=> b!929902 (=> (not res!625923) (not e!522241))))

(declare-datatypes ((List!18843 0))(
  ( (Nil!18840) (Cons!18839 (h!19991 (_ BitVec 64)) (t!26892 List!18843)) )
))
(declare-fun arrayNoDuplicates!0 (array!55745 (_ BitVec 32) List!18843) Bool)

(assert (=> b!929902 (= res!625923 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18840))))

(declare-fun b!929903 () Bool)

(declare-fun res!625922 () Bool)

(assert (=> b!929903 (=> (not res!625922) (not e!522241))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!929903 (= res!625922 (and (= (size!27272 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27273 _keys!1487) (size!27272 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929904 () Bool)

(declare-fun e!522239 () Bool)

(assert (=> b!929904 (= e!522239 false)))

(declare-fun lt!419345 () V!31455)

(declare-datatypes ((tuple2!13038 0))(
  ( (tuple2!13039 (_1!6530 (_ BitVec 64)) (_2!6530 V!31455)) )
))
(declare-datatypes ((List!18844 0))(
  ( (Nil!18841) (Cons!18840 (h!19992 tuple2!13038) (t!26893 List!18844)) )
))
(declare-datatypes ((ListLongMap!11737 0))(
  ( (ListLongMap!11738 (toList!5884 List!18844)) )
))
(declare-fun lt!419344 () ListLongMap!11737)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!731 (ListLongMap!11737 (_ BitVec 64)) V!31455)

(assert (=> b!929904 (= lt!419345 (apply!731 lt!419344 k0!1099))))

(declare-fun b!929905 () Bool)

(assert (=> b!929905 (= e!522241 e!522239)))

(declare-fun res!625924 () Bool)

(assert (=> b!929905 (=> (not res!625924) (not e!522239))))

(declare-fun contains!4954 (ListLongMap!11737 (_ BitVec 64)) Bool)

(assert (=> b!929905 (= res!625924 (contains!4954 lt!419344 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31455)

(declare-fun minValue!1173 () V!31455)

(declare-fun getCurrentListMap!3132 (array!55745 array!55743 (_ BitVec 32) (_ BitVec 32) V!31455 V!31455 (_ BitVec 32) Int) ListLongMap!11737)

(assert (=> b!929905 (= lt!419344 (getCurrentListMap!3132 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929906 () Bool)

(declare-fun e!522237 () Bool)

(assert (=> b!929906 (= e!522237 tp_is_empty!19867)))

(declare-fun mapNonEmpty!31557 () Bool)

(declare-fun tp!60518 () Bool)

(assert (=> mapNonEmpty!31557 (= mapRes!31557 (and tp!60518 e!522237))))

(declare-fun mapKey!31557 () (_ BitVec 32))

(declare-fun mapValue!31557 () ValueCell!9452)

(declare-fun mapRest!31557 () (Array (_ BitVec 32) ValueCell!9452))

(assert (=> mapNonEmpty!31557 (= (arr!26812 _values!1231) (store mapRest!31557 mapKey!31557 mapValue!31557))))

(declare-fun b!929907 () Bool)

(declare-fun res!625925 () Bool)

(assert (=> b!929907 (=> (not res!625925) (not e!522241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55745 (_ BitVec 32)) Bool)

(assert (=> b!929907 (= res!625925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929908 () Bool)

(assert (=> b!929908 (= e!522236 tp_is_empty!19867)))

(declare-fun b!929909 () Bool)

(declare-fun res!625926 () Bool)

(assert (=> b!929909 (=> (not res!625926) (not e!522241))))

(assert (=> b!929909 (= res!625926 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27273 _keys!1487))))))

(assert (= (and start!79314 res!625921) b!929903))

(assert (= (and b!929903 res!625922) b!929907))

(assert (= (and b!929907 res!625925) b!929902))

(assert (= (and b!929902 res!625923) b!929909))

(assert (= (and b!929909 res!625926) b!929905))

(assert (= (and b!929905 res!625924) b!929904))

(assert (= (and b!929901 condMapEmpty!31557) mapIsEmpty!31557))

(assert (= (and b!929901 (not condMapEmpty!31557)) mapNonEmpty!31557))

(get-info :version)

(assert (= (and mapNonEmpty!31557 ((_ is ValueCellFull!9452) mapValue!31557)) b!929906))

(assert (= (and b!929901 ((_ is ValueCellFull!9452) mapDefault!31557)) b!929908))

(assert (= start!79314 b!929901))

(declare-fun m!865009 () Bool)

(assert (=> mapNonEmpty!31557 m!865009))

(declare-fun m!865011 () Bool)

(assert (=> start!79314 m!865011))

(declare-fun m!865013 () Bool)

(assert (=> start!79314 m!865013))

(declare-fun m!865015 () Bool)

(assert (=> start!79314 m!865015))

(declare-fun m!865017 () Bool)

(assert (=> b!929902 m!865017))

(declare-fun m!865019 () Bool)

(assert (=> b!929905 m!865019))

(declare-fun m!865021 () Bool)

(assert (=> b!929905 m!865021))

(declare-fun m!865023 () Bool)

(assert (=> b!929904 m!865023))

(declare-fun m!865025 () Bool)

(assert (=> b!929907 m!865025))

(check-sat (not start!79314) (not b!929905) (not b!929907) (not b_next!17359) b_and!28435 (not b!929902) (not mapNonEmpty!31557) tp_is_empty!19867 (not b!929904))
(check-sat b_and!28435 (not b_next!17359))
