; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109290 () Bool)

(assert start!109290)

(declare-fun b_free!28555 () Bool)

(declare-fun b_next!28555 () Bool)

(assert (=> start!109290 (= b_free!28555 (not b_next!28555))))

(declare-fun tp!100783 () Bool)

(declare-fun b_and!46647 () Bool)

(assert (=> start!109290 (= tp!100783 b_and!46647)))

(declare-fun b!1290578 () Bool)

(declare-fun res!856913 () Bool)

(declare-fun e!736979 () Bool)

(assert (=> b!1290578 (=> (not res!856913) (not e!736979))))

(declare-datatypes ((array!85469 0))(
  ( (array!85470 (arr!41231 (Array (_ BitVec 32) (_ BitVec 64))) (size!41782 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85469)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290578 (= res!856913 (not (validKeyInArray!0 (select (arr!41231 _keys!1741) from!2144))))))

(declare-fun b!1290579 () Bool)

(declare-fun e!736980 () Bool)

(assert (=> b!1290579 (= e!736979 (not e!736980))))

(declare-fun res!856920 () Bool)

(assert (=> b!1290579 (=> res!856920 e!736980)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290579 (= res!856920 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50697 0))(
  ( (V!50698 (val!17172 Int)) )
))
(declare-datatypes ((tuple2!22068 0))(
  ( (tuple2!22069 (_1!11045 (_ BitVec 64)) (_2!11045 V!50697)) )
))
(declare-datatypes ((List!29248 0))(
  ( (Nil!29245) (Cons!29244 (h!30462 tuple2!22068) (t!42804 List!29248)) )
))
(declare-datatypes ((ListLongMap!19733 0))(
  ( (ListLongMap!19734 (toList!9882 List!29248)) )
))
(declare-fun contains!8013 (ListLongMap!19733 (_ BitVec 64)) Bool)

(assert (=> b!1290579 (not (contains!8013 (ListLongMap!19734 Nil!29245) k0!1205))))

(declare-datatypes ((Unit!42613 0))(
  ( (Unit!42614) )
))
(declare-fun lt!578687 () Unit!42613)

(declare-fun emptyContainsNothing!58 ((_ BitVec 64)) Unit!42613)

(assert (=> b!1290579 (= lt!578687 (emptyContainsNothing!58 k0!1205))))

(declare-fun b!1290580 () Bool)

(declare-fun res!856921 () Bool)

(assert (=> b!1290580 (=> (not res!856921) (not e!736979))))

(declare-datatypes ((List!29249 0))(
  ( (Nil!29246) (Cons!29245 (h!30463 (_ BitVec 64)) (t!42805 List!29249)) )
))
(declare-fun arrayNoDuplicates!0 (array!85469 (_ BitVec 32) List!29249) Bool)

(assert (=> b!1290580 (= res!856921 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29246))))

(declare-fun mapNonEmpty!52853 () Bool)

(declare-fun mapRes!52853 () Bool)

(declare-fun tp!100784 () Bool)

(declare-fun e!736983 () Bool)

(assert (=> mapNonEmpty!52853 (= mapRes!52853 (and tp!100784 e!736983))))

(declare-datatypes ((ValueCell!16199 0))(
  ( (ValueCellFull!16199 (v!19770 V!50697)) (EmptyCell!16199) )
))
(declare-fun mapValue!52853 () ValueCell!16199)

(declare-fun mapKey!52853 () (_ BitVec 32))

(declare-datatypes ((array!85471 0))(
  ( (array!85472 (arr!41232 (Array (_ BitVec 32) ValueCell!16199)) (size!41783 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85471)

(declare-fun mapRest!52853 () (Array (_ BitVec 32) ValueCell!16199))

(assert (=> mapNonEmpty!52853 (= (arr!41232 _values!1445) (store mapRest!52853 mapKey!52853 mapValue!52853))))

(declare-fun b!1290581 () Bool)

(declare-fun e!736981 () Bool)

(declare-fun e!736982 () Bool)

(assert (=> b!1290581 (= e!736981 (and e!736982 mapRes!52853))))

(declare-fun condMapEmpty!52853 () Bool)

(declare-fun mapDefault!52853 () ValueCell!16199)

(assert (=> b!1290581 (= condMapEmpty!52853 (= (arr!41232 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16199)) mapDefault!52853)))))

(declare-fun mapIsEmpty!52853 () Bool)

(assert (=> mapIsEmpty!52853 mapRes!52853))

(declare-fun b!1290582 () Bool)

(declare-fun res!856914 () Bool)

(assert (=> b!1290582 (=> (not res!856914) (not e!736979))))

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1290582 (= res!856914 (and (= (size!41783 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41782 _keys!1741) (size!41783 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290583 () Bool)

(assert (=> b!1290583 (= e!736980 true)))

(declare-fun lt!578685 () Bool)

(declare-fun lt!578688 () ListLongMap!19733)

(assert (=> b!1290583 (= lt!578685 (contains!8013 lt!578688 k0!1205))))

(declare-fun zeroValue!1387 () V!50697)

(declare-fun +!4387 (ListLongMap!19733 tuple2!22068) ListLongMap!19733)

(assert (=> b!1290583 (not (contains!8013 (+!4387 lt!578688 (tuple2!22069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578686 () Unit!42613)

(declare-fun addStillNotContains!363 (ListLongMap!19733 (_ BitVec 64) V!50697 (_ BitVec 64)) Unit!42613)

(assert (=> b!1290583 (= lt!578686 (addStillNotContains!363 lt!578688 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50697)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6025 (array!85469 array!85471 (_ BitVec 32) (_ BitVec 32) V!50697 V!50697 (_ BitVec 32) Int) ListLongMap!19733)

(assert (=> b!1290583 (= lt!578688 (getCurrentListMapNoExtraKeys!6025 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290584 () Bool)

(declare-fun tp_is_empty!34195 () Bool)

(assert (=> b!1290584 (= e!736983 tp_is_empty!34195)))

(declare-fun b!1290585 () Bool)

(assert (=> b!1290585 (= e!736982 tp_is_empty!34195)))

(declare-fun b!1290586 () Bool)

(declare-fun res!856918 () Bool)

(assert (=> b!1290586 (=> (not res!856918) (not e!736979))))

(assert (=> b!1290586 (= res!856918 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41782 _keys!1741))))))

(declare-fun b!1290587 () Bool)

(declare-fun res!856916 () Bool)

(assert (=> b!1290587 (=> (not res!856916) (not e!736979))))

(declare-fun getCurrentListMap!4928 (array!85469 array!85471 (_ BitVec 32) (_ BitVec 32) V!50697 V!50697 (_ BitVec 32) Int) ListLongMap!19733)

(assert (=> b!1290587 (= res!856916 (contains!8013 (getCurrentListMap!4928 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!856917 () Bool)

(assert (=> start!109290 (=> (not res!856917) (not e!736979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109290 (= res!856917 (validMask!0 mask!2175))))

(assert (=> start!109290 e!736979))

(assert (=> start!109290 tp_is_empty!34195))

(assert (=> start!109290 true))

(declare-fun array_inv!31467 (array!85471) Bool)

(assert (=> start!109290 (and (array_inv!31467 _values!1445) e!736981)))

(declare-fun array_inv!31468 (array!85469) Bool)

(assert (=> start!109290 (array_inv!31468 _keys!1741)))

(assert (=> start!109290 tp!100783))

(declare-fun b!1290588 () Bool)

(declare-fun res!856919 () Bool)

(assert (=> b!1290588 (=> (not res!856919) (not e!736979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85469 (_ BitVec 32)) Bool)

(assert (=> b!1290588 (= res!856919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290589 () Bool)

(declare-fun res!856915 () Bool)

(assert (=> b!1290589 (=> (not res!856915) (not e!736979))))

(assert (=> b!1290589 (= res!856915 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41782 _keys!1741))))))

(assert (= (and start!109290 res!856917) b!1290582))

(assert (= (and b!1290582 res!856914) b!1290588))

(assert (= (and b!1290588 res!856919) b!1290580))

(assert (= (and b!1290580 res!856921) b!1290589))

(assert (= (and b!1290589 res!856915) b!1290587))

(assert (= (and b!1290587 res!856916) b!1290586))

(assert (= (and b!1290586 res!856918) b!1290578))

(assert (= (and b!1290578 res!856913) b!1290579))

(assert (= (and b!1290579 (not res!856920)) b!1290583))

(assert (= (and b!1290581 condMapEmpty!52853) mapIsEmpty!52853))

(assert (= (and b!1290581 (not condMapEmpty!52853)) mapNonEmpty!52853))

(get-info :version)

(assert (= (and mapNonEmpty!52853 ((_ is ValueCellFull!16199) mapValue!52853)) b!1290584))

(assert (= (and b!1290581 ((_ is ValueCellFull!16199) mapDefault!52853)) b!1290585))

(assert (= start!109290 b!1290581))

(declare-fun m!1183413 () Bool)

(assert (=> b!1290583 m!1183413))

(declare-fun m!1183415 () Bool)

(assert (=> b!1290583 m!1183415))

(declare-fun m!1183417 () Bool)

(assert (=> b!1290583 m!1183417))

(assert (=> b!1290583 m!1183413))

(declare-fun m!1183419 () Bool)

(assert (=> b!1290583 m!1183419))

(declare-fun m!1183421 () Bool)

(assert (=> b!1290583 m!1183421))

(declare-fun m!1183423 () Bool)

(assert (=> b!1290579 m!1183423))

(declare-fun m!1183425 () Bool)

(assert (=> b!1290579 m!1183425))

(declare-fun m!1183427 () Bool)

(assert (=> mapNonEmpty!52853 m!1183427))

(declare-fun m!1183429 () Bool)

(assert (=> start!109290 m!1183429))

(declare-fun m!1183431 () Bool)

(assert (=> start!109290 m!1183431))

(declare-fun m!1183433 () Bool)

(assert (=> start!109290 m!1183433))

(declare-fun m!1183435 () Bool)

(assert (=> b!1290580 m!1183435))

(declare-fun m!1183437 () Bool)

(assert (=> b!1290578 m!1183437))

(assert (=> b!1290578 m!1183437))

(declare-fun m!1183439 () Bool)

(assert (=> b!1290578 m!1183439))

(declare-fun m!1183441 () Bool)

(assert (=> b!1290587 m!1183441))

(assert (=> b!1290587 m!1183441))

(declare-fun m!1183443 () Bool)

(assert (=> b!1290587 m!1183443))

(declare-fun m!1183445 () Bool)

(assert (=> b!1290588 m!1183445))

(check-sat (not b!1290580) (not b!1290588) (not b!1290578) (not b!1290587) (not b!1290579) tp_is_empty!34195 (not mapNonEmpty!52853) (not start!109290) (not b_next!28555) (not b!1290583) b_and!46647)
(check-sat b_and!46647 (not b_next!28555))
