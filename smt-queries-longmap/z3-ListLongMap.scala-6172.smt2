; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79142 () Bool)

(assert start!79142)

(declare-fun b_free!17355 () Bool)

(declare-fun b_next!17355 () Bool)

(assert (=> start!79142 (= b_free!17355 (not b_next!17355))))

(declare-fun tp!60506 () Bool)

(declare-fun b_and!28421 () Bool)

(assert (=> start!79142 (= tp!60506 b_and!28421)))

(declare-fun b!928944 () Bool)

(declare-fun res!625546 () Bool)

(declare-fun e!521622 () Bool)

(assert (=> b!928944 (=> (not res!625546) (not e!521622))))

(declare-datatypes ((array!55680 0))(
  ( (array!55681 (arr!26785 (Array (_ BitVec 32) (_ BitVec 64))) (size!27244 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55680)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31449 0))(
  ( (V!31450 (val!9982 Int)) )
))
(declare-datatypes ((ValueCell!9450 0))(
  ( (ValueCellFull!9450 (v!12500 V!31449)) (EmptyCell!9450) )
))
(declare-datatypes ((array!55682 0))(
  ( (array!55683 (arr!26786 (Array (_ BitVec 32) ValueCell!9450)) (size!27245 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55682)

(assert (=> b!928944 (= res!625546 (and (= (size!27245 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27244 _keys!1487) (size!27245 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928945 () Bool)

(declare-fun res!625542 () Bool)

(assert (=> b!928945 (=> (not res!625542) (not e!521622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55680 (_ BitVec 32)) Bool)

(assert (=> b!928945 (= res!625542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928946 () Bool)

(declare-fun res!625543 () Bool)

(assert (=> b!928946 (=> (not res!625543) (not e!521622))))

(declare-datatypes ((List!18843 0))(
  ( (Nil!18840) (Cons!18839 (h!19985 (_ BitVec 64)) (t!26900 List!18843)) )
))
(declare-fun arrayNoDuplicates!0 (array!55680 (_ BitVec 32) List!18843) Bool)

(assert (=> b!928946 (= res!625543 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18840))))

(declare-fun b!928947 () Bool)

(declare-fun e!521620 () Bool)

(declare-fun e!521619 () Bool)

(declare-fun mapRes!31551 () Bool)

(assert (=> b!928947 (= e!521620 (and e!521619 mapRes!31551))))

(declare-fun condMapEmpty!31551 () Bool)

(declare-fun mapDefault!31551 () ValueCell!9450)

(assert (=> b!928947 (= condMapEmpty!31551 (= (arr!26786 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9450)) mapDefault!31551)))))

(declare-fun b!928948 () Bool)

(declare-fun tp_is_empty!19863 () Bool)

(assert (=> b!928948 (= e!521619 tp_is_empty!19863)))

(declare-fun b!928949 () Bool)

(declare-fun res!625541 () Bool)

(assert (=> b!928949 (=> (not res!625541) (not e!521622))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!928949 (= res!625541 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27244 _keys!1487))))))

(declare-fun res!625544 () Bool)

(assert (=> start!79142 (=> (not res!625544) (not e!521622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79142 (= res!625544 (validMask!0 mask!1881))))

(assert (=> start!79142 e!521622))

(assert (=> start!79142 true))

(declare-fun array_inv!20850 (array!55682) Bool)

(assert (=> start!79142 (and (array_inv!20850 _values!1231) e!521620)))

(assert (=> start!79142 tp!60506))

(declare-fun array_inv!20851 (array!55680) Bool)

(assert (=> start!79142 (array_inv!20851 _keys!1487)))

(assert (=> start!79142 tp_is_empty!19863))

(declare-fun mapNonEmpty!31551 () Bool)

(declare-fun tp!60505 () Bool)

(declare-fun e!521623 () Bool)

(assert (=> mapNonEmpty!31551 (= mapRes!31551 (and tp!60505 e!521623))))

(declare-fun mapValue!31551 () ValueCell!9450)

(declare-fun mapKey!31551 () (_ BitVec 32))

(declare-fun mapRest!31551 () (Array (_ BitVec 32) ValueCell!9450))

(assert (=> mapNonEmpty!31551 (= (arr!26786 _values!1231) (store mapRest!31551 mapKey!31551 mapValue!31551))))

(declare-fun b!928950 () Bool)

(declare-fun e!521618 () Bool)

(assert (=> b!928950 (= e!521622 e!521618)))

(declare-fun res!625545 () Bool)

(assert (=> b!928950 (=> (not res!625545) (not e!521618))))

(declare-datatypes ((tuple2!13046 0))(
  ( (tuple2!13047 (_1!6534 (_ BitVec 64)) (_2!6534 V!31449)) )
))
(declare-datatypes ((List!18844 0))(
  ( (Nil!18841) (Cons!18840 (h!19986 tuple2!13046) (t!26901 List!18844)) )
))
(declare-datatypes ((ListLongMap!11743 0))(
  ( (ListLongMap!11744 (toList!5887 List!18844)) )
))
(declare-fun lt!418971 () ListLongMap!11743)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4943 (ListLongMap!11743 (_ BitVec 64)) Bool)

(assert (=> b!928950 (= res!625545 (contains!4943 lt!418971 k0!1099))))

(declare-fun zeroValue!1173 () V!31449)

(declare-fun minValue!1173 () V!31449)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3134 (array!55680 array!55682 (_ BitVec 32) (_ BitVec 32) V!31449 V!31449 (_ BitVec 32) Int) ListLongMap!11743)

(assert (=> b!928950 (= lt!418971 (getCurrentListMap!3134 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928951 () Bool)

(assert (=> b!928951 (= e!521618 false)))

(declare-fun lt!418972 () V!31449)

(declare-fun apply!715 (ListLongMap!11743 (_ BitVec 64)) V!31449)

(assert (=> b!928951 (= lt!418972 (apply!715 lt!418971 k0!1099))))

(declare-fun b!928952 () Bool)

(assert (=> b!928952 (= e!521623 tp_is_empty!19863)))

(declare-fun mapIsEmpty!31551 () Bool)

(assert (=> mapIsEmpty!31551 mapRes!31551))

(assert (= (and start!79142 res!625544) b!928944))

(assert (= (and b!928944 res!625546) b!928945))

(assert (= (and b!928945 res!625542) b!928946))

(assert (= (and b!928946 res!625543) b!928949))

(assert (= (and b!928949 res!625541) b!928950))

(assert (= (and b!928950 res!625545) b!928951))

(assert (= (and b!928947 condMapEmpty!31551) mapIsEmpty!31551))

(assert (= (and b!928947 (not condMapEmpty!31551)) mapNonEmpty!31551))

(get-info :version)

(assert (= (and mapNonEmpty!31551 ((_ is ValueCellFull!9450) mapValue!31551)) b!928952))

(assert (= (and b!928947 ((_ is ValueCellFull!9450) mapDefault!31551)) b!928948))

(assert (= start!79142 b!928947))

(declare-fun m!863679 () Bool)

(assert (=> b!928951 m!863679))

(declare-fun m!863681 () Bool)

(assert (=> b!928945 m!863681))

(declare-fun m!863683 () Bool)

(assert (=> b!928950 m!863683))

(declare-fun m!863685 () Bool)

(assert (=> b!928950 m!863685))

(declare-fun m!863687 () Bool)

(assert (=> b!928946 m!863687))

(declare-fun m!863689 () Bool)

(assert (=> mapNonEmpty!31551 m!863689))

(declare-fun m!863691 () Bool)

(assert (=> start!79142 m!863691))

(declare-fun m!863693 () Bool)

(assert (=> start!79142 m!863693))

(declare-fun m!863695 () Bool)

(assert (=> start!79142 m!863695))

(check-sat (not b!928950) b_and!28421 tp_is_empty!19863 (not b!928946) (not b_next!17355) (not mapNonEmpty!31551) (not b!928945) (not b!928951) (not start!79142))
(check-sat b_and!28421 (not b_next!17355))
