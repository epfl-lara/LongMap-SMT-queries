; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112122 () Bool)

(assert start!112122)

(declare-fun b!1327885 () Bool)

(declare-fun res!881100 () Bool)

(declare-fun e!757045 () Bool)

(assert (=> b!1327885 (=> (not res!881100) (not e!757045))))

(declare-datatypes ((array!89689 0))(
  ( (array!89690 (arr!43311 (Array (_ BitVec 32) (_ BitVec 64))) (size!43863 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89689)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89689 (_ BitVec 32)) Bool)

(assert (=> b!1327885 (= res!881100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56314 () Bool)

(declare-fun mapRes!56314 () Bool)

(declare-fun tp!107222 () Bool)

(declare-fun e!757047 () Bool)

(assert (=> mapNonEmpty!56314 (= mapRes!56314 (and tp!107222 e!757047))))

(declare-datatypes ((V!53673 0))(
  ( (V!53674 (val!18288 Int)) )
))
(declare-datatypes ((ValueCell!17315 0))(
  ( (ValueCellFull!17315 (v!20924 V!53673)) (EmptyCell!17315) )
))
(declare-datatypes ((array!89691 0))(
  ( (array!89692 (arr!43312 (Array (_ BitVec 32) ValueCell!17315)) (size!43864 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89691)

(declare-fun mapRest!56314 () (Array (_ BitVec 32) ValueCell!17315))

(declare-fun mapValue!56314 () ValueCell!17315)

(declare-fun mapKey!56314 () (_ BitVec 32))

(assert (=> mapNonEmpty!56314 (= (arr!43312 _values!1320) (store mapRest!56314 mapKey!56314 mapValue!56314))))

(declare-fun b!1327886 () Bool)

(assert (=> b!1327886 (= e!757045 false)))

(declare-fun lt!590596 () Bool)

(declare-datatypes ((List!30758 0))(
  ( (Nil!30755) (Cons!30754 (h!31963 (_ BitVec 64)) (t!44756 List!30758)) )
))
(declare-fun arrayNoDuplicates!0 (array!89689 (_ BitVec 32) List!30758) Bool)

(assert (=> b!1327886 (= lt!590596 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30755))))

(declare-fun res!881099 () Bool)

(assert (=> start!112122 (=> (not res!881099) (not e!757045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112122 (= res!881099 (validMask!0 mask!1998))))

(assert (=> start!112122 e!757045))

(assert (=> start!112122 true))

(declare-fun e!757048 () Bool)

(declare-fun array_inv!32855 (array!89691) Bool)

(assert (=> start!112122 (and (array_inv!32855 _values!1320) e!757048)))

(declare-fun array_inv!32856 (array!89689) Bool)

(assert (=> start!112122 (array_inv!32856 _keys!1590)))

(declare-fun mapIsEmpty!56314 () Bool)

(assert (=> mapIsEmpty!56314 mapRes!56314))

(declare-fun b!1327887 () Bool)

(declare-fun e!757044 () Bool)

(declare-fun tp_is_empty!36427 () Bool)

(assert (=> b!1327887 (= e!757044 tp_is_empty!36427)))

(declare-fun b!1327888 () Bool)

(declare-fun res!881101 () Bool)

(assert (=> b!1327888 (=> (not res!881101) (not e!757045))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327888 (= res!881101 (and (= (size!43864 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43863 _keys!1590) (size!43864 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327889 () Bool)

(assert (=> b!1327889 (= e!757047 tp_is_empty!36427)))

(declare-fun b!1327890 () Bool)

(assert (=> b!1327890 (= e!757048 (and e!757044 mapRes!56314))))

(declare-fun condMapEmpty!56314 () Bool)

(declare-fun mapDefault!56314 () ValueCell!17315)

(assert (=> b!1327890 (= condMapEmpty!56314 (= (arr!43312 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17315)) mapDefault!56314)))))

(assert (= (and start!112122 res!881099) b!1327888))

(assert (= (and b!1327888 res!881101) b!1327885))

(assert (= (and b!1327885 res!881100) b!1327886))

(assert (= (and b!1327890 condMapEmpty!56314) mapIsEmpty!56314))

(assert (= (and b!1327890 (not condMapEmpty!56314)) mapNonEmpty!56314))

(get-info :version)

(assert (= (and mapNonEmpty!56314 ((_ is ValueCellFull!17315) mapValue!56314)) b!1327889))

(assert (= (and b!1327890 ((_ is ValueCellFull!17315) mapDefault!56314)) b!1327887))

(assert (= start!112122 b!1327890))

(declare-fun m!1216581 () Bool)

(assert (=> b!1327885 m!1216581))

(declare-fun m!1216583 () Bool)

(assert (=> mapNonEmpty!56314 m!1216583))

(declare-fun m!1216585 () Bool)

(assert (=> b!1327886 m!1216585))

(declare-fun m!1216587 () Bool)

(assert (=> start!112122 m!1216587))

(declare-fun m!1216589 () Bool)

(assert (=> start!112122 m!1216589))

(declare-fun m!1216591 () Bool)

(assert (=> start!112122 m!1216591))

(check-sat (not mapNonEmpty!56314) (not b!1327885) tp_is_empty!36427 (not b!1327886) (not start!112122))
(check-sat)
