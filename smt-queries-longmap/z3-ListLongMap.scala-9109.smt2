; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109438 () Bool)

(assert start!109438)

(declare-fun b_free!28927 () Bool)

(declare-fun b_next!28927 () Bool)

(assert (=> start!109438 (= b_free!28927 (not b_next!28927))))

(declare-fun tp!101900 () Bool)

(declare-fun b_and!46999 () Bool)

(assert (=> start!109438 (= tp!101900 b_and!46999)))

(declare-fun b!1295743 () Bool)

(declare-fun res!861233 () Bool)

(declare-fun e!739293 () Bool)

(assert (=> b!1295743 (=> (not res!861233) (not e!739293))))

(declare-datatypes ((array!86045 0))(
  ( (array!86046 (arr!41524 (Array (_ BitVec 32) (_ BitVec 64))) (size!42076 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86045)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86045 (_ BitVec 32)) Bool)

(assert (=> b!1295743 (= res!861233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53411 () Bool)

(declare-fun mapRes!53411 () Bool)

(declare-fun tp!101901 () Bool)

(declare-fun e!739288 () Bool)

(assert (=> mapNonEmpty!53411 (= mapRes!53411 (and tp!101901 e!739288))))

(declare-fun mapKey!53411 () (_ BitVec 32))

(declare-datatypes ((V!51193 0))(
  ( (V!51194 (val!17358 Int)) )
))
(declare-datatypes ((ValueCell!16385 0))(
  ( (ValueCellFull!16385 (v!19960 V!51193)) (EmptyCell!16385) )
))
(declare-fun mapRest!53411 () (Array (_ BitVec 32) ValueCell!16385))

(declare-fun mapValue!53411 () ValueCell!16385)

(declare-datatypes ((array!86047 0))(
  ( (array!86048 (arr!41525 (Array (_ BitVec 32) ValueCell!16385)) (size!42077 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86047)

(assert (=> mapNonEmpty!53411 (= (arr!41525 _values!1445) (store mapRest!53411 mapKey!53411 mapValue!53411))))

(declare-fun b!1295745 () Bool)

(declare-fun res!861230 () Bool)

(assert (=> b!1295745 (=> (not res!861230) (not e!739293))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295745 (= res!861230 (not (validKeyInArray!0 (select (arr!41524 _keys!1741) from!2144))))))

(declare-fun b!1295746 () Bool)

(declare-fun res!861226 () Bool)

(assert (=> b!1295746 (=> (not res!861226) (not e!739293))))

(assert (=> b!1295746 (= res!861226 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42076 _keys!1741))))))

(declare-fun b!1295747 () Bool)

(declare-fun res!861232 () Bool)

(assert (=> b!1295747 (=> (not res!861232) (not e!739293))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1295747 (= res!861232 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42076 _keys!1741))))))

(declare-fun b!1295748 () Bool)

(declare-fun res!861231 () Bool)

(assert (=> b!1295748 (=> (not res!861231) (not e!739293))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295748 (= res!861231 (and (= (size!42077 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42076 _keys!1741) (size!42077 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295749 () Bool)

(declare-fun tp_is_empty!34567 () Bool)

(assert (=> b!1295749 (= e!739288 tp_is_empty!34567)))

(declare-fun b!1295744 () Bool)

(declare-fun res!861234 () Bool)

(assert (=> b!1295744 (=> (not res!861234) (not e!739293))))

(declare-datatypes ((List!29537 0))(
  ( (Nil!29534) (Cons!29533 (h!30742 (_ BitVec 64)) (t!43093 List!29537)) )
))
(declare-fun arrayNoDuplicates!0 (array!86045 (_ BitVec 32) List!29537) Bool)

(assert (=> b!1295744 (= res!861234 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29534))))

(declare-fun res!861227 () Bool)

(assert (=> start!109438 (=> (not res!861227) (not e!739293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109438 (= res!861227 (validMask!0 mask!2175))))

(assert (=> start!109438 e!739293))

(assert (=> start!109438 tp_is_empty!34567))

(assert (=> start!109438 true))

(declare-fun e!739291 () Bool)

(declare-fun array_inv!31599 (array!86047) Bool)

(assert (=> start!109438 (and (array_inv!31599 _values!1445) e!739291)))

(declare-fun array_inv!31600 (array!86045) Bool)

(assert (=> start!109438 (array_inv!31600 _keys!1741)))

(assert (=> start!109438 tp!101900))

(declare-fun b!1295750 () Bool)

(declare-fun e!739289 () Bool)

(assert (=> b!1295750 (= e!739289 tp_is_empty!34567)))

(declare-fun b!1295751 () Bool)

(assert (=> b!1295751 (= e!739291 (and e!739289 mapRes!53411))))

(declare-fun condMapEmpty!53411 () Bool)

(declare-fun mapDefault!53411 () ValueCell!16385)

(assert (=> b!1295751 (= condMapEmpty!53411 (= (arr!41525 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16385)) mapDefault!53411)))))

(declare-fun b!1295752 () Bool)

(declare-fun res!861229 () Bool)

(assert (=> b!1295752 (=> (not res!861229) (not e!739293))))

(declare-fun minValue!1387 () V!51193)

(declare-fun zeroValue!1387 () V!51193)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22406 0))(
  ( (tuple2!22407 (_1!11214 (_ BitVec 64)) (_2!11214 V!51193)) )
))
(declare-datatypes ((List!29538 0))(
  ( (Nil!29535) (Cons!29534 (h!30743 tuple2!22406) (t!43094 List!29538)) )
))
(declare-datatypes ((ListLongMap!20063 0))(
  ( (ListLongMap!20064 (toList!10047 List!29538)) )
))
(declare-fun contains!8095 (ListLongMap!20063 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4970 (array!86045 array!86047 (_ BitVec 32) (_ BitVec 32) V!51193 V!51193 (_ BitVec 32) Int) ListLongMap!20063)

(assert (=> b!1295752 (= res!861229 (contains!8095 (getCurrentListMap!4970 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53411 () Bool)

(assert (=> mapIsEmpty!53411 mapRes!53411))

(declare-fun b!1295753 () Bool)

(declare-fun e!739292 () Bool)

(assert (=> b!1295753 (= e!739292 (bvsle from!2144 (size!42076 _keys!1741)))))

(declare-fun lt!579814 () ListLongMap!20063)

(declare-fun +!4460 (ListLongMap!20063 tuple2!22406) ListLongMap!20063)

(assert (=> b!1295753 (not (contains!8095 (+!4460 lt!579814 (tuple2!22407 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42762 0))(
  ( (Unit!42763) )
))
(declare-fun lt!579812 () Unit!42762)

(declare-fun addStillNotContains!437 (ListLongMap!20063 (_ BitVec 64) V!51193 (_ BitVec 64)) Unit!42762)

(assert (=> b!1295753 (= lt!579812 (addStillNotContains!437 lt!579814 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6094 (array!86045 array!86047 (_ BitVec 32) (_ BitVec 32) V!51193 V!51193 (_ BitVec 32) Int) ListLongMap!20063)

(assert (=> b!1295753 (= lt!579814 (getCurrentListMapNoExtraKeys!6094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295754 () Bool)

(assert (=> b!1295754 (= e!739293 (not e!739292))))

(declare-fun res!861228 () Bool)

(assert (=> b!1295754 (=> res!861228 e!739292)))

(assert (=> b!1295754 (= res!861228 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295754 (not (contains!8095 (ListLongMap!20064 Nil!29535) k0!1205))))

(declare-fun lt!579813 () Unit!42762)

(declare-fun emptyContainsNothing!173 ((_ BitVec 64)) Unit!42762)

(assert (=> b!1295754 (= lt!579813 (emptyContainsNothing!173 k0!1205))))

(assert (= (and start!109438 res!861227) b!1295748))

(assert (= (and b!1295748 res!861231) b!1295743))

(assert (= (and b!1295743 res!861233) b!1295744))

(assert (= (and b!1295744 res!861234) b!1295746))

(assert (= (and b!1295746 res!861226) b!1295752))

(assert (= (and b!1295752 res!861229) b!1295747))

(assert (= (and b!1295747 res!861232) b!1295745))

(assert (= (and b!1295745 res!861230) b!1295754))

(assert (= (and b!1295754 (not res!861228)) b!1295753))

(assert (= (and b!1295751 condMapEmpty!53411) mapIsEmpty!53411))

(assert (= (and b!1295751 (not condMapEmpty!53411)) mapNonEmpty!53411))

(get-info :version)

(assert (= (and mapNonEmpty!53411 ((_ is ValueCellFull!16385) mapValue!53411)) b!1295749))

(assert (= (and b!1295751 ((_ is ValueCellFull!16385) mapDefault!53411)) b!1295750))

(assert (= start!109438 b!1295751))

(declare-fun m!1187283 () Bool)

(assert (=> b!1295745 m!1187283))

(assert (=> b!1295745 m!1187283))

(declare-fun m!1187285 () Bool)

(assert (=> b!1295745 m!1187285))

(declare-fun m!1187287 () Bool)

(assert (=> start!109438 m!1187287))

(declare-fun m!1187289 () Bool)

(assert (=> start!109438 m!1187289))

(declare-fun m!1187291 () Bool)

(assert (=> start!109438 m!1187291))

(declare-fun m!1187293 () Bool)

(assert (=> b!1295753 m!1187293))

(assert (=> b!1295753 m!1187293))

(declare-fun m!1187295 () Bool)

(assert (=> b!1295753 m!1187295))

(declare-fun m!1187297 () Bool)

(assert (=> b!1295753 m!1187297))

(declare-fun m!1187299 () Bool)

(assert (=> b!1295753 m!1187299))

(declare-fun m!1187301 () Bool)

(assert (=> b!1295754 m!1187301))

(declare-fun m!1187303 () Bool)

(assert (=> b!1295754 m!1187303))

(declare-fun m!1187305 () Bool)

(assert (=> b!1295744 m!1187305))

(declare-fun m!1187307 () Bool)

(assert (=> mapNonEmpty!53411 m!1187307))

(declare-fun m!1187309 () Bool)

(assert (=> b!1295743 m!1187309))

(declare-fun m!1187311 () Bool)

(assert (=> b!1295752 m!1187311))

(assert (=> b!1295752 m!1187311))

(declare-fun m!1187313 () Bool)

(assert (=> b!1295752 m!1187313))

(check-sat (not b!1295752) b_and!46999 (not b!1295753) (not b!1295744) tp_is_empty!34567 (not mapNonEmpty!53411) (not b!1295754) (not b_next!28927) (not b!1295745) (not start!109438) (not b!1295743))
(check-sat b_and!46999 (not b_next!28927))
