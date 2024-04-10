; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112984 () Bool)

(assert start!112984)

(declare-fun b!1339229 () Bool)

(declare-fun res!888453 () Bool)

(declare-fun e!762743 () Bool)

(assert (=> b!1339229 (=> (not res!888453) (not e!762743))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!90930 0))(
  ( (array!90931 (arr!43921 (Array (_ BitVec 32) (_ BitVec 64))) (size!44471 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90930)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54483 0))(
  ( (V!54484 (val!18592 Int)) )
))
(declare-datatypes ((ValueCell!17619 0))(
  ( (ValueCellFull!17619 (v!21240 V!54483)) (EmptyCell!17619) )
))
(declare-datatypes ((array!90932 0))(
  ( (array!90933 (arr!43922 (Array (_ BitVec 32) ValueCell!17619)) (size!44472 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90932)

(assert (=> b!1339229 (= res!888453 (and (= (size!44472 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44471 _keys!1571) (size!44472 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57259 () Bool)

(declare-fun mapRes!57259 () Bool)

(declare-fun tp!108958 () Bool)

(declare-fun e!762742 () Bool)

(assert (=> mapNonEmpty!57259 (= mapRes!57259 (and tp!108958 e!762742))))

(declare-fun mapRest!57259 () (Array (_ BitVec 32) ValueCell!17619))

(declare-fun mapKey!57259 () (_ BitVec 32))

(declare-fun mapValue!57259 () ValueCell!17619)

(assert (=> mapNonEmpty!57259 (= (arr!43922 _values!1303) (store mapRest!57259 mapKey!57259 mapValue!57259))))

(declare-fun b!1339231 () Bool)

(declare-fun tp_is_empty!37035 () Bool)

(assert (=> b!1339231 (= e!762742 tp_is_empty!37035)))

(declare-fun b!1339232 () Bool)

(declare-fun res!888452 () Bool)

(assert (=> b!1339232 (=> (not res!888452) (not e!762743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90930 (_ BitVec 32)) Bool)

(assert (=> b!1339232 (= res!888452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339233 () Bool)

(declare-fun e!762740 () Bool)

(assert (=> b!1339233 (= e!762740 tp_is_empty!37035)))

(declare-fun mapIsEmpty!57259 () Bool)

(assert (=> mapIsEmpty!57259 mapRes!57259))

(declare-fun b!1339234 () Bool)

(declare-fun e!762741 () Bool)

(assert (=> b!1339234 (= e!762741 (and e!762740 mapRes!57259))))

(declare-fun condMapEmpty!57259 () Bool)

(declare-fun mapDefault!57259 () ValueCell!17619)

(assert (=> b!1339234 (= condMapEmpty!57259 (= (arr!43922 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17619)) mapDefault!57259)))))

(declare-fun b!1339230 () Bool)

(assert (=> b!1339230 (= e!762743 false)))

(declare-fun lt!593856 () Bool)

(declare-datatypes ((List!31102 0))(
  ( (Nil!31099) (Cons!31098 (h!32307 (_ BitVec 64)) (t!45434 List!31102)) )
))
(declare-fun arrayNoDuplicates!0 (array!90930 (_ BitVec 32) List!31102) Bool)

(assert (=> b!1339230 (= lt!593856 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31099))))

(declare-fun res!888451 () Bool)

(assert (=> start!112984 (=> (not res!888451) (not e!762743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112984 (= res!888451 (validMask!0 mask!1977))))

(assert (=> start!112984 e!762743))

(assert (=> start!112984 true))

(declare-fun array_inv!33119 (array!90932) Bool)

(assert (=> start!112984 (and (array_inv!33119 _values!1303) e!762741)))

(declare-fun array_inv!33120 (array!90930) Bool)

(assert (=> start!112984 (array_inv!33120 _keys!1571)))

(assert (= (and start!112984 res!888451) b!1339229))

(assert (= (and b!1339229 res!888453) b!1339232))

(assert (= (and b!1339232 res!888452) b!1339230))

(assert (= (and b!1339234 condMapEmpty!57259) mapIsEmpty!57259))

(assert (= (and b!1339234 (not condMapEmpty!57259)) mapNonEmpty!57259))

(get-info :version)

(assert (= (and mapNonEmpty!57259 ((_ is ValueCellFull!17619) mapValue!57259)) b!1339231))

(assert (= (and b!1339234 ((_ is ValueCellFull!17619) mapDefault!57259)) b!1339233))

(assert (= start!112984 b!1339234))

(declare-fun m!1227361 () Bool)

(assert (=> mapNonEmpty!57259 m!1227361))

(declare-fun m!1227363 () Bool)

(assert (=> b!1339232 m!1227363))

(declare-fun m!1227365 () Bool)

(assert (=> b!1339230 m!1227365))

(declare-fun m!1227367 () Bool)

(assert (=> start!112984 m!1227367))

(declare-fun m!1227369 () Bool)

(assert (=> start!112984 m!1227369))

(declare-fun m!1227371 () Bool)

(assert (=> start!112984 m!1227371))

(check-sat (not b!1339232) tp_is_empty!37035 (not b!1339230) (not mapNonEmpty!57259) (not start!112984))
(check-sat)
