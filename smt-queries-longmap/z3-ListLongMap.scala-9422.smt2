; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112140 () Bool)

(assert start!112140)

(declare-fun b!1328049 () Bool)

(declare-fun res!881183 () Bool)

(declare-fun e!757183 () Bool)

(assert (=> b!1328049 (=> (not res!881183) (not e!757183))))

(declare-datatypes ((array!89723 0))(
  ( (array!89724 (arr!43328 (Array (_ BitVec 32) (_ BitVec 64))) (size!43880 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89723)

(declare-datatypes ((List!30763 0))(
  ( (Nil!30760) (Cons!30759 (h!31968 (_ BitVec 64)) (t!44761 List!30763)) )
))
(declare-fun arrayNoDuplicates!0 (array!89723 (_ BitVec 32) List!30763) Bool)

(assert (=> b!1328049 (= res!881183 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30760))))

(declare-fun b!1328050 () Bool)

(declare-fun e!757179 () Bool)

(declare-fun tp_is_empty!36445 () Bool)

(assert (=> b!1328050 (= e!757179 tp_is_empty!36445)))

(declare-fun b!1328051 () Bool)

(declare-fun res!881184 () Bool)

(assert (=> b!1328051 (=> (not res!881184) (not e!757183))))

(declare-datatypes ((V!53697 0))(
  ( (V!53698 (val!18297 Int)) )
))
(declare-datatypes ((ValueCell!17324 0))(
  ( (ValueCellFull!17324 (v!20933 V!53697)) (EmptyCell!17324) )
))
(declare-datatypes ((array!89725 0))(
  ( (array!89726 (arr!43329 (Array (_ BitVec 32) ValueCell!17324)) (size!43881 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89725)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328051 (= res!881184 (and (= (size!43881 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43880 _keys!1590) (size!43881 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328052 () Bool)

(declare-fun e!757180 () Bool)

(declare-fun mapRes!56341 () Bool)

(assert (=> b!1328052 (= e!757180 (and e!757179 mapRes!56341))))

(declare-fun condMapEmpty!56341 () Bool)

(declare-fun mapDefault!56341 () ValueCell!17324)

(assert (=> b!1328052 (= condMapEmpty!56341 (= (arr!43329 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17324)) mapDefault!56341)))))

(declare-fun mapNonEmpty!56341 () Bool)

(declare-fun tp!107249 () Bool)

(declare-fun e!757182 () Bool)

(assert (=> mapNonEmpty!56341 (= mapRes!56341 (and tp!107249 e!757182))))

(declare-fun mapKey!56341 () (_ BitVec 32))

(declare-fun mapValue!56341 () ValueCell!17324)

(declare-fun mapRest!56341 () (Array (_ BitVec 32) ValueCell!17324))

(assert (=> mapNonEmpty!56341 (= (arr!43329 _values!1320) (store mapRest!56341 mapKey!56341 mapValue!56341))))

(declare-fun b!1328053 () Bool)

(declare-fun res!881185 () Bool)

(assert (=> b!1328053 (=> (not res!881185) (not e!757183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89723 (_ BitVec 32)) Bool)

(assert (=> b!1328053 (= res!881185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328054 () Bool)

(assert (=> b!1328054 (= e!757182 tp_is_empty!36445)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun b!1328055 () Bool)

(assert (=> b!1328055 (= e!757183 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43880 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!1980 (size!43880 _keys!1590))))))

(declare-fun mapIsEmpty!56341 () Bool)

(assert (=> mapIsEmpty!56341 mapRes!56341))

(declare-fun res!881182 () Bool)

(assert (=> start!112140 (=> (not res!881182) (not e!757183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112140 (= res!881182 (validMask!0 mask!1998))))

(assert (=> start!112140 e!757183))

(assert (=> start!112140 true))

(declare-fun array_inv!32869 (array!89725) Bool)

(assert (=> start!112140 (and (array_inv!32869 _values!1320) e!757180)))

(declare-fun array_inv!32870 (array!89723) Bool)

(assert (=> start!112140 (array_inv!32870 _keys!1590)))

(assert (= (and start!112140 res!881182) b!1328051))

(assert (= (and b!1328051 res!881184) b!1328053))

(assert (= (and b!1328053 res!881185) b!1328049))

(assert (= (and b!1328049 res!881183) b!1328055))

(assert (= (and b!1328052 condMapEmpty!56341) mapIsEmpty!56341))

(assert (= (and b!1328052 (not condMapEmpty!56341)) mapNonEmpty!56341))

(get-info :version)

(assert (= (and mapNonEmpty!56341 ((_ is ValueCellFull!17324) mapValue!56341)) b!1328054))

(assert (= (and b!1328052 ((_ is ValueCellFull!17324) mapDefault!56341)) b!1328050))

(assert (= start!112140 b!1328052))

(declare-fun m!1216689 () Bool)

(assert (=> b!1328049 m!1216689))

(declare-fun m!1216691 () Bool)

(assert (=> mapNonEmpty!56341 m!1216691))

(declare-fun m!1216693 () Bool)

(assert (=> b!1328053 m!1216693))

(declare-fun m!1216695 () Bool)

(assert (=> start!112140 m!1216695))

(declare-fun m!1216697 () Bool)

(assert (=> start!112140 m!1216697))

(declare-fun m!1216699 () Bool)

(assert (=> start!112140 m!1216699))

(check-sat tp_is_empty!36445 (not b!1328053) (not b!1328049) (not start!112140) (not mapNonEmpty!56341))
(check-sat)
