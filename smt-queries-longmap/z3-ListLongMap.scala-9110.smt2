; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109668 () Bool)

(assert start!109668)

(declare-fun b_free!28933 () Bool)

(declare-fun b_next!28933 () Bool)

(assert (=> start!109668 (= b_free!28933 (not b_next!28933))))

(declare-fun tp!101917 () Bool)

(declare-fun b_and!47025 () Bool)

(assert (=> start!109668 (= tp!101917 b_and!47025)))

(declare-fun res!861854 () Bool)

(declare-fun e!740218 () Bool)

(assert (=> start!109668 (=> (not res!861854) (not e!740218))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109668 (= res!861854 (validMask!0 mask!2175))))

(assert (=> start!109668 e!740218))

(declare-fun tp_is_empty!34573 () Bool)

(assert (=> start!109668 tp_is_empty!34573))

(assert (=> start!109668 true))

(declare-datatypes ((V!51201 0))(
  ( (V!51202 (val!17361 Int)) )
))
(declare-datatypes ((ValueCell!16388 0))(
  ( (ValueCellFull!16388 (v!19959 V!51201)) (EmptyCell!16388) )
))
(declare-datatypes ((array!86199 0))(
  ( (array!86200 (arr!41596 (Array (_ BitVec 32) ValueCell!16388)) (size!42147 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86199)

(declare-fun e!740223 () Bool)

(declare-fun array_inv!31723 (array!86199) Bool)

(assert (=> start!109668 (and (array_inv!31723 _values!1445) e!740223)))

(declare-datatypes ((array!86201 0))(
  ( (array!86202 (arr!41597 (Array (_ BitVec 32) (_ BitVec 64))) (size!42148 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86201)

(declare-fun array_inv!31724 (array!86201) Bool)

(assert (=> start!109668 (array_inv!31724 _keys!1741)))

(assert (=> start!109668 tp!101917))

(declare-fun b!1297220 () Bool)

(declare-fun e!740222 () Bool)

(assert (=> b!1297220 (= e!740222 tp_is_empty!34573)))

(declare-fun b!1297221 () Bool)

(declare-fun e!740220 () Bool)

(assert (=> b!1297221 (= e!740218 (not e!740220))))

(declare-fun res!861856 () Bool)

(assert (=> b!1297221 (=> res!861856 e!740220)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297221 (= res!861856 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22364 0))(
  ( (tuple2!22365 (_1!11193 (_ BitVec 64)) (_2!11193 V!51201)) )
))
(declare-datatypes ((List!29531 0))(
  ( (Nil!29528) (Cons!29527 (h!30745 tuple2!22364) (t!43087 List!29531)) )
))
(declare-datatypes ((ListLongMap!20029 0))(
  ( (ListLongMap!20030 (toList!10030 List!29531)) )
))
(declare-fun contains!8161 (ListLongMap!20029 (_ BitVec 64)) Bool)

(assert (=> b!1297221 (not (contains!8161 (ListLongMap!20030 Nil!29528) k0!1205))))

(declare-datatypes ((Unit!42891 0))(
  ( (Unit!42892) )
))
(declare-fun lt!580503 () Unit!42891)

(declare-fun emptyContainsNothing!186 ((_ BitVec 64)) Unit!42891)

(assert (=> b!1297221 (= lt!580503 (emptyContainsNothing!186 k0!1205))))

(declare-fun b!1297222 () Bool)

(declare-fun res!861857 () Bool)

(assert (=> b!1297222 (=> (not res!861857) (not e!740218))))

(assert (=> b!1297222 (= res!861857 (and (= (size!42147 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42148 _keys!1741) (size!42147 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297223 () Bool)

(declare-fun res!861858 () Bool)

(assert (=> b!1297223 (=> (not res!861858) (not e!740218))))

(declare-fun minValue!1387 () V!51201)

(declare-fun zeroValue!1387 () V!51201)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5051 (array!86201 array!86199 (_ BitVec 32) (_ BitVec 32) V!51201 V!51201 (_ BitVec 32) Int) ListLongMap!20029)

(assert (=> b!1297223 (= res!861858 (contains!8161 (getCurrentListMap!5051 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53420 () Bool)

(declare-fun mapRes!53420 () Bool)

(assert (=> mapIsEmpty!53420 mapRes!53420))

(declare-fun b!1297224 () Bool)

(declare-fun res!861860 () Bool)

(assert (=> b!1297224 (=> (not res!861860) (not e!740218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1297224 (= res!861860 (not (validKeyInArray!0 (select (arr!41597 _keys!1741) from!2144))))))

(declare-fun b!1297225 () Bool)

(declare-fun res!861862 () Bool)

(assert (=> b!1297225 (=> (not res!861862) (not e!740218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86201 (_ BitVec 32)) Bool)

(assert (=> b!1297225 (= res!861862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297226 () Bool)

(assert (=> b!1297226 (= e!740220 true)))

(declare-fun lt!580501 () ListLongMap!20029)

(declare-fun +!4474 (ListLongMap!20029 tuple2!22364) ListLongMap!20029)

(assert (=> b!1297226 (not (contains!8161 (+!4474 lt!580501 (tuple2!22365 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!580502 () Unit!42891)

(declare-fun addStillNotContains!450 (ListLongMap!20029 (_ BitVec 64) V!51201 (_ BitVec 64)) Unit!42891)

(assert (=> b!1297226 (= lt!580502 (addStillNotContains!450 lt!580501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6116 (array!86201 array!86199 (_ BitVec 32) (_ BitVec 32) V!51201 V!51201 (_ BitVec 32) Int) ListLongMap!20029)

(assert (=> b!1297226 (= lt!580501 (getCurrentListMapNoExtraKeys!6116 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1297227 () Bool)

(declare-fun res!861859 () Bool)

(assert (=> b!1297227 (=> (not res!861859) (not e!740218))))

(assert (=> b!1297227 (= res!861859 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42148 _keys!1741))))))

(declare-fun b!1297228 () Bool)

(declare-fun e!740221 () Bool)

(assert (=> b!1297228 (= e!740221 tp_is_empty!34573)))

(declare-fun b!1297229 () Bool)

(declare-fun res!861861 () Bool)

(assert (=> b!1297229 (=> (not res!861861) (not e!740218))))

(declare-datatypes ((List!29532 0))(
  ( (Nil!29529) (Cons!29528 (h!30746 (_ BitVec 64)) (t!43088 List!29532)) )
))
(declare-fun arrayNoDuplicates!0 (array!86201 (_ BitVec 32) List!29532) Bool)

(assert (=> b!1297229 (= res!861861 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29529))))

(declare-fun mapNonEmpty!53420 () Bool)

(declare-fun tp!101918 () Bool)

(assert (=> mapNonEmpty!53420 (= mapRes!53420 (and tp!101918 e!740221))))

(declare-fun mapValue!53420 () ValueCell!16388)

(declare-fun mapKey!53420 () (_ BitVec 32))

(declare-fun mapRest!53420 () (Array (_ BitVec 32) ValueCell!16388))

(assert (=> mapNonEmpty!53420 (= (arr!41596 _values!1445) (store mapRest!53420 mapKey!53420 mapValue!53420))))

(declare-fun b!1297230 () Bool)

(declare-fun res!861855 () Bool)

(assert (=> b!1297230 (=> (not res!861855) (not e!740218))))

(assert (=> b!1297230 (= res!861855 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42148 _keys!1741))))))

(declare-fun b!1297231 () Bool)

(assert (=> b!1297231 (= e!740223 (and e!740222 mapRes!53420))))

(declare-fun condMapEmpty!53420 () Bool)

(declare-fun mapDefault!53420 () ValueCell!16388)

(assert (=> b!1297231 (= condMapEmpty!53420 (= (arr!41596 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16388)) mapDefault!53420)))))

(assert (= (and start!109668 res!861854) b!1297222))

(assert (= (and b!1297222 res!861857) b!1297225))

(assert (= (and b!1297225 res!861862) b!1297229))

(assert (= (and b!1297229 res!861861) b!1297230))

(assert (= (and b!1297230 res!861855) b!1297223))

(assert (= (and b!1297223 res!861858) b!1297227))

(assert (= (and b!1297227 res!861859) b!1297224))

(assert (= (and b!1297224 res!861860) b!1297221))

(assert (= (and b!1297221 (not res!861856)) b!1297226))

(assert (= (and b!1297231 condMapEmpty!53420) mapIsEmpty!53420))

(assert (= (and b!1297231 (not condMapEmpty!53420)) mapNonEmpty!53420))

(get-info :version)

(assert (= (and mapNonEmpty!53420 ((_ is ValueCellFull!16388) mapValue!53420)) b!1297228))

(assert (= (and b!1297231 ((_ is ValueCellFull!16388) mapDefault!53420)) b!1297220))

(assert (= start!109668 b!1297231))

(declare-fun m!1189497 () Bool)

(assert (=> b!1297225 m!1189497))

(declare-fun m!1189499 () Bool)

(assert (=> b!1297229 m!1189499))

(declare-fun m!1189501 () Bool)

(assert (=> mapNonEmpty!53420 m!1189501))

(declare-fun m!1189503 () Bool)

(assert (=> start!109668 m!1189503))

(declare-fun m!1189505 () Bool)

(assert (=> start!109668 m!1189505))

(declare-fun m!1189507 () Bool)

(assert (=> start!109668 m!1189507))

(declare-fun m!1189509 () Bool)

(assert (=> b!1297221 m!1189509))

(declare-fun m!1189511 () Bool)

(assert (=> b!1297221 m!1189511))

(declare-fun m!1189513 () Bool)

(assert (=> b!1297223 m!1189513))

(assert (=> b!1297223 m!1189513))

(declare-fun m!1189515 () Bool)

(assert (=> b!1297223 m!1189515))

(declare-fun m!1189517 () Bool)

(assert (=> b!1297226 m!1189517))

(assert (=> b!1297226 m!1189517))

(declare-fun m!1189519 () Bool)

(assert (=> b!1297226 m!1189519))

(declare-fun m!1189521 () Bool)

(assert (=> b!1297226 m!1189521))

(declare-fun m!1189523 () Bool)

(assert (=> b!1297226 m!1189523))

(declare-fun m!1189525 () Bool)

(assert (=> b!1297224 m!1189525))

(assert (=> b!1297224 m!1189525))

(declare-fun m!1189527 () Bool)

(assert (=> b!1297224 m!1189527))

(check-sat tp_is_empty!34573 (not b!1297229) (not b!1297221) (not b_next!28933) (not b!1297223) (not start!109668) b_and!47025 (not mapNonEmpty!53420) (not b!1297226) (not b!1297224) (not b!1297225))
(check-sat b_and!47025 (not b_next!28933))
