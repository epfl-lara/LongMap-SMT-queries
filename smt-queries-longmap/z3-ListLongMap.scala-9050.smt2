; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109086 () Bool)

(assert start!109086)

(declare-fun b_free!28575 () Bool)

(declare-fun b_next!28575 () Bool)

(assert (=> start!109086 (= b_free!28575 (not b_next!28575))))

(declare-fun tp!100843 () Bool)

(declare-fun b_and!46665 () Bool)

(assert (=> start!109086 (= tp!100843 b_and!46665)))

(declare-fun b!1289633 () Bool)

(declare-fun e!736311 () Bool)

(assert (=> b!1289633 (= e!736311 true)))

(declare-datatypes ((V!50723 0))(
  ( (V!50724 (val!17182 Int)) )
))
(declare-datatypes ((tuple2!22070 0))(
  ( (tuple2!22071 (_1!11046 (_ BitVec 64)) (_2!11046 V!50723)) )
))
(declare-datatypes ((List!29238 0))(
  ( (Nil!29235) (Cons!29234 (h!30443 tuple2!22070) (t!42802 List!29238)) )
))
(declare-datatypes ((ListLongMap!19727 0))(
  ( (ListLongMap!19728 (toList!9879 List!29238)) )
))
(declare-fun lt!578321 () ListLongMap!19727)

(declare-fun minValue!1387 () V!50723)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7997 (ListLongMap!19727 (_ BitVec 64)) Bool)

(declare-fun +!4351 (ListLongMap!19727 tuple2!22070) ListLongMap!19727)

