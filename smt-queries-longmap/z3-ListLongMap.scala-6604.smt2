; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83510 () Bool)

(assert start!83510)

(declare-fun b_free!19497 () Bool)

(declare-fun b_next!19497 () Bool)

(assert (=> start!83510 (= b_free!19497 (not b_next!19497))))

(declare-fun tp!67778 () Bool)

(declare-fun b_and!31099 () Bool)

(assert (=> start!83510 (= tp!67778 b_and!31099)))

(declare-fun b!975612 () Bool)

(declare-fun res!653102 () Bool)

(declare-fun e!549836 () Bool)

(assert (=> b!975612 (=> (not res!653102) (not e!549836))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34851 0))(
  ( (V!34852 (val!11251 Int)) )
))
(declare-datatypes ((ValueCell!10719 0))(
  ( (ValueCellFull!10719 (v!13810 V!34851)) (EmptyCell!10719) )
))
(declare-datatypes ((array!60833 0))(
  ( (array!60834 (arr!29280 (Array (_ BitVec 32) ValueCell!10719)) (size!29759 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60833)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60835 0))(
  ( (array!60836 (arr!29281 (Array (_ BitVec 32) (_ BitVec 64))) (size!29760 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60835)

(assert (=> b!975612 (= res!653102 (and (= (size!29759 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29760 _keys!1717) (size!29759 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975613 () Bool)

(declare-fun res!653107 () Bool)

(assert (=> b!975613 (=> (not res!653107) (not e!549836))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975613 (= res!653107 (validKeyInArray!0 (select (arr!29281 _keys!1717) i!822)))))

(declare-fun b!975614 () Bool)

(declare-fun e!549838 () Bool)

(declare-fun tp_is_empty!22401 () Bool)

(assert (=> b!975614 (= e!549838 tp_is_empty!22401)))

(declare-fun b!975615 () Bool)

(declare-fun e!549839 () Bool)

(assert (=> b!975615 (= e!549839 tp_is_empty!22401)))

(declare-fun b!975616 () Bool)

(declare-fun res!653109 () Bool)

(assert (=> b!975616 (=> (not res!653109) (not e!549836))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34851)

(declare-fun zeroValue!1367 () V!34851)

(declare-datatypes ((tuple2!14468 0))(
  ( (tuple2!14469 (_1!7245 (_ BitVec 64)) (_2!7245 V!34851)) )
))
(declare-datatypes ((List!20321 0))(
  ( (Nil!20318) (Cons!20317 (h!21479 tuple2!14468) (t!28798 List!20321)) )
))
(declare-datatypes ((ListLongMap!13165 0))(
  ( (ListLongMap!13166 (toList!6598 List!20321)) )
))
(declare-fun contains!5679 (ListLongMap!13165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3831 (array!60835 array!60833 (_ BitVec 32) (_ BitVec 32) V!34851 V!34851 (_ BitVec 32) Int) ListLongMap!13165)

(assert (=> b!975616 (= res!653109 (contains!5679 (getCurrentListMap!3831 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29281 _keys!1717) i!822)))))

(declare-fun b!975617 () Bool)

(declare-fun res!653106 () Bool)

(assert (=> b!975617 (=> (not res!653106) (not e!549836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60835 (_ BitVec 32)) Bool)

(assert (=> b!975617 (= res!653106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975618 () Bool)

(declare-fun e!549840 () Bool)

(assert (=> b!975618 (= e!549840 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29760 _keys!1717)))))

(declare-fun b!975619 () Bool)

(declare-fun e!549837 () Bool)

(declare-fun mapRes!35611 () Bool)

(assert (=> b!975619 (= e!549837 (and e!549838 mapRes!35611))))

(declare-fun condMapEmpty!35611 () Bool)

(declare-fun mapDefault!35611 () ValueCell!10719)

(assert (=> b!975619 (= condMapEmpty!35611 (= (arr!29280 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10719)) mapDefault!35611)))))

(declare-fun mapNonEmpty!35611 () Bool)

(declare-fun tp!67779 () Bool)

(assert (=> mapNonEmpty!35611 (= mapRes!35611 (and tp!67779 e!549839))))

(declare-fun mapValue!35611 () ValueCell!10719)

(declare-fun mapRest!35611 () (Array (_ BitVec 32) ValueCell!10719))

(declare-fun mapKey!35611 () (_ BitVec 32))

(assert (=> mapNonEmpty!35611 (= (arr!29280 _values!1425) (store mapRest!35611 mapKey!35611 mapValue!35611))))

(declare-fun mapIsEmpty!35611 () Bool)

(assert (=> mapIsEmpty!35611 mapRes!35611))

(declare-fun b!975620 () Bool)

(declare-fun res!653108 () Bool)

(assert (=> b!975620 (=> (not res!653108) (not e!549836))))

(declare-datatypes ((List!20322 0))(
  ( (Nil!20319) (Cons!20318 (h!21480 (_ BitVec 64)) (t!28799 List!20322)) )
))
(declare-fun arrayNoDuplicates!0 (array!60835 (_ BitVec 32) List!20322) Bool)

(assert (=> b!975620 (= res!653108 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20319))))

(declare-fun b!975621 () Bool)

(assert (=> b!975621 (= e!549836 e!549840)))

(declare-fun res!653104 () Bool)

(assert (=> b!975621 (=> (not res!653104) (not e!549840))))

(assert (=> b!975621 (= res!653104 (validKeyInArray!0 (select (arr!29281 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun lt!432881 () ListLongMap!13165)

(assert (=> b!975621 (= lt!432881 (getCurrentListMap!3831 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!653103 () Bool)

(assert (=> start!83510 (=> (not res!653103) (not e!549836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83510 (= res!653103 (validMask!0 mask!2147))))

(assert (=> start!83510 e!549836))

(assert (=> start!83510 true))

(declare-fun array_inv!22645 (array!60833) Bool)

(assert (=> start!83510 (and (array_inv!22645 _values!1425) e!549837)))

(assert (=> start!83510 tp_is_empty!22401))

(assert (=> start!83510 tp!67778))

(declare-fun array_inv!22646 (array!60835) Bool)

(assert (=> start!83510 (array_inv!22646 _keys!1717)))

(declare-fun b!975622 () Bool)

(declare-fun res!653105 () Bool)

(assert (=> b!975622 (=> (not res!653105) (not e!549836))))

(assert (=> b!975622 (= res!653105 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29760 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29760 _keys!1717))))))

(assert (= (and start!83510 res!653103) b!975612))

(assert (= (and b!975612 res!653102) b!975617))

(assert (= (and b!975617 res!653106) b!975620))

(assert (= (and b!975620 res!653108) b!975622))

(assert (= (and b!975622 res!653105) b!975613))

(assert (= (and b!975613 res!653107) b!975616))

(assert (= (and b!975616 res!653109) b!975621))

(assert (= (and b!975621 res!653104) b!975618))

(assert (= (and b!975619 condMapEmpty!35611) mapIsEmpty!35611))

(assert (= (and b!975619 (not condMapEmpty!35611)) mapNonEmpty!35611))

(get-info :version)

(assert (= (and mapNonEmpty!35611 ((_ is ValueCellFull!10719) mapValue!35611)) b!975615))

(assert (= (and b!975619 ((_ is ValueCellFull!10719) mapDefault!35611)) b!975614))

(assert (= start!83510 b!975619))

(declare-fun m!902811 () Bool)

(assert (=> b!975613 m!902811))

(assert (=> b!975613 m!902811))

(declare-fun m!902813 () Bool)

(assert (=> b!975613 m!902813))

(declare-fun m!902815 () Bool)

(assert (=> b!975621 m!902815))

(assert (=> b!975621 m!902815))

(declare-fun m!902817 () Bool)

(assert (=> b!975621 m!902817))

(declare-fun m!902819 () Bool)

(assert (=> b!975621 m!902819))

(declare-fun m!902821 () Bool)

(assert (=> b!975617 m!902821))

(declare-fun m!902823 () Bool)

(assert (=> b!975616 m!902823))

(assert (=> b!975616 m!902811))

(assert (=> b!975616 m!902823))

(assert (=> b!975616 m!902811))

(declare-fun m!902825 () Bool)

(assert (=> b!975616 m!902825))

(declare-fun m!902827 () Bool)

(assert (=> mapNonEmpty!35611 m!902827))

(declare-fun m!902829 () Bool)

(assert (=> b!975620 m!902829))

(declare-fun m!902831 () Bool)

(assert (=> start!83510 m!902831))

(declare-fun m!902833 () Bool)

(assert (=> start!83510 m!902833))

(declare-fun m!902835 () Bool)

(assert (=> start!83510 m!902835))

(check-sat b_and!31099 (not b!975620) tp_is_empty!22401 (not b!975617) (not b!975621) (not b_next!19497) (not start!83510) (not b!975616) (not mapNonEmpty!35611) (not b!975613))
(check-sat b_and!31099 (not b_next!19497))
