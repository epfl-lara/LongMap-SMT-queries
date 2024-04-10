; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108714 () Bool)

(assert start!108714)

(declare-fun b_free!28227 () Bool)

(declare-fun b_next!28227 () Bool)

(assert (=> start!108714 (= b_free!28227 (not b_next!28227))))

(declare-fun tp!99796 () Bool)

(declare-fun b_and!46293 () Bool)

(assert (=> start!108714 (= tp!99796 b_and!46293)))

(declare-fun b!1283524 () Bool)

(declare-fun res!852610 () Bool)

(declare-fun e!733262 () Bool)

(assert (=> b!1283524 (=> (not res!852610) (not e!733262))))

(declare-datatypes ((array!84796 0))(
  ( (array!84797 (arr!40900 (Array (_ BitVec 32) (_ BitVec 64))) (size!41450 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84796)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84796 (_ BitVec 32)) Bool)

(assert (=> b!1283524 (= res!852610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283525 () Bool)

(declare-fun res!852615 () Bool)

(assert (=> b!1283525 (=> (not res!852615) (not e!733262))))

(declare-datatypes ((List!28979 0))(
  ( (Nil!28976) (Cons!28975 (h!30184 (_ BitVec 64)) (t!42523 List!28979)) )
))
(declare-fun arrayNoDuplicates!0 (array!84796 (_ BitVec 32) List!28979) Bool)

(assert (=> b!1283525 (= res!852615 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28976))))

(declare-fun mapNonEmpty!52358 () Bool)

(declare-fun mapRes!52358 () Bool)

(declare-fun tp!99797 () Bool)

(declare-fun e!733265 () Bool)

(assert (=> mapNonEmpty!52358 (= mapRes!52358 (and tp!99797 e!733265))))

(declare-datatypes ((V!50259 0))(
  ( (V!50260 (val!17008 Int)) )
))
(declare-datatypes ((ValueCell!16035 0))(
  ( (ValueCellFull!16035 (v!19610 V!50259)) (EmptyCell!16035) )
))
(declare-fun mapValue!52358 () ValueCell!16035)

(declare-fun mapKey!52358 () (_ BitVec 32))

(declare-datatypes ((array!84798 0))(
  ( (array!84799 (arr!40901 (Array (_ BitVec 32) ValueCell!16035)) (size!41451 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84798)

(declare-fun mapRest!52358 () (Array (_ BitVec 32) ValueCell!16035))

(assert (=> mapNonEmpty!52358 (= (arr!40901 _values!1445) (store mapRest!52358 mapKey!52358 mapValue!52358))))

(declare-fun b!1283526 () Bool)

(declare-fun res!852617 () Bool)

(assert (=> b!1283526 (=> (not res!852617) (not e!733262))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283526 (= res!852617 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!852612 () Bool)

(assert (=> start!108714 (=> (not res!852612) (not e!733262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108714 (= res!852612 (validMask!0 mask!2175))))

(assert (=> start!108714 e!733262))

(declare-fun tp_is_empty!33867 () Bool)

(assert (=> start!108714 tp_is_empty!33867))

(assert (=> start!108714 true))

(declare-fun e!733261 () Bool)

(declare-fun array_inv!31025 (array!84798) Bool)

(assert (=> start!108714 (and (array_inv!31025 _values!1445) e!733261)))

(declare-fun array_inv!31026 (array!84796) Bool)

(assert (=> start!108714 (array_inv!31026 _keys!1741)))

(assert (=> start!108714 tp!99796))

(declare-fun b!1283527 () Bool)

(assert (=> b!1283527 (= e!733262 (not true))))

(declare-datatypes ((tuple2!21782 0))(
  ( (tuple2!21783 (_1!10902 (_ BitVec 64)) (_2!10902 V!50259)) )
))
(declare-datatypes ((List!28980 0))(
  ( (Nil!28977) (Cons!28976 (h!30185 tuple2!21782) (t!42524 List!28980)) )
))
(declare-datatypes ((ListLongMap!19439 0))(
  ( (ListLongMap!19440 (toList!9735 List!28980)) )
))
(declare-fun lt!576670 () ListLongMap!19439)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7852 (ListLongMap!19439 (_ BitVec 64)) Bool)

(assert (=> b!1283527 (contains!7852 lt!576670 k0!1205)))

(declare-fun minValue!1387 () V!50259)

(declare-datatypes ((Unit!42479 0))(
  ( (Unit!42480) )
))
(declare-fun lt!576669 () Unit!42479)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!10 ((_ BitVec 64) (_ BitVec 64) V!50259 ListLongMap!19439) Unit!42479)

(assert (=> b!1283527 (= lt!576669 (lemmaInListMapAfterAddingDiffThenInBefore!10 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576670))))

(declare-fun zeroValue!1387 () V!50259)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4286 (ListLongMap!19439 tuple2!21782) ListLongMap!19439)

(declare-fun getCurrentListMapNoExtraKeys!5916 (array!84796 array!84798 (_ BitVec 32) (_ BitVec 32) V!50259 V!50259 (_ BitVec 32) Int) ListLongMap!19439)

(assert (=> b!1283527 (= lt!576670 (+!4286 (getCurrentListMapNoExtraKeys!5916 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21783 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283528 () Bool)

(declare-fun res!852613 () Bool)

(assert (=> b!1283528 (=> (not res!852613) (not e!733262))))

(assert (=> b!1283528 (= res!852613 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41450 _keys!1741))))))

(declare-fun b!1283529 () Bool)

(declare-fun res!852618 () Bool)

(assert (=> b!1283529 (=> (not res!852618) (not e!733262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283529 (= res!852618 (validKeyInArray!0 (select (arr!40900 _keys!1741) from!2144)))))

(declare-fun b!1283530 () Bool)

(declare-fun res!852616 () Bool)

(assert (=> b!1283530 (=> (not res!852616) (not e!733262))))

(declare-fun getCurrentListMap!4817 (array!84796 array!84798 (_ BitVec 32) (_ BitVec 32) V!50259 V!50259 (_ BitVec 32) Int) ListLongMap!19439)

(assert (=> b!1283530 (= res!852616 (contains!7852 (getCurrentListMap!4817 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283531 () Bool)

(declare-fun res!852614 () Bool)

(assert (=> b!1283531 (=> (not res!852614) (not e!733262))))

(assert (=> b!1283531 (= res!852614 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41450 _keys!1741))))))

(declare-fun b!1283532 () Bool)

(declare-fun e!733264 () Bool)

(assert (=> b!1283532 (= e!733261 (and e!733264 mapRes!52358))))

(declare-fun condMapEmpty!52358 () Bool)

(declare-fun mapDefault!52358 () ValueCell!16035)

(assert (=> b!1283532 (= condMapEmpty!52358 (= (arr!40901 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16035)) mapDefault!52358)))))

(declare-fun b!1283533 () Bool)

(assert (=> b!1283533 (= e!733265 tp_is_empty!33867)))

(declare-fun mapIsEmpty!52358 () Bool)

(assert (=> mapIsEmpty!52358 mapRes!52358))

(declare-fun b!1283534 () Bool)

(declare-fun res!852611 () Bool)

(assert (=> b!1283534 (=> (not res!852611) (not e!733262))))

(assert (=> b!1283534 (= res!852611 (and (= (size!41451 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41450 _keys!1741) (size!41451 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283535 () Bool)

(assert (=> b!1283535 (= e!733264 tp_is_empty!33867)))

(assert (= (and start!108714 res!852612) b!1283534))

(assert (= (and b!1283534 res!852611) b!1283524))

(assert (= (and b!1283524 res!852610) b!1283525))

(assert (= (and b!1283525 res!852615) b!1283528))

(assert (= (and b!1283528 res!852613) b!1283530))

(assert (= (and b!1283530 res!852616) b!1283531))

(assert (= (and b!1283531 res!852614) b!1283529))

(assert (= (and b!1283529 res!852618) b!1283526))

(assert (= (and b!1283526 res!852617) b!1283527))

(assert (= (and b!1283532 condMapEmpty!52358) mapIsEmpty!52358))

(assert (= (and b!1283532 (not condMapEmpty!52358)) mapNonEmpty!52358))

(get-info :version)

(assert (= (and mapNonEmpty!52358 ((_ is ValueCellFull!16035) mapValue!52358)) b!1283533))

(assert (= (and b!1283532 ((_ is ValueCellFull!16035) mapDefault!52358)) b!1283535))

(assert (= start!108714 b!1283532))

(declare-fun m!1177429 () Bool)

(assert (=> b!1283525 m!1177429))

(declare-fun m!1177431 () Bool)

(assert (=> b!1283530 m!1177431))

(assert (=> b!1283530 m!1177431))

(declare-fun m!1177433 () Bool)

(assert (=> b!1283530 m!1177433))

(declare-fun m!1177435 () Bool)

(assert (=> start!108714 m!1177435))

(declare-fun m!1177437 () Bool)

(assert (=> start!108714 m!1177437))

(declare-fun m!1177439 () Bool)

(assert (=> start!108714 m!1177439))

(declare-fun m!1177441 () Bool)

(assert (=> mapNonEmpty!52358 m!1177441))

(declare-fun m!1177443 () Bool)

(assert (=> b!1283529 m!1177443))

(assert (=> b!1283529 m!1177443))

(declare-fun m!1177445 () Bool)

(assert (=> b!1283529 m!1177445))

(declare-fun m!1177447 () Bool)

(assert (=> b!1283527 m!1177447))

(declare-fun m!1177449 () Bool)

(assert (=> b!1283527 m!1177449))

(declare-fun m!1177451 () Bool)

(assert (=> b!1283527 m!1177451))

(assert (=> b!1283527 m!1177451))

(declare-fun m!1177453 () Bool)

(assert (=> b!1283527 m!1177453))

(declare-fun m!1177455 () Bool)

(assert (=> b!1283524 m!1177455))

(check-sat (not b!1283530) (not b!1283525) (not start!108714) (not b_next!28227) b_and!46293 (not mapNonEmpty!52358) (not b!1283529) tp_is_empty!33867 (not b!1283527) (not b!1283524))
(check-sat b_and!46293 (not b_next!28227))
