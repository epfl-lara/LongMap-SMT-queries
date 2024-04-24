; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79332 () Bool)

(assert start!79332)

(declare-fun b_free!17377 () Bool)

(declare-fun b_next!17377 () Bool)

(assert (=> start!79332 (= b_free!17377 (not b_next!17377))))

(declare-fun tp!60573 () Bool)

(declare-fun b_and!28453 () Bool)

(assert (=> start!79332 (= tp!60573 b_and!28453)))

(declare-fun b!930146 () Bool)

(declare-fun res!626091 () Bool)

(declare-fun e!522400 () Bool)

(assert (=> b!930146 (=> (not res!626091) (not e!522400))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31479 0))(
  ( (V!31480 (val!9993 Int)) )
))
(declare-datatypes ((tuple2!13052 0))(
  ( (tuple2!13053 (_1!6537 (_ BitVec 64)) (_2!6537 V!31479)) )
))
(declare-datatypes ((List!18855 0))(
  ( (Nil!18852) (Cons!18851 (h!20003 tuple2!13052) (t!26904 List!18855)) )
))
(declare-datatypes ((ListLongMap!11751 0))(
  ( (ListLongMap!11752 (toList!5891 List!18855)) )
))
(declare-fun lt!419396 () ListLongMap!11751)

(declare-fun v!791 () V!31479)

(declare-fun apply!737 (ListLongMap!11751 (_ BitVec 64)) V!31479)

(assert (=> b!930146 (= res!626091 (= (apply!737 lt!419396 k0!1099) v!791))))

(declare-fun b!930147 () Bool)

(declare-fun res!626086 () Bool)

(declare-fun e!522399 () Bool)

(assert (=> b!930147 (=> (not res!626086) (not e!522399))))

