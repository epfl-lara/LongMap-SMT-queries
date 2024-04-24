; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109182 () Bool)

(assert start!109182)

(declare-fun b_free!28447 () Bool)

(declare-fun b_next!28447 () Bool)

(assert (=> start!109182 (= b_free!28447 (not b_next!28447))))

(declare-fun tp!100459 () Bool)

(declare-fun b_and!46539 () Bool)

(assert (=> start!109182 (= tp!100459 b_and!46539)))

(declare-fun b!1288704 () Bool)

(declare-fun res!855532 () Bool)

(declare-fun e!736078 () Bool)

(assert (=> b!1288704 (=> (not res!855532) (not e!736078))))

(declare-datatypes ((array!85259 0))(
  ( (array!85260 (arr!41126 (Array (_ BitVec 32) (_ BitVec 64))) (size!41677 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85259)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288704 (= res!855532 (not (validKeyInArray!0 (select (arr!41126 _keys!1741) from!2144))))))

(declare-fun b!1288705 () Bool)

(declare-fun res!855526 () Bool)

(assert (=> b!1288705 (=> (not res!855526) (not e!736078))))

(declare-datatypes ((List!29171 0))(
  ( (Nil!29168) (Cons!29167 (h!30385 (_ BitVec 64)) (t!42727 List!29171)) )
))
(declare-fun arrayNoDuplicates!0 (array!85259 (_ BitVec 32) List!29171) Bool)

(assert (=> b!1288705 (= res!855526 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29168))))

(declare-fun res!855525 () Bool)

(assert (=> start!109182 (=> (not res!855525) (not e!736078))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109182 (= res!855525 (validMask!0 mask!2175))))

(assert (=> start!109182 e!736078))

(declare-fun tp_is_empty!34087 () Bool)

(assert (=> start!109182 tp_is_empty!34087))

(assert (=> start!109182 true))

(declare-datatypes ((V!50553 0))(
  ( (V!50554 (val!17118 Int)) )
))
(declare-datatypes ((ValueCell!16145 0))(
  ( (ValueCellFull!16145 (v!19716 V!50553)) (EmptyCell!16145) )
))
(declare-datatypes ((array!85261 0))(
  ( (array!85262 (arr!41127 (Array (_ BitVec 32) ValueCell!16145)) (size!41678 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85261)

(declare-fun e!736076 () Bool)

(declare-fun array_inv!31391 (array!85261) Bool)

(assert (=> start!109182 (and (array_inv!31391 _values!1445) e!736076)))

(declare-fun array_inv!31392 (array!85259) Bool)

(assert (=> start!109182 (array_inv!31392 _keys!1741)))

(assert (=> start!109182 tp!100459))

(declare-fun mapIsEmpty!52691 () Bool)

(declare-fun mapRes!52691 () Bool)

(assert (=> mapIsEmpty!52691 mapRes!52691))

(declare-fun mapNonEmpty!52691 () Bool)

(declare-fun tp!100460 () Bool)

(declare-fun e!736080 () Bool)

(assert (=> mapNonEmpty!52691 (= mapRes!52691 (and tp!100460 e!736080))))

(declare-fun mapValue!52691 () ValueCell!16145)

(declare-fun mapKey!52691 () (_ BitVec 32))

(declare-fun mapRest!52691 () (Array (_ BitVec 32) ValueCell!16145))

(assert (=> mapNonEmpty!52691 (= (arr!41127 _values!1445) (store mapRest!52691 mapKey!52691 mapValue!52691))))

(declare-fun b!1288706 () Bool)

(declare-fun e!736077 () Bool)

(assert (=> b!1288706 (= e!736077 tp_is_empty!34087)))

(declare-fun b!1288707 () Bool)

(assert (=> b!1288707 (= e!736076 (and e!736077 mapRes!52691))))

(declare-fun condMapEmpty!52691 () Bool)

(declare-fun mapDefault!52691 () ValueCell!16145)

(assert (=> b!1288707 (= condMapEmpty!52691 (= (arr!41127 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16145)) mapDefault!52691)))))

(declare-fun b!1288708 () Bool)

(declare-fun res!855528 () Bool)

(assert (=> b!1288708 (=> (not res!855528) (not e!736078))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1288708 (= res!855528 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41677 _keys!1741))))))

(declare-fun b!1288709 () Bool)

(assert (=> b!1288709 (= e!736080 tp_is_empty!34087)))

(declare-fun b!1288710 () Bool)

(declare-fun res!855531 () Bool)

