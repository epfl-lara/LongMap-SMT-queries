; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78740 () Bool)

(assert start!78740)

(declare-fun b_free!16953 () Bool)

(declare-fun b_next!16953 () Bool)

(assert (=> start!78740 (= b_free!16953 (not b_next!16953))))

(declare-fun tp!59300 () Bool)

(declare-fun b_and!27643 () Bool)

(assert (=> start!78740 (= tp!59300 b_and!27643)))

(declare-fun b!918616 () Bool)

(declare-fun res!619364 () Bool)

(declare-fun e!515668 () Bool)

(assert (=> b!918616 (=> (not res!619364) (not e!515668))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!30913 0))(
  ( (V!30914 (val!9781 Int)) )
))
(declare-fun v!791 () V!30913)

(declare-datatypes ((tuple2!12710 0))(
  ( (tuple2!12711 (_1!6366 (_ BitVec 64)) (_2!6366 V!30913)) )
))
(declare-datatypes ((List!18516 0))(
  ( (Nil!18513) (Cons!18512 (h!19658 tuple2!12710) (t!26199 List!18516)) )
))
(declare-datatypes ((ListLongMap!11407 0))(
  ( (ListLongMap!11408 (toList!5719 List!18516)) )
))
(declare-fun lt!412318 () ListLongMap!11407)

(declare-fun apply!566 (ListLongMap!11407 (_ BitVec 64)) V!30913)

(assert (=> b!918616 (= res!619364 (= (apply!566 lt!412318 k0!1099) v!791))))

(declare-fun mapIsEmpty!30948 () Bool)

(declare-fun mapRes!30948 () Bool)

(assert (=> mapIsEmpty!30948 mapRes!30948))

(declare-fun b!918617 () Bool)

(declare-fun res!619366 () Bool)

(declare-fun e!515665 () Bool)

(assert (=> b!918617 (=> (not res!619366) (not e!515665))))