(declare-datatypes ((array!55779 0))(
  ( (array!55780 (arr!26830 (Array (_ BitVec 32) (_ BitVec 64))) (size!27290 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55779)

(declare-datatypes ((List!18856 0))(
  ( (Nil!18853) (Cons!18852 (h!20004 (_ BitVec 64)) (t!26905 List!18856)) )
))
(declare-fun arrayNoDuplicates!0 (array!55779 (_ BitVec 32) List!18856) Bool)

(assert (=> b!930147 (= res!626086 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18853))))

(declare-fun b!930148 () Bool)

(declare-fun e!522398 () Bool)

(declare-fun tp_is_empty!19885 () Bool)

(assert (=> b!930148 (= e!522398 tp_is_empty!19885)))

(declare-fun b!930149 () Bool)

(declare-fun e!522402 () Bool)

(declare-fun e!522403 () Bool)

(declare-fun mapRes!31584 () Bool)

(assert (=> b!930149 (= e!522402 (and e!522403 mapRes!31584))))

(declare-fun condMapEmpty!31584 () Bool)

(declare-datatypes ((ValueCell!9461 0))(
  ( (ValueCellFull!9461 (v!12508 V!31479)) (EmptyCell!9461) )
))
(declare-datatypes ((array!55781 0))(
  ( (array!55782 (arr!26831 (Array (_ BitVec 32) ValueCell!9461)) (size!27291 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55781)

(declare-fun mapDefault!31584 () ValueCell!9461)

(assert (=> b!930149 (= condMapEmpty!31584 (= (arr!26831 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9461)) mapDefault!31584)))))

(declare-fun b!930150 () Bool)

(declare-fun res!626087 () Bool)

(assert (=> b!930150 (=> (not res!626087) (not e!522399))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930150 (= res!626087 (and (= (size!27291 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27290 _keys!1487) (size!27291 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!626088 () Bool)

(assert (=> start!79332 (=> (not res!626088) (not e!522399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79332 (= res!626088 (validMask!0 mask!1881))))

(assert (=> start!79332 e!522399))

(assert (=> start!79332 true))

(assert (=> start!79332 tp_is_empty!19885))

(declare-fun array_inv!20992 (array!55781) Bool)

(assert (=> start!79332 (and (array_inv!20992 _values!1231) e!522402)))

(assert (=> start!79332 tp!60573))

(declare-fun array_inv!20993 (array!55779) Bool)

(assert (=> start!79332 (array_inv!20993 _keys!1487)))

(declare-fun b!930151 () Bool)

(assert (=> b!930151 (= e!522399 e!522400)))

(declare-fun res!626085 () Bool)

(assert (=> b!930151 (=> (not res!626085) (not e!522400))))

(declare-fun contains!4961 (ListLongMap!11751 (_ BitVec 64)) Bool)

(assert (=> b!930151 (= res!626085 (contains!4961 lt!419396 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31479)

(declare-fun minValue!1173 () V!31479)

(declare-fun getCurrentListMap!3139 (array!55779 array!55781 (_ BitVec 32) (_ BitVec 32) V!31479 V!31479 (_ BitVec 32) Int) ListLongMap!11751)

(assert (=> b!930151 (= lt!419396 (getCurrentListMap!3139 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930152 () Bool)

(declare-fun res!626089 () Bool)

(assert (=> b!930152 (=> (not res!626089) (not e!522399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55779 (_ BitVec 32)) Bool)

(assert (=> b!930152 (= res!626089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930153 () Bool)

(assert (=> b!930153 (= e!522400 (and (bvsle from!1844 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (size!27290 _keys!1487))))))

(declare-fun mapNonEmpty!31584 () Bool)

(declare-fun tp!60572 () Bool)

(assert (=> mapNonEmpty!31584 (= mapRes!31584 (and tp!60572 e!522398))))

(declare-fun mapRest!31584 () (Array (_ BitVec 32) ValueCell!9461))

(declare-fun mapKey!31584 () (_ BitVec 32))

(declare-fun mapValue!31584 () ValueCell!9461)

(assert (=> mapNonEmpty!31584 (= (arr!26831 _values!1231) (store mapRest!31584 mapKey!31584 mapValue!31584))))

(declare-fun b!930154 () Bool)

(declare-fun res!626090 () Bool)

(assert (=> b!930154 (=> (not res!626090) (not e!522399))))

(assert (=> b!930154 (= res!626090 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27290 _keys!1487))))))

(declare-fun b!930155 () Bool)

(assert (=> b!930155 (= e!522403 tp_is_empty!19885)))

(declare-fun mapIsEmpty!31584 () Bool)

(assert (=> mapIsEmpty!31584 mapRes!31584))

(assert (= (and start!79332 res!626088) b!930150))

(assert (= (and b!930150 res!626087) b!930152))

(assert (= (and b!930152 res!626089) b!930147))

(assert (= (and b!930147 res!626086) b!930154))

(assert (= (and b!930154 res!626090) b!930151))

(assert (= (and b!930151 res!626085) b!930146))

(assert (= (and b!930146 res!626091) b!930153))

(assert (= (and b!930149 condMapEmpty!31584) mapIsEmpty!31584))

(assert (= (and b!930149 (not condMapEmpty!31584)) mapNonEmpty!31584))

(get-info :version)

(assert (= (and mapNonEmpty!31584 ((_ is ValueCellFull!9461) mapValue!31584)) b!930148))

(assert (= (and b!930149 ((_ is ValueCellFull!9461) mapDefault!31584)) b!930155))

(assert (= start!79332 b!930149))

(declare-fun m!865171 () Bool)

(assert (=> start!79332 m!865171))

(declare-fun m!865173 () Bool)

(assert (=> start!79332 m!865173))

(declare-fun m!865175 () Bool)

(assert (=> start!79332 m!865175))

(declare-fun m!865177 () Bool)

(assert (=> b!930147 m!865177))

(declare-fun m!865179 () Bool)

(assert (=> b!930152 m!865179))

(declare-fun m!865181 () Bool)

(assert (=> mapNonEmpty!31584 m!865181))

(declare-fun m!865183 () Bool)

(assert (=> b!930151 m!865183))

(declare-fun m!865185 () Bool)

(assert (=> b!930151 m!865185))

(declare-fun m!865187 () Bool)

(assert (=> b!930146 m!865187))

(check-sat (not b!930152) (not b_next!17377) (not start!79332) (not mapNonEmpty!31584) (not b!930147) (not b!930151) (not b!930146) b_and!28453 tp_is_empty!19885)
(check-sat b_and!28453 (not b_next!17377))
