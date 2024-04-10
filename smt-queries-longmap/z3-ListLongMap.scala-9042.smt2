; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109038 () Bool)

(assert start!109038)

(declare-fun b_free!28527 () Bool)

(declare-fun b_next!28527 () Bool)

(assert (=> start!109038 (= b_free!28527 (not b_next!28527))))

(declare-fun tp!100700 () Bool)

(declare-fun b_and!46617 () Bool)

(assert (=> start!109038 (= tp!100700 b_and!46617)))

(declare-fun b!1288769 () Bool)

(declare-fun res!856016 () Bool)

(declare-fun e!735882 () Bool)

(assert (=> b!1288769 (=> (not res!856016) (not e!735882))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85378 0))(
  ( (array!85379 (arr!41190 (Array (_ BitVec 32) (_ BitVec 64))) (size!41740 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85378)

(assert (=> b!1288769 (= res!856016 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41740 _keys!1741))))))

(declare-fun b!1288770 () Bool)

(declare-fun res!856018 () Bool)

(assert (=> b!1288770 (=> (not res!856018) (not e!735882))))

(declare-datatypes ((V!50659 0))(
  ( (V!50660 (val!17158 Int)) )
))
(declare-fun minValue!1387 () V!50659)

(declare-fun zeroValue!1387 () V!50659)

