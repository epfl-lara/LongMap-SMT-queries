; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112364 () Bool)

(assert start!112364)

(declare-fun mapNonEmpty!56341 () Bool)

(declare-fun mapRes!56341 () Bool)

(declare-fun tp!107248 () Bool)

(declare-fun e!758057 () Bool)

(assert (=> mapNonEmpty!56341 (= mapRes!56341 (and tp!107248 e!758057))))

(declare-datatypes ((V!53697 0))(
  ( (V!53698 (val!18297 Int)) )
))
(declare-datatypes ((ValueCell!17324 0))(
  ( (ValueCellFull!17324 (v!20929 V!53697)) (EmptyCell!17324) )
))
(declare-datatypes ((array!89895 0))(
  ( (array!89896 (arr!43409 (Array (_ BitVec 32) ValueCell!17324)) (size!43960 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89895)

(declare-fun mapRest!56341 () (Array (_ BitVec 32) ValueCell!17324))

(declare-fun mapValue!56341 () ValueCell!17324)

(declare-fun mapKey!56341 () (_ BitVec 32))

(assert (=> mapNonEmpty!56341 (= (arr!43409 _values!1320) (store mapRest!56341 mapKey!56341 mapValue!56341))))

(declare-fun b!1329418 () Bool)

(declare-fun res!881731 () Bool)

(declare-fun e!758059 () Bool)

(assert (=> b!1329418 (=> (not res!881731) (not e!758059))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89897 0))(
  ( (array!89898 (arr!43410 (Array (_ BitVec 32) (_ BitVec 64))) (size!43961 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89897)

(assert (=> b!1329418 (= res!881731 (and (= (size!43960 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43961 _keys!1590) (size!43960 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329419 () Bool)

(declare-fun res!881729 () Bool)

(assert (=> b!1329419 (=> (not res!881729) (not e!758059))))

(declare-datatypes ((List!30753 0))(
  ( (Nil!30750) (Cons!30749 (h!31967 (_ BitVec 64)) (t!44751 List!30753)) )
))
(declare-fun arrayNoDuplicates!0 (array!89897 (_ BitVec 32) List!30753) Bool)

(assert (=> b!1329419 (= res!881729 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30750))))

(declare-fun res!881730 () Bool)

(assert (=> start!112364 (=> (not res!881730) (not e!758059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112364 (= res!881730 (validMask!0 mask!1998))))

(assert (=> start!112364 e!758059))

(assert (=> start!112364 true))

(declare-fun e!758058 () Bool)

(declare-fun array_inv!33033 (array!89895) Bool)

(assert (=> start!112364 (and (array_inv!33033 _values!1320) e!758058)))

(declare-fun array_inv!33034 (array!89897) Bool)

(assert (=> start!112364 (array_inv!33034 _keys!1590)))

(declare-fun b!1329420 () Bool)

(declare-fun tp_is_empty!36445 () Bool)

(assert (=> b!1329420 (= e!758057 tp_is_empty!36445)))

(declare-fun mapIsEmpty!56341 () Bool)

(assert (=> mapIsEmpty!56341 mapRes!56341))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun b!1329421 () Bool)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1329421 (= e!758059 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43961 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!1980 (size!43961 _keys!1590))))))

(declare-fun b!1329422 () Bool)

(declare-fun res!881732 () Bool)

(assert (=> b!1329422 (=> (not res!881732) (not e!758059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89897 (_ BitVec 32)) Bool)

(assert (=> b!1329422 (= res!881732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329423 () Bool)

(declare-fun e!758055 () Bool)

(assert (=> b!1329423 (= e!758058 (and e!758055 mapRes!56341))))

(declare-fun condMapEmpty!56341 () Bool)

(declare-fun mapDefault!56341 () ValueCell!17324)

(assert (=> b!1329423 (= condMapEmpty!56341 (= (arr!43409 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17324)) mapDefault!56341)))))

(declare-fun b!1329424 () Bool)

(assert (=> b!1329424 (= e!758055 tp_is_empty!36445)))

(assert (= (and start!112364 res!881730) b!1329418))

(assert (= (and b!1329418 res!881731) b!1329422))

(assert (= (and b!1329422 res!881732) b!1329419))

(assert (= (and b!1329419 res!881729) b!1329421))

(assert (= (and b!1329423 condMapEmpty!56341) mapIsEmpty!56341))

(assert (= (and b!1329423 (not condMapEmpty!56341)) mapNonEmpty!56341))

(get-info :version)

(assert (= (and mapNonEmpty!56341 ((_ is ValueCellFull!17324) mapValue!56341)) b!1329420))

(assert (= (and b!1329423 ((_ is ValueCellFull!17324) mapDefault!56341)) b!1329424))

(assert (= start!112364 b!1329423))

(declare-fun m!1218803 () Bool)

(assert (=> mapNonEmpty!56341 m!1218803))

(declare-fun m!1218805 () Bool)

(assert (=> b!1329419 m!1218805))

(declare-fun m!1218807 () Bool)

(assert (=> start!112364 m!1218807))

(declare-fun m!1218809 () Bool)

(assert (=> start!112364 m!1218809))

(declare-fun m!1218811 () Bool)

(assert (=> start!112364 m!1218811))

(declare-fun m!1218813 () Bool)

(assert (=> b!1329422 m!1218813))

(check-sat (not b!1329419) (not start!112364) (not mapNonEmpty!56341) (not b!1329422) tp_is_empty!36445)
(check-sat)
