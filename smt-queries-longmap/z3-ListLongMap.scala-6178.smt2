; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79344 () Bool)

(assert start!79344)

(declare-fun b_free!17389 () Bool)

(declare-fun b_next!17389 () Bool)

(assert (=> start!79344 (= b_free!17389 (not b_next!17389))))

(declare-fun tp!60609 () Bool)

(declare-fun b_and!28465 () Bool)

(assert (=> start!79344 (= tp!60609 b_and!28465)))

(declare-fun mapNonEmpty!31602 () Bool)

(declare-fun mapRes!31602 () Bool)

(declare-fun tp!60608 () Bool)

(declare-fun e!522509 () Bool)

(assert (=> mapNonEmpty!31602 (= mapRes!31602 (and tp!60608 e!522509))))

(declare-fun mapKey!31602 () (_ BitVec 32))

(declare-datatypes ((V!31495 0))(
  ( (V!31496 (val!9999 Int)) )
))
(declare-datatypes ((ValueCell!9467 0))(
  ( (ValueCellFull!9467 (v!12514 V!31495)) (EmptyCell!9467) )
))
(declare-fun mapValue!31602 () ValueCell!9467)

(declare-fun mapRest!31602 () (Array (_ BitVec 32) ValueCell!9467))

(declare-datatypes ((array!55803 0))(
  ( (array!55804 (arr!26842 (Array (_ BitVec 32) ValueCell!9467)) (size!27302 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55803)

(assert (=> mapNonEmpty!31602 (= (arr!26842 _values!1231) (store mapRest!31602 mapKey!31602 mapValue!31602))))

(declare-fun b!930337 () Bool)

(declare-fun res!626224 () Bool)

(declare-fun e!522507 () Bool)

(assert (=> b!930337 (=> (not res!626224) (not e!522507))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55805 0))(
  ( (array!55806 (arr!26843 (Array (_ BitVec 32) (_ BitVec 64))) (size!27303 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55805)

(assert (=> b!930337 (= res!626224 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27303 _keys!1487))))))

(declare-fun b!930338 () Bool)

(declare-fun e!522508 () Bool)

(assert (=> b!930338 (= e!522508 false)))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!419425 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!31495)

(declare-fun minValue!1173 () V!31495)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((tuple2!13064 0))(
  ( (tuple2!13065 (_1!6543 (_ BitVec 64)) (_2!6543 V!31495)) )
))
(declare-datatypes ((List!18864 0))(
  ( (Nil!18861) (Cons!18860 (h!20012 tuple2!13064) (t!26913 List!18864)) )
))
(declare-datatypes ((ListLongMap!11763 0))(
  ( (ListLongMap!11764 (toList!5897 List!18864)) )
))
(declare-fun contains!4966 (ListLongMap!11763 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3144 (array!55805 array!55803 (_ BitVec 32) (_ BitVec 32) V!31495 V!31495 (_ BitVec 32) Int) ListLongMap!11763)

(assert (=> b!930338 (= lt!419425 (contains!4966 (getCurrentListMap!3144 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!930339 () Bool)

(declare-fun res!626226 () Bool)

(assert (=> b!930339 (=> (not res!626226) (not e!522508))))

(assert (=> b!930339 (= res!626226 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930340 () Bool)

(declare-fun res!626228 () Bool)

(assert (=> b!930340 (=> (not res!626228) (not e!522507))))

(declare-datatypes ((List!18865 0))(
  ( (Nil!18862) (Cons!18861 (h!20013 (_ BitVec 64)) (t!26914 List!18865)) )
))
(declare-fun arrayNoDuplicates!0 (array!55805 (_ BitVec 32) List!18865) Bool)

(assert (=> b!930340 (= res!626228 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18862))))

(declare-fun b!930341 () Bool)

(declare-fun res!626223 () Bool)

(assert (=> b!930341 (=> (not res!626223) (not e!522507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55805 (_ BitVec 32)) Bool)

(assert (=> b!930341 (= res!626223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930342 () Bool)

(declare-fun res!626225 () Bool)

(assert (=> b!930342 (=> (not res!626225) (not e!522507))))

(assert (=> b!930342 (= res!626225 (and (= (size!27302 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27303 _keys!1487) (size!27302 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930343 () Bool)

(declare-fun tp_is_empty!19897 () Bool)

(assert (=> b!930343 (= e!522509 tp_is_empty!19897)))

(declare-fun res!626229 () Bool)

(assert (=> start!79344 (=> (not res!626229) (not e!522507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79344 (= res!626229 (validMask!0 mask!1881))))

(assert (=> start!79344 e!522507))

(assert (=> start!79344 true))

(assert (=> start!79344 tp_is_empty!19897))

(declare-fun e!522511 () Bool)

(declare-fun array_inv!21000 (array!55803) Bool)

(assert (=> start!79344 (and (array_inv!21000 _values!1231) e!522511)))

(assert (=> start!79344 tp!60609))

(declare-fun array_inv!21001 (array!55805) Bool)

(assert (=> start!79344 (array_inv!21001 _keys!1487)))

(declare-fun mapIsEmpty!31602 () Bool)

(assert (=> mapIsEmpty!31602 mapRes!31602))

(declare-fun b!930344 () Bool)

(declare-fun e!522510 () Bool)

(assert (=> b!930344 (= e!522511 (and e!522510 mapRes!31602))))

(declare-fun condMapEmpty!31602 () Bool)

(declare-fun mapDefault!31602 () ValueCell!9467)

(assert (=> b!930344 (= condMapEmpty!31602 (= (arr!26842 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9467)) mapDefault!31602)))))

(declare-fun b!930345 () Bool)

(assert (=> b!930345 (= e!522507 e!522508)))

(declare-fun res!626227 () Bool)

(assert (=> b!930345 (=> (not res!626227) (not e!522508))))

(declare-fun lt!419426 () ListLongMap!11763)

(assert (=> b!930345 (= res!626227 (contains!4966 lt!419426 k0!1099))))

(assert (=> b!930345 (= lt!419426 (getCurrentListMap!3144 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930346 () Bool)

(assert (=> b!930346 (= e!522510 tp_is_empty!19897)))

(declare-fun b!930347 () Bool)

(declare-fun res!626222 () Bool)

(assert (=> b!930347 (=> (not res!626222) (not e!522508))))

(declare-fun v!791 () V!31495)

(declare-fun apply!741 (ListLongMap!11763 (_ BitVec 64)) V!31495)

(assert (=> b!930347 (= res!626222 (= (apply!741 lt!419426 k0!1099) v!791))))

(assert (= (and start!79344 res!626229) b!930342))

(assert (= (and b!930342 res!626225) b!930341))

(assert (= (and b!930341 res!626223) b!930340))

(assert (= (and b!930340 res!626228) b!930337))

(assert (= (and b!930337 res!626224) b!930345))

(assert (= (and b!930345 res!626227) b!930347))

(assert (= (and b!930347 res!626222) b!930339))

(assert (= (and b!930339 res!626226) b!930338))

(assert (= (and b!930344 condMapEmpty!31602) mapIsEmpty!31602))

(assert (= (and b!930344 (not condMapEmpty!31602)) mapNonEmpty!31602))

(get-info :version)

(assert (= (and mapNonEmpty!31602 ((_ is ValueCellFull!9467) mapValue!31602)) b!930343))

(assert (= (and b!930344 ((_ is ValueCellFull!9467) mapDefault!31602)) b!930346))

(assert (= start!79344 b!930344))

(declare-fun m!865291 () Bool)

(assert (=> mapNonEmpty!31602 m!865291))

(declare-fun m!865293 () Bool)

(assert (=> b!930338 m!865293))

(assert (=> b!930338 m!865293))

(declare-fun m!865295 () Bool)

(assert (=> b!930338 m!865295))

(declare-fun m!865297 () Bool)

(assert (=> b!930340 m!865297))

(declare-fun m!865299 () Bool)

(assert (=> b!930345 m!865299))

(declare-fun m!865301 () Bool)

(assert (=> b!930345 m!865301))

(declare-fun m!865303 () Bool)

(assert (=> b!930347 m!865303))

(declare-fun m!865305 () Bool)

(assert (=> b!930341 m!865305))

(declare-fun m!865307 () Bool)

(assert (=> start!79344 m!865307))

(declare-fun m!865309 () Bool)

(assert (=> start!79344 m!865309))

(declare-fun m!865311 () Bool)

(assert (=> start!79344 m!865311))

(check-sat (not b!930338) (not b!930341) (not start!79344) (not b!930345) b_and!28465 (not b!930347) (not mapNonEmpty!31602) tp_is_empty!19897 (not b!930340) (not b_next!17389))
(check-sat b_and!28465 (not b_next!17389))
