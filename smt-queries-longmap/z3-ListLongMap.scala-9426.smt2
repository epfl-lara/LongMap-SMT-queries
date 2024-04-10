; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112166 () Bool)

(assert start!112166)

(declare-fun b_free!30561 () Bool)

(declare-fun b_next!30561 () Bool)

(assert (=> start!112166 (= b_free!30561 (not b_next!30561))))

(declare-fun tp!107319 () Bool)

(declare-fun b_and!49211 () Bool)

(assert (=> start!112166 (= tp!107319 b_and!49211)))

(declare-fun b!1328424 () Bool)

(declare-fun res!881400 () Bool)

(declare-fun e!757408 () Bool)

(assert (=> b!1328424 (=> (not res!881400) (not e!757408))))

(declare-datatypes ((array!89836 0))(
  ( (array!89837 (arr!43384 (Array (_ BitVec 32) (_ BitVec 64))) (size!43934 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89836)

(declare-datatypes ((List!30724 0))(
  ( (Nil!30721) (Cons!30720 (h!31929 (_ BitVec 64)) (t!44730 List!30724)) )
))
(declare-fun arrayNoDuplicates!0 (array!89836 (_ BitVec 32) List!30724) Bool)

(assert (=> b!1328424 (= res!881400 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30721))))

(declare-fun b!1328425 () Bool)

(assert (=> b!1328425 (= e!757408 false)))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-datatypes ((V!53731 0))(
  ( (V!53732 (val!18310 Int)) )
))
(declare-fun minValue!1262 () V!53731)

(declare-fun zeroValue!1262 () V!53731)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17337 0))(
  ( (ValueCellFull!17337 (v!20947 V!53731)) (EmptyCell!17337) )
))
(declare-datatypes ((array!89838 0))(
  ( (array!89839 (arr!43385 (Array (_ BitVec 32) ValueCell!17337)) (size!43935 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89838)

(declare-fun lt!590839 () Bool)

(declare-datatypes ((tuple2!23568 0))(
  ( (tuple2!23569 (_1!11795 (_ BitVec 64)) (_2!11795 V!53731)) )
))
(declare-datatypes ((List!30725 0))(
  ( (Nil!30722) (Cons!30721 (h!31930 tuple2!23568) (t!44731 List!30725)) )
))
(declare-datatypes ((ListLongMap!21225 0))(
  ( (ListLongMap!21226 (toList!10628 List!30725)) )
))
(declare-fun contains!8792 (ListLongMap!21225 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5619 (array!89836 array!89838 (_ BitVec 32) (_ BitVec 32) V!53731 V!53731 (_ BitVec 32) Int) ListLongMap!21225)

(assert (=> b!1328425 (= lt!590839 (contains!8792 (getCurrentListMap!5619 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328426 () Bool)

(declare-fun res!881401 () Bool)

(assert (=> b!1328426 (=> (not res!881401) (not e!757408))))

(assert (=> b!1328426 (= res!881401 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43934 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!881403 () Bool)

(assert (=> start!112166 (=> (not res!881403) (not e!757408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112166 (= res!881403 (validMask!0 mask!1998))))

(assert (=> start!112166 e!757408))

(declare-fun e!757407 () Bool)

(declare-fun array_inv!32733 (array!89838) Bool)

(assert (=> start!112166 (and (array_inv!32733 _values!1320) e!757407)))

(assert (=> start!112166 true))

(declare-fun array_inv!32734 (array!89836) Bool)

(assert (=> start!112166 (array_inv!32734 _keys!1590)))

(assert (=> start!112166 tp!107319))

(declare-fun tp_is_empty!36471 () Bool)

(assert (=> start!112166 tp_is_empty!36471))

(declare-fun mapNonEmpty!56380 () Bool)

(declare-fun mapRes!56380 () Bool)

(declare-fun tp!107320 () Bool)

(declare-fun e!757411 () Bool)

(assert (=> mapNonEmpty!56380 (= mapRes!56380 (and tp!107320 e!757411))))

(declare-fun mapValue!56380 () ValueCell!17337)

(declare-fun mapKey!56380 () (_ BitVec 32))

(declare-fun mapRest!56380 () (Array (_ BitVec 32) ValueCell!17337))

(assert (=> mapNonEmpty!56380 (= (arr!43385 _values!1320) (store mapRest!56380 mapKey!56380 mapValue!56380))))

(declare-fun b!1328427 () Bool)

(assert (=> b!1328427 (= e!757411 tp_is_empty!36471)))

(declare-fun b!1328428 () Bool)

(declare-fun e!757409 () Bool)

(assert (=> b!1328428 (= e!757407 (and e!757409 mapRes!56380))))

(declare-fun condMapEmpty!56380 () Bool)

(declare-fun mapDefault!56380 () ValueCell!17337)

(assert (=> b!1328428 (= condMapEmpty!56380 (= (arr!43385 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17337)) mapDefault!56380)))))

(declare-fun b!1328429 () Bool)

(assert (=> b!1328429 (= e!757409 tp_is_empty!36471)))

(declare-fun b!1328430 () Bool)

(declare-fun res!881399 () Bool)

(assert (=> b!1328430 (=> (not res!881399) (not e!757408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89836 (_ BitVec 32)) Bool)

(assert (=> b!1328430 (= res!881399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328431 () Bool)

(declare-fun res!881402 () Bool)

(assert (=> b!1328431 (=> (not res!881402) (not e!757408))))

(assert (=> b!1328431 (= res!881402 (and (= (size!43935 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43934 _keys!1590) (size!43935 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56380 () Bool)

(assert (=> mapIsEmpty!56380 mapRes!56380))

(assert (= (and start!112166 res!881403) b!1328431))

(assert (= (and b!1328431 res!881402) b!1328430))

(assert (= (and b!1328430 res!881399) b!1328424))

(assert (= (and b!1328424 res!881400) b!1328426))

(assert (= (and b!1328426 res!881401) b!1328425))

(assert (= (and b!1328428 condMapEmpty!56380) mapIsEmpty!56380))

(assert (= (and b!1328428 (not condMapEmpty!56380)) mapNonEmpty!56380))

(get-info :version)

(assert (= (and mapNonEmpty!56380 ((_ is ValueCellFull!17337) mapValue!56380)) b!1328427))

(assert (= (and b!1328428 ((_ is ValueCellFull!17337) mapDefault!56380)) b!1328429))

(assert (= start!112166 b!1328428))

(declare-fun m!1217401 () Bool)

(assert (=> b!1328424 m!1217401))

(declare-fun m!1217403 () Bool)

(assert (=> mapNonEmpty!56380 m!1217403))

(declare-fun m!1217405 () Bool)

(assert (=> b!1328425 m!1217405))

(assert (=> b!1328425 m!1217405))

(declare-fun m!1217407 () Bool)

(assert (=> b!1328425 m!1217407))

(declare-fun m!1217409 () Bool)

(assert (=> b!1328430 m!1217409))

(declare-fun m!1217411 () Bool)

(assert (=> start!112166 m!1217411))

(declare-fun m!1217413 () Bool)

(assert (=> start!112166 m!1217413))

(declare-fun m!1217415 () Bool)

(assert (=> start!112166 m!1217415))

(check-sat (not b!1328424) (not b_next!30561) (not start!112166) (not b!1328425) b_and!49211 (not b!1328430) tp_is_empty!36471 (not mapNonEmpty!56380))
(check-sat b_and!49211 (not b_next!30561))
