; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79190 () Bool)

(assert start!79190)

(declare-fun b_free!17403 () Bool)

(declare-fun b_next!17403 () Bool)

(assert (=> start!79190 (= b_free!17403 (not b_next!17403))))

(declare-fun tp!60649 () Bool)

(declare-fun b_and!28469 () Bool)

(assert (=> start!79190 (= tp!60649 b_and!28469)))

(declare-fun mapIsEmpty!31623 () Bool)

(declare-fun mapRes!31623 () Bool)

(assert (=> mapIsEmpty!31623 mapRes!31623))

(declare-fun b!929665 () Bool)

(declare-fun e!522054 () Bool)

(declare-fun tp_is_empty!19911 () Bool)

(assert (=> b!929665 (= e!522054 tp_is_empty!19911)))

(declare-fun mapNonEmpty!31623 () Bool)

(declare-fun tp!60650 () Bool)

(declare-fun e!522050 () Bool)

(assert (=> mapNonEmpty!31623 (= mapRes!31623 (and tp!60650 e!522050))))

(declare-datatypes ((V!31513 0))(
  ( (V!31514 (val!10006 Int)) )
))
(declare-datatypes ((ValueCell!9474 0))(
  ( (ValueCellFull!9474 (v!12524 V!31513)) (EmptyCell!9474) )
))
(declare-fun mapValue!31623 () ValueCell!9474)

(declare-fun mapKey!31623 () (_ BitVec 32))

(declare-fun mapRest!31623 () (Array (_ BitVec 32) ValueCell!9474))

