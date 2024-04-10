; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109032 () Bool)

(assert start!109032)

(declare-fun b_free!28521 () Bool)

(declare-fun b_next!28521 () Bool)

(assert (=> start!109032 (= b_free!28521 (not b_next!28521))))

(declare-fun tp!100682 () Bool)

(declare-fun b_and!46611 () Bool)

(assert (=> start!109032 (= tp!100682 b_and!46611)))

(declare-fun b!1288661 () Bool)

(declare-fun res!855941 () Bool)

(declare-fun e!735830 () Bool)

(assert (=> b!1288661 (=> (not res!855941) (not e!735830))))

(declare-datatypes ((array!85366 0))(
  ( (array!85367 (arr!41184 (Array (_ BitVec 32) (_ BitVec 64))) (size!41734 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85366)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85366 (_ BitVec 32)) Bool)

(assert (=> b!1288661 (= res!855941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288662 () Bool)

(declare-fun res!855936 () Bool)

(assert (=> b!1288662 (=> (not res!855936) (not e!735830))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1288662 (= res!855936 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41734 _keys!1741))))))

(declare-fun b!1288663 () Bool)

(declare-fun res!855937 () Bool)

(assert (=> b!1288663 (=> (not res!855937) (not e!735830))))

(declare-datatypes ((V!50651 0))(
  ( (V!50652 (val!17155 Int)) )
))
(declare-datatypes ((ValueCell!16182 0))(
  ( (ValueCellFull!16182 (v!19758 V!50651)) (EmptyCell!16182) )
))
(declare-datatypes ((array!85368 0))(
  ( (array!85369 (arr!41185 (Array (_ BitVec 32) ValueCell!16182)) (size!41735 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85368)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288663 (= res!855937 (and (= (size!41735 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41734 _keys!1741) (size!41735 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288664 () Bool)

(declare-fun res!855942 () Bool)

(assert (=> b!1288664 (=> (not res!855942) (not e!735830))))

(declare-fun minValue!1387 () V!50651)

(declare-fun zeroValue!1387 () V!50651)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22024 0))(
  ( (tuple2!22025 (_1!11023 (_ BitVec 64)) (_2!11023 V!50651)) )
))
(declare-datatypes ((List!29198 0))(
  ( (Nil!29195) (Cons!29194 (h!30403 tuple2!22024) (t!42762 List!29198)) )
))
(declare-datatypes ((ListLongMap!19681 0))(
  ( (ListLongMap!19682 (toList!9856 List!29198)) )
))
(declare-fun contains!7974 (ListLongMap!19681 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4918 (array!85366 array!85368 (_ BitVec 32) (_ BitVec 32) V!50651 V!50651 (_ BitVec 32) Int) ListLongMap!19681)

(assert (=> b!1288664 (= res!855942 (contains!7974 (getCurrentListMap!4918 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288665 () Bool)

(declare-fun e!735827 () Bool)

(assert (=> b!1288665 (= e!735830 (not e!735827))))

(declare-fun res!855934 () Bool)

(assert (=> b!1288665 (=> res!855934 e!735827)))

(assert (=> b!1288665 (= res!855934 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288665 (not (contains!7974 (ListLongMap!19682 Nil!29195) k0!1205))))

(declare-datatypes ((Unit!42632 0))(
  ( (Unit!42633) )
))
(declare-fun lt!578048 () Unit!42632)

(declare-fun emptyContainsNothing!45 ((_ BitVec 64)) Unit!42632)

(assert (=> b!1288665 (= lt!578048 (emptyContainsNothing!45 k0!1205))))

(declare-fun b!1288666 () Bool)

(declare-fun res!855940 () Bool)

(assert (=> b!1288666 (=> (not res!855940) (not e!735830))))

(assert (=> b!1288666 (= res!855940 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41734 _keys!1741))))))

(declare-fun mapIsEmpty!52802 () Bool)

(declare-fun mapRes!52802 () Bool)

(assert (=> mapIsEmpty!52802 mapRes!52802))

(declare-fun res!855938 () Bool)

(assert (=> start!109032 (=> (not res!855938) (not e!735830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109032 (= res!855938 (validMask!0 mask!2175))))

(assert (=> start!109032 e!735830))

(declare-fun tp_is_empty!34161 () Bool)

(assert (=> start!109032 tp_is_empty!34161))

(assert (=> start!109032 true))

(declare-fun e!735825 () Bool)

(declare-fun array_inv!31225 (array!85368) Bool)

(assert (=> start!109032 (and (array_inv!31225 _values!1445) e!735825)))

(declare-fun array_inv!31226 (array!85366) Bool)

(assert (=> start!109032 (array_inv!31226 _keys!1741)))

(assert (=> start!109032 tp!100682))

(declare-fun b!1288667 () Bool)

(declare-fun e!735828 () Bool)

(assert (=> b!1288667 (= e!735825 (and e!735828 mapRes!52802))))

(declare-fun condMapEmpty!52802 () Bool)

(declare-fun mapDefault!52802 () ValueCell!16182)

(assert (=> b!1288667 (= condMapEmpty!52802 (= (arr!41185 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16182)) mapDefault!52802)))))

(declare-fun b!1288668 () Bool)

(assert (=> b!1288668 (= e!735828 tp_is_empty!34161)))

(declare-fun b!1288669 () Bool)

(declare-fun e!735829 () Bool)

(assert (=> b!1288669 (= e!735829 tp_is_empty!34161)))

(declare-fun b!1288670 () Bool)

(declare-fun res!855939 () Bool)

(assert (=> b!1288670 (=> (not res!855939) (not e!735830))))

(declare-datatypes ((List!29199 0))(
  ( (Nil!29196) (Cons!29195 (h!30404 (_ BitVec 64)) (t!42763 List!29199)) )
))
(declare-fun arrayNoDuplicates!0 (array!85366 (_ BitVec 32) List!29199) Bool)

(assert (=> b!1288670 (= res!855939 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29196))))

(declare-fun b!1288671 () Bool)

(declare-fun res!855935 () Bool)

(assert (=> b!1288671 (=> (not res!855935) (not e!735830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288671 (= res!855935 (not (validKeyInArray!0 (select (arr!41184 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!52802 () Bool)

(declare-fun tp!100681 () Bool)

(assert (=> mapNonEmpty!52802 (= mapRes!52802 (and tp!100681 e!735829))))

(declare-fun mapValue!52802 () ValueCell!16182)

(declare-fun mapRest!52802 () (Array (_ BitVec 32) ValueCell!16182))

(declare-fun mapKey!52802 () (_ BitVec 32))

(assert (=> mapNonEmpty!52802 (= (arr!41185 _values!1445) (store mapRest!52802 mapKey!52802 mapValue!52802))))

(declare-fun b!1288672 () Bool)

(assert (=> b!1288672 (= e!735827 true)))

(declare-fun lt!578047 () ListLongMap!19681)

(declare-fun +!4330 (ListLongMap!19681 tuple2!22024) ListLongMap!19681)

(assert (=> b!1288672 (not (contains!7974 (+!4330 lt!578047 (tuple2!22025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578046 () Unit!42632)

(declare-fun addStillNotContains!348 (ListLongMap!19681 (_ BitVec 64) V!50651 (_ BitVec 64)) Unit!42632)

(assert (=> b!1288672 (= lt!578046 (addStillNotContains!348 lt!578047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5961 (array!85366 array!85368 (_ BitVec 32) (_ BitVec 32) V!50651 V!50651 (_ BitVec 32) Int) ListLongMap!19681)

(assert (=> b!1288672 (= lt!578047 (getCurrentListMapNoExtraKeys!5961 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(assert (= (and start!109032 res!855938) b!1288663))

(assert (= (and b!1288663 res!855937) b!1288661))

(assert (= (and b!1288661 res!855941) b!1288670))

(assert (= (and b!1288670 res!855939) b!1288662))

(assert (= (and b!1288662 res!855936) b!1288664))

(assert (= (and b!1288664 res!855942) b!1288666))

(assert (= (and b!1288666 res!855940) b!1288671))

(assert (= (and b!1288671 res!855935) b!1288665))

(assert (= (and b!1288665 (not res!855934)) b!1288672))

(assert (= (and b!1288667 condMapEmpty!52802) mapIsEmpty!52802))

(assert (= (and b!1288667 (not condMapEmpty!52802)) mapNonEmpty!52802))

(get-info :version)

(assert (= (and mapNonEmpty!52802 ((_ is ValueCellFull!16182) mapValue!52802)) b!1288669))

(assert (= (and b!1288667 ((_ is ValueCellFull!16182) mapDefault!52802)) b!1288668))

(assert (= start!109032 b!1288667))

(declare-fun m!1181251 () Bool)

(assert (=> b!1288665 m!1181251))

(declare-fun m!1181253 () Bool)

(assert (=> b!1288665 m!1181253))

(declare-fun m!1181255 () Bool)

(assert (=> b!1288672 m!1181255))

(assert (=> b!1288672 m!1181255))

(declare-fun m!1181257 () Bool)

(assert (=> b!1288672 m!1181257))

(declare-fun m!1181259 () Bool)

(assert (=> b!1288672 m!1181259))

(declare-fun m!1181261 () Bool)

(assert (=> b!1288672 m!1181261))

(declare-fun m!1181263 () Bool)

(assert (=> b!1288670 m!1181263))

(declare-fun m!1181265 () Bool)

(assert (=> b!1288664 m!1181265))

(assert (=> b!1288664 m!1181265))

(declare-fun m!1181267 () Bool)

(assert (=> b!1288664 m!1181267))

(declare-fun m!1181269 () Bool)

(assert (=> mapNonEmpty!52802 m!1181269))

(declare-fun m!1181271 () Bool)

(assert (=> b!1288661 m!1181271))

(declare-fun m!1181273 () Bool)

(assert (=> b!1288671 m!1181273))

(assert (=> b!1288671 m!1181273))

(declare-fun m!1181275 () Bool)

(assert (=> b!1288671 m!1181275))

(declare-fun m!1181277 () Bool)

(assert (=> start!109032 m!1181277))

(declare-fun m!1181279 () Bool)

(assert (=> start!109032 m!1181279))

(declare-fun m!1181281 () Bool)

(assert (=> start!109032 m!1181281))

(check-sat (not b!1288670) (not mapNonEmpty!52802) (not b!1288664) (not b!1288665) (not b!1288661) (not b!1288671) b_and!46611 (not b!1288672) tp_is_empty!34161 (not start!109032) (not b_next!28521))
(check-sat b_and!46611 (not b_next!28521))
