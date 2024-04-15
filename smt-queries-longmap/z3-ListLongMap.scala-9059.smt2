; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109138 () Bool)

(assert start!109138)

(declare-fun b_free!28627 () Bool)

(declare-fun b_next!28627 () Bool)

(assert (=> start!109138 (= b_free!28627 (not b_next!28627))))

(declare-fun tp!101000 () Bool)

(declare-fun b_and!46699 () Bool)

(assert (=> start!109138 (= tp!101000 b_and!46699)))

(declare-fun b!1290505 () Bool)

(declare-fun res!857340 () Bool)

(declare-fun e!736752 () Bool)

(assert (=> b!1290505 (=> (not res!857340) (not e!736752))))

(declare-datatypes ((array!85463 0))(
  ( (array!85464 (arr!41233 (Array (_ BitVec 32) (_ BitVec 64))) (size!41785 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85463)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290505 (= res!857340 (not (validKeyInArray!0 (select (arr!41233 _keys!1741) from!2144))))))

(declare-fun b!1290506 () Bool)

(declare-fun res!857344 () Bool)

(assert (=> b!1290506 (=> (not res!857344) (not e!736752))))

(declare-datatypes ((V!50793 0))(
  ( (V!50794 (val!17208 Int)) )
))
(declare-fun minValue!1387 () V!50793)

(declare-fun zeroValue!1387 () V!50793)

(declare-datatypes ((ValueCell!16235 0))(
  ( (ValueCellFull!16235 (v!19810 V!50793)) (EmptyCell!16235) )
))
(declare-datatypes ((array!85465 0))(
  ( (array!85466 (arr!41234 (Array (_ BitVec 32) ValueCell!16235)) (size!41786 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85465)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22164 0))(
  ( (tuple2!22165 (_1!11093 (_ BitVec 64)) (_2!11093 V!50793)) )
))
(declare-datatypes ((List!29322 0))(
  ( (Nil!29319) (Cons!29318 (h!30527 tuple2!22164) (t!42878 List!29322)) )
))
(declare-datatypes ((ListLongMap!19821 0))(
  ( (ListLongMap!19822 (toList!9926 List!29322)) )
))
(declare-fun contains!7974 (ListLongMap!19821 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4874 (array!85463 array!85465 (_ BitVec 32) (_ BitVec 32) V!50793 V!50793 (_ BitVec 32) Int) ListLongMap!19821)

(assert (=> b!1290506 (= res!857344 (contains!7974 (getCurrentListMap!4874 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290507 () Bool)

(declare-fun res!857341 () Bool)

(assert (=> b!1290507 (=> (not res!857341) (not e!736752))))

(assert (=> b!1290507 (= res!857341 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41785 _keys!1741))))))

(declare-fun b!1290508 () Bool)

(declare-fun res!857342 () Bool)

(assert (=> b!1290508 (=> (not res!857342) (not e!736752))))

(assert (=> b!1290508 (= res!857342 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41785 _keys!1741))))))

(declare-fun b!1290509 () Bool)

(declare-fun res!857338 () Bool)

(assert (=> b!1290509 (=> (not res!857338) (not e!736752))))

(assert (=> b!1290509 (= res!857338 (and (= (size!41786 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41785 _keys!1741) (size!41786 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290510 () Bool)

(declare-fun e!736755 () Bool)

(assert (=> b!1290510 (= e!736752 (not e!736755))))

(declare-fun res!857345 () Bool)

(assert (=> b!1290510 (=> res!857345 e!736755)))

(assert (=> b!1290510 (= res!857345 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290510 (not (contains!7974 (ListLongMap!19822 Nil!29319) k0!1205))))

(declare-datatypes ((Unit!42548 0))(
  ( (Unit!42549) )
))
(declare-fun lt!578514 () Unit!42548)

(declare-fun emptyContainsNothing!73 ((_ BitVec 64)) Unit!42548)

(assert (=> b!1290510 (= lt!578514 (emptyContainsNothing!73 k0!1205))))

(declare-fun b!1290511 () Bool)

(declare-fun res!857346 () Bool)

(assert (=> b!1290511 (=> (not res!857346) (not e!736752))))

(declare-datatypes ((List!29323 0))(
  ( (Nil!29320) (Cons!29319 (h!30528 (_ BitVec 64)) (t!42879 List!29323)) )
))
(declare-fun arrayNoDuplicates!0 (array!85463 (_ BitVec 32) List!29323) Bool)

(assert (=> b!1290511 (= res!857346 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29320))))

(declare-fun b!1290512 () Bool)

(assert (=> b!1290512 (= e!736755 true)))

(assert (=> b!1290512 false))

(declare-fun lt!578513 () ListLongMap!19821)

(declare-fun lt!578516 () Unit!42548)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!44 ((_ BitVec 64) (_ BitVec 64) V!50793 ListLongMap!19821) Unit!42548)

(assert (=> b!1290512 (= lt!578516 (lemmaInListMapAfterAddingDiffThenInBefore!44 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578513))))

(declare-fun lt!578515 () ListLongMap!19821)

(declare-fun +!4403 (ListLongMap!19821 tuple2!22164) ListLongMap!19821)

(assert (=> b!1290512 (not (contains!7974 (+!4403 lt!578515 (tuple2!22165 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578517 () Unit!42548)

(declare-fun addStillNotContains!380 (ListLongMap!19821 (_ BitVec 64) V!50793 (_ BitVec 64)) Unit!42548)

(assert (=> b!1290512 (= lt!578517 (addStillNotContains!380 lt!578515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290512 (not (contains!7974 lt!578513 k0!1205))))

(assert (=> b!1290512 (= lt!578513 (+!4403 lt!578515 (tuple2!22165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578518 () Unit!42548)

(assert (=> b!1290512 (= lt!578518 (addStillNotContains!380 lt!578515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6034 (array!85463 array!85465 (_ BitVec 32) (_ BitVec 32) V!50793 V!50793 (_ BitVec 32) Int) ListLongMap!19821)

(assert (=> b!1290512 (= lt!578515 (getCurrentListMapNoExtraKeys!6034 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290513 () Bool)

(declare-fun e!736751 () Bool)

(declare-fun tp_is_empty!34267 () Bool)

(assert (=> b!1290513 (= e!736751 tp_is_empty!34267)))

(declare-fun b!1290514 () Bool)

(declare-fun e!736750 () Bool)

(declare-fun e!736754 () Bool)

(declare-fun mapRes!52961 () Bool)

(assert (=> b!1290514 (= e!736750 (and e!736754 mapRes!52961))))

(declare-fun condMapEmpty!52961 () Bool)

(declare-fun mapDefault!52961 () ValueCell!16235)

(assert (=> b!1290514 (= condMapEmpty!52961 (= (arr!41234 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16235)) mapDefault!52961)))))

(declare-fun mapIsEmpty!52961 () Bool)

(assert (=> mapIsEmpty!52961 mapRes!52961))

(declare-fun b!1290515 () Bool)

(assert (=> b!1290515 (= e!736754 tp_is_empty!34267)))

(declare-fun b!1290516 () Bool)

(declare-fun res!857343 () Bool)

(assert (=> b!1290516 (=> (not res!857343) (not e!736752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85463 (_ BitVec 32)) Bool)

(assert (=> b!1290516 (= res!857343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!857339 () Bool)

(assert (=> start!109138 (=> (not res!857339) (not e!736752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109138 (= res!857339 (validMask!0 mask!2175))))

(assert (=> start!109138 e!736752))

(assert (=> start!109138 tp_is_empty!34267))

(assert (=> start!109138 true))

(declare-fun array_inv!31415 (array!85465) Bool)

(assert (=> start!109138 (and (array_inv!31415 _values!1445) e!736750)))

(declare-fun array_inv!31416 (array!85463) Bool)

(assert (=> start!109138 (array_inv!31416 _keys!1741)))

(assert (=> start!109138 tp!101000))

(declare-fun mapNonEmpty!52961 () Bool)

(declare-fun tp!101001 () Bool)

(assert (=> mapNonEmpty!52961 (= mapRes!52961 (and tp!101001 e!736751))))

(declare-fun mapRest!52961 () (Array (_ BitVec 32) ValueCell!16235))

(declare-fun mapKey!52961 () (_ BitVec 32))

(declare-fun mapValue!52961 () ValueCell!16235)

(assert (=> mapNonEmpty!52961 (= (arr!41234 _values!1445) (store mapRest!52961 mapKey!52961 mapValue!52961))))

(assert (= (and start!109138 res!857339) b!1290509))

(assert (= (and b!1290509 res!857338) b!1290516))

(assert (= (and b!1290516 res!857343) b!1290511))

(assert (= (and b!1290511 res!857346) b!1290507))

(assert (= (and b!1290507 res!857341) b!1290506))

(assert (= (and b!1290506 res!857344) b!1290508))

(assert (= (and b!1290508 res!857342) b!1290505))

(assert (= (and b!1290505 res!857340) b!1290510))

(assert (= (and b!1290510 (not res!857345)) b!1290512))

(assert (= (and b!1290514 condMapEmpty!52961) mapIsEmpty!52961))

(assert (= (and b!1290514 (not condMapEmpty!52961)) mapNonEmpty!52961))

(get-info :version)

(assert (= (and mapNonEmpty!52961 ((_ is ValueCellFull!16235) mapValue!52961)) b!1290513))

(assert (= (and b!1290514 ((_ is ValueCellFull!16235) mapDefault!52961)) b!1290515))

(assert (= start!109138 b!1290514))

(declare-fun m!1182675 () Bool)

(assert (=> mapNonEmpty!52961 m!1182675))

(declare-fun m!1182677 () Bool)

(assert (=> b!1290512 m!1182677))

(declare-fun m!1182679 () Bool)

(assert (=> b!1290512 m!1182679))

(declare-fun m!1182681 () Bool)

(assert (=> b!1290512 m!1182681))

(declare-fun m!1182683 () Bool)

(assert (=> b!1290512 m!1182683))

(declare-fun m!1182685 () Bool)

(assert (=> b!1290512 m!1182685))

(declare-fun m!1182687 () Bool)

(assert (=> b!1290512 m!1182687))

(declare-fun m!1182689 () Bool)

(assert (=> b!1290512 m!1182689))

(assert (=> b!1290512 m!1182687))

(declare-fun m!1182691 () Bool)

(assert (=> b!1290512 m!1182691))

(declare-fun m!1182693 () Bool)

(assert (=> b!1290506 m!1182693))

(assert (=> b!1290506 m!1182693))

(declare-fun m!1182695 () Bool)

(assert (=> b!1290506 m!1182695))

(declare-fun m!1182697 () Bool)

(assert (=> start!109138 m!1182697))

(declare-fun m!1182699 () Bool)

(assert (=> start!109138 m!1182699))

(declare-fun m!1182701 () Bool)

(assert (=> start!109138 m!1182701))

(declare-fun m!1182703 () Bool)

(assert (=> b!1290510 m!1182703))

(declare-fun m!1182705 () Bool)

(assert (=> b!1290510 m!1182705))

(declare-fun m!1182707 () Bool)

(assert (=> b!1290511 m!1182707))

(declare-fun m!1182709 () Bool)

(assert (=> b!1290516 m!1182709))

(declare-fun m!1182711 () Bool)

(assert (=> b!1290505 m!1182711))

(assert (=> b!1290505 m!1182711))

(declare-fun m!1182713 () Bool)

(assert (=> b!1290505 m!1182713))

(check-sat (not b!1290511) tp_is_empty!34267 (not start!109138) (not b!1290505) (not b_next!28627) (not b!1290512) b_and!46699 (not b!1290506) (not b!1290510) (not b!1290516) (not mapNonEmpty!52961))
(check-sat b_and!46699 (not b_next!28627))