(declare-datatypes ((array!55774 0))(
  ( (array!55775 (arr!26832 (Array (_ BitVec 32) ValueCell!9474)) (size!27291 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55774)

(assert (=> mapNonEmpty!31623 (= (arr!26832 _values!1231) (store mapRest!31623 mapKey!31623 mapValue!31623))))

(declare-fun b!929666 () Bool)

(assert (=> b!929666 (= e!522050 tp_is_empty!19911)))

(declare-fun b!929667 () Bool)

(declare-fun e!522055 () Bool)

(assert (=> b!929667 (= e!522055 false)))

(declare-fun lt!419106 () Bool)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55776 0))(
  ( (array!55777 (arr!26833 (Array (_ BitVec 32) (_ BitVec 64))) (size!27292 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55776)

(declare-fun zeroValue!1173 () V!31513)

(declare-fun minValue!1173 () V!31513)

(declare-datatypes ((tuple2!13084 0))(
  ( (tuple2!13085 (_1!6553 (_ BitVec 64)) (_2!6553 V!31513)) )
))
(declare-datatypes ((List!18878 0))(
  ( (Nil!18875) (Cons!18874 (h!20020 tuple2!13084) (t!26935 List!18878)) )
))
(declare-datatypes ((ListLongMap!11781 0))(
  ( (ListLongMap!11782 (toList!5906 List!18878)) )
))
(declare-fun contains!4958 (ListLongMap!11781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3149 (array!55776 array!55774 (_ BitVec 32) (_ BitVec 32) V!31513 V!31513 (_ BitVec 32) Int) ListLongMap!11781)

(assert (=> b!929667 (= lt!419106 (contains!4958 (getCurrentListMap!3149 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!929668 () Bool)

(declare-fun res!626048 () Bool)

(declare-fun e!522053 () Bool)

(assert (=> b!929668 (=> (not res!626048) (not e!522053))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929668 (= res!626048 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27292 _keys!1487))))))

(declare-fun res!626052 () Bool)

(assert (=> start!79190 (=> (not res!626052) (not e!522053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79190 (= res!626052 (validMask!0 mask!1881))))

(assert (=> start!79190 e!522053))

(assert (=> start!79190 true))

(assert (=> start!79190 tp_is_empty!19911))

(declare-fun e!522051 () Bool)

(declare-fun array_inv!20878 (array!55774) Bool)

(assert (=> start!79190 (and (array_inv!20878 _values!1231) e!522051)))

(assert (=> start!79190 tp!60649))

(declare-fun array_inv!20879 (array!55776) Bool)

(assert (=> start!79190 (array_inv!20879 _keys!1487)))

(declare-fun b!929669 () Bool)

(declare-fun res!626050 () Bool)

(assert (=> b!929669 (=> (not res!626050) (not e!522053))))

(assert (=> b!929669 (= res!626050 (and (= (size!27291 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27292 _keys!1487) (size!27291 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929670 () Bool)

(declare-fun res!626049 () Bool)

(assert (=> b!929670 (=> (not res!626049) (not e!522055))))

(declare-fun v!791 () V!31513)

(declare-fun lt!419107 () ListLongMap!11781)

(declare-fun apply!730 (ListLongMap!11781 (_ BitVec 64)) V!31513)

(assert (=> b!929670 (= res!626049 (= (apply!730 lt!419107 k0!1099) v!791))))

(declare-fun b!929671 () Bool)

(assert (=> b!929671 (= e!522053 e!522055)))

(declare-fun res!626053 () Bool)

(assert (=> b!929671 (=> (not res!626053) (not e!522055))))

(assert (=> b!929671 (= res!626053 (contains!4958 lt!419107 k0!1099))))

(assert (=> b!929671 (= lt!419107 (getCurrentListMap!3149 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929672 () Bool)

(assert (=> b!929672 (= e!522051 (and e!522054 mapRes!31623))))

(declare-fun condMapEmpty!31623 () Bool)

(declare-fun mapDefault!31623 () ValueCell!9474)

(assert (=> b!929672 (= condMapEmpty!31623 (= (arr!26832 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9474)) mapDefault!31623)))))

(declare-fun b!929673 () Bool)

(declare-fun res!626046 () Bool)

(assert (=> b!929673 (=> (not res!626046) (not e!522053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55776 (_ BitVec 32)) Bool)

(assert (=> b!929673 (= res!626046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929674 () Bool)

(declare-fun res!626047 () Bool)

(assert (=> b!929674 (=> (not res!626047) (not e!522055))))

(assert (=> b!929674 (= res!626047 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!929675 () Bool)

(declare-fun res!626051 () Bool)

(assert (=> b!929675 (=> (not res!626051) (not e!522053))))

(declare-datatypes ((List!18879 0))(
  ( (Nil!18876) (Cons!18875 (h!20021 (_ BitVec 64)) (t!26936 List!18879)) )
))
(declare-fun arrayNoDuplicates!0 (array!55776 (_ BitVec 32) List!18879) Bool)

(assert (=> b!929675 (= res!626051 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18876))))

(assert (= (and start!79190 res!626052) b!929669))

(assert (= (and b!929669 res!626050) b!929673))

(assert (= (and b!929673 res!626046) b!929675))

(assert (= (and b!929675 res!626051) b!929668))

(assert (= (and b!929668 res!626048) b!929671))

(assert (= (and b!929671 res!626053) b!929670))

(assert (= (and b!929670 res!626049) b!929674))

(assert (= (and b!929674 res!626047) b!929667))

(assert (= (and b!929672 condMapEmpty!31623) mapIsEmpty!31623))

(assert (= (and b!929672 (not condMapEmpty!31623)) mapNonEmpty!31623))

(get-info :version)

(assert (= (and mapNonEmpty!31623 ((_ is ValueCellFull!9474) mapValue!31623)) b!929666))

(assert (= (and b!929672 ((_ is ValueCellFull!9474) mapDefault!31623)) b!929665))

(assert (= start!79190 b!929672))

(declare-fun m!864151 () Bool)

(assert (=> mapNonEmpty!31623 m!864151))

(declare-fun m!864153 () Bool)

(assert (=> b!929667 m!864153))

(assert (=> b!929667 m!864153))

(declare-fun m!864155 () Bool)

(assert (=> b!929667 m!864155))

(declare-fun m!864157 () Bool)

(assert (=> start!79190 m!864157))

(declare-fun m!864159 () Bool)

(assert (=> start!79190 m!864159))

(declare-fun m!864161 () Bool)

(assert (=> start!79190 m!864161))

(declare-fun m!864163 () Bool)

(assert (=> b!929673 m!864163))

(declare-fun m!864165 () Bool)

(assert (=> b!929670 m!864165))

(declare-fun m!864167 () Bool)

(assert (=> b!929671 m!864167))

(declare-fun m!864169 () Bool)

(assert (=> b!929671 m!864169))

(declare-fun m!864171 () Bool)

(assert (=> b!929675 m!864171))

(check-sat (not b!929667) b_and!28469 (not b!929675) (not start!79190) (not b!929670) (not b_next!17403) tp_is_empty!19911 (not mapNonEmpty!31623) (not b!929673) (not b!929671))
(check-sat b_and!28469 (not b_next!17403))
