; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74308 () Bool)

(assert start!74308)

(declare-fun mapIsEmpty!27371 () Bool)

(declare-fun mapRes!27371 () Bool)

(assert (=> mapIsEmpty!27371 mapRes!27371))

(declare-fun b!873076 () Bool)

(declare-fun e!486230 () Bool)

(assert (=> b!873076 (= e!486230 false)))

(declare-fun lt!395945 () Bool)

(declare-datatypes ((array!50553 0))(
  ( (array!50554 (arr!24302 (Array (_ BitVec 32) (_ BitVec 64))) (size!24743 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50553)

(declare-datatypes ((List!17208 0))(
  ( (Nil!17205) (Cons!17204 (h!18341 (_ BitVec 64)) (t!24237 List!17208)) )
))
(declare-fun arrayNoDuplicates!0 (array!50553 (_ BitVec 32) List!17208) Bool)

(assert (=> b!873076 (= lt!395945 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17205))))

(declare-fun mapNonEmpty!27371 () Bool)

(declare-fun tp!52571 () Bool)

(declare-fun e!486231 () Bool)

(assert (=> mapNonEmpty!27371 (= mapRes!27371 (and tp!52571 e!486231))))

(declare-fun mapKey!27371 () (_ BitVec 32))

(declare-datatypes ((V!27953 0))(
  ( (V!27954 (val!8637 Int)) )
))
(declare-datatypes ((ValueCell!8150 0))(
  ( (ValueCellFull!8150 (v!11062 V!27953)) (EmptyCell!8150) )
))
(declare-fun mapValue!27371 () ValueCell!8150)

(declare-datatypes ((array!50555 0))(
  ( (array!50556 (arr!24303 (Array (_ BitVec 32) ValueCell!8150)) (size!24744 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50555)

(declare-fun mapRest!27371 () (Array (_ BitVec 32) ValueCell!8150))

(assert (=> mapNonEmpty!27371 (= (arr!24303 _values!688) (store mapRest!27371 mapKey!27371 mapValue!27371))))

(declare-fun res!593146 () Bool)

(assert (=> start!74308 (=> (not res!593146) (not e!486230))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74308 (= res!593146 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24743 _keys!868))))))

(assert (=> start!74308 e!486230))

(assert (=> start!74308 true))

(declare-fun array_inv!19232 (array!50553) Bool)

(assert (=> start!74308 (array_inv!19232 _keys!868)))

(declare-fun e!486229 () Bool)

(declare-fun array_inv!19233 (array!50555) Bool)

(assert (=> start!74308 (and (array_inv!19233 _values!688) e!486229)))

(declare-fun b!873077 () Bool)

(declare-fun res!593147 () Bool)

(assert (=> b!873077 (=> (not res!593147) (not e!486230))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50553 (_ BitVec 32)) Bool)

(assert (=> b!873077 (= res!593147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873078 () Bool)

(declare-fun e!486228 () Bool)

(declare-fun tp_is_empty!17179 () Bool)

(assert (=> b!873078 (= e!486228 tp_is_empty!17179)))

(declare-fun b!873079 () Bool)

(declare-fun res!593148 () Bool)

(assert (=> b!873079 (=> (not res!593148) (not e!486230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873079 (= res!593148 (validMask!0 mask!1196))))

(declare-fun b!873080 () Bool)

(assert (=> b!873080 (= e!486229 (and e!486228 mapRes!27371))))

(declare-fun condMapEmpty!27371 () Bool)

(declare-fun mapDefault!27371 () ValueCell!8150)

(assert (=> b!873080 (= condMapEmpty!27371 (= (arr!24303 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8150)) mapDefault!27371)))))

(declare-fun b!873081 () Bool)

(declare-fun res!593149 () Bool)

(assert (=> b!873081 (=> (not res!593149) (not e!486230))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873081 (= res!593149 (and (= (size!24744 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24743 _keys!868) (size!24744 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873082 () Bool)

(assert (=> b!873082 (= e!486231 tp_is_empty!17179)))

(assert (= (and start!74308 res!593146) b!873079))

(assert (= (and b!873079 res!593148) b!873081))

(assert (= (and b!873081 res!593149) b!873077))

(assert (= (and b!873077 res!593147) b!873076))

(assert (= (and b!873080 condMapEmpty!27371) mapIsEmpty!27371))

(assert (= (and b!873080 (not condMapEmpty!27371)) mapNonEmpty!27371))

(get-info :version)

(assert (= (and mapNonEmpty!27371 ((_ is ValueCellFull!8150) mapValue!27371)) b!873082))

(assert (= (and b!873080 ((_ is ValueCellFull!8150) mapDefault!27371)) b!873078))

(assert (= start!74308 b!873080))

(declare-fun m!814397 () Bool)

(assert (=> b!873076 m!814397))

(declare-fun m!814399 () Bool)

(assert (=> b!873077 m!814399))

(declare-fun m!814401 () Bool)

(assert (=> start!74308 m!814401))

(declare-fun m!814403 () Bool)

(assert (=> start!74308 m!814403))

(declare-fun m!814405 () Bool)

(assert (=> mapNonEmpty!27371 m!814405))

(declare-fun m!814407 () Bool)

(assert (=> b!873079 m!814407))

(check-sat (not mapNonEmpty!27371) (not start!74308) tp_is_empty!17179 (not b!873079) (not b!873076) (not b!873077))
(check-sat)
