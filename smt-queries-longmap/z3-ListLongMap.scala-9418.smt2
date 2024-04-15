; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112116 () Bool)

(assert start!112116)

(declare-fun b!1327831 () Bool)

(declare-fun res!881073 () Bool)

(declare-fun e!757003 () Bool)

(assert (=> b!1327831 (=> (not res!881073) (not e!757003))))

(declare-datatypes ((V!53665 0))(
  ( (V!53666 (val!18285 Int)) )
))
(declare-datatypes ((ValueCell!17312 0))(
  ( (ValueCellFull!17312 (v!20921 V!53665)) (EmptyCell!17312) )
))
(declare-datatypes ((array!89679 0))(
  ( (array!89680 (arr!43306 (Array (_ BitVec 32) ValueCell!17312)) (size!43858 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89679)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89681 0))(
  ( (array!89682 (arr!43307 (Array (_ BitVec 32) (_ BitVec 64))) (size!43859 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89681)

(assert (=> b!1327831 (= res!881073 (and (= (size!43858 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43859 _keys!1590) (size!43858 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327832 () Bool)

(declare-fun e!757002 () Bool)

(declare-fun tp_is_empty!36421 () Bool)

(assert (=> b!1327832 (= e!757002 tp_is_empty!36421)))

(declare-fun b!1327833 () Bool)

(declare-fun e!757000 () Bool)

(declare-fun e!756999 () Bool)

(declare-fun mapRes!56305 () Bool)

(assert (=> b!1327833 (= e!757000 (and e!756999 mapRes!56305))))

(declare-fun condMapEmpty!56305 () Bool)

(declare-fun mapDefault!56305 () ValueCell!17312)

(assert (=> b!1327833 (= condMapEmpty!56305 (= (arr!43306 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17312)) mapDefault!56305)))))

(declare-fun b!1327834 () Bool)

(assert (=> b!1327834 (= e!757003 false)))

(declare-fun lt!590587 () Bool)

(declare-datatypes ((List!30757 0))(
  ( (Nil!30754) (Cons!30753 (h!31962 (_ BitVec 64)) (t!44755 List!30757)) )
))
(declare-fun arrayNoDuplicates!0 (array!89681 (_ BitVec 32) List!30757) Bool)

(assert (=> b!1327834 (= lt!590587 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30754))))

(declare-fun b!1327835 () Bool)

(declare-fun res!881072 () Bool)

(assert (=> b!1327835 (=> (not res!881072) (not e!757003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89681 (_ BitVec 32)) Bool)

(assert (=> b!1327835 (= res!881072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56305 () Bool)

(declare-fun tp!107213 () Bool)

(assert (=> mapNonEmpty!56305 (= mapRes!56305 (and tp!107213 e!757002))))

(declare-fun mapRest!56305 () (Array (_ BitVec 32) ValueCell!17312))

(declare-fun mapValue!56305 () ValueCell!17312)

(declare-fun mapKey!56305 () (_ BitVec 32))

(assert (=> mapNonEmpty!56305 (= (arr!43306 _values!1320) (store mapRest!56305 mapKey!56305 mapValue!56305))))

(declare-fun res!881074 () Bool)

(assert (=> start!112116 (=> (not res!881074) (not e!757003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112116 (= res!881074 (validMask!0 mask!1998))))

(assert (=> start!112116 e!757003))

(assert (=> start!112116 true))

(declare-fun array_inv!32853 (array!89679) Bool)

(assert (=> start!112116 (and (array_inv!32853 _values!1320) e!757000)))

(declare-fun array_inv!32854 (array!89681) Bool)

(assert (=> start!112116 (array_inv!32854 _keys!1590)))

(declare-fun b!1327836 () Bool)

(assert (=> b!1327836 (= e!756999 tp_is_empty!36421)))

(declare-fun mapIsEmpty!56305 () Bool)

(assert (=> mapIsEmpty!56305 mapRes!56305))

(assert (= (and start!112116 res!881074) b!1327831))

(assert (= (and b!1327831 res!881073) b!1327835))

(assert (= (and b!1327835 res!881072) b!1327834))

(assert (= (and b!1327833 condMapEmpty!56305) mapIsEmpty!56305))

(assert (= (and b!1327833 (not condMapEmpty!56305)) mapNonEmpty!56305))

(get-info :version)

(assert (= (and mapNonEmpty!56305 ((_ is ValueCellFull!17312) mapValue!56305)) b!1327832))

(assert (= (and b!1327833 ((_ is ValueCellFull!17312) mapDefault!56305)) b!1327836))

(assert (= start!112116 b!1327833))

(declare-fun m!1216545 () Bool)

(assert (=> b!1327834 m!1216545))

(declare-fun m!1216547 () Bool)

(assert (=> b!1327835 m!1216547))

(declare-fun m!1216549 () Bool)

(assert (=> mapNonEmpty!56305 m!1216549))

(declare-fun m!1216551 () Bool)

(assert (=> start!112116 m!1216551))

(declare-fun m!1216553 () Bool)

(assert (=> start!112116 m!1216553))

(declare-fun m!1216555 () Bool)

(assert (=> start!112116 m!1216555))

(check-sat (not mapNonEmpty!56305) (not start!112116) tp_is_empty!36421 (not b!1327835) (not b!1327834))
(check-sat)
