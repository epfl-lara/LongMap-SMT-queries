; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79248 () Bool)

(assert start!79248)

(declare-fun b_free!17479 () Bool)

(declare-fun b_next!17479 () Bool)

(assert (=> start!79248 (= b_free!17479 (not b_next!17479))))

(declare-fun tp!60878 () Bool)

(declare-fun b_and!28519 () Bool)

(assert (=> start!79248 (= tp!60878 b_and!28519)))

(declare-fun b!930604 () Bool)

(declare-fun res!626776 () Bool)

(declare-fun e!522586 () Bool)

(assert (=> b!930604 (=> (not res!626776) (not e!522586))))

(declare-datatypes ((array!55883 0))(
  ( (array!55884 (arr!26887 (Array (_ BitVec 32) (_ BitVec 64))) (size!27348 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55883)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31615 0))(
  ( (V!31616 (val!10044 Int)) )
))
(declare-datatypes ((ValueCell!9512 0))(
  ( (ValueCellFull!9512 (v!12561 V!31615)) (EmptyCell!9512) )
))
(declare-datatypes ((array!55885 0))(
  ( (array!55886 (arr!26888 (Array (_ BitVec 32) ValueCell!9512)) (size!27349 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55885)

(assert (=> b!930604 (= res!626776 (and (= (size!27349 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27348 _keys!1487) (size!27349 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930605 () Bool)

(declare-fun e!522589 () Bool)

(declare-fun tp_is_empty!19987 () Bool)

(assert (=> b!930605 (= e!522589 tp_is_empty!19987)))

(declare-fun b!930606 () Bool)

(declare-fun res!626774 () Bool)

(assert (=> b!930606 (=> (not res!626774) (not e!522586))))

(declare-datatypes ((List!18952 0))(
  ( (Nil!18949) (Cons!18948 (h!20094 (_ BitVec 64)) (t!27000 List!18952)) )
))
(declare-fun arrayNoDuplicates!0 (array!55883 (_ BitVec 32) List!18952) Bool)

(assert (=> b!930606 (= res!626774 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18949))))

(declare-fun mapNonEmpty!31737 () Bool)

(declare-fun mapRes!31737 () Bool)

(declare-fun tp!60879 () Bool)

(assert (=> mapNonEmpty!31737 (= mapRes!31737 (and tp!60879 e!522589))))

(declare-fun mapRest!31737 () (Array (_ BitVec 32) ValueCell!9512))

(declare-fun mapValue!31737 () ValueCell!9512)

(declare-fun mapKey!31737 () (_ BitVec 32))

(assert (=> mapNonEmpty!31737 (= (arr!26888 _values!1231) (store mapRest!31737 mapKey!31737 mapValue!31737))))

(declare-fun mapIsEmpty!31737 () Bool)

(assert (=> mapIsEmpty!31737 mapRes!31737))

(declare-fun b!930607 () Bool)

(declare-fun e!522588 () Bool)

(declare-fun e!522587 () Bool)

(assert (=> b!930607 (= e!522588 (and e!522587 mapRes!31737))))

(declare-fun condMapEmpty!31737 () Bool)

(declare-fun mapDefault!31737 () ValueCell!9512)

(assert (=> b!930607 (= condMapEmpty!31737 (= (arr!26888 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9512)) mapDefault!31737)))))

(declare-fun res!626777 () Bool)

(assert (=> start!79248 (=> (not res!626777) (not e!522586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79248 (= res!626777 (validMask!0 mask!1881))))

(assert (=> start!79248 e!522586))

(assert (=> start!79248 true))

(declare-fun array_inv!20996 (array!55885) Bool)

(assert (=> start!79248 (and (array_inv!20996 _values!1231) e!522588)))

(assert (=> start!79248 tp!60878))

(declare-fun array_inv!20997 (array!55883) Bool)

(assert (=> start!79248 (array_inv!20997 _keys!1487)))

(assert (=> start!79248 tp_is_empty!19987))

(declare-fun b!930608 () Bool)

(declare-fun e!522590 () Bool)

(assert (=> b!930608 (= e!522590 false)))

(declare-fun lt!419081 () V!31615)

(declare-datatypes ((tuple2!13196 0))(
  ( (tuple2!13197 (_1!6609 (_ BitVec 64)) (_2!6609 V!31615)) )
))
(declare-datatypes ((List!18953 0))(
  ( (Nil!18950) (Cons!18949 (h!20095 tuple2!13196) (t!27001 List!18953)) )
))
(declare-datatypes ((ListLongMap!11883 0))(
  ( (ListLongMap!11884 (toList!5957 List!18953)) )
))
(declare-fun lt!419080 () ListLongMap!11883)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!754 (ListLongMap!11883 (_ BitVec 64)) V!31615)

(assert (=> b!930608 (= lt!419081 (apply!754 lt!419080 k0!1099))))

(declare-fun b!930609 () Bool)

(assert (=> b!930609 (= e!522587 tp_is_empty!19987)))

(declare-fun b!930610 () Bool)

(declare-fun res!626773 () Bool)

(assert (=> b!930610 (=> (not res!626773) (not e!522586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55883 (_ BitVec 32)) Bool)

(assert (=> b!930610 (= res!626773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930611 () Bool)

(declare-fun res!626775 () Bool)

(assert (=> b!930611 (=> (not res!626775) (not e!522586))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930611 (= res!626775 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27348 _keys!1487))))))

(declare-fun b!930612 () Bool)

(assert (=> b!930612 (= e!522586 e!522590)))

(declare-fun res!626772 () Bool)

(assert (=> b!930612 (=> (not res!626772) (not e!522590))))

(declare-fun contains!4959 (ListLongMap!11883 (_ BitVec 64)) Bool)

(assert (=> b!930612 (= res!626772 (contains!4959 lt!419080 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31615)

(declare-fun minValue!1173 () V!31615)

(declare-fun getCurrentListMap!3133 (array!55883 array!55885 (_ BitVec 32) (_ BitVec 32) V!31615 V!31615 (_ BitVec 32) Int) ListLongMap!11883)

(assert (=> b!930612 (= lt!419080 (getCurrentListMap!3133 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79248 res!626777) b!930604))

(assert (= (and b!930604 res!626776) b!930610))

(assert (= (and b!930610 res!626773) b!930606))

(assert (= (and b!930606 res!626774) b!930611))

(assert (= (and b!930611 res!626775) b!930612))

(assert (= (and b!930612 res!626772) b!930608))

(assert (= (and b!930607 condMapEmpty!31737) mapIsEmpty!31737))

(assert (= (and b!930607 (not condMapEmpty!31737)) mapNonEmpty!31737))

(get-info :version)

(assert (= (and mapNonEmpty!31737 ((_ is ValueCellFull!9512) mapValue!31737)) b!930605))

(assert (= (and b!930607 ((_ is ValueCellFull!9512) mapDefault!31737)) b!930609))

(assert (= start!79248 b!930607))

(declare-fun m!864163 () Bool)

(assert (=> start!79248 m!864163))

(declare-fun m!864165 () Bool)

(assert (=> start!79248 m!864165))

(declare-fun m!864167 () Bool)

(assert (=> start!79248 m!864167))

(declare-fun m!864169 () Bool)

(assert (=> b!930610 m!864169))

(declare-fun m!864171 () Bool)

(assert (=> b!930608 m!864171))

(declare-fun m!864173 () Bool)

(assert (=> b!930612 m!864173))

(declare-fun m!864175 () Bool)

(assert (=> b!930612 m!864175))

(declare-fun m!864177 () Bool)

(assert (=> mapNonEmpty!31737 m!864177))

(declare-fun m!864179 () Bool)

(assert (=> b!930606 m!864179))

(check-sat (not b!930606) (not b!930608) (not b!930612) (not start!79248) (not mapNonEmpty!31737) (not b_next!17479) tp_is_empty!19987 b_and!28519 (not b!930610))
(check-sat b_and!28519 (not b_next!17479))
