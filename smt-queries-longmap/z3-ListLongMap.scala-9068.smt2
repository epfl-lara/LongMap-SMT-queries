; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109194 () Bool)

(assert start!109194)

(declare-fun b_free!28683 () Bool)

(declare-fun b_next!28683 () Bool)

(assert (=> start!109194 (= b_free!28683 (not b_next!28683))))

(declare-fun tp!101168 () Bool)

(declare-fun b_and!46773 () Bool)

(assert (=> start!109194 (= tp!101168 b_and!46773)))

(declare-fun b!1291577 () Bool)

(declare-fun e!737284 () Bool)

(declare-fun e!737285 () Bool)

(assert (=> b!1291577 (= e!737284 (not e!737285))))

(declare-fun res!858124 () Bool)

(assert (=> b!1291577 (=> res!858124 e!737285)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291577 (= res!858124 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50867 0))(
  ( (V!50868 (val!17236 Int)) )
))
(declare-datatypes ((tuple2!22164 0))(
  ( (tuple2!22165 (_1!11093 (_ BitVec 64)) (_2!11093 V!50867)) )
))
(declare-datatypes ((List!29320 0))(
  ( (Nil!29317) (Cons!29316 (h!30525 tuple2!22164) (t!42884 List!29320)) )
))
(declare-datatypes ((ListLongMap!19821 0))(
  ( (ListLongMap!19822 (toList!9926 List!29320)) )
))
(declare-fun contains!8044 (ListLongMap!19821 (_ BitVec 64)) Bool)

(assert (=> b!1291577 (not (contains!8044 (ListLongMap!19822 Nil!29317) k0!1205))))

(declare-datatypes ((Unit!42762 0))(
  ( (Unit!42763) )
))
(declare-fun lt!579195 () Unit!42762)

(declare-fun emptyContainsNothing!103 ((_ BitVec 64)) Unit!42762)

(assert (=> b!1291577 (= lt!579195 (emptyContainsNothing!103 k0!1205))))

(declare-fun mapNonEmpty!53045 () Bool)

(declare-fun mapRes!53045 () Bool)

(declare-fun tp!101167 () Bool)

(declare-fun e!737287 () Bool)

(assert (=> mapNonEmpty!53045 (= mapRes!53045 (and tp!101167 e!737287))))

(declare-datatypes ((ValueCell!16263 0))(
  ( (ValueCellFull!16263 (v!19839 V!50867)) (EmptyCell!16263) )
))
(declare-fun mapValue!53045 () ValueCell!16263)

(declare-fun mapRest!53045 () (Array (_ BitVec 32) ValueCell!16263))

