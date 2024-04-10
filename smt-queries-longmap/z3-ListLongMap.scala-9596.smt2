; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113440 () Bool)

(assert start!113440)

(declare-fun b_free!31491 () Bool)

(declare-fun b_next!31491 () Bool)

(assert (=> start!113440 (= b_free!31491 (not b_next!31491))))

(declare-fun tp!110278 () Bool)

(declare-fun b_and!50779 () Bool)

(assert (=> start!113440 (= tp!110278 b_and!50779)))

(declare-fun b!1346661 () Bool)

(declare-fun e!766241 () Bool)

(declare-fun e!766243 () Bool)

(declare-fun mapRes!57943 () Bool)

(assert (=> b!1346661 (= e!766241 (and e!766243 mapRes!57943))))

(declare-fun condMapEmpty!57943 () Bool)

(declare-datatypes ((V!55091 0))(
  ( (V!55092 (val!18820 Int)) )
))
(declare-datatypes ((ValueCell!17847 0))(
  ( (ValueCellFull!17847 (v!21468 V!55091)) (EmptyCell!17847) )
))
(declare-datatypes ((array!91814 0))(
  ( (array!91815 (arr!44363 (Array (_ BitVec 32) ValueCell!17847)) (size!44913 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91814)

(declare-fun mapDefault!57943 () ValueCell!17847)

(assert (=> b!1346661 (= condMapEmpty!57943 (= (arr!44363 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17847)) mapDefault!57943)))))

(declare-fun res!893573 () Bool)

(declare-fun e!766240 () Bool)

(assert (=> start!113440 (=> (not res!893573) (not e!766240))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113440 (= res!893573 (validMask!0 mask!1977))))

(assert (=> start!113440 e!766240))

(declare-fun tp_is_empty!37491 () Bool)

(assert (=> start!113440 tp_is_empty!37491))

(assert (=> start!113440 true))

(declare-datatypes ((array!91816 0))(
  ( (array!91817 (arr!44364 (Array (_ BitVec 32) (_ BitVec 64))) (size!44914 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91816)

(declare-fun array_inv!33421 (array!91816) Bool)

(assert (=> start!113440 (array_inv!33421 _keys!1571)))

(declare-fun array_inv!33422 (array!91814) Bool)

(assert (=> start!113440 (and (array_inv!33422 _values!1303) e!766241)))

(assert (=> start!113440 tp!110278))

(declare-fun b!1346662 () Bool)

(declare-fun e!766242 () Bool)

(assert (=> b!1346662 (= e!766242 tp_is_empty!37491)))

(declare-fun b!1346663 () Bool)

(assert (=> b!1346663 (= e!766243 tp_is_empty!37491)))

(declare-fun b!1346664 () Bool)

(declare-fun res!893575 () Bool)

(assert (=> b!1346664 (=> (not res!893575) (not e!766240))))

(declare-datatypes ((List!31415 0))(
  ( (Nil!31412) (Cons!31411 (h!32620 (_ BitVec 64)) (t!46005 List!31415)) )
))
(declare-fun arrayNoDuplicates!0 (array!91816 (_ BitVec 32) List!31415) Bool)

(assert (=> b!1346664 (= res!893575 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31412))))

(declare-fun b!1346665 () Bool)

(declare-fun res!893576 () Bool)

(assert (=> b!1346665 (=> (not res!893576) (not e!766240))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346665 (= res!893576 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44914 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346666 () Bool)

(declare-fun res!893574 () Bool)

(assert (=> b!1346666 (=> (not res!893574) (not e!766240))))

(assert (=> b!1346666 (= res!893574 (and (= (size!44913 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44914 _keys!1571) (size!44913 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57943 () Bool)

(assert (=> mapIsEmpty!57943 mapRes!57943))

(declare-fun b!1346667 () Bool)

(declare-fun res!893577 () Bool)

(assert (=> b!1346667 (=> (not res!893577) (not e!766240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91816 (_ BitVec 32)) Bool)

(assert (=> b!1346667 (= res!893577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346668 () Bool)

(assert (=> b!1346668 (= e!766240 false)))

(declare-fun zeroValue!1245 () V!55091)

(declare-fun lt!595530 () Bool)

(declare-fun minValue!1245 () V!55091)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24258 0))(
  ( (tuple2!24259 (_1!12140 (_ BitVec 64)) (_2!12140 V!55091)) )
))
(declare-datatypes ((List!31416 0))(
  ( (Nil!31413) (Cons!31412 (h!32621 tuple2!24258) (t!46006 List!31416)) )
))
(declare-datatypes ((ListLongMap!21915 0))(
  ( (ListLongMap!21916 (toList!10973 List!31416)) )
))
(declare-fun contains!9149 (ListLongMap!21915 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5925 (array!91816 array!91814 (_ BitVec 32) (_ BitVec 32) V!55091 V!55091 (_ BitVec 32) Int) ListLongMap!21915)

(assert (=> b!1346668 (= lt!595530 (contains!9149 (getCurrentListMap!5925 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57943 () Bool)

(declare-fun tp!110277 () Bool)

(assert (=> mapNonEmpty!57943 (= mapRes!57943 (and tp!110277 e!766242))))

(declare-fun mapKey!57943 () (_ BitVec 32))

(declare-fun mapValue!57943 () ValueCell!17847)

(declare-fun mapRest!57943 () (Array (_ BitVec 32) ValueCell!17847))

(assert (=> mapNonEmpty!57943 (= (arr!44363 _values!1303) (store mapRest!57943 mapKey!57943 mapValue!57943))))

(assert (= (and start!113440 res!893573) b!1346666))

(assert (= (and b!1346666 res!893574) b!1346667))

(assert (= (and b!1346667 res!893577) b!1346664))

(assert (= (and b!1346664 res!893575) b!1346665))

(assert (= (and b!1346665 res!893576) b!1346668))

(assert (= (and b!1346661 condMapEmpty!57943) mapIsEmpty!57943))

(assert (= (and b!1346661 (not condMapEmpty!57943)) mapNonEmpty!57943))

(get-info :version)

(assert (= (and mapNonEmpty!57943 ((_ is ValueCellFull!17847) mapValue!57943)) b!1346662))

(assert (= (and b!1346661 ((_ is ValueCellFull!17847) mapDefault!57943)) b!1346663))

(assert (= start!113440 b!1346661))

(declare-fun m!1233731 () Bool)

(assert (=> b!1346664 m!1233731))

(declare-fun m!1233733 () Bool)

(assert (=> b!1346668 m!1233733))

(assert (=> b!1346668 m!1233733))

(declare-fun m!1233735 () Bool)

(assert (=> b!1346668 m!1233735))

(declare-fun m!1233737 () Bool)

(assert (=> mapNonEmpty!57943 m!1233737))

(declare-fun m!1233739 () Bool)

(assert (=> start!113440 m!1233739))

(declare-fun m!1233741 () Bool)

(assert (=> start!113440 m!1233741))

(declare-fun m!1233743 () Bool)

(assert (=> start!113440 m!1233743))

(declare-fun m!1233745 () Bool)

(assert (=> b!1346667 m!1233745))

(check-sat (not b!1346668) (not b!1346664) (not start!113440) tp_is_empty!37491 b_and!50779 (not mapNonEmpty!57943) (not b!1346667) (not b_next!31491))
(check-sat b_and!50779 (not b_next!31491))
