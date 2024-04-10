; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109092 () Bool)

(assert start!109092)

(declare-fun b_free!28581 () Bool)

(declare-fun b_next!28581 () Bool)

(assert (=> start!109092 (= b_free!28581 (not b_next!28581))))

(declare-fun tp!100861 () Bool)

(declare-fun b_and!46671 () Bool)

(assert (=> start!109092 (= tp!100861 b_and!46671)))

(declare-fun b!1289741 () Bool)

(declare-fun e!736368 () Bool)

(assert (=> b!1289741 (= e!736368 true)))

(declare-datatypes ((V!50731 0))(
  ( (V!50732 (val!17185 Int)) )
))
(declare-datatypes ((tuple2!22074 0))(
  ( (tuple2!22075 (_1!11048 (_ BitVec 64)) (_2!11048 V!50731)) )
))
(declare-datatypes ((List!29243 0))(
  ( (Nil!29240) (Cons!29239 (h!30448 tuple2!22074) (t!42807 List!29243)) )
))
(declare-datatypes ((ListLongMap!19731 0))(
  ( (ListLongMap!19732 (toList!9881 List!29243)) )
))
(declare-fun lt!578360 () ListLongMap!19731)

(declare-fun minValue!1387 () V!50731)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7999 (ListLongMap!19731 (_ BitVec 64)) Bool)

(declare-fun +!4353 (ListLongMap!19731 tuple2!22074) ListLongMap!19731)

