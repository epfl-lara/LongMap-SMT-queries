; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74320 () Bool)

(assert start!74320)

(declare-fun mapIsEmpty!27389 () Bool)

(declare-fun mapRes!27389 () Bool)

(assert (=> mapIsEmpty!27389 mapRes!27389))

(declare-fun b!873202 () Bool)

(declare-fun e!486321 () Bool)

(declare-fun tp_is_empty!17191 () Bool)

(assert (=> b!873202 (= e!486321 tp_is_empty!17191)))

(declare-fun mapNonEmpty!27389 () Bool)

(declare-fun tp!52589 () Bool)

(assert (=> mapNonEmpty!27389 (= mapRes!27389 (and tp!52589 e!486321))))

(declare-datatypes ((V!27969 0))(
  ( (V!27970 (val!8643 Int)) )
))
(declare-datatypes ((ValueCell!8156 0))(
  ( (ValueCellFull!8156 (v!11068 V!27969)) (EmptyCell!8156) )
))
(declare-fun mapValue!27389 () ValueCell!8156)

(declare-fun mapKey!27389 () (_ BitVec 32))

(declare-datatypes ((array!50573 0))(
  ( (array!50574 (arr!24312 (Array (_ BitVec 32) ValueCell!8156)) (size!24753 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50573)

(declare-fun mapRest!27389 () (Array (_ BitVec 32) ValueCell!8156))

(assert (=> mapNonEmpty!27389 (= (arr!24312 _values!688) (store mapRest!27389 mapKey!27389 mapValue!27389))))

(declare-fun res!593219 () Bool)

(declare-fun e!486318 () Bool)

(assert (=> start!74320 (=> (not res!593219) (not e!486318))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50575 0))(
  ( (array!50576 (arr!24313 (Array (_ BitVec 32) (_ BitVec 64))) (size!24754 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50575)

(assert (=> start!74320 (= res!593219 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24754 _keys!868))))))

(assert (=> start!74320 e!486318))

(assert (=> start!74320 true))

(declare-fun array_inv!19238 (array!50575) Bool)

(assert (=> start!74320 (array_inv!19238 _keys!868)))

(declare-fun e!486322 () Bool)

(declare-fun array_inv!19239 (array!50573) Bool)

(assert (=> start!74320 (and (array_inv!19239 _values!688) e!486322)))

(declare-fun b!873203 () Bool)

(declare-fun res!593221 () Bool)

(assert (=> b!873203 (=> (not res!593221) (not e!486318))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873203 (= res!593221 (and (= (size!24753 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24754 _keys!868) (size!24753 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873204 () Bool)

(declare-fun e!486319 () Bool)

(assert (=> b!873204 (= e!486319 tp_is_empty!17191)))

(declare-fun b!873205 () Bool)

(assert (=> b!873205 (= e!486322 (and e!486319 mapRes!27389))))

(declare-fun condMapEmpty!27389 () Bool)

(declare-fun mapDefault!27389 () ValueCell!8156)

(assert (=> b!873205 (= condMapEmpty!27389 (= (arr!24312 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8156)) mapDefault!27389)))))

(declare-fun b!873206 () Bool)

(declare-fun res!593220 () Bool)

(assert (=> b!873206 (=> (not res!593220) (not e!486318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873206 (= res!593220 (validMask!0 mask!1196))))

(declare-fun b!873207 () Bool)

(assert (=> b!873207 (= e!486318 false)))

(declare-fun lt!395963 () Bool)

(declare-datatypes ((List!17212 0))(
  ( (Nil!17209) (Cons!17208 (h!18345 (_ BitVec 64)) (t!24241 List!17212)) )
))
(declare-fun arrayNoDuplicates!0 (array!50575 (_ BitVec 32) List!17212) Bool)

(assert (=> b!873207 (= lt!395963 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17209))))

(declare-fun b!873208 () Bool)

(declare-fun res!593218 () Bool)

(assert (=> b!873208 (=> (not res!593218) (not e!486318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50575 (_ BitVec 32)) Bool)

(assert (=> b!873208 (= res!593218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74320 res!593219) b!873206))

(assert (= (and b!873206 res!593220) b!873203))

(assert (= (and b!873203 res!593221) b!873208))

(assert (= (and b!873208 res!593218) b!873207))

(assert (= (and b!873205 condMapEmpty!27389) mapIsEmpty!27389))

(assert (= (and b!873205 (not condMapEmpty!27389)) mapNonEmpty!27389))

(get-info :version)

(assert (= (and mapNonEmpty!27389 ((_ is ValueCellFull!8156) mapValue!27389)) b!873202))

(assert (= (and b!873205 ((_ is ValueCellFull!8156) mapDefault!27389)) b!873204))

(assert (= start!74320 b!873205))

(declare-fun m!814469 () Bool)

(assert (=> start!74320 m!814469))

(declare-fun m!814471 () Bool)

(assert (=> start!74320 m!814471))

(declare-fun m!814473 () Bool)

(assert (=> mapNonEmpty!27389 m!814473))

(declare-fun m!814475 () Bool)

(assert (=> b!873207 m!814475))

(declare-fun m!814477 () Bool)

(assert (=> b!873206 m!814477))

(declare-fun m!814479 () Bool)

(assert (=> b!873208 m!814479))

(check-sat tp_is_empty!17191 (not b!873207) (not start!74320) (not b!873206) (not b!873208) (not mapNonEmpty!27389))
(check-sat)
