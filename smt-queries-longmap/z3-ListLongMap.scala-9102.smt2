; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109396 () Bool)

(assert start!109396)

(declare-fun b_free!28885 () Bool)

(declare-fun b_next!28885 () Bool)

(assert (=> start!109396 (= b_free!28885 (not b_next!28885))))

(declare-fun tp!101774 () Bool)

(declare-fun b_and!46957 () Bool)

(assert (=> start!109396 (= tp!101774 b_and!46957)))

(declare-fun b!1294987 () Bool)

(declare-fun e!738913 () Bool)

(declare-fun e!738915 () Bool)

(assert (=> b!1294987 (= e!738913 (not e!738915))))

(declare-fun res!860660 () Bool)

(assert (=> b!1294987 (=> res!860660 e!738915)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294987 (= res!860660 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51137 0))(
  ( (V!51138 (val!17337 Int)) )
))
(declare-datatypes ((tuple2!22372 0))(
  ( (tuple2!22373 (_1!11197 (_ BitVec 64)) (_2!11197 V!51137)) )
))
(declare-datatypes ((List!29509 0))(
  ( (Nil!29506) (Cons!29505 (h!30714 tuple2!22372) (t!43065 List!29509)) )
))
(declare-datatypes ((ListLongMap!20029 0))(
  ( (ListLongMap!20030 (toList!10030 List!29509)) )
))
(declare-fun contains!8078 (ListLongMap!20029 (_ BitVec 64)) Bool)

(assert (=> b!1294987 (not (contains!8078 (ListLongMap!20030 Nil!29506) k0!1205))))

(declare-datatypes ((Unit!42730 0))(
  ( (Unit!42731) )
))
(declare-fun lt!579624 () Unit!42730)

(declare-fun emptyContainsNothing!158 ((_ BitVec 64)) Unit!42730)

(assert (=> b!1294987 (= lt!579624 (emptyContainsNothing!158 k0!1205))))

(declare-fun b!1294988 () Bool)

(declare-fun res!860664 () Bool)

(assert (=> b!1294988 (=> (not res!860664) (not e!738913))))

(declare-fun minValue!1387 () V!51137)

