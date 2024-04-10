; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109260 () Bool)

(assert start!109260)

(declare-fun b_free!28749 () Bool)

(declare-fun b_next!28749 () Bool)

(assert (=> start!109260 (= b_free!28749 (not b_next!28749))))

(declare-fun tp!101365 () Bool)

(declare-fun b_and!46839 () Bool)

(assert (=> start!109260 (= tp!101365 b_and!46839)))

(declare-fun mapNonEmpty!53144 () Bool)

(declare-fun mapRes!53144 () Bool)

(declare-fun tp!101366 () Bool)

(declare-fun e!737801 () Bool)

(assert (=> mapNonEmpty!53144 (= mapRes!53144 (and tp!101366 e!737801))))

(declare-datatypes ((V!50955 0))(
  ( (V!50956 (val!17269 Int)) )
))
(declare-datatypes ((ValueCell!16296 0))(
  ( (ValueCellFull!16296 (v!19872 V!50955)) (EmptyCell!16296) )
))
(declare-datatypes ((array!85810 0))(
  ( (array!85811 (arr!41406 (Array (_ BitVec 32) ValueCell!16296)) (size!41956 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85810)

(declare-fun mapValue!53144 () ValueCell!16296)

(declare-fun mapRest!53144 () (Array (_ BitVec 32) ValueCell!16296))

(declare-fun mapKey!53144 () (_ BitVec 32))

(assert (=> mapNonEmpty!53144 (= (arr!41406 _values!1445) (store mapRest!53144 mapKey!53144 mapValue!53144))))

(declare-fun b!1292684 () Bool)

(declare-fun res!858939 () Bool)

(declare-fun e!737798 () Bool)

(assert (=> b!1292684 (=> (not res!858939) (not e!737798))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85812 0))(
  ( (array!85813 (arr!41407 (Array (_ BitVec 32) (_ BitVec 64))) (size!41957 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85812)

(assert (=> b!1292684 (= res!858939 (and (= (size!41956 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41957 _keys!1741) (size!41956 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292685 () Bool)

(declare-fun e!737799 () Bool)

(assert (=> b!1292685 (= e!737798 (not e!737799))))

(declare-fun res!858936 () Bool)

(assert (=> b!1292685 (=> res!858936 e!737799)))

(assert (=> b!1292685 (= res!858936 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22222 0))(
  ( (tuple2!22223 (_1!11122 (_ BitVec 64)) (_2!11122 V!50955)) )
))
(declare-datatypes ((List!29372 0))(
  ( (Nil!29369) (Cons!29368 (h!30577 tuple2!22222) (t!42936 List!29372)) )
))
(declare-datatypes ((ListLongMap!19879 0))(
  ( (ListLongMap!19880 (toList!9955 List!29372)) )
))
(declare-fun contains!8073 (ListLongMap!19879 (_ BitVec 64)) Bool)

(assert (=> b!1292685 (not (contains!8073 (ListLongMap!19880 Nil!29369) k0!1205))))

(declare-datatypes ((Unit!42810 0))(
  ( (Unit!42811) )
))
(declare-fun lt!579365 () Unit!42810)

(declare-fun emptyContainsNothing!127 ((_ BitVec 64)) Unit!42810)

(assert (=> b!1292685 (= lt!579365 (emptyContainsNothing!127 k0!1205))))

(declare-fun b!1292686 () Bool)

(assert (=> b!1292686 (= e!737799 true)))

(declare-fun minValue!1387 () V!50955)

(declare-fun zeroValue!1387 () V!50955)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!579364 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6023 (array!85812 array!85810 (_ BitVec 32) (_ BitVec 32) V!50955 V!50955 (_ BitVec 32) Int) ListLongMap!19879)

(assert (=> b!1292686 (= lt!579364 (contains!8073 (getCurrentListMapNoExtraKeys!6023 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292687 () Bool)

(declare-fun tp_is_empty!34389 () Bool)

(assert (=> b!1292687 (= e!737801 tp_is_empty!34389)))

(declare-fun b!1292688 () Bool)

(declare-fun res!858937 () Bool)

(assert (=> b!1292688 (=> (not res!858937) (not e!737798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292688 (= res!858937 (not (validKeyInArray!0 (select (arr!41407 _keys!1741) from!2144))))))

(declare-fun b!1292689 () Bool)

(declare-fun res!858938 () Bool)

(assert (=> b!1292689 (=> (not res!858938) (not e!737798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85812 (_ BitVec 32)) Bool)

(assert (=> b!1292689 (= res!858938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!858933 () Bool)

(assert (=> start!109260 (=> (not res!858933) (not e!737798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109260 (= res!858933 (validMask!0 mask!2175))))

(assert (=> start!109260 e!737798))

(assert (=> start!109260 tp_is_empty!34389))

(assert (=> start!109260 true))

(declare-fun e!737797 () Bool)

(declare-fun array_inv!31371 (array!85810) Bool)

(assert (=> start!109260 (and (array_inv!31371 _values!1445) e!737797)))

(declare-fun array_inv!31372 (array!85812) Bool)

(assert (=> start!109260 (array_inv!31372 _keys!1741)))

(assert (=> start!109260 tp!101365))

(declare-fun mapIsEmpty!53144 () Bool)

(assert (=> mapIsEmpty!53144 mapRes!53144))

(declare-fun b!1292690 () Bool)

(declare-fun e!737796 () Bool)

(assert (=> b!1292690 (= e!737796 tp_is_empty!34389)))

(declare-fun b!1292691 () Bool)

(declare-fun res!858934 () Bool)

(assert (=> b!1292691 (=> (not res!858934) (not e!737798))))

(assert (=> b!1292691 (= res!858934 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41957 _keys!1741))))))

(declare-fun b!1292692 () Bool)

(assert (=> b!1292692 (= e!737797 (and e!737796 mapRes!53144))))

(declare-fun condMapEmpty!53144 () Bool)

(declare-fun mapDefault!53144 () ValueCell!16296)

(assert (=> b!1292692 (= condMapEmpty!53144 (= (arr!41406 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16296)) mapDefault!53144)))))

(declare-fun b!1292693 () Bool)

(declare-fun res!858931 () Bool)

(assert (=> b!1292693 (=> (not res!858931) (not e!737798))))

(assert (=> b!1292693 (= res!858931 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41957 _keys!1741))))))

(declare-fun b!1292694 () Bool)

(declare-fun res!858932 () Bool)

(assert (=> b!1292694 (=> (not res!858932) (not e!737798))))

(declare-datatypes ((List!29373 0))(
  ( (Nil!29370) (Cons!29369 (h!30578 (_ BitVec 64)) (t!42937 List!29373)) )
))
(declare-fun arrayNoDuplicates!0 (array!85812 (_ BitVec 32) List!29373) Bool)

(assert (=> b!1292694 (= res!858932 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29370))))

(declare-fun b!1292695 () Bool)

(declare-fun res!858935 () Bool)

(assert (=> b!1292695 (=> (not res!858935) (not e!737798))))

(declare-fun getCurrentListMap!5000 (array!85812 array!85810 (_ BitVec 32) (_ BitVec 32) V!50955 V!50955 (_ BitVec 32) Int) ListLongMap!19879)

(assert (=> b!1292695 (= res!858935 (contains!8073 (getCurrentListMap!5000 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109260 res!858933) b!1292684))

(assert (= (and b!1292684 res!858939) b!1292689))

(assert (= (and b!1292689 res!858938) b!1292694))

(assert (= (and b!1292694 res!858932) b!1292693))

(assert (= (and b!1292693 res!858931) b!1292695))

(assert (= (and b!1292695 res!858935) b!1292691))

(assert (= (and b!1292691 res!858934) b!1292688))

(assert (= (and b!1292688 res!858937) b!1292685))

(assert (= (and b!1292685 (not res!858936)) b!1292686))

(assert (= (and b!1292692 condMapEmpty!53144) mapIsEmpty!53144))

(assert (= (and b!1292692 (not condMapEmpty!53144)) mapNonEmpty!53144))

(get-info :version)

(assert (= (and mapNonEmpty!53144 ((_ is ValueCellFull!16296) mapValue!53144)) b!1292687))

(assert (= (and b!1292692 ((_ is ValueCellFull!16296) mapDefault!53144)) b!1292690))

(assert (= start!109260 b!1292692))

(declare-fun m!1185171 () Bool)

(assert (=> b!1292688 m!1185171))

(assert (=> b!1292688 m!1185171))

(declare-fun m!1185173 () Bool)

(assert (=> b!1292688 m!1185173))

(declare-fun m!1185175 () Bool)

(assert (=> b!1292689 m!1185175))

(declare-fun m!1185177 () Bool)

(assert (=> start!109260 m!1185177))

(declare-fun m!1185179 () Bool)

(assert (=> start!109260 m!1185179))

(declare-fun m!1185181 () Bool)

(assert (=> start!109260 m!1185181))

(declare-fun m!1185183 () Bool)

(assert (=> mapNonEmpty!53144 m!1185183))

(declare-fun m!1185185 () Bool)

(assert (=> b!1292695 m!1185185))

(assert (=> b!1292695 m!1185185))

(declare-fun m!1185187 () Bool)

(assert (=> b!1292695 m!1185187))

(declare-fun m!1185189 () Bool)

(assert (=> b!1292686 m!1185189))

(assert (=> b!1292686 m!1185189))

(declare-fun m!1185191 () Bool)

(assert (=> b!1292686 m!1185191))

(declare-fun m!1185193 () Bool)

(assert (=> b!1292685 m!1185193))

(declare-fun m!1185195 () Bool)

(assert (=> b!1292685 m!1185195))

(declare-fun m!1185197 () Bool)

(assert (=> b!1292694 m!1185197))

(check-sat (not b!1292694) (not b!1292695) tp_is_empty!34389 (not b!1292688) (not b!1292686) (not b!1292689) (not b!1292685) b_and!46839 (not b_next!28749) (not start!109260) (not mapNonEmpty!53144))
(check-sat b_and!46839 (not b_next!28749))
