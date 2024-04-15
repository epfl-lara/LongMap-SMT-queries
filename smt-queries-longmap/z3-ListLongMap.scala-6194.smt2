; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79254 () Bool)

(assert start!79254)

(declare-fun b_free!17485 () Bool)

(declare-fun b_next!17485 () Bool)

(assert (=> start!79254 (= b_free!17485 (not b_next!17485))))

(declare-fun tp!60896 () Bool)

(declare-fun b_and!28525 () Bool)

(assert (=> start!79254 (= tp!60896 b_and!28525)))

(declare-fun b!930685 () Bool)

(declare-fun e!522644 () Bool)

(declare-fun tp_is_empty!19993 () Bool)

(assert (=> b!930685 (= e!522644 tp_is_empty!19993)))

(declare-fun b!930686 () Bool)

(declare-fun res!626829 () Bool)

(declare-fun e!522640 () Bool)

(assert (=> b!930686 (=> (not res!626829) (not e!522640))))

(declare-datatypes ((array!55895 0))(
  ( (array!55896 (arr!26893 (Array (_ BitVec 32) (_ BitVec 64))) (size!27354 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55895)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55895 (_ BitVec 32)) Bool)

(assert (=> b!930686 (= res!626829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930687 () Bool)

(declare-fun e!522641 () Bool)

(declare-fun mapRes!31746 () Bool)

(assert (=> b!930687 (= e!522641 (and e!522644 mapRes!31746))))

(declare-fun condMapEmpty!31746 () Bool)

(declare-datatypes ((V!31623 0))(
  ( (V!31624 (val!10047 Int)) )
))
(declare-datatypes ((ValueCell!9515 0))(
  ( (ValueCellFull!9515 (v!12564 V!31623)) (EmptyCell!9515) )
))
(declare-datatypes ((array!55897 0))(
  ( (array!55898 (arr!26894 (Array (_ BitVec 32) ValueCell!9515)) (size!27355 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55897)

(declare-fun mapDefault!31746 () ValueCell!9515)

(assert (=> b!930687 (= condMapEmpty!31746 (= (arr!26894 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9515)) mapDefault!31746)))))

(declare-fun b!930688 () Bool)

(declare-fun e!522643 () Bool)

(assert (=> b!930688 (= e!522643 tp_is_empty!19993)))

(declare-fun b!930689 () Bool)

(declare-fun res!626831 () Bool)

(assert (=> b!930689 (=> (not res!626831) (not e!522640))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930689 (= res!626831 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27354 _keys!1487))))))

(declare-fun b!930690 () Bool)

(declare-fun res!626830 () Bool)

(assert (=> b!930690 (=> (not res!626830) (not e!522640))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930690 (= res!626830 (and (= (size!27355 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27354 _keys!1487) (size!27355 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31746 () Bool)

(declare-fun tp!60897 () Bool)

(assert (=> mapNonEmpty!31746 (= mapRes!31746 (and tp!60897 e!522643))))

(declare-fun mapValue!31746 () ValueCell!9515)

(declare-fun mapRest!31746 () (Array (_ BitVec 32) ValueCell!9515))

(declare-fun mapKey!31746 () (_ BitVec 32))

(assert (=> mapNonEmpty!31746 (= (arr!26894 _values!1231) (store mapRest!31746 mapKey!31746 mapValue!31746))))

(declare-fun b!930692 () Bool)

(declare-fun e!522642 () Bool)

(assert (=> b!930692 (= e!522642 false)))

(declare-fun lt!419099 () V!31623)

(declare-datatypes ((tuple2!13200 0))(
  ( (tuple2!13201 (_1!6611 (_ BitVec 64)) (_2!6611 V!31623)) )
))
(declare-datatypes ((List!18957 0))(
  ( (Nil!18954) (Cons!18953 (h!20099 tuple2!13200) (t!27005 List!18957)) )
))
(declare-datatypes ((ListLongMap!11887 0))(
  ( (ListLongMap!11888 (toList!5959 List!18957)) )
))
(declare-fun lt!419098 () ListLongMap!11887)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!755 (ListLongMap!11887 (_ BitVec 64)) V!31623)

(assert (=> b!930692 (= lt!419099 (apply!755 lt!419098 k0!1099))))

(declare-fun b!930693 () Bool)

(declare-fun res!626827 () Bool)

(assert (=> b!930693 (=> (not res!626827) (not e!522640))))

(declare-datatypes ((List!18958 0))(
  ( (Nil!18955) (Cons!18954 (h!20100 (_ BitVec 64)) (t!27006 List!18958)) )
))
(declare-fun arrayNoDuplicates!0 (array!55895 (_ BitVec 32) List!18958) Bool)

(assert (=> b!930693 (= res!626827 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18955))))

(declare-fun mapIsEmpty!31746 () Bool)

(assert (=> mapIsEmpty!31746 mapRes!31746))

(declare-fun b!930691 () Bool)

(assert (=> b!930691 (= e!522640 e!522642)))

(declare-fun res!626828 () Bool)

(assert (=> b!930691 (=> (not res!626828) (not e!522642))))

(declare-fun contains!4961 (ListLongMap!11887 (_ BitVec 64)) Bool)

(assert (=> b!930691 (= res!626828 (contains!4961 lt!419098 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31623)

(declare-fun minValue!1173 () V!31623)

(declare-fun getCurrentListMap!3135 (array!55895 array!55897 (_ BitVec 32) (_ BitVec 32) V!31623 V!31623 (_ BitVec 32) Int) ListLongMap!11887)

(assert (=> b!930691 (= lt!419098 (getCurrentListMap!3135 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!626826 () Bool)

(assert (=> start!79254 (=> (not res!626826) (not e!522640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79254 (= res!626826 (validMask!0 mask!1881))))

(assert (=> start!79254 e!522640))

(assert (=> start!79254 true))

(declare-fun array_inv!21000 (array!55897) Bool)

(assert (=> start!79254 (and (array_inv!21000 _values!1231) e!522641)))

(assert (=> start!79254 tp!60896))

(declare-fun array_inv!21001 (array!55895) Bool)

(assert (=> start!79254 (array_inv!21001 _keys!1487)))

(assert (=> start!79254 tp_is_empty!19993))

(assert (= (and start!79254 res!626826) b!930690))

(assert (= (and b!930690 res!626830) b!930686))

(assert (= (and b!930686 res!626829) b!930693))

(assert (= (and b!930693 res!626827) b!930689))

(assert (= (and b!930689 res!626831) b!930691))

(assert (= (and b!930691 res!626828) b!930692))

(assert (= (and b!930687 condMapEmpty!31746) mapIsEmpty!31746))

(assert (= (and b!930687 (not condMapEmpty!31746)) mapNonEmpty!31746))

(get-info :version)

(assert (= (and mapNonEmpty!31746 ((_ is ValueCellFull!9515) mapValue!31746)) b!930688))

(assert (= (and b!930687 ((_ is ValueCellFull!9515) mapDefault!31746)) b!930685))

(assert (= start!79254 b!930687))

(declare-fun m!864217 () Bool)

(assert (=> b!930691 m!864217))

(declare-fun m!864219 () Bool)

(assert (=> b!930691 m!864219))

(declare-fun m!864221 () Bool)

(assert (=> start!79254 m!864221))

(declare-fun m!864223 () Bool)

(assert (=> start!79254 m!864223))

(declare-fun m!864225 () Bool)

(assert (=> start!79254 m!864225))

(declare-fun m!864227 () Bool)

(assert (=> mapNonEmpty!31746 m!864227))

(declare-fun m!864229 () Bool)

(assert (=> b!930693 m!864229))

(declare-fun m!864231 () Bool)

(assert (=> b!930692 m!864231))

(declare-fun m!864233 () Bool)

(assert (=> b!930686 m!864233))

(check-sat (not b!930691) (not mapNonEmpty!31746) (not b!930693) (not b!930692) (not start!79254) (not b!930686) b_and!28525 tp_is_empty!19993 (not b_next!17485))
(check-sat b_and!28525 (not b_next!17485))
