; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109758 () Bool)

(assert start!109758)

(declare-fun b_free!29023 () Bool)

(declare-fun b_next!29023 () Bool)

(assert (=> start!109758 (= b_free!29023 (not b_next!29023))))

(declare-fun tp!102188 () Bool)

(declare-fun b_and!47115 () Bool)

(assert (=> start!109758 (= tp!102188 b_and!47115)))

(declare-fun res!862686 () Bool)

(declare-fun e!740991 () Bool)

(assert (=> start!109758 (=> (not res!862686) (not e!740991))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109758 (= res!862686 (validMask!0 mask!2175))))

(assert (=> start!109758 e!740991))

(declare-fun tp_is_empty!34663 () Bool)

(assert (=> start!109758 tp_is_empty!34663))

(assert (=> start!109758 true))

(declare-datatypes ((V!51321 0))(
  ( (V!51322 (val!17406 Int)) )
))
(declare-datatypes ((ValueCell!16433 0))(
  ( (ValueCellFull!16433 (v!20004 V!51321)) (EmptyCell!16433) )
))
(declare-datatypes ((array!86375 0))(
  ( (array!86376 (arr!41684 (Array (_ BitVec 32) ValueCell!16433)) (size!42235 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86375)

(declare-fun e!740994 () Bool)

(declare-fun array_inv!31785 (array!86375) Bool)

(assert (=> start!109758 (and (array_inv!31785 _values!1445) e!740994)))

(declare-datatypes ((array!86377 0))(
  ( (array!86378 (arr!41685 (Array (_ BitVec 32) (_ BitVec 64))) (size!42236 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86377)

(declare-fun array_inv!31786 (array!86377) Bool)

(assert (=> start!109758 (array_inv!31786 _keys!1741)))

(assert (=> start!109758 tp!102188))

(declare-fun mapNonEmpty!53555 () Bool)

(declare-fun mapRes!53555 () Bool)

(declare-fun tp!102187 () Bool)

(declare-fun e!740992 () Bool)

(assert (=> mapNonEmpty!53555 (= mapRes!53555 (and tp!102187 e!740992))))

(declare-fun mapRest!53555 () (Array (_ BitVec 32) ValueCell!16433))

(declare-fun mapKey!53555 () (_ BitVec 32))

(declare-fun mapValue!53555 () ValueCell!16433)

(assert (=> mapNonEmpty!53555 (= (arr!41684 _values!1445) (store mapRest!53555 mapKey!53555 mapValue!53555))))

(declare-fun b!1298616 () Bool)

(assert (=> b!1298616 (= e!740991 false)))

(declare-fun minValue!1387 () V!51321)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!51321)

(declare-fun lt!581064 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22438 0))(
  ( (tuple2!22439 (_1!11230 (_ BitVec 64)) (_2!11230 V!51321)) )
))
(declare-datatypes ((List!29602 0))(
  ( (Nil!29599) (Cons!29598 (h!30816 tuple2!22438) (t!43158 List!29602)) )
))
(declare-datatypes ((ListLongMap!20103 0))(
  ( (ListLongMap!20104 (toList!10067 List!29602)) )
))
(declare-fun contains!8197 (ListLongMap!20103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5086 (array!86377 array!86375 (_ BitVec 32) (_ BitVec 32) V!51321 V!51321 (_ BitVec 32) Int) ListLongMap!20103)

(assert (=> b!1298616 (= lt!581064 (contains!8197 (getCurrentListMap!5086 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1298617 () Bool)

(declare-fun res!862685 () Bool)

(assert (=> b!1298617 (=> (not res!862685) (not e!740991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86377 (_ BitVec 32)) Bool)

(assert (=> b!1298617 (= res!862685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298618 () Bool)

(declare-fun res!862684 () Bool)

(assert (=> b!1298618 (=> (not res!862684) (not e!740991))))

(assert (=> b!1298618 (= res!862684 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42236 _keys!1741))))))

(declare-fun b!1298619 () Bool)

(declare-fun res!862683 () Bool)

(assert (=> b!1298619 (=> (not res!862683) (not e!740991))))

(declare-datatypes ((List!29603 0))(
  ( (Nil!29600) (Cons!29599 (h!30817 (_ BitVec 64)) (t!43159 List!29603)) )
))
(declare-fun arrayNoDuplicates!0 (array!86377 (_ BitVec 32) List!29603) Bool)

(assert (=> b!1298619 (= res!862683 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29600))))

(declare-fun b!1298620 () Bool)

(declare-fun e!740990 () Bool)

(assert (=> b!1298620 (= e!740990 tp_is_empty!34663)))

(declare-fun b!1298621 () Bool)

(declare-fun res!862687 () Bool)

(assert (=> b!1298621 (=> (not res!862687) (not e!740991))))

(assert (=> b!1298621 (= res!862687 (and (= (size!42235 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42236 _keys!1741) (size!42235 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53555 () Bool)

(assert (=> mapIsEmpty!53555 mapRes!53555))

(declare-fun b!1298622 () Bool)

(assert (=> b!1298622 (= e!740992 tp_is_empty!34663)))

(declare-fun b!1298623 () Bool)

(assert (=> b!1298623 (= e!740994 (and e!740990 mapRes!53555))))

(declare-fun condMapEmpty!53555 () Bool)

(declare-fun mapDefault!53555 () ValueCell!16433)

(assert (=> b!1298623 (= condMapEmpty!53555 (= (arr!41684 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16433)) mapDefault!53555)))))

(assert (= (and start!109758 res!862686) b!1298621))

(assert (= (and b!1298621 res!862687) b!1298617))

(assert (= (and b!1298617 res!862685) b!1298619))

(assert (= (and b!1298619 res!862683) b!1298618))

(assert (= (and b!1298618 res!862684) b!1298616))

(assert (= (and b!1298623 condMapEmpty!53555) mapIsEmpty!53555))

(assert (= (and b!1298623 (not condMapEmpty!53555)) mapNonEmpty!53555))

(get-info :version)

(assert (= (and mapNonEmpty!53555 ((_ is ValueCellFull!16433) mapValue!53555)) b!1298622))

(assert (= (and b!1298623 ((_ is ValueCellFull!16433) mapDefault!53555)) b!1298620))

(assert (= start!109758 b!1298623))

(declare-fun m!1190565 () Bool)

(assert (=> start!109758 m!1190565))

(declare-fun m!1190567 () Bool)

(assert (=> start!109758 m!1190567))

(declare-fun m!1190569 () Bool)

(assert (=> start!109758 m!1190569))

(declare-fun m!1190571 () Bool)

(assert (=> b!1298616 m!1190571))

(assert (=> b!1298616 m!1190571))

(declare-fun m!1190573 () Bool)

(assert (=> b!1298616 m!1190573))

(declare-fun m!1190575 () Bool)

(assert (=> b!1298619 m!1190575))

(declare-fun m!1190577 () Bool)

(assert (=> mapNonEmpty!53555 m!1190577))

(declare-fun m!1190579 () Bool)

(assert (=> b!1298617 m!1190579))

(check-sat (not b!1298617) (not b!1298619) (not start!109758) (not b!1298616) (not b_next!29023) tp_is_empty!34663 b_and!47115 (not mapNonEmpty!53555))
(check-sat b_and!47115 (not b_next!29023))
