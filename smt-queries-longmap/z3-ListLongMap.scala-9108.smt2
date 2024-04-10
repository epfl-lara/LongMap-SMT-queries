; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109434 () Bool)

(assert start!109434)

(declare-fun b_free!28923 () Bool)

(declare-fun b_next!28923 () Bool)

(assert (=> start!109434 (= b_free!28923 (not b_next!28923))))

(declare-fun tp!101887 () Bool)

(declare-fun b_and!47013 () Bool)

(assert (=> start!109434 (= tp!101887 b_and!47013)))

(declare-fun b!1295735 () Bool)

(declare-fun e!739285 () Bool)

(assert (=> b!1295735 (= e!739285 true)))

(declare-datatypes ((V!51187 0))(
  ( (V!51188 (val!17356 Int)) )
))
(declare-datatypes ((tuple2!22354 0))(
  ( (tuple2!22355 (_1!11188 (_ BitVec 64)) (_2!11188 V!51187)) )
))
(declare-datatypes ((List!29495 0))(
  ( (Nil!29492) (Cons!29491 (h!30700 tuple2!22354) (t!43059 List!29495)) )
))
(declare-datatypes ((ListLongMap!20011 0))(
  ( (ListLongMap!20012 (toList!10021 List!29495)) )
))
(declare-fun lt!579974 () ListLongMap!20011)

(declare-fun minValue!1387 () V!51187)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8139 (ListLongMap!20011 (_ BitVec 64)) Bool)

(declare-fun +!4425 (ListLongMap!20011 tuple2!22354) ListLongMap!20011)

