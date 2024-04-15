; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112134 () Bool)

(assert start!112134)

(declare-fun b!1327993 () Bool)

(declare-fun e!757138 () Bool)

(declare-fun e!757137 () Bool)

(declare-fun mapRes!56332 () Bool)

(assert (=> b!1327993 (= e!757138 (and e!757137 mapRes!56332))))

(declare-fun condMapEmpty!56332 () Bool)

(declare-datatypes ((V!53689 0))(
  ( (V!53690 (val!18294 Int)) )
))
(declare-datatypes ((ValueCell!17321 0))(
  ( (ValueCellFull!17321 (v!20930 V!53689)) (EmptyCell!17321) )
))
(declare-datatypes ((array!89711 0))(
  ( (array!89712 (arr!43322 (Array (_ BitVec 32) ValueCell!17321)) (size!43874 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89711)

(declare-fun mapDefault!56332 () ValueCell!17321)

(assert (=> b!1327993 (= condMapEmpty!56332 (= (arr!43322 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17321)) mapDefault!56332)))))

(declare-fun res!881154 () Bool)

(declare-fun e!757134 () Bool)

(assert (=> start!112134 (=> (not res!881154) (not e!757134))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112134 (= res!881154 (validMask!0 mask!1998))))

(assert (=> start!112134 e!757134))

(assert (=> start!112134 true))

(declare-fun array_inv!32865 (array!89711) Bool)

(assert (=> start!112134 (and (array_inv!32865 _values!1320) e!757138)))

(declare-datatypes ((array!89713 0))(
  ( (array!89714 (arr!43323 (Array (_ BitVec 32) (_ BitVec 64))) (size!43875 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89713)

(declare-fun array_inv!32866 (array!89713) Bool)

(assert (=> start!112134 (array_inv!32866 _keys!1590)))

(declare-fun b!1327994 () Bool)

(declare-fun res!881153 () Bool)

(assert (=> b!1327994 (=> (not res!881153) (not e!757134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89713 (_ BitVec 32)) Bool)

(assert (=> b!1327994 (= res!881153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56332 () Bool)

(assert (=> mapIsEmpty!56332 mapRes!56332))

(declare-fun b!1327995 () Bool)

(assert (=> b!1327995 (= e!757134 false)))

(declare-fun lt!590614 () Bool)

(declare-datatypes ((List!30761 0))(
  ( (Nil!30758) (Cons!30757 (h!31966 (_ BitVec 64)) (t!44759 List!30761)) )
))
(declare-fun arrayNoDuplicates!0 (array!89713 (_ BitVec 32) List!30761) Bool)

(assert (=> b!1327995 (= lt!590614 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30758))))

(declare-fun b!1327996 () Bool)

(declare-fun res!881155 () Bool)

(assert (=> b!1327996 (=> (not res!881155) (not e!757134))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327996 (= res!881155 (and (= (size!43874 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43875 _keys!1590) (size!43874 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327997 () Bool)

(declare-fun tp_is_empty!36439 () Bool)

(assert (=> b!1327997 (= e!757137 tp_is_empty!36439)))

(declare-fun mapNonEmpty!56332 () Bool)

(declare-fun tp!107240 () Bool)

(declare-fun e!757136 () Bool)

(assert (=> mapNonEmpty!56332 (= mapRes!56332 (and tp!107240 e!757136))))

(declare-fun mapRest!56332 () (Array (_ BitVec 32) ValueCell!17321))

(declare-fun mapKey!56332 () (_ BitVec 32))

(declare-fun mapValue!56332 () ValueCell!17321)

(assert (=> mapNonEmpty!56332 (= (arr!43322 _values!1320) (store mapRest!56332 mapKey!56332 mapValue!56332))))

(declare-fun b!1327998 () Bool)

(assert (=> b!1327998 (= e!757136 tp_is_empty!36439)))

(assert (= (and start!112134 res!881154) b!1327996))

(assert (= (and b!1327996 res!881155) b!1327994))

(assert (= (and b!1327994 res!881153) b!1327995))

(assert (= (and b!1327993 condMapEmpty!56332) mapIsEmpty!56332))

(assert (= (and b!1327993 (not condMapEmpty!56332)) mapNonEmpty!56332))

(get-info :version)

(assert (= (and mapNonEmpty!56332 ((_ is ValueCellFull!17321) mapValue!56332)) b!1327998))

(assert (= (and b!1327993 ((_ is ValueCellFull!17321) mapDefault!56332)) b!1327997))

(assert (= start!112134 b!1327993))

(declare-fun m!1216653 () Bool)

(assert (=> start!112134 m!1216653))

(declare-fun m!1216655 () Bool)

(assert (=> start!112134 m!1216655))

(declare-fun m!1216657 () Bool)

(assert (=> start!112134 m!1216657))

(declare-fun m!1216659 () Bool)

(assert (=> b!1327994 m!1216659))

(declare-fun m!1216661 () Bool)

(assert (=> b!1327995 m!1216661))

(declare-fun m!1216663 () Bool)

(assert (=> mapNonEmpty!56332 m!1216663))

(check-sat (not b!1327995) (not mapNonEmpty!56332) (not start!112134) tp_is_empty!36439 (not b!1327994))
(check-sat)
