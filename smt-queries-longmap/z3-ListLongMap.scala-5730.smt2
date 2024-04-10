; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74178 () Bool)

(assert start!74178)

(declare-fun b!872572 () Bool)

(declare-fun res!593033 () Bool)

(declare-fun e!485934 () Bool)

(assert (=> b!872572 (=> (not res!593033) (not e!485934))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872572 (= res!593033 (validMask!0 mask!1196))))

(declare-fun b!872573 () Bool)

(assert (=> b!872573 (= e!485934 false)))

(declare-fun lt!395641 () Bool)

(declare-datatypes ((array!50568 0))(
  ( (array!50569 (arr!24314 (Array (_ BitVec 32) (_ BitVec 64))) (size!24754 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50568)

(declare-datatypes ((List!17268 0))(
  ( (Nil!17265) (Cons!17264 (h!18395 (_ BitVec 64)) (t!24305 List!17268)) )
))
(declare-fun arrayNoDuplicates!0 (array!50568 (_ BitVec 32) List!17268) Bool)

(assert (=> b!872573 (= lt!395641 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17265))))

(declare-fun b!872574 () Bool)

(declare-fun res!593032 () Bool)

(assert (=> b!872574 (=> (not res!593032) (not e!485934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50568 (_ BitVec 32)) Bool)

(assert (=> b!872574 (= res!593032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27428 () Bool)

(declare-fun mapRes!27428 () Bool)

(declare-fun tp!52627 () Bool)

(declare-fun e!485935 () Bool)

(assert (=> mapNonEmpty!27428 (= mapRes!27428 (and tp!52627 e!485935))))

(declare-fun mapKey!27428 () (_ BitVec 32))

(declare-datatypes ((V!28003 0))(
  ( (V!28004 (val!8656 Int)) )
))
(declare-datatypes ((ValueCell!8169 0))(
  ( (ValueCellFull!8169 (v!11081 V!28003)) (EmptyCell!8169) )
))
(declare-fun mapValue!27428 () ValueCell!8169)

(declare-datatypes ((array!50570 0))(
  ( (array!50571 (arr!24315 (Array (_ BitVec 32) ValueCell!8169)) (size!24755 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50570)

(declare-fun mapRest!27428 () (Array (_ BitVec 32) ValueCell!8169))

(assert (=> mapNonEmpty!27428 (= (arr!24315 _values!688) (store mapRest!27428 mapKey!27428 mapValue!27428))))

(declare-fun res!593030 () Bool)

(assert (=> start!74178 (=> (not res!593030) (not e!485934))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74178 (= res!593030 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24754 _keys!868))))))

(assert (=> start!74178 e!485934))

(assert (=> start!74178 true))

(declare-fun array_inv!19190 (array!50568) Bool)

(assert (=> start!74178 (array_inv!19190 _keys!868)))

(declare-fun e!485932 () Bool)

(declare-fun array_inv!19191 (array!50570) Bool)

(assert (=> start!74178 (and (array_inv!19191 _values!688) e!485932)))

(declare-fun b!872575 () Bool)

(declare-fun e!485933 () Bool)

(assert (=> b!872575 (= e!485932 (and e!485933 mapRes!27428))))

(declare-fun condMapEmpty!27428 () Bool)

(declare-fun mapDefault!27428 () ValueCell!8169)

(assert (=> b!872575 (= condMapEmpty!27428 (= (arr!24315 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8169)) mapDefault!27428)))))

(declare-fun b!872576 () Bool)

(declare-fun tp_is_empty!17217 () Bool)

(assert (=> b!872576 (= e!485933 tp_is_empty!17217)))

(declare-fun b!872577 () Bool)

(assert (=> b!872577 (= e!485935 tp_is_empty!17217)))

(declare-fun b!872578 () Bool)

(declare-fun res!593031 () Bool)

(assert (=> b!872578 (=> (not res!593031) (not e!485934))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872578 (= res!593031 (and (= (size!24755 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24754 _keys!868) (size!24755 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27428 () Bool)

(assert (=> mapIsEmpty!27428 mapRes!27428))

(assert (= (and start!74178 res!593030) b!872572))

(assert (= (and b!872572 res!593033) b!872578))

(assert (= (and b!872578 res!593031) b!872574))

(assert (= (and b!872574 res!593032) b!872573))

(assert (= (and b!872575 condMapEmpty!27428) mapIsEmpty!27428))

(assert (= (and b!872575 (not condMapEmpty!27428)) mapNonEmpty!27428))

(get-info :version)

(assert (= (and mapNonEmpty!27428 ((_ is ValueCellFull!8169) mapValue!27428)) b!872577))

(assert (= (and b!872575 ((_ is ValueCellFull!8169) mapDefault!27428)) b!872576))

(assert (= start!74178 b!872575))

(declare-fun m!813335 () Bool)

(assert (=> start!74178 m!813335))

(declare-fun m!813337 () Bool)

(assert (=> start!74178 m!813337))

(declare-fun m!813339 () Bool)

(assert (=> b!872574 m!813339))

(declare-fun m!813341 () Bool)

(assert (=> b!872573 m!813341))

(declare-fun m!813343 () Bool)

(assert (=> b!872572 m!813343))

(declare-fun m!813345 () Bool)

(assert (=> mapNonEmpty!27428 m!813345))

(check-sat (not b!872573) (not b!872574) (not b!872572) (not start!74178) tp_is_empty!17217 (not mapNonEmpty!27428))
(check-sat)
