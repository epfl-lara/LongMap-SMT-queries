; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79218 () Bool)

(assert start!79218)

(declare-fun b_free!17449 () Bool)

(declare-fun b_next!17449 () Bool)

(assert (=> start!79218 (= b_free!17449 (not b_next!17449))))

(declare-fun tp!60788 () Bool)

(declare-fun b_and!28489 () Bool)

(assert (=> start!79218 (= tp!60788 b_and!28489)))

(declare-fun mapNonEmpty!31692 () Bool)

(declare-fun mapRes!31692 () Bool)

(declare-fun tp!60789 () Bool)

(declare-fun e!522316 () Bool)

(assert (=> mapNonEmpty!31692 (= mapRes!31692 (and tp!60789 e!522316))))

(declare-fun mapKey!31692 () (_ BitVec 32))

(declare-datatypes ((V!31575 0))(
  ( (V!31576 (val!10029 Int)) )
))
(declare-datatypes ((ValueCell!9497 0))(
  ( (ValueCellFull!9497 (v!12546 V!31575)) (EmptyCell!9497) )
))
(declare-fun mapRest!31692 () (Array (_ BitVec 32) ValueCell!9497))

(declare-fun mapValue!31692 () ValueCell!9497)

(declare-datatypes ((array!55827 0))(
  ( (array!55828 (arr!26859 (Array (_ BitVec 32) ValueCell!9497)) (size!27320 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55827)

(assert (=> mapNonEmpty!31692 (= (arr!26859 _values!1231) (store mapRest!31692 mapKey!31692 mapValue!31692))))

(declare-fun b!930178 () Bool)

(declare-fun res!626487 () Bool)

(declare-fun e!522317 () Bool)

(assert (=> b!930178 (=> (not res!626487) (not e!522317))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55829 0))(
  ( (array!55830 (arr!26860 (Array (_ BitVec 32) (_ BitVec 64))) (size!27321 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55829)

(assert (=> b!930178 (= res!626487 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27321 _keys!1487))))))

(declare-fun res!626483 () Bool)

(assert (=> start!79218 (=> (not res!626483) (not e!522317))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79218 (= res!626483 (validMask!0 mask!1881))))

(assert (=> start!79218 e!522317))

(assert (=> start!79218 true))

(declare-fun tp_is_empty!19957 () Bool)

(assert (=> start!79218 tp_is_empty!19957))

(declare-fun e!522321 () Bool)

(declare-fun array_inv!20980 (array!55827) Bool)

(assert (=> start!79218 (and (array_inv!20980 _values!1231) e!522321)))

(assert (=> start!79218 tp!60788))

(declare-fun array_inv!20981 (array!55829) Bool)

(assert (=> start!79218 (array_inv!20981 _keys!1487)))

(declare-fun b!930179 () Bool)

(assert (=> b!930179 (= e!522316 tp_is_empty!19957)))

(declare-fun b!930180 () Bool)

(declare-fun e!522319 () Bool)

(assert (=> b!930180 (= e!522319 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27321 _keys!1487)))))

(declare-fun b!930181 () Bool)

(declare-fun res!626489 () Bool)

(assert (=> b!930181 (=> (not res!626489) (not e!522319))))

(assert (=> b!930181 (= res!626489 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930182 () Bool)

(declare-fun res!626488 () Bool)

(assert (=> b!930182 (=> (not res!626488) (not e!522317))))

(declare-datatypes ((List!18930 0))(
  ( (Nil!18927) (Cons!18926 (h!20072 (_ BitVec 64)) (t!26978 List!18930)) )
))
(declare-fun arrayNoDuplicates!0 (array!55829 (_ BitVec 32) List!18930) Bool)

(assert (=> b!930182 (= res!626488 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18927))))

(declare-fun b!930183 () Bool)

(declare-fun res!626485 () Bool)

(assert (=> b!930183 (=> (not res!626485) (not e!522317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55829 (_ BitVec 32)) Bool)

(assert (=> b!930183 (= res!626485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930184 () Bool)

(declare-fun e!522318 () Bool)

(assert (=> b!930184 (= e!522321 (and e!522318 mapRes!31692))))

(declare-fun condMapEmpty!31692 () Bool)

(declare-fun mapDefault!31692 () ValueCell!9497)

(assert (=> b!930184 (= condMapEmpty!31692 (= (arr!26859 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9497)) mapDefault!31692)))))

(declare-fun mapIsEmpty!31692 () Bool)

(assert (=> mapIsEmpty!31692 mapRes!31692))

(declare-fun b!930185 () Bool)

(assert (=> b!930185 (= e!522317 e!522319)))

(declare-fun res!626486 () Bool)

(assert (=> b!930185 (=> (not res!626486) (not e!522319))))

(declare-datatypes ((tuple2!13174 0))(
  ( (tuple2!13175 (_1!6598 (_ BitVec 64)) (_2!6598 V!31575)) )
))
(declare-datatypes ((List!18931 0))(
  ( (Nil!18928) (Cons!18927 (h!20073 tuple2!13174) (t!26979 List!18931)) )
))
(declare-datatypes ((ListLongMap!11861 0))(
  ( (ListLongMap!11862 (toList!5946 List!18931)) )
))
(declare-fun lt!418997 () ListLongMap!11861)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4950 (ListLongMap!11861 (_ BitVec 64)) Bool)

(assert (=> b!930185 (= res!626486 (contains!4950 lt!418997 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31575)

(declare-fun minValue!1173 () V!31575)

(declare-fun getCurrentListMap!3124 (array!55829 array!55827 (_ BitVec 32) (_ BitVec 32) V!31575 V!31575 (_ BitVec 32) Int) ListLongMap!11861)

(assert (=> b!930185 (= lt!418997 (getCurrentListMap!3124 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930186 () Bool)

(declare-fun res!626482 () Bool)

(assert (=> b!930186 (=> (not res!626482) (not e!522319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!930186 (= res!626482 (validKeyInArray!0 k0!1099))))

(declare-fun b!930187 () Bool)

(declare-fun res!626484 () Bool)

(assert (=> b!930187 (=> (not res!626484) (not e!522317))))

(assert (=> b!930187 (= res!626484 (and (= (size!27320 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27321 _keys!1487) (size!27320 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930188 () Bool)

(declare-fun res!626481 () Bool)

(assert (=> b!930188 (=> (not res!626481) (not e!522319))))

(declare-fun v!791 () V!31575)

(declare-fun apply!745 (ListLongMap!11861 (_ BitVec 64)) V!31575)

(assert (=> b!930188 (= res!626481 (= (apply!745 lt!418997 k0!1099) v!791))))

(declare-fun b!930189 () Bool)

(assert (=> b!930189 (= e!522318 tp_is_empty!19957)))

(assert (= (and start!79218 res!626483) b!930187))

(assert (= (and b!930187 res!626484) b!930183))

(assert (= (and b!930183 res!626485) b!930182))

(assert (= (and b!930182 res!626488) b!930178))

(assert (= (and b!930178 res!626487) b!930185))

(assert (= (and b!930185 res!626486) b!930188))

(assert (= (and b!930188 res!626481) b!930181))

(assert (= (and b!930181 res!626489) b!930186))

(assert (= (and b!930186 res!626482) b!930180))

(assert (= (and b!930184 condMapEmpty!31692) mapIsEmpty!31692))

(assert (= (and b!930184 (not condMapEmpty!31692)) mapNonEmpty!31692))

(get-info :version)

(assert (= (and mapNonEmpty!31692 ((_ is ValueCellFull!9497) mapValue!31692)) b!930179))

(assert (= (and b!930184 ((_ is ValueCellFull!9497) mapDefault!31692)) b!930189))

(assert (= start!79218 b!930184))

(declare-fun m!863887 () Bool)

(assert (=> b!930188 m!863887))

(declare-fun m!863889 () Bool)

(assert (=> b!930183 m!863889))

(declare-fun m!863891 () Bool)

(assert (=> b!930182 m!863891))

(declare-fun m!863893 () Bool)

(assert (=> b!930186 m!863893))

(declare-fun m!863895 () Bool)

(assert (=> b!930185 m!863895))

(declare-fun m!863897 () Bool)

(assert (=> b!930185 m!863897))

(declare-fun m!863899 () Bool)

(assert (=> mapNonEmpty!31692 m!863899))

(declare-fun m!863901 () Bool)

(assert (=> start!79218 m!863901))

(declare-fun m!863903 () Bool)

(assert (=> start!79218 m!863903))

(declare-fun m!863905 () Bool)

(assert (=> start!79218 m!863905))

(check-sat b_and!28489 (not b_next!17449) (not b!930182) (not mapNonEmpty!31692) (not start!79218) (not b!930186) (not b!930188) (not b!930183) tp_is_empty!19957 (not b!930185))
(check-sat b_and!28489 (not b_next!17449))
