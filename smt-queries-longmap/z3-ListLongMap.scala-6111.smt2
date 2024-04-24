; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78942 () Bool)

(assert start!78942)

(declare-fun b_free!16987 () Bool)

(declare-fun b_next!16987 () Bool)

(assert (=> start!78942 (= b_free!16987 (not b_next!16987))))

(declare-fun tp!59403 () Bool)

(declare-fun b_and!27721 () Bool)

(assert (=> start!78942 (= tp!59403 b_and!27721)))

(declare-fun mapIsEmpty!30999 () Bool)

(declare-fun mapRes!30999 () Bool)

(assert (=> mapIsEmpty!30999 mapRes!30999))

(declare-fun b!920216 () Bool)

(declare-fun res!620220 () Bool)

(declare-fun e!516605 () Bool)

(assert (=> b!920216 (=> (not res!620220) (not e!516605))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920216 (= res!620220 (validKeyInArray!0 k0!1099))))

(declare-fun b!920217 () Bool)

(declare-fun e!516607 () Bool)

(assert (=> b!920217 (= e!516607 e!516605)))

(declare-fun res!620214 () Bool)

(assert (=> b!920217 (=> (not res!620214) (not e!516605))))

(declare-datatypes ((V!30959 0))(
  ( (V!30960 (val!9798 Int)) )
))
(declare-datatypes ((tuple2!12710 0))(
  ( (tuple2!12711 (_1!6366 (_ BitVec 64)) (_2!6366 V!30959)) )
))
(declare-datatypes ((List!18528 0))(
  ( (Nil!18525) (Cons!18524 (h!19676 tuple2!12710) (t!26237 List!18528)) )
))
(declare-datatypes ((ListLongMap!11409 0))(
  ( (ListLongMap!11410 (toList!5720 List!18528)) )
))
(declare-fun lt!413004 () ListLongMap!11409)

(declare-fun contains!4774 (ListLongMap!11409 (_ BitVec 64)) Bool)

(assert (=> b!920217 (= res!620214 (contains!4774 lt!413004 k0!1099))))

