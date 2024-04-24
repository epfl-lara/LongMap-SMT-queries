; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109470 () Bool)

(assert start!109470)

(declare-fun b_free!28735 () Bool)

(declare-fun b_next!28735 () Bool)

(assert (=> start!109470 (= b_free!28735 (not b_next!28735))))

(declare-fun tp!101324 () Bool)

(declare-fun b_and!46827 () Bool)

(assert (=> start!109470 (= tp!101324 b_and!46827)))

(declare-fun b!1293753 () Bool)

(declare-fun res!859280 () Bool)

(declare-fun e!738534 () Bool)

(assert (=> b!1293753 (=> (not res!859280) (not e!738534))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50937 0))(
  ( (V!50938 (val!17262 Int)) )
))
(declare-datatypes ((ValueCell!16289 0))(
  ( (ValueCellFull!16289 (v!19860 V!50937)) (EmptyCell!16289) )
))
(declare-datatypes ((array!85815 0))(
  ( (array!85816 (arr!41404 (Array (_ BitVec 32) ValueCell!16289)) (size!41955 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85815)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85817 0))(
  ( (array!85818 (arr!41405 (Array (_ BitVec 32) (_ BitVec 64))) (size!41956 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85817)

(assert (=> b!1293753 (= res!859280 (and (= (size!41955 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41956 _keys!1741) (size!41955 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293754 () Bool)

(declare-fun res!859283 () Bool)

(assert (=> b!1293754 (=> (not res!859283) (not e!738534))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293754 (= res!859283 (not (validKeyInArray!0 (select (arr!41405 _keys!1741) from!2144))))))

(declare-fun b!1293755 () Bool)

(declare-fun res!859285 () Bool)

(assert (=> b!1293755 (=> (not res!859285) (not e!738534))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1293755 (= res!859285 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41956 _keys!1741))))))

(declare-fun b!1293756 () Bool)

(declare-fun e!738537 () Bool)

(declare-fun tp_is_empty!34375 () Bool)

(assert (=> b!1293756 (= e!738537 tp_is_empty!34375)))

(declare-fun b!1293757 () Bool)

(declare-fun res!859284 () Bool)

(assert (=> b!1293757 (=> (not res!859284) (not e!738534))))

(declare-fun minValue!1387 () V!50937)

(declare-fun zeroValue!1387 () V!50937)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22224 0))(
  ( (tuple2!22225 (_1!11123 (_ BitVec 64)) (_2!11123 V!50937)) )
))
(declare-datatypes ((List!29392 0))(
  ( (Nil!29389) (Cons!29388 (h!30606 tuple2!22224) (t!42948 List!29392)) )
))
(declare-datatypes ((ListLongMap!19889 0))(
  ( (ListLongMap!19890 (toList!9960 List!29392)) )
))
(declare-fun contains!8091 (ListLongMap!19889 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4992 (array!85817 array!85815 (_ BitVec 32) (_ BitVec 32) V!50937 V!50937 (_ BitVec 32) Int) ListLongMap!19889)

(assert (=> b!1293757 (= res!859284 (contains!8091 (getCurrentListMap!4992 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293758 () Bool)

(assert (=> b!1293758 (= e!738534 (not true))))

(assert (=> b!1293758 (not (contains!8091 (ListLongMap!19890 Nil!29389) k0!1205))))

(declare-datatypes ((Unit!42759 0))(
  ( (Unit!42760) )
))
(declare-fun lt!579822 () Unit!42759)

(declare-fun emptyContainsNothing!125 ((_ BitVec 64)) Unit!42759)

(assert (=> b!1293758 (= lt!579822 (emptyContainsNothing!125 k0!1205))))

(declare-fun mapNonEmpty!53123 () Bool)

(declare-fun mapRes!53123 () Bool)

(declare-fun tp!101323 () Bool)

(assert (=> mapNonEmpty!53123 (= mapRes!53123 (and tp!101323 e!738537))))

(declare-fun mapValue!53123 () ValueCell!16289)

(declare-fun mapKey!53123 () (_ BitVec 32))

(declare-fun mapRest!53123 () (Array (_ BitVec 32) ValueCell!16289))

(assert (=> mapNonEmpty!53123 (= (arr!41404 _values!1445) (store mapRest!53123 mapKey!53123 mapValue!53123))))

(declare-fun b!1293759 () Bool)

(declare-fun e!738536 () Bool)

(declare-fun e!738535 () Bool)

(assert (=> b!1293759 (= e!738536 (and e!738535 mapRes!53123))))

(declare-fun condMapEmpty!53123 () Bool)

(declare-fun mapDefault!53123 () ValueCell!16289)

(assert (=> b!1293759 (= condMapEmpty!53123 (= (arr!41404 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16289)) mapDefault!53123)))))

(declare-fun b!1293760 () Bool)

(declare-fun res!859281 () Bool)

(assert (=> b!1293760 (=> (not res!859281) (not e!738534))))

(assert (=> b!1293760 (= res!859281 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41956 _keys!1741))))))

(declare-fun b!1293761 () Bool)

(declare-fun res!859278 () Bool)

(assert (=> b!1293761 (=> (not res!859278) (not e!738534))))

(declare-datatypes ((List!29393 0))(
  ( (Nil!29390) (Cons!29389 (h!30607 (_ BitVec 64)) (t!42949 List!29393)) )
))
(declare-fun arrayNoDuplicates!0 (array!85817 (_ BitVec 32) List!29393) Bool)

(assert (=> b!1293761 (= res!859278 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29390))))

(declare-fun res!859282 () Bool)

(assert (=> start!109470 (=> (not res!859282) (not e!738534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109470 (= res!859282 (validMask!0 mask!2175))))

(assert (=> start!109470 e!738534))

(assert (=> start!109470 tp_is_empty!34375))

(assert (=> start!109470 true))

(declare-fun array_inv!31599 (array!85815) Bool)

(assert (=> start!109470 (and (array_inv!31599 _values!1445) e!738536)))

(declare-fun array_inv!31600 (array!85817) Bool)

(assert (=> start!109470 (array_inv!31600 _keys!1741)))

(assert (=> start!109470 tp!101324))

(declare-fun mapIsEmpty!53123 () Bool)

(assert (=> mapIsEmpty!53123 mapRes!53123))

(declare-fun b!1293762 () Bool)

(assert (=> b!1293762 (= e!738535 tp_is_empty!34375)))

(declare-fun b!1293763 () Bool)

(declare-fun res!859279 () Bool)

(assert (=> b!1293763 (=> (not res!859279) (not e!738534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85817 (_ BitVec 32)) Bool)

(assert (=> b!1293763 (= res!859279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109470 res!859282) b!1293753))

(assert (= (and b!1293753 res!859280) b!1293763))

(assert (= (and b!1293763 res!859279) b!1293761))

(assert (= (and b!1293761 res!859278) b!1293760))

(assert (= (and b!1293760 res!859281) b!1293757))

(assert (= (and b!1293757 res!859284) b!1293755))

(assert (= (and b!1293755 res!859285) b!1293754))

(assert (= (and b!1293754 res!859283) b!1293758))

(assert (= (and b!1293759 condMapEmpty!53123) mapIsEmpty!53123))

(assert (= (and b!1293759 (not condMapEmpty!53123)) mapNonEmpty!53123))

(get-info :version)

(assert (= (and mapNonEmpty!53123 ((_ is ValueCellFull!16289) mapValue!53123)) b!1293756))

(assert (= (and b!1293759 ((_ is ValueCellFull!16289) mapDefault!53123)) b!1293762))

(assert (= start!109470 b!1293759))

(declare-fun m!1186617 () Bool)

(assert (=> mapNonEmpty!53123 m!1186617))

(declare-fun m!1186619 () Bool)

(assert (=> b!1293763 m!1186619))

(declare-fun m!1186621 () Bool)

(assert (=> b!1293761 m!1186621))

(declare-fun m!1186623 () Bool)

(assert (=> b!1293757 m!1186623))

(assert (=> b!1293757 m!1186623))

(declare-fun m!1186625 () Bool)

(assert (=> b!1293757 m!1186625))

(declare-fun m!1186627 () Bool)

(assert (=> b!1293758 m!1186627))

(declare-fun m!1186629 () Bool)

(assert (=> b!1293758 m!1186629))

(declare-fun m!1186631 () Bool)

(assert (=> b!1293754 m!1186631))

(assert (=> b!1293754 m!1186631))

(declare-fun m!1186633 () Bool)

(assert (=> b!1293754 m!1186633))

(declare-fun m!1186635 () Bool)

(assert (=> start!109470 m!1186635))

(declare-fun m!1186637 () Bool)

(assert (=> start!109470 m!1186637))

(declare-fun m!1186639 () Bool)

(assert (=> start!109470 m!1186639))

(check-sat (not b!1293754) (not b!1293761) (not mapNonEmpty!53123) (not start!109470) (not b!1293763) (not b_next!28735) tp_is_empty!34375 (not b!1293758) b_and!46827 (not b!1293757))
(check-sat b_and!46827 (not b_next!28735))