(declare-datatypes ((array!54906 0))(
  ( (array!54907 (arr!26398 (Array (_ BitVec 32) (_ BitVec 64))) (size!26857 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54906)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9249 0))(
  ( (ValueCellFull!9249 (v!12299 V!30913)) (EmptyCell!9249) )
))
(declare-datatypes ((array!54908 0))(
  ( (array!54909 (arr!26399 (Array (_ BitVec 32) ValueCell!9249)) (size!26858 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54908)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!918617 (= res!619366 (and (= (size!26858 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26857 _keys!1487) (size!26858 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918618 () Bool)

(declare-fun e!515669 () Bool)

(assert (=> b!918618 (= e!515668 e!515669)))

(declare-fun res!619363 () Bool)

(assert (=> b!918618 (=> (not res!619363) (not e!515669))))

(declare-fun lt!412315 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918618 (= res!619363 (validKeyInArray!0 lt!412315))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918618 (= lt!412315 (select (arr!26398 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918619 () Bool)

(declare-fun e!515671 () Bool)

(declare-fun e!515667 () Bool)

(assert (=> b!918619 (= e!515671 (and e!515667 mapRes!30948))))

(declare-fun condMapEmpty!30948 () Bool)

(declare-fun mapDefault!30948 () ValueCell!9249)

(assert (=> b!918619 (= condMapEmpty!30948 (= (arr!26399 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9249)) mapDefault!30948)))))

(declare-fun b!918620 () Bool)

(declare-fun tp_is_empty!19461 () Bool)

(assert (=> b!918620 (= e!515667 tp_is_empty!19461)))

(declare-fun b!918621 () Bool)

(declare-fun e!515666 () Bool)

(assert (=> b!918621 (= e!515666 tp_is_empty!19461)))

(declare-fun res!619367 () Bool)

(assert (=> start!78740 (=> (not res!619367) (not e!515665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78740 (= res!619367 (validMask!0 mask!1881))))

(assert (=> start!78740 e!515665))

(assert (=> start!78740 true))

(assert (=> start!78740 tp_is_empty!19461))

(declare-fun array_inv!20578 (array!54908) Bool)

(assert (=> start!78740 (and (array_inv!20578 _values!1231) e!515671)))

(assert (=> start!78740 tp!59300))

(declare-fun array_inv!20579 (array!54906) Bool)

(assert (=> start!78740 (array_inv!20579 _keys!1487)))

(declare-fun b!918622 () Bool)

(declare-fun res!619361 () Bool)

(assert (=> b!918622 (=> (not res!619361) (not e!515668))))

(assert (=> b!918622 (= res!619361 (validKeyInArray!0 k0!1099))))

(declare-fun b!918623 () Bool)

(declare-fun res!619368 () Bool)

(assert (=> b!918623 (=> (not res!619368) (not e!515665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54906 (_ BitVec 32)) Bool)

(assert (=> b!918623 (= res!619368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!30948 () Bool)

(declare-fun tp!59299 () Bool)

(assert (=> mapNonEmpty!30948 (= mapRes!30948 (and tp!59299 e!515666))))

(declare-fun mapValue!30948 () ValueCell!9249)

(declare-fun mapRest!30948 () (Array (_ BitVec 32) ValueCell!9249))

(declare-fun mapKey!30948 () (_ BitVec 32))

(assert (=> mapNonEmpty!30948 (= (arr!26399 _values!1231) (store mapRest!30948 mapKey!30948 mapValue!30948))))

(declare-fun b!918624 () Bool)

(declare-fun res!619362 () Bool)

(assert (=> b!918624 (=> (not res!619362) (not e!515665))))

(assert (=> b!918624 (= res!619362 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26857 _keys!1487))))))

(declare-fun b!918625 () Bool)

(assert (=> b!918625 (= e!515669 (not true))))

(declare-fun lt!412316 () tuple2!12710)

(declare-fun contains!4765 (ListLongMap!11407 (_ BitVec 64)) Bool)

(declare-fun +!2631 (ListLongMap!11407 tuple2!12710) ListLongMap!11407)

(assert (=> b!918625 (contains!4765 (+!2631 lt!412318 lt!412316) k0!1099)))

(declare-datatypes ((Unit!31010 0))(
  ( (Unit!31011) )
))
(declare-fun lt!412313 () Unit!31010)

(declare-fun lt!412317 () V!30913)

(declare-fun addStillContains!355 (ListLongMap!11407 (_ BitVec 64) V!30913 (_ BitVec 64)) Unit!31010)

(assert (=> b!918625 (= lt!412313 (addStillContains!355 lt!412318 lt!412315 lt!412317 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30913)

(declare-fun minValue!1173 () V!30913)

(declare-fun getCurrentListMap!2975 (array!54906 array!54908 (_ BitVec 32) (_ BitVec 32) V!30913 V!30913 (_ BitVec 32) Int) ListLongMap!11407)

(assert (=> b!918625 (= (getCurrentListMap!2975 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2631 (getCurrentListMap!2975 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412316))))

(assert (=> b!918625 (= lt!412316 (tuple2!12711 lt!412315 lt!412317))))

(declare-fun get!13838 (ValueCell!9249 V!30913) V!30913)

(declare-fun dynLambda!1420 (Int (_ BitVec 64)) V!30913)

(assert (=> b!918625 (= lt!412317 (get!13838 (select (arr!26399 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1420 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412314 () Unit!31010)

(declare-fun lemmaListMapRecursiveValidKeyArray!21 (array!54906 array!54908 (_ BitVec 32) (_ BitVec 32) V!30913 V!30913 (_ BitVec 32) Int) Unit!31010)

(assert (=> b!918625 (= lt!412314 (lemmaListMapRecursiveValidKeyArray!21 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918626 () Bool)

(declare-fun res!619369 () Bool)

(assert (=> b!918626 (=> (not res!619369) (not e!515668))))

(assert (=> b!918626 (= res!619369 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918627 () Bool)

(assert (=> b!918627 (= e!515665 e!515668)))

(declare-fun res!619365 () Bool)

(assert (=> b!918627 (=> (not res!619365) (not e!515668))))

(assert (=> b!918627 (= res!619365 (contains!4765 lt!412318 k0!1099))))

(assert (=> b!918627 (= lt!412318 (getCurrentListMap!2975 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918628 () Bool)

(declare-fun res!619360 () Bool)

(assert (=> b!918628 (=> (not res!619360) (not e!515665))))

(declare-datatypes ((List!18517 0))(
  ( (Nil!18514) (Cons!18513 (h!19659 (_ BitVec 64)) (t!26200 List!18517)) )
))
(declare-fun arrayNoDuplicates!0 (array!54906 (_ BitVec 32) List!18517) Bool)

(assert (=> b!918628 (= res!619360 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18514))))

(assert (= (and start!78740 res!619367) b!918617))

(assert (= (and b!918617 res!619366) b!918623))

(assert (= (and b!918623 res!619368) b!918628))

(assert (= (and b!918628 res!619360) b!918624))

(assert (= (and b!918624 res!619362) b!918627))

(assert (= (and b!918627 res!619365) b!918616))

(assert (= (and b!918616 res!619364) b!918626))

(assert (= (and b!918626 res!619369) b!918622))

(assert (= (and b!918622 res!619361) b!918618))

(assert (= (and b!918618 res!619363) b!918625))

(assert (= (and b!918619 condMapEmpty!30948) mapIsEmpty!30948))

(assert (= (and b!918619 (not condMapEmpty!30948)) mapNonEmpty!30948))

(get-info :version)

(assert (= (and mapNonEmpty!30948 ((_ is ValueCellFull!9249) mapValue!30948)) b!918621))

(assert (= (and b!918619 ((_ is ValueCellFull!9249) mapDefault!30948)) b!918620))

(assert (= start!78740 b!918619))

(declare-fun b_lambda!13455 () Bool)

(assert (=> (not b_lambda!13455) (not b!918625)))

(declare-fun t!26198 () Bool)

(declare-fun tb!5533 () Bool)

(assert (=> (and start!78740 (= defaultEntry!1235 defaultEntry!1235) t!26198) tb!5533))

(declare-fun result!10889 () Bool)

(assert (=> tb!5533 (= result!10889 tp_is_empty!19461)))

(assert (=> b!918625 t!26198))

(declare-fun b_and!27645 () Bool)

(assert (= b_and!27643 (and (=> t!26198 result!10889) b_and!27645)))

(declare-fun m!852299 () Bool)

(assert (=> b!918616 m!852299))

(declare-fun m!852301 () Bool)

(assert (=> b!918622 m!852301))

(declare-fun m!852303 () Bool)

(assert (=> mapNonEmpty!30948 m!852303))

(declare-fun m!852305 () Bool)

(assert (=> b!918625 m!852305))

(declare-fun m!852307 () Bool)

(assert (=> b!918625 m!852307))

(declare-fun m!852309 () Bool)

(assert (=> b!918625 m!852309))

(declare-fun m!852311 () Bool)

(assert (=> b!918625 m!852311))

(declare-fun m!852313 () Bool)

(assert (=> b!918625 m!852313))

(assert (=> b!918625 m!852311))

(declare-fun m!852315 () Bool)

(assert (=> b!918625 m!852315))

(declare-fun m!852317 () Bool)

(assert (=> b!918625 m!852317))

(declare-fun m!852319 () Bool)

(assert (=> b!918625 m!852319))

(assert (=> b!918625 m!852305))

(declare-fun m!852321 () Bool)

(assert (=> b!918625 m!852321))

(assert (=> b!918625 m!852315))

(assert (=> b!918625 m!852309))

(declare-fun m!852323 () Bool)

(assert (=> b!918625 m!852323))

(declare-fun m!852325 () Bool)

(assert (=> b!918627 m!852325))

(declare-fun m!852327 () Bool)

(assert (=> b!918627 m!852327))

(declare-fun m!852329 () Bool)

(assert (=> b!918618 m!852329))

(declare-fun m!852331 () Bool)

(assert (=> b!918618 m!852331))

(declare-fun m!852333 () Bool)

(assert (=> b!918623 m!852333))

(declare-fun m!852335 () Bool)

(assert (=> b!918628 m!852335))

(declare-fun m!852337 () Bool)

(assert (=> start!78740 m!852337))

(declare-fun m!852339 () Bool)

(assert (=> start!78740 m!852339))

(declare-fun m!852341 () Bool)

(assert (=> start!78740 m!852341))

(check-sat (not start!78740) (not b!918627) (not b!918616) tp_is_empty!19461 (not b_lambda!13455) (not b_next!16953) (not mapNonEmpty!30948) b_and!27645 (not b!918625) (not b!918628) (not b!918623) (not b!918618) (not b!918622))
(check-sat b_and!27645 (not b_next!16953))
