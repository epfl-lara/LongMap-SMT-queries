; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112358 () Bool)

(assert start!112358)

(declare-fun b!1329362 () Bool)

(declare-fun res!881701 () Bool)

(declare-fun e!758013 () Bool)

(assert (=> b!1329362 (=> (not res!881701) (not e!758013))))

(declare-datatypes ((array!89885 0))(
  ( (array!89886 (arr!43404 (Array (_ BitVec 32) (_ BitVec 64))) (size!43955 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89885)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89885 (_ BitVec 32)) Bool)

(assert (=> b!1329362 (= res!881701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56332 () Bool)

(declare-fun mapRes!56332 () Bool)

(declare-fun tp!107239 () Bool)

(declare-fun e!758010 () Bool)

(assert (=> mapNonEmpty!56332 (= mapRes!56332 (and tp!107239 e!758010))))

(declare-fun mapKey!56332 () (_ BitVec 32))

(declare-datatypes ((V!53689 0))(
  ( (V!53690 (val!18294 Int)) )
))
(declare-datatypes ((ValueCell!17321 0))(
  ( (ValueCellFull!17321 (v!20926 V!53689)) (EmptyCell!17321) )
))
(declare-fun mapValue!56332 () ValueCell!17321)

(declare-datatypes ((array!89887 0))(
  ( (array!89888 (arr!43405 (Array (_ BitVec 32) ValueCell!17321)) (size!43956 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89887)

(declare-fun mapRest!56332 () (Array (_ BitVec 32) ValueCell!17321))

(assert (=> mapNonEmpty!56332 (= (arr!43405 _values!1320) (store mapRest!56332 mapKey!56332 mapValue!56332))))

(declare-fun b!1329364 () Bool)

(declare-fun res!881702 () Bool)

(assert (=> b!1329364 (=> (not res!881702) (not e!758013))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329364 (= res!881702 (and (= (size!43956 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43955 _keys!1590) (size!43956 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329365 () Bool)

(declare-fun tp_is_empty!36439 () Bool)

(assert (=> b!1329365 (= e!758010 tp_is_empty!36439)))

(declare-fun b!1329366 () Bool)

(declare-fun e!758014 () Bool)

(assert (=> b!1329366 (= e!758014 tp_is_empty!36439)))

(declare-fun b!1329363 () Bool)

(assert (=> b!1329363 (= e!758013 false)))

(declare-fun lt!591276 () Bool)

(declare-datatypes ((List!30751 0))(
  ( (Nil!30748) (Cons!30747 (h!31965 (_ BitVec 64)) (t!44749 List!30751)) )
))
(declare-fun arrayNoDuplicates!0 (array!89885 (_ BitVec 32) List!30751) Bool)

(assert (=> b!1329363 (= lt!591276 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30748))))

(declare-fun res!881700 () Bool)

(assert (=> start!112358 (=> (not res!881700) (not e!758013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112358 (= res!881700 (validMask!0 mask!1998))))

(assert (=> start!112358 e!758013))

(assert (=> start!112358 true))

(declare-fun e!758012 () Bool)

(declare-fun array_inv!33029 (array!89887) Bool)

(assert (=> start!112358 (and (array_inv!33029 _values!1320) e!758012)))

(declare-fun array_inv!33030 (array!89885) Bool)

(assert (=> start!112358 (array_inv!33030 _keys!1590)))

(declare-fun mapIsEmpty!56332 () Bool)

(assert (=> mapIsEmpty!56332 mapRes!56332))

(declare-fun b!1329367 () Bool)

(assert (=> b!1329367 (= e!758012 (and e!758014 mapRes!56332))))

(declare-fun condMapEmpty!56332 () Bool)

(declare-fun mapDefault!56332 () ValueCell!17321)

(assert (=> b!1329367 (= condMapEmpty!56332 (= (arr!43405 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17321)) mapDefault!56332)))))

(assert (= (and start!112358 res!881700) b!1329364))

(assert (= (and b!1329364 res!881702) b!1329362))

(assert (= (and b!1329362 res!881701) b!1329363))

(assert (= (and b!1329367 condMapEmpty!56332) mapIsEmpty!56332))

(assert (= (and b!1329367 (not condMapEmpty!56332)) mapNonEmpty!56332))

(get-info :version)

(assert (= (and mapNonEmpty!56332 ((_ is ValueCellFull!17321) mapValue!56332)) b!1329365))

(assert (= (and b!1329367 ((_ is ValueCellFull!17321) mapDefault!56332)) b!1329366))

(assert (= start!112358 b!1329367))

(declare-fun m!1218767 () Bool)

(assert (=> b!1329362 m!1218767))

(declare-fun m!1218769 () Bool)

(assert (=> mapNonEmpty!56332 m!1218769))

(declare-fun m!1218771 () Bool)

(assert (=> b!1329363 m!1218771))

(declare-fun m!1218773 () Bool)

(assert (=> start!112358 m!1218773))

(declare-fun m!1218775 () Bool)

(assert (=> start!112358 m!1218775))

(declare-fun m!1218777 () Bool)

(assert (=> start!112358 m!1218777))

(check-sat (not mapNonEmpty!56332) (not b!1329362) (not start!112358) tp_is_empty!36439 (not b!1329363))
(check-sat)
