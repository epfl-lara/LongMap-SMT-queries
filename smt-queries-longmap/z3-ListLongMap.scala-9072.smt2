; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109218 () Bool)

(assert start!109218)

(declare-fun b_free!28707 () Bool)

(declare-fun b_next!28707 () Bool)

(assert (=> start!109218 (= b_free!28707 (not b_next!28707))))

(declare-fun tp!101240 () Bool)

(declare-fun b_and!46797 () Bool)

(assert (=> start!109218 (= tp!101240 b_and!46797)))

(declare-fun b!1291986 () Bool)

(declare-fun res!858422 () Bool)

(declare-fun e!737479 () Bool)

(assert (=> b!1291986 (=> (not res!858422) (not e!737479))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85728 0))(
  ( (array!85729 (arr!41365 (Array (_ BitVec 32) (_ BitVec 64))) (size!41915 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85728)

(assert (=> b!1291986 (= res!858422 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41915 _keys!1741))))))

(declare-fun b!1291987 () Bool)

(declare-fun res!858427 () Bool)

(assert (=> b!1291987 (=> (not res!858427) (not e!737479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291987 (= res!858427 (not (validKeyInArray!0 (select (arr!41365 _keys!1741) from!2144))))))

(declare-fun b!1291988 () Bool)

(declare-fun res!858429 () Bool)

(assert (=> b!1291988 (=> (not res!858429) (not e!737479))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1291988 (= res!858429 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41915 _keys!1741))))))

(declare-fun b!1291989 () Bool)

(declare-fun e!737480 () Bool)

(declare-fun e!737478 () Bool)

(declare-fun mapRes!53081 () Bool)

(assert (=> b!1291989 (= e!737480 (and e!737478 mapRes!53081))))

(declare-fun condMapEmpty!53081 () Bool)

