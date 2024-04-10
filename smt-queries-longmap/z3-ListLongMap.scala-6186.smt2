; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79226 () Bool)

(assert start!79226)

(declare-fun b_free!17439 () Bool)

(declare-fun b_next!17439 () Bool)

(assert (=> start!79226 (= b_free!17439 (not b_next!17439))))

(declare-fun tp!60758 () Bool)

(declare-fun b_and!28505 () Bool)

(assert (=> start!79226 (= tp!60758 b_and!28505)))

(declare-fun mapIsEmpty!31677 () Bool)

(declare-fun mapRes!31677 () Bool)

(assert (=> mapIsEmpty!31677 mapRes!31677))

(declare-fun b!930268 () Bool)

(declare-fun e!522377 () Bool)

(declare-fun e!522374 () Bool)

(assert (=> b!930268 (= e!522377 e!522374)))

(declare-fun res!626490 () Bool)

(assert (=> b!930268 (=> (not res!626490) (not e!522374))))

(declare-datatypes ((V!31561 0))(
  ( (V!31562 (val!10024 Int)) )
))
(declare-datatypes ((tuple2!13114 0))(
  ( (tuple2!13115 (_1!6568 (_ BitVec 64)) (_2!6568 V!31561)) )
))
(declare-datatypes ((List!18906 0))(
  ( (Nil!18903) (Cons!18902 (h!20048 tuple2!13114) (t!26963 List!18906)) )
))
(declare-datatypes ((ListLongMap!11811 0))(
  ( (ListLongMap!11812 (toList!5921 List!18906)) )
))
(declare-fun lt!419205 () ListLongMap!11811)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4972 (ListLongMap!11811 (_ BitVec 64)) Bool)

(assert (=> b!930268 (= res!626490 (contains!4972 lt!419205 k0!1099))))