(declare-datatypes ((ValueCell!16185 0))(
  ( (ValueCellFull!16185 (v!19761 V!50659)) (EmptyCell!16185) )
))
(declare-datatypes ((array!85380 0))(
  ( (array!85381 (arr!41191 (Array (_ BitVec 32) ValueCell!16185)) (size!41741 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85380)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22030 0))(
  ( (tuple2!22031 (_1!11026 (_ BitVec 64)) (_2!11026 V!50659)) )
))
(declare-datatypes ((List!29203 0))(
  ( (Nil!29200) (Cons!29199 (h!30408 tuple2!22030) (t!42767 List!29203)) )
))
(declare-datatypes ((ListLongMap!19687 0))(
  ( (ListLongMap!19688 (toList!9859 List!29203)) )
))
(declare-fun contains!7977 (ListLongMap!19687 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4921 (array!85378 array!85380 (_ BitVec 32) (_ BitVec 32) V!50659 V!50659 (_ BitVec 32) Int) ListLongMap!19687)

(assert (=> b!1288770 (= res!856018 (contains!7977 (getCurrentListMap!4921 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288771 () Bool)

(declare-fun res!856015 () Bool)

(assert (=> b!1288771 (=> (not res!856015) (not e!735882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85378 (_ BitVec 32)) Bool)

(assert (=> b!1288771 (= res!856015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288772 () Bool)

(declare-fun res!856020 () Bool)

(assert (=> b!1288772 (=> (not res!856020) (not e!735882))))

(declare-datatypes ((List!29204 0))(
  ( (Nil!29201) (Cons!29200 (h!30409 (_ BitVec 64)) (t!42768 List!29204)) )
))
(declare-fun arrayNoDuplicates!0 (array!85378 (_ BitVec 32) List!29204) Bool)

(assert (=> b!1288772 (= res!856020 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29201))))

(declare-fun b!1288773 () Bool)

(declare-fun e!735884 () Bool)

(declare-fun e!735881 () Bool)

(declare-fun mapRes!52811 () Bool)

(assert (=> b!1288773 (= e!735884 (and e!735881 mapRes!52811))))

(declare-fun condMapEmpty!52811 () Bool)

(declare-fun mapDefault!52811 () ValueCell!16185)

(assert (=> b!1288773 (= condMapEmpty!52811 (= (arr!41191 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16185)) mapDefault!52811)))))

(declare-fun mapIsEmpty!52811 () Bool)

(assert (=> mapIsEmpty!52811 mapRes!52811))

(declare-fun b!1288774 () Bool)

(declare-fun e!735879 () Bool)

(assert (=> b!1288774 (= e!735882 (not e!735879))))

(declare-fun res!856023 () Bool)

(assert (=> b!1288774 (=> res!856023 e!735879)))

(assert (=> b!1288774 (= res!856023 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288774 (not (contains!7977 (ListLongMap!19688 Nil!29200) k0!1205))))

(declare-datatypes ((Unit!42636 0))(
  ( (Unit!42637) )
))
(declare-fun lt!578074 () Unit!42636)

(declare-fun emptyContainsNothing!47 ((_ BitVec 64)) Unit!42636)

(assert (=> b!1288774 (= lt!578074 (emptyContainsNothing!47 k0!1205))))

(declare-fun b!1288775 () Bool)

(declare-fun e!735880 () Bool)

(declare-fun tp_is_empty!34167 () Bool)

(assert (=> b!1288775 (= e!735880 tp_is_empty!34167)))

(declare-fun b!1288776 () Bool)

(assert (=> b!1288776 (= e!735879 true)))

(declare-fun lt!578073 () ListLongMap!19687)

(declare-fun +!4331 (ListLongMap!19687 tuple2!22030) ListLongMap!19687)

(assert (=> b!1288776 (not (contains!7977 (+!4331 lt!578073 (tuple2!22031 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578075 () Unit!42636)

(declare-fun addStillNotContains!349 (ListLongMap!19687 (_ BitVec 64) V!50659 (_ BitVec 64)) Unit!42636)

(assert (=> b!1288776 (= lt!578075 (addStillNotContains!349 lt!578073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5962 (array!85378 array!85380 (_ BitVec 32) (_ BitVec 32) V!50659 V!50659 (_ BitVec 32) Int) ListLongMap!19687)

(assert (=> b!1288776 (= lt!578073 (getCurrentListMapNoExtraKeys!5962 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288777 () Bool)

(declare-fun res!856022 () Bool)

(assert (=> b!1288777 (=> (not res!856022) (not e!735882))))

(assert (=> b!1288777 (= res!856022 (and (= (size!41741 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41740 _keys!1741) (size!41741 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52811 () Bool)

(declare-fun tp!100699 () Bool)

(assert (=> mapNonEmpty!52811 (= mapRes!52811 (and tp!100699 e!735880))))

(declare-fun mapKey!52811 () (_ BitVec 32))

(declare-fun mapValue!52811 () ValueCell!16185)

(declare-fun mapRest!52811 () (Array (_ BitVec 32) ValueCell!16185))

(assert (=> mapNonEmpty!52811 (= (arr!41191 _values!1445) (store mapRest!52811 mapKey!52811 mapValue!52811))))

(declare-fun b!1288778 () Bool)

(declare-fun res!856017 () Bool)

(assert (=> b!1288778 (=> (not res!856017) (not e!735882))))

(assert (=> b!1288778 (= res!856017 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41740 _keys!1741))))))

(declare-fun b!1288779 () Bool)

(assert (=> b!1288779 (= e!735881 tp_is_empty!34167)))

(declare-fun b!1288780 () Bool)

(declare-fun res!856021 () Bool)

(assert (=> b!1288780 (=> (not res!856021) (not e!735882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288780 (= res!856021 (not (validKeyInArray!0 (select (arr!41190 _keys!1741) from!2144))))))

(declare-fun res!856019 () Bool)

(assert (=> start!109038 (=> (not res!856019) (not e!735882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109038 (= res!856019 (validMask!0 mask!2175))))

(assert (=> start!109038 e!735882))

(assert (=> start!109038 tp_is_empty!34167))

(assert (=> start!109038 true))

(declare-fun array_inv!31227 (array!85380) Bool)

(assert (=> start!109038 (and (array_inv!31227 _values!1445) e!735884)))

(declare-fun array_inv!31228 (array!85378) Bool)

(assert (=> start!109038 (array_inv!31228 _keys!1741)))

(assert (=> start!109038 tp!100700))

(assert (= (and start!109038 res!856019) b!1288777))

(assert (= (and b!1288777 res!856022) b!1288771))

(assert (= (and b!1288771 res!856015) b!1288772))

(assert (= (and b!1288772 res!856020) b!1288778))

(assert (= (and b!1288778 res!856017) b!1288770))

(assert (= (and b!1288770 res!856018) b!1288769))

(assert (= (and b!1288769 res!856016) b!1288780))

(assert (= (and b!1288780 res!856021) b!1288774))

(assert (= (and b!1288774 (not res!856023)) b!1288776))

(assert (= (and b!1288773 condMapEmpty!52811) mapIsEmpty!52811))

(assert (= (and b!1288773 (not condMapEmpty!52811)) mapNonEmpty!52811))

(get-info :version)

(assert (= (and mapNonEmpty!52811 ((_ is ValueCellFull!16185) mapValue!52811)) b!1288775))

(assert (= (and b!1288773 ((_ is ValueCellFull!16185) mapDefault!52811)) b!1288779))

(assert (= start!109038 b!1288773))

(declare-fun m!1181347 () Bool)

(assert (=> b!1288774 m!1181347))

(declare-fun m!1181349 () Bool)

(assert (=> b!1288774 m!1181349))

(declare-fun m!1181351 () Bool)

(assert (=> mapNonEmpty!52811 m!1181351))

(declare-fun m!1181353 () Bool)

(assert (=> b!1288771 m!1181353))

(declare-fun m!1181355 () Bool)

(assert (=> start!109038 m!1181355))

(declare-fun m!1181357 () Bool)

(assert (=> start!109038 m!1181357))

(declare-fun m!1181359 () Bool)

(assert (=> start!109038 m!1181359))

(declare-fun m!1181361 () Bool)

(assert (=> b!1288776 m!1181361))

(assert (=> b!1288776 m!1181361))

(declare-fun m!1181363 () Bool)

(assert (=> b!1288776 m!1181363))

(declare-fun m!1181365 () Bool)

(assert (=> b!1288776 m!1181365))

(declare-fun m!1181367 () Bool)

(assert (=> b!1288776 m!1181367))

(declare-fun m!1181369 () Bool)

(assert (=> b!1288770 m!1181369))

(assert (=> b!1288770 m!1181369))

(declare-fun m!1181371 () Bool)

(assert (=> b!1288770 m!1181371))

(declare-fun m!1181373 () Bool)

(assert (=> b!1288780 m!1181373))

(assert (=> b!1288780 m!1181373))

(declare-fun m!1181375 () Bool)

(assert (=> b!1288780 m!1181375))

(declare-fun m!1181377 () Bool)

(assert (=> b!1288772 m!1181377))

(check-sat (not b!1288770) (not b!1288780) (not b!1288774) (not start!109038) b_and!46617 (not b_next!28527) (not b!1288771) (not b!1288772) (not mapNonEmpty!52811) tp_is_empty!34167 (not b!1288776))
(check-sat b_and!46617 (not b_next!28527))
