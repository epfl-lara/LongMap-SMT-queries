; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40446 () Bool)

(assert start!40446)

(declare-fun b!445269 () Bool)

(declare-fun res!264211 () Bool)

(declare-fun e!261748 () Bool)

(assert (=> b!445269 (=> (not res!264211) (not e!261748))))

(declare-datatypes ((array!27504 0))(
  ( (array!27505 (arr!13199 (Array (_ BitVec 32) (_ BitVec 64))) (size!13551 (_ BitVec 32))) )
))
(declare-fun lt!203643 () array!27504)

(declare-datatypes ((List!7805 0))(
  ( (Nil!7802) (Cons!7801 (h!8657 (_ BitVec 64)) (t!13555 List!7805)) )
))
(declare-fun arrayNoDuplicates!0 (array!27504 (_ BitVec 32) List!7805) Bool)

(assert (=> b!445269 (= res!264211 (arrayNoDuplicates!0 lt!203643 #b00000000000000000000000000000000 Nil!7802))))

(declare-fun b!445270 () Bool)

(declare-fun res!264215 () Bool)

(declare-fun e!261750 () Bool)

(assert (=> b!445270 (=> (not res!264215) (not e!261750))))

(declare-fun _keys!709 () array!27504)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27504 (_ BitVec 32)) Bool)

(assert (=> b!445270 (= res!264215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19395 () Bool)

(declare-fun mapRes!19395 () Bool)

(declare-fun tp!37377 () Bool)

(declare-fun e!261746 () Bool)

(assert (=> mapNonEmpty!19395 (= mapRes!19395 (and tp!37377 e!261746))))

(declare-datatypes ((V!16899 0))(
  ( (V!16900 (val!5967 Int)) )
))
(declare-datatypes ((ValueCell!5579 0))(
  ( (ValueCellFull!5579 (v!8219 V!16899)) (EmptyCell!5579) )
))
(declare-datatypes ((array!27506 0))(
  ( (array!27507 (arr!13200 (Array (_ BitVec 32) ValueCell!5579)) (size!13552 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27506)

(declare-fun mapKey!19395 () (_ BitVec 32))

(declare-fun mapRest!19395 () (Array (_ BitVec 32) ValueCell!5579))

(declare-fun mapValue!19395 () ValueCell!5579)

(assert (=> mapNonEmpty!19395 (= (arr!13200 _values!549) (store mapRest!19395 mapKey!19395 mapValue!19395))))

(declare-fun b!445271 () Bool)

(declare-fun res!264214 () Bool)

(assert (=> b!445271 (=> (not res!264214) (not e!261750))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445271 (= res!264214 (validKeyInArray!0 k0!794))))

(declare-fun b!445272 () Bool)

(declare-fun res!264217 () Bool)

(assert (=> b!445272 (=> (not res!264217) (not e!261750))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445272 (= res!264217 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13551 _keys!709))))))

(declare-fun b!445273 () Bool)

(declare-fun e!261747 () Bool)

(declare-fun tp_is_empty!11845 () Bool)

(assert (=> b!445273 (= e!261747 tp_is_empty!11845)))

(declare-fun b!445275 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!445275 (= e!261748 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13551 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsge (bvsub (size!13551 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (bvsub (size!13551 _keys!709) from!863))))))

(declare-fun b!445276 () Bool)

(declare-fun res!264220 () Bool)

(assert (=> b!445276 (=> (not res!264220) (not e!261750))))

(assert (=> b!445276 (= res!264220 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7802))))

(declare-fun b!445277 () Bool)

(declare-fun res!264218 () Bool)

(assert (=> b!445277 (=> (not res!264218) (not e!261750))))

(assert (=> b!445277 (= res!264218 (or (= (select (arr!13199 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13199 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445278 () Bool)

(declare-fun e!261745 () Bool)

(assert (=> b!445278 (= e!261745 (and e!261747 mapRes!19395))))

(declare-fun condMapEmpty!19395 () Bool)

(declare-fun mapDefault!19395 () ValueCell!5579)

(assert (=> b!445278 (= condMapEmpty!19395 (= (arr!13200 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5579)) mapDefault!19395)))))

(declare-fun b!445279 () Bool)

(assert (=> b!445279 (= e!261750 e!261748)))

(declare-fun res!264213 () Bool)

(assert (=> b!445279 (=> (not res!264213) (not e!261748))))

(assert (=> b!445279 (= res!264213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203643 mask!1025))))

(assert (=> b!445279 (= lt!203643 (array!27505 (store (arr!13199 _keys!709) i!563 k0!794) (size!13551 _keys!709)))))

(declare-fun b!445280 () Bool)

(declare-fun res!264210 () Bool)

(assert (=> b!445280 (=> (not res!264210) (not e!261750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445280 (= res!264210 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19395 () Bool)

(assert (=> mapIsEmpty!19395 mapRes!19395))

(declare-fun b!445281 () Bool)

(declare-fun res!264219 () Bool)

(assert (=> b!445281 (=> (not res!264219) (not e!261750))))

(declare-fun arrayContainsKey!0 (array!27504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445281 (= res!264219 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445282 () Bool)

(declare-fun res!264216 () Bool)

(assert (=> b!445282 (=> (not res!264216) (not e!261750))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!445282 (= res!264216 (and (= (size!13552 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13551 _keys!709) (size!13552 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!264212 () Bool)

(assert (=> start!40446 (=> (not res!264212) (not e!261750))))

(assert (=> start!40446 (= res!264212 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13551 _keys!709))))))

(assert (=> start!40446 e!261750))

(assert (=> start!40446 true))

(declare-fun array_inv!9648 (array!27506) Bool)

(assert (=> start!40446 (and (array_inv!9648 _values!549) e!261745)))

(declare-fun array_inv!9649 (array!27504) Bool)

(assert (=> start!40446 (array_inv!9649 _keys!709)))

(declare-fun b!445274 () Bool)

(assert (=> b!445274 (= e!261746 tp_is_empty!11845)))

(assert (= (and start!40446 res!264212) b!445280))

(assert (= (and b!445280 res!264210) b!445282))

(assert (= (and b!445282 res!264216) b!445270))

(assert (= (and b!445270 res!264215) b!445276))

(assert (= (and b!445276 res!264220) b!445272))

(assert (= (and b!445272 res!264217) b!445271))

(assert (= (and b!445271 res!264214) b!445277))

(assert (= (and b!445277 res!264218) b!445281))

(assert (= (and b!445281 res!264219) b!445279))

(assert (= (and b!445279 res!264213) b!445269))

(assert (= (and b!445269 res!264211) b!445275))

(assert (= (and b!445278 condMapEmpty!19395) mapIsEmpty!19395))

(assert (= (and b!445278 (not condMapEmpty!19395)) mapNonEmpty!19395))

(get-info :version)

(assert (= (and mapNonEmpty!19395 ((_ is ValueCellFull!5579) mapValue!19395)) b!445274))

(assert (= (and b!445278 ((_ is ValueCellFull!5579) mapDefault!19395)) b!445273))

(assert (= start!40446 b!445278))

(declare-fun m!431079 () Bool)

(assert (=> b!445280 m!431079))

(declare-fun m!431081 () Bool)

(assert (=> b!445281 m!431081))

(declare-fun m!431083 () Bool)

(assert (=> b!445269 m!431083))

(declare-fun m!431085 () Bool)

(assert (=> b!445277 m!431085))

(declare-fun m!431087 () Bool)

(assert (=> b!445279 m!431087))

(declare-fun m!431089 () Bool)

(assert (=> b!445279 m!431089))

(declare-fun m!431091 () Bool)

(assert (=> b!445270 m!431091))

(declare-fun m!431093 () Bool)

(assert (=> mapNonEmpty!19395 m!431093))

(declare-fun m!431095 () Bool)

(assert (=> b!445276 m!431095))

(declare-fun m!431097 () Bool)

(assert (=> start!40446 m!431097))

(declare-fun m!431099 () Bool)

(assert (=> start!40446 m!431099))

(declare-fun m!431101 () Bool)

(assert (=> b!445271 m!431101))

(check-sat (not b!445270) (not b!445276) (not b!445279) (not start!40446) (not b!445269) tp_is_empty!11845 (not b!445271) (not b!445280) (not b!445281) (not mapNonEmpty!19395))
(check-sat)
