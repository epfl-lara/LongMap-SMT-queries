; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109636 () Bool)

(assert start!109636)

(declare-fun b_free!29125 () Bool)

(declare-fun b_next!29125 () Bool)

(assert (=> start!109636 (= b_free!29125 (not b_next!29125))))

(declare-fun tp!102493 () Bool)

(declare-fun b_and!47215 () Bool)

(assert (=> start!109636 (= tp!102493 b_and!47215)))

(declare-fun b!1298739 () Bool)

(declare-fun e!740915 () Bool)

(declare-fun e!740914 () Bool)

(assert (=> b!1298739 (= e!740915 (not e!740914))))

(declare-fun res!863132 () Bool)

(assert (=> b!1298739 (=> res!863132 e!740914)))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1298739 (= res!863132 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(declare-datatypes ((V!51457 0))(
  ( (V!51458 (val!17457 Int)) )
))
(declare-fun minValue!1387 () V!51457)

(declare-fun zeroValue!1387 () V!51457)

(declare-datatypes ((ValueCell!16484 0))(
  ( (ValueCellFull!16484 (v!20060 V!51457)) (EmptyCell!16484) )
))
(declare-datatypes ((array!86536 0))(
  ( (array!86537 (arr!41769 (Array (_ BitVec 32) ValueCell!16484)) (size!42319 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86536)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86538 0))(
  ( (array!86539 (arr!41770 (Array (_ BitVec 32) (_ BitVec 64))) (size!42320 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86538)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22514 0))(
  ( (tuple2!22515 (_1!11268 (_ BitVec 64)) (_2!11268 V!51457)) )
))
(declare-datatypes ((List!29643 0))(
  ( (Nil!29640) (Cons!29639 (h!30848 tuple2!22514) (t!43207 List!29643)) )
))
(declare-datatypes ((ListLongMap!20171 0))(
  ( (ListLongMap!20172 (toList!10101 List!29643)) )
))
(declare-fun contains!8219 (ListLongMap!20171 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5130 (array!86538 array!86536 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 32) Int) ListLongMap!20171)

(assert (=> b!1298739 (contains!8219 (getCurrentListMap!5130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!43007 0))(
  ( (Unit!43008) )
))
(declare-fun lt!580735 () Unit!43007)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!56 (array!86538 array!86536 (_ BitVec 32) (_ BitVec 32) V!51457 V!51457 (_ BitVec 64) (_ BitVec 32) Int) Unit!43007)

(assert (=> b!1298739 (= lt!580735 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!56 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298740 () Bool)

(declare-fun res!863133 () Bool)

(assert (=> b!1298740 (=> (not res!863133) (not e!740915))))

(assert (=> b!1298740 (= res!863133 (contains!8219 (getCurrentListMap!5130 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1298741 () Bool)

(declare-fun res!863138 () Bool)

(assert (=> b!1298741 (=> (not res!863138) (not e!740915))))

(assert (=> b!1298741 (= res!863138 (and (= (size!42319 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42320 _keys!1741) (size!42319 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298743 () Bool)

(declare-fun e!740913 () Bool)

(declare-fun tp_is_empty!34765 () Bool)

(assert (=> b!1298743 (= e!740913 tp_is_empty!34765)))

(declare-fun b!1298744 () Bool)

(declare-fun res!863137 () Bool)

(assert (=> b!1298744 (=> (not res!863137) (not e!740915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86538 (_ BitVec 32)) Bool)

(assert (=> b!1298744 (= res!863137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298745 () Bool)

(declare-fun res!863139 () Bool)

(assert (=> b!1298745 (=> (not res!863139) (not e!740915))))

(assert (=> b!1298745 (= res!863139 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42320 _keys!1741)) (not (= (select (arr!41770 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1298746 () Bool)

(declare-fun e!740912 () Bool)

(assert (=> b!1298746 (= e!740912 tp_is_empty!34765)))

(declare-fun mapNonEmpty!53708 () Bool)

(declare-fun mapRes!53708 () Bool)

(declare-fun tp!102494 () Bool)

(assert (=> mapNonEmpty!53708 (= mapRes!53708 (and tp!102494 e!740912))))

(declare-fun mapRest!53708 () (Array (_ BitVec 32) ValueCell!16484))

(declare-fun mapKey!53708 () (_ BitVec 32))

(declare-fun mapValue!53708 () ValueCell!16484)

(assert (=> mapNonEmpty!53708 (= (arr!41769 _values!1445) (store mapRest!53708 mapKey!53708 mapValue!53708))))

(declare-fun mapIsEmpty!53708 () Bool)

(assert (=> mapIsEmpty!53708 mapRes!53708))

(declare-fun b!1298747 () Bool)

(declare-fun res!863136 () Bool)

(assert (=> b!1298747 (=> (not res!863136) (not e!740915))))

(assert (=> b!1298747 (= res!863136 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42320 _keys!1741))))))

(declare-fun b!1298748 () Bool)

(declare-fun res!863134 () Bool)

(assert (=> b!1298748 (=> (not res!863134) (not e!740915))))

(declare-datatypes ((List!29644 0))(
  ( (Nil!29641) (Cons!29640 (h!30849 (_ BitVec 64)) (t!43208 List!29644)) )
))
(declare-fun arrayNoDuplicates!0 (array!86538 (_ BitVec 32) List!29644) Bool)

(assert (=> b!1298748 (= res!863134 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29641))))

(declare-fun b!1298749 () Bool)

(declare-fun e!740911 () Bool)

(assert (=> b!1298749 (= e!740911 (and e!740913 mapRes!53708))))

(declare-fun condMapEmpty!53708 () Bool)

(declare-fun mapDefault!53708 () ValueCell!16484)