(declare-datatypes ((array!55019 0))(
  ( (array!55020 (arr!26450 (Array (_ BitVec 32) (_ BitVec 64))) (size!26910 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55019)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9266 0))(
  ( (ValueCellFull!9266 (v!12313 V!30959)) (EmptyCell!9266) )
))
(declare-datatypes ((array!55021 0))(
  ( (array!55022 (arr!26451 (Array (_ BitVec 32) ValueCell!9266)) (size!26911 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55021)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30959)

(declare-fun minValue!1173 () V!30959)

(declare-fun getCurrentListMap!2974 (array!55019 array!55021 (_ BitVec 32) (_ BitVec 32) V!30959 V!30959 (_ BitVec 32) Int) ListLongMap!11409)

(assert (=> b!920217 (= lt!413004 (getCurrentListMap!2974 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920218 () Bool)

(declare-fun e!516608 () Bool)

(declare-fun e!516609 () Bool)

(assert (=> b!920218 (= e!516608 (and e!516609 mapRes!30999))))

(declare-fun condMapEmpty!30999 () Bool)

(declare-fun mapDefault!30999 () ValueCell!9266)

(assert (=> b!920218 (= condMapEmpty!30999 (= (arr!26451 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9266)) mapDefault!30999)))))

(declare-fun mapNonEmpty!30999 () Bool)

(declare-fun tp!59402 () Bool)

(declare-fun e!516610 () Bool)

(assert (=> mapNonEmpty!30999 (= mapRes!30999 (and tp!59402 e!516610))))

(declare-fun mapValue!30999 () ValueCell!9266)

(declare-fun mapKey!30999 () (_ BitVec 32))

(declare-fun mapRest!30999 () (Array (_ BitVec 32) ValueCell!9266))

(assert (=> mapNonEmpty!30999 (= (arr!26451 _values!1231) (store mapRest!30999 mapKey!30999 mapValue!30999))))

(declare-fun b!920219 () Bool)

(declare-fun res!620223 () Bool)

(assert (=> b!920219 (=> (not res!620223) (not e!516607))))

(assert (=> b!920219 (= res!620223 (and (= (size!26911 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26910 _keys!1487) (size!26911 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920220 () Bool)

(declare-fun res!620217 () Bool)

(assert (=> b!920220 (=> (not res!620217) (not e!516605))))

(assert (=> b!920220 (= res!620217 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun res!620221 () Bool)

(assert (=> start!78942 (=> (not res!620221) (not e!516607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78942 (= res!620221 (validMask!0 mask!1881))))

(assert (=> start!78942 e!516607))

(assert (=> start!78942 true))

(declare-fun tp_is_empty!19495 () Bool)

(assert (=> start!78942 tp_is_empty!19495))

(declare-fun array_inv!20708 (array!55021) Bool)

(assert (=> start!78942 (and (array_inv!20708 _values!1231) e!516608)))

(assert (=> start!78942 tp!59403))

(declare-fun array_inv!20709 (array!55019) Bool)

(assert (=> start!78942 (array_inv!20709 _keys!1487)))

(declare-fun b!920221 () Bool)

(declare-fun res!620222 () Bool)

(assert (=> b!920221 (=> (not res!620222) (not e!516607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55019 (_ BitVec 32)) Bool)

(assert (=> b!920221 (= res!620222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920222 () Bool)

(assert (=> b!920222 (= e!516610 tp_is_empty!19495)))

(declare-fun b!920223 () Bool)

(assert (=> b!920223 (= e!516609 tp_is_empty!19495)))

(declare-fun b!920224 () Bool)

(declare-fun res!620218 () Bool)

(assert (=> b!920224 (=> (not res!620218) (not e!516607))))

(declare-datatypes ((List!18529 0))(
  ( (Nil!18526) (Cons!18525 (h!19677 (_ BitVec 64)) (t!26238 List!18529)) )
))
(declare-fun arrayNoDuplicates!0 (array!55019 (_ BitVec 32) List!18529) Bool)

(assert (=> b!920224 (= res!620218 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18526))))

(declare-fun b!920225 () Bool)

(declare-fun e!516604 () Bool)

(assert (=> b!920225 (= e!516604 (not true))))

(assert (=> b!920225 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18526)))

(declare-datatypes ((Unit!31032 0))(
  ( (Unit!31033) )
))
(declare-fun lt!413002 () Unit!31032)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55019 (_ BitVec 32) (_ BitVec 32)) Unit!31032)

(assert (=> b!920225 (= lt!413002 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413003 () tuple2!12710)

(declare-fun +!2660 (ListLongMap!11409 tuple2!12710) ListLongMap!11409)

(assert (=> b!920225 (contains!4774 (+!2660 lt!413004 lt!413003) k0!1099)))

(declare-fun lt!413001 () (_ BitVec 64))

(declare-fun lt!413006 () V!30959)

(declare-fun lt!413000 () Unit!31032)

(declare-fun addStillContains!369 (ListLongMap!11409 (_ BitVec 64) V!30959 (_ BitVec 64)) Unit!31032)

(assert (=> b!920225 (= lt!413000 (addStillContains!369 lt!413004 lt!413001 lt!413006 k0!1099))))

(assert (=> b!920225 (= (getCurrentListMap!2974 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2660 (getCurrentListMap!2974 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413003))))

(assert (=> b!920225 (= lt!413003 (tuple2!12711 lt!413001 lt!413006))))

(declare-fun get!13891 (ValueCell!9266 V!30959) V!30959)

(declare-fun dynLambda!1457 (Int (_ BitVec 64)) V!30959)

(assert (=> b!920225 (= lt!413006 (get!13891 (select (arr!26451 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1457 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413005 () Unit!31032)

(declare-fun lemmaListMapRecursiveValidKeyArray!40 (array!55019 array!55021 (_ BitVec 32) (_ BitVec 32) V!30959 V!30959 (_ BitVec 32) Int) Unit!31032)

(assert (=> b!920225 (= lt!413005 (lemmaListMapRecursiveValidKeyArray!40 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920226 () Bool)

(declare-fun res!620219 () Bool)

(assert (=> b!920226 (=> (not res!620219) (not e!516607))))

(assert (=> b!920226 (= res!620219 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26910 _keys!1487))))))

(declare-fun b!920227 () Bool)

(assert (=> b!920227 (= e!516605 e!516604)))

(declare-fun res!620215 () Bool)

(assert (=> b!920227 (=> (not res!620215) (not e!516604))))

(assert (=> b!920227 (= res!620215 (validKeyInArray!0 lt!413001))))

(assert (=> b!920227 (= lt!413001 (select (arr!26450 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920228 () Bool)

(declare-fun res!620216 () Bool)

(assert (=> b!920228 (=> (not res!620216) (not e!516605))))

(declare-fun v!791 () V!30959)

(declare-fun apply!592 (ListLongMap!11409 (_ BitVec 64)) V!30959)

(assert (=> b!920228 (= res!620216 (= (apply!592 lt!413004 k0!1099) v!791))))

(assert (= (and start!78942 res!620221) b!920219))

(assert (= (and b!920219 res!620223) b!920221))

(assert (= (and b!920221 res!620222) b!920224))

(assert (= (and b!920224 res!620218) b!920226))

(assert (= (and b!920226 res!620219) b!920217))

(assert (= (and b!920217 res!620214) b!920228))

(assert (= (and b!920228 res!620216) b!920220))

(assert (= (and b!920220 res!620217) b!920216))

(assert (= (and b!920216 res!620220) b!920227))

(assert (= (and b!920227 res!620215) b!920225))

(assert (= (and b!920218 condMapEmpty!30999) mapIsEmpty!30999))

(assert (= (and b!920218 (not condMapEmpty!30999)) mapNonEmpty!30999))

(get-info :version)

(assert (= (and mapNonEmpty!30999 ((_ is ValueCellFull!9266) mapValue!30999)) b!920222))

(assert (= (and b!920218 ((_ is ValueCellFull!9266) mapDefault!30999)) b!920223))

(assert (= start!78942 b!920218))

(declare-fun b_lambda!13503 () Bool)

(assert (=> (not b_lambda!13503) (not b!920225)))

(declare-fun t!26236 () Bool)

(declare-fun tb!5559 () Bool)

(assert (=> (and start!78942 (= defaultEntry!1235 defaultEntry!1235) t!26236) tb!5559))

(declare-fun result!10949 () Bool)

(assert (=> tb!5559 (= result!10949 tp_is_empty!19495)))

(assert (=> b!920225 t!26236))

(declare-fun b_and!27723 () Bool)

(assert (= b_and!27721 (and (=> t!26236 result!10949) b_and!27723)))

(declare-fun m!854365 () Bool)

(assert (=> b!920225 m!854365))

(declare-fun m!854367 () Bool)

(assert (=> b!920225 m!854367))

(declare-fun m!854369 () Bool)

(assert (=> b!920225 m!854369))

(declare-fun m!854371 () Bool)

(assert (=> b!920225 m!854371))

(declare-fun m!854373 () Bool)

(assert (=> b!920225 m!854373))

(declare-fun m!854375 () Bool)

(assert (=> b!920225 m!854375))

(assert (=> b!920225 m!854367))

(assert (=> b!920225 m!854369))

(declare-fun m!854377 () Bool)

(assert (=> b!920225 m!854377))

(declare-fun m!854379 () Bool)

(assert (=> b!920225 m!854379))

(declare-fun m!854381 () Bool)

(assert (=> b!920225 m!854381))

(assert (=> b!920225 m!854371))

(declare-fun m!854383 () Bool)

(assert (=> b!920225 m!854383))

(declare-fun m!854385 () Bool)

(assert (=> b!920225 m!854385))

(assert (=> b!920225 m!854365))

(declare-fun m!854387 () Bool)

(assert (=> b!920225 m!854387))

(declare-fun m!854389 () Bool)

(assert (=> mapNonEmpty!30999 m!854389))

(declare-fun m!854391 () Bool)

(assert (=> b!920221 m!854391))

(declare-fun m!854393 () Bool)

(assert (=> start!78942 m!854393))

(declare-fun m!854395 () Bool)

(assert (=> start!78942 m!854395))

(declare-fun m!854397 () Bool)

(assert (=> start!78942 m!854397))

(declare-fun m!854399 () Bool)

(assert (=> b!920227 m!854399))

(declare-fun m!854401 () Bool)

(assert (=> b!920227 m!854401))

(declare-fun m!854403 () Bool)

(assert (=> b!920217 m!854403))

(declare-fun m!854405 () Bool)

(assert (=> b!920217 m!854405))

(declare-fun m!854407 () Bool)

(assert (=> b!920228 m!854407))

(declare-fun m!854409 () Bool)

(assert (=> b!920216 m!854409))

(declare-fun m!854411 () Bool)

(assert (=> b!920224 m!854411))

(check-sat b_and!27723 (not b!920221) (not b!920216) (not b!920224) (not b!920217) (not b!920227) (not b_lambda!13503) tp_is_empty!19495 (not b_next!16987) (not start!78942) (not b!920228) (not b!920225) (not mapNonEmpty!30999))
(check-sat b_and!27723 (not b_next!16987))