(assert (=> b!1288710 (=> (not res!855531) (not e!736078))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288710 (= res!855531 (and (= (size!41678 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41677 _keys!1741) (size!41678 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288711 () Bool)

(declare-fun res!855530 () Bool)

(assert (=> b!1288711 (=> (not res!855530) (not e!736078))))

(assert (=> b!1288711 (= res!855530 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41677 _keys!1741))))))

(declare-fun b!1288712 () Bool)

(assert (=> b!1288712 (= e!736078 (not true))))

(declare-datatypes ((tuple2!21980 0))(
  ( (tuple2!21981 (_1!11001 (_ BitVec 64)) (_2!11001 V!50553)) )
))
(declare-datatypes ((List!29172 0))(
  ( (Nil!29169) (Cons!29168 (h!30386 tuple2!21980) (t!42728 List!29172)) )
))
(declare-datatypes ((ListLongMap!19645 0))(
  ( (ListLongMap!19646 (toList!9838 List!29172)) )
))
(declare-fun contains!7969 (ListLongMap!19645 (_ BitVec 64)) Bool)

(assert (=> b!1288712 (not (contains!7969 (ListLongMap!19646 Nil!29169) k0!1205))))

(declare-datatypes ((Unit!42531 0))(
  ( (Unit!42532) )
))
(declare-fun lt!578346 () Unit!42531)

(declare-fun emptyContainsNothing!19 ((_ BitVec 64)) Unit!42531)

(assert (=> b!1288712 (= lt!578346 (emptyContainsNothing!19 k0!1205))))

(declare-fun b!1288713 () Bool)

(declare-fun res!855527 () Bool)

(assert (=> b!1288713 (=> (not res!855527) (not e!736078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85259 (_ BitVec 32)) Bool)

(assert (=> b!1288713 (= res!855527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288714 () Bool)

(declare-fun res!855529 () Bool)

(assert (=> b!1288714 (=> (not res!855529) (not e!736078))))

(declare-fun minValue!1387 () V!50553)

(declare-fun zeroValue!1387 () V!50553)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4892 (array!85259 array!85261 (_ BitVec 32) (_ BitVec 32) V!50553 V!50553 (_ BitVec 32) Int) ListLongMap!19645)

(assert (=> b!1288714 (= res!855529 (contains!7969 (getCurrentListMap!4892 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109182 res!855525) b!1288710))

(assert (= (and b!1288710 res!855531) b!1288713))

(assert (= (and b!1288713 res!855527) b!1288705))

(assert (= (and b!1288705 res!855526) b!1288711))

(assert (= (and b!1288711 res!855530) b!1288714))

(assert (= (and b!1288714 res!855529) b!1288708))

(assert (= (and b!1288708 res!855528) b!1288704))

(assert (= (and b!1288704 res!855532) b!1288712))

(assert (= (and b!1288707 condMapEmpty!52691) mapIsEmpty!52691))

(assert (= (and b!1288707 (not condMapEmpty!52691)) mapNonEmpty!52691))

(get-info :version)

(assert (= (and mapNonEmpty!52691 ((_ is ValueCellFull!16145) mapValue!52691)) b!1288709))

(assert (= (and b!1288707 ((_ is ValueCellFull!16145) mapDefault!52691)) b!1288706))

(assert (= start!109182 b!1288707))

(declare-fun m!1181889 () Bool)

(assert (=> b!1288704 m!1181889))

(assert (=> b!1288704 m!1181889))

(declare-fun m!1181891 () Bool)

(assert (=> b!1288704 m!1181891))

(declare-fun m!1181893 () Bool)

(assert (=> b!1288714 m!1181893))

(assert (=> b!1288714 m!1181893))

(declare-fun m!1181895 () Bool)

(assert (=> b!1288714 m!1181895))

(declare-fun m!1181897 () Bool)

(assert (=> b!1288712 m!1181897))

(declare-fun m!1181899 () Bool)

(assert (=> b!1288712 m!1181899))

(declare-fun m!1181901 () Bool)

(assert (=> start!109182 m!1181901))

(declare-fun m!1181903 () Bool)

(assert (=> start!109182 m!1181903))

(declare-fun m!1181905 () Bool)

(assert (=> start!109182 m!1181905))

(declare-fun m!1181907 () Bool)

(assert (=> b!1288713 m!1181907))

(declare-fun m!1181909 () Bool)

(assert (=> mapNonEmpty!52691 m!1181909))

(declare-fun m!1181911 () Bool)

(assert (=> b!1288705 m!1181911))

(check-sat (not b!1288704) (not b!1288705) (not mapNonEmpty!52691) (not start!109182) (not b!1288714) (not b_next!28447) tp_is_empty!34087 b_and!46539 (not b!1288712) (not b!1288713))
(check-sat b_and!46539 (not b_next!28447))
