; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112178 () Bool)

(assert start!112178)

(declare-fun b_free!30573 () Bool)

(declare-fun b_next!30573 () Bool)

(assert (=> start!112178 (= b_free!30573 (not b_next!30573))))

(declare-fun tp!107355 () Bool)

(declare-fun b_and!49223 () Bool)

(assert (=> start!112178 (= tp!107355 b_and!49223)))

(declare-fun res!881493 () Bool)

(declare-fun e!757499 () Bool)

(assert (=> start!112178 (=> (not res!881493) (not e!757499))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112178 (= res!881493 (validMask!0 mask!1998))))

(assert (=> start!112178 e!757499))

(declare-datatypes ((V!53747 0))(
  ( (V!53748 (val!18316 Int)) )
))
(declare-datatypes ((ValueCell!17343 0))(
  ( (ValueCellFull!17343 (v!20953 V!53747)) (EmptyCell!17343) )
))
(declare-datatypes ((array!89860 0))(
  ( (array!89861 (arr!43396 (Array (_ BitVec 32) ValueCell!17343)) (size!43946 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89860)

(declare-fun e!757501 () Bool)

(declare-fun array_inv!32743 (array!89860) Bool)

(assert (=> start!112178 (and (array_inv!32743 _values!1320) e!757501)))

(assert (=> start!112178 true))

(declare-datatypes ((array!89862 0))(
  ( (array!89863 (arr!43397 (Array (_ BitVec 32) (_ BitVec 64))) (size!43947 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89862)

(declare-fun array_inv!32744 (array!89862) Bool)

(assert (=> start!112178 (array_inv!32744 _keys!1590)))

(assert (=> start!112178 tp!107355))

(declare-fun tp_is_empty!36483 () Bool)

(assert (=> start!112178 tp_is_empty!36483))

(declare-fun b!1328568 () Bool)

(declare-fun res!881491 () Bool)

(assert (=> b!1328568 (=> (not res!881491) (not e!757499))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328568 (= res!881491 (and (= (size!43946 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43947 _keys!1590) (size!43946 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328569 () Bool)

(declare-fun res!881492 () Bool)

(assert (=> b!1328569 (=> (not res!881492) (not e!757499))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1328569 (= res!881492 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43947 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328570 () Bool)

(declare-fun e!757498 () Bool)

(declare-fun mapRes!56398 () Bool)

(assert (=> b!1328570 (= e!757501 (and e!757498 mapRes!56398))))

(declare-fun condMapEmpty!56398 () Bool)

(declare-fun mapDefault!56398 () ValueCell!17343)

(assert (=> b!1328570 (= condMapEmpty!56398 (= (arr!43396 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17343)) mapDefault!56398)))))

(declare-fun mapIsEmpty!56398 () Bool)

(assert (=> mapIsEmpty!56398 mapRes!56398))

(declare-fun b!1328571 () Bool)

(declare-fun res!881489 () Bool)

(assert (=> b!1328571 (=> (not res!881489) (not e!757499))))

(declare-datatypes ((List!30732 0))(
  ( (Nil!30729) (Cons!30728 (h!31937 (_ BitVec 64)) (t!44738 List!30732)) )
))
(declare-fun arrayNoDuplicates!0 (array!89862 (_ BitVec 32) List!30732) Bool)

(assert (=> b!1328571 (= res!881489 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30729))))

(declare-fun mapNonEmpty!56398 () Bool)

(declare-fun tp!107356 () Bool)

(declare-fun e!757500 () Bool)

(assert (=> mapNonEmpty!56398 (= mapRes!56398 (and tp!107356 e!757500))))

(declare-fun mapValue!56398 () ValueCell!17343)

(declare-fun mapRest!56398 () (Array (_ BitVec 32) ValueCell!17343))

(declare-fun mapKey!56398 () (_ BitVec 32))

(assert (=> mapNonEmpty!56398 (= (arr!43396 _values!1320) (store mapRest!56398 mapKey!56398 mapValue!56398))))

(declare-fun b!1328572 () Bool)

(declare-fun res!881490 () Bool)

(assert (=> b!1328572 (=> (not res!881490) (not e!757499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89862 (_ BitVec 32)) Bool)

(assert (=> b!1328572 (= res!881490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328573 () Bool)

(assert (=> b!1328573 (= e!757500 tp_is_empty!36483)))

(declare-fun b!1328574 () Bool)

(assert (=> b!1328574 (= e!757499 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!590857 () Bool)

(declare-fun minValue!1262 () V!53747)

(declare-fun zeroValue!1262 () V!53747)

(declare-datatypes ((tuple2!23576 0))(
  ( (tuple2!23577 (_1!11799 (_ BitVec 64)) (_2!11799 V!53747)) )
))
(declare-datatypes ((List!30733 0))(
  ( (Nil!30730) (Cons!30729 (h!31938 tuple2!23576) (t!44739 List!30733)) )
))
(declare-datatypes ((ListLongMap!21233 0))(
  ( (ListLongMap!21234 (toList!10632 List!30733)) )
))
(declare-fun contains!8796 (ListLongMap!21233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5623 (array!89862 array!89860 (_ BitVec 32) (_ BitVec 32) V!53747 V!53747 (_ BitVec 32) Int) ListLongMap!21233)

(assert (=> b!1328574 (= lt!590857 (contains!8796 (getCurrentListMap!5623 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328575 () Bool)

(assert (=> b!1328575 (= e!757498 tp_is_empty!36483)))

(assert (= (and start!112178 res!881493) b!1328568))

(assert (= (and b!1328568 res!881491) b!1328572))

(assert (= (and b!1328572 res!881490) b!1328571))

(assert (= (and b!1328571 res!881489) b!1328569))

(assert (= (and b!1328569 res!881492) b!1328574))

(assert (= (and b!1328570 condMapEmpty!56398) mapIsEmpty!56398))

(assert (= (and b!1328570 (not condMapEmpty!56398)) mapNonEmpty!56398))

(get-info :version)

(assert (= (and mapNonEmpty!56398 ((_ is ValueCellFull!17343) mapValue!56398)) b!1328573))

(assert (= (and b!1328570 ((_ is ValueCellFull!17343) mapDefault!56398)) b!1328575))

(assert (= start!112178 b!1328570))

(declare-fun m!1217497 () Bool)

(assert (=> b!1328572 m!1217497))

(declare-fun m!1217499 () Bool)

(assert (=> b!1328571 m!1217499))

(declare-fun m!1217501 () Bool)

(assert (=> mapNonEmpty!56398 m!1217501))

(declare-fun m!1217503 () Bool)

(assert (=> b!1328574 m!1217503))

(assert (=> b!1328574 m!1217503))

(declare-fun m!1217505 () Bool)

(assert (=> b!1328574 m!1217505))

(declare-fun m!1217507 () Bool)

(assert (=> start!112178 m!1217507))

(declare-fun m!1217509 () Bool)

(assert (=> start!112178 m!1217509))

(declare-fun m!1217511 () Bool)

(assert (=> start!112178 m!1217511))

(check-sat (not b!1328572) b_and!49223 (not b!1328571) tp_is_empty!36483 (not mapNonEmpty!56398) (not b_next!30573) (not b!1328574) (not start!112178))
(check-sat b_and!49223 (not b_next!30573))
