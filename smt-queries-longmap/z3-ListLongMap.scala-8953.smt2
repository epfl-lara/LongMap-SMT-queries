; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108668 () Bool)

(assert start!108668)

(declare-fun b_free!27991 () Bool)

(declare-fun b_next!27991 () Bool)

(assert (=> start!108668 (= b_free!27991 (not b_next!27991))))

(declare-fun tp!99082 () Bool)

(declare-fun b_and!46053 () Bool)

(assert (=> start!108668 (= tp!99082 b_and!46053)))

(declare-fun b!1281210 () Bool)

(declare-fun res!850722 () Bool)

(declare-fun e!732144 () Bool)

(assert (=> b!1281210 (=> (not res!850722) (not e!732144))))

(declare-datatypes ((array!84371 0))(
  ( (array!84372 (arr!40685 (Array (_ BitVec 32) (_ BitVec 64))) (size!41236 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84371)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84371 (_ BitVec 32)) Bool)

(assert (=> b!1281210 (= res!850722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281211 () Bool)

(declare-fun e!732145 () Bool)

(declare-fun tp_is_empty!33631 () Bool)

(assert (=> b!1281211 (= e!732145 tp_is_empty!33631)))

(declare-fun b!1281212 () Bool)

(declare-fun e!732143 () Bool)

(assert (=> b!1281212 (= e!732143 tp_is_empty!33631)))

(declare-fun b!1281213 () Bool)

(assert (=> b!1281213 (= e!732144 false)))

(declare-datatypes ((V!49945 0))(
  ( (V!49946 (val!16890 Int)) )
))
(declare-fun minValue!1387 () V!49945)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15917 0))(
  ( (ValueCellFull!15917 (v!19485 V!49945)) (EmptyCell!15917) )
))
(declare-datatypes ((array!84373 0))(
  ( (array!84374 (arr!40686 (Array (_ BitVec 32) ValueCell!15917)) (size!41237 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84373)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576543 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!49945)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21636 0))(
  ( (tuple2!21637 (_1!10829 (_ BitVec 64)) (_2!10829 V!49945)) )
))
(declare-datatypes ((List!28850 0))(
  ( (Nil!28847) (Cons!28846 (h!30064 tuple2!21636) (t!42382 List!28850)) )
))
(declare-datatypes ((ListLongMap!19301 0))(
  ( (ListLongMap!19302 (toList!9666 List!28850)) )
))
(declare-fun contains!7795 (ListLongMap!19301 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4735 (array!84371 array!84373 (_ BitVec 32) (_ BitVec 32) V!49945 V!49945 (_ BitVec 32) Int) ListLongMap!19301)

(assert (=> b!1281213 (= lt!576543 (contains!7795 (getCurrentListMap!4735 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281214 () Bool)

(declare-fun res!850721 () Bool)

(assert (=> b!1281214 (=> (not res!850721) (not e!732144))))

(assert (=> b!1281214 (= res!850721 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41236 _keys!1741))))))

(declare-fun b!1281215 () Bool)

(declare-fun res!850724 () Bool)

(assert (=> b!1281215 (=> (not res!850724) (not e!732144))))

(assert (=> b!1281215 (= res!850724 (and (= (size!41237 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41236 _keys!1741) (size!41237 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!850723 () Bool)

(assert (=> start!108668 (=> (not res!850723) (not e!732144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108668 (= res!850723 (validMask!0 mask!2175))))

(assert (=> start!108668 e!732144))

(assert (=> start!108668 tp_is_empty!33631))

(assert (=> start!108668 true))

(declare-fun e!732146 () Bool)

(declare-fun array_inv!31083 (array!84373) Bool)

(assert (=> start!108668 (and (array_inv!31083 _values!1445) e!732146)))

(declare-fun array_inv!31084 (array!84371) Bool)

(assert (=> start!108668 (array_inv!31084 _keys!1741)))

(assert (=> start!108668 tp!99082))

(declare-fun mapNonEmpty!51998 () Bool)

(declare-fun mapRes!51998 () Bool)

(declare-fun tp!99083 () Bool)

(assert (=> mapNonEmpty!51998 (= mapRes!51998 (and tp!99083 e!732143))))

(declare-fun mapValue!51998 () ValueCell!15917)

(declare-fun mapRest!51998 () (Array (_ BitVec 32) ValueCell!15917))

(declare-fun mapKey!51998 () (_ BitVec 32))

(assert (=> mapNonEmpty!51998 (= (arr!40686 _values!1445) (store mapRest!51998 mapKey!51998 mapValue!51998))))

(declare-fun b!1281216 () Bool)

(declare-fun res!850725 () Bool)

(assert (=> b!1281216 (=> (not res!850725) (not e!732144))))

(declare-datatypes ((List!28851 0))(
  ( (Nil!28848) (Cons!28847 (h!30065 (_ BitVec 64)) (t!42383 List!28851)) )
))
(declare-fun arrayNoDuplicates!0 (array!84371 (_ BitVec 32) List!28851) Bool)

(assert (=> b!1281216 (= res!850725 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28848))))

(declare-fun b!1281217 () Bool)

(assert (=> b!1281217 (= e!732146 (and e!732145 mapRes!51998))))

(declare-fun condMapEmpty!51998 () Bool)

(declare-fun mapDefault!51998 () ValueCell!15917)

(assert (=> b!1281217 (= condMapEmpty!51998 (= (arr!40686 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15917)) mapDefault!51998)))))

(declare-fun mapIsEmpty!51998 () Bool)

(assert (=> mapIsEmpty!51998 mapRes!51998))

(assert (= (and start!108668 res!850723) b!1281215))

(assert (= (and b!1281215 res!850724) b!1281210))

(assert (= (and b!1281210 res!850722) b!1281216))

(assert (= (and b!1281216 res!850725) b!1281214))

(assert (= (and b!1281214 res!850721) b!1281213))

(assert (= (and b!1281217 condMapEmpty!51998) mapIsEmpty!51998))

(assert (= (and b!1281217 (not condMapEmpty!51998)) mapNonEmpty!51998))

(get-info :version)

(assert (= (and mapNonEmpty!51998 ((_ is ValueCellFull!15917) mapValue!51998)) b!1281212))

(assert (= (and b!1281217 ((_ is ValueCellFull!15917) mapDefault!51998)) b!1281211))

(assert (= start!108668 b!1281217))

(declare-fun m!1176321 () Bool)

(assert (=> mapNonEmpty!51998 m!1176321))

(declare-fun m!1176323 () Bool)

(assert (=> b!1281216 m!1176323))

(declare-fun m!1176325 () Bool)

(assert (=> b!1281213 m!1176325))

(assert (=> b!1281213 m!1176325))

(declare-fun m!1176327 () Bool)

(assert (=> b!1281213 m!1176327))

(declare-fun m!1176329 () Bool)

(assert (=> b!1281210 m!1176329))

(declare-fun m!1176331 () Bool)

(assert (=> start!108668 m!1176331))

(declare-fun m!1176333 () Bool)

(assert (=> start!108668 m!1176333))

(declare-fun m!1176335 () Bool)

(assert (=> start!108668 m!1176335))

(check-sat (not b_next!27991) tp_is_empty!33631 (not b!1281210) (not start!108668) (not b!1281213) (not mapNonEmpty!51998) (not b!1281216) b_and!46053)
(check-sat b_and!46053 (not b_next!27991))
