; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112994 () Bool)

(assert start!112994)

(declare-fun mapNonEmpty!57274 () Bool)

(declare-fun mapRes!57274 () Bool)

(declare-fun tp!108974 () Bool)

(declare-fun e!762785 () Bool)

(assert (=> mapNonEmpty!57274 (= mapRes!57274 (and tp!108974 e!762785))))

(declare-datatypes ((V!54497 0))(
  ( (V!54498 (val!18597 Int)) )
))
(declare-datatypes ((ValueCell!17624 0))(
  ( (ValueCellFull!17624 (v!21244 V!54497)) (EmptyCell!17624) )
))
(declare-fun mapRest!57274 () (Array (_ BitVec 32) ValueCell!17624))

(declare-fun mapValue!57274 () ValueCell!17624)

(declare-fun mapKey!57274 () (_ BitVec 32))

(declare-datatypes ((array!90895 0))(
  ( (array!90896 (arr!43904 (Array (_ BitVec 32) ValueCell!17624)) (size!44456 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90895)

(assert (=> mapNonEmpty!57274 (= (arr!43904 _values!1303) (store mapRest!57274 mapKey!57274 mapValue!57274))))

(declare-fun b!1339249 () Bool)

(declare-fun e!762782 () Bool)

(assert (=> b!1339249 (= e!762782 false)))

(declare-fun lt!593685 () Bool)

(declare-datatypes ((array!90897 0))(
  ( (array!90898 (arr!43905 (Array (_ BitVec 32) (_ BitVec 64))) (size!44457 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90897)

(declare-datatypes ((List!31149 0))(
  ( (Nil!31146) (Cons!31145 (h!32354 (_ BitVec 64)) (t!45473 List!31149)) )
))
(declare-fun arrayNoDuplicates!0 (array!90897 (_ BitVec 32) List!31149) Bool)

(assert (=> b!1339249 (= lt!593685 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31146))))

(declare-fun b!1339250 () Bool)

(declare-fun tp_is_empty!37045 () Bool)

(assert (=> b!1339250 (= e!762785 tp_is_empty!37045)))

(declare-fun mapIsEmpty!57274 () Bool)

(assert (=> mapIsEmpty!57274 mapRes!57274))

(declare-fun b!1339251 () Bool)

(declare-fun e!762784 () Bool)

(assert (=> b!1339251 (= e!762784 tp_is_empty!37045)))

(declare-fun res!888468 () Bool)

(assert (=> start!112994 (=> (not res!888468) (not e!762782))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112994 (= res!888468 (validMask!0 mask!1977))))

(assert (=> start!112994 e!762782))

(assert (=> start!112994 true))

(declare-fun e!762783 () Bool)

(declare-fun array_inv!33297 (array!90895) Bool)

(assert (=> start!112994 (and (array_inv!33297 _values!1303) e!762783)))

(declare-fun array_inv!33298 (array!90897) Bool)

(assert (=> start!112994 (array_inv!33298 _keys!1571)))

(declare-fun b!1339252 () Bool)

(declare-fun res!888467 () Bool)

(assert (=> b!1339252 (=> (not res!888467) (not e!762782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90897 (_ BitVec 32)) Bool)

(assert (=> b!1339252 (= res!888467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339253 () Bool)

(declare-fun res!888469 () Bool)

(assert (=> b!1339253 (=> (not res!888469) (not e!762782))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339253 (= res!888469 (and (= (size!44456 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44457 _keys!1571) (size!44456 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339254 () Bool)

(assert (=> b!1339254 (= e!762783 (and e!762784 mapRes!57274))))

(declare-fun condMapEmpty!57274 () Bool)

(declare-fun mapDefault!57274 () ValueCell!17624)

(assert (=> b!1339254 (= condMapEmpty!57274 (= (arr!43904 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17624)) mapDefault!57274)))))

(assert (= (and start!112994 res!888468) b!1339253))

(assert (= (and b!1339253 res!888469) b!1339252))

(assert (= (and b!1339252 res!888467) b!1339249))

(assert (= (and b!1339254 condMapEmpty!57274) mapIsEmpty!57274))

(assert (= (and b!1339254 (not condMapEmpty!57274)) mapNonEmpty!57274))

(get-info :version)

(assert (= (and mapNonEmpty!57274 ((_ is ValueCellFull!17624) mapValue!57274)) b!1339250))

(assert (= (and b!1339254 ((_ is ValueCellFull!17624) mapDefault!57274)) b!1339251))

(assert (= start!112994 b!1339254))

(declare-fun m!1226905 () Bool)

(assert (=> mapNonEmpty!57274 m!1226905))

(declare-fun m!1226907 () Bool)

(assert (=> b!1339249 m!1226907))

(declare-fun m!1226909 () Bool)

(assert (=> start!112994 m!1226909))

(declare-fun m!1226911 () Bool)

(assert (=> start!112994 m!1226911))

(declare-fun m!1226913 () Bool)

(assert (=> start!112994 m!1226913))

(declare-fun m!1226915 () Bool)

(assert (=> b!1339252 m!1226915))

(check-sat (not mapNonEmpty!57274) (not b!1339252) (not b!1339249) (not start!112994) tp_is_empty!37045)
(check-sat)
