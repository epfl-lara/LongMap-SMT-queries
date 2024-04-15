; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113036 () Bool)

(assert start!113036)

(declare-fun b_free!31087 () Bool)

(declare-fun b_next!31087 () Bool)

(assert (=> start!113036 (= b_free!31087 (not b_next!31087))))

(declare-fun tp!109066 () Bool)

(declare-fun b_and!50099 () Bool)

(assert (=> start!113036 (= tp!109066 b_and!50099)))

(declare-fun b!1339694 () Bool)

(declare-fun e!763097 () Bool)

(assert (=> b!1339694 (= e!763097 false)))

(declare-datatypes ((V!54553 0))(
  ( (V!54554 (val!18618 Int)) )
))
(declare-fun minValue!1245 () V!54553)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!90975 0))(
  ( (array!90976 (arr!43944 (Array (_ BitVec 32) (_ BitVec 64))) (size!44496 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90975)

(declare-fun zeroValue!1245 () V!54553)

(declare-datatypes ((ValueCell!17645 0))(
  ( (ValueCellFull!17645 (v!21265 V!54553)) (EmptyCell!17645) )
))
(declare-datatypes ((array!90977 0))(
  ( (array!90978 (arr!43945 (Array (_ BitVec 32) ValueCell!17645)) (size!44497 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90977)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun lt!593739 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((tuple2!24022 0))(
  ( (tuple2!24023 (_1!12022 (_ BitVec 64)) (_2!12022 V!54553)) )
))
(declare-datatypes ((List!31171 0))(
  ( (Nil!31168) (Cons!31167 (h!32376 tuple2!24022) (t!45495 List!31171)) )
))
(declare-datatypes ((ListLongMap!21679 0))(
  ( (ListLongMap!21680 (toList!10855 List!31171)) )
))
(declare-fun contains!8960 (ListLongMap!21679 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5708 (array!90975 array!90977 (_ BitVec 32) (_ BitVec 32) V!54553 V!54553 (_ BitVec 32) Int) ListLongMap!21679)

(assert (=> b!1339694 (= lt!593739 (contains!8960 (getCurrentListMap!5708 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1339695 () Bool)

(declare-fun e!763099 () Bool)

(declare-fun tp_is_empty!37087 () Bool)

(assert (=> b!1339695 (= e!763099 tp_is_empty!37087)))

(declare-fun mapNonEmpty!57337 () Bool)

(declare-fun mapRes!57337 () Bool)

(declare-fun tp!109067 () Bool)

(assert (=> mapNonEmpty!57337 (= mapRes!57337 (and tp!109067 e!763099))))

(declare-fun mapValue!57337 () ValueCell!17645)

(declare-fun mapKey!57337 () (_ BitVec 32))

(declare-fun mapRest!57337 () (Array (_ BitVec 32) ValueCell!17645))

(assert (=> mapNonEmpty!57337 (= (arr!43945 _values!1303) (store mapRest!57337 mapKey!57337 mapValue!57337))))

(declare-fun b!1339696 () Bool)

(declare-fun res!888725 () Bool)

(assert (=> b!1339696 (=> (not res!888725) (not e!763097))))

(assert (=> b!1339696 (= res!888725 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44496 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339697 () Bool)

(declare-fun res!888727 () Bool)

(assert (=> b!1339697 (=> (not res!888727) (not e!763097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90975 (_ BitVec 32)) Bool)

(assert (=> b!1339697 (= res!888727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339698 () Bool)

(declare-fun res!888723 () Bool)

(assert (=> b!1339698 (=> (not res!888723) (not e!763097))))

(assert (=> b!1339698 (= res!888723 (and (= (size!44497 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44496 _keys!1571) (size!44497 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339699 () Bool)

(declare-fun res!888726 () Bool)

(assert (=> b!1339699 (=> (not res!888726) (not e!763097))))

(declare-datatypes ((List!31172 0))(
  ( (Nil!31169) (Cons!31168 (h!32377 (_ BitVec 64)) (t!45496 List!31172)) )
))
(declare-fun arrayNoDuplicates!0 (array!90975 (_ BitVec 32) List!31172) Bool)

(assert (=> b!1339699 (= res!888726 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31169))))

(declare-fun b!1339700 () Bool)

(declare-fun e!763098 () Bool)

(assert (=> b!1339700 (= e!763098 tp_is_empty!37087)))

(declare-fun b!1339701 () Bool)

(declare-fun e!763100 () Bool)

(assert (=> b!1339701 (= e!763100 (and e!763098 mapRes!57337))))

(declare-fun condMapEmpty!57337 () Bool)

(declare-fun mapDefault!57337 () ValueCell!17645)

(assert (=> b!1339701 (= condMapEmpty!57337 (= (arr!43945 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17645)) mapDefault!57337)))))

(declare-fun mapIsEmpty!57337 () Bool)

(assert (=> mapIsEmpty!57337 mapRes!57337))

(declare-fun res!888724 () Bool)

(assert (=> start!113036 (=> (not res!888724) (not e!763097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113036 (= res!888724 (validMask!0 mask!1977))))

(assert (=> start!113036 e!763097))

(assert (=> start!113036 tp_is_empty!37087))

(assert (=> start!113036 true))

(declare-fun array_inv!33327 (array!90975) Bool)

(assert (=> start!113036 (array_inv!33327 _keys!1571)))

(declare-fun array_inv!33328 (array!90977) Bool)

(assert (=> start!113036 (and (array_inv!33328 _values!1303) e!763100)))

(assert (=> start!113036 tp!109066))

(assert (= (and start!113036 res!888724) b!1339698))

(assert (= (and b!1339698 res!888723) b!1339697))

(assert (= (and b!1339697 res!888727) b!1339699))

(assert (= (and b!1339699 res!888726) b!1339696))

(assert (= (and b!1339696 res!888725) b!1339694))

(assert (= (and b!1339701 condMapEmpty!57337) mapIsEmpty!57337))

(assert (= (and b!1339701 (not condMapEmpty!57337)) mapNonEmpty!57337))

(get-info :version)

(assert (= (and mapNonEmpty!57337 ((_ is ValueCellFull!17645) mapValue!57337)) b!1339695))

(assert (= (and b!1339701 ((_ is ValueCellFull!17645) mapDefault!57337)) b!1339700))

(assert (= start!113036 b!1339701))

(declare-fun m!1227193 () Bool)

(assert (=> start!113036 m!1227193))

(declare-fun m!1227195 () Bool)

(assert (=> start!113036 m!1227195))

(declare-fun m!1227197 () Bool)

(assert (=> start!113036 m!1227197))

(declare-fun m!1227199 () Bool)

(assert (=> b!1339699 m!1227199))

(declare-fun m!1227201 () Bool)

(assert (=> b!1339697 m!1227201))

(declare-fun m!1227203 () Bool)

(assert (=> mapNonEmpty!57337 m!1227203))

(declare-fun m!1227205 () Bool)

(assert (=> b!1339694 m!1227205))

(assert (=> b!1339694 m!1227205))

(declare-fun m!1227207 () Bool)

(assert (=> b!1339694 m!1227207))

(check-sat b_and!50099 (not b!1339697) (not b!1339694) (not b!1339699) (not mapNonEmpty!57337) (not b_next!31087) (not start!113036) tp_is_empty!37087)
(check-sat b_and!50099 (not b_next!31087))
