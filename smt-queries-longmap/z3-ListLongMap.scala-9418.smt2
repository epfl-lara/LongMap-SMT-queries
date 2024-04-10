; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112118 () Bool)

(assert start!112118)

(declare-fun mapNonEmpty!56308 () Bool)

(declare-fun mapRes!56308 () Bool)

(declare-fun tp!107215 () Bool)

(declare-fun e!757047 () Bool)

(assert (=> mapNonEmpty!56308 (= mapRes!56308 (and tp!107215 e!757047))))

(declare-datatypes ((V!53667 0))(
  ( (V!53668 (val!18286 Int)) )
))
(declare-datatypes ((ValueCell!17313 0))(
  ( (ValueCellFull!17313 (v!20923 V!53667)) (EmptyCell!17313) )
))
(declare-datatypes ((array!89746 0))(
  ( (array!89747 (arr!43339 (Array (_ BitVec 32) ValueCell!17313)) (size!43889 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89746)

(declare-fun mapValue!56308 () ValueCell!17313)

(declare-fun mapKey!56308 () (_ BitVec 32))

(declare-fun mapRest!56308 () (Array (_ BitVec 32) ValueCell!17313))

(assert (=> mapNonEmpty!56308 (= (arr!43339 _values!1320) (store mapRest!56308 mapKey!56308 mapValue!56308))))

(declare-fun mapIsEmpty!56308 () Bool)

(assert (=> mapIsEmpty!56308 mapRes!56308))

(declare-fun res!881111 () Bool)

(declare-fun e!757048 () Bool)

(assert (=> start!112118 (=> (not res!881111) (not e!757048))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112118 (= res!881111 (validMask!0 mask!1998))))

(assert (=> start!112118 e!757048))

(assert (=> start!112118 true))

(declare-fun e!757049 () Bool)

(declare-fun array_inv!32709 (array!89746) Bool)

(assert (=> start!112118 (and (array_inv!32709 _values!1320) e!757049)))

(declare-datatypes ((array!89748 0))(
  ( (array!89749 (arr!43340 (Array (_ BitVec 32) (_ BitVec 64))) (size!43890 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89748)

(declare-fun array_inv!32710 (array!89748) Bool)

(assert (=> start!112118 (array_inv!32710 _keys!1590)))

(declare-fun b!1327919 () Bool)

(declare-fun tp_is_empty!36423 () Bool)

(assert (=> b!1327919 (= e!757047 tp_is_empty!36423)))

(declare-fun b!1327920 () Bool)

(declare-fun e!757050 () Bool)

(assert (=> b!1327920 (= e!757050 tp_is_empty!36423)))

(declare-fun b!1327921 () Bool)

(declare-fun res!881112 () Bool)

(assert (=> b!1327921 (=> (not res!881112) (not e!757048))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327921 (= res!881112 (and (= (size!43889 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43890 _keys!1590) (size!43889 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327922 () Bool)

(assert (=> b!1327922 (= e!757049 (and e!757050 mapRes!56308))))

(declare-fun condMapEmpty!56308 () Bool)

(declare-fun mapDefault!56308 () ValueCell!17313)

(assert (=> b!1327922 (= condMapEmpty!56308 (= (arr!43339 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17313)) mapDefault!56308)))))

(declare-fun b!1327923 () Bool)

(assert (=> b!1327923 (= e!757048 false)))

(declare-fun lt!590776 () Bool)

(declare-datatypes ((List!30702 0))(
  ( (Nil!30699) (Cons!30698 (h!31907 (_ BitVec 64)) (t!44708 List!30702)) )
))
(declare-fun arrayNoDuplicates!0 (array!89748 (_ BitVec 32) List!30702) Bool)

(assert (=> b!1327923 (= lt!590776 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30699))))

(declare-fun b!1327924 () Bool)

(declare-fun res!881110 () Bool)

(assert (=> b!1327924 (=> (not res!881110) (not e!757048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89748 (_ BitVec 32)) Bool)

(assert (=> b!1327924 (= res!881110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112118 res!881111) b!1327921))

(assert (= (and b!1327921 res!881112) b!1327924))

(assert (= (and b!1327924 res!881110) b!1327923))

(assert (= (and b!1327922 condMapEmpty!56308) mapIsEmpty!56308))

(assert (= (and b!1327922 (not condMapEmpty!56308)) mapNonEmpty!56308))

(get-info :version)

(assert (= (and mapNonEmpty!56308 ((_ is ValueCellFull!17313) mapValue!56308)) b!1327919))

(assert (= (and b!1327922 ((_ is ValueCellFull!17313) mapDefault!56308)) b!1327920))

(assert (= start!112118 b!1327922))

(declare-fun m!1217073 () Bool)

(assert (=> mapNonEmpty!56308 m!1217073))

(declare-fun m!1217075 () Bool)

(assert (=> start!112118 m!1217075))

(declare-fun m!1217077 () Bool)

(assert (=> start!112118 m!1217077))

(declare-fun m!1217079 () Bool)

(assert (=> start!112118 m!1217079))

(declare-fun m!1217081 () Bool)

(assert (=> b!1327923 m!1217081))

(declare-fun m!1217083 () Bool)

(assert (=> b!1327924 m!1217083))

(check-sat (not b!1327923) (not mapNonEmpty!56308) tp_is_empty!36423 (not b!1327924) (not start!112118))
(check-sat)
