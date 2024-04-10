; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112172 () Bool)

(assert start!112172)

(declare-fun b_free!30567 () Bool)

(declare-fun b_next!30567 () Bool)

(assert (=> start!112172 (= b_free!30567 (not b_next!30567))))

(declare-fun tp!107338 () Bool)

(declare-fun b_and!49217 () Bool)

(assert (=> start!112172 (= tp!107338 b_and!49217)))

(declare-fun b!1328496 () Bool)

(declare-fun res!881446 () Bool)

(declare-fun e!757456 () Bool)

(assert (=> b!1328496 (=> (not res!881446) (not e!757456))))

(declare-datatypes ((array!89848 0))(
  ( (array!89849 (arr!43390 (Array (_ BitVec 32) (_ BitVec 64))) (size!43940 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89848)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89848 (_ BitVec 32)) Bool)

(assert (=> b!1328496 (= res!881446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!881445 () Bool)

(assert (=> start!112172 (=> (not res!881445) (not e!757456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112172 (= res!881445 (validMask!0 mask!1998))))

(assert (=> start!112172 e!757456))

(declare-datatypes ((V!53739 0))(
  ( (V!53740 (val!18313 Int)) )
))
(declare-datatypes ((ValueCell!17340 0))(
  ( (ValueCellFull!17340 (v!20950 V!53739)) (EmptyCell!17340) )
))
(declare-datatypes ((array!89850 0))(
  ( (array!89851 (arr!43391 (Array (_ BitVec 32) ValueCell!17340)) (size!43941 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89850)

(declare-fun e!757452 () Bool)

(declare-fun array_inv!32737 (array!89850) Bool)

(assert (=> start!112172 (and (array_inv!32737 _values!1320) e!757452)))

(assert (=> start!112172 true))

(declare-fun array_inv!32738 (array!89848) Bool)

(assert (=> start!112172 (array_inv!32738 _keys!1590)))

(assert (=> start!112172 tp!107338))

(declare-fun tp_is_empty!36477 () Bool)

(assert (=> start!112172 tp_is_empty!36477))

(declare-fun b!1328497 () Bool)

(declare-fun e!757453 () Bool)

(assert (=> b!1328497 (= e!757453 tp_is_empty!36477)))

(declare-fun b!1328498 () Bool)

(declare-fun res!881448 () Bool)

(assert (=> b!1328498 (=> (not res!881448) (not e!757456))))

(declare-datatypes ((List!30728 0))(
  ( (Nil!30725) (Cons!30724 (h!31933 (_ BitVec 64)) (t!44734 List!30728)) )
))
(declare-fun arrayNoDuplicates!0 (array!89848 (_ BitVec 32) List!30728) Bool)

(assert (=> b!1328498 (= res!881448 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30725))))

(declare-fun b!1328499 () Bool)

(declare-fun res!881444 () Bool)

(assert (=> b!1328499 (=> (not res!881444) (not e!757456))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328499 (= res!881444 (and (= (size!43941 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43940 _keys!1590) (size!43941 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328500 () Bool)

(declare-fun e!757454 () Bool)

(assert (=> b!1328500 (= e!757454 tp_is_empty!36477)))

(declare-fun b!1328501 () Bool)

(declare-fun mapRes!56389 () Bool)

(assert (=> b!1328501 (= e!757452 (and e!757454 mapRes!56389))))

(declare-fun condMapEmpty!56389 () Bool)

(declare-fun mapDefault!56389 () ValueCell!17340)

(assert (=> b!1328501 (= condMapEmpty!56389 (= (arr!43391 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17340)) mapDefault!56389)))))

(declare-fun b!1328502 () Bool)

(assert (=> b!1328502 (= e!757456 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!590848 () Bool)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53739)

(declare-fun zeroValue!1262 () V!53739)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23570 0))(
  ( (tuple2!23571 (_1!11796 (_ BitVec 64)) (_2!11796 V!53739)) )
))
(declare-datatypes ((List!30729 0))(
  ( (Nil!30726) (Cons!30725 (h!31934 tuple2!23570) (t!44735 List!30729)) )
))
(declare-datatypes ((ListLongMap!21227 0))(
  ( (ListLongMap!21228 (toList!10629 List!30729)) )
))
(declare-fun contains!8793 (ListLongMap!21227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5620 (array!89848 array!89850 (_ BitVec 32) (_ BitVec 32) V!53739 V!53739 (_ BitVec 32) Int) ListLongMap!21227)

(assert (=> b!1328502 (= lt!590848 (contains!8793 (getCurrentListMap!5620 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328503 () Bool)

(declare-fun res!881447 () Bool)

(assert (=> b!1328503 (=> (not res!881447) (not e!757456))))

(assert (=> b!1328503 (= res!881447 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43940 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56389 () Bool)

(assert (=> mapIsEmpty!56389 mapRes!56389))

(declare-fun mapNonEmpty!56389 () Bool)

(declare-fun tp!107337 () Bool)

(assert (=> mapNonEmpty!56389 (= mapRes!56389 (and tp!107337 e!757453))))

(declare-fun mapKey!56389 () (_ BitVec 32))

(declare-fun mapValue!56389 () ValueCell!17340)

(declare-fun mapRest!56389 () (Array (_ BitVec 32) ValueCell!17340))

(assert (=> mapNonEmpty!56389 (= (arr!43391 _values!1320) (store mapRest!56389 mapKey!56389 mapValue!56389))))

(assert (= (and start!112172 res!881445) b!1328499))

(assert (= (and b!1328499 res!881444) b!1328496))

(assert (= (and b!1328496 res!881446) b!1328498))

(assert (= (and b!1328498 res!881448) b!1328503))

(assert (= (and b!1328503 res!881447) b!1328502))

(assert (= (and b!1328501 condMapEmpty!56389) mapIsEmpty!56389))

(assert (= (and b!1328501 (not condMapEmpty!56389)) mapNonEmpty!56389))

(get-info :version)

(assert (= (and mapNonEmpty!56389 ((_ is ValueCellFull!17340) mapValue!56389)) b!1328497))

(assert (= (and b!1328501 ((_ is ValueCellFull!17340) mapDefault!56389)) b!1328500))

(assert (= start!112172 b!1328501))

(declare-fun m!1217449 () Bool)

(assert (=> b!1328498 m!1217449))

(declare-fun m!1217451 () Bool)

(assert (=> b!1328502 m!1217451))

(assert (=> b!1328502 m!1217451))

(declare-fun m!1217453 () Bool)

(assert (=> b!1328502 m!1217453))

(declare-fun m!1217455 () Bool)

(assert (=> b!1328496 m!1217455))

(declare-fun m!1217457 () Bool)

(assert (=> start!112172 m!1217457))

(declare-fun m!1217459 () Bool)

(assert (=> start!112172 m!1217459))

(declare-fun m!1217461 () Bool)

(assert (=> start!112172 m!1217461))

(declare-fun m!1217463 () Bool)

(assert (=> mapNonEmpty!56389 m!1217463))

(check-sat b_and!49217 (not b!1328496) (not mapNonEmpty!56389) (not start!112172) (not b!1328502) (not b_next!30567) (not b!1328498) tp_is_empty!36477)
(check-sat b_and!49217 (not b_next!30567))
