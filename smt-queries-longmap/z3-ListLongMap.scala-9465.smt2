; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112398 () Bool)

(assert start!112398)

(declare-fun b_free!30793 () Bool)

(declare-fun b_next!30793 () Bool)

(assert (=> start!112398 (= b_free!30793 (not b_next!30793))))

(declare-fun tp!108016 () Bool)

(declare-fun b_and!49617 () Bool)

(assert (=> start!112398 (= tp!108016 b_and!49617)))

(declare-fun b!1332509 () Bool)

(declare-fun res!884290 () Bool)

(declare-fun e!759116 () Bool)

(assert (=> b!1332509 (=> (not res!884290) (not e!759116))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90225 0))(
  ( (array!90226 (arr!43579 (Array (_ BitVec 32) (_ BitVec 64))) (size!44131 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90225)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1332509 (= res!884290 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44131 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332510 () Bool)

(assert (=> b!1332510 (= e!759116 false)))

(declare-datatypes ((V!54041 0))(
  ( (V!54042 (val!18426 Int)) )
))
(declare-datatypes ((ValueCell!17453 0))(
  ( (ValueCellFull!17453 (v!21062 V!54041)) (EmptyCell!17453) )
))
(declare-datatypes ((array!90227 0))(
  ( (array!90228 (arr!43580 (Array (_ BitVec 32) ValueCell!17453)) (size!44132 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90227)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun lt!591856 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54041)

(declare-fun zeroValue!1262 () V!54041)

(declare-datatypes ((tuple2!23816 0))(
  ( (tuple2!23817 (_1!11919 (_ BitVec 64)) (_2!11919 V!54041)) )
))
(declare-datatypes ((List!30950 0))(
  ( (Nil!30947) (Cons!30946 (h!32155 tuple2!23816) (t!45140 List!30950)) )
))
(declare-datatypes ((ListLongMap!21473 0))(
  ( (ListLongMap!21474 (toList!10752 List!30950)) )
))
(declare-fun contains!8844 (ListLongMap!21473 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5612 (array!90225 array!90227 (_ BitVec 32) (_ BitVec 32) V!54041 V!54041 (_ BitVec 32) Int) ListLongMap!21473)

(assert (=> b!1332510 (= lt!591856 (contains!8844 (getCurrentListMap!5612 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332511 () Bool)

(declare-fun res!884293 () Bool)

(assert (=> b!1332511 (=> (not res!884293) (not e!759116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90225 (_ BitVec 32)) Bool)

(assert (=> b!1332511 (= res!884293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56728 () Bool)

(declare-fun mapRes!56728 () Bool)

(assert (=> mapIsEmpty!56728 mapRes!56728))

(declare-fun b!1332512 () Bool)

(declare-fun e!759117 () Bool)

(declare-fun e!759115 () Bool)

(assert (=> b!1332512 (= e!759117 (and e!759115 mapRes!56728))))

(declare-fun condMapEmpty!56728 () Bool)

(declare-fun mapDefault!56728 () ValueCell!17453)

(assert (=> b!1332512 (= condMapEmpty!56728 (= (arr!43580 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17453)) mapDefault!56728)))))

(declare-fun b!1332514 () Bool)

(declare-fun e!759114 () Bool)

(declare-fun tp_is_empty!36703 () Bool)

(assert (=> b!1332514 (= e!759114 tp_is_empty!36703)))

(declare-fun b!1332515 () Bool)

(declare-fun res!884289 () Bool)

(assert (=> b!1332515 (=> (not res!884289) (not e!759116))))

(assert (=> b!1332515 (= res!884289 (and (= (size!44132 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44131 _keys!1590) (size!44132 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56728 () Bool)

(declare-fun tp!108017 () Bool)

(assert (=> mapNonEmpty!56728 (= mapRes!56728 (and tp!108017 e!759114))))

(declare-fun mapKey!56728 () (_ BitVec 32))

(declare-fun mapRest!56728 () (Array (_ BitVec 32) ValueCell!17453))

(declare-fun mapValue!56728 () ValueCell!17453)

(assert (=> mapNonEmpty!56728 (= (arr!43580 _values!1320) (store mapRest!56728 mapKey!56728 mapValue!56728))))

(declare-fun b!1332516 () Bool)

(assert (=> b!1332516 (= e!759115 tp_is_empty!36703)))

(declare-fun res!884291 () Bool)

(assert (=> start!112398 (=> (not res!884291) (not e!759116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112398 (= res!884291 (validMask!0 mask!1998))))

(assert (=> start!112398 e!759116))

(declare-fun array_inv!33059 (array!90227) Bool)

(assert (=> start!112398 (and (array_inv!33059 _values!1320) e!759117)))

(assert (=> start!112398 true))

(declare-fun array_inv!33060 (array!90225) Bool)

(assert (=> start!112398 (array_inv!33060 _keys!1590)))

(assert (=> start!112398 tp!108016))

(assert (=> start!112398 tp_is_empty!36703))

(declare-fun b!1332513 () Bool)

(declare-fun res!884292 () Bool)

(assert (=> b!1332513 (=> (not res!884292) (not e!759116))))

(declare-datatypes ((List!30951 0))(
  ( (Nil!30948) (Cons!30947 (h!32156 (_ BitVec 64)) (t!45141 List!30951)) )
))
(declare-fun arrayNoDuplicates!0 (array!90225 (_ BitVec 32) List!30951) Bool)

(assert (=> b!1332513 (= res!884292 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30948))))

(assert (= (and start!112398 res!884291) b!1332515))

(assert (= (and b!1332515 res!884289) b!1332511))

(assert (= (and b!1332511 res!884293) b!1332513))

(assert (= (and b!1332513 res!884292) b!1332509))

(assert (= (and b!1332509 res!884290) b!1332510))

(assert (= (and b!1332512 condMapEmpty!56728) mapIsEmpty!56728))

(assert (= (and b!1332512 (not condMapEmpty!56728)) mapNonEmpty!56728))

(get-info :version)

(assert (= (and mapNonEmpty!56728 ((_ is ValueCellFull!17453) mapValue!56728)) b!1332514))

(assert (= (and b!1332512 ((_ is ValueCellFull!17453) mapDefault!56728)) b!1332516))

(assert (= start!112398 b!1332512))

(declare-fun m!1220871 () Bool)

(assert (=> mapNonEmpty!56728 m!1220871))

(declare-fun m!1220873 () Bool)

(assert (=> start!112398 m!1220873))

(declare-fun m!1220875 () Bool)

(assert (=> start!112398 m!1220875))

(declare-fun m!1220877 () Bool)

(assert (=> start!112398 m!1220877))

(declare-fun m!1220879 () Bool)

(assert (=> b!1332510 m!1220879))

(assert (=> b!1332510 m!1220879))

(declare-fun m!1220881 () Bool)

(assert (=> b!1332510 m!1220881))

(declare-fun m!1220883 () Bool)

(assert (=> b!1332511 m!1220883))

(declare-fun m!1220885 () Bool)

(assert (=> b!1332513 m!1220885))

(check-sat (not b!1332511) (not b!1332510) b_and!49617 (not start!112398) (not b!1332513) (not mapNonEmpty!56728) tp_is_empty!36703 (not b_next!30793))
(check-sat b_and!49617 (not b_next!30793))
