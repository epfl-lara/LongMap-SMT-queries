; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109722 () Bool)

(assert start!109722)

(declare-fun b_free!28987 () Bool)

(declare-fun b_next!28987 () Bool)

(assert (=> start!109722 (= b_free!28987 (not b_next!28987))))

(declare-fun tp!102080 () Bool)

(declare-fun b_and!47079 () Bool)

(assert (=> start!109722 (= tp!102080 b_and!47079)))

(declare-fun b!1298184 () Bool)

(declare-fun e!740721 () Bool)

(declare-fun tp_is_empty!34627 () Bool)

(assert (=> b!1298184 (= e!740721 tp_is_empty!34627)))

(declare-fun b!1298185 () Bool)

(declare-fun res!862417 () Bool)

(declare-fun e!740723 () Bool)

(assert (=> b!1298185 (=> (not res!862417) (not e!740723))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51273 0))(
  ( (V!51274 (val!17388 Int)) )
))
(declare-datatypes ((ValueCell!16415 0))(
  ( (ValueCellFull!16415 (v!19986 V!51273)) (EmptyCell!16415) )
))
(declare-datatypes ((array!86305 0))(
  ( (array!86306 (arr!41649 (Array (_ BitVec 32) ValueCell!16415)) (size!42200 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86305)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86307 0))(
  ( (array!86308 (arr!41650 (Array (_ BitVec 32) (_ BitVec 64))) (size!42201 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86307)

(assert (=> b!1298185 (= res!862417 (and (= (size!42200 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42201 _keys!1741) (size!42200 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298186 () Bool)

(declare-fun e!740720 () Bool)

(declare-fun e!740724 () Bool)

(declare-fun mapRes!53501 () Bool)

(assert (=> b!1298186 (= e!740720 (and e!740724 mapRes!53501))))

(declare-fun condMapEmpty!53501 () Bool)

(declare-fun mapDefault!53501 () ValueCell!16415)

(assert (=> b!1298186 (= condMapEmpty!53501 (= (arr!41649 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16415)) mapDefault!53501)))))

(declare-fun b!1298187 () Bool)

(declare-fun res!862415 () Bool)

(assert (=> b!1298187 (=> (not res!862415) (not e!740723))))

(declare-datatypes ((List!29574 0))(
  ( (Nil!29571) (Cons!29570 (h!30788 (_ BitVec 64)) (t!43130 List!29574)) )
))
(declare-fun arrayNoDuplicates!0 (array!86307 (_ BitVec 32) List!29574) Bool)

(assert (=> b!1298187 (= res!862415 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29571))))

(declare-fun b!1298188 () Bool)

(declare-fun res!862414 () Bool)

(assert (=> b!1298188 (=> (not res!862414) (not e!740723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86307 (_ BitVec 32)) Bool)

(assert (=> b!1298188 (= res!862414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298189 () Bool)

(assert (=> b!1298189 (= e!740723 false)))

(declare-fun minValue!1387 () V!51273)

(declare-fun zeroValue!1387 () V!51273)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!581010 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22408 0))(
  ( (tuple2!22409 (_1!11215 (_ BitVec 64)) (_2!11215 V!51273)) )
))
(declare-datatypes ((List!29575 0))(
  ( (Nil!29572) (Cons!29571 (h!30789 tuple2!22408) (t!43131 List!29575)) )
))
(declare-datatypes ((ListLongMap!20073 0))(
  ( (ListLongMap!20074 (toList!10052 List!29575)) )
))
(declare-fun contains!8182 (ListLongMap!20073 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5071 (array!86307 array!86305 (_ BitVec 32) (_ BitVec 32) V!51273 V!51273 (_ BitVec 32) Int) ListLongMap!20073)

(assert (=> b!1298189 (= lt!581010 (contains!8182 (getCurrentListMap!5071 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!862413 () Bool)

(assert (=> start!109722 (=> (not res!862413) (not e!740723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109722 (= res!862413 (validMask!0 mask!2175))))

(assert (=> start!109722 e!740723))

(assert (=> start!109722 tp_is_empty!34627))

(assert (=> start!109722 true))

(declare-fun array_inv!31763 (array!86305) Bool)

(assert (=> start!109722 (and (array_inv!31763 _values!1445) e!740720)))

(declare-fun array_inv!31764 (array!86307) Bool)

(assert (=> start!109722 (array_inv!31764 _keys!1741)))

(assert (=> start!109722 tp!102080))

(declare-fun mapNonEmpty!53501 () Bool)

(declare-fun tp!102079 () Bool)

(assert (=> mapNonEmpty!53501 (= mapRes!53501 (and tp!102079 e!740721))))

(declare-fun mapKey!53501 () (_ BitVec 32))

(declare-fun mapValue!53501 () ValueCell!16415)

(declare-fun mapRest!53501 () (Array (_ BitVec 32) ValueCell!16415))

(assert (=> mapNonEmpty!53501 (= (arr!41649 _values!1445) (store mapRest!53501 mapKey!53501 mapValue!53501))))

(declare-fun b!1298190 () Bool)

(assert (=> b!1298190 (= e!740724 tp_is_empty!34627)))

(declare-fun b!1298191 () Bool)

(declare-fun res!862416 () Bool)

(assert (=> b!1298191 (=> (not res!862416) (not e!740723))))

(assert (=> b!1298191 (= res!862416 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42201 _keys!1741))))))

(declare-fun mapIsEmpty!53501 () Bool)

(assert (=> mapIsEmpty!53501 mapRes!53501))

(assert (= (and start!109722 res!862413) b!1298185))

(assert (= (and b!1298185 res!862417) b!1298188))

(assert (= (and b!1298188 res!862414) b!1298187))

(assert (= (and b!1298187 res!862415) b!1298191))

(assert (= (and b!1298191 res!862416) b!1298189))

(assert (= (and b!1298186 condMapEmpty!53501) mapIsEmpty!53501))

(assert (= (and b!1298186 (not condMapEmpty!53501)) mapNonEmpty!53501))

(get-info :version)

(assert (= (and mapNonEmpty!53501 ((_ is ValueCellFull!16415) mapValue!53501)) b!1298184))

(assert (= (and b!1298186 ((_ is ValueCellFull!16415) mapDefault!53501)) b!1298190))

(assert (= start!109722 b!1298186))

(declare-fun m!1190277 () Bool)

(assert (=> b!1298188 m!1190277))

(declare-fun m!1190279 () Bool)

(assert (=> start!109722 m!1190279))

(declare-fun m!1190281 () Bool)

(assert (=> start!109722 m!1190281))

(declare-fun m!1190283 () Bool)

(assert (=> start!109722 m!1190283))

(declare-fun m!1190285 () Bool)

(assert (=> b!1298189 m!1190285))

(assert (=> b!1298189 m!1190285))

(declare-fun m!1190287 () Bool)

(assert (=> b!1298189 m!1190287))

(declare-fun m!1190289 () Bool)

(assert (=> b!1298187 m!1190289))

(declare-fun m!1190291 () Bool)

(assert (=> mapNonEmpty!53501 m!1190291))

(check-sat tp_is_empty!34627 (not mapNonEmpty!53501) b_and!47079 (not b!1298189) (not b_next!28987) (not b!1298187) (not b!1298188) (not start!109722))
(check-sat b_and!47079 (not b_next!28987))
