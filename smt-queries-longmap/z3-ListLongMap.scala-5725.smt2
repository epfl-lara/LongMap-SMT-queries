; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74314 () Bool)

(assert start!74314)

(declare-fun b!873139 () Bool)

(declare-fun res!593185 () Bool)

(declare-fun e!486274 () Bool)

(assert (=> b!873139 (=> (not res!593185) (not e!486274))))

(declare-datatypes ((array!50563 0))(
  ( (array!50564 (arr!24307 (Array (_ BitVec 32) (_ BitVec 64))) (size!24748 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50563)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50563 (_ BitVec 32)) Bool)

(assert (=> b!873139 (= res!593185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27380 () Bool)

(declare-fun mapRes!27380 () Bool)

(declare-fun tp!52580 () Bool)

(declare-fun e!486277 () Bool)

(assert (=> mapNonEmpty!27380 (= mapRes!27380 (and tp!52580 e!486277))))

(declare-datatypes ((V!27961 0))(
  ( (V!27962 (val!8640 Int)) )
))
(declare-datatypes ((ValueCell!8153 0))(
  ( (ValueCellFull!8153 (v!11065 V!27961)) (EmptyCell!8153) )
))
(declare-fun mapValue!27380 () ValueCell!8153)

(declare-fun mapKey!27380 () (_ BitVec 32))

(declare-fun mapRest!27380 () (Array (_ BitVec 32) ValueCell!8153))

(declare-datatypes ((array!50565 0))(
  ( (array!50566 (arr!24308 (Array (_ BitVec 32) ValueCell!8153)) (size!24749 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50565)

(assert (=> mapNonEmpty!27380 (= (arr!24308 _values!688) (store mapRest!27380 mapKey!27380 mapValue!27380))))

(declare-fun res!593184 () Bool)

(assert (=> start!74314 (=> (not res!593184) (not e!486274))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74314 (= res!593184 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24748 _keys!868))))))

(assert (=> start!74314 e!486274))

(assert (=> start!74314 true))

(declare-fun array_inv!19234 (array!50563) Bool)

(assert (=> start!74314 (array_inv!19234 _keys!868)))

(declare-fun e!486276 () Bool)

(declare-fun array_inv!19235 (array!50565) Bool)

(assert (=> start!74314 (and (array_inv!19235 _values!688) e!486276)))

(declare-fun b!873140 () Bool)

(declare-fun e!486275 () Bool)

(assert (=> b!873140 (= e!486276 (and e!486275 mapRes!27380))))

(declare-fun condMapEmpty!27380 () Bool)

(declare-fun mapDefault!27380 () ValueCell!8153)

(assert (=> b!873140 (= condMapEmpty!27380 (= (arr!24308 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8153)) mapDefault!27380)))))

(declare-fun b!873141 () Bool)

(declare-fun res!593183 () Bool)

(assert (=> b!873141 (=> (not res!593183) (not e!486274))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873141 (= res!593183 (and (= (size!24749 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24748 _keys!868) (size!24749 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873142 () Bool)

(declare-fun res!593182 () Bool)

(assert (=> b!873142 (=> (not res!593182) (not e!486274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873142 (= res!593182 (validMask!0 mask!1196))))

(declare-fun b!873143 () Bool)

(assert (=> b!873143 (= e!486274 false)))

(declare-fun lt!395954 () Bool)

(declare-datatypes ((List!17210 0))(
  ( (Nil!17207) (Cons!17206 (h!18343 (_ BitVec 64)) (t!24239 List!17210)) )
))
(declare-fun arrayNoDuplicates!0 (array!50563 (_ BitVec 32) List!17210) Bool)

(assert (=> b!873143 (= lt!395954 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17207))))

(declare-fun b!873144 () Bool)

(declare-fun tp_is_empty!17185 () Bool)

(assert (=> b!873144 (= e!486277 tp_is_empty!17185)))

(declare-fun b!873145 () Bool)

(assert (=> b!873145 (= e!486275 tp_is_empty!17185)))

(declare-fun mapIsEmpty!27380 () Bool)

(assert (=> mapIsEmpty!27380 mapRes!27380))

(assert (= (and start!74314 res!593184) b!873142))

(assert (= (and b!873142 res!593182) b!873141))

(assert (= (and b!873141 res!593183) b!873139))

(assert (= (and b!873139 res!593185) b!873143))

(assert (= (and b!873140 condMapEmpty!27380) mapIsEmpty!27380))

(assert (= (and b!873140 (not condMapEmpty!27380)) mapNonEmpty!27380))

(get-info :version)

(assert (= (and mapNonEmpty!27380 ((_ is ValueCellFull!8153) mapValue!27380)) b!873144))

(assert (= (and b!873140 ((_ is ValueCellFull!8153) mapDefault!27380)) b!873145))

(assert (= start!74314 b!873140))

(declare-fun m!814433 () Bool)

(assert (=> mapNonEmpty!27380 m!814433))

(declare-fun m!814435 () Bool)

(assert (=> b!873142 m!814435))

(declare-fun m!814437 () Bool)

(assert (=> b!873139 m!814437))

(declare-fun m!814439 () Bool)

(assert (=> start!74314 m!814439))

(declare-fun m!814441 () Bool)

(assert (=> start!74314 m!814441))

(declare-fun m!814443 () Bool)

(assert (=> b!873143 m!814443))

(check-sat (not b!873139) (not b!873142) (not start!74314) (not b!873143) tp_is_empty!17185 (not mapNonEmpty!27380))
(check-sat)
