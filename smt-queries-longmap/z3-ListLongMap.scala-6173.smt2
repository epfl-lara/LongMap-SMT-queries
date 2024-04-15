; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79128 () Bool)

(assert start!79128)

(declare-fun b_free!17359 () Bool)

(declare-fun b_next!17359 () Bool)

(assert (=> start!79128 (= b_free!17359 (not b_next!17359))))

(declare-fun tp!60519 () Bool)

(declare-fun b_and!28399 () Bool)

(assert (=> start!79128 (= tp!60519 b_and!28399)))

(declare-fun mapNonEmpty!31557 () Bool)

(declare-fun mapRes!31557 () Bool)

(declare-fun tp!60518 () Bool)

(declare-fun e!521510 () Bool)

(assert (=> mapNonEmpty!31557 (= mapRes!31557 (and tp!60518 e!521510))))

(declare-datatypes ((V!31455 0))(
  ( (V!31456 (val!9984 Int)) )
))
(declare-datatypes ((ValueCell!9452 0))(
  ( (ValueCellFull!9452 (v!12501 V!31455)) (EmptyCell!9452) )
))
(declare-fun mapRest!31557 () (Array (_ BitVec 32) ValueCell!9452))

(declare-fun mapKey!31557 () (_ BitVec 32))

(declare-datatypes ((array!55661 0))(
  ( (array!55662 (arr!26776 (Array (_ BitVec 32) ValueCell!9452)) (size!27237 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55661)

(declare-fun mapValue!31557 () ValueCell!9452)

(assert (=> mapNonEmpty!31557 (= (arr!26776 _values!1231) (store mapRest!31557 mapKey!31557 mapValue!31557))))

(declare-fun mapIsEmpty!31557 () Bool)

(assert (=> mapIsEmpty!31557 mapRes!31557))

(declare-fun res!625469 () Bool)

(declare-fun e!521509 () Bool)

(assert (=> start!79128 (=> (not res!625469) (not e!521509))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79128 (= res!625469 (validMask!0 mask!1881))))

(assert (=> start!79128 e!521509))

(assert (=> start!79128 true))

(declare-fun e!521506 () Bool)

(declare-fun array_inv!20936 (array!55661) Bool)

(assert (=> start!79128 (and (array_inv!20936 _values!1231) e!521506)))

(assert (=> start!79128 tp!60519))

(declare-datatypes ((array!55663 0))(
  ( (array!55664 (arr!26777 (Array (_ BitVec 32) (_ BitVec 64))) (size!27238 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55663)

(declare-fun array_inv!20937 (array!55663) Bool)

(assert (=> start!79128 (array_inv!20937 _keys!1487)))

(declare-fun tp_is_empty!19867 () Bool)

(assert (=> start!79128 tp_is_empty!19867))

(declare-fun b!928759 () Bool)

(assert (=> b!928759 (= e!521510 tp_is_empty!19867)))

(declare-fun b!928760 () Bool)

(declare-fun res!625468 () Bool)

(assert (=> b!928760 (=> (not res!625468) (not e!521509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55663 (_ BitVec 32)) Bool)

(assert (=> b!928760 (= res!625468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928761 () Bool)

(declare-fun res!625472 () Bool)

(assert (=> b!928761 (=> (not res!625472) (not e!521509))))

(declare-datatypes ((List!18868 0))(
  ( (Nil!18865) (Cons!18864 (h!20010 (_ BitVec 64)) (t!26916 List!18868)) )
))
(declare-fun arrayNoDuplicates!0 (array!55663 (_ BitVec 32) List!18868) Bool)

(assert (=> b!928761 (= res!625472 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18865))))

(declare-fun b!928762 () Bool)

(declare-fun e!521508 () Bool)

(assert (=> b!928762 (= e!521509 e!521508)))

(declare-fun res!625471 () Bool)

(assert (=> b!928762 (=> (not res!625471) (not e!521508))))

(declare-datatypes ((tuple2!13102 0))(
  ( (tuple2!13103 (_1!6562 (_ BitVec 64)) (_2!6562 V!31455)) )
))
(declare-datatypes ((List!18869 0))(
  ( (Nil!18866) (Cons!18865 (h!20011 tuple2!13102) (t!26917 List!18869)) )
))
(declare-datatypes ((ListLongMap!11789 0))(
  ( (ListLongMap!11790 (toList!5910 List!18869)) )
))
(declare-fun lt!418747 () ListLongMap!11789)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4919 (ListLongMap!11789 (_ BitVec 64)) Bool)

(assert (=> b!928762 (= res!625471 (contains!4919 lt!418747 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31455)

(declare-fun minValue!1173 () V!31455)

(declare-fun getCurrentListMap!3093 (array!55663 array!55661 (_ BitVec 32) (_ BitVec 32) V!31455 V!31455 (_ BitVec 32) Int) ListLongMap!11789)

(assert (=> b!928762 (= lt!418747 (getCurrentListMap!3093 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928763 () Bool)

(declare-fun e!521511 () Bool)

(assert (=> b!928763 (= e!521506 (and e!521511 mapRes!31557))))

(declare-fun condMapEmpty!31557 () Bool)

(declare-fun mapDefault!31557 () ValueCell!9452)

(assert (=> b!928763 (= condMapEmpty!31557 (= (arr!26776 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9452)) mapDefault!31557)))))

(declare-fun b!928764 () Bool)

(assert (=> b!928764 (= e!521511 tp_is_empty!19867)))

(declare-fun b!928765 () Bool)

(declare-fun res!625470 () Bool)

(assert (=> b!928765 (=> (not res!625470) (not e!521509))))

(assert (=> b!928765 (= res!625470 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27238 _keys!1487))))))

(declare-fun b!928766 () Bool)

(declare-fun res!625467 () Bool)

(assert (=> b!928766 (=> (not res!625467) (not e!521509))))

(assert (=> b!928766 (= res!625467 (and (= (size!27237 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27238 _keys!1487) (size!27237 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928767 () Bool)

(assert (=> b!928767 (= e!521508 false)))

(declare-fun lt!418748 () V!31455)

(declare-fun apply!718 (ListLongMap!11789 (_ BitVec 64)) V!31455)

(assert (=> b!928767 (= lt!418748 (apply!718 lt!418747 k0!1099))))

(assert (= (and start!79128 res!625469) b!928766))

(assert (= (and b!928766 res!625467) b!928760))

(assert (= (and b!928760 res!625468) b!928761))

(assert (= (and b!928761 res!625472) b!928765))

(assert (= (and b!928765 res!625470) b!928762))

(assert (= (and b!928762 res!625471) b!928767))

(assert (= (and b!928763 condMapEmpty!31557) mapIsEmpty!31557))

(assert (= (and b!928763 (not condMapEmpty!31557)) mapNonEmpty!31557))

(get-info :version)

(assert (= (and mapNonEmpty!31557 ((_ is ValueCellFull!9452) mapValue!31557)) b!928759))

(assert (= (and b!928763 ((_ is ValueCellFull!9452) mapDefault!31557)) b!928764))

(assert (= start!79128 b!928763))

(declare-fun m!862957 () Bool)

(assert (=> b!928760 m!862957))

(declare-fun m!862959 () Bool)

(assert (=> start!79128 m!862959))

(declare-fun m!862961 () Bool)

(assert (=> start!79128 m!862961))

(declare-fun m!862963 () Bool)

(assert (=> start!79128 m!862963))

(declare-fun m!862965 () Bool)

(assert (=> mapNonEmpty!31557 m!862965))

(declare-fun m!862967 () Bool)

(assert (=> b!928761 m!862967))

(declare-fun m!862969 () Bool)

(assert (=> b!928767 m!862969))

(declare-fun m!862971 () Bool)

(assert (=> b!928762 m!862971))

(declare-fun m!862973 () Bool)

(assert (=> b!928762 m!862973))

(check-sat tp_is_empty!19867 (not b_next!17359) (not mapNonEmpty!31557) (not b!928762) (not b!928760) (not b!928761) (not start!79128) (not b!928767) b_and!28399)
(check-sat b_and!28399 (not b_next!17359))
