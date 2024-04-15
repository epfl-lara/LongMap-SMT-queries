; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112128 () Bool)

(assert start!112128)

(declare-fun b!1327939 () Bool)

(declare-fun e!757093 () Bool)

(assert (=> b!1327939 (= e!757093 false)))

(declare-fun lt!590605 () Bool)

(declare-datatypes ((array!89699 0))(
  ( (array!89700 (arr!43316 (Array (_ BitVec 32) (_ BitVec 64))) (size!43868 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89699)

(declare-datatypes ((List!30759 0))(
  ( (Nil!30756) (Cons!30755 (h!31964 (_ BitVec 64)) (t!44757 List!30759)) )
))
(declare-fun arrayNoDuplicates!0 (array!89699 (_ BitVec 32) List!30759) Bool)

(assert (=> b!1327939 (= lt!590605 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30756))))

(declare-fun mapIsEmpty!56323 () Bool)

(declare-fun mapRes!56323 () Bool)

(assert (=> mapIsEmpty!56323 mapRes!56323))

(declare-fun b!1327940 () Bool)

(declare-fun res!881127 () Bool)

(assert (=> b!1327940 (=> (not res!881127) (not e!757093))))

(declare-datatypes ((V!53681 0))(
  ( (V!53682 (val!18291 Int)) )
))
(declare-datatypes ((ValueCell!17318 0))(
  ( (ValueCellFull!17318 (v!20927 V!53681)) (EmptyCell!17318) )
))
(declare-datatypes ((array!89701 0))(
  ( (array!89702 (arr!43317 (Array (_ BitVec 32) ValueCell!17318)) (size!43869 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89701)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327940 (= res!881127 (and (= (size!43869 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43868 _keys!1590) (size!43869 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!881128 () Bool)

(assert (=> start!112128 (=> (not res!881128) (not e!757093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112128 (= res!881128 (validMask!0 mask!1998))))

(assert (=> start!112128 e!757093))

(assert (=> start!112128 true))

(declare-fun e!757092 () Bool)

(declare-fun array_inv!32859 (array!89701) Bool)

(assert (=> start!112128 (and (array_inv!32859 _values!1320) e!757092)))

(declare-fun array_inv!32860 (array!89699) Bool)

(assert (=> start!112128 (array_inv!32860 _keys!1590)))

(declare-fun b!1327941 () Bool)

(declare-fun e!757090 () Bool)

(assert (=> b!1327941 (= e!757092 (and e!757090 mapRes!56323))))

(declare-fun condMapEmpty!56323 () Bool)

(declare-fun mapDefault!56323 () ValueCell!17318)

(assert (=> b!1327941 (= condMapEmpty!56323 (= (arr!43317 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17318)) mapDefault!56323)))))

(declare-fun b!1327942 () Bool)

(declare-fun res!881126 () Bool)

(assert (=> b!1327942 (=> (not res!881126) (not e!757093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89699 (_ BitVec 32)) Bool)

(assert (=> b!1327942 (= res!881126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56323 () Bool)

(declare-fun tp!107231 () Bool)

(declare-fun e!757091 () Bool)

(assert (=> mapNonEmpty!56323 (= mapRes!56323 (and tp!107231 e!757091))))

(declare-fun mapKey!56323 () (_ BitVec 32))

(declare-fun mapValue!56323 () ValueCell!17318)

(declare-fun mapRest!56323 () (Array (_ BitVec 32) ValueCell!17318))

(assert (=> mapNonEmpty!56323 (= (arr!43317 _values!1320) (store mapRest!56323 mapKey!56323 mapValue!56323))))

(declare-fun b!1327943 () Bool)

(declare-fun tp_is_empty!36433 () Bool)

(assert (=> b!1327943 (= e!757090 tp_is_empty!36433)))

(declare-fun b!1327944 () Bool)

(assert (=> b!1327944 (= e!757091 tp_is_empty!36433)))

(assert (= (and start!112128 res!881128) b!1327940))

(assert (= (and b!1327940 res!881127) b!1327942))

(assert (= (and b!1327942 res!881126) b!1327939))

(assert (= (and b!1327941 condMapEmpty!56323) mapIsEmpty!56323))

(assert (= (and b!1327941 (not condMapEmpty!56323)) mapNonEmpty!56323))

(get-info :version)

(assert (= (and mapNonEmpty!56323 ((_ is ValueCellFull!17318) mapValue!56323)) b!1327944))

(assert (= (and b!1327941 ((_ is ValueCellFull!17318) mapDefault!56323)) b!1327943))

(assert (= start!112128 b!1327941))

(declare-fun m!1216617 () Bool)

(assert (=> b!1327939 m!1216617))

(declare-fun m!1216619 () Bool)

(assert (=> start!112128 m!1216619))

(declare-fun m!1216621 () Bool)

(assert (=> start!112128 m!1216621))

(declare-fun m!1216623 () Bool)

(assert (=> start!112128 m!1216623))

(declare-fun m!1216625 () Bool)

(assert (=> b!1327942 m!1216625))

(declare-fun m!1216627 () Bool)

(assert (=> mapNonEmpty!56323 m!1216627))

(check-sat (not b!1327942) (not mapNonEmpty!56323) tp_is_empty!36433 (not b!1327939) (not start!112128))
(check-sat)
