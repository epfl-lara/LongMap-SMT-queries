; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112124 () Bool)

(assert start!112124)

(declare-fun res!881137 () Bool)

(declare-fun e!757094 () Bool)

(assert (=> start!112124 (=> (not res!881137) (not e!757094))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112124 (= res!881137 (validMask!0 mask!1998))))

(assert (=> start!112124 e!757094))

(assert (=> start!112124 true))

(declare-datatypes ((V!53675 0))(
  ( (V!53676 (val!18289 Int)) )
))
(declare-datatypes ((ValueCell!17316 0))(
  ( (ValueCellFull!17316 (v!20926 V!53675)) (EmptyCell!17316) )
))
(declare-datatypes ((array!89758 0))(
  ( (array!89759 (arr!43345 (Array (_ BitVec 32) ValueCell!17316)) (size!43895 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89758)

(declare-fun e!757093 () Bool)

(declare-fun array_inv!32713 (array!89758) Bool)

(assert (=> start!112124 (and (array_inv!32713 _values!1320) e!757093)))

(declare-datatypes ((array!89760 0))(
  ( (array!89761 (arr!43346 (Array (_ BitVec 32) (_ BitVec 64))) (size!43896 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89760)

(declare-fun array_inv!32714 (array!89760) Bool)

(assert (=> start!112124 (array_inv!32714 _keys!1590)))

(declare-fun b!1327973 () Bool)

(declare-fun res!881138 () Bool)

(assert (=> b!1327973 (=> (not res!881138) (not e!757094))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327973 (= res!881138 (and (= (size!43895 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43896 _keys!1590) (size!43895 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56317 () Bool)

(declare-fun mapRes!56317 () Bool)

(declare-fun tp!107224 () Bool)

(declare-fun e!757092 () Bool)

(assert (=> mapNonEmpty!56317 (= mapRes!56317 (and tp!107224 e!757092))))

(declare-fun mapRest!56317 () (Array (_ BitVec 32) ValueCell!17316))

(declare-fun mapKey!56317 () (_ BitVec 32))

(declare-fun mapValue!56317 () ValueCell!17316)

(assert (=> mapNonEmpty!56317 (= (arr!43345 _values!1320) (store mapRest!56317 mapKey!56317 mapValue!56317))))

(declare-fun mapIsEmpty!56317 () Bool)

(assert (=> mapIsEmpty!56317 mapRes!56317))

(declare-fun b!1327974 () Bool)

(assert (=> b!1327974 (= e!757094 false)))

(declare-fun lt!590785 () Bool)

(declare-datatypes ((List!30704 0))(
  ( (Nil!30701) (Cons!30700 (h!31909 (_ BitVec 64)) (t!44710 List!30704)) )
))
(declare-fun arrayNoDuplicates!0 (array!89760 (_ BitVec 32) List!30704) Bool)

(assert (=> b!1327974 (= lt!590785 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30701))))

(declare-fun b!1327975 () Bool)

(declare-fun tp_is_empty!36429 () Bool)

(assert (=> b!1327975 (= e!757092 tp_is_empty!36429)))

(declare-fun b!1327976 () Bool)

(declare-fun e!757095 () Bool)

(assert (=> b!1327976 (= e!757095 tp_is_empty!36429)))

(declare-fun b!1327977 () Bool)

(assert (=> b!1327977 (= e!757093 (and e!757095 mapRes!56317))))

(declare-fun condMapEmpty!56317 () Bool)

(declare-fun mapDefault!56317 () ValueCell!17316)

(assert (=> b!1327977 (= condMapEmpty!56317 (= (arr!43345 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17316)) mapDefault!56317)))))

(declare-fun b!1327978 () Bool)

(declare-fun res!881139 () Bool)

(assert (=> b!1327978 (=> (not res!881139) (not e!757094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89760 (_ BitVec 32)) Bool)

(assert (=> b!1327978 (= res!881139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112124 res!881137) b!1327973))

(assert (= (and b!1327973 res!881138) b!1327978))

(assert (= (and b!1327978 res!881139) b!1327974))

(assert (= (and b!1327977 condMapEmpty!56317) mapIsEmpty!56317))

(assert (= (and b!1327977 (not condMapEmpty!56317)) mapNonEmpty!56317))

(get-info :version)

(assert (= (and mapNonEmpty!56317 ((_ is ValueCellFull!17316) mapValue!56317)) b!1327975))

(assert (= (and b!1327977 ((_ is ValueCellFull!17316) mapDefault!56317)) b!1327976))

(assert (= start!112124 b!1327977))

(declare-fun m!1217109 () Bool)

(assert (=> start!112124 m!1217109))

(declare-fun m!1217111 () Bool)

(assert (=> start!112124 m!1217111))

(declare-fun m!1217113 () Bool)

(assert (=> start!112124 m!1217113))

(declare-fun m!1217115 () Bool)

(assert (=> mapNonEmpty!56317 m!1217115))

(declare-fun m!1217117 () Bool)

(assert (=> b!1327974 m!1217117))

(declare-fun m!1217119 () Bool)

(assert (=> b!1327978 m!1217119))

(check-sat (not mapNonEmpty!56317) tp_is_empty!36429 (not start!112124) (not b!1327974) (not b!1327978))
(check-sat)