(assert (=> b!1295735 (not (contains!8139 (+!4425 lt!579974 (tuple2!22355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42920 0))(
  ( (Unit!42921) )
))
(declare-fun lt!579973 () Unit!42920)

(declare-fun addStillNotContains!443 (ListLongMap!20011 (_ BitVec 64) V!51187 (_ BitVec 64)) Unit!42920)

(assert (=> b!1295735 (= lt!579973 (addStillNotContains!443 lt!579974 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16383 0))(
  ( (ValueCellFull!16383 (v!19959 V!51187)) (EmptyCell!16383) )
))
(declare-datatypes ((array!86146 0))(
  ( (array!86147 (arr!41574 (Array (_ BitVec 32) ValueCell!16383)) (size!42124 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86146)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86148 0))(
  ( (array!86149 (arr!41575 (Array (_ BitVec 32) (_ BitVec 64))) (size!42125 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86148)

(declare-fun zeroValue!1387 () V!51187)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6058 (array!86148 array!86146 (_ BitVec 32) (_ BitVec 32) V!51187 V!51187 (_ BitVec 32) Int) ListLongMap!20011)

(assert (=> b!1295735 (= lt!579974 (getCurrentListMapNoExtraKeys!6058 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295736 () Bool)

(declare-fun e!739282 () Bool)

(declare-fun tp_is_empty!34563 () Bool)

(assert (=> b!1295736 (= e!739282 tp_is_empty!34563)))

(declare-fun b!1295737 () Bool)

(declare-fun res!861206 () Bool)

(declare-fun e!739281 () Bool)

(assert (=> b!1295737 (=> (not res!861206) (not e!739281))))

(assert (=> b!1295737 (= res!861206 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42125 _keys!1741))))))

(declare-fun b!1295738 () Bool)

(declare-fun e!739286 () Bool)

(assert (=> b!1295738 (= e!739286 tp_is_empty!34563)))

(declare-fun b!1295739 () Bool)

(declare-fun res!861202 () Bool)

(assert (=> b!1295739 (=> (not res!861202) (not e!739281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86148 (_ BitVec 32)) Bool)

(assert (=> b!1295739 (= res!861202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295740 () Bool)

(declare-fun res!861203 () Bool)

(assert (=> b!1295740 (=> (not res!861203) (not e!739281))))

(assert (=> b!1295740 (= res!861203 (and (= (size!42124 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42125 _keys!1741) (size!42124 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295741 () Bool)

(declare-fun res!861205 () Bool)

(assert (=> b!1295741 (=> (not res!861205) (not e!739281))))

(declare-datatypes ((List!29496 0))(
  ( (Nil!29493) (Cons!29492 (h!30701 (_ BitVec 64)) (t!43060 List!29496)) )
))
(declare-fun arrayNoDuplicates!0 (array!86148 (_ BitVec 32) List!29496) Bool)

(assert (=> b!1295741 (= res!861205 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29493))))

(declare-fun mapNonEmpty!53405 () Bool)

(declare-fun mapRes!53405 () Bool)

(declare-fun tp!101888 () Bool)

(assert (=> mapNonEmpty!53405 (= mapRes!53405 (and tp!101888 e!739286))))

(declare-fun mapValue!53405 () ValueCell!16383)

(declare-fun mapKey!53405 () (_ BitVec 32))

(declare-fun mapRest!53405 () (Array (_ BitVec 32) ValueCell!16383))

(assert (=> mapNonEmpty!53405 (= (arr!41574 _values!1445) (store mapRest!53405 mapKey!53405 mapValue!53405))))

(declare-fun res!861200 () Bool)

(assert (=> start!109434 (=> (not res!861200) (not e!739281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109434 (= res!861200 (validMask!0 mask!2175))))

(assert (=> start!109434 e!739281))

(assert (=> start!109434 tp_is_empty!34563))

(assert (=> start!109434 true))

(declare-fun e!739283 () Bool)

(declare-fun array_inv!31475 (array!86146) Bool)

(assert (=> start!109434 (and (array_inv!31475 _values!1445) e!739283)))

(declare-fun array_inv!31476 (array!86148) Bool)

(assert (=> start!109434 (array_inv!31476 _keys!1741)))

(assert (=> start!109434 tp!101887))

(declare-fun b!1295742 () Bool)

(assert (=> b!1295742 (= e!739283 (and e!739282 mapRes!53405))))

(declare-fun condMapEmpty!53405 () Bool)

(declare-fun mapDefault!53405 () ValueCell!16383)

(assert (=> b!1295742 (= condMapEmpty!53405 (= (arr!41574 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16383)) mapDefault!53405)))))

(declare-fun b!1295743 () Bool)

(assert (=> b!1295743 (= e!739281 (not e!739285))))

(declare-fun res!861204 () Bool)

(assert (=> b!1295743 (=> res!861204 e!739285)))

(assert (=> b!1295743 (= res!861204 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295743 (not (contains!8139 (ListLongMap!20012 Nil!29492) k0!1205))))

(declare-fun lt!579972 () Unit!42920)

(declare-fun emptyContainsNothing!179 ((_ BitVec 64)) Unit!42920)

(assert (=> b!1295743 (= lt!579972 (emptyContainsNothing!179 k0!1205))))

(declare-fun b!1295744 () Bool)

(declare-fun res!861201 () Bool)

(assert (=> b!1295744 (=> (not res!861201) (not e!739281))))

(assert (=> b!1295744 (= res!861201 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42125 _keys!1741))))))

(declare-fun b!1295745 () Bool)

(declare-fun res!861199 () Bool)

(assert (=> b!1295745 (=> (not res!861199) (not e!739281))))

(declare-fun getCurrentListMap!5054 (array!86148 array!86146 (_ BitVec 32) (_ BitVec 32) V!51187 V!51187 (_ BitVec 32) Int) ListLongMap!20011)

(assert (=> b!1295745 (= res!861199 (contains!8139 (getCurrentListMap!5054 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295746 () Bool)

(declare-fun res!861207 () Bool)

(assert (=> b!1295746 (=> (not res!861207) (not e!739281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295746 (= res!861207 (not (validKeyInArray!0 (select (arr!41575 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53405 () Bool)

(assert (=> mapIsEmpty!53405 mapRes!53405))

(assert (= (and start!109434 res!861200) b!1295740))

(assert (= (and b!1295740 res!861203) b!1295739))

(assert (= (and b!1295739 res!861202) b!1295741))

(assert (= (and b!1295741 res!861205) b!1295744))

(assert (= (and b!1295744 res!861201) b!1295745))

(assert (= (and b!1295745 res!861199) b!1295737))

(assert (= (and b!1295737 res!861206) b!1295746))

(assert (= (and b!1295746 res!861207) b!1295743))

(assert (= (and b!1295743 (not res!861204)) b!1295735))

(assert (= (and b!1295742 condMapEmpty!53405) mapIsEmpty!53405))

(assert (= (and b!1295742 (not condMapEmpty!53405)) mapNonEmpty!53405))

(get-info :version)

(assert (= (and mapNonEmpty!53405 ((_ is ValueCellFull!16383) mapValue!53405)) b!1295738))

(assert (= (and b!1295742 ((_ is ValueCellFull!16383) mapDefault!53405)) b!1295736))

(assert (= start!109434 b!1295742))

(declare-fun m!1187719 () Bool)

(assert (=> b!1295743 m!1187719))

(declare-fun m!1187721 () Bool)

(assert (=> b!1295743 m!1187721))

(declare-fun m!1187723 () Bool)

(assert (=> b!1295746 m!1187723))

(assert (=> b!1295746 m!1187723))

(declare-fun m!1187725 () Bool)

(assert (=> b!1295746 m!1187725))

(declare-fun m!1187727 () Bool)

(assert (=> b!1295741 m!1187727))

(declare-fun m!1187729 () Bool)

(assert (=> mapNonEmpty!53405 m!1187729))

(declare-fun m!1187731 () Bool)

(assert (=> b!1295745 m!1187731))

(assert (=> b!1295745 m!1187731))

(declare-fun m!1187733 () Bool)

(assert (=> b!1295745 m!1187733))

(declare-fun m!1187735 () Bool)

(assert (=> start!109434 m!1187735))

(declare-fun m!1187737 () Bool)

(assert (=> start!109434 m!1187737))

(declare-fun m!1187739 () Bool)

(assert (=> start!109434 m!1187739))

(declare-fun m!1187741 () Bool)

(assert (=> b!1295735 m!1187741))

(assert (=> b!1295735 m!1187741))

(declare-fun m!1187743 () Bool)

(assert (=> b!1295735 m!1187743))

(declare-fun m!1187745 () Bool)

(assert (=> b!1295735 m!1187745))

(declare-fun m!1187747 () Bool)

(assert (=> b!1295735 m!1187747))

(declare-fun m!1187749 () Bool)

(assert (=> b!1295739 m!1187749))

(check-sat (not b!1295741) (not b_next!28923) (not b!1295735) (not b!1295739) (not b!1295746) (not b!1295743) (not mapNonEmpty!53405) (not b!1295745) tp_is_empty!34563 b_and!47013 (not start!109434))
(check-sat b_and!47013 (not b_next!28923))
