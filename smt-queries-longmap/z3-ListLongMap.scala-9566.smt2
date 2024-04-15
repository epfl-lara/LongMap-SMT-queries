; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113258 () Bool)

(assert start!113258)

(declare-fun b_free!31309 () Bool)

(declare-fun b_next!31309 () Bool)

(assert (=> start!113258 (= b_free!31309 (not b_next!31309))))

(declare-fun tp!109733 () Bool)

(declare-fun b_and!50507 () Bool)

(assert (=> start!113258 (= tp!109733 b_and!50507)))

(declare-fun b!1343695 () Bool)

(declare-fun res!891544 () Bool)

(declare-fun e!764764 () Bool)

(assert (=> b!1343695 (=> (not res!891544) (not e!764764))))

(declare-datatypes ((array!91405 0))(
  ( (array!91406 (arr!44159 (Array (_ BitVec 32) (_ BitVec 64))) (size!44711 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91405)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91405 (_ BitVec 32)) Bool)

(assert (=> b!1343695 (= res!891544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57670 () Bool)

(declare-fun mapRes!57670 () Bool)

(declare-fun tp!109732 () Bool)

(declare-fun e!764765 () Bool)

(assert (=> mapNonEmpty!57670 (= mapRes!57670 (and tp!109732 e!764765))))

(declare-datatypes ((V!54849 0))(
  ( (V!54850 (val!18729 Int)) )
))
(declare-datatypes ((ValueCell!17756 0))(
  ( (ValueCellFull!17756 (v!21376 V!54849)) (EmptyCell!17756) )
))
(declare-fun mapValue!57670 () ValueCell!17756)

(declare-fun mapRest!57670 () (Array (_ BitVec 32) ValueCell!17756))

(declare-fun mapKey!57670 () (_ BitVec 32))

(declare-datatypes ((array!91407 0))(
  ( (array!91408 (arr!44160 (Array (_ BitVec 32) ValueCell!17756)) (size!44712 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91407)

(assert (=> mapNonEmpty!57670 (= (arr!44160 _values!1303) (store mapRest!57670 mapKey!57670 mapValue!57670))))

(declare-fun b!1343696 () Bool)

(declare-fun res!891540 () Bool)

(assert (=> b!1343696 (=> (not res!891540) (not e!764764))))

(declare-fun minValue!1245 () V!54849)

(declare-fun zeroValue!1245 () V!54849)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24194 0))(
  ( (tuple2!24195 (_1!12108 (_ BitVec 64)) (_2!12108 V!54849)) )
))
(declare-datatypes ((List!31334 0))(
  ( (Nil!31331) (Cons!31330 (h!32539 tuple2!24194) (t!45846 List!31334)) )
))
(declare-datatypes ((ListLongMap!21851 0))(
  ( (ListLongMap!21852 (toList!10941 List!31334)) )
))
(declare-fun contains!9046 (ListLongMap!21851 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5787 (array!91405 array!91407 (_ BitVec 32) (_ BitVec 32) V!54849 V!54849 (_ BitVec 32) Int) ListLongMap!21851)

(assert (=> b!1343696 (= res!891540 (contains!9046 (getCurrentListMap!5787 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343697 () Bool)

(declare-fun res!891545 () Bool)

(assert (=> b!1343697 (=> (not res!891545) (not e!764764))))

(assert (=> b!1343697 (= res!891545 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44711 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!891546 () Bool)

(assert (=> start!113258 (=> (not res!891546) (not e!764764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113258 (= res!891546 (validMask!0 mask!1977))))

(assert (=> start!113258 e!764764))

(declare-fun tp_is_empty!37309 () Bool)

(assert (=> start!113258 tp_is_empty!37309))

(assert (=> start!113258 true))

(declare-fun array_inv!33475 (array!91405) Bool)

(assert (=> start!113258 (array_inv!33475 _keys!1571)))

(declare-fun e!764761 () Bool)

(declare-fun array_inv!33476 (array!91407) Bool)

(assert (=> start!113258 (and (array_inv!33476 _values!1303) e!764761)))

(assert (=> start!113258 tp!109733))

(declare-fun b!1343698 () Bool)

(declare-fun res!891539 () Bool)

(assert (=> b!1343698 (=> (not res!891539) (not e!764764))))

(assert (=> b!1343698 (= res!891539 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343699 () Bool)

(declare-fun res!891543 () Bool)

(assert (=> b!1343699 (=> (not res!891543) (not e!764764))))

(assert (=> b!1343699 (= res!891543 (and (= (size!44712 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44711 _keys!1571) (size!44712 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343700 () Bool)

(declare-fun res!891542 () Bool)

(assert (=> b!1343700 (=> (not res!891542) (not e!764764))))

(assert (=> b!1343700 (= res!891542 (not (= (select (arr!44159 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343701 () Bool)

(declare-fun res!891541 () Bool)

(assert (=> b!1343701 (=> (not res!891541) (not e!764764))))

(declare-datatypes ((List!31335 0))(
  ( (Nil!31332) (Cons!31331 (h!32540 (_ BitVec 64)) (t!45847 List!31335)) )
))
(declare-fun arrayNoDuplicates!0 (array!91405 (_ BitVec 32) List!31335) Bool)

(assert (=> b!1343701 (= res!891541 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31332))))

(declare-fun b!1343702 () Bool)

(assert (=> b!1343702 (= e!764764 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-fun lt!594897 () ListLongMap!21851)

(declare-fun +!4840 (ListLongMap!21851 tuple2!24194) ListLongMap!21851)

(assert (=> b!1343702 (contains!9046 (+!4840 lt!594897 (tuple2!24195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!43922 0))(
  ( (Unit!43923) )
))
(declare-fun lt!594894 () Unit!43922)

(declare-fun addStillContains!1204 (ListLongMap!21851 (_ BitVec 64) V!54849 (_ BitVec 64)) Unit!43922)

(assert (=> b!1343702 (= lt!594894 (addStillContains!1204 lt!594897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343702 (contains!9046 lt!594897 k0!1142)))

(declare-fun lt!594895 () Unit!43922)

(declare-fun lt!594892 () V!54849)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!379 ((_ BitVec 64) (_ BitVec 64) V!54849 ListLongMap!21851) Unit!43922)

(assert (=> b!1343702 (= lt!594895 (lemmaInListMapAfterAddingDiffThenInBefore!379 k0!1142 (select (arr!44159 _keys!1571) from!1960) lt!594892 lt!594897))))

(declare-fun lt!594896 () ListLongMap!21851)

(assert (=> b!1343702 (contains!9046 lt!594896 k0!1142)))

(declare-fun lt!594893 () Unit!43922)

(assert (=> b!1343702 (= lt!594893 (lemmaInListMapAfterAddingDiffThenInBefore!379 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594896))))

(assert (=> b!1343702 (= lt!594896 (+!4840 lt!594897 (tuple2!24195 (select (arr!44159 _keys!1571) from!1960) lt!594892)))))

(declare-fun get!22316 (ValueCell!17756 V!54849) V!54849)

(declare-fun dynLambda!3770 (Int (_ BitVec 64)) V!54849)

(assert (=> b!1343702 (= lt!594892 (get!22316 (select (arr!44160 _values!1303) from!1960) (dynLambda!3770 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6483 (array!91405 array!91407 (_ BitVec 32) (_ BitVec 32) V!54849 V!54849 (_ BitVec 32) Int) ListLongMap!21851)

(assert (=> b!1343702 (= lt!594897 (getCurrentListMapNoExtraKeys!6483 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun mapIsEmpty!57670 () Bool)

(assert (=> mapIsEmpty!57670 mapRes!57670))

(declare-fun b!1343703 () Bool)

(assert (=> b!1343703 (= e!764765 tp_is_empty!37309)))

(declare-fun b!1343704 () Bool)

(declare-fun e!764763 () Bool)

(assert (=> b!1343704 (= e!764761 (and e!764763 mapRes!57670))))

(declare-fun condMapEmpty!57670 () Bool)

(declare-fun mapDefault!57670 () ValueCell!17756)

(assert (=> b!1343704 (= condMapEmpty!57670 (= (arr!44160 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17756)) mapDefault!57670)))))

(declare-fun b!1343705 () Bool)

(declare-fun res!891547 () Bool)

(assert (=> b!1343705 (=> (not res!891547) (not e!764764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343705 (= res!891547 (validKeyInArray!0 (select (arr!44159 _keys!1571) from!1960)))))

(declare-fun b!1343706 () Bool)

(assert (=> b!1343706 (= e!764763 tp_is_empty!37309)))

(assert (= (and start!113258 res!891546) b!1343699))

(assert (= (and b!1343699 res!891543) b!1343695))

(assert (= (and b!1343695 res!891544) b!1343701))

(assert (= (and b!1343701 res!891541) b!1343697))

(assert (= (and b!1343697 res!891545) b!1343696))

(assert (= (and b!1343696 res!891540) b!1343700))

(assert (= (and b!1343700 res!891542) b!1343705))

(assert (= (and b!1343705 res!891547) b!1343698))

(assert (= (and b!1343698 res!891539) b!1343702))

(assert (= (and b!1343704 condMapEmpty!57670) mapIsEmpty!57670))

(assert (= (and b!1343704 (not condMapEmpty!57670)) mapNonEmpty!57670))

(get-info :version)

(assert (= (and mapNonEmpty!57670 ((_ is ValueCellFull!17756) mapValue!57670)) b!1343703))

(assert (= (and b!1343704 ((_ is ValueCellFull!17756) mapDefault!57670)) b!1343706))

(assert (= start!113258 b!1343704))

(declare-fun b_lambda!24475 () Bool)

(assert (=> (not b_lambda!24475) (not b!1343702)))

(declare-fun t!45845 () Bool)

(declare-fun tb!12315 () Bool)

(assert (=> (and start!113258 (= defaultEntry!1306 defaultEntry!1306) t!45845) tb!12315))

(declare-fun result!25729 () Bool)

(assert (=> tb!12315 (= result!25729 tp_is_empty!37309)))

(assert (=> b!1343702 t!45845))

(declare-fun b_and!50509 () Bool)

(assert (= b_and!50507 (and (=> t!45845 result!25729) b_and!50509)))

(declare-fun m!1231015 () Bool)

(assert (=> start!113258 m!1231015))

(declare-fun m!1231017 () Bool)

(assert (=> start!113258 m!1231017))

(declare-fun m!1231019 () Bool)

(assert (=> start!113258 m!1231019))

(declare-fun m!1231021 () Bool)

(assert (=> b!1343702 m!1231021))

(declare-fun m!1231023 () Bool)

(assert (=> b!1343702 m!1231023))

(declare-fun m!1231025 () Bool)

(assert (=> b!1343702 m!1231025))

(declare-fun m!1231027 () Bool)

(assert (=> b!1343702 m!1231027))

(declare-fun m!1231029 () Bool)

(assert (=> b!1343702 m!1231029))

(declare-fun m!1231031 () Bool)

(assert (=> b!1343702 m!1231031))

(assert (=> b!1343702 m!1231027))

(declare-fun m!1231033 () Bool)

(assert (=> b!1343702 m!1231033))

(declare-fun m!1231035 () Bool)

(assert (=> b!1343702 m!1231035))

(assert (=> b!1343702 m!1231033))

(declare-fun m!1231037 () Bool)

(assert (=> b!1343702 m!1231037))

(declare-fun m!1231039 () Bool)

(assert (=> b!1343702 m!1231039))

(assert (=> b!1343702 m!1231037))

(declare-fun m!1231041 () Bool)

(assert (=> b!1343702 m!1231041))

(declare-fun m!1231043 () Bool)

(assert (=> b!1343702 m!1231043))

(assert (=> b!1343702 m!1231029))

(declare-fun m!1231045 () Bool)

(assert (=> b!1343702 m!1231045))

(declare-fun m!1231047 () Bool)

(assert (=> b!1343696 m!1231047))

(assert (=> b!1343696 m!1231047))

(declare-fun m!1231049 () Bool)

(assert (=> b!1343696 m!1231049))

(declare-fun m!1231051 () Bool)

(assert (=> mapNonEmpty!57670 m!1231051))

(assert (=> b!1343705 m!1231033))

(assert (=> b!1343705 m!1231033))

(declare-fun m!1231053 () Bool)

(assert (=> b!1343705 m!1231053))

(declare-fun m!1231055 () Bool)

(assert (=> b!1343701 m!1231055))

(assert (=> b!1343700 m!1231033))

(declare-fun m!1231057 () Bool)

(assert (=> b!1343695 m!1231057))

(check-sat (not b!1343705) (not b!1343701) (not start!113258) b_and!50509 (not b_next!31309) (not b_lambda!24475) (not mapNonEmpty!57670) (not b!1343695) (not b!1343696) tp_is_empty!37309 (not b!1343702))
(check-sat b_and!50509 (not b_next!31309))
