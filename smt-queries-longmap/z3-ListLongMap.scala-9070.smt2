; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109204 () Bool)

(assert start!109204)

(declare-fun b_free!28693 () Bool)

(declare-fun b_next!28693 () Bool)

(assert (=> start!109204 (= b_free!28693 (not b_next!28693))))

(declare-fun tp!101199 () Bool)

(declare-fun b_and!46765 () Bool)

(assert (=> start!109204 (= tp!101199 b_and!46765)))

(declare-fun b!1291691 () Bool)

(declare-fun e!737342 () Bool)

(assert (=> b!1291691 (= e!737342 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50881 0))(
  ( (V!50882 (val!17241 Int)) )
))
(declare-datatypes ((tuple2!22212 0))(
  ( (tuple2!22213 (_1!11117 (_ BitVec 64)) (_2!11117 V!50881)) )
))
(declare-datatypes ((List!29367 0))(
  ( (Nil!29364) (Cons!29363 (h!30572 tuple2!22212) (t!42923 List!29367)) )
))
(declare-datatypes ((ListLongMap!19869 0))(
  ( (ListLongMap!19870 (toList!9950 List!29367)) )
))
(declare-fun contains!7998 (ListLongMap!19869 (_ BitVec 64)) Bool)

(assert (=> b!1291691 (not (contains!7998 (ListLongMap!19870 Nil!29364) k0!1205))))

(declare-datatypes ((Unit!42592 0))(
  ( (Unit!42593) )
))
(declare-fun lt!579097 () Unit!42592)

(declare-fun emptyContainsNothing!93 ((_ BitVec 64)) Unit!42592)

(assert (=> b!1291691 (= lt!579097 (emptyContainsNothing!93 k0!1205))))

(declare-fun b!1291692 () Bool)

(declare-fun res!858231 () Bool)

(assert (=> b!1291692 (=> (not res!858231) (not e!737342))))

