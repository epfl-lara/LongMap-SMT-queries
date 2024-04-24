; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113560 () Bool)

(assert start!113560)

(declare-fun b_free!31387 () Bool)

(declare-fun b_next!31387 () Bool)

(assert (=> start!113560 (= b_free!31387 (not b_next!31387))))

(declare-fun tp!109966 () Bool)

(declare-fun b_and!50629 () Bool)

(assert (=> start!113560 (= tp!109966 b_and!50629)))

(declare-fun b!1346217 () Bool)

(declare-fun res!892868 () Bool)

(declare-fun e!766236 () Bool)

(assert (=> b!1346217 (=> (not res!892868) (not e!766236))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91721 0))(
  ( (array!91722 (arr!44312 (Array (_ BitVec 32) (_ BitVec 64))) (size!44863 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91721)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54953 0))(
  ( (V!54954 (val!18768 Int)) )
))
(declare-datatypes ((ValueCell!17795 0))(
  ( (ValueCellFull!17795 (v!21411 V!54953)) (EmptyCell!17795) )
))
(declare-datatypes ((array!91723 0))(
  ( (array!91724 (arr!44313 (Array (_ BitVec 32) ValueCell!17795)) (size!44864 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91723)

(assert (=> b!1346217 (= res!892868 (and (= (size!44864 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44863 _keys!1571) (size!44864 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!892873 () Bool)

(assert (=> start!113560 (=> (not res!892873) (not e!766236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113560 (= res!892873 (validMask!0 mask!1977))))

(assert (=> start!113560 e!766236))

(declare-fun tp_is_empty!37387 () Bool)

(assert (=> start!113560 tp_is_empty!37387))

(assert (=> start!113560 true))

(declare-fun array_inv!33661 (array!91721) Bool)

(assert (=> start!113560 (array_inv!33661 _keys!1571)))

(declare-fun e!766234 () Bool)

(declare-fun array_inv!33662 (array!91723) Bool)

(assert (=> start!113560 (and (array_inv!33662 _values!1303) e!766234)))

(assert (=> start!113560 tp!109966))

(declare-fun b!1346218 () Bool)

(declare-fun res!892865 () Bool)

(assert (=> b!1346218 (=> (not res!892865) (not e!766236))))

(declare-fun minValue!1245 () V!54953)

(declare-fun zeroValue!1245 () V!54953)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24230 0))(
  ( (tuple2!24231 (_1!12126 (_ BitVec 64)) (_2!12126 V!54953)) )
))
(declare-datatypes ((List!31374 0))(
  ( (Nil!31371) (Cons!31370 (h!32588 tuple2!24230) (t!45910 List!31374)) )
))
(declare-datatypes ((ListLongMap!21895 0))(
  ( (ListLongMap!21896 (toList!10963 List!31374)) )
))
(declare-fun contains!9151 (ListLongMap!21895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5905 (array!91721 array!91723 (_ BitVec 32) (_ BitVec 32) V!54953 V!54953 (_ BitVec 32) Int) ListLongMap!21895)

(assert (=> b!1346218 (= res!892865 (contains!9151 (getCurrentListMap!5905 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346219 () Bool)

(declare-fun e!766235 () Bool)

(assert (=> b!1346219 (= e!766235 (not true))))

(declare-fun lt!595719 () ListLongMap!21895)

(assert (=> b!1346219 (contains!9151 lt!595719 k0!1142)))

(declare-datatypes ((Unit!44046 0))(
  ( (Unit!44047) )
))
(declare-fun lt!595720 () Unit!44046)

(declare-fun lt!595721 () V!54953)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!379 ((_ BitVec 64) (_ BitVec 64) V!54953 ListLongMap!21895) Unit!44046)

(assert (=> b!1346219 (= lt!595720 (lemmaInListMapAfterAddingDiffThenInBefore!379 k0!1142 (select (arr!44312 _keys!1571) from!1960) lt!595721 lt!595719))))

(declare-fun b!1346220 () Bool)

(declare-fun e!766237 () Bool)

(assert (=> b!1346220 (= e!766237 tp_is_empty!37387)))

(declare-fun b!1346221 () Bool)

(declare-fun res!892872 () Bool)

(assert (=> b!1346221 (=> (not res!892872) (not e!766236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91721 (_ BitVec 32)) Bool)

(assert (=> b!1346221 (= res!892872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57787 () Bool)

(declare-fun mapRes!57787 () Bool)

(declare-fun tp!109965 () Bool)

(assert (=> mapNonEmpty!57787 (= mapRes!57787 (and tp!109965 e!766237))))

(declare-fun mapRest!57787 () (Array (_ BitVec 32) ValueCell!17795))

(declare-fun mapKey!57787 () (_ BitVec 32))

(declare-fun mapValue!57787 () ValueCell!17795)

(assert (=> mapNonEmpty!57787 (= (arr!44313 _values!1303) (store mapRest!57787 mapKey!57787 mapValue!57787))))

(declare-fun b!1346222 () Bool)

(declare-fun res!892867 () Bool)

(assert (=> b!1346222 (=> (not res!892867) (not e!766236))))

(declare-datatypes ((List!31375 0))(
  ( (Nil!31372) (Cons!31371 (h!32589 (_ BitVec 64)) (t!45911 List!31375)) )
))
(declare-fun arrayNoDuplicates!0 (array!91721 (_ BitVec 32) List!31375) Bool)

(assert (=> b!1346222 (= res!892867 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31372))))

(declare-fun b!1346223 () Bool)

(declare-fun res!892869 () Bool)

(assert (=> b!1346223 (=> (not res!892869) (not e!766236))))

(assert (=> b!1346223 (= res!892869 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44863 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346224 () Bool)

(declare-fun res!892874 () Bool)

(assert (=> b!1346224 (=> (not res!892874) (not e!766235))))

(assert (=> b!1346224 (= res!892874 (not (= k0!1142 (select (arr!44312 _keys!1571) from!1960))))))

(declare-fun b!1346225 () Bool)

(declare-fun res!892866 () Bool)

(assert (=> b!1346225 (=> (not res!892866) (not e!766236))))

(assert (=> b!1346225 (= res!892866 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1346226 () Bool)

(declare-fun e!766238 () Bool)

(assert (=> b!1346226 (= e!766238 tp_is_empty!37387)))

(declare-fun mapIsEmpty!57787 () Bool)

(assert (=> mapIsEmpty!57787 mapRes!57787))

(declare-fun b!1346227 () Bool)

(assert (=> b!1346227 (= e!766236 e!766235)))

(declare-fun res!892871 () Bool)

(assert (=> b!1346227 (=> (not res!892871) (not e!766235))))

(declare-fun +!4858 (ListLongMap!21895 tuple2!24230) ListLongMap!21895)

(assert (=> b!1346227 (= res!892871 (contains!9151 (+!4858 lt!595719 (tuple2!24231 (select (arr!44312 _keys!1571) from!1960) lt!595721)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6507 (array!91721 array!91723 (_ BitVec 32) (_ BitVec 32) V!54953 V!54953 (_ BitVec 32) Int) ListLongMap!21895)

(assert (=> b!1346227 (= lt!595719 (getCurrentListMapNoExtraKeys!6507 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22396 (ValueCell!17795 V!54953) V!54953)

(declare-fun dynLambda!3812 (Int (_ BitVec 64)) V!54953)

(assert (=> b!1346227 (= lt!595721 (get!22396 (select (arr!44313 _values!1303) from!1960) (dynLambda!3812 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1346228 () Bool)

(declare-fun res!892870 () Bool)

(assert (=> b!1346228 (=> (not res!892870) (not e!766236))))

(assert (=> b!1346228 (= res!892870 (not (= (select (arr!44312 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1346229 () Bool)

(declare-fun res!892864 () Bool)

(assert (=> b!1346229 (=> (not res!892864) (not e!766236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346229 (= res!892864 (validKeyInArray!0 (select (arr!44312 _keys!1571) from!1960)))))

(declare-fun b!1346230 () Bool)

(assert (=> b!1346230 (= e!766234 (and e!766238 mapRes!57787))))

(declare-fun condMapEmpty!57787 () Bool)

(declare-fun mapDefault!57787 () ValueCell!17795)

(assert (=> b!1346230 (= condMapEmpty!57787 (= (arr!44313 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17795)) mapDefault!57787)))))

(assert (= (and start!113560 res!892873) b!1346217))

(assert (= (and b!1346217 res!892868) b!1346221))

(assert (= (and b!1346221 res!892872) b!1346222))

(assert (= (and b!1346222 res!892867) b!1346223))

(assert (= (and b!1346223 res!892869) b!1346218))

(assert (= (and b!1346218 res!892865) b!1346228))

(assert (= (and b!1346228 res!892870) b!1346229))

(assert (= (and b!1346229 res!892864) b!1346225))

(assert (= (and b!1346225 res!892866) b!1346227))

(assert (= (and b!1346227 res!892871) b!1346224))

(assert (= (and b!1346224 res!892874) b!1346219))

(assert (= (and b!1346230 condMapEmpty!57787) mapIsEmpty!57787))

(assert (= (and b!1346230 (not condMapEmpty!57787)) mapNonEmpty!57787))

(get-info :version)

(assert (= (and mapNonEmpty!57787 ((_ is ValueCellFull!17795) mapValue!57787)) b!1346220))

(assert (= (and b!1346230 ((_ is ValueCellFull!17795) mapDefault!57787)) b!1346226))

(assert (= start!113560 b!1346230))

(declare-fun b_lambda!24503 () Bool)

(assert (=> (not b_lambda!24503) (not b!1346227)))

(declare-fun t!45909 () Bool)

(declare-fun tb!12339 () Bool)

(assert (=> (and start!113560 (= defaultEntry!1306 defaultEntry!1306) t!45909) tb!12339))

(declare-fun result!25777 () Bool)

(assert (=> tb!12339 (= result!25777 tp_is_empty!37387)))

(assert (=> b!1346227 t!45909))

(declare-fun b_and!50631 () Bool)

(assert (= b_and!50629 (and (=> t!45909 result!25777) b_and!50631)))

(declare-fun m!1234005 () Bool)

(assert (=> b!1346229 m!1234005))

(assert (=> b!1346229 m!1234005))

(declare-fun m!1234007 () Bool)

(assert (=> b!1346229 m!1234007))

(declare-fun m!1234009 () Bool)

(assert (=> b!1346219 m!1234009))

(assert (=> b!1346219 m!1234005))

(assert (=> b!1346219 m!1234005))

(declare-fun m!1234011 () Bool)

(assert (=> b!1346219 m!1234011))

(declare-fun m!1234013 () Bool)

(assert (=> mapNonEmpty!57787 m!1234013))

(declare-fun m!1234015 () Bool)

(assert (=> b!1346221 m!1234015))

(declare-fun m!1234017 () Bool)

(assert (=> start!113560 m!1234017))

(declare-fun m!1234019 () Bool)

(assert (=> start!113560 m!1234019))

(declare-fun m!1234021 () Bool)

(assert (=> start!113560 m!1234021))

(declare-fun m!1234023 () Bool)

(assert (=> b!1346227 m!1234023))

(declare-fun m!1234025 () Bool)

(assert (=> b!1346227 m!1234025))

(declare-fun m!1234027 () Bool)

(assert (=> b!1346227 m!1234027))

(declare-fun m!1234029 () Bool)

(assert (=> b!1346227 m!1234029))

(assert (=> b!1346227 m!1234025))

(declare-fun m!1234031 () Bool)

(assert (=> b!1346227 m!1234031))

(declare-fun m!1234033 () Bool)

(assert (=> b!1346227 m!1234033))

(assert (=> b!1346227 m!1234027))

(assert (=> b!1346227 m!1234031))

(assert (=> b!1346227 m!1234005))

(declare-fun m!1234035 () Bool)

(assert (=> b!1346218 m!1234035))

(assert (=> b!1346218 m!1234035))

(declare-fun m!1234037 () Bool)

(assert (=> b!1346218 m!1234037))

(assert (=> b!1346224 m!1234005))

(assert (=> b!1346228 m!1234005))

(declare-fun m!1234039 () Bool)

(assert (=> b!1346222 m!1234039))

(check-sat (not b_lambda!24503) (not b!1346229) (not b!1346218) (not b!1346222) (not b!1346219) (not start!113560) (not mapNonEmpty!57787) (not b!1346221) (not b_next!31387) b_and!50631 (not b!1346227) tp_is_empty!37387)
(check-sat b_and!50631 (not b_next!31387))
