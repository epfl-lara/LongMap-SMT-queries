; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84520 () Bool)

(assert start!84520)

(declare-fun b!987571 () Bool)

(declare-fun e!556956 () Bool)

(assert (=> b!987571 (= e!556956 false)))

(declare-fun lt!437889 () Bool)

(declare-datatypes ((array!62312 0))(
  ( (array!62313 (arr!30009 (Array (_ BitVec 32) (_ BitVec 64))) (size!30489 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62312)

(declare-datatypes ((List!20745 0))(
  ( (Nil!20742) (Cons!20741 (h!21909 (_ BitVec 64)) (t!29636 List!20745)) )
))
(declare-fun arrayNoDuplicates!0 (array!62312 (_ BitVec 32) List!20745) Bool)

(assert (=> b!987571 (= lt!437889 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20742))))

(declare-fun b!987572 () Bool)

(declare-fun res!660451 () Bool)

(assert (=> b!987572 (=> (not res!660451) (not e!556956))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62312 (_ BitVec 32)) Bool)

(assert (=> b!987572 (= res!660451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987573 () Bool)

(declare-fun e!556959 () Bool)

(declare-fun e!556958 () Bool)

(declare-fun mapRes!36761 () Bool)

(assert (=> b!987573 (= e!556959 (and e!556958 mapRes!36761))))

(declare-fun condMapEmpty!36761 () Bool)

(declare-datatypes ((V!35857 0))(
  ( (V!35858 (val!11628 Int)) )
))
(declare-datatypes ((ValueCell!11096 0))(
  ( (ValueCellFull!11096 (v!14187 V!35857)) (EmptyCell!11096) )
))
(declare-datatypes ((array!62314 0))(
  ( (array!62315 (arr!30010 (Array (_ BitVec 32) ValueCell!11096)) (size!30490 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62314)

(declare-fun mapDefault!36761 () ValueCell!11096)

(assert (=> b!987573 (= condMapEmpty!36761 (= (arr!30010 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11096)) mapDefault!36761)))))

(declare-fun mapIsEmpty!36761 () Bool)

(assert (=> mapIsEmpty!36761 mapRes!36761))

(declare-fun b!987574 () Bool)

(declare-fun e!556955 () Bool)

(declare-fun tp_is_empty!23155 () Bool)

(assert (=> b!987574 (= e!556955 tp_is_empty!23155)))

(declare-fun b!987575 () Bool)

(assert (=> b!987575 (= e!556958 tp_is_empty!23155)))

(declare-fun b!987576 () Bool)

(declare-fun res!660450 () Bool)

(assert (=> b!987576 (=> (not res!660450) (not e!556956))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987576 (= res!660450 (and (= (size!30490 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30489 _keys!1544) (size!30490 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36761 () Bool)

(declare-fun tp!69617 () Bool)

(assert (=> mapNonEmpty!36761 (= mapRes!36761 (and tp!69617 e!556955))))

(declare-fun mapKey!36761 () (_ BitVec 32))

(declare-fun mapRest!36761 () (Array (_ BitVec 32) ValueCell!11096))

(declare-fun mapValue!36761 () ValueCell!11096)

(assert (=> mapNonEmpty!36761 (= (arr!30010 _values!1278) (store mapRest!36761 mapKey!36761 mapValue!36761))))

(declare-fun res!660449 () Bool)

(assert (=> start!84520 (=> (not res!660449) (not e!556956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84520 (= res!660449 (validMask!0 mask!1948))))

(assert (=> start!84520 e!556956))

(assert (=> start!84520 true))

(declare-fun array_inv!23207 (array!62314) Bool)

(assert (=> start!84520 (and (array_inv!23207 _values!1278) e!556959)))

(declare-fun array_inv!23208 (array!62312) Bool)

(assert (=> start!84520 (array_inv!23208 _keys!1544)))

(assert (= (and start!84520 res!660449) b!987576))

(assert (= (and b!987576 res!660450) b!987572))

(assert (= (and b!987572 res!660451) b!987571))

(assert (= (and b!987573 condMapEmpty!36761) mapIsEmpty!36761))

(assert (= (and b!987573 (not condMapEmpty!36761)) mapNonEmpty!36761))

(get-info :version)

(assert (= (and mapNonEmpty!36761 ((_ is ValueCellFull!11096) mapValue!36761)) b!987574))

(assert (= (and b!987573 ((_ is ValueCellFull!11096) mapDefault!36761)) b!987575))

(assert (= start!84520 b!987573))

(declare-fun m!914717 () Bool)

(assert (=> b!987571 m!914717))

(declare-fun m!914719 () Bool)

(assert (=> b!987572 m!914719))

(declare-fun m!914721 () Bool)

(assert (=> mapNonEmpty!36761 m!914721))

(declare-fun m!914723 () Bool)

(assert (=> start!84520 m!914723))

(declare-fun m!914725 () Bool)

(assert (=> start!84520 m!914725))

(declare-fun m!914727 () Bool)

(assert (=> start!84520 m!914727))

(check-sat (not start!84520) (not mapNonEmpty!36761) (not b!987572) tp_is_empty!23155 (not b!987571))
(check-sat)