(declare-datatypes ((array!55840 0))(
  ( (array!55841 (arr!26865 (Array (_ BitVec 32) (_ BitVec 64))) (size!27324 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55840)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9492 0))(
  ( (ValueCellFull!9492 (v!12542 V!31561)) (EmptyCell!9492) )
))
(declare-datatypes ((array!55842 0))(
  ( (array!55843 (arr!26866 (Array (_ BitVec 32) ValueCell!9492)) (size!27325 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55842)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31561)

(declare-fun minValue!1173 () V!31561)

(declare-fun getCurrentListMap!3163 (array!55840 array!55842 (_ BitVec 32) (_ BitVec 32) V!31561 V!31561 (_ BitVec 32) Int) ListLongMap!11811)

(assert (=> b!930268 (= lt!419205 (getCurrentListMap!3163 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930269 () Bool)

(declare-fun e!522376 () Bool)

(declare-fun e!522375 () Bool)

(assert (=> b!930269 (= e!522376 (and e!522375 mapRes!31677))))

(declare-fun condMapEmpty!31677 () Bool)

(declare-fun mapDefault!31677 () ValueCell!9492)

(assert (=> b!930269 (= condMapEmpty!31677 (= (arr!26866 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9492)) mapDefault!31677)))))

(declare-fun b!930270 () Bool)

(declare-fun res!626489 () Bool)

(assert (=> b!930270 (=> (not res!626489) (not e!522374))))

(assert (=> b!930270 (= res!626489 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930271 () Bool)

(declare-fun e!522379 () Bool)

(declare-fun tp_is_empty!19947 () Bool)

(assert (=> b!930271 (= e!522379 tp_is_empty!19947)))

(declare-fun b!930272 () Bool)

(declare-fun res!626494 () Bool)

(assert (=> b!930272 (=> (not res!626494) (not e!522374))))

(declare-fun v!791 () V!31561)

(declare-fun apply!743 (ListLongMap!11811 (_ BitVec 64)) V!31561)

(assert (=> b!930272 (= res!626494 (= (apply!743 lt!419205 k0!1099) v!791))))

(declare-fun b!930273 () Bool)

(declare-fun res!626487 () Bool)

(assert (=> b!930273 (=> (not res!626487) (not e!522377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55840 (_ BitVec 32)) Bool)

(assert (=> b!930273 (= res!626487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!626491 () Bool)

(assert (=> start!79226 (=> (not res!626491) (not e!522377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79226 (= res!626491 (validMask!0 mask!1881))))

(assert (=> start!79226 e!522377))

(assert (=> start!79226 true))

(assert (=> start!79226 tp_is_empty!19947))

(declare-fun array_inv!20906 (array!55842) Bool)

(assert (=> start!79226 (and (array_inv!20906 _values!1231) e!522376)))

(assert (=> start!79226 tp!60758))

(declare-fun array_inv!20907 (array!55840) Bool)

(assert (=> start!79226 (array_inv!20907 _keys!1487)))

(declare-fun b!930274 () Bool)

(declare-fun res!626488 () Bool)

(assert (=> b!930274 (=> (not res!626488) (not e!522377))))

(declare-datatypes ((List!18907 0))(
  ( (Nil!18904) (Cons!18903 (h!20049 (_ BitVec 64)) (t!26964 List!18907)) )
))
(declare-fun arrayNoDuplicates!0 (array!55840 (_ BitVec 32) List!18907) Bool)

(assert (=> b!930274 (= res!626488 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18904))))

(declare-fun b!930275 () Bool)

(assert (=> b!930275 (= e!522374 false)))

(declare-fun lt!419206 () Bool)

(assert (=> b!930275 (= lt!419206 (contains!4972 (getCurrentListMap!3163 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!930276 () Bool)

(declare-fun res!626492 () Bool)

(assert (=> b!930276 (=> (not res!626492) (not e!522377))))

(assert (=> b!930276 (= res!626492 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27324 _keys!1487))))))

(declare-fun b!930277 () Bool)

(declare-fun res!626493 () Bool)

(assert (=> b!930277 (=> (not res!626493) (not e!522377))))

(assert (=> b!930277 (= res!626493 (and (= (size!27325 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27324 _keys!1487) (size!27325 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930278 () Bool)

(assert (=> b!930278 (= e!522375 tp_is_empty!19947)))

(declare-fun mapNonEmpty!31677 () Bool)

(declare-fun tp!60757 () Bool)

(assert (=> mapNonEmpty!31677 (= mapRes!31677 (and tp!60757 e!522379))))

(declare-fun mapValue!31677 () ValueCell!9492)

(declare-fun mapKey!31677 () (_ BitVec 32))

(declare-fun mapRest!31677 () (Array (_ BitVec 32) ValueCell!9492))

(assert (=> mapNonEmpty!31677 (= (arr!26866 _values!1231) (store mapRest!31677 mapKey!31677 mapValue!31677))))

(assert (= (and start!79226 res!626491) b!930277))

(assert (= (and b!930277 res!626493) b!930273))

(assert (= (and b!930273 res!626487) b!930274))

(assert (= (and b!930274 res!626488) b!930276))

(assert (= (and b!930276 res!626492) b!930268))

(assert (= (and b!930268 res!626490) b!930272))

(assert (= (and b!930272 res!626494) b!930270))

(assert (= (and b!930270 res!626489) b!930275))

(assert (= (and b!930269 condMapEmpty!31677) mapIsEmpty!31677))

(assert (= (and b!930269 (not condMapEmpty!31677)) mapNonEmpty!31677))

(get-info :version)

(assert (= (and mapNonEmpty!31677 ((_ is ValueCellFull!9492) mapValue!31677)) b!930271))

(assert (= (and b!930269 ((_ is ValueCellFull!9492) mapDefault!31677)) b!930278))

(assert (= start!79226 b!930269))

(declare-fun m!864547 () Bool)

(assert (=> b!930272 m!864547))

(declare-fun m!864549 () Bool)

(assert (=> b!930273 m!864549))

(declare-fun m!864551 () Bool)

(assert (=> b!930275 m!864551))

(assert (=> b!930275 m!864551))

(declare-fun m!864553 () Bool)

(assert (=> b!930275 m!864553))

(declare-fun m!864555 () Bool)

(assert (=> b!930274 m!864555))

(declare-fun m!864557 () Bool)

(assert (=> b!930268 m!864557))

(declare-fun m!864559 () Bool)

(assert (=> b!930268 m!864559))

(declare-fun m!864561 () Bool)

(assert (=> mapNonEmpty!31677 m!864561))

(declare-fun m!864563 () Bool)

(assert (=> start!79226 m!864563))

(declare-fun m!864565 () Bool)

(assert (=> start!79226 m!864565))

(declare-fun m!864567 () Bool)

(assert (=> start!79226 m!864567))

(check-sat (not mapNonEmpty!31677) (not b!930272) (not b!930274) (not b!930273) (not b!930275) (not b_next!17439) tp_is_empty!19947 (not b!930268) b_and!28505 (not start!79226))
(check-sat b_and!28505 (not b_next!17439))
