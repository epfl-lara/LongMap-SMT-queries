; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79220 () Bool)

(assert start!79220)

(declare-fun b_free!17433 () Bool)

(declare-fun b_next!17433 () Bool)

(assert (=> start!79220 (= b_free!17433 (not b_next!17433))))

(declare-fun tp!60739 () Bool)

(declare-fun b_and!28499 () Bool)

(assert (=> start!79220 (= tp!60739 b_and!28499)))

(declare-fun mapIsEmpty!31668 () Bool)

(declare-fun mapRes!31668 () Bool)

(assert (=> mapIsEmpty!31668 mapRes!31668))

(declare-fun b!930165 () Bool)

(declare-fun e!522324 () Bool)

(declare-datatypes ((array!55830 0))(
  ( (array!55831 (arr!26860 (Array (_ BitVec 32) (_ BitVec 64))) (size!27319 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55830)

(assert (=> b!930165 (= e!522324 (bvsgt #b00000000000000000000000000000000 (size!27319 _keys!1487)))))

(declare-fun b!930166 () Bool)

(declare-fun res!626413 () Bool)

(assert (=> b!930166 (=> (not res!626413) (not e!522324))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930166 (= res!626413 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930167 () Bool)

(declare-fun e!522320 () Bool)

(declare-fun tp_is_empty!19941 () Bool)

(assert (=> b!930167 (= e!522320 tp_is_empty!19941)))

(declare-fun b!930168 () Bool)

(declare-fun res!626414 () Bool)

(assert (=> b!930168 (=> (not res!626414) (not e!522324))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31553 0))(
  ( (V!31554 (val!10021 Int)) )
))
(declare-datatypes ((ValueCell!9489 0))(
  ( (ValueCellFull!9489 (v!12539 V!31553)) (EmptyCell!9489) )
))
(declare-datatypes ((array!55832 0))(
  ( (array!55833 (arr!26861 (Array (_ BitVec 32) ValueCell!9489)) (size!27320 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55832)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!31553)

(declare-fun minValue!1173 () V!31553)

(declare-datatypes ((tuple2!13110 0))(
  ( (tuple2!13111 (_1!6566 (_ BitVec 64)) (_2!6566 V!31553)) )
))
(declare-datatypes ((List!18902 0))(
  ( (Nil!18899) (Cons!18898 (h!20044 tuple2!13110) (t!26959 List!18902)) )
))
(declare-datatypes ((ListLongMap!11807 0))(
  ( (ListLongMap!11808 (toList!5919 List!18902)) )
))
(declare-fun contains!4970 (ListLongMap!11807 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3161 (array!55830 array!55832 (_ BitVec 32) (_ BitVec 32) V!31553 V!31553 (_ BitVec 32) Int) ListLongMap!11807)

(assert (=> b!930168 (= res!626414 (contains!4970 (getCurrentListMap!3161 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun res!626415 () Bool)

(declare-fun e!522322 () Bool)

(assert (=> start!79220 (=> (not res!626415) (not e!522322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79220 (= res!626415 (validMask!0 mask!1881))))

(assert (=> start!79220 e!522322))

(assert (=> start!79220 true))

(assert (=> start!79220 tp_is_empty!19941))

(declare-fun e!522321 () Bool)

(declare-fun array_inv!20902 (array!55832) Bool)

(assert (=> start!79220 (and (array_inv!20902 _values!1231) e!522321)))

(assert (=> start!79220 tp!60739))

(declare-fun array_inv!20903 (array!55830) Bool)

(assert (=> start!79220 (array_inv!20903 _keys!1487)))

(declare-fun b!930169 () Bool)

(assert (=> b!930169 (= e!522321 (and e!522320 mapRes!31668))))

(declare-fun condMapEmpty!31668 () Bool)

(declare-fun mapDefault!31668 () ValueCell!9489)

(assert (=> b!930169 (= condMapEmpty!31668 (= (arr!26861 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9489)) mapDefault!31668)))))

(declare-fun b!930170 () Bool)

(assert (=> b!930170 (= e!522322 e!522324)))

(declare-fun res!626411 () Bool)

(assert (=> b!930170 (=> (not res!626411) (not e!522324))))

(declare-fun lt!419191 () ListLongMap!11807)

(assert (=> b!930170 (= res!626411 (contains!4970 lt!419191 k0!1099))))

(assert (=> b!930170 (= lt!419191 (getCurrentListMap!3161 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31668 () Bool)

(declare-fun tp!60740 () Bool)

(declare-fun e!522325 () Bool)

(assert (=> mapNonEmpty!31668 (= mapRes!31668 (and tp!60740 e!522325))))

(declare-fun mapValue!31668 () ValueCell!9489)

(declare-fun mapRest!31668 () (Array (_ BitVec 32) ValueCell!9489))

(declare-fun mapKey!31668 () (_ BitVec 32))

(assert (=> mapNonEmpty!31668 (= (arr!26861 _values!1231) (store mapRest!31668 mapKey!31668 mapValue!31668))))

(declare-fun b!930171 () Bool)

(declare-fun res!626417 () Bool)

(assert (=> b!930171 (=> (not res!626417) (not e!522322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55830 (_ BitVec 32)) Bool)

(assert (=> b!930171 (= res!626417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930172 () Bool)

(assert (=> b!930172 (= e!522325 tp_is_empty!19941)))

(declare-fun b!930173 () Bool)

(declare-fun res!626418 () Bool)

(assert (=> b!930173 (=> (not res!626418) (not e!522324))))

(declare-fun v!791 () V!31553)

(declare-fun apply!741 (ListLongMap!11807 (_ BitVec 64)) V!31553)

(assert (=> b!930173 (= res!626418 (= (apply!741 lt!419191 k0!1099) v!791))))

(declare-fun b!930174 () Bool)

(declare-fun res!626412 () Bool)

(assert (=> b!930174 (=> (not res!626412) (not e!522322))))

(declare-datatypes ((List!18903 0))(
  ( (Nil!18900) (Cons!18899 (h!20045 (_ BitVec 64)) (t!26960 List!18903)) )
))
(declare-fun arrayNoDuplicates!0 (array!55830 (_ BitVec 32) List!18903) Bool)

(assert (=> b!930174 (= res!626412 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18900))))

(declare-fun b!930175 () Bool)

(declare-fun res!626416 () Bool)

(assert (=> b!930175 (=> (not res!626416) (not e!522322))))

(assert (=> b!930175 (= res!626416 (and (= (size!27320 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27319 _keys!1487) (size!27320 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930176 () Bool)

(declare-fun res!626419 () Bool)

(assert (=> b!930176 (=> (not res!626419) (not e!522322))))

(assert (=> b!930176 (= res!626419 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27319 _keys!1487))))))

(assert (= (and start!79220 res!626415) b!930175))

(assert (= (and b!930175 res!626416) b!930171))

(assert (= (and b!930171 res!626417) b!930174))

(assert (= (and b!930174 res!626412) b!930176))

(assert (= (and b!930176 res!626419) b!930170))

(assert (= (and b!930170 res!626411) b!930173))

(assert (= (and b!930173 res!626418) b!930166))

(assert (= (and b!930166 res!626413) b!930168))

(assert (= (and b!930168 res!626414) b!930165))

(assert (= (and b!930169 condMapEmpty!31668) mapIsEmpty!31668))

(assert (= (and b!930169 (not condMapEmpty!31668)) mapNonEmpty!31668))

(get-info :version)

(assert (= (and mapNonEmpty!31668 ((_ is ValueCellFull!9489) mapValue!31668)) b!930172))

(assert (= (and b!930169 ((_ is ValueCellFull!9489) mapDefault!31668)) b!930167))

(assert (= start!79220 b!930169))

(declare-fun m!864481 () Bool)

(assert (=> b!930170 m!864481))

(declare-fun m!864483 () Bool)

(assert (=> b!930170 m!864483))

(declare-fun m!864485 () Bool)

(assert (=> b!930174 m!864485))

(declare-fun m!864487 () Bool)

(assert (=> b!930168 m!864487))

(assert (=> b!930168 m!864487))

(declare-fun m!864489 () Bool)

(assert (=> b!930168 m!864489))

(declare-fun m!864491 () Bool)

(assert (=> start!79220 m!864491))

(declare-fun m!864493 () Bool)

(assert (=> start!79220 m!864493))

(declare-fun m!864495 () Bool)

(assert (=> start!79220 m!864495))

(declare-fun m!864497 () Bool)

(assert (=> b!930173 m!864497))

(declare-fun m!864499 () Bool)

(assert (=> mapNonEmpty!31668 m!864499))

(declare-fun m!864501 () Bool)

(assert (=> b!930171 m!864501))

(check-sat (not start!79220) (not b!930171) b_and!28499 (not b!930168) tp_is_empty!19941 (not b!930170) (not b_next!17433) (not mapNonEmpty!31668) (not b!930173) (not b!930174))
(check-sat b_and!28499 (not b_next!17433))