(assert (=> b!1289741 (not (contains!7999 (+!4353 lt!578360 (tuple2!22075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42680 0))(
  ( (Unit!42681) )
))
(declare-fun lt!578357 () Unit!42680)

(declare-fun addStillNotContains!371 (ListLongMap!19731 (_ BitVec 64) V!50731 (_ BitVec 64)) Unit!42680)

(assert (=> b!1289741 (= lt!578357 (addStillNotContains!371 lt!578360 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!50731)

(assert (=> b!1289741 (not (contains!7999 (+!4353 lt!578360 (tuple2!22075 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578358 () Unit!42680)

(assert (=> b!1289741 (= lt!578358 (addStillNotContains!371 lt!578360 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16212 0))(
  ( (ValueCellFull!16212 (v!19788 V!50731)) (EmptyCell!16212) )
))
(declare-datatypes ((array!85484 0))(
  ( (array!85485 (arr!41243 (Array (_ BitVec 32) ValueCell!16212)) (size!41793 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85484)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85486 0))(
  ( (array!85487 (arr!41244 (Array (_ BitVec 32) (_ BitVec 64))) (size!41794 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85486)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5984 (array!85486 array!85484 (_ BitVec 32) (_ BitVec 32) V!50731 V!50731 (_ BitVec 32) Int) ListLongMap!19731)

(assert (=> b!1289741 (= lt!578360 (getCurrentListMapNoExtraKeys!5984 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289742 () Bool)

(declare-fun res!856750 () Bool)

(declare-fun e!736370 () Bool)

(assert (=> b!1289742 (=> (not res!856750) (not e!736370))))

(declare-fun getCurrentListMap!4941 (array!85486 array!85484 (_ BitVec 32) (_ BitVec 32) V!50731 V!50731 (_ BitVec 32) Int) ListLongMap!19731)

(assert (=> b!1289742 (= res!856750 (contains!7999 (getCurrentListMap!4941 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289743 () Bool)

(declare-fun res!856744 () Bool)

(assert (=> b!1289743 (=> (not res!856744) (not e!736370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85486 (_ BitVec 32)) Bool)

(assert (=> b!1289743 (= res!856744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289744 () Bool)

(declare-fun res!856749 () Bool)

(assert (=> b!1289744 (=> (not res!856749) (not e!736370))))

(declare-datatypes ((List!29244 0))(
  ( (Nil!29241) (Cons!29240 (h!30449 (_ BitVec 64)) (t!42808 List!29244)) )
))
(declare-fun arrayNoDuplicates!0 (array!85486 (_ BitVec 32) List!29244) Bool)

(assert (=> b!1289744 (= res!856749 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29241))))

(declare-fun b!1289745 () Bool)

(declare-fun e!736369 () Bool)

(declare-fun tp_is_empty!34221 () Bool)

(assert (=> b!1289745 (= e!736369 tp_is_empty!34221)))

(declare-fun b!1289746 () Bool)

(declare-fun res!856752 () Bool)

(assert (=> b!1289746 (=> (not res!856752) (not e!736370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289746 (= res!856752 (not (validKeyInArray!0 (select (arr!41244 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!52892 () Bool)

(declare-fun mapRes!52892 () Bool)

(assert (=> mapIsEmpty!52892 mapRes!52892))

(declare-fun b!1289747 () Bool)

(declare-fun e!736365 () Bool)

(assert (=> b!1289747 (= e!736365 tp_is_empty!34221)))

(declare-fun b!1289748 () Bool)

(declare-fun res!856751 () Bool)

(assert (=> b!1289748 (=> (not res!856751) (not e!736370))))

(assert (=> b!1289748 (= res!856751 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41794 _keys!1741))))))

(declare-fun b!1289749 () Bool)

(declare-fun e!736366 () Bool)

(assert (=> b!1289749 (= e!736366 (and e!736369 mapRes!52892))))

(declare-fun condMapEmpty!52892 () Bool)

(declare-fun mapDefault!52892 () ValueCell!16212)

(assert (=> b!1289749 (= condMapEmpty!52892 (= (arr!41243 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16212)) mapDefault!52892)))))

(declare-fun b!1289750 () Bool)

(declare-fun res!856748 () Bool)

(assert (=> b!1289750 (=> (not res!856748) (not e!736370))))

(assert (=> b!1289750 (= res!856748 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41794 _keys!1741))))))

(declare-fun res!856746 () Bool)

(assert (=> start!109092 (=> (not res!856746) (not e!736370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109092 (= res!856746 (validMask!0 mask!2175))))

(assert (=> start!109092 e!736370))

(assert (=> start!109092 tp_is_empty!34221))

(assert (=> start!109092 true))

(declare-fun array_inv!31261 (array!85484) Bool)

(assert (=> start!109092 (and (array_inv!31261 _values!1445) e!736366)))

(declare-fun array_inv!31262 (array!85486) Bool)

(assert (=> start!109092 (array_inv!31262 _keys!1741)))

(assert (=> start!109092 tp!100861))

(declare-fun mapNonEmpty!52892 () Bool)

(declare-fun tp!100862 () Bool)

(assert (=> mapNonEmpty!52892 (= mapRes!52892 (and tp!100862 e!736365))))

(declare-fun mapValue!52892 () ValueCell!16212)

(declare-fun mapKey!52892 () (_ BitVec 32))

(declare-fun mapRest!52892 () (Array (_ BitVec 32) ValueCell!16212))

(assert (=> mapNonEmpty!52892 (= (arr!41243 _values!1445) (store mapRest!52892 mapKey!52892 mapValue!52892))))

(declare-fun b!1289751 () Bool)

(assert (=> b!1289751 (= e!736370 (not e!736368))))

(declare-fun res!856747 () Bool)

(assert (=> b!1289751 (=> res!856747 e!736368)))

(assert (=> b!1289751 (= res!856747 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289751 (not (contains!7999 (ListLongMap!19732 Nil!29240) k0!1205))))

(declare-fun lt!578359 () Unit!42680)

(declare-fun emptyContainsNothing!68 ((_ BitVec 64)) Unit!42680)

(assert (=> b!1289751 (= lt!578359 (emptyContainsNothing!68 k0!1205))))

(declare-fun b!1289752 () Bool)

(declare-fun res!856745 () Bool)

(assert (=> b!1289752 (=> (not res!856745) (not e!736370))))

(assert (=> b!1289752 (= res!856745 (and (= (size!41793 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41794 _keys!1741) (size!41793 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109092 res!856746) b!1289752))

(assert (= (and b!1289752 res!856745) b!1289743))

(assert (= (and b!1289743 res!856744) b!1289744))

(assert (= (and b!1289744 res!856749) b!1289748))

(assert (= (and b!1289748 res!856751) b!1289742))

(assert (= (and b!1289742 res!856750) b!1289750))

(assert (= (and b!1289750 res!856748) b!1289746))

(assert (= (and b!1289746 res!856752) b!1289751))

(assert (= (and b!1289751 (not res!856747)) b!1289741))

(assert (= (and b!1289749 condMapEmpty!52892) mapIsEmpty!52892))

(assert (= (and b!1289749 (not condMapEmpty!52892)) mapNonEmpty!52892))

(get-info :version)

(assert (= (and mapNonEmpty!52892 ((_ is ValueCellFull!16212) mapValue!52892)) b!1289747))

(assert (= (and b!1289749 ((_ is ValueCellFull!16212) mapDefault!52892)) b!1289745))

(assert (= start!109092 b!1289749))

(declare-fun m!1182277 () Bool)

(assert (=> b!1289751 m!1182277))

(declare-fun m!1182279 () Bool)

(assert (=> b!1289751 m!1182279))

(declare-fun m!1182281 () Bool)

(assert (=> b!1289746 m!1182281))

(assert (=> b!1289746 m!1182281))

(declare-fun m!1182283 () Bool)

(assert (=> b!1289746 m!1182283))

(declare-fun m!1182285 () Bool)

(assert (=> start!109092 m!1182285))

(declare-fun m!1182287 () Bool)

(assert (=> start!109092 m!1182287))

(declare-fun m!1182289 () Bool)

(assert (=> start!109092 m!1182289))

(declare-fun m!1182291 () Bool)

(assert (=> b!1289744 m!1182291))

(declare-fun m!1182293 () Bool)

(assert (=> b!1289741 m!1182293))

(declare-fun m!1182295 () Bool)

(assert (=> b!1289741 m!1182295))

(declare-fun m!1182297 () Bool)

(assert (=> b!1289741 m!1182297))

(declare-fun m!1182299 () Bool)

(assert (=> b!1289741 m!1182299))

(declare-fun m!1182301 () Bool)

(assert (=> b!1289741 m!1182301))

(assert (=> b!1289741 m!1182299))

(declare-fun m!1182303 () Bool)

(assert (=> b!1289741 m!1182303))

(assert (=> b!1289741 m!1182297))

(declare-fun m!1182305 () Bool)

(assert (=> b!1289741 m!1182305))

(declare-fun m!1182307 () Bool)

(assert (=> mapNonEmpty!52892 m!1182307))

(declare-fun m!1182309 () Bool)

(assert (=> b!1289742 m!1182309))

(assert (=> b!1289742 m!1182309))

(declare-fun m!1182311 () Bool)

(assert (=> b!1289742 m!1182311))

(declare-fun m!1182313 () Bool)

(assert (=> b!1289743 m!1182313))

(check-sat b_and!46671 (not mapNonEmpty!52892) (not b!1289743) (not b!1289751) (not b_next!28581) (not b!1289742) tp_is_empty!34221 (not b!1289746) (not b!1289744) (not b!1289741) (not start!109092))
(check-sat b_and!46671 (not b_next!28581))