(declare-datatypes ((V!50899 0))(
  ( (V!50900 (val!17248 Int)) )
))
(declare-datatypes ((ValueCell!16275 0))(
  ( (ValueCellFull!16275 (v!19851 V!50899)) (EmptyCell!16275) )
))
(declare-datatypes ((array!85730 0))(
  ( (array!85731 (arr!41366 (Array (_ BitVec 32) ValueCell!16275)) (size!41916 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85730)

(declare-fun mapDefault!53081 () ValueCell!16275)

(assert (=> b!1291989 (= condMapEmpty!53081 (= (arr!41366 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16275)) mapDefault!53081)))))

(declare-fun b!1291990 () Bool)

(declare-fun tp_is_empty!34347 () Bool)

(assert (=> b!1291990 (= e!737478 tp_is_empty!34347)))

(declare-fun res!858424 () Bool)

(assert (=> start!109218 (=> (not res!858424) (not e!737479))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109218 (= res!858424 (validMask!0 mask!2175))))

(assert (=> start!109218 e!737479))

(assert (=> start!109218 tp_is_empty!34347))

(assert (=> start!109218 true))

(declare-fun array_inv!31343 (array!85730) Bool)

(assert (=> start!109218 (and (array_inv!31343 _values!1445) e!737480)))

(declare-fun array_inv!31344 (array!85728) Bool)

(assert (=> start!109218 (array_inv!31344 _keys!1741)))

(assert (=> start!109218 tp!101240))

(declare-fun b!1291991 () Bool)

(declare-fun res!858425 () Bool)

(assert (=> b!1291991 (=> (not res!858425) (not e!737479))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291991 (= res!858425 (and (= (size!41916 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41915 _keys!1741) (size!41916 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53081 () Bool)

(declare-fun tp!101239 () Bool)

(declare-fun e!737476 () Bool)

(assert (=> mapNonEmpty!53081 (= mapRes!53081 (and tp!101239 e!737476))))

(declare-fun mapKey!53081 () (_ BitVec 32))

(declare-fun mapValue!53081 () ValueCell!16275)

(declare-fun mapRest!53081 () (Array (_ BitVec 32) ValueCell!16275))

(assert (=> mapNonEmpty!53081 (= (arr!41366 _values!1445) (store mapRest!53081 mapKey!53081 mapValue!53081))))

(declare-fun b!1291992 () Bool)

(declare-fun res!858423 () Bool)

(assert (=> b!1291992 (=> (not res!858423) (not e!737479))))

(declare-datatypes ((List!29339 0))(
  ( (Nil!29336) (Cons!29335 (h!30544 (_ BitVec 64)) (t!42903 List!29339)) )
))
(declare-fun arrayNoDuplicates!0 (array!85728 (_ BitVec 32) List!29339) Bool)

(assert (=> b!1291992 (= res!858423 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29336))))

(declare-fun b!1291993 () Bool)

(declare-fun res!858426 () Bool)

(assert (=> b!1291993 (=> (not res!858426) (not e!737479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85728 (_ BitVec 32)) Bool)

(assert (=> b!1291993 (= res!858426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291994 () Bool)

(assert (=> b!1291994 (= e!737479 (not true))))

(declare-datatypes ((tuple2!22186 0))(
  ( (tuple2!22187 (_1!11104 (_ BitVec 64)) (_2!11104 V!50899)) )
))
(declare-datatypes ((List!29340 0))(
  ( (Nil!29337) (Cons!29336 (h!30545 tuple2!22186) (t!42904 List!29340)) )
))
(declare-datatypes ((ListLongMap!19843 0))(
  ( (ListLongMap!19844 (toList!9937 List!29340)) )
))
(declare-fun contains!8055 (ListLongMap!19843 (_ BitVec 64)) Bool)

(assert (=> b!1291994 (not (contains!8055 (ListLongMap!19844 Nil!29337) k0!1205))))

(declare-datatypes ((Unit!42784 0))(
  ( (Unit!42785) )
))
(declare-fun lt!579296 () Unit!42784)

(declare-fun emptyContainsNothing!114 ((_ BitVec 64)) Unit!42784)

(assert (=> b!1291994 (= lt!579296 (emptyContainsNothing!114 k0!1205))))

(declare-fun b!1291995 () Bool)

(assert (=> b!1291995 (= e!737476 tp_is_empty!34347)))

(declare-fun b!1291996 () Bool)

(declare-fun res!858428 () Bool)

(assert (=> b!1291996 (=> (not res!858428) (not e!737479))))

(declare-fun minValue!1387 () V!50899)

(declare-fun zeroValue!1387 () V!50899)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4984 (array!85728 array!85730 (_ BitVec 32) (_ BitVec 32) V!50899 V!50899 (_ BitVec 32) Int) ListLongMap!19843)

(assert (=> b!1291996 (= res!858428 (contains!8055 (getCurrentListMap!4984 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53081 () Bool)

(assert (=> mapIsEmpty!53081 mapRes!53081))

(assert (= (and start!109218 res!858424) b!1291991))

(assert (= (and b!1291991 res!858425) b!1291993))

(assert (= (and b!1291993 res!858426) b!1291992))

(assert (= (and b!1291992 res!858423) b!1291986))

(assert (= (and b!1291986 res!858422) b!1291996))

(assert (= (and b!1291996 res!858428) b!1291988))

(assert (= (and b!1291988 res!858429) b!1291987))

(assert (= (and b!1291987 res!858427) b!1291994))

(assert (= (and b!1291989 condMapEmpty!53081) mapIsEmpty!53081))

(assert (= (and b!1291989 (not condMapEmpty!53081)) mapNonEmpty!53081))

(get-info :version)

(assert (= (and mapNonEmpty!53081 ((_ is ValueCellFull!16275) mapValue!53081)) b!1291995))

(assert (= (and b!1291989 ((_ is ValueCellFull!16275) mapDefault!53081)) b!1291990))

(assert (= start!109218 b!1291989))

(declare-fun m!1184663 () Bool)

(assert (=> mapNonEmpty!53081 m!1184663))

(declare-fun m!1184665 () Bool)

(assert (=> b!1291994 m!1184665))

(declare-fun m!1184667 () Bool)

(assert (=> b!1291994 m!1184667))

(declare-fun m!1184669 () Bool)

(assert (=> b!1291992 m!1184669))

(declare-fun m!1184671 () Bool)

(assert (=> start!109218 m!1184671))

(declare-fun m!1184673 () Bool)

(assert (=> start!109218 m!1184673))

(declare-fun m!1184675 () Bool)

(assert (=> start!109218 m!1184675))

(declare-fun m!1184677 () Bool)

(assert (=> b!1291987 m!1184677))

(assert (=> b!1291987 m!1184677))

(declare-fun m!1184679 () Bool)

(assert (=> b!1291987 m!1184679))

(declare-fun m!1184681 () Bool)

(assert (=> b!1291996 m!1184681))

(assert (=> b!1291996 m!1184681))

(declare-fun m!1184683 () Bool)

(assert (=> b!1291996 m!1184683))

(declare-fun m!1184685 () Bool)

(assert (=> b!1291993 m!1184685))

(check-sat tp_is_empty!34347 (not b_next!28707) (not b!1291994) (not start!109218) (not b!1291993) (not mapNonEmpty!53081) (not b!1291992) b_and!46797 (not b!1291996) (not b!1291987))
(check-sat b_and!46797 (not b_next!28707))