(declare-datatypes ((array!85682 0))(
  ( (array!85683 (arr!41342 (Array (_ BitVec 32) ValueCell!16263)) (size!41892 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85682)

(declare-fun mapKey!53045 () (_ BitVec 32))

(assert (=> mapNonEmpty!53045 (= (arr!41342 _values!1445) (store mapRest!53045 mapKey!53045 mapValue!53045))))

(declare-fun res!858125 () Bool)

(assert (=> start!109194 (=> (not res!858125) (not e!737284))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109194 (= res!858125 (validMask!0 mask!2175))))

(assert (=> start!109194 e!737284))

(declare-fun tp_is_empty!34323 () Bool)

(assert (=> start!109194 tp_is_empty!34323))

(assert (=> start!109194 true))

(declare-fun e!737288 () Bool)

(declare-fun array_inv!31327 (array!85682) Bool)

(assert (=> start!109194 (and (array_inv!31327 _values!1445) e!737288)))

(declare-datatypes ((array!85684 0))(
  ( (array!85685 (arr!41343 (Array (_ BitVec 32) (_ BitVec 64))) (size!41893 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85684)

(declare-fun array_inv!31328 (array!85684) Bool)

(assert (=> start!109194 (array_inv!31328 _keys!1741)))

(assert (=> start!109194 tp!101168))

(declare-fun b!1291578 () Bool)

(declare-fun res!858128 () Bool)

(assert (=> b!1291578 (=> (not res!858128) (not e!737284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85684 (_ BitVec 32)) Bool)

(assert (=> b!1291578 (= res!858128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291579 () Bool)

(declare-fun e!737286 () Bool)

(assert (=> b!1291579 (= e!737288 (and e!737286 mapRes!53045))))

(declare-fun condMapEmpty!53045 () Bool)

(declare-fun mapDefault!53045 () ValueCell!16263)

(assert (=> b!1291579 (= condMapEmpty!53045 (= (arr!41342 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16263)) mapDefault!53045)))))

(declare-fun b!1291580 () Bool)

(declare-fun res!858122 () Bool)

(assert (=> b!1291580 (=> (not res!858122) (not e!737284))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1291580 (= res!858122 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41893 _keys!1741))))))

(declare-fun b!1291581 () Bool)

(declare-fun res!858121 () Bool)

(assert (=> b!1291581 (=> (not res!858121) (not e!737284))))

(assert (=> b!1291581 (= res!858121 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41893 _keys!1741))))))

(declare-fun b!1291582 () Bool)

(declare-fun res!858127 () Bool)

(assert (=> b!1291582 (=> (not res!858127) (not e!737284))))

(declare-fun minValue!1387 () V!50867)

(declare-fun zeroValue!1387 () V!50867)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4976 (array!85684 array!85682 (_ BitVec 32) (_ BitVec 32) V!50867 V!50867 (_ BitVec 32) Int) ListLongMap!19821)

(assert (=> b!1291582 (= res!858127 (contains!8044 (getCurrentListMap!4976 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291583 () Bool)

(declare-fun res!858129 () Bool)

(assert (=> b!1291583 (=> (not res!858129) (not e!737284))))

(assert (=> b!1291583 (= res!858129 (and (= (size!41892 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41893 _keys!1741) (size!41892 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291584 () Bool)

(declare-fun res!858123 () Bool)

(assert (=> b!1291584 (=> (not res!858123) (not e!737284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291584 (= res!858123 (not (validKeyInArray!0 (select (arr!41343 _keys!1741) from!2144))))))

(declare-fun b!1291585 () Bool)

(assert (=> b!1291585 (= e!737287 tp_is_empty!34323)))

(declare-fun b!1291586 () Bool)

(assert (=> b!1291586 (= e!737286 tp_is_empty!34323)))

(declare-fun b!1291587 () Bool)

(assert (=> b!1291587 (= e!737285 true)))

(assert (=> b!1291587 false))

(declare-fun lt!579197 () ListLongMap!19821)

(declare-fun lt!579198 () Unit!42762)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!63 ((_ BitVec 64) (_ BitVec 64) V!50867 ListLongMap!19821) Unit!42762)

(assert (=> b!1291587 (= lt!579198 (lemmaInListMapAfterAddingDiffThenInBefore!63 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579197))))

(declare-fun lt!579196 () ListLongMap!19821)

(declare-fun +!4389 (ListLongMap!19821 tuple2!22164) ListLongMap!19821)

(assert (=> b!1291587 (not (contains!8044 (+!4389 lt!579196 (tuple2!22165 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579199 () Unit!42762)

(declare-fun addStillNotContains!407 (ListLongMap!19821 (_ BitVec 64) V!50867 (_ BitVec 64)) Unit!42762)

(assert (=> b!1291587 (= lt!579199 (addStillNotContains!407 lt!579196 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291587 (not (contains!8044 lt!579197 k0!1205))))

(assert (=> b!1291587 (= lt!579197 (+!4389 lt!579196 (tuple2!22165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579200 () Unit!42762)

(assert (=> b!1291587 (= lt!579200 (addStillNotContains!407 lt!579196 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6020 (array!85684 array!85682 (_ BitVec 32) (_ BitVec 32) V!50867 V!50867 (_ BitVec 32) Int) ListLongMap!19821)

(assert (=> b!1291587 (= lt!579196 (getCurrentListMapNoExtraKeys!6020 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291588 () Bool)

(declare-fun res!858126 () Bool)

(assert (=> b!1291588 (=> (not res!858126) (not e!737284))))

(declare-datatypes ((List!29321 0))(
  ( (Nil!29318) (Cons!29317 (h!30526 (_ BitVec 64)) (t!42885 List!29321)) )
))
(declare-fun arrayNoDuplicates!0 (array!85684 (_ BitVec 32) List!29321) Bool)

(assert (=> b!1291588 (= res!858126 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29318))))

(declare-fun mapIsEmpty!53045 () Bool)

(assert (=> mapIsEmpty!53045 mapRes!53045))

(assert (= (and start!109194 res!858125) b!1291583))

(assert (= (and b!1291583 res!858129) b!1291578))

(assert (= (and b!1291578 res!858128) b!1291588))

(assert (= (and b!1291588 res!858126) b!1291581))

(assert (= (and b!1291581 res!858121) b!1291582))

(assert (= (and b!1291582 res!858127) b!1291580))

(assert (= (and b!1291580 res!858122) b!1291584))

(assert (= (and b!1291584 res!858123) b!1291577))

(assert (= (and b!1291577 (not res!858124)) b!1291587))

(assert (= (and b!1291579 condMapEmpty!53045) mapIsEmpty!53045))

(assert (= (and b!1291579 (not condMapEmpty!53045)) mapNonEmpty!53045))

(get-info :version)

(assert (= (and mapNonEmpty!53045 ((_ is ValueCellFull!16263) mapValue!53045)) b!1291585))

(assert (= (and b!1291579 ((_ is ValueCellFull!16263) mapDefault!53045)) b!1291586))

(assert (= start!109194 b!1291579))

(declare-fun m!1184295 () Bool)

(assert (=> mapNonEmpty!53045 m!1184295))

(declare-fun m!1184297 () Bool)

(assert (=> b!1291584 m!1184297))

(assert (=> b!1291584 m!1184297))

(declare-fun m!1184299 () Bool)

(assert (=> b!1291584 m!1184299))

(declare-fun m!1184301 () Bool)

(assert (=> b!1291588 m!1184301))

(declare-fun m!1184303 () Bool)

(assert (=> b!1291587 m!1184303))

(declare-fun m!1184305 () Bool)

(assert (=> b!1291587 m!1184305))

(declare-fun m!1184307 () Bool)

(assert (=> b!1291587 m!1184307))

(declare-fun m!1184309 () Bool)

(assert (=> b!1291587 m!1184309))

(declare-fun m!1184311 () Bool)

(assert (=> b!1291587 m!1184311))

(assert (=> b!1291587 m!1184305))

(declare-fun m!1184313 () Bool)

(assert (=> b!1291587 m!1184313))

(declare-fun m!1184315 () Bool)

(assert (=> b!1291587 m!1184315))

(declare-fun m!1184317 () Bool)

(assert (=> b!1291587 m!1184317))

(declare-fun m!1184319 () Bool)

(assert (=> start!109194 m!1184319))

(declare-fun m!1184321 () Bool)

(assert (=> start!109194 m!1184321))

(declare-fun m!1184323 () Bool)

(assert (=> start!109194 m!1184323))

(declare-fun m!1184325 () Bool)

(assert (=> b!1291578 m!1184325))

(declare-fun m!1184327 () Bool)

(assert (=> b!1291577 m!1184327))

(declare-fun m!1184329 () Bool)

(assert (=> b!1291577 m!1184329))

(declare-fun m!1184331 () Bool)

(assert (=> b!1291582 m!1184331))

(assert (=> b!1291582 m!1184331))

(declare-fun m!1184333 () Bool)

(assert (=> b!1291582 m!1184333))

(check-sat (not b!1291584) (not start!109194) (not b!1291577) (not b!1291582) tp_is_empty!34323 (not b!1291578) (not b!1291587) (not b!1291588) b_and!46773 (not mapNonEmpty!53045) (not b_next!28683))
(check-sat b_and!46773 (not b_next!28683))
