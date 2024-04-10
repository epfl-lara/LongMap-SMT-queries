; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84348 () Bool)

(assert start!84348)

(declare-fun res!660088 () Bool)

(declare-fun e!556345 () Bool)

(assert (=> start!84348 (=> (not res!660088) (not e!556345))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84348 (= res!660088 (validMask!0 mask!1948))))

(assert (=> start!84348 e!556345))

(assert (=> start!84348 true))

(declare-datatypes ((V!35851 0))(
  ( (V!35852 (val!11626 Int)) )
))
(declare-datatypes ((ValueCell!11094 0))(
  ( (ValueCellFull!11094 (v!14188 V!35851)) (EmptyCell!11094) )
))
(declare-datatypes ((array!62263 0))(
  ( (array!62264 (arr!29989 (Array (_ BitVec 32) ValueCell!11094)) (size!30468 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62263)

(declare-fun e!556344 () Bool)

(declare-fun array_inv!23177 (array!62263) Bool)

(assert (=> start!84348 (and (array_inv!23177 _values!1278) e!556344)))

(declare-datatypes ((array!62265 0))(
  ( (array!62266 (arr!29990 (Array (_ BitVec 32) (_ BitVec 64))) (size!30469 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62265)

(declare-fun array_inv!23178 (array!62265) Bool)

(assert (=> start!84348 (array_inv!23178 _keys!1544)))

(declare-fun b!986632 () Bool)

(assert (=> b!986632 (= e!556345 false)))

(declare-fun lt!437522 () Bool)

(declare-datatypes ((List!20747 0))(
  ( (Nil!20744) (Cons!20743 (h!21905 (_ BitVec 64)) (t!29646 List!20747)) )
))
(declare-fun arrayNoDuplicates!0 (array!62265 (_ BitVec 32) List!20747) Bool)

(assert (=> b!986632 (= lt!437522 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20744))))

(declare-fun b!986633 () Bool)

(declare-fun e!556347 () Bool)

(declare-fun tp_is_empty!23151 () Bool)

(assert (=> b!986633 (= e!556347 tp_is_empty!23151)))

(declare-fun b!986634 () Bool)

(declare-fun mapRes!36755 () Bool)

(assert (=> b!986634 (= e!556344 (and e!556347 mapRes!36755))))

(declare-fun condMapEmpty!36755 () Bool)

(declare-fun mapDefault!36755 () ValueCell!11094)

(assert (=> b!986634 (= condMapEmpty!36755 (= (arr!29989 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11094)) mapDefault!36755)))))

(declare-fun b!986635 () Bool)

(declare-fun e!556343 () Bool)

(assert (=> b!986635 (= e!556343 tp_is_empty!23151)))

(declare-fun mapNonEmpty!36755 () Bool)

(declare-fun tp!69610 () Bool)

(assert (=> mapNonEmpty!36755 (= mapRes!36755 (and tp!69610 e!556343))))

(declare-fun mapValue!36755 () ValueCell!11094)

(declare-fun mapRest!36755 () (Array (_ BitVec 32) ValueCell!11094))

(declare-fun mapKey!36755 () (_ BitVec 32))

(assert (=> mapNonEmpty!36755 (= (arr!29989 _values!1278) (store mapRest!36755 mapKey!36755 mapValue!36755))))

(declare-fun mapIsEmpty!36755 () Bool)

(assert (=> mapIsEmpty!36755 mapRes!36755))

(declare-fun b!986636 () Bool)

(declare-fun res!660089 () Bool)

(assert (=> b!986636 (=> (not res!660089) (not e!556345))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986636 (= res!660089 (and (= (size!30468 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30469 _keys!1544) (size!30468 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986637 () Bool)

(declare-fun res!660087 () Bool)

(assert (=> b!986637 (=> (not res!660087) (not e!556345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62265 (_ BitVec 32)) Bool)

(assert (=> b!986637 (= res!660087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84348 res!660088) b!986636))

(assert (= (and b!986636 res!660089) b!986637))

(assert (= (and b!986637 res!660087) b!986632))

(assert (= (and b!986634 condMapEmpty!36755) mapIsEmpty!36755))

(assert (= (and b!986634 (not condMapEmpty!36755)) mapNonEmpty!36755))

(get-info :version)

(assert (= (and mapNonEmpty!36755 ((_ is ValueCellFull!11094) mapValue!36755)) b!986635))

(assert (= (and b!986634 ((_ is ValueCellFull!11094) mapDefault!36755)) b!986633))

(assert (= start!84348 b!986634))

(declare-fun m!913399 () Bool)

(assert (=> start!84348 m!913399))

(declare-fun m!913401 () Bool)

(assert (=> start!84348 m!913401))

(declare-fun m!913403 () Bool)

(assert (=> start!84348 m!913403))

(declare-fun m!913405 () Bool)

(assert (=> b!986632 m!913405))

(declare-fun m!913407 () Bool)

(assert (=> mapNonEmpty!36755 m!913407))

(declare-fun m!913409 () Bool)

(assert (=> b!986637 m!913409))

(check-sat (not start!84348) (not b!986637) (not mapNonEmpty!36755) tp_is_empty!23151 (not b!986632))
(check-sat)
