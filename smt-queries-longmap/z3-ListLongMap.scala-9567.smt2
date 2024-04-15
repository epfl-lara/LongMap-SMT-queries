; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113264 () Bool)

(assert start!113264)

(declare-fun b_free!31315 () Bool)

(declare-fun b_next!31315 () Bool)

(assert (=> start!113264 (= b_free!31315 (not b_next!31315))))

(declare-fun tp!109750 () Bool)

(declare-fun b_and!50519 () Bool)

(assert (=> start!113264 (= tp!109750 b_and!50519)))

(declare-fun mapNonEmpty!57679 () Bool)

(declare-fun mapRes!57679 () Bool)

(declare-fun tp!109751 () Bool)

(declare-fun e!764808 () Bool)

(assert (=> mapNonEmpty!57679 (= mapRes!57679 (and tp!109751 e!764808))))

(declare-datatypes ((V!54857 0))(
  ( (V!54858 (val!18732 Int)) )
))
(declare-datatypes ((ValueCell!17759 0))(
  ( (ValueCellFull!17759 (v!21379 V!54857)) (EmptyCell!17759) )
))
(declare-fun mapRest!57679 () (Array (_ BitVec 32) ValueCell!17759))

(declare-fun mapKey!57679 () (_ BitVec 32))

(declare-fun mapValue!57679 () ValueCell!17759)

(declare-datatypes ((array!91417 0))(
  ( (array!91418 (arr!44165 (Array (_ BitVec 32) ValueCell!17759)) (size!44717 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91417)

(assert (=> mapNonEmpty!57679 (= (arr!44165 _values!1303) (store mapRest!57679 mapKey!57679 mapValue!57679))))

(declare-fun b!1343801 () Bool)

(declare-fun res!891613 () Bool)

(declare-fun e!764807 () Bool)

(assert (=> b!1343801 (=> (not res!891613) (not e!764807))))

(declare-datatypes ((array!91419 0))(
  ( (array!91420 (arr!44166 (Array (_ BitVec 32) (_ BitVec 64))) (size!44718 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91419)

(declare-datatypes ((List!31339 0))(
  ( (Nil!31336) (Cons!31335 (h!32544 (_ BitVec 64)) (t!45855 List!31339)) )
))
(declare-fun arrayNoDuplicates!0 (array!91419 (_ BitVec 32) List!31339) Bool)

(assert (=> b!1343801 (= res!891613 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31336))))

(declare-fun b!1343802 () Bool)

(declare-fun res!891616 () Bool)

(assert (=> b!1343802 (=> (not res!891616) (not e!764807))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91419 (_ BitVec 32)) Bool)

(assert (=> b!1343802 (= res!891616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57679 () Bool)

(assert (=> mapIsEmpty!57679 mapRes!57679))

(declare-fun b!1343804 () Bool)

(declare-fun tp_is_empty!37315 () Bool)

(assert (=> b!1343804 (= e!764808 tp_is_empty!37315)))

(declare-fun b!1343805 () Bool)

(declare-fun res!891615 () Bool)

(assert (=> b!1343805 (=> (not res!891615) (not e!764807))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343805 (= res!891615 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44718 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343806 () Bool)

(declare-fun res!891614 () Bool)

(assert (=> b!1343806 (=> (not res!891614) (not e!764807))))

(assert (=> b!1343806 (= res!891614 (and (= (size!44717 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44718 _keys!1571) (size!44717 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!891612 () Bool)

(assert (=> start!113264 (=> (not res!891612) (not e!764807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113264 (= res!891612 (validMask!0 mask!1977))))

(assert (=> start!113264 e!764807))

(assert (=> start!113264 tp_is_empty!37315))

(assert (=> start!113264 true))

(declare-fun array_inv!33479 (array!91419) Bool)

(assert (=> start!113264 (array_inv!33479 _keys!1571)))

(declare-fun e!764809 () Bool)

(declare-fun array_inv!33480 (array!91417) Bool)

(assert (=> start!113264 (and (array_inv!33480 _values!1303) e!764809)))

(assert (=> start!113264 tp!109750))

(declare-fun b!1343803 () Bool)

(declare-fun e!764806 () Bool)

(assert (=> b!1343803 (= e!764806 tp_is_empty!37315)))

(declare-fun b!1343807 () Bool)

(assert (=> b!1343807 (= e!764809 (and e!764806 mapRes!57679))))

(declare-fun condMapEmpty!57679 () Bool)

(declare-fun mapDefault!57679 () ValueCell!17759)

(assert (=> b!1343807 (= condMapEmpty!57679 (= (arr!44165 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17759)) mapDefault!57679)))))

(declare-fun b!1343808 () Bool)

(assert (=> b!1343808 (= e!764807 false)))

(declare-fun minValue!1245 () V!54857)

(declare-fun lt!594936 () Bool)

(declare-fun zeroValue!1245 () V!54857)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24198 0))(
  ( (tuple2!24199 (_1!12110 (_ BitVec 64)) (_2!12110 V!54857)) )
))
(declare-datatypes ((List!31340 0))(
  ( (Nil!31337) (Cons!31336 (h!32545 tuple2!24198) (t!45856 List!31340)) )
))
(declare-datatypes ((ListLongMap!21855 0))(
  ( (ListLongMap!21856 (toList!10943 List!31340)) )
))
(declare-fun contains!9048 (ListLongMap!21855 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5789 (array!91419 array!91417 (_ BitVec 32) (_ BitVec 32) V!54857 V!54857 (_ BitVec 32) Int) ListLongMap!21855)

(assert (=> b!1343808 (= lt!594936 (contains!9048 (getCurrentListMap!5789 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113264 res!891612) b!1343806))

(assert (= (and b!1343806 res!891614) b!1343802))

(assert (= (and b!1343802 res!891616) b!1343801))

(assert (= (and b!1343801 res!891613) b!1343805))

(assert (= (and b!1343805 res!891615) b!1343808))

(assert (= (and b!1343807 condMapEmpty!57679) mapIsEmpty!57679))

(assert (= (and b!1343807 (not condMapEmpty!57679)) mapNonEmpty!57679))

(get-info :version)

(assert (= (and mapNonEmpty!57679 ((_ is ValueCellFull!17759) mapValue!57679)) b!1343804))

(assert (= (and b!1343807 ((_ is ValueCellFull!17759) mapDefault!57679)) b!1343803))

(assert (= start!113264 b!1343807))

(declare-fun m!1231147 () Bool)

(assert (=> b!1343801 m!1231147))

(declare-fun m!1231149 () Bool)

(assert (=> b!1343808 m!1231149))

(assert (=> b!1343808 m!1231149))

(declare-fun m!1231151 () Bool)

(assert (=> b!1343808 m!1231151))

(declare-fun m!1231153 () Bool)

(assert (=> b!1343802 m!1231153))

(declare-fun m!1231155 () Bool)

(assert (=> mapNonEmpty!57679 m!1231155))

(declare-fun m!1231157 () Bool)

(assert (=> start!113264 m!1231157))

(declare-fun m!1231159 () Bool)

(assert (=> start!113264 m!1231159))

(declare-fun m!1231161 () Bool)

(assert (=> start!113264 m!1231161))

(check-sat (not b!1343801) (not b_next!31315) b_and!50519 tp_is_empty!37315 (not start!113264) (not b!1343808) (not b!1343802) (not mapNonEmpty!57679))
(check-sat b_and!50519 (not b_next!31315))
