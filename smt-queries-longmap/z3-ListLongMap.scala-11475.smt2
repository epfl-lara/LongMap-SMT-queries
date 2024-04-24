; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134060 () Bool)

(assert start!134060)

(declare-fun b!1565124 () Bool)

(declare-fun e!872328 () Bool)

(declare-fun e!872330 () Bool)

(declare-fun mapRes!59472 () Bool)

(assert (=> b!1565124 (= e!872328 (and e!872330 mapRes!59472))))

(declare-fun condMapEmpty!59472 () Bool)

(declare-datatypes ((V!59849 0))(
  ( (V!59850 (val!19449 Int)) )
))
(declare-datatypes ((ValueCell!18335 0))(
  ( (ValueCellFull!18335 (v!22193 V!59849)) (EmptyCell!18335) )
))
(declare-datatypes ((array!104288 0))(
  ( (array!104289 (arr!50329 (Array (_ BitVec 32) ValueCell!18335)) (size!50880 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104288)

(declare-fun mapDefault!59472 () ValueCell!18335)

(assert (=> b!1565124 (= condMapEmpty!59472 (= (arr!50329 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18335)) mapDefault!59472)))))

(declare-fun b!1565125 () Bool)

(declare-fun e!872332 () Bool)

(declare-fun tp_is_empty!38731 () Bool)

(assert (=> b!1565125 (= e!872332 tp_is_empty!38731)))

(declare-fun b!1565126 () Bool)

(declare-fun res!1069256 () Bool)

(declare-fun e!872329 () Bool)

(assert (=> b!1565126 (=> (not res!1069256) (not e!872329))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104290 0))(
  ( (array!104291 (arr!50330 (Array (_ BitVec 32) (_ BitVec 64))) (size!50881 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104290)

(assert (=> b!1565126 (= res!1069256 (and (= (size!50880 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50881 _keys!637) (size!50880 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565127 () Bool)

(assert (=> b!1565127 (= e!872329 false)))

(declare-fun lt!672674 () Bool)

(declare-datatypes ((List!36527 0))(
  ( (Nil!36524) (Cons!36523 (h!37987 (_ BitVec 64)) (t!51366 List!36527)) )
))
(declare-fun arrayNoDuplicates!0 (array!104290 (_ BitVec 32) List!36527) Bool)

(assert (=> b!1565127 (= lt!672674 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36524))))

(declare-fun mapNonEmpty!59472 () Bool)

(declare-fun tp!113307 () Bool)

(assert (=> mapNonEmpty!59472 (= mapRes!59472 (and tp!113307 e!872332))))

(declare-fun mapRest!59472 () (Array (_ BitVec 32) ValueCell!18335))

(declare-fun mapKey!59472 () (_ BitVec 32))

(declare-fun mapValue!59472 () ValueCell!18335)

(assert (=> mapNonEmpty!59472 (= (arr!50329 _values!487) (store mapRest!59472 mapKey!59472 mapValue!59472))))

(declare-fun b!1565128 () Bool)

(declare-fun res!1069255 () Bool)

(assert (=> b!1565128 (=> (not res!1069255) (not e!872329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104290 (_ BitVec 32)) Bool)

(assert (=> b!1565128 (= res!1069255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565129 () Bool)

(assert (=> b!1565129 (= e!872330 tp_is_empty!38731)))

(declare-fun res!1069254 () Bool)

(assert (=> start!134060 (=> (not res!1069254) (not e!872329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134060 (= res!1069254 (validMask!0 mask!947))))

(assert (=> start!134060 e!872329))

(assert (=> start!134060 true))

(declare-fun array_inv!39367 (array!104288) Bool)

(assert (=> start!134060 (and (array_inv!39367 _values!487) e!872328)))

(declare-fun array_inv!39368 (array!104290) Bool)

(assert (=> start!134060 (array_inv!39368 _keys!637)))

(declare-fun mapIsEmpty!59472 () Bool)

(assert (=> mapIsEmpty!59472 mapRes!59472))

(assert (= (and start!134060 res!1069254) b!1565126))

(assert (= (and b!1565126 res!1069256) b!1565128))

(assert (= (and b!1565128 res!1069255) b!1565127))

(assert (= (and b!1565124 condMapEmpty!59472) mapIsEmpty!59472))

(assert (= (and b!1565124 (not condMapEmpty!59472)) mapNonEmpty!59472))

(get-info :version)

(assert (= (and mapNonEmpty!59472 ((_ is ValueCellFull!18335) mapValue!59472)) b!1565125))

(assert (= (and b!1565124 ((_ is ValueCellFull!18335) mapDefault!59472)) b!1565129))

(assert (= start!134060 b!1565124))

(declare-fun m!1440711 () Bool)

(assert (=> b!1565127 m!1440711))

(declare-fun m!1440713 () Bool)

(assert (=> mapNonEmpty!59472 m!1440713))

(declare-fun m!1440715 () Bool)

(assert (=> b!1565128 m!1440715))

(declare-fun m!1440717 () Bool)

(assert (=> start!134060 m!1440717))

(declare-fun m!1440719 () Bool)

(assert (=> start!134060 m!1440719))

(declare-fun m!1440721 () Bool)

(assert (=> start!134060 m!1440721))

(check-sat (not b!1565128) (not mapNonEmpty!59472) (not b!1565127) tp_is_empty!38731 (not start!134060))
(check-sat)