(declare-datatypes ((array!85583 0))(
  ( (array!85584 (arr!41293 (Array (_ BitVec 32) (_ BitVec 64))) (size!41845 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85583)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85583 (_ BitVec 32)) Bool)

(assert (=> b!1291692 (= res!858231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291693 () Bool)

(declare-fun e!737344 () Bool)

(declare-fun e!737343 () Bool)

(declare-fun mapRes!53060 () Bool)

(assert (=> b!1291693 (= e!737344 (and e!737343 mapRes!53060))))

(declare-fun condMapEmpty!53060 () Bool)

(declare-datatypes ((ValueCell!16268 0))(
  ( (ValueCellFull!16268 (v!19843 V!50881)) (EmptyCell!16268) )
))
(declare-datatypes ((array!85585 0))(
  ( (array!85586 (arr!41294 (Array (_ BitVec 32) ValueCell!16268)) (size!41846 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85585)

(declare-fun mapDefault!53060 () ValueCell!16268)

(assert (=> b!1291693 (= condMapEmpty!53060 (= (arr!41294 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16268)) mapDefault!53060)))))

(declare-fun res!858228 () Bool)

(assert (=> start!109204 (=> (not res!858228) (not e!737342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109204 (= res!858228 (validMask!0 mask!2175))))

(assert (=> start!109204 e!737342))

(declare-fun tp_is_empty!34333 () Bool)

(assert (=> start!109204 tp_is_empty!34333))

(assert (=> start!109204 true))

(declare-fun array_inv!31451 (array!85585) Bool)

(assert (=> start!109204 (and (array_inv!31451 _values!1445) e!737344)))

(declare-fun array_inv!31452 (array!85583) Bool)

(assert (=> start!109204 (array_inv!31452 _keys!1741)))

(assert (=> start!109204 tp!101199))

(declare-fun b!1291694 () Bool)

(declare-fun res!858233 () Bool)

(assert (=> b!1291694 (=> (not res!858233) (not e!737342))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1291694 (= res!858233 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41845 _keys!1741))))))

(declare-fun b!1291695 () Bool)

(declare-fun res!858232 () Bool)

(assert (=> b!1291695 (=> (not res!858232) (not e!737342))))

(assert (=> b!1291695 (= res!858232 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41845 _keys!1741))))))

(declare-fun b!1291696 () Bool)

(declare-fun res!858229 () Bool)

(assert (=> b!1291696 (=> (not res!858229) (not e!737342))))

(declare-fun minValue!1387 () V!50881)

(declare-fun zeroValue!1387 () V!50881)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4896 (array!85583 array!85585 (_ BitVec 32) (_ BitVec 32) V!50881 V!50881 (_ BitVec 32) Int) ListLongMap!19869)

(assert (=> b!1291696 (= res!858229 (contains!7998 (getCurrentListMap!4896 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291697 () Bool)

(declare-fun res!858234 () Bool)

(assert (=> b!1291697 (=> (not res!858234) (not e!737342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291697 (= res!858234 (not (validKeyInArray!0 (select (arr!41293 _keys!1741) from!2144))))))

(declare-fun b!1291698 () Bool)

(assert (=> b!1291698 (= e!737343 tp_is_empty!34333)))

(declare-fun mapNonEmpty!53060 () Bool)

(declare-fun tp!101198 () Bool)

(declare-fun e!737345 () Bool)

(assert (=> mapNonEmpty!53060 (= mapRes!53060 (and tp!101198 e!737345))))

(declare-fun mapValue!53060 () ValueCell!16268)

(declare-fun mapRest!53060 () (Array (_ BitVec 32) ValueCell!16268))

(declare-fun mapKey!53060 () (_ BitVec 32))

(assert (=> mapNonEmpty!53060 (= (arr!41294 _values!1445) (store mapRest!53060 mapKey!53060 mapValue!53060))))

(declare-fun mapIsEmpty!53060 () Bool)

(assert (=> mapIsEmpty!53060 mapRes!53060))

(declare-fun b!1291699 () Bool)

(declare-fun res!858230 () Bool)

(assert (=> b!1291699 (=> (not res!858230) (not e!737342))))

(assert (=> b!1291699 (= res!858230 (and (= (size!41846 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41845 _keys!1741) (size!41846 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291700 () Bool)

(assert (=> b!1291700 (= e!737345 tp_is_empty!34333)))

(declare-fun b!1291701 () Bool)

(declare-fun res!858227 () Bool)

(assert (=> b!1291701 (=> (not res!858227) (not e!737342))))

(declare-datatypes ((List!29368 0))(
  ( (Nil!29365) (Cons!29364 (h!30573 (_ BitVec 64)) (t!42924 List!29368)) )
))
(declare-fun arrayNoDuplicates!0 (array!85583 (_ BitVec 32) List!29368) Bool)

(assert (=> b!1291701 (= res!858227 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29365))))

(assert (= (and start!109204 res!858228) b!1291699))

(assert (= (and b!1291699 res!858230) b!1291692))

(assert (= (and b!1291692 res!858231) b!1291701))

(assert (= (and b!1291701 res!858227) b!1291695))

(assert (= (and b!1291695 res!858232) b!1291696))

(assert (= (and b!1291696 res!858229) b!1291694))

(assert (= (and b!1291694 res!858233) b!1291697))

(assert (= (and b!1291697 res!858234) b!1291691))

(assert (= (and b!1291693 condMapEmpty!53060) mapIsEmpty!53060))

(assert (= (and b!1291693 (not condMapEmpty!53060)) mapNonEmpty!53060))

(get-info :version)

(assert (= (and mapNonEmpty!53060 ((_ is ValueCellFull!16268) mapValue!53060)) b!1291700))

(assert (= (and b!1291693 ((_ is ValueCellFull!16268) mapDefault!53060)) b!1291698))

(assert (= start!109204 b!1291693))

(declare-fun m!1183995 () Bool)

(assert (=> mapNonEmpty!53060 m!1183995))

(declare-fun m!1183997 () Bool)

(assert (=> b!1291696 m!1183997))

(assert (=> b!1291696 m!1183997))

(declare-fun m!1183999 () Bool)

(assert (=> b!1291696 m!1183999))

(declare-fun m!1184001 () Bool)

(assert (=> start!109204 m!1184001))

(declare-fun m!1184003 () Bool)

(assert (=> start!109204 m!1184003))

(declare-fun m!1184005 () Bool)

(assert (=> start!109204 m!1184005))

(declare-fun m!1184007 () Bool)

(assert (=> b!1291697 m!1184007))

(assert (=> b!1291697 m!1184007))

(declare-fun m!1184009 () Bool)

(assert (=> b!1291697 m!1184009))

(declare-fun m!1184011 () Bool)

(assert (=> b!1291691 m!1184011))

(declare-fun m!1184013 () Bool)

(assert (=> b!1291691 m!1184013))

(declare-fun m!1184015 () Bool)

(assert (=> b!1291692 m!1184015))

(declare-fun m!1184017 () Bool)

(assert (=> b!1291701 m!1184017))

(check-sat (not b!1291696) (not mapNonEmpty!53060) b_and!46765 (not start!109204) (not b!1291691) (not b_next!28693) (not b!1291697) (not b!1291692) (not b!1291701) tp_is_empty!34333)
(check-sat b_and!46765 (not b_next!28693))
