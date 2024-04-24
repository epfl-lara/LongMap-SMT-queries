; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84094 () Bool)

(assert start!84094)

(declare-fun res!656761 () Bool)

(declare-fun e!553436 () Bool)

(assert (=> start!84094 (=> (not res!656761) (not e!553436))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84094 (= res!656761 (validMask!0 mask!1948))))

(assert (=> start!84094 e!553436))

(assert (=> start!84094 true))

(declare-datatypes ((V!35289 0))(
  ( (V!35290 (val!11415 Int)) )
))
(declare-datatypes ((ValueCell!10883 0))(
  ( (ValueCellFull!10883 (v!13974 V!35289)) (EmptyCell!10883) )
))
(declare-datatypes ((array!61496 0))(
  ( (array!61497 (arr!29601 (Array (_ BitVec 32) ValueCell!10883)) (size!30081 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61496)

(declare-fun e!553437 () Bool)

(declare-fun array_inv!22913 (array!61496) Bool)

(assert (=> start!84094 (and (array_inv!22913 _values!1278) e!553437)))

(declare-datatypes ((array!61498 0))(
  ( (array!61499 (arr!29602 (Array (_ BitVec 32) (_ BitVec 64))) (size!30082 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61498)

(declare-fun array_inv!22914 (array!61498) Bool)

(assert (=> start!84094 (array_inv!22914 _keys!1544)))

(declare-fun b!981748 () Bool)

(declare-fun e!553440 () Bool)

(declare-fun mapRes!36122 () Bool)

(assert (=> b!981748 (= e!553437 (and e!553440 mapRes!36122))))

(declare-fun condMapEmpty!36122 () Bool)

(declare-fun mapDefault!36122 () ValueCell!10883)

(assert (=> b!981748 (= condMapEmpty!36122 (= (arr!29601 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10883)) mapDefault!36122)))))

(declare-fun mapIsEmpty!36122 () Bool)

(assert (=> mapIsEmpty!36122 mapRes!36122))

(declare-fun b!981749 () Bool)

(declare-fun tp_is_empty!22729 () Bool)

(assert (=> b!981749 (= e!553440 tp_is_empty!22729)))

(declare-fun b!981750 () Bool)

(declare-fun res!656759 () Bool)

(assert (=> b!981750 (=> (not res!656759) (not e!553436))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981750 (= res!656759 (and (= (size!30081 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30082 _keys!1544) (size!30081 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981751 () Bool)

(declare-fun res!656760 () Bool)

(assert (=> b!981751 (=> (not res!656760) (not e!553436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61498 (_ BitVec 32)) Bool)

(assert (=> b!981751 (= res!656760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981752 () Bool)

(declare-fun e!553438 () Bool)

(assert (=> b!981752 (= e!553438 tp_is_empty!22729)))

(declare-fun b!981753 () Bool)

(assert (=> b!981753 (= e!553436 false)))

(declare-fun lt!435972 () Bool)

(declare-datatypes ((List!20515 0))(
  ( (Nil!20512) (Cons!20511 (h!21679 (_ BitVec 64)) (t!29190 List!20515)) )
))
(declare-fun arrayNoDuplicates!0 (array!61498 (_ BitVec 32) List!20515) Bool)

(assert (=> b!981753 (= lt!435972 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20512))))

(declare-fun mapNonEmpty!36122 () Bool)

(declare-fun tp!68636 () Bool)

(assert (=> mapNonEmpty!36122 (= mapRes!36122 (and tp!68636 e!553438))))

(declare-fun mapKey!36122 () (_ BitVec 32))

(declare-fun mapRest!36122 () (Array (_ BitVec 32) ValueCell!10883))

(declare-fun mapValue!36122 () ValueCell!10883)

(assert (=> mapNonEmpty!36122 (= (arr!29601 _values!1278) (store mapRest!36122 mapKey!36122 mapValue!36122))))

(assert (= (and start!84094 res!656761) b!981750))

(assert (= (and b!981750 res!656759) b!981751))

(assert (= (and b!981751 res!656760) b!981753))

(assert (= (and b!981748 condMapEmpty!36122) mapIsEmpty!36122))

(assert (= (and b!981748 (not condMapEmpty!36122)) mapNonEmpty!36122))

(get-info :version)

(assert (= (and mapNonEmpty!36122 ((_ is ValueCellFull!10883) mapValue!36122)) b!981752))

(assert (= (and b!981748 ((_ is ValueCellFull!10883) mapDefault!36122)) b!981749))

(assert (= start!84094 b!981748))

(declare-fun m!909713 () Bool)

(assert (=> start!84094 m!909713))

(declare-fun m!909715 () Bool)

(assert (=> start!84094 m!909715))

(declare-fun m!909717 () Bool)

(assert (=> start!84094 m!909717))

(declare-fun m!909719 () Bool)

(assert (=> b!981751 m!909719))

(declare-fun m!909721 () Bool)

(assert (=> b!981753 m!909721))

(declare-fun m!909723 () Bool)

(assert (=> mapNonEmpty!36122 m!909723))

(check-sat (not b!981751) (not b!981753) tp_is_empty!22729 (not start!84094) (not mapNonEmpty!36122))
(check-sat)
