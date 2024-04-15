; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109096 () Bool)

(assert start!109096)

(declare-fun b_free!28585 () Bool)

(declare-fun b_next!28585 () Bool)

(assert (=> start!109096 (= b_free!28585 (not b_next!28585))))

(declare-fun tp!100874 () Bool)

(declare-fun b_and!46657 () Bool)

(assert (=> start!109096 (= tp!100874 b_and!46657)))

(declare-fun mapIsEmpty!52898 () Bool)

(declare-fun mapRes!52898 () Bool)

(assert (=> mapIsEmpty!52898 mapRes!52898))

(declare-fun b!1289749 () Bool)

(declare-fun res!856775 () Bool)

(declare-fun e!736375 () Bool)

(assert (=> b!1289749 (=> (not res!856775) (not e!736375))))

(declare-datatypes ((array!85379 0))(
  ( (array!85380 (arr!41191 (Array (_ BitVec 32) (_ BitVec 64))) (size!41743 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85379)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289749 (= res!856775 (not (validKeyInArray!0 (select (arr!41191 _keys!1741) from!2144))))))

(declare-fun b!1289750 () Bool)

(declare-fun e!736376 () Bool)

(declare-fun tp_is_empty!34225 () Bool)

(assert (=> b!1289750 (= e!736376 tp_is_empty!34225)))

(declare-fun b!1289751 () Bool)

(declare-fun res!856772 () Bool)

(assert (=> b!1289751 (=> (not res!856772) (not e!736375))))

(assert (=> b!1289751 (= res!856772 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41743 _keys!1741))))))

(declare-fun b!1289752 () Bool)

(declare-fun res!856774 () Bool)

