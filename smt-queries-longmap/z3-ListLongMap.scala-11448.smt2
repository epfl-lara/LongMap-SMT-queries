; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133898 () Bool)

(assert start!133898)

(declare-fun b!1562976 () Bool)

(declare-fun e!871108 () Bool)

(declare-fun tp_is_empty!38569 () Bool)

(assert (=> b!1562976 (= e!871108 tp_is_empty!38569)))

(declare-fun res!1067950 () Bool)

(declare-fun e!871104 () Bool)

(assert (=> start!133898 (=> (not res!1067950) (not e!871104))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133898 (= res!1067950 (validMask!0 mask!947))))

(assert (=> start!133898 e!871104))

(assert (=> start!133898 true))

(declare-datatypes ((V!59633 0))(
  ( (V!59634 (val!19368 Int)) )
))
(declare-datatypes ((ValueCell!18254 0))(
  ( (ValueCellFull!18254 (v!22112 V!59633)) (EmptyCell!18254) )
))
(declare-datatypes ((array!103982 0))(
  ( (array!103983 (arr!50176 (Array (_ BitVec 32) ValueCell!18254)) (size!50727 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103982)

(declare-fun e!871105 () Bool)

(declare-fun array_inv!39253 (array!103982) Bool)

(assert (=> start!133898 (and (array_inv!39253 _values!487) e!871105)))

(declare-datatypes ((array!103984 0))(
  ( (array!103985 (arr!50177 (Array (_ BitVec 32) (_ BitVec 64))) (size!50728 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103984)

(declare-fun array_inv!39254 (array!103984) Bool)

(assert (=> start!133898 (array_inv!39254 _keys!637)))

(declare-fun mapNonEmpty!59229 () Bool)

(declare-fun mapRes!59229 () Bool)

(declare-fun tp!112884 () Bool)

(declare-fun e!871106 () Bool)

(assert (=> mapNonEmpty!59229 (= mapRes!59229 (and tp!112884 e!871106))))

(declare-fun mapValue!59229 () ValueCell!18254)

(declare-fun mapKey!59229 () (_ BitVec 32))

(declare-fun mapRest!59229 () (Array (_ BitVec 32) ValueCell!18254))

(assert (=> mapNonEmpty!59229 (= (arr!50176 _values!487) (store mapRest!59229 mapKey!59229 mapValue!59229))))

(declare-fun b!1562977 () Bool)

(assert (=> b!1562977 (= e!871104 false)))

(declare-fun lt!671918 () Bool)

(declare-datatypes ((List!36425 0))(
  ( (Nil!36422) (Cons!36421 (h!37885 (_ BitVec 64)) (t!51150 List!36425)) )
))
(declare-fun arrayNoDuplicates!0 (array!103984 (_ BitVec 32) List!36425) Bool)

(assert (=> b!1562977 (= lt!671918 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36422))))

(declare-fun mapIsEmpty!59229 () Bool)

(assert (=> mapIsEmpty!59229 mapRes!59229))

(declare-fun b!1562978 () Bool)

(assert (=> b!1562978 (= e!871105 (and e!871108 mapRes!59229))))

(declare-fun condMapEmpty!59229 () Bool)

(declare-fun mapDefault!59229 () ValueCell!18254)

(assert (=> b!1562978 (= condMapEmpty!59229 (= (arr!50176 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18254)) mapDefault!59229)))))

(declare-fun b!1562979 () Bool)

(declare-fun res!1067949 () Bool)

(assert (=> b!1562979 (=> (not res!1067949) (not e!871104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103984 (_ BitVec 32)) Bool)

(assert (=> b!1562979 (= res!1067949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562980 () Bool)

(declare-fun res!1067951 () Bool)

(assert (=> b!1562980 (=> (not res!1067951) (not e!871104))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562980 (= res!1067951 (and (= (size!50727 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50728 _keys!637) (size!50727 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562981 () Bool)

(assert (=> b!1562981 (= e!871106 tp_is_empty!38569)))

(assert (= (and start!133898 res!1067950) b!1562980))

(assert (= (and b!1562980 res!1067951) b!1562979))

(assert (= (and b!1562979 res!1067949) b!1562977))

(assert (= (and b!1562978 condMapEmpty!59229) mapIsEmpty!59229))

(assert (= (and b!1562978 (not condMapEmpty!59229)) mapNonEmpty!59229))

(get-info :version)

(assert (= (and mapNonEmpty!59229 ((_ is ValueCellFull!18254) mapValue!59229)) b!1562981))

(assert (= (and b!1562978 ((_ is ValueCellFull!18254) mapDefault!59229)) b!1562976))

(assert (= start!133898 b!1562978))

(declare-fun m!1438611 () Bool)

(assert (=> start!133898 m!1438611))

(declare-fun m!1438613 () Bool)

(assert (=> start!133898 m!1438613))

(declare-fun m!1438615 () Bool)

(assert (=> start!133898 m!1438615))

(declare-fun m!1438617 () Bool)

(assert (=> mapNonEmpty!59229 m!1438617))

(declare-fun m!1438619 () Bool)

(assert (=> b!1562977 m!1438619))

(declare-fun m!1438621 () Bool)

(assert (=> b!1562979 m!1438621))

(check-sat (not start!133898) (not b!1562979) (not mapNonEmpty!59229) tp_is_empty!38569 (not b!1562977))
(check-sat)
