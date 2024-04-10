; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108990 () Bool)

(assert start!108990)

(declare-fun b_free!28479 () Bool)

(declare-fun b_next!28479 () Bool)

(assert (=> start!108990 (= b_free!28479 (not b_next!28479))))

(declare-fun tp!100556 () Bool)

(declare-fun b_and!46569 () Bool)

(assert (=> start!108990 (= tp!100556 b_and!46569)))

(declare-fun b!1287927 () Bool)

(declare-fun res!855394 () Bool)

(declare-fun e!735471 () Bool)

(assert (=> b!1287927 (=> (not res!855394) (not e!735471))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85286 0))(
  ( (array!85287 (arr!41144 (Array (_ BitVec 32) (_ BitVec 64))) (size!41694 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85286)

(assert (=> b!1287927 (= res!855394 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41694 _keys!1741))))))

(declare-fun b!1287928 () Bool)

(declare-fun res!855392 () Bool)

(assert (=> b!1287928 (=> (not res!855392) (not e!735471))))

(declare-datatypes ((List!29166 0))(
  ( (Nil!29163) (Cons!29162 (h!30371 (_ BitVec 64)) (t!42730 List!29166)) )
))
(declare-fun arrayNoDuplicates!0 (array!85286 (_ BitVec 32) List!29166) Bool)

(assert (=> b!1287928 (= res!855392 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29163))))

(declare-fun b!1287929 () Bool)

(declare-fun res!855390 () Bool)

(assert (=> b!1287929 (=> (not res!855390) (not e!735471))))

(assert (=> b!1287929 (= res!855390 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41694 _keys!1741))))))

(declare-fun b!1287930 () Bool)

(declare-fun e!735469 () Bool)

(declare-fun tp_is_empty!34119 () Bool)

(assert (=> b!1287930 (= e!735469 tp_is_empty!34119)))

(declare-fun b!1287931 () Bool)

(declare-fun res!855393 () Bool)