(assert (=> b!1289633 (not (contains!7997 (+!4351 lt!578321 (tuple2!22071 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42676 0))(
  ( (Unit!42677) )
))
(declare-fun lt!578322 () Unit!42676)

(declare-fun addStillNotContains!369 (ListLongMap!19727 (_ BitVec 64) V!50723 (_ BitVec 64)) Unit!42676)

(assert (=> b!1289633 (= lt!578322 (addStillNotContains!369 lt!578321 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50723)

(assert (=> b!1289633 (not (contains!7997 (+!4351 lt!578321 (tuple2!22071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578324 () Unit!42676)

(assert (=> b!1289633 (= lt!578324 (addStillNotContains!369 lt!578321 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-datatypes ((ValueCell!16209 0))(
  ( (ValueCellFull!16209 (v!19785 V!50723)) (EmptyCell!16209) )
))
(declare-datatypes ((array!85472 0))(
  ( (array!85473 (arr!41237 (Array (_ BitVec 32) ValueCell!16209)) (size!41787 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85472)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85474 0))(
  ( (array!85475 (arr!41238 (Array (_ BitVec 32) (_ BitVec 64))) (size!41788 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85474)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5982 (array!85474 array!85472 (_ BitVec 32) (_ BitVec 32) V!50723 V!50723 (_ BitVec 32) Int) ListLongMap!19727)

(assert (=> b!1289633 (= lt!578321 (getCurrentListMapNoExtraKeys!5982 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289634 () Bool)

(declare-fun e!736313 () Bool)

(declare-fun tp_is_empty!34215 () Bool)

(assert (=> b!1289634 (= e!736313 tp_is_empty!34215)))

(declare-fun b!1289635 () Bool)

(declare-fun res!856664 () Bool)

(declare-fun e!736315 () Bool)

(assert (=> b!1289635 (=> (not res!856664) (not e!736315))))

(assert (=> b!1289635 (= res!856664 (and (= (size!41787 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41788 _keys!1741) (size!41787 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289636 () Bool)

(declare-fun e!736312 () Bool)

(declare-fun mapRes!52883 () Bool)

(assert (=> b!1289636 (= e!736312 (and e!736313 mapRes!52883))))

(declare-fun condMapEmpty!52883 () Bool)

(declare-fun mapDefault!52883 () ValueCell!16209)

(assert (=> b!1289636 (= condMapEmpty!52883 (= (arr!41237 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16209)) mapDefault!52883)))))

(declare-fun mapIsEmpty!52883 () Bool)

(assert (=> mapIsEmpty!52883 mapRes!52883))

(declare-fun b!1289638 () Bool)

(declare-fun res!856671 () Bool)

(assert (=> b!1289638 (=> (not res!856671) (not e!736315))))

(assert (=> b!1289638 (= res!856671 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41788 _keys!1741))))))

(declare-fun b!1289639 () Bool)

(assert (=> b!1289639 (= e!736315 (not e!736311))))

(declare-fun res!856666 () Bool)

(assert (=> b!1289639 (=> res!856666 e!736311)))

(assert (=> b!1289639 (= res!856666 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289639 (not (contains!7997 (ListLongMap!19728 Nil!29235) k0!1205))))

(declare-fun lt!578323 () Unit!42676)

(declare-fun emptyContainsNothing!66 ((_ BitVec 64)) Unit!42676)

(assert (=> b!1289639 (= lt!578323 (emptyContainsNothing!66 k0!1205))))

(declare-fun mapNonEmpty!52883 () Bool)

(declare-fun tp!100844 () Bool)

(declare-fun e!736314 () Bool)

(assert (=> mapNonEmpty!52883 (= mapRes!52883 (and tp!100844 e!736314))))

(declare-fun mapKey!52883 () (_ BitVec 32))

(declare-fun mapRest!52883 () (Array (_ BitVec 32) ValueCell!16209))

(declare-fun mapValue!52883 () ValueCell!16209)

(assert (=> mapNonEmpty!52883 (= (arr!41237 _values!1445) (store mapRest!52883 mapKey!52883 mapValue!52883))))

(declare-fun b!1289640 () Bool)

(declare-fun res!856665 () Bool)

(assert (=> b!1289640 (=> (not res!856665) (not e!736315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85474 (_ BitVec 32)) Bool)

(assert (=> b!1289640 (= res!856665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289641 () Bool)

(assert (=> b!1289641 (= e!736314 tp_is_empty!34215)))

(declare-fun b!1289642 () Bool)

(declare-fun res!856667 () Bool)

(assert (=> b!1289642 (=> (not res!856667) (not e!736315))))

(assert (=> b!1289642 (= res!856667 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41788 _keys!1741))))))

(declare-fun res!856670 () Bool)

(assert (=> start!109086 (=> (not res!856670) (not e!736315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109086 (= res!856670 (validMask!0 mask!2175))))

(assert (=> start!109086 e!736315))

(assert (=> start!109086 tp_is_empty!34215))

(assert (=> start!109086 true))

(declare-fun array_inv!31257 (array!85472) Bool)

(assert (=> start!109086 (and (array_inv!31257 _values!1445) e!736312)))

(declare-fun array_inv!31258 (array!85474) Bool)

(assert (=> start!109086 (array_inv!31258 _keys!1741)))

(assert (=> start!109086 tp!100843))

(declare-fun b!1289637 () Bool)

(declare-fun res!856669 () Bool)

(assert (=> b!1289637 (=> (not res!856669) (not e!736315))))

(declare-fun getCurrentListMap!4939 (array!85474 array!85472 (_ BitVec 32) (_ BitVec 32) V!50723 V!50723 (_ BitVec 32) Int) ListLongMap!19727)

(assert (=> b!1289637 (= res!856669 (contains!7997 (getCurrentListMap!4939 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289643 () Bool)

(declare-fun res!856668 () Bool)

(assert (=> b!1289643 (=> (not res!856668) (not e!736315))))

(declare-datatypes ((List!29239 0))(
  ( (Nil!29236) (Cons!29235 (h!30444 (_ BitVec 64)) (t!42803 List!29239)) )
))
(declare-fun arrayNoDuplicates!0 (array!85474 (_ BitVec 32) List!29239) Bool)

(assert (=> b!1289643 (= res!856668 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29236))))

(declare-fun b!1289644 () Bool)

(declare-fun res!856663 () Bool)

(assert (=> b!1289644 (=> (not res!856663) (not e!736315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289644 (= res!856663 (not (validKeyInArray!0 (select (arr!41238 _keys!1741) from!2144))))))

(assert (= (and start!109086 res!856670) b!1289635))

(assert (= (and b!1289635 res!856664) b!1289640))

(assert (= (and b!1289640 res!856665) b!1289643))

(assert (= (and b!1289643 res!856668) b!1289642))

(assert (= (and b!1289642 res!856667) b!1289637))

(assert (= (and b!1289637 res!856669) b!1289638))

(assert (= (and b!1289638 res!856671) b!1289644))

(assert (= (and b!1289644 res!856663) b!1289639))

(assert (= (and b!1289639 (not res!856666)) b!1289633))

(assert (= (and b!1289636 condMapEmpty!52883) mapIsEmpty!52883))

(assert (= (and b!1289636 (not condMapEmpty!52883)) mapNonEmpty!52883))

(get-info :version)

(assert (= (and mapNonEmpty!52883 ((_ is ValueCellFull!16209) mapValue!52883)) b!1289641))

(assert (= (and b!1289636 ((_ is ValueCellFull!16209) mapDefault!52883)) b!1289634))

(assert (= start!109086 b!1289636))

(declare-fun m!1182163 () Bool)

(assert (=> b!1289639 m!1182163))

(declare-fun m!1182165 () Bool)

(assert (=> b!1289639 m!1182165))

(declare-fun m!1182167 () Bool)

(assert (=> b!1289637 m!1182167))

(assert (=> b!1289637 m!1182167))

(declare-fun m!1182169 () Bool)

(assert (=> b!1289637 m!1182169))

(declare-fun m!1182171 () Bool)

(assert (=> b!1289644 m!1182171))

(assert (=> b!1289644 m!1182171))

(declare-fun m!1182173 () Bool)

(assert (=> b!1289644 m!1182173))

(declare-fun m!1182175 () Bool)

(assert (=> start!109086 m!1182175))

(declare-fun m!1182177 () Bool)

(assert (=> start!109086 m!1182177))

(declare-fun m!1182179 () Bool)

(assert (=> start!109086 m!1182179))

(declare-fun m!1182181 () Bool)

(assert (=> b!1289640 m!1182181))

(declare-fun m!1182183 () Bool)

(assert (=> b!1289643 m!1182183))

(declare-fun m!1182185 () Bool)

(assert (=> mapNonEmpty!52883 m!1182185))

(declare-fun m!1182187 () Bool)

(assert (=> b!1289633 m!1182187))

(declare-fun m!1182189 () Bool)

(assert (=> b!1289633 m!1182189))

(declare-fun m!1182191 () Bool)

(assert (=> b!1289633 m!1182191))

(declare-fun m!1182193 () Bool)

(assert (=> b!1289633 m!1182193))

(assert (=> b!1289633 m!1182189))

(declare-fun m!1182195 () Bool)

(assert (=> b!1289633 m!1182195))

(assert (=> b!1289633 m!1182193))

(declare-fun m!1182197 () Bool)

(assert (=> b!1289633 m!1182197))

(declare-fun m!1182199 () Bool)

(assert (=> b!1289633 m!1182199))

(check-sat (not start!109086) (not b_next!28575) (not mapNonEmpty!52883) (not b!1289640) (not b!1289637) (not b!1289633) (not b!1289639) (not b!1289644) (not b!1289643) tp_is_empty!34215 b_and!46665)
(check-sat b_and!46665 (not b_next!28575))
