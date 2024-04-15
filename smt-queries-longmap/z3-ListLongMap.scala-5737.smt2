; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74218 () Bool)

(assert start!74218)

(declare-fun mapNonEmpty!27491 () Bool)

(declare-fun mapRes!27491 () Bool)

(declare-fun tp!52718 () Bool)

(declare-fun e!486189 () Bool)

(assert (=> mapNonEmpty!27491 (= mapRes!27491 (and tp!52718 e!486189))))

(declare-fun mapKey!27491 () (_ BitVec 32))

(declare-datatypes ((V!28057 0))(
  ( (V!28058 (val!8676 Int)) )
))
(declare-datatypes ((ValueCell!8189 0))(
  ( (ValueCellFull!8189 (v!11099 V!28057)) (EmptyCell!8189) )
))
(declare-fun mapValue!27491 () ValueCell!8189)

(declare-fun mapRest!27491 () (Array (_ BitVec 32) ValueCell!8189))

(declare-datatypes ((array!50631 0))(
  ( (array!50632 (arr!24345 (Array (_ BitVec 32) ValueCell!8189)) (size!24787 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50631)

(assert (=> mapNonEmpty!27491 (= (arr!24345 _values!688) (store mapRest!27491 mapKey!27491 mapValue!27491))))

(declare-fun b!873072 () Bool)

(declare-fun res!593353 () Bool)

(declare-fun e!486188 () Bool)

(assert (=> b!873072 (=> (not res!593353) (not e!486188))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50633 0))(
  ( (array!50634 (arr!24346 (Array (_ BitVec 32) (_ BitVec 64))) (size!24788 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50633)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873072 (= res!593353 (and (= (size!24787 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24788 _keys!868) (size!24787 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun b!873073 () Bool)

(assert (=> b!873073 (= e!486188 (and (= (select (arr!24346 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24788 _keys!868)) (bvsge i!612 (size!24787 _values!688))))))

(declare-fun b!873074 () Bool)

(declare-fun tp_is_empty!17257 () Bool)

(assert (=> b!873074 (= e!486189 tp_is_empty!17257)))

(declare-fun b!873075 () Bool)

(declare-fun res!593350 () Bool)

(assert (=> b!873075 (=> (not res!593350) (not e!486188))))

(assert (=> b!873075 (= res!593350 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24788 _keys!868))))))

(declare-fun mapIsEmpty!27491 () Bool)

(assert (=> mapIsEmpty!27491 mapRes!27491))

(declare-fun b!873076 () Bool)

(declare-fun res!593349 () Bool)

(assert (=> b!873076 (=> (not res!593349) (not e!486188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50633 (_ BitVec 32)) Bool)

(assert (=> b!873076 (= res!593349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873077 () Bool)

(declare-fun e!486190 () Bool)

(declare-fun e!486191 () Bool)

(assert (=> b!873077 (= e!486190 (and e!486191 mapRes!27491))))

(declare-fun condMapEmpty!27491 () Bool)

(declare-fun mapDefault!27491 () ValueCell!8189)

(assert (=> b!873077 (= condMapEmpty!27491 (= (arr!24345 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8189)) mapDefault!27491)))))

(declare-fun b!873079 () Bool)

(assert (=> b!873079 (= e!486191 tp_is_empty!17257)))

(declare-fun b!873080 () Bool)

(declare-fun res!593351 () Bool)

(assert (=> b!873080 (=> (not res!593351) (not e!486188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873080 (= res!593351 (validKeyInArray!0 k0!854))))

(declare-fun b!873081 () Bool)

(declare-fun res!593355 () Bool)

(assert (=> b!873081 (=> (not res!593355) (not e!486188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873081 (= res!593355 (validMask!0 mask!1196))))

(declare-fun b!873078 () Bool)

(declare-fun res!593352 () Bool)

(assert (=> b!873078 (=> (not res!593352) (not e!486188))))

(declare-datatypes ((List!17295 0))(
  ( (Nil!17292) (Cons!17291 (h!18422 (_ BitVec 64)) (t!24325 List!17295)) )
))
(declare-fun arrayNoDuplicates!0 (array!50633 (_ BitVec 32) List!17295) Bool)

(assert (=> b!873078 (= res!593352 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17292))))

(declare-fun res!593354 () Bool)

(assert (=> start!74218 (=> (not res!593354) (not e!486188))))

(assert (=> start!74218 (= res!593354 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24788 _keys!868))))))

(assert (=> start!74218 e!486188))

(assert (=> start!74218 true))

(declare-fun array_inv!19268 (array!50633) Bool)

(assert (=> start!74218 (array_inv!19268 _keys!868)))

(declare-fun array_inv!19269 (array!50631) Bool)

(assert (=> start!74218 (and (array_inv!19269 _values!688) e!486190)))

(assert (= (and start!74218 res!593354) b!873081))

(assert (= (and b!873081 res!593355) b!873072))

(assert (= (and b!873072 res!593353) b!873076))

(assert (= (and b!873076 res!593349) b!873078))

(assert (= (and b!873078 res!593352) b!873075))

(assert (= (and b!873075 res!593350) b!873080))

(assert (= (and b!873080 res!593351) b!873073))

(assert (= (and b!873077 condMapEmpty!27491) mapIsEmpty!27491))

(assert (= (and b!873077 (not condMapEmpty!27491)) mapNonEmpty!27491))

(get-info :version)

(assert (= (and mapNonEmpty!27491 ((_ is ValueCellFull!8189) mapValue!27491)) b!873074))

(assert (= (and b!873077 ((_ is ValueCellFull!8189) mapDefault!27491)) b!873079))

(assert (= start!74218 b!873077))

(declare-fun m!813107 () Bool)

(assert (=> b!873073 m!813107))

(declare-fun m!813109 () Bool)

(assert (=> start!74218 m!813109))

(declare-fun m!813111 () Bool)

(assert (=> start!74218 m!813111))

(declare-fun m!813113 () Bool)

(assert (=> b!873078 m!813113))

(declare-fun m!813115 () Bool)

(assert (=> b!873076 m!813115))

(declare-fun m!813117 () Bool)

(assert (=> b!873081 m!813117))

(declare-fun m!813119 () Bool)

(assert (=> mapNonEmpty!27491 m!813119))

(declare-fun m!813121 () Bool)

(assert (=> b!873080 m!813121))

(check-sat (not start!74218) (not b!873078) tp_is_empty!17257 (not b!873081) (not mapNonEmpty!27491) (not b!873076) (not b!873080))
(check-sat)
