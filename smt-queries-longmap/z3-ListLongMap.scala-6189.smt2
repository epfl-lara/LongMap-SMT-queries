; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79410 () Bool)

(assert start!79410)

(declare-fun b_free!17455 () Bool)

(declare-fun b_next!17455 () Bool)

(assert (=> start!79410 (= b_free!17455 (not b_next!17455))))

(declare-fun tp!60806 () Bool)

(declare-fun b_and!28531 () Bool)

(assert (=> start!79410 (= tp!60806 b_and!28531)))

(declare-fun mapNonEmpty!31701 () Bool)

(declare-fun mapRes!31701 () Bool)

(declare-fun tp!60807 () Bool)

(declare-fun e!523100 () Bool)

(assert (=> mapNonEmpty!31701 (= mapRes!31701 (and tp!60807 e!523100))))

(declare-fun mapKey!31701 () (_ BitVec 32))

(declare-datatypes ((V!31583 0))(
  ( (V!31584 (val!10032 Int)) )
))
(declare-datatypes ((ValueCell!9500 0))(
  ( (ValueCellFull!9500 (v!12547 V!31583)) (EmptyCell!9500) )
))
(declare-datatypes ((array!55931 0))(
  ( (array!55932 (arr!26906 (Array (_ BitVec 32) ValueCell!9500)) (size!27366 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55931)

(declare-fun mapValue!31701 () ValueCell!9500)

(declare-fun mapRest!31701 () (Array (_ BitVec 32) ValueCell!9500))

(assert (=> mapNonEmpty!31701 (= (arr!26906 _values!1231) (store mapRest!31701 mapKey!31701 mapValue!31701))))

(declare-fun b!931422 () Bool)

(declare-fun res!627015 () Bool)

(declare-fun e!523101 () Bool)

(assert (=> b!931422 (=> (not res!627015) (not e!523101))))

(declare-datatypes ((array!55933 0))(
  ( (array!55934 (arr!26907 (Array (_ BitVec 32) (_ BitVec 64))) (size!27367 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55933)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55933 (_ BitVec 32)) Bool)

(assert (=> b!931422 (= res!627015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931423 () Bool)

(declare-fun e!523104 () Bool)

(declare-fun tp_is_empty!19963 () Bool)

(assert (=> b!931423 (= e!523104 tp_is_empty!19963)))

(declare-fun b!931424 () Bool)

(declare-fun res!627014 () Bool)

(assert (=> b!931424 (=> (not res!627014) (not e!523101))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931424 (= res!627014 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27367 _keys!1487))))))

(declare-fun b!931425 () Bool)

(declare-fun res!627010 () Bool)

(assert (=> b!931425 (=> (not res!627010) (not e!523101))))

(declare-datatypes ((List!18912 0))(
  ( (Nil!18909) (Cons!18908 (h!20060 (_ BitVec 64)) (t!26961 List!18912)) )
))
(declare-fun arrayNoDuplicates!0 (array!55933 (_ BitVec 32) List!18912) Bool)

(assert (=> b!931425 (= res!627010 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18909))))

(declare-fun b!931426 () Bool)

(declare-fun e!523103 () Bool)

(assert (=> b!931426 (= e!523103 (and e!523104 mapRes!31701))))

(declare-fun condMapEmpty!31701 () Bool)

(declare-fun mapDefault!31701 () ValueCell!9500)

(assert (=> b!931426 (= condMapEmpty!31701 (= (arr!26906 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9500)) mapDefault!31701)))))

(declare-fun b!931427 () Bool)

(assert (=> b!931427 (= e!523100 tp_is_empty!19963)))

(declare-fun b!931428 () Bool)

(declare-fun res!627012 () Bool)

(assert (=> b!931428 (=> (not res!627012) (not e!523101))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!931428 (= res!627012 (and (= (size!27366 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27367 _keys!1487) (size!27366 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931429 () Bool)

(declare-fun e!523102 () Bool)

(assert (=> b!931429 (= e!523102 false)))

(declare-fun lt!419605 () V!31583)

(declare-datatypes ((tuple2!13124 0))(
  ( (tuple2!13125 (_1!6573 (_ BitVec 64)) (_2!6573 V!31583)) )
))
(declare-datatypes ((List!18913 0))(
  ( (Nil!18910) (Cons!18909 (h!20061 tuple2!13124) (t!26962 List!18913)) )
))
(declare-datatypes ((ListLongMap!11823 0))(
  ( (ListLongMap!11824 (toList!5927 List!18913)) )
))
(declare-fun lt!419606 () ListLongMap!11823)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!763 (ListLongMap!11823 (_ BitVec 64)) V!31583)

(assert (=> b!931429 (= lt!419605 (apply!763 lt!419606 k0!1099))))

(declare-fun b!931430 () Bool)

(assert (=> b!931430 (= e!523101 e!523102)))

(declare-fun res!627011 () Bool)

(assert (=> b!931430 (=> (not res!627011) (not e!523102))))

(declare-fun contains!4993 (ListLongMap!11823 (_ BitVec 64)) Bool)

(assert (=> b!931430 (= res!627011 (contains!4993 lt!419606 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31583)

(declare-fun minValue!1173 () V!31583)

(declare-fun getCurrentListMap!3171 (array!55933 array!55931 (_ BitVec 32) (_ BitVec 32) V!31583 V!31583 (_ BitVec 32) Int) ListLongMap!11823)

(assert (=> b!931430 (= lt!419606 (getCurrentListMap!3171 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31701 () Bool)

(assert (=> mapIsEmpty!31701 mapRes!31701))

(declare-fun res!627013 () Bool)

(assert (=> start!79410 (=> (not res!627013) (not e!523101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79410 (= res!627013 (validMask!0 mask!1881))))

(assert (=> start!79410 e!523101))

(assert (=> start!79410 true))

(declare-fun array_inv!21040 (array!55931) Bool)

(assert (=> start!79410 (and (array_inv!21040 _values!1231) e!523103)))

(assert (=> start!79410 tp!60806))

(declare-fun array_inv!21041 (array!55933) Bool)

(assert (=> start!79410 (array_inv!21041 _keys!1487)))

(assert (=> start!79410 tp_is_empty!19963))

(assert (= (and start!79410 res!627013) b!931428))

(assert (= (and b!931428 res!627012) b!931422))

(assert (= (and b!931422 res!627015) b!931425))

(assert (= (and b!931425 res!627010) b!931424))

(assert (= (and b!931424 res!627014) b!931430))

(assert (= (and b!931430 res!627011) b!931429))

(assert (= (and b!931426 condMapEmpty!31701) mapIsEmpty!31701))

(assert (= (and b!931426 (not condMapEmpty!31701)) mapNonEmpty!31701))

(get-info :version)

(assert (= (and mapNonEmpty!31701 ((_ is ValueCellFull!9500) mapValue!31701)) b!931427))

(assert (= (and b!931426 ((_ is ValueCellFull!9500) mapDefault!31701)) b!931423))

(assert (= start!79410 b!931426))

(declare-fun m!865999 () Bool)

(assert (=> mapNonEmpty!31701 m!865999))

(declare-fun m!866001 () Bool)

(assert (=> start!79410 m!866001))

(declare-fun m!866003 () Bool)

(assert (=> start!79410 m!866003))

(declare-fun m!866005 () Bool)

(assert (=> start!79410 m!866005))

(declare-fun m!866007 () Bool)

(assert (=> b!931425 m!866007))

(declare-fun m!866009 () Bool)

(assert (=> b!931429 m!866009))

(declare-fun m!866011 () Bool)

(assert (=> b!931430 m!866011))

(declare-fun m!866013 () Bool)

(assert (=> b!931430 m!866013))

(declare-fun m!866015 () Bool)

(assert (=> b!931422 m!866015))

(check-sat b_and!28531 (not start!79410) tp_is_empty!19963 (not b!931422) (not b!931425) (not b!931429) (not b!931430) (not mapNonEmpty!31701) (not b_next!17455))
(check-sat b_and!28531 (not b_next!17455))
