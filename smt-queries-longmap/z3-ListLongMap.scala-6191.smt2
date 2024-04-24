; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79422 () Bool)

(assert start!79422)

(declare-fun b_free!17467 () Bool)

(declare-fun b_next!17467 () Bool)

(assert (=> start!79422 (= b_free!17467 (not b_next!17467))))

(declare-fun tp!60843 () Bool)

(declare-fun b_and!28543 () Bool)

(assert (=> start!79422 (= tp!60843 b_and!28543)))

(declare-fun b!931584 () Bool)

(declare-fun res!627123 () Bool)

(declare-fun e!523209 () Bool)

(assert (=> b!931584 (=> (not res!627123) (not e!523209))))

(declare-datatypes ((array!55955 0))(
  ( (array!55956 (arr!26918 (Array (_ BitVec 32) (_ BitVec 64))) (size!27378 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55955)

(declare-datatypes ((List!18922 0))(
  ( (Nil!18919) (Cons!18918 (h!20070 (_ BitVec 64)) (t!26971 List!18922)) )
))
(declare-fun arrayNoDuplicates!0 (array!55955 (_ BitVec 32) List!18922) Bool)

(assert (=> b!931584 (= res!627123 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18919))))

(declare-fun b!931585 () Bool)

(declare-fun e!523210 () Bool)

(declare-fun e!523208 () Bool)

(declare-fun mapRes!31719 () Bool)

(assert (=> b!931585 (= e!523210 (and e!523208 mapRes!31719))))

(declare-fun condMapEmpty!31719 () Bool)

(declare-datatypes ((V!31599 0))(
  ( (V!31600 (val!10038 Int)) )
))
(declare-datatypes ((ValueCell!9506 0))(
  ( (ValueCellFull!9506 (v!12553 V!31599)) (EmptyCell!9506) )
))
(declare-datatypes ((array!55957 0))(
  ( (array!55958 (arr!26919 (Array (_ BitVec 32) ValueCell!9506)) (size!27379 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55957)

(declare-fun mapDefault!31719 () ValueCell!9506)

(assert (=> b!931585 (= condMapEmpty!31719 (= (arr!26919 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9506)) mapDefault!31719)))))

(declare-fun b!931586 () Bool)

(declare-fun tp_is_empty!19975 () Bool)

(assert (=> b!931586 (= e!523208 tp_is_empty!19975)))

(declare-fun b!931587 () Bool)

(declare-fun res!627121 () Bool)

(assert (=> b!931587 (=> (not res!627121) (not e!523209))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931587 (= res!627121 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27378 _keys!1487))))))

(declare-fun b!931588 () Bool)

(declare-fun e!523213 () Bool)

(assert (=> b!931588 (= e!523213 false)))

(declare-fun lt!419641 () V!31599)

(declare-datatypes ((tuple2!13134 0))(
  ( (tuple2!13135 (_1!6578 (_ BitVec 64)) (_2!6578 V!31599)) )
))
(declare-datatypes ((List!18923 0))(
  ( (Nil!18920) (Cons!18919 (h!20071 tuple2!13134) (t!26972 List!18923)) )
))
(declare-datatypes ((ListLongMap!11833 0))(
  ( (ListLongMap!11834 (toList!5932 List!18923)) )
))
(declare-fun lt!419642 () ListLongMap!11833)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!768 (ListLongMap!11833 (_ BitVec 64)) V!31599)

(assert (=> b!931588 (= lt!419641 (apply!768 lt!419642 k0!1099))))

(declare-fun mapNonEmpty!31719 () Bool)

(declare-fun tp!60842 () Bool)

(declare-fun e!523211 () Bool)

(assert (=> mapNonEmpty!31719 (= mapRes!31719 (and tp!60842 e!523211))))

(declare-fun mapValue!31719 () ValueCell!9506)

(declare-fun mapRest!31719 () (Array (_ BitVec 32) ValueCell!9506))

(declare-fun mapKey!31719 () (_ BitVec 32))

(assert (=> mapNonEmpty!31719 (= (arr!26919 _values!1231) (store mapRest!31719 mapKey!31719 mapValue!31719))))

(declare-fun res!627120 () Bool)

(assert (=> start!79422 (=> (not res!627120) (not e!523209))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79422 (= res!627120 (validMask!0 mask!1881))))

(assert (=> start!79422 e!523209))

(assert (=> start!79422 true))

(declare-fun array_inv!21048 (array!55957) Bool)

(assert (=> start!79422 (and (array_inv!21048 _values!1231) e!523210)))

(assert (=> start!79422 tp!60843))

(declare-fun array_inv!21049 (array!55955) Bool)

(assert (=> start!79422 (array_inv!21049 _keys!1487)))

(assert (=> start!79422 tp_is_empty!19975))

(declare-fun b!931589 () Bool)

(assert (=> b!931589 (= e!523211 tp_is_empty!19975)))

(declare-fun b!931590 () Bool)

(assert (=> b!931590 (= e!523209 e!523213)))

(declare-fun res!627122 () Bool)

(assert (=> b!931590 (=> (not res!627122) (not e!523213))))

(declare-fun contains!4998 (ListLongMap!11833 (_ BitVec 64)) Bool)

(assert (=> b!931590 (= res!627122 (contains!4998 lt!419642 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31599)

(declare-fun minValue!1173 () V!31599)

(declare-fun getCurrentListMap!3176 (array!55955 array!55957 (_ BitVec 32) (_ BitVec 32) V!31599 V!31599 (_ BitVec 32) Int) ListLongMap!11833)

(assert (=> b!931590 (= lt!419642 (getCurrentListMap!3176 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931591 () Bool)

(declare-fun res!627119 () Bool)

(assert (=> b!931591 (=> (not res!627119) (not e!523209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55955 (_ BitVec 32)) Bool)

(assert (=> b!931591 (= res!627119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31719 () Bool)

(assert (=> mapIsEmpty!31719 mapRes!31719))

(declare-fun b!931592 () Bool)

(declare-fun res!627118 () Bool)

(assert (=> b!931592 (=> (not res!627118) (not e!523209))))

(assert (=> b!931592 (= res!627118 (and (= (size!27379 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27378 _keys!1487) (size!27379 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79422 res!627120) b!931592))

(assert (= (and b!931592 res!627118) b!931591))

(assert (= (and b!931591 res!627119) b!931584))

(assert (= (and b!931584 res!627123) b!931587))

(assert (= (and b!931587 res!627121) b!931590))

(assert (= (and b!931590 res!627122) b!931588))

(assert (= (and b!931585 condMapEmpty!31719) mapIsEmpty!31719))

(assert (= (and b!931585 (not condMapEmpty!31719)) mapNonEmpty!31719))

(get-info :version)

(assert (= (and mapNonEmpty!31719 ((_ is ValueCellFull!9506) mapValue!31719)) b!931589))

(assert (= (and b!931585 ((_ is ValueCellFull!9506) mapDefault!31719)) b!931586))

(assert (= start!79422 b!931585))

(declare-fun m!866107 () Bool)

(assert (=> b!931588 m!866107))

(declare-fun m!866109 () Bool)

(assert (=> b!931591 m!866109))

(declare-fun m!866111 () Bool)

(assert (=> start!79422 m!866111))

(declare-fun m!866113 () Bool)

(assert (=> start!79422 m!866113))

(declare-fun m!866115 () Bool)

(assert (=> start!79422 m!866115))

(declare-fun m!866117 () Bool)

(assert (=> mapNonEmpty!31719 m!866117))

(declare-fun m!866119 () Bool)

(assert (=> b!931584 m!866119))

(declare-fun m!866121 () Bool)

(assert (=> b!931590 m!866121))

(declare-fun m!866123 () Bool)

(assert (=> b!931590 m!866123))

(check-sat (not start!79422) (not mapNonEmpty!31719) (not b!931588) (not b!931584) tp_is_empty!19975 (not b_next!17467) (not b!931591) (not b!931590) b_and!28543)
(check-sat b_and!28543 (not b_next!17467))
