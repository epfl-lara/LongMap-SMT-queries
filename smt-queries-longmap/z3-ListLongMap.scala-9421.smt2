; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112136 () Bool)

(assert start!112136)

(declare-fun b!1328081 () Bool)

(declare-fun e!757184 () Bool)

(declare-fun tp_is_empty!36441 () Bool)

(assert (=> b!1328081 (= e!757184 tp_is_empty!36441)))

(declare-fun b!1328082 () Bool)

(declare-fun e!757185 () Bool)

(assert (=> b!1328082 (= e!757185 false)))

(declare-fun lt!590803 () Bool)

(declare-datatypes ((array!89782 0))(
  ( (array!89783 (arr!43357 (Array (_ BitVec 32) (_ BitVec 64))) (size!43907 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89782)

(declare-datatypes ((List!30710 0))(
  ( (Nil!30707) (Cons!30706 (h!31915 (_ BitVec 64)) (t!44716 List!30710)) )
))
(declare-fun arrayNoDuplicates!0 (array!89782 (_ BitVec 32) List!30710) Bool)

(assert (=> b!1328082 (= lt!590803 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30707))))

(declare-fun b!1328083 () Bool)

(declare-fun res!881192 () Bool)

(assert (=> b!1328083 (=> (not res!881192) (not e!757185))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89782 (_ BitVec 32)) Bool)

(assert (=> b!1328083 (= res!881192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328084 () Bool)

(declare-fun e!757182 () Bool)

(declare-fun e!757186 () Bool)

(declare-fun mapRes!56335 () Bool)

(assert (=> b!1328084 (= e!757182 (and e!757186 mapRes!56335))))

(declare-fun condMapEmpty!56335 () Bool)

(declare-datatypes ((V!53691 0))(
  ( (V!53692 (val!18295 Int)) )
))
(declare-datatypes ((ValueCell!17322 0))(
  ( (ValueCellFull!17322 (v!20932 V!53691)) (EmptyCell!17322) )
))
(declare-datatypes ((array!89784 0))(
  ( (array!89785 (arr!43358 (Array (_ BitVec 32) ValueCell!17322)) (size!43908 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89784)

(declare-fun mapDefault!56335 () ValueCell!17322)

(assert (=> b!1328084 (= condMapEmpty!56335 (= (arr!43358 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17322)) mapDefault!56335)))))

(declare-fun b!1328085 () Bool)

(declare-fun res!881193 () Bool)

(assert (=> b!1328085 (=> (not res!881193) (not e!757185))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328085 (= res!881193 (and (= (size!43908 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43907 _keys!1590) (size!43908 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56335 () Bool)

(assert (=> mapIsEmpty!56335 mapRes!56335))

(declare-fun mapNonEmpty!56335 () Bool)

(declare-fun tp!107242 () Bool)

(assert (=> mapNonEmpty!56335 (= mapRes!56335 (and tp!107242 e!757184))))

(declare-fun mapRest!56335 () (Array (_ BitVec 32) ValueCell!17322))

(declare-fun mapValue!56335 () ValueCell!17322)

(declare-fun mapKey!56335 () (_ BitVec 32))

(assert (=> mapNonEmpty!56335 (= (arr!43358 _values!1320) (store mapRest!56335 mapKey!56335 mapValue!56335))))

(declare-fun res!881191 () Bool)

(assert (=> start!112136 (=> (not res!881191) (not e!757185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112136 (= res!881191 (validMask!0 mask!1998))))

(assert (=> start!112136 e!757185))

(assert (=> start!112136 true))

(declare-fun array_inv!32719 (array!89784) Bool)

(assert (=> start!112136 (and (array_inv!32719 _values!1320) e!757182)))

(declare-fun array_inv!32720 (array!89782) Bool)

(assert (=> start!112136 (array_inv!32720 _keys!1590)))

(declare-fun b!1328086 () Bool)

(assert (=> b!1328086 (= e!757186 tp_is_empty!36441)))

(assert (= (and start!112136 res!881191) b!1328085))

(assert (= (and b!1328085 res!881193) b!1328083))

(assert (= (and b!1328083 res!881192) b!1328082))

(assert (= (and b!1328084 condMapEmpty!56335) mapIsEmpty!56335))

(assert (= (and b!1328084 (not condMapEmpty!56335)) mapNonEmpty!56335))

(get-info :version)

(assert (= (and mapNonEmpty!56335 ((_ is ValueCellFull!17322) mapValue!56335)) b!1328081))

(assert (= (and b!1328084 ((_ is ValueCellFull!17322) mapDefault!56335)) b!1328086))

(assert (= start!112136 b!1328084))

(declare-fun m!1217181 () Bool)

(assert (=> b!1328082 m!1217181))

(declare-fun m!1217183 () Bool)

(assert (=> b!1328083 m!1217183))

(declare-fun m!1217185 () Bool)

(assert (=> mapNonEmpty!56335 m!1217185))

(declare-fun m!1217187 () Bool)

(assert (=> start!112136 m!1217187))

(declare-fun m!1217189 () Bool)

(assert (=> start!112136 m!1217189))

(declare-fun m!1217191 () Bool)

(assert (=> start!112136 m!1217191))

(check-sat (not b!1328083) (not start!112136) (not b!1328082) tp_is_empty!36441 (not mapNonEmpty!56335))
(check-sat)