(assert (=> b!1287931 (=> (not res!855393) (not e!735471))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50595 0))(
  ( (V!50596 (val!17134 Int)) )
))
(declare-datatypes ((ValueCell!16161 0))(
  ( (ValueCellFull!16161 (v!19737 V!50595)) (EmptyCell!16161) )
))
(declare-datatypes ((array!85288 0))(
  ( (array!85289 (arr!41145 (Array (_ BitVec 32) ValueCell!16161)) (size!41695 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85288)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287931 (= res!855393 (and (= (size!41695 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41694 _keys!1741) (size!41695 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287932 () Bool)

(declare-fun res!855389 () Bool)

(assert (=> b!1287932 (=> (not res!855389) (not e!735471))))

(declare-fun minValue!1387 () V!50595)

(declare-fun zeroValue!1387 () V!50595)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21990 0))(
  ( (tuple2!21991 (_1!11006 (_ BitVec 64)) (_2!11006 V!50595)) )
))
(declare-datatypes ((List!29167 0))(
  ( (Nil!29164) (Cons!29163 (h!30372 tuple2!21990) (t!42731 List!29167)) )
))
(declare-datatypes ((ListLongMap!19647 0))(
  ( (ListLongMap!19648 (toList!9839 List!29167)) )
))
(declare-fun contains!7957 (ListLongMap!19647 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4907 (array!85286 array!85288 (_ BitVec 32) (_ BitVec 32) V!50595 V!50595 (_ BitVec 32) Int) ListLongMap!19647)

(assert (=> b!1287932 (= res!855389 (contains!7957 (getCurrentListMap!4907 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287933 () Bool)

(assert (=> b!1287933 (= e!735471 (not true))))

(assert (=> b!1287933 (not (contains!7957 (ListLongMap!19648 Nil!29164) k0!1205))))

(declare-datatypes ((Unit!42598 0))(
  ( (Unit!42599) )
))
(declare-fun lt!577910 () Unit!42598)

(declare-fun emptyContainsNothing!28 ((_ BitVec 64)) Unit!42598)

(assert (=> b!1287933 (= lt!577910 (emptyContainsNothing!28 k0!1205))))

(declare-fun b!1287934 () Bool)

(declare-fun res!855396 () Bool)

(assert (=> b!1287934 (=> (not res!855396) (not e!735471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287934 (= res!855396 (not (validKeyInArray!0 (select (arr!41144 _keys!1741) from!2144))))))

(declare-fun res!855395 () Bool)

(assert (=> start!108990 (=> (not res!855395) (not e!735471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108990 (= res!855395 (validMask!0 mask!2175))))

(assert (=> start!108990 e!735471))

(assert (=> start!108990 tp_is_empty!34119))

(assert (=> start!108990 true))

(declare-fun e!735472 () Bool)

(declare-fun array_inv!31201 (array!85288) Bool)

(assert (=> start!108990 (and (array_inv!31201 _values!1445) e!735472)))

(declare-fun array_inv!31202 (array!85286) Bool)

(assert (=> start!108990 (array_inv!31202 _keys!1741)))

(assert (=> start!108990 tp!100556))

(declare-fun mapNonEmpty!52739 () Bool)

(declare-fun mapRes!52739 () Bool)

(declare-fun tp!100555 () Bool)

(assert (=> mapNonEmpty!52739 (= mapRes!52739 (and tp!100555 e!735469))))

(declare-fun mapKey!52739 () (_ BitVec 32))

(declare-fun mapValue!52739 () ValueCell!16161)

(declare-fun mapRest!52739 () (Array (_ BitVec 32) ValueCell!16161))

(assert (=> mapNonEmpty!52739 (= (arr!41145 _values!1445) (store mapRest!52739 mapKey!52739 mapValue!52739))))

(declare-fun b!1287935 () Bool)

(declare-fun e!735473 () Bool)

(assert (=> b!1287935 (= e!735473 tp_is_empty!34119)))

(declare-fun b!1287936 () Bool)

(assert (=> b!1287936 (= e!735472 (and e!735473 mapRes!52739))))

(declare-fun condMapEmpty!52739 () Bool)

(declare-fun mapDefault!52739 () ValueCell!16161)

(assert (=> b!1287936 (= condMapEmpty!52739 (= (arr!41145 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16161)) mapDefault!52739)))))

(declare-fun b!1287937 () Bool)

(declare-fun res!855391 () Bool)

(assert (=> b!1287937 (=> (not res!855391) (not e!735471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85286 (_ BitVec 32)) Bool)

(assert (=> b!1287937 (= res!855391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52739 () Bool)

(assert (=> mapIsEmpty!52739 mapRes!52739))

(assert (= (and start!108990 res!855395) b!1287931))

(assert (= (and b!1287931 res!855393) b!1287937))

(assert (= (and b!1287937 res!855391) b!1287928))

(assert (= (and b!1287928 res!855392) b!1287929))

(assert (= (and b!1287929 res!855390) b!1287932))

(assert (= (and b!1287932 res!855389) b!1287927))

(assert (= (and b!1287927 res!855394) b!1287934))

(assert (= (and b!1287934 res!855396) b!1287933))

(assert (= (and b!1287936 condMapEmpty!52739) mapIsEmpty!52739))

(assert (= (and b!1287936 (not condMapEmpty!52739)) mapNonEmpty!52739))

(get-info :version)

(assert (= (and mapNonEmpty!52739 ((_ is ValueCellFull!16161) mapValue!52739)) b!1287930))

(assert (= (and b!1287936 ((_ is ValueCellFull!16161) mapDefault!52739)) b!1287935))

(assert (= start!108990 b!1287936))

(declare-fun m!1180655 () Bool)

(assert (=> b!1287932 m!1180655))

(assert (=> b!1287932 m!1180655))

(declare-fun m!1180657 () Bool)

(assert (=> b!1287932 m!1180657))

(declare-fun m!1180659 () Bool)

(assert (=> b!1287933 m!1180659))

(declare-fun m!1180661 () Bool)

(assert (=> b!1287933 m!1180661))

(declare-fun m!1180663 () Bool)

(assert (=> b!1287937 m!1180663))

(declare-fun m!1180665 () Bool)

(assert (=> start!108990 m!1180665))

(declare-fun m!1180667 () Bool)

(assert (=> start!108990 m!1180667))

(declare-fun m!1180669 () Bool)

(assert (=> start!108990 m!1180669))

(declare-fun m!1180671 () Bool)

(assert (=> b!1287928 m!1180671))

(declare-fun m!1180673 () Bool)

(assert (=> b!1287934 m!1180673))

(assert (=> b!1287934 m!1180673))

(declare-fun m!1180675 () Bool)

(assert (=> b!1287934 m!1180675))

(declare-fun m!1180677 () Bool)

(assert (=> mapNonEmpty!52739 m!1180677))

(check-sat (not b!1287933) (not b!1287937) tp_is_empty!34119 (not mapNonEmpty!52739) (not b!1287934) b_and!46569 (not b_next!28479) (not start!108990) (not b!1287928) (not b!1287932))
(check-sat b_and!46569 (not b_next!28479))
