; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84340 () Bool)

(assert start!84340)

(declare-fun b!986489 () Bool)

(declare-fun res!660029 () Bool)

(declare-fun e!556274 () Bool)

(assert (=> b!986489 (=> (not res!660029) (not e!556274))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62212 0))(
  ( (array!62213 (arr!29964 (Array (_ BitVec 32) (_ BitVec 64))) (size!30445 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62212)

(declare-datatypes ((V!35865 0))(
  ( (V!35866 (val!11631 Int)) )
))
(declare-datatypes ((ValueCell!11099 0))(
  ( (ValueCellFull!11099 (v!14192 V!35865)) (EmptyCell!11099) )
))
(declare-datatypes ((array!62214 0))(
  ( (array!62215 (arr!29965 (Array (_ BitVec 32) ValueCell!11099)) (size!30446 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62214)

(assert (=> b!986489 (= res!660029 (and (= (size!30446 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30445 _keys!1544) (size!30446 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986490 () Bool)

(declare-fun lt!437301 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!986490 (= e!556274 (and (or lt!437301 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!437301 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!437301)) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(assert (=> b!986490 (= lt!437301 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!986491 () Bool)

(declare-fun res!660033 () Bool)

(assert (=> b!986491 (=> (not res!660033) (not e!556274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62212 (_ BitVec 32)) Bool)

(assert (=> b!986491 (= res!660033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986492 () Bool)

(declare-fun res!660030 () Bool)

(assert (=> b!986492 (=> (not res!660030) (not e!556274))))

(assert (=> b!986492 (= res!660030 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30445 _keys!1544))))))

(declare-fun b!986493 () Bool)

(declare-fun res!660031 () Bool)

(assert (=> b!986493 (=> (not res!660031) (not e!556274))))

(declare-datatypes ((List!20785 0))(
  ( (Nil!20782) (Cons!20781 (h!21943 (_ BitVec 64)) (t!29675 List!20785)) )
))
(declare-fun arrayNoDuplicates!0 (array!62212 (_ BitVec 32) List!20785) Bool)

(assert (=> b!986493 (= res!660031 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20782))))

(declare-fun b!986494 () Bool)

(declare-fun e!556271 () Bool)

(declare-fun e!556273 () Bool)

(declare-fun mapRes!36770 () Bool)

(assert (=> b!986494 (= e!556271 (and e!556273 mapRes!36770))))

(declare-fun condMapEmpty!36770 () Bool)

(declare-fun mapDefault!36770 () ValueCell!11099)

(assert (=> b!986494 (= condMapEmpty!36770 (= (arr!29965 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11099)) mapDefault!36770)))))

(declare-fun res!660028 () Bool)

(assert (=> start!84340 (=> (not res!660028) (not e!556274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84340 (= res!660028 (validMask!0 mask!1948))))

(assert (=> start!84340 e!556274))

(assert (=> start!84340 true))

(declare-fun array_inv!23169 (array!62214) Bool)

(assert (=> start!84340 (and (array_inv!23169 _values!1278) e!556271)))

(declare-fun array_inv!23170 (array!62212) Bool)

(assert (=> start!84340 (array_inv!23170 _keys!1544)))

(declare-fun mapIsEmpty!36770 () Bool)

(assert (=> mapIsEmpty!36770 mapRes!36770))

(declare-fun b!986495 () Bool)

(declare-fun e!556270 () Bool)

(declare-fun tp_is_empty!23161 () Bool)

(assert (=> b!986495 (= e!556270 tp_is_empty!23161)))

(declare-fun b!986496 () Bool)

(assert (=> b!986496 (= e!556273 tp_is_empty!23161)))

(declare-fun b!986497 () Bool)

(declare-fun res!660032 () Bool)

(assert (=> b!986497 (=> (not res!660032) (not e!556274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986497 (= res!660032 (validKeyInArray!0 (select (arr!29964 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36770 () Bool)

(declare-fun tp!69626 () Bool)

(assert (=> mapNonEmpty!36770 (= mapRes!36770 (and tp!69626 e!556270))))

(declare-fun mapKey!36770 () (_ BitVec 32))

(declare-fun mapValue!36770 () ValueCell!11099)

(declare-fun mapRest!36770 () (Array (_ BitVec 32) ValueCell!11099))

(assert (=> mapNonEmpty!36770 (= (arr!29965 _values!1278) (store mapRest!36770 mapKey!36770 mapValue!36770))))

(assert (= (and start!84340 res!660028) b!986489))

(assert (= (and b!986489 res!660029) b!986491))

(assert (= (and b!986491 res!660033) b!986493))

(assert (= (and b!986493 res!660031) b!986492))

(assert (= (and b!986492 res!660030) b!986497))

(assert (= (and b!986497 res!660032) b!986490))

(assert (= (and b!986494 condMapEmpty!36770) mapIsEmpty!36770))

(assert (= (and b!986494 (not condMapEmpty!36770)) mapNonEmpty!36770))

(get-info :version)

(assert (= (and mapNonEmpty!36770 ((_ is ValueCellFull!11099) mapValue!36770)) b!986495))

(assert (= (and b!986494 ((_ is ValueCellFull!11099) mapDefault!36770)) b!986496))

(assert (= start!84340 b!986494))

(declare-fun m!912701 () Bool)

(assert (=> b!986497 m!912701))

(assert (=> b!986497 m!912701))

(declare-fun m!912703 () Bool)

(assert (=> b!986497 m!912703))

(declare-fun m!912705 () Bool)

(assert (=> b!986491 m!912705))

(declare-fun m!912707 () Bool)

(assert (=> b!986493 m!912707))

(declare-fun m!912709 () Bool)

(assert (=> mapNonEmpty!36770 m!912709))

(declare-fun m!912711 () Bool)

(assert (=> start!84340 m!912711))

(declare-fun m!912713 () Bool)

(assert (=> start!84340 m!912713))

(declare-fun m!912715 () Bool)

(assert (=> start!84340 m!912715))

(check-sat (not mapNonEmpty!36770) (not b!986493) (not b!986497) (not b!986491) tp_is_empty!23161 (not start!84340))
(check-sat)