(assert (=> b!1289752 (=> (not res!856774) (not e!736375))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50737 0))(
  ( (V!50738 (val!17187 Int)) )
))
(declare-datatypes ((ValueCell!16214 0))(
  ( (ValueCellFull!16214 (v!19789 V!50737)) (EmptyCell!16214) )
))
(declare-datatypes ((array!85381 0))(
  ( (array!85382 (arr!41192 (Array (_ BitVec 32) ValueCell!16214)) (size!41744 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85381)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289752 (= res!856774 (and (= (size!41744 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41743 _keys!1741) (size!41744 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52898 () Bool)

(declare-fun tp!100875 () Bool)

(assert (=> mapNonEmpty!52898 (= mapRes!52898 (and tp!100875 e!736376))))

(declare-fun mapRest!52898 () (Array (_ BitVec 32) ValueCell!16214))

(declare-fun mapKey!52898 () (_ BitVec 32))

(declare-fun mapValue!52898 () ValueCell!16214)

(assert (=> mapNonEmpty!52898 (= (arr!41192 _values!1445) (store mapRest!52898 mapKey!52898 mapValue!52898))))

(declare-fun b!1289753 () Bool)

(declare-fun e!736377 () Bool)

(assert (=> b!1289753 (= e!736377 tp_is_empty!34225)))

(declare-fun res!856777 () Bool)

(assert (=> start!109096 (=> (not res!856777) (not e!736375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109096 (= res!856777 (validMask!0 mask!2175))))

(assert (=> start!109096 e!736375))

(assert (=> start!109096 tp_is_empty!34225))

(assert (=> start!109096 true))

(declare-fun e!736372 () Bool)

(declare-fun array_inv!31383 (array!85381) Bool)

(assert (=> start!109096 (and (array_inv!31383 _values!1445) e!736372)))

(declare-fun array_inv!31384 (array!85379) Bool)

(assert (=> start!109096 (array_inv!31384 _keys!1741)))

(assert (=> start!109096 tp!100874))

(declare-fun b!1289754 () Bool)

(declare-fun e!736374 () Bool)

(assert (=> b!1289754 (= e!736374 true)))

(declare-datatypes ((tuple2!22130 0))(
  ( (tuple2!22131 (_1!11076 (_ BitVec 64)) (_2!11076 V!50737)) )
))
(declare-datatypes ((List!29290 0))(
  ( (Nil!29287) (Cons!29286 (h!30495 tuple2!22130) (t!42846 List!29290)) )
))
(declare-datatypes ((ListLongMap!19787 0))(
  ( (ListLongMap!19788 (toList!9909 List!29290)) )
))
(declare-fun lt!578204 () ListLongMap!19787)

(declare-fun minValue!1387 () V!50737)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7957 (ListLongMap!19787 (_ BitVec 64)) Bool)

(declare-fun +!4389 (ListLongMap!19787 tuple2!22130) ListLongMap!19787)

(assert (=> b!1289754 (not (contains!7957 (+!4389 lt!578204 (tuple2!22131 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42516 0))(
  ( (Unit!42517) )
))
(declare-fun lt!578203 () Unit!42516)

(declare-fun addStillNotContains!366 (ListLongMap!19787 (_ BitVec 64) V!50737 (_ BitVec 64)) Unit!42516)

(assert (=> b!1289754 (= lt!578203 (addStillNotContains!366 lt!578204 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50737)

(assert (=> b!1289754 (not (contains!7957 (+!4389 lt!578204 (tuple2!22131 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578206 () Unit!42516)

(assert (=> b!1289754 (= lt!578206 (addStillNotContains!366 lt!578204 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6020 (array!85379 array!85381 (_ BitVec 32) (_ BitVec 32) V!50737 V!50737 (_ BitVec 32) Int) ListLongMap!19787)

(assert (=> b!1289754 (= lt!578204 (getCurrentListMapNoExtraKeys!6020 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289755 () Bool)

(declare-fun res!856773 () Bool)

(assert (=> b!1289755 (=> (not res!856773) (not e!736375))))

(assert (=> b!1289755 (= res!856773 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41743 _keys!1741))))))

(declare-fun b!1289756 () Bool)

(declare-fun res!856771 () Bool)

(assert (=> b!1289756 (=> (not res!856771) (not e!736375))))

(declare-datatypes ((List!29291 0))(
  ( (Nil!29288) (Cons!29287 (h!30496 (_ BitVec 64)) (t!42847 List!29291)) )
))
(declare-fun arrayNoDuplicates!0 (array!85379 (_ BitVec 32) List!29291) Bool)

(assert (=> b!1289756 (= res!856771 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29288))))

(declare-fun b!1289757 () Bool)

(declare-fun res!856776 () Bool)

(assert (=> b!1289757 (=> (not res!856776) (not e!736375))))

(declare-fun getCurrentListMap!4860 (array!85379 array!85381 (_ BitVec 32) (_ BitVec 32) V!50737 V!50737 (_ BitVec 32) Int) ListLongMap!19787)

(assert (=> b!1289757 (= res!856776 (contains!7957 (getCurrentListMap!4860 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289758 () Bool)

(assert (=> b!1289758 (= e!736375 (not e!736374))))

(declare-fun res!856778 () Bool)

(assert (=> b!1289758 (=> res!856778 e!736374)))

(assert (=> b!1289758 (= res!856778 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289758 (not (contains!7957 (ListLongMap!19788 Nil!29287) k0!1205))))

(declare-fun lt!578205 () Unit!42516)

(declare-fun emptyContainsNothing!59 ((_ BitVec 64)) Unit!42516)

(assert (=> b!1289758 (= lt!578205 (emptyContainsNothing!59 k0!1205))))

(declare-fun b!1289759 () Bool)

(declare-fun res!856779 () Bool)

(assert (=> b!1289759 (=> (not res!856779) (not e!736375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85379 (_ BitVec 32)) Bool)

(assert (=> b!1289759 (= res!856779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289760 () Bool)

(assert (=> b!1289760 (= e!736372 (and e!736377 mapRes!52898))))

(declare-fun condMapEmpty!52898 () Bool)

(declare-fun mapDefault!52898 () ValueCell!16214)

(assert (=> b!1289760 (= condMapEmpty!52898 (= (arr!41192 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16214)) mapDefault!52898)))))

(assert (= (and start!109096 res!856777) b!1289752))

(assert (= (and b!1289752 res!856774) b!1289759))

(assert (= (and b!1289759 res!856779) b!1289756))

(assert (= (and b!1289756 res!856771) b!1289751))

(assert (= (and b!1289751 res!856772) b!1289757))

(assert (= (and b!1289757 res!856776) b!1289755))

(assert (= (and b!1289755 res!856773) b!1289749))

(assert (= (and b!1289749 res!856775) b!1289758))

(assert (= (and b!1289758 (not res!856778)) b!1289754))

(assert (= (and b!1289760 condMapEmpty!52898) mapIsEmpty!52898))

(assert (= (and b!1289760 (not condMapEmpty!52898)) mapNonEmpty!52898))

(get-info :version)

(assert (= (and mapNonEmpty!52898 ((_ is ValueCellFull!16214) mapValue!52898)) b!1289750))

(assert (= (and b!1289760 ((_ is ValueCellFull!16214) mapDefault!52898)) b!1289753))

(assert (= start!109096 b!1289760))

(declare-fun m!1181853 () Bool)

(assert (=> mapNonEmpty!52898 m!1181853))

(declare-fun m!1181855 () Bool)

(assert (=> start!109096 m!1181855))

(declare-fun m!1181857 () Bool)

(assert (=> start!109096 m!1181857))

(declare-fun m!1181859 () Bool)

(assert (=> start!109096 m!1181859))

(declare-fun m!1181861 () Bool)

(assert (=> b!1289756 m!1181861))

(declare-fun m!1181863 () Bool)

(assert (=> b!1289749 m!1181863))

(assert (=> b!1289749 m!1181863))

(declare-fun m!1181865 () Bool)

(assert (=> b!1289749 m!1181865))

(declare-fun m!1181867 () Bool)

(assert (=> b!1289754 m!1181867))

(declare-fun m!1181869 () Bool)

(assert (=> b!1289754 m!1181869))

(declare-fun m!1181871 () Bool)

(assert (=> b!1289754 m!1181871))

(assert (=> b!1289754 m!1181869))

(declare-fun m!1181873 () Bool)

(assert (=> b!1289754 m!1181873))

(declare-fun m!1181875 () Bool)

(assert (=> b!1289754 m!1181875))

(declare-fun m!1181877 () Bool)

(assert (=> b!1289754 m!1181877))

(assert (=> b!1289754 m!1181871))

(declare-fun m!1181879 () Bool)

(assert (=> b!1289754 m!1181879))

(declare-fun m!1181881 () Bool)

(assert (=> b!1289757 m!1181881))

(assert (=> b!1289757 m!1181881))

(declare-fun m!1181883 () Bool)

(assert (=> b!1289757 m!1181883))

(declare-fun m!1181885 () Bool)

(assert (=> b!1289759 m!1181885))

(declare-fun m!1181887 () Bool)

(assert (=> b!1289758 m!1181887))

(declare-fun m!1181889 () Bool)

(assert (=> b!1289758 m!1181889))

(check-sat (not b!1289757) (not mapNonEmpty!52898) (not b!1289759) (not start!109096) (not b!1289756) (not b!1289749) (not b_next!28585) b_and!46657 (not b!1289754) tp_is_empty!34225 (not b!1289758))
(check-sat b_and!46657 (not b_next!28585))