(declare-fun zeroValue!1387 () V!51137)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16364 0))(
  ( (ValueCellFull!16364 (v!19939 V!51137)) (EmptyCell!16364) )
))
(declare-datatypes ((array!85963 0))(
  ( (array!85964 (arr!41483 (Array (_ BitVec 32) ValueCell!16364)) (size!42035 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85963)

(declare-datatypes ((array!85965 0))(
  ( (array!85966 (arr!41484 (Array (_ BitVec 32) (_ BitVec 64))) (size!42036 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85965)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!4957 (array!85965 array!85963 (_ BitVec 32) (_ BitVec 32) V!51137 V!51137 (_ BitVec 32) Int) ListLongMap!20029)

(assert (=> b!1294988 (= res!860664 (contains!8078 (getCurrentListMap!4957 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294989 () Bool)

(declare-fun res!860663 () Bool)

(assert (=> b!1294989 (=> (not res!860663) (not e!738913))))

(assert (=> b!1294989 (= res!860663 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42036 _keys!1741))))))

(declare-fun mapIsEmpty!53348 () Bool)

(declare-fun mapRes!53348 () Bool)

(assert (=> mapIsEmpty!53348 mapRes!53348))

(declare-fun b!1294990 () Bool)

(declare-fun res!860662 () Bool)

(assert (=> b!1294990 (=> (not res!860662) (not e!738913))))

(assert (=> b!1294990 (= res!860662 (and (= (size!42035 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42036 _keys!1741) (size!42035 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294991 () Bool)

(declare-fun res!860666 () Bool)

(assert (=> b!1294991 (=> (not res!860666) (not e!738913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294991 (= res!860666 (not (validKeyInArray!0 (select (arr!41484 _keys!1741) from!2144))))))

(declare-fun b!1294992 () Bool)

(assert (=> b!1294992 (= e!738915 true)))

(declare-fun lt!579623 () ListLongMap!20029)

(declare-fun +!4447 (ListLongMap!20029 tuple2!22372) ListLongMap!20029)

(assert (=> b!1294992 (not (contains!8078 (+!4447 lt!579623 (tuple2!22373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579625 () Unit!42730)

(declare-fun addStillNotContains!424 (ListLongMap!20029 (_ BitVec 64) V!51137 (_ BitVec 64)) Unit!42730)

(assert (=> b!1294992 (= lt!579625 (addStillNotContains!424 lt!579623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6081 (array!85965 array!85963 (_ BitVec 32) (_ BitVec 32) V!51137 V!51137 (_ BitVec 32) Int) ListLongMap!20029)

(assert (=> b!1294992 (= lt!579623 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1294993 () Bool)

(declare-fun e!738912 () Bool)

(declare-fun e!738914 () Bool)

(assert (=> b!1294993 (= e!738912 (and e!738914 mapRes!53348))))

(declare-fun condMapEmpty!53348 () Bool)

(declare-fun mapDefault!53348 () ValueCell!16364)

(assert (=> b!1294993 (= condMapEmpty!53348 (= (arr!41483 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16364)) mapDefault!53348)))))

(declare-fun mapNonEmpty!53348 () Bool)

(declare-fun tp!101775 () Bool)

(declare-fun e!738911 () Bool)

(assert (=> mapNonEmpty!53348 (= mapRes!53348 (and tp!101775 e!738911))))

(declare-fun mapValue!53348 () ValueCell!16364)

(declare-fun mapKey!53348 () (_ BitVec 32))

(declare-fun mapRest!53348 () (Array (_ BitVec 32) ValueCell!16364))

(assert (=> mapNonEmpty!53348 (= (arr!41483 _values!1445) (store mapRest!53348 mapKey!53348 mapValue!53348))))

(declare-fun b!1294995 () Bool)

(declare-fun tp_is_empty!34525 () Bool)

(assert (=> b!1294995 (= e!738914 tp_is_empty!34525)))

(declare-fun b!1294996 () Bool)

(declare-fun res!860667 () Bool)

(assert (=> b!1294996 (=> (not res!860667) (not e!738913))))

(declare-datatypes ((List!29510 0))(
  ( (Nil!29507) (Cons!29506 (h!30715 (_ BitVec 64)) (t!43066 List!29510)) )
))
(declare-fun arrayNoDuplicates!0 (array!85965 (_ BitVec 32) List!29510) Bool)

(assert (=> b!1294996 (= res!860667 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29507))))

(declare-fun b!1294997 () Bool)

(assert (=> b!1294997 (= e!738911 tp_is_empty!34525)))

(declare-fun b!1294998 () Bool)

(declare-fun res!860665 () Bool)

(assert (=> b!1294998 (=> (not res!860665) (not e!738913))))

(assert (=> b!1294998 (= res!860665 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42036 _keys!1741))))))

(declare-fun b!1294994 () Bool)

(declare-fun res!860661 () Bool)

(assert (=> b!1294994 (=> (not res!860661) (not e!738913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85965 (_ BitVec 32)) Bool)

(assert (=> b!1294994 (= res!860661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!860659 () Bool)

(assert (=> start!109396 (=> (not res!860659) (not e!738913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109396 (= res!860659 (validMask!0 mask!2175))))

(assert (=> start!109396 e!738913))

(assert (=> start!109396 tp_is_empty!34525))

(assert (=> start!109396 true))

(declare-fun array_inv!31575 (array!85963) Bool)

(assert (=> start!109396 (and (array_inv!31575 _values!1445) e!738912)))

(declare-fun array_inv!31576 (array!85965) Bool)

(assert (=> start!109396 (array_inv!31576 _keys!1741)))

(assert (=> start!109396 tp!101774))

(assert (= (and start!109396 res!860659) b!1294990))

(assert (= (and b!1294990 res!860662) b!1294994))

(assert (= (and b!1294994 res!860661) b!1294996))

(assert (= (and b!1294996 res!860667) b!1294998))

(assert (= (and b!1294998 res!860665) b!1294988))

(assert (= (and b!1294988 res!860664) b!1294989))

(assert (= (and b!1294989 res!860663) b!1294991))

(assert (= (and b!1294991 res!860666) b!1294987))

(assert (= (and b!1294987 (not res!860660)) b!1294992))

(assert (= (and b!1294993 condMapEmpty!53348) mapIsEmpty!53348))

(assert (= (and b!1294993 (not condMapEmpty!53348)) mapNonEmpty!53348))

(get-info :version)

(assert (= (and mapNonEmpty!53348 ((_ is ValueCellFull!16364) mapValue!53348)) b!1294997))

(assert (= (and b!1294993 ((_ is ValueCellFull!16364) mapDefault!53348)) b!1294995))

(assert (= start!109396 b!1294993))

(declare-fun m!1186611 () Bool)

(assert (=> b!1294991 m!1186611))

(assert (=> b!1294991 m!1186611))

(declare-fun m!1186613 () Bool)

(assert (=> b!1294991 m!1186613))

(declare-fun m!1186615 () Bool)

(assert (=> b!1294996 m!1186615))

(declare-fun m!1186617 () Bool)

(assert (=> start!109396 m!1186617))

(declare-fun m!1186619 () Bool)

(assert (=> start!109396 m!1186619))

(declare-fun m!1186621 () Bool)

(assert (=> start!109396 m!1186621))

(declare-fun m!1186623 () Bool)

(assert (=> mapNonEmpty!53348 m!1186623))

(declare-fun m!1186625 () Bool)

(assert (=> b!1294988 m!1186625))

(assert (=> b!1294988 m!1186625))

(declare-fun m!1186627 () Bool)

(assert (=> b!1294988 m!1186627))

(declare-fun m!1186629 () Bool)

(assert (=> b!1294992 m!1186629))

(assert (=> b!1294992 m!1186629))

(declare-fun m!1186631 () Bool)

(assert (=> b!1294992 m!1186631))

(declare-fun m!1186633 () Bool)

(assert (=> b!1294992 m!1186633))

(declare-fun m!1186635 () Bool)

(assert (=> b!1294992 m!1186635))

(declare-fun m!1186637 () Bool)

(assert (=> b!1294987 m!1186637))

(declare-fun m!1186639 () Bool)

(assert (=> b!1294987 m!1186639))

(declare-fun m!1186641 () Bool)

(assert (=> b!1294994 m!1186641))

(check-sat (not b!1294991) (not b!1294988) (not b!1294996) (not b!1294994) tp_is_empty!34525 b_and!46957 (not mapNonEmpty!53348) (not start!109396) (not b!1294987) (not b!1294992) (not b_next!28885))
(check-sat b_and!46957 (not b_next!28885))
