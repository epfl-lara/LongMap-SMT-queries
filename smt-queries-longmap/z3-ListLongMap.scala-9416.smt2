; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112106 () Bool)

(assert start!112106)

(declare-fun b!1327811 () Bool)

(declare-fun e!756960 () Bool)

(declare-fun tp_is_empty!36411 () Bool)

(assert (=> b!1327811 (= e!756960 tp_is_empty!36411)))

(declare-fun b!1327812 () Bool)

(declare-fun e!756961 () Bool)

(assert (=> b!1327812 (= e!756961 tp_is_empty!36411)))

(declare-fun res!881056 () Bool)

(declare-fun e!756959 () Bool)

(assert (=> start!112106 (=> (not res!881056) (not e!756959))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112106 (= res!881056 (validMask!0 mask!1998))))

(assert (=> start!112106 e!756959))

(assert (=> start!112106 true))

(declare-datatypes ((V!53651 0))(
  ( (V!53652 (val!18280 Int)) )
))
(declare-datatypes ((ValueCell!17307 0))(
  ( (ValueCellFull!17307 (v!20917 V!53651)) (EmptyCell!17307) )
))
(declare-datatypes ((array!89728 0))(
  ( (array!89729 (arr!43330 (Array (_ BitVec 32) ValueCell!17307)) (size!43880 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89728)

(declare-fun e!756957 () Bool)

(declare-fun array_inv!32705 (array!89728) Bool)

(assert (=> start!112106 (and (array_inv!32705 _values!1320) e!756957)))

(declare-datatypes ((array!89730 0))(
  ( (array!89731 (arr!43331 (Array (_ BitVec 32) (_ BitVec 64))) (size!43881 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89730)

(declare-fun array_inv!32706 (array!89730) Bool)

(assert (=> start!112106 (array_inv!32706 _keys!1590)))

(declare-fun b!1327813 () Bool)

(declare-fun res!881057 () Bool)

(assert (=> b!1327813 (=> (not res!881057) (not e!756959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89730 (_ BitVec 32)) Bool)

(assert (=> b!1327813 (= res!881057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1327814 () Bool)

(declare-fun mapRes!56290 () Bool)

(assert (=> b!1327814 (= e!756957 (and e!756961 mapRes!56290))))

(declare-fun condMapEmpty!56290 () Bool)

(declare-fun mapDefault!56290 () ValueCell!17307)

(assert (=> b!1327814 (= condMapEmpty!56290 (= (arr!43330 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17307)) mapDefault!56290)))))

(declare-fun mapNonEmpty!56290 () Bool)

(declare-fun tp!107197 () Bool)

(assert (=> mapNonEmpty!56290 (= mapRes!56290 (and tp!107197 e!756960))))

(declare-fun mapRest!56290 () (Array (_ BitVec 32) ValueCell!17307))

(declare-fun mapValue!56290 () ValueCell!17307)

(declare-fun mapKey!56290 () (_ BitVec 32))

(assert (=> mapNonEmpty!56290 (= (arr!43330 _values!1320) (store mapRest!56290 mapKey!56290 mapValue!56290))))

(declare-fun b!1327815 () Bool)

(declare-fun res!881058 () Bool)

(assert (=> b!1327815 (=> (not res!881058) (not e!756959))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327815 (= res!881058 (and (= (size!43880 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43881 _keys!1590) (size!43880 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327816 () Bool)

(assert (=> b!1327816 (= e!756959 false)))

(declare-fun lt!590758 () Bool)

(declare-datatypes ((List!30699 0))(
  ( (Nil!30696) (Cons!30695 (h!31904 (_ BitVec 64)) (t!44705 List!30699)) )
))
(declare-fun arrayNoDuplicates!0 (array!89730 (_ BitVec 32) List!30699) Bool)

(assert (=> b!1327816 (= lt!590758 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30696))))

(declare-fun mapIsEmpty!56290 () Bool)

(assert (=> mapIsEmpty!56290 mapRes!56290))

(assert (= (and start!112106 res!881056) b!1327815))

(assert (= (and b!1327815 res!881058) b!1327813))

(assert (= (and b!1327813 res!881057) b!1327816))

(assert (= (and b!1327814 condMapEmpty!56290) mapIsEmpty!56290))

(assert (= (and b!1327814 (not condMapEmpty!56290)) mapNonEmpty!56290))

(get-info :version)

(assert (= (and mapNonEmpty!56290 ((_ is ValueCellFull!17307) mapValue!56290)) b!1327811))

(assert (= (and b!1327814 ((_ is ValueCellFull!17307) mapDefault!56290)) b!1327812))

(assert (= start!112106 b!1327814))

(declare-fun m!1217001 () Bool)

(assert (=> start!112106 m!1217001))

(declare-fun m!1217003 () Bool)

(assert (=> start!112106 m!1217003))

(declare-fun m!1217005 () Bool)

(assert (=> start!112106 m!1217005))

(declare-fun m!1217007 () Bool)

(assert (=> b!1327813 m!1217007))

(declare-fun m!1217009 () Bool)

(assert (=> mapNonEmpty!56290 m!1217009))

(declare-fun m!1217011 () Bool)

(assert (=> b!1327816 m!1217011))

(check-sat (not mapNonEmpty!56290) tp_is_empty!36411 (not b!1327813) (not start!112106) (not b!1327816))
(check-sat)
