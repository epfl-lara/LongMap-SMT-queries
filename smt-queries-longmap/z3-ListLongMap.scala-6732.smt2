; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84366 () Bool)

(assert start!84366)

(declare-fun b!986821 () Bool)

(declare-fun e!556481 () Bool)

(assert (=> b!986821 (= e!556481 false)))

(declare-fun lt!437549 () Bool)

(declare-datatypes ((array!62299 0))(
  ( (array!62300 (arr!30007 (Array (_ BitVec 32) (_ BitVec 64))) (size!30486 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62299)

(declare-datatypes ((List!20754 0))(
  ( (Nil!20751) (Cons!20750 (h!21912 (_ BitVec 64)) (t!29653 List!20754)) )
))
(declare-fun arrayNoDuplicates!0 (array!62299 (_ BitVec 32) List!20754) Bool)

(assert (=> b!986821 (= lt!437549 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20751))))

(declare-fun b!986822 () Bool)

(declare-fun e!556479 () Bool)

(declare-fun tp_is_empty!23169 () Bool)

(assert (=> b!986822 (= e!556479 tp_is_empty!23169)))

(declare-fun mapIsEmpty!36782 () Bool)

(declare-fun mapRes!36782 () Bool)

(assert (=> mapIsEmpty!36782 mapRes!36782))

(declare-fun res!660195 () Bool)

(assert (=> start!84366 (=> (not res!660195) (not e!556481))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84366 (= res!660195 (validMask!0 mask!1948))))

(assert (=> start!84366 e!556481))

(assert (=> start!84366 true))

(declare-datatypes ((V!35875 0))(
  ( (V!35876 (val!11635 Int)) )
))
(declare-datatypes ((ValueCell!11103 0))(
  ( (ValueCellFull!11103 (v!14197 V!35875)) (EmptyCell!11103) )
))
(declare-datatypes ((array!62301 0))(
  ( (array!62302 (arr!30008 (Array (_ BitVec 32) ValueCell!11103)) (size!30487 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62301)

(declare-fun e!556482 () Bool)

(declare-fun array_inv!23187 (array!62301) Bool)

(assert (=> start!84366 (and (array_inv!23187 _values!1278) e!556482)))

(declare-fun array_inv!23188 (array!62299) Bool)

(assert (=> start!84366 (array_inv!23188 _keys!1544)))

(declare-fun mapNonEmpty!36782 () Bool)

(declare-fun tp!69637 () Bool)

(assert (=> mapNonEmpty!36782 (= mapRes!36782 (and tp!69637 e!556479))))

(declare-fun mapRest!36782 () (Array (_ BitVec 32) ValueCell!11103))

(declare-fun mapValue!36782 () ValueCell!11103)

(declare-fun mapKey!36782 () (_ BitVec 32))

(assert (=> mapNonEmpty!36782 (= (arr!30008 _values!1278) (store mapRest!36782 mapKey!36782 mapValue!36782))))

(declare-fun b!986823 () Bool)

(declare-fun res!660196 () Bool)

(assert (=> b!986823 (=> (not res!660196) (not e!556481))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986823 (= res!660196 (and (= (size!30487 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30486 _keys!1544) (size!30487 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986824 () Bool)

(declare-fun e!556478 () Bool)

(assert (=> b!986824 (= e!556478 tp_is_empty!23169)))

(declare-fun b!986825 () Bool)

(assert (=> b!986825 (= e!556482 (and e!556478 mapRes!36782))))

(declare-fun condMapEmpty!36782 () Bool)

(declare-fun mapDefault!36782 () ValueCell!11103)

(assert (=> b!986825 (= condMapEmpty!36782 (= (arr!30008 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11103)) mapDefault!36782)))))

(declare-fun b!986826 () Bool)

(declare-fun res!660197 () Bool)

(assert (=> b!986826 (=> (not res!660197) (not e!556481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62299 (_ BitVec 32)) Bool)

(assert (=> b!986826 (= res!660197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84366 res!660195) b!986823))

(assert (= (and b!986823 res!660196) b!986826))

(assert (= (and b!986826 res!660197) b!986821))

(assert (= (and b!986825 condMapEmpty!36782) mapIsEmpty!36782))

(assert (= (and b!986825 (not condMapEmpty!36782)) mapNonEmpty!36782))

(get-info :version)

(assert (= (and mapNonEmpty!36782 ((_ is ValueCellFull!11103) mapValue!36782)) b!986822))

(assert (= (and b!986825 ((_ is ValueCellFull!11103) mapDefault!36782)) b!986824))

(assert (= start!84366 b!986825))

(declare-fun m!913519 () Bool)

(assert (=> b!986821 m!913519))

(declare-fun m!913521 () Bool)

(assert (=> start!84366 m!913521))

(declare-fun m!913523 () Bool)

(assert (=> start!84366 m!913523))

(declare-fun m!913525 () Bool)

(assert (=> start!84366 m!913525))

(declare-fun m!913527 () Bool)

(assert (=> mapNonEmpty!36782 m!913527))

(declare-fun m!913529 () Bool)

(assert (=> b!986826 m!913529))

(check-sat (not start!84366) (not b!986821) (not b!986826) tp_is_empty!23169 (not mapNonEmpty!36782))
(check-sat)
